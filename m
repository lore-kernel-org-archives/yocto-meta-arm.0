Return-Path: <xueliang.zhong@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA9AC433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 09:58:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.7799.1646906287860436879
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 10 Mar 2022 01:58:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: xueliang.zhong@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACC661691;
	Thu, 10 Mar 2022 01:58:06 -0800 (PST)
Received: from cassini-wfh-server-1.stack04.eu02.mi.arm.com (unknown
 [10.58.246.234])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 075E93FA27;
	Thu, 10 Mar 2022 01:58:05 -0800 (PST)
From: xueliang.zhong@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Xueliang Zhong <xueliang.zhong@arm.com>
Subject: [PATCH 0/1] arm-bsp/n1sdp: migrate to linux yocto kernel 5.15
Date: Thu, 10 Mar 2022 09:57:55 +0000
Message-Id: <20220310095756.23619-1-xueliang.zhong@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 10 Mar 2022 09:58:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3144

From: Xueliang Zhong <xueliang.zhong@arm.com>

This patchset includes:
- Rebased and fixed N1SDP kernel 5.4 PCIe quirk patches to apply on 5.15
- Removed 5.10 kernel recipe for N1SDP
- Dropped RT kernel support, as it is no longer supported on N1SDP

Xueliang Zhong (1):
  arm-bsp/n1sdp: migrate to linux yocto kernel 5.15

 meta-arm-bsp/conf/machine/n1sdp.conf          |   3 +-
 .../linux/linux-arm-platforms.inc             |  12 +-
 ...drop-unused-BACKLIGHT_GENERIC-option.patch |  41 ------
 ...e-n1sdp-pci-quirk-for-SR-IOV-support.patch |  58 --------
 ...uirk-support-enabling-remote-chip-PC.patch | 137 ------------------
 .../linux-yocto-5.10/n1sdp/no-power-avs.patch |  29 ----
 ...3-workaround-for-ATC_INV_SIZE_ALL-in.patch |  49 +++++++
 ...rk-add-acs-override-for-PCI-devices.patch} |  45 +++---
 ...for-the-Arm-Neoverse-N1SDP-platform.patch} | 130 ++++++++---------
 ...uirk-support-enabling-remote-chip-PC.patch | 137 ++++++++++++++++++
 ...list-early-Arm-Neoverse-N1-revisions.patch |  34 +++++
 .../n1sdp/enable-realtek-R8169.cfg            |   0
 .../n1sdp/enable-usb_conn_gpio.cfg            |   0
 .../n1sdp/usb_xhci_pci_renesas.cfg            |   2 +
 14 files changed, 313 insertions(+), 364 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0001-arm64-defconfig-drop-unused-BACKLIGHT_GENERIC-option.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0003-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/no-power-avs.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0001-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.10/n1sdp/0001-pci_quirk-add-acs-override-for-PCI-devices.patch => linux-yocto-5.15/n1sdp/0002-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch} (75%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.10/n1sdp/0002-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch => linux-yocto-5.15/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch} (78%)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/0005-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.patch
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.10 => linux-yocto-5.15}/n1sdp/enable-realtek-R8169.cfg (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.10 => linux-yocto-5.15}/n1sdp/enable-usb_conn_gpio.cfg (100%)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.15/n1sdp/usb_xhci_pci_renesas.cfg

-- 
2.17.1


