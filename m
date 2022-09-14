Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFCD6ECAAD3
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 19:00:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.1059.1663182035012598322
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Sep 2022 12:00:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4CADA106F
	for <meta-arm@lists.yoctoproject.org>; Wed, 14 Sep 2022 12:00:40 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B84AE3F73B
	for <meta-arm@lists.yoctoproject.org>; Wed, 14 Sep 2022 12:00:33 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH kirkstone] arm/trusted-firmware-m: fix branch issue
Date: Wed, 14 Sep 2022 15:00:24 -0400
Message-Id: <20220914190024.27483-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 14 Sep 2022 19:00:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3785

The 1.5.x branch no longer exists on the tf-m git repo, but the SHA is
still present.  Update the branch name to allow for this.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../trusted-firmware-m/trusted-firmware-m_1.5.0.bb           | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.5.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.5.0.bb
index 652abdd6..0e0f8608 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.5.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.5.0.bb
@@ -15,8 +15,8 @@ LIC_FILES_CHKSUM = "file://license.rst;md5=07f368487da347f3c7bd0fc3085f3afa \
                     file://../mbedtls/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                     file://../mcuboot/LICENSE;md5=b6ee33f1d12a5e6ee3de1e82fb51eeb8"
 
-SRC_URI  = "git://git.trustedfirmware.org/TF-M/trusted-firmware-m.git;protocol=https;branch=${SRCBRANCH_tfm};name=tfm;destsuffix=git/tfm \
-            git://git.trustedfirmware.org/TF-M/tf-m-tests.git;protocol=https;branch=release/1.5.x;name=tfm-tests;destsuffix=git/tf-m-tests \
+SRC_URI  = "git://git.trustedfirmware.org/TF-M/trusted-firmware-m.git;protocol=https;nobranch=1;name=tfm;destsuffix=git/tfm \
+            git://git.trustedfirmware.org/TF-M/tf-m-tests.git;protocol=https;nobranch=1;name=tfm-tests;destsuffix=git/tf-m-tests \
             git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=master;name=mbedtls;destsuffix=git/mbedtls \
             git://github.com/mcu-tools/mcuboot.git;protocol=https;branch=main;name=mcuboot;destsuffix=git/mcuboot \
             file://cbor2.patch;patchdir=../mcuboot \
@@ -24,7 +24,6 @@ SRC_URI  = "git://git.trustedfirmware.org/TF-M/trusted-firmware-m.git;protocol=h
 
 # The required dependencies are documented in tf-m/config/config_default.cmake
 # TF-Mv1.5.0
-SRCBRANCH_tfm = "release/1.5.x"
 SRCREV_tfm = "6fb14a14140f94150f959c88e3b880f48372da06"
 # mbedtls-3.0.0
 SRCREV_mbedtls = "8df2f8e7b9c7bb9390ac74bb7bace27edca81a2b"
-- 
2.17.1


