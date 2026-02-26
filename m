Return-Path: <arthur.cassegrain@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98191FC592B
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 10:53:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67636.1772103213283872612
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 26 Feb 2026 02:53:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: arthur.cassegrain@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BA5015A1;
	Thu, 26 Feb 2026 02:53:26 -0800 (PST)
Received: from e142502.nice.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3FB3F3F73B;
	Thu, 26 Feb 2026 02:53:32 -0800 (PST)
From: Arthur Cassegrain <arthur.cassegrain@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Arthur Cassegrain <arthur.cassegrain@arm.com>
Subject: [PATCH 3/3] arm/trusted-services: clone dependencies under ts source tree
Date: Thu, 26 Feb 2026 11:53:12 +0100
Message-ID: <20260226105312.4084782-4-arthur.cassegrain@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226105312.4084782-1-arthur.cassegrain@arm.com>
References: <20260226105312.4084782-1-arthur.cassegrain@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 26 Feb 2026 10:53:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6920

Clone all trusted-services dependencies into the TS source tree under
ts-external/ instead of ${UNPACKDIR}

This alignes the layout with devtool git-submodule handling.

NOTICE: we can't clone in external as TS already contains files there
and it would conflict.

Signed-off-by: Arthur Cassegrain <arthur.cassegrain@arm.com>
---
 .../trusted-services/trusted-services-src.inc | 74 ++++++++++---------
 .../trusted-services/trusted-services.inc     |  2 +-
 2 files changed, 40 insertions(+), 36 deletions(-)

diff --git a/meta-arm/recipes-security/trusted-services/trusted-services-=
src.inc b/meta-arm/recipes-security/trusted-services/trusted-services-src=
.inc
index 331ff062..4d71bcd7 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
@@ -2,74 +2,78 @@
=20
 LICENSE =3D "Apache-2.0 & BSD-3-Clause & BSD-2-Clause & Zlib"
=20
-SRC_URI =3D "git://git.trustedfirmware.org/TS/trusted-services.git;proto=
col=3Dhttps;branch=3Dmain;name=3Dtrusted-services;destsuffix=3Dtrusted-se=
rvices \
-"
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
-SRC_URI:append =3D "\
-    file://0001-Allow-configuring-flash-image-files-compile-time.patch \
-    file://0002-Fix-MbedTLS-3.6-and-GCC-14-compatibility.patch \
-    file://0001-Relax-pyelftools-dependency.patch \
-    file://0005-cpputest-fix-cmake-4.0-compatibility.patch \
-"
-
 # v1.2.0
 SRCREV_trusted-services =3D "0d55b4c7a8e53958271feb7341e928853b7914cf"
 LIC_FILES_CHKSUM =3D "file://${S}/license.rst;md5=3Dea160bac7f690a069c60=
8516b17997f4"
=20
-S =3D "${UNPACKDIR}/trusted-services"
 PV ?=3D "0.0+git"
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
 # DTC, tag "v1.6.1"
-SRC_URI +=3D "git://github.com/dgibson/dtc;name=3Ddtc;protocol=3Dhttps;b=
ranch=3Dmain;destsuffix=3Ddtc"
+SRC_URI_TRUSTED_SERVICES_DTC =3D "git://github.com/dgibson/dtc;protocol=3D=
https;branch=3Dmain"
 SRCREV_dtc =3D "b6910bec11614980a21e46fbccc35934b671bd81"
-LIC_FILES_CHKSUM +=3D "file://${UNPACKDIR}/dtc/README.license;md5=3Da1eb=
22e37f09df5b5511b8a278992d0e"
+LIC_FILES_CHKSUM +=3D "file://ts-external/dtc/README.license;md5=3Da1eb2=
2e37f09df5b5511b8a278992d0e"
=20
 # MbedTLS, tag "v3.6.0"
-SRC_URI +=3D "gitsm://github.com/Mbed-TLS/mbedtls;name=3Dmbedtls;protoco=
l=3Dhttps;branch=3Dmaster;destsuffix=3Dmbedtls"
+SRC_URI_TRUSTED_SERVICES_MBEDTLS =3D "gitsm://github.com/Mbed-TLS/mbedtl=
s;protocol=3Dhttps;branch=3Dmaster"
 SRCREV_mbedtls =3D "2ca6c285a0dd3f33982dd57299012dacab1ff206"
-LIC_FILES_CHKSUM +=3D "file://${UNPACKDIR}/mbedtls/LICENSE;md5=3D379d581=
9937a6c2f1ef1630d341e026d"
+LIC_FILES_CHKSUM +=3D "file://ts-external/mbedtls/LICENSE;md5=3D379d5819=
937a6c2f1ef1630d341e026d"
=20
 # Nanopb, tag "nanopb-0.4.8" plus some further fixes
-SRC_URI +=3D "git://github.com/nanopb/nanopb.git;name=3Dnanopb;protocol=3D=
https;branch=3Dmaster;destsuffix=3Dnanopb"
+SRC_URI_TRUSTED_SERVICES_NANOPB =3D "git://github.com/nanopb/nanopb.git;=
protocol=3Dhttps;branch=3Dmaster"
 SRCREV_nanopb =3D "6cfe48d6f1593f8fa5c0f90437f5e6522587745e"
-LIC_FILES_CHKSUM +=3D "file://${UNPACKDIR}/nanopb/LICENSE.txt;md5=3D9db4=
b73a55a3994384112efcdb37c01f"
+LIC_FILES_CHKSUM +=3D "file://ts-external/nanopb/LICENSE.txt;md5=3D9db4b=
73a55a3994384112efcdb37c01f"
=20
 # qcbor, tag "v1.0.0"
-SRC_URI +=3D "git://github.com/laurencelundblade/QCBOR.git;name=3Dqcbor;=
protocol=3Dhttps;branch=3Dmaster;destsuffix=3Dqcbor"
+SRC_URI_TRUSTED_SERVICES_QCBOR =3D "git://github.com/laurencelundblade/Q=
CBOR.git;protocol=3Dhttps;branch=3Dmaster"
 SRCREV_qcbor =3D "56b17bf9f74096774944bcac0829adcd887d391e"
-LIC_FILES_CHKSUM +=3D "file://${UNPACKDIR}/qcbor/README.md;md5=3De8ff2e8=
8a722cdc55eddd0bb9aeca002"
+LIC_FILES_CHKSUM +=3D "file://ts-external/qcbor/README.md;md5=3De8ff2e88=
a722cdc55eddd0bb9aeca002"
=20
 # T_Cose
-SRC_URI +=3D "git://github.com/laurencelundblade/t_cose.git;name=3Dtcose=
;protocol=3Dhttps;branch=3Dmaster;destsuffix=3Dtcose"
+SRC_URI_TRUSTED_SERVICES_TCOSE =3D "git://github.com/laurencelundblade/t=
_cose.git;protocol=3Dhttps;branch=3Dmaster"
 SRCREV_tcose =3D "fc3a4b2c7196ff582e8242de8bd4a1bc4eec577f"
-LIC_FILES_CHKSUM +=3D "file://${UNPACKDIR}/tcose/LICENSE;md5=3Db2ebdbfb8=
2602b97aa628f64cf4b65ad"
+LIC_FILES_CHKSUM +=3D "file://ts-external/tcose/LICENSE;md5=3Db2ebdbfb82=
602b97aa628f64cf4b65ad"
=20
 # CppUTest,  tag "v3.8"
-SRC_URI +=3D "git://github.com/cpputest/cpputest.git;name=3Dcpputest;pro=
tocol=3Dhttps;branch=3Dmaster;destsuffix=3Dcpputest"
+SRC_URI_TRUSTED_SERVICES_CPPUTEST =3D "git://github.com/cpputest/cpputes=
t.git;protocol=3Dhttps;branch=3Dmaster"
 SRCREV_cpputest =3D "e25097614e1c4856036366877a02346c4b36bb5b"
-LIC_FILES_CHKSUM +=3D "file://${UNPACKDIR}/cpputest/COPYING;md5=3Dce5d5f=
1fe02bcd1343ced64a06fd4177"
+LIC_FILES_CHKSUM +=3D "file://ts-external/CppUTest/COPYING;md5=3Dce5d5f1=
fe02bcd1343ced64a06fd4177"
=20
-SRCREV_FORMAT =3D "trusted-services_dtc_mbedtls_nanopb_qcbor_tcose_cpput=
est"
+SRC_URI =3D "git://git.trustedfirmware.org/TS/trusted-services.git;proto=
col=3Dhttps;branch=3Dmain;name=3Dtrusted-services;destsuffix=3Dts; \
+           ${SRC_URI_TRUSTED_SERVICES_DTC};name=3Ddtc;destsuffix=3Dts/ts=
-external/dtc \
+           ${SRC_URI_TRUSTED_SERVICES_MBEDTLS};name=3Dmbedtls;destsuffix=
=3Dts/ts-external/mbedtls \
+           ${SRC_URI_TRUSTED_SERVICES_NANOPB};name=3Dnanopb;destsuffix=3D=
ts/ts-external/nanopb \
+           ${SRC_URI_TRUSTED_SERVICES_QCBOR};name=3Dqcbor;destsuffix=3Dt=
s/ts-external/qcbor \
+           ${SRC_URI_TRUSTED_SERVICES_TCOSE};name=3Dtcose;destsuffix=3Dt=
s/ts-external/tcose \
+           ${SRC_URI_TRUSTED_SERVICES_CPPUTEST};branch=3Dmaster;name=3Dc=
pputest;destsuffix=3Dts/ts-external/CppUTest \
+           file://0001-Allow-configuring-flash-image-files-compile-time.=
patch \
+           file://0002-Fix-MbedTLS-3.6-and-GCC-14-compatibility.patch \
+           file://0001-Relax-pyelftools-dependency.patch \
+           file://0005-cpputest-fix-cmake-4.0-compatibility.patch \
+"
+S =3D        "${UNPACKDIR}/ts"
=20
 inherit apply_local_src_patches
 LOCAL_SRC_PATCHES_INPUT_DIR =3D "N/A"
=20
 do_apply_local_src_patches() {
-    apply_local_src_patches ${S}/external/qcbor ${UNPACKDIR}/qcbor
-    apply_local_src_patches ${S}/external/t_cose ${UNPACKDIR}/tcose
-    apply_local_src_patches ${S}/external/MbedTLS ${UNPACKDIR}/mbedtls
-    apply_local_src_patches ${S}/external/CppUTest ${UNPACKDIR}/cpputest
-    apply_local_src_patches ${S}/external/libfdt ${UNPACKDIR}/dtc
-    apply_local_src_patches ${S}/external/nanopb ${UNPACKDIR}/nanopb
+    apply_local_src_patches ${S}/external/qcbor ${S}/ts-external/qcbor
+    apply_local_src_patches ${S}/external/t_cose ${S}/ts-external/tcose
+    apply_local_src_patches ${S}/external/MbedTLS ${S}/ts-external/mbedt=
ls
+    apply_local_src_patches ${S}/external/CppUTest ${S}/ts-external/CppU=
Test
+    apply_local_src_patches ${S}/external/libfdt ${S}/ts-external/dtc
+    apply_local_src_patches ${S}/external/nanopb ${S}/ts-external/nanopb
 }
=20
+SRCREV_FORMAT =3D "trusted-services_dtc_mbedtls_nanopb_qcbor_tcose_cpput=
est"
+
 # Paths to dependencies required by some TS SPs/tools
-EXTRA_OECMAKE +=3D "-DDTC_SOURCE_DIR=3D${UNPACKDIR}/dtc \
-                  -DCPPUTEST_SOURCE_DIR=3D${UNPACKDIR}/cpputest \
-                  -DNANOPB_SOURCE_DIR=3D${UNPACKDIR}/nanopb \
-                  -DT_COSE_SOURCE_DIR=3D${UNPACKDIR}/tcose \
-                  -DQCBOR_SOURCE_DIR=3D${UNPACKDIR}/qcbor \
-                  -DMBEDTLS_SOURCE_DIR=3D${UNPACKDIR}/mbedtls \
+EXTRA_OECMAKE +=3D "-DDTC_SOURCE_DIR=3D${S}/ts-external/dtc \
+                  -DMBEDTLS_SOURCE_DIR=3D${S}/ts-external/mbedtls \
+                  -DNANOPB_SOURCE_DIR=3D${S}/ts-external/nanopb \
+                  -DQCBOR_SOURCE_DIR=3D${S}/ts-external/qcbor \
+                  -DT_COSE_SOURCE_DIR=3D${S}/ts-external/tcose \
+                  -DCPPUTEST_SOURCE_DIR=3D${S}/ts-external/CppUTest \
                  "
diff --git a/meta-arm/recipes-security/trusted-services/trusted-services.=
inc b/meta-arm/recipes-security/trusted-services/trusted-services.inc
index 1caeeb35..bdfccc48 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services.inc
@@ -28,7 +28,7 @@ SYSROOT_DIRS +=3D "/usr/${TS_ENV} /usr/opteesp /usr/arm=
-linux"
 # TS cmake files use find_file() to search through source code and build=
 dirs.
 # Yocto cmake class limits CMAKE_FIND_ROOT_PATH and find_file() fails.
 # Include the source tree and build dirs into searchable path.
-OECMAKE_EXTRA_ROOT_PATH =3D "${UNPACKDIR}/ ${B}"
+OECMAKE_EXTRA_ROOT_PATH =3D "${S}/ ${B}"
=20
 EXTRA_OECMAKE +=3D '-DLIBGCC_LOCATE_CFLAGS=3D"--sysroot=3D${STAGING_DIR_=
HOST}" \
                   -DCROSS_COMPILE=3D"${TARGET_PREFIX}" \
--=20
2.43.0


