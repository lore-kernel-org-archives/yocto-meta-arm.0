Return-Path: <gowtham.sureshkumar@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B161CC433EF
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 17:07:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9773.1641316042053377613
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Jan 2022 09:07:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gowtham.sureshkumar@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 596DD13A1;
	Tue,  4 Jan 2022 09:07:21 -0800 (PST)
Received: from e126345.arm.com (unknown [10.57.35.172])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1CC743F774;
	Tue,  4 Jan 2022 09:07:19 -0800 (PST)
From: gowtham.sureshkumar@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
Subject: [PATCH 1/1] arm-bsp/u-boot: corstone1000: Disable mm_communicate
 failure log
Date: Tue,  4 Jan 2022 17:06:51 +0000
Message-Id: <20220104170651.15240-2-gowtham.sureshkumar@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220104170651.15240-1-gowtham.sureshkumar@arm.com>
References: <20220104170651.15240-1-gowtham.sureshkumar@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Jan 2022 17:07:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2783

From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>

When a getVariable() call is made with data size set to 0,
mm_communicate should return EFI_BUFFER_TOO_SMALL. This is
an expected behavior. There should not be any failure logs
in this case. So the error log is commented here.

Change-Id: Id5b36928b1450ef9f83d34a3ab7feb4839ff9734
Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
---
 ...0-Comment-mm_communicate-failure-log.patch | 35 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0050-Comment-mm_communicate-failure-log.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0050-Comment-mm_communicate-failure-log.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0050-Comment-mm_communicate-failure-log.patch
new file mode 100644
index 0000000..9f4b00c
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0050-Comment-mm_communicate-failure-log.patch
@@ -0,0 +1,35 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+
+From 152ff06c983b7b1a685d82bc229efdd6260d9a12 Mon Sep 17 00:00:00 2001
+From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+Date: Fri, 24 Dec 2021 14:22:52 +0000
+Subject: [PATCH] Comment mm_communicate failure log
+
+When a getVariable() call is made with data size set to 0,
+mm_communicate should return EFI_BUFFER_TOO_SMALL. This is
+an expected behavior. There should not be any failure logs
+in this case. So the error log is commented here.
+---
+ lib/efi_loader/efi_variable_tee.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/lib/efi_loader/efi_variable_tee.c b/lib/efi_loader/efi_variable_tee.c
+index b466702983..fc4d684669 100644
+--- a/lib/efi_loader/efi_variable_tee.c
++++ b/lib/efi_loader/efi_variable_tee.c
+@@ -407,7 +407,10 @@ static efi_status_t __efi_runtime mm_communicate(u8 *comm_buf, efi_uintn_t dsize
+ 	ret = ffa_mm_communicate(comm_buf, dsize);
+ 	#endif
+ 	if (ret != EFI_SUCCESS) {
+-		log_err("%s failed!\n", __func__);
++		/* mm_communicate failure is logged even when getVariable() is called
++		 * with data size set to 0. This is not expected so logging is commented.
++		*/
++		//log_err("%s failed!\n", __func__);
+ 		return ret;
+ 	}
+ 
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 51973dd..7762cb6 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -59,6 +59,7 @@ SRC_URI:append:corstone1000 = " \
       file://0047-efi_firmware-add-get_image_info-for-corstone1000.patch \
       file://0048-corstone1000-enable-ethernet-device.patch \
       file://0049-efi_loader-Fix-loaded-image-alignment.patch \
+      file://0050-Comment-mm_communicate-failure-log.patch \
       "
 
 #
-- 
2.17.1


