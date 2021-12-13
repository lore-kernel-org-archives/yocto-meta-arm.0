Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A9A8C433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 16:31:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.13293.1639413083062714887
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 08:31:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B13AA139F;
	Mon, 13 Dec 2021 08:31:22 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.32.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A87DC3F73B;
	Mon, 13 Dec 2021 08:31:21 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH][HONISTER 7/7] arm-bsp/secure-partitions: corstone1000: using
 the default SHA
Date: Mon, 13 Dec 2021 16:31:02 +0000
Message-Id: <20211213163102.1039-8-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211213163102.1039-1-abdellatif.elkhlifi@arm.com>
References: <20211213163102.1039-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 Dec 2021 16:31:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2658

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

No need to set again the same SHA as the one provided
by the recipe.

Change-Id: I034aca31c1cc30868552be67a04400db20ad59b2
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../recipes-security/trusted-services/ts-corstone1000.inc       | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
index 135cc37..e7165d5 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
@@ -31,8 +31,6 @@ SRC_URI:append = " \
                   file://0018-Support-FFARPC-call-requests-with-no-shared-buffer.patch \
                   "
 
-SRCREV_ts = "a365a04f937b9b76ebb2e0eeade226f208cbc0d2"
-
 SRC_URI_MBED = "git://github.com/ARMmbed/mbed-crypto.git;protocol=https;branch=development;name=mbed;destsuffix=git/mbedcrypto"
 SRCREV_mbed = "cf4a40ba0a3086cabb5a8227245191161fd26383"
 
-- 
2.17.1


