Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78976C001B0
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 17:35:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.68294.1691516138638746492
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Aug 2023 10:35:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE1131FB
	for <meta-arm@lists.yoctoproject.org>; Tue,  8 Aug 2023 10:36:20 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E8EE03F7C5
	for <meta-arm@lists.yoctoproject.org>; Tue,  8 Aug 2023 10:35:37 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH v2 6/6] arm/trusted-firmware-m: upgrade to v1.8.0
Date: Tue,  8 Aug 2023 12:35:28 -0500
Message-Id: <20230808173528.3606903-6-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230808173528.3606903-1-jon.mason@arm.com>
References: <20230808173528.3606903-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 08 Aug 2023 17:35:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4946

Upgrade tf-m to v1.8.0 and update the related components as well

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...1000-Increase-BL2-size-in-flash-lay.patch} |    8 +-
 ...e-sure-to-write-fwu-metadata-to-repl.patch |   43 -
 ...Corstone1000-Increase-BL2_DATA_SIZE.patch} |    8 +-
 ...e1000-get-fwu-and-private-metadata-f.patch |  307 -----
 ...1000-Calculate-the-new-CRC32-value-.patch} |   10 +-
 ...orstone1000-Add-watchdog_reset_timer.patch |   47 -
 ...one1000-Replace-MCUBOOT-BL1-by-TFM-s.patch | 1034 -----------------
 ...d-firmware-m-disable-fatal-warnings.patch} |    5 +-
 ...e1000-Replace-MCUBOOT-BL1-by-TFM-s-B.patch |  202 ----
 ...rm-corstone1000-Reorganize-bl2-files.patch |   61 -
 ...rstone1000-Fix-linker-script-comment.patch |   47 -
 ...e1000-Fix-linkerscripts-copyright-ye.patch |   39 -
 ...e1000-fix-flash-reading-issue-for-fi.patch |   38 -
 ...e1000-Adds-compiler-flags-to-FWU-age.patch |  273 -----
 ...ne1000-adjust-PS-asset-configuration.patch |   29 -
 ...rstone1000-Increase-number-of-assets.patch |   36 -
 ...nc =3D> trusted-firmware-m-corstone1000.inc} |   28 +-
 ...bbappend =3D> trusted-firmware-m_%.bbappend} |    2 +-
 .../trusted-firmware-m/files/rwx.patch        |   24 -
 ...c.inc =3D> trusted-firmware-m-1.8.0-src.inc} |   24 +-
 ...rusted-firmware-m-scripts-native_1.8.0.bb} |    2 +-
 .../trusted-firmware-m/trusted-firmware-m.inc |    2 -
 ...m_1.7.0.bb =3D> trusted-firmware-m_1.8.0.bb} |    2 +-
 23 files changed, 31 insertions(+), 2240 deletions(-)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
013-Platform-corstone1000-Increase-BL2-size-in-flash-lay.patch =3D> 0001-=
Platform-corstone1000-Increase-BL2-size-in-flash-lay.patch} (87%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0001-Platform-corstone1000-make-sure-to-write-fwu-metadata-to-r=
epl.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
014-Platform-Corstone1000-Increase-BL2_DATA_SIZE.patch =3D> 0002-Platform=
-Corstone1000-Increase-BL2_DATA_SIZE.patch} (90%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0002-Platform-corstone1000-get-fwu-and-private-metadata-f.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
015-Platform-Corstone1000-Calculate-the-new-CRC32-value-.patch =3D> 0003-=
Platform-Corstone1000-Calculate-the-new-CRC32-value-.patch} (93%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0003-Platform-corstone1000-Add-watchdog_reset_timer.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0004-Platform-corstone1000-Replace-MCUBOOT-BL1-by-TFM-s.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{r=
wx.patch =3D> 0004-arm-trusted-firmware-m-disable-fatal-warnings.patch} (=
87%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0005-Platform-corstone1000-Replace-MCUBOOT-BL1-by-TFM-s-B.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0006-Platform-corstone1000-Reorganize-bl2-files.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0007-Platform-corstone1000-Fix-linker-script-comment.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0008-Platform-corstone1000-Fix-linkerscripts-copyright-ye.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0009-Platform-corstone1000-fix-flash-reading-issue-for-fi.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0010-Platform-corstone1000-Adds-compiler-flags-to-FWU-age.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0011-Platform-corstone1000-adjust-PS-asset-configuration.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0012-Platform-corstone1000-Increase-number-of-assets.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/{trusted-firmware-m-1=
.7.0-corstone1000.inc =3D> trusted-firmware-m-corstone1000.inc} (61%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/{trusted-firmware-m_1=
.7.%.bbappend =3D> trusted-firmware-m_%.bbappend} (54%)
 delete mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/files/rwx.pat=
ch
 rename meta-arm/recipes-bsp/trusted-firmware-m/{trusted-firmware-m-1.7.0=
-src.inc =3D> trusted-firmware-m-1.8.0-src.inc} (80%)
 rename meta-arm/recipes-bsp/trusted-firmware-m/{trusted-firmware-m-scrip=
ts-native_1.7.0.bb =3D> trusted-firmware-m-scripts-native_1.8.0.bb} (57%)
 rename meta-arm/recipes-bsp/trusted-firmware-m/{trusted-firmware-m_1.7.0=
.bb =3D> trusted-firmware-m_1.8.0.bb} (52%)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0013-Platform-corstone1000-Increase-BL2-size-in-flash-lay.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001-Platform-=
corstone1000-Increase-BL2-size-in-flash-lay.patch
similarity index 87%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0013-Platform-corstone1000-Increase-BL2-size-in-flash-lay.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0001-Platform-corstone1000-Increase-BL2-size-in-flash-lay.patch
index 92d17cc0..98dabbe9 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0013=
-Platform-corstone1000-Increase-BL2-size-in-flash-lay.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001=
-Platform-corstone1000-Increase-BL2-size-in-flash-lay.patch
@@ -1,12 +1,13 @@
-From 77c5a3bd090955e48ffca92bf9535185d26e9017 Mon Sep 17 00:00:00 2001
+From 60598f3b44237bd5038e33400e749ec1e7e8fbda Mon Sep 17 00:00:00 2001
 From: Emekcan Aras <emekcan.aras@arm.com>
 Date: Mon, 15 May 2023 10:42:23 +0100
-Subject: [PATCH 2/4] Platform: corstone1000: Increase BL2 size in flash =
layout
+Subject: [PATCH] Platform: corstone1000: Increase BL2 size in flash layo=
ut
=20
 Increases BL2 size to align with the flash page size in corstone1000.
=20
 Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
 Upstream-Status: Pending [Not submitted to upstream yet]
+
 ---
  platform/ext/target/arm/corstone1000/partition/flash_layout.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -24,6 +25,3 @@ index 41b4c6323f..bfe8c4fb3c 100644
  #define SE_BL2_BANK_0_OFFSET            (0x9000)  /* 72nd LBA */
  #define SE_BL2_BANK_1_OFFSET            (0x1002000)  /* 32784th LBA */
 =20
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0001-Platform-corstone1000-make-sure-to-write-fwu-metadata-to-repl.pat=
ch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001-=
Platform-corstone1000-make-sure-to-write-fwu-metadata-to-repl.patch
deleted file mode 100644
index eeaf6d19..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001=
-Platform-corstone1000-make-sure-to-write-fwu-metadata-to-repl.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 0ee6842d348e206d511ec89a7ff5b29a6f325456 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Sun, 29 Jan 2023 19:01:08 +0000
-Subject: [PATCH] corstone1000: make sure to write fwu metadata to replic=
a 2
-
-u-boot and other, before using fwu metadata validate if
-the copies in both replicas are good. so, make sure
-we write fwu metadata in both replicas.
-
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/20550]
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- .../arm/corstone1000/fw_update_agent/fwu_agent.c   | 14 ++++++++++++++
- 1 file changed, 14 insertions(+)
-
-diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-index e1fa297ac923..215902ce71b9 100644
---- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-+++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-@@ -238,6 +238,20 @@ static enum fwu_agent_error_t metadata_write(
-         return FWU_AGENT_ERROR;
-     }
-=20
-+    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
-+                  FWU_METADATA_REPLICA_2_OFFSET, sizeof(struct fwu_meta=
data));
-+
-+    ret =3D FWU_METADATA_FLASH_DEV.EraseSector(FWU_METADATA_REPLICA_2_O=
FFSET);
-+    if (ret !=3D ARM_DRIVER_OK) {
-+        return FWU_AGENT_ERROR;
-+    }
-+
-+    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(FWU_METADATA_REPLICA_2_O=
FFSET,
-+                                p_metadata, sizeof(struct fwu_metadata)=
);
-+    if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
-+        return FWU_AGENT_ERROR;
-+    }
-+
-     FWU_LOG_MSG("%s: success: active =3D %u, previous =3D %d\n\r", __fu=
nc__,
-                   p_metadata->active_index, p_metadata->previous_active=
_index);
-     return FWU_AGENT_SUCCESS;
---=20
-2.39.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0014-Platform-Corstone1000-Increase-BL2_DATA_SIZE.patch b/meta-arm-bsp=
/recipes-bsp/trusted-firmware-m/files/corstone1000/0002-Platform-Corstone=
1000-Increase-BL2_DATA_SIZE.patch
similarity index 90%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0014-Platform-Corstone1000-Increase-BL2_DATA_SIZE.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0002-Platform-Corstone1000-Increase-BL2_DATA_SIZE.patch
index e2844bac..d348d02d 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0014=
-Platform-Corstone1000-Increase-BL2_DATA_SIZE.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0002=
-Platform-Corstone1000-Increase-BL2_DATA_SIZE.patch
@@ -1,13 +1,14 @@
-From 17244ac692495c23008ff784611d0ee1d42c83dc Mon Sep 17 00:00:00 2001
+From b05fb661b3afc3ed8e3d4817df2798e9d4877b39 Mon Sep 17 00:00:00 2001
 From: Emekcan Aras <emekcan.aras@arm.com>
 Date: Mon, 15 May 2023 10:46:18 +0100
-Subject: [PATCH 3/4] Platform: Corstone1000: Increase BL2_DATA_SIZE
+Subject: [PATCH] Platform: Corstone1000: Increase BL2_DATA_SIZE
=20
 Increases BL2_DATA_SIZE to accommodate the changes in
 metadata_write/read.
=20
 Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
 Upstream-Status: Pending [Not submitted to upstream yet]
+
 ---
  platform/ext/target/arm/corstone1000/partition/region_defs.h | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
@@ -28,6 +29,3 @@ index abfac39b62..e7f0bad2ba 100644
  #define BL2_DATA_LIMIT    (BL2_DATA_START + BL2_DATA_SIZE - 1)
 =20
  /* SE BL1 regions */
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0002-Platform-corstone1000-get-fwu-and-private-metadata-f.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0002-Platform-=
corstone1000-get-fwu-and-private-metadata-f.patch
deleted file mode 100644
index 3d7fc4b3..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0002=
-Platform-corstone1000-get-fwu-and-private-metadata-f.patch
+++ /dev/null
@@ -1,307 +0,0 @@
-From 4a4d1b0a5a2455ad799a45f7f87c0c9fd0173034 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Wed, 29 Mar 2023 10:58:32 +0100
-Subject: [PATCH] Platform: Corstone1000: get fwu and private metadata fr=
om gpt
-
-Read and Write the FWU metadata and private metadata using instead
-static flash offsets get the partitions and start address from gpt
-partition table.
-
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/20551]
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- .../target/arm/corstone1000/CMakeLists.txt    |  7 ++
- .../corstone1000/fw_update_agent/fwu_agent.c  | 90 +++++++++++++++----
- .../target/arm/corstone1000/partition/efi.h   |  1 +
- .../arm/corstone1000/partition/partition.c    | 14 +++
- .../arm/corstone1000/partition/partition.h    |  1 +
- .../ext/target/arm/corstone1000/platform.h    |  5 ++
- 6 files changed, 99 insertions(+), 19 deletions(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platf=
orm/ext/target/arm/corstone1000/CMakeLists.txt
-index 19863bcdb6d2..f232c7639bd5 100644
---- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
-+++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
-@@ -64,6 +64,8 @@ target_include_directories(platform_s
-         cc312
-         fw_update_agent
-         soft_crc
-+        io
-+        partition
- )
-=20
- target_sources(platform_s
-@@ -81,6 +83,11 @@ target_sources(platform_s
-         fw_update_agent/fwu_agent.c
-         fw_update_agent/uefi_fmp.c
-         soft_crc/soft_crc.c
-+        io/io_block.c
-+        io/io_flash.c
-+        io/io_storage.c
-+        partition/partition.c
-+        partition/gpt.c
-         $<$<NOT:$<BOOL:${PLATFORM_DEFAULT_OTP}>>:${PLATFORM_DIR}/ext/ac=
celerator/cc312/otp_cc312.c>
- )
-=20
-diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-index b6ed656de833..9c76b25a3a38 100644
---- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-+++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-@@ -14,6 +14,8 @@
- #include "region_defs.h"
- #include "uefi_capsule_parser.h"
- #include "flash_common.h"
-+#include "partition.h"
-+#include "platform.h"
- #include "platform_base_address.h"
- #include "platform_description.h"
- #include "tfm_plat_nv_counters.h"
-@@ -146,6 +148,8 @@ extern ARM_DRIVER_FLASH FWU_METADATA_FLASH_DEV;
- static enum fwu_agent_error_t private_metadata_read(
-         struct fwu_private_metadata* p_metadata)
- {
-+    partition_entry_t *part;
-+    uuid_t private_uuid =3D PRIVATE_METADATA_TYPE_UUID;
-     int ret;
-=20
-     FWU_LOG_MSG("%s: enter\n\r", __func__);
-@@ -154,7 +158,13 @@ static enum fwu_agent_error_t private_metadata_read=
(
-         return FWU_AGENT_ERROR;
-     }
-=20
--    ret =3D FWU_METADATA_FLASH_DEV.ReadData(FWU_PRIVATE_METADATA_REPLIC=
A_1_OFFSET, p_metadata,
-+    part =3D get_partition_entry_by_type(&private_uuid);
-+    if (!part) {
-+        FWU_LOG_MSG("Private metadata partition not found\n\r");
-+        return FWU_AGENT_ERROR;
-+    }
-+
-+    ret =3D FWU_METADATA_FLASH_DEV.ReadData(part->start, p_metadata,
-                                           sizeof(struct fwu_private_met=
adata));
-     if (ret < 0 || ret !=3D sizeof(struct fwu_private_metadata)) {
-         return FWU_AGENT_ERROR;
-@@ -169,6 +179,8 @@ static enum fwu_agent_error_t private_metadata_read(
- static enum fwu_agent_error_t private_metadata_write(
-         struct fwu_private_metadata* p_metadata)
- {
-+    uuid_t private_uuid =3D PRIVATE_METADATA_TYPE_UUID;
-+    partition_entry_t *part;
-     int ret;
-=20
-     FWU_LOG_MSG("%s: enter: boot_index =3D %u\n\r", __func__,
-@@ -178,12 +190,18 @@ static enum fwu_agent_error_t private_metadata_wri=
te(
-         return FWU_AGENT_ERROR;
-     }
-=20
--    ret =3D FWU_METADATA_FLASH_DEV.EraseSector(FWU_PRIVATE_METADATA_REP=
LICA_1_OFFSET);
-+    part =3D get_partition_entry_by_type(&private_uuid);
-+    if (!part) {
-+        FWU_LOG_MSG("Private metadata partition not found\n\r");
-+        return FWU_AGENT_ERROR;
-+    }
-+
-+    ret =3D FWU_METADATA_FLASH_DEV.EraseSector(part->start);
-     if (ret !=3D ARM_DRIVER_OK) {
-         return FWU_AGENT_ERROR;
-     }
-=20
--    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(FWU_PRIVATE_METADATA_REP=
LICA_1_OFFSET,
-+    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(part->start,
-                                 p_metadata, sizeof(struct fwu_private_m=
etadata));
-     if (ret < 0 || ret !=3D sizeof(struct fwu_private_metadata)) {
-         return FWU_AGENT_ERROR;
-@@ -219,16 +237,25 @@ static enum fwu_agent_error_t metadata_validate(st=
ruct fwu_metadata *p_metadata)
-=20
- static enum fwu_agent_error_t metadata_read_without_validation(struct f=
wu_metadata *p_metadata)
- {
-+    uuid_t metadata_uuid =3D FWU_METADATA_TYPE_UUID;
-+    partition_entry_t *part;
-     int ret;
-=20
--    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
--                  FWU_METADATA_REPLICA_1_OFFSET, sizeof(struct fwu_meta=
data));
--
-     if (!p_metadata) {
-         return FWU_AGENT_ERROR;
-     }
-=20
--    ret =3D FWU_METADATA_FLASH_DEV.ReadData(FWU_METADATA_REPLICA_1_OFFS=
ET,
-+    part =3D get_partition_entry_by_type(&metadata_uuid);
-+    if (!part) {
-+        FWU_LOG_MSG("%s: FWU metadata partition not found\n\r", __func_=
_);
-+        return FWU_AGENT_ERROR;
-+    }
-+
-+    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
-+                  part->start, sizeof(struct fwu_metadata));
-+
-+
-+    ret =3D FWU_METADATA_FLASH_DEV.ReadData(part->start,
-                                 p_metadata, sizeof(struct fwu_metadata)=
);
-     if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
-         return FWU_AGENT_ERROR;
-@@ -242,16 +269,24 @@ static enum fwu_agent_error_t metadata_read_withou=
t_validation(struct fwu_metada
-=20
- static enum fwu_agent_error_t metadata_read(struct fwu_metadata *p_meta=
data)
- {
-+    uuid_t metadata_uuid =3D FWU_METADATA_TYPE_UUID;
-+    partition_entry_t *part;
-     int ret;
-=20
--    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
--                  FWU_METADATA_REPLICA_1_OFFSET, sizeof(struct fwu_meta=
data));
--
-     if (!p_metadata) {
-         return FWU_AGENT_ERROR;
-     }
-=20
--    ret =3D FWU_METADATA_FLASH_DEV.ReadData(FWU_METADATA_REPLICA_1_OFFS=
ET,
-+    part =3D get_partition_entry_by_type(&metadata_uuid);
-+    if (!part) {
-+        FWU_LOG_MSG("%s: FWU metadata partition not found\n\r", __func_=
_);
-+        return FWU_AGENT_ERROR;
-+    }
-+
-+    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
-+                  part->start, sizeof(struct fwu_metadata));
-+
-+    ret =3D FWU_METADATA_FLASH_DEV.ReadData(part->start,
-                                 p_metadata, sizeof(struct fwu_metadata)=
);
-     if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
-         return FWU_AGENT_ERROR;
-@@ -270,35 +305,49 @@ static enum fwu_agent_error_t metadata_read(struct=
 fwu_metadata *p_metadata)
- static enum fwu_agent_error_t metadata_write(
-                         struct fwu_metadata *p_metadata)
- {
-+    uuid_t metadata_uuid =3D FWU_METADATA_TYPE_UUID;
-+    partition_entry_t *part;
-     int ret;
-=20
--    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
--                  FWU_METADATA_REPLICA_1_OFFSET, sizeof(struct fwu_meta=
data));
--
-     if (!p_metadata) {
-         return FWU_AGENT_ERROR;
-     }
-=20
--    ret =3D FWU_METADATA_FLASH_DEV.EraseSector(FWU_METADATA_REPLICA_1_O=
FFSET);
-+    part =3D get_partition_entry_by_type(&metadata_uuid);
-+    if (!part) {
-+        FWU_LOG_MSG("%s: FWU metadata partition not found\n\r", __func_=
_);
-+        return FWU_AGENT_ERROR;
-+    }
-+
-+    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
-+                  part->start, sizeof(struct fwu_metadata));
-+
-+    ret =3D FWU_METADATA_FLASH_DEV.EraseSector(part->start);
-     if (ret !=3D ARM_DRIVER_OK) {
-         return FWU_AGENT_ERROR;
-     }
-=20
--    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(FWU_METADATA_REPLICA_1_O=
FFSET,
-+    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(part->start,
-                                 p_metadata, sizeof(struct fwu_metadata)=
);
-     if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
-         return FWU_AGENT_ERROR;
-     }
-=20
-+    part =3D get_partition_replica_by_type(&metadata_uuid);
-+    if (!part) {
-+        FWU_LOG_MSG("%s: FWU metadata replica partition not found\n\r",=
 __func__);
-+        return FWU_AGENT_ERROR;
-+    }
-+
-     FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
--                  FWU_METADATA_REPLICA_2_OFFSET, sizeof(struct fwu_meta=
data));
-+                  part->start, sizeof(struct fwu_metadata));
-=20
--    ret =3D FWU_METADATA_FLASH_DEV.EraseSector(FWU_METADATA_REPLICA_2_O=
FFSET);
-+    ret =3D FWU_METADATA_FLASH_DEV.EraseSector(part->start);
-     if (ret !=3D ARM_DRIVER_OK) {
-         return FWU_AGENT_ERROR;
-     }
-=20
--    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(FWU_METADATA_REPLICA_2_O=
FFSET,
-+    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(part->start,
-                                 p_metadata, sizeof(struct fwu_metadata)=
);
-     if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
-         return FWU_AGENT_ERROR;
-@@ -355,6 +404,9 @@ enum fwu_agent_error_t fwu_metadata_provision(void)
-=20
-     FWU_LOG_MSG("%s: enter\n\r", __func__);
-=20
-+    plat_io_storage_init();
-+    partition_init(PLATFORM_GPT_IMAGE);
-+
-     ret =3D fwu_metadata_init();
-     if (ret) {
-         return ret;
-diff --git a/platform/ext/target/arm/corstone1000/partition/efi.h b/plat=
form/ext/target/arm/corstone1000/partition/efi.h
-index f66daffb32d6..7e6a4bc883e6 100644
---- a/platform/ext/target/arm/corstone1000/partition/efi.h
-+++ b/platform/ext/target/arm/corstone1000/partition/efi.h
-@@ -8,6 +8,7 @@
- #ifndef DRIVERS_PARTITION_EFI_H
- #define DRIVERS_PARTITION_EFI_H
-=20
-+#include <stdint.h>
- #include <string.h>
-=20
- #include "uuid.h"
-diff --git a/platform/ext/target/arm/corstone1000/partition/partition.c =
b/platform/ext/target/arm/corstone1000/partition/partition.c
-index afc6aa1c5cb8..d76e123d728f 100644
---- a/platform/ext/target/arm/corstone1000/partition/partition.c
-+++ b/platform/ext/target/arm/corstone1000/partition/partition.c
-@@ -293,6 +293,20 @@ const partition_entry_t *get_partition_entry_by_typ=
e(const uuid_t *type_uuid) {
-     return NULL;
- }
-=20
-+const partition_entry_t *get_partition_replica_by_type(const uuid_t *ty=
pe_uuid) {
-+    int count =3D 0;
-+    int i;
-+
-+    for (i =3D 0; i < list.entry_count; i++) {
-+        if (guidcmp(type_uuid, &list.list[i].type_guid) =3D=3D 0) {
-+            if (++count =3D=3D 2)
-+                 return &list.list[i];
-+        }
-+    }
-+
-+    return NULL;
-+}
-+
- const partition_entry_t *get_partition_entry_by_uuid(const uuid_t *part=
_uuid) {
-     int i;
-=20
-diff --git a/platform/ext/target/arm/corstone1000/partition/partition.h =
b/platform/ext/target/arm/corstone1000/partition/partition.h
-index 54af47aca415..450cf20a073c 100644
---- a/platform/ext/target/arm/corstone1000/partition/partition.h
-+++ b/platform/ext/target/arm/corstone1000/partition/partition.h
-@@ -40,6 +40,7 @@ typedef struct partition_entry_list {
- int load_partition_table(unsigned int image_id);
- const partition_entry_t *get_partition_entry(const char *name);
- const partition_entry_t *get_partition_entry_by_type(const uuid_t *type=
_guid);
-+const partition_entry_t *get_partition_replica_by_type(const uuid_t *ty=
pe_uuid);
- const partition_entry_t *get_partition_entry_by_uuid(const uuid_t *part=
_uuid);
- const partition_entry_list_t *get_partition_entry_list(void);
- void partition_init(unsigned int image_id);
-diff --git a/platform/ext/target/arm/corstone1000/platform.h b/platform/=
ext/target/arm/corstone1000/platform.h
-index 894f5e309029..a88093ed4f9d 100644
---- a/platform/ext/target/arm/corstone1000/platform.h
-+++ b/platform/ext/target/arm/corstone1000/platform.h
-@@ -13,6 +13,11 @@ typedef enum {
-     PLATFORM_IMAGE_COUNT,
- }platform_image_id_t;
-=20
-+#define FWU_METADATA_TYPE_UUID \
-+     ((uuid_t){{0xa0, 0x84, 0x7a, 0x8a}, {0x87, 0x83}, {0xf6, 0x40}, 0x=
ab,  0x41, {0xa8, 0xb9, 0xa5, 0xa6, 0x0d, 0x23}})
-+#define PRIVATE_METADATA_TYPE_UUID \
-+     ((uuid_t){{0xc3, 0x5d, 0xb5, 0xec}, {0xb7, 0x8a}, {0x84, 0x4a}, 0x=
ab,  0x56, {0xeb, 0x0a, 0x99, 0x74, 0xdb, 0x42}})
-+
- /* Initialize io storage of the platform */
- int32_t plat_io_storage_init(void);
-=20
---=20
-2.40.0
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0015-Platform-Corstone1000-Calculate-the-new-CRC32-value-.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003-Platform-=
Corstone1000-Calculate-the-new-CRC32-value-.patch
similarity index 93%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0015-Platform-Corstone1000-Calculate-the-new-CRC32-value-.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0003-Platform-Corstone1000-Calculate-the-new-CRC32-value-.patch
index fd977ac2..bf7aba8d 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0015=
-Platform-Corstone1000-Calculate-the-new-CRC32-value-.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003=
-Platform-Corstone1000-Calculate-the-new-CRC32-value-.patch
@@ -1,8 +1,8 @@
-From 83e423497afecc202a3a50c3e472161390056ebd Mon Sep 17 00:00:00 2001
+From 88cfce2e04913d48ec8636b6a3550d71ebdd49c4 Mon Sep 17 00:00:00 2001
 From: Emekcan Aras <emekcan.aras@arm.com>
 Date: Mon, 15 May 2023 10:47:27 +0100
-Subject: [PATCH 4/4] Platform: Corstone1000: Calculate the new CRC32 val=
ue
- after changing the metadata
+Subject: [PATCH] Platform: Corstone1000: Calculate the new CRC32 value a=
fter
+ changing the metadata
=20
 Calculates the new CRC32 value for the metadata struct after chaing a va=
lue
 during the capsule update. It also updates the CRC32 field in the metada=
ta
@@ -13,6 +13,7 @@ the boot anymore.
=20
 Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
 Upstream-Status: Pending [Not submitted to upstream yet]
+
 ---
  .../arm/corstone1000/fw_update_agent/fwu_agent.c       | 10 +++++++---
  1 file changed, 7 insertions(+), 3 deletions(-)
@@ -66,6 +67,3 @@ index afd8d66e42..f564f2902c 100644
          if (priv_metadata->nv_counter[i] < security_cnt) {
              return FWU_AGENT_ERROR;
          } else if (priv_metadata->nv_counter[i] > security_cnt) {
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0003-Platform-corstone1000-Add-watchdog_reset_timer.patch b/meta-arm-b=
sp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003-Platform-corsto=
ne1000-Add-watchdog_reset_timer.patch
deleted file mode 100644
index 3ffd83e9..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003=
-Platform-corstone1000-Add-watchdog_reset_timer.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 33d8f45c8f14e9e0d7add7d2804ed76c7d7fd0c2 Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Sat, 25 Feb 2023 09:04:38 +0000
-Subject: [PATCH 1/7] Platform: corstone1000: Add watchdog_reset_timer
-
-From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-
-Implement watchdog_reset_timer
-
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/20552]
-Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-Change-Id: I2684ca54f9a456b22efcbcd364abef3537d4c91f
----
- .../arm/corstone1000/Native_Driver/watchdog.c   | 17 +++++++++++++++++
- 1 file changed, 17 insertions(+)
-
-diff --git a/platform/ext/target/arm/corstone1000/Native_Driver/watchdog=
.c b/platform/ext/target/arm/corstone1000/Native_Driver/watchdog.c
-index 4e024a3b1..f6e182194 100644
---- a/platform/ext/target/arm/corstone1000/Native_Driver/watchdog.c
-+++ b/platform/ext/target/arm/corstone1000/Native_Driver/watchdog.c
-@@ -80,6 +80,23 @@ int corstone1000_watchdog_init()
-     return ARM_DRIVER_OK;
- }
-=20
-+/**
-+ *  \brief Reset the Secure Enclave & SoC Watchdog's.
-+ *
-+ *  \returns ARM Driver return code.
-+ */
-+int corstone1000_watchdog_reset_timer() {
-+    /* Unlock, clear and lock the watchdog timer */
-+    arm_watchdog_unlock(&SE_WD_DEV);
-+    arm_watchdog_clear_interrupt_and_refresh_counter(&SE_WD_DEV);
-+    arm_watchdog_lock(&SE_WD_DEV);
-+    /* Unlock, clear and lock the watchdog timer */
-+    arm_watchdog_unlock(&SOC_WD_DEV);
-+    arm_watchdog_clear_interrupt_and_refresh_counter(&SOC_WD_DEV);
-+    arm_watchdog_lock(&SOC_WD_DEV);
-+    return ARM_DRIVER_OK;
-+}
-+
- /*
-  * Secure Host Watchdog WS1 Handler
-  * efi_reset_system from the host triggers "Secure
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0004-Platform-corstone1000-Replace-MCUBOOT-BL1-by-TFM-s.patch b/meta-a=
rm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0004-Platform-co=
rstone1000-Replace-MCUBOOT-BL1-by-TFM-s.patch
deleted file mode 100644
index 0ad44947..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0004=
-Platform-corstone1000-Replace-MCUBOOT-BL1-by-TFM-s.patch
+++ /dev/null
@@ -1,1034 +0,0 @@
-From e46fd33355b54c08d1764c2a8e7b553960d61157 Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Sat, 25 Feb 2023 10:29:55 +0000
-Subject: [PATCH 1/6] Platform: corstone1000: Replace MCUBOOT BL1 by TFM'=
s
-
-From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-
-Replace The current BL1 (MCUBOOT) with the TFM BL1
-by enabling
-- PLATFORM_DEFAULT_BL1
-- Update linkerscripts
-- Update CMakeFile
-- Adapt boot_hal
-- Adapt provisioning (to use the provision bundle)
-- Adapt flash_layout and region_defs
-- Update documentation of corstone1000 build and run sections
-
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/20553]
-Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-Change-Id: I224b24d0f4423e62468e609c11a239a4575cdae4
----
- .../target/arm/corstone1000/CMakeLists.txt    |  70 +++++-
- .../Device/Include/boot_measurement.h         |  24 +++
- .../Device/Include/platform_base_address.h    |   3 +
- .../Device/Source/gcc/corstone1000_bl1_1.ld   | 203 ++++++++++++++++++
- ...stone1000_bl1.ld =3D> corstone1000_bl1_2.ld} |   8 +-
- .../target/arm/corstone1000/bl1/bl1_rotpk.c   |  48 -----
- .../bl1/{bl1_boot_hal.c =3D> boot_hal_bl1.c}    | 102 ++++-----
- .../arm/corstone1000/bl1/flash_map_extended.c | 103 ---------
- .../arm/corstone1000/bl1/provisioning.c       | 109 +++++-----
- .../ext/target/arm/corstone1000/config.cmake  |  18 +-
- .../arm/corstone1000/partition/flash_layout.h |  10 -
- .../arm/corstone1000/partition/region_defs.h  |  37 +++-
- 12 files changed, 434 insertions(+), 301 deletions(-)
- create mode 100644 platform/ext/target/arm/corstone1000/Device/Include/=
boot_measurement.h
- create mode 100644 platform/ext/target/arm/corstone1000/Device/Source/g=
cc/corstone1000_bl1_1.ld
- rename platform/ext/target/arm/corstone1000/Device/Source/gcc/{corstone=
1000_bl1.ld =3D> corstone1000_bl1_2.ld} (95%)
- delete mode 100644 platform/ext/target/arm/corstone1000/bl1/bl1_rotpk.c
- rename platform/ext/target/arm/corstone1000/bl1/{bl1_boot_hal.c =3D> bo=
ot_hal_bl1.c} (90%)
- delete mode 100644 platform/ext/target/arm/corstone1000/bl1/flash_map_e=
xtended.c
-
-diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platf=
orm/ext/target/arm/corstone1000/CMakeLists.txt
-index 19863bcdb..a4fe28c08 100644
---- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
-+++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
-@@ -41,6 +41,23 @@ target_add_scatter_file(bl2
-         $<$<C_COMPILER_ID:GNU>:${PLATFORM_DIR}/ext/common/gcc/tfm_commo=
n_bl2.ld>
- )
-=20
-+target_sources(bl1_1
-+PRIVATE
-+    $<$<C_COMPILER_ID:GNU>:${CMAKE_CURRENT_SOURCE_DIR}/Device/Source/st=
artup_corstone1000.c>
-+)
-+
-+target_add_scatter_file(bl1_1
-+    $<$<C_COMPILER_ID:GNU>:${CMAKE_CURRENT_SOURCE_DIR}/Device/Source/gc=
c/corstone1000_bl1_1.ld>
-+)
-+
-+target_sources(bl1_2
-+PRIVATE
-+    $<$<C_COMPILER_ID:GNU>:${CMAKE_CURRENT_SOURCE_DIR}/Device/Source/st=
artup_corstone1000.c>
-+)
-+target_add_scatter_file(bl1_2
-+    $<$<C_COMPILER_ID:GNU>:${CMAKE_CURRENT_SOURCE_DIR}/Device/Source/gc=
c/corstone1000_bl1_2.ld>
-+)
-+
- #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D Platform Secure =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D#
-=20
- add_subdirectory(openamp)
-@@ -115,6 +132,55 @@ if (TFM_PARTITION_CRYPTO)
-     )
- endif()
-=20
-+#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D Platform BL1 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D#
-+
-+target_sources(platform_bl1
-+    PRIVATE
-+        ./Device/Source/system_core_init.c
-+        ./Device/Source/device_definition.c
-+        ./bl1/boot_hal_bl1.c
-+        ./Native_Driver/firewall.c
-+        ./CMSIS_Driver/Driver_Flash.c
-+        ./CMSIS_Driver/Driver_USART.c
-+        ./Native_Driver/uart_pl011_drv.c
-+        $<$<BOOL:${PLATFORM_IS_FVP}>:${CMAKE_CURRENT_SOURCE_DIR}/Native=
_Driver/cfi_drv.c>
-+        $<$<BOOL:${PLATFORM_IS_FVP}>:${PLATFORM_DIR}/ext/target/arm/dri=
vers/flash/strata/spi_strataflashj3_flash_lib.c>
-+        $<$<NOT:$<BOOL:${PLATFORM_IS_FVP}>>:${PLATFORM_DIR}/ext/target/=
arm/drivers/qspi/xilinx_pg153_axi/xilinx_pg153_axi_qspi_controller_drv.c>
-+        $<$<NOT:$<BOOL:${PLATFORM_IS_FVP}>>:${PLATFORM_DIR}/ext/target/=
arm/drivers/flash/n25q256a/spi_n25q256a_flash_lib.c>
-+        $<$<NOT:$<BOOL:${PLATFORM_IS_FVP}>>:${PLATFORM_DIR}/ext/target/=
arm/drivers/flash/sst26vf064b/spi_sst26vf064b_flash_lib.c>
-+        ./fw_update_agent/uefi_capsule_parser.c
-+        ./fw_update_agent/fwu_agent.c
-+        ./fw_update_agent/uefi_fmp.c
-+        ./soft_crc/soft_crc.c
-+        ./Native_Driver/arm_watchdog_drv.c
-+        ./Native_Driver/watchdog.c
-+        ./bl1/provisioning.c
-+        $<$<NOT:$<BOOL:${PLATFORM_DEFAULT_OTP}>>:${PLATFORM_DIR}/ext/ac=
celerator/cc312/otp_cc312.c>
-+)
-+
-+target_compile_definitions(platform_bl1
-+    PUBLIC
-+        $<$<BOOL:${PLATFORM_IS_FVP}>:PLATFORM_IS_FVP>
-+        $<$<AND:$<BOOL:${CONFIG_TFM_BOOT_STORE_MEASUREMENTS}>,$<BOOL:${=
TFM_PARTITION_MEASURED_BOOT}>>:MEASURED_BOOT_API>
-+        $<$<BOOL:${PLATFORM_DEFAULT_OTP_WRITEABLE}>:OTP_WRITEABLE>
-+)
-+
-+target_include_directories(platform_bl1_interface
-+    INTERFACE
-+        .
-+        ./Device/Include
-+        ./Device/Config
-+        ./Native_Driver
-+        ./CMSIS_Driver/Config
-+        ./fw_update_agent
-+        ./soft_crc
-+        ${PLATFORM_DIR}/ext/target/arm/drivers/flash/common
-+        ${PLATFORM_DIR}/ext/target/arm/drivers/flash/strata
-+        ${PLATFORM_DIR}/ext/target/arm/drivers/qspi/xilinx_pg153_axi/
-+        ${PLATFORM_DIR}/ext/target/arm/drivers/flash/n25q256a/
-+        ${PLATFORM_DIR}/ext/target/arm/drivers/flash/sst26vf064b/
-+)
-+
- #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D Platform BL2 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D#
-=20
- set(BL2_SOURCE ${CMAKE_SOURCE_DIR}/bl2)
-@@ -214,10 +280,6 @@ target_include_directories(platform_bl2
-         $<BUILD_INTERFACE:${BL2_SOURCE}/ext/mcuboot/include>
- )
-=20
--#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D BL1 component =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D#
--
--add_subdirectory(bl1)
--
- #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D ns_agent_mailbox =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D#
-=20
- target_sources(tfm_psa_rot_partition_ns_agent_mailbox
-diff --git a/platform/ext/target/arm/corstone1000/Device/Include/boot_me=
asurement.h b/platform/ext/target/arm/corstone1000/Device/Include/boot_me=
asurement.h
-new file mode 100644
-index 000000000..a47bdb148
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/Device/Include/boot_measureme=
nt.h
-@@ -0,0 +1,24 @@
-+/*
-+ * Copyright (c) 2023, Arm Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ *
-+ */
-+
-+#ifndef __BOOT_MEASUREMENT_H__
-+#define __BOOT_MEASUREMENT_H__
-+
-+enum boot_measurement_slot_t {
-+    BOOT_MEASUREMENT_SLOT_BL1_2 =3D 0,
-+    BOOT_MEASUREMENT_SLOT_BL2,
-+    BOOT_MEASUREMENT_SLOT_RT_0,
-+    BOOT_MEASUREMENT_SLOT_RT_1,
-+    BOOT_MEASUREMENT_SLOT_RT_2,
-+    BOOT_MEASUREMENT_SLOT_MAX =3D 32,
-+    BOOT_MEASUREMENT_SLOT_MAX_THEORETICAL =3D 63  /* Slot index is stor=
ed in
-+                                                 * 6 bits in the shared
-+                                                 * memory area.
-+                                                 */
-+};
-+
-+#endif /* __BOOT_MEASUREMENT_H__ */
-diff --git a/platform/ext/target/arm/corstone1000/Device/Include/platfor=
m_base_address.h b/platform/ext/target/arm/corstone1000/Device/Include/pl=
atform_base_address.h
-index 5cca4c4a1..416f0ebcd 100644
---- a/platform/ext/target/arm/corstone1000/Device/Include/platform_base_=
address.h
-+++ b/platform/ext/target/arm/corstone1000/Device/Include/platform_base_=
address.h
-@@ -79,4 +79,7 @@
- #define CORSTONE1000_HOST_AXI_QSPI_CTRL_REG_BASE_SE_SECURE_FLASH (0x900=
10000U) /* AXI QSPI Controller for SE FLash  */
- #define CORSTONE1000_HOST_DRAM_UEFI_CAPSULE        (0xA0000000U) /* 1.5=
 GB DDR                        */
-=20
-+/* Map Component definitions to Corstone definitions */
-+#define CC3XX_BASE_S        CORSTONE1000_CRYPTO_ACCELERATOR_BASE
-+
- #endif  /* __PLATFORM_BASE_ADDRESS_H__ */
-diff --git a/platform/ext/target/arm/corstone1000/Device/Source/gcc/cors=
tone1000_bl1_1.ld b/platform/ext/target/arm/corstone1000/Device/Source/gc=
c/corstone1000_bl1_1.ld
-new file mode 100644
-index 000000000..d4eca2841
---- /dev/null
-+++ b/platform/ext/target/arm/corstone1000/Device/Source/gcc/corstone100=
0_bl1_1.ld
-@@ -0,0 +1,203 @@
-+;/*
-+; * Copyright (c) 2009-2022, Arm Limited. All rights reserved.
-+; *
-+; * Licensed under the Apache License, Version 2.0 (the "License");
-+; * you may not use this file except in compliance with the License.
-+; * You may obtain a copy of the License at
-+; *
-+; *     http://www.apache.org/licenses/LICENSE-2.0
-+; *
-+; * Unless required by applicable law or agreed to in writing, software
-+; * distributed under the License is distributed on an "AS IS" BASIS,
-+; * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or imp=
lied.
-+; * See the License for the specific language governing permissions and
-+; * limitations under the License.
-+; *
-+; *
-+; * This file is derivative of CMSIS V5.00 gcc_arm.ld
-+; */
-+
-+/* Linker script to configure memory regions. */
-+/* This file will be run trough the pre-processor. */
-+
-+#include "region_defs.h"
-+
-+MEMORY
-+{
-+    FLASH (rx)  : ORIGIN =3D BL1_1_CODE_START, LENGTH =3D BL1_1_CODE_SI=
ZE
-+    RAM   (rwx) : ORIGIN =3D BL1_1_DATA_START, LENGTH =3D BL1_1_DATA_SI=
ZE
-+}
-+
-+__heap_size__  =3D BL1_1_HEAP_SIZE;
-+__msp_stack_size__ =3D BL1_1_MSP_STACK_SIZE;
-+
-+/* Library configurations */
-+GROUP(libgcc.a libc.a libm.a libnosys.a)
-+
-+ENTRY(Reset_Handler)
-+
-+SECTIONS
-+{
-+    .text :
-+    {
-+        KEEP(*(.vectors))
-+        __Vectors_End =3D .;
-+        __Vectors_Size =3D __Vectors_End - __Vectors;
-+        __end__ =3D .;
-+
-+        *(.text*)
-+
-+        KEEP(*shared_lib*:*(.text*))
-+        KEEP(*bl1_tests_shared*:*(.text*))
-+        KEEP(*bl1_crypto_hw*:*(.text*))
-+        KEEP(*boot_hal_bl1*(.text*))
-+
-+        KEEP(*(.init))
-+        KEEP(*(.fini))
-+
-+
-+        /* .ctors */
-+        *crtbegin.o(.ctors)
-+        *crtbegin?.o(.ctors)
-+        *(EXCLUDE_FILE(*crtend?.o *crtend.o) .ctors)
-+        *(SORT(.ctors.*))
-+        *(.ctors)
-+
-+        /* .dtors */
-+         *crtbegin.o(.dtors)
-+         *crtbegin?.o(.dtors)
-+         *(EXCLUDE_FILE(*crtend?.o *crtend.o) .dtors)
-+         *(SORT(.dtors.*))
-+         *(.dtors)
-+
-+        *(.rodata*)
-+
-+        KEEP(*(.eh_frame*))
-+    } > FLASH
-+
-+    .ARM.extab :
-+    {
-+        *(.ARM.extab* .gnu.linkonce.armextab.*)
-+    } > FLASH
-+
-+    __exidx_start =3D .;
-+    .ARM.exidx :
-+    {
-+        *(.ARM.exidx* .gnu.linkonce.armexidx.*)
-+    } > FLASH
-+    __exidx_end =3D .;
-+
-+    /* To copy multiple ROM to RAM sections,
-+     * define etext2/data2_start/data2_end and
-+     * define __STARTUP_COPY_MULTIPLE in startup_corstone700_bl2.S */
-+    .copy.table :
-+    {
-+        . =3D ALIGN(4);
-+        __copy_table_start__ =3D .;
-+        LONG (__etext)
-+        LONG (__data_start__)
-+        LONG ((__data_end__ - __data_start__) / 4)
-+        LONG (DEFINED(__etext2) ? __etext2 : 0)
-+        LONG (DEFINED(__data2_start__) ? __data2_start__ : 0)
-+        LONG (DEFINED(__data2_start__) ? ((__data2_end__ - __data2_star=
t__) / 4) : 0)
-+        __copy_table_end__ =3D .;
-+    } > FLASH
-+
-+    /* To clear multiple BSS sections,
-+     * uncomment .zero.table section and,
-+     * define __STARTUP_CLEAR_BSS_MULTIPLE in startup_cmsdk_musca_bl2.S=
 */
-+    .zero.table :
-+    {
-+        . =3D ALIGN(4);
-+        __zero_table_start__ =3D .;
-+        LONG (__bss_start__)
-+        LONG ((__bss_end__ - __bss_start__) / 4)
-+        LONG (DEFINED(__bss2_start__) ? __bss2_start__ : 0)
-+        LONG (DEFINED(__bss2_start__) ? ((__bss2_end__ - __bss2_start__=
) / 4) : 0)
-+        __zero_table_end__ =3D .;
-+    } > FLASH
-+
-+    __etext =3D ALIGN (4);
-+
-+    .tfm_bl2_shared_data : ALIGN(32)
-+    {
-+        . +=3D BOOT_TFM_SHARED_DATA_SIZE;
-+    } > RAM
-+    Image$$SHARED_DATA$$RW$$Base =3D ADDR(.tfm_bl2_shared_data);
-+    Image$$SHARED_DATA$$RW$$Limit =3D ADDR(.tfm_bl2_shared_data) + SIZE=
OF(.tfm_bl2_shared_data);
-+
-+    . =3D BL1_1_DATA_START;
-+    Image$$BL1_1_ER_DATA_START$$Base =3D .;
-+    .data : AT (__etext)
-+    {
-+        __data_start__ =3D .;
-+        *(vtable)
-+        *(.data*)
-+
-+        . =3D ALIGN(4);
-+        /* preinit data */
-+        PROVIDE_HIDDEN (__preinit_array_start =3D .);
-+        KEEP(*(.preinit_array))
-+        PROVIDE_HIDDEN (__preinit_array_end =3D .);
-+
-+        . =3D ALIGN(4);
-+        /* init data */
-+        PROVIDE_HIDDEN (__init_array_start =3D .);
-+        KEEP(*(SORT(.init_array.*)))
-+        KEEP(*(.init_array))
-+        PROVIDE_HIDDEN (__init_array_end =3D .);
-+
-+
-+        . =3D ALIGN(4);
-+        /* finit data */
-+        PROVIDE_HIDDEN (__fini_array_start =3D .);
-+        KEEP(*(SORT(.fini_array.*)))
-+        KEEP(*(.fini_array))
-+        PROVIDE_HIDDEN (__fini_array_end =3D .);
-+
-+        KEEP(*(.jcr*))
-+        . =3D ALIGN(4);
-+        /* All data end */
-+        __data_end__ =3D .;
-+
-+    } > RAM
-+    Image$$ER_DATA$$Base =3D ADDR(.data);
-+
-+    .bss :
-+    {
-+        . =3D ALIGN(4);
-+        __bss_start__ =3D .;
-+        *(.bss*)
-+        *(COMMON)
-+        . =3D ALIGN(4);
-+        __bss_end__ =3D .;
-+    } > RAM
-+
-+    bss_size =3D __bss_end__ - __bss_start__;
-+
-+    .msp_stack (NOLOAD) : ALIGN(32)
-+    {
-+        . +=3D __msp_stack_size__;
-+    } > RAM
-+    Image$$ARM_LIB_STACK$$ZI$$Base =3D ADDR(.msp_stack);
-+    Image$$ARM_LIB_STACK$$ZI$$Limit =3D ADDR(.msp_stack) + SIZEOF(.msp_=
stack);
-+
-+    .heap (NOLOAD): ALIGN(8)
-+    {
-+        . =3D ALIGN(8);
-+        __end__ =3D .;
-+        PROVIDE(end =3D .);
-+        __HeapBase =3D .;
-+        . +=3D __heap_size__;
-+        __HeapLimit =3D .;
-+        __heap_limit =3D .; /* Add for _sbrk */
-+    } > RAM
-+    Image$$ARM_LIB_HEAP$$ZI$$Limit =3D ADDR(.heap) + SIZEOF(.heap);
-+
-+    PROVIDE(__stack =3D Image$$ARM_LIB_STACK$$ZI$$Limit);
-+
-+    Image$$BL1_1_ER_DATA_LIMIT$$Base =3D .;
-+
-+    Image$$BL1_2_ER_DATA_START$$Base =3D BL1_2_DATA_START;
-+    Image$$BL1_2_ER_DATA_LIMIT$$Base =3D BL1_2_DATA_START + BL1_2_DATA_=
SIZE;
-+}
-diff --git a/platform/ext/target/arm/corstone1000/Device/Source/gcc/cors=
tone1000_bl1.ld b/platform/ext/target/arm/corstone1000/Device/Source/gcc/=
corstone1000_bl1_2.ld
-similarity index 95%
-rename from platform/ext/target/arm/corstone1000/Device/Source/gcc/corst=
one1000_bl1.ld
-rename to platform/ext/target/arm/corstone1000/Device/Source/gcc/corston=
e1000_bl1_2.ld
-index 73be37d7c..6cd806378 100644
---- a/platform/ext/target/arm/corstone1000/Device/Source/gcc/corstone100=
0_bl1.ld
-+++ b/platform/ext/target/arm/corstone1000/Device/Source/gcc/corstone100=
0_bl1_2.ld
-@@ -24,12 +24,12 @@
-=20
- MEMORY
- {
--    FLASH (rx)  : ORIGIN =3D BL1_CODE_START, LENGTH =3D BL1_CODE_SIZE
--    RAM   (rwx) : ORIGIN =3D BL1_DATA_START, LENGTH =3D BL1_DATA_SIZE
-+    FLASH (rx)  : ORIGIN =3D BL1_2_CODE_START, LENGTH =3D BL1_2_CODE_SI=
ZE
-+    RAM   (rwx) : ORIGIN =3D BL1_2_DATA_START, LENGTH =3D BL1_2_DATA_SI=
ZE
- }
-=20
--__heap_size__  =3D BL1_HEAP_SIZE;
--__msp_stack_size__ =3D BL1_MSP_STACK_SIZE;
-+__heap_size__  =3D BL1_2_HEAP_SIZE;
-+__msp_stack_size__ =3D BL1_2_MSP_STACK_SIZE;
-=20
- /* Library configurations */
- GROUP(libgcc.a libc.a libm.a libnosys.a)
-diff --git a/platform/ext/target/arm/corstone1000/bl1/bl1_rotpk.c b/plat=
form/ext/target/arm/corstone1000/bl1/bl1_rotpk.c
-deleted file mode 100644
-index d8cfe3759..000000000
---- a/platform/ext/target/arm/corstone1000/bl1/bl1_rotpk.c
-+++ /dev/null
-@@ -1,48 +0,0 @@
--/*
-- * Copyright (c) 2019-2021, Arm Limited. All rights reserved.
-- *
-- * SPDX-License-Identifier: BSD-3-Clause
-- *
-- */
--
--#include <stdint.h>
--#include "tfm_plat_otp.h"
--
--static enum tfm_plat_err_t get_rotpk_hash(enum tfm_otp_element_id_t id,
--                                          uint8_t* rotpk_hash,
--                                          uint32_t* rotpk_hash_size)
--{
--    enum tfm_plat_err_t err;
--    size_t otp_size;
--
--    err =3D tfm_plat_otp_read(id, *rotpk_hash_size, rotpk_hash);
--    if (err !=3D TFM_PLAT_ERR_SUCCESS) {
--        return err;
--    }
--
--    err =3D tfm_plat_otp_get_size(id, &otp_size);
--    if (err !=3D TFM_PLAT_ERR_SUCCESS) {
--        return err;
--    }
--
--    *rotpk_hash_size =3D otp_size;
--
--    return TFM_PLAT_ERR_SUCCESS;
--}
--
--enum tfm_plat_err_t
--tfm_plat_get_rotpk_hash(uint8_t image_id,
--                        uint8_t *rotpk_hash,
--                        uint32_t *rotpk_hash_size)
--{
--    switch(image_id) {
--        case 0:
--            return get_rotpk_hash(PLAT_OTP_ID_BL1_ROTPK_0, rotpk_hash,
--                                  rotpk_hash_size);
--
--        default:
--            return TFM_PLAT_ERR_INVALID_INPUT;
--    }
--
--    return TFM_PLAT_ERR_SYSTEM_ERR;
--}
-diff --git a/platform/ext/target/arm/corstone1000/bl1/bl1_boot_hal.c b/p=
latform/ext/target/arm/corstone1000/bl1/boot_hal_bl1.c
-similarity index 90%
-rename from platform/ext/target/arm/corstone1000/bl1/bl1_boot_hal.c
-rename to platform/ext/target/arm/corstone1000/bl1/boot_hal_bl1.c
-index a5fe0f7da..678342443 100644
---- a/platform/ext/target/arm/corstone1000/bl1/bl1_boot_hal.c
-+++ b/platform/ext/target/arm/corstone1000/bl1/boot_hal_bl1.c
-@@ -12,13 +12,16 @@
- #include "Driver_Flash.h"
- #include "flash_layout.h"
- #include "fih.h"
--#include "bootutil/bootutil_log.h"
- #include "firewall.h"
- #include "watchdog.h"
- #include "mpu_config.h"
- #include "tfm_plat_otp.h"
- #include "tfm_plat_provisioning.h"
- #include "fwu_agent.h"
-+#include "uart_stdout.h"
-+#include "region_defs.h"
-+#include "log.h"
-+
-=20
- #if defined(CRYPTO_HW_ACCELERATOR) || \
-     defined(CRYPTO_HW_ACCELERATOR_OTP_PROVISIONING)
-@@ -81,6 +84,9 @@ enum host_firewall_host_comp_id_t {
-   COMP_DEBUG,
- };
-=20
-+extern uint32_t platform_code_is_bl1_2;
-+
-+
- static void setup_mpu(void)
- {
-     uint32_t size; /* region size */
-@@ -581,56 +587,44 @@ static void setup_host_firewall(void)
-        fw_lockdown(FW_FULL_LOCKDOWN);
- }
-=20
--
--__attribute__((naked)) void boot_clear_bl2_ram_area(void)
-+uint32_t bl1_image_get_flash_offset(uint32_t image_id)
- {
--    __ASM volatile(
--        ".syntax unified                             \n"
--        "movs    r0, #0                              \n"
--        "ldr     r1, =3DImage$$ER_DATA$$Base           \n"
--        "ldr     r2, =3DImage$$ARM_LIB_HEAP$$ZI$$Limit \n"
--        "subs    r2, r2, r1                          \n"
--        "Loop:                                       \n"
--        "subs    r2, #4                              \n"
--        "blt     Clear_done                          \n"
--        "str     r0, [r1, r2]                        \n"
--        "b       Loop                                \n"
--        "Clear_done:                                 \n"
--        "bx      lr                                  \n"
--         : : : "r0" , "r1" , "r2" , "memory"
--    );
-+    /* SE BL2 Offset is equal to bank offset as it is the first think i=
n the Bank */
-+    uint32_t se_bl2_offset =3D 0;
-+    bl1_get_active_bl2_image(&se_bl2_offset);
-+    switch (image_id) {
-+        case 0:
-+            return se_bl2_offset;
-+        case 1:
-+            return se_bl2_offset + SE_BL2_PARTITION_SIZE;
-+        default:
-+            FIH_PANIC;
-+    }
- }
-=20
--extern void set_flash_area_image_offset(uint32_t offset);
--
- int32_t boot_platform_init(void)
- {
-     int32_t result;
-     uint32_t image_offset;
-=20
--    result =3D corstone1000_watchdog_init();
--    if (result !=3D ARM_DRIVER_OK) {
--        return 1;
--    }
--
-+    if (!platform_code_is_bl1_2) {
-+        result =3D corstone1000_watchdog_init();
-+        if (result !=3D ARM_DRIVER_OK) {
-+            return 1;
-+        }
- #if !(PLATFORM_IS_FVP)
--    setup_mpu();
-+        setup_mpu();
- #endif
--    setup_se_firewall();
-+        setup_se_firewall();
- #if !(PLATFORM_IS_FVP)
--    setup_host_firewall();
-+        setup_host_firewall();
- #endif
--
--    result =3D FLASH_DEV_NAME.Initialize(NULL);
--    if (result !=3D ARM_DRIVER_OK) {
--        return 1;
-     }
--#if PLATFORM_DEFAULT_OTP
--   result =3D FLASH_DEV_NAME_SE_SECURE_FLASH.Initialize(NULL);
--   if (result !=3D ARM_DRIVER_OK) {
--       return 1;
--   }
--#endif
-+
-+#if defined(TFM_BL1_LOGGING) || defined(TEST_BL1_1) || defined(TEST_BL1=
_2)
-+    stdio_init();
-+#endif /* defined(TFM_BL1_LOGGING) || defined(TEST_BL1_1) || defined(TE=
ST_BL1_2) */
-+
-=20
- #ifdef CRYPTO_HW_ACCELERATOR
-     result =3D crypto_hw_accelerator_init();
-@@ -639,23 +633,11 @@ int32_t boot_platform_init(void)
-     }
- #endif /* CRYPTO_HW_ACCELERATOR */
-=20
--    result =3D tfm_plat_otp_init();
--    if (result !=3D TFM_PLAT_ERR_SUCCESS) {
--        BOOT_LOG_ERR("OTP system initialization failed");
--        FIH_PANIC;
--    }
--
--    if (tfm_plat_provisioning_is_required()) {
--        result =3D fwu_metadata_provision();
--        if (result !=3D FWU_AGENT_SUCCESS) {
--            BOOT_LOG_ERR("Provisioning FWU Metadata failed");
--            FIH_PANIC;
--        }
--    }
--
--    bl1_get_active_bl2_image(&image_offset);
--    set_flash_area_image_offset(image_offset);
-+    return 0;
-+}
-=20
-+int32_t boot_platform_post_init(void)
-+{
-     return 0;
- }
-=20
-@@ -678,17 +660,15 @@ void boot_platform_quit(struct boot_arm_vector_tab=
le *vt)
-     (void)fih_delay_init();
- #endif /* CRYPTO_HW_ACCELERATOR */
-=20
--    result =3D FLASH_DEV_NAME.Uninitialize();
--    if (result !=3D ARM_DRIVER_OK) {
--        while (1);
--    }
-=20
--#if PLATFORM_DEFAULT_OTP
--    result =3D FLASH_DEV_NAME_SE_SECURE_FLASH.Uninitialize();
-+#if defined(TFM_BL1_LOGGING) || defined(TEST_BL1_1) || defined(TEST_BL1=
_2)
-+    stdio_uninit();
-+#endif /* defined(TFM_BL1_LOGGING) || defined(TEST_BL1_1) || defined(TE=
ST_BL1_2) */
-+
-+    result =3D corstone1000_watchdog_reset_timer();
-     if (result !=3D ARM_DRIVER_OK) {
-         while (1);
-     }
--#endif
-=20
-     vt_cpy =3D vt;
-=20
-diff --git a/platform/ext/target/arm/corstone1000/bl1/flash_map_extended=
.c b/platform/ext/target/arm/corstone1000/bl1/flash_map_extended.c
-deleted file mode 100644
-index b6632b6c2..000000000
---- a/platform/ext/target/arm/corstone1000/bl1/flash_map_extended.c
-+++ /dev/null
-@@ -1,103 +0,0 @@
--/*
-- * Copyright (c) 2018 Nordic Semiconductor ASA
-- * Copyright (c) 2015 Runtime Inc
-- * Copyright (c) 2019-2021 Arm Limited.
-- *
-- * SPDX-License-Identifier: Apache-2.0
-- */
--
--/*
-- * Original code taken from mcuboot project at:
-- * https://github.com/mcu-tools/mcuboot
-- * Git SHA of the original version: ac55554059147fff718015be9f4bd310812=
3f50a
-- */
--
--#include <errno.h>
--#include "target.h"
--#include "cmsis.h"
--#include "Driver_Flash.h"
--#include "sysflash/sysflash.h"
--#include "flash_map/flash_map.h"
--#include "flash_map_backend/flash_map_backend.h"
--#include "bootutil/bootutil_log.h"
--
--__WEAK int flash_device_base(uint8_t fd_id, uintptr_t *ret)
--{
--    if (fd_id !=3D FLASH_DEVICE_ID) {
--        BOOT_LOG_ERR("invalid flash ID %d; expected %d",
--                     fd_id, FLASH_DEVICE_ID);
--        return -1;
--    }
--    *ret =3D FLASH_DEVICE_BASE;
--    return 0;
--}
--
--/*
-- * This depends on the mappings defined in flash_map.h.
-- * MCUBoot uses continuous numbering for the primary slot, the secondar=
y slot,
-- * and the scratch while TF-M might number it differently.
-- */
--int flash_area_id_from_multi_image_slot(int image_index, int slot)
--{
--    switch (slot) {
--    case 0: return BL1_FLASH_AREA_IMAGE_PRIMARY(image_index);
--    case 1: return BL1_FLASH_AREA_IMAGE_SECONDARY(image_index);
--    case 2: return BL1_FLASH_AREA_IMAGE_SCRATCH;
--    }
--
--    return -1; /* flash_area_open will fail on that */
--}
--
--int flash_area_id_from_image_slot(int slot)
--{
--    return flash_area_id_from_multi_image_slot(0, slot);
--}
--
--int flash_area_id_to_multi_image_slot(int image_index, int area_id)
--{
--    if (area_id =3D=3D BL1_FLASH_AREA_IMAGE_PRIMARY(image_index)) {
--        return 0;
--    }
--    if (area_id =3D=3D BL1_FLASH_AREA_IMAGE_SECONDARY(image_index)) {
--        return 1;
--    }
--
--    BOOT_LOG_ERR("invalid flash area ID");
--    return -1;
--}
--
--int flash_area_id_to_image_slot(int area_id)
--{
--    return flash_area_id_to_multi_image_slot(0, area_id);
--}
--
--uint8_t flash_area_erased_val(const struct flash_area *fap)
--{
--    return DRV_FLASH_AREA(fap)->GetInfo()->erased_value;
--}
--
--int flash_area_read_is_empty(const struct flash_area *fa, uint32_t off,
--        void *dst, uint32_t len)
--{
--    uint32_t i;
--    uint8_t *u8dst;
--    int rc;
--
--    BOOT_LOG_DBG("read_is_empty area=3D%d, off=3D%#x, len=3D%#x",
--                 fa->fa_id, off, len);
--
--    rc =3D DRV_FLASH_AREA(fa)->ReadData(fa->fa_off + off, dst, len);
--    if (rc) {
--        return -1;
--    }
--
--    u8dst =3D (uint8_t*)dst;
--
--    for (i =3D 0; i < len; i++) {
--        if (u8dst[i] !=3D flash_area_erased_val(fa)) {
--            return 0;
--        }
--    }
--
--    return 1;
--}
-diff --git a/platform/ext/target/arm/corstone1000/bl1/provisioning.c b/p=
latform/ext/target/arm/corstone1000/bl1/provisioning.c
-index 832fcea89..683bc45ea 100644
---- a/platform/ext/target/arm/corstone1000/bl1/provisioning.c
-+++ b/platform/ext/target/arm/corstone1000/bl1/provisioning.c
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2021-2022, Arm Limited. All rights reserved.
-+ * Copyright (c) 2021-2023, Arm Limited. All rights reserved.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  *
-@@ -11,7 +11,9 @@
- #include "tfm_plat_otp.h"
- #include "tfm_attest_hal.h"
- #include "psa/crypto.h"
--#include "bootutil/bootutil_log.h"
-+#include "region_defs.h"
-+#include "log.h"
-+#include "fwu_agent.h"
-=20
- #include <string.h>
-=20
-@@ -19,51 +21,20 @@
-=20
- __PACKED_STRUCT bl1_assembly_and_test_provisioning_data_t {
-     uint32_t magic;
--    uint8_t bl1_rotpk_0[32];
-+    uint8_t bl2_encryption_key[32];
-+    uint8_t guk[32];
-+    uint8_t bl1_2_image_hash[32];
-+    uint8_t bl2_image_hash[32];
-+    uint8_t bl1_2_image[BL1_2_CODE_SIZE];
-+    uint8_t bl1_rotpk_0[56];
- };
-=20
--#ifdef TFM_DUMMY_PROVISIONING
--static const struct bl1_assembly_and_test_provisioning_data_t bl1_assem=
bly_and_test_prov_data =3D {
--    ASSEMBLY_AND_TEST_PROV_DATA_MAGIC,
--#if (MCUBOOT_SIGN_RSA_LEN =3D=3D 2048)
--    /* bl1 rotpk 0 */
--    {
--        0xfc, 0x57, 0x01, 0xdc, 0x61, 0x35, 0xe1, 0x32,
--        0x38, 0x47, 0xbd, 0xc4, 0x0f, 0x04, 0xd2, 0xe5,
--        0xbe, 0xe5, 0x83, 0x3b, 0x23, 0xc2, 0x9f, 0x93,
--        0x59, 0x3d, 0x00, 0x01, 0x8c, 0xfa, 0x99, 0x94,
--    },
--#elif (MCUBOOT_SIGN_RSA_LEN =3D=3D 3072)
--    /* bl1 rotpk 0 */
--    {
--        0xbf, 0xe6, 0xd8, 0x6f, 0x88, 0x26, 0xf4, 0xff,
--        0x97, 0xfb, 0x96, 0xc4, 0xe6, 0xfb, 0xc4, 0x99,
--        0x3e, 0x46, 0x19, 0xfc, 0x56, 0x5d, 0xa2, 0x6a,
--        0xdf, 0x34, 0xc3, 0x29, 0x48, 0x9a, 0xdc, 0x38,
--    },
--#else
--#error "No public key available for given signing algorithm."
--#endif /* MCUBOOT_SIGN_RSA_LEN */
--};
--#else
--static const struct bl1_assembly_and_test_provisioning_data_t bl1_assem=
bly_and_test_prov_data;
--#endif /* TFM_DUMMY_PROVISIONING */
-+static const struct bl1_assembly_and_test_provisioning_data_t *bl1_asse=
mbly_and_test_prov_data =3D
-+                    (struct bl1_assembly_and_test_provisioning_data_t *=
)PROVISIONING_DATA_START;
-+
-=20
- void tfm_plat_provisioning_check_for_dummy_keys(void)
- {
--    uint64_t iak_start;
--
--    tfm_plat_otp_read(PLAT_OTP_ID_IAK, sizeof(iak_start), (uint8_t*)&ia=
k_start);
--
--    if(iak_start =3D=3D 0xA4906F6DB254B4A9) {
--        BOOT_LOG_WRN("%s%s%s%s",
--                     "\033[1;31m",
--                     "This device was provisioned with dummy keys. ",
--                     "This device is \033[1;1mNOT SECURE",
--                     "\033[0m");
--    }
--
--    memset(&iak_start, 0, sizeof(iak_start));
- }
-=20
- int tfm_plat_provisioning_is_required(void)
-@@ -85,12 +56,47 @@ enum tfm_plat_err_t provision_assembly_and_test(void=
)
-     enum tfm_plat_err_t err;
-=20
-     err =3D tfm_plat_otp_write(PLAT_OTP_ID_BL1_ROTPK_0,
--                             sizeof(bl1_assembly_and_test_prov_data.bl1=
_rotpk_0),
--                             bl1_assembly_and_test_prov_data.bl1_rotpk_=
0);
-+                             sizeof(bl1_assembly_and_test_prov_data->bl=
1_rotpk_0),
-+                             bl1_assembly_and_test_prov_data->bl1_rotpk=
_0);
-+    if (err !=3D TFM_PLAT_ERR_SUCCESS && err !=3D TFM_PLAT_ERR_UNSUPPOR=
TED) {
-+        return err;
-+    }
-+
-+
-+    err =3D tfm_plat_otp_write(PLAT_OTP_ID_BL1_2_IMAGE_HASH,
-+                             sizeof(bl1_assembly_and_test_prov_data->bl=
1_2_image_hash),
-+                             bl1_assembly_and_test_prov_data->bl1_2_ima=
ge_hash);
-+    if (err !=3D TFM_PLAT_ERR_SUCCESS && err !=3D TFM_PLAT_ERR_UNSUPPOR=
TED) {
-+        return err;
-+    }
-+
-+
-+    err =3D tfm_plat_otp_write(PLAT_OTP_ID_BL1_2_IMAGE,
-+                             sizeof(bl1_assembly_and_test_prov_data->bl=
1_2_image),
-+                             bl1_assembly_and_test_prov_data->bl1_2_ima=
ge);
-+    if (err !=3D TFM_PLAT_ERR_SUCCESS && err !=3D TFM_PLAT_ERR_UNSUPPOR=
TED) {
-+        return err;
-+    }
-+
-+    err =3D tfm_plat_otp_write(PLAT_OTP_ID_KEY_BL2_ENCRYPTION,
-+                             sizeof(bl1_assembly_and_test_prov_data->bl=
2_encryption_key),
-+                             bl1_assembly_and_test_prov_data->bl2_encry=
ption_key);
-     if (err !=3D TFM_PLAT_ERR_SUCCESS && err !=3D TFM_PLAT_ERR_UNSUPPOR=
TED) {
-         return err;
-     }
-=20
-+    err =3D tfm_plat_otp_write(PLAT_OTP_ID_BL2_IMAGE_HASH,
-+                             sizeof(bl1_assembly_and_test_prov_data->bl=
2_image_hash),
-+                             bl1_assembly_and_test_prov_data->bl2_image=
_hash);
-+    if (err !=3D TFM_PLAT_ERR_SUCCESS && err !=3D TFM_PLAT_ERR_UNSUPPOR=
TED) {
-+        return err;
-+    }
-+
-+    err =3D fwu_metadata_provision();
-+    if (err !=3D FWU_AGENT_SUCCESS) {
-+        return 1;
-+    }
-+
-     return err;
- }
-=20
-@@ -104,19 +110,18 @@ enum tfm_plat_err_t tfm_plat_provisioning_perform(=
void)
-         return err;
-     }
-=20
--    BOOT_LOG_INF("Beginning BL1 provisioning");
-+    BL1_LOG("[INF] Beginning BL1 provisioning\r\n");
-=20
- #ifdef TFM_DUMMY_PROVISIONING
--    BOOT_LOG_WRN("%s%s%s%s",
--                 "\033[1;31m",
--                 "TFM_DUMMY_PROVISIONING is not suitable for production=
! ",
--                 "This device is \033[1;1mNOT SECURE",
--                 "\033[0m");
-+    BL1_LOG("\033[1;31m[WRN]");
-+    BL1_LOG("TFM_DUMMY_PROVISIONING is not suitable for production! ");
-+    BL1_LOG("This device is \033[1;1mNOT SECURE");
-+    BL1_LOG("\033[0m\r\n");
- #endif /* TFM_DUMMY_PROVISIONING */
-=20
-     if (lcs =3D=3D PLAT_OTP_LCS_ASSEMBLY_AND_TEST) {
--        if (bl1_assembly_and_test_prov_data.magic !=3D ASSEMBLY_AND_TES=
T_PROV_DATA_MAGIC) {
--            BOOT_LOG_ERR("No valid ASSEMBLY_AND_TEST provisioning data =
found");
-+        if (bl1_assembly_and_test_prov_data->magic !=3D ASSEMBLY_AND_TE=
ST_PROV_DATA_MAGIC) {
-+            BL1_LOG("[ERR] No valid ASSEMBLY_AND_TEST provisioning data=
 found\r\n");
-             return TFM_PLAT_ERR_INVALID_INPUT;
-         }
-=20
-diff --git a/platform/ext/target/arm/corstone1000/config.cmake b/platfor=
m/ext/target/arm/corstone1000/config.cmake
-index aca75394d..1b0675404 100644
---- a/platform/ext/target/arm/corstone1000/config.cmake
-+++ b/platform/ext/target/arm/corstone1000/config.cmake
-@@ -8,7 +8,14 @@
- #----------------------------------------------------------------------=
---------
-=20
- set(BL1                                 ON         CACHE BOOL     "Whet=
her to build BL1")
--set(PLATFORM_DEFAULT_BL1                OFF        CACHE STRING   "Whet=
her to use default BL1 or platform-specific one")
-+set(PLATFORM_DEFAULT_BL1                ON         CACHE STRING   "Whet=
her to use default BL1 or platform-specific one")
-+set(PLATFORM_DEFAULT_OTP                OFF        CACHE BOOL     "Use =
trusted on-chip flash to implement OTP memory")
-+
-+set(TFM_BL1_DEFAULT_PROVISIONING        OFF        CACHE BOOL     "Whet=
her BL1_1 will use default provisioning")
-+set(TFM_BL1_SOFTWARE_CRYPTO             OFF        CACHE BOOL     "Whet=
her BL1_1 will use software crypto")
-+set(TFM_BL1_MEMORY_MAPPED_FLASH         OFF        CACHE BOOL     "Whet=
her BL1 can directly access flash content")
-+set(TFM_BL1_PQ_CRYPTO                   OFF        CACHE BOOL     "Enab=
le LMS PQ crypto for BL2 verification. This is experimental and should no=
t yet be used in production")
-+
- set(BL2                                 ON         CACHE BOOL     "Whet=
her to build BL2")
- set(BL2_TRAILER_SIZE                    0x800      CACHE STRING   "Trai=
ler size")
- set(DEFAULT_MCUBOOT_FLASH_MAP           OFF        CACHE BOOL     "Whet=
her to use the default flash map defined by TF-M project")
-@@ -26,13 +33,6 @@ set(TFM_CRYPTO_TEST_ALG_CFB             OFF        CA=
CHE BOOL     "Test CFB cryp
- set(NS                                  FALSE      CACHE BOOL     "Whet=
her to build NS app")
- set(EXTERNAL_SYSTEM_SUPPORT             OFF        CACHE BOOL     "Whet=
her to include external system support.")
-=20
--# FVP is not integrated/tested with CC312.
--if (${PLATFORM_IS_FVP})
--  set(PLATFORM_DEFAULT_OTP              TRUE      CACHE BOOL      "Use =
trusted on-chip flash to implement OTP memory")
--else()
--  set(PLATFORM_DEFAULT_OTP              FALSE      CACHE BOOL      "Use=
 trusted on-chip flash to implement OTP memory")
--endif()
--
- # External dependency on OpenAMP and Libmetal
- set(LIBMETAL_SRC_PATH                   "DOWNLOAD"  CACHE PATH      "Pa=
th to Libmetal (or DOWNLOAD to fetch automatically")
- set(LIBMETAL_VERSION                    "f252f0e007fbfb8b3a52b1d5901250=
ddac96baad"  CACHE STRING    "The version of libmetal to use")
-@@ -59,6 +59,8 @@ set(TFM_PARTITION_PROTECTED_STORAGE     ON          CA=
CHE BOOL      "Enable Prot
- set(TFM_PARTITION_CRYPTO                ON          CACHE BOOL      "En=
able Crypto partition")
- set(TFM_PARTITION_INITIAL_ATTESTATION   ON          CACHE BOOL      "En=
able Initial Attestation partition")
- set(TFM_PARTITION_INTERNAL_TRUSTED_STORAGE ON       CACHE BOOL      "En=
able Internal Trusted Storage partition")
-+set(TFM_PARTITION_MEASURED_BOOT         ON          CACHE BOOL      "En=
able Measured boot partition")
-+
-=20
- if (${CMAKE_BUILD_TYPE} STREQUAL Debug OR ${CMAKE_BUILD_TYPE} STREQUAL =
RelWithDebInfo)
-   set(ENABLE_FWU_AGENT_DEBUG_LOGS     TRUE          CACHE BOOL      "En=
able Firmware update agent debug logs.")
-diff --git a/platform/ext/target/arm/corstone1000/partition/flash_layout=
.h b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
-index b01a3621b..a95ff63ef 100644
---- a/platform/ext/target/arm/corstone1000/partition/flash_layout.h
-+++ b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
-@@ -34,16 +34,6 @@
-=20
- #define BL2_DATA_GAP_SIZE               (0x09800)  /* 38 KB */
-=20
--#define BL1_DATA_START                  (SRAM_BASE)
--#define BL1_DATA_SIZE                   (0x10000)     /* 64 KiB*/
--#define BL1_DATA_LIMIT                  (BL1_DATA_START + BL1_DATA_SIZE=
 - 1)
--
--#ifdef BL1
--
--#define IMAGE_EXECUTABLE_RAM_START      (SRAM_BASE + BL1_DATA_SIZE)
--#define IMAGE_EXECUTABLE_RAM_SIZE       (SRAM_SIZE - BL1_DATA_SIZE)
--
--#endif /* BL1 */
-=20
- /*****************/
- /***** Flash *****/
-diff --git a/platform/ext/target/arm/corstone1000/partition/region_defs.=
h b/platform/ext/target/arm/corstone1000/partition/region_defs.h
-index 35055fe9c..8157c36bf 100644
---- a/platform/ext/target/arm/corstone1000/partition/region_defs.h
-+++ b/platform/ext/target/arm/corstone1000/partition/region_defs.h
-@@ -20,12 +20,17 @@
-=20
- #include "flash_layout.h"
-=20
-+/* BL1_1 */
-+#define BL1_1_HEAP_SIZE         (0x0001000) /* 4KiB */
-+#define BL1_1_MSP_STACK_SIZE    (0x0001800) /* 6KiB */
-+
-+/* BL1_2 */
-+#define BL1_2_HEAP_SIZE         (0x0001000) /* 4KiB */
-+#define BL1_2_MSP_STACK_SIZE    (0x0001800) /* 6KiB */
-+
- #define BL2_HEAP_SIZE           (0x0001000)
- #define BL2_MSP_STACK_SIZE      (0x0001E00)
-=20
--#define BL1_HEAP_SIZE           (0x0001000)
--#define BL1_MSP_STACK_SIZE      (0x0001800)
--
- #ifdef ENABLE_HEAP
-     #define S_HEAP_SIZE             (0x0000200)
- #endif
-@@ -80,8 +85,8 @@
-=20
-=20
- /* SE BL2 regions */
--#define BL2_CODE_START    (SRAM_BASE + TFM_PARTITION_SIZE + \
--                           BL2_DATA_GAP_SIZE + BL2_HEADER_SIZE)
-+#define BL2_IMAGE_START   (SRAM_BASE + SRAM_SIZE - SE_BL2_PARTITION_SIZ=
E)
-+#define BL2_CODE_START    (BL2_IMAGE_START + BL2_HEADER_SIZE)
- #define BL2_CODE_SIZE     (IMAGE_BL2_CODE_SIZE)
- #define BL2_CODE_LIMIT    (BL2_CODE_START + BL2_CODE_SIZE - 1)
-=20
-@@ -91,9 +96,25 @@
- #define BL2_DATA_LIMIT    (BL2_DATA_START + BL2_DATA_SIZE - 1)
-=20
- /* SE BL1 regions */
--#define BL1_CODE_START    (0)
--#define BL1_CODE_SIZE     (0x00020000)     /* Whole SE ROM, 128 KiB */
--#define BL1_CODE_LIMIT    (BL2_CODE_START + BL2_CODE_SIZE - 1)
-+#define BL1_1_CODE_START    (0)
-+#define BL1_1_CODE_SIZE     (0x0000A000)     /* 40 KiB */
-+#define BL1_1_CODE_LIMIT    (BL1_1_CODE_START + BL1_1_CODE_SIZE - 1)
-+
-+#define PROVISIONING_DATA_START (BL1_1_CODE_START + BL1_1_CODE_SIZE)
-+#define PROVISIONING_DATA_SIZE  (0x00002000)     /* 8 KiB */
-+#define PROVISIONING_DATA_LIMIT (PROVISIONING_DATA_START + PROVISIONING=
_DATA_SIZE - 1)
-+
-+#define BL1_1_DATA_START    (SRAM_BASE)
-+#define BL1_1_DATA_SIZE     (0x8000)     /* 32 KiB*/
-+#define BL1_1_DATA_LIMIT    (BL1_1_DATA_START + BL1_1_DATA_SIZE - 1)
-+
-+#define BL1_2_CODE_START    (BL1_1_DATA_START + BL1_1_DATA_SIZE)
-+#define BL1_2_CODE_SIZE     (0x00001000)     /* 4 KiB */
-+#define BL1_2_CODE_LIMIT    (BL1_2_CODE_START + BL1_2_CODE_SIZE - 1)
-+
-+#define BL1_2_DATA_START    (BL1_2_CODE_START+BL1_2_CODE_SIZE)
-+#define BL1_2_DATA_SIZE     (0x8000)     /* 32 KiB*/
-+#define BL1_2_DATA_LIMIT    (BL1_2_DATA_START + BL1_2_DATA_SIZE - 1)
-=20
- #define BOOT_TFM_SHARED_DATA_BASE (S_DATA_PRIV_START)
-=20
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/rwx.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone=
1000/0004-arm-trusted-firmware-m-disable-fatal-warnings.patch
similarity index 87%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/rwx.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0004-arm-trusted-firmware-m-disable-fatal-warnings.patch
index 1efd6618..07db4f6d 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/rwx.=
patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0004=
-arm-trusted-firmware-m-disable-fatal-warnings.patch
@@ -1,4 +1,4 @@
-From 1d548c77d07fc9a83e3e9aa28a23aa19a0177e3b Mon Sep 17 00:00:00 2001
+From 04ce07d289e8cec75223349e9ebf7e69126fc04d Mon Sep 17 00:00:00 2001
 From: Jon Mason <jon.mason@arm.com>
 Date: Wed, 18 Jan 2023 15:13:37 -0500
 Subject: [PATCH] arm/trusted-firmware-m: disable fatal warnings
@@ -11,7 +11,7 @@ Upstream-Status: Inappropriate
  1 file changed, 1 deletion(-)
=20
 diff --git a/toolchain_GNUARM.cmake b/toolchain_GNUARM.cmake
-index 7978eaca68..88395f922a 100644
+index 7989718515..a5939323d6 100644
 --- a/toolchain_GNUARM.cmake
 +++ b/toolchain_GNUARM.cmake
 @@ -71,7 +71,6 @@ macro(tfm_toolchain_reset_linker_flags)
@@ -22,4 +22,3 @@ index 7978eaca68..88395f922a 100644
          LINKER:--gc-sections
          LINKER:--no-wchar-size-warning
          ${MEMORY_USAGE_FLAG}
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0005-Platform-corstone1000-Replace-MCUBOOT-BL1-by-TFM-s-B.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0005-Platform-=
corstone1000-Replace-MCUBOOT-BL1-by-TFM-s-B.patch
deleted file mode 100644
index 697061e2..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0005=
-Platform-corstone1000-Replace-MCUBOOT-BL1-by-TFM-s-B.patch
+++ /dev/null
@@ -1,202 +0,0 @@
-From d5a7cde4648d2247f83a0f259aa088152199dfbd Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Mon, 27 Feb 2023 20:58:30 +0000
-Subject: [PATCH 2/6] Platform: corstone1000: Replace MCUBOOT BL1 by TFM'=
s
- (BL2)
-
-From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-
-Set region_defs of BL2 correctly
-Set FLASH Areas 0 and 1 to have BL2
-Set FLASH Areas 2 and 3 to have TFM
-Set FLASH Areas 4 and 5 to have FIP
-Initialize FLASH in BL1_2 boot platform code
-
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/20554]
-Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-Change-Id: I987d29cb6318b8b30cafab67d24f446aaadfe500
----
- .../arm/corstone1000/bl1/boot_hal_bl1.c       | 14 +++++++
- .../target/arm/corstone1000/bl2_flash_map.c   |  8 ++--
- .../ext/target/arm/corstone1000/config.cmake  |  3 ++
- .../arm/corstone1000/partition/flash_layout.h | 41 +++++++++++++------
- .../arm/corstone1000/partition/region_defs.h  |  4 +-
- 5 files changed, 51 insertions(+), 19 deletions(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/bl1/boot_hal_bl1.c b/p=
latform/ext/target/arm/corstone1000/bl1/boot_hal_bl1.c
-index 678342443..2124720b2 100644
---- a/platform/ext/target/arm/corstone1000/bl1/boot_hal_bl1.c
-+++ b/platform/ext/target/arm/corstone1000/bl1/boot_hal_bl1.c
-@@ -638,6 +638,13 @@ int32_t boot_platform_init(void)
-=20
- int32_t boot_platform_post_init(void)
- {
-+    int32_t result;
-+    if (platform_code_is_bl1_2) {
-+        result =3D FLASH_DEV_NAME.Initialize(NULL);
-+        if (result !=3D ARM_DRIVER_OK) {
-+            return 1;
-+        }
-+    }
-     return 0;
- }
-=20
-@@ -665,6 +672,13 @@ void boot_platform_quit(struct boot_arm_vector_tabl=
e *vt)
-     stdio_uninit();
- #endif /* defined(TFM_BL1_LOGGING) || defined(TEST_BL1_1) || defined(TE=
ST_BL1_2) */
-=20
-+    if (platform_code_is_bl1_2) {
-+        result =3D FLASH_DEV_NAME.Uninitialize();
-+        if (result !=3D ARM_DRIVER_OK) {
-+            return 1;
-+        }
-+    }
-+
-     result =3D corstone1000_watchdog_reset_timer();
-     if (result !=3D ARM_DRIVER_OK) {
-         while (1);
-diff --git a/platform/ext/target/arm/corstone1000/bl2_flash_map.c b/plat=
form/ext/target/arm/corstone1000/bl2_flash_map.c
-index 599f80b41..2b1cdfa19 100644
---- a/platform/ext/target/arm/corstone1000/bl2_flash_map.c
-+++ b/platform/ext/target/arm/corstone1000/bl2_flash_map.c
-@@ -25,14 +25,14 @@ extern ARM_DRIVER_FLASH FLASH_DEV_NAME;
-  */
- struct flash_area flash_map[] =3D {
-     {
--        .fa_id =3D FLASH_AREA_0_ID,
-+        .fa_id =3D FLASH_AREA_2_ID,
-         .fa_device_id =3D FLASH_DEVICE_ID,
-         .fa_driver =3D &FLASH_DEV_NAME,
-         .fa_off =3D FLASH_INVALID_OFFSET,
-         .fa_size =3D FLASH_INVALID_SIZE,
-     },
-     {
--        .fa_id =3D FLASH_AREA_1_ID,
-+        .fa_id =3D FLASH_AREA_3_ID,
-         .fa_device_id =3D FLASH_DEVICE_ID,
-         .fa_driver =3D &FLASH_DEV_NAME,
-         .fa_off =3D FLASH_INVALID_OFFSET,
-@@ -40,14 +40,14 @@ struct flash_area flash_map[] =3D {
-     },
- #ifndef TFM_S_REG_TEST
-     {
--        .fa_id =3D FLASH_AREA_2_ID,
-+        .fa_id =3D FLASH_AREA_4_ID,
-         .fa_device_id =3D FLASH_DEVICE_ID,
-         .fa_driver =3D &FLASH_DEV_NAME,
-         .fa_off =3D FLASH_INVALID_OFFSET,
-         .fa_size =3D FLASH_INVALID_SIZE,
-     },
-     {
--        .fa_id =3D FLASH_AREA_3_ID,
-+        .fa_id =3D FLASH_AREA_5_ID,
-         .fa_device_id =3D FLASH_DEVICE_ID,
-         .fa_driver =3D &FLASH_DEV_NAME,
-         .fa_off =3D FLASH_INVALID_OFFSET,
-diff --git a/platform/ext/target/arm/corstone1000/config.cmake b/platfor=
m/ext/target/arm/corstone1000/config.cmake
-index 1b0675404..bec6b84f0 100644
---- a/platform/ext/target/arm/corstone1000/config.cmake
-+++ b/platform/ext/target/arm/corstone1000/config.cmake
-@@ -16,6 +16,9 @@ set(TFM_BL1_SOFTWARE_CRYPTO             OFF        CAC=
HE BOOL     "Whether BL1_1
- set(TFM_BL1_MEMORY_MAPPED_FLASH         OFF        CACHE BOOL     "Whet=
her BL1 can directly access flash content")
- set(TFM_BL1_PQ_CRYPTO                   OFF        CACHE BOOL     "Enab=
le LMS PQ crypto for BL2 verification. This is experimental and should no=
t yet be used in production")
-=20
-+set(TFM_BL2_IMAGE_FLASH_AREA_NUM        0          CACHE STRING   "Whic=
h flash area BL2 is stored in")
-+set(MCUBOOT_S_IMAGE_FLASH_AREA_NUM      2          CACHE STRING   "ID o=
f the flash area containing the primary Secure image")
-+
- set(BL2                                 ON         CACHE BOOL     "Whet=
her to build BL2")
- set(BL2_TRAILER_SIZE                    0x800      CACHE STRING   "Trai=
ler size")
- set(DEFAULT_MCUBOOT_FLASH_MAP           OFF        CACHE BOOL     "Whet=
her to use the default flash map defined by TF-M project")
-diff --git a/platform/ext/target/arm/corstone1000/partition/flash_layout=
.h b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
-index a95ff63ef..41b4c6323 100644
---- a/platform/ext/target/arm/corstone1000/partition/flash_layout.h
-+++ b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
-@@ -136,23 +136,38 @@
- #define BANK_PARTITION_SIZE             (0xFE0000)   /* 15.875 MB */
- #define TFM_PARTITION_SIZE              (0x5E000)    /* 376 KB */
-=20
--/* Macros needed to imgtool.py, used when creating BL2 signed image */
--#define BL2_IMAGE_LOAD_ADDRESS          (SRAM_BASE + TFM_PARTITION_SIZE=
 + BL2_DATA_GAP_SIZE)
--#define BL2_IMAGE_OFFSET                (0x0)
--#define BL2_IMAGE_MAX_SIZE              (SE_BL2_PARTITION_SIZE)
-+/************************************************************/
-+/* Bank : Images flash offsets are with respect to the bank */
-+/************************************************************/
-=20
--/* Image 1: TF-M primary and secondary images */
-+/* Image 0: BL2 primary and secondary images */
- #define FLASH_AREA_0_ID                 (1)
--#define FLASH_AREA_0_SIZE               (TFM_PARTITION_SIZE)
-+#define FLASH_AREA_0_OFFSET             (0) /* starting from 0th offset=
 of the bank */
-+#define FLASH_AREA_0_SIZE               (SE_BL2_PARTITION_SIZE)
-+
- #define FLASH_AREA_1_ID                 (FLASH_AREA_0_ID + 1)
--#define FLASH_AREA_1_SIZE               (TFM_PARTITION_SIZE)
-+#define FLASH_AREA_1_OFFSET             (FLASH_AREA_0_OFFSET + FLASH_AR=
EA_0_SIZE)
-+#define FLASH_AREA_1_SIZE               (SE_BL2_PARTITION_SIZE)
-+
-+/* Image 1: TF-M primary and secondary images */
-+#define FLASH_AREA_2_ID                 (1)
-+#define FLASH_AREA_2_SIZE               (TFM_PARTITION_SIZE)
-+#define FLASH_AREA_3_ID                 (FLASH_AREA_2_ID + 1)
-+#define FLASH_AREA_3_SIZE               (TFM_PARTITION_SIZE)
-=20
- /* Image 2: Host FIP */
- #define FIP_SIGNATURE_AREA_SIZE         (0x1000)      /* 4 KB */
-=20
- /* Host BL2 (TF-A) primary and secondary image. */
--#define FLASH_AREA_2_ID                 (FLASH_AREA_1_ID + 1)
--#define FLASH_AREA_3_ID                 (FLASH_AREA_2_ID + 1)
-+#define FLASH_AREA_4_ID                 (FLASH_AREA_3_ID + 1)
-+#define FLASH_AREA_5_ID                 (FLASH_AREA_4_ID + 1)
-+
-+#define BL1_FLASH_AREA_IMAGE_PRIMARY(x)     (((x) =3D=3D 0) ? FLASH_ARE=
A_0_ID : \
-+                                                          255 )
-+#define BL1_FLASH_AREA_IMAGE_SECONDARY(x)   (((x) =3D=3D 0) ? FLASH_ARE=
A_1_ID : \
-+                                                          255 )
-+
-+#define BL1_FLASH_AREA_IMAGE_SCRATCH        255
-=20
- /* Macros needed to imgtool.py, used when creating TF-M signed image */
- #define S_IMAGE_LOAD_ADDRESS            (SRAM_BASE)
-@@ -161,11 +176,11 @@
- #define NON_SECURE_IMAGE_OFFSET         (TFM_PARTITION_SIZE)
- #define NON_SECURE_IMAGE_MAX_SIZE       (0x0)
-=20
--#define FLASH_AREA_IMAGE_PRIMARY(x)     (((x) =3D=3D 0) ? FLASH_AREA_0_=
ID : \
--                                         ((x) =3D=3D 1) ? FLASH_AREA_2_=
ID : \
-+#define FLASH_AREA_IMAGE_PRIMARY(x)     (((x) =3D=3D 0) ? FLASH_AREA_2_=
ID : \
-+                                         ((x) =3D=3D 1) ? FLASH_AREA_4_=
ID : \
-                                                       255 )
--#define FLASH_AREA_IMAGE_SECONDARY(x)   (((x) =3D=3D 0) ? FLASH_AREA_1_=
ID : \
--                                         ((x) =3D=3D 1) ? FLASH_AREA_3_=
ID : \
-+#define FLASH_AREA_IMAGE_SECONDARY(x)   (((x) =3D=3D 0) ? FLASH_AREA_3_=
ID : \
-+                                         ((x) =3D=3D 1) ? FLASH_AREA_5_=
ID : \
-                                                       255 )
-=20
- #define FLASH_AREA_IMAGE_SCRATCH        255
-diff --git a/platform/ext/target/arm/corstone1000/partition/region_defs.=
h b/platform/ext/target/arm/corstone1000/partition/region_defs.h
-index 8157c36bf..fc9f734f6 100644
---- a/platform/ext/target/arm/corstone1000/partition/region_defs.h
-+++ b/platform/ext/target/arm/corstone1000/partition/region_defs.h
-@@ -48,7 +48,7 @@
-             (TFM_PARTITION_SIZE - BL2_HEADER_SIZE - BL2_TRAILER_SIZE)
-=20
- #define IMAGE_BL2_CODE_SIZE \
--            (SE_BL2_PARTITION_SIZE - BL2_HEADER_SIZE - BL2_TRAILER_SIZE=
)
-+            (SE_BL2_PARTITION_SIZE - BL1_HEADER_SIZE - BL1_TRAILER_SIZE=
)
-=20
- /* Secure regions */
- #define S_CODE_START            (SRAM_BASE + BL2_HEADER_SIZE)
-@@ -86,7 +86,7 @@
-=20
- /* SE BL2 regions */
- #define BL2_IMAGE_START   (SRAM_BASE + SRAM_SIZE - SE_BL2_PARTITION_SIZ=
E)
--#define BL2_CODE_START    (BL2_IMAGE_START + BL2_HEADER_SIZE)
-+#define BL2_CODE_START    (BL2_IMAGE_START + BL1_HEADER_SIZE)
- #define BL2_CODE_SIZE     (IMAGE_BL2_CODE_SIZE)
- #define BL2_CODE_LIMIT    (BL2_CODE_START + BL2_CODE_SIZE - 1)
-=20
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0006-Platform-corstone1000-Reorganize-bl2-files.patch b/meta-arm-bsp/r=
ecipes-bsp/trusted-firmware-m/files/corstone1000/0006-Platform-corstone10=
00-Reorganize-bl2-files.patch
deleted file mode 100644
index 1e56e363..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006=
-Platform-corstone1000-Reorganize-bl2-files.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 535d366137d2dd0804d3e67ada78151e0e318eeb Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Fri, 3 Mar 2023 12:25:04 +0000
-Subject: [PATCH 3/6] Platform: corstone1000: Reorganize bl2 files
-
-From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-
-To be consistnant, organize bl2 files same as bl1 files
-
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/20555]
-Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-Change-Id: I3332f4dbbde1c5f2cde5a187b038dc3430b9503f
----
- platform/ext/target/arm/corstone1000/CMakeLists.txt         | 6 +++---
- .../ext/target/arm/corstone1000/{ =3D> bl2}/boot_hal_bl2.c    | 0
- .../corstone1000/{bl2_flash_map.c =3D> bl2/flash_map_bl2.c}   | 0
- .../{bl2_security_cnt.c =3D> bl2/security_cnt_bl2.c}          | 0
- 4 files changed, 3 insertions(+), 3 deletions(-)
- rename platform/ext/target/arm/corstone1000/{ =3D> bl2}/boot_hal_bl2.c =
(100%)
- rename platform/ext/target/arm/corstone1000/{bl2_flash_map.c =3D> bl2/f=
lash_map_bl2.c} (100%)
- rename platform/ext/target/arm/corstone1000/{bl2_security_cnt.c =3D> bl=
2/security_cnt_bl2.c} (100%)
-
-diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platf=
orm/ext/target/arm/corstone1000/CMakeLists.txt
-index a4fe28c08..3d4c787a6 100644
---- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
-+++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
-@@ -196,7 +196,7 @@ target_sources(platform_bl2
-         Native_Driver/arm_watchdog_drv.c
-         fip_parser/fip_parser.c
-         fw_update_agent/fwu_agent.c
--        bl2_security_cnt.c
-+        bl2/security_cnt_bl2.c
-         $<$<NOT:$<BOOL:${PLATFORM_DEFAULT_OTP}>>:${PLATFORM_DIR}/ext/ac=
celerator/cc312/otp_cc312.c>
-         io/io_block.c
-         io/io_flash.c
-@@ -235,8 +235,8 @@ target_compile_definitions(platform_bl2
- # platform_init/quit* apis symbol collision in bl1.
- target_sources(bl2
-     PRIVATE
--        bl2_flash_map.c
--        boot_hal_bl2.c
-+        bl2/flash_map_bl2.c
-+        bl2/boot_hal_bl2.c
- )
-=20
- target_link_libraries(bl2
-diff --git a/platform/ext/target/arm/corstone1000/boot_hal_bl2.c b/platf=
orm/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c
-similarity index 100%
-rename from platform/ext/target/arm/corstone1000/boot_hal_bl2.c
-rename to platform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c
-diff --git a/platform/ext/target/arm/corstone1000/bl2_flash_map.c b/plat=
form/ext/target/arm/corstone1000/bl2/flash_map_bl2.c
-similarity index 100%
-rename from platform/ext/target/arm/corstone1000/bl2_flash_map.c
-rename to platform/ext/target/arm/corstone1000/bl2/flash_map_bl2.c
-diff --git a/platform/ext/target/arm/corstone1000/bl2_security_cnt.c b/p=
latform/ext/target/arm/corstone1000/bl2/security_cnt_bl2.c
-similarity index 100%
-rename from platform/ext/target/arm/corstone1000/bl2_security_cnt.c
-rename to platform/ext/target/arm/corstone1000/bl2/security_cnt_bl2.c
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0007-Platform-corstone1000-Fix-linker-script-comment.patch b/meta-arm-=
bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0007-Platform-corst=
one1000-Fix-linker-script-comment.patch
deleted file mode 100644
index 62a9d853..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0007=
-Platform-corstone1000-Fix-linker-script-comment.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 25b131f0d082b32b262c4e788f3bc95b7761bef7 Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Mon, 13 Mar 2023 00:16:49 +0000
-Subject: [PATCH 4/6] Platform: corstone1000: Fix linker script comment
-
-From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-
-Comment explaining the necessary defines to copy multiple ROM to RAM
-sections, was refering to the wrong file.
-
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/20556]
-Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-Change-Id: I3e5f806330481daa24c5456d9c956e0cf589afee
----
- .../arm/corstone1000/Device/Source/gcc/corstone1000_bl1_1.ld    | 2 +-
- .../arm/corstone1000/Device/Source/gcc/corstone1000_bl1_2.ld    | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/Device/Source/gcc/cors=
tone1000_bl1_1.ld b/platform/ext/target/arm/corstone1000/Device/Source/gc=
c/corstone1000_bl1_1.ld
-index d4eca2841..8ee334c6b 100644
---- a/platform/ext/target/arm/corstone1000/Device/Source/gcc/corstone100=
0_bl1_1.ld
-+++ b/platform/ext/target/arm/corstone1000/Device/Source/gcc/corstone100=
0_bl1_1.ld
-@@ -89,7 +89,7 @@ SECTIONS
-=20
-     /* To copy multiple ROM to RAM sections,
-      * define etext2/data2_start/data2_end and
--     * define __STARTUP_COPY_MULTIPLE in startup_corstone700_bl2.S */
-+     * define __STARTUP_COPY_MULTIPLE in startup_corstone1000.c */
-     .copy.table :
-     {
-         . =3D ALIGN(4);
-diff --git a/platform/ext/target/arm/corstone1000/Device/Source/gcc/cors=
tone1000_bl1_2.ld b/platform/ext/target/arm/corstone1000/Device/Source/gc=
c/corstone1000_bl1_2.ld
-index 6cd806378..e1e4f2966 100644
---- a/platform/ext/target/arm/corstone1000/Device/Source/gcc/corstone100=
0_bl1_2.ld
-+++ b/platform/ext/target/arm/corstone1000/Device/Source/gcc/corstone100=
0_bl1_2.ld
-@@ -84,7 +84,7 @@ SECTIONS
-=20
-     /* To copy multiple ROM to RAM sections,
-      * define etext2/data2_start/data2_end and
--     * define __STARTUP_COPY_MULTIPLE in startup_corstone700_bl2.S */
-+     * define __STARTUP_COPY_MULTIPLE in startup_corstone1000.c */
-     .copy.table :
-     {
-         . =3D ALIGN(4);
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0008-Platform-corstone1000-Fix-linkerscripts-copyright-ye.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0008-Platform-=
corstone1000-Fix-linkerscripts-copyright-ye.patch
deleted file mode 100644
index 7f7f6ed0..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0008=
-Platform-corstone1000-Fix-linkerscripts-copyright-ye.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 7db7b197ec3f01163422450947540060d3cb0c17 Mon Sep 17 00:00:00 2001
-From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-Date: Mon, 13 Mar 2023 00:21:44 +0000
-Subject: [PATCH 6/6] Platform: corstone1000: Fix linkerscripts copyright=
 year
-
-set the copyright year to 2023 as these files are introduced in
-2023.
-
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/20557]
-Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-Change-Id: I293a4a380d5d1d59aba1e2ab17e0e5924664dbb4
----
- .../arm/corstone1000/Device/Source/gcc/corstone1000_bl1_1.ld    | 2 +-
- .../arm/corstone1000/Device/Source/gcc/corstone1000_bl1_2.ld    | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/Device/Source/gcc/cors=
tone1000_bl1_1.ld b/platform/ext/target/arm/corstone1000/Device/Source/gc=
c/corstone1000_bl1_1.ld
-index 8ee334c6b..cb6797f27 100644
---- a/platform/ext/target/arm/corstone1000/Device/Source/gcc/corstone100=
0_bl1_1.ld
-+++ b/platform/ext/target/arm/corstone1000/Device/Source/gcc/corstone100=
0_bl1_1.ld
-@@ -1,5 +1,5 @@
- ;/*
--; * Copyright (c) 2009-2022, Arm Limited. All rights reserved.
-+; * Copyright (c) 2023, Arm Limited. All rights reserved.
- ; *
- ; * Licensed under the Apache License, Version 2.0 (the "License");
- ; * you may not use this file except in compliance with the License.
-diff --git a/platform/ext/target/arm/corstone1000/Device/Source/gcc/cors=
tone1000_bl1_2.ld b/platform/ext/target/arm/corstone1000/Device/Source/gc=
c/corstone1000_bl1_2.ld
-index e1e4f2966..e66e54aa6 100644
---- a/platform/ext/target/arm/corstone1000/Device/Source/gcc/corstone100=
0_bl1_2.ld
-+++ b/platform/ext/target/arm/corstone1000/Device/Source/gcc/corstone100=
0_bl1_2.ld
-@@ -1,5 +1,5 @@
- ;/*
--; * Copyright (c) 2009-2022, Arm Limited. All rights reserved.
-+; * Copyright (c) 2023, Arm Limited. All rights reserved.
- ; *
- ; * Licensed under the Apache License, Version 2.0 (the "License");
- ; * you may not use this file except in compliance with the License.
---=20
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0009-Platform-corstone1000-fix-flash-reading-issue-for-fi.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009-Platform-=
corstone1000-fix-flash-reading-issue-for-fi.patch
deleted file mode 100644
index 5c0024b2..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009=
-Platform-corstone1000-fix-flash-reading-issue-for-fi.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 7914ec3f96dbb8228e791d9492cfc3651cf9deca Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Wed, 5 Apr 2023 10:28:57 +0100
-Subject: [PATCH] Platform: corstone1000: Fix Flash reading issue for FIP=
 data
-
-Fixes the flash reading issue since bl2 needs to read the data from
-flash in XIP mode on FPGA (mps3).
-
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/20558]
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
----
- platform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c b/p=
latform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c
-index cf6340c5a9..e4183c7a57 100644
---- a/platform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c
-+++ b/platform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c
-@@ -89,6 +89,7 @@ static bool fill_flash_map_with_fip_data(uint8_t boot_=
index) {
-=20
-     /* parse directly from flash using XIP mode */
-     /* FIP is large so its not a good idea to load it in memory */
-+    Select_XIP_Mode_For_Shared_Flash();
-     result =3D parse_fip_and_extract_tfa_info(
-         FLASH_BASE_ADDRESS + fip_offset + FIP_SIGNATURE_AREA_SIZE, fip_=
size,
-         &tfa_offset, &tfa_size);
-@@ -96,7 +97,7 @@ static bool fill_flash_map_with_fip_data(uint8_t boot_=
index) {
-         BOOT_LOG_ERR("parse_fip_and_extract_tfa_info failed");
-         return false;
-     }
--
-+    Select_Write_Mode_For_Shared_Flash();
-     flash_map[2].fa_off =3D fip_offset + FIP_SIGNATURE_AREA_SIZE + tfa_=
offset;
-     flash_map[2].fa_size =3D tfa_size;
-     flash_map[3].fa_off =3D flash_map[2].fa_off + flash_map[2].fa_size;
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0010-Platform-corstone1000-Adds-compiler-flags-to-FWU-age.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0010-Platform-=
corstone1000-Adds-compiler-flags-to-FWU-age.patch
deleted file mode 100644
index 29fce5eb..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0010=
-Platform-corstone1000-Adds-compiler-flags-to-FWU-age.patch
+++ /dev/null
@@ -1,273 +0,0 @@
-From 11f6af40dc322630031511146763cc9059bdb805 Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Fri, 14 Apr 2023 16:35:55 +0100
-Subject: [PATCH] Platform: corstone1000: Adds compiler flags to FWU agen=
t for
- BL1
-
-Adds compiler flags for BL1 to fwu_agent.c functions to not use GPT pars=
er and
-IO libraries in BL1 rom code.
-
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/20559]
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
----
- .../corstone1000/fw_update_agent/fwu_agent.c  | 176 +++++++++++++++++-
- 1 file changed, 174 insertions(+), 2 deletions(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-index 8ecb03d157..afd8d66e42 100644
---- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-+++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-@@ -14,8 +14,6 @@
- #include "region_defs.h"
- #include "uefi_capsule_parser.h"
- #include "flash_common.h"
--#include "partition.h"
--#include "platform.h"
- #include "platform_base_address.h"
- #include "platform_description.h"
- #include "tfm_plat_nv_counters.h"
-@@ -23,6 +21,10 @@
- #include "uefi_fmp.h"
- #include "uart_stdout.h"
- #include "soft_crc.h"
-+#if !BL1
-+#include "partition.h"
-+#include "platform.h"
-+#endif
-=20
- /* Properties of image in a bank */
- struct fwu_image_properties {
-@@ -145,6 +147,30 @@ extern ARM_DRIVER_FLASH FWU_METADATA_FLASH_DEV;
-=20
- #define HOST_ACK_TIMEOUT_SEC    (6 * 60) /* ~seconds, not exact */
-=20
-+#if BL1
-+static enum fwu_agent_error_t private_metadata_read(
-+        struct fwu_private_metadata* p_metadata)
-+{
-+    int ret;
-+
-+    FWU_LOG_MSG("%s: enter\n\r", __func__);
-+
-+    if (!p_metadata) {
-+        return FWU_AGENT_ERROR;
-+    }
-+
-+    ret =3D FWU_METADATA_FLASH_DEV.ReadData(FWU_PRIVATE_METADATA_REPLIC=
A_1_OFFSET, p_metadata,
-+                                          sizeof(struct fwu_private_met=
adata));
-+    if (ret < 0 || ret !=3D sizeof(struct fwu_private_metadata)) {
-+        return FWU_AGENT_ERROR;
-+    }
-+
-+    FWU_LOG_MSG("%s: success: boot_index =3D %u\n\r", __func__,
-+                        p_metadata->boot_index);
-+
-+    return FWU_AGENT_SUCCESS;
-+}
-+#elif
- static enum fwu_agent_error_t private_metadata_read(
-         struct fwu_private_metadata* p_metadata)
- {
-@@ -175,7 +201,36 @@ static enum fwu_agent_error_t private_metadata_read=
(
-=20
-     return FWU_AGENT_SUCCESS;
- }
-+#endif
-=20
-+#if BL1
-+static enum fwu_agent_error_t private_metadata_write(
-+        struct fwu_private_metadata* p_metadata)
-+{
-+    int ret;
-+
-+    FWU_LOG_MSG("%s: enter: boot_index =3D %u\n\r", __func__,
-+                        p_metadata->boot_index);
-+
-+    if (!p_metadata) {
-+        return FWU_AGENT_ERROR;
-+    }
-+
-+    ret =3D FWU_METADATA_FLASH_DEV.EraseSector(FWU_PRIVATE_METADATA_REP=
LICA_1_OFFSET);
-+    if (ret !=3D ARM_DRIVER_OK) {
-+        return FWU_AGENT_ERROR;
-+    }
-+
-+    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(FWU_PRIVATE_METADATA_REP=
LICA_1_OFFSET,
-+                                p_metadata, sizeof(struct fwu_private_m=
etadata));
-+    if (ret < 0 || ret !=3D sizeof(struct fwu_private_metadata)) {
-+        return FWU_AGENT_ERROR;
-+    }
-+
-+    FWU_LOG_MSG("%s: success\n\r", __func__);
-+    return FWU_AGENT_SUCCESS;
-+}
-+#elif
- static enum fwu_agent_error_t private_metadata_write(
-         struct fwu_private_metadata* p_metadata)
- {
-@@ -210,6 +265,7 @@ static enum fwu_agent_error_t private_metadata_write=
(
-     FWU_LOG_MSG("%s: success\n\r", __func__);
-     return FWU_AGENT_SUCCESS;
- }
-+#endif
-=20
- static enum fwu_agent_error_t metadata_validate(struct fwu_metadata *p_=
metadata)
- {
-@@ -235,6 +291,30 @@ static enum fwu_agent_error_t metadata_validate(str=
uct fwu_metadata *p_metadata)
-     return FWU_AGENT_SUCCESS;
- }
-=20
-+#if BL1
-+static enum fwu_agent_error_t metadata_read_without_validation(struct f=
wu_metadata *p_metadata)
-+{
-+    int ret;
-+
-+    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
-+                  FWU_METADATA_REPLICA_1_OFFSET, sizeof(struct fwu_meta=
data));
-+
-+    if (!p_metadata) {
-+        return FWU_AGENT_ERROR;
-+    }
-+
-+    ret =3D FWU_METADATA_FLASH_DEV.ReadData(FWU_METADATA_REPLICA_1_OFFS=
ET,
-+                                p_metadata, sizeof(struct fwu_metadata)=
);
-+    if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
-+        return FWU_AGENT_ERROR;
-+    }
-+
-+    FWU_LOG_MSG("%s: success: active =3D %u, previous =3D %d\n\r", __fu=
nc__,
-+                  p_metadata->active_index, p_metadata->previous_active=
_index);
-+
-+    return FWU_AGENT_SUCCESS;
-+}
-+#elif
- static enum fwu_agent_error_t metadata_read_without_validation(struct f=
wu_metadata *p_metadata)
- {
-     uuid_t metadata_uuid =3D FWU_METADATA_TYPE_UUID;
-@@ -266,7 +346,36 @@ static enum fwu_agent_error_t metadata_read_without=
_validation(struct fwu_metada
-=20
-     return FWU_AGENT_SUCCESS;
- }
-+#endif
-+
-+#if BL1
-+static enum fwu_agent_error_t metadata_read(struct fwu_metadata *p_meta=
data)
-+{
-+    int ret;
-=20
-+    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
-+                  FWU_METADATA_REPLICA_1_OFFSET, sizeof(struct fwu_meta=
data));
-+
-+    if (!p_metadata) {
-+        return FWU_AGENT_ERROR;
-+    }
-+
-+    ret =3D FWU_METADATA_FLASH_DEV.ReadData(FWU_METADATA_REPLICA_1_OFFS=
ET,
-+                                p_metadata, sizeof(struct fwu_metadata)=
);
-+    if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
-+        return FWU_AGENT_ERROR;
-+    }
-+
-+    if (metadata_validate(p_metadata) !=3D FWU_AGENT_SUCCESS) {
-+        return FWU_AGENT_ERROR;
-+    }
-+
-+    FWU_LOG_MSG("%s: success: active =3D %u, previous =3D %d\n\r", __fu=
nc__,
-+                  p_metadata->active_index, p_metadata->previous_active=
_index);
-+
-+    return FWU_AGENT_SUCCESS;
-+}
-+#elif
- static enum fwu_agent_error_t metadata_read(struct fwu_metadata *p_meta=
data)
- {
-     uuid_t metadata_uuid =3D FWU_METADATA_TYPE_UUID;
-@@ -301,7 +410,66 @@ static enum fwu_agent_error_t metadata_read(struct =
fwu_metadata *p_metadata)
-=20
-     return FWU_AGENT_SUCCESS;
- }
-+#endif
-+
-=20
-+#if BL1
-+static enum fwu_agent_error_t metadata_write(
-+                        struct fwu_metadata *p_metadata)
-+{
-+    int ret;
-+
-+    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
-+                  FWU_METADATA_REPLICA_1_OFFSET, sizeof(struct fwu_meta=
data));
-+
-+    if (!p_metadata) {
-+        return FWU_AGENT_ERROR;
-+    }
-+
-+    ret =3D FWU_METADATA_FLASH_DEV.EraseSector(FWU_METADATA_REPLICA_1_O=
FFSET);
-+    if (ret !=3D ARM_DRIVER_OK) {
-+        return FWU_AGENT_ERROR;
-+    }
-+
-+    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(FWU_METADATA_REPLICA_1_O=
FFSET,
-+                                p_metadata, sizeof(struct fwu_metadata)=
);
-+    if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
-+        return FWU_AGENT_ERROR;
-+    }
-+
-+    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
-+                  FWU_METADATA_REPLICA_2_OFFSET, sizeof(struct fwu_meta=
data));
-+
-+    ret =3D FWU_METADATA_FLASH_DEV.EraseSector(FWU_METADATA_REPLICA_2_O=
FFSET);
-+    if (ret !=3D ARM_DRIVER_OK) {
-+        return FWU_AGENT_ERROR;
-+    }
-+
-+    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(FWU_METADATA_REPLICA_2_O=
FFSET,
-+                                p_metadata, sizeof(struct fwu_metadata)=
);
-+    if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
-+        return FWU_AGENT_ERROR;
-+    }
-+
-+    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
-+                  FWU_METADATA_REPLICA_2_OFFSET, sizeof(struct fwu_meta=
data));
-+
-+    ret =3D FWU_METADATA_FLASH_DEV.EraseSector(FWU_METADATA_REPLICA_2_O=
FFSET);
-+    if (ret !=3D ARM_DRIVER_OK) {
-+        return FWU_AGENT_ERROR;
-+    }
-+
-+    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(FWU_METADATA_REPLICA_2_O=
FFSET,
-+                                p_metadata, sizeof(struct fwu_metadata)=
);
-+    if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
-+        return FWU_AGENT_ERROR;
-+    }
-+
-+    FWU_LOG_MSG("%s: success: active =3D %u, previous =3D %d\n\r", __fu=
nc__,
-+                  p_metadata->active_index, p_metadata->previous_active=
_index);
-+    return FWU_AGENT_SUCCESS;
-+}
-+#elif
- static enum fwu_agent_error_t metadata_write(
-                         struct fwu_metadata *p_metadata)
- {
-@@ -371,6 +539,8 @@ static enum fwu_agent_error_t metadata_write(
-                   p_metadata->active_index, p_metadata->previous_active=
_index);
-     return FWU_AGENT_SUCCESS;
- }
-+#endif
-+
-=20
- enum fwu_agent_error_t fwu_metadata_init(void)
- {
-@@ -418,8 +588,10 @@ enum fwu_agent_error_t fwu_metadata_provision(void)
-=20
-     FWU_LOG_MSG("%s: enter\n\r", __func__);
-=20
-+#if !BL1
-     plat_io_storage_init();
-     partition_init(PLATFORM_GPT_IMAGE);
-+#endif
-=20
-     ret =3D fwu_metadata_init();
-     if (ret) {
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0011-Platform-corstone1000-adjust-PS-asset-configuration.patch b/meta-=
arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0011-Platform-c=
orstone1000-adjust-PS-asset-configuration.patch
deleted file mode 100644
index 19a37731..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0011=
-Platform-corstone1000-adjust-PS-asset-configuration.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 148d82d0984273b30d8b148f0c4e0ad0d3f23062 Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Mon, 17 Apr 2023 12:07:55 +0100
-Subject: [PATCH 1/3] Platform: corstone1000: adjust PS asset configurati=
on
-
-Adjust protected storage asset configuration to be more inline
-with the one in trusted service side, that would make thinks
-work when testing and using more than the default variables.
-
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/20560]
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-Change-Id: I181f9c72a816c727c2170c609100aec1d233fea7
----
- platform/ext/target/arm/corstone1000/config.cmake | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/platform/ext/target/arm/corstone1000/config.cmake b/platfor=
m/ext/target/arm/corstone1000/config.cmake
-index bec6b84f0..0c91fa59f 100644
---- a/platform/ext/target/arm/corstone1000/config.cmake
-+++ b/platform/ext/target/arm/corstone1000/config.cmake
-@@ -76,3 +76,4 @@ endif()
- # Platform-specific configurations
- set(CONFIG_TFM_USE_TRUSTZONE            OFF)
- set(TFM_MULTI_CORE_TOPOLOGY             ON)
-+set(PS_NUM_ASSETS                       "40"        CACHE STRING    "Th=
e maximum number of assets to be stored in the Protected Storage area")
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0012-Platform-corstone1000-Increase-number-of-assets.patch b/meta-arm-=
bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0012-Platform-corst=
one1000-Increase-number-of-assets.patch
deleted file mode 100644
index d2fc332d..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0012=
-Platform-corstone1000-Increase-number-of-assets.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 34263d1ea99da7b8a680a80601a73149bc9530e5 Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Fri, 21 Apr 2023 15:17:21 +0100
-Subject: [PATCH] Platform: corstone1000: Increase number of assets
-
-As Corstone1000 stores at boot time few efi variables.
-Therefore, number of assets is increased to compansate this early usage.
-
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/20656]
-Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-Change-Id: Id8555a09335ce13b80c07a33c4d913f5cb0f9084
----
- platform/ext/target/arm/corstone1000/config_tfm_target.h | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/platform/ext/target/arm/corstone1000/config_tfm_target.h b/=
platform/ext/target/arm/corstone1000/config_tfm_target.h
-index bf8d2f95f..e96836663 100644
---- a/platform/ext/target/arm/corstone1000/config_tfm_target.h
-+++ b/platform/ext/target/arm/corstone1000/config_tfm_target.h
-@@ -16,4 +16,12 @@
- #undef PLATFORM_SERVICE_OUTPUT_BUFFER_SIZE
- #define PLATFORM_SERVICE_OUTPUT_BUFFER_SIZE    256
-
-+/* The maximum number of assets to be stored in the Internal Trusted St=
orage. */
-+#undef ITS_NUM_ASSETS
-+#define ITS_NUM_ASSETS       20
-+
-+/* The maximum number of assets to be stored in the Protected Storage a=
rea. */
-+#undef PS_NUM_ASSETS
-+#define PS_NUM_ASSETS        20
-+
- #endif /* __CONFIG_TFM_TARGET_H__ */
---
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-1.7.0-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/t=
rusted-firmware-m-corstone1000.inc
similarity index 61%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-=
m-1.7.0-corstone1000.inc
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-=
corstone1000.inc
index 23c8c127..0831ed0e 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.=
0-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -11,10 +11,6 @@ TFM_PLATFORM_IS_FVP ?=3D "FALSE"
 EXTRA_OECMAKE +=3D "-DPLATFORM_IS_FVP=3D${TFM_PLATFORM_IS_FVP}"
 EXTRA_OECMAKE +=3D "-DCC312_LEGACY_DRIVER_API_ENABLED=3DON"
=20
-SRCREV_tfm =3D "94c55967cbd1832681f07074a0945605b02ec8d0"
-SRCREV_mcuboot =3D "9e8eddcecba931f99297765779f8b130d808a9a3"
-SRCREV_mbedtls =3D "8c89224991adff88d53cd380f42a2baa36f91454"
-
 # libmetal
 LICENSE +=3D "& BSD-3-Clause"
 LIC_FILES_CHKSUM +=3D "file://../libmetal/LICENSE.md;md5=3Dfe0b8a4beea8f=
0813b606d15a3df3d3c"
@@ -30,28 +26,12 @@ SRCREV_openamp =3D "347397decaa43372fc4d00f965640ebde=
042966d"
 EXTRA_OECMAKE +=3D "-DLIBOPENAMP_SRC_PATH=3D${S}/../openamp -DLIBOPENAMP=
_BIN_PATH=3D${B}/libopenamp-build"
=20
=20
-SRC_URI:remove:corstone1000 =3D" \
-    file://rwx.patch    \
-"
-
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
 SRC_URI:append:corstone1000 =3D " \
-    file://0001-Platform-corstone1000-make-sure-to-write-fwu-metadata-to=
-repl.patch      \
-    file://0002-Platform-corstone1000-get-fwu-and-private-metadata-f.pat=
ch      \
-    file://0003-Platform-corstone1000-Add-watchdog_reset_timer.patch    =
        \
-    file://0004-Platform-corstone1000-Replace-MCUBOOT-BL1-by-TFM-s.patch=
        \
-    file://0005-Platform-corstone1000-Replace-MCUBOOT-BL1-by-TFM-s-B.pat=
ch      \
-    file://0006-Platform-corstone1000-Reorganize-bl2-files.patch        =
        \
-    file://0007-Platform-corstone1000-Fix-linker-script-comment.patch   =
        \
-    file://0008-Platform-corstone1000-Fix-linkerscripts-copyright-ye.pat=
ch      \
-    file://0009-Platform-corstone1000-fix-flash-reading-issue-for-fi.pat=
ch      \
-    file://0010-Platform-corstone1000-Adds-compiler-flags-to-FWU-age.pat=
ch      \
-    file://0011-Platform-corstone1000-adjust-PS-asset-configuration.patc=
h       \
-    file://0012-Platform-corstone1000-Increase-number-of-assets.patch   =
        \
-    file://0013-Platform-corstone1000-Increase-BL2-size-in-flash-lay.pat=
ch      \
-    file://0014-Platform-Corstone1000-Increase-BL2_DATA_SIZE.patch      =
        \
-    file://0015-Platform-Corstone1000-Calculate-the-new-CRC32-value-.pat=
ch      \
-    file://corstone1000/rwx.patch                                       =
        \
+    file://0001-Platform-corstone1000-Increase-BL2-size-in-flash-lay.pat=
ch \
+    file://0002-Platform-Corstone1000-Increase-BL2_DATA_SIZE.patch \
+    file://0003-Platform-Corstone1000-Calculate-the-new-CRC32-value-.pat=
ch \
+    file://0004-arm-trusted-firmware-m-disable-fatal-warnings.patch \
     "
=20
 # TF-M ships patches for external dependencies that needs to be applied
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m_1.7.%.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-f=
irmware-m_%.bbappend
similarity index 54%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-=
m_1.7.%.bbappend
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_=
%.bbappend
index ec0e483b..da70bc78 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.7.=
%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_%.bb=
append
@@ -1,6 +1,6 @@
 # Machine specific configurations
=20
 MACHINE_TFM_REQUIRE ?=3D ""
-MACHINE_TFM_REQUIRE:corstone1000 =3D "trusted-firmware-m-1.7.0-corstone1=
000.inc"
+MACHINE_TFM_REQUIRE:corstone1000 =3D "trusted-firmware-m-corstone1000.in=
c"
=20
 require ${MACHINE_TFM_REQUIRE}
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/files/rwx.patch b/me=
ta-arm/recipes-bsp/trusted-firmware-m/files/rwx.patch
deleted file mode 100644
index b279cfea..00000000
--- a/meta-arm/recipes-bsp/trusted-firmware-m/files/rwx.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 1d548c77d07fc9a83e3e9aa28a23aa19a0177e3b Mon Sep 17 00:00:00 2001
-From: Jon Mason <jon.mason@arm.com>
-Date: Wed, 18 Jan 2023 15:13:37 -0500
-Subject: [PATCH] arm/trusted-firmware-m: disable fatal warnings
-
-Signed-off-by: Jon Mason <jon.mason@arm.com>
-Upstream-Status: Inappropriate
-
----
- toolchain_GNUARM.cmake | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/toolchain_GNUARM.cmake b/toolchain_GNUARM.cmake
-index 7978eaca68..88395f922a 100644
---- a/toolchain_GNUARM.cmake
-+++ b/toolchain_GNUARM.cmake
-@@ -66,7 +66,6 @@ macro(tfm_toolchain_reset_linker_flags)
-         --entry=3DReset_Handler
-         --specs=3Dnano.specs
-         LINKER:-check-sections
--        LINKER:-fatal-warnings
-         LINKER:--gc-sections
-         LINKER:--no-wchar-size-warning
-         ${MEMORY_USAGE_FLAG}
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1=
.7.0-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m=
-1.8.0-src.inc
similarity index 80%
rename from meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.=
7.0-src.inc
rename to meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.8.=
0-src.inc
index 6a209c37..393ce439 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-sr=
c.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.8.0-sr=
c.inc
@@ -3,7 +3,7 @@
 LICENSE =3D "BSD-2-Clause & BSD-3-Clause & Apache-2.0"
=20
 LIC_FILES_CHKSUM =3D "file://license.rst;md5=3D07f368487da347f3c7bd0fc30=
85f3afa \
-                    file://../tf-m-tests/license.rst;md5=3D02d06ffb8d9f0=
99ff4961c0cb0183a18 \
+                    file://../tf-m-tests/license.rst;md5=3D4481bae2221b0=
cfca76a69fb3411f390 \
                     file://../mbedtls/LICENSE;md5=3D3b83ef96387f14655fc8=
54ddc3c6bd57 \
                     file://../mcuboot/LICENSE;md5=3Db6ee33f1d12a5e6ee3de=
1e82fb51eeb8"
=20
@@ -22,24 +22,24 @@ SRC_URI  =3D "${SRC_URI_TRUSTED_FIRMWARE_M};branch=3D=
${SRCBRANCH_tfm};name=3Dtfm;dests
             "
=20
 # The required dependencies are documented in tf-m/config/config_default=
.cmake
-# TF-Mv1.7.0
+# TF-Mv1.8.0
 SRCBRANCH_tfm ?=3D "master"
-SRCREV_tfm =3D "b725a1346cdb9ec75b1adcdc4c84705881e8fd4e"
-# TF-Mv1.7.0
+SRCREV_tfm =3D "35ac80c8581d483da7d18cb8bcd20aaed096550c"
+# TF-Mv1.8.0
 SRCBRANCH_tfm-tests ?=3D "master"
-SRCREV_tfm-tests =3D "4c4b58041c6c01670266690538a780b4a23d08b8"
-# mbedtls-3.2.1
+SRCREV_tfm-tests =3D "1273c5bcd3d8ade60d51524797e0b22b6fd7eea1"
+# mbedtls-3.4.0
 SRCBRANCH_mbedtls ?=3D "master"
-SRCREV_mbedtls =3D "869298bffeea13b205343361b7a7daf2b210e33d"
-# v1.9.0
+SRCREV_mbedtls =3D "1873d3bfc2da771672bd8e7e8f41f57e0af77f33"
+# mcuboot v1.10.0
 SRCBRANCH_mcuboot ?=3D "main"
-SRCREV_mcuboot =3D "c657cbea75f2bb1faf1fceacf972a0537a8d26dd"
-# qcbor
+SRCREV_mcuboot =3D "23d28832f02dcdc18687782c6cd8ba99e9b274d2"
+# QCBOR v1.2
 SRCBRANCH_qcbor ?=3D "master"
 SRCREV_qcbor =3D "b0e7033268e88c9f27146fa9a1415ef4c19ebaff"
-# TF-Mv1.7.0
+# TF-Mv1.8.0
 SRCBRANCH_tfm-extras ?=3D "master"
-SRCREV_tfm-extras =3D "daacaa6df3881e205bc03d75fc8fb688afe9f0f1"
+SRCREV_tfm-extras =3D "504ae9a9a50981e9dd4d8accec8261a1dba9e965"
=20
 SRCREV_FORMAT =3D "tfm"
=20
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-s=
cripts-native_1.7.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-=
firmware-m-scripts-native_1.8.0.bb
similarity index 57%
rename from meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-sc=
ripts-native_1.7.0.bb
rename to meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-scri=
pts-native_1.8.0.bb
index 504846e0..10b141d7 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-scripts-=
native_1.7.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-scripts-=
native_1.8.0.bb
@@ -1,2 +1,2 @@
-require recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-src.inc
+require recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.8.0-src.inc
 require recipes-bsp/trusted-firmware-m/trusted-firmware-m-scripts-native=
.inc
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
index eeb6135a..1747c654 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
@@ -8,8 +8,6 @@ DESCRIPTION =3D "Trusted Firmware-M"
 HOMEPAGE =3D "https://git.trustedfirmware.org/trusted-firmware-m.git"
 PROVIDES =3D "virtual/trusted-firmware-m"
=20
-SRC_URI +=3D "file://rwx.patch"
-
 UPSTREAM_CHECK_GITTAGREGEX =3D "^TF-Mv(?P<pver>\d+(\.\d+)+)$"
=20
 # Note to future readers of this recipe: until the CMakeLists don't abus=
e
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1=
.7.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.8.=
0.bb
similarity index 52%
rename from meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.=
7.0.bb
rename to meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.8.=
0.bb
index 32e6ed34..5794c1ee 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.7.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.8.0.bb
@@ -1,2 +1,2 @@
-require recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-src.inc
+require recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.8.0-src.inc
 require recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
--=20
2.30.2


