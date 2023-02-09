Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85792C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 12:05:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12745.1675944310534898383
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Feb 2023 04:05:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4224E1515;
	Thu,  9 Feb 2023 04:05:52 -0800 (PST)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0657B3F703;
	Thu,  9 Feb 2023 04:05:08 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH langdale 0/1] arm/trusted-firmware-m: Do not use release branches
Date: Thu,  9 Feb 2023 12:04:55 +0000
Message-Id: <20230209120456.26364-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 09 Feb 2023 12:05:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4375

From: Emekcan Aras <emekcan.aras@arm.com>

TFM repos do not use release branches. TFM-test repo does not use master
branch and use detached head for the 1.6 release. This commits makes necessary
changes to be able to build tfm and tfm-test again for langdale.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>

Emekcan Aras (1):
  arm/trusted-firmware-m: Do not use release branches

 .../trusted-firmware-m/trusted-firmware-m_1.6.0.bb           | 5 ++---
 .../trusted-firmware-m-scripts-native_1.6.0.bb               | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

-- 
2.17.1


