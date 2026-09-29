Return-Path: <Oscar.Belshaw@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C9D4C9832A
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 14:30:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9232.1790692198510704801
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 29 Sep 2026 07:29:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=VqQYFHVV;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: oscar.belshaw@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B40C152B;
	Tue, 29 Sep 2026 07:29:54 -0700 (PDT)
Received: from e142471.cambridge.arm.com (e142471.arm.com [10.2.210.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C5C33F86F;
	Tue, 29 Sep 2026 07:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790692198; bh=tYdnRMGeReElOUAFVTy4Fzvi+Fe1sJ3vgsFmb1DNCLk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VqQYFHVVw2trI17w8Ttc+I+uAlMy+joLl2lGK/a+CMXDL1M6f94nBF66+yyIWCTew
	 jqwEoKD500guRo8pbp8MtqWfv0OAJKpfW1xu2QHku2E1ILsbhgNCYDCsZRkg0evE3n
	 hC/qHa4dW6hp+3ojZ15MAXUW+dVDOhmAULXLos1c=
From: Oscar Belshaw <Oscar.Belshaw@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Oscar Belshaw <Oscar.Belshaw@arm.com>
Subject: [PATCH 1/1] arm-bsp/corstone1000: update TF-A to 2.15.0
Date: Tue, 29 Sep 2026 15:29:50 +0100
Message-ID: <20260929142950.1899977-2-Oscar.Belshaw@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929142950.1899977-1-Oscar.Belshaw@arm.com>
References: <20260929142950.1899977-1-Oscar.Belshaw@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 29 Sep 2026 14:30:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7179

Select the TF-A and TF-A Tests 2.15 release series for Corstone1000 and
update the FPGA and Cortex-A320 FVP documentation to reference the
2.15.0 recipe.

Remove the TF-A Cortex-A320 and multicore patches and the TF-A Tests
Cortex-A320 patch, as these changes are included upstream. Drop the
obsolete TFA_MBEDTLS workaround.

Add a patch to align the BL configuration mapping with the enclosing
shared RAM page. ARM_FW_CONFIG_BASE follows the meminfo_t structure and
is not page aligned, causing mmap_add_region_check() to reject the
mapping with -EINVAL. Base the mapping at ARM_SHARED_RAM_BASE while
preserving the firmware configuration load address and reserved space.

Add a Corstone1000 BL2 hook that waits 25 ms after arm_io_setup() and
before common GPT initialization when RESET_TO_BL2 and ARM_GPT_SUPPORT
are enabled. Enable the system counter and initialize the delay timer
before waiting, since their common initialization occurs later. Apply
the hook to FPGA, Cortex-A35 FVP and Cortex-A320 FVP builds.

The delay works around invalid MBR signatures observed during early
flash access on MPS3 with TF-A 2.15. It retains the common GPT-before-MMU
ordering and existing reset handling. This is a temporary timing
workaround: the underlying cause remains under investigation, and
25 ms is a tested delay rather than a documented hardware requirement.

Change-Id: Ic57f6474c6019edd58caeca8e2751d05d17678c7
Signed-off-by: Oscar Belshaw <Oscar.Belshaw@arm.com>
---
 .../conf/machine/include/corstone1000.inc     |   4 +-
 .../corstone1000-a320/topics/user-guide.md    |   2 +-
 .../documentation/corstone1000/user-guide.rst |   2 +-
 ...corstone1000-add-Cortex-A320-support.patch | 231 ------------------
 ...-corstone1000-align-BL-config-region.patch |  45 ++++
 ...000-make-mutlicore-support-platform-.patch | 113 ---------
 ...-corstone1000-delay-early-GPT-access.patch |  83 +++++++
 ...corstone1000-Add-Cortex-A320-support.patch | 157 ------------
 .../trusted-firmware-a/tf-a-tests_%.bbappend  |   5 -
 .../trusted-firmware-a-corstone1000.inc       |   6 +-
 10 files changed, 134 insertions(+), 514 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0002-plat-corstone1000-add-Cortex-A320-support.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0002-plat-corstone1000-align-BL-config-region.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0003-feat-corestone-1000-make-mutlicore-support-platform-.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0003-plat-corstone1000-delay-early-GPT-access.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/tf-a-tests/0001-plat-corstone1000-Add-Cortex-A320-support.patch

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index 26ab5c048a..6a4dc6fbd0 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -10,8 +10,8 @@ PREFERRED_VERSION_trusted-firmware-m-scripts-native ?=3D=
 "2.3.%"
=20
 # TF-A
 TFA_PLATFORM =3D "corstone1000"
-PREFERRED_VERSION_trusted-firmware-a ?=3D "2.14.%"
-PREFERRED_VERSION_tf-a-tests ?=3D "2.14.%"
+PREFERRED_VERSION_trusted-firmware-a ?=3D "2.15.%"
+PREFERRED_VERSION_tf-a-tests ?=3D "2.15.%"
=20
 TFA_BL2_BINARY =3D "bl2-corstone1000.bin"
 TFA_FIP_BINARY =3D "fip-corstone1000.bin"
diff --git a/meta-arm-bsp/documentation/corstone1000-a320/topics/user-gui=
de.md b/meta-arm-bsp/documentation/corstone1000-a320/topics/user-guide.md
index fca2201341..f56e8d06c4 100644
--- a/meta-arm-bsp/documentation/corstone1000-a320/topics/user-guide.md
+++ b/meta-arm-bsp/documentation/corstone1000-a320/topics/user-guide.md
@@ -57,7 +57,7 @@ Table: Trusted Firmware-A components
 | Type      | Path                                                      =
                                                       |
 | --------- | ----------------------------------------------------------=
------------------------------------------------------ |
 | bbappend  | `${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-bsp/trusted-fi=
rmware-a/trusted-firmware-a_%.bbappend`                |
-| Recipe    | `${WORKSPACE}/meta-arm/meta-arm/recipes-bsp/trusted-firmwa=
re-a/trusted-firmware-a_2.14.1.bb`                     |
+| Recipe    | `${WORKSPACE}/meta-arm/meta-arm/recipes-bsp/trusted-firmwa=
re-a/trusted-firmware-a_2.15.0.bb`                     |
=20
 #### Trusted Services {.reference}
=20
diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index 011c5df000..56adbf0c06 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -92,7 +92,7 @@ Host Processor Components
 +----------+------------------------------------------------------------=
-------------------------------------------+
 | bbappend | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-bsp/trusted-fi=
rmware-a/trusted-firmware-a_%.bbappend``   |
 +----------+------------------------------------------------------------=
-------------------------------------------+
-| Recipe   | ``${WORKSPACE}/meta-arm/meta-arm/recipes-bsp/trusted-firmwa=
re-a/trusted-firmware-a_2.14.1.bb``        |
+| Recipe   | ``${WORKSPACE}/meta-arm/meta-arm/recipes-bsp/trusted-firmwa=
re-a/trusted-firmware-a_2.15.0.bb``        |
 +----------+------------------------------------------------------------=
-------------------------------------------+
=20
 `Trusted Services <https://trusted-services.readthedocs.io/en/latest/ind=
ex.html>`__
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0002-plat-corstone1000-add-Cortex-A320-support.patch b/meta-arm-bsp/re=
cipes-bsp/trusted-firmware-a/files/corstone1000/0002-plat-corstone1000-ad=
d-Cortex-A320-support.patch
deleted file mode 100644
index a9b6d83222..0000000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0002=
-plat-corstone1000-add-Cortex-A320-support.patch
+++ /dev/null
@@ -1,231 +0,0 @@
-From 4e23e72e65481fe917d8a0af355b3b7669d5acb6 Mon Sep 17 00:00:00 2001
-From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
-Date: Thu, 7 Aug 2025 10:05:02 +0000
-Subject: [PATCH] plat: corstone1000: add Cortex-A320 support
-
-Introduce `CORSTONE1000_CORTEX_A320` to enable Cortex-A320 on
-Corstone-1000 while keeping Cortex-A35 as the default. When the
-define is enabled, the build switches from `cortex_a35.S` to
-`cortex_a320.S`, maintaining compatibility with existing A35-based
-designs.
-
-Also add Normal-World mappings for the Ethos-U85 NPU and its SRAM
-on Cortex-A320 platforms so U-Boot and other non-secure software
-can safely access these regions:
-
-* **Ethos-U85 registers**: base `0x1A050000`, size `0x00004000` (16 KB),
-  attrs `MT_DEVICE | MT_RW | MT_NS`
-* **Non-secure SRAM**: base `0x02400000`, size `0x00400000` (4 MB),
-  attrs `MT_MEMORY | MT_RW | MT_NS`
-
-Enable GICv3 with GIC-600 when building for Cortex-A320 (retain
-GICv2/GIC-400 for Cortex-A35):
-
-* Update `plat_my_core_pos()` and `plat_arm_calc_core_pos()` to use
-  the Cortex-A320 MPIDR_EL1 affinity layout.
-* Add an A320-specific core-position routine in assembly guarded by
-  `CORSTONE1000_CORTEX_A320`.
-* Switch to the GICv3 driver with GIC-600 extensions: update GIC base
-  addresses, use GICv3 APIs, and set `USE_GIC_DRIVER=3D3`,
-  `GICV3_SUPPORT_GIC600=3D1`, `GIC_ENABLE_V4_EXTN=3D1`.
-
-These changes prepare the platform for Cortex-A320 integration and
-ensure correct GIC configuration and secondary-core bring-up, while
-preserving A35 behavior.
-
-Upstream-Status: Submitted (https://review.trustedfirmware.org/c/TF-A/tr=
usted-firmware-a/+/45729)
-Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
-Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
-Signed-off-by: Michael Safwat <michael.safwat@arm.com>
----
- .../common/corstone1000_helpers.S             | 35 ++++++++++++++++++-
- .../corstone1000/common/corstone1000_plat.c   |  4 +++
- .../corstone1000/common/corstone1000_pm.c     |  8 +++++
- .../common/include/platform_def.h             | 26 ++++++++++++++
- plat/arm/board/corstone1000/platform.mk       | 11 ++++++
- 5 files changed, 83 insertions(+), 1 deletion(-)
-
-diff --git a/plat/arm/board/corstone1000/common/corstone1000_helpers.S b=
/plat/arm/board/corstone1000/common/corstone1000_helpers.S
-index a4ca9fe98223..665dbc61a92e 100644
---- a/plat/arm/board/corstone1000/common/corstone1000_helpers.S
-+++ b/plat/arm/board/corstone1000/common/corstone1000_helpers.S
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2021-2024 Arm Limited and Contributors. All rights res=
erved.
-+ * Copyright (c) 2021-2025 Arm Limited and Contributors. All rights res=
erved.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
-@@ -13,6 +13,39 @@
- 	.globl	plat_is_my_cpu_primary
- 	.globl	plat_arm_calc_core_pos
-=20
-+#ifdef CORSTONE1000_CORTEX_A320
-+	.globl	plat_my_core_pos
-+
-+func plat_my_core_pos
-+	mrs	x0, mpidr_el1
-+	b	plat_arm_calc_core_pos
-+endfunc plat_my_core_pos
-+
-+func plat_arm_calc_core_pos
-+	/* Aff0 is always 0 for Cortex-A320
-+	MPIDR format: https://developer.arm.com/documentation/109551/0001/AArc=
h64-registers/AArch64-Identification-registers-summary/MPIDR-EL1--Multipr=
ocessor-Affinity-Register?lang=3Den
-+	*/
-+	/* Extract Aff1 (core ID) */
-+	ubfx    x1, x0, #MPIDR_AFF1_SHIFT, #MPIDR_AFFINITY_BITS
-+
-+	/* Extract Aff2 (cluster lower bits) */
-+	ubfx    x2, x0, #MPIDR_AFF2_SHIFT, #MPIDR_AFFINITY_BITS
-+
-+	/* Extract Aff3 (cluster upper bits) */
-+	ubfx    x3, x0, #MPIDR_AFF3_SHIFT, #MPIDR_AFFINITY_BITS
-+
-+	/* cluster_id =3D (Aff3 << 8) | Aff2 */
-+	lsl     x3, x3, #MPIDR_AFFINITY_BITS
-+	orr     x3, x3, x2
-+
-+	/* core_pos =3D core_id + (cluster_id * FVP_MAX_CPUS_PER_CLUSTER) */
-+	mov	x4, #CORSTONE1000_MAX_CPUS_PER_CLUSTER
-+	madd	x0, x3, x4, x1
-+
-+	ret
-+endfunc plat_arm_calc_core_pos
-+#endif
-+
- 	/* -------------------------------------------------------------------=
-
- 	 * void plat_secondary_cold_boot_setup (void);
- 	 *
-diff --git a/plat/arm/board/corstone1000/common/corstone1000_plat.c b/pl=
at/arm/board/corstone1000/common/corstone1000_plat.c
-index e388c82f311b..d34e80b29bb0 100644
---- a/plat/arm/board/corstone1000/common/corstone1000_plat.c
-+++ b/plat/arm/board/corstone1000/common/corstone1000_plat.c
-@@ -26,6 +26,10 @@ const mmap_region_t plat_arm_mmap[] =3D {
- 	ARM_MAP_NS_DRAM1,
- 	CORSTONE1000_MAP_DEVICE,
- 	CORSTONE1000_EXTERNAL_FLASH,
-+#ifdef CORSTONE1000_CORTEX_A320
-+	ARM_MAP_ETHOS_U85,
-+	ARM_MAP_NONSECURE_SRAM,
-+#endif
- 	{0}
- };
-=20
-diff --git a/plat/arm/board/corstone1000/common/corstone1000_pm.c b/plat=
/arm/board/corstone1000/common/corstone1000_pm.c
-index ac808873b9e7..a87697e97f11 100644
---- a/plat/arm/board/corstone1000/common/corstone1000_pm.c
-+++ b/plat/arm/board/corstone1000/common/corstone1000_pm.c
-@@ -8,7 +8,11 @@
- #include <plat/arm/common/plat_arm.h>
- #include <platform_def.h>
- #include <plat/common/platform.h>
-+#ifdef CORSTONE1000_CORTEX_A320
-+#include <drivers/arm/gicv3.h>
-+#else
- #include <drivers/arm/gicv2.h>
-+#endif
- /**********************************************************************=
*********
-  * Export the platform handlers via plat_arm_psci_pm_ops. The ARM Stand=
ard
-  * platform layer will take care of registering the handlers with PSCI.
-@@ -24,7 +28,11 @@ static void corstone1000_system_reset(void)
- 	 * Disable GIC CPU interface to prevent pending interrupt
- 	 * from waking up the AP from WFI.
- 	 */
-+#ifdef CORSTONE1000_CORTEX_A320
-+	gicv3_cpuif_disable(plat_my_core_pos());
-+#else
- 	gicv2_cpuif_disable();
-+#endif
-=20
- 	/* Flush and invalidate data cache */
- 	dcsw_op_all(DCCISW);
-diff --git a/plat/arm/board/corstone1000/common/include/platform_def.h b=
/plat/arm/board/corstone1000/common/include/platform_def.h
-index 200383475c80..ffb1e2dec0e1 100644
---- a/plat/arm/board/corstone1000/common/include/platform_def.h
-+++ b/plat/arm/board/corstone1000/common/include/platform_def.h
-@@ -112,12 +112,19 @@
- #define ARM_SHARED_RAM_SIZE	(SZ_8K)  /* 8 KB */
- #define ARM_SHARED_RAM_BASE	ARM_TRUSTED_SRAM_BASE
-=20
-+#ifdef CORSTONE1000_CORTEX_A320
-+#define TOTAL_SECURE_SRAM_SIZE		(SZ_4M)
-+#define TOTAL_NONSECURE_SRAM_SIZE	(SZ_4M)
-+#define PLAT_ARM_TRUSTED_SRAM_SIZE	(TOTAL_SECURE_SRAM_SIZE - \
-+					 ARM_SHARED_RAM_SIZE)
-+#else
- /* The remaining Trusted SRAM is used to load the BL images */
- #define TOTAL_SRAM_SIZE		(SZ_4M)  /* 4 MB */
-=20
-=20
- #define PLAT_ARM_TRUSTED_SRAM_SIZE	(TOTAL_SRAM_SIZE - \
- 					 ARM_SHARED_RAM_SIZE)
-+#endif
-=20
- #define PLAT_ARM_MAX_BL2_SIZE	(180 * SZ_1K)  /* 180 KB */
-=20
-@@ -208,8 +215,13 @@
- #define MAX_IO_BLOCK_DEVICES	1
-=20
- /* GIC related constants */
-+#ifdef CORSTONE1000_CORTEX_A320
-+#define PLAT_ARM_GICD_BASE	0x1C000000
-+#define PLAT_ARM_GICR_BASE	0x1C040000
-+#else
- #define PLAT_ARM_GICD_BASE	0x1C010000
- #define PLAT_ARM_GICC_BASE	0x1C02F000
-+#endif
-=20
- /* MHUv2 Secure Channel receiver and sender */
- #define PLAT_SDK700_MHU0_SEND	0x1B800000
-@@ -334,6 +346,20 @@
- 					CORSTONE1000_DEVICE_BASE, \
- 					CORSTONE1000_DEVICE_SIZE, \
- 					MT_DEVICE | MT_RW | MT_SECURE)
-+#ifdef CORSTONE1000_CORTEX_A320
-+#define ARM_ETHOS_U85_BASE		UL(0x1A050000)
-+#define ARM_ETHOS_U85_SIZE		UL(0x4000)
-+#define ARM_MAP_ETHOS_U85		MAP_REGION_FLAT( \
-+					ARM_ETHOS_U85_BASE, \
-+					ARM_ETHOS_U85_SIZE, \
-+					MT_DEVICE | MT_RW | MT_NS)
-+
-+#define ARM_NONSECURE_SRAM_BASE		(ARM_TRUSTED_SRAM_BASE + TOTAL_SECURE_=
SRAM_SIZE)
-+#define ARM_MAP_NONSECURE_SRAM		MAP_REGION_FLAT( \
-+					ARM_NONSECURE_SRAM_BASE, \
-+					TOTAL_NONSECURE_SRAM_SIZE, \
-+					MT_MEMORY | MT_RW | MT_NS)
-+#endif
-=20
- #define ARM_IRQ_SEC_PHY_TIMER	29
-=20
-diff --git a/plat/arm/board/corstone1000/platform.mk b/plat/arm/board/co=
rstone1000/platform.mk
-index 65be9c1f5ad7..fe3e94865fca 100644
---- a/plat/arm/board/corstone1000/platform.mk
-+++ b/plat/arm/board/corstone1000/platform.mk
-@@ -9,7 +9,14 @@ ifeq ($(filter ${TARGET_PLATFORM}, fpga fvp),)
-         $(error TARGET_PLATFORM must be fpga or fvp)
- endif
-=20
-+ifdef CORSTONE1000_CORTEX_A320
-+CORSTONE1000_CPU_LIBS	+=3Dlib/cpus/aarch64/cortex_a320.S
-+$(eval $(call add_define,CORSTONE1000_CORTEX_A320))
-+GIC_ENABLE_V4_EXTN		:=3D 1
-+GICV3_SUPPORT_GIC600		:=3D 1
-+else
- CORSTONE1000_CPU_LIBS	+=3Dlib/cpus/aarch64/cortex_a35.S
-+endif
-=20
- PLAT_INCLUDES		:=3D	-Iplat/arm/board/corstone1000/common/include	\
- 				-Iplat/arm/board/corstone1000/include		\
-@@ -43,7 +50,11 @@ $(eval $(call add_define,CORSTONE1000_FVP_MULTICORE))
- endif
- endif
-=20
-+ifdef CORSTONE1000_CORTEX_A320
-+USE_GIC_DRIVER			:=3D	3
-+else
- USE_GIC_DRIVER			:=3D	2
-+endif
-=20
- BL2_SOURCES		+=3D	plat/arm/board/corstone1000/common/corstone1000_secur=
ity.c		\
- 				plat/arm/board/corstone1000/common/corstone1000_err.c		\
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0002-plat-corstone1000-align-BL-config-region.patch b/meta-arm-bsp/rec=
ipes-bsp/trusted-firmware-a/files/corstone1000/0002-plat-corstone1000-ali=
gn-BL-config-region.patch
new file mode 100644
index 0000000000..3eacbd3dff
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0002=
-plat-corstone1000-align-BL-config-region.patch
@@ -0,0 +1,45 @@
+From f05f9b75f60697be84217d0957e8864d58ee71bb Mon Sep 17 00:00:00 2001
+From: Oscar Belshaw <Oscar.Belshaw@arm.com>
+Date: Tue, 11 Aug 2026 15:40:27 +0100
+Subject: [PATCH] plat: corstone1000: align BL config mapping
+
+ARM_FW_CONFIG_BASE starts after the meminfo_t structure and is therefore
+not page aligned. Translation table mappings require page-aligned base
+addresses and sizes.
+
+Map the enclosing page from ARM_SHARED_RAM_BASE while retaining
+ARM_FW_CONFIG_BASE as the configuration load address. This prevents
+mmap_add_region_check() from returning -EINVAL during BL2 initialization=
.
+
+Only the mapping is widened: the reserved meminfo_t space at the start o=
f
+shared RAM and the firmware configuration load addresses are unchanged.
+
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-A/tr=
usted-firmware-a/+/54909]
+
+Signed-off-by: Oscar Belshaw <Oscar.Belshaw@arm.com>
+
+---
+ .../arm/board/corstone1000/common/include/platform_def.h | 10 +++++----=
-
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/plat/arm/board/corstone1000/common/include/platform_def.h b=
/plat/arm/board/corstone1000/common/include/platform_def.h
+index 382426869b..6673010d2f 100644
+--- a/plat/arm/board/corstone1000/common/include/platform_def.h
++++ b/plat/arm/board/corstone1000/common/include/platform_def.h
+@@ -334,11 +334,11 @@
+  * Map the region for the optional device tree configuration with read =
and
+  * write permissions
+  */
+-#define ARM_MAP_BL_CONFIG_REGION	MAP_REGION_FLAT( \
+-					ARM_FW_CONFIG_BASE, \
+-					(ARM_FW_CONFIG_LIMIT \
+-					 - ARM_FW_CONFIG_BASE), \
+-					MT_MEMORY | MT_RW | MT_SECURE)
++#define ARM_MAP_BL_CONFIG_REGION	MAP_REGION_FLAT( \
++					ARM_SHARED_RAM_BASE, \
++					(ARM_FW_CONFIG_LIMIT \
++					 - ARM_SHARED_RAM_BASE), \
++					MT_MEMORY | MT_RW | MT_SECURE)
+=20
+ #define CORSTONE1000_DEVICE_BASE	(0x1A000000)
+ #define CORSTONE1000_DEVICE_SIZE	(0x26000000)
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0003-feat-corestone-1000-make-mutlicore-support-platform-.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0003-feat-core=
stone-1000-make-mutlicore-support-platform-.patch
deleted file mode 100644
index c338fba017..0000000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0003=
-feat-corestone-1000-make-mutlicore-support-platform-.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-From a9801643d9d4d3f24960c5f24d5f5c3fd4889cc1 Mon Sep 17 00:00:00 2001
-From: Alex Chapman <alecha05@e142473.arm.com>
-Date: Tue, 3 Mar 2026 17:00:58 +0000
-Subject: [PATCH] feat(corestone-1000): make mutlicore support platform g=
eneric
-
-To improve portability, testing coverage, and future platform enablement=
.
-
-- Replace FVP-only multicore checks with platform-generic checks.
-- Add the corresponding TF-M patch to the Corstone-1000 recipe.
-
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-A/tr=
usted-firmware-a/+/49092]
-Signed-off-by: Alex Chapman <alex.chapman@arm.com>
----
- plat/arm/board/corstone1000/common/corstone1000_helpers.S | 4 ++--
- plat/arm/board/corstone1000/common/corstone1000_pm.c      | 6 +++---
- plat/arm/board/corstone1000/common/include/platform_def.h | 4 ++--
- plat/arm/board/corstone1000/platform.mk                   | 6 ++----
- 4 files changed, 9 insertions(+), 11 deletions(-)
-
-diff --git a/plat/arm/board/corstone1000/common/corstone1000_helpers.S b=
/plat/arm/board/corstone1000/common/corstone1000_helpers.S
-index 665dbc61a..d41df4ebe 100644
---- a/plat/arm/board/corstone1000/common/corstone1000_helpers.S
-+++ b/plat/arm/board/corstone1000/common/corstone1000_helpers.S
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2021-2025 Arm Limited and Contributors. All rights res=
erved.
-+ * Copyright (c) 2021-2026 Arm Limited and Contributors. All rights res=
erved.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
-@@ -54,7 +54,7 @@ endfunc plat_arm_calc_core_pos
- 	 * -------------------------------------------------------------------=
-
- 	 */
- func plat_secondary_cold_boot_setup
--#if defined(CORSTONE1000_FVP_MULTICORE)
-+#if defined(CORSTONE1000_MULTICORE)
-=20
- 	/* Calculate the address of our hold entry */
- 	bl	plat_my_core_pos
-diff --git a/plat/arm/board/corstone1000/common/corstone1000_pm.c b/plat=
/arm/board/corstone1000/common/corstone1000_pm.c
-index a87697e97..2c7a2c67b 100644
---- a/plat/arm/board/corstone1000/common/corstone1000_pm.c
-+++ b/plat/arm/board/corstone1000/common/corstone1000_pm.c
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2021-2025, Arm Limited and Contributors. All rights re=
served.
-+ * Copyright (c) 2021-2026, Arm Limited and Contributors. All rights re=
served.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
-@@ -41,7 +41,7 @@ static void corstone1000_system_reset(void)
- 	*watchdog_ctrl_reg =3D SECURE_WATCHDOG_MASK_ENABLE;
- }
-=20
--#if defined(CORSTONE1000_FVP_MULTICORE)
-+#if defined(CORSTONE1000_MULTICORE)
- int corstone1000_validate_ns_entrypoint(uintptr_t entrypoint)
- {
- 	/*
-@@ -77,7 +77,7 @@ void corstone1000_pwr_domain_on_finish(const psci_powe=
r_state_t *target_state)
- #endif
-=20
- plat_psci_ops_t plat_arm_psci_pm_ops =3D {
--#if defined(CORSTONE1000_FVP_MULTICORE)
-+#if defined(CORSTONE1000_MULTICORE)
- 	.pwr_domain_on =3D corstone1000_pwr_domain_on,
- 	.pwr_domain_on_finish =3D corstone1000_pwr_domain_on_finish,
- 	.validate_ns_entrypoint =3D corstone1000_validate_ns_entrypoint,
-diff --git a/plat/arm/board/corstone1000/common/include/platform_def.h b=
/plat/arm/board/corstone1000/common/include/platform_def.h
-index ffb1e2dec..4682b8b5d 100644
---- a/plat/arm/board/corstone1000/common/include/platform_def.h
-+++ b/plat/arm/board/corstone1000/common/include/platform_def.h
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2021-2025, Arm Limited and Contributors. All rights re=
served.
-+ * Copyright (c) 2021-2026, Arm Limited and Contributors. All rights re=
served.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
-@@ -266,7 +266,7 @@
-=20
- #define PLAT_ARM_TRUSTED_MAILBOX_BASE	ARM_TRUSTED_SRAM_BASE
-=20
--#if defined(CORSTONE1000_FVP_MULTICORE)
-+#if defined(CORSTONE1000_MULTICORE)
- /* The secondary core entrypoint address points to bl31_warm_entrypoint
-  * and the address size is 8 bytes */
- #define CORSTONE1000_SECONDARY_CORE_ENTRYPOINT_ADDRESS_SIZE    UL(0x8)
-diff --git a/plat/arm/board/corstone1000/platform.mk b/plat/arm/board/co=
rstone1000/platform.mk
-index fe3e94865..dee40f3b3 100644
---- a/plat/arm/board/corstone1000/platform.mk
-+++ b/plat/arm/board/corstone1000/platform.mk
-@@ -1,5 +1,5 @@
- #
--# Copyright (c) 2021-2025 Arm Limited and Contributors. All rights rese=
rved.
-+# Copyright (c) 2021-2026 Arm Limited and Contributors. All rights rese=
rved.
- #
- # SPDX-License-Identifier: BSD-3-Clause
- #
-@@ -44,10 +44,8 @@ $(eval $(call add_define,CORSTONE1000_WITH_BL32))
- endif
-=20
- ENABLE_MULTICORE       :=3D      0
--ifneq ($(filter ${TARGET_PLATFORM}, fvp),)
- ifeq (${ENABLE_MULTICORE},1)
--$(eval $(call add_define,CORSTONE1000_FVP_MULTICORE))
--endif
-+$(eval $(call add_define,CORSTONE1000_MULTICORE))
- endif
-=20
- ifdef CORSTONE1000_CORTEX_A320
---=20
-2.43.0
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0003-plat-corstone1000-delay-early-GPT-access.patch b/meta-arm-bsp/rec=
ipes-bsp/trusted-firmware-a/files/corstone1000/0003-plat-corstone1000-del=
ay-early-GPT-access.patch
new file mode 100644
index 0000000000..af19875745
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0003=
-plat-corstone1000-delay-early-GPT-access.patch
@@ -0,0 +1,83 @@
+From: Oscar Belshaw <Oscar.Belshaw@arm.com>
+Subject: [PATCH] fix(corstone1000): delay early GPT access
+
+TF-A 2.15 initializes GPT before MMU setup in the common BL2 boot path.
+On Corstone1000 MPS3, early memory-mapped flash reads have returned an
+invalid MBR signature, preventing boot. A 25 ms delay before GPT access
+has allowed boot and reset tests to complete on the tested configuration=
s.
+
+Override the weak plat_arm_io_setup hook for Corstone1000 BL2 with
+RESET_TO_BL2 and ARM_GPT_SUPPORT enabled. Preserve arm_io_setup and its
+error handling, then wait 25 ms before returning to common GPT setup.
+
+The common system-counter enable occurs in arm_bl31_platform_setup, and
+common generic_delay_timer_init occurs after GPT initialization. Enable
+the system counter here with the same CNTCR configuration used by BL31,
+then initialize the delay driver before calling mdelay. Driver initializ=
ation
+alone does not enable the hardware counter. Do not reset the counter val=
ue;
+leave the later common initialization unchanged.
+
+Use the same hook for FPGA, A35 FVP and A320 FVP. Keep the common GPT-be=
fore-
+MMU ordering and reset handling unchanged, without diagnostic flash read=
s
+or console output.
+
+This is a timing workaround, not a hardware readiness check. The underly=
ing
+cause and any required hardware settling interval remain under investiga=
tion;
+25 ms is the tested delay, not a documented minimum platform requirement=
.
+
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-A/tr=
usted-firmware-a/+/54910]
+Signed-off-by: Oscar Belshaw <Oscar.Belshaw@arm.com>
+---
+ .../corstone1000/common/corstone1000_plat.c      | 28 +++++++++++++++++=
+++
+ 1 file changed, 28 insertions(+)
+
+diff --git a/plat/arm/board/corstone1000/common/corstone1000_plat.c b/pl=
at/arm/board/corstone1000/common/corstone1000_plat.c
+index d34e80b..1c51145 100644
+--- a/plat/arm/board/corstone1000/common/corstone1000_plat.c
++++ b/plat/arm/board/corstone1000/common/corstone1000_plat.c
+@@ -6,10 +6,14 @@
+=20
+ #include <assert.h>
+=20
++#include <arch.h>
+ #include <common/bl_common.h>
++#include <common/debug.h>
+=20
++#include <drivers/delay_timer.h>
+ #include <drivers/generic_delay_timer.h>
+ #include <drivers/io/io_storage.h>
++#include <lib/mmio.h>
+ #include <plat/common/platform.h>
+ #include <plat/arm/common/arm_fconf_getter.h>
+ #include <plat/arm/common/arm_fconf_io_storage.h>
+@@ -33,6 +37,30 @@ const mmap_region_t plat_arm_mmap[] =3D {
+ 	{0}
+ };
+=20
++#define CS1K_GPT_DELAY	25U /* GPT initialization delay in milliseconds.=
 */
++
++#if defined(IMAGE_BL2) && RESET_TO_BL2 && ARM_GPT_SUPPORT
++void plat_arm_io_setup(void)
++{
++	int err;
++
++	err =3D arm_io_setup();
++	if (err < 0) {
++		panic();
++	}
++
++	/*
++	 * Allow time before early memory-mapped flash reads. This is a
++	 * workaround for invalid GPT reads observed on MPS3; the underlying
++	 * readiness requirement still needs investigation.
++	 */
++	mmio_write_32(ARM_SYS_CNTCTL_BASE + CNTCR_OFF,
++		     CNTCR_FCREQ(0U) | CNTCR_EN);
++	generic_delay_timer_init();
++	mdelay(CS1K_GPT_DELAY);
++}
++#endif
++
+ static void set_fip_image_source(void)
+ {
+ 	const struct plat_io_policy *policy;
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/tf-a-tests/0001-plat-corstone1000-Add-Cortex-A320-support.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/tf-a-tests/000=
1-plat-corstone1000-Add-Cortex-A320-support.patch
deleted file mode 100644
index 825df2714c..0000000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/tf-a=
-tests/0001-plat-corstone1000-Add-Cortex-A320-support.patch
+++ /dev/null
@@ -1,157 +0,0 @@
-From ff4bb404474a3310654827c36c4ac882eb0344b5 Mon Sep 17 00:00:00 2001
-From: Michael Safwat <michael.safwat@arm.com>
-Date: Tue, 26 Aug 2025 11:20:01 +0000
-Subject: [PATCH] plat: corstone1000: Add Cortex-A320 support
-
-Switch platform to GICv3 (GIC-600) for Corstone-1000 with Cortex-A320
-depending on CORSTONE1000_CORTEX_A320:
-    - Define GICD and GICR bases.
-    - Update the platform sources to include the GIC-V3 files.
-
-Move the NVM offset to prevent overlap with the TFTF firmware,
-which starts at 0x80000000 (TFTF_BASE).
-
-Introduce a new skip file tests_to_skip_cortex_a320 to be used when buil=
ding
-TF-A-Tests with CORSTONE1000_CORTEX_A320=3D1. This ensures that tests wh=
ich
-are not supported or cause traps on Corstone-1000 with Cortex-A320 are
-consistently skipped during execution.
-
-Skipped entries:
-    CPU extensions/AMUv1 suspend/resume
-    CPU extensions/Use trace buffer control Registers
-
-Signed-off-by: Michael Safwat <michael.safwat@arm.com>
-Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
-Upstream-Status: Submitted (https://review.trustedfirmware.org/c/TF-A/tf=
-a-tests/+/42352)
----
- plat/arm/corstone1000/corstone1000_def.h      | 12 ++++++++++-
- plat/arm/corstone1000/include/platform_def.h  | 11 +++++-----
- plat/arm/corstone1000/platform.mk             | 20 ++++++++++++++++++
- .../tests_to_skip_cortex_a320.txt             | 21 +++++++++++++++++++
- 4 files changed, 58 insertions(+), 6 deletions(-)
- create mode 100644 plat/arm/corstone1000/tests_to_skip_cortex_a320.txt
-
-diff --git a/plat/arm/corstone1000/corstone1000_def.h b/plat/arm/corston=
e1000/corstone1000_def.h
-index 3e6f036acc9a..c4fa9a3b5f68 100644
---- a/plat/arm/corstone1000/corstone1000_def.h
-+++ b/plat/arm/corstone1000/corstone1000_def.h
-@@ -26,13 +26,23 @@
-  * GIC-400 & interrupt handling related constants
-  **********************************************************************=
********/
- /* GIC memory map */
-+#ifdef CORSTONE1000_CORTEX_A320
-+#define GICD_BASE	0x1C000000
-+#define GICR_BASE	0x1C040000
-+
-+/* GIC re-distributor doesn't exits on gic-600, but we still need to
-+ * provide GICC_BASE as the gic driver needs it
-+ */
-+#define GICC_BASE		0x0
-+#else
-+
- #define GICD_BASE		0x1C010000
- #define GICC_BASE		0x1C02F000
- /* GIC re-distributor doesn't exits on gic-400, but we still need to
-  * provide GICR_BASE as the gic driver needs it
-  */
- #define GICR_BASE		0x0
--
-+#endif
- /**********************************************************************=
*********
-  * PL011 related constants
-  **********************************************************************=
********/
-diff --git a/plat/arm/corstone1000/include/platform_def.h b/plat/arm/cor=
stone1000/include/platform_def.h
-index 91f4cda19a90..2a9e5c4c35bb 100644
---- a/plat/arm/corstone1000/include/platform_def.h
-+++ b/plat/arm/corstone1000/include/platform_def.h
-@@ -98,12 +98,13 @@
- #endif
-=20
- /*
-- * USE 0x200000 DRAM offset to store TFTF data
-- *
-- * Please note that this won't be suitable for all test scenarios and
-- * for this reason some tests will be disabled in this configuration.
-+ * When USE_NVM =3D 0, TFTF_NVM_OFFSET marks the DRAM region
-+ * used as NVM. This region must not overlap the memory where
-+ * the TFTF image is loaded. The load address is given by
-+ * the TFTF_BASE macro. Set TFTF_NVM_OFFSET to leave enough
-+ * space for the TFTF image.
-  */
--#define TFTF_NVM_OFFSET		0x40000
-+#define TFTF_NVM_OFFSET		0x80000
- #define TFTF_NVM_SIZE		(128 * SZ_1M)	/* 128 MB */
-=20
- /**********************************************************************=
*********
-diff --git a/plat/arm/corstone1000/platform.mk b/plat/arm/corstone1000/p=
latform.mk
-index cd7a19162bcf..dfdd27abd897 100644
---- a/plat/arm/corstone1000/platform.mk
-+++ b/plat/arm/corstone1000/platform.mk
-@@ -6,6 +6,16 @@
-=20
- PLAT_INCLUDES	:=3D	-Iplat/arm/corstone1000/include/
-=20
-+CORSTONE1000_CORTEX_A320   :=3D      0
-+ifeq (${CORSTONE1000_CORTEX_A320},1)
-+PLAT_SOURCES	:=3D	drivers/arm/timer/private_timer.c		\
-+                        drivers/arm/timer/system_timer.c               =
 \
-+                        plat/arm/corstone1000/plat_helpers.S           =
 \
-+                        plat/arm/corstone1000/corstone1000_pwr_state.c =
 \
-+                        plat/arm/corstone1000/corstone1000_topology.c  =
 \
-+                        plat/arm/corstone1000/corstone1000_mem_prot.c  =
 \
-+                        plat/arm/corstone1000/plat_setup.c
-+else
- PLAT_SOURCES	:=3D	drivers/arm/timer/private_timer.c		\
- 			drivers/arm/timer/system_timer.c		\
- 			plat/arm/corstone1000/plat_helpers.S		\
-@@ -13,6 +23,7 @@ PLAT_SOURCES	:=3D	drivers/arm/timer/private_timer.c		\
- 			plat/arm/corstone1000/corstone1000_topology.c	\
- 			plat/arm/corstone1000/corstone1000_mem_prot.c	\
- 			plat/arm/corstone1000/plat_setup.c
-+endif
-=20
- PLAT_SUPPORTS_NS_RESET	:=3D	1
-=20
-@@ -21,6 +32,15 @@ $(eval $(call assert_boolean,PLAT_SUPPORTS_NS_RESET))
- $(eval $(call add_define,TFTF_DEFINES,PLAT_SUPPORTS_NS_RESET))
-=20
- FIRMWARE_UPDATE :=3D 0
-+
-+ifeq ($(CORSTONE1000_CORTEX_A320),1)
-+$(eval $(call add_define,TFTF_DEFINES,CORSTONE1000_CORTEX_A320))
-+endif
-+
-+ifeq (${CORSTONE1000_CORTEX_A320},1)
-+PLAT_TESTS_SKIP_LIST    :=3D      plat/arm/corstone1000/tests_to_skip_c=
ortex_a320.txt
-+else
- PLAT_TESTS_SKIP_LIST    :=3D      plat/arm/corstone1000/tests_to_skip.t=
xt
-+endif
-=20
- include plat/arm/common/arm_common.mk
-diff --git a/plat/arm/corstone1000/tests_to_skip_cortex_a320.txt b/plat/=
arm/corstone1000/tests_to_skip_cortex_a320.txt
-new file mode 100644
-index 000000000000..87b9241daba0
---- /dev/null
-+++ b/plat/arm/corstone1000/tests_to_skip_cortex_a320.txt
-@@ -0,0 +1,21 @@
-+Realm payload tests
-+Realm payload boot
-+Realm payload multi CPU request
-+Realm payload Delegate and Undelegate
-+Multi CPU Realm payload Delegate and Undelegate
-+Testing delegation fails
-+Realm testing with SPM tests
-+PSCI System Suspend Validation
-+PSCI STAT/Stats test cases after system suspend
-+IRQ support in TSP/Resume preempted STD SMC after PSCI SYSTEM SUSPEND
-+PSCI SYSTEM SUSPEND stress tests
-+Timer framework Validation/Verify the timer interrupt generation
-+CPU Hotplug/CPU hotplug
-+PSCI CPU Suspend
-+PSCI CPU Suspend in OSI mode
-+PSCI STAT/for valid composite state CPU suspend
-+FF-A Setup and Discovery/FF-A RXTX remap unmapped region success
-+FF-A Memory Sharing/Normal World VM retrieve request into SPMC
-+Boot requirement tests
-+CPU extensions/AMUv1 suspend/resume
-+CPU extensions/Use trace buffer control Registers
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_%.bba=
ppend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_%.bbappend
index 34644585a6..63ad89c0e4 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_%.bbappend
@@ -9,8 +9,3 @@ EXTRA_OEMAKE:append:cortexa320 =3D " \
         CORSTONE1000_CORTEX_A320=3D1 \
         "
 TFTF_MODE:corstone1000 =3D "release"
-
-FILESEXTRAPATHS:prepend:corstone1000 :=3D "${THISDIR}/files/corstone1000=
/tf-a-tests:"
-SRC_URI:append:corstone1000 =3D " \
-        file://0001-plat-corstone1000-Add-Cortex-A320-support.patch \
-        "
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted=
-firmware-a-corstone1000.inc
index 86522d1b88..10fc6ea990 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
@@ -5,14 +5,12 @@ COMPATIBLE_MACHINE =3D "(corstone1000)"
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/corstone1000:"
 SRC_URI:append =3D " \
 	file://0001-Fix-FF-A-version-in-SPMC-manifest.patch \
-	file://0002-plat-corstone1000-add-Cortex-A320-support.patch \
-	file://0003-feat-corestone-1000-make-mutlicore-support-platform-.patch =
\
+	file://0002-plat-corstone1000-align-BL-config-region.patch \
+	file://0003-plat-corstone1000-delay-early-GPT-access.patch \
 "
=20
 TFA_DEBUG =3D "1"
 TFA_UBOOT ?=3D "1"
-#FIXME - this can be removed after moving to 2.15.0
-TFA_MBEDTLS =3D "1"
 TFA_BUILD_TARGET =3D "bl2 bl31 fip"
=20
 # Enabling Secure-EL1 Payload Dispatcher (SPD)

