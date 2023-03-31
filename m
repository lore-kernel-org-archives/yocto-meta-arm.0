Return-Path: <xueliang.zhong@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42915C76196
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 19:14:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.4525.1680290082908891206
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 31 Mar 2023 12:14:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: xueliang.zhong@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78117106F;
	Fri, 31 Mar 2023 12:15:26 -0700 (PDT)
Received: from cassini-wfh-server-1.stack04.eu02.mi.arm.com (unknown [10.58.246.234])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E2563F663;
	Fri, 31 Mar 2023 12:14:41 -0700 (PDT)
From: xueliang.zhong@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Xueliang Zhong <xueliang.zhong@arm.com>
Subject: [PATCH 0/1] arm-bsp/optee-os: N1SDP support for optee-os 3.20
Date: Fri, 31 Mar 2023 19:14:33 +0000
Message-Id: <20230331191434.8363-1-xueliang.zhong@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 31 Mar 2023 19:14:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4526

From: Xueliang Zhong <xueliang.zhong@arm.com>

This patch adds optee-os 3.20 support on N1SDP.

Xueliang Zhong (1):
  arm-bsp/optee-os: N1SDP support for optee-os 3.20

 meta-arm-bsp/conf/machine/n1sdp.conf                          | 2 +-
 .../files/optee-os/n1sdp/0004-Handle-logging-syscall.patch    | 4 ++--
 meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bbappend  | 1 -
 meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bbappend  | 1 +
 4 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.17.1


