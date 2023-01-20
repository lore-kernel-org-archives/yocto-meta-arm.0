Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35AAAC38141
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 14:56:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.76399.1674226613249563458
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 20 Jan 2023 06:56:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D819A14BF
	for <meta-arm@lists.yoctoproject.org>; Fri, 20 Jan 2023 06:57:33 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 30ED43F67D
	for <meta-arm@lists.yoctoproject.org>; Fri, 20 Jan 2023 06:56:52 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/4] arm-bsp/trusted-firmware-m: corstone1000: TFM file clean-ups
Date: Fri, 20 Jan 2023 09:56:44 -0500
Message-Id: <20230120145647.11758-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 20 Jan 2023 14:56:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4306

Remove unnecessary spaces and commented out appends

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../trusted-firmware-m-1.7.0-corstone1000.inc              | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-corstone1000.inc
index 861dcff8..279109e0 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-corstone1000.inc
@@ -6,8 +6,6 @@ TFM_PLATFORM = "arm/corstone1000"
 
 TFM_DEBUG = "1"
 
-
-
 ## Default is the MPS3 board
 TFM_PLATFORM_IS_FVP ?= "FALSE"
 EXTRA_OECMAKE += "-DPLATFORM_IS_FVP=${TFM_PLATFORM_IS_FVP}"
@@ -28,11 +26,6 @@ SRCREV_openamp = "347397decaa43372fc4d00f965640ebde042966d"
 EXTRA_OECMAKE += "-DLIBOPENAMP_SRC_PATH=${S}/../openamp -DLIBOPENAMP_BIN_PATH=${B}/libopenamp-build"
 
 
-# Uncomment to apply patches
-# FILESEXTRAPATHS:prepend := "${THISDIR}/corstone1000:"
-# SRC_URI:append:corstone1000 = " \
-#           "
-
 do_install() {
   install -D -p -m 0644 ${B}/install/outputs/tfm_s_signed.bin ${D}/firmware/tfm_s_signed.bin
   install -D -p -m 0644 ${B}/install/outputs/bl2_signed.bin ${D}/firmware/bl2_signed.bin
-- 
2.17.1


