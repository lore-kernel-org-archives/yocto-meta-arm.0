Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 242E7C00140
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 14:48:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.7832.1659710900693294143
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 05 Aug 2022 07:48:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EFFB6106F;
	Fri,  5 Aug 2022 07:48:20 -0700 (PDT)
Received: from e125920.arm.com (unknown [10.57.84.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 880293F73B;
	Fri,  5 Aug 2022 07:48:19 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Diego.Sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 2/2] docs: Introduce meta-arm OEQA documentation
Date: Fri,  5 Aug 2022 15:47:56 +0100
Message-Id: <20220805144756.2492832-2-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220805144756.2492832-1-peter.hoyes@arm.com>
References: <20220805144756.2492832-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 05 Aug 2022 14:48:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3651

From: Peter Hoyes <Peter.Hoyes@arm.com>

Add documentation for how to use the OEQA framework to test targets in
meta-arm. Include instructions on using OEFVPTarget as well as the
OEFVPSerialTarget introduced by the recent refactor of runfvp.

Issue-Id: SCM-4954
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I146ec1c82214471fe9d18a999fd92efb38f652f9
---
 documentation/oeqa-fvp.md | 55 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 documentation/oeqa-fvp.md

diff --git a/documentation/oeqa-fvp.md b/documentation/oeqa-fvp.md
new file mode 100644
index 0000000..b53065a
--- /dev/null
+++ b/documentation/oeqa-fvp.md
@@ -0,0 +1,55 @@
+# OEQA on Arm FVPs
+
+OE-Core's [oeqa][OEQA] framework provides a method of performing runtime=
 tests on machines using the `testimage` Yocto task. meta-arm has good su=
pport for writing test cases against [Arm FVPs][FVP], meaning the [runfvp=
][RUNFVP] boot configuration can be re-used.
+
+Tests can be configured to run automatically post-build by setting the v=
ariable `TESTIMAGE_AUTO=3D"1"`, e.g. in your Kas file or local.conf.
+
+There are two main methods of testing, using different test "targets".
+
+## OEFVPTarget
+
+This runs test cases on a machine using SSH. It therefore requires that =
an SSH server is installed in the image.
+
+In test cases, the primary interface with the target is, e.g:
+```
+(status, output) =3D self.target.run('uname -a')
+```
+which runs a single command on the target (using `ssh -c`) and returns t=
he status code and the output. It is therefore useful for running tests i=
n a Linux environment.
+
+For examples of test cases, see meta/lib/oeqa/runtime/cases in OE-Core. =
The majority of test cases depend on `ssh.SSHTest.test_ssh`, which first =
validates that the SSH connection is functioning.
+
+Example machine configuration:
+```
+TEST_TARGET =3D "OEFVPTarget"
+TEST_SERVER_IP =3D "127.0.0.1"
+TEST_TARGET_IP =3D "127.0.0.1:8022"
+IMAGE_FEATURES:append =3D " ssh-server-dropbear"
+FVP_CONFIG[bp.virtio_net.hostbridge.userNetPorts] ?=3D "8022=3D22"
+```
+
+## OEFVPSerialTarget
+
+This runs tests against one or more serial consoles on the FVP. It is mo=
re flexible than OEFVPTarget, but test cases written for this test target=
 do not support the test cases in OE-core. As it does not require an SSH =
server, it is suitable for machines with performance or memory limitation=
s.
+
+Internally, this test target launches a [Pexpect][PEXPECT] instance for =
each entry in FVP_CONSOLES which can be used with the provided alias. The=
 whole Pexpect API is exposed on the target, where the alias is always pa=
ssed as the first argument, e.g.:
+```
+self.target.expect('default', r'root@.*\:~#', timeout=3D30)
+self.assertNotIn(b'ERROR:', self.target.before('tf-a'))
+```
+
+For an example of a full test case, see meta-arm/lib/oeqa/runtime/cases/=
linuxboot.py This test case can be used to minimally verify that a machin=
e boots to a Linux shell.
+
+The SSH interface described above is also available on OEFVPSerialTarget=
 to support writing a set of hybrid test suites that use a combination of=
 serial and SSH access. Note however that this test target does not guara=
ntee that Linux has booted to shell prior to running any tests, so the te=
st cases in OE-core are not supported.
+
+Example machine configuration:
+```
+TEST_TARGET=3D"OEFVPSerialTarget"
+TEST_SUITES=3D"linuxboot"
+FVP_CONSOLES[default] =3D "terminal_0"
+FVP_CONSOLES[tf-a] =3D "s_terminal_0"
+```
+
+[OEQA]: https://docs.yoctoproject.org/test-manual/intro.html
+[FVP]: https://developer.arm.com/tools-and-software/simulation-models/fi=
xed-virtual-platforms
+[RUNFVP]: runfvp.md
+[PEXPECT]: https://pexpect.readthedocs.io/en/stable/overview.html
--=20
2.25.1


