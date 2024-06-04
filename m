Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B615C25B78
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 18:11:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.3077.1717524661466662549
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Jun 2024 11:11:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8873BDA7
	for <meta-arm@lists.yoctoproject.org>; Tue,  4 Jun 2024 11:11:25 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EB5363F762
	for <meta-arm@lists.yoctoproject.org>; Tue,  4 Jun 2024 11:11:00 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/trusted-firmware-m: update to 2.1.0
Date: Tue,  4 Jun 2024 14:11:00 -0400
Message-Id: <20240604181100.15623-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Jun 2024 18:11:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5791

Adding CMSIS support, as it is now required.  Also, the SHA being
referenced by tf-m for cmsis is an intermediate SHA (between the v6.0.0
and v6.1.0 release tags).  Finally, mbedtls is now using git submodules.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../trusted-firmware-m-2.0.0-src.inc          |  0
 ...trusted-firmware-m-scripts-native_2.0.0.bb |  0
 .../trusted-firmware-m_2.0.0.bb               |  0
 .../trusted-firmware-m-2.1.0-src.inc          | 51 +++++++++++++++++++
 ...trusted-firmware-m-scripts-native_2.1.0.bb |  2 +
 .../trusted-firmware-m/trusted-firmware-m.inc |  2 +-
 .../trusted-firmware-m_2.1.0.bb               |  2 +
 7 files changed, 56 insertions(+), 1 deletion(-)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-bsp/trusted-firmware-m/trust=
ed-firmware-m-2.0.0-src.inc (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-bsp/trusted-firmware-m/trust=
ed-firmware-m-scripts-native_2.0.0.bb (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-bsp/trusted-firmware-m/trust=
ed-firmware-m_2.0.0.bb (100%)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmw=
are-m-2.1.0-src.inc
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmw=
are-m-scripts-native_2.1.0.bb
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmw=
are-m_2.1.0.bb

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2=
.0.0-src.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmwa=
re-m-2.0.0-src.inc
similarity index 100%
rename from meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.=
0.0-src.inc
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-=
2.0.0-src.inc
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-s=
cripts-native_2.0.0.bb b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trus=
ted-firmware-m-scripts-native_2.0.0.bb
similarity index 100%
rename from meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-sc=
ripts-native_2.0.0.bb
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-=
scripts-native_2.0.0.bb
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2=
.0.0.bb b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_=
2.0.0.bb
similarity index 100%
rename from meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2.=
0.0.bb
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_=
2.0.0.bb
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2=
.1.0-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m=
-2.1.0-src.inc
new file mode 100644
index 000000000000..f804bf049f89
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.1.0-sr=
c.inc
@@ -0,0 +1,51 @@
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
+SRC_URI_TRUSTED_FIRMWARE_M_CMSIS ?=3D "git://github.com/ARM-software/CMS=
IS_6.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS ?=3D "gitsm://github.com/ARMmbed/mbed=
tls.git;protocol=3Dhttps"
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
+            ${SRC_URI_TRUSTED_FIRMWARE_M_CMSIS};branch=3D${SRCBRANCH_cms=
is};name=3Dcmsis;destsuffix=3Dgit/cmsis \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS};branch=3D${SRCBRANCH_m=
bedtls};name=3Dmbedtls;destsuffix=3Dgit/mbedtls \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT};branch=3D${SRCBRANCH_m=
cuboot};name=3Dmcuboot;destsuffix=3Dgit/mcuboot \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_QCBOR};branch=3D${SRCBRANCH_qcb=
or};name=3Dqcbor;destsuffix=3Dgit/qcbor \
+            "
+
+# The required dependencies are documented in tf-m/config/config_base.cm=
ake
+# TF-Mv2.1.0
+SRCBRANCH_tfm ?=3D "release/2.1.x"
+SRCREV_tfm =3D "0c4c99ba33b3e66deea070e149279278dc7647f4"
+# TF-Mv2.1.0
+SRCBRANCH_tfm-extras ?=3D "release/2.1.x"
+SRCREV_tfm-extras =3D "95add8abb15879f48f1069a0952dd9abdffbc1f8"
+# TF-Mv2.1.0
+SRCBRANCH_tfm-tests ?=3D "release/2.1.x"
+SRCREV_tfm-tests =3D "73100d90d8871435eaffa668eb04ce5b746ecece"
+# CMSIS v6.0.0+ (intermediate SHA)
+SRCBRANCH_cmsis ?=3D "main"
+SRCREV_cmsis =3D "d0c460c1697d210b49a4b90998195831c0cd325c"
+# mbedtls-3.6.0
+SRCBRANCH_mbedtls ?=3D "master"
+SRCREV_mbedtls =3D "2ca6c285a0dd3f33982dd57299012dacab1ff206"
+# mcuboot v2.1.0
+SRCBRANCH_mcuboot ?=3D "main"
+SRCREV_mcuboot =3D "9c99326b9756dbcc35b524636d99ed5f3e6cb29b"
+# QCBOR v1.2
+SRCBRANCH_qcbor ?=3D "master"
+SRCREV_qcbor =3D "b0e7033268e88c9f27146fa9a1415ef4c19ebaff"
+
+SRCREV_FORMAT =3D "tfm"
+
+S =3D "${WORKDIR}/git/tfm"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-s=
cripts-native_2.1.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-=
firmware-m-scripts-native_2.1.0.bb
new file mode 100644
index 000000000000..d50d886f60b2
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-scripts-=
native_2.1.0.bb
@@ -0,0 +1,2 @@
+require recipes-bsp/trusted-firmware-m/trusted-firmware-m-${PV}-src.inc
+require recipes-bsp/trusted-firmware-m/trusted-firmware-m-scripts-native=
.inc
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
index 772366d9117f..7dbe12b2c94c 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
@@ -73,7 +73,7 @@ EXTRA_OECMAKE +=3D "${@bb.utils.contains('TFM_DEBUG', '=
1', '-DCMAKE_BUILD_TYPE=3DDeb
 # Verbose builds
 EXTRA_OECMAKE +=3D "-DCMAKE_VERBOSE_MAKEFILE:BOOL=3DON"
=20
-EXTRA_OECMAKE +=3D "-DMBEDCRYPTO_PATH=3D${S}/../mbedtls -DTFM_TEST_REPO_=
PATH=3D${S}/../tf-m-tests -DTFM_EXTRAS_REPO_PATH=3D${S}/../tfm-extras -DM=
CUBOOT_PATH=3D${S}/../mcuboot -DQCBOR_PATH=3D${S}/../qcbor"
+EXTRA_OECMAKE +=3D "-DMBEDCRYPTO_PATH=3D${S}/../mbedtls -DTFM_TEST_REPO_=
PATH=3D${S}/../tf-m-tests -DTFM_EXTRAS_REPO_PATH=3D${S}/../tfm-extras -DM=
CUBOOT_PATH=3D${S}/../mcuboot -DQCBOR_PATH=3D${S}/../qcbor -DCMSIS_PATH=3D=
${S}/../cmsis"
=20
 export CMAKE_BUILD_PARALLEL_LEVEL =3D "${@oe.utils.parallel_make(d, Fals=
e)}"
=20
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2=
.1.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2.1.=
0.bb
new file mode 100644
index 000000000000..3464f49dd9d1
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2.1.0.bb
@@ -0,0 +1,2 @@
+require recipes-bsp/trusted-firmware-m/trusted-firmware-m-${PV}-src.inc
+require recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
--=20
2.39.3 (Apple Git-146)


