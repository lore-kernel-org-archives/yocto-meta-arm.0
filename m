Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05035C433FE
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 16:17:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1747.1636647424866136342
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Nov 2021 08:17:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48E33ED1
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 Nov 2021 08:17:04 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E59263F718
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 Nov 2021 08:17:03 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH v2 1/5] arm/trusted-firmware-m: upgrade to 1.4.1
Date: Thu, 11 Nov 2021 16:16:55 +0000
Message-Id: <20211111161659.2529512-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 Nov 2021 16:17:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2371

Extract the TF-M branch name as a variable, as BSPs may wish to use
intermediate SHAs.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...mware-m_1.4.0.bb =3D> trusted-firmware-m_1.4.1.bb} | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)
 rename meta-arm/recipes-bsp/trusted-firmware-m/{trusted-firmware-m_1.4.0=
.bb =3D> trusted-firmware-m_1.4.1.bb} (93%)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1=
.4.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.4.=
1.bb
similarity index 93%
rename from meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.=
4.0.bb
rename to meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.4.=
1.bb
index 326b5a66..77199369 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.4.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.4.1.bb
@@ -15,20 +15,21 @@ LIC_FILES_CHKSUM =3D "file://license.rst;md5=3D07f368=
487da347f3c7bd0fc3085f3afa \
                     file://../mbedtls/LICENSE;md5=3D3b83ef96387f14655fc8=
54ddc3c6bd57 \
                     file://../mcuboot/LICENSE;md5=3Db6ee33f1d12a5e6ee3de=
1e82fb51eeb8"
=20
-SRC_URI  =3D "git://git.trustedfirmware.org/TF-M/trusted-firmware-m.git;=
protocol=3Dhttps;branch=3Dmaster;name=3Dtfm;destsuffix=3D${S} \
-            git://git.trustedfirmware.org/TF-M/tf-m-tests.git;protocol=3D=
https;branch=3Dmaster;name=3Dtfm-tests;destsuffix=3D${S}/../tf-m-tests \
+SRC_URI  =3D "git://git.trustedfirmware.org/TF-M/trusted-firmware-m.git;=
protocol=3Dhttps;branch=3D${SRCBRANCH_tfm};name=3Dtfm;destsuffix=3D${S} \
+            git://git.trustedfirmware.org/TF-M/tf-m-tests.git;protocol=3D=
https;branch=3DTF-Mv1.4.x;name=3Dtfm-tests;destsuffix=3D${S}/../tf-m-test=
s \
             git://github.com/ARMmbed/mbedtls.git;protocol=3Dhttps;branch=
=3Dmaster;name=3Dmbedtls;destsuffix=3D${S}/../mbedtls \
             git://github.com/mcu-tools/mcuboot.git;protocol=3Dhttps;bran=
ch=3Dmain;name=3Dmcuboot;destsuffix=3D${S}/../mcuboot \
             file://cbor2.patch;patchdir=3D${S}/../mcuboot \
             "
=20
 # The required dependencies are documented in tf-m/config/config_default=
.cmake
-# TF-Mv1.4.0
-SRCREV_tfm =3D "7ef9178adad866d48e3af42d8a3129dfab792ed8"
+# TF-Mv1.4.1
+SRCBRANCH_tfm =3D "TF-Mv1.4.x"
+SRCREV_tfm =3D "dd1fe44448db0f1750794cd9cf5596033f90f6f9"
 # mbedtls-3.0.0
 SRCREV_mbedtls =3D "8df2f8e7b9c7bb9390ac74bb7bace27edca81a2b"
-# TF-Mv1.4.0
-SRCREV_tfm-tests =3D "e1a8c9fb8394b1f6ea66d2611c070915b0d4b573"
+# TF-Mv1.4.1
+SRCREV_tfm-tests =3D "60faad2ead1b967ec8e73accd793d3ed0e5c56bd"
 # TF-Mv1.4-integ
 SRCREV_mcuboot =3D "4f8091318b4026d14af9e5a7036825bff62fb612"
=20
--=20
2.25.1


