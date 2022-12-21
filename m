Return-Path: <mohamed.omarasaker@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43D46C46467
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 12:33:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.17552.1671625996881470165
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Dec 2022 04:33:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: mohamed.omarasaker@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 815832F4;
	Wed, 21 Dec 2022 04:33:57 -0800 (PST)
Received: from e126544.arm.com (unknown [10.57.74.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D81963F703;
	Wed, 21 Dec 2022 04:33:14 -0800 (PST)
From: mohamed.omarasaker@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
Subject: [PATCH 2/5] arm-bsp/trusted-firmware-m: Bump TFM to v1.7
Date: Wed, 21 Dec 2022 12:32:33 +0000
Message-Id: <20221221123236.342413-3-mohamed.omarasaker@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221221123236.342413-1-mohamed.omarasaker@arm.com>
References: <20221221123236.342413-1-mohamed.omarasaker@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 21 Dec 2022 12:33:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4211

From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>

Create tfm recipe for v1.7.x

Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
---
 .../trusted-firmware-m_1.7.0.bb               | 138 ++++++++++++++++++
 1 file changed, 138 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmw=
are-m_1.7.0.bb

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1=
.7.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.7.=
0.bb
new file mode 100644
index 00000000..f863dc71
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.7.0.bb
@@ -0,0 +1,138 @@
+# SPDX-License-Identifier: MIT
+#
+# Copyright (c) 2020 Arm Limited
+#
+
+SUMMARY =3D "Trusted Firmware for Cortex-M"
+DESCRIPTION =3D "Trusted Firmware-M"
+HOMEPAGE =3D "https://git.trustedfirmware.org/trusted-firmware-m.git"
+PROVIDES =3D "virtual/trusted-firmware-m"
+
+LICENSE =3D "BSD-3-Clause & Apache-2.0"
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
+SRC_URI  =3D "git://git.trustedfirmware.org/TF-M/trusted-firmware-m.git;=
protocol=3Dhttps;branch=3D${SRCBRANCH_tfm};name=3Dtfm;destsuffix=3Dgit/tf=
m \
+            git://git.trustedfirmware.org/TF-M/tf-m-tests.git;protocol=3D=
https;branch=3D${SRCBRANCH_tfm-tests};name=3Dtfm-tests;destsuffix=3Dgit/t=
f-m-tests \
+            git://github.com/ARMmbed/mbedtls.git;protocol=3Dhttps;branch=
=3D${SRCBRANCH_mbedtls};name=3Dmbedtls;destsuffix=3Dgit/mbedtls \
+            git://github.com/mcu-tools/mcuboot.git;protocol=3Dhttps;bran=
ch=3D${SRCBRANCH_mcuboot};name=3Dmcuboot;destsuffix=3Dgit/mcuboot \
+            "
+
+# The required dependencies are documented in tf-m/config/config_default=
.cmake
+# TF-Mv1.7.0
+SRCBRANCH_tfm ?=3D "release/1.7.x"
+SRCREV_tfm =3D "b725a1346cdb9ec75b1adcdc4c84705881e8fd4e"
+# mbedtls-3.2.0
+SRCBRANCH_mbedtls ?=3D "master"
+SRCREV_mbedtls =3D "869298bffeea13b205343361b7a7daf2b210e33d"
+# TF-Mv1.6.0
+SRCBRANCH_tfm-tests ?=3D "release/1.7.x"
+SRCREV_tfm-tests =3D "4972e8df3fcbd386a5b0c18613d8a803f4dda082"
+# v1.9.0
+SRCBRANCH_mcuboot ?=3D "main"
+SRCREV_mcuboot =3D "c657cbea75f2bb1faf1fceacf972a0537a8d26dd"
+
+UPSTREAM_CHECK_GITTAGREGEX =3D "^TF-Mv(?P<pver>\d+(\.\d+)+)$"
+
+# Note to future readers of this recipe: until the CMakeLists don't abus=
e
+# installation (see do_install) there is no point in trying to inherit
+# cmake here. You can easily short-circuit the toolchain but the install
+# is so convoluted there's no gain.
+
+inherit python3native deploy
+
+# Baremetal and we bring a compiler below
+INHIBIT_DEFAULT_DEPS =3D "1"
+
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+
+DEPENDS +=3D "cmake-native \
+            ninja-native \
+            gcc-arm-none-eabi-native \
+            python3-intelhex-native \
+            python3-jinja2-native \
+            python3-pyyaml-native \
+            python3-click-native \
+            python3-cryptography-native \
+            python3-cbor2-native"
+
+S =3D "${WORKDIR}/git/tfm"
+B =3D "${WORKDIR}/build"
+
+# Build for debug (set TFM_DEBUG to 1 to activate)
+TFM_DEBUG ?=3D "0"
+
+# Platform must be set, ideally in the machine configuration.
+TFM_PLATFORM ?=3D ""
+python() {
+    if not d.getVar("TFM_PLATFORM"):
+        raise bb.parse.SkipRecipe("TFM_PLATFORM needs to be set")
+}
+
+PACKAGECONFIG ??=3D ""
+# Whether to integrate the test suite
+PACKAGECONFIG[test-secure] =3D "-DTEST_S=3DON,-DTEST_S=3DOFF"
+PACKAGECONFIG[test-nonsecure] =3D "-DTEST_NS=3DON,-DTEST_NS=3DOFF"
+
+# Currently we only support using the Arm binary GCC
+EXTRA_OECMAKE +=3D "-DTFM_TOOLCHAIN_FILE=3D${S}/toolchain_GNUARM.cmake"
+
+# Don't let FetchContent download more sources during do_configure
+EXTRA_OECMAKE +=3D "-DFETCHCONTENT_FULLY_DISCONNECTED=3DON"
+
+# Add platform parameters
+EXTRA_OECMAKE +=3D "-DTFM_PLATFORM=3D${TFM_PLATFORM}"
+
+# Handle TFM_DEBUG parameter
+EXTRA_OECMAKE +=3D "${@bb.utils.contains('TFM_DEBUG', '1', '-DCMAKE_BUIL=
D_TYPE=3DDebug', '-DCMAKE_BUILD_TYPE=3DRelease', d)}"
+
+# Verbose builds
+EXTRA_OECMAKE +=3D "-DCMAKE_VERBOSE_MAKEFILE:BOOL=3DON"
+
+EXTRA_OECMAKE +=3D "-DMBEDCRYPTO_PATH=3D${S}/../mbedtls -DTFM_TEST_REPO_=
PATH=3D${S}/../tf-m-tests -DMCUBOOT_PATH=3D${S}/../mcuboot"
+
+export CMAKE_BUILD_PARALLEL_LEVEL =3D "${@oe.utils.parallel_make(d, Fals=
e)}"
+
+# Let the Makefile handle setting up the CFLAGS and LDFLAGS as it is a s=
tandalone application
+CFLAGS[unexport] =3D "1"
+LDFLAGS[unexport] =3D "1"
+AS[unexport] =3D "1"
+LD[unexport] =3D "1"
+
+# python3-cryptography needs the legacy provider, so set OPENSSL_MODULES=
 to the
+# right path until this is relocated automatically.
+export OPENSSL_MODULES=3D"${STAGING_LIBDIR_NATIVE}/ossl-modules"
+
+do_configure[cleandirs] =3D "${B}"
+do_configure() {
+    cmake -GNinja -S ${S} -B ${B} ${EXTRA_OECMAKE} ${PACKAGECONFIG_CONFA=
RGS}
+}
+
+# Invoke install here as there's no point in splitting compile from inst=
all: the
+# first thing the build does is 'install' inside the build tree thus cau=
sing a
+# rebuild. It also overrides the install prefix to be in the build tree,=
 so you
+# can't use the usual install prefix variables.
+do_compile() {
+    cmake --build ${B} -- install
+}
+do_compile[progress] =3D "outof:^\[(\d+)/(\d+)\]\s+"
+
+do_install() {
+    # TODO install headers and static libraries when we know how they're=
 used
+    install -d -m 755 ${D}/firmware
+    install -m 0644 ${B}/bin/* ${D}/firmware/
+}
+
+FILES:${PN} =3D "/firmware"
+SYSROOT_DIRS +=3D "/firmware"
+
+addtask deploy after do_install
+do_deploy() {
+    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
+}
+
+# Build paths are currently embedded
+INSANE_SKIP:${PN} +=3D "buildpaths"
--=20
2.25.1


