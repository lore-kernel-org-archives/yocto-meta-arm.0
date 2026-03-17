Return-Path: <alex.chapman@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEBA5FD8770
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 13:43:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76261.1773754996497828751
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 06:43:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: alex.chapman@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F21811477;
	Tue, 17 Mar 2026 06:43:09 -0700 (PDT)
Received: from e142473.cambridge.arm.com (e142473.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7E9B3F778;
	Tue, 17 Mar 2026 06:43:15 -0700 (PDT)
From: Alex Chapman <alex.chapman@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Alex Chapman <alex.chapman@arm.com>
Subject: [PATCH 3/3] arm-bsp/trusted-firmware-m: corstone1000: Remove FVP requirement for TF-M multicore
Date: Tue, 17 Mar 2026 13:42:57 +0000
Message-ID: <20260317134259.493017-4-alex.chapman@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317134259.493017-1-alex.chapman@arm.com>
References: <20260317134259.493017-1-alex.chapman@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 Mar 2026 13:43:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6959

To improve portability, testing coverage, and future platform enablement.

- Replace FVP-only multicore checks with platform-generic checks.
- Add the corresponding TF-M patch to the Corstone-1000 recipe.

Signed-off-by: Alex Chapman <alex.chapman@arm.com>
---
 ...ke-mutlicore-support-platform-generi.patch | 90 +++++++++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0015-Platform-CS1K-make-mutlicore-support-platform-generi.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0015-Platform-CS1K-make-mutlicore-support-platform-generi.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0015-Platform-=
CS1K-make-mutlicore-support-platform-generi.patch
new file mode 100644
index 00000000..36a919e1
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0015=
-Platform-CS1K-make-mutlicore-support-platform-generi.patch
@@ -0,0 +1,90 @@
+From 9f86d644aa23589e5187f0a22394438cd525d574 Mon Sep 17 00:00:00 2001
+From: Alex Chapman <alex.chapman@arm.com>
+Date: Wed, 4 Mar 2026 13:41:59 +0000
+Subject: [PATCH] Platform: CS1K: make mutlicore support platform generic
+
+To improve portability, testing coverage, and future platform enablement=
.
+
+- Replace FVP-only multicore checks with platform-generic checks.
+
+Upstream-Status: Backport [71619253e03cc10cdd4527ab7e896e3ec10afabe]
+Signed-off-by: Alex Chapman <alex.chapman@arm.com>
+---
+ platform/ext/target/arm/corstone1000/CMakeLists.txt       | 4 +---
+ .../target/arm/corstone1000/Device/Config/device_cfg.h    | 2 +-
+ platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c | 8 ++++----
+ 3 files changed, 6 insertions(+), 8 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platf=
orm/ext/target/arm/corstone1000/CMakeLists.txt
+index 993c51591..a13f16fd7 100644
+--- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
++++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
+@@ -407,12 +407,10 @@ target_sources(tfm_psa_rot_partition_ns_agent_mail=
box
+         tfm_hal_multi_core.c
+ )
+=20
+-if (PLATFORM_IS_FVP)
+ target_compile_definitions(tfm_psa_rot_partition_ns_agent_mailbox
+     PUBLIC
+-       $<$<BOOL:${ENABLE_MULTICORE}>:CORSTONE1000_FVP_MULTICORE>
++       $<$<BOOL:${ENABLE_MULTICORE}>:CORSTONE1000_MULTICORE>
+ )
+-endif()
+ #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D tfm_spm =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D#
+=20
+ target_sources(tfm_spm
+diff --git a/platform/ext/target/arm/corstone1000/Device/Config/device_c=
fg.h b/platform/ext/target/arm/corstone1000/Device/Config/device_cfg.h
+index 544475a86..0c3a9088e 100644
+--- a/platform/ext/target/arm/corstone1000/Device/Config/device_cfg.h
++++ b/platform/ext/target/arm/corstone1000/Device/Config/device_cfg.h
+@@ -46,7 +46,7 @@
+ #define CFI_S
+=20
+ /* Total number of host cores */
+-#if CORSTONE1000_FVP_MULTICORE
++#if CORSTONE1000_MULTICORE
+ #define PLATFORM_HOST_MAX_CORE_COUNT 4
+ #else
+ #define PLATFORM_HOST_MAX_CORE_COUNT 1
+diff --git a/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c b=
/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c
+index 10c66ac41..9a785bfa0 100644
+--- a/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c
++++ b/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c
+@@ -62,7 +62,7 @@ void tfm_hal_boot_ns_cpu(uintptr_t start_addr)
+     volatile uint32_t *PE0_CONFIG =3D
+                         (uint32_t *)(CORSTONE1000_HOST_BASE_SYSTEM_CONT=
ROL_BASE
+                                      + HOST_CPU_PE0_CONFIG_OFFSET);
+-#if CORSTONE1000_FVP_MULTICORE
++#if CORSTONE1000_MULTICORE
+     volatile uint32_t *PE1_CONFIG =3D
+                         (uint32_t *)(CORSTONE1000_HOST_BASE_SYSTEM_CONT=
ROL_BASE
+                                      + HOST_CPU_PE1_CONFIG_OFFSET);
+@@ -80,7 +80,7 @@ void tfm_hal_boot_ns_cpu(uintptr_t start_addr)
+ #endif
+     /* Select host CPU architecture as AArch64 */
+     *PE0_CONFIG |=3D AA64nAA32_MASK; /* 0b1 =E2=80=93 AArch64 */
+-#if CORSTONE1000_FVP_MULTICORE
++#if CORSTONE1000_MULTICORE
+     *PE1_CONFIG |=3D AA64nAA32_MASK; /* 0b1 =E2=80=93 AArch64 */
+     *PE2_CONFIG |=3D AA64nAA32_MASK; /* 0b1 =E2=80=93 AArch64 */
+     *PE3_CONFIG |=3D AA64nAA32_MASK; /* 0b1 =E2=80=93 AArch64 */
+@@ -92,7 +92,7 @@ void tfm_hal_boot_ns_cpu(uintptr_t start_addr)
+     /* Clear HOST_SYS_RST_CTRL register to bring host out of RESET */
+     *reset_ctl_reg =3D 0;
+=20
+-#if CORSTONE1000_FVP_MULTICORE
++#if CORSTONE1000_MULTICORE
+     /* Wake up secondary cores.
+      * This should be done after bringing the primary core out of reset=
.*/
+     for (int core_index=3D1; core_index < PLATFORM_HOST_MAX_CORE_COUNT;=
 core_index++) {
+@@ -111,7 +111,7 @@ void tfm_hal_boot_ns_cpu(uintptr_t start_addr)
+     PPU_SetOperatingPolicy(CORE0_PPU, PPU_OP_MODE_ONE_SLICE_SF_ONLY_ON,=
 false);
+     PPU_SetPowerPolicy(CORE0_PPU, PPU_PWR_MODE_ON, false);
+    =20
+-#if CORSTONE1000_FVP_MULTICORE
++#if CORSTONE1000_MULTICORE
+     /* Power on all Cortex-A320 cores in DSU-120T Cluster */
+     PPU_SetOperatingPolicy(CORE1_PPU, PPU_OP_MODE_ONE_SLICE_SF_ONLY_ON,=
 false);
+     PPU_SetPowerPolicy(CORE1_PPU, PPU_PWR_MODE_ON, false);
+--=20
+2.43.0
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index 72144df0..17b1794b 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -46,6 +46,7 @@ SRC_URI:append:corstone1000 =3D " \
     file://0012-bl2-corstone-1000-secure-debug-waiting-in-CM-LCS.patch \
     file://0013-Build-adjust-CS1000-platform-for-GCC-v14.2.patch \
     file://0014-Workaround-compile-errors-in-AES.patch \
+    file://0015-Platform-CS1K-make-mutlicore-support-platform-generi.pat=
ch \
     "
=20
 SRCREV_tfm-psa-adac:corstone1000 =3D "f2809ae231be33a1afcd7714f40756c67d=
846c88"

