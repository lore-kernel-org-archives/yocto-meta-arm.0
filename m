Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74657D4662B
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 22:45:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.676.1768517138722325711
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 15 Jan 2026 14:45:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 692A81515
	for <meta-arm@lists.yoctoproject.org>; Thu, 15 Jan 2026 14:45:31 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F408C3F632
	for <meta-arm@lists.yoctoproject.org>; Thu, 15 Jan 2026 14:45:37 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/u-boot: remove upstreamed fvp-base patches
Date: Thu, 15 Jan 2026 17:45:37 -0500
Message-ID: <20260115224537.26252-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 15 Jan 2026 22:45:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6852

2 of the fvp-base specific u-boot patches were merged in the 2026.01
release.  Remove those, as they are no longer necessary.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-bsp/u-boot/u-boot-fvp-base.inc    |  8 ---
 ...1-vexpress64-Set-the-DM_RNG-property.patch | 31 --------
 ...64-Enable-SYSRESET-and-SYSRESET_PSCI.patch | 71 -------------------
 3 files changed, 110 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0001-=
vexpress64-Set-the-DM_RNG-property.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0002-=
arm-vexpress64-Enable-SYSRESET-and-SYSRESET_PSCI.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc b/meta-a=
rm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc
index 44b98f8fca7e..a52837218f9b 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc
@@ -2,13 +2,5 @@
=20
 SRC_URI:append =3D " \
     file://virtio-boot.cfg \
-    file://0001-vexpress64-Set-the-DM_RNG-property.patch \
-    file://0002-arm-vexpress64-Enable-SYSRESET-and-SYSRESET_PSCI.patch \
     file://0003-vexpress64-Imply-CONFIG_ARM64_CRC32-by-default.patch \
     "
-
-# Remove backported patches from latest version
-SRC_URI:remove:class-devupstream =3D " \
-    file://0001-vexpress64-Set-the-DM_RNG-property.patch \
-    file://0002-arm-vexpress64-Enable-SYSRESET-and-SYSRESET_PSCI.patch \
-    "
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0001-vexpres=
s64-Set-the-DM_RNG-property.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boo=
t/fvp-base/0001-vexpress64-Set-the-DM_RNG-property.patch
deleted file mode 100644
index dee48e1dd68c..000000000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0001-vexpress64-Set=
-the-DM_RNG-property.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 364d81afbf4fdc1b3d35c137f02ffa6f1ddd929d Mon Sep 17 00:00:00 2001
-From: Debbie Horsfall <debbie.horsfall@arm.com>
-Date: Wed, 17 Sep 2025 17:22:21 +0100
-Subject: [PATCH] vexpress64: Set the DM_RNG property
-
-Enable the DM_RNG virtio random number generator driver in order to
-consume entropy within U-Boot. This allows U-Boot to inject entropy to t=
he
-kernel via UEFI, so the kernel can use that early, for instance for
-address layout randomisation, or when the kernel does not provide an
-entropy driver itself.
-
-Signed-off-by: Debbie Horsfall <debbie.horsfall@arm.com>
-Reviewed-by: Andre Przywara <andre.przywara@arm.com>
-Upstream-Status: Backport [2767386806c254820ea22a812bb02e5405495a29]
----
- board/armltd/vexpress64/Kconfig | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/board/armltd/vexpress64/Kconfig b/board/armltd/vexpress64/K=
config
-index 7e8709444fe3..610ab0ac37dc 100644
---- a/board/armltd/vexpress64/Kconfig
-+++ b/board/armltd/vexpress64/Kconfig
-@@ -21,6 +21,8 @@ config VEXPRESS64_BASE_MODEL
- 	imply EFI_SET_TIME if DM_RTC
- 	select LINUX_KERNEL_IMAGE_HEADER
- 	select POSITION_INDEPENDENT
-+	imply DM_RNG
-+	imply RNG_ARM_RNDR
-=20
- choice
- 	prompt "VExpress64 board variant"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0002-arm-vex=
press64-Enable-SYSRESET-and-SYSRESET_PSCI.patch b/meta-arm-bsp/recipes-bs=
p/u-boot/u-boot/fvp-base/0002-arm-vexpress64-Enable-SYSRESET-and-SYSRESET=
_PSCI.patch
deleted file mode 100644
index e6bd28d927f1..000000000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0002-arm-vexpress64=
-Enable-SYSRESET-and-SYSRESET_PSCI.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From bec13f424612ba01dace86fe4a4ab49eedaca4b2 Mon Sep 17 00:00:00 2001
-From: Debbie Horsfall <debbie.horsfall@arm.com>
-Date: Wed, 17 Sep 2025 17:22:22 +0100
-Subject: [PATCH] arm: vexpress64: Enable SYSRESET and SYSRESET_PSCI
-
-Select SYSRESET on Vexpress64 to enable system reset to support other
-features, such as capsule-on-disk. Select SYSRESET_PSCI if PSCI is
-inferred from the firmware (via ARM_PSCI_FW).
-Select ARM_SMCCC for Vexpress64 boards which in turn selects
-ARM_PSCI_FW.
-
-The sysreset uclass unconditionally implements a reset_cpu() function.
-Remove the empty reset_cpu() in vexpress64 board code.
-
-Signed-off-by: Debbie Horsfall <debbie.horsfall@arm.com>
-Upstream-Status: Backport [1f3f1e090a2695e0b17cbf9dc50ccb59d100458f]
----
- arch/arm/Kconfig                     | 2 ++
- board/armltd/vexpress64/Kconfig      | 2 ++
- board/armltd/vexpress64/vexpress64.c | 5 -----
- 3 files changed, 4 insertions(+), 5 deletions(-)
-
-diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
-index 625d2e995d2f..68f37f633fdf 100644
---- a/arch/arm/Kconfig
-+++ b/arch/arm/Kconfig
-@@ -1418,6 +1418,8 @@ config ARCH_VEXPRESS64
- 	select MTD_NOR_FLASH if MTD
- 	select FLASH_CFI_DRIVER if MTD
- 	select ENV_IS_IN_FLASH if MTD
-+	select SYSRESET
-+	select SYSRESET_PSCI if ARM_PSCI_FW
- 	imply DISTRO_DEFAULTS
-=20
- config TARGET_CORSTONE1000
-diff --git a/board/armltd/vexpress64/Kconfig b/board/armltd/vexpress64/K=
config
-index 610ab0ac37dc..9ef3fa1b379f 100644
---- a/board/armltd/vexpress64/Kconfig
-+++ b/board/armltd/vexpress64/Kconfig
-@@ -23,6 +23,7 @@ config VEXPRESS64_BASE_MODEL
- 	select POSITION_INDEPENDENT
- 	imply DM_RNG
- 	imply RNG_ARM_RNDR
-+	select ARM_SMCCC
-=20
- choice
- 	prompt "VExpress64 board variant"
-@@ -48,6 +49,7 @@ config TARGET_VEXPRESS64_JUNO
- 	select USB_EHCI_GENERIC if USB
- 	select USB_OHCI_HCD if USB
- 	select USB_OHCI_GENERIC if USB
-+	select ARM_SMCCC
- 	imply OF_HAS_PRIOR_STAGE
-=20
- endchoice
-diff --git a/board/armltd/vexpress64/vexpress64.c b/board/armltd/vexpres=
s64/vexpress64.c
-index 0b75c1358f0b..e8f1c2fe9fe2 100644
---- a/board/armltd/vexpress64/vexpress64.c
-+++ b/board/armltd/vexpress64/vexpress64.c
-@@ -206,11 +206,6 @@ int board_fdt_blob_setup(void **fdtp)
- #endif
- #endif
-=20
--/* Actual reset is done via PSCI. */
--void reset_cpu(void)
--{
--}
--
- /*
-  * Board specific ethernet initialization routine.
-  */
--=20
2.50.1 (Apple Git-155)


