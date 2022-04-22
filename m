Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9052DC636D5
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10723.1650643788278888037
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 09:09:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EAA441FB;
	Fri, 22 Apr 2022 09:09:47 -0700 (PDT)
Received: from e125920.arm.com (unknown [10.57.95.219])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F7303F5A1;
	Fri, 22 Apr 2022 09:09:46 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 6/6] arm-bsp/u-boot: Enable fdt overlays for
 fvp-baser-aemv8r64
Date: Fri, 22 Apr 2022 17:09:00 +0100
Message-Id: <20220422160900.1861031-6-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422160900.1861031-1-peter.hoyes@arm.com>
References: <20220422160900.1861031-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:52:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3291

From: Peter Hoyes <Peter.Hoyes@arm.com>

Enable the OF_LIBFDT_OVERLAY configuration flag so that U-Boot can apply
fdt overlays using the "fdt apply" command.

This can be used to modify the device tree at runtime to boot a
different payload without changing the firmware.

Issue-Id: SCM-4386
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I6e32c5ce833ca7c61f0f73fc256031564e55f1b8
---
 .../documentation/fvp-baser-aemv8r64.md       |  1 +
 ...e-LIBFDT_OVERLAY-in-the-vexpress_aem.patch | 27 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  1 +
 3 files changed, 29 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv=
8r64/0013-vexpress64-Enable-LIBFDT_OVERLAY-in-the-vexpress_aem.patch

diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-arm-=
bsp/documentation/fvp-baser-aemv8r64.md
index 2638502..4e98e42 100644
--- a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
+++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
@@ -234,6 +234,7 @@ Known Issues and Limitations
=20
 Change Log
 ----------
+- Enabled the ability for U-Boot to apply device tree overlays
 - Fixed bug in U-Boot that caused changes to the `memory` node in the de=
vice
   tree to be ignored.
 - Added boot-wrapper-aarch64 support for booting SMP payloads at S-EL2.
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
13-vexpress64-Enable-LIBFDT_OVERLAY-in-the-vexpress_aem.patch b/meta-arm-=
bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0013-vexpress64-Enable-L=
IBFDT_OVERLAY-in-the-vexpress_aem.patch
new file mode 100644
index 0000000..2824acc
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0013-vexp=
ress64-Enable-LIBFDT_OVERLAY-in-the-vexpress_aem.patch
@@ -0,0 +1,27 @@
+From 0ca75ef2a29f8b37f356af005dac3c83c9b50e2a Mon Sep 17 00:00:00 2001
+From: Peter Hoyes <Peter.Hoyes@arm.com>
+Date: Tue, 22 Feb 2022 15:32:51 +0000
+Subject: [PATCH 2/2] vexpress64: Enable LIBFDT_OVERLAY in the vexpress_a=
emv8r
+ defconfig
+
+Issue-Id: SCM-3874
+Upstream-Status: Inappropriate [other]
+  Implementation pending further discussion
+Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
+Change-Id: Ide0532cf2de89f1bca9c8d4bd2ed0c1a1c57599f
+---
+ configs/vexpress_aemv8r_defconfig | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configs/vexpress_aemv8r_defconfig b/configs/vexpress_aemv8r=
_defconfig
+index 37c393b66f..aff34e86b0 100644
+--- a/configs/vexpress_aemv8r_defconfig
++++ b/configs/vexpress_aemv8r_defconfig
+@@ -25,3 +25,4 @@ CONFIG_ARMV8_SWITCH_TO_EL1=3Dy
+ CONFIG_ARMV8_DISABLE_HVC=3Dn
+ CONFIG_ARMV8_EXCEPTION_VECTORS=3Dn
+ CONFIG_ARCH_FIXUP_FDT_MEMORY=3Dn
++CONFIG_OF_LIBFDT_OVERLAY=3Dy
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index db395fe..f7336ad 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -72,6 +72,7 @@ SRC_URI:append:fvp-baser-aemv8r64 =3D " \
     file://0010-vexpress64-Do-not-set-COUNTER_FREQUENCY.patch \
     file://0011-vexpress64-Add-BASER_FVP-vexpress-board-variant.patch \
     file://0012-vexpress64-Configure-memory-using-device-tree.patch \
+    file://0013-vexpress64-Enable-LIBFDT_OVERLAY-in-the-vexpress_aem.pat=
ch \
     "
=20
 #
--=20
2.25.1


