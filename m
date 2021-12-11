Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71A28C43217
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 10:02:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20074.1639216964391120455
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 11 Dec 2021 02:02:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3229113E;
	Sat, 11 Dec 2021 02:02:37 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.35.244])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 644523F73D;
	Sat, 11 Dec 2021 02:02:36 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH 1/7] arm-bsp/trusted-firmware-m: corstone1000: bump the
 version to 1.5
Date: Sat, 11 Dec 2021 10:02:20 +0000
Message-Id: <20211211100226.17180-2-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211211100226.17180-1-abdellatif.elkhlifi@arm.com>
References: <20211211100226.17180-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 11 Dec 2021 10:02:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2620

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Setting TF-M version to 1.5

Change-Id: Ieb0994f0a13c4d65b2a8938e269f137f722780cb
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 meta-arm-bsp/conf/machine/include/corstone1000.inc               | 1 +
 ...ed-firmware-m_%.bbappend => trusted-firmware-m_1.4%.bbappend} | 0
 2 files changed, 1 insertion(+)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/{trusted-firmware-m_%.bbappend => trusted-firmware-m_1.4%.bbappend} (100%)

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-arm-bsp/conf/machine/include/corstone1000.inc
index 2c554d4..6684c72 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -11,6 +11,7 @@ TFA_BL2_BINARY = "bl2-corstone1000.bin"
 TFA_FIP_BINARY = "fip-corstone1000.bin"
 
 # TF-M
+PREFERRED_VERSION_trusted-firmware-m ?= "1.5%"
 TFM_PLATFORM = "arm/corstone1000"
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-m"
 
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_%.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.4%.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_%.bbappend
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.4%.bbappend
-- 
2.17.1


