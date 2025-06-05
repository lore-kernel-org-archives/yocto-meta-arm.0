Return-Path: <clement.faure@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D633C5B552
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 13:31:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7796.1749130285908339402
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 05 Jun 2025 06:31:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: clement.faure@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1679D168F;
	Thu,  5 Jun 2025 06:31:08 -0700 (PDT)
Received: from MGC575JXM4.emea.arm.com (unknown [10.34.124.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA4653F5A1;
	Thu,  5 Jun 2025 06:31:24 -0700 (PDT)
From: Clement Faure <clement.faure@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20Faure?= <clement.faure@arm.com>
Subject: [PATCH 3/3] arm-bsp/trusted-firmware-a: corstone1000: remove TF-A 2.11.0 recipe
Date: Thu,  5 Jun 2025 15:31:08 +0200
Message-Id: <20250605133108.35177-4-clement.faure@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250605133108.35177-1-clement.faure@arm.com>
References: <20250605133108.35177-1-clement.faure@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 05 Jun 2025 13:31:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6532

From: Cl=C3=A9ment Faure <clement.faure@arm.com>

Remove TF-A 2.11.0 Yocto recipe.
Remove patches that are now upstreamed in TF-A 2.12

Signed-off-by: Cl=C3=A9ment Faure <clement.faure@arm.com>
---
 ...stone1000-pass-spsr-value-explicitly.patch |  32 ----
 ...0-remove-unused-NS_SHARED_RAM-region.patch |  92 ----------
 ...-clean-the-cache-and-disable-interru.patch |  46 -----
 ...0-Add-multicore-support-for-FVP-plat.patch | 161 ------------------
 ...one1000-include-platform-header-file.patch |  28 ---
 .../trusted-firmware-a-corstone1000.inc       |   5 -
 .../trusted-firmware-a_2.11.0.bb              |  20 ---
 7 files changed, 384 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0002-fix-corstone1000-pass-spsr-value-explicitly.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0003-fix-corstone1000-remove-unused-NS_SHARED_RAM-region.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0004-fix-corstone1000-clean-the-cache-and-disable-interru.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0005-feat-corstone1000-Add-multicore-support-for-FVP-plat.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0006-feat-corstone1000-include-platform-header-file.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-f=
irmware-a_2.11.0.bb

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0002-fix-corstone1000-pass-spsr-value-explicitly.patch b/meta-arm-bsp/=
recipes-bsp/trusted-firmware-a/files/corstone1000/0002-fix-corstone1000-p=
ass-spsr-value-explicitly.patch
deleted file mode 100644
index 276d095d..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0002=
-fix-corstone1000-pass-spsr-value-explicitly.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From d70a07562d3b0a7b4441922fd3ce136565927d04 Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <Emekcan.Aras@arm.com>
-Date: Wed, 21 Feb 2024 07:57:36 +0000
-Subject: [PATCH] fix(corstone1000): pass spsr value explicitly
-
-Passes spsr value for BL32 (OPTEE) explicitly between different boot
-stages.
-
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-A/tr=
usted-firmware-a/+/30116/2]
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
----
- .../corstone1000/common/corstone1000_bl2_mem_params_desc.c     | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/plat/arm/board/corstone1000/common/corstone1000_bl2_mem_par=
ams_desc.c b/plat/arm/board/corstone1000/common/corstone1000_bl2_mem_para=
ms_desc.c
-index fe521a9fa..2cc096f38 100644
---- a/plat/arm/board/corstone1000/common/corstone1000_bl2_mem_params_des=
c.c
-+++ b/plat/arm/board/corstone1000/common/corstone1000_bl2_mem_params_des=
c.c
-@@ -72,7 +72,8 @@ static bl_mem_params_node_t bl2_mem_params_descs[] =3D=
 {
- 		SET_STATIC_PARAM_HEAD(ep_info, PARAM_EP,
- 			VERSION_2, entry_point_info_t, NON_SECURE | EXECUTABLE),
- 		.ep_info.pc =3D BL33_BASE,
--
-+		.ep_info.spsr =3D SPSR_64(MODE_EL2, MODE_SP_ELX,
-+				       DISABLE_ALL_EXCEPTIONS),
- 		SET_STATIC_PARAM_HEAD(image_info, PARAM_EP,
- 			VERSION_2, image_info_t, 0),
- 		.image_info.image_base =3D BL33_BASE,
---=20
-2.25.1
-
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0003-fix-corstone1000-remove-unused-NS_SHARED_RAM-region.patch b/meta-=
arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0003-fix-corsto=
ne1000-remove-unused-NS_SHARED_RAM-region.patch
deleted file mode 100644
index f9a0c116..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0003=
-fix-corstone1000-remove-unused-NS_SHARED_RAM-region.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From 19600e6718e1a5b2ac8ec27d471acdafce0e433e Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <Emekcan.Aras@arm.com>
-Date: Thu, 25 Apr 2024 11:30:58 +0100
-Subject: [PATCH] fix(corstone1000): remove unused NS_SHARED_RAM region
-
-After enabling additional features in Trusted Services, the size of BL32=
 image
-(OP-TEE + Trusted Services SPs) is larger now. To create more space in s=
ecure RAM=20
-for BL32 image, this patch removes NS_SHARED_RAM region which is not cur=
rently used by
-corstone1000 platform.
-
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-A/tr=
usted-firmware-a/+/30117/2]
----
- .../corstone1000/common/corstone1000_plat.c   |  1 -
- .../common/include/platform_def.h             | 19 +------------------
- 2 files changed, 1 insertion(+), 19 deletions(-)
-
-diff --git a/plat/arm/board/corstone1000/common/corstone1000_plat.c b/pl=
at/arm/board/corstone1000/common/corstone1000_plat.c
-index ed3801caa..a9475859a 100644
---- a/plat/arm/board/corstone1000/common/corstone1000_plat.c
-+++ b/plat/arm/board/corstone1000/common/corstone1000_plat.c
-@@ -23,7 +23,6 @@
-=20
- const mmap_region_t plat_arm_mmap[] =3D {
- 	ARM_MAP_SHARED_RAM,
--	ARM_MAP_NS_SHARED_RAM,
- 	ARM_MAP_NS_DRAM1,
- 	CORSTONE1000_MAP_DEVICE,
- 	CORSTONE1000_EXTERNAL_FLASH,
-diff --git a/plat/arm/board/corstone1000/common/include/platform_def.h b=
/plat/arm/board/corstone1000/common/include/platform_def.h
-index 442d187f0..18fce4486 100644
---- a/plat/arm/board/corstone1000/common/include/platform_def.h
-+++ b/plat/arm/board/corstone1000/common/include/platform_def.h
-@@ -90,9 +90,6 @@
-  *	partition size: 176 KB
-  *	content: BL2
-  *
-- * <ARM_NS_SHARED_RAM_BASE> =3D <ARM_TRUSTED_SRAM_BASE> + 1 MB
-- *	partition size: 512 KB
-- *	content: BL33 (u-boot)
-  */
-=20
- /* DDR memory */
-@@ -117,11 +114,7 @@
- /* The remaining Trusted SRAM is used to load the BL images */
- #define TOTAL_SRAM_SIZE		(SZ_4M)  /* 4 MB */
-=20
--/* Last 512KB of CVM is allocated for shared RAM as an example openAMP =
*/
--#define ARM_NS_SHARED_RAM_SIZE	(512 * SZ_1K)
--
- #define PLAT_ARM_TRUSTED_SRAM_SIZE	(TOTAL_SRAM_SIZE - \
--					 ARM_NS_SHARED_RAM_SIZE - \
- 					 ARM_SHARED_RAM_SIZE)
-=20
- #define PLAT_ARM_MAX_BL2_SIZE	(180 * SZ_1K)  /* 180 KB */
-@@ -160,11 +153,6 @@
-=20
- /* NS memory */
-=20
--/* The last 512KB of the SRAM is allocated as shared memory */
--#define ARM_NS_SHARED_RAM_BASE	(ARM_TRUSTED_SRAM_BASE + TOTAL_SRAM_SIZE=
 - \
--				 (PLAT_ARM_MAX_BL31_SIZE + \
--				  PLAT_ARM_MAX_BL32_SIZE))
--
- #define BL33_BASE		ARM_DRAM1_BASE
- #define PLAT_ARM_MAX_BL33_SIZE	(12 * SZ_1M)  /* 12 MB*/
- #define BL33_LIMIT		(ARM_DRAM1_BASE + PLAT_ARM_MAX_BL33_SIZE)
-@@ -266,7 +254,7 @@
- #define PLAT_ARM_TRUSTED_MAILBOX_BASE	ARM_TRUSTED_SRAM_BASE
- #define PLAT_ARM_NSTIMER_FRAME_ID	U(1)
-=20
--#define PLAT_ARM_NS_IMAGE_BASE		(ARM_NS_SHARED_RAM_BASE)
-+#define PLAT_ARM_NS_IMAGE_BASE		(BL33_BASE)
-
- #define PLAT_PHY_ADDR_SPACE_SIZE	(1ULL << 32)
- #define PLAT_VIRT_ADDR_SPACE_SIZE	(1ULL << 32)
-@@ -295,11 +283,6 @@
- 				ARM_SHARED_RAM_SIZE, \
- 				MT_MEMORY | MT_RW | MT_SECURE)
-=20
--#define ARM_MAP_NS_SHARED_RAM	MAP_REGION_FLAT( \
--				ARM_NS_SHARED_RAM_BASE, \
--				ARM_NS_SHARED_RAM_SIZE, \
--				MT_MEMORY | MT_RW | MT_NS)
--
- #define ARM_MAP_NS_DRAM1	MAP_REGION_FLAT( \
- 				ARM_NS_DRAM1_BASE, \
- 				ARM_NS_DRAM1_SIZE, \
---=20
-2.25.1
-
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0004-fix-corstone1000-clean-the-cache-and-disable-interru.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0004-fix-corst=
one1000-clean-the-cache-and-disable-interru.patch
deleted file mode 100644
index e92cb5f9..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0004=
-fix-corstone1000-clean-the-cache-and-disable-interru.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 37f92eeb4361626072e690adb3b0bb20db7c2fca Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <Emekcan.Aras@arm.com>
-Date: Wed, 15 May 2024 13:54:51 +0100
-Subject: [PATCH] fix(corstone1000): clean the cache and disable interrup=
t
- before system reset
-
-Corstone1000 does not properly clean the cache and disable gic interrupt=
s
-before the reset. This causes a race condition especially in FVP after r=
eset.
-This adds proper sequence before resetting the platform.
-
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-A/tr=
usted-firmware-a/+/30118/2]
----
- plat/arm/board/corstone1000/common/corstone1000_pm.c | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/plat/arm/board/corstone1000/common/corstone1000_pm.c b/plat=
/arm/board/corstone1000/common/corstone1000_pm.c
-index 4b0a791e7..a52e945bf 100644
---- a/plat/arm/board/corstone1000/common/corstone1000_pm.c
-+++ b/plat/arm/board/corstone1000/common/corstone1000_pm.c
-@@ -7,6 +7,7 @@
- #include <lib/psci/psci.h>
- #include <plat/arm/common/plat_arm.h>
- #include <platform_def.h>
-+#include <drivers/arm/gicv2.h>
- /**********************************************************************=
*********
-  * Export the platform handlers via plat_arm_psci_pm_ops. The ARM Stand=
ard
-  * platform layer will take care of registering the handlers with PSCI.
-@@ -18,6 +19,14 @@ static void __dead2 corstone1000_system_reset(void)
- 	uint32_t volatile * const watchdog_ctrl_reg =3D (uint32_t *) SECURE_WA=
TCHDOG_ADDR_CTRL_REG;
- 	uint32_t volatile * const watchdog_val_reg =3D (uint32_t *) SECURE_WAT=
CHDOG_ADDR_VAL_REG;
-=20
-+	/* Flush and invalidate data cache */
-+	dcsw_op_all(DCCISW);
-+	/*
-+	 * Disable GIC CPU interface to prevent pending interrupt
-+	 * from waking up the AP from WFI.
-+	 */
-+	gicv2_cpuif_disable();
-+
- 	*(watchdog_val_reg) =3D SECURE_WATCHDOG_COUNTDOWN_VAL;
- 	*watchdog_ctrl_reg =3D SECURE_WATCHDOG_MASK_ENABLE;
- 	while (1) {
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0005-feat-corstone1000-Add-multicore-support-for-FVP-plat.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0005-feat-cors=
tone1000-Add-multicore-support-for-FVP-plat.patch
deleted file mode 100644
index 2a385d83..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0005=
-feat-corstone1000-Add-multicore-support-for-FVP-plat.patch
+++ /dev/null
@@ -1,161 +0,0 @@
-From dcc9cf5111c41edc691f007bd97548d96f5efddb Mon Sep 17 00:00:00 2001
-From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
-Date: Thu, 9 May 2024 16:59:34 +0000
-Subject: [PATCH] feat(corstone1000): add multicore support for fvp
-
-This changeset adds the multicore support for the Corstone-1000 FVP.
-It adds the PSCI CPU_ON and CPU_ON_FINISH power domain functionalities
-for the secondary cores.
-
-Upstream-Status: Backport [https://review.trustedfirmware.org/c/TF-A/tru=
sted-firmware-a/+/29176]
-Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
----
- .../common/corstone1000_helpers.S             | 26 +++++++++++
- .../corstone1000/common/corstone1000_pm.c     | 43 ++++++++++++++++++-
- .../common/include/platform_def.h             | 15 ++++++-
- plat/arm/board/corstone1000/platform.mk       |  7 +++
- 4 files changed, 89 insertions(+), 2 deletions(-)
-
-diff --git a/plat/arm/board/corstone1000/common/corstone1000_helpers.S b=
/plat/arm/board/corstone1000/common/corstone1000_helpers.S
-index cbe27c3b5..90dc4fee6 100644
---- a/plat/arm/board/corstone1000/common/corstone1000_helpers.S
-+++ b/plat/arm/board/corstone1000/common/corstone1000_helpers.S
-@@ -21,8 +21,34 @@
- 	 * -------------------------------------------------------------------=
-
- 	 */
- func plat_secondary_cold_boot_setup
-+#if defined(CORSTONE1000_FVP_MULTICORE)
-+
-+	/* Calculate the address of our hold entry */
-+	bl	plat_my_core_pos
-+	lsl	x0, x0, #CORSTONE1000_SECONDARY_CORE_HOLD_SHIFT
-+	mov_imm	x2, CORSTONE1000_SECONDARY_CORE_HOLD_BASE
-+=09
-+	/* Set the wait state for the secondary core */
-+	mov_imm	x3, CORSTONE1000_SECONDARY_CORE_STATE_WAIT
-+	str	x3, [x2, x0]
-+	dmb	ish
-+
-+	/* Poll until the primary core signals to go  */
-+poll_mailbox:
-+	ldr	x1, [x2, x0]
-+	cmp	x1, #CORSTONE1000_SECONDARY_CORE_STATE_WAIT
-+	beq	1f
-+	mov_imm	x0, PLAT_ARM_TRUSTED_MAILBOX_BASE
-+	ldr	x1, [x0]
-+	br	x1
-+1:
-+	wfe
-+	b	poll_mailbox
-+#else
- cb_panic:
- 	b	cb_panic
-+#endif
-+
- endfunc plat_secondary_cold_boot_setup
-=20
- 	/* -------------------------------------------------------------------=
--
-diff --git a/plat/arm/board/corstone1000/common/corstone1000_pm.c b/plat=
/arm/board/corstone1000/common/corstone1000_pm.c
-index a52e945bf..979243317 100644
---- a/plat/arm/board/corstone1000/common/corstone1000_pm.c
-+++ b/plat/arm/board/corstone1000/common/corstone1000_pm.c
-@@ -33,10 +33,51 @@ static void __dead2 corstone1000_system_reset(void)
- 		wfi();
- 	}
- }
-+#if defined(CORSTONE1000_FVP_MULTICORE)
-+int corstone1000_validate_ns_entrypoint(uintptr_t entrypoint)
-+{
-+	/*
-+	 * Check if the non secure entrypoint lies within the non
-+	 * secure DRAM.
-+	 */
-+	if ((entrypoint >=3D ARM_NS_DRAM1_BASE) && (entrypoint < (ARM_NS_DRAM1=
_BASE + ARM_NS_DRAM1_SIZE))) {
-+		return PSCI_E_SUCCESS;
-+	}
-+	return PSCI_E_INVALID_ADDRESS;
-+}
-+
-+int corstone1000_pwr_domain_on(u_register_t mpidr)
-+{
-+	int core_index =3D plat_core_pos_by_mpidr(mpidr);
-+	uint64_t *secondary_core_hold_base =3D (uint64_t *)CORSTONE1000_SECOND=
ARY_CORE_HOLD_BASE;
-=20
-+	/* Validate the core index */
-+	if ((core_index < 0) || (core_index > PLATFORM_CORE_COUNT)) {
-+		return PSCI_E_INVALID_PARAMS;
-+	}
-+	secondary_core_hold_base[core_index] =3D CORSTONE1000_SECONDARY_CORE_S=
TATE_GO;
-+	dsbish();
-+	sev();
-+
-+	return PSCI_E_SUCCESS;
-+}
-+
-+void corstone1000_pwr_domain_on_finish(const psci_power_state_t *target=
_state)
-+{
-+	(void)target_state;
-+	plat_arm_gic_init();
-+}
-+#endif
- plat_psci_ops_t plat_arm_psci_pm_ops =3D {
-+#if defined(CORSTONE1000_FVP_MULTICORE)
-+	.pwr_domain_on =3D corstone1000_pwr_domain_on,
-+	.pwr_domain_on_finish =3D corstone1000_pwr_domain_on_finish,
-+	.validate_ns_entrypoint =3D corstone1000_validate_ns_entrypoint,
-+	.system_reset =3D corstone1000_system_reset,
-+#else
-+	.validate_ns_entrypoint =3D NULL,
- 	.system_reset =3D corstone1000_system_reset,
--	.validate_ns_entrypoint =3D NULL
-+#endif
- };
-=20
- const plat_psci_ops_t *plat_arm_psci_override_pm_ops(plat_psci_ops_t *o=
ps)
-diff --git a/plat/arm/board/corstone1000/common/include/platform_def.h b=
/plat/arm/board/corstone1000/common/include/platform_def.h
-index b9a1d43df..c4839ccf3 100644
---- a/plat/arm/board/corstone1000/common/include/platform_def.h
-+++ b/plat/arm/board/corstone1000/common/include/platform_def.h
-@@ -249,7 +249,20 @@
-  */
- #define ARM_LOCAL_STATE_OFF	U(2)
-=20
--#define PLAT_ARM_TRUSTED_MAILBOX_BASE	ARM_TRUSTED_SRAM_BASE
-+#define PLAT_ARM_TRUSTED_MAILBOX_BASE   ARM_TRUSTED_SRAM_BASE
-+
-+#if defined(CORSTONE1000_FVP_MULTICORE)
-+/* The secondary core entrypoint address points to bl31_warm_entrypoint
-+ * and the address size is 8 bytes */
-+#define CORSTONE1000_SECONDARY_CORE_ENTRYPOINT_ADDRESS_SIZE 	UL(0x8)
-+
-+#define CORSTONE1000_SECONDARY_CORE_HOLD_BASE         (PLAT_ARM_TRUSTED=
_MAILBOX_BASE + \
-+						CORSTONE1000_SECONDARY_CORE_ENTRYPOINT_ADDRESS_SIZE)
-+#define CORSTONE1000_SECONDARY_CORE_STATE_WAIT ULL(0)
-+#define CORSTONE1000_SECONDARY_CORE_STATE_GO   ULL(1)
-+#define CORSTONE1000_SECONDARY_CORE_HOLD_SHIFT ULL(3)
-+#endif
-+
- #define PLAT_ARM_NSTIMER_FRAME_ID	U(1)
-=20
- #define PLAT_ARM_NS_IMAGE_BASE		(BL33_BASE)
-diff --git a/plat/arm/board/corstone1000/platform.mk b/plat/arm/board/co=
rstone1000/platform.mk
-index fd08803e8..45092ace9 100644
---- a/plat/arm/board/corstone1000/platform.mk
-+++ b/plat/arm/board/corstone1000/platform.mk
-@@ -31,6 +31,13 @@ override NEED_BL31	:=3D	yes
- NEED_BL32		?=3D	yes
- override NEED_BL33	:=3D	yes
-=20
-+ENABLE_MULTICORE	:=3D	0
-+ifneq ($(filter ${TARGET_PLATFORM}, fvp),)
-+ifeq (${ENABLE_MULTICORE},1)
-+$(eval $(call add_define,CORSTONE1000_FVP_MULTICORE))
-+endif
-+endif
-+
- # Add CORSTONE1000_WITH_BL32 as a preprocessor define (-D option)
- ifeq (${NEED_BL32},yes)
- $(eval $(call add_define,CORSTONE1000_WITH_BL32))
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0006-feat-corstone1000-include-platform-header-file.patch b/meta-arm-b=
sp/recipes-bsp/trusted-firmware-a/files/corstone1000/0006-feat-corstone10=
00-include-platform-header-file.patch
deleted file mode 100644
index 13310143..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0006=
-feat-corstone1000-include-platform-header-file.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 8070bf4a89492727b6da3fb7bdec61748eae1d7d Mon Sep 17 00:00:00 2001
-From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
-Date: Tue, 2 Jul 2024 12:49:12 +0000
-Subject: [PATCH] fix(corstone1000): include platform header file
-
-Include platform.h file in order to remove compiler warnings
-
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-A/tr=
usted-firmware-a/+/29727]
-Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
----
- plat/arm/board/corstone1000/common/corstone1000_pm.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/plat/arm/board/corstone1000/common/corstone1000_pm.c b/plat=
/arm/board/corstone1000/common/corstone1000_pm.c
-index 979243317..9babe5b11 100644
---- a/plat/arm/board/corstone1000/common/corstone1000_pm.c
-+++ b/plat/arm/board/corstone1000/common/corstone1000_pm.c
-@@ -8,6 +8,7 @@
- #include <plat/arm/common/plat_arm.h>
- #include <platform_def.h>
- #include <drivers/arm/gicv2.h>
-+#include <plat/common/platform.h>
- /**********************************************************************=
*********
-  * Export the platform handlers via plat_arm_psci_pm_ops. The ARM Stand=
ard
-  * platform layer will take care of registering the handlers with PSCI.
---=20
-2.34.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted=
-firmware-a-corstone1000.inc
index 5e41ab6e..97a9e55b 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
@@ -5,11 +5,6 @@ COMPATIBLE_MACHINE =3D "(corstone1000)"
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/corstone1000:"
 SRC_URI:append =3D " \
 	file://0001-Fix-FF-A-version-in-SPMC-manifest.patch \
-	file://0002-fix-corstone1000-pass-spsr-value-explicitly.patch \
-	file://0003-fix-corstone1000-remove-unused-NS_SHARED_RAM-region.patch \
-	file://0004-fix-corstone1000-clean-the-cache-and-disable-interru.patch =
\
-	file://0005-feat-corstone1000-Add-multicore-support-for-FVP-plat.patch =
\
-	file://0006-feat-corstone1000-include-platform-header-file.patch \
        "
=20
 TFA_DEBUG =3D "1"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_2.11.0.bb b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwa=
re-a_2.11.0.bb
deleted file mode 100644
index d4dd8c2a..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.11=
.0.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-require recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
-
-# TF-A v2.11.0
-SRCREV_tfa =3D "f2735ebccf5173f74c0458736ec526276106097e"
-SRCBRANCH =3D "master"
-
-LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3Db5fbfdeb6855162dded=
31fadcd5d4dc5"
-
-# in TF-A src, docs/getting_started/prerequisites.rst lists the expected=
 version mbedtls
-# mbedtls-3.6.0
-SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3Dmain"
-SRCREV_mbedtls =3D "2ca6c285a0dd3f33982dd57299012dacab1ff206"
-
-LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D379d5819937a6=
c2f1ef1630d341e026d"
-
-# continue to boot also without TPM
-SRC_URI +=3D "\
-    file://0001-qemu_measured_boot.c-ignore-TPM-error-and-continue-w.pat=
ch \
-    file://0001-fix-zynqmp-handle-secure-SGI-at-EL1-for-OP-TEE.patch \
-"

