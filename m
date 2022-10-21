Return-Path: <vishnu.banavath@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E3DFA373D
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 16:36:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.143.1666370181775697534
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Oct 2022 09:36:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: vishnu.banavath@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85C521063;
	Fri, 21 Oct 2022 09:36:27 -0700 (PDT)
Received: from e125903.cambridge.arm.com (e125903.cambridge.arm.com [10.1.195.30])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 949523F792;
	Fri, 21 Oct 2022 09:36:20 -0700 (PDT)
From: vishnu.banavath@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 0/1] runfvp: corstone1000: add mmc card configuration
Date: Fri, 21 Oct 2022 17:36:11 +0100
Message-Id: <20221021163612.27717-1-vishnu.banavath@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 21 Oct 2022 16:36:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4001

From: Vishnu Banavath <vishnu.banavath@arm.com>

These changes are to pass appropriate MMC card configuration to
corstone1000 FVP.

Vishnu Banavath (1):
  runfvp: corstone1000: add mmc card configuration

 meta-arm-bsp/conf/machine/corstone1000-fvp.conf | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.17.1


