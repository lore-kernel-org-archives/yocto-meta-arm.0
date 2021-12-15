Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8353C433F5
	for <webhook@archiver.kernel.org>; Wed, 15 Dec 2021 11:13:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.39146.1639566795134028969
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 15 Dec 2021 03:13:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 767ADED1
	for <meta-arm@lists.yoctoproject.org>; Wed, 15 Dec 2021 03:13:14 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2259C3F774
	for <meta-arm@lists.yoctoproject.org>; Wed, 15 Dec 2021 03:13:14 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/4] arm/trusted-firmware-m: upgrade to 1.5.0
Date: Wed, 15 Dec 2021 11:13:09 +0000
Message-Id: <20211215111311.3066077-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215111311.3066077-1-ross.burton@arm.com>
References: <20211215111311.3066077-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 15 Dec 2021 11:13:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2715

Update tfm-tests and mcuboot SHAs.  mbedtls is still recommended to be
at 3.0.0, newer releases do not build.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...re-m_1.4.1.bb =3D> trusted-firmware-m_1.5.0.bb} | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)
 rename meta-arm/recipes-bsp/trusted-firmware-m/{trusted-firmware-m_1.4.1=
.bb =3D> trusted-firmware-m_1.5.0.bb} (93%)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1=
.4.1.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.5.=
0.bb
similarity index 93%
rename from meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.=
4.1.bb
rename to meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.5.=
0.bb
index 77199369..8e795deb 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.4.1.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.5.0.bb
@@ -16,22 +16,22 @@ LIC_FILES_CHKSUM =3D "file://license.rst;md5=3D07f368=
487da347f3c7bd0fc3085f3afa \
                     file://../mcuboot/LICENSE;md5=3Db6ee33f1d12a5e6ee3de=
1e82fb51eeb8"
=20
 SRC_URI  =3D "git://git.trustedfirmware.org/TF-M/trusted-firmware-m.git;=
protocol=3Dhttps;branch=3D${SRCBRANCH_tfm};name=3Dtfm;destsuffix=3D${S} \
-            git://git.trustedfirmware.org/TF-M/tf-m-tests.git;protocol=3D=
https;branch=3DTF-Mv1.4.x;name=3Dtfm-tests;destsuffix=3D${S}/../tf-m-test=
s \
+            git://git.trustedfirmware.org/TF-M/tf-m-tests.git;protocol=3D=
https;branch=3Drelease/1.5.x;name=3Dtfm-tests;destsuffix=3D${S}/../tf-m-t=
ests \
             git://github.com/ARMmbed/mbedtls.git;protocol=3Dhttps;branch=
=3Dmaster;name=3Dmbedtls;destsuffix=3D${S}/../mbedtls \
             git://github.com/mcu-tools/mcuboot.git;protocol=3Dhttps;bran=
ch=3Dmain;name=3Dmcuboot;destsuffix=3D${S}/../mcuboot \
             file://cbor2.patch;patchdir=3D${S}/../mcuboot \
             "
=20
 # The required dependencies are documented in tf-m/config/config_default=
.cmake
-# TF-Mv1.4.1
-SRCBRANCH_tfm =3D "TF-Mv1.4.x"
-SRCREV_tfm =3D "dd1fe44448db0f1750794cd9cf5596033f90f6f9"
+# TF-Mv1.5.0
+SRCBRANCH_tfm =3D "release/1.5.x"
+SRCREV_tfm =3D "6fb14a14140f94150f959c88e3b880f48372da06"
 # mbedtls-3.0.0
 SRCREV_mbedtls =3D "8df2f8e7b9c7bb9390ac74bb7bace27edca81a2b"
-# TF-Mv1.4.1
-SRCREV_tfm-tests =3D "60faad2ead1b967ec8e73accd793d3ed0e5c56bd"
-# TF-Mv1.4-integ
-SRCREV_mcuboot =3D "4f8091318b4026d14af9e5a7036825bff62fb612"
+# TF-Mv1.5.0
+SRCREV_tfm-tests =3D "6131778527cf60d9b5b7ea73700a30c0fdb9ff66"
+# v1.8.0
+SRCREV_mcuboot =3D "29099e1d17f93ae1d09fe945ad191b703aacd3d8"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "^TF-Mv(?P<pver>\d+(\.\d+)+)$"
=20
--=20
2.25.1


