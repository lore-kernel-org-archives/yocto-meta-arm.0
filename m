Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9661EEE49AA
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 16:12:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1067.1692634321200433758
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Aug 2023 09:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE5BB2F4;
	Mon, 21 Aug 2023 09:12:41 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DD0133F64C;
	Mon, 21 Aug 2023 09:11:59 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 0/1] arm-bsp/trusted-firmware-a: Update Corstone1000 to v2.9
Date: Mon, 21 Aug 2023 17:11:44 +0100
Message-Id: <20230821161145.10003-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 21 Aug 2023 16:12:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4983

From: Emekcan Aras <emekcan.aras@arm.com>

Updates trusted-firmware-a and aligns with changes in v2.9 for corstone1000.

Emekcan Aras (1):
  arm-bsp/trusted-firmware-a: corstone1000: Update TF-A v2.9

 .../conf/machine/include/corstone1000.inc     |  2 +-
 ...rstone1000-add-cpuhelper-to-makefile.patch | 28 +++++++++++++++++++
 .../trusted-firmware-a-corstone1000.inc       |  7 ++---
 3 files changed, 31 insertions(+), 6 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0004-fix-corstone1000-add-cpuhelper-to-makefile.patch

-- 
2.17.1


