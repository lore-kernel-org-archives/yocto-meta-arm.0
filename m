Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E880C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 10:21:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.4445.1650968499519494188
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 03:21:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC52523A;
	Tue, 26 Apr 2022 03:21:38 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com
 [10.1.194.44])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F3A7F3F5A1;
	Tue, 26 Apr 2022 03:21:37 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	emeara01 <emekcan.aras@arm.com>
Subject: [PATCH 0/1] arm-bsp/trusted-services:corstone1000:add sysroot
Date: Tue, 26 Apr 2022 11:21:24 +0100
Message-Id: <20220426102125.8855-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 26 Apr 2022 10:21:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3298

From: emeara01 <emekcan.aras@arm.com>

ffa-debugfs-mod provides arm_ffa_user.h needed by psa-arch-tests
source-code.

This commit sets the sysroot task dependencies.

Signed-off by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Abdellatif El Khlifi (1):
  arm-bsp/trusted-services: corstone1000: add sysroot tasks dependency

 .../recipes-security/trusted-services/ts-corstone1000.inc       | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.17.1


