Return-Path: <musa.antike@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D582CC02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 14:23:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.22068.1736950979522061717
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 15 Jan 2025 06:22:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: musa.antike@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 680FD11FB
	for <meta-arm@lists.yoctoproject.org>; Wed, 15 Jan 2025 06:23:27 -0800 (PST)
Received: from e132696.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 722FA3F63F
	for <meta-arm@lists.yoctoproject.org>; Wed, 15 Jan 2025 06:22:58 -0800 (PST)
From: Musa Antike <musa.antike@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH styhead 4/5] arm-systemready/oeqa: Add unattended installation testcase
Date: Wed, 15 Jan 2025 14:22:45 +0000
Message-Id: <20250115142246.3825897-4-musa.antike@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250115142246.3825897-1-musa.antike@arm.com>
References: <20250115142246.3825897-1-musa.antike@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 15 Jan 2025 14:23:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6334

Add test for Debian unattended installation verification

Signed-off-by: Musa Antike <musa.antike@arm.com>
---
 .../arm_systemready_debian_unattended.py      | 66 +++++++++++++++++++
 .../arm-systemready-linux-distros-debian.bb   |  2 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta-arm-systemready/lib/oeqa/runtime/cases/arm_syste=
mready_debian_unattended.py

diff --git a/meta-arm-systemready/lib/oeqa/runtime/cases/arm_systemready_=
debian_unattended.py b/meta-arm-systemready/lib/oeqa/runtime/cases/arm_sy=
stemready_debian_unattended.py
new file mode 100644
index 00000000..3c3a2a48
--- /dev/null
+++ b/meta-arm-systemready/lib/oeqa/runtime/cases/arm_systemready_debian_=
unattended.py
@@ -0,0 +1,66 @@
+from oeqa.runtime.case import OERuntimeTestCase
+
+
+class SystemReadyDebianUnattendedTest(OERuntimeTestCase):
+    def setUp(self):
+        super().setUp()
+        self.console =3D self.target.DEFAULT_CONSOLE
+
+    def test_debian_unattended(self):
+        # Turn on the FVP.
+        self.target.transition('on')
+
+        # Timeout value =3D elapsed time * 2; where elapsed time was col=
lected
+        # from the elapsed time in the log.do_testimage for each functio=
n after
+        # the build is finished on the development machine.
+        self.target.expect(self.console,
+                           r'.*Scanning installation',
+                           timeout=3D(20 * 60))
+        bb.plain('Installation status: Scanning installation media...')
+
+        self.target.expect(self.console,
+                           r'.*Detecting network hardware',
+                           timeout=3D(35 * 60))
+        bb.plain('Installation status: Detecting network hardware...')
+
+        self.target.expect(self.console,
+                           r'.*Installing the base system',
+                           timeout=3D(35 * 60))
+        bb.plain('Installation status: Installing the base system...')
+
+        self.target.expect(self.console,
+                           r'.*Installing GRUB',
+                           timeout=3D(7 * 60 * 60))
+        bb.plain('Installation status: Installing GRUB...')
+
+        # Waiting to respond to the boot loader prompt error message.
+        self.target.expect(self.console,
+                           r'.*Press enter to continue',
+                           timeout=3D(15 * 60))
+        self.target.sendline(self.console, '')
+
+        self.target.expect(self.console,
+                           r'.*Press enter to continue',
+                           timeout=3D(60))
+        self.target.sendline(self.console, '')
+
+        # Waiting to respond continue without bootloader to install
+        # bootloader with the late script in preseed.cfg at the end.
+        self.target.expect(self.console,
+                           r'.*Continue without boot loader',
+                           timeout=3D(2 * 60))
+        self.target.sendline(self.console, '14')
+
+        self.target.expect(self.console,
+                           r'.*Press enter to continue',
+                           timeout=3D(60))
+        self.target.sendline(self.console, '')
+
+        self.target.expect(self.console,
+                           r'.*Finishing the installation',
+                           timeout=3D(2 * 60))
+        bb.plain('Installation status: Finishing the installation...')
+
+        # Waiting till the installation is finished.
+        self.target.expect(self.console, r'.*login:', timeout=3D(40 * 60=
))
+        bb.plain('Installation status: Debian installation finished succ=
essfully.')
diff --git a/meta-arm-systemready/recipes-test/arm-systemready-linux-dist=
ros/arm-systemready-linux-distros-debian.bb b/meta-arm-systemready/recipe=
s-test/arm-systemready-linux-distros/arm-systemready-linux-distros-debian=
.bb
index 5e5ebc31..daeec6cb 100644
--- a/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros-debian.bb
+++ b/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros-debian.bb
@@ -105,6 +105,8 @@ SRC_URI =3D "\
     "
 SRC_URI[debian_iso_image.sha256sum] =3D "8891fe48bb5a58ae54176eaa6440059=
bf852044d6b9ae77219e78f9ef8d65149"
=20
+TEST_SUITES =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TESTS", "ar=
m_systemready_debian_unattended", "", d)}"
+
 ISO_LABEL =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TESTS", "debi=
an-12.8.0-arm64-1", "", d)}"
 BOOT_CATALOG =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TESTS", "b=
oot.catalog", "", d)}"
 BOOT_IMAGE =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TESTS", "EFI=
/boot/bootaa64.efi", "", d)}"
--=20
2.34.1


