Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B21DEC87FCE
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 11:54:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.33467.1753876432088370931
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 30 Jul 2025 04:53:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A16D32936;
	Wed, 30 Jul 2025 04:53:43 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.25.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B39FC3F66E;
	Wed, 30 Jul 2025 04:53:50 -0700 (PDT)
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Ali Can Ozaslan <ali.oezaslan@arm.com>,
	Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 02/13] arm-bsp/trusted-firmware-m: corstone1000: Add Bootloader Abstraction Layer (BAL) support
Date: Wed, 30 Jul 2025 12:53:16 +0100
Message-Id: <20250730115327.3671160-3-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250730115327.3671160-1-harsimransingh.tungal@arm.com>
References: <20250730115327.3671160-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 30 Jul 2025 11:54:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6639

From: Ali Can Ozaslan <ali.oezaslan@arm.com>

Introduce Bootloader Abstraction Layer (BAL) support for Corstone-1000 to
enable flexible integration of firmware update including partial capsule
update.
This change includes:
- Enable the firmware update partition for Corstone-1000 and create
  placeholder bootloader abstraction layer for Corstone-1000.
- Change the insertion logic of TFM_FWU_BOOTLOADER_LIB to select a new
  platform-specific bootloader abstraction layer.
- Use the necessary flags to use the service and resolve any linker
  issues that may arise.
- Migration of capsule update logic to a new BAL module under
  `platform/ext/target/corstone1000/bootloader/mcuboot/`.
- Implementation of BAL APIs in `tfm_mcuboot_fwu.c` as per the PSA FWU
  state machine.
- Removal of `uefi_capsule_parser.c` and `uefi_capsule_parser.h` as capsu=
le
  parsing is done in U-Boot.
- Enhancement of `uefi_fmp.c` to handle FMP metadata for multiple images.
- Update of `provisioning.c` and `security_cnt_bl2.c` to handle new BAL
  return values.
- Addition of `fwu_config.h.in` with default FWU configuration.
- Metadata layout changes to include size and image GUIDs for U-Boot
  compatibility during FWU Accept flow.

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
---
 ...m-specific-TFM_FWU_BOOTLOADER_LIB-se.patch |   73 +
 ...Platform-CS1000-Enable-FWU-partition.patch |   30 +
 ...e1000-Implement-Bootloader-Abstracti.patch | 5033 +++++++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |    3 +
 4 files changed, 5139 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0025-FWU-Make-platform-specific-TFM_FWU_BOOTLOADER_LIB-se.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0026-Platform-CS1000-Enable-FWU-partition.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0027-Platform-Corstone1000-Implement-Bootloader-Abstracti.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0025-FWU-Make-platform-specific-TFM_FWU_BOOTLOADER_LIB-se.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0025-FWU-Make-=
platform-specific-TFM_FWU_BOOTLOADER_LIB-se.patch
new file mode 100644
index 00000000..5c503141
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0025=
-FWU-Make-platform-specific-TFM_FWU_BOOTLOADER_LIB-se.patch
@@ -0,0 +1,73 @@
+From 5afc6fde140e4033c4b69450daed42c6a3dea2bc Mon Sep 17 00:00:00 2001
+From: Ali Can Ozaslan <ali.oezaslan@arm.com>
+Date: Wed, 30 Oct 2024 09:54:49 +0000
+Subject: [PATCH] FWU: Make platform specific TFM_FWU_BOOTLOADER_LIB sele=
ctable
+ to add
+
+Prepare the environment where partition firmware update can be
+enabled and platform specific bootloader configuration can be used.
+
+FWU implementation provides an abstraction for the bootloader.
+This bootloader abstraction layer is implemented for MCUBoot.
+It can be used after making changes that can handle platform
+specific behaviors. But the implementation limits it.
+
+When TFM_PARTITION_FIRMWARE_UPDATE is enabled, the configuration
+becomes invalid. Therefore, the invalid configuration is limited
+to the case where TFM_FWU_BOOTLOADER_LIB is used for MCUboot.
+This makes the configuration valid when a platform specific
+configuration is used.
+
+TFM_FWU_BOOTLOADER_LIB can only be added from a subdirectory, which
+prevents the use of platform-specific bootloader configurations.
+The logic has been changed to allow the use of platform-specific
+bootloader configurations.
+
+Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
+
+Upstream-Status: Backport [3357369d7b878b8e8ad9515f821ac2226ec7fb18]
+---
+ config/check_config.cmake                           |  2 +-
+ secure_fw/partitions/firmware_update/CMakeLists.txt | 12 ++++++++----
+ 2 files changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/config/check_config.cmake b/config/check_config.cmake
+index 1039b22f9..d1929f6da 100644
+--- a/config/check_config.cmake
++++ b/config/check_config.cmake
+@@ -63,7 +63,7 @@ tfm_invalid_config(TFM_NS_NV_COUNTER_AMOUNT GREATER 3)
+=20
+ tfm_invalid_config(NOT PLATFORM_HAS_FIRMWARE_UPDATE_SUPPORT AND TFM_PAR=
TITION_FIRMWARE_UPDATE)
+ tfm_invalid_config(TFM_PARTITION_FIRMWARE_UPDATE AND NOT TFM_PARTITION_=
PLATFORM)
+-tfm_invalid_config((MCUBOOT_UPGRADE_STRATEGY STREQUAL "DIRECT_XIP" OR M=
CUBOOT_UPGRADE_STRATEGY STREQUAL "RAM_LOAD") AND TFM_PARTITION_FIRMWARE_U=
PDATE)
++tfm_invalid_config((MCUBOOT_UPGRADE_STRATEGY STREQUAL "DIRECT_XIP" OR M=
CUBOOT_UPGRADE_STRATEGY STREQUAL "RAM_LOAD") AND TFM_PARTITION_FIRMWARE_U=
PDATE AND TFM_FWU_BOOTLOADER_LIB STREQUAL "mcuboot")
+ tfm_invalid_config(TFM_PARTITION_FIRMWARE_UPDATE AND NOT MCUBOOT_DATA_S=
HARING)
+=20
+ ####################### Protected Storage Partition ###################=
############
+diff --git a/secure_fw/partitions/firmware_update/CMakeLists.txt b/secur=
e_fw/partitions/firmware_update/CMakeLists.txt
+index b249597b9..ecb90e0f0 100644
+--- a/secure_fw/partitions/firmware_update/CMakeLists.txt
++++ b/secure_fw/partitions/firmware_update/CMakeLists.txt
+@@ -37,11 +37,15 @@ target_sources(tfm_partitions
+         ${CMAKE_BINARY_DIR}/generated/secure_fw/partitions/firmware_upd=
ate/auto_generated/load_info_tfm_firmware_update.c
+ )
+=20
+-# The bootloader specific configuration.
+-if ((NOT TFM_FWU_BOOTLOADER_LIB) OR (NOT EXISTS ${CMAKE_CURRENT_SOURCE_=
DIR}/bootloader/${TFM_FWU_BOOTLOADER_LIB}))
+-    message(FATAL_ERROR "TFM_FWU_BOOTLOADER_LIB invalid")
++# Use platform specific bootloader configuration if present.
++if ((TFM_FWU_BOOTLOADER_LIB) AND (EXISTS ${TFM_FWU_BOOTLOADER_LIB}))
++    add_subdirectory(${TFM_FWU_BOOTLOADER_LIB} ${CMAKE_CURRENT_BINARY_D=
IR}/${TFM_FWU_BOOTLOADER_LIB})
++else()
++    if ((NOT TFM_FWU_BOOTLOADER_LIB) OR (NOT EXISTS ${CMAKE_CURRENT_SOU=
RCE_DIR}/bootloader/${TFM_FWU_BOOTLOADER_LIB}))
++        message(FATAL_ERROR "TFM_FWU_BOOTLOADER_LIB invalid")
++    endif()
++    add_subdirectory(bootloader/${TFM_FWU_BOOTLOADER_LIB})
+ endif()
+-add_subdirectory(bootloader/${TFM_FWU_BOOTLOADER_LIB})
+=20
+ target_link_libraries(tfm_psa_rot_partition_fwu
+     PRIVATE
+--=20
+2.34.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0026-Platform-CS1000-Enable-FWU-partition.patch b/meta-arm-bsp/recipes=
-bsp/trusted-firmware-m/files/corstone1000/0026-Platform-CS1000-Enable-FW=
U-partition.patch
new file mode 100644
index 00000000..c6b97733
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0026=
-Platform-CS1000-Enable-FWU-partition.patch
@@ -0,0 +1,30 @@
+From 1f8eb5887f3de167ac68c92b5b77efc51308603c Mon Sep 17 00:00:00 2001
+From: Ali Can Ozaslan <ali.oezaslan@arm.com>
+Date: Tue, 15 Oct 2024 12:50:16 +0000
+Subject: [PATCH] Platform: Corstone1000: Enable FWU partition
+
+Enable firmware update partition for Corstone-1000 platform.
+
+Increase the necessary flags to enable firmware update partition.
+Set TFM_FWU_BOOTLOADER_LIB to use Corstone-1000 specific bootloader
+configuration. Fix linker issues caused by enablement.
+
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/39515]
+Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
+
+---
+diff --git a/platform/ext/target/arm/corstone1000/config.cmake b/platfor=
m/ext/target/arm/corstone1000/config.cmake
+index 6a805a122..1ba43a006 100644
+--- a/platform/ext/target/arm/corstone1000/config.cmake
++++ b/platform/ext/target/arm/corstone1000/config.cmake
+@@ -56,6 +56,10 @@ set(TFM_PARTITION_CRYPTO                ON          C=
ACHE BOOL      "Enable Cryp
+ set(TFM_PARTITION_INITIAL_ATTESTATION   ON          CACHE BOOL      "En=
able Initial Attestation partition")
+ set(TFM_PARTITION_INTERNAL_TRUSTED_STORAGE ON       CACHE BOOL      "En=
able Internal Trusted Storage partition")
+=20
++set(TFM_PARTITION_FIRMWARE_UPDATE         ON        CACHE BOOL      "En=
able firmware update partition")
++set(PLATFORM_HAS_FIRMWARE_UPDATE_SUPPORT ON         CACHE BOOL      "Wh=
eter the platform has firmware update support")
++set(MCUBOOT_DATA_SHARING                 ON         CACHE BOOL      "En=
able Data Sharing")
++set(TFM_FWU_BOOTLOADER_LIB                "${CMAKE_CURRENT_LIST_DIR}/bo=
otloader/mcuboot"   CACHE STRING    "Bootloader configure file for Firmwa=
re Update partition")
+=20
+ if (${CMAKE_BUILD_TYPE} STREQUAL Debug OR ${CMAKE_BUILD_TYPE} STREQUAL =
RelWithDebInfo)
+   set(ENABLE_FWU_AGENT_DEBUG_LOGS     TRUE          CACHE BOOL      "En=
able Firmware update agent debug logs.")
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0027-Platform-Corstone1000-Implement-Bootloader-Abstracti.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0027-Platform-=
Corstone1000-Implement-Bootloader-Abstracti.patch
new file mode 100644
index 00000000..da275a19
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0027=
-Platform-Corstone1000-Implement-Bootloader-Abstracti.patch
@@ -0,0 +1,5033 @@
+From 929ac4fdf22bdc84f7363be3f9604c586800e2c1 Mon Sep 17 00:00:00 2001
+From: Ali Can Ozaslan <ali.oezaslan@arm.com>
+Date: Tue, 15 Oct 2024 12:50:16 +0000
+Subject: [PATCH 5/6] Platform: Corstone1000: Implement Bootloader Abstra=
ction
+ Layer
+
+This commit introduces the Bootloader Abstraction Layer (BAL) for
+Corstone-1000. The following changes are made:
+
+1. Move the previous Capsule Update implementation for Corstone-1000
+from  "fwu_update_agent/" to "bootloader/mcuboot/". This serves as
+the placeholder for the Bootloader Abstraction Layer (BAL).
+
+2. Move content of "fwu_agent.c" to "tfm_mcuboot_fwu.c". This source
+file is the actual implementation of bootloader abstraction layer.
+Adapt the previous Capsule Update implementation in
+"tfm_mcuboot_fwu.c "to align with the PSA Firmware Update (FWU)
+state machine.
+
+3. Remove "uefi_capsule_parser.c" and "uefi_capsule_parser.h".
+The UEFI capsule header parsing is now done in U-Boot.
+
+4. Modify "uefi_fmp.c" to support modification of FMP information
+for multiple images. In the previous capsule update implementation,
+this file only supports updates FMP information for single
+Corstone-1000 image.
+
+5. New functions for capsule update implementation in bootloader
+abstraction layer supports different return values. Update checks of
+return values in "provisioning.c" and "security_cnt_bl2.c", as these
+files use functions defined in bootloader abstraction layer.
+
+6. Update "config.cmake" and "CMakeLists.txt" to support compilation
+and configuration of bootloader abstraction layer for Corstone-1000.
+
+7. Create FWU configuration file "fwu_config.h.in" for Corstone-1000
+with default configuration values.
+
+8. FWU implementation in U-Boot expects to have metadata size field
+updated in metadata. Store the metadata size in metadata, so U-Boot
+can use it.
+
+9. Update metadata for FWU accept. Store image GUIDs and bank state
+in metadata. This is used by the U-Boot to decide the trial state
+and accept the images based on GUIDs.
+
+10. Add rollback version check. Bootloader abstraction layer refuses
+to update the lower version firmware than the current version.
+
+11. Add support for FVP and MPS3 image GUID's.
+
+12. Add support for EFI ESRT v1 and code refactoring
+
+Add support to configure the ESRT entries during
+tfm_fwu_query() function call. The ESRT image component
+is defined to represent the ESRT image. The tfm_fwu_query()
+function returns the ESRT data requested by FWU client in
+the psa_fwu_impl_info_t structure object.
+The psa_fwu_impl_info_t structure object is used to store
+the ESRT entries for all the images. This structure object
+is declared in psa_fwu_component_info_t structure which
+stores all the data requested by update client via
+tfm_fwu_query().
+
+For Corstone-1000, the TFM_FWU_MAX_DIGEST_SIZE represents
+the maximum size needed to store the ESRT entries for all
+the images in a bank.
+ESRT details can be found here:
+https://uefi.org/specs/UEFI/2.9_A/23_Firmware_Update_and_Reporting.html#=
efi-system-resource-table
+
+13. Define max payload size and enable trial state
+
+14. Implement Partial Capsule Update Support
+Introduces support for partial capsule updates
+with the following changes:
+-> Copy unchanged images from the other bank to the updated
+   bank to ensure consistency across banks.
+-> Add image offsets and sizes for each payload to facilitate
+   accurate image management during updates.
+
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/39516/1]
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
+---
+ .../target/arm/corstone1000/CMakeLists.txt    |   36 +-
+ .../arm/corstone1000/bl1/provisioning.c       |    4 +-
+ .../arm/corstone1000/bl2/security_cnt_bl2.c   |    6 +-
+ .../arm/corstone1000/bootloader/fwu_agent.h   |  123 +
+ .../corstone1000/bootloader/fwu_config.h.in   |   58 +
+ .../bootloader/mcuboot/CMakeLists.txt         |   52 +
+ .../bootloader/mcuboot/tfm_mcuboot_fwu.c      | 2345 +++++++++++++++++
+ .../mcuboot}/uefi_fmp.c                       |  111 +-
+ .../tfm_bootloader_fwu_abstraction.h          |  189 ++
+ .../uefi_fmp.h                                |    7 +-
+ .../ext/target/arm/corstone1000/config.cmake  |    5 +-
+ .../corstone1000/fw_update_agent/fwu_agent.c  | 1350 ----------
+ .../corstone1000/fw_update_agent/fwu_agent.h  |   73 -
+ .../fw_update_agent/uefi_capsule_parser.c     |  175 --
+ .../fw_update_agent/uefi_capsule_parser.h     |   33 -
+ .../arm/corstone1000/partition/flash_layout.h |   14 +-
+ 16 files changed, 2882 insertions(+), 1699 deletions(-)
+ create mode 100644 platform/ext/target/arm/corstone1000/bootloader/fwu_=
agent.h
+ create mode 100644 platform/ext/target/arm/corstone1000/bootloader/fwu_=
config.h.in
+ create mode 100644 platform/ext/target/arm/corstone1000/bootloader/mcub=
oot/CMakeLists.txt
+ create mode 100644 platform/ext/target/arm/corstone1000/bootloader/mcub=
oot/tfm_mcuboot_fwu.c
+ rename platform/ext/target/arm/corstone1000/{fw_update_agent =3D> bootl=
oader/mcuboot}/uefi_fmp.c (66%)
+ create mode 100644 platform/ext/target/arm/corstone1000/bootloader/tfm_=
bootloader_fwu_abstraction.h
+ rename platform/ext/target/arm/corstone1000/{fw_update_agent =3D> bootl=
oader}/uefi_fmp.h (89%)
+ delete mode 100644 platform/ext/target/arm/corstone1000/fw_update_agent=
/fwu_agent.c
+ delete mode 100644 platform/ext/target/arm/corstone1000/fw_update_agent=
/fwu_agent.h
+ delete mode 100644 platform/ext/target/arm/corstone1000/fw_update_agent=
/uefi_capsule_parser.c
+ delete mode 100644 platform/ext/target/arm/corstone1000/fw_update_agent=
/uefi_capsule_parser.h
+
+diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platf=
orm/ext/target/arm/corstone1000/CMakeLists.txt
+index 3323cb8ce..e49dca49c 100644
+--- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
++++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ #----------------------------------------------------------------------=
---------
+-# Copyright (c) 2020-2024, Arm Limited. All rights reserved.
++# Copyright (c) 2020-2025, Arm Limited. All rights reserved.
+ # Copyright (c) 2022 Cypress Semiconductor Corporation (an Infineon com=
pany)
+ # or an affiliate of Cypress Semiconductor Corporation. All rights rese=
rved.
+ #
+@@ -115,7 +115,7 @@ target_include_directories(platform_s
+         ${PLATFORM_DIR}/ext/target/arm/drivers/usart/pl011
+     INTERFACE
+         cc312
+-        fw_update_agent
++        bootloader
+         soft_crc
+         io
+         partition
+@@ -133,9 +133,8 @@ target_sources(platform_s
+         Native_Driver/watchdog.c
+         Native_Driver/arm_watchdog_drv.c
+         $<$<BOOL:TFM_PARTITION_PLATFORM>:${CMAKE_CURRENT_SOURCE_DIR}/se=
rvices/src/tfm_platform_system.c>
+-        fw_update_agent/uefi_capsule_parser.c
+-        fw_update_agent/fwu_agent.c
+-        fw_update_agent/uefi_fmp.c
++	bootloader/mcuboot/tfm_mcuboot_fwu.c
++	bootloader/mcuboot/uefi_fmp.c
+         soft_crc/soft_crc.c
+         io/io_block.c
+         io/io_flash.c
+@@ -201,9 +200,8 @@ target_sources(platform_bl1_1
+         ./Native_Driver/watchdog.c
+         ./bl1/boot_hal_bl1_1.c
+         ./bl1/provisioning.c
+-        ./fw_update_agent/fwu_agent.c
+-        ./fw_update_agent/uefi_capsule_parser.c
+-        ./fw_update_agent/uefi_fmp.c
++	./bootloader/mcuboot/tfm_mcuboot_fwu.c
++	./bootloader/mcuboot/uefi_fmp.c
+         ./soft_crc/soft_crc.c
+         $<$<NOT:$<BOOL:${PLATFORM_DEFAULT_OTP}>>:${PLATFORM_DIR}/ext/ac=
celerator/cc312/otp_cc312.c>
+         $<$<NOT:$<BOOL:${TFM_BL1_SOFTWARE_CRYPTO}>>:${CMAKE_CURRENT_SOU=
RCE_DIR}/bl1/cc312_rom_crypto.c>
+@@ -233,7 +231,7 @@ target_include_directories(platform_bl1_1_interface
+         ./Device/Config
+         ./Native_Driver
+         ./CMSIS_Driver/Config
+-        ./fw_update_agent
++        ./bootloader
+         ./soft_crc
+         ${PLATFORM_DIR}/ext/target/arm/drivers/flash/cfi
+         ${PLATFORM_DIR}/ext/target/arm/drivers/flash/common
+@@ -245,6 +243,7 @@ target_include_directories(platform_bl1_1_interface
+         ${PLATFORM_DIR}/ext/target/arm/drivers/usart/pl011
+         $<$<BOOL:${CRYPTO_HW_ACCELERATOR}>:${CMAKE_SOURCE_DIR}/platform=
/ext/accelerator/interface>
+         ${PLATFORM_DIR}/ext/accelerator/cc312/
++        ${CMAKE_SOURCE_DIR}/lib/fih/inc/
+ )
+=20
+ target_link_libraries(platform_bl1_1
+@@ -252,6 +251,11 @@ target_link_libraries(platform_bl1_1
+         $<$<NOT:$<BOOL:${TFM_BL1_SOFTWARE_CRYPTO}>>:cc312_rom>
+ )
+=20
++target_include_directories(platform_bl1_1
++    PRIVATE
++    ${CMAKE_SOURCE_DIR}/interface/include # for psa/error.h
++)
++
+ target_sources(platform_bl1_2
+     PRIVATE
+         ./bl1/boot_hal_bl1_2.c
+@@ -276,7 +280,7 @@ target_include_directories(platform_bl1_2
+         ./Device/Config
+         ./Native_Driver
+         ./CMSIS_Driver/Config
+-        ./fw_update_agent
++        ./bootloader
+         ./soft_crc
+         ${PLATFORM_DIR}/ext/target/arm/drivers/flash/common
+         ${PLATFORM_DIR}/ext/target/arm/drivers/flash/cfi
+@@ -285,6 +289,7 @@ target_include_directories(platform_bl1_2
+         ${PLATFORM_DIR}/ext/target/arm/drivers/flash/n25q256a/
+         ${PLATFORM_DIR}/ext/target/arm/drivers/flash/sst26vf064b/
+         ${PLATFORM_DIR}/ext/accelerator/cc312/
++	${CMAKE_SOURCE_DIR}/interface/include # for psa/error.h
+ )
+=20
+ #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D Platform BL2 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D#
+@@ -301,7 +306,7 @@ target_sources(platform_bl2
+         Native_Driver/watchdog.c
+         Native_Driver/arm_watchdog_drv.c
+         fip_parser/fip_parser.c
+-        fw_update_agent/fwu_agent.c
++	bootloader/mcuboot/tfm_mcuboot_fwu.c
+         bl2/security_cnt_bl2.c
+         $<$<NOT:$<BOOL:${PLATFORM_DEFAULT_OTP}>>:${PLATFORM_DIR}/ext/ac=
celerator/cc312/otp_cc312.c>
+         io/io_block.c
+@@ -358,6 +363,12 @@ target_compile_definitions(bl2
+         $<$<BOOL:${CRYPTO_HW_ACCELERATOR_OTP_PROVISIONING}>:CRYPTO_HW_A=
CCELERATOR_OTP_PROVISIONING>
+         $<$<BOOL:${PLATFORM_PSA_ADAC_SECURE_DEBUG}>:PLATFORM_PSA_ADAC_S=
ECURE_DEBUG>
+ )
++
++target_include_directories(bl2
++    PRIVATE
++	${CMAKE_SOURCE_DIR}/interface/include # for psa/error.h
++)
++
+ target_compile_definitions(bootutil
+     PRIVATE
+         MULTIPLE_EXECUTABLE_RAM_REGIONS
+@@ -369,7 +380,7 @@ target_include_directories(platform_bl2
+         Device/Include
+         fip_parser
+         Native_Driver
+-        fw_update_agent
++        bootloader
+         soft_crc
+         io
+         ${PLATFORM_DIR}/ext/target/arm/drivers/flash/common
+@@ -388,6 +399,7 @@ target_include_directories(platform_bl2
+         ${MCUBOOT_PATH}/boot/bootutil/include # for fault_injection_har=
dening.h only
+         ${CMAKE_BINARY_DIR}/bl2/ext/mcuboot # for mcuboot_config.h only
+         $<BUILD_INTERFACE:${BL2_SOURCE}/ext/mcuboot/include>
++	${CMAKE_SOURCE_DIR}/interface/include # for psa/error.h
+ )
+=20
+ #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D ns_agent_mailbox =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D#
+diff --git a/platform/ext/target/arm/corstone1000/bl1/provisioning.c b/p=
latform/ext/target/arm/corstone1000/bl1/provisioning.c
+index cc42bc0a1..1afa9d542 100644
+--- a/platform/ext/target/arm/corstone1000/bl1/provisioning.c
++++ b/platform/ext/target/arm/corstone1000/bl1/provisioning.c
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2021-2023, Arm Limited. All rights reserved.
++ * Copyright (c) 2021-2023, 2025, Arm Limited. All rights reserved.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  *
+@@ -100,7 +100,7 @@ enum tfm_plat_err_t provision_assembly_and_test(void=
)
+     }
+=20
+     err =3D fwu_metadata_provision();
+-    if (err !=3D FWU_AGENT_SUCCESS) {
++    if (err !=3D PSA_SUCCESS) {
+         return 1;
+     }
+=20
+diff --git a/platform/ext/target/arm/corstone1000/bl2/security_cnt_bl2.c=
 b/platform/ext/target/arm/corstone1000/bl2/security_cnt_bl2.c
+index da9f74e1c..c74c67d89 100644
+--- a/platform/ext/target/arm/corstone1000/bl2/security_cnt_bl2.c
++++ b/platform/ext/target/arm/corstone1000/bl2/security_cnt_bl2.c
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2019-2021, Arm Limited. All rights reserved.
++ * Copyright (c) 2019-2021, 2025, Arm Limited. All rights reserved.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  *
+@@ -76,7 +76,7 @@ int32_t boot_nv_security_counter_update(uint32_t image=
_id,
+ {
+     enum tfm_nv_counter_t nv_counter;
+     enum tfm_plat_err_t err;
+-    enum fwu_agent_error_t fwu_err;
++    psa_status_t fwu_err;
+=20
+     nv_counter =3D get_nv_counter_from_image_id(image_id);
+     if (nv_counter >=3D TFM_BOOT_NV_COUNTER_MAX) {
+@@ -100,7 +100,7 @@ int32_t boot_nv_security_counter_update(uint32_t ima=
ge_id,
+             return -1;
+         }
+=20
+-        if (fwu_err !=3D FWU_AGENT_SUCCESS) {
++        if (fwu_err !=3D PSA_SUCCESS) {
+             return -1;
+         }
+=20
+diff --git a/platform/ext/target/arm/corstone1000/bootloader/fwu_agent.h=
 b/platform/ext/target/arm/corstone1000/bootloader/fwu_agent.h
+new file mode 100644
+index 000000000..6b3a38b64
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/bootloader/fwu_agent.h
+@@ -0,0 +1,123 @@
++/*
++ * Copyright (c) 2021-2023, 2025, Arm Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#ifndef FWU_AGENT_H
++#define FWU_AGENT_H
++
++#include "psa/error.h"
++#include "../fip_parser/external/uuid.h"
++
++#define ENABLE_FWU_AGENT_DEBUG_LOGS
++#ifdef ENABLE_FWU_AGENT_DEBUG_LOGS
++    #include <stdio.h>
++    #define FWU_LOG_MSG(f_, ...) printf((f_), ##__VA_ARGS__)
++#else
++    #define FWU_LOG_MSG(f_, ...)
++#endif
++
++#define FWU_ASSERT(_c_)                                                =
        \
++                if (!(_c_)) {                                          =
        \
++                    FWU_LOG_MSG("%s:%d assert hit\n\r", __func__, __LIN=
E__);   \
++                    while(1) {};                                       =
        \
++                }                                                      =
        \
++
++
++/* Version used for the very first image of the device. */
++#define FWU_IMAGE_INITIAL_VERSION 0
++
++#define EFI_SYSTEM_RESOURCE_TABLE_FIRMWARE_RESOURCE_VERSION  1
++typedef struct {
++    uint32_t                signature;
++    uint32_t                header_size;
++    uint32_t                fw_version;
++    uint32_t                lowest_supported_version;
++} __packed fmp_payload_header_t;
++
++typedef struct {
++    fmp_payload_header_t fmp_hdr;
++    size_t fmp_hdr_size_recvd;
++    size_t image_size_recvd;
++} __packed fmp_header_image_info_t;
++
++/* Store image information common for both the banks */
++typedef struct {
++    /* Total size of the image */
++    uint32_t image_size;
++
++    /* Offset of image within a bank */
++    uint32_t image_offset;
++
++    /* Image GUID */
++    struct efi_guid image_guid;
++} __packed fwu_bank_image_info_t;
++
++/* ESRT v1 */
++struct __attribute__((__packed__)) efi_system_resource_entry {
++	struct efi_guid fw_class;
++	uint32_t fw_type;
++	uint32_t fw_version;
++	uint32_t lowest_supported_fw_version;
++	uint32_t capsule_flags;
++	uint32_t last_attempt_version;
++	uint32_t last_attempt_status;
++};
++
++struct __attribute__((__packed__)) efi_system_resource_table {
++	uint32_t fw_resource_count;
++	uint32_t fw_resource_count_max;
++	uint64_t fw_resource_version;
++	struct efi_system_resource_entry entries[];
++};
++
++psa_status_t fwu_metadata_provision(void);
++psa_status_t fwu_metadata_init(void);
++
++/* host to secure enclave:
++ * firwmare update image is sent accross
++ */
++psa_status_t corstone1000_fwu_flash_image(void);
++
++/* host to secure enclave:
++ * host responds with this api to acknowledge its successful
++ * boot.
++ */
++psa_status_t corstone1000_fwu_host_ack(void);
++
++void bl1_get_active_bl2_image(uint32_t *bank_offset);
++uint8_t bl2_get_boot_bank(void);
++
++/* When in trial state, start the timer for host to respond.
++ * Diable timer when host responds back either by calling
++ * corstone1000_fwu_accept_image or corstone1000_fwu_select_previous.
++ * Otherwise, resets the system.
++ */
++void host_acknowledgement_timer_to_reset(void);
++
++enum fwu_nv_counter_index_t {
++    FWU_BL2_NV_COUNTER =3D 0,
++    FWU_TFM_NV_COUNTER,
++    FWU_TFA_NV_COUNTER,
++    FWU_MAX_NV_COUNTER_INDEX =3D FWU_TFA_NV_COUNTER
++};
++
++/* stage nv counter into private metadata section of the flash.
++ * staged nv counters are written to the otp when firmware update
++ * is successful
++ * the function assumes that the api is called in the boot loading
++ * stage
++ */
++psa_status_t fwu_stage_nv_counter(enum fwu_nv_counter_index_t index,
++        uint32_t img_security_cnt);
++
++/*
++ * Check if both metadata replica is valid by calculating and comparing=
 crc32.
++ * If one of the replica is corrupted then update it with the valid rep=
lica.
++ * If both of the replicas are corrupted then the correction is not pos=
sible.
++ */
++psa_status_t fwu_metadata_check_and_correct_integrity(void);
++
++#endif /* FWU_AGENT_H */
+diff --git a/platform/ext/target/arm/corstone1000/bootloader/fwu_config.=
h.in b/platform/ext/target/arm/corstone1000/bootloader/fwu_config.h.in
+new file mode 100644
+index 000000000..79e310e29
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/bootloader/fwu_config.h.in
+@@ -0,0 +1,58 @@
++/*
++ * Copyright (c) 2025, Arm Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#ifndef __FWU_CONFIG_H__
++#define __FWU_CONFIG_H__
++
++/* This file contains device specific configurations in FWU partition b=
ased
++ * on MCUboot.
++ */
++
++/* Components of the device. When porting a specific bootloader to FWU =
partition,
++ * the bootloader specific image types can be defined here.
++ */
++#define FWU_COMPONENT_NUMBER              6
++
++/* Maximum number of FWU Images
++ * FWU_COMPONENT_NUMBER takes into account the fact our image index is =
starting from 1 and also we have an ESRT image
++ */
++#define FWU_IMAGE_COUNT                   (FWU_COMPONENT_NUMBER - 2)
++
++/* sizeof(struct efi_system_resource_entry)
++ * Size of one ESRT v1 Image entry structure object
++ */
++#define ESRT_IMAGE_ENTRY_SIZE             40
++
++/* sizeof(struct efi_system_resource_table) - sizeof(struct efi_system_=
resource_entry)
++ * Size of remaining fields of ESRT v1 t
++ */
++#define ESRT_REMAINING_FIELDS_SIZE        16
++
++#if FWU_COMPONENT_NUMBER > 1
++#define FWU_COMPONENT_ID_SECURE           0x00U
++#define FWU_COMPONENT_ID_NONSECURE        0x01U
++#else
++#define FWU_COMPONENT_ID_FULL             0x00U
++#endif
++
++/* The maximum size of an image digest in bytes. This is dependent
++ * on the hash algorithm used.
++ */
++#define TFM_FWU_MAX_DIGEST_SIZE              ((FWU_IMAGE_COUNT * ESRT_I=
MAGE_ENTRY_SIZE) + ESRT_REMAINING_FIELDS_SIZE)
++
++/* The maximum permitted size for block in psa_fwu_write(), in bytes. *=
/
++#define TFM_CONFIG_FWU_MAX_WRITE_SIZE   @TFM_CONFIG_FWU_MAX_WRITE_SIZE@
++
++/* The maximum permitted size for manifest in psa_fwu_start(), in bytes=
. */
++#define TFM_CONFIG_FWU_MAX_MANIFEST_SIZE   @TFM_CONFIG_FWU_MAX_MANIFEST=
_SIZE@
++
++/* Whether TRIAL component state is supported or not. This is device sp=
ecific
++ * configuration.
++ */
++#cmakedefine FWU_SUPPORT_TRIAL_STATE
++
++#endif /* __FWU_CONFIG_H__ */
+diff --git a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/CMa=
keLists.txt b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/CMa=
keLists.txt
+new file mode 100644
+index 000000000..7d57a57c7
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/CMakeLists=
.txt
+@@ -0,0 +1,52 @@
++#----------------------------------------------------------------------=
---------
++# Copyright (c) 2021-2022, 2025, Arm Limited. All rights reserved.
++#
++# SPDX-License-Identifier: BSD-3-Clause
++#
++#----------------------------------------------------------------------=
---------
++cmake_minimum_required(VERSION 3.21)
++
++add_library(tfm_fwu_mcuboot_util INTERFACE)
++
++target_sources(tfm_fwu_mcuboot_util
++    INTERFACE
++        ${MCUBOOT_PATH}/boot/bootutil/src/bootutil_public.c
++        ${MCUBOOT_PATH}/boot/bootutil/src/tlv.c
++        ${CMAKE_SOURCE_DIR}/bl2/src/flash_map.c
++        ${CMAKE_SOURCE_DIR}/bl2/ext/mcuboot/flash_map_extended.c
++        ./tfm_mcuboot_fwu.c
++	./uefi_fmp.c
++        $<$<BOOL:${DEFAULT_MCUBOOT_FLASH_MAP}>:${CMAKE_SOURCE_DIR}/bl2/=
src/default_flash_map.c>
++)
++
++target_include_directories(tfm_fwu_mcuboot_util
++    INTERFACE
++        ${CMAKE_BINARY_DIR}/bl2/ext/mcuboot
++        ${CMAKE_SOURCE_DIR}/bl2/ext/mcuboot/include
++        ${MCUBOOT_PATH}/boot/bootutil/include
++        ${MCUBOOT_PATH}/boot/bootutil/src
++        ${CMAKE_CURRENT_SOURCE_DIR}/../
++        ${MBEDCRYPTO_PATH}/include
++)
++
++target_link_libraries(tfm_fwu_mcuboot_util
++    INTERFACE
++        platform_region_defs
++)
++
++target_link_libraries(tfm_psa_rot_partition_fwu
++    PRIVATE
++        tfm_fwu_mcuboot_util
++)
++
++configure_file(${CMAKE_SOURCE_DIR}/platform/ext/target/arm/corstone1000=
/bootloader/fwu_config.h.in
++               ${CMAKE_BINARY_DIR}/platform/ext/target/arm/corstone1000=
/bootloader/fwu_config.h
++               @ONLY)
++set(FWU_DEVICE_CONFIG_FILE "${CMAKE_BINARY_DIR}/platform/ext/target/arm=
/corstone1000/bootloader/fwu_config.h")
++
++target_compile_definitions(tfm_psa_rot_partition_fwu
++    PRIVATE
++        MCUBOOT_${MCUBOOT_UPGRADE_STRATEGY}
++        $<$<BOOL:${MCUBOOT_DIRECT_XIP_REVERT}>:MCUBOOT_DIRECT_XIP_REVER=
T>
++	FWU_DEVICE_CONFIG_FILE=3D"${FWU_DEVICE_CONFIG_FILE}"
++)
+diff --git a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm=
_mcuboot_fwu.c b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/=
tfm_mcuboot_fwu.c
+new file mode 100644
+index 000000000..32fe44516
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm_mcuboo=
t_fwu.c
+@@ -0,0 +1,2345 @@
++/*
++ * Copyright (c) 2021-2025, Arm Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++#include <string.h>
++#include "psa/crypto.h"
++#include "psa/error.h"
++#include "tfm_bootloader_fwu_abstraction.h"
++
++#include <stdint.h>
++#include <string.h>
++#include "fwu_agent.h"
++#include "Driver_Flash.h"
++#include "flash_layout.h"
++#include "fip_parser/external/uuid.h"
++#include "region_defs.h"
++#include "flash_common.h"
++#include "platform_base_address.h"
++#include "platform_description.h"
++#include "tfm_plat_nv_counters.h"
++#include "tfm_plat_defs.h"
++#include "uefi_fmp.h"
++#include "uart_stdout.h"
++#include "soft_crc.h"
++#ifndef BL1_BUILD
++#include "partition.h"
++#include "platform.h"
++#endif
++
++#define FWU_METADATA_VERSION		2
++#define FWU_FW_STORE_DESC_OFFSET	0x20
++#define NR_OF_MAX_FW_BANKS		4
++
++/* Size of a chunk transferred at once from one bank to another
++ * This is used when bank consistency is maintained during partial caps=
ule update
++ */
++#define FLASH_CHUNK_SIZE                512
++
++/* Possible states of the bank.
++ * Naming convention here matches the implementation in U-Boot=20
++ */
++#define FWU_BANK_INVALID	(uint8_t)0xFF
++#define FWU_BANK_VALID		(uint8_t)0xFE
++#define FWU_BANK_ACCEPTED	(uint8_t)0xFC
++
++/* The component number for the ESRT image.
++ * The ESRT image is used to read ESRT entries for all the images in a =
bank
++ */
++#define FWU_IMAGE_INDEX_ESRT         FWU_COMPONENT_NUMBER - 1
++
++/* Index count for fake images to be ignored
++ * The image index for firmware images in capsule starts from 1.
++ * So, the image at index 0 should be ignored */
++#define FWU_FAKE_IMAGES_INDEX_COUNT    1
++#define FWU_FAKE_IMAGE_INDEX           0
++
++/*
++ * Metadata version 2 data structures defined by PSA_FW update specific=
ation
++ * at https://developer.arm.com/documentation/den0118/latest/
++ */
++
++/* Properties of image in a bank */
++struct fwu_image_properties {
++
++        /* The UUID of the image in this bank */
++        uuid_t img_uuid;
++
++        /* [0]: bit describing the image acceptance status =E2=80=93
++         * status - 1 means the image is accepted
++         * [31:1]: MBZ
++         */
++        uint32_t accepted;
++
++        /* NOTE: using the reserved field */
++        /* image version */
++        uint32_t version;
++
++} __packed;
++
++/* Image entry information */
++struct fwu_image_entry {
++
++        /* The UUID identifying the image type */
++        uuid_t img_type_uuid;
++
++        /* The UUID of the storage volume where the image is located */
++        uuid_t location_uuid;
++
++        /* The Properties of images with img_type_uuid in the different=
 FW banks */
++        struct fwu_image_properties img_props[NR_OF_FW_BANKS];
++
++} __packed;
++
++struct fwu_fw_store_descriptor {
++
++       /* The number of firmware banks in the Firmware Store */
++       uint8_t num_banks;
++
++       /* Reserved */
++       uint8_t reserved;
++
++       /* The number of images per bank. This should be the number of e=
ntries in the img_entry array */
++       uint16_t num_images;
++
++       /* The size of image_entry(all banks) in bytes */
++       uint16_t img_entry_size;
++
++       /* The size of image bank info structure in bytes */
++       uint16_t bank_info_entry_size;
++
++       /* Array of fwu_image_entry structs */
++       struct fwu_image_entry img_entry[NR_OF_IMAGES_IN_FW_BANK];
++
++} __packed;
++
++struct fwu_metadata {
++
++        /* The metadata CRC value */
++        uint32_t crc_32;
++
++        /* The metadata version */
++        uint32_t version;
++
++        /* The bank index with which device boots */
++        uint32_t active_index;
++
++        /* The previous bank index with which device booted successfull=
y */
++        uint32_t previous_active_index;
++
++        /* The size of the entire metadata in bytes */
++        uint32_t metadata_size;
++
++        /* The offset of the image descriptor structure */
++        uint16_t desc_offset;
++
++        /* Reserved */
++        uint16_t reserved1;
++
++        /* The state of each bank=20
++         * Each bank_state entry can take one of the following values:
++         *  =E2=80=A2 0xFF: invalid =E2=80=93 One or more images in the=
 bank are corrupted or were partially overwritten.
++         *  =E2=80=A2 0xFE: valid =E2=80=93 The bank contains a valid s=
et of images, but some images are in an unaccepted state.
++         *  =E2=80=A2 0xFC: accepted =E2=80=93 all of the images in the=
 bank are valid and have been accepted.
++        */
++        uint8_t bank_state[NR_OF_MAX_FW_BANKS];
++
++        /* Reserved */
++        uint32_t reserved2;
++
++        struct fwu_fw_store_descriptor fw_desc;
++
++} __packed;
++
++/* This is Corstone1000 speific metadata for OTA.
++ * Private metadata is written at next sector following
++ * FWU METADATA location */
++struct fwu_private_metadata {
++
++       /* The bank from which system is booted from */
++       uint32_t boot_index;
++
++       /* The tracking number of boot attempted so far */
++       uint32_t boot_attempted;
++
++       /* The temprary location of staged nv_counter before written to =
the otp */
++       uint32_t nv_counter[NR_OF_IMAGES_IN_FW_BANK];
++
++       /* The current FMP version of each image */
++       uint32_t fmp_version[NR_OF_IMAGES_IN_FW_BANK];
++
++       /* The last attempted FMP version of each image */
++       uint32_t fmp_last_attempt_version[NR_OF_IMAGES_IN_FW_BANK];
++
++       /* The last attempted FMP status of each image */
++       uint32_t fmp_last_attempt_status[NR_OF_IMAGES_IN_FW_BANK];
++
++} __packed;
++
++/*
++ * struct fwu_esrt_data_wrapper - Wrapper for the ESRT data
++ * @data: The ESRT data
++ * @entries: The ESRT image entries
++ */
++struct __attribute__((__packed__)) fwu_esrt_data_wrapper {
++        /* The ESRT data */
++        struct efi_system_resource_table  data;
++
++        /* The ESRT image entries */
++        struct efi_system_resource_entry entries[NR_OF_IMAGES_IN_FW_BAN=
K];
++};
++
++#define MAX_BOOT_ATTEMPTS_PER_BANK 3
++
++/*
++ * GUIDs for capsule updatable firmware images
++ *
++ * The GUIDs are generating with the UUIDv5 format.
++ * Namespace used for FVP GUIDs: 989f3a4e-46e0-4cd0-9877-a25c70c01329
++ * Namespace used for MPS3 GUIDs: df1865d1-90fb-4d59-9c38-c9f2c1bba8cc
++ * Names: the image names stated in the fw_name field
++ */
++fwu_bank_image_info_t fwu_image[NR_OF_IMAGES_IN_FW_BANK] =3D {
++#if PLATFORM_IS_FVP
++    // FVP payloads GUIDs
++    // bl2_signed
++    {
++        .image_size =3D SE_BL2_PARTITION_SIZE,
++        .image_offset =3D SE_BL2_PARTITION_BANK_OFFSET,
++        .image_guid =3D {
++            .time_low =3D 0xf1d883f9,
++            .time_mid =3D 0xdfeb,
++            .time_hi_and_version =3D 0x5363,
++            .clock_seq_and_node =3D {0x98, 0xd8, 0x68, 0x6e, 0xe3, 0xb6=
, 0x9f, 0x4f}
++        },
++    },
++    // tfm_s_signed
++    {
++        .image_size =3D TFM_PARTITION_SIZE,
++        .image_offset =3D TFM_PARTITION_BANK_OFFSET,
++        .image_guid =3D {
++            .time_low =3D 0x7fad470e,
++            .time_mid =3D 0x5ec5,
++            .time_hi_and_version =3D 0x5c03,
++            .clock_seq_and_node =3D {0xa2, 0xc1, 0x47, 0x56, 0xb4, 0x95=
, 0xde, 0x61}
++        },
++    },
++    // signed_fip-corstone1000
++    {
++        .image_size =3D FIP_PARTITION_SIZE,
++        .image_offset =3D FIP_PARTITION_BANK_OFFSET,
++        .image_guid =3D {
++            .time_low =3D 0xf1933675,
++            .time_mid =3D 0x5a8c,
++            .time_hi_and_version =3D 0x5b6d,
++            .clock_seq_and_node =3D {0x9e, 0xf4, 0x84, 0x67, 0x39, 0xe8=
, 0x9b, 0xc8}
++        },
++    },
++    // Image.gz-initramfs-corstone1000-fvp
++    {
++        .image_size =3D INITRAMFS_PARTITION_SIZE,
++        .image_offset =3D INITRAMFS_PARTITION_BANK_OFFSET,
++        .image_guid =3D {
++            .time_low =3D 0xf771aff9,
++            .time_mid =3D 0xc7e9,
++            .time_hi_and_version =3D 0x5f99,
++            .clock_seq_and_node =3D {0x9e, 0xda, 0x23, 0x69, 0xdd, 0x69=
, 0x4f, 0x61}
++        },
++    },
++#else
++    // MPS3 payloads GUIDs
++    // bl2_signed payload GUID
++    {
++        .image_size =3D SE_BL2_PARTITION_SIZE,
++        .image_offset =3D SE_BL2_PARTITION_BANK_OFFSET,
++        .image_guid =3D {
++            .time_low =3D 0xfbfbefaa,
++            .time_mid =3D 0x0a56,
++            .time_hi_and_version =3D 0x50d5,
++            .clock_seq_and_node =3D {0xb6, 0x51, 0x74, 0x09, 0x1d, 0x3d=
, 0x62, 0xcf}
++        },
++    },
++    // tfm_s_signed
++    {
++        .image_size =3D TFM_PARTITION_SIZE,
++        .image_offset =3D TFM_PARTITION_BANK_OFFSET,
++        .image_guid =3D {
++            .time_low =3D 0xaf4cc7ad,
++            .time_mid =3D 0xee2e,
++            .time_hi_and_version =3D 0x5a39,
++            .clock_seq_and_node =3D {0xaa, 0xd5, 0xfa, 0xc8, 0xa1, 0xe6=
, 0x17, 0x3c}
++        },
++    },
++    // signed_fip-corstone1000
++    {
++        .image_size =3D FIP_PARTITION_SIZE,
++        .image_offset =3D FIP_PARTITION_BANK_OFFSET,
++        .image_guid =3D {
++            .time_low =3D 0x55302f96,
++            .time_mid =3D 0xc4f0,
++            .time_hi_and_version =3D 0x5cf9,
++            .clock_seq_and_node =3D {0x86, 0x24, 0xe7, 0xcc, 0x38, 0x8f=
, 0x2b, 0x68}
++        },
++    },
++    // Image.gz-initramfs-corstone1000-mps3
++    {
++        .image_size =3D INITRAMFS_PARTITION_SIZE,
++        .image_offset =3D INITRAMFS_PARTITION_BANK_OFFSET,
++        .image_guid =3D {
++            .time_low =3D 0x3e8ac972,
++            .time_mid =3D 0xc33c,
++            .time_hi_and_version =3D 0x5cc9,
++            .clock_seq_and_node =3D {0x90, 0xa0, 0xcd, 0xd3, 0x15, 0x96=
, 0x83, 0xea}
++        },
++    },
++#endif
++};
++
++struct fwu_metadata _metadata;
++
++bool is_initialized =3D false;
++bool is_installed =3D false;
++
++fmp_header_image_info_t fmp_header_image_info[FWU_COMPONENT_NUMBER];
++struct fwu_esrt_data_wrapper esrt;
++
++#define IMAGE_ACCEPTED          (1)
++#define IMAGE_NOT_ACCEPTED      (0)
++#define BANK_0                  (0)
++#define BANK_1                  (1)
++#define INVALID_VERSION         (0xffffffff)
++#define INVALID_IMAGE           (0xf)
++
++#ifndef FWU_METADATA_FLASH_DEV
++    #ifndef FLASH_DEV_NAME
++    #error "FWU_METADATA_FLASH_DEV or FLASH_DEV_NAME must be defined in=
 flash_layout.h"
++    #else
++    #define FWU_METADATA_FLASH_DEV FLASH_DEV_NAME
++    #endif
++#endif
++
++/* Import the CMSIS flash device driver */
++extern ARM_DRIVER_FLASH FWU_METADATA_FLASH_DEV;
++
++#define SYSTICK_PER_MINUTE    60
++#define BOOT_TIME_IN_MINUTES  6
++#define HOST_ACK_SYSTICK_TIMEOUT    (BOOT_TIME_IN_MINUTES * SYSTICK_PER=
_MINUTE)  /* Number of system ticks to be precise.
++                                                                       =
           * This is the value decided after monitoring the total time
++                                                                       =
           * taken by the host to boot both on FVP and FPGA.
++                                                                       =
           */
++
++#ifdef BL1_BUILD
++static psa_status_t private_metadata_read(
++        struct fwu_private_metadata* priv_metadata)
++{
++    FWU_LOG_MSG("%s: enter\n\r", __func__);
++
++    if (!priv_metadata) {
++        FWU_LOG_MSG("%s: ERROR - Null pointer received\n\r", __func__);
++        return PSA_ERROR_INVALID_ARGUMENT;
++    }
++
++    int ret =3D FWU_METADATA_FLASH_DEV.ReadData(FWU_PRIVATE_METADATA_RE=
PLICA_1_OFFSET, priv_metadata,
++                                          sizeof(*priv_metadata));
++    if (ret < 0) {
++        FWU_LOG_MSG("%s: ERROR - Flash read failed (ret =3D %d)\n\r", _=
_func__, ret);
++        return PSA_ERROR_STORAGE_FAILURE;
++    }
++
++    if (ret !=3D sizeof(*priv_metadata)) {
++        FWU_LOG_MSG("%s: ERROR - Incomplete metadata read (expected %zu=
, got %d)\n\r",=20
++                    __func__, sizeof(*priv_metadata), ret);
++        return PSA_ERROR_INSUFFICIENT_DATA;
++    }
++
++    FWU_LOG_MSG("%s: success: boot_index =3D %u\n\r", __func__,
++                        priv_metadata->boot_index);
++
++    return PSA_SUCCESS;
++}
++#else
++static psa_status_t private_metadata_read(
++        struct fwu_private_metadata* priv_metadata)
++{
++    partition_entry_t *part;
++    uuid_t private_uuid =3D PRIVATE_METADATA_TYPE_UUID;
++
++    FWU_LOG_MSG("%s: enter\n\r", __func__);
++
++    if (!priv_metadata) {
++        FWU_LOG_MSG("%s: ERROR - Null pointer received\n\r", __func__);
++        return PSA_ERROR_INVALID_ARGUMENT;
++    }
++
++    part =3D get_partition_entry_by_type(&private_uuid);
++    if (!part) {
++        FWU_LOG_MSG("Private metadata partition not found\n\r");
++        return PSA_ERROR_GENERIC_ERROR;
++    }
++
++    int ret =3D FWU_METADATA_FLASH_DEV.ReadData(part->start, priv_metad=
ata,
++                                          sizeof(*priv_metadata));
++    if (ret < 0) {
++        FWU_LOG_MSG("%s: ERROR - Flash read failed (ret =3D %d)\n\r", _=
_func__, ret);
++        return PSA_ERROR_STORAGE_FAILURE;
++    }
++
++    if (ret !=3D sizeof(*priv_metadata)) {
++        FWU_LOG_MSG("%s: ERROR - Incomplete metadata read (expected %zu=
, got %d)\n\r",=20
++                    __func__, sizeof(*priv_metadata), ret);
++        return PSA_ERROR_INSUFFICIENT_DATA;
++    }
++
++    FWU_LOG_MSG("%s: success: boot_index =3D %u\n\r", __func__,
++                        priv_metadata->boot_index);
++
++    return PSA_SUCCESS;
++}
++#endif
++
++#ifdef BL1_BUILD
++static psa_status_t private_metadata_write(
++        struct fwu_private_metadata* priv_metadata)
++{
++    FWU_LOG_MSG("%s: enter: boot_index =3D %u\n\r", __func__,
++                        priv_metadata->boot_index);
++
++    if (!priv_metadata) {
++        FWU_LOG_MSG("%s: ERROR - Null pointer received\n\r", __func__);
++        return PSA_ERROR_INVALID_ARGUMENT;
++    }
++
++    int ret =3D FWU_METADATA_FLASH_DEV.EraseSector(FWU_PRIVATE_METADATA=
_REPLICA_1_OFFSET);
++    if (ret !=3D ARM_DRIVER_OK) {
++        FWU_LOG_MSG("%s: ERROR - Flash erase failed (ret =3D %d)\n\r", =
__func__, ret);
++        return PSA_ERROR_STORAGE_FAILURE;
++    }
++
++    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(FWU_PRIVATE_METADATA_REP=
LICA_1_OFFSET,
++                                priv_metadata, sizeof(*priv_metadata));
++    if (ret < 0) {
++        FWU_LOG_MSG("%s: ERROR - Flash write failed (ret =3D %d)\n\r", =
__func__, ret);
++        return PSA_ERROR_STORAGE_FAILURE;
++    }
++
++    if (ret !=3D sizeof(*priv_metadata)) {
++        FWU_LOG_MSG("%s: ERROR - Incomplete metadata write (expected %z=
u, written %d)\n\r",=20
++                    __func__, sizeof(*priv_metadata), ret);
++        return PSA_ERROR_INSUFFICIENT_DATA;
++    }
++
++    FWU_LOG_MSG("%s: success\n\r", __func__);
++    return PSA_SUCCESS;
++}
++#else
++static psa_status_t private_metadata_write(
++        struct fwu_private_metadata* priv_metadata)
++{
++    uuid_t private_uuid =3D PRIVATE_METADATA_TYPE_UUID;
++    partition_entry_t *part;
++
++    FWU_LOG_MSG("%s: enter: boot_index =3D %u\n\r", __func__,
++                        priv_metadata->boot_index);
++
++    if (!priv_metadata) {
++        FWU_LOG_MSG("%s: ERROR - Null pointer received\n\r", __func__);
++        return PSA_ERROR_INVALID_ARGUMENT;
++    }
++
++    part =3D get_partition_entry_by_type(&private_uuid);
++    if (!part) {
++        FWU_LOG_MSG("Private metadata partition not found\n\r");
++        return PSA_ERROR_GENERIC_ERROR;
++    }
++
++    int ret =3D FWU_METADATA_FLASH_DEV.EraseSector(part->start);
++    if (ret !=3D ARM_DRIVER_OK) {
++        FWU_LOG_MSG("%s: ERROR - Flash erase failed (ret =3D %d)\n\r", =
__func__, ret);
++        return PSA_ERROR_STORAGE_FAILURE;
++    }
++
++    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(part->start,
++                                priv_metadata, sizeof(*priv_metadata));
++    if (ret < 0) {
++        FWU_LOG_MSG("%s: ERROR - Flash write failed (ret =3D %d)\n\r", =
__func__, ret);
++        return PSA_ERROR_STORAGE_FAILURE;
++    }
++
++    if (ret !=3D sizeof(*priv_metadata)) {
++        FWU_LOG_MSG("%s: ERROR - Incomplete metadata write (expected %z=
u, written %d)\n\r",=20
++                    __func__, sizeof(*priv_metadata), ret);
++        return PSA_ERROR_INSUFFICIENT_DATA;
++    }
++
++    FWU_LOG_MSG("%s: success\n\r", __func__);
++    return PSA_SUCCESS;
++}
++#endif
++
++static psa_status_t metadata_validate(struct fwu_metadata *metadata)
++{
++    FWU_LOG_MSG("%s: enter:\n\r", __func__);
++
++    if (!metadata) {
++        FWU_LOG_MSG("%s: ERROR - Null pointer received\n\r", __func__);
++        return PSA_ERROR_INVALID_ARGUMENT;
++    }
++
++    uint32_t calculated_crc32 =3D crc32((uint8_t *)&(metadata->version)=
,
++                                      sizeof(*metadata) - sizeof(uint32=
_t));
++
++    if (metadata->crc_32 !=3D calculated_crc32) {
++        FWU_LOG_MSG("%s: failed: crc32 calculated: 0x%x, given: 0x%x\n\=
r", __func__,
++                    calculated_crc32, metadata->crc_32);
++        return PSA_ERROR_GENERIC_ERROR;
++    }
++
++    FWU_LOG_MSG("%s: success\n\r", __func__);
++
++    return PSA_SUCCESS;
++}
++
++#ifdef BL1_BUILD
++static psa_status_t metadata_read_without_validation(struct fwu_metadat=
a *metadata)
++{
++    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
++                  FWU_METADATA_REPLICA_1_OFFSET, sizeof(*metadata));
++
++    if (!metadata) {
++        FWU_LOG_MSG("%s: ERROR - Null pointer received\n\r", __func__);
++        return PSA_ERROR_INVALID_ARGUMENT;
++    }
++
++    int ret =3D FWU_METADATA_FLASH_DEV.ReadData(FWU_METADATA_REPLICA_1_=
OFFSET,
++                                metadata, sizeof(*metadata));
++    if (ret < 0) {
++        FWU_LOG_MSG("%s: ERROR - Flash read failed (ret =3D %d)\n\r", _=
_func__, ret);
++        return PSA_ERROR_STORAGE_FAILURE;
++    }
++
++    if (ret !=3D sizeof(*metadata)) {
++        FWU_LOG_MSG("%s: ERROR - Incomplete metadata read (expected %zu=
, got %d)\n\r",=20
++                    __func__, sizeof(*metadata), ret);
++        return PSA_ERROR_INSUFFICIENT_DATA;
++    }
++
++    FWU_LOG_MSG("%s: success: active =3D %u, previous =3D %d\n\r", __fu=
nc__,
++                  metadata->active_index, metadata->previous_active_ind=
ex);
++
++    return PSA_SUCCESS;
++}
++#else
++static psa_status_t metadata_read_without_validation(struct fwu_metadat=
a *metadata)
++{
++    uuid_t metadata_uuid =3D FWU_METADATA_TYPE_UUID;
++    partition_entry_t *part;
++
++    if (!metadata) {
++        FWU_LOG_MSG("%s: ERROR - Null pointer received\n\r", __func__);
++        return PSA_ERROR_INVALID_ARGUMENT;
++    }
++
++    part =3D get_partition_entry_by_type(&metadata_uuid);
++    if (!part) {
++        FWU_LOG_MSG("%s: FWU metadata partition not found\n\r", __func_=
_);
++        return PSA_ERROR_GENERIC_ERROR;
++    }
++
++    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
++                  part->start, sizeof(*metadata));
++
++
++    int ret =3D FWU_METADATA_FLASH_DEV.ReadData(part->start,
++                                metadata, sizeof(*metadata));
++    if (ret < 0) {
++        FWU_LOG_MSG("%s: ERROR - Flash read failed (ret =3D %d)\n\r", _=
_func__, ret);
++        return PSA_ERROR_STORAGE_FAILURE;
++    }
++
++    if (ret !=3D sizeof(*metadata)) {
++        FWU_LOG_MSG("%s: ERROR - Incomplete metadata read (expected %zu=
, got %d)\n\r",=20
++                    __func__, sizeof(*metadata), ret);
++        return PSA_ERROR_INSUFFICIENT_DATA;
++    }
++
++    FWU_LOG_MSG("%s: success: active =3D %u, previous =3D %d\n\r", __fu=
nc__,
++                  metadata->active_index, metadata->previous_active_ind=
ex);
++
++    return PSA_SUCCESS;
++}
++#endif
++
++#ifdef BL1_BUILD
++static psa_status_t metadata_read(struct fwu_metadata *metadata, uint8_=
t replica_num)
++{
++    uint32_t replica_offset =3D 0;
++
++    FWU_LOG_MSG("%s: enter\n\r", __func__);
++
++    if (!metadata) {
++        FWU_LOG_MSG("%s: ERROR - Null pointer received\n\r", __func__);
++        return PSA_ERROR_INVALID_ARGUMENT;
++    }
++
++    if (replica_num =3D=3D 1) {
++        replica_offset =3D FWU_METADATA_REPLICA_1_OFFSET;
++    } else if (replica_num =3D=3D 2) {
++        replica_offset =3D FWU_METADATA_REPLICA_2_OFFSET;
++    } else {
++        FWU_LOG_MSG("%s: replica_num must be 1 or 2\n\r", __func__);
++        return PSA_ERROR_GENERIC_ERROR;
++    }
++
++    FWU_LOG_MSG("%s: flash addr =3D %u, size =3D %d\n\r", __func__,
++                  replica_offset, sizeof(*metadata));
++
++
++    int ret =3D FWU_METADATA_FLASH_DEV.ReadData(replica_offset,
++                                metadata, sizeof(*metadata));
++    if (ret < 0) {
++        FWU_LOG_MSG("%s: ERROR - Flash read failed (ret =3D %d)\n\r", _=
_func__, ret);
++        return PSA_ERROR_STORAGE_FAILURE;
++    }
++
++    if (ret !=3D sizeof(*metadata)) {
++        FWU_LOG_MSG("%s: ERROR - Incomplete metadata read (expected %zu=
, got %d)\n\r",=20
++                    __func__, sizeof(*metadata), ret);
++        return PSA_ERROR_INSUFFICIENT_DATA;
++    }
++
++    if (metadata_validate(metadata) !=3D PSA_SUCCESS) {
++        FWU_LOG_MSG("%s: ERROR - Metadata validation failed\n\r", __fun=
c__);
++        return PSA_ERROR_GENERIC_ERROR;
++    }
++
++    FWU_LOG_MSG("%s: success: active =3D %u, previous =3D %d\n\r", __fu=
nc__,
++                  metadata->active_index, metadata->previous_active_ind=
ex);
++
++    return PSA_SUCCESS;
++}
++#else
++static psa_status_t metadata_read(struct fwu_metadata *metadata, uint8_=
t replica_num)
++{
++    uuid_t metadata_uuid =3D FWU_METADATA_TYPE_UUID;
++    partition_entry_t *part;
++
++    FWU_LOG_MSG("%s: enter\n\r", __func__);
++
++    if (!metadata) {
++        FWU_LOG_MSG("%s: ERROR - Null pointer received\n\r", __func__);
++        return PSA_ERROR_INVALID_ARGUMENT;
++    }
++
++    if (replica_num =3D=3D 1) {
++        part =3D get_partition_entry_by_type(&metadata_uuid);
++    } else if (replica_num =3D=3D 2) {
++        part =3D get_partition_replica_by_type(&metadata_uuid);
++    } else {
++        FWU_LOG_MSG("%s: replica_num must be 1 or 2\n\r", __func__);
++        return PSA_ERROR_GENERIC_ERROR;
++    }
++
++    if (!part) {
++        FWU_LOG_MSG("%s: FWU metadata partition not found\n\r", __func_=
_);
++        return PSA_ERROR_GENERIC_ERROR;
++    }
++
++    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
++                  part->start, sizeof(*metadata));
++
++    int ret =3D FWU_METADATA_FLASH_DEV.ReadData(part->start,
++                                metadata, sizeof(*metadata));
++    if (ret < 0) {
++        FWU_LOG_MSG("%s: ERROR - Flash read failed (ret =3D %d)\n\r", _=
_func__, ret);
++        return PSA_ERROR_STORAGE_FAILURE;
++    }
++
++    if (ret !=3D sizeof(*metadata)) {
++        FWU_LOG_MSG("%s: ERROR - Incomplete metadata read (expected %zu=
, got %d)\n\r",=20
++                    __func__, sizeof(*metadata), ret);
++        return PSA_ERROR_INSUFFICIENT_DATA;
++    }
++
++    if (metadata_validate(metadata) !=3D PSA_SUCCESS) {
++        FWU_LOG_MSG("%s: ERROR - Metadata validation failed\n\r", __fun=
c__);
++        return PSA_ERROR_GENERIC_ERROR;
++    }
++
++    FWU_LOG_MSG("%s: success: active =3D %u, previous =3D %d\n\r", __fu=
nc__,
++                  metadata->active_index, metadata->previous_active_ind=
ex);
++
++    return PSA_SUCCESS;
++}
++#endif
++
++
++#ifdef BL1_BUILD
++static psa_status_t metadata_write(
++                        struct fwu_metadata *metadata, uint8_t replica_=
num)
++{
++    uint32_t replica_offset =3D 0;
++
++    FWU_LOG_MSG("%s: enter\n\r", __func__);
++
++    if (!metadata) {
++        FWU_LOG_MSG("%s: ERROR - Null pointer received\n\r", __func__);
++        return PSA_ERROR_INVALID_ARGUMENT;
++    }
++
++    if (replica_num =3D=3D 1) {
++        replica_offset =3D FWU_METADATA_REPLICA_1_OFFSET;
++    } else if (replica_num =3D=3D 2) {
++        replica_offset =3D FWU_METADATA_REPLICA_2_OFFSET;
++    } else {
++        FWU_LOG_MSG("%s: replica_num must be 1 or 2\n\r", __func__);
++        return PSA_ERROR_GENERIC_ERROR;
++    }
++
++    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
++                  replica_offset, sizeof(*metadata));
++
++
++    int ret =3D FWU_METADATA_FLASH_DEV.EraseSector(replica_offset);
++    if (ret !=3D ARM_DRIVER_OK) {
++        FWU_LOG_MSG("%s: ERROR - Flash erase failed (ret =3D %d)\n\r", =
__func__, ret);
++        return PSA_ERROR_STORAGE_FAILURE;
++    }
++
++    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(replica_offset,
++                                metadata, sizeof(*metadata));
++    if (ret < 0) {
++        FWU_LOG_MSG("%s: ERROR - Flash write failed (ret =3D %d)\n\r", =
__func__, ret);
++        return PSA_ERROR_STORAGE_FAILURE;
++    }
++
++    if (ret !=3D sizeof(*metadata)) {
++        FWU_LOG_MSG("%s: ERROR - Incomplete metadata write (expected %z=
u, written %d)\n\r",=20
++                    __func__, sizeof(*metadata), ret);
++        return PSA_ERROR_INSUFFICIENT_DATA;
++    }
++
++    FWU_LOG_MSG("%s: success: active =3D %u, previous =3D %d\n\r", __fu=
nc__,
++                  metadata->active_index, metadata->previous_active_ind=
ex);
++    return PSA_SUCCESS;
++}
++#else
++static psa_status_t metadata_write(
++                        struct fwu_metadata *metadata, uint8_t replica_=
num)
++{
++    uuid_t metadata_uuid =3D FWU_METADATA_TYPE_UUID;
++    partition_entry_t *part;
++
++    if (!metadata) {
++        FWU_LOG_MSG("%s: ERROR - Null pointer received\n\r", __func__);
++        return PSA_ERROR_INVALID_ARGUMENT;
++    }
++
++    if (replica_num =3D=3D 1) {
++        part =3D get_partition_entry_by_type(&metadata_uuid);
++    } else if (replica_num =3D=3D 2) {
++        part =3D get_partition_replica_by_type(&metadata_uuid);
++    } else {
++        FWU_LOG_MSG("%s: replica_num must be 1 or 2\n\r", __func__);
++        return PSA_ERROR_GENERIC_ERROR;
++    }
++
++    if (!part) {
++        FWU_LOG_MSG("%s: FWU metadata partition not found\n\r", __func_=
_);
++        return PSA_ERROR_GENERIC_ERROR;
++    }
++
++    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
++                  part->start, sizeof(*metadata));
++
++    int ret =3D FWU_METADATA_FLASH_DEV.EraseSector(part->start);
++    if (ret !=3D ARM_DRIVER_OK) {
++        FWU_LOG_MSG("%s: ERROR - Flash erase failed (ret =3D %d)\n\r", =
__func__, ret);
++        return PSA_ERROR_STORAGE_FAILURE;
++    }
++
++    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(part->start,
++                                metadata, sizeof(*metadata));
++    if (ret < 0) {
++        FWU_LOG_MSG("%s: ERROR - Flash write failed (ret =3D %d)\n\r", =
__func__, ret);
++        return PSA_ERROR_STORAGE_FAILURE;
++    }
++
++    if (ret !=3D sizeof(*metadata)) {
++        FWU_LOG_MSG("%s: ERROR - Incomplete metadata write (expected %z=
u, written %d)\n\r",=20
++                    __func__, sizeof(*metadata), ret);
++        return PSA_ERROR_INSUFFICIENT_DATA;
++    }
++
++    FWU_LOG_MSG("%s: success: active =3D %u, previous =3D %d\n\r", __fu=
nc__,
++                  metadata->active_index, metadata->previous_active_ind=
ex);
++    return PSA_SUCCESS;
++}
++#endif
++
++static psa_status_t metadata_write_both_replica(
++                        struct fwu_metadata *metadata)
++{
++    psa_status_t ret =3D PSA_ERROR_GENERIC_ERROR;
++
++    ret =3D metadata_write(metadata, 1);
++    if (ret) {
++        return ret;
++    }
++
++    ret =3D metadata_write(metadata, 2);
++    if (ret) {
++        return ret;
++    }
++
++    return PSA_SUCCESS;
++}
++
++psa_status_t fwu_metadata_check_and_correct_integrity(void)
++{
++    psa_status_t ret_replica_1 =3D PSA_ERROR_GENERIC_ERROR;
++    psa_status_t ret_replica_2 =3D PSA_ERROR_GENERIC_ERROR;
++
++    /* Check integrity of both metadata replica */
++    ret_replica_1 =3D metadata_read(&_metadata, 1);
++    ret_replica_2 =3D metadata_read(&_metadata, 2);
++
++    if (ret_replica_1 !=3D PSA_SUCCESS && ret_replica_2 !=3D PSA_SUCCES=
S) {
++        return PSA_ERROR_GENERIC_ERROR;
++    } else if (ret_replica_1 =3D=3D PSA_SUCCESS && ret_replica_2 !=3D P=
SA_SUCCESS) {
++        metadata_read(&_metadata, 1);
++        metadata_write(&_metadata, 2);
++    } else if (ret_replica_1 !=3D PSA_SUCCESS && ret_replica_2 =3D=3D P=
SA_SUCCESS) {
++        metadata_read(&_metadata, 2);
++        metadata_write(&_metadata, 1);
++    }
++
++    return PSA_SUCCESS;
++}
++
++psa_status_t fwu_metadata_init(void)
++{
++    psa_status_t ret;
++    ARM_FLASH_INFO* flash_info;
++
++    if (is_initialized) {
++        return PSA_SUCCESS;
++    }
++
++    #ifndef BL1_BUILD
++    plat_io_storage_init();
++    partition_init(PLATFORM_GPT_IMAGE);
++    #endif
++
++    /* Code assumes everything fits into a sector */
++    if (sizeof(struct fwu_metadata) > FWU_METADATA_FLASH_SECTOR_SIZE) {
++        return PSA_ERROR_GENERIC_ERROR;
++    }
++
++    if (sizeof(struct fwu_private_metadata) > FWU_METADATA_FLASH_SECTOR=
_SIZE) {
++        return PSA_ERROR_GENERIC_ERROR;
++    }
++
++    ret =3D FWU_METADATA_FLASH_DEV.Initialize(NULL);
++    if (ret !=3D ARM_DRIVER_OK) {
++        return PSA_ERROR_GENERIC_ERROR;
++    }
++
++    flash_info =3D FWU_METADATA_FLASH_DEV.GetInfo();
++    if (flash_info->program_unit !=3D 1) {
++        FWU_METADATA_FLASH_DEV.Uninitialize();
++        return PSA_ERROR_GENERIC_ERROR;
++    }
++
++    is_initialized =3D true;
++
++    return PSA_SUCCESS;
++}
++
++static bool skip_metadata_provision(void)
++{
++    metadata_read(&_metadata, 1);
++    return (((_metadata.active_index < 2) || (_metadata.previous_active=
_index < 2))
++            && (_metadata.active_index ^ _metadata.previous_active_inde=
x)
++           );
++}
++
++static psa_status_t fwu_metadata_configure(void)
++{
++    /* Provision FWU Agent Metadata */
++
++    psa_status_t ret;
++    uint32_t image_version =3D FWU_IMAGE_INITIAL_VERSION;
++
++    memset(&_metadata, 0, sizeof(struct fwu_metadata));
++
++    _metadata.version =3D FWU_METADATA_VERSION;
++    _metadata.active_index =3D BANK_0;
++    _metadata.previous_active_index =3D BANK_1;
++    _metadata.desc_offset=3D FWU_FW_STORE_DESC_OFFSET;
++    _metadata.metadata_size =3D sizeof(struct fwu_metadata);
++
++    _metadata.fw_desc.num_banks =3D NR_OF_FW_BANKS;
++    _metadata.fw_desc.num_images =3D NR_OF_IMAGES_IN_FW_BANK;
++    _metadata.fw_desc.img_entry_size =3D sizeof(struct fwu_image_entry)=
 * NR_OF_IMAGES_IN_FW_BANK;
++    _metadata.fw_desc.bank_info_entry_size =3D sizeof(struct fwu_image_=
properties) * NR_OF_FW_BANKS;
++    _metadata.bank_state[BANK_0] =3D FWU_BANK_ACCEPTED;
++    _metadata.bank_state[BANK_1] =3D FWU_BANK_ACCEPTED;
++    /* bank 0 is the place where images are located at the
++     * start of device lifecycle */
++
++    for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
++
++        _metadata.fw_desc.img_entry[i].img_props[BANK_0].accepted =3D I=
MAGE_ACCEPTED;
++        _metadata.fw_desc.img_entry[i].img_props[BANK_0].version =3D im=
age_version;
++        memcpy(&(_metadata.fw_desc.img_entry[i].img_props[BANK_0].img_u=
uid), (const void *)&fwu_image[i].image_guid, sizeof(struct efi_guid));
++
++        _metadata.fw_desc.img_entry[i].img_props[BANK_1].accepted =3D I=
NVALID_IMAGE;
++        _metadata.fw_desc.img_entry[i].img_props[BANK_1].version =3D IN=
VALID_VERSION;
++        memcpy(&(_metadata.fw_desc.img_entry[i].img_props[BANK_1].img_u=
uid), (const void *)&fwu_image[i].image_guid, sizeof(struct efi_guid));
++    }
++
++    /* Calculate CRC32 for fwu metadata. The first filed in the _metada=
ta has to be the crc_32.
++     * This should be omited from the calculation. */
++    _metadata.crc_32 =3D crc32((uint8_t *)&_metadata.version,
++                             sizeof(struct fwu_metadata) - sizeof(uint3=
2_t));
++
++    ret =3D metadata_write_both_replica(&_metadata);
++    if (ret) {
++        return ret;
++    }
++
++    memset(&_metadata, 0, sizeof(_metadata));
++    ret =3D metadata_read(&_metadata, 1);
++    if (ret) {
++        return ret;
++    }
++    FWU_LOG_MSG("%s: provisioned values: active =3D %u, previous =3D %d=
\n\r",
++             __func__, _metadata.active_index, _metadata.previous_activ=
e_index);
++    return PSA_SUCCESS;
++
++}
++
++static psa_status_t fwu_private_metadata_configure(void)
++{
++    /* Provision Private metadata for update agent which is shared
++       beween BL1 and tf-m of secure enclave */
++
++    psa_status_t ret;
++    struct fwu_private_metadata priv_metadata;
++
++    memset(&priv_metadata, 0, sizeof(struct fwu_private_metadata));
++
++    priv_metadata.boot_index =3D BANK_0;
++    priv_metadata.boot_attempted =3D 0;
++
++    for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
++        priv_metadata.fmp_version[i] =3D FWU_IMAGE_INITIAL_VERSION;
++        priv_metadata.fmp_last_attempt_version[i] =3D FWU_IMAGE_INITIAL=
_VERSION;
++        priv_metadata.fmp_last_attempt_status[i] =3D LAST_ATTEMPT_STATU=
S_SUCCESS;
++    }
++    ret =3D private_metadata_write(&priv_metadata);
++    if (ret) {
++        return ret;
++    }
++
++    memset(&priv_metadata, 0, sizeof(struct fwu_private_metadata));
++    ret =3D private_metadata_read(&priv_metadata);
++    if (ret) {
++        return ret;
++    }
++    FWU_LOG_MSG("%s: provisioned values: boot_index =3D %u\n\r", __func=
__,
++                        priv_metadata.boot_index);
++    return PSA_SUCCESS;
++}
++
++psa_status_t fwu_metadata_provision(void)
++{
++    psa_status_t ret;
++
++    FWU_LOG_MSG("%s: enter\n\r", __func__);
++
++    ret =3D fwu_metadata_init();
++    if (ret) {
++        FWU_LOG_MSG("%s: ERROR FWU Metadata init failed \n\r", __func__=
);
++        return ret;
++    }
++
++    /*
++     * check by chance if the previous reboot
++     * had a firmware data?. If yes, then don't initialize
++     * metadata
++     */
++    if(skip_metadata_provision()) {
++        FWU_LOG_MSG("%s: Skipping Metadata provisioning  \n\r", __func_=
_);
++        return PSA_SUCCESS;
++    }
++
++    ret =3D fwu_metadata_configure();
++    if(ret) {
++        FWU_LOG_MSG("%s: ERROR FWU Metadata configure failed \n\r", __f=
unc__);
++        return ret;
++    }
++
++    ret =3D fwu_private_metadata_configure();
++    if(ret) {
++        FWU_LOG_MSG("%s: ERROR FWU Private Metadata configure failed \n=
\r", __func__);
++        return ret;
++    }
++
++    FWU_LOG_MSG("%s: FWU METADATA PROVISIONED.\n\r", __func__);
++    return PSA_SUCCESS;
++}
++
++static uint8_t get_fwu_image_state(
++        struct fwu_metadata *metadata,
++        struct fwu_private_metadata *priv_metadata,
++	uint32_t fwu_image_index)
++{
++    FWU_LOG_MSG("%s: enter\n\r", __func__);
++
++    if ((metadata->fw_desc.img_entry[fwu_image_index].img_props[metadat=
a->active_index].accepted)
++            =3D=3D (IMAGE_NOT_ACCEPTED)) {
++        FWU_LOG_MSG("%s: exit: Image %d PSA_FWU_TRIAL\n\r", __func__, f=
wu_image_index);
++        return PSA_FWU_TRIAL;
++    }
++
++    FWU_LOG_MSG("%s: exit: Image %d PSA_FWU_READY\n\r", __func__, fwu_i=
mage_index);
++    return PSA_FWU_READY;
++}
++
++static uint8_t get_fwu_agent_state(
++        struct fwu_metadata *metadata,
++        struct fwu_private_metadata *priv_metadata)
++{
++    FWU_LOG_MSG("%s: enter\n\r", __func__);
++
++    if (priv_metadata->boot_index !=3D metadata->active_index) {
++        FWU_LOG_MSG("%s: exit: FWU Agent PSA_FWU_TRIAL (index mismatch)=
\n\r", __func__);
++        return PSA_FWU_TRIAL;
++    }
++
++    for (int i=3D0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
++        if(get_fwu_image_state(metadata, priv_metadata, i) =3D=3D PSA_F=
WU_TRIAL) {
++            FWU_LOG_MSG("%s: exit: FWU Agent PSA_FWU_TRIAL (an image st=
ill is in trial state)\n\r", __func__);
++            return PSA_FWU_TRIAL;
++        }
++    }
++
++    FWU_LOG_MSG("%s: exit: FWU Agent PSA_FWU_READY\n\r", __func__);
++    return PSA_FWU_READY;
++}
++
++static psa_status_t erase_image(uint32_t image_offset, uint32_t image_s=
ize)
++{
++    int ret;
++    uint32_t sectors;
++
++    FWU_LOG_MSG("%s: enter\n\r", __func__);
++
++    if ((image_offset % FWU_METADATA_FLASH_SECTOR_SIZE) !=3D 0) {
++        return PSA_ERROR_INVALID_ARGUMENT;
++    }
++
++    if ((image_size % FWU_METADATA_FLASH_SECTOR_SIZE) !=3D 0) {
++        return PSA_ERROR_GENERIC_ERROR;
++    }
++
++    sectors =3D image_size / FWU_METADATA_FLASH_SECTOR_SIZE;
++
++    FWU_LOG_MSG("%s: erasing sectors =3D %u, from offset =3D %u\n\r", _=
_func__,
++                     sectors, image_offset);
++
++    for (int i =3D 0; i < sectors; i++) {
++        ret =3D FWU_METADATA_FLASH_DEV.EraseSector(
++                image_offset + (i * FWU_METADATA_FLASH_SECTOR_SIZE));
++        if (ret !=3D ARM_DRIVER_OK) {
++            return PSA_ERROR_GENERIC_ERROR;
++        }
++    }
++
++    FWU_LOG_MSG("%s: exit\n\r", __func__);
++    return PSA_SUCCESS;
++}
++
++static psa_status_t fwu_select_previous(
++        struct fwu_metadata *metadata,
++        struct fwu_private_metadata *priv_metadata)
++{
++    psa_status_t ret;
++    uint8_t current_state;
++    uint32_t index;
++
++    FWU_LOG_MSG("%s: enter\n\r", __func__);
++
++    /* it is expected to receive this call only when
++       in trial state */
++    current_state =3D get_fwu_agent_state(metadata, priv_metadata);
++    if (current_state !=3D PSA_FWU_TRIAL) {
++        return PSA_ERROR_BAD_STATE;
++    }
++
++    /* not expected to receive this call in this state, system
++     * did not boot from previous active index */
++    if (metadata->previous_active_index !=3D priv_metadata->boot_index)=
 {
++        return PSA_ERROR_GENERIC_ERROR;
++    }
++
++    FWU_LOG_MSG("%s: trial state: active index =3D %u, previous active =
=3D %u\n\r",
++            __func__, metadata->active_index, metadata->previous_active=
_index);
++
++    index =3D metadata->previous_active_index;
++    for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
++        if (metadata->fw_desc.img_entry[i].img_props[index].accepted !=3D=
 IMAGE_ACCEPTED)
++        {
++            FWU_ASSERT(0);
++        }
++    }
++
++    index =3D metadata->active_index;
++    metadata->bank_state[index] =3D FWU_BANK_INVALID;
++    metadata->active_index =3D metadata->previous_active_index;
++    metadata->previous_active_index =3D index;
++
++    priv_metadata->boot_attempted =3D 0;
++
++    ret =3D private_metadata_write(priv_metadata);
++    if (ret) {
++        return ret;
++    }
++    metadata->crc_32 =3D crc32((uint8_t *)&metadata->version,
++                              sizeof(struct fwu_metadata) - sizeof(uint=
32_t));
++
++    ret =3D metadata_write_both_replica(metadata);
++    if (ret) {
++        return ret;
++    }
++
++    FWU_LOG_MSG("%s: in regular state by choosing previous active bank\=
n\r",
++                 __func__);
++
++    FWU_LOG_MSG("%s: exit: ret =3D %d\n\r", __func__, ret);
++    return ret;
++
++}
++
++void bl1_get_active_bl2_image(uint32_t *offset)
++{
++    struct fwu_private_metadata priv_metadata;
++    uint8_t current_state;
++    uint32_t boot_attempted;
++    uint32_t boot_index;
++
++    FWU_LOG_MSG("%s: enter\n\r", __func__);
++
++    if (fwu_metadata_init()) {
++        FWU_ASSERT(0);
++    }
++
++    if (private_metadata_read(&priv_metadata)) {
++        FWU_ASSERT(0);
++    }
++
++    if (metadata_read(&_metadata, 1)) {
++        FWU_ASSERT(0);
++    }
++
++    current_state =3D get_fwu_agent_state(&_metadata, &priv_metadata);
++
++    if (current_state =3D=3D PSA_FWU_READY) {
++        boot_index =3D _metadata.active_index;
++        FWU_ASSERT(boot_index =3D=3D priv_metadata.boot_index);
++        boot_attempted =3D 0;
++    } else if (current_state =3D=3D PSA_FWU_TRIAL) {
++        boot_attempted =3D (++priv_metadata.boot_attempted);
++        FWU_LOG_MSG("%s: attempting boot number =3D %u\n\r",
++                                        __func__, boot_attempted);
++        if (boot_attempted <=3D MAX_BOOT_ATTEMPTS_PER_BANK) {
++            boot_index =3D _metadata.active_index;
++            FWU_LOG_MSG("%s: booting from trial bank: %u\n\r",
++                                        __func__, boot_index);
++        } else if (boot_attempted <=3D (2 * MAX_BOOT_ATTEMPTS_PER_BANK)=
) {
++            boot_index =3D _metadata.previous_active_index;
++            FWU_LOG_MSG("%s: gave up booting from trial bank\n\r", __fu=
nc__);
++            FWU_LOG_MSG("%s: booting from previous active bank: %u\n\r"=
,
++                                        __func__, boot_index);
++        } else {
++            FWU_LOG_MSG("%s: cannot boot system from any bank, halting.=
..\n\r", __func__);
++            FWU_ASSERT(0);
++        }
++    } else {
++        FWU_ASSERT(0);
++    }
++
++    priv_metadata.boot_index =3D boot_index;
++    if (private_metadata_write(&priv_metadata) < 0) {
++        FWU_ASSERT(0);
++    }
++
++    if (boot_index =3D=3D BANK_0) {
++        *offset =3D SE_BL2_BANK_0_OFFSET;
++    } else if (boot_index =3D=3D BANK_1) {
++        *offset =3D SE_BL2_BANK_1_OFFSET;
++    } else {
++        FWU_ASSERT(0);
++    }
++
++    FWU_LOG_MSG("%s: exit: booting from bank =3D %u, offset =3D 0x%x\n\=
r", __func__,
++                        boot_index, *offset);
++
++    return;
++}
++
++uint8_t bl2_get_boot_bank(void)
++{
++    uint8_t boot_index;
++    struct fwu_private_metadata priv_metadata;
++    FWU_LOG_MSG("%s: enter", __func__);
++    if (fwu_metadata_init()) {
++        FWU_ASSERT(0);
++    }
++    if (private_metadata_read(&priv_metadata)) {
++        FWU_ASSERT(0);
++    }
++    boot_index =3D priv_metadata.boot_index;
++    FWU_LOG_MSG("%s: exit: booting from bank =3D %u", __func__, boot_in=
dex);
++    return boot_index;
++}
++
++static void disable_host_ack_timer(void)
++{
++    FWU_LOG_MSG("%s: timer to reset is disabled\n\r", __func__);
++    SysTick->CTRL &=3D (~SysTick_CTRL_ENABLE_Msk);
++}
++
++static psa_status_t update_nv_counters(
++                        struct fwu_private_metadata* priv_metadata)
++{
++    enum tfm_plat_err_t err;
++    uint32_t security_cnt;
++    enum tfm_nv_counter_t tfm_nv_counter_i;
++
++    FWU_LOG_MSG("%s: enter\n\r", __func__);
++
++    /* The FWU_BL2_NV_COUNTER (0) is not mirrored in the private metada=
ta. It is
++     * directly updated in the bl1_2_validate_image_at_addr() function,=
 in
++     * tfm/bl1/bl1_2/main.c.
++     * Because of this, the index starts from FWU_TFM_NV_COUNTER (1). *=
/
++    for (int i =3D FWU_TFM_NV_COUNTER; i <=3D FWU_MAX_NV_COUNTER_INDEX;=
 i++) {
++
++        switch (i) {
++            case FWU_TFM_NV_COUNTER:
++                tfm_nv_counter_i =3D PLAT_NV_COUNTER_BL2_0;
++                break;
++            case FWU_TFA_NV_COUNTER:
++                tfm_nv_counter_i =3D PLAT_NV_COUNTER_BL2_1;
++                break;
++            default:
++                FWU_ASSERT(0);
++                break;
++        }
++
++        err =3D tfm_plat_read_nv_counter(tfm_nv_counter_i,
++                        sizeof(security_cnt), (uint8_t *)&security_cnt)=
;
++        if (err !=3D TFM_PLAT_ERR_SUCCESS) {
++            FWU_LOG_MSG("%s: couldn't read NV counter\n\r", __func__);
++            return PSA_ERROR_GENERIC_ERROR;
++        }
++
++        if (priv_metadata->nv_counter[i] < security_cnt) {
++            FWU_LOG_MSG("%s: staged NV counter is smaller than current =
value\n\r", __func__);
++            return PSA_ERROR_GENERIC_ERROR;
++        } else if (priv_metadata->nv_counter[i] > security_cnt) {
++            FWU_LOG_MSG("%s: updating index =3D %u nv counter =3D %u->%=
u\n\r",
++                        __func__, i, security_cnt,
++                        priv_metadata->nv_counter[i]);
++            err =3D tfm_plat_set_nv_counter(tfm_nv_counter_i,
++                                    priv_metadata->nv_counter[i]);
++            if (err !=3D TFM_PLAT_ERR_SUCCESS) {
++                FWU_LOG_MSG("%s: couldn't write NV counter\n\r", __func=
__);
++                return PSA_ERROR_GENERIC_ERROR;
++            }
++        }
++
++    }
++
++    FWU_LOG_MSG("%s: exit\n\r", __func__);
++    return PSA_SUCCESS;
++}
++
++psa_status_t corstone1000_fwu_host_ack(void)
++{
++    psa_status_t ret;
++    struct fwu_private_metadata priv_metadata;
++    uint8_t current_state;
++
++    FWU_LOG_MSG("%s: enter\n\r", __func__);
++
++    if (!is_initialized) {
++        return PSA_ERROR_BAD_STATE;
++    }
++
++    Select_Write_Mode_For_Shared_Flash();
++
++    /* This cannot be added to the fwu_metadata_init() because that fun=
ction is
++     * called before the logging is enabled by TF-M. */
++    ret =3D fwu_metadata_check_and_correct_integrity();
++    if (ret !=3D PSA_SUCCESS) {
++        FWU_LOG_MSG("fwu_metadata_check_and_correct_integrity failed\r\=
n");
++        return ret;
++    }
++
++    if (metadata_read(&_metadata, 1)) {
++        ret =3D PSA_ERROR_GENERIC_ERROR;
++        goto out;
++    }
++
++    if (private_metadata_read(&priv_metadata)) {
++        ret =3D PSA_ERROR_GENERIC_ERROR;
++        goto out;
++    }
++
++    current_state =3D get_fwu_agent_state(&_metadata, &priv_metadata);
++    if (current_state =3D=3D PSA_FWU_READY) {
++
++        ret =3D PSA_SUCCESS; /* nothing to be done */
++
++	for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
++            fmp_set_image_info(&fwu_image[i].image_guid,
++                    priv_metadata.fmp_version[i],
++                    priv_metadata.fmp_last_attempt_version[i],
++                    priv_metadata.fmp_last_attempt_status[i]);
++	}
++
++        goto out;
++
++    } else if (current_state !=3D PSA_FWU_TRIAL) {
++        FWU_ASSERT(0);
++    }
++
++    if (_metadata.active_index !=3D priv_metadata.boot_index) {
++
++        /* firmware update failed, revert back to previous bank */
++
++	for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
++            if(get_fwu_image_state(&_metadata, &priv_metadata, i) =3D=3D=
 PSA_FWU_TRIAL) {
++                priv_metadata.fmp_last_attempt_version[i] =3D
++                 _metadata.fw_desc.img_entry[i].img_props[_metadata.act=
ive_index].version;
++
++                priv_metadata.fmp_last_attempt_status[i] =3D LAST_ATTEM=
PT_STATUS_ERROR_UNSUCCESSFUL;
++	    }
++        }
++        ret =3D fwu_select_previous(&_metadata, &priv_metadata);
++
++    }
++
++    if (ret =3D=3D PSA_SUCCESS) {
++        disable_host_ack_timer();
++        for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
++            fmp_set_image_info(&fwu_image[i].image_guid,
++                    priv_metadata.fmp_version[i],
++                    priv_metadata.fmp_last_attempt_version[i],
++                    priv_metadata.fmp_last_attempt_status[i]);
++        }
++    }
++
++out:
++    Select_XIP_Mode_For_Shared_Flash();
++
++    FWU_LOG_MSG("%s: exit: ret =3D %d\n\r", __func__, ret);
++    return ret;
++}
++
++static int systic_counter =3D 0;
++
++void SysTick_Handler(void)
++{
++    systic_counter++;
++    if (systic_counter % 10 =3D=3D 0) {
++        SysTick->CTRL &=3D ~SysTick_CTRL_ENABLE_Msk;
++        stdio_output_string("*", 1);
++        SysTick->CTRL |=3D SysTick_CTRL_ENABLE_Msk;
++    }
++    if (systic_counter =3D=3D HOST_ACK_SYSTICK_TIMEOUT) {
++        SysTick->CTRL &=3D ~SysTick_CTRL_ENABLE_Msk;
++        stdio_output_string("timer expired!\n\r",
++                           sizeof("timer expired!\n\r"));
++        NVIC_SystemReset();
++    }
++}
++
++/* When in trial state, start the timer for host to respond.
++ * Diable timer when host responds back either by calling
++ * corstone1000_fwu_accept_image or corstone1000_fwu_select_previous.
++ * Otherwise, resets the system.
++ */
++void host_acknowledgement_timer_to_reset(void)
++{
++    struct fwu_private_metadata priv_metadata;
++    uint8_t current_state;
++
++    FWU_LOG_MSG("%s: enter\n\r", __func__);
++
++    Select_Write_Mode_For_Shared_Flash();
++
++    if (!is_initialized) {
++        FWU_ASSERT(0);
++    }
++
++    if (private_metadata_read(&priv_metadata)) {
++        FWU_ASSERT(0);
++    }
++
++    if (metadata_read(&_metadata, 1)) {
++        FWU_ASSERT(0);
++    }
++
++    Select_XIP_Mode_For_Shared_Flash();
++
++    current_state =3D get_fwu_agent_state(&_metadata, &priv_metadata);
++
++    if (current_state =3D=3D PSA_FWU_TRIAL) {
++        FWU_LOG_MSG("%s: in trial state, starting host ack timer\n\r",
++                        __func__);
++        systic_counter =3D 0;
++        if (SysTick_Config(SysTick_LOAD_RELOAD_Msk)) {
++            FWU_LOG_MSG("%s: timer init failed\n\r", __func__);
++            FWU_ASSERT(0);
++        } else {
++            FWU_LOG_MSG("%s: timer started: seconds to expire : %u\n\r"=
,
++                        __func__, HOST_ACK_SYSTICK_TIMEOUT);
++        }
++    }
++
++    FWU_LOG_MSG("%s: exit\n\r", __func__);
++    return;
++}
++
++/* stage nv counter into private metadata section of the flash.
++ * staged nv counters are written to the otp when firmware update
++ * is successful
++ * the function assumes that the api is called in the boot loading
++ * stage
++ */
++psa_status_t fwu_stage_nv_counter(enum fwu_nv_counter_index_t index,
++        uint32_t img_security_cnt)
++{
++    struct fwu_private_metadata priv_metadata;
++
++    FWU_LOG_MSG("%s: enter: index =3D %u, val =3D %u\n\r", __func__,
++                                index, img_security_cnt);
++
++    if (!is_initialized) {
++        FWU_ASSERT(0);
++    }
++
++    if (index > FWU_MAX_NV_COUNTER_INDEX) {
++        return PSA_ERROR_INVALID_ARGUMENT;
++    }
++
++    if (private_metadata_read(&priv_metadata)) {
++        FWU_ASSERT(0);
++    }
++
++    if (priv_metadata.nv_counter[index] !=3D img_security_cnt) {
++        priv_metadata.nv_counter[index] =3D img_security_cnt;
++        if (private_metadata_write(&priv_metadata)) {
++            FWU_ASSERT(0);
++        }
++    }
++
++    FWU_LOG_MSG("%s: exit\n\r", __func__);
++    return PSA_SUCCESS;
++}
++
++psa_status_t corstone1000_fwu_flash_image(void)
++{
++	return PSA_SUCCESS;
++}
++
++/* Verify if image index is valid or not */
++bool is_image_index_valid(uint8_t fwu_image_index) {
++    return (fwu_image_index !=3D FWU_FAKE_IMAGE_INDEX &&
++            fwu_image_index !=3D FWU_IMAGE_INDEX_ESRT &&
++	    fwu_image_index < FWU_COMPONENT_NUMBER);
++}
++
++static psa_status_t get_esrt_data(struct fwu_esrt_data_wrapper *esrt)
++{
++    FWU_LOG_MSG("%s: enter\n\r", __func__);
++
++    if (!esrt)
++    {
++        FWU_LOG_MSG("%s: ERROR - Null pointer received\n\r", __func__);
++        return PSA_ERROR_INVALID_ARGUMENT;
++    }
++
++    psa_status_t ret;
++    struct fwu_private_metadata priv_metadata;
++
++    Select_Write_Mode_For_Shared_Flash();
++
++    if (private_metadata_read(&priv_metadata)) {
++        ret =3D PSA_ERROR_GENERIC_ERROR;
++        goto out;
++    }
++
++    esrt->data.fw_resource_count =3D NR_OF_IMAGES_IN_FW_BANK;
++    esrt->data.fw_resource_count_max =3D NR_OF_IMAGES_IN_FW_BANK;
++    esrt->data.fw_resource_version =3D EFI_SYSTEM_RESOURCE_TABLE_FIRMWA=
RE_RESOURCE_VERSION;
++
++    for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++)
++    {
++        memcpy(&esrt->entries[i].fw_class, &fwu_image[i].image_guid, si=
zeof(struct efi_guid));
++        esrt->entries[i].fw_version =3D priv_metadata.fmp_version[i];
++        esrt->entries[i].lowest_supported_fw_version =3D FWU_IMAGE_INIT=
IAL_VERSION;
++        esrt->entries[i].last_attempt_version =3D priv_metadata.fmp_las=
t_attempt_version[i];
++        esrt->entries[i].last_attempt_status =3D priv_metadata.fmp_last=
_attempt_status[i];
++    }
++    ret =3D PSA_SUCCESS;
++
++out:
++    Select_XIP_Mode_For_Shared_Flash();
++    FWU_LOG_MSG("%s: exit: ret =3D %d\n\r", __func__, ret);
++    return ret;
++}
++
++static psa_status_t fwu_accept_image(struct fwu_metadata *metadata,
++        struct fwu_private_metadata *priv_metadata,
++        const psa_fwu_component_t *trials,
++        uint8_t number)
++{
++    uint8_t current_state;
++    uint32_t image_bank_offset;
++    uint32_t active_bank_index;
++    uint32_t fwu_image_index;
++    psa_status_t ret;
++
++    FWU_LOG_MSG("%s: enter\n\r", __func__);
++
++
++    /* booted from previous_active_bank, not expected
++     * to receive this call in this state, rather host should
++     * call corstone1000_fwu_select_previous */
++    if (metadata->active_index !=3D priv_metadata->boot_index) {
++        return PSA_ERROR_BAD_STATE;
++    }
++
++    active_bank_index =3D metadata->active_index;
++    metadata->bank_state[active_bank_index] =3D FWU_BANK_ACCEPTED;
++
++    for (int i =3D 0; i < number; i++) {
++
++        if (!is_image_index_valid(trials[i])) {
++            FWU_LOG_MSG("%s: Invalid image index received \n\r", __func=
__);
++            continue;
++        }
++
++        /* it is expected to receive this call only when
++           in trial state */
++        fwu_image_index =3D trials[i] - FWU_FAKE_IMAGES_INDEX_COUNT;
++
++        current_state =3D get_fwu_image_state(metadata, priv_metadata, =
fwu_image_index);
++        if (current_state !=3D PSA_FWU_TRIAL) {
++            return PSA_ERROR_BAD_STATE;
++        }
++
++        metadata->fw_desc.img_entry[fwu_image_index].img_props[active_b=
ank_index].accepted =3D
++                                                            IMAGE_ACCEP=
TED;
++    }
++
++    priv_metadata->boot_attempted =3D 0;
++
++    ret =3D private_metadata_write(priv_metadata);
++    if (ret) {
++        return ret;
++    }
++    metadata->crc_32 =3D crc32((uint8_t *)&metadata->version,
++                              sizeof(struct fwu_metadata) - sizeof(uint=
32_t));
++
++    ret =3D metadata_write_both_replica(metadata);
++    if (ret) {
++        return ret;
++    }
++
++    FWU_LOG_MSG("%s: exit: fwu state is changed to regular, ret - %d\n\=
r", __func__, ret);
++    return ret;
++}
++
++static psa_status_t uint_to_image_version(uint32_t ver_in, psa_fwu_imag=
e_version_t *ver_out)
++{
++    if (!ver_out) {
++        return PSA_ERROR_INVALID_ARGUMENT;
++    }
++
++    ver_out->major =3D (uint8_t)((ver_in >> 24) & 0xF);
++    ver_out->minor =3D (uint8_t)((ver_in >> 16) & 0xF);
++    ver_out->patch =3D (uint16_t)(ver_in & 0xFF);
++    /* There's no room for the build number in the TS */
++    return PSA_SUCCESS;
++}
++
++static void fmp_header_image_info_init()
++{
++    for (int i=3D0; i<FWU_COMPONENT_NUMBER; i++)
++    {
++        fmp_header_image_info[i].fmp_hdr_size_recvd =3D 0;
++	fmp_header_image_info[i].image_size_recvd =3D 0;
++	memset(&fmp_header_image_info[i].fmp_hdr, 0, sizeof(fmp_header_image_i=
nfo[i].fmp_hdr));
++    }
++}
++
++static psa_status_t erase_staging_area(struct fwu_metadata* metadata, p=
sa_fwu_component_t component)
++{
++    if (!metadata) {
++        return PSA_ERROR_INVALID_ARGUMENT;
++    }
++
++    if (!is_image_index_valid(component)) {
++        FWU_LOG_MSG("%s: Invalid Component received \n\r", __func__);
++	return PSA_ERROR_GENERIC_ERROR;
++    }
++
++    uint32_t active_index =3D metadata->active_index;
++    uint32_t bank_offset;
++    uint32_t image_offset;
++    uint8_t fwu_image_index =3D component - FWU_FAKE_IMAGES_INDEX_COUNT=
; /* Decrement to get the correct fwu image index */
++
++    FWU_LOG_MSG("%s: enter\n\r", __func__);
++
++    if (active_index =3D=3D BANK_0) {
++        bank_offset =3D BANK_1_PARTITION_OFFSET;
++    } else if (active_index =3D=3D BANK_1) {
++        bank_offset =3D BANK_0_PARTITION_OFFSET;
++    } else {
++        FWU_LOG_MSG("ERROR: %s: active_index %d\n\r",__func__,active_in=
dex);
++        return PSA_ERROR_GENERIC_ERROR;
++    }
++
++    image_offset =3D bank_offset + fwu_image[fwu_image_index].image_off=
set;
++    if (erase_image(image_offset, fwu_image[fwu_image_index].image_size=
)) {
++        return PSA_ERROR_GENERIC_ERROR;
++    }
++
++    FWU_LOG_MSG("%s: exit: Staging area erased succesfully \n\r", __fun=
c__);
++    return PSA_SUCCESS;
++}
++
++psa_status_t fwu_bootloader_init(void)
++{
++    psa_status_t ret;
++
++    FWU_LOG_MSG("%s: enter\n\r", __func__);
++
++    ret =3D fwu_metadata_init();
++    if (ret) {
++        return ret;
++    }
++
++    /* Initialize the fmp_header_image_info object */
++    fmp_header_image_info_init();
++
++    FWU_LOG_MSG("%s: exit: Initialized\n\r", __func__);
++
++    return PSA_SUCCESS;
++}
++
++psa_status_t fwu_bootloader_staging_area_init(psa_fwu_component_t compo=
nent,
++                                              const void *manifest,
++                                              size_t manifest_size)
++{
++    if (component >=3D FWU_COMPONENT_NUMBER) {
++        return PSA_ERROR_INVALID_ARGUMENT;
++    }
++
++    if (!is_initialized) {
++        return PSA_ERROR_BAD_STATE;
++    }
++
++    psa_status_t ret;
++
++    FWU_LOG_MSG("%s: enter\n\r", __func__);
++
++    Select_Write_Mode_For_Shared_Flash();
++
++    if (metadata_read(&_metadata, 1)) {
++        ret =3D PSA_ERROR_GENERIC_ERROR;
++        goto out;
++    }
++
++    ret =3D erase_staging_area(&_metadata, component);
++
++out:
++    Select_XIP_Mode_For_Shared_Flash();
++
++    FWU_LOG_MSG("%s: exit: ret =3D %d\n\r", __func__, ret);
++    return ret;
++}
++
++psa_status_t parse_fmp_header(psa_fwu_component_t component, const void=
 *block, size_t size)
++{
++    /* Parse the incoming block to make sure complete FMP header is rec=
eived */
++    if (sizeof(fmp_header_image_info[component].fmp_hdr) >=3D (fmp_head=
er_image_info[component].fmp_hdr_size_recvd + size)) {
++        memcpy(&fmp_header_image_info[component].fmp_hdr, block, size);
++        fmp_header_image_info[component].fmp_hdr_size_recvd +=3D size;
++        return PSA_ERROR_INSUFFICIENT_DATA;
++    }
++    if (fmp_header_image_info[component].fmp_hdr_size_recvd !=3D sizeof=
(fmp_header_image_info[component].fmp_hdr)) {
++        memcpy(&fmp_header_image_info[component].fmp_hdr,
++                block,
++                (sizeof(fmp_header_image_info[component].fmp_hdr) - fmp=
_header_image_info[component].fmp_hdr_size_recvd));
++
++        fmp_header_image_info[component].fmp_hdr_size_recvd =3D sizeof(=
fmp_header_image_info[component].fmp_hdr);
++	return PSA_SUCCESS;
++    }
++
++}
++psa_status_t fwu_bootloader_load_image(psa_fwu_component_t component,
++                                       size_t block_offset,
++                                       const void *block,
++                                       size_t block_size)
++{
++
++    if (block =3D=3D NULL) {
++        return PSA_ERROR_INVALID_ARGUMENT;
++    }
++
++    if (!is_initialized) {
++        return PSA_ERROR_BAD_STATE;
++    }
++
++    if (!is_image_index_valid(component)) {
++        FWU_LOG_MSG("%s: Invalid Component received \n\r", __func__);
++        return PSA_ERROR_GENERIC_ERROR;
++    }
++
++    psa_status_t ret;
++    int drv_ret;
++    int image_index;
++    uint32_t bank_offset;
++    uint32_t active_index;
++    uint32_t previous_active_index;
++    uint32_t nr_images;
++    uint32_t current_state;
++    uint32_t image_offset;
++    uint32_t fw_version;
++    uint8_t fwu_image_index =3D component - FWU_FAKE_IMAGES_INDEX_COUNT=
;
++    struct fwu_private_metadata priv_metadata;
++
++    FWU_LOG_MSG("%s: enter: block_offset =3D %u, block =3D 0x%p, block_=
size =3D %u\n\r"
++                , __func__, block_offset, block, block_size);
++
++    /* Parse the incoming block to make sure complete FMP header is rec=
eived */
++    if (fmp_header_image_info[fwu_image_index].fmp_hdr_size_recvd !=3D =
sizeof(fmp_header_image_info[fwu_image_index].fmp_hdr)) {
++        ret =3D parse_fmp_header(fwu_image_index, block, block_size);
++        if(ret =3D=3D PSA_ERROR_INSUFFICIENT_DATA) {
++            return PSA_SUCCESS;
++        }
++        if (ret =3D=3D PSA_SUCCESS) {
++            block_size -=3D fmp_header_image_info[fwu_image_index].fmp_=
hdr_size_recvd;
++	    block +=3D fmp_header_image_info[fwu_image_index].fmp_hdr_size_rec=
vd;
++        }
++    }
++
++    /* Store the version of new firmare */
++    fw_version =3D fmp_header_image_info[fwu_image_index].fmp_hdr.fw_ve=
rsion;
++    FWU_LOG_MSG("%s: Updated info after payload header parsing: block_o=
ffset =3D %u, block =3D 0x%p, block_size =3D %u\n\r"
++                , __func__, block_offset, block, block_size);
++    /* Check if it is the dummy FMP or not */
++    if (!fmp_header_image_info[fwu_image_index].fmp_hdr.header_size)
++    {
++       FWU_LOG_MSG("%s: Dummy FMP received \n\r", __func__);
++       /* Do something for dummy FMP's */
++       return PSA_ERROR_GENERIC_ERROR;
++    }
++
++    /* Write the block containing actual image to flash */
++
++    Select_Write_Mode_For_Shared_Flash();
++
++    if (metadata_read(&_metadata, 1)) {
++        ret =3D  PSA_ERROR_GENERIC_ERROR;
++        goto out;
++    }
++
++    if (private_metadata_read(&priv_metadata)) {
++        ret =3D  PSA_ERROR_GENERIC_ERROR;
++        goto out;
++    }
++
++    active_index =3D _metadata.active_index;
++    FWU_LOG_MSG("FMP version: 0x%d, metadata version : 0x%d\n", fw_vers=
ion,
++                                                                _metada=
ta.fw_desc.img_entry[fwu_image_index].img_props[active_index].version);
++    if (fw_version <=3D
++                _metadata.fw_desc.img_entry[fwu_image_index].img_props[=
active_index].version)
++    {
++	/* Version is extracted from the fmp_payload_header */
++        priv_metadata.fmp_last_attempt_version[fwu_image_index] =3D fmp=
_header_image_info[fwu_image_index].fmp_hdr.fw_version;
++        priv_metadata.fmp_last_attempt_status[fwu_image_index] =3D LAST=
_ATTEMPT_STATUS_ERROR_UNSUCCESSFUL;
++        private_metadata_write(&priv_metadata);
++
++        fmp_set_image_info(&fwu_image[fwu_image_index].image_guid,
++                priv_metadata.fmp_version[fwu_image_index],
++                priv_metadata.fmp_last_attempt_version[fwu_image_index]=
,
++                priv_metadata.fmp_last_attempt_status[fwu_image_index])=
;
++
++        FWU_LOG_MSG("ERROR: %s: version error\n\r",__func__);
++	ret =3D PSA_OPERATION_INCOMPLETE;
++	goto out;
++    }
++
++    if (active_index =3D=3D BANK_0) {
++        previous_active_index =3D BANK_1;
++        bank_offset =3D BANK_1_PARTITION_OFFSET;
++    } else if (active_index =3D=3D BANK_1) {
++        previous_active_index =3D BANK_0;
++        bank_offset =3D BANK_0_PARTITION_OFFSET;
++    } else {
++        FWU_LOG_MSG("ERROR: %s: active_index %d\n\r",__func__,active_in=
dex);
++        return PSA_ERROR_DATA_INVALID;
++    }
++
++    image_offset =3D bank_offset + fwu_image[fwu_image_index].image_off=
set;
++
++    /* Firmware update process can only start in regular state. */
++    current_state =3D get_fwu_image_state(&_metadata, &priv_metadata, f=
wu_image_index);
++    if (current_state !=3D PSA_FWU_READY) {
++        ret =3D  PSA_ERROR_BAD_STATE;
++        goto out;
++    }
++
++    FWU_LOG_MSG("%s: writing image to the flash at offset =3D %u...\n\r=
",
++                      __func__, (image_offset + fmp_header_image_info[f=
wu_image_index].image_size_recvd));
++    drv_ret =3D FWU_METADATA_FLASH_DEV.ProgramData(image_offset + fmp_h=
eader_image_info[fwu_image_index].image_size_recvd, block, block_size);
++    FWU_LOG_MSG("%s: images are written to bank offset =3D %u\n\r", __f=
unc__,
++                     image_offset);
++    if (drv_ret < 0 || drv_ret !=3D block_size) {
++        FWU_LOG_MSG("Flashing image %d is not successful\n\r", componen=
t);
++
++        /* Version is extracted from the fmp_payload_header */
++        priv_metadata.fmp_last_attempt_version[fwu_image_index] =3D fmp=
_header_image_info[fwu_image_index].fmp_hdr.fw_version;
++        priv_metadata.fmp_last_attempt_status[fwu_image_index] =3D LAST=
_ATTEMPT_STATUS_ERROR_UNSUCCESSFUL;
++
++        private_metadata_write(&priv_metadata);
++
++        fmp_set_image_info(&fwu_image[fwu_image_index].image_guid,
++                priv_metadata.fmp_version[fwu_image_index],
++                priv_metadata.fmp_last_attempt_version[fwu_image_index]=
,
++                priv_metadata.fmp_last_attempt_status[fwu_image_index])=
;
++        ret =3D PSA_OPERATION_INCOMPLETE;
++	goto out;
++    }
++    else {
++        ret =3D PSA_SUCCESS;
++    }
++    FWU_LOG_MSG("%s: images are written to bank return status =3D %u\n\=
r", __func__,
++                     ret);
++    fmp_header_image_info[fwu_image_index].image_size_recvd +=3D block_=
size;
++
++out:
++    Select_XIP_Mode_For_Shared_Flash();
++
++    FWU_LOG_MSG("%s: exit: ret =3D %d\n\r", __func__, ret);
++    return ret;
++}
++
++static psa_status_t fwu_update_metadata(const psa_fwu_component_t *cand=
idates, uint8_t number)
++{
++    int ret;
++    uint32_t active_index;
++    uint32_t bank_offset;
++    uint32_t previous_active_index;
++    uint8_t fwu_image_index;
++
++    FWU_LOG_MSG("%s: enter function\n\r", __func__);
++
++    Select_Write_Mode_For_Shared_Flash();
++
++    if (metadata_read(&_metadata, 1)) {
++        ret =3D  PSA_ERROR_GENERIC_ERROR;
++        goto out;
++    }
++    active_index =3D _metadata.active_index;
++
++    if (active_index =3D=3D BANK_0) {
++        previous_active_index =3D BANK_1;
++        bank_offset =3D BANK_1_PARTITION_OFFSET;
++    } else if (active_index =3D=3D BANK_1) {
++        previous_active_index =3D BANK_0;
++        bank_offset =3D BANK_0_PARTITION_OFFSET;
++    } else {
++        FWU_LOG_MSG("ERROR: %s: active_index %d\n\r",__func__,active_in=
dex);
++        ret =3D PSA_ERROR_DATA_INVALID;
++	goto out;
++    }
++
++    _metadata.active_index =3D previous_active_index;
++    _metadata.previous_active_index =3D active_index;
++    _metadata.bank_state[previous_active_index] =3D FWU_BANK_VALID;
++
++    /* Change system state to trial bank state */
++    for (int i =3D 0; i < number; i++) {
++        /* Skip image with index 0 and ESRT image */
++	if(!is_image_index_valid(candidates[i])) {
++            FWU_LOG_MSG("%s: Invalid image index received \n\r", __func=
__);
++            continue;
++        }
++
++        fwu_image_index =3D candidates[i] - FWU_FAKE_IMAGES_INDEX_COUNT=
;
++        _metadata.fw_desc.img_entry[fwu_image_index].img_props[previous=
_active_index].accepted =3D
++                                                        IMAGE_NOT_ACCEP=
TED;
++        _metadata.fw_desc.img_entry[fwu_image_index].img_props[previous=
_active_index].version =3D fmp_header_image_info[fwu_image_index].fmp_hdr=
.fw_version;
++    }
++
++    _metadata.crc_32 =3D crc32((uint8_t *)&_metadata.version,
++                              sizeof(struct fwu_metadata) - sizeof(uint=
32_t));
++
++    ret =3D metadata_write_both_replica(&_metadata);
++    if (ret) {
++        goto out;
++    }
++
++    ret =3D PSA_SUCCESS;
++
++out:
++    Select_XIP_Mode_For_Shared_Flash();
++
++    FWU_LOG_MSG("%s: exit: ret =3D %d\n\r", __func__, ret);
++    return ret;
++}
++
++static psa_status_t copy_image_from_other_bank(int image_index,
++                                               uint32_t active_index,
++                                               uint32_t previous_active=
_index)
++{
++    uint32_t bank_offset[NR_OF_FW_BANKS] =3D {BANK_0_PARTITION_OFFSET, =
BANK_1_PARTITION_OFFSET};
++    uint8_t data[FLASH_CHUNK_SIZE];
++    size_t remaining_size =3D fwu_image[image_index].image_size;
++    size_t data_size;
++    size_t offset_read =3D bank_offset[active_index] + fwu_image[image_=
index].image_offset;
++    size_t offset_write =3D bank_offset[previous_active_index] + fwu_im=
age[image_index].image_offset;
++    int data_transferred_count;
++
++    FWU_LOG_MSG("%s: Enter \n\r", __func__);
++
++    psa_status_t ret =3D erase_image(offset_write, fwu_image[image_inde=
x].image_size);
++    if (ret !=3D PSA_SUCCESS) {
++        FWU_LOG_MSG("%s: ERROR - Flash erase failed for Image: %d\n\r",=
 __func__, image_index);
++        return ret;
++    }
++
++    while(remaining_size > 0) {
++        data_size =3D (remaining_size > FLASH_CHUNK_SIZE) ? FLASH_CHUNK=
_SIZE : remaining_size;
++
++        /* read image data from flash */
++        data_transferred_count =3D FWU_METADATA_FLASH_DEV.ReadData(offs=
et_read, data, data_size);
++        if (data_transferred_count < 0) {
++            FWU_LOG_MSG("%s: ERROR - Flash read failed (ret =3D %d)\n\r=
", __func__, data_transferred_count);
++            return PSA_ERROR_STORAGE_FAILURE;
++        }
++
++        if (data_transferred_count !=3D data_size) {
++            FWU_LOG_MSG("%s: ERROR - Incomplete metadata read (expected=
 %zu, got %d)\n\r",
++                        __func__, data_size, data_transferred_count);
++            return PSA_ERROR_INSUFFICIENT_DATA;
++        }
++
++        offset_read +=3D data_size;
++=09
++        /* write image data to flash */
++        data_transferred_count =3D FWU_METADATA_FLASH_DEV.ProgramData(o=
ffset_write, data, data_size);
++        if (data_transferred_count < 0) {
++            FWU_LOG_MSG("%s: ERROR - Flash read failed (ret =3D %d)\n\r=
", __func__, data_transferred_count);
++            return PSA_ERROR_STORAGE_FAILURE;
++        }
++
++        if (data_transferred_count !=3D data_size) {
++            FWU_LOG_MSG("%s: ERROR - Incomplete metadata write (expecte=
d %zu, written %d)\n\r",
++                        __func__, data_size, data_transferred_count);
++            return PSA_ERROR_INSUFFICIENT_DATA;
++        }
++
++        offset_write +=3D data_size;
++	remaining_size -=3D data_size;
++    }
++
++    FWU_LOG_MSG("%s: exit \n\r", __func__);
++    return PSA_SUCCESS;
++}
++
++static psa_status_t maintain_bank_consistency(void)
++{
++    psa_status_t ret;
++    uint32_t active_index;
++    uint32_t previous_active_index;
++    struct fwu_private_metadata priv_metadata;
++
++    FWU_LOG_MSG("%s: Enter \n\r", __func__);
++    Select_Write_Mode_For_Shared_Flash();
++
++    if (metadata_read(&_metadata, 1) || private_metadata_read(&priv_met=
adata)) {
++        ret =3D  PSA_ERROR_GENERIC_ERROR;
++        goto out;
++    }
++
++    active_index =3D _metadata.active_index;
++    if (active_index =3D=3D BANK_0) {
++        previous_active_index =3D BANK_1;
++    } else if (active_index =3D=3D BANK_1) {
++        previous_active_index =3D BANK_0;
++    } else {
++        FWU_LOG_MSG("ERROR: %s: active_index %d\n\r",__func__,active_in=
dex);
++        ret =3D PSA_ERROR_DATA_INVALID;
++        goto out;
++    }
++
++    for (int i=3D0; i<NR_OF_IMAGES_IN_FW_BANK; i++)
++    {
++        /* Check if image is received from the FWU client */
++        if (fmp_header_image_info[i].image_size_recvd) {
++            continue;
++        }
++
++        ret =3D copy_image_from_other_bank(i, active_index, previous_ac=
tive_index);
++        if(ret) {
++            FWU_LOG_MSG("ERROR: %s: copy_image_from_other_bank failed f=
or Image : %d\n\r",__func__, i);
++       	    return ret;
++	}
++
++        _metadata.fw_desc.img_entry[i].img_props[previous_active_index]=
.version =3D
++         _metadata.fw_desc.img_entry[i].img_props[active_index].version=
;
++        _metadata.fw_desc.img_entry[i].img_props[previous_active_index]=
.accepted =3D IMAGE_ACCEPTED;
++        priv_metadata.fmp_version[i] =3D
++         _metadata.fw_desc.img_entry[i].img_props[previous_active_index=
].version;
++        priv_metadata.fmp_last_attempt_version[i] =3D
++        _metadata.fw_desc.img_entry[i].img_props[previous_active_index]=
.version;
++
++        priv_metadata.fmp_last_attempt_status[i] =3D LAST_ATTEMPT_STATU=
S_SUCCESS;
++
++        ret =3D private_metadata_write(&priv_metadata);
++        if (ret) {
++            goto out;
++        }
++
++        _metadata.crc_32 =3D crc32((uint8_t *)&_metadata.version,
++                                  sizeof(struct fwu_metadata) - sizeof(=
uint32_t));
++
++        ret =3D metadata_write_both_replica(&_metadata);
++        if (ret) {
++            goto out;
++        }
++
++    }
++    ret =3D PSA_SUCCESS;
++
++out:
++    Select_XIP_Mode_For_Shared_Flash();
++    FWU_LOG_MSG("%s: exit: ret =3D %d\n\r", __func__, ret);
++    return ret;
++
++}
++
++psa_status_t fwu_bootloader_install_image(const psa_fwu_component_t *ca=
ndidates, uint8_t number)
++{
++    if (!candidates) {
++        return PSA_ERROR_INVALID_ARGUMENT;
++    }
++    if (!is_initialized) {
++        return PSA_ERROR_BAD_STATE;
++    }
++
++    psa_status_t ret;
++    FWU_LOG_MSG("%s: enter function\n\r", __func__);
++
++    /* Copy images from other bank which are not received by FWU client=
 */
++    ret =3D maintain_bank_consistency();
++    if(ret) {
++        FWU_LOG_MSG("%s: ERROR: Copying images from other bank failed, =
ret =3D %d\n\r", __func__, ret);
++        return PSA_ERROR_INSUFFICIENT_DATA;
++    }
++
++    /* Update the metadata */
++    ret =3D fwu_update_metadata(candidates, number);
++
++    if (ret =3D=3D PSA_SUCCESS) {
++        is_installed =3D true;
++    }
++
++    FWU_LOG_MSG("%s: exit: ret =3D %d\n\r", __func__, ret);
++    return ret;
++}
++
++psa_status_t fwu_bootloader_mark_image_accepted(const psa_fwu_component=
_t *trials,
++                                                uint8_t number)
++{   =20
++    if (!trials) {
++        return PSA_ERROR_INVALID_ARGUMENT;
++    }
++
++    if (!is_initialized) {
++        return PSA_ERROR_BAD_STATE;
++    }
++
++    psa_status_t ret;
++    struct fwu_private_metadata priv_metadata;
++    uint8_t current_state;
++    uint8_t fwu_image_index;
++
++    FWU_LOG_MSG("%s: enter\n\r", __func__);
++
++    Select_Write_Mode_For_Shared_Flash();
++
++    /* This cannot be added to the fwu_metadata_init() because that fun=
ction is
++     * called before the logging is enabled by TF-M. */
++    ret =3D fwu_metadata_check_and_correct_integrity();
++    if (ret !=3D PSA_SUCCESS) {
++        FWU_LOG_MSG("fwu_metadata_check_and_correct_integrity failed\r\=
n");
++        return ret;
++    }
++
++    if (metadata_read(&_metadata, 1)) {
++        ret =3D PSA_ERROR_GENERIC_ERROR;
++        goto out;
++    }
++
++    if (private_metadata_read(&priv_metadata)) {
++        ret =3D PSA_ERROR_GENERIC_ERROR;
++        goto out;
++    }
++
++    /* firmware update successful */
++    for (int i =3D 0; i < number; i++) {
++	if(!is_image_index_valid(trials[i])) {
++            FWU_LOG_MSG("%s: Invalid image index received \n\r", __func=
__);
++            continue;
++        }
++
++        fwu_image_index =3D trials[i] - FWU_FAKE_IMAGES_INDEX_COUNT;
++
++        current_state =3D get_fwu_image_state(&_metadata, &priv_metadat=
a, fwu_image_index);
++        if (current_state =3D=3D PSA_FWU_READY) {
++            fmp_set_image_info(&fwu_image[fwu_image_index].image_guid,
++                    priv_metadata.fmp_version[fwu_image_index],
++                    priv_metadata.fmp_last_attempt_version[fwu_image_in=
dex],
++                    priv_metadata.fmp_last_attempt_status[fwu_image_ind=
ex]);
++            continue;
++
++        } else if (current_state !=3D PSA_FWU_TRIAL) {
++            FWU_ASSERT(0);
++        }
++
++        priv_metadata.fmp_version[fwu_image_index] =3D
++         _metadata.fw_desc.img_entry[fwu_image_index].img_props[_metada=
ta.active_index].version;
++        priv_metadata.fmp_last_attempt_version[fwu_image_index] =3D
++        _metadata.fw_desc.img_entry[fwu_image_index].img_props[_metadat=
a.active_index].version;
++
++        priv_metadata.fmp_last_attempt_status[fwu_image_index] =3D LAST=
_ATTEMPT_STATUS_SUCCESS;
++    }
++
++    ret =3D fwu_accept_image(&_metadata,
++                            &priv_metadata, trials, number);
++    if (!ret) {
++        ret =3D update_nv_counters(&priv_metadata);
++    }
++
++    if (ret =3D=3D PSA_SUCCESS) {
++        disable_host_ack_timer();
++        for(int i =3D 0; i < number; i++) {
++
++            if(!is_image_index_valid(trials[i])) {
++                FWU_LOG_MSG("%s: Invalid image index received \n\r", __=
func__);
++                continue;
++            }
++
++            fwu_image_index =3D trials[i] - FWU_FAKE_IMAGES_INDEX_COUNT=
;
++            fmp_set_image_info(&fwu_image[fwu_image_index].image_guid,
++                    priv_metadata.fmp_version[fwu_image_index],
++                    priv_metadata.fmp_last_attempt_version[fwu_image_in=
dex],
++                    priv_metadata.fmp_last_attempt_status[fwu_image_ind=
ex]);
++        }
++    }
++
++out:
++    Select_XIP_Mode_For_Shared_Flash();
++    FWU_LOG_MSG("%s: exit: ret =3D %d\n\r", __func__, ret);
++    return ret;
++}
++
++/* Reject the staged image. */
++psa_status_t fwu_bootloader_reject_staged_image(psa_fwu_component_t com=
ponent)
++{
++
++    if (!is_image_index_valid(component)) {
++        FWU_LOG_MSG("%s: Invalid image index received \n\r", __func__);
++        return PSA_ERROR_INVALID_ARGUMENT;
++    }
++
++    if (!is_initialized) {
++        return PSA_ERROR_BAD_STATE;
++    }
++
++    int ret;
++    uint32_t active_index;;
++    uint32_t bank_offset;
++    uint32_t image_offset;
++    uint8_t image_index =3D component - FWU_FAKE_IMAGES_INDEX_COUNT;   =
 /* Decrement to get the correct fwu image index */
++
++    FWU_LOG_MSG("%s: enter\n\r", __func__);
++    Select_Write_Mode_For_Shared_Flash();
++
++    if (metadata_read(&_metadata, 1)) {
++        ret =3D  PSA_ERROR_GENERIC_ERROR;
++        goto out;
++    }
++    active_index =3D _metadata.active_index;
++
++    if (active_index =3D=3D BANK_0) {
++        bank_offset =3D BANK_1_PARTITION_OFFSET;
++    } else if (active_index =3D=3D BANK_1) {
++        bank_offset =3D BANK_0_PARTITION_OFFSET;
++    } else {
++        FWU_LOG_MSG("ERROR: %s: active_index %d\n\r",__func__,active_in=
dex);
++        ret =3D PSA_ERROR_GENERIC_ERROR;
++	goto out;
++    }
++
++    image_offset =3D bank_offset + fwu_image[image_index].image_offset;
++
++    if (erase_image(image_offset, fwu_image[image_index].image_size)) {
++        return PSA_ERROR_GENERIC_ERROR;
++    }
++
++out:
++    Select_XIP_Mode_For_Shared_Flash();
++    FWU_LOG_MSG("%s: exit: ret =3D %d\n\r", __func__, ret);
++    return ret;
++}
++
++/* Reject the running image in trial state. */
++psa_status_t fwu_bootloader_reject_trial_image(psa_fwu_component_t comp=
onent)
++{
++
++    if (!is_image_index_valid(component)) {
++        FWU_LOG_MSG("%s: Invalid image index received \n\r", __func__);
++        return PSA_ERROR_INVALID_ARGUMENT;
++    }
++
++    struct fwu_private_metadata priv_metadata;
++    int ret;
++    uint8_t fwu_image_index =3D component - FWU_FAKE_IMAGES_INDEX_COUNT=
;    /* Decrement to get the correct fwu image index */
++
++    FWU_LOG_MSG("%s: enter\n\r", __func__);
++
++    /* Disable host ackowledgement timer */
++    disable_host_ack_timer();
++
++    /* Update the metadata active index to previous active index as tri=
al images have been rejected */
++
++    Select_Write_Mode_For_Shared_Flash();
++    if (metadata_read(&_metadata, 1) || private_metadata_read(&priv_met=
adata)) {
++        ret =3D  PSA_ERROR_GENERIC_ERROR;
++        goto out;
++    }
++    priv_metadata.fmp_last_attempt_version[fwu_image_index] =3D
++     _metadata.fw_desc.img_entry[fwu_image_index].img_props[_metadata.a=
ctive_index].version;
++
++    priv_metadata.fmp_last_attempt_status[fwu_image_index] =3D LAST_ATT=
EMPT_STATUS_ERROR_UNSUCCESSFUL;
++
++    ret =3D fwu_select_previous(&_metadata, &priv_metadata);
++
++out:
++    Select_XIP_Mode_For_Shared_Flash();
++    FWU_LOG_MSG("%s: exit: ret =3D %d\n\r", __func__, ret);
++    return ret;
++}
++
++psa_status_t fwu_bootloader_abort(psa_fwu_component_t component)
++{
++    /* Not to be implemented as PSA FWU Trusted-Services is not using t=
his function */
++    return PSA_SUCCESS;
++}
++
++psa_status_t fwu_bootloader_get_image_info(psa_fwu_component_t componen=
t,
++                                           bool query_state,
++                                           bool query_impl_info,
++                                           psa_fwu_component_info_t *in=
fo)
++{
++    if (component >=3D FWU_COMPONENT_NUMBER) {
++        return PSA_ERROR_INVALID_ARGUMENT;
++    }
++
++    /* Skipping image at 0th index=20
++     * The image index in the capsule starts from 1=20
++     */
++    if (!component) {
++        if(query_state)
++            info->state =3D PSA_FWU_READY;
++        return PSA_SUCCESS;
++    }
++
++    struct fwu_private_metadata priv_metadata;
++    uint32_t version;
++    uint8_t fwu_image_index =3D component - 1;
++    uint8_t current_state;
++    psa_status_t ret;
++
++    FWU_LOG_MSG("%s: enter\n\r", __func__);
++
++
++    Select_Write_Mode_For_Shared_Flash();
++    if (private_metadata_read(&priv_metadata)) {
++        ret =3D PSA_ERROR_GENERIC_ERROR;
++        goto out;
++    }
++
++    if (metadata_read(&_metadata, 1)) {
++        ret =3D PSA_ERROR_GENERIC_ERROR;
++        goto out;
++    }
++
++    if (component =3D=3D FWU_IMAGE_INDEX_ESRT) {
++
++        size_t esrt_size =3D TFM_FWU_MAX_DIGEST_SIZE;
++        if (TFM_FWU_MAX_DIGEST_SIZE > sizeof(struct fwu_esrt_data_wrapp=
er))
++            esrt_size =3D sizeof(struct fwu_esrt_data_wrapper);
++
++        /* Populate the ESRT */
++        ret =3D get_esrt_data(&esrt);
++        if (ret) {
++            FWU_LOG_MSG("%s: ERROR : Unable to populate ESRT \n\r", __f=
unc__);
++	    goto out;
++        }
++
++        memcpy(&info->impl.candidate_digest, &esrt, esrt_size);
++	if (query_state) {
++            info->state =3D PSA_FWU_READY;
++        }
++    }
++    else {
++        current_state =3D get_fwu_image_state(&_metadata, &priv_metadat=
a, fwu_image_index);
++        if (query_state) {
++            info->state =3D current_state;
++        }
++
++        /* Fill the other required fields for component */
++        info->max_size =3D fwu_image[fwu_image_index].image_size;
++
++        version =3D _metadata.fw_desc.img_entry[fwu_image_index].img_pr=
ops[_metadata.active_index].version;
++        ret =3D uint_to_image_version(version, &info->version);
++        if (ret) {
++            FWU_LOG_MSG("%s: ERROR : Image version not found \n\r", __f=
unc__);
++            goto out;
++        }
++    }
++
++out:
++    Select_XIP_Mode_For_Shared_Flash();
++    FWU_LOG_MSG("%s: exit: ret =3D %d\n\r", __func__, ret);
++    return ret;
++}
++
++psa_status_t fwu_bootloader_clean_component(psa_fwu_component_t compone=
nt)
++{
++    return PSA_SUCCESS;
++}
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_f=
mp.c b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/uefi_fmp.c
+similarity index 66%
+rename from platform/ext/target/arm/corstone1000/fw_update_agent/uefi_fm=
p.c
+rename to platform/ext/target/arm/corstone1000/bootloader/mcuboot/uefi_f=
mp.c
+index 896658995..30956a440 100644
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_fmp.c
++++ b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/uefi_fmp.c
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2022-2024, Arm Limited. All rights reserved.
++ * Copyright (c) 2022-2025, Arm Limited. All rights reserved.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  *
+@@ -9,11 +9,12 @@
+ #include <stdbool.h>
+ #include "tfm_hal_device_header.h"
+ #include "uefi_fmp.h"
++#include "flash_layout.h"
+=20
+ /* The count will increase when partial update is supported.
+  * At present, only full WIC is considered as updatable image.
+  */
+-#define NUMBER_OF_FMP_IMAGES 1
++#define NUMBER_OF_FMP_IMAGES    NR_OF_IMAGES_IN_FW_BANK
+ #define NO_OF_FMP_VARIABLES_PER_IMAGE   6
+=20
+ #define UEFI_ARCHITECTURE_64
+@@ -74,18 +75,41 @@ typedef __PACKED_STRUCT {
+     uint32_t ImageVersionNameSize;
+ } EFI_FIRMWARE_MANAGEMENT_PROTOCOL_IMAGE_INFO;
+=20
+-
+-static uint16_t corstone_image_name0[] =3D { 'C', 'O', 'R', 'S', 'T', '=
O', 'N', 'E', '1', '0', '0', '0', '_', 'W', 'I', 'C', '\0' };
+-static uint16_t corstone_version_name0[] =3D { 'C', 'O', 'R', 'S', 'T',=
 'O', 'N', 'E', '1', '0', '0', '0', '_', 'B', 'E', 'S', 'T', '\0'};
+-
++struct corstone_image_info {
++    uint8_t corstone_image_name[50];
++    uint8_t corstone_version_name[50];
++} __packed;
++
++/* Change image names and version name when partial update is implement=
ed */
++struct corstone_image_info image_info[NUMBER_OF_FMP_IMAGES] =3D {
++    {
++        { 'C', 'O', 'R', 'S', 'T', 'O', 'N', 'E', '1', '0', '0', '0', '=
_', 'W', 'I', 'C', '\0' },
++	{ 'C', 'O', 'R', 'S', 'T', 'O', 'N', 'E', '1', '0', '0', '0', '_', 'B'=
, 'E', 'S', 'T', '\0'},
++    },
++    {
++        { 'C', 'O', 'R', 'S', 'T', 'O', 'N', 'E', '1', '0', '0', '0', '=
_', 'W', 'I', 'C', '\0' },
++	{ 'C', 'O', 'R', 'S', 'T', 'O', 'N', 'E', '1', '0', '0', '0', '_', 'B'=
, 'E', 'S', 'T', '\0'},
++    },
++    {
++        { 'C', 'O', 'R', 'S', 'T', 'O', 'N', 'E', '1', '0', '0', '0', '=
_', 'W', 'I', 'C', '\0' },
++	{ 'C', 'O', 'R', 'S', 'T', 'O', 'N', 'E', '1', '0', '0', '0', '_', 'B'=
, 'E', 'S', 'T', '\0'},
++    },
++    {
++        { 'C', 'O', 'R', 'S', 'T', 'O', 'N', 'E', '1', '0', '0', '0', '=
_', 'W', 'I', 'C', '\0' },
++	{ 'C', 'O', 'R', 'S', 'T', 'O', 'N', 'E', '1', '0', '0', '0', '_', 'B'=
, 'E', 'S', 'T', '\0'},
++    },
++};
+ static EFI_FIRMWARE_MANAGEMENT_PROTOCOL_IMAGE_INFO fmp_info[NUMBER_OF_F=
MP_IMAGES];
+=20
+-extern struct efi_guid full_capsule_image_guid;
++extern fwu_bank_image_info_t fwu_image[];
+=20
+ static bool is_fmp_info_initialized =3D false;
+=20
+ static void init_fmp_info(void)
+ {
++    if(is_fmp_info_initialized) {
++        return;
++    }
+     memset(fmp_info, 0,
+      sizeof(EFI_FIRMWARE_MANAGEMENT_PROTOCOL_IMAGE_INFO) * NUMBER_OF_FM=
P_IMAGES);
+=20
+@@ -93,42 +117,44 @@ static void init_fmp_info(void)
+      * Add further details when partial image is supported.
+      */
+=20
+-    fmp_info[0].DescriptorVersion =3D 4;
+-    fmp_info[0].DescriptorCount =3D NUMBER_OF_FMP_IMAGES;
+-    fmp_info[0].DescriptorsSize =3D
+-                 sizeof(EFI_FIRMWARE_IMAGE_DESCRIPTOR) +
+-                 sizeof(corstone_image_name0) + sizeof(corstone_version=
_name0);
+-
+-    fmp_info[0].ImageDescriptor.ImageIndex =3D 1;
+-
+-    memcpy(&fmp_info[0].ImageDescriptor.ImageTypeId, &full_capsule_imag=
e_guid,
+-            sizeof(struct efi_guid));
+-
+-    fmp_info[0].ImageDescriptor.ImageId =3D 1;
+-    fmp_info[0].ImageDescriptor.Version =3D FWU_IMAGE_INITIAL_VERSION;
+-    fmp_info[0].ImageDescriptor.AttributesSupported =3D 1;
+-    fmp_info[0].ImageDescriptor.AttributesSetting =3D (
+-            IMAGE_ATTRIBUTE_IMAGE_UPDATABLE | IMAGE_ATTRIBUTE_RESET_REQ=
UIRED);
+-    fmp_info[0].ImageDescriptor.LowestSupportedImageVersion =3D
+-            FWU_IMAGE_INITIAL_VERSION;
+-    fmp_info[0].ImageDescriptor.LastAttemptVersion =3D FWU_IMAGE_INITIA=
L_VERSION;
+-    fmp_info[0].ImageDescriptor.LastAttemptStatus =3D LAST_ATTEMPT_STAT=
US_SUCCESS;
+-
+-    fmp_info[0].ImageName =3D corstone_image_name0;
+-    fmp_info[0].ImageNameSize =3D sizeof(corstone_image_name0);
+-    fmp_info[0].ImageVersionName =3D corstone_version_name0;
+-    fmp_info[0].ImageVersionNameSize =3D sizeof(corstone_version_name0)=
;
+-
++    for (int i =3D 0; i < NUMBER_OF_FMP_IMAGES; i++)
++    {
++        fmp_info[i].DescriptorVersion =3D 4;
++        fmp_info[i].DescriptorCount =3D NUMBER_OF_FMP_IMAGES;
++        fmp_info[i].DescriptorsSize =3D
++                     sizeof(EFI_FIRMWARE_IMAGE_DESCRIPTOR) +
++                     sizeof(image_info[i].corstone_image_name) + sizeof=
(image_info[i].corstone_version_name);
++
++        fmp_info[i].ImageDescriptor.ImageIndex =3D i+1;
++
++        memcpy(&fmp_info[i].ImageDescriptor.ImageTypeId, &fwu_image[i].=
image_guid,
++                sizeof(struct efi_guid));
++
++        fmp_info[i].ImageDescriptor.ImageId =3D i+1;
++        fmp_info[i].ImageDescriptor.Version =3D FWU_IMAGE_INITIAL_VERSI=
ON;
++        fmp_info[i].ImageDescriptor.AttributesSupported =3D 1;
++        fmp_info[i].ImageDescriptor.AttributesSetting =3D (
++                IMAGE_ATTRIBUTE_IMAGE_UPDATABLE | IMAGE_ATTRIBUTE_RESET=
_REQUIRED);
++        fmp_info[i].ImageDescriptor.LowestSupportedImageVersion =3D
++                FWU_IMAGE_INITIAL_VERSION;
++        fmp_info[i].ImageDescriptor.LastAttemptVersion =3D FWU_IMAGE_IN=
ITIAL_VERSION;
++        fmp_info[i].ImageDescriptor.LastAttemptStatus =3D LAST_ATTEMPT_=
STATUS_SUCCESS;
++
++        fmp_info[i].ImageName =3D image_info[i].corstone_image_name;
++        fmp_info[i].ImageNameSize =3D sizeof(image_info[i].corstone_ima=
ge_name);
++        fmp_info[i].ImageVersionName =3D image_info[i].corstone_version=
_name;
++        fmp_info[i].ImageVersionNameSize =3D sizeof(image_info[i].corst=
one_version_name);
++    }
+     is_fmp_info_initialized =3D true;
+=20
+     return;
+ }
+=20
+-enum fwu_agent_error_t fmp_set_image_info(struct efi_guid *guid,
++psa_status_t fmp_set_image_info(struct efi_guid *guid,
+                      uint32_t current_version, uint32_t attempt_version=
,
+                      uint32_t last_attempt_status)
+ {
+-    enum fwu_agent_error_t status =3D FWU_AGENT_ERROR;
++    psa_status_t status =3D PSA_ERROR_GENERIC_ERROR;
+=20
+     FWU_LOG_MSG("%s:%d Enter\n\r", __func__, __LINE__);
+=20
+@@ -149,7 +175,7 @@ enum fwu_agent_error_t fmp_set_image_info(struct efi=
_guid *guid,
+                             "version=3D%u last_attempt_version=3D%u.\n\=
r",
+                             last_attempt_status, current_version,
+                             attempt_version);
+-            status =3D FWU_AGENT_SUCCESS;
++            status =3D PSA_SUCCESS;
+             break;
+         }
+     }
+@@ -161,7 +187,7 @@ enum fwu_agent_error_t fmp_set_image_info(struct efi=
_guid *guid,
+=20
+ #define NO_OF_FMP_VARIABLES    (NUMBER_OF_FMP_IMAGES * NO_OF_FMP_VARIAB=
LES_PER_IMAGE)
+=20
+-static enum fwu_agent_error_t pack_image_info(void *buffer, uint32_t si=
ze)
++static psa_status_t pack_image_info(void *buffer, uint32_t size)
+ {
+     typedef __PACKED_STRUCT {
+         uint32_t variable_count;
+@@ -178,7 +204,7 @@ static enum fwu_agent_error_t pack_image_info(void *=
buffer, uint32_t size)
+=20
+     if (size < current_size) {
+         FWU_LOG_MSG("%s:%d Buffer too small.\n\r", __func__, __LINE__);
+-        return FWU_AGENT_ERROR;
++        return PSA_ERROR_INVALID_ARGUMENT;
+     }
+=20
+     packed_buffer->variable_count =3D NO_OF_FMP_VARIABLES;
+@@ -201,7 +227,7 @@ static enum fwu_agent_error_t pack_image_info(void *=
buffer, uint32_t size)
+=20
+        if (size < current_size) {
+            FWU_LOG_MSG("%s:%d Buffer too small.\n\r", __func__, __LINE_=
_);
+-           return FWU_AGENT_ERROR;
++           return PSA_ERROR_BUFFER_TOO_SMALL;
+        }
+=20
+        FWU_LOG_MSG("%s:%d ImageInfo size =3D %u, ImageName size =3D %u,=
 "
+@@ -222,12 +248,12 @@ static enum fwu_agent_error_t pack_image_info(void=
 *buffer, uint32_t size)
+=20
+     }
+=20
+-    return FWU_AGENT_SUCCESS;
++    return PSA_SUCCESS;
+ }
+=20
+-enum fwu_agent_error_t fmp_get_image_info(void *buffer, uint32_t size)
++psa_status_t fmp_get_image_info(void *buffer, uint32_t size)
+ {
+-    enum fwu_agent_error_t status;
++    psa_status_t status;
+=20
+     FWU_LOG_MSG("%s:%d Enter\n\r", __func__, __LINE__);
+=20
+@@ -237,4 +263,3 @@ enum fwu_agent_error_t fmp_get_image_info(void *buff=
er, uint32_t size)
+=20
+     return status;
+ }
+-
+diff --git a/platform/ext/target/arm/corstone1000/bootloader/tfm_bootloa=
der_fwu_abstraction.h b/platform/ext/target/arm/corstone1000/bootloader/t=
fm_bootloader_fwu_abstraction.h
+new file mode 100644
+index 000000000..571f61be3
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/bootloader/tfm_bootloader_fwu=
_abstraction.h
+@@ -0,0 +1,189 @@
++/*
++ * Copyright (c) 2021-2022, Arm Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#ifndef __TFM_BOOTLOADER_FWU_ABSTRACTION_H__
++#define __TFM_BOOTLOADER_FWU_ABSTRACTION_H__
++
++#include "stdbool.h"
++#include "psa/update.h"
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++/**
++ * Bootloader related initialization for firmware update, such as readi=
ng
++ * some necessary shared data from the memory if needed.
++ *
++ * \return PSA_SUCCESS              On success
++ *         PSA_ERROR_GENERIC_ERROR  On failure
++ */
++psa_status_t fwu_bootloader_init(void);
++
++/**
++ * \brief Initialize the staging area of the component.
++ *
++ * The component is in READY state. Prepare the staging area of the com=
ponent
++ * for image download.
++ * For example, initialize the staging area, open the flash area, and s=
o on.
++ * The image will be written into the staging area later.
++ *
++ * \param[in] component The identifier of the target component in bootl=
oader.
++ * \param[in] manifest  A pointer to a buffer containing a detached man=
ifest for
++ *                      the update. If the manifest is bundled with the=
 firmware
++ *                      image, manifest must be NULL.
++ * \param[in] manifest_size  Size of the manifest buffer in bytes.
++ *
++ * \return PSA_SUCCESS                  On success
++ *         PSA_ERROR_INVALID_SIGNATURE  A signature or integrity check =
on the
++ *                                      manifest has failed.
++ *         PSA_ERROR_INVALID_ARGUMENT   Invalid input parameter
++ *         PSA_ERROR_INSUFFICIENT_MEMORY
++ *         PSA_ERROR_INSUFFICIENT_STORAGE
++ *         PSA_ERROR_COMMUNICATION_FAILURE
++ *         PSA_ERROR_STORAGE_FAILURE
++ *
++ */
++psa_status_t fwu_bootloader_staging_area_init(psa_fwu_component_t compo=
nent,
++                                              const void *manifest,
++                                              size_t manifest_size);
++
++/**
++ * \brief Load the image into the target component.
++ *
++ * The component is in WRITING state. Write the image data into the tar=
get
++ * component.
++ *
++ * \param[in] component The identifier of the target component in bootl=
oader.
++ * \param[in] image_offset  The offset of the image being passed into b=
lock, in
++ *                          bytes
++ * \param[in] block         A buffer containing a block of image data. =
This
++ *                          might be a complete image or a subset.
++ * \param[in] block_size    Size of block.
++ *
++ * \return PSA_SUCCESS                     On success
++ *         PSA_ERROR_INVALID_ARGUMENT      Invalid input parameter
++ *         PSA_ERROR_INSUFFICIENT_MEMORY   There is no enough memory to
++ *                                         process the update
++ *         PSA_ERROR_INSUFFICIENT_STORAGE  There is no enough storage t=
o
++ *                                         process the update
++ *         PSA_ERROR_GENERIC_ERROR         A fatal error occurred
++ *
++ */
++psa_status_t fwu_bootloader_load_image(psa_fwu_component_t component,
++                                       size_t image_offset,
++                                       const void *block,
++                                       size_t block_size);
++
++/**
++ * \brief Starts the installation of an image.
++ *
++ * The components are in CANDIDATE state. Check the authenticity and in=
tegrity of
++ * the staged image in the components. If a reboot is required to compl=
ete the
++ * check, then mark this image as a candidate so that the next time boo=
tloader
++ * runs it will take this image as a candidate one to bootup. Return th=
e error
++ * code PSA_SUCCESS_REBOOT.
++ *
++ * \param[in] candidates A list of components in CANDIDATE state.
++ * \param[in] number Number of components in CANDIDATE state.
++ *
++ * \return PSA_SUCCESS         On success
++ *         PSA_SUCCESS_REBOOT  A system reboot is needed to finish inst=
allation
++ *         TFM_SUCCESS_RESTART A restart of the updated component is re=
quired
++ *                             to complete the update
++ *         PSA_ERROR_DEPENDENCY_NEEDED Another image needs to be instal=
led to
++ *                                       finish installation
++ *         PSA_ERROR_INVALID_ARGUMENT    Invalid input parameter
++ *         PSA_ERROR_INVALID_SIGNATURE   The signature is incorrect
++ *         PSA_ERROR_GENERIC_ERROR       A fatal error occurred
++ *         TFM_ERROR_ROLLBACK_DETECTED   The image is too old to be ins=
talled.
++ *                                       If the image metadata contains=
 a
++ *                                       timestamp and it has expired, =
then
++ *                                       this error is also returned.
++ */
++psa_status_t fwu_bootloader_install_image(const psa_fwu_component_t *ca=
ndidates,
++                                          uint8_t number);
++
++/**
++ * \brief Mark the TRIAL(running) image in component as confirmed.
++ *
++ * Call this API to mark the running images as permanent/accepted to av=
oid
++ * revert when next time bootup. Usually, this API is called after the =
running
++ * images have been verified as valid.
++ *
++ * \param[in] candidates A list of components in TRIAL state.
++ * \param[in] number Number of components in TRIAL state.
++ *
++ * \return PSA_SUCCESS         On success
++ *         PSA_ERROR_INSUFFICIENT_MEMORY
++ *         PSA_ERROR_INSUFFICIENT_STORAGE
++ *         PSA_ERROR_COMMUNICATION_FAILURE
++ *         PSA_ERROR_STORAGE_FAILURE
++ */
++psa_status_t fwu_bootloader_mark_image_accepted(const psa_fwu_component=
_t *trials,
++                                                uint8_t number);
++
++/**
++ * \brief Uninstall the staged image in the component.
++ *
++ * The component is in STAGED state. Uninstall the staged image in the =
component
++ * so that this image will not be treated as a candidate next time boot=
up.
++ *
++ * \return PSA_SUCCESS         On success
++ *         PSA_ERROR_INSUFFICIENT_MEMORY
++ *         PSA_ERROR_INSUFFICIENT_STORAGE
++ *         PSA_ERROR_COMMUNICATION_FAILURE
++ *         PSA_ERROR_STORAGE_FAILURE
++ */
++psa_status_t fwu_bootloader_reject_staged_image(psa_fwu_component_t com=
ponent);
++
++/**
++ * \brief Reject the trial image in the component.
++ *
++ * The component is in TRIAL state. Mark the running image in the compo=
nent as
++ * rejected.
++ *
++ * \return PSA_SUCCESS         On success
++ *         PSA_ERROR_INSUFFICIENT_MEMORY
++ *         PSA_ERROR_INSUFFICIENT_STORAGE
++ *         PSA_ERROR_COMMUNICATION_FAILURE
++ *         PSA_ERROR_STORAGE_FAILURE
++ */
++psa_status_t fwu_bootloader_reject_trial_image(psa_fwu_component_t comp=
onent);
++
++/**
++ * \brief The component is in FAILED or UPDATED state. Clean the stagin=
g area of the component.
++ *
++ * \return PSA_SUCCESS         On success
++ *         PSA_ERROR_INVALID_ARGUMENT    Invalid input parameter
++ *         PSA_ERROR_STORAGE_FAILURE
++ */
++psa_status_t fwu_bootloader_clean_component(psa_fwu_component_t compone=
nt);
++
++/**
++ * \brief Get the image information.
++ *
++ * Get the image information of the given component in staging area
++ * or the running area.
++ *
++ * \param[in] component  The identifier of the target component in boot=
loader.
++ * \param[in] query_state  Query 'state' field.
++ * \param[in] query_impl_info  Query 'impl' field.
++ * \param[out] info      Buffer containing return the component informa=
tion.
++
++ * \return PSA_SUCCESS         On success
++ *         PSA_ERROR_INVALID_ARGUMENT    Invalid input parameter
++ *         PSA_ERROR_GENERIC_ERROR       A fatal error occurred
++ */
++psa_status_t fwu_bootloader_get_image_info(psa_fwu_component_t componen=
t,
++                                           bool query_state,
++                                           bool query_impl_info,
++                                           psa_fwu_component_info_t *in=
fo);
++#ifdef __cplusplus
++}
++#endif
++#endif /* __TFM_BOOTLOADER_FWU_ABSTRACTION_H__ */
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_f=
mp.h b/platform/ext/target/arm/corstone1000/bootloader/uefi_fmp.h
+similarity index 89%
+rename from platform/ext/target/arm/corstone1000/fw_update_agent/uefi_fm=
p.h
+rename to platform/ext/target/arm/corstone1000/bootloader/uefi_fmp.h
+index d876bd7cf..a555d851f 100644
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_fmp.h
++++ b/platform/ext/target/arm/corstone1000/bootloader/uefi_fmp.h
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2022, Arm Limited. All rights reserved.
++ * Copyright (c) 2022, 2025, Arm Limited. All rights reserved.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  *
+@@ -40,7 +40,7 @@
+  * attempt_version: attempted versions for the image
+  *
+  */
+-enum fwu_agent_error_t fmp_set_image_info(struct efi_guid *guid,
++psa_status_t fmp_set_image_info(struct efi_guid *guid,
+                      uint32_t current_version, uint32_t attempt_version=
,
+                      uint32_t last_attempt_status);
+=20
+@@ -51,6 +51,5 @@ enum fwu_agent_error_t fmp_set_image_info(struct efi_g=
uid *guid,
+  * size : size of the buffer
+  *
+  */
+-enum fwu_agent_error_t fmp_get_image_info(void *buffer, uint32_t size);
+-
++psa_status_t fmp_get_image_info(void *buffer, uint32_t size);
+ #endif /* UEFI_FMP_H */
+diff --git a/platform/ext/target/arm/corstone1000/config.cmake b/platfor=
m/ext/target/arm/corstone1000/config.cmake
+index 1ba43a006..108d16f57 100644
+--- a/platform/ext/target/arm/corstone1000/config.cmake
++++ b/platform/ext/target/arm/corstone1000/config.cmake
+@@ -1,5 +1,5 @@
+ #----------------------------------------------------------------------=
---------
+-# Copyright (c) 2020-2023, Arm Limited. All rights reserved.
++# Copyright (c) 2020-2023, 2025, Arm Limited. All rights reserved.
+ # Copyright (c) 2022 Cypress Semiconductor Corporation (an Infineon com=
pany)
+ # or an affiliate of Cypress Semiconductor Corporation. All rights rese=
rved.
+ #
+@@ -60,6 +60,9 @@ set(TFM_PARTITION_FIRMWARE_UPDATE         ON        CA=
CHE BOOL      "Enable firm
+ set(PLATFORM_HAS_FIRMWARE_UPDATE_SUPPORT ON         CACHE BOOL      "Wh=
eter the platform has firmware update support")
+ set(MCUBOOT_DATA_SHARING                 ON         CACHE BOOL      "En=
able Data Sharing")
+ set(TFM_FWU_BOOTLOADER_LIB                "${CMAKE_CURRENT_LIST_DIR}/bo=
otloader/mcuboot"   CACHE STRING    "Bootloader configure file for Firmwa=
re Update partition")
++set(TFM_CONFIG_FWU_MAX_MANIFEST_SIZE      0         CACHE STRING    "Th=
e maximum permitted size for manifest in psa_fwu_start(), in bytes.")
++set(TFM_CONFIG_FWU_MAX_WRITE_SIZE         4096        CACHE STRING    "=
The maximum permitted size for block in psa_fwu_write, in bytes.")
++set(FWU_SUPPORT_TRIAL_STATE              ON         CACHE BOOL      "De=
vice support TRIAL component state.")
+=20
+ if (${CMAKE_BUILD_TYPE} STREQUAL Debug OR ${CMAKE_BUILD_TYPE} STREQUAL =
RelWithDebInfo)
+   set(ENABLE_FWU_AGENT_DEBUG_LOGS     TRUE          CACHE BOOL      "En=
able Firmware update agent debug logs.")
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+deleted file mode 100644
+index c9b3e4844..000000000
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
++++ /dev/null
+@@ -1,1350 +0,0 @@
+-/*
+- * Copyright (c) 2021-2024, Arm Limited. All rights reserved.
+- *
+- * SPDX-License-Identifier: BSD-3-Clause
+- *
+- */
+-
+-#include <stdint.h>
+-#include <string.h>
+-#include "fwu_agent.h"
+-#include "Driver_Flash.h"
+-#include "flash_layout.h"
+-#include "fip_parser/external/uuid.h"
+-#include "region_defs.h"
+-#include "uefi_capsule_parser.h"
+-#include "flash_common.h"
+-#include "platform_base_address.h"
+-#include "platform_description.h"
+-#include "tfm_plat_nv_counters.h"
+-#include "tfm_plat_defs.h"
+-#include "uefi_fmp.h"
+-#include "uart_stdout.h"
+-#include "soft_crc.h"
+-#ifndef BL1_BUILD
+-#include "partition.h"
+-#include "platform.h"
+-#endif
+-
+-/* Properties of image in a bank */
+-struct fwu_image_properties {
+-
+-        /* UUID of the image in this bank */
+-        uuid_t img_uuid;
+-
+-        /* [0]: bit describing the image acceptance status =E2=80=93
+-         *      1 means the image is accepted
+-         * [31:1]: MBZ
+-         */
+-        uint32_t accepted;
+-
+-        /* NOTE: using the reserved field */
+-        /* image version */
+-        uint32_t version;
+-
+-} __packed;
+-
+-/* Image entry information */
+-struct fwu_image_entry {
+-
+-        /* UUID identifying the image type */
+-        uuid_t img_type_uuid;
+-
+-        /* UUID of the storage volume where the image is located */
+-        uuid_t location_uuid;
+-
+-        /* Properties of images with img_type_uuid in the different FW =
banks */
+-        struct fwu_image_properties img_props[NR_OF_FW_BANKS];
+-
+-} __packed;
+-
+-struct fwu_metadata {
+-
+-        /* Metadata CRC value */
+-        uint32_t crc_32;
+-
+-        /* Metadata version */
+-        uint32_t version;
+-
+-        /* Bank index with which device boots */
+-        uint32_t active_index;
+-
+-        /* Previous bank index with which device booted successfully */
+-        uint32_t previous_active_index;
+-
+-        /* Image entry information */
+-        struct fwu_image_entry img_entry[NR_OF_IMAGES_IN_FW_BANK];
+-
+-} __packed;
+-
+-/* This is Corstone1000 speific metadata for OTA.
+- * Private metadata is written at next sector following
+- * FWU METADATA location */
+-struct fwu_private_metadata {
+-
+-       /* boot_index: the bank from which system is booted from */
+-       uint32_t boot_index;
+-
+-       /* counter: tracking number of boot attempted so far */
+-       uint32_t boot_attempted;
+-
+-       /* staged nv_counter: temprary location before written to the ot=
p */
+-       uint32_t nv_counter[NR_OF_IMAGES_IN_FW_BANK];
+-
+-       /* FMP information */
+-       uint32_t fmp_version;
+-       uint32_t fmp_last_attempt_version;
+-       uint32_t fmp_last_attempt_status;
+-
+-} __packed;
+-
+-#define MAX_BOOT_ATTEMPTS_PER_BANK 3
+-
+-struct fwu_metadata _metadata;
+-
+-int is_initialized =3D 0;
+-
+-capsule_image_info_t capsule_info;
+-
+-enum fwu_agent_state_t {
+-    FWU_AGENT_STATE_UNKNOWN =3D -1,
+-    FWU_AGENT_STATE_REGULAR =3D 0,
+-    FWU_AGENT_STATE_TRIAL,
+-};
+-
+-struct efi_guid full_capsule_image_guid =3D {
+-    .time_low =3D 0x989f3a4e,
+-    .time_mid =3D 0x46e0,
+-    .time_hi_and_version =3D 0x4cd0,
+-    .clock_seq_and_node =3D {0x98, 0x77, 0xa2, 0x5c, 0x70, 0xc0, 0x13, =
0x29}
+-};
+-
+-
+-#define IMAGE_ACCEPTED          (1)
+-#define IMAGE_NOT_ACCEPTED      (0)
+-#define BANK_0                  (0)
+-#define BANK_1                  (1)
+-#define IMAGE_0                 (0)
+-#define IMAGE_1                 (1)
+-#define IMAGE_2                 (2)
+-#define IMAGE_3                 (3)
+-#define IMAGE_END               (IMAGE_3)
+-#define IMAGE_ALL               (IMAGE_END + 1)
+-#define IMAGE_NOT_RECOGNIZED    (-1)
+-#define INVALID_VERSION         (0xffffffff)
+-
+-
+-#ifndef FWU_METADATA_FLASH_DEV
+-    #ifndef FLASH_DEV_NAME
+-    #error "FWU_METADATA_FLASH_DEV or FLASH_DEV_NAME must be defined in=
 flash_layout.h"
+-    #else
+-    #define FWU_METADATA_FLASH_DEV FLASH_DEV_NAME
+-    #endif
+-#endif
+-
+-/* Import the CMSIS flash device driver */
+-extern ARM_DRIVER_FLASH FWU_METADATA_FLASH_DEV;
+-
+-#define HOST_ACK_TIMEOUT_SEC    (6 * 60) /* ~seconds, not exact */
+-
+-#ifdef BL1_BUILD
+-static enum fwu_agent_error_t private_metadata_read(
+-        struct fwu_private_metadata* p_metadata)
+-{
+-    int ret;
+-
+-    FWU_LOG_MSG("%s: enter\n\r", __func__);
+-
+-    if (!p_metadata) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    ret =3D FWU_METADATA_FLASH_DEV.ReadData(FWU_PRIVATE_METADATA_REPLIC=
A_1_OFFSET, p_metadata,
+-                                          sizeof(struct fwu_private_met=
adata));
+-    if (ret < 0 || ret !=3D sizeof(struct fwu_private_metadata)) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    FWU_LOG_MSG("%s: success: boot_index =3D %u\n\r", __func__,
+-                        p_metadata->boot_index);
+-
+-    return FWU_AGENT_SUCCESS;
+-}
+-#else
+-static enum fwu_agent_error_t private_metadata_read(
+-        struct fwu_private_metadata* p_metadata)
+-{
+-    partition_entry_t *part;
+-    uuid_t private_uuid =3D PRIVATE_METADATA_TYPE_UUID;
+-    int ret;
+-
+-    FWU_LOG_MSG("%s: enter\n\r", __func__);
+-
+-    if (!p_metadata) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    part =3D get_partition_entry_by_type(&private_uuid);
+-    if (!part) {
+-        FWU_LOG_MSG("Private metadata partition not found\n\r");
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    ret =3D FWU_METADATA_FLASH_DEV.ReadData(part->start, p_metadata,
+-                                          sizeof(struct fwu_private_met=
adata));
+-    if (ret < 0 || ret !=3D sizeof(struct fwu_private_metadata)) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    FWU_LOG_MSG("%s: success: boot_index =3D %u\n\r", __func__,
+-                        p_metadata->boot_index);
+-
+-    return FWU_AGENT_SUCCESS;
+-}
+-#endif
+-
+-#ifdef BL1_BUILD
+-static enum fwu_agent_error_t private_metadata_write(
+-        struct fwu_private_metadata* p_metadata)
+-{
+-    int ret;
+-
+-    FWU_LOG_MSG("%s: enter: boot_index =3D %u\n\r", __func__,
+-                        p_metadata->boot_index);
+-
+-    if (!p_metadata) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    ret =3D FWU_METADATA_FLASH_DEV.EraseSector(FWU_PRIVATE_METADATA_REP=
LICA_1_OFFSET);
+-    if (ret !=3D ARM_DRIVER_OK) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(FWU_PRIVATE_METADATA_REP=
LICA_1_OFFSET,
+-                                p_metadata, sizeof(struct fwu_private_m=
etadata));
+-    if (ret < 0 || ret !=3D sizeof(struct fwu_private_metadata)) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    FWU_LOG_MSG("%s: success\n\r", __func__);
+-    return FWU_AGENT_SUCCESS;
+-}
+-#else
+-static enum fwu_agent_error_t private_metadata_write(
+-        struct fwu_private_metadata* p_metadata)
+-{
+-    uuid_t private_uuid =3D PRIVATE_METADATA_TYPE_UUID;
+-    partition_entry_t *part;
+-    int ret;
+-
+-    FWU_LOG_MSG("%s: enter: boot_index =3D %u\n\r", __func__,
+-                        p_metadata->boot_index);
+-
+-    if (!p_metadata) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    part =3D get_partition_entry_by_type(&private_uuid);
+-    if (!part) {
+-        FWU_LOG_MSG("Private metadata partition not found\n\r");
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    ret =3D FWU_METADATA_FLASH_DEV.EraseSector(part->start);
+-    if (ret !=3D ARM_DRIVER_OK) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(part->start,
+-                                p_metadata, sizeof(struct fwu_private_m=
etadata));
+-    if (ret < 0 || ret !=3D sizeof(struct fwu_private_metadata)) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    FWU_LOG_MSG("%s: success\n\r", __func__);
+-    return FWU_AGENT_SUCCESS;
+-}
+-#endif
+-
+-static enum fwu_agent_error_t metadata_validate(struct fwu_metadata *p_=
metadata)
+-{
+-    int ret;
+-
+-    FWU_LOG_MSG("%s: enter:\n\r", __func__);
+-
+-    if (!p_metadata) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    uint32_t calculated_crc32 =3D crc32((uint8_t *)&(p_metadata->versio=
n),
+-                                      sizeof(struct fwu_metadata) - siz=
eof(uint32_t));
+-
+-    if (p_metadata->crc_32 !=3D calculated_crc32) {
+-        FWU_LOG_MSG("%s: failed: crc32 calculated: 0x%x, given: 0x%x\n\=
r", __func__,
+-                    calculated_crc32, p_metadata->crc_32);
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    FWU_LOG_MSG("%s: success\n\r", __func__);
+-
+-    return FWU_AGENT_SUCCESS;
+-}
+-
+-#ifdef BL1_BUILD
+-static enum fwu_agent_error_t metadata_read_without_validation(struct f=
wu_metadata *p_metadata)
+-{
+-    int ret;
+-
+-    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
+-                  FWU_METADATA_REPLICA_1_OFFSET, sizeof(struct fwu_meta=
data));
+-
+-    if (!p_metadata) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    ret =3D FWU_METADATA_FLASH_DEV.ReadData(FWU_METADATA_REPLICA_1_OFFS=
ET,
+-                                p_metadata, sizeof(struct fwu_metadata)=
);
+-    if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    FWU_LOG_MSG("%s: success: active =3D %u, previous =3D %d\n\r", __fu=
nc__,
+-                  p_metadata->active_index, p_metadata->previous_active=
_index);
+-
+-    return FWU_AGENT_SUCCESS;
+-}
+-#else
+-static enum fwu_agent_error_t metadata_read_without_validation(struct f=
wu_metadata *p_metadata)
+-{
+-    uuid_t metadata_uuid =3D FWU_METADATA_TYPE_UUID;
+-    partition_entry_t *part;
+-    int ret;
+-
+-    if (!p_metadata) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    part =3D get_partition_entry_by_type(&metadata_uuid);
+-    if (!part) {
+-        FWU_LOG_MSG("%s: FWU metadata partition not found\n\r", __func_=
_);
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
+-                  part->start, sizeof(struct fwu_metadata));
+-
+-
+-    ret =3D FWU_METADATA_FLASH_DEV.ReadData(part->start,
+-                                p_metadata, sizeof(struct fwu_metadata)=
);
+-    if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    FWU_LOG_MSG("%s: success: active =3D %u, previous =3D %d\n\r", __fu=
nc__,
+-                  p_metadata->active_index, p_metadata->previous_active=
_index);
+-
+-    return FWU_AGENT_SUCCESS;
+-}
+-#endif
+-
+-#ifdef BL1_BUILD
+-static enum fwu_agent_error_t metadata_read(struct fwu_metadata *p_meta=
data)
+-{
+-    int ret;
+-
+-    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
+-                  FWU_METADATA_REPLICA_1_OFFSET, sizeof(struct fwu_meta=
data));
+-
+-    if (!p_metadata) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    ret =3D FWU_METADATA_FLASH_DEV.ReadData(FWU_METADATA_REPLICA_1_OFFS=
ET,
+-                                p_metadata, sizeof(struct fwu_metadata)=
);
+-    if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    if (metadata_validate(p_metadata) !=3D FWU_AGENT_SUCCESS) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    FWU_LOG_MSG("%s: success: active =3D %u, previous =3D %d\n\r", __fu=
nc__,
+-                  p_metadata->active_index, p_metadata->previous_active=
_index);
+-
+-    return FWU_AGENT_SUCCESS;
+-}
+-#else
+-static enum fwu_agent_error_t metadata_read(struct fwu_metadata *p_meta=
data)
+-{
+-    uuid_t metadata_uuid =3D FWU_METADATA_TYPE_UUID;
+-    partition_entry_t *part;
+-    int ret;
+-
+-    if (!p_metadata) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    part =3D get_partition_entry_by_type(&metadata_uuid);
+-    if (!part) {
+-        FWU_LOG_MSG("%s: FWU metadata partition not found\n\r", __func_=
_);
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
+-                  part->start, sizeof(struct fwu_metadata));
+-
+-    ret =3D FWU_METADATA_FLASH_DEV.ReadData(part->start,
+-                                p_metadata, sizeof(struct fwu_metadata)=
);
+-    if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    if (metadata_validate(p_metadata) !=3D FWU_AGENT_SUCCESS) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    FWU_LOG_MSG("%s: success: active =3D %u, previous =3D %d\n\r", __fu=
nc__,
+-                  p_metadata->active_index, p_metadata->previous_active=
_index);
+-
+-    return FWU_AGENT_SUCCESS;
+-}
+-#endif
+-
+-
+-#ifdef BL1_BUILD
+-static enum fwu_agent_error_t metadata_write(
+-                        struct fwu_metadata *p_metadata)
+-{
+-    int ret;
+-
+-    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
+-                  FWU_METADATA_REPLICA_1_OFFSET, sizeof(struct fwu_meta=
data));
+-
+-    if (!p_metadata) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    ret =3D FWU_METADATA_FLASH_DEV.EraseSector(FWU_METADATA_REPLICA_1_O=
FFSET);
+-    if (ret !=3D ARM_DRIVER_OK) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(FWU_METADATA_REPLICA_1_O=
FFSET,
+-                                p_metadata, sizeof(struct fwu_metadata)=
);
+-    if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
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
+-    FWU_LOG_MSG("%s: success: active =3D %u, previous =3D %d\n\r", __fu=
nc__,
+-                  p_metadata->active_index, p_metadata->previous_active=
_index);
+-    return FWU_AGENT_SUCCESS;
+-}
+-#else
+-static enum fwu_agent_error_t metadata_write(
+-                        struct fwu_metadata *p_metadata)
+-{
+-    uuid_t metadata_uuid =3D FWU_METADATA_TYPE_UUID;
+-    partition_entry_t *part;
+-    int ret;
+-
+-    if (!p_metadata) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    part =3D get_partition_entry_by_type(&metadata_uuid);
+-    if (!part) {
+-        FWU_LOG_MSG("%s: FWU metadata partition not found\n\r", __func_=
_);
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
+-                  part->start, sizeof(struct fwu_metadata));
+-
+-    ret =3D FWU_METADATA_FLASH_DEV.EraseSector(part->start);
+-    if (ret !=3D ARM_DRIVER_OK) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(part->start,
+-                                p_metadata, sizeof(struct fwu_metadata)=
);
+-    if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    part =3D get_partition_replica_by_type(&metadata_uuid);
+-    if (!part) {
+-        FWU_LOG_MSG("%s: FWU metadata replica partition not found\n\r",=
 __func__);
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
+-                  part->start, sizeof(struct fwu_metadata));
+-
+-    ret =3D FWU_METADATA_FLASH_DEV.EraseSector(part->start);
+-    if (ret !=3D ARM_DRIVER_OK) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(part->start,
+-                                p_metadata, sizeof(struct fwu_metadata)=
);
+-    if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
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
+-    FWU_LOG_MSG("%s: success: active =3D %u, previous =3D %d\n\r", __fu=
nc__,
+-                  p_metadata->active_index, p_metadata->previous_active=
_index);
+-    return FWU_AGENT_SUCCESS;
+-}
+-#endif
+-
+-
+-enum fwu_agent_error_t fwu_metadata_init(void)
+-{
+-    enum fwu_agent_error_t ret;
+-    ARM_FLASH_INFO* flash_info;
+-
+-    if (is_initialized) {
+-        return FWU_AGENT_SUCCESS;
+-    }
+-
+-    #ifndef BL1_BUILD
+-    plat_io_storage_init();
+-    partition_init(PLATFORM_GPT_IMAGE);
+-    #endif
+-
+-    /* Code assumes everything fits into a sector */
+-    if (sizeof(struct fwu_metadata) > FWU_METADATA_FLASH_SECTOR_SIZE) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    if (sizeof(struct fwu_private_metadata) > FWU_METADATA_FLASH_SECTOR=
_SIZE) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    ret =3D FWU_METADATA_FLASH_DEV.Initialize(NULL);
+-    if (ret !=3D ARM_DRIVER_OK) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    flash_info =3D FWU_METADATA_FLASH_DEV.GetInfo();
+-    if (flash_info->program_unit !=3D 1) {
+-        FWU_METADATA_FLASH_DEV.Uninitialize();
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    is_initialized =3D 1;
+-
+-    return FWU_AGENT_SUCCESS;
+-}
+-
+-enum fwu_agent_error_t fwu_metadata_provision(void)
+-{
+-    enum fwu_agent_error_t ret;
+-    struct fwu_private_metadata priv_metadata;
+-    uint32_t image_version =3D FWU_IMAGE_INITIAL_VERSION;
+-
+-    FWU_LOG_MSG("%s: enter\n\r", __func__);
+-
+-    ret =3D fwu_metadata_init();
+-    if (ret) {
+-        return ret;
+-    }
+-
+-    /*
+-     * check by chance if the previous reboot
+-     * had a firmware data?. If yes, then don't initialize
+-     * metadata
+-     */
+-    metadata_read(&_metadata);
+-    if(_metadata.active_index < 2 || _metadata.previous_active_index <2=
){
+-    	if(_metadata.active_index ^ _metadata.previous_active_index)
+-    		return FWU_AGENT_SUCCESS;
+-    }
+-    /* Provision FWU Agent Metadata */
+-
+-    memset(&_metadata, 0, sizeof(struct fwu_metadata));
+-
+-    _metadata.version =3D 1;
+-    _metadata.active_index =3D BANK_0;
+-    _metadata.previous_active_index =3D BANK_1;
+-
+-    /* bank 0 is the place where images are located at the
+-     * start of device lifecycle */
+-
+-    for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
+-
+-        _metadata.img_entry[i].img_props[BANK_0].accepted =3D IMAGE_ACC=
EPTED;
+-        _metadata.img_entry[i].img_props[BANK_0].version =3D image_vers=
ion;
+-
+-        _metadata.img_entry[i].img_props[BANK_1].accepted =3D IMAGE_NOT=
_ACCEPTED;
+-        _metadata.img_entry[i].img_props[BANK_1].version =3D INVALID_VE=
RSION;
+-    }
+-
+-    /* Calculate CRC32 for fwu metadata */
+-    _metadata.crc_32 =3D crc32((uint8_t *)&_metadata.version,
+-                             sizeof(struct fwu_metadata) - sizeof(uint3=
2_t));
+-
+-    ret =3D metadata_write(&_metadata);
+-    if (ret) {
+-        return ret;
+-    }
+-
+-    memset(&_metadata, 0, sizeof(struct fwu_metadata));
+-    ret =3D metadata_read(&_metadata);
+-    if (ret) {
+-        return ret;
+-    }
+-    FWU_LOG_MSG("%s: provisioned values: active =3D %u, previous =3D %d=
\n\r",
+-             __func__, _metadata.active_index, _metadata.previous_activ=
e_index);
+-
+-
+-    /* Provision Private metadata for update agent which is shared
+-       beween BL1 and tf-m of secure enclave */
+-
+-    memset(&priv_metadata, 0, sizeof(struct fwu_private_metadata));
+-
+-    priv_metadata.boot_index =3D BANK_0;
+-    priv_metadata.boot_attempted =3D 0;
+-
+-    priv_metadata.fmp_version =3D FWU_IMAGE_INITIAL_VERSION;
+-    priv_metadata.fmp_last_attempt_version =3D FWU_IMAGE_INITIAL_VERSIO=
N;
+-    priv_metadata.fmp_last_attempt_status =3D LAST_ATTEMPT_STATUS_SUCCE=
SS;
+-
+-    ret =3D private_metadata_write(&priv_metadata);
+-    if (ret) {
+-        return ret;
+-    }
+-
+-    memset(&priv_metadata, 0, sizeof(struct fwu_private_metadata));
+-    ret =3D private_metadata_read(&priv_metadata);
+-    if (ret) {
+-        return ret;
+-    }
+-    FWU_LOG_MSG("%s: provisioned values: boot_index =3D %u\n\r", __func=
__,
+-                        priv_metadata.boot_index);
+-
+-    FWU_LOG_MSG("%s: FWU METADATA PROVISIONED.\n\r", __func__);
+-    return FWU_AGENT_SUCCESS;
+-}
+-
+-static enum fwu_agent_state_t get_fwu_agent_state(
+-        struct fwu_metadata *metadata_ptr,
+-        struct fwu_private_metadata *priv_metadata_ptr)
+-{
+-    uint32_t boot_index;
+-
+-    FWU_LOG_MSG("%s: enter\n\r", __func__);
+-
+-    boot_index =3D priv_metadata_ptr->boot_index;
+-
+-    if (boot_index !=3D metadata_ptr->active_index) {
+-        return FWU_AGENT_STATE_TRIAL;
+-    }
+-
+-    for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
+-        if ((metadata_ptr->img_entry[i].img_props[boot_index].accepted)
+-                =3D=3D (IMAGE_NOT_ACCEPTED)) {
+-            return FWU_AGENT_STATE_TRIAL;
+-        }
+-    }
+-
+-    FWU_LOG_MSG("%s: exit: FWU_AGENT_STATE_REGULAR\n\r", __func__);
+-    return FWU_AGENT_STATE_REGULAR;
+-}
+-
+-static int get_image_info_in_bank(struct efi_guid* guid, uint32_t* imag=
e_bank_offset)
+-{
+-    if ((memcmp(guid, &full_capsule_image_guid, sizeof(struct efi_guid)=
)) =3D=3D 0) {
+-        *image_bank_offset =3D 0;
+-        return IMAGE_ALL;
+-    }
+-
+-    return IMAGE_NOT_RECOGNIZED;
+-}
+-
+-static enum fwu_agent_error_t erase_bank(uint32_t bank_offset)
+-{
+-    int ret;
+-    uint32_t sectors;
+-
+-    FWU_LOG_MSG("%s: enter\n\r", __func__);
+-
+-    if ((bank_offset % FWU_METADATA_FLASH_SECTOR_SIZE) !=3D 0) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    if ((BANK_PARTITION_SIZE % FWU_METADATA_FLASH_SECTOR_SIZE) !=3D 0) =
{
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    sectors =3D BANK_PARTITION_SIZE / FWU_METADATA_FLASH_SECTOR_SIZE;
+-
+-    FWU_LOG_MSG("%s: erasing sectors =3D %u, from offset =3D %u\n\r", _=
_func__,
+-                     sectors, bank_offset);
+-
+-    for (int i =3D 0; i < sectors; i++) {
+-        ret =3D FWU_METADATA_FLASH_DEV.EraseSector(
+-                bank_offset + (i * FWU_METADATA_FLASH_SECTOR_SIZE));
+-        if (ret !=3D ARM_DRIVER_OK) {
+-            return FWU_AGENT_ERROR;
+-        }
+-    }
+-
+-    FWU_LOG_MSG("%s: exit\n\r", __func__);
+-    return FWU_AGENT_SUCCESS;
+-}
+-
+-
+-static enum fwu_agent_error_t flash_full_capsule(
+-        struct fwu_metadata* metadata, void* images, uint32_t size,
+-        uint32_t version)
+-{
+-    int ret;
+-    uint32_t active_index =3D metadata->active_index;
+-    uint32_t bank_offset;
+-    uint32_t previous_active_index;
+-
+-    FWU_LOG_MSG("%s: enter: image =3D 0x%p, size =3D %u, version =3D %u=
\n\r"
+-                , __func__, images, size, version);
+-
+-    if (!metadata || !images) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    if (size > BANK_PARTITION_SIZE) {
+-        FWU_LOG_MSG("ERROR: %s: size error\n\r",__func__);
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    if (version <=3D
+-            (metadata->img_entry[IMAGE_0].img_props[active_index].versi=
on)) {
+-        FWU_LOG_MSG("ERROR: %s: version error\n\r",__func__);
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    if (active_index =3D=3D BANK_0) {
+-        previous_active_index =3D BANK_1;
+-        bank_offset =3D BANK_1_PARTITION_OFFSET;
+-    } else if (active_index =3D=3D BANK_1) {
+-        previous_active_index =3D BANK_0;
+-        bank_offset =3D BANK_0_PARTITION_OFFSET;
+-    } else {
+-        FWU_LOG_MSG("ERROR: %s: active_index %d\n\r",__func__,active_in=
dex);
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    if (erase_bank(bank_offset)) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    FWU_LOG_MSG("%s: writing capsule to the flash at offset =3D %u...\n=
\r",
+-                      __func__, bank_offset);
+-    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(bank_offset, images, siz=
e);
+-    if (ret < 0 || ret !=3D size) {
+-        return FWU_AGENT_ERROR;
+-    }
+-    FWU_LOG_MSG("%s: images are written to bank offset =3D %u\n\r", __f=
unc__,
+-                     bank_offset);
+-
+-    /* Change system state to trial bank state */
+-    for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
+-        metadata->img_entry[i].img_props[previous_active_index].accepte=
d =3D
+-                                                        IMAGE_NOT_ACCEP=
TED;
+-        metadata->img_entry[i].img_props[previous_active_index].version=
 =3D version;
+-    }
+-    metadata->active_index =3D previous_active_index;
+-    metadata->previous_active_index =3D active_index;
+-    metadata->crc_32 =3D crc32((uint8_t *)&metadata->version,
+-                              sizeof(struct fwu_metadata) - sizeof(uint=
32_t));
+-
+-    ret =3D metadata_write(metadata);
+-    if (ret) {
+-        return ret;
+-    }
+-
+-    FWU_LOG_MSG("%s: exit\n\r", __func__);
+-    return FWU_AGENT_SUCCESS;
+-}
+-
+-enum fwu_agent_error_t corstone1000_fwu_flash_image(void)
+-{
+-    enum fwu_agent_error_t ret;
+-    struct fwu_private_metadata priv_metadata;
+-    enum fwu_agent_state_t current_state;
+-    void *capsule_ptr =3D (char*)CORSTONE1000_HOST_DRAM_UEFI_CAPSULE;
+-    int image_index;
+-    uint32_t image_bank_offset;
+-    uint32_t nr_images;
+-
+-    FWU_LOG_MSG("%s: enter\n\r", __func__);
+-
+-    if (!is_initialized) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    Select_Write_Mode_For_Shared_Flash();
+-
+-    if (metadata_read(&_metadata)) {
+-        ret =3D  FWU_AGENT_ERROR;
+-        goto out;
+-    }
+-
+-    if (private_metadata_read(&priv_metadata)) {
+-        ret =3D  FWU_AGENT_ERROR;
+-        goto out;
+-    }
+-
+-    /* Firmware update process can only start in regular state. */
+-    current_state =3D get_fwu_agent_state(&_metadata, &priv_metadata);
+-    if (current_state !=3D FWU_AGENT_STATE_REGULAR) {
+-        ret =3D  FWU_AGENT_ERROR;
+-        goto out;
+-    }
+-
+-    memset(&capsule_info, 0, sizeof(capsule_image_info_t));
+-    if (uefi_capsule_retrieve_images(capsule_ptr, &capsule_info)) {
+-        ret =3D  FWU_AGENT_ERROR;
+-        goto out;
+-    }
+-    nr_images =3D capsule_info.nr_image;
+-
+-    for (int i =3D 0; i < nr_images; i++) {
+-        image_index =3D get_image_info_in_bank(&capsule_info.guid[i],
+-                                &image_bank_offset);
+-        switch(image_index) {
+-            case IMAGE_ALL:
+-
+-                ret =3D flash_full_capsule(&_metadata, capsule_info.ima=
ge[i],
+-                                         capsule_info.size[i],
+-                                         capsule_info.version[i]);
+-
+-                if (ret !=3D FWU_AGENT_SUCCESS) {
+-
+-                    priv_metadata.fmp_last_attempt_version =3D capsule_=
info.version[i];
+-                    priv_metadata.fmp_last_attempt_status =3D LAST_ATTE=
MPT_STATUS_ERROR_UNSUCCESSFUL;
+-
+-                    private_metadata_write(&priv_metadata);
+-
+-                    fmp_set_image_info(&full_capsule_image_guid,
+-                            priv_metadata.fmp_version,
+-                            priv_metadata.fmp_last_attempt_version,
+-                            priv_metadata.fmp_last_attempt_status);
+-                }
+-
+-
+-                break;
+-            default:
+-                FWU_LOG_MSG("%s: sent image not recognized\n\r", __func=
__);
+-                ret =3D FWU_AGENT_ERROR;
+-                break;
+-        }
+-    }
+-
+-out:
+-    Select_XIP_Mode_For_Shared_Flash();
+-
+-    FWU_LOG_MSG("%s: exit: ret =3D %d\n\r", __func__, ret);
+-    return ret;
+-}
+-
+-static enum fwu_agent_error_t accept_full_capsule(
+-          struct fwu_metadata* metadata,
+-          struct fwu_private_metadata* priv_metadata)
+-{
+-    uint32_t active_index =3D metadata->active_index;
+-    enum fwu_agent_error_t ret;
+-
+-    FWU_LOG_MSG("%s: enter\n\r", __func__);
+-
+-    for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
+-        metadata->img_entry[i].img_props[active_index].accepted =3D
+-                                                            IMAGE_ACCEP=
TED;
+-    }
+-
+-    priv_metadata->boot_attempted =3D 0;
+-
+-    ret =3D private_metadata_write(priv_metadata);
+-    if (ret) {
+-        return ret;
+-    }
+-    metadata->crc_32 =3D crc32((uint8_t *)&metadata->version,
+-                              sizeof(struct fwu_metadata) - sizeof(uint=
32_t));
+-
+-    ret =3D metadata_write(metadata);
+-    if (ret) {
+-        return ret;
+-    }
+-
+-    FWU_LOG_MSG("%s: exit: fwu state is changed to regular\n\r", __func=
__);
+-    return FWU_AGENT_SUCCESS;
+-}
+-
+-static enum fwu_agent_error_t fwu_accept_image(struct efi_guid* guid,
+-        struct fwu_metadata *metadata,
+-        struct fwu_private_metadata *priv_metadata)
+-{
+-    enum fwu_agent_state_t current_state;
+-    int image_index;
+-    uint32_t image_bank_offset;
+-    enum fwu_agent_error_t ret;
+-
+-    FWU_LOG_MSG("%s: enter\n\r", __func__);
+-
+-    /* it is expected to receive this call only when
+-       in trial state */
+-    current_state =3D get_fwu_agent_state(metadata, priv_metadata);
+-    if (current_state !=3D FWU_AGENT_STATE_TRIAL) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    /* booted from previous_active_bank, not expected
+-     * to receive this call in this state, rather host should
+-     * call corstone1000_fwu_select_previous */
+-    if (metadata->active_index !=3D priv_metadata->boot_index) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    image_index =3D get_image_info_in_bank(guid, &image_bank_offset);
+-    switch(image_index) {
+-        case IMAGE_ALL:
+-            ret =3D accept_full_capsule(metadata, priv_metadata);
+-            break;
+-        default:
+-            FWU_LOG_MSG("%s: sent image not recognized\n\r", __func__);
+-            ret =3D FWU_AGENT_ERROR;
+-            break;
+-    }
+-
+-    FWU_LOG_MSG("%s: exit: ret =3D %d\n\r", __func__, ret);
+-    return ret;
+-}
+-
+-static enum fwu_agent_error_t fwu_select_previous(
+-        struct fwu_metadata *metadata,
+-        struct fwu_private_metadata *priv_metadata)
+-{
+-    enum fwu_agent_error_t ret;
+-    enum fwu_agent_state_t current_state;
+-    uint32_t index;
+-
+-    FWU_LOG_MSG("%s: enter\n\r", __func__);
+-
+-    /* it is expected to receive this call only when
+-       in trial state */
+-    current_state =3D get_fwu_agent_state(metadata, priv_metadata);
+-    if (current_state !=3D FWU_AGENT_STATE_TRIAL) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    /* not expected to receive this call in this state, system
+-     * did not boot from previous active index */
+-    if (metadata->previous_active_index !=3D priv_metadata->boot_index)=
 {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    FWU_LOG_MSG("%s: trial state: active index =3D %u, previous active =
=3D %u\n\r",
+-            __func__, metadata->active_index, metadata->previous_active=
_index);
+-
+-    index =3D metadata->previous_active_index;
+-    for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
+-        if (metadata->img_entry[i].img_props[index].accepted !=3D IMAGE=
_ACCEPTED)
+-        {
+-            FWU_ASSERT(0);
+-        }
+-    }
+-
+-    index =3D metadata->active_index;
+-    metadata->active_index =3D metadata->previous_active_index;
+-    metadata->previous_active_index =3D index;
+-
+-    priv_metadata->boot_attempted =3D 0;
+-
+-    ret =3D private_metadata_write(priv_metadata);
+-    if (ret) {
+-        return ret;
+-    }
+-    metadata->crc_32 =3D crc32((uint8_t *)&metadata->version,
+-                              sizeof(struct fwu_metadata) - sizeof(uint=
32_t));
+-
+-    ret =3D metadata_write(metadata);
+-    if (ret) {
+-        return ret;
+-    }
+-
+-    FWU_LOG_MSG("%s: in regular state by choosing previous active bank\=
n\r",
+-                 __func__);
+-
+-    FWU_LOG_MSG("%s: exit: ret =3D %d\n\r", __func__, ret);
+-    return ret;
+-
+-}
+-
+-void bl1_get_active_bl2_image(uint32_t *offset)
+-{
+-    struct fwu_private_metadata priv_metadata;
+-    enum fwu_agent_state_t current_state;
+-    uint32_t boot_attempted;
+-    uint32_t boot_index;
+-
+-    FWU_LOG_MSG("%s: enter\n\r", __func__);
+-
+-    if (fwu_metadata_init()) {
+-        FWU_ASSERT(0);
+-    }
+-
+-    if (private_metadata_read(&priv_metadata)) {
+-        FWU_ASSERT(0);
+-    }
+-
+-    if (metadata_read(&_metadata)) {
+-        FWU_ASSERT(0);
+-    }
+-
+-    current_state =3D get_fwu_agent_state(&_metadata, &priv_metadata);
+-
+-    if (current_state =3D=3D FWU_AGENT_STATE_REGULAR) {
+-        boot_index =3D _metadata.active_index;
+-        FWU_ASSERT(boot_index =3D=3D priv_metadata.boot_index);
+-        boot_attempted =3D 0;
+-    } else if (current_state =3D=3D FWU_AGENT_STATE_TRIAL) {
+-        boot_attempted =3D (++priv_metadata.boot_attempted);
+-        FWU_LOG_MSG("%s: attempting boot number =3D %u\n\r",
+-                                        __func__, boot_attempted);
+-        if (boot_attempted <=3D MAX_BOOT_ATTEMPTS_PER_BANK) {
+-            boot_index =3D _metadata.active_index;
+-            FWU_LOG_MSG("%s: booting from trial bank: %u\n\r",
+-                                        __func__, boot_index);
+-        } else if (boot_attempted <=3D (2 * MAX_BOOT_ATTEMPTS_PER_BANK)=
) {
+-            boot_index =3D _metadata.previous_active_index;
+-            FWU_LOG_MSG("%s: gave up booting from trial bank\n\r", __fu=
nc__);
+-            FWU_LOG_MSG("%s: booting from previous active bank: %u\n\r"=
,
+-                                        __func__, boot_index);
+-        } else {
+-            FWU_LOG_MSG("%s: cannot boot system from any bank, halting.=
..\n\r", __func__);
+-            FWU_ASSERT(0);
+-        }
+-    } else {
+-        FWU_ASSERT(0);
+-    }
+-
+-    priv_metadata.boot_index =3D boot_index;
+-    if (private_metadata_write(&priv_metadata) < 0) {
+-        FWU_ASSERT(0);
+-    }
+-
+-    if (boot_index =3D=3D BANK_0) {
+-        *offset =3D SE_BL2_BANK_0_OFFSET;
+-    } else if (boot_index =3D=3D BANK_1) {
+-        *offset =3D SE_BL2_BANK_1_OFFSET;
+-    } else {
+-        FWU_ASSERT(0);
+-    }
+-
+-    FWU_LOG_MSG("%s: exit: booting from bank =3D %u, offset =3D 0x%x\n\=
r", __func__,
+-                        boot_index, *offset);
+-
+-    return;
+-}
+-
+-uint8_t bl2_get_boot_bank(void)
+-{
+-    uint8_t boot_index;
+-    struct fwu_private_metadata priv_metadata;
+-    FWU_LOG_MSG("%s: enter", __func__);
+-    if (fwu_metadata_init()) {
+-        FWU_ASSERT(0);
+-    }
+-    if (private_metadata_read(&priv_metadata)) {
+-        FWU_ASSERT(0);
+-    }
+-    boot_index =3D priv_metadata.boot_index;
+-    FWU_LOG_MSG("%s: exit: booting from bank =3D %u", __func__, boot_in=
dex);
+-    return boot_index;
+-}
+-
+-static void disable_host_ack_timer(void)
+-{
+-    FWU_LOG_MSG("%s: timer to reset is disabled\n\r", __func__);
+-    SysTick->CTRL &=3D (~SysTick_CTRL_ENABLE_Msk);
+-}
+-
+-static enum fwu_agent_error_t update_nv_counters(
+-                        struct fwu_private_metadata* priv_metadata)
+-{
+-    enum tfm_plat_err_t err;
+-    uint32_t security_cnt;
+-    enum tfm_nv_counter_t tfm_nv_counter_i;
+-
+-    FWU_LOG_MSG("%s: enter\n\r", __func__);
+-
+-    for (int i =3D 0; i <=3D FWU_MAX_NV_COUNTER_INDEX; i++) {
+-
+-        switch (i) {
+-            case FWU_BL2_NV_COUNTER:
+-                tfm_nv_counter_i =3D PLAT_NV_COUNTER_BL1_0;
+-                break;
+-            case FWU_TFM_NV_COUNTER:
+-                tfm_nv_counter_i =3D PLAT_NV_COUNTER_BL2_0;
+-                break;
+-            case FWU_TFA_NV_COUNTER:
+-                tfm_nv_counter_i =3D PLAT_NV_COUNTER_BL2_1;
+-                break;
+-            default:
+-                FWU_ASSERT(0);
+-                break;
+-        }
+-
+-        err =3D tfm_plat_read_nv_counter(tfm_nv_counter_i,
+-                        sizeof(security_cnt), (uint8_t *)&security_cnt)=
;
+-        if (err !=3D TFM_PLAT_ERR_SUCCESS) {
+-            return FWU_AGENT_ERROR;
+-        }
+-
+-        if (priv_metadata->nv_counter[i] < security_cnt) {
+-            return FWU_AGENT_ERROR;
+-        } else if (priv_metadata->nv_counter[i] > security_cnt) {
+-            FWU_LOG_MSG("%s: updaing index =3D %u nv counter =3D %u->%u=
\n\r",
+-                        __func__, i, security_cnt,
+-                        priv_metadata->nv_counter[FWU_BL2_NV_COUNTER]);
+-            err =3D tfm_plat_set_nv_counter(tfm_nv_counter_i,
+-                                    priv_metadata->nv_counter[FWU_BL2_N=
V_COUNTER]);
+-            if (err !=3D TFM_PLAT_ERR_SUCCESS) {
+-                return FWU_AGENT_ERROR;
+-            }
+-        }
+-
+-    }
+-
+-    FWU_LOG_MSG("%s: exit\n\r", __func__);
+-    return FWU_AGENT_SUCCESS;
+-}
+-
+-enum fwu_agent_error_t corstone1000_fwu_host_ack(void)
+-{
+-    enum fwu_agent_error_t ret;
+-    struct fwu_private_metadata priv_metadata;
+-    enum fwu_agent_state_t current_state;
+-
+-    FWU_LOG_MSG("%s: enter\n\r", __func__);
+-
+-    if (!is_initialized) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    Select_Write_Mode_For_Shared_Flash();
+-
+-    if (metadata_read(&_metadata)) {
+-        ret =3D FWU_AGENT_ERROR;
+-        goto out;
+-    }
+-
+-    if (private_metadata_read(&priv_metadata)) {
+-        ret =3D FWU_AGENT_ERROR;
+-        goto out;
+-    }
+-
+-    current_state =3D get_fwu_agent_state(&_metadata, &priv_metadata);
+-    if (current_state =3D=3D FWU_AGENT_STATE_REGULAR) {
+-
+-        ret =3D FWU_AGENT_SUCCESS; /* nothing to be done */
+-
+-        fmp_set_image_info(&full_capsule_image_guid,
+-                priv_metadata.fmp_version,
+-                priv_metadata.fmp_last_attempt_version,
+-                priv_metadata.fmp_last_attempt_status);
+-
+-        goto out;
+-
+-    } else if (current_state !=3D FWU_AGENT_STATE_TRIAL) {
+-        FWU_ASSERT(0);
+-    }
+-
+-    if (_metadata.active_index !=3D priv_metadata.boot_index) {
+-
+-        /* firmware update failed, revert back to previous bank */
+-
+-        priv_metadata.fmp_last_attempt_version =3D
+-         _metadata.img_entry[IMAGE_0].img_props[_metadata.active_index]=
.version;
+-
+-        priv_metadata.fmp_last_attempt_status =3D LAST_ATTEMPT_STATUS_E=
RROR_UNSUCCESSFUL;
+-
+-        ret =3D fwu_select_previous(&_metadata, &priv_metadata);
+-
+-    } else {
+-
+-        /* firmware update successful */
+-
+-        priv_metadata.fmp_version =3D
+-         _metadata.img_entry[IMAGE_0].img_props[_metadata.active_index]=
.version;
+-        priv_metadata.fmp_last_attempt_version =3D
+-         _metadata.img_entry[IMAGE_0].img_props[_metadata.active_index]=
.version;
+-
+-        priv_metadata.fmp_last_attempt_status =3D LAST_ATTEMPT_STATUS_S=
UCCESS;
+-
+-        ret =3D fwu_accept_image(&full_capsule_image_guid, &_metadata,
+-                                &priv_metadata);
+-        if (!ret) {
+-            ret =3D update_nv_counters(&priv_metadata);
+-        }
+-    }
+-
+-    if (ret =3D=3D FWU_AGENT_SUCCESS) {
+-        disable_host_ack_timer();
+-        fmp_set_image_info(&full_capsule_image_guid,
+-                priv_metadata.fmp_version,
+-                priv_metadata.fmp_last_attempt_version,
+-                priv_metadata.fmp_last_attempt_status);
+-    }
+-
+-out:
+-    Select_XIP_Mode_For_Shared_Flash();
+-
+-    FWU_LOG_MSG("%s: exit: ret =3D %d\n\r", __func__, ret);
+-    return ret;
+-}
+-
+-static int systic_counter =3D 0;
+-
+-void SysTick_Handler(void)
+-{
+-    systic_counter++;
+-    if (systic_counter % 10 =3D=3D 0) {
+-        SysTick->CTRL &=3D ~SysTick_CTRL_ENABLE_Msk;
+-        stdio_output_string("*", 1);
+-        SysTick->CTRL |=3D SysTick_CTRL_ENABLE_Msk;
+-    }
+-    if (systic_counter =3D=3D HOST_ACK_TIMEOUT_SEC) {
+-        SysTick->CTRL &=3D ~SysTick_CTRL_ENABLE_Msk;
+-        stdio_output_string("timer expired!\n\r",
+-                           sizeof("timer expired!\n\r"));
+-        NVIC_SystemReset();
+-    }
+-}
+-
+-/* When in trial state, start the timer for host to respond.
+- * Diable timer when host responds back either by calling
+- * corstone1000_fwu_accept_image or corstone1000_fwu_select_previous.
+- * Otherwise, resets the system.
+- */
+-void host_acknowledgement_timer_to_reset(void)
+-{
+-    struct fwu_private_metadata priv_metadata;
+-    enum fwu_agent_state_t current_state;
+-
+-    FWU_LOG_MSG("%s: enter\n\r", __func__);
+-
+-    Select_Write_Mode_For_Shared_Flash();
+-
+-    if (!is_initialized) {
+-        FWU_ASSERT(0);
+-    }
+-
+-    if (private_metadata_read(&priv_metadata)) {
+-        FWU_ASSERT(0);
+-    }
+-
+-    if (metadata_read(&_metadata)) {
+-        FWU_ASSERT(0);
+-    }
+-
+-    Select_XIP_Mode_For_Shared_Flash();
+-
+-    current_state =3D get_fwu_agent_state(&_metadata, &priv_metadata);
+-
+-    if (current_state =3D=3D FWU_AGENT_STATE_TRIAL) {
+-        FWU_LOG_MSG("%s: in trial state, starting host ack timer\n\r",
+-                        __func__);
+-        systic_counter =3D 0;
+-        if (SysTick_Config(SysTick_LOAD_RELOAD_Msk)) {
+-            FWU_LOG_MSG("%s: timer init failed\n\r", __func__);
+-            FWU_ASSERT(0);
+-        } else {
+-            FWU_LOG_MSG("%s: timer started: seconds to expire : %u\n\r"=
,
+-                        __func__, HOST_ACK_TIMEOUT_SEC);
+-        }
+-    }
+-
+-    FWU_LOG_MSG("%s: exit\n\r", __func__);
+-    return;
+-}
+-
+-/* stage nv counter into private metadata section of the flash.
+- * staged nv counters are written to the otp when firmware update
+- * is successful
+- * the function assumes that the api is called in the boot loading
+- * stage
+- */
+-enum fwu_agent_error_t fwu_stage_nv_counter(enum fwu_nv_counter_index_t=
 index,
+-        uint32_t img_security_cnt)
+-{
+-    struct fwu_private_metadata priv_metadata;
+-
+-    FWU_LOG_MSG("%s: enter: index =3D %u, val =3D %u\n\r", __func__,
+-                                index, img_security_cnt);
+-
+-    if (!is_initialized) {
+-        FWU_ASSERT(0);
+-    }
+-
+-    if (index > FWU_MAX_NV_COUNTER_INDEX) {
+-        return FWU_AGENT_ERROR;
+-    }
+-
+-    if (private_metadata_read(&priv_metadata)) {
+-        FWU_ASSERT(0);
+-    }
+-
+-    if (priv_metadata.nv_counter[index] !=3D img_security_cnt) {
+-        priv_metadata.nv_counter[index] =3D img_security_cnt;
+-        if (private_metadata_write(&priv_metadata)) {
+-            FWU_ASSERT(0);
+-        }
+-    }
+-
+-    FWU_LOG_MSG("%s: exit\n\r", __func__);
+-    return FWU_AGENT_SUCCESS;
+-}
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.h b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
+deleted file mode 100644
+index 701f20558..000000000
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
++++ /dev/null
+@@ -1,73 +0,0 @@
+-/*
+- * Copyright (c) 2021-2023, Arm Limited. All rights reserved.
+- *
+- * SPDX-License-Identifier: BSD-3-Clause
+- *
+- */
+-
+-#ifndef FWU_AGENT_H
+-#define FWU_AGENT_H
+-
+-#ifdef ENABLE_FWU_AGENT_DEBUG_LOGS
+-    #include <stdio.h>
+-    #define FWU_LOG_MSG(f_, ...) printf((f_), ##__VA_ARGS__)
+-#else
+-    #define FWU_LOG_MSG(f_, ...)
+-#endif
+-
+-enum fwu_agent_error_t {
+-        FWU_AGENT_SUCCESS =3D 0,
+-        FWU_AGENT_ERROR =3D (-1)
+-};
+-
+-#define FWU_ASSERT(_c_)                                                =
        \
+-                if (!(_c_)) {                                          =
        \
+-                    FWU_LOG_MSG("%s:%d assert hit\n\r", __func__, __LIN=
E__);   \
+-                    while(1) {};                                       =
        \
+-                }                                                      =
        \
+-
+-
+-/* Version used for the very first image of the device. */
+-#define FWU_IMAGE_INITIAL_VERSION 0
+-
+-enum fwu_agent_error_t fwu_metadata_provision(void);
+-enum fwu_agent_error_t fwu_metadata_init(void);
+-
+-/* host to secure enclave:
+- * firwmare update image is sent accross
+- */
+-enum fwu_agent_error_t corstone1000_fwu_flash_image(void);
+-
+-/* host to secure enclave:
+- * host responds with this api to acknowledge its successful
+- * boot.
+- */
+-enum fwu_agent_error_t corstone1000_fwu_host_ack(void);
+-
+-void bl1_get_active_bl2_image(uint32_t *bank_offset);
+-uint8_t bl2_get_boot_bank(void);
+-
+-/* When in trial state, start the timer for host to respond.
+- * Diable timer when host responds back either by calling
+- * corstone1000_fwu_accept_image or corstone1000_fwu_select_previous.
+- * Otherwise, resets the system.
+- */
+-void host_acknowledgement_timer_to_reset(void);
+-
+-enum fwu_nv_counter_index_t {
+-    FWU_BL2_NV_COUNTER =3D 0,
+-    FWU_TFM_NV_COUNTER,
+-    FWU_TFA_NV_COUNTER,
+-    FWU_MAX_NV_COUNTER_INDEX =3D FWU_TFA_NV_COUNTER
+-};
+-
+-/* stage nv counter into private metadata section of the flash.
+- * staged nv counters are written to the otp when firmware update
+- * is successful
+- * the function assumes that the api is called in the boot loading
+- * stage
+- */
+-enum fwu_agent_error_t fwu_stage_nv_counter(enum fwu_nv_counter_index_t=
 index,
+-        uint32_t img_security_cnt);
+-
+-#endif /* FWU_AGENT_H */
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_c=
apsule_parser.c b/platform/ext/target/arm/corstone1000/fw_update_agent/ue=
fi_capsule_parser.c
+deleted file mode 100644
+index c706c040a..000000000
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_capsule_=
parser.c
++++ /dev/null
+@@ -1,175 +0,0 @@
+-/*
+- * Copyright (c) 2021, Arm Limited. All rights reserved.
+- *
+- * SPDX-License-Identifier: BSD-3-Clause
+- *
+- */
+-
+-#include "uefi_capsule_parser.h"
+-#include "fwu_agent.h"
+-#include <string.h>
+-
+-/*
+-Update Capsule Structure (UEFI spec 2.9 1004)
+-    EFI_CAPSULE_HEADER
+-    ...
+-    ...
+-    ...
+-    CAPSULE_BODY
+-        efi_firmware_management_capsule_header
+-        Optional Driver 1 (item_offset[0])
+-        Optional Driver 2 (item_offset[1])
+-            Payload 1 (item_offset[2])
+-                efi_firmware_management_capsule_iamge_header
+-                Binary Update image (Image_length =3D=3D update_image_s=
ize)
+-                Vendor Code bytes  (Data lenght =3D=3D update_vendorcod=
e_size)
+-            Payload 2 (item_offset[3])
+-            ...
+-            ...
+-            Payload n (item_offset[embedded_driver_count + payload_item=
_count -1])
+-*/
+-
+-typedef struct {
+-    struct efi_guid         capsule_guid;
+-    uint32_t                header_size;
+-    uint32_t                flags;
+-    uint32_t                capsule_image_size;
+-} efi_capsule_header_t;
+-
+-typedef struct {
+-    uint32_t                version;
+-    uint16_t                embedded_driver_count;
+-    uint16_t                payload_item_count;
+-    uint64_t                item_offset_list[];
+-} efi_firmware_management_capsule_header_t;
+-
+-typedef struct {
+-    uint32_t                version;
+-    struct efi_guid         update_image_type_id;
+-    uint8_t                 update_image_index;
+-    uint8_t                 reserved_bytes[3];
+-    uint32_t                update_image_size;
+-    uint32_t                update_vendorcode_size;
+-    uint64_t                update_hardware_instance; //introduced in v=
2
+-    uint64_t                image_capsule_support; //introduced in v3
+-} efi_firmware_management_capsule_image_header_t;
+-
+-typedef struct {
+-    uint32_t                signature;
+-    uint32_t                header_size;
+-    uint32_t                fw_version;
+-    uint32_t                lowest_supported_version;
+-} fmp_payload_header_t;
+-
+-#define ANYSIZE_ARRAY 0
+-
+-typedef struct {
+-    uint32_t                dwLength;
+-    uint16_t                wRevision;
+-    uint16_t                wCertificateType;
+-    uint8_t                 bCertificate[ANYSIZE_ARRAY];
+-} WIN_CERTIFICATE;
+-
+-typedef struct {
+-    WIN_CERTIFICATE         hdr;
+-    struct efi_guid         cert_type;
+-    uint8_t                 cert_data[ANYSIZE_ARRAY];
+-} win_certificate_uefi_guid_t;
+-
+-typedef struct {
+-    uint64_t                    monotonic_count;
+-    win_certificate_uefi_guid_t   auth_info;
+-} efi_firmware_image_authentication_t;
+-
+-
+-enum uefi_capsule_error_t uefi_capsule_retrieve_images(void* capsule_pt=
r,
+-        capsule_image_info_t* images_info)
+-{
+-    char *ptr =3D (char*)capsule_ptr;
+-    efi_capsule_header_t* capsule_header;
+-    efi_firmware_management_capsule_header_t* fmp_capsule_header;
+-    efi_firmware_management_capsule_image_header_t* image_header;
+-    efi_firmware_image_authentication_t* image_auth;
+-    fmp_payload_header_t *fmp_payload_header;
+-    uint32_t total_size;
+-    uint32_t image_count;
+-    uint32_t auth_size;
+-
+-    FWU_LOG_MSG("%s: enter, capsule ptr =3D 0x%p\n\r", __func__, capsul=
e_ptr);
+-
+-    if (!capsule_ptr) {
+-        return UEFI_CAPSULE_PARSER_ERROR;
+-    }
+-
+-    capsule_header =3D (efi_capsule_header_t*)ptr;
+-    ptr +=3D sizeof(efi_capsule_header_t);
+-    fmp_capsule_header =3D (efi_firmware_management_capsule_header_t*)p=
tr;
+-
+-    total_size =3D capsule_header->capsule_image_size;
+-    image_count =3D fmp_capsule_header->payload_item_count;
+-    images_info->nr_image =3D image_count;
+-
+-    FWU_LOG_MSG("%s: capsule size =3D %u, image count =3D %u\n\r", __fu=
nc__,
+-                        total_size, image_count);
+-
+-    if ((image_count =3D=3D 0) || (image_count > NR_OF_IMAGES_IN_FW_BAN=
K)) {
+-        return UEFI_CAPSULE_PARSER_ERROR;
+-    }
+-
+-    for (int i =3D 0; i < image_count; i++) {
+-        image_header =3D (efi_firmware_management_capsule_image_header_=
t*)(ptr +
+-                                fmp_capsule_header->item_offset_list[i]=
);
+-
+-        images_info->size[i] =3D image_header->update_image_size;
+-
+-#ifdef AUTHENTICATED_CAPSULE
+-        image_auth =3D (efi_firmware_image_authentication_t*)(
+-                        (char*)image_header +
+-                        sizeof (efi_firmware_management_capsule_image_h=
eader_t)
+-                     );
+-        auth_size =3D sizeof(uint64_t) /* monotonic_count */  +
+-                    image_auth->auth_info.hdr.dwLength/* WIN_CERTIFICAT=
E + cert_data + cert_type */;
+-
+-        fmp_payload_header =3D (fmp_payload_header_t*)((char*)image_aut=
h + auth_size);
+-
+-        FWU_LOG_MSG("%s: auth size =3D %u\n\r", __func__, auth_size);
+-
+-        images_info->size[i] -=3D auth_size;
+-
+-        images_info->image[i] =3D (
+-                (char*)image_header +
+-                sizeof(efi_firmware_management_capsule_image_header_t) =
+
+-                auth_size +
+-                sizeof(*fmp_payload_header));
+-#else
+-        images_info->image[i] =3D (
+-                (char*)image_header +
+-                sizeof(efi_firmware_management_capsule_image_header_t) =
+
+-                sizeof(*fmp_payload_header));
+-
+-        fmp_payload_header =3D (fmp_payload_header_t*)((char*)image_hea=
der +
+-                sizeof(efi_firmware_management_capsule_image_header_t))=
;
+-
+-#endif
+-        memcpy(&images_info->guid[i], &(image_header->update_image_type=
_id),
+-                                                        sizeof(struct e=
fi_guid));
+-
+-        images_info->version[i] =3D fmp_payload_header->fw_version;
+-        FWU_LOG_MSG("%s: image %i version =3D %d\n\r", __func__, i,
+-                                images_info->version[i]);
+-
+-        FWU_LOG_MSG("%s: image %d at %p, size=3D%u\n\r", __func__, i,
+-                        images_info->image[i], images_info->size[i]);
+-
+-        if ((fmp_capsule_header->item_offset_list[i] +
+-             sizeof(efi_firmware_management_capsule_image_header_t) +
+-             image_header->update_image_size) > total_size)
+-        {
+-            return UEFI_CAPSULE_PARSER_ERROR;
+-        }
+-
+-    }
+-
+-    FWU_LOG_MSG("%s: exit\n\r", __func__);
+-    return UEFI_CAPSULE_PARSER_SUCCESS;
+-}
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_c=
apsule_parser.h b/platform/ext/target/arm/corstone1000/fw_update_agent/ue=
fi_capsule_parser.h
+deleted file mode 100644
+index a31cd8a3a..000000000
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_capsule_=
parser.h
++++ /dev/null
+@@ -1,33 +0,0 @@
+-/*
+- * Copyright (c) 2021, Arm Limited. All rights reserved.
+- *
+- * SPDX-License-Identifier: BSD-3-Clause
+- *
+- */
+-
+-#ifndef UEFI_CAPSULE_PARSER_H
+-#define UEFI_CAPSULE_PARSER_H
+-
+-#include <stdint.h>
+-#include "fip_parser/external/uuid.h"
+-#include "flash_layout.h"
+-
+-#define AUTHENTICATED_CAPSULE 1
+-
+-enum uefi_capsule_error_t {
+-    UEFI_CAPSULE_PARSER_SUCCESS =3D 0,
+-    UEFI_CAPSULE_PARSER_ERROR =3D (-1)
+-};
+-
+-typedef struct capsule_image_info {
+-    uint32_t nr_image;
+-    void *image[NR_OF_IMAGES_IN_FW_BANK];
+-    struct efi_guid guid[NR_OF_IMAGES_IN_FW_BANK];
+-    uint32_t size[NR_OF_IMAGES_IN_FW_BANK];
+-    uint32_t version[NR_OF_IMAGES_IN_FW_BANK];
+-} capsule_image_info_t;
+-
+-enum uefi_capsule_error_t uefi_capsule_retrieve_images(void* capsule_pt=
r,
+-        capsule_image_info_t* images_info);
+-
+-#endif /* UEFI_CAPSULE_PARSER_H */
+diff --git a/platform/ext/target/arm/corstone1000/partition/flash_layout=
.h b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
+index b183d1242..58b02229b 100644
+--- a/platform/ext/target/arm/corstone1000/partition/flash_layout.h
++++ b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2017-2024 Arm Limited. All rights reserved.
++ * Copyright (c) 2017-2025 Arm Limited. All rights reserved.
+  *
+  * Licensed under the Apache License, Version 2.0 (the "License");
+  * you may not use this file except in compliance with the License.
+@@ -134,8 +134,16 @@
+                                              */
+=20
+ /* Bank configurations */
+-#define BANK_PARTITION_SIZE             (0xFE0000)   /* 15.875 MB */
+-#define TFM_PARTITION_SIZE              (0x50000)    /* 320 KB */
++#define BANK_PARTITION_SIZE               (0xFE0000)   /* 15.875 MB */
++#define SE_BL2_PARTITION_BANK_OFFSET      (0)
++#define TFM_PARTITION_SIZE                (0x50000)    /* 320 KB */
++#define TFM_PARTITION_BANK_OFFSET         (SE_BL2_PARTITION_SIZE)
++
++#define FIP_PARTITION_SIZE                (0x200000)   /* 2 MB */
++#define FIP_PARTITION_BANK_OFFSET         (TFM_PARTITION_BANK_OFFSET + =
TFM_PARTITION_SIZE)
++
++#define INITRAMFS_PARTITION_SIZE          (0xC00000)   /* 12 MB */
++#define INITRAMFS_PARTITION_BANK_OFFSET   (FIP_PARTITION_BANK_OFFSET + =
FIP_PARTITION_SIZE)
+=20
+ /************************************************************/
+ /* Bank : Images flash offsets are with respect to the bank */
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index f49a4271..87302069 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -43,6 +43,9 @@ SRC_URI:append:corstone1000 =3D " \
     file://0022-CC312-alignment-of-cc312-differences.patch \
     file://0023-Platform-CS1000-Remove-duplicate-configuration-parameter=
s.patch \
     file://0024-Platform-corstone1000-Allow-FWU-calls-in-RSE-COMMS.patch=
 \
+    file://0025-FWU-Make-platform-specific-TFM_FWU_BOOTLOADER_LIB-se.pat=
ch \
+    file://0026-Platform-CS1000-Enable-FWU-partition.patch \
+    file://0027-Platform-Corstone1000-Implement-Bootloader-Abstracti.pat=
ch \
     "
=20
 FILESEXTRAPATHS:prepend:corstone1000-mps3 :=3D "${THISDIR}/files/corston=
e1000/psa-adac:"

