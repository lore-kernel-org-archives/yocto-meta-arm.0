Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9001C433F5
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 11:12:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.24349.1639480371106951016
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 03:12:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBFEF106F;
	Tue, 14 Dec 2021 03:12:50 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.34.32])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BDCCA3F5A1;
	Tue, 14 Dec 2021 03:12:49 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
Subject: [PATCH 1/2] arm-bsp/u-boot: corstone1000: Remove GetVariable() fix
Date: Tue, 14 Dec 2021 11:12:39 +0000
Message-Id: <20211214111240.11186-2-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211214111240.11186-1-abdellatif.elkhlifi@arm.com>
References: <20211214111240.11186-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Dec 2021 11:12:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2699

From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>

The efi_get_var() expects EFI_BUFFER_TOO_SMALL return value
from efi_get_variable_int() to just read the size of the data.
So when comm buffer is smaller than received buffer,
efi_get_variable_int is expected to return error code. This
functionality will be fixed in future patches.

Change-Id: I3e5119b1fdf18c965cc2ebc11056b6ca70d57e0f
Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
---
 ...ix-GetVariable-to-handle-0-data-size.patch | 47 -------------------
 ...nterface-and-buffer-event-ids-in-w4.patch} |  0
 ...nterface-and-kernel-event-ids-in-w4.patch} |  0
 ...-guid-check-from-corstone1000-confi.patch} |  0
 ...-when-using-binary-OR-on-FIELD_PREP.patch} |  0
 ...ader-file-for-invalidate_dcache_all.patch} |  0
 .../recipes-bsp/u-boot/u-boot_%.bbappend      | 11 ++---
 7 files changed, 5 insertions(+), 53 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-Fix-GetVariable-to-handle-0-data-size.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0036-efi_capsule-corstone1000-pass-interface-and-buffer-event-ids-in-w4.patch => 0035-efi_capsule-corstone1000-pass-interface-and-buffer-event-ids-in-w4.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0037-efi_boottime-corstone1000-pass-interface-and-kernel-event-ids-in-w4.patch => 0036-efi_boottime-corstone1000-pass-interface-and-kernel-event-ids-in-w4.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0038-efi_loader-remove-guid-check-from-corstone1000-confi.patch => 0037-efi_loader-remove-guid-check-from-corstone1000-confi.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0039-arm_ffa-removing-the-cast-when-using-binary-OR-on-FIELD_PREP.patch => 0038-arm_ffa-removing-the-cast-when-using-binary-OR-on-FIELD_PREP.patch} (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/{0040-efi_loader-add-the-header-file-for-invalidate_dcache_all.patch => 0039-efi_loader-add-the-header-file-for-invalidate_dcache_all.patch} (100%)

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-Fix-GetVariable-to-handle-0-data-size.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-Fix-GetVariable-to-handle-0-data-size.patch
deleted file mode 100644
index 7b67857..0000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-Fix-GetVariable-to-handle-0-data-size.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-
-From ff2b492bf68337d6cdd296ed61f91304b2da3143 Mon Sep 17 00:00:00 2001
-From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-Date: Tue, 7 Dec 2021 00:26:37 +0000
-Subject: [PATCH] Fix GetVariable() to handle 0 data size
-
-This patch fixes the GetVariable() issue which causes
-mm_communicate failure when called with 0 data size. The comm buffer
-is set to maximum size when 0 data size request is made to handle the
-MM response from the secure world. This is a generic fix but used by
-corstone1000.
-
-Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-
-%% original patch: 0035-corstone1000-Add-support-in-GetVariable-to-handle-re.patch
----
- lib/efi_loader/efi_variable_tee.c | 11 ++++++++---
- 1 file changed, 8 insertions(+), 3 deletions(-)
-
-diff --git a/lib/efi_loader/efi_variable_tee.c b/lib/efi_loader/efi_variable_tee.c
-index 9375aa6a63..b7de80cd39 100644
---- a/lib/efi_loader/efi_variable_tee.c
-+++ b/lib/efi_loader/efi_variable_tee.c
-@@ -637,10 +637,15 @@ efi_status_t efi_get_variable_int(u16 *variable_name, const efi_guid_t *vendor,
- 		goto out;
- 	}
- 
--	/* Trim output buffer size */
-+	/* Set output buffer size to maximum value if data_size is 
-+	 * larger than the supported value or if efi_get_variable_int()
-+	 * is called with data_size set to 0. In the latter case if
-+	 * output buffer is not set to maximum, the comm_buf will be 
-+	 * smaller than the MM response.
-+	 */
- 	tmp_dsize = *data_size;
--	if (name_size + tmp_dsize >
--			max_payload_size - MM_VARIABLE_ACCESS_HEADER_SIZE) {
-+	if ((name_size + tmp_dsize > max_payload_size - MM_VARIABLE_ACCESS_HEADER_SIZE)
-+	    			|| (!tmp_dsize)) {
- 		tmp_dsize = max_payload_size -
- 				MM_VARIABLE_ACCESS_HEADER_SIZE -
- 				name_size;
--- 
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-efi_capsule-corstone1000-pass-interface-and-buffer-event-ids-in-w4.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-efi_capsule-corstone1000-pass-interface-and-buffer-event-ids-in-w4.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-efi_capsule-corstone1000-pass-interface-and-buffer-event-ids-in-w4.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-efi_capsule-corstone1000-pass-interface-and-buffer-event-ids-in-w4.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-efi_boottime-corstone1000-pass-interface-and-kernel-event-ids-in-w4.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-efi_boottime-corstone1000-pass-interface-and-kernel-event-ids-in-w4.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-efi_boottime-corstone1000-pass-interface-and-kernel-event-ids-in-w4.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0036-efi_boottime-corstone1000-pass-interface-and-kernel-event-ids-in-w4.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-efi_loader-remove-guid-check-from-corstone1000-confi.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-efi_loader-remove-guid-check-from-corstone1000-confi.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-efi_loader-remove-guid-check-from-corstone1000-confi.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-efi_loader-remove-guid-check-from-corstone1000-confi.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-arm_ffa-removing-the-cast-when-using-binary-OR-on-FIELD_PREP.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-arm_ffa-removing-the-cast-when-using-binary-OR-on-FIELD_PREP.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-arm_ffa-removing-the-cast-when-using-binary-OR-on-FIELD_PREP.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-arm_ffa-removing-the-cast-when-using-binary-OR-on-FIELD_PREP.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-efi_loader-add-the-header-file-for-invalidate_dcache_all.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-efi_loader-add-the-header-file-for-invalidate_dcache_all.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-efi_loader-add-the-header-file-for-invalidate_dcache_all.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-efi_loader-add-the-header-file-for-invalidate_dcache_all.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index c11d3a2..77c0904 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -44,12 +44,11 @@ SRC_URI:append:corstone1000 = " \
       file://0032-arm-corstone1000-identify-which-bank-to-load-kernel.patch \
       file://0033-corstone1000-dts-setting-the-boot-console-output.patch \
       file://0034-corstone1000-dts-remove-the-use-of-fdt_addr_r.patch \
-      file://0035-Fix-GetVariable-to-handle-0-data-size.patch \
-      file://0036-efi_capsule-corstone1000-pass-interface-and-buffer-event-ids-in-w4.patch \
-      file://0037-efi_boottime-corstone1000-pass-interface-and-kernel-event-ids-in-w4.patch \
-      file://0038-efi_loader-remove-guid-check-from-corstone1000-confi.patch \
-      file://0039-arm_ffa-removing-the-cast-when-using-binary-OR-on-FIELD_PREP.patch \
-      file://0040-efi_loader-add-the-header-file-for-invalidate_dcache_all.patch \
+      file://0035-efi_capsule-corstone1000-pass-interface-and-buffer-event-ids-in-w4.patch \
+      file://0036-efi_boottime-corstone1000-pass-interface-and-kernel-event-ids-in-w4.patch \
+      file://0037-efi_loader-remove-guid-check-from-corstone1000-confi.patch \
+      file://0038-arm_ffa-removing-the-cast-when-using-binary-OR-on-FIELD_PREP.patch \
+      file://0039-efi_loader-add-the-header-file-for-invalidate_dcache_all.patch \
       "
 
 #
-- 
2.17.1


