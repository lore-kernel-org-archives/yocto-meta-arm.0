Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E58F2C433EF
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 14:01:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7371.1642168890479778694
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 14 Jan 2022 06:01:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AABDED1
	for <meta-arm@lists.yoctoproject.org>; Fri, 14 Jan 2022 06:01:30 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EF24D3F774
	for <meta-arm@lists.yoctoproject.org>; Fri, 14 Jan 2022 06:01:29 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/fvp-baser-aemv8r64: Update to the 5.15 kernel
Date: Fri, 14 Jan 2022 09:01:24 -0500
Message-Id: <20220114140124.21091-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 14 Jan 2022 14:01:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2829

The Linux 5.14 kernel has been removed.  Update to the latest kernel.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
index 2d63be5..031e010 100644
--- a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
+++ b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
@@ -9,8 +9,8 @@ require conf/machine/include/arm/armv8r/arch-armv8r64.inc
 EXTRA_IMAGEDEPENDS += "boot-wrapper-aarch64"
 
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
-PREFERRED_VERSION_linux-yocto ?= "5.14%"
-PREFERRED_VERSION_linux-yocto-rt ?= "5.14%"
+PREFERRED_VERSION_linux-yocto ?= "5.15%"
+PREFERRED_VERSION_linux-yocto-rt ?= "5.15%"
 
 KERNEL_IMAGETYPE = "Image"
 KERNEL_DEVICETREE = "arm/fvp-baser-aemv8r64.dtb"
@@ -58,4 +58,4 @@ FVP_CONFIG[gic_distributor.has-two-security-states] ?= "0"
 FVP_CONFIG[pctl.startup] ?= "0.0.0.*"
 FVP_CONFIG[bp.virtio_net.enabled] ?= "1"
 FVP_CONFIG[bp.virtio_net.hostbridge.userNetworking] ?= "1"
-FVP_CONFIG[bp.vis.rate_limit-enable] ?= "0"
\ No newline at end of file
+FVP_CONFIG[bp.vis.rate_limit-enable] ?= "0"
-- 
2.17.1


