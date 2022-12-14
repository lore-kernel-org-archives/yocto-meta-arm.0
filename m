Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 235CBC4332F
	for <webhook@archiver.kernel.org>; Wed, 14 Dec 2022 18:03:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.111337.1671041020398580773
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Dec 2022 10:03:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7EAD3FEC
	for <meta-arm@lists.yoctoproject.org>; Wed, 14 Dec 2022 10:04:20 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BE5AE3F71E
	for <meta-arm@lists.yoctoproject.org>; Wed, 14 Dec 2022 10:03:39 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/trusted-firmware-m: update to 1.6.1
Date: Wed, 14 Dec 2022 13:03:32 -0500
Message-Id: <20221214180332.3429-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 14 Dec 2022 18:03:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4183

Update tf-m to the latest stable version and update the mbedtls git tree
to the new location.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...firmware-m_1.6.0.bb => trusted-firmware-m_1.6.1.bb} | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta-arm/recipes-bsp/trusted-firmware-m/{trusted-firmware-m_1.6.0.bb => trusted-firmware-m_1.6.1.bb} (95%)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.6.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.6.1.bb
similarity index 95%
rename from meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.6.0.bb
rename to meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.6.1.bb
index f0c8d579..14b2a96d 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.6.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.6.1.bb
@@ -17,18 +17,18 @@ LIC_FILES_CHKSUM = "file://license.rst;md5=07f368487da347f3c7bd0fc3085f3afa \
 
 SRC_URI  = "git://git.trustedfirmware.org/TF-M/trusted-firmware-m.git;protocol=https;branch=${SRCBRANCH_tfm};name=tfm;destsuffix=git/tfm \
             git://git.trustedfirmware.org/TF-M/tf-m-tests.git;protocol=https;branch=${SRCBRANCH_tfm-tests};name=tfm-tests;destsuffix=git/tf-m-tests \
-            git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=${SRCBRANCH_mbedtls};name=mbedtls;destsuffix=git/mbedtls \
+            git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=${SRCBRANCH_mbedtls};name=mbedtls;destsuffix=git/mbedtls \
             git://github.com/mcu-tools/mcuboot.git;protocol=https;branch=${SRCBRANCH_mcuboot};name=mcuboot;destsuffix=git/mcuboot \
-            "
+           "
 
 # The required dependencies are documented in tf-m/config/config_default.cmake
-# TF-Mv1.6.0
+# TF-Mv1.6.1
 SRCBRANCH_tfm ?= "release/1.6.x"
-SRCREV_tfm = "7387d88158701a3c51ad51c90a05326ee12847a8"
+SRCREV_tfm = "1f6d1dd69193bdfe42c40bb3cec1d91b0cc73080"
 # mbedtls-3.1.0
 SRCBRANCH_mbedtls ?= "master"
 SRCREV_mbedtls = "d65aeb37349ad1a50e0f6c9b694d4b5290d60e49"
-# TF-Mv1.6.0
+# TF-Mv1.6.1
 SRCBRANCH_tfm-tests ?= "release/1.6.x"
 SRCREV_tfm-tests = "723905d46019596f3f2df66d79b5d6bff6f3f213"
 # v1.9.0
-- 
2.17.1


