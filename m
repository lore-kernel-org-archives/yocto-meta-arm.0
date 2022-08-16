Return-Path: <vishnu.banavath@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8836EC3F6B0
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 13:19:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.15684.1660655985063988041
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Aug 2022 06:19:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: vishnu.banavath@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7790C1042;
	Tue, 16 Aug 2022 06:19:45 -0700 (PDT)
Received: from e125903.cambridge.arm.com (e125903.cambridge.arm.com
 [10.1.195.30])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB3023F66F;
	Tue, 16 Aug 2022 06:19:43 -0700 (PDT)
From: vishnu.banavath@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 2/2] arm-bsp/optee: add optee-os support for N1SDP target
Date: Tue, 16 Aug 2022 14:19:33 +0100
Message-Id: <20220816131933.33160-3-vishnu.banavath@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220816131933.33160-1-vishnu.banavath@arm.com>
References: <20220816131933.33160-1-vishnu.banavath@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 Aug 2022 13:19:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3697

From: Vishnu Banavath <vishnu.banavath@arm.com>

These changes are to add support to build optee-os for N1SDP target.

Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf          |   3 +
 .../trusted-firmware-a-n1sdp.inc              |  23 +-
 ...DR-affinity-shift-and-mask-for-32-bi.patch |  29 +++
 ...lat-n1sdp-add-N1SDP-platform-support.patch | 233 ++++++++++++++++++
 ...ble-instruction-cache-and-data-cache.patch |  46 ++++
 .../n1sdp/0004-Handle-logging-syscall.patch   |  33 +++
 .../recipes-security/optee/optee-os-n1sdp.inc |  22 ++
 .../optee/optee-os_3.18.0.bbappend            |   6 +
 meta-arm/recipes-security/optee/optee-os.inc  |   6 +-
 9 files changed, 393 insertions(+), 8 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0001-core-arm-add-MPIDR-affinity-shift-and-mask-for-32-bi.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0002-plat-n1sdp-add-N1SDP-platform-support.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0003-HACK-disable-instruction-cache-and-data-cache.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0004-Handle-logging-syscall.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bbappend

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
index 5e87e61d..5d1be823 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -30,6 +30,9 @@ EXTRA_IMAGEDEPENDS += "virtual/control-processor-firmware"
 #UEFI EDK2 firmware
 EXTRA_IMAGEDEPENDS += "edk2-firmware"
 
+#optee
+PREFERRED_VERSION_optee-os ?= "3.18.%"
+
 #grub-efi
 EFI_PROVIDER ?= "grub-efi"
 MACHINE_FEATURES += "efi"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
index 9e106055..034dac30 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
@@ -14,12 +14,21 @@ TFA_UEFI           = "1"
 
 TFA_ROT_KEY= "plat/arm/board/common/rotpk/arm_rotprivk_rsa.pem"
 
+# Enabling Secure-EL1 Payload Dispatcher (SPD)
+TFA_SPD = "spmd"
+# Cortex-A35 supports Armv8.0-A (no S-EL2 execution state).
+# So, the SPD SPMC component should run at the S-EL1 execution state
+TFA_SPMD_SPM_AT_SEL2 = "0"
+
+# BL2 loads BL32 (optee). So, optee needs to be built first:
+DEPENDS += "optee-os"
+
 EXTRA_OEMAKE:append = "\
                     TRUSTED_BOARD_BOOT=1 \
-                    GENERATE_COT=1 \
-                    CREATE_KEYS=1 \
-                    ENABLE_PIE=0 \
-                    ARM_ROTPK_LOCATION="devel_rsa" \
-                    ROT_KEY="${TFA_ROT_KEY}" \
-                    BL33=${RECIPE_SYSROOT}/firmware/uefi.bin \
-                    "
+		    GENERATE_COT=1 \
+		    CREATE_KEYS=1 \
+		    ARM_ROTPK_LOCATION="devel_rsa" \
+		    ROT_KEY="${TFA_ROT_KEY}" \
+		    BL32=${RECIPE_SYSROOT}/lib/firmware/tee-pager_v2.bin \
+		    BL33=${RECIPE_SYSROOT}/firmware/uefi.bin \
+		    "
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0001-core-arm-add-MPIDR-affinity-shift-and-mask-for-32-bi.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0001-core-arm-add-MPIDR-affinity-shift-and-mask-for-32-bi.patch
new file mode 100644
index 00000000..f249e526
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0001-core-arm-add-MPIDR-affinity-shift-and-mask-for-32-bi.patch
@@ -0,0 +1,29 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+From cf84c933bb7b8a95742d1e723950cb2cde2d5320 Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Wed, 20 Jul 2022 16:37:10 +0100
+Subject: [PATCH] core: arm: add MPIDR affinity shift and mask for 32-bit
+
+This change is to add MPIDR affinity shift and mask for
+32-bit
+
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+diff --git a/core/arch/arm/include/arm.h b/core/arch/arm/include/arm.h
+index f59478af..2f6f82e7 100644
+--- a/core/arch/arm/include/arm.h
++++ b/core/arch/arm/include/arm.h
+@@ -63,6 +63,8 @@
+ #define MPIDR_AFF1_MASK		(MPIDR_AFFLVL_MASK << MPIDR_AFF1_SHIFT)
+ #define MPIDR_AFF2_SHIFT	U(16)
+ #define MPIDR_AFF2_MASK		(MPIDR_AFFLVL_MASK << MPIDR_AFF2_SHIFT)
++#define MPIDR_AFF3_SHIFT	U(32)
++#define MPIDR_AFF3_MASK		(MPIDR_AFFLVL_MASK << MPIDR_AFF3_SHIFT)
+ 
+ #define MPIDR_MT_SHIFT		U(24)
+ #define MPIDR_MT_MASK		BIT(MPIDR_MT_SHIFT)
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0002-plat-n1sdp-add-N1SDP-platform-support.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0002-plat-n1sdp-add-N1SDP-platform-support.patch
new file mode 100644
index 00000000..db195ab3
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0002-plat-n1sdp-add-N1SDP-platform-support.patch
@@ -0,0 +1,233 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+From 22ba7c7789082dbc179921962cdcadece4499c89 Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Thu, 30 Jun 2022 18:36:26 +0100
+Subject: [PATCH] plat-n1sdp: add N1SDP platform support
+
+These changes are to add N1SDP platform to optee-os
+
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+diff --git a/core/arch/arm/plat-n1sdp/conf.mk b/core/arch/arm/plat-n1sdp/conf.mk
+new file mode 100644
+index 00000000..06b4975a
+--- /dev/null
++++ b/core/arch/arm/plat-n1sdp/conf.mk
+@@ -0,0 +1,41 @@
++include core/arch/arm/cpu/cortex-armv8-0.mk
++
++CFG_DEBUG_INFO = y
++CFG_TEE_CORE_LOG_LEVEL = 4
++
++# Workaround 808870: Unconditional VLDM instructions might cause an
++# alignment fault even though the address is aligned
++# Either hard float must be disabled for AArch32 or strict alignment checks
++# must be disabled
++ifeq ($(CFG_SCTLR_ALIGNMENT_CHECK),y)
++$(call force,CFG_TA_ARM32_NO_HARD_FLOAT_SUPPORT,y)
++else
++$(call force,CFG_SCTLR_ALIGNMENT_CHECK,n)
++endif
++
++CFG_ARM64_core ?= y
++
++CFG_ARM_GICV3 = y
++
++# ARM debugger needs this
++platform-cflags-debug-info = -gdwarf-4
++platform-aflags-debug-info = -gdwarf-4
++
++CFG_CORE_SEL1_SPMC	= y
++CFG_WITH_ARM_TRUSTED_FW	= y
++
++$(call force,CFG_GIC,y)
++$(call force,CFG_PL011,y)
++$(call force,CFG_SECURE_TIME_SOURCE_CNTPCT,y)
++
++CFG_CORE_HEAP_SIZE = 0x32000 # 200kb
++
++CFG_TEE_CORE_NB_CORE = 4
++CFG_TZDRAM_START ?= 0x08000000
++CFG_TZDRAM_SIZE  ?= 0x02008000
++
++CFG_SHMEM_START  ?= 0x83000000
++CFG_SHMEM_SIZE   ?= 0x00210000
++# DRAM1 is defined above 4G
++$(call force,CFG_CORE_LARGE_PHYS_ADDR,y)
++$(call force,CFG_CORE_ARM64_PA_BITS,36)
+diff --git a/core/arch/arm/plat-n1sdp/main.c b/core/arch/arm/plat-n1sdp/main.c
+new file mode 100644
+index 00000000..cfb7f19b
+--- /dev/null
++++ b/core/arch/arm/plat-n1sdp/main.c
+@@ -0,0 +1,63 @@
++// SPDX-License-Identifier: BSD-2-Clause
++/*
++ * Copyright (c) 2022, Arm Limited.
++ */
++
++#include <arm.h>
++#include <console.h>
++#include <drivers/gic.h>
++#include <drivers/pl011.h>
++#include <drivers/tpm2_mmio.h>
++#include <drivers/tpm2_ptp_fifo.h>
++#include <drivers/tzc400.h>
++#include <initcall.h>
++#include <keep.h>
++#include <kernel/boot.h>
++#include <kernel/interrupt.h>
++#include <kernel/misc.h>
++#include <kernel/notif.h>
++#include <kernel/panic.h>
++#include <kernel/spinlock.h>
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
++
++register_ddr(DRAM0_BASE, DRAM0_SIZE);
++
++register_phys_mem_pgdir(MEM_AREA_IO_SEC, GICD_BASE, GIC_DIST_REG_SIZE);
++register_phys_mem_pgdir(MEM_AREA_IO_SEC, GICC_BASE, GIC_DIST_REG_SIZE);
++register_phys_mem_pgdir(MEM_AREA_IO_SEC, GICR_BASE, GIC_DIST_REG_SIZE);
++
++void main_init_gic(void)
++{
++	gic_init_base_addr(&gic_data, GICC_BASE,
++			   GICD_BASE);
++	itr_init(&gic_data.chip);
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
++
++void console_init(void)
++{
++	pl011_init(&console_data, CONSOLE_UART_BASE, CONSOLE_UART_CLK_IN_HZ,
++		   CONSOLE_BAUDRATE);
++	register_serial_console(&console_data.chip);
++}
+diff --git a/core/arch/arm/plat-n1sdp/n1sdp_core_pos.S b/core/arch/arm/plat-n1sdp/n1sdp_core_pos.S
+new file mode 100644
+index 00000000..439d4e67
+--- /dev/null
++++ b/core/arch/arm/plat-n1sdp/n1sdp_core_pos.S
+@@ -0,0 +1,32 @@
++/* SPDX-License-Identifier: BSD-2-Clause */
++/*
++ * Copyright (c) 2022, Arm Limited
++ */
++
++#include <asm.S>
++#include <arm.h>
++#include "platform_config.h"
++
++FUNC get_core_pos_mpidr , :
++        mov     x4, x0
++
++        /*
++         * The MT bit in MPIDR is always set for n1sdp and the
++         * affinity level 0 corresponds to thread affinity level.
++         */
++
++        /* Extract individual affinity fields from MPIDR */
++        ubfx    x0, x4, #MPIDR_AFF0_SHIFT, #MPIDR_AFFINITY_BITS
++        ubfx    x1, x4, #MPIDR_AFF1_SHIFT, #MPIDR_AFFINITY_BITS
++        ubfx    x2, x4, #MPIDR_AFF2_SHIFT, #MPIDR_AFFINITY_BITS
++        ubfx    x3, x4, #MPIDR_AFF3_SHIFT, #MPIDR_AFFINITY_BITS
++
++        /* Compute linear position */
++        mov     x4, #N1SDP_MAX_CLUSTERS_PER_CHIP
++        madd    x2, x3, x4, x2
++        mov     x4, #N1SDP_MAX_CPUS_PER_CLUSTER
++        madd    x1, x2, x4, x1
++        mov     x4, #N1SDP_MAX_PE_PER_CPU
++        madd    x0, x1, x4, x0
++        ret
++END_FUNC get_core_pos_mpidr
+diff --git a/core/arch/arm/plat-n1sdp/platform_config.h b/core/arch/arm/plat-n1sdp/platform_config.h
+new file mode 100644
+index 00000000..81b99409
+--- /dev/null
++++ b/core/arch/arm/plat-n1sdp/platform_config.h
+@@ -0,0 +1,49 @@
++/* SPDX-License-Identifier: BSD-2-Clause */
++/*
++ * Copyright (c) 2022, Arm Limited
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
++ /* N1SDP topology related constants */
++#define N1SDP_MAX_CPUS_PER_CLUSTER              U(2)
++#define PLAT_ARM_CLUSTER_COUNT                  U(2)
++#define PLAT_N1SDP_CHIP_COUNT                   U(2)
++#define N1SDP_MAX_CLUSTERS_PER_CHIP             U(2)
++#define N1SDP_MAX_PE_PER_CPU                    U(1)
++
++#define PLATFORM_CORE_COUNT                     (PLAT_N1SDP_CHIP_COUNT *        \
++		                                PLAT_ARM_CLUSTER_COUNT *        \
++						N1SDP_MAX_CPUS_PER_CLUSTER *    \
++						N1SDP_MAX_PE_PER_CPU)
++
++#define GIC_BASE		0x2c010000
++
++#define UART1_BASE		0x1C0A0000
++#define UART1_CLK_IN_HZ		24000000  /*24MHz*/
++
++#define CONSOLE_UART_BASE	UART1_BASE
++#define CONSOLE_UART_CLK_IN_HZ	UART1_CLK_IN_HZ
++
++#define DRAM0_BASE		0x80000000
++#define DRAM0_SIZE		0x80000000
++
++#define GICD_BASE		0x30000000
++#define GICC_BASE		0x2C000000
++#define GICR_BASE		0x300C0000
++
++#ifndef UART_BAUDRATE
++#define UART_BAUDRATE		115200
++#endif
++#ifndef CONSOLE_BAUDRATE
++#define CONSOLE_BAUDRATE	UART_BAUDRATE
++#endif
++
++#endif /*PLATFORM_CONFIG_H*/
+diff --git a/core/arch/arm/plat-n1sdp/sub.mk b/core/arch/arm/plat-n1sdp/sub.mk
+new file mode 100644
+index 00000000..a0b49da1
+--- /dev/null
++++ b/core/arch/arm/plat-n1sdp/sub.mk
+@@ -0,0 +1,3 @@
++global-incdirs-y += .
++srcs-y += main.c
++srcs-y	+= n1sdp_core_pos.S
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0003-HACK-disable-instruction-cache-and-data-cache.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0003-HACK-disable-instruction-cache-and-data-cache.patch
new file mode 100644
index 00000000..e8f4cc44
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0003-HACK-disable-instruction-cache-and-data-cache.patch
@@ -0,0 +1,46 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+From 0c3ce4c09cd7d2ff4cd2e62acab899dd88dc9514 Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Wed, 20 Jul 2022 16:45:59 +0100
+Subject: [PATCH] HACK: disable instruction cache and data cache.
+
+For some reason, n1sdp fails to boot with instruction cache and
+data cache enabled. This is a temporary change to disable I cache
+and D cache until a proper fix is found.
+
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+%% original patch: 0003-HACK-disable-instruction-cache-and-data-cache.patch
+
+diff --git a/core/arch/arm/kernel/entry_a64.S b/core/arch/arm/kernel/entry_a64.S
+index 875b6e69..594d6928 100644
+--- a/core/arch/arm/kernel/entry_a64.S
++++ b/core/arch/arm/kernel/entry_a64.S
+@@ -52,7 +52,7 @@
+ 
+ 	.macro set_sctlr_el1
+ 		mrs	x0, sctlr_el1
+-		orr	x0, x0, #SCTLR_I
++		bic	x0, x0, #SCTLR_I
+ 		orr	x0, x0, #SCTLR_SA
+ 		orr	x0, x0, #SCTLR_SPAN
+ #if defined(CFG_CORE_RWDATA_NOEXEC)
+@@ -490,11 +490,11 @@ LOCAL_FUNC enable_mmu , : , .identity_map
+ 	isb
+ 
+ 	/* Enable I and D cache */
+-	mrs	x1, sctlr_el1
++	/* mrs	x1, sctlr_el1
+ 	orr	x1, x1, #SCTLR_I
+ 	orr	x1, x1, #SCTLR_C
+ 	msr	sctlr_el1, x1
+-	isb
++	isb */
+ 
+ 	/* Adjust stack pointers and return address */
+ 	msr	spsel, #1
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0004-Handle-logging-syscall.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0004-Handle-logging-syscall.patch
new file mode 100644
index 00000000..356be9e0
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0004-Handle-logging-syscall.patch
@@ -0,0 +1,33 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+From b3fde6c2e1a950214f760ab9f194f3a6572292a8 Mon Sep 17 00:00:00 2001
+From: Balint Dobszay <balint.dobszay@arm.com>
+Date: Fri, 15 Jul 2022 13:45:54 +0200
+Subject: [PATCH] Handle logging syscall
+
+Signed-off-by: Balint Dobszay <balint.dobszay@arm.com>
+Change-Id: Ib8151cc9c66aea8bcc8fe8b1ecdc3f9f9c5f14e4
+
+%% original patch: 0004-Handle-logging-syscall.patch
+
+diff --git a/core/arch/arm/kernel/spmc_sp_handler.c b/core/arch/arm/kernel/spmc_sp_handler.c
+index e0fa0aa6..c7a45387 100644
+--- a/core/arch/arm/kernel/spmc_sp_handler.c
++++ b/core/arch/arm/kernel/spmc_sp_handler.c
+@@ -1004,6 +1004,12 @@ void spmc_sp_msg_handler(struct thread_smc_args *args,
+ 			ffa_mem_reclaim(args, caller_sp);
+ 			sp_enter(args, caller_sp);
+ 			break;
++		case 0xdeadbeef:
++			ts_push_current_session(&caller_sp->ts_sess);
++			IMSG("%s", (char *)args->a1);
++			ts_pop_current_session();
++			sp_enter(args, caller_sp);
++			break;
+ 		default:
+ 			EMSG("Unhandled FFA function ID %#"PRIx32,
+ 			     (uint32_t)args->a0);
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc b/meta-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc
new file mode 100644
index 00000000..219f08bf
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-n1sdp.inc
@@ -0,0 +1,22 @@
+# N1 SDP specific configuration for optee-os
+
+COMPATIBLE_MACHINE:n1sdp = "n1sdp"
+OPTEEMACHINE:n1sdp = "n1sdp"
+
+TS_INSTALL_PREFIX_PATH = "${RECIPE_SYSROOT}/firmware/sp/opteesp"
+
+FILESEXTRAPATHS:prepend := "${THISDIR}/files/optee-os/n1sdp:"
+SRC_URI:append = " \
+    file://0001-core-arm-add-MPIDR-affinity-shift-and-mask-for-32-bi.patch \
+    file://0002-plat-n1sdp-add-N1SDP-platform-support.patch \
+    file://0003-HACK-disable-instruction-cache-and-data-cache.patch \
+    file://0004-Handle-logging-syscall.patch \
+    "
+
+EXTRA_OEMAKE += " CFG_TEE_CORE_LOG_LEVEL=4"
+
+EXTRA_OEMAKE += " CFG_TEE_BENCHMARK=n"
+
+EXTRA_OEMAKE += " CFG_CORE_SEL1_SPMC=y CFG_CORE_FFA=y"
+
+EXTRA_OEMAKE += " CFG_WITH_SP=y"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bbappend b/meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bbappend
new file mode 100644
index 00000000..f80e09f8
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bbappend
@@ -0,0 +1,6 @@
+# Machine specific configurations
+
+MACHINE_OPTEE_OS_REQUIRE ?= ""
+MACHINE_OPTEE_OS_REQUIRE:n1sdp = "optee-os-n1sdp.inc"
+
+require ${MACHINE_OPTEE_OS_REQUIRE}
diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
index 11193dcf..fe0f8b0a 100644
--- a/meta-arm/recipes-security/optee/optee-os.inc
+++ b/meta-arm/recipes-security/optee/optee-os.inc
@@ -33,6 +33,8 @@ EXTRA_OEMAKE += " \
     ta-targets=ta_${OPTEE_ARCH} \
     O=${B} \
 "
+EXTRA_OEMAKE += " HOST_PREFIX=${HOST_PREFIX}"
+EXTRA_OEMAKE += " CROSS_COMPILE64=${HOST_PREFIX}"
 
 CFLAGS[unexport] = "1"
 LDFLAGS[unexport] = "1"
@@ -40,7 +42,9 @@ CPPFLAGS[unexport] = "1"
 AS[unexport] = "1"
 LD[unexport] = "1"
 
-do_configure[noexec] = "1"
+do_compile:prepend() {
+	PLAT_LIBGCC_PATH=$(${CC} -print-libgcc-file-name)
+}
 
 do_compile() {
     oe_runmake -C ${S} all
-- 
2.17.1


