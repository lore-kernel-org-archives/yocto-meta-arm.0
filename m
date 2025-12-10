Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81798D3C92F
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 16:33:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.243.1765384414516330797
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Dec 2025 08:33:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA7CA153B
	for <meta-arm@lists.yoctoproject.org>; Wed, 10 Dec 2025 08:33:26 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E3BCA3F73B
	for <meta-arm@lists.yoctoproject.org>; Wed, 10 Dec 2025 08:33:33 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm-bsp/u-boot: update fvp-base patches
Date: Wed, 10 Dec 2025 11:33:30 -0500
Message-ID: <20251210163332.66571-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 10 Dec 2025 16:33:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6792

u-boot has accepted some of the fvp-base patches.  Take the upstream
versions and rebase the third patch to apply.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-bsp/u-boot/u-boot-fvp-base.inc    |  2 +-
 ...1-vexpress64-Set-the-DM_RNG-property.patch | 29 ++++----
 ...64-Enable-SYSRESET-and-SYSRESET_PSCI.patch | 71 +++++++++++++++++++
 ...press64-Select-PSCI-RESET-by-default.patch | 46 ------------
 ...-Imply-CONFIG_ARM64_CRC32-by-default.patch | 48 +++++++++++--
 5 files changed, 129 insertions(+), 67 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0002-=
arm-vexpress64-Enable-SYSRESET-and-SYSRESET_PSCI.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0002-=
vexpress64-Select-PSCI-RESET-by-default.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc b/meta-a=
rm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc
index d7558f4ff456..e7f2287797b6 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc
@@ -3,6 +3,6 @@
 SRC_URI:append =3D " \
     file://virtio-boot.cfg \
     file://0001-vexpress64-Set-the-DM_RNG-property.patch \
-    file://0002-vexpress64-Select-PSCI-RESET-by-default.patch \
+    file://0002-arm-vexpress64-Enable-SYSRESET-and-SYSRESET_PSCI.patch \
     file://0003-vexpress64-Imply-CONFIG_ARM64_CRC32-by-default.patch \
     "
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0001-vexpres=
s64-Set-the-DM_RNG-property.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boo=
t/fvp-base/0001-vexpress64-Set-the-DM_RNG-property.patch
index 4912491fb68a..dee48e1dd68c 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0001-vexpress64-Set=
-the-DM_RNG-property.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0001-vexpress64-Set=
-the-DM_RNG-property.patch
@@ -1,28 +1,31 @@
-From 6813b56a11f423f3faa0e960bb044534e11d0104 Mon Sep 17 00:00:00 2001
-From: Debbie Martin <Debbie.Martin@arm.com>
-Date: Fri, 25 Aug 2023 15:09:33 +0100
+From 364d81afbf4fdc1b3d35c137f02ffa6f1ddd929d Mon Sep 17 00:00:00 2001
+From: Debbie Horsfall <debbie.horsfall@arm.com>
+Date: Wed, 17 Sep 2025 17:22:21 +0100
 Subject: [PATCH] vexpress64: Set the DM_RNG property
=20
-Enable the DM_RNG virtio random number generator driver in
-in order to consume entropy within u-boot. This is necessary
-in the case that the kernel is not configured to enable the
-virtio rng driver itself.
+Enable the DM_RNG virtio random number generator driver in order to
+consume entropy within U-Boot. This allows U-Boot to inject entropy to t=
he
+kernel via UEFI, so the kernel can use that early, for instance for
+address layout randomisation, or when the kernel does not provide an
+entropy driver itself.
=20
-Upstream-Status: Pending
-Signed-off-by: Debbie Martin <Debbie.Martin@arm.com>
+Signed-off-by: Debbie Horsfall <debbie.horsfall@arm.com>
+Reviewed-by: Andre Przywara <andre.przywara@arm.com>
+Upstream-Status: Backport [2767386806c254820ea22a812bb02e5405495a29]
 ---
- board/armltd/vexpress64/Kconfig | 1 +
- 1 file changed, 1 insertion(+)
+ board/armltd/vexpress64/Kconfig | 2 ++
+ 1 file changed, 2 insertions(+)
=20
 diff --git a/board/armltd/vexpress64/Kconfig b/board/armltd/vexpress64/K=
config
-index 7e8709444fe3..f413c51ac43b 100644
+index 7e8709444fe3..610ab0ac37dc 100644
 --- a/board/armltd/vexpress64/Kconfig
 +++ b/board/armltd/vexpress64/Kconfig
-@@ -21,6 +21,7 @@ config VEXPRESS64_BASE_MODEL
+@@ -21,6 +21,8 @@ config VEXPRESS64_BASE_MODEL
  	imply EFI_SET_TIME if DM_RTC
  	select LINUX_KERNEL_IMAGE_HEADER
  	select POSITION_INDEPENDENT
 +	imply DM_RNG
++	imply RNG_ARM_RNDR
 =20
  choice
  	prompt "VExpress64 board variant"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0002-arm-vex=
press64-Enable-SYSRESET-and-SYSRESET_PSCI.patch b/meta-arm-bsp/recipes-bs=
p/u-boot/u-boot/fvp-base/0002-arm-vexpress64-Enable-SYSRESET-and-SYSRESET=
_PSCI.patch
new file mode 100644
index 000000000000..e6bd28d927f1
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0002-arm-vexpress64=
-Enable-SYSRESET-and-SYSRESET_PSCI.patch
@@ -0,0 +1,71 @@
+From bec13f424612ba01dace86fe4a4ab49eedaca4b2 Mon Sep 17 00:00:00 2001
+From: Debbie Horsfall <debbie.horsfall@arm.com>
+Date: Wed, 17 Sep 2025 17:22:22 +0100
+Subject: [PATCH] arm: vexpress64: Enable SYSRESET and SYSRESET_PSCI
+
+Select SYSRESET on Vexpress64 to enable system reset to support other
+features, such as capsule-on-disk. Select SYSRESET_PSCI if PSCI is
+inferred from the firmware (via ARM_PSCI_FW).
+Select ARM_SMCCC for Vexpress64 boards which in turn selects
+ARM_PSCI_FW.
+
+The sysreset uclass unconditionally implements a reset_cpu() function.
+Remove the empty reset_cpu() in vexpress64 board code.
+
+Signed-off-by: Debbie Horsfall <debbie.horsfall@arm.com>
+Upstream-Status: Backport [1f3f1e090a2695e0b17cbf9dc50ccb59d100458f]
+---
+ arch/arm/Kconfig                     | 2 ++
+ board/armltd/vexpress64/Kconfig      | 2 ++
+ board/armltd/vexpress64/vexpress64.c | 5 -----
+ 3 files changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
+index 625d2e995d2f..68f37f633fdf 100644
+--- a/arch/arm/Kconfig
++++ b/arch/arm/Kconfig
+@@ -1418,6 +1418,8 @@ config ARCH_VEXPRESS64
+ 	select MTD_NOR_FLASH if MTD
+ 	select FLASH_CFI_DRIVER if MTD
+ 	select ENV_IS_IN_FLASH if MTD
++	select SYSRESET
++	select SYSRESET_PSCI if ARM_PSCI_FW
+ 	imply DISTRO_DEFAULTS
+=20
+ config TARGET_CORSTONE1000
+diff --git a/board/armltd/vexpress64/Kconfig b/board/armltd/vexpress64/K=
config
+index 610ab0ac37dc..9ef3fa1b379f 100644
+--- a/board/armltd/vexpress64/Kconfig
++++ b/board/armltd/vexpress64/Kconfig
+@@ -23,6 +23,7 @@ config VEXPRESS64_BASE_MODEL
+ 	select POSITION_INDEPENDENT
+ 	imply DM_RNG
+ 	imply RNG_ARM_RNDR
++	select ARM_SMCCC
+=20
+ choice
+ 	prompt "VExpress64 board variant"
+@@ -48,6 +49,7 @@ config TARGET_VEXPRESS64_JUNO
+ 	select USB_EHCI_GENERIC if USB
+ 	select USB_OHCI_HCD if USB
+ 	select USB_OHCI_GENERIC if USB
++	select ARM_SMCCC
+ 	imply OF_HAS_PRIOR_STAGE
+=20
+ endchoice
+diff --git a/board/armltd/vexpress64/vexpress64.c b/board/armltd/vexpres=
s64/vexpress64.c
+index 0b75c1358f0b..e8f1c2fe9fe2 100644
+--- a/board/armltd/vexpress64/vexpress64.c
++++ b/board/armltd/vexpress64/vexpress64.c
+@@ -206,11 +206,6 @@ int board_fdt_blob_setup(void **fdtp)
+ #endif
+ #endif
+=20
+-/* Actual reset is done via PSCI. */
+-void reset_cpu(void)
+-{
+-}
+-
+ /*
+  * Board specific ethernet initialization routine.
+  */
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0002-vexpres=
s64-Select-PSCI-RESET-by-default.patch b/meta-arm-bsp/recipes-bsp/u-boot/=
u-boot/fvp-base/0002-vexpress64-Select-PSCI-RESET-by-default.patch
deleted file mode 100644
index 822a308dd29a..000000000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0002-vexpress64-Sel=
ect-PSCI-RESET-by-default.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From ca70595913d7584605be1ea37362da25254fb829 Mon Sep 17 00:00:00 2001
-From: Diego Sueiro <diego.sueiro@arm.com>
-Date: Wed, 4 Oct 2023 06:31:50 +0100
-Subject: [PATCH] vexpress64: Select PSCI RESET by default
-
-Set SYSRESET and SYSRESET_PSCI config for vexpress64 by
-by default. This means that the reset_cpu function in
-vexpress64.c is no longer needed because it is called in
-sysreset-uclass.c instead.
-
-Upstream-Status: Pending
-Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
----
- board/armltd/vexpress64/Kconfig      | 2 ++
- board/armltd/vexpress64/vexpress64.c | 5 -----
- 2 files changed, 2 insertions(+), 5 deletions(-)
-
-diff --git a/board/armltd/vexpress64/Kconfig b/board/armltd/vexpress64/K=
config
-index f413c51ac43b..d0733ba62432 100644
---- a/board/armltd/vexpress64/Kconfig
-+++ b/board/armltd/vexpress64/Kconfig
-@@ -30,6 +30,8 @@ config TARGET_VEXPRESS64_BASE_FVP
- 	bool "Support Versatile Express ARMv8a FVP BASE model"
- 	select VEXPRESS64_BASE_MODEL
- 	imply OF_HAS_PRIOR_STAGE if !BLOBLIST
-+	select SYSRESET
-+	select SYSRESET_PSCI
-=20
- config TARGET_VEXPRESS64_BASER_FVP
- 	bool "Support Versatile Express ARMv8r64 FVP BASE model"
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
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0003-vexpres=
s64-Imply-CONFIG_ARM64_CRC32-by-default.patch b/meta-arm-bsp/recipes-bsp/=
u-boot/u-boot/fvp-base/0003-vexpress64-Imply-CONFIG_ARM64_CRC32-by-defaul=
t.patch
index 5ebdda095dd4..5bb738982002 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0003-vexpress64-Imp=
ly-CONFIG_ARM64_CRC32-by-default.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0003-vexpress64-Imp=
ly-CONFIG_ARM64_CRC32-by-default.patch
@@ -1,4 +1,4 @@
-From 9c98333d7c5f4c2611c76d60f5e7cb96bfdaca26 Mon Sep 17 00:00:00 2001
+From 67b2bcd428a13d14d4311bd1122e664f391af4d4 Mon Sep 17 00:00:00 2001
 From: Diego Sueiro <diego.sueiro@arm.com>
 Date: Wed, 4 Oct 2023 06:29:12 +0100
 Subject: [PATCH] vexpress64: Imply CONFIG_ARM64_CRC32 by default
@@ -10,18 +10,52 @@ feature of ARMv8.1 and newer.
 Upstream-Status: Pending
 Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
 ---
- board/armltd/vexpress64/Kconfig | 1 +
- 1 file changed, 1 insertion(+)
+ board/armltd/vexpress64/Kconfig  |  1 +
+ include/configs/vexpress_aemv8.h | 13 +++++++------
+ 2 files changed, 8 insertions(+), 6 deletions(-)
=20
 diff --git a/board/armltd/vexpress64/Kconfig b/board/armltd/vexpress64/K=
config
-index d0733ba62432..543cbdb5631b 100644
+index 9ef3fa1b379f..1a0e0a5018d8 100644
 --- a/board/armltd/vexpress64/Kconfig
 +++ b/board/armltd/vexpress64/Kconfig
-@@ -22,6 +22,7 @@ config VEXPRESS64_BASE_MODEL
- 	select LINUX_KERNEL_IMAGE_HEADER
- 	select POSITION_INDEPENDENT
+@@ -24,6 +24,7 @@ config VEXPRESS64_BASE_MODEL
  	imply DM_RNG
+ 	imply RNG_ARM_RNDR
+ 	select ARM_SMCCC
 +	imply ARM64_CRC32
 =20
  choice
  	prompt "VExpress64 board variant"
+diff --git a/include/configs/vexpress_aemv8.h b/include/configs/vexpress=
_aemv8.h
+index 5eee13b3fc01..5c271d239501 100644
+--- a/include/configs/vexpress_aemv8.h
++++ b/include/configs/vexpress_aemv8.h
+@@ -172,7 +172,7 @@
+  */
+ #define BOOTENV_DEV_SMH(devtypeu, devtypel, instance) \
+ 	"bootcmd_smh=3D " 						\
+-		"if load hostfs - ${boot_addr_r} ${boot_name}; then"		\
++		"if load hostfs - ${boot_addr_r} ${boot_name}; then"	\
+ 		"  setenv bootargs;"					\
+ 		"  abootimg addr ${boot_addr_r};"			\
+ 		"  abootimg get dtb --index=3D0 fdt_addr_r;"		\
+@@ -181,13 +181,14 @@
+ 		"  if load hostfs - ${kernel_addr_r} ${kernel_name}; then"	\
+ 		"    setenv fdt_high 0xffffffffffffffff;"		\
+ 		"    setenv initrd_high 0xffffffffffffffff;"		\
+-		"    if test -n load hostfs - ${fdt_addr_r} ${fdtfile}; then"			\
+-		"        fdt move $fdtcontroladdr $fdt_addr_r;"			\
+-		"    fi;"			\
+-		"    load hostfs - ${ramdisk_addr_r} ${ramdisk_name};" \
++		"    load hostfs - ${fdt_addr_r} ${fdtfile};"		\
++		"    if test $? -eq 1; then "                           \
++		"        fdt move $fdtcontroladdr $fdt_addr_r;"		\
++		"    fi;"						\
++		"    load hostfs - ${ramdisk_addr_r} ${ramdisk_name};" 	\
+ 		"    fdt addr ${fdt_addr_r};"				\
+ 		"    fdt resize;"					\
+-		"    fdt chosen ${ramdisk_addr_r} ${filesize};"	\
++		"    fdt chosen ${ramdisk_addr_r} ${filesize};"		\
+ 		"    booti $kernel_addr_r - ${fdt_addr_r};"		\
+ 		"  fi;"							\
+ 		"fi\0"
--=20
2.50.1 (Apple Git-155)


