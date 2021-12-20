Return-Path: <xueliang.zhong@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B74EFC433F5
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 14:25:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.5784.1640010317966125539
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Dec 2021 06:25:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: xueliang.zhong@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 985D0106F;
	Mon, 20 Dec 2021 06:25:17 -0800 (PST)
Received: from cassini-wfh-server-1.stack04.eu02.mi.arm.com (unknown
 [10.58.246.234])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E45EA3F718;
	Mon, 20 Dec 2021 06:25:16 -0800 (PST)
From: xueliang.zhong@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH honister 4/4] arm-bsp/u-boot: populate ESRT table with
 image_info
Date: Mon, 20 Dec 2021 14:25:05 +0000
Message-Id: <20211220142505.30331-5-xueliang.zhong@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211220142505.30331-1-xueliang.zhong@arm.com>
References: <20211220142505.30331-1-xueliang.zhong@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 20 Dec 2021 14:25:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2741

From: Vishnu Banavath <vishnu.banavath@arm.com>

These changes are to support populating corstone1000 image_info
to ESRT table

Change-Id: I6e5cdd8a3477fbf3c480bf7a725198841ed79796
Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
---
 ...config-enable-CAPSULE_FIRMWARE_RAW-c.patch |  31 +++++
 ...ate-ESRT-table-if-EFI_ESRT-config-op.patch |  38 ++++++
 ...-add-get_image_info-for-corstone1000.patch | 119 ++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   3 +
 4 files changed, 191 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0045-corstone1000-defconfig-enable-CAPSULE_FIRMWARE_RAW-c.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0046-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0047-efi_firmware-add-get_image_info-for-corstone1000.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0045-corstone1000-defconfig-enable-CAPSULE_FIRMWARE_RAW-c.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0045-corstone1000-defconfig-enable-CAPSULE_FIRMWARE_RAW-c.patch
new file mode 100644
index 0000000..f9e7914
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0045-corstone1000-defconfig-enable-CAPSULE_FIRMWARE_RAW-c.patch
@@ -0,0 +1,31 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+From 4820222f24901fbed8e0a87487603c0e06dfff5a Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Fri, 17 Dec 2021 19:46:52 +0000
+Subject: [PATCH 1/3] corstone1000/defconfig: enable CAPSULE_FIRMWARE_RAW
+ config option
+
+This change is to enable CAPSULE_FIRMWARE_RAW config option as
+we use RAW image on corstone1000 target. Also, disable
+CONFIG_EFI_CAPSULE_FIRMWARE_FIT
+
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+---
+ configs/corstone1000_defconfig | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defconfig
+index e11ffbfc89..d576ee1b67 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -65,3 +65,5 @@ CONFIG_EFI_SET_TIME=y
+ CONFIG_RTC_EMULATION=y
+ CONFIG_PSCI_RESET=y
+ CONFIG_DISTRO_DEFAULTS=y
++CONFIG_EFI_CAPSULE_FIRMWARE_RAW=y
++# CONFIG_EFI_CAPSULE_FIRMWARE_FIT is not set
+-- 
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0046-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0046-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch
new file mode 100644
index 0000000..f29104d
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0046-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch
@@ -0,0 +1,38 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+From b9126620d74aed1a0ddd286e4c70344626dd72c3 Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Fri, 17 Dec 2021 19:49:02 +0000
+Subject: [PATCH 2/3] efi_loader: populate ESRT table if EFI_ESRT config option
+ is set
+
+This change is to call efi_esrt_populate function if CONFIG_EFI_ESRT
+is set. This will populte esrt table with firmware image info
+
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+---
+ lib/efi_loader/efi_capsule.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
+index ec89865c98..00b3b21105 100644
+--- a/lib/efi_loader/efi_capsule.c
++++ b/lib/efi_loader/efi_capsule.c
+@@ -591,6 +591,13 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsule(
+ 			ret = EFI_SUCCESS;
+ 		}
+ 
++		if (IS_ENABLED(CONFIG_EFI_ESRT)) {
++			/* Rebuild the ESRT to reflect any updated FW images. */
++			ret = efi_esrt_populate();
++	               if (ret != EFI_SUCCESS)
++				log_warning("EFI Capsule: failed to update ESRT\n");
++	       }
++
+ 		goto out;
+ 
+ #endif
+-- 
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0047-efi_firmware-add-get_image_info-for-corstone1000.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0047-efi_firmware-add-get_image_info-for-corstone1000.patch
new file mode 100644
index 0000000..b401585
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0047-efi_firmware-add-get_image_info-for-corstone1000.patch
@@ -0,0 +1,119 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+From 6a3f1d425321545869f00295d9173e3a3519a6c6 Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Fri, 17 Dec 2021 19:50:25 +0000
+Subject: [PATCH] efi_firmware: add get_image_info for corstone1000
+
+This change is to populate get_image_info which eventually
+will be populated in ESRT table
+
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+%% original patch: 0047-efi_firmware-add-get_image_info-for-corstone1000.patch
+
+diff --git a/lib/efi_loader/efi_firmware.c b/lib/efi_loader/efi_firmware.c
+index a1b88dbfc2..85fb5254eb 100644
+--- a/lib/efi_loader/efi_firmware.c
++++ b/lib/efi_loader/efi_firmware.c
+@@ -238,6 +238,7 @@ const efi_guid_t efi_firmware_image_type_uboot_fit =
+  *
+  * Return		status code
+  */
++
+ static
+ efi_status_t EFIAPI efi_firmware_fit_get_image_info(
+ 	struct efi_firmware_management_protocol *this,
+@@ -329,6 +330,56 @@ const struct efi_firmware_management_protocol efi_fmp_fit = {
+ const efi_guid_t efi_firmware_image_type_uboot_raw =
+ 	EFI_FIRMWARE_IMAGE_TYPE_UBOOT_RAW_GUID;
+ 
++#if CONFIG_IS_ENABLED(TARGET_CORSTONE1000)
++static efi_status_t efi_corstone1000_img_info_get (
++	efi_uintn_t *image_info_size,
++	struct efi_firmware_image_descriptor *image_info,
++	u32 *descriptor_version,
++	u8 *descriptor_count,
++	efi_uintn_t *descriptor_size,
++	u32 *package_version,
++	u16 **package_version_name,
++	const efi_guid_t *image_type)
++{
++	int i = 0;
++
++	*image_info_size = sizeof(*image_info);
++	*descriptor_version = EFI_FIRMWARE_IMAGE_DESCRIPTOR_VERSION;
++	*descriptor_count = 1;//dfu_num;
++	*descriptor_size = sizeof(*image_info);
++	if (package_version)
++		*package_version = 0xffffffff; /* not supported */
++	if(package_version_name)
++		*package_version_name = NULL; /* not supported */
++
++	if(image_info == NULL) {
++		log_warning("image_info is null\n");
++		return EFI_BUFFER_TOO_SMALL;
++	}
++
++	image_info[i].image_index = i;
++	image_info[i].image_type_id = *image_type;
++	image_info[i].image_id = 0;
++	image_info[i].image_id_name = "wic";
++	image_info[i].version = 1;
++	image_info[i].version_name = NULL;
++	image_info[i].size = 0x1000;
++	image_info[i].attributes_supported = IMAGE_ATTRIBUTE_IMAGE_UPDATABLE |
++					     IMAGE_ATTRIBUTE_AUTHENTICATION_REQUIRED;
++	image_info[i].attributes_setting = IMAGE_ATTRIBUTE_IMAGE_UPDATABLE;
++	/* Check if the capsule authentication is enabled */
++	if (IS_ENABLED(CONFIG_EFI_CAPSULE_AUTHENTICATE))
++		image_info[0].attributes_setting |=
++			IMAGE_ATTRIBUTE_AUTHENTICATION_REQUIRED;
++	image_info[i].lowest_supported_image_version = 0;
++	image_info[i].last_attempt_version = 0;
++	image_info[i].last_attempt_status = LAST_ATTEMPT_STATUS_SUCCESS;
++	image_info[i].hardware_instance = 1;
++	image_info[i].dependencies = NULL;
++
++	return EFI_SUCCESS;
++}
++#endif
+ /**
+  * efi_firmware_raw_get_image_info - return information about the current
+ 				     firmware image
+@@ -373,12 +424,20 @@ efi_status_t EFIAPI efi_firmware_raw_get_image_info(
+ 	     !descriptor_size || !package_version || !package_version_name))
+ 		return EFI_EXIT(EFI_INVALID_PARAMETER);
+ 
+-	ret = efi_get_dfu_info(image_info_size, image_info,
++#if CONFIG_IS_ENABLED(TARGET_CORSTONE1000)
++	ret = efi_corstone1000_img_info_get(image_info_size, image_info,
+ 			       descriptor_version, descriptor_count,
+ 			       descriptor_size,
+ 			       package_version, package_version_name,
+ 			       &efi_firmware_image_type_uboot_raw);
++#else
+ 
++	ret = efi_get_dfu_info(image_info_size, image_info,
++			       descriptor_version, descriptor_count,
++			       descriptor_size,
++			       package_version, package_version_name,
++			       &efi_firmware_image_type_uboot_raw);
++#endif
+ 	return EFI_EXIT(ret);
+ }
+ 
+@@ -459,6 +518,9 @@ efi_status_t EFIAPI efi_firmware_raw_set_image(
+ 
+ 	}
+ 
++#if CONFIG_IS_ENABLED(TARGET_CORSTONE1000)
++	return EFI_EXIT(EFI_SUCCESS);
++#endif
+ 	if (dfu_write_by_alt(image_index - 1, (void *)image, image_size,
+ 			     NULL, NULL))
+ 		return EFI_EXIT(EFI_DEVICE_ERROR);
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 8b65082..4f7f477 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -56,6 +56,9 @@ SRC_URI:append:corstone1000 = " \
       file://0042-Update-comm_buf-when-EFI_BUFFER_TOO_SMALL.patch \
       file://0043-Disable-DHCP-PING-config-parameters.patch \
       file://0044-Revert-corstone1000-Disable-set-get-of-NV-variables.patch \
+      file://0045-corstone1000-defconfig-enable-CAPSULE_FIRMWARE_RAW-c.patch \
+      file://0046-efi_loader-populate-ESRT-table-if-EFI_ESRT-config-op.patch \
+      file://0047-efi_firmware-add-get_image_info-for-corstone1000.patch \
       "
 
 #
-- 
2.17.1


