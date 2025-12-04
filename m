Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E316D21697
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 15:25:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46100.1764861915523256825
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 Dec 2025 07:25:15 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99DB3339;
	Thu,  4 Dec 2025 07:25:07 -0800 (PST)
Received: from LXKV206JHX.arm.com (unknown [10.57.43.122])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3BDCA3F59E;
	Thu,  4 Dec 2025 07:25:14 -0800 (PST)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>,
	Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 2/6] arm-bsp/optee-os:corstone1000: Add Cortex-A320 support
Date: Thu,  4 Dec 2025 15:19:49 +0000
Message-ID: <20251204152500.78818-3-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251204152500.78818-1-hugues.kambampiana@arm.com>
References: <20251204152500.78818-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 04 Dec 2025 15:25:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6781

Update the OP-TEE OS build logic to detect `MACHINE_FEATURES` and
append the appropriate `arm64-platform-cpuarch` value to
`EXTRA_OEMAKE`, instead of hard-coding `cortex-a35`.

This change ensures that when `MACHINE_FEATURES` includes
`cortexa320`, the OP-TEE build receives the matching `core-arch` flag,
while maintaining `cortex-a35` as the default.

The new Corstone-1000 variant with Cortex-A320 replaces the original
GIC-400 (v2) interrupt controller with a GIC-600, which is
architecturally compliant with GICv3. Since OP-TEE already provides
a generic GICv3 driver, only minimal platform changes are needed
to expose the updated register map and initialize the GICv3 interface.

Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 ...corstone1000-Add-Cortex-A320-support.patch | 143 ++++++++++++++++++
 .../optee/optee-os-corstone1000-common.inc    |   9 ++
 2 files changed, 152 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/co=
rstone1000/0001-plat-corstone1000-Add-Cortex-A320-support.patch

diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1=
000/0001-plat-corstone1000-Add-Cortex-A320-support.patch b/meta-arm-bsp/r=
ecipes-security/optee/files/optee-os/corstone1000/0001-plat-corstone1000-=
Add-Cortex-A320-support.patch
new file mode 100644
index 00000000..4d4847a5
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/000=
1-plat-corstone1000-Add-Cortex-A320-support.patch
@@ -0,0 +1,143 @@
+From 4a8fa965a39879d98eac1626c4c756043985726d Mon Sep 17 00:00:00 2001
+From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
+Date: Tue, 11 Nov 2025 08:09:40 +0000
+Subject: [PATCH] plat-corstone1000: Add Cortex-A320 support
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Convert arm64-platform-cpuarch from a hard-coded cortex-a35 into a =E2=80=
=9C?=3D=E2=80=9D
+(default) assignment so users can override it (for example to
+cortex-a320) via the make command line.
+
+The Cortex-A320 core is not yet supported via -mcpu=3Dcortex-a320.
+When arm64-platform-cpuarch is set to cortex-a320, switch to
+-march=3Darmv9.2-a.
+
+The new Corstone-1000 variant with Cortex-A320 replaces the original
+GIC-400 (v2) interrupt controller with a GIC-600, which is
+architecturally compliant with GICv3. Since OP-TEE already provides
+a generic GICv3 driver, only minimal platform changes are needed
+to expose the updated register map and initialize the GICv3 interface.
+
+**Changes introduced**
+
+* When `cortex-a320` is selected:
+  * Force `CFG_ARM_GICV3=3Dy`.
+  * Introduce `CFG_CORSTONE1000_CORTEX_A320` to guard
+    Cortex-A320=E2=80=93specific code.
+* Map the Redistributor region (`GICR_BASE`).
+* Use `gic_init_v3(=E2=80=A6)` instead of the v2 helper for Cortex-A320 =
builds.
+* Add `GICR_BASE`, `GIC_REDIST_REG_SIZE`, and related offsets.
+* Retain legacy `GICC_BASE` definitions under the GICv2 path so that
+  the Cortex-A35 + GIC-400 variant continues to build unchanged.
+
+Upstream-Status: Submitted (https://github.com/OP-TEE/optee_os/pull/7627=
)
+Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ core/arch/arm/plat-corstone1000/conf.mk       | 11 ++++++++++-
+ core/arch/arm/plat-corstone1000/main.c        | 11 ++++++++++-
+ .../arm/plat-corstone1000/platform_config.h   | 19 +++++++++++++++++--
+ 3 files changed, 37 insertions(+), 4 deletions(-)
+
+diff --git a/core/arch/arm/plat-corstone1000/conf.mk b/core/arch/arm/pla=
t-corstone1000/conf.mk
+index 86b8d8480..147b6972f 100644
+--- a/core/arch/arm/plat-corstone1000/conf.mk
++++ b/core/arch/arm/plat-corstone1000/conf.mk
+@@ -23,9 +23,18 @@ $(call force,CFG_PL011,y)
+ $(call force,CFG_SECURE_TIME_SOURCE_CNTPCT,y)
+ $(call force,CFG_ARM64_core,y)
+=20
+-arm64-platform-cpuarch :=3D cortex-a35
++# Default CPU core for Corstone1000 platform; override for other cores =
(e.g. cortex-a320)
++arm64-platform-cpuarch ?=3D cortex-a35
++
++ifeq ($(arm64-platform-cpuarch),cortex-a320)
++arm64-platform-cflags +=3D -march=3Darmv9.2-a
++arm64-platform-aflags +=3D -march=3Darmv9.2-a
++$(call force,CFG_ARM_GICV3,y)
++$(call force,CFG_CORSTONE1000_CORTEX_A320,y)
++else
+ arm64-platform-cflags +=3D -mcpu=3D$(arm64-platform-cpuarch)
+ arm64-platform-aflags +=3D -mcpu=3D$(arm64-platform-cpuarch)
++endif
+=20
+ CFG_WITH_STATS ?=3D y
+ CFG_WITH_ARM_TRUSTED_FW ?=3D y
+diff --git a/core/arch/arm/plat-corstone1000/main.c b/core/arch/arm/plat=
-corstone1000/main.c
+index 9e1482a7b..fd2dd888c 100644
+--- a/core/arch/arm/plat-corstone1000/main.c
++++ b/core/arch/arm/plat-corstone1000/main.c
+@@ -1,6 +1,6 @@
+ // SPDX-License-Identifier: BSD-2-Clause
+ /*
+- * Copyright (c) 2022, Arm Limited
++ * Copyright (c) 2022, 2025, Arm Limited
+  */
+=20
+ #include <console.h>
+@@ -18,11 +18,20 @@ register_ddr(DRAM0_BASE, DRAM0_SIZE);
+=20
+ register_phys_mem_pgdir(MEM_AREA_IO_SEC, CONSOLE_UART_BASE, PL011_REG_S=
IZE);
+ register_phys_mem_pgdir(MEM_AREA_IO_SEC, GICD_BASE, GIC_DIST_REG_SIZE);
++
++#if defined(CFG_CORSTONE1000_CORTEX_A320) && defined(CFG_ARM_GICV3)
++register_phys_mem_pgdir(MEM_AREA_IO_SEC, GICR_BASE, GIC_REDIST_REG_SIZE=
);
++#else
+ register_phys_mem_pgdir(MEM_AREA_IO_SEC, GICC_BASE, GIC_CPU_REG_SIZE);
++#endif
+=20
+ void boot_primary_init_intc(void)
+ {
++#if defined(CFG_CORSTONE1000_CORTEX_A320) && defined(CFG_ARM_GICV3)
++	gic_init_v3(0, GICD_BASE, GICR_BASE);
++#else
+ 	gic_init(GICC_BASE, GICD_BASE);
++#endif
+ }
+=20
+ void boot_secondary_init_intc(void)
+diff --git a/core/arch/arm/plat-corstone1000/platform_config.h b/core/ar=
ch/arm/plat-corstone1000/platform_config.h
+index f59c93a14..600b2c02e 100644
+--- a/core/arch/arm/plat-corstone1000/platform_config.h
++++ b/core/arch/arm/plat-corstone1000/platform_config.h
+@@ -1,6 +1,6 @@
+ /* SPDX-License-Identifier: BSD-2-Clause */
+ /*
+- * Copyright (c) 2022, Arm Limited
++ * Copyright (c) 2022, 2025 Arm Limited
+  */
+=20
+ #ifndef PLATFORM_CONFIG_H
+@@ -20,11 +20,26 @@
+ #define DRAM0_BASE		0x80000000
+ #define DRAM0_SIZE		CFG_DDR_SIZE
+=20
++#if defined(CFG_CORSTONE1000_CORTEX_A320) && defined(CFG_ARM_GICV3)
++#define GICR_SIZE_PER_CORE	0x20000
++#define GIC_REDIST_REG_SIZE	(GICR_SIZE_PER_CORE * CFG_TEE_CORE_NB_CORE)=
=20
++#endif
++
++#if defined(CFG_CORSTONE1000_CORTEX_A320) && defined(CFG_ARM_GICV3)
++/* Corstone-1000 with Cortex-A320 uses GIC-v3 which supports GICR */
++#define GICD_OFFSET		0x00000
++#define GICR_OFFSET		0x40000
++#else
+ #define GICD_OFFSET		0x10000
+ #define GICC_OFFSET		0x2F000
++#endif
+=20
+-#define GICD_BASE		(GIC_BASE + GICD_OFFSET)
++#if defined(CFG_CORSTONE1000_CORTEX_A320) && defined(CFG_ARM_GICV3)
++#define GICR_BASE		(GIC_BASE + GICR_OFFSET)
++#else
+ #define GICC_BASE		(GIC_BASE + GICC_OFFSET)
++#endif
++#define GICD_BASE		(GIC_BASE + GICD_OFFSET)
+=20
+ #define UART_BAUDRATE		115200
+ #define CONSOLE_BAUDRATE	UART_BAUDRATE
+--=20
+2.50.1
+
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-co=
mmon.inc b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-comm=
on.inc
index 7e849c45..028027f5 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.in=
c
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.in=
c
@@ -1,5 +1,9 @@
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/optee-os/corstone1000:"
=20
+SRC_URI:append =3D " \
+        file://0001-plat-corstone1000-Add-Cortex-A320-support.patch \
+"
+
 COMPATIBLE_MACHINE =3D "corstone1000"
=20
 OPTEEMACHINE =3D "corstone1000"
@@ -14,3 +18,8 @@ EXTRA_OEMAKE +=3D " CFG_CORE_SEL1_SPMC=3Dy CFG_CORE_FFA=
=3Dy"
 EXTRA_OEMAKE +=3D " CFG_WITH_SP=3Dy"
=20
 EXTRA_OEMAKE:append:corstone1000-fvp =3D "${@bb.utils.contains('MACHINE_=
FEATURES', 'corstone1000_fvp_smp', ' CFG_TEE_CORE_NB_CORE=3D4', '', d)}"
+
+# Override OP-TEE OS ARM64 core architecture based on MACHINE_FEATURES
+CPUARCH =3D "cortex-a35"
+CPUARCH:cortexa320 =3D "cortex-a320"
+EXTRA_OEMAKE:append:corstone1000 =3D " arm64-platform-cpuarch=3D${CPUARC=
H}"

