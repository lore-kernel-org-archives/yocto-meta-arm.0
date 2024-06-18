Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DD05C27C4F
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 10:08:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.82597.1718705297492267532
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 18 Jun 2024 03:08:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF2ADDA7;
	Tue, 18 Jun 2024 03:08:41 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.30.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 820733F6A8;
	Tue, 18 Jun 2024 03:08:16 -0700 (PDT)
From: harsimransingh.tungal@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 3/5] arm-bsp/trusted-firmware-a: corstone1000: Multicore support for Corstone-1000 FVP
Date: Tue, 18 Jun 2024 11:07:55 +0100
Message-Id: <20240618100757.819376-4-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240618100757.819376-1-harsimransingh.tungal@arm.com>
References: <20240618100757.819376-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 18 Jun 2024 10:08:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5813

From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>

This changeset adds the multicore support in trusted-firmware-a for the C=
orstone-1000
FVP.

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 ...0-Add-multicore-support-for-FVP-plat.patch | 162 ++++++++++++++++++
 .../trusted-firmware-a-corstone1000.inc       |   1 +
 2 files changed, 163 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0006-feat-corstone1000-Add-multicore-support-for-FVP-plat.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0006-feat-corstone1000-Add-multicore-support-for-FVP-plat.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0006-feat-cors=
tone1000-Add-multicore-support-for-FVP-plat.patch
new file mode 100644
index 00000000..08b5c8f0
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0006=
-feat-corstone1000-Add-multicore-support-for-FVP-plat.patch
@@ -0,0 +1,162 @@
+From bd975fbcff8886b3d3ed3268d7b6fa41bd7fba2d Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Thu, 9 May 2024 16:59:34 +0000
+Subject: [PATCH] feat(corstone1000): add multicore support for fvp
+
+This changeset adds the multicore support for the Corstone-1000 FVP.
+It adds the PSCI CPU_ON and CPU_ON_FINISH power domain functionalities
+for the secondary cores.
+
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-A/tr=
usted-firmware-a/+/29176]
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ .../common/corstone1000_helpers.S             | 26 +++++++++++
+ .../corstone1000/common/corstone1000_pm.c     | 43 ++++++++++++++++++-
+ .../common/include/platform_def.h             | 15 ++++++-
+ plat/arm/board/corstone1000/platform.mk       |  8 ++++
+ 4 files changed, 90 insertions(+), 2 deletions(-)
+
+diff --git a/plat/arm/board/corstone1000/common/corstone1000_helpers.S b=
/plat/arm/board/corstone1000/common/corstone1000_helpers.S
+index cbe27c3b5..90dc4fee6 100644
+--- a/plat/arm/board/corstone1000/common/corstone1000_helpers.S
++++ b/plat/arm/board/corstone1000/common/corstone1000_helpers.S
+@@ -21,8 +21,34 @@
+ 	 * -------------------------------------------------------------------=
-
+ 	 */
+ func plat_secondary_cold_boot_setup
++#if defined(CORSTONE1000_FVP_MULTICORE)
++
++	/* Calculate the address of our hold entry */
++	bl	plat_my_core_pos
++	lsl	x0, x0, #CORSTONE1000_SECONDARY_CORE_HOLD_SHIFT
++	mov_imm	x2, CORSTONE1000_SECONDARY_CORE_HOLD_BASE
++=09
++	/* Set the wait state for the secondary core */
++	mov_imm	x3, CORSTONE1000_SECONDARY_CORE_STATE_WAIT
++	str	x3, [x2, x0]
++	dmb	ish
++
++	/* Poll until the primary core signals to go  */
++poll_mailbox:
++	ldr	x1, [x2, x0]
++	cmp	x1, #CORSTONE1000_SECONDARY_CORE_STATE_WAIT
++	beq	1f
++	mov_imm	x0, PLAT_ARM_TRUSTED_MAILBOX_BASE
++	ldr	x1, [x0]
++	br	x1
++1:
++	wfe
++	b	poll_mailbox
++#else
+ cb_panic:
+ 	b	cb_panic
++#endif
++
+ endfunc plat_secondary_cold_boot_setup
+=20
+ 	/* -------------------------------------------------------------------=
--
+diff --git a/plat/arm/board/corstone1000/common/corstone1000_pm.c b/plat=
/arm/board/corstone1000/common/corstone1000_pm.c
+index 4b0a791e7..9cd384e18 100644
+--- a/plat/arm/board/corstone1000/common/corstone1000_pm.c
++++ b/plat/arm/board/corstone1000/common/corstone1000_pm.c
+@@ -24,10 +24,51 @@ static void __dead2 corstone1000_system_reset(void)
+ 		wfi();
+ 	}
+ }
++#if defined(CORSTONE1000_FVP_MULTICORE)
++int corstone1000_validate_ns_entrypoint(uintptr_t entrypoint)
++{
++	/*
++	 * Check if the non secure entrypoint lies within the non
++	 * secure DRAM.
++	 */
++	if ((entrypoint >=3D ARM_NS_DRAM1_BASE) && (entrypoint < (ARM_NS_DRAM1=
_BASE + ARM_NS_DRAM1_SIZE))) {
++		return PSCI_E_SUCCESS;
++	}
++	return PSCI_E_INVALID_ADDRESS;
++}
++
++int corstone1000_pwr_domain_on(u_register_t mpidr)
++{
++	int core_index =3D plat_core_pos_by_mpidr(mpidr);
++	uint64_t *secondary_core_hold_base =3D (uint64_t *)CORSTONE1000_SECOND=
ARY_CORE_HOLD_BASE;
++
++	/* Validate the core index */
++	if ((core_index < 0) || (core_index > PLATFORM_CORE_COUNT)) {
++		return PSCI_E_INVALID_PARAMS;
++	}
++	secondary_core_hold_base[core_index] =3D CORSTONE1000_SECONDARY_CORE_S=
TATE_GO;
++	dsbish();
++	sev();
++
++	return PSCI_E_SUCCESS;
++}
+=20
++void corstone1000_pwr_domain_on_finish(const psci_power_state_t *target=
_state)
++{
++	(void)target_state;
++	plat_arm_gic_init();
++}
++#endif
+ plat_psci_ops_t plat_arm_psci_pm_ops =3D {
++#if defined(CORSTONE1000_FVP_MULTICORE)
++	.pwr_domain_on =3D corstone1000_pwr_domain_on,
++	.pwr_domain_on_finish =3D corstone1000_pwr_domain_on_finish,
++	.validate_ns_entrypoint =3D corstone1000_validate_ns_entrypoint,
++	.system_reset =3D corstone1000_system_reset,
++#else
++	.validate_ns_entrypoint =3D NULL,
+ 	.system_reset =3D corstone1000_system_reset,
+-	.validate_ns_entrypoint =3D NULL
++#endif
+ };
+=20
+ const plat_psci_ops_t *plat_arm_psci_override_pm_ops(plat_psci_ops_t *o=
ps)
+diff --git a/plat/arm/board/corstone1000/common/include/platform_def.h b=
/plat/arm/board/corstone1000/common/include/platform_def.h
+index 35bb6ad5c..56e124f96 100644
+--- a/plat/arm/board/corstone1000/common/include/platform_def.h
++++ b/plat/arm/board/corstone1000/common/include/platform_def.h
+@@ -251,7 +251,20 @@
+  */
+ #define ARM_LOCAL_STATE_OFF	U(2)
+=20
+-#define PLAT_ARM_TRUSTED_MAILBOX_BASE	ARM_TRUSTED_SRAM_BASE
++#define PLAT_ARM_TRUSTED_MAILBOX_BASE   ARM_TRUSTED_SRAM_BASE
++
++#if defined(CORSTONE1000_FVP_MULTICORE)
++/* The secondary core entrypoint address points to bl31_warm_entrypoint
++ * and the address size is 8 bytes */
++#define CORSTONE1000_SECONDARY_CORE_ENTRYPOINT_ADDRESS_SIZE 	UL(0x8)
++
++#define CORSTONE1000_SECONDARY_CORE_HOLD_BASE         (PLAT_ARM_TRUSTED=
_MAILBOX_BASE + \
++						CORSTONE1000_SECONDARY_CORE_ENTRYPOINT_ADDRESS_SIZE)
++#define CORSTONE1000_SECONDARY_CORE_STATE_WAIT ULL(0)
++#define CORSTONE1000_SECONDARY_CORE_STATE_GO   ULL(1)
++#define CORSTONE1000_SECONDARY_CORE_HOLD_SHIFT ULL(3)
++#endif
++
+ #define PLAT_ARM_NSTIMER_FRAME_ID	U(1)
+=20
+ #define PLAT_ARM_NS_IMAGE_BASE		(BL33_BASE)
+diff --git a/plat/arm/board/corstone1000/platform.mk b/plat/arm/board/co=
rstone1000/platform.mk
+index dcd0df844..71b7f324c 100644
+--- a/plat/arm/board/corstone1000/platform.mk
++++ b/plat/arm/board/corstone1000/platform.mk
+@@ -31,6 +31,14 @@ override NEED_BL31	:=3D	yes
+ NEED_BL32		:=3D	yes
+ override NEED_BL33	:=3D	yes
+=20
++ENABLE_MULTICORE	:=3D	0
++ifneq ($(filter ${TARGET_PLATFORM}, fvp),)
++ifeq (${ENABLE_MULTICORE},1)
++$(eval $(call add_define,CORSTONE1000_FVP_MULTICORE))
++endif
++endif
++
++
+ # Include GICv2 driver files
+ include drivers/arm/gic/v2/gicv2.mk
+=20
+--=20
+2.34.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted=
-firmware-a-corstone1000.inc
index f5737ca4..b19e52aa 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
@@ -9,6 +9,7 @@ SRC_URI:append =3D " \
 	file://0003-fix-spmd-remove-EL3-interrupt-registration.patch \
 	file://0004-fix-corstone1000-remove-unused-NS_SHARED_RAM-region.patch \
 	file://0005-fix-corstone1000-clean-the-cache-and-disable-interru.patch =
\
+	file://0006-feat-corstone1000-Add-multicore-support-for-FVP-plat.patch =
\
        "
=20
 TFA_DEBUG =3D "1"
--=20
2.25.1


