Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1401DCCD18E
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 15:04:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.46197.1760367861868471917
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Oct 2025 08:04:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 759AF113E
	for <meta-arm@lists.yoctoproject.org>; Mon, 13 Oct 2025 08:04:13 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 004513F66E
	for <meta-arm@lists.yoctoproject.org>; Mon, 13 Oct 2025 08:04:20 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/trusted-firmware-m: remove 2.2.0
Date: Mon, 13 Oct 2025 16:04:15 +0100
Message-ID: <20251013150415.3173432-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251013150415.3173432-1-ross.burton@arm.com>
References: <20251013150415.3173432-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 Oct 2025 15:04:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6732

We have 2.2.1, so there's no need for 2.2.0.  This removal was accidental=
ly
omitted from the 2.2.1 upgrade.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-m-2.2.0-src.inc          | 78 -------------------
 ...trusted-firmware-m-scripts-native_2.2.0.bb |  2 -
 .../trusted-firmware-m_2.2.0.bb               |  2 -
 3 files changed, 82 deletions(-)
 delete mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmw=
are-m-2.2.0-src.inc
 delete mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmw=
are-m-scripts-native_2.2.0.bb
 delete mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmw=
are-m_2.2.0.bb

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2=
.2.0-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m=
-2.2.0-src.inc
deleted file mode 100644
index 4162cc9c56..0000000000
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.2.0-sr=
c.inc
+++ /dev/null
@@ -1,78 +0,0 @@
-# Common src definitions for trusted-firmware-m and trusted-firmware-m-s=
cripts
-
-LICENSE =3D "BSD-2-Clause & BSD-3-Clause & Apache-2.0"
-
-EXTRA_OECMAKE +=3D "-DT_COSE_PATH=3D${S}/../t_cose"
-
-LIC_FILES_CHKSUM =3D "file://license.rst;md5=3D07f368487da347f3c7bd0fc30=
85f3afa \
-                    file://../tf-m-tests/license.rst;md5=3D4481bae2221b0=
cfca76a69fb3411f390 \
-                    file://../mbedtls/LICENSE;md5=3D379d5819937a6c2f1ef1=
630d341e026d \
-                    file://../mcuboot/LICENSE;md5=3Db6ee33f1d12a5e6ee3de=
1e82fb51eeb8 \
-                    file://../tfm-psa-adac/license.rst;md5=3D07f368487da=
347f3c7bd0fc3085f3afa \
-                    file://../t_cose/LICENSE;md5=3Db2ebdbfb82602b97aa628=
f64cf4b65ad \
-                   "
-
-SRC_URI_TRUSTED_FIRMWARE_M ?=3D "git://git.trustedfirmware.org/TF-M/trus=
ted-firmware-m.git;protocol=3Dhttps"
-SRC_URI_TRUSTED_FIRMWARE_M_EXTRAS ?=3D "git://git.trustedfirmware.org/TF=
-M/tf-m-extras.git;protocol=3Dhttps"
-SRC_URI_TRUSTED_FIRMWARE_M_TESTS ?=3D "git://git.trustedfirmware.org/TF-=
M/tf-m-tests.git;protocol=3Dhttps"
-SRC_URI_TRUSTED_FIRMWARE_M_CMSIS ?=3D "git://github.com/ARM-software/CMS=
IS_6.git;protocol=3Dhttps"
-SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS ?=3D "gitsm://github.com/ARMmbed/mbed=
tls.git;protocol=3Dhttps"
-SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT ?=3D "git://github.com/mcu-tools/mcub=
oot.git;protocol=3Dhttps"
-SRC_URI_TRUSTED_FIRMWARE_M_QCBOR ?=3D "git://github.com/laurencelundblad=
e/QCBOR.git;protocol=3Dhttps"
-SRC_URI_TRUSTED_FIRMWARE_M_PSA_ADAC ?=3D "git://git.trustedfirmware.org/=
shared/psa-adac.git;protocol=3Dhttps"
-SRC_URI_TRUSTED_FIRMWARE_M_T_COSE ?=3D "git://github.com/laurencelundbla=
de/t_cose.git;protocol=3Dhttps"
-SRC_URI  =3D "${SRC_URI_TRUSTED_FIRMWARE_M};branch=3D${SRCBRANCH_tfm};na=
me=3Dtfm;destsuffix=3Dtfm \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_EXTRAS};branch=3D${SRCBRANCH_tf=
m-extras};name=3Dtfm-extras;destsuffix=3Dtfm-extras \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_TESTS};branch=3D${SRCBRANCH_tfm=
-tests};name=3Dtfm-tests;destsuffix=3Dtf-m-tests \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_CMSIS};branch=3D${SRCBRANCH_cms=
is};name=3Dcmsis;destsuffix=3Dcmsis \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS};branch=3D${SRCBRANCH_m=
bedtls};name=3Dmbedtls;destsuffix=3Dmbedtls \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT};branch=3D${SRCBRANCH_m=
cuboot};name=3Dmcuboot;destsuffix=3Dmcuboot \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_QCBOR};branch=3D${SRCBRANCH_qcb=
or};name=3Dqcbor;destsuffix=3Dqcbor \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_PSA_ADAC};branch=3D${SRCBRANCH_=
tfm-psa-adac};name=3Dtfm-psa-adac;destsuffix=3Dtfm-psa-adac \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_T_COSE};branch=3D${SRCBRANCH_t-=
cose};name=3Dt-cose;destsuffix=3Dt_cose \
-            "
-
-# The required dependencies are documented in tf-m/config/config_base.cm=
ake
-# TF-Mv2.2.0
-SRCBRANCH_tfm ?=3D "release/2.2.x"
-SRCREV_tfm =3D "dd2b7de197742beeebd12197c14d9d3cb1b9ec68"
-# TF-Mv2.2.0
-SRCBRANCH_tfm-extras ?=3D "release/2.2.x"
-SRCREV_tfm-extras =3D "88a4bd39284bb497dd8b362f20cd2b7f704ac390"
-# TF-Mv2.2.0
-SRCBRANCH_tfm-tests ?=3D "release/2.2.x"
-SRCREV_tfm-tests =3D "e0a433c67c37138cd9dce23657ae82c5cbdcf51f"
-# CMSIS v6.1.0, CMSIS_TAG from lib/ext/cmsis/CMakeLists.txt
-SRCBRANCH_cmsis ?=3D "main"
-SRCREV_cmsis =3D "b0bbb0423b278ca632cfe1474eb227961d835fd2"
-# mbedtls-3.6.3 (+2 commits), value from MBEDCRYPTO_VERSION(-ish)
-SRCBRANCH_mbedtls ?=3D "mbedtls-3.6"
-SRCREV_mbedtls =3D "8cf5666a174237998a7965e284d7ba8c1655d16d"
-# mcuboot v2.2.0-rc1+ (intermediate SHA), value from MCUBOOT_VERSION
-SRCBRANCH_mcuboot ?=3D "main"
-SRCREV_mcuboot =3D "6071ceb1d0d955b6ff4745499a0ff3ac7d79f24b"
-# QCBOR v1.2, value from QCBOR_VERSION in lib/ext/qcbor/CMakeLists.txt
-SRCBRANCH_qcbor ?=3D "master"
-SRCREV_qcbor =3D "92d3f89030baff4af7be8396c563e6c8ef263622"
-# PSA-ADAC (intermediate SHA), value from PLATFORM_PSA_ADAC_VERSION
-SRCBRANCH_tfm-psa-adac =3D "master"
-SRCREV_tfm-psa-adac =3D "819a254af6fb5eefdcef194ec85d2c7627451351"
-# T_COSE v2.0-alpha-2, from lib/ext/t_cose/CMakeLists.txt
-SRCBRANCH_t-cose =3D "dev"
-SRCREV_t-cose =3D "3076010eeb6383f0827bd992c75b68af9311cf1d"
-
-SRCREV_FORMAT =3D "tfm"
-
-S =3D "${UNPACKDIR}/tfm"
-
-# Apply patches
-inherit apply_local_src_patches
-LOCAL_SRC_PATCHES_INPUT_DIR =3D "N/A"
-
-do_apply_local_src_patches() {
-    apply_local_src_patches ${S}/lib/ext/qcbor ${UNPACKDIR}/qcbor
-    apply_local_src_patches ${S}/lib/ext/mbedcrypto ${UNPACKDIR}/mbedtls
-    apply_local_src_patches ${S}/lib/ext/mcuboot ${UNPACKDIR}/mcuboot
-    apply_local_src_patches ${S}/lib/ext/tf-m-tests ${UNPACKDIR}/tf-m-te=
sts
-    apply_local_src_patches ${S}/lib/ext/t_cose ${UNPACKDIR}/t_cose
-}
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-s=
cripts-native_2.2.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-=
firmware-m-scripts-native_2.2.0.bb
deleted file mode 100644
index d50d886f60..0000000000
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-scripts-=
native_2.2.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require recipes-bsp/trusted-firmware-m/trusted-firmware-m-${PV}-src.inc
-require recipes-bsp/trusted-firmware-m/trusted-firmware-m-scripts-native=
.inc
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2=
.2.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2.2.=
0.bb
deleted file mode 100644
index 3464f49dd9..0000000000
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2.2.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require recipes-bsp/trusted-firmware-m/trusted-firmware-m-${PV}-src.inc
-require recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
--=20
2.43.0


