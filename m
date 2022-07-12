Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB4DFC43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 10:28:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.7577.1657621737689324852
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 Jul 2022 03:28:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B85D21596;
	Tue, 12 Jul 2022 03:28:57 -0700 (PDT)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A388E3F792;
	Tue, 12 Jul 2022 03:28:56 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	robbie.cao@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 6/6] arm/oeqa: Use linuxboot and OEFVPSerialTarget instead of
 noop
Date: Tue, 12 Jul 2022 11:28:30 +0100
Message-Id: <20220712102830.625090-7-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220712102830.625090-1-peter.hoyes@arm.com>
References: <20220712102830.625090-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 12 Jul 2022 10:28:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3560

From: Peter Hoyes <Peter.Hoyes@arm.com>

Create a new "linuxboot" test that uses the pexpect methods on
OEFVPSerialTarget to wait for a Linux login shell.

Switch to this test method for fvp-baser-aemv8r64, corstone500 and
corstone1000.

Issue-Id: SCM-4957
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: Idd749652ee72e244b7a3831dd2295e0bfaed3bfa
---
 .../conf/machine/corstone1000-fvp.conf         |  4 ++--
 meta-arm-bsp/conf/machine/corstone500.conf     |  4 ++--
 .../conf/machine/fvp-baser-aemv8r64.conf       |  4 ++--
 meta-arm/lib/fvp/runner.py                     |  4 +++-
 meta-arm/lib/oeqa/controllers/fvp.py           |  3 ++-
 meta-arm/lib/oeqa/runtime/cases/linuxboot.py   | 18 ++++++++++++++++++
 meta-arm/lib/oeqa/runtime/cases/noop.py        | 12 ------------
 7 files changed, 29 insertions(+), 20 deletions(-)
 create mode 100644 meta-arm/lib/oeqa/runtime/cases/linuxboot.py
 delete mode 100644 meta-arm/lib/oeqa/runtime/cases/noop.py

diff --git a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf b/meta-arm-b=
sp/conf/machine/corstone1000-fvp.conf
index eb122f3..e79373d 100644
--- a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
+++ b/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
@@ -8,8 +8,8 @@ TFA_TARGET_PLATFORM =3D "fvp"
 TFM_PLATFORM_IS_FVP =3D "TRUE"
=20
 # testimage config
-TEST_TARGET =3D "OEFVPTarget"
-TEST_SUITES =3D "noop"
+TEST_TARGET =3D "OEFVPSerialTarget"
+TEST_SUITES =3D "linuxboot"
=20
 # FVP Config
 FVP_PROVIDER ?=3D "fvp-corstone1000-native"
diff --git a/meta-arm-bsp/conf/machine/corstone500.conf b/meta-arm-bsp/co=
nf/machine/corstone500.conf
index 6a3b36e..1d25471 100644
--- a/meta-arm-bsp/conf/machine/corstone500.conf
+++ b/meta-arm-bsp/conf/machine/corstone500.conf
@@ -33,8 +33,8 @@ WKS_FILE_DEPENDS:append =3D " ${EXTRA_IMAGEDEPENDS}"
=20
 WKS_FILE ?=3D "core-image-minimal.corstone500.wks"
=20
-TEST_TARGET =3D "OEFVPTarget"
-TEST_SUITES =3D "noop"
+TEST_TARGET =3D "OEFVPSerialTarget"
+TEST_SUITES =3D "linuxboot"
=20
 FVP_PROVIDER ?=3D "fvp-corstone500-native"
 FVP_EXE ?=3D "FVP_Corstone-500"
diff --git a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf b/meta-arm=
-bsp/conf/machine/fvp-baser-aemv8r64.conf
index ee85cc6..9c80059 100644
--- a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
+++ b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
@@ -33,8 +33,8 @@ PACKAGECONFIG:remove:pn-openssh =3D "rng-tools"
 MACHINE_EXTRA_RRECOMMENDS +=3D "ssh-pregen-hostkeys"
=20
 # testimage configuration
-TEST_TARGET =3D "OEFVPTarget"
-TEST_SUITES =3D "ping ssh"
+TEST_TARGET =3D "OEFVPSerialTarget"
+TEST_SUITES =3D "linuxboot"
 TEST_TARGET_IP ?=3D "127.0.0.1:8022"
 TEST_SERVER_IP ?=3D "127.0.1.1"
=20
diff --git a/meta-arm/lib/fvp/runner.py b/meta-arm/lib/fvp/runner.py
index 74ebc02..3b3fd00 100644
--- a/meta-arm/lib/fvp/runner.py
+++ b/meta-arm/lib/fvp/runner.py
@@ -119,7 +119,9 @@ class FVPRunner:
         check_telnet()
         import pexpect
         port =3D await self._get_terminal_port(terminal, timeout)
-        return pexpect.spawn(f"telnet localhost {port}", **kwargs)
+        instance =3D pexpect.spawn(f"telnet localhost {port}", **kwargs)
+        self._pexpects.append(instance)
+        return instance
=20
     def pid(self):
         return self._fvp_process.pid
diff --git a/meta-arm/lib/oeqa/controllers/fvp.py b/meta-arm/lib/oeqa/con=
trollers/fvp.py
index ad01c11..30b6296 100644
--- a/meta-arm/lib/oeqa/controllers/fvp.py
+++ b/meta-arm/lib/oeqa/controllers/fvp.py
@@ -87,7 +87,8 @@ class OEFVPSerialTarget(OEFVPSSHTarget):
     This still depends on OEFVPSSHTarget so SSH commands can still be ru=
n on
     the target, but note that this class does not inherently guarantee t=
hat
     the SSH server is running prior to running test cases. Test cases th=
at use
-    SSH should first validate that SSH is available.
+    SSH should first validate that SSH is available, e.g. by depending o=
n the
+    "linuxboot" test case in meta-arm.
     """
     DEFAULT_CONSOLE =3D "default"
=20
diff --git a/meta-arm/lib/oeqa/runtime/cases/linuxboot.py b/meta-arm/lib/=
oeqa/runtime/cases/linuxboot.py
new file mode 100644
index 0000000..19e6e18
--- /dev/null
+++ b/meta-arm/lib/oeqa/runtime/cases/linuxboot.py
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: MIT
+
+from oeqa.runtime.case import OERuntimeTestCase
+
+
+class LinuxBootTest(OERuntimeTestCase):
+    """
+    This test case is only compatible with the OEFVPSerialTarget as it u=
ses
+    the pexpect interface. It waits for a Linux login prompt on the defa=
ult
+    console.
+    """
+
+    def setUp(self):
+        self.console =3D self.target.DEFAULT_CONSOLE
+
+    def test_linux_boot(self):
+        self.logger.info(f"{self.console}: Waiting for login prompt")
+        self.target.expect(self.console, "login\:", timeout=3D10*60)
diff --git a/meta-arm/lib/oeqa/runtime/cases/noop.py b/meta-arm/lib/oeqa/=
runtime/cases/noop.py
deleted file mode 100644
index b5fba7c..0000000
--- a/meta-arm/lib/oeqa/runtime/cases/noop.py
+++ /dev/null
@@ -1,12 +0,0 @@
-# SPDX-License-Identifier: MIT
-
-from oeqa.runtime.case import OERuntimeTestCase
-
-class NoopTest(OERuntimeTestCase):
-    """
-    This is a test case which does nothing.  Useful when you want to use
-    testimage to verify that an image boots, but you don't have networki=
ng so
-    none of the existing test cases are suitable.
-    """
-    def test_no_op(self):
-        return
--=20
2.25.1


