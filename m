Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6527DC4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 14:55:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.12047.1667573696361666426
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 07:54:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10AB423A;
	Fri,  4 Nov 2022 07:55:02 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DFE423F703;
	Fri,  4 Nov 2022 07:54:54 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 3/3] arm-bsp/trusted-firmware-m: adjust ps assets for corstone1000
Date: Fri,  4 Nov 2022 14:54:46 +0000
Message-Id: <20221104145446.26551-4-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221104145446.26551-1-emekcan.aras@arm.com>
References: <20221104145446.26551-1-emekcan.aras@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 04 Nov 2022 14:55:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4080

From: Rui Miguel Silva <rui.silva@linaro.org>

Enabling ESRT in trusted services increased the need for more
assets at protected storage level, since we now save FMP data
, capsule update, like Image Info as non volatile EFI
variables.

So, just change the default configuration for the corstone1000
to handle this.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 ...ne1000-adjust-PS-asset-configuration.patch | 27 +++++++++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/corstone1000/0007-corstone1000-adjust-PS-asset-configuration.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/corstone1000/0007-corstone1000-adjust-PS-asset-configuration.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/corstone1000/0007-corstone1000-adjust-PS-asset-configuration.patch
new file mode 100644
index 00000000..7fae7b69
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/corstone1000/0007-corstone1000-adjust-PS-asset-configuration.patch
@@ -0,0 +1,27 @@
+From 5be42e1c05205209fc3988f0df30a02da95c2448 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Wed, 2 Nov 2022 00:12:35 +0000
+Subject: [PATCH] corstone1000: adjust PS asset configuration
+
+Adjust protected storage asset configuration to be more inline
+with the one in trusted service side, that would make thinks
+work when testing and using more than the default variables.
+
+Upstream-Status: Pending
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ platform/ext/target/arm/corstone1000/config.cmake | 1 ++
+ 1 file changed, 1 insertions(+)
+
+diff --git a/platform/ext/target/arm/corstone1000/config.cmake b/platform/ext/target/arm/corstone1000/config.cmake
+index ab0fe17ba886..c2b4b646e6b0 100644
+--- a/platform/ext/target/arm/corstone1000/config.cmake
++++ b/platform/ext/target/arm/corstone1000/config.cmake
+@@ -56,3 +56,4 @@ set(PS_ENCRYPTION                           OFF          CACHE BOOL      "Enable
+ set(PS_ROLLBACK_PROTECTION                  OFF          CACHE BOOL      "Enable rollback protection for Protected Storage partition")
+ 
+ set(PLATFORM_SERVICE_OUTPUT_BUFFER_SIZE     256          CACHE STRING    "Size of output buffer in platform service.")
++set(PS_NUM_ASSETS                           "40"        CACHE STRING    "The maximum number of assets to be stored in the Protected Storage area")
+-- 
+2.38.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc
index 341a5942..58ad1032 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc
@@ -34,6 +34,7 @@ SRC_URI:append:corstone1000 = " \
         file://0004-Platform-Partition-Allow-configuration-of-input-and-.patch    \
         file://0005-corstone1000-support-for-UEFI-FMP-image-Information.patch     \
         file://0006-corstone1000-remove-two-partition-configuration.patch         \
+        file://0007-corstone1000-adjust-PS-asset-configuration.patch              \
       "
 
 do_install() {
-- 
2.17.1


