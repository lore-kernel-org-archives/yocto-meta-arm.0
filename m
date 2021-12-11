Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EFE5C433F5
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 10:08:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.20024.1639217332260258130
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 11 Dec 2021 02:08:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2C25106F;
	Sat, 11 Dec 2021 02:08:51 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.35.244])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 917473F73D;
	Sat, 11 Dec 2021 02:08:50 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Satish Kumar <satish.kumar01@arm.com>
Subject: [PATCH][HONISTER 3/9] arm-bsp/trusted-firmware-m: corstone1000:
 Aligning with TF-M master
Date: Sat, 11 Dec 2021 10:08:31 +0000
Message-Id: <20211211100837.19703-4-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211211100837.19703-1-abdellatif.elkhlifi@arm.com>
References: <20211211100837.19703-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 11 Dec 2021 10:08:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2628

From: Satish Kumar <satish.kumar01@arm.com>

Setting the last master branch SHA.

Change-Id: I668868f991bc090cf0720ac940fe658aa253ed56
Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
---
 .../trusted-firmware-m-corstone1000.inc       | 22 +------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc
index c0f6607..2c363d7 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc
@@ -2,33 +2,13 @@
 
 COMPATIBLE_MACHINE = "(corstone1000)"
 
-FILESEXTRAPATHS:prepend := "${THISDIR}/files/corstone1000:"
-
-SRC_URI:append = " \
-      file://0001-corstone1000-disable-secure-debug-temporarily.patch \
-      file://0002-corstone1000-provision-firmware-update-metadata-fwu.patch \
-      file://0003-corstone1000-parse-the-uefi-firmware-update-capsule.patch \
-      file://0004-corstone1000-add-firmware-update-fwu-agent-into-TF-M.patch \
-      file://0005-corstone1000-implement-corstone1000_fwu_flash_images.patch \
-      file://0006-corstone1000-add-logic-to-select-boot-bank.patch \
-      file://0007-corstone1000-integrate-watchdog-driver.patch \
-      file://0008-corstone1000-impelment-accept-image-logic.patch \
-      file://0009-corstone1000-implement-select-previous-bank-logic.patch \
-      file://0010-corstone1000-implement-corstone1000_fwu_host_ack.patch \
-      file://0011-SPM-multiple-core-initailize-multi-core-communicatio.patch \
-      file://0012-corstone1000-implement-timer-to-track-host-progress.patch \
-      file://0013-corstone1000-fwu-nv-counter-anti-rollback-support.patch \
-      file://0014-corstone1000-bug-fix-in-openamp-version.patch \
-      file://0015-corstone1000-secure-host-watchdog-interrupt-handler.patch \
-"
-
 TFM_DEBUG = "1"
 
 ## Default is the MPS3 board
 TFM_PLATFORM_IS_FVP ?= "FALSE"
 EXTRA_OECMAKE += "-DPLATFORM_IS_FVP=${TFM_PLATFORM_IS_FVP}"
 
-SRCREV_tfm = "a0a266a55b56929cae5f1777e28926b8421492a6"
+SRCREV_tfm = "dc605e057470bb0eb0e92c2aafb443300a90c43f"
 SRCREV_mcuboot = "29099e1d17f93ae1d09fe945ad191b703aacd3d8"
 
 SRCREV_FORMAT = "tfm_mcuboot_tfm-tests_mbedtls"
-- 
2.17.1


