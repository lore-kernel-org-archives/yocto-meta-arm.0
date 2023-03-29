Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7AB4C6FD18
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 15:48:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1509.1680104930172424563
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 29 Mar 2023 08:48:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: adam.johnston@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11D901FB;
	Wed, 29 Mar 2023 08:49:34 -0700 (PDT)
Received: from e114993.cambridge.arm.com (e114993.cambridge.arm.com [10.1.198.60])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 15CDF3F6C4;
	Wed, 29 Mar 2023 08:48:48 -0700 (PDT)
From: adam.johnston@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Adam Johnston <adam.johnston@arm.com>
Subject: [PATCH 0/1] arm-bsp/linux-yocto: Update N1SDP PCI quirk patch
Date: Wed, 29 Mar 2023 16:48:38 +0100
Message-Id: <20230329154840.1827565-1-adam.johnston@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 29 Mar 2023 15:48:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4501

From: Adam Johnston <adam.johnston@arm.com>

Poky commit 9ef8cbcdfc85c3ce2ca52d8bee2ab6929f589383 updates the kernel t=
o
6.1.20 which breaks the PCI quirk patch for the N1SDP.

This change fixes it.

Adam Johnston (1):
  arm-bsp/linux-yocto: Update N1SDP PCI quirk patch

 ...002-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--=20
2.25.1


