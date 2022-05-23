Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 678C7C433F5
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 11:50:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.26611.1653306641861105388
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 May 2022 04:50:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C4601063;
	Mon, 23 May 2022 04:50:41 -0700 (PDT)
Received: from e121910.arm.com (unknown [10.57.9.32])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 196503F73D;
	Mon, 23 May 2022 04:50:39 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Vishnu.Banavath@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH kirkstone 0/2] backport to kirkstone <corstone1000: branches
 alignment on master>
Date: Mon, 23 May 2022 12:50:28 +0100
Message-Id: <20220523115030.5235-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 23 May 2022 11:50:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3451

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Changes:

- Align all repos to kirkstone stable branch HEAD
- Drop the use of the FVP script and meta-arm-image

*** BLURB HERE ***

Abdellatif El Khlifi (2):
  kas: corstone1000: set HEADs to kirkstone and drop use of
    meta-arm-image
  kas: corstone1000: drop the use of the FVP script

 kas/corstone1000-base.yml | 8 +-------
 kas/corstone1000-fvp.yml  | 7 -------
 2 files changed, 1 insertion(+), 14 deletions(-)

-- 
2.17.1


