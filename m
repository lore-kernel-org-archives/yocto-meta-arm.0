Return-Path: <vishnu.banavath@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D8CCC433FE
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 16:03:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.42932.1666022590845079162
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 17 Oct 2022 09:03:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: vishnu.banavath@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64A631042;
	Mon, 17 Oct 2022 09:03:16 -0700 (PDT)
Received: from e125903.cambridge.arm.com (e125903.cambridge.arm.com [10.1.195.30])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7CCEA3F792;
	Mon, 17 Oct 2022 09:03:09 -0700 (PDT)
From: vishnu.banavath@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 0/1] arm-bsp/linux: add kernel file search path for N1SDP
Date: Mon, 17 Oct 2022 17:03:00 +0100
Message-Id: <20221017160301.37446-1-vishnu.banavath@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 17 Oct 2022 16:03:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3973

From: Vishnu Banavath <vishnu.banavath@arm.com>

    This change is to add ARMFILESPATHS into serach path
    for linux for N1SDP target.

Vishnu Banavath (1):
  arm-bsp/linux: add kernel file search path for N1SDP

 meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc | 1 +
 1 file changed, 1 insertion(+)

-- 
2.17.1


