Return-Path: <alex.chapman@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CFF4FD8777
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 13:43:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.76212.1773754995878875384
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 06:43:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: alex.chapman@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56D7C19F6;
	Tue, 17 Mar 2026 06:43:09 -0700 (PDT)
Received: from e142473.cambridge.arm.com (e142473.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C4893F778;
	Tue, 17 Mar 2026 06:43:14 -0700 (PDT)
From: Alex Chapman <alex.chapman@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Alex Chapman <alex.chapman@arm.com>
Subject: [PATCH 2/3] arm-bsp/trusted-firmware-a: corstone1000: Remove FVP requirement for TF-A multicore
Date: Tue, 17 Mar 2026 13:42:56 +0000
Message-ID: <20260317134259.493017-3-alex.chapman@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317134259.493017-1-alex.chapman@arm.com>
References: <20260317134259.493017-1-alex.chapman@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 Mar 2026 13:43:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6958

To improve portability, testing coverage, and future platform enablement.

- Replace FVP-only multicore guards with platform-generic guards.
- Add the corresponding TF-A patch to the Corstone-1000 recipe.

Signed-off-by: Alex Chapman <alex.chapman@arm.com>
---
 ...000-make-mutlicore-support-platform-.patch | 113 ++++++++++++++++++
 .../trusted-firmware-a-corstone1000.inc       |   1 +
 2 files changed, 114 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0003-feat-corestone-1000-make-mutlicore-support-platform-.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0003-feat-corestone-1000-make-mutlicore-support-platform-.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0003-feat-core=
stone-1000-make-mutlicore-support-platform-.patch
new file mode 100644
index 00000000..c338fba0
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0003=
-feat-corestone-1000-make-mutlicore-support-platform-.patch
@@ -0,0 +1,113 @@
+From a9801643d9d4d3f24960c5f24d5f5c3fd4889cc1 Mon Sep 17 00:00:00 2001
+From: Alex Chapman <alecha05@e142473.arm.com>
+Date: Tue, 3 Mar 2026 17:00:58 +0000
+Subject: [PATCH] feat(corestone-1000): make mutlicore support platform g=
eneric
+
+To improve portability, testing coverage, and future platform enablement=
.
+
+- Replace FVP-only multicore checks with platform-generic checks.
+- Add the corresponding TF-M patch to the Corstone-1000 recipe.
+
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-A/tr=
usted-firmware-a/+/49092]
+Signed-off-by: Alex Chapman <alex.chapman@arm.com>
+---
+ plat/arm/board/corstone1000/common/corstone1000_helpers.S | 4 ++--
+ plat/arm/board/corstone1000/common/corstone1000_pm.c      | 6 +++---
+ plat/arm/board/corstone1000/common/include/platform_def.h | 4 ++--
+ plat/arm/board/corstone1000/platform.mk                   | 6 ++----
+ 4 files changed, 9 insertions(+), 11 deletions(-)
+
+diff --git a/plat/arm/board/corstone1000/common/corstone1000_helpers.S b=
/plat/arm/board/corstone1000/common/corstone1000_helpers.S
+index 665dbc61a..d41df4ebe 100644
+--- a/plat/arm/board/corstone1000/common/corstone1000_helpers.S
++++ b/plat/arm/board/corstone1000/common/corstone1000_helpers.S
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2021-2025 Arm Limited and Contributors. All rights res=
erved.
++ * Copyright (c) 2021-2026 Arm Limited and Contributors. All rights res=
erved.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -54,7 +54,7 @@ endfunc plat_arm_calc_core_pos
+ 	 * -------------------------------------------------------------------=
-
+ 	 */
+ func plat_secondary_cold_boot_setup
+-#if defined(CORSTONE1000_FVP_MULTICORE)
++#if defined(CORSTONE1000_MULTICORE)
+=20
+ 	/* Calculate the address of our hold entry */
+ 	bl	plat_my_core_pos
+diff --git a/plat/arm/board/corstone1000/common/corstone1000_pm.c b/plat=
/arm/board/corstone1000/common/corstone1000_pm.c
+index a87697e97..2c7a2c67b 100644
+--- a/plat/arm/board/corstone1000/common/corstone1000_pm.c
++++ b/plat/arm/board/corstone1000/common/corstone1000_pm.c
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2021-2025, Arm Limited and Contributors. All rights re=
served.
++ * Copyright (c) 2021-2026, Arm Limited and Contributors. All rights re=
served.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -41,7 +41,7 @@ static void corstone1000_system_reset(void)
+ 	*watchdog_ctrl_reg =3D SECURE_WATCHDOG_MASK_ENABLE;
+ }
+=20
+-#if defined(CORSTONE1000_FVP_MULTICORE)
++#if defined(CORSTONE1000_MULTICORE)
+ int corstone1000_validate_ns_entrypoint(uintptr_t entrypoint)
+ {
+ 	/*
+@@ -77,7 +77,7 @@ void corstone1000_pwr_domain_on_finish(const psci_powe=
r_state_t *target_state)
+ #endif
+=20
+ plat_psci_ops_t plat_arm_psci_pm_ops =3D {
+-#if defined(CORSTONE1000_FVP_MULTICORE)
++#if defined(CORSTONE1000_MULTICORE)
+ 	.pwr_domain_on =3D corstone1000_pwr_domain_on,
+ 	.pwr_domain_on_finish =3D corstone1000_pwr_domain_on_finish,
+ 	.validate_ns_entrypoint =3D corstone1000_validate_ns_entrypoint,
+diff --git a/plat/arm/board/corstone1000/common/include/platform_def.h b=
/plat/arm/board/corstone1000/common/include/platform_def.h
+index ffb1e2dec..4682b8b5d 100644
+--- a/plat/arm/board/corstone1000/common/include/platform_def.h
++++ b/plat/arm/board/corstone1000/common/include/platform_def.h
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2021-2025, Arm Limited and Contributors. All rights re=
served.
++ * Copyright (c) 2021-2026, Arm Limited and Contributors. All rights re=
served.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -266,7 +266,7 @@
+=20
+ #define PLAT_ARM_TRUSTED_MAILBOX_BASE	ARM_TRUSTED_SRAM_BASE
+=20
+-#if defined(CORSTONE1000_FVP_MULTICORE)
++#if defined(CORSTONE1000_MULTICORE)
+ /* The secondary core entrypoint address points to bl31_warm_entrypoint
+  * and the address size is 8 bytes */
+ #define CORSTONE1000_SECONDARY_CORE_ENTRYPOINT_ADDRESS_SIZE    UL(0x8)
+diff --git a/plat/arm/board/corstone1000/platform.mk b/plat/arm/board/co=
rstone1000/platform.mk
+index fe3e94865..dee40f3b3 100644
+--- a/plat/arm/board/corstone1000/platform.mk
++++ b/plat/arm/board/corstone1000/platform.mk
+@@ -1,5 +1,5 @@
+ #
+-# Copyright (c) 2021-2025 Arm Limited and Contributors. All rights rese=
rved.
++# Copyright (c) 2021-2026 Arm Limited and Contributors. All rights rese=
rved.
+ #
+ # SPDX-License-Identifier: BSD-3-Clause
+ #
+@@ -44,10 +44,8 @@ $(eval $(call add_define,CORSTONE1000_WITH_BL32))
+ endif
+=20
+ ENABLE_MULTICORE       :=3D      0
+-ifneq ($(filter ${TARGET_PLATFORM}, fvp),)
+ ifeq (${ENABLE_MULTICORE},1)
+-$(eval $(call add_define,CORSTONE1000_FVP_MULTICORE))
+-endif
++$(eval $(call add_define,CORSTONE1000_MULTICORE))
+ endif
+=20
+ ifdef CORSTONE1000_CORTEX_A320
+--=20
+2.43.0
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted=
-firmware-a-corstone1000.inc
index a6621145..c77ec29d 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
@@ -6,6 +6,7 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/corstone10=
00:"
 SRC_URI:append =3D " \
 	file://0001-Fix-FF-A-version-in-SPMC-manifest.patch \
 	file://0002-plat-corstone1000-add-Cortex-A320-support.patch \
+	file://0003-feat-corestone-1000-make-mutlicore-support-platform-.patch =
\
 "
=20
 TFA_DEBUG =3D "1"

