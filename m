Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7463AC433FE
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 17:25:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.28780.1639502707799185558
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 09:25:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2616D6E;
	Tue, 14 Dec 2021 09:25:05 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.34.32])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E82C3F5A1;
	Tue, 14 Dec 2021 09:25:04 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH honister 0/1] backport "corstone1000: set TF-M SHA"
Date: Tue, 14 Dec 2021 17:24:55 +0000
Message-Id: <20211214172456.27641-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Dec 2021 17:25:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2706

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Backporting from master setting TF-M hash.

Vishnu Banavath (1):
  arm-bsp/trusted-firmware-m: corstone1000: update TF-M SHA

 .../trusted-firmware-m/trusted-firmware-m-corstone1000.inc      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.17.1


