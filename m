Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D42BC6FA91
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 15:00:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.39.1663858806088949380
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Sep 2022 08:00:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3104616F8;
	Thu, 22 Sep 2022 08:00:12 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com
 [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C8FF23F73D;
	Thu, 22 Sep 2022 08:00:04 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Emekcan <emekcan.aras@arm.com>
Subject: [PATCH 0/2] Add MHU and RPMSG driver for cs1k
Date: Thu, 22 Sep 2022 15:59:54 +0100
Message-Id: <20220922145956.56063-1-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Sep 2022 15:00:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3811

From: Emekcan <emekcan.aras@arm.com>

The host uses MHUs to send/receive data from the external 
system in corstone1000. These commits add MHU mailbox device
tree bindings and rpmsg mailbox driver. The host can now use 
the driver under /dev/rpmsg0_ctrl0 to communicate with external 
system.

Emekcan (2):
  arm-bsp/u-boot: Add external system MHUs to u-boot device tree
  arm-bsp/kernel: Add rpmsg_arm_mailbox to corstone1000

 ...d-rpmsg-client-to-u-boot-device-tree.patch |  81 +++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   1 +
 ...03-Add-rpsmg-driver-for-corstone1000.patch | 222 ++++++++++++++++++
 .../linux/files/corstone1000/defconfig        |   7 +-
 .../linux/linux-arm-platforms.inc             |   1 +
 5 files changed, 311 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0027-Add-mhu-and-rpmsg-client-to-u-boot-device-tree.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/0003-Add-rpsmg-driver-for-corstone1000.patch

-- 
2.17.1


