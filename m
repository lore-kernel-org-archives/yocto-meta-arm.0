Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87548C433FE
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 11:09:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.24678.1639480185156181831
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 03:09:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C50766D;
	Tue, 14 Dec 2021 03:09:44 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.34.32])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 704DE3F5A1;
	Tue, 14 Dec 2021 03:09:43 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH honister 6/9] arm-bsp/trusted-firmware-m: corstone1000:
 Aligning with TF-M master
Date: Tue, 14 Dec 2021 11:09:22 +0000
Message-Id: <20211214110925.9936-7-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211214110925.9936-1-abdellatif.elkhlifi@arm.com>
References: <20211214110925.9936-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Dec 2021 11:09:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2694

From: Emekcan Aras <Emekcan.Aras@arm.com>

Setting the last master branch SHA for openamp changes.

Change-Id: I20dfb1c12091f58576898c2a17e74aa71bab5651
Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 .../trusted-firmware-m/trusted-firmware-m-corstone1000.inc      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc
index c732674..ff34fc9 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc
@@ -8,7 +8,7 @@ TFM_DEBUG = "1"
 TFM_PLATFORM_IS_FVP ?= "FALSE"
 EXTRA_OECMAKE += "-DPLATFORM_IS_FVP=${TFM_PLATFORM_IS_FVP}"
 
-SRCREV_tfm = "dc605e057470bb0eb0e92c2aafb443300a90c43f"
+SRCREV_tfm = "dc2ab10fa12b5ac01d4ff1aa9ebc3779507c7cf0"
 SRCREV_mcuboot = "29099e1d17f93ae1d09fe945ad191b703aacd3d8"
 
 PV = "1.5+git${SRCREV_tfm}"
-- 
2.17.1


