Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 832FBEB64DC
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 14:19:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.19731.1686838786824157754
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 15 Jun 2023 07:19:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9FC91FB;
	Thu, 15 Jun 2023 07:20:30 -0700 (PDT)
Received: from R91284ZP.arm.com (unknown [10.57.33.138])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D3B083F663;
	Thu, 15 Jun 2023 07:19:45 -0700 (PDT)
From: Gyorgy Szing <Gyorgy.Szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gyorgy Szing <Gyorgy.Szing@arm.com>
Subject: [PATCH mickledore 05/17] arm/trusted-firmware-a: Add TOS_FW_CONFIG handling for quemu
Date: Thu, 15 Jun 2023 16:19:18 +0200
Message-Id: <20230615141930.2407-5-Gyorgy.Szing@arm.com>
X-Mailer: git-send-email 2.39.1.windows.1
In-Reply-To: <20230615141930.2407-1-Gyorgy.Szing@arm.com>
References: <20230615141930.2407-1-Gyorgy.Szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 15 Jun 2023 14:19:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4788

This change:
  - cherry-picks TF-A changes from master which implement passing
    TOS_FW_CONFIG DTB from the FIP package to the trusted OS.
  - add an OP-TEE SPMC specific SPMC manifest file
  - configures TF-A to build the manifest, add it to the FIP package
    and pass it to OP-TEE as a boot argument.

This functionality needs matching changes in OPTEE (OP-TEE v3.21
or v3.20 + carried patches.)

Signed-off-by: Gyorgy Szing <Gyorgy.Szing@arm.com>
---
 .../files/add-spmc_manifest-for-qemu.patch    |  67 +++++
 ...emu-update-abi-between-spmd-and-spmc.patch | 263 ++++++++++++++++++
 .../trusted-firmware-a_%.bbappend             |   5 +-
 .../trusted-firmware-a_2.8.0.bb               |   6 +
 4 files changed, 340 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/add-spm=
c_manifest-for-qemu.patch
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/feat-qe=
mu-update-abi-between-spmd-and-spmc.patch

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/add-spmc_manif=
est-for-qemu.patch b/meta-arm/recipes-bsp/trusted-firmware-a/files/add-sp=
mc_manifest-for-qemu.patch
new file mode 100644
index 00000000..50a57d61
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/files/add-spmc_manifest-for=
-qemu.patch
@@ -0,0 +1,67 @@
+From e1cbb35ad4655fe13ccb89247c81e850f6392c92 Mon Sep 17 00:00:00 2001
+From: Gyorgy Szing <Gyorgy.Szing@arm.com>
+Date: Mon, 13 Mar 2023 21:15:59 +0100
+Subject: Add spmc_manifest for qemu
+
+This version only supports embedded packaging.
+
+Upstream-Status: Inappropriate [other]
+  - The SPMC manifest is integration specific and should live at an
+    integration spcific place. The manifest file is processed by TF-A
+    and I am adding the patch to TF-A to keep things simple.
+
+Signed-off-by: Gyorgy Szing <Gyorgy.Szing@arm.com>
+---
+ plat/qemu/fdts/optee_spmc_manifest.dts | 40 ++++++++++++++++++++++++++
+ 1 file changed, 40 insertions(+)
+ create mode 100644 plat/qemu/fdts/optee_spmc_manifest.dts
+
+diff --git a/plat/qemu/fdts/optee_spmc_manifest.dts b/plat/qemu/fdts/opt=
ee_spmc_manifest.dts
+new file mode 100644
+index 000000000..ae2ae3d95
+--- /dev/null
++++ b/plat/qemu/fdts/optee_spmc_manifest.dts
+@@ -0,0 +1,40 @@
++/* SPDX-License-Identifier: BSD-3-Clause */
++/*
++ * Copyright (c) 2023, Arm Limited. All rights reserved.
++ */
++
++/dts-v1/;
++
++/ {
++	compatible =3D "arm,ffa-core-manifest-1.0";
++	#address-cells =3D <2>;
++	#size-cells =3D <1>;
++
++	attribute {
++		spmc_id =3D <0x8000>;
++		maj_ver =3D <0x1>;
++		min_ver =3D <0x0>;
++		exec_state =3D <0x0>;
++		load_address =3D <0x0 0x0e100000>;
++		entrypoint =3D <0x0 0x0e100000>;
++		binary_size =3D <0x80000>;
++	};
++
++/*
++ * This file will be preprocessed by TF-A's build system. If Measured B=
oot is
++ * enabled in TF-A's config, the build system will add the MEASURED_BOO=
T=3D1 macro
++ * to the preprocessor arguments.
++ */
++#if MEASURED_BOOT
++	tpm_event_log {
++		compatible =3D "arm,tpm_event_log";
++		tpm_event_log_addr =3D <0x0 0x0>;
++		tpm_event_log_size =3D <0x0>;
++	};
++#endif
++
++/* If the ARM_BL2_SP_LIST_DTS is defined, SPs should be loaded from FIP=
 */
++#ifdef ARM_BL2_SP_LIST_DTS
++	#error "FIP SP load addresses configuration is missing.
++#endif
++};
+--=20
+2.39.1.windows.1
+
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/feat-qemu-upda=
te-abi-between-spmd-and-spmc.patch b/meta-arm/recipes-bsp/trusted-firmwar=
e-a/files/feat-qemu-update-abi-between-spmd-and-spmc.patch
new file mode 100644
index 00000000..7c851fd0
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/files/feat-qemu-update-abi-=
between-spmd-and-spmc.patch
@@ -0,0 +1,263 @@
+From d215b0c08e51192baab96d75beaeacf3abf8724e Mon Sep 17 00:00:00 2001
+From: Jens Wiklander <jens.wiklander@linaro.org>
+Date: Fri, 18 Nov 2022 15:40:04 +0100
+Subject: feat(qemu): update abi between spmd and spmc
+
+Updates the ABI between SPMD and the SPMC at S-EL1 so that the hard
+coded SPMC manifest can be replaced by a proper manifest via TOS FW
+Config. TOS FW Config is provided via QEMU_TOS_FW_CONFIG_DTS as a DTS
+file when building.  The DTS is turned into a DTB which is added to the
+FIP.
+
+Note that this is an incompatible change and requires corresponding
+change in OP-TEE ("core: sel1 spmc: boot abi update").
+
+Upstream-Status: Accepted
+
+Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
+Change-Id: Ibabe78ef50a24f775492854ce5ac54e4d471e369
+---
+ plat/qemu/common/qemu_bl2_mem_params_desc.c | 18 +++++++++++-
+ plat/qemu/common/qemu_bl2_setup.c           | 32 +++++++++++++--------
+ plat/qemu/common/qemu_io_storage.c          | 16 ++++++++++-
+ plat/qemu/common/qemu_spmd_manifest.c       | 31 --------------------
+ plat/qemu/qemu/include/platform_def.h       |  3 ++
+ plat/qemu/qemu/platform.mk                  | 12 +++++++-
+ 6 files changed, 66 insertions(+), 46 deletions(-)
+ delete mode 100644 plat/qemu/common/qemu_spmd_manifest.c
+
+diff --git a/plat/qemu/common/qemu_bl2_mem_params_desc.c b/plat/qemu/com=
mon/qemu_bl2_mem_params_desc.c
+index 5af3a2264..8d8047c92 100644
+--- a/plat/qemu/common/qemu_bl2_mem_params_desc.c
++++ b/plat/qemu/common/qemu_bl2_mem_params_desc.c
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2017-2021, ARM Limited and Contributors. All rights re=
served.
++ * Copyright (c) 2017-2022, ARM Limited and Contributors. All rights re=
served.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -122,6 +122,22 @@ static bl_mem_params_node_t bl2_mem_params_descs[] =
=3D {
+ #endif
+ 	   .next_handoff_image_id =3D INVALID_IMAGE_ID,
+ 	},
++
++#if defined(SPD_spmd)
++	/* Fill TOS_FW_CONFIG related information */
++	{
++	    .image_id =3D TOS_FW_CONFIG_ID,
++	    SET_STATIC_PARAM_HEAD(ep_info, PARAM_IMAGE_BINARY,
++		    VERSION_2, entry_point_info_t, SECURE | NON_EXECUTABLE),
++	    SET_STATIC_PARAM_HEAD(image_info, PARAM_IMAGE_BINARY,
++		    VERSION_2, image_info_t, 0),
++	    .image_info.image_base =3D TOS_FW_CONFIG_BASE,
++	    .image_info.image_max_size =3D TOS_FW_CONFIG_LIMIT -
++					 TOS_FW_CONFIG_BASE,
++	    .next_handoff_image_id =3D INVALID_IMAGE_ID,
++	},
++#endif
++
+ # endif /* QEMU_LOAD_BL32 */
+=20
+ 	/* Fill BL33 related information */
+diff --git a/plat/qemu/common/qemu_bl2_setup.c b/plat/qemu/common/qemu_b=
l2_setup.c
+index 2c0da15b9..6afa3a44d 100644
+--- a/plat/qemu/common/qemu_bl2_setup.c
++++ b/plat/qemu/common/qemu_bl2_setup.c
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2015-2021, ARM Limited and Contributors. All rights re=
served.
++ * Copyright (c) 2015-2022, ARM Limited and Contributors. All rights re=
served.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -149,8 +149,7 @@ static int qemu_bl2_handle_post_image_load(unsigned =
int image_id)
+ 	bl_mem_params_node_t *paged_mem_params =3D NULL;
+ #endif
+ #if defined(SPD_spmd)
+-	unsigned int mode_rw =3D MODE_RW_64;
+-	uint64_t pagable_part =3D 0;
++	bl_mem_params_node_t *bl32_mem_params =3D NULL;
+ #endif
+=20
+ 	assert(bl_mem_params);
+@@ -170,17 +169,18 @@ static int qemu_bl2_handle_post_image_load(unsigne=
d int image_id)
+ 		if (err !=3D 0) {
+ 			WARN("OPTEE header parse error.\n");
+ 		}
+-#if defined(SPD_spmd)
+-		mode_rw =3D bl_mem_params->ep_info.args.arg0;
+-		pagable_part =3D bl_mem_params->ep_info.args.arg1;
+-#endif
+ #endif
+=20
+-#if defined(SPD_spmd)
+-		bl_mem_params->ep_info.args.arg0 =3D ARM_PRELOADED_DTB_BASE;
+-		bl_mem_params->ep_info.args.arg1 =3D pagable_part;
+-		bl_mem_params->ep_info.args.arg2 =3D mode_rw;
+-		bl_mem_params->ep_info.args.arg3 =3D 0;
++#if defined(SPMC_OPTEE)
++		/*
++		 * Explicit zeroes to unused registers since they may have
++		 * been populated by parse_optee_header() above.
++		 *
++		 * OP-TEE expects system DTB in x2 and TOS_FW_CONFIG in x0,
++		 * the latter is filled in below for TOS_FW_CONFIG_ID and
++		 * applies to any other SPMC too.
++		 */
++		bl_mem_params->ep_info.args.arg2 =3D ARM_PRELOADED_DTB_BASE;
+ #elif defined(SPD_opteed)
+ 		/*
+ 		 * OP-TEE expect to receive DTB address in x2.
+@@ -224,6 +224,14 @@ static int qemu_bl2_handle_post_image_load(unsigned=
 int image_id)
+=20
+ 		bl_mem_params->ep_info.spsr =3D qemu_get_spsr_for_bl33_entry();
+ 		break;
++#if defined(SPD_spmd)
++	case TOS_FW_CONFIG_ID:
++		/* An SPMC expects TOS_FW_CONFIG in x0/r0 */
++		bl32_mem_params =3D get_bl_mem_params_node(BL32_IMAGE_ID);
++		bl32_mem_params->ep_info.args.arg0 =3D
++					bl_mem_params->image_info.image_base;
++		break;
++#endif
+ 	default:
+ 		/* Do nothing in default case */
+ 		break;
+diff --git a/plat/qemu/common/qemu_io_storage.c b/plat/qemu/common/qemu_=
io_storage.c
+index 1107e443f..e2d4932c0 100644
+--- a/plat/qemu/common/qemu_io_storage.c
++++ b/plat/qemu/common/qemu_io_storage.c
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2015-2016, ARM Limited and Contributors. All rights re=
served.
++ * Copyright (c) 2015-2022, ARM Limited and Contributors. All rights re=
served.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -24,6 +24,7 @@
+ #define BL2_IMAGE_NAME			"bl2.bin"
+ #define BL31_IMAGE_NAME			"bl31.bin"
+ #define BL32_IMAGE_NAME			"bl32.bin"
++#define TOS_FW_CONFIG_NAME		"tos_fw_config.dtb"
+ #define BL32_EXTRA1_IMAGE_NAME		"bl32_extra1.bin"
+ #define BL32_EXTRA2_IMAGE_NAME		"bl32_extra2.bin"
+ #define BL33_IMAGE_NAME			"bl33.bin"
+@@ -78,6 +79,10 @@ static const io_uuid_spec_t bl32_extra2_uuid_spec =3D=
 {
+ 	.uuid =3D UUID_SECURE_PAYLOAD_BL32_EXTRA2,
+ };
+=20
++static const io_uuid_spec_t tos_fw_config_uuid_spec =3D {
++	.uuid =3D UUID_TOS_FW_CONFIG,
++};
++
+ static const io_uuid_spec_t bl33_uuid_spec =3D {
+ 	.uuid =3D UUID_NON_TRUSTED_FIRMWARE_BL33,
+ };
+@@ -137,6 +142,10 @@ static const io_file_spec_t sh_file_spec[] =3D {
+ 		.path =3D BL32_EXTRA2_IMAGE_NAME,
+ 		.mode =3D FOPEN_MODE_RB
+ 	},
++	[TOS_FW_CONFIG_ID] =3D {
++		.path =3D TOS_FW_CONFIG_NAME,
++		.mode =3D FOPEN_MODE_RB
++	},
+ 	[BL33_IMAGE_ID] =3D {
+ 		.path =3D BL33_IMAGE_NAME,
+ 		.mode =3D FOPEN_MODE_RB
+@@ -252,6 +261,11 @@ static const struct plat_io_policy policies[] =3D {
+ 		open_fip
+ 	},
+ #endif
++	[TOS_FW_CONFIG_ID] =3D {
++		&fip_dev_handle,
++		(uintptr_t)&tos_fw_config_uuid_spec,
++		open_fip
++	},
+ 	[BL33_IMAGE_ID] =3D {
+ 		&fip_dev_handle,
+ 		(uintptr_t)&bl33_uuid_spec,
+diff --git a/plat/qemu/common/qemu_spmd_manifest.c b/plat/qemu/common/qe=
mu_spmd_manifest.c
+deleted file mode 100644
+index fd46e2675..000000000
+--- a/plat/qemu/common/qemu_spmd_manifest.c
++++ /dev/null
+@@ -1,31 +0,0 @@
+-/*
+- * Copyright (c) 2021, ARM Limited and Contributors. All rights reserve=
d.
+- *
+- * SPDX-License-Identifier: BSD-3-Clause
+- */
+-
+-#include <assert.h>
+-
+-#include <services/spm_core_manifest.h>
+-
+-#include <plat/common/platform.h>
+-#include <platform_def.h>
+-
+-int plat_spm_core_manifest_load(spmc_manifest_attribute_t *manifest,
+-				const void *pm_addr)
+-{
+-	entry_point_info_t *ep_info =3D bl31_plat_get_next_image_ep_info(SECUR=
E);
+-
+-	assert(ep_info !=3D NULL);
+-	assert(manifest !=3D NULL);
+-
+-	manifest->major_version =3D 1;
+-	manifest->minor_version =3D 0;
+-	manifest->exec_state =3D ep_info->args.arg2;
+-	manifest->load_address =3D BL32_BASE;
+-	manifest->entrypoint =3D BL32_BASE;
+-	manifest->binary_size =3D BL32_LIMIT - BL32_BASE;
+-	manifest->spmc_id =3D 0x8000;
+-
+-	return 0;
+-}
+diff --git a/plat/qemu/qemu/include/platform_def.h b/plat/qemu/qemu/incl=
ude/platform_def.h
+index c9ed6409f..5c3239cb8 100644
+--- a/plat/qemu/qemu/include/platform_def.h
++++ b/plat/qemu/qemu/include/platform_def.h
+@@ -118,6 +118,9 @@
+ #define BL_RAM_BASE			(SHARED_RAM_BASE + SHARED_RAM_SIZE)
+ #define BL_RAM_SIZE			(SEC_SRAM_SIZE - SHARED_RAM_SIZE)
+=20
++#define TOS_FW_CONFIG_BASE		BL_RAM_BASE
++#define TOS_FW_CONFIG_LIMIT		(TOS_FW_CONFIG_BASE + PAGE_SIZE)
++
+ /*
+  * BL1 specific defines.
+  *
+diff --git a/plat/qemu/qemu/platform.mk b/plat/qemu/qemu/platform.mk
+index 6becc32fa..02493025a 100644
+--- a/plat/qemu/qemu/platform.mk
++++ b/plat/qemu/qemu/platform.mk
+@@ -212,7 +212,10 @@ BL31_SOURCES		+=3D	lib/cpus/aarch64/aem_generic.S		=
\
+ 				${QEMU_GIC_SOURCES}
+=20
+ ifeq (${SPD},spmd)
+-BL31_SOURCES		+=3D	plat/qemu/common/qemu_spmd_manifest.c
++BL31_SOURCES		+=3D	plat/common/plat_spmd_manifest.c	\
++				common/uuid.c				\
++				${LIBFDT_SRCS} 				\
++				${FDT_WRAPPERS_SOURCES}
+ endif
+ endif
+=20
+@@ -233,6 +236,13 @@ $(eval $(call TOOL_ADD_IMG,bl32_extra2,--tos-fw-ext=
ra2))
+ endif
+ endif
+=20
++ifneq ($(QEMU_TOS_FW_CONFIG_DTS),)
++FDT_SOURCES		+=3D	${QEMU_TOS_FW_CONFIG_DTS}
++QEMU_TOS_FW_CONFIG	:=3D	${BUILD_PLAT}/fdts/$(notdir $(basename ${QEMU_T=
OS_FW_CONFIG_DTS})).dtb
++# Add the TOS_FW_CONFIG to FIP
++$(eval $(call TOOL_ADD_PAYLOAD,${QEMU_TOS_FW_CONFIG},--tos-fw-config,${=
QEMU_TOS_FW_CONFIG}))
++endif
++
+ SEPARATE_CODE_AND_RODATA :=3D 1
+ ENABLE_STACK_PROTECTOR	 :=3D 0
+ ifneq ($(ENABLE_STACK_PROTECTOR), 0)
+--=20
+2.39.1.windows.1
+
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%=
.bbappend b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.=
bbappend
index 6cf55d69..e58a0902 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappe=
nd
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappe=
nd
@@ -47,7 +47,10 @@ EXTRA_OEMAKE:append:arm:qemuall =3D " \
     BL32_RAM_LOCATION=3Dtdram \
     AARCH32_SP=3Doptee \
     "
-
+# When using OP-TEE SPMC specify the SPMC manifest file.
+EXTRA_OEMAKE:append:qemuarm64-secureboot =3D "${@bb.utils.contains('MACH=
INE_FEATURES', 'arm-ffa', \
+    'QEMU_TOS_FW_CONFIG_DTS=3D${S}/plat/qemu/fdts/optee_spmc_manifest.dt=
s', '', d)}"
+    =20
 do_compile:append:qemuarm64-secureboot() {
     # Create a secure flash image for booting AArch64 Qemu. See:
     # https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/tree/d=
ocs/plat/qemu.rst
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.8.0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.8.=
0.bb
index 3a5006e5..5830339c 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.8.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.8.0.bb
@@ -5,6 +5,12 @@ SRCREV_tfa =3D "9881bb93a3bc0a3ea37e9f093e09ab4b360a9e48=
"
=20
 SRC_URI +=3D "file://rwx-segments.patch"
=20
+# Enable passing TOS_FW_CONFIG from FIP package to Trusted OS.
+SRC_URI:append:qemuarm64-secureboot =3D " \
+            file://add-spmc_manifest-for-qemu.patch \
+            file://feat-qemu-update-abi-between-spmd-and-spmc.patch \
+        "
+
 LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3Db2c740efedc159745b9=
b31f88ff03dde"
=20
 # mbed TLS v2.28.2
--=20
2.39.1.windows.1


