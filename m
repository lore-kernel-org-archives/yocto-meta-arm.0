Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.8980.1603208225429369481
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Oct 2020 08:37:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11F1C1042
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 Oct 2020 08:37:01 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EA0BA3F66B
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 Oct 2020 08:37:00 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm-bsp: remove dunfell u-boot support
Date: Fri, 16 Oct 2020 22:41:26 -0400
Message-Id: <20201017024126.28986-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201017024126.28986-1-jon.mason@arm.com>
References: <20201017024126.28986-1-jon.mason@arm.com>

u-boot version 2020.01 is not needed with dunfell not supported.  Remove
files and adjust the necessary.  Also, move tc0 support to match the
other BSPs

Change-Id: Ibc0f93a9eb0ca600a84b1399d77b35e6ae08753b
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../a5ds/0001-armv7-add-mmio-timer.patch      | 105 ------
 ...-arm-add-designstart-cortex-a5-board.patch | 309 ------------------
 ...-Add-vexpress_aemv8a_aarch32-variant.patch | 181 ----------
 .../fvp-common/u-boot_vexpress_fvp.patch      |  13 -
 .../juno/u-boot_vexpress_uenv.patch           |  37 ---
 .../0001-Add-support-for-Total-Compute.patch  |   0
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   2 +-
 .../recipes-bsp/u-boot/u-boot_2020.04.bb      |   0
 8 files changed, 1 insertion(+), 646 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/a5ds/0001-armv7-add-mmio-timer.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/fvp-common/u-boot_vexpress_fvp.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/juno/u-boot_vexpress_uenv.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/{files => u-boot-2020.07}/tc0/0001-Add-support-for-Total-Compute.patch (100%)
 rename {meta-arm => meta-arm-bsp}/recipes-bsp/u-boot/u-boot_2020.04.bb (100%)

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/a5ds/0001-armv7-add-mmio-timer.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/a5ds/0001-armv7-add-mmio-timer.patch
deleted file mode 100644
index fbf8a14..0000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/a5ds/0001-armv7-add-mmio-timer.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-From 8525c72c438b0aa66f1f38db37bd7aacf7e3ce34 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Wed, 18 Dec 2019 21:52:34 +0000
-Subject: [PATCH 1/2] armv7: add mmio timer
-
-This timer can be used by u-boot when arch-timer is not available in
-core, for example, Cortex-A5.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- arch/arm/cpu/armv7/Makefile     |  1 +
- arch/arm/cpu/armv7/mmio_timer.c | 56 +++++++++++++++++++++++++++++++++
- scripts/config_whitelist.txt    |  1 +
- 3 files changed, 58 insertions(+)
- create mode 100644 arch/arm/cpu/armv7/mmio_timer.c
-
-diff --git a/arch/arm/cpu/armv7/Makefile b/arch/arm/cpu/armv7/Makefile
-index 8c955d0d5284..82af9c031277 100644
---- a/arch/arm/cpu/armv7/Makefile
-+++ b/arch/arm/cpu/armv7/Makefile
-@@ -28,6 +28,7 @@ obj-$(CONFIG_ARMV7_PSCI)     += psci.o psci-common.o
- obj-$(CONFIG_IPROC) += iproc-common/
- obj-$(CONFIG_KONA) += kona-common/
- obj-$(CONFIG_SYS_ARCH_TIMER) += arch_timer.o
-+obj-$(CONFIG_SYS_MMIO_TIMER) += mmio_timer.o
-
- ifneq (,$(filter s5pc1xx exynos,$(SOC)))
- obj-y += s5p-common/
-diff --git a/arch/arm/cpu/armv7/mmio_timer.c b/arch/arm/cpu/armv7/mmio_timer.c
-new file mode 100644
-index 000000000000..1b905db8bb19
---- /dev/null
-+++ b/arch/arm/cpu/armv7/mmio_timer.c
-@@ -0,0 +1,56 @@
-+// SPDX-License-Identifier: GPL-2.0+
-+/*
-+ * Copyright (c) 2019, Arm Limited. All rights reserved.
-+ *
-+ */
-+
-+#include <common.h>
-+#include <asm/io.h>
-+#include <div64.h>
-+#include <bootstage.h>
-+
-+DECLARE_GLOBAL_DATA_PTR;
-+
-+#define CNTCTLBASE    0x1a020000UL
-+#define CNTREADBASE   0x1a030000UL
-+
-+static inline uint32_t mmio_read32(uintptr_t addr)
-+{
-+      return *(volatile uint32_t*)addr;
-+}
-+
-+int timer_init(void)
-+{
-+      gd->arch.timer_rate_hz = mmio_read32(CNTCTLBASE);
-+
-+      return 0;
-+}
-+
-+unsigned long long get_ticks(void)
-+{
-+      return ((mmio_read32(CNTCTLBASE + 0x4) << 32) |
-+              mmio_read32(CNTREADBASE));
-+}
-+
-+ulong get_timer(ulong base)
-+{
-+      return lldiv(get_ticks(), gd->arch.timer_rate_hz) - base;
-+}
-+
-+void __udelay(unsigned long usec)
-+{
-+      unsigned long endtime;
-+
-+      endtime = lldiv((unsigned long long)usec * gd->arch.timer_rate_hz,
-+                      1000UL);
-+
-+      endtime += get_ticks();
-+
-+      while (get_ticks() < endtime)
-+              ;
-+}
-+
-+ulong get_tbclk(void)
-+{
-+      return gd->arch.timer_rate_hz;
-+}
-diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
-index cf1808e051c8..8624714ae7a6 100644
---- a/scripts/config_whitelist.txt
-+++ b/scripts/config_whitelist.txt
-@@ -3138,6 +3138,7 @@ CONFIG_SYS_MMC_U_BOOT_DST
- CONFIG_SYS_MMC_U_BOOT_OFFS
- CONFIG_SYS_MMC_U_BOOT_SIZE
- CONFIG_SYS_MMC_U_BOOT_START
-+CONFIG_SYS_MMIO_TIMER
- CONFIG_SYS_MONITOR_
- CONFIG_SYS_MONITOR_BASE
- CONFIG_SYS_MONITOR_BASE_EARLY
---
-2.25.0
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch
deleted file mode 100644
index 3c527ae..0000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch
+++ /dev/null
@@ -1,309 +0,0 @@
-From 2417d0991f73ee2c83946fcac208a7d6894f4530 Mon Sep 17 00:00:00 2001
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
-index f9dab073ea14..2cc9413114de 100644
---- a/arch/arm/Kconfig
-+++ b/arch/arm/Kconfig
-@@ -628,6 +628,12 @@ config ARCH_BCM6858
-       select OF_CONTROL
-       imply CMD_DM
-
-+config TARGET_DESIGNSTART_CA5
-+      bool "Support Designstart Cortex-A5"
-+      select CPU_V7A
-+      select SEMIHOSTING
-+      select PL01X_SERIAL
-+
- config TARGET_VEXPRESS_CA15_TC2
-       bool "Support vexpress_ca15_tc2"
-       select CPU_V7A
-@@ -1782,6 +1788,7 @@ source "board/Marvell/gplugd/Kconfig"
- source "board/armadeus/apf27/Kconfig"
- source "board/armltd/vexpress/Kconfig"
- source "board/armltd/vexpress64/Kconfig"
-+source "board/armltd/designstart/Kconfig"
- source "board/broadcom/bcm23550_w1d/Kconfig"
- source "board/broadcom/bcm28155_ap/Kconfig"
- source "board/broadcom/bcm963158/Kconfig"
-diff --git a/board/armltd/designstart/Kconfig b/board/armltd/designstart/Kconfig
-new file mode 100644
-index 000000000000..6446fe3f4492
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
-index 000000000000..b64c905c7021
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
-index 000000000000..b0400f110ce2
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
-index 000000000000..a2a756740295
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
-index 000000000000..79c4b36060d2
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
-2.25.0
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
deleted file mode 100644
index 712f7f0..0000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
+++ /dev/null
@@ -1,181 +0,0 @@
-From d627bdf9b11964b694aaf464c5c88ad9b339f03f Mon Sep 17 00:00:00 2001
-From: Anders Dellien <anders.dellien@arm.com>
-Date: Thu, 23 Jul 2020 17:32:55 +0100
-Subject: [PATCH] Add vexpress_aemv8a_aarch32 variant
-
-The ARM AEMv8 FVP model can be run in Aarch64 or Aarch32 mode. Aarch32
-support is enable per-CPU when launching the model, eg:
-
--C cluster0.cpu0.CONFIG64=0
-
-This patch adds a new defconfig and some variant specific selections in
-vexpress_armv8a.h.
-
-This patch is co-authored with Soby Mathew <Soby.Mathew@arm.com>.
-
-Upstream-status: Denied
-
-For upstream discussion, please visit
-https://www.mail-archive.com/u-boot@lists.denx.de/msg233429.html
-
-Signed-off-by: Ryan Harkin <ryan.harkin@linaro.org>
-Signed-off-by: Asha R <asha.r@arm.com>
-Signed-off-by: Anders Dellien <anders.dellien@arm.com>
----
- arch/arm/Kconfig                          |  5 +++
- board/armltd/vexpress64/Kconfig           |  2 +-
- configs/vexpress_aemv8a_aarch32_defconfig | 40 +++++++++++++++++++++++
- include/configs/vexpress_aemv8a.h         | 28 +++++++++++-----
- 4 files changed, 65 insertions(+), 10 deletions(-)
- create mode 100644 configs/vexpress_aemv8a_aarch32_defconfig
-
-diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
-index 36c9c2fecd..99972cdf65 100644
---- a/arch/arm/Kconfig
-+++ b/arch/arm/Kconfig
-@@ -1088,6 +1088,11 @@ config TARGET_VEXPRESS64_BASE_FVP
- 	select PL01X_SERIAL
- 	select SEMIHOSTING
- 
-+config TARGET_VEXPRESS64_BASE_FVP_AARCH32
-+        bool "Support Versatile Express ARMv8a 32-bit FVP BASE model"
-+        select CPU_V7A
-+        select SEMIHOSTING
-+
- config TARGET_VEXPRESS64_JUNO
- 	bool "Support Versatile Express Juno Development Platform"
- 	select ARM64
-diff --git a/board/armltd/vexpress64/Kconfig b/board/armltd/vexpress64/Kconfig
-index 9014418433..75545e9ea1 100644
---- a/board/armltd/vexpress64/Kconfig
-+++ b/board/armltd/vexpress64/Kconfig
-@@ -1,4 +1,4 @@
--if TARGET_VEXPRESS64_BASE_FVP || TARGET_VEXPRESS64_JUNO
-+if TARGET_VEXPRESS64_BASE_FVP || TARGET_VEXPRESS64_JUNO || TARGET_VEXPRESS64_BASE_FVP_AARCH32
- 
- config SYS_BOARD
- 	default "vexpress64"
-diff --git a/configs/vexpress_aemv8a_aarch32_defconfig b/configs/vexpress_aemv8a_aarch32_defconfig
-new file mode 100644
-index 0000000000..cf1e8d5cae
---- /dev/null
-+++ b/configs/vexpress_aemv8a_aarch32_defconfig
-@@ -0,0 +1,40 @@
-+CONFIG_ARM=y
-+CONFIG_TARGET_VEXPRESS64_BASE_FVP_AARCH32=y
-+CONFIG_SYS_MALLOC_F_LEN=0x2000
-+CONFIG_IDENT_STRING=" vexpress_aemv8a fvp aarch32"
-+CONFIG_BOOTDELAY=1
-+CONFIG_SYS_TEXT_BASE=0x88000000
-+CONFIG_USE_BOOTARGS=y
-+CONFIG_BOOTARGS="console=ttyAMA0 earlycon=pl011,0x1c090000 debug user_debug=31 systemd.log_target=null root=/dev/vda2 rw androidboot.hardware=fvpbase rootwait loglevel=9"
-+# CONFIG_DISPLAY_CPUINFO is not set
-+# CONFIG_DISPLAY_BOARDINFO is not set
-+CONFIG_HUSH_PARSER=y
-+CONFIG_SYS_PROMPT="fvp32# "
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
-+CONFIG_FLASH_CFI_DRIVER=y
-+CONFIG_SYS_FLASH_CFI=y
-+CONFIG_SYS_ARCH_TIMER=y
-+CONFIG_DM_SERIAL=y
-+CONFIG_PL01X_SERIAL=y
-diff --git a/include/configs/vexpress_aemv8a.h b/include/configs/vexpress_aemv8a.h
-index 9a9cec414c..cf0e4a951c 100644
---- a/include/configs/vexpress_aemv8a.h
-+++ b/include/configs/vexpress_aemv8a.h
-@@ -7,7 +7,8 @@
- #ifndef __VEXPRESS_AEMV8A_H
- #define __VEXPRESS_AEMV8A_H
- 
--#ifdef CONFIG_TARGET_VEXPRESS64_BASE_FVP
-+#if defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP) || \
-+        defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP_AARCH32)
- #ifndef CONFIG_SEMIHOSTING
- #error CONFIG_TARGET_VEXPRESS64_BASE_FVP requires CONFIG_SEMIHOSTING
- #endif
-@@ -15,8 +16,17 @@
- 
- #define CONFIG_REMAKE_ELF
- 
-+#ifdef CONFIG_ARM64
-+#define HIGH_ADDR                       "0xffffffffffffffff"
-+#define BOOT_TYPE                       "booti"
-+#else
-+#define HIGH_ADDR                       "0xffffffff"
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
-@@ -82,7 +92,8 @@
- #define GICR_BASE			(0x2f100000)
- #else
- 
--#ifdef CONFIG_TARGET_VEXPRESS64_BASE_FVP
-+#if defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP) || \
-+        defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP_AARCH32)
- #define GICD_BASE			(0x2f000000)
- #define GICC_BASE			(0x2c000000)
- #elif CONFIG_TARGET_VEXPRESS64_JUNO
-@@ -169,7 +180,8 @@
- 				"booti ${kernel_addr} ${initrd_param} ${fdt_addr}"
- 
- 
--#elif CONFIG_TARGET_VEXPRESS64_BASE_FVP
-+#elif defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP) || \
-+        defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP_AARCH32)
- #define CONFIG_EXTRA_ENV_SETTINGS	\
- 				"kernel_name=Image\0"		\
- 				"kernel_addr=0x80080000\0"	\
-@@ -177,8 +189,8 @@
- 				"initrd_addr=0x88000000\0"	\
- 				"fdtfile=devtree.dtb\0"		\
- 				"fdt_addr=0x83000000\0"		\
--				"fdt_high=0xffffffffffffffff\0"	\
--				"initrd_high=0xffffffffffffffff\0"
-+				"fdt_high=" HIGH_ADDR "\0"	\
-+				"initrd_high=" HIGH_ADDR "\0"
- 
- #define CONFIG_BOOTCOMMAND	"smhload ${kernel_name} ${kernel_addr}; " \
- 				"smhload ${fdtfile} ${fdt_addr}; " \
-@@ -186,9 +198,7 @@
- 				"initrd_end; " \
- 				"fdt addr ${fdt_addr}; fdt resize; " \
- 				"fdt chosen ${initrd_addr} ${initrd_end}; " \
--				"booti $kernel_addr - $fdt_addr"
--
--
-+				BOOT_TYPE " $kernel_addr - $fdt_addr"
- #endif
- 
- /* Monitor Command Prompt */
--- 
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/fvp-common/u-boot_vexpress_fvp.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/fvp-common/u-boot_vexpress_fvp.patch
deleted file mode 100644
index 19e1a56..0000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/fvp-common/u-boot_vexpress_fvp.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-diff --git a/configs/vexpress_aemv8a_semi_defconfig b/configs/vexpress_aemv8a_semi_defconfig
-index c9cec8322c..3a339be6a2 100644
---- a/configs/vexpress_aemv8a_semi_defconfig
-+++ b/configs/vexpress_aemv8a_semi_defconfig
-@@ -9,7 +9,7 @@ CONFIG_IDENT_STRING=" vexpress_aemv8a"
- CONFIG_DISTRO_DEFAULTS=y
- CONFIG_BOOTDELAY=1
- CONFIG_USE_BOOTARGS=y
--CONFIG_BOOTARGS="console=ttyAMA0 earlycon=pl011,0x1c090000 debug user_debug=31 loglevel=9"
-+CONFIG_BOOTARGS="console=ttyAMA0 earlycon=pl011,0x1c090000 debug user_debug=31 androidboot.hardware=fvpbase root=/dev/vda2 rw rootwait loglevel=9"
- # CONFIG_USE_BOOTCOMMAND is not set
- # CONFIG_DISPLAY_CPUINFO is not set
- # CONFIG_DISPLAY_BOARDINFO is not set
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/juno/u-boot_vexpress_uenv.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/juno/u-boot_vexpress_uenv.patch
deleted file mode 100644
index bb90c17..0000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/juno/u-boot_vexpress_uenv.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-diff --git a/include/configs/vexpress_aemv8a.h b/include/configs/vexpress_aemv8a.h
-index 2354f4e958..3e01f477dc 100644
---- a/include/configs/vexpress_aemv8a.h
-+++ b/include/configs/vexpress_aemv8a.h
-@@ -151,6 +151,32 @@
- 				"fdt_addr=0x83000000\0" \
- 				"fdt_high=0xffffffffffffffff\0" \
- 				"initrd_high=0xffffffffffffffff\0" \
-+                                "bootenvfile=uEnv.txt\0" \
-+                                "bootcmd=run envboot\0" \
-+                                "envboot=if run loadbootenv; then echo Loading env from ${bootenvfile}; run importbootenv; else run default_bootcmd; fi; if test -n $uenvcmd; then echo Running uenvcmd ...; run uenvcmd;fi;\0" \
-+                                "importbootenv=echo Importing environment from memory, size ${filesize}; env import -t ${loadaddr} ${filesize}\0" \
-+                                "loadaddr=0x82000000\0" \
-+                                "filesize=0x4000\0" \
-+                                "loadbootenv=mw.l ${loadaddr} 0 0x1000; afs load ${bootenvfile} ${loadaddr}\0" \
-+				"default_bootcmd=echo running default boot command; afs load ${kernel_name} ${kernel_addr} ; " \
-+                                		"if test $? -eq 1; then "\
-+		                                "  echo Loading ${kernel_alt_name} instead of "\
-+                		                "${kernel_name}; "\
-+		                                "  afs load ${kernel_alt_name} ${kernel_addr};"\
-+                                		"fi ; "\
-+		                                "afs load  ${fdtfile} ${fdt_addr} ; " \
-+                		                "if test $? -eq 1; then "\
-+		                                "  echo Loading ${fdt_alt_name} instead of "\
-+		                                "${fdtfile}; "\
-+		                                "  afs load ${fdt_alt_name} ${fdt_addr}; "\
-+		                                "fi ; "\
-+                		                "fdt addr ${fdt_addr}; fdt resize; " \
-+		                                "if afs load  ${initrd_name} ${initrd_addr} ; "\
-+		                                "then "\
-+		                                "  setenv initrd_param ${initrd_addr}; "\
-+		                                "  else setenv initrd_param -; "\
-+		                                "fi ; " \
-+		                                "booti ${kernel_addr} ${initrd_param} ${fdt_addr}\0"
- 
- /* Copy the kernel and FDT to DRAM memory and boot */
- #define CONFIG_BOOTCOMMAND	"afs load ${kernel_name} ${kernel_addr} ; " \
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/tc0/0001-Add-support-for-Total-Compute.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/tc0/0001-Add-support-for-Total-Compute.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/files/tc0/0001-Add-support-for-Total-Compute.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/tc0/0001-Add-support-for-Total-Compute.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 205c3c4..303f18e 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -1,7 +1,7 @@
 # Machine specific u-boot
 
 THIS_DIR := "${THISDIR}"
-FILESEXTRAPATHS_prepend = "${THIS_DIR}/files/:${THIS_DIR}/${BP}:"
+FILESEXTRAPATHS_prepend = "${THIS_DIR}/${BP}:"
 FILESEXTRAPATHS_prepend_fvp-base = "${THIS_DIR}/${BP}/fvp-common:"
 FILESEXTRAPATHS_prepend_foundation-armv8 = "${THIS_DIR}/${BP}/fvp-common:"
 
diff --git a/meta-arm/recipes-bsp/u-boot/u-boot_2020.04.bb b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.04.bb
similarity index 100%
rename from meta-arm/recipes-bsp/u-boot/u-boot_2020.04.bb
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.04.bb
-- 
2.17.1

