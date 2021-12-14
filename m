Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79AF8C433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 11:07:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.24665.1639480071249156512
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 03:07:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4AA26D;
	Tue, 14 Dec 2021 03:07:50 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.34.32])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CAE363F5A1;
	Tue, 14 Dec 2021 03:07:49 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 7/9] arm-bsp/psa-arch-tests: corstone1000: configuring crypto
 and attestation test
Date: Tue, 14 Dec 2021 11:07:29 +0000
Message-Id: <20211214110731.9081-8-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211214110731.9081-1-abdellatif.elkhlifi@arm.com>
References: <20211214110731.9081-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Dec 2021 11:07:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2685

From: Emekcan Aras <Emekcan.Aras@arm.com>

This commit configures crypto and attestation tests for Corstone1000
platform.

It also fixes CMake issues on the current trusted-service CMake source
files to enable this configuration.

Change-Id: I334d661c1bc349e03f92611d6010360c08e6cc89
Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 .../psa-arch-tests-corstone1000.inc           |   4 +-
 ...rch-test-Fixing-psa-arch-tests-cmake.patch |  49 ++++
 ...0003-corstone1000-port-crypto-config.patch | 237 ++++++++++++++++++
 3 files changed, 289 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/psa-arch-tests/corstone1000/0002-arm-bsp-psa-arch-test-Fixing-psa-arch-tests-cmake.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/psa-arch-tests/corstone1000/0003-corstone1000-port-crypto-config.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/psa-arch-tests-corstone1000.inc b/meta-arm-bsp/recipes-security/trusted-services/psa-arch-tests-corstone1000.inc
index f1aea12..da619d4 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/psa-arch-tests-corstone1000.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/psa-arch-tests-corstone1000.inc
@@ -9,6 +9,8 @@ COMPATIBLE_MACHINE = "corstone1000"
 
 SRC_URI:append = "\
     file://0001-psa-arch-test-sysroot_compiler_flags_fix.patch \
+    file://0002-arm-bsp-psa-arch-test-Fixing-psa-arch-tests-cmake.patch \
+    file://0003-corstone1000-port-crypto-config.patch;patchdir=../psa-arch-tests \
     "
 
 FILES:${PN} += "${libdir}/libts.so*  ${libdir}/deployments  ${bindir}/psa-*"
@@ -40,4 +42,4 @@ do_install() {
 	psafile_filename="`basename -s .bin ${psafile_fullpath}`"
         install -D -p -m 0755 ${psafile_fullpath} ${D}/${bindir}/${psafile_filename}
     done
-}
\ No newline at end of file
+}
diff --git a/meta-arm-bsp/recipes-security/trusted-services/psa-arch-tests/corstone1000/0002-arm-bsp-psa-arch-test-Fixing-psa-arch-tests-cmake.patch b/meta-arm-bsp/recipes-security/trusted-services/psa-arch-tests/corstone1000/0002-arm-bsp-psa-arch-test-Fixing-psa-arch-tests-cmake.patch
new file mode 100644
index 0000000..24b48e4
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/psa-arch-tests/corstone1000/0002-arm-bsp-psa-arch-test-Fixing-psa-arch-tests-cmake.patch
@@ -0,0 +1,49 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+
+From 4a1f2fd2c3c3f8e00364d3b1a8c76a61e41a483f Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <Emekcan.Aras@arm.com>
+Date: Sat, 11 Dec 2021 09:32:44 +0000
+Subject: [PATCH] arm-bsp/psa-arch-test: Fixing psa-arch-tests cmake
+
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+---
+ external/psa_arch_tests/psa_arch_tests.cmake | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/external/psa_arch_tests/psa_arch_tests.cmake b/external/psa_arch_tests/psa_arch_tests.cmake
+index af00cfc..e4b4f6b 100644
+--- a/external/psa_arch_tests/psa_arch_tests.cmake
++++ b/external/psa_arch_tests/psa_arch_tests.cmake
+@@ -25,15 +25,13 @@ find_program(GIT_COMMAND "git")
+ if (NOT GIT_COMMAND)
+ 	message(FATAL_ERROR "Please install git")
+ endif()
+-
++if ("${PSA_ARCH_TESTS_PATH}" STREQUAL "DOWNLOAD")
+ # Fetching psa-arch-tests
+ FetchContent_Declare(
+ 	psa-arch-tests
+ 	GIT_REPOSITORY ${PSA_ARCH_TESTS_URL}
+ 	GIT_TAG ${PSA_ARCH_TESTS_REFSPEC}
+ 	GIT_SHALLOW TRUE
+-	PATCH_COMMAND git stash
+-		COMMAND git apply ${CMAKE_CURRENT_LIST_DIR}/modify_attest_config.patch
+ )
+ 
+ # FetchContent_GetProperties exports psa-arch-tests_SOURCE_DIR and psa-arch-tests_BINARY_DIR variables
+@@ -42,7 +40,10 @@ if(NOT psa-arch-tests_POPULATED)
+ 	message(STATUS "Fetching psa-arch-tests")
+ 	FetchContent_Populate(psa-arch-tests)
+ endif()
+-
++else()
++    set(psa-arch-tests_SOURCE_DIR "${TS_ROOT}/../psa-arch-tests")
++    set(psa-arch-tests_BINARY_DIR "${CMAKE_CURRENT_BINARY_DIR}")
++endif()
+ # Ensure list of include paths is separated correctly
+ string(REPLACE ";" "\\;" PSA_ARCH_TESTS_EXTERNAL_INCLUDE_PATHS "${PSA_ARCH_TESTS_EXTERNAL_INCLUDE_PATHS}")
+ 
+-- 
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/psa-arch-tests/corstone1000/0003-corstone1000-port-crypto-config.patch b/meta-arm-bsp/recipes-security/trusted-services/psa-arch-tests/corstone1000/0003-corstone1000-port-crypto-config.patch
new file mode 100644
index 0000000..1d7b8ae
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/psa-arch-tests/corstone1000/0003-corstone1000-port-crypto-config.patch
@@ -0,0 +1,237 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+
+From f86f5b42d853d2a65f6753362361bbb95aac1800 Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Sat, 11 Dec 2021 11:06:57 +0000
+Subject: [PATCH] corstone1000: port crypto config
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+
+%% original patch: 0003-corstone1000-port-crypto-config.patch
+---
+ .../nspe/pal_crypto_config.h                  | 83 +++++++++++++++----
+ 1 file changed, 66 insertions(+), 17 deletions(-)
+
+diff --git a/api-tests/platform/targets/tgt_dev_apis_linux/nspe/pal_crypto_config.h b/api-tests/platform/targets/tgt_dev_apis_linux/nspe/pal_crypto_config.h
+index 844cd2e..c936bdd 100755
+--- a/api-tests/platform/targets/tgt_dev_apis_linux/nspe/pal_crypto_config.h
++++ b/api-tests/platform/targets/tgt_dev_apis_linux/nspe/pal_crypto_config.h
+@@ -1,5 +1,5 @@
+ /** @file
+- * Copyright (c) 2021, Arm Limited or its affiliates. All rights reserved.
++ * Copyright (c) 2019-2020, Arm Limited or its affiliates. All rights reserved.
+  * SPDX-License-Identifier : Apache-2.0
+  *
+  * Licensed under the Apache License, Version 2.0 (the "License");
+@@ -34,10 +34,14 @@
+  *
+  * Comment macros to disable the types
+  */
++#ifndef TF_M_PROFILE_SMALL
++#ifndef TF_M_PROFILE_MEDIUM
+ #define ARCH_TEST_RSA
+ #define ARCH_TEST_RSA_1024
+ #define ARCH_TEST_RSA_2048
+ #define ARCH_TEST_RSA_3072
++#endif
++#endif
+ 
+ /**
+  * \def  ARCH_TEST_ECC
+@@ -50,11 +54,17 @@
+  * Requires: ARCH_TEST_ECC
+  * Comment macros to disable the curve
+  */
++#ifndef TF_M_PROFILE_SMALL
+ #define ARCH_TEST_ECC
+ #define ARCH_TEST_ECC_CURVE_SECP192R1
++#ifndef TF_M_PROFILE_MEDIUM
+ #define ARCH_TEST_ECC_CURVE_SECP224R1
++#endif
+ #define ARCH_TEST_ECC_CURVE_SECP256R1
++#ifndef TF_M_PROFILE_MEDIUM
+ #define ARCH_TEST_ECC_CURVE_SECP384R1
++#endif
++#endif
+ 
+ /**
+  * \def ARCH_TEST_AES
+@@ -78,10 +88,10 @@
+  *
+  * Comment macros to disable the types
+  */
+-#define ARCH_TEST_DES
+-#define ARCH_TEST_DES_1KEY
+-#define ARCH_TEST_DES_2KEY
+-#define ARCH_TEST_DES_3KEY
++//#define ARCH_TEST_DES
++//#define ARCH_TEST_DES_1KEY
++//#define ARCH_TEST_DES_2KEY
++//#define ARCH_TEST_DES_3KEY
+ 
+ /**
+  * \def  ARCH_TEST_RAW
+@@ -104,7 +114,7 @@
+  *
+  * Enable the ARC4 key type.
+  */
+-#define ARCH_TEST_ARC4
++//#define ARCH_TEST_ARC4
+ 
+ /**
+  * \def ARCH_TEST_CIPHER_MODE_CTR
+@@ -113,7 +123,11 @@
+  *
+  * Requires: ARCH_TEST_CIPHER
+  */
++#ifndef TF_M_PROFILE_SMALL
++#ifndef TF_M_PROFILE_MEDIUM
+ #define ARCH_TEST_CIPHER_MODE_CTR
++#endif
++#endif
+ 
+ /**
+  * \def ARCH_TEST_CIPHER_MODE_CFB
+@@ -138,7 +152,11 @@
+  *
+  * Requires: ARCH_TEST_CIPHER, ARCH_TEST_AES, ARCH_TEST_CIPHER_MODE_CTR
+  */
++#ifndef TF_M_PROFILE_SMALL
++#ifndef TF_M_PROFILE_MEDIUM
+ #define ARCH_TEST_CTR_AES
++#endif
++#endif
+ 
+ /**
+  * \def ARCH_TEST_CBC_AES
+@@ -157,7 +175,11 @@
+  *
+  * Comment macros to disable the types
+  */
++#ifndef TF_M_PROFILE_SMALL
++#ifndef TF_M_PROFILE_MEDIUM
+ #define ARCH_TEST_CBC_NO_PADDING
++#endif
++#endif
+ 
+ /**
+  * \def ARCH_TEST_CFB_AES
+@@ -177,11 +199,15 @@
+  *
+  * Comment macros to disable the types
+  */
++#ifndef TF_M_PROFILE_SMALL
++#ifndef TF_M_PROFILE_MEDIUM
+ #define ARCH_TEST_PKCS1V15
+ #define ARCH_TEST_RSA_PKCS1V15_SIGN
+ #define ARCH_TEST_RSA_PKCS1V15_SIGN_RAW
+ #define ARCH_TEST_RSA_PKCS1V15_CRYPT
+ #define ARCH_TEST_RSA_OAEP
++#endif
++#endif
+ 
+ /**
+  * \def ARCH_TEST_CBC_PKCS7
+@@ -190,7 +216,11 @@
+  *
+  * Comment macros to disable the types
+  */
++#ifndef TF_M_PROFILE_SMALL
++#ifndef TF_M_PROFILE_MEDIUM
+ #define ARCH_TEST_CBC_PKCS7
++#endif
++#endif
+ 
+ /**
+  * \def ARCH_TEST_ASYMMETRIC_ENCRYPTION
+@@ -227,21 +257,27 @@
+  *
+  * Comment macros to disable the types
+  */
+-// #define ARCH_TEST_MD2
+-// #define ARCH_TEST_MD4
+-#define ARCH_TEST_MD5
+-#define ARCH_TEST_RIPEMD160
+-#define ARCH_TEST_SHA1
++//#define ARCH_TEST_MD2
++//#define ARCH_TEST_MD4
++//#define ARCH_TEST_MD5
++//#define ARCH_TEST_RIPEMD160
++//#define ARCH_TEST_SHA1
++#ifndef TF_M_PROFILE_SMALL
+ #define ARCH_TEST_SHA224
++#endif
+ #define ARCH_TEST_SHA256
++#ifndef TF_M_PROFILE_SMALL
++#ifndef TF_M_PROFILE_MEDIUM
+ #define ARCH_TEST_SHA384
+ #define ARCH_TEST_SHA512
+-// #define ARCH_TEST_SHA512_224
+-// #define ARCH_TEST_SHA512_256
+-// #define ARCH_TEST_SHA3_224
+-// #define ARCH_TEST_SHA3_256
+-// #define ARCH_TEST_SHA3_384
+-// #define ARCH_TEST_SHA3_512
++#endif
++#endif
++//#define ARCH_TEST_SHA512_224
++//#define ARCH_TEST_SHA512_256
++//#define ARCH_TEST_SHA3_224
++//#define ARCH_TEST_SHA3_256
++//#define ARCH_TEST_SHA3_384
++//#define ARCH_TEST_SHA3_512
+ 
+ /**
+  * \def ARCH_TEST_HKDF
+@@ -261,7 +297,12 @@
+  *
+  * Comment macros to disable the types
+  */
++#ifndef TF_M_PROFILE_SMALL
++#ifndef TF_M_PROFILE_MEDIUM
+ #define ARCH_TEST_CMAC
++#endif
++#endif
++//#define ARCH_TEST_GMAC
+ #define ARCH_TEST_HMAC
+ 
+ /**
+@@ -281,7 +322,11 @@
+  * Requires: ARCH_TEST_AES
+  *
+  */
++#ifndef TF_M_PROFILE_SMALL
++#ifndef TF_M_PROFILE_MEDIUM
+ #define ARCH_TEST_GCM
++#endif
++#endif
+ 
+ /**
+  * \def ARCH_TEST_TRUNCATED_MAC
+@@ -300,7 +345,9 @@
+  *
+  * Requires: ARCH_TEST_ECC
+  */
++#ifndef TF_M_PROFILE_SMALL
+ #define ARCH_TEST_ECDH
++#endif
+ 
+ /**
+  * \def ARCH_TEST_ECDSA
+@@ -308,7 +355,9 @@
+  * Enable the elliptic curve DSA library.
+  * Requires: ARCH_TEST_ECC
+  */
++#ifndef TF_M_PROFILE_SMALL
+ #define ARCH_TEST_ECDSA
++#endif
+ 
+ /**
+  * \def ARCH_TEST_DETERMINISTIC_ECDSA
+-- 
+2.25.1
+
-- 
2.17.1


