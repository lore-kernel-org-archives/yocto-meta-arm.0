Return-Path: <rui.silva@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB93FC433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 21:19:44 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web12.968.1646687984110080476
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Mar 2022 13:19:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=XFnivoiJ;
 spf=pass (domain: linaro.org, ip: 209.85.218.48,
 mailfrom: rui.silva@linaro.org)
Received: by mail-ej1-f48.google.com with SMTP id hw13so34707292ejc.9
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Mar 2022 13:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B+u6KKZAik3dJkYLcryJyqCHPoQUa5NrjpT3cts9W3I=;
        b=XFnivoiJ3omCA6TCEsmeCuT8b87JgT/d0a6g5gytz72s9IDGao3MHYbhE5g2+iAkhp
         wWm5z3YHUYi9Bx0RmJed4rSXmaqrrcc4o1v3RCIK3t36VB8zlr1hq2dp6sM/TQR8nKSM
         rMWfQ8c87hRsWK4D9CrRYLtqEfjSPCHOAs/inJlgUqROzhWZJDgJagYPhubBOaDQFkGG
         /AuxM5bN8epjYU3PrE8noQ7doFgBB82psPlX7Zj/uIS3Tv9WfLo0Tdm6AhluQkz5com6
         b1qC+MfdNnGAAsJ8BYetjszazKRqYr/LTC9GaZhWc0nbmLdFWJXEeYYnqTiZ6ncd3hcq
         rMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B+u6KKZAik3dJkYLcryJyqCHPoQUa5NrjpT3cts9W3I=;
        b=jMPoi2bR1O6ezCPTAPquSta2d4q4msn/rnJdqTCTJa2m8z7TSaj91RuvfidjJwIdvF
         epA5quqE5M5C/DPEO63tCs7OqCoHDJHZtA7VaCxT8/a5IawxfSbQwenTYTHP95OkdOGr
         AJE4SOxvI95qT4yUgspNgau5Ui9ks6jLjiKpAyGPQKgl4MYbqGuMqmqyeFnaHD5vlKzJ
         x0cMhRD/9QrpD0T+U4J8/IC6uK5otYfRCS9NQIwY7m2SUOrtPgDbr2agJWRQ07yXUsCN
         dtQ5oZ/Rmb8JJFwxSWPjYVcDxgyI3Am9ETDODJf6H3cMupRNUSYDG8+74OscDyTdM7sd
         cBLw==
X-Gm-Message-State: AOAM5331CZQ5Dt5uNK0EOMNRa6X9WpZIPJzKPKUWuQs0j2jk66eHpCAA
	9evVcWPC27FsxW1afgREF3sEXB8QO4BVDA==
X-Google-Smtp-Source: 
 ABdhPJzipcBYDN41Oz3ek7XeTb2monhGs9SCcFBgg4YBvKh8Xb6PpAqHbraJawU3IIyETrJol+ieTw==
X-Received: by 2002:a17:907:7845:b0:6cd:f2f4:cf00 with SMTP id
 lb5-20020a170907784500b006cdf2f4cf00mr10285589ejc.388.1646687981831;
        Mon, 07 Mar 2022 13:19:41 -0800 (PST)
Received: from arch-thunder.local (a109-49-33-111.cpe.netcabo.pt.
 [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id
 q2-20020a170906144200b006ceb8723de9sm5050572ejc.120.2022.03.07.13.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 13:19:41 -0800 (PST)
From: Rui Miguel Silva <rui.silva@linaro.org>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 1/2] arm-bsp/corstone500: move to u-boot 2022.01
Date: Mon,  7 Mar 2022 21:19:30 +0000
Message-Id: <20220307211931.457610-2-rui.silva@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220307211931.457610-1-rui.silva@linaro.org>
References: <20220307211931.457610-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 07 Mar 2022 21:19:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3125

Update patches and recipes to bump u-boot version used in
corstone500 from 2020.07 to 2022.01.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 meta-arm-bsp/conf/machine/corstone500.conf    |   4 +-
 ...0002-board-arm-add-corstone500-board.patch | 312 ------------------
 ...ng-generic-timer-access-through-MMIO.patch |  67 ++--
 ...0002-board-arm-add-corstone500-board.patch | 305 +++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   7 +
 .../u-boot/u-boot_2020.07.bbappend            |   7 -
 6 files changed, 353 insertions(+), 349 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/corstone500/0002-board-arm-add-corstone500-board.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/{u-boot-2020.07 => u-boot}/corstone500/0001-armv7-adding-generic-timer-access-through-MMIO.patch (64%)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0002-board-arm-add-corstone500-board.patch

diff --git a/meta-arm-bsp/conf/machine/corstone500.conf b/meta-arm-bsp/conf/machine/corstone500.conf
index 44e93288f75d..79afa1c1338c 100644
--- a/meta-arm-bsp/conf/machine/corstone500.conf
+++ b/meta-arm-bsp/conf/machine/corstone500.conf
@@ -21,7 +21,7 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
 IMAGE_FSTYPES += "tar.bz2 cpio.gz"
 
 # Corstone-500 u-boot configuration
-UBOOT_MACHINE = "designstart_ca5_defconfig"
+UBOOT_MACHINE = "corstone500_defconfig"
 UBOOT_IMAGE_ENTRYPOINT = "0x84000000"
 UBOOT_IMAGE_LOADADDRESS = "0x84000000"
-PREFERRED_VERSION_u-boot ?= "2020.07"
+PREFERRED_VERSION_u-boot ?= "2022.01"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/corstone500/0002-board-arm-add-corstone500-board.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/corstone500/0002-board-arm-add-corstone500-board.patch
deleted file mode 100644
index 33e1b1552bb7..000000000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/corstone500/0002-board-arm-add-corstone500-board.patch
+++ /dev/null
@@ -1,312 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-
-From f58e263f575c0520926e4737694e11da31cb4886 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Wed, 8 Jan 2020 09:48:11 +0000
-Subject: [PATCH 2/2] board: arm: add designstart cortex-a5 board
-
-Arm added a new board, designstart, with a cortex-a5 chip, add the
-default configuration, initialization and makefile for this system.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- arch/arm/Kconfig                       |   7 ++
- board/armltd/designstart/Kconfig       |  12 +++
- board/armltd/designstart/Makefile      |   8 ++
- board/armltd/designstart/designstart.c |  49 ++++++++++
- configs/designstart_ca5_defconfig      |  37 ++++++++
- include/configs/designstart_ca5.h      | 122 +++++++++++++++++++++++++
- 6 files changed, 235 insertions(+)
- create mode 100644 board/armltd/designstart/Kconfig
- create mode 100644 board/armltd/designstart/Makefile
- create mode 100644 board/armltd/designstart/designstart.c
- create mode 100644 configs/designstart_ca5_defconfig
- create mode 100644 include/configs/designstart_ca5.h
-
-diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
-index 54d65f8488..7bc12f0b43 100644
---- a/arch/arm/Kconfig
-+++ b/arch/arm/Kconfig
-@@ -665,6 +665,12 @@ config ARCH_BCM6858
- 	select OF_CONTROL
- 	imply CMD_DM
- 
-+config TARGET_DESIGNSTART_CA5
-+	bool "Support Designstart Cortex-A5"
-+	select CPU_V7A
-+	select SEMIHOSTING
-+	select PL01X_SERIAL
-+
- config TARGET_VEXPRESS_CA15_TC2
- 	bool "Support vexpress_ca15_tc2"
- 	select CPU_V7A
-@@ -1866,6 +1872,7 @@ source "board/Marvell/gplugd/Kconfig"
- source "board/armadeus/apf27/Kconfig"
- source "board/armltd/vexpress/Kconfig"
- source "board/armltd/vexpress64/Kconfig"
-+source "board/armltd/designstart/Kconfig"
- source "board/cortina/presidio-asic/Kconfig"
- source "board/broadcom/bcm23550_w1d/Kconfig"
- source "board/broadcom/bcm28155_ap/Kconfig"
-diff --git a/board/armltd/designstart/Kconfig b/board/armltd/designstart/Kconfig
-new file mode 100644
-index 0000000000..a9564e8655
---- /dev/null
-+++ b/board/armltd/designstart/Kconfig
-@@ -0,0 +1,12 @@
-+if TARGET_DESIGNSTART_CA5
-+
-+config SYS_BOARD
-+      default "designstart"
-+
-+config SYS_VENDOR
-+      default "armltd"
-+
-+config SYS_CONFIG_NAME
-+      default "designstart_ca5"
-+
-+endif
-diff --git a/board/armltd/designstart/Makefile b/board/armltd/designstart/Makefile
-new file mode 100644
-index 0000000000..d2dc2b74ed
---- /dev/null
-+++ b/board/armltd/designstart/Makefile
-@@ -0,0 +1,8 @@
-+# SPDX-License-Identifier: GPL-2.0+
-+#
-+# (C) Copyright 2020 ARM Limited
-+# (C) Copyright 2020 Linaro
-+# Rui Miguel Silva <rui.silva@linaro.org>
-+#
-+
-+obj-y := designstart.o
-diff --git a/board/armltd/designstart/designstart.c b/board/armltd/designstart/designstart.c
-new file mode 100644
-index 0000000000..658057a003
---- /dev/null
-+++ b/board/armltd/designstart/designstart.c
-@@ -0,0 +1,49 @@
-+// SPDX-License-Identifier: GPL-2.0+
-+/*
-+ * (C) Copyright 2020 ARM Limited
-+ * (C) Copyright 2020 Linaro
-+ * Rui Miguel Silva <rui.silva@linaro.org>
-+ */
-+
-+#include <common.h>
-+#include <dm.h>
-+#include <dm/platform_data/serial_pl01x.h>
-+#include <malloc.h>
-+
-+DECLARE_GLOBAL_DATA_PTR;
-+
-+static const struct pl01x_serial_platdata serial_platdata = {
-+      .base = V2M_UART0,
-+      .type = TYPE_PL011,
-+      .clock = CONFIG_PL011_CLOCK,
-+};
-+
-+U_BOOT_DEVICE(designstart_serials) = {
-+      .name = "serial_pl01x",
-+      .platdata = &serial_platdata,
-+};
-+
-+int board_init(void)
-+{
-+      return 0;
-+}
-+
-+int dram_init(void)
-+{
-+      gd->ram_size = PHYS_SDRAM_1_SIZE;
-+
-+      return 0;
-+}
-+
-+int dram_init_banksize(void)
-+{
-+      gd->bd->bi_dram[0].start = PHYS_SDRAM_1;
-+      gd->bd->bi_dram[0].size = PHYS_SDRAM_1_SIZE;
-+
-+      return 0;
-+}
-+
-+void reset_cpu(ulong addr)
-+{
-+}
-+
-diff --git a/configs/designstart_ca5_defconfig b/configs/designstart_ca5_defconfig
-new file mode 100644
-index 0000000000..a2a7567402
---- /dev/null
-+++ b/configs/designstart_ca5_defconfig
-@@ -0,0 +1,37 @@
-+CONFIG_ARM=y
-+CONFIG_TARGET_DESIGNSTART_CA5=y
-+CONFIG_SYS_TEXT_BASE=0x88000000
-+CONFIG_SYS_MALLOC_F_LEN=0x2000
-+CONFIG_NR_DRAM_BANKS=1
-+CONFIG_IDENT_STRING=" ca5ds aarch32"
-+CONFIG_BOOTDELAY=1
-+CONFIG_USE_BOOTARGS=y
-+CONFIG_BOOTARGS="console=ttyAMA0 earlycon=pl011,0x1a200000 root=/dev/ram0 rw loglevel=9"
-+# CONFIG_DISPLAY_CPUINFO is not set
-+# CONFIG_DISPLAY_BOARDINFO is not set
-+CONFIG_HUSH_PARSER=y
-+CONFIG_SYS_PROMPT="ca5ds32# "
-+CONFIG_CMD_BOOTZ=y
-+# CONFIG_CMD_CONSOLE is not set
-+# CONFIG_CMD_IMLS is not set
-+# CONFIG_CMD_XIMG is not set
-+# CONFIG_CMD_EDITENV is not set
-+# CONFIG_CMD_ENV_EXISTS is not set
-+CONFIG_CMD_MEMTEST=y
-+CONFIG_MTD_NOR_FLASH=y
-+# CONFIG_CMD_LOADS is not set
-+CONFIG_CMD_ARMFLASH=y
-+# CONFIG_CMD_FPGA is not set
-+# CONFIG_CMD_ITEST is not set
-+# CONFIG_CMD_SETEXPR is not set
-+CONFIG_CMD_DHCP=y
-+# CONFIG_CMD_NFS is not set
-+CONFIG_CMD_MII=y
-+CONFIG_CMD_PING=y
-+CONFIG_CMD_CACHE=y
-+# CONFIG_CMD_MISC is not set
-+CONFIG_CMD_FAT=y
-+CONFIG_DM=y
-+CONFIG_DM_SERIAL=y
-+CONFIG_OF_LIBFDT=y
-+
-diff --git a/include/configs/designstart_ca5.h b/include/configs/designstart_ca5.h
-new file mode 100644
-index 0000000000..6db5b1cf4a
---- /dev/null
-+++ b/include/configs/designstart_ca5.h
-@@ -0,0 +1,122 @@
-+/* SPDX-License-Identifier: GPL-2.0+ */
-+/*
-+ * (C) Copyright 2020 ARM Limited
-+ * (C) Copyright 2020 Linaro
-+ * Rui Miguel Silva <rui.silva@linaro.org>
-+ *
-+ * Configuration for Cortex-A5 Designstart. Parts were derived from other ARM
-+ * configurations.
-+ */
-+
-+#ifndef __DESISGNSTART_CA5_H
-+#define __DESISGNSTART_CA5_H
-+
-+#define CONFIG_SYS_INIT_SP_ADDR               (CONFIG_SYS_SDRAM_BASE + 0x03f00000)
-+#define CONFIG_SKIP_LOWLEVEL_INIT
-+
-+/* Generic Timer Definitions */
-+#define CONFIG_SYS_HZ_CLOCK   7500000
-+#define CONFIG_SYS_HZ         1000
-+#define COUNTER_FREQUENCY     CONFIG_SYS_HZ_CLOCK
-+
-+#ifdef CONFIG_DESIGNSTART_MEMORY_MAP_EXTENDED
-+#define V2M_SRAM0             0x00010000
-+#define V2M_SRAM1             0x02200000
-+#define V2M_QSPI              0x0A800000
-+#else
-+#define V2M_SRAM0             0x00000000
-+#define V2M_SRAM1             0x02000000
-+#define V2M_QSPI              0x08000000
-+#endif
-+
-+#define V2M_DEBUG             0x10000000
-+#define V2M_BASE_PERIPH               0x1A000000
-+#define V2M_A5_PERIPH         0x1C000000
-+#define V2M_L2CC_PERIPH               0x1C010000
-+
-+#define V2M_MASTER_EXPANSION0 0x40000000
-+#define V2M_MASTER_EXPANSION1 0x60000000
-+
-+#define V2M_BASE              0x80000000
-+
-+#define V2M_PERIPH_OFFSET(x)  (x << 16)
-+
-+#define V2M_SYSID             (V2M_BASE_PERIPH)
-+#define V2M_SYCTL             (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(1))
-+#define V2M_COUNTER_CTL               (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(2))
-+#define V2M_COUNTER_READ      (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(3))
-+#define V2M_TIMER_CTL         (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(4))
-+#define V2M_TIMER0            (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(5))
-+
-+#define V2M_WATCHDOG_CTL      (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(16))
-+#define V2M_WATCHDOG_REFRESH  (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(17))
-+
-+#define V2M_UART0             (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(32))
-+#define V2M_UART1             (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(33))
-+
-+#define V2M_RTC                       (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(34))
-+#define V2M_TRNG              (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(35))
-+
-+/* PL011 Serial Configuration */
-+#define CONFIG_CONS_INDEX     0
-+#define CONFIG_PL011_CLOCK    7500000
-+
-+/* Physical Memory Map */
-+#define PHYS_SDRAM_1          (V2M_BASE)
-+
-+/* Top 16MB reserved for secure world use */
-+#define DRAM_SEC_SIZE         0x01000000
-+#define PHYS_SDRAM_1_SIZE     0x80000000 - DRAM_SEC_SIZE
-+
-+/* Size of malloc() pool */
-+#define CONFIG_SYS_MALLOC_LEN (CONFIG_ENV_SIZE + (8 << 20))
-+
-+/* Miscellaneous configurable options */
-+#define CONFIG_SYS_LOAD_ADDR  (V2M_BASE + 0x10000000)
-+
-+#define CONFIG_SYS_SDRAM_BASE PHYS_SDRAM_1
-+
-+#define CONFIG_SYS_MMIO_TIMER
-+
-+/* Enable memtest */
-+#define CONFIG_SYS_MEMTEST_START      PHYS_SDRAM_1
-+#define CONFIG_SYS_MEMTEST_END                (PHYS_SDRAM_1 + PHYS_SDRAM_1_SIZE)
-+
-+#define CONFIG_EXTRA_ENV_SETTINGS     \
-+                              "kernel_name=Image\0"           \
-+                              "kernel_addr=0x80F00000\0"      \
-+                              "initrd_name=ramdisk.img\0"     \
-+                              "initrd_addr=0x84000000\0"      \
-+                              "fdt_name=devtree.dtb\0"        \
-+                              "fdt_addr=0x83000000\0"         \
-+                              "fdt_high=0xffffffff\0"         \
-+                              "initrd_high=0xffffffff\0"
-+
-+#define CONFIG_BOOTCOMMAND    "echo copy to RAM...; " \
-+                              "cp.b 0x80100000 $kernel_addr 0xB00000; " \
-+                              "cp.b 0x80D00000 $initrd_addr 0x800000; " \
-+                              "bootz $kernel_addr $initrd_addr $fdt_addr"
-+
-+/* Monitor Command Prompt */
-+#define CONFIG_SYS_CBSIZE             512     /* Console I/O Buffer Size */
-+#define CONFIG_SYS_MAXARGS            64      /* max command args */
-+
-+#define CONFIG_SYS_FLASH_BASE         0x80000000
-+/* 256 x 256KiB sectors */
-+#define CONFIG_SYS_MAX_FLASH_SECT     256
-+/* Store environment at top of flash */
-+#define CONFIG_ENV_ADDR                       0x0A7C0000
-+#define CONFIG_ENV_SECT_SIZE          0x00040000
-+
-+#define CONFIG_SYS_FLASH_CFI          1
-+#define CONFIG_FLASH_CFI_DRIVER               1
-+#define CONFIG_SYS_FLASH_CFI_WIDTH    FLASH_CFI_32BIT
-+#define CONFIG_SYS_MAX_FLASH_BANKS    1
-+
-+#define CONFIG_SYS_FLASH_USE_BUFFER_WRITE /* use buffered writes */
-+#define CONFIG_SYS_FLASH_PROTECTION   /* The devices have real protection */
-+#define CONFIG_SYS_FLASH_EMPTY_INFO   /* flinfo indicates empty blocks */
-+#define FLASH_MAX_SECTOR_SIZE         0x00040000
-+#define CONFIG_ENV_SIZE                       CONFIG_ENV_SECT_SIZE
-+#define CONFIG_ENV_IS_IN_FLASH                1
-+#endif
--- 
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/corstone500/0001-armv7-adding-generic-timer-access-through-MMIO.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0001-armv7-adding-generic-timer-access-through-MMIO.patch
similarity index 64%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/corstone500/0001-armv7-adding-generic-timer-access-through-MMIO.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0001-armv7-adding-generic-timer-access-through-MMIO.patch
index 8ba35be8cf0a..79c812da0936 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/corstone500/0001-armv7-adding-generic-timer-access-through-MMIO.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0001-armv7-adding-generic-timer-access-through-MMIO.patch
@@ -1,10 +1,10 @@
 Upstream-Status: Pending [Not submitted to upstream yet]
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 
-From b6879fc62b5ec01e3c87c2772d3a5e0f51c35f1c Mon Sep 17 00:00:00 2001
+From 3d991cd405ecffec480c12689fc02670aeb5ec53 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Wed, 18 Dec 2019 21:52:34 +0000
-Subject: [PATCH] armv7: adding generic timer access through MMIO
+Subject: [PATCH 1/2] armv7: adding generic timer access through MMIO
 
 This driver enables the ARMv7 generic timer.
 
@@ -21,13 +21,13 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 ---
  arch/arm/cpu/armv7/Makefile     |  1 +
- arch/arm/cpu/armv7/mmio_timer.c | 64 +++++++++++++++++++++++++++++++++
+ arch/arm/cpu/armv7/mmio_timer.c | 75 +++++++++++++++++++++++++++++++++
  scripts/config_whitelist.txt    |  1 +
- 3 files changed, 66 insertions(+)
+ 3 files changed, 77 insertions(+)
  create mode 100644 arch/arm/cpu/armv7/mmio_timer.c
 
 diff --git a/arch/arm/cpu/armv7/Makefile b/arch/arm/cpu/armv7/Makefile
-index 8c955d0d52..82af9c0312 100644
+index bfbd85ae64ef..1a0a24e53110 100644
 --- a/arch/arm/cpu/armv7/Makefile
 +++ b/arch/arm/cpu/armv7/Makefile
 @@ -28,6 +28,7 @@ obj-$(CONFIG_ARMV7_PSCI)	+= psci.o psci-common.o
@@ -40,10 +40,10 @@ index 8c955d0d52..82af9c0312 100644
  obj-y += s5p-common/
 diff --git a/arch/arm/cpu/armv7/mmio_timer.c b/arch/arm/cpu/armv7/mmio_timer.c
 new file mode 100644
-index 0000000000..82ff3937b6
+index 000000000000..edd806e06e42
 --- /dev/null
 +++ b/arch/arm/cpu/armv7/mmio_timer.c
-@@ -0,0 +1,64 @@
+@@ -0,0 +1,75 @@
 +// SPDX-License-Identifier: GPL-2.0+
 +/*
 + * Copyright (c) 2019, Arm Limited. All rights reserved.
@@ -54,6 +54,7 @@ index 0000000000..82ff3937b6
 +#include <asm/io.h>
 +#include <div64.h>
 +#include <bootstage.h>
++#include <asm/global_data.h>
 +
 +DECLARE_GLOBAL_DATA_PTR;
 +
@@ -64,62 +65,72 @@ index 0000000000..82ff3937b6
 +
 +static inline uint32_t mmio_read32(uintptr_t addr)
 +{
-+      return *(volatile uint32_t*)addr;
++	return *(volatile uint32_t*)addr;
 +}
 +
 +static inline void mmio_write32(uintptr_t addr, uint32_t data)
 +{
-+      *(volatile uint32_t*)addr = data;
++	*(volatile uint32_t*)addr = data;
 +}
 +
 +int timer_init(void)
 +{
-+      gd->arch.timer_rate_hz = COUNTER_FREQUENCY / CONFIG_SYS_HZ; /* calculating the frequency in ms */
-+      mmio_write32(CNTCTLBASE + 0x20, COUNTER_FREQUENCY); /* configuring CNTFID0 register: setting the base frequency */
-+      mmio_write32(CNTCTLBASE, CNTFCREQ | CNTEN); /* configuring CNTCR register: enabling the generic counter and selecting the first frequency entry */
-+      return 0;
++	/* calculate the frequency in ms */
++	gd->arch.timer_rate_hz = COUNTER_FREQUENCY / CONFIG_SYS_HZ;
++
++	/* configure CNTFID0 register: set the base frequency */
++	mmio_write32(CNTCTLBASE + 0x20, COUNTER_FREQUENCY);
++
++	/*
++	 * configure CNTCR register:
++	 *    enable the generic counter and;
++	 *    select the first frequency entry
++	 */
++	mmio_write32(CNTCTLBASE, CNTFCREQ | CNTEN);
++
++	return 0;
 +}
 +
 +unsigned long long get_ticks(void)
 +{
-+      return ((mmio_read32(CNTREADBASE + 0x4) << 32) |
-+              mmio_read32(CNTREADBASE));
++	return (((u64)(mmio_read32(CNTREADBASE + 0x4)) << 32) |
++		mmio_read32(CNTREADBASE));
 +}
 +
 +ulong get_timer(ulong base)
 +{
-+      return lldiv(get_ticks(), gd->arch.timer_rate_hz) - base;
++	return lldiv(get_ticks(), gd->arch.timer_rate_hz) - base;
 +}
 +
 +void __udelay(unsigned long usec)
 +{
-+      unsigned long endtime;
++	unsigned long endtime;
 +
-+      endtime = lldiv((unsigned long long)usec * gd->arch.timer_rate_hz,
-+                      1000UL);
++	endtime = lldiv((unsigned long long)usec * gd->arch.timer_rate_hz,
++			1000UL);
 +
-+      endtime += get_ticks();
++	endtime += get_ticks();
 +
-+      while (get_ticks() < endtime)
-+              ;
++	while (get_ticks() < endtime)
++		;
 +}
 +
 +ulong get_tbclk(void)
 +{
-+      return gd->arch.timer_rate_hz;
++	return gd->arch.timer_rate_hz;
 +}
 diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
-index 916768f361..c8fd8c6e35 100644
+index b9c1c61e13dc..881cd0c51e78 100644
 --- a/scripts/config_whitelist.txt
 +++ b/scripts/config_whitelist.txt
-@@ -3075,6 +3075,7 @@ CONFIG_SYS_MMC_U_BOOT_DST
+@@ -2234,6 +2234,7 @@ CONFIG_SYS_MMC_U_BOOT_DST
  CONFIG_SYS_MMC_U_BOOT_OFFS
  CONFIG_SYS_MMC_U_BOOT_SIZE
  CONFIG_SYS_MMC_U_BOOT_START
 +CONFIG_SYS_MMIO_TIMER
- CONFIG_SYS_MONITOR_
  CONFIG_SYS_MONITOR_BASE
- CONFIG_SYS_MONITOR_BASE_EARLY
+ CONFIG_SYS_MONITOR_LEN
+ CONFIG_SYS_MONITOR_SEC
 -- 
-2.17.1
+2.35.1
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0002-board-arm-add-corstone500-board.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0002-board-arm-add-corstone500-board.patch
new file mode 100644
index 000000000000..b7a70a23de37
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0002-board-arm-add-corstone500-board.patch
@@ -0,0 +1,305 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+
+From 8f315a9be2dbd9b8da4715aaaf02fab93595ca9e Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Wed, 8 Jan 2020 09:48:11 +0000
+Subject: [PATCH 2/2] board: arm: add corstone500 board
+
+Add support for the Arm corstone500 platform, with a cortex-a5
+chip, add the default configuration, initialization and
+makefile for this system.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ arch/arm/Kconfig                       |  10 +++
+ board/armltd/corstone500/Kconfig       |  12 +++
+ board/armltd/corstone500/Makefile      |   8 ++
+ board/armltd/corstone500/corstone500.c |  48 +++++++++++
+ configs/corstone500_defconfig          |  40 +++++++++
+ include/configs/corstone500.h          | 109 +++++++++++++++++++++++++
+ 6 files changed, 227 insertions(+)
+ create mode 100644 board/armltd/corstone500/Kconfig
+ create mode 100644 board/armltd/corstone500/Makefile
+ create mode 100644 board/armltd/corstone500/corstone500.c
+ create mode 100644 configs/corstone500_defconfig
+ create mode 100644 include/configs/corstone500.h
+
+diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
+index f7f03837feb4..43249a043b5d 100644
+--- a/arch/arm/Kconfig
++++ b/arch/arm/Kconfig
+@@ -639,6 +639,15 @@ config ARCH_BCMSTB
+ 	  This enables support for Broadcom ARM-based set-top box
+ 	  chipsets, including the 7445 family of chips.
+ 
++config TARGET_CORSTONE500
++	bool "Support Corstone500"
++	select CPU_V7A
++	select SEMIHOSTING
++	select PL01X_SERIAL
++	help
++	  This enables support for Corstone500 ARM which is a
++	  Cortex-A5 system
++
+ config TARGET_VEXPRESS_CA9X4
+ 	bool "Support vexpress_ca9x4"
+ 	select CPU_V7A
+@@ -2156,6 +2165,7 @@ source "board/bosch/shc/Kconfig"
+ source "board/bosch/guardian/Kconfig"
+ source "board/Marvell/octeontx/Kconfig"
+ source "board/Marvell/octeontx2/Kconfig"
++source "board/armltd/corstone500/Kconfig"
+ source "board/armltd/vexpress/Kconfig"
+ source "board/armltd/vexpress64/Kconfig"
+ source "board/cortina/presidio-asic/Kconfig"
+diff --git a/board/armltd/corstone500/Kconfig b/board/armltd/corstone500/Kconfig
+new file mode 100644
+index 000000000000..8e689bd1fdc8
+--- /dev/null
++++ b/board/armltd/corstone500/Kconfig
+@@ -0,0 +1,12 @@
++if TARGET_CORSTONE500
++
++config SYS_BOARD
++	default "corstone500"
++
++config SYS_VENDOR
++	default "armltd"
++
++config SYS_CONFIG_NAME
++	default "corstone500"
++
++endif
+diff --git a/board/armltd/corstone500/Makefile b/board/armltd/corstone500/Makefile
+new file mode 100644
+index 000000000000..6598fdd3ae0d
+--- /dev/null
++++ b/board/armltd/corstone500/Makefile
+@@ -0,0 +1,8 @@
++# SPDX-License-Identifier: GPL-2.0+
++#
++# (C) Copyright 2022 ARM Limited
++# (C) Copyright 2022 Linaro
++# Rui Miguel Silva <rui.silva@linaro.org>
++#
++
++obj-y := corstone500.o
+diff --git a/board/armltd/corstone500/corstone500.c b/board/armltd/corstone500/corstone500.c
+new file mode 100644
+index 000000000000..e878f5c6a521
+--- /dev/null
++++ b/board/armltd/corstone500/corstone500.c
+@@ -0,0 +1,48 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * (C) Copyright 2022 ARM Limited
++ * (C) Copyright 2022 Linaro
++ * Rui Miguel Silva <rui.silva@linaro.org>
++ */
++
++#include <common.h>
++#include <dm.h>
++#include <dm/platform_data/serial_pl01x.h>
++#include <malloc.h>
++#include <asm/global_data.h>
++
++static const struct pl01x_serial_plat serial_platdata = {
++	.base = V2M_UART0,
++	.type = TYPE_PL011,
++	.clock = CONFIG_PL011_CLOCK,
++};
++
++U_BOOT_DRVINFO(corstone500_serials) = {
++	.name = "serial_pl01x",
++	.plat = &serial_platdata,
++};
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
++	return 0;
++}
++
++void reset_cpu(ulong addr)
++{
++}
++
+diff --git a/configs/corstone500_defconfig b/configs/corstone500_defconfig
+new file mode 100644
+index 000000000000..d3161a4b40d8
+--- /dev/null
++++ b/configs/corstone500_defconfig
+@@ -0,0 +1,40 @@
++CONFIG_ARM=y
++CONFIG_SKIP_LOWLEVEL_INIT=y
++CONFIG_TARGET_CORSTONE500=y
++CONFIG_SYS_TEXT_BASE=0x88000000
++CONFIG_SYS_MALLOC_LEN=0x840000
++CONFIG_SYS_MALLOC_F_LEN=0x2000
++CONFIG_NR_DRAM_BANKS=1
++CONFIG_SYS_MEMTEST_START=0x80000000
++CONFIG_SYS_MEMTEST_END=0xff000000
++CONFIG_ENV_SIZE=0x40000
++CONFIG_IDENT_STRING=" corstone500 aarch32"
++CONFIG_SYS_LOAD_ADDR=0x90000000
++CONFIG_SUPPORT_RAW_INITRD=y
++CONFIG_BOOTDELAY=1
++CONFIG_USE_BOOTARGS=y
++CONFIG_BOOTARGS="console=ttyAMA0 earlycon=pl011,0x1a200000 root=/dev/ram0 rw loglevel=9"
++# CONFIG_DISPLAY_CPUINFO is not set
++# CONFIG_DISPLAY_BOARDINFO is not set
++CONFIG_HUSH_PARSER=y
++CONFIG_SYS_PROMPT="corstone500# "
++# CONFIG_CMD_CONSOLE is not set
++CONFIG_CMD_BOOTZ=y
++# CONFIG_CMD_XIMG is not set
++# CONFIG_CMD_EDITENV is not set
++# CONFIG_CMD_ENV_EXISTS is not set
++CONFIG_CMD_MEMTEST=y
++CONFIG_CMD_ARMFLASH=y
++# CONFIG_CMD_LOADS is not set
++# CONFIG_CMD_ITEST is not set
++# CONFIG_CMD_SETEXPR is not set
++CONFIG_CMD_DHCP=y
++# CONFIG_CMD_NFS is not set
++CONFIG_CMD_MII=y
++CONFIG_CMD_PING=y
++CONFIG_CMD_CACHE=y
++CONFIG_CMD_FAT=y
++CONFIG_DM=y
++CONFIG_MTD_NOR_FLASH=y
++CONFIG_DM_SERIAL=y
++CONFIG_OF_LIBFDT=y
+diff --git a/include/configs/corstone500.h b/include/configs/corstone500.h
+new file mode 100644
+index 000000000000..93c397d2f515
+--- /dev/null
++++ b/include/configs/corstone500.h
+@@ -0,0 +1,109 @@
++/* SPDX-License-Identifier: GPL-2.0+ */
++/*
++ * (C) Copyright 2022 ARM Limited
++ * (C) Copyright 2022 Linaro
++ * Rui Miguel Silva <rui.silva@linaro.org>
++ *
++ * Configuration for Cortex-A5 Corstone500. Parts were derived from other ARM
++ * configurations.
++ */
++
++#ifndef __CORSTONE500_H
++#define __CORSTONE500_H
++
++#define CONFIG_SYS_INIT_SP_ADDR		(CONFIG_SYS_SDRAM_BASE + 0x03f00000)
++
++/* Generic Timer Definitions */
++#define CONFIG_SYS_HZ_CLOCK	7500000
++#define CONFIG_SYS_HZ		1000
++#define COUNTER_FREQUENCY	CONFIG_SYS_HZ_CLOCK
++
++#ifdef CONFIG_CORSTONE500_MEMORY_MAP_EXTENDED
++#define V2M_SRAM0		0x00010000
++#define V2M_SRAM1		0x02200000
++#define V2M_QSPI		0x0a800000
++#else
++#define V2M_SRAM0		0x00000000
++#define V2M_SRAM1		0x02000000
++#define V2M_QSPI		0x08000000
++#endif
++
++#define V2M_DEBUG		0x10000000
++#define V2M_BASE_PERIPH		0x1a000000
++#define V2M_A5_PERIPH		0x1c000000
++#define V2M_L2CC_PERIPH		0x1c010000
++
++#define V2M_MASTER_EXPANSION0	0x40000000
++#define V2M_MASTER_EXPANSION1	0x60000000
++
++#define V2M_BASE		0x80000000
++
++#define V2M_PERIPH_OFFSET(x)  (x << 16)
++
++#define V2M_SYSID		(V2M_BASE_PERIPH)
++#define V2M_SYCTL		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(1))
++#define V2M_COUNTER_CTL		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(2))
++#define V2M_COUNTER_READ	(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(3))
++#define V2M_TIMER_CTL		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(4))
++#define V2M_TIMER0		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(5))
++
++#define V2M_WATCHDOG_CTL	(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(16))
++#define V2M_WATCHDOG_REFRESH	(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(17))
++
++#define V2M_UART0		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(32))
++#define V2M_UART1		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(33))
++
++#define V2M_RTC			(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(34))
++#define V2M_TRNG		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(35))
++
++/* PL011 Serial Configuration */
++#define CONFIG_CONS_INDEX	0
++#define CONFIG_PL011_CLOCK	7500000
++
++/* Physical Memory Map */
++#define PHYS_SDRAM_1		(V2M_BASE)
++
++/* Top 16MB reserved for secure world use */
++#define DRAM_SEC_SIZE		0x01000000
++#define PHYS_SDRAM_1_SIZE	(0x80000000 - DRAM_SEC_SIZE)
++
++/* Miscellaneous configurable options */
++#define CONFIG_SYS_SDRAM_BASE	PHYS_SDRAM_1
++
++#define CONFIG_SYS_MMIO_TIMER
++
++#define CONFIG_EXTRA_ENV_SETTINGS     \
++				"kernel_name=Image\0"           \
++				"kernel_addr=0x80f00000\0"      \
++				"initrd_name=ramdisk.img\0"     \
++				"initrd_addr=0x84000000\0"      \
++				"fdt_name=devtree.dtb\0"        \
++				"fdt_addr=0x83000000\0"         \
++				"fdt_high=0xffffffff\0"         \
++				"initrd_high=0xffffffff\0"
++
++#define CONFIG_BOOTCOMMAND	"echo copy to RAM...; " \
++				"cp.b 0x80100000 $kernel_addr 0xb00000; " \
++				"cp.b 0x80d00000 $initrd_addr 0x800000; " \
++				"bootz $kernel_addr $initrd_addr:0x800000 $fdt_addr"
++
++/* Monitor Command Prompt */
++#define CONFIG_SYS_CBSIZE		512     /* Console I/O Buffer Size */
++#define CONFIG_SYS_MAXARGS		64      /* max command args */
++
++#define CONFIG_SYS_FLASH_BASE		0x80000000
++/* 256 x 256KiB sectors */
++#define CONFIG_SYS_MAX_FLASH_SECT	256
++/* Store environment at top of flash */
++#define CONFIG_ENV_ADDR			0x0a7c0000
++#define CONFIG_ENV_SECT_SIZE		0x0040000
++
++#define CONFIG_SYS_FLASH_CFI		1
++#define CONFIG_FLASH_CFI_DRIVER		1
++#define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_32BIT
++#define CONFIG_SYS_MAX_FLASH_BANKS	1
++
++#define CONFIG_SYS_FLASH_EMPTY_INFO   /* flinfo indicates empty blocks */
++#define FLASH_MAX_SECTOR_SI		0x00040000
++#define CONFIG_ENV_IS_IN_FLASH		1
++#endif
+-- 
+2.35.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 8d96873fa459..bc398f1fe8ed 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -1,5 +1,12 @@
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
+#
+# Corstone-500 MACHINE
+#
+SRC_URI:append:corstone500 = " \
+                   file://0001-armv7-adding-generic-timer-access-through-MMIO.patch \
+                   file://0002-board-arm-add-corstone500-board.patch"
+
 #
 # Corstone1000 64-bit machines
 #
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend
index 9f44ec7be173..980e5248d62f 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend
@@ -3,13 +3,6 @@
 THIS_DIR := "${THISDIR}"
 FILESEXTRAPATHS:prepend = "${THIS_DIR}/${BP}:"
 
-#
-# Corstone-500 MACHINE
-#
-SRC_URI:append:corstone500 = " \
-                   file://0001-armv7-adding-generic-timer-access-through-MMIO.patch \
-                   file://0002-board-arm-add-corstone500-board.patch"
-
 #
 # Juno KMACHINE
 #
-- 
2.35.1


