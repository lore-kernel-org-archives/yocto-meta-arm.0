Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BD97C6FA99
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 12:05:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6954.1677067507163251900
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 Feb 2023 04:05:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7771139F;
	Wed, 22 Feb 2023 04:05:49 -0800 (PST)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 619E03F881;
	Wed, 22 Feb 2023 04:05:06 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 3/6] arm/trusted-firmware-m: Create common inc file for src definitions
Date: Wed, 22 Feb 2023 12:04:38 +0000
Message-Id: <20230222120441.2684534-3-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222120441.2684534-1-peter.hoyes@arm.com>
References: <20230222120441.2684534-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 22 Feb 2023 12:05:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4439

From: Peter Hoyes <Peter.Hoyes@arm.com>

To try and prevent trusted-firmware-m and trusted-firmware-m-scripts
from becoming out of sync in the future, create a common
trusted-firmware-m-1.7.0-src.inc which defines all the repositories and
their SHAs for both. Include this file in both recipes.

Add a SUMMARY and DESCRIPTION to trusted-firmware-m-scripts.

Update mbedtls to 3.2.1 (the recommended version for TF-M 1.7.0)

Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
---
 .../trusted-firmware-m-1.7.0-src.inc          | 41 +++++++++++++++++++
 .../trusted-firmware-m_1.7.0.bb               | 40 ++----------------
 ...trusted-firmware-m-scripts-native_1.7.0.bb | 14 ++-----
 3 files changed, 48 insertions(+), 47 deletions(-)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmw=
are-m-1.7.0-src.inc

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1=
.7.0-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m=
-1.7.0-src.inc
new file mode 100644
index 00000000..7d5b4b53
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-sr=
c.inc
@@ -0,0 +1,41 @@
+# Common src definitions for trusted-firmware-m and trusted-firmware-m-s=
cripts
+
+LICENSE =3D "BSD-2-Clause & BSD-3-Clause & Apache-2.0"
+
+LIC_FILES_CHKSUM =3D "file://license.rst;md5=3D07f368487da347f3c7bd0fc30=
85f3afa \
+                    file://../tf-m-tests/license.rst;md5=3D02d06ffb8d9f0=
99ff4961c0cb0183a18 \
+                    file://../mbedtls/LICENSE;md5=3D3b83ef96387f14655fc8=
54ddc3c6bd57 \
+                    file://../mcuboot/LICENSE;md5=3Db6ee33f1d12a5e6ee3de=
1e82fb51eeb8"
+
+SRC_URI_TRUSTED_FIRMWARE_M ?=3D "git://git.trustedfirmware.org/TF-M/trus=
ted-firmware-m.git;protocol=3Dhttps"
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
+# TF-Mv1.7.0
+SRCBRANCH_tfm ?=3D "master"
+SRCREV_tfm =3D "b725a1346cdb9ec75b1adcdc4c84705881e8fd4e"
+# TF-Mv1.7.0
+SRCBRANCH_tfm-tests ?=3D "master"
+SRCREV_tfm-tests =3D "4c4b58041c6c01670266690538a780b4a23d08b8"
+# mbedtls-3.2.1
+SRCBRANCH_mbedtls ?=3D "master"
+SRCREV_mbedtls =3D "869298bffeea13b205343361b7a7daf2b210e33d"
+# v1.9.0
+SRCBRANCH_mcuboot ?=3D "main"
+SRCREV_mcuboot =3D "c657cbea75f2bb1faf1fceacf972a0537a8d26dd"
+# qcbor
+SRCBRANCH_qcbor ?=3D "master"
+SRCREV_qcbor =3D "b0e7033268e88c9f27146fa9a1415ef4c19ebaff"
+
+SRCREV_FORMAT =3D "tfm"
+
+S =3D "${WORKDIR}/git/tfm"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1=
.7.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.7.=
0.bb
index 8df21339..799c5d56 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.7.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.7.0.bb
@@ -8,42 +8,9 @@ DESCRIPTION =3D "Trusted Firmware-M"
 HOMEPAGE =3D "https://git.trustedfirmware.org/trusted-firmware-m.git"
 PROVIDES =3D "virtual/trusted-firmware-m"
=20
-LICENSE =3D "BSD-2-Clause & BSD-3-Clause & Apache-2.0"
-
-LIC_FILES_CHKSUM =3D "file://license.rst;md5=3D07f368487da347f3c7bd0fc30=
85f3afa \
-                    file://../tf-m-tests/license.rst;md5=3D02d06ffb8d9f0=
99ff4961c0cb0183a18 \
-                    file://../mbedtls/LICENSE;md5=3D3b83ef96387f14655fc8=
54ddc3c6bd57 \
-                    file://../mcuboot/LICENSE;md5=3Db6ee33f1d12a5e6ee3de=
1e82fb51eeb8"
-
-SRC_URI_TRUSTED_FIRMWARE_M ?=3D "git://git.trustedfirmware.org/TF-M/trus=
ted-firmware-m.git;protocol=3Dhttps"
-SRC_URI_TRUSTED_FIRMWARE_M_TESTS ?=3D "git://git.trustedfirmware.org/TF-=
M/tf-m-tests.git;protocol=3Dhttps"
-SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS ?=3D "git://github.com/ARMmbed/mbedtl=
s.git;protocol=3Dhttps"
-SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT ?=3D "git://github.com/mcu-tools/mcub=
oot.git;protocol=3Dhttps"
-SRC_URI_TRUSTED_FIRMWARE_M_QCBOR ?=3D "git://github.com/laurencelundblad=
e/QCBOR.git;protocol=3Dhttps"
-SRC_URI  =3D "${SRC_URI_TRUSTED_FIRMWARE_M};branch=3D${SRCBRANCH_tfm};na=
me=3Dtfm;destsuffix=3Dgit/tfm \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_TESTS};branch=3D${SRCBRANCH_tfm=
-tests};name=3Dtfm-tests;destsuffix=3Dgit/tf-m-tests \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS};branch=3D${SRCBRANCH_m=
bedtls};name=3Dmbedtls;destsuffix=3Dgit/mbedtls \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT};branch=3D${SRCBRANCH_m=
cuboot};name=3Dmcuboot;destsuffix=3Dgit/mcuboot \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_QCBOR};branch=3D${SRCBRANCH_qcb=
or};name=3Dqcbor;destsuffix=3Dgit/qcbor \
-            file://rwx.patch \
-            "
-
-# The required dependencies are documented in tf-m/config/config_default=
.cmake
-# TF-Mv1.7.0
-SRCBRANCH_tfm ?=3D "master"
-SRCREV_tfm =3D "b725a1346cdb9ec75b1adcdc4c84705881e8fd4e"
-# mbedtls-3.2.0
-SRCBRANCH_mbedtls ?=3D "master"
-SRCREV_mbedtls =3D "869298bffeea13b205343361b7a7daf2b210e33d"
-# TF-Mv1.7.0
-SRCBRANCH_tfm-tests ?=3D "master"
-SRCREV_tfm-tests =3D "4c4b58041c6c01670266690538a780b4a23d08b8"
-# v1.9.0
-SRCBRANCH_mcuboot ?=3D "main"
-SRCREV_mcuboot =3D "c657cbea75f2bb1faf1fceacf972a0537a8d26dd"
-# qcbor
-SRCBRANCH_qcbor ?=3D "master"
-SRCREV_qcbor =3D "b0e7033268e88c9f27146fa9a1415ef4c19ebaff"
+require recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-src.inc
+
+SRC_URI +=3D "file://rwx.patch"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "^TF-Mv(?P<pver>\d+(\.\d+)+)$"
=20
@@ -75,7 +42,6 @@ DEPENDS +=3D "cmake-native \
             python3-kconfiglib-native \
 "
=20
-S =3D "${WORKDIR}/git/tfm"
 B =3D "${WORKDIR}/build"
=20
 # Build for debug (set TFM_DEBUG to 1 to activate)
diff --git a/meta-arm/recipes-devtools/trusted-firmware-m-scripts/trusted=
-firmware-m-scripts-native_1.7.0.bb b/meta-arm/recipes-devtools/trusted-f=
irmware-m-scripts/trusted-firmware-m-scripts-native_1.7.0.bb
index f30c3b52..cd273593 100644
--- a/meta-arm/recipes-devtools/trusted-firmware-m-scripts/trusted-firmwa=
re-m-scripts-native_1.7.0.bb
+++ b/meta-arm/recipes-devtools/trusted-firmware-m-scripts/trusted-firmwa=
re-m-scripts-native_1.7.0.bb
@@ -1,14 +1,8 @@
+SUMMARY =3D "Trusted Firmware image signing scripts"
+DESCRIPTION =3D "Trusted Firmware-M image signing scripts"
+HOMEPAGE =3D "https://git.trustedfirmware.org/trusted-firmware-m.git"
=20
-SRC_URI_TRUSTED_FIRMWARE_M ?=3D "git://git.trustedfirmware.org/TF-M/trus=
ted-firmware-m.git;protocol=3Dhttps"
-SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_M};branch=3D${SRCBRANCH}"
-# Use the wrapper script from TF-Mv1.7.0
-SRCBRANCH ?=3D "master"
-SRCREV =3D "b725a1346cdb9ec75b1adcdc4c84705881e8fd4e"
-
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://license.rst;md5=3D07f368487da347f3c7bd0fc30=
85f3afa"
-
-S =3D "${WORKDIR}/git"
+require recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-src.inc
=20
 inherit native
=20
--=20
2.34.1


