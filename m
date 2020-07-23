Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web12.4309.1595527689474353622
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Jul 2020 11:08:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=Eo0Vn3FM;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.68, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f68.google.com with SMTP id h18so2982622qvl.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 23 Jul 2020 11:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gmGmMiIcC4yL/OJJ2BVEfDemjTiRKv6oT0KfNrXqbm4=;
        b=Eo0Vn3FMd4VFeREVdEtX5TJeSFtDp2xsQ5buGSA1OA2YbUUqZtdM163H4b+XZGikAX
         OJo7Qa4x2d2ZryinzqCUxYfuDq8rJ3mQtF290mI4KvucT3vhxESzqZVlw5KARt7p9B1F
         jihwJxWfzqppzpWNJlutkBw+24Xn5RdnTLoxxUQIAa2hutL8VrfvitOL4TxefE0uwi9+
         XSLjgLdD2OwU5VcXINSmfraR3V6fvk6yo7G4tMBGR1HRNKT57TPXj6m2z5HAo9+mTFIV
         6ieNbn+BlTYbuWPCNNq+h+h2S9yfo8gTSgg5UCdns1kHrbKgiOwvrzl3gJLvjg3qe0LB
         6lHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gmGmMiIcC4yL/OJJ2BVEfDemjTiRKv6oT0KfNrXqbm4=;
        b=rV2e0SfxHhw3IsMxy9cjl7eF42e86Xu3JNNzZoqoncldAZuHneHD6rFPHyp5IJ6Buf
         uV3WpiDk0gE1zmcn6sxe4tm2+yy1KeiOwbwpC3GngqpGCM8eflGj+UT0/TTgqDj+AjnF
         KMJGKCehjZhJP0kRv76MtcTa9iKtmUuoTqCBdiCPjSAp9AtQTL7ehmGv0bLpcpdQhp5O
         2a76VJXC3NZyOqQ2oQgirSn6vE5wIawTK2qdh/Uqk1JnJjkWTaQ/gaJOGUFJeqym4HtF
         m3XwVyHtM0bLaNKoz7MDEVefXXuXtovqzUaNQVlRoaAO/QP4mWlnTdx14Zehnaw+cqGG
         1T/w==
X-Gm-Message-State: AOAM530KGfCnn4qY2sUgzLOtluploUiv3Sohtopbk/2cjkSy7QCEp8ZN
	5Yz26Ib7Na7UuyLOtH217AXpDw==
X-Google-Smtp-Source: ABdhPJxM4kVQoCJ03AIragpmq5kiCxPfTLCo0DROHH/eW4Gq90xuj43N3xuOfTTAKiR1xqblPbEtew==
X-Received: by 2002:ad4:4bb0:: with SMTP id i16mr6107312qvw.42.1595527688479;
        Thu, 23 Jul 2020 11:08:08 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:d1cc:f3f9:a2c1:7b9c])
        by smtp.gmail.com with ESMTPSA id w8sm3492756qka.52.2020.07.23.11.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 11:08:07 -0700 (PDT)
Date: Thu, 23 Jul 2020 14:08:06 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-bsp: Fix a5ds dunfell support
Message-ID: <20200723180805.GB19291@kudzu.us>
References: <20200722155250.27552-1-jon.mason@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200722155250.27552-1-jon.mason@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 22, 2020 at 11:52:50AM -0400, Jon Mason wrote:
> Commit 65d336c807bf updated the u-boot patches to work with newer
> u-boots, but broke dunfell support by them not cleanly applying on
> u-boot 2020.01.  To address this, take the original version of the
> patches and put them in a location that will uniquely apply to the
> dunfell version of u-boot.  Also, move the newer version of the
> patches to a place that will only apply for it.
> 
> Fixes: 65d336c807bf ("arm-bsp: u-boot: rebase a5ds patches")
> Change-Id: I993ee097de709aa51ff28a6b00b7b4330bebd1ff
> Signed-off-by: Jon Mason <jon.mason@arm.com>

Pulled into master.

Thanks,
Jon

> ---
>  .../a5ds/0001-armv7-add-mmio-timer.patch      | 105 ++++++
>  ...-arm-add-designstart-cortex-a5-board.patch | 309 ++++++++++++++++++
>  .../a5ds/0001-armv7-add-mmio-timer.patch      |   0
>  ...-arm-add-designstart-cortex-a5-board.patch |   0
>  4 files changed, 414 insertions(+)
>  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/a5ds/0001-armv7-add-mmio-timer.patch
>  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch
>  rename meta-arm-bsp/recipes-bsp/u-boot/{files => u-boot-2020.07}/a5ds/0001-armv7-add-mmio-timer.patch (100%)
>  rename meta-arm-bsp/recipes-bsp/u-boot/{files => u-boot-2020.07}/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch (100%)
> 
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/a5ds/0001-armv7-add-mmio-timer.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/a5ds/0001-armv7-add-mmio-timer.patch
> new file mode 100644
> index 0000000..fbf8a14
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/a5ds/0001-armv7-add-mmio-timer.patch
> @@ -0,0 +1,105 @@
> +From 8525c72c438b0aa66f1f38db37bd7aacf7e3ce34 Mon Sep 17 00:00:00 2001
> +From: Rui Miguel Silva <rui.silva@linaro.org>
> +Date: Wed, 18 Dec 2019 21:52:34 +0000
> +Subject: [PATCH 1/2] armv7: add mmio timer
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
> +index 8c955d0d5284..82af9c031277 100644
> +--- a/arch/arm/cpu/armv7/Makefile
> ++++ b/arch/arm/cpu/armv7/Makefile
> +@@ -28,6 +28,7 @@ obj-$(CONFIG_ARMV7_PSCI)     += psci.o psci-common.o
> + obj-$(CONFIG_IPROC) += iproc-common/
> + obj-$(CONFIG_KONA) += kona-common/
> + obj-$(CONFIG_SYS_ARCH_TIMER) += arch_timer.o
> ++obj-$(CONFIG_SYS_MMIO_TIMER) += mmio_timer.o
> +
> + ifneq (,$(filter s5pc1xx exynos,$(SOC)))
> + obj-y += s5p-common/
> +diff --git a/arch/arm/cpu/armv7/mmio_timer.c b/arch/arm/cpu/armv7/mmio_timer.c
> +new file mode 100644
> +index 000000000000..1b905db8bb19
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
> +index cf1808e051c8..8624714ae7a6 100644
> +--- a/scripts/config_whitelist.txt
> ++++ b/scripts/config_whitelist.txt
> +@@ -3138,6 +3138,7 @@ CONFIG_SYS_MMC_U_BOOT_DST
> + CONFIG_SYS_MMC_U_BOOT_OFFS
> + CONFIG_SYS_MMC_U_BOOT_SIZE
> + CONFIG_SYS_MMC_U_BOOT_START
> ++CONFIG_SYS_MMIO_TIMER
> + CONFIG_SYS_MONITOR_
> + CONFIG_SYS_MONITOR_BASE
> + CONFIG_SYS_MONITOR_BASE_EARLY
> +--
> +2.25.0
> +
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch
> new file mode 100644
> index 0000000..3c527ae
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch
> @@ -0,0 +1,309 @@
> +From 2417d0991f73ee2c83946fcac208a7d6894f4530 Mon Sep 17 00:00:00 2001
> +From: Rui Miguel Silva <rui.silva@linaro.org>
> +Date: Wed, 8 Jan 2020 09:48:11 +0000
> +Subject: [PATCH 2/2] board: arm: add designstart cortex-a5 board
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
> +index f9dab073ea14..2cc9413114de 100644
> +--- a/arch/arm/Kconfig
> ++++ b/arch/arm/Kconfig
> +@@ -628,6 +628,12 @@ config ARCH_BCM6858
> +       select OF_CONTROL
> +       imply CMD_DM
> +
> ++config TARGET_DESIGNSTART_CA5
> ++      bool "Support Designstart Cortex-A5"
> ++      select CPU_V7A
> ++      select SEMIHOSTING
> ++      select PL01X_SERIAL
> ++
> + config TARGET_VEXPRESS_CA15_TC2
> +       bool "Support vexpress_ca15_tc2"
> +       select CPU_V7A
> +@@ -1782,6 +1788,7 @@ source "board/Marvell/gplugd/Kconfig"
> + source "board/armadeus/apf27/Kconfig"
> + source "board/armltd/vexpress/Kconfig"
> + source "board/armltd/vexpress64/Kconfig"
> ++source "board/armltd/designstart/Kconfig"
> + source "board/broadcom/bcm23550_w1d/Kconfig"
> + source "board/broadcom/bcm28155_ap/Kconfig"
> + source "board/broadcom/bcm963158/Kconfig"
> +diff --git a/board/armltd/designstart/Kconfig b/board/armltd/designstart/Kconfig
> +new file mode 100644
> +index 000000000000..6446fe3f4492
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
> +index 000000000000..b64c905c7021
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
> +index 000000000000..b0400f110ce2
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
> +index 000000000000..a2a756740295
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
> +index 000000000000..79c4b36060d2
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
> +2.25.0
> +
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0001-armv7-add-mmio-timer.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/a5ds/0001-armv7-add-mmio-timer.patch
> similarity index 100%
> rename from meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0001-armv7-add-mmio-timer.patch
> rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/a5ds/0001-armv7-add-mmio-timer.patch
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch
> similarity index 100%
> rename from meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch
> rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch
> -- 
> 2.17.1
> 

> 

