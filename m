Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED5E2C433F5
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 12:40:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.60250.1638189619499210329
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Nov 2021 04:40:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5EFF11D4;
	Mon, 29 Nov 2021 04:40:18 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.2.170])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A0F33F5A1;
	Mon, 29 Nov 2021 04:40:17 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 4/5] arm-bsp/u-boot: corstone1000: adjust the environment and
 heap sizes
Date: Mon, 29 Nov 2021 12:40:01 +0000
Message-Id: <20211129124002.18352-5-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211129124002.18352-1-abdellatif.elkhlifi@arm.com>
References: <20211129124002.18352-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Nov 2021 12:40:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2463

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

env size set to 64 KB
heap size 64 KB + 32 MB

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Change-Id: I913862e855afa8864e91e0a7c0707279b7cbd987
---
 ...djust-the-environment-and-heap-sizes.patch | 34 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-corstone1000-adjust-the-environment-and-heap-sizes.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-corstone1000-adjust-the-environment-and-heap-sizes.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-corstone1000-adjust-the-environment-and-heap-sizes.patch
new file mode 100644
index 0000000..df13beb
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0024-corstone1000-adjust-the-environment-and-heap-sizes.patch
@@ -0,0 +1,34 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+
+From 1617ecbbf163c921468fee224c92a8f79b43e2fb Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Thu, 11 Nov 2021 16:34:54 +0000
+Subject: [PATCH 7/7] corstone1000: adjust the environment and heap sizes
+
+env size set to 64 KB
+heap size 64 KB + 32 MB
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+---
+ include/configs/corstone1000.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/include/configs/corstone1000.h b/include/configs/corstone1000.h
+index 7f8a8ee254..7d63dd4ad9 100644
+--- a/include/configs/corstone1000.h
++++ b/include/configs/corstone1000.h
+@@ -75,8 +75,9 @@
+ /* Default load address for the source command */
+ #define CONFIG_SYS_LOAD_ADDR   (V2M_BASE + 0x10000000)
+ 
++#define CONFIG_ENV_SECT_SIZE		SZ_64K
+ /* Size of malloc() pool */
+-#define CONFIG_SYS_MALLOC_LEN	(CONFIG_ENV_SIZE + (8 << 20))
++#define CONFIG_SYS_MALLOC_LEN	(CONFIG_ENV_SECT_SIZE + SZ_32M)
+ 
+ #define CONFIG_SYS_SDRAM_BASE	PHYS_SDRAM_1
+ 
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 4f0bf8e..f15df9e 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -33,6 +33,7 @@ SRC_URI:append:corstone1000 = " \
       file://0021-arm_ffa-introducing-MM-communication-with-FF-A.patch \
       file://0022-arm_ffa-corstone1000-enable-FF-A-and-MM-support.patch \
       file://0023-efi-corstone1000-introduce-EFI-capsule-update.patch \
+      file://0024-corstone1000-adjust-the-environment-and-heap-sizes.patch \
      "
 
 #
-- 
2.17.1


