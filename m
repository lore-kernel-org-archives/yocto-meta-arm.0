Return-Path: <anusmita.duttamazumder@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39924C54E58
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 11:35:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.41070.1710761744922520241
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 Mar 2024 04:35:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: anusmita.duttamazumder@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 772B7DA7;
	Mon, 18 Mar 2024 04:36:19 -0700 (PDT)
Received: from PW04GXMM.arm.com (PW04GXMM.arm.com [10.1.39.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D536D3F762;
	Mon, 18 Mar 2024 04:35:43 -0700 (PDT)
From: anusmita.duttamazumder@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
Subject: [PATCH 0/1] arm-bsp/n1sdp: Update EDK2 version
Date: Mon, 18 Mar 2024 11:35:30 +0000
Message-Id: <20240318113531.9598-1-anusmita.duttamazumder@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 18 Mar 2024 11:35:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5446

From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>

Update N1SDP EDK2 version to 2023-11 and rebase
existing out of tree patches.

Anusmita Dutta Mazumder (1):
  arm-bsp/n1sdp: Update EDK2 version

 meta-arm-bsp/conf/machine/n1sdp.conf                   |  2 +-
 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202305.bb  |  7 -------
 ...orm-ARM-N1Sdp-Reserve-OP-TEE-Region-from-UEFI.patch | 10 ++++++----
 3 files changed, 7 insertions(+), 12 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202305.bb

--=20
2.34.1


