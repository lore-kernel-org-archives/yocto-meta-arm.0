Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D14C433F5
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 17:23:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.28730.1639502580704316041
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 09:23:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55DAFD6E;
	Tue, 14 Dec 2021 09:23:00 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.34.32])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1BBE93F5A1;
	Tue, 14 Dec 2021 09:22:58 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 1/1] arm-bsp/trusted-firmware-m: corstone1000: update TF-M SHA
Date: Tue, 14 Dec 2021 17:22:49 +0000
Message-Id: <20211214172249.26770-2-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211214172249.26770-1-abdellatif.elkhlifi@arm.com>
References: <20211214172249.26770-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Dec 2021 17:23:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2705

From: Vishnu Banavath <vishnu.banavath@arm.com>

This change is to update TF-M SHA which has fixes for capsule update.

Change-Id: I016381c2a95fcdd9629772671143a1e7332196e5
Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
---
 .../trusted-firmware-m/trusted-firmware-m-corstone1000.inc      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc
index 3799907..cd6a224 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc
@@ -9,7 +9,7 @@ TFM_PLATFORM_IS_FVP ?= "FALSE"
 EXTRA_OECMAKE += "-DPLATFORM_IS_FVP=${TFM_PLATFORM_IS_FVP}"
 
 SRCBRANCH_tfm = "master"
-SRCREV_tfm = "dc2ab10fa12b5ac01d4ff1aa9ebc3779507c7cf0"
+SRCREV_tfm = "ca8c634a3dc15b42d41655a14e512b642320893a"
 SRCREV_mcuboot = "29099e1d17f93ae1d09fe945ad191b703aacd3d8"
 
 PV = "1.5+git${SRCREV_tfm}"
-- 
2.17.1


