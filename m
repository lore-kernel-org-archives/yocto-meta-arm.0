Return-Path: <anton.antonov@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7388AC433FE
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 19:50:31 +0000 (UTC)
Received: from cam-smtp0.cambridge.arm.com (cam-smtp0.cambridge.arm.com [217.140.106.55])
 by mx.groups.io with SMTP id smtpd.web11.1669.1665604229293833107
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 12 Oct 2022 12:50:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.106.55, mailfrom: anton.antonov@arm.com)
Received: from atg-devlab-kelpie.cambridge.arm.com (atg-devlab-kelpie.cambridge.arm.com [10.2.80.92])
	by cam-smtp0.cambridge.arm.com (8.13.8/8.13.8) with ESMTP id 29CJoQt2016293;
	Wed, 12 Oct 2022 20:50:26 +0100
From: Anton Antonov <Anton.Antonov@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Anton.Antonov@arm.com
Subject: [PATCH] arm/trusted-services: Remove remaining patches merged upstream
Date: Wed, 12 Oct 2022 20:50:20 +0100
Message-Id: <20221012195020.3360867-1-Anton.Antonov@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 12 Oct 2022 19:50:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3958

Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
---
 ...ld-settings-to-psa-arch-tests-native.patch |  32 ++
 .../0004-correctly-find-headers-dir.patch     |  30 --
 ...05-setting-sysroot-for-libgcc-lookup.patch |  30 --
 ...pplying-lowercase-project-convention.patch |  32 --
 .../files/0009-PSA-CRYPTO-API-INCLUDE.patch   |  39 --
 ...change-libts-to-export-CMake-package.patch | 346 ------------------
 ...1-Adapt-deployments-to-libts-changes.patch | 197 ----------
 .../files/0012-psa-arch-test-toolchain.patch  |  40 --
 ...QEMU-MM-communication-buffer-address.patch |  29 --
 .../trusted-services/libts_%.bbappend         |   3 +-
 .../trusted-services/libts_git.bb             |   9 +-
 .../trusted-services/trusted-services-src.inc |  10 +-
 .../trusted-services/trusted-services.inc     |   4 +-
 .../0003-Add-newlib-deployment.patch          |  85 -----
 .../ts-newlib/0021-newlib-configure.patch     |  72 ----
 .../trusted-services/ts-newlib_4.1.0.bb       |   8 +-
 .../ts-psa-api-test-common_git.inc            |   2 +-
 .../0012-PSA-TARGET-QCBOR.patch               |  29 --
 .../ts-psa-iat-api-test_git.bb                |   1 -
 .../0013-env-test-no-std-libs.patch           |  33 --
 .../trusted-services/ts-sp-env-test_git.bb    |   4 -
 21 files changed, 44 insertions(+), 991 deletions(-)
 create mode 100644 meta-arm/recipes-security/trusted-services/files/0001-Pass-Yocto-build-settings-to-psa-arch-tests-native.patch
 delete mode 100644 meta-arm/recipes-security/trusted-services/files/0004-correctly-find-headers-dir.patch
 delete mode 100644 meta-arm/recipes-security/trusted-services/files/0005-setting-sysroot-for-libgcc-lookup.patch
 delete mode 100644 meta-arm/recipes-security/trusted-services/files/0006-applying-lowercase-project-convention.patch
 delete mode 100644 meta-arm/recipes-security/trusted-services/files/0009-PSA-CRYPTO-API-INCLUDE.patch
 delete mode 100644 meta-arm/recipes-security/trusted-services/files/0010-change-libts-to-export-CMake-package.patch
 delete mode 100644 meta-arm/recipes-security/trusted-services/files/0011-Adapt-deployments-to-libts-changes.patch
 delete mode 100644 meta-arm/recipes-security/trusted-services/files/0012-psa-arch-test-toolchain.patch
 delete mode 100644 meta-arm/recipes-security/trusted-services/libts/0001-QEMU-MM-communication-buffer-address.patch
 delete mode 100644 meta-arm/recipes-security/trusted-services/ts-newlib/0003-Add-newlib-deployment.patch
 delete mode 100644 meta-arm/recipes-security/trusted-services/ts-newlib/0021-newlib-configure.patch
 delete mode 100644 meta-arm/recipes-security/trusted-services/ts-psa-iat-api-test/0012-PSA-TARGET-QCBOR.patch
 delete mode 100644 meta-arm/recipes-security/trusted-services/ts-sp-env-test/0013-env-test-no-std-libs.patch

diff --git a/meta-arm/recipes-security/trusted-services/files/0001-Pass-Yocto-build-settings-to-psa-arch-tests-native.patch b/meta-arm/recipes-security/trusted-services/files/0001-Pass-Yocto-build-settings-to-psa-arch-tests-native.patch
new file mode 100644
index 00000000..516aa55f
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/files/0001-Pass-Yocto-build-settings-to-psa-arch-tests-native.patch
@@ -0,0 +1,32 @@
+From 3f9b148fe3cad9f1bc6eb08ff8807c54dec5b8d9 Mon Sep 17 00:00:00 2001
+From: Anton Antonov <Anton.Antonov@arm.com>
+Date: Tue, 11 Oct 2022 16:17:15 +0100
+Subject: [PATCH] Pass Yocto build settings to psa-arch-tests native build
+
+PSA-arch-tests need to build a native executable as a part of target build.
+The patch defines correct toolchain settings for native builds.
+
+Upstream-Status: Inappropriate [Yocto build specific change]
+Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
+---
+ api-tests/tools/scripts/target_cfg/CMakeLists.txt | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/api-tests/tools/scripts/target_cfg/CMakeLists.txt b/api-tests/tools/scripts/target_cfg/CMakeLists.txt
+index 259eb9c..fec1fb8 100644
+--- a/api-tests/tools/scripts/target_cfg/CMakeLists.txt
++++ b/api-tests/tools/scripts/target_cfg/CMakeLists.txt
+@@ -26,7 +26,9 @@ include("common/CMakeSettings")
+ include("common/Utils")
+ 
+ # Causes toolchain to be re-evaluated
+-unset(ENV{CC})
++set(ENV{CC} $ENV{BUILD_CC})
++set(ENV{CFLAGS} $ENV{BUILD_CFLAGS})
++set(ENV{LDFLAGS} $ENV{BUILD_LDFLAGS})
+ 
+ # Let the CMake look for C compiler
+ project(TargetConfigGen LANGUAGES C)
+-- 
+2.25.1
+
diff --git a/meta-arm/recipes-security/trusted-services/files/0004-correctly-find-headers-dir.patch b/meta-arm/recipes-security/trusted-services/files/0004-correctly-find-headers-dir.patch
deleted file mode 100644
index b73b5dc3..00000000
--- a/meta-arm/recipes-security/trusted-services/files/0004-correctly-find-headers-dir.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 1b9c8d4a7c9519c6085827da8be6546ce80ee711 Mon Sep 17 00:00:00 2001
-From: Anton Antonov <Anton.Antonov@arm.com>
-Date: Wed, 31 Aug 2022 17:05:14 +0100
-Subject: [PATCH 1/4] Allow to find libgcc headers
-
-Upstream-Status: Pending
-Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
----
- external/newlib/newlib.cmake | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/external/newlib/newlib.cmake b/external/newlib/newlib.cmake
-index fff5e2a..13eb78c 100644
---- a/external/newlib/newlib.cmake
-+++ b/external/newlib/newlib.cmake
-@@ -82,7 +82,10 @@ message(STATUS "libgcc.a is used from ${LIBGCC_PATH}")
- # Moreover the GCC specific header file include directory is also required.
- # Specify LIBGCC_INCLUDE_DIRS in the command line to manually override the libgcc relative location below.
- if(NOT DEFINED LIBGCC_INCLUDE_DIRS)
--	get_filename_component(_TMP_VAR "${LIBGCC_PATH}" DIRECTORY)
-+
-+	# "libgcc.a" lib location in ${LIBGCC_PATH} might not contain a correct path to headers
-+	# We can get the correct path if we ask for a location without a library name
-+	gcc_get_lib_location(LIBRARY_NAME "" RES _TMP_VAR)
- 	set(LIBGCC_INCLUDE_DIRS
- 		"${_TMP_VAR}/include"
- 		"${_TMP_VAR}/include-fixed" CACHE STRING "GCC specific include PATHs")
--- 
-2.25.1
-
diff --git a/meta-arm/recipes-security/trusted-services/files/0005-setting-sysroot-for-libgcc-lookup.patch b/meta-arm/recipes-security/trusted-services/files/0005-setting-sysroot-for-libgcc-lookup.patch
deleted file mode 100644
index b226bc41..00000000
--- a/meta-arm/recipes-security/trusted-services/files/0005-setting-sysroot-for-libgcc-lookup.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 0fbf81d10e0f2aabb80105fabe4ffdf87e28e664 Mon Sep 17 00:00:00 2001
-From: Anton Antonov <Anton.Antonov@arm.com>
-Date: Wed, 31 Aug 2022 17:06:07 +0100
-Subject: [PATCH 2/4] Allow setting sysroot for libgcc lookup
-
-Explicitly pass the new variable LIBGCC_LOCATE_CFLAGS variable when searching
-for the compiler libraries.
-
-Upstream-Status: Pending
-Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
----
- tools/cmake/compiler/GCC.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/cmake/compiler/GCC.cmake b/tools/cmake/compiler/GCC.cmake
-index 5a8fa59..d591c44 100644
---- a/tools/cmake/compiler/GCC.cmake
-+++ b/tools/cmake/compiler/GCC.cmake
-@@ -268,7 +268,7 @@ function(gcc_get_lib_location)
- 	cmake_parse_arguments(MY "${options}" "${oneValueArgs}"
- 						"${multiValueArgs}" ${ARGN} )
- 	execute_process(
--		COMMAND ${CMAKE_C_COMPILER} "--print-file-name=${MY_LIBRARY_NAME}"
-+		COMMAND ${CMAKE_C_COMPILER} ${LIBGCC_LOCATE_CFLAGS} --print-file-name=${MY_LIBRARY_NAME}
- 		OUTPUT_VARIABLE _RES
- 		RESULT_VARIABLE _GCC_ERROR_CODE
- 		OUTPUT_STRIP_TRAILING_WHITESPACE
--- 
-2.25.1
-
diff --git a/meta-arm/recipes-security/trusted-services/files/0006-applying-lowercase-project-convention.patch b/meta-arm/recipes-security/trusted-services/files/0006-applying-lowercase-project-convention.patch
deleted file mode 100644
index 09f38c00..00000000
--- a/meta-arm/recipes-security/trusted-services/files/0006-applying-lowercase-project-convention.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 37559c70443fe85e246f1f652045f0cd3c78012b Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Sat, 13 Nov 2021 07:47:44 +0000
-Subject: [PATCH] tools/cmake/common: applying lowercase project convention
-
-Lowercase convention should only apply on the paths inside TS
-source-code.
-Host build paths should not be lowercased. Otherwise, builds
-with uppercase paths will break.
-
-Upstream-Status: Pending [In review]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
-
-diff --git a/tools/cmake/common/AddPlatform.cmake b/tools/cmake/common/AddPlatform.cmake
-index ae34c6e..31bcd8c 100644
---- a/tools/cmake/common/AddPlatform.cmake
-+++ b/tools/cmake/common/AddPlatform.cmake
-@@ -37,8 +37,8 @@ function(add_platform)
- 	set(TGT ${MY_PARAMS_TARGET} CACHE STRING "")
- 
- 	# Ensure file path conforms to lowercase project convention
--	string(TOLOWER "${TS_PLATFORM_ROOT}/${TS_PLATFORM}/platform.cmake" _platdef)
--	include(${_platdef})
-+	string(TOLOWER "${TS_PLATFORM}/platform.cmake" _platdef)
-+	include(${TS_PLATFORM_ROOT}/${_platdef})
- 	set(CMAKE_CONFIGURE_DEPENDS ${_platdef})
- 
- 	unset(TGT CACHE)
--- 
-2.25.1
-
diff --git a/meta-arm/recipes-security/trusted-services/files/0009-PSA-CRYPTO-API-INCLUDE.patch b/meta-arm/recipes-security/trusted-services/files/0009-PSA-CRYPTO-API-INCLUDE.patch
deleted file mode 100644
index 9054f1c8..00000000
--- a/meta-arm/recipes-security/trusted-services/files/0009-PSA-CRYPTO-API-INCLUDE.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 7f254bf14a97d14d19e61e2b8f8359bc238f3f1b Mon Sep 17 00:00:00 2001
-From: Anton Antonov <Anton.Antonov@arm.com>
-Date: Wed, 31 Aug 2022 17:07:51 +0100
-Subject: [PATCH 3/4] Always define PSA_CRYPTO_API_INCLUDE
-
-PSA_CRYPTO_API_INCLUDE is not defined when pre-built mbedtls was used.
-
-Upstream-Status: Pending
-Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
----
- external/MbedTLS/MbedTLS.cmake | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/external/MbedTLS/MbedTLS.cmake b/external/MbedTLS/MbedTLS.cmake
-index 3193a07..f15e25d 100644
---- a/external/MbedTLS/MbedTLS.cmake
-+++ b/external/MbedTLS/MbedTLS.cmake
-@@ -96,8 +96,6 @@ if (NOT MBEDCRYPTO_LIB_FILE)
- 	#Configure Mbed TLS to build only mbedcrypto lib
- 	execute_process(COMMAND ${Python3_EXECUTABLE} scripts/config.py crypto WORKING_DIRECTORY ${MBEDTLS_SOURCE_DIR})
- 
--	# Advertise Mbed TLS as the provider of the psa crypto API
--	set(PSA_CRYPTO_API_INCLUDE "${MBEDTLS_INSTALL_DIR}/include" CACHE STRING "PSA Crypto API include path")
- 
- 	include(${TS_ROOT}/tools/cmake/common/PropertyCopy.cmake)
- 
-@@ -157,6 +155,9 @@ if (NOT MBEDCRYPTO_LIB_FILE)
- 	set(MBEDCRYPTO_LIB_FILE "${MBEDTLS_INSTALL_DIR}/lib/${CMAKE_STATIC_LIBRARY_PREFIX}mbedcrypto${CMAKE_STATIC_LIBRARY_SUFFIX}")
- endif()
- 
-+# Advertise Mbed TLS as the provider of the psa crypto API
-+set(PSA_CRYPTO_API_INCLUDE "${MBEDTLS_INSTALL_DIR}/include" CACHE STRING "PSA Crypto API include path")
-+
- #Create an imported target to have clean abstraction in the build-system.
- add_library(mbedcrypto STATIC IMPORTED)
- set_property(DIRECTORY ${CMAKE_SOURCE_DIR} APPEND PROPERTY CMAKE_CONFIGURE_DEPENDS ${MBEDCRYPTO_LIB_FILE})
--- 
-2.25.1
-
diff --git a/meta-arm/recipes-security/trusted-services/files/0010-change-libts-to-export-CMake-package.patch b/meta-arm/recipes-security/trusted-services/files/0010-change-libts-to-export-CMake-package.patch
deleted file mode 100644
index 169ef59f..00000000
--- a/meta-arm/recipes-security/trusted-services/files/0010-change-libts-to-export-CMake-package.patch
+++ /dev/null
@@ -1,346 +0,0 @@
-From 0ff5a6163bd2760bb6a61fd5a185a2b92da5e86b Mon Sep 17 00:00:00 2001
-From: Gyorgy Szing <Gyorgy.Szing@arm.com>
-Date: Wed, 20 Jul 2022 12:36:52 +0000
-Subject: [PATCH] Fix: change libts to export a CMake package
-
-libts install content was not compatible to find_module() which made
-using a pre-built libts binary from CMake less than ideal.
-
-This change adds the missing files and updates export and install
-commands to make libts generate a proper CMake package.
-
-From now on an external project will be able to use find_module() to
-integrate libts into its build.
-
-Signed-off-by: Gyorgy Szing <Gyorgy.Szing@arm.com>
-Change-Id: I9e86e02030f6fb3c86af45252110f939cb82670c
-
-Upstream-Status: Pending [In review]
-Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
-
----
-
-diff --git a/components/messaging/ffa/libsp/component.cmake b/components/messaging/ffa/libsp/component.cmake
-index a21c630..ec4cf6c 100644
---- a/components/messaging/ffa/libsp/component.cmake
-+++ b/components/messaging/ffa/libsp/component.cmake
-@@ -1,5 +1,5 @@
- #-------------------------------------------------------------------------------
--# Copyright (c) 2020-2021, Arm Limited and Contributors. All rights reserved.
-+# Copyright (c) 2020-2022, Arm Limited and Contributors. All rights reserved.
- #
- # SPDX-License-Identifier: BSD-3-Clause
- #
-@@ -21,7 +21,7 @@
- 	"${CMAKE_CURRENT_LIST_DIR}/sp_rxtx.c"
- 	)
- 
--set_property(TARGET ${TGT} PROPERTY PUBLIC_HEADER
-+set_property(TARGET ${TGT} APPEND PROPERTY PUBLIC_HEADER
- 	${CMAKE_CURRENT_LIST_DIR}/include/ffa_api.h
- 	${CMAKE_CURRENT_LIST_DIR}/include/ffa_api_defines.h
- 	${CMAKE_CURRENT_LIST_DIR}/include/ffa_api_types.h
-@@ -49,5 +49,5 @@
- target_include_directories(${TGT}
- 	 PUBLIC
- 		"$<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}/include>"
--		"$<INSTALL_INTERFACE:include>"
-+		"$<INSTALL_INTERFACE:${TS_ENV}/include">
- 	)
-diff --git a/components/rpc/common/interface/component.cmake b/components/rpc/common/interface/component.cmake
-index d567602..e4b2477 100644
---- a/components/rpc/common/interface/component.cmake
-+++ b/components/rpc/common/interface/component.cmake
-@@ -1,5 +1,5 @@
- #-------------------------------------------------------------------------------
--# Copyright (c) 2020, Arm Limited and Contributors. All rights reserved.
-+# Copyright (c) 2020-2022, Arm Limited and Contributors. All rights reserved.
- #
- # SPDX-License-Identifier: BSD-3-Clause
- #
-@@ -8,11 +8,12 @@
- 	message(FATAL_ERROR "mandatory parameter TGT is not defined.")
- endif()
- 
--set_property(TARGET ${TGT} PROPERTY RPC_CALLER_PUBLIC_HEADER_FILES
-+set_property(TARGET ${TGT} APPEND PROPERTY PUBLIC_HEADER
- 	"${CMAKE_CURRENT_LIST_DIR}/rpc_caller.h"
- 	"${CMAKE_CURRENT_LIST_DIR}/rpc_status.h"
- 	)
- 
- target_include_directories(${TGT} PUBLIC
--	"${CMAKE_CURRENT_LIST_DIR}"
-+	"$<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}>"
-+	"$<INSTALL_INTERFACE:${TS_ENV}/include>"
- 	)
-diff --git a/components/service/locator/interface/component.cmake b/components/service/locator/interface/component.cmake
-index b5aefa3..84a4d75 100644
---- a/components/service/locator/interface/component.cmake
-+++ b/components/service/locator/interface/component.cmake
-@@ -1,5 +1,5 @@
- #-------------------------------------------------------------------------------
--# Copyright (c) 2020, Arm Limited and Contributors. All rights reserved.
-+# Copyright (c) 2020-2022, Arm Limited and Contributors. All rights reserved.
- #
- # SPDX-License-Identifier: BSD-3-Clause
- #
-@@ -8,10 +8,11 @@
- 	message(FATAL_ERROR "mandatory parameter TGT is not defined.")
- endif()
- 
--set_property(TARGET ${TGT} PROPERTY SERVICE_LOCATOR_PUBLIC_HEADER_FILES
-+set_property(TARGET ${TGT} APPEND PROPERTY PUBLIC_HEADER
- 	"${CMAKE_CURRENT_LIST_DIR}/service_locator.h"
- 	)
- 
- target_include_directories(${TGT} PUBLIC
--	"${CMAKE_CURRENT_LIST_DIR}"
-+	"$<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}>"
-+	"$<INSTALL_INTERFACE:${TS_ENV}/include>"
- 	)
-diff --git a/deployments/libts/libts-import.cmake b/deployments/libts/libts-import.cmake
-index dcabc45..fcfc2ac 100644
---- a/deployments/libts/libts-import.cmake
-+++ b/deployments/libts/libts-import.cmake
-@@ -11,48 +11,18 @@
- # CMake build file allows libts to be built and installed into the binary
- # directory of the dependent.
- #-------------------------------------------------------------------------------
--
--# Determine the number of processes to run while running parallel builds.
--# Pass -DPROCESSOR_COUNT=<n> to cmake to override.
--if(NOT DEFINED PROCESSOR_COUNT)
--	include(ProcessorCount)
--	ProcessorCount(PROCESSOR_COUNT)
--	set(PROCESSOR_COUNT ${PROCESSOR_COUNT} CACHE STRING "Number of cores to use for parallel builds.")
-+option(CFG_FORCE_PREBUILT_LIBTS Off)
-+# Try to find a pre-build package.
-+find_package(libts "1.0.0" QUIET)
-+if(NOT libts_FOUND)
-+	if (CFG_FORCE_PREBUILT_LIBTS)
-+		string(CONCAT _msg "find_package() failed to find the \"libts\" package. Please set libts_DIR or"
-+		                   " CMAKE_FIND_ROOT_PATH properly.\n"
-+						   "If you wish to debug the search process pass -DCMAKE_FIND_DEBUG_MODE=ON to cmake.")
-+		message(FATAL_ERROR ${_msg})
-+	endif()
-+	# If not successful, build libts as a sub-project.
-+	add_subdirectory(${TS_ROOT}/deployments/libts/${TS_ENV} ${CMAKE_BINARY_DIR}/libts)
-+else()
-+	message(STATUS "Using prebuilt libts from ${libts_DIR}")
- endif()
--
--set(LIBTS_INSTALL_PATH "${CMAKE_CURRENT_BINARY_DIR}/libts_install" CACHE PATH "libts installation directory")
--set(LIBTS_PACKAGE_PATH "${LIBTS_INSTALL_PATH}/lib/cmake" CACHE PATH "libts CMake package directory")
--set(LIBTS_SOURCE_DIR "${TS_ROOT}/deployments/libts/${TS_ENV}" CACHE PATH "libts source directory")
--set(LIBTS_BINARY_DIR "${CMAKE_CURRENT_BINARY_DIR}/_deps/libts-build" CACHE PATH "libts binary directory")
--
--file(MAKE_DIRECTORY ${LIBTS_BINARY_DIR})
--
--#Configure the library
--execute_process(COMMAND
--	${CMAKE_COMMAND}
--		-DCMAKE_INSTALL_PREFIX=${LIBTS_INSTALL_PATH}
--		-GUnix\ Makefiles
--		-S ${LIBTS_SOURCE_DIR}
--		-B ${LIBTS_BINARY_DIR}
--	RESULT_VARIABLE _exec_error
--)
--
--if (_exec_error)
--	message(FATAL_ERROR "Configuration step of libts failed with ${_exec_error}.")
--endif()
--
--#Build the library
--execute_process(COMMAND
--	${CMAKE_COMMAND} --build ${LIBTS_BINARY_DIR} --parallel ${PROCESSOR_COUNT} --target install
--	RESULT_VARIABLE _exec_error
--)
--
--if (_exec_error)
--	message(FATAL_ERROR "Build step of libts failed with ${_exec_error}.")
--endif()
--
--# Import the built library
--include(${LIBTS_INSTALL_PATH}/${TS_ENV}/lib/cmake/libts_targets.cmake)
--add_library(libts SHARED IMPORTED)
--set_property(TARGET libts PROPERTY INTERFACE_INCLUDE_DIRECTORIES "${LIBTS_INSTALL_PATH}/${TS_ENV}/include")
--set_property(TARGET libts PROPERTY IMPORTED_LOCATION "${LIBTS_INSTALL_PATH}/${TS_ENV}/lib/${CMAKE_SHARED_LIBRARY_PREFIX}ts${CMAKE_SHARED_LIBRARY_SUFFIX}")
-diff --git a/deployments/libts/libts.cmake b/deployments/libts/libts.cmake
-index 6463ca1..7f278fd 100644
---- a/deployments/libts/libts.cmake
-+++ b/deployments/libts/libts.cmake
-@@ -1,5 +1,5 @@
- #-------------------------------------------------------------------------------
--# Copyright (c) 2020-2021, Arm Limited and Contributors. All rights reserved.
-+# Copyright (c) 2020-2022, Arm Limited and Contributors. All rights reserved.
- #
- # SPDX-License-Identifier: BSD-3-Clause
- #
-@@ -18,12 +18,11 @@
- 					MAJOR _major MINOR _minor PATCH _patch)
- set_target_properties(ts PROPERTIES VERSION "${_major}.${_minor}.${_patch}")
- set_target_properties(ts PROPERTIES SOVERSION "${_major}")
--unset(_major)
--unset(_minor)
--unset(_patch)
-+
-+add_library(libts::ts ALIAS ts)
- 
- #-------------------------------------------------------------------------------
--#  Components that are common accross all deployments
-+#  Components that are common across all deployments
- #
- #-------------------------------------------------------------------------------
- add_components(
-@@ -53,19 +52,13 @@
- #-------------------------------------------------------------------------------
- include(${TS_ROOT}/tools/cmake/common/ExportLibrary.cmake REQUIRED)
- 
--# Select public header files to export
--get_property(_rpc_caller_public_header_files TARGET ts
--	PROPERTY RPC_CALLER_PUBLIC_HEADER_FILES
--)
--
--get_property(_service_locator_public_header_files TARGET ts
--	PROPERTY SERVICE_LOCATOR_PUBLIC_HEADER_FILES
--)
-+get_property(_tmp TARGET ts PROPERTY PUBLIC_HEADER)
- 
- # Exports library information in preparation for install
- export_library(
- 	TARGET "ts"
- 	LIB_NAME "libts"
-+	PKG_CONFIG_FILE "${CMAKE_CURRENT_LIST_DIR}/libtsConfig.cmake.in"
- 	INTERFACE_FILES
- 		${_rpc_caller_public_header_files}
- 		${_service_locator_public_header_files}
-diff --git a/deployments/libts/libtsConfig.cmake.in b/deployments/libts/libtsConfig.cmake.in
-new file mode 100644
-index 0000000..4860135
---- /dev/null
-+++ b/deployments/libts/libtsConfig.cmake.in
-@@ -0,0 +1,10 @@
-+#
-+# Copyright (c) 2020-2022, Arm Limited and Contributors. All rights reserved.
-+#
-+# SPDX-License-Identifier: BSD-3-Clause
-+#
-+
-+@PACKAGE_INIT@
-+
-+include("${CMAKE_CURRENT_LIST_DIR}/libtsTargets.cmake")
-+
-diff --git a/tools/cmake/common/ExportLibrary.cmake b/tools/cmake/common/ExportLibrary.cmake
-index fed4e75..4fcf481 100644
---- a/tools/cmake/common/ExportLibrary.cmake
-+++ b/tools/cmake/common/ExportLibrary.cmake
-@@ -1,5 +1,5 @@
- #-------------------------------------------------------------------------------
--# Copyright (c) 2020-2021, Arm Limited and Contributors. All rights reserved.
-+# Copyright (c) 2020-2022, Arm Limited and Contributors. All rights reserved.
- #
- # SPDX-License-Identifier: BSD-3-Clause
- #
-@@ -26,17 +26,29 @@
- #]===]
- function(export_library)
- 	set(options  )
--	set(oneValueArgs TARGET LIB_NAME)
-+	set(oneValueArgs TARGET LIB_NAME PKG_CONFIG_FILE)
- 	set(multiValueArgs INTERFACE_FILES)
- 	cmake_parse_arguments(MY_PARAMS "${options}" "${oneValueArgs}"
- 						"${multiValueArgs}" ${ARGN} )
- 
--	if(NOT DEFINED MY_PARAMS_TARGET)
--		message(FATAL_ERROR "export_library: mandatory parameter TARGET not defined!")
-+	foreach(_param IN ITEMS MY_PARAMS_TARGET MY_PARAMS_LIB_NAME MY_PARAMS_PKG_CONFIG_FILE)
-+		if(NOT DEFINED ${_param})
-+			list(APPEND _miss_params "${_param}" )
-+		endif()
-+	endforeach()
-+
-+	if (_miss_params)
-+		string(REPLACE ";" ", " _miss_params "${_miss_params}")
-+		message(FATAL_ERROR "export_library: mandatory parameter(s) ${_miss_params} not defined!")
- 	endif()
--	if(NOT DEFINED MY_PARAMS_LIB_NAME)
--		message(FATAL_ERROR "export_library: mandatory parameter LIB_NAME not defined!")
--	endif()
-+
-+
-+	string(TOUPPER "${MY_PARAMS_LIB_NAME}" UC_LIB_NAME)
-+	string(TOLOWER "${MY_PARAMS_LIB_NAME}" LC_LIB_NAME)
-+	string(SUBSTRING "${UC_LIB_NAME}" 0 1 CAP_LIB_NAME)
-+	string(SUBSTRING "${LC_LIB_NAME}" 1 -1 _tmp)
-+	string(APPEND CAP_LIB_NAME "${_tmp}")
-+
- 
- 	# Set default install location if none specified
- 	if (CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
-@@ -55,6 +67,42 @@
- 			DESTINATION ${TS_ENV}/include
- 	)
- 
-+	# Create a config file package.
-+	include(CMakePackageConfigHelpers)
-+	get_target_property(_ver ${MY_PARAMS_TARGET} VERSION)
-+	write_basic_package_version_file(
-+		"${CMAKE_CURRENT_BINARY_DIR}/${LC_LIB_NAME}ConfigVersion.cmake"
-+		VERSION "${_ver}"
-+		COMPATIBILITY SameMajorVersion
-+	)
-+
-+	# Create targets file.
-+	export(
-+		EXPORT
-+			${MY_PARAMS_LIB_NAME}_targets
-+		FILE
-+			"${CMAKE_CURRENT_BINARY_DIR}/${MY_PARAMS_LIB_NAME}Targets.cmake"
-+		NAMESPACE
-+			${MY_PARAMS_LIB_NAME}::
-+	)
-+
-+	# Finalize config file.
-+	# Config package location relative to install root.
-+	set(ConfigPackageLocation ${TS_ENV}/lib/cmake)
-+	# Config package location ??
-+	get_filename_component(ConfigPackageLocationRel ${ConfigPackageLocation} PATH)
-+
-+	get_filename_component(_configured_pkgcfg_name "${MY_PARAMS_PKG_CONFIG_FILE}" NAME_WLE)
-+	set(_configured_pkgcfg_name "${CMAKE_CURRENT_BINARY_DIR}/${_configured_pkgcfg_name}")
-+	configure_package_config_file(
-+			"${MY_PARAMS_PKG_CONFIG_FILE}"
-+			"${_configured_pkgcfg_name}"
-+		PATH_VARS
-+
-+		INSTALL_DESTINATION
-+			${ConfigPackageLocationRel}
-+	)
-+
- 	# Install library header files files
- 	install(
- 		FILES ${MY_PARAMS_INTERFACE_FILES}
-@@ -64,9 +112,21 @@
- 	# Install the export details
- 	install(
- 		EXPORT ${MY_PARAMS_LIB_NAME}_targets
--		FILE ${MY_PARAMS_LIB_NAME}_targets.cmake
-+		FILE ${MY_PARAMS_LIB_NAME}Targets.cmake
- 		NAMESPACE ${MY_PARAMS_LIB_NAME}::
--		DESTINATION ${TS_ENV}/lib/cmake
-+		DESTINATION ${ConfigPackageLocation}
- 		COMPONENT ${MY_PARAMS_LIB_NAME}
- 	)
-+
-+
-+	# install config and version files
-+	install(
-+		FILES
-+			"${_configured_pkgcfg_name}"
-+			"${CMAKE_CURRENT_BINARY_DIR}/${LC_LIB_NAME}ConfigVersion.cmake"
-+		DESTINATION
-+			${ConfigPackageLocation}
-+		COMPONENT
-+			${MY_PARAMS_LIB_NAME}
-+	)
- endfunction()
diff --git a/meta-arm/recipes-security/trusted-services/files/0011-Adapt-deployments-to-libts-changes.patch b/meta-arm/recipes-security/trusted-services/files/0011-Adapt-deployments-to-libts-changes.patch
deleted file mode 100644
index 34b10357..00000000
--- a/meta-arm/recipes-security/trusted-services/files/0011-Adapt-deployments-to-libts-changes.patch
+++ /dev/null
@@ -1,197 +0,0 @@
-From dfadca01ff028f9fc935937cdaf92b0effff2b90 Mon Sep 17 00:00:00 2001
-From: Gyorgy Szing <Gyorgy.Szing@arm.com>
-Date: Wed, 20 Jul 2022 16:49:39 +0000
-Subject: [PATCH] Adapt deployments to libts changes
-
-Update deployments and restore compatibility to libts build-system
-interface changes.
-
-Signed-off-by: Gyorgy Szing <Gyorgy.Szing@arm.com>
-Change-Id: Iffd38f92fe628a2a6aaff60224986f22ec3a8a2a
-
-Upstream-Status: Pending [In review]
-Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
-
----
-
-diff --git a/deployments/platform-inspect/platform-inspect.cmake b/deployments/platform-inspect/platform-inspect.cmake
-index ef4ba4b..b1b316d 100644
---- a/deployments/platform-inspect/platform-inspect.cmake
-+++ b/deployments/platform-inspect/platform-inspect.cmake
-@@ -1,5 +1,5 @@
- #-------------------------------------------------------------------------------
--# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
-+# Copyright (c) 2021-2022, Arm Limited and Contributors. All rights reserved.
- #
- # SPDX-License-Identifier: BSD-3-Clause
- #
-@@ -12,14 +12,14 @@
- 
- #-------------------------------------------------------------------------------
- #  Use libts for locating and accessing trusted services. An appropriate version
--#  of libts will be imported for the enviroment in which platform-inspect is
-+#  of libts will be imported for the environment in which platform-inspect is
- #  built.
- #-------------------------------------------------------------------------------
- include(${TS_ROOT}/deployments/libts/libts-import.cmake)
--target_link_libraries(platform-inspect PRIVATE libts)
-+target_link_libraries(platform-inspect PRIVATE libts::ts)
- 
- #-------------------------------------------------------------------------------
--#  Components that are common accross all deployments
-+#  Components that are common across all deployments
- #
- #-------------------------------------------------------------------------------
- add_components(
-diff --git a/deployments/psa-api-test/psa-api-test.cmake b/deployments/psa-api-test/psa-api-test.cmake
-index d58620f..5c3469c 100644
---- a/deployments/psa-api-test/psa-api-test.cmake
-+++ b/deployments/psa-api-test/psa-api-test.cmake
-@@ -1,5 +1,5 @@
- #-------------------------------------------------------------------------------
--# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
-+# Copyright (c) 2021-2022, Arm Limited and Contributors. All rights reserved.
- #
- # SPDX-License-Identifier: BSD-3-Clause
- #
-@@ -12,14 +12,14 @@
- 
- #-------------------------------------------------------------------------------
- #  Use libts for locating and accessing services. An appropriate version of
--#  libts will be imported for the enviroment in which service tests are
-+#  libts will be imported for the environment in which service tests are
- #  deployed.
- #-------------------------------------------------------------------------------
- include(${TS_ROOT}/deployments/libts/libts-import.cmake)
--target_link_libraries(${PROJECT_NAME} PRIVATE libts)
-+target_link_libraries(${PROJECT_NAME} PRIVATE libts::ts)
- 
- #-------------------------------------------------------------------------------
--#  Components that are common accross all deployments
-+#  Components that are common across all deployments
- #
- #-------------------------------------------------------------------------------
- add_components(
-diff --git a/deployments/ts-demo/ts-demo.cmake b/deployments/ts-demo/ts-demo.cmake
-index 3e7cca0..9fd8585 100644
---- a/deployments/ts-demo/ts-demo.cmake
-+++ b/deployments/ts-demo/ts-demo.cmake
-@@ -1,5 +1,5 @@
- #-------------------------------------------------------------------------------
--# Copyright (c) 2020-2021, Arm Limited and Contributors. All rights reserved.
-+# Copyright (c) 2020-2022, Arm Limited and Contributors. All rights reserved.
- #
- # SPDX-License-Identifier: BSD-3-Clause
- #
-@@ -13,11 +13,11 @@
- 
- #-------------------------------------------------------------------------------
- #  Use libts for locating and accessing services. An appropriate version of
--#  libts will be imported for the enviroment in which service tests are
-+#  libts will be imported for the environment in which service tests are
- #  deployed.
- #-------------------------------------------------------------------------------
- include(${TS_ROOT}/deployments/libts/libts-import.cmake)
--target_link_libraries(ts-demo PRIVATE libts)
-+target_link_libraries(ts-demo PRIVATE libts::ts)
- 
- #-------------------------------------------------------------------------------
- #  Common main for all deployments
-@@ -28,7 +28,7 @@
- )
- 
- #-------------------------------------------------------------------------------
--#  Components that are common accross all deployments
-+#  Components that are common across all deployments
- #
- #-------------------------------------------------------------------------------
- add_components(
-diff --git a/deployments/ts-remote-test/ts-remote-test.cmake b/deployments/ts-remote-test/ts-remote-test.cmake
-index 0f35bb2..c310445 100644
---- a/deployments/ts-remote-test/ts-remote-test.cmake
-+++ b/deployments/ts-remote-test/ts-remote-test.cmake
-@@ -1,5 +1,5 @@
- #-------------------------------------------------------------------------------
--# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
-+# Copyright (c) 2021-2022, Arm Limited and Contributors. All rights reserved.
- #
- # SPDX-License-Identifier: BSD-3-Clause
- #
-@@ -13,11 +13,11 @@
- 
- #-------------------------------------------------------------------------------
- #  Use libts for locating and accessing services. An appropriate version of
--#  libts will be imported for the enviroment in which tests are
-+#  libts will be imported for the environment in which tests are
- #  deployed.
- #-------------------------------------------------------------------------------
- include(${TS_ROOT}/deployments/libts/libts-import.cmake)
--target_link_libraries(ts-remote-test PRIVATE libts)
-+target_link_libraries(ts-remote-test PRIVATE libts::ts)
- 
- #-------------------------------------------------------------------------------
- #  Common main for all deployments
-@@ -28,7 +28,7 @@
- )
- 
- #-------------------------------------------------------------------------------
--#  Components that are common accross all deployments
-+#  Components that are common across all deployments
- #
- #-------------------------------------------------------------------------------
- add_components(
-diff --git a/deployments/ts-service-test/ts-service-test.cmake b/deployments/ts-service-test/ts-service-test.cmake
-index 4a8c59c..3e33757 100644
---- a/deployments/ts-service-test/ts-service-test.cmake
-+++ b/deployments/ts-service-test/ts-service-test.cmake
-@@ -1,5 +1,5 @@
- #-------------------------------------------------------------------------------
--# Copyright (c) 2020-2021, Arm Limited and Contributors. All rights reserved.
-+# Copyright (c) 2020-2022, Arm Limited and Contributors. All rights reserved.
- #
- # SPDX-License-Identifier: BSD-3-Clause
- #
-@@ -8,19 +8,19 @@
- #-------------------------------------------------------------------------------
- #  The base build file shared between deployments of 'ts-service-test' for
- #  different environments.  Used for running end-to-end service-level tests
--#  where test cases excerise trusted service client interfaces.
-+#  where test cases exercise trusted service client interfaces.
- #-------------------------------------------------------------------------------
- 
- #-------------------------------------------------------------------------------
- #  Use libts for locating and accessing services. An appropriate version of
--#  libts will be imported for the enviroment in which service tests are
-+#  libts will be imported for the environment in which service tests are
- #  deployed.
- #-------------------------------------------------------------------------------
- include(${TS_ROOT}/deployments/libts/libts-import.cmake)
--target_link_libraries(ts-service-test PRIVATE libts)
-+target_link_libraries(ts-service-test PRIVATE libts::ts)
- 
- #-------------------------------------------------------------------------------
--#  Components that are common accross all deployments
-+#  Components that are common across all deployments
- #
- #-------------------------------------------------------------------------------
- add_components(
-diff --git a/deployments/uefi-test/uefi-test.cmake b/deployments/uefi-test/uefi-test.cmake
-index ea678d0..2f47891 100644
---- a/deployments/uefi-test/uefi-test.cmake
-+++ b/deployments/uefi-test/uefi-test.cmake
-@@ -1,5 +1,5 @@
- #-------------------------------------------------------------------------------
--# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
-+# Copyright (c) 2021-2022, Arm Limited and Contributors. All rights reserved.
- #
- # SPDX-License-Identifier: BSD-3-Clause
- #
-@@ -18,7 +18,7 @@
- #  deployed.
- #-------------------------------------------------------------------------------
- include(${TS_ROOT}/deployments/libts/libts-import.cmake)
--target_link_libraries(uefi-test PRIVATE libts)
-+target_link_libraries(uefi-test PRIVATE libts::ts)
- 
- #-------------------------------------------------------------------------------
- #  Components that are common accross all deployments
diff --git a/meta-arm/recipes-security/trusted-services/files/0012-psa-arch-test-toolchain.patch b/meta-arm/recipes-security/trusted-services/files/0012-psa-arch-test-toolchain.patch
deleted file mode 100644
index 7d07fca8..00000000
--- a/meta-arm/recipes-security/trusted-services/files/0012-psa-arch-test-toolchain.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 1ce8fcde17a6d2c5cb2e00901d485c91eda776fd Mon Sep 17 00:00:00 2001
-From: Anton Antonov <Anton.Antonov@arm.com>
-Date: Wed, 31 Aug 2022 17:09:17 +0100
-Subject: [PATCH 4/4] Pass Yocto build settings to psa-arch-tests native build
-
-PSA-arch-tests need to build a native executable as a part of target build.
-The patch defines correct toolchain settings for native builds.
-
-Upstream-Status: Inappropriate [Yocto build specific change]
-Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
----
- .../psa_arch_tests/modify_attest_config.patch     | 15 +++++++++++++++
- 1 file changed, 15 insertions(+)
-
-diff --git a/external/psa_arch_tests/modify_attest_config.patch b/external/psa_arch_tests/modify_attest_config.patch
-index ebe8c44..b5d5e88 100644
---- a/external/psa_arch_tests/modify_attest_config.patch
-+++ b/external/psa_arch_tests/modify_attest_config.patch
-@@ -11,3 +11,18 @@ index 6112ba7..1cdf581 100755
-  
-  /*
-   * Include of PSA defined Header files
-+diff --git a/api-tests/tools/scripts/target_cfg/CMakeLists.txt b/api-tests/tools/scripts/target_cfg/CMakeLists.txt
-+index 259eb9c..fec1fb8 100644
-+--- a/api-tests/tools/scripts/target_cfg/CMakeLists.txt
-++++ b/api-tests/tools/scripts/target_cfg/CMakeLists.txt
-+@@ -26,7 +26,9 @@ include("common/CMakeSettings")
-+ include("common/Utils")
-+ 
-+ # Causes toolchain to be re-evaluated
-+-unset(ENV{CC})
-++set(ENV{CC} $ENV{BUILD_CC})
-++set(ENV{CFLAGS} $ENV{BUILD_CFLAGS})
-++set(ENV{LDFLAGS} $ENV{BUILD_LDFLAGS})
-+ 
-+ # Let the CMake look for C compiler
-+ project(TargetConfigGen LANGUAGES C)
--- 
-2.25.1
-
diff --git a/meta-arm/recipes-security/trusted-services/libts/0001-QEMU-MM-communication-buffer-address.patch b/meta-arm/recipes-security/trusted-services/libts/0001-QEMU-MM-communication-buffer-address.patch
deleted file mode 100644
index 2c21e6f1..00000000
--- a/meta-arm/recipes-security/trusted-services/libts/0001-QEMU-MM-communication-buffer-address.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 1fe74d7d5008aed61feb34a8d5d8b5f9144a58b2 Mon Sep 17 00:00:00 2001
-From: Anton Antonov <Anton.Antonov@arm.com>
-Date: Wed, 31 Aug 2022 16:33:13 +0100
-Subject: [PATCH] Update MM communication buffer address for qemuarm64 machine
-
-Upstream-Status: Inappropriate [qemuarm64 specific change]
-Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
----
- components/rpc/mm_communicate/caller/linux/carveout.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/components/rpc/mm_communicate/caller/linux/carveout.c b/components/rpc/mm_communicate/caller/linux/carveout.c
-index e3cdf16f..62845d30 100644
---- a/components/rpc/mm_communicate/caller/linux/carveout.c
-+++ b/components/rpc/mm_communicate/caller/linux/carveout.c
-@@ -12,8 +12,8 @@
- #include "carveout.h"
- 
- /* Need to be aligned with carve-out used by StMM or smm-gateway. */
--static const off_t carveout_pa = 0x0000000881000000;
--static const size_t carveout_len = 0x8000;
-+static const off_t carveout_pa = 0x42000000;
-+static const size_t carveout_len = 0x1000;
- 
- int carveout_claim(uint8_t **buf, size_t *buf_size)
- {
--- 
-2.25.1
-
diff --git a/meta-arm/recipes-security/trusted-services/libts_%.bbappend b/meta-arm/recipes-security/trusted-services/libts_%.bbappend
index f987e40c..9156e022 100644
--- a/meta-arm/recipes-security/trusted-services/libts_%.bbappend
+++ b/meta-arm/recipes-security/trusted-services/libts_%.bbappend
@@ -1,3 +1,4 @@
 # Update MM communication buffer address for qemuarm64 machine
-SRC_URI:append:qemuarm64-secureboot = "file://0001-QEMU-MM-communication-buffer-address.patch \
+EXTRA_OECMAKE:append:qemuarm64-secureboot = "-DMM_COMM_BUFFER_ADDRESS=0x42000000 \
+                                             -DMM_COMM_BUFFER_SIZE=0x1000 \
 "
diff --git a/meta-arm/recipes-security/trusted-services/libts_git.bb b/meta-arm/recipes-security/trusted-services/libts_git.bb
index dfcf8ce9..598b281b 100644
--- a/meta-arm/recipes-security/trusted-services/libts_git.bb
+++ b/meta-arm/recipes-security/trusted-services/libts_git.bb
@@ -13,10 +13,6 @@ OECMAKE_SOURCEPATH="${S}/deployments/libts/${TS_ENV}"
 DEPENDS           += "arm-ffa-tee arm-ffa-user"
 RRECOMMENDS:${PN} += "arm-ffa-tee"
 
-# arm-ffa-user.h is installed by arm-ffa-user recipe
-EXTRA_OECMAKE += "-DLINUX_FFA_USER_SHIM_INCLUDE_DIR:PATH=/usr/include \
-                 "
-
 # Unix group name for dev/tee* ownership.
 TEE_GROUP_NAME ?= "teeclnt"
 
@@ -28,12 +24,11 @@ do_install:append () {
     fi
 
     # Move the dynamic libraries into the standard place.
-    # Update a cmake files to use correct paths.
+    # Update a cmake file to use correct paths.
     install -d ${D}${libdir}
     mv ${D}${TS_INSTALL}/lib/libts* ${D}${libdir}
 
-    sed -i -e "s#/${TS_ENV}##g" ${D}${TS_INSTALL}/lib/cmake/libtsTargets-noconfig.cmake
-    sed -i -e 's#INTERFACE_INCLUDE_DIRECTORIES.*$#INTERFACE_INCLUDE_DIRECTORIES "\${_IMPORT_PREFIX}/${TS_ENV}/include"#' ${D}${TS_INSTALL}/lib/cmake/libtsTargets.cmake
+    sed -i -e "s#/${TS_ENV}##g" ${D}${TS_INSTALL}/lib/cmake/libts/libtsTargets-noconfig.cmake
 }
 
 inherit ${@oe.utils.conditional('VIRTUAL-RUNTIME_dev_manager', 'busybox-mdev', '', 'useradd', d)}
diff --git a/meta-arm/recipes-security/trusted-services/trusted-services-src.inc b/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
index c9c5928a..c8aa821a 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
@@ -3,16 +3,10 @@
 LICENSE = "Apache-2.0 & BSD-3-Clause & BSD-2-Clause & Zlib"
 
 SRC_URI = "git://git.trustedfirmware.org/TS/trusted-services.git;protocol=https;branch=integration;name=trusted-services;destsuffix=git/trusted-services \
-           file://0004-correctly-find-headers-dir.patch \
-           file://0005-setting-sysroot-for-libgcc-lookup.patch \
-           file://0006-applying-lowercase-project-convention.patch \
-           file://0009-PSA-CRYPTO-API-INCLUDE.patch \
-           file://0010-change-libts-to-export-CMake-package.patch \
-           file://0011-Adapt-deployments-to-libts-changes.patch \
 "
 
-#latest on 07.10.22.
-SRCREV_trusted-services = "45353ba0bd5b4059e71ae67f9c49749da8b41b43"
+#latest on 12.10.22.
+SRCREV_trusted-services = "3d4956770f89eb9ae0a73257901ae6277c078da6"
 LIC_FILES_CHKSUM = "file://${S}/license.rst;md5=ea160bac7f690a069c608516b17997f4"
 
 S = "${WORKDIR}/git/trusted-services"
diff --git a/meta-arm/recipes-security/trusted-services/trusted-services.inc b/meta-arm/recipes-security/trusted-services/trusted-services.inc
index 80c08499..59f461d3 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services.inc
@@ -47,6 +47,6 @@ EXTRA_OECMAKE += "${@oe.utils.conditional('TS_ENV', 'opteesp', \
                  "
 
 # Paths to pre-built dependencies required by some TS SPs/tools
-EXTRA_OECMAKE += "-Dlibts_DIR=${STAGING_DIR_HOST}${TS_INSTALL}/lib/cmake/ \
-                  -DNEWLIB_INSTALL_DIR=${STAGING_DIR_HOST}${TS_INSTALL}/newlib_install \
+EXTRA_OECMAKE += "-Dlibts_ROOT=${STAGING_DIR_HOST}${TS_INSTALL}/lib/cmake/libts/ \
+                  -DNEWLIB_INSTALL_DIR=${STAGING_DIR_HOST}${TS_INSTALL}/newlib \
                  "
diff --git a/meta-arm/recipes-security/trusted-services/ts-newlib/0003-Add-newlib-deployment.patch b/meta-arm/recipes-security/trusted-services/ts-newlib/0003-Add-newlib-deployment.patch
deleted file mode 100644
index e43e7d25..00000000
--- a/meta-arm/recipes-security/trusted-services/ts-newlib/0003-Add-newlib-deployment.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From 03337e3a509eace9f55a46993cfaadee0e796f46 Mon Sep 17 00:00:00 2001
-From: Gyorgy Szing <Gyorgy.Szing@arm.com>
-Date: Fri, 14 Jan 2022 20:35:53 +0000
-Subject: [PATCH 1/1] Add newlib deployment
-
-This deployment allow building newlib directly and not part of SP
-builds. The resulting binary can be used as a pre-build binary for
-building SPs later.
-The intent is to help integration systems, where recursive build is
-problematic, and there is no direct support for building newlib.
-
-Change-Id: I770cdfd3c39eb7bf9764de74dfb191c321c49561
-Signed-off-by: Gyorgy Szing <Gyorgy.Szing@arm.com>
-
-Upstream-Status: Pending [In review]
-Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
-
----
- deployments/newlib/opteesp/CMakeLists.txt | 38 +++++++++++++++++++++++
- tools/b-test/test_data.yaml               |  4 +++
- 2 files changed, 42 insertions(+)
- create mode 100644 deployments/newlib/opteesp/CMakeLists.txt
-
-diff --git a/deployments/newlib/opteesp/CMakeLists.txt b/deployments/newlib/opteesp/CMakeLists.txt
-new file mode 100644
-index 00000000..593e0a96
---- /dev/null
-+++ b/deployments/newlib/opteesp/CMakeLists.txt
-@@ -0,0 +1,38 @@
-+#-------------------------------------------------------------------------------
-+# Copyright (c) 2022, Arm Limited and Contributors. All rights reserved.
-+#
-+# SPDX-License-Identifier: BSD-3-Clause
-+#
-+#-------------------------------------------------------------------------------
-+cmake_minimum_required(VERSION 3.18 FATAL_ERROR)
-+include(../../deployment.cmake REQUIRED)
-+
-+#-------------------------------------------------------------------------------
-+#  The CMakeLists.txt for building the newlib deployment for opteesp
-+#
-+#  Can be used to build the newlib library, which can be used to build SPs.
-+#-------------------------------------------------------------------------------
-+include(${TS_ROOT}/environments/opteesp/env.cmake)
-+
-+project(newlib C)
-+
-+# This is a dummy library not intended to be compiled ever. It is needed
-+# to avoid opteesp specific newlib targeting files.
-+add_library(dummy EXCLUDE_FROM_ALL)
-+set(TGT dummy)
-+# Build newlib as an external component.
-+include(${TS_ROOT}/external/newlib/newlib.cmake)
-+
-+######################################## install
-+if (CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
-+	set(CMAKE_INSTALL_PREFIX ${CMAKE_BINARY_DIR}/install CACHE PATH "location to install build output to." FORCE)
-+endif()
-+
-+install(DIRECTORY ${NEWLIB_INSTALL_DIR} DESTINATION  ${TS_ENV})
-+
-+#get_property(_tmp_lib TARGET stdlib::c PROPERTY IMPORTED_LOCATION)
-+#get_filename_component(_tmp_path ${_tmp_lib} DIRECTORY)
-+#install(DIRECTORY ${_tmp_path} DESTINATION ${TS_ENV})
-+
-+#get_property(_tmp_path TARGET stdlib::c PROPERTY INTERFACE_INCLUDE_DIRECTORIES)
-+#install(DIRECTORY ${_tmp_path} DESTINATION ${TS_ENV})
-diff --git a/tools/b-test/test_data.yaml b/tools/b-test/test_data.yaml
-index 7caafa8b..6bfacc66 100644
---- a/tools/b-test/test_data.yaml
-+++ b/tools/b-test/test_data.yaml
-@@ -69,6 +69,10 @@ data:
-       os_id : "GNU/Linux"
-       params:
-             - "-GUnix Makefiles"
-+    - name: "newlib-optee-arm"
-+      src: "$TS_ROOT/deployments/newlib/opteesp"
-+      params:
-+          - "-GUnix Makefiles"
-     - name: "platform-inspect-arm-linux"
-       src: "$TS_ROOT/deployments/platform-inspect/arm-linux"
-       os_id : "GNU/Linux"
--- 
-2.37.0
-
diff --git a/meta-arm/recipes-security/trusted-services/ts-newlib/0021-newlib-configure.patch b/meta-arm/recipes-security/trusted-services/ts-newlib/0021-newlib-configure.patch
deleted file mode 100644
index a9d291b4..00000000
--- a/meta-arm/recipes-security/trusted-services/ts-newlib/0021-newlib-configure.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From df66efc0db9899c41632091db11bfe2c05eec1fa Mon Sep 17 00:00:00 2001
-From: Anton Antonov <Anton.Antonov@arm.com>
-Date: Wed, 31 Aug 2022 17:55:21 +0100
-Subject: [PATCH] Allow to define additional partameters for newlib configure.
-
-Do not skip newlib and libgloss when crosscompiling
-
-Upstream-Status: Pending
-Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
----
- ...-aarch64-linux-gcc-to-compile-bare-metal-lib.patch | 11 ++++++++++-
- external/newlib/newlib.cmake                          |  6 ++++++
- 2 files changed, 16 insertions(+), 1 deletion(-)
-
-diff --git a/external/newlib/0001-Allow-aarch64-linux-gcc-to-compile-bare-metal-lib.patch b/external/newlib/0001-Allow-aarch64-linux-gcc-to-compile-bare-metal-lib.patch
-index f87ed5a..7533ed0 100644
---- a/external/newlib/0001-Allow-aarch64-linux-gcc-to-compile-bare-metal-lib.patch
-+++ b/external/newlib/0001-Allow-aarch64-linux-gcc-to-compile-bare-metal-lib.patch
-@@ -16,9 +16,18 @@ Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
-  2 files changed, 2 insertions(+), 2 deletions(-)
- 
- diff --git a/configure b/configure
--index 5db52701..1eb71a80 100755
-+index 5db527014..dce91609e 100755
- --- a/configure
- +++ b/configure
-+@@ -2886,7 +2886,7 @@ esac
-+
-+ # Some are only suitable for cross toolchains.
-+ # Remove these if host=target.
-+-cross_only="target-libgloss target-newlib target-opcodes"
-++cross_only="target-opcodes"
-+
-+ case $is_cross_compiler in
-+   no) skipdirs="${skipdirs} ${cross_only}" ;;
- @@ -3659,7 +3659,7 @@ case "${target}" in
-    *-*-freebsd*)
-      noconfigdirs="$noconfigdirs target-newlib target-libgloss"
-diff --git a/external/newlib/newlib.cmake b/external/newlib/newlib.cmake
-index 13eb78c..5ee99a5 100644
---- a/external/newlib/newlib.cmake
-+++ b/external/newlib/newlib.cmake
-@@ -168,6 +168,10 @@ if (NOT NEWLIB_LIBC_PATH)
- 	string(REPLACE ";" " -isystem " CFLAGS_FOR_TARGET "${_gcc_include_dirs}")
- 	set(CFLAGS_FOR_TARGET "-isystem ${CFLAGS_FOR_TARGET} -fpic")
- 
-+	# Split a newlib extra build parameter into a list of parameters
-+	set(NEWLIB_EXTRAS ${NEWLIB_EXTRA})
-+	separate_arguments(NEWLIB_EXTRAS)
-+
- 	# Newlib configure step
- 	# CC env var must be unset otherwise configure will assume the cross compiler is the host
- 	# compiler.
-@@ -175,6 +179,7 @@ if (NOT NEWLIB_LIBC_PATH)
- 	execute_process(COMMAND
- 		${CMAKE_COMMAND} -E env --unset=CC PATH=${COMPILER_PATH}:$ENV{PATH} ./configure
- 			--target=${COMPILER_PREFIX}
-+			--host=${COMPILER_PREFIX}
- 			--prefix=${NEWLIB_INSTALL_DIR}
- 			--enable-newlib-nano-formatted-io
- 			--enable-newlib-nano-malloc
-@@ -182,6 +187,7 @@ if (NOT NEWLIB_LIBC_PATH)
- 			--enable-newlib-reent-small
- 			--enable-newlib-global-atexit
- 			--disable-multilib
-+			${NEWLIB_EXTRAS}
- 			CFLAGS_FOR_TARGET=${CFLAGS_FOR_TARGET}
- 			LDFLAGS_FOR_TARGET=-fpie
- 		WORKING_DIRECTORY
--- 
-2.25.1
-
diff --git a/meta-arm/recipes-security/trusted-services/ts-newlib_4.1.0.bb b/meta-arm/recipes-security/trusted-services/ts-newlib_4.1.0.bb
index 4009f3a3..408c7d3c 100644
--- a/meta-arm/recipes-security/trusted-services/ts-newlib_4.1.0.bb
+++ b/meta-arm/recipes-security/trusted-services/ts-newlib_4.1.0.bb
@@ -5,8 +5,6 @@ TS_ENV = "opteesp"
 require trusted-services.inc
 
 SRC_URI += "git://sourceware.org/git/newlib-cygwin.git;name=newlib;protocol=https;branch=master;destsuffix=git/newlib \
-            file://0003-Add-newlib-deployment.patch \
-            file://0021-newlib-configure.patch \
 "
 
 # tag "newlib-0.4.1"
@@ -17,7 +15,7 @@ LIC_FILES_CHKSUM += "file://../newlib/COPYING.NEWLIB;md5=b8dda70da54e0efb49b1074
 TOOLCHAIN = "gcc"
 
 EXTRA_OECMAKE += '-DNEWLIB_SOURCE_DIR=${WORKDIR}/git/newlib \
-                  -DNEWLIB_EXTRA="CFLAGS=--sysroot=${STAGING_DIR_HOST}" \
+                  -DNEWLIB_CFLAGS="--sysroot=${STAGING_DIR_HOST}" \
                  '
 
 OECMAKE_SOURCEPATH = "${S}/deployments/newlib/${TS_ENV}/"
@@ -30,5 +28,5 @@ apply_ts_patch() {
 }
 do_patch[postfuncs] += "apply_ts_patch"
 
-FILES:${PN}-dev = "${TS_INSTALL}/newlib_install"
-FILES:${PN}-staticdev = "${TS_INSTALL}/newlib_install/*/lib/*.a"
+FILES:${PN}-dev = "${TS_INSTALL}/newlib"
+FILES:${PN}-staticdev = "${TS_INSTALL}/newlib/*/lib/*.a"
diff --git a/meta-arm/recipes-security/trusted-services/ts-psa-api-test-common_git.inc b/meta-arm/recipes-security/trusted-services/ts-psa-api-test-common_git.inc
index 1e1be6a9..dfd47163 100644
--- a/meta-arm/recipes-security/trusted-services/ts-psa-api-test-common_git.inc
+++ b/meta-arm/recipes-security/trusted-services/ts-psa-api-test-common_git.inc
@@ -8,7 +8,7 @@ DEPENDS        += "libts"
 RDEPENDS:${PN} += "libts"
 
 SRC_URI += "git://github.com/ARM-software/psa-arch-tests.git;name=psatest;protocol=https;branch=main;destsuffix=git/psatest \
-            file://0012-psa-arch-test-toolchain.patch \
+            file://0001-Pass-Yocto-build-settings-to-psa-arch-tests-native.patch;patchdir=../psatest \
            "
 
 SRCREV_psatest = "451aa087a40d02c7d04778235014c5619d126471"
diff --git a/meta-arm/recipes-security/trusted-services/ts-psa-iat-api-test/0012-PSA-TARGET-QCBOR.patch b/meta-arm/recipes-security/trusted-services/ts-psa-iat-api-test/0012-PSA-TARGET-QCBOR.patch
deleted file mode 100644
index 3b28e80e..00000000
--- a/meta-arm/recipes-security/trusted-services/ts-psa-iat-api-test/0012-PSA-TARGET-QCBOR.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 3229ca31e59933608f82001c1cdcca9d0a0aa0e0 Mon Sep 17 00:00:00 2001
-From: Anton Antonov <Anton.Antonov@arm.com>
-Date: Wed, 31 Aug 2022 17:19:08 +0100
-Subject: [PATCH] Subject: [PATCH] Pass PSA_TARGET_QCBOR to psa-arch-tests
-
-psa-arch-tests require they own version of qcbor library.
-Pass PSA_TARGET_QCBOR which defines where pre-fetched qcbor sources are.
-
-Upstream-Status: Pending
-Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
----
- external/psa_arch_tests/pas-arch-test-init-cache.cmake.in | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/external/psa_arch_tests/pas-arch-test-init-cache.cmake.in b/external/psa_arch_tests/pas-arch-test-init-cache.cmake.in
-index 5c63596..64196c2 100644
---- a/external/psa_arch_tests/pas-arch-test-init-cache.cmake.in
-+++ b/external/psa_arch_tests/pas-arch-test-init-cache.cmake.in
-@@ -10,6 +10,7 @@ set(CMAKE_TOOLCHAIN_FILE "@TS_EXTERNAL_LIB_TOOLCHAIN_FILE@" CACHE STRING "")
- 
- set(TOOLCHAIN INHERIT CACHE STRING "")
- set(PSA_INCLUDE_PATHS "@PSA_ARCH_TESTS_EXTERNAL_INCLUDE_PATHS@"  CACHE STRING "")
-+set(PSA_TARGET_QCBOR "@PSA_TARGET_QCBOR@"  CACHE STRING "")
- set(SUITE "@TS_ARCH_TEST_SUITE@"  CACHE STRING "")
- set(ARCH_TEST_EXTERNAL_DEFS "@PSA_ARCH_TEST_EXTERNAL_DEFS@"  CACHE STRING "")
- set(CMAKE_VERBOSE_MAKEFILE OFF CACHE BOOL "")
--- 
-2.25.1
-
diff --git a/meta-arm/recipes-security/trusted-services/ts-psa-iat-api-test_git.bb b/meta-arm/recipes-security/trusted-services/ts-psa-iat-api-test_git.bb
index f8fb8a46..e5c662e4 100644
--- a/meta-arm/recipes-security/trusted-services/ts-psa-iat-api-test_git.bb
+++ b/meta-arm/recipes-security/trusted-services/ts-psa-iat-api-test_git.bb
@@ -11,7 +11,6 @@ PSA_TEST = "psa-iat-api-test"
 # psa-arch-tests for INITIAL_ATTESTATION suite can't be built with pre-built qcbor
 # Fetch qcbor sources as a temp work-around and pass PSA_TARGET_QCBOR to psa-arch-tests
 SRC_URI += "git://github.com/laurencelundblade/QCBOR.git;name=psaqcbor;protocol=https;branch=master;destsuffix=git/psaqcbor \
-            file://0012-PSA-TARGET-QCBOR.patch \
            "
 SRCREV_psaqcbor = "42272e466a8472948bf8fca076d113b81b99f0e0"
 
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-env-test/0013-env-test-no-std-libs.patch b/meta-arm/recipes-security/trusted-services/ts-sp-env-test/0013-env-test-no-std-libs.patch
deleted file mode 100644
index f6269db4..00000000
--- a/meta-arm/recipes-security/trusted-services/ts-sp-env-test/0013-env-test-no-std-libs.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 7a0dcc40ea736dc20b25813dfc08e576c2615217 Mon Sep 17 00:00:00 2001
-From: Anton Antonov <Anton.Antonov@arm.com>
-Date: Wed, 31 Aug 2022 17:32:47 +0100
-Subject: [PATCH] Do not use standard libraries in env-test opteesp deployment
-
-In opteesp deployments newlib used used. The standard libraries should not be included.
-
-Upstream-Status: Pending
-Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
----
- deployments/env-test/opteesp/CMakeLists.txt | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/deployments/env-test/opteesp/CMakeLists.txt b/deployments/env-test/opteesp/CMakeLists.txt
-index cff00ff..60abc0d 100644
---- a/deployments/env-test/opteesp/CMakeLists.txt
-+++ b/deployments/env-test/opteesp/CMakeLists.txt
-@@ -56,9 +56,9 @@ include(../env-test.cmake REQUIRED)
- #-------------------------------------------------------------------------------
- add_platform(TARGET env-test)
- 
--if(CMAKE_CROSSCOMPILING)
--	target_link_libraries(env-test PRIVATE stdc++ gcc m)
--endif()
-+#if(CMAKE_CROSSCOMPILING)
-+#	target_link_libraries(env-test PRIVATE stdc++ gcc m)
-+#endif()
- 
- #################################################################
- 
--- 
-2.25.1
-
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-env-test_git.bb b/meta-arm/recipes-security/trusted-services/ts-sp-env-test_git.bb
index 9cd73cbc..040fd4d1 100644
--- a/meta-arm/recipes-security/trusted-services/ts-sp-env-test_git.bb
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-env-test_git.bb
@@ -8,7 +8,3 @@ COMPATIBLE_MACHINE ?= "invalid"
 SP_UUID = "${ENV_TEST_UUID}"
 
 OECMAKE_SOURCEPATH="${S}/deployments/env-test/${TS_ENV}"
-
-SRC_URI += "\
-            file://0013-env-test-no-std-libs.patch \
-"
-- 
2.25.1


