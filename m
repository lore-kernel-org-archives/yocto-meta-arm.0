Return-Path: <xueliang.zhong@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7377FC433EF
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 18:53:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.9631.1640112813193710774
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 Dec 2021 10:53:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: xueliang.zhong@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A4BED6E;
	Tue, 21 Dec 2021 10:53:32 -0800 (PST)
Received: from cassini-wfh-server-1.stack04.eu02.mi.arm.com (unknown
 [10.58.246.234])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 755D23F718;
	Tue, 21 Dec 2021 10:53:31 -0800 (PST)
From: xueliang.zhong@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Xueliang Zhong <xueliang.zhong@arm.com>
Subject: [PATCH 0/2] arm-bsp/secure-partitions: corstone1000: fix SCT
 setVariable() failures
Date: Tue, 21 Dec 2021 18:53:22 +0000
Message-Id: <20211221185324.3890-1-xueliang.zhong@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 21 Dec 2021 18:53:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2751

From: Xueliang Zhong <xueliang.zhong@arm.com>


This patchset fixes the os_indications setVariable() failure and the SCT
errors seen for setVariable() and getNextVariableName() functions on
Corstone1000.

Gowtham Suresh Kumar (2):
  arm-bsp/secure-partitions: corstone1000: Change UID of variable index
    in SMM
  arm-bsp/secure-partitions: Add error cases to setVariable() and
    getNextVariableName()

 ...-Change-UID-of-variable-index-in-SMM.patch | 34 +++++++++
 ...-Add-missing-features-to-setVariable.patch | 76 +++++++++++++++++++
 ...rameter-check-in-getNextVariableName.patch | 58 ++++++++++++++
 .../trusted-services/ts-corstone1000.inc      |  3 +
 4 files changed, 171 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0029-Change-UID-of-variable-index-in-SMM.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0030-Add-missing-features-to-setVariable.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0031-Add-invalid-parameter-check-in-getNextVariableName.patch

-- 
2.17.1


