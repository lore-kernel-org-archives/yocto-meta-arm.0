Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 973A2C433F5
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 13:01:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.65.1664802072353732457
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Oct 2022 06:01:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2502176A;
	Mon,  3 Oct 2022 06:01:18 -0700 (PDT)
Received: from e121910.arm.com (unknown [10.57.65.67])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 955B63F73B;
	Mon,  3 Oct 2022 06:01:10 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Vishnu.Banavath@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 03/12] arm-bsp/optee-os: corstone1000: upgrade to v3.18
Date: Mon,  3 Oct 2022 14:00:42 +0100
Message-Id: <20221003130051.28934-4-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221003130051.28934-1-abdellatif.elkhlifi@arm.com>
References: <20221003130051.28934-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 03 Oct 2022 13:01:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3897

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Upgrading optee-os uses the new Trusted Services support

Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../conf/machine/include/corstone1000.inc     |   9 +-
 ...rstone1000-add-corstone1000-platform.patch | 209 ------------------
 ...000-reserve-3MB-CVM-memory-for-optee.patch |  31 ---
 ...0-add-a-rule-in-Makefile-to-SP_MAKEF.patch |  39 ----
 ...ne1000-increase-OPTEE-core-heap-size.patch |  30 ---
 ...d-missing-error-check-during-SP-init.patch |  41 ----
 ...ow-setting-sysroot-for-libgcc-lookup.patch |  35 ---
 ...0007-allow-setting-sysroot-for-clang.patch |  30 ---
 .../0008-no-warn-rwx-segments.patch           |  65 ------
 .../corstone1000/sp_manifest_combined_se.dts  |  62 ------
 .../optee/optee-os-corstone1000-common.inc    |  24 +-
 .../optee/optee-os-corstone1000.inc           |  20 --
 .../optee/optee-os_3.10.0.bbappend            |   6 -
 .../optee/optee-os_3.18.0.bbappend            |   1 +
 14 files changed, 9 insertions(+), 593 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0001-plat-corstone1000-add-corstone1000-platform.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0002-plat-corstone1000-reserve-3MB-CVM-memory-for-optee.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0003-plat-corstone1000-add-a-rule-in-Makefile-to-SP_MAKEF.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0004-plat-corstone1000-increase-OPTEE-core-heap-size.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0005-Fix-add-missing-error-check-during-SP-init.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0006-allow-setting-sysroot-for-libgcc-lookup.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0007-allow-setting-sysroot-for-clang.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0008-no-warn-rwx-segments.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/sp_manifest_combined_se.dts
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-corstone1000.inc
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os_3.10.0.bbappend

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-arm-bsp/conf/machine/include/corstone1000.inc
index 5d22b464..44a9a56c 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -33,16 +33,13 @@ UBOOT_BOOTARGS = "earlycon=pl011,0x1a510000 console=ttyAMA0 loglevel=9"
 UBOOT_ARCH = "arm"
 UBOOT_EXTLINUX = "0"
 
-# optee
-PREFERRED_VERSION_optee-os ?= "3.10.%"
-PREFERRED_VERSION_optee-client ?= "3.14.%"
+#optee
+PREFERRED_VERSION_optee-os ?= "3.18.%"
+PREFERRED_VERSION_optee-client ?= "3.18.%"
 EXTRA_IMAGEDEPENDS += "optee-os"
 OPTEE_ARCH = "arm64"
 OPTEE_BINARY = "tee-pager_v2.bin"
 
-# Trusted Services(TS)
-EXTRA_IMAGEDEPENDS += "secure-partitions"
-
 # External System(Cortex-M3)
 EXTRA_IMAGEDEPENDS += "external-system"
 
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0001-plat-corstone1000-add-corstone1000-platform.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0001-plat-corstone1000-add-corstone1000-platform.patch
deleted file mode 100644
index b2d9f03c..00000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0001-plat-corstone1000-add-corstone1000-platform.patch
+++ /dev/null
@@ -1,209 +0,0 @@
-From 617e3a116178559fb6e148553b1cd56fb13ed7aa Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Tue, 22 Jun 2021 22:09:28 +0100
-Subject: [PATCH] plat-corstone1000: add corstone1000 platform
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-These changes are to add corstone1000 platform to optee core
-
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
----
- core/arch/arm/plat-corstone1000/conf.mk       | 37 +++++++++
- core/arch/arm/plat-corstone1000/main.c        | 77 +++++++++++++++++++
- .../arm/plat-corstone1000/platform_config.h   | 46 +++++++++++
- core/arch/arm/plat-corstone1000/sub.mk        |  2 +
- 4 files changed, 162 insertions(+)
- create mode 100644 core/arch/arm/plat-corstone1000/conf.mk
- create mode 100644 core/arch/arm/plat-corstone1000/main.c
- create mode 100644 core/arch/arm/plat-corstone1000/platform_config.h
- create mode 100644 core/arch/arm/plat-corstone1000/sub.mk
-
-diff --git a/core/arch/arm/plat-corstone1000/conf.mk b/core/arch/arm/plat-corstone1000/conf.mk
-new file mode 100644
-index 00000000..b14dd442
---- /dev/null
-+++ b/core/arch/arm/plat-corstone1000/conf.mk
-@@ -0,0 +1,37 @@
-+PLATFORM_FLAVOR ?= mps3
-+
-+$(call force,CFG_HWSUPP_MEM_PERM_WXN,y)
-+$(call force,CFG_HWSUPP_MEM_PERM_PXN,y)
-+$(call force,CFG_ENABLE_SCTLR_RR,n)
-+$(call force,CFG_ENABLE_SCTLR_Z,n)
-+
-+arm64-platform-cpuarch := cortex-a35
-+arm64-platform-cflags += -mcpu=$(arm64-platform-cpuarch)
-+arm64-platform-aflags += -mcpu=$(arm64-platform-cpuarch)
-+platform-flavor-armv8 := 1
-+
-+$(call force,CFG_GIC,y)
-+$(call force,CFG_PL011,y)
-+$(call force,CFG_SECURE_TIME_SOURCE_CNTPCT,y)
-+
-+$(call force,CFG_ARM64_core,y)
-+
-+CFG_WITH_STATS ?= y
-+
-+CFG_WITH_ARM_TRUSTED_FW ?= y
-+CFG_WITH_LPAE ?=y
-+
-+CFG_TEE_CORE_NB_CORE = 1
-+CFG_TZDRAM_START ?= 0x02002000
-+CFG_TZDRAM_SIZE  ?= 0x000FE000
-+CFG_TEE_RAM_VA_SIZE ?= 0x00AF000
-+CFG_SHMEM_START  ?= 0x86000000
-+CFG_SHMEM_SIZE   ?= 0x00200000
-+
-+CFG_DDR_SIZE ?= 0x80000000
-+CFG_DT_ADDR ?= 0x82100000
-+CFG_DTB_MAX_SIZE ?= 0x100000
-+
-+$(call force,CFG_PSCI_ARM64,y)
-+$(call force,CFG_DT,y)
-+$(call force,CFG_EXTERNAL_DTB_OVERLAY,y)
-diff --git a/core/arch/arm/plat-corstone1000/main.c b/core/arch/arm/plat-corstone1000/main.c
-new file mode 100644
-index 00000000..35d89535
---- /dev/null
-+++ b/core/arch/arm/plat-corstone1000/main.c
-@@ -0,0 +1,77 @@
-+// SPDX-License-Identifier: BSD-2-Clause
-+/*
-+ * Copyright (c) 2020, Linaro Limited
-+ */
-+
-+#include <arm64.h>
-+#include <console.h>
-+#include <drivers/gic.h>
-+#include <drivers/pl011.h>
-+#include <drivers/tzc400.h>
-+#include <initcall.h>
-+#include <keep.h>
-+#include <kernel/boot.h>
-+#include <kernel/interrupt.h>
-+#include <kernel/misc.h>
-+#include <kernel/panic.h>
-+#include <kernel/tee_time.h>
-+#include <mm/core_memprot.h>
-+#include <mm/core_mmu.h>
-+#include <platform_config.h>
-+#include <sm/psci.h>
-+#include <stdint.h>
-+#include <string.h>
-+#include <trace.h>
-+
-+static struct gic_data gic_data __nex_bss;
-+static struct pl011_data console_data __nex_bss;
-+
-+register_phys_mem_pgdir(MEM_AREA_IO_SEC, CONSOLE_UART_BASE, PL011_REG_SIZE);
-+#ifdef DRAM0_BASE
-+register_ddr(DRAM0_BASE, DRAM0_SIZE);
-+#endif
-+
-+#ifdef GIC_BASE
-+register_phys_mem_pgdir(MEM_AREA_IO_SEC, GICD_BASE, GIC_DIST_REG_SIZE);
-+register_phys_mem_pgdir(MEM_AREA_IO_SEC, GICC_BASE, GIC_DIST_REG_SIZE);
-+
-+void main_init_gic(void)
-+{
-+	vaddr_t gicc_base;
-+	vaddr_t gicd_base;
-+
-+	gicc_base = core_mmu_get_va(GICC_BASE, MEM_AREA_IO_SEC);
-+	gicd_base = core_mmu_get_va(GICD_BASE, MEM_AREA_IO_SEC);
-+
-+	if (!gicc_base || !gicd_base)
-+		panic();
-+
-+	/* Initialize GIC */
-+	gic_init(&gic_data, gicc_base, gicd_base);
-+	itr_init(&gic_data.chip);
-+
-+}
-+
-+void main_secondary_init_gic(void)
-+{
-+	gic_cpu_init(&gic_data);
-+}
-+
-+void itr_core_handler(void)
-+{
-+	gic_it_handle(&gic_data);
-+}
-+#endif
-+
-+void console_init(void)
-+{
-+	pl011_init(&console_data, CONSOLE_UART_BASE, CONSOLE_UART_CLK_IN_HZ,
-+		   CONSOLE_BAUDRATE);
-+	register_serial_console(&console_data.chip);
-+}
-+
-+void ffa_secondary_cpu_boot_req(vaddr_t secondary_ep, uint64_t cookie)
-+{
-+	DMSG("This is single core platform\n");
-+}
-+
-diff --git a/core/arch/arm/plat-corstone1000/platform_config.h b/core/arch/arm/plat-corstone1000/platform_config.h
-new file mode 100644
-index 00000000..cfee6fa4
---- /dev/null
-+++ b/core/arch/arm/plat-corstone1000/platform_config.h
-@@ -0,0 +1,46 @@
-+/* SPDX-License-Identifier: BSD-2-Clause */
-+/*
-+ * Copyright (c) 2020, Linaro Limited
-+ */
-+
-+#ifndef PLATFORM_CONFIG_H
-+#define PLATFORM_CONFIG_H
-+
-+#include <mm/generic_ram_layout.h>
-+#include <stdint.h>
-+
-+/* Make stacks aligned to data cache line length */
-+#define STACK_ALIGNMENT		64
-+
-+
-+#define GIC_BASE		0x1c000000
-+#define UART0_BASE		0x1a510000
-+#define UART1_BASE		0x1a520000
-+
-+#define CONSOLE_UART_BASE	UART1_BASE
-+
-+#define DRAM0_BASE		0x80000000
-+#define DRAM0_SIZE		0x7f000000
-+
-+#define GICD_OFFSET		0x10000
-+#define GICC_OFFSET		0x2f000
-+
-+#ifdef GIC_BASE
-+#define GICD_BASE		(GIC_BASE + GICD_OFFSET)
-+#define GICC_BASE		(GIC_BASE + GICC_OFFSET)
-+#endif
-+
-+#ifndef UART_BAUDRATE
-+#define UART_BAUDRATE		115200
-+#endif
-+#ifndef CONSOLE_BAUDRATE
-+#define CONSOLE_BAUDRATE	UART_BAUDRATE
-+#endif
-+
-+#ifndef SYS_COUNTER_FREQ_IN_TICKS
-+#define SYS_COUNTER_FREQ_IN_TICKS	UL(50000000) /* 32MHz */
-+#endif
-+
-+#define CONSOLE_UART_CLK_IN_HZ	UL(50000000) /* 32MHz*/
-+
-+#endif /*PLATFORM_CONFIG_H*/
-diff --git a/core/arch/arm/plat-corstone1000/sub.mk b/core/arch/arm/plat-corstone1000/sub.mk
-new file mode 100644
-index 00000000..8ddc2fd4
---- /dev/null
-+++ b/core/arch/arm/plat-corstone1000/sub.mk
-@@ -0,0 +1,2 @@
-+global-incdirs-y += .
-+srcs-y += main.c
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0002-plat-corstone1000-reserve-3MB-CVM-memory-for-optee.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0002-plat-corstone1000-reserve-3MB-CVM-memory-for-optee.patch
deleted file mode 100644
index 69cd1913..00000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0002-plat-corstone1000-reserve-3MB-CVM-memory-for-optee.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 63469ad63866d07012fc98214ce2bfb84093f9bb Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Wed, 1 Sep 2021 16:46:42 +0100
-Subject: [PATCH] plat-corstone1000: reserve 3MB CVM memory for optee
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-optee requires 3MB CVM memory to include SecurePartition's into
-it's image
-
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
----
- core/arch/arm/plat-corstone1000/conf.mk | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/core/arch/arm/plat-corstone1000/conf.mk b/core/arch/arm/plat-corstone1000/conf.mk
-index b14dd442..7a4aa13c 100644
---- a/core/arch/arm/plat-corstone1000/conf.mk
-+++ b/core/arch/arm/plat-corstone1000/conf.mk
-@@ -23,8 +23,7 @@ CFG_WITH_LPAE ?=y
- 
- CFG_TEE_CORE_NB_CORE = 1
- CFG_TZDRAM_START ?= 0x02002000
--CFG_TZDRAM_SIZE  ?= 0x000FE000
--CFG_TEE_RAM_VA_SIZE ?= 0x00AF000
-+CFG_TZDRAM_SIZE  ?= 0x300000 # OPTEE CODE + DATA +TA_RAM = 3MB
- CFG_SHMEM_START  ?= 0x86000000
- CFG_SHMEM_SIZE   ?= 0x00200000
- 
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0003-plat-corstone1000-add-a-rule-in-Makefile-to-SP_MAKEF.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0003-plat-corstone1000-add-a-rule-in-Makefile-to-SP_MAKEF.patch
deleted file mode 100644
index 296cad30..00000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0003-plat-corstone1000-add-a-rule-in-Makefile-to-SP_MAKEF.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 66df8edb433ad11face32e4f6aab90e64222d38c Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Thu, 25 Nov 2021 06:20:48 +0000
-Subject: [PATCH] plat-corstone1000: add a rule in Makefile to SP_MAKEFILE_PATH
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-This change is to provide an option to user to include
-secure manifest into optee-os Makefile so that the secure
-partition is part of optee-os image
-
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
----
- Makefile | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/Makefile b/Makefile
-index f6fcea8b..21722939 100644
---- a/Makefile
-+++ b/Makefile
-@@ -18,6 +18,16 @@ unexport MAKEFILE_LIST
- # nonzero status). Useful since a few recipes use shell redirection.
- .DELETE_ON_ERROR:
- 
-+# include secure partition make file and manifest file
-+ifdef CFG_SP_MKFILE_PATH
-+ifdef CFG_EMBED_DTB_SOURCE_FILE
-+include $(CFG_SP_MKFILE_PATH)
-+$(info Loading secure partitions manifest ${CFG_EMBED_DTB_SOURCE_FILE})
-+CFG_EMBED_DTB_SOURCE_FILE :=${CFG_EMBED_DTB_SOURCE_FILE}
-+OPTEE_OS_COMMON_EXTRA_FLAGS+=${CFG_EMBED_DTB_SOURCE_FILE}
-+endif
-+endif
-+
- include mk/checkconf.mk
- 
- .PHONY: all
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0004-plat-corstone1000-increase-OPTEE-core-heap-size.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0004-plat-corstone1000-increase-OPTEE-core-heap-size.patch
deleted file mode 100644
index 8c4178e2..00000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0004-plat-corstone1000-increase-OPTEE-core-heap-size.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From a9b5146200935c53f3bb1f4d03ef6a674b194b92 Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Thu, 2 Dec 2021 12:51:11 +0000
-Subject: [PATCH] plat-corstone1000: increase OPTEE core heap size
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-This change is to increase optee core heap size to 131072
-from its default value to fit openAMP and smm-gateway
-in SEL0
-
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
----
- core/arch/arm/plat-corstone1000/conf.mk | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/core/arch/arm/plat-corstone1000/conf.mk b/core/arch/arm/plat-corstone1000/conf.mk
-index 7a4aa13c..65d652a4 100644
---- a/core/arch/arm/plat-corstone1000/conf.mk
-+++ b/core/arch/arm/plat-corstone1000/conf.mk
-@@ -31,6 +31,7 @@ CFG_DDR_SIZE ?= 0x80000000
- CFG_DT_ADDR ?= 0x82100000
- CFG_DTB_MAX_SIZE ?= 0x100000
- 
-+CFG_CORE_HEAP_SIZE ?= 131072
- $(call force,CFG_PSCI_ARM64,y)
- $(call force,CFG_DT,y)
- $(call force,CFG_EXTERNAL_DTB_OVERLAY,y)
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0005-Fix-add-missing-error-check-during-SP-init.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0005-Fix-add-missing-error-check-during-SP-init.patch
deleted file mode 100644
index dfdf56f8..00000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0005-Fix-add-missing-error-check-during-SP-init.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 9ec42a39ba4b14bc99f66b3fb9fc227e4e25d0ed Mon Sep 17 00:00:00 2001
-From: Jelle Sels <jelle.sels@arm.com>
-Date: Mon, 10 May 2021 11:37:23 +0200
-Subject: [PATCH] Fix: add missing error check during SP init
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-Error checking during SP initialization (sp_init_uuid()) was lacking.
-As a result an out of CORE HEAP situation resulted in a panic. This was
-due to lack of memory in the inflate() function of zlib.
-
-Signed-off-by: Jelle Sels <jelle.sels@arm.com>
-Change-Id: I287e2e2dd507feb45991b32ed264b3b6ad6fcd39
-
----
- core/arch/arm/kernel/sp.c | 10 +++++++---
- 1 file changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/core/arch/arm/kernel/sp.c b/core/arch/arm/kernel/sp.c
-index 4acbc2e2..23532a01 100644
---- a/core/arch/arm/kernel/sp.c
-+++ b/core/arch/arm/kernel/sp.c
-@@ -383,10 +383,14 @@ static TEE_Result __attribute__((unused)) sp_init_uuid(const TEE_UUID *uuid)
- 				  cancel_req_to,
- 				  &param);
- 
--	args.a0 = sp_get_session(sess->id)->sp_regs.x[0];
--	sp_thread(sess->id, FFA_NW_ID, &args);
-+	if (res == TEE_SUCCESS) {
-+		args.a0 = sp_get_session(sess->id)->sp_regs.x[0];
-+		sp_thread(sess->id, FFA_NW_ID, &args);
- 
--	thread_spmc_msg_recv(&args, sess->id);
-+		thread_spmc_msg_recv(&args, sess->id);
-+	} else {
-+		EMSG("SP initialization failed, try increasing CFG_CORE_HEAP_SIZE");
-+	}
- 
- 	return res;
- }
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0006-allow-setting-sysroot-for-libgcc-lookup.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0006-allow-setting-sysroot-for-libgcc-lookup.patch
deleted file mode 100644
index b838335e..00000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0006-allow-setting-sysroot-for-libgcc-lookup.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 4b2c1a31efe0c5514ae27e696e75659b55e41259 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Tue, 26 May 2020 14:38:02 -0500
-Subject: [PATCH] allow setting sysroot for libgcc lookup
-
-Explicitly pass the new variable LIBGCC_LOCATE_CFLAGS variable when searching
-for the compiler libraries as there's no easy way to reliably pass --sysroot
-otherwise.
-
-Upstream-Status: Pending [https://github.com/OP-TEE/optee_os/issues/4188]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
----
- mk/gcc.mk | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/mk/gcc.mk b/mk/gcc.mk
-index adc77a24..81bfa78a 100644
---- a/mk/gcc.mk
-+++ b/mk/gcc.mk
-@@ -13,11 +13,11 @@ nostdinc$(sm)	:= -nostdinc -isystem $(shell $(CC$(sm)) \
- 			-print-file-name=include 2> /dev/null)
- 
- # Get location of libgcc from gcc
--libgcc$(sm)  	:= $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
-+libgcc$(sm)  	:= $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$(arch-bits-$(sm))) \
- 			-print-libgcc-file-name 2> /dev/null)
--libstdc++$(sm)	:= $(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
-+libstdc++$(sm)	:= $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
- 			-print-file-name=libstdc++.a 2> /dev/null)
--libgcc_eh$(sm)	:= $(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
-+libgcc_eh$(sm)	:= $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
- 			-print-file-name=libgcc_eh.a 2> /dev/null)
- 
- # Define these to something to discover accidental use
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0007-allow-setting-sysroot-for-clang.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0007-allow-setting-sysroot-for-clang.patch
deleted file mode 100644
index d5e36948..00000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0007-allow-setting-sysroot-for-clang.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 992bed8a62c75aab034fe53d6329fa7c15cf06ee Mon Sep 17 00:00:00 2001
-From: Brett Warren <brett.warren@arm.com>
-Date: Wed, 23 Sep 2020 09:27:34 +0100
-Subject: [PATCH] optee: enable clang support
-
-When compiling with clang, the LIBGCC_LOCATE_CFLAG variable used
-to provide a sysroot wasn't included, which results in not locating
-compiler-rt. This is mitigated by including the variable as ammended.
-
-Upstream-Status: Pending
-ChangeId: 8ba69a4b2eb8ebaa047cb266c9aa6c2c3da45701
-Signed-off-by: Brett Warren <brett.warren@arm.com>
-
----
- mk/clang.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mk/clang.mk b/mk/clang.mk
-index 0f48c836..47465523 100644
---- a/mk/clang.mk
-+++ b/mk/clang.mk
-@@ -27,7 +27,7 @@ comp-cflags-warns-clang := -Wno-language-extension-token \
- 
- # Note, use the compiler runtime library (libclang_rt.builtins.*.a) instead of
- # libgcc for clang
--libgcc$(sm)	:= $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
-+libgcc$(sm)	:= $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$(arch-bits-$(sm))) \
- 			-rtlib=compiler-rt -print-libgcc-file-name 2> /dev/null)
- 
- # Core ASLR relies on the executable being ready to run from its preferred load
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0008-no-warn-rwx-segments.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0008-no-warn-rwx-segments.patch
deleted file mode 100644
index 40482282..00000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0008-no-warn-rwx-segments.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 3126adccaf9c9dc669bb7e1f96326c03da4b570d Mon Sep 17 00:00:00 2001
-From: Jerome Forissier <jerome.forissier@linaro.org>
-Date: Fri, 5 Aug 2022 09:48:03 +0200
-Subject: [PATCH] core: link: add --no-warn-rwx-segments
-
-Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
-Upstream-Status: Backport [https://github.com/OP-TEE/optee_os/pull/5474]
-
-binutils ld.bfd generates one RWX LOAD segment by merging several sections
-with mixed R/W/X attributes (.text, .rodata, .data). After version 2.38 it
-also warns by default when that happens [1], which breaks the build due to
---fatal-warnings. The RWX segment is not a problem for the TEE core, since
-that information is not used to set memory permissions. Therefore, silence
-the warning.
-
-Link: [1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
-Link: https://sourceware.org/bugzilla/show_bug.cgi?id=29448
-Reported-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
-Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
-Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
-
----
- core/arch/arm/kernel/link.mk | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/core/arch/arm/kernel/link.mk b/core/arch/arm/kernel/link.mk
-index 69375ad6..bea239cf 100644
---- a/core/arch/arm/kernel/link.mk
-+++ b/core/arch/arm/kernel/link.mk
-@@ -17,6 +17,7 @@ link-ldflags += -T $(link-script-pp) -Map=$(link-out-dir)/tee.map
- link-ldflags += --sort-section=alignment
- link-ldflags += --fatal-warnings
- link-ldflags += --gc-sections
-+link-ldflags += $(call ld-option,--no-warn-rwx-segments)
- 
- link-ldadd  = $(LDADD)
- link-ldadd += $(libdeps)
-@@ -37,6 +38,7 @@ link-script-cppflags := \
- 		$(cppflagscore))
- 
- ldargs-all_objs := -T $(link-script-dummy) --no-check-sections \
-+		   $(call ld-option,--no-warn-rwx-segments) \
- 		   $(link-objs) $(link-ldadd) $(libgcccore)
- cleanfiles += $(link-out-dir)/all_objs.o
- $(link-out-dir)/all_objs.o: $(objs) $(libdeps) $(MAKEFILE_LIST)
-@@ -49,7 +51,8 @@ $(link-out-dir)/unpaged_entries.txt: $(link-out-dir)/all_objs.o
- 	$(q)$(NMcore) $< | \
- 		$(AWK) '/ ____keep_pager/ { printf "-u%s ", $$3 }' > $@
- 
--unpaged-ldargs = -T $(link-script-dummy) --no-check-sections --gc-sections
-+unpaged-ldargs := -T $(link-script-dummy) --no-check-sections --gc-sections \
-+		 $(call ld-option,--no-warn-rwx-segments)
- unpaged-ldadd := $(objs) $(link-ldadd) $(libgcccore)
- cleanfiles += $(link-out-dir)/unpaged.o
- $(link-out-dir)/unpaged.o: $(link-out-dir)/unpaged_entries.txt
-@@ -77,7 +80,8 @@ $(link-out-dir)/init_entries.txt: $(link-out-dir)/all_objs.o
- 	$(q)$(NMcore) $< | \
- 		$(AWK) '/ ____keep_init/ { printf "-u%s ", $$3 }' > $@
- 
--init-ldargs := -T $(link-script-dummy) --no-check-sections --gc-sections
-+init-ldargs := -T $(link-script-dummy) --no-check-sections --gc-sections \
-+	       $(call ld-option,--no-warn-rwx-segments)
- init-ldadd := $(link-objs-init) $(link-out-dir)/version.o  $(link-ldadd) \
- 	      $(libgcccore)
- cleanfiles += $(link-out-dir)/init.o
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/sp_manifest_combined_se.dts b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/sp_manifest_combined_se.dts
deleted file mode 100644
index b09018ee..00000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/sp_manifest_combined_se.dts
+++ /dev/null
@@ -1,62 +0,0 @@
-/*
-* Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
-*
-* SPDX-License-Identifier: BSD-3-Clause
-*/
-
-/dts-v1/;
-
-/ {
-    se-proxy{
-        compatible = "arm,ffa-manifest-1.0";
-        ffa-version = <0x00010000>; /* 31:16 - Major, 15:0 - Minor */
-        uuid = <0x46bb39d1 0xb4d945b5 0x88ff0400 0x27dab249>;
-        description = "SE Proxy";
-        execution-ctx-count = <1>;
-        exception-level = <1>; /* S-EL0 */
-        execution-state = <0>; /* AArch64 */
-        xlat-granule = <0>; /* 4KiB */
-        messaging-method = <0>; /* Direct messaging only */
-	device-regions {
-		compatible = "arm,ffa-manifest-device-regions";
-		mhu-sender {
-			/* Armv8 A Foundation Platform values */
-			base-address = <0x00000000 0x1b820000>;
-			pages-count = <16>;
-			attributes = <0x3>; /* read-write */
-		};
-		mhu-receiver {
-			/* Armv8 A Foundation Platform values */
-			base-address = <0x00000000 0x1b830000>;
-			pages-count = <16>;
-			attributes = <0x3>; /* read-write */
-		};
-		openamp-virtio {
-			/* Armv8 A Foundation Platform values */
-			base-address = <0x00000000 0x88000000>;
-			pages-count = <256>;
-			attributes = <0x3>; /* read-write */
-		};
-	};
-    };
-    smm-gateway{
-        compatible = "arm,ffa-manifest-1.0";
-        ffa-version = <0x00010000>; /* 31:16 - Major, 15:0 - Minor */
-        uuid = <0xed32d533 0x99e64209 0x9cc02d72 0xcdd998a7>;
-        description = "SMM Gateway";
-        execution-ctx-count = <1>;
-        exception-level = <1>; /* S-EL0 */
-        execution-state = <0>; /* AArch64 */
-        xlat-granule = <0>; /* 4KiB */
-        messaging-method = <0>; /* Direct messaging only */
-		device-regions {
-          compatible = "arm,ffa-manifest-device-regions";
-          mm-comm-buffer {
-              /* Armv8 A Foundation Platform values */
-              base-address = <0x00000000 0x02000000>;
-              pages-count = <1>;
-              attributes = <0x3>; /* read-write */
-              };
-		};
-    };
-};
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc
index 9f372413..1aca3a91 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc
@@ -1,18 +1,9 @@
-SRC_URI = "git://git.trustedfirmware.org/OP-TEE/optee_os.git;protocol=https;branch=psa-development"
-SRCREV = "f9de2c9520ed97b89760cc4c99424aae440b63f4"
-PV = "3.10.0+git${SRCPV}"
+SRCREV = "42f6617108fa43712652ef52f9d5b4ec5b2665f8"
+PV = "3.18.0+git${SRCPV}"
 
-DEPENDS += "python3-pycryptodomex-native dtc-native"
-
-FILESEXTRAPATHS:prepend := "${THISDIR}/files/optee-os/corstone1000:"
-
-SRC_URI:append = " \
-                  file://0001-plat-corstone1000-add-corstone1000-platform.patch \
-                  file://0002-plat-corstone1000-reserve-3MB-CVM-memory-for-optee.patch \
-                  file://0003-plat-corstone1000-add-a-rule-in-Makefile-to-SP_MAKEF.patch \
-                  file://0004-plat-corstone1000-increase-OPTEE-core-heap-size.patch \
-                  file://0005-Fix-add-missing-error-check-during-SP-init.patch \
-                   "
+SRC_URI:remove = " \
+                  file://0008-no-warn-rwx-segments.patch \
+                 "
 
 COMPATIBLE_MACHINE = "corstone1000"
 
@@ -24,8 +15,3 @@ EXTRA_OEMAKE += " CFG_TEE_CORE_LOG_LEVEL=4"
 EXTRA_OEMAKE += " CFG_TEE_BENCHMARK=n"
 
 EXTRA_OEMAKE += " CFG_CORE_SEL1_SPMC=y CFG_CORE_FFA=y"
-
-EXTRA_OEMAKE += " CFG_WITH_SP=y"
-
-EXTRA_OEMAKE += " HOST_PREFIX=${HOST_PREFIX}"
-EXTRA_OEMAKE += " CROSS_COMPILE64=${HOST_PREFIX}"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000.inc b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000.inc
deleted file mode 100644
index 8ddf47e3..00000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000.inc
+++ /dev/null
@@ -1,20 +0,0 @@
-require optee-os-corstone1000-common.inc
-
-DEPENDS += " secure-partitions"
-EXTRA_OEMAKE +="'SP_PACKAGING_METHOD=embedded'"
-
-TS_INSTALL_PREFIX_PATH="${RECIPE_SYSROOT}/firmware/sp/opteesp"
-EXTRA_OEMAKE += "'TS_INSTALL_PREFIX=${TS_INSTALL_PREFIX_PATH}'"
-
-# se-proxy secure partition
-SP_MKFILE_PATH="${TS_INSTALL_PREFIX}/lib/make/se-proxy.mk"
-
-# smm-gateway secure partition
-SP_MKFILE_PATH += "${TS_INSTALL_PREFIX}/lib/make/smm-gateway.mk"
-
-EXTRA_OEMAKE += "'CFG_SP_MKFILE_PATH=${SP_MKFILE_PATH}'"
-
-EXTRA_OEMAKE += "CFG_EMBED_DTB_SOURCE_FILE=${EMBED_DTB_SOURCE_FILE}"
-
-SRC_URI:append = " file://sp_manifest_combined_se.dts;"
-EMBED_DTB_SOURCE_FILE = "${WORKDIR}/sp_manifest_combined_se.dts"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_3.10.0.bbappend b/meta-arm-bsp/recipes-security/optee/optee-os_3.10.0.bbappend
deleted file mode 100644
index db1fc18b..00000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os_3.10.0.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-# Machine specific configurations
-
-MACHINE_OPTEE_OS_REQUIRE ?= ""
-MACHINE_OPTEE_OS_REQUIRE:corstone1000 = "optee-os-corstone1000.inc"
-
-require ${MACHINE_OPTEE_OS_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bbappend b/meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bbappend
index bc933dd5..4b03985a 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bbappend
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bbappend
@@ -3,5 +3,6 @@
 MACHINE_OPTEE_OS_REQUIRE ?= ""
 MACHINE_OPTEE_OS_REQUIRE:n1sdp = "optee-os-n1sdp.inc"
 MACHINE_OPTEE_OS_REQUIRE:tc = "optee-os-tc.inc"
+MACHINE_OPTEE_OS_REQUIRE:corstone1000 = "optee-os-corstone1000-common.inc"
 
 require ${MACHINE_OPTEE_OS_REQUIRE}
-- 
2.17.1


