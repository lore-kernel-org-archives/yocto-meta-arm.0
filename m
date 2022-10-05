Return-Path: <vishnu.banavath@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57749C4332F
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 10:03:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.21783.1664964207067150832
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Oct 2022 03:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: vishnu.banavath@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9316B113E;
	Wed,  5 Oct 2022 03:03:32 -0700 (PDT)
Received: from e125903.cambridge.arm.com (e125903.cambridge.arm.com
 [10.1.195.30])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1CF163F67D;
	Wed,  5 Oct 2022 03:03:25 -0700 (PDT)
From: vishnu.banavath@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 0/1] arm-bsp/corstone500: upgrade kernel to v5.19
Date: Wed,  5 Oct 2022 11:03:14 +0100
Message-Id: <20221005100315.15427-1-vishnu.banavath@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 05 Oct 2022 10:03:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3925

From: Vishnu Banavath <vishnu.banavath@arm.com>

This change is to upgrade kernel to 5.19 for corstone500 target

Vishnu Banavath (1):
  arm-bsp/corstone500: upgrade kernel to v5.19

 meta-arm-bsp/conf/machine/corstone500.conf    |  2 +-
 ...op-CONFIG_SND_SOC_AC97-from-multi_v7.patch | 30 +++++++++++++++++++
 .../linux/linux-arm-platforms.inc             |  4 +++
 3 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone500/0001-arm-defconfig-drop-CONFIG_SND_SOC_AC97-from-multi_v7.patch

-- 
2.17.1


