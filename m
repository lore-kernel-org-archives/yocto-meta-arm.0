Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AD6CC77B61
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 15:39:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.54686.1682350745401378990
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Apr 2023 08:39:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB085D75;
	Mon, 24 Apr 2023 08:39:48 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.194.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F20393F64C;
	Mon, 24 Apr 2023 08:39:03 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 1/1] arm-bsp/trusted-firmware-m: Increase assets number for corstone1000
Date: Mon, 24 Apr 2023 16:38:59 +0100
Message-Id: <20230424153859.18557-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230424153859.18557-1-emekcan.aras@arm.com>
References: <20230424153859.18557-1-emekcan.aras@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Apr 2023 15:39:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4613

From: Emekcan Aras <emekcan.aras@arm.com>

Enabling new features on tfm for corstone1000 increases the number of
ITS and PS assets needed. This patch increases the number of PS and ITS
assets and fixes regression on psa-ps-api-tests.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 ...rstone1000-Increase-number-of-assets.patch | 36 +++++++++++++++++++
 .../trusted-firmware-m-1.7.0-corstone1000.inc |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0012-Platform-corstone1000-Increase-number-of-assets.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0012-Platform-corstone1000-Increase-number-of-assets.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0012-Platform-corstone1000-Increase-number-of-assets.patch
new file mode 100644
index 00000000..d2fc332d
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0012-Platform-corstone1000-Increase-number-of-assets.patch
@@ -0,0 +1,36 @@
+From 34263d1ea99da7b8a680a80601a73149bc9530e5 Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Fri, 21 Apr 2023 15:17:21 +0100
+Subject: [PATCH] Platform: corstone1000: Increase number of assets
+
+As Corstone1000 stores at boot time few efi variables.
+Therefore, number of assets is increased to compansate this early usage.
+
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/trusted-firmware-m/+/20656]
+Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+Change-Id: Id8555a09335ce13b80c07a33c4d913f5cb0f9084
+---
+ platform/ext/target/arm/corstone1000/config_tfm_target.h | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/platform/ext/target/arm/corstone1000/config_tfm_target.h b/platform/ext/target/arm/corstone1000/config_tfm_target.h
+index bf8d2f95f..e96836663 100644
+--- a/platform/ext/target/arm/corstone1000/config_tfm_target.h
++++ b/platform/ext/target/arm/corstone1000/config_tfm_target.h
+@@ -16,4 +16,12 @@
+ #undef PLATFORM_SERVICE_OUTPUT_BUFFER_SIZE
+ #define PLATFORM_SERVICE_OUTPUT_BUFFER_SIZE    256
+
++/* The maximum number of assets to be stored in the Internal Trusted Storage. */
++#undef ITS_NUM_ASSETS
++#define ITS_NUM_ASSETS       20
++
++/* The maximum number of assets to be stored in the Protected Storage area. */
++#undef PS_NUM_ASSETS
++#define PS_NUM_ASSETS        20
++
+ #endif /* __CONFIG_TFM_TARGET_H__ */
+--
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-corstone1000.inc
index 06e15307..68845cf9 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-corstone1000.inc
@@ -47,6 +47,7 @@ SRC_URI:append:corstone1000 = " \
     file://0009-Platform-corstone1000-fix-flash-reading-issue-for-fi.patch      \
     file://0010-Platform-corstone1000-Adds-compiler-flags-to-FWU-age.patch      \
     file://0011-Platform-corstone1000-adjust-PS-asset-configuration.patch       \
+    file://0012-Platform-corstone1000-Increase-number-of-assets.patch           \
     file://corstone1000/rwx.patch                                               \
     "
 
-- 
2.17.1


