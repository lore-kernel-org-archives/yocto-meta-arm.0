Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0435DC6FA8F
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 13:30:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10717.1692883844571104754
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 24 Aug 2023 06:30:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53F021007;
	Thu, 24 Aug 2023 06:31:24 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2EA723F740;
	Thu, 24 Aug 2023 06:30:43 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 0/1] arm-bsp/optee-os: corstone1000: Update optee-os v3.22
Date: Thu, 24 Aug 2023 14:30:31 +0100
Message-Id: <20230824133032.43870-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 24 Aug 2023 13:30:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4990

From: Emekcan Aras <emekcan.aras@arm.com>

Updates optee-os and aligns with changes in v3.22 for Corstone-1000.

Emekcan Aras (1):
  arm-bsp/optee-os: corstone1000: Update optee-os v3.22

 .../conf/machine/include/corstone1000.inc     |  4 +--
 .../optee/optee-os-corstone1000-common.inc    |  6 ----
 .../optee/optee-os_3.20.0.bbappend            |  1 -
 .../optee/optee-os_3.22.0.bbappend            |  6 ++++
 ...stone1000-change-ns-interrupt-action.patch | 31 +++++++++++++++++++
 .../trusted-services/ts-arm-platforms.inc     |  1 +
 6 files changed, 40 insertions(+), 9 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-os_3.22.0.bbappend
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0008-plat-corstone1000-change-ns-interrupt-action.patch

-- 
2.17.1


