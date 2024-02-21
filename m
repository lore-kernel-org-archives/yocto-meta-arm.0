Return-Path: <anusmita.duttamazumder@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D0DC48BF6
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 09:25:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9293.1708507501319619317
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Feb 2024 01:25:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: anusmita.duttamazumder@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 358B41007;
	Wed, 21 Feb 2024 01:25:39 -0800 (PST)
Received: from PW04GXMM.arm.com (unknown [10.1.36.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D44643F73F;
	Wed, 21 Feb 2024 01:24:59 -0800 (PST)
From: anusmita.duttamazumder@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
Subject: [PATCH 0/2] arm-bsp/n1sdp: update to linux yocto kernel 6.6
Date: Wed, 21 Feb 2024 09:24:47 +0000
Message-Id: <20240221092449.507-1-anusmita.duttamazumder@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 21 Feb 2024 09:25:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5392

From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>

Update kernel version to v6.6 and rebase N1SDP kernel
PCIe quirk patches on top of this new version. Also remove kernel v6.1
recipe since no platform is currently using it.

Anusmita Dutta Mazumder (2):
  arm-bsp/linux-yocto: Remove EOL Linux yocto kernel 6.1
  arm-bsp/n1sdp: update to linux yocto kernel 6.6

 meta-arm-bsp/conf/machine/n1sdp.conf          |    2 +-
 .../linux/cve-exclusion_6.1.inc               | 5192 -----------------
 ...cpumap-Make-counter-as-unsigned-ints.patch |   69 -
 .../linux/linux-arm-platforms.inc             |    2 +-
 ...3-workaround-for-ATC_INV_SIZE_ALL-in.patch |    0
 ...irk-add-acs-override-for-PCI-devices.patch |    0
 ...-for-the-Arm-Neoverse-N1SDP-platform.patch |    0
 ...uirk-support-enabling-remote-chip-PC.patch |    0
 ...list-early-Arm-Neoverse-N1-revisions.patch |    0
 ...disable-config-options-that-does-not.patch |   30 +-
 .../n1sdp/enable-nvme.cfg                     |    0
 .../n1sdp/enable-realtek-R8169.cfg            |    0
 .../n1sdp/enable-usb_conn_gpio.cfg            |    0
 .../n1sdp/usb_xhci_pci_renesas.cfg            |    0
 .../linux/linux-yocto-rt_6.1%.bbappend        |    5 -
 .../linux/linux-yocto-rt_6.1.bb               |   45 -
 .../linux/linux-yocto_6.1%.bbappend           |    5 -
 .../recipes-kernel/linux/linux-yocto_6.1.bb   |   38 -
 18 files changed, 26 insertions(+), 5362 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/cve-exclusion_6.1.i=
nc
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/0001-perf-cpu=
map-Make-counter-as-unsigned-ints.patch
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.1 =3D> linux-yoc=
to-6.6}/n1sdp/0001-iommu-arm-smmu-v3-workaround-for-ATC_INV_SIZE_ALL-in.p=
atch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.1 =3D> linux-yoc=
to-6.6}/n1sdp/0002-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch=
 (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.1 =3D> linux-yoc=
to-6.6}/n1sdp/0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.pat=
ch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.1 =3D> linux-yoc=
to-6.6}/n1sdp/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.p=
atch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.1 =3D> linux-yoc=
to-6.6}/n1sdp/0005-arm64-kpti-Whitelist-early-Arm-Neoverse-N1-revisions.p=
atch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.1 =3D> linux-yoc=
to-6.6}/n1sdp/0006-arm64-defconfig-disable-config-options-that-does-not.p=
atch (58%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.1 =3D> linux-yoc=
to-6.6}/n1sdp/enable-nvme.cfg (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.1 =3D> linux-yoc=
to-6.6}/n1sdp/enable-realtek-R8169.cfg (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.1 =3D> linux-yoc=
to-6.6}/n1sdp/enable-usb_conn_gpio.cfg (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-6.1 =3D> linux-yoc=
to-6.6}/n1sdp/usb_xhci_pci_renesas.cfg (100%)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-rt_6.1%=
.bbappend
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-rt_6.1.=
bb
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_6.1%.bb=
append
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_6.1.bb

--=20
2.40.0.windows.1


