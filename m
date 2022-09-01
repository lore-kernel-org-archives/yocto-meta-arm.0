Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97593ECAAD1
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 09:56:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10285.1662026183486534333
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 01 Sep 2022 02:56:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91E5ED6E;
	Thu,  1 Sep 2022 02:56:28 -0700 (PDT)
Received: from e125920.arm.com (unknown [10.57.87.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2DAC13F7B4;
	Thu,  1 Sep 2022 02:56:21 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Diego.Sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH] arm/oeqa: Make linuxboot test case timeout configurable
Date: Thu,  1 Sep 2022 10:57:02 +0100
Message-Id: <20220901095702.3046618-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 01 Sep 2022 09:56:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3732

From: Peter Hoyes <Peter.Hoyes@arm.com>

In complex stacks, e.g. with many cores or many init scripts, the time
to Linux shell may be more than 10 minutes. Make the boot timeout
configurable using TEST_FVP_LINUX_BOOT_TIMEOUT, leaving the default
value at 10 minutes.

Issue-Id: SCM-4958
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: Ie074acd4b4509d0230d1f77a2a527d497bb295ce
---
 documentation/oeqa-fvp.md                    | 2 +-
 meta-arm/lib/oeqa/runtime/cases/linuxboot.py | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/documentation/oeqa-fvp.md b/documentation/oeqa-fvp.md
index b53065a0..582dd38b 100644
--- a/documentation/oeqa-fvp.md
+++ b/documentation/oeqa-fvp.md
@@ -37,7 +37,7 @@ self.target.expect('default', r'root@.*\:~#', timeout=3D=
30)
 self.assertNotIn(b'ERROR:', self.target.before('tf-a'))
 ```
=20
-For an example of a full test case, see meta-arm/lib/oeqa/runtime/cases/=
linuxboot.py This test case can be used to minimally verify that a machin=
e boots to a Linux shell.
+For an example of a full test case, see meta-arm/lib/oeqa/runtime/cases/=
linuxboot.py This test case can be used to minimally verify that a machin=
e boots to a Linux shell. The default timeout is 10 minutes, but this can=
 be configured with the variable TEST_FVP_LINUX_BOOT_TIMEOUT, which expec=
ts a value in seconds.
=20
 The SSH interface described above is also available on OEFVPSerialTarget=
 to support writing a set of hybrid test suites that use a combination of=
 serial and SSH access. Note however that this test target does not guara=
ntee that Linux has booted to shell prior to running any tests, so the te=
st cases in OE-core are not supported.
=20
diff --git a/meta-arm/lib/oeqa/runtime/cases/linuxboot.py b/meta-arm/lib/=
oeqa/runtime/cases/linuxboot.py
index 8994405e..99a8e78b 100644
--- a/meta-arm/lib/oeqa/runtime/cases/linuxboot.py
+++ b/meta-arm/lib/oeqa/runtime/cases/linuxboot.py
@@ -12,7 +12,8 @@ class LinuxBootTest(OERuntimeTestCase):
=20
     def setUp(self):
         self.console =3D self.target.DEFAULT_CONSOLE
+        self.timeout =3D int(self.td.get('TEST_FVP_LINUX_BOOT_TIMEOUT') =
or 10*60)
=20
     def test_linux_boot(self):
         self.logger.info(f"{self.console}: Waiting for login prompt")
-        self.target.expect(self.console, r"login\:", timeout=3D10*60)
+        self.target.expect(self.console, r"login\:", self.timeout)
--=20
2.25.1


