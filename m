Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA054C3271E
	for <webhook@archiver.kernel.org>; Fri,  5 Jul 2024 16:06:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20719.1720195601982810901
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 05 Jul 2024 09:06:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B97F7367;
	Fri,  5 Jul 2024 09:07:06 -0700 (PDT)
Received: from e126523.arm.com (unknown [10.57.75.169])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F08943F766;
	Fri,  5 Jul 2024 09:06:40 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Emekcan Aras <Emekcan.Aras@arm.com>
Subject: [PATCH 2/3] arm-bsp/trusted-firmware-m: corstone1000: Switch to metadata v2
Date: Fri,  5 Jul 2024 18:06:21 +0200
Message-Id: <20240705160622.583987-3-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240705160622.583987-1-bence.balogh@arm.com>
References: <20240705160622.583987-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 05 Jul 2024 16:06:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5866

From: Emekcan Aras <Emekcan.Aras@arm.com>

Upgrades metadata structs in secure-enclave from v1 to v2 as described
in psa-fwu spec: https://developer.arm.com/documentation/den0118/latest/

The TrustedFirmware-A v2.11 release supports only the metadata v2. The
structs in TF-M side had to be aligned to keep the compatibility.

Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
---
 ...m-Corstone1000-switch-to-metadata-v2.patch | 235 ++++++++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |   1 +
 2 files changed, 236 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0014-Platform-Corstone1000-switch-to-metadata-v2.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0014-Platform-Corstone1000-switch-to-metadata-v2.patch b/meta-arm-bsp/=
recipes-bsp/trusted-firmware-m/files/corstone1000/0014-Platform-Corstone1=
000-switch-to-metadata-v2.patch
new file mode 100644
index 00000000..527428bf
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0014=
-Platform-Corstone1000-switch-to-metadata-v2.patch
@@ -0,0 +1,235 @@
+From 748e0b4acbd9e1dce3450beffe2d54565df9ee8d Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <Emekcan.Aras@arm.com>
+Date: Mon, 8 Apr 2024 16:04:45 +0100
+Subject: [PATCH] Plaform: Corstone1000: Switch to metadata v2
+
+This upgrades metadata data structs from v1 to v2 as described in psa
+fwu spec: https://developer.arm.com/documentation/den0118/latest/
+
+The TrustedFirmware-A v2.11 release supports only the metadata v2. The
+structs in TF-M side had to be aligned to keep the compatibility.
+
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+Signed-off-by: Bence Balogh <bence.balogh@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ .../corstone1000/fw_update_agent/fwu_agent.c  | 94 ++++++++++++++-----
+ 1 file changed, 72 insertions(+), 22 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+index be04e0e5df..9f942cb23a 100644
+--- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
++++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
+@@ -26,6 +26,13 @@
+ #include "platform.h"
+ #endif
+=20
++#define FWU_METADATA_VERSION		2
++#define FWU_FW_STORE_DESC_OFFSET	0x20
++#define NR_OF_MAX_FW_BANKS		4
++
++/*Metadata version 2 data structures defined by PSA_FW update specifica=
tion;
++ *https://developer.arm.com/documentation/den0118/latest/ */
++
+ /* Properties of image in a bank */
+ struct fwu_image_properties {
+=20
+@@ -58,6 +65,28 @@ struct fwu_image_entry {
+=20
+ } __packed;
+=20
++struct fwu_fw_store_descriptor {
++
++       /* Number of Banks */
++       uint8_t num_banks;
++
++       /* Reserved */
++       uint8_t reserved;
++
++       /* Number of images per bank */
++       uint16_t num_images;
++
++       /* Size of image_entry(all banks) in bytes */
++       uint16_t img_entry_size;
++
++       /* Size of image bank info structure in bytes */
++       uint16_t bank_info_entry_size;
++
++       /* Array of fwu_image_entry structs */
++       struct fwu_image_entry img_entry[NR_OF_IMAGES_IN_FW_BANK];
++
++} __packed;
++
+ struct fwu_metadata {
+=20
+         /* Metadata CRC value */
+@@ -72,8 +101,23 @@ struct fwu_metadata {
+         /* Previous bank index with which device booted successfully */
+         uint32_t previous_active_index;
+=20
+-        /* Image entry information */
+-        struct fwu_image_entry img_entry[NR_OF_IMAGES_IN_FW_BANK];
++        /* Size of the entire metadata in bytes */
++        uint32_t metadata_size;
++
++        /* Offset of the image descriptor structure */
++        uint16_t desc_offset;
++
++        /* Reserved */
++        uint16_t reserved1;
++
++        /* Bank state: It's not used in corstone1000 at the moment.Curr=
ently
++	     * not used by any sw componenets such as u-boot and TF-A */
++        uint8_t bank_state[NR_OF_MAX_FW_BANKS];
++
++        /* Reserved */
++        uint32_t reserved2;
++
++        struct fwu_fw_store_descriptor fw_desc;
+=20
+ } __packed;
+=20
+@@ -284,7 +328,7 @@ static enum fwu_agent_error_t metadata_validate(stru=
ct fwu_metadata *p_metadata)
+     }
+=20
+     uint32_t calculated_crc32 =3D crc32((uint8_t *)&(p_metadata->versio=
n),
+-                                      sizeof(struct fwu_metadata) - siz=
eof(uint32_t));
++                                      sizeof(struct fwu_metadata) - siz=
eof(p_metadata->crc_32));
+=20
+     if (p_metadata->crc_32 !=3D calculated_crc32) {
+         FWU_LOG_MSG("%s: failed: crc32 calculated: 0x%x, given: 0x%x\n\=
r", __func__,
+@@ -618,25 +662,31 @@ enum fwu_agent_error_t fwu_metadata_provision(void=
)
+=20
+     memset(&_metadata, 0, sizeof(struct fwu_metadata));
+=20
+-    _metadata.version =3D 1;
++    _metadata.version =3D FWU_METADATA_VERSION;
+     _metadata.active_index =3D BANK_0;
+     _metadata.previous_active_index =3D BANK_1;
++    _metadata.desc_offset=3D FWU_FW_STORE_DESC_OFFSET;
+=20
++    _metadata.fw_desc.num_banks =3D NR_OF_FW_BANKS;
++    _metadata.fw_desc.num_images =3D NR_OF_IMAGES_IN_FW_BANK;
++    _metadata.fw_desc.img_entry_size =3D sizeof(struct fwu_image_entry)=
 * NR_OF_IMAGES_IN_FW_BANK;
++    _metadata.fw_desc.bank_info_entry_size =3D sizeof(struct fwu_image_=
properties) * NR_OF_FW_BANKS;
+     /* bank 0 is the place where images are located at the
+      * start of device lifecycle */
+=20
+     for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
+=20
+-        _metadata.img_entry[i].img_props[BANK_0].accepted =3D IMAGE_ACC=
EPTED;
+-        _metadata.img_entry[i].img_props[BANK_0].version =3D image_vers=
ion;
++        _metadata.fw_desc.img_entry[i].img_props[BANK_0].accepted =3D I=
MAGE_ACCEPTED;
++        _metadata.fw_desc.img_entry[i].img_props[BANK_0].version =3D im=
age_version;
+=20
+-        _metadata.img_entry[i].img_props[BANK_1].accepted =3D IMAGE_NOT=
_ACCEPTED;
+-        _metadata.img_entry[i].img_props[BANK_1].version =3D INVALID_VE=
RSION;
++        _metadata.fw_desc.img_entry[i].img_props[BANK_1].accepted =3D I=
MAGE_NOT_ACCEPTED;
++        _metadata.fw_desc.img_entry[i].img_props[BANK_1].version =3D IN=
VALID_VERSION;
+     }
+=20
+-    /* Calculate CRC32 for fwu metadata */
++    /* Calculate CRC32 for fwu metadata. The first filed in the _metada=
ta has to be the crc_32.
++     * This should be omited from the calculation. */
+     _metadata.crc_32 =3D crc32((uint8_t *)&_metadata.version,
+-                             sizeof(struct fwu_metadata) - sizeof(uint3=
2_t));
++                             sizeof(struct fwu_metadata) - sizeof(_meta=
data.crc_32));
+=20
+     ret =3D metadata_write(&_metadata);
+     if (ret) {
+@@ -696,7 +746,7 @@ static enum fwu_agent_state_t get_fwu_agent_state(
+     }
+=20
+     for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
+-        if ((metadata_ptr->img_entry[i].img_props[boot_index].accepted)
++        if ((metadata_ptr->fw_desc.img_entry[i].img_props[boot_index].a=
ccepted)
+                 =3D=3D (IMAGE_NOT_ACCEPTED)) {
+             return FWU_AGENT_STATE_TRIAL;
+         }
+@@ -771,7 +821,7 @@ static enum fwu_agent_error_t flash_full_capsule(
+     }
+=20
+     if (version <=3D
+-            (metadata->img_entry[IMAGE_0].img_props[active_index].versi=
on)) {
++            (metadata->fw_desc.img_entry[IMAGE_0].img_props[active_inde=
x].version)) {
+         FWU_LOG_MSG("ERROR: %s: version error\n\r",__func__);
+         return FWU_AGENT_ERROR;
+     }
+@@ -802,14 +852,14 @@ static enum fwu_agent_error_t flash_full_capsule(
+=20
+     /* Change system state to trial bank state */
+     for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
+-        metadata->img_entry[i].img_props[previous_active_index].accepte=
d =3D
++        metadata->fw_desc.img_entry[i].img_props[previous_active_index]=
.accepted =3D
+                                                         IMAGE_NOT_ACCEP=
TED;
+-        metadata->img_entry[i].img_props[previous_active_index].version=
 =3D version;
++        metadata->fw_desc.img_entry[i].img_props[previous_active_index]=
.version =3D version;
+     }
+     metadata->active_index =3D previous_active_index;
+     metadata->previous_active_index =3D active_index;
+     metadata->crc_32 =3D crc32((uint8_t *)&metadata->version,
+-                              sizeof(struct fwu_metadata) - sizeof(uint=
32_t));
++                              sizeof(struct fwu_metadata) - sizeof(meta=
data->crc_32));
+=20
+     ret =3D metadata_write(metadata);
+     if (ret) {
+@@ -911,7 +961,7 @@ static enum fwu_agent_error_t accept_full_capsule(
+     FWU_LOG_MSG("%s: enter\n\r", __func__);
+=20
+     for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
+-        metadata->img_entry[i].img_props[active_index].accepted =3D
++        metadata->fw_desc.img_entry[i].img_props[active_index].accepted=
 =3D
+                                                             IMAGE_ACCEP=
TED;
+     }
+=20
+@@ -922,7 +972,7 @@ static enum fwu_agent_error_t accept_full_capsule(
+         return ret;
+     }
+     metadata->crc_32 =3D crc32((uint8_t *)&metadata->version,
+-                              sizeof(struct fwu_metadata) - sizeof(uint=
32_t));
++                              sizeof(struct fwu_metadata) - sizeof(meta=
data->crc_32));
+=20
+     ret =3D metadata_write(metadata);
+     if (ret) {
+@@ -1001,7 +1051,7 @@ static enum fwu_agent_error_t fwu_select_previous(
+=20
+     index =3D metadata->previous_active_index;
+     for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
+-        if (metadata->img_entry[i].img_props[index].accepted !=3D IMAGE=
_ACCEPTED)
++        if (metadata->fw_desc.img_entry[i].img_props[index].accepted !=3D=
 IMAGE_ACCEPTED)
+         {
+             FWU_ASSERT(0);
+         }
+@@ -1018,7 +1068,7 @@ static enum fwu_agent_error_t fwu_select_previous(
+         return ret;
+     }
+     metadata->crc_32 =3D crc32((uint8_t *)&metadata->version,
+-                              sizeof(struct fwu_metadata) - sizeof(uint=
32_t));
++                              sizeof(struct fwu_metadata) - sizeof(meta=
data->crc_32));
+=20
+     ret =3D metadata_write(metadata);
+     if (ret) {
+@@ -1218,7 +1268,7 @@ enum fwu_agent_error_t corstone1000_fwu_host_ack(v=
oid)
+         /* firmware update failed, revert back to previous bank */
+=20
+         priv_metadata.fmp_last_attempt_version =3D
+-         _metadata.img_entry[IMAGE_0].img_props[_metadata.active_index]=
.version;
++         _metadata.fw_desc.img_entry[IMAGE_0].img_props[_metadata.activ=
e_index].version;
+=20
+         priv_metadata.fmp_last_attempt_status =3D LAST_ATTEMPT_STATUS_E=
RROR_UNSUCCESSFUL;
+=20
+@@ -1229,9 +1279,9 @@ enum fwu_agent_error_t corstone1000_fwu_host_ack(v=
oid)
+         /* firmware update successful */
+=20
+         priv_metadata.fmp_version =3D
+-         _metadata.img_entry[IMAGE_0].img_props[_metadata.active_index]=
.version;
++         _metadata.fw_desc.img_entry[IMAGE_0].img_props[_metadata.activ=
e_index].version;
+         priv_metadata.fmp_last_attempt_version =3D
+-         _metadata.img_entry[IMAGE_0].img_props[_metadata.active_index]=
.version;
++         _metadata.fw_desc.img_entry[IMAGE_0].img_props[_metadata.activ=
e_index].version;
+=20
+         priv_metadata.fmp_last_attempt_status =3D LAST_ATTEMPT_STATUS_S=
UCCESS;
+=20
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index 4777251d..96f805a4 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -31,6 +31,7 @@ SRC_URI:append:corstone1000 =3D " \
     file://0011-Platform-corstone1000-Increase-buffers-for-EFI-vars.patc=
h \
     file://0012-corstone1000-Remove-reset-after-capsule-update.patch \
     file://0013-platform-CS1000-Add-multicore-support-for-FVP.patch \
+    file://0014-Platform-Corstone1000-switch-to-metadata-v2.patch \
     "
=20
 # TF-M ships patches for external dependencies that needs to be applied
--=20
2.25.1


