Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EF3CC77B75
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 16:02:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.93071.1684166543851776236
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 May 2023 09:02:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 215924B3;
	Mon, 15 May 2023 09:03:08 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.194.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A3DB13F663;
	Mon, 15 May 2023 09:02:22 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 1/2] arm-bsp/trusted-firmware-m: Align Capsule Update with GPT changes
Date: Mon, 15 May 2023 17:02:16 +0100
Message-Id: <20230515160217.54867-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230515160217.54867-1-emekcan.aras@arm.com>
References: <20230515160217.54867-1-emekcan.aras@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 May 2023 16:02:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4649

From: Emekcan Aras <emekcan.aras@arm.com>

This patch aligns capsule update feature in tfm with GPT/BL1 changes.
Adjusts BL2 flash and data size and adds missing CRC checks.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 ...e1000-Increase-BL2-size-in-flash-lay.patch | 29 ++++++++
 ...-Corstone1000-Increase-BL2_DATA_SIZE.patch | 33 +++++++++
 ...e1000-Calculate-the-new-CRC32-value-.patch | 71 +++++++++++++++++++
 .../trusted-firmware-m-1.7.0-corstone1000.inc |  3 +
 4 files changed, 136 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0013-Platform-corstone1000-Increase-BL2-size-in-flash-lay.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0014-Platform-Corstone1000-Increase-BL2_DATA_SIZE.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0015-Platform-Corstone1000-Calculate-the-new-CRC32-value-.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0013-Platform-corstone1000-Increase-BL2-size-in-flash-lay.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0013-Platform-corstone1000-Increase-BL2-size-in-flash-lay.patch
new file mode 100644
index 00000000..92d17cc0
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0013-Platform-corstone1000-Increase-BL2-size-in-flash-lay.patch
@@ -0,0 +1,29 @@
+From 77c5a3bd090955e48ffca92bf9535185d26e9017 Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Mon, 15 May 2023 10:42:23 +0100
+Subject: [PATCH 2/4] Platform: corstone1000: Increase BL2 size in flash layout
+
+Increases BL2 size to align with the flash page size in corstone1000.
+
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ platform/ext/target/arm/corstone1000/partition/flash_layout.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/partition/flash_layout.h b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
+index 41b4c6323f..bfe8c4fb3c 100644
+--- a/platform/ext/target/arm/corstone1000/partition/flash_layout.h
++++ b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
+@@ -89,7 +89,7 @@
+ #endif
+ 
+ /* Static Configurations of the Flash */
+-#define SE_BL2_PARTITION_SIZE           (0x18800)    /* 98 KB */
++#define SE_BL2_PARTITION_SIZE           (0x19000)    /* 98 KB */
+ #define SE_BL2_BANK_0_OFFSET            (0x9000)  /* 72nd LBA */
+ #define SE_BL2_BANK_1_OFFSET            (0x1002000)  /* 32784th LBA */
+ 
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0014-Platform-Corstone1000-Increase-BL2_DATA_SIZE.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0014-Platform-Corstone1000-Increase-BL2_DATA_SIZE.patch
new file mode 100644
index 00000000..e2844bac
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0014-Platform-Corstone1000-Increase-BL2_DATA_SIZE.patch
@@ -0,0 +1,33 @@
+From 17244ac692495c23008ff784611d0ee1d42c83dc Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Mon, 15 May 2023 10:46:18 +0100
+Subject: [PATCH 3/4] Platform: Corstone1000: Increase BL2_DATA_SIZE
+
+Increases BL2_DATA_SIZE to accommodate the changes in
+metadata_write/read.
+
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ platform/ext/target/arm/corstone1000/partition/region_defs.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/partition/region_defs.h b/platform/ext/target/arm/corstone1000/partition/region_defs.h
+index abfac39b62..e7f0bad2ba 100644
+--- a/platform/ext/target/arm/corstone1000/partition/region_defs.h
++++ b/platform/ext/target/arm/corstone1000/partition/region_defs.h
+@@ -90,9 +90,10 @@
+ #define BL2_CODE_SIZE     (IMAGE_BL2_CODE_SIZE)
+ #define BL2_CODE_LIMIT    (BL2_CODE_START + BL2_CODE_SIZE - 1)
+ 
++#define BL2_DATA_ADDITIONAL 448 /* To increase the BL2_DATA_SIZE more than the default value */
+ #define BL2_DATA_START    (BOOT_TFM_SHARED_DATA_BASE + \
+                            BOOT_TFM_SHARED_DATA_SIZE)
+-#define BL2_DATA_SIZE     (BL2_CODE_START - BL2_HEADER_SIZE - BL2_DATA_START)
++#define BL2_DATA_SIZE     (BL2_CODE_START - BL2_HEADER_SIZE - BL2_DATA_START + BL2_DATA_ADDITIONAL)
+ #define BL2_DATA_LIMIT    (BL2_DATA_START + BL2_DATA_SIZE - 1)
+ 
+ /* SE BL1 regions */
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0015-Platform-Corstone1000-Calculate-the-new-CRC32-value-.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0015-Platform-Corstone1000-Calculate-the-new-CRC32-value-.patch
new file mode 100644
index 00000000..fd977ac2
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0015-Platform-Corstone1000-Calculate-the-new-CRC32-value-.patch
@@ -0,0 +1,71 @@
+From 83e423497afecc202a3a50c3e472161390056ebd Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Mon, 15 May 2023 10:47:27 +0100
+Subject: [PATCH 4/4] Platform: Corstone1000: Calculate the new CRC32 value
+ after changing the metadata
+
+Calculates the new CRC32 value for the metadata struct after chaing a value
+during the capsule update. It also updates the CRC32 field in the metadata
+so it doesn't fail the CRC check after a succesfull capsule update.
+It also skips doing a sanity check the BL2 nv counter after the capsule
+update since the tfm bl1 does not sync metadata and nv counters in OTP during
+the boot anymore.
+
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ .../arm/corstone1000/fw_update_agent/fwu_agent.c       | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+index afd8d66e42..f564f2902c 100644
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+@@ -802,6 +802,8 @@ static enum fwu_agent_error_t flash_full_capsule(
+     }
+     metadata->active_index = previous_active_index;
+     metadata->previous_active_index = active_index;
++    metadata->crc_32 = crc32((uint8_t *)&metadata->version,
++                              sizeof(struct fwu_metadata) - sizeof(uint32_t));
+ 
+     ret = metadata_write(metadata);
+     if (ret) {
+@@ -913,6 +915,8 @@ static enum fwu_agent_error_t accept_full_capsule(
+     if (ret) {
+         return ret;
+     }
++    metadata->crc_32 = crc32((uint8_t *)&metadata->version,
++                              sizeof(struct fwu_metadata) - sizeof(uint32_t));
+ 
+     ret = metadata_write(metadata);
+     if (ret) {
+@@ -1007,6 +1011,8 @@ static enum fwu_agent_error_t fwu_select_previous(
+     if (ret) {
+         return ret;
+     }
++    metadata->crc_32 = crc32((uint8_t *)&metadata->version,
++                              sizeof(struct fwu_metadata) - sizeof(uint32_t));
+ 
+     ret = metadata_write(metadata);
+     if (ret) {
+@@ -1119,8 +1125,7 @@ static enum fwu_agent_error_t update_nv_counters(
+ 
+     FWU_LOG_MSG("%s: enter\n\r", __func__);
+ 
+-    for (int i = 0; i <= FWU_MAX_NV_COUNTER_INDEX; i++) {
+-
++    for (int i = 1; i <= FWU_MAX_NV_COUNTER_INDEX; i++) {
+         switch (i) {
+             case FWU_BL2_NV_COUNTER:
+                 tfm_nv_counter_i = PLAT_NV_COUNTER_BL1_0;
+@@ -1141,7 +1146,6 @@ static enum fwu_agent_error_t update_nv_counters(
+         if (err != TFM_PLAT_ERR_SUCCESS) {
+             return FWU_AGENT_ERROR;
+         }
+-
+         if (priv_metadata->nv_counter[i] < security_cnt) {
+             return FWU_AGENT_ERROR;
+         } else if (priv_metadata->nv_counter[i] > security_cnt) {
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-corstone1000.inc
index 68845cf9..23c8c127 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-corstone1000.inc
@@ -48,6 +48,9 @@ SRC_URI:append:corstone1000 = " \
     file://0010-Platform-corstone1000-Adds-compiler-flags-to-FWU-age.patch      \
     file://0011-Platform-corstone1000-adjust-PS-asset-configuration.patch       \
     file://0012-Platform-corstone1000-Increase-number-of-assets.patch           \
+    file://0013-Platform-corstone1000-Increase-BL2-size-in-flash-lay.patch      \
+    file://0014-Platform-Corstone1000-Increase-BL2_DATA_SIZE.patch              \
+    file://0015-Platform-Corstone1000-Calculate-the-new-CRC32-value-.patch      \
     file://corstone1000/rwx.patch                                               \
     "
 
-- 
2.17.1


