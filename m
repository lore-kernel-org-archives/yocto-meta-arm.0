Return-Path: <xueliang.zhong@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3976C07545
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 18:10:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.180798.1698257419921318131
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 25 Oct 2023 11:10:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: xueliang.zhong@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8890A1FB;
	Wed, 25 Oct 2023 11:11:00 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E6313F738;
	Wed, 25 Oct 2023 11:10:18 -0700 (PDT)
From: xueliang.zhong@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Xueliang Zhong <xueliang.zhong@arm.com>
Subject: [PATCH 0/1] arm-bsp/n1sdp: update to linux yocto kernel 6.5
Date: Wed, 25 Oct 2023 19:10:10 +0100
Message-Id: <20231025181011.2345557-1-xueliang.zhong@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 25 Oct 2023 18:10:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5172

From: Xueliang Zhong <xueliang.zhong@arm.com>

Bump kernel version to v6.5 and rebased N1SDP kernel PCIe quirk patches t=
op of this new version.

Xueliang Zhong (1):
  arm-bsp/n1sdp: update to linux yocto kernel 6.5

 meta-arm-bsp/conf/machine/n1sdp.conf              |  2 +-
 .../recipes-kernel/linux/linux-arm-platforms.inc  |  2 +-
 ...mu-v3-workaround-for-ATC_INV_SIZE_ALL-in.patch | 14 ++++++--------
 ...i_quirk-add-acs-override-for-PCI-devices.patch | 15 +++++++--------
 ...uirk-for-the-Arm-Neoverse-N1SDP-platform.patch |  9 ++++-----
 ...dd-quirk-support-enabling-remote-chip-PC.patch |  2 +-
 ...hitelist-early-Arm-Neoverse-N1-revisions.patch |  6 +++---
 ...fig-disable-config-options-that-does-not.patch |  0
 .../n1sdp/enable-nvme.cfg                         |  0
 .../n1sdp/enable-realtek-R8169.cfg                |  0
 .../n1sdp/enable-usb_conn_gpio.cfg                |  0
 .../n1sdp/usb_xhci_pci_renesas.cfg                |  0
 12 files changed, 23 insertions(+), 27 deletions(-)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.4 =3D> linux-yoc=
to-6.5}/n1sdp/0001-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.p=
atch (83%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.4 =3D> linux-yoc=
to-6.5}/n1sdp/0002-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch=
 (93%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.4 =3D> linux-yoc=
to-6.5}/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.pat=
ch (98%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.4 =3D> linux-yoc=
to-6.5}/n1sdp/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.p=
atch (98%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.4 =3D> linux-yoc=
to-6.5}/n1sdp/0005-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.p=
atch (88%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.4 =3D> linux-yoc=
to-6.5}/n1sdp/0006-arm64-defconfig-disable-config-options-that-does-not.p=
atch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.4 =3D> linux-yoc=
to-6.5}/n1sdp/enable-nvme.cfg (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.4 =3D> linux-yoc=
to-6.5}/n1sdp/enable-realtek-R8169.cfg (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.4 =3D> linux-yoc=
to-6.5}/n1sdp/enable-usb_conn_gpio.cfg (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.4 =3D> linux-yoc=
to-6.5}/n1sdp/usb_xhci_pci_renesas.cfg (100%)

--=20
2.25.1


