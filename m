Return-Path: <xueliang.zhong@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD43DEE57DF
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 13:57:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.59058.1694440641885480051
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 Sep 2023 06:57:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: xueliang.zhong@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87C12D75;
	Mon, 11 Sep 2023 06:57:58 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B172F3F738;
	Mon, 11 Sep 2023 06:57:20 -0700 (PDT)
From: xueliang.zhong@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Xueliang Zhong <xueliang.zhong@arm.com>
Subject: [PATCH 0/1] arm-bsp/n1sdp: update to linux yocto kernel 6.4
Date: Mon, 11 Sep 2023 14:57:12 +0100
Message-Id: <20230911135713.34756-1-xueliang.zhong@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 11 Sep 2023 13:57:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5032

From: Xueliang Zhong <xueliang.zhong@arm.com>

Bump kernel version to v6.4 and rebased N1SDP kernel PCIe quirk patches
top of this new version.

Xueliang Zhong (1):
  arm-bsp/n1sdp: update to linux yocto kernel 6.4

 meta-arm-bsp/conf/machine/n1sdp.conf          |  2 +-
 .../linux/linux-arm-platforms.inc             |  2 +-
 ...3-workaround-for-ATC_INV_SIZE_ALL-in.patch |  8 +++----
 ...irk-add-acs-override-for-PCI-devices.patch | 12 +++++------
 ...-for-the-Arm-Neoverse-N1SDP-platform.patch | 20 +++++++++---------
 ...uirk-support-enabling-remote-chip-PC.patch |  2 +-
 ...list-early-Arm-Neoverse-N1-revisions.patch |  6 +++---
 ...disable-config-options-that-does-not.patch | 21 ++++++++++++++-----
 .../n1sdp/enable-nvme.cfg                     |  0
 .../n1sdp/enable-realtek-R8169.cfg            |  0
 .../n1sdp/enable-usb_conn_gpio.cfg            |  0
 .../n1sdp/usb_xhci_pci_renesas.cfg            |  0
 12 files changed, 42 insertions(+), 31 deletions(-)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.1 => linux-yocto-6.4}/n1sdp/0001-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch (88%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.1 => linux-yocto-6.4}/n1sdp/0002-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch (93%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.1 => linux-yocto-6.4}/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch (96%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.1 => linux-yocto-6.4}/n1sdp/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch (98%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.1 => linux-yocto-6.4}/n1sdp/0005-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch (88%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.1 => linux-yocto-6.4}/n1sdp/0006-arm64-defconfig-disable-config-options-that-does-not.patch (65%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.1 => linux-yocto-6.4}/n1sdp/enable-nvme.cfg (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.1 => linux-yocto-6.4}/n1sdp/enable-realtek-R8169.cfg (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.1 => linux-yocto-6.4}/n1sdp/enable-usb_conn_gpio.cfg (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.1 => linux-yocto-6.4}/n1sdp/usb_xhci_pci_renesas.cfg (100%)

-- 
2.17.1


