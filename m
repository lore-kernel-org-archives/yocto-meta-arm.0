Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4875C3DA78
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 13:24:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.195832.1673961891760375429
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Jan 2023 05:24:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE33E2B;
	Tue, 17 Jan 2023 05:25:32 -0800 (PST)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E39B93F67D;
	Tue, 17 Jan 2023 05:24:49 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 0/1]  arm/optee: Cleaning optee-os-3.19 recipe 
Date: Tue, 17 Jan 2023 13:24:40 +0000
Message-Id: <20230117132441.44548-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 Jan 2023 13:24:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4289

From: Emekcan Aras <emekcan.aras@arm.com>

Removes the optee-os_3.19.inc file since optee-os.inc is very similar and
cleans optee-os.inc.

Emekcan Aras (1):
  arm/optee: Cleaning optee-os-3.19 recipe

 .../recipes-security/optee/optee-os-3_19.inc  | 82 -------------------
 meta-arm/recipes-security/optee/optee-os.inc  |  6 +-
 .../recipes-security/optee/optee-os_3.19.0.bb |  2 +-
 3 files changed, 3 insertions(+), 87 deletions(-)
 delete mode 100644 meta-arm/recipes-security/optee/optee-os-3_19.inc

-- 
2.17.1


