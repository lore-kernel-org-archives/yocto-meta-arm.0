Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E11C433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 13:13:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.23123.1664975604670489233
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Oct 2022 06:13:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1BC21476;
	Wed,  5 Oct 2022 06:13:30 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com
 [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6022B3F792;
	Wed,  5 Oct 2022 06:13:23 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Emekcan <emekcan.aras@arm.com>
Subject: [PATCH 1/1] arm-bsp/linux-yocto: Update RPMSG_CTRL config for
 corstone1000
Date: Wed,  5 Oct 2022 14:13:17 +0100
Message-Id: <20221005131317.48830-3-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221005131317.48830-1-emekcan.aras@arm.com>
References: <20221005131317.48830-1-emekcan.aras@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 05 Oct 2022 13:13:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3934

From: Emekcan <emekcan.aras@arm.com>

The rpmsg_chrdev driver has been replaced
by the rpmsg_ctrl driver. This commit
updates the defconfig to align with the
change.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig
index 3fe7a038..f6e6409c 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig
@@ -97,3 +97,4 @@ CONFIG_ARM_MHU_V2=y
 CONFIG_RPMSG=y
 CONFIG_RPMSG_CHAR=y
 CONFIG_RPMSG_ARM=y
+CONFIG_RPMSG_CTRL=y
-- 
2.17.1


