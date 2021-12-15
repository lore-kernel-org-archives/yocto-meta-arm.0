Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E8D0C43219
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:44:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.1927.1639591470867703088
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 15 Dec 2021 10:04:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73EC01435;
	Wed, 15 Dec 2021 10:04:30 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.35.196])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3AD523F5A1;
	Wed, 15 Dec 2021 10:04:29 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH honister 0/1] backport corstone1000: update the FVP script
 repo SHA
Date: Wed, 15 Dec 2021 18:04:14 +0000
Message-Id: <20211215180415.9537-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 16 Dec 2021 01:44:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2722

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Updating the SHA on honister as well.

Abdellatif El Khlifi (1):
  kas: corstone1000: update the FVP script repo SHA

 kas/corstone1000-fvp.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.17.1


