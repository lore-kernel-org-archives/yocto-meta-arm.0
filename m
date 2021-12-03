Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6493C433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 12:29:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10933.1638534562309238760
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 03 Dec 2021 04:29:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EEE621396;
	Fri,  3 Dec 2021 04:29:21 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.4.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 63ABB3F5A1;
	Fri,  3 Dec 2021 04:29:20 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Satish Kumar <satish.kumar01@arm.com>
Subject: [PATCH 06/11] arm-bsp/trusted-firmware-m: corstone1000: firmware
 update changes
Date: Fri,  3 Dec 2021 12:28:56 +0000
Message-Id: <20211203122901.3549-7-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211203122901.3549-1-abdellatif.elkhlifi@arm.com>
References: <20211203122901.3549-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 03 Dec 2021 12:29:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2519

From: Satish Kumar <satish.kumar01@arm.com>

The patchset perform the following changes:

a. Disable secure debug by default.
b. OTA Firmware Update Agent implementation.
c. Implementation of boot index propagation mechanism.
d. Openamp version/commit hash correction.
e. Implementation of host watchdog interrupt handler.

Change-Id: Ie5e1028bb29ce337d51ad8ef47d2bd8175187402
Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
---
 ...000-disable-secure-debug-temporarily.patch |  33 +
 ...ovision-firmware-update-metadata-fwu.patch | 470 +++++++++++++
 ...rse-the-uefi-firmware-update-capsule.patch | 243 +++++++
 ...-firmware-update-fwu-agent-into-TF-M.patch | 106 +++
 ...lement-corstone1000_fwu_flash_images.patch | 437 ++++++++++++
 ...ne1000-add-logic-to-select-boot-bank.patch | 266 ++++++++
 ...rstone1000-integrate-watchdog-driver.patch | 645 ++++++++++++++++++
 ...one1000-impelment-accept-image-logic.patch | 119 ++++
 ...implement-select-previous-bank-logic.patch |  91 +++
 ...-implement-corstone1000_fwu_host_ack.patch | 136 ++++
 ...e-initailize-multi-core-communicatio.patch |  39 ++
 ...plement-timer-to-track-host-progress.patch | 169 +++++
 ...fwu-nv-counter-anti-rollback-support.patch | 369 ++++++++++
 ...stone1000-bug-fix-in-openamp-version.patch |  50 ++
 ...cure-host-watchdog-interrupt-handler.patch |  80 +++
 .../trusted-firmware-m-corstone1000.inc       |  23 +-
 16 files changed, 3275 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0001-corstone1000-disable-secure-debug-temporarily.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0002-corstone1000-provision-firmware-update-metadata-fwu.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0003-corstone1000-parse-the-uefi-firmware-update-capsule.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0004-corstone1000-add-firmware-update-fwu-agent-into-TF-M.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0005-corstone1000-implement-corstone1000_fwu_flash_images.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0006-corstone1000-add-logic-to-select-boot-bank.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0007-corstone1000-integrate-watchdog-driver.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0008-corstone1000-impelment-accept-image-logic.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0009-corstone1000-implement-select-previous-bank-logic.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0010-corstone1000-implement-corstone1000_fwu_host_ack.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0011-SPM-multiple-core-initailize-multi-core-communicatio.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0012-corstone1000-implement-timer-to-track-host-progress.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0013-corstone1000-fwu-nv-counter-anti-rollback-support.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0014-corstone1000-bug-fix-in-openamp-version.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0015-corstone1000-secure-host-watchdog-interrupt-handler.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0001-corstone1000-disable-secure-debug-temporarily.patch b/meta-arm-bs=
p/recipes-bsp/trusted-firmware-m/files/corstone1000/0001-corstone1000-dis=
able-secure-debug-temporarily.patch
new file mode 100644
index 0000000..9b8343c
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001=
-corstone1000-disable-secure-debug-temporarily.patch
@@ -0,0 +1,33 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+
+From beb8a8d92537b9574717f0a9a914642c15b439b1 Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Wed, 29 Sep 2021 04:58:59 +0100
+Subject: [PATCH 01/15] corstone1000: disable secure debug temporarily
+
+Until ARM-DS is ready to use psa-adac secure debug protocol,
+disable the secure debug in the platform. At present, the
+secure debug integration is tested with the PyOCD based
+scripts.
+
+Change-Id: I3dd0f20e5714a2db69425607d9404172ce52129e
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+---
+ platform/ext/target/arm/corstone1000/config.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/config.cmake b/platfor=
m/ext/target/arm/corstone1000/config.cmake
+index dc12d27f9c..203e6b79a6 100644
+--- a/platform/ext/target/arm/corstone1000/config.cmake
++++ b/platform/ext/target/arm/corstone1000/config.cmake
+@@ -37,5 +37,5 @@ set(OPENAMP_VERSION                     "33037b04e0732=
e58fc0fa36afc244999ef632e1
+ if (${PLATFORM_IS_FVP})
+     set(PLATFORM_PSA_ADAC_SECURE_DEBUG      FALSE        CACHE BOOL    =
  "Whether to use psa-adac secure debug.")
+ else()
+-    set(PLATFORM_PSA_ADAC_SECURE_DEBUG      TRUE        CACHE BOOL     =
 "Whether to use psa-adac secure debug.")
++    set(PLATFORM_PSA_ADAC_SECURE_DEBUG      FALSE        CACHE BOOL    =
  "Whether to use psa-adac secure debug.")
+ endif()
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0002-corstone1000-provision-firmware-update-metadata-fwu.patch b/meta-=
arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0002-corstone10=
00-provision-firmware-update-metadata-fwu.patch
new file mode 100644
index 0000000..7297afc
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0002=
-corstone1000-provision-firmware-update-metadata-fwu.patch
@@ -0,0 +1,470 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+
+From 8e2b5cee153763dd35bba1bff3568e2e3c6f58d3 Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Fri, 1 Oct 2021 14:20:55 +0100
+Subject: [PATCH 02/15] corstone1000: provision firmware update metadata =
(fwu)
+
+Firmware update metadata region in the flash is provisioned.
+The metadata is provisioned assuming images are present in
+bank-0.
+
+Change-Id: I2a2274505d80528a3a0cc9211c1c6263415015d8
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+---
+ .../arm/corstone1000/bl1/CMakeLists.txt       |   2 +
+ .../arm/corstone1000/bl1/bl1_boot_hal.c       |  18 +
+ .../corstone1000/fw_update_agent/fwu_agent.c  | 309 ++++++++++++++++++
+ .../corstone1000/fw_update_agent/fwu_agent.h  |  31 ++
+ .../arm/corstone1000/partition/flash_layout.h |  11 +-
+ 5 files changed, 369 insertions(+), 2 deletions(-)
+ create mode 100644 platform/ext/target/arm/corstone1000/fw_update_agent=
/fwu_agent.c
+ create mode 100644 platform/ext/target/arm/corstone1000/fw_update_agent=
/fwu_agent.h
+
+diff --git a/platform/ext/target/arm/corstone1000/bl1/CMakeLists.txt b/p=
latform/ext/target/arm/corstone1000/bl1/CMakeLists.txt
+index 0634fed4b8..92a78c1168 100644
+--- a/platform/ext/target/arm/corstone1000/bl1/CMakeLists.txt
++++ b/platform/ext/target/arm/corstone1000/bl1/CMakeLists.txt
+@@ -238,6 +238,7 @@ target_sources(bl1_main
+         ../Device/Source/system_core_init.c
+         ../Native_Driver/firewall.c
+         ../Native_Driver/uart_pl011_drv.c
++        ../fw_update_agent/fwu_agent.c
+         bl1_boot_hal.c
+         bl1_flash_map.c
+         bl1_security_cnt.c
+@@ -267,6 +268,7 @@ target_include_directories(bl1_main
+         ../CMSIS_Driver/Config
+         ../Device/Config
+         ../Native_Driver
++        ../fw_update_agent
+ )
+=20
+ ############################### SIGNING BL2 image #####################=
#############
+diff --git a/platform/ext/target/arm/corstone1000/bl1/bl1_boot_hal.c b/p=
latform/ext/target/arm/corstone1000/bl1/bl1_boot_hal.c
+index 3d1e3e72fc..5e5e5c9e68 100644
+--- a/platform/ext/target/arm/corstone1000/bl1/bl1_boot_hal.c
++++ b/platform/ext/target/arm/corstone1000/bl1/bl1_boot_hal.c
+@@ -12,8 +12,12 @@
+ #include "Driver_Flash.h"
+ #include "flash_layout.h"
+ #include "bootutil/fault_injection_hardening.h"
++#include "bootutil/bootutil_log.h"
+ #include "firewall.h"
+ #include "mpu_config.h"
++#include "tfm_plat_otp.h"
++#include "tfm_plat_provisioning.h"
++#include "fwu_agent.h"
+=20
+ #if defined(CRYPTO_HW_ACCELERATOR) || \
+     defined(CRYPTO_HW_ACCELERATOR_OTP_PROVISIONING)
+@@ -595,6 +599,20 @@ int32_t boot_platform_init(void)
+     }
+ #endif /* CRYPTO_HW_ACCELERATOR */
+=20
++    result =3D tfm_plat_otp_init();
++    if (result !=3D TFM_PLAT_ERR_SUCCESS) {
++        BOOT_LOG_ERR("OTP system initialization failed");
++        FIH_PANIC;
++    }
++
++    if (tfm_plat_provisioning_is_required()) {
++        result =3D fwu_metadata_provision();
++        if (result !=3D FWU_AGENT_SUCCESS) {
++            BOOT_LOG_ERR("Provisioning FWU Metadata failed");
++            FIH_PANIC;
++        }
++    }
++
+     return 0;
+ }
+=20
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+new file mode 100644
+index 0000000000..b9c507e4ef
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+@@ -0,0 +1,309 @@
++/*
++ * Copyright (c) 2021, Arm Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#include <stdint.h>
++#include <string.h>
++#include "fwu_agent.h"
++#include "Driver_Flash.h"
++#include "flash_layout.h"
++#include "fip_parser/external/uuid.h"
++
++/* Properties of image in a bank */
++struct fwu_image_properties {
++
++        /* UUID of the image in this bank */
++        uuid_t img_uuid;
++
++        /* [0]: bit describing the image acceptance status =E2=80=93
++         *      1 means the image is accepted
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
++        /* UUID identifying the image type */
++        uuid_t img_type_uuid;
++
++        /* UUID of the storage volume where the image is located */
++        uuid_t location_uuid;
++
++        /* Properties of images with img_type_uuid in the different FW =
banks */
++        struct fwu_image_properties img_props[NR_OF_FW_BANKS];
++
++} __packed;
++
++struct fwu_metadata {
++
++        /* Metadata CRC value */
++        uint32_t crc_32;
++
++        /* Metadata version */
++        uint32_t version;
++
++        /* Bank index with which device boots */
++        uint32_t active_index;
++
++        /* Previous bank index with which device booted successfully */
++        uint32_t previous_active_index;
++
++        /* Image entry information */
++        struct fwu_image_entry img_entry[NR_OF_IMAGES_IN_FW_BANK];
++
++} __packed;
++
++/* This is Corstone1000 speific metadata for OTA.
++ * Private metadata is written at next sector following
++ * FWU METADATA location */
++struct fwu_private_metadata {
++
++       /* boot_index: the bank from which system is booted from */
++       uint32_t boot_index;
++
++} __packed;
++
++struct fwu_metadata _metadata;
++int is_initialized =3D 0;
++
++#define IMAGE_ACCEPTED          (1)
++#define IMAGE_NOT_ACCEPTED      (0)
++#define BANK_0                  (0)
++#define BANK_1                  (1)
++#define IMAGE_0                 (0)
++#define IMAGE_1                 (1)
++#define IMAGE_2                 (2)
++#define IMAGE_3                 (3)
++#define INVALID_VERSION         (0xffffffff)
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
++static enum fwu_agent_error_t private_metadata_read(
++        struct fwu_private_metadata* p_metadata)
++{
++    int ret;
++
++    FWU_LOG_MSG("%s: enter\n\r", __func__);
++
++    if (!p_metadata) {
++        return FWU_AGENT_ERROR;
++    }
++
++    ret =3D FWU_METADATA_FLASH_DEV.ReadData(FWU_PRIVATE_AREA_OFFSET, p_=
metadata,
++                                          sizeof(struct fwu_private_met=
adata));
++    if (ret !=3D ARM_DRIVER_OK) {
++        return FWU_AGENT_ERROR;
++    }
++
++    FWU_LOG_MSG("%s: success: boot_index =3D %u\n\r", __func__,
++                        p_metadata->boot_index);
++
++    return FWU_AGENT_SUCCESS;
++}
++
++static enum fwu_agent_error_t private_metadata_write(
++        struct fwu_private_metadata* p_metadata)
++{
++    int ret;
++
++    FWU_LOG_MSG("%s: enter: boot_index =3D %u\n\r", __func__,
++                        p_metadata->boot_index);
++
++    if (!p_metadata) {
++        return FWU_AGENT_ERROR;
++    }
++
++    ret =3D FWU_METADATA_FLASH_DEV.EraseSector(FWU_PRIVATE_AREA_OFFSET)=
;
++    if (ret !=3D ARM_DRIVER_OK) {
++        return FWU_AGENT_ERROR;
++    }
++
++    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(FWU_PRIVATE_AREA_OFFSET,
++                                p_metadata, sizeof(struct fwu_private_m=
etadata));
++    if (ret !=3D ARM_DRIVER_OK) {
++        return FWU_AGENT_ERROR;
++    }
++
++    FWU_LOG_MSG("%s: success\n\r", __func__);
++    return FWU_AGENT_SUCCESS;
++}
++
++static enum fwu_agent_error_t metadata_read(struct fwu_metadata *p_meta=
data)
++{
++    int ret;
++
++    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
++                  FWU_METADATA_REPLICA_1_OFFSET, sizeof(struct fwu_meta=
data));
++
++    if (!p_metadata) {
++        return FWU_AGENT_ERROR;
++    }
++
++    ret =3D FWU_METADATA_FLASH_DEV.ReadData(FWU_METADATA_REPLICA_1_OFFS=
ET,
++                                p_metadata, sizeof(struct fwu_metadata)=
);
++    if (ret !=3D ARM_DRIVER_OK) {
++        return FWU_AGENT_ERROR;
++    }
++
++    FWU_LOG_MSG("%s: success: active =3D %u, previous =3D %d\n\r", __fu=
nc__,
++                  p_metadata->active_index, p_metadata->previous_active=
_index);
++
++    return FWU_AGENT_SUCCESS;
++}
++
++static enum fwu_agent_error_t metadata_write(
++                        struct fwu_metadata *p_metadata)
++{
++    int ret;
++
++    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
++                  FWU_METADATA_REPLICA_1_OFFSET, sizeof(struct fwu_meta=
data));
++
++    if (!p_metadata) {
++        return FWU_AGENT_ERROR;
++    }
++
++    ret =3D FWU_METADATA_FLASH_DEV.EraseSector(FWU_METADATA_REPLICA_1_O=
FFSET);
++    if (ret !=3D ARM_DRIVER_OK) {
++        return FWU_AGENT_ERROR;
++    }
++
++    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(FWU_METADATA_REPLICA_1_O=
FFSET,
++                                p_metadata, sizeof(struct fwu_metadata)=
);
++    if (ret !=3D ARM_DRIVER_OK) {
++        return FWU_AGENT_ERROR;
++    }
++
++    FWU_LOG_MSG("%s: success: active =3D %u, previous =3D %d\n\r", __fu=
nc__,
++                  p_metadata->active_index, p_metadata->previous_active=
_index);
++    return FWU_AGENT_SUCCESS;
++}
++
++enum fwu_agent_error_t fwu_metadata_init(void)
++{
++    enum fwu_agent_error_t ret;
++    ARM_FLASH_INFO* flash_info;
++
++    FWU_LOG_MSG("%s: enter\n\r", __func__);
++
++    if (is_initialized) {
++        return FWU_AGENT_SUCCESS;
++    }
++
++    /* Code assumes everything fits into a sector */
++    if (sizeof(struct fwu_metadata) > FWU_METADATA_FLASH_SECTOR_SIZE) {
++        return FWU_AGENT_ERROR;
++    }
++
++    if (sizeof(struct fwu_private_metadata) > FWU_METADATA_FLASH_SECTOR=
_SIZE) {
++        return FWU_AGENT_ERROR;
++    }
++
++    ret =3D FWU_METADATA_FLASH_DEV.Initialize(NULL);
++    if (ret !=3D ARM_DRIVER_OK) {
++        return FWU_AGENT_ERROR;
++    }
++
++    flash_info =3D FWU_METADATA_FLASH_DEV.GetInfo();
++    if (flash_info->program_unit !=3D 1) {
++        FWU_METADATA_FLASH_DEV.Uninitialize();
++        return FWU_AGENT_ERROR;
++    }
++
++    is_initialized =3D 1;
++
++    FWU_LOG_MSG("%s: is_initialized =3D %d\n\r", __func__, is_initializ=
ed);
++
++    return FWU_AGENT_SUCCESS;
++}
++
++enum fwu_agent_error_t fwu_metadata_provision(void)
++{
++    enum fwu_agent_error_t ret;
++    struct fwu_private_metadata priv_metadata;
++    uint32_t image_version =3D 0;
++
++    FWU_LOG_MSG("%s: enter\n\r", __func__);
++
++    ret =3D fwu_metadata_init();
++    if (ret) {
++        return ret;
++    }
++
++    /* Provision FWU Agent Metadata */
++
++    memset(&_metadata, 0, sizeof(struct fwu_metadata));
++
++    _metadata.version =3D 1;
++    _metadata.active_index =3D 0;
++    _metadata.previous_active_index =3D 1;
++
++    /* bank 0 is the place where images are located at the
++     * start of device lifecycle */
++
++    for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
++
++        _metadata.img_entry[i].img_props[BANK_0].accepted =3D IMAGE_ACC=
EPTED;
++        _metadata.img_entry[i].img_props[BANK_0].version =3D image_vers=
ion;
++
++        _metadata.img_entry[i].img_props[BANK_1].accepted =3D IMAGE_NOT=
_ACCEPTED;
++        _metadata.img_entry[i].img_props[BANK_1].version =3D INVALID_VE=
RSION;
++    }
++
++    ret =3D metadata_write(&_metadata);
++    if (ret) {
++        return ret;
++    }
++
++    memset(&_metadata, 0, sizeof(struct fwu_metadata));
++    ret =3D metadata_read(&_metadata);
++    if (ret) {
++        return ret;
++    }
++    FWU_LOG_MSG("%s: provisioned values: active =3D %u, previous =3D %d=
\n\r",
++             __func__, _metadata.active_index, _metadata.previous_activ=
e_index);
++
++
++    /* Provision Private metadata for update agent which is shared
++       beween BL1 and tf-m of secure enclave */
++
++    memset(&priv_metadata, 0, sizeof(struct fwu_private_metadata));
++
++    priv_metadata.boot_index =3D BANK_0;
++
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
++
++    FWU_LOG_MSG("%s: FWU METADATA PROVISIONED.\n\r", __func__);
++    return FWU_AGENT_SUCCESS;
++}
++
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.h b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
+new file mode 100644
+index 0000000000..449d354100
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
+@@ -0,0 +1,31 @@
++/*
++ * Copyright (c) 2021, Arm Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#ifndef FWU_AGENT_H
++#define FWU_AGENT_H
++
++/* Set 1 to enable debug messages */
++#define ENABLE_DEBUG_LOGS         1
++
++#if (ENABLE_DEBUG_LOGS =3D=3D 1)
++    #include <stdio.h>
++    #define FWU_LOG_MSG(f_, ...) printf((f_), ##__VA_ARGS__)
++#else
++    #define FWU_LOG_MSG(f_, ...)
++#endif
++
++enum fwu_agent_error_t {
++        FWU_AGENT_SUCCESS =3D 0,
++        FWU_AGENT_ERROR =3D (-1)
++};
++
++enum fwu_agent_error_t fwu_metadata_provision(void);
++enum fwu_agent_error_t fwu_metadata_init(void);
++
++
++#endif /* FWU_AGENT_H */
++
+diff --git a/platform/ext/target/arm/corstone1000/partition/flash_layout=
.h b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
+index f120a7b8ee..47445d9d29 100644
+--- a/platform/ext/target/arm/corstone1000/partition/flash_layout.h
++++ b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
+@@ -117,11 +117,18 @@
+=20
+=20
+ /* 1MB: space in flash to store metadata and uefi variables */
++#define FWU_METADATA_FLASH_DEV          (FLASH_DEV_NAME)
++#define FWU_METADATA_FLASH_SECTOR_SIZE  (FLASH_SECTOR_SIZE)
++
+ #define FWU_METADATA_PARTITION_OFFSET   (FLASH_BASE_OFFSET)
+-#define FWU_METADATA_AREA_SIZE          (FLASH_SECTOR_SIZE)     /* 4KB =
*/
++#define FWU_METADATA_AREA_SIZE          (FWU_METADATA_FLASH_SECTOR_SIZE=
)
+ #define FWU_METADATA_REPLICA_1_OFFSET   (FLASH_BASE_OFFSET)
+ #define FWU_METADATA_REPLICA_2_OFFSET   (FWU_METADATA_REPLICA_1_OFFSET =
+ \
+                                          FWU_METADATA_AREA_SIZE)
++#define FWU_PRIVATE_AREA_SIZE           (FLASH_SECTOR_SIZE)
++#define FWU_PRIVATE_AREA_OFFSET         (FWU_METADATA_REPLICA_2_OFFSET =
+ \
++                                         FWU_METADATA_AREA_SIZE)
++
+ #define NR_OF_FW_BANKS                  (2)
+ #define NR_OF_IMAGES_IN_FW_BANK         (4) /* Secure Enclave: BL2 and =
TF-M \
+                                              * Host: FIP and Kernel ima=
ge
+@@ -217,7 +224,7 @@
+ /*** ITS, PS and NV Counters ***/
+ /*******************************/
+=20
+-#define FLASH_ITS_AREA_OFFSET           (0)
++#define FLASH_ITS_AREA_OFFSET           (0x10000)  /* 64 KB */
+ #define FLASH_ITS_AREA_SIZE             (4 * FLASH_SECTOR_SIZE)  /* 4 K=
iB */
+=20
+ #define FLASH_PS_AREA_OFFSET            (FLASH_ITS_AREA_OFFSET + \
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0003-corstone1000-parse-the-uefi-firmware-update-capsule.patch b/meta-=
arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003-corstone10=
00-parse-the-uefi-firmware-update-capsule.patch
new file mode 100644
index 0000000..fb8f2d4
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003=
-corstone1000-parse-the-uefi-firmware-update-capsule.patch
@@ -0,0 +1,243 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+
+From 22aeb7708773c2cc9df2cc501d411b94c09fd0bd Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Sat, 2 Oct 2021 12:31:07 +0100
+Subject: [PATCH 03/15] corstone1000: parse the uefi firmware update caps=
ule
+
+The Host (OTA Client) sends a capsule containing fwu images
+to secure enclave. The commit parses the capsule to retrieve
+images.
+
+Change-Id: Icf097cf88911a568bdc9eba8c98e2da93994f0bc
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+---
+ .../target/arm/corstone1000/CMakeLists.txt    |   2 +
+ .../fw_update_agent/uefi_capsule_parser.c     | 155 ++++++++++++++++++
+ .../fw_update_agent/uefi_capsule_parser.h     |  31 ++++
+ 3 files changed, 188 insertions(+)
+ create mode 100644 platform/ext/target/arm/corstone1000/fw_update_agent=
/uefi_capsule_parser.c
+ create mode 100644 platform/ext/target/arm/corstone1000/fw_update_agent=
/uefi_capsule_parser.h
+
+diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platf=
orm/ext/target/arm/corstone1000/CMakeLists.txt
+index 16d256bc34..f34035d361 100644
+--- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
++++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
+@@ -51,6 +51,7 @@ target_include_directories(platform_s
+         services/include
+     INTERFACE
+         cc312
++        fw_update_agent
+ )
+=20
+ target_sources(platform_s
+@@ -67,6 +68,7 @@ target_sources(platform_s
+         tfm_hal_platform.c
+         ${CMAKE_SOURCE_DIR}/platform/ext/common/tfm_hal_nvic.c
+         $<$<BOOL:TFM_PARTITION_PLATFORM>:${CMAKE_CURRENT_SOURCE_DIR}/se=
rvices/src/tfm_platform_system.c>
++        fw_update_agent/uefi_capsule_parser.c
+ )
+=20
+ if (PLATFORM_IS_FVP)
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_c=
apsule_parser.c b/platform/ext/target/arm/corstone1000/fw_update_agent/ue=
fi_capsule_parser.c
+new file mode 100644
+index 0000000000..32133b2eb2
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_capsule_=
parser.c
+@@ -0,0 +1,155 @@
++/*
++ * Copyright (c) 2021, Arm Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#include "uefi_capsule_parser.h"
++#include "fwu_agent.h"
++#include <string.h>
++
++/*
++Update Capsule Structure (UEFI spec 2.9 1004)
++    EFI_CAPSULE_HEADER
++    ...
++    ...
++    ...
++    CAPSULE_BODY
++        efi_firmware_management_capsule_header
++        Optional Driver 1 (item_offset[0])
++        Optional Driver 2 (item_offset[1])
++            Payload 1 (item_offset[2])
++                efi_firmware_management_capsule_iamge_header
++                Binary Update image (Image_length =3D=3D update_image_s=
ize)
++                Vendor Code bytes  (Data lenght =3D=3D update_vendorcod=
e_size)
++            Payload 2 (item_offset[3])
++            ...
++            ...
++            Payload n (item_offset[embedded_driver_count + payload_item=
_count -1])
++*/
++
++typedef struct {
++    struct efi_guid         capsule_guid;
++    uint32_t                header_size;
++    uint32_t                flags;
++    uint32_t                capsule_image_size;
++} efi_capsule_header_t;
++
++typedef struct {
++    uint32_t                version;
++    uint16_t                embedded_driver_count;
++    uint16_t                payload_item_count;
++    uint64_t                item_offset_list[];
++} efi_firmware_management_capsule_header_t;
++
++typedef struct {
++    uint32_t                version;
++    struct efi_guid         update_image_type_id;
++    uint8_t                 update_image_index;
++    uint8_t                 reserved_bytes[3];
++    uint32_t                update_image_size;
++    uint32_t                update_vendorcode_size;
++    uint64_t                update_hardware_instance; //introduced in v=
2
++    uint64_t                image_capsule_support; //introduced in v3
++} efi_firmware_management_capsule_image_header_t;
++
++#define ANYSIZE_ARRAY 0
++
++typedef struct {
++    uint32_t                dwLength;
++    uint16_t                wRevision;
++    uint16_t                wCertificateType;
++    uint8_t                 bCertificate[ANYSIZE_ARRAY];
++} WIN_CERTIFICATE;
++
++typedef struct {
++    WIN_CERTIFICATE         hdr;
++    struct efi_guid         cert_type;
++    uint8_t                 cert_data[ANYSIZE_ARRAY];
++} win_certificate_uefi_guid_t;
++
++typedef struct {
++    uint64_t                    monotonic_count;
++    win_certificate_uefi_guid_t   auth_info;
++} efi_firmware_image_authentication_t;
++
++
++enum uefi_capsule_error_t uefi_capsule_retrieve_images(void* capsule_pt=
r,
++        capsule_image_info_t* images_info)
++{
++    char *ptr =3D (char*)capsule_ptr;
++    efi_capsule_header_t* capsule_header;
++    efi_firmware_management_capsule_header_t* payload_header;
++    efi_firmware_management_capsule_image_header_t* image_header;
++    efi_firmware_image_authentication_t* image_auth;
++    uint32_t total_size;
++    uint32_t image_count;
++    uint32_t auth_size;
++
++    FWU_LOG_MSG("%s: enter, capsule ptr =3D 0x%p\n\r", __func__, capsul=
e_ptr);
++
++    if (!capsule_ptr) {
++        return UEFI_CAPSULE_PARSER_ERROR;
++    }
++
++    capsule_header =3D (efi_capsule_header_t*)ptr;
++    ptr +=3D sizeof(efi_capsule_header_t) + sizeof(uint32_t);
++    payload_header =3D (efi_firmware_management_capsule_header_t*)ptr;
++
++    total_size =3D capsule_header->capsule_image_size;
++    image_count =3D payload_header->payload_item_count;
++    images_info->nr_image =3D image_count;
++
++    FWU_LOG_MSG("%s: capsule size =3D %u, image count =3D %u\n\r", __fu=
nc__,
++                        total_size, image_count);
++
++    if ((image_count =3D=3D 0) || (image_count > NR_OF_IMAGES_IN_FW_BAN=
K)) {
++        return UEFI_CAPSULE_PARSER_ERROR;
++    }
++
++    for (int i =3D 0; i < image_count; i++) {
++
++        image_header =3D (efi_firmware_management_capsule_image_header_=
t*)(ptr +
++                                payload_header->item_offset_list[i]);
++
++        images_info->size[i] =3D image_header->update_image_size;
++        images_info->version[i] =3D image_header->version;
++        FWU_LOG_MSG("%s: image %i version =3D %u\n\r", __func__, i,
++                                images_info->version[i]);
++
++        image_auth =3D (efi_firmware_image_authentication_t*)(
++                        (char*)image_header +
++                        sizeof (efi_firmware_management_capsule_image_h=
eader_t)
++                     );
++        auth_size =3D sizeof(uint64_t) /* monotonic_count */  +
++                    image_auth->auth_info.hdr.dwLength /* WIN_CERTIFICA=
TE + cert_data */ +
++                    sizeof(struct efi_guid) /* cert_type */;
++
++        FWU_LOG_MSG("%s: auth size =3D %u\n\r", __func__, auth_size);
++
++        images_info->size[i] -=3D auth_size;
++
++        images_info->image[i] =3D (
++                (char*)image_header +
++                sizeof(efi_firmware_management_capsule_image_header_t) =
+
++                auth_size);
++
++        memcpy(&images_info->guid[i], &(image_header->update_image_type=
_id),
++                                                        sizeof(struct e=
fi_guid));
++
++        FWU_LOG_MSG("%s: image %d at %p, size=3D%u\n\r", __func__, i,
++                        images_info->image[i], images_info->size[i]);
++
++        if ((payload_header->item_offset_list[i] +
++             sizeof(efi_firmware_management_capsule_image_header_t) +
++             image_header->update_image_size) > total_size)
++        {
++            return UEFI_CAPSULE_PARSER_ERROR;
++        }
++
++    }
++
++    FWU_LOG_MSG("%s: exit\n\r", __func__);
++    return UEFI_CAPSULE_PARSER_SUCCESS;
++}
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_c=
apsule_parser.h b/platform/ext/target/arm/corstone1000/fw_update_agent/ue=
fi_capsule_parser.h
+new file mode 100644
+index 0000000000..a890a709e9
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_capsule_=
parser.h
+@@ -0,0 +1,31 @@
++/*
++ * Copyright (c) 2021, Arm Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#ifndef UEFI_CAPSULE_PARSER_H
++#define UEFI_CAPSULE_PARSER_H
++
++#include <stdint.h>
++#include "fip_parser/external/uuid.h"
++#include "flash_layout.h"
++
++enum uefi_capsule_error_t {
++    UEFI_CAPSULE_PARSER_SUCCESS =3D 0,
++    UEFI_CAPSULE_PARSER_ERROR =3D (-1)
++};
++
++typedef struct capsule_image_info {
++    uint32_t nr_image;
++    void *image[NR_OF_IMAGES_IN_FW_BANK];
++    struct efi_guid guid[NR_OF_IMAGES_IN_FW_BANK];
++    uint32_t size[NR_OF_IMAGES_IN_FW_BANK];
++    uint32_t version[NR_OF_IMAGES_IN_FW_BANK];
++} capsule_image_info_t;
++
++enum uefi_capsule_error_t uefi_capsule_retrieve_images(void* capsule_pt=
r,
++        capsule_image_info_t* images_info);
++
++#endif /* UEFI_CAPSULE_PARSER_H */
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0004-corstone1000-add-firmware-update-fwu-agent-into-TF-M.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0004-corstone1=
000-add-firmware-update-fwu-agent-into-TF-M.patch
new file mode 100644
index 0000000..f450ba4
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0004=
-corstone1000-add-firmware-update-fwu-agent-into-TF-M.patch
@@ -0,0 +1,106 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+
+From c1ae09844562f33ddf07b8f5ca6b7d98ccbaf24c Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Sat, 2 Oct 2021 18:48:31 +0100
+Subject: [PATCH 04/15] corstone1000: add firmware update (fwu) agent int=
o TF-M
+
+The commit links the firmware-update (fwu) agent into the
+TF-M.
+
+The commit also configures the secure enclave firewall to
+access DRAM, where uefi capsule will be written by ota client
+for fwu agent to parse.
+
+Change-Id: I89617a9b515d6aa5cc4f383b5a75a4beef73cc33
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+---
+ .../ext/target/arm/corstone1000/CMakeLists.txt  |  1 +
+ .../Device/Include/platform_base_address.h      |  1 +
+ .../target/arm/corstone1000/bl1/bl1_boot_hal.c  | 17 +++++++++++++++++
+ .../target/arm/corstone1000/tfm_hal_platform.c  |  5 +++++
+ 4 files changed, 24 insertions(+)
+
+diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platf=
orm/ext/target/arm/corstone1000/CMakeLists.txt
+index f34035d361..81623f16ff 100644
+--- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
++++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
+@@ -69,6 +69,7 @@ target_sources(platform_s
+         ${CMAKE_SOURCE_DIR}/platform/ext/common/tfm_hal_nvic.c
+         $<$<BOOL:TFM_PARTITION_PLATFORM>:${CMAKE_CURRENT_SOURCE_DIR}/se=
rvices/src/tfm_platform_system.c>
+         fw_update_agent/uefi_capsule_parser.c
++        fw_update_agent/fwu_agent.c
+ )
+=20
+ if (PLATFORM_IS_FVP)
+diff --git a/platform/ext/target/arm/corstone1000/Device/Include/platfor=
m_base_address.h b/platform/ext/target/arm/corstone1000/Device/Include/pl=
atform_base_address.h
+index 5f37caa09c..e86ddcfbc9 100644
+--- a/platform/ext/target/arm/corstone1000/Device/Include/platform_base_=
address.h
++++ b/platform/ext/target/arm/corstone1000/Device/Include/platform_base_=
address.h
+@@ -75,5 +75,6 @@
+ #define CORSTONE1000_HOST_FPGA_SCC_REGISTERS       (0x80000000U) /* FPG=
A SCC Registers                */
+ #define CORSTONE1000_HOST_SE_SECURE_FLASH_BASE_FVP (0x80010000U) /* SE =
Flash                          */
+ #define CORSTONE1000_HOST_AXI_QSPI_CTRL_REG_BASE   (0x80050000U) /* AXI=
 QSPI Controller               */
++#define CORSTONE1000_HOST_DRAM_UEFI_CAPSULE        (0xA0000000U) /* 1.5=
 GB DDR                        */
+=20
+ #endif  /* __PLATFORM_BASE_ADDRESS_H__ */
+diff --git a/platform/ext/target/arm/corstone1000/bl1/bl1_boot_hal.c b/p=
latform/ext/target/arm/corstone1000/bl1/bl1_boot_hal.c
+index 5e5e5c9e68..54042495d7 100644
+--- a/platform/ext/target/arm/corstone1000/bl1/bl1_boot_hal.c
++++ b/platform/ext/target/arm/corstone1000/bl1/bl1_boot_hal.c
+@@ -47,6 +47,7 @@ REGION_DECLARE(Image$$, ARM_LIB_HEAP, $$ZI$$Limit)[];
+ #define HOST_AXI_QSPI_CTRL_REG_BASE_SE_SECURE_FLASH    0x60010000
+=20
+ #define HOST_DRAM_BASE                  0x80000000
++#define HOST_DRAM_UEFI_CAPSULE          0x80000000
+=20
+ #define SE_MID                          0
+=20
+@@ -249,6 +250,22 @@ static void setup_se_firewall(void)
+     fc_enable_mpe(RGN_MPE0);
+     fc_enable_regions();
+=20
++    /* DDR/DRAM/UEFI_CAPSULE: 32MB */
++    fc_select_region(6);
++    fc_disable_regions();
++    fc_disable_mpe(RGN_MPE0);
++    fc_prog_rgn(RGN_SIZE_32MB, CORSTONE1000_HOST_DRAM_UEFI_CAPSULE);
++    fc_prog_rgn_upper_addr(HOST_DRAM_UEFI_CAPSULE);
++    fc_enable_addr_trans();
++    fc_init_mpl(RGN_MPE0);
++    mpl_rights =3D (RGN_MPL_SECURE_READ_MASK |
++                  RGN_MPL_SECURE_WRITE_MASK);
++
++    fc_enable_mpl(RGN_MPE0, mpl_rights);
++    fc_prog_mid(RGN_MPE0, SE_MID);
++    fc_enable_mpe(RGN_MPE0);
++    fc_enable_regions();
++
+=20
+     fc_pe_enable();
+ }
+diff --git a/platform/ext/target/arm/corstone1000/tfm_hal_platform.c b/p=
latform/ext/target/arm/corstone1000/tfm_hal_platform.c
+index 71472ea08c..0072b5b928 100644
+--- a/platform/ext/target/arm/corstone1000/tfm_hal_platform.c
++++ b/platform/ext/target/arm/corstone1000/tfm_hal_platform.c
+@@ -8,11 +8,16 @@
+ #include "cmsis.h"
+ #include "tfm_hal_platform.h"
+ #include "uart_stdout.h"
++#include "fwu_agent.h"
+=20
+ enum tfm_hal_status_t tfm_hal_platform_init(void)
+ {
+     __enable_irq();
+     stdio_init();
+=20
++    if (fwu_metadata_init()) {
++        return TFM_HAL_ERROR_GENERIC;
++    }
++
+     return TFM_HAL_SUCCESS;
+ }
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0005-corstone1000-implement-corstone1000_fwu_flash_images.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0005-corstone1=
000-implement-corstone1000_fwu_flash_images.patch
new file mode 100644
index 0000000..cbe5b93
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0005=
-corstone1000-implement-corstone1000_fwu_flash_images.patch
@@ -0,0 +1,437 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+
+From 593087034655eca09ff8e80e67c3252399fa0ce7 Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Sat, 2 Oct 2021 18:51:21 +0100
+Subject: [PATCH 05/15] corstone1000: implement corstone1000_fwu_flash_im=
ages
+
+The API, corstone1000_fwu_flash_images, is an non-secure host
+inteface (firmware update client) to send new updatable images,
+and to start the update process. The implementation of the API does
+version verfification before coping the images to the update bank.
+After copy, the platform is reset.
+
+On successful call to the API, the firmware update state of the
+system changes from regular state to trial state. On reset,
+the system is expected but not guaranteed to boot from the
+update/trial bank.
+
+Change-Id: I6c278145ec95ec522f7e59d00e1640a039c9778e
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+---
+ .../corstone1000/CMSIS_Driver/Driver_Flash.c  |  11 +
+ .../corstone1000/Native_Driver/flash_common.h |   1 +
+ .../corstone1000/fw_update_agent/fwu_agent.c  | 225 ++++++++++++++++++
+ .../corstone1000/fw_update_agent/fwu_agent.h  |  11 +
+ .../include/corstone1000_ioctl_requests.h     |  32 +++
+ .../services/src/tfm_platform_system.c        |  24 +-
+ 6 files changed, 300 insertions(+), 4 deletions(-)
+ create mode 100644 platform/ext/target/arm/corstone1000/services/includ=
e/corstone1000_ioctl_requests.h
+
+diff --git a/platform/ext/target/arm/corstone1000/CMSIS_Driver/Driver_Fl=
ash.c b/platform/ext/target/arm/corstone1000/CMSIS_Driver/Driver_Flash.c
+index 10952d4cbe..01c535e094 100644
+--- a/platform/ext/target/arm/corstone1000/CMSIS_Driver/Driver_Flash.c
++++ b/platform/ext/target/arm/corstone1000/CMSIS_Driver/Driver_Flash.c
+@@ -175,6 +175,11 @@ int32_t Select_XIP_Mode_For_Shared_Flash(void)
+     return ARM_DRIVER_OK;
+ }
+=20
++int32_t Select_Write_Mode_For_Shared_Flash(void)
++{
++    return ARM_DRIVER_OK;
++}
++
+ static int32_t STRATAFLASHJ3_Initialize(ARM_Flash_SignalEvent_t cb_even=
t)
+ {
+     ARG_UNUSED(cb_event);
+@@ -392,6 +397,12 @@ int32_t Select_XIP_Mode_For_Shared_Flash(void)
+     return ARM_DRIVER_OK;
+ }
+=20
++int32_t Select_Write_Mode_For_Shared_Flash(void)
++{
++    select_qspi_mode(&AXI_QSPI_DEV_S);
++    return ARM_DRIVER_OK;
++}
++
+ static ARM_FLASH_CAPABILITIES N25Q256A_Driver_GetCapabilities(void)
+ {
+     return N25Q256ADriverCapabilities;
+diff --git a/platform/ext/target/arm/corstone1000/Native_Driver/flash_co=
mmon.h b/platform/ext/target/arm/corstone1000/Native_Driver/flash_common.=
h
+index 76d5303f83..2e91fb2db4 100644
+--- a/platform/ext/target/arm/corstone1000/Native_Driver/flash_common.h
++++ b/platform/ext/target/arm/corstone1000/Native_Driver/flash_common.h
+@@ -18,6 +18,7 @@ extern "C"
+ #include "Driver_Common.h"
+=20
+ int32_t Select_XIP_Mode_For_Shared_Flash(void);
++int32_t Select_Write_Mode_For_Shared_Flash(void);
+=20
+ #ifdef  __cplusplus
+ }
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+index b9c507e4ef..7fa64db0f7 100644
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+@@ -11,6 +11,10 @@
+ #include "Driver_Flash.h"
+ #include "flash_layout.h"
+ #include "fip_parser/external/uuid.h"
++#include "region_defs.h"
++#include "uefi_capsule_parser.h"
++#include "flash_common.h"
++#include "platform_base_address.h"
+=20
+ /* Properties of image in a bank */
+ struct fwu_image_properties {
+@@ -73,9 +77,27 @@ struct fwu_private_metadata {
+=20
+ } __packed;
+=20
++
+ struct fwu_metadata _metadata;
++
+ int is_initialized =3D 0;
+=20
++capsule_image_info_t capsule_info;
++
++enum fwu_agent_state_t {
++    FWU_AGENT_STATE_UNKNOWN =3D -1,
++    FWU_AGENT_STATE_REGULAR =3D 0,
++    FWU_AGENT_STATE_TRIAL,
++};
++
++struct efi_guid full_capsule_image_guid =3D {
++    .time_low =3D 0x3a770ddc,
++    .time_mid =3D 0x409b,
++    .time_hi_and_version =3D 0x48b2,
++    .clock_seq_and_node =3D {0x81, 0x41, 0x93, 0xb7, 0xc6, 0x0b, 0x20, =
0x9e}
++};
++
++
+ #define IMAGE_ACCEPTED          (1)
+ #define IMAGE_NOT_ACCEPTED      (0)
+ #define BANK_0                  (0)
+@@ -84,8 +106,12 @@ int is_initialized =3D 0;
+ #define IMAGE_1                 (1)
+ #define IMAGE_2                 (2)
+ #define IMAGE_3                 (3)
++#define IMAGE_END               (IMAGE_3)
++#define IMAGE_ALL               (IMAGE_END + 1)
++#define IMAGE_NOT_RECOGNIZED    (-1)
+ #define INVALID_VERSION         (0xffffffff)
+=20
++
+ #ifndef FWU_METADATA_FLASH_DEV
+     #ifndef FLASH_DEV_NAME
+     #error "FWU_METADATA_FLASH_DEV or FLASH_DEV_NAME must be defined in=
 flash_layout.h"
+@@ -307,3 +333,202 @@ enum fwu_agent_error_t fwu_metadata_provision(void=
)
+     return FWU_AGENT_SUCCESS;
+ }
+=20
++static enum fwu_agent_state_t get_fwu_agent_state(
++        struct fwu_metadata *metadata_ptr,
++        struct fwu_private_metadata *priv_metadata_ptr)
++{
++    uint32_t boot_index;
++
++    FWU_LOG_MSG("%s: enter\n\r", __func__);
++
++    boot_index =3D priv_metadata_ptr->boot_index;
++
++    if (boot_index !=3D metadata_ptr->active_index) {
++        return FWU_AGENT_STATE_TRIAL;
++    }
++
++    for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
++        if ((metadata_ptr->img_entry[i].img_props[boot_index].accepted)
++                =3D=3D (IMAGE_NOT_ACCEPTED)) {
++            return FWU_AGENT_STATE_TRIAL;
++        }
++    }
++
++    FWU_LOG_MSG("%s: exit: FWU_AGENT_STATE_REGULAR\n\r", __func__);
++    return FWU_AGENT_STATE_REGULAR;
++}
++
++static int get_image_info_in_bank(struct efi_guid* guid, uint32_t* imag=
e_bank_offset)
++{
++    if ((memcmp(guid, &full_capsule_image_guid, sizeof(struct efi_guid)=
)) =3D=3D 0) {
++        *image_bank_offset =3D 0;
++        return IMAGE_ALL;
++    }
++
++    return IMAGE_NOT_RECOGNIZED;
++}
++
++static enum fwu_agent_error_t erase_bank(uint32_t bank_offset)
++{
++    int ret;
++    uint32_t sectors;
++
++    FWU_LOG_MSG("%s: enter\n\r", __func__);
++
++    if ((bank_offset % FWU_METADATA_FLASH_SECTOR_SIZE) !=3D 0) {
++        return FWU_AGENT_ERROR;
++    }
++
++    if ((BANK_PARTITION_SIZE % FWU_METADATA_FLASH_SECTOR_SIZE) !=3D 0) =
{
++        return FWU_AGENT_ERROR;
++    }
++
++    sectors =3D BANK_PARTITION_SIZE / FWU_METADATA_FLASH_SECTOR_SIZE;
++
++    FWU_LOG_MSG("%s: erasing sectors =3D %u, from offset =3D %u\n\r", _=
_func__,
++                     sectors, bank_offset);
++
++    for (int i =3D 0; i < sectors; i++) {
++        ret =3D FWU_METADATA_FLASH_DEV.EraseSector(
++                bank_offset + (i * FWU_METADATA_FLASH_SECTOR_SIZE));
++        if (ret !=3D ARM_DRIVER_OK) {
++            return FWU_AGENT_ERROR;
++        }
++    }
++
++    FWU_LOG_MSG("%s: exit\n\r", __func__);
++    return FWU_AGENT_SUCCESS;
++}
++
++
++static enum fwu_agent_error_t flash_full_capsule(
++        struct fwu_metadata* metadata, void* images, uint32_t size,
++        uint32_t version)
++{
++    int ret;
++    uint32_t active_index =3D metadata->active_index;
++    uint32_t bank_offset;
++    uint32_t previous_active_index;
++
++    FWU_LOG_MSG("%s: enter: image =3D 0x%p, size =3D %u, version =3D %u=
\n\r"
++                , __func__, images, size, version);
++
++    if (!metadata || !images) {
++        return FWU_AGENT_ERROR;
++    }
++
++    if (size > BANK_PARTITION_SIZE) {
++        return FWU_AGENT_ERROR;
++    }
++
++    if (version <=3D
++            (metadata->img_entry[IMAGE_0].img_props[active_index].versi=
on)) {
++        return FWU_AGENT_ERROR;
++    }
++
++    if (active_index =3D=3D BANK_0) {
++        previous_active_index =3D BANK_1;
++        bank_offset =3D BANK_1_PARTITION_OFFSET;
++    } else if (active_index =3D=3D BANK_1) {
++        previous_active_index =3D BANK_0;
++        bank_offset =3D BANK_0_PARTITION_OFFSET;
++    } else {
++        return FWU_AGENT_ERROR;
++    }
++
++    if (erase_bank(bank_offset)) {
++        return FWU_AGENT_ERROR;
++    }
++
++    FWU_LOG_MSG("%s: writing capsule to the flash at offset =3D %u...\n=
\r",
++                      __func__, bank_offset);
++    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(bank_offset, images, siz=
e);
++    if (ret !=3D ARM_DRIVER_OK) {
++        return FWU_AGENT_ERROR;
++    }
++    FWU_LOG_MSG("%s: images are written to bank offset =3D %u\n\r", __f=
unc__,
++                     bank_offset);
++
++    /* Change system state to trial bank state */
++    for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
++        metadata->img_entry[i].img_props[previous_active_index].accepte=
d =3D
++                                                        IMAGE_NOT_ACCEP=
TED;
++        metadata->img_entry[i].img_props[previous_active_index].version=
 =3D version;
++    }
++    metadata->active_index =3D previous_active_index;
++    metadata->previous_active_index =3D active_index;
++
++    ret =3D metadata_write(metadata);
++    if (ret) {
++        return ret;
++    }
++
++    FWU_LOG_MSG("%s: exit\n\r", __func__);
++    return FWU_AGENT_SUCCESS;
++}
++
++enum fwu_agent_error_t corstone1000_fwu_flash_image(void)
++{
++    enum fwu_agent_error_t ret;
++    struct fwu_private_metadata priv_metadata;
++    enum fwu_agent_state_t current_state;
++    void *capsule_ptr =3D (char*)CORSTONE1000_HOST_DRAM_UEFI_CAPSULE;
++    int image_index;
++    uint32_t image_bank_offset;
++    uint32_t nr_images;
++
++    FWU_LOG_MSG("%s: enter\n\r", __func__);
++
++    if (!is_initialized) {
++        return FWU_AGENT_ERROR;
++    }
++
++    Select_Write_Mode_For_Shared_Flash();
++
++    if (metadata_read(&_metadata)) {
++        ret =3D  FWU_AGENT_ERROR;
++        goto out;
++    }
++
++    if (private_metadata_read(&priv_metadata)) {
++        ret =3D  FWU_AGENT_ERROR;
++        goto out;
++    }
++
++    /* Firmware update process can only start in regular state. */
++    current_state =3D get_fwu_agent_state(&_metadata, &priv_metadata);
++    if (current_state !=3D FWU_AGENT_STATE_REGULAR) {
++        ret =3D  FWU_AGENT_ERROR;
++        goto out;
++    }
++
++    memset(&capsule_info, 0, sizeof(capsule_image_info_t));
++    if (uefi_capsule_retrieve_images(capsule_ptr, &capsule_info)) {
++        ret =3D  FWU_AGENT_ERROR;
++        goto out;
++    }
++    nr_images =3D capsule_info.nr_image;
++
++    for (int i =3D 0; i < nr_images; i++) {
++        image_index =3D get_image_info_in_bank(&capsule_info.guid[i],
++                                &image_bank_offset);
++        switch(image_index) {
++            case IMAGE_ALL:
++                ret =3D flash_full_capsule(&_metadata, capsule_info.ima=
ge[i],
++                                         capsule_info.size[i],
++                                         capsule_info.version[i]);
++                break;
++            default:
++                FWU_LOG_MSG("%s: sent image not recognized\n\r", __func=
__);
++                ret =3D FWU_AGENT_ERROR;
++                break;
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
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.h b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
+index 449d354100..f5ab877ef1 100644
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
+@@ -23,9 +23,20 @@ enum fwu_agent_error_t {
+         FWU_AGENT_ERROR =3D (-1)
+ };
+=20
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
+ enum fwu_agent_error_t fwu_metadata_provision(void);
+ enum fwu_agent_error_t fwu_metadata_init(void);
+=20
++/* host to secure enclave:
++ * firwmare update image is sent accross
++ */
++enum fwu_agent_error_t corstone1000_fwu_flash_image(void);
+=20
+ #endif /* FWU_AGENT_H */
+=20
+diff --git a/platform/ext/target/arm/corstone1000/services/include/corst=
one1000_ioctl_requests.h b/platform/ext/target/arm/corstone1000/services/=
include/corstone1000_ioctl_requests.h
+new file mode 100644
+index 0000000000..8ac67346b6
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/services/include/corstone1000=
_ioctl_requests.h
+@@ -0,0 +1,32 @@
++/*
++ * Copyright (c) 2021, Arm Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#ifndef CORSTONE1000_IOCTL_REQUESTS_H
++#define CORSTONE1000_IOCTL_REQUESTS_H
++
++#include<stdint.h>
++
++
++enum corstone1000_ioctl_id_t {
++   IOCTL_CORSTONE1000_FWU_FLASH_IMAGES =3D 0,
++   IOCTL_CORSTONE1000_FWU_HOST_ACK,
++};
++
++
++typedef struct corstone1000_ioctl_in_params {
++
++    uint32_t ioctl_id;
++
++} corstone1000_ioctl_in_params_t;
++
++typedef struct corstone1000_ioctl_out_params {
++
++    int32_t result;
++
++} corstone1000_ioctl_out_params_t;
++
++#endif /* CORSTONE1000_IOCTL_REQUESTS_H */
+diff --git a/platform/ext/target/arm/corstone1000/services/src/tfm_platf=
orm_system.c b/platform/ext/target/arm/corstone1000/services/src/tfm_plat=
form_system.c
+index ed31c8895a..f9629a1688 100644
+--- a/platform/ext/target/arm/corstone1000/services/src/tfm_platform_sys=
tem.c
++++ b/platform/ext/target/arm/corstone1000/services/src/tfm_platform_sys=
tem.c
+@@ -7,6 +7,8 @@
+=20
+ #include "tfm_platform_system.h"
+ #include "platform_description.h"
++#include "corstone1000_ioctl_requests.h"
++#include "fwu_agent.h"
+=20
+ void tfm_platform_hal_system_reset(void)
+ {
+@@ -18,8 +20,22 @@ enum tfm_platform_err_t tfm_platform_hal_ioctl(tfm_pl=
atform_ioctl_req_t request,
+                                                psa_invec  *in_vec,
+                                                psa_outvec *out_vec)
+ {
+-    (void)in_vec;
+-    (void)out_vec;
+-    /* No IOCTL is ipmlemented */
+-    return TFM_PLATFORM_ERR_NOT_SUPPORTED;
++    int32_t ret =3D TFM_PLATFORM_ERR_SUCCESS;
++    const corstone1000_ioctl_in_params_t *in_params =3D
++                                    (corstone1000_ioctl_in_params_t *)i=
n_vec->base;
++    corstone1000_ioctl_out_params_t *out_params =3D (corstone1000_ioctl=
_out_params_t *)out_vec->base;
++
++    switch(in_params->ioctl_id) {
++        case IOCTL_CORSTONE1000_FWU_FLASH_IMAGES:
++            out_params->result =3D corstone1000_fwu_flash_image();
++            if (!out_params->result) {
++                NVIC_SystemReset();
++            }
++            break;
++        default:
++            ret =3D TFM_PLATFORM_ERR_NOT_SUPPORTED;
++            break;
++    }
++
++    return ret;
+ }
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0006-corstone1000-add-logic-to-select-boot-bank.patch b/meta-arm-bsp/r=
ecipes-bsp/trusted-firmware-m/files/corstone1000/0006-corstone1000-add-lo=
gic-to-select-boot-bank.patch
new file mode 100644
index 0000000..7a98f41
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006=
-corstone1000-add-logic-to-select-boot-bank.patch
@@ -0,0 +1,266 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+
+From 7ec8812451a4e25ca0790f84c7a0ee1f260f864c Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Mon, 11 Oct 2021 20:12:46 +0100
+Subject: [PATCH 06/15] corstone1000: add logic to select boot bank
+
+Bl1 selects the boot bank depending upon the firmware update state
+of the system. When in the trial state, new images are being tried,
+BL1 select trial/update image bank for a pre-determined number of
+times. If in all attempts, the trial bank fails to boot, BL1 falls
+back to the previous active bank. For any reason, if previous active
+bank also fails to boot for that pre-determined number of times,
+the BL1 simply goes into an assert halt state. Idealy a recovery
+mechanism should boot but this is currently out-of-scope for the
+project.
+
+BL2 logic simply tries to boot from the bank selected by the BL1.
+
+It is expected that the fail boots are detected by secure enclave,
+and in those cases, reset of the system is triggered.
+
+Change-Id: I773752f789bf8b402436c61134ac79bb405553b5
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+---
+ .../target/arm/corstone1000/CMakeLists.txt    |   2 +
+ .../arm/corstone1000/bl1/bl1_boot_hal.c       |   6 +-
+ .../target/arm/corstone1000/bl2_boot_hal.c    |   8 +-
+ .../corstone1000/fw_update_agent/fwu_agent.c  | 102 ++++++++++++++++++
+ .../corstone1000/fw_update_agent/fwu_agent.h  |   5 +-
+ 5 files changed, 117 insertions(+), 6 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platf=
orm/ext/target/arm/corstone1000/CMakeLists.txt
+index 81623f16ff..a2191c835f 100644
+--- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
++++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
+@@ -109,6 +109,7 @@ target_sources(platform_bl2
+         Native_Driver/uart_pl011_drv.c
+         fip_parser/fip_parser.c
+         bl2_boot_hal.c
++        fw_update_agent/fwu_agent.c
+ )
+=20
+ if (PLATFORM_IS_FVP)
+@@ -155,6 +156,7 @@ target_include_directories(platform_bl2
+         ${MCUBOOT_PATH}/boot/bootutil/include # for fault_injection_har=
dening.h only
+         ${CMAKE_BINARY_DIR}/bl2/ext/mcuboot # for mcuboot_config.h only
+         $<BUILD_INTERFACE:${BL2_SOURCE}/ext/mcuboot/include>
++        fw_update_agent
+ )
+=20
+ #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D BL1 component =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D#
+diff --git a/platform/ext/target/arm/corstone1000/bl1/bl1_boot_hal.c b/p=
latform/ext/target/arm/corstone1000/bl1/bl1_boot_hal.c
+index 54042495d7..2af5b8c846 100644
+--- a/platform/ext/target/arm/corstone1000/bl1/bl1_boot_hal.c
++++ b/platform/ext/target/arm/corstone1000/bl1/bl1_boot_hal.c
+@@ -587,7 +587,7 @@ extern void add_bank_offset_to_image_offset(uint32_t=
 bank_offset);
+ int32_t boot_platform_init(void)
+ {
+     int32_t result;
+-    uint32_t bank_offset =3D BANK_0_PARTITION_OFFSET;
++    uint32_t bank_offset;
+=20
+ #if !(PLATFORM_IS_FVP)
+     setup_mpu();
+@@ -596,7 +596,6 @@ int32_t boot_platform_init(void)
+ #if !(PLATFORM_IS_FVP)
+     setup_host_firewall();
+ #endif
+-    add_bank_offset_to_image_offset(bank_offset);
+=20
+     result =3D FLASH_DEV_NAME.Initialize(NULL);
+     if (result !=3D ARM_DRIVER_OK) {
+@@ -630,6 +629,9 @@ int32_t boot_platform_init(void)
+         }
+     }
+=20
++    bl1_get_boot_bank(&bank_offset);
++    add_bank_offset_to_image_offset(bank_offset);
++
+     return 0;
+ }
+=20
+diff --git a/platform/ext/target/arm/corstone1000/bl2_boot_hal.c b/platf=
orm/ext/target/arm/corstone1000/bl2_boot_hal.c
+index 75d2cb60d8..4f5b48a2e0 100644
+--- a/platform/ext/target/arm/corstone1000/bl2_boot_hal.c
++++ b/platform/ext/target/arm/corstone1000/bl2_boot_hal.c
+@@ -18,6 +18,7 @@
+ #include <string.h>
+ #include "tfm_plat_otp.h"
+ #include "tfm_plat_provisioning.h"
++#include "fwu_agent.h"
+=20
+ #ifdef PLATFORM_PSA_ADAC_SECURE_DEBUG
+ #include "psa_adac_platform.h"
+@@ -112,15 +113,13 @@ int32_t boot_platform_init(void)
+ {
+     int32_t result;
+     enum tfm_plat_err_t plat_err;
+-    uint32_t bank_offset =3D BANK_0_PARTITION_OFFSET;
++    uint32_t bank_offset;
+=20
+     result =3D fill_bl2_flash_map_by_parsing_fips(BANK_0_PARTITION_OFFS=
ET);
+     if (result) {
+         return 1;
+     }
+=20
+-    add_bank_offset_to_image_offset(bank_offset);
+-
+     result =3D FLASH_DEV_NAME.Initialize(NULL);
+     if (result !=3D ARM_DRIVER_OK) {
+         return 1;
+@@ -154,6 +153,9 @@ int32_t boot_platform_init(void)
+     }
+ #endif
+=20
++    bl2_get_boot_bank(&bank_offset);
++    add_bank_offset_to_image_offset(bank_offset);
++
+     return 0;
+ }
+=20
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+index 7fa64db0f7..23a15ee71b 100644
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+@@ -75,8 +75,12 @@ struct fwu_private_metadata {
+        /* boot_index: the bank from which system is booted from */
+        uint32_t boot_index;
+=20
++       /* counter: tracking number of boot attempted so far */
++       uint32_t boot_attempted;
++
+ } __packed;
+=20
++#define MAX_BOOT_ATTEMPTS_PER_BANK 3
+=20
+ struct fwu_metadata _metadata;
+=20
+@@ -315,6 +319,7 @@ enum fwu_agent_error_t fwu_metadata_provision(void)
+     memset(&priv_metadata, 0, sizeof(struct fwu_private_metadata));
+=20
+     priv_metadata.boot_index =3D BANK_0;
++    priv_metadata.boot_attempted =3D 0;
+=20
+     ret =3D private_metadata_write(&priv_metadata);
+     if (ret) {
+@@ -532,3 +537,100 @@ out:
+     return ret;
+ }
+=20
++void bl1_get_boot_bank(uint32_t *bank_offset)
++{
++    struct fwu_private_metadata priv_metadata;
++    enum fwu_agent_state_t current_state;
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
++    if (metadata_read(&_metadata)) {
++        FWU_ASSERT(0);
++    }
++
++    current_state =3D get_fwu_agent_state(&_metadata, &priv_metadata);
++
++    if (current_state =3D=3D FWU_AGENT_STATE_REGULAR) {
++        boot_index =3D _metadata.active_index;
++        FWU_ASSERT(boot_index =3D=3D priv_metadata.boot_index);
++        boot_attempted =3D 0;
++    } else if (current_state =3D=3D FWU_AGENT_STATE_TRIAL) {
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
++    if (private_metadata_write(&priv_metadata)) {
++        FWU_ASSERT(0);
++    }
++
++    if (boot_index =3D=3D BANK_0) {
++        *bank_offset =3D BANK_0_PARTITION_OFFSET;
++    } else if (boot_index =3D=3D BANK_1) {
++        *bank_offset =3D BANK_1_PARTITION_OFFSET;
++    } else {
++        FWU_ASSERT(0);
++    }
++
++    FWU_LOG_MSG("%s: exit: booting from bank =3D %u, offset =3D %x\n\r"=
, __func__,
++                        boot_index, *bank_offset);
++
++    return;
++}
++
++void bl2_get_boot_bank(uint32_t *bank_offset)
++{
++    uint32_t boot_index;
++    struct fwu_private_metadata priv_metadata;
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
++    boot_index =3D priv_metadata.boot_index;
++
++    if (boot_index =3D=3D BANK_0) {
++        *bank_offset =3D BANK_0_PARTITION_OFFSET;
++    } else if (boot_index =3D=3D BANK_1) {
++        *bank_offset =3D BANK_1_PARTITION_OFFSET;
++    } else {
++        FWU_ASSERT(0);
++    }
++
++    FWU_LOG_MSG("%s: exit: booting from bank =3D %u, offset =3D %x\n\r"=
, __func__,
++                        boot_index, *bank_offset);
++
++    return;
++}
++
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.h b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
+index f5ab877ef1..389381c326 100644
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
+@@ -38,5 +38,8 @@ enum fwu_agent_error_t fwu_metadata_init(void);
+  */
+ enum fwu_agent_error_t corstone1000_fwu_flash_image(void);
+=20
+-#endif /* FWU_AGENT_H */
+=20
++void bl1_get_boot_bank(uint32_t *bank_offset);
++void bl2_get_boot_bank(uint32_t *bank_offset);
++
++#endif /* FWU_AGENT_H */
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0007-corstone1000-integrate-watchdog-driver.patch b/meta-arm-bsp/recip=
es-bsp/trusted-firmware-m/files/corstone1000/0007-corstone1000-integrate-=
watchdog-driver.patch
new file mode 100644
index 0000000..afd3dc8
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0007=
-corstone1000-integrate-watchdog-driver.patch
@@ -0,0 +1,645 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+
+From d8c6e41ee040d19748915d2c598df1c4b90a93a8 Mon Sep 17 00:00:00 2001
+From: Harry Moulton <harry.moulton@arm.com>
+Date: Tue, 5 Oct 2021 12:40:57 +0100
+Subject: [PATCH 07/15] corstone1000: integrate watchdog driver
+
+This change integrates and enables the watchdog timer driver
+inside the BL1, BL2 and TF-M. SoC and SE watchdogs are enabled,
+meaning the system should get reset if software becomes
+unresponsive.
+
+Signed-off-by: Harry Moulton <harry.moulton@arm.com>
+Change-Id: Iab957a58025aac98140bb71289a269443529e8ed
+---
+ .../target/arm/corstone1000/CMakeLists.txt    |   4 +
+ .../Native_Driver/arm_watchdog_drv.c          | 190 ++++++++++++++++++
+ .../Native_Driver/arm_watchdog_drv.h          | 179 +++++++++++++++++
+ .../arm/corstone1000/Native_Driver/watchdog.c |  81 ++++++++
+ .../arm/corstone1000/Native_Driver/watchdog.h |  32 +++
+ .../arm/corstone1000/bl1/CMakeLists.txt       |   2 +
+ .../arm/corstone1000/bl1/bl1_boot_hal.c       |   6 +
+ .../target/arm/corstone1000/bl2_boot_hal.c    |   6 +
+ .../arm/corstone1000/tfm_hal_platform.c       |   5 +
+ 9 files changed, 505 insertions(+)
+ create mode 100644 platform/ext/target/arm/corstone1000/Native_Driver/a=
rm_watchdog_drv.c
+ create mode 100644 platform/ext/target/arm/corstone1000/Native_Driver/a=
rm_watchdog_drv.h
+ create mode 100644 platform/ext/target/arm/corstone1000/Native_Driver/w=
atchdog.c
+ create mode 100644 platform/ext/target/arm/corstone1000/Native_Driver/w=
atchdog.h
+
+diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platf=
orm/ext/target/arm/corstone1000/CMakeLists.txt
+index a2191c835f..cb66bd48d6 100644
+--- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
++++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
+@@ -62,6 +62,8 @@ target_sources(platform_s
+         Device/Source/system_core_init.c
+         Native_Driver/uart_pl011_drv.c
+         Native_Driver/mhu_v2_x.c
++        Native_Driver/watchdog.c
++        Native_Driver/arm_watchdog_drv.c
+         spm_hal.c
+         tfm_hal_multi_core.c
+         tfm_hal_isolation.c
+@@ -107,6 +109,8 @@ target_sources(platform_bl2
+         Device/Source/device_definition.c
+         Device/Source/system_core_init.c
+         Native_Driver/uart_pl011_drv.c
++        Native_Driver/watchdog.c
++        Native_Driver/arm_watchdog_drv.c
+         fip_parser/fip_parser.c
+         bl2_boot_hal.c
+         fw_update_agent/fwu_agent.c
+diff --git a/platform/ext/target/arm/corstone1000/Native_Driver/arm_watc=
hdog_drv.c b/platform/ext/target/arm/corstone1000/Native_Driver/arm_watch=
dog_drv.c
+new file mode 100644
+index 0000000000..b6323c99a5
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/Native_Driver/arm_watchdog_dr=
v.c
+@@ -0,0 +1,190 @@
++/*
++ * Copyright (c) 2016-2020 Arm Limited
++ *
++ * Licensed under the Apache License, Version 2.0 (the "License");
++ * you may not use this file except in compliance with the License.
++ * You may obtain a copy of the License at
++ *
++ *     http://www.apache.org/licenses/LICENSE-2.0
++ *
++ * Unless required by applicable law or agreed to in writing, software
++ * distributed under the License is distributed on an "AS IS" BASIS,
++ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or impl=
ied.
++ * See the License for the specific language governing permissions and
++ * limitations under the License.
++ */
++
++#include "arm_watchdog_drv.h"
++
++/* Watchdog control definitions */
++#define ARM_WATCHDOG_CTRL_INTEN        (0x1UL << 0)
++#define ARM_WATCHDOG_CTRL_RESEN        (0x1UL << 1)
++#define ARM_WATCHDOG_INTCLR            1UL
++#define ARM_WATCHDOG_RAWINTSTAT        1UL
++#define ARM_WATCHDOG_MASKINTSTAT       1UL
++#define ARM_WATCHDOG_UNLOCK_VALUE      0x1ACCE551
++#define ARM_WATCHDOG_LOCK_VALUE        0x00000001
++#define ARM_WATCHDOG_INTEGTESTEN       1UL
++#define ARM_WATCHDOG_INTEGTESTOUTSET   1UL
++#define ARM_WATCHDOG_MAX_VALUE         0xFFFFFFFF
++
++/* Watchdog state definitions */
++#define ARM_WATCHDOG_INITIALIZED  (1ul << 0)
++#define ARM_WATCHDOG_ENABLED      (1ul << 1)
++
++/* ARM watchdog memory mapped register access structure */
++struct arm_watchdog_t {
++    volatile uint32_t  load;          /* Offset: 0x000 (R/W) Load regis=
ter */
++    volatile uint32_t  value;         /* Offset: 0x004 (R/ ) Value regi=
ster */
++    volatile uint32_t  ctrl;          /* Offset: 0x008 (R/W) Control re=
gister */
++    volatile uint32_t  intclr;        /* Offset: 0x00C ( /W) Clear inte=
rrupt
++                                       *                     register *=
/
++    volatile uint32_t  rawintstat;    /* Offset: 0x010 (R/ ) Raw interr=
upt
++                                       *                     status reg=
ister */
++    volatile uint32_t  maskintstat;   /* Offset: 0x014 (R/ ) Interrupt =
status
++                                       *                     register *=
/
++    volatile uint32_t  reserved0[762];
++    volatile uint32_t  lock;          /* Offset: 0xC00 (R/W) Lock regis=
ter */
++    volatile uint32_t  reserved1[191];
++    volatile uint32_t  itcr;          /* Offset: 0xF00 (R/W) Integratio=
n test
++                                       *                     control re=
gister */
++    volatile uint32_t  itop;          /* Offset: 0xF04 ( /W) Integratio=
n Test
++                                       *                     output set
++                                       *                     register *=
/
++};
++
++void arm_watchdog_init(struct arm_watchdog_dev_t* dev, uint32_t timeout=
)
++{
++    /*
++     * The init function leaves the watchdog in a clean state:
++     *  - initialized;
++     *  - disabled;
++     *  - locked.
++     */
++    if (arm_watchdog_is_enabled(dev)) {
++        arm_watchdog_unlock(dev);
++        (void)arm_watchdog_disable(dev);
++    }
++    arm_watchdog_lock(dev);
++
++    if (timeout =3D=3D 0)
++        dev->data->timeout =3D ARM_WATCHDOG_MAX_VALUE;
++    else
++        dev->data->timeout =3D timeout;
++
++    dev->data->state =3D ARM_WATCHDOG_INITIALIZED;
++}
++
++enum arm_watchdog_error_t arm_watchdog_feed(struct arm_watchdog_dev_t* =
dev)
++{
++    struct arm_watchdog_t* p_wdog =3D (struct arm_watchdog_t*)dev->cfg-=
>base;
++
++    if (!arm_watchdog_is_enabled(dev))
++        return ARM_WATCHDOG_ERR_NOT_ENAB;
++
++    if (arm_watchdog_is_locked(dev))
++        return ARM_WATCHDOG_ERR_LOCKED;
++
++    p_wdog->load =3D dev->data->timeout;
++
++    return ARM_WATCHDOG_ERR_NONE;
++}
++
++enum arm_watchdog_error_t
++arm_watchdog_clear_interrupt_and_refresh_counter(struct arm_watchdog_de=
v_t* dev)
++{
++    struct arm_watchdog_t* p_wdog =3D (struct arm_watchdog_t*)dev->cfg-=
>base;
++
++    if (!arm_watchdog_is_enabled(dev))
++        return ARM_WATCHDOG_ERR_NOT_ENAB;
++
++    if (arm_watchdog_is_locked(dev))
++        return ARM_WATCHDOG_ERR_LOCKED;
++
++    p_wdog->intclr =3D ARM_WATCHDOG_INTCLR;
++
++    return ARM_WATCHDOG_ERR_NONE;
++}
++
++enum arm_watchdog_error_t arm_watchdog_enable(struct arm_watchdog_dev_t=
* dev)
++{
++    struct arm_watchdog_t* p_wdog =3D (struct arm_watchdog_t*)dev->cfg-=
>base;
++
++    if (!arm_watchdog_is_initialized(dev))
++        return ARM_WATCHDOG_ERR_NOT_INIT;
++
++    if (arm_watchdog_is_locked(dev))
++        return ARM_WATCHDOG_ERR_LOCKED;
++
++    p_wdog->load =3D dev->data->timeout;
++
++    /* Starts the watchdog counter */
++    p_wdog->ctrl =3D (ARM_WATCHDOG_CTRL_RESEN | ARM_WATCHDOG_CTRL_INTEN=
);
++    dev->data->state |=3D ARM_WATCHDOG_ENABLED;
++
++    return ARM_WATCHDOG_ERR_NONE;
++}
++
++uint32_t arm_watchdog_is_enabled(struct arm_watchdog_dev_t* dev)
++{
++    return (dev->data->state & ARM_WATCHDOG_ENABLED);
++}
++
++enum arm_watchdog_error_t arm_watchdog_disable(struct arm_watchdog_dev_=
t* dev)
++{
++    struct arm_watchdog_t* p_wdog =3D (struct arm_watchdog_t*)dev->cfg-=
>base;
++
++    if (!arm_watchdog_is_enabled(dev))
++        return ARM_WATCHDOG_ERR_NOT_ENAB;
++
++    if (arm_watchdog_is_locked(dev))
++        return ARM_WATCHDOG_ERR_LOCKED;
++
++    /* Stops the watchdog */
++    p_wdog->ctrl &=3D ~(ARM_WATCHDOG_CTRL_RESEN | ARM_WATCHDOG_CTRL_INT=
EN);
++    dev->data->state &=3D ~ARM_WATCHDOG_ENABLED;
++
++    return ARM_WATCHDOG_ERR_NONE;
++}
++
++void arm_watchdog_lock(struct arm_watchdog_dev_t* dev)
++{
++    struct arm_watchdog_t* p_wdog =3D (struct arm_watchdog_t*)dev->cfg-=
>base;
++
++    /* Prevents writing to all of the registers */
++    p_wdog->lock =3D ARM_WATCHDOG_LOCK_VALUE;
++}
++
++uint32_t arm_watchdog_is_locked(struct arm_watchdog_dev_t* dev)
++{
++    struct arm_watchdog_t* p_wdog =3D (struct arm_watchdog_t*)dev->cfg-=
>base;
++
++    /* The lock register can only return 0 or 1 when read */
++    return p_wdog->lock;
++}
++
++void arm_watchdog_unlock(struct arm_watchdog_dev_t* dev)
++{
++    struct arm_watchdog_t* p_wdog =3D (struct arm_watchdog_t*)dev->cfg-=
>base;
++
++    p_wdog->lock =3D ARM_WATCHDOG_UNLOCK_VALUE;
++}
++
++inline uint32_t arm_watchdog_is_initialized(struct arm_watchdog_dev_t* =
dev)
++{
++    return (dev->data->state & ARM_WATCHDOG_INITIALIZED);
++}
++
++uint32_t arm_watchdog_get_remaining_time(struct arm_watchdog_dev_t* dev=
)
++{
++    struct arm_watchdog_t* p_wdog =3D (struct arm_watchdog_t*)dev->cfg-=
>base;
++
++    if (!arm_watchdog_is_enabled(dev))
++        return 0;
++
++    if (arm_watchdog_is_locked(dev))
++        return 0;
++
++    return p_wdog->value;
++}
++
+diff --git a/platform/ext/target/arm/corstone1000/Native_Driver/arm_watc=
hdog_drv.h b/platform/ext/target/arm/corstone1000/Native_Driver/arm_watch=
dog_drv.h
+new file mode 100644
+index 0000000000..3b163625f5
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/Native_Driver/arm_watchdog_dr=
v.h
+@@ -0,0 +1,179 @@
++/*
++ * Copyright (c) 2016-2020 ARM Limited
++ *
++ * Licensed under the Apache License, Version 2.0 (the "License");
++ * you may not use this file except in compliance with the License.
++ * You may obtain a copy of the License at
++ *
++ *     http://www.apache.org/licenses/LICENSE-2.0
++ *
++ * Unless required by applicable law or agreed to in writing, software
++ * distributed under the License is distributed on an "AS IS" BASIS,
++ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or impl=
ied.
++ * See the License for the specific language governing permissions and
++ * limitations under the License.
++ */
++
++/**
++ * \file arm_watchdog_drv.h
++ * \brief Generic driver for ARM watchdogs.
++ */
++
++#ifndef __ARM_WATCHDOG_DRV_H__
++#define __ARM_WATCHDOG_DRV_H__
++
++#include <stdint.h>
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++enum arm_watchdog_error_t {
++    ARM_WATCHDOG_ERR_NONE =3D 0,  /*!< No error */
++    ARM_WATCHDOG_ERR_NOT_INIT,  /*!< Watchdog is not initialized */
++    ARM_WATCHDOG_ERR_NOT_ENAB,  /*!< Watchdog is not enabled */
++    ARM_WATCHDOG_ERR_LOCKED     /*!< Watchdog is locked */
++};
++
++/* ARM watchdog device configuration structure */
++struct arm_watchdog_dev_cfg_t {
++    const uint32_t base;  /*!< Watchdog base address */
++};
++
++/* ARM watchdog device data structure */
++struct arm_watchdog_dev_data_t {
++    uint32_t state;    /*!< Indicates if the watchdog
++                            is initialized and enabled */
++    uint32_t timeout;  /*!< Timeout to reset in cycles */
++};
++
++/* ARM watchdog device structure */
++struct arm_watchdog_dev_t {
++    const struct arm_watchdog_dev_cfg_t* const cfg;  /*!< Watchdog
++                                                          configuration=
 */
++    struct arm_watchdog_dev_data_t* const data;      /*!< Watchdog data=
 */
++};
++
++/**
++ * \brief Initializes a watchdog hardware.
++ *
++ * \param[in] dev      Watchdog to be initialized \ref arm_watchdog_dev=
_t
++ * \param[in] timeout  Timeout in cycles - 0 assings timeout to max val=
ue.
++ *
++ * \note This function doesn't check if dev is NULL.
++ *       This function leaves the watchdog locked. Before any further
++ *       operations, it needs to be unlocked and locked again.
++ */
++void arm_watchdog_init(struct arm_watchdog_dev_t* dev, uint32_t timeout=
);
++
++/**
++ * \brief Feeds the watchdog to not cause a reset.
++ *
++ * \param[in] dev  Watchdog to be fed \ref arm_watchdog_dev_t
++ *
++ * \return Returns error code as specified in \ref arm_watchdog_error_t
++ *
++ * \note This function doesn't check if dev is NULL.
++ */
++enum arm_watchdog_error_t arm_watchdog_feed(struct arm_watchdog_dev_t* =
dev);
++
++/**
++ * \brief Clear the interrupt and load timeout value to the load regist=
er.
++ *
++ * \param[in] dev   Watchdog to be fed \ref arm_watchdog_dev_t
++ *
++ * \return Returns error code as specified in \ref arm_watchdog_error_t
++ *
++ * \note This function doesn't check if dev is NULL.
++ */
++enum arm_watchdog_error_t
++arm_watchdog_clear_interrupt_and_refresh_counter(
++    struct arm_watchdog_dev_t* dev);
++
++/**
++ * \brief Enables the watchdog.
++ *
++ * \param[in] dev  Watchdog to be enabled \ref arm_watchdog_dev_t
++ *
++ * \return Returns error code as specified in \ref arm_watchdog_error_t
++ *
++ * \note This function doesn't check if dev is NULL.
++ */
++enum arm_watchdog_error_t arm_watchdog_enable(struct arm_watchdog_dev_t=
* dev);
++
++/**
++ * \brief Checks if the watchdog is enabled
++ *
++ * \param[in] dev Watchdog to be checked \ref arm_watchdog_dev_t
++ *
++ * \return 1 if watchdog is enabled, 0 otherwise.
++ *
++ * \note This function doesn't check if dev is NULL.
++ */
++uint32_t arm_watchdog_is_enabled(struct arm_watchdog_dev_t* dev);
++
++/**
++ * \brief Disables the watchdog.
++ *
++ * \param[in] dev  Watchdog to be disabled \ref arm_watchdog_dev_t
++ *
++ * \return 1 if watchdog is enabled, 0 otherwise.
++ *
++ * \note This function doesn't check if dev is NULL.
++ */
++enum arm_watchdog_error_t arm_watchdog_disable(struct arm_watchdog_dev_=
t* dev);
++
++/**
++ * \brief Locks the registers to not be written again.
++ *
++ * \param[in] dev  Watchdog to be locked \ref arm_watchdog_dev_t
++ *
++ * \note This function doesn't check if dev is NULL.
++ */
++void arm_watchdog_lock(struct arm_watchdog_dev_t* dev);
++
++/**
++ * \brief Checks if the watchdog registers are locked
++ *
++ * \param[in] dev Watchdog to be checked \ref arm_watchdog_dev_t
++ *
++ * \return 1 if the registers are locked, 0 otherwise
++ *
++ * \note This function doesn't check if dev is NULL.
++ */
++uint32_t arm_watchdog_is_locked(struct arm_watchdog_dev_t* dev);
++
++/**
++ * \brief Unlocks the registers to configure the watchdog again.
++ *
++ * \param[in] dev  Watchdog to be unlocked \ref arm_watchdog_dev_t
++ *
++ * \note This function doesn't check if dev is NULL.
++ */
++void arm_watchdog_unlock(struct arm_watchdog_dev_t* dev);
++
++/**
++ * \brief Gets if watchdog driver is initialized
++ *
++ * \param[in] dev  Watchdog to be initialized \ref arm_watchdog_dev_t
++ *
++ * \returns 1 if watchdog driver is initialized. Otherwise 0.
++ */
++uint32_t arm_watchdog_is_initialized(struct arm_watchdog_dev_t* dev);
++
++/**
++ * \brief Provides watchdog remaining time before reset.
++ *
++ * \param[in] dev  Watchdog to get the remaining time \ref arm_watchdog=
_dev_t
++ *
++ * \return 0 if watchdog is disabled.
++ *
++ * \note This function doesn't check if dev is NULL.
++ */
++uint32_t arm_watchdog_get_remaining_time(struct arm_watchdog_dev_t* dev=
);
++
++#ifdef __cplusplus
++}
++#endif
++#endif /* __ARM_WATCHDOG_DRV_H__ */
++
+diff --git a/platform/ext/target/arm/corstone1000/Native_Driver/watchdog=
.c b/platform/ext/target/arm/corstone1000/Native_Driver/watchdog.c
+new file mode 100644
+index 0000000000..d375af3afb
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/Native_Driver/watchdog.c
+@@ -0,0 +1,81 @@
++/*
++ * Copyright (c) 2019-2021, Arm Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#include "watchdog.h"
++
++#include "arm_watchdog_drv.h"
++#include "platform_base_address.h"
++#include "Driver_Common.h"
++#include "cmsis.h"
++#include <stdio.h>
++
++/* SoC watchdog config */
++struct arm_watchdog_dev_cfg_t SOC_WD_DEV_CFG =3D {CORSTONE1000_SOC_WATC=
HDOG_BASE};
++struct arm_watchdog_dev_data_t SOC_WD_DEV_DATA;
++struct arm_watchdog_dev_t SOC_WD_DEV =3D {&SOC_WD_DEV_CFG, &SOC_WD_DEV_=
DATA};
++#define SOC_WD_TIMEOUT 0x00030000
++
++/* SE watchdog config */
++struct arm_watchdog_dev_cfg_t SE_WD_DEV_CFG =3D {CORSTONE1000_WATCHDOG_=
TIMER_BASE};
++struct arm_watchdog_dev_data_t SE_WD_DEV_DATA;
++struct arm_watchdog_dev_t SE_WD_DEV =3D {&SE_WD_DEV_CFG, &SE_WD_DEV_DAT=
A};
++#define SE_WD_TIMEOUT 0x0FFFFFFF
++#define SE_WD_IRQn SE_WATCHDOG_TIMER_IRQn
++
++
++/* SoC watchdog */
++void NMI_Handler(void)
++{
++    /* Unlock, clear and lock the watchdog timer */
++    arm_watchdog_unlock(&SOC_WD_DEV);
++    arm_watchdog_clear_interrupt_and_refresh_counter(&SOC_WD_DEV);
++    arm_watchdog_lock(&SOC_WD_DEV);
++}
++
++/* SE watchdog */
++void SE_WATCHDOG_TIMER_IRQHandler(void)
++{
++    /* Unlock, clear and lock the watchdog timer */
++    arm_watchdog_unlock(&SE_WD_DEV);
++    arm_watchdog_clear_interrupt_and_refresh_counter(&SE_WD_DEV);
++    arm_watchdog_lock(&SE_WD_DEV);
++}
++
++int corstone1000_watchdog_init()
++{
++    __disable_irq();
++
++    /* SoC Watchdog setup */
++    arm_watchdog_init(&SOC_WD_DEV, SOC_WD_TIMEOUT);
++    arm_watchdog_unlock(&SOC_WD_DEV);
++    arm_watchdog_enable(&SOC_WD_DEV);
++    arm_watchdog_lock(&SOC_WD_DEV);
++
++    if (!arm_watchdog_is_initialized(&SOC_WD_DEV))
++        return ARM_DRIVER_ERROR_UNSUPPORTED;
++
++    if (!arm_watchdog_is_enabled(&SOC_WD_DEV))
++        return ARM_DRIVER_ERROR_UNSUPPORTED;
++
++    /* SE Watchdog setup */
++    arm_watchdog_init(&SE_WD_DEV, SE_WD_TIMEOUT);
++    arm_watchdog_unlock(&SE_WD_DEV);
++    arm_watchdog_enable(&SE_WD_DEV);
++    arm_watchdog_lock(&SE_WD_DEV);
++
++    NVIC_EnableIRQ(SE_WD_IRQn);
++
++    if (!arm_watchdog_is_initialized(&SE_WD_DEV))
++        return ARM_DRIVER_ERROR_UNSUPPORTED;
++
++    if (!arm_watchdog_is_enabled(&SE_WD_DEV))
++        return ARM_DRIVER_ERROR_UNSUPPORTED;
++
++    __enable_irq();
++   =20
++    return ARM_DRIVER_OK;
++}
+diff --git a/platform/ext/target/arm/corstone1000/Native_Driver/watchdog=
.h b/platform/ext/target/arm/corstone1000/Native_Driver/watchdog.h
+new file mode 100644
+index 0000000000..fd1b7cf124
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/Native_Driver/watchdog.h
+@@ -0,0 +1,32 @@
++/*
++ * Copyright (c) 2019-2021, Arm Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#ifndef WATCHDOG_H
++#define WATCHDOG_H
++
++#include <stddef.h>
++#include <stdint.h>
++
++#include "Driver_Common.h"
++#include "arm_watchdog_drv.h"
++#include "platform_base_address.h"
++
++/**
++ *  \brief Initializes Secure Enclave & SoC Watchdog.
++ *
++ *  \returns ARM Driver return code.
++ */
++int corstone1000_watchdog_init();
++
++/**
++ *  \brief Reset the Secure Enclave & SoC Watchdog's.
++ *=20
++ *  \returns ARM Driver return code.
++ */
++int corstone1000_watchdog_reset_timer();
++
++#endif /* watchdog_h */
+diff --git a/platform/ext/target/arm/corstone1000/bl1/CMakeLists.txt b/p=
latform/ext/target/arm/corstone1000/bl1/CMakeLists.txt
+index 92a78c1168..1737fbee91 100644
+--- a/platform/ext/target/arm/corstone1000/bl1/CMakeLists.txt
++++ b/platform/ext/target/arm/corstone1000/bl1/CMakeLists.txt
+@@ -239,6 +239,8 @@ target_sources(bl1_main
+         ../Native_Driver/firewall.c
+         ../Native_Driver/uart_pl011_drv.c
+         ../fw_update_agent/fwu_agent.c
++        ../Native_Driver/arm_watchdog_drv.c
++        ../Native_Driver/watchdog.c
+         bl1_boot_hal.c
+         bl1_flash_map.c
+         bl1_security_cnt.c
+diff --git a/platform/ext/target/arm/corstone1000/bl1/bl1_boot_hal.c b/p=
latform/ext/target/arm/corstone1000/bl1/bl1_boot_hal.c
+index 2af5b8c846..edde6fb24e 100644
+--- a/platform/ext/target/arm/corstone1000/bl1/bl1_boot_hal.c
++++ b/platform/ext/target/arm/corstone1000/bl1/bl1_boot_hal.c
+@@ -14,6 +14,7 @@
+ #include "bootutil/fault_injection_hardening.h"
+ #include "bootutil/bootutil_log.h"
+ #include "firewall.h"
++#include "watchdog.h"
+ #include "mpu_config.h"
+ #include "tfm_plat_otp.h"
+ #include "tfm_plat_provisioning.h"
+@@ -589,6 +590,11 @@ int32_t boot_platform_init(void)
+     int32_t result;
+     uint32_t bank_offset;
+=20
++    result =3D corstone1000_watchdog_init();
++    if (result !=3D ARM_DRIVER_OK) {
++        return 1;
++    }
++
+ #if !(PLATFORM_IS_FVP)
+     setup_mpu();
+ #endif
+diff --git a/platform/ext/target/arm/corstone1000/bl2_boot_hal.c b/platf=
orm/ext/target/arm/corstone1000/bl2_boot_hal.c
+index 4f5b48a2e0..5c6b78ffb3 100644
+--- a/platform/ext/target/arm/corstone1000/bl2_boot_hal.c
++++ b/platform/ext/target/arm/corstone1000/bl2_boot_hal.c
+@@ -15,6 +15,7 @@
+ #include "bootutil/bootutil_log.h"
+ #include "fip_parser.h"
+ #include "flash_map/flash_map.h"
++#include "watchdog.h"
+ #include <string.h>
+ #include "tfm_plat_otp.h"
+ #include "tfm_plat_provisioning.h"
+@@ -115,6 +116,11 @@ int32_t boot_platform_init(void)
+     enum tfm_plat_err_t plat_err;
+     uint32_t bank_offset;
+=20
++    result =3D corstone1000_watchdog_init();
++    if (result !=3D ARM_DRIVER_OK) {
++        return 1;
++    }
++
+     result =3D fill_bl2_flash_map_by_parsing_fips(BANK_0_PARTITION_OFFS=
ET);
+     if (result) {
+         return 1;
+diff --git a/platform/ext/target/arm/corstone1000/tfm_hal_platform.c b/p=
latform/ext/target/arm/corstone1000/tfm_hal_platform.c
+index 0072b5b928..7faa71eb63 100644
+--- a/platform/ext/target/arm/corstone1000/tfm_hal_platform.c
++++ b/platform/ext/target/arm/corstone1000/tfm_hal_platform.c
+@@ -9,12 +9,17 @@
+ #include "tfm_hal_platform.h"
+ #include "uart_stdout.h"
+ #include "fwu_agent.h"
++#include "watchdog.h"
+=20
+ enum tfm_hal_status_t tfm_hal_platform_init(void)
+ {
+     __enable_irq();
+     stdio_init();
+=20
++    if (corstone1000_watchdog_init()) {
++        return TFM_HAL_ERROR_GENERIC;
++    }
++
+     if (fwu_metadata_init()) {
+         return TFM_HAL_ERROR_GENERIC;
+     }
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0008-corstone1000-impelment-accept-image-logic.patch b/meta-arm-bsp/re=
cipes-bsp/trusted-firmware-m/files/corstone1000/0008-corstone1000-impelme=
nt-accept-image-logic.patch
new file mode 100644
index 0000000..10c2921
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0008=
-corstone1000-impelment-accept-image-logic.patch
@@ -0,0 +1,119 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+
+From 9b2b4e284d36d0433f5aa0af6f13e7eda5c783c0 Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Thu, 14 Oct 2021 05:08:04 +0100
+Subject: [PATCH 08/15] corstone1000: impelment accept image logic
+
+Until all new images in the update/trial bank is accepted,
+the firmware update state of the system remains in the trial
+state. The state changes automatically to regular state when
+all new images in the trial bank is accepted.
+
+This commit adds the logic to accept one of the image type.
+
+Change-Id: I1f18d77b185f2e5dd26d6e02bed792689019b7b8
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+---
+ .../corstone1000/fw_update_agent/fwu_agent.c  | 70 +++++++++++++++++++
+ .../services/src/tfm_platform_system.c        |  2 +-
+ 2 files changed, 71 insertions(+), 1 deletion(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+index 23a15ee71b..a70638e993 100644
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+@@ -537,6 +537,76 @@ out:
+     return ret;
+ }
+=20
++static enum fwu_agent_error_t accept_full_capsule(
++          struct fwu_metadata* metadata,
++          struct fwu_private_metadata* priv_metadata)
++{
++    uint32_t active_index =3D metadata->active_index;
++    enum fwu_agent_error_t ret;
++
++    FWU_LOG_MSG("%s: enter\n\r", __func__);
++
++    for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
++        metadata->img_entry[i].img_props[active_index].accepted =3D
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
++
++    ret =3D metadata_write(metadata);
++    if (ret) {
++        return ret;
++    }
++
++    FWU_LOG_MSG("%s: exit: fwu state is changed to regular\n\r", __func=
__);
++    return FWU_AGENT_SUCCESS;
++}
++
++static enum fwu_agent_error_t fwu_accept_image(struct efi_guid* guid,
++        struct fwu_metadata *metadata,
++        struct fwu_private_metadata *priv_metadata)
++{
++    enum fwu_agent_state_t current_state;
++    int image_index;
++    uint32_t image_bank_offset;
++    enum fwu_agent_error_t ret;
++
++    FWU_LOG_MSG("%s: enter\n\r", __func__);
++
++    /* it is expected to receive this call only when
++       in trial state */
++    current_state =3D get_fwu_agent_state(metadata, priv_metadata);
++    if (current_state !=3D FWU_AGENT_STATE_TRIAL) {
++        return FWU_AGENT_ERROR;
++    }
++
++    /* booted from previous_active_bank, not expected
++     * to receive this call in this state, rather host should
++     * call corstone1000_fwu_select_previous */
++    if (metadata->active_index !=3D priv_metadata->boot_index) {
++        return FWU_AGENT_ERROR;
++    }
++
++    image_index =3D get_image_info_in_bank(guid, &image_bank_offset);
++    switch(image_index) {
++        case IMAGE_ALL:
++            ret =3D accept_full_capsule(metadata, priv_metadata);
++            break;
++        default:
++            FWU_LOG_MSG("%s: sent image not recognized\n\r", __func__);
++            ret =3D FWU_AGENT_ERROR;
++            break;
++    }
++
++    FWU_LOG_MSG("%s: exit: ret =3D %d\n\r", __func__, ret);
++    return ret;
++}
++
+ void bl1_get_boot_bank(uint32_t *bank_offset)
+ {
+     struct fwu_private_metadata priv_metadata;
+diff --git a/platform/ext/target/arm/corstone1000/services/src/tfm_platf=
orm_system.c b/platform/ext/target/arm/corstone1000/services/src/tfm_plat=
form_system.c
+index f9629a1688..16ad975c32 100644
+--- a/platform/ext/target/arm/corstone1000/services/src/tfm_platform_sys=
tem.c
++++ b/platform/ext/target/arm/corstone1000/services/src/tfm_platform_sys=
tem.c
+@@ -21,7 +21,7 @@ enum tfm_platform_err_t tfm_platform_hal_ioctl(tfm_pla=
tform_ioctl_req_t request,
+                                                psa_outvec *out_vec)
+ {
+     int32_t ret =3D TFM_PLATFORM_ERR_SUCCESS;
+-    const corstone1000_ioctl_in_params_t *in_params =3D
++    corstone1000_ioctl_in_params_t *in_params =3D
+                                     (corstone1000_ioctl_in_params_t *)i=
n_vec->base;
+     corstone1000_ioctl_out_params_t *out_params =3D (corstone1000_ioctl=
_out_params_t *)out_vec->base;
+=20
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0009-corstone1000-implement-select-previous-bank-logic.patch b/meta-ar=
m-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009-corstone1000=
-implement-select-previous-bank-logic.patch
new file mode 100644
index 0000000..eb5f096
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009=
-corstone1000-implement-select-previous-bank-logic.patch
@@ -0,0 +1,91 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+
+From a565999300cf5d40c772d3ff29e2020b786a2a10 Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Sat, 16 Oct 2021 09:07:17 +0100
+Subject: [PATCH 09/15] corstone1000: implement select previous bank logi=
c
+
+When firmware update process is not successful, the commit logic
+reverts the system state to previous active bank. With this,
+the state of the system also changes from the trial to regular
+state. System gets reverted back to its previous known good state.
+
+Change-Id: I265635ea984ae9542518a0e389c98e1242e78d10
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+---
+ .../corstone1000/fw_update_agent/fwu_agent.c  | 58 +++++++++++++++++++
+ 1 file changed, 58 insertions(+)
+
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+index a70638e993..89f0a08eb5 100644
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+@@ -607,6 +607,64 @@ static enum fwu_agent_error_t fwu_accept_image(stru=
ct efi_guid* guid,
+     return ret;
+ }
+=20
++static enum fwu_agent_error_t fwu_select_previous(
++        struct fwu_metadata *metadata,
++        struct fwu_private_metadata *priv_metadata)
++{
++    enum fwu_agent_error_t ret;
++    enum fwu_agent_state_t current_state;
++    uint32_t index;
++
++    FWU_LOG_MSG("%s: enter\n\r", __func__);
++
++    /* it is expected to receive this call only when
++       in trial state */
++    current_state =3D get_fwu_agent_state(metadata, priv_metadata);
++    if (current_state !=3D FWU_AGENT_STATE_TRIAL) {
++        return FWU_AGENT_ERROR;
++    }
++
++    /* not expected to receive this call in this state, system
++     * did not boot from previous active index */
++    if (metadata->previous_active_index !=3D priv_metadata->boot_index)=
 {
++        return FWU_AGENT_ERROR;
++    }
++
++    FWU_LOG_MSG("%s: trial state: active index =3D %u, previous active =
=3D %u\n\r",
++            __func__, metadata->active_index, metadata->previous_active=
_index);
++
++    index =3D metadata->previous_active_index;
++    for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
++        if (metadata->img_entry[i].img_props[index].accepted !=3D IMAGE=
_ACCEPTED)
++        {
++            FWU_ASSERT(0);
++        }
++    }
++
++    index =3D metadata->active_index;
++    metadata->active_index =3D metadata->previous_active_index;
++    metadata->previous_active_index =3D index;
++
++    priv_metadata->boot_attempted =3D 0;
++
++    ret =3D private_metadata_write(priv_metadata);
++    if (ret) {
++        return ret;
++    }
++
++    ret =3D metadata_write(metadata);
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
+ void bl1_get_boot_bank(uint32_t *bank_offset)
+ {
+     struct fwu_private_metadata priv_metadata;
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0010-corstone1000-implement-corstone1000_fwu_host_ack.patch b/meta-arm=
-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0010-corstone1000-=
implement-corstone1000_fwu_host_ack.patch
new file mode 100644
index 0000000..1e74065
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0010=
-corstone1000-implement-corstone1000_fwu_host_ack.patch
@@ -0,0 +1,136 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+
+From 0a4c27173e9ac31e6bfe424b6856c4dc612e247a Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Tue, 16 Nov 2021 04:56:52 +0000
+Subject: [PATCH 10/15] corstone1000: implement corstone1000_fwu_host_ack
+
+The host uses the api 'corstone1000_fwu_host_ack' to acknowledge its
+successful boot to the secure enclave. Based on the fwu state of
+the system, the secure enalve decides where to move in the fwu state
+machine. If in regular state, there is nothing to be done. If in
+trial state and firmware update is a success, state moves to regular
+by accepting images in the trial/update bank. Finaly if in trial
+state and firmware update is a failure, state moves to regular by
+reverting to previous known state.
+
+Change-Id: I16657537909916bd19520eac3899501fdb14ecb4
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+---
+ .../corstone1000/fw_update_agent/fwu_agent.c  | 47 +++++++++++++++++++
+ .../corstone1000/fw_update_agent/fwu_agent.h  |  5 ++
+ .../services/src/tfm_platform_system.c        | 14 +++++-
+ 3 files changed, 64 insertions(+), 2 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+index 89f0a08eb5..5e87fd8d5e 100644
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+@@ -762,3 +762,50 @@ void bl2_get_boot_bank(uint32_t *bank_offset)
+     return;
+ }
+=20
++enum fwu_agent_error_t corstone1000_fwu_host_ack(void)
++{
++    enum fwu_agent_error_t ret;
++    struct fwu_private_metadata priv_metadata;
++    enum fwu_agent_state_t current_state;
++
++    FWU_LOG_MSG("%s: enter\n\r", __func__);
++
++    if (!is_initialized) {
++        return FWU_AGENT_ERROR;
++    }
++
++    Select_Write_Mode_For_Shared_Flash();
++
++    if (metadata_read(&_metadata)) {
++        ret =3D FWU_AGENT_ERROR;
++        goto out;
++    }
++
++    if (private_metadata_read(&priv_metadata)) {
++        ret =3D FWU_AGENT_ERROR;
++        goto out;
++    }
++
++    current_state =3D get_fwu_agent_state(&_metadata, &priv_metadata);
++    if (current_state =3D=3D FWU_AGENT_STATE_REGULAR) {
++        ret =3D FWU_AGENT_SUCCESS; /* nothing to be done */
++        goto out;
++    } else if (current_state !=3D FWU_AGENT_STATE_TRIAL) {
++        FWU_ASSERT(0);
++    }
++
++    if (_metadata.active_index !=3D priv_metadata.boot_index) {
++        /* firmware update failed, revert back to previous bank */
++        ret =3D fwu_select_previous(&_metadata, &priv_metadata);
++    } else {
++        /* firmware update successful */
++        ret =3D fwu_accept_image(&full_capsule_image_guid, &_metadata,
++                                &priv_metadata);
++    }
++
++out:
++    Select_XIP_Mode_For_Shared_Flash();
++
++    FWU_LOG_MSG("%s: exit: ret =3D %d\n\r", __func__, ret);
++    return ret;
++}
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.h b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
+index 389381c326..b8f7c676d7 100644
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
+@@ -38,6 +38,11 @@ enum fwu_agent_error_t fwu_metadata_init(void);
+  */
+ enum fwu_agent_error_t corstone1000_fwu_flash_image(void);
+=20
++/* host to secure enclave:
++ * host responds with this api to acknowledge its successful
++ * boot.
++ */
++enum fwu_agent_error_t corstone1000_fwu_host_ack(void);
+=20
+ void bl1_get_boot_bank(uint32_t *bank_offset);
+ void bl2_get_boot_bank(uint32_t *bank_offset);
+diff --git a/platform/ext/target/arm/corstone1000/services/src/tfm_platf=
orm_system.c b/platform/ext/target/arm/corstone1000/services/src/tfm_plat=
form_system.c
+index 16ad975c32..068234dcda 100644
+--- a/platform/ext/target/arm/corstone1000/services/src/tfm_platform_sys=
tem.c
++++ b/platform/ext/target/arm/corstone1000/services/src/tfm_platform_sys=
tem.c
+@@ -21,20 +21,30 @@ enum tfm_platform_err_t tfm_platform_hal_ioctl(tfm_p=
latform_ioctl_req_t request,
+                                                psa_outvec *out_vec)
+ {
+     int32_t ret =3D TFM_PLATFORM_ERR_SUCCESS;
++
+     corstone1000_ioctl_in_params_t *in_params =3D
+-                                    (corstone1000_ioctl_in_params_t *)i=
n_vec->base;
+-    corstone1000_ioctl_out_params_t *out_params =3D (corstone1000_ioctl=
_out_params_t *)out_vec->base;
++                              (corstone1000_ioctl_in_params_t *)in_vec-=
>base;
++
++    corstone1000_ioctl_out_params_t *out_params =3D
++                              (corstone1000_ioctl_out_params_t *)out_ve=
c->base;
+=20
+     switch(in_params->ioctl_id) {
++
+         case IOCTL_CORSTONE1000_FWU_FLASH_IMAGES:
+             out_params->result =3D corstone1000_fwu_flash_image();
+             if (!out_params->result) {
+                 NVIC_SystemReset();
+             }
+             break;
++
++        case IOCTL_CORSTONE1000_FWU_HOST_ACK:
++            out_params->result =3D corstone1000_fwu_host_ack();
++            break;
++
+         default:
+             ret =3D TFM_PLATFORM_ERR_NOT_SUPPORTED;
+             break;
++
+     }
+=20
+     return ret;
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0011-SPM-multiple-core-initailize-multi-core-communicatio.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0011-SPM-multi=
ple-core-initailize-multi-core-communicatio.patch
new file mode 100644
index 0000000..df703d3
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0011=
-SPM-multiple-core-initailize-multi-core-communicatio.patch
@@ -0,0 +1,39 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+
+From 35ab33099d7b091630ec677cbad57abd60105f91 Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Sun, 14 Nov 2021 11:49:11 +0000
+Subject: [PATCH 11/15] SPM: multiple core: initailize multi-core communi=
cation
+ before the non-secure core is out of rest
+
+Tf-m should be ready to receive the communication before non-secure
+has been taken out of rest.
+
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+Change-Id: I0b609fffbed0fc2f09b521389fd50f4e992ad00d
+---
+ secure_fw/spm/cmsis_psa/tfm_multi_core.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/secure_fw/spm/cmsis_psa/tfm_multi_core.c b/secure_fw/spm/cm=
sis_psa/tfm_multi_core.c
+index f830a6f5f7..946d1a60eb 100644
+--- a/secure_fw/spm/cmsis_psa/tfm_multi_core.c
++++ b/secure_fw/spm/cmsis_psa/tfm_multi_core.c
+@@ -25,11 +25,11 @@ void tfm_nspm_thread_entry(void)
+     SPMLOG_DBGMSG("Enabling non-secure core...");
+ #endif
+=20
++    tfm_inter_core_comm_init();
++
+     tfm_hal_boot_ns_cpu(tfm_spm_hal_get_ns_VTOR());
+     tfm_hal_wait_for_ns_cpu_ready();
+=20
+-    tfm_inter_core_comm_init();
+-
+     /*
+      * TODO
+      * The infinite-loop can be replaced with platform-specific low-pow=
er sleep
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0012-corstone1000-implement-timer-to-track-host-progress.patch b/meta-=
arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0012-corstone10=
00-implement-timer-to-track-host-progress.patch
new file mode 100644
index 0000000..c617307
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0012=
-corstone1000-implement-timer-to-track-host-progress.patch
@@ -0,0 +1,169 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+
+From 1a891fc818526bfb8b546c86a93b81353330a466 Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Mon, 8 Nov 2021 18:10:44 +0000
+Subject: [PATCH 12/15] corstone1000: implement timer to track host progr=
ess
+
+When in fwu trial state, the secure enclave starts the timer to
+keep track of host progress. Secure enclave expects that the host
+acknowledges before the timer expires. If host fails to do so,
+the secure enclave resets the system.
+
+Change-Id: Ib63778b6c813f1b0d3517e0c05226d6f88927b04
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+---
+ .../corstone1000/fw_update_agent/fwu_agent.c  | 78 +++++++++++++++++++
+ .../corstone1000/fw_update_agent/fwu_agent.h  |  7 ++
+ .../arm/corstone1000/tfm_hal_multi_core.c     |  5 +-
+ 3 files changed, 89 insertions(+), 1 deletion(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+index 5e87fd8d5e..e8686704b8 100644
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+@@ -15,6 +15,7 @@
+ #include "uefi_capsule_parser.h"
+ #include "flash_common.h"
+ #include "platform_base_address.h"
++#include "platform_description.h"
+=20
+ /* Properties of image in a bank */
+ struct fwu_image_properties {
+@@ -127,6 +128,8 @@ struct efi_guid full_capsule_image_guid =3D {
+ /* Import the CMSIS flash device driver */
+ extern ARM_DRIVER_FLASH FWU_METADATA_FLASH_DEV;
+=20
++#define HOST_ACK_TIMEOUT_SEC    (6 * 60) /* ~seconds, not exact */
++
+ static enum fwu_agent_error_t private_metadata_read(
+         struct fwu_private_metadata* p_metadata)
+ {
+@@ -762,6 +765,13 @@ void bl2_get_boot_bank(uint32_t *bank_offset)
+     return;
+ }
+=20
++static void disable_host_ack_timer(void)
++{
++    FWU_LOG_MSG("%s: timer to reset is disabled\n\r", __func__);
++    SysTick->CTRL &=3D (~SysTick_CTRL_ENABLE_Msk);
++}
++
++
+ enum fwu_agent_error_t corstone1000_fwu_host_ack(void)
+ {
+     enum fwu_agent_error_t ret;
+@@ -803,9 +813,77 @@ enum fwu_agent_error_t corstone1000_fwu_host_ack(vo=
id)
+                                 &priv_metadata);
+     }
+=20
++    if (ret =3D=3D FWU_AGENT_SUCCESS) {
++        disable_host_ack_timer();
++    }
++
+ out:
+     Select_XIP_Mode_For_Shared_Flash();
+=20
+     FWU_LOG_MSG("%s: exit: ret =3D %d\n\r", __func__, ret);
+     return ret;
+ }
++
++static int systic_counter =3D 0;
++
++void SysTick_Handler(void)
++{
++    systic_counter++;
++    if ((systic_counter % 10) =3D=3D 0) {
++        FWU_LOG_MSG("%s: counted =3D %d, expiring on =3D %u\n\r", __fun=
c__,
++                                systic_counter, HOST_ACK_TIMEOUT_SEC);
++    }
++    if (systic_counter =3D=3D HOST_ACK_TIMEOUT_SEC) {
++        FWU_LOG_MSG("%s, timer expired, reseting the system\n\r", __fun=
c__);
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
++    enum fwu_agent_state_t current_state;
++    uint32_t boot_attempted;
++    uint32_t boot_index;
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
++    if (metadata_read(&_metadata)) {
++        FWU_ASSERT(0);
++    }
++
++    Select_XIP_Mode_For_Shared_Flash();
++
++    current_state =3D get_fwu_agent_state(&_metadata, &priv_metadata);
++
++    if (current_state =3D=3D FWU_AGENT_STATE_TRIAL) {
++        FWU_LOG_MSG("%s: in trial state, starting host ack timer\n\r",
++                        __func__);
++        systic_counter =3D 0;
++        if (SysTick_Config(SysTick_LOAD_RELOAD_Msk)) {
++            FWU_LOG_MSG("%s: timer init failed\n\r", __func__);
++            FWU_ASSERT(0);
++        } else {
++            FWU_LOG_MSG("%s: timer started: seconds to expire : %u\n\r"=
,
++                        __func__, HOST_ACK_TIMEOUT_SEC);
++        }
++    }
++
++    FWU_LOG_MSG("%s: exit\n\r", __func__);
++    return;
++}
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.h b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
+index b8f7c676d7..80f72e2bd6 100644
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
+@@ -47,4 +47,11 @@ enum fwu_agent_error_t corstone1000_fwu_host_ack(void=
);
+ void bl1_get_boot_bank(uint32_t *bank_offset);
+ void bl2_get_boot_bank(uint32_t *bank_offset);
+=20
++/* When in trial state, start the timer for host to respond.
++ * Diable timer when host responds back either by calling
++ * corstone1000_fwu_accept_image or corstone1000_fwu_select_previous.
++ * Otherwise, resets the system.
++ */
++void host_acknowledgement_timer_to_reset(void);
++
+ #endif /* FWU_AGENT_H */
+diff --git a/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c b=
/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c
+index 834ebc33e3..cc94055b94 100644
+--- a/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c
++++ b/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c
+@@ -56,7 +56,10 @@ void tfm_hal_boot_ns_cpu(uintptr_t start_addr)
+=20
+ void tfm_hal_wait_for_ns_cpu_ready(void)
+ {
+-    /* Synchronization between Host and SE is done by OpenAMP */
++    /* start the reset timer if firwmare update process is ongoing */
++#if !(PLATFORM_IS_FVP)
++    host_acknowledgement_timer_to_reset();
++#endif
+ }
+=20
+ void tfm_hal_get_mem_security_attr(const void *p, size_t s,
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0013-corstone1000-fwu-nv-counter-anti-rollback-support.patch b/meta-ar=
m-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0013-corstone1000=
-fwu-nv-counter-anti-rollback-support.patch
new file mode 100644
index 0000000..0b88d3f
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0013=
-corstone1000-fwu-nv-counter-anti-rollback-support.patch
@@ -0,0 +1,369 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+
+From eb02f01cd9095f11bbd737db8b1723358e463d73 Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Wed, 17 Nov 2021 07:30:26 +0000
+Subject: [PATCH 13/15] corstone1000: fwu nv-counter anti-rollback suppor=
t
+
+The patch implements anti-rollback protection on the nv-counters.
+The nv-counters are staged onto the flash, and only updated when
+firmware update process is successful. Before update, one more
+time verification is performed.
+
+Change-Id: Ibe9df7f65c7aecdb9d712bd76c4dbff4e8fd1023
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+---
+ .../target/arm/corstone1000/CMakeLists.txt    |   1 +
+ .../arm/corstone1000/bl1/bl1_security_cnt.c   |  20 ++-
+ .../arm/corstone1000/bl2_security_cnt.c       | 114 ++++++++++++++++++
+ .../ext/target/arm/corstone1000/config.cmake  |   2 +
+ .../corstone1000/fw_update_agent/fwu_agent.c  |  95 +++++++++++++++
+ .../corstone1000/fw_update_agent/fwu_agent.h  |  16 +++
+ 6 files changed, 245 insertions(+), 3 deletions(-)
+ create mode 100644 platform/ext/target/arm/corstone1000/bl2_security_cn=
t.c
+
+diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platf=
orm/ext/target/arm/corstone1000/CMakeLists.txt
+index cb66bd48d6..7b1ee53b15 100644
+--- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
++++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
+@@ -114,6 +114,7 @@ target_sources(platform_bl2
+         fip_parser/fip_parser.c
+         bl2_boot_hal.c
+         fw_update_agent/fwu_agent.c
++        bl2_security_cnt.c
+ )
+=20
+ if (PLATFORM_IS_FVP)
+diff --git a/platform/ext/target/arm/corstone1000/bl1/bl1_security_cnt.c=
 b/platform/ext/target/arm/corstone1000/bl1/bl1_security_cnt.c
+index f275cbfecb..e56defa09a 100644
+--- a/platform/ext/target/arm/corstone1000/bl1/bl1_security_cnt.c
++++ b/platform/ext/target/arm/corstone1000/bl1/bl1_security_cnt.c
+@@ -10,6 +10,8 @@
+ #include "tfm_plat_defs.h"
+ #include "bootutil/fault_injection_hardening.h"
+ #include <stdint.h>
++#include "tfm_plat_provisioning.h"
++#include "fwu_agent.h"
+=20
+ fih_int boot_nv_security_counter_init(void)
+ {
+@@ -47,14 +49,26 @@ int32_t boot_nv_security_counter_update(uint32_t ima=
ge_id,
+                                         uint32_t img_security_cnt)
+ {
+     enum tfm_plat_err_t err;
++    enum fwu_agent_error_t fwu_err;
+=20
+     if (image_id !=3D 0) {
+         return -1;
+     }
+=20
+-    err =3D tfm_plat_set_nv_counter(PLAT_NV_COUNTER_BL1_0, img_security=
_cnt);
+-    if (err !=3D TFM_PLAT_ERR_SUCCESS) {
+-        return -1;
++    if (tfm_plat_provisioning_is_required()) {
++
++        err =3D tfm_plat_set_nv_counter(PLAT_NV_COUNTER_BL1_0, img_secu=
rity_cnt);
++        if (err !=3D TFM_PLAT_ERR_SUCCESS) {
++            return -1;
++        }
++
++    } else {
++
++        fwu_err =3D fwu_stage_nv_counter(FWU_BL2_NV_COUNTER, img_securi=
ty_cnt);
++        if (fwu_err !=3D FWU_AGENT_SUCCESS) {
++            return -1;
++        }
++
+     }
+=20
+     return 0;
+diff --git a/platform/ext/target/arm/corstone1000/bl2_security_cnt.c b/p=
latform/ext/target/arm/corstone1000/bl2_security_cnt.c
+new file mode 100644
+index 0000000000..adb0c13039
+--- /dev/null
++++ b/platform/ext/target/arm/corstone1000/bl2_security_cnt.c
+@@ -0,0 +1,114 @@
++/*
++ * Copyright (c) 2019-2021, Arm Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#include "bootutil/security_cnt.h"
++#include "tfm_plat_nv_counters.h"
++#include "tfm_plat_defs.h"
++#include "bootutil/fault_injection_hardening.h"
++#include <stdint.h>
++#include "tfm_plat_provisioning.h"
++#include "fwu_agent.h"
++
++#define TFM_BOOT_NV_COUNTER_0    PLAT_NV_COUNTER_BL2_0   /* NV counter =
of Image 0 */
++#define TFM_BOOT_NV_COUNTER_1    PLAT_NV_COUNTER_BL2_1   /* NV counter =
of Image 1 */
++#define TFM_BOOT_NV_COUNTER_2    PLAT_NV_COUNTER_BL2_2   /* NV counter =
of Image 2 */
++#define TFM_BOOT_NV_COUNTER_MAX  PLAT_NV_COUNTER_BL2_2 + 1
++
++static enum tfm_nv_counter_t get_nv_counter_from_image_id(uint32_t imag=
e_id)
++{
++    uint32_t nv_counter;
++
++    /* Avoid integer overflow */
++    if ((UINT32_MAX - TFM_BOOT_NV_COUNTER_0) < image_id) {
++        return TFM_BOOT_NV_COUNTER_MAX;
++    }
++
++    nv_counter =3D TFM_BOOT_NV_COUNTER_0 + image_id;
++
++    /* Check the existence of the enumerated counter value */
++    if (nv_counter >=3D TFM_BOOT_NV_COUNTER_MAX) {
++        return TFM_BOOT_NV_COUNTER_MAX;
++    }
++
++    return (enum tfm_nv_counter_t)nv_counter;
++}
++
++fih_int boot_nv_security_counter_init(void)
++{
++    fih_int fih_rc =3D FIH_FAILURE;
++
++    fih_rc =3D fih_int_encode_zero_equality(tfm_plat_init_nv_counter())=
;
++
++    FIH_RET(fih_rc);
++}
++
++fih_int boot_nv_security_counter_get(uint32_t image_id, fih_int *securi=
ty_cnt)
++{
++    enum tfm_nv_counter_t nv_counter;
++    fih_int fih_rc =3D FIH_FAILURE;
++    uint32_t security_cnt_soft;
++
++    /* Check if it's a null-pointer. */
++    if (!security_cnt) {
++        FIH_RET(FIH_FAILURE);
++    }
++
++    nv_counter =3D get_nv_counter_from_image_id(image_id);
++    if (nv_counter >=3D TFM_BOOT_NV_COUNTER_MAX) {
++        FIH_RET(FIH_FAILURE);
++    }
++
++    fih_rc =3D fih_int_encode_zero_equality(
++             tfm_plat_read_nv_counter(nv_counter,
++                                      sizeof(security_cnt_soft),
++                                      (uint8_t *)&security_cnt_soft));
++    *security_cnt =3D fih_int_encode(security_cnt_soft);
++
++    printf("%s: security_cnt=3D%d\n\r", __func__, *security_cnt);
++
++    FIH_RET(fih_rc);
++}
++
++int32_t boot_nv_security_counter_update(uint32_t image_id,
++                                        uint32_t img_security_cnt)
++{
++    enum tfm_nv_counter_t nv_counter;
++    enum tfm_plat_err_t err;
++    enum fwu_agent_error_t fwu_err;
++
++    nv_counter =3D get_nv_counter_from_image_id(image_id);
++    if (nv_counter >=3D TFM_BOOT_NV_COUNTER_MAX) {
++        return -1;
++    }
++
++    printf("%s: security_cnt=3D%u:%u\n\r", __func__, nv_counter, img_se=
curity_cnt);
++
++    if (tfm_plat_provisioning_is_required()) {
++
++        err =3D tfm_plat_set_nv_counter(nv_counter, img_security_cnt);
++        if (err !=3D TFM_PLAT_ERR_SUCCESS) {
++            return -1;
++        }
++
++    } else {
++
++        if (nv_counter =3D=3D PLAT_NV_COUNTER_BL2_0) {
++            fwu_err =3D fwu_stage_nv_counter(FWU_TFM_NV_COUNTER, img_se=
curity_cnt);
++        } else if (nv_counter =3D=3D PLAT_NV_COUNTER_BL2_1) {
++            fwu_err =3D fwu_stage_nv_counter(FWU_TFA_NV_COUNTER, img_se=
curity_cnt);
++        } else {
++            return -1;
++        }
++
++        if (fwu_err !=3D FWU_AGENT_SUCCESS) {
++            return -1;
++        }
++
++    }
++
++    return 0;
++}
+diff --git a/platform/ext/target/arm/corstone1000/config.cmake b/platfor=
m/ext/target/arm/corstone1000/config.cmake
+index 203e6b79a6..d6f3ef7d21 100644
+--- a/platform/ext/target/arm/corstone1000/config.cmake
++++ b/platform/ext/target/arm/corstone1000/config.cmake
+@@ -39,3 +39,5 @@ if (${PLATFORM_IS_FVP})
+ else()
+     set(PLATFORM_PSA_ADAC_SECURE_DEBUG      FALSE        CACHE BOOL    =
  "Whether to use psa-adac secure debug.")
+ endif()
++
++set(DEFAULT_MCUBOOT_SECURITY_COUNTERS   OFF          CACHE BOOL      "W=
hether to use the default security counter configuration defined by TF-M =
project")
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+index e8686704b8..cd7f901287 100644
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+@@ -16,6 +16,8 @@
+ #include "flash_common.h"
+ #include "platform_base_address.h"
+ #include "platform_description.h"
++#include "tfm_plat_nv_counters.h"
++#include "tfm_plat_defs.h"
+=20
+ /* Properties of image in a bank */
+ struct fwu_image_properties {
+@@ -79,6 +81,9 @@ struct fwu_private_metadata {
+        /* counter: tracking number of boot attempted so far */
+        uint32_t boot_attempted;
+=20
++       /* staged nv_counter: temprary location before written to the ot=
p */
++       uint32_t nv_counter[NR_OF_IMAGES_IN_FW_BANK];
++
+ } __packed;
+=20
+ #define MAX_BOOT_ATTEMPTS_PER_BANK 3
+@@ -771,6 +776,56 @@ static void disable_host_ack_timer(void)
+     SysTick->CTRL &=3D (~SysTick_CTRL_ENABLE_Msk);
+ }
+=20
++static enum fwu_agent_error_t update_nv_counters(
++                        struct fwu_private_metadata* priv_metadata)
++{
++    enum tfm_plat_err_t err;
++    uint32_t security_cnt;
++    enum tfm_nv_counter_t tfm_nv_counter_i;
++
++    FWU_LOG_MSG("%s: enter\n\r", __func__);
++
++    for (int i =3D 0; i <=3D FWU_MAX_NV_COUNTER_INDEX; i++) {
++
++        switch (i) {
++            case FWU_BL2_NV_COUNTER:
++                tfm_nv_counter_i =3D PLAT_NV_COUNTER_BL1_0;
++                break;
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
++            return FWU_AGENT_ERROR;
++        }
++
++        if (priv_metadata->nv_counter[i] < security_cnt) {
++            return FWU_AGENT_ERROR;
++        } else if (priv_metadata->nv_counter[i] > security_cnt) {
++            FWU_LOG_MSG("%s: updaing index =3D %u nv counter =3D %u->%u=
\n\r",
++                        __func__, i, security_cnt,
++                        priv_metadata->nv_counter[FWU_BL2_NV_COUNTER]);
++            err =3D tfm_plat_set_nv_counter(tfm_nv_counter_i,
++                                    priv_metadata->nv_counter[FWU_BL2_N=
V_COUNTER]);
++            if (err !=3D TFM_PLAT_ERR_SUCCESS) {
++                return FWU_AGENT_ERROR;
++            }
++        }
++
++    }
++
++    FWU_LOG_MSG("%s: exit\n\r", __func__);
++    return FWU_AGENT_SUCCESS;
++}
+=20
+ enum fwu_agent_error_t corstone1000_fwu_host_ack(void)
+ {
+@@ -811,6 +866,9 @@ enum fwu_agent_error_t corstone1000_fwu_host_ack(voi=
d)
+         /* firmware update successful */
+         ret =3D fwu_accept_image(&full_capsule_image_guid, &_metadata,
+                                 &priv_metadata);
++        if (!ret) {
++            ret =3D update_nv_counters(&priv_metadata);
++        }
+     }
+=20
+     if (ret =3D=3D FWU_AGENT_SUCCESS) {
+@@ -887,3 +945,40 @@ void host_acknowledgement_timer_to_reset(void)
+     FWU_LOG_MSG("%s: exit\n\r", __func__);
+     return;
+ }
++
++/* stage nv counter into private metadata section of the flash.
++ * staged nv counters are written to the otp when firmware update
++ * is successful
++ * the function assumes that the api is called in the boot loading
++ * stage
++ */
++enum fwu_agent_error_t fwu_stage_nv_counter(enum fwu_nv_counter_index_t=
 index,
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
++        return FWU_AGENT_ERROR;
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
++    return FWU_AGENT_SUCCESS;
++}
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.h b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
+index 80f72e2bd6..57b07e8d2c 100644
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.h
+@@ -54,4 +54,20 @@ void bl2_get_boot_bank(uint32_t *bank_offset);
+  */
+ void host_acknowledgement_timer_to_reset(void);
+=20
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
++enum fwu_agent_error_t fwu_stage_nv_counter(enum fwu_nv_counter_index_t=
 index,
++        uint32_t img_security_cnt);
++
+ #endif /* FWU_AGENT_H */
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0014-corstone1000-bug-fix-in-openamp-version.patch b/meta-arm-bsp/reci=
pes-bsp/trusted-firmware-m/files/corstone1000/0014-corstone1000-bug-fix-i=
n-openamp-version.patch
new file mode 100644
index 0000000..aa6d363
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0014=
-corstone1000-bug-fix-in-openamp-version.patch
@@ -0,0 +1,50 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+
+From 55d0c63bf6b097b6853e93355f5a1524df56f47b Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Mon, 1 Nov 2021 08:03:42 +0000
+Subject: [PATCH 14/15] corstone1000: bug fix in openamp version
+
+Typing mistake in openamp version parameter, leads the cmake
+to fetch the head of the master branch.
+
+Also, the previous hash used for code version is deleted from the
+openamp github. New hash from the master branch is in use.
+
+Change-Id: Iee5980ba14f8bb9b964eb10c71ebb68664c1d441
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+---
+ platform/ext/target/arm/corstone1000/config.cmake               | 2 +-
+ .../arm/corstone1000/openamp/ext/libopenamp/CMakeLists.txt      | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/config.cmake b/platfor=
m/ext/target/arm/corstone1000/config.cmake
+index d6f3ef7d21..2dab210e0a 100644
+--- a/platform/ext/target/arm/corstone1000/config.cmake
++++ b/platform/ext/target/arm/corstone1000/config.cmake
+@@ -32,7 +32,7 @@ set(LIBMETAL_SRC_PATH                   "DOWNLOAD"  CA=
CHE PATH      "Path to Lib
+ set(LIBMETAL_VERSION                    "f252f0e007fbfb8b3a52b1d5901250=
ddac96baad"  CACHE STRING    "The version of libmetal to use")
+=20
+ set(LIBOPENAMP_SRC_PATH                 "DOWNLOAD"  CACHE PATH      "Pa=
th to Libopenamp (or DOWNLOAD to fetch automatically")
+-set(OPENAMP_VERSION                     "33037b04e0732e58fc0fa36afc2449=
99ef632e10"  CACHE STRING    "The version of openamp to use")
++set(OPENAMP_VERSION                     "347397decaa43372fc4d00f965640e=
bde042966d"  CACHE STRING    "The version of openamp to use")
+=20
+ if (${PLATFORM_IS_FVP})
+     set(PLATFORM_PSA_ADAC_SECURE_DEBUG      FALSE        CACHE BOOL    =
  "Whether to use psa-adac secure debug.")
+diff --git a/platform/ext/target/arm/corstone1000/openamp/ext/libopenamp=
/CMakeLists.txt b/platform/ext/target/arm/corstone1000/openamp/ext/libope=
namp/CMakeLists.txt
+index d91dc7d845..9b1602a04f 100644
+--- a/platform/ext/target/arm/corstone1000/openamp/ext/libopenamp/CMakeL=
ists.txt
++++ b/platform/ext/target/arm/corstone1000/openamp/ext/libopenamp/CMakeL=
ists.txt
+@@ -16,7 +16,7 @@ endif()
+ if ("${LIBOPENAMP_SRC_PATH}" STREQUAL "DOWNLOAD")
+     FetchContent_Declare(libopenamp
+         GIT_REPOSITORY https://github.com/OpenAMP/open-amp.git
+-        GIT_TAG ${OEPNAMP_VERSION}
++        GIT_TAG ${OPENAMP_VERSION}
+     )
+=20
+     FetchContent_GetProperties(libopenamp)
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0015-corstone1000-secure-host-watchdog-interrupt-handler.patch b/meta-=
arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0015-corstone10=
00-secure-host-watchdog-interrupt-handler.patch
new file mode 100644
index 0000000..17618f7
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0015=
-corstone1000-secure-host-watchdog-interrupt-handler.patch
@@ -0,0 +1,80 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+
+From c33289422948ccb0bd6985512e5d0fc6936c0cd1 Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Thu, 18 Nov 2021 12:49:10 +0000
+Subject: [PATCH 15/15] corstone1000: secure host watchdog interrupt hand=
ler
+
+With this commit, the host secure watchdog interrupt 1
+(WS1) will be handled by the secure enclave. The commit
+implements and enables the SECURE_WATCHDOG_WS1_IRQHandler
+in NVIC controller. The host can now trigger a reboot
+using the secure watchdog.
+
+Change-Id: Ied82cc04496f5daf678ad1cdc7bcf6d3a7879186
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+---
+ .../arm/corstone1000/Native_Driver/watchdog.c   | 17 +++++++++++++++++
+ .../arm/corstone1000/Native_Driver/watchdog.h   |  9 +++++++++
+ .../target/arm/corstone1000/tfm_hal_platform.c  |  2 ++
+ 3 files changed, 28 insertions(+)
+
+diff --git a/platform/ext/target/arm/corstone1000/Native_Driver/watchdog=
.c b/platform/ext/target/arm/corstone1000/Native_Driver/watchdog.c
+index d375af3afb..d7faa3067d 100644
+--- a/platform/ext/target/arm/corstone1000/Native_Driver/watchdog.c
++++ b/platform/ext/target/arm/corstone1000/Native_Driver/watchdog.c
+@@ -79,3 +79,20 @@ int corstone1000_watchdog_init()
+    =20
+     return ARM_DRIVER_OK;
+ }
++
++/* Secure Host Watchdog WS1 Handler=20
++ * efi_reset_system from the host triggers "Secure=20
++ * watchdog WS1 interrupt" to reset the system. Host=20
++ * cannot access this interrupt by design, so SE=20
++ * resets the system using this handler
++ * */=20
++void SECURE_WATCHDOG_WS1_IRQHandler(void){
++    NVIC_SystemReset();
++}
++
++/*Enable Secure Watchdog WS1 Interrupt
++ * in NVIC controller (asserted by host)*/
++void corstone1000_host_watchdog_handler_init(){
++    NVIC_EnableIRQ(SECURE_WATCHDOG_WS1_IRQn);
++}
++
+diff --git a/platform/ext/target/arm/corstone1000/Native_Driver/watchdog=
.h b/platform/ext/target/arm/corstone1000/Native_Driver/watchdog.h
+index fd1b7cf124..cd9bed3f63 100644
+--- a/platform/ext/target/arm/corstone1000/Native_Driver/watchdog.h
++++ b/platform/ext/target/arm/corstone1000/Native_Driver/watchdog.h
+@@ -29,4 +29,13 @@ int corstone1000_watchdog_init();
+  */
+ int corstone1000_watchdog_reset_timer();
+=20
++/**
++ *  \brief Initializes Interrupt Handler for
++ *   Secure Host Watchdog (WS1).
++ *
++ *  \returns  VOID
++ */
++void corstone1000_host_watchdog_handler_init();
++
++
+ #endif /* watchdog_h */
+diff --git a/platform/ext/target/arm/corstone1000/tfm_hal_platform.c b/p=
latform/ext/target/arm/corstone1000/tfm_hal_platform.c
+index 7faa71eb63..e3c6b78950 100644
+--- a/platform/ext/target/arm/corstone1000/tfm_hal_platform.c
++++ b/platform/ext/target/arm/corstone1000/tfm_hal_platform.c
+@@ -24,5 +24,7 @@ enum tfm_hal_status_t tfm_hal_platform_init(void)
+         return TFM_HAL_ERROR_GENERIC;
+     }
+=20
++    corstone1000_host_watchdog_handler_init();
++
+     return TFM_HAL_SUCCESS;
+ }
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index 8f43f8d..68abc96 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -2,6 +2,26 @@
=20
 COMPATIBLE_MACHINE =3D "(corstone1000)"
=20
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/corstone1000:"
+
+SRC_URI:append =3D " \
+      file://0001-corstone1000-disable-secure-debug-temporarily.patch \
+      file://0002-corstone1000-provision-firmware-update-metadata-fwu.pa=
tch \
+      file://0003-corstone1000-parse-the-uefi-firmware-update-capsule.pa=
tch \
+      file://0004-corstone1000-add-firmware-update-fwu-agent-into-TF-M.p=
atch \
+      file://0005-corstone1000-implement-corstone1000_fwu_flash_images.p=
atch \
+      file://0006-corstone1000-add-logic-to-select-boot-bank.patch \
+      file://0007-corstone1000-integrate-watchdog-driver.patch \
+      file://0008-corstone1000-impelment-accept-image-logic.patch \
+      file://0009-corstone1000-implement-select-previous-bank-logic.patc=
h \
+      file://0010-corstone1000-implement-corstone1000_fwu_host_ack.patch=
 \
+      file://0011-SPM-multiple-core-initailize-multi-core-communicatio.p=
atch \
+      file://0012-corstone1000-implement-timer-to-track-host-progress.pa=
tch \
+      file://0013-corstone1000-fwu-nv-counter-anti-rollback-support.patc=
h \
+      file://0014-corstone1000-bug-fix-in-openamp-version.patch \
+      file://0015-corstone1000-secure-host-watchdog-interrupt-handler.pa=
tch \
+"
+
 TFM_DEBUG =3D "1"
=20
 ## Default is the MPS3 board
@@ -9,7 +29,8 @@ TFM_PLATFORM_IS_FVP ?=3D "FALSE"
 EXTRA_OECMAKE +=3D "-DPLATFORM_IS_FVP=3D${TFM_PLATFORM_IS_FVP}"
=20
 SRCBRANCH_tfm =3D "master"
-SRCREV_tfm =3D "ccd82e35f539c0d7261b2935d6d30c550cfc6736"
+SRCREV_tfm =3D "a0a266a55b56929cae5f1777e28926b8421492a6"
+SRCREV_mcuboot =3D "29099e1d17f93ae1d09fe945ad191b703aacd3d8"
=20
 # The install task signs the TF-A BL2 and FIP binaries.
 # So they need to be copied to the sysroot. Hence the dependencies below=
:
--=20
2.17.1


