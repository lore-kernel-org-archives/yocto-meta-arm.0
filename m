Return-Path: <vishnu.banavath@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD742C433FE
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 18:14:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.1098.1642443261619310961
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 17 Jan 2022 10:14:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: vishnu.banavath@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 337906D;
	Mon, 17 Jan 2022 10:14:21 -0800 (PST)
Received: from e125903.cambridge.arm.com (e125903.cambridge.arm.com
 [10.1.195.30])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7DA213F774;
	Mon, 17 Jan 2022 10:14:20 -0800 (PST)
From: vishnu.banavath@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH honister 2/2] arm-bsp/uboot: fix null pointer exception for
 get_image_info
Date: Mon, 17 Jan 2022 18:14:05 +0000
Message-Id: <20220117181405.28504-3-vishnu.banavath@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220117181405.28504-1-vishnu.banavath@arm.com>
References: <20220117181405.28504-1-vishnu.banavath@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 17 Jan 2022 18:14:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2844

From: Vishnu Banavath <vishnu.banavath@arm.com>

This change is to fix NULL pointer exception for get_image_info
API for corstone1000 platform

Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
---
 ...ull-pointer-exception-with-get_image.patch | 60 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0052-efi_loader-fix-null-pointer-exception-with-get_image.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0052-efi_loader-fix-null-pointer-exception-with-get_image.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0052-efi_loader-fix-null-pointer-exception-with-get_image.patch
new file mode 100644
index 0000000..2376418
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0052-efi_loader-fix-null-pointer-exception-with-get_image.patch
@@ -0,0 +1,60 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+From f4d3fcdd4ba747a0fd6875f9626c06ad01b889c7 Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Fri, 14 Jan 2022 15:24:18 +0000
+Subject: [PATCH] efi_loader: fix null pointer exception with get_image_info
+
+get_img_info API implemented for corstone1000 target does not
+check the input attributes and as a result uboot crash's with
+null pointer access. This change is to fix the null pointer
+exception.
+
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+diff --git a/lib/efi_loader/efi_firmware.c b/lib/efi_loader/efi_firmware.c
+index a7f7598eab..d5f4788c8f 100644
+--- a/lib/efi_loader/efi_firmware.c
++++ b/lib/efi_loader/efi_firmware.c
+@@ -344,26 +344,29 @@ static efi_status_t efi_corstone1000_img_info_get (
+ 	int i = 0;
+ 
+ 	*image_info_size = sizeof(*image_info);
+-	*descriptor_version = EFI_FIRMWARE_IMAGE_DESCRIPTOR_VERSION;
+-	*descriptor_count = 1;//dfu_num;
+-	*descriptor_size = sizeof(*image_info);
++	if(descriptor_version)
++	    *descriptor_version = EFI_FIRMWARE_IMAGE_DESCRIPTOR_VERSION;
++	if(descriptor_count)
++	    *descriptor_count = 1;
++	if(descriptor_size)
++	    *descriptor_size = sizeof(*image_info);
+ 	if (package_version)
+ 		*package_version = 0xffffffff; /* not supported */
+ 	if(package_version_name)
+ 		*package_version_name = NULL; /* not supported */
+ 
+ 	if(image_info == NULL) {
+-		log_info("image_info is null\n");
++		log_debug("image_info is null\n");
+ 		return EFI_BUFFER_TOO_SMALL;
+ 	}
+ 
+-	image_info[i].image_index = i;
++	image_info[i].image_index = 1;
+ 	image_info[i].image_type_id = *image_type;
+ 	image_info[i].image_id = 0;
+-	image_info[i].image_id_name = "wic";
+-	image_info[i].version = 1;
++	image_info[i].image_id_name = L"wic image";
++	image_info[i].version = 0;
+ 	image_info[i].version_name = NULL;
+-	image_info[i].size = 0x1000;
++	image_info[i].size = 0;
+ 	image_info[i].attributes_supported = IMAGE_ATTRIBUTE_IMAGE_UPDATABLE |
+ 					     IMAGE_ATTRIBUTE_AUTHENTICATION_REQUIRED;
+ 	image_info[i].attributes_setting = IMAGE_ATTRIBUTE_IMAGE_UPDATABLE;
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index c4a3f6c..88cf595 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -63,6 +63,7 @@ SRC_URI:append:corstone1000 = " \
       file://0049-efi_loader-Fix-loaded-image-alignment.patch \
       file://0050-Comment-mm_communicate-failure-log.patch \
       file://0051-efi_loader-send-bootcomplete-message-to-secure-encla.patch \
+      file://0052-efi_loader-fix-null-pointer-exception-with-get_image.patch \
       "
 
 #
-- 
2.17.1


