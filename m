Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04FE8C433EF
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 16:17:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.1704.1636647425211937879
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Nov 2021 08:17:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC3CB13A1
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 Nov 2021 08:17:04 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 781D03F718
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 Nov 2021 08:17:04 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH v2 2/5] arm-bsp/trusted-firmware-m: update corstone1000
 customisations for 1.4.1 update
Date: Thu, 11 Nov 2021 16:16:56 +0000
Message-Id: <20211111161659.2529512-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211111161659.2529512-1-ross.burton@arm.com>
References: <20211111161659.2529512-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 Nov 2021 16:17:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2372

This BSP sets an intermediate SHA that is newer than the 1.4.1, but the
branch needs specifying now.

Also remove SRCREV_FORMAT, the PV doesn't include SRCPV so it isn't being=
 used.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-m/trusted-firmware-m-corstone1000.inc     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index 997859cf..ae28dd7e 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -13,10 +13,9 @@ INSANE_SKIP:${PN} =3D "arch"
 TFM_PLATFORM_IS_FVP ?=3D "TRUE"
 EXTRA_OECMAKE +=3D "-DPLATFORM_IS_FVP=3D${TFM_PLATFORM_IS_FVP}"
=20
+SRCBRANCH_tfm =3D "master"
 SRCREV_tfm =3D "ccd82e35f539c0d7261b2935d6d30c550cfc6736"
=20
-SRCREV_FORMAT =3D "tfm_mcuboot_tfm-tests_mbedtls"
-
 # The install task signs the TF-A BL2 and FIP binaries.
 # So they need to be copied to the sysroot. Hence the dependencies below=
:
 do_prepare_recipe_sysroot[depends]+=3D "virtual/trusted-firmware-a:do_po=
pulate_sysroot"
--=20
2.25.1


