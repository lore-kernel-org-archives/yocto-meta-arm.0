Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D4BC433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 16:26:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.13491.1639412789660901049
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 08:26:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04A6BD6E;
	Mon, 13 Dec 2021 08:26:24 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.32.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E2C3F3F73B;
	Mon, 13 Dec 2021 08:26:22 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 1/6] arm/secure-partitions: remove the use of EXTRA_OEMAKE
Date: Mon, 13 Dec 2021 16:26:05 +0000
Message-Id: <20211213162610.31273-2-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211213162610.31273-1-abdellatif.elkhlifi@arm.com>
References: <20211213162610.31273-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 Dec 2021 16:26:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2646

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

EXTRA_OEMAKE is not needed since we are using CMake.

Change-Id: Ifc0dcc9313fe4e473cbba8eb3b716e11cf8e45ee
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../recipes-security/trusted-services/secure-partitions.inc    | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-arm/recipes-security/trusted-services/secure-partitions.inc b/meta-arm/recipes-security/trusted-services/secure-partitions.inc
index f043fde..2f56502 100644
--- a/meta-arm/recipes-security/trusted-services/secure-partitions.inc
+++ b/meta-arm/recipes-security/trusted-services/secure-partitions.inc
@@ -19,7 +19,4 @@ LD[unexport] = "1"
 SECURITY_LDFLAGS = ""
 TARGET_LDFLAGS = "-Wl,--build-id=none -Wl,--hash-style=both"
 
-EXTRA_OEMAKE += "HOST_PREFIX=${HOST_PREFIX}"
-EXTRA_OEMAKE += "CROSS_COMPILE64=${HOST_PREFIX}"
-
 do_configure[cleandirs] = "${B}"
-- 
2.17.1


