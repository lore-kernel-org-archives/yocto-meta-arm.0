Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF77C77B73
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 15:39:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.54685.1682350744267476898
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Apr 2023 08:39:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFC424B3;
	Mon, 24 Apr 2023 08:39:47 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.194.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ECC083F64C;
	Mon, 24 Apr 2023 08:39:02 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 0/1] arm-bsp/trusted-firmware-m: Increase assets number for corstone1000
Date: Mon, 24 Apr 2023 16:38:58 +0100
Message-Id: <20230424153859.18557-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Apr 2023 15:39:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4612

From: Emekcan Aras <emekcan.aras@arm.com>

Enabling new features on tfm for corstone1000 increases the number of
ITS and PS assets needed. This patch increases the number of PS and ITS
assets and fixes regression on psa-ps-api-tests.

Emekcan Aras (1):
  arm-bsp/trusted-firmware-m: Increase assets number for corstone1000

 ...rstone1000-Increase-number-of-assets.patch | 36 +++++++++++++++++++
 .../trusted-firmware-m-1.7.0-corstone1000.inc |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0012-Platform-corstone1000-Increase-number-of-assets.patch

-- 
2.17.1


