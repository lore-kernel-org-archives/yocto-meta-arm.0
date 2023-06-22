Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C4CC0015E
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 13:16:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11132.1687439803079335909
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 06:16:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8001C14;
	Thu, 22 Jun 2023 06:17:26 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.194.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D995F3F64C;
	Thu, 22 Jun 2023 06:16:41 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>,
	Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
Subject: [PATCH MICKLEDORE 5/7] arm-bsp/u-boot: corstone1000: Fix u-boot compilation warnings
Date: Thu, 22 Jun 2023 14:16:26 +0100
Message-Id: <20230622131628.11573-6-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230622131628.11573-1-emekcan.aras@arm.com>
References: <20230622131628.11573-1-emekcan.aras@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Jun 2023 13:16:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4830

From: Emekcan Aras <emekcan.aras@arm.com>

From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>

Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
---
 ...ion-warnings-in-fwu_plat_get_bootidx.patch | 47 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  3 +-
 2 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0043-corstone1000-fix-compilation-warnings-in-fwu_plat_get_bootidx.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0043-corstone1000-fix-compilation-warnings-in-fwu_plat_get_bootidx.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0043-corstone1000-fix-compilation-warnings-in-fwu_plat_get_bootidx.patch
new file mode 100644
index 00000000..e574103e
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0043-corstone1000-fix-compilation-warnings-in-fwu_plat_get_bootidx.patch
@@ -0,0 +1,47 @@
+From dfebda98ce08d0cab411521ab3d9e832ed1b4608 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Thu, 15 Jun 2023 16:51:49 +0100
+Subject: [PATCH] corstone1000: fix compilation warnings in
+ fwu_plat_get_bootidx()
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+---
+ board/armltd/corstone1000/corstone1000.c | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/corstone1000/corstone1000.c
+index db508ac3cb..2e1ace5d04 100644
+--- a/board/armltd/corstone1000/corstone1000.c
++++ b/board/armltd/corstone1000/corstone1000.c
+@@ -9,6 +9,7 @@
+ #include <common.h>
+ #include <dm.h>
+ #include <env.h>
++#include <fwu.h>
+ #include <netdev.h>
+ #include <nvmxip.h>
+ #include <part.h>
+@@ -116,7 +117,7 @@ int dram_init_banksize(void)
+ 	return 0;
+ }
+ 
+-void fwu_plat_get_bootidx(int *boot_idx)
++void fwu_plat_get_bootidx(uint *boot_idx)
+ {
+ 	int ret;
+ 
+@@ -127,9 +128,7 @@ void fwu_plat_get_bootidx(int *boot_idx)
+ 	 */
+ 	ret = fwu_get_active_index(boot_idx);
+ 	if (ret < 0)
+-		log_err("corstone1000: failed to read active index\n");
+-
+-	return ret;
++		log_err("corstone1000: failed to read active index err %d\n", ret);
+ }
+ 
+ int board_late_init(void)
+-- 
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index fc51aead..e7521126 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -59,7 +59,8 @@ SRC_URI:append:corstone1000 = " \
         file://0039-corstone1000-set-kernel_addr-based-on-boot_idx.patch		  \ 
         file://0040-corstone1000-boot-index-from-active.patch				  \ 
         file://0041-corstone1000-enable-PSCI-reset.patch				  \
-        file://0042-Enable-EFI-set-get-time-services.patch                                \ 
+        file://0042-Enable-EFI-set-get-time-services.patch                                \
+        file://0043-corstone1000-fix-compilation-warnings-in-fwu_plat_get_bootidx.patch   \ 
         "
 
 #
-- 
2.17.1


