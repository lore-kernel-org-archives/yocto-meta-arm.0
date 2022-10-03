Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BA21C433F5
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 13:01:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.68.1664802083125071492
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Oct 2022 06:01:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 86B9716F8;
	Mon,  3 Oct 2022 06:01:29 -0700 (PDT)
Received: from e121910.arm.com (unknown [10.57.65.67])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A9303F73B;
	Mon,  3 Oct 2022 06:01:21 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Vishnu.Banavath@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 09/12] arm-bsp/corstone1000-initramfs-image: add TS PSA API
 tests packages
Date: Mon,  3 Oct 2022 14:00:48 +0100
Message-Id: <20221003130051.28934-10-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221003130051.28934-1-abdellatif.elkhlifi@arm.com>
References: <20221003130051.28934-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 03 Oct 2022 13:01:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3903

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Trusted Services PSA API tests commands allow testing the following
SE Proxy services: crypto, its, ps and iat

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../recipes-bsp/images/corstone1000-initramfs-image.bb         | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arm-bsp/recipes-bsp/images/corstone1000-initramfs-image.bb b/meta-arm-bsp/recipes-bsp/images/corstone1000-initramfs-image.bb
index 1acf1bf4..46427b74 100644
--- a/meta-arm-bsp/recipes-bsp/images/corstone1000-initramfs-image.bb
+++ b/meta-arm-bsp/recipes-bsp/images/corstone1000-initramfs-image.bb
@@ -25,3 +25,6 @@ IMAGE_INSTALL += "optee-client"
 
 # external system linux userspace test application
 IMAGE_INSTALL += "corstone1000-external-sys-tests"
+
+# TS PSA API tests commands for crypto, its, ps and iat
+IMAGE_INSTALL += "packagegroup-ts-tests-psa"
-- 
2.17.1


