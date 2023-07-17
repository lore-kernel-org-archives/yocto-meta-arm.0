Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82131C0015E
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 18:57:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.3242.1689620219135449322
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 17 Jul 2023 11:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31E7CC15;
	Mon, 17 Jul 2023 11:57:42 -0700 (PDT)
Received: from e125920.arm.com (unknown [10.57.87.125])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0EF383F67D;
	Mon, 17 Jul 2023 11:56:57 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 4/5] arm/oeqa: Convert linuxboot test case into fvp_boot
Date: Mon, 17 Jul 2023 19:56:25 +0100
Message-Id: <20230717185626.1793017-4-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717185626.1793017-1-peter.hoyes@arm.com>
References: <20230717185626.1793017-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 17 Jul 2023 18:57:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4883

From: Peter Hoyes <Peter.Hoyes@arm.com>

The linuxboot test case is already FVP-specific due to the use of the
OEFVPTarget pexpect interface. Clarify this by renaming to fvp_boot.

So that fvp_boot can be used alongside other OEQA test cases (e.g. those
in OE-core):
 * Call self.target.transition("off") at the start of the test to
   ensure the model starts from reset
 * Call self.target.transition("linux") to reuse the "wait for boot"
   logic in OEFVPTarget.

Additionally, minimally validate the firmware boot by checking for
common error patterns in all console logs. Expose the runfvp config in
OEFVPTarget to support this.

Align the list of test cases executed on both fvp-base and
fvp-baser-aemv8r64 by using TEST_CASES:append =3D " fvp_boot" for both.

Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
---
 .../conf/machine/corstone1000-fvp.conf        |  2 +-
 meta-arm-bsp/conf/machine/corstone500.conf    |  2 +-
 .../conf/machine/fvp-baser-aemv8r64.conf      |  2 +-
 .../conf/machine/include/fvp-common.inc       |  1 +
 meta-arm-bsp/conf/machine/tc1.conf            |  2 +-
 meta-arm/lib/oeqa/controllers/fvp.py          |  4 +++
 meta-arm/lib/oeqa/runtime/cases/fvp_boot.py   | 25 +++++++++++++++++++
 meta-arm/lib/oeqa/runtime/cases/linuxboot.py  | 17 -------------
 8 files changed, 34 insertions(+), 21 deletions(-)
 create mode 100644 meta-arm/lib/oeqa/runtime/cases/fvp_boot.py
 delete mode 100644 meta-arm/lib/oeqa/runtime/cases/linuxboot.py

diff --git a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf b/meta-arm-b=
sp/conf/machine/corstone1000-fvp.conf
index 40f69297..449f5658 100644
--- a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
+++ b/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
@@ -9,7 +9,7 @@ TFM_PLATFORM_IS_FVP =3D "TRUE"
=20
 # testimage config
 TEST_TARGET =3D "OEFVPTarget"
-TEST_SUITES =3D "linuxboot"
+TEST_SUITES =3D "fvp_boot"
=20
 # FVP Config
 FVP_PROVIDER ?=3D "fvp-corstone1000-native"
diff --git a/meta-arm-bsp/conf/machine/corstone500.conf b/meta-arm-bsp/co=
nf/machine/corstone500.conf
index 36ba7703..a688ad2f 100644
--- a/meta-arm-bsp/conf/machine/corstone500.conf
+++ b/meta-arm-bsp/conf/machine/corstone500.conf
@@ -33,7 +33,7 @@ WKS_FILE_DEPENDS:append =3D " ${EXTRA_IMAGEDEPENDS}"
 WKS_FILE ?=3D "core-image-minimal.corstone500.wks"
=20
 TEST_TARGET =3D "OEFVPTarget"
-TEST_SUITES =3D "linuxboot"
+TEST_SUITES =3D "fvp_boot"
=20
 FVP_PROVIDER ?=3D "fvp-corstone500-native"
 FVP_EXE ?=3D "FVP_Corstone-500"
diff --git a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf b/meta-arm=
-bsp/conf/machine/fvp-baser-aemv8r64.conf
index b8a6aa46..7dbc53a1 100644
--- a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
+++ b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
@@ -30,7 +30,7 @@ MACHINE_EXTRA_RRECOMMENDS +=3D "ssh-pregen-hostkeys"
=20
 # testimage configuration
 TEST_TARGET =3D "OEFVPTarget"
-TEST_SUITES =3D "linuxboot"
+TEST_SUITES:append =3D " fvp_boot"
 TEST_TARGET_IP ?=3D "127.0.0.1:8022"
 TEST_SERVER_IP ?=3D "127.0.1.1"
=20
diff --git a/meta-arm-bsp/conf/machine/include/fvp-common.inc b/meta-arm-=
bsp/conf/machine/include/fvp-common.inc
index 47b7ffce..f80ac4c2 100644
--- a/meta-arm-bsp/conf/machine/include/fvp-common.inc
+++ b/meta-arm-bsp/conf/machine/include/fvp-common.inc
@@ -24,6 +24,7 @@ MACHINE_EXTRA_RRECOMMENDS +=3D "ssh-pregen-hostkeys"
=20
 TEST_TARGET =3D "OEFVPTarget"
 TEST_TARGET_IP =3D "127.0.0.1:8022"
+TEST_SUITES:append =3D " fvp_boot"
=20
 FVP_PROVIDER ?=3D "fvp-base-a-aem-native"
 FVP_EXE ?=3D "FVP_Base_RevC-2xAEMvA"
diff --git a/meta-arm-bsp/conf/machine/tc1.conf b/meta-arm-bsp/conf/machi=
ne/tc1.conf
index bba2c191..31bcc2fb 100644
--- a/meta-arm-bsp/conf/machine/tc1.conf
+++ b/meta-arm-bsp/conf/machine/tc1.conf
@@ -7,7 +7,7 @@
 require conf/machine/include/tc.inc
=20
 TEST_TARGET =3D "OEFVPTarget"
-TEST_SUITES =3D "linuxboot"
+TEST_SUITES =3D "fvp_boot"
=20
 # FVP Config
 FVP_PROVIDER ?=3D "fvp-tc1-native"
diff --git a/meta-arm/lib/oeqa/controllers/fvp.py b/meta-arm/lib/oeqa/con=
trollers/fvp.py
index cfd8c4e9..80f72aab 100644
--- a/meta-arm/lib/oeqa/controllers/fvp.py
+++ b/meta-arm/lib/oeqa/controllers/fvp.py
@@ -132,3 +132,7 @@ class OEFVPTarget(OESSHTarget):
                 return attr
=20
         return call_pexpect
+
+    @property
+    def config(self):
+        return self.fvp.getConfig()
diff --git a/meta-arm/lib/oeqa/runtime/cases/fvp_boot.py b/meta-arm/lib/o=
eqa/runtime/cases/fvp_boot.py
new file mode 100644
index 00000000..dce52776
--- /dev/null
+++ b/meta-arm/lib/oeqa/runtime/cases/fvp_boot.py
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: MIT
+
+from oeqa.runtime.case import OERuntimeTestCase
+import pexpect
+
+
+class FVPBootTest(OERuntimeTestCase):
+    """
+    This test waits for a Linux login prompt on the default console. It =
is
+    dependent on the OEFVPTarget test controller
+    """
+
+    def test_fvp_boot(self):
+        self.target.transition("off")
+        timeout =3D int(self.td.get('TEST_FVP_LINUX_BOOT_TIMEOUT') or 10=
*60)
+        self.target.transition("linux", timeout)
+
+        # Check for common error patterns on all consoles
+        for console in self.target.config['consoles']:
+            # "expect" a timeout when searching for the error patterns
+            match =3D self.target.expect(console,
+                               [br'(\[ERR\]|\[ERROR\]|ERROR\:)',
+                                pexpect.TIMEOUT],
+                                timeout=3D0)
+            self.assertEqual(match, 1)
diff --git a/meta-arm/lib/oeqa/runtime/cases/linuxboot.py b/meta-arm/lib/=
oeqa/runtime/cases/linuxboot.py
deleted file mode 100644
index 184eb6c9..00000000
--- a/meta-arm/lib/oeqa/runtime/cases/linuxboot.py
+++ /dev/null
@@ -1,17 +0,0 @@
-# SPDX-License-Identifier: MIT
-
-from oeqa.runtime.case import OERuntimeTestCase
-
-
-class LinuxBootTest(OERuntimeTestCase):
-    """
-    This test waits for a Linux login prompt on the default console.
-    """
-
-    def setUp(self):
-        self.console =3D self.target.DEFAULT_CONSOLE
-        self.timeout =3D int(self.td.get('TEST_FVP_LINUX_BOOT_TIMEOUT') =
or 10*60)
-
-    def test_linux_boot(self):
-        self.logger.info(f"{self.console}: Waiting for login prompt")
-        self.target.expect(self.console, r"login\:", self.timeout)
--=20
2.34.1


