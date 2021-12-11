Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F0F7C433F5
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 10:08:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.20023.1639217330699295526
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 11 Dec 2021 02:08:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 436F7106F;
	Sat, 11 Dec 2021 02:08:50 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.35.244])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 35EC53F73D;
	Sat, 11 Dec 2021 02:08:49 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH][HONISTER 2/9] arm-bsp/u-boot: corstone1000: remove the use of
 fdt_addr_r
Date: Sat, 11 Dec 2021 10:08:30 +0000
Message-Id: <20211211100837.19703-3-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211211100837.19703-1-abdellatif.elkhlifi@arm.com>
References: <20211211100837.19703-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 11 Dec 2021 10:08:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2627

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

The device tree is embedded in the u-boot binary
and located at the end of the DDR. Its address
is specified in fdtcontroladdr environment variable.

No need to use fdt_addr_r anymore.

Change-Id: I58b17fbcab36c7236d57eb2498c41b5f4960b6eb
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 ...000-dts-remove-the-use-of-fdt_addr_r.patch | 34 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0034-corstone1000-dts-remove-the-use-of-fdt_addr_r.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0034-corstone1000-dts-remove-the-use-of-fdt_addr_r.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0034-corstone1000-dts-remove-the-use-of-fdt_addr_r.patch
new file mode 100644
index 0000000..edb8962
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0034-corstone1000-dts-remove-the-use-of-fdt_addr_r.patch
@@ -0,0 +1,34 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+
+From 871521cf90dabb1634af4e47cdf198f979f1907d Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Mon, 6 Dec 2021 15:53:56 +0000
+Subject: [PATCH] corstone1000: dts: remove the use of fdt_addr_r
+
+The device tree is embedded in the u-boot binary
+and located at the end of the DDR. Its address
+is specified in fdtcontroladdr environment variable.
+
+No need to use fdt_addr_r anymore.
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+---
+ include/configs/corstone1000.h | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/include/configs/corstone1000.h b/include/configs/corstone1000.h
+index 7c6f66c891..31fc0cb29e 100644
+--- a/include/configs/corstone1000.h
++++ b/include/configs/corstone1000.h
+@@ -96,7 +96,6 @@
+ #define CONFIG_EXTRA_ENV_SETTINGS				\
+ 				BOOTENV                         \
+ 				"usb_pgood_delay=250\0"         \
+-				"fdt_addr_r=0x82000000\0"		\
+ 				"boot_bank_flag=0x08002000\0"		\
+ 				"kernel_addr_bank_0=0x083EE000\0"			\
+ 				"kernel_addr_bank_1=0x0936E000\0"			\
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 3c73496..759cfd8 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -45,6 +45,7 @@ SRC_URI:append:corstone1000 = " \
       file://0031-corstone1000-change-base-address-of-kernel-in-the-fl.patch \
       file://0032-arm-corstone1000-identify-which-bank-to-load-kernel.patch \
       file://0033-corstone1000-dts-setting-the-boot-console-output.patch \
+      file://0034-corstone1000-dts-remove-the-use-of-fdt_addr_r.patch \
       "
 
 #
-- 
2.17.1


