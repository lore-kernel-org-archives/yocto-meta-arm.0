Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 286E8C4332F
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 16:00:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.13038.1637683200496945256
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Nov 2021 08:00:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BA921FB;
	Tue, 23 Nov 2021 08:00:00 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.78.53])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A5E1A3F5A1;
	Tue, 23 Nov 2021 07:59:58 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Arpita.S.K@arm.com,
	vishnu.banavath@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Jon Mason <jon.mason@arm.com>
Subject: [PATCH][honister 10/19] arm-bsp/trusted-firmware-a: introducing
 corstone1000 FVP machine
Date: Tue, 23 Nov 2021 15:59:17 +0000
Message-Id: <20211123155926.31743-11-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211123155926.31743-1-abdellatif.elkhlifi@arm.com>
References: <20211123155926.31743-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 23 Nov 2021 16:00:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2439

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

This commit enables TF-A v2.5 with Trusted Board Boot support for the
Corstone1000 64-bit platform.

Disables Non-Volatile counters in the TBB.

Change-Id: Idb9e18df7066cb617df72b2e147147ce49db292c
Signed-off-by: Arpita S.K <Arpita.S.K@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../conf/machine/include/corstone1000.inc     |   5 +
 .../0001-Rename-Diphda-to-corstone1000.patch  | 587 ++++++++++++++++++
 ...e1000-made-changes-to-accommodate-3M.patch | 201 ++++++
 .../trusted-firmware-a-corstone1000.inc       |  47 ++
 .../trusted-firmware-a_2.5.bbappend           |   1 +
 5 files changed, 841 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0001-Rename-Diphda-to-corstone1000.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0002-plat-arm-corstone1000-made-changes-to-accommodate-3M.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-arm-bsp/conf/machine/include/corstone1000.inc
index 2c2293f..a673e6b 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -2,6 +2,11 @@ require conf/machine/include/arm/armv8a/tune-cortexa35.inc
 
 MACHINEOVERRIDES =. "corstone1000:"
 
+# TF-A
+TFA_PLATFORM = "corstone1000"
+PREFERRED_VERSION_trusted-firmware-a ?= "2.5%"
+EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a"
+
 # TF-M
 PREFERRED_VERSION_trusted-firmware-m ?= "1.4%"
 TFM_PLATFORM = "arm/corstone1000"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0001-Rename-Diphda-to-corstone1000.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0001-Rename-Diphda-to-corstone1000.patch
new file mode 100644
index 0000000..47eb4e0
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0001-Rename-Diphda-to-corstone1000.patch
@@ -0,0 +1,587 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From b4d59c85d1045998275cd219efe5849803c2c616 Mon Sep 17 00:00:00 2001
+From: "Arpita S.K" <Arpita.S.K@arm.com>
+Date: Wed, 13 Oct 2021 18:05:11 +0530
+Subject: [PATCH] Rename Diphda to corstone1000
+
+Replace all the instances of Diphda as functions,
+macros etc. with corstone1000
+
+Signed-off-by: Arpita S.K <Arpita.S.K@arm.com>
+---
+ docs/about/maintainers.rst                    |  2 +-
+ .../arm/{diphda => corstone1000}/index.rst    |  6 +-
+ docs/plat/arm/index.rst                       |  2 +-
+ plat/arm/board/common/rotpk/arm_dev_rotpk.S   |  2 +-
+ .../corstone1000_bl2_mem_params_desc.c}       |  8 +-
+ .../common/corstone1000_err.c}                |  2 +-
+ .../common/corstone1000_helpers.S}            |  4 +-
+ .../common/corstone1000_plat.c}               |  6 +-
+ .../common/corstone1000_pm.c}                 |  0
+ .../common/corstone1000_security.c}           |  0
+ .../common/corstone1000_stack_protector.c}    |  0
+ .../common/corstone1000_topology.c}           | 12 +--
+ .../common/corstone1000_trusted_boot.c}       |  2 +-
+ .../fdts/corstone1000_spmc_manifest.dts}      |  0
+ .../common/include/platform_def.h             | 52 ++++++------
+ .../include/plat_macros.S                     |  0
+ plat/arm/board/corstone1000/platform.mk       | 83 +++++++++++++++++++
+ plat/arm/board/diphda/platform.mk             | 83 -------------------
+ 18 files changed, 132 insertions(+), 132 deletions(-)
+ rename docs/plat/arm/{diphda => corstone1000}/index.rst (93%)
+ rename plat/arm/board/{diphda/common/diphda_bl2_mem_params_desc.c => corstone1000/common/corstone1000_bl2_mem_params_desc.c} (92%)
+ rename plat/arm/board/{diphda/common/diphda_err.c => corstone1000/common/corstone1000_err.c} (89%)
+ rename plat/arm/board/{diphda/common/diphda_helpers.S => corstone1000/common/corstone1000_helpers.S} (94%)
+ rename plat/arm/board/{diphda/common/diphda_plat.c => corstone1000/common/corstone1000_plat.c} (92%)
+ rename plat/arm/board/{diphda/common/diphda_pm.c => corstone1000/common/corstone1000_pm.c} (100%)
+ rename plat/arm/board/{diphda/common/diphda_security.c => corstone1000/common/corstone1000_security.c} (100%)
+ rename plat/arm/board/{diphda/common/diphda_stack_protector.c => corstone1000/common/corstone1000_stack_protector.c} (100%)
+ rename plat/arm/board/{diphda/common/diphda_topology.c => corstone1000/common/corstone1000_topology.c} (77%)
+ rename plat/arm/board/{diphda/common/diphda_trusted_boot.c => corstone1000/common/corstone1000_trusted_boot.c} (97%)
+ rename plat/arm/board/{diphda/common/fdts/diphda_spmc_manifest.dts => corstone1000/common/fdts/corstone1000_spmc_manifest.dts} (100%)
+ rename plat/arm/board/{diphda => corstone1000}/common/include/platform_def.h (89%)
+ rename plat/arm/board/{diphda => corstone1000}/include/plat_macros.S (100%)
+ create mode 100644 plat/arm/board/corstone1000/platform.mk
+ delete mode 100644 plat/arm/board/diphda/platform.mk
+
+diff --git a/docs/about/maintainers.rst b/docs/about/maintainers.rst
+index 07f258c774..2d9eb1440d 100644
+--- a/docs/about/maintainers.rst
++++ b/docs/about/maintainers.rst
+@@ -399,7 +399,7 @@ Arm Rich IoT Platform ports
+ :|G|: `vishnu-banavath`_
+ :|F|: plat/arm/board/corstone700
+ :|F|: plat/arm/board/a5ds
+-:|F|: plat/arm/board/diphda
++:|F|: plat/arm/board/corstone1000
+ 
+ Arm Reference Design platform ports
+ ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+diff --git a/docs/plat/arm/diphda/index.rst b/docs/plat/arm/corstone1000/index.rst
+similarity index 93%
+rename from docs/plat/arm/diphda/index.rst
+rename to docs/plat/arm/corstone1000/index.rst
+index 27afda43f5..b889b7f2e9 100644
+--- a/docs/plat/arm/diphda/index.rst
++++ b/docs/plat/arm/corstone1000/index.rst
+@@ -1,7 +1,7 @@
+-Diphda Platform
++Corstone1000 Platform
+ ==========================
+ 
+-Some of the features of the Diphda platform referenced in TF-A include:
++Some of the features of the Corstone1000 platform referenced in TF-A include:
+ 
+ - Cortex-A35 application processor (64-bit mode)
+ - Secure Enclave
+@@ -37,7 +37,7 @@ Build Procedure (TF-A only)
+       CC=aarch64-none-elf-gcc \
+       V=1 \
+       BUILD_BASE=<path to the build folder> \
+-      PLAT=diphda \
++      PLAT=corstone1000 \
+       SPD=spmd \
+       SPMD_SPM_AT_SEL2=0 \
+       DEBUG=1 \
+diff --git a/docs/plat/arm/index.rst b/docs/plat/arm/index.rst
+index c834f6ae70..23c561ff57 100644
+--- a/docs/plat/arm/index.rst
++++ b/docs/plat/arm/index.rst
+@@ -12,7 +12,7 @@ Arm Development Platforms
+    arm_fpga/index
+    arm-build-options
+    morello/index
+-   diphda/index
++   corstone1000/index
+ 
+ This chapter holds documentation related to Arm's development platforms,
+ including both software models (FVPs) and hardware development boards
+diff --git a/plat/arm/board/common/rotpk/arm_dev_rotpk.S b/plat/arm/board/common/rotpk/arm_dev_rotpk.S
+index 38f91fe5f8..125ddf67c7 100644
+--- a/plat/arm/board/common/rotpk/arm_dev_rotpk.S
++++ b/plat/arm/board/common/rotpk/arm_dev_rotpk.S
+@@ -4,7 +4,7 @@
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+ 
+-/* diphda platform provides custom values for the macros defined in
++/* corstone1000 platform provides custom values for the macros defined in
+  * arm_def.h , so only platform_def.h needs to be included
+  */
+ #if !defined(TARGET_PLATFORM_FVP) && !defined(TARGET_PLATFORM_FPGA)
+diff --git a/plat/arm/board/diphda/common/diphda_bl2_mem_params_desc.c b/plat/arm/board/corstone1000/common/corstone1000_bl2_mem_params_desc.c
+similarity index 92%
+rename from plat/arm/board/diphda/common/diphda_bl2_mem_params_desc.c
+rename to plat/arm/board/corstone1000/common/corstone1000_bl2_mem_params_desc.c
+index 916c868d21..7baa82d31b 100644
+--- a/plat/arm/board/diphda/common/diphda_bl2_mem_params_desc.c
++++ b/plat/arm/board/corstone1000/common/corstone1000_bl2_mem_params_desc.c
+@@ -44,7 +44,7 @@ static bl_mem_params_node_t bl2_mem_params_descs[] = {
+ 		SET_STATIC_PARAM_HEAD(ep_info, PARAM_EP,
+ 			VERSION_2, entry_point_info_t, SECURE | EXECUTABLE),
+ 		.ep_info.pc = BL32_BASE,
+-			.ep_info.args.arg0 = DIPHDA_TOS_FW_CONFIG_BASE,
++			.ep_info.args.arg0 = CORSTONE1000_TOS_FW_CONFIG_BASE,
+ 		SET_STATIC_PARAM_HEAD(image_info, PARAM_EP,
+ 			VERSION_2, image_info_t, 0),
+ 		.image_info.image_base = BL32_BASE,
+@@ -56,9 +56,9 @@ static bl_mem_params_node_t bl2_mem_params_descs[] = {
+ 	/* Fill TOS_FW_CONFIG related information */
+ 	{
+ 		.image_id = TOS_FW_CONFIG_ID,
+-		.image_info.image_base = DIPHDA_TOS_FW_CONFIG_BASE,
+-		.image_info.image_max_size = DIPHDA_TOS_FW_CONFIG_LIMIT - \
+-			DIPHDA_TOS_FW_CONFIG_BASE,
++		.image_info.image_base = CORSTONE1000_TOS_FW_CONFIG_BASE,
++		.image_info.image_max_size = CORSTONE1000_TOS_FW_CONFIG_LIMIT - \
++			CORSTONE1000_TOS_FW_CONFIG_BASE,
+ 		SET_STATIC_PARAM_HEAD(ep_info, PARAM_IMAGE_BINARY,
+ 			VERSION_2, entry_point_info_t, SECURE | NON_EXECUTABLE),
+ 		SET_STATIC_PARAM_HEAD(image_info, PARAM_IMAGE_BINARY,
+diff --git a/plat/arm/board/diphda/common/diphda_err.c b/plat/arm/board/corstone1000/common/corstone1000_err.c
+similarity index 89%
+rename from plat/arm/board/diphda/common/diphda_err.c
+rename to plat/arm/board/corstone1000/common/corstone1000_err.c
+index 89a3b8249c..5f8e7da437 100644
+--- a/plat/arm/board/diphda/common/diphda_err.c
++++ b/plat/arm/board/corstone1000/common/corstone1000_err.c
+@@ -7,7 +7,7 @@
+ #include <plat/arm/common/plat_arm.h>
+ 
+ /*
+- * diphda error handler
++ * corstone1000 error handler
+  */
+ void __dead2 plat_arm_error_handler(int err)
+ {
+diff --git a/plat/arm/board/diphda/common/diphda_helpers.S b/plat/arm/board/corstone1000/common/corstone1000_helpers.S
+similarity index 94%
+rename from plat/arm/board/diphda/common/diphda_helpers.S
+rename to plat/arm/board/corstone1000/common/corstone1000_helpers.S
+index c9d2a88de9..87122270b0 100644
+--- a/plat/arm/board/diphda/common/diphda_helpers.S
++++ b/plat/arm/board/corstone1000/common/corstone1000_helpers.S
+@@ -29,7 +29,7 @@ endfunc plat_secondary_cold_boot_setup
+ 	 * unsigned long plat_get_my_entrypoint (void);
+ 	 *
+ 	 * Main job of this routine is to distinguish between a cold and warm
+-	 * boot. On diphda, this information can be queried from the power
++	 * boot. On corstone1000, this information can be queried from the power
+ 	 * controller. The Power Control SYS Status Register (PSYSR) indicates
+ 	 * the wake-up reason for the CPU.
+ 	 *
+@@ -61,7 +61,7 @@ func plat_is_my_cpu_primary
+ 	mrs	x0, mpidr_el1
+ 	mov_imm	x1, MPIDR_AFFINITY_MASK
+ 	and	x0, x0, x1
+-	cmp	x0, #DIPHDA_PRIMARY_CPU
++	cmp	x0, #CORSTONE1000_PRIMARY_CPU
+ 	cset	w0, eq
+ 	ret
+ endfunc plat_is_my_cpu_primary
+diff --git a/plat/arm/board/diphda/common/diphda_plat.c b/plat/arm/board/corstone1000/common/corstone1000_plat.c
+similarity index 92%
+rename from plat/arm/board/diphda/common/diphda_plat.c
+rename to plat/arm/board/corstone1000/common/corstone1000_plat.c
+index 28d15a59e6..7a38b0b2ee 100644
+--- a/plat/arm/board/diphda/common/diphda_plat.c
++++ b/plat/arm/board/corstone1000/common/corstone1000_plat.c
+@@ -21,12 +21,12 @@ const mmap_region_t plat_arm_mmap[] = {
+ 	ARM_MAP_SHARED_RAM,
+ 	ARM_MAP_NS_SHARED_RAM,
+ 	ARM_MAP_NS_DRAM1,
+-	DIPHDA_MAP_DEVICE,
+-	DIPHDA_EXTERNAL_FLASH,
++	CORSTONE1000_MAP_DEVICE,
++	CORSTONE1000_EXTERNAL_FLASH,
+ 	{0}
+ };
+ 
+-/* diphda only has one always-on power domain and there
++/* corstone1000 only has one always-on power domain and there
+  * is no power control present
+  */
+ void __init plat_arm_pwrc_setup(void)
+diff --git a/plat/arm/board/diphda/common/diphda_pm.c b/plat/arm/board/corstone1000/common/corstone1000_pm.c
+similarity index 100%
+rename from plat/arm/board/diphda/common/diphda_pm.c
+rename to plat/arm/board/corstone1000/common/corstone1000_pm.c
+diff --git a/plat/arm/board/diphda/common/diphda_security.c b/plat/arm/board/corstone1000/common/corstone1000_security.c
+similarity index 100%
+rename from plat/arm/board/diphda/common/diphda_security.c
+rename to plat/arm/board/corstone1000/common/corstone1000_security.c
+diff --git a/plat/arm/board/diphda/common/diphda_stack_protector.c b/plat/arm/board/corstone1000/common/corstone1000_stack_protector.c
+similarity index 100%
+rename from plat/arm/board/diphda/common/diphda_stack_protector.c
+rename to plat/arm/board/corstone1000/common/corstone1000_stack_protector.c
+diff --git a/plat/arm/board/diphda/common/diphda_topology.c b/plat/arm/board/corstone1000/common/corstone1000_topology.c
+similarity index 77%
+rename from plat/arm/board/diphda/common/diphda_topology.c
+rename to plat/arm/board/corstone1000/common/corstone1000_topology.c
+index 9dfd05d091..2a3b6913a1 100644
+--- a/plat/arm/board/diphda/common/diphda_topology.c
++++ b/plat/arm/board/corstone1000/common/corstone1000_topology.c
+@@ -7,8 +7,8 @@
+ #include <plat/arm/common/plat_arm.h>
+ #include <plat/common/platform.h>
+ 
+-/* The diphda power domain tree descriptor */
+-static unsigned char diphda_power_domain_tree_desc[PLAT_ARM_CLUSTER_COUNT
++/* The corstone1000 power domain tree descriptor */
++static unsigned char corstone1000_power_domain_tree_desc[PLAT_ARM_CLUSTER_COUNT
+ 							+ 2];
+ /*******************************************************************************
+  * This function dynamically constructs the topology according to
+@@ -22,13 +22,13 @@ const unsigned char *plat_get_power_domain_tree_desc(void)
+ 	 * The highest level is the system level. The next level is constituted
+ 	 * by clusters and then cores in clusters.
+ 	 */
+-	diphda_power_domain_tree_desc[0] = 1;
+-	diphda_power_domain_tree_desc[1] = PLAT_ARM_CLUSTER_COUNT;
++	corstone1000_power_domain_tree_desc[0] = 1;
++	corstone1000_power_domain_tree_desc[1] = PLAT_ARM_CLUSTER_COUNT;
+ 
+ 	for (i = 0; i < PLAT_ARM_CLUSTER_COUNT; i++)
+-		diphda_power_domain_tree_desc[i + 2] = PLATFORM_CORE_COUNT;
++		corstone1000_power_domain_tree_desc[i + 2] = PLATFORM_CORE_COUNT;
+ 
+-	return diphda_power_domain_tree_desc;
++	return corstone1000_power_domain_tree_desc;
+ }
+ 
+ /******************************************************************************
+diff --git a/plat/arm/board/diphda/common/diphda_trusted_boot.c b/plat/arm/board/corstone1000/common/corstone1000_trusted_boot.c
+similarity index 97%
+rename from plat/arm/board/diphda/common/diphda_trusted_boot.c
+rename to plat/arm/board/corstone1000/common/corstone1000_trusted_boot.c
+index ddb41faa6b..2e2e9475a5 100644
+--- a/plat/arm/board/diphda/common/diphda_trusted_boot.c
++++ b/plat/arm/board/corstone1000/common/corstone1000_trusted_boot.c
+@@ -38,7 +38,7 @@ int plat_get_rotpk_info(void *cookie, void **key_ptr, unsigned int *key_len,
+  */
+ int plat_get_nv_ctr(void *cookie, unsigned int *nv_ctr)
+ {
+-    *nv_ctr = DIPHDA_FW_NVCTR_VAL;
++    *nv_ctr = CORSTONE1000_FW_NVCTR_VAL;
+     return 0;
+ }
+ 
+diff --git a/plat/arm/board/diphda/common/fdts/diphda_spmc_manifest.dts b/plat/arm/board/corstone1000/common/fdts/corstone1000_spmc_manifest.dts
+similarity index 100%
+rename from plat/arm/board/diphda/common/fdts/diphda_spmc_manifest.dts
+rename to plat/arm/board/corstone1000/common/fdts/corstone1000_spmc_manifest.dts
+diff --git a/plat/arm/board/diphda/common/include/platform_def.h b/plat/arm/board/corstone1000/common/include/platform_def.h
+similarity index 89%
+rename from plat/arm/board/diphda/common/include/platform_def.h
+rename to plat/arm/board/corstone1000/common/include/platform_def.h
+index 37fd71b6aa..e36bb626ee 100644
+--- a/plat/arm/board/diphda/common/include/platform_def.h
++++ b/plat/arm/board/corstone1000/common/include/platform_def.h
+@@ -34,17 +34,17 @@
+ #define V2M_IOFPGA_UART0_CLK_IN_HZ		50000000
+ #define V2M_IOFPGA_UART1_CLK_IN_HZ		50000000
+ 
+-/* Core/Cluster/Thread counts for diphda */
+-#define DIPHDA_CLUSTER_COUNT			U(1)
+-#define DIPHDA_MAX_CPUS_PER_CLUSTER		U(4)
+-#define DIPHDA_MAX_PE_PER_CPU			U(1)
+-#define DIPHDA_PRIMARY_CPU			U(0)
++/* Core/Cluster/Thread counts for corstone1000 */
++#define CORSTONE1000_CLUSTER_COUNT			U(1)
++#define CORSTONE1000_MAX_CPUS_PER_CLUSTER		U(4)
++#define CORSTONE1000_MAX_PE_PER_CPU			U(1)
++#define CORSTONE1000_PRIMARY_CPU			U(0)
+ 
+-#define PLAT_ARM_CLUSTER_COUNT		DIPHDA_CLUSTER_COUNT
++#define PLAT_ARM_CLUSTER_COUNT		CORSTONE1000_CLUSTER_COUNT
+ 
+ #define PLATFORM_CORE_COUNT			(PLAT_ARM_CLUSTER_COUNT *      \
+-						DIPHDA_MAX_CPUS_PER_CLUSTER *  \
+-						DIPHDA_MAX_PE_PER_CPU)
++						CORSTONE1000_MAX_CPUS_PER_CLUSTER *  \
++						CORSTONE1000_MAX_PE_PER_CPU)
+ 
+ /* UART related constants */
+ #define PLAT_ARM_BOOT_UART_BASE		0x1a510000
+@@ -85,7 +85,7 @@
+  *
+  *             BL32 (optee-os)
+  *
+- * <DIPHDA_TOS_FW_CONFIG_BASE> = 0x20ae000
++ * <CORSTONE1000_TOS_FW_CONFIG_BASE> = 0x20ae000
+  *
+  *         partition size: 8 KB
+  *
+@@ -132,7 +132,7 @@
+ #define ARM_DRAM1_END				(ARM_DRAM1_BASE +	\
+ 						ARM_DRAM1_SIZE - 1)
+ 
+-/* DRAM1 and DRAM2 are the same for diphda */
++/* DRAM1 and DRAM2 are the same for corstone1000 */
+ #define ARM_DRAM2_BASE			ARM_DRAM1_BASE
+ #define ARM_DRAM2_SIZE			ARM_DRAM1_SIZE
+ #define ARM_DRAM2_END				ARM_DRAM1_END
+@@ -173,13 +173,13 @@
+ 						PLAT_ARM_MAX_BL31_SIZE)
+ #define BL31_LIMIT				BL2_SIGNATURE_BASE
+ 
+-#define DIPHDA_TOS_FW_CONFIG_BASE		(BL31_BASE - \
+-						DIPHDA_TOS_FW_CONFIG_SIZE)
+-#define DIPHDA_TOS_FW_CONFIG_SIZE		UL(0x00002000)  /* 8 KB */
+-#define DIPHDA_TOS_FW_CONFIG_LIMIT		BL31_BASE
++#define CORSTONE1000_TOS_FW_CONFIG_BASE		(BL31_BASE - \
++						CORSTONE1000_TOS_FW_CONFIG_SIZE)
++#define CORSTONE1000_TOS_FW_CONFIG_SIZE		UL(0x00002000)  /* 8 KB */
++#define CORSTONE1000_TOS_FW_CONFIG_LIMIT		BL31_BASE
+ 
+ #define BL32_BASE				ARM_BL_RAM_BASE
+-#define PLAT_ARM_MAX_BL32_SIZE		(DIPHDA_TOS_FW_CONFIG_BASE - \
++#define PLAT_ARM_MAX_BL32_SIZE		(CORSTONE1000_TOS_FW_CONFIG_BASE - \
+ 						BL32_BASE)     /* 688 KB */
+ #define BL32_LIMIT				(BL32_BASE + \
+ 						PLAT_ARM_MAX_BL32_SIZE)
+@@ -220,7 +220,7 @@
+ /*
+  * Define FW_CONFIG area base and limit. Leave enough space for BL2 meminfo.
+  * FW_CONFIG is intended to host the device tree. Currently, This area is not
+- * used because diphda platform doesn't use a device tree at TF-A level.
++ * used because corstone1000 platform doesn't use a device tree at TF-A level.
+  */
+ #define ARM_FW_CONFIG_BASE			(ARM_SHARED_RAM_BASE \
+ 						+ sizeof(meminfo_t))
+@@ -261,8 +261,8 @@
+ 
+ #define SYS_COUNTER_FREQ_IN_TICKS	UL(50000000) /* 50MHz */
+ 
+-#define DIPHDA_IRQ_TZ_WDOG			32
+-#define DIPHDA_IRQ_SEC_SYS_TIMER		34
++#define CORSTONE1000_IRQ_TZ_WDOG			32
++#define CORSTONE1000_IRQ_SEC_SYS_TIMER		34
+ 
+ #define PLAT_MAX_PWR_LVL			2
+ /*
+@@ -308,7 +308,7 @@
+ 
+ #define PLATFORM_STACK_SIZE			UL(0x440)
+ 
+-#define DIPHDA_EXTERNAL_FLASH			MAP_REGION_FLAT(	\
++#define CORSTONE1000_EXTERNAL_FLASH			MAP_REGION_FLAT(	\
+ 						PLAT_ARM_NVM_BASE,	\
+ 						PLAT_ARM_NVM_SIZE,	\
+ 						MT_DEVICE | MT_RO | MT_SECURE)
+@@ -356,11 +356,11 @@
+ 						ARM_FW_CONFIG_BASE),   \
+ 						MT_MEMORY | MT_RW | MT_SECURE)
+ 
+-#define DIPHDA_DEVICE_BASE			(0x1A000000)
+-#define DIPHDA_DEVICE_SIZE			(0x26000000)
+-#define DIPHDA_MAP_DEVICE			MAP_REGION_FLAT(	\
+-						DIPHDA_DEVICE_BASE,	\
+-						DIPHDA_DEVICE_SIZE,	\
++#define CORSTONE1000_DEVICE_BASE			(0x1A000000)
++#define CORSTONE1000_DEVICE_SIZE			(0x26000000)
++#define CORSTONE1000_MAP_DEVICE			MAP_REGION_FLAT(	\
++						CORSTONE1000_DEVICE_BASE,	\
++						CORSTONE1000_DEVICE_SIZE,	\
+ 						MT_DEVICE | MT_RW | MT_SECURE)
+ 
+ #define ARM_IRQ_SEC_PHY_TIMER			29
+@@ -406,9 +406,9 @@
+  */
+ #define PLAT_ARM_G1S_IRQ_PROPS(grp)	\
+ 	ARM_G1S_IRQ_PROPS(grp), \
+-	INTR_PROP_DESC(DIPHDA_IRQ_TZ_WDOG, GIC_HIGHEST_SEC_PRIORITY, \
++	INTR_PROP_DESC(CORSTONE1000_IRQ_TZ_WDOG, GIC_HIGHEST_SEC_PRIORITY, \
+ 		(grp), GIC_INTR_CFG_LEVEL), \
+-	INTR_PROP_DESC(DIPHDA_IRQ_SEC_SYS_TIMER, \
++	INTR_PROP_DESC(CORSTONE1000_IRQ_SEC_SYS_TIMER, \
+ 		GIC_HIGHEST_SEC_PRIORITY, (grp), GIC_INTR_CFG_LEVEL)
+ 
+ #define PLAT_ARM_G0_IRQ_PROPS(grp)	ARM_G0_IRQ_PROPS(grp)
+diff --git a/plat/arm/board/diphda/include/plat_macros.S b/plat/arm/board/corstone1000/include/plat_macros.S
+similarity index 100%
+rename from plat/arm/board/diphda/include/plat_macros.S
+rename to plat/arm/board/corstone1000/include/plat_macros.S
+diff --git a/plat/arm/board/corstone1000/platform.mk b/plat/arm/board/corstone1000/platform.mk
+new file mode 100644
+index 0000000000..93e2ea0826
+--- /dev/null
++++ b/plat/arm/board/corstone1000/platform.mk
+@@ -0,0 +1,83 @@
++#
++# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++#
++# SPDX-License-Identifier: BSD-3-Clause
++#
++
++# Making sure the corstone1000 platform type is specified
++ifeq ($(filter ${TARGET_PLATFORM}, fpga fvp),)
++	$(error TARGET_PLATFORM must be fpga or fvp)
++endif
++
++CORSTONE1000_CPU_LIBS	+=lib/cpus/aarch64/cortex_a35.S
++
++PLAT_INCLUDES		:=	-Iplat/arm/board/corstone1000/common/include	\
++				-Iplat/arm/board/corstone1000/include		\
++				-Iinclude/plat/arm/common			\
++				-Iinclude/plat/arm/css/common/aarch64
++
++
++CORSTONE1000_FW_NVCTR_VAL	:=	255
++TFW_NVCTR_VAL		:=	${CORSTONE1000_FW_NVCTR_VAL}
++NTFW_NVCTR_VAL		:=	${CORSTONE1000_FW_NVCTR_VAL}
++
++override NEED_BL1	:=	no
++
++override NEED_BL2	:=	yes
++FIP_BL2_ARGS := tb-fw
++
++override NEED_BL2U	:=	no
++override NEED_BL31	:=	yes
++NEED_BL32		:=	yes
++override NEED_BL33	:=	yes
++
++# Include GICv2 driver files
++include drivers/arm/gic/v2/gicv2.mk
++
++CORSTONE1000_GIC_SOURCES	:=	${GICV2_SOURCES}			\
++				plat/common/plat_gicv2.c		\
++				plat/arm/common/arm_gicv2.c
++
++
++BL2_SOURCES		+=	plat/arm/board/corstone1000/common/corstone1000_security.c		\
++				plat/arm/board/corstone1000/common/corstone1000_err.c		\
++				plat/arm/board/corstone1000/common/corstone1000_trusted_boot.c	\
++				lib/utils/mem_region.c					\
++				plat/arm/board/corstone1000/common/corstone1000_helpers.S		\
++				plat/arm/board/corstone1000/common/corstone1000_plat.c		\
++				plat/arm/board/corstone1000/common/corstone1000_bl2_mem_params_desc.c \
++				${CORSTONE1000_CPU_LIBS}					\
++
++
++BL31_SOURCES	+=	drivers/cfi/v2m/v2m_flash.c				\
++			lib/utils/mem_region.c					\
++			plat/arm/board/corstone1000/common/corstone1000_helpers.S		\
++			plat/arm/board/corstone1000/common/corstone1000_topology.c		\
++			plat/arm/board/corstone1000/common/corstone1000_security.c		\
++			plat/arm/board/corstone1000/common/corstone1000_plat.c		\
++			plat/arm/board/corstone1000/common/corstone1000_pm.c		\
++			${CORSTONE1000_CPU_LIBS}					\
++			${CORSTONE1000_GIC_SOURCES}
++
++ifneq (${ENABLE_STACK_PROTECTOR},0)
++	ifneq (${ENABLE_STACK_PROTECTOR},none)
++		CORSTONE1000_SECURITY_SOURCES := plat/arm/board/corstone1000/common/corstone1000_stack_protector.c
++		BL2_SOURCES += ${CORSTONE1000_SECURITY_SOURCES}
++		BL31_SOURCES += ${CORSTONE1000_SECURITY_SOURCES}
++	endif
++endif
++
++FDT_SOURCES		+=	plat/arm/board/corstone1000/common/fdts/corstone1000_spmc_manifest.dts
++CORSTONE1000_TOS_FW_CONFIG	:=	${BUILD_PLAT}/fdts/corstone1000_spmc_manifest.dtb
++
++# Add the SPMC manifest to FIP and specify the same to certtool
++$(eval $(call TOOL_ADD_PAYLOAD,${CORSTONE1000_TOS_FW_CONFIG},--tos-fw-config,${CORSTONE1000_TOS_FW_CONFIG}))
++
++# Adding TARGET_PLATFORM as a GCC define (-D option)
++$(eval $(call add_define,TARGET_PLATFORM_$(call uppercase,${TARGET_PLATFORM})))
++
++# Adding CORSTONE1000_FW_NVCTR_VAL as a GCC define (-D option)
++$(eval $(call add_define,CORSTONE1000_FW_NVCTR_VAL))
++
++include plat/arm/common/arm_common.mk
++include plat/arm/board/common/board_common.mk
+diff --git a/plat/arm/board/diphda/platform.mk b/plat/arm/board/diphda/platform.mk
+deleted file mode 100644
+index 8b89cee7ed..0000000000
+--- a/plat/arm/board/diphda/platform.mk
++++ /dev/null
+@@ -1,83 +0,0 @@
+-#
+-# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
+-#
+-# SPDX-License-Identifier: BSD-3-Clause
+-#
+-
+-# Making sure the diphda platform type is specified
+-ifeq ($(filter ${TARGET_PLATFORM}, fpga fvp),)
+-	$(error TARGET_PLATFORM must be fpga or fvp)
+-endif
+-
+-DIPHDA_CPU_LIBS	+=lib/cpus/aarch64/cortex_a35.S
+-
+-PLAT_INCLUDES		:=	-Iplat/arm/board/diphda/common/include	\
+-				-Iplat/arm/board/diphda/include		\
+-				-Iinclude/plat/arm/common			\
+-				-Iinclude/plat/arm/css/common/aarch64
+-
+-
+-DIPHDA_FW_NVCTR_VAL	:=	255
+-TFW_NVCTR_VAL		:=	${DIPHDA_FW_NVCTR_VAL}
+-NTFW_NVCTR_VAL		:=	${DIPHDA_FW_NVCTR_VAL}
+-
+-override NEED_BL1	:=	no
+-
+-override NEED_BL2	:=	yes
+-FIP_BL2_ARGS := tb-fw
+-
+-override NEED_BL2U	:=	no
+-override NEED_BL31	:=	yes
+-NEED_BL32		:=	yes
+-override NEED_BL33	:=	yes
+-
+-# Include GICv2 driver files
+-include drivers/arm/gic/v2/gicv2.mk
+-
+-DIPHDA_GIC_SOURCES	:=	${GICV2_SOURCES}			\
+-				plat/common/plat_gicv2.c		\
+-				plat/arm/common/arm_gicv2.c
+-
+-
+-BL2_SOURCES		+=	plat/arm/board/diphda/common/diphda_security.c		\
+-				plat/arm/board/diphda/common/diphda_err.c		\
+-				plat/arm/board/diphda/common/diphda_trusted_boot.c	\
+-				lib/utils/mem_region.c					\
+-				plat/arm/board/diphda/common/diphda_helpers.S		\
+-				plat/arm/board/diphda/common/diphda_plat.c		\
+-				plat/arm/board/diphda/common/diphda_bl2_mem_params_desc.c \
+-				${DIPHDA_CPU_LIBS}					\
+-
+-
+-BL31_SOURCES	+=	drivers/cfi/v2m/v2m_flash.c				\
+-			lib/utils/mem_region.c					\
+-			plat/arm/board/diphda/common/diphda_helpers.S		\
+-			plat/arm/board/diphda/common/diphda_topology.c		\
+-			plat/arm/board/diphda/common/diphda_security.c		\
+-			plat/arm/board/diphda/common/diphda_plat.c		\
+-			plat/arm/board/diphda/common/diphda_pm.c		\
+-			${DIPHDA_CPU_LIBS}					\
+-			${DIPHDA_GIC_SOURCES}
+-
+-ifneq (${ENABLE_STACK_PROTECTOR},0)
+-	ifneq (${ENABLE_STACK_PROTECTOR},none)
+-		DIPHDA_SECURITY_SOURCES := plat/arm/board/diphda/common/diphda_stack_protector.c
+-		BL2_SOURCES += ${DIPHDA_SECURITY_SOURCES}
+-		BL31_SOURCES += ${DIPHDA_SECURITY_SOURCES}
+-	endif
+-endif
+-
+-FDT_SOURCES		+=	plat/arm/board/diphda/common/fdts/diphda_spmc_manifest.dts
+-DIPHDA_TOS_FW_CONFIG	:=	${BUILD_PLAT}/fdts/diphda_spmc_manifest.dtb
+-
+-# Add the SPMC manifest to FIP and specify the same to certtool
+-$(eval $(call TOOL_ADD_PAYLOAD,${DIPHDA_TOS_FW_CONFIG},--tos-fw-config,${DIPHDA_TOS_FW_CONFIG}))
+-
+-# Adding TARGET_PLATFORM as a GCC define (-D option)
+-$(eval $(call add_define,TARGET_PLATFORM_$(call uppercase,${TARGET_PLATFORM})))
+-
+-# Adding DIPHDA_FW_NVCTR_VAL as a GCC define (-D option)
+-$(eval $(call add_define,DIPHDA_FW_NVCTR_VAL))
+-
+-include plat/arm/common/arm_common.mk
+-include plat/arm/board/common/board_common.mk
+-- 
+2.33.0
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0002-plat-arm-corstone1000-made-changes-to-accommodate-3M.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0002-plat-arm-corstone1000-made-changes-to-accommodate-3M.patch
new file mode 100644
index 0000000..ee62ff0
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0002-plat-arm-corstone1000-made-changes-to-accommodate-3M.patch
@@ -0,0 +1,201 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
+From bf95f27e300e962140a5dec45c2b1727c0829511 Mon Sep 17 00:00:00 2001
+From: "Arpita S.K" <Arpita.S.K@arm.com>
+Date: Wed, 13 Oct 2021 14:49:26 +0530
+Subject: [PATCH] plat/arm: corstone1000: made changes to accommodate 3MB for
+ optee
+
+* These changes are required to accommodate 3MB for OP-TEE and this
+is required for SP's part of optee
+* Added size macro's for better readability of the code
+* Moved uboot execution memory from CVM to DDR
+
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+---
+ include/plat/common/common_def.h              | 25 ++++++++
+ .../common/corstone1000_bl2_mem_params_desc.c |  7 +--
+ .../common/include/platform_def.h             | 59 +++++++++++--------
+ 3 files changed, 64 insertions(+), 27 deletions(-)
+
+diff --git a/include/plat/common/common_def.h b/include/plat/common/common_def.h
+index 14ae603b9b..5bb58692ef 100644
+--- a/include/plat/common/common_def.h
++++ b/include/plat/common/common_def.h
+@@ -12,6 +12,31 @@
+ #include <lib/utils_def.h>
+ #include <lib/xlat_tables/xlat_tables_defs.h>
+ 
++#define SZ_1K                          0x00000400
++#define SZ_2K                          0x00000800
++#define SZ_4K                          0x00001000
++#define SZ_8K                          0x00002000
++#define SZ_16K                         0x00004000
++#define SZ_32K                         0x00008000
++#define SZ_64K                         0x00010000
++#define SZ_128K                                0x00020000
++#define SZ_256K                                0x00040000
++#define SZ_512K                                0x00080000
++
++#define SZ_1M                          0x00100000
++#define SZ_2M                          0x00200000
++#define SZ_4M                          0x00400000
++#define SZ_8M                          0x00800000
++#define SZ_16M                         0x01000000
++#define SZ_32M                         0x02000000
++#define SZ_64M                         0x04000000
++#define SZ_128M                                0x08000000
++#define SZ_256M                                0x10000000
++#define SZ_512M                                0x20000000
++
++#define SZ_1G                          0x40000000
++#define SZ_2G                          0x80000000
++
+ /******************************************************************************
+  * Required platform porting definitions that are expected to be common to
+  * all platforms
+diff --git a/plat/arm/board/corstone1000/common/corstone1000_bl2_mem_params_desc.c b/plat/arm/board/corstone1000/common/corstone1000_bl2_mem_params_desc.c
+index 7baa82d31b..6e90936a14 100644
+--- a/plat/arm/board/corstone1000/common/corstone1000_bl2_mem_params_desc.c
++++ b/plat/arm/board/corstone1000/common/corstone1000_bl2_mem_params_desc.c
+@@ -71,13 +71,12 @@ static bl_mem_params_node_t bl2_mem_params_descs[] = {
+ 		.image_id = BL33_IMAGE_ID,
+ 		SET_STATIC_PARAM_HEAD(ep_info, PARAM_EP,
+ 			VERSION_2, entry_point_info_t, NON_SECURE | EXECUTABLE),
+-		.ep_info.pc = PLAT_ARM_NS_IMAGE_BASE,
++		.ep_info.pc = BL33_BASE,
+ 
+ 		SET_STATIC_PARAM_HEAD(image_info, PARAM_EP,
+ 			VERSION_2, image_info_t, 0),
+-		.image_info.image_base = PLAT_ARM_NS_IMAGE_BASE,
+-		.image_info.image_max_size = ARM_DRAM1_BASE + ARM_DRAM1_SIZE
+-			- PLAT_ARM_NS_IMAGE_BASE,
++		.image_info.image_base = BL33_BASE,
++		.image_info.image_max_size = BL33_LIMIT - BL33_BASE,
+ 
+ 		.next_handoff_image_id = INVALID_IMAGE_ID,
+ 	},
+diff --git a/plat/arm/board/corstone1000/common/include/platform_def.h b/plat/arm/board/corstone1000/common/include/platform_def.h
+index e36bb626ee..a0ac0fe758 100644
+--- a/plat/arm/board/corstone1000/common/include/platform_def.h
++++ b/plat/arm/board/corstone1000/common/include/platform_def.h
+@@ -119,7 +119,7 @@
+  *
+  * <ARM_NS_SHARED_RAM_BASE> = <ARM_TRUSTED_SRAM_BASE> + 1 MB
+  *
+- *         partition size: 3 MB
++ *         partition size: 512 KB
+  *
+  *         content:
+  *
+@@ -128,13 +128,13 @@
+ 
+ /* DDR memory */
+ #define ARM_DRAM1_BASE			UL(0x80000000)
+-#define ARM_DRAM1_SIZE			UL(0x80000000)
++#define ARM_DRAM1_SIZE                 (SZ_2G) /* 2GB*/
+ #define ARM_DRAM1_END				(ARM_DRAM1_BASE +	\
+ 						ARM_DRAM1_SIZE - 1)
+ 
+ /* DRAM1 and DRAM2 are the same for corstone1000 */
+-#define ARM_DRAM2_BASE			ARM_DRAM1_BASE
+-#define ARM_DRAM2_SIZE			ARM_DRAM1_SIZE
++#define ARM_DRAM2_BASE                         ARM_DRAM1_BASE
++#define ARM_DRAM2_SIZE                         ARM_DRAM1_SIZE
+ #define ARM_DRAM2_END				ARM_DRAM1_END
+ 
+ #define ARM_NS_DRAM1_BASE			ARM_DRAM1_BASE
+@@ -144,23 +144,31 @@
+ 
+ /* The first 8 KB of Trusted SRAM are used as shared memory */
+ #define ARM_TRUSTED_SRAM_BASE			UL(0x02000000)
+-#define ARM_SHARED_RAM_SIZE			UL(0x00002000)  /* 8 KB */
++#define ARM_SHARED_RAM_SIZE                    (SZ_8K)  /* 8 KB */
+ #define ARM_SHARED_RAM_BASE			ARM_TRUSTED_SRAM_BASE
+ 
+ /* The remaining Trusted SRAM is used to load the BL images */
++#define TOTAL_SRAM_SIZE                                (SZ_4M) /* 4 MB */
+ 
+-#define PLAT_ARM_TRUSTED_SRAM_SIZE		UL(0x00100000)  /* 1 MB */
++/* Last 512KB of CVM is allocated for shared RAM
++ * as an example openAMP */
++#define ARM_NS_SHARED_RAM_SIZE                 (512 * SZ_1K)
+ 
+-#define PLAT_ARM_MAX_BL2_SIZE			UL(0x0002d000)  /* 180 KB */
++#define PLAT_ARM_TRUSTED_SRAM_SIZE             (TOTAL_SRAM_SIZE - \
++                                                ARM_NS_SHARED_RAM_SIZE - \
++                                                ARM_SHARED_RAM_SIZE)
+ 
+-#define PLAT_ARM_MAX_BL31_SIZE		UL(0x00023000)  /* 140 KB */
++#define PLAT_ARM_MAX_BL2_SIZE                  (180 * SZ_1K)  /* 180 KB */
+ 
+-#define ARM_BL_RAM_BASE			(ARM_SHARED_RAM_BASE +	\
+-						ARM_SHARED_RAM_SIZE)
+-#define ARM_BL_RAM_SIZE			(PLAT_ARM_TRUSTED_SRAM_SIZE -	\
+-						ARM_SHARED_RAM_SIZE)
++#define PLAT_ARM_MAX_BL31_SIZE                  (140 * SZ_1K)  /* 140 KB */
++
++#define ARM_BL_RAM_BASE                                (ARM_SHARED_RAM_BASE +  \
++                                                        ARM_SHARED_RAM_SIZE)
++#define ARM_BL_RAM_SIZE                                (PLAT_ARM_TRUSTED_SRAM_SIZE - \
++                                                        ARM_SHARED_RAM_SIZE)
++
++#define BL2_SIGNATURE_SIZE                     (SZ_4K)  /* 4 KB */
+ 
+-#define BL2_SIGNATURE_SIZE			UL(0x00001000)  /* 4 KB */
+ #define BL2_SIGNATURE_BASE			(BL2_LIMIT - \
+ 						PLAT_ARM_MAX_BL2_SIZE)
+ #define BL2_BASE				(BL2_LIMIT - \
+@@ -175,14 +183,15 @@
+ 
+ #define CORSTONE1000_TOS_FW_CONFIG_BASE		(BL31_BASE - \
+ 						CORSTONE1000_TOS_FW_CONFIG_SIZE)
+-#define CORSTONE1000_TOS_FW_CONFIG_SIZE		UL(0x00002000)  /* 8 KB */
++#define CORSTONE1000_TOS_FW_CONFIG_SIZE              (SZ_8K)  /* 8 KB */
+ #define CORSTONE1000_TOS_FW_CONFIG_LIMIT		BL31_BASE
+ 
+ #define BL32_BASE				ARM_BL_RAM_BASE
+-#define PLAT_ARM_MAX_BL32_SIZE		(CORSTONE1000_TOS_FW_CONFIG_BASE - \
+-						BL32_BASE)     /* 688 KB */
+-#define BL32_LIMIT				(BL32_BASE + \
+-						PLAT_ARM_MAX_BL32_SIZE)
++#define PLAT_ARM_MAX_BL32_SIZE                 (CORSTONE1000_TOS_FW_CONFIG_BASE - \
++                                                BL32_BASE)
++
++#define BL32_LIMIT                             (BL32_BASE + \
++                                                PLAT_ARM_MAX_BL32_SIZE)
+ 
+ /* SPD_spmd settings */
+ 
+@@ -191,10 +200,14 @@
+ 
+ /* NS memory */
+ 
+-/* The last 3 MB of the SRAM is allocated to the non secure area */
+-#define ARM_NS_SHARED_RAM_BASE		(ARM_TRUSTED_SRAM_BASE + \
+-						PLAT_ARM_TRUSTED_SRAM_SIZE)
+-#define ARM_NS_SHARED_RAM_SIZE		UL(0x00300000)  /* 3 MB */
++/* The last 512KB of the SRAM is allocated as shared memory */
++#define ARM_NS_SHARED_RAM_BASE         (ARM_TRUSTED_SRAM_BASE + TOTAL_SRAM_SIZE - \
++                                        (PLAT_ARM_MAX_BL31_SIZE + \
++                                         PLAT_ARM_MAX_BL32_SIZE))
++
++#define BL33_BASE                      ARM_DRAM1_BASE
++#define PLAT_ARM_MAX_BL33_SIZE         (12 * SZ_1M) /* 12 MB*/
++#define BL33_LIMIT                     (ARM_DRAM1_BASE + PLAT_ARM_MAX_BL33_SIZE)
+ 
+ /* end of the definition of SRAM memory layout */
+ 
+@@ -204,7 +217,7 @@
+ #define PLAT_ARM_FIP_MAX_SIZE			UL(0x1ff000)  /* 1.996 MB */
+ 
+ #define PLAT_ARM_NVM_BASE			V2M_FLASH0_BASE
+-#define PLAT_ARM_NVM_SIZE			UL(0x02000000)  /* 32 MB */
++#define PLAT_ARM_NVM_SIZE			(SZ_32M)  /* 32 MB */
+ 
+ #define PLAT_ARM_FLASH_IMAGE_BASE		PLAT_ARM_FIP_BASE
+ #define PLAT_ARM_FLASH_IMAGE_MAX_SIZE		PLAT_ARM_FIP_MAX_SIZE
+-- 
+2.33.0
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc
new file mode 100644
index 0000000..44f2696
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc
@@ -0,0 +1,47 @@
+# Corstone1000 64-bit machines specific TFA support
+
+COMPATIBLE_MACHINE = "(corstone1000)"
+
+SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa"
+
+# TF-A master branch with all Corstone1000 patches merged
+SRCREV_tfa = "459b24451a0829460783ce8dfa15561e36d901d8"
+PV .= "+git${SRCREV_tfa}"
+
+LIC_FILES_CHKSUM="file://docs/license.rst;md5=b2c740efedc159745b9b31f88ff03dde file://mbedtls/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+FILESEXTRAPATHS:prepend := "${THISDIR}/files/corstone1000:"
+SRC_URI:append = " \
+                 file://0001-Rename-Diphda-to-corstone1000.patch \
+                 file://0002-plat-arm-corstone1000-made-changes-to-accommodate-3M.patch \
+                 "
+
+TFA_DEBUG = "1"
+TFA_UBOOT = "1"
+TFA_MBEDTLS = "1"
+TFA_BUILD_TARGET = "bl2 bl31 fip"
+
+# Enabling Secure-EL1 Payload Dispatcher (SPD)
+TFA_SPD = "spmd"
+# Cortex-A35 supports Armv8.0-A (no S-EL2 execution state).
+# So, the SPD SPMC component should run at the S-EL1 execution state
+TFA_SPMD_SPM_AT_SEL2 = "0"
+
+# BL2 loads BL32 (optee). So, optee needs to be built first:
+DEPENDS += "optee-os"
+
+EXTRA_OEMAKE:append = " \
+                        ARCH=aarch64 \
+                        TARGET_PLATFORM=${TFA_TARGET_PLATFORM} \
+                        ENABLE_STACK_PROTECTOR=strong \
+                        ENABLE_PIE=1 \
+                        BL2_AT_EL3=1 \
+                        CREATE_KEYS=1 \
+                        GENERATE_COT=1 \
+                        TRUSTED_BOARD_BOOT=1 \
+                        COT=tbbr \
+                        ARM_ROTPK_LOCATION=devel_rsa  \
+                        ROT_KEY=plat/arm/board/common/rotpk/arm_rotprivk_rsa.pem \
+                        BL32=${RECIPE_SYSROOT}/lib/firmware/tee-pager_v2.bin \
+                        LOG_LEVEL=50 \
+                        "
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.5.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.5.bbappend
index ea39dbd..659ba35 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.5.bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.5.bbappend
@@ -3,6 +3,7 @@
 MACHINE_TFA_REQUIRE ?= ""
 MACHINE_TFA_REQUIRE:corstone500 = "trusted-firmware-a-corstone500.inc"
 MACHINE_TFA_REQUIRE:corstone700 = "trusted-firmware-a-corstone700.inc"
+MACHINE_TFA_REQUIRE:corstone1000 = "trusted-firmware-a-corstone1000.inc"
 MACHINE_TFA_REQUIRE:fvp-base = "trusted-firmware-a-fvp.inc"
 MACHINE_TFA_REQUIRE:fvp-base-arm32 = "trusted-firmware-a-fvp-arm32.inc"
 MACHINE_TFA_REQUIRE:juno = "trusted-firmware-a-juno.inc"
-- 
2.17.1


