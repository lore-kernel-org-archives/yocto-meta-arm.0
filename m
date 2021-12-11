Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4979CC433EF
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 10:02:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.19998.1639216967546543180
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 11 Dec 2021 02:02:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4E05113E;
	Sat, 11 Dec 2021 02:02:46 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.35.244])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C17243F73D;
	Sat, 11 Dec 2021 02:02:45 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 7/7] arm-bsp/secure-partitions: corstone1000: using the
 default SHA
Date: Sat, 11 Dec 2021 10:02:26 +0000
Message-Id: <20211211100226.17180-8-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211211100226.17180-1-abdellatif.elkhlifi@arm.com>
References: <20211211100226.17180-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 11 Dec 2021 10:02:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2624

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


