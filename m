Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C66E1C433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 10:18:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8989.1639649893014288370
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Dec 2021 02:18:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 223E21474
	for <meta-arm@lists.yoctoproject.org>; Thu, 16 Dec 2021 02:18:11 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C201C3F774
	for <meta-arm@lists.yoctoproject.org>; Thu, 16 Dec 2021 02:18:10 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/trusted-firmware-m: update CS1K bbappend for TF-M
 1.5.0, again
Date: Thu, 16 Dec 2021 10:18:09 +0000
Message-Id: <20211216101809.3239859-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 16 Dec 2021 10:18:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2727

Remove the explicit SRCREV_mcuboot as this is the same as the 1.5.0
recipe.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-m/trusted-firmware-m-corstone1000.inc     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index cd6a2249..f37cf33d 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -10,9 +10,8 @@ EXTRA_OECMAKE +=3D "-DPLATFORM_IS_FVP=3D${TFM_PLATFORM_=
IS_FVP}"
=20
 SRCBRANCH_tfm =3D "master"
 SRCREV_tfm =3D "ca8c634a3dc15b42d41655a14e512b642320893a"
-SRCREV_mcuboot =3D "29099e1d17f93ae1d09fe945ad191b703aacd3d8"
=20
-PV =3D "1.5+git${SRCREV_tfm}"
+PV =3D "1.5.0+git${SRCREV_tfm}"
 SRCREV_FORMAT =3D "tfm_mcuboot_tfm-tests_mbedtls"
=20
 # The install task signs the TF-A BL2 and FIP binaries.
--=20
2.25.1


