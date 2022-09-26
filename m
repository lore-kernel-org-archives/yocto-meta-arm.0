Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F1A2C07E9D
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 12:15:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.27744.1664194535096290485
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Sep 2022 05:15:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 579311063;
	Mon, 26 Sep 2022 05:15:41 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com
 [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DE6CC3F73B;
	Mon, 26 Sep 2022 05:15:33 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Emekcan <emekcan.aras@arm.com>
Subject: [PATCH 2/2] arm-bsp/images: Adding external system test to initramfs
 image
Date: Mon, 26 Sep 2022 13:15:21 +0100
Message-Id: <20220926121521.35674-3-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220926121521.35674-1-emekcan.aras@arm.com>
References: <20220926121521.35674-1-emekcan.aras@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 26 Sep 2022 12:15:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3837

From: Emekcan <emekcan.aras@arm.com>

Adds the external system test application and the relevant
recipe into the corstone1000 initramfs image.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 .../recipes-bsp/images/corstone1000-initramfs-image.bb         | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arm-bsp/recipes-bsp/images/corstone1000-initramfs-image.bb b/meta-arm-bsp/recipes-bsp/images/corstone1000-initramfs-image.bb
index b778a008..77e30ab1 100644
--- a/meta-arm-bsp/recipes-bsp/images/corstone1000-initramfs-image.bb
+++ b/meta-arm-bsp/recipes-bsp/images/corstone1000-initramfs-image.bb
@@ -28,3 +28,6 @@ IMAGE_INSTALL += "ffa-debugfs-mod"
 
 # psa-arch-tests linux userspace application
 IMAGE_INSTALL += "secure-partitions-psa-api-tests"
+
+# external system linux userspace test application
+IMAGE_INSTALL += "corstone1000-external-sys-tests"
-- 
2.17.1


