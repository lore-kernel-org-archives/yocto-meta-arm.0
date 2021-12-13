Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED48C433FE
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 16:31:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.13289.1639413073207908649
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 08:31:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4CA11FB;
	Mon, 13 Dec 2021 08:31:12 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.32.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9EDFB3F73B;
	Mon, 13 Dec 2021 08:31:11 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH][HONISTER 1/7] arm-bsp/trusted-firmware-m: corstone1000: bump
 the version to 1.5
Date: Mon, 13 Dec 2021 16:30:56 +0000
Message-Id: <20211213163102.1039-2-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211213163102.1039-1-abdellatif.elkhlifi@arm.com>
References: <20211213163102.1039-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 Dec 2021 16:31:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2652

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Setting TF-M version to 1.5

Change-Id: Ib04778ed46d5404f498ff4efd60f338e351e7ee9
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 meta-arm-bsp/conf/machine/include/corstone1000.inc              | 2 +-
 .../trusted-firmware-m/trusted-firmware-m-corstone1000.inc      | 2 ++
 ...d-firmware-m_%.bbappend => trusted-firmware-m_1.4%.bbappend} | 0
 3 files changed, 3 insertions(+), 1 deletion(-)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/{trusted-firmware-m_%.bbappend => trusted-firmware-m_1.4%.bbappend} (100%)

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-arm-bsp/conf/machine/include/corstone1000.inc
index 9e36b4f..6ec0982 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -11,7 +11,7 @@ TFA_BL2_BINARY = "bl2-corstone1000.bin"
 TFA_FIP_BINARY = "fip-corstone1000.bin"
 
 # TF-M
-PREFERRED_VERSION_trusted-firmware-m ?= "1.4%"
+PREFERRED_VERSION_trusted-firmware-m ?= "1.5%"
 TFM_PLATFORM = "arm/corstone1000"
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-m"
 
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc
index 2c363d7..c732674 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc
@@ -11,6 +11,8 @@ EXTRA_OECMAKE += "-DPLATFORM_IS_FVP=${TFM_PLATFORM_IS_FVP}"
 SRCREV_tfm = "dc605e057470bb0eb0e92c2aafb443300a90c43f"
 SRCREV_mcuboot = "29099e1d17f93ae1d09fe945ad191b703aacd3d8"
 
+PV = "1.5+git${SRCREV_tfm}"
+
 SRCREV_FORMAT = "tfm_mcuboot_tfm-tests_mbedtls"
 
 # The install task signs the TF-A BL2 and FIP binaries.
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_%.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.4%.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_%.bbappend
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.4%.bbappend
-- 
2.17.1


