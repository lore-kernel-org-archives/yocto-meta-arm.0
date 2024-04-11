Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAFB5CD1284
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 12:59:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.17038.1712840354816222652
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Apr 2024 05:59:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E72FA11FB
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 Apr 2024 05:59:43 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3B0B03F64C
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 Apr 2024 05:59:14 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm-bsp: Remove tc1
Date: Thu, 11 Apr 2024 08:59:13 -0400
Message-Id: <20240411125913.64905-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240411125913.64905-1-jon.mason@arm.com>
References: <20240411125913.64905-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 Apr 2024 12:59:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5521

Remove tc1 and related recipes that are unique to it (and generally
unused ones).

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml                                |   8 -
 ci/fvps.yml                                   |   1 -
 ci/tc1.yml                                    |  11 -
 meta-arm-bsp/conf/machine/include/tc.inc      |  36 -
 meta-arm-bsp/conf/machine/tc1.conf            |  31 -
 meta-arm-bsp/documentation/tc1.md             |  32 -
 .../recipes-bsp/hafnium/hafnium-tc.inc        |   8 -
 .../scp-firmware/scp-firmware-tc.inc          |   6 -
 .../trusted-firmware-a-tc.inc                 | 134 ----
 .../trusted-firmware-a_2.8.6.bb               |  19 -
 meta-arm-bsp/recipes-bsp/u-boot/u-boot-tc.inc |   5 -
 .../tc/0001-WIP-Enable-managed-exit.patch     | 120 ----
 ...talcompute-fix-TZDRAM-start-and-size.patch |  34 -
 ...xtest-Limit-tests-to-a-single-thread.patch |  55 --
 .../optee/optee-client_3.20.0.bb              |   7 -
 ...ow-setting-sysroot-for-libgcc-lookup.patch |  34 -
 .../0002-optee-enable-clang-support.patch     |  29 -
 ...3-core-link-add-no-warn-rwx-segments.patch |  62 --
 ...-Define-section-attributes-for-clang.patch | 240 -------
 ...-core-arm-S-EL1-SPMC-boot-ABI-update.patch |  89 ---
 ...-core-ffa-add-TOS_FW_CONFIG-handling.patch | 247 -------
 ...re-spmc-handle-non-secure-interrupts.patch | 275 --------
 ...ure-SP-s-NS-interrupt-action-based-o.patch | 148 ----
 .../optee-os-3.20.0/CVE-2023-41325.patch      | 634 ------------------
 .../recipes-security/optee/optee-os-tc.inc    |  33 -
 .../0003-optee-enable-clang-support.patch     |  30 -
 .../recipes-security/optee/optee-os_3.20.0.bb |  18 -
 .../optee/optee-os_3.20.0.bbappend            |   6 -
 .../recipes-security/optee/optee-test-tc.inc  |   8 -
 ..._1000-remove-unneeded-stat.h-include.patch |  34 -
 ..._ffa_user-driver-compatibility-check.patch | 160 -----
 ...pdate-arm_ffa_user-driver-dependency.patch |  36 -
 .../optee/optee-test_3.20.0.bb                |   8 -
 .../optee/optee-test_3.20.0.bbappend          |   6 -
 meta-arm/recipes-devtools/fvp/fvp-tc1.bb      |  11 -
 35 files changed, 2615 deletions(-)
 delete mode 100644 ci/tc1.yml
 delete mode 100644 meta-arm-bsp/conf/machine/include/tc.inc
 delete mode 100644 meta-arm-bsp/conf/machine/tc1.conf
 delete mode 100644 meta-arm-bsp/documentation/tc1.md
 delete mode 100644 meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc
 delete mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc=
.inc
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-f=
irmware-a-tc.inc
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-f=
irmware-a_2.8.6.bb
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-tc.inc
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc=
/0001-WIP-Enable-managed-exit.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc=
/0002-plat-totalcompute-fix-TZDRAM-start-and-size.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-test/=
tc/0001-xtest-Limit-tests-to-a-single-thread.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-client_3.20=
.0.bb
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0=
001-allow-setting-sysroot-for-libgcc-lookup.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0=
002-optee-enable-clang-support.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0=
003-core-link-add-no-warn-rwx-segments.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0=
004-core-Define-section-attributes-for-clang.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0=
005-core-arm-S-EL1-SPMC-boot-ABI-update.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0=
006-core-ffa-add-TOS_FW_CONFIG-handling.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0=
007-core-spmc-handle-non-secure-interrupts.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0=
008-core-spmc-configure-SP-s-NS-interrupt-action-based-o.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/C=
VE-2023-41325.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-tc.inc
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os/0003-opt=
ee-enable-clang-support.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.b=
b
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.b=
bappend
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-test-tc.inc
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-test/0001-x=
test-regression_1000-remove-unneeded-stat.h-include.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-test/0002-f=
fa_spmc-Add-arm_ffa_user-driver-compatibility-check.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-test/0003-U=
pdate-arm_ffa_user-driver-dependency.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-test_3.20.0=
.bb
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-test_3.20.0=
.bbappend
 delete mode 100644 meta-arm/recipes-devtools/fvp/fvp-tc1.bb

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d6ac3614701f..e45c9c89dce5 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -260,14 +260,6 @@ qemuarmv5:
 sgi575:
   extends: .build
=20
-tc1:
-  extends: .build
-  parallel:
-    matrix:
-      - TESTING: testimage
-  tags:
-    - x86_64
-
 toolchains:
   extends: .build
=20
diff --git a/ci/fvps.yml b/ci/fvps.yml
index a89df05317b9..c6516148e6e4 100644
--- a/ci/fvps.yml
+++ b/ci/fvps.yml
@@ -22,4 +22,3 @@ target:
   - nativesdk-fvp-corstone1000
   - nativesdk-fvp-n1-edge
   - nativesdk-fvp-sgi575
-  - nativesdk-fvp-tc1
diff --git a/ci/tc1.yml b/ci/tc1.yml
deleted file mode 100644
index 77d67d2f086a..000000000000
--- a/ci/tc1.yml
+++ /dev/null
@@ -1,11 +0,0 @@
-header:
-  version: 14
-  includes:
-    - ci/base.yml
-    - ci/fvp.yml
-    - ci/meta-openembedded.yml
-
-machine: tc1
-
-target:
-  - core-image-minimal
diff --git a/meta-arm-bsp/conf/machine/include/tc.inc b/meta-arm-bsp/conf=
/machine/include/tc.inc
deleted file mode 100644
index 872f58cbfe00..000000000000
--- a/meta-arm-bsp/conf/machine/include/tc.inc
+++ /dev/null
@@ -1,36 +0,0 @@
-TUNE_FEATURES =3D "aarch64"
-
-require conf/machine/include/arm/arch-armv8a.inc
-
-MACHINEOVERRIDES =3D. "tc:"
-
-# Das U-boot
-UBOOT_MACHINE ?=3D "total_compute_defconfig"
-UBOOT_RD_LOADADDRESS =3D "0x88000000"
-UBOOT_RD_ENTRYPOINT =3D "0x88000000"
-UBOOT_LOADADDRESS =3D "0x80080000"
-UBOOT_ENTRYPOINT =3D "0x80080000"
-
-PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
-
-# OP-TEE
-PREFERRED_VERSION_optee-os ?=3D "3.20%"
-PREFERRED_VERSION_optee-client ?=3D "3.20%"
-PREFERRED_VERSION_optee-test ?=3D "3.20%"
-
-# Cannot use the default zImage on arm64
-KERNEL_IMAGETYPE =3D "Image"
-KERNEL_IMAGETYPES +=3D "fitImage"
-KERNEL_CLASSES =3D " kernel-fitimage "
-
-IMAGE_FSTYPES +=3D "cpio.gz"
-INITRAMFS_IMAGE ?=3D "core-image-minimal"
-IMAGE_NAME_SUFFIX =3D ""
-
-SERIAL_CONSOLES =3D "115200;ttyAMA0"
-
-EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a optee-os"
-PREFERRED_VERSION_trusted-firmware-a ?=3D "2.8.%"
-# FIXME - there is signed image dependency/race with testimage.
-# This should be fixed in oe-core
-TESTIMAGEDEPENDS:append =3D " virtual/kernel:do_deploy"
diff --git a/meta-arm-bsp/conf/machine/tc1.conf b/meta-arm-bsp/conf/machi=
ne/tc1.conf
deleted file mode 100644
index a0f2967bb9b1..000000000000
--- a/meta-arm-bsp/conf/machine/tc1.conf
+++ /dev/null
@@ -1,31 +0,0 @@
-# Configuration for TC1
-
-#@TYPE: Machine
-#@NAME: TC1
-#@DESCRIPTION: Machine configuration for TC1
-
-require conf/machine/include/tc.inc
-
-TEST_TARGET =3D "OEFVPTarget"
-TEST_SUITES =3D "fvp_boot"
-
-# FVP Config
-FVP_PROVIDER ?=3D "fvp-tc1-native"
-FVP_EXE ?=3D "FVP_TC1"
-
-# FVP Parameters
-FVP_CONFIG[css.scp.ROMloader.fname] ?=3D "scp_romfw.bin"
-FVP_CONFIG[css.trustedBootROMloader.fname] ?=3D "bl1-tc.bin"
-FVP_CONFIG[board.flashloader0.fname] ?=3D "fip_gpt-tc.bin"
-
-#FVP_CONFIG[board.hostbridge.userNetworking] ?=3D "true"
-#FVP_CONFIG[board.hostbridge.userNetPorts] ?=3D "2222=3D22"
-#smsc ethernet takes a very long time to come up.  disable now to preven=
t testimage timeout
-#FVP_CONFIG[board.smsc_91c111.enabled] ?=3D "1"
-
-FVP_CONSOLE =3D "terminal_s1"
-FVP_TERMINALS[soc.terminal_s0] ?=3D "Secure Console"
-FVP_TERMINALS[soc.terminal_s1] ?=3D "Console"
-
-# Boot image
-FVP_DATA ?=3D "board.dram=3DfitImage-core-image-minimal-tc1-tc1@0x200000=
00"
diff --git a/meta-arm-bsp/documentation/tc1.md b/meta-arm-bsp/documentati=
on/tc1.md
deleted file mode 100644
index 464f77ee0a42..000000000000
--- a/meta-arm-bsp/documentation/tc1.md
+++ /dev/null
@@ -1,32 +0,0 @@
-# TC1 Platform Support in meta-arm-bsp
-
-## Overview
-The Total Compute platform provides an envelope for all of Arm's latest =
IP and
-software solutions, optimised to work together. Further information can =
be
-found on the Total Compute community page:
-https://community.arm.com/developer/tools-software/oss-platforms/w/docs/=
606/total-compute
-
-The user guide for TC1 platform with detailed instructions for
-syncing and building the source code and running on TC1 Fixed Virtual Pl=
atform
-for poky and android distributions is available at:
-https://git.linaro.org/landing-teams/working/arm/arm-reference-platforms=
.git/tree/docs/tc1/user-guide.rst
-
-## Building
-In the local.conf file, MACHINE should be set as follows:
-MACHINE =3D "tc1"
-
-To build the required binaries for tc1, run the commmand:
-```bash$ bitbake tc-artifacts-image```
-
-Trusted-firmware-a is the final component to be built with the rest of t=
he
-components dependent of it, therefore building tc-artifacts-image which =
depends
-on trusted-firmware-a will build all the required binaries.
-
-## Running
-To run the produced binaries in a TC1 Fixed Virtual Platform please get
-the run scripts at:
-https://git.linaro.org/landing-teams/working/arm/model-scripts.git/
-
-and follow the instructions in the user-guide.rst available in:
-https://git.linaro.org/landing-teams/working/arm/arm-reference-platforms=
.git/tree/docs/tc1/user-guide.rst
-
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc b/meta-arm-b=
sp/recipes-bsp/hafnium/hafnium-tc.inc
deleted file mode 100644
index 4e5368eb7b5d..000000000000
--- a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc
+++ /dev/null
@@ -1,8 +0,0 @@
-# TC specific configuration
-
-COMPATIBLE_MACHINE =3D "(tc?)"
-HAFNIUM_PLATFORM =3D "secure_tc"
-
-do_compile() {
-    PATH=3D"${S}/prebuilts/linux-x64/clang/bin:$PATH" oe_runmake -C ${S}
-}
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc b/=
meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc
deleted file mode 100644
index 87160598d5cb..000000000000
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc
+++ /dev/null
@@ -1,6 +0,0 @@
-# TC specific SCP configuration
-
-COMPATIBLE_MACHINE =3D "(tc1)"
-SCP_PRODUCT_GROUP =3D "totalcompute"
-
-FW_TARGETS =3D "scp"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-tc.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-=
a-tc.inc
deleted file mode 100644
index c14629fd19b4..000000000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.i=
nc
+++ /dev/null
@@ -1,134 +0,0 @@
-# TC0 specific TFA configuration
-
-DEPENDS +=3D "scp-firmware util-linux-native gptfdisk-native"
-
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/tc:"
-SRC_URI:append =3D " \
-    file://generate_metadata.py \
-    "
-
-COMPATIBLE_MACHINE =3D "(tc?)"
-
-TFA_PLATFORM =3D "tc"
-TFA_BUILD_TARGET =3D "all fip"
-TFA_UBOOT =3D "1"
-TFA_INSTALL_TARGET =3D "bl1 fip"
-TFA_MBEDTLS =3D "1"
-TFA_DEBUG =3D "1"
-
-TFA_SPD =3D "spmd"
-TFA_SPMD_SPM_AT_SEL2 =3D "1"
-
-TFA_TARGET_PLATFORM:tc0 =3D "0"
-TFA_TARGET_PLATFORM:tc1 =3D "1"
-
-EXTRA_OEMAKE +=3D "TARGET_PLATFORM=3D${TFA_TARGET_PLATFORM}"
-
-# Set optee as SP. Set spmc manifest and sp layout file to optee
-DEPENDS +=3D "optee-os"
-
-TFA_SP_LAYOUT_FILE =3D "${RECIPE_SYSROOT}/${nonarch_base_libdir}/firmwar=
e/sp_layout.json"
-TFA_ARM_SPMC_MANIFEST_DTS =3D "plat/arm/board/tc/fdts/tc_spmc_optee_sp_m=
anifest.dts"
-
-EXTRA_OEMAKE +=3D "SCP_BL2=3D${RECIPE_SYSROOT}/firmware/scp_ramfw.bin"
-EXTRA_OEMAKE +=3D "TRUSTED_BOARD_BOOT=3D1 GENERATE_COT=3D1 ARM_ROTPK_LOC=
ATION=3Ddevel_rsa \
-                     ROT_KEY=3Dplat/arm/board/common/rotpk/arm_rotprivk_=
rsa.pem"
-EXTRA_OEMAKE +=3D "PSA_FWU_SUPPORT=3D1 ARM_GPT_SUPPORT=3D1"
-EXTRA_OEMAKE +=3D "CTX_INCLUDE_MTE_REGS=3D1"
-
-do_generate_gpt() {
-    gpt_image=3D"${BUILD_DIR}/fip_gpt.bin"
-    fip_bin=3D"${BUILD_DIR}/fip.bin"
-    # the FIP partition type is not standardized, so generate one
-    fip_type_uuid=3D`uuidgen --sha1 --namespace @dns --name "fip_type_uu=
id"`
-    # metadata partition type UUID, specified by the document:
-    # Platform Security Firmware Update for the A-profile Arm Architectu=
re
-    # version: 1.0BET0
-    metadata_type_uuid=3D"8a7a84a0-8387-40f6-ab41-a8b9a5a60d23"
-    location_uuid=3D`uuidgen`
-    FIP_A_uuid=3D`uuidgen`
-    FIP_B_uuid=3D`uuidgen`
-
-    # maximum FIP size 4MB. This is the current size of the FIP rounded =
up to an integer number of MB.
-    fip_max_size=3D4194304
-    fip_bin_size=3D$(stat -c %s $fip_bin)
-    if [ $fip_max_size -lt $fip_bin_size ]; then
-        bberror "FIP binary ($fip_bin_size bytes) is larger than the GPT=
 partition ($fip_max_size bytes)"
-    fi
-
-    # maximum metadata size 512B. This is the current size of the metada=
ta rounded up to an integer number of sectors.
-    metadata_max_size=3D512
-    metadata_file=3D"${BUILD_DIR}/metadata.bin"
-    python3 ${WORKDIR}/generate_metadata.py --metadata_file $metadata_fi=
le \
-                                            --img_type_uuids $fip_type_u=
uid \
-                                            --location_uuids $location_u=
uid \
-                                            --img_uuids $FIP_A_uuid $FIP=
_B_uuid
-
-    # create GPT image. The GPT contains 2 FIP partitions: FIP_A and FIP=
_B, and 2 metadata partitions: FWU-Metadata and Bkup-FWU-Metadata.
-    # the GPT layout is the following:
-    # -----------------------
-    # Protective MBR
-    # -----------------------
-    # Primary GPT Header
-    # -----------------------
-    # FIP_A
-    # -----------------------
-    # FIP_B
-    # -----------------------
-    # FWU-Metadata
-    # -----------------------
-    # Bkup-FWU-Metadata
-    # -----------------------
-    # Secondary GPT Header
-    # -----------------------
-
-    sector_size=3D512
-    gpt_header_size=3D33 # valid only for 512-byte sectors
-    num_sectors_fip=3D`expr $fip_max_size / $sector_size`
-    num_sectors_metadata=3D`expr $metadata_max_size / $sector_size`
-    start_sector_1=3D`expr 1 + $gpt_header_size` # size of MBR is 1 sect=
or
-    start_sector_2=3D`expr $start_sector_1 + $num_sectors_fip`
-    start_sector_3=3D`expr $start_sector_2 + $num_sectors_fip`
-    start_sector_4=3D`expr $start_sector_3 + $num_sectors_metadata`
-    num_sectors_gpt=3D`expr $start_sector_4 + $num_sectors_metadata + $g=
pt_header_size`
-    gpt_size=3D`expr $num_sectors_gpt \* $sector_size`
-
-    # create raw image
-    dd if=3D/dev/zero of=3D$gpt_image bs=3D$gpt_size count=3D1
-
-    # create the GPT layout
-    sgdisk $gpt_image \
-           --set-alignment 1 \
-           --disk-guid $location_uuid \
-           \
-           --new 1:$start_sector_1:+$num_sectors_fip \
-           --change-name 1:FIP_A \
-           --typecode 1:$fip_type_uuid \
-           --partition-guid 1:$FIP_A_uuid \
-           \
-           --new 2:$start_sector_2:+$num_sectors_fip \
-           --change-name 2:FIP_B \
-           --typecode 2:$fip_type_uuid \
-           --partition-guid 2:$FIP_B_uuid \
-           \
-           --new 3:$start_sector_3:+$num_sectors_metadata \
-           --change-name 3:FWU-Metadata \
-           --typecode 3:$metadata_type_uuid \
-           \
-           --new 4:$start_sector_4:+$num_sectors_metadata \
-           --change-name 4:Bkup-FWU-Metadata \
-           --typecode 4:$metadata_type_uuid
-
-    # populate the GPT partitions
-    dd if=3D$fip_bin of=3D$gpt_image bs=3D$sector_size seek=3D$start_sec=
tor_1 count=3D$num_sectors_fip conv=3Dnotrunc
-    dd if=3D$fip_bin of=3D$gpt_image bs=3D$sector_size seek=3D$start_sec=
tor_2 count=3D$num_sectors_fip conv=3Dnotrunc
-    dd if=3D$metadata_file of=3D$gpt_image bs=3D$sector_size seek=3D$sta=
rt_sector_3 count=3D$num_sectors_metadata conv=3Dnotrunc
-    dd if=3D$metadata_file of=3D$gpt_image bs=3D$sector_size seek=3D$sta=
rt_sector_4 count=3D$num_sectors_metadata conv=3Dnotrunc
-}
-
-addtask do_generate_gpt after do_compile before do_install
-
-do_install:append() {
-    install -m 0644 ${BUILD_DIR}/fip_gpt.bin ${D}/firmware/fip_gpt-tc.bi=
n
-    ln -sf fip_gpt-tc.bin ${D}/firmware/fip_gpt.bin
-}
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_2.8.6.bb b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwar=
e-a_2.8.6.bb
deleted file mode 100644
index ef7ea5981b91..000000000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.8.=
6.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-require recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
-
-# TF-A v2.8.6
-SRCREV_tfa =3D "ff0bd5f9bb2ba2f31fb9cec96df917747af9e92d"
-SRCBRANCH =3D "lts-v2.8"
-
-SRC_URI +=3D "file://rwx-segments.patch"
-
-LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3Db2c740efedc159745b9=
b31f88ff03dde"
-
-# mbed TLS v2.28.2
-SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3Dmbedtls-2.28"
-SRCREV_mbedtls =3D "89f040a5c938985c5f30728baed21e49d0846a53"
-
-LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D3b83ef96387f1=
4655fc854ddc3c6bd57"
-
-do_compile:prepend() {
-    sed -i '/^LDLIBS/ s,$, \$\{BUILD_LDFLAGS},' ${S}/tools/fiptool/Makef=
ile
-}
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-tc.inc b/meta-arm-bsp=
/recipes-bsp/u-boot/u-boot-tc.inc
deleted file mode 100644
index ca182c557ca9..000000000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-tc.inc
+++ /dev/null
@@ -1,5 +0,0 @@
-# TC0 and TC1 specific U-boot support=20
-
-SRC_URI:append =3D " \
-    file://bootargs.cfg \
-    "
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0001-W=
IP-Enable-managed-exit.patch b/meta-arm-bsp/recipes-security/optee/files/=
optee-os/tc/0001-WIP-Enable-managed-exit.patch
deleted file mode 100644
index 4571409bc64e..000000000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0001-WIP-Enab=
le-managed-exit.patch
+++ /dev/null
@@ -1,120 +0,0 @@
-From f449f6fdcbd987e18a26f0daeccfa447fe76821a Mon Sep 17 00:00:00 2001
-From: Olivier Deprez <olivier.deprez@arm.com>
-Date: Mon, 16 Nov 2020 10:14:02 +0100
-Subject: [PATCH] WIP: Enable managed exit
-
-This change declares OP-TEE SP as supporting managed exit in response to
-a NS interrupt triggering while the SWd runs.
-
-At init OP-TEE enables (HF_INTERRUPT_ENABLE) the managed exit virtual
-interrupt through the Hafnium para-virtualized interface.
-
-Physical interrupts are trapped to the SPMC which injects a managed exit
-interrupt to OP-TEE. The managed exit interrupt is acknowledged by
-OP-TEE by HF_INTERUPT_GET hvc call.
-
-Note: this code change is meant with in mind the SPMC runs at SEL2. It
-needs slight refactoring such that it does not break the SEL1 SPMC
-configuration.
-
-Change-Id: I9a95f36cf517c11048ff04680007f40259c4f636
-Signed-off-by: Olivier Deprez <olivier.deprez@arm.com>
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-
----
- core/arch/arm/kernel/boot.c                          | 12 ++++++++++++
- core/arch/arm/kernel/thread_a64.S                    | 11 ++++++++++-
- core/arch/arm/kernel/thread_spmc.c                   | 11 +++++++++++
- .../arm/plat-totalcompute/fdts/optee_sp_manifest.dts |  1 +
- 4 files changed, 34 insertions(+), 1 deletion(-)
-
-diff --git a/core/arch/arm/kernel/boot.c b/core/arch/arm/kernel/boot.c
-index dd34173e8..7d2ac74e8 100644
---- a/core/arch/arm/kernel/boot.c
-+++ b/core/arch/arm/kernel/boot.c
-@@ -1424,6 +1424,18 @@ static void init_secondary_helper(unsigned long n=
sec_entry)
- 	init_vfp_sec();
- 	init_vfp_nsec();
-=20
-+	/* Enable managed exit interrupt for secondary core. */
-+	__asm__ volatile (
-+		"mov x0, %0;"
-+		"mov x1, %1;"
-+		"mov x2, %2;"
-+		"mov x3, %3;"
-+		"hvc #0"
-+		: : "i" (0xff03), "i" (4), "i" (1), "i" (1));
-+
-+	IMSG("%s core %lu: enabled managed exit interrupt.",
-+		__func__, get_core_pos());
-+
- 	IMSG("Secondary CPU %zu switching to normal world boot", get_core_pos(=
));
- }
-=20
-diff --git a/core/arch/arm/kernel/thread_a64.S b/core/arch/arm/kernel/th=
read_a64.S
-index 4fa97de24..4facc7631 100644
---- a/core/arch/arm/kernel/thread_a64.S
-+++ b/core/arch/arm/kernel/thread_a64.S
-@@ -1162,6 +1162,14 @@ END_FUNC el0_sync_abort
- 	bl	dcache_op_louis
- 	ic	iallu
- #endif
-+
-+	/* HF_INTERRUPT_GET */
-+	mov	x0, #0xff04
-+	hvc	#0
-+	/* Expect managed exit interrupt */
-+	cmp	x0, #4
-+	bne	.
-+
- 	/*
- 	 * Mark current thread as suspended
- 	 */
-@@ -1318,8 +1326,9 @@ LOCAL_FUNC elx_irq , :
- #endif
- END_FUNC elx_irq
-=20
-+#define HF_MANAGED_EXIT		1
- LOCAL_FUNC elx_fiq , :
--#if defined(CFG_ARM_GICV3)
-+#if defined(CFG_ARM_GICV3) || defined (HF_MANAGED_EXIT)
- 	foreign_intr_handler	fiq
- #else
- 	native_intr_handler	fiq
-diff --git a/core/arch/arm/kernel/thread_spmc.c b/core/arch/arm/kernel/t=
hread_spmc.c
-index 3b4ac0b4e..8f7c18dfa 100644
---- a/core/arch/arm/kernel/thread_spmc.c
-+++ b/core/arch/arm/kernel/thread_spmc.c
-@@ -1517,6 +1517,17 @@ static TEE_Result spmc_init(void)
- 	my_endpoint_id =3D spmc_get_id();
- 	DMSG("My endpoint ID %#x", my_endpoint_id);
-=20
-+	/* Enable managed exit interrupt for boot core. */
-+	__asm__ volatile (
-+		"mov x0, %0;"
-+		"mov x1, %1;"
-+		"mov x2, %2;"
-+		"mov x3, %3;"
-+		"hvc #0"
-+		: : "i" (0xff03), "i" (4), "i" (1), "i" (1));
-+
-+	IMSG("%s enabled managed exit interrupt.", __func__);
-+
- 	return TEE_SUCCESS;
- }
- #endif /* !defined(CFG_CORE_SEL1_SPMC) */
-diff --git a/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts =
b/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts
-index 3ebbaddc8..56e69f372 100644
---- a/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts
-+++ b/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts
-@@ -24,6 +24,7 @@
- 	xlat-granule =3D <0>; /* 4KiB */
- 	boot-order =3D <0>;
- 	messaging-method =3D <0x3>; /* Direct request/response supported */
-+	managed-exit; /* Managed exit supported */
-=20
- 	device-regions {
- 		compatible =3D "arm,ffa-manifest-device-regions";
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0002-p=
lat-totalcompute-fix-TZDRAM-start-and-size.patch b/meta-arm-bsp/recipes-s=
ecurity/optee/files/optee-os/tc/0002-plat-totalcompute-fix-TZDRAM-start-a=
nd-size.patch
deleted file mode 100644
index c516be4638ce..000000000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0002-plat-tot=
alcompute-fix-TZDRAM-start-and-size.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 5ddda749c60dce834bcd79e8b8d904858319adc0 Mon Sep 17 00:00:00 2001
-From: Rupinderjit Singh <rupinderjit.singh@arm.com>
-Date: Tue, 7 Feb 2023 09:45:02 +0000
-Subject: [PATCH] plat-totalcompute: update TZDRAM_SIZE
-
-For CFG_CORE_SEL2_SPMC, manifest size is increased from 0x1000 to
-0x4000 for boot protocol support.
-
-Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
-Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
-
-Upstream-Status: Backport
-Signed-off-by: Jon Mason <jon.mason@arm.com>
-
----
- core/arch/arm/plat-totalcompute/conf.mk | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/core/arch/arm/plat-totalcompute/conf.mk b/core/arch/arm/pla=
t-totalcompute/conf.mk
-index b39ac0f0667f..2f6c0ee1460a 100644
---- a/core/arch/arm/plat-totalcompute/conf.mk
-+++ b/core/arch/arm/plat-totalcompute/conf.mk
-@@ -32,8 +32,9 @@ ifeq ($(CFG_CORE_SEL1_SPMC),y)
- CFG_TZDRAM_START ?=3D 0xfd000000
- CFG_TZDRAM_SIZE  ?=3D 0x02000000
- else ifeq ($(CFG_CORE_SEL2_SPMC),y)
--CFG_TZDRAM_START ?=3D 0xfd281000
--CFG_TZDRAM_SIZE  ?=3D 0x01d7f000
-+CFG_TZDRAM_START ?=3D 0xfd284000
-+# TZDRAM size 0x1980000 - 0x4000 manifest size
-+CFG_TZDRAM_SIZE  ?=3D 0x0197c000
- else
- CFG_TZDRAM_START ?=3D 0xff000000
- CFG_TZDRAM_SIZE  ?=3D 0x01000000
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-test/tc/0001=
-xtest-Limit-tests-to-a-single-thread.patch b/meta-arm-bsp/recipes-securi=
ty/optee/files/optee-test/tc/0001-xtest-Limit-tests-to-a-single-thread.pa=
tch
deleted file mode 100644
index 370a81c1d558..000000000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-test/tc/0001-xtest-=
Limit-tests-to-a-single-thread.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 73bef38c5697cd6bd3ddbe9046681087f4f6454e Mon Sep 17 00:00:00 2001
-From: Ben Horgan <ben.horgan@arm.com>
-Date: Thu, 27 Jan 2022 10:33:04 +0000
-Subject: [PATCH] xtest: Limit tests to a single thread
-
-Signed-off-by: Ben Horgan <ben.horgan@arm.com>
-Upstream-Status: Inappropriate [Workaround for intermittent failures]
----
- host/xtest/regression_1000.c | 2 +-
- host/xtest/regression_2000.c | 2 +-
- host/xtest/regression_6000.c | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/host/xtest/regression_1000.c b/host/xtest/regression_1000.c
-index 9ee9d02..82d1def 100644
---- a/host/xtest/regression_1000.c
-+++ b/host/xtest/regression_1000.c
-@@ -1080,7 +1080,7 @@ static void *test_1013_thread(void *arg)
- 	return NULL;
- }
-=20
--#define NUM_THREADS 3
-+#define NUM_THREADS 1
-=20
- static void xtest_tee_test_1013_single(ADBG_Case_t *c, double *mean_con=
currency,
- 				       const TEEC_UUID *uuid)
-diff --git a/host/xtest/regression_2000.c b/host/xtest/regression_2000.c
-index 0591a42..a9f4b95 100644
---- a/host/xtest/regression_2000.c
-+++ b/host/xtest/regression_2000.c
-@@ -499,7 +499,7 @@ out:
- 	return NULL;
- }
-=20
--#define NUM_THREADS	3
-+#define NUM_THREADS	1
-=20
- static void xtest_tee_test_2002(ADBG_Case_t *c)
- {
-diff --git a/host/xtest/regression_6000.c b/host/xtest/regression_6000.c
-index ca1c254..d67ea7f 100644
---- a/host/xtest/regression_6000.c
-+++ b/host/xtest/regression_6000.c
-@@ -1568,7 +1568,7 @@ exit:
- }
-=20
-=20
--#define NUM_THREADS 4
-+#define NUM_THREADS 1
- static void xtest_tee_test_6016_loop(ADBG_Case_t *c, uint32_t storage_i=
d)
- {
- 	struct test_6016_thread_arg arg[NUM_THREADS] =3D { };
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-security/optee/optee-client_3.20.0.bb b=
/meta-arm-bsp/recipes-security/optee/optee-client_3.20.0.bb
deleted file mode 100644
index 3daab7f8387c..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-client_3.20.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require recipes-security/optee/optee-client.inc
-
-SRCREV =3D "dd2d39b49975d2ada7870fe2b7f5a84d0d3860dc"
-
-inherit pkgconfig
-DEPENDS +=3D "util-linux"
-EXTRA_OEMAKE +=3D "PKG_CONFIG=3Dpkg-config"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0001-all=
ow-setting-sysroot-for-libgcc-lookup.patch b/meta-arm-bsp/recipes-securit=
y/optee/optee-os-3.20.0/0001-allow-setting-sysroot-for-libgcc-lookup.patc=
h
deleted file mode 100644
index 54b667a6e54f..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0001-allow-sett=
ing-sysroot-for-libgcc-lookup.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 843eb2ef918d5ae3d09de088110cb026ca25306b Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Tue, 26 May 2020 14:38:02 -0500
-Subject: [PATCH] allow setting sysroot for libgcc lookup
-
-Explicitly pass the new variable LIBGCC_LOCATE_CFLAGS variable when sear=
ching
-for the compiler libraries as there's no easy way to reliably pass --sys=
root
-otherwise.
-
-Upstream-Status: Pending [https://github.com/OP-TEE/optee_os/issues/4188=
]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- mk/gcc.mk | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/mk/gcc.mk b/mk/gcc.mk
-index adc77a24f25e..81bfa78ad8d7 100644
---- a/mk/gcc.mk
-+++ b/mk/gcc.mk
-@@ -13,11 +13,11 @@ nostdinc$(sm)	:=3D -nostdinc -isystem $(shell $(CC$(=
sm)) \
- 			-print-file-name=3Dinclude 2> /dev/null)
-=20
- # Get location of libgcc from gcc
--libgcc$(sm)  	:=3D $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
-+libgcc$(sm)  	:=3D $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$=
(arch-bits-$(sm))) \
- 			-print-libgcc-file-name 2> /dev/null)
--libstdc++$(sm)	:=3D $(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $=
(comp-cxxflags$(sm)) \
-+libstdc++$(sm)	:=3D $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CXXFL=
AGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
- 			-print-file-name=3Dlibstdc++.a 2> /dev/null)
--libgcc_eh$(sm)	:=3D $(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $=
(comp-cxxflags$(sm)) \
-+libgcc_eh$(sm)	:=3D $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CXXFL=
AGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
- 			-print-file-name=3Dlibgcc_eh.a 2> /dev/null)
-=20
- # Define these to something to discover accidental use
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0002-opt=
ee-enable-clang-support.patch b/meta-arm-bsp/recipes-security/optee/optee=
-os-3.20.0/0002-optee-enable-clang-support.patch
deleted file mode 100644
index b3e309801927..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0002-optee-enab=
le-clang-support.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 0ca5ef7c8256dbd9690a01a82397bc16a123e179 Mon Sep 17 00:00:00 2001
-From: Brett Warren <brett.warren@arm.com>
-Date: Wed, 23 Sep 2020 09:27:34 +0100
-Subject: [PATCH] optee: enable clang support
-
-When compiling with clang, the LIBGCC_LOCATE_CFLAG variable used
-to provide a sysroot wasn't included, which results in not locating
-compiler-rt. This is mitigated by including the variable as ammended.
-
-Upstream-Status: Pending
-ChangeId: 8ba69a4b2eb8ebaa047cb266c9aa6c2c3da45701
-Signed-off-by: Brett Warren <brett.warren@arm.com>
----
- mk/clang.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mk/clang.mk b/mk/clang.mk
-index a045beee8482..1ebe2f702dcd 100644
---- a/mk/clang.mk
-+++ b/mk/clang.mk
-@@ -30,7 +30,7 @@ comp-cflags-warns-clang :=3D -Wno-language-extension-t=
oken \
-=20
- # Note, use the compiler runtime library (libclang_rt.builtins.*.a) ins=
tead of
- # libgcc for clang
--libgcc$(sm)	:=3D $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
-+libgcc$(sm)	:=3D $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$(a=
rch-bits-$(sm))) \
- 			-rtlib=3Dcompiler-rt -print-libgcc-file-name 2> /dev/null)
-=20
- # Core ASLR relies on the executable being ready to run from its prefer=
red load
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0003-cor=
e-link-add-no-warn-rwx-segments.patch b/meta-arm-bsp/recipes-security/opt=
ee/optee-os-3.20.0/0003-core-link-add-no-warn-rwx-segments.patch
deleted file mode 100644
index 5d4191ff99b3..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0003-core-link-=
add-no-warn-rwx-segments.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 741df4df0ec7b69b0573cff265dc1ae7cb70b55c Mon Sep 17 00:00:00 2001
-From: Jerome Forissier <jerome.forissier@linaro.org>
-Date: Fri, 5 Aug 2022 09:48:03 +0200
-Subject: [PATCH] core: link: add --no-warn-rwx-segments
-
-Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
-Upstream-Status: Backport [https://github.com/OP-TEE/optee_os/pull/5474]
-
-binutils ld.bfd generates one RWX LOAD segment by merging several sectio=
ns
-with mixed R/W/X attributes (.text, .rodata, .data). After version 2.38 =
it
-also warns by default when that happens [1], which breaks the build due =
to
---fatal-warnings. The RWX segment is not a problem for the TEE core, sin=
ce
-that information is not used to set memory permissions. Therefore, silen=
ce
-the warning.
-
-Link: [1] https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3D=
ba951afb99912da01a6e8434126b8fac7aa75107
-Link: https://sourceware.org/bugzilla/show_bug.cgi?id=3D29448
-Reported-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
-Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
-Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
----
- core/arch/arm/kernel/link.mk | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/core/arch/arm/kernel/link.mk b/core/arch/arm/kernel/link.mk
-index 0e96e606cd9d..3fbcb6804c6f 100644
---- a/core/arch/arm/kernel/link.mk
-+++ b/core/arch/arm/kernel/link.mk
-@@ -37,6 +37,7 @@ link-ldflags +=3D --sort-section=3Dalignment
- link-ldflags +=3D --fatal-warnings
- link-ldflags +=3D --gc-sections
- link-ldflags +=3D $(link-ldflags-common)
-+link-ldflags +=3D $(call ld-option,--no-warn-rwx-segments)
-=20
- link-ldadd  =3D $(LDADD)
- link-ldadd +=3D $(ldflags-external)
-@@ -61,6 +62,7 @@ link-script-cppflags :=3D \
- 		$(cppflagscore))
-=20
- ldargs-all_objs :=3D -T $(link-script-dummy) --no-check-sections \
-+		   $(call ld-option,--no-warn-rwx-segments) \
- 		   $(link-ldflags-common) \
- 		   $(link-objs) $(link-ldadd) $(libgcccore)
- cleanfiles +=3D $(link-out-dir)/all_objs.o
-@@ -75,7 +77,7 @@ $(link-out-dir)/unpaged_entries.txt: $(link-out-dir)/a=
ll_objs.o
- 		$(AWK) '/ ____keep_pager/ { printf "-u%s ", $$3 }' > $@
-=20
- unpaged-ldargs :=3D -T $(link-script-dummy) --no-check-sections --gc-se=
ctions \
--		 $(link-ldflags-common)
-+		 $(link-ldflags-common) $(call ld-option,--no-warn-rwx-segments)
- unpaged-ldadd :=3D $(objs) $(link-ldadd) $(libgcccore)
- cleanfiles +=3D $(link-out-dir)/unpaged.o
- $(link-out-dir)/unpaged.o: $(link-out-dir)/unpaged_entries.txt
-@@ -104,7 +106,7 @@ $(link-out-dir)/init_entries.txt: $(link-out-dir)/al=
l_objs.o
- 		$(AWK) '/ ____keep_init/ { printf "-u%s ", $$3 }' > $@
-=20
- init-ldargs :=3D -T $(link-script-dummy) --no-check-sections --gc-secti=
ons \
--	       $(link-ldflags-common)
-+	       $(link-ldflags-common) $(call ld-option,--no-warn-rwx-segments)
- init-ldadd :=3D $(link-objs-init) $(link-out-dir)/version.o  $(link-lda=
dd) \
- 	      $(libgcccore)
- cleanfiles +=3D $(link-out-dir)/init.o
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0004-cor=
e-Define-section-attributes-for-clang.patch b/meta-arm-bsp/recipes-securi=
ty/optee/optee-os-3.20.0/0004-core-Define-section-attributes-for-clang.pa=
tch
deleted file mode 100644
index 6229be9949ef..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0004-core-Defin=
e-section-attributes-for-clang.patch
+++ /dev/null
@@ -1,240 +0,0 @@
-From 162493e5b212b9d7391669a55be09b69b97a9cf8 Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Wed, 21 Dec 2022 10:55:58 +0000
-Subject: [PATCH] core: Define section attributes for clang
-
-Clang's attribute section is not same as gcc, here we need to add flags
-to sections so they can be eventually collected by linker into final
-output segments. Only way to do so with clang is to use
-
-pragma clang section ...
-
-The behavious is described here [1], this allows us to define names bss
-sections. This was not an issue until clang-15 where LLD linker starts
-to detect the section flags before merging them and throws the following
-errors
-
-| ld.lld: error: section type mismatch for .nozi.kdata_page
-| >>> /mnt/b/yoe/master/build/tmp/work/qemuarm64-yoe-linux/optee-os-tade=
vkit/3.17.0-r0/build/core/arch/arm/kernel/thread.o:(.nozi.kdata_page): SH=
T_PROGBITS
-| >>> output section .nozi: SHT_NOBITS
-|
-| ld.lld: error: section type mismatch for .nozi.mmu.l2
-| >>> /mnt/b/yoe/master/build/tmp/work/qemuarm64-yoe-linux/optee-os-tade=
vkit/3.17.0-r0/build/core/arch/arm/mm/core_mmu_lpae.o:(.nozi.mmu.l2): SHT=
_PROGBITS
-| >>> output section .nozi: SHT_NOBITS
-
-These sections should be carrying SHT_NOBITS but so far it was not
-possible to do so, this patch tries to use clangs pragma to get this
-going and match the functionality with gcc.
-
-[1] https://intel.github.io/llvm-docs/clang/LanguageExtensions.html#spec=
ifying-section-names-for-global-objects-pragma-clang-section
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- core/arch/arm/kernel/thread.c    | 19 +++++++++++++++--
- core/arch/arm/mm/core_mmu_lpae.c | 35 +++++++++++++++++++++++++++----
- core/arch/arm/mm/core_mmu_v7.c   | 36 +++++++++++++++++++++++++++++---
- core/arch/arm/mm/pgt_cache.c     | 12 ++++++++++-
- core/kernel/thread.c             | 13 +++++++++++-
- 5 files changed, 104 insertions(+), 11 deletions(-)
-
-diff --git a/core/arch/arm/kernel/thread.c b/core/arch/arm/kernel/thread=
.c
-index 1cf76a0ca690..1e7f9f96b558 100644
---- a/core/arch/arm/kernel/thread.c
-+++ b/core/arch/arm/kernel/thread.c
-@@ -44,15 +44,30 @@ static size_t thread_user_kcode_size __nex_bss;
- #if defined(CFG_CORE_UNMAP_CORE_AT_EL0) && \
- 	defined(CFG_CORE_WORKAROUND_SPECTRE_BP_SEC) && defined(ARM64)
- long thread_user_kdata_sp_offset __nex_bss;
-+#ifdef __clang__
-+#ifndef CFG_VIRTUALIZATION
-+#pragma clang section bss=3D".nozi.kdata_page"
-+#else
-+#pragma clang section bss=3D".nex_nozi.kdata_page"
-+#endif
-+#endif
- static uint8_t thread_user_kdata_page[
- 	ROUNDUP(sizeof(struct thread_core_local) * CFG_TEE_CORE_NB_CORE,
- 		SMALL_PAGE_SIZE)]
- 	__aligned(SMALL_PAGE_SIZE)
-+#ifndef __clang__
- #ifndef CFG_VIRTUALIZATION
--	__section(".nozi.kdata_page");
-+	__section(".nozi.kdata_page")
- #else
--	__section(".nex_nozi.kdata_page");
-+	__section(".nex_nozi.kdata_page")
- #endif
-+#endif
-+    ;
-+#endif
-+
-+/* reset BSS section to default ( .bss ) */
-+#ifdef __clang__
-+#pragma clang section bss=3D""
- #endif
-=20
- #ifdef ARM32
-diff --git a/core/arch/arm/mm/core_mmu_lpae.c b/core/arch/arm/mm/core_mm=
u_lpae.c
-index 3f08eec623f3..e6dc9261c41e 100644
---- a/core/arch/arm/mm/core_mmu_lpae.c
-+++ b/core/arch/arm/mm/core_mmu_lpae.c
-@@ -233,19 +233,46 @@ typedef uint16_t l1_idx_t;
- typedef uint64_t base_xlat_tbls_t[CFG_TEE_CORE_NB_CORE][NUM_BASE_LEVEL_=
ENTRIES];
- typedef uint64_t xlat_tbl_t[XLAT_TABLE_ENTRIES];
-=20
-+#ifdef __clang__
-+#pragma clang section bss=3D".nozi.mmu.base_table"
-+#endif
- static base_xlat_tbls_t base_xlation_table[NUM_BASE_TABLES]
- 	__aligned(NUM_BASE_LEVEL_ENTRIES * XLAT_ENTRY_SIZE)
--	__section(".nozi.mmu.base_table");
-+#ifndef __clang__
-+	__section(".nozi.mmu.base_table")
-+#endif
-+;
-+#ifdef __clang__
-+#pragma clang section bss=3D""
-+#endif
-=20
-+#ifdef __clang__
-+#pragma clang section bss=3D".nozi.mmu.l2"
-+#endif
- static xlat_tbl_t xlat_tables[MAX_XLAT_TABLES]
--	__aligned(XLAT_TABLE_SIZE) __section(".nozi.mmu.l2");
-+	__aligned(XLAT_TABLE_SIZE)
-+#ifndef __clang__
-+	__section(".nozi.mmu.l2")
-+#endif
-+;
-+#ifdef __clang__
-+#pragma clang section bss=3D""
-+#endif
-=20
- #define XLAT_TABLES_SIZE	(sizeof(xlat_tbl_t) * MAX_XLAT_TABLES)
-=20
-+#ifdef __clang__
-+#pragma clang section bss=3D".nozi.mmu.l2"
-+#endif
- /* MMU L2 table for TAs, one for each thread */
- static xlat_tbl_t xlat_tables_ul1[CFG_NUM_THREADS]
--	__aligned(XLAT_TABLE_SIZE) __section(".nozi.mmu.l2");
--
-+#ifndef __clang__
-+	__aligned(XLAT_TABLE_SIZE) __section(".nozi.mmu.l2")
-+#endif
-+;
-+#ifdef __clang__
-+#pragma clang section bss=3D""
-+#endif
- /*
-  * TAs page table entry inside a level 1 page table.
-  *
-diff --git a/core/arch/arm/mm/core_mmu_v7.c b/core/arch/arm/mm/core_mmu_=
v7.c
-index cd85bd22d385..3e18f54f6cf8 100644
---- a/core/arch/arm/mm/core_mmu_v7.c
-+++ b/core/arch/arm/mm/core_mmu_v7.c
-@@ -204,16 +204,46 @@ typedef uint32_t l1_xlat_tbl_t[NUM_L1_ENTRIES];
- typedef uint32_t l2_xlat_tbl_t[NUM_L2_ENTRIES];
- typedef uint32_t ul1_xlat_tbl_t[NUM_UL1_ENTRIES];
-=20
-+#ifdef __clang__
-+#pragma clang section bss=3D".nozi.mmu.l1"
-+#endif
- static l1_xlat_tbl_t main_mmu_l1_ttb
--		__aligned(L1_ALIGNMENT) __section(".nozi.mmu.l1");
-+		__aligned(L1_ALIGNMENT)
-+#ifndef __clang__
-+       __section(".nozi.mmu.l1")
-+#endif
-+;
-+#ifdef __clang__
-+#pragma clang section bss=3D""
-+#endif
-=20
- /* L2 MMU tables */
-+#ifdef __clang__
-+#pragma clang section bss=3D".nozi.mmu.l2"
-+#endif
- static l2_xlat_tbl_t main_mmu_l2_ttb[MAX_XLAT_TABLES]
--		__aligned(L2_ALIGNMENT) __section(".nozi.mmu.l2");
-+		__aligned(L2_ALIGNMENT)
-+#ifndef __clang__
-+       __section(".nozi.mmu.l2")
-+#endif
-+;
-+#ifdef __clang__
-+#pragma clang section bss=3D""
-+#endif
-=20
- /* MMU L1 table for TAs, one for each thread */
-+#ifdef __clang__
-+#pragma clang section bss=3D".nozi.mmu.ul1"
-+#endif
- static ul1_xlat_tbl_t main_mmu_ul1_ttb[CFG_NUM_THREADS]
--		__aligned(UL1_ALIGNMENT) __section(".nozi.mmu.ul1");
-+		__aligned(UL1_ALIGNMENT)
-+#ifndef __clang__
-+       __section(".nozi.mmu.ul1")
-+#endif
-+;
-+#ifdef __clang__
-+#pragma clang section bss=3D""
-+#endif
-=20
- struct mmu_partition {
- 	l1_xlat_tbl_t *l1_table;
-diff --git a/core/arch/arm/mm/pgt_cache.c b/core/arch/arm/mm/pgt_cache.c
-index 79553c6d2183..b9efdf42780b 100644
---- a/core/arch/arm/mm/pgt_cache.c
-+++ b/core/arch/arm/mm/pgt_cache.c
-@@ -410,8 +410,18 @@ void pgt_init(void)
- 	 * has a large alignment, while .bss has a small alignment. The curren=
t
- 	 * link script is optimized for small alignment in .bss
- 	 */
-+#ifdef __clang__
-+#pragma clang section bss=3D".nozi.mmu.l2"
-+#endif
- 	static uint8_t pgt_tables[PGT_CACHE_SIZE][PGT_SIZE]
--			__aligned(PGT_SIZE) __section(".nozi.pgt_cache");
-+			__aligned(PGT_SIZE)
-+#ifndef __clang__
-+			__section(".nozi.pgt_cache")
-+#endif
-+			;
-+#ifdef __clang__
-+#pragma clang section bss=3D""
-+#endif
- 	size_t n;
-=20
- 	for (n =3D 0; n < ARRAY_SIZE(pgt_tables); n++) {
-diff --git a/core/kernel/thread.c b/core/kernel/thread.c
-index d1f2f3823be7..8de124ae5357 100644
---- a/core/kernel/thread.c
-+++ b/core/kernel/thread.c
-@@ -38,13 +38,24 @@ struct thread_core_local thread_core_local[CFG_TEE_C=
ORE_NB_CORE] __nex_bss;
- 	name[stack_num][sizeof(name[stack_num]) / sizeof(uint32_t) - 1]
- #endif
-=20
-+#define DO_PRAGMA(x) _Pragma (#x)
-+
-+#ifdef __clang__
-+#define DECLARE_STACK(name, num_stacks, stack_size, linkage) \
-+DO_PRAGMA (clang section bss=3D".nozi_stack." #name) \
-+linkage uint32_t name[num_stacks] \
-+		[ROUNDUP(stack_size + STACK_CANARY_SIZE + STACK_CHECK_EXTRA, \
-+			 STACK_ALIGNMENT) / sizeof(uint32_t)] \
-+		__attribute__((aligned(STACK_ALIGNMENT))); \
-+DO_PRAGMA(clang section bss=3D"")
-+#else
- #define DECLARE_STACK(name, num_stacks, stack_size, linkage) \
- linkage uint32_t name[num_stacks] \
- 		[ROUNDUP(stack_size + STACK_CANARY_SIZE + STACK_CHECK_EXTRA, \
- 			 STACK_ALIGNMENT) / sizeof(uint32_t)] \
- 		__attribute__((section(".nozi_stack." # name), \
- 			       aligned(STACK_ALIGNMENT)))
--
-+#endif
- #define GET_STACK(stack) ((vaddr_t)(stack) + STACK_SIZE(stack))
-=20
- DECLARE_STACK(stack_tmp, CFG_TEE_CORE_NB_CORE, STACK_TMP_SIZE,
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0005-cor=
e-arm-S-EL1-SPMC-boot-ABI-update.patch b/meta-arm-bsp/recipes-security/op=
tee/optee-os-3.20.0/0005-core-arm-S-EL1-SPMC-boot-ABI-update.patch
deleted file mode 100644
index e6fe71681285..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0005-core-arm-S=
-EL1-SPMC-boot-ABI-update.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From d0e32b6e202cde672c2b38dc568122a52be716b4 Mon Sep 17 00:00:00 2001
-From: Jens Wiklander <jens.wiklander@linaro.org>
-Date: Mon, 21 Nov 2022 18:17:33 +0100
-Subject: [PATCH] core: arm: S-EL1 SPMC: boot ABI update
-
-Updates the boot ABI for S-EL1 SPMC to align better with other SPMCs,
-like Hafnium, but also with the non-FF-A configuration.
-
-Register usage:
-X0 - TOS FW config [1] address, if not NULL
-X2 - System DTB, if not NULL
-
-Adds check in the default get_aslr_seed() to see if the system DTB is
-present before trying to read kaslr-seed from secure-chosen.
-
-Note that this is an incompatible change and requires corresponding
-change in TF-A ("feat(qemu): update abi between spmd and spmc") [2].
-
-[1] A TF-A concept: TOS_FW_CONFIG - Trusted OS Firmware configuration
-    file. Used by Trusted OS (BL32), that is, OP-TEE in this case
-Link: [2] https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/co=
mmit/?id=3D25ae7ad1878244f78206cc7c91f7bdbd267331a1
-
-Acked-by: Etienne Carriere <etienne.carriere@linaro.org>
-Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
-
-Upstream-Status: Backport [f1f431c7a92671b4fa397976d381cc5ad8adacc4]
-Signed-off-by: Gyorgy Szing <Gyorgy.Szing@arm.com>
----
- core/arch/arm/kernel/boot.c      |  8 +++++++-
- core/arch/arm/kernel/entry_a64.S | 17 ++++++++---------
- 2 files changed, 15 insertions(+), 10 deletions(-)
-
-diff --git a/core/arch/arm/kernel/boot.c b/core/arch/arm/kernel/boot.c
-index dd34173e838d..e02c02b6097d 100644
---- a/core/arch/arm/kernel/boot.c
-+++ b/core/arch/arm/kernel/boot.c
-@@ -1502,11 +1502,17 @@ struct ns_entry_context *boot_core_hpen(void)
- #if defined(CFG_DT)
- unsigned long __weak get_aslr_seed(void *fdt)
- {
--	int rc =3D fdt_check_header(fdt);
-+	int rc =3D 0;
- 	const uint64_t *seed =3D NULL;
- 	int offs =3D 0;
- 	int len =3D 0;
-=20
-+	if (!fdt) {
-+		DMSG("No fdt");
-+		goto err;
-+	}
-+
-+	rc =3D fdt_check_header(fdt);
- 	if (rc) {
- 		DMSG("Bad fdt: %d", rc);
- 		goto err;
-diff --git a/core/arch/arm/kernel/entry_a64.S b/core/arch/arm/kernel/ent=
ry_a64.S
-index 4c6e9d75ca45..047ae1f25cc9 100644
---- a/core/arch/arm/kernel/entry_a64.S
-+++ b/core/arch/arm/kernel/entry_a64.S
-@@ -143,21 +143,20 @@
- 	.endm
-=20
- FUNC _start , :
--#if defined(CFG_CORE_SEL1_SPMC)
- 	/*
--	 * With OP-TEE as SPMC at S-EL1 the SPMD (SPD_spmd) in TF-A passes
--	 * the DTB in x0, pagaeble part in x1 and the rest of the registers
--	 * are unused
-+	 * If CFG_CORE_FFA is enabled, then x0 if non-NULL holds the TOS FW
-+	 * config [1] address, else x0 if non-NULL holds the pagable part
-+	 * address.
-+	 *
-+	 * [1] A TF-A concept: TOS_FW_CONFIG - Trusted OS Firmware
-+	 * configuration file. Used by Trusted OS (BL32), that is, OP-TEE
-+	 * here.
- 	 */
--	mov	x19, x1		/* Save pagable part */
--	mov	x20, x0		/* Save DT address */
--#else
--	mov	x19, x0		/* Save pagable part address */
-+	mov	x19, x0
- #if defined(CFG_DT_ADDR)
- 	ldr     x20, =3DCFG_DT_ADDR
- #else
- 	mov	x20, x2		/* Save DT address */
--#endif
- #endif
-=20
- 	adr	x0, reset_vect_table
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0006-cor=
e-ffa-add-TOS_FW_CONFIG-handling.patch b/meta-arm-bsp/recipes-security/op=
tee/optee-os-3.20.0/0006-core-ffa-add-TOS_FW_CONFIG-handling.patch
deleted file mode 100644
index da0422b97ad4..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0006-core-ffa-a=
dd-TOS_FW_CONFIG-handling.patch
+++ /dev/null
@@ -1,247 +0,0 @@
-From 9da324001fd93e1b3d9bca076e4afddbb5cac289 Mon Sep 17 00:00:00 2001
-From: Balint Dobszay <balint.dobszay@arm.com>
-Date: Fri, 10 Feb 2023 11:07:27 +0100
-Subject: [PATCH] core: ffa: add TOS_FW_CONFIG handling
-
-At boot TF-A passes two DT addresses (HW_CONFIG and TOS_FW_CONFIG), but
-currently only the HW_CONFIG address is saved, the other one is dropped.
-This commit adds functionality to save the TOS_FW_CONFIG too, so we can
-retrieve it later. This is necessary for the CFG_CORE_SEL1_SPMC use
-case, because the SPMC manifest is passed in this DT.
-
-Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
-Signed-off-by: Balint Dobszay <balint.dobszay@arm.com>
-
-Upstream-Status: Backport [809fa817ae6331d98b55f7afaa3c20f8407822e4]
-Signed-off-by: Gyorgy Szing <Gyorgy.Szing@arm.com>
----
- core/arch/arm/kernel/boot.c               | 60 ++++++++++++++++++++++-
- core/arch/arm/kernel/entry_a32.S          |  3 +-
- core/arch/arm/kernel/entry_a64.S          | 13 ++++-
- core/arch/arm/kernel/link_dummies_paged.c |  4 +-
- core/arch/arm/kernel/secure_partition.c   |  2 +-
- core/include/kernel/boot.h                |  7 ++-
- 6 files changed, 81 insertions(+), 8 deletions(-)
-
-diff --git a/core/arch/arm/kernel/boot.c b/core/arch/arm/kernel/boot.c
-index e02c02b6097d..98e13c072d8e 100644
---- a/core/arch/arm/kernel/boot.c
-+++ b/core/arch/arm/kernel/boot.c
-@@ -1,6 +1,7 @@
- // SPDX-License-Identifier: BSD-2-Clause
- /*
-  * Copyright (c) 2015-2022, Linaro Limited
-+ * Copyright (c) 2023, Arm Limited
-  */
-=20
- #include <arm.h>
-@@ -83,6 +84,9 @@ struct dt_descriptor {
- };
-=20
- static struct dt_descriptor external_dt __nex_bss;
-+#ifdef CFG_CORE_SEL1_SPMC
-+static struct dt_descriptor tos_fw_config_dt __nex_bss;
-+#endif
- #endif
-=20
- #ifdef CFG_SECONDARY_INIT_CNTFRQ
-@@ -1224,6 +1228,54 @@ static struct core_mmu_phys_mem *get_nsec_memory(=
void *fdt __unused,
- #endif /*CFG_CORE_DYN_SHM*/
- #endif /*!CFG_DT*/
-=20
-+#if defined(CFG_CORE_SEL1_SPMC) && defined(CFG_DT)
-+void *get_tos_fw_config_dt(void)
-+{
-+	if (!IS_ENABLED(CFG_MAP_EXT_DT_SECURE))
-+		return NULL;
-+
-+	assert(cpu_mmu_enabled());
-+
-+	return tos_fw_config_dt.blob;
-+}
-+
-+static void init_tos_fw_config_dt(unsigned long pa)
-+{
-+	struct dt_descriptor *dt =3D &tos_fw_config_dt;
-+	void *fdt =3D NULL;
-+	int ret =3D 0;
-+
-+	if (!IS_ENABLED(CFG_MAP_EXT_DT_SECURE))
-+		return;
-+
-+	if (!pa)
-+		panic("No TOS_FW_CONFIG DT found");
-+
-+	fdt =3D core_mmu_add_mapping(MEM_AREA_EXT_DT, pa, CFG_DTB_MAX_SIZE);
-+	if (!fdt)
-+		panic("Failed to map TOS_FW_CONFIG DT");
-+
-+	dt->blob =3D fdt;
-+
-+	ret =3D fdt_open_into(fdt, fdt, CFG_DTB_MAX_SIZE);
-+	if (ret < 0) {
-+		EMSG("Invalid Device Tree at %#lx: error %d", pa, ret);
-+		panic();
-+	}
-+
-+	IMSG("TOS_FW_CONFIG DT found");
-+}
-+#else
-+void *get_tos_fw_config_dt(void)
-+{
-+	return NULL;
-+}
-+
-+static void init_tos_fw_config_dt(unsigned long pa __unused)
-+{
-+}
-+#endif /*CFG_CORE_SEL1_SPMC && CFG_DT*/
-+
- #ifdef CFG_CORE_DYN_SHM
- static void discover_nsec_memory(void)
- {
-@@ -1361,10 +1413,16 @@ static bool cpu_nmfi_enabled(void)
-  * Note: this function is weak just to make it possible to exclude it f=
rom
-  * the unpaged area.
-  */
--void __weak boot_init_primary_late(unsigned long fdt)
-+void __weak boot_init_primary_late(unsigned long fdt,
-+				   unsigned long tos_fw_config)
- {
- 	init_external_dt(fdt);
-+	init_tos_fw_config_dt(tos_fw_config);
-+#ifdef CFG_CORE_SEL1_SPMC
-+	tpm_map_log_area(get_tos_fw_config_dt());
-+#else
- 	tpm_map_log_area(get_external_dt());
-+#endif
- 	discover_nsec_memory();
- 	update_external_dt();
- 	configure_console_from_dt();
-diff --git a/core/arch/arm/kernel/entry_a32.S b/core/arch/arm/kernel/ent=
ry_a32.S
-index 0f14ca2f6ad9..3758fd8b7674 100644
---- a/core/arch/arm/kernel/entry_a32.S
-+++ b/core/arch/arm/kernel/entry_a32.S
-@@ -1,7 +1,7 @@
- /* SPDX-License-Identifier: BSD-2-Clause */
- /*
-  * Copyright (c) 2014, Linaro Limited
-- * Copyright (c) 2021, Arm Limited
-+ * Copyright (c) 2021-2023, Arm Limited
-  */
-=20
- #include <arm32_macros.S>
-@@ -560,6 +560,7 @@ shadow_stack_access_ok:
- 	str	r0, [r8, #THREAD_CORE_LOCAL_FLAGS]
- #endif
- 	mov	r0, r6		/* DT address */
-+	mov	r1, #0		/* unused */
- 	bl	boot_init_primary_late
- #ifndef CFG_VIRTUALIZATION
- 	mov	r0, #THREAD_CLF_TMP
-diff --git a/core/arch/arm/kernel/entry_a64.S b/core/arch/arm/kernel/ent=
ry_a64.S
-index 047ae1f25cc9..fa76437fb73c 100644
---- a/core/arch/arm/kernel/entry_a64.S
-+++ b/core/arch/arm/kernel/entry_a64.S
-@@ -1,7 +1,7 @@
- /* SPDX-License-Identifier: BSD-2-Clause */
- /*
-  * Copyright (c) 2015-2022, Linaro Limited
-- * Copyright (c) 2021, Arm Limited
-+ * Copyright (c) 2021-2023, Arm Limited
-  */
-=20
- #include <platform_config.h>
-@@ -320,7 +320,11 @@ clear_nex_bss:
- 	bl	core_mmu_set_default_prtn_tbl
- #endif
-=20
-+#ifdef CFG_CORE_SEL1_SPMC
-+	mov	x0, xzr		/* pager not used */
-+#else
- 	mov	x0, x19		/* pagable part address */
-+#endif
- 	mov	x1, #-1
- 	bl	boot_init_primary_early
-=20
-@@ -337,7 +341,12 @@ clear_nex_bss:
- 	mov	x22, x0
- 	str	wzr, [x22, #THREAD_CORE_LOCAL_FLAGS]
- #endif
--	mov	x0, x20		/* DT address */
-+	mov	x0, x20		/* DT address also known as HW_CONFIG */
-+#ifdef CFG_CORE_SEL1_SPMC
-+	mov	x1, x19		/* TOS_FW_CONFIG DT address */
-+#else
-+	mov	x1, xzr		/* unused */
-+#endif
- 	bl	boot_init_primary_late
- #ifdef CFG_CORE_PAUTH
- 	init_pauth_per_cpu
-diff --git a/core/arch/arm/kernel/link_dummies_paged.c b/core/arch/arm/k=
ernel/link_dummies_paged.c
-index 3b8287e06a11..023a5f3f558b 100644
---- a/core/arch/arm/kernel/link_dummies_paged.c
-+++ b/core/arch/arm/kernel/link_dummies_paged.c
-@@ -1,6 +1,7 @@
- // SPDX-License-Identifier: BSD-2-Clause
- /*
-  * Copyright (c) 2017-2021, Linaro Limited
-+ * Copyright (c) 2023, Arm Limited
-  */
- #include <compiler.h>
- #include <initcall.h>
-@@ -27,7 +28,8 @@ void __section(".text.dummy.call_finalcalls") call_fin=
alcalls(void)
- }
-=20
- void __section(".text.dummy.boot_init_primary_late")
--boot_init_primary_late(unsigned long fdt __unused)
-+boot_init_primary_late(unsigned long fdt __unused,
-+		       unsigned long tos_fw_config __unused)
- {
- }
-=20
-diff --git a/core/arch/arm/kernel/secure_partition.c b/core/arch/arm/ker=
nel/secure_partition.c
-index 1d36e90b1cf7..d386f1e4d211 100644
---- a/core/arch/arm/kernel/secure_partition.c
-+++ b/core/arch/arm/kernel/secure_partition.c
-@@ -1212,7 +1212,7 @@ static TEE_Result fip_sp_map_all(void)
- 	int subnode =3D 0;
- 	int root =3D 0;
-=20
--	fdt =3D get_external_dt();
-+	fdt =3D get_tos_fw_config_dt();
- 	if (!fdt) {
- 		EMSG("No SPMC manifest found");
- 		return TEE_ERROR_GENERIC;
-diff --git a/core/include/kernel/boot.h b/core/include/kernel/boot.h
-index 260854473b8b..941e093b29a1 100644
---- a/core/include/kernel/boot.h
-+++ b/core/include/kernel/boot.h
-@@ -1,7 +1,7 @@
- /* SPDX-License-Identifier: BSD-2-Clause */
- /*
-  * Copyright (c) 2015-2020, Linaro Limited
-- * Copyright (c) 2021, Arm Limited
-+ * Copyright (c) 2021-2023, Arm Limited
-  */
- #ifndef __KERNEL_BOOT_H
- #define __KERNEL_BOOT_H
-@@ -46,7 +46,7 @@ extern const struct core_mmu_config boot_mmu_config;
- /* @nsec_entry is unused if using CFG_WITH_ARM_TRUSTED_FW */
- void boot_init_primary_early(unsigned long pageable_part,
- 			     unsigned long nsec_entry);
--void boot_init_primary_late(unsigned long fdt);
-+void boot_init_primary_late(unsigned long fdt, unsigned long tos_fw_con=
fig);
- void boot_init_memtag(void);
-=20
- void __panic_at_smc_return(void) __noreturn;
-@@ -103,6 +103,9 @@ void *get_embedded_dt(void);
- /* Returns external DTB if present, otherwise NULL */
- void *get_external_dt(void);
-=20
-+/* Returns TOS_FW_CONFIG DTB if present, otherwise NULL */
-+void *get_tos_fw_config_dt(void);
-+
- /*
-  * get_aslr_seed() - return a random seed for core ASLR
-  * @fdt:	Pointer to a device tree if CFG_DT_ADDR=3Dy
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0007-cor=
e-spmc-handle-non-secure-interrupts.patch b/meta-arm-bsp/recipes-security=
/optee/optee-os-3.20.0/0007-core-spmc-handle-non-secure-interrupts.patch
deleted file mode 100644
index 94c1e04985f0..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0007-core-spmc-=
handle-non-secure-interrupts.patch
+++ /dev/null
@@ -1,275 +0,0 @@
-From 18ad0cce24addd45271edf3172ab9ce873186d7a Mon Sep 17 00:00:00 2001
-From: Imre Kis <imre.kis@arm.com>
-Date: Tue, 18 Apr 2023 16:41:51 +0200
-Subject: [PATCH] core: spmc: handle non-secure interrupts
-
-Add FFA_INTERRUPT and FFA_RUN support for signaling non-secure
-interrupts and for resuming to the secure world. If a secure partition
-is preempted by a non-secure interrupt OP-TEE saves the SP's state and
-sends an FFA_INTERRUPT to the normal world. After handling the interrupt
-the normal world should send an FFA_RUN to OP-TEE so it can continue
-running the SP.
-If OP-TEE is the active FF-A endpoint (i.e. it is running TAs) the
-non-secure interrupts are signaled by the existing
-OPTEE_FFA_YIELDING_CALL_RETURN_INTERRUPT message instead of
-FFA_INTERRUPT.
-
-Upstream-Status: Submitted [https://github.com/OP-TEE/optee_os/pull/6002=
]
-
-Signed-off-by: Imre Kis <imre.kis@arm.com>
-Change-Id: I577ebe86d416ee494963216a66a3bfc8206921b4
----
- core/arch/arm/include/ffa.h                   |  2 +-
- .../arch/arm/include/kernel/spmc_sp_handler.h | 11 +++++++
- core/arch/arm/kernel/secure_partition.c       | 17 ++++++++++
- core/arch/arm/kernel/spmc_sp_handler.c        | 26 ++++++++++++++++
- core/arch/arm/kernel/thread.c                 |  7 +++++
- core/arch/arm/kernel/thread_spmc.c            | 31 ++++++++++++++++++-
- core/arch/arm/kernel/thread_spmc_a64.S        | 30 ++++++++++++++++++
- 7 files changed, 122 insertions(+), 2 deletions(-)
-
-diff --git a/core/arch/arm/include/ffa.h b/core/arch/arm/include/ffa.h
-index 5a19fb0c7ff3..b3d1d354735d 100644
---- a/core/arch/arm/include/ffa.h
-+++ b/core/arch/arm/include/ffa.h
-@@ -50,7 +50,7 @@
- #define FFA_ID_GET			U(0x84000069)
- #define FFA_MSG_WAIT			U(0x8400006B)
- #define FFA_MSG_YIELD			U(0x8400006C)
--#define FFA_MSG_RUN			U(0x8400006D)
-+#define FFA_RUN				U(0x8400006D)
- #define FFA_MSG_SEND			U(0x8400006E)
- #define FFA_MSG_SEND_DIRECT_REQ_32	U(0x8400006F)
- #define FFA_MSG_SEND_DIRECT_REQ_64	U(0xC400006F)
-diff --git a/core/arch/arm/include/kernel/spmc_sp_handler.h b/core/arch/=
arm/include/kernel/spmc_sp_handler.h
-index f5bda7bfe7d0..30c1e4691273 100644
---- a/core/arch/arm/include/kernel/spmc_sp_handler.h
-+++ b/core/arch/arm/include/kernel/spmc_sp_handler.h
-@@ -25,6 +25,8 @@ void spmc_sp_start_thread(struct thread_smc_args *args=
);
- int spmc_sp_add_share(struct ffa_rxtx *rxtx,
- 		      size_t blen, uint64_t *global_handle,
- 		      struct sp_session *owner_sp);
-+void spmc_sp_set_to_preempted(struct ts_session *ts_sess);
-+int spmc_sp_resume_from_preempted(uint16_t endpoint_id);
- #else
- static inline void spmc_sp_start_thread(struct thread_smc_args *args __=
unused)
- {
-@@ -37,6 +39,15 @@ static inline int spmc_sp_add_share(struct ffa_rxtx *=
rxtx __unused,
- {
- 	return FFA_NOT_SUPPORTED;
- }
-+
-+static inline void spmc_sp_set_to_preempted(struct ts_session *ts_sess =
__unused)
-+{
-+}
-+
-+static inline int spmc_sp_resume_from_preempted(uint16_t endpoint_id __=
unused)
-+{
-+	return FFA_NOT_SUPPORTED;
-+}
- #endif
-=20
- #endif /* __KERNEL_SPMC_SP_HANDLER_H */
-diff --git a/core/arch/arm/kernel/secure_partition.c b/core/arch/arm/ker=
nel/secure_partition.c
-index d386f1e4d211..740be6d22e47 100644
---- a/core/arch/arm/kernel/secure_partition.c
-+++ b/core/arch/arm/kernel/secure_partition.c
-@@ -999,6 +999,8 @@ static TEE_Result sp_enter_invoke_cmd(struct ts_sess=
ion *s,
- 	struct sp_session *sp_s =3D to_sp_session(s);
- 	struct ts_session *sess =3D NULL;
- 	struct thread_ctx_regs *sp_regs =3D NULL;
-+	uint32_t thread_id =3D THREAD_ID_INVALID;
-+	uint32_t rpc_target_info =3D 0;
- 	uint32_t panicked =3D false;
- 	uint32_t panic_code =3D 0;
-=20
-@@ -1011,8 +1013,23 @@ static TEE_Result sp_enter_invoke_cmd(struct ts_s=
ession *s,
- 	sp_regs->cpsr =3D read_daif() & (SPSR_64_DAIF_MASK << SPSR_64_DAIF_SHI=
FT);
-=20
- 	exceptions =3D thread_mask_exceptions(THREAD_EXCP_ALL);
-+
-+	/*
-+	 * Store endpoint ID and thread ID in rpc_target_info. This will be us=
ed
-+	 * as w1 in FFA_INTERRUPT in case of a NWd interrupt.
-+	 */
-+	rpc_target_info =3D thread_get_tsd()->rpc_target_info;
-+	thread_id =3D thread_get_id();
-+	assert((thread_id & ~0xffff) =3D=3D 0);
-+	thread_get_tsd()->rpc_target_info =3D (sp_s->endpoint_id << 16) |
-+					    (thread_id & 0xffff);
-+
- 	__thread_enter_user_mode(sp_regs, &panicked, &panic_code);
-+
- 	sp_regs->cpsr =3D cpsr;
-+	/* Restore rpc_target_info */
-+	thread_get_tsd()->rpc_target_info =3D rpc_target_info;
-+
- 	thread_unmask_exceptions(exceptions);
-=20
- 	thread_user_clear_vfp(&ctx->uctx);
-diff --git a/core/arch/arm/kernel/spmc_sp_handler.c b/core/arch/arm/kern=
el/spmc_sp_handler.c
-index 46a15646ecf0..12681151a796 100644
---- a/core/arch/arm/kernel/spmc_sp_handler.c
-+++ b/core/arch/arm/kernel/spmc_sp_handler.c
-@@ -366,6 +366,32 @@ cleanup:
- 	return res;
- }
-=20
-+void spmc_sp_set_to_preempted(struct ts_session *ts_sess)
-+{
-+	if (ts_sess && is_sp_ctx(ts_sess->ctx)) {
-+		struct sp_session *sp_sess =3D to_sp_session(ts_sess);
-+
-+		assert(sp_sess->state =3D=3D sp_busy);
-+
-+		sp_sess->state =3D sp_preempted;
-+	}
-+}
-+
-+int spmc_sp_resume_from_preempted(uint16_t endpoint_id)
-+{
-+	struct sp_session *sp_sess =3D sp_get_session(endpoint_id);
-+
-+	if (!sp_sess)
-+		return FFA_INVALID_PARAMETERS;
-+
-+	if (sp_sess->state !=3D sp_preempted)
-+		return FFA_DENIED;
-+
-+	sp_sess->state =3D sp_busy;
-+
-+	return FFA_OK;
-+}
-+
- static bool check_rxtx(struct ffa_rxtx *rxtx)
- {
- 	return rxtx && rxtx->rx && rxtx->tx && rxtx->size > 0;
-diff --git a/core/arch/arm/kernel/thread.c b/core/arch/arm/kernel/thread=
.c
-index 1e7f9f96b558..8cd4dc961b02 100644
---- a/core/arch/arm/kernel/thread.c
-+++ b/core/arch/arm/kernel/thread.c
-@@ -531,6 +531,13 @@ int thread_state_suspend(uint32_t flags, uint32_t c=
psr, vaddr_t pc)
- 		core_mmu_set_user_map(NULL);
- 	}
-=20
-+	if (IS_ENABLED(CFG_SECURE_PARTITION)) {
-+		struct ts_session *ts_sess =3D
-+			TAILQ_FIRST(&threads[ct].tsd.sess_stack);
-+
-+		spmc_sp_set_to_preempted(ts_sess);
-+	}
-+
- 	l->curr_thread =3D THREAD_ID_INVALID;
-=20
- 	if (IS_ENABLED(CFG_VIRTUALIZATION))
-diff --git a/core/arch/arm/kernel/thread_spmc.c b/core/arch/arm/kernel/t=
hread_spmc.c
-index 3b4ac0b4e35c..bc4e7687d618 100644
---- a/core/arch/arm/kernel/thread_spmc.c
-+++ b/core/arch/arm/kernel/thread_spmc.c
-@@ -45,7 +45,7 @@ struct mem_frag_state {
- #endif
-=20
- /* Initialized in spmc_init() below */
--static uint16_t my_endpoint_id;
-+uint16_t my_endpoint_id;
-=20
- /*
-  * If struct ffa_rxtx::size is 0 RX/TX buffers are not mapped or initia=
lized.
-@@ -437,6 +437,32 @@ out:
- 		      FFA_PARAM_MBZ, FFA_PARAM_MBZ);
- 	cpu_spin_unlock(&rxtx->spinlock);
- }
-+
-+static void spmc_handle_run(struct thread_smc_args *args)
-+{
-+	uint16_t endpoint =3D (args->a1 >> 16) & 0xffff;
-+	uint16_t thread_id =3D (args->a1 & 0xffff);
-+	uint32_t rc =3D 0;
-+
-+	if (endpoint !=3D my_endpoint_id) {
-+		/*
-+		 * The endpoint should be an SP, try to resume the SP from
-+		 * preempted into busy state.
-+		 */
-+		rc =3D spmc_sp_resume_from_preempted(endpoint);
-+		if (rc)
-+			goto out;
-+	}
-+
-+	thread_resume_from_rpc(thread_id, 0, 0, 0, 0);
-+
-+	/* thread_resume_from_rpc return only of the thread_id is invalid */
-+	rc =3D FFA_INVALID_PARAMETERS;
-+
-+out:
-+	spmc_set_args(args, FFA_ERROR, FFA_PARAM_MBZ, rc, FFA_PARAM_MBZ,
-+		      FFA_PARAM_MBZ, FFA_PARAM_MBZ);
-+}
- #endif /*CFG_CORE_SEL1_SPMC*/
-=20
- static void handle_yielding_call(struct thread_smc_args *args)
-@@ -970,6 +996,9 @@ void thread_spmc_msg_recv(struct thread_smc_args *ar=
gs)
- 	case FFA_PARTITION_INFO_GET:
- 		spmc_handle_partition_info_get(args, &nw_rxtx);
- 		break;
-+	case FFA_RUN:
-+		spmc_handle_run(args);
-+		break;
- #endif /*CFG_CORE_SEL1_SPMC*/
- 	case FFA_INTERRUPT:
- 		itr_core_handler();
-diff --git a/core/arch/arm/kernel/thread_spmc_a64.S b/core/arch/arm/kern=
el/thread_spmc_a64.S
-index 21cb62513a42..7297005a6038 100644
---- a/core/arch/arm/kernel/thread_spmc_a64.S
-+++ b/core/arch/arm/kernel/thread_spmc_a64.S
-@@ -14,6 +14,20 @@
- #include <kernel/thread.h>
- #include <optee_ffa.h>
-=20
-+#if CFG_SECURE_PARTITION
-+LOCAL_FUNC thread_ffa_interrupt , :
-+	mov_imm	x0, FFA_INTERRUPT		/* FID */
-+	/* X1: Endpoint/vCPU IDs is set by caller */
-+	mov	x2, #FFA_PARAM_MBZ		/* Param MBZ */
-+	mov	x3, #FFA_PARAM_MBZ		/* Param MBZ */
-+	mov	x4, #FFA_PARAM_MBZ		/* Param MBZ */
-+	mov	x5, #FFA_PARAM_MBZ		/* Param MBZ */
-+	mov	x6, #FFA_PARAM_MBZ		/* Param MBZ */
-+	mov	x7, #FFA_PARAM_MBZ		/* Param MBZ */
-+	b	.ffa_msg_loop
-+END_FUNC thread_ffa_msg_wait
-+#endif /* CFG_SECURE_PARTITION */
-+
- FUNC thread_ffa_msg_wait , :
- 	mov_imm	x0, FFA_MSG_WAIT		/* FID */
- 	mov	x1, #FFA_TARGET_INFO_MBZ	/* Target info MBZ */
-@@ -171,6 +185,14 @@ END_FUNC thread_rpc
-  * The current thread as indicated by @thread_index has just been
-  * suspended.  The job here is just to inform normal world the thread i=
d to
-  * resume when returning.
-+ * If the active FF-A endpoint is OP-TEE (or a TA) then an this functio=
n send an
-+ * OPTEE_FFA_YIELDING_CALL_RETURN_INTERRUPT message to the normal world=
 via the
-+ * FFA_MSG_SEND_DIRECT_RESP interface. This is handled by the OP-TEE
-+ * driver in Linux so it can schedule task to the thread.
-+ * If the active endpoint is an SP the function sends an FFA_INTERRUPT.=
 This is
-+ * handled by the FF-A driver and after taking care of the NWd interrup=
ts it
-+ * returns via an FFA_RUN call.
-+ * The active endpoint is determined by the upper 16 bits of rpc_target=
_info.
-  */
- FUNC thread_foreign_intr_exit , :
- 	/* load threads[w0].tsd.rpc_target_info into w1 */
-@@ -178,6 +200,14 @@ FUNC thread_foreign_intr_exit , :
- 	adr_l	x2, threads
- 	madd	x1, x1, x0, x2
- 	ldr	w1, [x1, #THREAD_CTX_TSD_RPC_TARGET_INFO]
-+#if CFG_SECURE_PARTITION
-+	adr_l	x2, my_endpoint_id
-+	ldrh	w2, [x2]
-+	lsr	w3, w1, #16
-+	cmp	w2, w3
-+	/* (threads[w0].tsd.rpc_target_info >> 16) !=3D my_endpoint_id */
-+	bne	thread_ffa_interrupt
-+#endif /* CFG_SECURE_PARTITION */
- 	mov	x2, #FFA_PARAM_MBZ
- 	mov	w3, #FFA_PARAM_MBZ
- 	mov	w4, #OPTEE_FFA_YIELDING_CALL_RETURN_INTERRUPT
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0008-cor=
e-spmc-configure-SP-s-NS-interrupt-action-based-o.patch b/meta-arm-bsp/re=
cipes-security/optee/optee-os-3.20.0/0008-core-spmc-configure-SP-s-NS-int=
errupt-action-based-o.patch
deleted file mode 100644
index 9f7d781e2aa5..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0008-core-spmc-=
configure-SP-s-NS-interrupt-action-based-o.patch
+++ /dev/null
@@ -1,148 +0,0 @@
-From e7835c526aabd8e5b6db335619a0d86165c587ed Mon Sep 17 00:00:00 2001
-From: Imre Kis <imre.kis@arm.com>
-Date: Tue, 25 Apr 2023 14:19:14 +0200
-Subject: [PATCH] core: spmc: configure SP's NS interrupt action based on=
 the
- manifest
-
-Used mandatory ns-interrupts-action SP manifest property to configure
-signaled or queued non-secure interrupt handling.
-
-Upstream-Status: Submitted [https://github.com/OP-TEE/optee_os/pull/6002=
]
-
-Signed-off-by: Imre Kis <imre.kis@arm.com>
-Change-Id: I843e69e5dbb9613ecd8b95654e8ca1730a594ca6
----
- .../arm/include/kernel/secure_partition.h     |  2 +
- core/arch/arm/kernel/secure_partition.c       | 66 +++++++++++++++++--
- 2 files changed, 63 insertions(+), 5 deletions(-)
-
-diff --git a/core/arch/arm/include/kernel/secure_partition.h b/core/arch=
/arm/include/kernel/secure_partition.h
-index 24b0a8cc07d2..51f6b697e5eb 100644
---- a/core/arch/arm/include/kernel/secure_partition.h
-+++ b/core/arch/arm/include/kernel/secure_partition.h
-@@ -43,6 +43,8 @@ struct sp_session {
- 	unsigned int spinlock;
- 	const void *fdt;
- 	bool is_initialized;
-+	uint32_t ns_interrupts_action;
-+	uint32_t ns_interrupts_action_inherited;
- 	TAILQ_ENTRY(sp_session) link;
- };
-=20
-diff --git a/core/arch/arm/kernel/secure_partition.c b/core/arch/arm/ker=
nel/secure_partition.c
-index 740be6d22e47..b644e1c72e6a 100644
---- a/core/arch/arm/kernel/secure_partition.c
-+++ b/core/arch/arm/kernel/secure_partition.c
-@@ -46,6 +46,10 @@
- 					 SP_MANIFEST_ATTR_WRITE | \
- 					 SP_MANIFEST_ATTR_EXEC)
-=20
-+#define SP_MANIFEST_NS_INT_QUEUED	(0x0)
-+#define SP_MANIFEST_NS_INT_MANAGED_EXIT	(0x1)
-+#define SP_MANIFEST_NS_INT_SIGNALED	(0x2)
-+
- #define SP_PKG_HEADER_MAGIC (0x474b5053)
- #define SP_PKG_HEADER_VERSION_V1 (0x1)
- #define SP_PKG_HEADER_VERSION_V2 (0x2)
-@@ -907,6 +911,30 @@ static TEE_Result sp_init_uuid(const TEE_UUID *uuid=
, const void * const fdt)
- 		return res;
- 	DMSG("endpoint is 0x%"PRIx16, sess->endpoint_id);
-=20
-+	res =3D sp_dt_get_u32(fdt, 0, "ns-interrupts-action",
-+			    &sess->ns_interrupts_action);
-+
-+	if (res) {
-+		EMSG("Mandatory property is missing: ns-interrupts-action");
-+		return res;
-+	}
-+
-+	switch (sess->ns_interrupts_action) {
-+	case SP_MANIFEST_NS_INT_QUEUED:
-+	case SP_MANIFEST_NS_INT_SIGNALED:
-+		/* OK */
-+		break;
-+
-+	case SP_MANIFEST_NS_INT_MANAGED_EXIT:
-+		EMSG("Managed exit is not implemented");
-+		return TEE_ERROR_NOT_IMPLEMENTED;
-+
-+	default:
-+		EMSG("Invalid ns-interrupts-action value: %d",
-+		     sess->ns_interrupts_action);
-+		return TEE_ERROR_BAD_PARAMETERS;
-+	}
-+
- 	return TEE_SUCCESS;
- }
-=20
-@@ -989,17 +1017,45 @@ TEE_Result sp_enter(struct thread_smc_args *args,=
 struct sp_session *sp)
- 	return res;
- }
-=20
-+/*
-+ * According to FF-A v1.1 section 8.3.1.4 if a caller requires less per=
missive
-+ * active on NS interrupt than the callee, the callee must inherit the =
caller's
-+ * configuration.
-+ * Each SP's own NS action setting is stored in ns_interrupts_action. T=
he
-+ * effective action will be MIN([self action], [caller's action]) which=
 is
-+ * stored in the ns_interrupts_action_inherited field.
-+ */
-+static void sp_cpsr_configure_foreing_interrupts(struct sp_session *s,
-+						 struct ts_session *caller,
-+						 uint64_t *cpsr)
-+{
-+	if (caller) {
-+		struct sp_session *caller_sp =3D to_sp_session(caller);
-+
-+		s->ns_interrupts_action_inherited =3D
-+			MIN(caller_sp->ns_interrupts_action_inherited,
-+			    s->ns_interrupts_action);
-+	} else {
-+		s->ns_interrupts_action_inherited =3D s->ns_interrupts_action;
-+	}
-+
-+	if (s->ns_interrupts_action_inherited =3D=3D SP_MANIFEST_NS_INT_QUEUED=
)
-+		*cpsr |=3D (THREAD_EXCP_FOREIGN_INTR << ARM32_CPSR_F_SHIFT);
-+	else
-+		*cpsr &=3D ~(THREAD_EXCP_FOREIGN_INTR << ARM32_CPSR_F_SHIFT);
-+}
-+
- static TEE_Result sp_enter_invoke_cmd(struct ts_session *s,
- 				      uint32_t cmd __unused)
- {
- 	struct sp_ctx *ctx =3D to_sp_ctx(s->ctx);
- 	TEE_Result res =3D TEE_SUCCESS;
- 	uint32_t exceptions =3D 0;
--	uint64_t cpsr =3D 0;
- 	struct sp_session *sp_s =3D to_sp_session(s);
- 	struct ts_session *sess =3D NULL;
- 	struct thread_ctx_regs *sp_regs =3D NULL;
- 	uint32_t thread_id =3D THREAD_ID_INVALID;
-+	struct ts_session *caller =3D NULL;
- 	uint32_t rpc_target_info =3D 0;
- 	uint32_t panicked =3D false;
- 	uint32_t panic_code =3D 0;
-@@ -1009,11 +1065,12 @@ static TEE_Result sp_enter_invoke_cmd(struct ts_=
session *s,
- 	sp_regs =3D &ctx->sp_regs;
- 	ts_push_current_session(s);
-=20
--	cpsr =3D sp_regs->cpsr;
--	sp_regs->cpsr =3D read_daif() & (SPSR_64_DAIF_MASK << SPSR_64_DAIF_SHI=
FT);
--
- 	exceptions =3D thread_mask_exceptions(THREAD_EXCP_ALL);
-=20
-+	/* Enable/disable foreign interrupts in CPSR/SPSR */
-+	caller =3D ts_get_calling_session();
-+	sp_cpsr_configure_foreing_interrupts(sp_s, caller, &sp_regs->cpsr);
-+
- 	/*
- 	 * Store endpoint ID and thread ID in rpc_target_info. This will be us=
ed
- 	 * as w1 in FFA_INTERRUPT in case of a NWd interrupt.
-@@ -1026,7 +1083,6 @@ static TEE_Result sp_enter_invoke_cmd(struct ts_se=
ssion *s,
-=20
- 	__thread_enter_user_mode(sp_regs, &panicked, &panic_code);
-=20
--	sp_regs->cpsr =3D cpsr;
- 	/* Restore rpc_target_info */
- 	thread_get_tsd()->rpc_target_info =3D rpc_target_info;
-=20
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/CVE-2023=
-41325.patch b/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/CVE-20=
23-41325.patch
deleted file mode 100644
index 08acce07f9dc..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/CVE-2023-41325.=
patch
+++ /dev/null
@@ -1,634 +0,0 @@
-From 800627f054959aac0dd3527495ee3fad0137600a Mon Sep 17 00:00:00 2001
-From: Jihwan Park <jihwp@amazon.com>
-Date: Mon, 3 Jul 2023 08:51:47 +0200
-Subject: [PATCH] core: crypto_bignum_free(): add indirection and set poi=
nter
- to NULL
-
-To prevent human mistake, crypto_bignum_free() sets the location of the
-bignum pointer to NULL after freeing it.
-
-Signed-off-by: Jihwan Park <jihwp@amazon.com>
-Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
-Reviewed-by: Jerome Forissier <jerome.forissier@linaro.org>
-Reviewed-by: Joakim Bech <joakim.bech@linaro.org>
-Reviewed-by: Etienne Carriere <etienne.carriere@foss.st.com>
-
-CVE: CVE-2023-41325
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- core/crypto/crypto.c                        |  4 +--
- core/drivers/crypto/caam/acipher/caam_dh.c  |  8 ++---
- core/drivers/crypto/caam/acipher/caam_dsa.c | 14 ++++----
- core/drivers/crypto/caam/acipher/caam_ecc.c | 10 +++---
- core/drivers/crypto/caam/acipher/caam_rsa.c | 24 ++++++-------
- core/drivers/crypto/se050/core/ecc.c        | 14 ++++----
- core/drivers/crypto/se050/core/rsa.c        | 38 ++++++++++-----------
- core/drivers/crypto/versal/ecc.c            |  6 ++--
- core/include/crypto/crypto.h                |  2 +-
- core/lib/libtomcrypt/dh.c                   |  8 ++---
- core/lib/libtomcrypt/dsa.c                  | 14 ++++----
- core/lib/libtomcrypt/ecc.c                  | 10 +++---
- core/lib/libtomcrypt/mpi_desc.c             |  9 +++--
- core/lib/libtomcrypt/rsa.c                  | 22 ++++++------
- core/tee/tee_svc_cryp.c                     |  7 ++--
- lib/libmbedtls/core/bignum.c                |  9 +++--
- lib/libmbedtls/core/dh.c                    |  8 ++---
- lib/libmbedtls/core/ecc.c                   | 10 +++---
- lib/libmbedtls/core/rsa.c                   | 22 ++++++------
- 19 files changed, 122 insertions(+), 117 deletions(-)
-
-diff --git a/core/crypto/crypto.c b/core/crypto/crypto.c
-index 9f7d35097..60cb89a31 100644
---- a/core/crypto/crypto.c
-+++ b/core/crypto/crypto.c
-@@ -498,9 +498,9 @@ void crypto_bignum_copy(struct bignum *to __unused,
- 	bignum_cant_happen();
- }
-=20
--void crypto_bignum_free(struct bignum *a)
-+void crypto_bignum_free(struct bignum **a)
- {
--	if (a)
-+	if (a && *a)
- 		panic();
- }
-=20
-diff --git a/core/drivers/crypto/caam/acipher/caam_dh.c b/core/drivers/c=
rypto/caam/acipher/caam_dh.c
-index 6131ff0ef..35fc44541 100644
---- a/core/drivers/crypto/caam/acipher/caam_dh.c
-+++ b/core/drivers/crypto/caam/acipher/caam_dh.c
-@@ -195,10 +195,10 @@ static TEE_Result do_allocate_keypair(struct dh_ke=
ypair *key, size_t size_bits)
- err:
- 	DH_TRACE("Allocation error");
-=20
--	crypto_bignum_free(key->g);
--	crypto_bignum_free(key->p);
--	crypto_bignum_free(key->x);
--	crypto_bignum_free(key->y);
-+	crypto_bignum_free(&key->g);
-+	crypto_bignum_free(&key->p);
-+	crypto_bignum_free(&key->x);
-+	crypto_bignum_free(&key->y);
-=20
- 	return TEE_ERROR_OUT_OF_MEMORY;
- }
-diff --git a/core/drivers/crypto/caam/acipher/caam_dsa.c b/core/drivers/=
crypto/caam/acipher/caam_dsa.c
-index 2696f0b3c..d60bb8e89 100644
---- a/core/drivers/crypto/caam/acipher/caam_dsa.c
-+++ b/core/drivers/crypto/caam/acipher/caam_dsa.c
-@@ -309,10 +309,10 @@ static TEE_Result do_allocate_keypair(struct dsa_k=
eypair *key, size_t l_bits,
- err:
- 	DSA_TRACE("Allocation error");
-=20
--	crypto_bignum_free(key->g);
--	crypto_bignum_free(key->p);
--	crypto_bignum_free(key->q);
--	crypto_bignum_free(key->x);
-+	crypto_bignum_free(&key->g);
-+	crypto_bignum_free(&key->p);
-+	crypto_bignum_free(&key->q);
-+	crypto_bignum_free(&key->x);
-=20
- 	return TEE_ERROR_OUT_OF_MEMORY;
- }
-@@ -358,9 +358,9 @@ static TEE_Result do_allocate_publickey(struct dsa_p=
ublic_key *key,
- err:
- 	DSA_TRACE("Allocation error");
-=20
--	crypto_bignum_free(key->g);
--	crypto_bignum_free(key->p);
--	crypto_bignum_free(key->q);
-+	crypto_bignum_free(&key->g);
-+	crypto_bignum_free(&key->p);
-+	crypto_bignum_free(&key->q);
-=20
- 	return TEE_ERROR_OUT_OF_MEMORY;
- }
-diff --git a/core/drivers/crypto/caam/acipher/caam_ecc.c b/core/drivers/=
crypto/caam/acipher/caam_ecc.c
-index 90e87c20a..6b12b6cbe 100644
---- a/core/drivers/crypto/caam/acipher/caam_ecc.c
-+++ b/core/drivers/crypto/caam/acipher/caam_ecc.c
-@@ -169,8 +169,8 @@ static TEE_Result do_allocate_keypair(struct ecc_key=
pair *key, size_t size_bits)
- err:
- 	ECC_TRACE("Allocation error");
-=20
--	crypto_bignum_free(key->d);
--	crypto_bignum_free(key->x);
-+	crypto_bignum_free(&key->d);
-+	crypto_bignum_free(&key->x);
-=20
- 	return TEE_ERROR_OUT_OF_MEMORY;
- }
-@@ -204,7 +204,7 @@ static TEE_Result do_allocate_publickey(struct ecc_p=
ublic_key *key,
- err:
- 	ECC_TRACE("Allocation error");
-=20
--	crypto_bignum_free(key->x);
-+	crypto_bignum_free(&key->x);
-=20
- 	return TEE_ERROR_OUT_OF_MEMORY;
- }
-@@ -216,8 +216,8 @@ err:
-  */
- static void do_free_publickey(struct ecc_public_key *key)
- {
--	crypto_bignum_free(key->x);
--	crypto_bignum_free(key->y);
-+	crypto_bignum_free(&key->x);
-+	crypto_bignum_free(&key->y);
- }
-=20
- /*
-diff --git a/core/drivers/crypto/caam/acipher/caam_rsa.c b/core/drivers/=
crypto/caam/acipher/caam_rsa.c
-index e860c641c..b59ab0b6e 100644
---- a/core/drivers/crypto/caam/acipher/caam_rsa.c
-+++ b/core/drivers/crypto/caam/acipher/caam_rsa.c
-@@ -86,14 +86,14 @@ static uint8_t caam_era;
-  */
- static void do_free_keypair(struct rsa_keypair *key)
- {
--	crypto_bignum_free(key->e);
--	crypto_bignum_free(key->d);
--	crypto_bignum_free(key->n);
--	crypto_bignum_free(key->p);
--	crypto_bignum_free(key->q);
--	crypto_bignum_free(key->qp);
--	crypto_bignum_free(key->dp);
--	crypto_bignum_free(key->dq);
-+	crypto_bignum_free(&key->e);
-+	crypto_bignum_free(&key->d);
-+	crypto_bignum_free(&key->n);
-+	crypto_bignum_free(&key->p);
-+	crypto_bignum_free(&key->q);
-+	crypto_bignum_free(&key->qp);
-+	crypto_bignum_free(&key->dp);
-+	crypto_bignum_free(&key->dq);
- }
-=20
- /*
-@@ -435,8 +435,8 @@ static TEE_Result do_allocate_publickey(struct rsa_p=
ublic_key *key,
- err_alloc_publickey:
- 	RSA_TRACE("Allocation error");
-=20
--	crypto_bignum_free(key->e);
--	crypto_bignum_free(key->n);
-+	crypto_bignum_free(&key->e);
-+	crypto_bignum_free(&key->n);
-=20
- 	return TEE_ERROR_OUT_OF_MEMORY;
- }
-@@ -448,8 +448,8 @@ err_alloc_publickey:
-  */
- static void do_free_publickey(struct rsa_public_key *key)
- {
--	crypto_bignum_free(key->e);
--	crypto_bignum_free(key->n);
-+	crypto_bignum_free(&key->e);
-+	crypto_bignum_free(&key->n);
- }
-=20
- /*
-diff --git a/core/drivers/crypto/se050/core/ecc.c b/core/drivers/crypto/=
se050/core/ecc.c
-index d74334760..52f82c69d 100644
---- a/core/drivers/crypto/se050/core/ecc.c
-+++ b/core/drivers/crypto/se050/core/ecc.c
-@@ -752,9 +752,9 @@ static TEE_Result do_alloc_keypair(struct ecc_keypai=
r *s,
- 		goto err;
- 	return TEE_SUCCESS;
- err:
--	crypto_bignum_free(s->d);
--	crypto_bignum_free(s->x);
--	crypto_bignum_free(s->y);
-+	crypto_bignum_free(&s->d);
-+	crypto_bignum_free(&s->x);
-+	crypto_bignum_free(&s->y);
- 	return TEE_ERROR_OUT_OF_MEMORY;
- }
-=20
-@@ -768,8 +768,8 @@ static TEE_Result do_alloc_publickey(struct ecc_publ=
ic_key *s,
- 		goto err;
- 	return TEE_SUCCESS;
- err:
--	crypto_bignum_free(s->x);
--	crypto_bignum_free(s->y);
-+	crypto_bignum_free(&s->x);
-+	crypto_bignum_free(&s->y);
- 	return TEE_ERROR_OUT_OF_MEMORY;
- }
-=20
-@@ -778,8 +778,8 @@ static void do_free_publickey(struct ecc_public_key =
*s)
- 	if (!s)
- 		return;
-=20
--	crypto_bignum_free(s->x);
--	crypto_bignum_free(s->y);
-+	crypto_bignum_free(&s->x);
-+	crypto_bignum_free(&s->y);
- }
-=20
- static struct drvcrypt_ecc driver_ecc =3D {
-diff --git a/core/drivers/crypto/se050/core/rsa.c b/core/drivers/crypto/=
se050/core/rsa.c
-index 815abb3cd..475d2b99a 100644
---- a/core/drivers/crypto/se050/core/rsa.c
-+++ b/core/drivers/crypto/se050/core/rsa.c
-@@ -537,14 +537,14 @@ static TEE_Result do_alloc_keypair(struct rsa_keyp=
air *s,
-=20
- 	return TEE_SUCCESS;
- err:
--	crypto_bignum_free(s->e);
--	crypto_bignum_free(s->d);
--	crypto_bignum_free(s->n);
--	crypto_bignum_free(s->p);
--	crypto_bignum_free(s->q);
--	crypto_bignum_free(s->qp);
--	crypto_bignum_free(s->dp);
--	crypto_bignum_free(s->dq);
-+	crypto_bignum_free(&s->e);
-+	crypto_bignum_free(&s->d);
-+	crypto_bignum_free(&s->n);
-+	crypto_bignum_free(&s->p);
-+	crypto_bignum_free(&s->q);
-+	crypto_bignum_free(&s->qp);
-+	crypto_bignum_free(&s->dp);
-+	crypto_bignum_free(&s->dq);
-=20
- 	return TEE_ERROR_OUT_OF_MEMORY;
- }
-@@ -556,7 +556,7 @@ static TEE_Result do_alloc_publickey(struct rsa_publ=
ic_key *s,
- 	if (!bn_alloc_max(&s->e))
- 		return TEE_ERROR_OUT_OF_MEMORY;
- 	if (!bn_alloc_max(&s->n)) {
--		crypto_bignum_free(s->e);
-+		crypto_bignum_free(&s->e);
- 		return TEE_ERROR_OUT_OF_MEMORY;
- 	}
-=20
-@@ -566,8 +566,8 @@ static TEE_Result do_alloc_publickey(struct rsa_publ=
ic_key *s,
- static void do_free_publickey(struct rsa_public_key *s)
- {
- 	if (s) {
--		crypto_bignum_free(s->n);
--		crypto_bignum_free(s->e);
-+		crypto_bignum_free(&s->n);
-+		crypto_bignum_free(&s->e);
- 	}
- }
-=20
-@@ -587,14 +587,14 @@ static void do_free_keypair(struct rsa_keypair *s)
- 			sss_se05x_key_store_erase_key(se050_kstore, &k_object);
- 	}
-=20
--	crypto_bignum_free(s->e);
--	crypto_bignum_free(s->d);
--	crypto_bignum_free(s->n);
--	crypto_bignum_free(s->p);
--	crypto_bignum_free(s->q);
--	crypto_bignum_free(s->qp);
--	crypto_bignum_free(s->dp);
--	crypto_bignum_free(s->dq);
-+	crypto_bignum_free(&s->e);
-+	crypto_bignum_free(&s->d);
-+	crypto_bignum_free(&s->n);
-+	crypto_bignum_free(&s->p);
-+	crypto_bignum_free(&s->q);
-+	crypto_bignum_free(&s->qp);
-+	crypto_bignum_free(&s->dp);
-+	crypto_bignum_free(&s->dq);
- }
-=20
- static TEE_Result do_gen_keypair(struct rsa_keypair *key, size_t kb)
-diff --git a/core/drivers/crypto/versal/ecc.c b/core/drivers/crypto/vers=
al/ecc.c
-index 3d5454509..18ec4f78d 100644
---- a/core/drivers/crypto/versal/ecc.c
-+++ b/core/drivers/crypto/versal/ecc.c
-@@ -284,9 +284,9 @@ static TEE_Result sign(uint32_t algo, struct ecc_key=
pair *key,
-=20
- 	versal_mbox_alloc(bytes, NULL, &k);
- 	crypto_bignum_bn2bin_eswap(key->curve, ephemeral.d, k.buf);
--	crypto_bignum_free(ephemeral.d);
--	crypto_bignum_free(ephemeral.x);
--	crypto_bignum_free(ephemeral.y);
-+	crypto_bignum_free(&ephemeral.d);
-+	crypto_bignum_free(&ephemeral.x);
-+	crypto_bignum_free(&ephemeral.y);
-=20
- 	/* Private key*/
- 	versal_mbox_alloc(bytes, NULL, &d);
-diff --git a/core/include/crypto/crypto.h b/core/include/crypto/crypto.h
-index 71a287ec6..0e6c139ce 100644
---- a/core/include/crypto/crypto.h
-+++ b/core/include/crypto/crypto.h
-@@ -98,7 +98,7 @@ size_t crypto_bignum_num_bytes(struct bignum *a);
- size_t crypto_bignum_num_bits(struct bignum *a);
- void crypto_bignum_bn2bin(const struct bignum *from, uint8_t *to);
- void crypto_bignum_copy(struct bignum *to, const struct bignum *from);
--void crypto_bignum_free(struct bignum *a);
-+void crypto_bignum_free(struct bignum **a);
- void crypto_bignum_clear(struct bignum *a);
-=20
- /* return -1 if a<b, 0 if a=3D=3Db, +1 if a>b */
-diff --git a/core/lib/libtomcrypt/dh.c b/core/lib/libtomcrypt/dh.c
-index 4eb9916f2..b1d0a4d00 100644
---- a/core/lib/libtomcrypt/dh.c
-+++ b/core/lib/libtomcrypt/dh.c
-@@ -28,10 +28,10 @@ TEE_Result crypto_acipher_alloc_dh_keypair(struct dh=
_keypair *s,
- 		goto err;
- 	return TEE_SUCCESS;
- err:
--	crypto_bignum_free(s->g);
--	crypto_bignum_free(s->p);
--	crypto_bignum_free(s->y);
--	crypto_bignum_free(s->x);
-+	crypto_bignum_free(&s->g);
-+	crypto_bignum_free(&s->p);
-+	crypto_bignum_free(&s->y);
-+	crypto_bignum_free(&s->x);
- 	return TEE_ERROR_OUT_OF_MEMORY;
- }
-=20
-diff --git a/core/lib/libtomcrypt/dsa.c b/core/lib/libtomcrypt/dsa.c
-index a2dc720ed..d6243c469 100644
---- a/core/lib/libtomcrypt/dsa.c
-+++ b/core/lib/libtomcrypt/dsa.c
-@@ -30,10 +30,10 @@ TEE_Result crypto_acipher_alloc_dsa_keypair(struct d=
sa_keypair *s,
- 		goto err;
- 	return TEE_SUCCESS;
- err:
--	crypto_bignum_free(s->g);
--	crypto_bignum_free(s->p);
--	crypto_bignum_free(s->q);
--	crypto_bignum_free(s->y);
-+	crypto_bignum_free(&s->g);
-+	crypto_bignum_free(&s->p);
-+	crypto_bignum_free(&s->q);
-+	crypto_bignum_free(&s->y);
- 	return TEE_ERROR_OUT_OF_MEMORY;
- }
-=20
-@@ -52,9 +52,9 @@ TEE_Result crypto_acipher_alloc_dsa_public_key(struct =
dsa_public_key *s,
- 		goto err;
- 	return TEE_SUCCESS;
- err:
--	crypto_bignum_free(s->g);
--	crypto_bignum_free(s->p);
--	crypto_bignum_free(s->q);
-+	crypto_bignum_free(&s->g);
-+	crypto_bignum_free(&s->p);
-+	crypto_bignum_free(&s->q);
- 	return TEE_ERROR_OUT_OF_MEMORY;
- }
-=20
-diff --git a/core/lib/libtomcrypt/ecc.c b/core/lib/libtomcrypt/ecc.c
-index 938378247..fa645e17a 100644
---- a/core/lib/libtomcrypt/ecc.c
-+++ b/core/lib/libtomcrypt/ecc.c
-@@ -18,8 +18,8 @@ static void _ltc_ecc_free_public_key(struct ecc_public=
_key *s)
- 	if (!s)
- 		return;
-=20
--	crypto_bignum_free(s->x);
--	crypto_bignum_free(s->y);
-+	crypto_bignum_free(&s->x);
-+	crypto_bignum_free(&s->y);
- }
-=20
- /*
-@@ -465,8 +465,8 @@ TEE_Result crypto_asym_alloc_ecc_keypair(struct ecc_=
keypair *s,
- err:
- 	s->ops =3D NULL;
-=20
--	crypto_bignum_free(s->d);
--	crypto_bignum_free(s->x);
-+	crypto_bignum_free(&s->d);
-+	crypto_bignum_free(&s->x);
-=20
- 	return TEE_ERROR_OUT_OF_MEMORY;
- }
-@@ -541,7 +541,7 @@ TEE_Result crypto_asym_alloc_ecc_public_key(struct e=
cc_public_key *s,
- err:
- 	s->ops =3D NULL;
-=20
--	crypto_bignum_free(s->x);
-+	crypto_bignum_free(&s->x);
-=20
- 	return TEE_ERROR_OUT_OF_MEMORY;
- }
-diff --git a/core/lib/libtomcrypt/mpi_desc.c b/core/lib/libtomcrypt/mpi_=
desc.c
-index 235fbe630..ff8dd13c7 100644
---- a/core/lib/libtomcrypt/mpi_desc.c
-+++ b/core/lib/libtomcrypt/mpi_desc.c
-@@ -763,10 +763,13 @@ struct bignum *crypto_bignum_allocate(size_t size_=
bits)
- 	return (struct bignum *)bn;
- }
-=20
--void crypto_bignum_free(struct bignum *s)
-+void crypto_bignum_free(struct bignum **s)
- {
--	mbedtls_mpi_free((mbedtls_mpi *)s);
--	free(s);
-+	assert(s);
-+
-+	mbedtls_mpi_free((mbedtls_mpi *)*s);
-+	free(*s);
-+	*s =3D NULL;
- }
-=20
- void crypto_bignum_clear(struct bignum *s)
-diff --git a/core/lib/libtomcrypt/rsa.c b/core/lib/libtomcrypt/rsa.c
-index 8d0443f36..13ed23934 100644
---- a/core/lib/libtomcrypt/rsa.c
-+++ b/core/lib/libtomcrypt/rsa.c
-@@ -131,7 +131,7 @@ TEE_Result sw_crypto_acipher_alloc_rsa_public_key(st=
ruct rsa_public_key *s,
- 		goto err;
- 	return TEE_SUCCESS;
- err:
--	crypto_bignum_free(s->e);
-+	crypto_bignum_free(&s->e);
- 	return TEE_ERROR_OUT_OF_MEMORY;
- }
-=20
-@@ -143,8 +143,8 @@ void sw_crypto_acipher_free_rsa_public_key(struct rs=
a_public_key *s)
- {
- 	if (!s)
- 		return;
--	crypto_bignum_free(s->n);
--	crypto_bignum_free(s->e);
-+	crypto_bignum_free(&s->n);
-+	crypto_bignum_free(&s->e);
- }
-=20
-=20
-@@ -155,14 +155,14 @@ void sw_crypto_acipher_free_rsa_keypair(struct rsa=
_keypair *s)
- {
- 	if (!s)
- 		return;
--	crypto_bignum_free(s->e);
--	crypto_bignum_free(s->d);
--	crypto_bignum_free(s->n);
--	crypto_bignum_free(s->p);
--	crypto_bignum_free(s->q);
--	crypto_bignum_free(s->qp);
--	crypto_bignum_free(s->dp);
--	crypto_bignum_free(s->dq);
-+	crypto_bignum_free(&s->e);
-+	crypto_bignum_free(&s->d);
-+	crypto_bignum_free(&s->n);
-+	crypto_bignum_free(&s->p);
-+	crypto_bignum_free(&s->q);
-+	crypto_bignum_free(&s->qp);
-+	crypto_bignum_free(&s->dp);
-+	crypto_bignum_free(&s->dq);
- }
-=20
- TEE_Result crypto_acipher_gen_rsa_key(struct rsa_keypair *key,
-diff --git a/core/tee/tee_svc_cryp.c b/core/tee/tee_svc_cryp.c
-index 534e5ac39..880809753 100644
---- a/core/tee/tee_svc_cryp.c
-+++ b/core/tee/tee_svc_cryp.c
-@@ -869,8 +869,7 @@ static void op_attr_bignum_free(void *attr)
- {
- 	struct bignum **bn =3D attr;
-=20
--	crypto_bignum_free(*bn);
--	*bn =3D NULL;
-+	crypto_bignum_free(bn);
- }
-=20
- static TEE_Result op_attr_value_from_user(void *attr, const void *buffe=
r,
-@@ -3445,8 +3444,8 @@ TEE_Result syscall_cryp_derive_key(unsigned long s=
tate,
- 		} else {
- 			res =3D TEE_ERROR_OUT_OF_MEMORY;
- 		}
--		crypto_bignum_free(pub);
--		crypto_bignum_free(ss);
-+		crypto_bignum_free(&pub);
-+		crypto_bignum_free(&ss);
- 	} else if (TEE_ALG_GET_MAIN_ALG(cs->algo) =3D=3D TEE_MAIN_ALGO_ECDH) {
- 		struct ecc_public_key key_public;
- 		uint8_t *pt_secret;
-diff --git a/lib/libmbedtls/core/bignum.c b/lib/libmbedtls/core/bignum.c
-index 61f6c5c60..dea30f61a 100644
---- a/lib/libmbedtls/core/bignum.c
-+++ b/lib/libmbedtls/core/bignum.c
-@@ -87,10 +87,13 @@ struct bignum *crypto_bignum_allocate(size_t size_bi=
ts)
- 	return (struct bignum *)bn;
- }
-=20
--void crypto_bignum_free(struct bignum *s)
-+void crypto_bignum_free(struct bignum **s)
- {
--	mbedtls_mpi_free((mbedtls_mpi *)s);
--	free(s);
-+	assert(s);
-+
-+	mbedtls_mpi_free((mbedtls_mpi *)*s);
-+	free(*s);
-+	*s =3D NULL;
- }
-=20
- void crypto_bignum_clear(struct bignum *s)
-diff --git a/lib/libmbedtls/core/dh.c b/lib/libmbedtls/core/dh.c
-index b3415aaa7..e95aa1495 100644
---- a/lib/libmbedtls/core/dh.c
-+++ b/lib/libmbedtls/core/dh.c
-@@ -35,10 +35,10 @@ TEE_Result crypto_acipher_alloc_dh_keypair(struct dh=
_keypair *s,
- 		goto err;
- 	return TEE_SUCCESS;
- err:
--	crypto_bignum_free(s->g);
--	crypto_bignum_free(s->p);
--	crypto_bignum_free(s->y);
--	crypto_bignum_free(s->x);
-+	crypto_bignum_free(&s->g);
-+	crypto_bignum_free(&s->p);
-+	crypto_bignum_free(&s->y);
-+	crypto_bignum_free(&s->x);
- 	return TEE_ERROR_OUT_OF_MEMORY;
- }
-=20
-diff --git a/lib/libmbedtls/core/ecc.c b/lib/libmbedtls/core/ecc.c
-index fd4a51b9d..46cd9fd1c 100644
---- a/lib/libmbedtls/core/ecc.c
-+++ b/lib/libmbedtls/core/ecc.c
-@@ -40,8 +40,8 @@ static void ecc_free_public_key(struct ecc_public_key =
*s)
- 	if (!s)
- 		return;
-=20
--	crypto_bignum_free(s->x);
--	crypto_bignum_free(s->y);
-+	crypto_bignum_free(&s->x);
-+	crypto_bignum_free(&s->y);
- }
-=20
- /*
-@@ -484,8 +484,8 @@ TEE_Result crypto_asym_alloc_ecc_keypair(struct ecc_=
keypair *s,
- 	return TEE_SUCCESS;
-=20
- err:
--	crypto_bignum_free(s->d);
--	crypto_bignum_free(s->x);
-+	crypto_bignum_free(&s->d);
-+	crypto_bignum_free(&s->x);
-=20
- 	return TEE_ERROR_OUT_OF_MEMORY;
- }
-@@ -581,7 +581,7 @@ TEE_Result crypto_asym_alloc_ecc_public_key(struct e=
cc_public_key *s,
- 	return TEE_SUCCESS;
-=20
- err:
--	crypto_bignum_free(s->x);
-+	crypto_bignum_free(&s->x);
-=20
- 	return TEE_ERROR_OUT_OF_MEMORY;
- }
-diff --git a/lib/libmbedtls/core/rsa.c b/lib/libmbedtls/core/rsa.c
-index c3b5be509..a8aeb2c04 100644
---- a/lib/libmbedtls/core/rsa.c
-+++ b/lib/libmbedtls/core/rsa.c
-@@ -183,7 +183,7 @@ TEE_Result sw_crypto_acipher_alloc_rsa_public_key(st=
ruct rsa_public_key *s,
- 		goto err;
- 	return TEE_SUCCESS;
- err:
--	crypto_bignum_free(s->e);
-+	crypto_bignum_free(&s->e);
- 	return TEE_ERROR_OUT_OF_MEMORY;
- }
-=20
-@@ -194,8 +194,8 @@ void sw_crypto_acipher_free_rsa_public_key(struct rs=
a_public_key *s)
- {
- 	if (!s)
- 		return;
--	crypto_bignum_free(s->n);
--	crypto_bignum_free(s->e);
-+	crypto_bignum_free(&s->n);
-+	crypto_bignum_free(&s->e);
- }
-=20
- void crypto_acipher_free_rsa_keypair(struct rsa_keypair *s)
-@@ -205,14 +205,14 @@ void sw_crypto_acipher_free_rsa_keypair(struct rsa=
_keypair *s)
- {
- 	if (!s)
- 		return;
--	crypto_bignum_free(s->e);
--	crypto_bignum_free(s->d);
--	crypto_bignum_free(s->n);
--	crypto_bignum_free(s->p);
--	crypto_bignum_free(s->q);
--	crypto_bignum_free(s->qp);
--	crypto_bignum_free(s->dp);
--	crypto_bignum_free(s->dq);
-+	crypto_bignum_free(&s->e);
-+	crypto_bignum_free(&s->d);
-+	crypto_bignum_free(&s->n);
-+	crypto_bignum_free(&s->p);
-+	crypto_bignum_free(&s->q);
-+	crypto_bignum_free(&s->qp);
-+	crypto_bignum_free(&s->dp);
-+	crypto_bignum_free(&s->dq);
- }
-=20
- TEE_Result crypto_acipher_gen_rsa_key(struct rsa_keypair *key,
---=20
-2.34.1
-
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-tc.inc b/meta-a=
rm-bsp/recipes-security/optee/optee-os-tc.inc
deleted file mode 100644
index c4049f5afba4..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os-tc.inc
+++ /dev/null
@@ -1,33 +0,0 @@
-# TC0 specific configuration
-
-# Total Compute (tc) specific configuration for optee-os and optee-os-ta=
devkit
-
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/optee-os/tc:"
-SRC_URI:append:tc =3D " file://sp_layout.json \
-    file://0001-WIP-Enable-managed-exit.patch \
-    file://0002-plat-totalcompute-fix-TZDRAM-start-and-size.patch \
-    "
-
-COMPATIBLE_MACHINE =3D "(tc?)"
-
-OPTEEMACHINE:tc1 =3D "totalcompute-tc1"
-
-# Enable optee memory layout and boot logs
-EXTRA_OEMAKE +=3D " CFG_TEE_CORE_LOG_LEVEL=3D3"
-
-# default disable latency benchmarks (over all OP-TEE layers)
-EXTRA_OEMAKE +=3D " CFG_TEE_BENCHMARK=3Dn"
-
-# Enable stats
-EXTRA_OEMAKE +=3D " CFG_WITH_STATS=3Dy"
-
-EXTRA_OEMAKE +=3D " CFG_CORE_SEL2_SPMC=3Dy"
-
-# Copy optee manifest file
-do_install:append() {
-    install -d ${D}${nonarch_base_libdir}/firmware/
-    install -m 644 ${WORKDIR}/sp_layout.json ${D}${nonarch_base_libdir}/=
firmware/
-    install -m 644 \
-        ${S}/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts =
\
-        ${D}${nonarch_base_libdir}/firmware/
-}
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os/0003-optee-enab=
le-clang-support.patch b/meta-arm-bsp/recipes-security/optee/optee-os/000=
3-optee-enable-clang-support.patch
deleted file mode 100644
index 3c13ce3f028c..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os/0003-optee-enable-clan=
g-support.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 59d4c190eae11c93b26cca5a7b005a17dadc8248 Mon Sep 17 00:00:00 2001
-From: Brett Warren <brett.warren@arm.com>
-Date: Wed, 23 Sep 2020 09:27:34 +0100
-Subject: [PATCH] optee: enable clang support
-
-When compiling with clang, the LIBGCC_LOCATE_CFLAG variable used
-to provide a sysroot wasn't included, which results in not locating
-compiler-rt. This is mitigated by including the variable as ammended.
-
-Upstream-Status: Pending
-ChangeId: 8ba69a4b2eb8ebaa047cb266c9aa6c2c3da45701
-Signed-off-by: Brett Warren <brett.warren@arm.com>
-
----
- mk/clang.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mk/clang.mk b/mk/clang.mk
-index a045beee8..1ebe2f702 100644
---- a/mk/clang.mk
-+++ b/mk/clang.mk
-@@ -30,7 +30,7 @@ comp-cflags-warns-clang :=3D -Wno-language-extension-t=
oken \
-=20
- # Note, use the compiler runtime library (libclang_rt.builtins.*.a) ins=
tead of
- # libgcc for clang
--libgcc$(sm)	:=3D $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
-+libgcc$(sm)	:=3D $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$(a=
rch-bits-$(sm))) \
- 			-rtlib=3Dcompiler-rt -print-libgcc-file-name 2> /dev/null)
-=20
- # Core ASLR relies on the executable being ready to run from its prefer=
red load
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bb b/met=
a-arm-bsp/recipes-security/optee/optee-os_3.20.0.bb
deleted file mode 100644
index 0638cf7fac09..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-require recipes-security/optee/optee-os.inc
-
-DEPENDS +=3D "dtc-native"
-
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${P}:"
-
-SRCREV =3D "8e74d47616a20eaa23ca692f4bbbf917a236ed94"
-SRC_URI +=3D " \
-    file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
-    file://0002-optee-enable-clang-support.patch \
-    file://0003-core-link-add-no-warn-rwx-segments.patch \
-    file://0004-core-Define-section-attributes-for-clang.patch \
-    file://0005-core-arm-S-EL1-SPMC-boot-ABI-update.patch \
-    file://0006-core-ffa-add-TOS_FW_CONFIG-handling.patch \
-    file://0007-core-spmc-handle-non-secure-interrupts.patch \
-    file://0008-core-spmc-configure-SP-s-NS-interrupt-action-based-o.pat=
ch \
-    file://CVE-2023-41325.patch \
-   "
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bbappend=
 b/meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bbappend
deleted file mode 100644
index e276fb86297e..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-# Machine specific configurations
-
-MACHINE_OPTEE_OS_REQUIRE ?=3D ""
-MACHINE_OPTEE_OS_REQUIRE:tc =3D "optee-os-tc.inc"
-
-require ${MACHINE_OPTEE_OS_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test-tc.inc b/meta=
-arm-bsp/recipes-security/optee/optee-test-tc.inc
deleted file mode 100644
index af73675348d8..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-test-tc.inc
+++ /dev/null
@@ -1,8 +0,0 @@
-# TC specific configuration
-
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/optee-test/tc:"
-SRC_URI:append:tc =3D " \
-    file://0001-xtest-Limit-tests-to-a-single-thread.patch \
-    "
-
-COMPATIBLE_MACHINE =3D "(tc?)"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test/0001-xtest-re=
gression_1000-remove-unneeded-stat.h-include.patch b/meta-arm-bsp/recipes=
-security/optee/optee-test/0001-xtest-regression_1000-remove-unneeded-sta=
t.h-include.patch
deleted file mode 100644
index 98c49a20878b..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-test/0001-xtest-regressio=
n_1000-remove-unneeded-stat.h-include.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 53642dc98630b9c725977ab935c5bdd9c401e1aa Mon Sep 17 00:00:00 2001
-From: Jon Mason <jon.mason@arm.com>
-Date: Sat, 15 Jul 2023 15:08:43 -0400
-Subject: [PATCH] xtest: regression_1000: remove unneeded stat.h include
-
-Hack to work around musl compile error:
- In file included from optee-test/3.17.0-r0/recipe-sysroot/usr/include/s=
ys/stat.h:23,
-                  from optee-test/3.17.0-r0/git/host/xtest/regression_10=
00.c:25:
- optee-test/3.17.0-r0/recipe-sysroot/usr/include/bits/stat.h:17:26: erro=
r: expected identifier or '(' before '[' token
-    17 |         unsigned __unused[2];
-       |                          ^
-
-stat.h is not needed, since it is not being used in this file.  So remov=
ing it.
-
-Upstream-Status: Backport
-Signed-off-by: Jon Mason <jon.mason@arm.com>
-Reviewed-by: Jerome Forissier <jerome.forissier@linaro.org>
-Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
----
- host/xtest/regression_1000.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/host/xtest/regression_1000.c b/host/xtest/regression_1000.c
-index de32c4184fd8..25b4721cdc45 100644
---- a/host/xtest/regression_1000.c
-+++ b/host/xtest/regression_1000.c
-@@ -22,7 +22,6 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
--#include <sys/stat.h>
- #include <sys/types.h>
- #include <ta_arm_bti.h>
- #include <ta_concurrent.h>
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test/0002-ffa_spmc=
-Add-arm_ffa_user-driver-compatibility-check.patch b/meta-arm-bsp/recipes=
-security/optee/optee-test/0002-ffa_spmc-Add-arm_ffa_user-driver-compatib=
ility-check.patch
deleted file mode 100644
index 24cdf0ad1acd..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-test/0002-ffa_spmc-Add-ar=
m_ffa_user-driver-compatibility-check.patch
+++ /dev/null
@@ -1,160 +0,0 @@
-From 717ff43f0d58e5f5a87893bd0cf3274a1e0164dc Mon Sep 17 00:00:00 2001
-From: Gabor Toth <gabor.toth2@arm.com>
-Date: Fri, 3 Mar 2023 12:25:58 +0100
-Subject: [PATCH] ffa_spmc: Add arm_ffa_user driver compatibility check
-
-Check the version of the arm_ffa_user Kernel Driver and fail with a
-meaningful message if incompatible driver is detected.
-
-Upstream-Status: Backport
-
-Signed-off-by: Gabor Toth <gabor.toth2@arm.com>
-Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
----
- host/xtest/ffa_spmc_1000.c | 68 ++++++++++++++++++++++++++++++++++----
- 1 file changed, 61 insertions(+), 7 deletions(-)
-
-diff --git a/host/xtest/ffa_spmc_1000.c b/host/xtest/ffa_spmc_1000.c
-index 15f4a468a775..1839d03f29be 100644
---- a/host/xtest/ffa_spmc_1000.c
-+++ b/host/xtest/ffa_spmc_1000.c
-@@ -1,11 +1,12 @@
- // SPDX-License-Identifier: BSD-3-Clause
- /*
-- * Copyright (c) 2022, Arm Limited and Contributors. All rights reserve=
d.
-+ * Copyright (c) 2022-2023, Arm Limited and Contributors. All rights re=
served.
-  */
- #include <fcntl.h>
- #include <ffa.h>
- #include <stdio.h>
- #include <string.h>
-+#include <errno.h>
- #include <sys/ioctl.h>
- #include <unistd.h>
- #include "include/uapi/linux/arm_ffa_user.h"
-@@ -17,6 +18,10 @@
- #define INCORRECT_ENDPOINT_ID 0xffff
- #define NORMAL_WORLD_ENDPOINT_ID	0
-=20
-+#define FFA_USER_REQ_VER_MAJOR 5
-+#define FFA_USER_REQ_VER_MINOR 0
-+#define FFA_USER_REQ_VER_PATCH 1
-+
- /* Get the 32 least significant bits of a handle.*/
- #define MEM_SHARE_HANDLE_LOW(x) ((x) & 0xffffffff)
- /* Get the 32 most significant bits of a handle.*/
-@@ -62,6 +67,50 @@ static struct ffa_ioctl_ep_desc test_endpoint3 =3D {
- 	.uuid_ptr =3D (uint64_t)test_endpoint3_uuid,
- };
-=20
-+static bool check_ffa_user_version(void)
-+{
-+	FILE *f =3D NULL;
-+	int ver_major =3D -1;
-+	int ver_minor =3D -1;
-+	int ver_patch =3D -1;
-+	int scan_cnt =3D 0;
-+
-+	f =3D fopen("/sys/module/arm_ffa_user/version", "r");
-+	if (f) {
-+		scan_cnt =3D fscanf(f, "%d.%d.%d",
-+				  &ver_major, &ver_minor, &ver_patch);
-+		fclose(f);
-+		if (scan_cnt !=3D 3) {
-+			printf("error: failed to parse arm_ffa_user version\n");
-+			return false;
-+		}
-+	} else {
-+		printf("error: failed to read arm_ffa_user module info - %s\n",
-+		       strerror(errno));
-+		return false;
-+	}
-+
-+	if (ver_major !=3D FFA_USER_REQ_VER_MAJOR)
-+		goto err;
-+
-+	if (ver_minor < FFA_USER_REQ_VER_MINOR)
-+		goto err;
-+
-+	if (ver_minor =3D=3D FFA_USER_REQ_VER_MINOR)
-+		if (ver_patch < FFA_USER_REQ_VER_PATCH)
-+			goto err;
-+
-+	return true;
-+
-+err:
-+	printf("error: Incompatible arm_ffa_user driver detected.");
-+	printf("Found v%d.%d.%d wanted >=3D v%d.%d.%d)\n",
-+	       ver_major, ver_minor, ver_patch, FFA_USER_REQ_VER_MAJOR,
-+		   FFA_USER_REQ_VER_MINOR, FFA_USER_REQ_VER_PATCH);
-+
-+	return false;
-+}
-+
- static void close_debugfs(void)
- {
- 	int err =3D 0;
-@@ -76,6 +125,9 @@ static void close_debugfs(void)
-=20
- static bool init_sp_xtest(ADBG_Case_t *c)
- {
-+	if (!check_ffa_user_version())
-+		return false;
-+
- 	if (ffa_fd < 0) {
- 		ffa_fd =3D open(FFA_DRIVER_FS_PATH, O_RDWR);
- 		if (ffa_fd < 0) {
-@@ -83,6 +135,7 @@ static bool init_sp_xtest(ADBG_Case_t *c)
- 			return false;
- 		}
- 	}
-+
- 	return true;
- }
-=20
-@@ -99,7 +152,7 @@ static uint16_t get_endpoint_id(uint64_t endp)
- 	struct ffa_ioctl_ep_desc sid =3D { .uuid_ptr =3D endp };
-=20
- 	/* Get ID of destination SP based on UUID */
--	if(ioctl(ffa_fd, FFA_IOC_GET_PART_ID, &sid))
-+	if (ioctl(ffa_fd, FFA_IOC_GET_PART_ID, &sid))
- 		return INCORRECT_ENDPOINT_ID;
-=20
- 	return sid.id;
-@@ -213,14 +266,15 @@ static int set_up_mem(struct ffa_ioctl_ep_desc *en=
dp,
- 	rc =3D share_mem(endpoint, handle);
- 	ADBG_EXPECT_COMPARE_SIGNED(c, rc, =3D=3D, 0);
-=20
--	if (!ADBG_EXPECT_TRUE(c, handle !=3D NULL))
--	     return TEEC_ERROR_GENERIC;
-+	if (!ADBG_EXPECT_NOT_NULL(c, handle))
-+		return TEEC_ERROR_GENERIC;
-=20
- 	/* SP will retrieve the memory region. */
- 	memset(args, 0, sizeof(*args));
- 	args->dst_id =3D endpoint;
- 	args->args[MEM_SHARE_HANDLE_LOW_INDEX] =3D MEM_SHARE_HANDLE_LOW(*handl=
e);
--	args->args[MEM_SHARE_HANDLE_HIGH_INDEX] =3D MEM_SHARE_HANDLE_HIGH(*han=
dle);
-+	args->args[MEM_SHARE_HANDLE_HIGH_INDEX] =3D
-+		MEM_SHARE_HANDLE_HIGH(*handle);
- 	args->args[MEM_SHARE_HANDLE_ENDPOINT_INDEX] =3D NORMAL_WORLD_ENDPOINT_=
ID;
-=20
- 	rc =3D start_sp_test(endpoint, EP_RETRIEVE, args);
-@@ -254,7 +308,7 @@ static void xtest_ffa_spmc_test_1002(ADBG_Case_t *c)
- 	rc =3D start_sp_test(endpoint1_id, EP_TEST_SP, &args);
- 	ADBG_EXPECT_COMPARE_SIGNED(c, rc, =3D=3D, 0);
- 	if (!ADBG_EXPECT_COMPARE_UNSIGNED(c, args.args[0], =3D=3D, SPMC_TEST_O=
K))
--	     goto out;
-+		goto out;
-=20
- 	/* Set up memory and have the SP retrieve it. */
- 	Do_ADBG_BeginSubCase(c, "Test memory set-up");
-@@ -469,7 +523,7 @@ static void xtest_ffa_spmc_test_1005(ADBG_Case_t *c)
- 	memset(&args, 0, sizeof(args));
- 	args.args[1] =3D endpoint2;
- 	args.args[2] =3D endpoint3;
--	rc =3D start_sp_test(endpoint1, EP_SP_MEM_SHARING_MULTI,&args);
-+	rc =3D start_sp_test(endpoint1, EP_SP_MEM_SHARING_MULTI, &args);
- 	ADBG_EXPECT_COMPARE_SIGNED(c, rc, =3D=3D, 0);
- 	ADBG_EXPECT_COMPARE_UNSIGNED(c, args.args[0], =3D=3D, SPMC_TEST_OK);
-=20
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test/0003-Update-a=
rm_ffa_user-driver-dependency.patch b/meta-arm-bsp/recipes-security/optee=
/optee-test/0003-Update-arm_ffa_user-driver-dependency.patch
deleted file mode 100644
index 44d9f9477db4..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-test/0003-Update-arm_ffa_=
user-driver-dependency.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 3de910a19f01a2a9e1c9a6bd6feee1aef547f676 Mon Sep 17 00:00:00 2001
-From: Gabor Toth <gabor.toth2@arm.com>
-Date: Fri, 3 Mar 2023 12:23:45 +0100
-Subject: [PATCH] Update arm_ffa_user driver dependency
-
-Updating arm-ffa-user to v5.0.1 to get the following changes:
- - move to 64 bit direct messages
- - add Linux Kernel v6.1 compatibility
-The motivation is to update x-test to depend on the same driver
-version as TS uefi-test and thus to enable running these in a single
-configuration.
-Note: arm_ffa_user.h was copied from:
- - URL:https://git.gitlab.arm.com/linux-arm/linux-trusted-services.git
- - SHA:18e3be71f65a405dfb5d97603ae71b3c11759861
-
-Upstream-Status: Backport
-
-Signed-off-by: Gabor Toth <gabor.toth2@arm.com>
-Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
----
- host/xtest/include/uapi/linux/arm_ffa_user.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/host/xtest/include/uapi/linux/arm_ffa_user.h b/host/xtest/i=
nclude/uapi/linux/arm_ffa_user.h
-index 9ef0be3e1664..0acde4fb2020 100644
---- a/host/xtest/include/uapi/linux/arm_ffa_user.h
-+++ b/host/xtest/include/uapi/linux/arm_ffa_user.h
-@@ -33,7 +33,7 @@ struct ffa_ioctl_ep_desc {
-  * @dst_id:	[in] 16-bit ID of destination endpoint.
-  */
- struct ffa_ioctl_msg_args {
--	__u32 args[5];
-+	__u64 args[5];
- 	__u16 dst_id;
- };
- #define FFA_IOC_MSG_SEND	_IOWR(FFA_IOC_MAGIC, FFA_IOC_BASE + 1, \
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test_3.20.0.bb b/m=
eta-arm-bsp/recipes-security/optee/optee-test_3.20.0.bb
deleted file mode 100644
index 4409ad5f164b..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-test_3.20.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require recipes-security/optee/optee-test.inc
-
-SRC_URI +=3D " \
-    file://0001-xtest-regression_1000-remove-unneeded-stat.h-include.pat=
ch \
-    file://0002-ffa_spmc-Add-arm_ffa_user-driver-compatibility-check.pat=
ch \
-    file://0003-Update-arm_ffa_user-driver-dependency.patch \
-   "
-SRCREV =3D "5db8ab4c733d5b2f4afac3e9aef0a26634c4b444"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test_3.20.0.bbappe=
nd b/meta-arm-bsp/recipes-security/optee/optee-test_3.20.0.bbappend
deleted file mode 100644
index 490b35004906..000000000000
--- a/meta-arm-bsp/recipes-security/optee/optee-test_3.20.0.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-# Machine specific configurations
-
-MACHINE_OPTEE_TEST_REQUIRE ?=3D ""
-MACHINE_OPTEE_TEST_REQUIRE:tc =3D "optee-test-tc.inc"
-
-require ${MACHINE_OPTEE_TEST_REQUIRE}
diff --git a/meta-arm/recipes-devtools/fvp/fvp-tc1.bb b/meta-arm/recipes-=
devtools/fvp/fvp-tc1.bb
deleted file mode 100644
index 4a1295cd2646..000000000000
--- a/meta-arm/recipes-devtools/fvp/fvp-tc1.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require fvp-ecosystem.inc
-
-MODEL =3D "TC1"
-MODEL_CODE =3D "FVP_TC1"
-PV =3D "11.18.28_Linux64"
-
-SRC_URI =3D "https://developer.arm.com/-/media/Arm%20Developer%20Communi=
ty/Downloads/OSS/FVP/TotalCompute/Total%20Compute%20Update%202022/${MODEL=
_CODE}_${PV_URL}.tgz;subdir=3D${BP}"
-SRC_URI[sha256sum] =3D "3a2b32ecf34dc9581482d6fc682a9378ba6ed151ea9b6891=
4b4ebad39fb5cacf"
-
-LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3Da=
50d186fffa51ed55599183aad911298 \
-                    file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3D34a1ba318d745f05e6197def68ea5411"
--=20
2.39.3 (Apple Git-146)


