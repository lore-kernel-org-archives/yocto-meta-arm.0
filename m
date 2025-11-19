Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC3CECF397B
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 17:13:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12490.1763572420261872064
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 09:13:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=temperror, err=temporary DNS error (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56FBDFEC
	for <meta-arm@lists.yoctoproject.org>; Wed, 19 Nov 2025 09:13:30 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 87C4B3F66E
	for <meta-arm@lists.yoctoproject.org>; Wed, 19 Nov 2025 09:13:37 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/4] arm/trusted-firmware-m: remove now obsolete assignments
Date: Wed, 19 Nov 2025 17:13:29 +0000
Message-ID: <20251119171333.3883043-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Nov 2025 17:13:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6777

We now use Ninja to build TF-M[1], so setting CMAKE_VERBOSE_MAKEFILES
doesn't do anything.

We have arm-none-eabi-gcc 13.3[2], so there's no need to remove options
that <13 don't support.

[1] meta-arm 018fd6aecf ("arm/trusted-firmware-m: use Ninja to build")
[2] meta-arm f646ee4507 ("arm-toolchain: update to 13.3")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc   | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
index bf31fc6719..45e72bdc56 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
@@ -70,9 +70,6 @@ EXTRA_OECMAKE +=3D "-DTFM_PLATFORM=3D${TFM_PLATFORM}"
 # Handle TFM_DEBUG parameter
 EXTRA_OECMAKE +=3D "${@bb.utils.contains('TFM_DEBUG', '1', '-DCMAKE_BUIL=
D_TYPE=3DDebug', '-DCMAKE_BUILD_TYPE=3DRelease', d)}"
=20
-# Verbose builds
-EXTRA_OECMAKE +=3D "-DCMAKE_VERBOSE_MAKEFILE:BOOL=3DON"
-
 EXTRA_OECMAKE +=3D "-DMBEDCRYPTO_PATH=3D${S}/../mbedtls -DTFM_TEST_REPO_=
PATH=3D${S}/../tf-m-tests -DTFM_EXTRAS_REPO_PATH=3D${S}/../tfm-extras -DM=
CUBOOT_PATH=3D${S}/../mcuboot -DQCBOR_PATH=3D${S}/../qcbor -DCMSIS_PATH=3D=
${S}/../cmsis"
=20
 export CMAKE_BUILD_PARALLEL_LEVEL =3D "${@oe.utils.parallel_make(d, Fals=
e)}"
@@ -81,9 +78,6 @@ AS[unexport] =3D "1"
 CC[unexport] =3D "1"
 LD[unexport] =3D "1"
=20
-# remove once arm-none-eabi-gcc updates to 13 or newer like poky
-DEBUG_PREFIX_MAP:remove =3D "-fcanon-prefix-map"
-
 # python3-cryptography needs the legacy provider, so set OPENSSL_MODULES=
 to the
 # right path until this is relocated automatically.
 export OPENSSL_MODULES =3D "${STAGING_LIBDIR_NATIVE}/ossl-modules"
--=20
2.43.0


