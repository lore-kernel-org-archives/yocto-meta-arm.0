Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC82EC46CA1
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 18:04:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.59079.1695060272472803280
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 Sep 2023 11:04:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D2E81FB;
	Mon, 18 Sep 2023 11:05:08 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 684D73F5A1;
	Mon, 18 Sep 2023 11:04:30 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 0/1] arm-bsp/optee-os: corstone1000: Handling logging syscall correctly
Date: Mon, 18 Sep 2023 19:04:23 +0100
Message-Id: <20230918180424.26148-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 18 Sep 2023 18:04:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5055

From: Emekcan Aras <emekcan.aras@arm.com>

Enables handling logging messages correctly.

Emekcan Aras (1):
  arm-bsp/optee-os: corstone1000: Handling logging syscall correctly

 .../0001-Handle-logging-syscall.patch         | 32 +++++++++++++++++++
 .../optee/optee-os-corstone1000-common.inc    |  5 +++
 2 files changed, 37 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0001-Handle-logging-syscall.patch

-- 
2.17.1


