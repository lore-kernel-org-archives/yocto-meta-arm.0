Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E456C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 15:53:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1554.1645113238719515679
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Feb 2022 07:53:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 066E8113E;
	Thu, 17 Feb 2022 07:53:58 -0800 (PST)
Received: from e126835.arm.com (unknown [10.57.40.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B99113F718;
	Thu, 17 Feb 2022 07:53:56 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	jon.mason@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 2/2] arm-bsp/tf-m: update git SHA
Date: Thu, 17 Feb 2022 15:53:46 +0000
Message-Id: <20220217155346.2566392-3-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220217155346.2566392-1-emekcan.aras@arm.com>
References: <20220217155346.2566392-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 17 Feb 2022 15:53:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3006

From: Vishnu Banavath <vishnu.banavath@arm.com>

This change is to update TF-M git SHA to fix
psa-arch-tests test case failures.

Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
---
 .../trusted-firmware-m/trusted-firmware-m-corstone1000.inc     | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index 398d66eb..f387be5a 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -7,9 +7,10 @@ TFM_DEBUG =3D "1"
 ## Default is the MPS3 board
 TFM_PLATFORM_IS_FVP ?=3D "FALSE"
 EXTRA_OECMAKE +=3D "-DPLATFORM_IS_FVP=3D${TFM_PLATFORM_IS_FVP}"
+EXTRA_OECMAKE +=3D "-DCC312_LEGACY_DRIVER_API_ENABLED=3DOFF"
=20
 SRCBRANCH_tfm =3D "master"
-SRCREV_tfm =3D "49a28600f9dd640638f667273ef15acb6d1a8e1c"
+SRCREV_tfm =3D "f8c7e5361b92b16108165601ea81c5d01feb3c22"
 SRCREV_mbedtls =3D "d65aeb37349ad1a50e0f6c9b694d4b5290d60e49"
 SRCREV_mcuboot =3D "29099e1d17f93ae1d09fe945ad191b703aacd3d8"
=20
--=20
2.25.1


