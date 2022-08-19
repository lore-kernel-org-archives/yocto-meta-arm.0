Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D57E9C28B2B
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 17:28:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.5897.1660930111275987423
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 19 Aug 2022 10:28:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0AEA41042
	for <meta-arm@lists.yoctoproject.org>; Fri, 19 Aug 2022 10:28:32 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0D8553F70D
	for <meta-arm@lists.yoctoproject.org>; Fri, 19 Aug 2022 10:28:29 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/fvp-base: set preferred kernel to 5.15
Date: Fri, 19 Aug 2022 13:28:25 -0400
Message-Id: <20220819172825.28659-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 19 Aug 2022 17:28:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3704

SSH tests are failing on the 5.19 kernel.  Temporarily set the kernel to
5.15 while debugging the issue.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-base.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/machine/fvp-base.conf
index 434812b3..04ec1120 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -10,6 +10,8 @@ require conf/machine/include/arm/arch-armv8a.inc
 TUNE_FEATURES = "aarch64"
 
 PREFERRED_VERSION_u-boot ?= "2022.04"
+PREFERRED_VERSION_linux-yocto ?= "5.15%"
+PREFERRED_VERSION_linux-yocto-rt ?= "5.15%"
 
 # FVP u-boot configuration
 UBOOT_MACHINE = "vexpress_aemv8a_semi_defconfig"
-- 
2.17.1


