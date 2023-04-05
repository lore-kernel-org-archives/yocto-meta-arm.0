Return-Path: <rui.silva@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC7B1C76188
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 14:19:28 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.131239.1680704364763958337
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Apr 2023 07:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=xBXw6KpZ;
 spf=pass (domain: linaro.org, ip: 209.85.221.52, mailfrom: rui.silva@linaro.org)
Received: by mail-wr1-f52.google.com with SMTP id i9so36392653wrp.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 05 Apr 2023 07:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680704363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rg3uhcBcHiiw+Y+JZtZq+/SyLregrPUaE7mYOaBZWbw=;
        b=xBXw6KpZPQ2ZJ7HzzWposfxUqwbPZw89+iDedeVqIGx65V4JC2lyf8QaNDR/13rt/0
         JaxYgFk8GbP2VHSd2pz7RZjGuyMvcmIOVd7IHgZUTxYFOj2gRT9RApiRhSX8N2Q2xHvk
         FMMdAVUfdFlxbyyPYWGHGGCR16meOOvfJM3WTniwoWEsSHOSTiIc10Fpe8EA2x2kTwHX
         qoMTBgmk9eQvSrtmdatkpo75dZfO8WD3dIhWTk5Q/SWhLFPofrBtHfLxaPqV79N+R987
         fyHDYk2XsxKr5iV1D3acDD5XOZYMellfxZ5zzBXSn3diV/TWJtzQC7MA0FS1iYV4IfDe
         oN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680704363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rg3uhcBcHiiw+Y+JZtZq+/SyLregrPUaE7mYOaBZWbw=;
        b=LyI35aIz3SVetfXLG8232j2iyw2I+YSHp1AoNps1dglWEvONMN8tpAINBNSgjzDIWk
         TK4QkoAA4J2S2Ks5j/eNkghWEMEIt2CxsaAICRSBinsoc3DQZcu3UBuslkisXYoeKHPG
         ccI31gS3doNw9p+PRdbIVgTctVAU5PFJHbeIhLAIHdHMCKlPbtj7m3z8M8Ra0PddRK/6
         Cb6zlosIKno3GZP1LxgKE0H9MlGsEbjhDze7CY4/rYMcenxh7teOPR8FLvMXlEw08c3h
         mvZFOUsAEBvbo7PUQfzXsdqulw/Yq2BvzRCOuJXmpksv5E1HmYJOc+4OyVEKRcmZxysO
         jP3A==
X-Gm-Message-State: AAQBX9c87IE/zeD1rgWZ7hAJZmxy1HzbhwIYmiYtw0GHaT5MH7h/UzOr
	0MB44H1QDYdquUUlIKiM7W6Yw6RWRsG20brmsVw=
X-Google-Smtp-Source: AKy350az5TvcKTYvcR8rR2C0xhB7EDBqdkms+nnaYMdWKoQvzL7QkbuVwuktNSsIin3wdYUUjAnB4w==
X-Received: by 2002:adf:ef43:0:b0:2c9:b9bf:e20c with SMTP id c3-20020adfef43000000b002c9b9bfe20cmr1957864wrp.2.1680704362729;
        Wed, 05 Apr 2023 07:19:22 -0700 (PDT)
Received: from arch-thunder.local (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id a2-20020adfed02000000b002c55de1c72bsm15085996wro.62.2023.04.05.07.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 07:19:22 -0700 (PDT)
From: Rui Miguel Silva <rui.silva@linaro.org>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH] arm-bsp/corstone1000: tf-m set/get fwu, private metadata using gpt
Date: Wed,  5 Apr 2023 15:19:19 +0100
Message-Id: <20230405141919.334782-1-rui.silva@linaro.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 05 Apr 2023 14:19:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4540

Now that we moved in corstone1000 to use a gpt and partitions for
the wic image and flash layout. Setup TF-m to set/get FWU and
Private metadata using the partition information (start and size)
stored in the gpt table instead of fixed flash offsets as before.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 ...e1000-get-fwu-and-private-metadata-f.patch | 307 ++++++++++++++++++
 .../trusted-firmware-m-1.7.0-corstone1000.inc |   1 +
 2 files changed, 308 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0012-Platform-Corstone1000-get-fwu-and-private-metadata-f.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0012-Platform-Corstone1000-get-fwu-and-private-metadata-f.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0012-Platform-Corstone1000-get-fwu-and-private-metadata-f.patch
new file mode 100644
index 000000000000..475f80e0fc32
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0012-Platform-Corstone1000-get-fwu-and-private-metadata-f.patch
@@ -0,0 +1,307 @@
+From 4a4d1b0a5a2455ad799a45f7f87c0c9fd0173034 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Wed, 29 Mar 2023 10:58:32 +0100
+Subject: [PATCH] Platform: Corstone1000: get fwu and private metadata from gpt
+
+Read and Write the FWU metadata and private metadata using instead
+static flash offsets get the partitions and start address from gpt
+partition table.
+
+Upstream-Status: Pending (not submitted yet)
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ .../target/arm/corstone1000/CMakeLists.txt    |  7 ++
+ .../corstone1000/fw_update_agent/fwu_agent.c  | 90 +++++++++++++++----
+ .../target/arm/corstone1000/partition/efi.h   |  1 +
+ .../arm/corstone1000/partition/partition.c    | 14 +++
+ .../arm/corstone1000/partition/partition.h    |  1 +
+ .../ext/target/arm/corstone1000/platform.h    |  5 ++
+ 6 files changed, 99 insertions(+), 19 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platform/ext/target/arm/corstone1000/CMakeLists.txt
+index 19863bcdb6d2..f232c7639bd5 100644
+--- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
++++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
+@@ -64,6 +64,8 @@ target_include_directories(platform_s
+         cc312
+         fw_update_agent
+         soft_crc
++        io
++        partition
+ )
+ 
+ target_sources(platform_s
+@@ -81,6 +83,11 @@ target_sources(platform_s
+         fw_update_agent/fwu_agent.c
+         fw_update_agent/uefi_fmp.c
+         soft_crc/soft_crc.c
++        io/io_block.c
++        io/io_flash.c
++        io/io_storage.c
++        partition/partition.c
++        partition/gpt.c
+         $<$<NOT:$<BOOL:${PLATFORM_DEFAULT_OTP}>>:${PLATFORM_DIR}/ext/accelerator/cc312/otp_cc312.c>
+ )
+ 
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+index b6ed656de833..9c76b25a3a38 100644
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+@@ -14,6 +14,8 @@
+ #include "region_defs.h"
+ #include "uefi_capsule_parser.h"
+ #include "flash_common.h"
++#include "partition.h"
++#include "platform.h"
+ #include "platform_base_address.h"
+ #include "platform_description.h"
+ #include "tfm_plat_nv_counters.h"
+@@ -146,6 +148,8 @@ extern ARM_DRIVER_FLASH FWU_METADATA_FLASH_DEV;
+ static enum fwu_agent_error_t private_metadata_read(
+         struct fwu_private_metadata* p_metadata)
+ {
++    partition_entry_t *part;
++    uuid_t private_uuid = PRIVATE_METADATA_TYPE_UUID;
+     int ret;
+ 
+     FWU_LOG_MSG("%s: enter\n\r", __func__);
+@@ -154,7 +158,13 @@ static enum fwu_agent_error_t private_metadata_read(
+         return FWU_AGENT_ERROR;
+     }
+ 
+-    ret = FWU_METADATA_FLASH_DEV.ReadData(FWU_PRIVATE_METADATA_REPLICA_1_OFFSET, p_metadata,
++    part = get_partition_entry_by_type(&private_uuid);
++    if (!part) {
++        FWU_LOG_MSG("Private metadata partition not found\n\r");
++        return FWU_AGENT_ERROR;
++    }
++
++    ret = FWU_METADATA_FLASH_DEV.ReadData(part->start, p_metadata,
+                                           sizeof(struct fwu_private_metadata));
+     if (ret < 0 || ret != sizeof(struct fwu_private_metadata)) {
+         return FWU_AGENT_ERROR;
+@@ -169,6 +179,8 @@ static enum fwu_agent_error_t private_metadata_read(
+ static enum fwu_agent_error_t private_metadata_write(
+         struct fwu_private_metadata* p_metadata)
+ {
++    uuid_t private_uuid = PRIVATE_METADATA_TYPE_UUID;
++    partition_entry_t *part;
+     int ret;
+ 
+     FWU_LOG_MSG("%s: enter: boot_index = %u\n\r", __func__,
+@@ -178,12 +190,18 @@ static enum fwu_agent_error_t private_metadata_write(
+         return FWU_AGENT_ERROR;
+     }
+ 
+-    ret = FWU_METADATA_FLASH_DEV.EraseSector(FWU_PRIVATE_METADATA_REPLICA_1_OFFSET);
++    part = get_partition_entry_by_type(&private_uuid);
++    if (!part) {
++        FWU_LOG_MSG("Private metadata partition not found\n\r");
++        return FWU_AGENT_ERROR;
++    }
++
++    ret = FWU_METADATA_FLASH_DEV.EraseSector(part->start);
+     if (ret != ARM_DRIVER_OK) {
+         return FWU_AGENT_ERROR;
+     }
+ 
+-    ret = FWU_METADATA_FLASH_DEV.ProgramData(FWU_PRIVATE_METADATA_REPLICA_1_OFFSET,
++    ret = FWU_METADATA_FLASH_DEV.ProgramData(part->start,
+                                 p_metadata, sizeof(struct fwu_private_metadata));
+     if (ret < 0 || ret != sizeof(struct fwu_private_metadata)) {
+         return FWU_AGENT_ERROR;
+@@ -219,16 +237,25 @@ static enum fwu_agent_error_t metadata_validate(struct fwu_metadata *p_metadata)
+ 
+ static enum fwu_agent_error_t metadata_read_without_validation(struct fwu_metadata *p_metadata)
+ {
++    uuid_t metadata_uuid = FWU_METADATA_TYPE_UUID;
++    partition_entry_t *part;
+     int ret;
+ 
+-    FWU_LOG_MSG("%s: enter: flash addr = %u, size = %d\n\r", __func__,
+-                  FWU_METADATA_REPLICA_1_OFFSET, sizeof(struct fwu_metadata));
+-
+     if (!p_metadata) {
+         return FWU_AGENT_ERROR;
+     }
+ 
+-    ret = FWU_METADATA_FLASH_DEV.ReadData(FWU_METADATA_REPLICA_1_OFFSET,
++    part = get_partition_entry_by_type(&metadata_uuid);
++    if (!part) {
++        FWU_LOG_MSG("%s: FWU metadata partition not found\n\r", __func__);
++        return FWU_AGENT_ERROR;
++    }
++
++    FWU_LOG_MSG("%s: enter: flash addr = %u, size = %d\n\r", __func__,
++                  part->start, sizeof(struct fwu_metadata));
++
++
++    ret = FWU_METADATA_FLASH_DEV.ReadData(part->start,
+                                 p_metadata, sizeof(struct fwu_metadata));
+     if (ret < 0 || ret != sizeof(struct fwu_metadata)) {
+         return FWU_AGENT_ERROR;
+@@ -242,16 +269,24 @@ static enum fwu_agent_error_t metadata_read_without_validation(struct fwu_metada
+ 
+ static enum fwu_agent_error_t metadata_read(struct fwu_metadata *p_metadata)
+ {
++    uuid_t metadata_uuid = FWU_METADATA_TYPE_UUID;
++    partition_entry_t *part;
+     int ret;
+ 
+-    FWU_LOG_MSG("%s: enter: flash addr = %u, size = %d\n\r", __func__,
+-                  FWU_METADATA_REPLICA_1_OFFSET, sizeof(struct fwu_metadata));
+-
+     if (!p_metadata) {
+         return FWU_AGENT_ERROR;
+     }
+ 
+-    ret = FWU_METADATA_FLASH_DEV.ReadData(FWU_METADATA_REPLICA_1_OFFSET,
++    part = get_partition_entry_by_type(&metadata_uuid);
++    if (!part) {
++        FWU_LOG_MSG("%s: FWU metadata partition not found\n\r", __func__);
++        return FWU_AGENT_ERROR;
++    }
++
++    FWU_LOG_MSG("%s: enter: flash addr = %u, size = %d\n\r", __func__,
++                  part->start, sizeof(struct fwu_metadata));
++
++    ret = FWU_METADATA_FLASH_DEV.ReadData(part->start,
+                                 p_metadata, sizeof(struct fwu_metadata));
+     if (ret < 0 || ret != sizeof(struct fwu_metadata)) {
+         return FWU_AGENT_ERROR;
+@@ -270,35 +305,49 @@ static enum fwu_agent_error_t metadata_read(struct fwu_metadata *p_metadata)
+ static enum fwu_agent_error_t metadata_write(
+                         struct fwu_metadata *p_metadata)
+ {
++    uuid_t metadata_uuid = FWU_METADATA_TYPE_UUID;
++    partition_entry_t *part;
+     int ret;
+ 
+-    FWU_LOG_MSG("%s: enter: flash addr = %u, size = %d\n\r", __func__,
+-                  FWU_METADATA_REPLICA_1_OFFSET, sizeof(struct fwu_metadata));
+-
+     if (!p_metadata) {
+         return FWU_AGENT_ERROR;
+     }
+ 
+-    ret = FWU_METADATA_FLASH_DEV.EraseSector(FWU_METADATA_REPLICA_1_OFFSET);
++    part = get_partition_entry_by_type(&metadata_uuid);
++    if (!part) {
++        FWU_LOG_MSG("%s: FWU metadata partition not found\n\r", __func__);
++        return FWU_AGENT_ERROR;
++    }
++
++    FWU_LOG_MSG("%s: enter: flash addr = %u, size = %d\n\r", __func__,
++                  part->start, sizeof(struct fwu_metadata));
++
++    ret = FWU_METADATA_FLASH_DEV.EraseSector(part->start);
+     if (ret != ARM_DRIVER_OK) {
+         return FWU_AGENT_ERROR;
+     }
+ 
+-    ret = FWU_METADATA_FLASH_DEV.ProgramData(FWU_METADATA_REPLICA_1_OFFSET,
++    ret = FWU_METADATA_FLASH_DEV.ProgramData(part->start,
+                                 p_metadata, sizeof(struct fwu_metadata));
+     if (ret < 0 || ret != sizeof(struct fwu_metadata)) {
+         return FWU_AGENT_ERROR;
+     }
+ 
++    part = get_partition_replica_by_type(&metadata_uuid);
++    if (!part) {
++        FWU_LOG_MSG("%s: FWU metadata replica partition not found\n\r", __func__);
++        return FWU_AGENT_ERROR;
++    }
++
+     FWU_LOG_MSG("%s: enter: flash addr = %u, size = %d\n\r", __func__,
+-                  FWU_METADATA_REPLICA_2_OFFSET, sizeof(struct fwu_metadata));
++                  part->start, sizeof(struct fwu_metadata));
+ 
+-    ret = FWU_METADATA_FLASH_DEV.EraseSector(FWU_METADATA_REPLICA_2_OFFSET);
++    ret = FWU_METADATA_FLASH_DEV.EraseSector(part->start);
+     if (ret != ARM_DRIVER_OK) {
+         return FWU_AGENT_ERROR;
+     }
+ 
+-    ret = FWU_METADATA_FLASH_DEV.ProgramData(FWU_METADATA_REPLICA_2_OFFSET,
++    ret = FWU_METADATA_FLASH_DEV.ProgramData(part->start,
+                                 p_metadata, sizeof(struct fwu_metadata));
+     if (ret < 0 || ret != sizeof(struct fwu_metadata)) {
+         return FWU_AGENT_ERROR;
+@@ -355,6 +404,9 @@ enum fwu_agent_error_t fwu_metadata_provision(void)
+ 
+     FWU_LOG_MSG("%s: enter\n\r", __func__);
+ 
++    plat_io_storage_init();
++    partition_init(PLATFORM_GPT_IMAGE);
++
+     ret = fwu_metadata_init();
+     if (ret) {
+         return ret;
+diff --git a/platform/ext/target/arm/corstone1000/partition/efi.h b/platform/ext/target/arm/corstone1000/partition/efi.h
+index f66daffb32d6..7e6a4bc883e6 100644
+--- a/platform/ext/target/arm/corstone1000/partition/efi.h
++++ b/platform/ext/target/arm/corstone1000/partition/efi.h
+@@ -8,6 +8,7 @@
+ #ifndef DRIVERS_PARTITION_EFI_H
+ #define DRIVERS_PARTITION_EFI_H
+ 
++#include <stdint.h>
+ #include <string.h>
+ 
+ #include "uuid.h"
+diff --git a/platform/ext/target/arm/corstone1000/partition/partition.c b/platform/ext/target/arm/corstone1000/partition/partition.c
+index afc6aa1c5cb8..d76e123d728f 100644
+--- a/platform/ext/target/arm/corstone1000/partition/partition.c
++++ b/platform/ext/target/arm/corstone1000/partition/partition.c
+@@ -293,6 +293,20 @@ const partition_entry_t *get_partition_entry_by_type(const uuid_t *type_uuid) {
+     return NULL;
+ }
+ 
++const partition_entry_t *get_partition_replica_by_type(const uuid_t *type_uuid) {
++    int count = 0;
++    int i;
++
++    for (i = 0; i < list.entry_count; i++) {
++        if (guidcmp(type_uuid, &list.list[i].type_guid) == 0) {
++            if (++count == 2)
++                 return &list.list[i];
++        }
++    }
++
++    return NULL;
++}
++
+ const partition_entry_t *get_partition_entry_by_uuid(const uuid_t *part_uuid) {
+     int i;
+ 
+diff --git a/platform/ext/target/arm/corstone1000/partition/partition.h b/platform/ext/target/arm/corstone1000/partition/partition.h
+index 54af47aca415..450cf20a073c 100644
+--- a/platform/ext/target/arm/corstone1000/partition/partition.h
++++ b/platform/ext/target/arm/corstone1000/partition/partition.h
+@@ -40,6 +40,7 @@ typedef struct partition_entry_list {
+ int load_partition_table(unsigned int image_id);
+ const partition_entry_t *get_partition_entry(const char *name);
+ const partition_entry_t *get_partition_entry_by_type(const uuid_t *type_guid);
++const partition_entry_t *get_partition_replica_by_type(const uuid_t *type_uuid);
+ const partition_entry_t *get_partition_entry_by_uuid(const uuid_t *part_uuid);
+ const partition_entry_list_t *get_partition_entry_list(void);
+ void partition_init(unsigned int image_id);
+diff --git a/platform/ext/target/arm/corstone1000/platform.h b/platform/ext/target/arm/corstone1000/platform.h
+index 894f5e309029..a88093ed4f9d 100644
+--- a/platform/ext/target/arm/corstone1000/platform.h
++++ b/platform/ext/target/arm/corstone1000/platform.h
+@@ -13,6 +13,11 @@ typedef enum {
+     PLATFORM_IMAGE_COUNT,
+ }platform_image_id_t;
+ 
++#define FWU_METADATA_TYPE_UUID \
++     ((uuid_t){{0xa0, 0x84, 0x7a, 0x8a}, {0x87, 0x83}, {0xf6, 0x40}, 0xab,  0x41, {0xa8, 0xb9, 0xa5, 0xa6, 0x0d, 0x23}})
++#define PRIVATE_METADATA_TYPE_UUID \
++     ((uuid_t){{0xc3, 0x5d, 0xb5, 0xec}, {0xb7, 0x8a}, {0x84, 0x4a}, 0xab,  0x56, {0xeb, 0x0a, 0x99, 0x74, 0xdb, 0x42}})
++
+ /* Initialize io storage of the platform */
+ int32_t plat_io_storage_init(void);
+ 
+-- 
+2.40.0
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-corstone1000.inc
index a8e76d016bb6..5e44ea521e73 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-corstone1000.inc
@@ -39,6 +39,7 @@ SRC_URI:append:corstone1000 = " \
     file://0009-Platform-corstone1000-BL2-uses-GPT-layout.patch                 \
     file://0010-Platform-corstone1000-flash_layout-simplification.patch         \
     file://0011-corstone1000-make-sure-to-write-fwu-metadata-to-repl.patch      \
+    file://0012-Platform-Corstone1000-get-fwu-and-private-metadata-f.patch      \
            "
 
 do_install() {
-- 
2.40.0


