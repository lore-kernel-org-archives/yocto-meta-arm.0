Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA28CCA47F
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 17:15:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.9028.1655226920357276657
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jun 2022 10:15:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B69EE1763
	for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jun 2022 10:15:19 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 347423F66F
	for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jun 2022 10:15:19 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/6] arm-bsp/fvp-base: get v2022.04 u-boot working
Date: Tue, 14 Jun 2022 13:15:12 -0400
Message-Id: <20220614171514.32495-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220614171514.32495-1-jon.mason@arm.com>
References: <20220614171514.32495-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Jun 2022 17:15:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3495

Recent modifications in u-boot moved the default location of the FDT.
Update the runfvp parameters to match this new location.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-base.conf  | 2 +-
 meta-arm-bsp/conf/machine/fvp-common.inc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/machine/fvp-base.conf
index 91b3f443..434812b3 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -9,7 +9,7 @@ require conf/machine/include/arm/arch-armv8a.inc
 
 TUNE_FEATURES = "aarch64"
 
-PREFERRED_VERSION_u-boot ?= "2022.01"
+PREFERRED_VERSION_u-boot ?= "2022.04"
 
 # FVP u-boot configuration
 UBOOT_MACHINE = "vexpress_aemv8a_semi_defconfig"
diff --git a/meta-arm-bsp/conf/machine/fvp-common.inc b/meta-arm-bsp/conf/machine/fvp-common.inc
index f8328cf4..c834f24d 100644
--- a/meta-arm-bsp/conf/machine/fvp-common.inc
+++ b/meta-arm-bsp/conf/machine/fvp-common.inc
@@ -40,7 +40,7 @@ FVP_CONFIG[cluster0.has_arm_v8-4] = "1"
 FVP_CONFIG[cluster1.has_arm_v8-4] = "1"
 FVP_CONSOLE ?= "terminal_0"
 FVP_DATA ?= "cluster0.cpu0=${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}@0x80080000 \
-             cluster0.cpu0=${DEPLOY_DIR_IMAGE}/fvp-base-revc.dtb@0x83000000"
+             cluster0.cpu0=${DEPLOY_DIR_IMAGE}/fvp-base-revc.dtb@0x8fc00000"
 FVP_TERMINALS[bp.terminal_0] ?= "Console"
 FVP_TERMINALS[bp.terminal_1] ?= ""
 FVP_TERMINALS[bp.terminal_2] ?= ""
-- 
2.17.1


