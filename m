Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8FF7CA0FED
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 12:51:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.16897.1757508697857453878
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Sep 2025 05:51:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25D6116F8;
	Wed, 10 Sep 2025 05:51:29 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.25.34])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB4AC3F63F;
	Wed, 10 Sep 2025 05:51:36 -0700 (PDT)
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 1/3] arm/trusted-firmware-m: Add new recipe for Trusted-Firmware-M v2.2.1
Date: Wed, 10 Sep 2025 13:51:10 +0100
Message-Id: <20250910125112.75362-2-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250910125112.75362-1-harsimransingh.tungal@arm.com>
References: <20250910125112.75362-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 10 Sep 2025 12:51:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6696

Key Changes:
- Add new recipe for Trusted-Firmware-M v2.2.1

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 .../trusted-firmware-m-2.2.1-src.inc          | 78 +++++++++++++++++++
 .../trusted-firmware-m_2.2.1.bb               |  2 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmw=
are-m-2.2.1-src.inc
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmw=
are-m_2.2.1.bb

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2=
.2.1-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m=
-2.2.1-src.inc
new file mode 100644
index 00000000..35ef8f8c
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.2.1-sr=
c.inc
@@ -0,0 +1,78 @@
+# Common src definitions for trusted-firmware-m and trusted-firmware-m-s=
cripts
+
+LICENSE =3D "BSD-2-Clause & BSD-3-Clause & Apache-2.0"
+
+EXTRA_OECMAKE +=3D "-DT_COSE_PATH=3D${UNPACKDIR}/t_cose"
+
+LIC_FILES_CHKSUM =3D "file://license.rst;md5=3D07f368487da347f3c7bd0fc30=
85f3afa \
+                    file://${UNPACKDIR}/tf-m-tests/license.rst;md5=3D448=
1bae2221b0cfca76a69fb3411f390 \
+                    file://${UNPACKDIR}/mbedtls/LICENSE;md5=3D379d581993=
7a6c2f1ef1630d341e026d \
+                    file://${UNPACKDIR}/mcuboot/LICENSE;md5=3Db6ee33f1d1=
2a5e6ee3de1e82fb51eeb8 \
+                    file://${UNPACKDIR}/tfm-psa-adac/license.rst;md5=3D0=
7f368487da347f3c7bd0fc3085f3afa \
+                    file://${UNPACKDIR}/t_cose/LICENSE;md5=3Db2ebdbfb826=
02b97aa628f64cf4b65ad \
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
+SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS ?=3D "gitsm://github.com/ARMmbed/mbed=
tls.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT ?=3D "git://github.com/mcu-tools/mcub=
oot.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_M_QCBOR ?=3D "git://github.com/laurencelundblad=
e/QCBOR.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_M_PSA_ADAC ?=3D "git://git.trustedfirmware.org/=
shared/psa-adac.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_M_T_COSE ?=3D "git://github.com/laurencelundbla=
de/t_cose.git;protocol=3Dhttps"
+SRC_URI  =3D "${SRC_URI_TRUSTED_FIRMWARE_M};branch=3D${SRCBRANCH_tfm};na=
me=3Dtfm;destsuffix=3Dtfm \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_EXTRAS};branch=3D${SRCBRANCH_tf=
m-extras};name=3Dtfm-extras;destsuffix=3Dtfm-extras \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_TESTS};branch=3D${SRCBRANCH_tfm=
-tests};name=3Dtfm-tests;destsuffix=3Dtf-m-tests \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_CMSIS};branch=3D${SRCBRANCH_cms=
is};name=3Dcmsis;destsuffix=3Dcmsis \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS};branch=3D${SRCBRANCH_m=
bedtls};name=3Dmbedtls;destsuffix=3Dmbedtls \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT};branch=3D${SRCBRANCH_m=
cuboot};name=3Dmcuboot;destsuffix=3Dmcuboot \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_QCBOR};branch=3D${SRCBRANCH_qcb=
or};name=3Dqcbor;destsuffix=3Dqcbor \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_PSA_ADAC};branch=3D${SRCBRANCH_=
tfm-psa-adac};name=3Dtfm-psa-adac;destsuffix=3Dtfm-psa-adac \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_T_COSE};branch=3D${SRCBRANCH_t-=
cose};name=3Dt-cose;destsuffix=3Dt_cose \
+            "
+
+# The required dependencies are documented in tf-m/config/config_base.cm=
ake
+# TF-Mv2.2.1
+SRCBRANCH_tfm ?=3D "release/2.2.x"
+SRCREV_tfm =3D "2d91588b14ba2138e05beb1d0685302e68c05fb1"
+# TF-Mv2.2.1
+SRCBRANCH_tfm-extras ?=3D "release/2.2.x"
+SRCREV_tfm-extras =3D "88a4bd39284bb497dd8b362f20cd2b7f704ac390"
+# TF-Mv2.2.1
+SRCBRANCH_tfm-tests ?=3D "release/2.2.x"
+SRCREV_tfm-tests =3D "e0a433c67c37138cd9dce23657ae82c5cbdcf51f"
+# CMSIS v6.1.0, CMSIS_TAG from lib/ext/cmsis/CMakeLists.txt
+SRCBRANCH_cmsis ?=3D "main"
+SRCREV_cmsis =3D "b0bbb0423b278ca632cfe1474eb227961d835fd2"
+# mbedtls-3.6.3.1, value from MBEDCRYPTO_VERSION(-ish)
+SRCBRANCH_mbedtls ?=3D "mbedtls-3.6"
+SRCREV_mbedtls =3D "6fb5120fde4ab889bea402f5ab230c720b0a3b9a"
+# mcuboot v2.2.0, value from MCUBOOT_VERSION
+SRCBRANCH_mcuboot ?=3D "main"
+SRCREV_mcuboot =3D "2d61c318933819a0f4954fb2a5a957a62c6128ce"
+# QCBOR v1.2, value from QCBOR_VERSION in lib/ext/qcbor/CMakeLists.txt
+SRCBRANCH_qcbor ?=3D "master"
+SRCREV_qcbor =3D "92d3f89030baff4af7be8396c563e6c8ef263622"
+# PSA-ADAC (intermediate SHA), value from PLATFORM_PSA_ADAC_VERSION
+SRCBRANCH_tfm-psa-adac =3D "master"
+SRCREV_tfm-psa-adac =3D "819a254af6fb5eefdcef194ec85d2c7627451351"
+# T_COSE v2.0-alpha-2, from lib/ext/t_cose/CMakeLists.txt
+SRCBRANCH_t-cose =3D "dev"
+SRCREV_t-cose =3D "3076010eeb6383f0827bd992c75b68af9311cf1d"
+
+SRCREV_FORMAT =3D "tfm"
+
+S =3D "${UNPACKDIR}/tfm"
+
+# Apply patches
+inherit apply_local_src_patches
+LOCAL_SRC_PATCHES_INPUT_DIR =3D "N/A"
+
+do_apply_local_src_patches() {
+    apply_local_src_patches ${S}/lib/ext/qcbor ${UNPACKDIR}/qcbor
+    apply_local_src_patches ${S}/lib/ext/mbedcrypto ${UNPACKDIR}/mbedtls
+    apply_local_src_patches ${S}/lib/ext/mcuboot ${UNPACKDIR}/mcuboot
+    apply_local_src_patches ${S}/lib/ext/tf-m-tests ${UNPACKDIR}/tf-m-te=
sts
+    apply_local_src_patches ${S}/lib/ext/t_cose ${UNPACKDIR}/t_cose
+}
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2=
.2.1.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2.2.=
1.bb
new file mode 100644
index 00000000..3464f49d
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2.2.1.bb
@@ -0,0 +1,2 @@
+require recipes-bsp/trusted-firmware-m/trusted-firmware-m-${PV}-src.inc
+require recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc

