Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92CD5C433FE
	for <webhook@archiver.kernel.org>; Fri, 14 Oct 2022 12:12:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.6297.1665749557988523221
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 14 Oct 2022 05:12:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 309D213D5;
	Fri, 14 Oct 2022 05:12:43 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2E17D3F792;
	Fri, 14 Oct 2022 05:12:36 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan <emekcan.aras@arm.com>
Subject: [PATCH 0/1] arm-bsp/kernel: Fix TEE driver bug for corstone1000
Date: Fri, 14 Oct 2022 13:12:29 +0100
Message-Id: <20221014121230.16045-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 14 Oct 2022 12:12:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3968

From: Emekcan <emekcan.aras@arm.com>

Fixes the Tee driver bug in corstone1000. It adds a
delay to fix a possible race-condition occurs during
FF-A calls. This is a temporary fix for the upcoming
release.

Emekcan Aras (1):
  arm-bsp/kernel: Fix TEE driver bug for corstone1000

 ...dds-workaround-for-cs1k-specific-bug.patch | 41 +++++++++++++++++++
 .../linux/linux-arm-platforms.inc             |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0006-Adds-workaround-for-cs1k-specific-bug.patch

-- 
2.17.1


