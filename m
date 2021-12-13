Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE751C433FE
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 16:34:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.13476.1639413281780282693
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 08:34:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DD021FB;
	Mon, 13 Dec 2021 08:34:41 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.32.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D0BD3F73B;
	Mon, 13 Dec 2021 08:34:40 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH][HONISTER 2/4] arm-bsp/u-boot: corstone1000: make capsule guid
 check platform agnostic
Date: Mon, 13 Dec 2021 16:34:27 +0000
Message-Id: <20211213163429.2499-3-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211213163429.2499-1-abdellatif.elkhlifi@arm.com>
References: <20211213163429.2499-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 Dec 2021 16:34:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2661

From: Vishnu Banavath <vishnu.banavath@arm.com>

This change is to delete a separate check for guid for corstone1000
target. Generic check of fmp guid check should suffice.

Change-Id: Idec92c9307f903e52985057404daac2e40d05295
Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
---
 ...e-guid-check-from-corstone1000-confi.patch | 62 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-efi_loader-remove-guid-check-from-corstone1000-confi.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-efi_loader-remove-guid-check-from-corstone1000-confi.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-efi_loader-remove-guid-check-from-corstone1000-confi.patch
new file mode 100644
index 0000000..9106c68
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-efi_loader-remove-guid-check-from-corstone1000-confi.patch
@@ -0,0 +1,62 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+From b126e250c2c6f2388fe3f30ee270dc9a891ad3a4 Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Sat, 11 Dec 2021 13:23:55 +0000
+Subject: [PATCH] efi_loader: corstone1000: remove guid check from corstone1000 config option
+
+Use generic fmp guid and no separte check is required for
+CORSTONE1000 target.
+
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+diff --git a/lib/efi_loader/efi_capsule.c b/lib/efi_loader/efi_capsule.c
+index f018c740ab..681470762a 100644
+--- a/lib/efi_loader/efi_capsule.c
++++ b/lib/efi_loader/efi_capsule.c
+@@ -554,18 +554,18 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsule(
+ 			log_err("EFI: A capsule has not enough data\n");
+ 			continue;
+ 		}
++		if (guidcmp(&capsule->capsule_guid,
++			&efi_guid_firmware_management_capsule_id)) {
++			log_err("Unsupported capsule type: %pUl\n", &capsule->capsule_guid);
++			ret = EFI_UNSUPPORTED;
++			goto out;
++		}
+ 
+ 		log_debug("Capsule[%d] (guid:%pUl)\n",
+ 			  i, &capsule->capsule_guid);
+ 
+ #if CONFIG_IS_ENABLED(TARGET_CORSTONE1000)
+ 
+-		if (guidcmp(&corstone1000_capsule_guid, &capsule->capsule_guid)) {
+-			ret = EFI_INVALID_PARAMETER;
+-			log_err("Corstone1000: Invalid capsule GUID\n");
+-			goto out;
+-		}
+-
+ 		if (efi_size_in_pages(capsule->capsule_image_size) >
+ 		    CORSTONE1000_CAPSULE_BUFFER_SIZE) {
+ 			log_err("Corstone1000: Capsule data size exceeds the shared buffer size\n");
+@@ -591,15 +591,7 @@ efi_status_t __efi_runtime EFIAPI efi_update_capsule(
+ 		goto out;
+ 
+ #endif
+-
+-		if (!guidcmp(&capsule->capsule_guid,
+-			     &efi_guid_firmware_management_capsule_id)) {
+-			ret  = efi_capsule_update_firmware(capsule);
+-		} else {
+-			log_err("EFI: not support capsule type: %pUl\n",
+-				&capsule->capsule_guid);
+-			ret = EFI_UNSUPPORTED;
+-		}
++		ret  = efi_capsule_update_firmware(capsule);
+ 
+ 		if (ret != EFI_SUCCESS)
+ 			goto out;
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 81b5697..717128c 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -49,6 +49,7 @@ SRC_URI:append:corstone1000 = " \
       file://0035-Fix-GetVariable-to-handle-0-data-size.patch \
       file://0036-efi_capsule-corstone1000-pass-interface-and-buffer-event-ids-in-w4.patch \
       file://0037-efi_boottime-corstone1000-pass-interface-and-kernel-event-ids-in-w4.patch \
+      file://0038-efi_loader-remove-guid-check-from-corstone1000-confi.patch \
       "
 
 #
-- 
2.17.1


