Return-Path: <mohamed.omarasaker@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AAA8C41535
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 12:33:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.17553.1671625998445545205
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Dec 2022 04:33:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: mohamed.omarasaker@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D7ACAD7;
	Wed, 21 Dec 2022 04:33:59 -0800 (PST)
Received: from e126544.arm.com (unknown [10.57.74.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9B5C3F703;
	Wed, 21 Dec 2022 04:33:16 -0800 (PST)
From: mohamed.omarasaker@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
Subject: [PATCH 3/5] arm-bsp/trusted-firmware-m: corstone1000: TFM 1.7
Date: Wed, 21 Dec 2022 12:32:34 +0000
Message-Id: <20221221123236.342413-4-mohamed.omarasaker@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221221123236.342413-1-mohamed.omarasaker@arm.com>
References: <20221221123236.342413-1-mohamed.omarasaker@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 21 Dec 2022 12:33:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4212

From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>

Add TFM corstone append file for v1.7

Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
---
 .../trusted-firmware-m-1.7.0-corstone1000.inc | 40 +++++++++++++++++++
 .../trusted-firmware-m_1.7.%.bbappend         |  6 +++
 .../trusted-firmware-m_1.7.0.bb               |  8 +++-
 3 files changed, 52 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-f=
irmware-m-1.7.0-corstone1000.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-f=
irmware-m_1.7.%.bbappend

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-1.7.0-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/t=
rusted-firmware-m-1.7.0-corstone1000.inc
new file mode 100644
index 00000000..861dcff8
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.=
0-corstone1000.inc
@@ -0,0 +1,40 @@
+# Corstone1000 machines specific TFM support
+
+COMPATIBLE_MACHINE =3D "(corstone1000)"
+
+TFM_PLATFORM =3D "arm/corstone1000"
+
+TFM_DEBUG =3D "1"
+
+
+
+## Default is the MPS3 board
+TFM_PLATFORM_IS_FVP ?=3D "FALSE"
+EXTRA_OECMAKE +=3D "-DPLATFORM_IS_FVP=3D${TFM_PLATFORM_IS_FVP}"
+EXTRA_OECMAKE +=3D "-DCC312_LEGACY_DRIVER_API_ENABLED=3DOFF"
+
+# libmetal
+LICENSE +=3D "& BSD-3-Clause"
+LIC_FILES_CHKSUM +=3D "file://../libmetal/LICENSE.md;md5=3Dfe0b8a4beea8f=
0813b606d15a3df3d3c"
+SRC_URI +=3D "git://github.com/OpenAMP/libmetal.git;protocol=3Dhttps;bra=
nch=3Dmain;name=3Dlibmetal;destsuffix=3Dgit/libmetal"
+SRCREV_libmetal =3D "f252f0e007fbfb8b3a52b1d5901250ddac96baad"
+EXTRA_OECMAKE +=3D "-DLIBMETAL_SRC_PATH=3D${S}/../libmetal -DLIBMETAL_BI=
N_PATH=3D${B}/libmetal-build"
+
+# OpenAMP
+LICENSE +=3D "& BSD-2-Clause & BSD-3-Clause"
+LIC_FILES_CHKSUM +=3D "file://../openamp/LICENSE.md;md5=3Da8d8cf662ef6bf=
9936a1e1413585ecbf"
+SRC_URI +=3D "git://github.com/OpenAMP/open-amp.git;protocol=3Dhttps;bra=
nch=3Dmain;name=3Dopenamp;destsuffix=3Dgit/openamp"
+SRCREV_openamp =3D "347397decaa43372fc4d00f965640ebde042966d"
+EXTRA_OECMAKE +=3D "-DLIBOPENAMP_SRC_PATH=3D${S}/../openamp -DLIBOPENAMP=
_BIN_PATH=3D${B}/libopenamp-build"
+
+
+# Uncomment to apply patches
+# FILESEXTRAPATHS:prepend :=3D "${THISDIR}/corstone1000:"
+# SRC_URI:append:corstone1000 =3D " \
+#           "
+
+do_install() {
+  install -D -p -m 0644 ${B}/install/outputs/tfm_s_signed.bin ${D}/firmw=
are/tfm_s_signed.bin
+  install -D -p -m 0644 ${B}/install/outputs/bl2_signed.bin ${D}/firmwar=
e/bl2_signed.bin
+  install -D -p -m 0644 ${B}/install/outputs/bl1.bin ${D}/firmware/bl1.b=
in
+}
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m_1.7.%.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-f=
irmware-m_1.7.%.bbappend
new file mode 100644
index 00000000..ec0e483b
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.7.=
%.bbappend
@@ -0,0 +1,6 @@
+# Machine specific configurations
+
+MACHINE_TFM_REQUIRE ?=3D ""
+MACHINE_TFM_REQUIRE:corstone1000 =3D "trusted-firmware-m-1.7.0-corstone1=
000.inc"
+
+require ${MACHINE_TFM_REQUIRE}
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1=
.7.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.7.=
0.bb
index f863dc71..3b4469d0 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.7.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.7.0.bb
@@ -8,7 +8,7 @@ DESCRIPTION =3D "Trusted Firmware-M"
 HOMEPAGE =3D "https://git.trustedfirmware.org/trusted-firmware-m.git"
 PROVIDES =3D "virtual/trusted-firmware-m"
=20
-LICENSE =3D "BSD-3-Clause & Apache-2.0"
+LICENSE =3D "BSD-2-Clause & BSD-3-Clause & Apache-2.0"
=20
 LIC_FILES_CHKSUM =3D "file://license.rst;md5=3D07f368487da347f3c7bd0fc30=
85f3afa \
                     file://../tf-m-tests/license.rst;md5=3D02d06ffb8d9f0=
99ff4961c0cb0183a18 \
@@ -19,6 +19,7 @@ SRC_URI  =3D "git://git.trustedfirmware.org/TF-M/truste=
d-firmware-m.git;protocol=3Dh
             git://git.trustedfirmware.org/TF-M/tf-m-tests.git;protocol=3D=
https;branch=3D${SRCBRANCH_tfm-tests};name=3Dtfm-tests;destsuffix=3Dgit/t=
f-m-tests \
             git://github.com/ARMmbed/mbedtls.git;protocol=3Dhttps;branch=
=3D${SRCBRANCH_mbedtls};name=3Dmbedtls;destsuffix=3Dgit/mbedtls \
             git://github.com/mcu-tools/mcuboot.git;protocol=3Dhttps;bran=
ch=3D${SRCBRANCH_mcuboot};name=3Dmcuboot;destsuffix=3Dgit/mcuboot \
+            git://github.com/laurencelundblade/QCBOR.git;protocol=3Dhttp=
s;branch=3D${SRCBRANCH_qcbor};name=3Dqcbor;destsuffix=3Dgit/qcbor \
             "
=20
 # The required dependencies are documented in tf-m/config/config_default=
.cmake
@@ -34,6 +35,9 @@ SRCREV_tfm-tests =3D "4972e8df3fcbd386a5b0c18613d8a803f=
4dda082"
 # v1.9.0
 SRCBRANCH_mcuboot ?=3D "main"
 SRCREV_mcuboot =3D "c657cbea75f2bb1faf1fceacf972a0537a8d26dd"
+# qcbor
+SRCBRANCH_qcbor ?=3D "master"
+SRCREV_qcbor =3D "b0e7033268e88c9f27146fa9a1415ef4c19ebaff"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "^TF-Mv(?P<pver>\d+(\.\d+)+)$"
=20
@@ -92,7 +96,7 @@ EXTRA_OECMAKE +=3D "${@bb.utils.contains('TFM_DEBUG', '=
1', '-DCMAKE_BUILD_TYPE=3DDeb
 # Verbose builds
 EXTRA_OECMAKE +=3D "-DCMAKE_VERBOSE_MAKEFILE:BOOL=3DON"
=20
-EXTRA_OECMAKE +=3D "-DMBEDCRYPTO_PATH=3D${S}/../mbedtls -DTFM_TEST_REPO_=
PATH=3D${S}/../tf-m-tests -DMCUBOOT_PATH=3D${S}/../mcuboot"
+EXTRA_OECMAKE +=3D "-DMBEDCRYPTO_PATH=3D${S}/../mbedtls -DTFM_TEST_REPO_=
PATH=3D${S}/../tf-m-tests -DMCUBOOT_PATH=3D${S}/../mcuboot -DQCBOR_PATH=3D=
${S}/../qcbor"
=20
 export CMAKE_BUILD_PARALLEL_LEVEL =3D "${@oe.utils.parallel_make(d, Fals=
e)}"
=20
--=20
2.25.1


