Return-Path: <xueliang.zhong@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AAB5C76196
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 16:37:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.60108.1680280641262667107
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 31 Mar 2023 09:37:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: xueliang.zhong@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 971A6106F;
	Fri, 31 Mar 2023 09:38:04 -0700 (PDT)
Received: from cassini-wfh-server-1.stack04.eu02.mi.arm.com (unknown [10.58.246.234])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 83A493F6C4;
	Fri, 31 Mar 2023 09:37:19 -0700 (PDT)
From: xueliang.zhong@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Xueliang Zhong <xueliang.zhong@arm.com>
Subject: [PATCH 0/1] arm-bsp/n1sdp-board-firmware: update to newer SHA
Date: Fri, 31 Mar 2023 16:37:12 +0000
Message-Id: <20230331163713.28364-1-xueliang.zhong@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 31 Mar 2023 16:37:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4524

From: Xueliang Zhong <xueliang.zhong@arm.com>

arm-bsp/n1sdp-board-firmware: update to newer SHA.

Xueliang Zhong (1):
  arm-bsp/n1sdp-board-firmware: update to newer SHA

 .../recipes-bsp/images/n1sdp-board-firmware_2022.06.22.bb      | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.17.1


