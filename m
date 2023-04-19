Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48169C6FD18
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 16:54:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.43635.1681923274844453408
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Apr 2023 09:54:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46442152B;
	Wed, 19 Apr 2023 09:55:18 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.194.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ABF5C3F5A1;
	Wed, 19 Apr 2023 09:54:33 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 3/3] arm-bsp/corstone1000: add OTP config for fvp
Date: Wed, 19 Apr 2023 17:54:22 +0100
Message-Id: <20230419165422.15990-4-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230419165422.15990-1-emekcan.aras@arm.com>
References: <20230419165422.15990-1-emekcan.aras@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Apr 2023 16:54:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4587

From: Emekcan Aras <emekcan.aras@arm.com>

Adds OTP config to run the FVP with the new BL1 changes

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 meta-arm-bsp/conf/machine/corstone1000-fvp.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf b/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
index ca89c700..03577b8e 100644
--- a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
+++ b/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
@@ -29,6 +29,7 @@ FVP_CONFIG[board.se_flash_size] ?= "8192"
 FVP_CONFIG[diagnostics] ?= "4"
 FVP_CONFIG[disable_visualisation] ?= "true"
 FVP_CONFIG[se.nvm.update_raw_image] ?= "0"
+FVP_CONFIG[se.cryptocell.USER_OTP_FILTERING_DISABLE] ?= "1"
 
 # Boot image
 FVP_DATA ?= "board.flash0=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.wic@0x68000000"
-- 
2.17.1


