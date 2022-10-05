Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFA95C433F5
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 11:50:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.22654.1664970652073069660
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Oct 2022 04:50:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7ADF5106F;
	Wed,  5 Oct 2022 04:50:58 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com
 [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DDCEB3F73B;
	Wed,  5 Oct 2022 04:50:50 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Emekcan <emekcan.aras@arm.com>
Subject: [PATCH 0/1] arm-bsp/kernel: Update RPMSG_CTRL config
Date: Wed,  5 Oct 2022 12:50:42 +0100
Message-Id: <20221005115043.48660-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 05 Oct 2022 11:50:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3929

From: Emekcan <emekcan.aras@arm.com>

The rpmsg_chardev driver has been replaced by the repmsg_ctrl
driver. This commit updates the defconfig to align with the 
change. 

Emekcan Aras (1):
  arm-bsp/kernel: Update RPMSG_CTRL config

 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig | 1 +
 1 file changed, 1 insertion(+)

-- 
2.17.1


