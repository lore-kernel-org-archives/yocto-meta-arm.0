Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F5CCC433F5
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 19:19:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.16473.1639077588050075233
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 11:19:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 574D711FB;
	Thu,  9 Dec 2021 11:19:47 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.6.225])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2FC1E3F73B;
	Thu,  9 Dec 2021 11:19:46 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 1/9] arm-bsp/u-boot: corstone1000: setting the boot console
 output
Date: Thu,  9 Dec 2021 19:19:27 +0000
Message-Id: <20211209191935.26017-2-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211209191935.26017-1-abdellatif.elkhlifi@arm.com>
References: <20211209191935.26017-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 09 Dec 2021 19:19:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2589

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Setting stdout-path in the chosen node.

Change-Id: Ie0a6b140492f0c5fc323690d2f6bc921cbe76cb3
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 ...-dts-setting-the-boot-console-output.patch | 33 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0033-corstone1000-dts-setting-the-boot-console-output.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0033-corstone1000-dts-setting-the-boot-console-output.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0033-corstone1000-dts-setting-the-boot-console-output.patch
new file mode 100644
index 0000000..39e9a5e
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0033-corstone1000-dts-setting-the-boot-console-output.patch
@@ -0,0 +1,33 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+
+From d26f38e9b677ddbfa4e92e250058630ecd275908 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Mon, 6 Dec 2021 14:46:06 +0000
+Subject: [PATCH] corstone1000: dts: setting the boot console output
+
+Setting stdout-path in the chosen node.
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+---
+ arch/arm/dts/corstone1000.dtsi | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/arch/arm/dts/corstone1000.dtsi b/arch/arm/dts/corstone1000.dtsi
+index 0ea3a19698..88fb1576b9 100644
+--- a/arch/arm/dts/corstone1000.dtsi
++++ b/arch/arm/dts/corstone1000.dtsi
+@@ -12,7 +12,9 @@
+ 	#address-cells = <1>;
+ 	#size-cells = <1>;
+ 
+-	chosen { };
++	chosen {
++		stdout-path = "/uart@1a510000:115200n8";
++	};
+ 
+ 	cpus {
+ 		#address-cells = <1>;
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 2445525..e8e0e95 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -42,6 +42,7 @@ SRC_URI:append:corstone1000 = " \
       file://0030-arm-bsp-u-boot-corstone1000-Implement-autoboot-script.patch \
       file://0031-corstone1000-change-base-address-of-kernel-in-the-fl.patch \
       file://0032-arm-corstone1000-identify-which-bank-to-load-kernel.patch \
+      file://0033-corstone1000-dts-setting-the-boot-console-output.patch \
       "
 
 #
-- 
2.17.1


