Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93927C433F5
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 10:15:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.17457.1664792114604890385
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Oct 2022 03:15:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9081C139F;
	Mon,  3 Oct 2022 03:15:20 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com
 [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 08F3F3F792;
	Mon,  3 Oct 2022 03:15:12 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Emekcan <emekcan.aras@arm.com>
Subject: [PATCH 0/2] arm-bsp/test: Changing the repo names
Date: Mon,  3 Oct 2022 11:15:06 +0100
Message-Id: <20221003101508.42204-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 03 Oct 2022 10:15:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3887

From: Emekcan <emekcan.aras@arm.com>

Migrating the test repo to a new namespace under arm 
reference solution. 

Emekcan Aras (2):
  arm-bsp/test: Changing the test app repository
  arm-bsp/external-system: Changing the RTX repo

 .../recipes-bsp/external-system/external-system_0.1.0.bb  | 8 +++-----
 .../corstone1000-external-sys-tests_1.0.bb                | 2 +-
 2 files changed, 4 insertions(+), 6 deletions(-)
-- 
2.17.1


