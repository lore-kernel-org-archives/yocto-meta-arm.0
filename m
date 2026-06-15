Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 069BBCD98CF
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 13:17:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.129207.1781529443426632724
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Jun 2026 06:17:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Ct+JAgJo;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4228832B1
	for <meta-arm@lists.yoctoproject.org>; Mon, 15 Jun 2026 06:17:18 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D62293FBD2
	for <meta-arm@lists.yoctoproject.org>; Mon, 15 Jun 2026 06:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781529442; bh=fG5yqTSclQ5dgj9xTuwhhozwOGtPw+nwiJBLNqHOWvA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ct+JAgJoe3g87I0u6Ajy6yUTVb1k1W1R2kO6A6JoBOUD0AYYYm7LtDBPEWWplQCXL
	 4khgZPv7S421sT6sdAWfpV1OlOJBsxzb85feRbdwCtBxQ7wrwZz4HxtaNPEcV81Q4j
	 wUxGjPtMW3MH4kx4hHSi9P+m3K++10X1HwC+KORM=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm/trusted-firmware-m: remove 2.1.4
Date: Mon, 15 Jun 2026 09:17:21 -0400
Message-ID: <20260615131721.55897-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260615131721.55897-1-jon.mason@arm.com>
References: <20260615131721.55897-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Jun 2026 13:17:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7077

Remove the older LTS, since there is a policy of the most recent release
and the previous LTS.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/lts-revisions.yml                          |  4 +-
 ci/musca-s1.yml                               |  2 +-
 .../trusted-firmware-m-2.1.4-src.inc          | 70 -------------------
 ...trusted-firmware-m-scripts-native_2.1.4.bb |  2 -
 .../trusted-firmware-m_2.1.4.bb               |  7 --
 5 files changed, 3 insertions(+), 82 deletions(-)
 delete mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmw=
are-m-2.1.4-src.inc
 delete mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmw=
are-m-scripts-native_2.1.4.bb
 delete mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmw=
are-m_2.1.4.bb

diff --git a/ci/lts-revisions.yml b/ci/lts-revisions.yml
index fc23696f5861..ed70a62c6770 100644
--- a/ci/lts-revisions.yml
+++ b/ci/lts-revisions.yml
@@ -7,5 +7,5 @@ local_conf_header:
   latest_revisions: |
     PREFERRED_VERSION_trusted-firmware-a ?=3D "2.10.%"
     PREFERRED_VERSION_tf-a-tests ?=3D "2.10.%"
-    PREFERRED_VERSION_trusted-firmware-m ?=3D "2.1.%"
-    PREFERRED_VERSION_trusted-firmware-m-scripts-native ?=3D "2.1.%"
+    PREFERRED_VERSION_trusted-firmware-m ?=3D "2.2.%"
+    PREFERRED_VERSION_trusted-firmware-m-scripts-native ?=3D "2.2.%"
diff --git a/ci/musca-s1.yml b/ci/musca-s1.yml
index 57aaa9429769..4163b3ec3ff0 100644
--- a/ci/musca-s1.yml
+++ b/ci/musca-s1.yml
@@ -9,7 +9,7 @@ header:
 local_conf_header:
   version_for_ci: |
     # For better CI coverage, use the LTS version of tf-m
-    PREFERRED_VERSION_trusted-firmware-m ?=3D "2.1.%"
+    PREFERRED_VERSION_trusted-firmware-m ?=3D "2.2.%"
=20
 machine: musca-s1
=20
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2=
.1.4-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m=
-2.1.4-src.inc
deleted file mode 100644
index 71ff595347c2..000000000000
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.1.4-sr=
c.inc
+++ /dev/null
@@ -1,70 +0,0 @@
-# Common src definitions for trusted-firmware-m and trusted-firmware-m-s=
cripts
-
-LICENSE =3D "BSD-2-Clause & BSD-3-Clause & Apache-2.0"
-
-LIC_FILES_CHKSUM =3D "file://license.rst;md5=3D07f368487da347f3c7bd0fc30=
85f3afa \
-                    file://external/tf-m-tests/license.rst;md5=3D4481bae=
2221b0cfca76a69fb3411f390 \
-                    file://external/mbedtls/LICENSE;md5=3D379d5819937a6c=
2f1ef1630d341e026d \
-                    file://external/mcuboot/LICENSE;md5=3Db6ee33f1d12a5e=
6ee3de1e82fb51eeb8 \
-                    file://external/tfm-psa-adac/license.rst;md5=3D07f36=
8487da347f3c7bd0fc3085f3afa"
-
-SRC_URI_TRUSTED_FIRMWARE_M ?=3D "git://git.trustedfirmware.org/TF-M/trus=
ted-firmware-m.git;protocol=3Dhttps"
-SRC_URI_TRUSTED_FIRMWARE_M_EXTRAS ?=3D "git://git.trustedfirmware.org/TF=
-M/tf-m-extras.git;protocol=3Dhttps"
-SRC_URI_TRUSTED_FIRMWARE_M_TESTS ?=3D "git://git.trustedfirmware.org/TF-=
M/tf-m-tests.git;protocol=3Dhttps"
-SRC_URI_TRUSTED_FIRMWARE_M_CMSIS ?=3D "git://github.com/ARM-software/CMS=
IS_6.git;protocol=3Dhttps"
-SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS ?=3D "gitsm://github.com/Mbed-TLS/mbe=
dtls;protocol=3Dhttps"
-SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT ?=3D "git://github.com/mcu-tools/mcub=
oot.git;protocol=3Dhttps"
-SRC_URI_TRUSTED_FIRMWARE_M_QCBOR ?=3D "git://github.com/laurencelundblad=
e/QCBOR.git;protocol=3Dhttps"
-SRC_URI_TRUSTED_FIRMWARE_M_PSA_ADAC ?=3D "git://git.trustedfirmware.org/=
shared/psa-adac.git;protocol=3Dhttps"
-SRC_URI  =3D "${SRC_URI_TRUSTED_FIRMWARE_M};branch=3D${SRCBRANCH_tfm};na=
me=3Dtfm;destsuffix=3Dtfm \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_EXTRAS};branch=3D${SRCBRANCH_tf=
m-extras};name=3Dtfm-extras;destsuffix=3Dtfm/external/tfm-extras \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_TESTS};branch=3D${SRCBRANCH_tfm=
-tests};name=3Dtfm-tests;destsuffix=3Dtfm/external/tf-m-tests \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_CMSIS};branch=3D${SRCBRANCH_cms=
is};name=3Dcmsis;destsuffix=3Dtfm/external/cmsis \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS};branch=3D${SRCBRANCH_m=
bedtls};name=3Dmbedtls;destsuffix=3Dtfm/external/mbedtls \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT};branch=3D${SRCBRANCH_m=
cuboot};name=3Dmcuboot;destsuffix=3Dtfm/external/mcuboot \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_QCBOR};branch=3D${SRCBRANCH_qcb=
or};name=3Dqcbor;destsuffix=3Dtfm/external/qcbor \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_PSA_ADAC};branch=3D${SRCBRANCH_=
tfm-psa-adac};name=3Dtfm-psa-adac;destsuffix=3Dtfm/external/tfm-psa-adac =
\
-            "
-
-# The required dependencies are documented in tf-m/config/config_base.cm=
ake
-# TF-Mv2.1.4
-SRCBRANCH_tfm ?=3D "release/2.1.x"
-SRCREV_tfm =3D "03d02d6feed02583c41acfe7147d1117678797a3"
-# TF-Mv2.1.4
-SRCBRANCH_tfm-extras ?=3D "release/2.1.x"
-SRCREV_tfm-extras =3D "ef7814a8c95d7df4b150a66557c0073cddce6593"
-# TF-Mv2.1.4
-SRCBRANCH_tfm-tests ?=3D "release/2.1.x"
-SRCREV_tfm-tests =3D "852c6f74c5b7ae61e140d1a46e981f95177aa40e"
-# CMSIS v6.0.0+ (intermediate SHA), CMSIS_TAG from lib/ext/cmsis/CMakeLi=
sts.txt
-SRCBRANCH_cmsis ?=3D "main"
-SRCREV_cmsis =3D "d0c460c1697d210b49a4b90998195831c0cd325c"
-# mbedtls-3.6.5, value from MBEDCRYPTO_VERSION
-SRCBRANCH_mbedtls ?=3D "mbedtls-3.6"
-SRCREV_mbedtls =3D "e185d7fd85499c8ce5ca2a54f5cf8fe7dbe3f8df"
-# mcuboot v2.1.0, value from MCUBOOT_VERSION
-SRCBRANCH_mcuboot ?=3D "main"
-SRCREV_mcuboot =3D "9c99326b9756dbcc35b524636d99ed5f3e6cb29b"
-# QCBOR v1.2, value from QCBOR_VERSION in lib/ext/qcbor/CMakeLists.txt
-SRCBRANCH_qcbor ?=3D "master"
-SRCREV_qcbor =3D "b0e7033268e88c9f27146fa9a1415ef4c19ebaff"
-# PSA-ADAC (intermediate SHA), value from PLATFORM_PSA_ADAC_VERSION
-SRCBRANCH_tfm-psa-adac =3D "master"
-SRCREV_tfm-psa-adac =3D "5f5490cebe66ae997f316f83c3fbf1f97deef625"
-
-SRCREV_FORMAT =3D "tfm_tfm-extras_tfm-tests_cmsis_mbedtls_mcuboot_qcbor_=
tfm-psa-adac_t-cose"
-
-EXTRA_OECMAKE +=3D "-DMBEDCRYPTO_PATH=3D${S}/external/mbedtls"
-
-S =3D "${UNPACKDIR}/tfm"
-
-# Apply patches
-inherit apply_local_src_patches
-LOCAL_SRC_PATCHES_INPUT_DIR =3D "N/A"
-
-do_apply_local_src_patches() {
-    apply_local_src_patches ${S}/lib/ext/qcbor ${S}/external/qcbor
-    apply_local_src_patches ${S}/lib/ext/mbedcrypto ${S}/external/mbedtl=
s
-    apply_local_src_patches ${S}/lib/ext/mcuboot ${S}/external/mcuboot
-    apply_local_src_patches ${S}/lib/ext/tf-m-tests ${S}/external/tf-m-t=
ests
-}
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-s=
cripts-native_2.1.4.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-=
firmware-m-scripts-native_2.1.4.bb
deleted file mode 100644
index d50d886f60b2..000000000000
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-scripts-=
native_2.1.4.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require recipes-bsp/trusted-firmware-m/trusted-firmware-m-${PV}-src.inc
-require recipes-bsp/trusted-firmware-m/trusted-firmware-m-scripts-native=
.inc
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2=
.1.4.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2.1.=
4.bb
deleted file mode 100644
index e206a2a5a0da..000000000000
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2.1.4.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require recipes-bsp/trusted-firmware-m/trusted-firmware-m-${PV}-src.inc
-require recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
-
-# FIXME - arm-none-eabi/bin/ld: error: unsupported option: -z relro
-# Working around the issue by removing the loader flags, which aren't re=
levant for us here
-# Long term fix, create a baremetal firmware bbclass that doesn't add th=
is stuff
-SECURITY_LDFLAGS =3D ""
--=20
2.50.1 (Apple Git-155)


