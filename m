Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E3C0D21699
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 15:25:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46102.1764861917493574310
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 Dec 2025 07:25:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98E9D339;
	Thu,  4 Dec 2025 07:25:09 -0800 (PST)
Received: from LXKV206JHX.arm.com (unknown [10.57.43.122])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 112F33F59E;
	Thu,  4 Dec 2025 07:25:15 -0800 (PST)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Michael Safwat <michael.safwat@arm.com>,
	Harsimran Singh Tungal <harsimransingh.tungal@arm.com>,
	Frazer Carsley <frazer.carsley@arm.com>
Subject: [PATCH 4/6] =?UTF-8?q?arm-bsp/tf-a:corstone1000:=20Add=20Cortex?= =?UTF-8?q?=E2=80=91A320=20support?=
Date: Thu,  4 Dec 2025 15:19:51 +0000
Message-ID: <20251204152500.78818-5-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251204152500.78818-1-hugues.kambampiana@arm.com>
References: <20251204152500.78818-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 04 Dec 2025 15:25:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6783

From: Michael Safwat <michael.safwat@arm.com>

Enable Trusted Firmware-A for Corstone-1000 platforms with Cortex-A320 an=
d
switch the interrupt controller from GICv2/GIC-400 to GICv3/GIC-600.

**Platform/feature enablement**

* Map Ethos-U85 NPU registers (`0x1A050000`, 16 KiB) and its SRAM region
  (`0x02400000`, 4 MiB) into Normal World
  (`MT_DEVICE | MT_RW | MT_NS` / `MT_MEMORY | MT_RW | MT_NS`).
* Force Cortex-A320 feature selection: enable Armv9 features, disable
  Cortex-A35 errata, and select the `cortexa320` override in
  `trusted-firmware-a-corstone1000.inc`.
* Build TF-A-Tests with `CORSTONE1000_CORTEX_A320=3D1` to skip non-applic=
able
  FF-A, PSCI, and CPU-extension tests on Cortex-A320.

**GICv3/GIC-600 transition (A320 builds)**

* Update `plat_my_core_pos()` and `plat_arm_calc_core_pos()` to compute t=
he
  linear core position using the Cortex-A320 MPIDR_EL1 affinity layout.
* Add an A320-specific core-position routine in assembly, guarded by
  `CORSTONE1000_CORTEX_A320`.
* Switch to the GICv3 driver with GIC-600 extensions:
  * Update platform GIC base addresses to the GIC-600 layout.
  * Use GICv3 APIs; set `USE_GIC_DRIVER=3D3`, `GICV3_SUPPORT_GIC600=3D1`,
    and `GIC_ENABLE_V4_EXTN=3D1`.
* Keep conditional GIC versioning so Cortex-A35 continues to use GICv2/GI=
C-400.

These changes ensure correct GIC configuration and reliable secondary-cor=
e
bring-up on Cortex-A320 while preserving existing Cortex-A35 behavior.

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
Signed-off-by: Michael Safwat <michael.safwat@arm.com>
---
 ...corstone1000-add-Cortex-A320-support.patch | 241 ++++++++++++++++++
 ...corstone1000-Add-Cortex-A320-support.patch | 163 ++++++++++++
 .../trusted-firmware-a/tf-a-tests_%.bbappend  |   9 +
 .../trusted-firmware-a-corstone1000.inc       |  30 ++-
 4 files changed, 440 insertions(+), 3 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0002-plat-corstone1000-add-Cortex-A320-support.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/tf-a-tests/0002-plat-corstone1000-Add-Cortex-A320-support.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0002-plat-corstone1000-add-Cortex-A320-support.patch b/meta-arm-bsp/re=
cipes-bsp/trusted-firmware-a/files/corstone1000/0002-plat-corstone1000-ad=
d-Cortex-A320-support.patch
new file mode 100644
index 00000000..1a9f24e3
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0002=
-plat-corstone1000-add-Cortex-A320-support.patch
@@ -0,0 +1,241 @@
+From 977f06e10e549d01a641a62a1d4850a06d6f0df4 Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Thu, 7 Aug 2025 10:05:02 +0000
+Subject: [PATCH] plat: corstone1000: add Cortex-A320 support
+
+Introduce `CORSTONE1000_CORTEX_A320` to enable Cortex-A320 on
+Corstone-1000 while keeping Cortex-A35 as the default. When the
+define is enabled, the build switches from `cortex_a35.S` to
+`cortex_a320.S`, maintaining compatibility with existing A35-based
+designs.
+
+Also add Normal-World mappings for the Ethos-U85 NPU and its SRAM
+on Cortex-A320 platforms so U-Boot and other non-secure software
+can safely access these regions:
+
+* **Ethos-U85 registers**: base `0x1A050000`, size `0x00004000` (16 KB),
+  attrs `MT_DEVICE | MT_RW | MT_NS`
+* **Non-secure SRAM**: base `0x02400000`, size `0x00400000` (4 MB),
+  attrs `MT_MEMORY | MT_RW | MT_NS`
+
+Enable GICv3 with GIC-600 when building for Cortex-A320 (retain
+GICv2/GIC-400 for Cortex-A35):
+
+* Update `plat_my_core_pos()` and `plat_arm_calc_core_pos()` to use
+  the Cortex-A320 MPIDR_EL1 affinity layout.
+* Add an A320-specific core-position routine in assembly guarded by
+  `CORSTONE1000_CORTEX_A320`.
+* Switch to the GICv3 driver with GIC-600 extensions: update GIC base
+  addresses, use GICv3 APIs, and set `USE_GIC_DRIVER=3D3`,
+  `GICV3_SUPPORT_GIC600=3D1`, `GIC_ENABLE_V4_EXTN=3D1`.
+
+These changes prepare the platform for Cortex-A320 integration and
+ensure correct GIC configuration and secondary-core bring-up, while
+preserving A35 behavior.
+
+Upstream-Status: Submitted (https://review.trustedfirmware.org/c/TF-A/tr=
usted-firmware-a/+/45729)
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Signed-off-by: Michael Safwat <michael.safwat@arm.com>
+---
+ .../common/corstone1000_helpers.S             | 35 ++++++++++++++++++-
+ .../corstone1000/common/corstone1000_plat.c   |  4 +++
+ .../corstone1000/common/corstone1000_pm.c     |  8 +++++
+ .../common/include/platform_def.h             | 28 ++++++++++++++-
+ plat/arm/board/corstone1000/platform.mk       | 11 ++++++
+ 5 files changed, 84 insertions(+), 2 deletions(-)
+
+diff --git a/plat/arm/board/corstone1000/common/corstone1000_helpers.S b=
/plat/arm/board/corstone1000/common/corstone1000_helpers.S
+index a4ca9fe98..665dbc61a 100644
+--- a/plat/arm/board/corstone1000/common/corstone1000_helpers.S
++++ b/plat/arm/board/corstone1000/common/corstone1000_helpers.S
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2021-2024 Arm Limited and Contributors. All rights res=
erved.
++ * Copyright (c) 2021-2025 Arm Limited and Contributors. All rights res=
erved.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -13,6 +13,39 @@
+ 	.globl	plat_is_my_cpu_primary
+ 	.globl	plat_arm_calc_core_pos
+=20
++#ifdef CORSTONE1000_CORTEX_A320
++	.globl	plat_my_core_pos
++
++func plat_my_core_pos
++	mrs	x0, mpidr_el1
++	b	plat_arm_calc_core_pos
++endfunc plat_my_core_pos
++
++func plat_arm_calc_core_pos
++	/* Aff0 is always 0 for Cortex-A320
++	MPIDR format: https://developer.arm.com/documentation/109551/0001/AArc=
h64-registers/AArch64-Identification-registers-summary/MPIDR-EL1--Multipr=
ocessor-Affinity-Register?lang=3Den
++	*/
++	/* Extract Aff1 (core ID) */
++	ubfx    x1, x0, #MPIDR_AFF1_SHIFT, #MPIDR_AFFINITY_BITS
++
++	/* Extract Aff2 (cluster lower bits) */
++	ubfx    x2, x0, #MPIDR_AFF2_SHIFT, #MPIDR_AFFINITY_BITS
++
++	/* Extract Aff3 (cluster upper bits) */
++	ubfx    x3, x0, #MPIDR_AFF3_SHIFT, #MPIDR_AFFINITY_BITS
++
++	/* cluster_id =3D (Aff3 << 8) | Aff2 */
++	lsl     x3, x3, #MPIDR_AFFINITY_BITS
++	orr     x3, x3, x2
++
++	/* core_pos =3D core_id + (cluster_id * FVP_MAX_CPUS_PER_CLUSTER) */
++	mov	x4, #CORSTONE1000_MAX_CPUS_PER_CLUSTER
++	madd	x0, x3, x4, x1
++
++	ret
++endfunc plat_arm_calc_core_pos
++#endif
++
+ 	/* -------------------------------------------------------------------=
-
+ 	 * void plat_secondary_cold_boot_setup (void);
+ 	 *
+diff --git a/plat/arm/board/corstone1000/common/corstone1000_plat.c b/pl=
at/arm/board/corstone1000/common/corstone1000_plat.c
+index e388c82f3..d34e80b29 100644
+--- a/plat/arm/board/corstone1000/common/corstone1000_plat.c
++++ b/plat/arm/board/corstone1000/common/corstone1000_plat.c
+@@ -26,6 +26,10 @@ const mmap_region_t plat_arm_mmap[] =3D {
+ 	ARM_MAP_NS_DRAM1,
+ 	CORSTONE1000_MAP_DEVICE,
+ 	CORSTONE1000_EXTERNAL_FLASH,
++#ifdef CORSTONE1000_CORTEX_A320
++	ARM_MAP_ETHOS_U85,
++	ARM_MAP_NONSECURE_SRAM,
++#endif
+ 	{0}
+ };
+=20
+diff --git a/plat/arm/board/corstone1000/common/corstone1000_pm.c b/plat=
/arm/board/corstone1000/common/corstone1000_pm.c
+index ac808873b..a87697e97 100644
+--- a/plat/arm/board/corstone1000/common/corstone1000_pm.c
++++ b/plat/arm/board/corstone1000/common/corstone1000_pm.c
+@@ -8,7 +8,11 @@
+ #include <plat/arm/common/plat_arm.h>
+ #include <platform_def.h>
+ #include <plat/common/platform.h>
++#ifdef CORSTONE1000_CORTEX_A320
++#include <drivers/arm/gicv3.h>
++#else
+ #include <drivers/arm/gicv2.h>
++#endif
+ /**********************************************************************=
*********
+  * Export the platform handlers via plat_arm_psci_pm_ops. The ARM Stand=
ard
+  * platform layer will take care of registering the handlers with PSCI.
+@@ -24,7 +28,11 @@ static void corstone1000_system_reset(void)
+ 	 * Disable GIC CPU interface to prevent pending interrupt
+ 	 * from waking up the AP from WFI.
+ 	 */
++#ifdef CORSTONE1000_CORTEX_A320
++	gicv3_cpuif_disable(plat_my_core_pos());
++#else
+ 	gicv2_cpuif_disable();
++#endif
+=20
+ 	/* Flush and invalidate data cache */
+ 	dcsw_op_all(DCCISW);
+diff --git a/plat/arm/board/corstone1000/common/include/platform_def.h b=
/plat/arm/board/corstone1000/common/include/platform_def.h
+index caf3d462f..ee0babbf8 100644
+--- a/plat/arm/board/corstone1000/common/include/platform_def.h
++++ b/plat/arm/board/corstone1000/common/include/platform_def.h
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2021-2024, Arm Limited and Contributors. All rights re=
served.
++ * Copyright (c) 2021-2025, Arm Limited and Contributors. All rights re=
served.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -112,12 +112,19 @@
+ #define ARM_SHARED_RAM_SIZE	(SZ_8K)  /* 8 KB */
+ #define ARM_SHARED_RAM_BASE	ARM_TRUSTED_SRAM_BASE
+=20
++#ifdef CORSTONE1000_CORTEX_A320
++#define TOTAL_SECURE_SRAM_SIZE		(SZ_4M)
++#define TOTAL_NONSECURE_SRAM_SIZE	(SZ_4M)
++#define PLAT_ARM_TRUSTED_SRAM_SIZE	(TOTAL_SECURE_SRAM_SIZE - \
++					 ARM_SHARED_RAM_SIZE)
++#else
+ /* The remaining Trusted SRAM is used to load the BL images */
+ #define TOTAL_SRAM_SIZE		(SZ_4M)  /* 4 MB */
+=20
+=20
+ #define PLAT_ARM_TRUSTED_SRAM_SIZE	(TOTAL_SRAM_SIZE - \
+ 					 ARM_SHARED_RAM_SIZE)
++#endif
+=20
+ #define PLAT_ARM_MAX_BL2_SIZE	(180 * SZ_1K)  /* 180 KB */
+=20
+@@ -209,8 +216,13 @@
+ #define MAX_IO_BLOCK_DEVICES	1
+=20
+ /* GIC related constants */
++#ifdef CORSTONE1000_CORTEX_A320
++#define PLAT_ARM_GICD_BASE	0x1C000000
++#define PLAT_ARM_GICR_BASE	0x1C040000
++#else
+ #define PLAT_ARM_GICD_BASE	0x1C010000
+ #define PLAT_ARM_GICC_BASE	0x1C02F000
++#endif
+=20
+ /* MHUv2 Secure Channel receiver and sender */
+ #define PLAT_SDK700_MHU0_SEND	0x1B800000
+@@ -335,6 +347,20 @@
+ 					CORSTONE1000_DEVICE_BASE, \
+ 					CORSTONE1000_DEVICE_SIZE, \
+ 					MT_DEVICE | MT_RW | MT_SECURE)
++#ifdef CORSTONE1000_CORTEX_A320
++#define ARM_ETHOS_U85_BASE		UL(0x1A050000)
++#define ARM_ETHOS_U85_SIZE		UL(0x4000)
++#define ARM_MAP_ETHOS_U85		MAP_REGION_FLAT( \
++					ARM_ETHOS_U85_BASE, \
++					ARM_ETHOS_U85_SIZE, \
++					MT_DEVICE | MT_RW | MT_NS)
++
++#define ARM_NONSECURE_SRAM_BASE		(ARM_TRUSTED_SRAM_BASE + TOTAL_SECURE_=
SRAM_SIZE)
++#define ARM_MAP_NONSECURE_SRAM		MAP_REGION_FLAT( \
++					ARM_NONSECURE_SRAM_BASE, \
++					TOTAL_NONSECURE_SRAM_SIZE, \
++					MT_MEMORY | MT_RW | MT_NS)
++#endif
+=20
+ #define ARM_IRQ_SEC_PHY_TIMER	29
+=20
+diff --git a/plat/arm/board/corstone1000/platform.mk b/plat/arm/board/co=
rstone1000/platform.mk
+index 65be9c1f5..fe3e94865 100644
+--- a/plat/arm/board/corstone1000/platform.mk
++++ b/plat/arm/board/corstone1000/platform.mk
+@@ -9,7 +9,14 @@ ifeq ($(filter ${TARGET_PLATFORM}, fpga fvp),)
+         $(error TARGET_PLATFORM must be fpga or fvp)
+ endif
+=20
++ifdef CORSTONE1000_CORTEX_A320
++CORSTONE1000_CPU_LIBS	+=3Dlib/cpus/aarch64/cortex_a320.S
++$(eval $(call add_define,CORSTONE1000_CORTEX_A320))
++GIC_ENABLE_V4_EXTN		:=3D 1
++GICV3_SUPPORT_GIC600		:=3D 1
++else
+ CORSTONE1000_CPU_LIBS	+=3Dlib/cpus/aarch64/cortex_a35.S
++endif
+=20
+ PLAT_INCLUDES		:=3D	-Iplat/arm/board/corstone1000/common/include	\
+ 				-Iplat/arm/board/corstone1000/include		\
+@@ -43,7 +50,11 @@ $(eval $(call add_define,CORSTONE1000_FVP_MULTICORE))
+ endif
+ endif
+=20
++ifdef CORSTONE1000_CORTEX_A320
++USE_GIC_DRIVER			:=3D	3
++else
+ USE_GIC_DRIVER			:=3D	2
++endif
+=20
+ BL2_SOURCES		+=3D	plat/arm/board/corstone1000/common/corstone1000_secur=
ity.c		\
+ 				plat/arm/board/corstone1000/common/corstone1000_err.c		\
+--=20
+2.50.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/tf-a-tests/0002-plat-corstone1000-Add-Cortex-A320-support.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/tf-a-tests/000=
2-plat-corstone1000-Add-Cortex-A320-support.patch
new file mode 100644
index 00000000..2ee2506f
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/tf-a=
-tests/0002-plat-corstone1000-Add-Cortex-A320-support.patch
@@ -0,0 +1,163 @@
+From 82ca3fcf5c323aec4ce8191c349fd7e00a840e02 Mon Sep 17 00:00:00 2001
+From: Michael Safwat <michael.safwat@arm.com>
+Date: Tue, 26 Aug 2025 11:20:01 +0000
+Subject: [PATCH] plat: corstone1000: Add Cortex-A320 support
+
+Switch platform to GICv3 (GIC-600) for Corstone-1000 with Cortex-A320
+depending on CORSTONE1000_CORTEX_A320:
+    - Define GICD and GICR bases.
+    - Update the platform sources to include the GIC-V3 files.
+
+Move the NVM offset to prevent overlap with the TFTF firmware,
+which starts at 0x80000000 (TFTF_BASE).
+
+Introduce a new skip file tests_to_skip_cortex_a320 to be used when buil=
ding
+TF-A-Tests with CORSTONE1000_CORTEX_A320=3D1. This ensures that tests wh=
ich
+are not supported or cause traps on Corstone-1000 with Cortex-A320 are
+consistently skipped during execution.
+
+Skipped entries:
+    CPU extensions/AMUv1 suspend/resume
+    CPU extensions/Use trace buffer control Registers
+
+Signed-off-by: Michael Safwat <michael.safwat@arm.com>
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Upstream-Status: Submitted (https://review.trustedfirmware.org/c/TF-A/tf=
-a-tests/+/42352)
+---
+ plat/arm/corstone1000/corstone1000_def.h      | 12 +++++++++-
+ plat/arm/corstone1000/include/platform_def.h  | 11 +++++----
+ plat/arm/corstone1000/platform.mk             | 23 +++++++++++++++++++
+ .../tests_to_skip_cortex_a320.txt             | 21 +++++++++++++++++
+ 4 files changed, 61 insertions(+), 6 deletions(-)
+ create mode 100644 plat/arm/corstone1000/tests_to_skip_cortex_a320.txt
+
+diff --git a/plat/arm/corstone1000/corstone1000_def.h b/plat/arm/corston=
e1000/corstone1000_def.h
+index 3e6f036a..c4fa9a3b 100644
+--- a/plat/arm/corstone1000/corstone1000_def.h
++++ b/plat/arm/corstone1000/corstone1000_def.h
+@@ -26,13 +26,23 @@
+  * GIC-400 & interrupt handling related constants
+  **********************************************************************=
********/
+ /* GIC memory map */
++#ifdef CORSTONE1000_CORTEX_A320
++#define GICD_BASE	0x1C000000
++#define GICR_BASE	0x1C040000
++
++/* GIC re-distributor doesn't exits on gic-600, but we still need to
++ * provide GICC_BASE as the gic driver needs it
++ */
++#define GICC_BASE		0x0
++#else
++
+ #define GICD_BASE		0x1C010000
+ #define GICC_BASE		0x1C02F000
+ /* GIC re-distributor doesn't exits on gic-400, but we still need to
+  * provide GICR_BASE as the gic driver needs it
+  */
+ #define GICR_BASE		0x0
+-
++#endif
+ /**********************************************************************=
*********
+  * PL011 related constants
+  **********************************************************************=
********/
+diff --git a/plat/arm/corstone1000/include/platform_def.h b/plat/arm/cor=
stone1000/include/platform_def.h
+index a0d6f7b3..1fc505d0 100644
+--- a/plat/arm/corstone1000/include/platform_def.h
++++ b/plat/arm/corstone1000/include/platform_def.h
+@@ -98,12 +98,13 @@
+ #endif
+=20
+ /*
+- * USE 0x200000 DRAM offset to store TFTF data
+- *
+- * Please note that this won't be suitable for all test scenarios and
+- * for this reason some tests will be disabled in this configuration.
++ * When USE_NVM =3D 0, TFTF_NVM_OFFSET marks the DRAM region
++ * used as NVM. This region must not overlap the memory where
++ * the TFTF image is loaded. The load address is given by
++ * the TFTF_BASE macro. Set TFTF_NVM_OFFSET to leave enough
++ * space for the TFTF image.
+  */
+-#define TFTF_NVM_OFFSET		0x40000
++#define TFTF_NVM_OFFSET		0x80000
+ #define TFTF_NVM_SIZE		(128 * SZ_1M)	/* 128 MB */
+=20
+ /**********************************************************************=
*********
+diff --git a/plat/arm/corstone1000/platform.mk b/plat/arm/corstone1000/p=
latform.mk
+index a5a011d5..fd98724a 100644
+--- a/plat/arm/corstone1000/platform.mk
++++ b/plat/arm/corstone1000/platform.mk
+@@ -6,6 +6,19 @@
+=20
+ PLAT_INCLUDES	:=3D	-Iplat/arm/corstone1000/include/
+=20
++CORSTONE1000_CORTEX_A320   :=3D      0
++ifeq (${CORSTONE1000_CORTEX_A320},1)
++PLAT_SOURCES   :=3D   drivers/arm/gic/arm_gic_v2v3.c                  \
++            drivers/arm/gic/gic_v2.c                        \
++            drivers/arm/gic/gic_v3.c                        \
++            drivers/arm/timer/private_timer.c               \
++            drivers/arm/timer/system_timer.c                \
++            plat/arm/corstone1000/plat_helpers.S            \
++            plat/arm/corstone1000/corstone1000_pwr_state.c  \
++            plat/arm/corstone1000/corstone1000_topology.c   \
++            plat/arm/corstone1000/corstone1000_mem_prot.c   \
++            plat/arm/corstone1000/plat_setup.c
++else
+ PLAT_SOURCES	:=3D	drivers/arm/gic/arm_gic_v2.c			\
+ 			drivers/arm/gic/gic_v2.c			\
+ 			drivers/arm/timer/private_timer.c		\
+@@ -15,6 +28,7 @@ PLAT_SOURCES	:=3D	drivers/arm/gic/arm_gic_v2.c			\
+ 			plat/arm/corstone1000/corstone1000_topology.c	\
+ 			plat/arm/corstone1000/corstone1000_mem_prot.c	\
+ 			plat/arm/corstone1000/plat_setup.c
++endif
+=20
+ PLAT_SUPPORTS_NS_RESET	:=3D	1
+=20
+@@ -23,6 +37,15 @@ $(eval $(call assert_boolean,PLAT_SUPPORTS_NS_RESET))
+ $(eval $(call add_define,TFTF_DEFINES,PLAT_SUPPORTS_NS_RESET))
+=20
+ FIRMWARE_UPDATE :=3D 0
++
++ifeq ($(CORSTONE1000_CORTEX_A320),1)
++$(eval $(call add_define,TFTF_DEFINES,CORSTONE1000_CORTEX_A320))
++endif
++
++ifeq (${CORSTONE1000_CORTEX_A320},1)
++PLAT_TESTS_SKIP_LIST    :=3D      plat/arm/corstone1000/tests_to_skip_c=
ortex_a320.txt
++else
+ PLAT_TESTS_SKIP_LIST    :=3D      plat/arm/corstone1000/tests_to_skip.t=
xt
++endif
+=20
+ include plat/arm/common/arm_common.mk
+diff --git a/plat/arm/corstone1000/tests_to_skip_cortex_a320.txt b/plat/=
arm/corstone1000/tests_to_skip_cortex_a320.txt
+new file mode 100644
+index 00000000..87b9241d
+--- /dev/null
++++ b/plat/arm/corstone1000/tests_to_skip_cortex_a320.txt
+@@ -0,0 +1,21 @@
++Realm payload tests
++Realm payload boot
++Realm payload multi CPU request
++Realm payload Delegate and Undelegate
++Multi CPU Realm payload Delegate and Undelegate
++Testing delegation fails
++Realm testing with SPM tests
++PSCI System Suspend Validation
++PSCI STAT/Stats test cases after system suspend
++IRQ support in TSP/Resume preempted STD SMC after PSCI SYSTEM SUSPEND
++PSCI SYSTEM SUSPEND stress tests
++Timer framework Validation/Verify the timer interrupt generation
++CPU Hotplug/CPU hotplug
++PSCI CPU Suspend
++PSCI CPU Suspend in OSI mode
++PSCI STAT/for valid composite state CPU suspend
++FF-A Setup and Discovery/FF-A RXTX remap unmapped region success
++FF-A Memory Sharing/Normal World VM retrieve request into SPMC
++Boot requirement tests
++CPU extensions/AMUv1 suspend/resume
++CPU extensions/Use trace buffer control Registers
+--=20
+2.43.0
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_%.bba=
ppend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_%.bbappend
index 344c9f8b..c1490c9f 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_%.bbappend
@@ -3,9 +3,18 @@
 COMPATIBLE_MACHINE:corstone1000 =3D "corstone1000"
 EXTRA_OEMAKE:append:corstone1000 =3D " DEBUG=3D0"
 EXTRA_OEMAKE:append:corstone1000 =3D " LOG_LEVEL=3D30"
+
+# Add Cortex-A320 specific configurations
+EXTRA_OEMAKE:append:cortexa320 =3D " \
+        CORSTONE1000_CORTEX_A320=3D1 \
+        "
 TFTF_MODE:corstone1000 =3D "release"
=20
 FILESEXTRAPATHS:prepend:corstone1000 :=3D "${THISDIR}/files/corstone1000=
/tf-a-tests:"
 SRC_URI:append:corstone1000 =3D " \
         file://0001-fix-exclude-Boot-requirement-tests-for-Corstone-1000=
.patch \
         "
+
+SRC_URI:append:corstone1000 =3D " \
+        file://0002-plat-corstone1000-Add-Cortex-A320-support.patch \
+        "
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted=
-firmware-a-corstone1000.inc
index 97a9e55b..5e219a28 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
@@ -5,7 +5,8 @@ COMPATIBLE_MACHINE =3D "(corstone1000)"
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/corstone1000:"
 SRC_URI:append =3D " \
 	file://0001-Fix-FF-A-version-in-SPMC-manifest.patch \
-       "
+	file://0002-plat-corstone1000-add-Cortex-A320-support.patch \
+"
=20
 TFA_DEBUG =3D "1"
 TFA_UBOOT ?=3D "1"
@@ -21,6 +22,13 @@ TFA_SPMD_SPM_AT_SEL2 =3D "0"
 # BL2 loads BL32 (optee). So, optee needs to be built first:
 DEPENDS +=3D "optee-os"
=20
+ENABLE_CORTEX_A35_ERRATA =3D " \
+    ERRATA_A35_855472=3D1 \
+"
+ENABLE_CORTEX_A35_ERRATA:cortexta320 =3D ""
+FVP_GIC_DRIVER ?=3D "FVP_GICV2"
+FVP_GIC_DRIVER:cortexa320 =3D "FVP_GICV3"
+
 # Note: Regarding the build option: LOG_LEVEL.
 # There seems to be an issue when setting it
 # to 50 (LOG_LEVEL_VERBOSE), where the kernel
@@ -45,13 +53,29 @@ EXTRA_OEMAKE:append =3D " \
                         NR_OF_IMAGES_IN_FW_BANK=3D4 \
                         COT=3Dtbbr \
                         ARM_ROTPK_LOCATION=3Ddevel_rsa  \
-                        ERRATA_A35_855472=3D1 \
+                        ${ENABLE_CORTEX_A35_ERRATA} \
                         ROT_KEY=3Dplat/arm/board/common/rotpk/arm_rotpri=
vk_rsa.pem \
                         BL32=3D${RECIPE_SYSROOT}/${nonarch_base_libdir}/=
firmware/tee-pager_v2.bin \
-                        FVP_USE_GIC_DRIVER=3DFVP_GICV2 \
+                        FVP_USE_GIC_DRIVER=3D${FVP_GIC_DRIVER} \
                         "
 EXTRA_OEMAKE:append:corstone1000-fvp =3D "${@bb.utils.contains('MACHINE_=
FEATURES', 'corstone1000_fvp_smp', ' ENABLE_MULTICORE=3D1', '', d)}"
=20
+# Add Cortex-A320 specific configurations
+EXTRA_OEMAKE:append:cortexa320 =3D " \
+    CORSTONE1000_CORTEX_A320=3D1 \
+    HW_ASSISTED_COHERENCY=3D1 \
+    USE_COHERENT_MEM=3D0 \
+    CTX_INCLUDE_AARCH32_REGS=3D0 \
+    ENABLE_FEAT_HCX=3D1 \
+    ENABLE_FEAT_FGT=3D1 \
+    ENABLE_FEAT_ECV=3D1 \
+    ENABLE_FEAT_MTE2=3D1 \
+    ENABLE_FEAT_AMU=3D1 \
+    ENABLE_FEAT_CSV2_2=3D1 \
+    ENABLE_SVE_FOR_NS=3D1 \
+    ENABLE_SVE_FOR_SWD=3D1 \
+"
+
 # If GENERATE_COT is set, then TF-A will try to use local poetry install
 # to run the python cot-dt2c command.  Disable the local poetry and use
 # the provided cot-dt2c.

