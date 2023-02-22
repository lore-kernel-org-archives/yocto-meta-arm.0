Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A63DC64EC4
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 12:05:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7013.1677067509170243594
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 Feb 2023 04:05:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BEC54139F;
	Wed, 22 Feb 2023 04:05:51 -0800 (PST)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E8013F881;
	Wed, 22 Feb 2023 04:05:08 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 4/6] arm/trusted-firmware-m: Create inc file for common config
Date: Wed, 22 Feb 2023 12:04:39 +0000
Message-Id: <20230222120441.2684534-4-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222120441.2684534-1-peter.hoyes@arm.com>
References: <20230222120441.2684534-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 22 Feb 2023 12:05:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4440

From: Peter Hoyes <Peter.Hoyes@arm.com>

To simplify adding support for new versions of TF-M in the future,
create a common .inc file with the non-version-specific configuration.

Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
---
 .../trusted-firmware-m/trusted-firmware-m.inc | 118 +++++++++++++++++
 .../trusted-firmware-m_1.7.0.bb               | 120 +-----------------
 2 files changed, 119 insertions(+), 119 deletions(-)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmw=
are-m.inc

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
new file mode 100644
index 00000000..9062df8c
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
@@ -0,0 +1,118 @@
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
+SRC_URI +=3D "file://rwx.patch"
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
+# See tools/requirements.txt for Python dependencies
+DEPENDS +=3D "cmake-native \
+            ninja-native \
+            gcc-arm-none-eabi-native \
+            python3-cbor2-native \
+            python3-click-native \
+            python3-cryptography-native \
+            python3-pyasn1-native \
+            python3-imgtool-native \
+            python3-jinja2-native \
+            python3-pyyaml-native \
+            python3-pyhsslms-native \
+            python3-ecdsa-native \
+            python3-kconfiglib-native \
+"
+
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
PATH=3D${S}/../tf-m-tests -DMCUBOOT_PATH=3D${S}/../mcuboot -DQCBOR_PATH=3D=
${S}/../qcbor"
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
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1=
.7.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.7.=
0.bb
index 799c5d56..32e6ed34 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.7.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.7.0.bb
@@ -1,120 +1,2 @@
-# SPDX-License-Identifier: MIT
-#
-# Copyright (c) 2020 Arm Limited
-#
-
-SUMMARY =3D "Trusted Firmware for Cortex-M"
-DESCRIPTION =3D "Trusted Firmware-M"
-HOMEPAGE =3D "https://git.trustedfirmware.org/trusted-firmware-m.git"
-PROVIDES =3D "virtual/trusted-firmware-m"
-
 require recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.0-src.inc
-
-SRC_URI +=3D "file://rwx.patch"
-
-UPSTREAM_CHECK_GITTAGREGEX =3D "^TF-Mv(?P<pver>\d+(\.\d+)+)$"
-
-# Note to future readers of this recipe: until the CMakeLists don't abus=
e
-# installation (see do_install) there is no point in trying to inherit
-# cmake here. You can easily short-circuit the toolchain but the install
-# is so convoluted there's no gain.
-
-inherit python3native deploy
-
-# Baremetal and we bring a compiler below
-INHIBIT_DEFAULT_DEPS =3D "1"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-# See tools/requirements.txt for Python dependencies
-DEPENDS +=3D "cmake-native \
-            ninja-native \
-            gcc-arm-none-eabi-native \
-            python3-cbor2-native \
-            python3-click-native \
-            python3-cryptography-native \
-            python3-pyasn1-native \
-            python3-imgtool-native \
-            python3-jinja2-native \
-            python3-pyyaml-native \
-            python3-pyhsslms-native \
-            python3-ecdsa-native \
-            python3-kconfiglib-native \
-"
-
-B =3D "${WORKDIR}/build"
-
-# Build for debug (set TFM_DEBUG to 1 to activate)
-TFM_DEBUG ?=3D "0"
-
-# Platform must be set, ideally in the machine configuration.
-TFM_PLATFORM ?=3D ""
-python() {
-    if not d.getVar("TFM_PLATFORM"):
-        raise bb.parse.SkipRecipe("TFM_PLATFORM needs to be set")
-}
-
-PACKAGECONFIG ??=3D ""
-# Whether to integrate the test suite
-PACKAGECONFIG[test-secure] =3D "-DTEST_S=3DON,-DTEST_S=3DOFF"
-PACKAGECONFIG[test-nonsecure] =3D "-DTEST_NS=3DON,-DTEST_NS=3DOFF"
-
-# Currently we only support using the Arm binary GCC
-EXTRA_OECMAKE +=3D "-DTFM_TOOLCHAIN_FILE=3D${S}/toolchain_GNUARM.cmake"
-
-# Don't let FetchContent download more sources during do_configure
-EXTRA_OECMAKE +=3D "-DFETCHCONTENT_FULLY_DISCONNECTED=3DON"
-
-# Add platform parameters
-EXTRA_OECMAKE +=3D "-DTFM_PLATFORM=3D${TFM_PLATFORM}"
-
-# Handle TFM_DEBUG parameter
-EXTRA_OECMAKE +=3D "${@bb.utils.contains('TFM_DEBUG', '1', '-DCMAKE_BUIL=
D_TYPE=3DDebug', '-DCMAKE_BUILD_TYPE=3DRelease', d)}"
-
-# Verbose builds
-EXTRA_OECMAKE +=3D "-DCMAKE_VERBOSE_MAKEFILE:BOOL=3DON"
-
-EXTRA_OECMAKE +=3D "-DMBEDCRYPTO_PATH=3D${S}/../mbedtls -DTFM_TEST_REPO_=
PATH=3D${S}/../tf-m-tests -DMCUBOOT_PATH=3D${S}/../mcuboot -DQCBOR_PATH=3D=
${S}/../qcbor"
-
-export CMAKE_BUILD_PARALLEL_LEVEL =3D "${@oe.utils.parallel_make(d, Fals=
e)}"
-
-# Let the Makefile handle setting up the CFLAGS and LDFLAGS as it is a s=
tandalone application
-CFLAGS[unexport] =3D "1"
-LDFLAGS[unexport] =3D "1"
-AS[unexport] =3D "1"
-LD[unexport] =3D "1"
-
-# python3-cryptography needs the legacy provider, so set OPENSSL_MODULES=
 to the
-# right path until this is relocated automatically.
-export OPENSSL_MODULES=3D"${STAGING_LIBDIR_NATIVE}/ossl-modules"
-
-do_configure[cleandirs] =3D "${B}"
-do_configure() {
-    cmake -GNinja -S ${S} -B ${B} ${EXTRA_OECMAKE} ${PACKAGECONFIG_CONFA=
RGS}
-}
-
-# Invoke install here as there's no point in splitting compile from inst=
all: the
-# first thing the build does is 'install' inside the build tree thus cau=
sing a
-# rebuild. It also overrides the install prefix to be in the build tree,=
 so you
-# can't use the usual install prefix variables.
-do_compile() {
-    cmake --build ${B} -- install
-}
-do_compile[progress] =3D "outof:^\[(\d+)/(\d+)\]\s+"
-
-do_install() {
-    # TODO install headers and static libraries when we know how they're=
 used
-    install -d -m 755 ${D}/firmware
-    install -m 0644 ${B}/bin/* ${D}/firmware/
-}
-
-FILES:${PN} =3D "/firmware"
-SYSROOT_DIRS +=3D "/firmware"
-
-addtask deploy after do_install
-do_deploy() {
-    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
-}
-
-# Build paths are currently embedded
-INSANE_SKIP:${PN} +=3D "buildpaths"
+require recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
--=20
2.34.1


