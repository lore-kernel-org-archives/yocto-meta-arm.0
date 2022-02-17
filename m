Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DEEFC433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 16:00:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1630.1645113604998889951
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Feb 2022 08:00:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BFF0113E;
	Thu, 17 Feb 2022 08:00:04 -0800 (PST)
Received: from e126835.arm.com (unknown [10.57.40.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 32AAC3F718;
	Thu, 17 Feb 2022 08:00:03 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	jon.mason@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH honister 2/3] arm-bsp/security: trusted-services to fix
 psa-arch-tests
Date: Thu, 17 Feb 2022 15:59:52 +0000
Message-Id: <20220217155953.2569183-3-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220217155953.2569183-1-emekcan.aras@arm.com>
References: <20220217155953.2569183-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 17 Feb 2022 16:00:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3013

From: Vishnu Banavath <vishnu.banavath@arm.com>

These changes are to fix failures in psa-arch-tests

Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
---
 ...0003-corstone1000-port-crypto-config.patch |  237 ++++
 .../0033-Enhance-mbedtls-fetch-process.patch  |  258 ++++
 ...x-format-specifier-in-logging_caller.patch |   41 +
 ...for-mbedtls-and-psa-arch-tests-for-v.patch |   65 +
 ...n-verify-message-and-hash-operations.patch | 1080 +++++++++++++++++
 ...nst-uninitialised-multi-part-transac.patch |  124 ++
 ...038-Integrate-AEAD-operation-support.patch |  521 ++++++++
 ...eration-to-one-shot-cipher-operation.patch |   96 ++
 ...-Fix-multi-part-termination-on-error.patch |  241 ++++
 ...tion-if-client-provided-buffer-is-to.patch |   50 +
 ...g-to-updated-t_cose-version-fc3a4b2c.patch |   95 ++
 .../0043-pass-sysroot_yocto.patch             |  111 ++
 ...face-structure-aligned-with-tf-m-cha.patch |   30 +
 ...egrate-remaining-psa-ipc-client-APIs.patch |  494 ++++++++
 ...et_key_usage_flags-definition-to-the.patch |   40 +
 ...-in-AEAD-for-psa-arch-test-54-and-58.patch |  120 ++
 .../trusted-services/ts-corstone1000.inc      |   22 +-
 17 files changed, 3624 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0003-corstone1000-port-crypto-config.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0033-Enhance-mbedtls-fetch-process.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0034-Fix-format-specifier-in-logging_caller.patc=
h
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0035-Update-refspecs-for-mbedtls-and-psa-arch-te=
sts-for-v.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0036-Separate-sign-verify-message-and-hash-opera=
tions.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0037-Add-defence-against-uninitialised-multi-par=
t-transac.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0038-Integrate-AEAD-operation-support.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0039-Add-IV-generation-to-one-shot-cipher-operat=
ion.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0040-Fix-multi-part-termination-on-error.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0041-Abort-AEAD-operation-if-client-provided-buf=
fer-is-to.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0042-Peg-to-updated-t_cose-version-fc3a4b2c.patc=
h
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0043-pass-sysroot_yocto.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0044-Fix-Crypto-interface-structure-aligned-with=
-tf-m-cha.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0045-Integrate-remaining-psa-ipc-client-APIs.pat=
ch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0046-Fix-update-psa_set_key_usage_flags-definiti=
on-to-the.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure=
-partitions/corstone1000/0047-Fixes-in-AEAD-for-psa-arch-test-54-and-58.p=
atch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0003-corstone1000-port-crypto-config.patch b/meta-arm-b=
sp/recipes-security/trusted-services/secure-partitions/corstone1000/0003-=
corstone1000-port-crypto-config.patch
new file mode 100644
index 0000000..1d7b8ae
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0003-corstone1000-port-crypto-config.patch
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
+diff --git a/api-tests/platform/targets/tgt_dev_apis_linux/nspe/pal_cryp=
to_config.h b/api-tests/platform/targets/tgt_dev_apis_linux/nspe/pal_cryp=
to_config.h
+index 844cd2e..c936bdd 100755
+--- a/api-tests/platform/targets/tgt_dev_apis_linux/nspe/pal_crypto_conf=
ig.h
++++ b/api-tests/platform/targets/tgt_dev_apis_linux/nspe/pal_crypto_conf=
ig.h
+@@ -1,5 +1,5 @@
+ /** @file
+- * Copyright (c) 2021, Arm Limited or its affiliates. All rights reserv=
ed.
++ * Copyright (c) 2019-2020, Arm Limited or its affiliates. All rights r=
eserved.
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
+=20
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
+=20
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
+=20
+ /**
+  * \def  ARCH_TEST_RAW
+@@ -104,7 +114,7 @@
+  *
+  * Enable the ARC4 key type.
+  */
+-#define ARCH_TEST_ARC4
++//#define ARCH_TEST_ARC4
+=20
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
+=20
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
+=20
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
+=20
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
+=20
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
+=20
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
+=20
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
+=20
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
+=20
+ /**
+  * \def ARCH_TEST_TRUNCATED_MAC
+@@ -300,7 +345,9 @@
+  *
+  * Requires: ARCH_TEST_ECC
+  */
++#ifndef TF_M_PROFILE_SMALL
+ #define ARCH_TEST_ECDH
++#endif
+=20
+ /**
+  * \def ARCH_TEST_ECDSA
+@@ -308,7 +355,9 @@
+  * Enable the elliptic curve DSA library.
+  * Requires: ARCH_TEST_ECC
+  */
++#ifndef TF_M_PROFILE_SMALL
+ #define ARCH_TEST_ECDSA
++#endif
+=20
+ /**
+  * \def ARCH_TEST_DETERMINISTIC_ECDSA
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0033-Enhance-mbedtls-fetch-process.patch b/meta-arm-bsp=
/recipes-security/trusted-services/secure-partitions/corstone1000/0033-En=
hance-mbedtls-fetch-process.patch
new file mode 100644
index 0000000..60f4826
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0033-Enhance-mbedtls-fetch-process.patch
@@ -0,0 +1,258 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+
+From ddff15a07e2fb7eddfa1d988fce25d82cb22f7ee Mon Sep 17 00:00:00 2001
+From: Gyorgy Szing <Gyorgy.Szing@arm.com>
+Date: Wed, 8 Dec 2021 04:20:34 +0100
+Subject: [PATCH 01/15] Enhance mbedtls fetch process
+
+Update management of MbedTLS external component to be optimized
+for download speed insted of availability.
+The updated process is:
+  - check if binary is available. If yes configure build to use it
+    and stop.
+  - if not, check is source is available. If yes, build it and use
+    the resulting binary.
+  - if not, then download the source using git, compile it and use
+    the resulting binary
+
+The following variables can be set on the command line to alter the
+behavior of the module:
+  - MBEDTLS_URL git repo URL to fetch from.
+  - MBEDTLS_REFSPEC revision to fetch
+  - MBEDTLS_SOURCE_DIR to specify location of source code in
+    local file syetem.
+  - MBEDTLS_INSTALL_DIR to specify location of binary.
+
+I.e. cmake -S <...> -B <...> -DMBEDTLS_INSTALL_DIR=3D~/mbedtls
+will make the resulting binary installed to ~/mbedtls. This can be
+used later to speed up a clean build an use the prebuilt binary.
+
+Change-Id: I8a9ad8b3303e6dfa0a7c9c3d7e4b4787b94d925a
+Signed-off-by: Gyorgy Szing <Gyorgy.Szing@arm.com>
+---
+ external/MbedTLS/MbedTLS.cmake | 192 ++++++++++++++++++++-------------
+ 1 file changed, 119 insertions(+), 73 deletions(-)
+
+diff --git a/external/MbedTLS/MbedTLS.cmake b/external/MbedTLS/MbedTLS.c=
make
+index 3cbaed15..935be765 100644
+--- a/external/MbedTLS/MbedTLS.cmake
++++ b/external/MbedTLS/MbedTLS.cmake
+@@ -1,96 +1,142 @@
+ #----------------------------------------------------------------------=
---------
+-# Copyright (c) 2020-2021, Arm Limited and Contributors. All rights res=
erved.
++# Copyright (c) 2020-2022, Arm Limited and Contributors. All rights res=
erved.
+ #
+ # SPDX-License-Identifier: BSD-3-Clause
+ #
+ #----------------------------------------------------------------------=
---------
+
+-# Determine the number of processes to run while running parallel build=
s.
+-# Pass -DPROCESSOR_COUNT=3D<n> to cmake to override.
+-if(NOT DEFINED PROCESSOR_COUNT)
+-	include(ProcessorCount)
+-	ProcessorCount(PROCESSOR_COUNT)
+-	set(PROCESSOR_COUNT ${PROCESSOR_COUNT} CACHE STRING "Number of cores t=
o use for parallel builds.")
+-endif()
++set(MBEDTLS_URL "https://github.com/ARMmbed/mbedtls.git"
++		CACHE STRING "Mbed TLS repository URL")
++set(MBEDTLS_REFSPEC "mbedtls-3.0.0"
++		CACHE STRING "Mbed TLS git refspec")
++set(MBEDTLS_SOURCE_DIR "${CMAKE_CURRENT_BINARY_DIR}/_deps/mbedtls-src"
++		CACHE PATH "MbedTLS source directory")
++set(MBEDTLS_INSTALL_DIR "${CMAKE_CURRENT_BINARY_DIR}/mbedtls_install"
++		CACHE PATH "Mbed TLS installation directory")
+
+-set(MBEDTLS_URL "https://github.com/ARMmbed/mbedtls.git" CACHE STRING "=
Mbed TLS repository URL")
+-set(MBEDTLS_REFSPEC "mbedtls-3.0.0" CACHE STRING "Mbed TLS git refspec"=
)
+-set(MBEDTLS_INSTALL_PATH "${CMAKE_CURRENT_BINARY_DIR}/mbedtls_install" =
CACHE PATH "Mbed TLS installation directory")
+-set(MBEDTLS_PACKAGE_PATH "${MBEDTLS_INSTALL_PATH}/lib/mbedtls/cmake" CA=
CHE PATH "Mbed TLS CMake package directory")
++find_library(MBEDCRYPTO_LIB_FILE
++				NAMES libmbedcrypto.a mbedcrypto.a libmbedcrypto.lib mbedcrypto.lib
++				PATHS ${MBEDTLS_INSTALL_DIR}
++				PATH_SUFFIXES "lib"
++				DOC "Location of mberdrypto library."
++				NO_DEFAULT_PATH
++)
+
+-include(FetchContent)
++set(MBEDCRYPTO_LIB_FILE ${MBEDCRYPTO_LIB_FILE})
++unset(MBEDCRYPTO_LIB_FILE CACHE)
+
+-# Checking git
+-find_program(GIT_COMMAND "git")
+-if (NOT GIT_COMMAND)
+-	message(FATAL_ERROR "Please install git")
+-endif()
++set(MBEDTLS_BINARY_DIR "${CMAKE_CURRENT_BINARY_DIR}/_deps/mbedtls-build=
")
+
+-# Fetching Mbed TLS
+-FetchContent_Declare(
+-	mbedtls
+-	GIT_REPOSITORY ${MBEDTLS_URL}
+-	GIT_TAG ${MBEDTLS_REFSPEC}
+-	GIT_SHALLOW TRUE
+-)
++# Binary not found and it needs to be built.
++if (NOT MBEDCRYPTO_LIB_FILE)
++	# Determine the number of processes to run while running parallel buil=
ds.
++	# Pass -DPROCESSOR_COUNT=3D<n> to cmake to override.
++	if(NOT DEFINED PROCESSOR_COUNT)
++		include(ProcessorCount)
++		ProcessorCount(PROCESSOR_COUNT)
++		set(PROCESSOR_COUNT ${PROCESSOR_COUNT}
++				CACHE STRING "Number of cores to use for parallel builds.")
++	endif()
+
+-# FetchContent_GetProperties exports mbedtls_SOURCE_DIR and mbedtls_BIN=
ARY_DIR variables
+-FetchContent_GetProperties(mbedtls)
+-if(NOT mbedtls_POPULATED)
+-	message(STATUS "Fetching Mbed TLS")
+-	FetchContent_Populate(mbedtls)
+-endif()
++	# See if the source is available locally
++	find_file(MBEDCRYPTO_HEADER_FILE
++		NAMES crypto.h
++		PATHS ${MBEDTLS_SOURCE_DIR}
++		PATH_SUFFIXES "include/psa"
++		NO_DEFAULT_PATH
++	)
++	set(MBEDCRYPTO_HEADER_FILE ${MBEDCRYPTO_HEADER_FILE})
++	unset(MBEDCRYPTO_HEADER_FILE CACHE)
+
+-# Convert the include path list to a string. Needed to make parameter p=
assing to
+-# Mbed TLS build work fine.
+-string(REPLACE ";" "\\;" MBEDTLS_EXTRA_INCLUDES "${MBEDTLS_EXTRA_INCLUD=
ES}")
++	# Source not found, fetch it.
++	if (NOT MBEDCRYPTO_HEADER_FILE)
++		include(FetchContent)
+
+-find_package(Python3 COMPONENTS Interpreter)
+-if (NOT Python3_Interpreter_FOUND)
+-	message(FATAL_ERROR "Python 3 interpreter not found.")
+-endif()
++		# Checking git
++		find_program(GIT_COMMAND "git")
++		if (NOT GIT_COMMAND)
++			message(FATAL_ERROR "Please install git")
++		endif()
+
+-#Configure Mbed TLS to build only mbedcrypto lib
+-execute_process(COMMAND ${Python3_EXECUTABLE} scripts/config.py crypto =
WORKING_DIRECTORY ${mbedtls_SOURCE_DIR})
+-
+-# Advertise Mbed TLS as the provider of the psa crypto API
+-set(PSA_CRYPTO_API_INCLUDE "${MBEDTLS_INSTALL_PATH}/include" CACHE STRI=
NG "PSA Crypto API include path")
+-
+-#Configure the library
+-execute_process(COMMAND
+-	${CMAKE_COMMAND}
+-		-DENABLE_PROGRAMS=3DOFF
+-		-DENABLE_TESTING=3DOFF
+-		-DUNSAFE_BUILD=3DON
+-		-DCMAKE_INSTALL_PREFIX=3D${MBEDTLS_INSTALL_PATH}
+-		-DCMAKE_TOOLCHAIN_FILE=3D${TS_EXTERNAL_LIB_TOOLCHAIN_FILE}
+-		-DCMAKE_TRY_COMPILE_TARGET_TYPE=3DSTATIC_LIBRARY
+-		-DEXTERNAL_DEFINITIONS=3D-DMBEDTLS_USER_CONFIG_FILE=3D"${MBEDTLS_USER=
_CONFIG_FILE}"
+-		-DEXTERNAL_INCLUDE_PATHS=3D${MBEDTLS_EXTRA_INCLUDES}
+-		-GUnix\ Makefiles
+-		${mbedtls_SOURCE_DIR}
+-	WORKING_DIRECTORY
+-		${mbedtls_BINARY_DIR}
+-	RESULT_VARIABLE _exec_error
+-)
++		# Fetching Mbed TLS
++		FetchContent_Declare(
++			mbedtls
++			SOURCE_DIR ${MBEDTLS_SOURCE_DIR}
++			BINARY_DIR ${MBEDTLS_BINARY_DIR}
++			GIT_REPOSITORY ${MBEDTLS_URL}
++			GIT_TAG ${MBEDTLS_REFSPEC}
++			GIT_SHALLOW TRUE
++		)
+
+-if (_exec_error)
+-	message(FATAL_ERROR "Configuration step of Mbed TLS failed with ${_exe=
c_error}.")
+-endif()
++		# FetchContent_GetProperties exports mbedtls_SOURCE_DIR and mbedtls_B=
INARY_DIR variables
++		FetchContent_GetProperties(mbedtls)
++		# FetchContent_Populate will fail if the source directory is removed =
since it will try to
++		# do an "update" and not a "populate" action. As a workaround, remove=
 the subbuild directory.
++		# Note: this fix assumes, the default subbuild location is used.
++		file(REMOVE_RECURSE "${CMAKE_CURRENT_BINARY_DIR}/_deps/mbedtls-subbui=
ld")
++
++		# If the source directory has been moved, the binary dir must be rege=
nerated from scratch.
++		file(REMOVE_RECURSE "${MBEDTLS_BINARY_DIR}")
+
+-#TODO: add dependency to generated project on this file!
+-#TODO: add custom target to rebuild Mbed TLS
++		if (NOT mbedtls_POPULATED)
++			message(STATUS "Fetching Mbed TLS")
++			FetchContent_Populate(mbedtls)
++		endif()
++		set_property(DIRECTORY APPEND PROPERTY CMAKE_CONFIGURE_DEPENDS ${MBED=
TLS_SOURCE_DIR})
++	endif()
+
+-#Build the library
+-execute_process(COMMAND
+-		${CMAKE_COMMAND} --build ${mbedtls_BINARY_DIR} --parallel ${PROCESSOR=
_COUNT} --target install
++	# Build mbedcrypto library
++
++	# Convert the include path list to a string. Needed to make parameter =
passing to
++	# Mbed TLS build work fine.
++	string(REPLACE ";" "\\;" MBEDTLS_EXTRA_INCLUDES "${MBEDTLS_EXTRA_INCLU=
DES}")
++
++	find_package(Python3 REQUIRED COMPONENTS Interpreter)
++
++	#Configure Mbed TLS to build only mbedcrypto lib
++	execute_process(COMMAND ${Python3_EXECUTABLE} scripts/config.py crypto=
 WORKING_DIRECTORY ${MBEDTLS_SOURCE_DIR})
++
++	# Advertise Mbed TLS as the provider of the psa crypto API
++	set(PSA_CRYPTO_API_INCLUDE "${MBEDTLS_INSTALL_DIR}/include" CACHE STRI=
NG "PSA Crypto API include path")
++
++	#Configure the library
++	execute_process(COMMAND
++		${CMAKE_COMMAND} -E env CROSS_COMPILE=3D${CROSS_COMPILE}
++			${CMAKE_COMMAND}
++				-DENABLE_PROGRAMS=3DOFF
++				-DENABLE_TESTING=3DOFF
++				-DUNSAFE_BUILD=3DON
++				-DCMAKE_INSTALL_PREFIX=3D${MBEDTLS_INSTALL_DIR}
++				-DCMAKE_TOOLCHAIN_FILE=3D${TS_EXTERNAL_LIB_TOOLCHAIN_FILE}
++				-DCMAKE_TRY_COMPILE_TARGET_TYPE=3DSTATIC_LIBRARY
++				-DEXTERNAL_DEFINITIONS=3D-DMBEDTLS_USER_CONFIG_FILE=3D"${MBEDTLS_US=
ER_CONFIG_FILE}"
++				-DEXTERNAL_INCLUDE_PATHS=3D${MBEDTLS_EXTRA_INCLUDES}
++				-GUnix\ Makefiles
++				${MBEDTLS_SOURCE_DIR}
++		WORKING_DIRECTORY
++			${MBEDTLS_BINARY_DIR}
+ 		RESULT_VARIABLE _exec_error
+ 	)
+-if (_exec_error)
+-	message(FATAL_ERROR "Build step of Mbed TLS failed with ${_exec_error}=
.")
++
++	if (_exec_error)
++		message(FATAL_ERROR "Configuration step of Mbed TLS failed with ${_ex=
ec_error}.")
++	endif()
++
++	#Build the library
++	execute_process(COMMAND
++			${CMAKE_COMMAND} --build ${MBEDTLS_BINARY_DIR} --parallel ${PROCESSO=
R_COUNT} --target install
++			RESULT_VARIABLE _exec_error
++		)
++
++	if (_exec_error)
++		message(FATAL_ERROR "Build step of Mbed TLS failed with ${_exec_error=
}.")
++	endif()
++
++	set(MBEDCRYPTO_LIB_FILE "${MBEDTLS_INSTALL_DIR}/lib/${CMAKE_STATIC_LIB=
RARY_PREFIX}mbedcrypto${CMAKE_STATIC_LIBRARY_SUFFIX}")
+ endif()
+
+ #Create an imported target to have clean abstraction in the build-syste=
m.
+ add_library(mbedcrypto STATIC IMPORTED)
+-set_property(TARGET mbedcrypto PROPERTY IMPORTED_LOCATION "${MBEDTLS_IN=
STALL_PATH}/lib/${CMAKE_STATIC_LIBRARY_PREFIX}mbedcrypto${CMAKE_STATIC_LI=
BRARY_SUFFIX}")
+-set_property(TARGET mbedcrypto PROPERTY INTERFACE_INCLUDE_DIRECTORIES "=
${MBEDTLS_INSTALL_PATH}/include")
++set_property(DIRECTORY ${CMAKE_SOURCE_DIR} APPEND PROPERTY CMAKE_CONFIG=
URE_DEPENDS ${MBEDCRYPTO_LIB_FILE})
++set_property(TARGET mbedcrypto PROPERTY IMPORTED_LOCATION ${MBEDCRYPTO_=
LIB_FILE})
++set_property(TARGET mbedcrypto PROPERTY INTERFACE_INCLUDE_DIRECTORIES "=
${MBEDTLS_INSTALL_DIR}/include")
+--
+2.25.1
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0034-Fix-format-specifier-in-logging_caller.patch b/met=
a-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone100=
0/0034-Fix-format-specifier-in-logging_caller.patch
new file mode 100644
index 0000000..019d3c2
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0034-Fix-format-specifier-in-logging_caller.patch
@@ -0,0 +1,41 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+
+From ba99622ba2f0048159bea2d0086173b8d5365473 Mon Sep 17 00:00:00 2001
+From: Julian Hall <julian.hall@arm.com>
+Date: Fri, 11 Feb 2022 12:30:45 +0000
+Subject: [PATCH 02/15] Fix format specifier in logging_caller
+
+A previous change increased the width of the opstatus value
+returned by an rpc endpoint from 32 to 64 bits. This change
+corrects the printf format specifier in the rpc logging_caller
+that corresponds to logging the opstatus value.
+
+Signed-off-by: Julian Hall <julian.hall@arm.com>
+Change-Id: Ie695a6bf8cf8014317b85196d7b933d344782b2c
+---
+ components/rpc/common/logging/logging_caller.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/components/rpc/common/logging/logging_caller.c b/components=
/rpc/common/logging/logging_caller.c
+index 07c33de5..cac03f2f 100644
+--- a/components/rpc/common/logging/logging_caller.c
++++ b/components/rpc/common/logging/logging_caller.c
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
++ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights re=
served.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -87,7 +87,7 @@ static rpc_status_t call_invoke(void *context, rpc_cal=
l_handle handle, uint32_t
+
+ 	if (status =3D=3D TS_RPC_CALL_ACCEPTED) {
+
+-		fprintf(this_instance->log_file, "op_status: %d\n", *opstatus);
++		fprintf(this_instance->log_file, "op_status: %ld\n", *opstatus);
+ 		fprintf(this_instance->log_file, "resp_len: %ld\n", *resp_len);
+ 	}
+
+--
+2.25.1
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0035-Update-refspecs-for-mbedtls-and-psa-arch-tests-for=
-v.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitio=
ns/corstone1000/0035-Update-refspecs-for-mbedtls-and-psa-arch-tests-for-v=
.patch
new file mode 100644
index 0000000..bf78876
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0035-Update-refspecs-for-mbedtls-and-psa-arch-tests-for-v.patc=
h
@@ -0,0 +1,65 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+
+From ba6af6e6500a2ba25ab6c01d641383c24f9fab07 Mon Sep 17 00:00:00 2001
+From: Julian Hall <julian.hall@arm.com>
+Date: Fri, 11 Feb 2022 13:42:59 +0000
+Subject: [PATCH 03/15] Update refspecs for mbedtls and psa-arch-tests fo=
r
+ v3.1.0
+
+Updates external component refspecs to use mbedtls 3.1.0 and
+compatible API tests from psa-arch-test.
+
+Signed-off-by: Julian Hall <julian.hall@arm.com>
+Change-Id: I1b5cebd7de3c1885f5f8a8ea21ba5e4c52aefaf4
+---
+ external/MbedTLS/MbedTLS.cmake               |  2 +-
+ external/psa_arch_tests/psa_arch_tests.cmake | 17 ++++++-----------
+ 2 files changed, 7 insertions(+), 12 deletions(-)
+
+diff --git a/external/MbedTLS/MbedTLS.cmake b/external/MbedTLS/MbedTLS.c=
make
+index 935be765..3350d8a0 100644
+--- a/external/MbedTLS/MbedTLS.cmake
++++ b/external/MbedTLS/MbedTLS.cmake
+@@ -7,7 +7,7 @@
+
+ set(MBEDTLS_URL "https://github.com/ARMmbed/mbedtls.git"
+ 		CACHE STRING "Mbed TLS repository URL")
+-set(MBEDTLS_REFSPEC "mbedtls-3.0.0"
++set(MBEDTLS_REFSPEC "mbedtls-3.1.0"
+ 		CACHE STRING "Mbed TLS git refspec")
+ set(MBEDTLS_SOURCE_DIR "${CMAKE_CURRENT_BINARY_DIR}/_deps/mbedtls-src"
+ 		CACHE PATH "MbedTLS source directory")
+diff --git a/external/psa_arch_tests/psa_arch_tests.cmake b/external/psa=
_arch_tests/psa_arch_tests.cmake
+index e6ab73f7..f6d2fb9f 100644
+--- a/external/psa_arch_tests/psa_arch_tests.cmake
++++ b/external/psa_arch_tests/psa_arch_tests.cmake
+@@ -5,20 +5,15 @@
+ #
+ #----------------------------------------------------------------------=
---------
+
+-# Determine the number of processes to run while running parallel build=
s.
+-# Pass -DPROCESSOR_COUNT=3D<n> to cmake to override.
+-if(NOT DEFINED PROCESSOR_COUNT)
+-	include(ProcessorCount)
+-	ProcessorCount(PROCESSOR_COUNT)
+-	set(PROCESSOR_COUNT ${PROCESSOR_COUNT} CACHE STRING "Number of cores t=
o use for parallel builds.")
+-endif()
++# Temporarily using modified tests used for tf-m verification
++set(PSA_ARCH_TESTS_URL "https://github.com/bensze01/psa-arch-tests.git"=
 CACHE STRING "psa-arch-tests repository URL")
++set(PSA_ARCH_TESTS_REFSPEC "fix-multipart-aead" CACHE STRING "psa-arch-=
tests git refspec")
+
+-set(PSA_ARCH_TESTS_URL "https://github.com/ARM-software/psa-arch-tests.=
git" CACHE STRING "psa-arch-tests repository URL")
+-set(PSA_ARCH_TESTS_REFSPEC "master" CACHE STRING "psa-arch-tests git re=
fspec")
++#set(PSA_ARCH_TESTS_URL "https://github.com/ARM-software/psa-arch-tests=
.git" CACHE STRING "psa-arch-tests repository URL")
++#set(PSA_ARCH_TESTS_REFSPEC "2a1852252a9b9af655cbe02d5d3c930952d0d798" =
CACHE STRING "psa-arch-tests v22.01_API1.4_ADAC_BETA")
+ set(PSA_ARCH_TESTS_INSTALL_PATH "${CMAKE_CURRENT_BINARY_DIR}/psa-arch-t=
ests_install" CACHE PATH "psa-arch-tests installation directory")
+ set(PSA_ARCH_TESTS_PACKAGE_PATH "${PSA_ARCH_TESTS_INSTALL_PATH}/libpsa-=
arch-tests/cmake" CACHE PATH "psa-arch-tests CMake package directory")
+-
+-include(FetchContent)
++set(PSA_ARCH_TESTS_SOURCE_DIR "${CMAKE_CURRENT_BINARY_DIR}/_deps/psa_ar=
ch_tests-src" CACHE PATH "psa-arch-tests source.")
+
+ # Checking git
+ find_program(GIT_COMMAND "git")
+--
+2.25.1
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0036-Separate-sign-verify-message-and-hash-operations.p=
atch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/c=
orstone1000/0036-Separate-sign-verify-message-and-hash-operations.patch
new file mode 100644
index 0000000..87e023a
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0036-Separate-sign-verify-message-and-hash-operations.patch
@@ -0,0 +1,1080 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+
+From 5afda176526010872b5849622a69c1a4cafb76fd Mon Sep 17 00:00:00 2001
+From: Julian Hall <julian.hall@arm.com>
+Date: Fri, 11 Feb 2022 14:08:13 +0000
+Subject: [PATCH 04/15] Separate sign/verify message and hash operations
+
+Previous versions of mbedtls didn't distinguish between
+asymmetric sign and verify operations on a hash or message.
+They are now treated as separate operations from a usage
+control perspective. This change makes the corresponding
+hash/message sepration in client and service provider
+components.
+
+Signed-off-by: Julian Hall <julian.hall@arm.com>
+Change-Id: Ic0041c694c026522c9b00c974d22261e9e2feadd
+---
+ .../caller/packed-c/crypto_caller_sign_hash.h | 29 +++++++-
+ .../packed-c/crypto_caller_verify_hash.h      | 33 ++++++++-
+ .../caller/stub/crypto_caller_sign_hash.h     | 11 ++-
+ .../caller/stub/crypto_caller_verify_hash.h   | 11 ++-
+ .../service/crypto/client/cpp/crypto_client.h | 17 ++++-
+ .../packed-c/packedc_crypto_client.cpp        | 22 +++++-
+ .../protocol/packed-c/packedc_crypto_client.h | 17 ++++-
+ .../protobuf/protobuf_crypto_client.cpp       | 43 ++++++++++-
+ .../protobuf/protobuf_crypto_client.h         | 27 ++++++-
+ .../crypto/client/psa/psa_sign_message.c      | 24 +++---
+ .../crypto/client/psa/psa_verify_message.c    | 24 +++---
+ .../service/crypto/provider/crypto_provider.c | 40 ++++++----
+ .../serializer/crypto_provider_serializer.h   |  6 +-
+ .../packedc_crypto_provider_serializer.c      | 12 +--
+ .../protobuf/pb_crypto_provider_serializer.c  | 74 +++++++++----------
+ .../check_crypto_opcode_alignment.cpp         | 25 ++++---
+ .../test/service/crypto_service_scenarios.cpp | 56 +++++++++++++-
+ .../test/service/crypto_service_scenarios.h   |  3 +-
+ .../packed-c/crypto_service_packedc_tests.cpp |  7 +-
+ .../crypto_service_protobuf_tests.cpp         |  7 +-
+ protocols/service/crypto/packed-c/opcodes.h   |  4 +-
+ .../service/crypto/protobuf/opcodes.proto     |  4 +-
+ 22 files changed, 366 insertions(+), 130 deletions(-)
+
+diff --git a/components/service/crypto/client/caller/packed-c/crypto_cal=
ler_sign_hash.h b/components/service/crypto/client/caller/packed-c/crypto=
_caller_sign_hash.h
+index e807773e..4a9ed20d 100644
+--- a/components/service/crypto/client/caller/packed-c/crypto_caller_sig=
n_hash.h
++++ b/components/service/crypto/client/caller/packed-c/crypto_caller_sig=
n_hash.h
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
++ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights re=
served.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -20,7 +20,8 @@
+ extern "C" {
+ #endif
+
+-static inline psa_status_t crypto_caller_sign_hash(struct service_clien=
t *context,
++static inline psa_status_t crypto_caller_asym_sign_commom(struct servic=
e_client *context,
++	uint32_t opcode,
+ 	psa_key_id_t id,
+ 	psa_algorithm_t alg,
+ 	const uint8_t *hash, size_t hash_length,
+@@ -60,7 +61,7 @@ static inline psa_status_t crypto_caller_sign_hash(str=
uct service_client *contex
+
+ 		context->rpc_status =3D
+ 			rpc_caller_invoke(context->caller, call_handle,
+-						TS_CRYPTO_OPCODE_SIGN_HASH, &opstatus, &resp_buf, &resp_len);
++						opcode, &opstatus, &resp_buf, &resp_len);
+
+ 		if (context->rpc_status =3D=3D TS_RPC_CALL_ACCEPTED) {
+
+@@ -98,6 +99,28 @@ static inline psa_status_t crypto_caller_sign_hash(st=
ruct service_client *contex
+ 	return psa_status;
+ }
+
++static inline psa_status_t crypto_caller_sign_hash(struct service_clien=
t *context,
++	psa_key_id_t id,
++	psa_algorithm_t alg,
++	const uint8_t *hash, size_t hash_length,
++	uint8_t *signature, size_t signature_size, size_t *signature_length)
++{
++	return crypto_caller_asym_sign_commom(context, TS_CRYPTO_OPCODE_SIGN_H=
ASH,
++		id, alg, hash, hash_length,
++		signature, signature_size, signature_length);
++}
++
++static inline psa_status_t crypto_caller_sign_message(struct service_cl=
ient *context,
++	psa_key_id_t id,
++	psa_algorithm_t alg,
++	const uint8_t *hash, size_t hash_length,
++	uint8_t *signature, size_t signature_size, size_t *signature_length)
++{
++	return crypto_caller_asym_sign_commom(context, TS_CRYPTO_OPCODE_SIGN_M=
ESSAGE,
++		id, alg, hash, hash_length,
++		signature, signature_size, signature_length);
++}
++
+ #ifdef __cplusplus
+ }
+ #endif
+diff --git a/components/service/crypto/client/caller/packed-c/crypto_cal=
ler_verify_hash.h b/components/service/crypto/client/caller/packed-c/cryp=
to_caller_verify_hash.h
+index 47152946..daa11330 100644
+--- a/components/service/crypto/client/caller/packed-c/crypto_caller_ver=
ify_hash.h
++++ b/components/service/crypto/client/caller/packed-c/crypto_caller_ver=
ify_hash.h
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
++ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights re=
served.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -20,7 +20,8 @@
+ extern "C" {
+ #endif
+
+-static inline psa_status_t crypto_caller_verify_hash(struct service_cli=
ent *context,
++static inline psa_status_t crypto_caller_asym_verify_common(struct serv=
ice_client *context,
++	uint32_t opcode,
+ 	psa_key_id_t id,
+ 	psa_algorithm_t alg,
+ 	const uint8_t *hash, size_t hash_length,
+@@ -65,7 +66,7 @@ static inline psa_status_t crypto_caller_verify_hash(s=
truct service_client *cont
+
+ 		context->rpc_status =3D
+ 			rpc_caller_invoke(context->caller, call_handle,
+-					TS_CRYPTO_OPCODE_VERIFY_HASH, &opstatus, &resp_buf, &resp_len);
++					opcode, &opstatus, &resp_buf, &resp_len);
+
+ 		if (context->rpc_status =3D=3D TS_RPC_CALL_ACCEPTED) psa_status =3D o=
pstatus;
+
+@@ -75,6 +76,32 @@ static inline psa_status_t crypto_caller_verify_hash(=
struct service_client *cont
+ 	return psa_status;
+ }
+
++static inline psa_status_t crypto_caller_verify_hash(struct service_cli=
ent *context,
++	psa_key_id_t id,
++	psa_algorithm_t alg,
++	const uint8_t *hash, size_t hash_length,
++	const uint8_t *signature, size_t signature_length)
++{
++	return crypto_caller_asym_verify_common(context,
++		TS_CRYPTO_OPCODE_VERIFY_HASH,
++		id, alg,
++		hash, hash_length,
++		signature, signature_length);
++}
++
++static inline psa_status_t crypto_caller_verify_message(struct service_=
client *context,
++	psa_key_id_t id,
++	psa_algorithm_t alg,
++	const uint8_t *input, size_t input_length,
++	const uint8_t *signature, size_t signature_length)
++{
++	return crypto_caller_asym_verify_common(context,
++		TS_CRYPTO_OPCODE_VERIFY_MESSAGE,
++		id, alg,
++		input, input_length,
++		signature, signature_length);
++}
++
+ #ifdef __cplusplus
+ }
+ #endif
+diff --git a/components/service/crypto/client/caller/stub/crypto_caller_=
sign_hash.h b/components/service/crypto/client/caller/stub/crypto_caller_=
sign_hash.h
+index d09369a2..09049f5c 100644
+--- a/components/service/crypto/client/caller/stub/crypto_caller_sign_ha=
sh.h
++++ b/components/service/crypto/client/caller/stub/crypto_caller_sign_ha=
sh.h
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
++ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights re=
served.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -23,6 +23,15 @@ static inline psa_status_t crypto_caller_sign_hash(st=
ruct service_client *contex
+ 	return PSA_ERROR_NOT_SUPPORTED;
+ }
+
++static inline psa_status_t crypto_caller_sign_message(struct service_cl=
ient *context,
++	psa_key_id_t id,
++	psa_algorithm_t alg,
++	const uint8_t *hash, size_t hash_length,
++	uint8_t *signature, size_t signature_size, size_t *signature_length)
++{
++	return PSA_ERROR_NOT_SUPPORTED;
++}
++
+ #ifdef __cplusplus
+ }
+ #endif
+diff --git a/components/service/crypto/client/caller/stub/crypto_caller_=
verify_hash.h b/components/service/crypto/client/caller/stub/crypto_calle=
r_verify_hash.h
+index 20d11dcf..3f3eb878 100644
+--- a/components/service/crypto/client/caller/stub/crypto_caller_verify_=
hash.h
++++ b/components/service/crypto/client/caller/stub/crypto_caller_verify_=
hash.h
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
++ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights re=
served.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -23,6 +23,15 @@ static inline psa_status_t crypto_caller_verify_hash(=
struct service_client *cont
+ 	return PSA_ERROR_NOT_SUPPORTED;
+ }
+
++static inline psa_status_t crypto_caller_verify_message(struct service_=
client *context,
++	psa_key_id_t id,
++	psa_algorithm_t alg,
++	const uint8_t *input, size_t input_length,
++	const uint8_t *signature, size_t signature_length)
++{
++	return PSA_ERROR_NOT_SUPPORTED;
++}
++
+ #ifdef __cplusplus
+ }
+ #endif
+diff --git a/components/service/crypto/client/cpp/crypto_client.h b/comp=
onents/service/crypto/client/cpp/crypto_client.h
+index 2a5e5b99..ccb0714a 100644
+--- a/components/service/crypto/client/cpp/crypto_client.h
++++ b/components/service/crypto/client/cpp/crypto_client.h
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2020-2021, Arm Limited and Contributors. All rights re=
served.
++ * Copyright (c) 2020-2022, Arm Limited and Contributors. All rights re=
served.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -57,7 +57,7 @@ public:
+ 		psa_key_id_t id,
+ 		uint8_t *data, size_t data_size, size_t *data_length) =3D 0;
+
+-	/* Sign/verify methods */
++	/* Sign/verify hash methods */
+ 	virtual psa_status_t sign_hash(
+ 		psa_key_id_t id,
+ 		psa_algorithm_t alg,
+@@ -70,6 +70,19 @@ public:
+ 		const uint8_t *hash, size_t hash_length,
+ 		const uint8_t *signature, size_t signature_length) =3D 0;
+
++	/* Sign/verify message methods */
++	virtual psa_status_t sign_message(
++		psa_key_id_t id,
++		psa_algorithm_t alg,
++		const uint8_t *message, size_t message_length,
++		uint8_t *signature, size_t signature_size, size_t *signature_length) =
=3D 0;
++
++	virtual psa_status_t verify_message(
++		psa_key_id_t id,
++		psa_algorithm_t alg,
++		const uint8_t *message, size_t message_length,
++		const uint8_t *signature, size_t signature_length) =3D 0;
++
+ 	/* Asymmetric encrypt/decrypt */
+ 	virtual psa_status_t asymmetric_encrypt(
+ 		psa_key_id_t id,
+diff --git a/components/service/crypto/client/cpp/protocol/packed-c/pack=
edc_crypto_client.cpp b/components/service/crypto/client/cpp/protocol/pac=
ked-c/packedc_crypto_client.cpp
+index 4d9d8f41..4e10f9be 100644
+--- a/components/service/crypto/client/cpp/protocol/packed-c/packedc_cry=
pto_client.cpp
++++ b/components/service/crypto/client/cpp/protocol/packed-c/packedc_cry=
pto_client.cpp
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2020-2021, Arm Limited and Contributors. All rights re=
served.
++ * Copyright (c) 2020-2022, Arm Limited and Contributors. All rights re=
served.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -107,6 +107,26 @@ psa_status_t packedc_crypto_client::verify_hash(
+ 		signature, signature_length);
+ }
+
++psa_status_t packedc_crypto_client::sign_message(
++	psa_key_id_t id, psa_algorithm_t alg,
++	const uint8_t *message, size_t message_length,
++	uint8_t *signature, size_t signature_size, size_t *signature_length)
++{
++	return crypto_caller_sign_message(&m_client, id, alg,
++		message, message_length,
++		signature, signature_size, signature_length);
++}
++
++psa_status_t packedc_crypto_client::verify_message(
++	psa_key_id_t id, psa_algorithm_t alg,
++	const uint8_t *message, size_t message_length,
++	const uint8_t *signature, size_t signature_length)
++{
++	return crypto_caller_verify_message(&m_client, id, alg,
++		message, message_length,
++		signature, signature_length);
++}
++
+ psa_status_t packedc_crypto_client::asymmetric_encrypt(
+ 	psa_key_id_t id, psa_algorithm_t alg,
+ 	const uint8_t *input, size_t input_length,
+diff --git a/components/service/crypto/client/cpp/protocol/packed-c/pack=
edc_crypto_client.h b/components/service/crypto/client/cpp/protocol/packe=
d-c/packedc_crypto_client.h
+index 377b51d1..d74ba609 100644
+--- a/components/service/crypto/client/cpp/protocol/packed-c/packedc_cry=
pto_client.h
++++ b/components/service/crypto/client/cpp/protocol/packed-c/packedc_cry=
pto_client.h
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2020-2021, Arm Limited and Contributors. All rights re=
served.
++ * Copyright (c) 2020-2022, Arm Limited and Contributors. All rights re=
served.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -54,7 +54,7 @@ public:
+ 		psa_key_id_t id,
+ 		uint8_t *data, size_t data_size, size_t *data_length);
+
+-	/* Sign/verify methods */
++	/* Sign/verify hash methods */
+ 	psa_status_t sign_hash(
+ 		psa_key_id_t id,
+ 		psa_algorithm_t alg,
+@@ -67,6 +67,19 @@ public:
+ 		const uint8_t *hash, size_t hash_length,
+ 		const uint8_t *signature, size_t signature_length);
+
++	/* Sign/verify message methods */
++	psa_status_t sign_message(
++		psa_key_id_t id,
++		psa_algorithm_t alg,
++		const uint8_t *message, size_t message_length,
++		uint8_t *signature, size_t signature_size, size_t *signature_length);
++
++	psa_status_t verify_message(
++		psa_key_id_t id,
++		psa_algorithm_t alg,
++		const uint8_t *message, size_t message_length,
++		const uint8_t *signature, size_t signature_length);
++
+ 	/* Asymmetric encrypt/decrypt */
+ 	psa_status_t asymmetric_encrypt(
+ 		psa_key_id_t id,
+diff --git a/components/service/crypto/client/cpp/protocol/protobuf/prot=
obuf_crypto_client.cpp b/components/service/crypto/client/cpp/protocol/pr=
otobuf/protobuf_crypto_client.cpp
+index 17780351..28c8f6fb 100644
+--- a/components/service/crypto/client/cpp/protocol/protobuf/protobuf_cr=
ypto_client.cpp
++++ b/components/service/crypto/client/cpp/protocol/protobuf/protobuf_cr=
ypto_client.cpp
+@@ -386,6 +386,25 @@ psa_status_t protobuf_crypto_client::export_public_=
key(psa_key_id_t id,
+ psa_status_t protobuf_crypto_client::sign_hash(psa_key_id_t id, psa_alg=
orithm_t alg,
+ 							const uint8_t *hash, size_t hash_length,
+ 							uint8_t *signature, size_t signature_size, size_t *signature_len=
gth)
++{
++	return asym_sign(ts_crypto_Opcode_SIGN_HASH, id, alg,
++				hash, hash_length,
++				signature, signature_size, signature_length);
++}
++
++psa_status_t protobuf_crypto_client::sign_message(psa_key_id_t id, psa_=
algorithm_t alg,
++							const uint8_t *message, size_t message_length,
++							uint8_t *signature, size_t signature_size, size_t *signature_len=
gth)
++{
++	return asym_sign(ts_crypto_Opcode_SIGN_MESSAGE, id, alg,
++				message, message_length,
++				signature, signature_size, signature_length);
++}
++
++psa_status_t protobuf_crypto_client::asym_sign(uint32_t opcode,
++							psa_key_id_t id, psa_algorithm_t alg,
++							const uint8_t *hash, size_t hash_length,
++							uint8_t *signature, size_t signature_size, size_t *signature_len=
gth)
+ {
+ 	size_t req_len;
+ 	pb_bytes_array_t *hash_byte_array =3D
+@@ -416,7 +435,7 @@ psa_status_t protobuf_crypto_client::sign_hash(psa_k=
ey_id_t id, psa_algorithm_t
+ 			pb_encode(&ostream, ts_crypto_SignHashIn_fields, &req_msg);
+
+ 			m_client.rpc_status =3D rpc_caller_invoke(m_client.caller, call_hand=
le,
+-						ts_crypto_Opcode_SIGN_HASH, &opstatus, &resp_buf, &resp_len);
++						opcode, &opstatus, &resp_buf, &resp_len);
+
+ 			if (m_client.rpc_status =3D=3D TS_RPC_CALL_ACCEPTED) {
+
+@@ -462,10 +481,28 @@ psa_status_t protobuf_crypto_client::sign_hash(psa=
_key_id_t id, psa_algorithm_t
+ 	return psa_status;
+ }
+
+-
+ psa_status_t protobuf_crypto_client::verify_hash(psa_key_id_t id, psa_a=
lgorithm_t alg,
+ 						const uint8_t *hash, size_t hash_length,
+ 						const uint8_t *signature, size_t signature_length)
++{
++	return asym_verify(ts_crypto_Opcode_VERIFY_HASH, id, alg,
++				hash, hash_length,
++				signature, signature_length);
++}
++
++psa_status_t protobuf_crypto_client::verify_message(psa_key_id_t id, ps=
a_algorithm_t alg,
++						const uint8_t *message, size_t message_length,
++						const uint8_t *signature, size_t signature_length)
++{
++	return asym_verify(ts_crypto_Opcode_VERIFY_MESSAGE, id, alg,
++				message, message_length,
++				signature, signature_length);
++}
++
++psa_status_t protobuf_crypto_client::asym_verify(uint32_t opcode,
++						psa_key_id_t id, psa_algorithm_t alg,
++						const uint8_t *hash, size_t hash_length,
++						const uint8_t *signature, size_t signature_length)
+ {
+ 	size_t req_len;
+ 	pb_bytes_array_t *hash_byte_array =3D
+@@ -497,7 +534,7 @@ psa_status_t protobuf_crypto_client::verify_hash(psa=
_key_id_t id, psa_algorithm_
+ 			pb_encode(&ostream, ts_crypto_VerifyHashIn_fields, &req_msg);
+
+ 			m_client.rpc_status =3D rpc_caller_invoke(m_client.caller, call_hand=
le,
+-						ts_crypto_Opcode_VERIFY_HASH, &opstatus, &resp_buf, &resp_len);
++						opcode, &opstatus, &resp_buf, &resp_len);
+
+ 			if (m_client.rpc_status =3D=3D TS_RPC_CALL_ACCEPTED) psa_status =3D =
opstatus;
+
+diff --git a/components/service/crypto/client/cpp/protocol/protobuf/prot=
obuf_crypto_client.h b/components/service/crypto/client/cpp/protocol/prot=
obuf/protobuf_crypto_client.h
+index 085d9cfa..abe4439e 100644
+--- a/components/service/crypto/client/cpp/protocol/protobuf/protobuf_cr=
ypto_client.h
++++ b/components/service/crypto/client/cpp/protocol/protobuf/protobuf_cr=
ypto_client.h
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2020-2021, Arm Limited and Contributors. All rights re=
served.
++ * Copyright (c) 2020-2022, Arm Limited and Contributors. All rights re=
served.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -54,7 +54,7 @@ public:
+ 		psa_key_id_t id,
+ 		uint8_t *data, size_t data_size, size_t *data_length);
+
+-	/* Sign/verify methods */
++	/* Sign/verify hash methods */
+ 	psa_status_t sign_hash(
+ 		psa_key_id_t id,
+ 		psa_algorithm_t alg,
+@@ -67,6 +67,19 @@ public:
+ 		const uint8_t *hash, size_t hash_length,
+ 		const uint8_t *signature, size_t signature_length);
+
++	/* Sign/verify message methods */
++	psa_status_t sign_message(
++		psa_key_id_t id,
++		psa_algorithm_t alg,
++		const uint8_t *message, size_t message_length,
++		uint8_t *signature, size_t signature_size, size_t *signature_length);
++
++	psa_status_t verify_message(
++		psa_key_id_t id,
++		psa_algorithm_t alg,
++		const uint8_t *message, size_t message_length,
++		const uint8_t *signature, size_t signature_length);
++
+ 	/* Asymmetric encrypt/decrypt */
+ 	psa_status_t asymmetric_encrypt(
+ 		psa_key_id_t id,
+@@ -221,6 +234,16 @@ public:
+
+ private:
+
++	psa_status_t asym_sign(uint32_t opcode,
++		psa_key_id_t id, psa_algorithm_t alg,
++		const uint8_t *hash, size_t hash_length,
++		uint8_t *signature, size_t signature_size, size_t *signature_length);
++
++	psa_status_t asym_verify(uint32_t opcode,
++		psa_key_id_t id, psa_algorithm_t alg,
++		const uint8_t *hash, size_t hash_length,
++		const uint8_t *signature, size_t signature_length);
++
+ 	void translate_key_attributes(
+ 		ts_crypto_KeyAttributes &proto_attributes,
+ 		const psa_key_attributes_t &psa_attributes);
+diff --git a/components/service/crypto/client/psa/psa_sign_message.c b/c=
omponents/service/crypto/client/psa/psa_sign_message.c
+index dc2f7e80..b6446253 100644
+--- a/components/service/crypto/client/psa/psa_sign_message.c
++++ b/components/service/crypto/client/psa/psa_sign_message.c
+@@ -1,13 +1,15 @@
+ /*
+- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
++ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights re=
served.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+
+ #include <psa/crypto.h>
++#include "psa_crypto_client.h"
++#include "crypto_caller_selector.h"
+
+ psa_status_t psa_sign_message(
+-	psa_key_id_t key,
++	psa_key_id_t id,
+ 	psa_algorithm_t alg,
+ 	const uint8_t *input,
+ 	size_t input_length,
+@@ -15,19 +17,11 @@ psa_status_t psa_sign_message(
+ 	size_t signature_size,
+ 	size_t *signature_length)
+ {
+-	size_t hash_len;
+-	uint8_t hash[PSA_HASH_MAX_SIZE];
++	if (psa_crypto_client_instance.init_status !=3D PSA_SUCCESS)
++		return psa_crypto_client_instance.init_status;
+
+-	psa_status_t psa_status =3D psa_hash_compute(PSA_ALG_SIGN_GET_HASH(alg=
),
++	return crypto_caller_sign_message(&psa_crypto_client_instance.base,
++		id, alg,
+ 		input, input_length,
+-		hash, sizeof(hash), &hash_len);
+-
+-	if (psa_status =3D=3D PSA_SUCCESS) {
+-
+-		psa_status =3D psa_sign_hash(key, alg,
+-			hash, hash_len,
+-			signature, signature_size, signature_length);
+-	}
+-
+-	return psa_status;
++		signature, signature_size, signature_length);
+ }
+diff --git a/components/service/crypto/client/psa/psa_verify_message.c b=
/components/service/crypto/client/psa/psa_verify_message.c
+index d0fbc7c8..57c2c5e8 100644
+--- a/components/service/crypto/client/psa/psa_verify_message.c
++++ b/components/service/crypto/client/psa/psa_verify_message.c
+@@ -1,32 +1,26 @@
+ /*
+- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
++ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights re=
served.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+
+ #include <psa/crypto.h>
++#include "psa_crypto_client.h"
++#include "crypto_caller_selector.h"
+
+ psa_status_t psa_verify_message(
+-	psa_key_id_t key,
++	psa_key_id_t id,
+ 	psa_algorithm_t alg,
+ 	const uint8_t *input,
+ 	size_t input_length,
+ 	const uint8_t * signature,
+ 	size_t signature_length)
+ {
+-	size_t hash_len;
+-	uint8_t hash[PSA_HASH_MAX_SIZE];
++	if (psa_crypto_client_instance.init_status !=3D PSA_SUCCESS)
++		return psa_crypto_client_instance.init_status;
+
+-	psa_status_t psa_status =3D psa_hash_compute(PSA_ALG_SIGN_GET_HASH(alg=
),
++	return crypto_caller_verify_message(&psa_crypto_client_instance.base,
++		id, alg,
+ 		input, input_length,
+-		hash, sizeof(hash), &hash_len);
+-
+-	if (psa_status =3D=3D PSA_SUCCESS) {
+-
+-		psa_status =3D psa_verify_hash(key, alg,
+-			hash, hash_len,
+-			signature, signature_length);
+-	}
+-
+-	return psa_status;
++		signature, signature_length);
+ }
+diff --git a/components/service/crypto/provider/crypto_provider.c b/comp=
onents/service/crypto/provider/crypto_provider.c
+index d0fc7cac..67a5b340 100644
+--- a/components/service/crypto/provider/crypto_provider.c
++++ b/components/service/crypto/provider/crypto_provider.c
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2020-2021, Arm Limited and Contributors. All rights re=
served.
++ * Copyright (c) 2020-2022, Arm Limited and Contributors. All rights re=
served.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -16,8 +16,8 @@ static rpc_status_t destroy_key_handler(void *context,=
 struct call_req* req);
+ static rpc_status_t export_key_handler(void *context, struct call_req* =
req);
+ static rpc_status_t export_public_key_handler(void *context, struct cal=
l_req* req);
+ static rpc_status_t import_key_handler(void *context, struct call_req* =
req);
+-static rpc_status_t sign_hash_handler(void *context, struct call_req* r=
eq);
+-static rpc_status_t verify_hash_handler(void *context, struct call_req*=
 req);
++static rpc_status_t asymmetric_sign_handler(void *context, struct call_=
req* req);
++static rpc_status_t asymmetric_verify_handler(void *context, struct cal=
l_req* req);
+ static rpc_status_t asymmetric_decrypt_handler(void *context, struct ca=
ll_req* req);
+ static rpc_status_t asymmetric_encrypt_handler(void *context, struct ca=
ll_req* req);
+ static rpc_status_t generate_random_handler(void *context, struct call_=
req* req);
+@@ -32,14 +32,16 @@ static const struct service_handler handler_table[] =
=3D {
+ 	{TS_CRYPTO_OPCODE_EXPORT_KEY,           export_key_handler},
+ 	{TS_CRYPTO_OPCODE_EXPORT_PUBLIC_KEY,    export_public_key_handler},
+ 	{TS_CRYPTO_OPCODE_IMPORT_KEY,           import_key_handler},
+-	{TS_CRYPTO_OPCODE_SIGN_HASH,            sign_hash_handler},
+-	{TS_CRYPTO_OPCODE_VERIFY_HASH,          verify_hash_handler},
++	{TS_CRYPTO_OPCODE_SIGN_HASH,            asymmetric_sign_handler},
++	{TS_CRYPTO_OPCODE_VERIFY_HASH,          asymmetric_verify_handler},
+ 	{TS_CRYPTO_OPCODE_ASYMMETRIC_DECRYPT,   asymmetric_decrypt_handler},
+ 	{TS_CRYPTO_OPCODE_ASYMMETRIC_ENCRYPT,   asymmetric_encrypt_handler},
+ 	{TS_CRYPTO_OPCODE_GENERATE_RANDOM,      generate_random_handler},
+ 	{TS_CRYPTO_OPCODE_COPY_KEY,          	copy_key_handler},
+ 	{TS_CRYPTO_OPCODE_PURGE_KEY,          	purge_key_handler},
+ 	{TS_CRYPTO_OPCODE_GET_KEY_ATTRIBUTES, 	get_key_attributes_handler},
++	{TS_CRYPTO_OPCODE_SIGN_MESSAGE,         asymmetric_sign_handler},
++	{TS_CRYPTO_OPCODE_VERIFY_MESSAGE,       asymmetric_verify_handler},
+ };
+
+ struct rpc_interface *crypto_provider_init(struct crypto_provider *cont=
ext)
+@@ -272,7 +274,7 @@ static rpc_status_t import_key_handler(void *context=
, struct call_req* req)
+ 	return rpc_status;
+ }
+
+-static rpc_status_t sign_hash_handler(void *context, struct call_req* r=
eq)
++static rpc_status_t asymmetric_sign_handler(void *context, struct call_=
req* req)
+ {
+ 	rpc_status_t rpc_status =3D TS_RPC_ERROR_SERIALIZATION_NOT_SUPPORTED;
+ 	struct call_param_buf *req_buf =3D call_req_get_req_buf(req);
+@@ -284,7 +286,7 @@ static rpc_status_t sign_hash_handler(void *context,=
 struct call_req* req)
+ 	uint8_t hash_buffer[PSA_HASH_MAX_SIZE];
+
+ 	if (serializer)
+-		rpc_status =3D serializer->deserialize_sign_hash_req(req_buf, &id, &a=
lg, hash_buffer, &hash_len);
++		rpc_status =3D serializer->deserialize_asymmetric_sign_req(req_buf, &=
id, &alg, hash_buffer, &hash_len);
+
+ 	if (rpc_status =3D=3D TS_RPC_CALL_ACCEPTED) {
+
+@@ -292,14 +294,16 @@ static rpc_status_t sign_hash_handler(void *contex=
t, struct call_req* req)
+ 		size_t sig_len;
+ 		uint8_t sig_buffer[PSA_SIGNATURE_MAX_SIZE];
+
+-		psa_status =3D psa_sign_hash(id, alg,
+-					hash_buffer, hash_len,
+-					sig_buffer, sizeof(sig_buffer), &sig_len);
++		psa_status =3D (call_req_get_opcode(req) =3D=3D TS_CRYPTO_OPCODE_SIGN=
_HASH) ?
++			psa_sign_hash(id, alg, hash_buffer, hash_len,
++				sig_buffer, sizeof(sig_buffer), &sig_len) :
++			psa_sign_message(id, alg, hash_buffer, hash_len,
++				sig_buffer, sizeof(sig_buffer), &sig_len);
+
+ 		if (psa_status =3D=3D PSA_SUCCESS) {
+
+ 			struct call_param_buf *resp_buf =3D call_req_get_resp_buf(req);
+-			rpc_status =3D serializer->serialize_sign_hash_resp(resp_buf, sig_bu=
ffer, sig_len);
++			rpc_status =3D serializer->serialize_asymmetric_sign_resp(resp_buf, =
sig_buffer, sig_len);
+ 		}
+
+ 		call_req_set_opstatus(req, psa_status);
+@@ -308,7 +312,7 @@ static rpc_status_t sign_hash_handler(void *context,=
 struct call_req* req)
+ 	return rpc_status;
+ }
+
+-static rpc_status_t verify_hash_handler(void *context, struct call_req*=
 req)
++static rpc_status_t asymmetric_verify_handler(void *context, struct cal=
l_req* req)
+ {
+ 	rpc_status_t rpc_status =3D TS_RPC_ERROR_SERIALIZATION_NOT_SUPPORTED;
+ 	struct call_param_buf *req_buf =3D call_req_get_req_buf(req);
+@@ -322,7 +326,7 @@ static rpc_status_t verify_hash_handler(void *contex=
t, struct call_req* req)
+ 	uint8_t sig_buffer[PSA_SIGNATURE_MAX_SIZE];
+
+ 	if (serializer)
+-		rpc_status =3D serializer->deserialize_verify_hash_req(req_buf, &id, =
&alg,
++		rpc_status =3D serializer->deserialize_asymmetric_verify_req(req_buf,=
 &id, &alg,
+ 											hash_buffer, &hash_len,
+ 											sig_buffer, &sig_len);
+
+@@ -330,9 +334,13 @@ static rpc_status_t verify_hash_handler(void *conte=
xt, struct call_req* req)
+
+ 		psa_status_t psa_status;
+
+-		psa_status =3D psa_verify_hash(id, alg,
+-					hash_buffer, hash_len,
+-					sig_buffer, sig_len);
++		psa_status =3D (call_req_get_opcode(req) =3D=3D TS_CRYPTO_OPCODE_VERI=
FY_HASH) ?
++			psa_verify_hash(id, alg,
++				hash_buffer, hash_len,
++				sig_buffer, sig_len) :
++			psa_verify_message(id, alg,
++				hash_buffer, hash_len,
++				sig_buffer, sig_len);
+
+ 		call_req_set_opstatus(req, psa_status);
+ 	}
+diff --git a/components/service/crypto/provider/serializer/crypto_provid=
er_serializer.h b/components/service/crypto/provider/serializer/crypto_pr=
ovider_serializer.h
+index 68940cae..57364f24 100644
+--- a/components/service/crypto/provider/serializer/crypto_provider_seri=
alizer.h
++++ b/components/service/crypto/provider/serializer/crypto_provider_seri=
alizer.h
+@@ -79,15 +79,15 @@ struct crypto_provider_serializer {
+                                         const psa_key_attributes_t *att=
ributes);
+
+     /* Operation: sign_hash */
+-    rpc_status_t (*deserialize_sign_hash_req)(const struct call_param_b=
uf *req_buf,
++    rpc_status_t (*deserialize_asymmetric_sign_req)(const struct call_p=
aram_buf *req_buf,
+                                         psa_key_id_t *id, psa_algorithm=
_t *alg,
+                                         uint8_t *hash, size_t *hash_len=
);
+
+-    rpc_status_t (*serialize_sign_hash_resp)(struct call_param_buf *res=
p_buf,
++    rpc_status_t (*serialize_asymmetric_sign_resp)(struct call_param_bu=
f *resp_buf,
+                                         const uint8_t *sig, size_t sig_=
len);
+
+     /* Operation: verify_hash */
+-    rpc_status_t (*deserialize_verify_hash_req)(const struct call_param=
_buf *req_buf,
++    rpc_status_t (*deserialize_asymmetric_verify_req)(const struct call=
_param_buf *req_buf,
+                                         psa_key_id_t *id, psa_algorithm=
_t *alg,
+                                         uint8_t *hash, size_t *hash_len=
,
+                                         uint8_t *sig, size_t *sig_len);
+diff --git a/components/service/crypto/provider/serializer/packed-c/pack=
edc_crypto_provider_serializer.c b/components/service/crypto/provider/ser=
ializer/packed-c/packedc_crypto_provider_serializer.c
+index c70db865..4a7e59f0 100644
+--- a/components/service/crypto/provider/serializer/packed-c/packedc_cry=
pto_provider_serializer.c
++++ b/components/service/crypto/provider/serializer/packed-c/packedc_cry=
pto_provider_serializer.c
+@@ -333,7 +333,7 @@ static rpc_status_t serialize_get_key_attributes_res=
p(struct call_param_buf *res
+ }
+
+ /* Operation: sign_hash */
+-static rpc_status_t deserialize_sign_hash_req(const struct call_param_b=
uf *req_buf,
++static rpc_status_t deserialize_asymmetric_sign_req(const struct call_p=
aram_buf *req_buf,
+                             psa_key_id_t *id, psa_algorithm_t *alg,
+                             uint8_t *hash, size_t *hash_len)
+ {
+@@ -378,7 +378,7 @@ static rpc_status_t deserialize_sign_hash_req(const =
struct call_param_buf *req_b
+     return rpc_status;
+ }
+
+-static rpc_status_t serialize_sign_hash_resp(struct call_param_buf *res=
p_buf,
++static rpc_status_t serialize_asymmetric_sign_resp(struct call_param_bu=
f *resp_buf,
+                             const uint8_t *sig, size_t sig_len)
+ {
+     rpc_status_t rpc_status =3D TS_RPC_ERROR_INTERNAL;
+@@ -401,7 +401,7 @@ static rpc_status_t serialize_sign_hash_resp(struct =
call_param_buf *resp_buf,
+ }
+
+ /* Operation: verify_hash */
+-static rpc_status_t deserialize_verify_hash_req(const struct call_param=
_buf *req_buf,
++static rpc_status_t deserialize_asymmetric_verify_req(const struct call=
_param_buf *req_buf,
+                                 psa_key_id_t *id, psa_algorithm_t *alg,
+                                 uint8_t *hash, size_t *hash_len,
+                                 uint8_t *sig, size_t *sig_len)
+@@ -695,9 +695,9 @@ const struct crypto_provider_serializer *packedc_cry=
pto_provider_serializer_inst
+         deserialize_purge_key_req,
+         deserialize_get_key_attributes_req,
+         serialize_get_key_attributes_resp,
+-        deserialize_sign_hash_req,
+-        serialize_sign_hash_resp,
+-        deserialize_verify_hash_req,
++        deserialize_asymmetric_sign_req,
++        serialize_asymmetric_sign_resp,
++        deserialize_asymmetric_verify_req,
+         deserialize_asymmetric_decrypt_req,
+         serialize_asymmetric_decrypt_resp,
+         deserialize_asymmetric_encrypt_req,
+diff --git a/components/service/crypto/provider/serializer/protobuf/pb_c=
rypto_provider_serializer.c b/components/service/crypto/provider/serializ=
er/protobuf/pb_crypto_provider_serializer.c
+index 7767d20a..083a581a 100644
+--- a/components/service/crypto/provider/serializer/protobuf/pb_crypto_p=
rovider_serializer.c
++++ b/components/service/crypto/provider/serializer/protobuf/pb_crypto_p=
rovider_serializer.c
+@@ -267,9 +267,9 @@ static rpc_status_t serialize_get_key_attributes_res=
p(struct call_param_buf *res
+ }
+
+ /* Operation: sign_hash */
+-static rpc_status_t deserialize_sign_hash_req(const struct call_param_b=
uf *req_buf,
+-                            psa_key_id_t *id, psa_algorithm_t *alg,
+-                            uint8_t *hash, size_t *hash_len)
++static rpc_status_t deserialize_asymmetric_sign_req(const struct call_p=
aram_buf *req_buf,
++							psa_key_id_t *id, psa_algorithm_t *alg,
++							uint8_t *hash, size_t *hash_len)
+ {
+     rpc_status_t rpc_status =3D TS_RPC_ERROR_INVALID_REQ_BODY;
+     ts_crypto_SignHashIn recv_msg =3D ts_crypto_SignHashIn_init_default=
;
+@@ -295,8 +295,8 @@ static rpc_status_t deserialize_sign_hash_req(const =
struct call_param_buf *req_b
+     return rpc_status;
+ }
+
+-static rpc_status_t serialize_sign_hash_resp(struct call_param_buf *res=
p_buf,
+-                            const uint8_t *sig, size_t sig_len)
++static rpc_status_t serialize_asymmetric_sign_resp(struct call_param_bu=
f *resp_buf,
++							const uint8_t *sig, size_t sig_len)
+ {
+     size_t packed_resp_size;
+     rpc_status_t rpc_status =3D TS_RPC_ERROR_INTERNAL;
+@@ -323,10 +323,10 @@ static rpc_status_t serialize_sign_hash_resp(struc=
t call_param_buf *resp_buf,
+ }
+
+ /* Operation: verify_hash */
+-static rpc_status_t deserialize_verify_hash_req(const struct call_param=
_buf *req_buf,
+-                                psa_key_id_t *id, psa_algorithm_t *alg,
+-                                uint8_t *hash, size_t *hash_len,
+-                                uint8_t *sig, size_t *sig_len)
++static rpc_status_t deserialize_asymmetric_verify_req(const struct call=
_param_buf *req_buf,
++								psa_key_id_t *id, psa_algorithm_t *alg,
++								uint8_t *hash, size_t *hash_len,
++								uint8_t *sig, size_t *sig_len)
+ {
+     rpc_status_t rpc_status =3D TS_RPC_ERROR_INVALID_REQ_BODY;
+     ts_crypto_VerifyHashIn recv_msg =3D ts_crypto_VerifyHashIn_init_def=
ault;
+@@ -538,32 +538,32 @@ static rpc_status_t serialize_generate_random_resp=
(struct call_param_buf *resp_b
+ /* Singleton method to provide access to the serializer instance */
+ const struct crypto_provider_serializer *pb_crypto_provider_serializer_=
instance(void)
+ {
+-    static const struct crypto_provider_serializer instance =3D {
+-        max_deserialised_parameter_size,
+-        deserialize_generate_key_req,
+-        serialize_generate_key_resp,
+-        deserialize_destroy_key_req,
+-        deserialize_export_key_req,
+-        serialize_export_key_resp,
+-        deserialize_export_public_key_req,
+-        serialize_export_public_key_resp,
+-        deserialize_import_key_req,
+-        serialize_import_key_resp,
+-        deserialize_copy_key_req,
+-        serialize_copy_key_resp,
+-        deserialize_purge_key_req,
+-        deserialize_get_key_attributes_req,
+-        serialize_get_key_attributes_resp,
+-        deserialize_sign_hash_req,
+-        serialize_sign_hash_resp,
+-        deserialize_verify_hash_req,
+-        deserialize_asymmetric_decrypt_req,
+-        serialize_asymmetric_decrypt_resp,
+-        deserialize_asymmetric_encrypt_req,
+-        serialize_asymmetric_encrypt_resp,
+-        deserialize_generate_random_req,
+-        serialize_generate_random_resp
+-    };
+-
+-    return &instance;
++	static const struct crypto_provider_serializer instance =3D {
++		max_deserialised_parameter_size,
++		deserialize_generate_key_req,
++		serialize_generate_key_resp,
++		deserialize_destroy_key_req,
++		deserialize_export_key_req,
++		serialize_export_key_resp,
++		deserialize_export_public_key_req,
++		serialize_export_public_key_resp,
++		deserialize_import_key_req,
++		serialize_import_key_resp,
++		deserialize_copy_key_req,
++		serialize_copy_key_resp,
++		deserialize_purge_key_req,
++		deserialize_get_key_attributes_req,
++		serialize_get_key_attributes_resp,
++		deserialize_asymmetric_sign_req,
++		serialize_asymmetric_sign_resp,
++		deserialize_asymmetric_verify_req,
++		deserialize_asymmetric_decrypt_req,
++		serialize_asymmetric_decrypt_resp,
++		deserialize_asymmetric_encrypt_req,
++		serialize_asymmetric_encrypt_resp,
++		deserialize_generate_random_req,
++		serialize_generate_random_resp
++	};
++
++	return &instance;
+ }
+diff --git a/components/service/crypto/test/protocol/check_crypto_opcode=
_alignment.cpp b/components/service/crypto/test/protocol/check_crypto_opc=
ode_alignment.cpp
+index bd6c66ee..da01abf4 100644
+--- a/components/service/crypto/test/protocol/check_crypto_opcode_alignm=
ent.cpp
++++ b/components/service/crypto/test/protocol/check_crypto_opcode_alignm=
ent.cpp
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2020-2021, Arm Limited and Contributors. All rights re=
served.
++ * Copyright (c) 2020-2022, Arm Limited and Contributors. All rights re=
served.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -18,15 +18,16 @@ TEST_GROUP(CryptoProtocolOpcodeChecks)
+
+ TEST(CryptoProtocolOpcodeChecks, checkPackedcToProtobuf)
+ {
+-    CHECK_EQUAL(TS_CRYPTO_OPCODE_GENERATE_KEY, ts_crypto_Opcode_GENERAT=
E_KEY);
+-    CHECK_EQUAL(TS_CRYPTO_OPCODE_DESTROY_KEY, ts_crypto_Opcode_DESTROY_=
KEY);
+-    CHECK_EQUAL(TS_CRYPTO_OPCODE_EXPORT_KEY, ts_crypto_Opcode_EXPORT_KE=
Y);
+-    CHECK_EQUAL(TS_CRYPTO_OPCODE_EXPORT_PUBLIC_KEY, ts_crypto_Opcode_EX=
PORT_PUBLIC_KEY);
+-    CHECK_EQUAL(TS_CRYPTO_OPCODE_IMPORT_KEY, ts_crypto_Opcode_IMPORT_KE=
Y);
+-    CHECK_EQUAL(TS_CRYPTO_OPCODE_SIGN_HASH, ts_crypto_Opcode_SIGN_HASH)=
;
+-    CHECK_EQUAL(TS_CRYPTO_OPCODE_VERIFY_HASH, ts_crypto_Opcode_VERIFY_H=
ASH);
+-    CHECK_EQUAL(TS_CRYPTO_OPCODE_ASYMMETRIC_DECRYPT, ts_crypto_Opcode_A=
SYMMETRIC_DECRYPT);
+-    CHECK_EQUAL(TS_CRYPTO_OPCODE_ASYMMETRIC_ENCRYPT, ts_crypto_Opcode_A=
SYMMETRIC_ENCRYPT);
+-    CHECK_EQUAL(TS_CRYPTO_OPCODE_GENERATE_RANDOM, ts_crypto_Opcode_GENE=
RATE_RANDOM);
++	CHECK_EQUAL(TS_CRYPTO_OPCODE_GENERATE_KEY, ts_crypto_Opcode_GENERATE_K=
EY);
++	CHECK_EQUAL(TS_CRYPTO_OPCODE_DESTROY_KEY, ts_crypto_Opcode_DESTROY_KEY=
);
++	CHECK_EQUAL(TS_CRYPTO_OPCODE_EXPORT_KEY, ts_crypto_Opcode_EXPORT_KEY);
++	CHECK_EQUAL(TS_CRYPTO_OPCODE_EXPORT_PUBLIC_KEY, ts_crypto_Opcode_EXPOR=
T_PUBLIC_KEY);
++	CHECK_EQUAL(TS_CRYPTO_OPCODE_IMPORT_KEY, ts_crypto_Opcode_IMPORT_KEY);
++	CHECK_EQUAL(TS_CRYPTO_OPCODE_SIGN_HASH, ts_crypto_Opcode_SIGN_HASH);
++	CHECK_EQUAL(TS_CRYPTO_OPCODE_VERIFY_HASH, ts_crypto_Opcode_VERIFY_HASH=
);
++	CHECK_EQUAL(TS_CRYPTO_OPCODE_ASYMMETRIC_DECRYPT, ts_crypto_Opcode_ASYM=
METRIC_DECRYPT);
++	CHECK_EQUAL(TS_CRYPTO_OPCODE_ASYMMETRIC_ENCRYPT, ts_crypto_Opcode_ASYM=
METRIC_ENCRYPT);
++	CHECK_EQUAL(TS_CRYPTO_OPCODE_GENERATE_RANDOM, ts_crypto_Opcode_GENERAT=
E_RANDOM);
++	CHECK_EQUAL(TS_CRYPTO_OPCODE_SIGN_MESSAGE, ts_crypto_Opcode_SIGN_MESSA=
GE);
++	CHECK_EQUAL(TS_CRYPTO_OPCODE_VERIFY_MESSAGE, ts_crypto_Opcode_VERIFY_M=
ESSAGE);
+ }
+-
+diff --git a/components/service/crypto/test/service/crypto_service_scena=
rios.cpp b/components/service/crypto/test/service/crypto_service_scenario=
s.cpp
+index ec2c6736..b3345551 100644
+--- a/components/service/crypto/test/service/crypto_service_scenarios.cp=
p
++++ b/components/service/crypto/test/service/crypto_service_scenarios.cp=
p
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2020-2021, Arm Limited and Contributors. All rights re=
served.
++ * Copyright (c) 2020-2022, Arm Limited and Contributors. All rights re=
served.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -290,6 +290,56 @@ void crypto_service_scenarios::signAndVerifyHash()
+ 	CHECK_EQUAL(PSA_SUCCESS, status);
+ }
+
++void crypto_service_scenarios::signAndVerifyMessage()
++{
++	psa_status_t status;
++	psa_key_attributes_t attributes =3D PSA_KEY_ATTRIBUTES_INIT;
++	psa_key_id_t key_id;
++
++	psa_set_key_id(&attributes, 14);
++	psa_set_key_usage_flags(&attributes, PSA_KEY_USAGE_SIGN_MESSAGE | PSA_=
KEY_USAGE_VERIFY_MESSAGE);
++	psa_set_key_algorithm(&attributes, PSA_ALG_DETERMINISTIC_ECDSA(PSA_ALG=
_SHA_256));
++	psa_set_key_type(&attributes, PSA_KEY_TYPE_ECC_KEY_PAIR(PSA_ECC_FAMILY=
_SECP_R1));
++	psa_set_key_bits(&attributes, 256);
++
++	/* Generate a key */
++	status =3D m_crypto_client->generate_key(&attributes, &key_id);
++	CHECK_EQUAL(PSA_SUCCESS, status);
++
++	psa_reset_key_attributes(&attributes);
++
++	/* Sign a message */
++	uint8_t message[21];
++	uint8_t signature[PSA_SIGNATURE_MAX_SIZE];
++	size_t signature_length;
++
++	memset(message, 0x99, sizeof(message));
++
++	status =3D m_crypto_client->sign_message(key_id,
++		PSA_ALG_DETERMINISTIC_ECDSA(PSA_ALG_SHA_256), message, sizeof(message=
),
++		signature, sizeof(signature), &signature_length);
++
++	CHECK_EQUAL(PSA_SUCCESS, status);
++	CHECK(signature_length > 0);
++
++	/* Verify the signature */
++	status =3D m_crypto_client->verify_message(key_id,
++		PSA_ALG_DETERMINISTIC_ECDSA(PSA_ALG_SHA_256), message, sizeof(message=
),
++		signature, signature_length);
++	CHECK_EQUAL(PSA_SUCCESS, status);
++
++	/* Change the message and expect verify to fail */
++	message[0] =3D 0x72;
++	status =3D m_crypto_client->verify_message(key_id,
++		PSA_ALG_DETERMINISTIC_ECDSA(PSA_ALG_SHA_256), message, sizeof(message=
),
++		signature, signature_length);
++	CHECK_EQUAL(PSA_ERROR_INVALID_SIGNATURE, status);
++
++	/* Remove the key */
++	status =3D m_crypto_client->destroy_key(key_id);
++	CHECK_EQUAL(PSA_SUCCESS, status);
++}
++
+ void crypto_service_scenarios::signAndVerifyEat()
+ {
+ 	/* Sign and verify a hash using EAT key type and algorithm */
+@@ -348,7 +398,7 @@ void crypto_service_scenarios::asymEncryptDecrypt()
+ 	psa_key_attributes_t attributes =3D PSA_KEY_ATTRIBUTES_INIT;
+ 	psa_key_id_t key_id;
+
+-	psa_set_key_id(&attributes, 14);
++	psa_set_key_id(&attributes, 15);
+ 	psa_set_key_usage_flags(&attributes, PSA_KEY_USAGE_ENCRYPT | PSA_KEY_U=
SAGE_DECRYPT);
+ 	psa_set_key_algorithm(&attributes, PSA_ALG_RSA_PKCS1V15_CRYPT);
+ 	psa_set_key_type(&attributes, PSA_KEY_TYPE_RSA_KEY_PAIR);
+@@ -394,7 +444,7 @@ void crypto_service_scenarios::asymEncryptDecryptWit=
hSalt()
+ 	psa_key_attributes_t attributes =3D PSA_KEY_ATTRIBUTES_INIT;
+ 	psa_key_id_t key_id;
+
+-	psa_set_key_id(&attributes, 15);
++	psa_set_key_id(&attributes, 16);
+ 	psa_set_key_usage_flags(&attributes, PSA_KEY_USAGE_ENCRYPT | PSA_KEY_U=
SAGE_DECRYPT);
+ 	psa_set_key_algorithm(&attributes,  PSA_ALG_RSA_OAEP(PSA_ALG_SHA_256))=
;
+ 	psa_set_key_type(&attributes, PSA_KEY_TYPE_RSA_KEY_PAIR);
+diff --git a/components/service/crypto/test/service/crypto_service_scena=
rios.h b/components/service/crypto/test/service/crypto_service_scenarios.=
h
+index c65eba26..23671644 100644
+--- a/components/service/crypto/test/service/crypto_service_scenarios.h
++++ b/components/service/crypto/test/service/crypto_service_scenarios.h
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2020-2021, Arm Limited and Contributors. All rights re=
served.
++ * Copyright (c) 2020-2022, Arm Limited and Contributors. All rights re=
served.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -24,6 +24,7 @@ public:
+ 	void asymEncryptDecrypt();
+ 	void asymEncryptDecryptWithSalt();
+ 	void signAndVerifyHash();
++	void signAndVerifyMessage();
+ 	void signAndVerifyEat();
+ 	void exportAndImportKeyPair();
+ 	void exportPublicKey();
+diff --git a/components/service/crypto/test/service/packed-c/crypto_serv=
ice_packedc_tests.cpp b/components/service/crypto/test/service/packed-c/c=
rypto_service_packedc_tests.cpp
+index 79eddfbb..ea238432 100644
+--- a/components/service/crypto/test/service/packed-c/crypto_service_pac=
kedc_tests.cpp
++++ b/components/service/crypto/test/service/packed-c/crypto_service_pac=
kedc_tests.cpp
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2020-2021, Arm Limited and Contributors. All rights re=
served.
++ * Copyright (c) 2020-2022, Arm Limited and Contributors. All rights re=
served.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -87,6 +87,11 @@ TEST(CryptoServicePackedcTests, signAndVerifyHash)
+ 	m_scenarios->signAndVerifyHash();
+ }
+
++TEST(CryptoServicePackedcTests, signAndVerifyMessage)
++{
++	m_scenarios->signAndVerifyMessage();
++}
++
+ TEST(CryptoServicePackedcTests, signAndVerifyEat)
+ {
+ 	m_scenarios->signAndVerifyEat();
+diff --git a/components/service/crypto/test/service/protobuf/crypto_serv=
ice_protobuf_tests.cpp b/components/service/crypto/test/service/protobuf/=
crypto_service_protobuf_tests.cpp
+index 1230752c..c172ad4a 100644
+--- a/components/service/crypto/test/service/protobuf/crypto_service_pro=
tobuf_tests.cpp
++++ b/components/service/crypto/test/service/protobuf/crypto_service_pro=
tobuf_tests.cpp
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2020-2021, Arm Limited and Contributors. All rights re=
served.
++ * Copyright (c) 2020-2022, Arm Limited and Contributors. All rights re=
served.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -77,6 +77,11 @@ TEST(CryptoServiceProtobufTests, signAndVerifyHash)
+     m_scenarios->signAndVerifyHash();
+ }
+
++TEST(CryptoServiceProtobufTests, signAndVerifyMessage)
++{
++    m_scenarios->signAndVerifyMessage();
++}
++
+ TEST(CryptoServiceProtobufTests, asymEncryptDecrypt)
+ {
+     m_scenarios->asymEncryptDecrypt();
+diff --git a/protocols/service/crypto/packed-c/opcodes.h b/protocols/ser=
vice/crypto/packed-c/opcodes.h
+index a07bd57e..5aebf2fa 100644
+--- a/protocols/service/crypto/packed-c/opcodes.h
++++ b/protocols/service/crypto/packed-c/opcodes.h
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2020-2021, Arm Limited and Contributors. All rights re=
served.
++ * Copyright (c) 2020-2022, Arm Limited and Contributors. All rights re=
served.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -25,6 +25,8 @@
+ #define TS_CRYPTO_OPCODE_COPY_KEY               (TS_CRYPTO_OPCODE_BASE =
+ 13)
+ #define TS_CRYPTO_OPCODE_PURGE_KEY              (TS_CRYPTO_OPCODE_BASE =
+ 14)
+ #define TS_CRYPTO_OPCODE_GET_KEY_ATTRIBUTES     (TS_CRYPTO_OPCODE_BASE =
+ 15)
++#define TS_CRYPTO_OPCODE_SIGN_MESSAGE           (TS_CRYPTO_OPCODE_BASE =
+ 16)
++#define TS_CRYPTO_OPCODE_VERIFY_MESSAGE         (TS_CRYPTO_OPCODE_BASE =
+ 17)
+
+ /* Hash operations */
+ #define TS_CRYPTO_OPCODE_HASH_BASE              (0x0200)
+diff --git a/protocols/service/crypto/protobuf/opcodes.proto b/protocols=
/service/crypto/protobuf/opcodes.proto
+index 094d3a02..ef64d044 100644
+--- a/protocols/service/crypto/protobuf/opcodes.proto
++++ b/protocols/service/crypto/protobuf/opcodes.proto
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2020-2021, Arm Limited and Contributors. All rights re=
served.
++ * Copyright (c) 2020-2022, Arm Limited and Contributors. All rights re=
served.
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+ syntax =3D "proto3";
+@@ -18,4 +18,6 @@ enum Opcode {
+   ASYMMETRIC_DECRYPT  =3D 0x010a;
+   ASYMMETRIC_ENCRYPT  =3D 0x010b;
+   GENERATE_RANDOM     =3D 0x010c;
++  SIGN_MESSAGE        =3D 0x0110;
++  VERIFY_MESSAGE      =3D 0x0111;
+ }
+--
+2.25.1
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0037-Add-defence-against-uninitialised-multi-part-trans=
ac.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitio=
ns/corstone1000/0037-Add-defence-against-uninitialised-multi-part-transac=
.patch
new file mode 100644
index 0000000..af156b0
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0037-Add-defence-against-uninitialised-multi-part-transac.patc=
h
@@ -0,0 +1,124 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+
+From 68e189877ea1aa893facafb8b336e92112555e07 Mon Sep 17 00:00:00 2001
+From: Julian Hall <julian.hall@arm.com>
+Date: Fri, 11 Feb 2022 14:19:26 +0000
+Subject: [PATCH 05/15] Add defence against uninitialised multi-part
+ transaction
+
+Adds checks for the condition where there is an attempt to
+setup a multi-part transaction without first initialising
+transaction state.
+
+Signed-off-by: Julian Hall <julian.hall@arm.com>
+Change-Id: I754479260fed0490d8f32b41a077d26028dc9903
+---
+ components/service/crypto/client/psa/psa_cipher.c | 14 +++++++++++++-
+ components/service/crypto/client/psa/psa_hash.c   |  8 +++++++-
+ components/service/crypto/client/psa/psa_mac.c    | 10 ++++++++--
+ 3 files changed, 28 insertions(+), 4 deletions(-)
+
+diff --git a/components/service/crypto/client/psa/psa_cipher.c b/compone=
nts/service/crypto/client/psa/psa_cipher.c
+index 70836ea6..3ab8ea21 100644
+--- a/components/service/crypto/client/psa/psa_cipher.c
++++ b/components/service/crypto/client/psa/psa_cipher.c
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
++ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights re=
served.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -13,6 +13,12 @@ psa_status_t psa_cipher_encrypt_setup(psa_cipher_oper=
ation_t *operation,
+ 	psa_key_id_t key,
+ 	psa_algorithm_t alg)
+ {
++	if (psa_crypto_client_instance.init_status !=3D PSA_SUCCESS)
++		return psa_crypto_client_instance.init_status;
++
++	if (operation->handle)
++		return PSA_ERROR_BAD_STATE;
++
+ 	return crypto_caller_cipher_encrypt_setup(&psa_crypto_client_instance.=
base,
+ 		&operation->handle,
+ 		key, alg);
+@@ -22,6 +28,12 @@ psa_status_t psa_cipher_decrypt_setup(psa_cipher_oper=
ation_t *operation,
+ 	psa_key_id_t key,
+ 	psa_algorithm_t alg)
+ {
++	if (psa_crypto_client_instance.init_status !=3D PSA_SUCCESS)
++		return psa_crypto_client_instance.init_status;
++
++	if (operation->handle)
++		return PSA_ERROR_BAD_STATE;
++
+ 	return crypto_caller_cipher_decrypt_setup(&psa_crypto_client_instance.=
base,
+ 		&operation->handle,
+ 		key, alg);
+diff --git a/components/service/crypto/client/psa/psa_hash.c b/component=
s/service/crypto/client/psa/psa_hash.c
+index 7005c390..83278de6 100644
+--- a/components/service/crypto/client/psa/psa_hash.c
++++ b/components/service/crypto/client/psa/psa_hash.c
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
++ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights re=
served.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -14,6 +14,9 @@ psa_status_t psa_hash_setup(psa_hash_operation_t *oper=
ation,
+ 	if (psa_crypto_client_instance.init_status !=3D PSA_SUCCESS)
+ 		return psa_crypto_client_instance.init_status;
+
++	if (operation->handle)
++		return PSA_ERROR_BAD_STATE;
++
+ 	return crypto_caller_hash_setup(&psa_crypto_client_instance.base,
+ 		&operation->handle, alg);
+ }
+@@ -55,6 +58,9 @@ psa_status_t psa_hash_verify(psa_hash_operation_t *ope=
ration,
+ psa_status_t psa_hash_clone(const psa_hash_operation_t *source_operatio=
n,
+ 	psa_hash_operation_t *target_operation)
+ {
++	if (target_operation->handle)
++		return PSA_ERROR_BAD_STATE;
++
+ 	return crypto_caller_hash_clone(&psa_crypto_client_instance.base,
+ 		source_operation->handle,
+ 		&target_operation->handle);
+diff --git a/components/service/crypto/client/psa/psa_mac.c b/components=
/service/crypto/client/psa/psa_mac.c
+index 5efa1c4d..5c5eb32a 100644
+--- a/components/service/crypto/client/psa/psa_mac.c
++++ b/components/service/crypto/client/psa/psa_mac.c
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
++ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights re=
served.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -16,6 +16,9 @@ psa_status_t psa_mac_sign_setup(psa_mac_operation_t *o=
peration,
+ 	if (psa_crypto_client_instance.init_status !=3D PSA_SUCCESS)
+ 		return psa_crypto_client_instance.init_status;
+
++	if (operation->handle)
++		return PSA_ERROR_BAD_STATE;
++
+ 	return crypto_caller_mac_sign_setup(&psa_crypto_client_instance.base,
+ 		&operation->handle,
+ 		key, alg);
+@@ -28,7 +31,10 @@ psa_status_t psa_mac_verify_setup(psa_mac_operation_t=
 *operation,
+ 	if (psa_crypto_client_instance.init_status !=3D PSA_SUCCESS)
+ 		return psa_crypto_client_instance.init_status;
+
+-	return crypto_caller_mac_sign_setup(&psa_crypto_client_instance.base,
++	if (operation->handle)
++		return PSA_ERROR_BAD_STATE;
++
++	return crypto_caller_mac_verify_setup(&psa_crypto_client_instance.base=
,
+ 		&operation->handle,
+ 		key, alg);
+ }
+--
+2.25.1
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0038-Integrate-AEAD-operation-support.patch b/meta-arm-=
bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0038=
-Integrate-AEAD-operation-support.patch
new file mode 100644
index 0000000..9c2ac43
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0038-Integrate-AEAD-operation-support.patch
@@ -0,0 +1,521 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+
+From d800f7eaa25efca41535a223ef5d524651dee103 Mon Sep 17 00:00:00 2001
+From: Julian Hall <julian.hall@arm.com>
+Date: Fri, 11 Feb 2022 14:24:53 +0000
+Subject: [PATCH 06/15] Integrate AEAD operation support
+
+Resolves issues and integrates AEAD support into the crypto service
+provider and clients.
+
+Signed-off-by: Julian Hall <julian.hall@arm.com>
+Change-Id: I5fbe78a2dd825f592e26fd665f60c18b576f9de9
+---
+ .../caller/packed-c/crypto_caller_aead.h      |  70 +++---
+ .../client/caller/stub/crypto_caller_aead.h   |  12 +-
+ .../service/crypto/client/psa/psa_aead.c      | 221 +++++++++++++++---
+ .../factory/full/crypto_provider_factory.c    |  16 +-
+ .../component-test/component-test.cmake       |   4 +-
+ deployments/crypto/opteesp/CMakeLists.txt     |   4 +-
+ deployments/libts/linux-pc/CMakeLists.txt     |   4 +-
+ deployments/se-proxy/opteesp/CMakeLists.txt   |   4 +-
+ 8 files changed, 263 insertions(+), 72 deletions(-)
+
+diff --git a/components/service/crypto/client/caller/packed-c/crypto_cal=
ler_aead.h b/components/service/crypto/client/caller/packed-c/crypto_call=
er_aead.h
+index 3d9947d5..c4ffb20c 100644
+--- a/components/service/crypto/client/caller/packed-c/crypto_caller_aea=
d.h
++++ b/components/service/crypto/client/caller/packed-c/crypto_caller_aea=
d.h
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
++ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights re=
served.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -20,38 +20,6 @@
+ extern "C" {
+ #endif
+
+-static inline psa_status_t crypto_caller_aead_encrypt(struct service_cl=
ient *context,
+-	psa_key_id_t key,
+-	psa_algorithm_t alg,
+-	const uint8_t *nonce,
+-	size_t nonce_length,
+-	const uint8_t *additional_data,
+-	size_t additional_data_length,
+-	const uint8_t *plaintext,
+-	size_t plaintext_length,
+-	uint8_t *aeadtext,
+-	size_t aeadtext_size,
+-	size_t *aeadtext_length)
+-{
+-	return PSA_ERROR_NOT_SUPPORTED;
+-}
+-
+-static inline psa_status_t crypto_caller_aead_decrypt(struct service_cl=
ient *context,
+-	psa_key_id_t key,
+-	psa_algorithm_t alg,
+-	const uint8_t *nonce,
+-	size_t nonce_length,
+-	const uint8_t *additional_data,
+-	size_t additional_data_length,
+-	const uint8_t *aeadtext,
+-	size_t aeadtext_length,
+-	uint8_t *plaintext,
+-	size_t plaintext_size,
+-	size_t *plaintext_length)
+-{
+-	return PSA_ERROR_NOT_SUPPORTED;
+-}
+-
+ static inline psa_status_t common_aead_setup(struct service_client *con=
text,
+ 	uint32_t *op_handle,
+ 	psa_key_id_t key,
+@@ -247,7 +215,7 @@ static inline psa_status_t crypto_caller_aead_set_le=
ngths(struct service_client
+ {
+ 	psa_status_t psa_status =3D PSA_ERROR_GENERIC_ERROR;
+ 	struct ts_crypto_aead_set_lengths_in req_msg;
+-	size_t req_fixed_len =3D sizeof(struct ts_crypto_aead_abort_in);
++	size_t req_fixed_len =3D sizeof(struct ts_crypto_aead_set_lengths_in);
+ 	size_t req_len =3D req_fixed_len;
+
+ 	req_msg.op_handle =3D op_handle;
+@@ -611,6 +579,40 @@ static inline psa_status_t crypto_caller_aead_abort=
(struct service_client *conte
+ 	return psa_status;
+ }
+
++/**
++ * The maximum data length that may be carried in an update operation w=
ill be
++ * constrained by the maximum call payload capacity imposed by the end-=
to-end
++ * RPC call path. These functions return the maximum update size when s=
erialization
++ * overheads are considered. This allows large paylaods to be processed=
 in
++ * maximum size chunks.
++ */
++static inline size_t crypto_caller_aead_max_update_ad_size(const struct=
 service_client *context)
++{
++	/* Returns the maximum number of bytes of additional data that may be
++	 * carried as a parameter of the aead_update_ad operation
++	 * using the packed-c encoding.
++	 */
++	size_t payload_space =3D context->service_info.max_payload;
++	size_t overhead =3D sizeof(struct ts_crypto_aead_update_ad_in) + TLV_H=
DR_LEN;
++
++	return (payload_space > overhead) ? payload_space - overhead : 0;
++}
++
++static inline size_t crypto_caller_aead_max_update_size(const struct se=
rvice_client *context)
++{
++	/* Returns the maximum number of bytes that may be
++	 * carried as a parameter of the aead_update operation
++	 * using the packed-c encoding.
++	 */
++	size_t payload_space =3D context->service_info.max_payload;
++	size_t overhead =3D sizeof(struct ts_crypto_aead_update_in) + TLV_HDR_=
LEN;
++
++	/* Allow for output to be a whole number of blocks */
++	overhead +=3D PSA_BLOCK_CIPHER_BLOCK_MAX_SIZE;
++
++	return (payload_space > overhead) ? payload_space - overhead : 0;
++}
++
+ #ifdef __cplusplus
+ }
+ #endif
+diff --git a/components/service/crypto/client/caller/stub/crypto_caller_=
aead.h b/components/service/crypto/client/caller/stub/crypto_caller_aead.=
h
+index 18aa8cec..455e7ac1 100644
+--- a/components/service/crypto/client/caller/stub/crypto_caller_aead.h
++++ b/components/service/crypto/client/caller/stub/crypto_caller_aead.h
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
++ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights re=
served.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -135,6 +135,16 @@ static inline psa_status_t crypto_caller_aead_abort=
(struct service_client *conte
+ 	return PSA_ERROR_NOT_SUPPORTED;
+ }
+
++static inline size_t crypto_caller_aead_max_update_ad_size(const struct=
 service_client *context)
++{
++	return 0;
++}
++
++static inline size_t crypto_caller_aead_max_update_size(const struct se=
rvice_client *context)
++{
++	return 0;
++}
++
+ #ifdef __cplusplus
+ }
+ #endif
+diff --git a/components/service/crypto/client/psa/psa_aead.c b/component=
s/service/crypto/client/psa/psa_aead.c
+index 22fd3da1..e4579e63 100644
+--- a/components/service/crypto/client/psa/psa_aead.c
++++ b/components/service/crypto/client/psa/psa_aead.c
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
++ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights re=
served.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -8,37 +8,6 @@
+ #include "psa_crypto_client.h"
+ #include "crypto_caller_selector.h"
+
+-
+-psa_status_t psa_aead_encrypt(psa_key_id_t key,
+-	psa_algorithm_t alg,
+-	const uint8_t *nonce,
+-	size_t nonce_length,
+-	const uint8_t *additional_data,
+-	size_t additional_data_length,
+-	const uint8_t *plaintext,
+-	size_t plaintext_length,
+-	uint8_t *aeadtext,
+-	size_t aeadtext_size,
+-	size_t *aeadtext_length)
+-{
+-	return PSA_ERROR_NOT_SUPPORTED;
+-}
+-
+-psa_status_t psa_aead_decrypt(psa_key_id_t key,
+-	psa_algorithm_t alg,
+-	const uint8_t *nonce,
+-	size_t nonce_length,
+-	const uint8_t *additional_data,
+-	size_t additional_data_length,
+-	const uint8_t *aeadtext,
+-	size_t aeadtext_length,
+-	uint8_t *plaintext,
+-	size_t plaintext_size,
+-	size_t *plaintext_length)
+-{
+-	return PSA_ERROR_NOT_SUPPORTED;
+-}
+-
+ psa_status_t psa_aead_encrypt_setup(psa_aead_operation_t *operation,
+ 	psa_key_id_t key,
+ 	psa_algorithm_t alg)
+@@ -143,3 +112,191 @@ psa_status_t psa_aead_abort(psa_aead_operation_t *=
operation)
+ 	return crypto_caller_aead_abort(&psa_crypto_client_instance.base,
+ 		operation->handle);
+ }
++
++static psa_status_t multi_aead_update_ad(psa_aead_operation_t *operatio=
n,
++	const uint8_t *input,
++	size_t input_length)
++{
++	psa_status_t psa_status =3D PSA_SUCCESS;
++	size_t max_update_size =3D
++		crypto_caller_aead_max_update_ad_size(&psa_crypto_client_instance.bas=
e);
++	size_t bytes_input =3D 0;
++
++	if (!max_update_size) {
++
++		/* Don't know the max update size so assume that the entire
++		 * input and output can be handled in a single update.  If
++		 * this isn't true, the first aead update operation will fail
++		 * safely.
++		 */
++		max_update_size =3D input_length;
++	}
++
++	while (bytes_input < input_length) {
++
++		size_t bytes_remaining =3D input_length - bytes_input;
++		size_t update_len =3D (bytes_remaining < max_update_size) ?
++			bytes_remaining :
++			max_update_size;
++
++		psa_status =3D psa_aead_update_ad(operation,
++			&input[bytes_input], update_len);
++
++		if (psa_status !=3D PSA_SUCCESS) break;
++
++		bytes_input +=3D update_len;
++	}
++
++	return psa_status;
++}
++
++static psa_status_t multi_aead_update(psa_aead_operation_t *operation,
++	const uint8_t *input,
++	size_t input_length,
++	uint8_t *output,
++	size_t output_size,
++	size_t *output_length)
++{
++	psa_status_t psa_status =3D PSA_SUCCESS;
++	size_t max_update_size =3D
++		crypto_caller_aead_max_update_size(&psa_crypto_client_instance.base);
++	size_t bytes_input =3D 0;
++	size_t bytes_output =3D 0;
++
++	*output_length =3D 0;
++
++	if (!max_update_size) {
++
++		/* Don't know the max update size so assume that the entire
++		 * input and output can be handled in a single update.  If
++		 * this isn't true, the first aead update operation will fail
++		 * safely.
++		 */
++		max_update_size =3D input_length;
++	}
++
++	while ((bytes_input < input_length) && (bytes_output < output_size)) {
++
++		size_t update_output_len =3D 0;
++		size_t bytes_remaining =3D input_length - bytes_input;
++		size_t update_len =3D (bytes_remaining < max_update_size) ?
++			bytes_remaining :
++			max_update_size;
++
++		psa_status =3D psa_aead_update(operation,
++			&input[bytes_input], update_len,
++			&output[bytes_output], output_size - bytes_output, &update_output_le=
n);
++
++		if (psa_status !=3D PSA_SUCCESS) break;
++
++		bytes_input +=3D update_len;
++		bytes_output +=3D update_output_len;
++	}
++
++	if (psa_status =3D=3D PSA_SUCCESS) {
++
++		*output_length =3D bytes_output;
++	}
++
++	return psa_status;
++}
++
++psa_status_t psa_aead_encrypt(psa_key_id_t key,
++	psa_algorithm_t alg,
++	const uint8_t *nonce,
++	size_t nonce_length,
++	const uint8_t *additional_data,
++	size_t additional_data_length,
++	const uint8_t *plaintext,
++	size_t plaintext_length,
++	uint8_t *aeadtext,
++	size_t aeadtext_size,
++	size_t *aeadtext_length)
++{
++	psa_aead_operation_t operation =3D psa_aead_operation_init();
++	size_t bytes_output =3D 0;
++	*aeadtext_length =3D 0;
++
++	psa_status_t psa_status =3D psa_aead_encrypt_setup(&operation, key, al=
g);
++	if (psa_status !=3D PSA_SUCCESS) return psa_status;
++
++	if ((psa_status =3D psa_aead_set_lengths(&operation, additional_data_l=
ength, plaintext_length),
++			psa_status =3D=3D PSA_SUCCESS) &&
++		(psa_status =3D psa_aead_set_nonce(&operation, nonce, nonce_length),
++			psa_status =3D=3D PSA_SUCCESS) &&
++		(psa_status =3D multi_aead_update_ad(&operation, additional_data, add=
itional_data_length),
++			psa_status =3D=3D PSA_SUCCESS) &&
++		(psa_status =3D multi_aead_update(&operation, plaintext, plaintext_le=
ngth,
++			aeadtext, aeadtext_size, &bytes_output),
++			psa_status =3D=3D PSA_SUCCESS))
++	{
++		size_t remaining_aead_len =3D 0;
++		size_t tag_len =3D 0;
++
++		psa_status =3D psa_aead_finish(&operation,
++			NULL, 0, &remaining_aead_len,
++			&aeadtext[bytes_output], aeadtext_size - bytes_output, &tag_len);
++
++		if (psa_status =3D=3D PSA_SUCCESS) {
++
++			*aeadtext_length =3D bytes_output + remaining_aead_len + tag_len;
++		}
++	}
++	else {
++
++		psa_aead_abort(&operation);
++	}
++
++	return psa_status;
++}
++
++psa_status_t psa_aead_decrypt(psa_key_id_t key,
++	psa_algorithm_t alg,
++	const uint8_t *nonce,
++	size_t nonce_length,
++	const uint8_t *additional_data,
++	size_t additional_data_length,
++	const uint8_t *aeadtext,
++	size_t aeadtext_length,
++	uint8_t *plaintext,
++	size_t plaintext_size,
++	size_t *plaintext_length)
++{
++	psa_aead_operation_t operation =3D psa_aead_operation_init();
++	size_t bytes_output =3D 0;
++	*plaintext_length =3D 0;
++
++	psa_status_t psa_status =3D psa_aead_decrypt_setup(&operation, key, al=
g);
++	if (psa_status !=3D PSA_SUCCESS) return psa_status;
++
++	size_t tag_len =3D PSA_ALG_AEAD_GET_TAG_LENGTH(alg);
++	size_t ciphertext_len =3D (aeadtext_length > tag_len) ? aeadtext_lengt=
h - tag_len : 0;
++
++	if ((psa_status =3D psa_aead_set_lengths(&operation, additional_data_l=
ength, ciphertext_len),
++			psa_status =3D=3D PSA_SUCCESS) &&
++		(psa_status =3D psa_aead_set_nonce(&operation, nonce, nonce_length),
++			psa_status =3D=3D PSA_SUCCESS) &&
++		(psa_status =3D multi_aead_update_ad(&operation, additional_data, add=
itional_data_length),
++			psa_status =3D=3D PSA_SUCCESS) &&
++		(psa_status =3D multi_aead_update(&operation, aeadtext, ciphertext_le=
n,
++			plaintext, plaintext_size, &bytes_output),
++			psa_status =3D=3D PSA_SUCCESS))
++	{
++		size_t remaining_plaintext_len =3D 0;
++
++		psa_status =3D psa_aead_verify(&operation,
++			NULL, 0, &remaining_plaintext_len,
++			&aeadtext[bytes_output], aeadtext_length - bytes_output);
++
++		if (psa_status =3D=3D PSA_SUCCESS) {
++
++			*plaintext_length =3D bytes_output + remaining_plaintext_len;
++		}
++	}
++	else {
++
++		psa_aead_abort(&operation);
++	}
++
++	return psa_status;
++}
+diff --git a/components/service/crypto/factory/full/crypto_provider_fact=
ory.c b/components/service/crypto/factory/full/crypto_provider_factory.c
+index 2d926eb6..ee2b4473 100644
+--- a/components/service/crypto/factory/full/crypto_provider_factory.c
++++ b/components/service/crypto/factory/full/crypto_provider_factory.c
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2021, Arm Limited. All rights reserved.
++ * Copyright (c) 2021-2022, Arm Limited. All rights reserved.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  *
+@@ -17,6 +17,8 @@
+ #include <service/crypto/provider/extension/key_derivation/serializer/p=
acked-c/packedc_key_derivation_provider_serializer.h>
+ #include <service/crypto/provider/extension/mac/mac_provider.h>
+ #include <service/crypto/provider/extension/mac/serializer/packed-c/pac=
kedc_mac_provider_serializer.h>
++#include <service/crypto/provider/extension/aead/aead_provider.h>
++#include <service/crypto/provider/extension/aead/serializer/packed-c/pa=
ckedc_aead_provider_serializer.h>
+ #include <service/discovery/provider/discovery_provider.h>
+ #include <service/discovery/provider/serializer/packed-c/packedc_discov=
ery_provider_serializer.h>
+
+@@ -34,6 +36,7 @@ static struct full_crypto_provider
+ 	struct cipher_provider cipher_provider;
+ 	struct key_derivation_provider key_derivation_provider;
+ 	struct mac_provider mac_provider;
++	struct aead_provider aead_provider;
+
+ } instance;
+
+@@ -98,6 +101,17 @@ struct crypto_provider *crypto_provider_factory_crea=
te(void)
+ 	crypto_provider_extend(&instance.crypto_provider,
+ 		&instance.mac_provider.base_provider);
+
++	/**
++	 * Extend with aead operations
++	 */
++	aead_provider_init(&instance.aead_provider);
++
++	aead_provider_register_serializer(&instance.aead_provider,
++		TS_RPC_ENCODING_PACKED_C, packedc_aead_provider_serializer_instance()=
);
++
++	crypto_provider_extend(&instance.crypto_provider,
++		&instance.aead_provider.base_provider);
++
+ 	return &instance.crypto_provider;
+ }
+
+diff --git a/deployments/component-test/component-test.cmake b/deploymen=
ts/component-test/component-test.cmake
+index a0233c34..c3b015ab 100644
+--- a/deployments/component-test/component-test.cmake
++++ b/deployments/component-test/component-test.cmake
+@@ -1,5 +1,5 @@
+ #----------------------------------------------------------------------=
---------
+-# Copyright (c) 2020-2021, Arm Limited and Contributors. All rights res=
erved.
++# Copyright (c) 2020-2022, Arm Limited and Contributors. All rights res=
erved.
+ #
+ # SPDX-License-Identifier: BSD-3-Clause
+ #
+@@ -85,6 +85,8 @@ add_components(
+ 		"components/service/crypto/provider/extension/key_derivation/serializ=
er/packed-c"
+ 		"components/service/crypto/provider/extension/mac"
+ 		"components/service/crypto/provider/extension/mac/serializer/packed-c=
"
++		"components/service/crypto/provider/extension/aead"
++		"components/service/crypto/provider/extension/aead/serializer/packed-=
c"
+ 		"components/service/crypto/provider/test"
+ 		"components/service/crypto/backend/mbedcrypto"
+ 		"components/service/crypto/factory/full"
+diff --git a/deployments/crypto/opteesp/CMakeLists.txt b/deployments/cry=
pto/opteesp/CMakeLists.txt
+index 8ada74e9..eb5d0847 100644
+--- a/deployments/crypto/opteesp/CMakeLists.txt
++++ b/deployments/crypto/opteesp/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ #----------------------------------------------------------------------=
---------
+-# Copyright (c) 2020-2021, Arm Limited and Contributors. All rights res=
erved.
++# Copyright (c) 2020-2022, Arm Limited and Contributors. All rights res=
erved.
+ #
+ # SPDX-License-Identifier: BSD-3-Clause
+ #
+@@ -62,6 +62,8 @@ add_components(TARGET "crypto-sp"
+ 		"components/service/crypto/provider/extension/key_derivation/serializ=
er/packed-c"
+ 		"components/service/crypto/provider/extension/mac"
+ 		"components/service/crypto/provider/extension/mac/serializer/packed-c=
"
++		"components/service/crypto/provider/extension/aead"
++		"components/service/crypto/provider/extension/aead/serializer/packed-=
c"
+ 		"components/service/crypto/factory/full"
+ 		"components/service/crypto/backend/mbedcrypto"
+ 		"components/service/crypto/backend/mbedcrypto/trng_adapter/platform"
+diff --git a/deployments/libts/linux-pc/CMakeLists.txt b/deployments/lib=
ts/linux-pc/CMakeLists.txt
+index fc98407c..97eaaa73 100644
+--- a/deployments/libts/linux-pc/CMakeLists.txt
++++ b/deployments/libts/linux-pc/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ #----------------------------------------------------------------------=
---------
+-# Copyright (c) 2020-2021, Arm Limited and Contributors. All rights res=
erved.
++# Copyright (c) 2020-2022, Arm Limited and Contributors. All rights res=
erved.
+ #
+ # SPDX-License-Identifier: BSD-3-Clause
+ #
+@@ -71,6 +71,8 @@ add_components(
+ 		"components/service/crypto/provider/extension/key_derivation/serializ=
er/packed-c"
+ 		"components/service/crypto/provider/extension/mac"
+ 		"components/service/crypto/provider/extension/mac/serializer/packed-c=
"
++		"components/service/crypto/provider/extension/aead"
++		"components/service/crypto/provider/extension/aead/serializer/packed-=
c"
+ 		"components/service/crypto/factory/full"
+ 		"components/service/crypto/backend/mbedcrypto"
+ 		"components/service/crypto/backend/mbedcrypto/trng_adapter/linux"
+diff --git a/deployments/se-proxy/opteesp/CMakeLists.txt b/deployments/s=
e-proxy/opteesp/CMakeLists.txt
+index 953bb716..24a8ca65 100644
+--- a/deployments/se-proxy/opteesp/CMakeLists.txt
++++ b/deployments/se-proxy/opteesp/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ #----------------------------------------------------------------------=
---------
+-# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved=
.
++# Copyright (c) 2021-2022, Arm Limited and Contributors. All rights res=
erved.
+ #
+ # SPDX-License-Identifier: BSD-3-Clause
+ #
+@@ -70,6 +70,8 @@ add_components(TARGET "se-proxy"
+ 		"components/service/crypto/provider/extension/key_derivation/serializ=
er/packed-c"
+ 		"components/service/crypto/provider/extension/mac"
+ 		"components/service/crypto/provider/extension/mac/serializer/packed-c=
"
++		"components/service/crypto/provider/extension/aead"
++		"components/service/crypto/provider/extension/aead/serializer/packed-=
c"
+ 		"components/service/crypto/factory/full"
+ 		"components/service/secure_storage/include"
+ 		"components/service/secure_storage/frontend/secure_storage_provider"
+--
+2.25.1
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0039-Add-IV-generation-to-one-shot-cipher-operation.pat=
ch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/cor=
stone1000/0039-Add-IV-generation-to-one-shot-cipher-operation.patch
new file mode 100644
index 0000000..c4c83c9
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0039-Add-IV-generation-to-one-shot-cipher-operation.patch
@@ -0,0 +1,96 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+
+From 0e743c9e00249b0fe50b1b2d28d06a8568569736 Mon Sep 17 00:00:00 2001
+From: Julian Hall <julian.hall@arm.com>
+Date: Tue, 15 Feb 2022 15:46:58 +0000
+Subject: [PATCH 07/15] Add IV generation to one-shot cipher operation
+
+The functions psa_cipher_encrypt and psa_cipher_decrypt are
+one-shot operations that can take an arbitrary sized input.
+These operations are implemented as client-side functions
+that use multi-part cipher operations to allow large inputs
+to be handled. The existing implementations were missing the
+generation and setting of the IV at the start of the data.
+This was leading to PSA Arch test failures (248 & 249). This
+commit adds the missing IV handling and resolves the test
+failures.
+
+Signed-off-by: Julian Hall <julian.hall@arm.com>
+Change-Id: I4afb555ee7062ebb387e5bb27fb1e082288ad8c7
+---
+ .../service/crypto/client/psa/psa_cipher.c    | 40 +++++++++++++++----
+ 1 file changed, 33 insertions(+), 7 deletions(-)
+
+diff --git a/components/service/crypto/client/psa/psa_cipher.c b/compone=
nts/service/crypto/client/psa/psa_cipher.c
+index 3ab8ea21..111af829 100644
+--- a/components/service/crypto/client/psa/psa_cipher.c
++++ b/components/service/crypto/client/psa/psa_cipher.c
+@@ -8,7 +8,6 @@
+ #include "psa_crypto_client.h"
+ #include "crypto_caller_selector.h"
+
+-
+ psa_status_t psa_cipher_encrypt_setup(psa_cipher_operation_t *operation=
,
+ 	psa_key_id_t key,
+ 	psa_algorithm_t alg)
+@@ -171,9 +170,16 @@ psa_status_t psa_cipher_encrypt(psa_key_id_t key,
+
+ 	if (psa_status =3D=3D PSA_SUCCESS) {
+
++		size_t ciphertext_len =3D 0;
++		size_t iv_len =3D 0;
++
++		psa_cipher_generate_iv(&operation, output, output_size, &iv_len);
++
+ 		psa_status =3D multi_cipher_update(&operation,
+ 			input, input_length,
+-			output, output_size, output_length);
++			&output[iv_len], output_size - iv_len, &ciphertext_len);
++
++		*output_length =3D iv_len + ciphertext_len;
+ 	}
+
+ 	return psa_status;
+@@ -187,14 +193,34 @@ psa_status_t psa_cipher_decrypt(psa_key_id_t key,
+ 	size_t output_size,
+ 	size_t *output_length)
+ {
+-	psa_cipher_operation_t operation =3D psa_cipher_operation_init();
+-	psa_status_t psa_status =3D psa_cipher_decrypt_setup(&operation, key, =
alg);
++	psa_key_attributes_t attributes =3D PSA_KEY_ATTRIBUTES_INIT;
++	psa_status_t psa_status =3D psa_get_key_attributes(key, &attributes);
+
+ 	if (psa_status =3D=3D PSA_SUCCESS) {
+
+-		psa_status =3D multi_cipher_update(&operation,
+-			input, input_length,
+-			output, output_size, output_length);
++		psa_cipher_operation_t operation =3D psa_cipher_operation_init();
++		psa_status =3D psa_cipher_decrypt_setup(&operation, key, alg);
++
++		if (psa_status =3D=3D PSA_SUCCESS) {
++
++			size_t iv_len =3D PSA_CIPHER_IV_LENGTH(psa_get_key_type(&attributes)=
, alg);
++
++			if (input_length >=3D iv_len) {
++
++				psa_cipher_set_iv(&operation, input, iv_len);
++
++				psa_status =3D multi_cipher_update(&operation,
++					&input[iv_len], input_length - iv_len,
++					output, output_size, output_length);
++			}
++			else {
++
++				psa_cipher_abort(&operation);
++				psa_status =3D PSA_ERROR_INVALID_ARGUMENT;
++			}
++		}
++
++		psa_reset_key_attributes(&attributes);
+ 	}
+
+ 	return psa_status;
+--
+2.25.1
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0040-Fix-multi-part-termination-on-error.patch b/meta-a=
rm-bsp/recipes-security/trusted-services/secure-partitions/corstone1000/0=
040-Fix-multi-part-termination-on-error.patch
new file mode 100644
index 0000000..05e3b97
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0040-Fix-multi-part-termination-on-error.patch
@@ -0,0 +1,241 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+
+From 51563497958036271a23de8ae28f174db1296689 Mon Sep 17 00:00:00 2001
+From: Julian Hall <julian.hall@arm.com>
+Date: Wed, 16 Feb 2022 10:37:04 +0000
+Subject: [PATCH 08/15] Fix multi-part termination on error
+
+For multi-part operations, the PSA Crypto API specifies that if
+the final operation does not return PSA_SUCCESS, the abort
+operaion must be called by a client to clean-up the operation.
+This change modifies behaviour in-line with the API definition.
+
+Signed-off-by: Julian Hall <julian.hall@arm.com>
+Change-Id: Ia3d3ec004164647a7ab5988cac45c39c22e76e9a
+---
+ components/service/crypto/client/psa/psa_aead.c       |  8 ++++++++
+ components/service/crypto/client/psa/psa_cipher.c     |  4 ++++
+ components/service/crypto/client/psa/psa_hash.c       | 10 ++++++++++
+ components/service/crypto/client/psa/psa_mac.c        | 10 ++++++++++
+ .../crypto/provider/extension/aead/aead_provider.c    | 10 +++++-----
+ .../provider/extension/cipher/cipher_provider.c       |  6 +++---
+ .../crypto/provider/extension/hash/hash_provider.c    |  6 +++---
+ .../crypto/provider/extension/mac/mac_provider.c      | 11 +++++++----
+ 8 files changed, 50 insertions(+), 15 deletions(-)
+
+diff --git a/components/service/crypto/client/psa/psa_aead.c b/component=
s/service/crypto/client/psa/psa_aead.c
+index e4579e63..559eb6a3 100644
+--- a/components/service/crypto/client/psa/psa_aead.c
++++ b/components/service/crypto/client/psa/psa_aead.c
+@@ -241,6 +241,10 @@ psa_status_t psa_aead_encrypt(psa_key_id_t key,
+
+ 			*aeadtext_length =3D bytes_output + remaining_aead_len + tag_len;
+ 		}
++		else {
++
++			psa_aead_abort(&operation);
++		}
+ 	}
+ 	else {
+
+@@ -292,6 +296,10 @@ psa_status_t psa_aead_decrypt(psa_key_id_t key,
+
+ 			*plaintext_length =3D bytes_output + remaining_plaintext_len;
+ 		}
++		else {
++
++			psa_aead_abort(&operation);
++		}
+ 	}
+ 	else {
+
+diff --git a/components/service/crypto/client/psa/psa_cipher.c b/compone=
nts/service/crypto/client/psa/psa_cipher.c
+index 111af829..4e4264b6 100644
+--- a/components/service/crypto/client/psa/psa_cipher.c
++++ b/components/service/crypto/client/psa/psa_cipher.c
+@@ -146,6 +146,10 @@ static psa_status_t multi_cipher_update(psa_cipher_=
operation_t *operation,
+
+ 				*output_length =3D bytes_output + finish_output_len;
+ 			}
++			else {
++
++				psa_cipher_abort(operation);
++			}
+ 		}
+ 		else {
+
+diff --git a/components/service/crypto/client/psa/psa_hash.c b/component=
s/service/crypto/client/psa/psa_hash.c
+index 83278de6..e5dd0030 100644
+--- a/components/service/crypto/client/psa/psa_hash.c
++++ b/components/service/crypto/client/psa/psa_hash.c
+@@ -137,6 +137,11 @@ psa_status_t psa_hash_compare(psa_algorithm_t alg,
+ 	if (psa_status =3D=3D PSA_SUCCESS) {
+
+ 		psa_status =3D psa_hash_verify(&operation, hash, hash_length);
++
++		if (psa_status !=3D PSA_SUCCESS) {
++
++			psa_hash_abort(&operation);
++		}
+ 	}
+
+ 	return psa_status;
+@@ -155,6 +160,11 @@ psa_status_t psa_hash_compute(psa_algorithm_t alg,
+ 	if (psa_status =3D=3D PSA_SUCCESS) {
+
+ 		psa_status =3D psa_hash_finish(&operation, hash, hash_size, hash_leng=
th);
++
++		if (psa_status !=3D PSA_SUCCESS) {
++
++			psa_hash_abort(&operation);
++		}
+ 	}
+
+ 	return psa_status;
+diff --git a/components/service/crypto/client/psa/psa_mac.c b/components=
/service/crypto/client/psa/psa_mac.c
+index 5c5eb32a..a3db8644 100644
+--- a/components/service/crypto/client/psa/psa_mac.c
++++ b/components/service/crypto/client/psa/psa_mac.c
+@@ -129,6 +129,11 @@ psa_status_t psa_mac_verify(psa_key_id_t key,
+ 	if (psa_status =3D=3D PSA_SUCCESS) {
+
+ 		psa_status =3D psa_mac_verify_finish(&operation, mac, mac_length);
++
++		if (psa_status !=3D PSA_SUCCESS) {
++
++			psa_mac_abort(&operation);
++		}
+ 	}
+
+ 	return psa_status;
+@@ -153,6 +158,11 @@ psa_status_t psa_mac_compute(psa_key_id_t key,
+ 	if (psa_status =3D=3D PSA_SUCCESS) {
+
+ 		psa_status =3D psa_mac_sign_finish(&operation, mac, mac_size, mac_len=
gth);
++
++		if (psa_status !=3D PSA_SUCCESS) {
++
++			psa_mac_abort(&operation);
++		}
+ 	}
+
+ 	return psa_status;
+diff --git a/components/service/crypto/provider/extension/aead/aead_prov=
ider.c b/components/service/crypto/provider/extension/aead/aead_provider.=
c
+index f4e81a03..14a25436 100644
+--- a/components/service/crypto/provider/extension/aead/aead_provider.c
++++ b/components/service/crypto/provider/extension/aead/aead_provider.c
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
++ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights re=
served.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -369,9 +369,9 @@ static rpc_status_t aead_finish_handler(void *contex=
t, struct call_req *req)
+ 				rpc_status =3D serializer->serialize_aead_finish_resp(resp_buf,
+ 					ciphertext, ciphertext_len,
+ 					tag, tag_len);
+-			}
+
+-			crypto_context_pool_free(&this_instance->context_pool, crypto_contex=
t);
++				crypto_context_pool_free(&this_instance->context_pool, crypto_conte=
xt);
++			}
+ 		}
+
+ 		call_req_set_opstatus(req, psa_status);
+@@ -418,9 +418,9 @@ static rpc_status_t aead_verify_handler(void *contex=
t, struct call_req *req)
+ 				struct call_param_buf *resp_buf =3D call_req_get_resp_buf(req);
+ 				rpc_status =3D serializer->serialize_aead_verify_resp(resp_buf,
+ 					plaintext, plaintext_len);
+-			}
+
+-			crypto_context_pool_free(&this_instance->context_pool, crypto_contex=
t);
++				crypto_context_pool_free(&this_instance->context_pool, crypto_conte=
xt);
++			}
+ 		}
+
+ 		call_req_set_opstatus(req, psa_status);
+diff --git a/components/service/crypto/provider/extension/cipher/cipher_=
provider.c b/components/service/crypto/provider/extension/cipher/cipher_p=
rovider.c
+index 8e7a86de..a5dd0371 100644
+--- a/components/service/crypto/provider/extension/cipher/cipher_provide=
r.c
++++ b/components/service/crypto/provider/extension/cipher/cipher_provide=
r.c
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
++ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights re=
served.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -283,9 +283,9 @@ static rpc_status_t cipher_finish_handler(void *cont=
ext, struct call_req* req)
+
+ 				struct call_param_buf *resp_buf =3D call_req_get_resp_buf(req);
+ 				rpc_status =3D serializer->serialize_cipher_finish_resp(resp_buf, o=
utput, output_len);
+-			}
+
+-			crypto_context_pool_free(&this_instance->context_pool, crypto_contex=
t);
++				crypto_context_pool_free(&this_instance->context_pool, crypto_conte=
xt);
++			}
+ 		}
+
+ 		call_req_set_opstatus(req, psa_status);
+diff --git a/components/service/crypto/provider/extension/hash/hash_prov=
ider.c b/components/service/crypto/provider/extension/hash/hash_provider.=
c
+index 2c560513..fd39d440 100644
+--- a/components/service/crypto/provider/extension/hash/hash_provider.c
++++ b/components/service/crypto/provider/extension/hash/hash_provider.c
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
++ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights re=
served.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -179,9 +179,9 @@ static rpc_status_t hash_finish_handler(void *contex=
t, struct call_req* req)
+
+ 				struct call_param_buf *resp_buf =3D call_req_get_resp_buf(req);
+ 				rpc_status =3D serializer->serialize_hash_finish_resp(resp_buf, has=
h, hash_len);
+-			}
+
+-			crypto_context_pool_free(&this_instance->context_pool, crypto_contex=
t);
++				crypto_context_pool_free(&this_instance->context_pool, crypto_conte=
xt);
++			}
+ 		}
+
+ 		call_req_set_opstatus(req, psa_status);
+diff --git a/components/service/crypto/provider/extension/mac/mac_provid=
er.c b/components/service/crypto/provider/extension/mac/mac_provider.c
+index 96fe4cf3..eef55586 100644
+--- a/components/service/crypto/provider/extension/mac/mac_provider.c
++++ b/components/service/crypto/provider/extension/mac/mac_provider.c
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
++ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights re=
served.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  */
+@@ -181,9 +181,9 @@ static rpc_status_t mac_sign_finish_handler(void *co=
ntext, struct call_req* req)
+
+ 				struct call_param_buf *resp_buf =3D call_req_get_resp_buf(req);
+ 				rpc_status =3D serializer->serialize_mac_sign_finish_resp(resp_buf,=
 mac, mac_len);
+-			}
+
+-			crypto_context_pool_free(&this_instance->context_pool, crypto_contex=
t);
++				crypto_context_pool_free(&this_instance->context_pool, crypto_conte=
xt);
++			}
+ 		}
+
+ 		call_req_set_opstatus(req, psa_status);
+@@ -220,7 +220,10 @@ static rpc_status_t mac_verify_finish_handler(void =
*context, struct call_req* re
+
+ 			psa_status =3D psa_mac_verify_finish(&crypto_context->op.mac, mac, m=
ac_len);
+
+-			crypto_context_pool_free(&this_instance->context_pool, crypto_contex=
t);
++			if (psa_status =3D=3D PSA_SUCCESS) {
++
++				crypto_context_pool_free(&this_instance->context_pool, crypto_conte=
xt);
++			}
+ 		}
+
+ 		call_req_set_opstatus(req, psa_status);
+--
+2.25.1
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0041-Abort-AEAD-operation-if-client-provided-buffer-is-=
to.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitio=
ns/corstone1000/0041-Abort-AEAD-operation-if-client-provided-buffer-is-to=
.patch
new file mode 100644
index 0000000..84f71e5
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0041-Abort-AEAD-operation-if-client-provided-buffer-is-to.patc=
h
@@ -0,0 +1,50 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+
+From c0549d9949d9c19a120b7bde3409201a5db8f2b2 Mon Sep 17 00:00:00 2001
+From: Julian Hall <julian.hall@arm.com>
+Date: Wed, 16 Feb 2022 11:36:09 +0000
+Subject: [PATCH 09/15] Abort AEAD operation if client provided buffer is=
 too
+ small
+
+To enable PSA Arch test c258 to pass, handling is added in the
+PSA API client adaptor for AEAD (psa_aead.c) to abort an AEAD
+operation if an update operation is performed but the client
+provided buffer for the output is too small.
+
+Signed-off-by: Julian Hall <julian.hall@arm.com>
+Change-Id: Ib4b26ebc0a83a8928e1b643fba4becd935f6deb0
+---
+ components/service/crypto/client/psa/psa_aead.c | 14 +++++++++++++-
+ 1 file changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/components/service/crypto/client/psa/psa_aead.c b/component=
s/service/crypto/client/psa/psa_aead.c
+index 559eb6a3..c820d222 100644
+--- a/components/service/crypto/client/psa/psa_aead.c
++++ b/components/service/crypto/client/psa/psa_aead.c
+@@ -74,10 +74,22 @@ psa_status_t psa_aead_update(psa_aead_operation_t *o=
peration,
+ 	size_t output_size,
+ 	size_t *output_length)
+ {
+-	return crypto_caller_aead_update(&psa_crypto_client_instance.base,
++	psa_status_t status =3D crypto_caller_aead_update(&psa_crypto_client_i=
nstance.base,
+ 		operation->handle,
+ 		input, input_length,
+ 		output, output_size, output_length);
++
++	/*
++	 * If too small a buffer has been provided for the output, the operati=
on
++	 * state will have been updated but the result can't be put anywhere. =
This
++	 * is an unrecoveral condition so abort the operation.
++	 */
++	if (status =3D=3D PSA_ERROR_BUFFER_TOO_SMALL) {
++
++		psa_aead_abort(operation);
++	}
++
++	return status;
+ }
+
+ psa_status_t psa_aead_finish(psa_aead_operation_t *operation,
+--
+2.25.1
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0042-Peg-to-updated-t_cose-version-fc3a4b2c.patch b/met=
a-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone100=
0/0042-Peg-to-updated-t_cose-version-fc3a4b2c.patch
new file mode 100644
index 0000000..8ba59e0
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0042-Peg-to-updated-t_cose-version-fc3a4b2c.patch
@@ -0,0 +1,95 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+
+From 9fb18f0cfba8f97fa71a5e7e7e3e31a43692a8e0 Mon Sep 17 00:00:00 2001
+From: Julian Hall <julian.hall@arm.com>
+Date: Tue, 11 Jan 2022 09:43:52 +0000
+Subject: [PATCH 10/15] Peg to updated t_cose version fc3a4b2c
+
+The current version of TS fails to build due to a regression introduced
+by a new t_cose version in the upstream project.
+The issue is caused by the t_cose external component incorrectly using
+tip of master as the upstream version id, which makes strict dependency
+control impossible. Change the upstream version id to an SHA, to enable
+controlling compatibility issues introduced by future upstream updates.
+
+At the same time update the dependency to the current latest version.
+The upstream project is now compatile with mbedtls 3.0.0 API changes
+so the previously required compatibility patch has been removed.
+
+Signed-off-by: Julian Hall <julian.hall@arm.com>
+Change-Id: I9491a5210904cc369846da2af45b0f7e5913bed8
+---
+ .../0002-add-tls3_0_0-compatibility.patch     | 31 -------------------
+ external/t_cose/t_cose.cmake                  |  5 ++-
+ 2 files changed, 2 insertions(+), 34 deletions(-)
+ delete mode 100644 external/t_cose/0002-add-tls3_0_0-compatibility.patc=
h
+
+diff --git a/external/t_cose/0002-add-tls3_0_0-compatibility.patch b/ext=
ernal/t_cose/0002-add-tls3_0_0-compatibility.patch
+deleted file mode 100644
+index 20a7d131..00000000
+--- a/external/t_cose/0002-add-tls3_0_0-compatibility.patch
++++ /dev/null
+@@ -1,31 +0,0 @@
+-diff --git a/crypto_adapters/t_cose_psa_crypto.c b/crypto_adapters/t_co=
se_psa_crypto.c
+-index 49c5b60..3aa7b58 100644
+---- a/crypto_adapters/t_cose_psa_crypto.c
+-+++ b/crypto_adapters/t_cose_psa_crypto.c
+-@@ -99,7 +99,7 @@ static enum t_cose_err_t psa_status_to_t_cose_error_s=
igning(psa_status_t err)
+-            err =3D=3D PSA_ERROR_INVALID_SIGNATURE   ? T_COSE_ERR_SIG_V=
ERIFY :
+-            err =3D=3D PSA_ERROR_NOT_SUPPORTED       ? T_COSE_ERR_UNSUP=
PORTED_SIGNING_ALG:
+-            err =3D=3D PSA_ERROR_INSUFFICIENT_MEMORY ? T_COSE_ERR_INSUF=
FICIENT_MEMORY :
+--           err =3D=3D PSA_ERROR_TAMPERING_DETECTED  ? T_COSE_ERR_TAMPE=
RING_DETECTED :
+-+           err =3D=3D PSA_ERROR_CORRUPTION_DETECTED ? T_COSE_ERR_TAMPE=
RING_DETECTED :
+-                                                   T_COSE_ERR_SIG_FAIL;
+- }
+-=20
+-@@ -152,7 +152,7 @@ t_cose_crypto_pub_key_verify(int32_t               =
cose_algorithm_id,
+-      * Crypto ceases providing backwards compatibility then this code
+-      * has to be changed to use psa_verify_hash().
+-      */
+--    psa_result =3D psa_asymmetric_verify(verification_key_psa,
+-+    psa_result =3D psa_verify_hash(verification_key_psa,
+-                                        psa_alg_id,
+-                                        hash_to_verify.ptr,
+-                                        hash_to_verify.len,
+-@@ -212,7 +212,7 @@ t_cose_crypto_pub_key_sign(int32_t                c=
ose_algorithm_id,
+-      * providing backwards compatibility then this code has to be
+-      * changed to use psa_sign_hash().
+-      */
+--    psa_result =3D psa_asymmetric_sign(signing_key_psa,
+-+    psa_result =3D psa_sign_hash(signing_key_psa,
+-                                      psa_alg_id,
+-                                      hash_to_sign.ptr,
+-                                      hash_to_sign.len,
+diff --git a/external/t_cose/t_cose.cmake b/external/t_cose/t_cose.cmake
+index 660824bd..9321466f 100644
+--- a/external/t_cose/t_cose.cmake
++++ b/external/t_cose/t_cose.cmake
+@@ -1,5 +1,5 @@
+ #----------------------------------------------------------------------=
---------
+-# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved=
.
++# Copyright (c) 2021-2022, Arm Limited and Contributors. All rights res=
erved.
+ #
+ # SPDX-License-Identifier: BSD-3-Clause
+ #
+@@ -16,7 +16,7 @@ endif()
+=20
+ # External component details
+ set(T_COSE_URL "https://github.com/laurencelundblade/t_cose.git" CACHE =
STRING "t_cose repository URL")
+-set(T_COSE_REFSPEC "master" CACHE STRING "t_cose git refspec")
++set(T_COSE_REFSPEC "fc3a4b2c7196ff582e8242de8bd4a1bc4eec577f" CACHE STR=
ING "t_cose git refspec")
+ set(T_COSE_INSTALL_PATH "${CMAKE_CURRENT_BINARY_DIR}/t_cose_install" CA=
CHE PATH "t_cose installation directory")
+ set(T_COSE_PACKAGE_PATH "${T_COSE_INSTALL_PATH}/libt_cose/cmake" CACHE =
PATH "t_cose CMake package directory")
+=20
+@@ -37,7 +37,6 @@ FetchContent_Declare(
+=20
+ 	PATCH_COMMAND git stash
+ 		COMMAND git am ${CMAKE_CURRENT_LIST_DIR}/0001-add-install-definition.=
patch
+-		COMMAND git apply ${CMAKE_CURRENT_LIST_DIR}/0002-add-tls3_0_0-compati=
bility.patch
+ 		COMMAND git reset HEAD~1
+=20
+ )
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0043-pass-sysroot_yocto.patch b/meta-arm-bsp/recipes-se=
curity/trusted-services/secure-partitions/corstone1000/0043-pass-sysroot_=
yocto.patch
new file mode 100644
index 0000000..5b2b7ce
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0043-pass-sysroot_yocto.patch
@@ -0,0 +1,111 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+
+From 386a086debf70f739a7dfc0bdce9c4f1053ba8d5 Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Wed, 16 Feb 2022 15:55:55 +0000
+Subject: [PATCH 11/15] pass sysroot_yocto
+
+---
+ deployments/libts/libts-import.cmake         |  3 +++
+ external/MbedTLS/MbedTLS.cmake               |  1 +
+ external/psa_arch_tests/psa_arch_tests.cmake | 25 +++++++++++++-------
+ 3 files changed, 20 insertions(+), 9 deletions(-)
+
+diff --git a/deployments/libts/libts-import.cmake b/deployments/libts/li=
bts-import.cmake
+index 792ba86c..b900ce3f 100644
+--- a/deployments/libts/libts-import.cmake
++++ b/deployments/libts/libts-import.cmake
+@@ -27,9 +27,12 @@ set(LIBTS_BINARY_DIR "${CMAKE_CURRENT_BINARY_DIR}/_de=
ps/libts-build" CACHE PATH
+
+ file(MAKE_DIRECTORY ${LIBTS_BINARY_DIR})
+
++set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} --sysroot=3D${SYSROOT_YOCTO}")
++
+ #Configure the library
+ execute_process(COMMAND
+ 	${CMAKE_COMMAND}
++                -DCMAKE_SYSROOT=3D${SYSROOT_YOCTO}
+ 		-DCMAKE_INSTALL_PREFIX=3D${LIBTS_INSTALL_PATH}
+ 		-GUnix\ Makefiles
+ 		${LIBTS_SOURCE_DIR}
+diff --git a/external/MbedTLS/MbedTLS.cmake b/external/MbedTLS/MbedTLS.c=
make
+index 3350d8a0..33467cf0 100644
+--- a/external/MbedTLS/MbedTLS.cmake
++++ b/external/MbedTLS/MbedTLS.cmake
+@@ -103,6 +103,7 @@ if (NOT MBEDCRYPTO_LIB_FILE)
+ 	execute_process(COMMAND
+ 		${CMAKE_COMMAND} -E env CROSS_COMPILE=3D${CROSS_COMPILE}
+ 			${CMAKE_COMMAND}
++                                -DCMAKE_SYSROOT=3D${SYSROOT_YOCTO}
+ 				-DENABLE_PROGRAMS=3DOFF
+ 				-DENABLE_TESTING=3DOFF
+ 				-DUNSAFE_BUILD=3DON
+diff --git a/external/psa_arch_tests/psa_arch_tests.cmake b/external/psa=
_arch_tests/psa_arch_tests.cmake
+index f6d2fb9f..42f73a37 100644
+--- a/external/psa_arch_tests/psa_arch_tests.cmake
++++ b/external/psa_arch_tests/psa_arch_tests.cmake
+@@ -5,30 +5,33 @@
+ #
+ #----------------------------------------------------------------------=
---------
+
+-# Temporarily using modified tests used for tf-m verification
++# Determine the number of processes to run while running parallel build=
s.
++# Pass -DPROCESSOR_COUNT=3D<n> to cmake to override.
++if(NOT DEFINED PROCESSOR_COUNT)
++	include(ProcessorCount)
++	ProcessorCount(PROCESSOR_COUNT)
++	set(PROCESSOR_COUNT ${PROCESSOR_COUNT} CACHE STRING "Number of cores t=
o use for parallel builds.")
++endif()
++
+ set(PSA_ARCH_TESTS_URL "https://github.com/bensze01/psa-arch-tests.git"=
 CACHE STRING "psa-arch-tests repository URL")
+ set(PSA_ARCH_TESTS_REFSPEC "fix-multipart-aead" CACHE STRING "psa-arch-=
tests git refspec")
+-
+-#set(PSA_ARCH_TESTS_URL "https://github.com/ARM-software/psa-arch-tests=
.git" CACHE STRING "psa-arch-tests repository URL")
+-#set(PSA_ARCH_TESTS_REFSPEC "2a1852252a9b9af655cbe02d5d3c930952d0d798" =
CACHE STRING "psa-arch-tests v22.01_API1.4_ADAC_BETA")
+ set(PSA_ARCH_TESTS_INSTALL_PATH "${CMAKE_CURRENT_BINARY_DIR}/psa-arch-t=
ests_install" CACHE PATH "psa-arch-tests installation directory")
+ set(PSA_ARCH_TESTS_PACKAGE_PATH "${PSA_ARCH_TESTS_INSTALL_PATH}/libpsa-=
arch-tests/cmake" CACHE PATH "psa-arch-tests CMake package directory")
+-set(PSA_ARCH_TESTS_SOURCE_DIR "${CMAKE_CURRENT_BINARY_DIR}/_deps/psa_ar=
ch_tests-src" CACHE PATH "psa-arch-tests source.")
++
++include(FetchContent)
+
+ # Checking git
+ find_program(GIT_COMMAND "git")
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
+-		COMMAND git apply ${CMAKE_CURRENT_LIST_DIR}/modify_attest_config.patc=
h
+ )
+
+ # FetchContent_GetProperties exports psa-arch-tests_SOURCE_DIR and psa-=
arch-tests_BINARY_DIR variables
+@@ -37,7 +40,10 @@ if(NOT psa-arch-tests_POPULATED)
+ 	message(STATUS "Fetching psa-arch-tests")
+ 	FetchContent_Populate(psa-arch-tests)
+ endif()
+-
++else()
++    set(psa-arch-tests_SOURCE_DIR "${TS_ROOT}/../psa-arch-tests")
++    set(psa-arch-tests_BINARY_DIR "${CMAKE_CURRENT_BINARY_DIR}")
++endif()
+ # Ensure list of include paths is separated correctly
+ string(REPLACE ";" "\\;" PSA_ARCH_TESTS_EXTERNAL_INCLUDE_PATHS "${PSA_A=
RCH_TESTS_EXTERNAL_INCLUDE_PATHS}")
+
+@@ -47,6 +53,7 @@ string(REPLACE ";" " " PSA_ARCH_TEST_EXTERNAL_DEFS "${=
PSA_ARCH_TEST_EXTERNAL_DEF
+ # Configure the psa-arch-test library
+ execute_process(COMMAND
+ 	${CMAKE_COMMAND}
++			-DCMAKE_SYSROOT=3D${SYSROOT_YOCTO}
+ 			-DTOOLCHAIN=3DINHERIT
+ 			-DCMAKE_TOOLCHAIN_FILE=3D${TS_EXTERNAL_LIB_TOOLCHAIN_FILE}
+ 			-DPSA_INCLUDE_PATHS=3D${PSA_ARCH_TESTS_EXTERNAL_INCLUDE_PATHS}
+--
+2.25.1
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0044-Fix-Crypto-interface-structure-aligned-with-tf-m-c=
ha.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitio=
ns/corstone1000/0044-Fix-Crypto-interface-structure-aligned-with-tf-m-cha=
.patch
new file mode 100644
index 0000000..94a184e
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0044-Fix-Crypto-interface-structure-aligned-with-tf-m-cha.patc=
h
@@ -0,0 +1,30 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+
+From 8bb6a36a36defc9e6cc234404276bf5fea8e8ad4 Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Sun, 13 Feb 2022 09:01:10 +0000
+Subject: [PATCH 12/15] Fix: Crypto interface structure aligned with tf-m
+ change.
+
+NO NEED TO RAISE PR: The PR for this FIX  is raied by Emek.
+---
+ components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/components/service/crypto/backend/psa_ipc/crypto_ipc_backen=
d.h b/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h
+index c13c20e8..ec25eaf8 100644
+--- a/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h
++++ b/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h
+@@ -38,7 +38,8 @@ struct psa_ipc_crypto_pack_iovec {
+ 				      *   multipart operation
+ 				      */
+ 	uint32_t capacity;             /*!< Key derivation capacity */
+-
++	uint32_t ad_length;            /*!< Additional Data length for multipa=
rt AEAD */
++	uint32_t plaintext_length;     /*!< Plaintext length for multipart AEA=
D */
+ 	struct psa_ipc_crypto_aead_pack_input aead_in; /*!< FixMe: Temporarily=
 used for
+ 							    *   AEAD until the API is
+ 							    *   restructured
+--
+2.25.1
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0045-Integrate-remaining-psa-ipc-client-APIs.patch b/me=
ta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone10=
00/0045-Integrate-remaining-psa-ipc-client-APIs.patch
new file mode 100644
index 0000000..0213b86
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0045-Integrate-remaining-psa-ipc-client-APIs.patch
@@ -0,0 +1,494 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+
+From 0469b4650bb011ec157286dbae0f1cef5cbfbe41 Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Sun, 13 Feb 2022 09:49:51 +0000
+Subject: [PATCH 13/15] Integrate remaining psa-ipc client APIs.
+
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+---
+ .../caller/psa_ipc/crypto_caller_aead.h       | 297 +++++++++++++++++-
+ .../caller/psa_ipc/crypto_caller_sign_hash.h  |  35 +++
+ .../psa_ipc/crypto_caller_verify_hash.h       |  33 +-
+ 3 files changed, 352 insertions(+), 13 deletions(-)
+
+diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_aead.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller=
_aead.h
+index 78517fe3..9c64fe62 100644
+--- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_aead=
.h
++++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_aead=
.h
+@@ -152,7 +152,27 @@ static inline psa_status_t crypto_caller_aead_encry=
pt_setup(
+ 					    psa_key_id_t key,
+ 					    psa_algorithm_t alg)
+ {
+-	return PSA_ERROR_NOT_SUPPORTED;
++	struct service_client *ipc =3D context;
++	struct rpc_caller *caller =3D ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov =3D {
++	    .sfn_id =3D TFM_CRYPTO_AEAD_ENCRYPT_SETUP_SID,
++	    .key_id =3D key,
++	    .alg =3D alg,
++	    .op_handle =3D (*op_handle),
++	};
++
++	struct psa_invec in_vec[] =3D {
++	    {.base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cr=
ypto_pack_iovec)}
++	};
++	struct psa_outvec out_vec[] =3D {
++	    {.base =3D psa_ptr_to_u32(op_handle), .len =3D sizeof(uint32_t)}
++	};
++
++	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++	                   IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++	return status;
+ }
+
+ static inline psa_status_t crypto_caller_aead_decrypt_setup(
+@@ -161,7 +181,26 @@ static inline psa_status_t crypto_caller_aead_decry=
pt_setup(
+ 					    psa_key_id_t key,
+ 					    psa_algorithm_t alg)
+ {
+-	return PSA_ERROR_NOT_SUPPORTED;
++	struct service_client *ipc =3D context;
++	struct rpc_caller *caller =3D ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov =3D {
++	    .sfn_id =3D TFM_CRYPTO_AEAD_DECRYPT_SETUP_SID,
++	    .key_id =3D key,
++	    .alg =3D alg,
++	    .op_handle =3D (*op_handle),
++	};
++
++	struct psa_invec in_vec[] =3D {
++	    {.base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cr=
ypto_pack_iovec)}
++	};
++	struct psa_outvec out_vec[] =3D {
++	    {.base =3D psa_ptr_to_u32(op_handle), .len =3D sizeof(uint32_t)}
++	};
++
++	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++	                   IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++	return status;
+ }
+
+ static inline psa_status_t crypto_caller_aead_generate_nonce(
+@@ -171,7 +210,27 @@ static inline psa_status_t crypto_caller_aead_gener=
ate_nonce(
+ 					     size_t nonce_size,
+ 					     size_t *nonce_length)
+ {
+-	return PSA_ERROR_NOT_SUPPORTED;
++	struct service_client *ipc =3D context;
++	struct rpc_caller *caller =3D ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov =3D {
++	    .sfn_id =3D TFM_CRYPTO_AEAD_GENERATE_NONCE_SID,
++	    .op_handle =3D op_handle,
++	};
++
++	struct psa_invec in_vec[] =3D {
++	    {.base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cr=
ypto_pack_iovec)},
++	};
++	struct psa_outvec out_vec[] =3D {
++	    {.base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t)},
++	    {.base =3D psa_ptr_to_u32(nonce), .len =3D nonce_size}
++	};
++
++	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++	                   IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++	*nonce_length =3D out_vec[1].len;
++	return status;
+ }
+
+ static inline psa_status_t crypto_caller_aead_set_nonce(
+@@ -180,7 +239,25 @@ static inline psa_status_t crypto_caller_aead_set_n=
once(
+ 						const uint8_t *nonce,
+ 						size_t nonce_length)
+ {
+-	return PSA_ERROR_NOT_SUPPORTED;
++	struct service_client *ipc =3D context;
++	struct rpc_caller *caller =3D ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov =3D {
++	    .sfn_id =3D TFM_CRYPTO_AEAD_SET_NONCE_SID,
++	    .op_handle =3D op_handle,
++	};
++
++	struct psa_invec in_vec[] =3D {
++	    {.base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cr=
ypto_pack_iovec)},
++	    {.base =3D psa_ptr_to_u32(nonce), .len =3D nonce_length}
++	};
++	struct psa_outvec out_vec[] =3D {
++	    {.base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t)}
++	};
++
++	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++	                   IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++	return status;
+ }
+
+ static inline psa_status_t crypto_caller_aead_set_lengths(
+@@ -189,7 +266,27 @@ static inline psa_status_t crypto_caller_aead_set_l=
engths(
+ 					  size_t ad_length,
+ 					  size_t plaintext_length)
+ {
+-	return PSA_ERROR_NOT_SUPPORTED;
++	struct service_client *ipc =3D context;
++	struct rpc_caller *caller =3D ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov =3D {
++	    .sfn_id =3D TFM_CRYPTO_AEAD_SET_LENGTHS_SID,
++	    .ad_length =3D ad_length,
++	    .plaintext_length =3D plaintext_length,
++	    .op_handle =3D op_handle,
++	};
++
++	struct psa_invec in_vec[] =3D {
++	    {.base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cr=
ypto_pack_iovec)},
++	};
++	struct psa_outvec out_vec[] =3D {
++	    {.base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t)}
++	};
++
++	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++	                   IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++	return status;
+ }
+
+ static inline psa_status_t crypto_caller_aead_update_ad(
+@@ -198,7 +295,35 @@ static inline psa_status_t crypto_caller_aead_updat=
e_ad(
+ 						const uint8_t *input,
+ 						size_t input_length)
+ {
+-	return PSA_ERROR_NOT_SUPPORTED;
++	struct service_client *ipc =3D context;
++	struct rpc_caller *caller =3D ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov =3D {
++	    .sfn_id =3D TFM_CRYPTO_AEAD_UPDATE_AD_SID,
++	    .op_handle =3D op_handle,
++	};
++
++	/* Sanitize the optional input */
++	if ((input =3D=3D NULL) && (input_length !=3D 0)) {
++	    return PSA_ERROR_INVALID_ARGUMENT;
++	}
++
++	struct psa_invec in_vec[] =3D {
++	    {.base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cr=
ypto_pack_iovec)},
++	    {.base =3D psa_ptr_const_to_u32(input), .len =3D input_length}
++	};
++	struct psa_outvec out_vec[] =3D {
++	    {.base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t)}
++	};
++
++	size_t in_len =3D IOVEC_LEN(in_vec);
++
++	if (input =3D=3D NULL) {
++	    in_len--;
++	}
++	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++	                   in_len, out_vec, IOVEC_LEN(out_vec));
++	return status;
+ }
+
+ static inline psa_status_t crypto_caller_aead_update(
+@@ -210,7 +335,38 @@ static inline psa_status_t crypto_caller_aead_updat=
e(
+ 					     size_t output_size,
+ 					     size_t *output_length)
+ {
+-	return PSA_ERROR_NOT_SUPPORTED;
++	struct service_client *ipc =3D context;
++	struct rpc_caller *caller =3D ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov =3D {
++	    .sfn_id =3D TFM_CRYPTO_AEAD_UPDATE_SID,
++	    .op_handle =3D op_handle,
++	};
++
++	/* Sanitize the optional input */
++	if ((input =3D=3D NULL) && (input_length !=3D 0)) {
++	    return PSA_ERROR_INVALID_ARGUMENT;
++	}
++
++	struct psa_invec in_vec[] =3D {
++	    {.base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cr=
ypto_pack_iovec)},
++	    {.base =3D psa_ptr_const_to_u32(input), .len =3D input_length}
++	};
++	struct psa_outvec out_vec[] =3D {
++	    {.base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t)},
++	    {.base =3D psa_ptr_const_to_u32(output), .len =3D output_size},
++	};
++
++	size_t in_len =3D IOVEC_LEN(in_vec);
++
++	if (input =3D=3D NULL) {
++	    in_len--;
++	}
++	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++	                   in_len, out_vec, IOVEC_LEN(out_vec));
++
++	*output_length =3D out_vec[1].len;
++	return status;
+ }
+
+ static inline psa_status_t crypto_caller_aead_finish(
+@@ -223,7 +379,48 @@ static inline psa_status_t crypto_caller_aead_finis=
h(
+ 					     size_t tag_size,
+ 					     size_t *tag_length)
+ {
+-	return PSA_ERROR_NOT_SUPPORTED;
++	struct service_client *ipc =3D context;
++	struct rpc_caller *caller =3D ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov =3D {
++	    .sfn_id =3D TFM_CRYPTO_AEAD_FINISH_SID,
++	    .op_handle =3D op_handle,
++	};
++
++	/* Sanitize the optional output */
++	if ((aeadtext =3D=3D NULL) && (aeadtext_size !=3D 0)) {
++	    return PSA_ERROR_INVALID_ARGUMENT;
++	}
++
++	struct psa_invec in_vec[] =3D {
++	    {.base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cr=
ypto_pack_iovec)},
++	};
++	struct psa_outvec out_vec[] =3D {
++	    {.base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t)},
++	    {.base =3D psa_ptr_const_to_u32(tag), .len =3D tag_size},
++	    {.base =3D psa_ptr_const_to_u32(aeadtext), .len =3D aeadtext_size}
++	};
++
++	size_t out_len =3D IOVEC_LEN(out_vec);
++
++	if (aeadtext =3D=3D NULL || aeadtext_size =3D=3D 0) {
++	    out_len--;
++	}
++	if ((out_len =3D=3D 3) && (aeadtext_length =3D=3D NULL)) {
++	    return PSA_ERROR_INVALID_ARGUMENT;
++	}
++
++	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++	                   IOVEC_LEN(in_vec), out_vec, out_len);
++
++	*tag_length =3D out_vec[1].len;
++
++	if (out_len =3D=3D 3) {
++	    *aeadtext_length =3D out_vec[2].len;
++	} else {
++	    *aeadtext_length =3D 0;
++	}
++	return status;
+ }
+
+ static inline psa_status_t crypto_caller_aead_verify(
+@@ -235,14 +432,94 @@ static inline psa_status_t crypto_caller_aead_veri=
fy(
+ 					     const uint8_t *tag,
+ 					     size_t tag_length)
+ {
+-	return PSA_ERROR_NOT_SUPPORTED;
++	struct service_client *ipc =3D context;
++	struct rpc_caller *caller =3D ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov =3D {
++	    .sfn_id =3D TFM_CRYPTO_AEAD_VERIFY_SID,
++	    .op_handle =3D op_handle,
++	};
++
++	/* Sanitize the optional output */
++	if ((plaintext =3D=3D NULL) && (plaintext_size !=3D 0)) {
++	    return PSA_ERROR_INVALID_ARGUMENT;
++	}
++
++	struct psa_invec in_vec[] =3D {
++	    {.base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cr=
ypto_pack_iovec)},
++	    {.base =3D psa_ptr_const_to_u32(tag), .len =3D tag_length}
++	};
++	struct psa_outvec out_vec[] =3D {
++	    {.base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t)},
++	    {.base =3D psa_ptr_const_to_u32(plaintext), .len =3D plaintext_siz=
e},
++	};
++
++	size_t out_len =3D IOVEC_LEN(out_vec);
++
++	if (plaintext =3D=3D NULL || plaintext_size =3D=3D 0) {
++	    out_len--;
++	}
++	if ((out_len =3D=3D 2) && (plaintext_length =3D=3D NULL)) {
++	    return PSA_ERROR_INVALID_ARGUMENT;
++	}
++
++	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++	                   IOVEC_LEN(in_vec), out_vec, out_len);
++
++	if (out_len =3D=3D 2) {
++	    *plaintext_length =3D out_vec[1].len;
++	} else {
++	    *plaintext_length =3D 0;
++	}
++	return status;
+ }
+
+ static inline psa_status_t crypto_caller_aead_abort(
+ 					    struct service_client *context,
+ 					    uint32_t op_handle)
+ {
+-	return PSA_ERROR_NOT_SUPPORTED;
++	struct service_client *ipc =3D context;
++	struct rpc_caller *caller =3D ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov =3D {
++	    .sfn_id =3D TFM_CRYPTO_AEAD_ABORT_SID,
++	    .op_handle =3D op_handle,
++	};
++
++	struct psa_invec in_vec[] =3D {
++	    {.base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cr=
ypto_pack_iovec)},
++	};
++	struct psa_outvec out_vec[] =3D {
++	    {.base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t)},
++	};
++
++	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++	                   IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++	return status;
++}
++
++static inline size_t crypto_caller_aead_max_update_size(const struct se=
rvice_client *context)
++{
++       /* Returns the maximum number of bytes that may be
++        * carried as a parameter of the mac_update operation
++        *  using the packed-c encoding.
++        */
++       size_t payload_space =3D context->service_info.max_payload;
++       size_t overhead =3D iov_size;
++
++       return (payload_space > overhead) ? payload_space - overhead : 0=
;
++}
++
++static inline size_t crypto_caller_aead_max_update_ad_size(const struct=
 service_client *context)
++{
++	/* Returns the maximum number of bytes that may be
++	 * carried as a parameter of the mac_update operation
++	 *  using the packed-c encoding.
++	 */
++	size_t payload_space =3D context->service_info.max_payload;
++	size_t overhead =3D iov_size;
++
++	return (payload_space > overhead) ? payload_space - overhead : 0;
+ }
+
+ #ifdef __cplusplus
+diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_sign_hash.h b/components/service/crypto/client/caller/psa_ipc/crypto_c=
aller_sign_hash.h
+index 71d88ced..e4a2b167 100644
+--- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_sign=
_hash.h
++++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_sign=
_hash.h
+@@ -57,6 +57,41 @@ static inline psa_status_t crypto_caller_sign_hash(st=
ruct service_client *contex
+ 	return status;
+ }
+
++static inline psa_status_t crypto_caller_sign_message(struct service_cl=
ient *context,
++						   psa_key_id_t id,
++						   psa_algorithm_t alg,
++						   const uint8_t *hash,
++						   size_t hash_length,
++						   uint8_t *signature,
++						   size_t signature_size,
++						   size_t *signature_length)
++{
++	struct service_client *ipc =3D context;
++	struct rpc_caller *caller =3D ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov =3D {
++		.sfn_id =3D TFM_CRYPTO_SIGN_MESSAGE_SID,
++		.key_id =3D id,
++		.alg =3D alg,
++	};
++	struct psa_invec in_vec[] =3D {
++		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
++		{ .base =3D psa_ptr_const_to_u32(hash), .len =3D hash_length },
++	};
++	struct psa_outvec out_vec[] =3D {
++		{ .base =3D psa_ptr_to_u32(signature), .len =3D signature_size },
++	};
++
++	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++	*signature_length =3D out_vec[0].len;
++
++	return status;
++}
++
++
++
+ #ifdef __cplusplus
+ }
+ #endif
+diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_verify_hash.h b/components/service/crypto/client/caller/psa_ipc/crypto=
_caller_verify_hash.h
+index e16f6e54..cc9279ee 100644
+--- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_veri=
fy_hash.h
++++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_veri=
fy_hash.h
+@@ -24,19 +24,20 @@
+ extern "C" {
+ #endif
+
+-static inline psa_status_t crypto_caller_verify_hash(struct service_cli=
ent *context,
++static inline psa_status_t crypto_caller_common(struct service_client *=
context,
+ 						     psa_key_id_t id,
+ 						     psa_algorithm_t alg,
+ 						     const uint8_t *hash,
+ 						     size_t hash_length,
+ 						     const uint8_t *signature,
+-						     size_t signature_length)
++						     size_t signature_length,
++						     uint32_t sfn_id)
+ {
+ 	struct service_client *ipc =3D context;
+ 	struct rpc_caller *caller =3D ipc->caller;
+ 	psa_status_t status;
+ 	struct psa_ipc_crypto_pack_iovec iov =3D {
+-		.sfn_id =3D TFM_CRYPTO_VERIFY_HASH_SID,
++		.sfn_id =3D sfn_id,
+ 		.key_id =3D id,
+ 		.alg =3D alg,
+ 	};
+@@ -52,6 +53,32 @@ static inline psa_status_t crypto_caller_verify_hash(=
struct service_client *cont
+ 	return status;
+ }
+
++static inline psa_status_t crypto_caller_verify_hash(struct service_cli=
ent *context,
++						     psa_key_id_t id,
++						     psa_algorithm_t alg,
++						     const uint8_t *hash,
++						     size_t hash_length,
++						     const uint8_t *signature,
++						     size_t signature_length)
++{
++
++	return crypto_caller_common(context,id,alg,hash,hash_length,
++			signature,signature_length, TFM_CRYPTO_VERIFY_HASH_SID);
++}
++
++static inline psa_status_t crypto_caller_verify_message(struct service_=
client *context,
++						     psa_key_id_t id,
++						     psa_algorithm_t alg,
++						     const uint8_t *hash,
++						     size_t hash_length,
++						     const uint8_t *signature,
++						     size_t signature_length)
++{
++
++	return crypto_caller_common(context,id,alg,hash,hash_length,
++			signature,signature_length, TFM_CRYPTO_VERIFY_MESSAGE_SID);
++}
++
+ #ifdef __cplusplus
+ }
+ #endif
+--
+2.25.1
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0046-Fix-update-psa_set_key_usage_flags-definition-to-t=
he.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitio=
ns/corstone1000/0046-Fix-update-psa_set_key_usage_flags-definition-to-the=
.patch
new file mode 100644
index 0000000..96965fe
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0046-Fix-update-psa_set_key_usage_flags-definition-to-the.patc=
h
@@ -0,0 +1,40 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+
+From b3529f7a5bc1cff193fd0887c0f78348ef6043a4 Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Mon, 14 Feb 2022 17:52:00 +0000
+Subject: [PATCH 14/15] Fix : update psa_set_key_usage_flags definition t=
o the
+ latest from the tf-m
+
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+---
+ components/service/crypto/include/psa/crypto_struct.h | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/components/service/crypto/include/psa/crypto_struct.h b/com=
ponents/service/crypto/include/psa/crypto_struct.h
+index 1bc55e37..b4a7ed4b 100644
+--- a/components/service/crypto/include/psa/crypto_struct.h
++++ b/components/service/crypto/include/psa/crypto_struct.h
+@@ -155,9 +155,19 @@ static inline psa_key_lifetime_t psa_get_key_lifeti=
me(
+     return( attributes->lifetime );
+ }
+
++static inline void psa_extend_key_usage_flags( psa_key_usage_t *usage_f=
lags )
++{
++    if( *usage_flags & PSA_KEY_USAGE_SIGN_HASH )
++        *usage_flags |=3D PSA_KEY_USAGE_SIGN_MESSAGE;
++
++    if( *usage_flags & PSA_KEY_USAGE_VERIFY_HASH )
++        *usage_flags |=3D PSA_KEY_USAGE_VERIFY_MESSAGE;
++}
++
+ static inline void psa_set_key_usage_flags(psa_key_attributes_t *attrib=
utes,
+                                            psa_key_usage_t usage_flags)
+ {
++    psa_extend_key_usage_flags( &usage_flags );
+     attributes->usage =3D usage_flags;
+ }
+
+--
+2.25.1
diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partit=
ions/corstone1000/0047-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch b/=
meta-arm-bsp/recipes-security/trusted-services/secure-partitions/corstone=
1000/0047-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch
new file mode 100644
index 0000000..6e309bf
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/co=
rstone1000/0047-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch
@@ -0,0 +1,120 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+
+From 500a359b65398d0a272a474566659fd5a21f44ff Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Mon, 14 Feb 2022 08:22:25 +0000
+Subject: [PATCH 15/15] Fixes in AEAD for psa-arch test 54 and 58.
+
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+---
+ .../crypto/client/caller/packed-c/crypto_caller_aead.h    | 1 +
+ components/service/crypto/include/psa/crypto_sizes.h      | 2 +-
+ .../crypto/provider/extension/aead/aead_provider.c        | 8 ++++++--
+ .../extension/aead/serializer/aead_provider_serializer.h  | 1 +
+ .../packed-c/packedc_aead_provider_serializer.c           | 2 ++
+ protocols/service/crypto/packed-c/aead.h                  | 1 +
+ 6 files changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/components/service/crypto/client/caller/packed-c/crypto_cal=
ler_aead.h b/components/service/crypto/client/caller/packed-c/crypto_call=
er_aead.h
+index c4ffb20c..a91f66c1 100644
+--- a/components/service/crypto/client/caller/packed-c/crypto_caller_aea=
d.h
++++ b/components/service/crypto/client/caller/packed-c/crypto_caller_aea=
d.h
+@@ -309,6 +309,7 @@ static inline psa_status_t crypto_caller_aead_update=
(struct service_client *cont
+ 	size_t req_len =3D req_fixed_len;
+
+ 	*output_length =3D 0;
++        req_msg.output_size =3D output_size;
+ 	req_msg.op_handle =3D op_handle;
+
+ 	/* Mandatory input data parameter */
+diff --git a/components/service/crypto/include/psa/crypto_sizes.h b/comp=
onents/service/crypto/include/psa/crypto_sizes.h
+index 4d7bf6e9..e3c4df29 100644
+--- a/components/service/crypto/include/psa/crypto_sizes.h
++++ b/components/service/crypto/include/psa/crypto_sizes.h
+@@ -351,7 +351,7 @@
+  *       just the largest size that may be generated by
+  *       #psa_aead_generate_nonce().
+  */
+-#define PSA_AEAD_NONCE_MAX_SIZE 12
++#define PSA_AEAD_NONCE_MAX_SIZE 16
+
+ /** A sufficient output buffer size for psa_aead_update().
+  *
+diff --git a/components/service/crypto/provider/extension/aead/aead_prov=
ider.c b/components/service/crypto/provider/extension/aead/aead_provider.=
c
+index 14a25436..6b144db8 100644
+--- a/components/service/crypto/provider/extension/aead/aead_provider.c
++++ b/components/service/crypto/provider/extension/aead/aead_provider.c
+@@ -283,10 +283,11 @@ static rpc_status_t aead_update_handler(void *cont=
ext, struct call_req *req)
+ 	uint32_t op_handle;
+ 	const uint8_t *input;
+ 	size_t input_len;
++        uint32_t recv_output_size;
+
+ 	if (serializer)
+ 		rpc_status =3D serializer->deserialize_aead_update_req(req_buf, &op_h=
andle,
+-			&input, &input_len);
++			&recv_output_size, &input, &input_len);
+
+ 	if (rpc_status =3D=3D TS_RPC_CALL_ACCEPTED) {
+
+@@ -300,9 +301,12 @@ static rpc_status_t aead_update_handler(void *conte=
xt, struct call_req *req)
+ 		if (crypto_context) {
+
+ 			size_t output_len =3D 0;
+-			size_t output_size =3D PSA_AEAD_UPDATE_OUTPUT_MAX_SIZE(input_len);
++			size_t output_size =3D PSA_AEAD_UPDATE_OUTPUT_MAX_SIZE(24);
+ 			uint8_t *output =3D malloc(output_size);
+
++                        if (recv_output_size < output_size) {
++                            output_size =3D recv_output_size;
++                        }
+ 			if (output) {
+
+ 				psa_status =3D psa_aead_update(&crypto_context->op.aead,
+diff --git a/components/service/crypto/provider/extension/aead/serialize=
r/aead_provider_serializer.h b/components/service/crypto/provider/extensi=
on/aead/serializer/aead_provider_serializer.h
+index bb1a2a97..0156aaba 100644
+--- a/components/service/crypto/provider/extension/aead/serializer/aead_=
provider_serializer.h
++++ b/components/service/crypto/provider/extension/aead/serializer/aead_=
provider_serializer.h
+@@ -51,6 +51,7 @@ struct aead_provider_serializer {
+ 	/* Operation: aead_update */
+ 	rpc_status_t (*deserialize_aead_update_req)(const struct call_param_bu=
f *req_buf,
+ 		uint32_t *op_handle,
++                uint32_t *output_size,
+ 		const uint8_t **input, size_t *input_len);
+
+ 	rpc_status_t (*serialize_aead_update_resp)(struct call_param_buf *resp=
_buf,
+diff --git a/components/service/crypto/provider/extension/aead/serialize=
r/packed-c/packedc_aead_provider_serializer.c b/components/service/crypto=
/provider/extension/aead/serializer/packed-c/packedc_aead_provider_serial=
izer.c
+index 6f00b3e3..45c739ab 100644
+--- a/components/service/crypto/provider/extension/aead/serializer/packe=
d-c/packedc_aead_provider_serializer.c
++++ b/components/service/crypto/provider/extension/aead/serializer/packe=
d-c/packedc_aead_provider_serializer.c
+@@ -192,6 +192,7 @@ static rpc_status_t deserialize_aead_update_ad_req(c=
onst struct call_param_buf *
+ /* Operation: aead_update */
+ static rpc_status_t deserialize_aead_update_req(const struct call_param=
_buf *req_buf,
+ 	uint32_t *op_handle,
++        uint32_t *output_size,
+ 	const uint8_t **input, size_t *input_len)
+ {
+ 	rpc_status_t rpc_status =3D TS_RPC_ERROR_INVALID_REQ_BODY;
+@@ -208,6 +209,7 @@ static rpc_status_t deserialize_aead_update_req(cons=
t struct call_param_buf *req
+ 		memcpy(&recv_msg, req_buf->data, expected_fixed_len);
+
+ 		*op_handle =3D recv_msg.op_handle;
++                *output_size =3D recv_msg.output_size;
+
+ 		tlv_const_iterator_begin(&req_iter,
+ 			(uint8_t*)req_buf->data + expected_fixed_len,
+diff --git a/protocols/service/crypto/packed-c/aead.h b/protocols/servic=
e/crypto/packed-c/aead.h
+index 0be266b5..435fd3b5 100644
+--- a/protocols/service/crypto/packed-c/aead.h
++++ b/protocols/service/crypto/packed-c/aead.h
+@@ -98,6 +98,7 @@ enum
+ struct __attribute__ ((__packed__)) ts_crypto_aead_update_in
+ {
+   uint32_t op_handle;
++  uint32_t output_size;
+ };
+
+ /* Variable length input parameter tags */
+--
+2.25.1
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone10=
00.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.i=
nc
index 0c8a8f6..58bd6dc 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
@@ -6,10 +6,11 @@ LIC_FILES_CHKSUM +=3D "file://../mbedtls/LICENSE;md5=3D=
3b83ef96387f14655fc854ddc3c6b
                      file://../nanopb/LICENSE.txt;md5=3D9db4b73a55a39943=
84112efcdb37c01f \
                      file://../openamp/LICENSE.md;md5=3Da8d8cf662ef6bf99=
36a1e1413585ecbf \
 		     file://../libmetal/LICENSE.md;md5=3Dfe0b8a4beea8f0813b606d15a3df3=
d3c \
+		     file://../psa-arch-tests/LICENSE.md;md5=3D2a944942e1496af1886903d=
274dedb13 \
 		     "
=20
 SRC_URI:append =3D " \
-                  ${SRC_URI_MBEDTLS} ${SRC_URI_NANOPB} ${SRC_URI_OPENAMP=
} ${SRC_URI_LIBMETAL} \
+                  ${SRC_URI_MBEDTLS} ${SRC_URI_NANOPB} ${SRC_URI_OPENAMP=
} ${SRC_URI_LIBMETAL} ${SRC_URI_ARCH-TESTS}\
                   file://0001-tools-cmake-common-applying-lowercase-proj=
ect-convention.patch \
                   file://0002-fix-EARLY_TA_PATHS-env-variable.patch \
                   file://0003-se-proxy-dts-add-se-proxy-as-child-node.pa=
tch \
@@ -42,6 +43,22 @@ SRC_URI:append =3D " \
                   file://0030-Add-missing-features-to-setVariable.patch =
\
                   file://0031-Add-invalid-parameter-check-in-getNextVari=
ableName.patch \
                   file://0032-smm_gateway-add-checks-for-null-attributes=
.patch \
+		  file://0033-Enhance-mbedtls-fetch-process.patch \
+		  file://0034-Fix-format-specifier-in-logging_caller.patch \
+		  file://0035-Update-refspecs-for-mbedtls-and-psa-arch-tests-for-v.pat=
ch \
+		  file://0036-Separate-sign-verify-message-and-hash-operations.patch \
+		  file://0037-Add-defence-against-uninitialised-multi-part-transac.pat=
ch \
+		  file://0038-Integrate-AEAD-operation-support.patch \
+		  file://0039-Add-IV-generation-to-one-shot-cipher-operation.patch \
+		  file://0040-Fix-multi-part-termination-on-error.patch \
+		  file://0041-Abort-AEAD-operation-if-client-provided-buffer-is-to.pat=
ch \
+		  file://0042-Peg-to-updated-t_cose-version-fc3a4b2c.patch \
+		  file://0043-pass-sysroot_yocto.patch \
+		  file://0044-Fix-Crypto-interface-structure-aligned-with-tf-m-cha.pat=
ch \
+		  file://0045-Integrate-remaining-psa-ipc-client-APIs.patch \
+		  file://0046-Fix-update-psa_set_key_usage_flags-definition-to-the.pat=
ch \
+		  file://0047-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch \
+		  file://0003-corstone1000-port-crypto-config.patch;patchdir=3D../psa-=
arch-tests \
                   "
=20
 SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;protocol=3Dhtt=
ps;branch=3Ddevelopment;name=3Dmbedtls;destsuffix=3Dgit/mbedtls"
@@ -56,6 +73,9 @@ SRCREV_openamp =3D "347397decaa43372fc4d00f965640ebde04=
2966d"
 SRC_URI_LIBMETAL =3D "git://github.com/OpenAMP/libmetal.git;name=3Dlibme=
tal;protocol=3Dhttps;branch=3Dmain;destsuffix=3Dgit/libmetal"
 SRCREV_libmetal =3D "f252f0e007fbfb8b3a52b1d5901250ddac96baad"
=20
+SRC_URI_ARCH-TESTS =3D "git://github.com/bensze01/psa-arch-tests.git;nam=
e=3Dpsa-arch-tests;protocol=3Dhttps;nobranch=3D1;destsuffix=3Dgit/psa-arc=
h-tests"
+SRCREV_psa-arch-tests =3D "fix-multipart-aead"
+
 TS_ENVIRONMENT_LINUX =3D "arm-linux"
 TS_PLATFORM =3D "arm/corstone1000"
 TS_ENVIRONMENT =3D "opteesp"
--=20
2.25.1


