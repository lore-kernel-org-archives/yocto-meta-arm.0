Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B07DAC433FE
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 16:31:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.13569.1639413080244320523
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 08:31:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D22E71FB;
	Mon, 13 Dec 2021 08:31:19 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.32.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 95FAD3F73B;
	Mon, 13 Dec 2021 08:31:18 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
Subject: [PATCH][HONISTER 5/7] arm-bsp/u-boot: corstone1000: Fix GetVariable
 data size issue
Date: Mon, 13 Dec 2021 16:31:00 +0000
Message-Id: <20211213163102.1039-6-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211213163102.1039-1-abdellatif.elkhlifi@arm.com>
References: <20211213163102.1039-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 Dec 2021 16:31:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2656

From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>

This patch fixes the GetVariable() issue which causes
mm_communicate failure when called with 0 data size. The comm buffer
is set to maximum size when 0 data size request is made to handle the
MM response from the secure world. This is a generic fix but used by
corstone1000.

Change-Id: Id50619816a924b4fa7597295f89d54827191fbb5
Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
---
 ...ix-GetVariable-to-handle-0-data-size.patch | 47 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-Fix-GetVariable-to-handle-0-data-size.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-Fix-GetVariable-to-handle-0-data-size.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-Fix-GetVariable-to-handle-0-data-size.patch
new file mode 100644
index 0000000..7b67857
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0035-Fix-GetVariable-to-handle-0-data-size.patch
@@ -0,0 +1,47 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+
+From ff2b492bf68337d6cdd296ed61f91304b2da3143 Mon Sep 17 00:00:00 2001
+From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+Date: Tue, 7 Dec 2021 00:26:37 +0000
+Subject: [PATCH] Fix GetVariable() to handle 0 data size
+
+This patch fixes the GetVariable() issue which causes
+mm_communicate failure when called with 0 data size. The comm buffer
+is set to maximum size when 0 data size request is made to handle the
+MM response from the secure world. This is a generic fix but used by
+corstone1000.
+
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+
+%% original patch: 0035-corstone1000-Add-support-in-GetVariable-to-handle-re.patch
+---
+ lib/efi_loader/efi_variable_tee.c | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/lib/efi_loader/efi_variable_tee.c b/lib/efi_loader/efi_variable_tee.c
+index 9375aa6a63..b7de80cd39 100644
+--- a/lib/efi_loader/efi_variable_tee.c
++++ b/lib/efi_loader/efi_variable_tee.c
+@@ -637,10 +637,15 @@ efi_status_t efi_get_variable_int(u16 *variable_name, const efi_guid_t *vendor,
+ 		goto out;
+ 	}
+ 
+-	/* Trim output buffer size */
++	/* Set output buffer size to maximum value if data_size is 
++	 * larger than the supported value or if efi_get_variable_int()
++	 * is called with data_size set to 0. In the latter case if
++	 * output buffer is not set to maximum, the comm_buf will be 
++	 * smaller than the MM response.
++	 */
+ 	tmp_dsize = *data_size;
+-	if (name_size + tmp_dsize >
+-			max_payload_size - MM_VARIABLE_ACCESS_HEADER_SIZE) {
++	if ((name_size + tmp_dsize > max_payload_size - MM_VARIABLE_ACCESS_HEADER_SIZE)
++	    			|| (!tmp_dsize)) {
+ 		tmp_dsize = max_payload_size -
+ 				MM_VARIABLE_ACCESS_HEADER_SIZE -
+ 				name_size;
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 759cfd8..ae34e58 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -46,6 +46,7 @@ SRC_URI:append:corstone1000 = " \
       file://0032-arm-corstone1000-identify-which-bank-to-load-kernel.patch \
       file://0033-corstone1000-dts-setting-the-boot-console-output.patch \
       file://0034-corstone1000-dts-remove-the-use-of-fdt_addr_r.patch \
+      file://0035-Fix-GetVariable-to-handle-0-data-size.patch \
       "
 
 #
-- 
2.17.1


