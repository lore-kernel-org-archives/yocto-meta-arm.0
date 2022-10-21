Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D92CC433FE
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 13:49:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.10024.1666360147743184400
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Oct 2022 06:49:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D16701063;
	Fri, 21 Oct 2022 06:49:12 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C4F893F792;
	Fri, 21 Oct 2022 06:49:05 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan <emekcan.aras@arm.com>
Subject: [PATCH 0/1] arm/trusted-services: port crypto config
Date: Fri, 21 Oct 2022 14:49:00 +0100
Message-Id: <20221021134901.56428-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 21 Oct 2022 13:49:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3994

From: Emekcan <emekcan.aras@arm.com>

Port crypto config to psa arch test api suite.This
needs to move to arm-bsp since is corstone1000 specific
configuration

Rui Miguel Silva (1):
  arm/trusted-services: port crypto config

 ...0002-corstone1000-port-crypto-config.patch | 230 ++++++++++++++++++
 .../ts-psa-api-test-common_git.inc            |   1 +
 2 files changed, 231 insertions(+)
 create mode 100644 meta-arm/recipes-security/trusted-services/files/0002-corstone1000-port-crypto-config.patch

-- 
2.17.1


