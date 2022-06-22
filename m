Return-Path: <xueliang.zhong@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2285BC43334
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 08:59:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.4995.1655888356169676823
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 Jun 2022 01:59:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: xueliang.zhong@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D113F13D5;
	Wed, 22 Jun 2022 01:59:15 -0700 (PDT)
Received: from cassini-wfh-server-1.stack04.eu02.mi.arm.com (unknown
 [10.58.246.234])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F404D3F66F;
	Wed, 22 Jun 2022 01:59:14 -0700 (PDT)
From: xueliang.zhong@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Xueliang Zhong <xueliang.zhong@arm.com>
Subject: [PATCH 0/1] arm-bsp/n1sdp: fix boot due to TF-A 2.7 update
Date: Wed, 22 Jun 2022 08:59:06 +0000
Message-Id: <20220622085907.22892-1-xueliang.zhong@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 22 Jun 2022 08:59:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3522

From: Xueliang Zhong <xueliang.zhong@arm.com>

The N1SDP board cannot boot after recent TF-A 2.7 update in meta-arm.
This is due to TF-A 2.7 not configured correctly for N1SDP board to
support trusted boot feature.

This patch temporarily brings back TF-A 2.6 recipes for fixing the N1SDP
boot. A proper fix is in work progress to configure TF-A 2.7 correctly
to support trusted boot on N1SDP.

Xueliang Zhong (1):
  arm-bsp/n1sdp: fix boot due to TF-A 2.7 update

 meta-arm-bsp/conf/machine/n1sdp.conf                 |  2 ++
 .../trusted-firmware-a_2.6.bbappend                  |  8 ++++++++
 .../trusted-firmware-a/trusted-firmware-a_2.6.bb     | 12 ++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bbappend
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb

-- 
2.17.1


