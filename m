Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8DEFC43219
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 15:45:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.9090.1668095125063848176
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 10 Nov 2022 07:45:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 536A61FB;
	Thu, 10 Nov 2022 07:45:30 -0800 (PST)
Received: from e121910.cambridge.arm.com (e121910.cambridge.arm.com [10.1.32.125])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E46003F703;
	Thu, 10 Nov 2022 07:45:22 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Vishnu.Banavath@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 0/3] Corstone-1000: 2022.11.10 RC: update the documentation 
Date: Thu, 10 Nov 2022 15:45:04 +0000
Message-Id: <20221110154507.23779-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 10 Nov 2022 15:45:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4118

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Updating the Corstone-1000 documentation for 2022.11.10 release candidate.

The commits are for master and langdale.

Cheers,
Abdellatif

Abdellatif El Khlifi (1):
  arm-bsp/documentation: corstone1000: 2022.11.10 RC: update the user
    guide

Vishnu Banavath (2):
  arm-bsp/documentation: corstone1000: 2022.11.10 RC: update the release
    notes
  arm-bsp/documentation: corstone1000: 2022.11.10 RC: update the change
    log

 .../documentation/corstone1000/change-log.rst |  88 ++-
 .../corstone1000/release-notes.rst            |  54 +-
 .../documentation/corstone1000/user-guide.rst | 641 ++++++++++++++----
 3 files changed, 619 insertions(+), 164 deletions(-)

-- 
2.17.1


