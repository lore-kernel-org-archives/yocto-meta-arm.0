Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53688C433F5
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 13:13:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.23365.1664975603062329301
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Oct 2022 06:13:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3E791476;
	Wed,  5 Oct 2022 06:13:28 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com
 [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 523503F792;
	Wed,  5 Oct 2022 06:13:21 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Emekcan <emekcan.aras@arm.com>
Subject: [PATCH 0/1] arm-bsp/linux-yocto: Update RPMSG_CTRL config for
 corstone1000
Date: Wed,  5 Oct 2022 14:13:15 +0100
Message-Id: <20221005131317.48830-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 05 Oct 2022 13:13:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3932

From: Emekcan <emekcan.aras@arm.com>

The rpmsg_chrdev driver has been replaced by the rpmsg_ctrl driver.
This commit updates the defconfig to align with the change.

Emekcan Aras (1):
  arm-bsp/linux-yocto: Update RPMSG_CTRL config for corstone1000

 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig | 1 +
 1 file changed, 1 insertion(+)

-- 
2.17.1


