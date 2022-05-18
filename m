Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A385C4332F
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 13:14:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.4677.1652879652391329733
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 May 2022 06:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CCB523A;
	Wed, 18 May 2022 06:14:11 -0700 (PDT)
Received: from e126835.arm.com (unknown [10.57.2.226])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4BCD63F73D;
	Wed, 18 May 2022 06:14:10 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	emeara01 <emekcan.aras@arm.com>,
	Emekcan Aras <Emekcan.Aras@arm.com>
Subject: [PATCH 3/3] arm-bsp/trusted-firmware-a: increase BL2 size for TC
Date: Wed, 18 May 2022 14:13:56 +0100
Message-Id: <20220518131356.86191-4-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220518131356.86191-1-emekcan.aras@arm.com>
References: <20220518131356.86191-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 May 2022 13:14:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3435

From: emeara01 <emekcan.aras@arm.com>

The new mbedtls version (v2.28) increase the size of TF-A slightly.
This commit increases the size of BL2 for TC, so that TF-A with updated
mbedtls version can fit.

Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
---
 .../files/tc/0001-plat-tc-Increase-maximum-BL2-size.patch     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0001-pl=
at-tc-Increase-maximum-BL2-size.patch b/meta-arm-bsp/recipes-bsp/trusted-=
firmware-a/files/tc/0001-plat-tc-Increase-maximum-BL2-size.patch
index b6a5b4de..e9755efc 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0001-plat-tc-I=
ncrease-maximum-BL2-size.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0001-plat-tc-I=
ncrease-maximum-BL2-size.patch
@@ -22,10 +22,10 @@ index ccabced9e..f45457b9f 100644
   */
  #if TRUSTED_BOARD_BOOT
 -# define PLAT_ARM_MAX_BL2_SIZE		0x20000
-+# define PLAT_ARM_MAX_BL2_SIZE		0x22000
++# define PLAT_ARM_MAX_BL2_SIZE		0x25000
  #else
 -# define PLAT_ARM_MAX_BL2_SIZE		0x14000
-+# define PLAT_ARM_MAX_BL2_SIZE		0x16000
++# define PLAT_ARM_MAX_BL2_SIZE		0x19000
  #endif
=20
  /*
--=20
2.25.1


