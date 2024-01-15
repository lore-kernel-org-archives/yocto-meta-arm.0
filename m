Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2CFAC3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 23:08:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.99412.1705360090141951627
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Jan 2024 15:08:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90194FEC
	for <meta-arm@lists.yoctoproject.org>; Mon, 15 Jan 2024 15:08:55 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 825273F73F
	for <meta-arm@lists.yoctoproject.org>; Mon, 15 Jan 2024 15:08:08 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/trusted-firmware-m: update to 2.0.0
Date: Mon, 15 Jan 2024 18:08:07 -0500
Message-Id: <20240115230807.79347-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20240115230807.79347-1-jon.mason@arm.com>
References: <20240115230807.79347-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Jan 2024 23:08:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5333

Updated to the latest version.  Corstone1000 doesn't seem to boot.  So,
pull back the old version to meta-arm-bsp for it to use temporarily.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../conf/machine/include/corstone1000.inc     |  3 +-
 .../trusted-firmware-m-1.8.1-src.inc          |  0
 ...trusted-firmware-m-scripts-native_1.8.1.bb |  0
 .../trusted-firmware-m_1.8.1.bb               |  0
 .../trusted-firmware-m-2.0.0-src.inc          | 46 +++++++++++++++++++
 ...trusted-firmware-m-scripts-native_2.0.0.bb |  2 +
 .../trusted-firmware-m_2.0.0.bb               |  2 +
 7 files changed, 52 insertions(+), 1 deletion(-)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-bsp/trusted-firmware-m/trust=
ed-firmware-m-1.8.1-src.inc (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-bsp/trusted-firmware-m/trust=
ed-firmware-m-scripts-native_1.8.1.bb (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-bsp/trusted-firmware-m/trust=
ed-firmware-m_1.8.1.bb (100%)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmw=
are-m-2.0.0-src.inc
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmw=
are-m-scripts-native_2.0.0.bb
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmw=
are-m_2.0.0.bb

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index 381eaaf36514..d03c23c09c7c 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -12,7 +12,8 @@ TFA_BL2_BINARY =3D "bl2-corstone1000.bin"
 TFA_FIP_BINARY =3D "fip-corstone1000.bin"
=20
 # TF-M
-EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-m"
+EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-m"
+PREFERRED_VERSION_trusted-firmware-m ?=3D "1.8.%"
=20
 # TF-M settings for signing host images
 TFA_BL2_RE_IMAGE_LOAD_ADDRESS =3D "0x62353000"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1=
.8.1-src.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmwa=
re-m-1.8.1-src.inc
similarity index 100%
rename from meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.=
8.1-src.inc
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-=
1.8.1-src.inc
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-s=
cripts-native_1.8.1.bb b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trus=
ted-firmware-m-scripts-native_1.8.1.bb
similarity index 100%
rename from meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-sc=
ripts-native_1.8.1.bb
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-=
scripts-native_1.8.1.bb
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1=
.8.1.bb b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_=
1.8.1.bb
similarity index 100%
rename from meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.=
8.1.bb
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_=
1.8.1.bb
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2=
.0.0-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m=
-2.0.0-src.inc
new file mode 100644
index 000000000000..82543258d79d
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.0.0-sr=
c.inc
@@ -0,0 +1,46 @@
+# Common src definitions for trusted-firmware-m and trusted-firmware-m-s=
cripts
+
+LICENSE =3D "BSD-2-Clause & BSD-3-Clause & Apache-2.0"
+
+LIC_FILES_CHKSUM =3D "file://license.rst;md5=3D07f368487da347f3c7bd0fc30=
85f3afa \
+                    file://../tf-m-tests/license.rst;md5=3D4481bae2221b0=
cfca76a69fb3411f390 \
+                    file://../mbedtls/LICENSE;md5=3D379d5819937a6c2f1ef1=
630d341e026d \
+                    file://../mcuboot/LICENSE;md5=3Db6ee33f1d12a5e6ee3de=
1e82fb51eeb8"
+
+SRC_URI_TRUSTED_FIRMWARE_M ?=3D "git://git.trustedfirmware.org/TF-M/trus=
ted-firmware-m.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_M_EXTRAS ?=3D "git://git.trustedfirmware.org/TF=
-M/tf-m-extras.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_M_TESTS ?=3D "git://git.trustedfirmware.org/TF-=
M/tf-m-tests.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS ?=3D "git://github.com/ARMmbed/mbedtl=
s.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT ?=3D "git://github.com/mcu-tools/mcub=
oot.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_M_QCBOR ?=3D "git://github.com/laurencelundblad=
e/QCBOR.git;protocol=3Dhttps"
+SRC_URI  =3D "${SRC_URI_TRUSTED_FIRMWARE_M};branch=3D${SRCBRANCH_tfm};na=
me=3Dtfm;destsuffix=3Dgit/tfm \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_EXTRAS};branch=3D${SRCBRANCH_tf=
m-extras};name=3Dtfm-extras;destsuffix=3Dgit/tfm-extras \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_TESTS};branch=3D${SRCBRANCH_tfm=
-tests};name=3Dtfm-tests;destsuffix=3Dgit/tf-m-tests \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS};branch=3D${SRCBRANCH_m=
bedtls};name=3Dmbedtls;destsuffix=3Dgit/mbedtls \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT};branch=3D${SRCBRANCH_m=
cuboot};name=3Dmcuboot;destsuffix=3Dgit/mcuboot \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_QCBOR};branch=3D${SRCBRANCH_qcb=
or};name=3Dqcbor;destsuffix=3Dgit/qcbor \
+            "
+
+# The required dependencies are documented in tf-m/config/config_default=
.cmake
+# TF-Mv2.0.0
+SRCBRANCH_tfm ?=3D "release/2.0.x"
+SRCREV_tfm =3D "9ca8a5eb3c85eecee1303dffa262800ea0385584"
+# TF-Mv2.0.0
+SRCBRANCH_tfm-extras ?=3D "release/2.0.x"
+SRCREV_tfm-extras =3D "676a1465f361439bc95f5a50ef71749f27caffc1"
+# TF-Mv2.0.0
+SRCBRANCH_tfm-tests ?=3D "release/2.0.x"
+SRCREV_tfm-tests =3D "69fbb233dc6e45f8306d98694ca5760559f9d2ef"
+# mbedtls-3.5.1
+SRCBRANCH_mbedtls ?=3D "master"
+SRCREV_mbedtls =3D "edb8fec9882084344a314368ac7fd957a187519c"
+# mcuboot v2.0.0
+SRCBRANCH_mcuboot ?=3D "main"
+SRCREV_mcuboot =3D "304fd41980ed929533b9f387dde1b463b0be5b90"
+# QCBOR v1.2
+SRCBRANCH_qcbor ?=3D "master"
+SRCREV_qcbor =3D "b0e7033268e88c9f27146fa9a1415ef4c19ebaff"
+
+SRCREV_FORMAT =3D "tfm"
+
+S =3D "${WORKDIR}/git/tfm"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-s=
cripts-native_2.0.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-=
firmware-m-scripts-native_2.0.0.bb
new file mode 100644
index 000000000000..d50d886f60b2
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-scripts-=
native_2.0.0.bb
@@ -0,0 +1,2 @@
+require recipes-bsp/trusted-firmware-m/trusted-firmware-m-${PV}-src.inc
+require recipes-bsp/trusted-firmware-m/trusted-firmware-m-scripts-native=
.inc
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2=
.0.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2.0.=
0.bb
new file mode 100644
index 000000000000..3464f49dd9d1
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2.0.0.bb
@@ -0,0 +1,2 @@
+require recipes-bsp/trusted-firmware-m/trusted-firmware-m-${PV}-src.inc
+require recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
--=20
2.39.3 (Apple Git-145)


