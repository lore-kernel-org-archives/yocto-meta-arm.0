Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 523B2C6FA82
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 11:07:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.596.1662721647154958732
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 09 Sep 2022 04:07:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06C1315DB;
	Fri,  9 Sep 2022 04:07:33 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com
 [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 015153F7B4;
	Fri,  9 Sep 2022 04:07:25 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Emekcan <emekcan.aras@arm.com>
Subject: [PATCH 0/1] arm-bsp/external-system: corsone1000 external 
Date: Fri,  9 Sep 2022 12:07:15 +0100
Message-Id: <20220909110716.43171-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 09 Sep 2022 11:07:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3753

From: Emekcan <emekcan.aras@arm.com>

It adds external system recipe for the corstone1000 platform.

Vishnu Banavath (1):
  arm-bsp/external-system:corstone1000: build and install
    external-system

 .../conf/machine/corstone1000-fvp.conf        |  3 ++
 .../conf/machine/include/corstone1000.inc     |  3 ++
 .../external-system/external-system_0.1.0.bb  | 49 +++++++++++++++++++
 3 files changed, 55 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb

-- 
2.17.1


