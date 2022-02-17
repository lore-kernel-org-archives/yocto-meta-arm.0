Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FCBBC4332F
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 15:57:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1591.1645113459415344915
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Feb 2022 07:57:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04E92113E;
	Thu, 17 Feb 2022 07:57:39 -0800 (PST)
Received: from e126835.arm.com (unknown [10.57.40.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B142B3F718;
	Thu, 17 Feb 2022 07:57:37 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	jon.mason@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 1/3] arm-bsp/security: drop psa-arch-tests recipe
Date: Thu, 17 Feb 2022 15:57:25 +0000
Message-Id: <20220217155727.2568107-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220217155727.2568107-1-emekcan.aras@arm.com>
References: <20220217155727.2568107-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 17 Feb 2022 15:57:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3008

From: Vishnu Banavath <vishnu.banavath@arm.com>

This change is to build and install psa-arch-tests using
trusted-services code and drop psa-arch-tests recipe.

Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
---
 .../psa-arch-tests-corstone1000.inc           |  45 ----
 ...arch-test-sysroot_compiler_flags_fix.patch |  68 -----
 ...rch-test-Fixing-psa-arch-tests-cmake.patch |  49 ----
 ...0003-corstone1000-port-crypto-config.patch | 237 ------------------
 .../psa-arch-tests_%.bbappend                 |   6 -
 .../trusted-services/ts-corstone1000.inc      |  39 ++-
 .../trusted-services/psa-arch-tests_git.bb    |  26 --
 .../trusted-services/secure-partitions_git.bb |   2 +-
 8 files changed, 39 insertions(+), 433 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/psa-ar=
ch-tests-corstone1000.inc
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/psa-ar=
ch-tests/corstone1000/0001-psa-arch-test-sysroot_compiler_flags_fix.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/psa-ar=
ch-tests/corstone1000/0002-arm-bsp-psa-arch-test-Fixing-psa-arch-tests-cm=
ake.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/psa-ar=
ch-tests/corstone1000/0003-corstone1000-port-crypto-config.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/psa-ar=
ch-tests_%.bbappend
 delete mode 100644 meta-arm/recipes-security/trusted-services/psa-arch-t=
ests_git.bb

diff --git a/meta-arm-bsp/recipes-security/trusted-services/psa-arch-test=
s-corstone1000.inc b/meta-arm-bsp/recipes-security/trusted-services/psa-a=
rch-tests-corstone1000.inc
deleted file mode 100644
index da619d45..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/psa-arch-tests-corst=
one1000.inc
+++ /dev/null
@@ -1,45 +0,0 @@
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/psa-arch-tests/corstone1000:"
-
-DEPENDS +=3D "cmake-native"
-
-export CMAKE_BUILD_PARALLEL_LEVEL
-CMAKE_BUILD_PARALLEL_LEVEL =3D "${@oe.utils.parallel_make(d, True)}"
-
-COMPATIBLE_MACHINE =3D "corstone1000"
-
-SRC_URI:append =3D "\
-    file://0001-psa-arch-test-sysroot_compiler_flags_fix.patch \
-    file://0002-arm-bsp-psa-arch-test-Fixing-psa-arch-tests-cmake.patch =
\
-    file://0003-corstone1000-port-crypto-config.patch;patchdir=3D../psa-=
arch-tests \
-    "
-
-FILES:${PN} +=3D "${libdir}/libts.so*  ${libdir}/deployments  ${bindir}/=
psa-*"
-FILES:${PN}-dev =3D "${includedir}/deployments/psa-api-test/"
-
-INSANE_SKIP:${PN} +=3D "rpaths"
-
-do_configure() {
-    for PSA_API_TEST in ${PSA_API_TESTS}; do
-        cmake \
-        -DSYSROOT_YOCTO=3D${RECIPE_SYSROOT} \
-        -S ${S}/$PSA_API_TEST -B "${B}/$PSA_API_TEST"
-    done
-}
-
-do_compile() {
-    for PSA_API_TEST in ${PSA_API_TESTS}; do
-        cmake --build "${B}/$PSA_API_TEST"
-    done
-}
-
-do_install() {
-    for PSA_API_TEST in ${PSA_API_TESTS}; do
-        install -d -m 0755 ${D}${libdir}/${PSA_API_TEST}
-        install -d -m 0755 ${D}${includedir}/${PSA_API_TEST}
-        install -m 0755 ${B}/${PSA_API_TEST}/libts_install/arm-linux/lib=
/*.so* ${D}${libdir}
-	install -d -m 0755 ${B}/${PSA_API_TEST}/libts_install/arm-linux/include=
 ${D}${includedir}/${PSA_API_TEST}
-	psafile_fullpath=3D`ls ${B}/${PSA_API_TEST}/psa-*`
-	psafile_filename=3D"`basename -s .bin ${psafile_fullpath}`"
-        install -D -p -m 0755 ${psafile_fullpath} ${D}/${bindir}/${psafi=
le_filename}
-    done
-}
diff --git a/meta-arm-bsp/recipes-security/trusted-services/psa-arch-test=
s/corstone1000/0001-psa-arch-test-sysroot_compiler_flags_fix.patch b/meta=
-arm-bsp/recipes-security/trusted-services/psa-arch-tests/corstone1000/00=
01-psa-arch-test-sysroot_compiler_flags_fix.patch
deleted file mode 100644
index e9ce0c5c..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/psa-arch-tests/corst=
one1000/0001-psa-arch-test-sysroot_compiler_flags_fix.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-Upstream-Status: Inappropriate [Not for upstreaming in the original repo=
]
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-
-From 340ef6788d2803543b15235bf16a79cbc02235bd Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <Emekcan.Aras@arm.com>
-Date: Mon, 6 Dec 2021 10:21:59 +0000
-
-[PATCH] arm-bsp/psa-arch-test: Integrate psa-arch-test
-
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
----
- deployments/libts/libts-import.cmake         | 4 +++-
- external/MbedTLS/MbedTLS.cmake               | 1 +
- external/psa_arch_tests/psa_arch_tests.cmake | 1 +
- 3 files changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/deployments/libts/libts-import.cmake b/deployments/libts/li=
bts-import.cmake
-index 792ba86..e3793e8 100644
---- a/deployments/libts/libts-import.cmake
-+++ b/deployments/libts/libts-import.cmake
-@@ -19,7 +19,6 @@ if(NOT DEFINED PROCESSOR_COUNT)
- 	ProcessorCount(PROCESSOR_COUNT)
- 	set(PROCESSOR_COUNT ${PROCESSOR_COUNT} CACHE STRING "Number of cores t=
o use for parallel builds.")
- endif()
--
- set(LIBTS_INSTALL_PATH "${CMAKE_CURRENT_BINARY_DIR}/libts_install" CACH=
E PATH "libts installation directory")
- set(LIBTS_PACKAGE_PATH "${LIBTS_INSTALL_PATH}/lib/cmake" CACHE PATH "li=
bts CMake package directory")
- set(LIBTS_SOURCE_DIR "${TS_ROOT}/deployments/libts/${TS_ENV}" CACHE PAT=
H "libts source directory")
-@@ -27,9 +26,12 @@ set(LIBTS_BINARY_DIR "${CMAKE_CURRENT_BINARY_DIR}/_de=
ps/libts-build" CACHE PATH
-=20
- file(MAKE_DIRECTORY ${LIBTS_BINARY_DIR})
-=20
-+set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} --sysroot=3D${SYSROOT_YOCTO}")
-+
- #Configure the library
- execute_process(COMMAND
- 	${CMAKE_COMMAND}
-+		-DCMAKE_SYSROOT=3D${SYSROOT_YOCTO}
- 		-DCMAKE_INSTALL_PREFIX=3D${LIBTS_INSTALL_PATH}
- 		-GUnix\ Makefiles
- 		${LIBTS_SOURCE_DIR}
-diff --git a/external/MbedTLS/MbedTLS.cmake b/external/MbedTLS/MbedTLS.c=
make
-index 3cbaed1..8c53f88 100644
---- a/external/MbedTLS/MbedTLS.cmake
-+++ b/external/MbedTLS/MbedTLS.cmake
-@@ -59,6 +59,7 @@ set(PSA_CRYPTO_API_INCLUDE "${MBEDTLS_INSTALL_PATH}/in=
clude" CACHE STRING "PSA C
- #Configure the library
- execute_process(COMMAND
- 	${CMAKE_COMMAND}
-+		-DCMAKE_SYSROOT=3D${SYSROOT_YOCTO}
- 		-DENABLE_PROGRAMS=3DOFF
- 		-DENABLE_TESTING=3DOFF
- 		-DUNSAFE_BUILD=3DON
-diff --git a/external/psa_arch_tests/psa_arch_tests.cmake b/external/psa=
_arch_tests/psa_arch_tests.cmake
-index e6ab73f..af00cfc 100644
---- a/external/psa_arch_tests/psa_arch_tests.cmake
-+++ b/external/psa_arch_tests/psa_arch_tests.cmake
-@@ -52,6 +52,7 @@ string(REPLACE ";" " " PSA_ARCH_TEST_EXTERNAL_DEFS "${=
PSA_ARCH_TEST_EXTERNAL_DEF
- # Configure the psa-arch-test library
- execute_process(COMMAND
- 	${CMAKE_COMMAND}
-+			-DCMAKE_SYSROOT=3D${SYSROOT_YOCTO}
- 			-DTOOLCHAIN=3DINHERIT
- 			-DCMAKE_TOOLCHAIN_FILE=3D${TS_EXTERNAL_LIB_TOOLCHAIN_FILE}
- 			-DPSA_INCLUDE_PATHS=3D${PSA_ARCH_TESTS_EXTERNAL_INCLUDE_PATHS}
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/psa-arch-test=
s/corstone1000/0002-arm-bsp-psa-arch-test-Fixing-psa-arch-tests-cmake.pat=
ch b/meta-arm-bsp/recipes-security/trusted-services/psa-arch-tests/corsto=
ne1000/0002-arm-bsp-psa-arch-test-Fixing-psa-arch-tests-cmake.patch
deleted file mode 100644
index 24b48e4c..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/psa-arch-tests/corst=
one1000/0002-arm-bsp-psa-arch-test-Fixing-psa-arch-tests-cmake.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-
-From 4a1f2fd2c3c3f8e00364d3b1a8c76a61e41a483f Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <Emekcan.Aras@arm.com>
-Date: Sat, 11 Dec 2021 09:32:44 +0000
-Subject: [PATCH] arm-bsp/psa-arch-test: Fixing psa-arch-tests cmake
-
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
----
- external/psa_arch_tests/psa_arch_tests.cmake | 9 +++++----
- 1 file changed, 5 insertions(+), 4 deletions(-)
-
-diff --git a/external/psa_arch_tests/psa_arch_tests.cmake b/external/psa=
_arch_tests/psa_arch_tests.cmake
-index af00cfc..e4b4f6b 100644
---- a/external/psa_arch_tests/psa_arch_tests.cmake
-+++ b/external/psa_arch_tests/psa_arch_tests.cmake
-@@ -25,15 +25,13 @@ find_program(GIT_COMMAND "git")
- if (NOT GIT_COMMAND)
- 	message(FATAL_ERROR "Please install git")
- endif()
--
-+if ("${PSA_ARCH_TESTS_PATH}" STREQUAL "DOWNLOAD")
- # Fetching psa-arch-tests
- FetchContent_Declare(
- 	psa-arch-tests
- 	GIT_REPOSITORY ${PSA_ARCH_TESTS_URL}
- 	GIT_TAG ${PSA_ARCH_TESTS_REFSPEC}
- 	GIT_SHALLOW TRUE
--	PATCH_COMMAND git stash
--		COMMAND git apply ${CMAKE_CURRENT_LIST_DIR}/modify_attest_config.patc=
h
- )
-=20
- # FetchContent_GetProperties exports psa-arch-tests_SOURCE_DIR and psa-=
arch-tests_BINARY_DIR variables
-@@ -42,7 +40,10 @@ if(NOT psa-arch-tests_POPULATED)
- 	message(STATUS "Fetching psa-arch-tests")
- 	FetchContent_Populate(psa-arch-tests)
- endif()
--
-+else()
-+    set(psa-arch-tests_SOURCE_DIR "${TS_ROOT}/../psa-arch-tests")
-+    set(psa-arch-tests_BINARY_DIR "${CMAKE_CURRENT_BINARY_DIR}")
-+endif()
- # Ensure list of include paths is separated correctly
- string(REPLACE ";" "\\;" PSA_ARCH_TESTS_EXTERNAL_INCLUDE_PATHS "${PSA_A=
RCH_TESTS_EXTERNAL_INCLUDE_PATHS}")
-=20
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/psa-arch-test=
s/corstone1000/0003-corstone1000-port-crypto-config.patch b/meta-arm-bsp/=
recipes-security/trusted-services/psa-arch-tests/corstone1000/0003-corsto=
ne1000-port-crypto-config.patch
deleted file mode 100644
index 1d7b8ae9..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/psa-arch-tests/corst=
one1000/0003-corstone1000-port-crypto-config.patch
+++ /dev/null
@@ -1,237 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-
-From f86f5b42d853d2a65f6753362361bbb95aac1800 Mon Sep 17 00:00:00 2001
-From: Satish Kumar <satish.kumar01@arm.com>
-Date: Sat, 11 Dec 2021 11:06:57 +0000
-Subject: [PATCH] corstone1000: port crypto config
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-
-Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
-
-%% original patch: 0003-corstone1000-port-crypto-config.patch
----
- .../nspe/pal_crypto_config.h                  | 83 +++++++++++++++----
- 1 file changed, 66 insertions(+), 17 deletions(-)
-
-diff --git a/api-tests/platform/targets/tgt_dev_apis_linux/nspe/pal_cryp=
to_config.h b/api-tests/platform/targets/tgt_dev_apis_linux/nspe/pal_cryp=
to_config.h
-index 844cd2e..c936bdd 100755
---- a/api-tests/platform/targets/tgt_dev_apis_linux/nspe/pal_crypto_conf=
ig.h
-+++ b/api-tests/platform/targets/tgt_dev_apis_linux/nspe/pal_crypto_conf=
ig.h
-@@ -1,5 +1,5 @@
- /** @file
-- * Copyright (c) 2021, Arm Limited or its affiliates. All rights reserv=
ed.
-+ * Copyright (c) 2019-2020, Arm Limited or its affiliates. All rights r=
eserved.
-  * SPDX-License-Identifier : Apache-2.0
-  *
-  * Licensed under the Apache License, Version 2.0 (the "License");
-@@ -34,10 +34,14 @@
-  *
-  * Comment macros to disable the types
-  */
-+#ifndef TF_M_PROFILE_SMALL
-+#ifndef TF_M_PROFILE_MEDIUM
- #define ARCH_TEST_RSA
- #define ARCH_TEST_RSA_1024
- #define ARCH_TEST_RSA_2048
- #define ARCH_TEST_RSA_3072
-+#endif
-+#endif
-=20
- /**
-  * \def  ARCH_TEST_ECC
-@@ -50,11 +54,17 @@
-  * Requires: ARCH_TEST_ECC
-  * Comment macros to disable the curve
-  */
-+#ifndef TF_M_PROFILE_SMALL
- #define ARCH_TEST_ECC
- #define ARCH_TEST_ECC_CURVE_SECP192R1
-+#ifndef TF_M_PROFILE_MEDIUM
- #define ARCH_TEST_ECC_CURVE_SECP224R1
-+#endif
- #define ARCH_TEST_ECC_CURVE_SECP256R1
-+#ifndef TF_M_PROFILE_MEDIUM
- #define ARCH_TEST_ECC_CURVE_SECP384R1
-+#endif
-+#endif
-=20
- /**
-  * \def ARCH_TEST_AES
-@@ -78,10 +88,10 @@
-  *
-  * Comment macros to disable the types
-  */
--#define ARCH_TEST_DES
--#define ARCH_TEST_DES_1KEY
--#define ARCH_TEST_DES_2KEY
--#define ARCH_TEST_DES_3KEY
-+//#define ARCH_TEST_DES
-+//#define ARCH_TEST_DES_1KEY
-+//#define ARCH_TEST_DES_2KEY
-+//#define ARCH_TEST_DES_3KEY
-=20
- /**
-  * \def  ARCH_TEST_RAW
-@@ -104,7 +114,7 @@
-  *
-  * Enable the ARC4 key type.
-  */
--#define ARCH_TEST_ARC4
-+//#define ARCH_TEST_ARC4
-=20
- /**
-  * \def ARCH_TEST_CIPHER_MODE_CTR
-@@ -113,7 +123,11 @@
-  *
-  * Requires: ARCH_TEST_CIPHER
-  */
-+#ifndef TF_M_PROFILE_SMALL
-+#ifndef TF_M_PROFILE_MEDIUM
- #define ARCH_TEST_CIPHER_MODE_CTR
-+#endif
-+#endif
-=20
- /**
-  * \def ARCH_TEST_CIPHER_MODE_CFB
-@@ -138,7 +152,11 @@
-  *
-  * Requires: ARCH_TEST_CIPHER, ARCH_TEST_AES, ARCH_TEST_CIPHER_MODE_CTR
-  */
-+#ifndef TF_M_PROFILE_SMALL
-+#ifndef TF_M_PROFILE_MEDIUM
- #define ARCH_TEST_CTR_AES
-+#endif
-+#endif
-=20
- /**
-  * \def ARCH_TEST_CBC_AES
-@@ -157,7 +175,11 @@
-  *
-  * Comment macros to disable the types
-  */
-+#ifndef TF_M_PROFILE_SMALL
-+#ifndef TF_M_PROFILE_MEDIUM
- #define ARCH_TEST_CBC_NO_PADDING
-+#endif
-+#endif
-=20
- /**
-  * \def ARCH_TEST_CFB_AES
-@@ -177,11 +199,15 @@
-  *
-  * Comment macros to disable the types
-  */
-+#ifndef TF_M_PROFILE_SMALL
-+#ifndef TF_M_PROFILE_MEDIUM
- #define ARCH_TEST_PKCS1V15
- #define ARCH_TEST_RSA_PKCS1V15_SIGN
- #define ARCH_TEST_RSA_PKCS1V15_SIGN_RAW
- #define ARCH_TEST_RSA_PKCS1V15_CRYPT
- #define ARCH_TEST_RSA_OAEP
-+#endif
-+#endif
-=20
- /**
-  * \def ARCH_TEST_CBC_PKCS7
-@@ -190,7 +216,11 @@
-  *
-  * Comment macros to disable the types
-  */
-+#ifndef TF_M_PROFILE_SMALL
-+#ifndef TF_M_PROFILE_MEDIUM
- #define ARCH_TEST_CBC_PKCS7
-+#endif
-+#endif
-=20
- /**
-  * \def ARCH_TEST_ASYMMETRIC_ENCRYPTION
-@@ -227,21 +257,27 @@
-  *
-  * Comment macros to disable the types
-  */
--// #define ARCH_TEST_MD2
--// #define ARCH_TEST_MD4
--#define ARCH_TEST_MD5
--#define ARCH_TEST_RIPEMD160
--#define ARCH_TEST_SHA1
-+//#define ARCH_TEST_MD2
-+//#define ARCH_TEST_MD4
-+//#define ARCH_TEST_MD5
-+//#define ARCH_TEST_RIPEMD160
-+//#define ARCH_TEST_SHA1
-+#ifndef TF_M_PROFILE_SMALL
- #define ARCH_TEST_SHA224
-+#endif
- #define ARCH_TEST_SHA256
-+#ifndef TF_M_PROFILE_SMALL
-+#ifndef TF_M_PROFILE_MEDIUM
- #define ARCH_TEST_SHA384
- #define ARCH_TEST_SHA512
--// #define ARCH_TEST_SHA512_224
--// #define ARCH_TEST_SHA512_256
--// #define ARCH_TEST_SHA3_224
--// #define ARCH_TEST_SHA3_256
--// #define ARCH_TEST_SHA3_384
--// #define ARCH_TEST_SHA3_512
-+#endif
-+#endif
-+//#define ARCH_TEST_SHA512_224
-+//#define ARCH_TEST_SHA512_256
-+//#define ARCH_TEST_SHA3_224
-+//#define ARCH_TEST_SHA3_256
-+//#define ARCH_TEST_SHA3_384
-+//#define ARCH_TEST_SHA3_512
-=20
- /**
-  * \def ARCH_TEST_HKDF
-@@ -261,7 +297,12 @@
-  *
-  * Comment macros to disable the types
-  */
-+#ifndef TF_M_PROFILE_SMALL
-+#ifndef TF_M_PROFILE_MEDIUM
- #define ARCH_TEST_CMAC
-+#endif
-+#endif
-+//#define ARCH_TEST_GMAC
- #define ARCH_TEST_HMAC
-=20
- /**
-@@ -281,7 +322,11 @@
-  * Requires: ARCH_TEST_AES
-  *
-  */
-+#ifndef TF_M_PROFILE_SMALL
-+#ifndef TF_M_PROFILE_MEDIUM
- #define ARCH_TEST_GCM
-+#endif
-+#endif
-=20
- /**
-  * \def ARCH_TEST_TRUNCATED_MAC
-@@ -300,7 +345,9 @@
-  *
-  * Requires: ARCH_TEST_ECC
-  */
-+#ifndef TF_M_PROFILE_SMALL
- #define ARCH_TEST_ECDH
-+#endif
-=20
- /**
-  * \def ARCH_TEST_ECDSA
-@@ -308,7 +355,9 @@
-  * Enable the elliptic curve DSA library.
-  * Requires: ARCH_TEST_ECC
-  */
-+#ifndef TF_M_PROFILE_SMALL
- #define ARCH_TEST_ECDSA
-+#endif
-=20
- /**
-  * \def ARCH_TEST_DETERMINISTIC_ECDSA
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/psa-arch-test=
s_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/psa-arch-te=
sts_%.bbappend
deleted file mode 100644
index e517cd6d..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/psa-arch-tests_%.bba=
ppend
+++ /dev/null
@@ -1,6 +0,0 @@
-# Machine specific configurations
-
-MACHINE_PSA_REQUIRE ?=3D ""
-MACHINE_PSA_REQUIRE:corstone1000 =3D "psa-arch-tests-corstone1000.inc"
-
-require ${MACHINE_PSA_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone10=
00.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.i=
nc
index 78986dbb..0c8a8f6c 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM +=3D "file://../mbedtls/LICENSE;md5=3D3b=
83ef96387f14655fc854ddc3c6b
 		     "
=20
 SRC_URI:append =3D " \
-                 ${SRC_URI_MBEDTLS} ${SRC_URI_NANOPB} ${SRC_URI_OPENAMP}=
 ${SRC_URI_LIBMETAL} \
+                  ${SRC_URI_MBEDTLS} ${SRC_URI_NANOPB} ${SRC_URI_OPENAMP=
} ${SRC_URI_LIBMETAL} \
                   file://0001-tools-cmake-common-applying-lowercase-proj=
ect-convention.patch \
                   file://0002-fix-EARLY_TA_PATHS-env-variable.patch \
                   file://0003-se-proxy-dts-add-se-proxy-as-child-node.pa=
tch \
@@ -56,6 +56,7 @@ SRCREV_openamp =3D "347397decaa43372fc4d00f965640ebde04=
2966d"
 SRC_URI_LIBMETAL =3D "git://github.com/OpenAMP/libmetal.git;name=3Dlibme=
tal;protocol=3Dhttps;branch=3Dmain;destsuffix=3Dgit/libmetal"
 SRCREV_libmetal =3D "f252f0e007fbfb8b3a52b1d5901250ddac96baad"
=20
+TS_ENVIRONMENT_LINUX =3D "arm-linux"
 TS_PLATFORM =3D "arm/corstone1000"
 TS_ENVIRONMENT =3D "opteesp"
 SP_PACKAGING_METHOD =3D "embedded"
@@ -65,3 +66,39 @@ TS_DEPLOYMENTS +=3D "'deployments/se-proxy/${TS_ENVIRO=
NMENT}'"
=20
 # smm-gateway secure partition
 TS_DEPLOYMENTS +=3D "'deployments/smm-gateway/${TS_ENVIRONMENT}'"
+
+PSA_API_TESTS =3D "deployments/psa-api-test/protected_storage/${TS_ENVIR=
ONMENT_LINUX}"
+PSA_API_TESTS +=3D "deployments/psa-api-test/internal_trusted_storage/${=
TS_ENVIRONMENT_LINUX}"
+PSA_API_TESTS +=3D "deployments/psa-api-test/initial_attestation/${TS_EN=
VIRONMENT_LINUX}"
+PSA_API_TESTS +=3D "deployments/psa-api-test/crypto/${TS_ENVIRONMENT_LIN=
UX}"
+
+
+do_configure:append() {
+    for PSA_API_TEST in ${PSA_API_TESTS}; do
+        cmake \
+	    -DSYSROOT_YOCTO=3D${RECIPE_SYSROOT} \
+	    -S ${S}/$PSA_API_TEST -B "${B}/$PSA_API_TEST"
+    done
+}
+
+do_compile:append() {
+    for PSA_API_TEST in ${PSA_API_TESTS}; do
+        cmake --build "${B}/$PSA_API_TEST"
+    done
+}
+
+do_install:append() {
+    for PSA_API_TEST in ${PSA_API_TESTS}; do
+        install -d -m 0755 ${D}${libdir}/${PSA_API_TEST}
+        install -d -m 0755 ${D}${includedir}/${PSA_API_TEST}
+        psafile_fullpath=3D`ls ${B}/${PSA_API_TEST}/psa-*`
+        psafile_filename=3D"`basename -s .bin ${psafile_fullpath}`"
+        install -D -p -m 0755 ${psafile_fullpath} ${D}/${bindir}/${psafi=
le_filename}
+   done
+   cp -rf ${B}/${PSA_API_TEST}/libts_install/arm-linux/lib/*.so* ${D}/${=
libdir}
+}
+
+FILES:${PN}-dev =3D "${includedir}/deployments/psa-api-test/"
+INSANE_SKIP:${PN}-psa-api-tests +=3D "rpaths dev-so"
+PACKAGES +=3D "${PN}-psa-api-tests"
+FILES:${PN}-psa-api-tests =3D "${libdir} ${bindir}"
diff --git a/meta-arm/recipes-security/trusted-services/psa-arch-tests_gi=
t.bb b/meta-arm/recipes-security/trusted-services/psa-arch-tests_git.bb
deleted file mode 100644
index 0e7213a1..00000000
--- a/meta-arm/recipes-security/trusted-services/psa-arch-tests_git.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY =3D "PSA arch test application"
-
-require secure-partitions.inc
-
-LIC_FILES_CHKSUM +=3D "file://../psa-arch-tests/LICENSE.md;md5=3D2a94494=
2e1496af1886903d274dedb13"
-SRC_URI_PSA =3D "git://github.com/ARM-software/psa-arch-tests.git;protoc=
ol=3Dhttps;branch=3Dmain;name=3Dpsa;destsuffix=3Dgit/psa-arch-tests"
-SRC_URI:append =3D " ${SRC_URI_PSA}"
-
-SRCREV_FORMAT=3D"ts_psa"
-SRCREV_psa =3D "6e1549dde62d12c92fc2df90ebbbe2d2d77cc76a"
-PV =3D "1.2+git${SRCPV}"
-
-PSA_APPLICATION_NAME =3D "psa-api-test"
-TS_ENVIRONMENT_LINUX =3D "arm-linux"
-
-PSA_API_TESTS +=3D "deployments/psa-api-test/protected_storage/${TS_ENVI=
RONMENT_LINUX}"
-PSA_API_TESTS +=3D "deployments/psa-api-test/internal_trusted_storage/${=
TS_ENVIRONMENT_LINUX}"
-PSA_API_TESTS +=3D "deployments/psa-api-test/initial_attestation/${TS_EN=
VIRONMENT_LINUX}"
-PSA_API_TESTS +=3D "deployments/psa-api-test/crypto/${TS_ENVIRONMENT_LIN=
UX}"
-
-EXTRA_OECMAKE +=3D "-DCMAKE_POSITION_INDEPENDENT_CODE=3DTrue \
-                 -DCMAKE_SYSTEM_NAME=3DLinux \
-                 -DCMAKE_SYSTEM_PROCESSOR=3Darm \
-                "
-
-do_deploy[noexec] =3D "1"
diff --git a/meta-arm/recipes-security/trusted-services/secure-partitions=
_git.bb b/meta-arm/recipes-security/trusted-services/secure-partitions_gi=
t.bb
index c90c2739..cfbae78a 100644
--- a/meta-arm/recipes-security/trusted-services/secure-partitions_git.bb
+++ b/meta-arm/recipes-security/trusted-services/secure-partitions_git.bb
@@ -67,4 +67,4 @@ do_deploy() {
 }
 addtask deploy after do_install
=20
-FILES:${PN} =3D "/firmware/*"
+FILES:${PN} =3D "/firmware/sp/opteesp*"
--=20
2.25.1


