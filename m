Return-Path: <xueliang.zhong@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32527C07E9D
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 17:18:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.673.1664212694768916906
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Sep 2022 10:18:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: xueliang.zhong@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBA891CE2;
	Mon, 26 Sep 2022 10:18:20 -0700 (PDT)
Received: from cassini-wfh-server-1.stack04.eu02.mi.arm.com (unknown
 [10.58.246.234])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 894E93F66F;
	Mon, 26 Sep 2022 10:18:13 -0700 (PDT)
From: xueliang.zhong@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Xueliang Zhong <xueliang.zhong@arm.com>
Subject: [PATCH 0/1] arm-bsp/n1sdp: upgrade scp-firmware version
Date: Mon, 26 Sep 2022 17:18:05 +0000
Message-Id: <20220926171806.12213-1-xueliang.zhong@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 26 Sep 2022 17:18:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3840

From: Xueliang Zhong <xueliang.zhong@arm.com>

Upgraded N1SDP scp-firmware to N1SDP-2022.06.22 version.

Xueliang Zhong (1):
  arm-bsp/n1sdp: upgrade scp-firmware version

 .../recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc    | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

-- 
2.17.1


