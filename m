Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A861DC433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 19:23:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.16291.1639077795662555854
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 11:23:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DC1CD6E;
	Thu,  9 Dec 2021 11:23:15 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.6.225])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A3E33F73B;
	Thu,  9 Dec 2021 11:23:13 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH][HONISTER 4/8] arm-bsp/secure-partitions: corstone1000: add
 mbed-crypto and nanopb to platform code
Date: Thu,  9 Dec 2021 19:22:56 +0000
Message-Id: <20211209192300.29211-5-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211209192300.29211-1-abdellatif.elkhlifi@arm.com>
References: <20211209192300.29211-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 09 Dec 2021 19:23:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2603

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Moving dependencies to the BSP.

Change-Id: I32abd6c0568030550dda0442a2a4f624967b561c
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../trusted-services/ts-corstone1000.inc        | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
index 3fcdf82..36e2da4 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
@@ -2,8 +2,13 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/secure-partitions:"
 
 COMPATIBLE_MACHINE = "corstone1000"
 
-SRCREV_ts = "882a2db4f9181fc6ddb505b82262f82e5a0c2fd5"
-SRC_URI:append = " file://0001-tools-cmake-common-applying-lowercase-project-convention.patch \
+LIC_FILES_CHKSUM += "file://../mbedcrypto/LICENSE;md5=302d50a6369f5f22efdb674db908167a \
+                                             file://../nanopb/LICENSE.txt;md5=9db4b73a55a3994384112efcdb37c01f"
+
+
+SRC_URI:append = " \
+                 ${SRC_URI_MBED} ${SRC_URI_NANOPB} \
+                  file://0001-tools-cmake-common-applying-lowercase-project-convention.patch \
                   file://0002-fix-EARLY_TA_PATHS-env-variable.patch \
                   file://0003-se-proxy-dts-add-se-proxy-as-child-node.patch \
                   file://0004-Update-mm-comm-buffer-region-in-dts-file.patch \
@@ -11,6 +16,14 @@ SRC_URI:append = " file://0001-tools-cmake-common-applying-lowercase-project-con
                   file://0006-Use-device-region.patch \
 		  "
 
+SRCREV_ts = "882a2db4f9181fc6ddb505b82262f82e5a0c2fd5"
+
+SRC_URI_MBED = "git://github.com/ARMmbed/mbed-crypto.git;protocol=https;branch=development;name=mbed;destsuffix=git/mbedcrypto"
+SRCREV_mbed = "cf4a40ba0a3086cabb5a8227245191161fd26383"
+
+SRC_URI_NANOPB = "git://github.com/nanopb/nanopb.git;name=nanopb;protocol=https;branch=master;destsuffix=git/nanopb"
+SRCREV_nanopb = "df0e92f474f9cca704fe2b31483f0b4d1b1715a4"
+
 TS_PLATFORM = "arm/fvp/fvp_base_revc-2xaemv8a"
 TS_ENVIRONMENT = "opteesp"
 SP_PACKAGING_METHOD = "embedded"
-- 
2.17.1


