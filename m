Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FEA5C43334
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 17:15:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9005.1655226920359169067
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jun 2022 10:15:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0066B1764
	for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jun 2022 10:15:20 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6AA153F66F
	for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jun 2022 10:15:19 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/6] arm-bsp/fvp-base-arm32: rebase for u-boot 2022.04
Date: Tue, 14 Jun 2022 13:15:13 -0400
Message-Id: <20220614171514.32495-5-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220614171514.32495-1-jon.mason@arm.com>
References: <20220614171514.32495-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Jun 2022 17:15:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3494

This is not a clean rebase.  The patch had to be modified to apply and
work on v2022.04.  It is not very elegant, but it is functional.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-base-arm32.conf |   2 +-
 ...-Add-vexpress_aemv8a_aarch32-variant.patch | 169 +++++++++---------
 ...4-Enable-OF_CONTROL-and-OF_BOARD-for.patch | 111 ++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   4 +-
 4 files changed, 204 insertions(+), 82 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base-arm32/0002-Revert-vexpress64-Enable-OF_CONTROL-and-OF_BOARD-for.patch

diff --git a/meta-arm-bsp/conf/machine/fvp-base-arm32.conf b/meta-arm-bsp/conf/machine/fvp-base-arm32.conf
index 2c0fa406..7343aed6 100644
--- a/meta-arm-bsp/conf/machine/fvp-base-arm32.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base-arm32.conf
@@ -8,7 +8,7 @@ require conf/machine/fvp-common.inc
 require conf/machine/include/arm/arch-armv7a.inc
 
 # FVP u-boot configuration
-PREFERRED_VERSION_u-boot ?= "2021.10"
+PREFERRED_VERSION_u-boot ?= "2022.04"
 UBOOT_MACHINE = "vexpress_aemv8a_aarch32_defconfig"
 
 KERNEL_IMAGETYPE = "zImage"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
index 2a65b141..5138335e 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
@@ -1,7 +1,7 @@
-From 44db30dcf57035f130246d5c76a34f205822347f Mon Sep 17 00:00:00 2001
+From 424d186ab0a0c4dd62dfb13ac87e8d1fd26c101e Mon Sep 17 00:00:00 2001
 From: Anders Dellien <anders.dellien@arm.com>
 Date: Thu, 23 Jul 2020 17:32:55 +0100
-Subject: [PATCH] Add vexpress_aemv8a_aarch32 variant
+Subject: [PATCH 1/2] Add vexpress_aemv8a_aarch32 variant
 
 The ARM AEMv8 FVP model can be run in Aarch64 or Aarch32 mode. Aarch32
 support is enable per-CPU when launching the model, eg:
@@ -24,16 +24,16 @@ Signed-off-by: Anders Dellien <anders.dellien@arm.com>
 ---
  arch/arm/Kconfig                          |  5 +++
  board/armltd/vexpress64/Kconfig           |  2 +-
- configs/vexpress_aemv8a_aarch32_defconfig | 40 +++++++++++++++++++++++
- include/configs/vexpress_aemv8a.h         | 23 +++++++++----
- 4 files changed, 62 insertions(+), 8 deletions(-)
+ configs/vexpress_aemv8a_aarch32_defconfig | 40 ++++++++++++++++++
+ include/configs/vexpress_aemv8.h          | 50 +++++++++++++++--------
+ 4 files changed, 80 insertions(+), 17 deletions(-)
  create mode 100644 configs/vexpress_aemv8a_aarch32_defconfig
 
 diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
-index b5bd3284cd1c..b3aae233a1ac 100644
+index 4567c183fb84..99cc414d6760 100644
 --- a/arch/arm/Kconfig
 +++ b/arch/arm/Kconfig
-@@ -1170,6 +1170,11 @@ config TARGET_VEXPRESS64_BASE_FVP
+@@ -1250,6 +1250,11 @@ config TARGET_VEXPRESS64_BASE_FVP
  	select PL01X_SERIAL
  	select SEMIHOSTING
  
@@ -46,7 +46,7 @@ index b5bd3284cd1c..b3aae233a1ac 100644
  	bool "Support Versatile Express Juno Development Platform"
  	select ARM64
 diff --git a/board/armltd/vexpress64/Kconfig b/board/armltd/vexpress64/Kconfig
-index 1d13f542e677..dad181c93c3d 100644
+index 4aab3f092ecb..0a5e3fcc004a 100644
 --- a/board/armltd/vexpress64/Kconfig
 +++ b/board/armltd/vexpress64/Kconfig
 @@ -1,4 +1,4 @@
@@ -57,33 +57,34 @@ index 1d13f542e677..dad181c93c3d 100644
  	default "vexpress64"
 diff --git a/configs/vexpress_aemv8a_aarch32_defconfig b/configs/vexpress_aemv8a_aarch32_defconfig
 new file mode 100644
-index 000000000000..0726e0d0db5a
+index 000000000000..9c5c3367ec4d
 --- /dev/null
 +++ b/configs/vexpress_aemv8a_aarch32_defconfig
 @@ -0,0 +1,40 @@
 +CONFIG_ARM=y
++CONFIG_SYS_ARCH_TIMER=y
 +CONFIG_TARGET_VEXPRESS64_BASE_FVP_AARCH32=y
++CONFIG_SYS_TEXT_BASE=0x88000000
 +CONFIG_SYS_MALLOC_F_LEN=0x2000
++CONFIG_NR_DRAM_BANKS=2
 +CONFIG_IDENT_STRING=" vexpress_aemv8a fvp aarch32"
++CONFIG_REMAKE_ELF=y
++CONFIG_SYS_LOAD_ADDR=0x90000000
 +CONFIG_BOOTDELAY=1
-+CONFIG_SYS_TEXT_BASE=0x88000000
 +CONFIG_USE_BOOTARGS=y
 +CONFIG_BOOTARGS="console=ttyAMA0 earlycon=pl011,0x1c090000 debug user_debug=31 systemd.log_target=null root=/dev/vda1 rw androidboot.hardware=fvpbase rootwait loglevel=9"
 +# CONFIG_DISPLAY_CPUINFO is not set
 +# CONFIG_DISPLAY_BOARDINFO is not set
 +CONFIG_HUSH_PARSER=y
 +CONFIG_SYS_PROMPT="fvp32# "
-+CONFIG_CMD_BOOTZ=y
 +# CONFIG_CMD_CONSOLE is not set
-+# CONFIG_CMD_IMLS is not set
++CONFIG_CMD_BOOTZ=y
 +# CONFIG_CMD_XIMG is not set
 +# CONFIG_CMD_EDITENV is not set
 +# CONFIG_CMD_ENV_EXISTS is not set
 +CONFIG_CMD_MEMTEST=y
-+CONFIG_MTD_NOR_FLASH=y
-+# CONFIG_CMD_LOADS is not set
 +CONFIG_CMD_ARMFLASH=y
-+# CONFIG_CMD_FPGA is not set
++# CONFIG_CMD_LOADS is not set
 +# CONFIG_CMD_ITEST is not set
 +# CONFIG_CMD_SETEXPR is not set
 +CONFIG_CMD_DHCP=y
@@ -91,85 +92,93 @@ index 000000000000..0726e0d0db5a
 +CONFIG_CMD_MII=y
 +CONFIG_CMD_PING=y
 +CONFIG_CMD_CACHE=y
-+# CONFIG_CMD_MISC is not set
 +CONFIG_CMD_FAT=y
 +CONFIG_DM=y
-+CONFIG_DM_SERIAL=y
-+CONFIG_OF_LIBFDT=y
++CONFIG_MTD_NOR_FLASH=y
 +CONFIG_FLASH_CFI_DRIVER=y
 +CONFIG_SYS_FLASH_CFI=y
-+CONFIG_SYS_ARCH_TIMER=y
 +CONFIG_DM_SERIAL=y
 +CONFIG_PL01X_SERIAL=y
-diff --git a/include/configs/vexpress_aemv8a.h b/include/configs/vexpress_aemv8a.h
-index 54b5967a89dc..48b75c10d979 100644
---- a/include/configs/vexpress_aemv8a.h
-+++ b/include/configs/vexpress_aemv8a.h
-@@ -9,8 +9,15 @@
- 
- #define CONFIG_REMAKE_ELF
- 
-+#ifdef CONFIG_ARM64
-+#define BOOT_TYPE                       "booti"
-+#else
-+#define BOOT_TYPE                       "bootz"
-+#endif
-+
- /* Link Definitions */
--#ifdef CONFIG_TARGET_VEXPRESS64_BASE_FVP
-+#if defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP) || \
-+        defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP_AARCH32)
- /* ATF loads u-boot here for BASE_FVP model */
- #define CONFIG_SYS_INIT_SP_ADDR         (CONFIG_SYS_SDRAM_BASE + 0x03f00000)
- #elif CONFIG_TARGET_VEXPRESS64_JUNO
-@@ -76,7 +83,8 @@
- #define GICR_BASE			(0x2f100000)
- #else
++CONFIG_OF_LIBFDT=y
++CONFIG_REMAKE_ELF=y
+diff --git a/include/configs/vexpress_aemv8.h b/include/configs/vexpress_aemv8.h
+index f0c5ceb3849a..854fbb41bfc1 100644
+--- a/include/configs/vexpress_aemv8.h
++++ b/include/configs/vexpress_aemv8.h
+@@ -86,7 +86,7 @@
+ #endif
+ #endif /* !CONFIG_GICV3 */
  
--#ifdef CONFIG_TARGET_VEXPRESS64_BASE_FVP
-+#if defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP) || \
-+        defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP_AARCH32)
- #define GICD_BASE			(0x2f000000)
- #define GICC_BASE			(0x2c000000)
- #elif CONFIG_TARGET_VEXPRESS64_JUNO
-@@ -174,7 +182,8 @@
+-#if defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP) && !defined(CONFIG_DM_ETH)
++#if (defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP) || defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP_AARCH32)) && !defined(CONFIG_DM_ETH)
+ /* The Vexpress64 BASE_FVP simulator uses SMSC91C111 */
+ #define CONFIG_SMC91111			1
+ #define CONFIG_SMC91111_BASE		(V2M_PA_BASE + 0x01A000000)
+@@ -114,7 +114,7 @@
+ #ifdef CONFIG_TARGET_VEXPRESS64_JUNO
+ #define PHYS_SDRAM_2			(0x880000000)
+ #define PHYS_SDRAM_2_SIZE		0x180000000
+-#elif CONFIG_NR_DRAM_BANKS == 2
++#elif CONFIG_TARGET_VEXPRESS64_BASE_FVP && CONFIG_NR_DRAM_BANKS == 2
+ #define PHYS_SDRAM_2			(0x880000000)
+ #define PHYS_SDRAM_2_SIZE		0x80000000
+ #endif
+@@ -171,23 +171,41 @@
  				"fdt_addr_r=0x80000000\0" \
  				BOOTENV
  
 -#elif CONFIG_TARGET_VEXPRESS64_BASE_FVP
 +#elif defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP) || \
 +        defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP_AARCH32)
- #define CONFIG_EXTRA_ENV_SETTINGS	\
- 				"kernel_name=Image\0"		\
- 				"kernel_addr=0x80080000\0"	\
-@@ -183,7 +192,9 @@
- 				"fdtfile=devtree.dtb\0"		\
- 				"fdt_addr=0x83000000\0"		\
- 				"boot_name=boot.img\0"		\
--				"boot_addr=0x8007f800\0"
-+				"boot_addr=0x8007f800\0"	\
-+				"fdt_high=0xffffffffffffffff\0" \
-+				"initrd_high=0xffffffffffffffff\0"
  
- #ifndef CONFIG_BOOTCOMMAND
- #define CONFIG_BOOTCOMMAND	"if smhload ${boot_name} ${boot_addr}; then " \
-@@ -193,15 +204,13 @@
- 				"  bootm ${boot_addr} ${boot_addr} " \
- 				"  ${fdt_addr}; " \
- 				"else; " \
--				"  set fdt_high 0xffffffffffffffff; " \
--				"  set initrd_high 0xffffffffffffffff; " \
- 				"  smhload ${kernel_name} ${kernel_addr}; " \
- 				"  smhload ${fdtfile} ${fdt_addr}; " \
- 				"  smhload ${initrd_name} ${initrd_addr} "\
- 				"  initrd_end; " \
- 				"  fdt addr ${fdt_addr}; fdt resize; " \
- 				"  fdt chosen ${initrd_addr} ${initrd_end}; " \
--				"  booti $kernel_addr - $fdt_addr; " \
-+				BOOT_TYPE " $kernel_addr - $fdt_addr; " \
- 				"fi"
- #endif
+-#define VEXPRESS_KERNEL_ADDR	0x80080000
+-#define VEXPRESS_FDT_ADDR	0x8fc00000
+-#define VEXPRESS_BOOT_ADDR	0x8fd00000
+-#define VEXPRESS_RAMDISK_ADDR	0x8fe00000
++#define VEXPRESS_KERNEL_ADDR   0x80080000
++#define VEXPRESS_FDT_ADDR      0x8fc00000
++#define VEXPRESS_BOOT_ADDR     0x8fd00000
++#define VEXPRESS_RAMDISK_ADDR  0x8fe00000
+ 
+-#define CONFIG_EXTRA_ENV_SETTINGS	\
++#define CONFIG_EXTRA_ENV_SETTINGS      \
+ 				"kernel_name=Image\0"		\
+-				"kernel_addr_r=" __stringify(VEXPRESS_KERNEL_ADDR) "\0"	\
+-				"ramdisk_name=ramdisk.img\0"	\
+-				"ramdisk_addr_r=" __stringify(VEXPRESS_RAMDISK_ADDR) "\0" \
+-				"fdtfile=devtree.dtb\0"	\
+-				"fdt_addr_r=" __stringify(VEXPRESS_FDT_ADDR) "\0"	\
+-				"boot_name=boot.img\0" \
+-				"boot_addr_r=" __stringify(VEXPRESS_BOOT_ADDR) "\0"
+-
++                                "kernel_addr_r=" __stringify(VEXPRESS_KERNEL_ADDR) "\0" \
++                                "ramdisk_name=ramdisk.img\0"    \
++                                "ramdisk_addr_r=" __stringify(VEXPRESS_RAMDISK_ADDR) "\0" \
++                                "fdtfile=devtree.dtb\0" \
++                                "fdt_addr_r=" __stringify(VEXPRESS_FDT_ADDR) "\0"       \
++                                "boot_name=boot.img\0" \
++                                "boot_addr_r=" __stringify(VEXPRESS_BOOT_ADDR) "\0"
++
++#ifndef CONFIG_BOOTCOMMAND
++#define CONFIG_BOOTCOMMAND	"if smhload ${boot_name} ${boot_addr_r}; then " \
++				"  set bootargs; " \
++				"  abootimg addr ${boot_addr_r}; " \
++				"  abootimg get dtb --index=0 fdt_addr_r; " \
++				"  bootm ${boot_addr_r} ${boot_addr_r} " \
++				"  ${fdt_addr_r}; " \
++				"else; " \
++				"  smhload ${kernel_name} ${kernel_addr_r}; " \
++				"  smhload ${fdtfile} ${fdt_addr_r}; " \
++				"  smhload ${ramdisk_name} ${initrd_addr_r} "\
++				"  initrd_end; " \
++				"  fdt addr ${fdt_addr_r}; fdt resize; " \
++				"  fdt chosen ${ramdisk_addr_r} ${initrd_end}; " \
++				"  bootz $kernel_addr_r - $fdt_addr_r; " \
++				"fi"
++#endif
  #endif
+ 
+ /* Monitor Command Prompt */
 -- 
-2.20.1
+2.30.2
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base-arm32/0002-Revert-vexpress64-Enable-OF_CONTROL-and-OF_BOARD-for.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base-arm32/0002-Revert-vexpress64-Enable-OF_CONTROL-and-OF_BOARD-for.patch
new file mode 100644
index 00000000..d916d420
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base-arm32/0002-Revert-vexpress64-Enable-OF_CONTROL-and-OF_BOARD-for.patch
@@ -0,0 +1,111 @@
+From e896d48c57d272327410416887f34ac0db550390 Mon Sep 17 00:00:00 2001
+From: Jon Mason <jdmason@kudzu.us>
+Date: Mon, 13 Jun 2022 10:59:53 -0400
+Subject: [PATCH 2/2] Revert "vexpress64: Enable OF_CONTROL and OF_BOARD for
+ VExpress64"
+
+This patch only works for aarch64 (as the 'x' registers are not
+available for ARMv7). Since this platform is ARMv7 in the previous
+patch, this either needs to be changed or removed.  I opted to remove
+it, as it doesn't seem to be necessary to boot the virtual hardware.
+Given that the previous patch was rejected upstream, it is not
+appropriate to fix this upstream.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+
+This reverts commit 2661397464e47d45cd25bbc5e6b9de7594b3268d.
+---
+ board/armltd/vexpress64/Makefile        |  2 +-
+ board/armltd/vexpress64/lowlevel_init.S | 12 ------------
+ board/armltd/vexpress64/vexpress64.c    | 26 -------------------------
+ 3 files changed, 1 insertion(+), 39 deletions(-)
+ delete mode 100644 board/armltd/vexpress64/lowlevel_init.S
+
+diff --git a/board/armltd/vexpress64/Makefile b/board/armltd/vexpress64/Makefile
+index 1878fbed4ec9..868dc4f629f2 100644
+--- a/board/armltd/vexpress64/Makefile
++++ b/board/armltd/vexpress64/Makefile
+@@ -3,5 +3,5 @@
+ # (C) Copyright 2000-2004
+ # Wolfgang Denk, DENX Software Engineering, wd@denx.de.
+ 
+-obj-y	:= vexpress64.o lowlevel_init.o
++obj-y	:= vexpress64.o
+ obj-$(CONFIG_TARGET_VEXPRESS64_JUNO)	+= pcie.o
+diff --git a/board/armltd/vexpress64/lowlevel_init.S b/board/armltd/vexpress64/lowlevel_init.S
+deleted file mode 100644
+index 3dcfb85d0e9a..000000000000
+--- a/board/armltd/vexpress64/lowlevel_init.S
++++ /dev/null
+@@ -1,12 +0,0 @@
+-/* SPDX-License-Identifier: GPL-2.0 */
+-/*
+- * (C) Copyright 2021 Arm Limited
+- */
+-
+-.global save_boot_params
+-save_boot_params:
+-
+-	adr	x8, prior_stage_fdt_address
+-	str	x0, [x8]
+-
+-	b	save_boot_params_ret
+diff --git a/board/armltd/vexpress64/vexpress64.c b/board/armltd/vexpress64/vexpress64.c
+index 5e22e89824ee..cedab86d984b 100644
+--- a/board/armltd/vexpress64/vexpress64.c
++++ b/board/armltd/vexpress64/vexpress64.c
+@@ -92,15 +92,7 @@ int dram_init_banksize(void)
+ 	return 0;
+ }
+ 
+-/* Assigned in lowlevel_init.S
+- * Push the variable into the .data section so that it
+- * does not get cleared later.
+- */
+-unsigned long __section(".data") prior_stage_fdt_address;
+-
+ #ifdef CONFIG_OF_BOARD
+-
+-#ifdef CONFIG_TARGET_VEXPRESS64_JUNO
+ #define JUNO_FLASH_SEC_SIZE	(256 * 1024)
+ static phys_addr_t find_dtb_in_nor_flash(const char *partname)
+ {
+@@ -145,11 +137,9 @@ static phys_addr_t find_dtb_in_nor_flash(const char *partname)
+ 
+ 	return ~0;
+ }
+-#endif
+ 
+ void *board_fdt_blob_setup(int *err)
+ {
+-#ifdef CONFIG_TARGET_VEXPRESS64_JUNO
+ 	phys_addr_t fdt_rom_addr = find_dtb_in_nor_flash(CONFIG_JUNO_DTB_PART);
+ 
+ 	*err = 0;
+@@ -159,22 +149,6 @@ void *board_fdt_blob_setup(int *err)
+ 	}
+ 
+ 	return (void *)fdt_rom_addr;
+-#endif
+-
+-#ifdef VEXPRESS_FDT_ADDR
+-	if (fdt_magic(VEXPRESS_FDT_ADDR) == FDT_MAGIC) {
+-		*err = 0;
+-		return (void *)VEXPRESS_FDT_ADDR;
+-	}
+-#endif
+-
+-	if (fdt_magic(prior_stage_fdt_address) == FDT_MAGIC) {
+-		*err = 0;
+-		return (void *)prior_stage_fdt_address;
+-	}
+-
+-	*err = -ENXIO;
+-	return NULL;
+ }
+ #endif
+ 
+-- 
+2.30.2
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index a4e05a6e..d4a7a8ac 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -55,7 +55,9 @@ SRC_URI:append:fvp-base = " file://bootargs.cfg"
 #
 # FVP BASE ARM32
 #
-SRC_URI:append:fvp-base-arm32 = " file://0001-Add-vexpress_aemv8a_aarch32-variant.patch"
+SRC_URI:append:fvp-base-arm32 = " file://0001-Add-vexpress_aemv8a_aarch32-variant.patch \
+				  file://0002-Revert-vexpress64-Enable-OF_CONTROL-and-OF_BOARD-for.patch \
+				"
 
 #
 # FVP BASER
-- 
2.17.1


