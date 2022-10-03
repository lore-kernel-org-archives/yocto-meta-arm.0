Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDDB5C433F5
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 17:16:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.236.1664817365833429177
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Oct 2022 10:16:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E028153B
	for <meta-arm@lists.yoctoproject.org>; Mon,  3 Oct 2022 10:16:11 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 92DBD3F67D
	for <meta-arm@lists.yoctoproject.org>; Mon,  3 Oct 2022 10:16:04 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm-bsp/fvp: move the fvp include file to the include
 directory
Date: Mon,  3 Oct 2022 13:15:59 -0400
Message-Id: <20221003171600.24454-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 03 Oct 2022 17:16:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3912

Move the FVP include file to the include directory, matching what is
done for corstone1000 and other machines in meta-arm-bsp.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-base-arm32.conf          | 2 +-
 meta-arm-bsp/conf/machine/fvp-base.conf                | 2 +-
 meta-arm-bsp/conf/machine/{ => include}/fvp-common.inc | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-arm-bsp/conf/machine/{ => include}/fvp-common.inc (100%)

diff --git a/meta-arm-bsp/conf/machine/fvp-base-arm32.conf b/meta-arm-bsp/conf/machine/fvp-base-arm32.conf
index 7343aed6..d3452b74 100644
--- a/meta-arm-bsp/conf/machine/fvp-base-arm32.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base-arm32.conf
@@ -4,7 +4,7 @@
 #@NAME: Armv7-A Base Platform FVP machine
 #@DESCRIPTION: Machine configuration for Armv7-A Base Platform FVP model
 
-require conf/machine/fvp-common.inc
+require conf/machine/include/fvp-common.inc
 require conf/machine/include/arm/arch-armv7a.inc
 
 # FVP u-boot configuration
diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/machine/fvp-base.conf
index 04ec1120..320e22ce 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -4,7 +4,7 @@
 #@NAME: Armv8-A Base Platform FVP machine
 #@DESCRIPTION: Machine configuration for Armv8-A Base Platform FVP model
 
-require conf/machine/fvp-common.inc
+require conf/machine/include/fvp-common.inc
 require conf/machine/include/arm/arch-armv8a.inc
 
 TUNE_FEATURES = "aarch64"
diff --git a/meta-arm-bsp/conf/machine/fvp-common.inc b/meta-arm-bsp/conf/machine/include/fvp-common.inc
similarity index 100%
rename from meta-arm-bsp/conf/machine/fvp-common.inc
rename to meta-arm-bsp/conf/machine/include/fvp-common.inc
-- 
2.17.1


