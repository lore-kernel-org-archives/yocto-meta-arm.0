Return-Path: <anusmita.duttamazumder@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41488CD11C2
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 15:08:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2305.1712761693267259561
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Apr 2024 08:08:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: anusmita.duttamazumder@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9EB8D139F;
	Wed, 10 Apr 2024 08:08:42 -0700 (PDT)
Received: from PW04GXMM.arm.com (PW04GXMM.arm.com [10.1.28.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F1683F766;
	Wed, 10 Apr 2024 08:08:12 -0700 (PDT)
From: anusmita.duttamazumder@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
Subject: [PATCH 0/2] arm-bsp/corstone1000: add unique guid for fvp and
Date: Wed, 10 Apr 2024 16:07:42 +0100
Message-Id: <20240410150744.53421-1-anusmita.duttamazumder@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 10 Apr 2024 15:08:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5516

From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>

These patches set unique GUID for Corstone1000 FVP and
MPS3

Anusmita Dutta Mazumder (2):
  arm-bsp/u-boot:corstone1000: add unique guid for fvp and mps3
  arm-bsp/tf-m:corstone1000: add unique guid for fvp and mps3

 .../documentation/corstone1000/user-guide.rst |  4 +-
 ...orstone1000-add-unique-guid-for-mps3.patch | 41 +++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |  1 +
 .../u-boot/u-boot-corstone1000.inc            |  1 +
 ...000-set-unique-GUID-for-fvp-and-mps3.patch | 57 +++++++++++++++++++
 5 files changed, 102 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0007-platform-corstone1000-add-unique-guid-for-mps3.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
044-corstone1000-set-unique-GUID-for-fvp-and-mps3.patch

--=20
2.34.1


