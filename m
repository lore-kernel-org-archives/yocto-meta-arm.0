Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6211.1613652300027216307
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Feb 2021 04:45:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 534A3ED1
	for <meta-arm@lists.yoctoproject.org>; Thu, 18 Feb 2021 04:44:59 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F1BA63F73D
	for <meta-arm@lists.yoctoproject.org>; Thu, 18 Feb 2021 04:44:58 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/4] arm/trusted-firmware-m: upgrade to 1.2.0
Date: Thu, 18 Feb 2021 12:44:49 +0000
Message-Id: <20210218124450.3042061-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210218124450.3042061-1-ross.burton@arm.com>
References: <20210218124450.3042061-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Upgrade trusted-firmware-m to 1.2.0.  This has been tested by executing
the integrated regression tests inside qemu for the MPS2-AN521 platform.

How the build is configured has changed:
- The build type uses the standard CMAKE_BUILD_TYPE variable
- The compiler selection is done using PACKAGECONFIG to neaten the
  argument and dependency handling.

Add PACKAGECONFIGs to enable the regression tests which can be executed
inside a qemu for quick validation.

The configure stage will fetch external dependencies by default, so tell
it where we have placed the dependencies. TF-M also requires a patched
mbedcrypto (some patches are integrated into 2.25, but not all) so apply
the patches in a do_patch[postfunc].

No longer deploy files into a redundant directory.

The QA test whitelist for text relocations appears to have been fixed
upstream, so remove.

Change-Id: I11994fd0379da0e1f115ff5af0885926d2b3a055
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...e-m_1.1.bb =3D> trusted-firmware-m_1.2.0.bb} | 86 ++++++++-----------
 1 file changed, 37 insertions(+), 49 deletions(-)
 rename meta-arm/recipes-bsp/trusted-firmware-m/{trusted-firmware-m_1.1.b=
b =3D> trusted-firmware-m_1.2.0.bb} (57%)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1=
.1.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.2.0.=
bb
similarity index 57%
rename from meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.=
1.bb
rename to meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.2.=
0.bb
index 17c3f4b..3509a58 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.1.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.2.0.bb
@@ -12,23 +12,24 @@ LICENSE =3D "BSD-3-Clause & Apachev2"
=20
 LIC_FILES_CHKSUM =3D "file://license.rst;md5=3D07f368487da347f3c7bd0fc30=
85f3afa \
                     file://../tf-m-tests/license.rst;md5=3D02d06ffb8d9f0=
99ff4961c0cb0183a18 \
-                    file://../mbed-crypto/LICENSE;md5=3D302d50a6369f5f22=
efdb674db908167a \
+                    file://../mbedtls/LICENSE;md5=3D3b83ef96387f14655fc8=
54ddc3c6bd57 \
                     file://../mcuboot/LICENSE;md5=3Db6ee33f1d12a5e6ee3de=
1e82fb51eeb8"
=20
 SRC_URI  =3D "git://git.trustedfirmware.org/TF-M/trusted-firmware-m.git;=
protocol=3Dhttps;branch=3Dmaster;name=3Dtfm;destsuffix=3D${S} \
             git://git.trustedfirmware.org/TF-M/tf-m-tests.git;protocol=3D=
https;branch=3Dmaster;name=3Dtfm-tests;destsuffix=3D${S}/../tf-m-tests \
-            git://github.com/ARMmbed/mbed-crypto.git;protocol=3Dhttps;br=
anch=3Ddevelopment;name=3Dmbed-crypto;destsuffix=3D${S}/../mbed-crypto \
+            git://github.com/ARMmbed/mbedtls.git;protocol=3Dhttps;branch=
=3Ddevelopment;name=3Dmbedtls;destsuffix=3D${S}/../mbedtls \
             git://github.com/JuulLabs-OSS/mcuboot.git;protocol=3Dhttps;n=
ame=3Dmcuboot;destsuffix=3D${S}/../mcuboot \
-            file://objcopy.patch"
-
-# TF-Mv1.1
-SRCREV_tfm =3D "a6b336c1509fd5f5522450e3cec0fcd6c060f9c8"
-# mbedcrypto-3.0.1
-SRCREV_mbed-crypto =3D "1146b4e06011b69a6437e6b728f2af043a06ec19"
-# TF-Mv1.1
-SRCREV_tfm-tests =3D "5a571808e7841f15cc966661a64dd6adb3b40f6c"
-# v1.6.0
-SRCREV_mcuboot =3D "50d24a57516f558dac72bef634723b60c5cfb46b"
+            "
+
+# The required dependencies are documented in tf-m/config/config_default=
.cmake
+# TF-Mv1.2.0
+SRCREV_tfm =3D "c78be620c0fee08888956646b8f02fd03ab88567"
+# mbedtls 2.24
+SRCREV_mbedtls =3D "523f0554b6cdc7ace5d360885c3f5bbcc73ec0e8"
+# master as of 20210212
+SRCREV_tfm-tests =3D "ccda809801e529250b47c9ac470cf94daef1bb1b"
+# 1.7.0
+SRCREV_mcuboot =3D "a8e12dae381080e898cea0c6f7408009b0163f9f"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "^TF-Mv(?P<pver>\d+(\.\d+)+)$"
=20
@@ -45,6 +46,10 @@ INHIBIT_DEFAULT_DEPS =3D "1"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 DEPENDS +=3D "cmake-native \
+            python3-intelhex-native \
+            python3-jinja2-native \
+            python3-pyyaml-native \
+            python3-click-native \
             python3-cryptography-native \
             python3-pyasn1-native \
             python3-cbor-native"
@@ -52,10 +57,8 @@ DEPENDS +=3D "cmake-native \
 S =3D "${WORKDIR}/git/tfm"
 B =3D "${WORKDIR}/build"
=20
-# Build for debug (set TFA_DEBUG to 1 to activate)
+# Build for debug (set TFM_DEBUG to 1 to activate)
 TFM_DEBUG ?=3D "0"
-# Set target config
-TFM_CONFIG ?=3D "ConfigDefault.cmake"
=20
 # Platform must be set, ideally in the machine configuration.
 TFM_PLATFORM ?=3D ""
@@ -64,47 +67,41 @@ python() {
         raise bb.parse.SkipRecipe("TFM_PLATFORM needs to be set")
 }
=20
-# Uncomment, or copy these lines to your local.conf to use the Arm Clang=
 compiler
-# from meta-arm-toolchain.
-# Please make sure to check the applicable license beforehand!
-#LICENSE_FLAGS_WHITELIST =3D "armcompiler_armcompiler-native"
-#TFM_COMPILER =3D "ARMCLANG"
-# For most targets, it is required to set and export the following LICEN=
SE variables for the armcompiler:
-# ARM_TOOL_VARIANT, ARMLMD_LICENSE_FILE, LM_LICENSE_FILE
-
-# Setting GCC as the default TF-M compiler
-TFM_COMPILER ?=3D "GNUARM"
-DEPENDS +=3D "${@'armcompiler-native' if d.getVar('TFM_COMPILER', True) =
=3D=3D 'ARMCLANG' else 'gcc-arm-none-eabi-native'}"
+PACKAGECONFIG ??=3D "cc-gnuarm"
+# What compiler to use
+PACKAGECONFIG[cc-gnuarm] =3D "-DTFM_TOOLCHAIN_FILE=3Dtoolchain_GNUARM.cm=
ake,,gcc-arm-none-eabi-native"
+PACKAGECONFIG[cc-armclang] =3D "-DTFM_TOOLCHAIN_FILE=3Dtoolchain_ARMCLAN=
G.cmake,,armcompiler-native"
+# Whether to integrate the test suite
+PACKAGECONFIG[test-secure] =3D "-DTEST_S=3DON,-DTEST_S=3DOFF"
+PACKAGECONFIG[test-nonsecure] =3D "-DTEST_NS=3DON,-DTEST_NS=3DOFF"
=20
 # Add platform parameters
-EXTRA_OECMAKE +=3D "-DTARGET_PLATFORM=3D${TFM_PLATFORM}"
-
-# Add compiler parameters
-EXTRA_OECMAKE +=3D "-DCOMPILER=3D${TFM_COMPILER}"
+EXTRA_OECMAKE +=3D "-DTFM_PLATFORM=3D${TFM_PLATFORM}"
=20
 # Handle TFM_DEBUG parameter
 EXTRA_OECMAKE +=3D "${@bb.utils.contains('TFM_DEBUG', '1', '-DCMAKE_BUIL=
D_TYPE=3DDebug', '', d)}"
-EXTRA_OECMAKE +=3D "-DPROJ_CONFIG=3D${S}/configs/${TFM_CONFIG}"
=20
 # Verbose builds
 EXTRA_OECMAKE +=3D "-DCMAKE_VERBOSE_MAKEFILE:BOOL=3DON"
=20
+EXTRA_OECMAKE +=3D "-DMBEDCRYPTO_PATH=3D${S}/../mbedtls -DTFM_TEST_REPO_=
PATH=3D${S}/../tf-m-tests -DMCUBOOT_PATH=3D${S}/../mcuboot"
+
 # Let the Makefile handle setting up the CFLAGS and LDFLAGS as it is a s=
tandalone application
 CFLAGS[unexport] =3D "1"
 LDFLAGS[unexport] =3D "1"
 AS[unexport] =3D "1"
 LD[unexport] =3D "1"
=20
-do_configure[prefuncs] +=3D "do_check_config"
-do_check_config() {
-    if [ ! -f "${S}/configs/${TFM_CONFIG}" ]; then
-        bbfatal "Couldn't find config file '${TFM_CONFIG}' in '${S}/conf=
igs/'"
-    fi
+# TF-M ships patches that it needs applied to mbedcrypto, so apply them
+# as part of do_patch.
+apply_local_patches() {
+    cat ${S}/lib/ext/mbedcrypto/*.patch | patch -p1 -d ${S}/../mbedtls
 }
+do_patch[postfuncs] +=3D "apply_local_patches"
=20
 do_configure[cleandirs] =3D "${B}"
 do_configure() {
-    cmake -G"Unix Makefiles" ${S} ${EXTRA_OECMAKE}
+    cmake -G"Unix Makefiles" -S ${S} -B ${B} ${EXTRA_OECMAKE}
 }
=20
 # Invoke install here as there's no point in splitting compile from inst=
all: the
@@ -112,26 +109,17 @@ do_configure() {
 # rebuild. It also overrides the install prefix to be in the build tree,=
 so you
 # can't use the usual install prefix variables.
 do_compile() {
-    cmake --build ./ -- install
+    cmake --build ${B} -- install
 }
=20
 do_install() {
-    if [ ! -d "${B}/install/outputs" ]
-    then
-        bbfatal "Output not found in '${B}/install/outputs'!"
-    fi
-
+    # TODO install headers and static libraries when we know how they're=
 used
     install -d -m 755 ${D}/firmware
-    cd ${B}/install/outputs
-    for dir in *;do
-        install -D -p -m 0644 $dir/* -t ${D}/firmware/$dir/
-    done
+    install -m 0644 ${B}/bin/* ${D}/firmware/
 }
=20
 FILES_${PN} =3D "/firmware"
 SYSROOT_DIRS +=3D "/firmware"
-# Skip QA check for relocations in .text of elf binaries
-INSANE_SKIP_${PN} =3D "textrel"
=20
 addtask deploy after do_install
 do_deploy() {
--=20
2.25.1

