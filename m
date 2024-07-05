Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB803C38150
	for <webhook@archiver.kernel.org>; Fri,  5 Jul 2024 16:06:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20411.1720195599368924170
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 05 Jul 2024 09:06:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17C3F367;
	Fri,  5 Jul 2024 09:07:04 -0700 (PDT)
Received: from e126523.arm.com (unknown [10.57.75.169])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9BFBC3F766;
	Fri,  5 Jul 2024 09:06:37 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH 1/3] arm-bsp/trusted-firmware-a: Upgrade Corstone1000 to TF-A v2.11
Date: Fri,  5 Jul 2024 18:06:20 +0200
Message-Id: <20240705160622.583987-2-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240705160622.583987-1-bence.balogh@arm.com>
References: <20240705160622.583987-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 05 Jul 2024 16:06:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5865

From: Bence Balogh <bence.balogh@arm.com>

Update the preferred version of TrustedFirmware-A for Cortsone-1000
from 2.10.x to 2.11.x to benefit from the latest fixes and improvements
as well as to reduce the number of out-of-tree patches.

As a result of updating the version:
* Remove no longer required out-of-tree patches
* Update the numbering of the remaining out-of-tree patches

Additionally remove unnecessary white spaces in modified BitBake files.

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 .../conf/machine/include/corstone1000.inc     |  2 +-
 ...-remove-unused-NS_SHARED_RAM-region.patch} |  0
 ...md-remove-EL3-interrupt-registration.patch | 54 -------------------
 ...clean-the-cache-and-disable-interru.patch} |  0
 ...-Add-multicore-support-for-FVP-plat.patch} | 33 ++++++------
 ...ne1000-include-platform-header-file.patch} |  0
 .../trusted-firmware-a-corstone1000.inc       | 17 +++---
 7 files changed, 25 insertions(+), 81 deletions(-)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/{0=
004-fix-corstone1000-remove-unused-NS_SHARED_RAM-region.patch =3D> 0003-f=
ix-corstone1000-remove-unused-NS_SHARED_RAM-region.patch} (100%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0003-fix-spmd-remove-EL3-interrupt-registration.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/{0=
005-fix-corstone1000-clean-the-cache-and-disable-interru.patch =3D> 0004-=
fix-corstone1000-clean-the-cache-and-disable-interru.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/{0=
006-feat-corstone1000-Add-multicore-support-for-FVP-plat.patch =3D> 0005-=
feat-corstone1000-Add-multicore-support-for-FVP-plat.patch} (89%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/{0=
007-feat-corstone1000-include-platform-header-file.patch =3D> 0006-feat-c=
orstone1000-include-platform-header-file.patch} (100%)

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index c78cc061..b540610e 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -7,7 +7,7 @@ PREFERRED_VERSION_trusted-firmware-m ?=3D "2.0.%"
=20
 # TF-A
 TFA_PLATFORM =3D "corstone1000"
-PREFERRED_VERSION_trusted-firmware-a ?=3D "2.10.%"
+PREFERRED_VERSION_trusted-firmware-a ?=3D "2.11.%"
 PREFERRED_VERSION_tf-a-tests ?=3D "2.10.%"
=20
 TFA_BL2_BINARY =3D "bl2-corstone1000.bin"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0004-fix-corstone1000-remove-unused-NS_SHARED_RAM-region.patch b/meta-=
arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0003-fix-corsto=
ne1000-remove-unused-NS_SHARED_RAM-region.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone100=
0/0004-fix-corstone1000-remove-unused-NS_SHARED_RAM-region.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/=
0003-fix-corstone1000-remove-unused-NS_SHARED_RAM-region.patch
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0003-fix-spmd-remove-EL3-interrupt-registration.patch b/meta-arm-bsp/r=
ecipes-bsp/trusted-firmware-a/files/corstone1000/0003-fix-spmd-remove-EL3=
-interrupt-registration.patch
deleted file mode 100644
index ea7a2913..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0003=
-fix-spmd-remove-EL3-interrupt-registration.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 684b8f88238f522b52eb102485762e02e6b1671a Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <Emekcan.Aras@arm.com>
-Date: Fri, 23 Feb 2024 13:17:59 +0000
-Subject: [PATCH] fix(spmd): remove EL3 interrupt registration
-
-This configuration should not be done for corstone1000 and similar
-platforms. GICv2 systems only support EL3 interrupts and can have SEL1 c=
omponent
-as SPMC.
-
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-Upstream-Status: Inappropriate [Discussions of fixing this in a better w=
ay is ongoing in upstream]
----
- services/std_svc/spmd/spmd_main.c | 24 ------------------------
- 1 file changed, 24 deletions(-)
-
-diff --git a/services/std_svc/spmd/spmd_main.c b/services/std_svc/spmd/s=
pmd_main.c
-index 066571e9b..313f05bf3 100644
---- a/services/std_svc/spmd/spmd_main.c
-+++ b/services/std_svc/spmd/spmd_main.c
-@@ -580,30 +580,6 @@ static int spmd_spmc_init(void *pm_addr)
- 		panic();
- 	}
-=20
--	/*
--	 * Permit configurations where the SPM resides at S-EL1/2 and upon a
--	 * Group0 interrupt triggering while the normal world runs, the
--	 * interrupt is routed either through the EHF or directly to the SPMD:
--	 *
--	 * EL3_EXCEPTION_HANDLING=3D0: the Group0 interrupt is routed to the S=
PMD
--	 *                   for handling by spmd_group0_interrupt_handler_nwd=
.
--	 *
--	 * EL3_EXCEPTION_HANDLING=3D1: the Group0 interrupt is routed to the E=
HF.
--	 *
--	 */
--#if (EL3_EXCEPTION_HANDLING =3D=3D 0)
--	/*
--	 * Register an interrupt handler routing Group0 interrupts to SPMD
--	 * while the NWd is running.
--	 */
--	rc =3D register_interrupt_type_handler(INTR_TYPE_EL3,
--					     spmd_group0_interrupt_handler_nwd,
--					     flags);
--	if (rc !=3D 0) {
--		panic();
--	}
--#endif
--
- 	return 0;
- }
-=20
---=20
-2.25.1
-
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0005-fix-corstone1000-clean-the-cache-and-disable-interru.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0004-fix-corst=
one1000-clean-the-cache-and-disable-interru.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone100=
0/0005-fix-corstone1000-clean-the-cache-and-disable-interru.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/=
0004-fix-corstone1000-clean-the-cache-and-disable-interru.patch
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0006-feat-corstone1000-Add-multicore-support-for-FVP-plat.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0005-feat-cors=
tone1000-Add-multicore-support-for-FVP-plat.patch
similarity index 89%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone100=
0/0006-feat-corstone1000-Add-multicore-support-for-FVP-plat.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/=
0005-feat-corstone1000-Add-multicore-support-for-FVP-plat.patch
index 34630442..2a385d83 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0006=
-feat-corstone1000-Add-multicore-support-for-FVP-plat.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0005=
-feat-corstone1000-Add-multicore-support-for-FVP-plat.patch
@@ -1,4 +1,4 @@
-From bd975fbcff8886b3d3ed3268d7b6fa41bd7fba2d Mon Sep 17 00:00:00 2001
+From dcc9cf5111c41edc691f007bd97548d96f5efddb Mon Sep 17 00:00:00 2001
 From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 Date: Thu, 9 May 2024 16:59:34 +0000
 Subject: [PATCH] feat(corstone1000): add multicore support for fvp
@@ -13,8 +13,8 @@ Signed-off-by: Harsimran Singh Tungal <harsimransingh.t=
ungal@arm.com>
  .../common/corstone1000_helpers.S             | 26 +++++++++++
  .../corstone1000/common/corstone1000_pm.c     | 43 ++++++++++++++++++-
  .../common/include/platform_def.h             | 15 ++++++-
- plat/arm/board/corstone1000/platform.mk       |  8 ++++
- 4 files changed, 90 insertions(+), 2 deletions(-)
+ plat/arm/board/corstone1000/platform.mk       |  7 +++
+ 4 files changed, 89 insertions(+), 2 deletions(-)
=20
 diff --git a/plat/arm/board/corstone1000/common/corstone1000_helpers.S b=
/plat/arm/board/corstone1000/common/corstone1000_helpers.S
 index cbe27c3b5..90dc4fee6 100644
@@ -56,10 +56,10 @@ index cbe27c3b5..90dc4fee6 100644
 =20
  	/* -------------------------------------------------------------------=
--
 diff --git a/plat/arm/board/corstone1000/common/corstone1000_pm.c b/plat=
/arm/board/corstone1000/common/corstone1000_pm.c
-index 4b0a791e7..9cd384e18 100644
+index a52e945bf..979243317 100644
 --- a/plat/arm/board/corstone1000/common/corstone1000_pm.c
 +++ b/plat/arm/board/corstone1000/common/corstone1000_pm.c
-@@ -24,10 +24,51 @@ static void __dead2 corstone1000_system_reset(void)
+@@ -33,10 +33,51 @@ static void __dead2 corstone1000_system_reset(void)
  		wfi();
  	}
  }
@@ -80,7 +80,7 @@ index 4b0a791e7..9cd384e18 100644
 +{
 +	int core_index =3D plat_core_pos_by_mpidr(mpidr);
 +	uint64_t *secondary_core_hold_base =3D (uint64_t *)CORSTONE1000_SECOND=
ARY_CORE_HOLD_BASE;
-+
+=20
 +	/* Validate the core index */
 +	if ((core_index < 0) || (core_index > PLATFORM_CORE_COUNT)) {
 +		return PSCI_E_INVALID_PARAMS;
@@ -91,7 +91,7 @@ index 4b0a791e7..9cd384e18 100644
 +
 +	return PSCI_E_SUCCESS;
 +}
-=20
++
 +void corstone1000_pwr_domain_on_finish(const psci_power_state_t *target=
_state)
 +{
 +	(void)target_state;
@@ -113,10 +113,10 @@ index 4b0a791e7..9cd384e18 100644
 =20
  const plat_psci_ops_t *plat_arm_psci_override_pm_ops(plat_psci_ops_t *o=
ps)
 diff --git a/plat/arm/board/corstone1000/common/include/platform_def.h b=
/plat/arm/board/corstone1000/common/include/platform_def.h
-index 35bb6ad5c..56e124f96 100644
+index b9a1d43df..c4839ccf3 100644
 --- a/plat/arm/board/corstone1000/common/include/platform_def.h
 +++ b/plat/arm/board/corstone1000/common/include/platform_def.h
-@@ -251,7 +251,20 @@
+@@ -249,7 +249,20 @@
   */
  #define ARM_LOCAL_STATE_OFF	U(2)
 =20
@@ -139,11 +139,11 @@ index 35bb6ad5c..56e124f96 100644
 =20
  #define PLAT_ARM_NS_IMAGE_BASE		(BL33_BASE)
 diff --git a/plat/arm/board/corstone1000/platform.mk b/plat/arm/board/co=
rstone1000/platform.mk
-index dcd0df844..71b7f324c 100644
+index fd08803e8..45092ace9 100644
 --- a/plat/arm/board/corstone1000/platform.mk
 +++ b/plat/arm/board/corstone1000/platform.mk
-@@ -31,6 +31,14 @@ override NEED_BL31	:=3D	yes
- NEED_BL32		:=3D	yes
+@@ -31,6 +31,13 @@ override NEED_BL31	:=3D	yes
+ NEED_BL32		?=3D	yes
  override NEED_BL33	:=3D	yes
 =20
 +ENABLE_MULTICORE	:=3D	0
@@ -153,10 +153,9 @@ index dcd0df844..71b7f324c 100644
 +endif
 +endif
 +
-+
- # Include GICv2 driver files
- include drivers/arm/gic/v2/gicv2.mk
-=20
+ # Add CORSTONE1000_WITH_BL32 as a preprocessor define (-D option)
+ ifeq (${NEED_BL32},yes)
+ $(eval $(call add_define,CORSTONE1000_WITH_BL32))
 --=20
-2.34.1
+2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0007-feat-corstone1000-include-platform-header-file.patch b/meta-arm-b=
sp/recipes-bsp/trusted-firmware-a/files/corstone1000/0006-feat-corstone10=
00-include-platform-header-file.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone100=
0/0007-feat-corstone1000-include-platform-header-file.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/=
0006-feat-corstone1000-include-platform-header-file.patch
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted=
-firmware-a-corstone1000.inc
index 3e7be142..f6677f70 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
@@ -6,11 +6,10 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/corstone=
1000:"
 SRC_URI:append =3D " \
 	file://0001-Fix-FF-A-version-in-SPMC-manifest.patch \
 	file://0002-fix-corstone1000-pass-spsr-value-explicitly.patch \
-	file://0003-fix-spmd-remove-EL3-interrupt-registration.patch \
-	file://0004-fix-corstone1000-remove-unused-NS_SHARED_RAM-region.patch \
-	file://0005-fix-corstone1000-clean-the-cache-and-disable-interru.patch =
\
-	file://0006-feat-corstone1000-Add-multicore-support-for-FVP-plat.patch =
\
-	file://0007-feat-corstone1000-include-platform-header-file.patch \
+	file://0003-fix-corstone1000-remove-unused-NS_SHARED_RAM-region.patch \
+	file://0004-fix-corstone1000-clean-the-cache-and-disable-interru.patch =
\
+	file://0005-feat-corstone1000-Add-multicore-support-for-FVP-plat.patch =
\
+	file://0006-feat-corstone1000-include-platform-header-file.patch \
        "
=20
 TFA_DEBUG =3D "1"
@@ -27,13 +26,13 @@ TFA_SPMD_SPM_AT_SEL2 =3D "0"
 # BL2 loads BL32 (optee). So, optee needs to be built first:
 DEPENDS +=3D "optee-os"
=20
-# Note: Regarding the build option: LOG_LEVEL.=20
+# Note: Regarding the build option: LOG_LEVEL.
 # There seems to be an issue when setting it
-# to 50 (LOG_LEVEL_VERBOSE), where the kernel=20
+# to 50 (LOG_LEVEL_VERBOSE), where the kernel
 # tee driver sends yielding requests to OP-TEE
 # at a faster pace than OP-TEE processes them,
-# as the processing time is consumed by logging=20
-# in TF-A. When this issue occurs, booting halts=20
+# as the processing time is consumed by logging
+# in TF-A. When this issue occurs, booting halts
 # as soon as optee driver starts initialization.
 # Therefore, it's not currently recommended to
 # set LOG_LEVEL to 50 at all.
--=20
2.25.1


