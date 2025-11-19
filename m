Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14ADBCF3973
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 17:13:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12519.1763572419389156670
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 09:13:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=temperror, err=temporary DNS error (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F33C012FC
	for <meta-arm@lists.yoctoproject.org>; Wed, 19 Nov 2025 09:13:30 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 306743F66E
	for <meta-arm@lists.yoctoproject.org>; Wed, 19 Nov 2025 09:13:38 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/4] arm/trusted-firmware-m: use UNPACKDIR instead of S/../
Date: Wed, 19 Nov 2025 17:13:30 +0000
Message-ID: <20251119171333.3883043-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119171333.3883043-1-ross.burton@arm.com>
References: <20251119171333.3883043-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Nov 2025 17:13:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6774

This is slightly clearer.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-m/trusted-firmware-m-git-src.inc           | 2 +-
 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-g=
it-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-g=
it-src.inc
index 65a2e3110a..2b1826bf93 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-git-src.=
inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-git-src.=
inc
@@ -2,7 +2,7 @@
=20
 LICENSE =3D "BSD-2-Clause & BSD-3-Clause & Apache-2.0"
=20
-EXTRA_OECMAKE +=3D "-DT_COSE_PATH=3D${S}/../t_cose"
+EXTRA_OECMAKE +=3D "-DT_COSE_PATH=3D${UNPACKDIR}/t_cose"
=20
 LIC_FILES_CHKSUM =3D "file://license.rst;md5=3D07f368487da347f3c7bd0fc30=
85f3afa \
                     file://../tf-m-tests/license.rst;md5=3D4481bae2221b0=
cfca76a69fb3411f390 \
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
index 45e72bdc56..57cd23872f 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
@@ -70,7 +70,7 @@ EXTRA_OECMAKE +=3D "-DTFM_PLATFORM=3D${TFM_PLATFORM}"
 # Handle TFM_DEBUG parameter
 EXTRA_OECMAKE +=3D "${@bb.utils.contains('TFM_DEBUG', '1', '-DCMAKE_BUIL=
D_TYPE=3DDebug', '-DCMAKE_BUILD_TYPE=3DRelease', d)}"
=20
-EXTRA_OECMAKE +=3D "-DMBEDCRYPTO_PATH=3D${S}/../mbedtls -DTFM_TEST_REPO_=
PATH=3D${S}/../tf-m-tests -DTFM_EXTRAS_REPO_PATH=3D${S}/../tfm-extras -DM=
CUBOOT_PATH=3D${S}/../mcuboot -DQCBOR_PATH=3D${S}/../qcbor -DCMSIS_PATH=3D=
${S}/../cmsis"
+EXTRA_OECMAKE +=3D "-DMBEDCRYPTO_PATH=3D${UNPACKDIR}/mbedtls -DTFM_TEST_=
REPO_PATH=3D${UNPACKDIR}/tf-m-tests -DTFM_EXTRAS_REPO_PATH=3D${UNPACKDIR}=
/tfm-extras -DMCUBOOT_PATH=3D${UNPACKDIR}/mcuboot -DQCBOR_PATH=3D${UNPACK=
DIR}/qcbor -DCMSIS_PATH=3D${UNPACKDIR}/cmsis"
=20
 export CMAKE_BUILD_PARALLEL_LEVEL =3D "${@oe.utils.parallel_make(d, Fals=
e)}"
=20
--=20
2.43.0


