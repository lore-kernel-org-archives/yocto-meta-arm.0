Return-Path: <vikas.katariya@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14EB6C77B73
	for <webhook@archiver.kernel.org>; Thu, 13 Apr 2023 16:35:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.18677.1681403727979300078
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 13 Apr 2023 09:35:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: vikas.katariya@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79AE5D75;
	Thu, 13 Apr 2023 09:36:11 -0700 (PDT)
Received: from e125904.cambridge.arm.com (e125904.cambridge.arm.com [10.1.194.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CA183F6C4;
	Thu, 13 Apr 2023 09:35:26 -0700 (PDT)
From: vikas.katariya@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vikas Katariya <vikas.katariya@arm.com>
Subject: [PATCH kirkstone 0/1] Fix N1SDP PCI quirk patch
Date: Thu, 13 Apr 2023 17:35:17 +0100
Message-Id: <20230413163518.5012-1-vikas.katariya@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 13 Apr 2023 16:35:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4574

From: Vikas Katariya <vikas.katariya@arm.com>

The poky commit 74f086529911bdaf07a8414d50de411e20739541 updates
the kernel to v5.15.103 which breaks the PCI quirk patch for the N1SDP.

Vikas Katariya (1):
  arm-bsp/linux-yocto: Fix N1SDP PCI quirk patch

 ...002-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.17.1


