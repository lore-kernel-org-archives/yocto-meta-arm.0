Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E6E6CD98C5
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 13:17:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.129349.1781529443342447246
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Jun 2026 06:17:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=ZGGX9yiw;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C6A5328D
	for <meta-arm@lists.yoctoproject.org>; Mon, 15 Jun 2026 06:17:18 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9F9003F915
	for <meta-arm@lists.yoctoproject.org>; Mon, 15 Jun 2026 06:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781529442; bh=p5N9Eyl3VdfdkGByhcY/nB/qo14wcokSEd/22rKjLhM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZGGX9yiwh3kQoa+MCixe4i6Uk0NsrcTv6ekzqnxfM59n6veECp5UyTzhJfnAgT1LI
	 QTeunsw4Apo+PEXkrmGNv6YFSVGUA+uhkcLlJSas9YL46eqspbLr+/3vbm87cgOdV7
	 mfeB1TayccOpPOekoti/4UCJIPq86RdfMaKsLFlo=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm/trusted-firmware-m: Add 2.3.0 Support
Date: Mon, 15 Jun 2026 09:17:20 -0400
Message-ID: <20260615131721.55897-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260615131721.55897-1-jon.mason@arm.com>
References: <20260615131721.55897-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Jun 2026 13:17:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7079

Add recipes for newest version of tf-m.  Of note, mbedtls has been
removed in favor of the TF-PSA-Crypto library.  This is having a cascade
into the other recipes, with a removal from the core inc file and add of
the individual lines to the specific versions.

TF-PSA-Crypto is Apache 2.0 licensed.  So, no need to change the recipe
license field.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/lts-revisions.yml                          |  1 +
 .../conf/machine/include/corstone1000.inc     |  1 +
 .../trusted-firmware-m-2.1.4-src.inc          |  2 +
 .../trusted-firmware-m-2.2.2-src.inc          |  2 +
 .../trusted-firmware-m-2.3.0-src.inc          | 87 +++++++++++++++++++
 ...trusted-firmware-m-scripts-native_2.3.0.bb |  9 ++
 .../trusted-firmware-m/trusted-firmware-m.inc |  1 -
 .../trusted-firmware-m_2.3.0.bb               |  9 ++
 8 files changed, 111 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmw=
are-m-2.3.0-src.inc
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmw=
are-m-scripts-native_2.3.0.bb
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmw=
are-m_2.3.0.bb

diff --git a/ci/lts-revisions.yml b/ci/lts-revisions.yml
index 2cb7a6bc3411..fc23696f5861 100644
--- a/ci/lts-revisions.yml
+++ b/ci/lts-revisions.yml
@@ -8,3 +8,4 @@ local_conf_header:
     PREFERRED_VERSION_trusted-firmware-a ?=3D "2.10.%"
     PREFERRED_VERSION_tf-a-tests ?=3D "2.10.%"
     PREFERRED_VERSION_trusted-firmware-m ?=3D "2.1.%"
+    PREFERRED_VERSION_trusted-firmware-m-scripts-native ?=3D "2.1.%"
diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index 309fae6174cc..668b26443b94 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -6,6 +6,7 @@ MACHINEOVERRIDES =3D. "corstone1000:"
=20
 # TF-M
 PREFERRED_VERSION_trusted-firmware-m ?=3D "2.2.%"
+PREFERRED_VERSION_trusted-firmware-m-scripts-native ?=3D "2.2.%"
=20
 # TF-A
 TFA_PLATFORM =3D "corstone1000"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2=
.1.4-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m=
-2.1.4-src.inc
index 0ea55984860f..71ff595347c2 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.1.4-sr=
c.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.1.4-sr=
c.inc
@@ -54,6 +54,8 @@ SRCREV_tfm-psa-adac =3D "5f5490cebe66ae997f316f83c3fbf1=
f97deef625"
=20
 SRCREV_FORMAT =3D "tfm_tfm-extras_tfm-tests_cmsis_mbedtls_mcuboot_qcbor_=
tfm-psa-adac_t-cose"
=20
+EXTRA_OECMAKE +=3D "-DMBEDCRYPTO_PATH=3D${S}/external/mbedtls"
+
 S =3D "${UNPACKDIR}/tfm"
=20
 # Apply patches
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2=
.2.2-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m=
-2.2.2-src.inc
index 132f05aaa97b..ddaab88e8bd3 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.2.2-sr=
c.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.2.2-sr=
c.inc
@@ -63,6 +63,8 @@ SRC_URI  =3D "${SRC_URI_TRUSTED_FIRMWARE_M};branch=3D${=
SRCBRANCH_tfm};name=3Dtfm;dests
=20
 SRCREV_FORMAT =3D "tfm_tfm-extras_tfm-tests_cmsis_mbedtls_mcuboot_qcbor_=
tfm-psa-adac_t-cose"
=20
+EXTRA_OECMAKE +=3D "-DMBEDCRYPTO_PATH=3D${S}/external/mbedtls"
+
 S =3D "${UNPACKDIR}/tfm"
=20
 # Apply patches
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2=
.3.0-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m=
-2.3.0-src.inc
new file mode 100644
index 000000000000..d3ab29d0e297
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.3.0-sr=
c.inc
@@ -0,0 +1,87 @@
+# Common src definitions for trusted-firmware-m and trusted-firmware-m-s=
cripts
+
+LICENSE =3D "BSD-2-Clause & BSD-3-Clause & Apache-2.0"
+
+LIC_FILES_CHKSUM =3D "file://license.rst;md5=3D002a64dec64b82c58a203a94b=
ee7b2a1 \
+                    file://external/tf-m-tests/license.rst;md5=3D4481bae=
2221b0cfca76a69fb3411f390 \
+                    file://external/mcuboot/LICENSE;md5=3Db6ee33f1d12a5e=
6ee3de1e82fb51eeb8 \
+                    file://external/tfm-psa-adac/license.rst;md5=3D07f36=
8487da347f3c7bd0fc3085f3afa \
+                    file://external/tf-psa-crypto/LICENSE;md5=3D40b928d4=
64bb11f233c578de64d710cf \
+                    file://external/psa-crypto-driver/license.rst;md5=3D=
6a076b245abfcdb53243394a49e51ffa \
+                    file://external/t_cose/LICENSE;md5=3Db2ebdbfb82602b9=
7aa628f64cf4b65ad \
+                   "
+
+SRC_URI_TRUSTED_FIRMWARE_M ?=3D "git://git.trustedfirmware.org/TF-M/trus=
ted-firmware-m.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_M_EXTRAS ?=3D "git://git.trustedfirmware.org/TF=
-M/tf-m-extras.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_M_TESTS ?=3D "git://git.trustedfirmware.org/TF-=
M/tf-m-tests.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_M_CMSIS ?=3D "git://github.com/ARM-software/CMS=
IS_6.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT ?=3D "git://github.com/mcu-tools/mcub=
oot.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_M_QCBOR ?=3D "git://github.com/laurencelundblad=
e/QCBOR.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_M_PSA_ADAC ?=3D "git://git.trustedfirmware.org/=
shared/psa-adac.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_M_PSA_CRYPTO ?=3D "gitsm://github.com/Mbed-TLS/=
TF-PSA-Crypto.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_M_PSA_CRYPTO_DRIVER ?=3D "git://git.trustedfirm=
ware.org/shared/tf-psa-crypto-drivers;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_M_T_COSE ?=3D "git://github.com/laurencelundbla=
de/t_cose.git;protocol=3Dhttps"
+
+# The required dependencies are documented in tf-m/config/config_base.cm=
ake
+# TF-Mv2.3.0
+SRCBRANCH_tfm ?=3D "release/2.3.x"
+SRCREV_tfm =3D "5d906d29d7b6d1a7f7134960d228f9e75f6a8a07"
+# TF-Mv2.3.0
+SRCBRANCH_tfm-extras ?=3D "release/2.3.x"
+SRCREV_tfm-extras =3D "8abeb6610e7ca27fff54dd8a9b5767d5cf98b998"
+# TF-Mv2.3.0
+SRCBRANCH_tfm-tests ?=3D "release/2.3.x"
+SRCREV_tfm-tests =3D "6a1165dfef219d0801487f51e06d12331e726643"
+# CMSIS v6.1.0, CMSIS_TAG from lib/ext/cmsis/CMakeLists.txt
+SRCBRANCH_cmsis ?=3D "main"
+SRCREV_cmsis =3D "b0bbb0423b278ca632cfe1474eb227961d835fd2"
+# mcuboot v2.4.0, value from MCUBOOT_VERSION
+SRCBRANCH_mcuboot ?=3D "main"
+SRCREV_mcuboot =3D "6d3b3d2c38ab20c242e5b9abb04d050086383eb2"
+# QCBOR v1.2, value from QCBOR_VERSION in lib/ext/qcbor/CMakeLists.txt
+SRCBRANCH_qcbor ?=3D "master"
+SRCREV_qcbor =3D "92d3f89030baff4af7be8396c563e6c8ef263622"
+# PSA-ADAC (intermediate SHA), value from PLATFORM_PSA_ADAC_VERSION
+SRCBRANCH_tfm-psa-adac =3D "master"
+SRCREV_tfm-psa-adac =3D "eff89e8e0ce36e4793f78309be19fcfab798f473"
+# TF-PSA-Crypto v1.1.0, value from TF_PSA_CRYPTO_VERSION
+SRCBRANCH_tf-psa-crypto =3D "development"
+SRCREV_tf-psa-crypto =3D "29160dd877d29658279fd683b2ae57b320ddcf09"
+# From platform/ext/target/arm/drivers/cc3xx/CMakeLists.txt
+SRCBRANCH_psa-crypto-driver =3D "main"
+SRCREV_psa-crypto-driver =3D "3a93566c04c4d77a007e6b149e7c06e7b8f0cd8d"
+# T_COSE v2.0-alpha-2, from lib/ext/t_cose/CMakeLists.txt
+SRCBRANCH_t-cose =3D "dev"
+SRCREV_t-cose =3D "3076010eeb6383f0827bd992c75b68af9311cf1d"
+
+
+SRC_URI  =3D "${SRC_URI_TRUSTED_FIRMWARE_M};branch=3D${SRCBRANCH_tfm};na=
me=3Dtfm;destsuffix=3Dtfm \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_EXTRAS};branch=3D${SRCBRANCH_tf=
m-extras};name=3Dtfm-extras;destsuffix=3Dtfm/external/tfm-extras \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_TESTS};branch=3D${SRCBRANCH_tfm=
-tests};name=3Dtfm-tests;destsuffix=3Dtfm/external/tf-m-tests \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_CMSIS};branch=3D${SRCBRANCH_cms=
is};name=3Dcmsis;destsuffix=3Dtfm/external/cmsis \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT};branch=3D${SRCBRANCH_m=
cuboot};name=3Dmcuboot;destsuffix=3Dtfm/external/mcuboot \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_QCBOR};branch=3D${SRCBRANCH_qcb=
or};name=3Dqcbor;destsuffix=3Dtfm/external/qcbor \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_PSA_ADAC};branch=3D${SRCBRANCH_=
tfm-psa-adac};name=3Dtfm-psa-adac;destsuffix=3Dtfm/external/tfm-psa-adac =
\
+            ${SRC_URI_TRUSTED_FIRMWARE_M_PSA_CRYPTO};branch=3D${SRCBRANC=
H_tf-psa-crypto};name=3Dtf-psa-crypto;destsuffix=3Dtfm/external/tf-psa-cr=
ypto \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_PSA_CRYPTO_DRIVER};branch=3D${S=
RCBRANCH_psa-crypto-driver};name=3Dpsa-crypto-driver;destsuffix=3Dtfm/ext=
ernal/psa-crypto-driver \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_T_COSE};branch=3D${SRCBRANCH_t-=
cose};name=3Dt-cose;destsuffix=3Dtfm/external/t_cose \
+            "
+
+SRCREV_FORMAT =3D "tfm_tfm-extras_tfm-tests_cmsis_mcuboot_qcbor_tfm-psa-=
adac_tf-psa-crypto_psa-pcrypto-driver_t-cose"
+
+S =3D "${UNPACKDIR}/tfm"
+
+EXTRA_OECMAKE +=3D "-DTF_PSA_CRYPTO_PATH=3D${S}/external/tf-psa-crypto"
+EXTRA_OECMAKE +=3D "-DPSA_CRYPTO_DRIVER_PATH=3D${S}/external/psa-crypto-=
driver"
+
+# Apply patches
+inherit apply_local_src_patches
+LOCAL_SRC_PATCHES_INPUT_DIR =3D "N/A"
+
+do_apply_local_src_patches() {
+    apply_local_src_patches ${S}/lib/ext/qcbor ${S}/external/qcbor
+    apply_local_src_patches ${S}/lib/ext/mcuboot ${S}/external/mcuboot
+    apply_local_src_patches ${S}/lib/ext/tf-m-tests ${S}/external/tf-m-t=
ests
+    apply_local_src_patches ${S}/lib/ext/tf-psa-crypto ${S}/external/tf-=
psa-crypto
+    apply_local_src_patches ${S}/lib/ext/t_cose ${S}/external/t_cose
+}
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-s=
cripts-native_2.3.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-=
firmware-m-scripts-native_2.3.0.bb
new file mode 100644
index 000000000000..b5220934f415
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-scripts-=
native_2.3.0.bb
@@ -0,0 +1,9 @@
+require recipes-bsp/trusted-firmware-m/trusted-firmware-m-${PV}-src.inc
+
+inherit native python_setuptools_build_meta
+
+RDEPENDS:${PN} =3D "\
+    python3-pyelftools-native \
+    python3-rich-native \
+    clang-native \
+"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
index 3b6dce22069d..b01361deb18f 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
@@ -72,7 +72,6 @@ EXTRA_OECMAKE +=3D "${@bb.utils.contains('TFM_DEBUG', '=
1', '-DCMAKE_BUILD_TYPE=3DDeb
=20
 EXTRA_OECMAKE +=3D "\
     -DCMSIS_PATH=3D${S}/external/cmsis \
-    -DMBEDCRYPTO_PATH=3D${S}/external/mbedtls \
     -DMCUBOOT_PATH=3D${S}/external/mcuboot \
     -DQCBOR_PATH=3D${S}/external/qcbor \
     -DT_COSE_PATH=3D${S}/external/t_cose \
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2=
.3.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2.3.=
0.bb
new file mode 100644
index 000000000000..64c03d2dbf4c
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2.3.0.bb
@@ -0,0 +1,9 @@
+require recipes-bsp/trusted-firmware-m/trusted-firmware-m-${PV}-src.inc
+require recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
+
+DEPENDS +=3D "trusted-firmware-m-scripts-native"
+
+# FIXME - arm-none-eabi/bin/ld: error: unsupported option: -z relro
+# Working around the issue by removing the loader flags, which aren't re=
levant for us here
+# Long term fix, create a baremetal firmware bbclass that doesn't add th=
is stuff
+SECURITY_LDFLAGS =3D ""
--=20
2.50.1 (Apple Git-155)


