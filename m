Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 395A3C433FE
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 16:00:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.13255.1637683198601641667
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Nov 2021 07:59:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3ACC51FB;
	Tue, 23 Nov 2021 07:59:58 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.78.53])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 385B33F5A1;
	Tue, 23 Nov 2021 07:59:55 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Arpita.S.K@arm.com,
	vishnu.banavath@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Rui Miguel Silva <rui.silva@arm.com>,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Jon Mason <jon.mason@arm.com>
Subject: [PATCH][honister 09/19] arm-bsp/u-boot: introducing corstone1000 FVP
 machine
Date: Tue, 23 Nov 2021 15:59:16 +0000
Message-Id: <20211123155926.31743-10-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211123155926.31743-1-abdellatif.elkhlifi@arm.com>
References: <20211123155926.31743-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 23 Nov 2021 16:00:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2438

From: Rui Miguel Silva <rui.silva@arm.com>

Add support for corstone1000-fvp machine which have a cortex-a35
aarch64, this will boot till u-boot prompt.

Remove kernel devicetree configuration and add the devicetree here and
enable it in the diphda defconfig.

Adds the build options required to support an RTC emulator which in
turn is required to support the UEFI functions GetTime()
and SetTime().

Change-Id: I0d66ece1193494bd2f59a9800d802dff1c4a0db6
Signed-off-by: Arpita S.K <Arpita.S.K@arm.com>
Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../conf/machine/include/corstone1000.inc     |   12 +
 .../0001-arm-add-corstone1000-platform.patch  |  330 ++
 ...e1000-enable-devicetree-in-defconfig.patch |   59 +
 ...3-usb-common-move-urb-code-to-common.patch |  508 +++
 .../0004-usb-add-isp1760-family-driver.patch  | 3797 +++++++++++++++++
 ...one1000-enable-isp1763-and-usb-stack.patch |   92 +
 ...-corstone1000-enable-support-for-FVP.patch |  240 ++
 ...-sharing-PSCI-DTS-node-between-FVP-a.patch |   34 +
 ...rm-corstone1000-Emulated-RTC-Support.patch |   32 +
 ...-corstone1000-execute-uboot-from-DDR.patch |   31 +
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   21 +
 11 files changed, 5156 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-arm-add-corstone1000-platform.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-arm-corstone1000-enable-devicetree-in-defconfig.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-usb-common-move-urb-code-to-common.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-usb-add-isp1760-family-driver.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-corstone1000-enable-isp1763-and-usb-stack.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-corstone1000-enable-support-for-FVP.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm-corstone1000-sharing-PSCI-DTS-node-between-FVP-a.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm-corstone1000-Emulated-RTC-Support.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm-corstone1000-execute-uboot-from-DDR.patch

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-arm-bsp/conf/machine/include/corstone1000.inc
index b38e35a..2c2293f 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -7,6 +7,18 @@ PREFERRED_VERSION_trusted-firmware-m ?= "1.4%"
 TFM_PLATFORM = "arm/corstone1000"
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-m"
 
+# u-boot
+PREFERRED_VERSION_u-boot ?= "2021.07"
+EXTRA_IMAGEDEPENDS += "u-boot"
+
+UBOOT_CONFIG ??= "EFI"
+UBOOT_CONFIG[EFI] = "corstone1000_defconfig"
+UBOOT_ENTRYPOINT  = "0x80000000"
+UBOOT_LOADADDRESS = "0x80000000"
+UBOOT_BOOTARGS = "earlycon=pl011,0x1a510000 console=ttyAMA0 loglevel=9"
+UBOOT_ARCH = "arm"
+UBOOT_EXTLINUX = "0"
+
 # Linux kernel
 PREFERRED_PROVIDER_virtual/kernel:forcevariable = "linux-yocto"
 PREFERRED_VERSION_linux-yocto = "5.10%"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-arm-add-corstone1000-platform.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-arm-add-corstone1000-platform.patch
new file mode 100644
index 0000000..1fe0fb8
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0001-arm-add-corstone1000-platform.patch
@@ -0,0 +1,330 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From 3feb071c77bb6297165c7b671b5c92d6ba306238 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Fri, 4 Jun 2021 10:58:24 +0100
+Subject: [PATCH 01/16] arm: add corstone1000 platform
+
+Add support for new corstone1000 platform.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
+---
+ arch/arm/Kconfig                |  9 ++++
+ board/armltd/corstone1000/Kconfig     | 12 +++++
+ board/armltd/corstone1000/MAINTAINERS |  6 +++
+ board/armltd/corstone1000/Makefile    |  7 +++
+ board/armltd/corstone1000/corstone1000.c    | 92 +++++++++++++++++++++++++++++++++
+ configs/corstone1000_defconfig        | 39 ++++++++++++++
+ include/configs/corstone1000.h        | 80 ++++++++++++++++++++++++++++
+ 7 files changed, 245 insertions(+)
+ create mode 100644 board/armltd/corstone1000/Kconfig
+ create mode 100644 board/armltd/corstone1000/MAINTAINERS
+ create mode 100644 board/armltd/corstone1000/Makefile
+ create mode 100644 board/armltd/corstone1000/corstone1000.c
+ create mode 100644 configs/corstone1000_defconfig
+ create mode 100644 include/configs/corstone1000.h
+
+diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
+index 0448787b8b..25d2a707be 100644
+--- a/arch/arm/Kconfig
++++ b/arch/arm/Kconfig
+@@ -1173,6 +1173,13 @@ config TARGET_VEXPRESS64_JUNO
+ 	select USB
+ 	select DM_USB
+ 
++config TARGET_CORSTONE1000
++	bool "Support Corstone1000 Platform"
++	select ARM64
++	select PL01X_SERIAL
++	select DM
++	select OF_BOARD
++
+ config TARGET_TOTAL_COMPUTE
+ 	bool "Support Total Compute Platform"
+ 	select ARM64
+@@ -1985,6 +1992,8 @@ source "arch/arm/mach-nexell/Kconfig"
+ 
+ source "board/armltd/total_compute/Kconfig"
+ 
++source "board/armltd/corstone1000/Kconfig"
++
+ source "board/bosch/shc/Kconfig"
+ source "board/bosch/guardian/Kconfig"
+ source "board/CarMediaLab/flea3/Kconfig"
+diff --git a/board/armltd/corstone1000/Kconfig b/board/armltd/corstone1000/Kconfig
+new file mode 100644
+index 000000000000..90e6b7af59cb
+--- /dev/null
++++ b/board/armltd/corstone1000/Kconfig
+@@ -0,0 +1,12 @@
++if TARGET_CORSTONE1000
++
++config SYS_BOARD
++	default "corstone1000"
++
++config SYS_VENDOR
++	default "armltd"
++
++config SYS_CONFIG_NAME
++	default "corstone1000"
++
++endif
+diff --git a/board/armltd/corstone1000/MAINTAINERS b/board/armltd/corstone1000/MAINTAINERS
+new file mode 100644
+index 000000000000..601cff17b666
+--- /dev/null
++++ b/board/armltd/corstone1000/MAINTAINERS
+@@ -0,0 +1,6 @@
++CORSTONE1000 BOARD
++M:	Rui Miguel Silva <rui.silva@linaro.org>
++S:	Maintained
++F:	board/armltd/corstone1000/
++F:	include/configs/corstone1000.h
++F:	configs/corstone1000_defconfig
+diff --git a/board/armltd/corstone1000/Makefile b/board/armltd/corstone1000/Makefile
+new file mode 100644
+index 000000000000..7bad6f57f1ce
+--- /dev/null
++++ b/board/armltd/corstone1000/Makefile
+@@ -0,0 +1,7 @@
++# SPDX-License-Identifier: GPL-2.0+
++#
++# (C) Copyright 2021 Arm Limited
++# (C) Copyright 2021 Linaro
++# Rui Miguel Silva <rui.silva@linaro.org>
++
++obj-y	:= corstone1000.o
+diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/corstone1000/corstone1000.c
+new file mode 100644
+index 000000000000..fe986ceba1c5
+--- /dev/null
++++ b/board/armltd/corstone1000/corstone1000.c
+@@ -0,0 +1,92 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * (C) Copyright 2021 ARM Limited
++ * (C) Copyright 2021 Linaro
++ * Rui Miguel Silva <rui.silva@linaro.org>
++ */
++
++#include <common.h>
++#include <dm.h>
++#include <dm/platform_data/serial_pl01x.h>
++#include <asm/armv8/mmu.h>
++#include <asm/global_data.h>
++
++
++static const struct pl01x_serial_plat serial_plat = {
++	.base = V2M_UART0,
++	.type = TYPE_PL011,
++	.clock = CONFIG_PL011_CLOCK,
++};
++
++U_BOOT_DRVINFO(corstone1000_serials) = {
++	.name = "serial_pl01x",
++	.plat = &serial_plat,
++};
++
++static struct mm_region corstone1000_mem_map[] = {
++	{
++		/* CVM */
++		.virt = 0x02000000UL,
++		.phys = 0x02000000UL,
++		.size = 0x02000000UL,
++		.attrs = PTE_BLOCK_MEMTYPE(MT_NORMAL) |
++			 PTE_BLOCK_INNER_SHARE
++	}, {
++		/* QSPI */
++		.virt = 0x08000000UL,
++		.phys = 0x08000000UL,
++		.size = 0x08000000UL,
++		.attrs = PTE_BLOCK_MEMTYPE(MT_NORMAL) |
++			 PTE_BLOCK_INNER_SHARE
++	}, {
++		/* Host Peripherals */
++		.virt = 0x1A000000UL,
++		.phys = 0x1A000000UL,
++		.size = 0x26000000UL,
++		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
++			 PTE_BLOCK_NON_SHARE |
++			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
++	}, {
++		/* OCVM */
++		.virt = 0x80000000UL,
++		.phys = 0x80000000UL,
++		.size = 0x80000000UL,
++		.attrs = PTE_BLOCK_MEMTYPE(MT_NORMAL) |
++			 PTE_BLOCK_INNER_SHARE
++	}, {
++		/* List terminator */
++		0,
++	}
++};
++
++struct mm_region *mem_map = corstone1000_mem_map;
++
++int board_init(void)
++{
++	return 0;
++}
++
++int dram_init(void)
++{
++	gd->ram_size = PHYS_SDRAM_1_SIZE;
++
++	return 0;
++}
++
++int dram_init_banksize(void)
++{
++	gd->bd->bi_dram[0].start = PHYS_SDRAM_1;
++	gd->bd->bi_dram[0].size = PHYS_SDRAM_1_SIZE;
++
++#ifdef PHYS_SDRAM_2
++	gd->bd->bi_dram[1].start = PHYS_SDRAM_2;
++	gd->bd->bi_dram[1].size = PHYS_SDRAM_2_SIZE;
++#endif
++
++
++	return 0;
++}
++
++void reset_cpu(ulong addr)
++{
++}
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defconfig
+new file mode 100644
+index 000000000000..47d4bf3771e0
+--- /dev/null
++++ b/configs/corstone1000_defconfig
+@@ -0,0 +1,39 @@
++CONFIG_ARM=y
++CONFIG_ARM64=y
++CONFIG_TARGET_CORSTONE1000=y
++CONFIG_SYS_TEXT_BASE=0x02100000
++CONFIG_SYS_MALLOC_F_LEN=0x2000
++CONFIG_NR_DRAM_BANKS=1
++CONFIG_IDENT_STRING=" corstone1000 aarch64 "
++CONFIG_BOOTDELAY=3
++CONFIG_OF_BOARD=y
++CONFIG_USE_BOOTARGS=y
++CONFIG_BOOTARGS="console=ttyAMA0 loglevel=9"
++# CONFIG_DISPLAY_CPUINFO is not set
++# CONFIG_DISPLAY_BOARDINFO is not set
++CONFIG_HUSH_PARSER=y
++CONFIG_SYS_PROMPT="corstone1000# "
++# CONFIG_CMD_CONSOLE is not set
++CONFIG_CMD_BOOTZ=y
++CONFIG_CMD_BOOTM=y
++# CONFIG_CMD_XIMG is not set
++# CONFIG_CMD_EDITENV is not set
++# CONFIG_CMD_ENV_EXISTS is not set
++# CONFIG_CMD_ARMFLASH=y
++# CONFIG_CMD_LOADS is not set
++# CONFIG_CMD_ITEST is not set
++# CONFIG_CMD_SETEXPR is not set
++CONFIG_CMD_DHCP=y
++# CONFIG_CMD_NFS is not set
++CONFIG_CMD_MII=y
++CONFIG_CMD_PING=y
++CONFIG_CMD_CACHE=y
++CONFIG_FIT=y
++# CONFIG_CMD_MISC is not set
++CONFIG_CMD_FAT=y
++CONFIG_DM=y
++# CONFIG_MMC is not set
++# CONFIG_MTD_NOR_FLASH=y
++CONFIG_DM_ETH=y
++CONFIG_DM_SERIAL=y
++CONFIG_OF_LIBFDT=y
+diff --git a/include/configs/corstone1000.h b/include/configs/corstone1000.h
+new file mode 100644
+index 000000000000..c8e630c5d857
+--- /dev/null
++++ b/include/configs/corstone1000.h
+@@ -0,0 +1,80 @@
++/* SPDX-License-Identifier: GPL-2.0+ */
++/*
++ * (C) Copyright 2020 ARM Limited
++ * (C) Copyright 2020 Linaro
++ * Rui Miguel Silva <rui.silva@linaro.org>
++ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ *
++ * Configuration for Corstone1000. Parts were derived from other ARM
++ * configurations.
++ */
++
++#ifndef __CORSTONE1000_H
++#define __CORSTONE1000_H
++
++#define CONFIG_SYS_INIT_SP_ADDR		(CONFIG_SYS_SDRAM_BASE + 0x03f00000)
++#define CONFIG_SKIP_LOWLEVEL_INIT
++
++#define CONFIG_SYS_HZ		1000
++
++#define V2M_SRAM0		0x02000000
++#define V2M_QSPI		0x08000000
++
++#define V2M_DEBUG		0x10000000
++#define V2M_BASE_PERIPH		0x1A000000
++
++#define V2M_BASE		0x80000000
++
++#define V2M_PERIPH_OFFSET(x)	(x << 16)
++
++#define V2M_SYSID		(V2M_BASE_PERIPH)
++#define V2M_SYSCTL		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(1))
++
++#define V2M_COUNTER_CTL		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(32))
++#define V2M_COUNTER_READ	(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(33))
++
++#define V2M_TIMER_CTL		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(34))
++#define V2M_TIMER_BASE0		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(35))
++
++#define V2M_UART0		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(81))
++#define V2M_UART1		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(82))
++
++#define CONFIG_PL011_CLOCK	50000000
++
++/* Physical Memory Map */
++#define PHYS_SDRAM_1		(V2M_BASE)
++#define PHYS_SDRAM_2		(V2M_QSPI)
++
++/* Top 16MB reserved for secure world use (maybe not needed) */
++#define DRAM_SEC_SIZE		0x01000000
++#define PHYS_SDRAM_1_SIZE	0x80000000 - DRAM_SEC_SIZE
++
++#define PHYS_SDRAM_2_SIZE	0x02000000
++
++/* Size of malloc() pool */
++#define CONFIG_SYS_MALLOC_LEN	(CONFIG_ENV_SIZE + (8 << 20))
++
++/* Miscellaneous configurable options */
++#define CONFIG_SYS_LOAD_ADDR	(V2M_BASE + 0x10000000)
++
++#define CONFIG_SYS_SDRAM_BASE	PHYS_SDRAM_1
++
++/* Monitor Command Prompt */
++#define CONFIG_SYS_CBSIZE		512	/* Console I/O Buffer Size */
++#define CONFIG_SYS_MAXARGS		64	/* max command args */
++
++#define CONFIG_EXTRA_ENV_SETTINGS					\
++				"fdt_addr=0x08330000\0"		\
++				"fdt_addr_r=0x82000000\0"		\
++				"kernel_addr=0x08430000\0"		\
++				"kernel_addr_r=0x82100000\0"		\
++				"fdt_high=0xffffffff\0"
++
++#define CONFIG_BOOTCOMMAND					\
++				"echo Copying devicetree to memory ... ;" \
++				"cp.b $fdt_addr $fdt_addr_r 0x100000;" \
++				"echo Copying Kernel to memory ... ;" \
++				"cp.b $kernel_addr $kernel_addr_r 0xa00000;" \
++				"bootm $kernel_addr_r - $fdt_addr_r; "
++
++#endif
+-- 
+2.33.0
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-arm-corstone1000-enable-devicetree-in-defconfig.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-arm-corstone1000-enable-devicetree-in-defconfig.patch
new file mode 100644
index 0000000..df8c6ed
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0002-arm-corstone1000-enable-devicetree-in-defconfig.patch
@@ -0,0 +1,59 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From 1a034bd9397f96939d58a86e9cf8cd9c206db647 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Tue, 22 Jun 2021 17:00:24 +0100
+Subject: [PATCH 02/16] arm: corstone1000: enable devicetree in defconfig
+
+Add support and setup the default device tree for corstone1000.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
+---
+ configs/corstone1000_defconfig |  3 ++-
+ include/configs/corstone1000.h | 10 +++-------
+ 2 files changed, 5 insertions(+), 8 deletions(-)
+
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defconfig
+index bc983e6555..54c746d829 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -6,7 +6,8 @@ CONFIG_SYS_MALLOC_F_LEN=0x2000
+ CONFIG_NR_DRAM_BANKS=1
+ CONFIG_IDENT_STRING=" corstone1000 aarch64 "
+ CONFIG_BOOTDELAY=3
+-CONFIG_OF_BOARD=y
++CONFIG_OF_CONTROL=y
++CONFIG_DEFAULT_DEVICE_TREE="corstone1000-mps3"
+ CONFIG_USE_BOOTARGS=y
+ CONFIG_BOOTARGS="console=ttyAMA0 loglevel=9"
+ # CONFIG_DISPLAY_CPUINFO is not set
+diff --git a/include/configs/corstone1000.h b/include/configs/corstone1000.h
+index 1fe909463f..389ac45a58 100644
+--- a/include/configs/corstone1000.h
++++ b/include/configs/corstone1000.h
+@@ -64,17 +64,13 @@
+ #define CONFIG_SYS_MAXARGS		64	/* max command args */
+ 
+ #define CONFIG_EXTRA_ENV_SETTINGS					\
+-				"fdt_addr=0x08330000\0"		\
+ 				"fdt_addr_r=0x82000000\0"		\
+-				"kernel_addr=0x08430000\0"		\
++				"kernel_addr=0x08330000\0"		\
+ 				"kernel_addr_r=0x82100000\0"		\
+ 				"fdt_high=0xffffffff\0"
+ 
+ #define CONFIG_BOOTCOMMAND					\
+-				"echo Copying devicetree to memory ... ;" \
+-				"cp.b $fdt_addr $fdt_addr_r 0x100000;" \
+ 				"echo Copying Kernel to memory ... ;" \
+-				"cp.b $kernel_addr $kernel_addr_r 0xa00000;" \
+-				"bootm $kernel_addr_r - $fdt_addr_r; "
+-
++                                "cp.b $kernel_addr $kernel_addr_r 0xc00000;" \
++                                "booti $kernel_addr_r - $fdtcontroladdr; "
+ #endif
+-- 
+2.33.0
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-usb-common-move-urb-code-to-common.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-usb-common-move-urb-code-to-common.patch
new file mode 100644
index 0000000..1a73d52
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0003-usb-common-move-urb-code-to-common.patch
@@ -0,0 +1,508 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From 84b3b8f2443d0b4f6ac8ef95c941b27d734afbde Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Mon, 28 Jun 2021 23:20:55 +0100
+Subject: [PATCH 03/16] usb: common: move urb code to common
+
+Move urb code from musb only use to a more common scope, so other
+drivers in the future can use the handling of urb in usb.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ drivers/usb/common/Makefile                   |   2 +
+ drivers/usb/common/usb_urb.c                  | 160 ++++++++++++++++++
+ drivers/usb/host/r8a66597-hcd.c               |  30 +---
+ drivers/usb/musb-new/musb_core.c              |   2 +-
+ drivers/usb/musb-new/musb_host.c              |   2 +-
+ drivers/usb/musb-new/musb_host.h              |   2 +-
+ drivers/usb/musb-new/musb_uboot.c             |  38 +----
+ drivers/usb/musb-new/musb_uboot.h             |   2 +-
+ .../linux/usb/usb_urb_compat.h                |  52 ++++--
+ include/usb_defs.h                            |  32 ++++
+ 10 files changed, 240 insertions(+), 82 deletions(-)
+ create mode 100644 drivers/usb/common/usb_urb.c
+ rename drivers/usb/musb-new/usb-compat.h => include/linux/usb/usb_urb_compat.h (57%)
+
+diff --git a/drivers/usb/common/Makefile b/drivers/usb/common/Makefile
+index 3bedbf213f..dc05cb0a50 100644
+--- a/drivers/usb/common/Makefile
++++ b/drivers/usb/common/Makefile
+@@ -4,5 +4,7 @@
+ #
+ 
+ obj-$(CONFIG_$(SPL_)DM_USB) += common.o
++obj-$(CONFIG_USB_MUSB_HCD) += usb_urb.o
++obj-$(CONFIG_USB_MUSB_UDC) += usb_urb.o
+ obj-$(CONFIG_USB_EHCI_FSL) += fsl-dt-fixup.o fsl-errata.o
+ obj-$(CONFIG_USB_XHCI_FSL) += fsl-dt-fixup.o fsl-errata.o
+diff --git a/drivers/usb/common/usb_urb.c b/drivers/usb/common/usb_urb.c
+new file mode 100644
+index 0000000000..be3b6b9f32
+--- /dev/null
++++ b/drivers/usb/common/usb_urb.c
+@@ -0,0 +1,160 @@
++// SPDX-License-Identifier: GPL-2.0
++/*
++ * Common code for usb urb handling, based on the musb-new code
++ *
++ * Copyright 2021 Linaro, Rui Miguel Silva <rui.silva@linaro.org>
++ *
++ */
++
++#include <dm/device.h>
++#include <dm/device_compat.h>
++#include <linux/usb/usb_urb_compat.h>
++
++#include <time.h>
++#include <usb.h>
++
++#if CONFIG_IS_ENABLED(DM_USB)
++struct usb_device *usb_dev_get_parent(struct usb_device *udev)
++{
++	struct udevice *parent = udev->dev->parent;
++
++	/*
++	 * When called from usb-uclass.c: usb_scan_device() udev->dev points
++	 * to the parent udevice, not the actual udevice belonging to the
++	 * udev as the device is not instantiated yet.
++	 *
++	 * If dev is an usb-bus, then we are called from usb_scan_device() for
++	 * an usb-device plugged directly into the root port, return NULL.
++	 */
++	if (device_get_uclass_id(udev->dev) == UCLASS_USB)
++		return NULL;
++
++	/*
++	 * If these 2 are not the same we are being called from
++	 * usb_scan_device() and udev itself is the parent.
++	 */
++	if (dev_get_parent_priv(udev->dev) != udev)
++		return udev;
++
++	/* We are being called normally, use the parent pointer */
++	if (device_get_uclass_id(parent) == UCLASS_USB_HUB)
++		return dev_get_parent_priv(parent);
++
++	return NULL;
++}
++#else
++struct usb_device *usb_dev_get_parent(struct usb_device *udev)
++{
++	return udev->parent;
++}
++#endif
++
++static void usb_urb_complete(struct urb *urb)
++{
++	urb->dev->status &= ~USB_ST_NOT_PROC;
++	urb->dev->act_len = urb->actual_length;
++
++	if (urb->status == -EINPROGRESS)
++		urb->status = 0;
++}
++
++void usb_urb_fill(struct urb *urb, struct usb_host_endpoint *hep,
++		  struct usb_device *dev, int endpoint_type,
++		  unsigned long pipe, void *buffer, int len,
++		  struct devrequest *setup, int interval)
++{
++	int epnum = usb_pipeendpoint(pipe);
++	int is_in = usb_pipein(pipe);
++	u16 maxpacketsize = is_in ? dev->epmaxpacketin[epnum] :
++					dev->epmaxpacketout[epnum];
++
++	memset(urb, 0, sizeof(struct urb));
++	memset(hep, 0, sizeof(struct usb_host_endpoint));
++	INIT_LIST_HEAD(&hep->urb_list);
++	INIT_LIST_HEAD(&urb->urb_list);
++	urb->ep = hep;
++	urb->complete = usb_urb_complete;
++	urb->status = -EINPROGRESS;
++	urb->dev = dev;
++	urb->pipe = pipe;
++	urb->transfer_buffer = buffer;
++	urb->transfer_dma = (unsigned long)buffer;
++	urb->transfer_buffer_length = len;
++	urb->setup_packet = (unsigned char *)setup;
++
++	urb->ep->desc.wMaxPacketSize = __cpu_to_le16(maxpacketsize);
++	urb->ep->desc.bmAttributes = endpoint_type;
++	urb->ep->desc.bEndpointAddress = ((is_in ? USB_DIR_IN : USB_DIR_OUT) |
++					  epnum);
++	urb->ep->desc.bInterval = interval;
++}
++
++int usb_urb_submit(struct usb_hcd *hcd, struct urb *urb)
++{
++	const struct usb_urb_ops *ops = hcd->urb_ops;
++	unsigned long timeout;
++	int ret;
++
++	if (!ops)
++		return -EINVAL;
++
++	ret = ops->urb_enqueue(hcd, urb, 0);
++	if (ret < 0) {
++		printf("Failed to enqueue URB to controller\n");
++		return ret;
++	}
++
++	timeout = get_timer(0) + USB_TIMEOUT_MS(urb->pipe);
++	do {
++		if (ctrlc())
++			return -EIO;
++		ops->isr(0, hcd);
++	} while (urb->status == -EINPROGRESS && get_timer(0) < timeout);
++
++	if (urb->status == -EINPROGRESS)
++		ops->urb_dequeue(hcd, urb, -ETIME);
++
++	return urb->status;
++}
++
++int usb_urb_submit_control(struct usb_hcd *hcd, struct urb *urb,
++			   struct usb_host_endpoint *hep,
++			   struct usb_device *dev, unsigned long pipe,
++			   void *buffer, int len, struct devrequest *setup,
++			   int interval, enum usb_device_speed speed)
++{
++	const struct usb_urb_ops *ops = hcd->urb_ops;
++
++	usb_urb_fill(urb, hep, dev, USB_ENDPOINT_XFER_CONTROL, pipe, buffer,
++		     len, setup, 0);
++
++	/* Fix speed for non hub-attached devices */
++	if (!usb_dev_get_parent(dev)) {
++		dev->speed = speed;
++		if (ops->hub_control)
++			return ops->hub_control(hcd, dev, pipe, buffer, len,
++						setup);
++	}
++
++	return usb_urb_submit(hcd, urb);
++}
++
++int usb_urb_submit_bulk(struct usb_hcd *hcd, struct urb *urb,
++			struct usb_host_endpoint *hep, struct usb_device *dev,
++			unsigned long pipe, void *buffer, int len)
++{
++	usb_urb_fill(urb, hep, dev, USB_ENDPOINT_XFER_BULK, pipe, buffer, len,
++		     NULL, 0);
++
++	return usb_urb_submit(hcd, urb);
++}
++
++int usb_urb_submit_irq(struct usb_hcd *hcd, struct urb *urb,
++		       struct usb_host_endpoint *hep, struct usb_device *dev,
++		       unsigned long pipe, void *buffer, int len, int interval)
++{
++	usb_urb_fill(urb, hep, dev, USB_ENDPOINT_XFER_INT, pipe, buffer, len,
++		     NULL, interval);
++
++	return usb_urb_submit(hcd, urb);
++}
+diff --git a/drivers/usb/host/r8a66597-hcd.c b/drivers/usb/host/r8a66597-hcd.c
+index f1fc93f3d4..3ccbc16da3 100644
+--- a/drivers/usb/host/r8a66597-hcd.c
++++ b/drivers/usb/host/r8a66597-hcd.c
+@@ -14,6 +14,7 @@
+ #include <dm/device_compat.h>
+ #include <linux/delay.h>
+ #include <linux/iopoll.h>
++#include <linux/usb/usb_urb_compat.h>
+ #include <power/regulator.h>
+ 
+ #include "r8a66597.h"
+@@ -24,35 +25,6 @@
+ #define R8A66597_DPRINT(...)
+ #endif
+ 
+-static inline struct usb_device *usb_dev_get_parent(struct usb_device *udev)
+-{
+-	struct udevice *parent = udev->dev->parent;
+-
+-	/*
+-	 * When called from usb-uclass.c: usb_scan_device() udev->dev points
+-	 * to the parent udevice, not the actual udevice belonging to the
+-	 * udev as the device is not instantiated yet.
+-	 *
+-	 * If dev is an usb-bus, then we are called from usb_scan_device() for
+-	 * an usb-device plugged directly into the root port, return NULL.
+-	 */
+-	if (device_get_uclass_id(udev->dev) == UCLASS_USB)
+-		return NULL;
+-
+-	/*
+-	 * If these 2 are not the same we are being called from
+-	 * usb_scan_device() and udev itself is the parent.
+-	 */
+-	if (dev_get_parent_priv(udev->dev) != udev)
+-		return udev;
+-
+-	/* We are being called normally, use the parent pointer */
+-	if (device_get_uclass_id(parent) == UCLASS_USB_HUB)
+-		return dev_get_parent_priv(parent);
+-
+-	return NULL;
+-}
+-
+ static void get_hub_data(struct usb_device *dev, u16 *hub_devnum, u16 *hubport)
+ {
+ 	struct usb_device *parent = usb_dev_get_parent(dev);
+diff --git a/drivers/usb/musb-new/musb_core.c b/drivers/usb/musb-new/musb_core.c
+index 22811a5efb..d1d4ee2da3 100644
+--- a/drivers/usb/musb-new/musb_core.c
++++ b/drivers/usb/musb-new/musb_core.c
+@@ -89,9 +89,9 @@
+ #include <linux/usb/ch9.h>
+ #include <linux/usb/gadget.h>
+ #include <linux/usb/musb.h>
++#include <linux/usb/usb_urb_compat.h>
+ #include <asm/io.h>
+ #include "linux-compat.h"
+-#include "usb-compat.h"
+ #endif
+ 
+ #include "musb_core.h"
+diff --git a/drivers/usb/musb-new/musb_host.c b/drivers/usb/musb-new/musb_host.c
+index acb2d40f3b..e5905d90d6 100644
+--- a/drivers/usb/musb-new/musb_host.c
++++ b/drivers/usb/musb-new/musb_host.c
+@@ -26,8 +26,8 @@
+ #include <dm/device_compat.h>
+ #include <usb.h>
+ #include <linux/bug.h>
++#include <linux/usb/usb_urb_compat.h>
+ #include "linux-compat.h"
+-#include "usb-compat.h"
+ #endif
+ 
+ #include "musb_core.h"
+diff --git a/drivers/usb/musb-new/musb_host.h b/drivers/usb/musb-new/musb_host.h
+index afc8fa35a7..5a604bdb0c 100644
+--- a/drivers/usb/musb-new/musb_host.h
++++ b/drivers/usb/musb-new/musb_host.h
+@@ -10,7 +10,7 @@
+ #ifndef _MUSB_HOST_H
+ #define _MUSB_HOST_H
+ #ifdef __UBOOT__
+-#include "usb-compat.h"
++#include <linux/usb/usb_urb_compat.h>
+ #endif
+ 
+ static inline struct usb_hcd *musb_to_hcd(struct musb *musb)
+diff --git a/drivers/usb/musb-new/musb_uboot.c b/drivers/usb/musb-new/musb_uboot.c
+index 8ac2f0a78a..85794356b0 100644
+--- a/drivers/usb/musb-new/musb_uboot.c
++++ b/drivers/usb/musb-new/musb_uboot.c
+@@ -8,10 +8,10 @@
+ #include <linux/errno.h>
+ #include <linux/usb/ch9.h>
+ #include <linux/usb/gadget.h>
++#include <linux/usb/usb_urb_compat.h>
+ 
+ #include <usb.h>
+ #include "linux-compat.h"
+-#include "usb-compat.h"
+ #include "musb_core.h"
+ #include "musb_host.h"
+ #include "musb_gadget.h"
+@@ -453,39 +453,3 @@ struct musb *musb_register(struct musb_hdrc_platform_data *plat, void *bdata,
+ 
+ 	return *musbp;
+ }
+-
+-#if CONFIG_IS_ENABLED(DM_USB)
+-struct usb_device *usb_dev_get_parent(struct usb_device *udev)
+-{
+-	struct udevice *parent = udev->dev->parent;
+-
+-	/*
+-	 * When called from usb-uclass.c: usb_scan_device() udev->dev points
+-	 * to the parent udevice, not the actual udevice belonging to the
+-	 * udev as the device is not instantiated yet.
+-	 *
+-	 * If dev is an usb-bus, then we are called from usb_scan_device() for
+-	 * an usb-device plugged directly into the root port, return NULL.
+-	 */
+-	if (device_get_uclass_id(udev->dev) == UCLASS_USB)
+-		return NULL;
+-
+-	/*
+-	 * If these 2 are not the same we are being called from
+-	 * usb_scan_device() and udev itself is the parent.
+-	 */
+-	if (dev_get_parent_priv(udev->dev) != udev)
+-		return udev;
+-
+-	/* We are being called normally, use the parent pointer */
+-	if (device_get_uclass_id(parent) == UCLASS_USB_HUB)
+-		return dev_get_parent_priv(parent);
+-
+-	return NULL;
+-}
+-#else
+-struct usb_device *usb_dev_get_parent(struct usb_device *udev)
+-{
+-	return udev->parent;
+-}
+-#endif
+diff --git a/drivers/usb/musb-new/musb_uboot.h b/drivers/usb/musb-new/musb_uboot.h
+index 18282efccc..6b162f03b1 100644
+--- a/drivers/usb/musb-new/musb_uboot.h
++++ b/drivers/usb/musb-new/musb_uboot.h
+@@ -8,8 +8,8 @@
+ #define __MUSB_UBOOT_H__
+ 
+ #include <usb.h>
++#include <linux/usb/usb_urb_compat.h>
+ #include "linux-compat.h"
+-#include "usb-compat.h"
+ #include "musb_core.h"
+ 
+ struct musb_host_data {
+diff --git a/drivers/usb/musb-new/usb-compat.h b/include/linux/usb/usb_urb_compat.h
+similarity index 57%
+rename from drivers/usb/musb-new/usb-compat.h
+rename to include/linux/usb/usb_urb_compat.h
+index 1c66c4fe36..438e70b56a 100644
+--- a/drivers/usb/musb-new/usb-compat.h
++++ b/include/linux/usb/usb_urb_compat.h
+@@ -1,16 +1,31 @@
+-#ifndef __USB_COMPAT_H__
+-#define __USB_COMPAT_H__
++#ifndef __USB_URB_COMPAT_H__
++#define __USB_URB_COMPAT_H__
+ 
+-#include "usb.h"
++#include <linux/compat.h>
++#include <usb.h>
+ 
+ struct udevice;
++struct urb;
++struct usb_hcd;
++
++
++struct usb_urb_ops {
++	int (*urb_enqueue)(struct usb_hcd *hcd, struct urb *urb,
++			   gfp_t mem_flags);
++	int (*urb_dequeue)(struct usb_hcd *hcd, struct urb *urb, int status);
++	int (*hub_control)(struct usb_hcd *hcd, struct usb_device *dev,
++			   unsigned long pipe, void *buffer, int len,
++			   struct devrequest *setup);
++	irqreturn_t (*isr)(int irq, void *priv);
++};
+ 
+ struct usb_hcd {
+ 	void *hcd_priv;
++	const struct usb_urb_ops *urb_ops;
+ };
+ 
+ struct usb_host_endpoint {
+-	struct usb_endpoint_descriptor		desc;
++	struct usb_endpoint_descriptor desc;
+ 	struct list_head urb_list;
+ 	void *hcpriv;
+ };
+@@ -23,8 +38,6 @@ struct usb_host_endpoint {
+ #define URB_SHORT_NOT_OK	0x0001	/* report short reads as errors */
+ #define URB_ZERO_PACKET		0x0040	/* Finish bulk OUT with short packet */
+ 
+-struct urb;
+-
+ typedef void (*usb_complete_t)(struct urb *);
+ 
+ struct urb {
+@@ -68,12 +81,27 @@ static inline int usb_hcd_unmap_urb_for_dma(struct usb_hcd *hcd,
+ 	return 0;
+ }
+ 
+-/**
+- * usb_dev_get_parent() - Get the parent of a USB device
+- *
+- * @udev: USB struct containing information about the device
+- * @return associated device for which udev == dev_get_parent_priv(dev)
+- */
+ struct usb_device *usb_dev_get_parent(struct usb_device *udev);
+ 
++int usb_urb_submit_control(struct usb_hcd *hcd, struct urb *urb,
++			   struct usb_host_endpoint *hep,
++			   struct usb_device *dev, unsigned long pipe,
++			   void *buffer, int len, struct devrequest *setup,
++			   int interval, enum usb_device_speed speed);
++
++int usb_urb_submit_bulk(struct usb_hcd *hcd, struct urb *urb,
++			struct usb_host_endpoint *hep, struct usb_device *dev,
++			unsigned long pipe, void *buffer, int len);
++
++int usb_urb_submit_irq(struct usb_hcd *hcd, struct urb *urb,
++		       struct usb_host_endpoint *hep, struct usb_device *dev,
++		       unsigned long pipe, void *buffer, int len, int interval);
++
++void usb_urb_fill(struct urb *urb, struct usb_host_endpoint *hep,
++		  struct usb_device *dev, int endpoint_type,
++		  unsigned long pipe, void *buffer, int len,
++		  struct devrequest *setup, int interval);
++
++int usb_urb_submit(struct usb_hcd *hcd, struct urb *urb);
++
+ #endif /* __USB_COMPAT_H__ */
+diff --git a/include/usb_defs.h b/include/usb_defs.h
+index 6dd2c997f9..ec00161710 100644
+--- a/include/usb_defs.h
++++ b/include/usb_defs.h
+@@ -81,6 +81,32 @@
+ #define EndpointOutRequest \
+ 	((USB_DIR_OUT | USB_TYPE_STANDARD | USB_RECIP_INTERFACE) << 8)
+ 
++/* class requests from the USB 2.0 hub spec, table 11-15 */
++#define HUB_CLASS_REQ(dir, type, request) ((((dir) | (type)) << 8) | (request))
++/* GetBusState and SetHubDescriptor are optional, omitted */
++#define ClearHubFeature		HUB_CLASS_REQ(USB_DIR_OUT, USB_RT_HUB, \
++					      USB_REQ_CLEAR_FEATURE)
++#define ClearPortFeature	HUB_CLASS_REQ(USB_DIR_OUT, USB_RT_PORT, \
++					      USB_REQ_CLEAR_FEATURE)
++#define GetHubDescriptor	HUB_CLASS_REQ(USB_DIR_IN, USB_RT_HUB, \
++					      USB_REQ_GET_DESCRIPTOR)
++#define GetHubStatus		HUB_CLASS_REQ(USB_DIR_IN, USB_RT_HUB, \
++					      USB_REQ_GET_STATUS)
++#define GetPortStatus		HUB_CLASS_REQ(USB_DIR_IN, USB_RT_PORT, \
++					      USB_REQ_GET_STATUS)
++#define SetHubFeature		HUB_CLASS_REQ(USB_DIR_OUT, USB_RT_HUB, \
++					      USB_REQ_SET_FEATURE)
++#define SetPortFeature		HUB_CLASS_REQ(USB_DIR_OUT, USB_RT_PORT, \
++					      USB_REQ_SET_FEATURE)
++#define ClearTTBuffer		HUB_CLASS_REQ(USB_DIR_OUT, USB_RT_PORT, \
++					      HUB_CLEAR_TT_BUFFER)
++#define ResetTT			HUB_CLASS_REQ(USB_DIR_OUT, USB_RT_PORT, \
++					      HUB_RESET_TT)
++#define GetTTState		HUB_CLASS_REQ(USB_DIR_IN, USB_RT_PORT, \
++					      HUB_GET_TT_STATE)
++#define StopTT			HUB_CLASS_REQ(USB_DIR_OUT, USB_RT_PORT, \
++					      HUB_STOP_TT)
++
+ /* Descriptor types */
+ #define USB_DT_DEVICE        0x01
+ #define USB_DT_CONFIG        0x02
+@@ -289,10 +315,16 @@
+ #define USB_SS_PORT_STAT_C_CONFIG_ERROR	0x0080
+ 
+ /* wHubCharacteristics (masks) */
++#define HUB_CHAR_COMMON_OCPM        0x0000 /* All ports Over-Current reporting */
++#define HUB_CHAR_INDV_PORT_LPSM     0x0001 /* per-port power control */
++#define HUB_CHAR_NO_LPSM            0x0002 /* no power switching */
+ #define HUB_CHAR_LPSM               0x0003
+ #define HUB_CHAR_COMPOUND           0x0004
++#define HUB_CHAR_INDV_PORT_OCPM     0x0008 /* per-port Over-current reporting */
++#define HUB_CHAR_NO_OCPM            0x0010 /* No Over-current Protection support */
+ #define HUB_CHAR_OCPM               0x0018
+ #define HUB_CHAR_TTTT               0x0060 /* TT Think Time mask */
++#define HUB_CHAR_PORTIND            0x0080 /* per-port indicators (LEDs) */
+ 
+ /*
+  * Hub Status & Hub Change bit masks
+-- 
+2.33.0
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-usb-add-isp1760-family-driver.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-usb-add-isp1760-family-driver.patch
new file mode 100644
index 0000000..9d75164
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0004-usb-add-isp1760-family-driver.patch
@@ -0,0 +1,3797 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From a007c43ab35e81bb609e9af28ebe4f73ee196823 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Mon, 28 Jun 2021 23:31:25 +0100
+Subject: [PATCH 04/16] usb: add isp1760 family driver
+
+ISP1760/61/63 are a family of usb controllers, blah, blah, more info
+here.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ Makefile                            |    1 +
+ drivers/usb/Kconfig                 |    2 +
+ drivers/usb/common/Makefile         |    1 +
+ drivers/usb/isp1760/Kconfig         |   13 +
+ drivers/usb/isp1760/Makefile        |    6 +
+ drivers/usb/isp1760/isp1760-core.c  |  378 ++++
+ drivers/usb/isp1760/isp1760-core.h  |   96 +
+ drivers/usb/isp1760/isp1760-hcd.c   | 2574 +++++++++++++++++++++++++++
+ drivers/usb/isp1760/isp1760-hcd.h   |   82 +
+ drivers/usb/isp1760/isp1760-if.c    |  127 ++
+ drivers/usb/isp1760/isp1760-regs.h  |  292 +++
+ drivers/usb/isp1760/isp1760-uboot.c |   64 +
+ drivers/usb/isp1760/isp1760-uboot.h |   27 +
+ 13 files changed, 3663 insertions(+)
+ create mode 100644 drivers/usb/isp1760/Kconfig
+ create mode 100644 drivers/usb/isp1760/Makefile
+ create mode 100644 drivers/usb/isp1760/isp1760-core.c
+ create mode 100644 drivers/usb/isp1760/isp1760-core.h
+ create mode 100644 drivers/usb/isp1760/isp1760-hcd.c
+ create mode 100644 drivers/usb/isp1760/isp1760-hcd.h
+ create mode 100644 drivers/usb/isp1760/isp1760-if.c
+ create mode 100644 drivers/usb/isp1760/isp1760-regs.h
+ create mode 100644 drivers/usb/isp1760/isp1760-uboot.c
+ create mode 100644 drivers/usb/isp1760/isp1760-uboot.h
+
+diff --git a/Makefile b/Makefile
+index 2ab9c53192..570e35d566 100644
+--- a/Makefile
++++ b/Makefile
+@@ -828,6 +828,7 @@ libs-y += drivers/usb/host/
+ libs-y += drivers/usb/mtu3/
+ libs-y += drivers/usb/musb/
+ libs-y += drivers/usb/musb-new/
++libs-y += drivers/usb/isp1760/
+ libs-y += drivers/usb/phy/
+ libs-y += drivers/usb/ulpi/
+ libs-y += cmd/
+diff --git a/drivers/usb/Kconfig b/drivers/usb/Kconfig
+index f6975730bf..6f7b4d4db4 100644
+--- a/drivers/usb/Kconfig
++++ b/drivers/usb/Kconfig
+@@ -78,6 +78,8 @@ source "drivers/usb/musb/Kconfig"
+ 
+ source "drivers/usb/musb-new/Kconfig"
+ 
++source "drivers/usb/isp1760/Kconfig"
++
+ source "drivers/usb/emul/Kconfig"
+ 
+ source "drivers/usb/phy/Kconfig"
+diff --git a/drivers/usb/common/Makefile b/drivers/usb/common/Makefile
+index dc05cb0a50..f08b064d24 100644
+--- a/drivers/usb/common/Makefile
++++ b/drivers/usb/common/Makefile
+@@ -4,6 +4,7 @@
+ #
+ 
+ obj-$(CONFIG_$(SPL_)DM_USB) += common.o
++obj-$(CONFIG_USB_ISP1760) += usb_urb.o
+ obj-$(CONFIG_USB_MUSB_HCD) += usb_urb.o
+ obj-$(CONFIG_USB_MUSB_UDC) += usb_urb.o
+ obj-$(CONFIG_USB_EHCI_FSL) += fsl-dt-fixup.o fsl-errata.o
+diff --git a/drivers/usb/isp1760/Kconfig b/drivers/usb/isp1760/Kconfig
+new file mode 100644
+index 0000000000..e76fb5e4cc
+--- /dev/null
++++ b/drivers/usb/isp1760/Kconfig
+@@ -0,0 +1,13 @@
++# SPDX-License-Identifier: GPL-2.0
++
++config USB_ISP1760
++	tristate "NXP ISP 1760/1761/1763 support"
++	depends on DM_USB
++	select USB_HOST
++	help
++	  Say Y or M here if your system as an ISP1760/1761/1763 USB host
++	  controller.
++
++	  This USB controller is usually attached to a non-DMA-Master
++	  capable bus.
++
+diff --git a/drivers/usb/isp1760/Makefile b/drivers/usb/isp1760/Makefile
+new file mode 100644
+index 0000000000..2c809c01b1
+--- /dev/null
++++ b/drivers/usb/isp1760/Makefile
+@@ -0,0 +1,6 @@
++# SPDX-License-Identifier: GPL-2.0
++isp1760-y := isp1760-core.o isp1760-if.o isp1760-uboot.o isp1760-hcd.o
++
++#isp1760-hcd.o
++
++obj-$(CONFIG_USB_ISP1760) += isp1760.o
+diff --git a/drivers/usb/isp1760/isp1760-core.c b/drivers/usb/isp1760/isp1760-core.c
+new file mode 100644
+index 0000000000..3080595549
+--- /dev/null
++++ b/drivers/usb/isp1760/isp1760-core.c
+@@ -0,0 +1,378 @@
++// SPDX-License-Identifier: GPL-2.0
++/*
++ * Driver for the NXP ISP1760 chip
++ *
++ * Copyright 2021 Linaro, Rui Miguel Silva <rui.silva@linaro.org>
++ *
++ * This is based on linux kernel driver, original developed:
++ * Copyright 2014 Laurent Pinchart
++ * Copyright 2007 Sebastian Siewior
++ *
++ */
++
++#include <dm.h>
++#include <dm/device-internal.h>
++#include <dm/device_compat.h>
++#include <dm/devres.h>
++#include <linux/compat.h>
++#include <linux/delay.h>
++#include <linux/io.h>
++#include <linux/kernel.h>
++#include <regmap.h>
++#include <usb.h>
++
++#include "isp1760-core.h"
++#include "isp1760-hcd.h"
++#include "isp1760-regs.h"
++
++#define msleep(a) udelay(a * 1000)
++
++static int isp1760_init_core(struct isp1760_device *isp)
++{
++	struct isp1760_hcd *hcd = &isp->hcd;
++
++	/*
++	 * Reset the host controller, including the CPU interface
++	 * configuration.
++	 */
++	isp1760_field_set(hcd->fields, SW_RESET_RESET_ALL);
++	msleep(100);
++
++	/* Setup HW Mode Control: This assumes a level active-low interrupt */
++	if ((isp->devflags & ISP1760_FLAG_ANALOG_OC) && hcd->is_isp1763)
++		return -EINVAL;
++
++	if (isp->devflags & ISP1760_FLAG_BUS_WIDTH_16)
++		isp1760_field_clear(hcd->fields, HW_DATA_BUS_WIDTH);
++	if (isp->devflags & ISP1760_FLAG_BUS_WIDTH_8)
++		isp1760_field_set(hcd->fields, HW_DATA_BUS_WIDTH);
++	if (isp->devflags & ISP1760_FLAG_ANALOG_OC)
++		isp1760_field_set(hcd->fields, HW_ANA_DIGI_OC);
++	if (isp->devflags & ISP1760_FLAG_DACK_POL_HIGH)
++		isp1760_field_set(hcd->fields, HW_DACK_POL_HIGH);
++	if (isp->devflags & ISP1760_FLAG_DREQ_POL_HIGH)
++		isp1760_field_set(hcd->fields, HW_DREQ_POL_HIGH);
++	if (isp->devflags & ISP1760_FLAG_INTR_POL_HIGH)
++		isp1760_field_set(hcd->fields, HW_INTR_HIGH_ACT);
++	if (isp->devflags & ISP1760_FLAG_INTR_EDGE_TRIG)
++		isp1760_field_set(hcd->fields, HW_INTR_EDGE_TRIG);
++
++	/*
++	 * The ISP1761 has a dedicated DC IRQ line but supports sharing the HC
++	 * IRQ line for both the host and device controllers. Hardcode IRQ
++	 * sharing for now and disable the DC interrupts globally to avoid
++	 * spurious interrupts during HCD registration.
++	 */
++	if (isp->devflags & ISP1760_FLAG_ISP1761) {
++		isp1760_reg_write(hcd->regs, ISP176x_DC_MODE, 0);
++		isp1760_field_set(hcd->fields, HW_COMN_IRQ);
++	}
++
++	/*
++	 * PORT 1 Control register of the ISP1760 is the OTG control register
++	 * on ISP1761.
++	 *
++	 * TODO: Really support OTG. For now we configure port 1 in device mode
++	 */
++	if (((isp->devflags & ISP1760_FLAG_ISP1761) ||
++	     (isp->devflags & ISP1760_FLAG_ISP1763)) &&
++	    (isp->devflags & ISP1760_FLAG_PERIPHERAL_EN)) {
++		isp1760_field_set(hcd->fields, HW_DM_PULLDOWN);
++		isp1760_field_set(hcd->fields, HW_DP_PULLDOWN);
++		isp1760_field_set(hcd->fields, HW_OTG_DISABLE);
++	} else {
++		isp1760_field_set(hcd->fields, HW_SW_SEL_HC_DC);
++		isp1760_field_set(hcd->fields, HW_VBUS_DRV);
++		isp1760_field_set(hcd->fields, HW_SEL_CP_EXT);
++	}
++
++	printf( "%s bus width: %u, oc: %s\n",
++		 hcd->is_isp1763 ? "isp1763" : "isp1760",
++		 isp->devflags & ISP1760_FLAG_BUS_WIDTH_8 ? 8 :
++		 isp->devflags & ISP1760_FLAG_BUS_WIDTH_16 ? 16 : 32,
++		 hcd->is_isp1763 ? "not available" :
++		 isp->devflags & ISP1760_FLAG_ANALOG_OC ? "analog" : "digital");
++
++	return 0;
++}
++
++void isp1760_set_pullup(struct isp1760_device *isp, bool enable)
++{
++	struct isp1760_hcd *hcd = &isp->hcd;
++
++	if (enable)
++		isp1760_field_set(hcd->fields, HW_DP_PULLUP);
++	else
++		isp1760_field_set(hcd->fields, HW_DP_PULLUP_CLEAR);
++}
++
++/*
++ * ISP1760/61:
++ *
++ * 60kb divided in:
++ * - 32 blocks @ 256  bytes
++ * - 20 blocks @ 1024 bytes
++ * -  4 blocks @ 8192 bytes
++ */
++static const struct isp1760_memory_layout isp176x_memory_conf = {
++	.blocks[0]		= 32,
++	.blocks_size[0]		= 256,
++	.blocks[1]		= 20,
++	.blocks_size[1]		= 1024,
++	.blocks[2]		= 4,
++	.blocks_size[2]		= 8192,
++
++	.slot_num		= 32,
++	.payload_blocks		= 32 + 20 + 4,
++	.payload_area_size	= 0xf000,
++};
++
++/*
++ * ISP1763:
++ *
++ * 20kb divided in:
++ * - 8 blocks @ 256  bytes
++ * - 2 blocks @ 1024 bytes
++ * - 4 blocks @ 4096 bytes
++ */
++static const struct isp1760_memory_layout isp1763_memory_conf = {
++	.blocks[0]		= 8,
++	.blocks_size[0]		= 256,
++	.blocks[1]		= 2,
++	.blocks_size[1]		= 1024,
++	.blocks[2]		= 4,
++	.blocks_size[2]		= 4096,
++
++	.slot_num		= 16,
++	.payload_blocks		= 8 + 2 + 4,
++	.payload_area_size	= 0x5000,
++};
++
++static const struct regmap_config isp1760_hc_regmap_conf = {
++	.width = REGMAP_SIZE_16,
++};
++
++static const struct reg_field isp1760_hc_reg_fields[] = {
++	[HCS_PPC]		= REG_FIELD(ISP176x_HC_HCSPARAMS, 4, 4),
++	[HCS_N_PORTS]		= REG_FIELD(ISP176x_HC_HCSPARAMS, 0, 3),
++	[HCC_ISOC_CACHE]	= REG_FIELD(ISP176x_HC_HCCPARAMS, 7, 7),
++	[HCC_ISOC_THRES]	= REG_FIELD(ISP176x_HC_HCCPARAMS, 4, 6),
++	[CMD_LRESET]		= REG_FIELD(ISP176x_HC_USBCMD, 7, 7),
++	[CMD_RESET]		= REG_FIELD(ISP176x_HC_USBCMD, 1, 1),
++	[CMD_RUN]		= REG_FIELD(ISP176x_HC_USBCMD, 0, 0),
++	[STS_PCD]		= REG_FIELD(ISP176x_HC_USBSTS, 2, 2),
++	[HC_FRINDEX]		= REG_FIELD(ISP176x_HC_FRINDEX, 0, 13),
++	[FLAG_CF]		= REG_FIELD(ISP176x_HC_CONFIGFLAG, 0, 0),
++	[HC_ISO_PTD_DONEMAP]	= REG_FIELD(ISP176x_HC_ISO_PTD_DONEMAP, 0, 31),
++	[HC_ISO_PTD_SKIPMAP]	= REG_FIELD(ISP176x_HC_ISO_PTD_SKIPMAP, 0, 31),
++	[HC_ISO_PTD_LASTPTD]	= REG_FIELD(ISP176x_HC_ISO_PTD_LASTPTD, 0, 31),
++	[HC_INT_PTD_DONEMAP]	= REG_FIELD(ISP176x_HC_INT_PTD_DONEMAP, 0, 31),
++	[HC_INT_PTD_SKIPMAP]	= REG_FIELD(ISP176x_HC_INT_PTD_SKIPMAP, 0, 31),
++	[HC_INT_PTD_LASTPTD]	= REG_FIELD(ISP176x_HC_INT_PTD_LASTPTD, 0, 31),
++	[HC_ATL_PTD_DONEMAP]	= REG_FIELD(ISP176x_HC_ATL_PTD_DONEMAP, 0, 31),
++	[HC_ATL_PTD_SKIPMAP]	= REG_FIELD(ISP176x_HC_ATL_PTD_SKIPMAP, 0, 31),
++	[HC_ATL_PTD_LASTPTD]	= REG_FIELD(ISP176x_HC_ATL_PTD_LASTPTD, 0, 31),
++	[PORT_OWNER]		= REG_FIELD(ISP176x_HC_PORTSC1, 13, 13),
++	[PORT_POWER]		= REG_FIELD(ISP176x_HC_PORTSC1, 12, 12),
++	[PORT_LSTATUS]		= REG_FIELD(ISP176x_HC_PORTSC1, 10, 11),
++	[PORT_RESET]		= REG_FIELD(ISP176x_HC_PORTSC1, 8, 8),
++	[PORT_SUSPEND]		= REG_FIELD(ISP176x_HC_PORTSC1, 7, 7),
++	[PORT_RESUME]		= REG_FIELD(ISP176x_HC_PORTSC1, 6, 6),
++	[PORT_PE]		= REG_FIELD(ISP176x_HC_PORTSC1, 2, 2),
++	[PORT_CSC]		= REG_FIELD(ISP176x_HC_PORTSC1, 1, 1),
++	[PORT_CONNECT]		= REG_FIELD(ISP176x_HC_PORTSC1, 0, 0),
++	[ALL_ATX_RESET]		= REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 31, 31),
++	[HW_ANA_DIGI_OC]	= REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 15, 15),
++	[HW_COMN_IRQ]		= REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 10, 10),
++	[HW_DATA_BUS_WIDTH]	= REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 8, 8),
++	[HW_DACK_POL_HIGH]	= REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 6, 6),
++	[HW_DREQ_POL_HIGH]	= REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 5, 5),
++	[HW_INTR_HIGH_ACT]	= REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 2, 2),
++	[HW_INTR_EDGE_TRIG]	= REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 1, 1),
++	[HW_GLOBAL_INTR_EN]	= REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 0, 0),
++	[HC_CHIP_REV]		= REG_FIELD(ISP176x_HC_CHIP_ID, 16, 31),
++	[HC_CHIP_ID_HIGH]	= REG_FIELD(ISP176x_HC_CHIP_ID, 8, 15),
++	[HC_CHIP_ID_LOW]	= REG_FIELD(ISP176x_HC_CHIP_ID, 0, 7),
++	[HC_SCRATCH]		= REG_FIELD(ISP176x_HC_SCRATCH, 0, 31),
++	[SW_RESET_RESET_ALL]	= REG_FIELD(ISP176x_HC_RESET, 0, 0),
++	[ISO_BUF_FILL]		= REG_FIELD(ISP176x_HC_BUFFER_STATUS, 2, 2),
++	[INT_BUF_FILL]		= REG_FIELD(ISP176x_HC_BUFFER_STATUS, 1, 1),
++	[ATL_BUF_FILL]		= REG_FIELD(ISP176x_HC_BUFFER_STATUS, 0, 0),
++	[MEM_BANK_SEL]		= REG_FIELD(ISP176x_HC_MEMORY, 16, 17),
++	[MEM_START_ADDR]	= REG_FIELD(ISP176x_HC_MEMORY, 0, 15),
++	[HC_INTERRUPT]		= REG_FIELD(ISP176x_HC_INTERRUPT, 0, 9),
++	[HC_ATL_IRQ_ENABLE]	= REG_FIELD(ISP176x_HC_INTERRUPT_ENABLE, 8, 8),
++	[HC_INT_IRQ_ENABLE]	= REG_FIELD(ISP176x_HC_INTERRUPT_ENABLE, 7, 7),
++	[HC_ISO_IRQ_MASK_OR]	= REG_FIELD(ISP176x_HC_ISO_IRQ_MASK_OR, 0, 31),
++	[HC_INT_IRQ_MASK_OR]	= REG_FIELD(ISP176x_HC_INT_IRQ_MASK_OR, 0, 31),
++	[HC_ATL_IRQ_MASK_OR]	= REG_FIELD(ISP176x_HC_ATL_IRQ_MASK_OR, 0, 31),
++	[HC_ISO_IRQ_MASK_AND]	= REG_FIELD(ISP176x_HC_ISO_IRQ_MASK_AND, 0, 31),
++	[HC_INT_IRQ_MASK_AND]	= REG_FIELD(ISP176x_HC_INT_IRQ_MASK_AND, 0, 31),
++	[HC_ATL_IRQ_MASK_AND]	= REG_FIELD(ISP176x_HC_ATL_IRQ_MASK_AND, 0, 31),
++	[HW_OTG_DISABLE]	= REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 10, 10),
++	[HW_SW_SEL_HC_DC]	= REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 7, 7),
++	[HW_VBUS_DRV]		= REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 4, 4),
++	[HW_SEL_CP_EXT]		= REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 3, 3),
++	[HW_DM_PULLDOWN]	= REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 2, 2),
++	[HW_DP_PULLDOWN]	= REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 1, 1),
++	[HW_DP_PULLUP]		= REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 0, 0),
++	[HW_OTG_DISABLE_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 10, 10),
++	[HW_SW_SEL_HC_DC_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 7, 7),
++	[HW_VBUS_DRV_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 4, 4),
++	[HW_SEL_CP_EXT_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 3, 3),
++	[HW_DM_PULLDOWN_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 2, 2),
++	[HW_DP_PULLDOWN_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 1, 1),
++	[HW_DP_PULLUP_CLEAR]	= REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 0, 0),
++};
++
++static const struct regmap_config isp1763_hc_regmap_conf = {
++	.width = REGMAP_SIZE_16,
++};
++
++static const struct reg_field isp1763_hc_reg_fields[] = {
++	[CMD_LRESET]		= REG_FIELD(ISP1763_HC_USBCMD, 7, 7),
++	[CMD_RESET]		= REG_FIELD(ISP1763_HC_USBCMD, 1, 1),
++	[CMD_RUN]		= REG_FIELD(ISP1763_HC_USBCMD, 0, 0),
++	[STS_PCD]		= REG_FIELD(ISP1763_HC_USBSTS, 2, 2),
++	[HC_FRINDEX]		= REG_FIELD(ISP1763_HC_FRINDEX, 0, 13),
++	[FLAG_CF]		= REG_FIELD(ISP1763_HC_CONFIGFLAG, 0, 0),
++	[HC_ISO_PTD_DONEMAP]	= REG_FIELD(ISP1763_HC_ISO_PTD_DONEMAP, 0, 15),
++	[HC_ISO_PTD_SKIPMAP]	= REG_FIELD(ISP1763_HC_ISO_PTD_SKIPMAP, 0, 15),
++	[HC_ISO_PTD_LASTPTD]	= REG_FIELD(ISP1763_HC_ISO_PTD_LASTPTD, 0, 15),
++	[HC_INT_PTD_DONEMAP]	= REG_FIELD(ISP1763_HC_INT_PTD_DONEMAP, 0, 15),
++	[HC_INT_PTD_SKIPMAP]	= REG_FIELD(ISP1763_HC_INT_PTD_SKIPMAP, 0, 15),
++	[HC_INT_PTD_LASTPTD]	= REG_FIELD(ISP1763_HC_INT_PTD_LASTPTD, 0, 15),
++	[HC_ATL_PTD_DONEMAP]	= REG_FIELD(ISP1763_HC_ATL_PTD_DONEMAP, 0, 15),
++	[HC_ATL_PTD_SKIPMAP]	= REG_FIELD(ISP1763_HC_ATL_PTD_SKIPMAP, 0, 15),
++	[HC_ATL_PTD_LASTPTD]	= REG_FIELD(ISP1763_HC_ATL_PTD_LASTPTD, 0, 15),
++	[PORT_OWNER]		= REG_FIELD(ISP1763_HC_PORTSC1, 13, 13),
++	[PORT_POWER]		= REG_FIELD(ISP1763_HC_PORTSC1, 12, 12),
++	[PORT_LSTATUS]		= REG_FIELD(ISP1763_HC_PORTSC1, 10, 11),
++	[PORT_RESET]		= REG_FIELD(ISP1763_HC_PORTSC1, 8, 8),
++	[PORT_SUSPEND]		= REG_FIELD(ISP1763_HC_PORTSC1, 7, 7),
++	[PORT_RESUME]		= REG_FIELD(ISP1763_HC_PORTSC1, 6, 6),
++	[PORT_PE]		= REG_FIELD(ISP1763_HC_PORTSC1, 2, 2),
++	[PORT_CSC]		= REG_FIELD(ISP1763_HC_PORTSC1, 1, 1),
++	[PORT_CONNECT]		= REG_FIELD(ISP1763_HC_PORTSC1, 0, 0),
++	[HW_DATA_BUS_WIDTH]	= REG_FIELD(ISP1763_HC_HW_MODE_CTRL, 4, 4),
++	[HW_DACK_POL_HIGH]	= REG_FIELD(ISP1763_HC_HW_MODE_CTRL, 6, 6),
++	[HW_DREQ_POL_HIGH]	= REG_FIELD(ISP1763_HC_HW_MODE_CTRL, 5, 5),
++	[HW_INTF_LOCK]		= REG_FIELD(ISP1763_HC_HW_MODE_CTRL, 3, 3),
++	[HW_INTR_HIGH_ACT]	= REG_FIELD(ISP1763_HC_HW_MODE_CTRL, 2, 2),
++	[HW_INTR_EDGE_TRIG]	= REG_FIELD(ISP1763_HC_HW_MODE_CTRL, 1, 1),
++	[HW_GLOBAL_INTR_EN]	= REG_FIELD(ISP1763_HC_HW_MODE_CTRL, 0, 0),
++	[SW_RESET_RESET_ATX]	= REG_FIELD(ISP1763_HC_RESET, 3, 3),
++	[SW_RESET_RESET_ALL]	= REG_FIELD(ISP1763_HC_RESET, 0, 0),
++	[HC_CHIP_ID_HIGH]	= REG_FIELD(ISP1763_HC_CHIP_ID, 0, 15),
++	[HC_CHIP_ID_LOW]	= REG_FIELD(ISP1763_HC_CHIP_REV, 8, 15),
++	[HC_CHIP_REV]		= REG_FIELD(ISP1763_HC_CHIP_REV, 0, 7),
++	[HC_SCRATCH]		= REG_FIELD(ISP1763_HC_SCRATCH, 0, 15),
++	[ISO_BUF_FILL]		= REG_FIELD(ISP1763_HC_BUFFER_STATUS, 2, 2),
++	[INT_BUF_FILL]		= REG_FIELD(ISP1763_HC_BUFFER_STATUS, 1, 1),
++	[ATL_BUF_FILL]		= REG_FIELD(ISP1763_HC_BUFFER_STATUS, 0, 0),
++	[MEM_START_ADDR]	= REG_FIELD(ISP1763_HC_MEMORY, 0, 15),
++	[HC_DATA]		= REG_FIELD(ISP1763_HC_DATA, 0, 15),
++	[HC_INTERRUPT]		= REG_FIELD(ISP1763_HC_INTERRUPT, 0, 10),
++	[HC_ATL_IRQ_ENABLE]	= REG_FIELD(ISP1763_HC_INTERRUPT_ENABLE, 8, 8),
++	[HC_INT_IRQ_ENABLE]	= REG_FIELD(ISP1763_HC_INTERRUPT_ENABLE, 7, 7),
++	[HC_ISO_IRQ_MASK_OR]	= REG_FIELD(ISP1763_HC_ISO_IRQ_MASK_OR, 0, 15),
++	[HC_INT_IRQ_MASK_OR]	= REG_FIELD(ISP1763_HC_INT_IRQ_MASK_OR, 0, 15),
++	[HC_ATL_IRQ_MASK_OR]	= REG_FIELD(ISP1763_HC_ATL_IRQ_MASK_OR, 0, 15),
++	[HC_ISO_IRQ_MASK_AND]	= REG_FIELD(ISP1763_HC_ISO_IRQ_MASK_AND, 0, 15),
++	[HC_INT_IRQ_MASK_AND]	= REG_FIELD(ISP1763_HC_INT_IRQ_MASK_AND, 0, 15),
++	[HC_ATL_IRQ_MASK_AND]	= REG_FIELD(ISP1763_HC_ATL_IRQ_MASK_AND, 0, 15),
++	[HW_HC_2_DIS]		= REG_FIELD(ISP1763_HC_OTG_CTRL_SET, 15, 15),
++	[HW_OTG_DISABLE]	= REG_FIELD(ISP1763_HC_OTG_CTRL_SET, 10, 10),
++	[HW_SW_SEL_HC_DC]	= REG_FIELD(ISP1763_HC_OTG_CTRL_SET, 7, 7),
++	[HW_VBUS_DRV]		= REG_FIELD(ISP1763_HC_OTG_CTRL_SET, 4, 4),
++	[HW_SEL_CP_EXT]		= REG_FIELD(ISP1763_HC_OTG_CTRL_SET, 3, 3),
++	[HW_DM_PULLDOWN]	= REG_FIELD(ISP1763_HC_OTG_CTRL_SET, 2, 2),
++	[HW_DP_PULLDOWN]	= REG_FIELD(ISP1763_HC_OTG_CTRL_SET, 1, 1),
++	[HW_DP_PULLUP]		= REG_FIELD(ISP1763_HC_OTG_CTRL_SET, 0, 0),
++	[HW_HC_2_DIS_CLEAR]	= REG_FIELD(ISP1763_HC_OTG_CTRL_CLEAR, 15, 15),
++	[HW_OTG_DISABLE_CLEAR]	= REG_FIELD(ISP1763_HC_OTG_CTRL_CLEAR, 10, 10),
++	[HW_SW_SEL_HC_DC_CLEAR]	= REG_FIELD(ISP1763_HC_OTG_CTRL_CLEAR, 7, 7),
++	[HW_VBUS_DRV_CLEAR]	= REG_FIELD(ISP1763_HC_OTG_CTRL_CLEAR, 4, 4),
++	[HW_SEL_CP_EXT_CLEAR]	= REG_FIELD(ISP1763_HC_OTG_CTRL_CLEAR, 3, 3),
++	[HW_DM_PULLDOWN_CLEAR]	= REG_FIELD(ISP1763_HC_OTG_CTRL_CLEAR, 2, 2),
++	[HW_DP_PULLDOWN_CLEAR]	= REG_FIELD(ISP1763_HC_OTG_CTRL_CLEAR, 1, 1),
++	[HW_DP_PULLUP_CLEAR]	= REG_FIELD(ISP1763_HC_OTG_CTRL_CLEAR, 0, 0),
++};
++
++int isp1760_register(struct isp1760_device *isp, struct resource *mem, int irq,
++		     unsigned long irqflags)
++{
++	const struct regmap_config *hc_regmap;
++	const struct reg_field *hc_reg_fields;
++	struct isp1760_hcd *hcd;
++	struct regmap_field *f;
++	unsigned int devflags;
++	struct udevice *dev;
++	int ret;
++	int i;
++
++	hcd = &isp->hcd;
++	devflags = isp->devflags;
++	dev = isp->dev;
++
++	hcd->is_isp1763 = !!(devflags & ISP1760_FLAG_ISP1763);
++
++	if (!hcd->is_isp1763 && (devflags & ISP1760_FLAG_BUS_WIDTH_8)) {
++		dev_err(dev, "isp1760/61 do not support data width 8\n");
++		return -EINVAL;
++	}
++
++	if (hcd->is_isp1763) {
++		hc_regmap = &isp1763_hc_regmap_conf;
++		hc_reg_fields = &isp1763_hc_reg_fields[0];
++	} else {
++		hc_regmap = &isp1760_hc_regmap_conf;
++		hc_reg_fields = &isp1760_hc_reg_fields[0];
++	}
++
++	hcd->base = devm_ioremap(dev, mem->start, resource_size(mem));
++	if (IS_ERR(hcd->base))
++		return PTR_ERR(hcd->base);
++
++	hcd->regs = devm_regmap_init(dev, NULL, NULL, hc_regmap);
++	if (IS_ERR(hcd->regs))
++		return PTR_ERR(hcd->regs);
++
++	for (i = 0; i < HC_FIELD_MAX; i++) {
++		f = devm_regmap_field_alloc(dev, hcd->regs, hc_reg_fields[i]);
++		if (IS_ERR(f))
++			return PTR_ERR(f);
++
++		hcd->fields[i] = f;
++	}
++
++	if (hcd->is_isp1763)
++		hcd->memory_layout = &isp1763_memory_conf;
++	else
++		hcd->memory_layout = &isp176x_memory_conf;
++
++	ret = isp1760_init_core(isp);
++	if (ret < 0)
++		return ret;
++
++	hcd->dev = dev;
++
++	ret = isp1760_hcd_register(hcd, mem, irq, irqflags, dev);
++	if (ret < 0)
++		return ret;
++
++	ret = isp1760_hcd_lowlevel_init(hcd);
++	if (ret < 0)
++		return ret;
++
++	dev_set_drvdata(dev, isp);
++
++	return 0;
++}
++
++void isp1760_unregister(struct isp1760_device *isp)
++{
++	isp1760_hcd_unregister(&isp->hcd);
++
++	return;
++}
+diff --git a/drivers/usb/isp1760/isp1760-core.h b/drivers/usb/isp1760/isp1760-core.h
+new file mode 100644
+index 0000000000..0a60e30b5f
+--- /dev/null
++++ b/drivers/usb/isp1760/isp1760-core.h
+@@ -0,0 +1,96 @@
++/* SPDX-License-Identifier: GPL-2.0 */
++/*
++ * Driver for the NXP ISP1760 chip
++ *
++ * Copyright 2021 Linaro, Rui Miguel Silva
++ * Copyright 2014 Laurent Pinchart
++ * Copyright 2007 Sebastian Siewior
++ *
++ * Contacts:
++ *	Sebastian Siewior <bigeasy@linutronix.de>
++ *	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
++ *	Rui Miguel Silva <rui.silva@linaro.org>
++ */
++
++#ifndef _ISP1760_CORE_H_
++#define _ISP1760_CORE_H_
++
++#include <linux/compat.h>
++#include <linux/ioport.h>
++#include <regmap.h>
++
++#include "isp1760-hcd.h"
++
++struct device;
++struct gpio_desc;
++
++/*
++ * Device flags that can vary from board to board.  All of these
++ * indicate the most "atypical" case, so that a devflags of 0 is
++ * a sane default configuration.
++ */
++#define ISP1760_FLAG_BUS_WIDTH_16	0x00000002 /* 16-bit data bus width */
++#define ISP1760_FLAG_PERIPHERAL_EN	0x00000004 /* Port 1 supports Peripheral mode*/
++#define ISP1760_FLAG_ANALOG_OC		0x00000008 /* Analog overcurrent */
++#define ISP1760_FLAG_DACK_POL_HIGH	0x00000010 /* DACK active high */
++#define ISP1760_FLAG_DREQ_POL_HIGH	0x00000020 /* DREQ active high */
++#define ISP1760_FLAG_ISP1761		0x00000040 /* Chip is ISP1761 */
++#define ISP1760_FLAG_INTR_POL_HIGH	0x00000080 /* Interrupt polarity active high */
++#define ISP1760_FLAG_INTR_EDGE_TRIG	0x00000100 /* Interrupt edge triggered */
++#define ISP1760_FLAG_ISP1763		0x00000200 /* Chip is ISP1763 */
++#define ISP1760_FLAG_BUS_WIDTH_8	0x00000400 /* 8-bit data bus width */
++
++struct isp1760_device {
++	struct udevice *dev;
++
++	unsigned int devflags;
++	struct gpio_desc *rst_gpio;
++
++	struct isp1760_hcd hcd;
++};
++
++int isp1760_register(struct isp1760_device *isp, struct resource *mem, int irq,
++		     unsigned long irqflags);
++void isp1760_unregister(struct isp1760_device *isp);
++
++void isp1760_set_pullup(struct isp1760_device *isp, bool enable);
++
++static inline u32 isp1760_field_read(struct regmap_field **fields, u32 field)
++{
++	unsigned int val;
++
++	regmap_field_read(fields[field], &val);
++
++	return val;
++}
++
++static inline void isp1760_field_write(struct regmap_field **fields, u32 field,
++				       u32 val)
++{
++	regmap_field_write(fields[field], val);
++}
++
++static inline void isp1760_field_set(struct regmap_field **fields, u32 field)
++{
++	isp1760_field_write(fields, field, 0xFFFFFFFF);
++}
++
++static inline void isp1760_field_clear(struct regmap_field **fields, u32 field)
++{
++	isp1760_field_write(fields, field, 0);
++}
++
++static inline u32 isp1760_reg_read(struct regmap *regs, u32 reg)
++{
++	unsigned int val;
++
++	regmap_read(regs, reg, &val);
++
++	return val;
++}
++
++static inline void isp1760_reg_write(struct regmap *regs, u32 reg, u32 val)
++{
++	regmap_write(regs, reg, val);
++}
++#endif
+diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
+new file mode 100644
+index 0000000000..b1d86dd69b
+--- /dev/null
++++ b/drivers/usb/isp1760/isp1760-hcd.c
+@@ -0,0 +1,2574 @@
++// SPDX-License-Identifier: GPL-2.0
++/*
++ * Driver for the NXP ISP1760 chip
++ *
++ * Copyright 2021 Linaro, Rui Miguel Silva <rui.silva@linaro.org>
++ *
++ */
++
++#include <hexdump.h>
++#include <common.h>
++#include <asm/cache.h>
++#include <cpu_func.h>
++#include <dm.h>
++#include <dm/device-internal.h>
++#include <dm/device_compat.h>
++#include <linux/bug.h>
++#include <linux/kernel.h>
++#include <linux/list.h>
++#include <linux/usb/usb_urb_compat.h>
++#include <usb.h>
++#include <linux/io.h>
++#include <linux/iopoll.h>
++#include <asm/unaligned.h>
++
++#include "isp1760-core.h"
++#include "isp1760-hcd.h"
++#include "isp1760-regs.h"
++#include "isp1760-uboot.h"
++
++static struct kmem_cache *qtd_cachep;
++static struct kmem_cache *qh_cachep;
++static struct kmem_cache *urb_listitem_cachep;
++
++typedef void (packet_enqueue)(struct usb_hcd *hcd, struct isp1760_qh *qh,
++			      struct isp1760_qtd *qtd);
++
++static inline struct isp1760_hcd *hcd_to_priv(struct usb_hcd *hcd)
++{
++	return hcd->hcd_priv;
++}
++
++#define dw_to_le32(x)	(cpu_to_le32((__force u32)x))
++#define le32_to_dw(x)	((__force __dw)(le32_to_cpu(x)))
++
++/* urb state*/
++#define DELETE_URB		(0x0008)
++#define NO_TRANSFER_ACTIVE	(0xffffffff)
++
++/* Philips Proprietary Transfer Descriptor (PTD) */
++typedef __u32 __bitwise __dw;
++struct ptd {
++	__dw dw0;
++	__dw dw1;
++	__dw dw2;
++	__dw dw3;
++	__dw dw4;
++	__dw dw5;
++	__dw dw6;
++	__dw dw7;
++};
++
++struct ptd_le32 {
++	__le32 dw0;
++	__le32 dw1;
++	__le32 dw2;
++	__le32 dw3;
++	__le32 dw4;
++	__le32 dw5;
++	__le32 dw6;
++	__le32 dw7;
++};
++
++#define PTD_OFFSET		0x0400
++#define ISO_PTD_OFFSET		0x0400
++#define INT_PTD_OFFSET		0x0800
++#define ATL_PTD_OFFSET		0x0c00
++#define PAYLOAD_OFFSET		0x1000
++
++#define ISP_BANK_0		0x00
++#define ISP_BANK_1		0x01
++#define ISP_BANK_2		0x02
++#define ISP_BANK_3		0x03
++
++#define TO_DW(x)	((__force __dw)x)
++#define TO_U32(x)	((__force u32)x)
++
++ /* ATL */
++ /* DW0 */
++#define DW0_VALID_BIT			TO_DW(1)
++#define FROM_DW0_VALID(x)		(TO_U32(x) & 0x01)
++#define TO_DW0_LENGTH(x)		TO_DW((((u32)x) << 3))
++#define TO_DW0_MAXPACKET(x)		TO_DW((((u32)x) << 18))
++#define TO_DW0_MULTI(x)			TO_DW((((u32)x) << 29))
++#define TO_DW0_ENDPOINT(x)		TO_DW((((u32)x) << 31))
++/* DW1 */
++#define TO_DW1_DEVICE_ADDR(x)		TO_DW((((u32)x) << 3))
++#define TO_DW1_PID_TOKEN(x)		TO_DW((((u32)x) << 10))
++#define DW1_TRANS_BULK			TO_DW(((u32)2 << 12))
++#define DW1_TRANS_INT			TO_DW(((u32)3 << 12))
++#define DW1_TRANS_SPLIT			TO_DW(((u32)1 << 14))
++#define DW1_SE_USB_LOSPEED		TO_DW(((u32)2 << 16))
++#define TO_DW1_PORT_NUM(x)		TO_DW((((u32)x) << 18))
++#define TO_DW1_HUB_NUM(x)		TO_DW((((u32)x) << 25))
++/* DW2 */
++#define TO_DW2_DATA_START_ADDR(x)	TO_DW((((u32)x) << 8))
++#define TO_DW2_RL(x)			TO_DW(((x) << 25))
++#define FROM_DW2_RL(x)			((TO_U32(x) >> 25) & 0xf)
++/* DW3 */
++#define FROM_DW3_NRBYTESTRANSFERRED(x)		TO_U32((x) & 0x3fff)
++#define FROM_DW3_SCS_NRBYTESTRANSFERRED(x)	TO_U32((x) & 0x07ff)
++#define TO_DW3_NAKCOUNT(x)		TO_DW(((x) << 19))
++#define FROM_DW3_NAKCOUNT(x)		((TO_U32(x) >> 19) & 0xf)
++#define TO_DW3_CERR(x)			TO_DW(((x) << 23))
++#define FROM_DW3_CERR(x)		((TO_U32(x) >> 23) & 0x3)
++#define TO_DW3_DATA_TOGGLE(x)		TO_DW(((x) << 25))
++#define FROM_DW3_DATA_TOGGLE(x)		((TO_U32(x) >> 25) & 0x1)
++#define TO_DW3_PING(x)			TO_DW(((x) << 26))
++#define FROM_DW3_PING(x)		((TO_U32(x) >> 26) & 0x1)
++#define DW3_ERROR_BIT			TO_DW((1 << 28))
++#define DW3_BABBLE_BIT			TO_DW((1 << 29))
++#define DW3_HALT_BIT			TO_DW((1 << 30))
++#define DW3_ACTIVE_BIT			TO_DW((1 << 31))
++#define FROM_DW3_ACTIVE(x)		((TO_U32(x) >> 31) & 0x01)
++
++#define INT_UNDERRUN			(1 << 2)
++#define INT_BABBLE			(1 << 1)
++#define INT_EXACT			(1 << 0)
++
++#define SETUP_PID	(2)
++#define IN_PID		(1)
++#define OUT_PID		(0)
++
++/* Errata 1 */
++#define RL_COUNTER	(0)
++#define NAK_COUNTER	(0)
++#define ERR_COUNTER	(3)
++
++struct isp1760_qtd {
++	u8 packet_type;
++	void *data_buffer;
++	u32 payload_addr;
++
++	/* the rest is HCD-private */
++	struct list_head qtd_list;
++	struct urb *urb;
++	size_t length;
++	size_t actual_length;
++
++	/* QTD_ENQUEUED:	waiting for transfer (inactive) */
++	/* QTD_PAYLOAD_ALLOC:	chip mem has been allocated for payload */
++	/* QTD_XFER_STARTED:	valid ptd has been written to isp176x - only
++				interrupt handler may touch this qtd! */
++	/* QTD_XFER_COMPLETE:	payload has been transferred successfully */
++	/* QTD_RETIRE:		transfer error/abort qtd */
++#define QTD_ENQUEUED		0
++#define QTD_PAYLOAD_ALLOC	1
++#define QTD_XFER_STARTED	2
++#define QTD_XFER_COMPLETE	3
++#define QTD_RETIRE		4
++	u32 status;
++};
++
++/* Queue head, one for each active endpoint */
++struct isp1760_qh {
++	struct list_head qh_list;
++	struct list_head qtd_list;
++	int epnum;
++	u32 toggle;
++	u32 ping;
++	int slot;
++	int tt_buffer_dirty;	/* See USB2.0 spec section 11.17.5 */
++};
++
++struct urb_listitem {
++	struct list_head urb_list;
++	struct urb *urb;
++};
++
++static const u32 isp1763_hc_portsc1_fields[] = {
++	[PORT_OWNER]		= BIT(13),
++	[PORT_POWER]		= BIT(12),
++	[PORT_LSTATUS]		= BIT(10),
++	[PORT_RESET]		= BIT(8),
++	[PORT_SUSPEND]		= BIT(7),
++	[PORT_RESUME]		= BIT(6),
++	[PORT_PE]		= BIT(2),
++	[PORT_CSC]		= BIT(1),
++	[PORT_CONNECT]		= BIT(0),
++};
++
++static struct descriptor {
++	struct usb_device_descriptor device;
++	struct usb_config_descriptor config;
++	struct usb_interface_descriptor interface;
++	struct usb_endpoint_descriptor endpoint;
++} __packed rh_descriptor = {
++	{
++		/* usb 2.0 root hub device descriptor */
++		0x12,       /*  __u8  bLength; */
++		USB_DT_DEVICE, /* __u8 bDescriptorType; Device */
++		0x0002, /*  __le16 bcdUSB; v2.0 */
++
++		0x09,       /*  __u8  bDeviceClass; HUB_CLASSCODE */
++		0x00,       /*  __u8  bDeviceSubClass; */
++		0x00,       /*  __u8  bDeviceProtocol; [ usb 2.0 no TT ] */
++		0x40,       /*  __u8  bMaxPacketSize0; 64 Bytes */
++
++		0x6b1d,     /*  __le16 idVendor; Linux Foundation 0x1d6b */
++		0x0200,     /*  __le16 idProduct; device 0x0002 */
++		0x0001,     /*  __le16 bcdDevice */
++
++		0x03,       /*  __u8  iManufacturer; */
++		0x02,       /*  __u8  iProduct; */
++		0x01,       /*  __u8  iSerialNumber; */
++		0x01        /*  __u8  bNumConfigurations; */
++	}, {
++		/* one configuration */
++		0x09,       /*  __u8  bLength; */
++		USB_DT_CONFIG, /* __u8 bDescriptorType; Configuration */
++		0x1900,     /*  __le16 wTotalLength; */
++		0x01,       /*  __u8  bNumInterfaces; (1) */
++		0x01,       /*  __u8  bConfigurationValue; */
++		0x00,       /*  __u8  iConfiguration; */
++		0xc0,       /*  __u8  bmAttributes;
++					Bit 7: must be set,
++					6: Self-powered,
++					5: Remote wakeup,
++					4..0: resvd */
++		0x00,       /*  __u8  MaxPower; */
++	}, {
++		/* one interface */
++		0x09,       /*  __u8  if_bLength; */
++		USB_DT_INTERFACE, /* __u8 if_bDescriptorType; Interface */
++		0x00,       /*  __u8  if_bInterfaceNumber; */
++		0x00,       /*  __u8  if_bAlternateSetting; */
++		0x01,       /*  __u8  if_bNumEndpoints; */
++		0x09,       /*  __u8  if_bInterfaceClass; HUB_CLASSCODE */
++		0x00,       /*  __u8  if_bInterfaceSubClass; */
++		0x00,       /*  __u8  if_bInterfaceProtocol; [usb1.1 or single tt] */
++		0x00,       /*  __u8  if_iInterface; */
++	}, {
++		/* one endpoint (status change endpoint) */
++		0x07,       /*  __u8  ep_bLength; */
++		USB_DT_ENDPOINT, /* __u8 ep_bDescriptorType; Endpoint */
++		0x81,       /*  __u8  ep_bEndpointAddress; IN Endpoint 1 */
++		0x03,       /*  __u8  ep_bmAttributes; Interrupt */
++			/* __le16 ep_wMaxPacketSize; 1 + (MAX_ROOT_PORTS / 8)
++			* see hub.c:hub_configure() for details. */
++		(USB_MAXCHILDREN + 1 + 7) / 8, 0x00,
++		0x0c        /*  __u8  ep_bInterval; (256ms -- usb 2.0 spec) */
++	},
++};
++
++/*
++ * Access functions for isp176x registers regmap fields
++ */
++static u32 isp1760_hcd_read(struct usb_hcd *hcd, u32 field)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++
++	return isp1760_field_read(priv->fields, field);
++}
++
++/*
++ * We need, in isp1763, to write directly the values to the portsc1
++ * register so it will make the other values to trigger.
++ */
++static void isp1760_hcd_portsc1_set_clear(struct isp1760_hcd *priv, u32 field,
++					  u32 val)
++{
++	u32 bit = isp1763_hc_portsc1_fields[field];
++	u32 port_status = readl(priv->base + ISP1763_HC_PORTSC1);
++
++	if (val)
++		writel(port_status | bit, priv->base + ISP1763_HC_PORTSC1);
++	else
++		writel(port_status & ~bit, priv->base + ISP1763_HC_PORTSC1);
++}
++
++static void isp1760_hcd_write(struct usb_hcd *hcd, u32 field, u32 val)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++
++	if (unlikely(priv->is_isp1763 &&
++		     (field >= PORT_OWNER && field <= PORT_CONNECT)))
++		return isp1760_hcd_portsc1_set_clear(priv, field, val);
++
++	isp1760_field_write(priv->fields, field, val);
++}
++
++static void isp1760_hcd_set(struct usb_hcd *hcd, u32 field)
++{
++	isp1760_hcd_write(hcd, field, 0xFFFFFFFF);
++}
++
++static void isp1760_hcd_clear(struct usb_hcd *hcd, u32 field)
++{
++	isp1760_hcd_write(hcd, field, 0);
++}
++
++static int isp1760_hcd_set_and_wait(struct usb_hcd *hcd, u32 field,
++				    u32 timeout_us)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++	u32 val;
++
++	isp1760_hcd_set(hcd, field);
++
++	return regmap_field_read_poll_timeout(priv->fields[field], val,
++					      val, 10, timeout_us);
++}
++
++static int isp1760_hcd_set_and_wait_swap(struct usb_hcd *hcd, u32 field,
++					 u32 timeout_us)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++	u32 val;
++
++	isp1760_hcd_set(hcd, field);
++
++	return regmap_field_read_poll_timeout(priv->fields[field], val,
++					      !val, 10, timeout_us);
++}
++
++static int isp1760_hcd_clear_and_wait(struct usb_hcd *hcd, u32 field,
++				      u32 timeout_us)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++	u32 val;
++
++	isp1760_hcd_clear(hcd, field);
++
++	return regmap_field_read_poll_timeout(priv->fields[field], val,
++					      !val, 10, timeout_us);
++}
++
++static bool isp1760_hcd_is_set(struct usb_hcd *hcd, u32 field)
++{
++	return !!isp1760_hcd_read(hcd, field);
++}
++
++static bool isp1760_hcd_ppc_is_set(struct usb_hcd *hcd)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++
++	if (priv->is_isp1763)
++		return true;
++
++	return isp1760_hcd_is_set(hcd, HCS_PPC);
++}
++
++static u32 isp1760_hcd_n_ports(struct usb_hcd *hcd)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++
++	if (priv->is_isp1763)
++		return 1;
++
++	return isp1760_hcd_read(hcd, HCS_N_PORTS);
++}
++
++/*
++ * Access functions for isp176x memory (offset >= 0x0400).
++ *
++ * bank_reads8() reads memory locations prefetched by an earlier write to
++ * HC_MEMORY_REG (see isp176x datasheet). Unless you want to do fancy multi-
++ * bank optimizations, you should use the more generic mem_read() below.
++ *
++ * For access to ptd memory, use the specialized ptd_read() and ptd_write()
++ * below.
++ *
++ * These functions copy via MMIO data to/from the device. memcpy_{to|from}io()
++ * doesn't quite work because some people have to enforce 32-bit access
++ */
++static void bank_reads8(void __iomem *src_base, u32 src_offset, u32 bank_addr,
++							__u32 *dst, u32 bytes)
++{
++	__u32 __iomem *src;
++	u32 val;
++	__u8 *src_byteptr;
++	__u8 *dst_byteptr;
++
++	src = src_base + (bank_addr | src_offset);
++
++	if (src_offset < PAYLOAD_OFFSET) {
++		while (bytes >= 4) {
++			*dst = readl_relaxed(src);
++			bytes -= 4;
++			src++;
++			dst++;
++		}
++	} else {
++		while (bytes >= 4) {
++			*dst = __raw_readl(src);
++			bytes -= 4;
++			src++;
++			dst++;
++		}
++	}
++
++	if (!bytes)
++		return;
++
++	/* in case we have 3, 2 or 1 by left. The dst buffer may not be fully
++	 * allocated.
++	 */
++	if (src_offset < PAYLOAD_OFFSET)
++		val = readl_relaxed(src);
++	else
++		val = __raw_readl(src);
++
++	dst_byteptr = (void *) dst;
++	src_byteptr = (void *) &val;
++	while (bytes > 0) {
++		*dst_byteptr = *src_byteptr;
++		dst_byteptr++;
++		src_byteptr++;
++		bytes--;
++	}
++}
++
++static void isp1760_mem_read(struct usb_hcd *hcd, u32 src_offset, void *dst,
++			     u32 bytes)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++
++	isp1760_hcd_write(hcd, MEM_BANK_SEL, ISP_BANK_0);
++	isp1760_hcd_write(hcd, MEM_START_ADDR, src_offset);
++	ndelay(100);
++
++	bank_reads8(priv->base, src_offset, ISP_BANK_0, dst, bytes);
++}
++
++/*
++ * ISP1763 does not have the banks direct host controller memory access,
++ * needs to use the HC_DATA register. Add data read/write according to this,
++ * and also adjust 16bit access.
++ */
++static void isp1763_mem_read(struct usb_hcd *hcd, u16 srcaddr,
++			     u16 *dstptr, u32 bytes)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++
++
++	/* Write the starting device address to the hcd memory register */
++	isp1760_reg_write(priv->regs, ISP1763_HC_MEMORY, srcaddr);
++	ndelay(100); /* Delay between consecutive access */
++
++	/* As long there are at least 16-bit to read ... */
++	while (bytes >= 2) {
++		*dstptr = __raw_readw(priv->base + ISP1763_HC_DATA);
++		bytes -= 2;
++		dstptr++;
++	}
++
++	/* If there are no more bytes to read, return */
++	if (bytes <= 0)
++		return;
++
++	*((u8 *)dstptr) = (u8)(readw(priv->base + ISP1763_HC_DATA) & 0xFF);
++}
++
++static void mem_read(struct usb_hcd *hcd, u32 src_offset, __u32 *dst,
++		     u32 bytes)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++
++	if (!priv->is_isp1763)
++		return isp1760_mem_read(hcd, src_offset, (u16 *)dst, bytes);
++
++	isp1763_mem_read(hcd, (u16)src_offset, (u16 *)dst, bytes);
++}
++
++static void isp1760_mem_write(void __iomem *dst_base, u32 dst_offset,
++			      __u32 const *src, u32 bytes)
++{
++	__u32 __iomem *dst;
++
++	dst = dst_base + dst_offset;
++
++	if (dst_offset < PAYLOAD_OFFSET) {
++		while (bytes >= 4) {
++			writel_relaxed(*src, dst);
++			bytes -= 4;
++			src++;
++			dst++;
++		}
++	} else {
++		while (bytes >= 4) {
++			__raw_writel(*src, dst);
++			bytes -= 4;
++			src++;
++			dst++;
++		}
++	}
++
++	if (!bytes)
++		return;
++	/* in case we have 3, 2 or 1 bytes left. The buffer is allocated and the
++	 * extra bytes should not be read by the HW.
++	 */
++
++	if (dst_offset < PAYLOAD_OFFSET)
++		writel_relaxed(*src, dst);
++	else
++		__raw_writel(*src, dst);
++}
++
++static void isp1763_mem_write(struct usb_hcd *hcd, u16 dstaddr, u16 *src,
++			      u32 bytes)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++
++	/* Write the starting device address to the hcd memory register */
++	isp1760_reg_write(priv->regs, ISP1763_HC_MEMORY, dstaddr);
++	ndelay(100); /* Delay between consecutive access */
++
++	while (bytes >= 2) {
++		/* Get and write the data; then adjust the data ptr and len */
++		__raw_writew(*src, priv->base + ISP1763_HC_DATA);
++		bytes -= 2;
++		src++;
++	}
++
++	/* If there are no more bytes to process, return */
++	if (bytes <= 0)
++		return;
++
++	/*
++	 * The only way to get here is if there is a single byte left,
++	 * get it and write it to the data reg;
++	 */
++	writew(*((u8 *)src), priv->base + ISP1763_HC_DATA);
++}
++
++static void mem_write(struct usb_hcd *hcd, u32 dst_offset, __u32 *src,
++		      u32 bytes)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++
++	if (!priv->is_isp1763)
++		return isp1760_mem_write(priv->base, dst_offset, src, bytes);
++
++	isp1763_mem_write(hcd, dst_offset, (u16 *)src, bytes);
++}
++
++/*
++ * Read and write ptds. 'ptd_offset' should be one of ISO_PTD_OFFSET,
++ * INT_PTD_OFFSET, and ATL_PTD_OFFSET. 'slot' should be less than 32.
++ */
++static void isp1760_ptd_read(struct usb_hcd *hcd, u32 ptd_offset, u32 slot,
++			     struct ptd *ptd)
++{
++	u16 src_offset = ptd_offset + slot * sizeof(*ptd);
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++
++	isp1760_hcd_write(hcd, MEM_BANK_SEL, ISP_BANK_0);
++	isp1760_hcd_write(hcd, MEM_START_ADDR, src_offset);
++	ndelay(90);
++
++	bank_reads8(priv->base, src_offset, ISP_BANK_0, (void *)ptd,
++		    sizeof(*ptd));
++}
++
++static void isp1763_ptd_read(struct usb_hcd *hcd, u32 ptd_offset, u32 slot,
++			     struct ptd *ptd)
++{
++	u16 src_offset = ptd_offset + slot * sizeof(*ptd);
++	struct ptd_le32 le32_ptd;
++
++	isp1763_mem_read(hcd, src_offset, (u16 *)&le32_ptd, sizeof(le32_ptd));
++	/* Normalize the data obtained */
++	ptd->dw0 = le32_to_dw(le32_ptd.dw0);
++	ptd->dw1 = le32_to_dw(le32_ptd.dw1);
++	ptd->dw2 = le32_to_dw(le32_ptd.dw2);
++	ptd->dw3 = le32_to_dw(le32_ptd.dw3);
++	ptd->dw4 = le32_to_dw(le32_ptd.dw4);
++	ptd->dw5 = le32_to_dw(le32_ptd.dw5);
++	ptd->dw6 = le32_to_dw(le32_ptd.dw6);
++	ptd->dw7 = le32_to_dw(le32_ptd.dw7);
++}
++
++static void ptd_read(struct usb_hcd *hcd, u32 ptd_offset, u32 slot,
++		     struct ptd *ptd)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++
++	if (!priv->is_isp1763)
++		return isp1760_ptd_read(hcd, ptd_offset, slot, ptd);
++
++	isp1763_ptd_read(hcd, ptd_offset, slot, ptd);
++}
++
++static void isp1763_ptd_write(struct usb_hcd *hcd, u32 ptd_offset, u32 slot,
++			      struct ptd *cpu_ptd)
++{
++	u16 dst_offset = ptd_offset + slot * sizeof(*cpu_ptd);
++	struct ptd_le32 ptd;
++
++	ptd.dw0 = dw_to_le32(cpu_ptd->dw0);
++	ptd.dw1 = dw_to_le32(cpu_ptd->dw1);
++	ptd.dw2 = dw_to_le32(cpu_ptd->dw2);
++	ptd.dw3 = dw_to_le32(cpu_ptd->dw3);
++	ptd.dw4 = dw_to_le32(cpu_ptd->dw4);
++	ptd.dw5 = dw_to_le32(cpu_ptd->dw5);
++	ptd.dw6 = dw_to_le32(cpu_ptd->dw6);
++	ptd.dw7 = dw_to_le32(cpu_ptd->dw7);
++
++	isp1763_mem_write(hcd, dst_offset,  (u16 *)&ptd.dw0,
++			  8 * sizeof(ptd.dw0));
++}
++
++static void isp1760_ptd_write(void __iomem *base, u32 ptd_offset, u32 slot,
++			      struct ptd *ptd)
++{
++	u32 dst_offset = ptd_offset + slot * sizeof(*ptd);
++
++	/*
++	 * Make sure dw0 gets written last (after other dw's and after payload)
++	 *  since it contains the enable bit
++	 */
++	isp1760_mem_write(base, dst_offset + sizeof(ptd->dw0),
++			  (__force u32 *)&ptd->dw1, 7 * sizeof(ptd->dw1));
++	wmb();
++	isp1760_mem_write(base, dst_offset, (__force u32 *)&ptd->dw0,
++			  sizeof(ptd->dw0));
++}
++
++static void ptd_write(struct usb_hcd *hcd, u32 ptd_offset, u32 slot,
++		      struct ptd *ptd)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++
++	if (!priv->is_isp1763)
++		return isp1760_ptd_write(priv->base, ptd_offset, slot, ptd);
++
++	isp1763_ptd_write(hcd, ptd_offset, slot, ptd);
++}
++
++/* memory management of the 60kb on the chip from 0x1000 to 0xffff */
++static void init_memory(struct isp1760_hcd *priv)
++{
++	const struct isp1760_memory_layout *mem = priv->memory_layout;
++	int i, j, curr;
++	u32 payload_addr;
++
++	payload_addr = PAYLOAD_OFFSET;
++
++	for (i = 0, curr = 0; i < ARRAY_SIZE(mem->blocks); i++) {
++		for (j = 0; j < mem->blocks[i]; j++, curr++) {
++			priv->memory_pool[curr + j].start = payload_addr;
++			priv->memory_pool[curr + j].size = mem->blocks_size[i];
++			priv->memory_pool[curr + j].free = 1;
++			payload_addr += priv->memory_pool[curr + j].size;
++		}
++	}
++
++	WARN_ON(payload_addr - priv->memory_pool[0].start >
++		mem->payload_area_size);
++}
++
++static void alloc_mem(struct usb_hcd *hcd, struct isp1760_qtd *qtd)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++	const struct isp1760_memory_layout *mem = priv->memory_layout;
++	int i;
++
++	WARN_ON(qtd->payload_addr);
++
++	if (!qtd->length)
++		return;
++
++	for (i = 0; i < mem->payload_blocks; i++) {
++		if (priv->memory_pool[i].size >= qtd->length &&
++				priv->memory_pool[i].free) {
++			priv->memory_pool[i].free = 0;
++			qtd->payload_addr = priv->memory_pool[i].start;
++			return;
++		}
++	}
++}
++
++static void free_mem(struct usb_hcd *hcd, struct isp1760_qtd *qtd)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++	const struct isp1760_memory_layout *mem = priv->memory_layout;
++	int i;
++
++	if (!qtd->payload_addr)
++		return;
++
++	for (i = 0; i < mem->payload_blocks; i++) {
++		if (priv->memory_pool[i].start == qtd->payload_addr) {
++			WARN_ON(priv->memory_pool[i].free);
++			priv->memory_pool[i].free = 1;
++			qtd->payload_addr = 0;
++			return;
++		}
++	}
++
++	WARN_ON(1);
++	qtd->payload_addr = 0;
++}
++
++/* reset a non-running (STS_HALT == 1) controller */
++static int ehci_reset(struct usb_hcd *hcd)
++{
++	return isp1760_hcd_set_and_wait_swap(hcd, CMD_RESET, 250 * 1000);
++}
++
++static struct isp1760_qh *qh_alloc(gfp_t flags)
++{
++	struct isp1760_qh *qh;
++
++	qh = kmem_cache_alloc(qh_cachep, flags);
++	if (!qh)
++		return NULL;
++
++	memset(qh, '\0', qh_cachep->sz);
++	INIT_LIST_HEAD(&qh->qh_list);
++	INIT_LIST_HEAD(&qh->qtd_list);
++	qh->slot = -1;
++
++	return qh;
++}
++
++static void qh_free(struct isp1760_qh *qh)
++{
++	WARN_ON(!list_empty(&qh->qtd_list));
++	WARN_ON(qh->slot > -1);
++	kmem_cache_free(qh_cachep, qh);
++}
++
++/* one-time init, only for memory state */
++static int priv_init(struct usb_hcd *hcd)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++	u32 isoc_cache;
++	u32 isoc_thres;
++	int i;
++
++	spin_lock_init(&priv->lock);
++
++	for (i = 0; i < QH_END; i++)
++		INIT_LIST_HEAD(&priv->qh_list[i]);
++
++	/*
++	 * hw default: 1K periodic list heads, one per frame.
++	 * periodic_size can shrink by USBCMD update if hcc_params allows.
++	 */
++	priv->periodic_size = DEFAULT_I_TDPS;
++
++	if (priv->is_isp1763) {
++		priv->i_thresh = 2;
++		return 0;
++	}
++
++	/* controllers may cache some of the periodic schedule ... */
++	isoc_cache = isp1760_hcd_read(hcd, HCC_ISOC_CACHE);
++	isoc_thres = isp1760_hcd_read(hcd, HCC_ISOC_THRES);
++
++	/* full frame cache */
++	if (isoc_cache)
++		priv->i_thresh = 8;
++	else /* N microframes cached */
++		priv->i_thresh = 2 + isoc_thres;
++
++	return 0;
++}
++
++static int isp1760_hc_setup(struct usb_hcd *hcd)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++	u32 atx_reset;
++	int result;
++	u32 scratch;
++	u32 pattern;
++
++	if (priv->is_isp1763)
++		pattern = 0xcafe;
++	else
++		pattern = 0xdeadcafe;
++
++	isp1760_hcd_write(hcd, HC_SCRATCH, pattern);
++
++	/* Change bus pattern */
++	scratch = isp1760_hcd_read(hcd, HC_CHIP_ID_HIGH);
++	scratch = isp1760_hcd_read(hcd, HC_SCRATCH);
++	if (scratch != pattern) {
++		printf("Scratch test failed. 0x%08x\n", scratch);
++		return -ENODEV;
++	}
++
++	/*
++	 * The RESET_HC bit in the SW_RESET register is supposed to reset the
++	 * host controller without touching the CPU interface registers, but at
++	 * least on the ISP1761 it seems to behave as the RESET_ALL bit and
++	 * reset the whole device. We thus can't use it here, so let's reset
++	 * the host controller through the EHCI USB Command register. The device
++	 * has been reset in core code anyway, so this shouldn't matter.
++	 */
++	isp1760_hcd_clear(hcd, ISO_BUF_FILL);
++	isp1760_hcd_clear(hcd, INT_BUF_FILL);
++	isp1760_hcd_clear(hcd, ATL_BUF_FILL);
++
++	isp1760_hcd_set(hcd, HC_ATL_PTD_SKIPMAP);
++	isp1760_hcd_set(hcd, HC_INT_PTD_SKIPMAP);
++	isp1760_hcd_set(hcd, HC_ISO_PTD_SKIPMAP);
++
++	result = ehci_reset(hcd);
++	if (result)
++		return result;
++
++	/* Step 11 passed */
++
++	/* ATL reset */
++	if (priv->is_isp1763)
++		atx_reset = SW_RESET_RESET_ATX;
++	else
++		atx_reset = ALL_ATX_RESET;
++
++	isp1760_hcd_set(hcd, atx_reset);
++	mdelay(10);
++	isp1760_hcd_clear(hcd, atx_reset);
++
++	if (priv->is_isp1763) {
++		isp1760_hcd_set(hcd, HW_OTG_DISABLE);
++		isp1760_hcd_set(hcd, HW_SW_SEL_HC_DC_CLEAR);
++		isp1760_hcd_set(hcd, HW_HC_2_DIS_CLEAR);
++		isp1760_hcd_set(hcd, HW_DM_PULLDOWN);
++		isp1760_hcd_set(hcd, HW_DP_PULLDOWN);
++		mdelay(10);
++
++		isp1760_hcd_set(hcd, HW_INTF_LOCK);
++	}
++
++	isp1760_hcd_set(hcd, HC_INT_IRQ_ENABLE);
++	isp1760_hcd_set(hcd, HC_ATL_IRQ_ENABLE);
++
++	return priv_init(hcd);
++}
++
++static u32 base_to_chip(u32 base)
++{
++	return ((base - 0x400) >> 3);
++}
++
++static int last_qtd_of_urb(struct isp1760_qtd *qtd, struct isp1760_qh *qh)
++{
++	struct urb *urb;
++
++	if (list_is_last(&qtd->qtd_list, &qh->qtd_list))
++		return 1;
++
++	urb = qtd->urb;
++	qtd = list_entry(qtd->qtd_list.next, typeof(*qtd), qtd_list);
++
++	return (qtd->urb != urb);
++}
++
++/* magic numbers that can affect system performance */
++#define	EHCI_TUNE_CERR		3	/* 0-3 qtd retries; 0 == don't stop */
++#define	EHCI_TUNE_RL_HS		4	/* nak throttle; see 4.9 */
++#define	EHCI_TUNE_RL_TT		0
++#define	EHCI_TUNE_MULT_HS	1	/* 1-3 transactions/uframe; 4.10.3 */
++#define	EHCI_TUNE_MULT_TT	1
++#define	EHCI_TUNE_FLS		2	/* (small) 256 frame schedule */
++
++static void create_ptd_atl(struct isp1760_qh *qh, struct isp1760_qtd *qtd,
++			   struct ptd *ptd)
++{
++	u32 maxpacket;
++	u32 multi;
++	u32 rl = RL_COUNTER;
++	u32 nak = NAK_COUNTER;
++	u8 portnr;
++	u8 hubaddr;
++
++	memset(ptd, 0, sizeof(*ptd));
++
++	/* according to 3.6.2, max packet len can not be > 0x400 */
++	maxpacket = usb_maxpacket(qtd->urb->dev, qtd->urb->pipe);
++	multi =  1 + ((maxpacket >> 11) & 0x3);
++	maxpacket &= 0x7ff;
++
++	/* DW0 */
++	ptd->dw0 = DW0_VALID_BIT;
++	ptd->dw0 |= TO_DW0_LENGTH(qtd->length);
++	ptd->dw0 |= TO_DW0_MAXPACKET(maxpacket);
++	ptd->dw0 |= TO_DW0_ENDPOINT(usb_pipeendpoint(qtd->urb->pipe));
++
++	/* DW1 */
++	ptd->dw1 = TO_DW((usb_pipeendpoint(qtd->urb->pipe) >> 1));
++	ptd->dw1 |= TO_DW1_DEVICE_ADDR(usb_pipedevice(qtd->urb->pipe));
++	ptd->dw1 |= TO_DW1_PID_TOKEN(qtd->packet_type);
++
++	if (usb_pipebulk(qtd->urb->pipe))
++		ptd->dw1 |= DW1_TRANS_BULK;
++	else if  (usb_pipeint(qtd->urb->pipe))
++		ptd->dw1 |= DW1_TRANS_INT;
++
++	if (qtd->urb->dev->speed != USB_SPEED_HIGH) {
++		/* split transaction */
++
++		ptd->dw1 |= DW1_TRANS_SPLIT;
++		if (qtd->urb->dev->speed == USB_SPEED_LOW)
++			ptd->dw1 |= DW1_SE_USB_LOSPEED;
++
++		if (!qtd->urb->dev->dev->parent_priv_) {
++			portnr = qtd->urb->dev->portnr;
++			hubaddr = qtd->urb->dev->devnum;
++		} else {
++			usb_find_usb2_hub_address_port(qtd->urb->dev, &hubaddr,
++						       &portnr);
++		}
++
++		ptd->dw1 |= TO_DW1_PORT_NUM(portnr);
++		ptd->dw1 |= TO_DW1_HUB_NUM(hubaddr);
++
++		/* SE bit for Split INT transfers */
++		if (usb_pipeint(qtd->urb->pipe) &&
++				(qtd->urb->dev->speed == USB_SPEED_LOW))
++			ptd->dw1 |= DW1_SE_USB_LOSPEED;
++
++		rl = 0;
++		nak = 0;
++	} else {
++		ptd->dw0 |= TO_DW0_MULTI(multi);
++		if (usb_pipecontrol(qtd->urb->pipe) ||
++						usb_pipebulk(qtd->urb->pipe))
++			ptd->dw3 |= TO_DW3_PING(qh->ping);
++	}
++	/* DW2 */
++	ptd->dw2 = 0;
++	ptd->dw2 |= TO_DW2_DATA_START_ADDR(base_to_chip(qtd->payload_addr));
++	ptd->dw2 |= TO_DW2_RL(rl);
++
++	/* DW3 */
++	ptd->dw3 |= TO_DW3_NAKCOUNT(nak);
++	ptd->dw3 |= TO_DW3_DATA_TOGGLE(qh->toggle);
++
++	if (usb_pipecontrol(qtd->urb->pipe)) {
++		if (qtd->data_buffer == qtd->urb->setup_packet) {
++			ptd->dw3 &= ~TO_DW3_DATA_TOGGLE(1);
++		} else if (last_qtd_of_urb(qtd, qh)) {
++			ptd->dw3 |= TO_DW3_DATA_TOGGLE(1);
++		}
++	}
++
++	ptd->dw3 |= DW3_ACTIVE_BIT;
++	/* Cerr */
++	ptd->dw3 |= TO_DW3_CERR(ERR_COUNTER);
++}
++
++static void transform_add_int(struct isp1760_qh *qh, struct isp1760_qtd *qtd,
++			      struct ptd *ptd)
++{
++	struct usb_host_endpoint *hep = qtd->urb->ep;
++	struct usb_endpoint_descriptor *epd = &hep->desc;
++	u32 usof;
++	u32 period;
++
++	/*
++	 * Most of this is guessing. ISP1761 datasheet is quite unclear, and
++	 * the algorithm from the original Philips driver code, which was
++	 * pretty much used in this driver before as well, is quite horrendous
++	 * and, i believe, incorrect. The code below follows the datasheet and
++	 * USB2.0 spec as far as I can tell, and plug/unplug seems to be much
++	 * more reliable this way (fingers crossed...).
++	 */
++
++	if (qtd->urb->dev->speed == USB_SPEED_HIGH) {
++		/* urb->interval is in units of microframes (1/8 ms) */
++		period = epd->bInterval >> 3;
++
++		if (epd->bInterval > 4)
++			usof = 0x01; /* One bit set =>
++						interval 1 ms * uFrame-match */
++		else if (epd->bInterval > 2)
++			usof = 0x22; /* Two bits set => interval 1/2 ms */
++		else if (epd->bInterval > 1)
++			usof = 0x55; /* Four bits set => interval 1/4 ms */
++		else
++			usof = 0xff; /* All bits set => interval 1/8 ms */
++	} else {
++		/* urb->interval is in units of frames (1 ms) */
++		period = epd->bInterval;
++		usof = 0x0f;		/* Execute Start Split on any of the
++					   four first uFrames */
++
++		/*
++		 * First 8 bits in dw5 is uSCS and "specifies which uSOF the
++		 * complete split needs to be sent. Valid only for IN." Also,
++		 * "All bits can be set to one for every transfer." (p 82,
++		 * ISP1761 data sheet.) 0x1c is from Philips driver. Where did
++		 * that number come from? 0xff seems to work fine...
++		 */
++		/* ptd->dw5 = 0x1c; */
++		ptd->dw5 = TO_DW(0xff); /* Execute Complete Split on any uFrame */
++	}
++
++	period = period >> 1;/* Ensure equal or shorter period than requested */
++	period &= 0xf8; /* Mask off too large values and lowest unused 3 bits */
++
++	ptd->dw2 |= TO_DW(period);
++	ptd->dw4 = TO_DW(usof);
++}
++
++static void create_ptd_int(struct isp1760_qh *qh, struct isp1760_qtd *qtd,
++			   struct ptd *ptd)
++{
++	create_ptd_atl(qh, qtd, ptd);
++	transform_add_int(qh, qtd, ptd);
++}
++
++static void isp1760_urb_done(struct usb_hcd *hcd, struct urb *urb)
++{
++	if (usb_pipein(urb->pipe) && usb_pipetype(urb->pipe) != PIPE_CONTROL) {
++		void *ptr;
++		for (ptr = urb->transfer_buffer;
++		     ptr < urb->transfer_buffer + urb->transfer_buffer_length;
++		     ptr += PAGE_SIZE)
++			flush_dcache_range((unsigned  long)ptr,
++					   (unsigned long)ptr + PAGE_SIZE);
++	}
++
++	/* complete() can reenter this HCD */
++	usb_hcd_unlink_urb_from_ep(hcd, urb);
++	usb_hcd_giveback_urb(hcd, urb, urb->status);
++}
++
++static struct isp1760_qtd *qtd_alloc(gfp_t flags, struct urb *urb,
++				     u8 packet_type)
++{
++	struct isp1760_qtd *qtd;
++
++	qtd = kmem_cache_alloc(qtd_cachep, flags);
++	if (!qtd)
++		return NULL;
++
++	memset(qtd, '\0', sizeof(*qtd));
++	INIT_LIST_HEAD(&qtd->qtd_list);
++	qtd->urb = urb;
++	qtd->packet_type = packet_type;
++	qtd->status = QTD_ENQUEUED;
++	qtd->actual_length = 0;
++
++	return qtd;
++}
++
++static void qtd_free(struct isp1760_qtd *qtd)
++{
++	WARN_ON(qtd->payload_addr);
++	kmem_cache_free(qtd_cachep, qtd);
++}
++
++static void start_bus_transfer(struct usb_hcd *hcd, u32 ptd_offset, int slot,
++				struct isp1760_slotinfo *slots,
++				struct isp1760_qtd *qtd, struct isp1760_qh *qh,
++				struct ptd *ptd)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++	const struct isp1760_memory_layout *mem = priv->memory_layout;
++	int skip_map;
++
++	WARN_ON((slot < 0) || (slot > mem->slot_num - 1));
++	WARN_ON(qtd->length && !qtd->payload_addr);
++	WARN_ON(slots[slot].qtd);
++	WARN_ON(slots[slot].qh);
++	WARN_ON(qtd->status != QTD_PAYLOAD_ALLOC);
++
++	if (priv->is_isp1763)
++		ndelay(100);
++
++	/* Make sure done map has not triggered from some unlinked transfer */
++	if (ptd_offset == ATL_PTD_OFFSET) {
++		skip_map = isp1760_hcd_read(hcd, HC_ATL_PTD_SKIPMAP);
++		isp1760_hcd_write(hcd, HC_ATL_PTD_SKIPMAP,
++				  skip_map | (1 << slot));
++		priv->atl_done_map |= isp1760_hcd_read(hcd, HC_ATL_PTD_DONEMAP);
++		priv->atl_done_map &= ~(1 << slot);
++	} else {
++		skip_map = isp1760_hcd_read(hcd, HC_INT_PTD_SKIPMAP);
++		isp1760_hcd_write(hcd, HC_INT_PTD_SKIPMAP,
++				  skip_map | (1 << slot));
++		priv->int_done_map |= isp1760_hcd_read(hcd, HC_INT_PTD_DONEMAP);
++		priv->int_done_map &= ~(1 << slot);
++	}
++
++	skip_map &= ~(1 << slot);
++	qh->slot = slot;
++	qtd->status = QTD_XFER_STARTED;
++	slots[slot].qtd = qtd;
++	slots[slot].qh = qh;
++
++	ptd_write(hcd, ptd_offset, slot, ptd);
++
++	if (ptd_offset == ATL_PTD_OFFSET)
++		isp1760_hcd_write(hcd, HC_ATL_PTD_SKIPMAP, skip_map);
++	else
++		isp1760_hcd_write(hcd, HC_INT_PTD_SKIPMAP, skip_map);
++}
++
++static int is_short_bulk(struct isp1760_qtd *qtd)
++{
++	return (usb_pipebulk(qtd->urb->pipe) &&
++					(qtd->actual_length < qtd->length));
++}
++
++static void collect_qtds(struct usb_hcd *hcd, struct isp1760_qh *qh,
++						struct list_head *urb_list)
++{
++	struct isp1760_qtd *qtd, *qtd_next;
++	struct urb_listitem *urb_listitem;
++	int last_qtd;
++
++	list_for_each_entry_safe(qtd, qtd_next, &qh->qtd_list, qtd_list) {
++		if (qtd->status < QTD_XFER_COMPLETE)
++			break;
++
++		last_qtd = last_qtd_of_urb(qtd, qh);
++
++		if ((!last_qtd) && (qtd->status == QTD_RETIRE))
++			qtd_next->status = QTD_RETIRE;
++
++		if (qtd->status == QTD_XFER_COMPLETE) {
++			if (qtd->actual_length) {
++				switch (qtd->packet_type) {
++				case IN_PID:
++					mem_read(hcd, qtd->payload_addr,
++						 qtd->data_buffer,
++						 qtd->actual_length);
++					fallthrough;
++				case OUT_PID:
++					qtd->urb->actual_length +=
++							qtd->actual_length;
++					fallthrough;
++				case SETUP_PID:
++					break;
++				}
++			}
++
++			if (is_short_bulk(qtd)) {
++				if (qtd->urb->transfer_flags & URB_SHORT_NOT_OK)
++					qtd->urb->status = -EREMOTEIO;
++				if (!last_qtd)
++					qtd_next->status = QTD_RETIRE;
++			}
++		}
++
++		if (qtd->payload_addr)
++			free_mem(hcd, qtd);
++
++		if (last_qtd) {
++			if ((qtd->status == QTD_RETIRE) &&
++					(qtd->urb->status == -EINPROGRESS))
++				qtd->urb->status = -EPIPE;
++			/* Defer calling of urb_done() since it releases lock */
++			urb_listitem = kmem_cache_alloc(urb_listitem_cachep,
++								GFP_ATOMIC);
++			if (unlikely(!urb_listitem))
++				break; /* Try again on next call */
++			urb_listitem->urb = qtd->urb;
++			list_add_tail(&urb_listitem->urb_list, urb_list);
++		}
++
++		list_del(&qtd->qtd_list);
++		qtd_free(qtd);
++	}
++}
++
++#define ENQUEUE_DEPTH	2
++static void enqueue_qtds(struct usb_hcd *hcd, struct isp1760_qh *qh)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++	const struct isp1760_memory_layout *mem = priv->memory_layout;
++	int slot_num = mem->slot_num;
++	int ptd_offset;
++	struct isp1760_slotinfo *slots;
++	int curr_slot, free_slot;
++	int n;
++	struct ptd ptd;
++	struct isp1760_qtd *qtd;
++
++	if (unlikely(list_empty(&qh->qtd_list)))
++		return;
++
++	/* Make sure this endpoint's TT buffer is clean before queueing ptds */
++	if (qh->tt_buffer_dirty)
++		return;
++
++	if (usb_pipeint(list_entry(qh->qtd_list.next, struct isp1760_qtd,
++				   qtd_list)->urb->pipe)) {
++		ptd_offset = INT_PTD_OFFSET;
++		slots = priv->int_slots;
++	} else {
++		ptd_offset = ATL_PTD_OFFSET;
++		slots = priv->atl_slots;
++	}
++
++	free_slot = -1;
++	for (curr_slot = 0; curr_slot < slot_num; curr_slot++) {
++		if ((free_slot == -1) && (slots[curr_slot].qtd == NULL))
++			free_slot = curr_slot;
++		if (slots[curr_slot].qh == qh)
++			break;
++	}
++
++	n = 0;
++	list_for_each_entry(qtd, &qh->qtd_list, qtd_list) {
++		if (qtd->status == QTD_ENQUEUED) {
++			WARN_ON(qtd->payload_addr);
++			alloc_mem(hcd, qtd);
++			if ((qtd->length) && (!qtd->payload_addr))
++				break;
++
++			if (qtd->length && (qtd->packet_type == SETUP_PID ||
++					    qtd->packet_type == OUT_PID)) {
++				mem_write(hcd, qtd->payload_addr,
++					  qtd->data_buffer, qtd->length);
++			}
++
++			qtd->status = QTD_PAYLOAD_ALLOC;
++		}
++
++		if (qtd->status == QTD_PAYLOAD_ALLOC) {
++/*
++			if ((curr_slot > 31) && (free_slot == -1))
++				printf("%s: No slot "
++					"available for transfer\n", __func__);
++*/
++			/* Start xfer for this endpoint if not already done */
++			if ((curr_slot > slot_num - 1) && (free_slot > -1)) {
++				if (usb_pipeint(qtd->urb->pipe))
++					create_ptd_int(qh, qtd, &ptd);
++				else
++					create_ptd_atl(qh, qtd, &ptd);
++
++				start_bus_transfer(hcd, ptd_offset, free_slot,
++							slots, qtd, qh, &ptd);
++				curr_slot = free_slot;
++			}
++
++			n++;
++			if (n >= ENQUEUE_DEPTH)
++				break;
++		}
++	}
++}
++
++static void schedule_ptds(struct usb_hcd *hcd)
++{
++	struct isp1760_hcd *priv;
++	struct isp1760_qh *qh, *qh_next;
++	struct list_head *ep_queue;
++	LIST_HEAD(urb_list);
++	struct urb_listitem *urb_listitem, *urb_listitem_next;
++	int i;
++
++	if (!hcd) {
++		WARN_ON(1);
++		return;
++	}
++
++	priv = hcd_to_priv(hcd);
++
++	/*
++	 * check finished/retired xfers, transfer payloads, call urb_done()
++	 */
++	for (i = 0; i < QH_END; i++) {
++		ep_queue = &priv->qh_list[i];
++		list_for_each_entry_safe(qh, qh_next, ep_queue, qh_list)
++			collect_qtds(hcd, qh, &urb_list);
++	}
++
++	list_for_each_entry_safe(urb_listitem, urb_listitem_next, &urb_list,
++				 urb_list) {
++		isp1760_urb_done(hcd, urb_listitem->urb);
++		kmem_cache_free(urb_listitem_cachep, urb_listitem);
++	}
++
++	/*
++	 * Schedule packets for transfer.
++	 *
++	 * According to USB2.0 specification:
++	 *
++	 * 1st prio: interrupt xfers, up to 80 % of bandwidth
++	 * 2nd prio: control xfers
++	 * 3rd prio: bulk xfers
++	 *
++	 * ... but let's use a simpler scheme here (mostly because ISP1761 doc
++	 * is very unclear on how to prioritize traffic):
++	 *
++	 * 1) Enqueue any queued control transfers, as long as payload chip mem
++	 *    and PTD ATL slots are available.
++	 * 2) Enqueue any queued INT transfers, as long as payload chip mem
++	 *    and PTD INT slots are available.
++	 * 3) Enqueue any queued bulk transfers, as long as payload chip mem
++	 *    and PTD ATL slots are available.
++	 *
++	 * Use double buffering (ENQUEUE_DEPTH==2) as a compromise between
++	 * conservation of chip mem and performance.
++	 *
++	 * I'm sure this scheme could be improved upon!
++	 */
++	for (i = 0; i < QH_END; i++) {
++		ep_queue = &priv->qh_list[i];
++		list_for_each_entry_safe(qh, qh_next, ep_queue, qh_list)
++			enqueue_qtds(hcd, qh);
++	}
++}
++
++#define PTD_STATE_QTD_DONE	1
++#define PTD_STATE_QTD_RELOAD	2
++#define PTD_STATE_URB_RETIRE	3
++
++static int check_int_transfer(struct usb_hcd *hcd, struct ptd *ptd,
++								struct urb *urb)
++{
++	u32 dw4;
++	int i;
++
++	dw4 = TO_U32(ptd->dw4);
++	dw4 >>= 8;
++
++	/* FIXME: ISP1761 datasheet does not say what to do with these. Do we
++	   need to handle these errors? Is it done in hardware? */
++	if (ptd->dw3 & DW3_HALT_BIT) {
++
++		urb->status = -EPROTO; /* Default unknown error */
++
++		for (i = 0; i < 8; i++) {
++			switch (dw4 & 0x7) {
++			case INT_UNDERRUN:
++				printf("underrun during uFrame %d\n", i);
++				urb->status = -ECOMM; /* Could not write data */
++				break;
++			case INT_EXACT:
++				printf("transaction error uFrame %d\n", i);
++				urb->status = -EPROTO; /* timeout, bad CRC, PID
++							  error etc. */
++				break;
++			case INT_BABBLE:
++				printf("babble error during uFrame %d\n", i);
++				urb->status = -EOVERFLOW;
++				break;
++			}
++			dw4 >>= 3;
++		}
++
++		return PTD_STATE_URB_RETIRE;
++	}
++
++	return PTD_STATE_QTD_DONE;
++}
++
++static int check_atl_transfer(struct usb_hcd *hcd, struct ptd *ptd,
++			      struct urb *urb)
++{
++	WARN_ON(!ptd);
++	if (ptd->dw3 & DW3_HALT_BIT) {
++		if (ptd->dw3 & DW3_BABBLE_BIT)
++			urb->status = -EOVERFLOW;
++		else if (FROM_DW3_CERR(ptd->dw3))
++			urb->status = -EPIPE;  /* Stall */
++		else
++			urb->status = -EPROTO; /* Unknown */
++
++		/* usefull debug
++		printf("%s: ptd error:\n"
++			"        dw0: %08x dw1: %08x dw2: %08x dw3: %08x\n"
++			"        dw4: %08x dw5: %08x dw6: %08x dw7: %08x\n",
++			__func__,
++			ptd->dw0, ptd->dw1, ptd->dw2, ptd->dw3,
++			ptd->dw4, ptd->dw5, ptd->dw6, ptd->dw7);
++		*/
++
++		return PTD_STATE_URB_RETIRE;
++	}
++
++	/* Transfer Error, *but* active and no HALT -> reload */
++	if ((ptd->dw3 & DW3_ERROR_BIT) && (ptd->dw3 & DW3_ACTIVE_BIT))
++		return PTD_STATE_QTD_RELOAD;
++
++	/*
++	* NAKs are handled in HW by the chip. Usually if the
++	* device is not able to send data fast enough.
++	* This happens mostly on slower hardware.
++	*/
++	if (!FROM_DW3_NAKCOUNT(ptd->dw3) && (ptd->dw3 & DW3_ACTIVE_BIT))
++		return PTD_STATE_QTD_RELOAD;
++
++	return PTD_STATE_QTD_DONE;
++}
++
++static void handle_done_ptds(struct usb_hcd *hcd)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++	struct isp1760_slotinfo *slots;
++	struct isp1760_qtd *qtd;
++	struct isp1760_qh *qh;
++	struct ptd ptd;
++	u32 ptd_offset;
++	int modified;
++	int skip_map;
++	int state;
++	int slot;
++
++	skip_map = isp1760_hcd_read(hcd, HC_INT_PTD_SKIPMAP);
++	priv->int_done_map &= ~skip_map;
++	skip_map = isp1760_hcd_read(hcd, HC_ATL_PTD_SKIPMAP);
++	priv->atl_done_map &= ~skip_map;
++
++	modified = priv->int_done_map || priv->atl_done_map;
++
++	while (priv->int_done_map || priv->atl_done_map) {
++		if (priv->int_done_map) {
++			/* INT ptd */
++			slot = __ffs(priv->int_done_map);
++			priv->int_done_map &= ~(1 << slot);
++			slots = priv->int_slots;
++			/* This should not trigger, and could be removed if
++			   noone have any problems with it triggering: */
++			if (!slots[slot].qh) {
++				WARN_ON(1);
++				continue;
++			}
++			ptd_offset = INT_PTD_OFFSET;
++			ptd_read(hcd, INT_PTD_OFFSET, slot, &ptd);
++			state = check_int_transfer(hcd, &ptd,
++						   slots[slot].qtd->urb);
++		} else {
++			/* ATL ptd */
++			slot = __ffs(priv->atl_done_map);
++			priv->atl_done_map &= ~(1 << slot);
++			slots = priv->atl_slots;
++			/* This should not trigger, and could be removed if
++			   noone have any problems with it triggering: */
++			if (!slots[slot].qh) {
++				WARN_ON(1);
++				continue;
++			}
++			ptd_offset = ATL_PTD_OFFSET;
++			ptd_read(hcd, ATL_PTD_OFFSET, slot, &ptd);
++			state = check_atl_transfer(hcd, &ptd,
++						   slots[slot].qtd->urb);
++		}
++
++		qtd = slots[slot].qtd;
++		slots[slot].qtd = NULL;
++		qh = slots[slot].qh;
++		slots[slot].qh = NULL;
++		qh->slot = -1;
++
++		WARN_ON(qtd->status != QTD_XFER_STARTED);
++
++		switch (state) {
++		case PTD_STATE_QTD_DONE:
++			if ((usb_pipeint(qtd->urb->pipe)) &&
++			    (qtd->urb->dev->speed != USB_SPEED_HIGH))
++				qtd->actual_length =
++				       FROM_DW3_SCS_NRBYTESTRANSFERRED(ptd.dw3);
++			else
++				qtd->actual_length =
++					FROM_DW3_NRBYTESTRANSFERRED(ptd.dw3);
++
++			qtd->status = QTD_XFER_COMPLETE;
++
++			if (list_is_last(&qtd->qtd_list, &qh->qtd_list) ||
++			    is_short_bulk(qtd))
++				qtd = NULL;
++			else
++				qtd = list_entry(qtd->qtd_list.next,
++							typeof(*qtd), qtd_list);
++
++			qh->toggle = FROM_DW3_DATA_TOGGLE(ptd.dw3);
++			qh->ping = FROM_DW3_PING(ptd.dw3);
++
++			break;
++
++		case PTD_STATE_QTD_RELOAD: /* QTD_RETRY, for atls only */
++			qtd->status = QTD_PAYLOAD_ALLOC;
++			ptd.dw0 |= DW0_VALID_BIT;
++			/* RL counter = ERR counter */
++			ptd.dw3 &= ~TO_DW3_NAKCOUNT(0xf);
++			ptd.dw3 |= TO_DW3_NAKCOUNT(FROM_DW2_RL(ptd.dw2));
++			ptd.dw3 &= ~TO_DW3_CERR(3);
++			ptd.dw3 |= TO_DW3_CERR(ERR_COUNTER);
++
++			qh->toggle = FROM_DW3_DATA_TOGGLE(ptd.dw3);
++			qh->ping = FROM_DW3_PING(ptd.dw3);
++			break;
++
++		case PTD_STATE_URB_RETIRE:
++			qtd->status = QTD_RETIRE;
++			qtd = NULL;
++			qh->toggle = 0;
++			qh->ping = 0;
++			break;
++
++		default:
++			WARN_ON(1);
++			continue;
++		}
++
++		if (qtd && (qtd->status == QTD_PAYLOAD_ALLOC)) {
++			if (slots == priv->int_slots) {
++				if (state == PTD_STATE_QTD_RELOAD)
++					dev_err(priv->dev,
++						"%s: PTD_STATE_QTD_RELOAD on "
++						"interrupt packet\n", __func__);
++				if (state != PTD_STATE_QTD_RELOAD)
++					create_ptd_int(qh, qtd, &ptd);
++			} else {
++				if (state != PTD_STATE_QTD_RELOAD)
++					create_ptd_atl(qh, qtd, &ptd);
++			}
++
++			start_bus_transfer(hcd, ptd_offset, slot, slots, qtd,
++				qh, &ptd);
++		}
++	}
++
++	if (modified)
++		schedule_ptds(hcd);
++}
++
++static irqreturn_t isp1760_irq(int irq, void *__hci)
++{
++	struct usb_hcd *hcd = __hci;
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++	irqreturn_t irqret = IRQ_NONE;
++	u32 int_reg;
++	u32 imask;
++
++	imask = isp1760_hcd_read(hcd, HC_INTERRUPT);
++	if (unlikely(!imask))
++		return irqret;
++
++	int_reg = priv->is_isp1763 ? ISP1763_HC_INTERRUPT :
++		ISP176x_HC_INTERRUPT;
++	isp1760_reg_write(priv->regs, int_reg, imask);
++
++	priv->int_done_map |= isp1760_hcd_read(hcd, HC_INT_PTD_DONEMAP);
++	priv->atl_done_map |= isp1760_hcd_read(hcd, HC_ATL_PTD_DONEMAP);
++
++	handle_done_ptds(hcd);
++
++	irqret = IRQ_HANDLED;
++
++	return irqret;
++}
++
++static int isp1763_run(struct usb_hcd *hcd)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++	int retval;
++	u32 chipid_h;
++	u32 chipid_l;
++	u32 chip_rev;
++	u32 ptd_atl_int;
++	u32 ptd_iso;
++
++	chipid_h = isp1760_hcd_read(hcd, HC_CHIP_ID_HIGH);
++	chipid_l = isp1760_hcd_read(hcd, HC_CHIP_ID_LOW);
++	chip_rev = isp1760_hcd_read(hcd, HC_CHIP_REV);
++	printf("USB ISP %02x%02x HW rev. %d started\n", chipid_h,
++	       chipid_l, chip_rev);
++
++	isp1760_hcd_clear(hcd, ISO_BUF_FILL);
++	isp1760_hcd_clear(hcd, INT_BUF_FILL);
++	isp1760_hcd_clear(hcd, ATL_BUF_FILL);
++
++	isp1760_hcd_set(hcd, HC_ATL_PTD_SKIPMAP);
++	isp1760_hcd_set(hcd, HC_INT_PTD_SKIPMAP);
++	isp1760_hcd_set(hcd, HC_ISO_PTD_SKIPMAP);
++	ndelay(100);
++	isp1760_hcd_clear(hcd, HC_ATL_PTD_DONEMAP);
++	isp1760_hcd_clear(hcd, HC_INT_PTD_DONEMAP);
++	isp1760_hcd_clear(hcd, HC_ISO_PTD_DONEMAP);
++
++	isp1760_hcd_set(hcd, HW_OTG_DISABLE);
++	isp1760_reg_write(priv->regs, ISP1763_HC_OTG_CTRL_CLEAR, BIT(7));
++	isp1760_reg_write(priv->regs, ISP1763_HC_OTG_CTRL_CLEAR, BIT(15));
++	mdelay(10);
++
++	isp1760_hcd_set(hcd, HC_INT_IRQ_ENABLE);
++	isp1760_hcd_set(hcd, HC_ATL_IRQ_ENABLE);
++
++	isp1760_hcd_set(hcd, HW_GLOBAL_INTR_EN);
++
++	isp1760_hcd_clear(hcd, HC_ATL_IRQ_MASK_AND);
++	isp1760_hcd_clear(hcd, HC_INT_IRQ_MASK_AND);
++	isp1760_hcd_clear(hcd, HC_ISO_IRQ_MASK_AND);
++
++	isp1760_hcd_set(hcd, HC_ATL_IRQ_MASK_OR);
++	isp1760_hcd_set(hcd, HC_INT_IRQ_MASK_OR);
++	isp1760_hcd_set(hcd, HC_ISO_IRQ_MASK_OR);
++
++	ptd_atl_int = 0x8000;
++	ptd_iso = 0x0001;
++
++	isp1760_hcd_write(hcd, HC_ATL_PTD_LASTPTD, ptd_atl_int);
++	isp1760_hcd_write(hcd, HC_INT_PTD_LASTPTD, ptd_atl_int);
++	isp1760_hcd_write(hcd, HC_ISO_PTD_LASTPTD, ptd_iso);
++
++	isp1760_hcd_set(hcd, ATL_BUF_FILL);
++	isp1760_hcd_set(hcd, INT_BUF_FILL);
++
++	isp1760_hcd_clear(hcd, CMD_LRESET);
++	isp1760_hcd_clear(hcd, CMD_RESET);
++
++	retval = isp1760_hcd_set_and_wait(hcd, CMD_RUN, 250 * 1000);
++	if (retval)
++		return retval;
++
++	down_write(&ehci_cf_port_reset_rwsem);
++	retval = isp1760_hcd_set_and_wait(hcd, FLAG_CF, 250 * 1000);
++	up_write(&ehci_cf_port_reset_rwsem);
++	retval = 0;
++	if (retval)
++		return retval;
++
++	return 0;
++}
++
++static int isp1760_run(struct usb_hcd *hcd)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++	int retval;
++	u32 chipid_h;
++	u32 chipid_l;
++	u32 chip_rev;
++	u32 ptd_atl_int;
++	u32 ptd_iso;
++
++	/*
++	 * ISP1763 have some differences in the setup and order to enable
++	 * the ports, disable otg, setup buffers, and ATL, INT, ISO status.
++	 * So, just handle it a separate sequence.
++	 */
++	if (priv->is_isp1763)
++		return isp1763_run(hcd);
++
++	/* Set PTD interrupt AND & OR maps */
++	isp1760_hcd_clear(hcd, HC_ATL_IRQ_MASK_AND);
++	isp1760_hcd_clear(hcd, HC_INT_IRQ_MASK_AND);
++	isp1760_hcd_clear(hcd, HC_ISO_IRQ_MASK_AND);
++
++	isp1760_hcd_set(hcd, HC_ATL_IRQ_MASK_OR);
++	isp1760_hcd_set(hcd, HC_INT_IRQ_MASK_OR);
++	isp1760_hcd_set(hcd, HC_ISO_IRQ_MASK_OR);
++
++	/* step 23 passed */
++
++	isp1760_hcd_set(hcd, HW_GLOBAL_INTR_EN);
++
++	isp1760_hcd_clear(hcd, CMD_LRESET);
++	isp1760_hcd_clear(hcd, CMD_RESET);
++
++	retval = isp1760_hcd_set_and_wait(hcd, CMD_RUN, 250 * 1000);
++	if (retval)
++		return retval;
++
++	/*
++	 * XXX
++	 * Spec says to write FLAG_CF as last config action, priv code grabs
++	 * the semaphore while doing so.
++	 */
++	down_write(&ehci_cf_port_reset_rwsem);
++
++	retval = isp1760_hcd_set_and_wait(hcd, FLAG_CF, 250 * 1000);
++	up_write(&ehci_cf_port_reset_rwsem);
++	if (retval)
++		return retval;
++
++	chipid_h = isp1760_hcd_read(hcd, HC_CHIP_ID_HIGH);
++	chipid_l = isp1760_hcd_read(hcd, HC_CHIP_ID_LOW);
++	chip_rev = isp1760_hcd_read(hcd, HC_CHIP_REV);
++	dev_info(priv->dev, "USB ISP %02x%02x HW rev. %d started\n",
++		 chipid_h, chipid_l, chip_rev);
++
++	/* PTD Register Init Part 2, Step 28 */
++
++	/* Setup registers controlling PTD checking */
++	ptd_atl_int = 0x80000000;
++	ptd_iso = 0x00000001;
++
++	isp1760_hcd_write(hcd, HC_ATL_PTD_LASTPTD, ptd_atl_int);
++	isp1760_hcd_write(hcd, HC_INT_PTD_LASTPTD, ptd_atl_int);
++	isp1760_hcd_write(hcd, HC_ISO_PTD_LASTPTD, ptd_iso);
++
++	isp1760_hcd_set(hcd, HC_ATL_PTD_SKIPMAP);
++	isp1760_hcd_set(hcd, HC_INT_PTD_SKIPMAP);
++	isp1760_hcd_set(hcd, HC_ISO_PTD_SKIPMAP);
++
++	isp1760_hcd_set(hcd, ATL_BUF_FILL);
++	isp1760_hcd_set(hcd, INT_BUF_FILL);
++
++	/* GRR this is run-once init(), being done every time the HC starts.
++	 * So long as they're part of class devices, we can't do it init()
++	 * since the class device isn't created that early.
++	 */
++	return 0;
++}
++
++static int qtd_fill(struct isp1760_qtd *qtd, void *databuffer, size_t len)
++{
++	qtd->data_buffer = databuffer;
++
++	qtd->length = len;
++
++	return qtd->length;
++}
++
++static void qtd_list_free(struct list_head *qtd_list)
++{
++	struct isp1760_qtd *qtd, *qtd_next;
++
++	list_for_each_entry_safe(qtd, qtd_next, qtd_list, qtd_list) {
++		list_del(&qtd->qtd_list);
++		qtd_free(qtd);
++	}
++}
++
++/*
++ * Packetize urb->transfer_buffer into list of packets of size wMaxPacketSize.
++ * Also calculate the PID type (SETUP/IN/OUT) for each packet.
++ */
++#define max_packet(wMaxPacketSize) ((wMaxPacketSize) & 0x07ff)
++static void packetize_urb(struct usb_hcd *hcd,
++		struct urb *urb, struct list_head *head, gfp_t flags)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++	const struct isp1760_memory_layout *mem = priv->memory_layout;
++	struct isp1760_qtd *qtd;
++	void *buf;
++	int len, maxpacketsize;
++	u8 packet_type;
++
++	/*
++	 * URBs map to sequences of QTDs:  one logical transaction
++	 */
++
++	if (!urb->transfer_buffer && urb->transfer_buffer_length) {
++		/* XXX This looks like usb storage / SCSI bug */
++		dev_err(priv->dev, "buf is null, dma is %08lx len is %d\n",
++			(long unsigned)urb->transfer_dma,
++			urb->transfer_buffer_length);
++		WARN_ON(1);
++	}
++
++	if (usb_pipein(urb->pipe))
++		packet_type = IN_PID;
++	else
++		packet_type = OUT_PID;
++
++	if (usb_pipecontrol(urb->pipe)) {
++		qtd = qtd_alloc(flags, urb, SETUP_PID);
++		if (!qtd)
++			goto cleanup;
++		qtd_fill(qtd, urb->setup_packet, sizeof(struct usb_ctrlrequest));
++		list_add_tail(&qtd->qtd_list, head);
++
++		/* for zero length DATA stages, STATUS is always IN */
++		if (urb->transfer_buffer_length == 0)
++			packet_type = IN_PID;
++	}
++
++	maxpacketsize = max_packet(usb_maxpacket(urb->dev, urb->pipe));
++
++	/*
++	 * buffer gets wrapped in one or more qtds;
++	 * last one may be "short" (including zero len)
++	 * and may serve as a control status ack
++	 */
++	buf = urb->transfer_buffer;
++	len = urb->transfer_buffer_length;
++
++	for (;;) {
++		int this_qtd_len;
++
++		qtd = qtd_alloc(flags, urb, packet_type);
++		if (!qtd)
++			goto cleanup;
++
++		if (len > mem->blocks_size[ISP176x_BLOCK_NUM - 1])
++			len = mem->blocks_size[ISP176x_BLOCK_NUM - 1];
++
++		this_qtd_len = qtd_fill(qtd, buf, len);
++		list_add_tail(&qtd->qtd_list, head);
++
++		len -= this_qtd_len;
++		buf += this_qtd_len;
++
++		if (len <= 0)
++			break;
++	}
++
++	/*
++	 * control requests may need a terminating data "status" ack;
++	 * bulk ones may need a terminating short packet (zero length).
++	 */
++	if (urb->transfer_buffer_length != 0) {
++		int one_more = 0;
++
++		if (usb_pipecontrol(urb->pipe)) {
++			one_more = 1;
++			if (packet_type == IN_PID)
++				packet_type = OUT_PID;
++			else
++				packet_type = IN_PID;
++		} else if (usb_pipebulk(urb->pipe)
++			   && (urb->transfer_flags & URB_ZERO_PACKET)
++			   && !(urb->transfer_buffer_length %
++				maxpacketsize)) {
++			one_more = 1;
++		}
++		if (one_more) {
++			qtd = qtd_alloc(flags, urb, packet_type);
++			if (!qtd)
++				goto cleanup;
++
++			/* never any data in such packets */
++			qtd_fill(qtd, NULL, 0);
++			list_add_tail(&qtd->qtd_list, head);
++		}
++	}
++
++	return;
++
++cleanup:
++	qtd_list_free(head);
++}
++
++static int isp1760_urb_enqueue(struct usb_hcd *hcd, struct urb *urb,
++			       gfp_t mem_flags)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++	struct isp1760_qh *qh = NULL;
++	struct list_head *ep_queue;
++	LIST_HEAD(new_qtds);
++	int qh_in_queue;
++	int retval;
++	int epnum;
++
++	switch (usb_pipetype(urb->pipe)) {
++	case PIPE_CONTROL:
++		ep_queue = &priv->qh_list[QH_CONTROL];
++		break;
++	case PIPE_BULK:
++		ep_queue = &priv->qh_list[QH_BULK];
++		break;
++	case PIPE_INTERRUPT:
++		ep_queue = &priv->qh_list[QH_INTERRUPT];
++		break;
++	case PIPE_ISOCHRONOUS:
++		printf("isochronous USB packets not yet supported\n");
++		return -EPIPE;
++	default:
++		printf("unknown pipe type\n");
++		return -EPIPE;
++	}
++
++	if (usb_pipein(urb->pipe))
++		urb->actual_length = 0;
++
++	packetize_urb(hcd, urb, &new_qtds, mem_flags);
++	if (list_empty(&new_qtds))
++		return -ENOMEM;
++
++	retval = usb_hcd_link_urb_to_ep(hcd, urb);
++	if (retval) {
++		qtd_list_free(&new_qtds);
++		goto out;
++	}
++
++	epnum = usb_pipeendpoint(urb->pipe);
++
++	qh_in_queue = 0;
++	list_for_each_entry(qh, ep_queue, qh_list) {
++		if (qh->epnum == epnum) {
++			qh_in_queue = 1;
++			break;
++		}
++	}
++
++	if (!qh_in_queue) {
++		qh = qh_alloc(GFP_ATOMIC);
++		if (!qh) {
++			retval = -ENOMEM;
++			usb_hcd_unlink_urb_from_ep(hcd, urb);
++			qtd_list_free(&new_qtds);
++			goto out;
++		}
++
++		qh->epnum = epnum;
++		list_add_tail(&qh->qh_list, ep_queue);
++		urb->ep->hcpriv = qh;
++	}
++
++	list_splice_tail(&new_qtds, &qh->qtd_list);
++	schedule_ptds(hcd);
++
++out:
++	return retval;
++}
++
++static void kill_transfer(struct usb_hcd *hcd, struct urb *urb,
++		struct isp1760_qh *qh)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++	int skip_map;
++
++	WARN_ON(qh->slot == -1);
++
++	/* We need to forcefully reclaim the slot since some transfers never
++	   return, e.g. interrupt transfers and NAKed bulk transfers. */
++	if (usb_pipecontrol(urb->pipe) || usb_pipebulk(urb->pipe)) {
++		skip_map = isp1760_hcd_read(hcd, HC_ATL_PTD_SKIPMAP);
++		skip_map |= (1 << qh->slot);
++		isp1760_hcd_write(hcd, HC_ATL_PTD_SKIPMAP, skip_map);
++		ndelay(100);
++		priv->atl_slots[qh->slot].qh = NULL;
++		priv->atl_slots[qh->slot].qtd = NULL;
++	} else {
++		skip_map = isp1760_hcd_read(hcd, HC_INT_PTD_SKIPMAP);
++		skip_map |= (1 << qh->slot);
++		isp1760_hcd_write(hcd, HC_INT_PTD_SKIPMAP, skip_map);
++		priv->int_slots[qh->slot].qh = NULL;
++		priv->int_slots[qh->slot].qtd = NULL;
++	}
++
++	qh->slot = -1;
++}
++
++/*
++ * Retire the qtds beginning at 'qtd' and belonging all to the same urb, killing
++ * any active transfer belonging to the urb in the process.
++ */
++static void dequeue_urb_from_qtd(struct usb_hcd *hcd, struct isp1760_qh *qh,
++				 struct isp1760_qtd *qtd)
++{
++	struct urb *urb;
++	int urb_was_running;
++
++	urb = qtd->urb;
++	urb_was_running = 0;
++	list_for_each_entry_from(qtd, &qh->qtd_list, qtd_list) {
++		if (qtd->urb != urb)
++			break;
++
++		if (qtd->status >= QTD_XFER_STARTED)
++			urb_was_running = 1;
++		if (last_qtd_of_urb(qtd, qh) &&
++					(qtd->status >= QTD_XFER_COMPLETE))
++			urb_was_running = 0;
++
++		if (qtd->status == QTD_XFER_STARTED)
++			kill_transfer(hcd, urb, qh);
++		qtd->status = QTD_RETIRE;
++	}
++}
++
++int isp1760_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
++{
++	struct isp1760_qtd *qtd;
++	struct isp1760_qh *qh;
++	int retval = 0;
++
++	retval = usb_hcd_check_unlink_urb(hcd, urb, status);
++	if (retval)
++		goto out;
++
++	qh = urb->ep->hcpriv;
++	if (!qh) {
++		retval = -EINVAL;
++		goto out;
++	}
++
++	list_for_each_entry(qtd, &qh->qtd_list, qtd_list)
++		if (qtd->urb == urb) {
++			dequeue_urb_from_qtd(hcd, qh, qtd);
++			list_move(&qtd->qtd_list, &qh->qtd_list);
++			break;
++		}
++
++	urb->status = status;
++	schedule_ptds(hcd);
++
++out:
++	return retval;
++}
++
++static void isp1760_hub_descriptor(struct isp1760_hcd *priv,
++				   struct usb_hub_descriptor *desc)
++{
++	int ports;
++	u16 temp;
++
++	ports = isp1760_hcd_n_ports(priv->hcd);
++
++	desc->bDescriptorType = USB_DT_HUB;
++	/* priv 1.0, 2.3.9 says 20ms max */
++	desc->bPwrOn2PwrGood = 10;
++	desc->bHubContrCurrent = 0;
++
++	desc->bNbrPorts = ports;
++	temp = 1 + (ports / 8);
++	desc->bLength = 7 + 2 * temp;
++
++	/* ports removable, and usb 1.0 legacy PortPwrCtrlMask */
++	memset(&desc->u.hs.DeviceRemovable[0], 0, temp);
++	memset(&desc->u.hs.DeviceRemovable[temp], 0xff, temp);
++
++	/* per-port overcurrent reporting */
++	temp = HUB_CHAR_INDV_PORT_OCPM;
++	if (isp1760_hcd_ppc_is_set(priv->hcd))
++		/* per-port power control */
++		temp |= HUB_CHAR_INDV_PORT_LPSM;
++	else
++		/* no power switching */
++		temp |= HUB_CHAR_NO_LPSM;
++	desc->wHubCharacteristics = cpu_to_le16(temp);
++}
++
++#define	PORT_WAKE_BITS	(PORT_WKOC_E|PORT_WKDISC_E|PORT_WKCONN_E)
++
++static void check_reset_complete(struct usb_hcd *hcd, int index)
++{
++	if (!(isp1760_hcd_is_set(hcd, PORT_CONNECT)))
++		return;
++
++	/* if reset finished and it's still not enabled -- handoff */
++	if (!isp1760_hcd_is_set(hcd, PORT_PE)) {
++		printf("port %d full speed --> companion\n", index + 1);
++
++		isp1760_hcd_set(hcd, PORT_OWNER);
++
++		isp1760_hcd_clear(hcd, PORT_CSC);
++	} else {
++		printf("port %d high speed\n", index + 1);
++	}
++
++	return;
++}
++
++static int isp1760_hub_control(struct usb_hcd *hcd, struct usb_device *dev,
++			       unsigned long pipe, void *buffer, int length,
++			       struct devrequest *setup)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++	u16 typeReq, wValue, wIndex;
++	unsigned long flags;
++	char *buf = buffer;
++	void *src = NULL;
++	int src_len = 0;
++	int retval = 0;
++	u32 status;
++	int ports;
++
++	if (!setup)
++		return -EINVAL;
++
++	ports = isp1760_hcd_n_ports(hcd);
++
++	typeReq = setup->request | (setup->requesttype << 8);
++	wValue = le16_to_cpu(setup->value);
++	wIndex = le16_to_cpu(setup->index);
++
++	/*
++	 * FIXME:  support SetPortFeatures USB_PORT_FEAT_INDICATOR.
++	 * HCS_INDICATOR may say we can change LEDs to off/amber/green.
++	 * (track current state ourselves) ... blink for diagnostics,
++	 * power, "this is the one", etc.  EHCI spec supports this.
++	 */
++
++	switch (typeReq) {
++	case DeviceOutRequest | USB_REQ_SET_ADDRESS:
++		break;
++	case DeviceOutRequest | USB_REQ_SET_CONFIGURATION:
++		/* Nothing to do */
++		break;
++	case DeviceRequest | USB_REQ_GET_DESCRIPTOR:
++		switch (wValue & 0xff00) {
++		case USB_DT_DEVICE << 8:
++			src = &rh_descriptor.device;
++			src_len = 0x12;
++			break;
++		case USB_DT_CONFIG << 8:
++			src = &rh_descriptor.config;
++			src_len = 0x09;
++			break;
++		case USB_DT_STRING << 8:
++			switch (wValue & 0xff) {
++			case 0:	/* Language */
++				src = "\4\3\19\4";
++				src_len = 4;
++				break;
++			case 1:	/* Vendor String  */
++				src = "\16\3U\0-\0B\0o\0o\0t\0";
++				src_len = 14;
++				break;
++			case 2:	/* Product Name */
++				src = "\52\3I\0S\0P\0-\0 "
++					 "\0H\0o\0s\0t\0 "
++					 "\0C\0o\0n\0t\0r\0o\0l\0l\0e\0r\0";
++				src_len = 42;
++				break;
++			default:
++				goto error;
++			}
++			break;
++		}
++		break;
++	case ClearHubFeature:
++		switch (wValue) {
++		case C_HUB_LOCAL_POWER:
++		case C_HUB_OVER_CURRENT:
++			/* no hub-wide feature/status flags */
++			break;
++		default:
++			goto error;
++		}
++		break;
++	case ClearPortFeature:
++		if (!wIndex || wIndex > ports)
++			goto error;
++		wIndex--;
++
++		/*
++		 * Even if OWNER is set, so the port is owned by the
++		 * companion controller, hub_wq needs to be able to clear
++		 * the port-change status bits (especially
++		 * USB_PORT_STAT_C_CONNECTION).
++		 */
++
++		switch (wValue) {
++		case USB_PORT_FEAT_ENABLE:
++			isp1760_hcd_clear(hcd, PORT_PE);
++			break;
++		case USB_PORT_FEAT_C_ENABLE:
++			/* XXX error? */
++			break;
++		case USB_PORT_FEAT_SUSPEND:
++			if (isp1760_hcd_is_set(hcd, PORT_RESET))
++				goto error;
++
++			if (isp1760_hcd_is_set(hcd, PORT_SUSPEND)) {
++				if (!isp1760_hcd_is_set(hcd, PORT_PE))
++					goto error;
++				/* resume signaling for 20 msec */
++				isp1760_hcd_clear(hcd, PORT_CSC);
++				isp1760_hcd_set(hcd, PORT_RESUME);
++
++				priv->reset_done = get_timer(0) + 40;
++			}
++			break;
++		case USB_PORT_FEAT_C_SUSPEND:
++			/* we auto-clear this feature */
++			break;
++		case USB_PORT_FEAT_POWER:
++			if (isp1760_hcd_ppc_is_set(hcd))
++				isp1760_hcd_clear(hcd, PORT_POWER);
++			break;
++		case USB_PORT_FEAT_C_CONNECTION:
++			isp1760_hcd_set(hcd, PORT_CSC);
++			break;
++		case USB_PORT_FEAT_C_OVER_CURRENT:
++			/* XXX error ?*/
++			break;
++		case USB_PORT_FEAT_C_RESET:
++			/* GetPortStatus clears reset */
++			break;
++		default:
++			goto error;
++		}
++		isp1760_hcd_read(hcd, CMD_RUN);
++		break;
++	case GetHubDescriptor:
++		isp1760_hub_descriptor(priv, (struct usb_hub_descriptor *) buf);
++		break;
++	case GetHubStatus:
++		/* no hub-wide feature/status flags */
++		memset(buf, 0, 4);
++		break;
++	case GetPortStatus:
++		if (!wIndex || wIndex > ports)
++			goto error;
++		wIndex--;
++		status = 0;
++
++		/* wPortChange bits */
++		if (isp1760_hcd_is_set(hcd, PORT_CSC))
++			status |= USB_PORT_STAT_C_CONNECTION << 16;
++
++		/* whoever resumes must GetPortStatus to complete it!! */
++		if (isp1760_hcd_is_set(hcd, PORT_RESUME)) {
++			status |= USB_PORT_STAT_C_SUSPEND << 16;
++
++			if (!priv->reset_done) {
++				priv->reset_done = get_timer(0) + 20;
++			} else if (get_timer(0) > priv->reset_done) {
++				/* stop resume signaling */
++				isp1760_hcd_clear(hcd, PORT_CSC);
++
++				retval = isp1760_hcd_clear_and_wait(hcd,
++								    PORT_RESUME, 2000);
++				if (retval != 0) {
++					printf("port %d resume error %d\n",
++					       wIndex + 1, retval);
++					goto error;
++				}
++			}
++		}
++
++		/* whoever resets must GetPortStatus to complete it!! */
++		if (isp1760_hcd_is_set(hcd, PORT_RESET) &&
++		    get_timer(0) > priv->reset_done) {
++			status |= USB_PORT_STAT_C_RESET << 16;
++			priv->reset_done = 0;
++
++			/* force reset to complete */
++			/* REVISIT:  some hardware needs 550+ usec to clear
++			 * this bit; seems too long to spin routinely...
++			 */
++			retval = isp1760_hcd_clear_and_wait(hcd, PORT_RESET,
++							    750);
++			if (retval != 0) {
++				printf("port %d reset error %d\n", wIndex + 1,
++				       retval);
++				goto error;
++			}
++
++			/* see what we found out */
++			check_reset_complete(hcd, wIndex);
++		}
++		/*
++		 * Even if OWNER is set, there's no harm letting hub_wq
++		 * see the wPortStatus values (they should all be 0 except
++		 * for PORT_POWER anyway).
++		 */
++
++		if (isp1760_hcd_is_set(hcd, PORT_OWNER))
++			printf("PORT_OWNER is set\n");
++
++		if (isp1760_hcd_is_set(hcd, PORT_CONNECT)) {
++			status |= USB_PORT_STAT_CONNECTION;
++
++			/* status may be from integrated TT */
++			status |= USB_PORT_STAT_HIGH_SPEED;
++		}
++		if (isp1760_hcd_is_set(hcd, PORT_PE))
++			status |= USB_PORT_STAT_ENABLE;
++		if (isp1760_hcd_is_set(hcd, PORT_SUSPEND) &&
++		    isp1760_hcd_is_set(hcd, PORT_RESUME))
++			status |= USB_PORT_STAT_SUSPEND;
++		if (isp1760_hcd_is_set(hcd, PORT_RESET))
++			status |= USB_PORT_STAT_RESET;
++		if (isp1760_hcd_is_set(hcd, PORT_POWER))
++			status |= USB_PORT_STAT_POWER;
++
++		put_unaligned(cpu_to_le32(status), (__le32 *) buf);
++		break;
++	case SetHubFeature:
++		switch (wValue) {
++		case C_HUB_LOCAL_POWER:
++		case C_HUB_OVER_CURRENT:
++			/* no hub-wide feature/status flags */
++			break;
++		default:
++			goto error;
++		}
++		break;
++	case SetPortFeature:
++		wIndex &= 0xff;
++		if (!wIndex || wIndex > ports)
++			goto error;
++		wIndex--;
++
++		if (isp1760_hcd_is_set(hcd, PORT_OWNER))
++			break;
++
++		switch (wValue) {
++		case USB_PORT_FEAT_ENABLE:
++			isp1760_hcd_set(hcd, PORT_PE);
++			break;
++
++		case USB_PORT_FEAT_SUSPEND:
++			if (!isp1760_hcd_is_set(hcd, PORT_PE) ||
++			    isp1760_hcd_is_set(hcd, PORT_RESET))
++				goto error;
++
++			isp1760_hcd_set(hcd, PORT_SUSPEND);
++			break;
++		case USB_PORT_FEAT_POWER:
++			if (isp1760_hcd_ppc_is_set(hcd))
++				isp1760_hcd_set(hcd, PORT_POWER);
++			break;
++		case USB_PORT_FEAT_RESET:
++			if (isp1760_hcd_is_set(hcd, PORT_RESUME))
++				goto error;
++			/* line status bits may report this as low speed,
++			 * which can be fine if this root hub has a
++			 * transaction translator built in.
++			 */
++			if ((isp1760_hcd_is_set(hcd, PORT_CONNECT) &&
++			     !isp1760_hcd_is_set(hcd, PORT_PE)) &&
++			    (isp1760_hcd_read(hcd, PORT_LSTATUS) == 1)) {
++				isp1760_hcd_set(hcd, PORT_OWNER);
++			} else {
++				isp1760_hcd_set(hcd, PORT_RESET);
++				isp1760_hcd_clear(hcd, PORT_PE);
++
++				priv->reset_done = get_timer(0) + 50;
++			}
++			break;
++		default:
++			goto error;
++		}
++		break;
++
++	default:
++		printf("root: unknown request: 0x%0x\n", typeReq);
++		goto error;
++	}
++	spin_unlock_irqrestore(&priv->lock, flags);
++
++	if (src_len) {
++		length = min(src_len, length);
++
++		if (src != NULL && length > 0)
++			memcpy(buffer, src, length);
++		else
++			printf("zero copy USB descriptor\n");
++	}
++
++	dev->act_len = length;
++	dev->status = 0;
++
++	return 0;
++
++error:
++	/* "stall" on error */
++	dev->act_len = 0;
++	dev->status = USB_ST_STALLED;
++	return -EPIPE;
++}
++
++#ifndef __UBOOT__
++static int isp1760_hub_status_data(struct usb_hcd *hcd, char *buf)
++{
++	u32 status = 0;
++	int retval = 1;
++
++	/* init status to no-changes */
++	buf[0] = 0;
++
++	if (isp1760_hcd_is_set(hcd, PORT_OWNER) &&
++	    isp1760_hcd_is_set(hcd, PORT_CSC)) {
++		isp1760_hcd_clear(hcd, PORT_CSC);
++		goto done;
++	}
++
++done:
++	return status ? retval : 0;
++}
++
++static void isp1760_endpoint_disable(struct usb_hcd *hcd,
++		struct usb_host_endpoint *ep)
++{
++	struct isp1760_qh *qh, *qh_iter;
++	unsigned long spinflags;
++	int i;
++
++	qh = ep->hcpriv;
++	if (!qh)
++		return;
++
++	WARN_ON(!list_empty(&qh->qtd_list));
++
++	for (i = 0; i < QH_END; i++)
++		list_for_each_entry(qh_iter, &priv->qh_list[i], qh_list)
++			if (qh_iter == qh) {
++				list_del(&qh_iter->qh_list);
++				i = QH_END;
++				break;
++			}
++	qh_free(qh);
++	ep->hcpriv = NULL;
++
++	schedule_ptds(hcd);
++}
++
++static int isp1760_get_frame(struct usb_hcd *hcd)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++	u32 fr;
++
++	fr = isp1760_hcd_read(hcd, HC_FRINDEX);
++	return (fr >> 3) % priv->periodic_size;
++}
++
++static void isp1760_stop(struct usb_hcd *hcd)
++{
++	struct isp1760_hcd *priv = hcd_to_priv(hcd);
++
++	msleep(20);
++
++	spin_lock_irq(&priv->lock);
++	ehci_reset(hcd);
++	/* Disable IRQ */
++	isp1760_hcd_clear(hcd, HW_GLOBAL_INTR_EN);
++	spin_unlock_irq(&priv->lock);
++
++	isp1760_hcd_clear(hcd, FLAG_CF);
++}
++
++static void isp1760_shutdown(struct usb_hcd *hcd)
++{
++	isp1760_stop(hcd);
++
++	isp1760_hcd_clear(hcd, HW_GLOBAL_INTR_EN);
++
++	isp1760_hcd_clear(hcd, CMD_RUN);
++}
++
++static void isp1760_clear_tt_buffer_complete(struct usb_hcd *hcd,
++						struct usb_host_endpoint *ep)
++{
++	struct isp1760_qh *qh = ep->hcpriv;
++	unsigned long spinflags;
++
++	if (!qh)
++		return;
++
++	qh->tt_buffer_dirty = 0;
++	schedule_ptds(hcd);
++}
++
++
++static const struct hc_driver isp1760_hc_driver = {
++	.description		= "isp1760-hcd",
++	.product_desc		= "NXP ISP1760 USB Host Controller",
++	.hcd_priv_size		= sizeof(struct isp1760_hcd *),
++	.irq			= isp1760_irq,
++	.flags			= HCD_MEMORY | HCD_USB2,
++	.reset			= isp1760_hc_setup,
++	.start			= isp1760_run,
++	.stop			= isp1760_stop,
++	.shutdown		= isp1760_shutdown,
++	.urb_enqueue		= isp1760_urb_enqueue,
++	.urb_dequeue		= isp1760_urb_dequeue,
++	.endpoint_disable	= isp1760_endpoint_disable,
++	.get_frame_number	= isp1760_get_frame,
++	.hub_status_data	= isp1760_hub_status_data,
++	.hub_control		= isp1760_hub_control,
++	.clear_tt_buffer_complete	= isp1760_clear_tt_buffer_complete,
++};
++#endif // __UBOOT__
++
++int __init isp1760_init_kmem_once(void)
++{
++	urb_listitem_cachep = kmem_cache_create("isp1760_urb_listitem",
++			sizeof(struct urb_listitem), 0, SLAB_TEMPORARY |
++			SLAB_MEM_SPREAD, NULL);
++
++	if (!urb_listitem_cachep)
++		return -ENOMEM;
++
++	qtd_cachep = kmem_cache_create("isp1760_qtd",
++			sizeof(struct isp1760_qtd), 0, SLAB_TEMPORARY |
++			SLAB_MEM_SPREAD, NULL);
++
++	if (!qtd_cachep)
++		return -ENOMEM;
++
++	qh_cachep = kmem_cache_create("isp1760_qh", sizeof(struct isp1760_qh),
++			0, SLAB_TEMPORARY | SLAB_MEM_SPREAD, NULL);
++
++	if (!qh_cachep) {
++		kmem_cache_destroy(qtd_cachep);
++		return -ENOMEM;
++	}
++
++	return 0;
++}
++
++void isp1760_deinit_kmem_cache(void)
++{
++	kmem_cache_destroy(qtd_cachep);
++	kmem_cache_destroy(qh_cachep);
++	kmem_cache_destroy(urb_listitem_cachep);
++}
++
++int isp1760_hcd_lowlevel_init(struct isp1760_hcd *priv)
++{
++	int ret;
++
++	ret = isp1760_hc_setup(priv->hcd);
++	if (ret < 0)
++		return ret;
++
++	ret = isp1760_run(priv->hcd);
++	if (ret < 0)
++		return ret;
++
++	return 0;
++}
++
++static const struct usb_urb_ops isp1760_urb_ops = {
++	.urb_enqueue = isp1760_urb_enqueue,
++	.urb_dequeue = isp1760_urb_dequeue,
++	.hub_control = isp1760_hub_control,
++	.isr = isp1760_irq,
++};
++
++int isp1760_hcd_register(struct isp1760_hcd *priv, struct resource *mem,
++			 int irq, unsigned long irqflags,
++			 struct udevice *dev)
++{
++	const struct isp1760_memory_layout *mem_layout = priv->memory_layout;
++	struct isp1760_host_data *host = dev_get_priv(dev);
++	struct usb_hcd *hcd = &host->hcd;
++	int ret;
++
++	priv->hcd = hcd;
++
++	hcd->hcd_priv = priv;
++
++	priv->hcd = hcd;
++
++	hcd->urb_ops = &isp1760_urb_ops;
++
++	priv->atl_slots = kcalloc(mem_layout->slot_num,
++				  sizeof(struct isp1760_slotinfo), GFP_KERNEL);
++	if (!priv->atl_slots)
++		return -ENOMEM;
++
++	priv->int_slots = kcalloc(mem_layout->slot_num,
++				  sizeof(struct isp1760_slotinfo), GFP_KERNEL);
++	if (!priv->int_slots) {
++		ret = -ENOMEM;
++		goto free_atl_slots;
++	}
++
++	host->host_speed = USB_SPEED_HIGH;
++
++	init_memory(priv);
++
++	return 0;
++
++free_atl_slots:
++	kfree(priv->atl_slots);
++
++	return ret;
++}
++
++void isp1760_hcd_unregister(struct isp1760_hcd *priv)
++{
++	struct isp1760_qh *qh, *qh_next;
++	int i;
++
++	for (i = 0; i < QH_END; i++)
++		list_for_each_entry_safe(qh, qh_next, &priv->qh_list[i],
++					 qh_list) {
++			qtd_list_free(&qh->qtd_list);
++			list_del(&qh->qh_list);
++			qh_free(qh);
++		}
++
++	kfree(priv->atl_slots);
++	kfree(priv->int_slots);
++}
+diff --git a/drivers/usb/isp1760/isp1760-hcd.h b/drivers/usb/isp1760/isp1760-hcd.h
+new file mode 100644
+index 0000000000..00f5ca8c1f
+--- /dev/null
++++ b/drivers/usb/isp1760/isp1760-hcd.h
+@@ -0,0 +1,82 @@
++/* SPDX-License-Identifier: GPL-2.0 */
++#ifndef _ISP1760_HCD_H_
++#define _ISP1760_HCD_H_
++
++#include <regmap.h>
++
++#include "isp1760-regs.h"
++
++struct isp1760_qh;
++struct isp1760_qtd;
++struct resource;
++struct usb_hcd;
++
++struct isp1760_slotinfo {
++	struct isp1760_qh *qh;
++	struct isp1760_qtd *qtd;
++	unsigned long timestamp;
++};
++
++/* chip memory management */
++#define ISP176x_BLOCK_MAX (32 + 20 + 4)
++#define ISP176x_BLOCK_NUM 3
++
++struct isp1760_memory_layout {
++	unsigned int blocks[ISP176x_BLOCK_NUM];
++	unsigned int blocks_size[ISP176x_BLOCK_NUM];
++
++	unsigned int slot_num;
++	unsigned int payload_blocks;
++	unsigned int payload_area_size;
++};
++
++struct isp1760_memory_chunk {
++	unsigned int start;
++	unsigned int size;
++	unsigned int free;
++};
++
++enum isp1760_queue_head_types {
++	QH_CONTROL,
++	QH_BULK,
++	QH_INTERRUPT,
++	QH_END
++};
++
++struct isp1760_hcd {
++	struct usb_hcd		*hcd;
++	struct udevice		*dev;
++
++	void __iomem		*base;
++
++	struct regmap		*regs;
++	struct regmap_field	*fields[HC_FIELD_MAX];
++
++	bool			is_isp1763;
++	const struct isp1760_memory_layout	*memory_layout;
++
++	spinlock_t		lock;
++	struct isp1760_slotinfo	*atl_slots;
++	int			atl_done_map;
++	struct isp1760_slotinfo	*int_slots;
++	int			int_done_map;
++	struct isp1760_memory_chunk memory_pool[ISP176x_BLOCK_MAX];
++	struct list_head	qh_list[QH_END];
++
++	/* periodic schedule support */
++#define	DEFAULT_I_TDPS		1024
++	unsigned		periodic_size;
++	unsigned		i_thresh;
++	unsigned long		reset_done;
++	unsigned long		next_statechange;
++};
++
++int isp1760_hcd_register(struct isp1760_hcd *priv, struct resource *mem,
++			 int irq, unsigned long irqflags, struct udevice *dev);
++void isp1760_hcd_unregister(struct isp1760_hcd *priv);
++int isp1760_hcd_lowlevel_init(struct isp1760_hcd *priv);
++
++int isp1760_init_kmem_once(void);
++void isp1760_deinit_kmem_cache(void);
++
++#endif /* _ISP1760_HCD_H_ */
+diff --git a/drivers/usb/isp1760/isp1760-if.c b/drivers/usb/isp1760/isp1760-if.c
+new file mode 100644
+index 0000000000..c610da6b23
+--- /dev/null
++++ b/drivers/usb/isp1760/isp1760-if.c
+@@ -0,0 +1,127 @@
++// SPDX-License-Identifier: GPL-2.0
++/*
++ * Copyright 2021 Linaro, Rui Miguel Silva <rui.silva@linaro.org>
++ *
++ * based on original code from:
++ * (c) 2007 Sebastian Siewior <bigeasy@linutronix.de>
++ */
++
++#include <common.h>
++#include <dm.h>
++#include <dm/device-internal.h>
++#include <dm/device_compat.h>
++#include <dm/devres.h>
++#include <dm/lists.h>
++#include <linux/bug.h>
++#include <linux/io.h>
++#include <linux/kernel.h>
++#include <linux/usb/otg.h>
++#include <log.h>
++#include <usb.h>
++
++#include "isp1760-core.h"
++#include "isp1760-regs.h"
++#include "isp1760-uboot.h"
++
++
++static int isp1760_of_to_plat(struct udevice *dev)
++{
++	struct isp1760_device *isp = dev_get_plat(dev);
++	unsigned int devflags = 0;
++	u32 bus_width = 0;
++	ofnode dp;
++
++
++	if (!dev_has_ofnode(dev)) {
++		/* select isp1763 as the default device */
++		devflags = ISP1760_FLAG_ISP1763 | ISP1760_FLAG_BUS_WIDTH_16;
++		pr_err("isp1760: no platform data\n");
++		goto isp_setup;
++	}
++
++	dp = dev_ofnode(dev);
++
++	if (ofnode_device_is_compatible(dp, "nxp,usb-isp1761"))
++		devflags |= ISP1760_FLAG_ISP1761;
++
++	if (ofnode_device_is_compatible(dp, "nxp,usb-isp1763"))
++		devflags |= ISP1760_FLAG_ISP1763;
++
++	/*
++	* Some systems wire up only 8 of 16 data lines or
++	* 16 of the 32 data lines
++	*/
++	bus_width = ofnode_read_u32_default(dp, "bus-width", 16);
++	if (bus_width == 16)
++		devflags |= ISP1760_FLAG_BUS_WIDTH_16;
++	else if (bus_width == 8)
++		devflags |= ISP1760_FLAG_BUS_WIDTH_8;
++
++	if (usb_get_dr_mode(dev_ofnode(dev)) == USB_DR_MODE_PERIPHERAL)
++		devflags |= ISP1760_FLAG_PERIPHERAL_EN;
++
++	if (ofnode_read_bool(dp, "analog-oc"))
++		devflags |= ISP1760_FLAG_ANALOG_OC;
++
++	if (ofnode_read_bool(dp, "dack-polarity"))
++		devflags |= ISP1760_FLAG_DACK_POL_HIGH;
++
++	if (ofnode_read_bool(dp, "dreq-polarity"))
++		devflags |= ISP1760_FLAG_DREQ_POL_HIGH;
++
++isp_setup:
++	isp->devflags = devflags;
++	isp->dev = dev;
++
++	return 0;
++}
++
++static int isp1760_plat_probe(struct udevice *dev)
++{
++	struct isp1760_device *isp = dev_get_plat(dev);
++	struct resource mem_res;
++	struct resource irq_res;
++	int ret;
++
++	dev_read_resource(dev, 0, &mem_res);
++	dev_read_resource(dev, 1, &irq_res);
++
++	isp1760_init_kmem_once();
++
++	ret = isp1760_register(isp, &mem_res, irq_res.start, irq_res.flags);
++	if (ret < 0) {
++		isp1760_deinit_kmem_cache();
++		return ret;
++	}
++
++	return 0;
++}
++
++static int isp1760_plat_remove(struct udevice *dev)
++{
++	struct isp1760_device *isp = dev_get_plat(dev);
++
++	isp1760_deinit_kmem_cache();
++	isp1760_unregister(isp);
++
++	return 0;
++}
++
++static const struct udevice_id isp1760_ids[] = {
++	{ .compatible = "nxp,usb-isp1760", },
++	{ .compatible = "nxp,usb-isp1761", },
++	{ .compatible = "nxp,usb-isp1763", },
++	{ },
++};
++
++U_BOOT_DRIVER(isp1760) = {
++	.name		= "isp1760",
++	.id		= UCLASS_USB,
++	.of_match	= isp1760_ids,
++	.of_to_plat	= isp1760_of_to_plat,
++	.ops		= &isp1760_usb_ops,
++	.probe		= isp1760_plat_probe,
++	.remove		= isp1760_plat_remove,
++	.plat_auto	= sizeof(struct isp1760_device),
++	.priv_auto	= sizeof(struct isp1760_host_data),
++};
+diff --git a/drivers/usb/isp1760/isp1760-regs.h b/drivers/usb/isp1760/isp1760-regs.h
+new file mode 100644
+index 0000000000..94ea60c20b
+--- /dev/null
++++ b/drivers/usb/isp1760/isp1760-regs.h
+@@ -0,0 +1,292 @@
++/* SPDX-License-Identifier: GPL-2.0 */
++/*
++ * Driver for the NXP ISP1760 chip
++ *
++ * Copyright 2021 Linaro, Rui Miguel Silva
++ * Copyright 2014 Laurent Pinchart
++ * Copyright 2007 Sebastian Siewior
++ *
++ * Contacts:
++ *     Sebastian Siewior <bigeasy@linutronix.de>
++ *     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
++ *     Rui Miguel Silva <rui.silva@linaro.org>
++ */
++
++#ifndef _ISP176x_REGS_H_
++#define _ISP176x_REGS_H_
++
++/* -----------------------------------------------------------------------------
++ * Host Controller
++ */
++
++/* ISP1760/31 */
++/* EHCI capability registers */
++#define ISP176x_HC_VERSION		0x002
++#define ISP176x_HC_HCSPARAMS		0x004
++#define ISP176x_HC_HCCPARAMS		0x008
++
++/* EHCI operational registers */
++#define ISP176x_HC_USBCMD		0x020
++#define ISP176x_HC_USBSTS		0x024
++#define ISP176x_HC_FRINDEX		0x02c
++
++#define ISP176x_HC_CONFIGFLAG		0x060
++#define ISP176x_HC_PORTSC1		0x064
++
++#define ISP176x_HC_ISO_PTD_DONEMAP	0x130
++#define ISP176x_HC_ISO_PTD_SKIPMAP	0x134
++#define ISP176x_HC_ISO_PTD_LASTPTD	0x138
++#define ISP176x_HC_INT_PTD_DONEMAP	0x140
++#define ISP176x_HC_INT_PTD_SKIPMAP	0x144
++#define ISP176x_HC_INT_PTD_LASTPTD	0x148
++#define ISP176x_HC_ATL_PTD_DONEMAP	0x150
++#define ISP176x_HC_ATL_PTD_SKIPMAP	0x154
++#define ISP176x_HC_ATL_PTD_LASTPTD	0x158
++
++/* Configuration Register */
++#define ISP176x_HC_HW_MODE_CTRL		0x300
++#define ISP176x_HC_CHIP_ID		0x304
++#define ISP176x_HC_SCRATCH		0x308
++#define ISP176x_HC_RESET		0x30c
++#define ISP176x_HC_BUFFER_STATUS	0x334
++#define ISP176x_HC_MEMORY		0x33c
++
++/* Interrupt Register */
++#define ISP176x_HC_INTERRUPT		0x310
++#define ISP176x_HC_INTERRUPT_ENABLE	0x314
++#define ISP176x_HC_ISO_IRQ_MASK_OR	0x318
++#define ISP176x_HC_INT_IRQ_MASK_OR	0x31c
++#define ISP176x_HC_ATL_IRQ_MASK_OR	0x320
++#define ISP176x_HC_ISO_IRQ_MASK_AND	0x324
++#define ISP176x_HC_INT_IRQ_MASK_AND	0x328
++#define ISP176x_HC_ATL_IRQ_MASK_AND	0x32c
++
++#define ISP176x_HC_OTG_CTRL_SET		0x374
++#define ISP176x_HC_OTG_CTRL_CLEAR	0x376
++
++enum isp176x_host_controller_fields {
++	/* HC_PORTSC1 */
++	PORT_OWNER, PORT_POWER, PORT_LSTATUS, PORT_RESET, PORT_SUSPEND,
++	PORT_RESUME, PORT_PE, PORT_CSC, PORT_CONNECT,
++	/* HC_HCSPARAMS */
++	HCS_PPC, HCS_N_PORTS,
++	/* HC_HCCPARAMS */
++	HCC_ISOC_CACHE, HCC_ISOC_THRES,
++	/* HC_USBCMD */
++	CMD_LRESET, CMD_RESET, CMD_RUN,
++	/* HC_USBSTS */
++	STS_PCD,
++	/* HC_FRINDEX */
++	HC_FRINDEX,
++	/* HC_CONFIGFLAG */
++	FLAG_CF,
++	/* ISO/INT/ATL PTD */
++	HC_ISO_PTD_DONEMAP, HC_ISO_PTD_SKIPMAP, HC_ISO_PTD_LASTPTD,
++	HC_INT_PTD_DONEMAP, HC_INT_PTD_SKIPMAP, HC_INT_PTD_LASTPTD,
++	HC_ATL_PTD_DONEMAP, HC_ATL_PTD_SKIPMAP, HC_ATL_PTD_LASTPTD,
++	/* HC_HW_MODE_CTRL */
++	ALL_ATX_RESET, HW_ANA_DIGI_OC, HW_DEV_DMA, HW_COMN_IRQ, HW_COMN_DMA,
++	HW_DATA_BUS_WIDTH, HW_DACK_POL_HIGH, HW_DREQ_POL_HIGH, HW_INTR_HIGH_ACT,
++	HW_INTF_LOCK, HW_INTR_EDGE_TRIG, HW_GLOBAL_INTR_EN,
++	/* HC_CHIP_ID */
++	HC_CHIP_ID_HIGH, HC_CHIP_ID_LOW, HC_CHIP_REV,
++	/* HC_SCRATCH */
++	HC_SCRATCH,
++	/* HC_RESET */
++	SW_RESET_RESET_ATX, SW_RESET_RESET_HC, SW_RESET_RESET_ALL,
++	/* HC_BUFFER_STATUS */
++	ISO_BUF_FILL, INT_BUF_FILL, ATL_BUF_FILL,
++	/* HC_MEMORY */
++	MEM_BANK_SEL, MEM_START_ADDR,
++	/* HC_DATA */
++	HC_DATA,
++	/* HC_INTERRUPT */
++	HC_INTERRUPT,
++	/* HC_INTERRUPT_ENABLE */
++	HC_INT_IRQ_ENABLE, HC_ATL_IRQ_ENABLE,
++	/* INTERRUPT MASKS */
++	HC_ISO_IRQ_MASK_OR, HC_INT_IRQ_MASK_OR, HC_ATL_IRQ_MASK_OR,
++	HC_ISO_IRQ_MASK_AND, HC_INT_IRQ_MASK_AND, HC_ATL_IRQ_MASK_AND,
++	/* HW_OTG_CTRL_SET */
++	HW_OTG_DISABLE, HW_SW_SEL_HC_DC, HW_VBUS_DRV, HW_SEL_CP_EXT,
++	HW_DM_PULLDOWN, HW_DP_PULLDOWN, HW_DP_PULLUP, HW_HC_2_DIS,
++	/* HW_OTG_CTRL_CLR */
++	HW_OTG_DISABLE_CLEAR, HW_SW_SEL_HC_DC_CLEAR, HW_VBUS_DRV_CLEAR,
++	HW_SEL_CP_EXT_CLEAR, HW_DM_PULLDOWN_CLEAR, HW_DP_PULLDOWN_CLEAR,
++	HW_DP_PULLUP_CLEAR, HW_HC_2_DIS_CLEAR,
++	/* Last element */
++	HC_FIELD_MAX,
++};
++
++/* ISP1763 */
++/* EHCI operational registers */
++#define ISP1763_HC_USBCMD		0x8c
++#define ISP1763_HC_USBSTS		0x90
++#define ISP1763_HC_FRINDEX		0x98
++
++#define ISP1763_HC_CONFIGFLAG		0x9c
++#define ISP1763_HC_PORTSC1		0xa0
++
++#define ISP1763_HC_ISO_PTD_DONEMAP	0xa4
++#define ISP1763_HC_ISO_PTD_SKIPMAP	0xa6
++#define ISP1763_HC_ISO_PTD_LASTPTD	0xa8
++#define ISP1763_HC_INT_PTD_DONEMAP	0xaa
++#define ISP1763_HC_INT_PTD_SKIPMAP	0xac
++#define ISP1763_HC_INT_PTD_LASTPTD	0xae
++#define ISP1763_HC_ATL_PTD_DONEMAP	0xb0
++#define ISP1763_HC_ATL_PTD_SKIPMAP	0xb2
++#define ISP1763_HC_ATL_PTD_LASTPTD	0xb4
++
++/* Configuration Register */
++#define ISP1763_HC_HW_MODE_CTRL		0xb6
++#define ISP1763_HC_CHIP_REV		0x70
++#define ISP1763_HC_CHIP_ID		0x72
++#define ISP1763_HC_SCRATCH		0x78
++#define ISP1763_HC_RESET		0xb8
++#define ISP1763_HC_BUFFER_STATUS	0xba
++#define ISP1763_HC_MEMORY		0xc4
++#define ISP1763_HC_DATA			0xc6
++
++/* Interrupt Register */
++#define ISP1763_HC_INTERRUPT		0xd4
++#define ISP1763_HC_INTERRUPT_ENABLE	0xd6
++#define ISP1763_HC_ISO_IRQ_MASK_OR	0xd8
++#define ISP1763_HC_INT_IRQ_MASK_OR	0xda
++#define ISP1763_HC_ATL_IRQ_MASK_OR	0xdc
++#define ISP1763_HC_ISO_IRQ_MASK_AND	0xde
++#define ISP1763_HC_INT_IRQ_MASK_AND	0xe0
++#define ISP1763_HC_ATL_IRQ_MASK_AND	0xe2
++
++#define ISP1763_HC_OTG_CTRL_SET		0xe4
++#define ISP1763_HC_OTG_CTRL_CLEAR	0xe6
++
++/* -----------------------------------------------------------------------------
++ * Peripheral Controller
++ */
++
++#define DC_IEPTX(n)			(1 << (11 + 2 * (n)))
++#define DC_IEPRX(n)			(1 << (10 + 2 * (n)))
++#define DC_IEPRXTX(n)			(3 << (10 + 2 * (n)))
++
++#define ISP176x_DC_CDBGMOD_ACK		BIT(6)
++#define ISP176x_DC_DDBGMODIN_ACK	BIT(4)
++#define ISP176x_DC_DDBGMODOUT_ACK	BIT(2)
++
++#define ISP176x_DC_IEP0SETUP		BIT(8)
++#define ISP176x_DC_IEVBUS		BIT(7)
++#define ISP176x_DC_IEHS_STA		BIT(5)
++#define ISP176x_DC_IERESM		BIT(4)
++#define ISP176x_DC_IESUSP		BIT(3)
++#define ISP176x_DC_IEBRST		BIT(0)
++
++#define ISP176x_DC_ENDPTYP_ISOC		0x01
++#define ISP176x_DC_ENDPTYP_BULK		0x02
++#define ISP176x_DC_ENDPTYP_INTERRUPT	0x03
++
++/* Initialization Registers */
++#define ISP176x_DC_ADDRESS		0x0200
++#define ISP176x_DC_MODE			0x020c
++#define ISP176x_DC_INTCONF		0x0210
++#define ISP176x_DC_DEBUG		0x0212
++#define ISP176x_DC_INTENABLE		0x0214
++
++/* Data Flow Registers */
++#define ISP176x_DC_EPMAXPKTSZ		0x0204
++#define ISP176x_DC_EPTYPE		0x0208
++
++#define ISP176x_DC_BUFLEN		0x021c
++#define ISP176x_DC_BUFSTAT		0x021e
++#define ISP176x_DC_DATAPORT		0x0220
++
++#define ISP176x_DC_CTRLFUNC		0x0228
++#define ISP176x_DC_EPINDEX		0x022c
++
++/* DMA Registers */
++#define ISP176x_DC_DMACMD		0x0230
++#define ISP176x_DC_DMATXCOUNT		0x0234
++#define ISP176x_DC_DMACONF		0x0238
++#define ISP176x_DC_DMAHW		0x023c
++#define ISP176x_DC_DMAINTREASON		0x0250
++#define ISP176x_DC_DMAINTEN		0x0254
++#define ISP176x_DC_DMAEP		0x0258
++#define ISP176x_DC_DMABURSTCOUNT	0x0264
++
++/* General Registers */
++#define ISP176x_DC_INTERRUPT		0x0218
++#define ISP176x_DC_CHIPID		0x0270
++#define ISP176x_DC_FRAMENUM		0x0274
++#define ISP176x_DC_SCRATCH		0x0278
++#define ISP176x_DC_UNLOCKDEV		0x027c
++#define ISP176x_DC_INTPULSEWIDTH	0x0280
++#define ISP176x_DC_TESTMODE		0x0284
++
++enum isp176x_device_controller_fields {
++	/* DC_ADDRESS */
++	DC_DEVEN, DC_DEVADDR,
++	/* DC_MODE */
++	DC_VBUSSTAT, DC_SFRESET, DC_GLINTENA,
++	/* DC_INTCONF */
++	DC_CDBGMOD_ACK, DC_DDBGMODIN_ACK, DC_DDBGMODOUT_ACK, DC_INTPOL,
++	/* DC_INTENABLE */
++	DC_IEPRXTX_7, DC_IEPRXTX_6, DC_IEPRXTX_5, DC_IEPRXTX_4, DC_IEPRXTX_3,
++	DC_IEPRXTX_2, DC_IEPRXTX_1, DC_IEPRXTX_0,
++	DC_IEP0SETUP, DC_IEVBUS, DC_IEHS_STA, DC_IERESM, DC_IESUSP, DC_IEBRST,
++	/* DC_EPINDEX */
++	DC_EP0SETUP, DC_ENDPIDX, DC_EPDIR,
++	/* DC_CTRLFUNC */
++	DC_CLBUF, DC_VENDP, DC_DSEN, DC_STATUS, DC_STALL,
++	/* DC_BUFLEN */
++	DC_BUFLEN,
++	/* DC_EPMAXPKTSZ */
++	DC_FFOSZ,
++	/* DC_EPTYPE */
++	DC_EPENABLE, DC_ENDPTYP,
++	/* DC_FRAMENUM */
++	DC_FRAMENUM, DC_UFRAMENUM,
++	/* DC_CHIP_ID */
++	DC_CHIP_ID_HIGH, DC_CHIP_ID_LOW,
++	/* DC_SCRATCH */
++	DC_SCRATCH,
++	/* Last element */
++	DC_FIELD_MAX,
++};
++
++/* ISP1763 */
++/* Initialization Registers */
++#define ISP1763_DC_ADDRESS		0x00
++#define ISP1763_DC_MODE			0x0c
++#define ISP1763_DC_INTCONF		0x10
++#define ISP1763_DC_INTENABLE		0x14
++
++/* Data Flow Registers */
++#define ISP1763_DC_EPMAXPKTSZ		0x04
++#define ISP1763_DC_EPTYPE		0x08
++
++#define ISP1763_DC_BUFLEN		0x1c
++#define ISP1763_DC_BUFSTAT		0x1e
++#define ISP1763_DC_DATAPORT		0x20
++
++#define ISP1763_DC_CTRLFUNC		0x28
++#define ISP1763_DC_EPINDEX		0x2c
++
++/* DMA Registers */
++#define ISP1763_DC_DMACMD		0x30
++#define ISP1763_DC_DMATXCOUNT		0x34
++#define ISP1763_DC_DMACONF		0x38
++#define ISP1763_DC_DMAHW		0x3c
++#define ISP1763_DC_DMAINTREASON		0x50
++#define ISP1763_DC_DMAINTEN		0x54
++#define ISP1763_DC_DMAEP		0x58
++#define ISP1763_DC_DMABURSTCOUNT	0x64
++
++/* General Registers */
++#define ISP1763_DC_INTERRUPT		0x18
++#define ISP1763_DC_CHIPID_LOW		0x70
++#define ISP1763_DC_CHIPID_HIGH		0x72
++#define ISP1763_DC_FRAMENUM		0x74
++#define ISP1763_DC_SCRATCH		0x78
++#define ISP1763_DC_UNLOCKDEV		0x7c
++#define ISP1763_DC_INTPULSEWIDTH	0x80
++#define ISP1763_DC_TESTMODE		0x84
++
++#endif
+diff --git a/drivers/usb/isp1760/isp1760-uboot.c b/drivers/usb/isp1760/isp1760-uboot.c
+new file mode 100644
+index 0000000000..9f2eaa75f3
+--- /dev/null
++++ b/drivers/usb/isp1760/isp1760-uboot.c
+@@ -0,0 +1,64 @@
++// SPDX-License-Identifier: GPL-2.0
++/*
++ * Driver for the NXP ISP1760 chip
++ *
++ * Copyright 2021 Linaro, Rui Miguel Silva <rui.silva@linaro.org>
++ *
++ */
++
++#include <common.h>
++#include <dm.h>
++#include <dm/device-internal.h>
++#include <dm/device_compat.h>
++#include <dm/devres.h>
++#include <dm/lists.h>
++#include <linux/bug.h>
++#include <linux/io.h>
++#include <linux/kernel.h>
++#include <linux/usb/otg.h>
++#include <linux/usb/usb_urb_compat.h>
++#include <log.h>
++#include <usb.h>
++
++#include "isp1760-core.h"
++#include "isp1760-hcd.h"
++#include "isp1760-regs.h"
++#include "isp1760-uboot.h"
++
++static int isp1760_msg_submit_control(struct udevice *dev,
++				      struct usb_device *udev,
++				      unsigned long pipe, void *buffer,
++				      int length, struct devrequest *setup)
++{
++	struct isp1760_host_data *host = dev_get_priv(dev);
++
++	return usb_urb_submit_control(&host->hcd, &host->urb, &host->hep, udev,
++				      pipe, buffer, length, setup, 0,
++				      host->host_speed);
++}
++
++static int isp1760_msg_submit_bulk(struct udevice *dev, struct usb_device *udev,
++				   unsigned long pipe, void *buffer, int length)
++{
++	struct isp1760_host_data *host = dev_get_priv(dev);
++
++	return usb_urb_submit_bulk(&host->hcd, &host->urb, &host->hep, udev,
++				   pipe, buffer, length);
++}
++
++static int isp1760_msg_submit_irq(struct udevice *dev, struct usb_device *udev,
++				  unsigned long pipe, void *buffer, int length,
++				  int interval, bool nonblock)
++{
++	struct isp1760_host_data *host = dev_get_priv(dev);
++
++	return usb_urb_submit_irq(&host->hcd, &host->urb, &host->hep, udev,
++				  pipe, buffer, length, interval);
++}
++
++struct dm_usb_ops isp1760_usb_ops = {
++	.control	= isp1760_msg_submit_control,
++	.bulk		= isp1760_msg_submit_bulk,
++	.interrupt	= isp1760_msg_submit_irq,
++};
++
+diff --git a/drivers/usb/isp1760/isp1760-uboot.h b/drivers/usb/isp1760/isp1760-uboot.h
+new file mode 100644
+index 0000000000..2486de6f9e
+--- /dev/null
++++ b/drivers/usb/isp1760/isp1760-uboot.h
+@@ -0,0 +1,27 @@
++// SPDX-License-Identifier: GPL-2.0
++/*
++ * Driver for the NXP ISP1760 chip
++ *
++ * Copyright 2021 Linaro, Rui Miguel Silva <rui.silva@linaro.org>
++ *
++ */
++
++#ifndef __ISP1760_UBOOT_H__
++#define __ISP1760_UBOOT_H__
++
++#include <linux/usb/usb_urb_compat.h>
++#include <usb.h>
++
++#include "isp1760-core.h"
++
++struct isp1760_host_data {
++	struct isp1760_hcd *priv;
++	struct usb_hcd hcd;
++	enum usb_device_speed host_speed;
++	struct usb_host_endpoint hep;
++	struct urb urb;
++};
++
++extern struct dm_usb_ops isp1760_usb_ops;
++
++#endif
+-- 
+2.33.0
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-corstone1000-enable-isp1763-and-usb-stack.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-corstone1000-enable-isp1763-and-usb-stack.patch
new file mode 100644
index 0000000..2e41677
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0005-corstone1000-enable-isp1763-and-usb-stack.patch
@@ -0,0 +1,92 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From 663bfde59a56d65c031526f75f0e08126f02d845 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Tue, 27 Jul 2021 23:34:57 +0100
+Subject: [PATCH 05/16] corstone1000: enable isp1763 and usb stack
+
+MPS3 board have a ISP1763 usb controller, add the correspondent mmio
+area and enable it to be used for mass storage access for example.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ board/armltd/corstone1000/corstone1000.c |  8 ++++++++
+ configs/corstone1000_defconfig           | 19 +++++++++----------
+ 2 files changed, 17 insertions(+), 10 deletions(-)
+
+diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/corstone1000/corstone1000.c
+index ab98fa87fb..a51f5ddfa0 100644
+--- a/board/armltd/corstone1000/corstone1000.c
++++ b/board/armltd/corstone1000/corstone1000.c
+@@ -46,6 +46,14 @@ static struct mm_region corstone1000_mem_map[] = {
+ 		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
+ 			 PTE_BLOCK_NON_SHARE |
+ 			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
++        }, {
++                /* USB */
++                .virt = 0x40200000UL,
++                .phys = 0x40200000UL,
++                .size = 0x00100000UL,
++                .attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
++                         PTE_BLOCK_NON_SHARE |
++                         PTE_BLOCK_PXN | PTE_BLOCK_UXN
+ 	}, {
+ 		/* OCVM */
+ 		.virt = 0x80000000UL,
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defconfig
+index 54c746d829..fed2b16c93 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -1,13 +1,12 @@
+ CONFIG_ARM=y
+-CONFIG_ARM64=y
+ CONFIG_TARGET_CORSTONE1000=y
+ CONFIG_SYS_TEXT_BASE=0x02100000
+ CONFIG_SYS_MALLOC_F_LEN=0x2000
+ CONFIG_NR_DRAM_BANKS=1
+ CONFIG_IDENT_STRING=" corstone1000 aarch64 "
+-CONFIG_BOOTDELAY=3
+-CONFIG_OF_CONTROL=y
+ CONFIG_DEFAULT_DEVICE_TREE="corstone1000-mps3"
++CONFIG_FIT=y
++CONFIG_BOOTDELAY=3
+ CONFIG_USE_BOOTARGS=y
+ CONFIG_BOOTARGS="console=ttyAMA0 loglevel=9"
+ # CONFIG_DISPLAY_CPUINFO is not set
+@@ -16,12 +15,11 @@ CONFIG_HUSH_PARSER=y
+ CONFIG_SYS_PROMPT="corstone1000# "
+ # CONFIG_CMD_CONSOLE is not set
+ CONFIG_CMD_BOOTZ=y
+-CONFIG_CMD_BOOTM=y
+ # CONFIG_CMD_XIMG is not set
+ # CONFIG_CMD_EDITENV is not set
+ # CONFIG_CMD_ENV_EXISTS is not set
+-# CONFIG_CMD_ARMFLASH=y
+ # CONFIG_CMD_LOADS is not set
++CONFIG_CMD_USB=y
+ # CONFIG_CMD_ITEST is not set
+ # CONFIG_CMD_SETEXPR is not set
+ CONFIG_CMD_DHCP=y
+@@ -29,12 +27,13 @@ CONFIG_CMD_DHCP=y
+ CONFIG_CMD_MII=y
+ CONFIG_CMD_PING=y
+ CONFIG_CMD_CACHE=y
+-CONFIG_FIT=y
+-# CONFIG_CMD_MISC is not set
+ CONFIG_CMD_FAT=y
+-CONFIG_DM=y
++CONFIG_OF_CONTROL=y
++CONFIG_REGMAP=y
+ # CONFIG_MMC is not set
+-# CONFIG_MTD_NOR_FLASH=y
+ CONFIG_DM_ETH=y
+ CONFIG_DM_SERIAL=y
+-CONFIG_OF_LIBFDT=y
++CONFIG_USB=y
++CONFIG_DM_USB=y
++CONFIG_USB_ISP1760=y
++CONFIG_USB_STORAGE=y
+-- 
+2.33.0
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-corstone1000-enable-support-for-FVP.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-corstone1000-enable-support-for-FVP.patch
new file mode 100644
index 0000000..38e77dc
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0006-corstone1000-enable-support-for-FVP.patch
@@ -0,0 +1,240 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From 8244c266643d7fe77e360d2927adcd123a691dd1 Mon Sep 17 00:00:00 2001
+From: "Arpita S.K" <Arpita.S.K@arm.com>
+Date: Mon, 11 Oct 2021 11:41:25 +0530
+Subject: [PATCH 06/16] corstone1000: enable support for FVP
+
+Introduces a new device tree for the FVP.
+
+Signed-off-by: Arpita S.K <Arpita.S.K@arm.com>
+---
+ arch/arm/dts/Makefile             |   2 +
+ arch/arm/dts/corstone1000-fvp.dts |  28 ++++++
+ arch/arm/dts/corstone1000.dtsi    | 152 ++++++++++++++++++++++++++++++
+ configs/corstone1000_defconfig    |   1 -
+ 4 files changed, 182 insertions(+), 1 deletion(-)
+ create mode 100644 arch/arm/dts/corstone1000-fvp.dts
+ create mode 100644 arch/arm/dts/corstone1000.dtsi
+
+diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
+index 9fb38682e6..c70c20b9a5 100644
+--- a/arch/arm/dts/Makefile
++++ b/arch/arm/dts/Makefile
+@@ -1112,6 +1112,8 @@ dtb-$(CONFIG_TARGET_PRESIDIO_ASIC) += ca-presidio-engboard.dtb
+ 
+ dtb-$(CONFIG_TARGET_IMX8MM_CL_IOT_GATE) += imx8mm-cl-iot-gate.dtb
+ 
++dtb-$(CONFIG_TARGET_CORSTONE1000) += $(DEVICE_TREE).dtb
++
+ targets += $(dtb-y)
+ 
+ # Add any required device tree compiler flags here
+diff --git a/arch/arm/dts/corstone1000-fvp.dts b/arch/arm/dts/corstone1000-fvp.dts
+new file mode 100644
+index 0000000000..2188ca5e0e
+--- /dev/null
++++ b/arch/arm/dts/corstone1000-fvp.dts
+@@ -0,0 +1,28 @@
++/*
++ * Copyright (c) 2021, Arm Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++/dts-v1/;
++
++#include "corstone1000.dtsi"
++
++/ {
++       model = "corstone1000-fvp";
++
++       ethernet: eth@4010000 {
++               compatible = "smsc,lan91c111";
++               reg = <0x40100000 0x10000>;
++               phy-mode = "mii";
++               interrupt-parent = <&gic>;
++               interrupts = <GIC_SPI 116 0xf04>;
++               reg-io-width = <2>;
++               smsc,irq-push-pull;
++       };
++
++};
++
++&refclk {
++       clock-frequency = <50000000>;
++};
+diff --git a/arch/arm/dts/corstone1000.dtsi b/arch/arm/dts/corstone1000.dtsi
+new file mode 100644
+index 0000000000..b863193fb6
+--- /dev/null
++++ b/arch/arm/dts/corstone1000.dtsi
+@@ -0,0 +1,152 @@
++/*
++ * Copyright (c) 2021, Arm Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#include <dt-bindings/interrupt-controller/arm-gic.h>
++
++/ {
++	compatible = "arm,corstone1000";
++	interrupt-parent = <&gic>;
++	#address-cells = <1>;
++	#size-cells = <1>;
++
++	chosen { };
++
++	cpus {
++		#address-cells = <1>;
++		#size-cells = <0>;
++
++		cpu@0 {
++			device_type = "cpu";
++			compatible = "arm,armv8";
++			reg = <0>;
++			next-level-cache = <&L2_0>;
++		};
++	};
++
++	memory@80000000 {
++		device_type = "memory";
++		reg = <0x80000000 0x80000000>;
++	};
++
++	gic: interrupt-controller@1c000000 {
++		compatible = "arm,gic-400";
++		#interrupt-cells = <3>;
++		#address-cells = <0>;
++		interrupt-controller;
++		reg =	<0x1c010000 0x1000>,
++			<0x1c02f000 0x2000>,
++			<0x1c04f000 0x1000>,
++			<0x1c06f000 0x2000>;
++		interrupts = <1 9 0xf08>;
++	};
++
++	L2_0: l2-cache0 {
++		compatible = "cache";
++	};
++
++	refclk100mhz: refclk100mhz {
++		compatible = "fixed-clock";
++		#clock-cells = <0>;
++		clock-frequency = <100000000>;
++		clock-output-names = "apb_pclk";
++	};
++
++	smbclk: refclk24mhzx2 {
++		/* Reference 24MHz clock x 2 */
++		compatible = "fixed-clock";
++		#clock-cells = <0>;
++		clock-frequency = <48000000>;
++		clock-output-names = "smclk";
++	};
++
++	uartclk: uartclk {
++		/* UART clock - 50MHz */
++		compatible = "fixed-clock";
++		#clock-cells = <0>;
++		clock-frequency = <50000000>;
++		clock-output-names = "uartclk";
++	};
++
++	serial0: uart@1a510000 {
++		compatible = "arm,pl011", "arm,primecell";
++		reg = <0x1a510000 0x1000>;
++		interrupt-parent = <&gic>;
++		interrupts = <0 19 4>;
++		clocks = <&uartclk>, <&refclk100mhz>;
++		clock-names = "uartclk", "apb_pclk";
++	};
++
++	timer {
++		compatible = "arm,armv8-timer";
++		interrupts =	<1 13 0xf08>,
++				<1 14 0xf08>,
++				<1 11 0xf08>,
++				<1 10 0xf08>;
++	};
++
++	refclk: refclk@1a220000 {
++		compatible = "arm,armv7-timer-mem";
++		reg = <0x1a220000  0x1000>;
++		#address-cells = <1>;
++		#size-cells = <1>;
++		ranges;
++
++		frame@1a230000 {
++			frame-number = <0>;
++			interrupts = <0 2 0xf04>;
++			reg = <0x1a230000 0x1000>;
++		};
++	};
++
++	mbox_es0mhu0: mhu@1b000000 {
++		compatible = "arm,mhuv2","arm,primecell";
++		reg = <0x1b000000 0x1000>,
++		      <0x1b010000 0x1000>;
++		clocks = <&refclk100mhz>;
++		clock-names = "apb_pclk";
++		interrupts = <0 12 4>;
++		interrupt-names = "mhu_rx";
++		#mbox-cells = <1>;
++		mbox-name = "arm-es0-mhu0";
++	};
++
++	mbox_es0mhu1: mhu@1b020000 {
++		compatible = "arm,mhuv2","arm,primecell";
++		reg = <0x1b020000 0x1000>,
++		      <0x1b030000 0x1000>;
++		clocks = <&refclk100mhz>;
++		clock-names = "apb_pclk";
++		interrupts = <0 47 4>;
++		interrupt-names = "mhu_rx";
++		#mbox-cells = <1>;
++		mbox-name = "arm-es0-mhu1";
++	};
++
++	mbox_semhu1: mhu@1b820000 {
++		compatible = "arm,mhuv2","arm,primecell";
++		reg = <0x1b820000 0x1000>,
++		      <0x1b830000 0x1000>;
++		clocks = <&refclk100mhz>;
++		clock-names = "apb_pclk";
++		interrupts = <0 45 4>;
++		interrupt-names = "mhu_rx";
++		#mbox-cells = <1>;
++		mbox-name = "arm-se-mhu1";
++	};
++
++	client {
++		compatible = "arm,client";
++		mboxes = <&mbox_es0mhu0 0>, <&mbox_es0mhu1 0>, <&mbox_semhu1 0>;
++		mbox-names = "es0mhu0", "es0mhu1", "semhu1";
++	};
++
++	extsys0: extsys@1A010310 {
++		compatible = "arm,extsys_ctrl";
++		reg = <0x1A010310 0x4>,
++		      <0x1A010314 0x4>;
++		reg-names = "rstreg", "streg";
++	};
++};
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defconfig
+index fed2b16c93..c7f291efb6 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -4,7 +4,6 @@ CONFIG_SYS_TEXT_BASE=0x02100000
+ CONFIG_SYS_MALLOC_F_LEN=0x2000
+ CONFIG_NR_DRAM_BANKS=1
+ CONFIG_IDENT_STRING=" corstone1000 aarch64 "
+-CONFIG_DEFAULT_DEVICE_TREE="corstone1000-mps3"
+ CONFIG_FIT=y
+ CONFIG_BOOTDELAY=3
+ CONFIG_USE_BOOTARGS=y
+-- 
+2.33.0
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm-corstone1000-sharing-PSCI-DTS-node-between-FVP-a.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm-corstone1000-sharing-PSCI-DTS-node-between-FVP-a.patch
new file mode 100644
index 0000000..3ed5529
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0007-arm-corstone1000-sharing-PSCI-DTS-node-between-FVP-a.patch
@@ -0,0 +1,34 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From b50c1457fcd05cddf633bff074fc5edecff22e7e Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Wed, 25 Aug 2021 16:50:40 +0100
+Subject: [PATCH 07/16] arm: corstone1000: sharing PSCI DTS node between FVP
+ and MPS3
+
+At this level of development PSCI is needed to initialize the SMCCC.
+
+SMCCC is needed by FF-A and it is relevant to the MPS3 and FVP.
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+---
+ arch/arm/dts/corstone1000.dtsi | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/arch/arm/dts/corstone1000.dtsi b/arch/arm/dts/corstone1000.dtsi
+index b863193fb6..da1725e01f 100644
+--- a/arch/arm/dts/corstone1000.dtsi
++++ b/arch/arm/dts/corstone1000.dtsi
+@@ -149,4 +149,8 @@
+ 		      <0x1A010314 0x4>;
+ 		reg-names = "rstreg", "streg";
+ 	};
++	psci {
++		compatible = "arm,psci-1.0", "arm,psci-0.2";
++		method = "smc";
++	};
+ };
+-- 
+2.33.0
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm-corstone1000-Emulated-RTC-Support.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm-corstone1000-Emulated-RTC-Support.patch
new file mode 100644
index 0000000..ba01fe5
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0008-arm-corstone1000-Emulated-RTC-Support.patch
@@ -0,0 +1,32 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From 9a045bf04210bf9a00803fc47016e1af59d31e8f Mon Sep 17 00:00:00 2001
+From: "Arpita S.K" <Arpita.S.K@arm.com>
+Date: Mon, 11 Oct 2021 11:45:41 +0530
+Subject: [PATCH 08/16] arm: corstone1000: Emulated RTC Support
+
+This patch adds the options that should be
+enabled to turn on emulated RTC support.
+
+Signed-off-by: Arpita S.K <Arpita.S.K@arm.com>
+---
+ configs/corstone1000_defconfig | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defconfig
+index c7f291efb6..dbe3c9e3f3 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -36,3 +36,8 @@ CONFIG_USB=y
+ CONFIG_DM_USB=y
+ CONFIG_USB_ISP1760=y
+ CONFIG_USB_STORAGE=y
++CONFIG_DM_RTC=y
++CONFIG_CMD_RTC=y
++CONFIG_EFI_GET_TIME=y
++CONFIG_EFI_SET_TIME=y
++CONFIG_RTC_EMULATION=y
+-- 
+2.33.0
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm-corstone1000-execute-uboot-from-DDR.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm-corstone1000-execute-uboot-from-DDR.patch
new file mode 100644
index 0000000..b004e1b
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0009-arm-corstone1000-execute-uboot-from-DDR.patch
@@ -0,0 +1,31 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From b720b166364407ceb05385f5e72cb238195622ad Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Wed, 1 Sep 2021 18:33:32 +0100
+Subject: [PATCH 09/16] arm: corstone1000: execute uboot from DDR
+
+Previously uboot was executing from CVM. With the addition of
+secure partitions in optee, uboot has been moved to DDR.
+
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+---
+ configs/corstone1000_defconfig | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defconfig
+index dbe3c9e3f3..af1c5ecd89 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -1,6 +1,6 @@
+ CONFIG_ARM=y
+ CONFIG_TARGET_CORSTONE1000=y
+-CONFIG_SYS_TEXT_BASE=0x02100000
++CONFIG_SYS_TEXT_BASE=0x80000000
+ CONFIG_SYS_MALLOC_F_LEN=0x2000
+ CONFIG_NR_DRAM_BANKS=1
+ CONFIG_IDENT_STRING=" corstone1000 aarch64 "
+-- 
+2.33.0
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index e4746de..30a6f7f 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -2,6 +2,27 @@
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
+#
+# Corstone1000 64-bit machines
+#
+
+CORSTONE1000_DEVICE_TREE:corstone1000-fvp = "corstone1000-fvp"
+EXTRA_OEMAKE:append:corstone1000 = ' DEVICE_TREE=${CORSTONE1000_DEVICE_TREE}'
+
+SYSROOT_DIRS:append:corstone1000 = " /boot"
+
+SRC_URI:append:corstone1000 = " \
+      file://0001-arm-add-corstone1000-platform.patch \
+      file://0002-arm-corstone1000-enable-devicetree-in-defconfig.patch \
+      file://0003-usb-common-move-urb-code-to-common.patch \
+      file://0004-usb-add-isp1760-family-driver.patch \
+      file://0005-corstone1000-enable-isp1763-and-usb-stack.patch \
+      file://0006-corstone1000-enable-support-for-FVP.patch \
+      file://0007-arm-corstone1000-sharing-PSCI-DTS-node-between-FVP-a.patch \
+      file://0008-arm-corstone1000-Emulated-RTC-Support.patch \
+      file://0009-arm-corstone1000-execute-uboot-from-DDR.patch \
+      "
+
 #
 # FVP BASE
 #
-- 
2.17.1


