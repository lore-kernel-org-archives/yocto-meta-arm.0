Return-Path: <vishnu.banavath@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B85CC4332F
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 18:20:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.1184.1642443618635760159
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 17 Jan 2022 10:20:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: vishnu.banavath@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24A25101E;
	Mon, 17 Jan 2022 10:20:18 -0800 (PST)
Received: from e125903.cambridge.arm.com (e125903.cambridge.arm.com
 [10.1.195.30])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 737D03F774;
	Mon, 17 Jan 2022 10:20:17 -0800 (PST)
From: vishnu.banavath@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 1/2] arm-bsp/tf-m: fix capsule instability issue for
 corstone1000
Date: Mon, 17 Jan 2022 18:20:06 +0000
Message-Id: <20220117182007.38178-2-vishnu.banavath@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220117182007.38178-1-vishnu.banavath@arm.com>
References: <20220117182007.38178-1-vishnu.banavath@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 17 Jan 2022 18:20:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2846

From: Vishnu Banavath <vishnu.banavath@arm.com>

This change is to upgrade TF-M to latest git hash which contains
fix for capsule instability issue for corstone1000 platform.

Latest TF-M would also require v3.1 mbedtls. Also updated git hash
for mbedtls repo.
---
 .../trusted-firmware-m-corstone1000.inc                | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc
index f37cf33..c0bce14 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc
@@ -9,7 +9,9 @@ TFM_PLATFORM_IS_FVP ?= "FALSE"
 EXTRA_OECMAKE += "-DPLATFORM_IS_FVP=${TFM_PLATFORM_IS_FVP}"
 
 SRCBRANCH_tfm = "master"
-SRCREV_tfm = "ca8c634a3dc15b42d41655a14e512b642320893a"
+SRCREV_tfm = "49a28600f9dd640638f667273ef15acb6d1a8e1c"
+SRCREV_mbedtls = "d65aeb37349ad1a50e0f6c9b694d4b5290d60e49"
+SRCREV_mcuboot = "29099e1d17f93ae1d09fe945ad191b703aacd3d8"
 
 PV = "1.5.0+git${SRCREV_tfm}"
 SRCREV_FORMAT = "tfm_mcuboot_tfm-tests_mbedtls"
@@ -22,9 +24,9 @@ do_prepare_recipe_sysroot[depends]+= "trusted-firmware-a:do_populate_sysroot"
 require trusted-firmware-m-sign-host-images.inc
 
 do_install() {
-  install -D -p -m 0644 ${B}/install/outputs/ARM/CORSTONE1000/tfm_s_signed.bin ${D}/firmware/tfm_s_signed.bin
-  install -D -p -m 0644 ${B}/install/outputs/ARM/CORSTONE1000/bl2_signed.bin ${D}/firmware/bl2_signed.bin
-  install -D -p -m 0644 ${B}/install/outputs/ARM/CORSTONE1000/bl1.bin ${D}/firmware/bl1.bin
+  install -D -p -m 0644 ${B}/install/outputs/tfm_s_signed.bin ${D}/firmware/tfm_s_signed.bin
+  install -D -p -m 0644 ${B}/install/outputs/bl2_signed.bin ${D}/firmware/bl2_signed.bin
+  install -D -p -m 0644 ${B}/install/outputs/bl1.bin ${D}/firmware/bl1.bin
 
   #
   # Signing TF-A BL2 and the FIP image
-- 
2.17.1


