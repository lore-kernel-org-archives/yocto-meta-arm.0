Return-Path: <davidson.kumaresan@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0445C32771
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 14:54:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.8981.1664376849795591906
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 28 Sep 2022 07:54:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: davidson.kumaresan@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0800323A;
	Wed, 28 Sep 2022 07:54:16 -0700 (PDT)
Received: from usa.arm.com (unknown [10.162.16.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ADB8B3F73D;
	Wed, 28 Sep 2022 07:54:07 -0700 (PDT)
From: Davidson K <davidson.kumaresan@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Davidson K <davidson.kumaresan@arm.com>
Subject: [PATCH 2/2] arm-bsp/trusted-firmware-a: add firmware update support
 for TC
Date: Wed, 28 Sep 2022 20:23:46 +0530
Message-Id: <20220928145346.48077-2-davidson.kumaresan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220928145346.48077-1-davidson.kumaresan@arm.com>
References: <20220928145346.48077-1-davidson.kumaresan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 28 Sep 2022 14:54:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3862

Signed-off-by: Davidson K <davidson.kumaresan@arm.com>
Change-Id: Ice2396de4705ed7859c2334678170ef7f17e4709
---
 ...add-firmware-update-secure-partition.patch |   63 +
 ...erve-4-MB-for-stmm-communication-use.patch |   35 +
 .../trusted-firmware-a-tc.inc                 |    2 +
 ...ntroducing-Arm-FF-A-low-level-driver.patch | 2611 +++++++++++++++++
 .../0003-arm-total_compute-enable-psci.patch  |   30 +
 ...ffa-rxtx_map-should-use-64-bit-calls.patch |   37 +
 ...-new-fmp-driver-that-supports-arm-fw.patch |  993 +++++++
 ...-total_compute-enable-capsule-update.patch |   70 +
 ...ap-rxtx-buffer-before-exiting-u-boot.patch |   51 +
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |    6 +
 10 files changed, 3898 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/=
0008-feat-plat-tc-add-firmware-update-secure-partition.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/=
0009-feat-plat-tc-reserve-4-MB-for-stmm-communication-use.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/tc/0002-arm_ff=
a-introducing-Arm-FF-A-low-level-driver.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/tc/0003-arm-to=
tal_compute-enable-psci.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/tc/0004-arm_ff=
a-rxtx_map-should-use-64-bit-calls.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/tc/0005-efi_fi=
rmware-add-new-fmp-driver-that-supports-arm-fw.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/tc/0006-arm-to=
tal_compute-enable-capsule-update.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/tc/0007-arm_ff=
a-unmap-rxtx-buffer-before-exiting-u-boot.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0008-fe=
at-plat-tc-add-firmware-update-secure-partition.patch b/meta-arm-bsp/reci=
pes-bsp/trusted-firmware-a/files/tc/0008-feat-plat-tc-add-firmware-update=
-secure-partition.patch
new file mode 100644
index 00000000..d36d9591
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0008-feat-plat=
-tc-add-firmware-update-secure-partition.patch
@@ -0,0 +1,63 @@
+From 16f183e3c09d64fee92638ea9d0017ac7973ddf8 Mon Sep 17 00:00:00 2001
+From: Tudor Cretu <tudor.cretu@arm.com>
+Date: Fri, 24 Sep 2021 12:09:53 +0000
+Subject: [PATCH 1/2] feat(plat/tc): add firmware update secure partition
+
+Firmware update is a trusted service secure partition that implements
+the PSA firmware update specification. It executes in the secure world
+in total compute platform.
+
+Signed-off-by: Davidson K <davidson.kumaresan@arm.com>
+Signed-off-by: Tudor Cretu <tudor.cretu@arm.com>
+Change-Id: I6223d247b078de8c03b068185bf120b3d502f500
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ plat/arm/board/tc/fdts/tc_spmc_optee_sp_manifest.dts | 9 ++++++++-
+ plat/arm/board/tc/fdts/tc_tb_fw_config.dts           | 4 ++++
+ 2 files changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/plat/arm/board/tc/fdts/tc_spmc_optee_sp_manifest.dts b/plat=
/arm/board/tc/fdts/tc_spmc_optee_sp_manifest.dts
+index 92e2ddda6..23ad06888 100644
+--- a/plat/arm/board/tc/fdts/tc_spmc_optee_sp_manifest.dts
++++ b/plat/arm/board/tc/fdts/tc_spmc_optee_sp_manifest.dts
+@@ -28,7 +28,7 @@
+ 			load_address =3D <0xfd280000>;
+ 			vcpu_count =3D <8>;
+ #ifdef TS_SP_FW_CONFIG
+-			mem_size =3D <26738688>; /* 25MB TZC DRAM */
++			mem_size =3D <20447232>; /* 19MB TZC DRAM */
+ #else
+ 			mem_size =3D <30928896>; /* 29MB TZC DRAM */
+ #endif
+@@ -48,6 +48,13 @@
+ 			vcpu_count =3D <1>;
+ 			mem_size =3D <2097152>; /* 2MB TZC DRAM */
+ 		};
++		vm4 {
++			is_ffa_partition;
++			debug_name =3D "firmware-update";
++			load_address =3D <0xfe600000>;
++			vcpu_count =3D <1>;
++			mem_size =3D <6291456>; /* 6MB TZC DRAM */
++		};
+ #endif
+ 	};
+=20
+diff --git a/plat/arm/board/tc/fdts/tc_tb_fw_config.dts b/plat/arm/board=
/tc/fdts/tc_tb_fw_config.dts
+index a5bb520fe..2c640b363 100644
+--- a/plat/arm/board/tc/fdts/tc_tb_fw_config.dts
++++ b/plat/arm/board/tc/fdts/tc_tb_fw_config.dts
+@@ -41,6 +41,10 @@
+ 		       uuid =3D "d9df52d5-16a2-4bb2-9aa4-d26d3b84e8c0";
+ 		       load-address =3D <0xfec00000>;
+ 		};
++		firmware-update {
++		       uuid =3D "6823a838-1b06-470e-9774-0cce8bfb53fd";
++		       load-address =3D <0xfe600000>;
++		};
+ #endif
+ #if OPTEE_SP_FW_CONFIG
+ 		op-tee {
+--=20
+2.34.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0009-fe=
at-plat-tc-reserve-4-MB-for-stmm-communication-use.patch b/meta-arm-bsp/r=
ecipes-bsp/trusted-firmware-a/files/tc/0009-feat-plat-tc-reserve-4-MB-for=
-stmm-communication-use.patch
new file mode 100644
index 00000000..f20f9480
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0009-feat-plat=
-tc-reserve-4-MB-for-stmm-communication-use.patch
@@ -0,0 +1,35 @@
+From a8cdd6c67d26c15642338a45279db5e39cf4e565 Mon Sep 17 00:00:00 2001
+From: Davidson K <davidson.kumaresan@arm.com>
+Date: Fri, 3 Jun 2022 18:16:31 +0530
+Subject: [PATCH 2/2] feat(plat/tc): reserve 4 MB for stmm communication =
used
+ for firmware update
+
+The firmware update secure partition and u-boot communicates using
+the stmm communication layer and it needs a dedicated memory region.
+
+Signed-off-by: Davidson K <davidson.kumaresan@arm.com>
+Change-Id: I8d4da5c26843d225983dcaee0757694a6d43234c
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ fdts/tc.dts | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/fdts/tc.dts b/fdts/tc.dts
+index dc86958bf..cb504c4a2 100644
+--- a/fdts/tc.dts
++++ b/fdts/tc.dts
+@@ -217,6 +217,11 @@
+ 			reg =3D <0x00000000 0xf8e00000 0 0x00200000>;
+ 			no-map;
+ 		};
++
++		fwu_mm@0xfca00000 {
++			reg =3D <0x00000000 0xfca00000 0 0x00400000>;
++			no-map;
++		};
+ 	};
+=20
+ 	psci {
+--=20
+2.34.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-tc.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-=
a-tc.inc
index ee316418..301f97c8 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.i=
nc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.i=
nc
@@ -15,6 +15,8 @@ SRC_URI:append =3D " \
     file://0005-feat-plat-tc-add-spmc-manifest-with-trusty-sp.patch \
     file://0006-feat-plat-tc-update-dts-with-trusty-compatible-strin.pat=
ch \
     file://0007-feat-arm-tc-Update-trusty-load-address-in-dts-files.patc=
h \
+    file://0008-feat-plat-tc-add-firmware-update-secure-partition.patch =
\
+    file://0009-feat-plat-tc-reserve-4-MB-for-stmm-communication-use.pat=
ch \
     file://generate_metadata.py \
     "
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/tc/0002-arm_ffa-intro=
ducing-Arm-FF-A-low-level-driver.patch b/meta-arm-bsp/recipes-bsp/u-boot/=
u-boot/tc/0002-arm_ffa-introducing-Arm-FF-A-low-level-driver.patch
new file mode 100644
index 00000000..77498581
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/tc/0002-arm_ffa-introducing-=
Arm-FF-A-low-level-driver.patch
@@ -0,0 +1,2611 @@
+From 42fd69fb5ec0c441b3d31ec544ed03bedab28d45 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Tue, 16 Nov 2021 12:34:52 +0000
+Subject: [PATCH 2/7] arm_ffa: introducing Arm FF-A low-level driver
+
+This driver implements Arm Firmware Framework for Armv8-A on u-boot
+
+The Firmware Framework for Arm A-profile processors (FF-A)
+describes interfaces (ABIs) that standardize communication
+between the Secure World and Normal World leveraging TrustZone
+technology.
+
+This driver is based on FF-A specification v1.0 and uses SMC32
+calling convention.
+
+FF-A specification:
+
+https://developer.arm.com/documentation/den0077/a/?lang=3Den
+
+The driver provides helper FF-A interfaces for user layers.
+These helper functions allow clients to pass data and select the
+FF-A function to use for the communication with secure world.
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Upstream-Status: Submitted [https://patchwork.ozlabs.org/project/uboot/p=
atch/20220801172053.20163-4-abdellatif.elkhlifi@arm.com/]
+---
+ MAINTAINERS                      |    8 +
+ arch/arm/cpu/armv8/smccc-call.S  |   27 +
+ arch/arm/lib/asm-offsets.c       |    6 +
+ common/board_r.c                 |    6 +
+ drivers/Kconfig                  |    2 +
+ drivers/Makefile                 |    1 +
+ drivers/arm-ffa/Kconfig          |   26 +
+ drivers/arm-ffa/Makefile         |    3 +
+ drivers/arm-ffa/arm-ffa-uclass.c |   67 ++
+ drivers/arm-ffa/arm_ffa_prv.h    |  199 ++++
+ drivers/arm-ffa/core.c           | 1484 ++++++++++++++++++++++++++++++
+ include/arm_ffa.h                |  191 ++++
+ include/arm_ffa_helper.h         |   45 +
+ include/dm/uclass-id.h           |    1 +
+ include/linux/arm-smccc.h        |   28 +-
+ lib/Kconfig                      |    1 +
+ lib/Makefile                     |    1 +
+ lib/arm-ffa/Kconfig              |    6 +
+ lib/arm-ffa/Makefile             |    8 +
+ lib/arm-ffa/arm_ffa_helper.c     |  188 ++++
+ lib/efi_loader/efi_boottime.c    |   17 +
+ 21 files changed, 2314 insertions(+), 1 deletion(-)
+ create mode 100644 drivers/arm-ffa/Kconfig
+ create mode 100644 drivers/arm-ffa/Makefile
+ create mode 100644 drivers/arm-ffa/arm-ffa-uclass.c
+ create mode 100644 drivers/arm-ffa/arm_ffa_prv.h
+ create mode 100644 drivers/arm-ffa/core.c
+ create mode 100644 include/arm_ffa.h
+ create mode 100644 include/arm_ffa_helper.h
+ create mode 100644 lib/arm-ffa/Kconfig
+ create mode 100644 lib/arm-ffa/Makefile
+ create mode 100644 lib/arm-ffa/arm_ffa_helper.c
+
+diff --git a/MAINTAINERS b/MAINTAINERS
+index 96582fc677..14307e6da6 100644
+--- a/MAINTAINERS
++++ b/MAINTAINERS
+@@ -232,6 +232,14 @@ F:	board/CZ.NIC/
+ F:	configs/turris_*_defconfig
+ F:	include/configs/turris_*.h
+=20
++ARM FF-A
++M:	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++S:	Maintained
++F:	drivers/arm-ffa/
++F:	include/arm_ffa.h
++F:	include/arm_ffa_helper.h
++F:	lib/arm-ffa/
++
+ ARM FREESCALE IMX
+ M:	Stefano Babic <sbabic@denx.de>
+ M:	Fabio Estevam <festevam@gmail.com>
+diff --git a/arch/arm/cpu/armv8/smccc-call.S b/arch/arm/cpu/armv8/smccc-=
call.S
+index dc92b28777..ffc39c9fef 100644
+--- a/arch/arm/cpu/armv8/smccc-call.S
++++ b/arch/arm/cpu/armv8/smccc-call.S
+@@ -1,6 +1,8 @@
+ /* SPDX-License-Identifier: GPL-2.0 */
+ /*
+  * Copyright (c) 2015, Linaro Limited
++ * (C) Copyright 2021 ARM Limited
++ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+  */
+ #include <linux/linkage.h>
+ #include <linux/arm-smccc.h>
+@@ -45,3 +47,28 @@ ENDPROC(__arm_smccc_smc)
+ ENTRY(__arm_smccc_hvc)
+ 	SMCCC	hvc
+ ENDPROC(__arm_smccc_hvc)
++
++#if (IS_ENABLED(CONFIG_ARM_FFA_TRANSPORT))
++
++	.macro FFASMCCC instr
++	.cfi_startproc
++	\instr	#0
++	ldr	x9, [sp]
++	stp	x0, x1, [x9, #ARM_SMCCC_RES_X0_OFFS]
++	stp	x2, x3, [x9, #ARM_SMCCC_RES_X2_OFFS]
++	stp	x4, x5, [x9, #ARM_SMCCC_RES_X4_OFFS]
++	stp	x6, x7, [x9, #ARM_SMCCC_RES_X6_OFFS]
++	ret
++	.cfi_endproc
++	.endm
++
++/*
++ * void arm_ffa_smccc_smc(unsigned long a0, unsigned long a1, unsigned =
long a2,
++ *		  unsigned long a3, unsigned long a4, unsigned long a5,
++ *		  unsigned long a6, unsigned long a7, struct arm_smccc_res *res)
++ */
++ENTRY(__arm_ffa_smccc_smc)
++	FFASMCCC	smc
++ENDPROC(__arm_ffa_smccc_smc)
++
++#endif
+diff --git a/arch/arm/lib/asm-offsets.c b/arch/arm/lib/asm-offsets.c
+index 22fd541f9a..45eca83a47 100644
+--- a/arch/arm/lib/asm-offsets.c
++++ b/arch/arm/lib/asm-offsets.c
+@@ -9,6 +9,8 @@
+  * generate asm statements containing #defines,
+  * compile this file to assembler, and then extract the
+  * #defines from the assembly-language output.
++ *
++ * (C) Copyright 2021 ARM Limited
+  */
+=20
+ #include <common.h>
+@@ -115,6 +117,10 @@ int main(void)
+ #ifdef CONFIG_ARM_SMCCC
+ 	DEFINE(ARM_SMCCC_RES_X0_OFFS, offsetof(struct arm_smccc_res, a0));
+ 	DEFINE(ARM_SMCCC_RES_X2_OFFS, offsetof(struct arm_smccc_res, a2));
++#if (IS_ENABLED(CONFIG_ARM_FFA_TRANSPORT))
++	DEFINE(ARM_SMCCC_RES_X4_OFFS, offsetof(struct arm_smccc_res, a4));
++	DEFINE(ARM_SMCCC_RES_X6_OFFS, offsetof(struct arm_smccc_res, a6));
++#endif
+ 	DEFINE(ARM_SMCCC_QUIRK_ID_OFFS, offsetof(struct arm_smccc_quirk, id));
+ 	DEFINE(ARM_SMCCC_QUIRK_STATE_OFFS, offsetof(struct arm_smccc_quirk, st=
ate));
+ #endif
+diff --git a/common/board_r.c b/common/board_r.c
+index c24d9b4e22..af20f38b10 100644
+--- a/common/board_r.c
++++ b/common/board_r.c
+@@ -61,6 +61,9 @@
+ #include <wdt.h>
+ #include <asm-generic/gpio.h>
+ #include <efi_loader.h>
++#ifdef CONFIG_ARM_FFA_TRANSPORT
++#include <arm_ffa_helper.h>
++#endif
+=20
+ DECLARE_GLOBAL_DATA_PTR;
+=20
+@@ -770,6 +773,9 @@ static init_fnc_t init_sequence_r[] =3D {
+ 	INIT_FUNC_WATCHDOG_RESET
+ 	initr_net,
+ #endif
++#ifdef CONFIG_ARM_FFA_TRANSPORT
++	ffa_helper_init_device,
++#endif
+ #ifdef CONFIG_POST
+ 	initr_post,
+ #endif
+diff --git a/drivers/Kconfig b/drivers/Kconfig
+index b26ca8cf70..e83c23789d 100644
+--- a/drivers/Kconfig
++++ b/drivers/Kconfig
+@@ -6,6 +6,8 @@ source "drivers/core/Kconfig"
+=20
+ source "drivers/adc/Kconfig"
+=20
++source "drivers/arm-ffa/Kconfig"
++
+ source "drivers/ata/Kconfig"
+=20
+ source "drivers/axi/Kconfig"
+diff --git a/drivers/Makefile b/drivers/Makefile
+index 4e7cf28440..6671d2a604 100644
+--- a/drivers/Makefile
++++ b/drivers/Makefile
+@@ -107,6 +107,7 @@ obj-y +=3D iommu/
+ obj-y +=3D smem/
+ obj-y +=3D thermal/
+ obj-$(CONFIG_TEE) +=3D tee/
++obj-$(CONFIG_ARM_FFA_TRANSPORT) +=3D arm-ffa/
+ obj-y +=3D axi/
+ obj-y +=3D ufs/
+ obj-$(CONFIG_W1) +=3D w1/
+diff --git a/drivers/arm-ffa/Kconfig b/drivers/arm-ffa/Kconfig
+new file mode 100644
+index 0000000000..d71444c1fa
+--- /dev/null
++++ b/drivers/arm-ffa/Kconfig
+@@ -0,0 +1,26 @@
++# SPDX-License-Identifier: GPL-2.0
++
++config ARM_FFA_TRANSPORT
++	bool "Enable Arm Firmware Framework for Armv8-A driver"
++	depends on DM && ARM64
++	select ARM_SMCCC
++	select LIB_UUID
++	select ARM_FFA_TRANSPORT_HELPERS
++	select CMD_ARMFFA
++	help
++	  The Firmware Framework for Arm A-profile processors (FF-A)
++	  describes interfaces (ABIs) that standardize communication
++	  between the Secure World and Normal World leveraging TrustZone
++	  technology.
++
++	  This driver is based on FF-A specification v1.0 and uses SMC32
++	  calling convention.
++
++	  FF-A specification:
++
++	  https://developer.arm.com/documentation/den0077/a/?lang=3Den
++
++	  In u-boot FF-A design, the Secure World is considered as one
++	  entity to communicate with. FF-A communication is handled by
++	  one device and one instance. This device takes care of
++	  all the interactions between Normal world and Secure World.
+diff --git a/drivers/arm-ffa/Makefile b/drivers/arm-ffa/Makefile
+new file mode 100644
+index 0000000000..9fb5bea522
+--- /dev/null
++++ b/drivers/arm-ffa/Makefile
+@@ -0,0 +1,3 @@
++# SPDX-License-Identifier: GPL-2.0+
++
++obj-y +=3D arm-ffa-uclass.o core.o
+diff --git a/drivers/arm-ffa/arm-ffa-uclass.c b/drivers/arm-ffa/arm-ffa-=
uclass.c
+new file mode 100644
+index 0000000000..43f6066281
+--- /dev/null
++++ b/drivers/arm-ffa/arm-ffa-uclass.c
+@@ -0,0 +1,67 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * (C) Copyright 2021 ARM Limited
++ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ */
++
++#include <common.h>
++#include <dm.h>
++#include <arm_ffa.h>
++#include <errno.h>
++#include <log.h>
++#include <asm/global_data.h>
++
++DECLARE_GLOBAL_DATA_PTR;
++
++UCLASS_DRIVER(ffa) =3D {
++	.name		=3D "ffa",
++	.id		=3D UCLASS_FFA,
++};
++
++/**
++ * ffa_get_invoke_func - performs a call to the FF-A driver dispatcher
++ * @func_id:	The FF-A function to be used
++ * @func_data:  Pointer to the FF-A function arguments
++ *				container structure. This also includes
++ *				pointers to the returned data needed by
++ *				clients.
++ *
++ * This runtime function passes the FF-A function ID and its arguments =
to
++ * the FF-A driver dispatcher.
++ * This function is called by the FF-A helper functions.
++ *
++ * Return:
++ *
++ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
++ */
++int __ffa_runtime ffa_get_invoke_func(u32 func_id, struct ffa_interface=
_data *func_data)
++{
++	if (!ffa_device_get_ops()->invoke_func)
++		return -EINVAL;
++
++	return ffa_device_get_ops()->invoke_func(func_id, func_data);
++}
++
++/**
++ * ffa_init_device - probes the arm_ffa device
++ *
++ * This boot time function makes sure the arm_ffa device is probed
++ * and ready for use.
++ * This function is called automatically at initcalls
++ * level (after u-boot relocation).
++ *
++ * Arm FF-A transport is implemented through a single u-boot
++ * device (arm_ffa). So, there is only one device belonging to UCLASS_F=
FA.
++ * All FF-A clients should use the arm_ffa device to use the FF-A
++ * transport.
++ *
++ * Return:
++ *
++ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
++ */
++int ffa_init_device(void)
++{
++	ffa_dbg("[%s]", __func__);
++
++	return ffa_get_device();
++}
+diff --git a/drivers/arm-ffa/arm_ffa_prv.h b/drivers/arm-ffa/arm_ffa_prv=
.h
+new file mode 100644
+index 0000000000..38ea4ba83e
+--- /dev/null
++++ b/drivers/arm-ffa/arm_ffa_prv.h
+@@ -0,0 +1,199 @@
++/* SPDX-License-Identifier: GPL-2.0+ */
++/*
++ * (C) Copyright 2021 ARM Limited
++ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ */
++
++#ifndef __ARM_FFA_PRV_H
++#define __ARM_FFA_PRV_H
++
++#include <arm_ffa.h>
++#include <linux/bitfield.h>
++#include <linux/bitops.h>
++
++/*
++ * This header is private. It is exclusively used by the FF-A driver
++ */
++
++/* FF-A driver version definitions */
++
++#define MAJOR_VERSION_MASK		GENMASK(30, 16)
++#define MINOR_VERSION_MASK		GENMASK(15, 0)
++#define GET_FFA_MAJOR_VERSION(x)		\
++				((u16)(FIELD_GET(MAJOR_VERSION_MASK, (x))))
++#define GET_FFA_MINOR_VERSION(x)		\
++				((u16)(FIELD_GET(MINOR_VERSION_MASK, (x))))
++#define PACK_VERSION_INFO(major, minor)			\
++	(FIELD_PREP(MAJOR_VERSION_MASK, (major)) |	\
++	 FIELD_PREP(MINOR_VERSION_MASK, (minor)))
++
++#define FFA_MAJOR_VERSION		(1)
++#define FFA_MINOR_VERSION		(0)
++#define FFA_VERSION_1_0		\
++			PACK_VERSION_INFO(FFA_MAJOR_VERSION, FFA_MINOR_VERSION)
++
++/* Endpoint ID mask (u-boot endpoint ID) */
++
++#define GET_SELF_ENDPOINT_ID_MASK		GENMASK(15, 0)
++#define GET_SELF_ENDPOINT_ID(x)		\
++			((u16)(FIELD_GET(GET_SELF_ENDPOINT_ID_MASK, (x))))
++
++#define PREP_SELF_ENDPOINT_ID_MASK		GENMASK(31, 16)
++#define PREP_SELF_ENDPOINT_ID(x)		\
++			((u16)(FIELD_PREP(PREP_SELF_ENDPOINT_ID_MASK, (x))))
++
++/* Partition endpoint ID mask  (partition with which u-boot communicate=
s with) */
++
++#define PREP_PART_ENDPOINT_ID_MASK		GENMASK(15, 0)
++#define PREP_PART_ENDPOINT_ID(x)		\
++			((u16)(FIELD_PREP(PREP_PART_ENDPOINT_ID_MASK, (x))))
++
++/* The FF-A SMC function prototype definition */
++
++typedef void (*invoke_ffa_fn_t)(unsigned long a0, unsigned long a1,
++			unsigned long a2, unsigned long a3, unsigned long a4,
++			unsigned long a5, unsigned long a6, unsigned long a7,
++			struct arm_smccc_res *res);
++
++/**
++ * enum ffa_conduit - Arm FF-A conduits supported by the Arm FF-A drive=
r
++ * Currently only SMC32 is supported.
++ */
++enum ffa_conduit {
++	FFA_CONDUIT_SMC =3D 0,
++};
++
++/**
++ * FFA_DECLARE_ARGS - FF-A functions local variables
++ * @a0-a7:	local variables used to set registers x0-x7
++ * @res:	the structure hosting the FF-A function return data
++ *
++ * A helper macro for declaring local variables for the FF-A functions =
 arguments.
++ * The x0-x7 registers are used to exchange data with the secure world.
++ * But, only the bottom 32-bit of thes registers contains the data.
++ */
++#define FFA_DECLARE_ARGS \
++	unsigned long a0 =3D 0; \
++	unsigned long a1 =3D 0; \
++	unsigned long a2 =3D 0; \
++	unsigned long a3 =3D 0; \
++	unsigned long a4 =3D 0; \
++	unsigned long a5 =3D 0; \
++	unsigned long a6 =3D 0; \
++	unsigned long a7 =3D 0; \
++	struct arm_smccc_res res =3D {0}
++
++/* FF-A error codes */
++#define FFA_ERR_STAT_NOT_SUPPORTED				(-1)
++#define FFA_ERR_STAT_INVALID_PARAMETERS				(-2)
++#define FFA_ERR_STAT_NO_MEMORY				(-3)
++#define FFA_ERR_STAT_BUSY				(-4)
++#define FFA_ERR_STAT_INTERRUPTED				(-5)
++#define FFA_ERR_STAT_DENIED				(-6)
++#define FFA_ERR_STAT_RETRY				(-7)
++#define FFA_ERR_STAT_ABORTED				(-8)
++
++/**
++ * struct ffa_features_desc - FF-A functions features
++ * @func_id:	FF-A function
++ * @field1:	features read from register w2
++ * @field2:	features read from register w3
++ *
++ * Data structure describing the features of the  FF-A functions querie=
d by
++ * FFA_FEATURES
++ */
++struct ffa_features_desc {
++	u32 func_id;
++	u32 field1;
++	u32 field2;
++};
++
++/**
++ * enum ffa_rxtx_buf_sizes - minimum sizes supported
++ * for the RX/TX buffers
++ */
++enum ffa_rxtx_buf_sizes {
++	RXTX_4K,
++	RXTX_64K,
++	RXTX_16K
++};
++
++/*
++ * Number of the FF-A interfaces features descriptors
++ * currently only FFA_RXTX_MAP descriptor is supported
++ */
++#define FFA_FEATURE_DESC_CNT (1)
++
++/**
++ * struct ffa_pdata - platform data for the arm_ffa device
++ * @conduit: The FF-A conduit used
++ *
++ * Platform data structure read from the device tree
++ */
++struct ffa_pdata {
++	enum ffa_conduit conduit;
++};
++
++/**
++ * struct ffa_rxtxpair - structure hosting the RX/TX buffers physical a=
ddresses
++ * @rxbuf:	physical address of the RX buffer
++ * @txbuf:	physical address of the TX buffer
++ *
++ * Data structure hosting the physical addresses of the mapped RX/TX bu=
ffers
++ * These physical address are used by the FF-A functions that use the R=
X/TX buffers
++ */
++struct ffa_rxtxpair {
++	u64 rxbuf; /* physical address */
++	u64 txbuf; /* physical address */
++};
++
++/**
++ * struct ffa_partition_desc - the secure partition descriptor
++ * @info:	partition information
++ * @UUID:	UUID
++ *
++ * Each partition has its descriptor containing the partitions informat=
ion and the UUID
++ */
++struct ffa_partition_desc {
++	struct ffa_partition_info info;
++	union ffa_partition_uuid UUID;
++};
++
++/**
++ * struct ffa_partitions - descriptors for all secure partitions
++ * @count:	The number of partitions descriptors
++ * @descs	The partitions descriptors table
++ *
++ * This data structure contains the partitions descriptors table
++ */
++struct ffa_partitions {
++	u32 count;
++	struct ffa_partition_desc *descs; /* virtual address */
++};
++
++/**
++ * struct ffa_prvdata - the driver private data structure
++ *
++ * @dev:	The arm_ffa device under u-boot driver model
++ * @fwk_version:	FF-A framework version
++ * @id:	u-boot endpoint ID
++ * @partitions:	The partitions descriptors structure
++ * @pair:	The RX/TX buffers pair
++ * @conduit:	The selected conduit
++ * @invoke_ffa_fn:	The function executing the FF-A function
++ * @features:	Table of the FF-A functions having features
++ *
++ * The driver data structure hosting all resident data.
++ */
++struct ffa_prvdata {
++	struct udevice *dev;
++	u32 fwk_version;
++	u16 id;
++	struct ffa_partitions partitions;
++	struct ffa_rxtxpair pair;
++	enum ffa_conduit conduit;
++	invoke_ffa_fn_t invoke_ffa_fn;
++	struct ffa_features_desc features[FFA_FEATURE_DESC_CNT];
++};
++
++#endif
+diff --git a/drivers/arm-ffa/core.c b/drivers/arm-ffa/core.c
+new file mode 100644
+index 0000000000..98e2d2fa17
+--- /dev/null
++++ b/drivers/arm-ffa/core.c
+@@ -0,0 +1,1484 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * (C) Copyright 2021 ARM Limited
++ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ */
++
++#include "arm_ffa_prv.h"
++#include <asm/global_data.h>
++#include <asm/io.h>
++#include <common.h>
++#include <dm.h>
++#include <fdtdec.h>
++#include <linux/errno.h>
++#include <linux/sizes.h>
++#include <log.h>
++#include <malloc.h>
++#include <mapmem.h>
++#include <string.h>
++
++DECLARE_GLOBAL_DATA_PTR;
++
++/**
++ * The device private data structure containing all the resident
++ * data read from secure world
++ */
++struct ffa_prvdata __ffa_runtime_data ffa_priv_data =3D {0};
++
++/*
++ * Driver functions
++ */
++
++/**
++ * ffa_get_device - probes the arm_ffa device
++ *
++ * This boot time function makes sure the arm_ffa device is probed
++ * and ready for use. This is done using uclass_get_device.
++ * The arm_ffa driver belongs to UCLASS_FFA.
++ * This function should be called before using the driver.
++ *
++ * Arm FF-A transport is implemented through a single u-boot
++ * device (arm_ffa). So, there is only one device belonging to UCLASS_F=
FA.
++ * All FF-A clients should use the arm_ffa device to use the FF-A
++ * transport.
++ *
++ * Return:
++ *
++ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
++ */
++int ffa_get_device(void)
++{
++	int ret;
++	int devnum =3D 0;
++
++	ffa_dbg("[%s]", __func__);
++
++	if (ffa_priv_data.dev)
++		return FFA_ERR_STAT_SUCCESS;
++
++	/*
++	 * searching and probing the device
++	 */
++	ret =3D uclass_get_device(UCLASS_FFA, devnum, &ffa_priv_data.dev);
++	if (ret) {
++		ffa_err("can not find the device");
++		ffa_priv_data.dev =3D NULL;
++		return -ENODEV;
++	}
++
++	return FFA_ERR_STAT_SUCCESS;
++}
++
++/**
++ * ffa_get_version - FFA_VERSION handler function
++ *
++ * This is the boot time function that implements FFA_VERSION FF-A func=
tion
++ * to get from the secure world the FF-A framework version
++ *
++ * Return:
++ *
++ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
++ */
++static int ffa_get_version(void)
++{
++	u16 major, minor;
++
++	FFA_DECLARE_ARGS;
++
++	ffa_dbg("[%s]", __func__);
++
++	if (!ffa_priv_data.invoke_ffa_fn)
++		panic("[FFA] no private data found\n");
++
++	a0 =3D FFA_VERSION;
++	a1 =3D FFA_VERSION_1_0;
++	ffa_priv_data.invoke_ffa_fn(a0, a1, a2, a3, a4, a5, a6, a7, &res);
++
++	if (res.a0 =3D=3D FFA_ERR_STAT_NOT_SUPPORTED) {
++		ffa_err("A Firmware Framework implementation does not exist");
++		return -EOPNOTSUPP;
++	}
++
++	major =3D GET_FFA_MAJOR_VERSION(res.a0);
++	minor =3D GET_FFA_MINOR_VERSION(res.a0);
++
++	ffa_info("FF-A driver %d.%d\nFF-A framework %d.%d",
++		 FFA_MAJOR_VERSION, FFA_MINOR_VERSION, major, minor);
++
++	if ((major =3D=3D FFA_MAJOR_VERSION && minor >=3D FFA_MINOR_VERSION)) =
{
++		ffa_info("Versions are compatible ");
++
++		ffa_priv_data.fwk_version =3D res.a0;
++
++		return FFA_ERR_STAT_SUCCESS;
++	}
++
++	ffa_info("Versions are incompatible ");
++	return -EPROTONOSUPPORT;
++}
++
++/**
++ * ffa_get_endpoint_id - FFA_ID_GET handler function
++ *
++ * This is the boot time function that implements FFA_ID_GET FF-A funct=
ion
++ * to get from the secure world u-boot endpoint ID
++ *
++ * Return:
++ *
++ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
++ */
++static int ffa_get_endpoint_id(void)
++{
++	FFA_DECLARE_ARGS;
++
++	ffa_dbg("[%s]", __func__);
++
++	if (!ffa_priv_data.invoke_ffa_fn)
++		panic("[FFA] no private data found\n");
++
++	a0 =3D FFA_ID_GET;
++
++	ffa_priv_data.invoke_ffa_fn(a0, a1, a2, a3, a4, a5, a6, a7, &res);
++
++	switch (res.a0) {
++	case FFA_ERROR:
++	{
++		if (((int)res.a2) =3D=3D FFA_ERR_STAT_NOT_SUPPORTED) {
++			ffa_err("This function is not implemented at this FF-A instance");
++			return -EOPNOTSUPP;
++		}
++
++		ffa_err("Undefined error code (%d)", ((int)res.a2));
++		return -EINVAL;
++	}
++	case FFA_SUCCESS:
++	{
++		ffa_priv_data.id =3D GET_SELF_ENDPOINT_ID(res.a2);
++		ffa_info("endpoint ID is %u", ffa_priv_data.id);
++
++		return FFA_ERR_STAT_SUCCESS;
++	}
++	default:
++	{
++		ffa_err("Undefined response function (0x%lx)", res.a0);
++		return -EINVAL;
++	}
++	}
++}
++
++/**
++ * ffa_get_features_desc - returns the features descriptor of the speci=
fied
++ *						FF-A function
++ * @func_id:	the FF-A function which the features are to be retrieved
++ *
++ * This is a boot time function that searches the features descriptor o=
f the
++ * specified FF-A function
++ *
++ * Return:
++ *
++ * When found, the address of the features descriptor is returned. Othe=
rwise, NULL.
++ */
++static struct ffa_features_desc *ffa_get_features_desc(u32 func_id)
++{
++	u32 desc_idx;
++
++	/*
++	 * search for the descriptor of the selected FF-A interface
++	 */
++	for (desc_idx =3D 0; desc_idx < FFA_FEATURE_DESC_CNT ; desc_idx++)
++		if (ffa_priv_data.features[desc_idx].func_id =3D=3D func_id)
++			return &ffa_priv_data.features[desc_idx];
++
++	return NULL;
++}
++
++/**
++ * ffa_get_rxtx_map_features - FFA_FEATURES handler function with FFA_R=
XTX_MAP
++ *							argument
++ *
++ * This is the boot time function that implements FFA_FEATURES FF-A fun=
ction
++ * to retrieve the FFA_RXTX_MAP features
++ *
++ * Return:
++ *
++ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
++ */
++static int ffa_get_rxtx_map_features(void)
++{
++	FFA_DECLARE_ARGS;
++
++	ffa_dbg("[%s]", __func__);
++
++	if (!ffa_priv_data.invoke_ffa_fn)
++		panic("[FFA] no private data found\n");
++
++	a0 =3D FFA_FEATURES;
++	a1 =3D FFA_RXTX_MAP;
++
++	ffa_priv_data.invoke_ffa_fn(a0, a1, a2, a3, a4, a5, a6, a7, &res);
++
++	switch (res.a0) {
++	case FFA_ERROR:
++	{
++		if (((int)res.a2) =3D=3D FFA_ERR_STAT_NOT_SUPPORTED) {
++			ffa_err("FFA_RXTX_MAP is not implemented at this FF-A instance");
++			return -EOPNOTSUPP;
++		}
++
++		ffa_err("Undefined error code (%d)", ((int)res.a2));
++		return -EINVAL;
++	}
++	case FFA_SUCCESS:
++	{
++		u32 desc_idx;
++
++		/*
++		 * search for an empty descriptor
++		 */
++		for (desc_idx =3D 0; desc_idx < FFA_FEATURE_DESC_CNT ; desc_idx++)
++			if (!ffa_priv_data.features[desc_idx].func_id) {
++				/*
++				 * populate the descriptor with
++				 * the interface features data
++				 */
++				ffa_priv_data.features[desc_idx].func_id =3D
++					FFA_RXTX_MAP;
++				ffa_priv_data.features[desc_idx].field1 =3D
++					res.a2;
++
++				ffa_info("FFA_RXTX_MAP features data 0x%lx",
++					 res.a2);
++
++				return FFA_ERR_STAT_SUCCESS;
++			}
++
++		ffa_err("Cannot save FFA_RXTX_MAP features data. Descriptors table fu=
ll");
++		return -ENOBUFS;
++	}
++	default:
++	{
++		ffa_err("Undefined response function (0x%lx)",
++			res.a0);
++		return -EINVAL;
++	}
++	}
++}
++
++/**
++ * ffa_get_rxtx_buffers_pages_cnt - reads from the features data descri=
ptors
++ *						the minimum number of pages in each of the RX/TX
++ *						buffers
++ * @buf_4k_pages: Pointer to the minimum number of pages
++ *
++ * This is the boot time function that  returns the minimum number of p=
ages
++ *  in each of the RX/TX buffers
++ *
++ * Return:
++ *
++ * buf_4k_pages points to the returned number of pages
++ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
++ */
++static int ffa_get_rxtx_buffers_pages_cnt(size_t *buf_4k_pages)
++{
++	struct ffa_features_desc *desc =3D NULL;
++
++	ffa_dbg("[%s]", __func__);
++
++	if (!buf_4k_pages)
++		return -EINVAL;
++
++	desc =3D ffa_get_features_desc(FFA_RXTX_MAP);
++	if (!desc)
++		return -EINVAL;
++
++	ffa_dbg("FFA_RXTX_MAP descriptor found");
++
++	switch (desc->field1) {
++	case RXTX_4K:
++		*buf_4k_pages =3D 1;
++		break;
++	case RXTX_16K:
++		*buf_4k_pages =3D 4;
++		break;
++	case RXTX_64K:
++		*buf_4k_pages =3D 16;
++		break;
++	default:
++		ffa_err("RX/TX buffer size not supported");
++		return -EINVAL;
++	}
++
++	return FFA_ERR_STAT_SUCCESS;
++}
++
++/**
++ * ffa_free_rxtx_buffers - frees the RX/TX buffers
++ * @buf_4k_pages: the minimum number of pages in each of the RX/TX
++ *			  buffers
++ *
++ * This is the boot time function used to free the RX/TX buffers
++ *
++ * Return:
++ *
++ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
++ */
++static int ffa_free_rxtx_buffers(size_t buf_4k_pages)
++{
++	efi_status_t free_rxbuf_ret, free_txbuf_ret;
++
++	ffa_info("Freeing RX/TX buffers");
++
++	free_rxbuf_ret =3D efi_free_pages(ffa_priv_data.pair.rxbuf, buf_4k_pag=
es);
++	free_txbuf_ret =3D efi_free_pages(ffa_priv_data.pair.txbuf, buf_4k_pag=
es);
++
++	if (free_rxbuf_ret !=3D EFI_SUCCESS || free_txbuf_ret !=3D EFI_SUCCESS=
) {
++		ffa_err("Failed to free RX/TX buffers (rx: %lu , tx: %lu)",
++			free_rxbuf_ret,
++			free_txbuf_ret);
++		return -EINVAL;
++	}
++
++	return FFA_ERR_STAT_SUCCESS;
++}
++
++/**
++ * ffa_alloc_rxtx_buffers - allocates the RX/TX buffers
++ * @buf_4k_pages: the minimum number of pages in each of the RX/TX
++ *			  buffers
++ *
++ * This is the boot time function used by ffa_map_rxtx_buffers to alloc=
ate
++ * the RX/TX buffers before mapping them
++ *
++ * Return:
++ *
++ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
++ */
++static int ffa_alloc_rxtx_buffers(size_t buf_4k_pages)
++{
++	ffa_dbg("[%s]", __func__);
++
++#if CONFIG_IS_ENABLED(EFI_LOADER)
++
++	efi_status_t efi_ret;
++	void *virt_txbuf;
++	void *virt_rxbuf;
++
++	ffa_info("Using %lu 4KB page(s) for RX/TX buffers size",
++		 buf_4k_pages);
++
++	efi_ret =3D efi_allocate_pages(EFI_ALLOCATE_ANY_PAGES,
++				     EFI_BOOT_SERVICES_DATA,
++				     buf_4k_pages,
++				     &ffa_priv_data.pair.rxbuf);
++
++	if (efi_ret !=3D EFI_SUCCESS) {
++		ffa_priv_data.pair.rxbuf =3D 0;
++		ffa_err("Failure to allocate RX buffer (EFI error: 0x%lx)",
++			efi_ret);
++
++		return -ENOBUFS;
++	}
++
++	ffa_info("RX buffer at phys 0x%llx",
++		 ffa_priv_data.pair.rxbuf);
++
++	/*
++	 * convert the RX buffer physical address to virtual address
++	 */
++	virt_rxbuf =3D (void *)map_sysmem((phys_addr_t)ffa_priv_data.pair.rxbu=
f, 0);
++
++	/*
++	 * make sure the buffer is clean before use
++	 */
++	memset(virt_rxbuf, 0, buf_4k_pages * SZ_4K);
++
++	unmap_sysmem(virt_rxbuf);
++
++	efi_ret =3D efi_allocate_pages(EFI_ALLOCATE_ANY_PAGES,
++				     EFI_RUNTIME_SERVICES_DATA,
++				     buf_4k_pages,
++				     &ffa_priv_data.pair.txbuf);
++
++	if (efi_ret !=3D EFI_SUCCESS) {
++		ffa_dbg("FFA_RXTX_MAP: freeing RX buffer");
++		efi_free_pages(ffa_priv_data.pair.rxbuf, buf_4k_pages);
++		ffa_priv_data.pair.rxbuf =3D 0;
++		ffa_priv_data.pair.txbuf =3D 0;
++		ffa_err("Failure to allocate the TX buffer (EFI error: 0x%lx)"
++			, efi_ret);
++
++		return -ENOBUFS;
++	}
++
++	ffa_info("TX buffer at phys 0x%llx",
++		 ffa_priv_data.pair.txbuf);
++
++	/*
++	 * convert the TX buffer physical address to virtual address
++	 */
++	virt_txbuf =3D (void *)map_sysmem((phys_addr_t)ffa_priv_data.pair.txbu=
f, 0);
++
++	/*
++	 * make sure the buffer is clean before use
++	 */
++	memset(virt_txbuf, 0, buf_4k_pages * SZ_4K);
++
++	unmap_sysmem(virt_txbuf);
++
++	return FFA_ERR_STAT_SUCCESS;
++
++#else
++	return -ENOBUFS;
++#endif
++}
++
++/**
++ * ffa_map_rxtx_buffers - FFA_RXTX_MAP handler function
++ * @buf_4k_pages: the minimum number of pages in each of the RX/TX
++ *			  buffers
++ *
++ * This is the boot time function that implements FFA_RXTX_MAP FF-A fun=
ction
++ * to map the RX/TX buffers
++ *
++ * Return:
++ *
++ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
++ */
++static int ffa_map_rxtx_buffers(size_t buf_4k_pages)
++{
++	int ret;
++
++	FFA_DECLARE_ARGS;
++
++	ffa_dbg("[%s]", __func__);
++
++	if (!ffa_priv_data.invoke_ffa_fn)
++		panic("[FFA] no private data found\n");
++
++	ret =3D ffa_alloc_rxtx_buffers(buf_4k_pages);
++	if (ret !=3D FFA_ERR_STAT_SUCCESS)
++		return ret;
++
++	a0 =3D FFA_RXTX_MAP;
++	a1 =3D ffa_priv_data.pair.txbuf;
++	a2 =3D ffa_priv_data.pair.rxbuf;
++	a3 =3D buf_4k_pages;
++
++	ffa_priv_data.invoke_ffa_fn(a0, a1, a2, a3, a4, a5, a6, a7, &res);
++
++	switch (res.a0) {
++	case FFA_ERROR:
++	{
++		switch (((int)res.a2)) {
++		case FFA_ERR_STAT_INVALID_PARAMETERS:
++			ffa_err("One or more fields in input parameters is incorrectly encod=
ed");
++			ret =3D -EPERM;
++			break;
++		case FFA_ERR_STAT_NO_MEMORY:
++			ffa_err("Not enough memory");
++			ret =3D -ENOMEM;
++			break;
++		case FFA_ERR_STAT_DENIED:
++			ffa_err("Buffer pair already registered");
++			ret =3D -EACCES;
++			break;
++		case FFA_ERR_STAT_NOT_SUPPORTED:
++			ffa_err("This function is not implemented at this FF-A instance");
++			ret =3D -EOPNOTSUPP;
++			break;
++		default:
++			ffa_err("Undefined error (%d)",
++				((int)res.a2));
++			ret =3D -EINVAL;
++		}
++		break;
++	}
++	case FFA_SUCCESS:
++		ffa_info("RX/TX buffers mapped");
++		return FFA_ERR_STAT_SUCCESS;
++	default:
++		ffa_err("Undefined response function (0x%lx)",
++			res.a0);
++		ret =3D -EINVAL;
++	}
++
++	ffa_free_rxtx_buffers(buf_4k_pages);
++
++	return ret;
++}
++
++/**
++ * ffa_unmap_rxtx_buffers - FFA_RXTX_UNMAP handler function
++ *
++ * This is the boot time function that implements FFA_RXTX_UNMAP FF-A f=
unction
++ * to unmap the RX/TX buffers
++ *
++ * Return:
++ *
++ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
++ */
++static int ffa_unmap_rxtx_buffers(void)
++{
++	FFA_DECLARE_ARGS;
++
++	ffa_dbg("[%s]", __func__);
++
++	if (!ffa_priv_data.invoke_ffa_fn)
++		panic("[FFA] no private data found\n");
++
++	a0 =3D FFA_RXTX_UNMAP;
++	a1 =3D PREP_SELF_ENDPOINT_ID(ffa_priv_data.id);
++
++	ffa_priv_data.invoke_ffa_fn(a0, a1, a2, a3, a4, a5, a6, a7, &res);
++
++	switch (res.a0) {
++	case FFA_ERROR:
++	{
++		if (((int)res.a2) =3D=3D FFA_ERR_STAT_NOT_SUPPORTED)
++			panic("[FFA] FFA_RXTX_UNMAP is not implemented at this FF-A instance=
\n");
++		else if (((int)res.a2) =3D=3D FFA_ERR_STAT_INVALID_PARAMETERS)
++			panic("[FFA] There is no buffer pair registered on behalf of the cal=
ler\n");
++		else
++			panic("[FFA] Undefined error (%d)\n", ((int)res.a2));
++	}
++	case FFA_SUCCESS:
++	{
++		size_t buf_4k_pages =3D 0;
++		int ret;
++
++		ret =3D ffa_get_rxtx_buffers_pages_cnt(&buf_4k_pages);
++		if (ret !=3D FFA_ERR_STAT_SUCCESS)
++			panic("[FFA] RX/TX buffers unmapped but failure in getting pages cou=
nt\n");
++
++		ret =3D ffa_free_rxtx_buffers(buf_4k_pages);
++		if (ret !=3D FFA_ERR_STAT_SUCCESS)
++			panic("[FFA] RX/TX buffers unmapped but failure in freeing the memor=
y\n");
++
++		ffa_info("RX/TX buffers unmapped and memory freed");
++
++		return FFA_ERR_STAT_SUCCESS;
++	}
++	default:
++		panic("[FFA] Undefined response function (0x%lx)", res.a0);
++	}
++}
++
++/**
++ * ffa_release_rx_buffer - FFA_RX_RELEASE handler function
++ *
++ * This is the boot time function that invokes FFA_RX_RELEASE FF-A func=
tion
++ * to release the ownership of the RX buffer
++ *
++ * Return:
++ *
++ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
++ */
++static int ffa_release_rx_buffer(void)
++{
++	FFA_DECLARE_ARGS;
++
++	ffa_dbg("[%s]", __func__);
++
++	if (!ffa_priv_data.invoke_ffa_fn)
++		panic("[FFA] no private data found\n");
++
++	a0 =3D FFA_RX_RELEASE;
++
++	ffa_priv_data.invoke_ffa_fn(a0, a1, a2, a3, a4, a5, a6, a7, &res);
++
++	switch (res.a0) {
++	case FFA_ERROR:
++	{
++		if (((int)res.a2) =3D=3D FFA_ERR_STAT_NOT_SUPPORTED)
++			panic("[FFA] FFA_RX_RELEASE is not implemented at this FF-A instance=
\n");
++		else if (((int)res.a2) =3D=3D FFA_ERR_STAT_DENIED)
++			panic("[FFA] Caller did not have ownership of the RX buffer\n");
++		else
++			panic("[FFA] Undefined error (%d)\n", ((int)res.a2));
++	}
++	case FFA_SUCCESS:
++		ffa_info("RX buffer released");
++		return FFA_ERR_STAT_SUCCESS;
++
++	default:
++		panic("[FFA] Undefined response function (0x%lx)\n", res.a0);
++	}
++}
++
++/**
++ * ffa_uuid_are_identical - checks whether two given UUIDs are identica=
l
++ * @uuid1: first UUID
++ * @uuid2: second UUID
++ *
++ * This is a boot time function used by ffa_read_partitions_info to sea=
rch
++ * for a UUID in the partitions descriptors table
++ *
++ * Return:
++ *
++ * 1 when UUIDs match. Otherwise, 0
++ */
++int ffa_uuid_are_identical(const union ffa_partition_uuid *uuid1,
++			   const union ffa_partition_uuid *uuid2)
++{
++	if (!uuid1 || !uuid2)
++		return 0;
++
++	return (!memcmp(uuid1, uuid2, sizeof(union ffa_partition_uuid)));
++}
++
++/**
++ * ffa_read_partitions_info - reads the data queried by FFA_PARTITION_I=
NFO_GET
++ *							and saves it in the private structure
++ * @count: The number of partitions queried
++ * @part_uuid: Pointer to the partition(s) UUID
++ *
++ * This is the boot time function that reads the partitions information
++ * returned by the FFA_PARTITION_INFO_GET and saves it in the private
++ * data structure.
++ *
++ * Return:
++ *
++ * The private data structure is updated with the partition(s) informat=
ion
++ * FFA_ERR_STAT_SUCCESS is returned on success. Otherwise, failure
++ */
++static int ffa_read_partitions_info(u32 count, union ffa_partition_uuid=
 *part_uuid)
++{
++	ffa_dbg("[%s]", __func__);
++
++	if (!count) {
++		ffa_err("No partition detected");
++		return -ENODATA;
++	}
++
++	ffa_info("Reading partitions data from the RX buffer");
++
++#if CONFIG_IS_ENABLED(EFI_LOADER)
++
++	if (!part_uuid) {
++		/*
++		 * querying information of all partitions
++		 */
++		u64 data_pages;
++		u64 data_bytes;
++		efi_status_t efi_ret;
++		size_t buf_4k_pages =3D 0;
++		u32 desc_idx;
++		struct ffa_partition_info *parts_info;
++		int ret;
++
++		data_bytes =3D count * sizeof(struct ffa_partition_desc);
++		data_pages =3D efi_size_in_pages(data_bytes);
++
++		/*
++		 * get the RX buffer size in pages
++		 */
++		ret =3D ffa_get_rxtx_buffers_pages_cnt(&buf_4k_pages);
++		if (ret !=3D FFA_ERR_STAT_SUCCESS) {
++			ffa_err("Can not get the RX buffer size (error %d)", ret);
++			return ret;
++		}
++
++		if (data_pages > buf_4k_pages) {
++			ffa_err("Partitions data size exceeds the RX buffer size:");
++			ffa_err("    Sizes in pages: data %llu , RX buffer %lu ",
++				data_pages,
++				buf_4k_pages);
++
++			return -ENOMEM;
++		}
++
++		efi_ret =3D efi_allocate_pages(EFI_ALLOCATE_ANY_PAGES,
++					     EFI_RUNTIME_SERVICES_DATA,
++					     data_pages,
++					     (u64 *)&ffa_priv_data.partitions.descs);
++
++		if (efi_ret !=3D EFI_SUCCESS) {
++			ffa_priv_data.partitions.descs =3D NULL;
++
++			ffa_err("Cannot  allocate partitions data buffer (EFI error 0x%lx)",
++				efi_ret);
++
++			return -ENOBUFS;
++		}
++
++		/*
++		 * convert the descs buffer physical address
++		 * to virtual address
++		 * This virtual address should not be unmapped
++		 * descs is expected to be a virtual address
++		 */
++		ffa_priv_data.partitions.descs =3D
++			(struct ffa_partition_desc *)
++			map_sysmem((phys_addr_t)
++				   ffa_priv_data.partitions.descs, 0);
++
++		/*
++		 * make sure the buffer is clean before use
++		 */
++		memset(ffa_priv_data.partitions.descs, 0,
++		       data_pages * SZ_4K);
++
++		ffa_info("Copying %lld page(s) of partitions data from RX buffer",
++			 data_pages);
++
++		/*
++		 * convert the RX buffer physical address to
++		 * virtual address
++		 */
++		parts_info =3D (struct ffa_partition_info *)
++			map_sysmem((phys_addr_t)
++				   ffa_priv_data.pair.rxbuf, 0);
++
++		for (desc_idx =3D 0 ; desc_idx < count ; desc_idx++) {
++			ffa_priv_data.partitions.descs[desc_idx].info =3D
++				parts_info[desc_idx];
++
++			ffa_info("Partition ID %x : info cached",
++				 ffa_priv_data.partitions.descs[desc_idx].info.id);
++		}
++		unmap_sysmem(parts_info);
++
++		ffa_priv_data.partitions.count =3D count;
++
++		ffa_info("%d partition(s) found and cached", count);
++
++	} else {
++		u32 rx_desc_idx, cached_desc_idx;
++		struct ffa_partition_info *parts_info;
++		u8 desc_found;
++
++		/*
++		 * convert the RX buffer physical address to virtual address
++		 */
++		parts_info =3D (struct ffa_partition_info *)
++			map_sysmem((phys_addr_t)ffa_priv_data.pair.rxbuf, 0);
++
++		/*
++		 * search for the SP IDs read from the RX buffer
++		 * in the already cached SPs.
++		 * Update the UUID when ID found.
++		 */
++		for (rx_desc_idx =3D 0; rx_desc_idx < count ; rx_desc_idx++) {
++			desc_found =3D 0;
++
++			/*
++			 * search the current ID in the cached partitions
++			 */
++			for (cached_desc_idx =3D 0;
++			     cached_desc_idx < ffa_priv_data.partitions.count;
++			     cached_desc_idx++) {
++				/*
++				 * save the UUID
++				 */
++				if (ffa_priv_data.partitions.descs[cached_desc_idx].info.id =3D=3D
++				    parts_info[rx_desc_idx].id) {
++					ffa_priv_data.partitions.descs[cached_desc_idx].UUID =3D
++						*part_uuid;
++
++					desc_found =3D 1;
++					break;
++				}
++			}
++
++			if (!desc_found) {
++				unmap_sysmem(parts_info);
++				return -ENODATA;
++			}
++		}
++		unmap_sysmem(parts_info);
++	}
++#else
++#warning "arm_ffa: reading FFA_PARTITION_INFO_GET data not implemented"
++#endif
++
++	return  FFA_ERR_STAT_SUCCESS;
++}
++
++/**
++ * ffa_query_partitions_info - invokes FFA_PARTITION_INFO_GET
++ *							and saves partitions data
++ * @part_uuid: Pointer to the partition(s) UUID
++ * @pcount: Pointer to the number of partitions variable filled when qu=
erying
++ *
++ * This is the boot time function that executes the FFA_PARTITION_INFO_=
GET
++ * to query the partitions data. Then, it calls ffa_read_partitions_inf=
o
++ * to save the data in the private data structure.
++ *
++ * After reading the data the RX buffer is released using ffa_release_r=
x_buffer
++ *
++ * Return:
++ *
++ * When part_uuid is NULL, all partitions data are retrieved from secur=
e world
++ * When part_uuid is non NULL, data for partitions matching the given U=
UID are
++ * retrieved and the number of partitions is returned
++ * FFA_ERR_STAT_SUCCESS is returned on success. Otherwise, failure
++ */
++static int ffa_query_partitions_info(union ffa_partition_uuid *part_uui=
d,
++				     u32 *pcount)
++{
++	unsigned long a0 =3D 0;
++	union ffa_partition_uuid query_uuid =3D {0};
++	unsigned long a5 =3D 0;
++	unsigned long a6 =3D 0;
++	unsigned long a7 =3D 0;
++	struct arm_smccc_res res =3D {0};
++
++	ffa_dbg("[%s]", __func__);
++
++	if (!ffa_priv_data.invoke_ffa_fn)
++		panic("[FFA] no private data found\n");
++
++	a0 =3D FFA_PARTITION_INFO_GET;
++
++	/*
++	 * If a UUID is specified. Information for one or more
++	 * partitions in the system is queried. Otherwise, information
++	 * for all installed partitions is queried
++	 */
++
++	if (part_uuid) {
++		if (!pcount)
++			return -EINVAL;
++
++		query_uuid =3D *part_uuid;
++	}
++
++	ffa_priv_data.invoke_ffa_fn(a0, query_uuid.words.a1, query_uuid.words.=
a2,
++				    query_uuid.words.a3, query_uuid.words.a4,
++				    a5, a6, a7, &res);
++
++	switch (res.a0) {
++	case FFA_ERROR:
++	{
++		switch (((int)res.a2)) {
++		case FFA_ERR_STAT_INVALID_PARAMETERS:
++			ffa_err("Unrecognized UUID");
++			return -EPERM;
++		case FFA_ERR_STAT_NO_MEMORY:
++			ffa_err("Results cannot fit in RX buffer of the caller");
++			return -ENOMEM;
++		case FFA_ERR_STAT_DENIED:
++			ffa_err("Callee is not in a state to handle this request");
++			return -EACCES;
++		case FFA_ERR_STAT_NOT_SUPPORTED:
++			ffa_err("This function is not implemented at this FF-A instance");
++			return -EOPNOTSUPP;
++		case FFA_ERR_STAT_BUSY:
++			ffa_err("RX buffer of the caller is not free");
++			return -EBUSY;
++		default:
++			ffa_err("Undefined error (%d)", ((int)res.a2));
++			return -EINVAL;
++		}
++	}
++	case FFA_SUCCESS:
++	{
++		int ret;
++
++		/*
++		 * res.a2 contains the count of partition information descriptors
++		 * populated in the RX buffer
++		 */
++		if (res.a2) {
++			ret =3D ffa_read_partitions_info(res.a2, part_uuid);
++			if (ret)
++				ffa_err("Failed to read partition(s) data , error (%d)", ret);
++		}
++
++		/*
++		 * return the SP count
++		 */
++		if (part_uuid) {
++			if (!ret)
++				*pcount =3D res.a2;
++			else
++				*pcount =3D 0;
++		}
++		/*
++		 * After calling FFA_PARTITION_INFO_GET the buffer ownership
++		 * is assigned to the consumer (u-boot). So, we need to give
++		 * the ownership back to the secure world
++		 */
++		ret =3D ffa_release_rx_buffer();
++
++		if (!part_uuid && !res.a2) {
++			ffa_err("[FFA] no partition installed in the system");
++			return -ENODEV;
++		}
++
++		return ret;
++	}
++	default:
++		ffa_err("Undefined response function (0x%lx)", res.a0);
++		return  -EINVAL;
++	}
++}
++
++/**
++ * ffa_get_partitions_info - FFA_PARTITION_INFO_GET handler function
++ * @func_data: Pointer to the FF-A function arguments container structu=
re.
++ * The passed arguments:
++ * Mode 1: When getting from the driver the number of
++ *	secure partitions:
++ *	@data0_size: UUID size
++ *	@data0: pointer to the UUID (little endian)
++ *	@data1_size: size of the number of partitions
++ *				variable
++ *	@data1: pointer to the number of partitions
++ *			 variable. The variable will be set
++ *			 by the driver
++ * Mode 2: When requesting the driver to return the
++ *	partitions information:
++ *	@data0_size: UUID size
++ *	@data0: pointer to the UUID (little endian)
++ *	@data1_size: size of the SPs information buffer
++ *	@data1: pointer to SPs information buffer
++ *		(allocated by the client).
++ *		The buffer will be filled by the driver
++ *
++ * This is the boot time function that queries the secure partition dat=
a from
++ * the private data structure. If not found, it invokes FFA_PARTITION_I=
NFO_GET
++ * FF-A function to query the partition information from secure world.
++ *
++ * A client of the FF-A driver should know the UUID of the service it w=
ants to
++ * access. It should use the UUID to request the FF-A driver to provide=
 the
++ * partition(s) information of the service. The FF-A driver uses
++ * PARTITION_INFO_GET to obtain this information. This is implemented t=
hrough
++ * ffa_get_partitions_info function.
++ * A new FFA_PARTITION_INFO_GET call is issued (first one performed thr=
ough
++ * ffa_cache_partitions_info) allowing to retrieve the partition(s) inf=
ormation.
++ * They are not saved (already done). We only update the UUID in the ca=
ched area.
++ * This assumes that partitions data does not change in the secure worl=
d.
++ * Otherwise u-boot will have an outdated partition data. The benefit o=
f caching
++ * the information in the FF-A driver is to accommodate discovery after
++ * ExitBootServices().
++ *
++ * When invoked through a client request, ffa_get_partitions_info shoul=
d be
++ * called twice. First call is to get from the driver the number of sec=
ure
++ * partitions (SPs) associated to a particular UUID.
++ * Then, the caller (client) allocates the buffer to host the SPs data =
and
++ * issues a 2nd call. Then, the driver fills the SPs data in the pre-al=
located
++ * buffer.
++ *
++ * To achieve the mechanism described above, ffa_get_partitions_info us=
es the
++ * following functions:
++ *		ffa_read_partitions_info
++ *		ffa_query_partitions_info
++ *
++ * Return:
++ *
++ * @data1: When pointing to the number of partitions variable, the numb=
er is
++ * set by the driver.
++ * When pointing to the partitions information buffer, the buffer will =
be
++ * filled by the driver.
++ *
++ * On success FFA_ERR_STAT_SUCCESS is returned. Otherwise, failure
++ */
++static int ffa_get_partitions_info(struct ffa_interface_data *func_data=
)
++{
++	/*
++	 * fill_data:
++	 * 0: return the SP count
++	 * 1: fill SP data and return it to the caller
++	 * -1: undefined mode
++	 */
++	int fill_data =3D -1;
++	u32 desc_idx, client_desc_idx;
++	union ffa_partition_uuid *part_uuid;
++	u32 client_desc_max_cnt;
++	u32 parts_found =3D 0;
++
++	ffa_dbg("[%s]", __func__);
++
++	if (!func_data) {
++		ffa_err("No function data provided");
++		return -EINVAL;
++	}
++
++	if (!ffa_priv_data.partitions.count || !ffa_priv_data.partitions.descs=
)
++		panic("[FFA] No partition installed\n");
++
++	if (func_data->data0_size =3D=3D sizeof(union ffa_partition_uuid) &&
++	    func_data->data0 &&
++	    func_data->data1_size =3D=3D sizeof(u32) &&
++	    func_data->data1) {
++		/*
++		 * data0 (in): pointer to UUID
++		 * data1 (in): pointer to SP count
++		 * Out: SP count returned in the count variable pointed by data1
++		 */
++
++		fill_data =3D 0;
++
++		ffa_info("Preparing for checking partitions count");
++
++	} else if ((func_data->data0_size =3D=3D sizeof(union ffa_partition_uu=
id)) &&
++		   func_data->data0 &&
++		   (func_data->data1_size >=3D sizeof(struct ffa_partition_info)) &&
++		   !(func_data->data1_size % sizeof(struct ffa_partition_info)) &&
++		   func_data->data1) {
++		/*
++		 * data0 (in): pointer to UUID
++		 * data1 (in): pointer to SPs descriptors buffer
++		 *             (created by the client)
++		 * Out: SPs descriptors returned in the buffer
++		 *      pointed by data1
++		 */
++
++		fill_data =3D 1;
++
++		client_desc_idx =3D 0;
++
++		/*
++		 * number of empty descriptors preallocated by the caller
++		 */
++		client_desc_max_cnt =3D
++			func_data->data1_size / sizeof(struct ffa_partition_info);
++
++		ffa_info("Preparing for filling partitions info");
++
++	} else {
++		ffa_err("Invalid function arguments provided");
++		return -EINVAL;
++	}
++
++	part_uuid =3D (union ffa_partition_uuid *)func_data->data0;
++
++	ffa_info("Searching partitions using the provided UUID");
++
++#ifdef DEBUG
++	{
++		u32 dbg_uuid_cnt;
++
++		ffa_dbg("UUID: [LSB]");
++
++		for (dbg_uuid_cnt =3D 0 ; dbg_uuid_cnt < UUID_SIZE ; dbg_uuid_cnt++)
++			ffa_dbg(" %02x", part_uuid->bytes[dbg_uuid_cnt]);
++	}
++#endif
++
++	/*
++	 * search in the cached partitions
++	 */
++	for (desc_idx =3D 0;
++	     desc_idx < ffa_priv_data.partitions.count;
++	     desc_idx++) {
++		if (ffa_uuid_are_identical(&ffa_priv_data.partitions.descs[desc_idx].=
UUID,
++					   part_uuid)) {
++			ffa_info("Partition ID %x matches the provided UUID",
++				 ffa_priv_data.partitions.descs[desc_idx].info.id);
++
++			parts_found++;
++
++			if (fill_data) {
++				/*
++				 * trying to fill the partition info in data1
++				 */
++
++				if (client_desc_idx < client_desc_max_cnt) {
++					((struct ffa_partition_info *)
++					 func_data->data1)[client_desc_idx++] =3D
++						ffa_priv_data.partitions.descs[desc_idx].info;
++					continue;
++				}
++
++				ffa_err("Failed to fill the current descriptor client buffer full")=
;
++				return -ENOBUFS;
++			}
++		}
++	}
++
++	if (!parts_found) {
++		int ret;
++
++		ffa_info("No partition found. Querying framework ...");
++
++		ret =3D ffa_query_partitions_info(part_uuid, &parts_found);
++
++		if (ret =3D=3D FFA_ERR_STAT_SUCCESS) {
++			if (!fill_data) {
++				*((u32 *)func_data->data1) =3D parts_found;
++
++				ffa_info("Number of partition(s) found matching the UUID: %d",
++					 parts_found);
++			} else {
++				/*
++				 * we want to read SPs info
++				 */
++
++				/*
++				 * If SPs data filled, retry searching SP info again
++				 */
++				if (parts_found)
++					ret =3D ffa_get_partitions_info(func_data);
++				else
++					ret =3D -ENODATA;
++			}
++		}
++
++		return ret;
++	}
++
++	/* partition(s) found */
++	if (!fill_data)
++		*((u32 *)func_data->data1) =3D parts_found;
++
++	return FFA_ERR_STAT_SUCCESS;
++}
++
++/**
++ * ffa_cache_partitions_info - Queries and saves all secure partitions =
data
++ *
++ * This is a boot time function that invokes FFA_PARTITION_INFO_GET FF-=
A
++ * function to query from secure world all partitions information.
++ *
++ * The FFA_PARTITION_INFO_GET call is issued with nil UUID as an argume=
nt.
++ * All installed partitions information are returned. We cache them in =
the
++ * resident private data structure and we keep the UUID field empty
++ * (in FF-A 1.0 UUID is not provided by the partition descriptor)
++ *
++ * This function is called at the device probing level.
++ * ffa_cache_partitions_info uses ffa_query_partitions_info to get the =
data
++ *
++ * Return:
++ *
++ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
++ */
++static int ffa_cache_partitions_info(void)
++{
++	ffa_dbg("[%s]", __func__);
++	return ffa_query_partitions_info(NULL, NULL);
++}
++
++/**
++ * ffa_msg_send_direct_req - FFA_MSG_SEND_DIRECT_{REQ,RESP} handler fun=
ction
++ * @func_data: Pointer to the FF-A function arguments container structu=
re.
++ *					The passed arguments:
++ *						@data0_size: partition ID size
++ *						@data0: pointer to the partition ID
++ *						@data1_size: exchanged data size
++ *						@data1: pointer to the data buffer preallocated by
++ *								the client (in/out)
++ *
++ * This is the runtime function that implements FFA_MSG_SEND_DIRECT_{RE=
Q,RESP}
++ * FF-A functions.
++ *
++ * FFA_MSG_SEND_DIRECT_REQ is used to send the data to the secure parti=
tion.
++ * The response from the secure partition is handled by reading the
++ * FFA_MSG_SEND_DIRECT_RESP arguments.
++ *
++ * The maximum size of the data that can be exchanged is 20 bytes which=
 is
++ * sizeof(struct ffa_send_direct_data) as defined by the FF-A specifica=
tion 1.0
++ * in the section relevant to FFA_MSG_SEND_DIRECT_{REQ,RESP}
++ *
++ * Return:
++ *
++ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
++ */
++static int __ffa_runtime ffa_msg_send_direct_req(struct ffa_interface_d=
ata
++						 *func_data)
++{
++	u16 dst_part_id;
++	unsigned long a0 =3D 0;
++	unsigned long a1 =3D 0;
++	unsigned long a2 =3D 0;
++	struct ffa_send_direct_data *msg;
++	struct arm_smccc_res res =3D {0};
++
++	ffa_dbg("[%s]", __func__);
++
++	if (!ffa_priv_data.invoke_ffa_fn)
++		panic("[FFA] no private data found\n");
++
++	if (!func_data)
++		return -EINVAL;
++
++	if (!ffa_priv_data.partitions.count || !ffa_priv_data.partitions.descs=
)
++		panic("[FFA] no partition installed\n");
++
++	if (func_data->data0_size !=3D sizeof(u16) ||
++	    !func_data->data0 ||
++	    func_data->data1_size !=3D FFA_MSG_SEND_DIRECT_MAX_SIZE ||
++	    !func_data->data1) {
++		ffa_err("Undefined interface parameters");
++		return -EINVAL;
++	}
++
++	dst_part_id =3D *((u16 *)func_data->data0);
++	msg =3D func_data->data1;
++
++	ffa_dbg("Sending data to partition ID 0x%x", dst_part_id);
++
++	a0 =3D FFA_MSG_SEND_DIRECT_REQ;
++
++	a1 =3D PREP_SELF_ENDPOINT_ID(ffa_priv_data.id) |
++		PREP_PART_ENDPOINT_ID(dst_part_id);
++
++	ffa_priv_data.invoke_ffa_fn(a0, a1, a2,
++				    msg->a3,
++				    msg->a4,
++				    msg->a5,
++				    msg->a6,
++				    msg->a7,
++				    &res);
++
++	while (res.a0 =3D=3D FFA_INTERRUPT)
++		ffa_priv_data.invoke_ffa_fn(FFA_RUN, res.a1,
++					    0, 0, 0, 0, 0, 0,
++					    &res);
++
++	switch (res.a0) {
++	case FFA_ERROR:
++	{
++		switch (((int)res.a2)) {
++		case FFA_ERR_STAT_INVALID_PARAMETERS:
++			ffa_err("Invalid endpoint ID or non-zero reserved register");
++			return -EPERM;
++		case FFA_ERR_STAT_ABORTED:
++			panic("[FFA] Message target ran into unexpected error and has aborte=
d\n");
++		case FFA_ERR_STAT_DENIED:
++			panic("[FFA] Callee is not in a state to handle this request\n");
++		case FFA_ERR_STAT_NOT_SUPPORTED:
++			panic("[FFA] This function is not implemented at this FF-A instance\=
n");
++		case FFA_ERR_STAT_BUSY:
++			panic("[FFA] Message target is busy\n");
++		default:
++			panic("[FFA] Undefined error (%d)\n", ((int)res.a2));
++		}
++	}
++	case FFA_SUCCESS:
++
++		ffa_dbg("Message sent with no response");
++		return FFA_ERR_STAT_SUCCESS;
++
++	case FFA_MSG_SEND_DIRECT_RESP:
++
++		ffa_dbg("Message sent with response");
++
++		/*
++		 * extract the 32-bit wide return data
++		 */
++		msg->a3 =3D (u32)res.a3;
++		msg->a4 =3D (u32)res.a4;
++		msg->a5 =3D (u32)res.a5;
++		msg->a6 =3D (u32)res.a6;
++		msg->a7 =3D (u32)res.a7;
++
++		return FFA_ERR_STAT_SUCCESS;
++
++	default:
++		panic("[FFA] Undefined response function (0x%lx)\n", res.a0);
++	}
++}
++
++/**
++ * invoke_ffa_drv_api - The driver dispatcher function
++ * @func_id:	The FF-A function to be used
++ * @func_data:  Pointer to the FF-A function arguments container
++ *					structure. This also includes pointers to the
++ *					returned data needed by clients.
++ * The dispatcher is a runtime function that selects the FF-A function =
handler
++ * based on the input FF-A function ID.
++ * The input arguments are passed to the handler function.
++ *
++ * Return:
++ *
++ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
++ */
++int __ffa_runtime invoke_ffa_drv_api(u32 func_id,
++				     struct ffa_interface_data *func_data)
++{
++	if (!ffa_priv_data.dev)
++		panic("[FFA] no device found\n");
++
++	switch (func_id) {
++	case FFA_PARTITION_INFO_GET:
++		return ffa_get_partitions_info(func_data);
++	case FFA_RXTX_UNMAP:
++		return ffa_unmap_rxtx_buffers();
++	case FFA_MSG_SEND_DIRECT_REQ:
++		return ffa_msg_send_direct_req(func_data);
++	default:
++
++		ffa_err("Undefined FF-A interface (%d)", func_id);
++
++		return -EINVAL;
++	}
++}
++
++/**
++ * ffa_init_private_data - Initialization of the private data
++ * @dev:	the arm_ffa device
++ *
++ * This boot time function reads data from the platform data structure
++ * and populates the private data structure
++ *
++ * Return:
++ *
++ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
++ */
++static int ffa_init_private_data(struct udevice *dev)
++{
++	struct ffa_pdata *pdata =3D dev_get_plat(dev);
++
++	ffa_priv_data.conduit =3D pdata->conduit;
++
++	if (ffa_priv_data.conduit =3D=3D FFA_CONDUIT_SMC) {
++		ffa_priv_data.invoke_ffa_fn =3D arm_ffa_smccc_smc;
++	} else {
++		ffa_err("Undefined FF-A conduit (%d)", ffa_priv_data.conduit);
++		return -EINVAL;
++	}
++
++	ffa_info("Conduit is %s",
++		 ((ffa_priv_data.conduit =3D=3D FFA_CONDUIT_SMC) ?
++		   "SMC" : "NOT SUPPORTED"));
++
++	return FFA_ERR_STAT_SUCCESS;
++}
++
++/**
++ * ffa_probe - The driver probe function
++ * @dev:	the arm_ffa device
++ *
++ * Probing is done at boot time and triggered by the uclass device disc=
overy.
++ * At probe level the following actions are done:
++ *	- initialization of the driver private data structure
++ *	- querying from secure world the FF-A framework version
++ *	- querying from secure world the u-boot endpoint ID
++ *	- querying from secure world the supported features of the specified=
 FF-A calls
++ *	- mapping the RX/TX buffers
++ *	- querying from secure world all the partitions information
++ *
++ * All data queried from secure world is saved in the resident private =
data structure.
++ *
++ * The probe will fail if either FF-A framework is not detected or the
++ * FF-A requests are not behaving correctly. This ensures that the
++ * driver is not installed and its operations are not exported to the c=
lients.
++ * However, once the driver is successfully probed and an FF-A anomaly =
is
++ * detected when clients invoke the driver operations, the driver cause
++ * u-boot to panic because the client would not know what to do in such=
 conditions.
++ *
++ * Return:
++ *
++ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
++ */
++static int ffa_probe(struct udevice *dev)
++{
++	int ret;
++	size_t buf_4k_pages =3D 0;
++
++	ffa_dbg("[%s]: initializing the FF-A driver", __func__);
++
++	ret =3D ffa_init_private_data(dev);
++
++	if (ret !=3D FFA_ERR_STAT_SUCCESS)
++		return ret;
++
++	ret =3D ffa_get_version();
++
++	if (ret !=3D FFA_ERR_STAT_SUCCESS)
++		return ret;
++
++	ret =3D ffa_get_endpoint_id();
++
++	if (ret !=3D FFA_ERR_STAT_SUCCESS)
++		return ret;
++
++	ret =3D ffa_get_rxtx_map_features();
++
++	if (ret !=3D FFA_ERR_STAT_SUCCESS)
++		return ret;
++
++	ret =3D ffa_get_rxtx_buffers_pages_cnt(&buf_4k_pages);
++
++	if (ret !=3D FFA_ERR_STAT_SUCCESS)
++		return ret;
++
++	ret =3D ffa_map_rxtx_buffers(buf_4k_pages);
++
++	if (ret !=3D FFA_ERR_STAT_SUCCESS)
++		return ret;
++
++	ret =3D ffa_cache_partitions_info();
++
++	if (ret !=3D FFA_ERR_STAT_SUCCESS) {
++		ffa_free_rxtx_buffers(buf_4k_pages);
++		return ret;
++	}
++
++	ffa_dbg("[%s]: initialization done", __func__);
++
++	return FFA_ERR_STAT_SUCCESS;
++}
++
++/**
++ * ffa_of_to_plat - Reads the device tree node
++ * @dev:	the arm_ffa device
++ *
++ * This boot time function reads data from the device tree node and pop=
ulates
++ * the platform data structure
++ *
++ * Return:
++ *
++ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
++ */
++static int ffa_of_to_plat(struct udevice *dev)
++{
++	struct ffa_pdata *pdata =3D dev_get_plat(dev);
++	const char *conduit;
++
++	ffa_dbg("[%s]", __func__);
++
++	conduit =3D fdt_getprop(gd->fdt_blob, dev_of_offset(dev), "method", NU=
LL);
++
++	if (strcmp("smc", conduit)) {
++		ffa_err("Unsupported conduit");
++		return -EINVAL;
++	}
++
++	pdata->conduit =3D FFA_CONDUIT_SMC;
++
++	return FFA_ERR_STAT_SUCCESS;
++}
++
++/**
++ * ffa_drv_ops - The driver operations runtime structure
++ * @invoke_func:	The driver dispatcher
++ */
++struct ffa_ops __ffa_runtime_data ffa_drv_ops =3D {
++	.invoke_func =3D invoke_ffa_drv_api
++};
++
++/**
++ * ffa_device_get_ops - driver operations getter
++ *
++ * Return:
++ * This runtime function returns a pointer to the driver operations str=
ucture
++ */
++const struct ffa_ops * __ffa_runtime ffa_device_get_ops(void)
++{
++	return &ffa_drv_ops;
++}
++
++/**
++ * Defining the device tree compatible string
++ */
++
++static const struct udevice_id ffa_match_id[] =3D {
++	{"arm,ffa", 0},
++	{},
++};
++
++/**
++ * Declaring the arm_ffa driver under UCLASS_FFA
++ */
++
++U_BOOT_DRIVER(arm_ffa) =3D {
++	.name		=3D "arm_ffa",
++	.of_match	=3D ffa_match_id,
++	.id		=3D UCLASS_FFA,
++	.of_to_plat	=3D ffa_of_to_plat,
++	.probe		=3D ffa_probe,
++	.plat_auto	=3D sizeof(struct ffa_pdata),
++};
+diff --git a/include/arm_ffa.h b/include/arm_ffa.h
+new file mode 100644
+index 0000000000..313f46f747
+--- /dev/null
++++ b/include/arm_ffa.h
+@@ -0,0 +1,191 @@
++/* SPDX-License-Identifier: GPL-2.0+ */
++/*
++ * (C) Copyright 2021 ARM Limited
++ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ */
++
++#ifndef __ARM_FFA_H
++#define __ARM_FFA_H
++
++#include <linux/arm-smccc.h>
++#include <linux/printk.h>
++
++/*
++ * This header is public. It can be used by clients to access
++ * data structures and definitions they need
++ */
++
++/*
++ * Macros for displaying logs
++ */
++
++#define ffa_dbg(fmt, ...)  pr_debug("[FFA] " fmt "\n", ##__VA_ARGS__)
++#define ffa_info(fmt, ...)  pr_info("[FFA] " fmt "\n", ##__VA_ARGS__)
++#define ffa_err(fmt, ...)  pr_err("[FFA] " fmt "\n", ##__VA_ARGS__)
++
++/*
++ * The driver operations success error code
++ */
++#define FFA_ERR_STAT_SUCCESS				(0)
++
++#if CONFIG_IS_ENABLED(EFI_LOADER)
++
++#include <efi_loader.h>
++
++/*
++ * __ffa_runtime_data and __ffa_runtime - controls whether data/code ar=
e
++ * available after calling the EFI ExitBootServices service.
++ * Data/code tagged with these keywords are resident (available at boot=
 time and
++ * at runtime)
++ */
++
++#define __ffa_runtime_data __efi_runtime_data
++#define __ffa_runtime __efi_runtime
++
++#else
++
++#define __ffa_runtime_data
++#define __ffa_runtime
++
++#endif
++
++/*
++ * Definitions of the Arm FF-A interfaces supported by the Arm FF-A dri=
ver
++ */
++
++#define FFA_SMC(calling_convention, func_num)				\
++	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, (calling_convention),	\
++			   ARM_SMCCC_OWNER_STANDARD, (func_num))
++
++#define FFA_SMC_32(func_num)	FFA_SMC(ARM_SMCCC_SMC_32, (func_num))
++
++#define FFA_VERSION				FFA_SMC_32(0x63)
++#define FFA_ID_GET				FFA_SMC_32(0x69)
++#define FFA_FEATURES				FFA_SMC_32(0x64)
++#define FFA_PARTITION_INFO_GET				FFA_SMC_32(0x68)
++#define FFA_RXTX_MAP				FFA_SMC_32(0x66)
++#define FFA_RXTX_UNMAP				FFA_SMC_32(0x67)
++#define FFA_RX_RELEASE				FFA_SMC_32(0x65)
++#define FFA_MSG_SEND_DIRECT_REQ				FFA_SMC_32(0x6F)
++#define FFA_MSG_SEND_DIRECT_RESP				FFA_SMC_32(0x70)
++#define FFA_RUN				FFA_SMC_32(0x6D)
++#define FFA_ERROR				FFA_SMC_32(0x60)
++#define FFA_SUCCESS				FFA_SMC_32(0x61)
++#define FFA_INTERRUPT				FFA_SMC_32(0x62)
++
++/*
++ * struct ffa_partition_info - Partition information descriptor
++ * @id:	Partition ID
++ * @exec_ctxt:	Execution context count
++ * @properties:	Partition properties
++ *
++ * Data structure containing information about partitions instantiated =
in the system
++ * This structure is filled with the data queried by FFA_PARTITION_INFO=
_GET
++ */
++struct  __packed ffa_partition_info {
++	u16 id;
++	u16 exec_ctxt;
++/* partition supports receipt of direct requests */
++#define FFA_PARTITION_DIRECT_RECV	BIT(0)
++/* partition can send direct requests. */
++#define FFA_PARTITION_DIRECT_SEND	BIT(1)
++/* partition can send and receive indirect messages. */
++#define FFA_PARTITION_INDIRECT_MSG	BIT(2)
++	u32 properties;
++};
++
++/*
++ * struct ffa_send_direct_data - Data structure hosting the data
++ *                                       used by FFA_MSG_SEND_DIRECT_{R=
EQ,RESP}
++ * @a3-a7:	Data read/written from/to w3-w7 registers
++ *
++ * Data structure containing the data to be sent by FFA_MSG_SEND_DIRECT=
_REQ
++ * or read from FFA_MSG_SEND_DIRECT_RESP
++ */
++struct __packed ffa_send_direct_data {
++	u32 a3; /* w3 */
++	u32 a4; /* w4 */
++	u32 a5; /* w5 */
++	u32 a6; /* w6 */
++	u32 a7; /* w7 */
++};
++
++#define FFA_MSG_SEND_DIRECT_MAX_SIZE (sizeof(struct ffa_send_direct_dat=
a))
++
++/* UUID data size */
++#define UUID_SIZE (16)
++
++/*
++ * union ffa_partition_uuid - Data union hosting the UUID
++ *							transmitted by FFA_PARTITION_INFO_GET
++ * @words:	data structure giving 32-bit words access to the UUID data
++ * @bytes:	data structure giving byte access to the UUID data
++ *
++ * The structure holds little-endian UUID data.
++ */
++union ffa_partition_uuid {
++	struct __packed words {
++	u32 a1; /* w1 */
++	u32 a2; /* w2 */
++	u32 a3; /* w3 */
++	u32 a4; /* w4 */
++	} words;
++	u8 bytes[UUID_SIZE];
++};
++
++/**
++ * struct ffa_interface_data - generic FF-A interface data structure us=
ed to exchange
++ *							data between user layers and the driver
++ * @data0_size:	size of the first argument
++ * @data0:	pointer to the first argument
++ * @data1_size>:	size of the second argument
++ * @data1:	pointer to the second argument
++ *
++ * Using this structure user layers can pass various types of data with=
 different sizes.
++ * The driver internal functions can detect the nature of this data, ve=
rfy compliance
++ * then execute the request when appropriate.
++ */
++struct ffa_interface_data {
++	u32 data0_size; /* size of the first argument */
++	void *data0; /* pointer to the first argument */
++	u32 data1_size; /* size of the second argument */
++	void *data1; /* pointer to the second argument */
++};
++
++/**
++ * struct ffa_ops - The driver operations structure
++ * @invoke_func:	function pointer to the invoke function
++ *
++ * The data structure providing all the operations supported by the dri=
ver.
++ * This structure is resident.
++ */
++struct ffa_ops {
++	/* the driver dispatcher */
++	int (*invoke_func)(u32 func_id, struct ffa_interface_data *func_data);
++};
++
++/**
++ * The device driver and the Uclass driver public functions
++ */
++
++/**
++ * ffa_get_invoke_func - performs a call to the FF-A driver dispatcher
++ */
++int __ffa_runtime ffa_get_invoke_func(u32 func_id,
++				      struct ffa_interface_data *func_data);
++
++/**
++ * ffa_device_get_ops - driver operations getter
++ */
++const struct ffa_ops * __ffa_runtime ffa_device_get_ops(void);
++
++/**
++ * ffa_get_device - probes the arm_ffa device
++ */
++int ffa_get_device(void);
++
++/**
++ * ffa_init_device - probes the arm_ffa device
++ */
++int ffa_init_device(void);
++#endif
+diff --git a/include/arm_ffa_helper.h b/include/arm_ffa_helper.h
+new file mode 100644
+index 0000000000..0e143e5451
+--- /dev/null
++++ b/include/arm_ffa_helper.h
+@@ -0,0 +1,45 @@
++/* SPDX-License-Identifier: GPL-2.0+ */
++/*
++ * (C) Copyright 2021 ARM Limited
++ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ */
++
++#ifndef __ARM_FFA_HELPER_H
++#define __ARM_FFA_HELPER_H
++
++#include <arm_ffa.h>
++
++/*
++ * This header is public. Including this header provides all data struc=
tures
++ * and definitions needed by clients to use the FF-A transport driver
++ *
++ * It also provides helper functions allowing to pass data and invoke  =
FF-A functions
++ */
++
++/**
++ * ffa_helper_get_partitions_info - Wrapper function for FFA_PARTITION_=
INFO_GET
++ */
++int ffa_helper_get_partitions_info(struct ffa_interface_data *func_data=
);
++
++/**
++ * ffa_helper_unmap_rxtx_buffers - Wrapper function for FFA_RXTX_UNMAP
++ */
++int ffa_helper_unmap_rxtx_buffers(void);
++
++/**
++ * ffa_helper_msg_send_direct_req - Wrapper function for
++ *								FFA_MSG_SEND_DIRECT_{REQ,RESP}
++ */
++int __ffa_runtime ffa_helper_msg_send_direct_req(struct ffa_interface_d=
ata
++						 *func_data);
++
++/**
++ * ffa_helper_init_device - Wrapper function for probing the arm_ffa de=
vice
++ */
++int ffa_helper_init_device(void);
++
++/**
++ * ffa_uuid_str_to_bin - Converts a big endian UUID string to a little =
endian buffer
++ */
++int ffa_uuid_str_to_bin(const char *uuid_str, unsigned char *uuid_bin);
++#endif
+diff --git a/include/dm/uclass-id.h b/include/dm/uclass-id.h
+index 0e26e1d138..a1181b8f48 100644
+--- a/include/dm/uclass-id.h
++++ b/include/dm/uclass-id.h
+@@ -52,6 +52,7 @@ enum uclass_id {
+ 	UCLASS_EFI_MEDIA,	/* Devices provided by UEFI firmware */
+ 	UCLASS_ETH,		/* Ethernet device */
+ 	UCLASS_ETH_PHY,		/* Ethernet PHY device */
++	UCLASS_FFA,		/* Arm Firmware Framework for Armv8-A */
+ 	UCLASS_FIRMWARE,	/* Firmware */
+ 	UCLASS_FS_FIRMWARE_LOADER,		/* Generic loader */
+ 	UCLASS_GPIO,		/* Bank of general-purpose I/O pins */
+diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
+index 7f2be23394..54980a130f 100644
+--- a/include/linux/arm-smccc.h
++++ b/include/linux/arm-smccc.h
+@@ -1,6 +1,8 @@
+ /* SPDX-License-Identifier: GPL-2.0 */
+ /*
+  * Copyright (c) 2015, Linaro Limited
++ * (C) Copyright 2021 ARM Limited
++ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+  */
+ #ifndef __LINUX_ARM_SMCCC_H
+ #define __LINUX_ARM_SMCCC_H
+@@ -57,13 +59,17 @@
+ #include <linux/types.h>
+ /**
+  * struct arm_smccc_res - Result from SMC/HVC call
+- * @a0-a3 result values from registers 0 to 3
++ * @a0-a7 result values from registers 0 to 7
+  */
+ struct arm_smccc_res {
+ 	unsigned long a0;
+ 	unsigned long a1;
+ 	unsigned long a2;
+ 	unsigned long a3;
++	unsigned long a4;
++	unsigned long a5;
++	unsigned long a6;
++	unsigned long a7;
+ };
+=20
+ /**
+@@ -113,6 +119,26 @@ asmlinkage void __arm_smccc_hvc(unsigned long a0, u=
nsigned long a1,
+ 			unsigned long a5, unsigned long a6, unsigned long a7,
+ 			struct arm_smccc_res *res, struct arm_smccc_quirk *quirk);
+=20
++#if (IS_ENABLED(CONFIG_ARM_FFA_TRANSPORT))
++/**
++ * __arm_ffa_smccc_smc() - make SMC calls used for FF-A transport
++ * @a0-a7: arguments passed in 64-bit registers x0 to x7
++ * @res: result values from 64-bit registers x0 to x7
++ *
++ * This function is used to make SMC calls following SMC32 Calling Conv=
ention.
++ * The content of the supplied parameters is copied to registers x0 to =
x7 prior
++ * to the SMC instruction. The SMC call return data is 32-bit data read=
 from
++ * registers x0 tp x7.
++ */
++asmlinkage void __arm_ffa_smccc_smc(unsigned long a0, unsigned long a1,
++				    unsigned long a2, unsigned long a3, unsigned long a4,
++				    unsigned long a5, unsigned long a6, unsigned long a7,
++				    struct arm_smccc_res *res);
++
++#define arm_ffa_smccc_smc __arm_ffa_smccc_smc
++
++#endif
++
+ #define arm_smccc_smc(...) __arm_smccc_smc(__VA_ARGS__, NULL)
+=20
+ #define arm_smccc_smc_quirk(...) __arm_smccc_smc(__VA_ARGS__)
+diff --git a/lib/Kconfig b/lib/Kconfig
+index 3c6fa99b1a..473821b882 100644
+--- a/lib/Kconfig
++++ b/lib/Kconfig
+@@ -810,6 +810,7 @@ config SMBIOS_PARSER
+ source lib/efi/Kconfig
+ source lib/efi_loader/Kconfig
+ source lib/optee/Kconfig
++source lib/arm-ffa/Kconfig
+=20
+ config TEST_FDTDEC
+ 	bool "enable fdtdec test"
+diff --git a/lib/Makefile b/lib/Makefile
+index 11b03d1cbe..8e6fad6130 100644
+--- a/lib/Makefile
++++ b/lib/Makefile
+@@ -9,6 +9,7 @@ obj-$(CONFIG_EFI) +=3D efi/
+ obj-$(CONFIG_EFI_LOADER) +=3D efi_driver/
+ obj-$(CONFIG_EFI_LOADER) +=3D efi_loader/
+ obj-$(CONFIG_CMD_BOOTEFI_SELFTEST) +=3D efi_selftest/
++obj-$(CONFIG_ARM_FFA_TRANSPORT_HELPERS) +=3D arm-ffa/
+ obj-$(CONFIG_LZMA) +=3D lzma/
+ obj-$(CONFIG_BZIP2) +=3D bzip2/
+ obj-$(CONFIG_TIZEN) +=3D tizen/
+diff --git a/lib/arm-ffa/Kconfig b/lib/arm-ffa/Kconfig
+new file mode 100644
+index 0000000000..79acbc5a8f
+--- /dev/null
++++ b/lib/arm-ffa/Kconfig
+@@ -0,0 +1,6 @@
++config ARM_FFA_TRANSPORT_HELPERS
++	bool "Enable interface helpers for Arm Firmware Framework for Armv8-A"
++	depends on ARM_FFA_TRANSPORT
++	help
++	  User layers call FF-A interfaces using helper functions which
++	  pass the data and the FF-A function ID to the low level driver
+diff --git a/lib/arm-ffa/Makefile b/lib/arm-ffa/Makefile
+new file mode 100644
+index 0000000000..c30c0f3981
+--- /dev/null
++++ b/lib/arm-ffa/Makefile
+@@ -0,0 +1,8 @@
++# SPDX-License-Identifier: GPL-2.0+
++#
++# (C) Copyright 2021 Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++#
++
++# This file only gets included when CONFIG_ARM_FFA_TRANSPORT_HELPERS is=
 set
++
++obj-y +=3D arm_ffa_helper.o
+diff --git a/lib/arm-ffa/arm_ffa_helper.c b/lib/arm-ffa/arm_ffa_helper.c
+new file mode 100644
+index 0000000000..623899d380
+--- /dev/null
++++ b/lib/arm-ffa/arm_ffa_helper.c
+@@ -0,0 +1,188 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * (C) Copyright 2021 ARM Limited
++ * Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
++ */
++
++#include <common.h>
++#include <arm_ffa_helper.h>
++#include <uuid.h>
++
++/**
++ * ffa_helper_get_partitions_info - Wrapper function for FFA_PARTITION_=
INFO_GET
++ *
++ * @func_data: Pointer to the FF-A function arguments container
++ *				structure.
++ *				The passed arguments:
++ *					Mode 1: When getting from the driver the number of
++ *						secure partitions:
++ *						@data0_size: UUID size
++ *						@data0: pointer to the UUID (little endian)
++ *						@data1_size: size of the number of partitions
++ *									variable
++ *						@data1: pointer to the number of partitions
++ *								 variable. The variable will be set
++ *								 by the driver
++ *					Mode 2: When requesting the driver to return the
++ *						partitions information:
++ *						@data0_size: UUID size
++ *						@data0: pointer to the UUID (little endian)
++ *						@data1_size: size of the SPs information buffer
++ *						@data1: pointer to SPs information buffer
++ *								(allocated by the client).
++ *							The buffer will be filled by the driver
++ *
++ * This is the boot time function used by clients who wants to get from=
 secure
++ * world the partition(s) information.
++ *
++ * A client of the FF-A driver should know the UUID of the service it w=
ants to
++ * access. It should use the UUID to request the FF-A driver to provide=
 the
++ * partition(s) information of the service. The client should use
++ * ffa_helper_get_partitions_info to pass the UUID information to the d=
river
++ * which uses PARTITION_INFO_GET to obtain the partition(s) information=
.
++ *
++ * ffa_helper_get_partitions_info should be called twice. First call is=
 to get
++ * from the driver the number of secure partitions (SPs) associated to =
a
++ * particular UUID. Then, the caller (client) allocates the buffer to h=
ost the
++ * SPs data and issues a 2nd call. Then, the driver fills the SPs data =
in the
++ * pre-allocated buffer.
++ *
++ * Return:
++ *
++ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
++ */
++int ffa_helper_get_partitions_info(struct ffa_interface_data *func_data=
)
++{
++	return ffa_get_invoke_func(FFA_PARTITION_INFO_GET, func_data);
++}
++
++/**
++ * ffa_helper_unmap_rxtx_buffers - Wrapper function for FFA_RXTX_UNMAP
++ *
++ * This is the boot time function that allows clients to unmap the RX/T=
X
++ * buffers
++ *
++ * Return:
++ *
++ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
++ */
++int ffa_helper_unmap_rxtx_buffers(void)
++{
++	return ffa_get_invoke_func(FFA_RXTX_UNMAP, NULL);
++}
++
++/**
++ * ffa_helper_msg_send_direct_req - Wrapper function for
++ *								FFA_MSG_SEND_DIRECT_{REQ,RESP}
++ * @func_data: Pointer to the FF-A function arguments container structu=
re.
++ * The passed arguments:
++ *	@data0_size: partition ID size
++ *	@data0: pointer to the partition ID
++ *	@data1_size: exchanged data size
++ *	@data1: pointer to the data buffer preallocated by the client (in/ou=
t)
++ *
++ * This is the runtime function that allows clients to send data to the=
 secure
++ * world partitions. The arm_ffa driver uses FFA_MSG_SEND_DIRECT_REQ to=
 send the
++ * data to the secure partition. The response from the secure partition=
 is
++ * handled internally by the driver using FFA_MSG_SEND_DIRECT_RESP and =
returned
++ * to ffa_helper_msg_send_direct_req through @func_data
++ *
++ * The maximum size of the data that can be exchanged is 20 bytes which=
 is
++ * sizeof(struct ffa_send_direct_data) as defined by the FF-A specifica=
tion 1.0
++ * in the section relevant to FFA_MSG_SEND_DIRECT_{REQ,RESP}
++ *
++ * The client should pre-allocate a buffer pointed by @data1 which the =
size
++ * is sizeof(struct ffa_send_direct_data)
++ *
++ * Return:
++ *
++ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
++ */
++int __ffa_runtime ffa_helper_msg_send_direct_req(struct ffa_interface_d=
ata
++											 *func_data)
++{
++	return ffa_get_invoke_func(FFA_MSG_SEND_DIRECT_REQ, func_data);
++}
++
++/**
++ * ffa_helper_init_device - Wrapper function for probing the arm_ffa de=
vice
++ *
++ * This boot time function should be called to probe the arm_ffa device=
 so
++ * it becomes ready for use.
++ * To achieve that, this function is called automatically at initcalls
++ * level (after u-boot relocation).
++ *
++ * Return:
++ *
++ * FFA_ERR_STAT_SUCCESS on success. Otherwise, failure
++ */
++int ffa_helper_init_device(void)
++{
++	return ffa_init_device();
++}
++
++/**
++ * ffa_uuid_str_to_bin - Converts a big endian UUID string to a little =
endian buffer
++ * @uuid_str:	UUID string in big endian format (36 bytes wide + '/0')
++ * @uuid_bin:	preallocated 16 bytes UUID buffer in little endian format
++ *
++ * UUID binary format used by the FF-A framework (16 bytes):
++ *
++ * [LSB] 4B-2B-2B-2B-6B (little endian data fields)
++ *
++ * UUID string is 36 length of characters (36 bytes):
++ *
++ * xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
++ * be                be      be       be      be
++ *
++ * where x is a hexadecimal character. Fields are separated by '-'s.
++ * When converting to a binary UUID, these endianness rules apply:
++ *     be: means the field in the string is considered a big endian hex=
 number
++ *         and should be converted to little endian binary format
++ *
++ * Return:
++ *
++ *    uuid_bin filled with little endian UUID data
++ *    On success 0 is returned. Otherwise, failure code.
++ */
++int ffa_uuid_str_to_bin(const char *uuid_str, unsigned char *uuid_bin)
++{
++	u16 tmp16 =3D 0;
++	u32 tmp32 =3D 0;
++	u64 tmp64 =3D 0;
++
++	if (!uuid_str_valid(uuid_str) || !uuid_bin)
++		return -EINVAL;
++
++	/*
++	 * reverse bytes from big to little endian
++	 */
++	tmp32 =3D simple_strtoul(uuid_str, NULL, 16);
++	memcpy(uuid_bin, &tmp32, 4);
++
++	/*
++	 * reverse bytes from big to little endian
++	 */
++	tmp16 =3D simple_strtoul(uuid_str + 9, NULL, 16);
++	memcpy(uuid_bin + 4, &tmp16, 2);
++
++	/*
++	 * reverse bytes from big to little endian
++	 */
++	tmp16 =3D simple_strtoul(uuid_str + 14, NULL, 16);
++	memcpy(uuid_bin + 6, &tmp16, 2);
++
++	/*
++	 * reverse bytes from big to little endian
++	 */
++	tmp16 =3D simple_strtoul(uuid_str + 19, NULL, 16);
++	memcpy(uuid_bin + 8, &tmp16, 2);
++
++	/*
++	 * reverse bytes from big to little endian
++	 */
++	tmp64 =3D simple_strtoull(uuid_str + 24, NULL, 16);
++	memcpy(uuid_bin + 10, (char *)&tmp64, 6);
++
++	return 0;
++}
+diff --git a/lib/efi_loader/efi_boottime.c b/lib/efi_loader/efi_boottime=
.c
+index 5bcb8253ed..cffa2c69d6 100644
+--- a/lib/efi_loader/efi_boottime.c
++++ b/lib/efi_loader/efi_boottime.c
+@@ -23,6 +23,10 @@
+ #include <asm/setjmp.h>
+ #include <linux/libfdt_env.h>
+=20
++#if defined(CONFIG_ARM_FFA_TRANSPORT)
++#include <arm_ffa_helper.h>
++#endif
++
+ DECLARE_GLOBAL_DATA_PTR;
+=20
+ /* Task priority level */
+@@ -2114,6 +2118,10 @@ static efi_status_t EFIAPI efi_exit_boot_services=
(efi_handle_t image_handle,
+ 	struct efi_event *evt, *next_event;
+ 	efi_status_t ret =3D EFI_SUCCESS;
+=20
++#if defined(CONFIG_ARM_FFA_TRANSPORT)
++	int ffa_ret;
++#endif
++
+ 	EFI_ENTRY("%p, %zx", image_handle, map_key);
+=20
+ 	/* Check that the caller has read the current memory map */
+@@ -2174,6 +2182,15 @@ static efi_status_t EFIAPI efi_exit_boot_services=
(efi_handle_t image_handle,
+ 		dm_remove_devices_flags(DM_REMOVE_ACTIVE_ALL);
+ 	}
+=20
++#if defined(CONFIG_ARM_FFA_TRANSPORT)
++	/* unmap FF-A RX/TX buffers */
++	ffa_ret =3D ffa_helper_unmap_rxtx_buffers();
++	if (ffa_ret)
++		debug("[efi_boottime][ERROR]: can not unmap FF-A RX/TX buffers\n");
++	else
++		debug("[efi_boottime][INFO]: FF-A RX/TX buffers unmapped\n");
++#endif
++
+ 	/* Patch out unsupported runtime function */
+ 	efi_runtime_detach();
+=20
+--=20
+2.34.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/tc/0003-arm-total_com=
pute-enable-psci.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/tc/0003-a=
rm-total_compute-enable-psci.patch
new file mode 100644
index 00000000..da8d3f00
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/tc/0003-arm-total_compute-en=
able-psci.patch
@@ -0,0 +1,30 @@
+From 8dd3e03bd83939746b6a849dce37435ea7581032 Mon Sep 17 00:00:00 2001
+From: Davidson K <davidson.kumaresan@arm.com>
+Date: Thu, 14 Jul 2022 19:35:41 +0530
+Subject: [PATCH 3/7] arm: total_compute: enable psci
+
+psci is used for system reset
+
+Signed-off-by: Davidson K <davidson.kumaresan@arm.com>
+Change-Id: Iff4f769dc5e64b6000e892d77a011102b090acfd
+Upstream-Status: Submitted [https://patchwork.ozlabs.org/project/uboot/p=
atch/20220809102652.23776-1-davidson.kumaresan@arm.com/]
+---
+ arch/arm/dts/total_compute.dts | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/arch/arm/dts/total_compute.dts b/arch/arm/dts/total_compute=
.dts
+index 4399269a44..96edacda0b 100644
+--- a/arch/arm/dts/total_compute.dts
++++ b/arch/arm/dts/total_compute.dts
+@@ -45,4 +45,8 @@
+ 		clock-frequency =3D <24000000>;
+ 		clock-output-names =3D "bp:clock24mhz";
+ 	};
++	psci {
++		compatible =3D "arm,psci-1.0", "arm,psci-0.2";
++		method =3D "smc";
++	};
+ };
+--=20
+2.34.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/tc/0004-arm_ffa-rxtx_=
map-should-use-64-bit-calls.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boo=
t/tc/0004-arm_ffa-rxtx_map-should-use-64-bit-calls.patch
new file mode 100644
index 00000000..fb1e9ea9
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/tc/0004-arm_ffa-rxtx_map-sho=
uld-use-64-bit-calls.patch
@@ -0,0 +1,37 @@
+From 6eee50e5376356b1faeb30507b411120a8b5c7d1 Mon Sep 17 00:00:00 2001
+From: Davidson K <davidson.kumaresan@arm.com>
+Date: Mon, 6 Jun 2022 15:13:15 +0530
+Subject: [PATCH 4/7] arm_ffa: rxtx_map should use 64 bit calls
+
+rxtx_map deals with the 64 bit addresses and hence the 64 bit calls
+should be used
+
+Signed-off-by: Davidson K <davidson.kumaresan@arm.com>
+Change-Id: Iec1251266e61139767588d683d60bada1ed10abe
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ include/arm_ffa.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/include/arm_ffa.h b/include/arm_ffa.h
+index 313f46f747..9627107079 100644
+--- a/include/arm_ffa.h
++++ b/include/arm_ffa.h
+@@ -58,12 +58,13 @@
+ 			   ARM_SMCCC_OWNER_STANDARD, (func_num))
+=20
+ #define FFA_SMC_32(func_num)	FFA_SMC(ARM_SMCCC_SMC_32, (func_num))
++#define FFA_SMC_64(func_num)	FFA_SMC(ARM_SMCCC_SMC_64, (func_num))
+=20
+ #define FFA_VERSION				FFA_SMC_32(0x63)
+ #define FFA_ID_GET				FFA_SMC_32(0x69)
+ #define FFA_FEATURES				FFA_SMC_32(0x64)
+ #define FFA_PARTITION_INFO_GET				FFA_SMC_32(0x68)
+-#define FFA_RXTX_MAP				FFA_SMC_32(0x66)
++#define FFA_RXTX_MAP				FFA_SMC_64(0x66)
+ #define FFA_RXTX_UNMAP				FFA_SMC_32(0x67)
+ #define FFA_RX_RELEASE				FFA_SMC_32(0x65)
+ #define FFA_MSG_SEND_DIRECT_REQ				FFA_SMC_32(0x6F)
+--=20
+2.34.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/tc/0005-efi_firmware-=
add-new-fmp-driver-that-supports-arm-fw.patch b/meta-arm-bsp/recipes-bsp/=
u-boot/u-boot/tc/0005-efi_firmware-add-new-fmp-driver-that-supports-arm-f=
w.patch
new file mode 100644
index 00000000..159b048a
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/tc/0005-efi_firmware-add-new=
-fmp-driver-that-supports-arm-fw.patch
@@ -0,0 +1,993 @@
+From 6d26058401bce6012173b5341cdf4de72772a1c2 Mon Sep 17 00:00:00 2001
+From: Davidson K <davidson.kumaresan@arm.com>
+Date: Mon, 6 Jun 2022 13:19:07 +0530
+Subject: [PATCH 5/7] efi_firmware: add new fmp driver that supports arm =
fwu
+ specification
+
+This fmp driver communicates to the firmware update secure partition
+executing in the secure world which is an implementation of the arm
+psa specification for the firmware update. The communication to the
+firmware update secure partition is based on stmm and arm ff-a framework=
.
+
+It implements only the get_image_info and set_image api.
+
+Signed-off-by: Davidson K <davidson.kumaresan@arm.com>
+Change-Id: I94c2cad210c32a60a8a0594cacf530b68ab6a09d
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ include/efi_firmware_arm_psa.h        | 218 +++++++++++
+ include/efi_loader.h                  |   1 +
+ lib/efi_loader/Kconfig                |   9 +
+ lib/efi_loader/Makefile               |   1 +
+ lib/efi_loader/efi_capsule.c          |   8 +
+ lib/efi_loader/efi_firmware.c         | 134 +++++++
+ lib/efi_loader/efi_firmware_arm_psa.c | 520 ++++++++++++++++++++++++++
+ 7 files changed, 891 insertions(+)
+ create mode 100644 include/efi_firmware_arm_psa.h
+ create mode 100644 lib/efi_loader/efi_firmware_arm_psa.c
+
+diff --git a/include/efi_firmware_arm_psa.h b/include/efi_firmware_arm_p=
sa.h
+new file mode 100644
+index 0000000000..82f932066c
+--- /dev/null
++++ b/include/efi_firmware_arm_psa.h
+@@ -0,0 +1,218 @@
++/* SPDX-License-Identifier: GPL-2.0+ */
++/*
++ * Copyright (C) 2022 Arm Limited
++ */
++
++#ifndef _EFI_FIRMWARE_ARM_PSA_H
++#define _EFI_FIRMWARE_ARM_PSA_H
++
++#include <efi_loader.h>
++#include <mm_communication.h>
++#include <stdint.h>
++
++#define PSA_FWU_DIRECTORY_UUID \
++	EFI_GUID(0xdeee58d9, 0x5147, 0x4ad3, \
++		 0xa2, 0x90, 0x77, 0x66, 0x6e, 0x23, 0x41, 0xa5)
++
++#define PSA_FWU_SP_UUID \
++	EFI_GUID(0x6823a838, 0x1b06, 0x470e, \
++		 0x97, 0x74, 0x0c, 0xce, 0x8b, 0xfb, 0x53, 0xfd)
++
++#define FFA_FWU_SP_UUID \
++	{0x68, 0x23, 0xa8, 0x38, 0x1b, 0x06, 0x47, \
++		0x0e, 0x97, 0x74, 0x0c, 0xce, 0x8b, 0xfb, 0x53, 0xfd}
++
++#define FWU_DISCOVER		0
++#define FWU_BEGIN_STAGING	1
++#define FWU_END_STAGING 	2
++#define FWU_CANCEL_STAGING	3
++#define FWU_OPEN		4
++#define FWU_WRITE_STREAM	5
++#define FWU_READ_STREAM 	6
++#define FWU_COMMIT		7
++#define FWU_ACCEPT_IMAGE	9
++#define FWU_SELECT_PREVIOUS	10
++
++#define FWU_SUCCESS		0
++#define FWU_UNKNOWN		((int32_t)-1)
++#define FWU_BUSY		((int32_t)-2)
++#define FWU_OUT_OF_BOUNDS	((int32_t)-3)
++#define FWU_AUTH_FAIL		((int32_t)-4)
++#define FWU_NO_PERMISSION	((int32_t)-5)
++#define FWU_DENIED		((int32_t)-6)
++#define FWU_RESUME		((int32_t)-7)
++
++#define MAX_IMAGES		5
++
++typedef int32_t fwu_status_t;
++
++struct fwu_image_info_entry {
++	efi_guid_t image_guid;
++	uint32_t client_permissions;
++	uint32_t img_max_size;
++	uint32_t lowest_acceptable_version;
++	uint32_t img_version;
++	uint32_t accepted;
++	uint32_t reserved;
++}__packed;
++
++struct fwu_image_directory {
++	uint32_t directory_version;
++	uint32_t num_images;
++	uint32_t active_index;
++	uint32_t boot_index;
++	struct fwu_image_info_entry entries[MAX_IMAGES];
++}__packed;
++
++int __efi_runtime arm_psa_get_image_info(
++	efi_uintn_t *image_info_size,
++	struct efi_firmware_image_descriptor *image_info,
++	u32 *descriptor_version,
++	u8 *descriptor_count,
++	efi_uintn_t *descriptor_size,
++	u32 *package_version,
++	u16 **package_version_name
++);
++
++int __efi_runtime arm_psa_update(
++	const void *image,
++	u8 image_index,
++	efi_uintn_t image_size
++);
++
++struct mm_fwu_discover_arg {
++	uint32_t func_id;
++}__packed;
++
++struct mm_fwu_discover_ret {
++	uint32_t status;
++	uint8_t version_major;
++	uint8_t version_minor;
++	uint16_t num_func;
++	uint8_t function_presence[];
++}__packed;
++
++struct mm_fwu_begin_staging_arg {
++	uint32_t func_id;
++}__packed;
++
++struct mm_fwu_begin_staging_ret {
++	uint32_t status;
++}__packed;
++
++struct mm_fwu_end_staging_arg {
++	uint32_t func_id;
++}__packed;
++
++struct mm_fwu_end_staging_ret {
++	uint32_t status;
++}__packed;
++
++struct mm_fwu_cancel_staging_arg {
++	uint32_t func_id;
++}__packed;
++
++struct mm_fwu_cancel_staging_ret {
++	uint32_t status;
++}__packed;
++
++struct mm_fwu_open_arg {
++	uint32_t func_id;
++	efi_guid_t image_guid;
++}__packed;
++
++struct mm_fwu_open_ret {
++	uint32_t status;
++	uint32_t handle;
++}__packed;
++
++struct mm_fwu_write_stream_arg {
++	uint32_t func_id;
++	uint32_t handle;
++	uint32_t data_len;
++	uint8_t payload[];
++}__packed;
++
++struct mm_fwu_write_stream_ret {
++	uint32_t status;
++};
++
++struct mm_fwu_read_stream_arg {
++	uint32_t func_id;
++	uint32_t handle;
++}__packed;
++
++struct mm_fwu_read_stream_ret {
++	uint32_t status;
++	uint32_t read_bytes;
++	uint32_t total_bytes;
++	uint8_t payload[];
++}__packed;
++
++struct mm_fwu_commit_arg {
++	uint32_t func_id;
++	uint32_t handle;
++	uint32_t acceptance_req;
++	uint32_t max_atomic_len;
++}__packed;
++
++struct mm_fwu_commit_ret {
++	uint32_t status;
++	uint32_t progress;
++	uint32_t total_work;
++}__packed;
++
++struct mm_fwu_accept_arg {
++	uint32_t func_id;
++	uint32_t reserved;
++	efi_guid_t image_type_uuid;
++}__packed;
++
++struct mm_fwu_accept_ret {
++	uint32_t status;
++};
++
++struct mm_fwu_select_previous_arg {
++	uint32_t func_id;
++}__packed;
++
++struct mm_fwu_select_previous_ret {
++	uint32_t status;
++}__packed;
++
++inline static void *get_fwu_hdr(struct efi_mm_communicate_header *mm_hd=
r)
++{
++	const efi_guid_t fwu_sp_guid =3D PSA_FWU_SP_UUID;
++	guidcpy(&mm_hdr->header_guid, &fwu_sp_guid);
++	return mm_hdr->data;
++}
++
++#define GET_HDR(name)						\
++static inline struct mm_fwu_##name *				\
++get_fwu_##name (struct efi_mm_communicate_header *mm_hdr)	\
++{								\
++	return (struct mm_fwu_##name *)get_fwu_hdr(mm_hdr);	\
++}								\
++
++GET_HDR(discover_arg)
++GET_HDR(discover_ret)
++GET_HDR(begin_staging_arg)
++GET_HDR(begin_staging_ret)
++GET_HDR(end_staging_arg)
++GET_HDR(end_staging_ret)
++GET_HDR(cancel_staging_arg)
++GET_HDR(cancel_staging_ret)
++GET_HDR(open_arg)
++GET_HDR(open_ret)
++GET_HDR(write_stream_arg)
++GET_HDR(write_stream_ret)
++GET_HDR(read_stream_arg)
++GET_HDR(read_stream_ret)
++GET_HDR(commit_arg)
++GET_HDR(commit_ret)
++GET_HDR(accept_arg)
++GET_HDR(accept_ret)
++GET_HDR(select_previous_arg)
++GET_HDR(select_previous_ret)
++
++#endif /* _EFI_FIRMWARE_ARM_PSA_H */
+diff --git a/include/efi_loader.h b/include/efi_loader.h
+index af36639ec6..7327c87497 100644
+--- a/include/efi_loader.h
++++ b/include/efi_loader.h
+@@ -961,6 +961,7 @@ u16 *efi_create_indexed_name(u16 *buffer, size_t buf=
fer_size, const char *name,
+=20
+ extern const struct efi_firmware_management_protocol efi_fmp_fit;
+ extern const struct efi_firmware_management_protocol efi_fmp_raw;
++extern const struct efi_firmware_management_protocol efi_fmp_arm_psa;
+=20
+ /* Capsule update */
+ efi_status_t EFIAPI efi_update_capsule(
+diff --git a/lib/efi_loader/Kconfig b/lib/efi_loader/Kconfig
+index e5e35fe51f..f99d436f16 100644
+--- a/lib/efi_loader/Kconfig
++++ b/lib/efi_loader/Kconfig
+@@ -168,6 +168,15 @@ config EFI_CAPSULE_FIRMWARE_MANAGEMENT
+ 	  Select this option if you want to enable capsule-based
+ 	  firmware update using Firmware Management Protocol.
+=20
++config EFI_CAPSULE_FIRMWARE_ARM_PSA
++	bool "FMP driver for ARM PSA FWU specification"
++	depends on EFI_CAPSULE_FIRMWARE_MANAGEMENT
++	select EFI_CAPSULE_FIRMWARE
++	help
++	  Select this option if you want to enable firmware management protoco=
l
++	  driver that supports the ARM PSA firmware update specification as
++	  mentioned in https://developer.arm.com/documentation/den0118/a/
++
+ config EFI_CAPSULE_FIRMWARE_FIT
+ 	bool "FMP driver for FIT images"
+ 	depends on FIT
+diff --git a/lib/efi_loader/Makefile b/lib/efi_loader/Makefile
+index 034d26cf01..f986ac6417 100644
+--- a/lib/efi_loader/Makefile
++++ b/lib/efi_loader/Makefile
+@@ -38,6 +38,7 @@ obj-y +=3D efi_boottime.o
+ obj-y +=3D efi_helper.o
+ obj-$(CONFIG_EFI_HAVE_CAPSULE_SUPPORT) +=3D efi_capsule.o
+ obj-$(CONFIG_EFI_CAPSULE_FIRMWARE) +=3D efi_firmware.o
++obj-$(CONFIG_EFI_CAPSULE_FIRMWARE_ARM_PSA) +=3D efi_firmware_arm_psa.o
+ obj-y +=3D efi_console.o
+ obj-y +=3D efi_device_path.o
+ obj-$(CONFIG_EFI_DEVICE_PATH_TO_TEXT) +=3D efi_device_path_to_text.o
+diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
+index f00440163d..3154fc51d3 100644
+--- a/lib/efi_loader/efi_capsule.c
++++ b/lib/efi_loader/efi_capsule.c
+@@ -1041,6 +1041,14 @@ efi_status_t __weak efi_load_capsule_drivers(void=
)
+ 				&efi_fmp_raw, NULL));
+ 	}
+=20
++	if (IS_ENABLED(CONFIG_EFI_CAPSULE_FIRMWARE_ARM_PSA)) {
++		handle =3D NULL;
++		ret =3D EFI_CALL(efi_install_multiple_protocol_interfaces(
++				&handle,
++				&efi_guid_firmware_management_protocol,
++				&efi_fmp_arm_psa, NULL));
++	}
++
+ 	return ret;
+ }
+=20
+diff --git a/lib/efi_loader/efi_firmware.c b/lib/efi_loader/efi_firmware=
.c
+index a5ff32f121..3356559af8 100644
+--- a/lib/efi_loader/efi_firmware.c
++++ b/lib/efi_loader/efi_firmware.c
+@@ -9,6 +9,7 @@
+ #include <common.h>
+ #include <charset.h>
+ #include <dfu.h>
++#include <efi_firmware_arm_psa.h>
+ #include <efi_loader.h>
+ #include <image.h>
+ #include <signatures.h>
+@@ -478,3 +479,136 @@ const struct efi_firmware_management_protocol efi_=
fmp_raw =3D {
+ 	.set_package_info =3D efi_firmware_set_package_info_unsupported,
+ };
+ #endif /* CONFIG_EFI_CAPSULE_FIRMWARE_RAW */
++
++#ifdef CONFIG_EFI_CAPSULE_FIRMWARE_ARM_PSA
++/*
++ * This FIRMWARE_MANAGEMENT_PROTOCOL driver provides a firmware update
++ * method that supports the arm psa firmware update specification.
++ */
++
++/**
++ * efi_firmware_arm_psa_get_image_info - return information about the
++ * 					 current firmware image
++ * @this:			Protocol instance
++ * @image_info_size:		Size of @image_info
++ * @image_info:			Image information
++ * @descriptor_version:		Pointer to version number
++ * @descriptor_count:		Pointer to number of descriptors
++ * @descriptor_size:		Pointer to descriptor size
++ * package_version:		Package version
++ * package_version_name:	Package version's name
++ *
++ * Return information bout the current firmware image in @image_info.
++ * @image_info will consist of a number of descriptors.
++ *
++ * Return		status code
++ */
++
++static
++efi_status_t EFIAPI efi_firmware_arm_psa_get_image_info(
++	struct efi_firmware_management_protocol *this,
++	efi_uintn_t *image_info_size,
++	struct efi_firmware_image_descriptor *image_info,
++	u32 *descriptor_version,
++	u8 *descriptor_count,
++	efi_uintn_t *descriptor_size,
++	u32 *package_version,
++	u16 **package_version_name)
++{
++	int ret;
++
++	EFI_ENTRY("%p %p %p %p %p %p %p %p\n", this,
++		  image_info_size, image_info,
++		  descriptor_version, descriptor_count, descriptor_size,
++		  package_version, package_version_name);
++
++	if (!image_info_size)
++		return EFI_EXIT(EFI_INVALID_PARAMETER);
++
++	if (*image_info_size &&
++	    (!image_info || !descriptor_version || !descriptor_count ||
++	     !descriptor_size || !package_version || !package_version_name))
++		return EFI_EXIT(EFI_INVALID_PARAMETER);
++
++	ret =3D arm_psa_get_image_info(image_info_size, image_info,
++				descriptor_version, descriptor_count,
++				descriptor_size,
++				package_version, package_version_name);
++
++	if (ret) {
++		if (ret =3D=3D -ENOMEM)
++			return EFI_EXIT(EFI_BUFFER_TOO_SMALL);
++		else
++			return EFI_EXIT(EFI_DEVICE_ERROR);
++	}
++
++	return EFI_EXIT(EFI_SUCCESS);
++}
++
++/**
++ * efi_firmware_arm_psa_set_image - update the firmware image
++ * @this:		Protocol instance
++ * @image_index:	Image index number
++ * @image:		New image
++ * @image_size:		Size of new image
++ * @vendor_code:	Vendor-specific update policy
++ * @progress:		Function to report the progress of update
++ * @abort_reason:	Pointer to string of abort reason
++ *
++ * Update the firmware to new image, following the arm psa firmware
++ * update specification.
++ * @vendor_code, @progress and @abort_reason are not supported.
++ *
++ * Return:		status code
++ */
++static
++efi_status_t EFIAPI efi_firmware_arm_psa_set_image(
++	struct efi_firmware_management_protocol *this,
++	u8 image_index,
++	const void *image,
++	efi_uintn_t image_size,
++	const void *vendor_code,
++	efi_status_t (*progress)(efi_uintn_t completion),
++	u16 **abort_reason)
++{
++	u32 fmp_hdr_signature;
++	const struct fmp_payload_header *header;
++
++	EFI_ENTRY("%p %d %p %zd %p %p %p\n", this, image_index, image,
++		  image_size, vendor_code, progress, abort_reason);
++
++	if (!image)
++		return EFI_EXIT(EFI_INVALID_PARAMETER);
++
++	/* TODO: capsule authentication */
++
++	fmp_hdr_signature =3D FMP_PAYLOAD_HDR_SIGNATURE;
++	header =3D (void *)image;
++
++	if (!memcmp(&header->signature, &fmp_hdr_signature,
++		    sizeof(fmp_hdr_signature))) {
++		/*
++		 * When building the capsule with the scripts in
++		 * edk2, a FMP header is inserted above the capsule
++		 * payload. Compensate for this header to get the
++		 * actual payload that is to be updated.
++		 */
++		image =3D (unsigned char *)image + header->header_size;
++		image_size -=3D header->header_size;
++	}
++
++	if (arm_psa_update(image, image_index, image_size))
++		return EFI_EXIT(EFI_DEVICE_ERROR);
++
++	return EFI_EXIT(EFI_SUCCESS);
++}
++
++const struct efi_firmware_management_protocol efi_fmp_arm_psa =3D {
++	.get_image_info =3D efi_firmware_arm_psa_get_image_info,
++	.get_image =3D efi_firmware_get_image_unsupported,
++	.set_image =3D efi_firmware_arm_psa_set_image,
++	.check_image =3D efi_firmware_check_image_unsupported,
++	.get_package_info =3D efi_firmware_get_package_info_unsupported,
++	.set_package_info =3D efi_firmware_set_package_info_unsupported,
++};
++#endif /* CONFIG_EFI_CAPSULE_FIRMWARE_ARM_PSA */
+diff --git a/lib/efi_loader/efi_firmware_arm_psa.c b/lib/efi_loader/efi_=
firmware_arm_psa.c
+new file mode 100644
+index 0000000000..ab575f0124
+--- /dev/null
++++ b/lib/efi_loader/efi_firmware_arm_psa.c
+@@ -0,0 +1,520 @@
++/* SPDX-License-Identifier: GPL-2.0+ */
++/*
++ * Copyright (C) 2022 Arm Limited
++ */
++
++#include <arm_ffa_helper.h>
++#include <configs/total_compute.h>
++#include <efi_firmware_arm_psa.h>
++#include <efi_loader.h>
++#include <malloc.h>
++#include <mapmem.h>
++#include <mm_communication.h>
++
++/* MM return codes */
++#define MM_SUCCESS	0
++
++#define ARM_SVC_ID_SP_EVENT_COMPLETE_AARCH64	0xC4000061
++#define ARM_SVC_ID_SP_EVENT_COMPLETE		ARM_SVC_ID_SP_EVENT_COMPLETE_AARC=
H64
++
++__efi_runtime_data static u16 mm_sp_id;
++__efi_runtime_data static int fwu_initialized =3D 0;
++__efi_runtime_data struct fwu_image_directory cached_image_directory;
++__efi_runtime_data struct efi_mm_communicate_header *mm_hdr;
++__efi_runtime_data void *mm_comm_buf;
++
++/**
++ * ffa_discover_mm_sp_id() - Query the MM partition ID
++ *
++ * Use the FF-A driver to get the MM partition ID.
++ * If multiple partitions are found, use the first one
++ *
++ * Return:
++ *
++ * 0 on success
++ */
++static int __efi_runtime ffa_discover_mm_sp_id(void)
++{
++	struct ffa_interface_data func_data =3D {0};
++	u32 count =3D 0;
++	int ret;
++	struct ffa_partition_info *parts_info;
++	static union ffa_partition_uuid fwu_sp_uuid =3D {.bytes =3D FFA_FWU_SP=
_UUID};
++
++	/*
++	 * get from the driver the count of the SPs matching the UUID
++	 */
++	func_data.data0_size =3D sizeof(fwu_sp_uuid);
++	func_data.data0 =3D &fwu_sp_uuid;
++	func_data.data1_size =3D sizeof(count);
++	func_data.data1 =3D &count;
++
++	ret =3D ffa_helper_get_partitions_info(&func_data);
++	if (ret !=3D FFA_ERR_STAT_SUCCESS) {
++		log_err("EFI: Failure in querying partitions count (error code: %d)\n=
", ret);
++		return ret;
++	}
++
++	if (!count) {
++		log_info("EFI: No MM partition found\n");
++		return ret;
++	}
++
++	/*
++	 * pre-allocate a buffer to be filled by the driver
++	 * with  ffa_partition_info structs
++	 */
++	parts_info =3D calloc(count, sizeof(struct ffa_partition_info));
++	if (!parts_info)
++		return -EINVAL;
++
++	log_info("EFI: Pre-allocating %d partition(s) info structures\n", coun=
t);
++
++	func_data.data1_size =3D count * sizeof(struct ffa_partition_info);
++	func_data.data1 =3D parts_info;
++
++	/*
++	 * ask the driver to fill the
++	 * buffer with the SPs info
++	 */
++	ret =3D ffa_helper_get_partitions_info(&func_data);
++	if (ret !=3D FFA_ERR_STAT_SUCCESS) {
++		log_err("EFI: Failure in querying partition(s) info (error code: %d)\=
n", ret);
++		free(parts_info);
++		return ret;
++	}
++
++	/*
++	 * MM SPs found , use the first one
++	 */
++
++	mm_sp_id =3D parts_info[0].id;
++
++	log_info("EFI: MM partition ID 0x%x\n", mm_sp_id);
++
++	free(parts_info);
++
++	return 0;
++}
++
++/**
++ * ffa_notify_mm_sp() - Announce there is data in the shared buffer
++ *
++ * Notifies the MM partition in the trusted world that
++ * data is available in the shared buffer.
++ * This is a blocking call during which trusted world has exclusive acc=
ess
++ * to the MM shared buffer.
++ *
++ * Return:
++ *
++ * 0 on success
++ */
++static int __efi_runtime ffa_notify_mm_sp(void)
++{
++	struct ffa_interface_data func_data =3D {0};
++	struct ffa_send_direct_data msg =3D {0};
++	int ret;
++	u32 sp_event_complete;
++	int sp_event_ret;
++
++	func_data.data0_size =3D sizeof(mm_sp_id);
++	func_data.data0 =3D &mm_sp_id;
++
++	msg.a3 =3D FFA_SHARED_MM_BUFFER_ADDR;
++	msg.a4 =3D FFA_SHARED_MM_BUFFER_SIZE;
++	func_data.data1_size =3D sizeof(msg);
++	func_data.data1 =3D &msg;
++
++	ret =3D ffa_helper_msg_send_direct_req(&func_data);
++	if (ret !=3D FFA_ERR_STAT_SUCCESS) {
++		log_err("EFI: Failure to notify the MM SP , FF-A  error (%d)\n", ret)=
;
++		return ret;
++	}
++
++	sp_event_complete =3D msg.a3;
++	sp_event_ret =3D (int)msg.a4;
++
++	if (sp_event_complete =3D=3D ARM_SVC_ID_SP_EVENT_COMPLETE && sp_event_=
ret =3D=3D MM_SUCCESS)
++		return 0;
++
++	log_err("EFI: Failure to notify the MM SP (0x%x , %d)\n",
++		sp_event_complete,
++		sp_event_ret);
++
++	return -EACCES;
++}
++
++static fwu_status_t __efi_runtime fwu_discover(void)
++{
++	int ret;
++	struct mm_fwu_discover_arg *discover_arg =3D get_fwu_discover_arg(mm_h=
dr);
++	struct mm_fwu_discover_ret *discover_ret =3D get_fwu_discover_ret(mm_h=
dr);
++
++	discover_arg->func_id =3D FWU_DISCOVER;
++
++	mm_hdr->message_len =3D sizeof(struct mm_fwu_discover_arg);
++
++	ret =3D ffa_notify_mm_sp();
++	if (ret)
++		return ret;
++
++	if (discover_ret->version_major !=3D 1) {
++		log_err("FWU: Unsupported Update Agent version\n");
++		return -EINVAL;
++	}
++	/* TODO: check other parameters as well */
++
++	return discover_ret->status;
++}
++
++static fwu_status_t __efi_runtime fwu_begin_staging(void)
++{
++	int ret;
++	struct mm_fwu_begin_staging_arg *begin_staging_arg =3D get_fwu_begin_s=
taging_arg(mm_hdr);
++	struct mm_fwu_begin_staging_ret *begin_staging_ret =3D get_fwu_begin_s=
taging_ret(mm_hdr);
++
++	begin_staging_arg->func_id =3D FWU_BEGIN_STAGING;
++
++	mm_hdr->message_len =3D sizeof(struct mm_fwu_begin_staging_arg);
++
++	ret =3D ffa_notify_mm_sp();
++	if (ret)
++		return ret;
++
++	return begin_staging_ret->status;
++}
++
++static fwu_status_t __efi_runtime fwu_end_staging(void)
++{
++	int ret;
++	struct mm_fwu_end_staging_arg *end_staging_arg =3D get_fwu_end_staging=
_arg(mm_hdr);
++	struct mm_fwu_end_staging_ret *end_staging_ret =3D get_fwu_end_staging=
_ret(mm_hdr);
++
++	end_staging_arg->func_id =3D FWU_END_STAGING;
++
++	mm_hdr->message_len =3D sizeof(struct mm_fwu_end_staging_arg);
++
++	ret =3D ffa_notify_mm_sp();
++	if (ret)
++		return ret;
++
++	return end_staging_ret->status;
++}
++
++static fwu_status_t __efi_runtime fwu_cancel_staging(void)
++{
++	int ret;
++	struct mm_fwu_cancel_staging_arg *cancel_staging_arg =3D get_fwu_cance=
l_staging_arg(mm_hdr);
++	struct mm_fwu_cancel_staging_ret *cancel_staging_ret =3D get_fwu_cance=
l_staging_ret(mm_hdr);
++
++	cancel_staging_arg->func_id =3D FWU_CANCEL_STAGING;
++
++	mm_hdr->message_len =3D sizeof(struct mm_fwu_cancel_staging_arg);
++
++	ret =3D ffa_notify_mm_sp();
++	if (ret)
++		return ret;
++
++	return cancel_staging_ret->status;
++}
++
++static fwu_status_t __efi_runtime fwu_open(const efi_guid_t *img_uuid, =
uint32_t *handle)
++{
++	int ret;
++	struct mm_fwu_open_arg *open_hdr =3D get_fwu_open_arg(mm_hdr);
++	struct mm_fwu_open_ret *open_ret =3D get_fwu_open_ret(mm_hdr);
++
++	open_hdr->func_id =3D FWU_OPEN;
++	guidcpy(&open_hdr->image_guid, img_uuid);
++
++	mm_hdr->message_len =3D sizeof(struct mm_fwu_open_arg);
++
++	ret =3D ffa_notify_mm_sp();
++	if (ret)
++		return ret;
++
++	*handle =3D open_ret->handle;
++
++	return open_ret->status;
++}
++
++static fwu_status_t __efi_runtime fwu_read_stream(uint32_t handle, uint=
8_t *buffer, uint32_t buffer_size)
++{
++	int ret;
++	struct mm_fwu_read_stream_arg *read_stream_hdr =3D get_fwu_read_stream=
_arg(mm_hdr);
++	struct mm_fwu_read_stream_ret *read_stream_ret =3D get_fwu_read_stream=
_ret(mm_hdr);
++	uint32_t payload_size =3D FFA_SHARED_MM_BUFFER_SIZE - sizeof(struct mm=
_fwu_read_stream_ret)
++							- sizeof(struct efi_mm_communicate_header);
++	uint32_t read_offset =3D 0, read_size, total_size;
++
++	do {
++		read_stream_hdr->func_id =3D FWU_READ_STREAM;
++		read_stream_hdr->handle =3D handle;
++
++		mm_hdr->message_len =3D sizeof(struct mm_fwu_read_stream_arg);
++
++		ret =3D ffa_notify_mm_sp();
++		if (ret)
++			return ret;
++
++		if (read_stream_ret->status)
++			return read_stream_ret->status;
++
++		read_size =3D read_stream_ret->read_bytes;
++		total_size =3D read_stream_ret->total_bytes;
++
++		log_info("FWU: read bytes / total bytes : %d/%d\n", read_size, total_=
size);
++
++		if ((read_size <=3D payload_size) && (read_offset + read_size <=3D bu=
ffer_size))
++			memcpy(buffer + read_offset, read_stream_ret->payload, read_size);
++		else
++			return -EINVAL;
++
++		read_offset +=3D read_size;
++
++		if (read_offset > total_size)
++			return -EINVAL;
++	} while (total_size !=3D read_offset);
++
++	return read_stream_ret->status;
++}
++
++static fwu_status_t __efi_runtime fwu_write_stream(uint32_t handle, con=
st uint8_t *buffer, uint32_t remaining_size)
++{
++	int ret;
++	struct mm_fwu_write_stream_arg *write_stream_arg =3D get_fwu_write_str=
eam_arg(mm_hdr);
++	struct mm_fwu_write_stream_ret *write_stream_ret =3D get_fwu_write_str=
eam_ret(mm_hdr);
++	uint32_t write_size;
++	uint32_t payload_size =3D FFA_SHARED_MM_BUFFER_SIZE - sizeof(struct mm=
_fwu_write_stream_arg)
++							- sizeof(struct efi_mm_communicate_header);
++
++	while (remaining_size) {
++		write_size =3D (remaining_size < payload_size) ? remaining_size :  pa=
yload_size;
++		write_stream_arg->func_id =3D FWU_WRITE_STREAM;
++		write_stream_arg->handle =3D handle;
++		write_stream_arg->data_len =3D write_size;
++		memcpy(write_stream_arg->payload, buffer, write_size);
++
++		mm_hdr->message_len =3D sizeof(struct mm_fwu_write_stream_arg) + writ=
e_size;
++
++		ret =3D ffa_notify_mm_sp();
++		if (ret)
++			return ret;
++
++		if(write_stream_ret->status)
++			return write_stream_ret->status;
++
++		remaining_size -=3D write_size;
++		buffer +=3D write_size;
++
++		log_info("FWU: write size =3D %d, remaining size =3D %d\n",
++				write_size, remaining_size);
++	}
++
++	return write_stream_ret->status;
++}
++
++static fwu_status_t __efi_runtime fwu_commit(uint32_t handle, bool clie=
nt_accept)
++{
++	int ret;
++	struct mm_fwu_commit_arg *commit_arg =3D get_fwu_commit_arg(mm_hdr);
++	struct mm_fwu_commit_ret *commit_ret =3D get_fwu_commit_ret(mm_hdr);
++
++	do {
++		commit_arg->func_id =3D FWU_COMMIT;
++		commit_arg->handle =3D handle;
++		commit_arg->acceptance_req =3D client_accept;
++		commit_arg->max_atomic_len =3D 0;
++
++		mm_hdr->message_len =3D sizeof(struct mm_fwu_commit_arg);
++
++		ret =3D ffa_notify_mm_sp();
++		if (ret)
++			return ret;
++
++		log_info("FWU: commit progress %d/%d (work/total_work)\n",
++			commit_ret->progress, commit_ret->total_work);
++
++	} while(commit_ret->status=3D=3DFWU_RESUME);
++
++	return commit_ret->status;
++}
++
++int __efi_runtime arm_psa_update(
++	const void *image,
++	u8 image_index,
++	efi_uintn_t image_size
++)
++{
++	int ret =3D 0;
++	uint32_t handle;
++
++	if(image_index >=3D cached_image_directory.num_images)
++		return -EINVAL;
++
++	ret =3D fwu_begin_staging();
++	if (ret) {
++		log_err("FWU: begin staging failed, ret =3D %d\n", ret);
++		return ret;
++	}
++
++	ret =3D fwu_open(&cached_image_directory.entries[image_index].image_gu=
id, &handle);
++	if (ret) {
++		log_err("FWU: firmware image open failed, ret =3D %d\n", ret);
++		goto cancel_staging;
++	}
++
++	ret =3D fwu_write_stream(handle, (uint8_t *)image, image_size);
++	if (ret) {
++		log_err("FWU: write stream failed, ret =3D %d\n", ret);
++		goto cancel_staging;
++	}
++
++	/* TODO: implement client driven image acceptance */
++	ret =3D fwu_commit(handle, 0);
++	if (ret) {
++		log_err("FWU: commit failed, ret =3D %d\n", ret);
++		goto cancel_staging;
++	}
++
++	ret =3D fwu_end_staging();
++	if (ret) {
++		log_err("FWU: end staging failed, ret =3D %d\n", ret);
++		goto cancel_staging;
++	}
++
++	log_info("successfully updated the image at index %d\n", image_index);
++	return ret;
++
++cancel_staging:
++	if (fwu_cancel_staging())
++		log_err("FWU: cancel staging failed, ret =3D %d\n", ret);
++
++	return ret;
++}
++
++static int __efi_runtime read_image_directory(void)
++{
++	int ret;
++	uint32_t handle;
++
++	const efi_guid_t fwu_directory_uuid =3D PSA_FWU_DIRECTORY_UUID;
++
++	ret =3D fwu_open(&fwu_directory_uuid, &handle);
++	if (ret) {
++		log_err("FWU: open image directory failed, ret =3D %d\n", ret);
++		return ret;
++	}
++
++	ret =3D fwu_read_stream(handle, (uint8_t *)&cached_image_directory, si=
zeof(cached_image_directory));
++	if (ret) {
++		log_err("FWU: read stream failed, ret =3D %d\n", ret);
++		return ret;
++	}
++
++	if(cached_image_directory.num_images > MAX_IMAGES) {
++		log_err("FWU: image limit exceeded.\n");
++		log_err("FWU: number of images present: %d, max number of images supp=
orted: %d\n",
++					cached_image_directory.num_images, MAX_IMAGES);
++		return -EINVAL;
++	}
++
++	return ret;
++}
++
++static int update_agent_init(void)
++{
++	int ret;
++
++	ret =3D ffa_discover_mm_sp_id();
++	if (ret) {
++		log_err("FWU: discover update agent failed, ret =3D %d\n", ret);
++		return ret;
++	}
++
++	mm_comm_buf =3D (void *)map_sysmem((phys_addr_t)FFA_SHARED_MM_BUFFER_A=
DDR, 0);
++	mm_hdr =3D (struct efi_mm_communicate_header *)mm_comm_buf;
++
++	ret =3D fwu_discover();
++	if (ret) {
++		log_err("FWU: discover failed, ret =3D %d\n", ret);
++		goto out;
++	}
++
++	ret =3D read_image_directory();
++	if (ret) {
++		log_err("FWU: reading image directory failed, ret =3D %d\n", ret);
++		goto out;
++	}
++
++	fwu_initialized =3D 1;
++	return ret;
++out:
++	unmap_sysmem(mm_comm_buf);
++	return ret;
++}
++
++int __efi_runtime arm_psa_get_image_info(
++        efi_uintn_t *image_info_size,
++        struct efi_firmware_image_descriptor *image_info,
++        u32 *descriptor_version,
++        u8 *descriptor_count,
++        efi_uintn_t *descriptor_size,
++        u32 *package_version,
++        u16 **package_version_name)
++{
++	int ret =3D 0;
++	int required_image_info_size;
++
++	if (!fwu_initialized) {
++		ret =3D update_agent_init();
++		if (ret) {
++			log_err("update agent init failed, ret =3D %d\n", ret);
++			return ret;
++		}
++	}
++
++	required_image_info_size =3D cached_image_directory.num_images *
++				sizeof(struct efi_firmware_image_descriptor);
++
++	if (*image_info_size < required_image_info_size) {
++		*image_info_size =3D required_image_info_size;
++		return -ENOMEM;
++	}
++
++	*descriptor_version =3D EFI_FIRMWARE_IMAGE_DESCRIPTOR_VERSION;
++	*descriptor_count =3D cached_image_directory.num_images;
++	*descriptor_size =3D required_image_info_size;
++	*package_version =3D 0xffffffff; /* not supported */
++	*package_version_name =3D NULL; /* not supported */
++
++	for (int i =3D 0; i < cached_image_directory.num_images; i++) {
++		image_info[i].image_index =3D i+1;
++		guidcpy(&image_info[i].image_type_id, &cached_image_directory.entries=
[i].image_guid);
++		image_info[i].image_id =3D i;
++		image_info[i].image_id_name =3D NULL; /* not supported */
++		image_info[i].version =3D cached_image_directory.entries[i].img_versi=
on;
++		image_info[i].version_name =3D NULL; /* not supported */
++		image_info[i].size =3D cached_image_directory.entries[i].img_max_size=
;
++
++		image_info[i].attributes_supported =3D
++			IMAGE_ATTRIBUTE_IMAGE_UPDATABLE |
++			IMAGE_ATTRIBUTE_AUTHENTICATION_REQUIRED;
++		image_info[i].attributes_setting =3D
++				IMAGE_ATTRIBUTE_IMAGE_UPDATABLE;
++
++		/* Check if the capsule authentication is enabled */
++		if (IS_ENABLED(CONFIG_EFI_CAPSULE_AUTHENTICATE))
++			image_info[i].attributes_setting |=3D
++				IMAGE_ATTRIBUTE_AUTHENTICATION_REQUIRED;
++
++		image_info[i].lowest_supported_image_version =3D
++			cached_image_directory.entries[i].lowest_acceptable_version;
++		image_info[i].last_attempt_version =3D 0;
++		image_info[i].last_attempt_status =3D LAST_ATTEMPT_STATUS_SUCCESS;
++		image_info[i].hardware_instance =3D 1;
++		image_info[i].dependencies =3D NULL; /* not supported */
++	}
++
++	return ret;
++}
+--=20
+2.34.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/tc/0006-arm-total_com=
pute-enable-capsule-update.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot=
/tc/0006-arm-total_compute-enable-capsule-update.patch
new file mode 100644
index 00000000..bf2bfe8c
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/tc/0006-arm-total_compute-en=
able-capsule-update.patch
@@ -0,0 +1,70 @@
+From 2ab887402b9e22842d07e5f2fe1ac54518555af5 Mon Sep 17 00:00:00 2001
+From: Davidson K <davidson.kumaresan@arm.com>
+Date: Mon, 6 Jun 2022 13:24:42 +0530
+Subject: [PATCH 6/7] arm: total_compute: enable capsule update
+
+It includes:
+* Enabling runtime capsule update
+* Enabling efidebug command line tool
+* Enabling the FMP driver that supports ARM PSA firmware update specific=
ation
+* Predefining the carved out memory to be used for MM communication
+* Enabling FF-A transport driver and adding an entry in dts
+
+Signed-off-by: Davidson K <davidson.kumaresan@arm.com>
+Change-Id: I6d6c70c6fc386d6c40def800a7417c1ce4b8acf5
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ arch/arm/dts/total_compute.dts  | 7 +++++++
+ configs/total_compute_defconfig | 5 +++++
+ include/configs/total_compute.h | 4 ++++
+ 3 files changed, 16 insertions(+)
+
+diff --git a/arch/arm/dts/total_compute.dts b/arch/arm/dts/total_compute=
.dts
+index 96edacda0b..9b2cbfb452 100644
+--- a/arch/arm/dts/total_compute.dts
++++ b/arch/arm/dts/total_compute.dts
+@@ -45,8 +45,15 @@
+ 		clock-frequency =3D <24000000>;
+ 		clock-output-names =3D "bp:clock24mhz";
+ 	};
++
+ 	psci {
+ 		compatible =3D "arm,psci-1.0", "arm,psci-0.2";
+ 		method =3D "smc";
+ 	};
++
++	arm_ffa {
++		compatible =3D "arm,ffa";
++		method =3D "smc";
++		status =3D "okay";
++	};
+ };
+diff --git a/configs/total_compute_defconfig b/configs/total_compute_def=
config
+index 6a375543cd..531ce41cd3 100644
+--- a/configs/total_compute_defconfig
++++ b/configs/total_compute_defconfig
+@@ -52,3 +52,8 @@ CONFIG_SYS_FLASH_PROTECTION=3Dy
+ CONFIG_SYS_FLASH_CFI=3Dy
+ CONFIG_LIBAVB=3Dy
+ CONFIG_OF_LIBFDT_OVERLAY=3Dy
++CONFIG_ARM_FFA_TRANSPORT=3Dy
++CONFIG_CMD_EFIDEBUG=3Dy
++CONFIG_EFI_CAPSULE_FIRMWARE_ARM_PSA=3Dy
++CONFIG_EFI_CAPSULE_ON_DISK=3Dy
++CONFIG_EFI_RUNTIME_UPDATE_CAPSULE=3Dy
+diff --git a/include/configs/total_compute.h b/include/configs/total_com=
pute.h
+index 62bdb4f6a3..4b00f47ec6 100644
+--- a/include/configs/total_compute.h
++++ b/include/configs/total_compute.h
+@@ -59,4 +59,8 @@
+ #define CONFIG_SYS_FLASH_EMPTY_INFO	/* flinfo indicates empty blocks */
+ #define FLASH_MAX_SECTOR_SIZE		0x00040000
+=20
++/* Shared buffer used for communication between u-boot and the FWU SP *=
/
++#define FFA_SHARED_MM_BUFFER_SIZE	4 * 1024 * 1024 /* 4 MB */
++#define FFA_SHARED_MM_BUFFER_ADDR	(0xFCA00000)
++
+ #endif /* __TOTAL_COMPUTE_H */
+--=20
+2.34.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/tc/0007-arm_ffa-unmap=
-rxtx-buffer-before-exiting-u-boot.patch b/meta-arm-bsp/recipes-bsp/u-boo=
t/u-boot/tc/0007-arm_ffa-unmap-rxtx-buffer-before-exiting-u-boot.patch
new file mode 100644
index 00000000..5c437232
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/tc/0007-arm_ffa-unmap-rxtx-b=
uffer-before-exiting-u-boot.patch
@@ -0,0 +1,51 @@
+From 47be0456ea1760837d2de857e57842e595e9ea5e Mon Sep 17 00:00:00 2001
+From: Davidson K <davidson.kumaresan@arm.com>
+Date: Mon, 27 Jun 2022 14:11:27 +0530
+Subject: [PATCH 7/7] arm_ffa: unmap rxtx buffer before exiting u-boot
+
+The linux kernel ffa driver will be used after the kernel boots. It
+will try to map its own rxtx buffer. But there can be only one rxtx
+buffer mapped from the non secure world. Since the rxtx buffer of
+the u-boot is no longer used and we have to map the rxtx buffer of
+the linux kernel, the rxtx buffer of the u-boot should be unmapped.
+
+This will not be needed after the efi runtime services are enabled
+
+Signed-off-by: Davidson K <davidson.kumaresan@arm.com>
+Change-Id: I9deb6283d81f791185aa0a32d205b394d6d91f76
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ drivers/arm-ffa/core.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/drivers/arm-ffa/core.c b/drivers/arm-ffa/core.c
+index 98e2d2fa17..0c619439cb 100644
+--- a/drivers/arm-ffa/core.c
++++ b/drivers/arm-ffa/core.c
+@@ -1470,6 +1470,16 @@ static const struct udevice_id ffa_match_id[] =3D=
 {
+ 	{},
+ };
+=20
++/**
++ * Unmap the rxtx buffer before exiting u-boot
++ * This avoids conflicts with the linux kernel ffa driver
++ */
++
++static int ffa_remove(struct udevice *dev)
++{
++	return ffa_unmap_rxtx_buffers();
++}
++
+ /**
+  * Declaring the arm_ffa driver under UCLASS_FFA
+  */
+@@ -1481,4 +1491,6 @@ U_BOOT_DRIVER(arm_ffa) =3D {
+ 	.of_to_plat	=3D ffa_of_to_plat,
+ 	.probe		=3D ffa_probe,
+ 	.plat_auto	=3D sizeof(struct ffa_pdata),
++	.remove		=3D ffa_remove,
++	.flags		=3D DM_FLAG_OS_PREPARE,
+ };
+--=20
+2.34.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 08d4a8e1..30d6b11a 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -87,4 +87,10 @@ SRC_URI:append:juno =3D " file://0001-arm-juno-add-cus=
tom-bootcmd-to-autoboot-from
 SRC_URI:append:tc =3D " \
         file://bootargs.cfg \
         file://0001-arm-total_compute-update-secure-dram-size.patch \
+        file://0002-arm_ffa-introducing-Arm-FF-A-low-level-driver.patch =
\
+        file://0003-arm-total_compute-enable-psci.patch \
+        file://0004-arm_ffa-rxtx_map-should-use-64-bit-calls.patch \
+        file://0005-efi_firmware-add-new-fmp-driver-that-supports-arm-fw=
.patch \
+        file://0006-arm-total_compute-enable-capsule-update.patch \
+        file://0007-arm_ffa-unmap-rxtx-buffer-before-exiting-u-boot.patc=
h \
         "
--=20
2.34.1


