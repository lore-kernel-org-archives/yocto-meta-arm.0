Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B4DC761AF
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 15:48:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1594.1680104930993596520
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 29 Mar 2023 08:48:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: adam.johnston@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8D952F4;
	Wed, 29 Mar 2023 08:49:34 -0700 (PDT)
Received: from e114993.cambridge.arm.com (e114993.cambridge.arm.com [10.1.198.60])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 027AD3F6C4;
	Wed, 29 Mar 2023 08:48:49 -0700 (PDT)
From: adam.johnston@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Adam Johnston <adam.johnston@arm.com>
Subject: [PATCH 1/1] arm-bsp/linux-yocto: Update N1SDP PCI quirk patch
Date: Wed, 29 Mar 2023 16:48:39 +0100
Message-Id: <20230329154840.1827565-2-adam.johnston@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230329154840.1827565-1-adam.johnston@arm.com>
References: <20230329154840.1827565-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 29 Mar 2023 15:48:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4502

From: Adam Johnston <adam.johnston@arm.com>

Poky commit 9ef8cbcdfc85c3ce2ca52d8bee2ab6929f589383 updates
the kernel to 6.1.20 which breaks the PCI quirk patch for the N1SDP.

This change fixes it.

Signed-off-by: Adam Johnston <adam.johnston@arm.com>
---
 ...002-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0002=
-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch b/meta-arm-bsp/re=
cipes-kernel/linux/linux-yocto-6.1/n1sdp/0002-n1sdp-pci_quirk-add-acs-ove=
rride-for-PCI-devices.patch
index 7a5ab7a2..cb72ed0a 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0002-n1sdp-=
pci_quirk-add-acs-override-for-PCI-devices.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-6.1/n1sdp/0002-n1sdp-=
pci_quirk-add-acs-override-for-PCI-devices.patch
@@ -150,9 +150,9 @@ index 285acc4aaccc..d6ebef1f30db 100644
   * Some NVIDIA GPU devices do not work with bus reset, SBR needs to be
   * prevented for those affected devices.
 @@ -4980,6 +5081,7 @@ static const struct pci_dev_acs_enabled {
- 	{ PCI_VENDOR_ID_NXP, 0x8d9b, pci_quirk_nxp_rp_acs },
- 	/* Zhaoxin Root/Downstream Ports */
  	{ PCI_VENDOR_ID_ZHAOXIN, PCI_ANY_ID, pci_quirk_zhaoxin_pcie_ports_acs =
},
+ 	/* Wangxun nics */
+ 	{ PCI_VENDOR_ID_WANGXUN, PCI_ANY_ID, pci_quirk_wangxun_nic_acs },
 +	{ PCI_ANY_ID, PCI_ANY_ID, pcie_acs_overrides },
  	{ 0 }
  };
--=20
2.25.1


