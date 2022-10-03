Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A55CC43219
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 13:01:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.64.1664802075609820520
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Oct 2022 06:01:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0092016F8;
	Mon,  3 Oct 2022 06:01:22 -0700 (PDT)
Received: from e121910.arm.com (unknown [10.57.65.67])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F1CA63F73B;
	Mon,  3 Oct 2022 06:01:13 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Vishnu.Banavath@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 05/12] arm-bsp/corstone1000-initramfs-image: remove obsolete
 packages
Date: Mon,  3 Oct 2022 14:00:44 +0100
Message-Id: <20221003130051.28934-6-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221003130051.28934-1-abdellatif.elkhlifi@arm.com>
References: <20221003130051.28934-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 03 Oct 2022 13:01:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3899

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

removing the following packages:

ffa-debugfs-mod
secure-partitions-psa-api-tests

Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../recipes-bsp/images/corstone1000-initramfs-image.bb      | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/images/corstone1000-initramfs-image.bb b/meta-arm-bsp/recipes-bsp/images/corstone1000-initramfs-image.bb
index 77e30ab1..1acf1bf4 100644
--- a/meta-arm-bsp/recipes-bsp/images/corstone1000-initramfs-image.bb
+++ b/meta-arm-bsp/recipes-bsp/images/corstone1000-initramfs-image.bb
@@ -23,11 +23,5 @@ IMAGE_FEATURES:remove = "package-management"
 # all optee packages
 IMAGE_INSTALL += "optee-client"
 
-# FF-A Debugfs driver
-IMAGE_INSTALL += "ffa-debugfs-mod"
-
-# psa-arch-tests linux userspace application
-IMAGE_INSTALL += "secure-partitions-psa-api-tests"
-
 # external system linux userspace test application
 IMAGE_INSTALL += "corstone1000-external-sys-tests"
-- 
2.17.1


