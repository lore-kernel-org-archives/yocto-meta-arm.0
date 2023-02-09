Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE0EC05027
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 12:05:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12663.1675944311532360107
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Feb 2023 04:05:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D9991BB2;
	Thu,  9 Feb 2023 04:05:53 -0800 (PST)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0D77B3F703;
	Thu,  9 Feb 2023 04:05:09 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH langdale 1/1] arm/trusted-firmware-m: Do not use release branches
Date: Thu,  9 Feb 2023 12:04:56 +0000
Message-Id: <20230209120456.26364-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230209120456.26364-1-emekcan.aras@arm.com>
References: <20230209120456.26364-1-emekcan.aras@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 09 Feb 2023 12:05:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4376

From: Emekcan Aras <emekcan.aras@arm.com>

TFM repos do not use release branches. TFM-test repo does not use master
branch and use detached head for the 1.6 release. This commits makes necessary
changes to be able to build tfm and tfm-test again for langdale.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 .../trusted-firmware-m/trusted-firmware-m_1.6.0.bb           | 5 ++---
 .../trusted-firmware-m-scripts-native_1.6.0.bb               | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.6.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.6.0.bb
index f0c8d579..6b06c8a9 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.6.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.6.0.bb
@@ -16,20 +16,19 @@ LIC_FILES_CHKSUM = "file://license.rst;md5=07f368487da347f3c7bd0fc3085f3afa \
                     file://../mcuboot/LICENSE;md5=b6ee33f1d12a5e6ee3de1e82fb51eeb8"
 
 SRC_URI  = "git://git.trustedfirmware.org/TF-M/trusted-firmware-m.git;protocol=https;branch=${SRCBRANCH_tfm};name=tfm;destsuffix=git/tfm \
-            git://git.trustedfirmware.org/TF-M/tf-m-tests.git;protocol=https;branch=${SRCBRANCH_tfm-tests};name=tfm-tests;destsuffix=git/tf-m-tests \
+            git://git.trustedfirmware.org/TF-M/tf-m-tests.git;protocol=https;nobranch=1;name=tfm-tests;destsuffix=git/tf-m-tests \
             git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=${SRCBRANCH_mbedtls};name=mbedtls;destsuffix=git/mbedtls \
             git://github.com/mcu-tools/mcuboot.git;protocol=https;branch=${SRCBRANCH_mcuboot};name=mcuboot;destsuffix=git/mcuboot \
             "
 
 # The required dependencies are documented in tf-m/config/config_default.cmake
 # TF-Mv1.6.0
-SRCBRANCH_tfm ?= "release/1.6.x"
+SRCBRANCH_tfm ?= "master"
 SRCREV_tfm = "7387d88158701a3c51ad51c90a05326ee12847a8"
 # mbedtls-3.1.0
 SRCBRANCH_mbedtls ?= "master"
 SRCREV_mbedtls = "d65aeb37349ad1a50e0f6c9b694d4b5290d60e49"
 # TF-Mv1.6.0
-SRCBRANCH_tfm-tests ?= "release/1.6.x"
 SRCREV_tfm-tests = "723905d46019596f3f2df66d79b5d6bff6f3f213"
 # v1.9.0
 SRCBRANCH_mcuboot ?= "main"
diff --git a/meta-arm/recipes-devtools/trusted-firmware-m-scripts/trusted-firmware-m-scripts-native_1.6.0.bb b/meta-arm/recipes-devtools/trusted-firmware-m-scripts/trusted-firmware-m-scripts-native_1.6.0.bb
index 453d456a..06c03161 100644
--- a/meta-arm/recipes-devtools/trusted-firmware-m-scripts/trusted-firmware-m-scripts-native_1.6.0.bb
+++ b/meta-arm/recipes-devtools/trusted-firmware-m-scripts/trusted-firmware-m-scripts-native_1.6.0.bb
@@ -1,7 +1,7 @@
 
 SRC_URI = "git://git.trustedfirmware.org/TF-M/trusted-firmware-m.git;protocol=https;branch=${SRCBRANCH}"
 # Use the wrapper script from TF-Mv1.6.0
-SRCBRANCH ?= "release/1.6.x"
+SRCBRANCH ?= "master"
 SRCREV = "7387d88158701a3c51ad51c90a05326ee12847a8"
 
 LICENSE = "BSD-3-Clause"
-- 
2.17.1


