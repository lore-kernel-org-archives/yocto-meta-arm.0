Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A885C7EE29
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 14:40:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.154.1686062439978209053
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 07:40:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 203782F4;
	Tue,  6 Jun 2023 07:41:25 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.194.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BD5853F6C4;
	Tue,  6 Jun 2023 07:40:38 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 0/1] arm-bsp/u-boot: corstone1000: enable PSCI reset
Date: Tue,  6 Jun 2023 15:40:27 +0100
Message-Id: <20230606144028.52624-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 06 Jun 2023 14:40:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4733

From: Emekcan Aras <emekcan.aras@arm.com>

Even though corstone1000 platform does not support the entire PSCI APIs, it
relys on PSCI reset interface for system reset. The name of this config
changed in the new version of u-boot. This enables PSCI reset, so
the system can be resetted in u-boot again.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>

Emekcan Aras (1):
  arm-bsp/u-boot: corstone1000: enable PSCI reset

 .../0044-corstone1000-enable-psci-reset.patch | 30 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0044-corstone1000-enable-psci-reset.patch

-- 
2.17.1


