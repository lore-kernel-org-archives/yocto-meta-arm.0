Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.493.1596839980561682324
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 07 Aug 2020 15:39:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=hgr9sSHU;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f195.google.com with SMTP id x69so3196277qkb.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 07 Aug 2020 15:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OdFSJ4Lb9tfNRM4Db/F+otuG8tO7ix2W/Loa7zjBo/U=;
        b=hgr9sSHUvY4EaQjbv6UZGkqrbcAdWh5wPAnMOeV95pfR0SEuuOtVgaOe0W1tzmgTk6
         /uVMy3a4+wTRvvaCnxLLq0qN9FLPtukcXQPBMW6mLGAcxPY9Qmzm7xcauHsl6nBFkTdf
         utb6wruNT346sX2/+VDvsgEo16ircHPWTIjTnopjDh9r/gdeOW59QNQXByxwC8EOOJMQ
         w28xsum1UPKvgocqO3yn/5HjYmR8KpXcvo4PLM4zL1EG/risz6PKP8ATefXtOyScrv89
         EsWfSS07eZDusUrUQoUn0lnl9vu1QZVkJjhPZcAXIekgt1bnX2lythjTp1jw5ow0z0ZM
         5zLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OdFSJ4Lb9tfNRM4Db/F+otuG8tO7ix2W/Loa7zjBo/U=;
        b=g8PMc2g7LbNrl2oqvZOwJlvIztVj8Zt07qX1MyUDXv6mGNbDb8m7Qi48H0ffSCBnF3
         lA8/qgsghsFvedKTuRrDog0Rk2ROseKk7OfCdMvT9OFATROAV8Wt5yaG7yDIf6r0j/we
         ledSP2T7Gg8WwhyCfa88gTATZSoorn7L7loW+E5UnGYADJV29P/wBA5cdduShpx1etIi
         8Xdhp9BsP8M9ABUUMSfN9TxeeWL192/Fov3NTe31oPk///wYtxmP0W319QrMz3TR0zw7
         RooTWSt9aqaFmSB0XhmwJekw8MR9OyuWsRI7IbLtVIunw0/0dicZlaJ8gGuqyzVrGIsh
         7g+w==
X-Gm-Message-State: AOAM530LsLt5ctp0uQrf44wv/xsojhQqnxhcYEx+gWe7hhqcIUd+vUQk
	BPjjtbemCR2BjKMyBMs8oEd/7A==
X-Google-Smtp-Source: ABdhPJzlJ2kDJTSzhfiQTmdMbAp7Lc0QNIWRhGR5bEdXPcfKAe2InIzu6YuzNgqs4npwOZim1g2grQ==
X-Received: by 2002:a05:620a:68a:: with SMTP id f10mr15844318qkh.281.1596839979321;
        Fri, 07 Aug 2020 15:39:39 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:e80f:35b:ebd6:4d35])
        by smtp.gmail.com with ESMTPSA id v2sm8931836qte.25.2020.08.07.15.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 15:39:38 -0700 (PDT)
Date: Fri, 7 Aug 2020 18:39:37 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: abdellatif.elkhlifi@arm.com
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com,
	Rui Miguel Silva <rui.silva@linaro.org>
Subject: Re: [meta-arm] [PATCH 6/9] arm-bsp/u-boot: adding corstone700 platform to u-boot
Message-ID: <20200807223936.GC440@kudzu.us>
References: <20200807194253.14748-1-abdellatif.elkhlifi@arm.com>
 <20200807194253.14748-7-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200807194253.14748-7-abdellatif.elkhlifi@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 07, 2020 at 08:42:50PM +0100, abdellatif.elkhlifi@arm.com wrote:
> From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> 
> Adding support for the new Arm corstone700 platform family.
> 
> The current supported corstone700 machine is corstone700-fvp.
> 
> The changes are as follows:
> 
>   - Making some adjustments to the mmio timer and to the cortex-a5
>     designstart platform to share as much as possible between this
>     platforms.
> 
>   - Disabling the use of the mmio_timer driver and enabling the
>     arch_timer driver.
>     The mmio_timer tries a direct access to the Armv8-A CNTFRQ generic timer
>     frequency register through memory mapping. This can not be done because
>     this register is only accessible through memory mapping under a secure
>     mode only. u-boot runs in non secure Hypervisor mode. To read the counter
>     frequency u-boot should use the mrc instruction to read the CNTFRQ system
>     register. The arch_timer driver reads the CNTFRQ register using the mrc
>     instruction.
> 
>   - adding bootx command to start XiP images
> 
> Change-Id: I40f5e91cfb8865e2904b0f5ac9920df75705b593
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>


This patch breaks Juno, a5ds, and fvp-base-arm32.  So, I'm asking you
to correct the issue and resubmit the series.

Also, I see the same first two u-boot patches in 
./meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/a5ds/
./meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/a5ds/

It would make sense to use u-boot v2020.07, reuse those patches in
a5ds (perhaps making them common), and putting the rest into 
./meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/corstone700/

Thanks,
Jon


> ---
>  .../conf/machine/include/corstone700.inc      |   5 +-
>  .../0001-armv7-add-mmio-timer.patch           | 108 ++++++
>  ...-arm-add-designstart-cortex-a5-board.patch | 312 ++++++++++++++++++
>  .../0003-arm-Add-corstone700-platform.patch   | 301 +++++++++++++++++
>  ...dd-bootx-command-to-start-XiP-images.patch | 136 ++++++++
>  ...g-the-XIP-kernel-using-bootx-command.patch |  39 +++
>  ...6-arm-enabling-the-arch_timer-driver.patch |  61 ++++
>  .../recipes-bsp/u-boot/u-boot_%.bbappend      |  12 +
>  meta-arm/recipes-bsp/u-boot/u-boot_2020.04.bb |  26 ++
>  9 files changed, 999 insertions(+), 1 deletion(-)
>  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0001-armv7-add-mmio-timer.patch
>  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0002-board-arm-add-designstart-cortex-a5-board.patch
>  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0003-arm-Add-corstone700-platform.patch
>  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0004-boot-add-bootx-command-to-start-XiP-images.patch
>  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0005-boot-starting-the-XIP-kernel-using-bootx-command.patch
>  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0006-arm-enabling-the-arch_timer-driver.patch
>  create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot_2020.04.bb
> 
> diff --git a/meta-arm-bsp/conf/machine/include/corstone700.inc b/meta-arm-bsp/conf/machine/include/corstone700.inc
> index 4c00c6d..6b02415 100644
> --- a/meta-arm-bsp/conf/machine/include/corstone700.inc
> +++ b/meta-arm-bsp/conf/machine/include/corstone700.inc
> @@ -14,10 +14,13 @@ PREFERRED_VERSION_linux-stable ?= "5.6%"
>  PREFERRED_PROVIDER_virtual/trusted-firmware-a ?= "trusted-firmware-a"
>  PREFERRED_VERSION_trusted-firmware-a ?= "2.3%"
>  
> -EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a external-system"
> +EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a external-system u-boot"
>  
>  WKS_FILE_DEPENDS_append = " ${EXTRA_IMAGEDEPENDS}"
>  
>  WKS_FILE ?= "arm-reference-image.corstone700.wks"
>  
>  VIRTUAL-RUNTIME_dev_manager = "busybox-mdev"
> +
> +UBOOT_MACHINE ?= "corstone700_defconfig"
> +PREFERRED_VERSION_u-boot ?= "2020.04"
> \ No newline at end of file
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0001-armv7-add-mmio-timer.patch b/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0001-armv7-add-mmio-timer.patch
> new file mode 100644
> index 0000000..3b72faf
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0001-armv7-add-mmio-timer.patch
> @@ -0,0 +1,108 @@
> +Upstream-Status: Pending [Not submitted to upstream yet]
> +Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> +
> +From 4a47e29e8c0dd7d063b44fafff7db06f00c42fc0 Mon Sep 17 00:00:00 2001
> +From: Rui Silva <rui.silva@linaro.org>
> +Date: Wed, 5 Aug 2020 18:57:03 +0100
> +Subject: [PATCH 1/6] armv7: add mmio timer
> +
> +This timer can be used by u-boot when arch-timer is not available in
> +core, for example, Cortex-A5.
> +
> +Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> +---
> + arch/arm/cpu/armv7/Makefile     |  1 +
> + arch/arm/cpu/armv7/mmio_timer.c | 56 +++++++++++++++++++++++++++++++++
> + scripts/config_whitelist.txt    |  1 +
> + 3 files changed, 58 insertions(+)
> + create mode 100644 arch/arm/cpu/armv7/mmio_timer.c
> +
> +diff --git a/arch/arm/cpu/armv7/Makefile b/arch/arm/cpu/armv7/Makefile
> +index 8c955d0d52..82af9c0312 100644
> +--- a/arch/arm/cpu/armv7/Makefile
> ++++ b/arch/arm/cpu/armv7/Makefile
> +@@ -28,6 +28,7 @@ obj-$(CONFIG_ARMV7_PSCI)	+= psci.o psci-common.o
> + obj-$(CONFIG_IPROC) += iproc-common/
> + obj-$(CONFIG_KONA) += kona-common/
> + obj-$(CONFIG_SYS_ARCH_TIMER) += arch_timer.o
> ++obj-$(CONFIG_SYS_MMIO_TIMER) += mmio_timer.o
> + 
> + ifneq (,$(filter s5pc1xx exynos,$(SOC)))
> + obj-y += s5p-common/
> +diff --git a/arch/arm/cpu/armv7/mmio_timer.c b/arch/arm/cpu/armv7/mmio_timer.c
> +new file mode 100644
> +index 0000000000..5d6f661723
> +--- /dev/null
> ++++ b/arch/arm/cpu/armv7/mmio_timer.c
> +@@ -0,0 +1,56 @@
> ++// SPDX-License-Identifier: GPL-2.0+
> ++/*
> ++ * Copyright (c) 2019, Arm Limited. All rights reserved.
> ++ *
> ++ */
> ++
> ++#include <common.h>
> ++#include <asm/io.h>
> ++#include <div64.h>
> ++#include <bootstage.h>
> ++
> ++DECLARE_GLOBAL_DATA_PTR;
> ++
> ++#define CNTCTLBASE    0x1a020000UL
> ++#define CNTREADBASE   0x1a030000UL
> ++
> ++static inline uint32_t mmio_read32(uintptr_t addr)
> ++{
> ++      return *(volatile uint32_t*)addr;
> ++}
> ++
> ++int timer_init(void)
> ++{
> ++      gd->arch.timer_rate_hz = mmio_read32(CNTCTLBASE);
> ++
> ++      return 0;
> ++}
> ++
> ++unsigned long long get_ticks(void)
> ++{
> ++      return ((mmio_read32(CNTCTLBASE + 0x4) << 32) |
> ++              mmio_read32(CNTREADBASE));
> ++}
> ++
> ++ulong get_timer(ulong base)
> ++{
> ++      return lldiv(get_ticks(), gd->arch.timer_rate_hz) - base;
> ++}
> ++
> ++void __udelay(unsigned long usec)
> ++{
> ++      unsigned long endtime;
> ++
> ++      endtime = lldiv((unsigned long long)usec * gd->arch.timer_rate_hz,
> ++                      1000UL);
> ++
> ++      endtime += get_ticks();
> ++
> ++      while (get_ticks() < endtime)
> ++              ;
> ++}
> ++
> ++ulong get_tbclk(void)
> ++{
> ++      return gd->arch.timer_rate_hz;
> ++}
> +diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
> +index 6908431d03..186001ecfb 100644
> +--- a/scripts/config_whitelist.txt
> ++++ b/scripts/config_whitelist.txt
> +@@ -3108,6 +3108,7 @@ CONFIG_SYS_MMC_U_BOOT_DST
> + CONFIG_SYS_MMC_U_BOOT_OFFS
> + CONFIG_SYS_MMC_U_BOOT_SIZE
> + CONFIG_SYS_MMC_U_BOOT_START
> ++CONFIG_SYS_MMIO_TIMER
> + CONFIG_SYS_MONITOR_
> + CONFIG_SYS_MONITOR_BASE
> + CONFIG_SYS_MONITOR_BASE_EARLY
> +-- 
> +2.17.1
> +
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0002-board-arm-add-designstart-cortex-a5-board.patch b/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0002-board-arm-add-designstart-cortex-a5-board.patch
> new file mode 100644
> index 0000000..217e52a
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0002-board-arm-add-designstart-cortex-a5-board.patch
> @@ -0,0 +1,312 @@
> +Upstream-Status: Pending [Not submitted to upstream yet]
> +Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> +
> +From a9f0c9861d49a7b14fa10c53192850f46bd8b9b1 Mon Sep 17 00:00:00 2001
> +From: Rui Silva <rui.silva@linaro.org>
> +Date: Wed, 5 Aug 2020 18:58:40 +0100
> +Subject: [PATCH 2/6] board: arm: add designstart cortex-a5 board
> +
> +Arm added a new board, designstart, with a cortex-a5 chip, add the
> +default configuration, initialization and makefile for this system.
> +
> +Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> +---
> + arch/arm/Kconfig                       |   7 ++
> + board/armltd/designstart/Kconfig       |  12 +++
> + board/armltd/designstart/Makefile      |   8 ++
> + board/armltd/designstart/designstart.c |  49 ++++++++++
> + configs/designstart_ca5_defconfig      |  37 ++++++++
> + include/configs/designstart_ca5.h      | 122 +++++++++++++++++++++++++
> + 6 files changed, 235 insertions(+)
> + create mode 100644 board/armltd/designstart/Kconfig
> + create mode 100644 board/armltd/designstart/Makefile
> + create mode 100644 board/armltd/designstart/designstart.c
> + create mode 100644 configs/designstart_ca5_defconfig
> + create mode 100644 include/configs/designstart_ca5.h
> +
> +diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> +index bbb1e2738b..ed7ee146ac 100644
> +--- a/arch/arm/Kconfig
> ++++ b/arch/arm/Kconfig
> +@@ -636,6 +636,12 @@ config ARCH_BCM6858
> + 	select OF_CONTROL
> + 	imply CMD_DM
> + 
> ++config TARGET_DESIGNSTART_CA5
> ++      bool "Support Designstart Cortex-A5"
> ++      select CPU_V7A
> ++      select SEMIHOSTING
> ++      select PL01X_SERIAL
> ++
> + config TARGET_VEXPRESS_CA15_TC2
> + 	bool "Support vexpress_ca15_tc2"
> + 	select CPU_V7A
> +@@ -1820,6 +1826,7 @@ source "board/Marvell/gplugd/Kconfig"
> + source "board/armadeus/apf27/Kconfig"
> + source "board/armltd/vexpress/Kconfig"
> + source "board/armltd/vexpress64/Kconfig"
> ++source "board/armltd/designstart/Kconfig"
> + source "board/cortina/presidio-asic/Kconfig"
> + source "board/broadcom/bcm23550_w1d/Kconfig"
> + source "board/broadcom/bcm28155_ap/Kconfig"
> +diff --git a/board/armltd/designstart/Kconfig b/board/armltd/designstart/Kconfig
> +new file mode 100644
> +index 0000000000..a9564e8655
> +--- /dev/null
> ++++ b/board/armltd/designstart/Kconfig
> +@@ -0,0 +1,12 @@
> ++if TARGET_DESIGNSTART_CA5
> ++
> ++config SYS_BOARD
> ++      default "designstart"
> ++
> ++config SYS_VENDOR
> ++      default "armltd"
> ++
> ++config SYS_CONFIG_NAME
> ++      default "designstart_ca5"
> ++
> ++endif
> +diff --git a/board/armltd/designstart/Makefile b/board/armltd/designstart/Makefile
> +new file mode 100644
> +index 0000000000..d2dc2b74ed
> +--- /dev/null
> ++++ b/board/armltd/designstart/Makefile
> +@@ -0,0 +1,8 @@
> ++# SPDX-License-Identifier: GPL-2.0+
> ++#
> ++# (C) Copyright 2020 ARM Limited
> ++# (C) Copyright 2020 Linaro
> ++# Rui Miguel Silva <rui.silva@linaro.org>
> ++#
> ++
> ++obj-y := designstart.o
> +diff --git a/board/armltd/designstart/designstart.c b/board/armltd/designstart/designstart.c
> +new file mode 100644
> +index 0000000000..658057a003
> +--- /dev/null
> ++++ b/board/armltd/designstart/designstart.c
> +@@ -0,0 +1,49 @@
> ++// SPDX-License-Identifier: GPL-2.0+
> ++/*
> ++ * (C) Copyright 2020 ARM Limited
> ++ * (C) Copyright 2020 Linaro
> ++ * Rui Miguel Silva <rui.silva@linaro.org>
> ++ */
> ++
> ++#include <common.h>
> ++#include <dm.h>
> ++#include <dm/platform_data/serial_pl01x.h>
> ++#include <malloc.h>
> ++
> ++DECLARE_GLOBAL_DATA_PTR;
> ++
> ++static const struct pl01x_serial_platdata serial_platdata = {
> ++      .base = V2M_UART0,
> ++      .type = TYPE_PL011,
> ++      .clock = CONFIG_PL011_CLOCK,
> ++};
> ++
> ++U_BOOT_DEVICE(designstart_serials) = {
> ++      .name = "serial_pl01x",
> ++      .platdata = &serial_platdata,
> ++};
> ++
> ++int board_init(void)
> ++{
> ++      return 0;
> ++}
> ++
> ++int dram_init(void)
> ++{
> ++      gd->ram_size = PHYS_SDRAM_1_SIZE;
> ++
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
> +diff --git a/configs/designstart_ca5_defconfig b/configs/designstart_ca5_defconfig
> +new file mode 100644
> +index 0000000000..a2a7567402
> +--- /dev/null
> ++++ b/configs/designstart_ca5_defconfig
> +@@ -0,0 +1,37 @@
> ++CONFIG_ARM=y
> ++CONFIG_TARGET_DESIGNSTART_CA5=y
> ++CONFIG_SYS_TEXT_BASE=0x88000000
> ++CONFIG_SYS_MALLOC_F_LEN=0x2000
> ++CONFIG_NR_DRAM_BANKS=1
> ++CONFIG_IDENT_STRING=" ca5ds aarch32"
> ++CONFIG_BOOTDELAY=1
> ++CONFIG_USE_BOOTARGS=y
> ++CONFIG_BOOTARGS="console=ttyAMA0 earlycon=pl011,0x1a200000 root=/dev/ram0 rw loglevel=9"
> ++# CONFIG_DISPLAY_CPUINFO is not set
> ++# CONFIG_DISPLAY_BOARDINFO is not set
> ++CONFIG_HUSH_PARSER=y
> ++CONFIG_SYS_PROMPT="ca5ds32# "
> ++CONFIG_CMD_BOOTZ=y
> ++# CONFIG_CMD_CONSOLE is not set
> ++# CONFIG_CMD_IMLS is not set
> ++# CONFIG_CMD_XIMG is not set
> ++# CONFIG_CMD_EDITENV is not set
> ++# CONFIG_CMD_ENV_EXISTS is not set
> ++CONFIG_CMD_MEMTEST=y
> ++CONFIG_MTD_NOR_FLASH=y
> ++# CONFIG_CMD_LOADS is not set
> ++CONFIG_CMD_ARMFLASH=y
> ++# CONFIG_CMD_FPGA is not set
> ++# CONFIG_CMD_ITEST is not set
> ++# CONFIG_CMD_SETEXPR is not set
> ++CONFIG_CMD_DHCP=y
> ++# CONFIG_CMD_NFS is not set
> ++CONFIG_CMD_MII=y
> ++CONFIG_CMD_PING=y
> ++CONFIG_CMD_CACHE=y
> ++# CONFIG_CMD_MISC is not set
> ++CONFIG_CMD_FAT=y
> ++CONFIG_DM=y
> ++CONFIG_DM_SERIAL=y
> ++CONFIG_OF_LIBFDT=y
> ++
> +diff --git a/include/configs/designstart_ca5.h b/include/configs/designstart_ca5.h
> +new file mode 100644
> +index 0000000000..6db5b1cf4a
> +--- /dev/null
> ++++ b/include/configs/designstart_ca5.h
> +@@ -0,0 +1,122 @@
> ++/* SPDX-License-Identifier: GPL-2.0+ */
> ++/*
> ++ * (C) Copyright 2020 ARM Limited
> ++ * (C) Copyright 2020 Linaro
> ++ * Rui Miguel Silva <rui.silva@linaro.org>
> ++ *
> ++ * Configuration for Cortex-A5 Designstart. Parts were derived from other ARM
> ++ * configurations.
> ++ */
> ++
> ++#ifndef __DESISGNSTART_CA5_H
> ++#define __DESISGNSTART_CA5_H
> ++
> ++#define CONFIG_SYS_INIT_SP_ADDR               (CONFIG_SYS_SDRAM_BASE + 0x03f00000)
> ++#define CONFIG_SKIP_LOWLEVEL_INIT
> ++
> ++/* Generic Timer Definitions */
> ++#define CONFIG_SYS_HZ_CLOCK   7500000
> ++#define CONFIG_SYS_HZ         1000
> ++#define COUNTER_FREQUENCY     CONFIG_SYS_HZ_CLOCK
> ++
> ++#ifdef CONFIG_DESIGNSTART_MEMORY_MAP_EXTENDED
> ++#define V2M_SRAM0             0x00010000
> ++#define V2M_SRAM1             0x02200000
> ++#define V2M_QSPI              0x0A800000
> ++#else
> ++#define V2M_SRAM0             0x00000000
> ++#define V2M_SRAM1             0x02000000
> ++#define V2M_QSPI              0x08000000
> ++#endif
> ++
> ++#define V2M_DEBUG             0x10000000
> ++#define V2M_BASE_PERIPH               0x1A000000
> ++#define V2M_A5_PERIPH         0x1C000000
> ++#define V2M_L2CC_PERIPH               0x1C010000
> ++
> ++#define V2M_MASTER_EXPANSION0 0x40000000
> ++#define V2M_MASTER_EXPANSION1 0x60000000
> ++
> ++#define V2M_BASE              0x80000000
> ++
> ++#define V2M_PERIPH_OFFSET(x)  (x << 16)
> ++
> ++#define V2M_SYSID             (V2M_BASE_PERIPH)
> ++#define V2M_SYCTL             (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(1))
> ++#define V2M_COUNTER_CTL               (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(2))
> ++#define V2M_COUNTER_READ      (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(3))
> ++#define V2M_TIMER_CTL         (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(4))
> ++#define V2M_TIMER0            (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(5))
> ++
> ++#define V2M_WATCHDOG_CTL      (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(16))
> ++#define V2M_WATCHDOG_REFRESH  (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(17))
> ++
> ++#define V2M_UART0             (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(32))
> ++#define V2M_UART1             (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(33))
> ++
> ++#define V2M_RTC                       (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(34))
> ++#define V2M_TRNG              (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(35))
> ++
> ++/* PL011 Serial Configuration */
> ++#define CONFIG_CONS_INDEX     0
> ++#define CONFIG_PL011_CLOCK    7500000
> ++
> ++/* Physical Memory Map */
> ++#define PHYS_SDRAM_1          (V2M_BASE)
> ++
> ++/* Top 16MB reserved for secure world use */
> ++#define DRAM_SEC_SIZE         0x01000000
> ++#define PHYS_SDRAM_1_SIZE     0x80000000 - DRAM_SEC_SIZE
> ++
> ++/* Size of malloc() pool */
> ++#define CONFIG_SYS_MALLOC_LEN (CONFIG_ENV_SIZE + (8 << 20))
> ++
> ++/* Miscellaneous configurable options */
> ++#define CONFIG_SYS_LOAD_ADDR  (V2M_BASE + 0x10000000)
> ++
> ++#define CONFIG_SYS_SDRAM_BASE PHYS_SDRAM_1
> ++
> ++#define CONFIG_SYS_MMIO_TIMER
> ++
> ++/* Enable memtest */
> ++#define CONFIG_SYS_MEMTEST_START      PHYS_SDRAM_1
> ++#define CONFIG_SYS_MEMTEST_END                (PHYS_SDRAM_1 + PHYS_SDRAM_1_SIZE)
> ++
> ++#define CONFIG_EXTRA_ENV_SETTINGS     \
> ++                              "kernel_name=Image\0"           \
> ++                              "kernel_addr=0x80F00000\0"      \
> ++                              "initrd_name=ramdisk.img\0"     \
> ++                              "initrd_addr=0x84000000\0"      \
> ++                              "fdt_name=devtree.dtb\0"        \
> ++                              "fdt_addr=0x83000000\0"         \
> ++                              "fdt_high=0xffffffff\0"         \
> ++                              "initrd_high=0xffffffff\0"
> ++
> ++#define CONFIG_BOOTCOMMAND    "echo copy to RAM...; " \
> ++                              "cp.b 0x80100000 $kernel_addr 0xB00000; " \
> ++                              "cp.b 0x80D00000 $initrd_addr 0x800000; " \
> ++                              "bootz $kernel_addr $initrd_addr $fdt_addr"
> ++
> ++/* Monitor Command Prompt */
> ++#define CONFIG_SYS_CBSIZE             512     /* Console I/O Buffer Size */
> ++#define CONFIG_SYS_MAXARGS            64      /* max command args */
> ++
> ++#define CONFIG_SYS_FLASH_BASE         0x80000000
> ++/* 256 x 256KiB sectors */
> ++#define CONFIG_SYS_MAX_FLASH_SECT     256
> ++/* Store environment at top of flash */
> ++#define CONFIG_ENV_ADDR                       0x0A7C0000
> ++#define CONFIG_ENV_SECT_SIZE          0x00040000
> ++
> ++#define CONFIG_SYS_FLASH_CFI          1
> ++#define CONFIG_FLASH_CFI_DRIVER               1
> ++#define CONFIG_SYS_FLASH_CFI_WIDTH    FLASH_CFI_32BIT
> ++#define CONFIG_SYS_MAX_FLASH_BANKS    1
> ++
> ++#define CONFIG_SYS_FLASH_USE_BUFFER_WRITE /* use buffered writes */
> ++#define CONFIG_SYS_FLASH_PROTECTION   /* The devices have real protection */
> ++#define CONFIG_SYS_FLASH_EMPTY_INFO   /* flinfo indicates empty blocks */
> ++#define FLASH_MAX_SECTOR_SIZE         0x00040000
> ++#define CONFIG_ENV_SIZE                       CONFIG_ENV_SECT_SIZE
> ++#define CONFIG_ENV_IS_IN_FLASH                1
> ++#endif
> +-- 
> +2.17.1
> +
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0003-arm-Add-corstone700-platform.patch b/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0003-arm-Add-corstone700-platform.patch
> new file mode 100644
> index 0000000..8e4817d
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0003-arm-Add-corstone700-platform.patch
> @@ -0,0 +1,301 @@
> +Upstream-Status: Pending [Not submitted to upstream yet]
> +Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> +
> +From e480b0327de3bdab378d2c8c7117f409f29bf74b Mon Sep 17 00:00:00 2001
> +From: Rui Silva <rui.silva@linaro.org>
> +Date: Wed, 5 Aug 2020 19:01:29 +0100
> +Subject: [PATCH 3/6] arm: Add corstone700 platform
> +
> +Add support to the new Arm corstone700 platform family.
> +
> +Make some adjustments to the mmio timer and to the cortex-a5
> +designstart platform to share as much as possible between this
> +platforms.
> +
> +Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> +---
> + arch/arm/Kconfig                       |  7 +++
> + arch/arm/cpu/armv7/mmio_timer.c        |  4 +-
> + board/armltd/corstone700/Kconfig       | 12 ++++
> + board/armltd/corstone700/Makefile      |  8 +++
> + board/armltd/corstone700/corstone700.c | 49 ++++++++++++++++
> + configs/corstone700_defconfig          | 37 ++++++++++++
> + include/configs/corstone700.h          | 78 ++++++++++++++++++++++++++
> + include/configs/designstart_ca5.h      |  2 +-
> + 8 files changed, 194 insertions(+), 3 deletions(-)
> + create mode 100644 board/armltd/corstone700/Kconfig
> + create mode 100644 board/armltd/corstone700/Makefile
> + create mode 100644 board/armltd/corstone700/corstone700.c
> + create mode 100644 configs/corstone700_defconfig
> + create mode 100644 include/configs/corstone700.h
> +
> +diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> +index ed7ee146ac..84b79d79b9 100644
> +--- a/arch/arm/Kconfig
> ++++ b/arch/arm/Kconfig
> +@@ -636,6 +636,12 @@ config ARCH_BCM6858
> + 	select OF_CONTROL
> + 	imply CMD_DM
> + 
> ++config TARGET_CORSTONE700
> ++	bool "Support Corstone700"
> ++	select CPU_V7A
> ++	select SEMIHOSTING
> ++	select PL01X_SERIAL
> ++
> + config TARGET_DESIGNSTART_CA5
> +       bool "Support Designstart Cortex-A5"
> +       select CPU_V7A
> +@@ -1827,6 +1833,7 @@ source "board/armadeus/apf27/Kconfig"
> + source "board/armltd/vexpress/Kconfig"
> + source "board/armltd/vexpress64/Kconfig"
> + source "board/armltd/designstart/Kconfig"
> ++source "board/armltd/corstone700/Kconfig"
> + source "board/cortina/presidio-asic/Kconfig"
> + source "board/broadcom/bcm23550_w1d/Kconfig"
> + source "board/broadcom/bcm28155_ap/Kconfig"
> +diff --git a/arch/arm/cpu/armv7/mmio_timer.c b/arch/arm/cpu/armv7/mmio_timer.c
> +index 5d6f661723..a81e28c41a 100644
> +--- a/arch/arm/cpu/armv7/mmio_timer.c
> ++++ b/arch/arm/cpu/armv7/mmio_timer.c
> +@@ -11,8 +11,8 @@
> + 
> + DECLARE_GLOBAL_DATA_PTR;
> + 
> +-#define CNTCTLBASE    0x1a020000UL
> +-#define CNTREADBASE   0x1a030000UL
> ++#define CNTCTLBASE	V2M_COUNTER_CTL
> ++#define CNTREADBASE	V2M_COUNTER_READ
> + 
> + static inline uint32_t mmio_read32(uintptr_t addr)
> + {
> +diff --git a/board/armltd/corstone700/Kconfig b/board/armltd/corstone700/Kconfig
> +new file mode 100644
> +index 0000000000..ae625d96ad
> +--- /dev/null
> ++++ b/board/armltd/corstone700/Kconfig
> +@@ -0,0 +1,12 @@
> ++if TARGET_CORSTONE700
> ++
> ++config SYS_BOARD
> ++	default "corstone700"
> ++
> ++config SYS_VENDOR
> ++	default "armltd"
> ++
> ++config SYS_CONFIG_NAME
> ++	default "corstone700"
> ++
> ++endif
> +diff --git a/board/armltd/corstone700/Makefile b/board/armltd/corstone700/Makefile
> +new file mode 100644
> +index 0000000000..4f38135612
> +--- /dev/null
> ++++ b/board/armltd/corstone700/Makefile
> +@@ -0,0 +1,8 @@
> ++# SPDX-License-Identifier: GPL-2.0+
> ++#
> ++# (C) Copyright 2020 ARM Limited
> ++# (C) Copyright 2020 Linaro
> ++# Rui Miguel Silva <rui.silva@linaro.org>
> ++#
> ++
> ++obj-y	:= corstone700.o
> +diff --git a/board/armltd/corstone700/corstone700.c b/board/armltd/corstone700/corstone700.c
> +new file mode 100644
> +index 0000000000..b6f3e660a8
> +--- /dev/null
> ++++ b/board/armltd/corstone700/corstone700.c
> +@@ -0,0 +1,49 @@
> ++// SPDX-License-Identifier: GPL-2.0+
> ++/*
> ++ * (C) Copyright 2020 ARM Limited
> ++ * (C) Copyright 2020 Linaro
> ++ * Rui Miguel Silva <rui.silva@linaro.org>
> ++ */
> ++
> ++#include <common.h>
> ++#include <dm.h>
> ++#include <dm/platform_data/serial_pl01x.h>
> ++#include <malloc.h>
> ++
> ++DECLARE_GLOBAL_DATA_PTR;
> ++
> ++static const struct pl01x_serial_platdata serial_platdata = {
> ++	.base = V2M_UART0,
> ++	.type = TYPE_PL011,
> ++	.clock = CONFIG_PL011_CLOCK,
> ++};
> ++
> ++U_BOOT_DEVICE(corstone700_serials) = {
> ++	.name = "serial_pl01x",
> ++	.platdata = &serial_platdata,
> ++};
> ++
> ++int board_init(void)
> ++{
> ++	return 0;
> ++}
> ++
> ++int dram_init(void)
> ++{
> ++	gd->ram_size = PHYS_SDRAM_1_SIZE;
> ++
> ++	return 0;
> ++}
> ++
> ++int dram_init_banksize(void)
> ++{
> ++	gd->bd->bi_dram[0].start = PHYS_SDRAM_1;
> ++	gd->bd->bi_dram[0].size = PHYS_SDRAM_1_SIZE;
> ++
> ++	return 0;
> ++}
> ++
> ++void reset_cpu(ulong addr)
> ++{
> ++}
> ++
> +diff --git a/configs/corstone700_defconfig b/configs/corstone700_defconfig
> +new file mode 100644
> +index 0000000000..ee29a1eabf
> +--- /dev/null
> ++++ b/configs/corstone700_defconfig
> +@@ -0,0 +1,37 @@
> ++CONFIG_ARM=y
> ++CONFIG_ARM64_SUPPORT_AARCH32=y
> ++CONFIG_TARGET_CORSTONE700=y
> ++CONFIG_SYS_TEXT_BASE=0x02100000
> ++CONFIG_SYS_MALLOC_F_LEN=0x2000
> ++CONFIG_NR_DRAM_BANKS=1
> ++CONFIG_IDENT_STRING=" corstone700 aarch32"
> ++CONFIG_BOOTDELAY=3
> ++CONFIG_USE_BOOTARGS=y
> ++CONFIG_BOOTARGS="console=ttyAMA0 loglevel=9"
> ++# CONFIG_DISPLAY_CPUINFO is not set
> ++# CONFIG_DISPLAY_BOARDINFO is not set
> ++CONFIG_HUSH_PARSER=y
> ++CONFIG_SYS_PROMPT="corstone700# "
> ++# CONFIG_CMD_CONSOLE is not set
> ++CONFIG_CMD_BOOTZ=y
> ++CONFIG_CMD_BOOTM=y
> ++# CONFIG_CMD_XIMG is not set
> ++# CONFIG_CMD_EDITENV is not set
> ++# CONFIG_CMD_ENV_EXISTS is not set
> ++# CONFIG_CMD_ARMFLASH=y
> ++# CONFIG_CMD_LOADS is not set
> ++# CONFIG_CMD_ITEST is not set
> ++# CONFIG_CMD_SETEXPR is not set
> ++CONFIG_CMD_DHCP=y
> ++# CONFIG_CMD_NFS is not set
> ++CONFIG_CMD_MII=y
> ++CONFIG_CMD_PING=y
> ++CONFIG_CMD_CACHE=y
> ++# CONFIG_CMD_MISC is not set
> ++CONFIG_CMD_FAT=y
> ++CONFIG_DM=y
> ++# CONFIG_MMC is not set
> ++# CONFIG_MTD_NOR_FLASH=y
> ++CONFIG_DM_ETH=y
> ++CONFIG_DM_SERIAL=y
> ++CONFIG_OF_LIBFDT=y
> +diff --git a/include/configs/corstone700.h b/include/configs/corstone700.h
> +new file mode 100644
> +index 0000000000..32238e4057
> +--- /dev/null
> ++++ b/include/configs/corstone700.h
> +@@ -0,0 +1,78 @@
> ++/* SPDX-License-Identifier: GPL-2.0+ */
> ++/*
> ++ * (C) Copyright 2020 ARM Limited
> ++ * (C) Copyright 2020 Linaro
> ++ * Rui Miguel Silva <rui.silva@linaro.org>
> ++ *
> ++ * Configuration for Corstone700. Parts were derived from other ARM
> ++ * configurations.
> ++ */
> ++
> ++#ifndef __CORSTONE700_H
> ++#define __CORSTONE700_H
> ++
> ++#define CONFIG_SYS_INIT_SP_ADDR		(CONFIG_SYS_SDRAM_BASE + 0x03f00000)
> ++#define CONFIG_SKIP_LOWLEVEL_INIT
> ++
> ++#define CONFIG_SYS_HZ_CLOCK	320000000
> ++#define CONFIG_SYS_HZ		1000
> ++
> ++#define V2M_SRAM0		0x02000000
> ++#define V2M_QSPI		0x08000000
> ++
> ++#define V2M_DEBUG		0x10000000
> ++#define V2M_BASE_PERIPH		0x1A000000
> ++
> ++#define V2M_BASE		0x80000000
> ++
> ++#define V2M_PERIPH_OFFSET(x)	(x << 16)
> ++
> ++#define V2M_SYSID		(V2M_BASE_PERIPH)
> ++#define V2M_SYSCTL		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(1))
> ++
> ++#define V2M_COUNTER_CTL		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(32))
> ++#define V2M_COUNTER_READ	(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(33))
> ++
> ++#define V2M_TIMER_CTL		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(34))
> ++#define V2M_TIMER_BASE0		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(35))
> ++
> ++#define V2M_UART0		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(81))
> ++#define V2M_UART1		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(82))
> ++
> ++#define CONFIG_SYS_MMIO_TIMER
> ++
> ++#define CONFIG_PL011_CLOCK	32000000
> ++
> ++/* Physical Memory Map */
> ++#define PHYS_SDRAM_1		(V2M_BASE)
> ++#define PHYS_SDRAM_2		(V2M_QSPI)
> ++
> ++/* Top 16MB reserved for secure world use (maybe not needed) */
> ++#define DRAM_SEC_SIZE		0x01000000
> ++#define PHYS_SDRAM_1_SIZE	0x80000000 - DRAM_SEC_SIZE
> ++
> ++#define PHYS_SDRAM_2_SIZE	0x02000000
> ++
> ++/* Size of malloc() pool */
> ++#define CONFIG_SYS_MALLOC_LEN	(CONFIG_ENV_SIZE + (8 << 20))
> ++
> ++/* Miscellaneous configurable options */
> ++#define CONFIG_SYS_LOAD_ADDR	(V2M_BASE + 0x10000000)
> ++
> ++#define CONFIG_SYS_SDRAM_BASE	PHYS_SDRAM_1
> ++
> ++/* Monitor Command Prompt */
> ++#define CONFIG_SYS_CBSIZE		512	/* Console I/O Buffer Size */
> ++#define CONFIG_SYS_MAXARGS		64	/* max command args */
> ++
> ++#define CONFIG_EXTRA_ENV_SETTINGS	\
> ++				"kernel_name=zImage\0"		\
> ++				"kernel_addr_r=0x80000000\0"	\
> ++				"fdt_name=devtree.dtb\0"	\
> ++				"fdt_addr_r=0x82000000\0"		\
> ++				"fdt_high=0xffffffff\0"
> ++
> ++#define CONFIG_BOOTCOMMAND	"echo Booting Kernel...;" \
> ++				"bootz $kernel_addr_r - $fdt_addr_r"
> ++
> ++#endif
> +diff --git a/include/configs/designstart_ca5.h b/include/configs/designstart_ca5.h
> +index 6db5b1cf4a..9837ba0cd0 100644
> +--- a/include/configs/designstart_ca5.h
> ++++ b/include/configs/designstart_ca5.h
> +@@ -42,7 +42,7 @@
> + #define V2M_PERIPH_OFFSET(x)  (x << 16)
> + 
> + #define V2M_SYSID             (V2M_BASE_PERIPH)
> +-#define V2M_SYCTL             (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(1))
> ++#define V2M_SYSCTL            (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(1))
> + #define V2M_COUNTER_CTL               (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(2))
> + #define V2M_COUNTER_READ      (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(3))
> + #define V2M_TIMER_CTL         (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(4))
> +-- 
> +2.17.1
> +
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0004-boot-add-bootx-command-to-start-XiP-images.patch b/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0004-boot-add-bootx-command-to-start-XiP-images.patch
> new file mode 100644
> index 0000000..bc27f66
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0004-boot-add-bootx-command-to-start-XiP-images.patch
> @@ -0,0 +1,136 @@
> +Upstream-Status: Pending [Not submitted to upstream yet]
> +Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> +
> +From 42d975e5be4435799fb2cf2af48b4dd90aa637f0 Mon Sep 17 00:00:00 2001
> +From: Rui Silva <rui.silva@linaro.org>
> +Date: Wed, 5 Aug 2020 19:03:30 +0100
> +Subject: [PATCH 4/6] boot: add bootx command to start XiP images
> +
> +Add boot command that will jump to xip kernel entries.
> +
> +Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> +---
> + cmd/Kconfig                   |  8 ++++-
> + cmd/Makefile                  |  1 +
> + cmd/bootx.c                   | 58 +++++++++++++++++++++++++++++++++++
> + configs/corstone700_defconfig |  1 +
> + 4 files changed, 67 insertions(+), 1 deletion(-)
> + create mode 100644 cmd/bootx.c
> +
> +diff --git a/cmd/Kconfig b/cmd/Kconfig
> +index 6403bc45a5..c974f6b33d 100644
> +--- a/cmd/Kconfig
> ++++ b/cmd/Kconfig
> +@@ -285,6 +285,12 @@ config CMD_BOOTZ
> + 	help
> + 	  Boot the Linux zImage
> + 
> ++config CMD_BOOTX
> ++	bool "Support booting XiP Kernel Image"
> ++	default y
> ++	help
> ++	  The bootx command is used to boot an XIP kernel.
> ++
> + config CMD_BOOTI
> + 	bool "booti"
> + 	depends on ARM64 || RISCV
> +@@ -294,7 +300,7 @@ config CMD_BOOTI
> + 
> + config BOOTM_LINUX
> + 	bool "Support booting Linux OS images"
> +-	depends on CMD_BOOTM || CMD_BOOTZ || CMD_BOOTI
> ++	depends on CMD_BOOTM || CMD_BOOTZ || CMD_BOOTI || CMD_BOOTX
> + 	default y
> + 	help
> + 	  Support booting the Linux kernel directly via a command such as bootm
> +diff --git a/cmd/Makefile b/cmd/Makefile
> +index f1dd513a4b..ce75b6112c 100644
> +--- a/cmd/Makefile
> ++++ b/cmd/Makefile
> +@@ -28,6 +28,7 @@ obj-$(CONFIG_CMD_BOOTCOUNT) += bootcount.o
> + obj-$(CONFIG_CMD_BOOTEFI) += bootefi.o
> + obj-$(CONFIG_CMD_BOOTMENU) += bootmenu.o
> + obj-$(CONFIG_CMD_BOOTSTAGE) += bootstage.o
> ++obj-$(CONFIG_CMD_BOOTX) += bootx.o
> + obj-$(CONFIG_CMD_BOOTZ) += bootz.o
> + obj-$(CONFIG_CMD_BOOTI) += booti.o
> + obj-$(CONFIG_CMD_BTRFS) += btrfs.o
> +diff --git a/cmd/bootx.c b/cmd/bootx.c
> +new file mode 100644
> +index 0000000000..b6e06eab3f
> +--- /dev/null
> ++++ b/cmd/bootx.c
> +@@ -0,0 +1,58 @@
> ++/*
> ++ * Copyright (C) 2017 Renesas Electronics
> ++ * Copyright (C) 2017 Chris Brandt
> ++ *
> ++ * SPDX-License-Identifier:	GPL-2.0+
> ++ */
> ++
> ++ #include <common.h>
> ++
> ++/* XIP Kernel boot */
> ++int do_bootx(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[])
> ++{
> ++	ulong machid = 0xFFFFFFFF;	/* Device Tree Boot */
> ++	void (*kernel_entry)(int zero, int arch, uint params);
> ++	ulong r2;
> ++	ulong img_addr;
> ++	char *endp;
> ++
> ++	/* need at least two arguments */
> ++	if (argc < 2)
> ++		goto usage;
> ++
> ++	img_addr = simple_strtoul(argv[1], &endp, 16);
> ++	kernel_entry = (void (*)(int, int, uint))img_addr;
> ++
> ++#ifdef CONFIG_USB_DEVICE
> ++	udc_disconnect();
> ++#endif
> ++	cleanup_before_linux();
> ++
> ++	r2 = simple_strtoul(argv[2], NULL, 16);
> ++
> ++	/* The kernel expects the following when booting:
> ++	 *  r0 - 0
> ++	 *  r1 - machine type
> ++	 *  r2 - boot data (atags/dt) pointer
> ++	 *
> ++	 * For more info, refer to:
> ++	 *  https://www.kernel.org/doc/Documentation/arm/Booting
> ++	 */
> ++
> ++	printf("Booting Linux...\n");
> ++
> ++	kernel_entry(0, machid, r2);
> ++
> ++	return 0;
> ++
> ++usage:
> ++	return CMD_RET_USAGE;
> ++}
> ++static char bootx_help_text[] =
> ++	"x_addr dt_addr\n    - boot XIP kernel in Flash\n"
> ++	"\t x_addr: Address of XIP kernel in Flash\n"
> ++	"\tdt_addr: Address of Device Tree blob image";
> ++U_BOOT_CMD(
> ++	bootx,	CONFIG_SYS_MAXARGS,	1,	do_bootx,
> ++	"boot XIP kernel in Flash", bootx_help_text
> ++)
> +diff --git a/configs/corstone700_defconfig b/configs/corstone700_defconfig
> +index ee29a1eabf..655af3f058 100644
> +--- a/configs/corstone700_defconfig
> ++++ b/configs/corstone700_defconfig
> +@@ -14,6 +14,7 @@ CONFIG_HUSH_PARSER=y
> + CONFIG_SYS_PROMPT="corstone700# "
> + # CONFIG_CMD_CONSOLE is not set
> + CONFIG_CMD_BOOTZ=y
> ++CONFIG_CMD_BOOTX=y
> + CONFIG_CMD_BOOTM=y
> + # CONFIG_CMD_XIMG is not set
> + # CONFIG_CMD_EDITENV is not set
> +-- 
> +2.17.1
> +
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0005-boot-starting-the-XIP-kernel-using-bootx-command.patch b/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0005-boot-starting-the-XIP-kernel-using-bootx-command.patch
> new file mode 100644
> index 0000000..6b735ae
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0005-boot-starting-the-XIP-kernel-using-bootx-command.patch
> @@ -0,0 +1,39 @@
> +Upstream-Status: Pending [Not submitted to upstream yet]
> +Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> +
> +From 9f4e54e2bc619124602584e0ec8e268ac6f6221e Mon Sep 17 00:00:00 2001
> +From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> +Date: Wed, 5 Aug 2020 19:05:08 +0100
> +Subject: [PATCH 5/6] boot: starting the XIP kernel using bootx command
> +
> +bootx command is used as the default command to
> +start the XIP kernel
> +
> +Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> +---
> + include/configs/corstone700.h | 7 +++----
> + 1 file changed, 3 insertions(+), 4 deletions(-)
> +
> +diff --git a/include/configs/corstone700.h b/include/configs/corstone700.h
> +index 32238e4057..cb9ca8af8e 100644
> +--- a/include/configs/corstone700.h
> ++++ b/include/configs/corstone700.h
> +@@ -67,12 +67,11 @@
> + 
> + #define CONFIG_EXTRA_ENV_SETTINGS	\
> + 				"kernel_name=zImage\0"		\
> +-				"kernel_addr_r=0x80000000\0"	\
> ++				"kernel_addr_r=0x08300000\0"	\
> + 				"fdt_name=devtree.dtb\0"	\
> +-				"fdt_addr_r=0x82000000\0"		\
> ++				"fdt_addr_r=0x80400000\0"	\
> + 				"fdt_high=0xffffffff\0"
> + 
> +-#define CONFIG_BOOTCOMMAND	"echo Booting Kernel...;" \
> +-				"bootz $kernel_addr_r - $fdt_addr_r"
> ++#define CONFIG_BOOTCOMMAND	"bootx $kernel_addr_r $fdt_addr_r"
> + 
> + #endif
> +-- 
> +2.17.1
> +
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0006-arm-enabling-the-arch_timer-driver.patch b/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0006-arm-enabling-the-arch_timer-driver.patch
> new file mode 100644
> index 0000000..719fa28
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0006-arm-enabling-the-arch_timer-driver.patch
> @@ -0,0 +1,61 @@
> +Upstream-Status: Pending [Not submitted to upstream yet]
> +Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> +
> +From a008f06b49a96dfd98943696ddc10134947fed91 Mon Sep 17 00:00:00 2001
> +From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> +Date: Wed, 5 Aug 2020 19:06:16 +0100
> +Subject: [PATCH 6/6] arm: enabling the arch_timer driver
> +
> +This patch disables the use of the mmio_timer driver
> +and enables the arch_timer driver.
> +
> +The mmio_timer tries a direct access to the Armv8-A CNTFRQ generic timer
> +frequency register through memory mapping. This can not be done because
> +this register is only accessible through memory mapping under a secure
> +mode only. u-boot runs in non secure Hypervisor mode. To read the counter
> +frequency u-boot should use the mrc instruction to read the CNTFRQ system
> +register.
> +
> +The arch_timer driver reads the CNTFRQ register using the mrc instruction.
> +
> +Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> +---
> + configs/corstone700_defconfig | 3 +++
> + include/configs/corstone700.h | 3 ---
> + 2 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/configs/corstone700_defconfig b/configs/corstone700_defconfig
> +index 655af3f058..58e03db044 100644
> +--- a/configs/corstone700_defconfig
> ++++ b/configs/corstone700_defconfig
> +@@ -36,3 +36,6 @@ CONFIG_DM=y
> + CONFIG_DM_ETH=y
> + CONFIG_DM_SERIAL=y
> + CONFIG_OF_LIBFDT=y
> ++# CONFIG_SYS_HZ_CLOCK is not set
> ++# CONFIG_SYS_MMIO_TIMER is not set
> ++CONFIG_SYS_ARCH_TIMER=y
> +diff --git a/include/configs/corstone700.h b/include/configs/corstone700.h
> +index cb9ca8af8e..0fb606f1ed 100644
> +--- a/include/configs/corstone700.h
> ++++ b/include/configs/corstone700.h
> +@@ -14,7 +14,6 @@
> + #define CONFIG_SYS_INIT_SP_ADDR		(CONFIG_SYS_SDRAM_BASE + 0x03f00000)
> + #define CONFIG_SKIP_LOWLEVEL_INIT
> + 
> +-#define CONFIG_SYS_HZ_CLOCK	320000000
> + #define CONFIG_SYS_HZ		1000
> + 
> + #define V2M_SRAM0		0x02000000
> +@@ -39,8 +38,6 @@
> + #define V2M_UART0		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(81))
> + #define V2M_UART1		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(82))
> + 
> +-#define CONFIG_SYS_MMIO_TIMER
> +-
> + #define CONFIG_PL011_CLOCK	32000000
> + 
> + /* Physical Memory Map */
> +-- 
> +2.17.1
> +
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> index 5ab505b..f2d23b5 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> @@ -35,3 +35,15 @@ SRC_URI_append_juno = " file://u-boot_vexpress_uenv.patch"
>  # Total Compute KMACHINE
>  #
>  SRC_URI_append_tc0 = " file://0001-Add-support-for-Total-Compute.patch"
> +
> +#
> +# Corstone700 KMACHINE
> +#
> +FILESEXTRAPATHS_prepend_corstone700 := "${THISDIR}/files/corstone700:"
> +
> +SRC_URI_append_corstone700 = " file://0001-armv7-add-mmio-timer.patch \
> +                               file://0002-board-arm-add-designstart-cortex-a5-board.patch \
> +                               file://0003-arm-Add-corstone700-platform.patch \
> +                               file://0004-boot-add-bootx-command-to-start-XiP-images.patch \
> +                               file://0005-boot-starting-the-XIP-kernel-using-bootx-command.patch \
> +                               file://0006-arm-enabling-the-arch_timer-driver.patch"
> diff --git a/meta-arm/recipes-bsp/u-boot/u-boot_2020.04.bb b/meta-arm/recipes-bsp/u-boot/u-boot_2020.04.bb
> new file mode 100644
> index 0000000..5fee543
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/u-boot/u-boot_2020.04.bb
> @@ -0,0 +1,26 @@
> +HOMEPAGE = "http://www.denx.de/wiki/U-Boot/WebHome"
> +DESCRIPTION = "U-Boot, a boot loader for Embedded boards based on PowerPC, \
> +ARM, MIPS and several other processors, which can be installed in a boot \
> +ROM and used to initialize and test the hardware or to download and run \
> +application code."
> +SECTION = "bootloaders"
> +DEPENDS += "flex-native bison-native"
> +
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://Licenses/README;md5=30503fd321432fc713238f582193b78e"
> +PE = "1"
> +
> +# We use the revision in order to avoid having to fetch it from the
> +# repo during parse
> +SRCREV = "36fec02b1f90b92cf51ec531564f9284eae27ab4"
> +
> +SRC_URI = "git://git.denx.de/u-boot.git \
> +          "
> +
> +S = "${WORKDIR}/git"
> +B = "${WORKDIR}/build"
> +do_configure[cleandirs] = "${B}"
> +
> +require recipes-bsp/u-boot/u-boot.inc
> +
> +DEPENDS += "bc-native dtc-native"
> -- 
> 2.17.1
> 

> 

