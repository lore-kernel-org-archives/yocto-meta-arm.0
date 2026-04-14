Return-Path: <Michael.safwat@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55515F9D0C6
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 11:43:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17000.1776166979314960302
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Apr 2026 04:42:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=KSN7mj91;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: michael.safwat@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E69951516;
	Tue, 14 Apr 2026 04:42:52 -0700 (PDT)
Received: from e142473.cambridge.arm.com (e142473.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE4CA3F7B4;
	Tue, 14 Apr 2026 04:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776166978; bh=N+vUSEvvoKE9UjncDPxgEl/sw4zuV9hIDsmauFWJJac=;
	h=From:To:Cc:Subject:Date:From;
	b=KSN7mj91lb8tBaZ2oLr2ERPeC6rb1c8MPnFFcfQkWVeIkh1R95/95z6aR/wIpEaJ0
	 n23PXx3Be1iwU1jT09qrOr12NZ5YKWurHP8O0MCdMD5V4FQCCfWCO48/E+sD1kgh2W
	 xXeyGDQu6YXWiPWX/0nSy99MoY35HGJmBbd+V1M0=
From: Michael Safwat <michael.safwat@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Michael Safwat <michael.safwat@arm.com>
Subject: [PATCH 1/2] arm-bsp/trusted-firmware-m: corstone1000: Drive NPU reset via ext sys ctrl
Date: Tue, 14 Apr 2026 12:42:52 +0100
Message-ID: <20260414114253.1031986-1-michael.safwat@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Apr 2026 11:43:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7013

- Derive host base addresses from offsets and add ext sys reset bitfields
- Deassert CPUWAIT with a bitmask
- Enable ext sys boot handling for Corstone1000 with Cortex-A320
- Add the new downstream TF=E2=80=91M patches to the recipe

Signed-off-by: Michael Safwat <michael.safwat@arm.com>
---
 ...ive-host-base-addresses-from-offsets.patch | 111 ++++++++++++++++++
 ...NPU-via-external-system-reset-contro.patch |  75 ++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |   2 +
 3 files changed, 188 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0044-plat-cs1k-Derive-host-base-addresses-from-offsets.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0045-plat-cs1k-Drive-NPU-via-external-system-reset-contro.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0044-plat-cs1k-Derive-host-base-addresses-from-offsets.patch b/meta-ar=
m-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0044-plat-cs1k-De=
rive-host-base-addresses-from-offsets.patch
new file mode 100644
index 00000000..a83ca6e9
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0044=
-plat-cs1k-Derive-host-base-addresses-from-offsets.patch
@@ -0,0 +1,111 @@
+From 37cac6c86f10340382ff950e5e0323f2efbe5ed3 Mon Sep 17 00:00:00 2001
+From: Michael Safwat <michael.safwat@arm.com>
+Date: Wed, 8 Apr 2026 13:02:47 +0100
+Subject: [PATCH 1/2] plat: cs1k: Derive host base addresses from offsets
+
+Define explicit host register offsets and compute base addresses
+from the common host address space base. This keeps the map
+consistent, and also makes it easy to relocate all addresses if the
+base addresses change.
+
+Define External System Reset Control bitfields and use them to
+de-assert CPUWAIT when booting the external system, so we can touch
+only the bit of interest instead of zeroing the whole register.
+
+Change-Id: Id228351926fc846d28d5bf4e4180a995057154b1
+Signed-off-by: Michael Safwat <michael.safwat@arm.com>
+Upstream-Status: Backport [d73cc1dbc2eb72af02de740926f7b3c889bbac4b]
+---
+ .../Device/Include/platform_base_address.h    | 52 ++++++++++++++-----
+ .../arm/corstone1000/tfm_hal_multi_core.c     |  5 +-
+ 2 files changed, 41 insertions(+), 16 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/Device/Include/platfor=
m_base_address.h b/platform/ext/target/arm/corstone1000/Device/Include/pl=
atform_base_address.h
+index 3908d69bc..62ee7d049 100644
+--- a/platform/ext/target/arm/corstone1000/Device/Include/platform_base_=
address.h
++++ b/platform/ext/target/arm/corstone1000/Device/Include/platform_base_=
address.h
+@@ -68,23 +68,49 @@
+ /* Host base addresses from the SE perspective - partial list, only the=
 ones
+  * required by the SE are defined here */
+ #define CORSTONE1000_HOST_ADDRESS_SPACE_BASE       (0x60000000U) /* Hos=
t Address Space                */
+-#define CORSTONE1000_HOST_BIR_BASE                 (0x60000000U) /* Boo=
t Instruction Register         */
+-#define CORSTONE1000_HOST_TRUSTED_RAM_BASE         (0x62000000U) /* Sec=
ure RAM                        */
+-#define CORSTONE1000_HOST_XNVM_BASE                (0x68000000U) /* XNV=
M                              */
+-#define CORSTONE1000_HOST_BASE_SYSTEM_CONTROL_BASE (0x7A010000U) /* Hos=
t SCB                          */
+-#define CORSTONE1000_EXT_SYS_RESET_REG             (0x7A010310U) /* ext=
ernal system (cortex-M3)       */
+-#define CORSTONE1000_HOST_FIREWALL_BASE            (0x7A800000U) /* Hos=
t Firewall                     */
+-#define CORSTONE1000_HOST_INT_APBCOM_BASE          (0x7B900000U) /* Int=
ernal APBCOM                   */
+-#define CORSTONE1000_HOST_FPGA_SCC_REGISTERS       (0x80000000U) /* FPG=
A SCC Registers                */
+-#define CORSTONE1000_HOST_SE_SECURE_FLASH_BASE_FVP (0x80010000U) /* SE =
Flash                          */
+-#define CORSTONE1000_HOST_AXI_QSPI_CTRL_REG_BASE   (0x80050000U) /* AXI=
 QSPI Controller               */
+-#define CORSTONE1000_HOST_AXI_QSPI_CTRL_REG_BASE_SE_SECURE_FLASH (0x900=
10000U) /* AXI QSPI Controller for SE FLash  */
+-#define CORSTONE1000_HOST_DRAM_UEFI_CAPSULE        (0xA0000000U) /* 1.5=
 GB DDR                        */
+=20
++/* Registers offsets - partial list, only the ones
++ * required by the SE are defined here */
++#define CORSTONE1000_HOST_BIR_OFFSET                                   =
        (0x00000000U)
++#define CORSTONE1000_HOST_CVM_OFFSET                                   =
        (0x02000000U)
++#define CORSTONE1000_HOST_XNVM_OFFSET                                  =
        (0x08000000U)
++#define CORSTONE1000_HOST_BASE_SYSTEM_CONTROL_BASE_OFFSET              =
        (0x1A010000U)
++#define CORSTONE1000_HOST_EXT_SYS0_RST_CTRL_OFFSET                     =
        (0x310U)
++#define CORSTONE1000_HOST_FIREWALL_BASE_OFFSET                         =
        (0x1A800000U)
++#define CORSTONE1000_HOST_INT_APBCOM_BASE_OFFSET                       =
        (0x1B900000U)
++/* The below offsets have been derived from the reserved section.*/
++#define CORSTONE1000_HOST_FPGA_SCC_REGISTERS_OFFSET                    =
        (0x20000000U)
++#define CORSTONE1000_HOST_SE_SECURE_FLASH_BASE_FVP_OFFSET              =
        (0x20010000U)
++#define CORSTONE1000_HOST_AXI_QSPI_CTRL_REG_BASE_OFFSET                =
        (0x20050000U)
++#define CORSTONE1000_HOST_AXI_QSPI_CTRL_REG_BASE_SE_SECURE_FLASH_OFFSET=
        (0x30010000U)
++#define CORSTONE1000_HOST_DRAM_UEFI_CAPSULE_OFFSET                     =
        (0x40000000U)
++#define CORSTONE1000_HOST_DSU_120T_BASE_OFFSET                         =
        (0x60910000U)
++
++/* Register Addresses */
++#define CORSTONE1000_HOST_BIR_BASE                 (CORSTONE1000_HOST_A=
DDRESS_SPACE_BASE + CORSTONE1000_HOST_BIR_OFFSET)                        =
                          /* Boot Instruction Register */
++#define CORSTONE1000_HOST_TRUSTED_RAM_BASE         (CORSTONE1000_HOST_A=
DDRESS_SPACE_BASE + CORSTONE1000_HOST_CVM_OFFSET)                        =
                          /* On-chip Volatile Memory */
++#define CORSTONE1000_HOST_XNVM_BASE                (CORSTONE1000_HOST_A=
DDRESS_SPACE_BASE + CORSTONE1000_HOST_XNVM_OFFSET)                       =
                          /* eXecute-in-place Non-volatile Memory */
++#define CORSTONE1000_HOST_BASE_SYSTEM_CONTROL_BASE (CORSTONE1000_HOST_A=
DDRESS_SPACE_BASE + CORSTONE1000_HOST_BASE_SYSTEM_CONTROL_BASE_OFFSET)   =
                          /* Security Control Bits */
++#define CORSTONE1000_EXT_SYS_RESET_REG             (CORSTONE1000_HOST_B=
ASE_SYSTEM_CONTROL_BASE + CORSTONE1000_HOST_EXT_SYS0_RST_CTRL_OFFSET)    =
                          /* External System (Cortex-M3) */
++#define CORSTONE1000_HOST_FIREWALL_BASE            (CORSTONE1000_HOST_A=
DDRESS_SPACE_BASE + CORSTONE1000_HOST_FIREWALL_BASE_OFFSET)              =
                          /* System Firewall */
++#define CORSTONE1000_HOST_INT_APBCOM_BASE          (CORSTONE1000_HOST_A=
DDRESS_SPACE_BASE + CORSTONE1000_HOST_INT_APBCOM_BASE_OFFSET)            =
                          /* Internal Advanced Peripheral Bus Communicati=
on */
++#define CORSTONE1000_HOST_FPGA_SCC_REGISTERS       (CORSTONE1000_HOST_A=
DDRESS_SPACE_BASE + CORSTONE1000_HOST_FPGA_SCC_REGISTERS_OFFSET)         =
                          /* FPGA Serial Communication Controller Registe=
rs */
++#define CORSTONE1000_HOST_SE_SECURE_FLASH_BASE_FVP (CORSTONE1000_HOST_A=
DDRESS_SPACE_BASE + CORSTONE1000_HOST_SE_SECURE_FLASH_BASE_FVP_OFFSET)   =
                          /* Secure Enclave Flash */
++#define CORSTONE1000_HOST_AXI_QSPI_CTRL_REG_BASE   (CORSTONE1000_HOST_A=
DDRESS_SPACE_BASE + CORSTONE1000_HOST_AXI_QSPI_CTRL_REG_BASE_OFFSET)     =
                          /* AXI QSPI Controller */
++#define CORSTONE1000_HOST_AXI_QSPI_CTRL_REG_BASE_SE_SECURE_FLASH (CORST=
ONE1000_HOST_ADDRESS_SPACE_BASE + CORSTONE1000_HOST_AXI_QSPI_CTRL_REG_BAS=
E_SE_SECURE_FLASH_OFFSET) /* AXI QSPI Controller for SE FLash  */
++#define CORSTONE1000_HOST_DRAM_UEFI_CAPSULE        (CORSTONE1000_HOST_A=
DDRESS_SPACE_BASE + CORSTONE1000_HOST_DRAM_UEFI_CAPSULE_OFFSET)          =
                          /* DDR RAM (1.5 GB) */
+ #ifdef CORSTONE1000_DSU_120T
+-#define CORSTONE1000_HOST_DSU_120T_BASE            (0xC0910000U) /* DSU=
-120T PPU                      */
++#define CORSTONE1000_HOST_DSU_120T_BASE            (CORSTONE1000_HOST_A=
DDRESS_SPACE_BASE + CORSTONE1000_HOST_DSU_120T_BASE_OFFSET)              =
                          /* DynamIQ Shared Unit-120 Power Policy Units *=
/
+ #endif
+=20
++/* Bit definition for External System Reset Control register */
++#define CORSTONE1000_EXT_SYS_RESET_REG_CPUWAIT_Pos           (0U) // CP=
U Wait Control. 0b0 - External System's CPUWAIT signal is de-asserted. 0b=
1 - External System's CPUWAIT signal is asserted.
++#define CORSTONE1000_EXT_SYS_RESET_REG_CPUWAIT_Msk           (0x1UL << =
CORSTONE1000_EXT_SYS_RESET_REG_CPUWAIT_Pos)  // 1 bit
++#define CORSTONE1000_EXT_SYS_RESET_REG_RST_REQ_Pos           (1U) // Re=
set Request for External System. 0b0 - No Reset Requested. 0b1 - Reset Re=
quested.
++#define CORSTONE1000_EXT_SYS_RESET_REG_RST_REQ_Msk           (0x1UL << =
CORSTONE1000_EXT_SYS_RESET_REG_RST_REQ_Pos)  // 1 bit
++#define CORSTONE1000_EXT_SYS_RESET_REG_Reserved_Pos          (2U) // Re=
served.
++#define CORSTONE1000_EXT_SYS_RESET_REG_Reserved_Msk          (0x3FFFFFF=
FUL << CORSTONE1000_EXT_SYS_RESET_REG_Reserved_Pos)  // 30 bits
++
+ /* Map Component definitions to Corstone definitions */
+ #define CC3XX_BASE_S        CORSTONE1000_CRYPTO_ACCELERATOR_BASE
+=20
+diff --git a/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c b=
/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c
+index 9a785bfa0..76360b507 100644
+--- a/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c
++++ b/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c
+@@ -26,12 +26,11 @@
+ #define AA64nAA32_MASK (1 << 3)
+=20
+ #ifdef EXTERNAL_SYSTEM_SUPPORT
+-void tfm_external_system_boot()
++void tfm_external_system_boot(void)
+ {
+     volatile uint32_t *ext_sys_reset_ctl_reg =3D (uint32_t *)(CORSTONE1=
000_EXT_SYS_RESET_REG);
+=20
+-    /* de-assert CPU_WAIT signal*/
+-    *ext_sys_reset_ctl_reg =3D 0x0;
++    *ext_sys_reset_ctl_reg &=3D ~(CORSTONE1000_EXT_SYS_RESET_REG_CPUWAI=
T_Msk);
+ }
+ #endif
+=20
+--=20
+2.43.0
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0045-plat-cs1k-Drive-NPU-via-external-system-reset-contro.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0045-plat-cs1k=
-Drive-NPU-via-external-system-reset-contro.patch
new file mode 100644
index 00000000..c8fb8e4e
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0045=
-plat-cs1k-Drive-NPU-via-external-system-reset-contro.patch
@@ -0,0 +1,75 @@
+From 334e5513db08f6ebdd7e59429849d442b7b43446 Mon Sep 17 00:00:00 2001
+From: Michael Safwat <michael.safwat@arm.com>
+Date: Thu, 19 Mar 2026 11:12:19 +0000
+Subject: [PATCH 2/2] plat: cs1k: Drive NPU via external system reset con=
trol
+
+On Corstone-1000 with Cortex-A320, the NPU reset was previously tied
+to the host boot flow, so the NPU was powered on when the Secure
+Enclave powered on the host. Now the NPU is tied to the External
+System Reset Control register to control the power state.
+
+Reuse the existing external-system boot control mechanism for NPU.
+
+Change-Id: I74f9d57e8cbe5cb38db352d706885f9a37db0183
+Signed-off-by: Michael Safwat <michael.safwat@arm.com>
+Upstream-Status: Backport [6010d3b509e51cf10a711596e7d6058bde1568dc]
+---
+ platform/ext/target/arm/corstone1000/CMakeLists.txt          | 5 +++++
+ .../arm/corstone1000/Device/Include/platform_base_address.h  | 2 +-
+ platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c    | 4 ++--
+ 3 files changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platf=
orm/ext/target/arm/corstone1000/CMakeLists.txt
+index e543c4b6b..739a6a086 100644
+--- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
++++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
+@@ -484,6 +484,11 @@ if (CORSTONE1000_CORTEX_A320)
+         PUBLIC
+             CORSTONE1000_CORTEX_A320
+     )
++
++    target_compile_definitions(platform_s
++        PUBLIC
++            CORSTONE1000_CORTEX_A320
++    )
+ endif()
+=20
+ #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D tfm_adac =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D#
+diff --git a/platform/ext/target/arm/corstone1000/Device/Include/platfor=
m_base_address.h b/platform/ext/target/arm/corstone1000/Device/Include/pl=
atform_base_address.h
+index 62ee7d049..631592b34 100644
+--- a/platform/ext/target/arm/corstone1000/Device/Include/platform_base_=
address.h
++++ b/platform/ext/target/arm/corstone1000/Device/Include/platform_base_=
address.h
+@@ -91,7 +91,7 @@
+ #define CORSTONE1000_HOST_TRUSTED_RAM_BASE         (CORSTONE1000_HOST_A=
DDRESS_SPACE_BASE + CORSTONE1000_HOST_CVM_OFFSET)                        =
                          /* On-chip Volatile Memory */
+ #define CORSTONE1000_HOST_XNVM_BASE                (CORSTONE1000_HOST_A=
DDRESS_SPACE_BASE + CORSTONE1000_HOST_XNVM_OFFSET)                       =
                          /* eXecute-in-place Non-volatile Memory */
+ #define CORSTONE1000_HOST_BASE_SYSTEM_CONTROL_BASE (CORSTONE1000_HOST_A=
DDRESS_SPACE_BASE + CORSTONE1000_HOST_BASE_SYSTEM_CONTROL_BASE_OFFSET)   =
                          /* Security Control Bits */
+-#define CORSTONE1000_EXT_SYS_RESET_REG             (CORSTONE1000_HOST_B=
ASE_SYSTEM_CONTROL_BASE + CORSTONE1000_HOST_EXT_SYS0_RST_CTRL_OFFSET)    =
                          /* External System (Cortex-M3) */
++#define CORSTONE1000_EXT_SYS_RESET_REG             (CORSTONE1000_HOST_B=
ASE_SYSTEM_CONTROL_BASE + CORSTONE1000_HOST_EXT_SYS0_RST_CTRL_OFFSET)    =
                          /* External System (Cortex-M3/NPU) */
+ #define CORSTONE1000_HOST_FIREWALL_BASE            (CORSTONE1000_HOST_A=
DDRESS_SPACE_BASE + CORSTONE1000_HOST_FIREWALL_BASE_OFFSET)              =
                          /* System Firewall */
+ #define CORSTONE1000_HOST_INT_APBCOM_BASE          (CORSTONE1000_HOST_A=
DDRESS_SPACE_BASE + CORSTONE1000_HOST_INT_APBCOM_BASE_OFFSET)            =
                          /* Internal Advanced Peripheral Bus Communicati=
on */
+ #define CORSTONE1000_HOST_FPGA_SCC_REGISTERS       (CORSTONE1000_HOST_A=
DDRESS_SPACE_BASE + CORSTONE1000_HOST_FPGA_SCC_REGISTERS_OFFSET)         =
                          /* FPGA Serial Communication Controller Registe=
rs */
+diff --git a/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c b=
/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c
+index 76360b507..ff65228bf 100644
+--- a/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c
++++ b/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c
+@@ -25,7 +25,7 @@
+=20
+ #define AA64nAA32_MASK (1 << 3)
+=20
+-#ifdef EXTERNAL_SYSTEM_SUPPORT
++#if defined(EXTERNAL_SYSTEM_SUPPORT) || defined(CORSTONE1000_CORTEX_A32=
0)
+ void tfm_external_system_boot(void)
+ {
+     volatile uint32_t *ext_sys_reset_ctl_reg =3D (uint32_t *)(CORSTONE1=
000_EXT_SYS_RESET_REG);
+@@ -123,7 +123,7 @@ void tfm_hal_boot_ns_cpu(uintptr_t start_addr)
+ #endif
+ #endif
+=20
+-#ifdef EXTERNAL_SYSTEM_SUPPORT
++#if defined(EXTERNAL_SYSTEM_SUPPORT) || defined(CORSTONE1000_CORTEX_A32=
0)
+     /*release EXT SYS out of reset*/
+     tfm_external_system_boot();
+ #endif
+--=20
+2.43.0
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index ff3a87a9..55f48a3c 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -75,6 +75,8 @@ SRC_URI:append:corstone1000 =3D " \
     file://0041-plat-cs1k-Changed-to-use-new-GPT-library.patch \
     file://0042-plat-cs1k-Move-variable-from-stack-to-data.patch \
     file://0043-plat-cs1k-Create-and-remove-FWU-image-partitions.patch \
+    file://0044-plat-cs1k-Derive-host-base-addresses-from-offsets.patch =
\
+    file://0045-plat-cs1k-Drive-NPU-via-external-system-reset-contro.pat=
ch \
     "
=20
 SRCREV_tfm-psa-adac:corstone1000 =3D "f2809ae231be33a1afcd7714f40756c67d=
846c88"

