Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA65C433F5
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 11:44:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.26702.1653306283595301786
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 May 2022 04:44:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75BD41063;
	Mon, 23 May 2022 04:44:42 -0700 (PDT)
Received: from e121910.arm.com (unknown [10.57.9.32])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 21D483F73D;
	Mon, 23 May 2022 04:44:40 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Vishnu.Banavath@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 0/2] corstone1000: branches alignment on master 
Date: Mon, 23 May 2022 12:44:29 +0100
Message-Id: <20220523114431.2483-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 23 May 2022 11:44:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3448

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Dropping use of meta-arm-image and FVP script in the CI kas folder

Abdellatif El Khlifi (2):
  kas: corstone1000: drop use of meta-arm-image
  kas: corstone1000: drop the use of the FVP script

 kas/corstone1000-base.yml | 4 ----
 kas/corstone1000-fvp.yml  | 7 -------
 2 files changed, 11 deletions(-)

-- 
2.17.1


