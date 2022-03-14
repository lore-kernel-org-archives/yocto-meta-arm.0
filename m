Return-Path: <harry.moulton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F6E2C433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 16:25:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.28538.1647275139989763163
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 14 Mar 2022 09:25:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harry.moulton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FF1FD6E;
	Mon, 14 Mar 2022 09:25:39 -0700 (PDT)
Received: from e123741.cambridge.arm.com (e123741.cambridge.arm.com
 [10.1.196.216])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B6CC3F774;
	Mon, 14 Mar 2022 09:25:38 -0700 (PDT)
From: harry.moulton@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Harry Moulton <harry.moulton@arm.com>
Subject: [PATCH honister 0/2] Backport: Remove redundant code from kernel
  recipe and unwanted images.
Date: Mon, 14 Mar 2022 16:25:00 +0000
Message-Id: <20220314162502.25350-1-harry.moulton@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 14 Mar 2022 16:25:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3170

From: Harry Moulton <harry.moulton@arm.com>

These patches remove some redundant code from the kernel recipe which was 
deleting kernel images, and replaces it with the addition of RDEPENDS.

Harry Moulton (2):
  arm-bsp/linux-yocto: backport remove redundant kernel hacking
  arm-bsp/corstone1000: Add RDEPENDS to remove unwanted images.

 .../conf/machine/include/corstone1000.inc      |  2 ++
 .../linux/linux-arm-platforms.inc              | 18 ------------------
 2 files changed, 2 insertions(+), 18 deletions(-)

-- 
2.17.1


