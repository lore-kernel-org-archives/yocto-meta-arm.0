Return-Path: <xueliang.zhong@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F062FC678D4
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 11:41:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20915.1677843690154862573
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 03 Mar 2023 03:41:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: xueliang.zhong@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C77E32F4;
	Fri,  3 Mar 2023 03:42:12 -0800 (PST)
Received: from cassini-wfh-server-1.stack04.eu02.mi.arm.com (unknown [10.58.246.234])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2B013F93E;
	Fri,  3 Mar 2023 03:41:28 -0800 (PST)
From: xueliang.zhong@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Xueliang Zhong <xueliang.zhong@arm.com>
Subject: [PATCH 0/1] arm-bsp/n1sdp: update to linux yocto kernel 6.1
Date: Fri,  3 Mar 2023 11:41:20 +0000
Message-Id: <20230303114121.6297-1-xueliang.zhong@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 03 Mar 2023 11:41:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4465

From: Xueliang Zhong <xueliang.zhong@arm.com>

This patch set rebased N1SDP kernel PCIe quirk patches on 6.1 kernel.

Xueliang Zhong (1):
  arm-bsp/n1sdp: update to linux yocto kernel 6.1

 meta-arm-bsp/conf/machine/n1sdp.conf          |  2 +-
 .../linux/linux-arm-platforms.inc             |  3 +-
 ...3-workaround-for-ATC_INV_SIZE_ALL-in.patch | 13 +++--
 ...irk-add-acs-override-for-PCI-devices.patch | 18 ++++---
 ...-for-the-Arm-Neoverse-N1SDP-platform.patch | 52 +++++++++++--------
 ...uirk-support-enabling-remote-chip-PC.patch | 37 +++++++------
 ...list-early-Arm-Neoverse-N1-revisions.patch | 14 +++--
 ...disable-config-options-that-does-not.patch |  1 +
 .../linux-yocto-6.1/n1sdp/enable-nvme.cfg     |  3 ++
 .../n1sdp/enable-realtek-R8169.cfg            |  0
 .../n1sdp/enable-usb_conn_gpio.cfg            |  0
 .../n1sdp/usb_xhci_pci_renesas.cfg            |  0
 .../recipes-kernel/linux/linux-yocto_5.19.bb  | 28 ----------
 13 files changed, 85 insertions(+), 86 deletions(-)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.19 => linux-yocto-6.1}/n1sdp/0001-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch (83%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.19 => linux-yocto-6.1}/n1sdp/0002-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch (91%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.19 => linux-yocto-6.1}/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch (90%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.19 => linux-yocto-6.1}/n1sdp/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch (84%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.19 => linux-yocto-6.1}/n1sdp/0005-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch (75%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.19 => linux-yocto-6.1}/n1sdp/0006-arm64-defconfig-disable-config-options-that-does-not.patch (95%)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/enable-nvme.cfg
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.19 => linux-yocto-6.1}/n1sdp/enable-realtek-R8169.cfg (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.19 => linux-yocto-6.1}/n1sdp/enable-usb_conn_gpio.cfg (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.19 => linux-yocto-6.1}/n1sdp/usb_xhci_pci_renesas.cfg (100%)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.19.bb

-- 
2.17.1


