Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09405C636CF
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.28209.1650886283164647948
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 25 Apr 2022 04:31:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2CF51FB;
	Mon, 25 Apr 2022 04:31:22 -0700 (PDT)
Received: from e126835.cambridge.arm.com (e126835.cambridge.arm.com
 [10.1.30.150])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A5B6C3F73B;
	Mon, 25 Apr 2022 04:31:21 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>,
	Jon Mason <jon.mason@arm.com>
Subject: [PATCH honister 1/1] arm-bsp/trusted-firmware-a: corstone1000: update
 Tfa SHA
Date: Mon, 25 Apr 2022 12:31:12 +0100
Message-Id: <20220425113112.52438-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220425113112.52438-1-emekcan.aras@arm.com>
References: <20220425113112.52438-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 25 Apr 2022 19:26:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3295

From: Emekcan Aras <Emekcan.Aras@arm.com>

This commit updates Tfa SHA to remove the patches from the
recipe since all of them are upstreamed now.

Signed-off-by: Emekcan Aras emekcan.aras@arm.com
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../conf/machine/include/corstone1000.inc     |   2 +-
 .../0001-Rename-Diphda-to-corstone1000.patch  | 587 ------------------
 ...e1000-made-changes-to-accommodate-3M.patch | 201 ------
 ...plement-platform-specific-psci-reset.patch |  60 --
 ...change-base-address-of-FIP-in-the-fl.patch |  33 -
 ...identify-which-bank-to-load-fip-from.patch | 102 ---
 .../trusted-firmware-a-corstone1000.inc       |  13 +-
 7 files changed, 7 insertions(+), 991 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0001-Rename-Diphda-to-corstone1000.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0002-plat-arm-corstone1000-made-changes-to-accommodate-3M.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0003-corstone1000-implement-platform-specific-psci-reset.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0004-plat-arm-corstone1000-change-base-address-of-FIP-in-the-fl=
.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0005-plat-arm-corstone1000-identify-which-bank-to-load-fip-from=
.patch

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index 200fad1d..d8b20890 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -4,7 +4,7 @@ MACHINEOVERRIDES =3D. "corstone1000:"
=20
 # TF-A
 TFA_PLATFORM =3D "corstone1000"
-PREFERRED_VERSION_trusted-firmware-a ?=3D "2.5%"
+PREFERRED_VERSION_trusted-firmware-a ?=3D "2.6%"
 EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a"
=20
 TFA_BL2_BINARY =3D "bl2-corstone1000.bin"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0001-Rename-Diphda-to-corstone1000.patch b/meta-arm-bsp/recipes-bsp/tr=
usted-firmware-a/files/corstone1000/0001-Rename-Diphda-to-corstone1000.pa=
tch
deleted file mode 100644
index 47eb4e08..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0001=
-Rename-Diphda-to-corstone1000.patch
+++ /dev/null
@@ -1,587 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From b4d59c85d1045998275cd219efe5849803c2c616 Mon Sep 17 00:00:00 2001
-From: "Arpita S.K" <Arpita.S.K@arm.com>
-Date: Wed, 13 Oct 2021 18:05:11 +0530
-Subject: [PATCH] Rename Diphda to corstone1000
-
-Replace all the instances of Diphda as functions,
-macros etc. with corstone1000
-
-Signed-off-by: Arpita S.K <Arpita.S.K@arm.com>
----
- docs/about/maintainers.rst                    |  2 +-
- .../arm/{diphda =3D> corstone1000}/index.rst    |  6 +-
- docs/plat/arm/index.rst                       |  2 +-
- plat/arm/board/common/rotpk/arm_dev_rotpk.S   |  2 +-
- .../corstone1000_bl2_mem_params_desc.c}       |  8 +-
- .../common/corstone1000_err.c}                |  2 +-
- .../common/corstone1000_helpers.S}            |  4 +-
- .../common/corstone1000_plat.c}               |  6 +-
- .../common/corstone1000_pm.c}                 |  0
- .../common/corstone1000_security.c}           |  0
- .../common/corstone1000_stack_protector.c}    |  0
- .../common/corstone1000_topology.c}           | 12 +--
- .../common/corstone1000_trusted_boot.c}       |  2 +-
- .../fdts/corstone1000_spmc_manifest.dts}      |  0
- .../common/include/platform_def.h             | 52 ++++++------
- .../include/plat_macros.S                     |  0
- plat/arm/board/corstone1000/platform.mk       | 83 +++++++++++++++++++
- plat/arm/board/diphda/platform.mk             | 83 -------------------
- 18 files changed, 132 insertions(+), 132 deletions(-)
- rename docs/plat/arm/{diphda =3D> corstone1000}/index.rst (93%)
- rename plat/arm/board/{diphda/common/diphda_bl2_mem_params_desc.c =3D> =
corstone1000/common/corstone1000_bl2_mem_params_desc.c} (92%)
- rename plat/arm/board/{diphda/common/diphda_err.c =3D> corstone1000/com=
mon/corstone1000_err.c} (89%)
- rename plat/arm/board/{diphda/common/diphda_helpers.S =3D> corstone1000=
/common/corstone1000_helpers.S} (94%)
- rename plat/arm/board/{diphda/common/diphda_plat.c =3D> corstone1000/co=
mmon/corstone1000_plat.c} (92%)
- rename plat/arm/board/{diphda/common/diphda_pm.c =3D> corstone1000/comm=
on/corstone1000_pm.c} (100%)
- rename plat/arm/board/{diphda/common/diphda_security.c =3D> corstone100=
0/common/corstone1000_security.c} (100%)
- rename plat/arm/board/{diphda/common/diphda_stack_protector.c =3D> cors=
tone1000/common/corstone1000_stack_protector.c} (100%)
- rename plat/arm/board/{diphda/common/diphda_topology.c =3D> corstone100=
0/common/corstone1000_topology.c} (77%)
- rename plat/arm/board/{diphda/common/diphda_trusted_boot.c =3D> corston=
e1000/common/corstone1000_trusted_boot.c} (97%)
- rename plat/arm/board/{diphda/common/fdts/diphda_spmc_manifest.dts =3D>=
 corstone1000/common/fdts/corstone1000_spmc_manifest.dts} (100%)
- rename plat/arm/board/{diphda =3D> corstone1000}/common/include/platfor=
m_def.h (89%)
- rename plat/arm/board/{diphda =3D> corstone1000}/include/plat_macros.S =
(100%)
- create mode 100644 plat/arm/board/corstone1000/platform.mk
- delete mode 100644 plat/arm/board/diphda/platform.mk
-
-diff --git a/docs/about/maintainers.rst b/docs/about/maintainers.rst
-index 07f258c774..2d9eb1440d 100644
---- a/docs/about/maintainers.rst
-+++ b/docs/about/maintainers.rst
-@@ -399,7 +399,7 @@ Arm Rich IoT Platform ports
- :|G|: `vishnu-banavath`_
- :|F|: plat/arm/board/corstone700
- :|F|: plat/arm/board/a5ds
--:|F|: plat/arm/board/diphda
-+:|F|: plat/arm/board/corstone1000
-=20
- Arm Reference Design platform ports
- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
-diff --git a/docs/plat/arm/diphda/index.rst b/docs/plat/arm/corstone1000=
/index.rst
-similarity index 93%
-rename from docs/plat/arm/diphda/index.rst
-rename to docs/plat/arm/corstone1000/index.rst
-index 27afda43f5..b889b7f2e9 100644
---- a/docs/plat/arm/diphda/index.rst
-+++ b/docs/plat/arm/corstone1000/index.rst
-@@ -1,7 +1,7 @@
--Diphda Platform
-+Corstone1000 Platform
- =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
-=20
--Some of the features of the Diphda platform referenced in TF-A include:
-+Some of the features of the Corstone1000 platform referenced in TF-A in=
clude:
-=20
- - Cortex-A35 application processor (64-bit mode)
- - Secure Enclave
-@@ -37,7 +37,7 @@ Build Procedure (TF-A only)
-       CC=3Daarch64-none-elf-gcc \
-       V=3D1 \
-       BUILD_BASE=3D<path to the build folder> \
--      PLAT=3Ddiphda \
-+      PLAT=3Dcorstone1000 \
-       SPD=3Dspmd \
-       SPMD_SPM_AT_SEL2=3D0 \
-       DEBUG=3D1 \
-diff --git a/docs/plat/arm/index.rst b/docs/plat/arm/index.rst
-index c834f6ae70..23c561ff57 100644
---- a/docs/plat/arm/index.rst
-+++ b/docs/plat/arm/index.rst
-@@ -12,7 +12,7 @@ Arm Development Platforms
-    arm_fpga/index
-    arm-build-options
-    morello/index
--   diphda/index
-+   corstone1000/index
-=20
- This chapter holds documentation related to Arm's development platforms=
,
- including both software models (FVPs) and hardware development boards
-diff --git a/plat/arm/board/common/rotpk/arm_dev_rotpk.S b/plat/arm/boar=
d/common/rotpk/arm_dev_rotpk.S
-index 38f91fe5f8..125ddf67c7 100644
---- a/plat/arm/board/common/rotpk/arm_dev_rotpk.S
-+++ b/plat/arm/board/common/rotpk/arm_dev_rotpk.S
-@@ -4,7 +4,7 @@
-  * SPDX-License-Identifier: BSD-3-Clause
-  */
-=20
--/* diphda platform provides custom values for the macros defined in
-+/* corstone1000 platform provides custom values for the macros defined =
in
-  * arm_def.h , so only platform_def.h needs to be included
-  */
- #if !defined(TARGET_PLATFORM_FVP) && !defined(TARGET_PLATFORM_FPGA)
-diff --git a/plat/arm/board/diphda/common/diphda_bl2_mem_params_desc.c b=
/plat/arm/board/corstone1000/common/corstone1000_bl2_mem_params_desc.c
-similarity index 92%
-rename from plat/arm/board/diphda/common/diphda_bl2_mem_params_desc.c
-rename to plat/arm/board/corstone1000/common/corstone1000_bl2_mem_params=
_desc.c
-index 916c868d21..7baa82d31b 100644
---- a/plat/arm/board/diphda/common/diphda_bl2_mem_params_desc.c
-+++ b/plat/arm/board/corstone1000/common/corstone1000_bl2_mem_params_des=
c.c
-@@ -44,7 +44,7 @@ static bl_mem_params_node_t bl2_mem_params_descs[] =3D=
 {
- 		SET_STATIC_PARAM_HEAD(ep_info, PARAM_EP,
- 			VERSION_2, entry_point_info_t, SECURE | EXECUTABLE),
- 		.ep_info.pc =3D BL32_BASE,
--			.ep_info.args.arg0 =3D DIPHDA_TOS_FW_CONFIG_BASE,
-+			.ep_info.args.arg0 =3D CORSTONE1000_TOS_FW_CONFIG_BASE,
- 		SET_STATIC_PARAM_HEAD(image_info, PARAM_EP,
- 			VERSION_2, image_info_t, 0),
- 		.image_info.image_base =3D BL32_BASE,
-@@ -56,9 +56,9 @@ static bl_mem_params_node_t bl2_mem_params_descs[] =3D=
 {
- 	/* Fill TOS_FW_CONFIG related information */
- 	{
- 		.image_id =3D TOS_FW_CONFIG_ID,
--		.image_info.image_base =3D DIPHDA_TOS_FW_CONFIG_BASE,
--		.image_info.image_max_size =3D DIPHDA_TOS_FW_CONFIG_LIMIT - \
--			DIPHDA_TOS_FW_CONFIG_BASE,
-+		.image_info.image_base =3D CORSTONE1000_TOS_FW_CONFIG_BASE,
-+		.image_info.image_max_size =3D CORSTONE1000_TOS_FW_CONFIG_LIMIT - \
-+			CORSTONE1000_TOS_FW_CONFIG_BASE,
- 		SET_STATIC_PARAM_HEAD(ep_info, PARAM_IMAGE_BINARY,
- 			VERSION_2, entry_point_info_t, SECURE | NON_EXECUTABLE),
- 		SET_STATIC_PARAM_HEAD(image_info, PARAM_IMAGE_BINARY,
-diff --git a/plat/arm/board/diphda/common/diphda_err.c b/plat/arm/board/=
corstone1000/common/corstone1000_err.c
-similarity index 89%
-rename from plat/arm/board/diphda/common/diphda_err.c
-rename to plat/arm/board/corstone1000/common/corstone1000_err.c
-index 89a3b8249c..5f8e7da437 100644
---- a/plat/arm/board/diphda/common/diphda_err.c
-+++ b/plat/arm/board/corstone1000/common/corstone1000_err.c
-@@ -7,7 +7,7 @@
- #include <plat/arm/common/plat_arm.h>
-=20
- /*
-- * diphda error handler
-+ * corstone1000 error handler
-  */
- void __dead2 plat_arm_error_handler(int err)
- {
-diff --git a/plat/arm/board/diphda/common/diphda_helpers.S b/plat/arm/bo=
ard/corstone1000/common/corstone1000_helpers.S
-similarity index 94%
-rename from plat/arm/board/diphda/common/diphda_helpers.S
-rename to plat/arm/board/corstone1000/common/corstone1000_helpers.S
-index c9d2a88de9..87122270b0 100644
---- a/plat/arm/board/diphda/common/diphda_helpers.S
-+++ b/plat/arm/board/corstone1000/common/corstone1000_helpers.S
-@@ -29,7 +29,7 @@ endfunc plat_secondary_cold_boot_setup
- 	 * unsigned long plat_get_my_entrypoint (void);
- 	 *
- 	 * Main job of this routine is to distinguish between a cold and warm
--	 * boot. On diphda, this information can be queried from the power
-+	 * boot. On corstone1000, this information can be queried from the pow=
er
- 	 * controller. The Power Control SYS Status Register (PSYSR) indicates
- 	 * the wake-up reason for the CPU.
- 	 *
-@@ -61,7 +61,7 @@ func plat_is_my_cpu_primary
- 	mrs	x0, mpidr_el1
- 	mov_imm	x1, MPIDR_AFFINITY_MASK
- 	and	x0, x0, x1
--	cmp	x0, #DIPHDA_PRIMARY_CPU
-+	cmp	x0, #CORSTONE1000_PRIMARY_CPU
- 	cset	w0, eq
- 	ret
- endfunc plat_is_my_cpu_primary
-diff --git a/plat/arm/board/diphda/common/diphda_plat.c b/plat/arm/board=
/corstone1000/common/corstone1000_plat.c
-similarity index 92%
-rename from plat/arm/board/diphda/common/diphda_plat.c
-rename to plat/arm/board/corstone1000/common/corstone1000_plat.c
-index 28d15a59e6..7a38b0b2ee 100644
---- a/plat/arm/board/diphda/common/diphda_plat.c
-+++ b/plat/arm/board/corstone1000/common/corstone1000_plat.c
-@@ -21,12 +21,12 @@ const mmap_region_t plat_arm_mmap[] =3D {
- 	ARM_MAP_SHARED_RAM,
- 	ARM_MAP_NS_SHARED_RAM,
- 	ARM_MAP_NS_DRAM1,
--	DIPHDA_MAP_DEVICE,
--	DIPHDA_EXTERNAL_FLASH,
-+	CORSTONE1000_MAP_DEVICE,
-+	CORSTONE1000_EXTERNAL_FLASH,
- 	{0}
- };
-=20
--/* diphda only has one always-on power domain and there
-+/* corstone1000 only has one always-on power domain and there
-  * is no power control present
-  */
- void __init plat_arm_pwrc_setup(void)
-diff --git a/plat/arm/board/diphda/common/diphda_pm.c b/plat/arm/board/c=
orstone1000/common/corstone1000_pm.c
-similarity index 100%
-rename from plat/arm/board/diphda/common/diphda_pm.c
-rename to plat/arm/board/corstone1000/common/corstone1000_pm.c
-diff --git a/plat/arm/board/diphda/common/diphda_security.c b/plat/arm/b=
oard/corstone1000/common/corstone1000_security.c
-similarity index 100%
-rename from plat/arm/board/diphda/common/diphda_security.c
-rename to plat/arm/board/corstone1000/common/corstone1000_security.c
-diff --git a/plat/arm/board/diphda/common/diphda_stack_protector.c b/pla=
t/arm/board/corstone1000/common/corstone1000_stack_protector.c
-similarity index 100%
-rename from plat/arm/board/diphda/common/diphda_stack_protector.c
-rename to plat/arm/board/corstone1000/common/corstone1000_stack_protecto=
r.c
-diff --git a/plat/arm/board/diphda/common/diphda_topology.c b/plat/arm/b=
oard/corstone1000/common/corstone1000_topology.c
-similarity index 77%
-rename from plat/arm/board/diphda/common/diphda_topology.c
-rename to plat/arm/board/corstone1000/common/corstone1000_topology.c
-index 9dfd05d091..2a3b6913a1 100644
---- a/plat/arm/board/diphda/common/diphda_topology.c
-+++ b/plat/arm/board/corstone1000/common/corstone1000_topology.c
-@@ -7,8 +7,8 @@
- #include <plat/arm/common/plat_arm.h>
- #include <plat/common/platform.h>
-=20
--/* The diphda power domain tree descriptor */
--static unsigned char diphda_power_domain_tree_desc[PLAT_ARM_CLUSTER_COU=
NT
-+/* The corstone1000 power domain tree descriptor */
-+static unsigned char corstone1000_power_domain_tree_desc[PLAT_ARM_CLUST=
ER_COUNT
- 							+ 2];
- /**********************************************************************=
*********
-  * This function dynamically constructs the topology according to
-@@ -22,13 +22,13 @@ const unsigned char *plat_get_power_domain_tree_desc=
(void)
- 	 * The highest level is the system level. The next level is constitute=
d
- 	 * by clusters and then cores in clusters.
- 	 */
--	diphda_power_domain_tree_desc[0] =3D 1;
--	diphda_power_domain_tree_desc[1] =3D PLAT_ARM_CLUSTER_COUNT;
-+	corstone1000_power_domain_tree_desc[0] =3D 1;
-+	corstone1000_power_domain_tree_desc[1] =3D PLAT_ARM_CLUSTER_COUNT;
-=20
- 	for (i =3D 0; i < PLAT_ARM_CLUSTER_COUNT; i++)
--		diphda_power_domain_tree_desc[i + 2] =3D PLATFORM_CORE_COUNT;
-+		corstone1000_power_domain_tree_desc[i + 2] =3D PLATFORM_CORE_COUNT;
-=20
--	return diphda_power_domain_tree_desc;
-+	return corstone1000_power_domain_tree_desc;
- }
-=20
- /**********************************************************************=
********
-diff --git a/plat/arm/board/diphda/common/diphda_trusted_boot.c b/plat/a=
rm/board/corstone1000/common/corstone1000_trusted_boot.c
-similarity index 97%
-rename from plat/arm/board/diphda/common/diphda_trusted_boot.c
-rename to plat/arm/board/corstone1000/common/corstone1000_trusted_boot.c
-index ddb41faa6b..2e2e9475a5 100644
---- a/plat/arm/board/diphda/common/diphda_trusted_boot.c
-+++ b/plat/arm/board/corstone1000/common/corstone1000_trusted_boot.c
-@@ -38,7 +38,7 @@ int plat_get_rotpk_info(void *cookie, void **key_ptr, =
unsigned int *key_len,
-  */
- int plat_get_nv_ctr(void *cookie, unsigned int *nv_ctr)
- {
--    *nv_ctr =3D DIPHDA_FW_NVCTR_VAL;
-+    *nv_ctr =3D CORSTONE1000_FW_NVCTR_VAL;
-     return 0;
- }
-=20
-diff --git a/plat/arm/board/diphda/common/fdts/diphda_spmc_manifest.dts =
b/plat/arm/board/corstone1000/common/fdts/corstone1000_spmc_manifest.dts
-similarity index 100%
-rename from plat/arm/board/diphda/common/fdts/diphda_spmc_manifest.dts
-rename to plat/arm/board/corstone1000/common/fdts/corstone1000_spmc_mani=
fest.dts
-diff --git a/plat/arm/board/diphda/common/include/platform_def.h b/plat/=
arm/board/corstone1000/common/include/platform_def.h
-similarity index 89%
-rename from plat/arm/board/diphda/common/include/platform_def.h
-rename to plat/arm/board/corstone1000/common/include/platform_def.h
-index 37fd71b6aa..e36bb626ee 100644
---- a/plat/arm/board/diphda/common/include/platform_def.h
-+++ b/plat/arm/board/corstone1000/common/include/platform_def.h
-@@ -34,17 +34,17 @@
- #define V2M_IOFPGA_UART0_CLK_IN_HZ		50000000
- #define V2M_IOFPGA_UART1_CLK_IN_HZ		50000000
-=20
--/* Core/Cluster/Thread counts for diphda */
--#define DIPHDA_CLUSTER_COUNT			U(1)
--#define DIPHDA_MAX_CPUS_PER_CLUSTER		U(4)
--#define DIPHDA_MAX_PE_PER_CPU			U(1)
--#define DIPHDA_PRIMARY_CPU			U(0)
-+/* Core/Cluster/Thread counts for corstone1000 */
-+#define CORSTONE1000_CLUSTER_COUNT			U(1)
-+#define CORSTONE1000_MAX_CPUS_PER_CLUSTER		U(4)
-+#define CORSTONE1000_MAX_PE_PER_CPU			U(1)
-+#define CORSTONE1000_PRIMARY_CPU			U(0)
-=20
--#define PLAT_ARM_CLUSTER_COUNT		DIPHDA_CLUSTER_COUNT
-+#define PLAT_ARM_CLUSTER_COUNT		CORSTONE1000_CLUSTER_COUNT
-=20
- #define PLATFORM_CORE_COUNT			(PLAT_ARM_CLUSTER_COUNT *      \
--						DIPHDA_MAX_CPUS_PER_CLUSTER *  \
--						DIPHDA_MAX_PE_PER_CPU)
-+						CORSTONE1000_MAX_CPUS_PER_CLUSTER *  \
-+						CORSTONE1000_MAX_PE_PER_CPU)
-=20
- /* UART related constants */
- #define PLAT_ARM_BOOT_UART_BASE		0x1a510000
-@@ -85,7 +85,7 @@
-  *
-  *             BL32 (optee-os)
-  *
-- * <DIPHDA_TOS_FW_CONFIG_BASE> =3D 0x20ae000
-+ * <CORSTONE1000_TOS_FW_CONFIG_BASE> =3D 0x20ae000
-  *
-  *         partition size: 8 KB
-  *
-@@ -132,7 +132,7 @@
- #define ARM_DRAM1_END				(ARM_DRAM1_BASE +	\
- 						ARM_DRAM1_SIZE - 1)
-=20
--/* DRAM1 and DRAM2 are the same for diphda */
-+/* DRAM1 and DRAM2 are the same for corstone1000 */
- #define ARM_DRAM2_BASE			ARM_DRAM1_BASE
- #define ARM_DRAM2_SIZE			ARM_DRAM1_SIZE
- #define ARM_DRAM2_END				ARM_DRAM1_END
-@@ -173,13 +173,13 @@
- 						PLAT_ARM_MAX_BL31_SIZE)
- #define BL31_LIMIT				BL2_SIGNATURE_BASE
-=20
--#define DIPHDA_TOS_FW_CONFIG_BASE		(BL31_BASE - \
--						DIPHDA_TOS_FW_CONFIG_SIZE)
--#define DIPHDA_TOS_FW_CONFIG_SIZE		UL(0x00002000)  /* 8 KB */
--#define DIPHDA_TOS_FW_CONFIG_LIMIT		BL31_BASE
-+#define CORSTONE1000_TOS_FW_CONFIG_BASE		(BL31_BASE - \
-+						CORSTONE1000_TOS_FW_CONFIG_SIZE)
-+#define CORSTONE1000_TOS_FW_CONFIG_SIZE		UL(0x00002000)  /* 8 KB */
-+#define CORSTONE1000_TOS_FW_CONFIG_LIMIT		BL31_BASE
-=20
- #define BL32_BASE				ARM_BL_RAM_BASE
--#define PLAT_ARM_MAX_BL32_SIZE		(DIPHDA_TOS_FW_CONFIG_BASE - \
-+#define PLAT_ARM_MAX_BL32_SIZE		(CORSTONE1000_TOS_FW_CONFIG_BASE - \
- 						BL32_BASE)     /* 688 KB */
- #define BL32_LIMIT				(BL32_BASE + \
- 						PLAT_ARM_MAX_BL32_SIZE)
-@@ -220,7 +220,7 @@
- /*
-  * Define FW_CONFIG area base and limit. Leave enough space for BL2 mem=
info.
-  * FW_CONFIG is intended to host the device tree. Currently, This area =
is not
-- * used because diphda platform doesn't use a device tree at TF-A level=
.
-+ * used because corstone1000 platform doesn't use a device tree at TF-A=
 level.
-  */
- #define ARM_FW_CONFIG_BASE			(ARM_SHARED_RAM_BASE \
- 						+ sizeof(meminfo_t))
-@@ -261,8 +261,8 @@
-=20
- #define SYS_COUNTER_FREQ_IN_TICKS	UL(50000000) /* 50MHz */
-=20
--#define DIPHDA_IRQ_TZ_WDOG			32
--#define DIPHDA_IRQ_SEC_SYS_TIMER		34
-+#define CORSTONE1000_IRQ_TZ_WDOG			32
-+#define CORSTONE1000_IRQ_SEC_SYS_TIMER		34
-=20
- #define PLAT_MAX_PWR_LVL			2
- /*
-@@ -308,7 +308,7 @@
-=20
- #define PLATFORM_STACK_SIZE			UL(0x440)
-=20
--#define DIPHDA_EXTERNAL_FLASH			MAP_REGION_FLAT(	\
-+#define CORSTONE1000_EXTERNAL_FLASH			MAP_REGION_FLAT(	\
- 						PLAT_ARM_NVM_BASE,	\
- 						PLAT_ARM_NVM_SIZE,	\
- 						MT_DEVICE | MT_RO | MT_SECURE)
-@@ -356,11 +356,11 @@
- 						ARM_FW_CONFIG_BASE),   \
- 						MT_MEMORY | MT_RW | MT_SECURE)
-=20
--#define DIPHDA_DEVICE_BASE			(0x1A000000)
--#define DIPHDA_DEVICE_SIZE			(0x26000000)
--#define DIPHDA_MAP_DEVICE			MAP_REGION_FLAT(	\
--						DIPHDA_DEVICE_BASE,	\
--						DIPHDA_DEVICE_SIZE,	\
-+#define CORSTONE1000_DEVICE_BASE			(0x1A000000)
-+#define CORSTONE1000_DEVICE_SIZE			(0x26000000)
-+#define CORSTONE1000_MAP_DEVICE			MAP_REGION_FLAT(	\
-+						CORSTONE1000_DEVICE_BASE,	\
-+						CORSTONE1000_DEVICE_SIZE,	\
- 						MT_DEVICE | MT_RW | MT_SECURE)
-=20
- #define ARM_IRQ_SEC_PHY_TIMER			29
-@@ -406,9 +406,9 @@
-  */
- #define PLAT_ARM_G1S_IRQ_PROPS(grp)	\
- 	ARM_G1S_IRQ_PROPS(grp), \
--	INTR_PROP_DESC(DIPHDA_IRQ_TZ_WDOG, GIC_HIGHEST_SEC_PRIORITY, \
-+	INTR_PROP_DESC(CORSTONE1000_IRQ_TZ_WDOG, GIC_HIGHEST_SEC_PRIORITY, \
- 		(grp), GIC_INTR_CFG_LEVEL), \
--	INTR_PROP_DESC(DIPHDA_IRQ_SEC_SYS_TIMER, \
-+	INTR_PROP_DESC(CORSTONE1000_IRQ_SEC_SYS_TIMER, \
- 		GIC_HIGHEST_SEC_PRIORITY, (grp), GIC_INTR_CFG_LEVEL)
-=20
- #define PLAT_ARM_G0_IRQ_PROPS(grp)	ARM_G0_IRQ_PROPS(grp)
-diff --git a/plat/arm/board/diphda/include/plat_macros.S b/plat/arm/boar=
d/corstone1000/include/plat_macros.S
-similarity index 100%
-rename from plat/arm/board/diphda/include/plat_macros.S
-rename to plat/arm/board/corstone1000/include/plat_macros.S
-diff --git a/plat/arm/board/corstone1000/platform.mk b/plat/arm/board/co=
rstone1000/platform.mk
-new file mode 100644
-index 0000000000..93e2ea0826
---- /dev/null
-+++ b/plat/arm/board/corstone1000/platform.mk
-@@ -0,0 +1,83 @@
-+#
-+# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved=
.
-+#
-+# SPDX-License-Identifier: BSD-3-Clause
-+#
-+
-+# Making sure the corstone1000 platform type is specified
-+ifeq ($(filter ${TARGET_PLATFORM}, fpga fvp),)
-+	$(error TARGET_PLATFORM must be fpga or fvp)
-+endif
-+
-+CORSTONE1000_CPU_LIBS	+=3Dlib/cpus/aarch64/cortex_a35.S
-+
-+PLAT_INCLUDES		:=3D	-Iplat/arm/board/corstone1000/common/include	\
-+				-Iplat/arm/board/corstone1000/include		\
-+				-Iinclude/plat/arm/common			\
-+				-Iinclude/plat/arm/css/common/aarch64
-+
-+
-+CORSTONE1000_FW_NVCTR_VAL	:=3D	255
-+TFW_NVCTR_VAL		:=3D	${CORSTONE1000_FW_NVCTR_VAL}
-+NTFW_NVCTR_VAL		:=3D	${CORSTONE1000_FW_NVCTR_VAL}
-+
-+override NEED_BL1	:=3D	no
-+
-+override NEED_BL2	:=3D	yes
-+FIP_BL2_ARGS :=3D tb-fw
-+
-+override NEED_BL2U	:=3D	no
-+override NEED_BL31	:=3D	yes
-+NEED_BL32		:=3D	yes
-+override NEED_BL33	:=3D	yes
-+
-+# Include GICv2 driver files
-+include drivers/arm/gic/v2/gicv2.mk
-+
-+CORSTONE1000_GIC_SOURCES	:=3D	${GICV2_SOURCES}			\
-+				plat/common/plat_gicv2.c		\
-+				plat/arm/common/arm_gicv2.c
-+
-+
-+BL2_SOURCES		+=3D	plat/arm/board/corstone1000/common/corstone1000_secur=
ity.c		\
-+				plat/arm/board/corstone1000/common/corstone1000_err.c		\
-+				plat/arm/board/corstone1000/common/corstone1000_trusted_boot.c	\
-+				lib/utils/mem_region.c					\
-+				plat/arm/board/corstone1000/common/corstone1000_helpers.S		\
-+				plat/arm/board/corstone1000/common/corstone1000_plat.c		\
-+				plat/arm/board/corstone1000/common/corstone1000_bl2_mem_params_desc=
.c \
-+				${CORSTONE1000_CPU_LIBS}					\
-+
-+
-+BL31_SOURCES	+=3D	drivers/cfi/v2m/v2m_flash.c				\
-+			lib/utils/mem_region.c					\
-+			plat/arm/board/corstone1000/common/corstone1000_helpers.S		\
-+			plat/arm/board/corstone1000/common/corstone1000_topology.c		\
-+			plat/arm/board/corstone1000/common/corstone1000_security.c		\
-+			plat/arm/board/corstone1000/common/corstone1000_plat.c		\
-+			plat/arm/board/corstone1000/common/corstone1000_pm.c		\
-+			${CORSTONE1000_CPU_LIBS}					\
-+			${CORSTONE1000_GIC_SOURCES}
-+
-+ifneq (${ENABLE_STACK_PROTECTOR},0)
-+	ifneq (${ENABLE_STACK_PROTECTOR},none)
-+		CORSTONE1000_SECURITY_SOURCES :=3D plat/arm/board/corstone1000/common=
/corstone1000_stack_protector.c
-+		BL2_SOURCES +=3D ${CORSTONE1000_SECURITY_SOURCES}
-+		BL31_SOURCES +=3D ${CORSTONE1000_SECURITY_SOURCES}
-+	endif
-+endif
-+
-+FDT_SOURCES		+=3D	plat/arm/board/corstone1000/common/fdts/corstone1000_=
spmc_manifest.dts
-+CORSTONE1000_TOS_FW_CONFIG	:=3D	${BUILD_PLAT}/fdts/corstone1000_spmc_ma=
nifest.dtb
-+
-+# Add the SPMC manifest to FIP and specify the same to certtool
-+$(eval $(call TOOL_ADD_PAYLOAD,${CORSTONE1000_TOS_FW_CONFIG},--tos-fw-c=
onfig,${CORSTONE1000_TOS_FW_CONFIG}))
-+
-+# Adding TARGET_PLATFORM as a GCC define (-D option)
-+$(eval $(call add_define,TARGET_PLATFORM_$(call uppercase,${TARGET_PLAT=
FORM})))
-+
-+# Adding CORSTONE1000_FW_NVCTR_VAL as a GCC define (-D option)
-+$(eval $(call add_define,CORSTONE1000_FW_NVCTR_VAL))
-+
-+include plat/arm/common/arm_common.mk
-+include plat/arm/board/common/board_common.mk
-diff --git a/plat/arm/board/diphda/platform.mk b/plat/arm/board/diphda/p=
latform.mk
-deleted file mode 100644
-index 8b89cee7ed..0000000000
---- a/plat/arm/board/diphda/platform.mk
-+++ /dev/null
-@@ -1,83 +0,0 @@
--#
--# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved=
.
--#
--# SPDX-License-Identifier: BSD-3-Clause
--#
--
--# Making sure the diphda platform type is specified
--ifeq ($(filter ${TARGET_PLATFORM}, fpga fvp),)
--	$(error TARGET_PLATFORM must be fpga or fvp)
--endif
--
--DIPHDA_CPU_LIBS	+=3Dlib/cpus/aarch64/cortex_a35.S
--
--PLAT_INCLUDES		:=3D	-Iplat/arm/board/diphda/common/include	\
--				-Iplat/arm/board/diphda/include		\
--				-Iinclude/plat/arm/common			\
--				-Iinclude/plat/arm/css/common/aarch64
--
--
--DIPHDA_FW_NVCTR_VAL	:=3D	255
--TFW_NVCTR_VAL		:=3D	${DIPHDA_FW_NVCTR_VAL}
--NTFW_NVCTR_VAL		:=3D	${DIPHDA_FW_NVCTR_VAL}
--
--override NEED_BL1	:=3D	no
--
--override NEED_BL2	:=3D	yes
--FIP_BL2_ARGS :=3D tb-fw
--
--override NEED_BL2U	:=3D	no
--override NEED_BL31	:=3D	yes
--NEED_BL32		:=3D	yes
--override NEED_BL33	:=3D	yes
--
--# Include GICv2 driver files
--include drivers/arm/gic/v2/gicv2.mk
--
--DIPHDA_GIC_SOURCES	:=3D	${GICV2_SOURCES}			\
--				plat/common/plat_gicv2.c		\
--				plat/arm/common/arm_gicv2.c
--
--
--BL2_SOURCES		+=3D	plat/arm/board/diphda/common/diphda_security.c		\
--				plat/arm/board/diphda/common/diphda_err.c		\
--				plat/arm/board/diphda/common/diphda_trusted_boot.c	\
--				lib/utils/mem_region.c					\
--				plat/arm/board/diphda/common/diphda_helpers.S		\
--				plat/arm/board/diphda/common/diphda_plat.c		\
--				plat/arm/board/diphda/common/diphda_bl2_mem_params_desc.c \
--				${DIPHDA_CPU_LIBS}					\
--
--
--BL31_SOURCES	+=3D	drivers/cfi/v2m/v2m_flash.c				\
--			lib/utils/mem_region.c					\
--			plat/arm/board/diphda/common/diphda_helpers.S		\
--			plat/arm/board/diphda/common/diphda_topology.c		\
--			plat/arm/board/diphda/common/diphda_security.c		\
--			plat/arm/board/diphda/common/diphda_plat.c		\
--			plat/arm/board/diphda/common/diphda_pm.c		\
--			${DIPHDA_CPU_LIBS}					\
--			${DIPHDA_GIC_SOURCES}
--
--ifneq (${ENABLE_STACK_PROTECTOR},0)
--	ifneq (${ENABLE_STACK_PROTECTOR},none)
--		DIPHDA_SECURITY_SOURCES :=3D plat/arm/board/diphda/common/diphda_stac=
k_protector.c
--		BL2_SOURCES +=3D ${DIPHDA_SECURITY_SOURCES}
--		BL31_SOURCES +=3D ${DIPHDA_SECURITY_SOURCES}
--	endif
--endif
--
--FDT_SOURCES		+=3D	plat/arm/board/diphda/common/fdts/diphda_spmc_manifes=
t.dts
--DIPHDA_TOS_FW_CONFIG	:=3D	${BUILD_PLAT}/fdts/diphda_spmc_manifest.dtb
--
--# Add the SPMC manifest to FIP and specify the same to certtool
--$(eval $(call TOOL_ADD_PAYLOAD,${DIPHDA_TOS_FW_CONFIG},--tos-fw-config,=
${DIPHDA_TOS_FW_CONFIG}))
--
--# Adding TARGET_PLATFORM as a GCC define (-D option)
--$(eval $(call add_define,TARGET_PLATFORM_$(call uppercase,${TARGET_PLAT=
FORM})))
--
--# Adding DIPHDA_FW_NVCTR_VAL as a GCC define (-D option)
--$(eval $(call add_define,DIPHDA_FW_NVCTR_VAL))
--
--include plat/arm/common/arm_common.mk
--include plat/arm/board/common/board_common.mk
---=20
-2.33.0
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0002-plat-arm-corstone1000-made-changes-to-accommodate-3M.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0002-plat-arm-=
corstone1000-made-changes-to-accommodate-3M.patch
deleted file mode 100644
index ee62ff0e..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0002=
-plat-arm-corstone1000-made-changes-to-accommodate-3M.patch
+++ /dev/null
@@ -1,201 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From bf95f27e300e962140a5dec45c2b1727c0829511 Mon Sep 17 00:00:00 2001
-From: "Arpita S.K" <Arpita.S.K@arm.com>
-Date: Wed, 13 Oct 2021 14:49:26 +0530
-Subject: [PATCH] plat/arm: corstone1000: made changes to accommodate 3MB=
 for
- optee
-
-* These changes are required to accommodate 3MB for OP-TEE and this
-is required for SP's part of optee
-* Added size macro's for better readability of the code
-* Moved uboot execution memory from CVM to DDR
-
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
----
- include/plat/common/common_def.h              | 25 ++++++++
- .../common/corstone1000_bl2_mem_params_desc.c |  7 +--
- .../common/include/platform_def.h             | 59 +++++++++++--------
- 3 files changed, 64 insertions(+), 27 deletions(-)
-
-diff --git a/include/plat/common/common_def.h b/include/plat/common/comm=
on_def.h
-index 14ae603b9b..5bb58692ef 100644
---- a/include/plat/common/common_def.h
-+++ b/include/plat/common/common_def.h
-@@ -12,6 +12,31 @@
- #include <lib/utils_def.h>
- #include <lib/xlat_tables/xlat_tables_defs.h>
-=20
-+#define SZ_1K                          0x00000400
-+#define SZ_2K                          0x00000800
-+#define SZ_4K                          0x00001000
-+#define SZ_8K                          0x00002000
-+#define SZ_16K                         0x00004000
-+#define SZ_32K                         0x00008000
-+#define SZ_64K                         0x00010000
-+#define SZ_128K                                0x00020000
-+#define SZ_256K                                0x00040000
-+#define SZ_512K                                0x00080000
-+
-+#define SZ_1M                          0x00100000
-+#define SZ_2M                          0x00200000
-+#define SZ_4M                          0x00400000
-+#define SZ_8M                          0x00800000
-+#define SZ_16M                         0x01000000
-+#define SZ_32M                         0x02000000
-+#define SZ_64M                         0x04000000
-+#define SZ_128M                                0x08000000
-+#define SZ_256M                                0x10000000
-+#define SZ_512M                                0x20000000
-+
-+#define SZ_1G                          0x40000000
-+#define SZ_2G                          0x80000000
-+
- /**********************************************************************=
********
-  * Required platform porting definitions that are expected to be common=
 to
-  * all platforms
-diff --git a/plat/arm/board/corstone1000/common/corstone1000_bl2_mem_par=
ams_desc.c b/plat/arm/board/corstone1000/common/corstone1000_bl2_mem_para=
ms_desc.c
-index 7baa82d31b..6e90936a14 100644
---- a/plat/arm/board/corstone1000/common/corstone1000_bl2_mem_params_des=
c.c
-+++ b/plat/arm/board/corstone1000/common/corstone1000_bl2_mem_params_des=
c.c
-@@ -71,13 +71,12 @@ static bl_mem_params_node_t bl2_mem_params_descs[] =3D=
 {
- 		.image_id =3D BL33_IMAGE_ID,
- 		SET_STATIC_PARAM_HEAD(ep_info, PARAM_EP,
- 			VERSION_2, entry_point_info_t, NON_SECURE | EXECUTABLE),
--		.ep_info.pc =3D PLAT_ARM_NS_IMAGE_BASE,
-+		.ep_info.pc =3D BL33_BASE,
-=20
- 		SET_STATIC_PARAM_HEAD(image_info, PARAM_EP,
- 			VERSION_2, image_info_t, 0),
--		.image_info.image_base =3D PLAT_ARM_NS_IMAGE_BASE,
--		.image_info.image_max_size =3D ARM_DRAM1_BASE + ARM_DRAM1_SIZE
--			- PLAT_ARM_NS_IMAGE_BASE,
-+		.image_info.image_base =3D BL33_BASE,
-+		.image_info.image_max_size =3D BL33_LIMIT - BL33_BASE,
-=20
- 		.next_handoff_image_id =3D INVALID_IMAGE_ID,
- 	},
-diff --git a/plat/arm/board/corstone1000/common/include/platform_def.h b=
/plat/arm/board/corstone1000/common/include/platform_def.h
-index e36bb626ee..a0ac0fe758 100644
---- a/plat/arm/board/corstone1000/common/include/platform_def.h
-+++ b/plat/arm/board/corstone1000/common/include/platform_def.h
-@@ -119,7 +119,7 @@
-  *
-  * <ARM_NS_SHARED_RAM_BASE> =3D <ARM_TRUSTED_SRAM_BASE> + 1 MB
-  *
-- *         partition size: 3 MB
-+ *         partition size: 512 KB
-  *
-  *         content:
-  *
-@@ -128,13 +128,13 @@
-=20
- /* DDR memory */
- #define ARM_DRAM1_BASE			UL(0x80000000)
--#define ARM_DRAM1_SIZE			UL(0x80000000)
-+#define ARM_DRAM1_SIZE                 (SZ_2G) /* 2GB*/
- #define ARM_DRAM1_END				(ARM_DRAM1_BASE +	\
- 						ARM_DRAM1_SIZE - 1)
-=20
- /* DRAM1 and DRAM2 are the same for corstone1000 */
--#define ARM_DRAM2_BASE			ARM_DRAM1_BASE
--#define ARM_DRAM2_SIZE			ARM_DRAM1_SIZE
-+#define ARM_DRAM2_BASE                         ARM_DRAM1_BASE
-+#define ARM_DRAM2_SIZE                         ARM_DRAM1_SIZE
- #define ARM_DRAM2_END				ARM_DRAM1_END
-=20
- #define ARM_NS_DRAM1_BASE			ARM_DRAM1_BASE
-@@ -144,23 +144,31 @@
-=20
- /* The first 8 KB of Trusted SRAM are used as shared memory */
- #define ARM_TRUSTED_SRAM_BASE			UL(0x02000000)
--#define ARM_SHARED_RAM_SIZE			UL(0x00002000)  /* 8 KB */
-+#define ARM_SHARED_RAM_SIZE                    (SZ_8K)  /* 8 KB */
- #define ARM_SHARED_RAM_BASE			ARM_TRUSTED_SRAM_BASE
-=20
- /* The remaining Trusted SRAM is used to load the BL images */
-+#define TOTAL_SRAM_SIZE                                (SZ_4M) /* 4 MB =
*/
-=20
--#define PLAT_ARM_TRUSTED_SRAM_SIZE		UL(0x00100000)  /* 1 MB */
-+/* Last 512KB of CVM is allocated for shared RAM
-+ * as an example openAMP */
-+#define ARM_NS_SHARED_RAM_SIZE                 (512 * SZ_1K)
-=20
--#define PLAT_ARM_MAX_BL2_SIZE			UL(0x0002d000)  /* 180 KB */
-+#define PLAT_ARM_TRUSTED_SRAM_SIZE             (TOTAL_SRAM_SIZE - \
-+                                                ARM_NS_SHARED_RAM_SIZE =
- \
-+                                                ARM_SHARED_RAM_SIZE)
-=20
--#define PLAT_ARM_MAX_BL31_SIZE		UL(0x00023000)  /* 140 KB */
-+#define PLAT_ARM_MAX_BL2_SIZE                  (180 * SZ_1K)  /* 180 KB=
 */
-=20
--#define ARM_BL_RAM_BASE			(ARM_SHARED_RAM_BASE +	\
--						ARM_SHARED_RAM_SIZE)
--#define ARM_BL_RAM_SIZE			(PLAT_ARM_TRUSTED_SRAM_SIZE -	\
--						ARM_SHARED_RAM_SIZE)
-+#define PLAT_ARM_MAX_BL31_SIZE                  (140 * SZ_1K)  /* 140 K=
B */
-+
-+#define ARM_BL_RAM_BASE                                (ARM_SHARED_RAM_=
BASE +  \
-+                                                        ARM_SHARED_RAM_=
SIZE)
-+#define ARM_BL_RAM_SIZE                                (PLAT_ARM_TRUSTE=
D_SRAM_SIZE - \
-+                                                        ARM_SHARED_RAM_=
SIZE)
-+
-+#define BL2_SIGNATURE_SIZE                     (SZ_4K)  /* 4 KB */
-=20
--#define BL2_SIGNATURE_SIZE			UL(0x00001000)  /* 4 KB */
- #define BL2_SIGNATURE_BASE			(BL2_LIMIT - \
- 						PLAT_ARM_MAX_BL2_SIZE)
- #define BL2_BASE				(BL2_LIMIT - \
-@@ -175,14 +183,15 @@
-=20
- #define CORSTONE1000_TOS_FW_CONFIG_BASE		(BL31_BASE - \
- 						CORSTONE1000_TOS_FW_CONFIG_SIZE)
--#define CORSTONE1000_TOS_FW_CONFIG_SIZE		UL(0x00002000)  /* 8 KB */
-+#define CORSTONE1000_TOS_FW_CONFIG_SIZE              (SZ_8K)  /* 8 KB *=
/
- #define CORSTONE1000_TOS_FW_CONFIG_LIMIT		BL31_BASE
-=20
- #define BL32_BASE				ARM_BL_RAM_BASE
--#define PLAT_ARM_MAX_BL32_SIZE		(CORSTONE1000_TOS_FW_CONFIG_BASE - \
--						BL32_BASE)     /* 688 KB */
--#define BL32_LIMIT				(BL32_BASE + \
--						PLAT_ARM_MAX_BL32_SIZE)
-+#define PLAT_ARM_MAX_BL32_SIZE                 (CORSTONE1000_TOS_FW_CON=
FIG_BASE - \
-+                                                BL32_BASE)
-+
-+#define BL32_LIMIT                             (BL32_BASE + \
-+                                                PLAT_ARM_MAX_BL32_SIZE)
-=20
- /* SPD_spmd settings */
-=20
-@@ -191,10 +200,14 @@
-=20
- /* NS memory */
-=20
--/* The last 3 MB of the SRAM is allocated to the non secure area */
--#define ARM_NS_SHARED_RAM_BASE		(ARM_TRUSTED_SRAM_BASE + \
--						PLAT_ARM_TRUSTED_SRAM_SIZE)
--#define ARM_NS_SHARED_RAM_SIZE		UL(0x00300000)  /* 3 MB */
-+/* The last 512KB of the SRAM is allocated as shared memory */
-+#define ARM_NS_SHARED_RAM_BASE         (ARM_TRUSTED_SRAM_BASE + TOTAL_S=
RAM_SIZE - \
-+                                        (PLAT_ARM_MAX_BL31_SIZE + \
-+                                         PLAT_ARM_MAX_BL32_SIZE))
-+
-+#define BL33_BASE                      ARM_DRAM1_BASE
-+#define PLAT_ARM_MAX_BL33_SIZE         (12 * SZ_1M) /* 12 MB*/
-+#define BL33_LIMIT                     (ARM_DRAM1_BASE + PLAT_ARM_MAX_B=
L33_SIZE)
-=20
- /* end of the definition of SRAM memory layout */
-=20
-@@ -204,7 +217,7 @@
- #define PLAT_ARM_FIP_MAX_SIZE			UL(0x1ff000)  /* 1.996 MB */
-=20
- #define PLAT_ARM_NVM_BASE			V2M_FLASH0_BASE
--#define PLAT_ARM_NVM_SIZE			UL(0x02000000)  /* 32 MB */
-+#define PLAT_ARM_NVM_SIZE			(SZ_32M)  /* 32 MB */
-=20
- #define PLAT_ARM_FLASH_IMAGE_BASE		PLAT_ARM_FIP_BASE
- #define PLAT_ARM_FLASH_IMAGE_MAX_SIZE		PLAT_ARM_FIP_MAX_SIZE
---=20
-2.33.0
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0003-corstone1000-implement-platform-specific-psci-reset.patch b/meta-=
arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0003-corstone10=
00-implement-platform-specific-psci-reset.patch
deleted file mode 100644
index 98f2e633..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0003=
-corstone1000-implement-platform-specific-psci-reset.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-
-From 1b99c6dd614002a79e4dda96d630089775a1d233 Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <Emekcan.Aras@arm.com>
-Date: Wed, 17 Nov 2021 18:45:32 +0000
-Subject: [PATCH] corstone1000: implement platform specific psci reset
-
-This implements platform specific psci reset for the corstone1000.
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
----
- .../corstone1000/common/corstone1000_pm.c     | 23 +++++++++++++++++--
- 1 file changed, 21 insertions(+), 2 deletions(-)
-
-diff --git a/plat/arm/board/corstone1000/common/corstone1000_pm.c b/plat=
/arm/board/corstone1000/common/corstone1000_pm.c
-index 12b322e27..e95ab30b7 100644
---- a/plat/arm/board/corstone1000/common/corstone1000_pm.c
-+++ b/plat/arm/board/corstone1000/common/corstone1000_pm.c
-@@ -6,17 +6,36 @@
-=20
- #include <lib/psci/psci.h>
- #include <plat/arm/common/plat_arm.h>
--
- /**********************************************************************=
*********
-  * Export the platform handlers via plat_arm_psci_pm_ops. The ARM Stand=
ard
-  * platform layer will take care of registering the handlers with PSCI.
-  **********************************************************************=
********/
-+
-+#define SECURE_WATCHDOG_ADDR_CTRL_REG     0x1A320000
-+#define SECURE_WATCHDOG_ADDR_VAL_REG      0x1A320008
-+#define SECURE_WATCHDOG_MASK_ENABLE       0x01
-+#define SECURE_WATCHDOG_COUNTDOWN_VAL     0x1000
-+
-+static void __dead2 corstone1000_system_reset(void)
-+{
-+
-+    uint32_t volatile * const watchdog_ctrl_reg =3D (int *) SECURE_WATC=
HDOG_ADDR_CTRL_REG;
-+    uint32_t volatile * const watchdog_val_reg =3D (int *) SECURE_WATCH=
DOG_ADDR_VAL_REG;
-+
-+   *(watchdog_val_reg) =3D SECURE_WATCHDOG_COUNTDOWN_VAL;
-+   *watchdog_ctrl_reg =3D SECURE_WATCHDOG_MASK_ENABLE;
-+     while (1){
-+        wfi();
-+    }
-+}
-+
- plat_psci_ops_t plat_arm_psci_pm_ops =3D {
--	/* dummy struct */
-+    .system_reset =3D corstone1000_system_reset,
- 	.validate_ns_entrypoint =3D NULL
- };
-=20
- const plat_psci_ops_t *plat_arm_psci_override_pm_ops(plat_psci_ops_t *o=
ps)
- {
-+    ops =3D &plat_arm_psci_pm_ops;
- 	return ops;
- }
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0004-plat-arm-corstone1000-change-base-address-of-FIP-in-the-fl.patch =
b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0004-pla=
t-arm-corstone1000-change-base-address-of-FIP-in-the-fl.patch
deleted file mode 100644
index 825c3aec..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0004=
-plat-arm-corstone1000-change-base-address-of-FIP-in-the-fl.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
-
-From 5541d466ebf46f0a14fae3effbcc46bcc2dd8efc Mon Sep 17 00:00:00 2001
-From: Satish Kumar <satish.kumar01@arm.com>
-Date: Mon, 20 Sep 2021 06:01:54 +0100
-Subject: [PATCH 1/1] plat/arm: corstone1000: change base address of FIP =
in the flash
-
-More space in the flash is reserved up front for metadata
-parser and UEFI variables. That requires change in the flash
-base address of where images are present.
-
-Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
----
- plat/arm/board/corstone1000/common/include/platform_def.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/plat/arm/board/corstone1000/common/include/platform_def.h b=
/plat/arm/board/corstone1000/common/include/platform_def.h
-index 97d7b2974..079b1c9d4 100644
---- a/plat/arm/board/corstone1000/common/include/platform_def.h
-+++ b/plat/arm/board/corstone1000/common/include/platform_def.h
-@@ -208,7 +208,7 @@
-=20
- /* NOR Flash */
-=20
--#define PLAT_ARM_FIP_BASE			UL(0x08131000)
-+#define PLAT_ARM_FIP_BASE			UL(0x081EF000)
- #define PLAT_ARM_FIP_MAX_SIZE			UL(0x1ff000)  /* 1.996 MB */
-=20
- #define PLAT_ARM_NVM_BASE			V2M_FLASH0_BASE
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0005-plat-arm-corstone1000-identify-which-bank-to-load-fip-from.patch =
b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0005-pla=
t-arm-corstone1000-identify-which-bank-to-load-fip-from.patch
deleted file mode 100644
index 18e784be..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0005=
-plat-arm-corstone1000-identify-which-bank-to-load-fip-from.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
-
-From 03218b5bb3ef32298624a54d1b3b3cf3c8c5d800 Mon Sep 17 00:00:00 2001
-From: Satish Kumar <satish.kumar01@arm.com>
-Date: Wed, 27 Oct 2021 16:31:04 +0100
-Subject: [PATCH 1/1] plat/arm: corstone1000: identify which bank to load=
 fip
- from
-
-Secure enclave decide the boot bank based on the firmware update
-state of the system and updated the boot bank information at a given
-location in the flash. In this commit, bl2 reads the givev flash locatio=
n
-to indentify the bank from which it should load fip from.
-
-Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
----
- .../corstone1000/common/corstone1000_plat.c   | 39 +++++++++++++++++++
- .../common/include/platform_def.h             |  6 ++-
- 2 files changed, 43 insertions(+), 2 deletions(-)
-
-diff --git a/plat/arm/board/corstone1000/common/corstone1000_plat.c b/pl=
at/arm/board/corstone1000/common/corstone1000_plat.c
-index 7a38b0b2e..4351d5e9d 100644
---- a/plat/arm/board/corstone1000/common/corstone1000_plat.c
-+++ b/plat/arm/board/corstone1000/common/corstone1000_plat.c
-@@ -11,6 +11,10 @@
- #include <plat/arm/common/plat_arm.h>
- #include <plat/common/platform.h>
- #include <platform_def.h>
-+#include <drivers/generic_delay_timer.h>
-+#include <plat/arm/common/arm_fconf_getter.h>
-+#include <plat/arm/common/arm_fconf_io_storage.h>
-+#include <drivers/io/io_storage.h>
-=20
- /*
-  * Table of regions to map using the MMU.
-@@ -26,6 +30,41 @@ const mmap_region_t plat_arm_mmap[] =3D {
- 	{0}
- };
-=20
-+void identify_fip_start_address(void)
-+{
-+	const struct plat_io_policy *policy;
-+	volatile uint32_t *boot_bank_flag =3D (uint32_t*)(PLAT_ARM_BOOT_BANK_F=
LAG);
-+
-+	VERBOSE("Boot bank flag =3D %u.\n\r", *boot_bank_flag);
-+
-+	policy =3D FCONF_GET_PROPERTY(arm, io_policies, FIP_IMAGE_ID);
-+
-+	assert(policy !=3D NULL);
-+	assert(policy->image_spec !=3D 0UL);
-+
-+	io_block_spec_t *spec =3D (io_block_spec_t *)policy->image_spec;
-+
-+	if ((*boot_bank_flag) =3D=3D 0) {
-+		VERBOSE("Booting from bank 0: fip offset =3D 0x%lx\n\r",
-+						PLAT_ARM_FIP_BASE_BANK0);
-+		spec->offset =3D PLAT_ARM_FIP_BASE_BANK0;
-+	} else {
-+		VERBOSE("Booting from bank 1: fip offset =3D 0x%lx\n\r",
-+						PLAT_ARM_FIP_BASE_BANK1);
-+		spec->offset =3D PLAT_ARM_FIP_BASE_BANK1;
-+	}
-+}
-+
-+void bl2_platform_setup(void)
-+{
-+	arm_bl2_platform_setup();
-+	/*
-+	 * Identify the start address of the FIP by reading the boot
-+	 * index flag from the flash.
-+	 */
-+	identify_fip_start_address();
-+}
-+
- /* corstone1000 only has one always-on power domain and there
-  * is no power control present
-  */
-diff --git a/plat/arm/board/corstone1000/common/include/platform_def.h b=
/plat/arm/board/corstone1000/common/include/platform_def.h
-index edc90fa72..868e41388 100644
---- a/plat/arm/board/corstone1000/common/include/platform_def.h
-+++ b/plat/arm/board/corstone1000/common/include/platform_def.h
-@@ -213,13 +213,15 @@
-=20
- /* NOR Flash */
-=20
--#define PLAT_ARM_FIP_BASE			UL(0x081EF000)
-+#define PLAT_ARM_BOOT_BANK_FLAG			UL(0x08002000)
-+#define PLAT_ARM_FIP_BASE_BANK0			UL(0x081EF000)
-+#define PLAT_ARM_FIP_BASE_BANK1			UL(0x0916F000)
- #define PLAT_ARM_FIP_MAX_SIZE			UL(0x1ff000)  /* 1.996 MB */
-=20
- #define PLAT_ARM_NVM_BASE			V2M_FLASH0_BASE
- #define PLAT_ARM_NVM_SIZE			(SZ_32M)  /* 32 MB */
-=20
--#define PLAT_ARM_FLASH_IMAGE_BASE		PLAT_ARM_FIP_BASE
-+#define PLAT_ARM_FLASH_IMAGE_BASE		PLAT_ARM_FIP_BASE_BANK0
- #define PLAT_ARM_FLASH_IMAGE_MAX_SIZE		PLAT_ARM_FIP_MAX_SIZE
-=20
- /*
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted=
-firmware-a-corstone1000.inc
index 08548d35..59eab653 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
@@ -11,13 +11,12 @@ PV .=3D "+git${SRCREV_tfa}"
 LIC_FILES_CHKSUM=3D"file://docs/license.rst;md5=3Db2c740efedc159745b9b31=
f88ff03dde file://mbedtls/LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57"
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/corstone1000:"
-SRC_URI:append =3D " \
-                 file://0001-Rename-Diphda-to-corstone1000.patch \
-                 file://0002-plat-arm-corstone1000-made-changes-to-accom=
modate-3M.patch \
-                 file://0003-corstone1000-implement-platform-specific-ps=
ci-reset.patch \
-                 file://0004-plat-arm-corstone1000-change-base-address-o=
f-FIP-in-the-fl.patch   \
-                 file://0005-plat-arm-corstone1000-identify-which-bank-t=
o-load-fip-from.patch   \
-                 "
+SRCREV_tfa =3D "cf89fd57ed3286d7842eef41cd72a3977eb6d317"
+PV =3D "2.6+git${SRCPV}"
+
+SRC_URI:remove =3D " \
+     file://ssl.patch \
+     " =20
=20
 TFA_DEBUG =3D "1"
 TFA_UBOOT =3D "1"
--=20
2.25.1


