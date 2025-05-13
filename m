Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 775CFC3ABCC
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 13:24:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.75942.1747142632169306627
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 13 May 2025 06:23:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 905F3168F
	for <meta-arm@lists.yoctoproject.org>; Tue, 13 May 2025 06:23:40 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5AE623F673
	for <meta-arm@lists.yoctoproject.org>; Tue, 13 May 2025 06:23:51 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/trusted-firmware-m: add 2.2.0 recipe
Date: Tue, 13 May 2025 09:23:49 -0400
Message-Id: <20250513132350.72095-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 13 May 2025 13:24:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6499

New version moved from integrated version of t_cose to upstream git
tree.  Doing so necessitates adding a path to the build command, which
is only being done in the 2.2.0 src inc file to prevent any potential
issues with older versions that might be using the
trusted-firmware-m.inc file.  t_cose is using BSD, so no need to modify
the recipe licenses.

Also, the 3.6.3 tagged SHA for mbedtls (specified in the 2.2 tf-m
source) is broken.  It references an non-existent SHA for
mbedtls-framework, which is corrected in the mbedtls-3.6 branch 2
commits later.  Using that corrected commit to work around that issue.

Keeping 2.1.1 around as it is the LTS.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../trusted-firmware-m-2.2.0-src.inc          | 66 +++++++++++++++++++
 ...trusted-firmware-m-scripts-native_2.2.0.bb |  2 +
 .../trusted-firmware-m_2.2.0.bb               |  2 +
 3 files changed, 70 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmw=
are-m-2.2.0-src.inc
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmw=
are-m-scripts-native_2.2.0.bb
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmw=
are-m_2.2.0.bb

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2=
.2.0-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m=
-2.2.0-src.inc
new file mode 100644
index 000000000000..b475b7a3baf8
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.2.0-sr=
c.inc
@@ -0,0 +1,66 @@
+# Common src definitions for trusted-firmware-m and trusted-firmware-m-s=
cripts
+
+LICENSE =3D "BSD-2-Clause & BSD-3-Clause & Apache-2.0"
+
+EXTRA_OECMAKE +=3D "-DT_COSE_PATH=3D${S}/../t_cose"
+
+LIC_FILES_CHKSUM =3D "file://license.rst;md5=3D07f368487da347f3c7bd0fc30=
85f3afa \
+                    file://../tf-m-tests/license.rst;md5=3D4481bae2221b0=
cfca76a69fb3411f390 \
+                    file://../mbedtls/LICENSE;md5=3D379d5819937a6c2f1ef1=
630d341e026d \
+                    file://../mcuboot/LICENSE;md5=3Db6ee33f1d12a5e6ee3de=
1e82fb51eeb8 \
+                    file://../tfm-psa-adac/license.rst;md5=3D07f368487da=
347f3c7bd0fc3085f3afa \
+                    file://../t_cose/LICENSE;md5=3Db2ebdbfb82602b97aa628=
f64cf4b65ad \
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
me=3Dtfm;destsuffix=3Dgit/tfm \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_EXTRAS};branch=3D${SRCBRANCH_tf=
m-extras};name=3Dtfm-extras;destsuffix=3Dgit/tfm-extras \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_TESTS};branch=3D${SRCBRANCH_tfm=
-tests};name=3Dtfm-tests;destsuffix=3Dgit/tf-m-tests \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_CMSIS};branch=3D${SRCBRANCH_cms=
is};name=3Dcmsis;destsuffix=3Dgit/cmsis \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS};branch=3D${SRCBRANCH_m=
bedtls};name=3Dmbedtls;destsuffix=3Dgit/mbedtls \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT};branch=3D${SRCBRANCH_m=
cuboot};name=3Dmcuboot;destsuffix=3Dgit/mcuboot \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_QCBOR};branch=3D${SRCBRANCH_qcb=
or};name=3Dqcbor;destsuffix=3Dgit/qcbor \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_PSA_ADAC};branch=3D${SRCBRANCH_=
tfm-psa-adac};name=3Dtfm-psa-adac;destsuffix=3Dgit/tfm-psa-adac \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_T_COSE};branch=3D${SRCBRANCH_t-=
cose};name=3Dt-cose;destsuffix=3Dgit/t_cose \
+            "
+
+# The required dependencies are documented in tf-m/config/config_base.cm=
ake
+# TF-Mv2.2.0
+SRCBRANCH_tfm ?=3D "release/2.2.x"
+SRCREV_tfm =3D "dd2b7de197742beeebd12197c14d9d3cb1b9ec68"
+# TF-Mv2.2.0
+SRCBRANCH_tfm-extras ?=3D "release/2.2.x"
+SRCREV_tfm-extras =3D "88a4bd39284bb497dd8b362f20cd2b7f704ac390"
+# TF-Mv2.2.0
+SRCBRANCH_tfm-tests ?=3D "release/2.2.x"
+SRCREV_tfm-tests =3D "e0a433c67c37138cd9dce23657ae82c5cbdcf51f"
+# CMSIS v6.1.0, CMSIS_TAG from lib/ext/cmsis/CMakeLists.txt
+SRCBRANCH_cmsis ?=3D "main"
+SRCREV_cmsis =3D "b0bbb0423b278ca632cfe1474eb227961d835fd2"
+# mbedtls-3.6.3 (+2 commits), value from MBEDCRYPTO_VERSION(-ish)
+SRCBRANCH_mbedtls ?=3D "mbedtls-3.6"
+SRCREV_mbedtls =3D "8cf5666a174237998a7965e284d7ba8c1655d16d"
+# mcuboot v2.2.0-rc1+ (intermediate SHA), value from MCUBOOT_VERSION
+SRCBRANCH_mcuboot ?=3D "main"
+SRCREV_mcuboot =3D "6071ceb1d0d955b6ff4745499a0ff3ac7d79f24b"
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
+S =3D "${WORKDIR}/git/tfm"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-s=
cripts-native_2.2.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-=
firmware-m-scripts-native_2.2.0.bb
new file mode 100644
index 000000000000..d50d886f60b2
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-scripts-=
native_2.2.0.bb
@@ -0,0 +1,2 @@
+require recipes-bsp/trusted-firmware-m/trusted-firmware-m-${PV}-src.inc
+require recipes-bsp/trusted-firmware-m/trusted-firmware-m-scripts-native=
.inc
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2=
.2.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2.2.=
0.bb
new file mode 100644
index 000000000000..3464f49dd9d1
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2.2.0.bb
@@ -0,0 +1,2 @@
+require recipes-bsp/trusted-firmware-m/trusted-firmware-m-${PV}-src.inc
+require recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
--=20
2.39.5 (Apple Git-154)


