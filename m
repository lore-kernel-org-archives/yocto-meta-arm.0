Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D5EC4332F
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 11:47:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.22516.1664970438961563527
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Oct 2022 04:47:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: adam.johnston@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A09B7106F;
	Wed,  5 Oct 2022 04:47:24 -0700 (PDT)
Received: from e114993.cambridge.arm.com (e114993.cambridge.arm.com
 [10.1.194.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 32D033F73B;
	Wed,  5 Oct 2022 04:47:17 -0700 (PDT)
From: adam.johnston@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Adam Johnston <adam.johnston@arm.com>
Subject: [PATCH 0/1] arm-bsp/linux-yocto: Upgrade kernel to v5.19 for N1SDP
Date: Wed,  5 Oct 2022 12:47:05 +0100
Message-Id: <20221005114706.2444304-1-adam.johnston@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 05 Oct 2022 11:47:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3927

From: Adam Johnston <adam.johnston@arm.com>

This change is to upgrade the Linux kernel version to 5.19 for N1SDP
target to align with post N1SDP-2022.06.22 refresh

Adam Johnston (1):
  arm-bsp/linux-yocto: Upgrade kernel to v5.19 for N1SDP

 meta-arm-bsp/conf/machine/n1sdp.conf          |  2 +-
 .../linux/linux-arm-platforms.inc             |  3 +-
 ...3-workaround-for-ATC_INV_SIZE_ALL-in.patch | 12 +++--
 ...irk-add-acs-override-for-PCI-devices.patch | 14 ++---
 ...-for-the-Arm-Neoverse-N1SDP-platform.patch | 54 ++++++++++---------
 ...uirk-support-enabling-remote-chip-PC.patch | 29 +++++-----
 ...list-early-Arm-Neoverse-N1-revisions.patch |  8 +--
 ...disable-config-options-that-does-not.patch | 39 ++++++++++++++
 .../n1sdp/enable-realtek-R8169.cfg            |  0
 .../n1sdp/enable-usb_conn_gpio.cfg            |  0
 .../n1sdp/usb_xhci_pci_renesas.cfg            |  0
 11 files changed, 106 insertions(+), 55 deletions(-)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.15 =3D> linux-yo=
cto-5.19}/n1sdp/0001-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in=
.patch (80%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.15 =3D> linux-yo=
cto-5.19}/n1sdp/0002-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.pat=
ch (91%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.15 =3D> linux-yo=
cto-5.19}/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.p=
atch (91%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.15 =3D> linux-yo=
cto-5.19}/n1sdp/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC=
.patch (87%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.15 =3D> linux-yo=
cto-5.19}/n1sdp/0005-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions=
.patch (79%)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.19/n1=
sdp/0006-arm64-defconfig-disable-config-options-that-does-not.patch
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.15 =3D> linux-yo=
cto-5.19}/n1sdp/enable-realtek-R8169.cfg (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.15 =3D> linux-yo=
cto-5.19}/n1sdp/enable-usb_conn_gpio.cfg (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-5.15 =3D> linux-yo=
cto-5.19}/n1sdp/usb_xhci_pci_renesas.cfg (100%)

--=20
2.37.3


