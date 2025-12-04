Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EF1AD21695
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 15:25:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46101.1764861916302605805
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 Dec 2025 07:25:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 628371762;
	Thu,  4 Dec 2025 07:25:08 -0800 (PST)
Received: from LXKV206JHX.arm.com (unknown [10.57.43.122])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 493253F59E;
	Thu,  4 Dec 2025 07:25:15 -0800 (PST)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 3/6] arm-bsp/tf-m:corstone1000: Add Cortex-A320 support
Date: Thu,  4 Dec 2025 15:19:50 +0000
Message-ID: <20251204152500.78818-4-hugues.kambampiana@arm.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6782

From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>

Enable full Corstone=E2=80=911000 Cortex=E2=80=91A320 DSU=E2=80=91120T pl=
atform support in TF=E2=80=91M:

- Reserve a 4=E2=80=AFMiB Host SRAM region at 0x0240_0000 for the
Cortex=E2=80=91A320 normal world and open it in the CVM firewall
(region=E2=80=AF2), gated by `CORSTONE1000_CORTEX_A320``.
- Introduce a DSU=E2=80=91120T Power-Policy Unit driver plus a
`CORSTONE1000_DSU_120T` CMake option to power on the Cortex=E2=80=91A320
host cluster with proper secure-enclave firewall and memory-map
setup.
- Add a CMake platform define that auto=E2=80=91activates when the
`cortexa320` machine feature is present, injecting
DSU=E2=80=91120T=E2=80=91specific compile definitions.

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 ...0-Add-support-for-Cortex-A320-varian.patch | 490 ++++++++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |   9 +
 2 files changed, 499 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0010-plat-corstone1000-Add-support-for-Cortex-A320-varian.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0010-plat-corstone1000-Add-support-for-Cortex-A320-varian.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0010-plat-cors=
tone1000-Add-support-for-Cortex-A320-varian.patch
new file mode 100644
index 00000000..1792474b
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0010=
-plat-corstone1000-Add-support-for-Cortex-A320-varian.patch
@@ -0,0 +1,490 @@
+From 2f09a03bc8396164c8075ac802751b6150b8a6c0 Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Tue, 29 Jul 2025 15:09:45 +0000
+Subject: [PATCH] plat: corstone1000: Add support for Cortex-A320 variant
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Add support for powering on the Cortex-A320 host in the DSU-120T
+cluster and reserve Host SRAM for the normal world on the
+Corstone-1000 platform. These changes enable secure-enclave firmware
+control of the Cortex-A320 power domain and memory access
+configuration.
+
+**DSU-120T Power-Policy Unit (PPU) driver**
+
+* Introduce a minimal driver to program the DSU-120T Power-Policy
+  Units, allowing the secure-enclave firmware to bring the
+  Cortex-A320 host cluster out of reset.
+* The DSU utility-bus registers are located at:
+  * `0x6091_0000` in the Host memory map.
+  * `0xC091_0000` in the Secure-Enclave memory map.
+* The FC1 firewall is configured so that only the Secure Enclave may
+  write to this window.
+* Add new CMake option `CORSTONE1000_DSU_120T` and platform define to
+  enable Cortex-A320 DSU-120T=E2=80=93specific code.
+
+**Host SRAM allocation**
+
+* Reserve a 4 MiB block of Host SRAM at `0x0240_0000` for the
+  Cortex-A320 normal world.
+* Open the same region in the Host-side firewall (CVM, region 2)
+  to allow non-secure access.
+* This configuration is compiled in when `CORSTONE1000_CORTEX_A320`
+  is defined.
+
+These updates prepare the Corstone-1000 platform for Cortex-A320
+integration with proper cluster power management and normal-world
+memory accessibility.
+
+Upstream-Status: Submitted (https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/45749)
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ .../target/arm/corstone1000/CMakeLists.txt    |  31 +++
+ .../Device/Include/platform_base_address.h    |   8 +-
+ .../arm/corstone1000/bl1/boot_hal_bl1_1.c     |  50 ++++-
+ .../target/arm/corstone1000/dsu-120t/ppu.c    |  40 ++++
+ .../target/arm/corstone1000/dsu-120t/ppu.h    | 185 ++++++++++++++++++
+ .../arm/corstone1000/tfm_hal_multi_core.c     |  28 ++-
+ 6 files changed, 339 insertions(+), 3 deletions(-)
+ create mode 100644 platform/ext/target/arm/corstone1000/dsu-120t/ppu.c
+ create mode 100644 platform/ext/target/arm/corstone1000/dsu-120t/ppu.h
+
+diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platf=
orm/ext/target/arm/corstone1000/CMakeLists.txt
+index 91bf197d8..993c51591 100644
+--- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
++++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
+@@ -423,6 +423,37 @@ target_sources(tfm_spm
+         $<$<BOOL:${TFM_S_REG_TEST}>:${CMAKE_CURRENT_SOURCE_DIR}/target_=
cfg.c>
+ )
+=20
++#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D DSU-120T =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D#
++if (CORSTONE1000_DSU_120T)
++    target_sources(tfm_psa_rot_partition_ns_agent_mailbox
++        PUBLIC
++            dsu-120t/ppu.c
++    )
++
++    target_compile_definitions(tfm_psa_rot_partition_ns_agent_mailbox
++        PUBLIC
++            CORSTONE1000_DSU_120T
++    )
++
++    target_compile_definitions(platform_bl1_1
++        PUBLIC
++            CORSTONE1000_DSU_120T
++    )
++
++    target_include_directories(tfm_psa_rot_partition_ns_agent_mailbox
++        PUBLIC
++            dsu-120t
++    )
++endif()
++
++#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D Ethos-U NPU =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D#
++if (CORSTONE1000_CORTEX_A320)
++    target_compile_definitions(platform_bl1_1
++        PUBLIC
++            CORSTONE1000_CORTEX_A320
++    )
++endif()
++
+ #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D tfm_adac =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D#
+=20
+ if (${PLATFORM_PSA_ADAC_SECURE_DEBUG})
+diff --git a/platform/ext/target/arm/corstone1000/Device/Include/platfor=
m_base_address.h b/platform/ext/target/arm/corstone1000/Device/Include/pl=
atform_base_address.h
+index 5f9f03ddc..3908d69bc 100644
+--- a/platform/ext/target/arm/corstone1000/Device/Include/platform_base_=
address.h
++++ b/platform/ext/target/arm/corstone1000/Device/Include/platform_base_=
address.h
+@@ -1,5 +1,7 @@
+ /*
+- * Copyright (c) 2017-2024 Arm Limited. All rights reserved.
++ * SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributors
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
+  *
+  * Licensed under the Apache License, Version 2.0 (the "License");
+  * you may not use this file except in compliance with the License.
+@@ -79,6 +81,10 @@
+ #define CORSTONE1000_HOST_AXI_QSPI_CTRL_REG_BASE_SE_SECURE_FLASH (0x900=
10000U) /* AXI QSPI Controller for SE FLash  */
+ #define CORSTONE1000_HOST_DRAM_UEFI_CAPSULE        (0xA0000000U) /* 1.5=
 GB DDR                        */
+=20
++#ifdef CORSTONE1000_DSU_120T
++#define CORSTONE1000_HOST_DSU_120T_BASE            (0xC0910000U) /* DSU=
-120T PPU                      */
++#endif
++
+ /* Map Component definitions to Corstone definitions */
+ #define CC3XX_BASE_S        CORSTONE1000_CRYPTO_ACCELERATOR_BASE
+=20
+diff --git a/platform/ext/target/arm/corstone1000/bl1/boot_hal_bl1_1.c b=
/platform/ext/target/arm/corstone1000/bl1/boot_hal_bl1_1.c
+index b51a233e9..1a5e98ad3 100644
+--- a/platform/ext/target/arm/corstone1000/bl1/boot_hal_bl1_1.c
++++ b/platform/ext/target/arm/corstone1000/bl1/boot_hal_bl1_1.c
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2019-2024, Arm Limited. All rights reserved.
++ * SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributors
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  *
+@@ -48,6 +48,15 @@ REGION_DECLARE(Image$$, ARM_LIB_HEAP, $$ZI$$Limit)[];
+ #define HOST_SE_SECURE_FLASH_BASE_FVP       0x60010000
+ #define HOST_AXI_QSPI_CTRL_REG_BASE_SE_SECURE_FLASH    0x60010000
+=20
++#ifdef CORSTONE1000_DSU_120T
++#define HOST_DSU_120T_BASE              0x60910000
++#endif
++
++#ifdef CORSTONE1000_CORTEX_A320
++#define HOST_SECURE_SRAM_SIZE           0x400000
++#define HOST_NONSECURE_SRAM_BASE        (HOST_TRUSTED_RAM_BASE + HOST_S=
ECURE_SRAM_SIZE)
++#endif
++
+ #define HOST_DRAM_BASE                  0x80000000
+ #define HOST_DRAM_UEFI_CAPSULE          0x80000000
+=20
+@@ -286,6 +295,25 @@ static void setup_se_firewall(void)
+     fc_enable_regions();
+ #endif
+=20
++#ifdef CORSTONE1000_DSU_120T
++#if (PLATFORM_IS_FVP)
++    fc_select_region(7);
++    fc_disable_regions();
++    fc_disable_mpe(RGN_MPE0);
++    fc_prog_rgn(RGN_SIZE_16MB, CORSTONE1000_HOST_DSU_120T_BASE);
++    fc_prog_rgn_upper_addr(HOST_DSU_120T_BASE);
++    fc_enable_addr_trans();
++    fc_init_mpl(RGN_MPE0);
++
++    mpl_rights =3D (RGN_MPL_SECURE_READ_MASK |
++                  RGN_MPL_SECURE_WRITE_MASK);
++
++    fc_enable_mpl(RGN_MPE0, mpl_rights);
++    fc_prog_mid(RGN_MPE0, SE_MID);
++    fc_enable_mpe(RGN_MPE0);
++    fc_enable_regions();
++#endif
++#endif
+     fc_pe_enable();
+ }
+=20
+@@ -369,6 +397,26 @@ static void setup_host_firewall(void)
+     fc_enable_regions();
+     fc_rgn_lock();
+=20
++#ifdef CORSTONE1000_CORTEX_A320
++    /* CVM - Non Secure RAM */
++    fc_select_region(2);
++    fc_disable_regions();
++    fc_disable_mpe(RGN_MPE0);
++    fc_prog_rgn(RGN_SIZE_4MB, HOST_NONSECURE_SRAM_BASE);
++    fc_init_mpl(RGN_MPE0);
++
++    mpl_rights =3D (RGN_MPL_ANY_MST_MASK | RGN_MPL_NONSECURE_READ_MASK =
|
++                                         RGN_MPL_NONSECURE_WRITE_MASK |
++                                         RGN_MPL_NONSECURE_EXECUTE_MASK=
);
++
++    fc_enable_mpl(RGN_MPE0, mpl_rights);
++    fc_disable_mpl(RGN_MPE0, ~mpl_rights);
++
++    fc_enable_mpe(RGN_MPE0);
++    fc_enable_regions();
++    fc_rgn_lock();
++#endif
++   =20
+     fc_pe_enable();
+=20
+     /* DDR */
+diff --git a/platform/ext/target/arm/corstone1000/dsu-120t/ppu.c b/platf=
orm/ext/target/arm/corstone1000/dsu-120t/ppu.c
+new file mode 100644
+index 000000000..d6be5982a
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/dsu-120t/ppu.c
+@@ -0,0 +1,40 @@
++/*
++ * SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributors
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#include <stdint.h>
++#include "ppu.h"
++
++void PPU_SetPowerPolicy(PPU_TypeDef *ppu, PPU_PowerPolicy_Type policy, =
bool isDynamic)
++{
++    uint32_t regval =3D ppu->PWPR;
++
++    regval &=3D ~(PPU_PWPR_PWR_POLICY_Msk | PPU_PWPR_PWR_DYN_EN_Msk);
++
++    regval |=3D ((policy << PPU_PWPR_PWR_POLICY_Pos) & PPU_PWPR_PWR_POL=
ICY_Msk);
++
++    if (isDynamic) {
++        regval |=3D PPU_PWPR_PWR_DYN_EN_Msk;
++    }
++
++    ppu->PWPR =3D regval;
++}
++
++void PPU_SetOperatingPolicy(PPU_TypeDef *ppu, PPU_OperatingPolicy_Type =
policy, bool isDynamic)
++{
++    uint32_t regval =3D ppu->PWPR;
++
++    regval &=3D ~(PPU_PWPR_OP_POLICY_Msk | PPU_PWPR_OP_DYN_EN_Msk);
++
++    regval |=3D ((policy << PPU_PWPR_OP_POLICY_Pos) & PPU_PWPR_OP_POLIC=
Y_Msk);
++
++    if (isDynamic) {
++        regval |=3D PPU_PWPR_OP_DYN_EN_Msk;
++    }
++
++    ppu->PWPR =3D regval;
++}
++
+diff --git a/platform/ext/target/arm/corstone1000/dsu-120t/ppu.h b/platf=
orm/ext/target/arm/corstone1000/dsu-120t/ppu.h
+new file mode 100644
+index 000000000..05470df9a
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/dsu-120t/ppu.h
+@@ -0,0 +1,185 @@
++/*
++ * SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributors
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++#ifndef PPU_H
++#define PPU_H
++
++#include <stdbool.h>
++#include <stdint.h>
++#include "platform_base_address.h"
++
++// Bit definition for PPU_PWPR register
++#define PPU_PWPR_PWR_POLICY_Pos            (0U)                        =
        // Power mode policy
++#define PPU_PWPR_PWR_POLICY_Msk            (0xFUL << PPU_PWPR_PWR_POLIC=
Y_Pos)  // 4 bits
++#define PPU_PWPR_PWR_POLICY_OFF            (0UL << PPU_PWPR_PWR_POLICY_=
Pos)    // Logic off and RAM off.
++#define PPU_PWPR_PWR_POLICY_OFF_EMU        (1UL << PPU_PWPR_PWR_POLICY_=
Pos)    // Emulated Off. Logic on with RAM on. This mode is used to emula=
te the functional condition of OFF without removing
++#define PPU_PWPR_PWR_POLICY_MEM_RET        (2UL << PPU_PWPR_PWR_POLICY_=
Pos)    // Memory Retention. Logic off with RAM retained.
++#define PPU_PWPR_PWR_POLICY_MEM_RET_EMU    (3UL << PPU_PWPR_PWR_POLICY_=
Pos)    // Emulated Memory Retention. Logic on with RAM on. This mode is =
used to emulate the functional condition of
++#define PPU_PWPR_PWR_POLICY_FULL_RET       (5UL << PPU_PWPR_PWR_POLICY_=
Pos)    // Full Retention. Slice logic off with RAM contents retained.
++#define PPU_PWPR_PWR_POLICY_FUNC_RET       (7UL << PPU_PWPR_PWR_POLICY_=
Pos)    // Functional Retention. Logic on with L3 Cache and Snoop Filter =
retained.
++#define PPU_PWPR_PWR_POLICY_ON             (8UL << PPU_PWPR_PWR_POLICY_=
Pos)    // Logic on with RAM on, cluster is functional.
++#define PPU_PWPR_PWR_POLICY_WARM_RST       (9UL << PPU_PWPR_PWR_POLICY_=
Pos)    // Warm Reset. Warm reset application with logic and RAM on.
++#define PPU_PWPR_PWR_POLICY_DBG_RECOV      (10UL << PPU_PWPR_PWR_POLICY=
_Pos)   // Debug Recovery Reset. Warm reset application with logic and RA=
M on.
++#define PPU_PWPR_PWR_DYN_EN_Pos            (8U)                        =
        // Power mode dynamic transition enable.
++#define PPU_PWPR_PWR_DYN_EN_Msk            (0x1UL << PPU_PWPR_PWR_DYN_E=
N_Pos)  // 1 bit
++#define PPU_PWPR_LOCK_EN_Pos               (12U)                       =
        // Lock enable bit for OFF, OFF_EMU, MEM_RET and MEM_RET_EMU powe=
r modes.
++#define PPU_PWPR_LOCK_EN_Msk               (0x1UL << PPU_PWPR_LOCK_EN_P=
os)     // 1 bit
++#define PPU_PWPR_OP_POLICY_Pos             (16U)                       =
        // Operating mode policy
++#define PPU_PWPR_OP_POLICY_Msk             (0xFUL << PPU_PWPR_OP_POLICY=
_Pos)   // 4 bits
++#define PPU_PWPR_OP_POLICY_OPMODE_00       (0UL << PPU_PWPR_OP_POLICY_P=
os)     // ONE_SLICE_SF_ONLY_ON: One L3 Cache slice is operational, the C=
ache RAM is powered down.
++#define PPU_PWPR_OP_POLICY_OPMODE_01       (1UL << PPU_PWPR_OP_POLICY_P=
os)     // ONE_SLICE_HALF_RAM_ON: One L3 Cache slice is operational, half=
 of the Cache RAMs are powered on.
++#define PPU_PWPR_OP_POLICY_OPMODE_03       (3UL << PPU_PWPR_OP_POLICY_P=
os)     // ONE_SLICE_FULL_RAM_ON: One L3 Cache slice is operational, all =
of the Cache RAMs are powered on.
++#define PPU_PWPR_OP_POLICY_OPMODE_04       (4UL << PPU_PWPR_OP_POLICY_P=
os)     // ALL_SLICE_SF_ONLY_ON: All L3 Cache slices are operational, the=
 Cache RAMs in each slice are powered down.
++#define PPU_PWPR_OP_POLICY_OPMODE_05       (5UL << PPU_PWPR_OP_POLICY_P=
os)     // ALL_SLICE_HALF_RAM_ON: All L3 Cache slices are operational, ha=
lf of the Cache RAMs are powered on.
++#define PPU_PWPR_OP_POLICY_OPMODE_07       (7UL << PPU_PWPR_OP_POLICY_P=
os)     // ALL_SLICE_FULL_RAM_ON: All L3 Cache slices are operational, al=
l of the Cache RAMs are powered on.
++#define PPU_PWPR_OP_POLICY_OPMODE_08       (8UL << PPU_PWPR_OP_POLICY_P=
os)     // HALF_SLICE_SF_ONLY_ON: Half L3 Cache slices are operational, t=
he Cache RAMs in each slice are powered down.
++#define PPU_PWPR_OP_POLICY_OPMODE_09       (9UL << PPU_PWPR_OP_POLICY_P=
os)     // HALF_SLICE_HALF_RAM_ON: Half L3 Cache slices are operational, =
half of the Cache RAMs are powered on.
++#define PPU_PWPR_OP_POLICY_OPMODE_0B       (11UL << PPU_PWPR_PWR_POLICY=
_Pos)   // HALF_SLICE_FULL_RAM_ON: Half L3 Cache slices are operational, =
all of the Cache RAMs are powered on.
++#define PPU_PWPR_OP_DYN_EN_Pos             (24U)                       =
        // Operating mode dynamic transition enable.
++#define PPU_PWPR_OP_DYN_EN_Msk             (0x1UL << PPU_PWPR_OP_DYN_EN=
_Pos)   // 1 bit
++
++// Bit definition for PPU_PWSR register
++#define PPU_PWSR_PWR_STATUS_Pos            (0U)
++#define PPU_PWSR_PWR_STATUS_Msk            (0xFUL << PPU_PWSR_PWR_STATU=
S_Pos)      // 4 bits
++#define PPU_PWSR_PWR_STATUS_OFF            (0UL << PPU_PWSR_PWR_STATUS_=
Pos)        // Logic off and RAM off.
++#define PPU_PWSR_PWR_STATUS_OFF_EMU        (1UL << PPU_PWSR_PWR_STATUS_=
Pos)        // Emulated Off. Logic on with RAM on. This mode is used to e=
mulate the functional condition of OFF without removing
++#define PPU_PWSR_PWR_STATUS_MEM_RET        (2UL << PPU_PWSR_PWR_STATUS_=
Pos)        // Memory Retention. Logic off with RAM retained.
++#define PPU_PWSR_PWR_STATUS_MEM_RET_EMU    (3UL << PPU_PWSR_PWR_STATUS_=
Pos)        // Emulated Memory Retention. Logic on with RAM on. This mode=
 is used to emulate the functional condition of
++#define PPU_PWSR_PWR_STATUS_FULL_RET       (5UL << PPU_PWSR_PWR_STATUS_=
Pos)        // Full Retention. Slice logic off with RAM contents retained=
.
++#define PPU_PWSR_PWR_STATUS_FUNC_RET       (7UL << PPU_PWSR_PWR_STATUS_=
Pos)        // Functional Retention. Logic on with L3 Cache and Snoop Fil=
ter retained.
++#define PPU_PWSR_PWR_STATUS_ON             (8UL << PPU_PWSR_PWR_STATUS_=
Pos)        // Logic on with RAM on, cluster is functional.
++#define PPU_PWSR_PWR_STATUS_WARM_RST       (9UL << PPU_PWSR_PWR_STATUS_=
Pos)        // Warm Reset. Warm reset application with logic and RAM on.
++#define PPU_PWSR_PWR_STATUS_DBG_RECOV      (10UL << PPU_PWSR_PWR_STATUS=
_Pos)       // Debug Recovery Reset. Warm reset application with logic an=
d RAM on.
++#define PPU_PWSR_PWR_DYN_STATUS_Pos        (8U)                        =
            // Power mode dynamic transition enable.
++#define PPU_PWSR_PWR_DYN_STATUS_Msk        (0x1UL << PPU_PWSR_PWR_DYN_S=
TATUS_Pos)  // 1 bit
++#define PPU_PWSR_LOCK_STATUS_Pos           (12U)                       =
            // Lock enable bit for OFF, OFF_EMU, MEM_RET and MEM_RET_EMU =
power modes.
++#define PPU_PWSR_LOCK_STATUS_Msk           (0x1UL << PPU_PWSR_LOCK_STAT=
US_Pos)     // 1 bit
++#define PPU_PWSR_OP_STATUS_Pos             (16U)                       =
            // Operating mode policy
++#define PPU_PWSR_OP_STATUS_Msk             (0xFUL << PPU_PWSR_OP_STATUS=
_Pos)       // 4 bits
++#define PPU_PWSR_OP_STATUS_OPMODE_00       (0UL << PPU_PWSR_OP_STATUS_P=
os)         // ONE_SLICE_SF_ONLY_ON: One L3 Cache slice is operational, o=
nly the snoop filter RAM instances are active in the slice
++#define PPU_PWSR_OP_STATUS_OPMODE_01       (1UL << PPU_PWSR_OP_STATUS_P=
os)         // ONE_SLICE_HALF_RAM_ON: One L3 Cache slice is operational, =
half of the Cache RAMs are powered on.
++#define PPU_PWSR_OP_STATUS_OPMODE_03       (3UL << PPU_PWSR_OP_STATUS_P=
os)         // ONE_SLICE_FULL_RAM_ON: One L3 Cache slice is operational, =
all of the Cache RAMs are powered on.
++#define PPU_PWSR_OP_STATUS_OPMODE_04       (4UL << PPU_PWSR_OP_STATUS_P=
os)         // ALL_SLICE_SF_ONLY_ON: All L3 Cache slices are operational,=
 the Cache RAMs in each slice are powered down.
++#define PPU_PWSR_OP_STATUS_OPMODE_05       (5UL << PPU_PWSR_OP_STATUS_P=
os)         // ALL_SLICE_HALF_RAM_ON: All L3 Cache slices are operational=
, half of the Cache RAMs are powered on.
++#define PPU_PWSR_OP_STATUS_OPMODE_07       (7UL << PPU_PWSR_OP_STATUS_P=
os)         // ALL_SLICE_FULL_RAM_ON: All L3 Cache slices are operational=
, all of the Cache RAMs are powered on.
++#define PPU_PWSR_OP_STATUS_OPMODE_08       (8UL << PPU_PWSR_OP_STATUS_P=
os)         // HALF_SLICE_SF_ONLY_ON: Half L3 Cache slices are operationa=
l, the Cache RAMs in each slice are powered down.
++#define PPU_PWSR_OP_STATUS_OPMODE_09       (9UL << PPU_PWSR_OP_STATUS_P=
os)         // HALF_SLICE_HALF_RAM_ON: Half L3 Cache slices are operation=
al, half of the Cache RAMs are powered on.
++#define PPU_PWSR_OP_STATUS_OPMODE_0B       (11UL << PPU_PWSR_OP_STATUS_=
Pos)        // HALF_SLICE_FULL_RAM_ON: Half L3 Cache slices are operation=
al, all of the Cache RAMs are powered on.
++#define PPU_PWSR_OP_DYN_STATUS_Pos         (24U)                       =
            // Operating mode dynamic transition enable.
++#define PPU_PWSR_OP_DYN_STATUS_Msk         (0x1UL << PPU_PWSR_OP_DYN_ST=
ATUS_Pos)   // 1 bit
++
++/*!< PPU memory offsets */
++#define DSU_120T_CLUSTER_PPU_OFFSET  0x030000
++#define DSU_120T_CORE0_PPU_OFFSET    0x080000
++#define DSU_120T_CORE1_PPU_OFFSET    0x180000
++#define DSU_120T_CORE2_PPU_OFFSET    0x280000
++#define DSU_120T_CORE3_PPU_OFFSET    0x380000
++
++/*!< PPU memory map */
++#define CLUSTER_PPU_BASE (CORSTONE1000_HOST_DSU_120T_BASE + DSU_120T_CL=
USTER_PPU_OFFSET)
++#define CORE0_PPU_BASE (CORSTONE1000_HOST_DSU_120T_BASE + DSU_120T_CORE=
0_PPU_OFFSET)
++#define CORE1_PPU_BASE (CORSTONE1000_HOST_DSU_120T_BASE + DSU_120T_CORE=
1_PPU_OFFSET)
++#define CORE2_PPU_BASE (CORSTONE1000_HOST_DSU_120T_BASE + DSU_120T_CORE=
2_PPU_OFFSET)
++#define CORE3_PPU_BASE (CORSTONE1000_HOST_DSU_120T_BASE + DSU_120T_CORE=
3_PPU_OFFSET)
++
++/*!< PPU declarations */
++#define CLUSTER_PPU ((PPU_TypeDef *) CLUSTER_PPU_BASE)
++#define CORE0_PPU   ((PPU_TypeDef *) CORE0_PPU_BASE)
++#define CORE1_PPU   ((PPU_TypeDef *) CORE1_PPU_BASE)
++#define CORE2_PPU   ((PPU_TypeDef *) CORE2_PPU_BASE)
++#define CORE3_PPU   ((PPU_TypeDef *) CORE3_PPU_BASE)
++
++typedef struct
++{
++    volatile uint32_t PWPR;                      /*!< PPU Power Policy =
Register, Address offset: 0x00 */
++    volatile uint32_t PMER;                      /*!< PPU Power Mode Em=
ulation Enable Register, Address offset: 0x04 */
++    volatile uint32_t PWSR;                      /*!< PPU Power Status =
Register, Address offset: 0x08 */
++    volatile uint32_t RESERVED0;                 /*!< Reserved, Address=
 offset: 0x0C */
++    volatile uint32_t DISR;                      /*!< PPU Device Interf=
ace Input Current Status Register, Address offset: 0x10 */
++    volatile uint32_t MISR;                      /*!< PPU Miscellaneous=
 Input Current Status Register, Address offset: 0x14 */
++    volatile uint32_t STSR;                      /*!< PPU Stored Status=
 Register, Address offset: 0x18 */
++    volatile uint32_t UNLK;                      /*!< PPU Unlock Regist=
er, Address offset: 0x1C */
++    volatile uint32_t PWCR;                      /*!< PPU Power Configu=
ration Register, Address offset: 0x20 */
++    volatile uint32_t PTCR;                      /*!< PPU Power Mode Tr=
ansition Register, Address offsets: 0x24 */
++    volatile uint32_t RESERVED1[2];              /*!< Reserved: Address=
 offsets 0x28 - 0x2C */
++    volatile uint32_t IMR;                       /*!< PPU Interrupt Mas=
k Register, Address offsets: 0x30 */
++    volatile uint32_t AIMR;                      /*!< PPU Additional In=
terrupt Mask Register, Address offsets: 0x34 */
++    volatile uint32_t ISR;                       /*!< PPU Interrupt Sta=
tus Register, Address offsets: 0x38 */
++    volatile uint32_t AISR;                      /*!< PPU Additional In=
terrupt Status Register, Address offsets: 0x3C */
++    volatile uint32_t IESR;                      /*!< PPU Input Edge Se=
nsitivity Register	Address offsets: 0x040 */
++    volatile uint32_t OPSR;                      /*!< PPU Operating Mod=
e Active Edge Sensitivity Register	Address offsets: 0x044 */
++    volatile uint32_t RESERVED2[2];              /*!< Reserved: Address=
 offsets 0x48 - 0x4C */
++    volatile uint32_t FUNRR;                     /*!< Functional Retent=
ion RAM Configuration Register	Address offsets: 0x050 */
++    volatile uint32_t FULRR;                     /*!< Full Retention RA=
M Configuration Register	Address offsets: 0x054 */
++    volatile uint32_t MEMRR;                     /*!< Memory Retention =
RAM Configuration Register	Address offsets: 0x058 */
++    volatile uint32_t RESERVED3[69];             /*!< Reserved: Address=
 offsets 0x5C - 0x16C */
++    volatile uint32_t DCDR0;                     /*!< Device Control De=
lay Configuration Register 0	Address offsets: 0x170 */
++    volatile uint32_t DCDR1;                     /*!< Device Control De=
lay Configuration Register 1	Address offsets: 0x174 */
++    volatile uint32_t RESERVED4[910];            /*!< Reserved, offsets=
 0x178 - 0xFAC */
++    volatile uint32_t IDR0;                      /*!< PPU Identificatio=
n Register 0, Address offsets: 0xFB0 */
++    volatile uint32_t IDR1;                      /*!< PPU Identificatio=
n Register 1, Address offsets: 0xFB4 */
++    volatile uint32_t RESERVED5[4];             /*!< Reserved, offsets =
0xFB8 - 0xFC4 */
++    volatile uint32_t IIDR;                      /*!< PPU Implementatio=
n Identification Register, Address offsets: 0xFC8 */
++    volatile uint32_t AIDR;                      /*!< PPU Architecture =
Identification Register, Address offsets: 0xFCC */
++    volatile uint32_t PIDR4;                     /*!< PPU Peripheral Id=
entification Register 4, Address offsets: 0xFD0 */
++    volatile uint32_t PIDR5;                     /*!< PPU Peripheral Id=
entification Register 5, Address offsets: 0xFD4 */
++    volatile uint32_t PIDR6;                     /*!< PPU Peripheral Id=
entification Register 6, Address offsets: 0xFD8 */
++    volatile uint32_t PIDR7;                     /*!< PPU Peripheral Id=
entification Register 7, Address offsets: 0xFDC */
++    volatile uint32_t PIDR0;                     /*!< PPU Peripheral Id=
entification Register 0, Address offsets: 0xFE0 */
++    volatile uint32_t PIDR1;                     /*!< PPU Peripheral Id=
entification Register 1, Address offsets: 0xFE4 */
++    volatile uint32_t PIDR2;                     /*!< PPU Peripheral Id=
entification Register 2, Address offsets: 0xFE8 */
++    volatile uint32_t PIDR3;                     /*!< PPU Peripheral Id=
entification Register 3, Address offsets: 0xFEC */
++    volatile uint32_t CIDR0;                     /*!< PPU Component Ide=
ntification Register 0,	Address offsets: 0xFF0 */
++    volatile uint32_t CIDR1;                     /*!< PPU Component Ide=
ntification Register 1,	Address offsets: 0xFF4 */
++    volatile uint32_t CIDR2;                     /*!< PPU Component Ide=
ntification Register 2,	Address offsets: 0xFF8 */
++    volatile uint32_t CIDR3;                     /*!< PPU Component Ide=
ntification Register 3,	Address offsets: 0xFFC */
++} PPU_TypeDef;
++
++typedef enum {
++    PPU_PWR_MODE_OFF         =3D 0, // Logic off and RAM off.
++    PPU_PWR_MODE_OFF_EMU     =3D 1, // Emulated Off. Logic on with RAM =
on. This mode is used to emulate the functional condition of OFF without =
removing
++    PPU_PWR_MODE_MEM_RET     =3D 2, // Memory Retention. Logic off with=
 RAM retained.
++    PPU_PWR_MODE_MEM_RET_EMU =3D 3, // Emulated Memory Retention. Logic=
 on with RAM on. This mode is used to emulate the functional condition of
++    PPU_PWR_MODE_FULL_RET    =3D 5, // Full Retention. Slice logic off =
with RAM contents retained.
++    PPU_PWR_MODE_FUNC_RET    =3D 7, // Functional Retention. Logic on w=
ith L3 Cache and Snoop Filter retained.
++    PPU_PWR_MODE_ON          =3D 8, // Logic on with RAM on, cluster is=
 functional.
++    PPU_PWR_MODE_WARM_RST    =3D 9, // Warm Reset. Warm reset applicati=
on with logic and RAM on.
++    PPU_PWR_MODE_DBG_RECOV   =3D 10 // Debug Recovery Reset. Warm reset=
 application with logic and RAM on.
++} PPU_PowerPolicy_Type;
++
++typedef enum {
++    PPU_OP_MODE_ONE_SLICE_SF_ONLY_ON   =3D 0, // One L3 Cache slice is =
operational, only the snoop filter RAM instances are active in the slice
++    PPU_OP_MODE_ONE_SLICE_HALF_RAM_ON  =3D 1, // One L3 Cache slice is =
operational, half of the Cache RAMs are powered on.
++    PPU_OP_MODE_ONE_SLICE_FULL_RAM_ON  =3D 3, // One L3 Cache slice is =
operational, all of the Cache RAMs are powered on.
++    PPU_OP_MODE_ALL_SLICE_SF_ONLY_ON   =3D 4, // All L3 Cache slices ar=
e operational, the Cache RAMs in each slice are powered down.
++    PPU_OP_MODE_ALL_SLICE_HALF_RAM_ON  =3D 5, // All L3 Cache slices ar=
e operational, half of the Cache RAMs are powered on.
++    PPU_OP_MODE_ALL_SLICE_FULL_RAM_ON  =3D 7, // All L3 Cache slices ar=
e operational, all of the Cache RAMs are powered on.
++    PPU_OP_MODE_HALF_SLICE_SF_ONLY_ON  =3D 8, // Half L3 Cache slices a=
re operational, the Cache RAMs in each slice are powered down.
++    PPU_OP_MODE_HALF_SLICE_HALF_RAM_ON =3D 9, // Half L3 Cache slices a=
re operational, half of the Cache RAMs are powered on.
++    PPU_OP_MODE_HALF_SLICE_FULL_RAM_ON =3D 11 // Half L3 Cache slices a=
re operational, all of the Cache RAMs are powered on.
++} PPU_OperatingPolicy_Type;
++
++/**
++ * @brief  Set the power policy for a given PPU instance.
++ *         Only modifies PWR_POLICY and PWR_DYN_EN bits.
++ * @param  ppu: Pointer to the PPU instance (e.g., CLUSTER_PPU, CORE0_P=
PU1)
++ * @param  policy: Power mode policy (e.g., PPU_PWR_MODE_ON)
++ * @param  dynamic: Enable dynamic transitions enabled for power modes,=
 allowing transitions to be initiated by changes on power mode DEVACTIVE =
inputs if non-zero
++ * @retval None
++ */
++void PPU_SetPowerPolicy(PPU_TypeDef *ppu, PPU_PowerPolicy_Type policy, =
bool isDynamic);
++
++/**
++ * @brief  Set the operating mode policy for a given PPU instance.
++*          Only modifies OP_POLICY and OP_DYN_EN bits.
++ * @param  ppu: Pointer to the PPU instance (e.g., CLUSTER_PPU, CORE0_P=
PU)
++ * @param  policy: Operating mode policy (e.g., PPU_OP_MODE_ONE_SLICE_S=
F_ONLY_ON)
++ * @param  dynamic: Enable dynamic transitions enabled for operating mo=
des, allowing transitions to be initiated by changes on operating mode DE=
VACTIVE inputs if non-zero
++ * @retval None
++ */
++void PPU_SetOperatingPolicy(PPU_TypeDef *ppu, PPU_OperatingPolicy_Type =
policy, bool isDynamic);
++
++#endif /* PPU_H */
+diff --git a/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c b=
/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c
+index d0c6b8d59..10c66ac41 100644
+--- a/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c
++++ b/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2018-2024 Arm Limited. All rights reserved.
++ * SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributors
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  *
+@@ -11,6 +11,10 @@
+ #include "tfm_hal_multi_core.h"
+ #include "fwu_agent.h"
+=20
++#ifdef CORSTONE1000_DSU_120T
++#include "ppu.h"
++#endif
++
+ #define HOST_SYS_RST_CTRL_OFFSET     0x000
+ #define HOST_CPU_PE0_CONFIG_OFFSET   0x010
+ #define HOST_CPU_PE1_CONFIG_OFFSET   0x020
+@@ -98,6 +102,28 @@ void tfm_hal_boot_ns_cpu(uintptr_t start_addr)
+=20
+     (void) start_addr;
+=20
++#ifdef CORSTONE1000_DSU_120T
++    /* Power on DSU-120T cluster */
++    PPU_SetOperatingPolicy(CLUSTER_PPU, PPU_OP_MODE_ONE_SLICE_SF_ONLY_O=
N, false);
++    PPU_SetPowerPolicy(CLUSTER_PPU, PPU_PWR_MODE_ON, false);
++   =20
++    /* Power on Cortex-A320 core0 in DSU-120T Cluster */
++    PPU_SetOperatingPolicy(CORE0_PPU, PPU_OP_MODE_ONE_SLICE_SF_ONLY_ON,=
 false);
++    PPU_SetPowerPolicy(CORE0_PPU, PPU_PWR_MODE_ON, false);
++   =20
++#if CORSTONE1000_FVP_MULTICORE
++    /* Power on all Cortex-A320 cores in DSU-120T Cluster */
++    PPU_SetOperatingPolicy(CORE1_PPU, PPU_OP_MODE_ONE_SLICE_SF_ONLY_ON,=
 false);
++    PPU_SetPowerPolicy(CORE1_PPU, PPU_PWR_MODE_ON, false);
++   =20
++    PPU_SetOperatingPolicy(CORE2_PPU, PPU_OP_MODE_ONE_SLICE_SF_ONLY_ON,=
 false);
++    PPU_SetPowerPolicy(CORE2_PPU, PPU_PWR_MODE_ON, false);
++
++    PPU_SetOperatingPolicy(CORE3_PPU, PPU_OP_MODE_ONE_SLICE_SF_ONLY_ON,=
 false);
++    PPU_SetPowerPolicy(CORE3_PPU, PPU_PWR_MODE_ON, false);
++#endif
++#endif
++
+ #ifdef EXTERNAL_SYSTEM_SUPPORT
+     /*release EXT SYS out of reset*/
+     tfm_external_system_boot();
+--=20
+2.50.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index a9521fbf..a355e844 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -12,6 +12,14 @@ DEPENDS:append =3D " clang-native python3-rich-native =
python3-pyelftools-native"
=20
 ## Default is the MPS3 board
 TFM_PLATFORM_IS_FVP ?=3D "FALSE"
+
+## Default is Cortex-A35
+## Cortex-A320 is implemented inside a DynamIQ Shared Unit-120T (DSU-120=
T) cluster
+EXTRA_OECMAKE:append:cortexa320 =3D " \
+    -DCORSTONE1000_CORTEX_A320=3DTRUE \
+    -DCORSTONE1000_DSU_120T=3DTRUE \
+"
+
 EXTRA_OECMAKE +=3D "-DPLATFORM_IS_FVP=3D${TFM_PLATFORM_IS_FVP}"
 EXTRA_OECMAKE +=3D "-DCC312_LEGACY_DRIVER_API_ENABLED=3DOFF"
 EXTRA_OECMAKE:append:corstone1000-fvp =3D " -DENABLE_MULTICORE=3D${@bb.u=
tils.contains('MACHINE_FEATURES', 'corstone1000_fvp_smp', 'TRUE', 'FALSE'=
, d)}"
@@ -33,6 +41,7 @@ SRC_URI:append:corstone1000 =3D " \
     file://0007-Platform-Corstone1000-Remove-duplicate-configuration.pat=
ch \
     file://0008-Platform-Corstone1000-Increase-BL1-size-and-align-bi.pat=
ch \
     file://0009-Platform-CS1K-Adapt-ADAC-enabled-build-to-the-new-BL.pat=
ch \
+    file://0010-plat-corstone1000-Add-support-for-Cortex-A320-varian.pat=
ch \
     "
=20
 FILESEXTRAPATHS:prepend:corstone1000-mps3 :=3D "${THISDIR}/files/corston=
e1000/psa-adac:"

