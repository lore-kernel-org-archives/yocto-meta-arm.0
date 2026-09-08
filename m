Return-Path: <Oscar.Belshaw@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F902C79F82
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 14:21:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8606.1788877307501091914
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Sep 2026 07:21:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=KhGngEtK;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: oscar.belshaw@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 459F21477;
	Tue,  8 Sep 2026 07:21:43 -0700 (PDT)
Received: from e142471.cambridge.arm.com (e142471.arm.com [10.2.210.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 330AE3F528;
	Tue,  8 Sep 2026 07:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788877307; bh=seR3WuDE8hharCx8dx4pg4MZjjUBXXJV+6yr8pY1lCo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KhGngEtKYBhGOSHL90/WdCu5J4kKWO1hF15u1cUKPXPcv5j5+0fiycrtFeVR/87OX
	 mu3eMVpciLE28ThjZYLAiRaZ1W45WdJQON8P36akZaJbEgA5LMoQSS/5JQjzMo05k2
	 0VmicP1Ox5YQ3AZ9Hcf6Yn7Cib5wwjoTgzmdALTg=
From: Oscar Belshaw <Oscar.Belshaw@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Oscar Belshaw <Oscar.Belshaw@arm.com>
Subject: [PATCH oscbel01/corstone1000/optee-4.10 1/1] arm-bsp/corstone1000: update OP-TEE to 4.10.0
Date: Tue,  8 Sep 2026 15:21:27 +0100
Message-ID: <20260908142127.3759521-2-Oscar.Belshaw@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908142127.3759521-1-Oscar.Belshaw@arm.com>
References: <20260908142127.3759521-1-Oscar.Belshaw@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 08 Sep 2026 14:21:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7160

Update Corstone-1000 to OP-TEE 4.10.0.

Removed the local 4.9.0 recipes and patches that are included
upstream in 4.10.0.

Tested on the Corstone-1000 Cortex-A35 and Cortex-A320 FVPs.

Signed-off-by: Oscar Belshaw <Oscar.Belshaw@arm.com>
---
 .../conf/machine/include/corstone1000.inc     |   4 +-
 .../corstone1000-a320/topics/user-guide.md    |   2 +-
 .../documentation/corstone1000/user-guide.rst |  10 +-
 ...0-Specify-GIC-version-in-plat-specif.patch |  45 --
 ...lementation-of-GICv3-to-add-GICv4-su.patch | 460 ------------------
 ...0-Swap-GIC-600-for-GIC-700-for-Corte.patch |  37 --
 .../optee/optee-client_4.9.0.bb               |   4 -
 .../optee/optee-examples_4.9.0.bb             |   4 -
 .../optee/optee-os-corstone1000-common.inc    |   8 -
 .../optee/optee-os-tadevkit_4.9.0.bb          |  30 --
 .../recipes-security/optee/optee-os_4.9.0.bb  |   6 -
 .../optee/optee-test_4.9.0.bb                 |  17 -
 12 files changed, 8 insertions(+), 619 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/co=
rstone1000/0001-plat-corstone1000-Specify-GIC-version-in-plat-specif.patc=
h
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/co=
rstone1000/0002-gic-Refactor-implementation-of-GICv3-to-add-GICv4-su.patc=
h
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/co=
rstone1000/0003-plat-corstone1000-Swap-GIC-600-for-GIC-700-for-Corte.patc=
h
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-client_4.9.=
0.bb
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-examples_4.=
9.0.bb
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-tadevkit=
_4.9.0.bb
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os_4.9.0.bb
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-test_4.9.0.=
bb

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index 668b2644..70fa7ce1 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -17,8 +17,8 @@ TFA_BL2_BINARY =3D "bl2-corstone1000.bin"
 TFA_FIP_BINARY =3D "fip-corstone1000.bin"
=20
 # optee
-PREFERRED_VERSION_optee-os ?=3D "4.9.%"
-PREFERRED_VERSION_optee-client ?=3D "4.9.%"
+PREFERRED_VERSION_optee-os ?=3D "4.10.%"
+PREFERRED_VERSION_optee-client ?=3D "4.10.%"
=20
 # Trusted Services
 TS_PLATFORM =3D "arm/corstone1000"
diff --git a/meta-arm-bsp/documentation/corstone1000-a320/topics/user-gui=
de.md b/meta-arm-bsp/documentation/corstone1000-a320/topics/user-guide.md
index 61387909..5bee6b58 100644
--- a/meta-arm-bsp/documentation/corstone1000-a320/topics/user-guide.md
+++ b/meta-arm-bsp/documentation/corstone1000-a320/topics/user-guide.md
@@ -91,7 +91,7 @@ Table: OP-TEE components
 | Type      | Path                                                      =
                                                       |
 | --------- | ----------------------------------------------------------=
------------------------------------------------------ |
 | bbappend  | `${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-security/optee=
/optee-os_%.bbappend`                                 |
-| Recipe    | `${WORKSPACE}/meta-arm/meta-arm/recipes-security/optee/opt=
ee-os_4.9.0.bb`                                       |
+| Recipe    | `${WORKSPACE}/meta-arm/meta-arm/recipes-security/optee/opt=
ee-os_4.10.0.bb`                                       |
=20
 #### U-Boot {.reference}
=20
diff --git a/meta-arm-bsp/documentation/corstone1000/user-guide.rst b/met=
a-arm-bsp/documentation/corstone1000/user-guide.rst
index 640e0c5f..fcb9bc05 100644
--- a/meta-arm-bsp/documentation/corstone1000/user-guide.rst
+++ b/meta-arm-bsp/documentation/corstone1000/user-guide.rst
@@ -131,11 +131,11 @@ Host Processor Components
 `OP-TEE <https://git.trustedfirmware.org/OP-TEE/optee_os.git>`__
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-+----------+------------------------------------------------------------=
------------------------------+
-| bbappend | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-security/optee=
/optee-os_%.bbappend``        |
-+----------+------------------------------------------------------------=
------------------------------+
-| Recipe   | ``${WORKSPACE}/meta-arm/meta-arm/recipes-security/optee/opt=
ee-os_4.9.0.bb``              |
-+----------+------------------------------------------------------------=
------------------------------+
++----------+------------------------------------------------------------=
-------------------------------+
+| bbappend | ``${WORKSPACE}/meta-arm/meta-arm-bsp/recipes-security/optee=
/optee-os_%.bbappend``         |
++----------+------------------------------------------------------------=
-------------------------------+
+| Recipe   | ``${WORKSPACE}/meta-arm/meta-arm/recipes-security/optee/opt=
ee-os_4.10.0.bb``              |
++----------+------------------------------------------------------------=
-------------------------------+
=20
 `U-Boot <https://github.com/u-boot/u-boot.git>`__
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1=
000/0001-plat-corstone1000-Specify-GIC-version-in-plat-specif.patch b/met=
a-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0001-plat-co=
rstone1000-Specify-GIC-version-in-plat-specif.patch
deleted file mode 100644
index 636b569b..00000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/000=
1-plat-corstone1000-Specify-GIC-version-in-plat-specif.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 47de86d65b3346f0ed9c5f84e9e30f6cf6a71729 Mon Sep 17 00:00:00 2001
-From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
-Date: Thu, 15 Jan 2026 18:33:04 +0000
-Subject: [PATCH 1/3] plat-corstone1000: specify GIC version in plat spec=
ific
- conf.mk
-
-The Generic Interrupt Controller architecture version is not core
-specific. Therefore move the CFG_ARM_GICV3 definition from
-cortex-a320.mk file to the Corstone-1000 specific file.
-
-Upstream-Status: Submitted [https://github.com/OP-TEE/optee_os/pull/7682=
]
-Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
-Reviewed-by: Jerome Forissier <jerome.forissier@arm.com>
-Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
----
- core/arch/arm/cpu/cortex-a320.mk        | 1 -
- core/arch/arm/plat-corstone1000/conf.mk | 6 ++++++
- 2 files changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/core/arch/arm/cpu/cortex-a320.mk b/core/arch/arm/cpu/cortex=
-a320.mk
-index 12995012d..7ae513496 100644
---- a/core/arch/arm/cpu/cortex-a320.mk
-+++ b/core/arch/arm/cpu/cortex-a320.mk
-@@ -9,4 +9,3 @@ platform-aflags-debug-info =3D -gdwarf-2
-=20
- arm64-platform-cflags +=3D -march=3Darmv9.2-a
- arm64-platform-aflags +=3D -march=3Darmv9.2-a
--$(call force,CFG_ARM_GICV3,y)
-diff --git a/core/arch/arm/plat-corstone1000/conf.mk b/core/arch/arm/pla=
t-corstone1000/conf.mk
-index 24a339a1f..e929d8233 100644
---- a/core/arch/arm/plat-corstone1000/conf.mk
-+++ b/core/arch/arm/plat-corstone1000/conf.mk
-@@ -33,3 +33,9 @@ CFG_DDR_SIZE ?=3D 0x7f000000
- CFG_DT_ADDR ?=3D 0x82100000
- CFG_DTB_MAX_SIZE ?=3D 0x100000
- CFG_CORE_HEAP_SIZE ?=3D 131072
-+
-+# Corstone-1000 with Cortex-A320 uses GIC-600 which supports
-+# the GICv3 architecture
-+ifeq ($(arm64-platform-cpuarch),cortex-a320)
-+$(call force,CFG_ARM_GICV3,y)
-+endif
---=20
-2.50.1
-
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1=
000/0002-gic-Refactor-implementation-of-GICv3-to-add-GICv4-su.patch b/met=
a-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0002-gic-Ref=
actor-implementation-of-GICv3-to-add-GICv4-su.patch
deleted file mode 100644
index 5581d321..00000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/000=
2-gic-Refactor-implementation-of-GICv3-to-add-GICv4-su.patch
+++ /dev/null
@@ -1,460 +0,0 @@
-From 6443c4b91a0f792a5fa904b2045b055b9733283a Mon Sep 17 00:00:00 2001
-From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
-Date: Thu, 15 Jan 2026 19:02:08 +0000
-Subject: [PATCH 2/3] gic: refactor implementation of GICv3 to add GICv4
- support
-
-Refactor the definitions of GICv3 to facilitate adding support for
-GICv4 by:
-* Add macro for registers frame sizes based on GIC versions.
-* Add macro for number of frame count for GICR based on GICv3 or GICv4.
-* Add single GICR region size definition (GIC_REDIST_REG_SIZE)
-  based on GIC version in platform independent include/drivers/gic.h
-  along with existing GIC_CPU_REG_SIZE and GIC_DIST_REG_SIZE
-  definitions.
-* Amend usage of the now platform independent GIC_REDIST_REG_SIZE
-  as it no longer includes a multiplication by the number of core on
-  the target platform.
-* Sort in ascending order the listing of GICR register definitions and
-  add comments to denote each definitions sections.
-* Add definitions for each GICR frames.
-* Ensure that all relevant code sections that compile for CFG_ARM_GICV3
-  also compile for CFG_ARM_GICV4.
-
-Upstream-Status: Submitted [https://github.com/OP-TEE/optee_os/pull/7682=
]
-Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
-Reviewed-by: Jerome Forissier <jerome.forissier@arm.com>
-Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
----
- core/arch/arm/arm.mk                          |  6 +-
- core/arch/arm/include/arm32.h                 |  3 +-
- core/arch/arm/include/arm32_macros.S          |  3 +-
- core/arch/arm/kernel/sub.mk                   |  2 +-
- core/arch/arm/plat-corstone1000/main.c        |  9 +--
- .../arm/plat-corstone1000/platform_config.h   | 12 +---
- core/drivers/gic.c                            | 58 +++++++++++--------
- core/include/drivers/gic.h                    | 46 +++++++++++++--
- 8 files changed, 90 insertions(+), 49 deletions(-)
-
-diff --git a/core/arch/arm/arm.mk b/core/arch/arm/arm.mk
-index 1bf01063e..8d159e625 100644
---- a/core/arch/arm/arm.mk
-+++ b/core/arch/arm/arm.mk
-@@ -151,8 +151,10 @@ endif
- ifeq ($(CFG_CORE_FFA)-$(CFG_WITH_PAGER),y-y)
- $(error CFG_CORE_FFA and CFG_WITH_PAGER are not compatible)
- endif
-+_CFG_ARM_V3_OR_V4 :=3D $(call cfg-one-enabled, CFG_ARM_GICV3 CFG_ARM_GI=
CV4)
-+
- ifeq ($(CFG_GIC),y)
--ifeq ($(CFG_ARM_GICV3),y)
-+ifeq ($(_CFG_ARM_V3_OR_V4),y)
- $(call force,CFG_CORE_IRQ_IS_NATIVE_INTR,y)
- else
- $(call force,CFG_CORE_IRQ_IS_NATIVE_INTR,n)
-@@ -438,7 +440,7 @@ arm32-sysregs-$(arm32-sysreg-txt)-h :=3D arm32_sysre=
g.h
- arm32-sysregs-$(arm32-sysreg-txt)-s :=3D arm32_sysreg.S
- arm32-sysregs +=3D $(arm32-sysreg-txt)
-=20
--ifeq ($(CFG_ARM_GICV3),y)
-+ifeq ($(_CFG_ARM_V3_OR_V4),y)
- arm32-gicv3-sysreg-txt =3D core/arch/arm/kernel/arm32_gicv3_sysreg.txt
- arm32-sysregs-$(arm32-gicv3-sysreg-txt)-h :=3D arm32_gicv3_sysreg.h
- arm32-sysregs-$(arm32-gicv3-sysreg-txt)-s :=3D arm32_gicv3_sysreg.S
-diff --git a/core/arch/arm/include/arm32.h b/core/arch/arm/include/arm32=
.h
-index ef729d492..195afcacc 100644
---- a/core/arch/arm/include/arm32.h
-+++ b/core/arch/arm/include/arm32.h
-@@ -2,6 +2,7 @@
- /*
-  * Copyright (c) 2016, Linaro Limited
-  * Copyright (c) 2014, STMicroelectronics International N.V.
-+ * Copyright (c) 2026, Arm Limited
-  */
-=20
- #ifndef __ARM32_H
-@@ -165,7 +166,7 @@
-=20
- #ifndef __ASSEMBLER__
- #include <generated/arm32_sysreg.h>
--#ifdef CFG_ARM_GICV3
-+#ifdef _CFG_ARM_V3_OR_V4
- #include <generated/arm32_gicv3_sysreg.h>
- #endif
-=20
-diff --git a/core/arch/arm/include/arm32_macros.S b/core/arch/arm/includ=
e/arm32_macros.S
-index 95077a075..9db4722dd 100644
---- a/core/arch/arm/include/arm32_macros.S
-+++ b/core/arch/arm/include/arm32_macros.S
-@@ -1,10 +1,11 @@
- /* SPDX-License-Identifier: BSD-2-Clause */
- /*
-  * Copyright (c) 2014, STMicroelectronics International N.V.
-+ * Copyright (c) 2026, Arm Limited
-  */
-=20
- #include <generated/arm32_sysreg.S>
--#ifdef CFG_ARM_GICV3
-+#ifdef _CFG_ARM_V3_OR_V4
- #include <generated/arm32_gicv3_sysreg.S>
- #endif
-=20
-diff --git a/core/arch/arm/kernel/sub.mk b/core/arch/arm/kernel/sub.mk
-index 40b7a3f92..071f223a5 100644
---- a/core/arch/arm/kernel/sub.mk
-+++ b/core/arch/arm/kernel/sub.mk
-@@ -69,7 +69,7 @@ asm-defines-y +=3D asm-defines.c
- #     <asm.h> includes <generated/arm32_sysreg.h>
- #                  and <generated/arm32_gicv3_sysreg.h> (optional)
- asm-defines-asm-defines.c-deps +=3D $(out-dir)/core/include/generated/a=
rm32_sysreg.h
--ifeq ($(CFG_ARM_GICV3),y)
-+ifeq ($(_CFG_ARM_V3_OR_V4),y)
- asm-defines-asm-defines.c-deps +=3D $(out-dir)/core/include/generated/a=
rm32_gicv3_sysreg.h
- endif
-=20
-diff --git a/core/arch/arm/plat-corstone1000/main.c b/core/arch/arm/plat=
-corstone1000/main.c
-index 376d9c9c6..e1bedddfe 100644
---- a/core/arch/arm/plat-corstone1000/main.c
-+++ b/core/arch/arm/plat-corstone1000/main.c
-@@ -1,6 +1,6 @@
- // SPDX-License-Identifier: BSD-2-Clause
- /*
-- * Copyright (c) 2022, 2025, Arm Limited
-+ * Copyright (c) 2022, 2025-2026, Arm Limited
-  */
-=20
- #include <console.h>
-@@ -19,15 +19,16 @@ register_ddr(DRAM0_BASE, DRAM0_SIZE);
- register_phys_mem_pgdir(MEM_AREA_IO_SEC, CONSOLE_UART_BASE, PL011_REG_S=
IZE);
- register_phys_mem_pgdir(MEM_AREA_IO_SEC, GICD_BASE, GIC_DIST_REG_SIZE);
-=20
--#ifdef CFG_ARM_GICV3
--register_phys_mem_pgdir(MEM_AREA_IO_SEC, GICR_BASE, GIC_REDIST_REG_SIZE=
);
-+#ifdef _CFG_ARM_V3_OR_V4
-+register_phys_mem_pgdir(MEM_AREA_IO_SEC, GICR_BASE,
-+			GIC_REDIST_REG_SIZE * CFG_TEE_CORE_NB_CORE);
- #else
- register_phys_mem_pgdir(MEM_AREA_IO_SEC, GICC_BASE, GIC_CPU_REG_SIZE);
- #endif
-=20
- void boot_primary_init_intc(void)
- {
--#ifdef CFG_ARM_GICV3
-+#ifdef _CFG_ARM_V3_OR_V4
- 	gic_init_v3(0, GICD_BASE, GICR_BASE);
- #else
- 	gic_init(GICC_BASE, GICD_BASE);
-diff --git a/core/arch/arm/plat-corstone1000/platform_config.h b/core/ar=
ch/arm/plat-corstone1000/platform_config.h
-index 7a1af3e4c..98dac8ee0 100644
---- a/core/arch/arm/plat-corstone1000/platform_config.h
-+++ b/core/arch/arm/plat-corstone1000/platform_config.h
-@@ -1,6 +1,6 @@
- /* SPDX-License-Identifier: BSD-2-Clause */
- /*
-- * Copyright (c) 2022, 2025 Arm Limited
-+ * Copyright (c) 2022, 2025-2026 Arm Limited
-  */
-=20
- #ifndef PLATFORM_CONFIG_H
-@@ -20,13 +20,7 @@
- #define DRAM0_BASE		0x80000000
- #define DRAM0_SIZE		CFG_DDR_SIZE
-=20
--#ifdef CFG_ARM_GICV3
--#define GICR_SIZE_PER_CORE	0x20000
--#define GIC_REDIST_REG_SIZE	(GICR_SIZE_PER_CORE * CFG_TEE_CORE_NB_CORE)
--#endif
--
--#ifdef CFG_ARM_GICV3
--/* Corstone-1000 with Cortex-A320 uses GIC-v3 which supports GICR */
-+#ifdef _CFG_ARM_V3_OR_V4
- #define GICD_OFFSET		0x00000
- #define GICR_OFFSET		0x40000
- #else
-@@ -34,7 +28,7 @@
- #define GICC_OFFSET		0x2F000
- #endif
-=20
--#ifdef CFG_ARM_GICV3
-+#ifdef _CFG_ARM_V3_OR_V4
- #define GICR_BASE		(GIC_BASE + GICR_OFFSET)
- #else
- #define GICC_BASE		(GIC_BASE + GICC_OFFSET)
-diff --git a/core/drivers/gic.c b/core/drivers/gic.c
-index be0193416..af7783d32 100644
---- a/core/drivers/gic.c
-+++ b/core/drivers/gic.c
-@@ -2,6 +2,7 @@
- /*
-  * Copyright (c) 2016-2017, 2023-2024 Linaro Limited
-  * Copyright (c) 2014, STMicroelectronics International N.V.
-+ * Copyright (c) 2026 Arm Limited
-  */
-=20
- #include <arm.h>
-@@ -49,7 +50,7 @@
- #define GICD_IGROUPMODR(n)	(0xd00 + (n) * 4)
- #define GICD_SGIR		(0xF00)
-=20
--#ifdef CFG_ARM_GICV3
-+#ifdef _CFG_ARM_V3_OR_V4
- #define GICD_PIDR2		(0xFFE8)
- #else
- /* Called ICPIDR2 in GICv2 specification */
-@@ -63,22 +64,29 @@
- #define GICD_CTLR_ARE_NS	BIT32(5)
-=20
- /* Offsets from gic.gicr_base[core_pos] */
--#define GICR_V3_PCPUBASE_SIZE	(2 * 64 * 1024)
--#define GICR_SGI_BASE_OFFSET	(64 * 1024)
--#define GICR_CTLR		(0x00)
--#define GICR_TYPER		(0x08)
-+#define GICR_RD_BASE_OFFSET         (0x0000)
-+#define GICR_SGI_BASE_OFFSET        (GICR_RD_BASE_OFFSET + GICR_FRAME_S=
IZE)
-+#define GICR_VLPI_BASE_OFFSET       (GICR_SGI_BASE_OFFSET + GICR_FRAME_=
SIZE)
-+#define GICR_RESERVED_BASE_OFFSET   (GICR_VLPI_BASE_OFFSET + GICR_FRAME=
_SIZE)
-=20
-+/* GIC physical LPI Redistributor register map */
-+#define GICR_CTLR		(GICR_RD_BASE_OFFSET + 0x0000)
-+#define GICR_TYPER		(GICR_RD_BASE_OFFSET + 0x0008)
-+
-+/* GIC SGI and PPI Redistributor register map */
- #define GICR_IGROUPR0		(GICR_SGI_BASE_OFFSET + 0x080)
--#define GICR_IGRPMODR0		(GICR_SGI_BASE_OFFSET + 0xD00)
-+#define GICR_ISENABLER0		(GICR_SGI_BASE_OFFSET + 0x100)
- #define GICR_ICENABLER0		(GICR_SGI_BASE_OFFSET + 0x180)
- #define GICR_ICPENDR0		(GICR_SGI_BASE_OFFSET + 0x280)
--#define GICR_ISENABLER0		(GICR_SGI_BASE_OFFSET + 0x100)
-+#define GICR_IPRIORITYR(n)	(GICR_SGI_BASE_OFFSET + 0x400 + (n) * 4)
- #define GICR_ICFGR0		(GICR_SGI_BASE_OFFSET + 0xC00)
- #define GICR_ICFGR1		(GICR_SGI_BASE_OFFSET + 0xC04)
--#define GICR_IPRIORITYR(n)	(GICR_SGI_BASE_OFFSET + 0x400 + (n) * 4)
-+#define GICR_IGRPMODR0		(GICR_SGI_BASE_OFFSET + 0xD00)
-=20
-+/* GICR_CTLR, Redistributor Control Register bits */
- #define GICR_CTLR_RWP		BIT32(3)
-=20
-+/* GICR_TYPER, Redistributor Type Register bits */
- #define GICR_TYPER_LAST		BIT64(4)
- #define GICR_TYPER_AFF3_SHIFT	56
- #define GICR_TYPER_AFF2_SHIFT	48
-@@ -136,7 +144,7 @@
- struct gic_data {
- 	vaddr_t gicc_base;
- 	vaddr_t gicd_base;
--#if defined(CFG_ARM_GICV3)
-+#ifdef _CFG_ARM_V3_OR_V4
- 	vaddr_t gicr_base[CFG_TEE_CORE_NB_CORE];
- #endif
- 	size_t max_it;
-@@ -174,7 +182,7 @@ DECLARE_KEEP_PAGER(gic_ops);
-=20
- static vaddr_t __maybe_unused get_gicr_base(struct gic_data *gd __maybe=
_unused)
- {
--#if defined(CFG_ARM_GICV3)
-+#ifdef _CFG_ARM_V3_OR_V4
- 	return gd->gicr_base[get_core_pos()];
- #else
- 	return 0;
-@@ -183,7 +191,7 @@ static vaddr_t __maybe_unused get_gicr_base(struct g=
ic_data *gd __maybe_unused)
-=20
- static bool affinity_routing_is_enabled(struct gic_data *gd)
- {
--	return IS_ENABLED(CFG_ARM_GICV3) &&
-+	return IS_ENABLED2(_CFG_ARM_V3_OR_V4) &&
- 	       io_read32(gd->gicd_base + GICD_CTLR) & GICD_CTLR_ARE_S;
- }
-=20
-@@ -198,7 +206,7 @@ static size_t probe_max_it(vaddr_t gicc_base __maybe=
_unused, vaddr_t gicd_base)
- 	/*
- 	 * Probe which interrupt number is the largest.
- 	 */
--#if defined(CFG_ARM_GICV3)
-+#ifdef _CFG_ARM_V3_OR_V4
- 	old_ctlr =3D read_icc_ctlr();
- 	write_icc_ctlr(0);
- #else
-@@ -222,7 +230,7 @@ static size_t probe_max_it(vaddr_t gicc_base __maybe=
_unused, vaddr_t gicd_base)
- 		}
- 	}
- out:
--#if defined(CFG_ARM_GICV3)
-+#ifdef _CFG_ARM_V3_OR_V4
- 	write_icc_ctlr(old_ctlr);
- #else
- 	io_write32(gicc_base + GICC_CTLR, old_ctlr);
-@@ -342,7 +350,7 @@ static void init_gic_per_cpu(struct gic_data *gd)
- 	 * Set the priority mask to permit Non-secure interrupts, and to
- 	 * allow the Non-secure world to adjust the priority mask itself
- 	 */
--#if defined(CFG_ARM_GICV3)
-+#ifdef _CFG_ARM_V3_OR_V4
- 	write_icc_pmr(0x80);
- 	write_icc_igrpen1(1);
- #else
-@@ -359,7 +367,7 @@ void gic_init_per_cpu(void)
- {
- 	struct gic_data *gd =3D &gic_data;
-=20
--#if defined(CFG_ARM_GICV3)
-+#ifdef _CFG_ARM_V3_OR_V4
- 	assert(gd->gicd_base);
- #else
- 	assert(gd->gicd_base && gd->gicc_base);
-@@ -481,7 +489,7 @@ static int gic_dt_get_irq(const uint32_t *properties=
, int count, uint32_t *type,
- static void __maybe_unused probe_redist_base_addrs(vaddr_t *gicr_base_a=
ddrs,
- 						   paddr_t gicr_base_pa)
- {
--	size_t sz =3D GICR_V3_PCPUBASE_SIZE;
-+	size_t sz =3D GIC_REDIST_REG_SIZE;
- 	paddr_t pa =3D gicr_base_pa;
- 	size_t core_pos =3D 0;
- 	uint64_t mt_bit =3D 0;
-@@ -538,7 +546,7 @@ static void gic_init_base_addr(paddr_t gicc_base_pa,=
 paddr_t gicd_base_pa,
- 	vers >>=3D GICD_PIDR2_ARCHREV_SHIFT;
- 	vers &=3D GICD_PIDR2_ARCHREV_MASK;
-=20
--	if (IS_ENABLED(CFG_ARM_GICV3)) {
-+	if (IS_ENABLED2(_CFG_ARM_V3_OR_V4)) {
- 		assert(vers =3D=3D 4 || vers =3D=3D 3);
- 	} else {
- 		assert(vers =3D=3D 2 || vers =3D=3D 1);
-@@ -551,7 +559,7 @@ static void gic_init_base_addr(paddr_t gicc_base_pa,=
 paddr_t gicd_base_pa,
- 	gd->gicc_base =3D gicc_base;
- 	gd->gicd_base =3D gicd_base;
- 	gd->max_it =3D probe_max_it(gicc_base, gicd_base);
--#if defined(CFG_ARM_GICV3)
-+#ifdef _CFG_ARM_V3_OR_V4
- 	if (affinity_routing_is_enabled(gd) && gicr_base_pa)
- 		probe_redist_base_addrs(gd->gicr_base, gicr_base_pa);
- #endif
-@@ -623,7 +631,7 @@ void gic_init_v3(paddr_t gicc_base_pa, paddr_t gicd_=
base_pa,
- 	/* Set the priority mask to permit Non-secure interrupts, and to
- 	 * allow the Non-secure world to adjust the priority mask itself
- 	 */
--#if defined(CFG_ARM_GICV3)
-+#ifdef _CFG_ARM_V3_OR_V4
- 	write_icc_pmr(0x80);
- 	write_icc_igrpen1(1);
- 	io_setbits32(gd->gicd_base + GICD_CTLR, GICD_CTLR_ENABLEGRP1S);
-@@ -654,7 +662,7 @@ static void gic_it_configure(struct gic_data *gd, si=
ze_t it)
- 	io_write32(gd->gicd_base + GICD_ICPENDR(idx), mask);
- 	/* Assign it to group0 */
- 	io_clrbits32(gd->gicd_base + GICD_IGROUPR(idx), mask);
--#if defined(CFG_ARM_GICV3)
-+#ifdef _CFG_ARM_V3_OR_V4
- 	/* Assign it to group1S */
- 	io_setbits32(gd->gicd_base + GICD_IGROUPMODR(idx), mask);
- #endif
-@@ -776,7 +784,7 @@ static void assert_cpu_mask_is_valid(uint32_t cpu_ma=
sk)
- static void gic_it_raise_sgi(struct gic_data *gd __maybe_unused, size_t=
 it,
- 			     uint32_t cpu_mask, bool ns)
- {
--#if defined(CFG_ARM_GICV3)
-+#ifdef _CFG_ARM_V3_OR_V4
- 	uint32_t mask_id =3D it & 0xf;
- 	uint64_t mask =3D SHIFT_U64(mask_id, 24);
-=20
-@@ -841,7 +849,7 @@ static uint32_t gic_read_iar(struct gic_data *gd __m=
aybe_unused)
- {
- 	assert(gd =3D=3D &gic_data);
-=20
--#if defined(CFG_ARM_GICV3)
-+#ifdef _CFG_ARM_V3_OR_V4
- 	return read_icc_iar1();
- #else
- 	return io_read32(gd->gicc_base + GICC_IAR);
-@@ -852,7 +860,7 @@ static void gic_write_eoir(struct gic_data *gd __may=
be_unused, uint32_t eoir)
- {
- 	assert(gd =3D=3D &gic_data);
-=20
--#if defined(CFG_ARM_GICV3)
-+#ifdef _CFG_ARM_V3_OR_V4
- 	write_icc_eoir1(eoir);
- #else
- 	io_write32(gd->gicc_base + GICC_EOIR, eoir);
-@@ -894,7 +902,7 @@ void gic_dump_state(void)
- 	struct gic_data *gd =3D &gic_data;
- 	int i =3D 0;
-=20
--#if defined(CFG_ARM_GICV3)
-+#ifdef _CFG_ARM_V3_OR_V4
- 	DMSG("GICC_CTLR: %#"PRIx32, read_icc_ctlr());
- #else
- 	DMSG("GICC_CTLR: %#"PRIx32, io_read32(gd->gicc_base + GICC_CTLR));
-@@ -932,7 +940,7 @@ TEE_Result gic_spi_release_to_ns(size_t it)
- 	io_write32(gd->gicd_base + GICD_ICPENDR(idx), mask);
- 	/* Assign it to NS Group1 */
- 	io_setbits32(gd->gicd_base + GICD_IGROUPR(idx), mask);
--#if defined(CFG_ARM_GICV3)
-+#ifdef _CFG_ARM_V3_OR_V4
- 	io_clrbits32(gd->gicd_base + GICD_IGROUPMODR(idx), mask);
- #endif
- 	mutex_unlock(&gic_mutex);
-diff --git a/core/include/drivers/gic.h b/core/include/drivers/gic.h
-index 0dfcca7e1..a17dbac0c 100644
---- a/core/include/drivers/gic.h
-+++ b/core/include/drivers/gic.h
-@@ -2,6 +2,7 @@
- /*
-  * Copyright (c) 2016, Linaro Limited
-  * Copyright (c) 2014, STMicroelectronics International N.V.
-+ * Copyright (c) 2026 Arm Limited
-  */
-=20
- #ifndef __DRIVERS_GIC_H
-@@ -9,12 +10,45 @@
- #include <types_ext.h>
- #include <kernel/interrupt.h>
-=20
--#if defined(CFG_ARM_GICV3)
--#define GIC_DIST_REG_SIZE	0x10000
--#define GIC_CPU_REG_SIZE	0x10000
--#else
--#define GIC_DIST_REG_SIZE	0x1000
--#define GIC_CPU_REG_SIZE	0x1000
-+#ifdef _CFG_ARM_V3_OR_V4
-+#define GICD_FRAME_SIZE         (64 * 1024)
-+#define GICC_FRAME_SIZE         (64 * 1024)
-+#define GICR_FRAME_SIZE         (64 * 1024)
-+#else /* GICv2 and earlier */
-+#define GICD_FRAME_SIZE         (4 * 1024)
-+#define GICC_FRAME_SIZE         (4 * 1024)
-+#define GICR_FRAME_SIZE         0 /* Unsupported */
-+#endif
-+
-+#define GIC_CPU_REG_SIZE        GICC_FRAME_SIZE
-+#define GIC_DIST_REG_SIZE       GICD_FRAME_SIZE
-+#ifdef _CFG_ARM_V3_OR_V4
-+/*
-+ * The frames for each Redistributor are contiguous and are ordered as
-+ * follows:
-+ * 1. RD_base
-+ * 2. SGI_base
-+ *
-+ * In GICv4, there are two additional 64KB frames:
-+ * - A frame to control virtual LPIs. The base address of this frame is
-+ *   referred to as VLPI_base.
-+ * - A reserved frame.
-+ *
-+ * The frames for each Redistributor are contiguous and are
-+ * ordered as follows:
-+ *   1. RD_base
-+ *   2. SGI_base
-+ *   3. VLPI_base
-+ *   4. Reserved
-+ */
-+#ifdef CFG_ARM_GICV4
-+#define GICR_FRAME_COUNT        4
-+#else /* CFG_ARM_GICV3 */
-+#define GICR_FRAME_COUNT        2
-+#endif
-+#define GIC_REDIST_REG_SIZE     (GICR_FRAME_COUNT * GICR_FRAME_SIZE)
-+#else /* GICv2 and earlier */
-+#define GIC_REDIST_REG_SIZE     0 /* Unsupported */
- #endif
-=20
- #define GIC_PPI_BASE		U(16)
---=20
-2.50.1
-
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1=
000/0003-plat-corstone1000-Swap-GIC-600-for-GIC-700-for-Corte.patch b/met=
a-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0003-plat-co=
rstone1000-Swap-GIC-600-for-GIC-700-for-Corte.patch
deleted file mode 100644
index 0ff3bf0a..00000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/000=
3-plat-corstone1000-Swap-GIC-600-for-GIC-700-for-Corte.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From b3d2c75ef21e5c4baa957839ef44c6f32e8e2626 Mon Sep 17 00:00:00 2001
-From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
-Date: Thu, 15 Jan 2026 19:10:32 +0000
-Subject: [PATCH 3/3] plat-corstone1000: swap GIC-600 for GIC-700 for
- Cortex-A320 variant
-
-Switch the Cortex-A320 variant to use GIC-700 instead of GIC-600.
-GIC-700 implements the Arm GICv4.1 architecture, so enable the
-CFG_ARM_GICV4 compiler definition for the Corstone-1000 platform.
-
-Upstream-Status: Submitted [https://github.com/OP-TEE/optee_os/pull/7682=
]
-Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
-Reviewed-by: Jerome Forissier <jerome.forissier@arm.com>
-Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
----
- core/arch/arm/plat-corstone1000/conf.mk | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/core/arch/arm/plat-corstone1000/conf.mk b/core/arch/arm/pla=
t-corstone1000/conf.mk
-index e929d8233..eabad7739 100644
---- a/core/arch/arm/plat-corstone1000/conf.mk
-+++ b/core/arch/arm/plat-corstone1000/conf.mk
-@@ -34,8 +34,8 @@ CFG_DT_ADDR ?=3D 0x82100000
- CFG_DTB_MAX_SIZE ?=3D 0x100000
- CFG_CORE_HEAP_SIZE ?=3D 131072
-=20
--# Corstone-1000 with Cortex-A320 uses GIC-600 which supports
--# the GICv3 architecture
-+# Corstone-1000 with Cortex-A320 uses GIC-700 which supports
-+# the GICv3, GICv3.1, and GICv4.1 architectures
- ifeq ($(arm64-platform-cpuarch),cortex-a320)
--$(call force,CFG_ARM_GICV3,y)
-+CFG_ARM_GICV4 ?=3D y
- endif
---=20
-2.50.1
-
diff --git a/meta-arm-bsp/recipes-security/optee/optee-client_4.9.0.bb b/=
meta-arm-bsp/recipes-security/optee/optee-client_4.9.0.bb
deleted file mode 100644
index b5c3f0a2..00000000
--- a/meta-arm-bsp/recipes-security/optee/optee-client_4.9.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require recipes-security/optee/optee-client.inc
-
-# v4.9.0
-SRCREV =3D "9f5e90918093c1d1cd264d8149081b64ab7ba672"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-examples_4.9.0.bb =
b/meta-arm-bsp/recipes-security/optee/optee-examples_4.9.0.bb
deleted file mode 100644
index 7c9bd972..00000000
--- a/meta-arm-bsp/recipes-security/optee/optee-examples_4.9.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require recipes-security/optee/optee-examples.inc
-
-# v4.9.0
-SRCREV =3D "934c7edb74a26e90f68024cf441073528444177f"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-co=
mmon.inc b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-comm=
on.inc
index 4a90ca3e..1d98a31a 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.in=
c
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.in=
c
@@ -1,11 +1,3 @@
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/optee-os/corstone1000:"
-
-SRC_URI:append =3D " \
-        file://0001-plat-corstone1000-Specify-GIC-version-in-plat-specif=
.patch \
-        file://0002-gic-Refactor-implementation-of-GICv3-to-add-GICv4-su=
.patch \
-        file://0003-plat-corstone1000-Swap-GIC-600-for-GIC-700-for-Corte=
.patch \
-"
-
 COMPATIBLE_MACHINE =3D "corstone1000"
=20
 OPTEEMACHINE =3D "corstone1000"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_4.9.0.=
bb b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_4.9.0.bb
deleted file mode 100644
index cca9f62a..00000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_4.9.0.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-require recipes-security/optee/optee-os_${PV}.bb
-
-SUMMARY =3D "OP-TEE Trusted OS TA devkit"
-DESCRIPTION =3D "OP-TEE TA devkit for build TAs"
-HOMEPAGE =3D "https://www.op-tee.org/"
-
-DEPENDS +=3D "python3-pycryptodome-native"
-DEPENDS:append:toolchain-clang =3D " lld-native"
-
-do_install() {
-    #install TA devkit
-    install -d ${D}${includedir}/optee/export-user_ta/
-    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
-        cp -aR $f ${D}${includedir}/optee/export-user_ta/
-    done
-}
-
-do_deploy() {
-	echo "Do not inherit do_deploy from optee-os."
-}
-
-FILES:${PN} =3D "${includedir}/optee/"
-
-# Build paths are currently embedded
-INSANE_SKIP:${PN}-dev +=3D "buildpaths"
-
-# Include extra headers needed by SPMC tests to TA DEVKIT.
-# Supported after op-tee v3.20
-EXTRA_OEMAKE:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee=
-spmc-test', \
-                                        ' CFG_SPMC_TESTS=3Dy', '' , d)}"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_4.9.0.bb b/meta=
-arm-bsp/recipes-security/optee/optee-os_4.9.0.bb
deleted file mode 100644
index cd369382..00000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os_4.9.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require recipes-security/optee/optee-os.inc
-
-DEPENDS +=3D "dtc-native"
-
-# 4.9.0
-SRCREV =3D "c2b0684fcd89929976a8726e6e3af922b48dd2c7"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test_4.9.0.bb b/me=
ta-arm-bsp/recipes-security/optee/optee-test_4.9.0.bb
deleted file mode 100644
index 2cd5fc5c..00000000
--- a/meta-arm-bsp/recipes-security/optee/optee-test_4.9.0.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require recipes-security/optee/optee-test.inc
-
-# v4.9.0
-SRCREV =3D "b27648ea8472cceceb8dda368a965c709066f7aa"
-
-LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Da8fa504109e4cd7ea575bc49ea=
4be560 \
-                    file://LICENSE-BSD;md5=3Ddca16d6efa93b55d0fd662ae5cd=
6feeb \
-                    file://LICENSE-GPL;md5=3D10e86b5d2a6cb0e2b9dcfdd26a9=
ac58d \
-                   "
-
-# Include ffa_spmc test group if the SPMC test is enabled.
-# Supported after op-tee v3.20
-EXTRA_OEMAKE:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee=
-spmc-test', \
-                                        ' CFG_SPMC_TESTS=3Dy CFG_SECURE_=
PARTITION=3Dy', '' , d)}"
-
-RDEPENDS:${PN} +=3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee-spm=
c-test', \
-                                              ' arm-ffa-user', '' , d)}"

