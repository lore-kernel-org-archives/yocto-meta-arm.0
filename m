Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F9A0C4167B
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 16:26:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.13261.1639412792215631136
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 08:26:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DCC7AD6E;
	Mon, 13 Dec 2021 08:26:31 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.32.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E74793F73B;
	Mon, 13 Dec 2021 08:26:30 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 6/6] arm-bsp/trusted-firmware-m: corstone1000: set
 SRCREV_FORMAT
Date: Mon, 13 Dec 2021 16:26:10 +0000
Message-Id: <20211213162610.31273-7-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211213162610.31273-1-abdellatif.elkhlifi@arm.com>
References: <20211213162610.31273-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 Dec 2021 16:26:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2648

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Adding to SRCREV_FORMAT the names of the repos fetched.

Change-Id: Idf80065c39b2124bf384d0dbb4028138b27c1e10
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../trusted-firmware-m/trusted-firmware-m-corstone1000.inc       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc
index a060358..c418877 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc
@@ -13,6 +13,7 @@ SRCREV_tfm = "dc605e057470bb0eb0e92c2aafb443300a90c43f"
 SRCREV_mcuboot = "29099e1d17f93ae1d09fe945ad191b703aacd3d8"
 
 PV = "1.5+git${SRCREV_tfm}"
+SRCREV_FORMAT = "tfm_mcuboot_tfm-tests_mbedtls"
 
 # The install task signs the TF-A BL2 and FIP binaries.
 # So they need to be copied to the sysroot. Hence the dependencies below:
-- 
2.17.1


