Return-Path: <harry.moulton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E731C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 16:25:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.28273.1647275152837853633
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 14 Mar 2022 09:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harry.moulton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5DDED6E;
	Mon, 14 Mar 2022 09:25:51 -0700 (PDT)
Received: from e123741.cambridge.arm.com (e123741.cambridge.arm.com
 [10.1.196.216])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 470763F774;
	Mon, 14 Mar 2022 09:25:51 -0700 (PDT)
From: harry.moulton@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Harry Moulton <harry.moulton@arm.com>
Subject: [PATCH honister 2/2] arm-bsp/corstone1000: Add RDEPENDS to remove
 unwanted images.
Date: Mon, 14 Mar 2022 16:25:02 +0000
Message-Id: <20220314162502.25350-3-harry.moulton@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220314162502.25350-1-harry.moulton@arm.com>
References: <20220314162502.25350-1-harry.moulton@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 14 Mar 2022 16:25:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3172

From: Harry Moulton <harry.moulton@arm.com>

Remove unwanted build images that push the binaries size over the size
limit for corstone1000.

Signed-off-by: Harry Moulton <harry.moulton@arm.com>
---
 meta-arm-bsp/conf/machine/include/corstone1000.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-arm-bsp/conf/machine/include/corstone1000.inc
index 6ec0982..200fad1 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -51,6 +51,8 @@ KERNEL_IMAGETYPE = "Image"
 
 INITRAMFS_IMAGE_BUNDLE ?= "1"
 
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base ?= ""
+
 #telling the build system which image is responsible of the generation of the initramfs rootfs
 INITRAMFS_IMAGE = "corstone1000-initramfs-image"
 
-- 
2.17.1


