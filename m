Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E8CC52D7D
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 11:31:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.31266.1723030284536495468
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 07 Aug 2024 04:31:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F174FEC;
	Wed,  7 Aug 2024 04:31:50 -0700 (PDT)
Received: from e126523.budapest.arm.com (e126523.budapest.arm.com [10.45.26.153])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B0693F5A1;
	Wed,  7 Aug 2024 04:31:23 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH 3/3] arm-bsp/trusted-firmware-m: Remove TF-M v2.0 recipe
Date: Wed,  7 Aug 2024 13:31:08 +0200
Message-Id: <20240807113108.58898-4-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240807113108.58898-1-bence.balogh@arm.com>
References: <20240807113108.58898-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 07 Aug 2024 11:31:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5956

From: Bence Balogh <bence.balogh@arm.com>

There no longer is a platform in meta-arm that uses this version of
TF-M. The last platform that did use it (Corstone-1000) now uses
a later version.
See meta-arm-bsp/conf/machine/include/corstone1000.inc for more info.

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 .../trusted-firmware-m-2.0.0-src.inc          | 46 -------------------
 ...trusted-firmware-m-scripts-native_2.0.0.bb |  2 -
 .../trusted-firmware-m_2.0.0.bb               |  2 -
 3 files changed, 50 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-f=
irmware-m-2.0.0-src.inc
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-f=
irmware-m-scripts-native_2.0.0.bb
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-f=
irmware-m_2.0.0.bb

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-2.0.0-src.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-fi=
rmware-m-2.0.0-src.inc
deleted file mode 100644
index 82543258..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.0.=
0-src.inc
+++ /dev/null
@@ -1,46 +0,0 @@
-# Common src definitions for trusted-firmware-m and trusted-firmware-m-s=
cripts
-
-LICENSE =3D "BSD-2-Clause & BSD-3-Clause & Apache-2.0"
-
-LIC_FILES_CHKSUM =3D "file://license.rst;md5=3D07f368487da347f3c7bd0fc30=
85f3afa \
-                    file://../tf-m-tests/license.rst;md5=3D4481bae2221b0=
cfca76a69fb3411f390 \
-                    file://../mbedtls/LICENSE;md5=3D379d5819937a6c2f1ef1=
630d341e026d \
-                    file://../mcuboot/LICENSE;md5=3Db6ee33f1d12a5e6ee3de=
1e82fb51eeb8"
-
-SRC_URI_TRUSTED_FIRMWARE_M ?=3D "git://git.trustedfirmware.org/TF-M/trus=
ted-firmware-m.git;protocol=3Dhttps"
-SRC_URI_TRUSTED_FIRMWARE_M_EXTRAS ?=3D "git://git.trustedfirmware.org/TF=
-M/tf-m-extras.git;protocol=3Dhttps"
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
-            ${SRC_URI_TRUSTED_FIRMWARE_M_EXTRAS};branch=3D${SRCBRANCH_tf=
m-extras};name=3Dtfm-extras;destsuffix=3Dgit/tfm-extras \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_TESTS};branch=3D${SRCBRANCH_tfm=
-tests};name=3Dtfm-tests;destsuffix=3Dgit/tf-m-tests \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS};branch=3D${SRCBRANCH_m=
bedtls};name=3Dmbedtls;destsuffix=3Dgit/mbedtls \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT};branch=3D${SRCBRANCH_m=
cuboot};name=3Dmcuboot;destsuffix=3Dgit/mcuboot \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_QCBOR};branch=3D${SRCBRANCH_qcb=
or};name=3Dqcbor;destsuffix=3Dgit/qcbor \
-            "
-
-# The required dependencies are documented in tf-m/config/config_default=
.cmake
-# TF-Mv2.0.0
-SRCBRANCH_tfm ?=3D "release/2.0.x"
-SRCREV_tfm =3D "9ca8a5eb3c85eecee1303dffa262800ea0385584"
-# TF-Mv2.0.0
-SRCBRANCH_tfm-extras ?=3D "release/2.0.x"
-SRCREV_tfm-extras =3D "676a1465f361439bc95f5a50ef71749f27caffc1"
-# TF-Mv2.0.0
-SRCBRANCH_tfm-tests ?=3D "release/2.0.x"
-SRCREV_tfm-tests =3D "69fbb233dc6e45f8306d98694ca5760559f9d2ef"
-# mbedtls-3.5.1
-SRCBRANCH_mbedtls ?=3D "master"
-SRCREV_mbedtls =3D "edb8fec9882084344a314368ac7fd957a187519c"
-# mcuboot v2.0.0
-SRCBRANCH_mcuboot ?=3D "main"
-SRCREV_mcuboot =3D "304fd41980ed929533b9f387dde1b463b0be5b90"
-# QCBOR v1.2
-SRCBRANCH_qcbor ?=3D "master"
-SRCREV_qcbor =3D "b0e7033268e88c9f27146fa9a1415ef4c19ebaff"
-
-SRCREV_FORMAT =3D "tfm"
-
-S =3D "${WORKDIR}/git/tfm"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-scripts-native_2.0.0.bb b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/=
trusted-firmware-m-scripts-native_2.0.0.bb
deleted file mode 100644
index d50d886f..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-scri=
pts-native_2.0.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require recipes-bsp/trusted-firmware-m/trusted-firmware-m-${PV}-src.inc
-require recipes-bsp/trusted-firmware-m/trusted-firmware-m-scripts-native=
.inc
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m_2.0.0.bb b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmwar=
e-m_2.0.0.bb
deleted file mode 100644
index 3464f49d..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2.0.=
0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require recipes-bsp/trusted-firmware-m/trusted-firmware-m-${PV}-src.inc
-require recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
--=20
2.25.1


