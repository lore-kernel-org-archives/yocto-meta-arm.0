Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8702BC43219
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 11:42:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.2308.1667821313676945089
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Nov 2022 03:41:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FFF01FB;
	Mon,  7 Nov 2022 03:41:59 -0800 (PST)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6AB653F73D;
	Mon,  7 Nov 2022 03:41:52 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Emekcan <emekcan.aras@arm.com>
Subject: [PATCH 0/2] arm-bsp/trusted-services:smm gateway fixes
Date: Mon,  7 Nov 2022 11:41:46 +0000
Message-Id: <20221107114148.48326-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 07 Nov 2022 11:42:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4096

From: Emekcan <emekcan.aras@arm.com>

The SMM gateway in trusted-services does not return the right
error values in negative cases. This patchset fixes those issues
as expected in EDK2-test

Emekcan (2):
  arm-bsp/trusted-services: add checks for null attributes in smm
    gateway
  arm-bsp/trusted-services: Fix GetNextVariable max_name_len in smm
    gateway

 ...teway-add-checks-for-null-attributes.patch | 35 +++++++++++++++++++
 .../0022-GetNextVariableName-Fix.patch        | 33 +++++++++++++++++
 .../trusted-services/ts-corstone1000.inc      |  2 ++
 3 files changed, 70 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0021-smm_gateway-add-checks-for-null-attributes.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0022-GetNextVariableName-Fix.patch

-- 
2.17.1


