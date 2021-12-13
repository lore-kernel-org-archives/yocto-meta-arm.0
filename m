Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCB6BC433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 13:22:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.10835.1639401763786175831
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 05:22:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 216CC1FB;
	Mon, 13 Dec 2021 05:22:43 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.32.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D99953F793;
	Mon, 13 Dec 2021 05:22:41 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 4/4] arm-bsp/u-boot: corstone1000: add the header file for
 invalidate_dcache_all function
Date: Mon, 13 Dec 2021 13:22:27 +0000
Message-Id: <20211213132227.5490-5-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211213132227.5490-1-abdellatif.elkhlifi@arm.com>
References: <20211213132227.5490-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 Dec 2021 13:22:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2641

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

The invalidate_dcache_all function has been implicitly declared.
This commit fixes that.

Change-Id: I83e985e219af8687c0679045f6a979c91923be69
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 ...eader-file-for-invalidate_dcache_all.patch | 32 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-efi_loader-add-the-header-file-for-invalidate_dcache_all.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-efi_loader-add-the-header-file-for-invalidate_dcache_all.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-efi_loader-add-the-header-file-for-invalidate_dcache_all.patch
new file mode 100644
index 0000000..b365cae
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0040-efi_loader-add-the-header-file-for-invalidate_dcache_all.patch
@@ -0,0 +1,32 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+
+From 42676bed67b8f0b87e7b3bc1a7f43afc6f7ba505 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Sat, 11 Dec 2021 21:18:59 +0000
+Subject: [PATCH] efi_loader: add the header file for invalidate_dcache_all
+ function
+
+The invalidate_dcache_all function has been implicitly declared.
+This commit fixes that.
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+---
+ lib/efi_loader/efi_variable_tee.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/efi_loader/efi_variable_tee.c b/lib/efi_loader/efi_variable_tee.c
+index b7de80cd39..bebe2325b8 100644
+--- a/lib/efi_loader/efi_variable_tee.c
++++ b/lib/efi_loader/efi_variable_tee.c
+@@ -22,6 +22,7 @@
+ #if (IS_ENABLED(CONFIG_ARM_FFA_TRANSPORT))
+ 
+ #include <arm_ffa_helper.h>
++#include <cpu_func.h>
+ #include <mapmem.h>
+ 
+ /* MM return codes */
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 57b26a0..c11d3a2 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -49,6 +49,7 @@ SRC_URI:append:corstone1000 = " \
       file://0037-efi_boottime-corstone1000-pass-interface-and-kernel-event-ids-in-w4.patch \
       file://0038-efi_loader-remove-guid-check-from-corstone1000-confi.patch \
       file://0039-arm_ffa-removing-the-cast-when-using-binary-OR-on-FIELD_PREP.patch \
+      file://0040-efi_loader-add-the-header-file-for-invalidate_dcache_all.patch \
       "
 
 #
-- 
2.17.1


