Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web10.5895.1594299143429277110
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Jul 2020 05:52:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=x1GiyGwP;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.196, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f196.google.com with SMTP id e11so1612498qkm.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 09 Jul 2020 05:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=j9raFeDb/zkiX1bnzMlm8p7+Yd1J3Zl9mZiFZjR0pNI=;
        b=x1GiyGwPiay440UopobbAZjYAwfvfAKTq6zL9hPL0HKtBFbspZ/SVZH1ciDSek9Xur
         WkpUgauSD6e7j2kgrwDzv8DXmEONYVLpYVKxjrSraBuSjExZZYYYDQrxxeLennURO9E2
         67XzZujt1PHPvVMNHtymImkkavbX6o/f9fFHR9CQPQjB3fSToeocL73RcqI7XJPu7MwL
         1W4KIsWxKb0gfuQQ5IwIBmuUkzGKUXkMgKogxaTYqV4n/1AjdqmYmsh3OseY3/rBp/3b
         inCWqv4tpWz2nsI10BRBaQm1CdkVykC7vPHzfCVSOINlt7uGfb4El0LFLNG64PkgXoD0
         uoxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=j9raFeDb/zkiX1bnzMlm8p7+Yd1J3Zl9mZiFZjR0pNI=;
        b=MYwHPgm+XYS6g8ZfJr2M50BM0c+WtE5DRV807Nhr8EYLnfBp//XhMmch6Ds7RVDObS
         LQATIcqynZtM+tZJN9dYs0XyKxQQKO1bmZ14tDOo6r/Aji7YNzYoYawQtGps3TW4fjVk
         ztzNju0HLV3ute2t/LC0t9uooARZ+sdjxCoGRICdrnHAQAVf6wF4d7NdbszaoD3E26dV
         PPYGSg7wkccUi5cGOzFAn1UChetnEEVJ3bk0w8lcyguXqnQvhd2PMM6XW0pAsnlrqZgG
         fepIg/J3jLGAS3s1KU1TvBQhsJKaKbH3d+OkNMnXvsVVQidvrI4zinqrbLrbz3LfMwYU
         Va3g==
X-Gm-Message-State: AOAM531Wu3UOb0uUNe6BEcZVm7rfk0DXw69Fkt4783CpeAOh2UvwHjx8
	a1pM358XNiAoJsdxigRB3VCsoqWcxwnIAQ==
X-Google-Smtp-Source: ABdhPJw2LAaL/GNXm5/QbuB9iyXfJjRR8Z0YCXK6T2sGDm/jH9aCxJiFitE/00ecghH3IOLH3kpbsQ==
X-Received: by 2002:a37:46ca:: with SMTP id t193mr63237318qka.293.1594299142447;
        Thu, 09 Jul 2020 05:52:22 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:5416:c1ad:e833:f407])
        by smtp.gmail.com with ESMTPSA id g30sm3981167qte.72.2020.07.09.05.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 05:52:21 -0700 (PDT)
Date: Thu, 9 Jul 2020 08:52:20 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Usama Arif <usama.arif@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-bsp/u-boot: Updated platform port for TC0
Message-ID: <20200709125219.GB9023@kudzu.us>
References: <20200707141848.36308-1-usama.arif@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200707141848.36308-1-usama.arif@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 07, 2020 at 03:18:48PM +0100, Usama Arif wrote:
> This makes the platform port independent of vexpress board
> so it applies cleanly on both u-boot 2019.07 (zeus) and
> 2020.01 (dunfell). The SRCREV that existed in u-boot-tc0.inc
> for v2020.07-rc3 has been removed and the default SRCREV is
> now used.
> 
> Change-Id: Ieb65cb666a1812eeeb2e3e306aec06b5e538cf06
> Signed-off-by: Usama Arif <usama.arif@arm.com>

Applied to master.

Thanks,
Jon

> ---
>  .../0001-Add-support-for-Total-Compute.patch  | 307 ++++++++++++++++++
>  .../tc0/tc0-config-and-android-boot.patch     | 160 ---------
>  .../recipes-bsp/u-boot/u-boot-tc0.inc         |   5 +-
>  3 files changed, 308 insertions(+), 164 deletions(-)
>  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/tc0/0001-Add-support-for-Total-Compute.patch
>  delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/tc0/tc0-config-and-android-boot.patch
> 
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/tc0/0001-Add-support-for-Total-Compute.patch b/meta-arm-bsp/recipes-bsp/u-boot/files/tc0/0001-Add-support-for-Total-Compute.patch
> new file mode 100644
> index 0000000..692a11f
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/files/tc0/0001-Add-support-for-Total-Compute.patch
> @@ -0,0 +1,307 @@
> +From 854c5d7b8a010d47da38735f15a31d0b7d10ae3c Mon Sep 17 00:00:00 2001
> +From: Usama Arif <usama.arif@arm.com>
> +Date: Fri, 3 Jul 2020 10:26:56 +0100
> +Subject: [PATCH] Add support for Total Compute
> +
> +This includes basic platform patch support and boots
> +kernel and ramdisk that have been sideloaded in DRAM.
> +
> +Change-Id: I2e35a1d983efd1d27572f671cad5a9fe4ad68ee6
> +Signed-off-by: Usama Arif <usama.arif@arm.com>
> +Upstream-Status: Pending
> +---
> + arch/arm/Kconfig                         |  9 +++
> + board/armltd/totalcompute/Kconfig        | 12 ++++
> + board/armltd/totalcompute/MAINTAINERS    |  6 ++
> + board/armltd/totalcompute/Makefile       |  6 ++
> + board/armltd/totalcompute/totalcompute.c | 74 +++++++++++++++++++++++
> + configs/total_compute_defconfig          | 39 ++++++++++++
> + include/configs/total_compute.h          | 77 ++++++++++++++++++++++++
> + 7 files changed, 223 insertions(+)
> + create mode 100644 board/armltd/totalcompute/Kconfig
> + create mode 100644 board/armltd/totalcompute/MAINTAINERS
> + create mode 100644 board/armltd/totalcompute/Makefile
> + create mode 100644 board/armltd/totalcompute/totalcompute.c
> + create mode 100644 configs/total_compute_defconfig
> + create mode 100644 include/configs/total_compute.h
> +
> +diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> +index 36c9c2fecd0..b423b7655b6 100644
> +--- a/arch/arm/Kconfig
> ++++ b/arch/arm/Kconfig
> +@@ -635,6 +635,14 @@ config TARGET_VEXPRESS_CA15_TC2
> +       select CPU_V7_HAS_VIRT
> +       select PL011_SERIAL
> +
> ++config TARGET_TOTAL_COMPUTE
> ++      bool "Support Total Compute Platform"
> ++      select ARM64
> ++      select PL01X_SERIAL
> ++      select DM
> ++      select DM_SERIAL
> ++      select DM_ETH
> ++
> + config ARCH_BCMSTB
> +       bool "Broadcom BCM7XXX family"
> +       select CPU_V7A
> +@@ -1774,6 +1782,7 @@ source "arch/arm/cpu/armv8/Kconfig"
> +
> + source "arch/arm/mach-imx/Kconfig"
> +
> ++source "board/armltd/totalcompute/Kconfig"
> + source "board/bosch/shc/Kconfig"
> + source "board/bosch/guardian/Kconfig"
> + source "board/CarMediaLab/flea3/Kconfig"
> +diff --git a/board/armltd/totalcompute/Kconfig b/board/armltd/totalcompute/Kconfig
> +new file mode 100644
> +index 00000000000..8bd8c30a6b5
> +--- /dev/null
> ++++ b/board/armltd/totalcompute/Kconfig
> +@@ -0,0 +1,12 @@
> ++if TARGET_TOTAL_COMPUTE
> ++
> ++config SYS_BOARD
> ++      default "totalcompute"
> ++
> ++config SYS_VENDOR
> ++      default "armltd"
> ++
> ++config SYS_CONFIG_NAME
> ++      default "total_compute"
> ++
> ++endif
> +diff --git a/board/armltd/totalcompute/MAINTAINERS b/board/armltd/totalcompute/MAINTAINERS
> +new file mode 100644
> +index 00000000000..bb09a90a309
> +--- /dev/null
> ++++ b/board/armltd/totalcompute/MAINTAINERS
> +@@ -0,0 +1,6 @@
> ++TOTAL_COMPUTE BOARD
> ++M:    Usama Arif <usama.arif@arm.com>
> ++S:    Maintained
> ++F:    board/armltd/totalcompute/
> ++F:    include/configs/total_compute.h
> ++F:    configs/total_compute_defconfig
> +diff --git a/board/armltd/totalcompute/Makefile b/board/armltd/totalcompute/Makefile
> +new file mode 100644
> +index 00000000000..4c40afef723
> +--- /dev/null
> ++++ b/board/armltd/totalcompute/Makefile
> +@@ -0,0 +1,6 @@
> ++# SPDX-License-Identifier: GPL-2.0+
> ++#
> ++# (C) Copyright 2020 ARM Limited
> ++# Usama Arif <usama.arif@arm.com>
> ++
> ++obj-y := totalcompute.o
> +diff --git a/board/armltd/totalcompute/totalcompute.c b/board/armltd/totalcompute/totalcompute.c
> +new file mode 100644
> +index 00000000000..21247e4ef0f
> +--- /dev/null
> ++++ b/board/armltd/totalcompute/totalcompute.c
> +@@ -0,0 +1,74 @@
> ++// SPDX-License-Identifier: GPL-2.0+
> ++/*
> ++ * (C) Copyright 2020 ARM Limited
> ++ * Usama Arif <usama.arif@arm.com>
> ++ */
> ++#include <common.h>
> ++#include <dm.h>
> ++#include <init.h>
> ++#include <malloc.h>
> ++#include <errno.h>
> ++#include <netdev.h>
> ++#include <asm/io.h>
> ++#include <linux/compiler.h>
> ++#include <dm/platform_data/serial_pl01x.h>
> ++#include <asm/armv8/mmu.h>
> ++
> ++DECLARE_GLOBAL_DATA_PTR;
> ++
> ++static const struct pl01x_serial_platdata serial_platdata = {
> ++      .base = UART0_BASE,
> ++      .type = TYPE_PL011,
> ++      .clock = CONFIG_PL011_CLOCK,
> ++};
> ++
> ++U_BOOT_DEVICE(total_compute_serials) = {
> ++      .name = "serial_pl01x",
> ++      .platdata = &serial_platdata,
> ++};
> ++
> ++static struct mm_region total_compute_mem_map[] = {
> ++      {
> ++              .virt = 0x0UL,
> ++              .phys = 0x0UL,
> ++              .size = 0x80000000UL,
> ++              .attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> ++                       PTE_BLOCK_NON_SHARE |
> ++                       PTE_BLOCK_PXN | PTE_BLOCK_UXN
> ++      }, {
> ++              .virt = 0x80000000UL,
> ++              .phys = 0x80000000UL,
> ++              .size = 0xff80000000UL,
> ++              .attrs = PTE_BLOCK_MEMTYPE(MT_NORMAL) |
> ++                       PTE_BLOCK_INNER_SHARE
> ++      }, {
> ++              /* List terminator */
> ++              0,
> ++      }
> ++};
> ++
> ++struct mm_region *mem_map = total_compute_mem_map;
> ++
> ++int board_init(void)
> ++{
> ++      return 0;
> ++}
> ++
> ++int dram_init(void)
> ++{
> ++      gd->ram_size = PHYS_SDRAM_1_SIZE;
> ++      return 0;
> ++}
> ++
> ++int dram_init_banksize(void)
> ++{
> ++      gd->bd->bi_dram[0].start = PHYS_SDRAM_1;
> ++      gd->bd->bi_dram[0].size = PHYS_SDRAM_1_SIZE;
> ++
> ++      return 0;
> ++}
> ++
> ++void reset_cpu(ulong addr)
> ++{
> ++}
> ++
> +diff --git a/configs/total_compute_defconfig b/configs/total_compute_defconfig
> +new file mode 100644
> +index 00000000000..31d97dddc21
> +--- /dev/null
> ++++ b/configs/total_compute_defconfig
> +@@ -0,0 +1,39 @@
> ++CONFIG_ARM=y
> ++CONFIG_TARGET_TOTAL_COMPUTE=y
> ++CONFIG_SYS_TEXT_BASE=0xe0000000
> ++CONFIG_SYS_MALLOC_F_LEN=0x2000
> ++CONFIG_ENV_SIZE=0x10000
> ++CONFIG_NR_DRAM_BANKS=2
> ++CONFIG_DISTRO_DEFAULTS=y
> ++CONFIG_BOOTDELAY=1
> ++CONFIG_USE_BOOTARGS=y
> ++CONFIG_BOOTARGS="console=ttyAMA0 debug user_debug=31 earlycon=pl011,0x7ff80000 loglevel=9 androidboot.hardware=total_compute video=640x480-32@60 root=/dev/vda2 ip=dhcp androidboot.selinux=permissive"
> ++# CONFIG_USE_BOOTCOMMAND is not set
> ++# CONFIG_DISPLAY_CPUINFO is not set
> ++# CONFIG_DISPLAY_BOARDINFO is not set
> ++CONFIG_SYS_PROMPT="TOTAL_COMPUTE# "
> ++# CONFIG_CMD_CONSOLE is not set
> ++# CONFIG_CMD_XIMG is not set
> ++# CONFIG_CMD_EDITENV is not set
> ++CONFIG_CMD_MEMTEST=y
> ++CONFIG_SYS_MEMTEST_START=0x80000000
> ++CONFIG_SYS_MEMTEST_END=0xff000000
> ++CONFIG_CMD_ARMFLASH=y
> ++# CONFIG_CMD_LOADS is not set
> ++# CONFIG_CMD_ITEST is not set
> ++# CONFIG_CMD_SETEXPR is not set
> ++# CONFIG_CMD_NFS is not set
> ++CONFIG_CMD_CACHE=y
> ++# CONFIG_CMD_MISC is not set
> ++CONFIG_CMD_UBI=y
> ++# CONFIG_ISO_PARTITION is not set
> ++# CONFIG_EFI_PARTITION is not set
> ++# CONFIG_MMC is not set
> ++CONFIG_MTD=y
> ++CONFIG_MTD_DEVICE=y
> ++CONFIG_MTD_NOR_FLASH=y
> ++CONFIG_FLASH_CFI_DRIVER=y
> ++CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
> ++CONFIG_SYS_FLASH_PROTECTION=y
> ++CONFIG_SYS_FLASH_CFI=y
> ++CONFIG_OF_LIBFDT=y
> +diff --git a/include/configs/total_compute.h b/include/configs/total_compute.h
> +new file mode 100644
> +index 00000000000..54086205db6
> +--- /dev/null
> ++++ b/include/configs/total_compute.h
> +@@ -0,0 +1,77 @@
> ++/* SPDX-License-Identifier: GPL-2.0+ */
> ++/*
> ++ * Configuration for Total Compute. Parts were derived from other ARM
> ++ * configurations.
> ++ * (C) Copyright 2020 ARM Limited
> ++ * Usama Arif <usama.arif@arm.com>
> ++ */
> ++
> ++#ifndef __TOTAL_COMPUTE_H
> ++#define __TOTAL_COMPUTE_H
> ++
> ++#define CONFIG_REMAKE_ELF
> ++
> ++/* Link Definitions */
> ++#define CONFIG_SYS_INIT_SP_ADDR         (CONFIG_SYS_SDRAM_BASE + 0x7fff0)
> ++#define CONFIG_ENV_SIZE       0x10000
> ++
> ++
> ++#define CONFIG_SYS_BOOTM_LEN (64 << 20)
> ++
> ++#define UART0_BASE                    0x7ff80000
> ++
> ++/* Generic Timer Definitions */
> ++#define COUNTER_FREQUENCY             (0x1800000)     /* 24MHz */
> ++
> ++/* Generic Interrupt Controller Definitions */
> ++
> ++#define GICD_BASE                     (0x2C010000)
> ++#define GICC_BASE                     (0x2C02f000)
> ++
> ++/* Size of malloc() pool */
> ++#define CONFIG_SYS_MALLOC_LEN         (CONFIG_ENV_SIZE + (8 << 20))
> ++
> ++/* PL011 Serial Configuration */
> ++#define CONFIG_PL011_CLOCK            7372800
> ++
> ++/* BOOTP options */
> ++#define CONFIG_BOOTP_BOOTFILESIZE
> ++
> ++/* Miscellaneous configurable options */
> ++#define CONFIG_SYS_LOAD_ADDR          0x90000000
> ++
> ++/* Physical Memory Map */
> ++#define PHYS_SDRAM_1                  0x80000000
> ++/* Top 32MB reserved for secure world use */
> ++#define DRAM_SEC_SIZE         0x02000000
> ++#define PHYS_SDRAM_1_SIZE     0x80000000 - DRAM_SEC_SIZE
> ++#define CONFIG_SYS_SDRAM_BASE PHYS_SDRAM_1
> ++
> ++/* Enable memtest */
> ++#define CONFIG_SYS_MEMTEST_START      PHYS_SDRAM_1
> ++#define CONFIG_SYS_MEMTEST_END                (PHYS_SDRAM_1 + PHYS_SDRAM_1_SIZE)
> ++
> ++#define CONFIG_EXTRA_ENV_SETTINGS     \
> ++                              "kernel_addr_r=0x80080000\0"    \
> ++                              "initrd_addr_r=0x88000000\0"    \
> ++                              "fdt_addr_r=0x83000000\0"       \
> ++                              "fdt_high=0xffffffffffffffff\0" \
> ++                              "initrd_high=0xffffffffffffffff\0"
> ++
> ++#define CONFIG_BOOTCOMMAND    "booti ${kernel_addr_r} ${initrd_addr_r} ${fdt_addr_r}"
> ++
> ++/* Monitor Command Prompt */
> ++#define CONFIG_SYS_CBSIZE             512     /* Console I/O Buffer Size */
> ++#define CONFIG_SYS_MAXARGS            64      /* max command args */
> ++
> ++#define CONFIG_SYS_FLASH_BASE         0x0C000000
> ++/* 256 x 256KiB sectors */
> ++#define CONFIG_SYS_MAX_FLASH_SECT     256
> ++
> ++#define CONFIG_SYS_FLASH_CFI_WIDTH    FLASH_CFI_32BIT
> ++#define CONFIG_SYS_MAX_FLASH_BANKS    1
> ++
> ++#define CONFIG_SYS_FLASH_EMPTY_INFO   /* flinfo indicates empty blocks */
> ++#define FLASH_MAX_SECTOR_SIZE         0x00040000
> ++
> ++#endif /* __TOTAL_COMPUTE_H */
> +--
> +2.17.1
> +
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/tc0/tc0-config-and-android-boot.patch b/meta-arm-bsp/recipes-bsp/u-boot/files/tc0/tc0-config-and-android-boot.patch
> deleted file mode 100644
> index a66898e..0000000
> --- a/meta-arm-bsp/recipes-bsp/u-boot/files/tc0/tc0-config-and-android-boot.patch
> +++ /dev/null
> @@ -1,160 +0,0 @@
> -From 0867e715d3563b0bc0ee7e04f9ec6b615de626b2 Mon Sep 17 00:00:00 2001
> -From: Usama Arif <usama.arif@arm.com>
> -Date: Thu, 04 Jun 2020 14:16:02 +0100
> -Subject: [PATCH] Introduce Total Compute platform
> -
> -This is based off vexpress64 platform. It includes support for
> -NOR flash and has bootargs setup for android boot.
> -
> -Change-Id: I965c81001a1c4a1a6788106f0ba2ca577dee4096
> -Signed-off-by: Usama Arif <usama.arif@arm.com>
> -Upstream-Status: Pending
> -Signed-off-by: Teo Couprie Diaz <teo.coupriediaz@arm.com>
> ----
> -
> -diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> -index 21df1c4..c208a40 100644
> ---- a/arch/arm/Kconfig
> -+++ b/arch/arm/Kconfig
> -@@ -1174,6 +1174,14 @@
> -       select USB
> -       select DM_USB
> -
> -+config TARGET_TOTAL_COMPUTE
> -+      bool "Support Total Compute Platform"
> -+      select ARM64
> -+      select PL01X_SERIAL
> -+      select DM
> -+      select DM_SERIAL
> -+      select DM_ETH
> -+
> - config TARGET_LS2080A_EMU
> -       bool "Support ls2080a_emu"
> -       select ARCH_LS2080A
> -diff --git a/board/armltd/vexpress64/Kconfig b/board/armltd/vexpress64/Kconfig
> -index 1d13f54..d59769f 100644
> ---- a/board/armltd/vexpress64/Kconfig
> -+++ b/board/armltd/vexpress64/Kconfig
> -@@ -1,4 +1,4 @@
> --if TARGET_VEXPRESS64_BASE_FVP || TARGET_VEXPRESS64_JUNO
> -+if TARGET_VEXPRESS64_BASE_FVP || TARGET_VEXPRESS64_JUNO || TARGET_TOTAL_COMPUTE
> -
> - config SYS_BOARD
> -       default "vexpress64"
> -diff --git a/configs/total_compute_defconfig b/configs/total_compute_defconfig
> -new file mode 100644
> -index 0000000..1faeb36
> ---- /dev/null
> -+++ b/configs/total_compute_defconfig
> -@@ -0,0 +1,40 @@
> -+CONFIG_ARM=y
> -+CONFIG_TARGET_TOTAL_COMPUTE=y
> -+CONFIG_SYS_TEXT_BASE=0xe0000000
> -+CONFIG_SYS_MALLOC_F_LEN=0x2000
> -+CONFIG_ENV_SIZE=0x10000
> -+CONFIG_NR_DRAM_BANKS=2
> -+CONFIG_DISTRO_DEFAULTS=y
> -+CONFIG_BOOTDELAY=1
> -+CONFIG_USE_BOOTARGS=y
> -+CONFIG_BOOTARGS="console=ttyAMA0 debug user_debug=31 earlycon=pl011,0x7ff80000 loglevel=9 androidboot.hardware=total_compute video=640x480-32@60 root=/dev/vda2 ip=dhcp androidboot.selinux=permissive"
> -+# CONFIG_USE_BOOTCOMMAND is not set
> -+# CONFIG_DISPLAY_CPUINFO is not set
> -+# CONFIG_DISPLAY_BOARDINFO is not set
> -+CONFIG_SYS_PROMPT="TOTAL_COMPUTE# "
> -+# CONFIG_CMD_CONSOLE is not set
> -+# CONFIG_CMD_XIMG is not set
> -+# CONFIG_CMD_EDITENV is not set
> -+CONFIG_CMD_MEMTEST=y
> -+CONFIG_SYS_MEMTEST_START=0x80000000
> -+CONFIG_SYS_MEMTEST_END=0xff000000
> -+CONFIG_CMD_ARMFLASH=y
> -+# CONFIG_CMD_LOADS is not set
> -+# CONFIG_CMD_ITEST is not set
> -+# CONFIG_CMD_SETEXPR is not set
> -+# CONFIG_CMD_NFS is not set
> -+CONFIG_CMD_CACHE=y
> -+# CONFIG_CMD_MISC is not set
> -+CONFIG_CMD_UBI=y
> -+# CONFIG_ISO_PARTITION is not set
> -+# CONFIG_EFI_PARTITION is not set
> -+# CONFIG_MMC is not set
> -+CONFIG_MTD=y
> -+CONFIG_MTD_NOR_FLASH=y
> -+CONFIG_FLASH_CFI_DRIVER=y
> -+CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
> -+CONFIG_SYS_FLASH_PROTECTION=y
> -+CONFIG_SYS_FLASH_CFI=y
> -+CONFIG_SMC911X=y
> -+CONFIG_SMC911X_32_BIT=y
> -+CONFIG_OF_LIBFDT=y
> -diff --git a/include/configs/vexpress_aemv8a.h b/include/configs/vexpress_aemv8a.h
> -index 09cdd3d..e39699e 100644
> ---- a/include/configs/vexpress_aemv8a.h
> -+++ b/include/configs/vexpress_aemv8a.h
> -@@ -13,7 +13,7 @@
> - #ifdef CONFIG_TARGET_VEXPRESS64_BASE_FVP
> - /* ATF loads u-boot here for BASE_FVP model */
> - #define CONFIG_SYS_INIT_SP_ADDR         (CONFIG_SYS_SDRAM_BASE + 0x03f00000)
> --#elif CONFIG_TARGET_VEXPRESS64_JUNO
> -+#elif defined(CONFIG_TARGET_VEXPRESS64_JUNO) || defined(CONFIG_TARGET_TOTAL_COMPUTE)
> - #define CONFIG_SYS_INIT_SP_ADDR         (CONFIG_SYS_SDRAM_BASE + 0x7fff0)
> - #endif
> -
> -@@ -40,7 +40,7 @@
> - #define V2M_KMI0                      (V2M_PA_CS3 + V2M_PERIPH_OFFSET(6))
> - #define V2M_KMI1                      (V2M_PA_CS3 + V2M_PERIPH_OFFSET(7))
> -
> --#ifdef CONFIG_TARGET_VEXPRESS64_JUNO
> -+#if defined(CONFIG_TARGET_VEXPRESS64_JUNO) || defined(CONFIG_TARGET_TOTAL_COMPUTE)
> - #define V2M_UART0                     0x7ff80000
> - #define V2M_UART1                     0x7ff70000
> - #else /* Not Juno */
> -@@ -79,7 +79,7 @@
> - #ifdef CONFIG_TARGET_VEXPRESS64_BASE_FVP
> - #define GICD_BASE                     (0x2f000000)
> - #define GICC_BASE                     (0x2c000000)
> --#elif CONFIG_TARGET_VEXPRESS64_JUNO
> -+#elif defined(CONFIG_TARGET_VEXPRESS64_JUNO) || defined(CONFIG_TARGET_TOTAL_COMPUTE)
> - #define GICD_BASE                     (0x2C010000)
> - #define GICC_BASE                     (0x2C02f000)
> - #endif
> -@@ -88,14 +88,19 @@
> - /* Size of malloc() pool */
> - #define CONFIG_SYS_MALLOC_LEN         (CONFIG_ENV_SIZE + (8 << 20))
> -
> -+#ifdef CONFIG_TARGET_TOTAL_COMPUTE
> -+#define CONFIG_SMC911X_BASE           0x18000000
> -+#else
> -+
> - #ifndef CONFIG_TARGET_VEXPRESS64_JUNO
> - /* The Vexpress64 simulators use SMSC91C111 */
> - #define CONFIG_SMC91111                       1
> - #define CONFIG_SMC91111_BASE          (0x01A000000)
> - #endif
> -
> -+#endif
> - /* PL011 Serial Configuration */
> --#ifdef CONFIG_TARGET_VEXPRESS64_JUNO
> -+#if defined(CONFIG_TARGET_VEXPRESS64_JUNO) || defined(CONFIG_TARGET_TOTAL_COMPUTE)
> - #define CONFIG_PL011_CLOCK            7372800
> - #else
> - #define CONFIG_PL011_CLOCK            24000000
> -@@ -189,8 +194,17 @@
> -                               "fi"
> -
> -
> --#endif
> -+#elif CONFIG_TARGET_TOTAL_COMPUTE
> -+#define CONFIG_EXTRA_ENV_SETTINGS     \
> -+                              "kernel_addr_r=0x80080000\0"    \
> -+                              "initrd_addr_r=0x88000000\0"    \
> -+                              "fdt_addr_r=0x83000000\0"       \
> -+                              "fdt_high=0xffffffffffffffff\0" \
> -+                              "initrd_high=0xffffffffffffffff\0"
> -
> -+#define CONFIG_BOOTCOMMAND    "booti ${kernel_addr_r} ${initrd_addr_r} ${fdt_addr_r}"
> -+
> -+#endif
> - /* Monitor Command Prompt */
> - #define CONFIG_SYS_CBSIZE             512     /* Console I/O Buffer Size */
> - #define CONFIG_SYS_MAXARGS            64      /* max command args */
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-tc0.inc b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-tc0.inc
> index 6c2ed5f..6594b3f 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-tc0.inc
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-tc0.inc
> @@ -1,6 +1,3 @@
>  # TC0 specific Das U-Boot configuration and patch
> 
> -SRC_URI_append = ' file://tc0-config-and-android-boot.patch'
> -
> -# v2020.07-rc3 tag commit
> -SRCREV = "8c48bb21bd6a1778d1f299de30ff62c07929702b"
> +SRC_URI_append = ' file://0001-Add-support-for-Total-Compute.patch'
> --
> 2.17.1
> 
> IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium. Thank you.

> 

