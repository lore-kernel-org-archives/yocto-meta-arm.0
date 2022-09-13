Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C66C6FA89
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 12:57:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.4332.1663073845060104330
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 05:57:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24662106F;
	Tue, 13 Sep 2022 05:57:30 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com
 [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 16E653F73D;
	Tue, 13 Sep 2022 05:57:22 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan <emekcan.aras@arm.com>
Subject: [PATCH 1/2] arm-bsp/u-boot: Add external system driver to u-boot
 device tree
Date: Tue, 13 Sep 2022 13:57:10 +0100
Message-Id: <20220913125711.26811-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220913125711.26811-1-emekcan.aras@arm.com>
References: <20220913125711.26811-1-emekcan.aras@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 13 Sep 2022 12:57:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3775

From: Emekcan <emekcan.aras@arm.com>

Corstone1000 needs a kernel driver to control the
external system (turn on/off, reset). This commit
adds the external system driver binding to the
u-boot device tree for corstone1000.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 ...e-external-sys-driver-to-device-tree.patch | 37 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-Introduce-external-sys-driver-to-device-tree.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-Introduce-external-sys-driver-to-device-tree.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-Introduce-external-sys-driver-to-device-tree.patch
new file mode 100644
index 00000000..cc4ab0a3
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0026-Introduce-external-sys-driver-to-device-tree.patch
@@ -0,0 +1,37 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+
+From 83f16fe96a86b00f7a4b7c4c4f7416119b80eddd Mon Sep 17 00:00:00 2001
+From: Emekcan <emekcan.aras@arm.com>
+Date: Fri, 19 Aug 2022 16:04:48 +0100
+Subject: [PATCH] Introduce external sys driver to device-tree
+
+It adds external sys driver binding to u-boot
+device tree.
+
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+---
+ arch/arm/dts/corstone1000.dtsi | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/arch/arm/dts/corstone1000.dtsi b/arch/arm/dts/corstone1000.dtsi
+index d0194aa893..19b6e3ea72 100644
+--- a/arch/arm/dts/corstone1000.dtsi
++++ b/arch/arm/dts/corstone1000.dtsi
+@@ -160,6 +160,13 @@
+ 			secure-status = "okay";     /* secure-world-only */
+ 			status = "disabled";
+ 		};
++
++		extsys0: extsys@1A010310 {
++			compatible = "arm,extsys_ctrl";
++			reg = <0x1A010310 0x4>,
++			      <0x1A010314 0X4>;
++			reg-names = "rstreg", "streg";
++		};
+ 	};
+ 
+ 	arm_ffa: arm_ffa {
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index a0a72845..3c316f30 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -43,6 +43,7 @@ SRC_URI:append:corstone1000 = " \
         file://0023-efi_loader-fix-null-pointer-exception-with-get_image.patch \
         file://0024-arm-corstone1000-add-mmc-for-fvp.patch \
         file://0025-corstone1000-use-a-compressed-kernel.patch \
+        file://0026-Introduce-external-sys-driver-to-device-tree.patch \
       "
 
 #
-- 
2.17.1


