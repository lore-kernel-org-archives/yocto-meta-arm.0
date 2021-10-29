Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB5EC4332F
	for <webhook@archiver.kernel.org>; Fri, 29 Oct 2021 11:28:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.3988.1635506901650046278
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 Oct 2021 04:28:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 097C21FB;
	Fri, 29 Oct 2021 04:28:21 -0700 (PDT)
Received: from e121910.arm.com (unknown [10.57.80.198])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5DD063F5A1;
	Fri, 29 Oct 2021 04:28:19 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Arpita.S.K@arm.com,
	Jon.Mason@arm.com,
	Ross.Burton@arm.com,
	Vishnu.Banavath@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 05/13] arm-bsp/optee: introducing corstone1000 FVP machine
Date: Fri, 29 Oct 2021 12:27:45 +0100
Message-Id: <20211029112753.8231-6-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211029112753.8231-1-abdellatif.elkhlifi@arm.com>
References: <20211029112753.8231-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 29 Oct 2021 11:28:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2318

From: Vishnu Banavath <vishnu.banavath@arm.com>

These changes are to add corstone1000-fvp machine
to optee-os.

Change-Id: I9ddfaca476234c0307a89d5444ae2d0e688a9b59
Signed-off-by: Arpita S.K <Arpita.S.K@arm.com>
Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
---
 .../conf/machine/include/corstone1000.inc     |   5 +
 ...rstone1000-add-corstone1000-platform.patch | 201 ++++++++++++++++++
 ...000-reserve-3MB-CVM-memory-for-optee.patch |  30 +++
 .../optee/optee-os_3.14.0.bbappend            |   1 +
 .../optee/optee-os_corstone1000.inc           |  27 +++
 5 files changed, 264 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0001-plat-corstone1000-add-corstone1000-platform.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0002-plat-corstone1000-reserve-3MB-CVM-memory-for-optee.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-os_corstone1000.inc

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-arm-bsp/conf/machine/include/corstone1000.inc
index a673e6b..0cc315b 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -24,6 +24,11 @@ UBOOT_BOOTARGS = "earlycon=pl011,0x1a510000 console=ttyAMA0 loglevel=9"
 UBOOT_ARCH = "arm"
 UBOOT_EXTLINUX = "0"
 
+# optee
+EXTRA_IMAGEDEPENDS += "optee-os"
+OPTEE_ARCH = "arm64"
+OPTEE_BINARY = "tee-pager_v2.bin"
+
 # Linux kernel
 PREFERRED_PROVIDER_virtual/kernel:forcevariable = "linux-yocto"
 PREFERRED_VERSION_linux-yocto = "5.10%"
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0001-plat-corstone1000-add-corstone1000-platform.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0001-plat-corstone1000-add-corstone1000-platform.patch
new file mode 100644
index 0000000..7666486
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0001-plat-corstone1000-add-corstone1000-platform.patch
@@ -0,0 +1,201 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From 439a87df6a9f60f2b29afd988ad58a67e6f0b603 Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Tue, 22 Jun 2021 22:09:28 +0100
+Subject: [PATCH] plat-corstone1000: add corstone1000 platform
+
+These changes are to add corstone1000 platform to optee core
+
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+diff --git a/core/arch/arm/plat-corstone1000/conf.mk b/core/arch/arm/plat-corstone1000/conf.mk
+new file mode 100644
+index 00000000..b14dd442
+--- /dev/null
++++ b/core/arch/arm/plat-corstone1000/conf.mk
+@@ -0,0 +1,37 @@
++PLATFORM_FLAVOR ?= mps3
++
++$(call force,CFG_HWSUPP_MEM_PERM_WXN,y)
++$(call force,CFG_HWSUPP_MEM_PERM_PXN,y)
++$(call force,CFG_ENABLE_SCTLR_RR,n)
++$(call force,CFG_ENABLE_SCTLR_Z,n)
++
++arm64-platform-cpuarch := cortex-a35
++arm64-platform-cflags += -mcpu=$(arm64-platform-cpuarch)
++arm64-platform-aflags += -mcpu=$(arm64-platform-cpuarch)
++platform-flavor-armv8 := 1
++
++$(call force,CFG_GIC,y)
++$(call force,CFG_PL011,y)
++$(call force,CFG_SECURE_TIME_SOURCE_CNTPCT,y)
++
++$(call force,CFG_ARM64_core,y)
++
++CFG_WITH_STATS ?= y
++
++CFG_WITH_ARM_TRUSTED_FW ?= y
++CFG_WITH_LPAE ?=y
++
++CFG_TEE_CORE_NB_CORE = 1
++CFG_TZDRAM_START ?= 0x02002000
++CFG_TZDRAM_SIZE  ?= 0x000FE000
++CFG_TEE_RAM_VA_SIZE ?= 0x00AF000
++CFG_SHMEM_START  ?= 0x86000000
++CFG_SHMEM_SIZE   ?= 0x00200000
++
++CFG_DDR_SIZE ?= 0x80000000
++CFG_DT_ADDR ?= 0x82100000
++CFG_DTB_MAX_SIZE ?= 0x100000
++
++$(call force,CFG_PSCI_ARM64,y)
++$(call force,CFG_DT,y)
++$(call force,CFG_EXTERNAL_DTB_OVERLAY,y)
+diff --git a/core/arch/arm/plat-corstone1000/main.c b/core/arch/arm/plat-corstone1000/main.c
+new file mode 100644
+index 00000000..35d89535
+--- /dev/null
++++ b/core/arch/arm/plat-corstone1000/main.c
+@@ -0,0 +1,77 @@
++// SPDX-License-Identifier: BSD-2-Clause
++/*
++ * Copyright (c) 2020, Linaro Limited
++ */
++
++#include <arm64.h>
++#include <console.h>
++#include <drivers/gic.h>
++#include <drivers/pl011.h>
++#include <drivers/tzc400.h>
++#include <initcall.h>
++#include <keep.h>
++#include <kernel/boot.h>
++#include <kernel/interrupt.h>
++#include <kernel/misc.h>
++#include <kernel/panic.h>
++#include <kernel/tee_time.h>
++#include <mm/core_memprot.h>
++#include <mm/core_mmu.h>
++#include <platform_config.h>
++#include <sm/psci.h>
++#include <stdint.h>
++#include <string.h>
++#include <trace.h>
++
++static struct gic_data gic_data __nex_bss;
++static struct pl011_data console_data __nex_bss;
++
++register_phys_mem_pgdir(MEM_AREA_IO_SEC, CONSOLE_UART_BASE, PL011_REG_SIZE);
++#ifdef DRAM0_BASE
++register_ddr(DRAM0_BASE, DRAM0_SIZE);
++#endif
++
++#ifdef GIC_BASE
++register_phys_mem_pgdir(MEM_AREA_IO_SEC, GICD_BASE, GIC_DIST_REG_SIZE);
++register_phys_mem_pgdir(MEM_AREA_IO_SEC, GICC_BASE, GIC_DIST_REG_SIZE);
++
++void main_init_gic(void)
++{
++	vaddr_t gicc_base;
++	vaddr_t gicd_base;
++
++	gicc_base = core_mmu_get_va(GICC_BASE, MEM_AREA_IO_SEC);
++	gicd_base = core_mmu_get_va(GICD_BASE, MEM_AREA_IO_SEC);
++
++	if (!gicc_base || !gicd_base)
++		panic();
++
++	/* Initialize GIC */
++	gic_init(&gic_data, gicc_base, gicd_base);
++	itr_init(&gic_data.chip);
++
++}
++
++void main_secondary_init_gic(void)
++{
++	gic_cpu_init(&gic_data);
++}
++
++void itr_core_handler(void)
++{
++	gic_it_handle(&gic_data);
++}
++#endif
++
++void console_init(void)
++{
++	pl011_init(&console_data, CONSOLE_UART_BASE, CONSOLE_UART_CLK_IN_HZ,
++		   CONSOLE_BAUDRATE);
++	register_serial_console(&console_data.chip);
++}
++
++void ffa_secondary_cpu_boot_req(vaddr_t secondary_ep, uint64_t cookie)
++{
++	DMSG("This is single core platform\n");
++}
++
+diff --git a/core/arch/arm/plat-corstone1000/platform_config.h b/core/arch/arm/plat-corstone1000/platform_config.h
+new file mode 100644
+index 00000000..cfee6fa4
+--- /dev/null
++++ b/core/arch/arm/plat-corstone1000/platform_config.h
+@@ -0,0 +1,46 @@
++/* SPDX-License-Identifier: BSD-2-Clause */
++/*
++ * Copyright (c) 2020, Linaro Limited
++ */
++
++#ifndef PLATFORM_CONFIG_H
++#define PLATFORM_CONFIG_H
++
++#include <mm/generic_ram_layout.h>
++#include <stdint.h>
++
++/* Make stacks aligned to data cache line length */
++#define STACK_ALIGNMENT		64
++
++
++#define GIC_BASE		0x1c000000
++#define UART0_BASE		0x1a510000
++#define UART1_BASE		0x1a520000
++
++#define CONSOLE_UART_BASE	UART1_BASE
++
++#define DRAM0_BASE		0x80000000
++#define DRAM0_SIZE		0x7f000000
++
++#define GICD_OFFSET		0x10000
++#define GICC_OFFSET		0x2f000
++
++#ifdef GIC_BASE
++#define GICD_BASE		(GIC_BASE + GICD_OFFSET)
++#define GICC_BASE		(GIC_BASE + GICC_OFFSET)
++#endif
++
++#ifndef UART_BAUDRATE
++#define UART_BAUDRATE		115200
++#endif
++#ifndef CONSOLE_BAUDRATE
++#define CONSOLE_BAUDRATE	UART_BAUDRATE
++#endif
++
++#ifndef SYS_COUNTER_FREQ_IN_TICKS
++#define SYS_COUNTER_FREQ_IN_TICKS	UL(50000000) /* 32MHz */
++#endif
++
++#define CONSOLE_UART_CLK_IN_HZ	UL(50000000) /* 32MHz*/
++
++#endif /*PLATFORM_CONFIG_H*/
+diff --git a/core/arch/arm/plat-corstone1000/sub.mk b/core/arch/arm/plat-corstone1000/sub.mk
+new file mode 100644
+index 00000000..8ddc2fd4
+--- /dev/null
++++ b/core/arch/arm/plat-corstone1000/sub.mk
+@@ -0,0 +1,2 @@
++global-incdirs-y += .
++srcs-y += main.c
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0002-plat-corstone1000-reserve-3MB-CVM-memory-for-optee.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0002-plat-corstone1000-reserve-3MB-CVM-memory-for-optee.patch
new file mode 100644
index 0000000..ea60fee
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0002-plat-corstone1000-reserve-3MB-CVM-memory-for-optee.patch
@@ -0,0 +1,30 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From dbaf7a11e686d362eb09e63841eb718ea777dd03 Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Wed, 1 Sep 2021 16:46:42 +0100
+Subject: [PATCH] plat-corstone1000: reserve 3MB CVM memory for optee
+
+optee requires 3MB CVM memory to include SecurePartition's into
+it's image
+
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+diff --git a/core/arch/arm/plat-corstone1000/conf.mk b/core/arch/arm/plat-corstone1000/conf.mk
+index b14dd442..7a4aa13c 100644
+--- a/core/arch/arm/plat-corstone1000/conf.mk
++++ b/core/arch/arm/plat-corstone1000/conf.mk
+@@ -23,8 +23,7 @@ CFG_WITH_LPAE ?=y
+ 
+ CFG_TEE_CORE_NB_CORE = 1
+ CFG_TZDRAM_START ?= 0x02002000
+-CFG_TZDRAM_SIZE  ?= 0x000FE000
+-CFG_TEE_RAM_VA_SIZE ?= 0x00AF000
++CFG_TZDRAM_SIZE  ?= 0x300000 # OPTEE CODE + DATA +TA_RAM = 3MB
+ CFG_SHMEM_START  ?= 0x86000000
+ CFG_SHMEM_SIZE   ?= 0x00200000
+ 
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_3.14.0.bbappend b/meta-arm-bsp/recipes-security/optee/optee-os_3.14.0.bbappend
index e276fb8..7834b64 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os_3.14.0.bbappend
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_3.14.0.bbappend
@@ -1,6 +1,7 @@
 # Machine specific configurations
 
 MACHINE_OPTEE_OS_REQUIRE ?= ""
+MACHINE_OPTEE_OS_REQUIRE:corstone1000 = "optee-os_corstone1000.inc"
 MACHINE_OPTEE_OS_REQUIRE:tc = "optee-os-tc.inc"
 
 require ${MACHINE_OPTEE_OS_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_corstone1000.inc b/meta-arm-bsp/recipes-security/optee/optee-os_corstone1000.inc
new file mode 100644
index 0000000..e2cc7d6
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_corstone1000.inc
@@ -0,0 +1,27 @@
+SRC_URI = "git://git.trustedfirmware.org/OP-TEE/optee_os.git;protocol=https;branch=psa-development"
+SRCREV = "f9de2c9520ed97b89760cc4c99424aae440b63f4"
+PV .= "+git${SRCREV}"
+
+DEPENDS += "python3-pycryptodomex-native"
+
+FILESEXTRAPATHS:prepend := "${THISDIR}/files/optee-os/corstone1000:"
+
+SRC_URI:append = " \
+                  file://0001-plat-corstone1000-add-corstone1000-platform.patch \
+                  file://0002-plat-corstone1000-reserve-3MB-CVM-memory-for-optee.patch"
+
+COMPATIBLE_MACHINE = "corstone1000"
+
+OPTEEMACHINE = "corstone1000"
+# Enable optee memory layout and boot logs
+EXTRA_OEMAKE += " CFG_TEE_CORE_LOG_LEVEL=4"
+
+# default disable latency benchmarks (over all OP-TEE layers)
+EXTRA_OEMAKE += " CFG_TEE_BENCHMARK=n"
+
+EXTRA_OEMAKE += " CFG_CORE_SEL1_SPMC=y CFG_CORE_FFA=y"
+
+EXTRA_OEMAKE += " CFG_WITH_SP=y"
+
+EXTRA_OEMAKE += " HOST_PREFIX=${HOST_PREFIX}"
+EXTRA_OEMAKE += " CROSS_COMPILE64=${HOST_PREFIX}"
-- 
2.17.1


