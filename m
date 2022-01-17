Return-Path: <vishnu.banavath@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1EEBC433F5
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 18:14:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1068.1642443260860504553
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 17 Jan 2022 10:14:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: vishnu.banavath@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 499E1101E;
	Mon, 17 Jan 2022 10:14:20 -0800 (PST)
Received: from e125903.cambridge.arm.com (e125903.cambridge.arm.com
 [10.1.195.30])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 923BB3F774;
	Mon, 17 Jan 2022 10:14:19 -0800 (PST)
From: vishnu.banavath@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH honister 1/2] arm-bsp/tf-m: fix capsule instability issue for
 corstone1000
Date: Mon, 17 Jan 2022 18:14:04 +0000
Message-Id: <20220117181405.28504-2-vishnu.banavath@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220117181405.28504-1-vishnu.banavath@arm.com>
References: <20220117181405.28504-1-vishnu.banavath@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 17 Jan 2022 18:14:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2843

From: Vishnu Banavath <vishnu.banavath@arm.com>

This change is to upgrade TF-M to latest git hash which contains
fix for capsule instability issue for corstone1000 platform.

Latest TF-M would also require v3.1 mbedtls. Also updated git hash
for mbedtls repo.
---
 .../trusted-firmware-m-corstone1000.inc            | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc
index 9b0ffdb..98641c2 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc
@@ -8,7 +8,8 @@ TFM_DEBUG = "1"
 TFM_PLATFORM_IS_FVP ?= "FALSE"
 EXTRA_OECMAKE += "-DPLATFORM_IS_FVP=${TFM_PLATFORM_IS_FVP}"
 
-SRCREV_tfm = "ca8c634a3dc15b42d41655a14e512b642320893a"
+SRCREV_tfm = "49a28600f9dd640638f667273ef15acb6d1a8e1c"
+SRCREV_mbedtls = "d65aeb37349ad1a50e0f6c9b694d4b5290d60e49"
 SRCREV_mcuboot = "29099e1d17f93ae1d09fe945ad191b703aacd3d8"
 
 PV = "1.5+git${SRCREV_tfm}"
@@ -23,14 +24,9 @@ do_prepare_recipe_sysroot[depends]+= "virtual/trusted-firmware-a:do_populate_sys
 require trusted-firmware-m-sign-host-images.inc
 
 do_install() {
-  if [ ! -d "${B}/install/outputs/ARM/CORSTONE1000" ]
-  then
-    bbfatal "'${B}/install/outputs/ARM/CORSTONE1000' output folder not found!"
-  fi
-
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


