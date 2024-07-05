Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCCE3C3DA42
	for <webhook@archiver.kernel.org>; Fri,  5 Jul 2024 16:06:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20413.1720195603134037966
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 05 Jul 2024 09:06:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6DA0DA7;
	Fri,  5 Jul 2024 09:07:07 -0700 (PDT)
Received: from e126523.arm.com (unknown [10.57.75.169])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 08A683F766;
	Fri,  5 Jul 2024 09:06:41 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH 3/3] arm-bsp/u-boot: corstone1000: use mdata v2
Date: Fri,  5 Jul 2024 18:06:22 +0200
Message-Id: <20240705160622.583987-4-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240705160622.583987-1-bence.balogh@arm.com>
References: <20240705160622.583987-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 05 Jul 2024 16:06:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5867

From: Bence Balogh <bence.balogh@arm.com>

The mdata structure was modified to use the v2 and did the minimal
necessarry changes to make it build without errors. This way the
U-Boot metadata is aligned with the TF-A and TF-M structs.

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 .../u-boot/u-boot-corstone1000.inc            |   1 +
 .../0050-fwu-Use-metadata-v2.patch            | 105 ++++++++++++++++++
 2 files changed, 106 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
050-fwu-Use-metadata-v2.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc b/me=
ta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
index 7d8155d4..427e346f 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
@@ -65,6 +65,7 @@ SRC_URI:append =3D " \
     file://0047-corstone1000-dts-add-external-system-node.patch \
     file://0048-corstone1000-Enable-UEFI-Secure-boot.patch 			  \
     file://0049-corstone1000-Add-secondary-cores-cpu-nodes-for-FVP.patch=
	  \
+    file://0050-fwu-Use-metadata-v2.patch	  \
     "
=20
 do_configure:append() {
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0050-fwu=
-Use-metadata-v2.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1=
000/0050-fwu-Use-metadata-v2.patch
new file mode 100644
index 00000000..4388db44
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0050-fwu-Use-me=
tadata-v2.patch
@@ -0,0 +1,105 @@
+From 54b407fc74c9989c72ab7a571395d8793b409514 Mon Sep 17 00:00:00 2001
+From: Bence Balogh <bence.balogh@arm.com>
+Date: Wed, 3 Jul 2024 16:38:22 +0200
+Subject: [PATCH] fwu: Use metadata v2
+
+The mdata structure was modified to use the v2 and did the minimal
+necessarry changes to make it build without errors. This way the=20
+U-Boot metadata is aligned with the TF-A and TF-M structs.
+
+Upstream-Status: Inappropriate
+[This is done correctly upstream but using the upstream patches would
+require too many backported patches. The merge commit of the upstream
+changes is 7e52d6ccfb76e2afc2d183b357abe2a2e2f948cf.]
+Signed-off-by: Bence Balogh <bence.balogh@arm.com>
+---
+ cmd/fwu_mdata.c       |  2 +-
+ include/fwu_mdata.h   | 17 ++++++++++++++++-
+ lib/fwu_updates/fwu.c |  8 ++++----
+ 3 files changed, 21 insertions(+), 6 deletions(-)
+
+diff --git a/cmd/fwu_mdata.c b/cmd/fwu_mdata.c
+index f04af27de6..73374dca8b 100644
+--- a/cmd/fwu_mdata.c
++++ b/cmd/fwu_mdata.c
+@@ -27,7 +27,7 @@ static void print_mdata(struct fwu_mdata *mdata)
+=20
+ 	printf("\tImage Info\n");
+ 	for (i =3D 0; i < CONFIG_FWU_NUM_IMAGES_PER_BANK; i++) {
+-		img_entry =3D &mdata->img_entry[i];
++		img_entry =3D &mdata->fw_desc.img_entry[i];
+ 		printf("\nImage Type Guid: %pUL\n",
+ 		       &img_entry->image_type_uuid);
+ 		printf("Location Guid: %pUL\n", &img_entry->location_uuid);
+diff --git a/include/fwu_mdata.h b/include/fwu_mdata.h
+index c61221a917..6a0eb7dce9 100644
+--- a/include/fwu_mdata.h
++++ b/include/fwu_mdata.h
+@@ -40,6 +40,16 @@ struct fwu_image_entry {
+ 	struct fwu_image_bank_info img_bank_info[CONFIG_FWU_NUM_BANKS];
+ } __packed;
+=20
++struct fwu_fw_store_desc {
++	uint8_t  num_banks;
++	uint8_t  reserved;
++	uint16_t num_images;
++	uint16_t img_entry_size;
++	uint16_t bank_info_entry_size;
++
++	struct fwu_image_entry img_entry[CONFIG_FWU_NUM_IMAGES_PER_BANK];
++} __packed;
++
+ /**
+  * struct fwu_mdata - FWU metadata structure for multi-bank updates
+  * @crc32: crc32 value for the FWU metadata
+@@ -60,8 +70,13 @@ struct fwu_mdata {
+ 	uint32_t version;
+ 	uint32_t active_index;
+ 	uint32_t previous_active_index;
++	uint32_t metadata_size;
++	uint16_t desc_offset;
++	uint16_t reserved1;
++	uint8_t  bank_state[4];
++	uint32_t reserved2;
+=20
+-	struct fwu_image_entry img_entry[CONFIG_FWU_NUM_IMAGES_PER_BANK];
++	struct fwu_fw_store_desc fw_desc;
+ } __packed;
+=20
+ #endif /* _FWU_MDATA_H_ */
+diff --git a/lib/fwu_updates/fwu.c b/lib/fwu_updates/fwu.c
+index 5313d07302..488c9cc661 100644
+--- a/lib/fwu_updates/fwu.c
++++ b/lib/fwu_updates/fwu.c
+@@ -131,7 +131,7 @@ static int in_trial_state(struct fwu_mdata *mdata)
+ 	struct fwu_image_bank_info *img_bank_info;
+=20
+ 	active_bank =3D mdata->active_index;
+-	img_entry =3D &mdata->img_entry[0];
++	img_entry =3D &mdata->fw_desc.img_entry[0];
+ 	for (i =3D 0; i < CONFIG_FWU_NUM_IMAGES_PER_BANK; i++) {
+ 		img_bank_info =3D &img_entry[i].img_bank_info[active_bank];
+ 		if (!img_bank_info->accepted) {
+@@ -418,8 +418,8 @@ int fwu_get_image_index(u8 *image_index)
+ 	 */
+ 	for (i =3D 0; i < CONFIG_FWU_NUM_IMAGES_PER_BANK; i++) {
+ 		if (!guidcmp(&image_type_id,
+-			     &mdata.img_entry[i].image_type_uuid)) {
+-			img_entry =3D &mdata.img_entry[i];
++			     &mdata.fw_desc.img_entry[i].image_type_uuid)) {
++			img_entry =3D &mdata.fw_desc.img_entry[i];
+ 			img_bank_info =3D &img_entry->img_bank_info[update_bank];
+ 			image_guid =3D &img_bank_info->image_uuid;
+ 			ret =3D fwu_plat_get_alt_num(dev, image_guid, &alt_num);
+@@ -512,7 +512,7 @@ static int fwu_clrset_image_accept(efi_guid_t *img_t=
ype_id, u32 bank, u8 action)
+ 	if (ret)
+ 		return ret;
+=20
+-	img_entry =3D &mdata.img_entry[0];
++	img_entry =3D &mdata.fw_desc.img_entry[0];
+ 	for (i =3D 0; i < CONFIG_FWU_NUM_IMAGES_PER_BANK; i++) {
+ 		if (!guidcmp(&img_entry[i].image_type_uuid, img_type_id)) {
+ 			img_bank_info =3D &img_entry[i].img_bank_info[bank];
+--=20
+2.25.1
+
--=20
2.25.1


