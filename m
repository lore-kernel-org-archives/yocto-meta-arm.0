Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAF0BCDE03B
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 21:41:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.55784.1727386901106659706
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 26 Sep 2024 14:41:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E249214BF;
	Thu, 26 Sep 2024 14:42:09 -0700 (PDT)
Received: from e126523.arm.com (unknown [10.57.20.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C83AD3F64C;
	Thu, 26 Sep 2024 14:41:38 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH] arm-bsp/trusted-firmware-m: corstone1000: Update metadata handling
Date: Thu, 26 Sep 2024 23:41:30 +0200
Message-Id: <20240926214130.270088-1-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 26 Sep 2024 21:41:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6127

From: Bence Balogh <bence.balogh@arm.com>

The added TF-M patches:
- Remove unused files from TF-M's BL1
- Remove unecessary duplications in metadata write functions
- Fix compiler switches in metadata handling functions: the runtime TF-M
  uses the GPT to get the offsets for the metadata.
- Validate both metadata replica in the beginning by checking the crc32
  checksum. If one of the replicas is corrupted then update it using the
  other replica.

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 ...tform-CS1000-Remove-unused-BL1-files.patch | 451 ++++++++++++++++++
 ...000-Remove-duplicated-metadata-write.patch |  61 +++
 ...rm-CS1000-Fix-compiler-switch-in-BL1.patch | 193 ++++++++
 ...1000-Validate-both-metadata-replicas.patch | 355 ++++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |   4 +
 5 files changed, 1064 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0019-Platform-CS1000-Remove-unused-BL1-files.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0020-Platform-CS1000-Remove-duplicated-metadata-write.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0021-Platform-CS1000-Fix-compiler-switch-in-BL1.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0022-Platform-CS1000-Validate-both-metadata-replicas.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0019-Platform-CS1000-Remove-unused-BL1-files.patch b/meta-arm-bsp/reci=
pes-bsp/trusted-firmware-m/files/corstone1000/0019-Platform-CS1000-Remove=
-unused-BL1-files.patch
new file mode 100644
index 00000000..35183c5f
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0019=
-Platform-CS1000-Remove-unused-BL1-files.patch
@@ -0,0 +1,451 @@
+From 67e5aa83efce5f75df1c5d027e2d52f0da2eaba0 Mon Sep 17 00:00:00 2001
+From: Bence Balogh <bence.balogh@arm.com>
+Date: Thu, 5 Sep 2024 17:21:50 +0200
+Subject: [PATCH 1/5] Platform: CS1000: Remove unused BL1 files
+
+These files are not referenced anywhere so removed them to prevent
+confusion.
+Signed-off-by: Bence Balogh <bence.balogh@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ .../arm/corstone1000/bl1/CMakeLists.txt       | 345 ------------------
+ .../arm/corstone1000/bl1/bl1_security_cnt.c   |  75 ----
+ 2 files changed, 420 deletions(-)
+ delete mode 100644 platform/ext/target/arm/corstone1000/bl1/CMakeLists.=
txt
+ delete mode 100644 platform/ext/target/arm/corstone1000/bl1/bl1_securit=
y_cnt.c
+
+diff --git a/platform/ext/target/arm/corstone1000/bl1/CMakeLists.txt b/p=
latform/ext/target/arm/corstone1000/bl1/CMakeLists.txt
+deleted file mode 100644
+index 5e140eecf6..0000000000
+--- a/platform/ext/target/arm/corstone1000/bl1/CMakeLists.txt
++++ /dev/null
+@@ -1,345 +0,0 @@
+-#----------------------------------------------------------------------=
---------
+-# Copyright (c) 2020-2024, Arm Limited. All rights reserved.
+-#
+-# SPDX-License-Identifier: BSD-3-Clause
+-#
+-#----------------------------------------------------------------------=
---------
+-
+-cmake_minimum_required(VERSION 3.15)
+-cmake_policy(SET CMP0079 NEW)
+-
+-project("BL1 Bootloader" VERSION 0.0.1 LANGUAGES C ASM)
+-
+-# BL1 only loads the BL2 image, image number always equals 1
+-set(BL1_IMAGE_NUMBER 1)
+-
+-# Version of BL2 image
+-set(BL2_IMAGE_VERSION "0.1.0")
+-
+-add_executable(bl1)
+-
+-set_target_properties(bl1
+-    PROPERTIES
+-        SUFFIX ".axf"
+-        RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
+-)
+-
+-target_link_options(bl1
+-    PRIVATE
+-        $<$<C_COMPILER_ID:GNU>:-Wl,-Map=3D${CMAKE_BINARY_DIR}/bin/bl1.m=
ap>
+-)
+-
+-add_convert_to_bin_target(bl1)
+-
+-# bl2_mbedcrypto reused as it is, but it pulls the MCUBOOT_IMAGE_NUMBER=
=3D${MCUBOOT_IMAGE_NUMBER}
+-# configuration, where image number is 3. (Coming from BL2 build). To n=
ot to collide with BL1's
+-# build where image number is 1 mbedcrypto library is separated from th=
e build of other source
+-# files.
+-target_link_libraries(bl1
+-    PRIVATE
+-        bl1_main
+-        bl2_mbedcrypto
+-        cmsis_stack_override
+-        cmsis
+-)
+-
+-# add_convert_to_bin_target(bl1) requires at least one source file adde=
d to bl1. This sources will
+-# be built with wrong image number macro (value coming from BL2 config)=
, so the start-up files
+-# added here, as those not use this image number macro.
+-target_sources(bl1
+-    PRIVATE
+-        $<$<C_COMPILER_ID:GNU>:${CMAKE_CURRENT_SOURCE_DIR}/../Device/So=
urce/startup_corstone1000.c>
+-)
+-
+-# Needed for the GCC startup files
+-target_include_directories(bl1
+-    PRIVATE
+-        ${CMAKE_SOURCE_DIR}/platform/include
+-        ../Device/Include
+-)
+-
+-# target_add_scatter_file(bl1) cannot be used as it would add the platf=
orm_region_defs dependency
+-# to bl1, again pulling the image number property matching with BL2 bui=
ld, so scatter setup done
+-# here by hand.
+-target_link_options(bl1
+-    PRIVATE
+-        -T $<TARGET_OBJECTS:bl1_scatter>
+-)
+-
+-add_library(bl1_scatter OBJECT)
+-
+-add_dependencies(bl1
+-        bl1_scatter
+-    )
+-
+-target_sources(bl1_scatter
+-    PRIVATE
+-        ../Device/Source/gcc/corstone1000_bl1.ld
+-)
+-
+-set_source_files_properties(../Device/Source/gcc/corstone1000_bl1.ld
+-    PROPERTIES
+-    LANGUAGE C
+-)
+-
+-target_compile_options(bl1_scatter
+-    PRIVATE
+-        -E
+-        -P
+-        -xc
+-)
+-
+-target_compile_definitions(bl1_scatter
+-    PRIVATE
+-        MCUBOOT_IMAGE_NUMBER=3D${BL1_IMAGE_NUMBER}
+-        BL1
+-)
+-
+-target_include_directories(bl1_scatter
+-    PRIVATE
+-        ../partition
+-)
+-
+-# Library to spearate build from bl2_mbedcrypto configurations
+-add_library(bl1_main STATIC)
+-
+-target_compile_definitions(bl1_main
+-    PRIVATE
+-        MCUBOOT_IMAGE_NUMBER=3D${BL1_IMAGE_NUMBER}
+-        BL1
+-        BL2
+-        $<$<BOOL:${PLATFORM_IS_FVP}>:PLATFORM_IS_FVP>
+-)
+-
+-# Configurations based on bl2/CMakeLists.txt
+-
+-# Many files are reused form TF-M's bl2 directory
+-set(BL2_SOURCE ${CMAKE_SOURCE_DIR}/bl2)
+-
+-target_sources(bl1_main
+-    PRIVATE
+-        ${BL2_SOURCE}/src/flash_map.c
+-        ./provisioning.c
+-)
+-
+-target_include_directories(bl1_main
+-    PRIVATE
+-        $<BUILD_INTERFACE:${BL2_SOURCE}/include>
+-)
+-
+-# Include path needed for mbedcrypto headers
+-target_include_directories(bl1_main
+-    PRIVATE
+-        $<BUILD_INTERFACE:${MBEDCRYPTO_PATH}/include>
+-)
+-
+-# Configurations based on bl2/ext/mcuboot/CMakeLists.txt
+-target_link_libraries(bl1_main
+-    PRIVATE
+-        mcuboot_config
+-        bl2_mbedcrypto_config
+-)
+-
+-target_include_directories(bl1_main
+-    PRIVATE
+-        $<BUILD_INTERFACE:${BL2_SOURCE}/ext/mcuboot/include>
+-)
+-
+-target_sources(bl1_main
+-    PRIVATE
+-        ${BL2_SOURCE}/ext/mcuboot/bl2_main.c
+-        ${BL2_SOURCE}/ext/mcuboot/keys.c
+-        ${BL2_SOURCE}/ext/mcuboot/flash_map_legacy.c
+-)
+-
+-# Configurations based on ${MCUBOOT_PATH}/boot/bootutil/CMakeLists.txt
+-# add_subdirectory("${MCUBOOT_PATH}/boot/bootutil" bootutil) cannot wor=
k as we want to define different hal
+-# functions compared to BL2
+-target_sources(bl1_main
+-    PRIVATE
+-        ${MCUBOOT_PATH}/boot/bootutil/src/loader.c
+-        ${MCUBOOT_PATH}/boot/bootutil/src/bootutil_misc.c
+-        ${MCUBOOT_PATH}/boot/bootutil/src/bootutil_public.c
+-        ${MCUBOOT_PATH}/boot/bootutil/src/image_validate.c
+-        ${MCUBOOT_PATH}/boot/bootutil/src/image_rsa.c
+-        ${MCUBOOT_PATH}/boot/bootutil/src/tlv.c
+-        ${MCUBOOT_PATH}/boot/bootutil/src/boot_record.c
+-        ${MCUBOOT_PATH}/boot/bootutil/src/swap_scratch.c
+-        ${MCUBOOT_PATH}/boot/bootutil/src/swap_move.c
+-        ${MCUBOOT_PATH}/boot/bootutil/src/swap_misc.c
+-        ${MCUBOOT_PATH}/boot/bootutil/src/encrypted.c
+-        ${MCUBOOT_PATH}/boot/bootutil/src/fault_injection_hardening.c
+-        ${MCUBOOT_PATH}/boot/bootutil/src/fault_injection_hardening_del=
ay_rng_mbedtls.c
+-)
+-
+-target_include_directories(bl1_main
+-    PRIVATE
+-        $<BUILD_INTERFACE:${MCUBOOT_PATH}/boot/bootutil/include>
+-        $<BUILD_INTERFACE:${MCUBOOT_PATH}/boot/bootutil/src>
+-        $<BUILD_INTERFACE:${MCUBOOT_PATH}/boot>
+-)
+-
+-# Configurations based on platform/CMakeLists.txt
+-target_include_directories(bl1_main
+-    PRIVATE
+-        $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/platform/include>
+-        $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/platform/ext/driver>
+-        $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/platform/ext/common>
+-        $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/platform/ext>
+-        $<$<BOOL:${CRYPTO_HW_ACCELERATOR}>:${CMAKE_SOURCE_DIR}/platform=
/ext/accelerator/interface>
+-)
+-
+-target_sources(bl1_main
+-    PRIVATE
+-        $<$<BOOL:${PLATFORM_DEFAULT_UART_STDOUT}>:${CMAKE_SOURCE_DIR}/p=
latform/ext/common/uart_stdout.c>
+-        $<$<BOOL:${PLATFORM_DEFAULT_NV_COUNTERS}>:${CMAKE_SOURCE_DIR}/p=
latform/ext/common/template/nv_counters.c>
+-        $<$<OR:$<BOOL:${PLATFORM_DEFAULT_NV_COUNTERS}>,$<BOOL:${PLATFOR=
M_DEFAULT_OTP}>>:${CMAKE_SOURCE_DIR}/platform/ext/common/template/flash_o=
tp_nv_counters_backend.c>
+-        $<$<BOOL:${PLATFORM_DEFAULT_OTP}>:${CMAKE_SOURCE_DIR}/platform/=
ext/common/template/otp_flash.c>
+-)
+-
+-target_link_libraries(bl1_main
+-    PRIVATE
+-        bl2_hal
+-        cmsis
+-)
+-
+-target_compile_definitions(bl1_main
+-    PRIVATE
+-        MCUBOOT_${MCUBOOT_UPGRADE_STRATEGY}
+-        $<$<BOOL:${SYMMETRIC_INITIAL_ATTESTATION}>:SYMMETRIC_INITIAL_AT=
TESTATION>
+-        $<$<BOOL:${PLATFORM_DEFAULT_NV_COUNTERS}>:PLATFORM_DEFAULT_NV_C=
OUNTERS>
+-        $<$<BOOL:${MCUBOOT_HW_KEY}>:MCUBOOT_HW_KEY>
+-        MCUBOOT_FIH_PROFILE_${MCUBOOT_FIH_PROFILE}
+-        $<$<BOOL:${PLATFORM_DEFAULT_NV_COUNTERS}>:PLATFORM_DEFAULT_NV_C=
OUNTERS>
+-        $<$<BOOL:${PLATFORM_DEFAULT_OTP}>:PLATFORM_DEFAULT_OTP>
+-        $<$<BOOL:${OTP_NV_COUNTERS_RAM_EMULATION}>:OTP_NV_COUNTERS_RAM_=
EMULATION=3D1>
+-        $<$<BOOL:${TFM_DUMMY_PROVISIONING}>:TFM_DUMMY_PROVISIONING>
+-        $<$<BOOL:${PLATFORM_DEFAULT_OTP_WRITEABLE}>:OTP_WRITEABLE>
+-)
+-
+-# Configurations based on cc312 cmake files
+-target_compile_definitions(bl1_main
+-    PRIVATE
+-        $<$<BOOL:${CRYPTO_HW_ACCELERATOR_OTP_STATE}>:CRYPTO_HW_ACCELERA=
TOR_OTP_${CRYPTO_HW_ACCELERATOR_OTP_STATE}>
+-        $<$<BOOL:${CRYPTO_HW_ACCELERATOR}>:CRYPTO_HW_ACCELERATOR>
+-        $<$<BOOL:${ENABLE_FWU_AGENT_DEBUG_LOGS}>:ENABLE_FWU_AGENT_DEBUG=
_LOGS>
+-)
+-
+-target_include_directories(bl1_main
+-    PRIVATE
+-        $<$<BOOL:${CRYPTO_HW_ACCELERATOR}>:${CMAKE_SOURCE_DIR}/platform=
/ext/accelerator/cc312>
+-        $<$<BOOL:${CRYPTO_HW_ACCELERATOR}>:${CMAKE_SOURCE_DIR}/lib/ext/=
cryptocell-312-runtime/shared/include/mbedtls>
+-        $<$<BOOL:${CRYPTO_HW_ACCELERATOR}>:${CMAKE_SOURCE_DIR}/lib/ext/=
cryptocell-312-runtime/shared/include/crypto_api/cc3x>
+-        ../soft_crc
+-)
+-
+-# Configurations based on platform level cmake files
+-target_sources(bl1_main
+-    PRIVATE
+-        ../CMSIS_Driver/Driver_Flash.c
+-        ../CMSIS_Driver/Driver_USART.c
+-        ../Device/Source/device_definition.c
+-        ../Device/Source/system_core_init.c
+-        ../Native_Driver/firewall.c
+-        ../Native_Driver/uart_pl011_drv.c
+-        ../fw_update_agent/fwu_agent.c
+-        ../soft_crc/soft_crc.c
+-        ../Native_Driver/arm_watchdog_drv.c
+-        ../Native_Driver/watchdog.c
+-        bl1_boot_hal.c
+-        bl1_flash_map.c
+-        bl1_security_cnt.c
+-        flash_map_extended.c
+-        bl1_rotpk.c
+-)
+-
+-if (PLATFORM_IS_FVP)
+-target_sources(bl1_main
+-    PRIVATE
+-        ${PLATFORM_DIR}/ext/target/arm/drivers/flash/strata/spi_strataf=
lashj3_flash_lib.c
+-        ${PLATFORM_DIR}/ext/target/arm/drivers/flash/cfi/cfi_drv.c
+-)
+-else()
+-target_sources(bl1_main
+-    PRIVATE
+-        ${PLATFORM_DIR}/ext/target/arm/drivers/qspi/xilinx_pg153_axi/xi=
linx_pg153_axi_qspi_controller_drv.c
+-        ${PLATFORM_DIR}/ext/target/arm/drivers/flash/n25q256a/spi_n25q2=
56a_flash_lib.c
+-        ${PLATFORM_DIR}/ext/target/arm/drivers/flash/sst26vf064b/spi_ss=
t26vf064b_flash_lib.c
+-)
+-endif()
+-
+-target_include_directories(bl1_main
+-    PRIVATE
+-        ../partition
+-        ../Device/Include
+-        ../.
+-        ../CMSIS_Driver/Config
+-        ../Device/Config
+-        ../Native_Driver
+-        ../fw_update_agent
+-        ${PLATFORM_DIR}/ext/target/arm/drivers/flash/common
+-        ${PLATFORM_DIR}/ext/target/arm/drivers/flash/cfi
+-        ${PLATFORM_DIR}/ext/target/arm/drivers/flash/strata
+-        ${PLATFORM_DIR}/ext/target/arm/drivers/qspi/xilinx_pg153_axi
+-        ${PLATFORM_DIR}/ext/target/arm/drivers/flash/n25q256a
+-        ${PLATFORM_DIR}/ext/target/arm/drivers/flash/sst26vf064b
+-
+-)
+-
+-############################### SIGNING BL2 image #####################=
#############
+-
+-find_package(Python3)
+-
+-set(FLASH_AREA_NUM 8)
+-configure_file(signing_layout.c.in ${CMAKE_CURRENT_BINARY_DIR}/signing_=
layout.c @ONLY)
+-add_library(signing_layout_for_bl2 OBJECT ${CMAKE_CURRENT_BINARY_DIR}/s=
igning_layout.c)
+-
+-target_compile_options(signing_layout_for_bl2
+-    PRIVATE
+-        $<$<C_COMPILER_ID:GNU>:-E\;-xc>
+-        $<$<C_COMPILER_ID:ARMClang>:-E\;-xc>
+-        $<$<C_COMPILER_ID:IAR>:--preprocess=3Dns\;$<TARGET_OBJECTS:sign=
ing_layout_s>>
+-)
+-target_compile_definitions(signing_layout_for_bl2
+-    PRIVATE
+-        MCUBOOT_IMAGE_NUMBER=3D${BL1_IMAGE_NUMBER}
+-        BL1
+-)
+-
+-target_include_directories(signing_layout_for_bl2
+-    PRIVATE
+-        ../partition
+-)
+-
+-if (CONFIG_TFM_BOOT_STORE_MEASUREMENTS AND CONFIG_TFM_BOOT_STORE_ENCODE=
D_MEASUREMENTS)
+-    set(MCUBOOT_MEASURED_BOOT ON)
+-endif()
+-
+-add_custom_target(bl2_signed_bin
+-    ALL
+-    SOURCES bl2_signed.bin
+-)
+-add_custom_command(OUTPUT bl2_signed.bin
+-    DEPENDS $<TARGET_FILE_DIR:bl2>/bl2.bin
+-    DEPENDS bl2_bin signing_layout_for_bl2
+-    WORKING_DIRECTORY ${MCUBOOT_PATH}/scripts
+-
+-    #Sign secure binary image with provided secret key
+-    COMMAND ${Python3_EXECUTABLE} ${BL2_SOURCE}/ext/mcuboot/scripts/wra=
pper/wrapper.py
+-        -v ${BL2_IMAGE_VERSION}
+-        --layout $<TARGET_OBJECTS:signing_layout_for_bl2>
+-        -k ${MCUBOOT_KEY_S}
+-        --public-key-format $<IF:$<BOOL:${MCUBOOT_HW_KEY}>,full,hash>
+-        --align 1
+-        --pad
+-        --pad-header
+-        -H 0x400
+-        -s ${MCUBOOT_SECURITY_COUNTER_S}
+-        -d \"\(0,${MCUBOOT_S_IMAGE_MIN_VER}\)\"
+-        $<$<STREQUAL:${MCUBOOT_UPGRADE_STRATEGY},OVERWRITE_ONLY>:--over=
write-only>
+-        $<$<BOOL:${MCUBOOT_ENC_IMAGES}>:-E${MCUBOOT_KEY_ENC}>
+-        $<$<BOOL:${MCUBOOT_MEASURED_BOOT}>:--measured-boot-record>
+-        $<TARGET_FILE_DIR:bl2>/bl2.bin
+-        ${CMAKE_CURRENT_BINARY_DIR}/bl2_signed.bin
+-    COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_BINARY_DIR}/bl2_si=
gned.bin $<TARGET_FILE_DIR:bl2>
+-)
+diff --git a/platform/ext/target/arm/corstone1000/bl1/bl1_security_cnt.c=
 b/platform/ext/target/arm/corstone1000/bl1/bl1_security_cnt.c
+deleted file mode 100644
+index 32c1481cca..0000000000
+--- a/platform/ext/target/arm/corstone1000/bl1/bl1_security_cnt.c
++++ /dev/null
+@@ -1,75 +0,0 @@
+-/*
+- * Copyright (c) 2019-2021, Arm Limited. All rights reserved.
+- *
+- * SPDX-License-Identifier: BSD-3-Clause
+- *
+- */
+-
+-#include "bootutil/security_cnt.h"
+-#include "tfm_plat_nv_counters.h"
+-#include "tfm_plat_defs.h"
+-#include "bootutil/fault_injection_hardening.h"
+-#include <stdint.h>
+-#include "tfm_plat_provisioning.h"
+-#include "fwu_agent.h"
+-
+-fih_ret boot_nv_security_counter_init(void)
+-{
+-    FIH_DECLARE(fih_rc, FIH_FAILURE);
+-
+-    fih_rc =3D fih_ret_encode_zero_equality(tfm_plat_init_nv_counter())=
;
+-
+-    FIH_RET(fih_rc);
+-}
+-
+-fih_ret boot_nv_security_counter_get(uint32_t image_id, fih_int *securi=
ty_cnt)
+-{
+-    FIH_DECLARE(fih_rc, FIH_FAILURE);
+-    uint32_t security_cnt_soft;
+-
+-    /* Check if it's a null-pointer. */
+-    if (!security_cnt) {
+-        FIH_RET(FIH_FAILURE);
+-    }
+-
+-    if (image_id !=3D 0) {
+-        FIH_RET(FIH_FAILURE);
+-    }
+-
+-    fih_rc =3D fih_ret_encode_zero_equality(
+-             tfm_plat_read_nv_counter(PLAT_NV_COUNTER_BL1_0,
+-                                      sizeof(security_cnt_soft),
+-                                      (uint8_t *)&security_cnt_soft));
+-    *security_cnt =3D fih_int_encode(security_cnt_soft);
+-
+-    FIH_RET(fih_rc);
+-}
+-
+-int32_t boot_nv_security_counter_update(uint32_t image_id,
+-                                        uint32_t img_security_cnt)
+-{
+-    enum tfm_plat_err_t err;
+-    enum fwu_agent_error_t fwu_err;
+-
+-    if (image_id !=3D 0) {
+-        return -1;
+-    }
+-
+-    if (tfm_plat_provisioning_is_required()) {
+-
+-        err =3D tfm_plat_set_nv_counter(PLAT_NV_COUNTER_BL1_0, img_secu=
rity_cnt);
+-        if (err !=3D TFM_PLAT_ERR_SUCCESS) {
+-            return -1;
+-        }
+-
+-    } else {
+-
+-        fwu_err =3D fwu_stage_nv_counter(FWU_BL2_NV_COUNTER, img_securi=
ty_cnt);
+-        if (fwu_err !=3D FWU_AGENT_SUCCESS) {
+-            return -1;
+-        }
+-
+-    }
+-
+-    return 0;
+-}
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0020-Platform-CS1000-Remove-duplicated-metadata-write.patch b/meta-arm=
-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0020-Platform-CS10=
00-Remove-duplicated-metadata-write.patch
new file mode 100644
index 00000000..e468916e
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0020=
-Platform-CS1000-Remove-duplicated-metadata-write.patch
@@ -0,0 +1,61 @@
+From 60793058794f0ac8ea35a69b2dddf97ccba1acdb Mon Sep 17 00:00:00 2001
+From: Bence Balogh <bence.balogh@arm.com>
+Date: Thu, 5 Sep 2024 21:29:07 +0200
+Subject: [PATCH 2/5] Platform: CS1000: Remove duplicated metadata write
+
+The metadata replica_2 was written twice which is not needed.
+Signed-off-by: Bence Balogh <bence.balogh@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ .../corstone1000/fw_update_agent/fwu_agent.c  | 28 -------------------
+ 1 file changed, 28 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+index d0028a56d8..2b69447dc5 100644
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+@@ -499,20 +499,6 @@ static enum fwu_agent_error_t metadata_write(
+         return FWU_AGENT_ERROR;
+     }
+=20
+-    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
+-                  FWU_METADATA_REPLICA_2_OFFSET, sizeof(struct fwu_meta=
data));
+-
+-    ret =3D FWU_METADATA_FLASH_DEV.EraseSector(FWU_METADATA_REPLICA_2_O=
FFSET);
+-    if (ret !=3D ARM_DRIVER_OK) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(FWU_METADATA_REPLICA_2_O=
FFSET,
+-                                p_metadata, sizeof(struct fwu_metadata)=
);
+-    if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+     FWU_LOG_MSG("%s: success: active =3D %u, previous =3D %d\n\r", __fu=
nc__,
+                   p_metadata->active_index, p_metadata->previous_active=
_index);
+     return FWU_AGENT_SUCCESS;
+@@ -569,20 +555,6 @@ static enum fwu_agent_error_t metadata_write(
+         return FWU_AGENT_ERROR;
+     }
+=20
+-    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
+-                  FWU_METADATA_REPLICA_2_OFFSET, sizeof(struct fwu_meta=
data));
+-
+-    ret =3D FWU_METADATA_FLASH_DEV.EraseSector(FWU_METADATA_REPLICA_2_O=
FFSET);
+-    if (ret !=3D ARM_DRIVER_OK) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(FWU_METADATA_REPLICA_2_O=
FFSET,
+-                                p_metadata, sizeof(struct fwu_metadata)=
);
+-    if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+     FWU_LOG_MSG("%s: success: active =3D %u, previous =3D %d\n\r", __fu=
nc__,
+                   p_metadata->active_index, p_metadata->previous_active=
_index);
+     return FWU_AGENT_SUCCESS;
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0021-Platform-CS1000-Fix-compiler-switch-in-BL1.patch b/meta-arm-bsp/r=
ecipes-bsp/trusted-firmware-m/files/corstone1000/0021-Platform-CS1000-Fix=
-compiler-switch-in-BL1.patch
new file mode 100644
index 00000000..7ff3a868
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0021=
-Platform-CS1000-Fix-compiler-switch-in-BL1.patch
@@ -0,0 +1,193 @@
+From 09827a44518b05a2cc58602dda18474973abfb83 Mon Sep 17 00:00:00 2001
+From: Bence Balogh <bence.balogh@arm.com>
+Date: Thu, 5 Sep 2024 17:28:56 +0200
+Subject: [PATCH 3/5] Platform: CS1000: Fix compiler switch in BL1
+
+The fwu_agent.c used the "BL1" definition to check if the source file
+is building for the BL1 or for the TFM_S target.
+But the "BL1" definition is added to the build flags for every file
+that links against platform_region_defs, see
+tfm/cmake/spe-CMakeLists.cmake:
+
+target_compile_definitions(platform_region_defs
+    INTERFACE
+        $<$<BOOL:${BL1}>:BL1>
+       ....
+)
+
+This means the "#if BL1" condition was true for both cases.
+
+This commit:
+- Adds a new definition that is only added to the
+  platform_bl1_1 target.
+- Fixes the #elif with no expression error that came up.
+- Moves the partition table loading because previously it was not
+  loaded during the runtime TFM_S execution, only in BL2.
+
+Signed-off-by: Bence Balogh <bence.balogh@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ .../target/arm/corstone1000/CMakeLists.txt    |  7 ++++
+ .../corstone1000/fw_update_agent/fwu_agent.c  | 33 +++++++++----------
+ 2 files changed, 23 insertions(+), 17 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platf=
orm/ext/target/arm/corstone1000/CMakeLists.txt
+index 89db1732a9..f6880cba3c 100644
+--- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
++++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
+@@ -144,6 +144,7 @@ target_sources(platform_s
+         partition/gpt.c
+         $<$<NOT:$<BOOL:${PLATFORM_DEFAULT_OTP}>>:${PLATFORM_DIR}/ext/ac=
celerator/cc312/otp_cc312.c>
+         rse_comms_permissions_hal.c
++        platform.c
+ )
+=20
+ if (PLATFORM_IS_FVP)
+@@ -213,6 +214,12 @@ target_compile_definitions(platform_bl1_1
+         $<$<BOOL:${CRYPTO_HW_ACCELERATOR_OTP_PROVISIONING}>:CRYPTO_HW_A=
CCELERATOR_OTP_PROVISIONING>
+         MBEDTLS_CONFIG_FILE=3D"${CMAKE_SOURCE_DIR}/lib/ext/mbedcrypto/m=
bedcrypto_config/tfm_mbedcrypto_config_default.h"
+         MBEDTLS_PSA_CRYPTO_CONFIG_FILE=3D"${CMAKE_SOURCE_DIR}/lib/ext/m=
bedcrypto/mbedcrypto_config/crypto_config_default.h"
++
++        # This definition is only added to the bl1_main target. There a=
re
++        # files that are shared between the BL1 and TFM_S targets. This=
 flag
++        # can be used if the BL1 target needs different implementation =
than
++        # the TFM_S target.
++        BL1_BUILD
+ )
+=20
+ target_include_directories(platform_bl1_1_interface
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+index 2b69447dc5..9890eeaf90 100644
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+@@ -21,7 +21,7 @@
+ #include "uefi_fmp.h"
+ #include "uart_stdout.h"
+ #include "soft_crc.h"
+-#if !BL1
++#ifndef BL1_BUILD
+ #include "partition.h"
+ #include "platform.h"
+ #endif
+@@ -197,7 +197,7 @@ extern ARM_DRIVER_FLASH FWU_METADATA_FLASH_DEV;
+=20
+ #define HOST_ACK_TIMEOUT_SEC    (6 * 60) /* ~seconds, not exact */
+=20
+-#if BL1
++#ifdef BL1_BUILD
+ static enum fwu_agent_error_t private_metadata_read(
+         struct fwu_private_metadata* p_metadata)
+ {
+@@ -220,7 +220,7 @@ static enum fwu_agent_error_t private_metadata_read(
+=20
+     return FWU_AGENT_SUCCESS;
+ }
+-#elif
++#else
+ static enum fwu_agent_error_t private_metadata_read(
+         struct fwu_private_metadata* p_metadata)
+ {
+@@ -253,7 +253,7 @@ static enum fwu_agent_error_t private_metadata_read(
+ }
+ #endif
+=20
+-#if BL1
++#ifdef BL1_BUILD
+ static enum fwu_agent_error_t private_metadata_write(
+         struct fwu_private_metadata* p_metadata)
+ {
+@@ -280,7 +280,7 @@ static enum fwu_agent_error_t private_metadata_write=
(
+     FWU_LOG_MSG("%s: success\n\r", __func__);
+     return FWU_AGENT_SUCCESS;
+ }
+-#elif
++#else
+ static enum fwu_agent_error_t private_metadata_write(
+         struct fwu_private_metadata* p_metadata)
+ {
+@@ -339,7 +339,7 @@ static enum fwu_agent_error_t metadata_validate(stru=
ct fwu_metadata *p_metadata)
+     return FWU_AGENT_SUCCESS;
+ }
+=20
+-#if BL1
++#ifdef BL1_BUILD
+ static enum fwu_agent_error_t metadata_read_without_validation(struct f=
wu_metadata *p_metadata)
+ {
+     int ret;
+@@ -362,7 +362,7 @@ static enum fwu_agent_error_t metadata_read_without_=
validation(struct fwu_metada
+=20
+     return FWU_AGENT_SUCCESS;
+ }
+-#elif
++#else
+ static enum fwu_agent_error_t metadata_read_without_validation(struct f=
wu_metadata *p_metadata)
+ {
+     uuid_t metadata_uuid =3D FWU_METADATA_TYPE_UUID;
+@@ -396,7 +396,7 @@ static enum fwu_agent_error_t metadata_read_without_=
validation(struct fwu_metada
+ }
+ #endif
+=20
+-#if BL1
++#ifdef BL1_BUILD
+ static enum fwu_agent_error_t metadata_read(struct fwu_metadata *p_meta=
data)
+ {
+     int ret;
+@@ -423,7 +423,7 @@ static enum fwu_agent_error_t metadata_read(struct f=
wu_metadata *p_metadata)
+=20
+     return FWU_AGENT_SUCCESS;
+ }
+-#elif
++#else
+ static enum fwu_agent_error_t metadata_read(struct fwu_metadata *p_meta=
data)
+ {
+     uuid_t metadata_uuid =3D FWU_METADATA_TYPE_UUID;
+@@ -461,7 +461,7 @@ static enum fwu_agent_error_t metadata_read(struct f=
wu_metadata *p_metadata)
+ #endif
+=20
+=20
+-#if BL1
++#ifdef BL1_BUILD
+ static enum fwu_agent_error_t metadata_write(
+                         struct fwu_metadata *p_metadata)
+ {
+@@ -503,7 +503,7 @@ static enum fwu_agent_error_t metadata_write(
+                   p_metadata->active_index, p_metadata->previous_active=
_index);
+     return FWU_AGENT_SUCCESS;
+ }
+-#elif
++#else
+ static enum fwu_agent_error_t metadata_write(
+                         struct fwu_metadata *p_metadata)
+ {
+@@ -567,11 +567,15 @@ enum fwu_agent_error_t fwu_metadata_init(void)
+     enum fwu_agent_error_t ret;
+     ARM_FLASH_INFO* flash_info;
+=20
+-
+     if (is_initialized) {
+         return FWU_AGENT_SUCCESS;
+     }
+=20
++    #ifndef BL1_BUILD
++    plat_io_storage_init();
++    partition_init(PLATFORM_GPT_IMAGE);
++    #endif
++
+     /* Code assumes everything fits into a sector */
+     if (sizeof(struct fwu_metadata) > FWU_METADATA_FLASH_SECTOR_SIZE) {
+         return FWU_AGENT_ERROR;
+@@ -605,11 +609,6 @@ enum fwu_agent_error_t fwu_metadata_provision(void)
+=20
+     FWU_LOG_MSG("%s: enter\n\r", __func__);
+=20
+-#if !BL1
+-    plat_io_storage_init();
+-    partition_init(PLATFORM_GPT_IMAGE);
+-#endif
+-
+     ret =3D fwu_metadata_init();
+     if (ret) {
+         return ret;
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0022-Platform-CS1000-Validate-both-metadata-replicas.patch b/meta-arm-=
bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0022-Platform-CS100=
0-Validate-both-metadata-replicas.patch
new file mode 100644
index 00000000..902c1b6a
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0022=
-Platform-CS1000-Validate-both-metadata-replicas.patch
@@ -0,0 +1,355 @@
+From df0b5f5f7da1d7dbe10ccf35f9971e58e3110f6e Mon Sep 17 00:00:00 2001
+From: Bence Balogh <bence.balogh@arm.com>
+Date: Mon, 9 Sep 2024 09:42:58 +0200
+Subject: [PATCH 1/2] Platform: CS1000: Validate both metadata replicas
+
+According to the [1] both metadata replica integrity should be checked
+during the update agent initialization, and if one of the replica is
+corrupted then it should be fixed by copying the other replica.
+
+This commit:
+- Adds the integrity check and correction to the
+  corstone1000_fwu_host_ack() function. This function is called when
+  the Host core has booted.
+- Updates the metadata_read() function so both replica can be read.
+- Adds metadata_write_replica() function to write metadata replicas
+  separately.
+
+[1] https://developer.arm.com/documentation/den0118/a/?lang=3Den
+
+Signed-off-by: Bence Balogh <bence.balogh@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ .../corstone1000/fw_update_agent/fwu_agent.c  | 155 ++++++++++++------
+ .../corstone1000/fw_update_agent/fwu_agent.h  |   7 +
+ 2 files changed, 111 insertions(+), 51 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+index 9890eeaf90..a09653b3ac 100644
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+@@ -397,18 +397,30 @@ static enum fwu_agent_error_t metadata_read_withou=
t_validation(struct fwu_metada
+ #endif
+=20
+ #ifdef BL1_BUILD
+-static enum fwu_agent_error_t metadata_read(struct fwu_metadata *p_meta=
data)
++static enum fwu_agent_error_t metadata_read(struct fwu_metadata *p_meta=
data, uint8_t replica_num)
+ {
+     int ret;
++    uint32_t replica_offset =3D 0;
+=20
+-    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
+-                  FWU_METADATA_REPLICA_1_OFFSET, sizeof(struct fwu_meta=
data));
++    FWU_LOG_MSG("%s: enter\n\r", __func__);
++
++    if (replica_num =3D=3D 1) {
++        replica_offset =3D FWU_METADATA_REPLICA_1_OFFSET;
++    } else if (replica_num =3D=3D 2) {
++        replica_offset =3D FWU_METADATA_REPLICA_2_OFFSET;
++    } else {
++        FWU_LOG_MSG("%s: replica_num must be 1 or 2\n\r", __func__);
++        return FWU_AGENT_ERROR;
++    }
++
++    FWU_LOG_MSG("%s: flash addr =3D %u, size =3D %d\n\r", __func__,
++                  replica_offset, sizeof(struct fwu_metadata));
+=20
+     if (!p_metadata) {
+         return FWU_AGENT_ERROR;
+     }
+=20
+-    ret =3D FWU_METADATA_FLASH_DEV.ReadData(FWU_METADATA_REPLICA_1_OFFS=
ET,
++    ret =3D FWU_METADATA_FLASH_DEV.ReadData(replica_offset,
+                                 p_metadata, sizeof(struct fwu_metadata)=
);
+     if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
+         return FWU_AGENT_ERROR;
+@@ -424,7 +436,7 @@ static enum fwu_agent_error_t metadata_read(struct f=
wu_metadata *p_metadata)
+     return FWU_AGENT_SUCCESS;
+ }
+ #else
+-static enum fwu_agent_error_t metadata_read(struct fwu_metadata *p_meta=
data)
++static enum fwu_agent_error_t metadata_read(struct fwu_metadata *p_meta=
data, uint8_t replica_num)
+ {
+     uuid_t metadata_uuid =3D FWU_METADATA_TYPE_UUID;
+     partition_entry_t *part;
+@@ -434,7 +446,15 @@ static enum fwu_agent_error_t metadata_read(struct =
fwu_metadata *p_metadata)
+         return FWU_AGENT_ERROR;
+     }
+=20
+-    part =3D get_partition_entry_by_type(&metadata_uuid);
++    if (replica_num =3D=3D 1) {
++        part =3D get_partition_entry_by_type(&metadata_uuid);
++    } else if (replica_num =3D=3D 2) {
++        part =3D get_partition_replica_by_type(&metadata_uuid);
++    } else {
++        FWU_LOG_MSG("%s: replica_num must be 1 or 2\n\r", __func__);
++        return FWU_AGENT_ERROR;
++    }
++
+     if (!part) {
+         FWU_LOG_MSG("%s: FWU metadata partition not found\n\r", __func_=
_);
+         return FWU_AGENT_ERROR;
+@@ -463,37 +483,35 @@ static enum fwu_agent_error_t metadata_read(struct=
 fwu_metadata *p_metadata)
+=20
+ #ifdef BL1_BUILD
+ static enum fwu_agent_error_t metadata_write(
+-                        struct fwu_metadata *p_metadata)
++                        struct fwu_metadata *p_metadata, uint8_t replic=
a_num)
+ {
+     int ret;
++    uint32_t replica_offset =3D 0;
+=20
+-    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
+-                  FWU_METADATA_REPLICA_1_OFFSET, sizeof(struct fwu_meta=
data));
++    FWU_LOG_MSG("%s: enter\n\r", __func__);
+=20
+-    if (!p_metadata) {
++    if (replica_num =3D=3D 1) {
++        replica_offset =3D FWU_METADATA_REPLICA_1_OFFSET;
++    } else if (replica_num =3D=3D 2) {
++        replica_offset =3D FWU_METADATA_REPLICA_2_OFFSET;
++    } else {
++        FWU_LOG_MSG("%s: replica_num must be 1 or 2\n\r", __func__);
+         return FWU_AGENT_ERROR;
+     }
+=20
+-    ret =3D FWU_METADATA_FLASH_DEV.EraseSector(FWU_METADATA_REPLICA_1_O=
FFSET);
+-    if (ret !=3D ARM_DRIVER_OK) {
+-        return FWU_AGENT_ERROR;
+-    }
++    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
++                  replica_offset, sizeof(struct fwu_metadata));
+=20
+-    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(FWU_METADATA_REPLICA_1_O=
FFSET,
+-                                p_metadata, sizeof(struct fwu_metadata)=
);
+-    if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
++    if (!p_metadata) {
+         return FWU_AGENT_ERROR;
+     }
+=20
+-    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
+-                  FWU_METADATA_REPLICA_2_OFFSET, sizeof(struct fwu_meta=
data));
+-
+-    ret =3D FWU_METADATA_FLASH_DEV.EraseSector(FWU_METADATA_REPLICA_2_O=
FFSET);
++    ret =3D FWU_METADATA_FLASH_DEV.EraseSector(replica_offset);
+     if (ret !=3D ARM_DRIVER_OK) {
+         return FWU_AGENT_ERROR;
+     }
+=20
+-    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(FWU_METADATA_REPLICA_2_O=
FFSET,
++    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(replica_offset,
+                                 p_metadata, sizeof(struct fwu_metadata)=
);
+     if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
+         return FWU_AGENT_ERROR;
+@@ -505,7 +523,7 @@ static enum fwu_agent_error_t metadata_write(
+ }
+ #else
+ static enum fwu_agent_error_t metadata_write(
+-                        struct fwu_metadata *p_metadata)
++                        struct fwu_metadata *p_metadata, uint8_t replic=
a_num)
+ {
+     uuid_t metadata_uuid =3D FWU_METADATA_TYPE_UUID;
+     partition_entry_t *part;
+@@ -515,7 +533,15 @@ static enum fwu_agent_error_t metadata_write(
+         return FWU_AGENT_ERROR;
+     }
+=20
+-    part =3D get_partition_entry_by_type(&metadata_uuid);
++    if (replica_num =3D=3D 1) {
++        part =3D get_partition_entry_by_type(&metadata_uuid);
++    } else if (replica_num =3D=3D 2) {
++        part =3D get_partition_replica_by_type(&metadata_uuid);
++    } else {
++        FWU_LOG_MSG("%s: replica_num must be 1 or 2\n\r", __func__);
++        return FWU_AGENT_ERROR;
++    }
++
+     if (!part) {
+         FWU_LOG_MSG("%s: FWU metadata partition not found\n\r", __func_=
_);
+         return FWU_AGENT_ERROR;
+@@ -535,32 +561,51 @@ static enum fwu_agent_error_t metadata_write(
+         return FWU_AGENT_ERROR;
+     }
+=20
+-    part =3D get_partition_replica_by_type(&metadata_uuid);
+-    if (!part) {
+-        FWU_LOG_MSG("%s: FWU metadata replica partition not found\n\r",=
 __func__);
+-        return FWU_AGENT_ERROR;
+-    }
++    FWU_LOG_MSG("%s: success: active =3D %u, previous =3D %d\n\r", __fu=
nc__,
++                  p_metadata->active_index, p_metadata->previous_active=
_index);
++    return FWU_AGENT_SUCCESS;
++}
++#endif
+=20
+-    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
+-                  part->start, sizeof(struct fwu_metadata));
++static enum fwu_agent_error_t metadata_write_both_replica(
++                        struct fwu_metadata *p_metadata)
++{
++    enum fwu_agent_error_t ret =3D FWU_AGENT_ERROR;
+=20
+-    ret =3D FWU_METADATA_FLASH_DEV.EraseSector(part->start);
+-    if (ret !=3D ARM_DRIVER_OK) {
+-        return FWU_AGENT_ERROR;
++    ret =3D metadata_write(&_metadata, 1);
++    if (ret) {
++        return ret;
+     }
+=20
+-    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(part->start,
+-                                p_metadata, sizeof(struct fwu_metadata)=
);
+-    if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
+-        return FWU_AGENT_ERROR;
++    ret =3D metadata_write(&_metadata, 2);
++    if (ret) {
++        return ret;
+     }
+=20
+-    FWU_LOG_MSG("%s: success: active =3D %u, previous =3D %d\n\r", __fu=
nc__,
+-                  p_metadata->active_index, p_metadata->previous_active=
_index);
+     return FWU_AGENT_SUCCESS;
+ }
+-#endif
+=20
++enum fwu_agent_error_t fwu_metadata_check_and_correct_integrity(void)
++{
++    enum fwu_agent_error_t ret_replica_1 =3D FWU_AGENT_ERROR;
++    enum fwu_agent_error_t ret_replica_2 =3D FWU_AGENT_ERROR;
++
++    /* Check integrity of both metadata replica */
++    ret_replica_1 =3D metadata_read(&_metadata, 1);
++    ret_replica_2 =3D metadata_read(&_metadata, 2);
++
++    if (ret_replica_1 !=3D FWU_AGENT_SUCCESS && ret_replica_2 !=3D FWU_=
AGENT_SUCCESS) {
++        return FWU_AGENT_ERROR;
++    } else if (ret_replica_1 =3D=3D FWU_AGENT_SUCCESS && ret_replica_2 =
!=3D FWU_AGENT_SUCCESS) {
++        metadata_read(&_metadata, 1);
++        metadata_write(&_metadata, 2);
++    } else if (ret_replica_1 !=3D FWU_AGENT_SUCCESS && ret_replica_2 =3D=
=3D FWU_AGENT_SUCCESS) {
++        metadata_read(&_metadata, 2);
++        metadata_write(&_metadata, 1);
++    }
++
++    return FWU_AGENT_SUCCESS;
++}
+=20
+ enum fwu_agent_error_t fwu_metadata_init(void)
+ {
+@@ -619,7 +664,7 @@ enum fwu_agent_error_t fwu_metadata_provision(void)
+      * had a firmware data?. If yes, then don't initialize
+      * metadata
+      */
+-    metadata_read(&_metadata);
++    metadata_read(&_metadata, 1);
+     if(_metadata.active_index < 2 || _metadata.previous_active_index <2=
){
+     	if(_metadata.active_index ^ _metadata.previous_active_index)
+     		return FWU_AGENT_SUCCESS;
+@@ -654,13 +699,13 @@ enum fwu_agent_error_t fwu_metadata_provision(void=
)
+     _metadata.crc_32 =3D crc32((uint8_t *)&_metadata.version,
+                              sizeof(struct fwu_metadata) - sizeof(_meta=
data.crc_32));
+=20
+-    ret =3D metadata_write(&_metadata);
++    ret =3D metadata_write_both_replica(&_metadata);
+     if (ret) {
+         return ret;
+     }
+=20
+     memset(&_metadata, 0, sizeof(struct fwu_metadata));
+-    ret =3D metadata_read(&_metadata);
++    ret =3D metadata_read(&_metadata, 1);
+     if (ret) {
+         return ret;
+     }
+@@ -827,7 +872,7 @@ static enum fwu_agent_error_t flash_full_capsule(
+     metadata->crc_32 =3D crc32((uint8_t *)&metadata->version,
+                               sizeof(struct fwu_metadata) - sizeof(meta=
data->crc_32));
+=20
+-    ret =3D metadata_write(metadata);
++    ret =3D metadata_write_both_replica(metadata);
+     if (ret) {
+         return ret;
+     }
+@@ -854,7 +899,7 @@ enum fwu_agent_error_t corstone1000_fwu_flash_image(=
void)
+=20
+     Select_Write_Mode_For_Shared_Flash();
+=20
+-    if (metadata_read(&_metadata)) {
++    if (metadata_read(&_metadata, 1)) {
+         ret =3D  FWU_AGENT_ERROR;
+         goto out;
+     }
+@@ -940,7 +985,7 @@ static enum fwu_agent_error_t accept_full_capsule(
+     metadata->crc_32 =3D crc32((uint8_t *)&metadata->version,
+                               sizeof(struct fwu_metadata) - sizeof(meta=
data->crc_32));
+=20
+-    ret =3D metadata_write(metadata);
++    ret =3D metadata_write_both_replica(metadata);
+     if (ret) {
+         return ret;
+     }
+@@ -1036,7 +1081,7 @@ static enum fwu_agent_error_t fwu_select_previous(
+     metadata->crc_32 =3D crc32((uint8_t *)&metadata->version,
+                               sizeof(struct fwu_metadata) - sizeof(meta=
data->crc_32));
+=20
+-    ret =3D metadata_write(metadata);
++    ret =3D metadata_write_both_replica(metadata);
+     if (ret) {
+         return ret;
+     }
+@@ -1066,7 +1111,7 @@ void bl1_get_active_bl2_image(uint32_t *offset)
+         FWU_ASSERT(0);
+     }
+=20
+-    if (metadata_read(&_metadata)) {
++    if (metadata_read(&_metadata, 1)) {
+         FWU_ASSERT(0);
+     }
+=20
+@@ -1205,9 +1250,17 @@ enum fwu_agent_error_t corstone1000_fwu_host_ack(=
void)
+         return FWU_AGENT_ERROR;
+     }
+=20
++    /* This cannot be added to the fwu_metadata_init() because that fun=
ction is
++     * called before the logging is enabled by TF-M. */
++    ret =3D fwu_metadata_check_and_correct_integrity();
++    if (ret =3D FWU_AGENT_SUCCESS) {
++        FWU_LOG_MSG("fwu_metadata_check_and_correct_integrity failed\r\=
n");
++        return ret;
++    }
++
+     Select_Write_Mode_For_Shared_Flash();
+=20
+-    if (metadata_read(&_metadata)) {
++    if (metadata_read(&_metadata, 1)) {
+         ret =3D FWU_AGENT_ERROR;
+         goto out;
+     }
+@@ -1317,7 +1370,7 @@ void host_acknowledgement_timer_to_reset(void)
+         FWU_ASSERT(0);
+     }
+=20
+-    if (metadata_read(&_metadata)) {
++    if (metadata_read(&_metadata, 1)) {
+         FWU_ASSERT(0);
+     }
+=20
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.h b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
+index 701f205583..78e1042778 100644
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
+@@ -70,4 +70,11 @@ enum fwu_nv_counter_index_t {
+ enum fwu_agent_error_t fwu_stage_nv_counter(enum fwu_nv_counter_index_t=
 index,
+         uint32_t img_security_cnt);
+=20
++/*
++ * Check if both metadata replica is valid by calculating and comparing=
 crc32.
++ * If one of the replica is corrupted then update it with the valid rep=
lica.
++ * If both of the replicas are corrupted then the correction is not pos=
sible.
++ */
++enum fwu_agent_error_t fwu_metadata_check_and_correct_integrity(void);
++
+ #endif /* FWU_AGENT_H */
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index 5c8a71cc..925a43e1 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -38,6 +38,10 @@ SRC_URI:append:corstone1000 =3D " \
     file://0016-Platform-CS1000-Add-crypto-configs-for-ADAC.patch \
     file://0017-Platform-CS1000-Fix-platform-name-in-logs.patch \
     file://0018-Platform-corstone1000-Fix-isolation-L2-memory-protection=
.patch \
+    file://0019-Platform-CS1000-Remove-unused-BL1-files.patch \
+    file://0020-Platform-CS1000-Remove-duplicated-metadata-write.patch \
+    file://0021-Platform-CS1000-Fix-compiler-switch-in-BL1.patch \
+    file://0022-Platform-CS1000-Validate-both-metadata-replicas.patch \
     "
=20
 FILESEXTRAPATHS:prepend:corstone1000-mps3 :=3D "${THISDIR}/files/corston=
e1000/psa-adac:"
--=20
2.25.1


