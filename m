Return-Path: <vikas.katariya@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C224C47DAF
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 17:05:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.18558.1705597496095586071
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jan 2024 09:04:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: vikas.katariya@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEB7E1042;
	Thu, 18 Jan 2024 09:05:40 -0800 (PST)
Received: from e125904.cambridge.arm.com (e125904.cambridge.arm.com [10.1.199.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EED4D3F5A1;
	Thu, 18 Jan 2024 09:04:53 -0800 (PST)
From: vikas.katariya@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vikas Katariya <vikas.katariya@arm.com>
Subject: [PATCH 0/2] Downgrade linux yocto kernel (N1SDP)
Date: Thu, 18 Jan 2024 17:04:43 +0000
Message-Id: <20240118170445.564619-1-vikas.katariya@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 18 Jan 2024 17:05:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5341

From: Vikas Katariya <vikas.katariya@arm.com>

This patchset downgrades the linux yocto kernel for N1SDP to 6.1
and removes 6.5 reciepe which is end of life.

Vikas Katariya (2):
  arm-bsp/n1sdp: Downgrade to 6.1 linux yocto kernel
  arm-bsp/linux-yocto: Remove EOL Linux yocto kernel 6.5

 meta-arm-bsp/conf/machine/n1sdp.conf          |  2 +-
 .../linux/linux-arm-platforms.inc             |  2 +-
 ...3-workaround-for-ATC_INV_SIZE_ALL-in.patch | 14 ++++---
 ...irk-add-acs-override-for-PCI-devices.patch | 15 ++++----
 ...-for-the-Arm-Neoverse-N1SDP-platform.patch | 21 ++++++-----
 ...uirk-support-enabling-remote-chip-PC.patch |  2 +-
 ...list-early-Arm-Neoverse-N1-revisions.patch |  6 +--
 ...disable-config-options-that-does-not.patch | 21 +++--------
 .../n1sdp/enable-nvme.cfg                     |  0
 .../n1sdp/enable-realtek-R8169.cfg            |  0
 .../n1sdp/enable-usb_conn_gpio.cfg            |  0
 .../n1sdp/usb_xhci_pci_renesas.cfg            |  0
 .../recipes-kernel/linux/linux-yocto_6.5.bb   | 37 -------------------
 13 files changed, 38 insertions(+), 82 deletions(-)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.5 =3D> linux-yoc=
to-6.1}/n1sdp/0001-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.p=
atch (83%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.5 =3D> linux-yoc=
to-6.1}/n1sdp/0002-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch=
 (93%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.5 =3D> linux-yoc=
to-6.1}/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.pat=
ch (95%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.5 =3D> linux-yoc=
to-6.1}/n1sdp/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.p=
atch (98%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.5 =3D> linux-yoc=
to-6.1}/n1sdp/0005-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.p=
atch (88%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.5 =3D> linux-yoc=
to-6.1}/n1sdp/0006-arm64-defconfig-disable-config-options-that-does-not.p=
atch (65%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.5 =3D> linux-yoc=
to-6.1}/n1sdp/enable-nvme.cfg (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.5 =3D> linux-yoc=
to-6.1}/n1sdp/enable-realtek-R8169.cfg (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.5 =3D> linux-yoc=
to-6.1}/n1sdp/enable-usb_conn_gpio.cfg (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.5 =3D> linux-yoc=
to-6.1}/n1sdp/usb_xhci_pci_renesas.cfg (100%)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_6.5.bb

--=20
2.25.1


