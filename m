Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5109C19F2A
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 13:42:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6542.1660225362860600332
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Aug 2022 06:42:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B137B106F
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 Aug 2022 06:42:42 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D23973F67D
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 Aug 2022 06:42:41 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm-bsp/fvp-base-arm32: Update kernel patch for v5.19
Date: Thu, 11 Aug 2022 09:42:34 -0400
Message-Id: <20220811134236.3502-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 Aug 2022 13:42:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3672

In newer kernels, vexpress has been rolled under the versatile umbrella.
Update the patch to refer to the new location

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../0001-ARM-vexpress-enable-GICv3.patch      | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta-arm-bsp/recipes-kernel/linux/files/fvp-base-arm32/0001-ARM-vexpress-enable-GICv3.patch b/meta-arm-bsp/recipes-kernel/linux/files/fvp-base-arm32/0001-ARM-vexpress-enable-GICv3.patch
index d0a05c24..184a7631 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/fvp-base-arm32/0001-ARM-vexpress-enable-GICv3.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/files/fvp-base-arm32/0001-ARM-vexpress-enable-GICv3.patch
@@ -1,4 +1,4 @@
-From 5dbb6c4267b1e46ed08359be363d8bc9b6a79397 Mon Sep 17 00:00:00 2001
+From 9fe529a146f4528ec80a3d04588e387f3651dc22 Mon Sep 17 00:00:00 2001
 From: Ryan Harkin <ryan.harkin@linaro.org>
 Date: Wed, 16 Nov 2016 14:43:02 +0000
 Subject: [PATCH] ARM: vexpress: enable GICv3
@@ -11,21 +11,21 @@ ARMv7 kernel.  And these targets often contain GICv3.
 Signed-off-by: Ryan Harkin <ryan.harkin@linaro.org>
 Signed-off-by: Jon Medhurst <tixy@linaro.org>
 ---
- arch/arm/mach-vexpress/Kconfig | 1 +
+ arch/arm/mach-versatile/Kconfig | 1 +
  1 file changed, 1 insertion(+)
 
-diff --git a/arch/arm/mach-vexpress/Kconfig b/arch/arm/mach-vexpress/Kconfig
-index 7c728ebc0b33..ed579382d41f 100644
---- a/arch/arm/mach-vexpress/Kconfig
-+++ b/arch/arm/mach-vexpress/Kconfig
-@@ -4,6 +4,7 @@ menuconfig ARCH_VEXPRESS
- 	select ARCH_SUPPORTS_BIG_ENDIAN
+diff --git a/arch/arm/mach-versatile/Kconfig b/arch/arm/mach-versatile/Kconfig
+index 2ef226194c3a..3d54877fe339 100644
+--- a/arch/arm/mach-versatile/Kconfig
++++ b/arch/arm/mach-versatile/Kconfig
+@@ -251,6 +251,7 @@ menuconfig ARCH_VEXPRESS
+ 	depends on ARCH_MULTI_V7
  	select ARM_AMBA
  	select ARM_GIC
 +	select ARM_GIC_V3
  	select ARM_GLOBAL_TIMER
  	select ARM_TIMER_SP804
- 	select COMMON_CLK_VERSATILE
+ 	select GPIOLIB
 -- 
-2.17.1
+2.30.2
 
-- 
2.17.1


