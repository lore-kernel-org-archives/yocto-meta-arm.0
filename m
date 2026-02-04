Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBACBE9537B
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 10:54:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17897.1770202493050641962
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 Feb 2026 02:54:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EEB98339;
	Wed,  4 Feb 2026 02:54:45 -0800 (PST)
Received: from LXKV206JHX.emea.arm.com (LXKV206JHX.cambridge.arm.com [10.1.25.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF0D73F778;
	Wed,  4 Feb 2026 02:54:51 -0800 (PST)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: [PATCH] arm-bsp: corstone1000: Swap GIC-600 for GIC-700 for Cortex-A320 variant
Date: Wed,  4 Feb 2026 10:54:39 +0000
Message-ID: <20260204105439.30589-1-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 04 Feb 2026 10:54:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6886

Make changes across U-Boot, and OP-TEE OS to swap
the GIC-600 for GIC-700 as the latest version of the FVP
swaps the GIC.

Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
---
 ...e1000-Add-Cortex-A320-support-on-FVP.patch |  26 +-
 .../u-boot/corstone1000/corstone1000-a320.cfg |   2 +-
 ...0-Specify-GIC-version-in-plat-specif.patch |  45 ++
 ...lementation-of-GICv3-to-add-GICv4-su.patch | 460 ++++++++++++++++++
 ...0-Swap-GIC-600-for-GIC-700-for-Corte.patch |  37 ++
 .../optee/optee-os-corstone1000-common.inc    |   6 +
 6 files changed, 562 insertions(+), 14 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/co=
rstone1000/0001-plat-corstone1000-Specify-GIC-version-in-plat-specif.patc=
h
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/co=
rstone1000/0002-gic-Refactor-implementation-of-GICv3-to-add-GICv4-su.patc=
h
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/co=
rstone1000/0003-plat-corstone1000-Swap-GIC-600-for-GIC-700-for-Corte.patc=
h

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-cor=
stone1000-Add-Cortex-A320-support-on-FVP.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0039-corstone1000-Add-Cortex-A320-support-on-=
FVP.patch
index ecd96c45..f6da90bd 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-corstone10=
00-Add-Cortex-A320-support-on-FVP.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-corstone10=
00-Add-Cortex-A320-support-on-FVP.patch
@@ -8,7 +8,7 @@ Content-Transfer-Encoding: 8bit
=20
 Enable Cortex-A320 support on the Corstone-1000 platform
 (including FVP) and update the device tree to support the integrated
-Ethos-U85 NPU and GIC-600 interrupt controller. These updates make
+Ethos-U85 NPU and GIC-700 interrupt controller. These updates make
 the platform fully compatible with Cortex-A320 while retaining
 backward compatibility with Cortex-A35 and GIC-400.
=20
@@ -31,13 +31,13 @@ backward compatibility with Cortex-A35 and GIC-400.
   `ethosu-mem-config` for full driver support.
 * Enable the NPU node conditionally via `CONFIG_ETHOS_U85`.
=20
-**GICv3/GIC-600 support**
+**GIC-700 support**
=20
-* Introduce `CONFIG_GIC_V3` to toggle between GIC-400 (v2) and
-  GIC-600 (v3).
-* Add full GICv3 node guarded by `#ifdef CONFIG_GIC_V3`.
+* Introduce `CONFIG_GIC_700` to toggle between GIC-400 and
+  GIC-700.
+* Add full GICv3 node guarded by `#ifdef CONFIG_GIC_700`.
 * Adjust `cpu@1..3` `reg` values to `0x100/0x200/0x300` under
-  GICv3 (keep `0x1/0x2/0x3` for GIC-400).
+  GIC-700 (keep `0x1/0x2/0x3` for GIC-400).
 * Update Ethos-U85 interrupt assignment to **SPI 16** to align with
   the new interrupt map.
=20
@@ -65,7 +65,7 @@ index 6b89d653417..0539e6c092a 100644
  		device_type =3D "cpu";
 -		compatible =3D "arm,cortex-a35";
 +		compatible =3D "arm,cortex-a35","arm,cortex-a320";
-+#ifdef CONFIG_GIC_V3
++#ifdef CONFIG_GIC_700
 +		reg =3D <0x100>;
 +#else
  		reg =3D <0x1>;
@@ -78,7 +78,7 @@ index 6b89d653417..0539e6c092a 100644
  		device_type =3D "cpu";
 -		compatible =3D "arm,cortex-a35";
 +		compatible =3D "arm,cortex-a35","arm,cortex-a320";
-+#ifdef CONFIG_GIC_V3
++#ifdef CONFIG_GIC_700
 +		reg =3D <0x200>;
 +#else
  		reg =3D <0x2>;
@@ -91,7 +91,7 @@ index 6b89d653417..0539e6c092a 100644
  		device_type =3D "cpu";
 -		compatible =3D "arm,cortex-a35";
 +		compatible =3D "arm,cortex-a35","arm,cortex-a320";
-+#ifdef CONFIG_GIC_V3
++#ifdef CONFIG_GIC_700
 +		reg =3D <0x300>;
 +#else
  		reg =3D <0x3>;
@@ -176,7 +176,7 @@ index b29ac74217e..206403ea9a5 100644
 +	};
 +};
 +#endif
-+#ifdef CONFIG_GIC_V3
++#ifdef CONFIG_GIC_700
 +gic: &{/interrupt-controller@1c000000} {
 +		compatible =3D "arm,gic-v3";
 +		#interrupt-cells =3D <3>;
@@ -185,7 +185,7 @@ index b29ac74217e..206403ea9a5 100644
 +		ranges;
 +		interrupt-controller;
 +		reg =3D <0x1c000000 0x00010000>,
-+		<0x1c040000 0x00080000>;
++		<0x1c040000 0x00100000>;
 +		interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 +	};
 +#endif
@@ -214,8 +214,8 @@ index 709674d4cf7..9476d64d0b0 100644
 +	bool "Enable Arm Ethos-U85 NPU support"
 +	default n
 +
-+config GIC_V3
-+	bool "Enable GIC v3 support"
++config GIC_700
++	bool "Enable GIC-700 support"
 +	default n
  endif
 --=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/corstone=
1000-a320.cfg b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/corst=
one1000-a320.cfg
index 866b983f..46760950 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/corstone1000-a3=
20.cfg
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/corstone1000-a3=
20.cfg
@@ -1,2 +1,2 @@
 CONFIG_ETHOS_U85=3Dy
-CONFIG_GIC_V3=3Dy
+CONFIG_GIC_700=3Dy
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1=
000/0001-plat-corstone1000-Specify-GIC-version-in-plat-specif.patch b/met=
a-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0001-plat-co=
rstone1000-Specify-GIC-version-in-plat-specif.patch
new file mode 100644
index 00000000..636b569b
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/000=
1-plat-corstone1000-Specify-GIC-version-in-plat-specif.patch
@@ -0,0 +1,45 @@
+From 47de86d65b3346f0ed9c5f84e9e30f6cf6a71729 Mon Sep 17 00:00:00 2001
+From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
+Date: Thu, 15 Jan 2026 18:33:04 +0000
+Subject: [PATCH 1/3] plat-corstone1000: specify GIC version in plat spec=
ific
+ conf.mk
+
+The Generic Interrupt Controller architecture version is not core
+specific. Therefore move the CFG_ARM_GICV3 definition from
+cortex-a320.mk file to the Corstone-1000 specific file.
+
+Upstream-Status: Submitted [https://github.com/OP-TEE/optee_os/pull/7682=
]
+Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
+Reviewed-by: Jerome Forissier <jerome.forissier@arm.com>
+Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
+---
+ core/arch/arm/cpu/cortex-a320.mk        | 1 -
+ core/arch/arm/plat-corstone1000/conf.mk | 6 ++++++
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/core/arch/arm/cpu/cortex-a320.mk b/core/arch/arm/cpu/cortex=
-a320.mk
+index 12995012d..7ae513496 100644
+--- a/core/arch/arm/cpu/cortex-a320.mk
++++ b/core/arch/arm/cpu/cortex-a320.mk
+@@ -9,4 +9,3 @@ platform-aflags-debug-info =3D -gdwarf-2
+=20
+ arm64-platform-cflags +=3D -march=3Darmv9.2-a
+ arm64-platform-aflags +=3D -march=3Darmv9.2-a
+-$(call force,CFG_ARM_GICV3,y)
+diff --git a/core/arch/arm/plat-corstone1000/conf.mk b/core/arch/arm/pla=
t-corstone1000/conf.mk
+index 24a339a1f..e929d8233 100644
+--- a/core/arch/arm/plat-corstone1000/conf.mk
++++ b/core/arch/arm/plat-corstone1000/conf.mk
+@@ -33,3 +33,9 @@ CFG_DDR_SIZE ?=3D 0x7f000000
+ CFG_DT_ADDR ?=3D 0x82100000
+ CFG_DTB_MAX_SIZE ?=3D 0x100000
+ CFG_CORE_HEAP_SIZE ?=3D 131072
++
++# Corstone-1000 with Cortex-A320 uses GIC-600 which supports
++# the GICv3 architecture
++ifeq ($(arm64-platform-cpuarch),cortex-a320)
++$(call force,CFG_ARM_GICV3,y)
++endif
+--=20
+2.50.1
+
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1=
000/0002-gic-Refactor-implementation-of-GICv3-to-add-GICv4-su.patch b/met=
a-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0002-gic-Ref=
actor-implementation-of-GICv3-to-add-GICv4-su.patch
new file mode 100644
index 00000000..5581d321
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/000=
2-gic-Refactor-implementation-of-GICv3-to-add-GICv4-su.patch
@@ -0,0 +1,460 @@
+From 6443c4b91a0f792a5fa904b2045b055b9733283a Mon Sep 17 00:00:00 2001
+From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
+Date: Thu, 15 Jan 2026 19:02:08 +0000
+Subject: [PATCH 2/3] gic: refactor implementation of GICv3 to add GICv4
+ support
+
+Refactor the definitions of GICv3 to facilitate adding support for
+GICv4 by:
+* Add macro for registers frame sizes based on GIC versions.
+* Add macro for number of frame count for GICR based on GICv3 or GICv4.
+* Add single GICR region size definition (GIC_REDIST_REG_SIZE)
+  based on GIC version in platform independent include/drivers/gic.h
+  along with existing GIC_CPU_REG_SIZE and GIC_DIST_REG_SIZE
+  definitions.
+* Amend usage of the now platform independent GIC_REDIST_REG_SIZE
+  as it no longer includes a multiplication by the number of core on
+  the target platform.
+* Sort in ascending order the listing of GICR register definitions and
+  add comments to denote each definitions sections.
+* Add definitions for each GICR frames.
+* Ensure that all relevant code sections that compile for CFG_ARM_GICV3
+  also compile for CFG_ARM_GICV4.
+
+Upstream-Status: Submitted [https://github.com/OP-TEE/optee_os/pull/7682=
]
+Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
+Reviewed-by: Jerome Forissier <jerome.forissier@arm.com>
+Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
+---
+ core/arch/arm/arm.mk                          |  6 +-
+ core/arch/arm/include/arm32.h                 |  3 +-
+ core/arch/arm/include/arm32_macros.S          |  3 +-
+ core/arch/arm/kernel/sub.mk                   |  2 +-
+ core/arch/arm/plat-corstone1000/main.c        |  9 +--
+ .../arm/plat-corstone1000/platform_config.h   | 12 +---
+ core/drivers/gic.c                            | 58 +++++++++++--------
+ core/include/drivers/gic.h                    | 46 +++++++++++++--
+ 8 files changed, 90 insertions(+), 49 deletions(-)
+
+diff --git a/core/arch/arm/arm.mk b/core/arch/arm/arm.mk
+index 1bf01063e..8d159e625 100644
+--- a/core/arch/arm/arm.mk
++++ b/core/arch/arm/arm.mk
+@@ -151,8 +151,10 @@ endif
+ ifeq ($(CFG_CORE_FFA)-$(CFG_WITH_PAGER),y-y)
+ $(error CFG_CORE_FFA and CFG_WITH_PAGER are not compatible)
+ endif
++_CFG_ARM_V3_OR_V4 :=3D $(call cfg-one-enabled, CFG_ARM_GICV3 CFG_ARM_GI=
CV4)
++
+ ifeq ($(CFG_GIC),y)
+-ifeq ($(CFG_ARM_GICV3),y)
++ifeq ($(_CFG_ARM_V3_OR_V4),y)
+ $(call force,CFG_CORE_IRQ_IS_NATIVE_INTR,y)
+ else
+ $(call force,CFG_CORE_IRQ_IS_NATIVE_INTR,n)
+@@ -438,7 +440,7 @@ arm32-sysregs-$(arm32-sysreg-txt)-h :=3D arm32_sysre=
g.h
+ arm32-sysregs-$(arm32-sysreg-txt)-s :=3D arm32_sysreg.S
+ arm32-sysregs +=3D $(arm32-sysreg-txt)
+=20
+-ifeq ($(CFG_ARM_GICV3),y)
++ifeq ($(_CFG_ARM_V3_OR_V4),y)
+ arm32-gicv3-sysreg-txt =3D core/arch/arm/kernel/arm32_gicv3_sysreg.txt
+ arm32-sysregs-$(arm32-gicv3-sysreg-txt)-h :=3D arm32_gicv3_sysreg.h
+ arm32-sysregs-$(arm32-gicv3-sysreg-txt)-s :=3D arm32_gicv3_sysreg.S
+diff --git a/core/arch/arm/include/arm32.h b/core/arch/arm/include/arm32=
.h
+index ef729d492..195afcacc 100644
+--- a/core/arch/arm/include/arm32.h
++++ b/core/arch/arm/include/arm32.h
+@@ -2,6 +2,7 @@
+ /*
+  * Copyright (c) 2016, Linaro Limited
+  * Copyright (c) 2014, STMicroelectronics International N.V.
++ * Copyright (c) 2026, Arm Limited
+  */
+=20
+ #ifndef __ARM32_H
+@@ -165,7 +166,7 @@
+=20
+ #ifndef __ASSEMBLER__
+ #include <generated/arm32_sysreg.h>
+-#ifdef CFG_ARM_GICV3
++#ifdef _CFG_ARM_V3_OR_V4
+ #include <generated/arm32_gicv3_sysreg.h>
+ #endif
+=20
+diff --git a/core/arch/arm/include/arm32_macros.S b/core/arch/arm/includ=
e/arm32_macros.S
+index 95077a075..9db4722dd 100644
+--- a/core/arch/arm/include/arm32_macros.S
++++ b/core/arch/arm/include/arm32_macros.S
+@@ -1,10 +1,11 @@
+ /* SPDX-License-Identifier: BSD-2-Clause */
+ /*
+  * Copyright (c) 2014, STMicroelectronics International N.V.
++ * Copyright (c) 2026, Arm Limited
+  */
+=20
+ #include <generated/arm32_sysreg.S>
+-#ifdef CFG_ARM_GICV3
++#ifdef _CFG_ARM_V3_OR_V4
+ #include <generated/arm32_gicv3_sysreg.S>
+ #endif
+=20
+diff --git a/core/arch/arm/kernel/sub.mk b/core/arch/arm/kernel/sub.mk
+index 40b7a3f92..071f223a5 100644
+--- a/core/arch/arm/kernel/sub.mk
++++ b/core/arch/arm/kernel/sub.mk
+@@ -69,7 +69,7 @@ asm-defines-y +=3D asm-defines.c
+ #     <asm.h> includes <generated/arm32_sysreg.h>
+ #                  and <generated/arm32_gicv3_sysreg.h> (optional)
+ asm-defines-asm-defines.c-deps +=3D $(out-dir)/core/include/generated/a=
rm32_sysreg.h
+-ifeq ($(CFG_ARM_GICV3),y)
++ifeq ($(_CFG_ARM_V3_OR_V4),y)
+ asm-defines-asm-defines.c-deps +=3D $(out-dir)/core/include/generated/a=
rm32_gicv3_sysreg.h
+ endif
+=20
+diff --git a/core/arch/arm/plat-corstone1000/main.c b/core/arch/arm/plat=
-corstone1000/main.c
+index 376d9c9c6..e1bedddfe 100644
+--- a/core/arch/arm/plat-corstone1000/main.c
++++ b/core/arch/arm/plat-corstone1000/main.c
+@@ -1,6 +1,6 @@
+ // SPDX-License-Identifier: BSD-2-Clause
+ /*
+- * Copyright (c) 2022, 2025, Arm Limited
++ * Copyright (c) 2022, 2025-2026, Arm Limited
+  */
+=20
+ #include <console.h>
+@@ -19,15 +19,16 @@ register_ddr(DRAM0_BASE, DRAM0_SIZE);
+ register_phys_mem_pgdir(MEM_AREA_IO_SEC, CONSOLE_UART_BASE, PL011_REG_S=
IZE);
+ register_phys_mem_pgdir(MEM_AREA_IO_SEC, GICD_BASE, GIC_DIST_REG_SIZE);
+=20
+-#ifdef CFG_ARM_GICV3
+-register_phys_mem_pgdir(MEM_AREA_IO_SEC, GICR_BASE, GIC_REDIST_REG_SIZE=
);
++#ifdef _CFG_ARM_V3_OR_V4
++register_phys_mem_pgdir(MEM_AREA_IO_SEC, GICR_BASE,
++			GIC_REDIST_REG_SIZE * CFG_TEE_CORE_NB_CORE);
+ #else
+ register_phys_mem_pgdir(MEM_AREA_IO_SEC, GICC_BASE, GIC_CPU_REG_SIZE);
+ #endif
+=20
+ void boot_primary_init_intc(void)
+ {
+-#ifdef CFG_ARM_GICV3
++#ifdef _CFG_ARM_V3_OR_V4
+ 	gic_init_v3(0, GICD_BASE, GICR_BASE);
+ #else
+ 	gic_init(GICC_BASE, GICD_BASE);
+diff --git a/core/arch/arm/plat-corstone1000/platform_config.h b/core/ar=
ch/arm/plat-corstone1000/platform_config.h
+index 7a1af3e4c..98dac8ee0 100644
+--- a/core/arch/arm/plat-corstone1000/platform_config.h
++++ b/core/arch/arm/plat-corstone1000/platform_config.h
+@@ -1,6 +1,6 @@
+ /* SPDX-License-Identifier: BSD-2-Clause */
+ /*
+- * Copyright (c) 2022, 2025 Arm Limited
++ * Copyright (c) 2022, 2025-2026 Arm Limited
+  */
+=20
+ #ifndef PLATFORM_CONFIG_H
+@@ -20,13 +20,7 @@
+ #define DRAM0_BASE		0x80000000
+ #define DRAM0_SIZE		CFG_DDR_SIZE
+=20
+-#ifdef CFG_ARM_GICV3
+-#define GICR_SIZE_PER_CORE	0x20000
+-#define GIC_REDIST_REG_SIZE	(GICR_SIZE_PER_CORE * CFG_TEE_CORE_NB_CORE)
+-#endif
+-
+-#ifdef CFG_ARM_GICV3
+-/* Corstone-1000 with Cortex-A320 uses GIC-v3 which supports GICR */
++#ifdef _CFG_ARM_V3_OR_V4
+ #define GICD_OFFSET		0x00000
+ #define GICR_OFFSET		0x40000
+ #else
+@@ -34,7 +28,7 @@
+ #define GICC_OFFSET		0x2F000
+ #endif
+=20
+-#ifdef CFG_ARM_GICV3
++#ifdef _CFG_ARM_V3_OR_V4
+ #define GICR_BASE		(GIC_BASE + GICR_OFFSET)
+ #else
+ #define GICC_BASE		(GIC_BASE + GICC_OFFSET)
+diff --git a/core/drivers/gic.c b/core/drivers/gic.c
+index be0193416..af7783d32 100644
+--- a/core/drivers/gic.c
++++ b/core/drivers/gic.c
+@@ -2,6 +2,7 @@
+ /*
+  * Copyright (c) 2016-2017, 2023-2024 Linaro Limited
+  * Copyright (c) 2014, STMicroelectronics International N.V.
++ * Copyright (c) 2026 Arm Limited
+  */
+=20
+ #include <arm.h>
+@@ -49,7 +50,7 @@
+ #define GICD_IGROUPMODR(n)	(0xd00 + (n) * 4)
+ #define GICD_SGIR		(0xF00)
+=20
+-#ifdef CFG_ARM_GICV3
++#ifdef _CFG_ARM_V3_OR_V4
+ #define GICD_PIDR2		(0xFFE8)
+ #else
+ /* Called ICPIDR2 in GICv2 specification */
+@@ -63,22 +64,29 @@
+ #define GICD_CTLR_ARE_NS	BIT32(5)
+=20
+ /* Offsets from gic.gicr_base[core_pos] */
+-#define GICR_V3_PCPUBASE_SIZE	(2 * 64 * 1024)
+-#define GICR_SGI_BASE_OFFSET	(64 * 1024)
+-#define GICR_CTLR		(0x00)
+-#define GICR_TYPER		(0x08)
++#define GICR_RD_BASE_OFFSET         (0x0000)
++#define GICR_SGI_BASE_OFFSET        (GICR_RD_BASE_OFFSET + GICR_FRAME_S=
IZE)
++#define GICR_VLPI_BASE_OFFSET       (GICR_SGI_BASE_OFFSET + GICR_FRAME_=
SIZE)
++#define GICR_RESERVED_BASE_OFFSET   (GICR_VLPI_BASE_OFFSET + GICR_FRAME=
_SIZE)
+=20
++/* GIC physical LPI Redistributor register map */
++#define GICR_CTLR		(GICR_RD_BASE_OFFSET + 0x0000)
++#define GICR_TYPER		(GICR_RD_BASE_OFFSET + 0x0008)
++
++/* GIC SGI and PPI Redistributor register map */
+ #define GICR_IGROUPR0		(GICR_SGI_BASE_OFFSET + 0x080)
+-#define GICR_IGRPMODR0		(GICR_SGI_BASE_OFFSET + 0xD00)
++#define GICR_ISENABLER0		(GICR_SGI_BASE_OFFSET + 0x100)
+ #define GICR_ICENABLER0		(GICR_SGI_BASE_OFFSET + 0x180)
+ #define GICR_ICPENDR0		(GICR_SGI_BASE_OFFSET + 0x280)
+-#define GICR_ISENABLER0		(GICR_SGI_BASE_OFFSET + 0x100)
++#define GICR_IPRIORITYR(n)	(GICR_SGI_BASE_OFFSET + 0x400 + (n) * 4)
+ #define GICR_ICFGR0		(GICR_SGI_BASE_OFFSET + 0xC00)
+ #define GICR_ICFGR1		(GICR_SGI_BASE_OFFSET + 0xC04)
+-#define GICR_IPRIORITYR(n)	(GICR_SGI_BASE_OFFSET + 0x400 + (n) * 4)
++#define GICR_IGRPMODR0		(GICR_SGI_BASE_OFFSET + 0xD00)
+=20
++/* GICR_CTLR, Redistributor Control Register bits */
+ #define GICR_CTLR_RWP		BIT32(3)
+=20
++/* GICR_TYPER, Redistributor Type Register bits */
+ #define GICR_TYPER_LAST		BIT64(4)
+ #define GICR_TYPER_AFF3_SHIFT	56
+ #define GICR_TYPER_AFF2_SHIFT	48
+@@ -136,7 +144,7 @@
+ struct gic_data {
+ 	vaddr_t gicc_base;
+ 	vaddr_t gicd_base;
+-#if defined(CFG_ARM_GICV3)
++#ifdef _CFG_ARM_V3_OR_V4
+ 	vaddr_t gicr_base[CFG_TEE_CORE_NB_CORE];
+ #endif
+ 	size_t max_it;
+@@ -174,7 +182,7 @@ DECLARE_KEEP_PAGER(gic_ops);
+=20
+ static vaddr_t __maybe_unused get_gicr_base(struct gic_data *gd __maybe=
_unused)
+ {
+-#if defined(CFG_ARM_GICV3)
++#ifdef _CFG_ARM_V3_OR_V4
+ 	return gd->gicr_base[get_core_pos()];
+ #else
+ 	return 0;
+@@ -183,7 +191,7 @@ static vaddr_t __maybe_unused get_gicr_base(struct g=
ic_data *gd __maybe_unused)
+=20
+ static bool affinity_routing_is_enabled(struct gic_data *gd)
+ {
+-	return IS_ENABLED(CFG_ARM_GICV3) &&
++	return IS_ENABLED2(_CFG_ARM_V3_OR_V4) &&
+ 	       io_read32(gd->gicd_base + GICD_CTLR) & GICD_CTLR_ARE_S;
+ }
+=20
+@@ -198,7 +206,7 @@ static size_t probe_max_it(vaddr_t gicc_base __maybe=
_unused, vaddr_t gicd_base)
+ 	/*
+ 	 * Probe which interrupt number is the largest.
+ 	 */
+-#if defined(CFG_ARM_GICV3)
++#ifdef _CFG_ARM_V3_OR_V4
+ 	old_ctlr =3D read_icc_ctlr();
+ 	write_icc_ctlr(0);
+ #else
+@@ -222,7 +230,7 @@ static size_t probe_max_it(vaddr_t gicc_base __maybe=
_unused, vaddr_t gicd_base)
+ 		}
+ 	}
+ out:
+-#if defined(CFG_ARM_GICV3)
++#ifdef _CFG_ARM_V3_OR_V4
+ 	write_icc_ctlr(old_ctlr);
+ #else
+ 	io_write32(gicc_base + GICC_CTLR, old_ctlr);
+@@ -342,7 +350,7 @@ static void init_gic_per_cpu(struct gic_data *gd)
+ 	 * Set the priority mask to permit Non-secure interrupts, and to
+ 	 * allow the Non-secure world to adjust the priority mask itself
+ 	 */
+-#if defined(CFG_ARM_GICV3)
++#ifdef _CFG_ARM_V3_OR_V4
+ 	write_icc_pmr(0x80);
+ 	write_icc_igrpen1(1);
+ #else
+@@ -359,7 +367,7 @@ void gic_init_per_cpu(void)
+ {
+ 	struct gic_data *gd =3D &gic_data;
+=20
+-#if defined(CFG_ARM_GICV3)
++#ifdef _CFG_ARM_V3_OR_V4
+ 	assert(gd->gicd_base);
+ #else
+ 	assert(gd->gicd_base && gd->gicc_base);
+@@ -481,7 +489,7 @@ static int gic_dt_get_irq(const uint32_t *properties=
, int count, uint32_t *type,
+ static void __maybe_unused probe_redist_base_addrs(vaddr_t *gicr_base_a=
ddrs,
+ 						   paddr_t gicr_base_pa)
+ {
+-	size_t sz =3D GICR_V3_PCPUBASE_SIZE;
++	size_t sz =3D GIC_REDIST_REG_SIZE;
+ 	paddr_t pa =3D gicr_base_pa;
+ 	size_t core_pos =3D 0;
+ 	uint64_t mt_bit =3D 0;
+@@ -538,7 +546,7 @@ static void gic_init_base_addr(paddr_t gicc_base_pa,=
 paddr_t gicd_base_pa,
+ 	vers >>=3D GICD_PIDR2_ARCHREV_SHIFT;
+ 	vers &=3D GICD_PIDR2_ARCHREV_MASK;
+=20
+-	if (IS_ENABLED(CFG_ARM_GICV3)) {
++	if (IS_ENABLED2(_CFG_ARM_V3_OR_V4)) {
+ 		assert(vers =3D=3D 4 || vers =3D=3D 3);
+ 	} else {
+ 		assert(vers =3D=3D 2 || vers =3D=3D 1);
+@@ -551,7 +559,7 @@ static void gic_init_base_addr(paddr_t gicc_base_pa,=
 paddr_t gicd_base_pa,
+ 	gd->gicc_base =3D gicc_base;
+ 	gd->gicd_base =3D gicd_base;
+ 	gd->max_it =3D probe_max_it(gicc_base, gicd_base);
+-#if defined(CFG_ARM_GICV3)
++#ifdef _CFG_ARM_V3_OR_V4
+ 	if (affinity_routing_is_enabled(gd) && gicr_base_pa)
+ 		probe_redist_base_addrs(gd->gicr_base, gicr_base_pa);
+ #endif
+@@ -623,7 +631,7 @@ void gic_init_v3(paddr_t gicc_base_pa, paddr_t gicd_=
base_pa,
+ 	/* Set the priority mask to permit Non-secure interrupts, and to
+ 	 * allow the Non-secure world to adjust the priority mask itself
+ 	 */
+-#if defined(CFG_ARM_GICV3)
++#ifdef _CFG_ARM_V3_OR_V4
+ 	write_icc_pmr(0x80);
+ 	write_icc_igrpen1(1);
+ 	io_setbits32(gd->gicd_base + GICD_CTLR, GICD_CTLR_ENABLEGRP1S);
+@@ -654,7 +662,7 @@ static void gic_it_configure(struct gic_data *gd, si=
ze_t it)
+ 	io_write32(gd->gicd_base + GICD_ICPENDR(idx), mask);
+ 	/* Assign it to group0 */
+ 	io_clrbits32(gd->gicd_base + GICD_IGROUPR(idx), mask);
+-#if defined(CFG_ARM_GICV3)
++#ifdef _CFG_ARM_V3_OR_V4
+ 	/* Assign it to group1S */
+ 	io_setbits32(gd->gicd_base + GICD_IGROUPMODR(idx), mask);
+ #endif
+@@ -776,7 +784,7 @@ static void assert_cpu_mask_is_valid(uint32_t cpu_ma=
sk)
+ static void gic_it_raise_sgi(struct gic_data *gd __maybe_unused, size_t=
 it,
+ 			     uint32_t cpu_mask, bool ns)
+ {
+-#if defined(CFG_ARM_GICV3)
++#ifdef _CFG_ARM_V3_OR_V4
+ 	uint32_t mask_id =3D it & 0xf;
+ 	uint64_t mask =3D SHIFT_U64(mask_id, 24);
+=20
+@@ -841,7 +849,7 @@ static uint32_t gic_read_iar(struct gic_data *gd __m=
aybe_unused)
+ {
+ 	assert(gd =3D=3D &gic_data);
+=20
+-#if defined(CFG_ARM_GICV3)
++#ifdef _CFG_ARM_V3_OR_V4
+ 	return read_icc_iar1();
+ #else
+ 	return io_read32(gd->gicc_base + GICC_IAR);
+@@ -852,7 +860,7 @@ static void gic_write_eoir(struct gic_data *gd __may=
be_unused, uint32_t eoir)
+ {
+ 	assert(gd =3D=3D &gic_data);
+=20
+-#if defined(CFG_ARM_GICV3)
++#ifdef _CFG_ARM_V3_OR_V4
+ 	write_icc_eoir1(eoir);
+ #else
+ 	io_write32(gd->gicc_base + GICC_EOIR, eoir);
+@@ -894,7 +902,7 @@ void gic_dump_state(void)
+ 	struct gic_data *gd =3D &gic_data;
+ 	int i =3D 0;
+=20
+-#if defined(CFG_ARM_GICV3)
++#ifdef _CFG_ARM_V3_OR_V4
+ 	DMSG("GICC_CTLR: %#"PRIx32, read_icc_ctlr());
+ #else
+ 	DMSG("GICC_CTLR: %#"PRIx32, io_read32(gd->gicc_base + GICC_CTLR));
+@@ -932,7 +940,7 @@ TEE_Result gic_spi_release_to_ns(size_t it)
+ 	io_write32(gd->gicd_base + GICD_ICPENDR(idx), mask);
+ 	/* Assign it to NS Group1 */
+ 	io_setbits32(gd->gicd_base + GICD_IGROUPR(idx), mask);
+-#if defined(CFG_ARM_GICV3)
++#ifdef _CFG_ARM_V3_OR_V4
+ 	io_clrbits32(gd->gicd_base + GICD_IGROUPMODR(idx), mask);
+ #endif
+ 	mutex_unlock(&gic_mutex);
+diff --git a/core/include/drivers/gic.h b/core/include/drivers/gic.h
+index 0dfcca7e1..a17dbac0c 100644
+--- a/core/include/drivers/gic.h
++++ b/core/include/drivers/gic.h
+@@ -2,6 +2,7 @@
+ /*
+  * Copyright (c) 2016, Linaro Limited
+  * Copyright (c) 2014, STMicroelectronics International N.V.
++ * Copyright (c) 2026 Arm Limited
+  */
+=20
+ #ifndef __DRIVERS_GIC_H
+@@ -9,12 +10,45 @@
+ #include <types_ext.h>
+ #include <kernel/interrupt.h>
+=20
+-#if defined(CFG_ARM_GICV3)
+-#define GIC_DIST_REG_SIZE	0x10000
+-#define GIC_CPU_REG_SIZE	0x10000
+-#else
+-#define GIC_DIST_REG_SIZE	0x1000
+-#define GIC_CPU_REG_SIZE	0x1000
++#ifdef _CFG_ARM_V3_OR_V4
++#define GICD_FRAME_SIZE         (64 * 1024)
++#define GICC_FRAME_SIZE         (64 * 1024)
++#define GICR_FRAME_SIZE         (64 * 1024)
++#else /* GICv2 and earlier */
++#define GICD_FRAME_SIZE         (4 * 1024)
++#define GICC_FRAME_SIZE         (4 * 1024)
++#define GICR_FRAME_SIZE         0 /* Unsupported */
++#endif
++
++#define GIC_CPU_REG_SIZE        GICC_FRAME_SIZE
++#define GIC_DIST_REG_SIZE       GICD_FRAME_SIZE
++#ifdef _CFG_ARM_V3_OR_V4
++/*
++ * The frames for each Redistributor are contiguous and are ordered as
++ * follows:
++ * 1. RD_base
++ * 2. SGI_base
++ *
++ * In GICv4, there are two additional 64KB frames:
++ * - A frame to control virtual LPIs. The base address of this frame is
++ *   referred to as VLPI_base.
++ * - A reserved frame.
++ *
++ * The frames for each Redistributor are contiguous and are
++ * ordered as follows:
++ *   1. RD_base
++ *   2. SGI_base
++ *   3. VLPI_base
++ *   4. Reserved
++ */
++#ifdef CFG_ARM_GICV4
++#define GICR_FRAME_COUNT        4
++#else /* CFG_ARM_GICV3 */
++#define GICR_FRAME_COUNT        2
++#endif
++#define GIC_REDIST_REG_SIZE     (GICR_FRAME_COUNT * GICR_FRAME_SIZE)
++#else /* GICv2 and earlier */
++#define GIC_REDIST_REG_SIZE     0 /* Unsupported */
+ #endif
+=20
+ #define GIC_PPI_BASE		U(16)
+--=20
+2.50.1
+
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1=
000/0003-plat-corstone1000-Swap-GIC-600-for-GIC-700-for-Corte.patch b/met=
a-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0003-plat-co=
rstone1000-Swap-GIC-600-for-GIC-700-for-Corte.patch
new file mode 100644
index 00000000..0ff3bf0a
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/000=
3-plat-corstone1000-Swap-GIC-600-for-GIC-700-for-Corte.patch
@@ -0,0 +1,37 @@
+From b3d2c75ef21e5c4baa957839ef44c6f32e8e2626 Mon Sep 17 00:00:00 2001
+From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
+Date: Thu, 15 Jan 2026 19:10:32 +0000
+Subject: [PATCH 3/3] plat-corstone1000: swap GIC-600 for GIC-700 for
+ Cortex-A320 variant
+
+Switch the Cortex-A320 variant to use GIC-700 instead of GIC-600.
+GIC-700 implements the Arm GICv4.1 architecture, so enable the
+CFG_ARM_GICV4 compiler definition for the Corstone-1000 platform.
+
+Upstream-Status: Submitted [https://github.com/OP-TEE/optee_os/pull/7682=
]
+Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
+Reviewed-by: Jerome Forissier <jerome.forissier@arm.com>
+Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
+---
+ core/arch/arm/plat-corstone1000/conf.mk | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/core/arch/arm/plat-corstone1000/conf.mk b/core/arch/arm/pla=
t-corstone1000/conf.mk
+index e929d8233..eabad7739 100644
+--- a/core/arch/arm/plat-corstone1000/conf.mk
++++ b/core/arch/arm/plat-corstone1000/conf.mk
+@@ -34,8 +34,8 @@ CFG_DT_ADDR ?=3D 0x82100000
+ CFG_DTB_MAX_SIZE ?=3D 0x100000
+ CFG_CORE_HEAP_SIZE ?=3D 131072
+=20
+-# Corstone-1000 with Cortex-A320 uses GIC-600 which supports
+-# the GICv3 architecture
++# Corstone-1000 with Cortex-A320 uses GIC-700 which supports
++# the GICv3, GICv3.1, and GICv4.1 architectures
+ ifeq ($(arm64-platform-cpuarch),cortex-a320)
+-$(call force,CFG_ARM_GICV3,y)
++CFG_ARM_GICV4 ?=3D y
+ endif
+--=20
+2.50.1
+
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-co=
mmon.inc b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-comm=
on.inc
index ee8e4df3..304dd0a9 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.in=
c
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.in=
c
@@ -1,5 +1,11 @@
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/optee-os/corstone1000:"
=20
+SRC_URI:append =3D " \
+        file://0001-plat-corstone1000-Specify-GIC-version-in-plat-specif=
.patch \
+        file://0002-gic-Refactor-implementation-of-GICv3-to-add-GICv4-su=
.patch \
+        file://0003-plat-corstone1000-Swap-GIC-600-for-GIC-700-for-Corte=
.patch \
+"
+
 COMPATIBLE_MACHINE =3D "corstone1000"
=20
 OPTEEMACHINE =3D "corstone1000"

