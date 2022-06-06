Return-Path: <xueliang.zhong@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38CC7C43334
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 16:34:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.542.1654533273679840707
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Jun 2022 09:34:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: xueliang.zhong@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74CC1165C;
	Mon,  6 Jun 2022 09:34:32 -0700 (PDT)
Received: from cassini-wfh-server-1.stack04.eu02.mi.arm.com (unknown
 [10.58.246.234])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A86013F73B;
	Mon,  6 Jun 2022 09:34:31 -0700 (PDT)
From: xueliang.zhong@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Xueliang Zhong <xueliang.zhong@arm.com>
Subject: [PATCH 0/1] arm-bsp/n1sdp: upgrade board-firmware version
Date: Mon,  6 Jun 2022 16:34:21 +0000
Message-Id: <20220606163422.8688-1-xueliang.zhong@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 06 Jun 2022 16:34:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3473

From: Xueliang Zhong <xueliang.zhong@arm.com>

Upgraded N1SDP board-firmware to N1SDP-2021.10.12 version. This upgrade
is to align with latest N1SDP release.

Xueliang Zhong (1):
  arm-bsp/n1sdp: upgrade board-firmware version

 ..._2020.07.27.bb => n1sdp-board-firmware_2021.10.12.bb} | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta-arm-bsp/recipes-bsp/images/{n1sdp-board-firmware_2020.07.27.bb => n1sdp-board-firmware_2021.10.12.bb} (65%)

-- 
2.17.1


