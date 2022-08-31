Return-Path: <anton.antonov@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C4AAECAAD1
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 18:42:18 +0000 (UTC)
Received: from cam-smtp0.cambridge.arm.com (cam-smtp0.cambridge.arm.com
 [217.140.106.51])
 by mx.groups.io with SMTP id smtpd.web11.2714.1661971327306219427
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 31 Aug 2022 11:42:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.106.51, mailfrom: anton.antonov@arm.com)
Received: from atg-devlab-kelpie.cambridge.arm.com
 (atg-devlab-kelpie.cambridge.arm.com [10.2.80.92])
	by cam-smtp0.cambridge.arm.com (8.13.8/8.13.8) with ESMTP id 27VIiIV6011556;
	Wed, 31 Aug 2022 19:44:19 +0100
From: Anton Antonov <Anton.Antonov@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Anton.Antonov@arm.com
Subject: [PATCH 1/7] Recipes for Trusted Services dependencies.
Date: Wed, 31 Aug 2022 19:41:51 +0100
Message-Id: <20220831184157.84687-1-Anton.Antonov@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 31 Aug 2022 18:42:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3731

These recipes produce only -dev and -staticdev packages
which are used for building other TS recipes.

Nothing from these recipes is included into the final image.

Using dedicated recipes for dependencies allows us:
- fetch sources and build dependencies only once and only the required ones.
- simplify the dependencies recipes and use Yocto cmake bbclass
- troubleshoot/fix/update dependencies builds separately

Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
---
 .../0004-correctly-find-headers-dir.patch     |   30 +
 ...05-setting-sysroot-for-libgcc-lookup.patch |   30 +
 ...pplying-lowercase-project-convention.patch |   32 +
 .../files/0009-PSA-CRYPTO-API-INCLUDE.patch   |   39 +
 ...change-libts-to-export-CMake-package.patch |  346 +++
 ...1-Adapt-deployments-to-libts-changes.patch |  197 ++
 .../files/0012-psa-arch-test-toolchain.patch  |   40 +
 ...-libsp-mocks-into-separate-component.patch |  349 +++
 ...0018-Add-mock-for-libsp-sp_discovery.patch |  339 +++
 ...-mock-for-libsp-sp_memory_management.patch |  977 +++++++
 ...0020-Add-mock-for-libsp-sp_messaging.patch |  284 ++
 ...bit-direct-message-handling-to-libsp.patch | 2552 +++++++++++++++++
 ...nicate-RPC-protocol-of-call-endpoint.patch |  497 ++++
 ...ommunicate-RPC-protocol-of-MM-caller.patch |  100 +
 ...t-FF-A-messages-in-FF-A-RPC-endpoint.patch |   70 +
 .../trusted-services/trusted-services-src.inc |   80 +
 .../trusted-services/trusted-services.inc     |   47 +
 .../0003-Add-newlib-deployment.patch          |   85 +
 .../ts-newlib/0021-newlib-configure.patch     |   72 +
 .../trusted-services/ts-newlib_4.1.0.bb       |   31 +
 20 files changed, 6197 insertions(+)
 create mode 100644 meta-arm/recipes-security/trusted-services/files/0004-correctly-find-headers-dir.patch
 create mode 100644 meta-arm/recipes-security/trusted-services/files/0005-setting-sysroot-for-libgcc-lookup.patch
 create mode 100644 meta-arm/recipes-security/trusted-services/files/0006-applying-lowercase-project-convention.patch
 create mode 100644 meta-arm/recipes-security/trusted-services/files/0009-PSA-CRYPTO-API-INCLUDE.patch
 create mode 100644 meta-arm/recipes-security/trusted-services/files/0010-change-libts-to-export-CMake-package.patch
 create mode 100644 meta-arm/recipes-security/trusted-services/files/0011-Adapt-deployments-to-libts-changes.patch
 create mode 100644 meta-arm/recipes-security/trusted-services/files/0012-psa-arch-test-toolchain.patch
 create mode 100644 meta-arm/recipes-security/trusted-services/files/0017-Move-libsp-mocks-into-separate-component.patch
 create mode 100644 meta-arm/recipes-security/trusted-services/files/0018-Add-mock-for-libsp-sp_discovery.patch
 create mode 100644 meta-arm/recipes-security/trusted-services/files/0019-Add-mock-for-libsp-sp_memory_management.patch
 create mode 100644 meta-arm/recipes-security/trusted-services/files/0020-Add-mock-for-libsp-sp_messaging.patch
 create mode 100644 meta-arm/recipes-security/trusted-services/files/0021-Add-64-bit-direct-message-handling-to-libsp.patch
 create mode 100644 meta-arm/recipes-security/trusted-services/files/0022-Change-MM-communicate-RPC-protocol-of-call-endpoint.patch
 create mode 100644 meta-arm/recipes-security/trusted-services/files/0023-Change-MM-communicate-RPC-protocol-of-MM-caller.patch
 create mode 100644 meta-arm/recipes-security/trusted-services/files/0024-Deny-64-bit-FF-A-messages-in-FF-A-RPC-endpoint.patch
 create mode 100644 meta-arm/recipes-security/trusted-services/trusted-services-src.inc
 create mode 100644 meta-arm/recipes-security/trusted-services/trusted-services.inc
 create mode 100644 meta-arm/recipes-security/trusted-services/ts-newlib/0003-Add-newlib-deployment.patch
 create mode 100644 meta-arm/recipes-security/trusted-services/ts-newlib/0021-newlib-configure.patch
 create mode 100644 meta-arm/recipes-security/trusted-services/ts-newlib_4.1.0.bb

diff --git a/meta-arm/recipes-security/trusted-services/files/0004-correctly-find-headers-dir.patch b/meta-arm/recipes-security/trusted-services/files/0004-correctly-find-headers-dir.patch
new file mode 100644
index 00000000..b73b5dc3
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/files/0004-correctly-find-headers-dir.patch
@@ -0,0 +1,30 @@
+From 1b9c8d4a7c9519c6085827da8be6546ce80ee711 Mon Sep 17 00:00:00 2001
+From: Anton Antonov <Anton.Antonov@arm.com>
+Date: Wed, 31 Aug 2022 17:05:14 +0100
+Subject: [PATCH 1/4] Allow to find libgcc headers
+
+Upstream-Status: Pending
+Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
+---
+ external/newlib/newlib.cmake | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/external/newlib/newlib.cmake b/external/newlib/newlib.cmake
+index fff5e2a..13eb78c 100644
+--- a/external/newlib/newlib.cmake
++++ b/external/newlib/newlib.cmake
+@@ -82,7 +82,10 @@ message(STATUS "libgcc.a is used from ${LIBGCC_PATH}")
+ # Moreover the GCC specific header file include directory is also required.
+ # Specify LIBGCC_INCLUDE_DIRS in the command line to manually override the libgcc relative location below.
+ if(NOT DEFINED LIBGCC_INCLUDE_DIRS)
+-	get_filename_component(_TMP_VAR "${LIBGCC_PATH}" DIRECTORY)
++
++	# "libgcc.a" lib location in ${LIBGCC_PATH} might not contain a correct path to headers
++	# We can get the correct path if we ask for a location without a library name
++	gcc_get_lib_location(LIBRARY_NAME "" RES _TMP_VAR)
+ 	set(LIBGCC_INCLUDE_DIRS
+ 		"${_TMP_VAR}/include"
+ 		"${_TMP_VAR}/include-fixed" CACHE STRING "GCC specific include PATHs")
+-- 
+2.25.1
+
diff --git a/meta-arm/recipes-security/trusted-services/files/0005-setting-sysroot-for-libgcc-lookup.patch b/meta-arm/recipes-security/trusted-services/files/0005-setting-sysroot-for-libgcc-lookup.patch
new file mode 100644
index 00000000..b226bc41
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/files/0005-setting-sysroot-for-libgcc-lookup.patch
@@ -0,0 +1,30 @@
+From 0fbf81d10e0f2aabb80105fabe4ffdf87e28e664 Mon Sep 17 00:00:00 2001
+From: Anton Antonov <Anton.Antonov@arm.com>
+Date: Wed, 31 Aug 2022 17:06:07 +0100
+Subject: [PATCH 2/4] Allow setting sysroot for libgcc lookup
+
+Explicitly pass the new variable LIBGCC_LOCATE_CFLAGS variable when searching
+for the compiler libraries.
+
+Upstream-Status: Pending
+Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
+---
+ tools/cmake/compiler/GCC.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/cmake/compiler/GCC.cmake b/tools/cmake/compiler/GCC.cmake
+index 5a8fa59..d591c44 100644
+--- a/tools/cmake/compiler/GCC.cmake
++++ b/tools/cmake/compiler/GCC.cmake
+@@ -268,7 +268,7 @@ function(gcc_get_lib_location)
+ 	cmake_parse_arguments(MY "${options}" "${oneValueArgs}"
+ 						"${multiValueArgs}" ${ARGN} )
+ 	execute_process(
+-		COMMAND ${CMAKE_C_COMPILER} "--print-file-name=${MY_LIBRARY_NAME}"
++		COMMAND ${CMAKE_C_COMPILER} ${LIBGCC_LOCATE_CFLAGS} --print-file-name=${MY_LIBRARY_NAME}
+ 		OUTPUT_VARIABLE _RES
+ 		RESULT_VARIABLE _GCC_ERROR_CODE
+ 		OUTPUT_STRIP_TRAILING_WHITESPACE
+-- 
+2.25.1
+
diff --git a/meta-arm/recipes-security/trusted-services/files/0006-applying-lowercase-project-convention.patch b/meta-arm/recipes-security/trusted-services/files/0006-applying-lowercase-project-convention.patch
new file mode 100644
index 00000000..09f38c00
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/files/0006-applying-lowercase-project-convention.patch
@@ -0,0 +1,32 @@
+From 37559c70443fe85e246f1f652045f0cd3c78012b Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Sat, 13 Nov 2021 07:47:44 +0000
+Subject: [PATCH] tools/cmake/common: applying lowercase project convention
+
+Lowercase convention should only apply on the paths inside TS
+source-code.
+Host build paths should not be lowercased. Otherwise, builds
+with uppercase paths will break.
+
+Upstream-Status: Pending [In review]
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
+
+diff --git a/tools/cmake/common/AddPlatform.cmake b/tools/cmake/common/AddPlatform.cmake
+index ae34c6e..31bcd8c 100644
+--- a/tools/cmake/common/AddPlatform.cmake
++++ b/tools/cmake/common/AddPlatform.cmake
+@@ -37,8 +37,8 @@ function(add_platform)
+ 	set(TGT ${MY_PARAMS_TARGET} CACHE STRING "")
+ 
+ 	# Ensure file path conforms to lowercase project convention
+-	string(TOLOWER "${TS_PLATFORM_ROOT}/${TS_PLATFORM}/platform.cmake" _platdef)
+-	include(${_platdef})
++	string(TOLOWER "${TS_PLATFORM}/platform.cmake" _platdef)
++	include(${TS_PLATFORM_ROOT}/${_platdef})
+ 	set(CMAKE_CONFIGURE_DEPENDS ${_platdef})
+ 
+ 	unset(TGT CACHE)
+-- 
+2.25.1
+
diff --git a/meta-arm/recipes-security/trusted-services/files/0009-PSA-CRYPTO-API-INCLUDE.patch b/meta-arm/recipes-security/trusted-services/files/0009-PSA-CRYPTO-API-INCLUDE.patch
new file mode 100644
index 00000000..9054f1c8
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/files/0009-PSA-CRYPTO-API-INCLUDE.patch
@@ -0,0 +1,39 @@
+From 7f254bf14a97d14d19e61e2b8f8359bc238f3f1b Mon Sep 17 00:00:00 2001
+From: Anton Antonov <Anton.Antonov@arm.com>
+Date: Wed, 31 Aug 2022 17:07:51 +0100
+Subject: [PATCH 3/4] Always define PSA_CRYPTO_API_INCLUDE
+
+PSA_CRYPTO_API_INCLUDE is not defined when pre-built mbedtls was used.
+
+Upstream-Status: Pending
+Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
+---
+ external/MbedTLS/MbedTLS.cmake | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/external/MbedTLS/MbedTLS.cmake b/external/MbedTLS/MbedTLS.cmake
+index 3193a07..f15e25d 100644
+--- a/external/MbedTLS/MbedTLS.cmake
++++ b/external/MbedTLS/MbedTLS.cmake
+@@ -96,8 +96,6 @@ if (NOT MBEDCRYPTO_LIB_FILE)
+ 	#Configure Mbed TLS to build only mbedcrypto lib
+ 	execute_process(COMMAND ${Python3_EXECUTABLE} scripts/config.py crypto WORKING_DIRECTORY ${MBEDTLS_SOURCE_DIR})
+ 
+-	# Advertise Mbed TLS as the provider of the psa crypto API
+-	set(PSA_CRYPTO_API_INCLUDE "${MBEDTLS_INSTALL_DIR}/include" CACHE STRING "PSA Crypto API include path")
+ 
+ 	include(${TS_ROOT}/tools/cmake/common/PropertyCopy.cmake)
+ 
+@@ -157,6 +155,9 @@ if (NOT MBEDCRYPTO_LIB_FILE)
+ 	set(MBEDCRYPTO_LIB_FILE "${MBEDTLS_INSTALL_DIR}/lib/${CMAKE_STATIC_LIBRARY_PREFIX}mbedcrypto${CMAKE_STATIC_LIBRARY_SUFFIX}")
+ endif()
+ 
++# Advertise Mbed TLS as the provider of the psa crypto API
++set(PSA_CRYPTO_API_INCLUDE "${MBEDTLS_INSTALL_DIR}/include" CACHE STRING "PSA Crypto API include path")
++
+ #Create an imported target to have clean abstraction in the build-system.
+ add_library(mbedcrypto STATIC IMPORTED)
+ set_property(DIRECTORY ${CMAKE_SOURCE_DIR} APPEND PROPERTY CMAKE_CONFIGURE_DEPENDS ${MBEDCRYPTO_LIB_FILE})
+-- 
+2.25.1
+
diff --git a/meta-arm/recipes-security/trusted-services/files/0010-change-libts-to-export-CMake-package.patch b/meta-arm/recipes-security/trusted-services/files/0010-change-libts-to-export-CMake-package.patch
new file mode 100644
index 00000000..169ef59f
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/files/0010-change-libts-to-export-CMake-package.patch
@@ -0,0 +1,346 @@
+From 0ff5a6163bd2760bb6a61fd5a185a2b92da5e86b Mon Sep 17 00:00:00 2001
+From: Gyorgy Szing <Gyorgy.Szing@arm.com>
+Date: Wed, 20 Jul 2022 12:36:52 +0000
+Subject: [PATCH] Fix: change libts to export a CMake package
+
+libts install content was not compatible to find_module() which made
+using a pre-built libts binary from CMake less than ideal.
+
+This change adds the missing files and updates export and install
+commands to make libts generate a proper CMake package.
+
+From now on an external project will be able to use find_module() to
+integrate libts into its build.
+
+Signed-off-by: Gyorgy Szing <Gyorgy.Szing@arm.com>
+Change-Id: I9e86e02030f6fb3c86af45252110f939cb82670c
+
+Upstream-Status: Pending [In review]
+Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
+
+---
+
+diff --git a/components/messaging/ffa/libsp/component.cmake b/components/messaging/ffa/libsp/component.cmake
+index a21c630..ec4cf6c 100644
+--- a/components/messaging/ffa/libsp/component.cmake
++++ b/components/messaging/ffa/libsp/component.cmake
+@@ -1,5 +1,5 @@
+ #-------------------------------------------------------------------------------
+-# Copyright (c) 2020-2021, Arm Limited and Contributors. All rights reserved.
++# Copyright (c) 2020-2022, Arm Limited and Contributors. All rights reserved.
+ #
+ # SPDX-License-Identifier: BSD-3-Clause
+ #
+@@ -21,7 +21,7 @@
+ 	"${CMAKE_CURRENT_LIST_DIR}/sp_rxtx.c"
+ 	)
+ 
+-set_property(TARGET ${TGT} PROPERTY PUBLIC_HEADER
++set_property(TARGET ${TGT} APPEND PROPERTY PUBLIC_HEADER
+ 	${CMAKE_CURRENT_LIST_DIR}/include/ffa_api.h
+ 	${CMAKE_CURRENT_LIST_DIR}/include/ffa_api_defines.h
+ 	${CMAKE_CURRENT_LIST_DIR}/include/ffa_api_types.h
+@@ -49,5 +49,5 @@
+ target_include_directories(${TGT}
+ 	 PUBLIC
+ 		"$<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}/include>"
+-		"$<INSTALL_INTERFACE:include>"
++		"$<INSTALL_INTERFACE:${TS_ENV}/include">
+ 	)
+diff --git a/components/rpc/common/interface/component.cmake b/components/rpc/common/interface/component.cmake
+index d567602..e4b2477 100644
+--- a/components/rpc/common/interface/component.cmake
++++ b/components/rpc/common/interface/component.cmake
+@@ -1,5 +1,5 @@
+ #-------------------------------------------------------------------------------
+-# Copyright (c) 2020, Arm Limited and Contributors. All rights reserved.
++# Copyright (c) 2020-2022, Arm Limited and Contributors. All rights reserved.
+ #
+ # SPDX-License-Identifier: BSD-3-Clause
+ #
+@@ -8,11 +8,12 @@
+ 	message(FATAL_ERROR "mandatory parameter TGT is not defined.")
+ endif()
+ 
+-set_property(TARGET ${TGT} PROPERTY RPC_CALLER_PUBLIC_HEADER_FILES
++set_property(TARGET ${TGT} APPEND PROPERTY PUBLIC_HEADER
+ 	"${CMAKE_CURRENT_LIST_DIR}/rpc_caller.h"
+ 	"${CMAKE_CURRENT_LIST_DIR}/rpc_status.h"
+ 	)
+ 
+ target_include_directories(${TGT} PUBLIC
+-	"${CMAKE_CURRENT_LIST_DIR}"
++	"$<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}>"
++	"$<INSTALL_INTERFACE:${TS_ENV}/include>"
+ 	)
+diff --git a/components/service/locator/interface/component.cmake b/components/service/locator/interface/component.cmake
+index b5aefa3..84a4d75 100644
+--- a/components/service/locator/interface/component.cmake
++++ b/components/service/locator/interface/component.cmake
+@@ -1,5 +1,5 @@
+ #-------------------------------------------------------------------------------
+-# Copyright (c) 2020, Arm Limited and Contributors. All rights reserved.
++# Copyright (c) 2020-2022, Arm Limited and Contributors. All rights reserved.
+ #
+ # SPDX-License-Identifier: BSD-3-Clause
+ #
+@@ -8,10 +8,11 @@
+ 	message(FATAL_ERROR "mandatory parameter TGT is not defined.")
+ endif()
+ 
+-set_property(TARGET ${TGT} PROPERTY SERVICE_LOCATOR_PUBLIC_HEADER_FILES
++set_property(TARGET ${TGT} APPEND PROPERTY PUBLIC_HEADER
+ 	"${CMAKE_CURRENT_LIST_DIR}/service_locator.h"
+ 	)
+ 
+ target_include_directories(${TGT} PUBLIC
+-	"${CMAKE_CURRENT_LIST_DIR}"
++	"$<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}>"
++	"$<INSTALL_INTERFACE:${TS_ENV}/include>"
+ 	)
+diff --git a/deployments/libts/libts-import.cmake b/deployments/libts/libts-import.cmake
+index dcabc45..fcfc2ac 100644
+--- a/deployments/libts/libts-import.cmake
++++ b/deployments/libts/libts-import.cmake
+@@ -11,48 +11,18 @@
+ # CMake build file allows libts to be built and installed into the binary
+ # directory of the dependent.
+ #-------------------------------------------------------------------------------
+-
+-# Determine the number of processes to run while running parallel builds.
+-# Pass -DPROCESSOR_COUNT=<n> to cmake to override.
+-if(NOT DEFINED PROCESSOR_COUNT)
+-	include(ProcessorCount)
+-	ProcessorCount(PROCESSOR_COUNT)
+-	set(PROCESSOR_COUNT ${PROCESSOR_COUNT} CACHE STRING "Number of cores to use for parallel builds.")
++option(CFG_FORCE_PREBUILT_LIBTS Off)
++# Try to find a pre-build package.
++find_package(libts "1.0.0" QUIET)
++if(NOT libts_FOUND)
++	if (CFG_FORCE_PREBUILT_LIBTS)
++		string(CONCAT _msg "find_package() failed to find the \"libts\" package. Please set libts_DIR or"
++		                   " CMAKE_FIND_ROOT_PATH properly.\n"
++						   "If you wish to debug the search process pass -DCMAKE_FIND_DEBUG_MODE=ON to cmake.")
++		message(FATAL_ERROR ${_msg})
++	endif()
++	# If not successful, build libts as a sub-project.
++	add_subdirectory(${TS_ROOT}/deployments/libts/${TS_ENV} ${CMAKE_BINARY_DIR}/libts)
++else()
++	message(STATUS "Using prebuilt libts from ${libts_DIR}")
+ endif()
+-
+-set(LIBTS_INSTALL_PATH "${CMAKE_CURRENT_BINARY_DIR}/libts_install" CACHE PATH "libts installation directory")
+-set(LIBTS_PACKAGE_PATH "${LIBTS_INSTALL_PATH}/lib/cmake" CACHE PATH "libts CMake package directory")
+-set(LIBTS_SOURCE_DIR "${TS_ROOT}/deployments/libts/${TS_ENV}" CACHE PATH "libts source directory")
+-set(LIBTS_BINARY_DIR "${CMAKE_CURRENT_BINARY_DIR}/_deps/libts-build" CACHE PATH "libts binary directory")
+-
+-file(MAKE_DIRECTORY ${LIBTS_BINARY_DIR})
+-
+-#Configure the library
+-execute_process(COMMAND
+-	${CMAKE_COMMAND}
+-		-DCMAKE_INSTALL_PREFIX=${LIBTS_INSTALL_PATH}
+-		-GUnix\ Makefiles
+-		-S ${LIBTS_SOURCE_DIR}
+-		-B ${LIBTS_BINARY_DIR}
+-	RESULT_VARIABLE _exec_error
+-)
+-
+-if (_exec_error)
+-	message(FATAL_ERROR "Configuration step of libts failed with ${_exec_error}.")
+-endif()
+-
+-#Build the library
+-execute_process(COMMAND
+-	${CMAKE_COMMAND} --build ${LIBTS_BINARY_DIR} --parallel ${PROCESSOR_COUNT} --target install
+-	RESULT_VARIABLE _exec_error
+-)
+-
+-if (_exec_error)
+-	message(FATAL_ERROR "Build step of libts failed with ${_exec_error}.")
+-endif()
+-
+-# Import the built library
+-include(${LIBTS_INSTALL_PATH}/${TS_ENV}/lib/cmake/libts_targets.cmake)
+-add_library(libts SHARED IMPORTED)
+-set_property(TARGET libts PROPERTY INTERFACE_INCLUDE_DIRECTORIES "${LIBTS_INSTALL_PATH}/${TS_ENV}/include")
+-set_property(TARGET libts PROPERTY IMPORTED_LOCATION "${LIBTS_INSTALL_PATH}/${TS_ENV}/lib/${CMAKE_SHARED_LIBRARY_PREFIX}ts${CMAKE_SHARED_LIBRARY_SUFFIX}")
+diff --git a/deployments/libts/libts.cmake b/deployments/libts/libts.cmake
+index 6463ca1..7f278fd 100644
+--- a/deployments/libts/libts.cmake
++++ b/deployments/libts/libts.cmake
+@@ -1,5 +1,5 @@
+ #-------------------------------------------------------------------------------
+-# Copyright (c) 2020-2021, Arm Limited and Contributors. All rights reserved.
++# Copyright (c) 2020-2022, Arm Limited and Contributors. All rights reserved.
+ #
+ # SPDX-License-Identifier: BSD-3-Clause
+ #
+@@ -18,12 +18,11 @@
+ 					MAJOR _major MINOR _minor PATCH _patch)
+ set_target_properties(ts PROPERTIES VERSION "${_major}.${_minor}.${_patch}")
+ set_target_properties(ts PROPERTIES SOVERSION "${_major}")
+-unset(_major)
+-unset(_minor)
+-unset(_patch)
++
++add_library(libts::ts ALIAS ts)
+ 
+ #-------------------------------------------------------------------------------
+-#  Components that are common accross all deployments
++#  Components that are common across all deployments
+ #
+ #-------------------------------------------------------------------------------
+ add_components(
+@@ -53,19 +52,13 @@
+ #-------------------------------------------------------------------------------
+ include(${TS_ROOT}/tools/cmake/common/ExportLibrary.cmake REQUIRED)
+ 
+-# Select public header files to export
+-get_property(_rpc_caller_public_header_files TARGET ts
+-	PROPERTY RPC_CALLER_PUBLIC_HEADER_FILES
+-)
+-
+-get_property(_service_locator_public_header_files TARGET ts
+-	PROPERTY SERVICE_LOCATOR_PUBLIC_HEADER_FILES
+-)
++get_property(_tmp TARGET ts PROPERTY PUBLIC_HEADER)
+ 
+ # Exports library information in preparation for install
+ export_library(
+ 	TARGET "ts"
+ 	LIB_NAME "libts"
++	PKG_CONFIG_FILE "${CMAKE_CURRENT_LIST_DIR}/libtsConfig.cmake.in"
+ 	INTERFACE_FILES
+ 		${_rpc_caller_public_header_files}
+ 		${_service_locator_public_header_files}
+diff --git a/deployments/libts/libtsConfig.cmake.in b/deployments/libts/libtsConfig.cmake.in
+new file mode 100644
+index 0000000..4860135
+--- /dev/null
++++ b/deployments/libts/libtsConfig.cmake.in
+@@ -0,0 +1,10 @@
++#
++# Copyright (c) 2020-2022, Arm Limited and Contributors. All rights reserved.
++#
++# SPDX-License-Identifier: BSD-3-Clause
++#
++
++@PACKAGE_INIT@
++
++include("${CMAKE_CURRENT_LIST_DIR}/libtsTargets.cmake")
++
+diff --git a/tools/cmake/common/ExportLibrary.cmake b/tools/cmake/common/ExportLibrary.cmake
+index fed4e75..4fcf481 100644
+--- a/tools/cmake/common/ExportLibrary.cmake
++++ b/tools/cmake/common/ExportLibrary.cmake
+@@ -1,5 +1,5 @@
+ #-------------------------------------------------------------------------------
+-# Copyright (c) 2020-2021, Arm Limited and Contributors. All rights reserved.
++# Copyright (c) 2020-2022, Arm Limited and Contributors. All rights reserved.
+ #
+ # SPDX-License-Identifier: BSD-3-Clause
+ #
+@@ -26,17 +26,29 @@
+ #]===]
+ function(export_library)
+ 	set(options  )
+-	set(oneValueArgs TARGET LIB_NAME)
++	set(oneValueArgs TARGET LIB_NAME PKG_CONFIG_FILE)
+ 	set(multiValueArgs INTERFACE_FILES)
+ 	cmake_parse_arguments(MY_PARAMS "${options}" "${oneValueArgs}"
+ 						"${multiValueArgs}" ${ARGN} )
+ 
+-	if(NOT DEFINED MY_PARAMS_TARGET)
+-		message(FATAL_ERROR "export_library: mandatory parameter TARGET not defined!")
++	foreach(_param IN ITEMS MY_PARAMS_TARGET MY_PARAMS_LIB_NAME MY_PARAMS_PKG_CONFIG_FILE)
++		if(NOT DEFINED ${_param})
++			list(APPEND _miss_params "${_param}" )
++		endif()
++	endforeach()
++
++	if (_miss_params)
++		string(REPLACE ";" ", " _miss_params "${_miss_params}")
++		message(FATAL_ERROR "export_library: mandatory parameter(s) ${_miss_params} not defined!")
+ 	endif()
+-	if(NOT DEFINED MY_PARAMS_LIB_NAME)
+-		message(FATAL_ERROR "export_library: mandatory parameter LIB_NAME not defined!")
+-	endif()
++
++
++	string(TOUPPER "${MY_PARAMS_LIB_NAME}" UC_LIB_NAME)
++	string(TOLOWER "${MY_PARAMS_LIB_NAME}" LC_LIB_NAME)
++	string(SUBSTRING "${UC_LIB_NAME}" 0 1 CAP_LIB_NAME)
++	string(SUBSTRING "${LC_LIB_NAME}" 1 -1 _tmp)
++	string(APPEND CAP_LIB_NAME "${_tmp}")
++
+ 
+ 	# Set default install location if none specified
+ 	if (CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
+@@ -55,6 +67,42 @@
+ 			DESTINATION ${TS_ENV}/include
+ 	)
+ 
++	# Create a config file package.
++	include(CMakePackageConfigHelpers)
++	get_target_property(_ver ${MY_PARAMS_TARGET} VERSION)
++	write_basic_package_version_file(
++		"${CMAKE_CURRENT_BINARY_DIR}/${LC_LIB_NAME}ConfigVersion.cmake"
++		VERSION "${_ver}"
++		COMPATIBILITY SameMajorVersion
++	)
++
++	# Create targets file.
++	export(
++		EXPORT
++			${MY_PARAMS_LIB_NAME}_targets
++		FILE
++			"${CMAKE_CURRENT_BINARY_DIR}/${MY_PARAMS_LIB_NAME}Targets.cmake"
++		NAMESPACE
++			${MY_PARAMS_LIB_NAME}::
++	)
++
++	# Finalize config file.
++	# Config package location relative to install root.
++	set(ConfigPackageLocation ${TS_ENV}/lib/cmake)
++	# Config package location ??
++	get_filename_component(ConfigPackageLocationRel ${ConfigPackageLocation} PATH)
++
++	get_filename_component(_configured_pkgcfg_name "${MY_PARAMS_PKG_CONFIG_FILE}" NAME_WLE)
++	set(_configured_pkgcfg_name "${CMAKE_CURRENT_BINARY_DIR}/${_configured_pkgcfg_name}")
++	configure_package_config_file(
++			"${MY_PARAMS_PKG_CONFIG_FILE}"
++			"${_configured_pkgcfg_name}"
++		PATH_VARS
++
++		INSTALL_DESTINATION
++			${ConfigPackageLocationRel}
++	)
++
+ 	# Install library header files files
+ 	install(
+ 		FILES ${MY_PARAMS_INTERFACE_FILES}
+@@ -64,9 +112,21 @@
+ 	# Install the export details
+ 	install(
+ 		EXPORT ${MY_PARAMS_LIB_NAME}_targets
+-		FILE ${MY_PARAMS_LIB_NAME}_targets.cmake
++		FILE ${MY_PARAMS_LIB_NAME}Targets.cmake
+ 		NAMESPACE ${MY_PARAMS_LIB_NAME}::
+-		DESTINATION ${TS_ENV}/lib/cmake
++		DESTINATION ${ConfigPackageLocation}
+ 		COMPONENT ${MY_PARAMS_LIB_NAME}
+ 	)
++
++
++	# install config and version files
++	install(
++		FILES
++			"${_configured_pkgcfg_name}"
++			"${CMAKE_CURRENT_BINARY_DIR}/${LC_LIB_NAME}ConfigVersion.cmake"
++		DESTINATION
++			${ConfigPackageLocation}
++		COMPONENT
++			${MY_PARAMS_LIB_NAME}
++	)
+ endfunction()
diff --git a/meta-arm/recipes-security/trusted-services/files/0011-Adapt-deployments-to-libts-changes.patch b/meta-arm/recipes-security/trusted-services/files/0011-Adapt-deployments-to-libts-changes.patch
new file mode 100644
index 00000000..34b10357
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/files/0011-Adapt-deployments-to-libts-changes.patch
@@ -0,0 +1,197 @@
+From dfadca01ff028f9fc935937cdaf92b0effff2b90 Mon Sep 17 00:00:00 2001
+From: Gyorgy Szing <Gyorgy.Szing@arm.com>
+Date: Wed, 20 Jul 2022 16:49:39 +0000
+Subject: [PATCH] Adapt deployments to libts changes
+
+Update deployments and restore compatibility to libts build-system
+interface changes.
+
+Signed-off-by: Gyorgy Szing <Gyorgy.Szing@arm.com>
+Change-Id: Iffd38f92fe628a2a6aaff60224986f22ec3a8a2a
+
+Upstream-Status: Pending [In review]
+Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
+
+---
+
+diff --git a/deployments/platform-inspect/platform-inspect.cmake b/deployments/platform-inspect/platform-inspect.cmake
+index ef4ba4b..b1b316d 100644
+--- a/deployments/platform-inspect/platform-inspect.cmake
++++ b/deployments/platform-inspect/platform-inspect.cmake
+@@ -1,5 +1,5 @@
+ #-------------------------------------------------------------------------------
+-# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++# Copyright (c) 2021-2022, Arm Limited and Contributors. All rights reserved.
+ #
+ # SPDX-License-Identifier: BSD-3-Clause
+ #
+@@ -12,14 +12,14 @@
+ 
+ #-------------------------------------------------------------------------------
+ #  Use libts for locating and accessing trusted services. An appropriate version
+-#  of libts will be imported for the enviroment in which platform-inspect is
++#  of libts will be imported for the environment in which platform-inspect is
+ #  built.
+ #-------------------------------------------------------------------------------
+ include(${TS_ROOT}/deployments/libts/libts-import.cmake)
+-target_link_libraries(platform-inspect PRIVATE libts)
++target_link_libraries(platform-inspect PRIVATE libts::ts)
+ 
+ #-------------------------------------------------------------------------------
+-#  Components that are common accross all deployments
++#  Components that are common across all deployments
+ #
+ #-------------------------------------------------------------------------------
+ add_components(
+diff --git a/deployments/psa-api-test/psa-api-test.cmake b/deployments/psa-api-test/psa-api-test.cmake
+index d58620f..5c3469c 100644
+--- a/deployments/psa-api-test/psa-api-test.cmake
++++ b/deployments/psa-api-test/psa-api-test.cmake
+@@ -1,5 +1,5 @@
+ #-------------------------------------------------------------------------------
+-# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++# Copyright (c) 2021-2022, Arm Limited and Contributors. All rights reserved.
+ #
+ # SPDX-License-Identifier: BSD-3-Clause
+ #
+@@ -12,14 +12,14 @@
+ 
+ #-------------------------------------------------------------------------------
+ #  Use libts for locating and accessing services. An appropriate version of
+-#  libts will be imported for the enviroment in which service tests are
++#  libts will be imported for the environment in which service tests are
+ #  deployed.
+ #-------------------------------------------------------------------------------
+ include(${TS_ROOT}/deployments/libts/libts-import.cmake)
+-target_link_libraries(${PROJECT_NAME} PRIVATE libts)
++target_link_libraries(${PROJECT_NAME} PRIVATE libts::ts)
+ 
+ #-------------------------------------------------------------------------------
+-#  Components that are common accross all deployments
++#  Components that are common across all deployments
+ #
+ #-------------------------------------------------------------------------------
+ add_components(
+diff --git a/deployments/ts-demo/ts-demo.cmake b/deployments/ts-demo/ts-demo.cmake
+index 3e7cca0..9fd8585 100644
+--- a/deployments/ts-demo/ts-demo.cmake
++++ b/deployments/ts-demo/ts-demo.cmake
+@@ -1,5 +1,5 @@
+ #-------------------------------------------------------------------------------
+-# Copyright (c) 2020-2021, Arm Limited and Contributors. All rights reserved.
++# Copyright (c) 2020-2022, Arm Limited and Contributors. All rights reserved.
+ #
+ # SPDX-License-Identifier: BSD-3-Clause
+ #
+@@ -13,11 +13,11 @@
+ 
+ #-------------------------------------------------------------------------------
+ #  Use libts for locating and accessing services. An appropriate version of
+-#  libts will be imported for the enviroment in which service tests are
++#  libts will be imported for the environment in which service tests are
+ #  deployed.
+ #-------------------------------------------------------------------------------
+ include(${TS_ROOT}/deployments/libts/libts-import.cmake)
+-target_link_libraries(ts-demo PRIVATE libts)
++target_link_libraries(ts-demo PRIVATE libts::ts)
+ 
+ #-------------------------------------------------------------------------------
+ #  Common main for all deployments
+@@ -28,7 +28,7 @@
+ )
+ 
+ #-------------------------------------------------------------------------------
+-#  Components that are common accross all deployments
++#  Components that are common across all deployments
+ #
+ #-------------------------------------------------------------------------------
+ add_components(
+diff --git a/deployments/ts-remote-test/ts-remote-test.cmake b/deployments/ts-remote-test/ts-remote-test.cmake
+index 0f35bb2..c310445 100644
+--- a/deployments/ts-remote-test/ts-remote-test.cmake
++++ b/deployments/ts-remote-test/ts-remote-test.cmake
+@@ -1,5 +1,5 @@
+ #-------------------------------------------------------------------------------
+-# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++# Copyright (c) 2021-2022, Arm Limited and Contributors. All rights reserved.
+ #
+ # SPDX-License-Identifier: BSD-3-Clause
+ #
+@@ -13,11 +13,11 @@
+ 
+ #-------------------------------------------------------------------------------
+ #  Use libts for locating and accessing services. An appropriate version of
+-#  libts will be imported for the enviroment in which tests are
++#  libts will be imported for the environment in which tests are
+ #  deployed.
+ #-------------------------------------------------------------------------------
+ include(${TS_ROOT}/deployments/libts/libts-import.cmake)
+-target_link_libraries(ts-remote-test PRIVATE libts)
++target_link_libraries(ts-remote-test PRIVATE libts::ts)
+ 
+ #-------------------------------------------------------------------------------
+ #  Common main for all deployments
+@@ -28,7 +28,7 @@
+ )
+ 
+ #-------------------------------------------------------------------------------
+-#  Components that are common accross all deployments
++#  Components that are common across all deployments
+ #
+ #-------------------------------------------------------------------------------
+ add_components(
+diff --git a/deployments/ts-service-test/ts-service-test.cmake b/deployments/ts-service-test/ts-service-test.cmake
+index 4a8c59c..3e33757 100644
+--- a/deployments/ts-service-test/ts-service-test.cmake
++++ b/deployments/ts-service-test/ts-service-test.cmake
+@@ -1,5 +1,5 @@
+ #-------------------------------------------------------------------------------
+-# Copyright (c) 2020-2021, Arm Limited and Contributors. All rights reserved.
++# Copyright (c) 2020-2022, Arm Limited and Contributors. All rights reserved.
+ #
+ # SPDX-License-Identifier: BSD-3-Clause
+ #
+@@ -8,19 +8,19 @@
+ #-------------------------------------------------------------------------------
+ #  The base build file shared between deployments of 'ts-service-test' for
+ #  different environments.  Used for running end-to-end service-level tests
+-#  where test cases excerise trusted service client interfaces.
++#  where test cases exercise trusted service client interfaces.
+ #-------------------------------------------------------------------------------
+ 
+ #-------------------------------------------------------------------------------
+ #  Use libts for locating and accessing services. An appropriate version of
+-#  libts will be imported for the enviroment in which service tests are
++#  libts will be imported for the environment in which service tests are
+ #  deployed.
+ #-------------------------------------------------------------------------------
+ include(${TS_ROOT}/deployments/libts/libts-import.cmake)
+-target_link_libraries(ts-service-test PRIVATE libts)
++target_link_libraries(ts-service-test PRIVATE libts::ts)
+ 
+ #-------------------------------------------------------------------------------
+-#  Components that are common accross all deployments
++#  Components that are common across all deployments
+ #
+ #-------------------------------------------------------------------------------
+ add_components(
+diff --git a/deployments/uefi-test/uefi-test.cmake b/deployments/uefi-test/uefi-test.cmake
+index ea678d0..2f47891 100644
+--- a/deployments/uefi-test/uefi-test.cmake
++++ b/deployments/uefi-test/uefi-test.cmake
+@@ -1,5 +1,5 @@
+ #-------------------------------------------------------------------------------
+-# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++# Copyright (c) 2021-2022, Arm Limited and Contributors. All rights reserved.
+ #
+ # SPDX-License-Identifier: BSD-3-Clause
+ #
+@@ -18,7 +18,7 @@
+ #  deployed.
+ #-------------------------------------------------------------------------------
+ include(${TS_ROOT}/deployments/libts/libts-import.cmake)
+-target_link_libraries(uefi-test PRIVATE libts)
++target_link_libraries(uefi-test PRIVATE libts::ts)
+ 
+ #-------------------------------------------------------------------------------
+ #  Components that are common accross all deployments
diff --git a/meta-arm/recipes-security/trusted-services/files/0012-psa-arch-test-toolchain.patch b/meta-arm/recipes-security/trusted-services/files/0012-psa-arch-test-toolchain.patch
new file mode 100644
index 00000000..7d07fca8
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/files/0012-psa-arch-test-toolchain.patch
@@ -0,0 +1,40 @@
+From 1ce8fcde17a6d2c5cb2e00901d485c91eda776fd Mon Sep 17 00:00:00 2001
+From: Anton Antonov <Anton.Antonov@arm.com>
+Date: Wed, 31 Aug 2022 17:09:17 +0100
+Subject: [PATCH 4/4] Pass Yocto build settings to psa-arch-tests native build
+
+PSA-arch-tests need to build a native executable as a part of target build.
+The patch defines correct toolchain settings for native builds.
+
+Upstream-Status: Inappropriate [Yocto build specific change]
+Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
+---
+ .../psa_arch_tests/modify_attest_config.patch     | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/external/psa_arch_tests/modify_attest_config.patch b/external/psa_arch_tests/modify_attest_config.patch
+index ebe8c44..b5d5e88 100644
+--- a/external/psa_arch_tests/modify_attest_config.patch
++++ b/external/psa_arch_tests/modify_attest_config.patch
+@@ -11,3 +11,18 @@ index 6112ba7..1cdf581 100755
+  
+  /*
+   * Include of PSA defined Header files
++diff --git a/api-tests/tools/scripts/target_cfg/CMakeLists.txt b/api-tests/tools/scripts/target_cfg/CMakeLists.txt
++index 259eb9c..fec1fb8 100644
++--- a/api-tests/tools/scripts/target_cfg/CMakeLists.txt
+++++ b/api-tests/tools/scripts/target_cfg/CMakeLists.txt
++@@ -26,7 +26,9 @@ include("common/CMakeSettings")
++ include("common/Utils")
++ 
++ # Causes toolchain to be re-evaluated
++-unset(ENV{CC})
+++set(ENV{CC} $ENV{BUILD_CC})
+++set(ENV{CFLAGS} $ENV{BUILD_CFLAGS})
+++set(ENV{LDFLAGS} $ENV{BUILD_LDFLAGS})
++ 
++ # Let the CMake look for C compiler
++ project(TargetConfigGen LANGUAGES C)
+-- 
+2.25.1
+
diff --git a/meta-arm/recipes-security/trusted-services/files/0017-Move-libsp-mocks-into-separate-component.patch b/meta-arm/recipes-security/trusted-services/files/0017-Move-libsp-mocks-into-separate-component.patch
new file mode 100644
index 00000000..d6da370a
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/files/0017-Move-libsp-mocks-into-separate-component.patch
@@ -0,0 +1,349 @@
+From 2cd802030ab59787a34c0f6684c16848befabafa Mon Sep 17 00:00:00 2001
+From: Imre Kis <imre.kis@arm.com>
+Date: Wed, 15 Jun 2022 12:47:37 +0200
+Subject: [PATCH 17/24] Move libsp mocks into separate component
+
+Enable deployments to include libsp mocks in tests by simply adding
+the newly created libsp mock component.
+
+Signed-off-by: Imre Kis <imre.kis@arm.com>
+Change-Id: I40805fd49362c6cc71b5b34f9ba888d27ce01ed8
+
+Upstream-Status: Pending [In review]
+Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
+
+---
+ .../messaging/ffa/libsp/mock/component.cmake  | 27 ++++++++++
+ .../ffa/libsp/{test => mock}/mock_assert.cpp  |  0
+ .../ffa/libsp/{test => mock}/mock_assert.h    |  0
+ .../ffa/libsp/{test => mock}/mock_ffa_api.cpp |  0
+ .../ffa/libsp/{test => mock}/mock_ffa_api.h   |  0
+ .../{test => mock}/mock_ffa_internal_api.cpp  |  0
+ .../{test => mock}/mock_ffa_internal_api.h    |  0
+ .../ffa/libsp/{test => mock}/mock_sp_rxtx.cpp |  0
+ .../ffa/libsp/{test => mock}/mock_sp_rxtx.h   |  0
+ .../{ => mock}/test/test_mock_assert.cpp      |  0
+ .../{ => mock}/test/test_mock_ffa_api.cpp     |  0
+ .../test/test_mock_ffa_internal_api.cpp       |  0
+ .../{ => mock}/test/test_mock_sp_rxtx.cpp     |  0
+ components/messaging/ffa/libsp/tests.cmake    | 51 +++++++++++--------
+ .../mm_communicate/endpoint/sp/tests.cmake    |  6 +--
+ .../frontend/mm_communicate/tests.cmake       |  6 +--
+ 16 files changed, 64 insertions(+), 26 deletions(-)
+ create mode 100644 components/messaging/ffa/libsp/mock/component.cmake
+ rename components/messaging/ffa/libsp/{test => mock}/mock_assert.cpp (100%)
+ rename components/messaging/ffa/libsp/{test => mock}/mock_assert.h (100%)
+ rename components/messaging/ffa/libsp/{test => mock}/mock_ffa_api.cpp (100%)
+ rename components/messaging/ffa/libsp/{test => mock}/mock_ffa_api.h (100%)
+ rename components/messaging/ffa/libsp/{test => mock}/mock_ffa_internal_api.cpp (100%)
+ rename components/messaging/ffa/libsp/{test => mock}/mock_ffa_internal_api.h (100%)
+ rename components/messaging/ffa/libsp/{test => mock}/mock_sp_rxtx.cpp (100%)
+ rename components/messaging/ffa/libsp/{test => mock}/mock_sp_rxtx.h (100%)
+ rename components/messaging/ffa/libsp/{ => mock}/test/test_mock_assert.cpp (100%)
+ rename components/messaging/ffa/libsp/{ => mock}/test/test_mock_ffa_api.cpp (100%)
+ rename components/messaging/ffa/libsp/{ => mock}/test/test_mock_ffa_internal_api.cpp (100%)
+ rename components/messaging/ffa/libsp/{ => mock}/test/test_mock_sp_rxtx.cpp (100%)
+
+diff --git a/components/messaging/ffa/libsp/mock/component.cmake b/components/messaging/ffa/libsp/mock/component.cmake
+new file mode 100644
+index 0000000..03b8006
+--- /dev/null
++++ b/components/messaging/ffa/libsp/mock/component.cmake
+@@ -0,0 +1,27 @@
++#-------------------------------------------------------------------------------
++# Copyright (c) 2022, Arm Limited and Contributors. All rights reserved.
++#
++# SPDX-License-Identifier: BSD-3-Clause
++#
++#-------------------------------------------------------------------------------
++if (NOT DEFINED TGT)
++	message(FATAL_ERROR "mandatory parameter TGT is not defined.")
++endif()
++
++target_sources(${TGT} PRIVATE
++	"${CMAKE_CURRENT_LIST_DIR}/mock_assert.cpp"
++	"${CMAKE_CURRENT_LIST_DIR}/mock_ffa_api.cpp"
++	"${CMAKE_CURRENT_LIST_DIR}/mock_ffa_internal_api.cpp"
++	"${CMAKE_CURRENT_LIST_DIR}/mock_sp_rxtx.cpp"
++	)
++
++target_include_directories(${TGT}
++	PUBLIC
++		${CMAKE_CURRENT_LIST_DIR}
++		${CMAKE_CURRENT_LIST_DIR}/../include
++)
++
++target_compile_definitions(${TGT}
++	PUBLIC
++		"ARM64=1"
++)
+\ No newline at end of file
+diff --git a/components/messaging/ffa/libsp/test/mock_assert.cpp b/components/messaging/ffa/libsp/mock/mock_assert.cpp
+similarity index 100%
+rename from components/messaging/ffa/libsp/test/mock_assert.cpp
+rename to components/messaging/ffa/libsp/mock/mock_assert.cpp
+diff --git a/components/messaging/ffa/libsp/test/mock_assert.h b/components/messaging/ffa/libsp/mock/mock_assert.h
+similarity index 100%
+rename from components/messaging/ffa/libsp/test/mock_assert.h
+rename to components/messaging/ffa/libsp/mock/mock_assert.h
+diff --git a/components/messaging/ffa/libsp/test/mock_ffa_api.cpp b/components/messaging/ffa/libsp/mock/mock_ffa_api.cpp
+similarity index 100%
+rename from components/messaging/ffa/libsp/test/mock_ffa_api.cpp
+rename to components/messaging/ffa/libsp/mock/mock_ffa_api.cpp
+diff --git a/components/messaging/ffa/libsp/test/mock_ffa_api.h b/components/messaging/ffa/libsp/mock/mock_ffa_api.h
+similarity index 100%
+rename from components/messaging/ffa/libsp/test/mock_ffa_api.h
+rename to components/messaging/ffa/libsp/mock/mock_ffa_api.h
+diff --git a/components/messaging/ffa/libsp/test/mock_ffa_internal_api.cpp b/components/messaging/ffa/libsp/mock/mock_ffa_internal_api.cpp
+similarity index 100%
+rename from components/messaging/ffa/libsp/test/mock_ffa_internal_api.cpp
+rename to components/messaging/ffa/libsp/mock/mock_ffa_internal_api.cpp
+diff --git a/components/messaging/ffa/libsp/test/mock_ffa_internal_api.h b/components/messaging/ffa/libsp/mock/mock_ffa_internal_api.h
+similarity index 100%
+rename from components/messaging/ffa/libsp/test/mock_ffa_internal_api.h
+rename to components/messaging/ffa/libsp/mock/mock_ffa_internal_api.h
+diff --git a/components/messaging/ffa/libsp/test/mock_sp_rxtx.cpp b/components/messaging/ffa/libsp/mock/mock_sp_rxtx.cpp
+similarity index 100%
+rename from components/messaging/ffa/libsp/test/mock_sp_rxtx.cpp
+rename to components/messaging/ffa/libsp/mock/mock_sp_rxtx.cpp
+diff --git a/components/messaging/ffa/libsp/test/mock_sp_rxtx.h b/components/messaging/ffa/libsp/mock/mock_sp_rxtx.h
+similarity index 100%
+rename from components/messaging/ffa/libsp/test/mock_sp_rxtx.h
+rename to components/messaging/ffa/libsp/mock/mock_sp_rxtx.h
+diff --git a/components/messaging/ffa/libsp/test/test_mock_assert.cpp b/components/messaging/ffa/libsp/mock/test/test_mock_assert.cpp
+similarity index 100%
+rename from components/messaging/ffa/libsp/test/test_mock_assert.cpp
+rename to components/messaging/ffa/libsp/mock/test/test_mock_assert.cpp
+diff --git a/components/messaging/ffa/libsp/test/test_mock_ffa_api.cpp b/components/messaging/ffa/libsp/mock/test/test_mock_ffa_api.cpp
+similarity index 100%
+rename from components/messaging/ffa/libsp/test/test_mock_ffa_api.cpp
+rename to components/messaging/ffa/libsp/mock/test/test_mock_ffa_api.cpp
+diff --git a/components/messaging/ffa/libsp/test/test_mock_ffa_internal_api.cpp b/components/messaging/ffa/libsp/mock/test/test_mock_ffa_internal_api.cpp
+similarity index 100%
+rename from components/messaging/ffa/libsp/test/test_mock_ffa_internal_api.cpp
+rename to components/messaging/ffa/libsp/mock/test/test_mock_ffa_internal_api.cpp
+diff --git a/components/messaging/ffa/libsp/test/test_mock_sp_rxtx.cpp b/components/messaging/ffa/libsp/mock/test/test_mock_sp_rxtx.cpp
+similarity index 100%
+rename from components/messaging/ffa/libsp/test/test_mock_sp_rxtx.cpp
+rename to components/messaging/ffa/libsp/mock/test/test_mock_sp_rxtx.cpp
+diff --git a/components/messaging/ffa/libsp/tests.cmake b/components/messaging/ffa/libsp/tests.cmake
+index d851442..296ae46 100644
+--- a/components/messaging/ffa/libsp/tests.cmake
++++ b/components/messaging/ffa/libsp/tests.cmake
+@@ -1,5 +1,5 @@
+ #
+-# Copyright (c) 2020-2021, Arm Limited. All rights reserved.
++# Copyright (c) 2020-2022, Arm Limited. All rights reserved.
+ #
+ # SPDX-License-Identifier: BSD-3-Clause
+ #
+@@ -9,10 +9,11 @@ include(UnitTest)
+ unit_test_add_suite(
+ 	NAME libsp_mock_assert
+ 	SOURCES
+-		${CMAKE_CURRENT_LIST_DIR}/test/mock_assert.cpp
+-		${CMAKE_CURRENT_LIST_DIR}/test/test_mock_assert.cpp
++		${CMAKE_CURRENT_LIST_DIR}/mock/mock_assert.cpp
++		${CMAKE_CURRENT_LIST_DIR}/mock/test/test_mock_assert.cpp
+ 	INCLUDE_DIRECTORIES
+ 		${CMAKE_CURRENT_LIST_DIR}/include/
++		${CMAKE_CURRENT_LIST_DIR}/mock
+ 		${UNIT_TEST_PROJECT_PATH}/components/common/utils/include
+ 	COMPILE_DEFINITIONS
+ 		-DARM64
+@@ -21,10 +22,11 @@ unit_test_add_suite(
+ unit_test_add_suite(
+ 	NAME libsp_mock_ffa_internal_api
+ 	SOURCES
+-		${CMAKE_CURRENT_LIST_DIR}/test/mock_ffa_internal_api.cpp
+-		${CMAKE_CURRENT_LIST_DIR}/test/test_mock_ffa_internal_api.cpp
++		${CMAKE_CURRENT_LIST_DIR}/mock/mock_ffa_internal_api.cpp
++		${CMAKE_CURRENT_LIST_DIR}/mock/test/test_mock_ffa_internal_api.cpp
+ 	INCLUDE_DIRECTORIES
+ 		${CMAKE_CURRENT_LIST_DIR}/include/
++		${CMAKE_CURRENT_LIST_DIR}/mock
+ 		${UNIT_TEST_PROJECT_PATH}/components/common/utils/include
+ 	COMPILE_DEFINITIONS
+ 		-DARM64
+@@ -35,12 +37,13 @@ unit_test_add_suite(
+ 	SOURCES
+ 		${CMAKE_CURRENT_LIST_DIR}/test/test_ffa_api.cpp
+ 		${CMAKE_CURRENT_LIST_DIR}/test/test_ffa_memory_descriptors.cpp
+-		${CMAKE_CURRENT_LIST_DIR}/test/mock_ffa_internal_api.cpp
++		${CMAKE_CURRENT_LIST_DIR}/mock/mock_ffa_internal_api.cpp
+ 		${CMAKE_CURRENT_LIST_DIR}/ffa.c
+ 		${CMAKE_CURRENT_LIST_DIR}/ffa_memory_descriptors.c
+-		${CMAKE_CURRENT_LIST_DIR}/test/mock_assert.cpp
++		${CMAKE_CURRENT_LIST_DIR}/mock/mock_assert.cpp
+ 	INCLUDE_DIRECTORIES
+ 		${CMAKE_CURRENT_LIST_DIR}/include/
++		${CMAKE_CURRENT_LIST_DIR}/mock
+ 		${UNIT_TEST_PROJECT_PATH}/components/common/utils/include
+ 	COMPILE_DEFINITIONS
+ 		-DARM64
+@@ -49,10 +52,11 @@ unit_test_add_suite(
+ unit_test_add_suite(
+ 	NAME libsp_mock_ffa_api
+ 	SOURCES
+-		${CMAKE_CURRENT_LIST_DIR}/test/test_mock_ffa_api.cpp
+-		${CMAKE_CURRENT_LIST_DIR}/test/mock_ffa_api.cpp
++		${CMAKE_CURRENT_LIST_DIR}/mock/test/test_mock_ffa_api.cpp
++		${CMAKE_CURRENT_LIST_DIR}/mock/mock_ffa_api.cpp
+ 	INCLUDE_DIRECTORIES
+ 		${CMAKE_CURRENT_LIST_DIR}/include/
++		${CMAKE_CURRENT_LIST_DIR}/mock
+ 		${UNIT_TEST_PROJECT_PATH}/components/common/utils/include
+ 	COMPILE_DEFINITIONS
+ 		-DARM64
+@@ -62,10 +66,11 @@ unit_test_add_suite(
+ 	NAME libsp_sp_rxtx
+ 	SOURCES
+ 		${CMAKE_CURRENT_LIST_DIR}/test/test_sp_rxtx.cpp
+-		${CMAKE_CURRENT_LIST_DIR}/test/mock_ffa_api.cpp
++		${CMAKE_CURRENT_LIST_DIR}/mock/mock_ffa_api.cpp
+ 		${CMAKE_CURRENT_LIST_DIR}/sp_rxtx.c
+ 	INCLUDE_DIRECTORIES
+ 		${CMAKE_CURRENT_LIST_DIR}/include/
++		${CMAKE_CURRENT_LIST_DIR}/mock
+ 		${UNIT_TEST_PROJECT_PATH}/components/common/utils/include
+ 	COMPILE_DEFINITIONS
+ 		-DARM64
+@@ -74,10 +79,11 @@ unit_test_add_suite(
+ unit_test_add_suite(
+ 	NAME libsp_mock_sp_rxtx
+ 	SOURCES
+-		${CMAKE_CURRENT_LIST_DIR}/test/test_mock_sp_rxtx.cpp
+-		${CMAKE_CURRENT_LIST_DIR}/test/mock_sp_rxtx.cpp
++		${CMAKE_CURRENT_LIST_DIR}/mock/test/test_mock_sp_rxtx.cpp
++		${CMAKE_CURRENT_LIST_DIR}/mock/mock_sp_rxtx.cpp
+ 	INCLUDE_DIRECTORIES
+ 		${CMAKE_CURRENT_LIST_DIR}/include/
++		${CMAKE_CURRENT_LIST_DIR}/mock
+ 		${UNIT_TEST_PROJECT_PATH}/components/common/utils/include
+ 	COMPILE_DEFINITIONS
+ 		-DARM64
+@@ -88,10 +94,11 @@ unit_test_add_suite(
+ 	SOURCES
+ 		${CMAKE_CURRENT_LIST_DIR}/test/test_sp_discovery.cpp
+ 		${CMAKE_CURRENT_LIST_DIR}/sp_discovery.c
+-		${CMAKE_CURRENT_LIST_DIR}/test/mock_ffa_api.cpp
+-		${CMAKE_CURRENT_LIST_DIR}/test/mock_sp_rxtx.cpp
++		${CMAKE_CURRENT_LIST_DIR}/mock/mock_ffa_api.cpp
++		${CMAKE_CURRENT_LIST_DIR}/mock/mock_sp_rxtx.cpp
+ 	INCLUDE_DIRECTORIES
+ 		${CMAKE_CURRENT_LIST_DIR}/include/
++		${CMAKE_CURRENT_LIST_DIR}/mock
+ 		${UNIT_TEST_PROJECT_PATH}/components/common/utils/include
+ 	COMPILE_DEFINITIONS
+ 		-DARM64
+@@ -103,11 +110,12 @@ unit_test_add_suite(
+ 		${CMAKE_CURRENT_LIST_DIR}/test/test_sp_memory_management.cpp
+ 		${CMAKE_CURRENT_LIST_DIR}/sp_memory_management.c
+ 		${CMAKE_CURRENT_LIST_DIR}/ffa_memory_descriptors.c
+-		${CMAKE_CURRENT_LIST_DIR}/test/mock_assert.cpp
+-		${CMAKE_CURRENT_LIST_DIR}/test/mock_ffa_api.cpp
+-		${CMAKE_CURRENT_LIST_DIR}/test/mock_sp_rxtx.cpp
++		${CMAKE_CURRENT_LIST_DIR}/mock/mock_assert.cpp
++		${CMAKE_CURRENT_LIST_DIR}/mock/mock_ffa_api.cpp
++		${CMAKE_CURRENT_LIST_DIR}/mock/mock_sp_rxtx.cpp
+ 	INCLUDE_DIRECTORIES
+ 		${CMAKE_CURRENT_LIST_DIR}/include/
++		${CMAKE_CURRENT_LIST_DIR}/mock
+ 		${UNIT_TEST_PROJECT_PATH}/components/common/utils/include
+ 	COMPILE_DEFINITIONS
+ 		-DARM64
+@@ -119,9 +127,10 @@ unit_test_add_suite(
+ 		${CMAKE_CURRENT_LIST_DIR}/test/test_sp_memory_management_internals.cpp
+ 		${CMAKE_CURRENT_LIST_DIR}/test/sp_memory_management_internals.yml
+ 		${CMAKE_CURRENT_LIST_DIR}/ffa_memory_descriptors.c
+-		${CMAKE_CURRENT_LIST_DIR}/test/mock_assert.cpp
++		${CMAKE_CURRENT_LIST_DIR}/mock/mock_assert.cpp
+ 	INCLUDE_DIRECTORIES
+ 		${CMAKE_CURRENT_LIST_DIR}/include/
++		${CMAKE_CURRENT_LIST_DIR}/mock
+ 		${UNIT_TEST_PROJECT_PATH}/components/common/utils/include
+ 	COMPILE_DEFINITIONS
+ 		-DARM64
+@@ -131,10 +140,11 @@ unit_test_add_suite(
+ 	NAME libsp_sp_messaging
+ 	SOURCES
+ 		${CMAKE_CURRENT_LIST_DIR}/test/test_sp_messaging.cpp
+-		${CMAKE_CURRENT_LIST_DIR}/test/mock_ffa_api.cpp
++		${CMAKE_CURRENT_LIST_DIR}/mock/mock_ffa_api.cpp
+ 		${CMAKE_CURRENT_LIST_DIR}/sp_messaging.c
+ 	INCLUDE_DIRECTORIES
+ 		${CMAKE_CURRENT_LIST_DIR}/include/
++		${CMAKE_CURRENT_LIST_DIR}/mock
+ 		${UNIT_TEST_PROJECT_PATH}/components/common/utils/include
+ 	COMPILE_DEFINITIONS
+ 		-DARM64
+@@ -144,11 +154,12 @@ unit_test_add_suite(
+ 	NAME libsp_sp_messaging_with_routing_extension
+ 	SOURCES
+ 		${CMAKE_CURRENT_LIST_DIR}/test/test_sp_messaging.cpp
+-		${CMAKE_CURRENT_LIST_DIR}/test/mock_ffa_api.cpp
++		${CMAKE_CURRENT_LIST_DIR}/mock/mock_ffa_api.cpp
+ 		${CMAKE_CURRENT_LIST_DIR}/sp_messaging.c
+ 		${CMAKE_CURRENT_LIST_DIR}/ffa_direct_msg_routing_extension.c
+ 	INCLUDE_DIRECTORIES
+ 		${CMAKE_CURRENT_LIST_DIR}/include/
++		${CMAKE_CURRENT_LIST_DIR}/mock
+ 		${UNIT_TEST_PROJECT_PATH}/components/common/utils/include
+ 	COMPILE_DEFINITIONS
+ 		-DARM64
+diff --git a/components/rpc/mm_communicate/endpoint/sp/tests.cmake b/components/rpc/mm_communicate/endpoint/sp/tests.cmake
+index 318f14d..c68a0c7 100644
+--- a/components/rpc/mm_communicate/endpoint/sp/tests.cmake
++++ b/components/rpc/mm_communicate/endpoint/sp/tests.cmake
+@@ -1,5 +1,5 @@
+ #
+-# Copyright (c) 2021, Arm Limited. All rights reserved.
++# Copyright (c) 2021-2022, Arm Limited. All rights reserved.
+ #
+ # SPDX-License-Identifier: BSD-3-Clause
+ #
+@@ -13,12 +13,12 @@ unit_test_add_suite(
+ 		${CMAKE_CURRENT_LIST_DIR}/test/test_mm_communicate_call_ep.cpp
+ 		${CMAKE_CURRENT_LIST_DIR}/test/mock_mm_service.cpp
+ 		${CMAKE_CURRENT_LIST_DIR}/test/test_mock_mm_service.cpp
+-		${UNIT_TEST_PROJECT_PATH}/components/messaging/ffa/libsp/test/mock_assert.cpp
++		${UNIT_TEST_PROJECT_PATH}/components/messaging/ffa/libsp/mock/mock_assert.cpp
+ 	INCLUDE_DIRECTORIES
+ 		${UNIT_TEST_PROJECT_PATH}
+ 		${UNIT_TEST_PROJECT_PATH}/components/common/utils/include
+ 		${UNIT_TEST_PROJECT_PATH}/components/messaging/ffa/libsp/include
+-		${UNIT_TEST_PROJECT_PATH}/components/messaging/ffa/libsp/test
++		${UNIT_TEST_PROJECT_PATH}/components/messaging/ffa/libsp/mock
+ 		${UNIT_TEST_PROJECT_PATH}/components/rpc/common/interface
+ 	COMPILE_DEFINITIONS
+ 		-DARM64
+diff --git a/components/service/smm_variable/frontend/mm_communicate/tests.cmake b/components/service/smm_variable/frontend/mm_communicate/tests.cmake
+index d1f930c..50b0b9a 100644
+--- a/components/service/smm_variable/frontend/mm_communicate/tests.cmake
++++ b/components/service/smm_variable/frontend/mm_communicate/tests.cmake
+@@ -1,5 +1,5 @@
+ #
+-# Copyright (c) 2021, Arm Limited. All rights reserved.
++# Copyright (c) 2021-2022, Arm Limited. All rights reserved.
+ #
+ # SPDX-License-Identifier: BSD-3-Clause
+ #
+@@ -12,13 +12,13 @@ unit_test_add_suite(
+ 		${CMAKE_CURRENT_LIST_DIR}/smm_variable_mm_service.c
+ 		${CMAKE_CURRENT_LIST_DIR}/test/test_smm_variable_mm_service.cpp
+ 		${UNIT_TEST_PROJECT_PATH}/components/rpc/common/test/mock_rpc_interface.cpp
+-		${UNIT_TEST_PROJECT_PATH}/components/messaging/ffa/libsp/test/mock_assert.cpp
++		${UNIT_TEST_PROJECT_PATH}/components/messaging/ffa/libsp/mock/mock_assert.cpp
+ 	INCLUDE_DIRECTORIES
+ 		${UNIT_TEST_PROJECT_PATH}
+ 		${UNIT_TEST_PROJECT_PATH}/components/rpc/mm_communicate/endpoint/sp
+ 		${UNIT_TEST_PROJECT_PATH}/components/common/utils/include
+ 		${UNIT_TEST_PROJECT_PATH}/components/messaging/ffa/libsp/include
+-		${UNIT_TEST_PROJECT_PATH}/components/messaging/ffa/libsp/test
++		${UNIT_TEST_PROJECT_PATH}/components/messaging/ffa/libsp/mock
+ 		${UNIT_TEST_PROJECT_PATH}/components/rpc/common/interface
+ 	COMPILE_DEFINITIONS
+ 		-DARM64
+-- 
+2.17.1
+
diff --git a/meta-arm/recipes-security/trusted-services/files/0018-Add-mock-for-libsp-sp_discovery.patch b/meta-arm/recipes-security/trusted-services/files/0018-Add-mock-for-libsp-sp_discovery.patch
new file mode 100644
index 00000000..b385b7a9
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/files/0018-Add-mock-for-libsp-sp_discovery.patch
@@ -0,0 +1,339 @@
+From e9ff55c03e06c044eb9c13f2a3315bf7e35f3659 Mon Sep 17 00:00:00 2001
+From: Imre Kis <imre.kis@arm.com>
+Date: Fri, 17 Jun 2022 13:51:21 +0200
+Subject: [PATCH 18/24] Add mock for libsp/sp_discovery
+
+Add mock_sp_discovery for mocking sp_discovery part of libsp.
+
+Signed-off-by: Imre Kis <imre.kis@arm.com>
+Change-Id: I94460dc03dd6dcd27f6865f852cc9a0d85f4b583
+
+Upstream-Status: Pending [In review]
+Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
+
+---
+ .../messaging/ffa/libsp/mock/component.cmake  |   1 +
+ .../ffa/libsp/mock/mock_sp_discovery.cpp      | 109 +++++++++++++++++
+ .../ffa/libsp/mock/mock_sp_discovery.h        |  37 ++++++
+ .../mock/test/test_mock_sp_discovery.cpp      | 111 ++++++++++++++++++
+ components/messaging/ffa/libsp/tests.cmake    |  13 ++
+ 5 files changed, 271 insertions(+)
+ create mode 100644 components/messaging/ffa/libsp/mock/mock_sp_discovery.cpp
+ create mode 100644 components/messaging/ffa/libsp/mock/mock_sp_discovery.h
+ create mode 100644 components/messaging/ffa/libsp/mock/test/test_mock_sp_discovery.cpp
+
+diff --git a/components/messaging/ffa/libsp/mock/component.cmake b/components/messaging/ffa/libsp/mock/component.cmake
+index 03b8006..15db85a 100644
+--- a/components/messaging/ffa/libsp/mock/component.cmake
++++ b/components/messaging/ffa/libsp/mock/component.cmake
+@@ -12,6 +12,7 @@ target_sources(${TGT} PRIVATE
+ 	"${CMAKE_CURRENT_LIST_DIR}/mock_assert.cpp"
+ 	"${CMAKE_CURRENT_LIST_DIR}/mock_ffa_api.cpp"
+ 	"${CMAKE_CURRENT_LIST_DIR}/mock_ffa_internal_api.cpp"
++	"${CMAKE_CURRENT_LIST_DIR}/mock_sp_discovery.cpp"
+ 	"${CMAKE_CURRENT_LIST_DIR}/mock_sp_rxtx.cpp"
+ 	)
+ 
+diff --git a/components/messaging/ffa/libsp/mock/mock_sp_discovery.cpp b/components/messaging/ffa/libsp/mock/mock_sp_discovery.cpp
+new file mode 100644
+index 0000000..47f4ef7
+--- /dev/null
++++ b/components/messaging/ffa/libsp/mock/mock_sp_discovery.cpp
+@@ -0,0 +1,109 @@
++// SPDX-License-Identifier: BSD-3-Clause
++/*
++ * Copyright (c) 2022, Arm Limited. All rights reserved.
++ */
++
++#include <CppUTestExt/MockSupport.h>
++#include "mock_sp_discovery.h"
++
++void expect_sp_discovery_ffa_version_get(const uint16_t *major,
++					 const uint16_t *minor,
++					 sp_result result)
++{
++	mock()
++		.expectOneCall("sp_discovery_ffa_version_get")
++		.withOutputParameterReturning("major", major, sizeof(*major))
++		.withOutputParameterReturning("minor", minor, sizeof(*minor))
++		.andReturnValue(result);
++}
++
++sp_result sp_discovery_ffa_version_get(uint16_t *major, uint16_t *minor)
++{
++	return mock()
++		.actualCall("sp_discovery_ffa_version_get")
++		.withOutputParameter("major", major)
++		.withOutputParameter("minor", minor)
++		.returnIntValue();
++}
++
++void expect_sp_discovery_own_id_get(const uint16_t *id, sp_result result)
++{
++	mock()
++		.expectOneCall("sp_discovery_own_id_get")
++		.withOutputParameterReturning("id", id, sizeof(*id))
++		.andReturnValue(result);
++}
++
++sp_result sp_discovery_own_id_get(uint16_t *id)
++{
++	return mock()
++		.actualCall("sp_discovery_own_id_get")
++		.withOutputParameter("id", id)
++		.returnIntValue();
++}
++
++void expect_sp_discovery_partition_id_get(const struct sp_uuid *uuid,
++					  const uint16_t *id, sp_result result)
++{
++	mock()
++		.expectOneCall("sp_discovery_partition_id_get")
++		.withMemoryBufferParameter("uuid", (const unsigned char *)uuid,
++					   sizeof(*uuid))
++		.withOutputParameterReturning("id", id, sizeof(*id))
++		.andReturnValue(result);
++}
++
++sp_result sp_discovery_partition_id_get(const struct sp_uuid *uuid,
++					uint16_t *id)
++{
++	return mock()
++		.actualCall("sp_discovery_partition_id_get")
++		.withMemoryBufferParameter("uuid", (const unsigned char *)uuid,
++					   sizeof(*uuid))
++		.withOutputParameter("id", id)
++		.returnIntValue();
++}
++
++void expect_sp_discovery_partition_info_get(const struct sp_uuid *uuid,
++					  const struct sp_partition_info *info,
++					  sp_result result)
++{
++	mock()
++		.expectOneCall("sp_discovery_partition_info_get")
++		.withMemoryBufferParameter("uuid", (const unsigned char *)uuid,
++					   sizeof(*uuid))
++		.withOutputParameterReturning("info", info, sizeof(*info))
++		.andReturnValue(result);
++}
++
++sp_result sp_discovery_partition_info_get(const struct sp_uuid *uuid,
++					  struct sp_partition_info *info)
++{
++	return mock()
++		.actualCall("sp_discovery_partition_info_get")
++		.withMemoryBufferParameter("uuid", (const unsigned char *)uuid,
++					   sizeof(*uuid))
++		.withOutputParameter("info", info)
++		.returnIntValue();
++}
++
++void expect_sp_discovery_partition_info_get_all(const struct sp_partition_info info[],
++						const uint32_t *count,
++						sp_result result)
++{
++	mock()
++		.expectOneCall("sp_discovery_partition_info_get_all")
++		.withOutputParameterReturning("info", info, sizeof(*info) * *count)
++		.withOutputParameterReturning("count", count, sizeof(*count))
++		.andReturnValue(result);
++}
++
++sp_result sp_discovery_partition_info_get_all(struct sp_partition_info info[],
++					      uint32_t *count)
++{
++	return mock()
++		.actualCall("sp_discovery_partition_info_get_all")
++		.withOutputParameter("info", info)
++		.withOutputParameter("count", count)
++		.returnIntValue();
++}
+diff --git a/components/messaging/ffa/libsp/mock/mock_sp_discovery.h b/components/messaging/ffa/libsp/mock/mock_sp_discovery.h
+new file mode 100644
+index 0000000..a71ce18
+--- /dev/null
++++ b/components/messaging/ffa/libsp/mock/mock_sp_discovery.h
+@@ -0,0 +1,37 @@
++/* SPDX-License-Identifier: BSD-3-Clause */
++/*
++ * Copyright (c) 2022, Arm Limited and Contributors. All rights reserved.
++ */
++
++#ifndef LIBSP_MOCK_MOCK_SP_DISCOVERY_H_
++#define LIBSP_MOCK_MOCK_SP_DISCOVERY_H_
++
++#include "../include/sp_discovery.h"
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++void expect_sp_discovery_ffa_version_get(const uint16_t *major,
++					 const uint16_t *minor,
++					 sp_result result);
++
++void expect_sp_discovery_own_id_get(const uint16_t *id, sp_result result);
++
++void expect_sp_discovery_partition_id_get(const struct sp_uuid *uuid,
++					  const uint16_t *id, sp_result result);
++
++
++void expect_sp_discovery_partition_info_get(const struct sp_uuid *uuid,
++					    const struct sp_partition_info *info,
++					    sp_result result);
++
++void expect_sp_discovery_partition_info_get_all(const struct sp_partition_info info[],
++						const uint32_t *count,
++						sp_result result);
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* LIBSP_MOCK_MOCK_SP_DISCOVERY_H_ */
+diff --git a/components/messaging/ffa/libsp/mock/test/test_mock_sp_discovery.cpp b/components/messaging/ffa/libsp/mock/test/test_mock_sp_discovery.cpp
+new file mode 100644
+index 0000000..bb4bf07
+--- /dev/null
++++ b/components/messaging/ffa/libsp/mock/test/test_mock_sp_discovery.cpp
+@@ -0,0 +1,111 @@
++// SPDX-License-Identifier: BSD-3-Clause
++/*
++ * Copyright (c) 2022, Arm Limited. All rights reserved.
++ */
++
++#include <CppUTestExt/MockSupport.h>
++#include <CppUTest/TestHarness.h>
++#include "mock_sp_discovery.h"
++#include <stdint.h>
++#include <stdlib.h>
++
++
++
++
++TEST_GROUP(mock_sp_discovery) {
++	TEST_TEARDOWN()
++	{
++		mock().checkExpectations();
++		mock().clear();
++	}
++
++	static const sp_result result = -1;
++};
++
++TEST(mock_sp_discovery, sp_discovery_ffa_version_get)
++{
++	const uint16_t expected_major = 0xabcd;
++	const uint16_t expected_minor = 0xef01;
++	uint16_t major = 0, minor = 0;
++
++	expect_sp_discovery_ffa_version_get(&expected_major, &expected_minor,
++					    result);
++	LONGS_EQUAL(result, sp_discovery_ffa_version_get(&major, &minor));
++	UNSIGNED_LONGS_EQUAL(expected_major, major);
++	UNSIGNED_LONGS_EQUAL(expected_minor, minor);
++}
++
++TEST(mock_sp_discovery, sp_discovery_own_id_get)
++{
++	const uint16_t expected_id = 0x8765;
++	uint16_t id = 0;
++
++	expect_sp_discovery_own_id_get(&expected_id, result);
++	LONGS_EQUAL(result, sp_discovery_own_id_get(&id));
++	UNSIGNED_LONGS_EQUAL(expected_id, id);
++}
++
++TEST(mock_sp_discovery, sp_discovery_partition_id_get)
++{
++	const struct sp_uuid expected_uuid = {
++		.uuid = {0xfe, 0xdc, 0xba, 0x98, 0x76, 0x54, 0x32, 0x10,
++			 0x01, 0x23, 0x45, 0x67, 0x89, 0xab, 0xcd, 0xef}};
++	const uint16_t expected_id = 0xc1ca;
++
++	struct sp_uuid uuid = expected_uuid;
++	uint16_t id = 0;
++
++	expect_sp_discovery_partition_id_get(&expected_uuid, &expected_id,
++					       result);
++	LONGS_EQUAL(result, sp_discovery_partition_id_get(&uuid, &id));
++	UNSIGNED_LONGS_EQUAL(expected_id, id);
++}
++
++TEST(mock_sp_discovery, sp_discovery_partition_info_get)
++{
++	const struct sp_uuid expected_uuid = {
++		.uuid = {0xfe, 0xdc, 0xba, 0x98, 0x76, 0x54, 0x32, 0x10,
++			 0x01, 0x23, 0x45, 0x67, 0x89, 0xab, 0xcd, 0xef}};
++	const struct sp_partition_info expected_info = {
++		.partition_id = 0x1234,
++		.execution_context_count = 0xffff,
++		.supports_direct_requests = true,
++		.can_send_direct_requests = true,
++		.supports_indirect_requests = false
++	};
++
++	struct sp_uuid uuid = expected_uuid;
++	struct sp_partition_info info = {0};
++
++	expect_sp_discovery_partition_info_get(&expected_uuid, &expected_info,
++					       result);
++	LONGS_EQUAL(result, sp_discovery_partition_info_get(&uuid, &info));
++	MEMCMP_EQUAL(&expected_info, &info, sizeof(&expected_info));
++}
++
++TEST(mock_sp_discovery, sp_discovery_partition_info_get_all)
++{
++	const uint32_t expected_count = 2;
++	const struct sp_partition_info expected_info[expected_count] = {{
++		.partition_id = 0x5678,
++		.execution_context_count = 0x1111,
++		.supports_direct_requests = false,
++		.can_send_direct_requests = false,
++		.supports_indirect_requests = true
++	}, {
++		.partition_id = 0x1234,
++		.execution_context_count = 0xffff,
++		.supports_direct_requests = true,
++		.can_send_direct_requests = true,
++		.supports_indirect_requests = false
++	}};
++
++	struct sp_partition_info info[expected_count] = {0};
++	uint32_t count = 0;
++
++	expect_sp_discovery_partition_info_get_all(expected_info,
++						   &expected_count, result);
++	LONGS_EQUAL(result, sp_discovery_partition_info_get_all(info, &count));
++	MEMCMP_EQUAL(&expected_info, &info, sizeof(&expected_info));
++	UNSIGNED_LONGS_EQUAL(expected_count, count);
++}
+\ No newline at end of file
+diff --git a/components/messaging/ffa/libsp/tests.cmake b/components/messaging/ffa/libsp/tests.cmake
+index 296ae46..7b52248 100644
+--- a/components/messaging/ffa/libsp/tests.cmake
++++ b/components/messaging/ffa/libsp/tests.cmake
+@@ -104,6 +104,19 @@ unit_test_add_suite(
+ 		-DARM64
+ )
+ 
++unit_test_add_suite(
++	NAME libsp_mock_sp_discovery
++	SOURCES
++		${CMAKE_CURRENT_LIST_DIR}/mock/test/test_mock_sp_discovery.cpp
++		${CMAKE_CURRENT_LIST_DIR}/mock/mock_sp_discovery.cpp
++	INCLUDE_DIRECTORIES
++		${CMAKE_CURRENT_LIST_DIR}/include/
++		${CMAKE_CURRENT_LIST_DIR}/mock
++		${UNIT_TEST_PROJECT_PATH}/components/common/utils/include
++	COMPILE_DEFINITIONS
++		-DARM64
++)
++
+ unit_test_add_suite(
+ 	NAME libsp_sp_memory_management
+ 	SOURCES
+-- 
+2.17.1
+
diff --git a/meta-arm/recipes-security/trusted-services/files/0019-Add-mock-for-libsp-sp_memory_management.patch b/meta-arm/recipes-security/trusted-services/files/0019-Add-mock-for-libsp-sp_memory_management.patch
new file mode 100644
index 00000000..cf50389d
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/files/0019-Add-mock-for-libsp-sp_memory_management.patch
@@ -0,0 +1,977 @@
+From b592a22dbce521522931f8e3d79d6e16f2d334fa Mon Sep 17 00:00:00 2001
+From: Imre Kis <imre.kis@arm.com>
+Date: Fri, 17 Jun 2022 14:42:04 +0200
+Subject: [PATCH 19/24] Add mock for libsp/sp_memory_management
+
+Add mock_sp_memory_management for mocking sp_memory_management part of
+libsp.
+
+Signed-off-by: Imre Kis <imre.kis@arm.com>
+Change-Id: I9f74142bc3568dfc59f820ec2c2af81deba0d0da
+
+Upstream-Status: Pending [In review]
+Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
+
+---
+ .../ffa/libsp/include/sp_memory_management.h  |   2 +-
+ .../messaging/ffa/libsp/mock/component.cmake  |   1 +
+ .../libsp/mock/mock_sp_memory_management.cpp  | 523 ++++++++++++++++++
+ .../libsp/mock/mock_sp_memory_management.h    |  98 ++++
+ .../test/test_mock_sp_memory_management.cpp   | 260 +++++++++
+ components/messaging/ffa/libsp/tests.cmake    |  13 +
+ 6 files changed, 896 insertions(+), 1 deletion(-)
+ create mode 100644 components/messaging/ffa/libsp/mock/mock_sp_memory_management.cpp
+ create mode 100644 components/messaging/ffa/libsp/mock/mock_sp_memory_management.h
+ create mode 100644 components/messaging/ffa/libsp/test/test_mock_sp_memory_management.cpp
+
+diff --git a/components/messaging/ffa/libsp/include/sp_memory_management.h b/components/messaging/ffa/libsp/include/sp_memory_management.h
+index 58a6cc1..ec76a3d 100644
+--- a/components/messaging/ffa/libsp/include/sp_memory_management.h
++++ b/components/messaging/ffa/libsp/include/sp_memory_management.h
+@@ -381,7 +381,7 @@ sp_result sp_memory_share_dynamic_is_supported(bool *supported);
+  *
+  * @param[in]      descriptor        The memory descriptor
+  * @param[in,out]  acc_desc          Access descriptor
+- * @param[in,out   regions           Memory region array
++ * @param[in,out]  regions           Memory region array
+  * @param[in]      in_region_count   Count of the specified regions, can be 0
+  * @param[in,out]  out_region_count  Count of the reserved space of in the
+  *                                   regions buffer for retrieved regions. After
+diff --git a/components/messaging/ffa/libsp/mock/component.cmake b/components/messaging/ffa/libsp/mock/component.cmake
+index 15db85a..eb0d28c 100644
+--- a/components/messaging/ffa/libsp/mock/component.cmake
++++ b/components/messaging/ffa/libsp/mock/component.cmake
+@@ -13,6 +13,7 @@ target_sources(${TGT} PRIVATE
+ 	"${CMAKE_CURRENT_LIST_DIR}/mock_ffa_api.cpp"
+ 	"${CMAKE_CURRENT_LIST_DIR}/mock_ffa_internal_api.cpp"
+ 	"${CMAKE_CURRENT_LIST_DIR}/mock_sp_discovery.cpp"
++	"${CMAKE_CURRENT_LIST_DIR}/mock_sp_memory_management.cpp"
+ 	"${CMAKE_CURRENT_LIST_DIR}/mock_sp_rxtx.cpp"
+ 	)
+ 
+diff --git a/components/messaging/ffa/libsp/mock/mock_sp_memory_management.cpp b/components/messaging/ffa/libsp/mock/mock_sp_memory_management.cpp
+new file mode 100644
+index 0000000..9eb0aaa
+--- /dev/null
++++ b/components/messaging/ffa/libsp/mock/mock_sp_memory_management.cpp
+@@ -0,0 +1,523 @@
++// SPDX-License-Identifier: BSD-3-Clause
++/*
++ * Copyright (c) 2022, Arm Limited. All rights reserved.
++ */
++
++#include <CppUTestExt/MockSupport.h>
++#include "mock_sp_memory_management.h"
++
++void expect_sp_memory_donate(const struct sp_memory_descriptor *descriptor,
++			     const struct sp_memory_access_descriptor *acc_desc,
++			     const struct sp_memory_region regions[],
++			     uint32_t region_count, const uint64_t *handle,
++			     sp_result result)
++{
++	mock()
++		.expectOneCall("sp_memory_donate")
++		.withMemoryBufferParameter("descriptor", (const unsigned char *)descriptor,
++					   sizeof(*descriptor))
++		.withMemoryBufferParameter("acc_desc", (const unsigned char *)acc_desc,
++					   sizeof(*acc_desc))
++		.withMemoryBufferParameter("regions", (const unsigned char *)regions,
++					   sizeof(*regions) * region_count)
++		.withUnsignedIntParameter("region_count", region_count)
++		.withOutputParameterReturning("handle", handle, sizeof(*handle))
++		.andReturnValue(result);
++}
++
++sp_result sp_memory_donate(struct sp_memory_descriptor *descriptor,
++			   struct sp_memory_access_descriptor *acc_desc,
++			   struct sp_memory_region regions[],
++			   uint32_t region_count, uint64_t *handle)
++{
++	return mock()
++		.actualCall("sp_memory_donate")
++		.withMemoryBufferParameter("descriptor", (const unsigned char *)descriptor,
++					   sizeof(*descriptor))
++		.withMemoryBufferParameter("acc_desc", (const unsigned char *)acc_desc,
++					   sizeof(*acc_desc))
++		.withMemoryBufferParameter("regions", (const unsigned char *)regions,
++					   sizeof(*regions) * region_count)
++		.withUnsignedIntParameter("region_count", region_count)
++		.withOutputParameter("handle", handle)
++		.returnIntValue();
++}
++
++void expect_sp_memory_donate_dynamic(const struct sp_memory_descriptor *descriptor,
++				     const struct sp_memory_access_descriptor *acc_desc,
++				     const struct sp_memory_region regions[],
++				     uint32_t region_count, const uint64_t *handle,
++				     sp_result result)
++{
++	mock()
++		.expectOneCall("sp_memory_donate_dynamic")
++		.withMemoryBufferParameter("descriptor", (const unsigned char *)descriptor,
++					   sizeof(*descriptor))
++		.withMemoryBufferParameter("acc_desc", (const unsigned char *)acc_desc,
++					   sizeof(*acc_desc))
++		.withMemoryBufferParameter("regions", (const unsigned char *)regions,
++					   sizeof(*regions) * region_count)
++		.withUnsignedIntParameter("region_count", region_count)
++		.withOutputParameterReturning("handle", handle, sizeof(*handle))
++		.andReturnValue(result);
++}
++
++sp_result sp_memory_donate_dynamic(struct sp_memory_descriptor *descriptor,
++				   struct sp_memory_access_descriptor *acc_desc,
++				   struct sp_memory_region regions[],
++				   uint32_t region_count, uint64_t *handle,
++				   struct ffa_mem_transaction_buffer *buffer)
++{
++	if (buffer == NULL) { // LCOV_EXCL_BR_LINE
++		FAIL("ffa_mem_transaction_buffer is NULL"); // LCOV_EXCL_LINE
++	}
++
++	return mock()
++		.actualCall("sp_memory_donate_dynamic")
++		.withMemoryBufferParameter("descriptor", (const unsigned char *)descriptor,
++					   sizeof(*descriptor))
++		.withMemoryBufferParameter("acc_desc", (const unsigned char *)acc_desc,
++					   sizeof(*acc_desc))
++		.withMemoryBufferParameter("regions", (const unsigned char *)regions,
++					   sizeof(*regions) * region_count)
++		.withUnsignedIntParameter("region_count", region_count)
++		.withOutputParameter("handle", handle)
++		.returnIntValue();
++}
++
++void expect_sp_memory_donate_dynamic_is_supported(const bool *supported, sp_result result)
++{
++	mock()
++		.expectOneCall("sp_memory_lend_dynamic_is_supported")
++		.withOutputParameterReturning("supported", supported, sizeof(*supported))
++		.andReturnValue(result);
++}
++
++sp_result sp_memory_donate_dynamic_is_supported(bool *supported)
++{
++	return mock()
++		.actualCall("sp_memory_lend_dynamic_is_supported")
++		.withOutputParameter("supported", supported)
++		.returnIntValue();
++}
++
++void expect_sp_memory_lend(const struct sp_memory_descriptor *descriptor,
++			   const struct sp_memory_access_descriptor acc_desc[],
++			   uint32_t acc_desc_count,
++			   const struct sp_memory_region regions[],
++			   uint32_t region_count, const uint64_t *handle,
++			   sp_result result)
++{
++	mock()
++		.expectOneCall("sp_memory_lend")
++		.withMemoryBufferParameter("descriptor", (const unsigned char *)descriptor,
++					   sizeof(*descriptor))
++		.withMemoryBufferParameter("acc_desc", (const unsigned char *)acc_desc,
++					   sizeof(*acc_desc) * acc_desc_count)
++		.withUnsignedIntParameter("acc_desc_count", acc_desc_count)
++		.withMemoryBufferParameter("regions", (const unsigned char *)regions,
++					   sizeof(*regions) * region_count)
++		.withUnsignedIntParameter("region_count", region_count)
++		.withOutputParameterReturning("handle", handle, sizeof(*handle))
++		.andReturnValue(result);
++}
++
++sp_result sp_memory_lend(struct sp_memory_descriptor *descriptor,
++			 struct sp_memory_access_descriptor acc_desc[],
++			 uint32_t acc_desc_count,
++			 struct sp_memory_region regions[],
++			 uint32_t region_count, uint64_t *handle)
++{
++	return mock()
++		.actualCall("sp_memory_lend")
++		.withMemoryBufferParameter("descriptor", (const unsigned char *)descriptor,
++					   sizeof(*descriptor))
++		.withMemoryBufferParameter("acc_desc", (const unsigned char *)acc_desc,
++					   sizeof(*acc_desc) * acc_desc_count)
++		.withUnsignedIntParameter("acc_desc_count", acc_desc_count)
++		.withMemoryBufferParameter("regions", (const unsigned char *)regions,
++					   sizeof(*regions) * region_count)
++		.withUnsignedIntParameter("region_count", region_count)
++		.withOutputParameter("handle", handle)
++		.returnIntValue();
++}
++
++void expect_sp_memory_lend_dynamic(const struct sp_memory_descriptor *descriptor,
++				   const struct sp_memory_access_descriptor acc_desc[],
++				   uint32_t acc_desc_count,
++				   const struct sp_memory_region regions[],
++				   const uint32_t region_count, const uint64_t *handle,
++				   sp_result result)
++{
++	mock()
++		.expectOneCall("sp_memory_lend")
++		.withMemoryBufferParameter("descriptor", (const unsigned char *)descriptor,
++					   sizeof(*descriptor))
++		.withMemoryBufferParameter("acc_desc", (const unsigned char *)acc_desc,
++					   sizeof(*acc_desc) * acc_desc_count)
++		.withUnsignedIntParameter("acc_desc_count", acc_desc_count)
++		.withMemoryBufferParameter("regions", (const unsigned char *)regions,
++					   sizeof(*regions) * region_count)
++		.withUnsignedIntParameter("region_count", region_count)
++		.withOutputParameterReturning("handle", handle, sizeof(*handle))
++		.andReturnValue(result);
++}
++
++sp_result sp_memory_lend_dynamic(struct sp_memory_descriptor *descriptor,
++				 struct sp_memory_access_descriptor acc_desc[],
++				 uint32_t acc_desc_count,
++				 struct sp_memory_region regions[],
++				 uint32_t region_count, uint64_t *handle,
++				 struct ffa_mem_transaction_buffer *buffer)
++{
++	if (buffer == NULL) { // LCOV_EXCL_BR_LINE
++		FAIL("ffa_mem_transaction_buffer is NULL"); // LCOV_EXCL_LINE
++	}
++
++	return mock()
++		.actualCall("sp_memory_lend")
++		.withMemoryBufferParameter("descriptor", (const unsigned char *)descriptor,
++					   sizeof(*descriptor))
++		.withMemoryBufferParameter("acc_desc", (const unsigned char *)acc_desc,
++					   sizeof(*acc_desc) * acc_desc_count)
++		.withUnsignedIntParameter("acc_desc_count", acc_desc_count)
++		.withMemoryBufferParameter("regions", (const unsigned char *)regions,
++					   sizeof(*regions) * region_count)
++		.withUnsignedIntParameter("region_count", region_count)
++		.withOutputParameter("handle", handle)
++		.returnIntValue();
++}
++
++void expect_sp_memory_lend_dynamic_is_supported(const bool *supported, sp_result result)
++{
++	mock()
++		.expectOneCall("sp_memory_lend_dynamic_is_supported")
++		.withOutputParameterReturning("supported", supported, sizeof(*supported))
++		.andReturnValue(result);
++}
++
++sp_result sp_memory_lend_dynamic_is_supported(bool *supported)
++{
++	return mock()
++		.actualCall("sp_memory_lend_dynamic_is_supported")
++		.withOutputParameter("supported", supported)
++		.returnIntValue();
++}
++
++void expect_sp_memory_share(const struct sp_memory_descriptor *descriptor,
++			    const struct sp_memory_access_descriptor acc_desc[],
++			    uint32_t acc_desc_count,
++			    const struct sp_memory_region regions[],
++			    uint32_t region_count, const uint64_t *handle,
++			    sp_result result)
++{
++	mock()
++		.expectOneCall("sp_memory_share")
++		.withMemoryBufferParameter("descriptor", (const unsigned char *)descriptor,
++					   sizeof(*descriptor))
++		.withMemoryBufferParameter("acc_desc", (const unsigned char *)acc_desc,
++					   sizeof(*acc_desc) * acc_desc_count)
++		.withUnsignedIntParameter("acc_desc_count", acc_desc_count)
++		.withMemoryBufferParameter("regions", (const unsigned char *)regions,
++					   sizeof(*regions) * region_count)
++		.withUnsignedIntParameter("region_count", region_count)
++		.withOutputParameterReturning("handle", handle, sizeof(*handle))
++		.andReturnValue(result);
++}
++
++sp_result sp_memory_share(struct sp_memory_descriptor *descriptor,
++			  struct sp_memory_access_descriptor acc_desc[],
++			  uint32_t acc_desc_count,
++			  struct sp_memory_region regions[],
++			  uint32_t region_count, uint64_t *handle)
++{
++	return mock()
++		.actualCall("sp_memory_share")
++		.withMemoryBufferParameter("descriptor", (const unsigned char *)descriptor,
++					   sizeof(*descriptor))
++		.withMemoryBufferParameter("acc_desc", (const unsigned char *)acc_desc,
++					   sizeof(*acc_desc) * acc_desc_count)
++		.withUnsignedIntParameter("acc_desc_count", acc_desc_count)
++		.withMemoryBufferParameter("regions", (const unsigned char *)regions,
++					   sizeof(*regions) * region_count)
++		.withUnsignedIntParameter("region_count", region_count)
++		.withOutputParameter("handle", handle)
++		.returnIntValue();
++}
++
++void expect_sp_memory_share_dynamic(const struct sp_memory_descriptor *descriptor,
++				    const struct sp_memory_access_descriptor acc_desc[],
++				    uint32_t acc_desc_count,
++				    const struct sp_memory_region regions[],
++				    uint32_t region_count, const uint64_t *handle,
++				    sp_result result)
++{
++	mock()
++		.expectOneCall("sp_memory_share_dynamic")
++		.withMemoryBufferParameter("descriptor", (const unsigned char *)descriptor,
++					   sizeof(*descriptor))
++		.withMemoryBufferParameter("acc_desc", (const unsigned char *)acc_desc,
++					   sizeof(*acc_desc) * acc_desc_count)
++		.withUnsignedIntParameter("acc_desc_count", acc_desc_count)
++		.withMemoryBufferParameter("regions", (const unsigned char *)regions,
++					   sizeof(*regions) * region_count)
++		.withUnsignedIntParameter("region_count", region_count)
++		.withOutputParameterReturning("handle", handle, sizeof(*handle))
++		.andReturnValue(result);
++}
++
++sp_result sp_memory_share_dynamic(struct sp_memory_descriptor *descriptor,
++				  struct sp_memory_access_descriptor acc_desc[],
++				  uint32_t acc_desc_count,
++				  struct sp_memory_region regions[],
++				  uint32_t region_count, uint64_t *handle,
++				  struct ffa_mem_transaction_buffer *buffer)
++{
++	if (buffer == NULL) { // LCOV_EXCL_BR_LINE
++		FAIL("ffa_mem_transaction_buffer is NULL"); // LCOV_EXCL_LINE
++	}
++
++	return mock()
++		.actualCall("sp_memory_share_dynamic")
++		.withMemoryBufferParameter("descriptor", (const unsigned char *)descriptor,
++					   sizeof(*descriptor))
++		.withMemoryBufferParameter("acc_desc", (const unsigned char *)acc_desc,
++					   sizeof(*acc_desc) * acc_desc_count)
++		.withUnsignedIntParameter("acc_desc_count", acc_desc_count)
++		.withMemoryBufferParameter("regions", (const unsigned char *)regions,
++					   sizeof(*regions) * region_count)
++		.withUnsignedIntParameter("region_count", region_count)
++		.withOutputParameter("handle", handle)
++		.returnIntValue();
++}
++
++void expect_sp_memory_share_dynamic_is_supported(const bool *supported, sp_result result)
++{
++	mock()
++		.expectOneCall("sp_memory_share_dynamic_is_supported")
++		.withOutputParameterReturning("supported", supported, sizeof(*supported))
++		.andReturnValue(result);
++}
++
++sp_result sp_memory_share_dynamic_is_supported(bool *supported)
++{
++	return mock()
++		.actualCall("sp_memory_share_dynamic_is_supported")
++		.withOutputParameter("supported", supported)
++		.returnIntValue();
++}
++
++void expect_sp_memory_retrieve(const struct sp_memory_descriptor *descriptor,
++			       const struct sp_memory_access_descriptor *req_acc_desc,
++			       const struct sp_memory_access_descriptor *resp_acc_desc,
++			       const struct sp_memory_region in_regions[],
++			       const struct sp_memory_region out_regions[],
++			       uint32_t in_region_count,
++			       const uint32_t *out_region_count, uint64_t handle,
++			       sp_result result)
++{
++	mock()
++		.expectOneCall("sp_memory_retrieve")
++		.withMemoryBufferParameter("descriptor", (const unsigned char *)descriptor,
++					   sizeof(descriptor))
++		.withMemoryBufferParameter("req_acc_desc", (const unsigned char *)req_acc_desc,
++					   sizeof(*req_acc_desc))
++		.withOutputParameterReturning("resp_acc_desc",
++					      (const unsigned char *)resp_acc_desc,
++					      sizeof(*resp_acc_desc))
++		.withMemoryBufferParameter("in_regions", (const unsigned char *)in_regions,
++					   sizeof(*in_regions) * in_region_count)
++		.withOutputParameterReturning("out_regions", out_regions,
++					      sizeof(*out_regions) * *out_region_count)
++		.withUnsignedIntParameter("in_region_count", in_region_count)
++		.withOutputParameterReturning("out_region_count", out_region_count,
++					      sizeof(*out_region_count))
++		.withUnsignedLongIntParameter("handle", handle)
++		.andReturnValue(result);
++
++}
++
++sp_result sp_memory_retrieve(struct sp_memory_descriptor *descriptor,
++			     struct sp_memory_access_descriptor *acc_desc,
++			     struct sp_memory_region regions[],
++			     uint32_t in_region_count,
++			     uint32_t *out_region_count, uint64_t handle)
++{
++	return mock()
++		.actualCall("sp_memory_retrieve")
++		.withMemoryBufferParameter("descriptor", (const unsigned char *)descriptor,
++					   sizeof(descriptor))
++		.withMemoryBufferParameter("req_acc_desc", (const unsigned char *)acc_desc,
++					   sizeof(*acc_desc))
++		.withOutputParameter("resp_acc_desc", acc_desc)
++		.withMemoryBufferParameter("in_regions", (const unsigned char *)regions,
++					   sizeof(*regions) * in_region_count)
++		.withOutputParameter("out_regions", regions)
++		.withUnsignedIntParameter("in_region_count", in_region_count)
++		.withOutputParameter("out_region_count", out_region_count)
++		.withUnsignedLongIntParameter("handle", handle)
++		.returnIntValue();
++}
++
++void expect_sp_memory_retrieve_dynamic(const struct sp_memory_descriptor *descriptor,
++				       const struct sp_memory_access_descriptor *req_acc_desc,
++				       const struct sp_memory_access_descriptor *resp_acc_desc,
++				       const struct sp_memory_region in_regions[],
++				       const struct sp_memory_region out_regions[],
++				       uint32_t in_region_count,
++				       const uint32_t *out_region_count, uint64_t handle,
++				       sp_result result)
++{
++	mock()
++		.expectOneCall("sp_memory_retrieve")
++		.withMemoryBufferParameter("descriptor", (const unsigned char *)descriptor,
++					   sizeof(descriptor))
++		.withMemoryBufferParameter("req_acc_desc", (const unsigned char *)req_acc_desc,
++					   sizeof(*req_acc_desc))
++		.withOutputParameterReturning("resp_acc_desc",
++					      (const unsigned char *)resp_acc_desc,
++					      sizeof(*resp_acc_desc))
++		.withMemoryBufferParameter("in_regions", (const unsigned char *)in_regions,
++					   sizeof(*in_regions) * in_region_count)
++		.withOutputParameterReturning("out_regions", out_regions,
++					      sizeof(*out_regions) * *out_region_count)
++		.withUnsignedIntParameter("in_region_count", in_region_count)
++		.withOutputParameterReturning("out_region_count", out_region_count,
++					      sizeof(*out_region_count))
++		.withUnsignedLongIntParameter("handle", handle)
++		.andReturnValue(result);
++}
++
++sp_result
++sp_memory_retrieve_dynamic(struct sp_memory_descriptor *descriptor,
++			   struct sp_memory_access_descriptor *acc_desc,
++			   struct sp_memory_region regions[],
++			   uint32_t in_region_count, uint32_t *out_region_count,
++			   uint64_t handle,
++			   struct ffa_mem_transaction_buffer *buffer)
++{
++	if (buffer == NULL) { // LCOV_EXCL_BR_LINE
++		FAIL("ffa_mem_transaction_buffer is NULL"); // LCOV_EXCL_LINE
++	}
++
++	return mock()
++		.actualCall("sp_memory_retrieve")
++		.withMemoryBufferParameter("descriptor", (const unsigned char *)descriptor,
++					   sizeof(descriptor))
++		.withMemoryBufferParameter("req_acc_desc", (const unsigned char *)acc_desc,
++					   sizeof(*acc_desc))
++		.withOutputParameter("resp_acc_desc", acc_desc)
++		.withMemoryBufferParameter("in_regions", (const unsigned char *)regions,
++					   sizeof(*regions) * in_region_count)
++		.withOutputParameter("out_regions", regions)
++		.withUnsignedIntParameter("in_region_count", in_region_count)
++		.withOutputParameter("out_region_count", out_region_count)
++		.withUnsignedLongIntParameter("handle", handle)
++		.returnIntValue();
++}
++
++void expect_sp_memory_retrieve_dynamic_is_supported(const bool *supported, sp_result result)
++{
++	mock()
++		.expectOneCall("sp_memory_retrieve_dynamic_is_supported")
++		.withOutputParameterReturning("supported", supported, sizeof(*supported))
++		.andReturnValue(result);
++}
++
++sp_result sp_memory_retrieve_dynamic_is_supported(bool *supported)
++{
++	return mock()
++		.actualCall("sp_memory_retrieve_dynamic_is_supported")
++		.withOutputParameter("supported", supported)
++		.returnIntValue();
++}
++
++void expect_sp_memory_relinquish(uint64_t handle, const uint16_t endpoints[],
++			         uint32_t endpoint_count,
++			         const struct sp_memory_transaction_flags *flags,
++				 sp_result result)
++{
++	mock()
++		.expectOneCall("sp_memory_relinquish")
++		.withUnsignedLongIntParameter("handle", handle)
++		.withMemoryBufferParameter("endpoints", (const unsigned char *)endpoints,
++					   sizeof(*endpoints) * endpoint_count)
++		.withMemoryBufferParameter("flags", (const unsigned char *)flags, sizeof(*flags))
++		.andReturnValue(result);
++}
++
++sp_result sp_memory_relinquish(uint64_t handle, const uint16_t endpoints[],
++			       uint32_t endpoint_count,
++			       struct sp_memory_transaction_flags *flags)
++{
++	return mock()
++		.actualCall("sp_memory_relinquish")
++		.withUnsignedLongIntParameter("handle", handle)
++		.withMemoryBufferParameter("endpoints", (const unsigned char *)endpoints,
++					   sizeof(*endpoints) * endpoint_count)
++		.withMemoryBufferParameter("flags", (const unsigned char *)flags, sizeof(*flags))
++		.returnIntValue();
++}
++
++void expect_sp_memory_reclaim(uint64_t handle, uint32_t flags, sp_result result)
++{
++	mock()
++		.expectOneCall("sp_memory_reclaim")
++		.withUnsignedLongIntParameter("handle", handle)
++		.withUnsignedIntParameter("flags", flags)
++		.andReturnValue(result);
++}
++
++sp_result sp_memory_reclaim(uint64_t handle, uint32_t flags)
++{
++	return mock()
++		.actualCall("sp_memory_reclaim")
++		.withUnsignedLongIntParameter("handle", handle)
++		.withUnsignedIntParameter("flags", flags)
++		.returnIntValue();
++}
++
++void expect_sp_memory_permission_get(const void *base_address, const struct sp_mem_perm *mem_perm,
++				     sp_result result)
++{
++	mock()
++		.expectOneCall("sp_memory_permission_set")
++		.withConstPointerParameter("base_address", base_address)
++		.withOutputParameterReturning("mem_perm", mem_perm,
++					      sizeof(*mem_perm))
++		.andReturnValue(result);
++}
++
++sp_result sp_memory_permission_get(const void *base_address,
++				   struct sp_mem_perm *mem_perm)
++{
++	return mock()
++		.actualCall("sp_memory_permission_set")
++		.withConstPointerParameter("base_address", base_address)
++		.withOutputParameter("mem_perm", mem_perm)
++		.returnIntValue();
++}
++
++void expect_sp_memory_permission_set(const void *base_address, size_t region_size,
++				     const struct sp_mem_perm *mem_perm, sp_result result)
++{
++	mock()
++		.expectOneCall("sp_memory_permission_set")
++		.withConstPointerParameter("base_address", base_address)
++		.withUnsignedLongIntParameter("region_size", region_size)
++		.withMemoryBufferParameter("mem_perm", (const unsigned char *)mem_perm,
++					   sizeof(*mem_perm))
++		.andReturnValue(result);
++}
++
++sp_result sp_memory_permission_set(const void *base_address, size_t region_size,
++				   const struct sp_mem_perm *mem_perm)
++{
++	return mock()
++		.actualCall("sp_memory_permission_set")
++		.withConstPointerParameter("base_address", base_address)
++		.withUnsignedLongIntParameter("region_size", region_size)
++		.withMemoryBufferParameter("mem_perm", (const unsigned char *)mem_perm,
++					   sizeof(*mem_perm))
++		.returnIntValue();
++}
+diff --git a/components/messaging/ffa/libsp/mock/mock_sp_memory_management.h b/components/messaging/ffa/libsp/mock/mock_sp_memory_management.h
+new file mode 100644
+index 0000000..458d2af
+--- /dev/null
++++ b/components/messaging/ffa/libsp/mock/mock_sp_memory_management.h
+@@ -0,0 +1,98 @@
++/* SPDX-License-Identifier: BSD-3-Clause */
++/*
++ * Copyright (c) 2022, Arm Limited and Contributors. All rights reserved.
++ */
++
++#ifndef LIBSP_MOCK_MOCK_SP_MEMORY_MANAGEMENT_H_
++#define LIBSP_MOCK_MOCK_SP_MEMORY_MANAGEMENT_H_
++
++#include "../include/sp_memory_management.h"
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++void expect_sp_memory_donate(const struct sp_memory_descriptor *descriptor,
++			     const struct sp_memory_access_descriptor *acc_desc,
++			     const struct sp_memory_region regions[],
++			     uint32_t region_count, const uint64_t *handle,
++			     sp_result result);
++
++void expect_sp_memory_donate_dynamic(const struct sp_memory_descriptor *descriptor,
++				     const struct sp_memory_access_descriptor *acc_desc,
++				     const struct sp_memory_region regions[],
++				     uint32_t region_count, const uint64_t *handle,
++				     sp_result result);
++
++void expect_sp_memory_donate_dynamic_is_supported(const bool *supported, sp_result result);
++
++void expect_sp_memory_lend(const struct sp_memory_descriptor *descriptor,
++			   const struct sp_memory_access_descriptor acc_desc[],
++			   uint32_t acc_desc_count,
++			   const struct sp_memory_region regions[],
++			   uint32_t region_count, const uint64_t *handle,
++			   sp_result result);
++
++void expect_sp_memory_lend_dynamic(const struct sp_memory_descriptor *descriptor,
++				   const struct sp_memory_access_descriptor acc_desc[],
++				   uint32_t acc_desc_count,
++				   const struct sp_memory_region regions[],
++				   const uint32_t region_count, const uint64_t *handle,
++				   sp_result result);
++
++void expect_sp_memory_lend_dynamic_is_supported(const bool *supported, sp_result result);
++
++void expect_sp_memory_share(const struct sp_memory_descriptor *descriptor,
++			    const struct sp_memory_access_descriptor acc_desc[],
++			    uint32_t acc_desc_count,
++			    const struct sp_memory_region regions[],
++			    uint32_t region_count, const uint64_t *handle,
++			    sp_result result);
++
++void expect_sp_memory_share_dynamic(const struct sp_memory_descriptor *descriptor,
++				    const struct sp_memory_access_descriptor acc_desc[],
++				    uint32_t acc_desc_count,
++				    const struct sp_memory_region regions[],
++				    uint32_t region_count, const uint64_t *handle,
++				    sp_result result);
++
++void expect_sp_memory_share_dynamic_is_supported(const bool *supported, sp_result result);
++
++void expect_sp_memory_retrieve(const struct sp_memory_descriptor *descriptor,
++			       const struct sp_memory_access_descriptor *req_acc_desc,
++			       const struct sp_memory_access_descriptor *resp_acc_desc,
++			       const struct sp_memory_region in_regions[],
++			       const struct sp_memory_region out_regions[],
++			       uint32_t in_region_count,
++			       const uint32_t *out_region_count, uint64_t handle,
++			       sp_result result);
++
++void expect_sp_memory_retrieve_dynamic(const struct sp_memory_descriptor *descriptor,
++				       const struct sp_memory_access_descriptor *req_acc_desc,
++				       const struct sp_memory_access_descriptor *resp_acc_desc,
++				       const struct sp_memory_region in_regions[],
++				       const struct sp_memory_region out_regions[],
++				       uint32_t in_region_count,
++				       const uint32_t *out_region_count, uint64_t handle,
++				       sp_result result);
++
++void expect_sp_memory_retrieve_dynamic_is_supported(const bool *supported, sp_result result);
++
++void expect_sp_memory_relinquish(uint64_t handle, const uint16_t endpoints[],
++				 uint32_t endpoint_count,
++				 const struct sp_memory_transaction_flags *flags,
++				 sp_result result);
++
++void expect_sp_memory_reclaim(uint64_t handle, uint32_t flags, sp_result result);
++
++void expect_sp_memory_permission_get(const void *base_address, const struct sp_mem_perm *mem_perm,
++				     sp_result result);
++
++void expect_sp_memory_permission_set(const void *base_address, size_t region_size,
++				     const struct sp_mem_perm *mem_perm, sp_result result);
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* LIBSP_MOCK_MOCK_SP_MEMORY_MANAGEMENT_H_ */
+diff --git a/components/messaging/ffa/libsp/test/test_mock_sp_memory_management.cpp b/components/messaging/ffa/libsp/test/test_mock_sp_memory_management.cpp
+new file mode 100644
+index 0000000..387b50f
+--- /dev/null
++++ b/components/messaging/ffa/libsp/test/test_mock_sp_memory_management.cpp
+@@ -0,0 +1,260 @@
++// SPDX-License-Identifier: BSD-3-Clause
++/*
++ * Copyright (c) 2022, Arm Limited. All rights reserved.
++ */
++
++#include <CppUTestExt/MockSupport.h>
++#include <CppUTest/TestHarness.h>
++#include "mock_sp_memory_management.h"
++#include <stdint.h>
++#include <stdlib.h>
++#include <string.h>
++
++static const struct sp_memory_descriptor expected_descriptor = {
++	.sender_id = 0xfedc,
++	.memory_type = sp_memory_type_normal_memory,
++	.mem_region_attr = {.normal_memory = {
++		.cacheability = sp_cacheability_write_back,
++		.shareability = sp_shareability_inner_shareable
++	}},
++	.flags = {
++		.zero_memory = true,
++		.operation_time_slicing = true,
++		.zero_memory_after_relinquish = true,
++		.transaction_type = sp_memory_transaction_type_relayer_specified,
++		.alignment_hint = 0x2000
++	},
++	.tag = 0x0123456789abcdefULL
++};
++static const struct sp_memory_access_descriptor expected_acc_desc[] = {
++	{
++		.receiver_id = 0xfafa,
++		.instruction_access = sp_instruction_access_executable,
++		.data_access = sp_data_access_read_only
++	}, {
++		.receiver_id = 0xc1ca,
++		.instruction_access = sp_instruction_access_not_executable,
++		.data_access = sp_data_access_read_write
++	}
++};
++static const struct sp_memory_region expected_regions[2] = {
++	{.address = (void *)0x01234567, .page_count = 0x89abcdef},
++	{.address = (void *)0x12345670, .page_count = 0x9abcdef8},
++};
++static const uint64_t expected_handle = 0xabcdef0123456789ULL;
++static const void *expected_address = (const void *)0x234567879;
++static const struct sp_mem_perm expected_mem_perm = {
++	.data_access = sp_mem_perm_data_perm_read_write,
++	.instruction_access = sp_mem_perm_instruction_perm_non_executable,
++};
++
++TEST_GROUP(mock_sp_memory_management)
++{
++	TEST_SETUP()
++	{
++		memset(&descriptor, 0x00, sizeof(descriptor));
++		memset(&acc_desc, 0x00, sizeof(acc_desc));
++		memset(&regions, 0x00, sizeof(regions));
++		handle = 0;
++		supported = false;
++	}
++
++	TEST_TEARDOWN()
++	{
++		mock().checkExpectations();
++		mock().clear();
++	}
++
++	struct sp_memory_descriptor descriptor;
++	struct sp_memory_access_descriptor acc_desc[2];
++	struct sp_memory_region regions[2];
++	uint64_t handle;
++	bool supported;
++	struct ffa_mem_transaction_buffer tr_buffer;
++
++	static const sp_result result = -1;
++};
++
++TEST(mock_sp_memory_management, sp_memory_donate)
++{
++	descriptor = expected_descriptor;
++	acc_desc[0] = expected_acc_desc[0];
++	memcpy(regions, expected_regions, sizeof(regions));
++
++	expect_sp_memory_donate(&expected_descriptor, expected_acc_desc, expected_regions, 2,
++				&expected_handle, result);
++	LONGS_EQUAL(result, sp_memory_donate(&descriptor, acc_desc, regions, 2, &handle));
++
++	UNSIGNED_LONGLONGS_EQUAL(expected_handle, handle);
++}
++
++TEST(mock_sp_memory_management, sp_memory_donate_dynamic)
++{
++	descriptor = expected_descriptor;
++	acc_desc[0] = expected_acc_desc[0];
++	memcpy(regions, expected_regions, sizeof(regions));
++
++	expect_sp_memory_donate_dynamic(&expected_descriptor, expected_acc_desc, expected_regions,
++					2, &expected_handle, result);
++	LONGS_EQUAL(result, sp_memory_donate_dynamic(&descriptor, acc_desc, regions, 2, &handle,
++						     &tr_buffer));
++
++	UNSIGNED_LONGLONGS_EQUAL(expected_handle, handle);
++}
++
++TEST(mock_sp_memory_management, sp_memory_donate_dynamic_is_supported)
++{
++	const bool expected_supported = true;
++	expect_sp_memory_donate_dynamic_is_supported(&expected_supported, result);
++	LONGS_EQUAL(result, sp_memory_donate_dynamic_is_supported(&supported));
++	CHECK_TRUE(supported);
++}
++
++TEST(mock_sp_memory_management, sp_memory_lend)
++{
++	descriptor = expected_descriptor;
++	memcpy(acc_desc, expected_acc_desc, sizeof(acc_desc));
++	memcpy(regions, expected_regions, sizeof(regions));
++
++	expect_sp_memory_lend(&descriptor, acc_desc, 2, regions, 2, &expected_handle, result);
++	LONGS_EQUAL(result, sp_memory_lend(&descriptor, acc_desc, 2, regions, 2, &handle));
++	UNSIGNED_LONGLONGS_EQUAL(expected_handle, handle);
++}
++
++TEST(mock_sp_memory_management, sp_memory_lend_dynamic)
++{
++	descriptor = expected_descriptor;
++	memcpy(acc_desc, expected_acc_desc, sizeof(acc_desc));
++	memcpy(regions, expected_regions, sizeof(regions));
++
++	expect_sp_memory_lend_dynamic(&descriptor, acc_desc, 2, regions, 2, &expected_handle,
++				      result);
++	LONGS_EQUAL(result, sp_memory_lend_dynamic(&descriptor, acc_desc, 2, regions, 2, &handle,
++						   &tr_buffer));
++	UNSIGNED_LONGLONGS_EQUAL(expected_handle, handle);
++}
++
++TEST(mock_sp_memory_management, sp_memory_lend_dynamic_is_supported)
++{
++	const bool expected_supported = true;
++	expect_sp_memory_lend_dynamic_is_supported(&expected_supported, result);
++	LONGS_EQUAL(result, sp_memory_lend_dynamic_is_supported(&supported));
++	CHECK_TRUE(supported);
++}
++
++TEST(mock_sp_memory_management, sp_memory_share)
++{
++	descriptor = expected_descriptor;
++	memcpy(acc_desc, expected_acc_desc, sizeof(acc_desc));
++	memcpy(regions, expected_regions, sizeof(regions));
++
++	expect_sp_memory_share(&descriptor, acc_desc, 2, regions, 2, &expected_handle, result);
++	LONGS_EQUAL(result, sp_memory_share(&descriptor, acc_desc, 2, regions, 2, &handle));
++	UNSIGNED_LONGLONGS_EQUAL(expected_handle, handle);
++}
++
++TEST(mock_sp_memory_management, sp_memory_share_dynamic)
++{
++	descriptor = expected_descriptor;
++	memcpy(acc_desc, expected_acc_desc, sizeof(acc_desc));
++	memcpy(regions, expected_regions, sizeof(regions));
++
++	expect_sp_memory_share_dynamic(&descriptor, acc_desc, 2, regions, 2, &expected_handle,
++				      result);
++	LONGS_EQUAL(result, sp_memory_share_dynamic(&descriptor, acc_desc, 2, regions, 2, &handle,
++						   &tr_buffer));
++	UNSIGNED_LONGLONGS_EQUAL(expected_handle, handle);
++}
++
++TEST(mock_sp_memory_management, sp_memory_share_dynamic_is_supported)
++{
++	const bool expected_supported = true;
++	expect_sp_memory_share_dynamic_is_supported(&expected_supported, result);
++	LONGS_EQUAL(result, sp_memory_share_dynamic_is_supported(&supported));
++	CHECK_TRUE(supported);
++}
++
++TEST(mock_sp_memory_management, sp_memory_retrieve)
++{
++	const uint32_t expected_region_count = 1;
++	struct sp_memory_access_descriptor acc_desc = expected_acc_desc[0];
++	struct sp_memory_region region = expected_regions[0];
++	uint32_t out_region_count = 0;
++
++	descriptor = expected_descriptor;
++
++	expect_sp_memory_retrieve(&expected_descriptor, &expected_acc_desc[0],
++				  &expected_acc_desc[1], &expected_regions[0],
++				  &expected_regions[1], 1, &expected_region_count, expected_handle,
++				  result);
++	LONGS_EQUAL(result, sp_memory_retrieve(&descriptor, &acc_desc, &region, 1,
++					       &out_region_count, expected_handle));
++	MEMCMP_EQUAL(&acc_desc, &expected_acc_desc[1], sizeof(acc_desc));
++	MEMCMP_EQUAL(&region, &expected_regions[1], sizeof(region));
++	UNSIGNED_LONGS_EQUAL(expected_region_count, out_region_count);
++}
++
++TEST(mock_sp_memory_management, sp_memory_retrieve_dynamic)
++{
++	const uint32_t expected_region_count = 1;
++	struct sp_memory_access_descriptor acc_desc = expected_acc_desc[0];
++	struct sp_memory_region region = expected_regions[0];
++	uint32_t out_region_count = 0;
++
++	descriptor = expected_descriptor;
++
++	expect_sp_memory_retrieve_dynamic(&expected_descriptor, &expected_acc_desc[0],
++					  &expected_acc_desc[1], &expected_regions[0],
++					  &expected_regions[1], 1, &expected_region_count,
++					  expected_handle, result);
++	LONGS_EQUAL(result, sp_memory_retrieve_dynamic(&descriptor, &acc_desc, &region, 1,
++						       &out_region_count, expected_handle,
++						       &tr_buffer));
++	MEMCMP_EQUAL(&acc_desc, &expected_acc_desc[1], sizeof(acc_desc));
++	MEMCMP_EQUAL(&region, &expected_regions[1], sizeof(region));
++	UNSIGNED_LONGS_EQUAL(expected_region_count, out_region_count);
++}
++
++TEST(mock_sp_memory_management, sp_memory_retrieve_dynamic_is_supported)
++{
++	const bool expected_supported = true;
++	expect_sp_memory_retrieve_dynamic_is_supported(&expected_supported, result);
++	LONGS_EQUAL(result, sp_memory_retrieve_dynamic_is_supported(&supported));
++	CHECK_TRUE(supported);
++}
++
++TEST(mock_sp_memory_management, sp_memory_relinquish)
++{
++	uint16_t endpoints[3] = {1, 2, 3};
++	struct sp_memory_transaction_flags flags = {0}; // TODO: flags
++
++	expect_sp_memory_relinquish(expected_handle, endpoints, 3, &flags, result);
++	LONGS_EQUAL(result, sp_memory_relinquish(expected_handle, endpoints, 3, &flags));
++}
++
++TEST(mock_sp_memory_management, sp_memory_reclaim)
++{
++	uint32_t flags = 0xffffffff;
++
++	expect_sp_memory_reclaim(expected_handle, flags, result);
++	LONGS_EQUAL(result, sp_memory_reclaim(expected_handle, flags));
++}
++
++TEST(mock_sp_memory_management, sp_memory_permission_get)
++{
++	struct sp_mem_perm mem_perm;
++
++	memset(&mem_perm, 0x00, sizeof(mem_perm));
++
++	expect_sp_memory_permission_get(expected_address, &expected_mem_perm, result);
++	LONGS_EQUAL(result, sp_memory_permission_get(expected_address, &mem_perm));
++	MEMCMP_EQUAL(&expected_mem_perm, &mem_perm, sizeof(expected_mem_perm));
++}
++
++TEST(mock_sp_memory_management, sp_memory_permission_set)
++{
++	size_t size = 0x7654;
++
++	expect_sp_memory_permission_set(expected_address, size, &expected_mem_perm, result);
++	LONGS_EQUAL(result, sp_memory_permission_set(expected_address, size, &expected_mem_perm));
++}
+diff --git a/components/messaging/ffa/libsp/tests.cmake b/components/messaging/ffa/libsp/tests.cmake
+index 7b52248..63abb57 100644
+--- a/components/messaging/ffa/libsp/tests.cmake
++++ b/components/messaging/ffa/libsp/tests.cmake
+@@ -134,6 +134,19 @@ unit_test_add_suite(
+ 		-DARM64
+ )
+ 
++unit_test_add_suite(
++	NAME libsp_mock_sp_memory_management
++	SOURCES
++		${CMAKE_CURRENT_LIST_DIR}/test/test_mock_sp_memory_management.cpp
++		${CMAKE_CURRENT_LIST_DIR}/mock/mock_sp_memory_management.cpp
++	INCLUDE_DIRECTORIES
++		${CMAKE_CURRENT_LIST_DIR}/include/
++		${CMAKE_CURRENT_LIST_DIR}/mock
++		${UNIT_TEST_PROJECT_PATH}/components/common/utils/include
++	COMPILE_DEFINITIONS
++		-DARM64
++)
++
+ unit_test_add_suite(
+ 	NAME libsp_sp_memory_management_internals
+ 	SOURCES
+-- 
+2.17.1
+
diff --git a/meta-arm/recipes-security/trusted-services/files/0020-Add-mock-for-libsp-sp_messaging.patch b/meta-arm/recipes-security/trusted-services/files/0020-Add-mock-for-libsp-sp_messaging.patch
new file mode 100644
index 00000000..3057051b
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/files/0020-Add-mock-for-libsp-sp_messaging.patch
@@ -0,0 +1,284 @@
+From 1e5ce152214e22a7cd9617a5059e42c370351354 Mon Sep 17 00:00:00 2001
+From: Imre Kis <imre.kis@arm.com>
+Date: Fri, 17 Jun 2022 15:40:18 +0200
+Subject: [PATCH 20/24] Add mock for libsp/sp_messaging
+
+Add mock_sp_messaging for mocking sp_messaging part of libsp.
+
+Signed-off-by: Imre Kis <imre.kis@arm.com>
+Change-Id: I87478027c61b41028682b10e2535a7e14cf6922f
+
+Upstream-Status: Pending [In review]
+Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
+
+---
+ .../messaging/ffa/libsp/mock/component.cmake  |  1 +
+ .../ffa/libsp/mock/mock_sp_messaging.cpp      | 86 +++++++++++++++++++
+ .../ffa/libsp/mock/mock_sp_messaging.h        | 39 +++++++++
+ .../mock/test/test_mock_sp_messaging.cpp      | 77 +++++++++++++++++
+ components/messaging/ffa/libsp/tests.cmake    | 14 +++
+ 5 files changed, 217 insertions(+)
+ create mode 100644 components/messaging/ffa/libsp/mock/mock_sp_messaging.cpp
+ create mode 100644 components/messaging/ffa/libsp/mock/mock_sp_messaging.h
+ create mode 100644 components/messaging/ffa/libsp/mock/test/test_mock_sp_messaging.cpp
+
+diff --git a/components/messaging/ffa/libsp/mock/component.cmake b/components/messaging/ffa/libsp/mock/component.cmake
+index eb0d28c..375cb46 100644
+--- a/components/messaging/ffa/libsp/mock/component.cmake
++++ b/components/messaging/ffa/libsp/mock/component.cmake
+@@ -14,6 +14,7 @@ target_sources(${TGT} PRIVATE
+ 	"${CMAKE_CURRENT_LIST_DIR}/mock_ffa_internal_api.cpp"
+ 	"${CMAKE_CURRENT_LIST_DIR}/mock_sp_discovery.cpp"
+ 	"${CMAKE_CURRENT_LIST_DIR}/mock_sp_memory_management.cpp"
++	"${CMAKE_CURRENT_LIST_DIR}/mock_sp_messaging.cpp"
+ 	"${CMAKE_CURRENT_LIST_DIR}/mock_sp_rxtx.cpp"
+ 	)
+ 
+diff --git a/components/messaging/ffa/libsp/mock/mock_sp_messaging.cpp b/components/messaging/ffa/libsp/mock/mock_sp_messaging.cpp
+new file mode 100644
+index 0000000..522abb3
+--- /dev/null
++++ b/components/messaging/ffa/libsp/mock/mock_sp_messaging.cpp
+@@ -0,0 +1,86 @@
++// SPDX-License-Identifier: BSD-3-Clause
++/*
++ * Copyright (c) 2022, Arm Limited. All rights reserved.
++ */
++
++#include <CppUTestExt/MockSupport.h>
++#include "mock_sp_messaging.h"
++
++void expect_sp_msg_wait(const struct sp_msg *msg, sp_result result)
++{
++	mock()
++		.expectOneCall("sp_msg_wait")
++		.withOutputParameterReturning("msg", msg, sizeof(*msg))
++		.andReturnValue(result);
++}
++
++sp_result sp_msg_wait(struct sp_msg *msg)
++{
++	return mock()
++		.actualCall("sp_msg_wait")
++		.withOutputParameter("msg", msg)
++		.returnIntValue();
++}
++
++void expect_sp_msg_send_direct_req(const struct sp_msg *req,
++				   const struct sp_msg *resp,
++				   sp_result result)
++{
++	mock()
++		.expectOneCall("sp_msg_send_direct_req")
++		.withMemoryBufferParameter("req", (const unsigned char *)req, sizeof(*req))
++		.withOutputParameterReturning("resp", resp, sizeof(*resp))
++		.andReturnValue(result);
++}
++
++sp_result sp_msg_send_direct_req(const struct sp_msg *req, struct sp_msg *resp)
++{
++	return mock()
++		.actualCall("sp_msg_send_direct_req")
++		.withMemoryBufferParameter("req", (const unsigned char *)req, sizeof(*req))
++		.withOutputParameter("resp", resp)
++		.returnIntValue();
++}
++
++void expect_sp_msg_send_direct_resp(const struct sp_msg *resp,
++				    const struct sp_msg *req,
++				    sp_result result)
++{
++	mock()
++		.expectOneCall("sp_msg_send_direct_resp")
++		.withMemoryBufferParameter("resp", (const unsigned char *)resp, sizeof(*resp))
++		.withOutputParameterReturning("req", req, sizeof(*req))
++		.andReturnValue(result);
++}
++
++sp_result sp_msg_send_direct_resp(const struct sp_msg *resp,
++				  struct sp_msg *req)
++{
++	return mock()
++		.actualCall("sp_msg_send_direct_resp")
++		.withMemoryBufferParameter("resp", (const unsigned char *)resp, sizeof(*resp))
++		.withOutputParameter("req", req)
++		.returnIntValue();
++}
++
++#if FFA_DIRECT_MSG_ROUTING_EXTENSION
++void expect_sp_msg_send_rc_req(const struct sp_msg *req,
++			       const struct sp_msg *resp,
++			       sp_result result)
++{
++	mock()
++		.expectOneCall("sp_msg_send_rc_req")
++		.withMemoryBufferParameter("req", (const unsigned char *)req, sizeof(*req))
++		.withOutputParameterReturning("resp", resp, sizeof(*resp))
++		.andReturnValue(result);
++}
++
++sp_result sp_msg_send_rc_req(const struct sp_msg *req, struct sp_msg *resp)
++{
++	return mock()
++		.actualCall("sp_msg_send_rc_req")
++		.withMemoryBufferParameter("req", (const unsigned char *)req, sizeof(*req))
++		.withOutputParameter("resp", resp)
++		.returnIntValue();
++}
++#endif /* FFA_DIRECT_MSG_ROUTING_EXTENSION */
+diff --git a/components/messaging/ffa/libsp/mock/mock_sp_messaging.h b/components/messaging/ffa/libsp/mock/mock_sp_messaging.h
+new file mode 100644
+index 0000000..8183012
+--- /dev/null
++++ b/components/messaging/ffa/libsp/mock/mock_sp_messaging.h
+@@ -0,0 +1,39 @@
++/* SPDX-License-Identifier: BSD-3-Clause */
++/*
++ * Copyright (c) 2022, Arm Limited and Contributors. All rights reserved.
++ */
++
++#ifndef LIBSP_MOCK_MOCK_SP_MESSAGING_H_
++#define LIBSP_MOCK_MOCK_SP_MESSAGING_H_
++
++#include "../include/sp_messaging.h"
++
++#include <stdint.h>
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++void expect_sp_msg_wait(const struct sp_msg *msg, sp_result result);
++
++
++void expect_sp_msg_send_direct_req(const struct sp_msg *req,
++				   const struct sp_msg *resp,
++				   sp_result result);
++
++
++void expect_sp_msg_send_direct_resp(const struct sp_msg *resp,
++				    const struct sp_msg *req,
++				    sp_result result);
++
++#if FFA_DIRECT_MSG_ROUTING_EXTENSION
++void expect_sp_msg_send_rc_req(const struct sp_msg *req,
++			       const struct sp_msg *resp,
++			       sp_result result);
++#endif /* FFA_DIRECT_MSG_ROUTING_EXTENSION */
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* LIBSP_MOCK_MOCK_SP_MESSAGING_H_ */
+diff --git a/components/messaging/ffa/libsp/mock/test/test_mock_sp_messaging.cpp b/components/messaging/ffa/libsp/mock/test/test_mock_sp_messaging.cpp
+new file mode 100644
+index 0000000..bfc7959
+--- /dev/null
++++ b/components/messaging/ffa/libsp/mock/test/test_mock_sp_messaging.cpp
+@@ -0,0 +1,77 @@
++// SPDX-License-Identifier: BSD-3-Clause
++/*
++ * Copyright (c) 2022, Arm Limited. All rights reserved.
++ */
++
++#include <CppUTestExt/MockSupport.h>
++#include <CppUTest/TestHarness.h>
++#include "mock_sp_messaging.h"
++#include <stdint.h>
++#include <stdlib.h>
++#include <string.h>
++
++static const struct sp_msg expected_req = {
++	.source_id = 0x0123,
++	.destination_id = 0x4567,
++	.args = {0x89abcdef, 0xfedcba98, 0x76543210, 0xabcdef01}
++};
++static const struct sp_msg expected_resp = {
++	.source_id = 0x1234,
++	.destination_id = 0x5678,
++	.args = {0x9abcdef8, 0xedcba98f, 0x65432107, 0xbcdef01a}
++};
++
++TEST_GROUP(mock_sp_messaging)
++{
++	TEST_SETUP()
++	{
++		memset(&req, 0x00, sizeof(req));
++		memset(&resp, 0x00, sizeof(resp));
++	}
++
++	TEST_TEARDOWN()
++	{
++		mock().checkExpectations();
++		mock().clear();
++	}
++
++	struct sp_msg req;
++	struct sp_msg resp;
++	static const sp_result result = -1;
++};
++
++TEST(mock_sp_messaging, sp_msg_wait)
++{
++	expect_sp_msg_wait(&expected_req, result);
++	LONGS_EQUAL(result, sp_msg_wait(&req));
++	MEMCMP_EQUAL(&expected_req, &req, sizeof(expected_req));
++}
++
++TEST(mock_sp_messaging, sp_msg_send_direct_req)
++{
++	req = expected_req;
++
++	expect_sp_msg_send_direct_req(&expected_req, &expected_resp, result);
++	LONGS_EQUAL(result, sp_msg_send_direct_req(&req, &resp));
++	MEMCMP_EQUAL(&expected_resp, &resp, sizeof(expected_resp));
++}
++
++TEST(mock_sp_messaging, sp_msg_send_direct_resp)
++{
++	resp = expected_resp;
++
++	expect_sp_msg_send_direct_resp(&expected_resp, &expected_req, result);
++	LONGS_EQUAL(result, sp_msg_send_direct_resp(&resp, &req));
++	MEMCMP_EQUAL(&expected_req, &req, sizeof(expected_req));
++}
++
++#if FFA_DIRECT_MSG_ROUTING_EXTENSION
++TEST(mock_sp_messaging, sp_msg_send_rc_req)
++{
++	req = expected_req;
++
++	expect_sp_msg_send_rc_req(&expected_req, &expected_resp, result);
++	LONGS_EQUAL(result, sp_msg_send_rc_req(&req, &resp));
++	MEMCMP_EQUAL(&expected_resp, &resp, sizeof(expected_resp));
++}
++#endif /* FFA_DIRECT_MSG_ROUTING_EXTENSION */
+diff --git a/components/messaging/ffa/libsp/tests.cmake b/components/messaging/ffa/libsp/tests.cmake
+index 63abb57..eb0b41e 100644
+--- a/components/messaging/ffa/libsp/tests.cmake
++++ b/components/messaging/ffa/libsp/tests.cmake
+@@ -176,6 +176,20 @@ unit_test_add_suite(
+ 		-DARM64
+ )
+ 
++unit_test_add_suite(
++	NAME libsp_mock_sp_messaging
++	SOURCES
++		${CMAKE_CURRENT_LIST_DIR}/mock/test/test_mock_sp_messaging.cpp
++		${CMAKE_CURRENT_LIST_DIR}/mock/mock_sp_messaging.cpp
++	INCLUDE_DIRECTORIES
++		${CMAKE_CURRENT_LIST_DIR}/include/
++		${CMAKE_CURRENT_LIST_DIR}/mock
++		${UNIT_TEST_PROJECT_PATH}/components/common/utils/include
++	COMPILE_DEFINITIONS
++		-DARM64
++		-DFFA_DIRECT_MSG_ROUTING_EXTENSION=1
++)
++
+ unit_test_add_suite(
+ 	NAME libsp_sp_messaging_with_routing_extension
+ 	SOURCES
+-- 
+2.17.1
+
diff --git a/meta-arm/recipes-security/trusted-services/files/0021-Add-64-bit-direct-message-handling-to-libsp.patch b/meta-arm/recipes-security/trusted-services/files/0021-Add-64-bit-direct-message-handling-to-libsp.patch
new file mode 100644
index 00000000..a037c27c
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/files/0021-Add-64-bit-direct-message-handling-to-libsp.patch
@@ -0,0 +1,2552 @@
+From a9edc50077d72cdd7e40ba3f03aee974848cd532 Mon Sep 17 00:00:00 2001
+From: Imre Kis <imre.kis@arm.com>
+Date: Tue, 19 Jul 2022 17:38:00 +0200
+Subject: [PATCH 21/24] Add 64 bit direct message handling to libsp
+
+* Change direct message struct to allow 64 bit arguments
+* Add 64 bit direct message req/resp functions to FF-A layer
+* Distinguish 32/64 bit messages on SP layer by field in sp_msg
+* Update tests and mocks
+
+The FF-A direct message response must match the request's 32/64bit mode
+which is the responsibility of the callee and it should be validated by
+the SPMC.
+
+Signed-off-by: Imre Kis <imre.kis@arm.com>
+Change-Id: Ibbd64ca0291dfe142a23471a649a07ba1a036824
+
+Upstream-Status: Pending [In review]
+Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
+
+---
+ components/messaging/ffa/libsp/ffa.c          |  84 ++-
+ .../libsp/ffa_direct_msg_routing_extension.c  |  28 +-
+ .../messaging/ffa/libsp/include/ffa_api.h     |  58 +-
+ .../ffa/libsp/include/ffa_api_defines.h       |   5 +
+ .../ffa/libsp/include/ffa_api_types.h         |   7 +-
+ .../ffa/libsp/include/sp_messaging.h          |   9 +-
+ .../messaging/ffa/libsp/mock/mock_ffa_api.cpp | 100 +++-
+ .../messaging/ffa/libsp/mock/mock_ffa_api.h   |  34 +-
+ .../ffa/libsp/mock/test/test_mock_ffa_api.cpp |  50 +-
+ components/messaging/ffa/libsp/sp_messaging.c |  74 ++-
+ .../messaging/ffa/libsp/test/test_ffa_api.cpp | 337 ++++++++++--
+ .../ffa/libsp/test/test_sp_messaging.cpp      | 498 ++++++++++--------
+ .../rpc/ffarpc/caller/sp/ffarpc_caller.c      |  31 +-
+ .../rpc/ffarpc/endpoint/ffarpc_call_ep.c      |   4 +-
+ .../endpoint/sp/mm_communicate_call_ep.c      |  16 +-
+ .../smm-gateway/common/smm_gateway_sp.c       |   8 +-
+ 16 files changed, 961 insertions(+), 382 deletions(-)
+
+diff --git a/components/messaging/ffa/libsp/ffa.c b/components/messaging/ffa/libsp/ffa.c
+index 374e940..caacc79 100644
+--- a/components/messaging/ffa/libsp/ffa.c
++++ b/components/messaging/ffa/libsp/ffa.c
+@@ -33,11 +33,20 @@ static inline void ffa_unpack_direct_msg(struct ffa_params *svc_result,
+ 	msg->function_id = svc_result->a0;
+ 	msg->source_id = (svc_result->a1 >> 16);
+ 	msg->destination_id = svc_result->a1;
+-	msg->args[0] = svc_result->a3;
+-	msg->args[1] = svc_result->a4;
+-	msg->args[2] = svc_result->a5;
+-	msg->args[3] = svc_result->a6;
+-	msg->args[4] = svc_result->a7;
++
++	if (FFA_IS_32_BIT_FUNC(msg->function_id)) {
++		msg->args.args32[0] = svc_result->a3;
++		msg->args.args32[1] = svc_result->a4;
++		msg->args.args32[2] = svc_result->a5;
++		msg->args.args32[3] = svc_result->a6;
++		msg->args.args32[4] = svc_result->a7;
++	} else {
++		msg->args.args64[0] = svc_result->a3;
++		msg->args.args64[1] = svc_result->a4;
++		msg->args.args64[2] = svc_result->a5;
++		msg->args.args64[3] = svc_result->a6;
++		msg->args.args64[4] = svc_result->a7;
++	}
+ }
+ 
+ /*
+@@ -217,7 +226,7 @@ ffa_result ffa_msg_wait(struct ffa_direct_msg *msg)
+ 
+ 	if (result.a0 == FFA_ERROR) {
+ 		return ffa_get_errorcode(&result);
+-	} else if (result.a0 == FFA_MSG_SEND_DIRECT_REQ_32) {
++	} else if (FFA_TO_32_BIT_FUNC(result.a0) == FFA_MSG_SEND_DIRECT_REQ_32) {
+ 		ffa_unpack_direct_msg(&result, msg);
+ 	} else {
+ 		assert(result.a0 == FFA_SUCCESS_32);
+@@ -227,13 +236,15 @@ ffa_result ffa_msg_wait(struct ffa_direct_msg *msg)
+ 	return FFA_OK;
+ }
+ 
+-ffa_result ffa_msg_send_direct_req(uint16_t source, uint16_t dest, uint32_t a0,
+-				   uint32_t a1, uint32_t a2, uint32_t a3,
+-				   uint32_t a4, struct ffa_direct_msg *msg)
++static ffa_result ffa_msg_send_direct_req(uint32_t function_id, uint32_t resp_id,
++					  uint16_t source, uint16_t dest,
++					  uint64_t a0, uint64_t a1, uint64_t a2,
++					  uint64_t a3, uint64_t a4,
++					  struct ffa_direct_msg *msg)
+ {
+ 	struct ffa_params result = {0};
+ 
+-	ffa_svc(FFA_MSG_SEND_DIRECT_REQ_32,
++	ffa_svc(function_id,
+ 		SHIFT_U32(source, FFA_MSG_SEND_DIRECT_REQ_SOURCE_ID_SHIFT) |
+ 		dest, FFA_PARAM_MBZ, a0, a1, a2, a3, a4, &result);
+ 
+@@ -244,7 +255,7 @@ ffa_result ffa_msg_send_direct_req(uint16_t source, uint16_t dest, uint32_t a0,
+ 
+ 	if (result.a0 == FFA_ERROR) {
+ 		return ffa_get_errorcode(&result);
+-	} else if (result.a0 == FFA_MSG_SEND_DIRECT_RESP_32) {
++	} else if (result.a0 == resp_id) {
+ 		ffa_unpack_direct_msg(&result, msg);
+ 	} else {
+ 		assert(result.a0 == FFA_SUCCESS_32);
+@@ -254,13 +265,36 @@ ffa_result ffa_msg_send_direct_req(uint16_t source, uint16_t dest, uint32_t a0,
+ 	return FFA_OK;
+ }
+ 
+-ffa_result ffa_msg_send_direct_resp(uint16_t source, uint16_t dest, uint32_t a0,
+-				    uint32_t a1, uint32_t a2, uint32_t a3,
+-				    uint32_t a4, struct ffa_direct_msg *msg)
++ffa_result ffa_msg_send_direct_req_32(uint16_t source, uint16_t dest,
++				      uint32_t a0, uint32_t a1, uint32_t a2,
++				      uint32_t a3, uint32_t a4,
++				      struct ffa_direct_msg *msg)
++{
++	return ffa_msg_send_direct_req(FFA_MSG_SEND_DIRECT_REQ_32,
++				       FFA_MSG_SEND_DIRECT_RESP_32,
++				       source, dest, a0, a1, a2, a3, a4, msg);
++}
++
++ffa_result ffa_msg_send_direct_req_64(uint16_t source, uint16_t dest,
++				      uint64_t a0, uint64_t a1, uint64_t a2,
++				      uint64_t a3, uint64_t a4,
++				      struct ffa_direct_msg *msg)
++{
++	return ffa_msg_send_direct_req(FFA_MSG_SEND_DIRECT_REQ_64,
++				       FFA_MSG_SEND_DIRECT_RESP_64,
++				       source, dest, a0, a1, a2, a3, a4, msg);
++}
++
++static ffa_result ffa_msg_send_direct_resp(uint32_t function_id,
++					   uint16_t source, uint16_t dest,
++					   uint64_t a0, uint64_t a1,
++					   uint64_t a2, uint64_t a3,
++					   uint64_t a4,
++					   struct ffa_direct_msg *msg)
+ {
+ 	struct ffa_params result = {0};
+ 
+-	ffa_svc(FFA_MSG_SEND_DIRECT_RESP_32,
++	ffa_svc(function_id,
+ 		SHIFT_U32(source, FFA_MSG_SEND_DIRECT_RESP_SOURCE_ID_SHIFT) |
+ 		dest, FFA_PARAM_MBZ, a0, a1, a2, a3, a4, &result);
+ 
+@@ -271,7 +305,7 @@ ffa_result ffa_msg_send_direct_resp(uint16_t source, uint16_t dest, uint32_t a0,
+ 
+ 	if (result.a0 == FFA_ERROR) {
+ 		return ffa_get_errorcode(&result);
+-	} else if (result.a0 == FFA_MSG_SEND_DIRECT_REQ_32) {
++	} else if (FFA_TO_32_BIT_FUNC(result.a0) == FFA_MSG_SEND_DIRECT_REQ_32) {
+ 		ffa_unpack_direct_msg(&result, msg);
+ 	} else {
+ 		assert(result.a0 == FFA_SUCCESS_32);
+@@ -281,6 +315,24 @@ ffa_result ffa_msg_send_direct_resp(uint16_t source, uint16_t dest, uint32_t a0,
+ 	return FFA_OK;
+ }
+ 
++ffa_result ffa_msg_send_direct_resp_32(uint16_t source, uint16_t dest,
++				       uint32_t a0, uint32_t a1, uint32_t a2,
++				       uint32_t a3, uint32_t a4,
++				       struct ffa_direct_msg *msg)
++{
++	return ffa_msg_send_direct_resp(FFA_MSG_SEND_DIRECT_RESP_32, source,
++					dest, a0, a1, a2, a3, a4, msg);
++}
++
++ffa_result ffa_msg_send_direct_resp_64(uint16_t source, uint16_t dest,
++				      uint64_t a0, uint64_t a1, uint64_t a2,
++				      uint64_t a3, uint64_t a4,
++				      struct ffa_direct_msg *msg)
++{
++	return ffa_msg_send_direct_resp(FFA_MSG_SEND_DIRECT_RESP_64, source,
++					dest, a0, a1, a2, a3, a4, msg);
++}
++
+ ffa_result ffa_mem_donate(uint32_t total_length, uint32_t fragment_length,
+ 			  void *buffer_address, uint32_t page_count,
+ 			  uint64_t *handle)
+diff --git a/components/messaging/ffa/libsp/ffa_direct_msg_routing_extension.c b/components/messaging/ffa/libsp/ffa_direct_msg_routing_extension.c
+index 6813573..03a372f 100644
+--- a/components/messaging/ffa/libsp/ffa_direct_msg_routing_extension.c
++++ b/components/messaging/ffa/libsp/ffa_direct_msg_routing_extension.c
+@@ -1,6 +1,6 @@
+ // SPDX-License-Identifier: BSD-3-Clause
+ /*
+- * Copyright (c) 2020-2021, Arm Limited and Contributors. All rights reserved.
++ * Copyright (c) 2020-2022, Arm Limited and Contributors. All rights reserved.
+  */
+ 
+ #include "ffa_direct_msg_routing_extension.h"
+@@ -20,23 +20,23 @@ static uint16_t callee_id = SP_ID_INVALID;
+ 
+ static bool is_rc_message(const struct ffa_direct_msg *msg)
+ {
+-	return msg->args[0] & FFA_ROUTING_EXT_RC_BIT;
++	return msg->args.args32[0] & FFA_ROUTING_EXT_RC_BIT;
+ }
+ 
+ static bool is_error_message(const struct ffa_direct_msg *msg)
+ {
+-	return msg->args[0] & FFA_ROUTING_EXT_ERROR_BIT;
++	return msg->args.args32[0] & FFA_ROUTING_EXT_ERROR_BIT;
+ }
+ 
+ static ffa_result get_error_code_from_message(const struct ffa_direct_msg *msg)
+ {
+-	return (ffa_result)msg->args[1];
++	return (ffa_result)msg->args.args32[1];
+ }
+ 
+ static ffa_result send_rc_error_message(struct ffa_direct_msg *req,
+ 					ffa_result error_code)
+ {
+-	return ffa_msg_send_direct_resp(req->destination_id, req->source_id,
++	return ffa_msg_send_direct_resp_32(req->destination_id, req->source_id,
+ 					(FFA_ROUTING_EXT_ERROR_BIT |
+ 					 FFA_ROUTING_EXT_RC_BIT),
+ 					error_code, 0, 0, 0, req);
+@@ -45,7 +45,7 @@ static ffa_result send_rc_error_message(struct ffa_direct_msg *req,
+ static ffa_result send_rc_error_message_to_rc_root(struct ffa_direct_msg *resp,
+ 						   ffa_result error_code)
+ {
+-	return ffa_msg_send_direct_req(own_id, callee_id,
++	return ffa_msg_send_direct_req_32(own_id, callee_id,
+ 				       (FFA_ROUTING_EXT_RC_BIT |
+ 					FFA_ROUTING_EXT_ERROR_BIT),
+ 				       error_code, 0, 0, 0, resp);
+@@ -128,10 +128,10 @@ ffa_result ffa_direct_msg_routing_ext_req_post_hook(struct ffa_direct_msg *resp)
+ 		/* Forwarding RC request towards the root (normal world) */
+ 		state = forwarding;
+ 
+-		ffa_res = ffa_msg_send_direct_resp(own_id, caller_id,
+-						   resp->args[0], resp->args[1],
+-						   resp->args[2], resp->args[3],
+-						   resp->args[4], &rc_resp);
++		ffa_res = ffa_msg_send_direct_resp_32(own_id, caller_id,
++						   resp->args.args32[0], resp->args.args32[1],
++						   resp->args.args32[2], resp->args.args32[3],
++						   resp->args.args32[4], &rc_resp);
+ 		if (ffa_res != FFA_OK)
+ 			goto forward_ffa_error_to_rc_root;
+ 
+@@ -145,9 +145,9 @@ ffa_result ffa_direct_msg_routing_ext_req_post_hook(struct ffa_direct_msg *resp)
+ 
+ 		/* Forwarding RC response towards the RC root. */
+ 		state = internal;
+-		ffa_res = ffa_msg_send_direct_req(
+-			own_id, callee_id, rc_resp.args[0], rc_resp.args[1],
+-			rc_resp.args[2], rc_resp.args[3], rc_resp.args[4],
++		ffa_res = ffa_msg_send_direct_req_32(
++			own_id, callee_id, rc_resp.args.args32[0], rc_resp.args.args32[1],
++			rc_resp.args.args32[2], rc_resp.args.args32[3], rc_resp.args.args32[4],
+ 			resp);
+ 
+ 		goto break_on_ffa_error;
+@@ -197,7 +197,7 @@ void ffa_direct_msg_routing_ext_resp_error_hook(void)
+ 
+ void ffa_direct_msg_routing_ext_rc_req_pre_hook(struct ffa_direct_msg *req)
+ {
+-	req->args[0] = FFA_ROUTING_EXT_RC_BIT;
++	req->args.args32[0] = FFA_ROUTING_EXT_RC_BIT;
+ 	state = rc_root;
+ }
+ 
+diff --git a/components/messaging/ffa/libsp/include/ffa_api.h b/components/messaging/ffa/libsp/include/ffa_api.h
+index ec5cb04..4b7073b 100644
+--- a/components/messaging/ffa/libsp/include/ffa_api.h
++++ b/components/messaging/ffa/libsp/include/ffa_api.h
+@@ -126,8 +126,8 @@ ffa_result ffa_msg_wait(struct ffa_direct_msg *msg);
+ /** Messaging interfaces */
+ 
+ /**
+- * @brief      Sends a partition message in parameter registers as a request and
+- *             blocks until the response is available.
++ * @brief      Sends a 32 bit partition message in parameter registers as a
++ *             request and blocks until the response is available.
+  * @note       The ffa_interrupt_handler function can be called during the
+  *             execution of this function
+  *
+@@ -138,13 +138,14 @@ ffa_result ffa_msg_wait(struct ffa_direct_msg *msg);
+  *
+  * @return     The FF-A error status code
+  */
+-ffa_result ffa_msg_send_direct_req(uint16_t source, uint16_t dest, uint32_t a0,
+-				   uint32_t a1, uint32_t a2, uint32_t a3,
+-				   uint32_t a4, struct ffa_direct_msg *msg);
++ffa_result ffa_msg_send_direct_req_32(uint16_t source, uint16_t dest,
++				      uint32_t a0, uint32_t a1, uint32_t a2,
++				      uint32_t a3, uint32_t a4,
++				      struct ffa_direct_msg *msg);
+ 
+ /**
+- * @brief      Sends a partition message in parameter registers as a response
+- *             and blocks until the response is available.
++ * @brief      Sends a 64 bit partition message in parameter registers as a
++ *             request and blocks until the response is available.
+  * @note       The ffa_interrupt_handler function can be called during the
+  *             execution of this function
+  *
+@@ -155,9 +156,46 @@ ffa_result ffa_msg_send_direct_req(uint16_t source, uint16_t dest, uint32_t a0,
+  *
+  * @return     The FF-A error status code
+  */
+-ffa_result ffa_msg_send_direct_resp(uint16_t source, uint16_t dest, uint32_t a0,
+-				    uint32_t a1, uint32_t a2, uint32_t a3,
+-				    uint32_t a4, struct ffa_direct_msg *msg);
++ffa_result ffa_msg_send_direct_req_64(uint16_t source, uint16_t dest,
++				      uint64_t a0, uint64_t a1, uint64_t a2,
++				      uint64_t a3, uint64_t a4,
++				      struct ffa_direct_msg *msg);
++
++/**
++ * @brief      Sends a 32 bit partition message in parameter registers as a
++ *             response and blocks until the response is available.
++ * @note       The ffa_interrupt_handler function can be called during the
++ *             execution of this function
++ *
++ * @param[in]  source            Source endpoint ID
++ * @param[in]  dest              Destination endpoint ID
++ * @param[in]  a0,a1,a2,a3,a4    Implementation defined message values
++ * @param[out] msg               The response message
++ *
++ * @return     The FF-A error status code
++ */
++ffa_result ffa_msg_send_direct_resp_32(uint16_t source, uint16_t dest,
++				       uint32_t a0, uint32_t a1, uint32_t a2,
++				       uint32_t a3, uint32_t a4,
++				       struct ffa_direct_msg *msg);
++
++/**
++ * @brief      Sends a 64 bit partition message in parameter registers as a
++ *             response and blocks until the response is available.
++ * @note       The ffa_interrupt_handler function can be called during the
++ *             execution of this function
++ *
++ * @param[in]  source            Source endpoint ID
++ * @param[in]  dest              Destination endpoint ID
++ * @param[in]  a0,a1,a2,a3,a4    Implementation defined message values
++ * @param[out] msg               The response message
++ *
++ * @return     The FF-A error status code
++ */
++ffa_result ffa_msg_send_direct_resp_64(uint16_t source, uint16_t dest,
++				       uint64_t a0, uint64_t a1, uint64_t a2,
++				       uint64_t a3, uint64_t a4,
++				       struct ffa_direct_msg *msg);
+ 
+ /**
+  * Memory management interfaces
+diff --git a/components/messaging/ffa/libsp/include/ffa_api_defines.h b/components/messaging/ffa/libsp/include/ffa_api_defines.h
+index 95bcb0c..163a0cd 100644
+--- a/components/messaging/ffa/libsp/include/ffa_api_defines.h
++++ b/components/messaging/ffa/libsp/include/ffa_api_defines.h
+@@ -58,6 +58,11 @@
+ #define FFA_MEM_PERM_GET		UINT32_C(0x84000088)
+ #define FFA_MEM_PERM_SET		UINT32_C(0x84000089)
+ 
++/* Utility macros */
++#define FFA_TO_32_BIT_FUNC(x)		((x) & (~UINT32_C(0x40000000)))
++#define FFA_IS_32_BIT_FUNC(x)		(((x) & UINT32_C(0x40000000)) == 0)
++#define FFA_IS_64_BIT_FUNC(x)		(((x) & UINT32_C(0x40000000)) != 0)
++
+ /* Special value for MBZ parameters */
+ #define FFA_PARAM_MBZ			UINT32_C(0x0)
+ 
+diff --git a/components/messaging/ffa/libsp/include/ffa_api_types.h b/components/messaging/ffa/libsp/include/ffa_api_types.h
+index 3686e2e..b1be7ac 100644
+--- a/components/messaging/ffa/libsp/include/ffa_api_types.h
++++ b/components/messaging/ffa/libsp/include/ffa_api_types.h
+@@ -1,6 +1,6 @@
+ /* SPDX-License-Identifier: BSD-3-Clause */
+ /*
+- * Copyright (c) 2020, Arm Limited and Contributors. All rights reserved.
++ * Copyright (c) 2020-2022, Arm Limited and Contributors. All rights reserved.
+  */
+ 
+ #ifndef LIBSP_INCLUDE_FFA_API_TYPES_H_
+@@ -80,7 +80,10 @@ struct ffa_direct_msg {
+ 	uint32_t function_id;
+ 	uint16_t source_id;
+ 	uint16_t destination_id;
+-	uint32_t args[5];
++	union {
++		uint32_t args32[5];
++		uint64_t args64[5];
++	} args;
+ };
+ 
+ /**
+diff --git a/components/messaging/ffa/libsp/include/sp_messaging.h b/components/messaging/ffa/libsp/include/sp_messaging.h
+index 4bb45f7..7173a92 100644
+--- a/components/messaging/ffa/libsp/include/sp_messaging.h
++++ b/components/messaging/ffa/libsp/include/sp_messaging.h
+@@ -1,6 +1,6 @@
+ /* SPDX-License-Identifier: BSD-3-Clause */
+ /*
+- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights reserved.
+  */
+ 
+ #ifndef LIBSP_INCLUDE_SP_MESSAGING_H_
+@@ -9,6 +9,7 @@
+ #include "sp_api_defines.h"
+ #include "sp_api_types.h"
+ 
++#include <stdbool.h>
+ #include <stdint.h>
+ 
+ #ifdef __cplusplus
+@@ -23,7 +24,11 @@ extern "C" {
+ struct sp_msg {
+ 	uint16_t source_id;
+ 	uint16_t destination_id;
+-	uint32_t args[SP_MSG_ARG_COUNT];
++	bool is_64bit_message;
++	union {
++		uint32_t args32[SP_MSG_ARG_COUNT];
++		uint64_t args64[SP_MSG_ARG_COUNT];
++	} args;
+ };
+ 
+ /**
+diff --git a/components/messaging/ffa/libsp/mock/mock_ffa_api.cpp b/components/messaging/ffa/libsp/mock/mock_ffa_api.cpp
+index ceebcbf..a01848c 100644
+--- a/components/messaging/ffa/libsp/mock/mock_ffa_api.cpp
++++ b/components/messaging/ffa/libsp/mock/mock_ffa_api.cpp
+@@ -140,13 +140,13 @@ ffa_result ffa_msg_wait(struct ffa_direct_msg *msg)
+ 		.returnIntValue();
+ }
+ 
+-void expect_ffa_msg_send_direct_req(uint16_t source, uint16_t dest, uint32_t a0,
+-				    uint32_t a1, uint32_t a2, uint32_t a3,
+-				    uint32_t a4,
+-				    const struct ffa_direct_msg *msg,
+-				    ffa_result result)
++void expect_ffa_msg_send_direct_req_32(uint16_t source, uint16_t dest,
++				       uint32_t a0, uint32_t a1, uint32_t a2,
++				       uint32_t a3, uint32_t a4,
++				       const struct ffa_direct_msg *msg,
++				       ffa_result result)
+ {
+-	mock().expectOneCall("ffa_msg_send_direct_req")
++	mock().expectOneCall("ffa_msg_send_direct_req_32")
+ 		.withUnsignedIntParameter("source", source)
+ 		.withUnsignedIntParameter("dest", dest)
+ 		.withUnsignedIntParameter("a0", a0)
+@@ -158,12 +158,13 @@ void expect_ffa_msg_send_direct_req(uint16_t source, uint16_t dest, uint32_t a0,
+ 		.andReturnValue(result);
+ }
+ 
+-ffa_result ffa_msg_send_direct_req(uint16_t source, uint16_t dest, uint32_t a0,
+-				   uint32_t a1, uint32_t a2, uint32_t a3,
+-				   uint32_t a4, struct ffa_direct_msg *msg)
++ffa_result ffa_msg_send_direct_req_32(uint16_t source, uint16_t dest,
++				      uint32_t a0, uint32_t a1, uint32_t a2,
++				      uint32_t a3,uint32_t a4,
++				      struct ffa_direct_msg *msg)
+ {
+ 	return mock()
+-		.actualCall("ffa_msg_send_direct_req")
++		.actualCall("ffa_msg_send_direct_req_32")
+ 		.withUnsignedIntParameter("source", source)
+ 		.withUnsignedIntParameter("dest", dest)
+ 		.withUnsignedIntParameter("a0", a0)
+@@ -175,13 +176,49 @@ ffa_result ffa_msg_send_direct_req(uint16_t source, uint16_t dest, uint32_t a0,
+ 		.returnIntValue();
+ }
+ 
+-void expect_ffa_msg_send_direct_resp(uint16_t source, uint16_t dest,
++void expect_ffa_msg_send_direct_req_64(uint16_t source, uint16_t dest,
++				       uint64_t a0, uint64_t a1, uint64_t a2,
++				       uint64_t a3, uint64_t a4,
++				       const struct ffa_direct_msg *msg,
++				       ffa_result result)
++{
++	mock().expectOneCall("ffa_msg_send_direct_req_64")
++		.withUnsignedIntParameter("source", source)
++		.withUnsignedIntParameter("dest", dest)
++		.withUnsignedLongIntParameter("a0", a0)
++		.withUnsignedLongIntParameter("a1", a1)
++		.withUnsignedLongIntParameter("a2", a2)
++		.withUnsignedLongIntParameter("a3", a3)
++		.withUnsignedLongIntParameter("a4", a4)
++		.withOutputParameterReturning("msg", msg, sizeof(*msg))
++		.andReturnValue(result);
++}
++
++ffa_result ffa_msg_send_direct_req_64(uint16_t source, uint16_t dest,
++				      uint64_t a0, uint64_t a1, uint64_t a2,
++				      uint64_t a3, uint64_t a4,
++				      struct ffa_direct_msg *msg)
++{
++	return mock()
++		.actualCall("ffa_msg_send_direct_req_64")
++		.withUnsignedIntParameter("source", source)
++		.withUnsignedIntParameter("dest", dest)
++		.withUnsignedLongIntParameter("a0", a0)
++		.withUnsignedLongIntParameter("a1", a1)
++		.withUnsignedLongIntParameter("a2", a2)
++		.withUnsignedLongIntParameter("a3", a3)
++		.withUnsignedLongIntParameter("a4", a4)
++		.withOutputParameter("msg", msg)
++		.returnIntValue();
++}
++
++void expect_ffa_msg_send_direct_resp_32(uint16_t source, uint16_t dest,
+ 				     uint32_t a0, uint32_t a1, uint32_t a2,
+ 				     uint32_t a3, uint32_t a4,
+ 				     const struct ffa_direct_msg *msg,
+ 				     ffa_result result)
+ {
+-	mock().expectOneCall("ffa_msg_send_direct_resp")
++	mock().expectOneCall("ffa_msg_send_direct_resp_32")
+ 		.withUnsignedIntParameter("source", source)
+ 		.withUnsignedIntParameter("dest", dest)
+ 		.withUnsignedIntParameter("a0", a0)
+@@ -193,12 +230,12 @@ void expect_ffa_msg_send_direct_resp(uint16_t source, uint16_t dest,
+ 		.andReturnValue(result);
+ }
+ 
+-ffa_result ffa_msg_send_direct_resp(uint16_t source, uint16_t dest, uint32_t a0,
++ffa_result ffa_msg_send_direct_resp_32(uint16_t source, uint16_t dest, uint32_t a0,
+ 				    uint32_t a1, uint32_t a2, uint32_t a3,
+ 				    uint32_t a4, struct ffa_direct_msg *msg)
+ {
+ 	return mock()
+-		.actualCall("ffa_msg_send_direct_resp")
++		.actualCall("ffa_msg_send_direct_resp_32")
+ 		.withUnsignedIntParameter("source", source)
+ 		.withUnsignedIntParameter("dest", dest)
+ 		.withUnsignedIntParameter("a0", a0)
+@@ -210,6 +247,41 @@ ffa_result ffa_msg_send_direct_resp(uint16_t source, uint16_t dest, uint32_t a0,
+ 		.returnIntValue();
+ }
+ 
++void expect_ffa_msg_send_direct_resp_64(uint16_t source, uint16_t dest,
++				     uint64_t a0, uint64_t a1, uint64_t a2,
++				     uint64_t a3, uint64_t a4,
++				     const struct ffa_direct_msg *msg,
++				     ffa_result result)
++{
++	mock().expectOneCall("ffa_msg_send_direct_resp_64")
++		.withUnsignedIntParameter("source", source)
++		.withUnsignedIntParameter("dest", dest)
++		.withUnsignedLongIntParameter("a0", a0)
++		.withUnsignedLongIntParameter("a1", a1)
++		.withUnsignedLongIntParameter("a2", a2)
++		.withUnsignedLongIntParameter("a3", a3)
++		.withUnsignedLongIntParameter("a4", a4)
++		.withOutputParameterReturning("msg", msg, sizeof(*msg))
++		.andReturnValue(result);
++}
++
++ffa_result ffa_msg_send_direct_resp_64(uint16_t source, uint16_t dest, uint64_t a0,
++				    uint64_t a1, uint64_t a2, uint64_t a3,
++				    uint64_t a4, struct ffa_direct_msg *msg)
++{
++	return mock()
++		.actualCall("ffa_msg_send_direct_resp_64")
++		.withUnsignedIntParameter("source", source)
++		.withUnsignedIntParameter("dest", dest)
++		.withUnsignedLongIntParameter("a0", a0)
++		.withUnsignedLongIntParameter("a1", a1)
++		.withUnsignedLongIntParameter("a2", a2)
++		.withUnsignedLongIntParameter("a3", a3)
++		.withUnsignedLongIntParameter("a4", a4)
++		.withOutputParameter("msg", msg)
++		.returnIntValue();
++}
++
+ void expect_ffa_mem_donate(uint32_t total_length, uint32_t fragment_length,
+ 			   void *buffer_address, uint32_t page_count,
+ 			   const uint64_t *handle, ffa_result result)
+diff --git a/components/messaging/ffa/libsp/mock/mock_ffa_api.h b/components/messaging/ffa/libsp/mock/mock_ffa_api.h
+index b1c794f..4213ccb 100644
+--- a/components/messaging/ffa/libsp/mock/mock_ffa_api.h
++++ b/components/messaging/ffa/libsp/mock/mock_ffa_api.h
+@@ -30,17 +30,29 @@ void expect_ffa_id_get(const uint16_t *id, ffa_result result);
+ 
+ void expect_ffa_msg_wait(const struct ffa_direct_msg *msg, ffa_result result);
+ 
+-void expect_ffa_msg_send_direct_req(uint16_t source, uint16_t dest, uint32_t a0,
+-				    uint32_t a1, uint32_t a2, uint32_t a3,
+-				    uint32_t a4,
+-				    const struct ffa_direct_msg *msg,
+-				    ffa_result result);
+-
+-void expect_ffa_msg_send_direct_resp(uint16_t source, uint16_t dest,
+-				     uint32_t a0, uint32_t a1, uint32_t a2,
+-				     uint32_t a3, uint32_t a4,
+-				     const struct ffa_direct_msg *msg,
+-				     ffa_result result);
++void expect_ffa_msg_send_direct_req_32(uint16_t source, uint16_t dest,
++				       uint32_t a0, uint32_t a1, uint32_t a2,
++				       uint32_t a3, uint32_t a4,
++				       const struct ffa_direct_msg *msg,
++				       ffa_result result);
++
++void expect_ffa_msg_send_direct_req_64(uint16_t source, uint16_t dest,
++				       uint64_t a0, uint64_t a1, uint64_t a2,
++				       uint64_t a3, uint64_t a4,
++				       const struct ffa_direct_msg *msg,
++				       ffa_result result);
++
++void expect_ffa_msg_send_direct_resp_32(uint16_t source, uint16_t dest,
++					uint32_t a0, uint32_t a1, uint32_t a2,
++					uint32_t a3, uint32_t a4,
++					const struct ffa_direct_msg *msg,
++					ffa_result result);
++
++void expect_ffa_msg_send_direct_resp_64(uint16_t source, uint16_t dest,
++					uint64_t a0, uint64_t a1, uint64_t a2,
++					uint64_t a3, uint64_t a4,
++					const struct ffa_direct_msg *msg,
++					ffa_result result);
+ 
+ void expect_ffa_mem_donate(uint32_t total_length, uint32_t fragment_length,
+ 			   void *buffer_address, uint32_t page_count,
+diff --git a/components/messaging/ffa/libsp/mock/test/test_mock_ffa_api.cpp b/components/messaging/ffa/libsp/mock/test/test_mock_ffa_api.cpp
+index ab33649..c1cbdd6 100644
+--- a/components/messaging/ffa/libsp/mock/test/test_mock_ffa_api.cpp
++++ b/components/messaging/ffa/libsp/mock/test/test_mock_ffa_api.cpp
+@@ -105,7 +105,7 @@ TEST(mock_ffa_api, ffa_msg_wait)
+ 	MEMCMP_EQUAL(&expected_msg, &msg, sizeof(expected_msg));
+ }
+ 
+-TEST(mock_ffa_api, ffa_msg_send_direct_req)
++TEST(mock_ffa_api, ffa_msg_send_direct_req_32)
+ {
+ 	const uint16_t source = 0x1122;
+ 	const uint16_t dest = 0x2233;
+@@ -116,13 +116,30 @@ TEST(mock_ffa_api, ffa_msg_send_direct_req)
+ 	const uint32_t a4 = 0x89124567;
+ 	struct ffa_direct_msg msg = { 0 };
+ 
+-	expect_ffa_msg_send_direct_req(source, dest, a0, a1, a2, a3, a4,
++	expect_ffa_msg_send_direct_req_32(source, dest, a0, a1, a2, a3, a4,
++				          &expected_msg, result);
++	LONGS_EQUAL(result, ffa_msg_send_direct_req_32(source, dest, a0, a1, a2,
++						       a3, a4, &msg));
++}
++
++TEST(mock_ffa_api, ffa_msg_send_direct_req_64)
++{
++	const uint16_t source = 0x1122;
++	const uint16_t dest = 0x2233;
++	const uint64_t a0 = 0x4567891221987654;
++	const uint64_t a1 = 0x5678912442198765;
++	const uint64_t a2 = 0x6789124554219876;
++	const uint64_t a3 = 0x7891245665421987;
++	const uint64_t a4 = 0x8912456776542198;
++	struct ffa_direct_msg msg = { 0 };
++
++	expect_ffa_msg_send_direct_req_64(source, dest, a0, a1, a2, a3, a4,
+ 				       &expected_msg, result);
+-	LONGS_EQUAL(result, ffa_msg_send_direct_req(source, dest, a0, a1, a2,
+-						    a3, a4, &msg));
++	LONGS_EQUAL(result, ffa_msg_send_direct_req_64(source, dest, a0, a1, a2,
++						       a3, a4, &msg));
+ }
+ 
+-TEST(mock_ffa_api, ffa_msg_send_direct_resp)
++TEST(mock_ffa_api, ffa_msg_send_direct_resp_32)
+ {
+ 	const uint16_t source = 0x1122;
+ 	const uint16_t dest = 0x2233;
+@@ -133,10 +150,27 @@ TEST(mock_ffa_api, ffa_msg_send_direct_resp)
+ 	const uint32_t a4 = 0x89124567;
+ 	struct ffa_direct_msg msg = { 0 };
+ 
+-	expect_ffa_msg_send_direct_resp(source, dest, a0, a1, a2, a3, a4,
++	expect_ffa_msg_send_direct_resp_32(source, dest, a0, a1, a2, a3, a4,
+ 					&expected_msg, result);
+-	LONGS_EQUAL(result, ffa_msg_send_direct_resp(source, dest, a0, a1, a2,
+-						     a3, a4, &msg));
++	LONGS_EQUAL(result, ffa_msg_send_direct_resp_32(source, dest, a0, a1,
++							a2, a3, a4, &msg));
++}
++
++TEST(mock_ffa_api, ffa_msg_send_direct_resp_64)
++{
++	const uint16_t source = 0x1122;
++	const uint16_t dest = 0x2233;
++	const uint64_t a0 = 0x4567891221987654;
++	const uint64_t a1 = 0x5678912442198765;
++	const uint64_t a2 = 0x6789124554219876;
++	const uint64_t a3 = 0x7891245665421987;
++	const uint64_t a4 = 0x8912456776542198;
++	struct ffa_direct_msg msg = { 0 };
++
++	expect_ffa_msg_send_direct_resp_64(source, dest, a0, a1, a2, a3, a4,
++					  &expected_msg, result);
++	LONGS_EQUAL(result, ffa_msg_send_direct_resp_64(source, dest, a0, a1,
++							a2, a3, a4, &msg));
+ }
+ 
+ TEST(mock_ffa_api, ffa_mem_donate)
+diff --git a/components/messaging/ffa/libsp/sp_messaging.c b/components/messaging/ffa/libsp/sp_messaging.c
+index f7223aa..392006b 100644
+--- a/components/messaging/ffa/libsp/sp_messaging.c
++++ b/components/messaging/ffa/libsp/sp_messaging.c
+@@ -1,6 +1,6 @@
+ // SPDX-License-Identifier: BSD-3-Clause
+ /*
+- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights reserved.
+  */
+ 
+ #include "ffa_api.h"
+@@ -20,22 +20,40 @@ static void pack_ffa_direct_msg(const struct sp_msg *msg,
+ 	ffa_msg->source_id = msg->source_id;
+ 	ffa_msg->destination_id = msg->destination_id;
+ 
+-	ffa_msg->args[0] = 0;
+-	memcpy(&ffa_msg->args[SP_MSG_ARG_OFFSET], msg->args, sizeof(msg->args));
++	ffa_msg->args.args64[0] = 0;
++	if (msg->is_64bit_message)
++		memcpy(&ffa_msg->args.args64[SP_MSG_ARG_OFFSET],
++		       msg->args.args64, sizeof(msg->args.args64));
++	else
++		memcpy(&ffa_msg->args.args32[SP_MSG_ARG_OFFSET],
++		       msg->args.args32, sizeof(msg->args.args32));
+ }
+ 
+ static void unpack_ffa_direct_msg(const struct ffa_direct_msg *ffa_msg,
+ 				  struct sp_msg *msg)
+ {
+-	if (ffa_msg->function_id != FFA_SUCCESS_32) {
++	if (ffa_msg->function_id == FFA_MSG_SEND_DIRECT_REQ_32 ||
++	    ffa_msg->function_id == FFA_MSG_SEND_DIRECT_RESP_32) {
+ 		/*
+-		 * Handling request or response (error is handled before call)
++		 * Handling 32 bit request or response
+ 		 */
+ 		msg->source_id = ffa_msg->source_id;
+ 		msg->destination_id = ffa_msg->destination_id;
++		msg->is_64bit_message = FFA_IS_64_BIT_FUNC(ffa_msg->function_id);
+ 
+-		memcpy(msg->args, &ffa_msg->args[SP_MSG_ARG_OFFSET],
+-		       sizeof(msg->args));
++		memcpy(msg->args.args32, &ffa_msg->args.args32[SP_MSG_ARG_OFFSET],
++		       sizeof(msg->args.args32));
++	} else if (ffa_msg->function_id == FFA_MSG_SEND_DIRECT_REQ_64 ||
++		   ffa_msg->function_id == FFA_MSG_SEND_DIRECT_RESP_64) {
++		/*
++		 * Handling 64 bit request or response
++		 */
++		msg->source_id = ffa_msg->source_id;
++		msg->destination_id = ffa_msg->destination_id;
++		msg->is_64bit_message = FFA_IS_64_BIT_FUNC(ffa_msg->function_id);
++
++		memcpy(msg->args.args64, &ffa_msg->args.args64[SP_MSG_ARG_OFFSET],
++		       sizeof(msg->args.args64));
+ 	} else {
+ 		/* Success has no message parameters */
+ 		*msg = (struct sp_msg){ 0 };
+@@ -89,11 +107,18 @@ sp_result sp_msg_send_direct_req(const struct sp_msg *req, struct sp_msg *resp)
+ 	ffa_direct_msg_routing_ext_req_pre_hook(&ffa_req);
+ #endif
+ 
+-	ffa_res = ffa_msg_send_direct_req(ffa_req.source_id,
+-					  ffa_req.destination_id,
+-					  ffa_req.args[0], ffa_req.args[1],
+-					  ffa_req.args[2], ffa_req.args[3],
+-					  ffa_req.args[4], &ffa_resp);
++	if (req->is_64bit_message)
++		ffa_res = ffa_msg_send_direct_req_64(
++			ffa_req.source_id, ffa_req.destination_id,
++			ffa_req.args.args64[0], ffa_req.args.args64[1],
++			ffa_req.args.args64[2], ffa_req.args.args64[3],
++			ffa_req.args.args64[4], &ffa_resp);
++	else
++		ffa_res = ffa_msg_send_direct_req_32(
++			ffa_req.source_id, ffa_req.destination_id,
++			ffa_req.args.args32[0], ffa_req.args.args32[1],
++			ffa_req.args.args32[2], ffa_req.args.args32[3],
++			ffa_req.args.args32[4], &ffa_resp);
+ 
+ 	if (ffa_res != FFA_OK) {
+ #if FFA_DIRECT_MSG_ROUTING_EXTENSION
+@@ -136,11 +161,18 @@ sp_result sp_msg_send_direct_resp(const struct sp_msg *resp, struct sp_msg *req)
+ 	ffa_direct_msg_routing_ext_resp_pre_hook(&ffa_resp);
+ #endif
+ 
+-	ffa_res = ffa_msg_send_direct_resp(ffa_resp.source_id,
+-					   ffa_resp.destination_id,
+-					   ffa_resp.args[0], ffa_resp.args[1],
+-					   ffa_resp.args[2], ffa_resp.args[3],
+-					   ffa_resp.args[4], &ffa_req);
++	if (resp->is_64bit_message)
++		ffa_res = ffa_msg_send_direct_resp_64(
++			ffa_resp.source_id, ffa_resp.destination_id,
++			ffa_resp.args.args64[0], ffa_resp.args.args64[1],
++			ffa_resp.args.args64[2], ffa_resp.args.args64[3],
++			ffa_resp.args.args64[4], &ffa_req);
++	else
++		ffa_res = ffa_msg_send_direct_resp_32(
++			ffa_resp.source_id, ffa_resp.destination_id,
++			ffa_resp.args.args32[0], ffa_resp.args.args32[1],
++			ffa_resp.args.args32[2], ffa_resp.args.args32[3],
++			ffa_resp.args.args32[4], &ffa_req);
+ 
+ 	if (ffa_res != FFA_OK) {
+ #if FFA_DIRECT_MSG_ROUTING_EXTENSION
+@@ -182,11 +214,11 @@ sp_result sp_msg_send_rc_req(const struct sp_msg *req, struct sp_msg *resp)
+ 
+ 	ffa_direct_msg_routing_ext_rc_req_pre_hook(&ffa_req);
+ 
+-	ffa_res = ffa_msg_send_direct_resp(ffa_req.source_id,
++	ffa_res = ffa_msg_send_direct_resp_32(ffa_req.source_id,
+ 					   ffa_req.destination_id,
+-					   ffa_req.args[0], ffa_req.args[1],
+-					   ffa_req.args[2], ffa_req.args[3],
+-					   ffa_req.args[4], &ffa_resp);
++					   ffa_req.args.args32[0], ffa_req.args.args32[1],
++					   ffa_req.args.args32[2], ffa_req.args.args32[3],
++					   ffa_req.args.args32[4], &ffa_resp);
+ 
+ 	if (ffa_res != FFA_OK) {
+ 		ffa_direct_msg_routing_ext_rc_req_error_hook();
+diff --git a/components/messaging/ffa/libsp/test/test_ffa_api.cpp b/components/messaging/ffa/libsp/test/test_ffa_api.cpp
+index 8fa261e..6cca085 100644
+--- a/components/messaging/ffa/libsp/test/test_ffa_api.cpp
++++ b/components/messaging/ffa/libsp/test/test_ffa_api.cpp
+@@ -43,20 +43,35 @@ TEST_GROUP(ffa_api)
+ 		svc_result.a2 = (uint32_t)error_code;
+ 	}
+ 
+-	void msg_equal(uint32_t func_id, uint16_t source_id, uint16_t dest_id,
+-			uint32_t arg0, uint32_t arg1, uint32_t arg2,
+-			uint32_t arg3, uint32_t arg4)
++	void msg_equal_32(uint32_t func_id, uint16_t source_id, uint16_t dest_id,
++			  uint32_t arg0, uint32_t arg1, uint32_t arg2,
++			  uint32_t arg3, uint32_t arg4)
+ 	{
+ 		UNSIGNED_LONGS_EQUAL(func_id, msg.function_id);
+ 		UNSIGNED_LONGS_EQUAL(source_id, msg.source_id);
+ 		UNSIGNED_LONGS_EQUAL(dest_id, msg.destination_id);
+-		UNSIGNED_LONGS_EQUAL(arg0, msg.args[0]);
+-		UNSIGNED_LONGS_EQUAL(arg1, msg.args[1]);
+-		UNSIGNED_LONGS_EQUAL(arg2, msg.args[2]);
+-		UNSIGNED_LONGS_EQUAL(arg3, msg.args[3]);
+-		UNSIGNED_LONGS_EQUAL(arg4, msg.args[4]);
++		UNSIGNED_LONGS_EQUAL(arg0, msg.args.args32[0]);
++		UNSIGNED_LONGS_EQUAL(arg1, msg.args.args32[1]);
++		UNSIGNED_LONGS_EQUAL(arg2, msg.args.args32[2]);
++		UNSIGNED_LONGS_EQUAL(arg3, msg.args.args32[3]);
++		UNSIGNED_LONGS_EQUAL(arg4, msg.args.args32[4]);
+ 	}
+ 
++	void msg_equal_64(uint32_t func_id, uint16_t source_id, uint16_t dest_id,
++			  uint64_t arg0, uint64_t arg1, uint64_t arg2,
++			  uint64_t arg3, uint64_t arg4)
++	{
++		UNSIGNED_LONGS_EQUAL(func_id, msg.function_id);
++		UNSIGNED_LONGS_EQUAL(source_id, msg.source_id);
++		UNSIGNED_LONGS_EQUAL(dest_id, msg.destination_id);
++		UNSIGNED_LONGLONGS_EQUAL(arg0, msg.args.args64[0]);
++		UNSIGNED_LONGLONGS_EQUAL(arg1, msg.args.args64[1]);
++		UNSIGNED_LONGLONGS_EQUAL(arg2, msg.args.args64[2]);
++		UNSIGNED_LONGLONGS_EQUAL(arg3, msg.args.args64[3]);
++		UNSIGNED_LONGLONGS_EQUAL(arg4, msg.args.args64[4]);
++	}
++
++
+ 	struct ffa_params svc_result;
+ 	struct ffa_direct_msg msg;
+ };
+@@ -360,7 +375,7 @@ TEST(ffa_api, ffa_msg_wait_success)
+ 	expect_ffa_svc(0x8400006B, 0, 0, 0, 0, 0, 0, 0, &svc_result);
+ 	ffa_result result = ffa_msg_wait(&msg);
+ 	LONGS_EQUAL(0, result);
+-	msg_equal(0x84000061, 0, 0, 0, 0, 0, 0, 0);
++	msg_equal_32(0x84000061, 0, 0, 0, 0, 0, 0, 0);
+ }
+ 
+ TEST(ffa_api, ffa_msg_wait_error)
+@@ -369,10 +384,10 @@ TEST(ffa_api, ffa_msg_wait_error)
+ 	expect_ffa_svc(0x8400006B, 0, 0, 0, 0, 0, 0, 0, &svc_result);
+ 	ffa_result result = ffa_msg_wait(&msg);
+ 	LONGS_EQUAL(-1, result);
+-	msg_equal(0, 0, 0, 0, 0, 0, 0, 0);
++	msg_equal_32(0, 0, 0, 0, 0, 0, 0, 0);
+ }
+ 
+-TEST(ffa_api, ffa_msg_wait_direct_req)
++TEST(ffa_api, ffa_msg_wait_direct_req_32)
+ {
+ 	const uint16_t source_id = 0x1122;
+ 	const uint16_t dest_id = 0x3344;
+@@ -392,7 +407,31 @@ TEST(ffa_api, ffa_msg_wait_direct_req)
+ 	expect_ffa_svc(0x8400006B, 0, 0, 0, 0, 0, 0, 0, &svc_result);
+ 	ffa_result result = ffa_msg_wait(&msg);
+ 	LONGS_EQUAL(0, result);
+-	msg_equal(0x8400006F, source_id, dest_id, arg0, arg1, arg2, arg3,
++	msg_equal_32(0x8400006F, source_id, dest_id, arg0, arg1, arg2, arg3,
++		   arg4);
++}
++
++TEST(ffa_api, ffa_msg_wait_direct_req_64)
++{
++	const uint16_t source_id = 0x1122;
++	const uint16_t dest_id = 0x3344;
++	const uint64_t arg0 = 0x0123456776543210ULL;
++	const uint64_t arg1 = 0x1234567887654321ULL;
++	const uint64_t arg2 = 0x2345678998765432ULL;
++	const uint64_t arg3 = 0x3456789aa9876543ULL;
++	const uint64_t arg4 = 0x456789abba987654ULL;
++
++	svc_result.a0 = 0xC400006F;
++	svc_result.a1 = ((uint32_t)source_id) << 16 | dest_id;
++	svc_result.a3 = arg0;
++	svc_result.a4 = arg1;
++	svc_result.a5 = arg2;
++	svc_result.a6 = arg3;
++	svc_result.a7 = arg4;
++	expect_ffa_svc(0x8400006B, 0, 0, 0, 0, 0, 0, 0, &svc_result);
++	ffa_result result = ffa_msg_wait(&msg);
++	LONGS_EQUAL(0, result);
++	msg_equal_64(0xC400006F, source_id, dest_id, arg0, arg1, arg2, arg3,
+ 		   arg4);
+ }
+ 
+@@ -410,7 +449,7 @@ TEST(ffa_api, ffa_msg_wait_one_interrupt_success)
+ 	expect_ffa_svc(0x8400006B, 0, 0, 0, 0, 0, 0, 0, &svc_result);
+ 	ffa_result result = ffa_msg_wait(&msg);
+ 	LONGS_EQUAL(0, result);
+-	msg_equal(0x84000061, 0, 0, 0, 0, 0, 0, 0);
++	msg_equal_32(0x84000061, 0, 0, 0, 0, 0, 0, 0);
+ }
+ 
+ TEST(ffa_api, ffa_msg_wait_two_interrupt_success)
+@@ -434,7 +473,7 @@ TEST(ffa_api, ffa_msg_wait_two_interrupt_success)
+ 	expect_ffa_svc(0x8400006B, 0, 0, 0, 0, 0, 0, 0, &svc_result);
+ 	ffa_result result = ffa_msg_wait(&msg);
+ 	LONGS_EQUAL(0, result);
+-	msg_equal(0x84000061, 0, 0, 0, 0, 0, 0, 0);
++	msg_equal_32(0x84000061, 0, 0, 0, 0, 0, 0, 0);
+ }
+ 
+ TEST(ffa_api, ffa_msg_wait_unknown_response)
+@@ -448,7 +487,7 @@ TEST(ffa_api, ffa_msg_wait_unknown_response)
+ 	}
+ }
+ 
+-TEST(ffa_api, ffa_msg_send_direct_req_success)
++TEST(ffa_api, ffa_msg_send_direct_req_32_success)
+ {
+ 	const uint16_t source_id = 0x1122;
+ 	const uint16_t dest_id = 0x3344;
+@@ -461,13 +500,13 @@ TEST(ffa_api, ffa_msg_send_direct_req_success)
+ 	svc_result.a0 = 0x84000061;
+ 	expect_ffa_svc(0x8400006F, ((uint32_t)source_id << 16) | dest_id, 0,
+ 		       arg0, arg1, arg2, arg3, arg4, &svc_result);
+-	ffa_result result = ffa_msg_send_direct_req(
++	ffa_result result = ffa_msg_send_direct_req_32(
+ 		source_id, dest_id, arg0, arg1, arg2, arg3, arg4, &msg);
+ 	LONGS_EQUAL(0, result);
+-	msg_equal(0x84000061, 0, 0, 0, 0, 0, 0, 0);
++	msg_equal_32(0x84000061, 0, 0, 0, 0, 0, 0, 0);
+ }
+ 
+-TEST(ffa_api, ffa_msg_send_direct_req_error)
++TEST(ffa_api, ffa_msg_send_direct_req_32_error)
+ {
+ 	const uint16_t source_id = 0x1122;
+ 	const uint16_t dest_id = 0x3344;
+@@ -480,13 +519,48 @@ TEST(ffa_api, ffa_msg_send_direct_req_error)
+ 	setup_error_response(-1);
+ 	expect_ffa_svc(0x8400006F, ((uint32_t)source_id << 16) | dest_id, 0,
+ 		       arg0, arg1, arg2, arg3, arg4, &svc_result);
+-	ffa_result result = ffa_msg_send_direct_req(
++	ffa_result result = ffa_msg_send_direct_req_32(
+ 		source_id, dest_id, arg0, arg1, arg2, arg3, arg4, &msg);
+ 	LONGS_EQUAL(-1, result);
+-	msg_equal(0, 0, 0, 0, 0, 0, 0, 0);
++	msg_equal_32(0, 0, 0, 0, 0, 0, 0, 0);
++}
++
++TEST(ffa_api, ffa_msg_send_direct_req_32_get_resp_64)
++{
++	const uint16_t source_id = 0x1122;
++	const uint16_t dest_id = 0x3344;
++	const uint32_t arg0 = 0x01234567ULL;
++	const uint32_t arg1 = 0x12345678ULL;
++	const uint32_t arg2 = 0x23456789ULL;
++	const uint32_t arg3 = 0x3456789aULL;
++	const uint32_t arg4 = 0x456789abULL;
++	const uint16_t resp_source_id = 0x1221;
++	const uint16_t resp_dest_id = 0x3443;
++	const uint64_t resp_arg0 = 0x9012345665432109ULL;
++	const uint64_t resp_arg1 = 0xa12345677654321aULL;
++	const uint64_t resp_arg2 = 0xb23456788765432bULL;
++	const uint64_t resp_arg3 = 0xc34567899876543cULL;
++	const uint64_t resp_arg4 = 0xd456789aa987654dULL;
++	assert_environment_t assert_env;
++
++	svc_result.a0 = 0xC4000070;
++	svc_result.a1 = ((uint32_t)resp_source_id) << 16 | resp_dest_id;
++	svc_result.a3 = resp_arg0;
++	svc_result.a4 = resp_arg1;
++	svc_result.a5 = resp_arg2;
++	svc_result.a6 = resp_arg3;
++	svc_result.a7 = resp_arg4;
++
++	expect_ffa_svc(0x8400006F, ((uint32_t)source_id << 16) | dest_id, 0,
++		       arg0, arg1, arg2, arg3, arg4, &svc_result);
++
++	if (SETUP_ASSERT_ENVIRONMENT(assert_env)) {
++		ffa_msg_send_direct_req_32(source_id, dest_id, arg0, arg1, arg2,
++					arg3, arg4, &msg);
++	}
+ }
+ 
+-TEST(ffa_api, ffa_msg_send_direct_req_direct_resp)
++TEST(ffa_api, ffa_msg_send_direct_req_32_direct_resp)
+ {
+ 	const uint16_t source_id = 0x1122;
+ 	const uint16_t dest_id = 0x3344;
+@@ -512,14 +586,82 @@ TEST(ffa_api, ffa_msg_send_direct_req_direct_resp)
+ 	svc_result.a7 = resp_arg4;
+ 	expect_ffa_svc(0x8400006F, ((uint32_t)source_id << 16) | dest_id, 0,
+ 		       arg0, arg1, arg2, arg3, arg4, &svc_result);
+-	ffa_result result = ffa_msg_send_direct_req(
++	ffa_result result = ffa_msg_send_direct_req_32(
++		source_id, dest_id, arg0, arg1, arg2, arg3, arg4, &msg);
++	LONGS_EQUAL(0, result);
++	msg_equal_32(0x84000070, resp_source_id, resp_dest_id, resp_arg0,
++		   resp_arg1, resp_arg2, resp_arg3, resp_arg4);
++}
++
++TEST(ffa_api, ffa_msg_send_direct_req_64_success)
++{
++	const uint16_t source_id = 0x1122;
++	const uint16_t dest_id = 0x3344;
++	const uint64_t arg0 = 0x0123456776543210ULL;
++	const uint64_t arg1 = 0x1234567887654321ULL;
++	const uint64_t arg2 = 0x2345678998765432ULL;
++	const uint64_t arg3 = 0x3456789aa9876543ULL;
++	const uint64_t arg4 = 0x456789abba987654ULL;
++	const uint16_t resp_source_id = 0x1221;
++	const uint16_t resp_dest_id = 0x3443;
++	const uint64_t resp_arg0 = 0x9012345665432109ULL;
++	const uint64_t resp_arg1 = 0xa12345677654321aULL;
++	const uint64_t resp_arg2 = 0xb23456788765432bULL;
++	const uint64_t resp_arg3 = 0xc34567899876543cULL;
++	const uint64_t resp_arg4 = 0xd456789aa987654dULL;
++
++	svc_result.a0 = 0xC4000070;
++	svc_result.a1 = ((uint32_t)resp_source_id) << 16 | resp_dest_id;
++	svc_result.a3 = resp_arg0;
++	svc_result.a4 = resp_arg1;
++	svc_result.a5 = resp_arg2;
++	svc_result.a6 = resp_arg3;
++	svc_result.a7 = resp_arg4;
++	expect_ffa_svc(0xC400006F, ((uint32_t)source_id << 16) | dest_id, 0,
++		       arg0, arg1, arg2, arg3, arg4, &svc_result);
++	ffa_result result = ffa_msg_send_direct_req_64(
+ 		source_id, dest_id, arg0, arg1, arg2, arg3, arg4, &msg);
+ 	LONGS_EQUAL(0, result);
+-	msg_equal(0x84000070, resp_source_id, resp_dest_id, resp_arg0,
++	msg_equal_64(0xC4000070, resp_source_id, resp_dest_id, resp_arg0,
+ 		   resp_arg1, resp_arg2, resp_arg3, resp_arg4);
+ }
+ 
+-TEST(ffa_api, ffa_msg_send_direct_req_one_interrupt_success)
++TEST(ffa_api, ffa_msg_send_direct_req_64_get_resp_32)
++{
++	const uint16_t source_id = 0x1122;
++	const uint16_t dest_id = 0x3344;
++	const uint64_t arg0 = 0x9012345665432109ULL;
++	const uint64_t arg1 = 0xa12345677654321aULL;
++	const uint64_t arg2 = 0xb23456788765432bULL;
++	const uint64_t arg3 = 0xc34567899876543cULL;
++	const uint64_t arg4 = 0xd456789aa987654dULL;
++	const uint16_t resp_source_id = 0x1221;
++	const uint16_t resp_dest_id = 0x3443;
++	const uint32_t resp_arg0 = 0x01234567ULL;
++	const uint32_t resp_arg1 = 0x12345678ULL;
++	const uint32_t resp_arg2 = 0x23456789ULL;
++	const uint32_t resp_arg3 = 0x3456789aULL;
++	const uint32_t resp_arg4 = 0x456789abULL;
++	assert_environment_t assert_env;
++
++	svc_result.a0 = 0x84000070;
++	svc_result.a1 = ((uint32_t)resp_source_id) << 16 | resp_dest_id;
++	svc_result.a3 = resp_arg0;
++	svc_result.a4 = resp_arg1;
++	svc_result.a5 = resp_arg2;
++	svc_result.a6 = resp_arg3;
++	svc_result.a7 = resp_arg4;
++
++	expect_ffa_svc(0xC400006F, ((uint32_t)source_id << 16) | dest_id, 0,
++		       arg0, arg1, arg2, arg3, arg4, &svc_result);
++
++	if (SETUP_ASSERT_ENVIRONMENT(assert_env)) {
++		ffa_msg_send_direct_req_64(source_id, dest_id, arg0, arg1, arg2,
++					arg3, arg4, &msg);
++	}
++}
++
++TEST(ffa_api, ffa_msg_send_direct_req_32_one_interrupt_success)
+ {
+ 	const uint16_t source_id = 0x1122;
+ 	const uint16_t dest_id = 0x3344;
+@@ -539,13 +681,13 @@ TEST(ffa_api, ffa_msg_send_direct_req_one_interrupt_success)
+ 
+ 	svc_result.a0 = 0x84000061;
+ 	expect_ffa_svc(0x8400006B, 0, 0, 0, 0, 0, 0, 0, &svc_result);
+-	ffa_result result = ffa_msg_send_direct_req(
++	ffa_result result = ffa_msg_send_direct_req_32(
+ 		source_id, dest_id, arg0, arg1, arg2, arg3, arg4, &msg);
+ 	LONGS_EQUAL(0, result);
+-	msg_equal(0x84000061, 0, 0, 0, 0, 0, 0, 0);
++	msg_equal_32(0x84000061, 0, 0, 0, 0, 0, 0, 0);
+ }
+ 
+-TEST(ffa_api, ffa_msg_send_direct_req_two_interrupt_success)
++TEST(ffa_api, ffa_msg_send_direct_req_32_two_interrupt_success)
+ {
+ 	const uint16_t source_id = 0x1122;
+ 	const uint16_t dest_id = 0x3344;
+@@ -573,13 +715,13 @@ TEST(ffa_api, ffa_msg_send_direct_req_two_interrupt_success)
+ 
+ 	svc_result.a0 = 0x84000061;
+ 	expect_ffa_svc(0x8400006B, 0, 0, 0, 0, 0, 0, 0, &svc_result);
+-	ffa_result result = ffa_msg_send_direct_req(
++	ffa_result result = ffa_msg_send_direct_req_32(
+ 		source_id, dest_id, arg0, arg1, arg2, arg3, arg4, &msg);
+ 	LONGS_EQUAL(0, result);
+-	msg_equal(0x84000061, 0, 0, 0, 0, 0, 0, 0);
++	msg_equal_32(0x84000061, 0, 0, 0, 0, 0, 0, 0);
+ }
+ 
+-TEST(ffa_api, ffa_msg_send_direct_req_unknown_response)
++TEST(ffa_api, ffa_msg_send_direct_req_32_unknown_response)
+ {
+ 	const uint16_t source_id = 0x1122;
+ 	const uint16_t dest_id = 0x3344;
+@@ -594,12 +736,12 @@ TEST(ffa_api, ffa_msg_send_direct_req_unknown_response)
+ 	expect_ffa_svc(0x8400006F, ((uint32_t)source_id << 16) | dest_id, 0,
+ 		       arg0, arg1, arg2, arg3, arg4, &svc_result);
+ 	if (SETUP_ASSERT_ENVIRONMENT(assert_env)) {
+-		ffa_msg_send_direct_req(source_id, dest_id, arg0, arg1, arg2,
++		ffa_msg_send_direct_req_32(source_id, dest_id, arg0, arg1, arg2,
+ 					arg3, arg4, &msg);
+ 	}
+ }
+ 
+-TEST(ffa_api, ffa_msg_send_direct_resp_success)
++TEST(ffa_api, ffa_msg_send_direct_resp_32_success)
+ {
+ 	const uint16_t source_id = 0x1122;
+ 	const uint16_t dest_id = 0x3344;
+@@ -612,13 +754,13 @@ TEST(ffa_api, ffa_msg_send_direct_resp_success)
+ 	svc_result.a0 = 0x84000061;
+ 	expect_ffa_svc(0x84000070, ((uint32_t)source_id << 16) | dest_id, 0,
+ 		       arg0, arg1, arg2, arg3, arg4, &svc_result);
+-	ffa_result result = ffa_msg_send_direct_resp(
++	ffa_result result = ffa_msg_send_direct_resp_32(
+ 		source_id, dest_id, arg0, arg1, arg2, arg3, arg4, &msg);
+ 	LONGS_EQUAL(0, result);
+-	msg_equal(0x84000061, 0, 0, 0, 0, 0, 0, 0);
++	msg_equal_32(0x84000061, 0, 0, 0, 0, 0, 0, 0);
+ }
+ 
+-TEST(ffa_api, ffa_msg_send_direct_resp_error)
++TEST(ffa_api, ffa_msg_send_direct_resp_32_error)
+ {
+ 	const uint16_t source_id = 0x1122;
+ 	const uint16_t dest_id = 0x3344;
+@@ -631,13 +773,13 @@ TEST(ffa_api, ffa_msg_send_direct_resp_error)
+ 	setup_error_response(-1);
+ 	expect_ffa_svc(0x84000070, ((uint32_t)source_id << 16) | dest_id, 0,
+ 		       arg0, arg1, arg2, arg3, arg4, &svc_result);
+-	ffa_result result = ffa_msg_send_direct_resp(
++	ffa_result result = ffa_msg_send_direct_resp_32(
+ 		source_id, dest_id, arg0, arg1, arg2, arg3, arg4, &msg);
+ 	LONGS_EQUAL(-1, result);
+-	msg_equal(0, 0, 0, 0, 0, 0, 0, 0);
++	msg_equal_32(0, 0, 0, 0, 0, 0, 0, 0);
+ }
+ 
+-TEST(ffa_api, ffa_msg_send_direct_resp_then_get_direct_req_as_response)
++TEST(ffa_api, ffa_msg_send_direct_resp_32_then_get_direct_req_32_as_response)
+ {
+ 	const uint16_t source_id = 0x1122;
+ 	const uint16_t dest_id = 0x3344;
+@@ -663,14 +805,113 @@ TEST(ffa_api, ffa_msg_send_direct_resp_then_get_direct_req_as_response)
+ 	svc_result.a7 = resp_arg4;
+ 	expect_ffa_svc(0x84000070, ((uint32_t)source_id << 16) | dest_id, 0,
+ 		       arg0, arg1, arg2, arg3, arg4, &svc_result);
+-	ffa_result result = ffa_msg_send_direct_resp(
++	ffa_result result = ffa_msg_send_direct_resp_32(
++		source_id, dest_id, arg0, arg1, arg2, arg3, arg4, &msg);
++	LONGS_EQUAL(0, result);
++	msg_equal_32(0x8400006F, resp_source_id, resp_dest_id, resp_arg0,
++		   resp_arg1, resp_arg2, resp_arg3, resp_arg4);
++}
++
++TEST(ffa_api, ffa_msg_send_direct_resp_32_then_get_direct_req_64_as_response)
++{
++	const uint16_t source_id = 0x1122;
++	const uint16_t dest_id = 0x3344;
++	const uint32_t arg0 = 0x01234567ULL;
++	const uint32_t arg1 = 0x12345678ULL;
++	const uint32_t arg2 = 0x23456789ULL;
++	const uint32_t arg3 = 0x3456789aULL;
++	const uint32_t arg4 = 0x456789abULL;
++	const uint16_t resp_source_id = 0x1221;
++	const uint16_t resp_dest_id = 0x3443;
++	const uint64_t resp_arg0 = 0x9012345665432109ULL;
++	const uint64_t resp_arg1 = 0xa12345677654321aULL;
++	const uint64_t resp_arg2 = 0xb23456788765432bULL;
++	const uint64_t resp_arg3 = 0xc34567899876543cULL;
++	const uint64_t resp_arg4 = 0xd456789aa987654dULL;
++
++	svc_result.a0 = 0xC400006F;
++	svc_result.a1 = ((uint32_t)resp_source_id) << 16 | resp_dest_id;
++	svc_result.a3 = resp_arg0;
++	svc_result.a4 = resp_arg1;
++	svc_result.a5 = resp_arg2;
++	svc_result.a6 = resp_arg3;
++	svc_result.a7 = resp_arg4;
++	expect_ffa_svc(0x84000070, ((uint32_t)source_id << 16) | dest_id, 0,
++		       arg0, arg1, arg2, arg3, arg4, &svc_result);
++	ffa_result result = ffa_msg_send_direct_resp_32(
++		source_id, dest_id, arg0, arg1, arg2, arg3, arg4, &msg);
++	LONGS_EQUAL(0, result);
++	msg_equal_64(0xC400006F, resp_source_id, resp_dest_id, resp_arg0,
++		   resp_arg1, resp_arg2, resp_arg3, resp_arg4);
++}
++
++TEST(ffa_api, ffa_msg_send_direct_resp_64_then_get_direct_req_32_as_response)
++{
++	const uint16_t source_id = 0x1122;
++	const uint16_t dest_id = 0x3344;
++	const uint64_t arg0 = 0x9012345665432109ULL;
++	const uint64_t arg1 = 0xa12345677654321aULL;
++	const uint64_t arg2 = 0xb23456788765432bULL;
++	const uint64_t arg3 = 0xc34567899876543cULL;
++	const uint64_t arg4 = 0xd456789aa987654dULL;
++	const uint16_t resp_source_id = 0x1221;
++	const uint16_t resp_dest_id = 0x3443;
++	const uint32_t resp_arg0 = 0x01234567ULL;
++	const uint32_t resp_arg1 = 0x12345678ULL;
++	const uint32_t resp_arg2 = 0x23456789ULL;
++	const uint32_t resp_arg3 = 0x3456789aULL;
++	const uint32_t resp_arg4 = 0x456789abULL;
++
++	svc_result.a0 = 0x8400006F;
++	svc_result.a1 = ((uint32_t)resp_source_id) << 16 | resp_dest_id;
++	svc_result.a3 = resp_arg0;
++	svc_result.a4 = resp_arg1;
++	svc_result.a5 = resp_arg2;
++	svc_result.a6 = resp_arg3;
++	svc_result.a7 = resp_arg4;
++	expect_ffa_svc(0xC4000070, ((uint32_t)source_id << 16) | dest_id, 0,
++		       arg0, arg1, arg2, arg3, arg4, &svc_result);
++	ffa_result result = ffa_msg_send_direct_resp_64(
++		source_id, dest_id, arg0, arg1, arg2, arg3, arg4, &msg);
++	LONGS_EQUAL(0, result);
++	msg_equal_32(0x8400006F, resp_source_id, resp_dest_id, resp_arg0,
++		   resp_arg1, resp_arg2, resp_arg3, resp_arg4);
++}
++
++TEST(ffa_api, ffa_msg_send_direct_resp_64_then_get_direct_req_64_as_response)
++{
++	const uint16_t source_id = 0x1122;
++	const uint16_t dest_id = 0x3344;
++	const uint64_t arg0 = 0x0123456776543210ULL;
++	const uint64_t arg1 = 0x1234567887654321ULL;
++	const uint64_t arg2 = 0x2345678998765432ULL;
++	const uint64_t arg3 = 0x3456789aa9876543ULL;
++	const uint64_t arg4 = 0x456789abba987654ULL;
++	const uint16_t resp_source_id = 0x1221;
++	const uint16_t resp_dest_id = 0x3443;
++	const uint64_t resp_arg0 = 0x9012345665432109ULL;
++	const uint64_t resp_arg1 = 0xa12345677654321aULL;
++	const uint64_t resp_arg2 = 0xb23456788765432bULL;
++	const uint64_t resp_arg3 = 0xc34567899876543cULL;
++	const uint64_t resp_arg4 = 0xd456789aa987654dULL;
++
++	svc_result.a0 = 0xC400006F;
++	svc_result.a1 = ((uint32_t)resp_source_id) << 16 | resp_dest_id;
++	svc_result.a3 = resp_arg0;
++	svc_result.a4 = resp_arg1;
++	svc_result.a5 = resp_arg2;
++	svc_result.a6 = resp_arg3;
++	svc_result.a7 = resp_arg4;
++	expect_ffa_svc(0xC4000070, ((uint32_t)source_id << 16) | dest_id, 0,
++		       arg0, arg1, arg2, arg3, arg4, &svc_result);
++	ffa_result result = ffa_msg_send_direct_resp_64(
+ 		source_id, dest_id, arg0, arg1, arg2, arg3, arg4, &msg);
+ 	LONGS_EQUAL(0, result);
+-	msg_equal(0x8400006F, resp_source_id, resp_dest_id, resp_arg0,
++	msg_equal_64(0xC400006F, resp_source_id, resp_dest_id, resp_arg0,
+ 		   resp_arg1, resp_arg2, resp_arg3, resp_arg4);
+ }
+ 
+-TEST(ffa_api, ffa_msg_send_direct_resp_one_interrupt_success)
++TEST(ffa_api, ffa_msg_send_direct_resp_32_one_interrupt_success)
+ {
+ 	const uint16_t source_id = 0x1122;
+ 	const uint16_t dest_id = 0x3344;
+@@ -690,13 +931,13 @@ TEST(ffa_api, ffa_msg_send_direct_resp_one_interrupt_success)
+ 
+ 	svc_result.a0 = 0x84000061;
+ 	expect_ffa_svc(0x8400006B, 0, 0, 0, 0, 0, 0, 0, &svc_result);
+-	ffa_result result = ffa_msg_send_direct_resp(
++	ffa_result result = ffa_msg_send_direct_resp_32(
+ 		source_id, dest_id, arg0, arg1, arg2, arg3, arg4, &msg);
+ 	LONGS_EQUAL(0, result);
+-	msg_equal(0x84000061, 0, 0, 0, 0, 0, 0, 0);
++	msg_equal_32(0x84000061, 0, 0, 0, 0, 0, 0, 0);
+ }
+ 
+-TEST(ffa_api, ffa_msg_send_direct_resp_two_interrupt_success)
++TEST(ffa_api, ffa_msg_send_direct_resp_32_two_interrupt_success)
+ {
+ 	const uint16_t source_id = 0x1122;
+ 	const uint16_t dest_id = 0x3344;
+@@ -724,13 +965,13 @@ TEST(ffa_api, ffa_msg_send_direct_resp_two_interrupt_success)
+ 
+ 	svc_result.a0 = 0x84000061;
+ 	expect_ffa_svc(0x8400006B, 0, 0, 0, 0, 0, 0, 0, &svc_result);
+-	ffa_result result = ffa_msg_send_direct_resp(
++	ffa_result result = ffa_msg_send_direct_resp_32(
+ 		source_id, dest_id, arg0, arg1, arg2, arg3, arg4, &msg);
+ 	LONGS_EQUAL(0, result);
+-	msg_equal(0x84000061, 0, 0, 0, 0, 0, 0, 0);
++	msg_equal_32(0x84000061, 0, 0, 0, 0, 0, 0, 0);
+ }
+ 
+-TEST(ffa_api, ffa_msg_send_direct_resp_unknown_response)
++TEST(ffa_api, ffa_msg_send_direct_resp_32_unknown_response)
+ {
+ 	const uint16_t source_id = 0x1122;
+ 	const uint16_t dest_id = 0x3344;
+@@ -745,7 +986,7 @@ TEST(ffa_api, ffa_msg_send_direct_resp_unknown_response)
+ 	expect_ffa_svc(0x84000070, ((uint32_t)source_id << 16) | dest_id, 0,
+ 		       arg0, arg1, arg2, arg3, arg4, &svc_result);
+ 	if (SETUP_ASSERT_ENVIRONMENT(assert_env)) {
+-		ffa_msg_send_direct_resp(source_id, dest_id, arg0, arg1, arg2,
++		ffa_msg_send_direct_resp_32(source_id, dest_id, arg0, arg1, arg2,
+ 					 arg3, arg4, &msg);
+ 	}
+ }
+diff --git a/components/messaging/ffa/libsp/test/test_sp_messaging.cpp b/components/messaging/ffa/libsp/test/test_sp_messaging.cpp
+index 78bf8bf..786f66e 100644
+--- a/components/messaging/ffa/libsp/test/test_sp_messaging.cpp
++++ b/components/messaging/ffa/libsp/test/test_sp_messaging.cpp
+@@ -1,6 +1,6 @@
+ // SPDX-License-Identifier: BSD-3-Clause
+ /*
+- * Copyright (c) 2021, Arm Limited. All rights reserved.
++ * Copyright (c) 2021-2022, Arm Limited. All rights reserved.
+  */
+ 
+ #include <CppUTest/TestHarness.h>
+@@ -32,7 +32,7 @@ TEST_GROUP(sp_messaging)
+ 		mock().clear();
+ 	}
+ 
+-	void copy_sp_to_ffa_args(const uint32_t sp_args[], uint32_t ffa_args[])
++	void copy_sp_to_ffa_args_32(const uint32_t sp_args[], uint32_t ffa_args[])
+ 	{
+ 		int i = 0;
+ 
+@@ -41,7 +41,16 @@ TEST_GROUP(sp_messaging)
+ 		}
+ 	}
+ 
+-	void fill_ffa_msg(struct ffa_direct_msg * msg)
++	void copy_sp_to_ffa_args_64(const uint64_t sp_args[], uint64_t ffa_args[])
++	{
++		int i = 0;
++
++		for (i = 0; i < SP_MSG_ARG_COUNT; i++) {
++			ffa_args[i + SP_MSG_ARG_OFFSET] = sp_args[i];
++		}
++	}
++
++	void fill_ffa_msg_32(struct ffa_direct_msg * msg)
+ 	{
+ 		int i = 0;
+ 
+@@ -49,20 +58,47 @@ TEST_GROUP(sp_messaging)
+ 		msg->source_id = source_id;
+ 		msg->destination_id = dest_id;
+ 
+-		msg->args[0] = 0;
++		msg->args.args32[0] = 0;
+ 		for (i = 0; i < SP_MSG_ARG_COUNT; i++) {
+-			msg->args[i + SP_MSG_ARG_OFFSET] = args[i];
++			msg->args.args32[i + SP_MSG_ARG_OFFSET] = args32[i];
+ 		}
+ 	}
+ 
+-	void fill_sp_msg(struct sp_msg * msg)
++	void fill_ffa_msg_64(struct ffa_direct_msg * msg)
+ 	{
+ 		int i = 0;
+ 
++		msg->function_id = FFA_MSG_SEND_DIRECT_REQ_64;
+ 		msg->source_id = source_id;
+ 		msg->destination_id = dest_id;
++
++		msg->args.args64[0] = 0;
+ 		for (i = 0; i < SP_MSG_ARG_COUNT; i++) {
+-			msg->args[i] = args[i + SP_MSG_ARG_OFFSET];
++			msg->args.args64[i + SP_MSG_ARG_OFFSET] = args64[i];
++		}
++	}
++
++	void fill_sp_msg_32(struct sp_msg * msg)
++	{
++		int i = 0;
++
++		msg->source_id = source_id;
++		msg->destination_id = dest_id;
++		msg->is_64bit_message = false;
++		for (i = 0; i < SP_MSG_ARG_COUNT; i++) {
++			msg->args.args32[i] = args32[i + SP_MSG_ARG_OFFSET];
++		}
++	}
++
++	void fill_sp_msg_64(struct sp_msg * msg)
++	{
++		int i = 0;
++
++		msg->source_id = source_id;
++		msg->destination_id = dest_id;
++		msg->is_64bit_message = true;
++		for (i = 0; i < SP_MSG_ARG_COUNT; i++) {
++			msg->args.args64[i] = args64[i + SP_MSG_ARG_OFFSET];
+ 		}
+ 	}
+ 
+@@ -74,10 +110,19 @@ TEST_GROUP(sp_messaging)
+ 		UNSIGNED_LONGS_EQUAL(ffa_msg->source_id, sp_msg->source_id);
+ 		UNSIGNED_LONGS_EQUAL(ffa_msg->destination_id,
+ 				     sp_msg->destination_id);
+-		for (i = 0; i < SP_MSG_ARG_COUNT; i++) {
+-			UNSIGNED_LONGS_EQUAL(
+-				ffa_msg->args[i + SP_MSG_ARG_OFFSET],
+-				sp_msg->args[i]);
++		CHECK_EQUAL(FFA_IS_64_BIT_FUNC(ffa_msg->function_id), sp_msg->is_64bit_message);
++		if (sp_msg->is_64bit_message) {
++			for (i = 0; i < SP_MSG_ARG_COUNT; i++) {
++				UNSIGNED_LONGS_EQUAL(
++					ffa_msg->args.args64[i + SP_MSG_ARG_OFFSET],
++					sp_msg->args.args64[i]);
++			}
++		} else {
++			for (i = 0; i < SP_MSG_ARG_COUNT; i++) {
++				UNSIGNED_LONGS_EQUAL(
++					ffa_msg->args.args32[i + SP_MSG_ARG_OFFSET],
++					sp_msg->args.args32[i]);
++			}
+ 		}
+ 	}
+ 
+@@ -87,7 +132,7 @@ TEST_GROUP(sp_messaging)
+ 		struct ffa_direct_msg expected_ffa_req = { 0 };
+ 		struct sp_msg req = { 0 };
+ 
+-		fill_ffa_msg(&expected_ffa_req);
++		fill_ffa_msg_32(&expected_ffa_req);
+ 		expected_ffa_req.source_id = source_id;
+ 		expected_ffa_req.destination_id = dest_id;
+ 		expect_ffa_msg_wait(&expected_ffa_req, FFA_OK);
+@@ -103,8 +148,10 @@ TEST_GROUP(sp_messaging)
+ 
+ 	const uint16_t source_id = 0x1234;
+ 	const uint16_t dest_id = 0x5678;
+-	const uint32_t args[SP_MSG_ARG_COUNT] = { 0x01234567, 0x12345678,
+-						  0x23456789, 0x3456789a };
++	const uint32_t args32[SP_MSG_ARG_COUNT] = { 0x01234567, 0x12345678,
++						    0x23456789, 0x3456789a };
++	const uint64_t args64[SP_MSG_ARG_COUNT] = { 0x0123456776543210, 0x1234567887654321,
++						    0x2345678998765432, 0x3456789aa9876543 };
+ 	const sp_result result = -1;
+ 	const sp_msg empty_sp_msg = (const sp_msg){ 0 };
+ };
+@@ -126,7 +173,7 @@ TEST(sp_messaging, sp_msg_wait_ffa_error)
+ 
+ TEST(sp_messaging, sp_msg_wait)
+ {
+-	fill_ffa_msg(&ffa_msg);
++	fill_ffa_msg_32(&ffa_msg);
+ 	expect_ffa_msg_wait(&ffa_msg, FFA_OK);
+ 
+ 	LONGS_EQUAL(SP_RESULT_OK, sp_msg_wait(&req));
+@@ -139,12 +186,12 @@ TEST(sp_messaging, sp_msg_wait_deny_rc_failure)
+ 	struct ffa_direct_msg rc_msg = { 0 };
+ 	ffa_result result = FFA_ABORTED;
+ 
+-	fill_ffa_msg(&rc_msg);
+-	rc_msg.args[0] = ROUTING_EXT_RC_BIT;
++	fill_ffa_msg_32(&rc_msg);
++	rc_msg.args.args32[0] = ROUTING_EXT_RC_BIT;
+ 	expect_ffa_msg_wait(&rc_msg, FFA_OK);
+ 
+-	fill_ffa_msg(&ffa_msg);
+-	expect_ffa_msg_send_direct_resp(
++	fill_ffa_msg_32(&ffa_msg);
++	expect_ffa_msg_send_direct_resp_32(
+ 		rc_msg.destination_id, rc_msg.source_id,
+ 		ROUTING_EXT_RC_BIT | ROUTING_EXT_ERR_BIT,
+ 		SP_RESULT_FFA(FFA_DENIED), 0, 0, 0, &ffa_msg, result);
+@@ -157,12 +204,12 @@ TEST(sp_messaging, sp_msg_wait_deny_rc)
+ {
+ 	struct ffa_direct_msg rc_msg = { 0 };
+ 
+-	fill_ffa_msg(&rc_msg);
+-	rc_msg.args[0] = ROUTING_EXT_RC_BIT;
++	fill_ffa_msg_32(&rc_msg);
++	rc_msg.args.args32[0] = ROUTING_EXT_RC_BIT;
+ 	expect_ffa_msg_wait(&rc_msg, FFA_OK);
+ 
+-	fill_ffa_msg(&ffa_msg);
+-	expect_ffa_msg_send_direct_resp(
++	fill_ffa_msg_32(&ffa_msg);
++	expect_ffa_msg_send_direct_resp_32(
+ 		rc_msg.destination_id, rc_msg.source_id,
+ 		ROUTING_EXT_RC_BIT | ROUTING_EXT_ERR_BIT,
+ 		SP_RESULT_FFA(FFA_DENIED), 0, 0, 0, &ffa_msg, FFA_OK);
+@@ -191,10 +238,10 @@ TEST(sp_messaging, sp_msg_send_direct_req_ffa_error)
+ 	ffa_result result = FFA_ABORTED;
+ 	uint32_t expected_ffa_args[5] = { 0 };
+ 
+-	fill_sp_msg(&req);
++	fill_sp_msg_32(&req);
+ 	memset(&resp, 0x5a, sizeof(resp));
+-	copy_sp_to_ffa_args(req.args, expected_ffa_args);
+-	expect_ffa_msg_send_direct_req(
++	copy_sp_to_ffa_args_32(req.args.args32, expected_ffa_args);
++	expect_ffa_msg_send_direct_req_32(
+ 		req.source_id, req.destination_id, expected_ffa_args[0],
+ 		expected_ffa_args[1], expected_ffa_args[2],
+ 		expected_ffa_args[3], expected_ffa_args[4], &ffa_msg, result);
+@@ -203,14 +250,30 @@ TEST(sp_messaging, sp_msg_send_direct_req_ffa_error)
+ 	MEMCMP_EQUAL(&empty_sp_msg, &resp, sizeof(empty_sp_msg));
+ }
+ 
+-TEST(sp_messaging, sp_msg_send_direct_req_msg)
++TEST(sp_messaging, sp_msg_send_direct_req_msg_32)
+ {
+ 	uint32_t expected_ffa_args[5] = { 0 };
+ 
+-	fill_sp_msg(&req);
+-	fill_ffa_msg(&ffa_msg);
+-	copy_sp_to_ffa_args(req.args, expected_ffa_args);
+-	expect_ffa_msg_send_direct_req(
++	fill_sp_msg_32(&req);
++	fill_ffa_msg_32(&ffa_msg);
++	copy_sp_to_ffa_args_32(req.args.args32, expected_ffa_args);
++	expect_ffa_msg_send_direct_req_32(
++		req.source_id, req.destination_id, expected_ffa_args[0],
++		expected_ffa_args[1], expected_ffa_args[2],
++		expected_ffa_args[3], expected_ffa_args[4], &ffa_msg, FFA_OK);
++
++	LONGS_EQUAL(SP_RESULT_OK, sp_msg_send_direct_req(&req, &resp));
++	ffa_and_sp_msg_equal(&ffa_msg, &resp);
++}
++
++TEST(sp_messaging, sp_msg_send_direct_req_msg_64)
++{
++	uint64_t expected_ffa_args[5] = { 0 };
++
++	fill_sp_msg_64(&req);
++	fill_ffa_msg_64(&ffa_msg);
++	copy_sp_to_ffa_args_64(req.args.args64, expected_ffa_args);
++	expect_ffa_msg_send_direct_req_64(
+ 		req.source_id, req.destination_id, expected_ffa_args[0],
+ 		expected_ffa_args[1], expected_ffa_args[2],
+ 		expected_ffa_args[3], expected_ffa_args[4], &ffa_msg, FFA_OK);
+@@ -223,10 +286,10 @@ TEST(sp_messaging, sp_msg_send_direct_req_success)
+ {
+ 	uint32_t expected_ffa_args[5] = { 0 };
+ 
+-	fill_sp_msg(&req);
++	fill_sp_msg_32(&req);
+ 	ffa_msg.function_id = FFA_SUCCESS_32;
+-	copy_sp_to_ffa_args(req.args, expected_ffa_args);
+-	expect_ffa_msg_send_direct_req(
++	copy_sp_to_ffa_args_32(req.args.args32, expected_ffa_args);
++	expect_ffa_msg_send_direct_req_32(
+ 		req.source_id, req.destination_id, expected_ffa_args[0],
+ 		expected_ffa_args[1], expected_ffa_args[2],
+ 		expected_ffa_args[3], expected_ffa_args[4], &ffa_msg, FFA_OK);
+@@ -248,54 +311,54 @@ TEST(sp_messaging, sp_msg_send_direct_req_rc_forwarding_success)
+ 	sp_msg sp_req = { 0 };
+ 	sp_msg sp_resp = { 0 };
+ 
+-	fill_sp_msg(&sp_req);
++	fill_sp_msg_32(&sp_req);
+ 	sp_req.source_id = own_id;
+ 	sp_req.destination_id = rc_root_id;
+ 
+ 	req.function_id = FFA_MSG_SEND_DIRECT_REQ_32;
+ 	req.source_id = own_id;
+ 	req.destination_id = rc_root_id;
+-	copy_sp_to_ffa_args(sp_req.args, req.args);
++	copy_sp_to_ffa_args_32(sp_req.args.args32, req.args.args32);
+ 
+-	fill_ffa_msg(&rc_req);
++	fill_ffa_msg_32(&rc_req);
+ 	rc_req.function_id = FFA_MSG_SEND_DIRECT_RESP_32;
+ 	rc_req.source_id = rc_root_id;
+ 	rc_req.destination_id = own_id;
+-	rc_req.args[0] = ROUTING_EXT_RC_BIT;
++	rc_req.args.args32[0] = ROUTING_EXT_RC_BIT;
+ 
+-	fill_ffa_msg(&rc_resp);
++	fill_ffa_msg_32(&rc_resp);
+ 	rc_resp.function_id = FFA_MSG_SEND_DIRECT_REQ_32;
+ 	rc_resp.source_id = root_id;
+ 	rc_resp.destination_id = own_id;
+-	rc_resp.args[0] = ROUTING_EXT_RC_BIT;
++	rc_resp.args.args32[0] = ROUTING_EXT_RC_BIT;
+ 
+-	fill_sp_msg(&sp_resp);
++	fill_sp_msg_32(&sp_resp);
+ 	sp_resp.source_id = rc_root_id;
+ 	sp_resp.destination_id = own_id;
+ 
+ 	resp.function_id = FFA_MSG_SEND_DIRECT_RESP_32;
+ 	resp.source_id = rc_root_id;
+ 	resp.destination_id = own_id;
+-	copy_sp_to_ffa_args(sp_resp.args, resp.args);
++	copy_sp_to_ffa_args_32(sp_resp.args.args32, resp.args.args32);
+ 
+ 	/* Initial request to current SP to set own_id */
+ 	wait_and_receive_request(root_id, own_id);
+ 
+ 	/* Sending request and receiving RC request from RC root */
+-	expect_ffa_msg_send_direct_req(own_id, rc_root_id, 0, req.args[1],
+-				       req.args[2], req.args[3], req.args[4],
++	expect_ffa_msg_send_direct_req_32(own_id, rc_root_id, 0, req.args.args32[1],
++				       req.args.args32[2], req.args.args32[3], req.args.args32[4],
+ 				       &rc_req, FFA_OK);
+ 
+ 	/* Forwarding RC request to root and receiving RC response */
+-	expect_ffa_msg_send_direct_resp(own_id, root_id, rc_req.args[0],
+-					rc_req.args[1], rc_req.args[2],
+-					rc_req.args[3], rc_req.args[4],
++	expect_ffa_msg_send_direct_resp_32(own_id, root_id, rc_req.args.args32[0],
++					rc_req.args.args32[1], rc_req.args.args32[2],
++					rc_req.args.args32[3], rc_req.args.args32[4],
+ 					&rc_resp, FFA_OK);
+ 
+ 	/* Fowarding RC response to RC root and receiving response */
+-	expect_ffa_msg_send_direct_req(own_id, rc_root_id, rc_resp.args[0],
+-				       rc_resp.args[1], rc_resp.args[2],
+-				       rc_resp.args[3], rc_resp.args[4], &resp,
++	expect_ffa_msg_send_direct_req_32(own_id, rc_root_id, rc_resp.args.args32[0],
++				       rc_resp.args.args32[1], rc_resp.args.args32[2],
++				       rc_resp.args.args32[3], rc_resp.args.args32[4], &resp,
+ 				       FFA_OK);
+ 
+ 	LONGS_EQUAL(SP_RESULT_OK, sp_msg_send_direct_req(&sp_req, &sp_resp));
+@@ -312,28 +375,28 @@ TEST(sp_messaging, sp_msg_send_direct_req_rc_error)
+ 	sp_msg sp_req = { 0 };
+ 	sp_msg sp_resp = { 0 };
+ 
+-	fill_sp_msg(&sp_req);
++	fill_sp_msg_32(&sp_req);
+ 	sp_req.source_id = own_id;
+ 	sp_req.destination_id = rc_root_id;
+ 
+ 	req.function_id = FFA_MSG_SEND_DIRECT_REQ_32;
+ 	req.source_id = own_id;
+ 	req.destination_id = rc_root_id;
+-	copy_sp_to_ffa_args(sp_req.args, req.args);
++	copy_sp_to_ffa_args_32(sp_req.args.args32, req.args.args32);
+ 
+-	fill_ffa_msg(&rc_err);
++	fill_ffa_msg_32(&rc_err);
+ 	rc_err.function_id = FFA_MSG_SEND_DIRECT_RESP_32;
+ 	rc_err.source_id = rc_root_id;
+ 	rc_err.destination_id = own_id;
+-	rc_err.args[0] = ROUTING_EXT_RC_BIT | ROUTING_EXT_ERR_BIT;
+-	rc_err.args[1] = result;
++	rc_err.args.args32[0] = ROUTING_EXT_RC_BIT | ROUTING_EXT_ERR_BIT;
++	rc_err.args.args32[1] = result;
+ 
+ 	/* Initial request to current SP to set own_id */
+ 	wait_and_receive_request(root_id, own_id);
+ 
+ 	/* Sending request and receiving RC request from RC root */
+-	expect_ffa_msg_send_direct_req(own_id, rc_root_id, 0, req.args[1],
+-				       req.args[2], req.args[3], req.args[4],
++	expect_ffa_msg_send_direct_req_32(own_id, rc_root_id, 0, req.args.args32[1],
++				       req.args.args32[2], req.args.args32[3], req.args.args32[4],
+ 				       &rc_err, FFA_OK);
+ 
+ 	LONGS_EQUAL(SP_RESULT_FFA(result),
+@@ -354,64 +417,64 @@ TEST(sp_messaging, sp_msg_send_direct_req_rc_forwarding_success_deny_request)
+ 	sp_msg sp_req = { 0 };
+ 	sp_msg sp_resp = { 0 };
+ 
+-	fill_sp_msg(&sp_req);
++	fill_sp_msg_32(&sp_req);
+ 	sp_req.source_id = own_id;
+ 	sp_req.destination_id = rc_root_id;
+ 
+ 	req.function_id = FFA_MSG_SEND_DIRECT_REQ_32;
+ 	req.source_id = own_id;
+ 	req.destination_id = rc_root_id;
+-	copy_sp_to_ffa_args(sp_req.args, req.args);
++	copy_sp_to_ffa_args_32(sp_req.args.args32, req.args.args32);
+ 
+-	fill_ffa_msg(&rc_req);
++	fill_ffa_msg_32(&rc_req);
+ 	rc_req.function_id = FFA_MSG_SEND_DIRECT_RESP_32;
+ 	rc_req.source_id = rc_root_id;
+ 	rc_req.destination_id = own_id;
+-	rc_req.args[0] = ROUTING_EXT_RC_BIT;
++	rc_req.args.args32[0] = ROUTING_EXT_RC_BIT;
+ 
+ 	request_to_deny.function_id = FFA_MSG_SEND_DIRECT_REQ_32;
+ 	request_to_deny.source_id = root_id;
+ 	request_to_deny.destination_id = own_id;
+-	request_to_deny.args[0] = 0;
++	request_to_deny.args.args32[0] = 0;
+ 
+-	fill_ffa_msg(&rc_resp);
++	fill_ffa_msg_32(&rc_resp);
+ 	rc_resp.function_id = FFA_MSG_SEND_DIRECT_REQ_32;
+ 	rc_resp.source_id = root_id;
+ 	rc_resp.destination_id = own_id;
+-	rc_resp.args[0] = ROUTING_EXT_RC_BIT;
++	rc_resp.args.args32[0] = ROUTING_EXT_RC_BIT;
+ 
+-	fill_sp_msg(&sp_resp);
++	fill_sp_msg_32(&sp_resp);
+ 	sp_resp.source_id = rc_root_id;
+ 	sp_resp.destination_id = own_id;
+ 
+ 	resp.function_id = FFA_MSG_SEND_DIRECT_RESP_32;
+ 	resp.source_id = rc_root_id;
+ 	resp.destination_id = own_id;
+-	copy_sp_to_ffa_args(sp_resp.args, resp.args);
++	copy_sp_to_ffa_args_32(sp_resp.args.args32, resp.args.args32);
+ 
+ 	/* Initial request to current SP to set own_id */
+ 	wait_and_receive_request(root_id, own_id);
+ 
+ 	/* Sending request and receiving RC request from RC root */
+-	expect_ffa_msg_send_direct_req(own_id, rc_root_id, 0, req.args[1],
+-				       req.args[2], req.args[3], req.args[4],
++	expect_ffa_msg_send_direct_req_32(own_id, rc_root_id, 0, req.args.args32[1],
++				       req.args.args32[2], req.args.args32[3], req.args.args32[4],
+ 				       &rc_req, FFA_OK);
+ 
+ 	/* Forwarding RC request to root and receiving a request to deny */
+-	expect_ffa_msg_send_direct_resp(own_id, root_id, rc_req.args[0],
+-					rc_req.args[1], rc_req.args[2],
+-					rc_req.args[3], rc_req.args[4],
++	expect_ffa_msg_send_direct_resp_32(own_id, root_id, rc_req.args.args32[0],
++					rc_req.args.args32[1], rc_req.args.args32[2],
++					rc_req.args.args32[3], rc_req.args.args32[4],
+ 					&request_to_deny, FFA_OK);
+ 
+ 	/* Sending error to root and receiving RC response */
+-	expect_ffa_msg_send_direct_resp(
++	expect_ffa_msg_send_direct_resp_32(
+ 		own_id, root_id, ROUTING_EXT_RC_BIT | ROUTING_EXT_ERR_BIT,
+ 		SP_RESULT_FFA(FFA_BUSY), 0, 0, 0, &rc_resp, FFA_OK);
+ 
+ 	/* Fowarding RC response to RC root and receiving response */
+-	expect_ffa_msg_send_direct_req(own_id, rc_root_id, rc_resp.args[0],
+-				       rc_resp.args[1], rc_resp.args[2],
+-				       rc_resp.args[3], rc_resp.args[4], &resp,
++	expect_ffa_msg_send_direct_req_32(own_id, rc_root_id, rc_resp.args.args32[0],
++				       rc_resp.args.args32[1], rc_resp.args.args32[2],
++				       rc_resp.args.args32[3], rc_resp.args.args32[4], &resp,
+ 				       FFA_OK);
+ 
+ 	LONGS_EQUAL(SP_RESULT_OK, sp_msg_send_direct_req(&sp_req, &sp_resp));
+@@ -431,65 +494,65 @@ TEST(sp_messaging, sp_msg_send_direct_req_rc_forwarding_success_invalid_req_src)
+ 	sp_msg sp_req = { 0 };
+ 	sp_msg sp_resp = { 0 };
+ 
+-	fill_sp_msg(&sp_req);
++	fill_sp_msg_32(&sp_req);
+ 	sp_req.source_id = own_id;
+ 	sp_req.destination_id = rc_root_id;
+ 
+ 	req.function_id = FFA_MSG_SEND_DIRECT_REQ_32;
+ 	req.source_id = own_id;
+ 	req.destination_id = rc_root_id;
+-	copy_sp_to_ffa_args(sp_req.args, req.args);
++	copy_sp_to_ffa_args_32(sp_req.args.args32, req.args.args32);
+ 
+-	fill_ffa_msg(&rc_req);
++	fill_ffa_msg_32(&rc_req);
+ 	rc_req.function_id = FFA_MSG_SEND_DIRECT_RESP_32;
+ 	rc_req.source_id = rc_root_id;
+ 	rc_req.destination_id = own_id;
+-	rc_req.args[0] = ROUTING_EXT_RC_BIT;
++	rc_req.args.args32[0] = ROUTING_EXT_RC_BIT;
+ 
+ 	request_to_deny.function_id = FFA_MSG_SEND_DIRECT_REQ_32;
+ 	/* This source ID should be denied in the current state. */
+ 	request_to_deny.source_id = rc_root_id;
+ 	request_to_deny.destination_id = own_id;
+-	request_to_deny.args[0] = ROUTING_EXT_RC_BIT;
++	request_to_deny.args.args32[0] = ROUTING_EXT_RC_BIT;
+ 
+-	fill_ffa_msg(&rc_resp);
++	fill_ffa_msg_32(&rc_resp);
+ 	rc_resp.function_id = FFA_MSG_SEND_DIRECT_REQ_32;
+ 	rc_resp.source_id = root_id;
+ 	rc_resp.destination_id = own_id;
+-	rc_resp.args[0] = ROUTING_EXT_RC_BIT;
++	rc_resp.args.args32[0] = ROUTING_EXT_RC_BIT;
+ 
+-	fill_sp_msg(&sp_resp);
++	fill_sp_msg_32(&sp_resp);
+ 	sp_resp.source_id = rc_root_id;
+ 	sp_resp.destination_id = own_id;
+ 
+ 	resp.function_id = FFA_MSG_SEND_DIRECT_RESP_32;
+ 	resp.source_id = rc_root_id;
+ 	resp.destination_id = own_id;
+-	copy_sp_to_ffa_args(sp_resp.args, resp.args);
++	copy_sp_to_ffa_args_32(sp_resp.args.args32, resp.args.args32);
+ 
+ 	/* Initial request to current SP to set own_id */
+ 	wait_and_receive_request(root_id, own_id);
+ 
+ 	/* Sending request and receiving RC request from RC root */
+-	expect_ffa_msg_send_direct_req(own_id, rc_root_id, 0, req.args[1],
+-				       req.args[2], req.args[3], req.args[4],
++	expect_ffa_msg_send_direct_req_32(own_id, rc_root_id, 0, req.args.args32[1],
++				       req.args.args32[2], req.args.args32[3], req.args.args32[4],
+ 				       &rc_req, FFA_OK);
+ 
+ 	/* Forwarding RC request to root and receiving RC response */
+-	expect_ffa_msg_send_direct_resp(own_id, root_id, rc_req.args[0],
+-					rc_req.args[1], rc_req.args[2],
+-					rc_req.args[3], rc_req.args[4],
++	expect_ffa_msg_send_direct_resp_32(own_id, root_id, rc_req.args.args32[0],
++					rc_req.args.args32[1], rc_req.args.args32[2],
++					rc_req.args.args32[3], rc_req.args.args32[4],
+ 					&request_to_deny, FFA_OK);
+ 
+ 	/* Sending error to root and receiving RC response */
+-	expect_ffa_msg_send_direct_resp(
++	expect_ffa_msg_send_direct_resp_32(
+ 		own_id, rc_root_id, ROUTING_EXT_ERR_BIT | ROUTING_EXT_RC_BIT,
+ 		SP_RESULT_FFA(FFA_BUSY), 0, 0, 0, &rc_resp, FFA_OK);
+ 
+ 	/* Fowarding RC response to RC root and receiving response */
+-	expect_ffa_msg_send_direct_req(own_id, rc_root_id, rc_resp.args[0],
+-				       rc_resp.args[1], rc_resp.args[2],
+-				       rc_resp.args[3], rc_resp.args[4], &resp,
++	expect_ffa_msg_send_direct_req_32(own_id, rc_root_id, rc_resp.args.args32[0],
++				       rc_resp.args.args32[1], rc_resp.args.args32[2],
++				       rc_resp.args.args32[3], rc_resp.args.args32[4], &resp,
+ 				       FFA_OK);
+ 
+ 	LONGS_EQUAL(SP_RESULT_OK, sp_msg_send_direct_req(&sp_req, &sp_resp));
+@@ -509,58 +572,58 @@ TEST(sp_messaging, sp_msg_send_direct_req_deny_fail_wait_success)
+ 	sp_msg sp_req = { 0 };
+ 	sp_msg sp_resp = { 0 };
+ 
+-	fill_sp_msg(&sp_req);
++	fill_sp_msg_32(&sp_req);
+ 	sp_req.source_id = own_id;
+ 	sp_req.destination_id = rc_root_id;
+ 
+ 	req.function_id = FFA_MSG_SEND_DIRECT_REQ_32;
+ 	req.source_id = own_id;
+ 	req.destination_id = rc_root_id;
+-	copy_sp_to_ffa_args(sp_req.args, req.args);
++	copy_sp_to_ffa_args_32(sp_req.args.args32, req.args.args32);
+ 
+-	fill_ffa_msg(&rc_req);
++	fill_ffa_msg_32(&rc_req);
+ 	rc_req.function_id = FFA_MSG_SEND_DIRECT_RESP_32;
+ 	rc_req.source_id = rc_root_id;
+ 	rc_req.destination_id = own_id;
+-	rc_req.args[0] = ROUTING_EXT_RC_BIT;
++	rc_req.args.args32[0] = ROUTING_EXT_RC_BIT;
+ 
+ 	request_to_deny.function_id = FFA_MSG_SEND_DIRECT_REQ_32;
+ 	/* This source ID should be denied in the current state. */
+ 	request_to_deny.source_id = rc_root_id;
+ 	request_to_deny.destination_id = own_id;
+-	request_to_deny.args[0] = ROUTING_EXT_RC_BIT;
++	request_to_deny.args.args32[0] = ROUTING_EXT_RC_BIT;
+ 
+-	fill_ffa_msg(&rc_resp);
++	fill_ffa_msg_32(&rc_resp);
+ 	rc_resp.function_id = FFA_MSG_SEND_DIRECT_REQ_32;
+ 	rc_resp.source_id = root_id;
+ 	rc_resp.destination_id = own_id;
+-	rc_resp.args[0] = ROUTING_EXT_RC_BIT;
++	rc_resp.args.args32[0] = ROUTING_EXT_RC_BIT;
+ 
+-	fill_sp_msg(&sp_resp);
++	fill_sp_msg_32(&sp_resp);
+ 	sp_resp.source_id = rc_root_id;
+ 	sp_resp.destination_id = own_id;
+ 
+ 	resp.function_id = FFA_MSG_SEND_DIRECT_RESP_32;
+ 	resp.source_id = rc_root_id;
+ 	resp.destination_id = own_id;
+-	copy_sp_to_ffa_args(sp_resp.args, resp.args);
++	copy_sp_to_ffa_args_32(sp_resp.args.args32, resp.args.args32);
+ 
+ 	/* Initial request to current SP to set own_id */
+ 	wait_and_receive_request(root_id, own_id);
+ 
+ 	/* Sending request and receiving RC request from RC root */
+-	expect_ffa_msg_send_direct_req(own_id, rc_root_id, 0, req.args[1],
+-				       req.args[2], req.args[3], req.args[4],
++	expect_ffa_msg_send_direct_req_32(own_id, rc_root_id, 0, req.args.args32[1],
++				       req.args.args32[2], req.args.args32[3], req.args.args32[4],
+ 				       &rc_req, FFA_OK);
+ 
+ 	/* Forwarding RC request to root and receiving RC response */
+-	expect_ffa_msg_send_direct_resp(own_id, root_id, rc_req.args[0],
+-					rc_req.args[1], rc_req.args[2],
+-					rc_req.args[3], rc_req.args[4],
++	expect_ffa_msg_send_direct_resp_32(own_id, root_id, rc_req.args.args32[0],
++					rc_req.args.args32[1], rc_req.args.args32[2],
++					rc_req.args.args32[3], rc_req.args.args32[4],
+ 					&request_to_deny, FFA_OK);
+ 
+ 	/* Sending error to root which fails */
+-	expect_ffa_msg_send_direct_resp(
++	expect_ffa_msg_send_direct_resp_32(
+ 		own_id, rc_root_id, (ROUTING_EXT_ERR_BIT | ROUTING_EXT_RC_BIT),
+ 		SP_RESULT_FFA(FFA_BUSY), 0, 0, 0, &rc_resp, FFA_DENIED);
+ 
+@@ -568,9 +631,9 @@ TEST(sp_messaging, sp_msg_send_direct_req_deny_fail_wait_success)
+ 	expect_ffa_msg_wait(&rc_resp, FFA_OK);
+ 
+ 	/* Fowarding RC response to RC root and receiving response */
+-	expect_ffa_msg_send_direct_req(own_id, rc_root_id, rc_resp.args[0],
+-				       rc_resp.args[1], rc_resp.args[2],
+-				       rc_resp.args[3], rc_resp.args[4], &resp,
++	expect_ffa_msg_send_direct_req_32(own_id, rc_root_id, rc_resp.args.args32[0],
++				       rc_resp.args.args32[1], rc_resp.args.args32[2],
++				       rc_resp.args.args32[3], rc_resp.args.args32[4], &resp,
+ 				       FFA_OK);
+ 
+ 	LONGS_EQUAL(SP_RESULT_OK, sp_msg_send_direct_req(&sp_req, &sp_resp));
+@@ -590,58 +653,58 @@ TEST(sp_messaging, sp_msg_send_direct_req_deny_fail_wait_fail_forwarding)
+ 	sp_msg sp_req = { 0 };
+ 	sp_msg sp_resp = { 0 };
+ 
+-	fill_sp_msg(&sp_req);
++	fill_sp_msg_32(&sp_req);
+ 	sp_req.source_id = own_id;
+ 	sp_req.destination_id = rc_root_id;
+ 
+ 	req.function_id = FFA_MSG_SEND_DIRECT_REQ_32;
+ 	req.source_id = own_id;
+ 	req.destination_id = rc_root_id;
+-	copy_sp_to_ffa_args(sp_req.args, req.args);
++	copy_sp_to_ffa_args_32(sp_req.args.args32, req.args.args32);
+ 
+-	fill_ffa_msg(&rc_req);
++	fill_ffa_msg_32(&rc_req);
+ 	rc_req.function_id = FFA_MSG_SEND_DIRECT_RESP_32;
+ 	rc_req.source_id = rc_root_id;
+ 	rc_req.destination_id = own_id;
+-	rc_req.args[0] = ROUTING_EXT_RC_BIT;
++	rc_req.args.args32[0] = ROUTING_EXT_RC_BIT;
+ 
+ 	request_to_deny.function_id = FFA_MSG_SEND_DIRECT_REQ_32;
+ 	/* This source ID should be denied in the current state. */
+ 	request_to_deny.source_id = rc_root_id;
+ 	request_to_deny.destination_id = own_id;
+-	request_to_deny.args[0] = ROUTING_EXT_RC_BIT;
++	request_to_deny.args.args32[0] = ROUTING_EXT_RC_BIT;
+ 
+-	fill_ffa_msg(&rc_resp);
++	fill_ffa_msg_32(&rc_resp);
+ 	rc_resp.function_id = FFA_MSG_SEND_DIRECT_REQ_32;
+ 	rc_resp.source_id = root_id;
+ 	rc_resp.destination_id = own_id;
+-	rc_resp.args[0] = ROUTING_EXT_RC_BIT;
++	rc_resp.args.args32[0] = ROUTING_EXT_RC_BIT;
+ 
+-	fill_sp_msg(&sp_resp);
++	fill_sp_msg_32(&sp_resp);
+ 	sp_resp.source_id = rc_root_id;
+ 	sp_resp.destination_id = own_id;
+ 
+ 	resp.function_id = FFA_MSG_SEND_DIRECT_RESP_32;
+ 	resp.source_id = rc_root_id;
+ 	resp.destination_id = own_id;
+-	copy_sp_to_ffa_args(sp_resp.args, resp.args);
++	copy_sp_to_ffa_args_32(sp_resp.args.args32, resp.args.args32);
+ 
+ 	/* Initial request to current SP to set own_id */
+ 	wait_and_receive_request(root_id, own_id);
+ 
+ 	/* Sending request and receiving RC request from RC root */
+-	expect_ffa_msg_send_direct_req(own_id, rc_root_id, 0, req.args[1],
+-				       req.args[2], req.args[3], req.args[4],
++	expect_ffa_msg_send_direct_req_32(own_id, rc_root_id, 0, req.args.args32[1],
++				       req.args.args32[2], req.args.args32[3], req.args.args32[4],
+ 				       &rc_req, FFA_OK);
+ 
+ 	/* Forwarding RC request to root and receiving RC response */
+-	expect_ffa_msg_send_direct_resp(own_id, root_id, rc_req.args[0],
+-					rc_req.args[1], rc_req.args[2],
+-					rc_req.args[3], rc_req.args[4],
++	expect_ffa_msg_send_direct_resp_32(own_id, root_id, rc_req.args.args32[0],
++					rc_req.args.args32[1], rc_req.args.args32[2],
++					rc_req.args.args32[3], rc_req.args.args32[4],
+ 					&request_to_deny, FFA_OK);
+ 
+ 	/* Sending error to root which fails */
+-	expect_ffa_msg_send_direct_resp(
++	expect_ffa_msg_send_direct_resp_32(
+ 		own_id, rc_root_id, ROUTING_EXT_ERR_BIT | ROUTING_EXT_RC_BIT,
+ 		SP_RESULT_FFA(FFA_BUSY), 0, 0, 0, &rc_resp, FFA_DENIED);
+ 
+@@ -649,7 +712,7 @@ TEST(sp_messaging, sp_msg_send_direct_req_deny_fail_wait_fail_forwarding)
+ 	expect_ffa_msg_wait(&rc_resp, result);
+ 
+ 	/* Fowarding RC error as FFA_MSG_WAIT failed  */
+-	expect_ffa_msg_send_direct_req(
++	expect_ffa_msg_send_direct_req_32(
+ 		own_id, rc_root_id, (ROUTING_EXT_RC_BIT | ROUTING_EXT_ERR_BIT),
+ 		result, 0, 0, 0, &resp, FFA_OK);
+ 
+@@ -670,52 +733,52 @@ TEST(sp_messaging, sp_msg_send_direct_req_rc_return_rc_error_msg)
+ 	sp_msg sp_resp = { 0 };
+ 	ffa_result result = FFA_ABORTED;
+ 
+-	fill_sp_msg(&sp_req);
++	fill_sp_msg_32(&sp_req);
+ 	sp_req.source_id = own_id;
+ 	sp_req.destination_id = rc_root_id;
+ 
+ 	req.function_id = FFA_MSG_SEND_DIRECT_REQ_32;
+ 	req.source_id = own_id;
+ 	req.destination_id = rc_root_id;
+-	copy_sp_to_ffa_args(sp_req.args, req.args);
++	copy_sp_to_ffa_args_32(sp_req.args.args32, req.args.args32);
+ 
+-	fill_ffa_msg(&rc_req);
++	fill_ffa_msg_32(&rc_req);
+ 	rc_req.function_id = FFA_MSG_SEND_DIRECT_RESP_32;
+ 	rc_req.source_id = rc_root_id;
+ 	rc_req.destination_id = own_id;
+-	rc_req.args[0] = ROUTING_EXT_RC_BIT;
++	rc_req.args.args32[0] = ROUTING_EXT_RC_BIT;
+ 
+-	fill_ffa_msg(&rc_resp);
++	fill_ffa_msg_32(&rc_resp);
+ 	rc_resp.function_id = FFA_MSG_SEND_DIRECT_REQ_32;
+ 	rc_resp.source_id = root_id;
+ 	rc_resp.destination_id = own_id;
+-	rc_resp.args[0] = ROUTING_EXT_RC_BIT;
++	rc_resp.args.args32[0] = ROUTING_EXT_RC_BIT;
+ 
+-	fill_sp_msg(&sp_resp);
++	fill_sp_msg_32(&sp_resp);
+ 	sp_resp.source_id = rc_root_id;
+ 	sp_resp.destination_id = own_id;
+ 
+ 	resp.function_id = FFA_MSG_SEND_DIRECT_RESP_32;
+ 	resp.source_id = rc_root_id;
+ 	resp.destination_id = own_id;
+-	copy_sp_to_ffa_args(sp_resp.args, resp.args);
++	copy_sp_to_ffa_args_32(sp_resp.args.args32, resp.args.args32);
+ 
+ 	/* Initial request to current SP to set own_id */
+ 	wait_and_receive_request(root_id, own_id);
+ 
+ 	/* Sending request and receiving RC request from RC root */
+-	expect_ffa_msg_send_direct_req(own_id, rc_root_id, 0, req.args[1],
+-				       req.args[2], req.args[3], req.args[4],
++	expect_ffa_msg_send_direct_req_32(own_id, rc_root_id, 0, req.args.args32[1],
++				       req.args.args32[2], req.args.args32[3], req.args.args32[4],
+ 				       &rc_req, FFA_OK);
+ 
+ 	/* Forwarding RC request to root and receiving RC response */
+-	expect_ffa_msg_send_direct_resp(own_id, root_id, rc_req.args[0],
+-					rc_req.args[1], rc_req.args[2],
+-					rc_req.args[3], rc_req.args[4],
++	expect_ffa_msg_send_direct_resp_32(own_id, root_id, rc_req.args.args32[0],
++					rc_req.args.args32[1], rc_req.args.args32[2],
++					rc_req.args.args32[3], rc_req.args.args32[4],
+ 					&rc_resp, result);
+ 
+ 	/* Fowarding RC error to RC root and receiving response */
+-	expect_ffa_msg_send_direct_req(own_id, rc_root_id,
++	expect_ffa_msg_send_direct_req_32(own_id, rc_root_id,
+ 				       ROUTING_EXT_RC_BIT | ROUTING_EXT_ERR_BIT,
+ 				       SP_RESULT_FFA(result), 0, 0, 0, &resp,
+ 				       FFA_OK);
+@@ -737,54 +800,54 @@ TEST(sp_messaging, sp_msg_send_direct_req_rc_return_resp_fail)
+ 	sp_msg sp_resp = { 0 };
+ 	ffa_result result = FFA_ABORTED;
+ 
+-	fill_sp_msg(&sp_req);
++	fill_sp_msg_32(&sp_req);
+ 	sp_req.source_id = own_id;
+ 	sp_req.destination_id = rc_root_id;
+ 
+ 	req.function_id = FFA_MSG_SEND_DIRECT_REQ_32;
+ 	req.source_id = own_id;
+ 	req.destination_id = rc_root_id;
+-	copy_sp_to_ffa_args(sp_req.args, req.args);
++	copy_sp_to_ffa_args_32(sp_req.args.args32, req.args.args32);
+ 
+-	fill_ffa_msg(&rc_req);
++	fill_ffa_msg_32(&rc_req);
+ 	rc_req.function_id = FFA_MSG_SEND_DIRECT_RESP_32;
+ 	rc_req.source_id = rc_root_id;
+ 	rc_req.destination_id = own_id;
+-	rc_req.args[0] = ROUTING_EXT_RC_BIT;
++	rc_req.args.args32[0] = ROUTING_EXT_RC_BIT;
+ 
+-	fill_ffa_msg(&rc_resp);
++	fill_ffa_msg_32(&rc_resp);
+ 	rc_resp.function_id = FFA_MSG_SEND_DIRECT_REQ_32;
+ 	rc_resp.source_id = root_id;
+ 	rc_resp.destination_id = own_id;
+-	rc_resp.args[0] = ROUTING_EXT_RC_BIT;
++	rc_resp.args.args32[0] = ROUTING_EXT_RC_BIT;
+ 
+-	fill_sp_msg(&sp_resp);
++	fill_sp_msg_32(&sp_resp);
+ 	sp_resp.source_id = rc_root_id;
+ 	sp_resp.destination_id = own_id;
+ 
+ 	resp.function_id = FFA_MSG_SEND_DIRECT_RESP_32;
+ 	resp.source_id = rc_root_id;
+ 	resp.destination_id = own_id;
+-	copy_sp_to_ffa_args(sp_resp.args, resp.args);
++	copy_sp_to_ffa_args_32(sp_resp.args.args32, resp.args.args32);
+ 
+ 	/* Initial request to current SP to set own_id */
+ 	wait_and_receive_request(root_id, own_id);
+ 
+ 	/* Sending request and receiving RC request from RC root */
+-	expect_ffa_msg_send_direct_req(own_id, rc_root_id, 0, req.args[1],
+-				       req.args[2], req.args[3], req.args[4],
++	expect_ffa_msg_send_direct_req_32(own_id, rc_root_id, 0, req.args.args32[1],
++				       req.args.args32[2], req.args.args32[3], req.args.args32[4],
+ 				       &rc_req, FFA_OK);
+ 
+ 	/* Forwarding RC request to root and receiving RC response */
+-	expect_ffa_msg_send_direct_resp(own_id, root_id, rc_req.args[0],
+-					rc_req.args[1], rc_req.args[2],
+-					rc_req.args[3], rc_req.args[4],
++	expect_ffa_msg_send_direct_resp_32(own_id, root_id, rc_req.args.args32[0],
++					rc_req.args.args32[1], rc_req.args.args32[2],
++					rc_req.args.args32[3], rc_req.args.args32[4],
+ 					&rc_resp, FFA_OK);
+ 
+ 	/* Fowarding RC response to RC root and receiving response */
+-	expect_ffa_msg_send_direct_req(own_id, rc_root_id, rc_resp.args[0],
+-				       rc_resp.args[1], rc_resp.args[2],
+-				       rc_resp.args[3], rc_resp.args[4], &resp,
++	expect_ffa_msg_send_direct_req_32(own_id, rc_root_id, rc_resp.args.args32[0],
++				       rc_resp.args.args32[1], rc_resp.args.args32[2],
++				       rc_resp.args.args32[3], rc_resp.args.args32[4], &resp,
+ 				       result);
+ 
+ 	LONGS_EQUAL(SP_RESULT_FFA(result),
+@@ -812,10 +875,11 @@ TEST(sp_messaging, sp_msg_send_direct_resp_ffa_error)
+ 	ffa_result result = FFA_ABORTED;
+ 	uint32_t expected_ffa_args[5] = { 0 };
+ 
+-	fill_sp_msg(&resp);
++	fill_sp_msg_32(&resp);
+ 	memset(&req, 0x5a, sizeof(req));
+-	copy_sp_to_ffa_args(resp.args, expected_ffa_args);
+-	expect_ffa_msg_send_direct_resp(
++	req.is_64bit_message = false;
++	copy_sp_to_ffa_args_32(resp.args.args32, expected_ffa_args);
++	expect_ffa_msg_send_direct_resp_32(
+ 		resp.source_id, resp.destination_id, expected_ffa_args[0],
+ 		expected_ffa_args[1], expected_ffa_args[2],
+ 		expected_ffa_args[3], expected_ffa_args[4], &ffa_msg, result);
+@@ -825,14 +889,30 @@ TEST(sp_messaging, sp_msg_send_direct_resp_ffa_error)
+ 	MEMCMP_EQUAL(&empty_sp_msg, &req, sizeof(empty_sp_msg));
+ }
+ 
+-TEST(sp_messaging, sp_msg_send_direct_resp_msg)
++TEST(sp_messaging, sp_msg_send_direct_resp_msg_32)
+ {
+ 	uint32_t expected_ffa_args[5] = { 0 };
+ 
+-	fill_sp_msg(&resp);
+-	fill_ffa_msg(&ffa_msg);
+-	copy_sp_to_ffa_args(resp.args, expected_ffa_args);
+-	expect_ffa_msg_send_direct_resp(
++	fill_sp_msg_32(&resp);
++	fill_ffa_msg_32(&ffa_msg);
++	copy_sp_to_ffa_args_32(resp.args.args32, expected_ffa_args);
++	expect_ffa_msg_send_direct_resp_32(
++		resp.source_id, resp.destination_id, expected_ffa_args[0],
++		expected_ffa_args[1], expected_ffa_args[2],
++		expected_ffa_args[3], expected_ffa_args[4], &ffa_msg, FFA_OK);
++
++	LONGS_EQUAL(SP_RESULT_OK, sp_msg_send_direct_resp(&resp, &req));
++	ffa_and_sp_msg_equal(&ffa_msg, &req);
++}
++
++TEST(sp_messaging, sp_msg_send_direct_resp_msg_64)
++{
++	uint64_t expected_ffa_args[5] = { 0 };
++
++	fill_sp_msg_64(&resp);
++	fill_ffa_msg_64(&ffa_msg);
++	copy_sp_to_ffa_args_64(resp.args.args64, expected_ffa_args);
++	expect_ffa_msg_send_direct_resp_64(
+ 		resp.source_id, resp.destination_id, expected_ffa_args[0],
+ 		expected_ffa_args[1], expected_ffa_args[2],
+ 		expected_ffa_args[3], expected_ffa_args[4], &ffa_msg, FFA_OK);
+@@ -841,15 +921,16 @@ TEST(sp_messaging, sp_msg_send_direct_resp_msg)
+ 	ffa_and_sp_msg_equal(&ffa_msg, &req);
+ }
+ 
++
+ TEST(sp_messaging, sp_msg_send_direct_resp_success)
+ {
+ 	uint32_t expected_ffa_args[5] = { 0 };
+ 
+-	fill_sp_msg(&req);
+-	fill_sp_msg(&resp);
++	fill_sp_msg_32(&req);
++	fill_sp_msg_32(&resp);
+ 	ffa_msg.function_id = FFA_SUCCESS_32;
+-	copy_sp_to_ffa_args(resp.args, expected_ffa_args);
+-	expect_ffa_msg_send_direct_resp(
++	copy_sp_to_ffa_args_32(resp.args.args32, expected_ffa_args);
++	expect_ffa_msg_send_direct_resp_32(
+ 		resp.source_id, resp.destination_id, expected_ffa_args[0],
+ 		expected_ffa_args[1], expected_ffa_args[2],
+ 		expected_ffa_args[3], expected_ffa_args[4], &ffa_msg, FFA_OK);
+@@ -864,20 +945,20 @@ TEST(sp_messaging, sp_msg_send_direct_resp_deny_rc_failure)
+ 	uint32_t expected_ffa_args[5] = { 0 };
+ 	struct ffa_direct_msg rc_msg = { 0 };
+ 
+-	fill_sp_msg(&resp);
++	fill_sp_msg_32(&resp);
+ 
+-	fill_ffa_msg(&rc_msg);
+-	rc_msg.args[0] = ROUTING_EXT_RC_BIT;
++	fill_ffa_msg_32(&rc_msg);
++	rc_msg.args.args32[0] = ROUTING_EXT_RC_BIT;
+ 
+-	fill_ffa_msg(&ffa_msg);
+-	copy_sp_to_ffa_args(resp.args, expected_ffa_args);
++	fill_ffa_msg_32(&ffa_msg);
++	copy_sp_to_ffa_args_32(resp.args.args32, expected_ffa_args);
+ 
+-	expect_ffa_msg_send_direct_resp(
++	expect_ffa_msg_send_direct_resp_32(
+ 		resp.source_id, resp.destination_id, expected_ffa_args[0],
+ 		expected_ffa_args[1], expected_ffa_args[2],
+ 		expected_ffa_args[3], expected_ffa_args[4], &rc_msg, FFA_OK);
+ 
+-	expect_ffa_msg_send_direct_resp(
++	expect_ffa_msg_send_direct_resp_32(
+ 		rc_msg.destination_id, rc_msg.source_id,
+ 		ROUTING_EXT_RC_BIT | ROUTING_EXT_ERR_BIT,
+ 		SP_RESULT_FFA(FFA_DENIED), 0, 0, 0, &ffa_msg, result);
+@@ -892,21 +973,21 @@ TEST(sp_messaging, sp_msg_send_direct_resp_deny_rc)
+ 	uint32_t expected_ffa_args[5] = { 0 };
+ 	struct ffa_direct_msg rc_msg = { 0 };
+ 
+-	fill_sp_msg(&resp);
++	fill_sp_msg_32(&resp);
+ 
+-	fill_ffa_msg(&rc_msg);
+-	rc_msg.args[0] = ROUTING_EXT_RC_BIT;
++	fill_ffa_msg_32(&rc_msg);
++	rc_msg.args.args32[0] = ROUTING_EXT_RC_BIT;
+ 
+-	fill_ffa_msg(&ffa_msg);
+-	copy_sp_to_ffa_args(resp.args, expected_ffa_args);
++	fill_ffa_msg_32(&ffa_msg);
++	copy_sp_to_ffa_args_32(resp.args.args32, expected_ffa_args);
+ 
+-	expect_ffa_msg_send_direct_resp(resp.source_id, resp.destination_id, 0,
++	expect_ffa_msg_send_direct_resp_32(resp.source_id, resp.destination_id, 0,
+ 					expected_ffa_args[1],
+ 					expected_ffa_args[2],
+ 					expected_ffa_args[3],
+ 					expected_ffa_args[4], &rc_msg, FFA_OK);
+ 
+-	expect_ffa_msg_send_direct_resp(
++	expect_ffa_msg_send_direct_resp_32(
+ 		rc_msg.destination_id, rc_msg.source_id,
+ 		ROUTING_EXT_RC_BIT | ROUTING_EXT_ERR_BIT,
+ 		SP_RESULT_FFA(FFA_DENIED), 0, 0, 0, &ffa_msg, FFA_OK);
+@@ -933,13 +1014,14 @@ TEST(sp_messaging, sp_msg_send_rc_req_ffa_error)
+ {
+ 	ffa_result result = FFA_ABORTED;
+ 
+-	fill_sp_msg(&resp);
++	fill_sp_msg_32(&resp);
+ 	memset(&req, 0x5a, sizeof(req));
+-	fill_ffa_msg(&ffa_msg);
++	req.is_64bit_message = false;
++	fill_ffa_msg_32(&ffa_msg);
+ 
+-	expect_ffa_msg_send_direct_resp(req.source_id, req.destination_id,
+-					ROUTING_EXT_RC_BIT, req.args[0],
+-					req.args[1], req.args[2], req.args[3],
++	expect_ffa_msg_send_direct_resp_32(req.source_id, req.destination_id,
++					ROUTING_EXT_RC_BIT, req.args.args32[0],
++					req.args.args32[1], req.args.args32[2], req.args.args32[3],
+ 					&ffa_msg, result);
+ 
+ 	LONGS_EQUAL(SP_RESULT_FFA(result), sp_msg_send_rc_req(&req, &resp));
+@@ -953,22 +1035,22 @@ TEST(sp_messaging, sp_msg_send_rc_req_deny_fail_wait_fail)
+ 
+ 	wait_and_receive_request(root_id, own_id);
+ 
+-	fill_sp_msg(&req);
++	fill_sp_msg_32(&req);
+ 	req.source_id = own_id;
+ 	req.destination_id = root_id;
+ 
+-	fill_ffa_msg(&ffa_msg);
++	fill_ffa_msg_32(&ffa_msg);
+ 	ffa_msg.source_id = root_id;
+ 	ffa_msg.destination_id = own_id;
+ 	/* Should be RC message so it will be denied */
+-	ffa_msg.args[0] = 0;
++	ffa_msg.args.args32[0] = 0;
+ 
+-	expect_ffa_msg_send_direct_resp(req.source_id, req.destination_id,
+-					ROUTING_EXT_RC_BIT, req.args[0],
+-					req.args[1], req.args[2], req.args[3],
++	expect_ffa_msg_send_direct_resp_32(req.source_id, req.destination_id,
++					ROUTING_EXT_RC_BIT, req.args.args32[0],
++					req.args.args32[1], req.args.args32[2], req.args.args32[3],
+ 					&ffa_msg, FFA_OK);
+ 
+-	expect_ffa_msg_send_direct_resp(
++	expect_ffa_msg_send_direct_resp_32(
+ 		req.source_id, req.destination_id,
+ 		ROUTING_EXT_RC_BIT | ROUTING_EXT_ERR_BIT,
+ 		SP_RESULT_FFA(FFA_BUSY), 0, 0, 0, &ffa_msg, result);
+@@ -987,19 +1069,19 @@ TEST(sp_messaging, sp_msg_send_rc_req_rc_error)
+ 
+ 	wait_and_receive_request(root_id, own_id);
+ 
+-	fill_sp_msg(&req);
++	fill_sp_msg_32(&req);
+ 	req.source_id = own_id;
+ 	req.destination_id = root_id;
+ 
+-	fill_ffa_msg(&ffa_msg);
++	fill_ffa_msg_32(&ffa_msg);
+ 	ffa_msg.source_id = root_id;
+ 	ffa_msg.destination_id = own_id;
+-	ffa_msg.args[0] = ROUTING_EXT_RC_BIT | ROUTING_EXT_ERR_BIT;
+-	ffa_msg.args[1] = sp_err;
++	ffa_msg.args.args32[0] = ROUTING_EXT_RC_BIT | ROUTING_EXT_ERR_BIT;
++	ffa_msg.args.args32[1] = sp_err;
+ 
+-	expect_ffa_msg_send_direct_resp(req.source_id, req.destination_id,
+-					ROUTING_EXT_RC_BIT, req.args[0],
+-					req.args[1], req.args[2], req.args[3],
++	expect_ffa_msg_send_direct_resp_32(req.source_id, req.destination_id,
++					ROUTING_EXT_RC_BIT, req.args.args32[0],
++					req.args.args32[1], req.args.args32[2], req.args.args32[3],
+ 					&ffa_msg, FFA_OK);
+ 
+ 	LONGS_EQUAL(sp_err, sp_msg_send_rc_req(&req, &resp));
+@@ -1013,18 +1095,18 @@ TEST(sp_messaging, sp_msg_send_rc_req_success)
+ 
+ 	wait_and_receive_request(root_id, own_id);
+ 
+-	fill_sp_msg(&req);
++	fill_sp_msg_32(&req);
+ 	req.source_id = own_id;
+ 	req.destination_id = root_id;
+ 
+-	fill_ffa_msg(&ffa_msg);
++	fill_ffa_msg_32(&ffa_msg);
+ 	ffa_msg.source_id = root_id;
+ 	ffa_msg.destination_id = own_id;
+-	ffa_msg.args[0] = ROUTING_EXT_RC_BIT;
++	ffa_msg.args.args32[0] = ROUTING_EXT_RC_BIT;
+ 
+-	expect_ffa_msg_send_direct_resp(req.source_id, req.destination_id,
+-					ROUTING_EXT_RC_BIT, req.args[0],
+-					req.args[1], req.args[2], req.args[3],
++	expect_ffa_msg_send_direct_resp_32(req.source_id, req.destination_id,
++					ROUTING_EXT_RC_BIT, req.args.args32[0],
++					req.args.args32[1], req.args.args32[2], req.args.args32[3],
+ 					&ffa_msg, FFA_OK);
+ 
+ 	LONGS_EQUAL(SP_RESULT_OK, sp_msg_send_rc_req(&req, &resp));
+diff --git a/components/rpc/ffarpc/caller/sp/ffarpc_caller.c b/components/rpc/ffarpc/caller/sp/ffarpc_caller.c
+index 4ad98fb..ca3d318 100644
+--- a/components/rpc/ffarpc/caller/sp/ffarpc_caller.c
++++ b/components/rpc/ffarpc/caller/sp/ffarpc_caller.c
+@@ -81,16 +81,17 @@ static rpc_status_t call_invoke(void *context, rpc_call_handle handle, uint32_t
+ 
+ 	req.destination_id = this_context->dest_partition_id;
+ 	req.source_id = own_id;
+-	req.args[SP_CALL_ARGS_IFACE_ID_OPCODE] =
++	req.is_64bit_message = false;
++	req.args.args32[SP_CALL_ARGS_IFACE_ID_OPCODE] =
+ 		FFA_CALL_ARGS_COMBINE_IFACE_ID_OPCODE(this_context->dest_iface_id, opcode);
+-	req.args[SP_CALL_ARGS_REQ_DATA_LEN] = (uint32_t)this_context->req_len;
+-	req.args[SP_CALL_ARGS_ENCODING] = this_context->rpc_caller.encoding;
++	req.args.args32[SP_CALL_ARGS_REQ_DATA_LEN] = (uint32_t)this_context->req_len;
++	req.args.args32[SP_CALL_ARGS_ENCODING] = this_context->rpc_caller.encoding;
+ 
+ 	/* Initialise the caller ID.  Depending on the call path, this may
+ 	 * be overridden by a higher privilege execution level, based on its
+ 	 * perspective of the caller identity.
+ 	 */
+-	req.args[SP_CALL_ARGS_CALLER_ID] = 0;
++	req.args.args32[SP_CALL_ARGS_CALLER_ID] = 0;
+ 
+ 	sp_res = sp_msg_send_direct_req(&req, &resp);
+ 	if (sp_res != SP_RESULT_OK) {
+@@ -98,9 +99,9 @@ static rpc_status_t call_invoke(void *context, rpc_call_handle handle, uint32_t
+ 		goto out;
+ 	}
+ 
+-	this_context->resp_len = (size_t)resp.args[SP_CALL_ARGS_RESP_DATA_LEN];
+-	status = resp.args[SP_CALL_ARGS_RESP_RPC_STATUS];
+-	*opstatus = (rpc_status_t)((int32_t)resp.args[SP_CALL_ARGS_RESP_OP_STATUS]);
++	this_context->resp_len = (size_t)resp.args.args32[SP_CALL_ARGS_RESP_DATA_LEN];
++	status = resp.args.args32[SP_CALL_ARGS_RESP_RPC_STATUS];
++	*opstatus = (rpc_status_t)((int32_t)resp.args.args32[SP_CALL_ARGS_RESP_OP_STATUS]);
+ 
+ 	if (this_context->resp_len > this_context->shared_mem_required_size) {
+ 		EMSG("invalid response length");
+@@ -242,11 +243,12 @@ int ffarpc_caller_open(struct ffarpc_caller *caller, uint16_t dest_partition_id,
+ 
+ 	req.source_id = own_id;
+ 	req.destination_id = dest_partition_id;
+-	req.args[SP_CALL_ARGS_IFACE_ID_OPCODE] =
++	req.is_64bit_message = false;
++	req.args.args32[SP_CALL_ARGS_IFACE_ID_OPCODE] =
+ 		FFA_CALL_ARGS_COMBINE_IFACE_ID_OPCODE(FFA_CALL_MGMT_IFACE_ID, FFA_CALL_OPCODE_SHARE_BUF);
+-	req.args[SP_CALL_ARGS_SHARE_MEM_HANDLE_LSW] = (uint32_t)(handle & UINT32_MAX);
+-	req.args[SP_CALL_ARGS_SHARE_MEM_HANDLE_MSW] = (uint32_t)(handle >> 32);
+-	req.args[SP_CALL_ARGS_SHARE_MEM_SIZE] = (uint32_t)(caller->shared_mem_required_size);
++	req.args.args32[SP_CALL_ARGS_SHARE_MEM_HANDLE_LSW] = (uint32_t)(handle & UINT32_MAX);
++	req.args.args32[SP_CALL_ARGS_SHARE_MEM_HANDLE_MSW] = (uint32_t)(handle >> 32);
++	req.args.args32[SP_CALL_ARGS_SHARE_MEM_SIZE] = (uint32_t)(caller->shared_mem_required_size);
+ 
+ 	sp_res = sp_msg_send_direct_req(&req, &resp);
+ 	if (sp_res != SP_RESULT_OK) {
+@@ -273,10 +275,11 @@ int ffarpc_caller_close(struct ffarpc_caller *caller)
+ 
+ 	req.source_id = own_id;
+ 	req.destination_id = caller->dest_partition_id;
+-	req.args[SP_CALL_ARGS_IFACE_ID_OPCODE] =
++	req.is_64bit_message = false;
++	req.args.args32[SP_CALL_ARGS_IFACE_ID_OPCODE] =
+ 		FFA_CALL_ARGS_COMBINE_IFACE_ID_OPCODE(FFA_CALL_MGMT_IFACE_ID, FFA_CALL_OPCODE_UNSHARE_BUF);
+-	req.args[SP_CALL_ARGS_SHARE_MEM_HANDLE_LSW] = handle_lo;
+-	req.args[SP_CALL_ARGS_SHARE_MEM_HANDLE_MSW] = handle_hi;
++	req.args.args32[SP_CALL_ARGS_SHARE_MEM_HANDLE_LSW] = handle_lo;
++	req.args.args32[SP_CALL_ARGS_SHARE_MEM_HANDLE_MSW] = handle_hi;
+ 
+ 	sp_res = sp_msg_send_direct_req(&req, &resp);
+ 	if (sp_res != SP_RESULT_OK) {
+diff --git a/components/rpc/ffarpc/endpoint/ffarpc_call_ep.c b/components/rpc/ffarpc/endpoint/ffarpc_call_ep.c
+index 6a8cef0..c024196 100644
+--- a/components/rpc/ffarpc/endpoint/ffarpc_call_ep.c
++++ b/components/rpc/ffarpc/endpoint/ffarpc_call_ep.c
+@@ -260,8 +260,8 @@ void ffa_call_ep_receive(struct ffa_call_ep *call_ep,
+ 			 const struct sp_msg *req_msg,
+ 			 struct sp_msg *resp_msg)
+ {
+-	const uint32_t *req_args = req_msg->args;
+-	uint32_t *resp_args = resp_msg->args;
++	const uint32_t *req_args = req_msg->args.args32;
++	uint32_t *resp_args = resp_msg->args.args32;
+ 
+ 	uint16_t source_id = req_msg->source_id;
+ 	uint32_t ifaceid_opcode = req_args[SP_CALL_ARGS_IFACE_ID_OPCODE];
+diff --git a/components/rpc/mm_communicate/endpoint/sp/mm_communicate_call_ep.c b/components/rpc/mm_communicate/endpoint/sp/mm_communicate_call_ep.c
+index 09f1e2c..dc49e64 100644
+--- a/components/rpc/mm_communicate/endpoint/sp/mm_communicate_call_ep.c
++++ b/components/rpc/mm_communicate/endpoint/sp/mm_communicate_call_ep.c
+@@ -1,6 +1,6 @@
+ // SPDX-License-Identifier: BSD-3-Clause
+ /*
+- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights reserved.
+  */
+ 
+ #include "components/rpc/mm_communicate/common/mm_communicate_call_args.h"
+@@ -127,15 +127,15 @@ void mm_communicate_call_ep_receive(struct mm_communicate_ep *mm_communicate_cal
+ 	uintptr_t buffer_address = 0;
+ 	size_t buffer_size = 0;
+ 
+-	buffer_address = req_msg->args[MM_COMMUNICATE_CALL_ARGS_COMM_BUFFER_ADDRESS];
+-	buffer_size = req_msg->args[MM_COMMUNICATE_CALL_ARGS_COMM_BUFFER_SIZE];
++	buffer_address = req_msg->args.args32[MM_COMMUNICATE_CALL_ARGS_COMM_BUFFER_ADDRESS];
++	buffer_size = req_msg->args.args32[MM_COMMUNICATE_CALL_ARGS_COMM_BUFFER_SIZE];
+ 
+ 	return_value = handle_mm_communicate(mm_communicate_call_ep, req_msg->source_id,
+ 					     buffer_address, buffer_size);
+ 
+-	resp_msg->args[MM_COMMUNICATE_CALL_ARGS_RETURN_ID] = ARM_SVC_ID_SP_EVENT_COMPLETE;
+-	resp_msg->args[MM_COMMUNICATE_CALL_ARGS_RETURN_CODE] = return_value;
+-	resp_msg->args[MM_COMMUNICATE_CALL_ARGS_MBZ0] = 0;
+-	resp_msg->args[MM_COMMUNICATE_CALL_ARGS_MBZ1] = 0;
+-	resp_msg->args[MM_COMMUNICATE_CALL_ARGS_MBZ2] = 0;
++	resp_msg->args.args32[MM_COMMUNICATE_CALL_ARGS_RETURN_ID] = ARM_SVC_ID_SP_EVENT_COMPLETE;
++	resp_msg->args.args32[MM_COMMUNICATE_CALL_ARGS_RETURN_CODE] = return_value;
++	resp_msg->args.args32[MM_COMMUNICATE_CALL_ARGS_MBZ0] = 0;
++	resp_msg->args.args32[MM_COMMUNICATE_CALL_ARGS_MBZ1] = 0;
++	resp_msg->args.args32[MM_COMMUNICATE_CALL_ARGS_MBZ2] = 0;
+ }
+diff --git a/deployments/smm-gateway/common/smm_gateway_sp.c b/deployments/smm-gateway/common/smm_gateway_sp.c
+index 2187fea..3697b7f 100644
+--- a/deployments/smm-gateway/common/smm_gateway_sp.c
++++ b/deployments/smm-gateway/common/smm_gateway_sp.c
+@@ -70,10 +70,10 @@ void __noreturn sp_main(struct ffa_init_info *init_info)
+ 	while (1) {
+ 		mm_communicate_call_ep_receive(&mm_communicate_call_ep, &req_msg, &resp_msg);
+ 
+-		ffa_msg_send_direct_resp(req_msg.destination_id,
+-					 req_msg.source_id, resp_msg.args[0],
+-					 resp_msg.args[1], resp_msg.args[2],
+-					 resp_msg.args[3], resp_msg.args[4],
++		ffa_msg_send_direct_resp_32(req_msg.destination_id,
++					 req_msg.source_id, resp_msg.args.args32[0],
++					 resp_msg.args.args32[1], resp_msg.args.args32[2],
++					 resp_msg.args.args32[3], resp_msg.args.args32[4],
+ 					 &req_msg);
+ 	}
+ 
+-- 
+2.17.1
+
diff --git a/meta-arm/recipes-security/trusted-services/files/0022-Change-MM-communicate-RPC-protocol-of-call-endpoint.patch b/meta-arm/recipes-security/trusted-services/files/0022-Change-MM-communicate-RPC-protocol-of-call-endpoint.patch
new file mode 100644
index 00000000..40903974
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/files/0022-Change-MM-communicate-RPC-protocol-of-call-endpoint.patch
@@ -0,0 +1,497 @@
+From 0f02f04c7f0a7130874dc4bc1a500604d580c4dc Mon Sep 17 00:00:00 2001
+From: Imre Kis <imre.kis@arm.com>
+Date: Wed, 20 Jul 2022 15:19:17 +0200
+Subject: [PATCH 22/24] Change MM communicate RPC protocol of call endpoint
+
+Replace buffer address and size parameter by offset in buffer parameter
+and move to 64 bit FF-A direct message call. Deny all 32 bit direct
+messages in SMM gateway.
+
+Signed-off-by: Imre Kis <imre.kis@arm.com>
+Change-Id: I7a69b440ff9842960229b2bfdd1b5ae5318d9c26
+
+Upstream-Status: Pending [In review]
+Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
+
+---
+ .../common/mm_communicate_call_args.h         |  15 ++-
+ .../endpoint/sp/mm_communicate_call_ep.c      |  58 ++++-----
+ .../endpoint/sp/test/mock_mm_service.cpp      |   6 +-
+ .../endpoint/sp/test/mock_mm_service.h        |   4 +-
+ .../sp/test/test_mm_communicate_call_ep.cpp   | 110 +++++++++++-------
+ .../endpoint/sp/test/test_mock_mm_service.cpp |   4 +-
+ .../smm-gateway/common/smm_gateway_sp.c       |  17 ++-
+ 7 files changed, 123 insertions(+), 91 deletions(-)
+
+diff --git a/components/rpc/mm_communicate/common/mm_communicate_call_args.h b/components/rpc/mm_communicate/common/mm_communicate_call_args.h
+index 7d7311d..280c04d 100644
+--- a/components/rpc/mm_communicate/common/mm_communicate_call_args.h
++++ b/components/rpc/mm_communicate/common/mm_communicate_call_args.h
+@@ -1,6 +1,6 @@
+ /* SPDX-License-Identifier: BSD-3-Clause */
+ /*
+- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights reserved.
+  */
+ 
+ #ifndef MM_COMMUNICATE_CALL_ARGS_H_
+@@ -12,13 +12,12 @@
+  */
+ 
+ /* SP message arg indexes */
+-#define MM_COMMUNICATE_CALL_ARGS_COMM_BUFFER_ADDRESS	0
+-#define MM_COMMUNICATE_CALL_ARGS_COMM_BUFFER_SIZE	1
++#define MM_COMMUNICATE_CALL_ARGS_COMM_BUFFER_OFFSET	0
+ 
+-#define MM_COMMUNICATE_CALL_ARGS_RETURN_ID		0
+-#define MM_COMMUNICATE_CALL_ARGS_RETURN_CODE		1
+-#define MM_COMMUNICATE_CALL_ARGS_MBZ0			2
+-#define MM_COMMUNICATE_CALL_ARGS_MBZ1			3
+-#define MM_COMMUNICATE_CALL_ARGS_MBZ2			4
++#define MM_COMMUNICATE_CALL_ARGS_RETURN_CODE		0
++#define MM_COMMUNICATE_CALL_ARGS_MBZ0			1
++#define MM_COMMUNICATE_CALL_ARGS_MBZ1			2
++#define MM_COMMUNICATE_CALL_ARGS_MBZ2			3
++#define MM_COMMUNICATE_CALL_ARGS_MBZ3			4
+ 
+ #endif /* MM_COMMUNICATE_CALL_ARGS_H_ */
+diff --git a/components/rpc/mm_communicate/endpoint/sp/mm_communicate_call_ep.c b/components/rpc/mm_communicate/endpoint/sp/mm_communicate_call_ep.c
+index dc49e64..93aa0f4 100644
+--- a/components/rpc/mm_communicate/endpoint/sp/mm_communicate_call_ep.c
++++ b/components/rpc/mm_communicate/endpoint/sp/mm_communicate_call_ep.c
+@@ -35,7 +35,8 @@ bool mm_communicate_call_ep_init(struct mm_communicate_ep *call_ep, uint8_t *com
+ 
+ static int32_t invoke_mm_service(struct mm_communicate_ep *call_ep, uint16_t source_id,
+ 				 struct mm_service_interface *iface,
+-				 EFI_MM_COMMUNICATE_HEADER *header)
++				 EFI_MM_COMMUNICATE_HEADER *header,
++				 size_t buffer_size)
+ {
+ 	rpc_status_t rpc_status = TS_RPC_ERROR_INTERNAL;
+ 	struct mm_service_call_req call_req = { 0 };
+@@ -49,11 +50,11 @@ static int32_t invoke_mm_service(struct mm_communicate_ep *call_ep, uint16_t sou
+ 	 */
+ 	call_req.req_buf.data = header->Data;
+ 	call_req.req_buf.data_len = header->MessageLength;
+-	call_req.req_buf.size = call_ep->comm_buffer_size - EFI_MM_COMMUNICATE_HEADER_SIZE;
++	call_req.req_buf.size = buffer_size;
+ 
+ 	call_req.resp_buf.data = header->Data;
+ 	call_req.resp_buf.data_len = 0;
+-	call_req.resp_buf.size = call_ep->comm_buffer_size - EFI_MM_COMMUNICATE_HEADER_SIZE;
++	call_req.resp_buf.size = buffer_size;
+ 
+ 	result = iface->receive(iface, &call_req);
+ 
+@@ -63,32 +64,38 @@ static int32_t invoke_mm_service(struct mm_communicate_ep *call_ep, uint16_t sou
+ }
+ 
+ static int32_t handle_mm_communicate(struct mm_communicate_ep *call_ep, uint16_t source_id,
+-				     uintptr_t buffer_addr, size_t buffer_size)
++				     size_t buffer_offset)
+ {
+-	uintptr_t buffer_arg = 0;
+-	size_t request_size = 0;
++	size_t header_end_offset = 0;
++	size_t request_end_offset = 0;
++	size_t buffer_size = 0;
+ 	EFI_MM_COMMUNICATE_HEADER *header = NULL;
+ 	unsigned int i = 0;
+ 
+-	/* Validating call args according to ARM MM spec 3.2.4 */
+-	if (buffer_addr == 0)
++	if (ADD_OVERFLOW(buffer_offset, EFI_MM_COMMUNICATE_HEADER_SIZE, &header_end_offset))
++		return MM_RETURN_CODE_INVALID_PARAMETER;
++
++	if (call_ep->comm_buffer_size < header_end_offset)
+ 		return MM_RETURN_CODE_INVALID_PARAMETER;
+ 
+ 	/* Validating comm buffer contents */
+-	header = (EFI_MM_COMMUNICATE_HEADER *)call_ep->comm_buffer;
+-	if (ADD_OVERFLOW(header->MessageLength, EFI_MM_COMMUNICATE_HEADER_SIZE, &request_size))
++	header = (EFI_MM_COMMUNICATE_HEADER *)(call_ep->comm_buffer + buffer_offset);
++	if (ADD_OVERFLOW(header_end_offset, header->MessageLength, &request_end_offset))
+ 		return MM_RETURN_CODE_INVALID_PARAMETER;
+ 
+-	if (call_ep->comm_buffer_size < request_size)
++	if (call_ep->comm_buffer_size < request_end_offset)
+ 		return MM_RETURN_CODE_INVALID_PARAMETER;
+ 
++	buffer_size = call_ep->comm_buffer_size - header_end_offset;
++
+ 	/* Finding iface_id by GUID */
+ 	for (i = 0; i < ARRAY_SIZE(call_ep->service_table); i++) {
+ 		const struct mm_service_entry *entry = &call_ep->service_table[i];
+ 
+ 		if (entry->iface != NULL &&
+ 		    memcmp(&header->HeaderGuid, &entry->guid, sizeof(entry->guid)) == 0)
+-			return invoke_mm_service(call_ep, source_id, entry->iface, header);
++			return invoke_mm_service(call_ep, source_id, entry->iface, header,
++						 buffer_size);
+ 	}
+ 
+ 	return MM_RETURN_CODE_NOT_SUPPORTED;
+@@ -123,19 +130,16 @@ void mm_communicate_call_ep_receive(struct mm_communicate_ep *mm_communicate_cal
+ 				    const struct ffa_direct_msg *req_msg,
+ 				    struct ffa_direct_msg *resp_msg)
+ {
+-	int32_t return_value = 0;
+-	uintptr_t buffer_address = 0;
+-	size_t buffer_size = 0;
+-
+-	buffer_address = req_msg->args.args32[MM_COMMUNICATE_CALL_ARGS_COMM_BUFFER_ADDRESS];
+-	buffer_size = req_msg->args.args32[MM_COMMUNICATE_CALL_ARGS_COMM_BUFFER_SIZE];
+-
+-	return_value = handle_mm_communicate(mm_communicate_call_ep, req_msg->source_id,
+-					     buffer_address, buffer_size);
+-
+-	resp_msg->args.args32[MM_COMMUNICATE_CALL_ARGS_RETURN_ID] = ARM_SVC_ID_SP_EVENT_COMPLETE;
+-	resp_msg->args.args32[MM_COMMUNICATE_CALL_ARGS_RETURN_CODE] = return_value;
+-	resp_msg->args.args32[MM_COMMUNICATE_CALL_ARGS_MBZ0] = 0;
+-	resp_msg->args.args32[MM_COMMUNICATE_CALL_ARGS_MBZ1] = 0;
+-	resp_msg->args.args32[MM_COMMUNICATE_CALL_ARGS_MBZ2] = 0;
++	int32_t return_value = MM_RETURN_CODE_NOT_SUPPORTED;
++	size_t buffer_offset = req_msg->args.args64[MM_COMMUNICATE_CALL_ARGS_COMM_BUFFER_OFFSET];
++
++	return_value = handle_mm_communicate(mm_communicate_call_ep,
++						req_msg->source_id,
++						buffer_offset);
++
++	resp_msg->args.args64[MM_COMMUNICATE_CALL_ARGS_RETURN_CODE] = return_value;
++	resp_msg->args.args64[MM_COMMUNICATE_CALL_ARGS_MBZ0] = 0;
++	resp_msg->args.args64[MM_COMMUNICATE_CALL_ARGS_MBZ1] = 0;
++	resp_msg->args.args64[MM_COMMUNICATE_CALL_ARGS_MBZ2] = 0;
++	resp_msg->args.args64[MM_COMMUNICATE_CALL_ARGS_MBZ3] = 0;
+ }
+diff --git a/components/rpc/mm_communicate/endpoint/sp/test/mock_mm_service.cpp b/components/rpc/mm_communicate/endpoint/sp/test/mock_mm_service.cpp
+index a58c33a..0ae2a80 100644
+--- a/components/rpc/mm_communicate/endpoint/sp/test/mock_mm_service.cpp
++++ b/components/rpc/mm_communicate/endpoint/sp/test/mock_mm_service.cpp
+@@ -1,6 +1,6 @@
+ // SPDX-License-Identifier: BSD-3-Clause
+ /*
+- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights reserved.
+  */
+ 
+ #include <CppUTestExt/MockSupport.h>
+@@ -16,7 +16,7 @@ void mock_mm_service_init(void)
+ 
+ void expect_mock_mm_service_receive(struct mm_service_interface *iface,
+ 				    const struct mm_service_call_req *req,
+-				    int32_t result)
++				    int64_t result)
+ {
+ 	mock().expectOneCall("mm_service_receive").onObject(iface).
+ 		withOutputParameterReturning("resp_buf_data_len", &req->resp_buf.data_len,
+@@ -31,5 +31,5 @@ int32_t mock_mm_service_receive(struct mm_service_interface *iface,
+ 	return mock().actualCall("mm_service_receive").onObject(iface).
+ 		withOutputParameter("resp_buf_data_len", &req->resp_buf.data_len).
+ 		withParameterOfType("mm_service_call_req", "req", req).
+-		returnIntValue();
++		returnLongIntValue();
+ }
+diff --git a/components/rpc/mm_communicate/endpoint/sp/test/mock_mm_service.h b/components/rpc/mm_communicate/endpoint/sp/test/mock_mm_service.h
+index 768022d..56c8a26 100644
+--- a/components/rpc/mm_communicate/endpoint/sp/test/mock_mm_service.h
++++ b/components/rpc/mm_communicate/endpoint/sp/test/mock_mm_service.h
+@@ -1,6 +1,6 @@
+ /* SPDX-License-Identifier: BSD-3-Clause */
+ /*
+- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights reserved.
+  */
+ 
+ #ifndef MOCK_MM_SERVICE_H_
+@@ -16,7 +16,7 @@ void mock_mm_service_init(void);
+ 
+ void expect_mock_mm_service_receive(struct mm_service_interface *iface,
+ 				    const struct mm_service_call_req *req,
+-				    int32_t result);
++				    int64_t result);
+ 
+ int32_t mock_mm_service_receive(struct mm_service_interface *iface,
+ 				struct mm_service_call_req *req);
+diff --git a/components/rpc/mm_communicate/endpoint/sp/test/test_mm_communicate_call_ep.cpp b/components/rpc/mm_communicate/endpoint/sp/test/test_mm_communicate_call_ep.cpp
+index 55a61fb..5aaa3a6 100644
+--- a/components/rpc/mm_communicate/endpoint/sp/test/test_mm_communicate_call_ep.cpp
++++ b/components/rpc/mm_communicate/endpoint/sp/test/test_mm_communicate_call_ep.cpp
+@@ -1,6 +1,6 @@
+ // SPDX-License-Identifier: BSD-3-Clause
+ /*
+- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights reserved.
+  */
+ 
+ #include <CppUTest/TestHarness.h>
+@@ -32,14 +32,14 @@ TEST_GROUP(mm_communicate_call_ep)
+ 		mock().clear();
+ 	}
+ 
+-	void check_sp_msg(const struct ffa_direct_msg *msg, uint32_t arg0,
+-			  uint32_t arg1, uint32_t arg2, uint32_t arg3, uint32_t arg4)
++	void check_sp_msg(const struct ffa_direct_msg *msg, uint64_t arg0,
++			  uint64_t arg1, uint64_t arg2, uint64_t arg3, uint64_t arg4)
+ 	{
+-		UNSIGNED_LONGLONGS_EQUAL(arg0, msg->args[0]);
+-		UNSIGNED_LONGLONGS_EQUAL(arg1, msg->args[1]);
+-		UNSIGNED_LONGLONGS_EQUAL(arg2, msg->args[2]);
+-		UNSIGNED_LONGLONGS_EQUAL(arg3, msg->args[3]);
+-		UNSIGNED_LONGLONGS_EQUAL(arg4,  msg->args[4]);
++		UNSIGNED_LONGLONGS_EQUAL(arg0, msg->args.args64[0]);
++		UNSIGNED_LONGLONGS_EQUAL(arg1, msg->args.args64[1]);
++		UNSIGNED_LONGLONGS_EQUAL(arg2, msg->args.args64[2]);
++		UNSIGNED_LONGLONGS_EQUAL(arg3, msg->args.args64[3]);
++		UNSIGNED_LONGLONGS_EQUAL(arg4,  msg->args.args64[4]);
+ 	}
+ 
+ 	struct mm_communicate_ep call_ep;
+@@ -114,59 +114,54 @@ TEST(mm_communicate_call_ep, attach_do_not_fit)
+ 	}
+ }
+ 
+-TEST(mm_communicate_call_ep, mm_communicate_no_buffer_arg)
++TEST(mm_communicate_call_ep, mm_communicate_offset_int_overflow)
+ {
+ 	CHECK_TRUE(mm_communicate_call_ep_init(&call_ep, comm_buffer, sizeof(comm_buffer)));
++	req_msg.args.args64[0] = 0xffffffffffffffff;
+ 
+ 	mm_communicate_call_ep_receive(&call_ep, &req_msg, &resp_msg);
+ 
+-	check_sp_msg(&resp_msg, ARM_SVC_ID_SP_EVENT_COMPLETE, MM_RETURN_CODE_INVALID_PARAMETER,
+-		     0, 0, 0);
++	check_sp_msg(&resp_msg, MM_RETURN_CODE_INVALID_PARAMETER, 0, 0, 0, 0);
+ }
+ 
+-TEST(mm_communicate_call_ep, mm_communicate_length_overflow)
++TEST(mm_communicate_call_ep, mm_communicate_offset_overflow)
+ {
+ 	CHECK_TRUE(mm_communicate_call_ep_init(&call_ep, comm_buffer, sizeof(comm_buffer)));
++	req_msg.args.args64[0] = sizeof(comm_buffer) - EFI_MM_COMMUNICATE_HEADER_SIZE + 1;
++
++	mm_communicate_call_ep_receive(&call_ep, &req_msg, &resp_msg);
+ 
+-	req_msg.args[0] = (uintptr_t)comm_buffer;
+-	req_msg.args[1] = sizeof(comm_buffer);
++	check_sp_msg(&resp_msg, MM_RETURN_CODE_INVALID_PARAMETER, 0, 0, 0, 0);
++}
+ 
++TEST(mm_communicate_call_ep, mm_communicate_length_overflow)
++{
++	CHECK_TRUE(mm_communicate_call_ep_init(&call_ep, comm_buffer, sizeof(comm_buffer)));
+ 	header->MessageLength = UINT64_MAX - EFI_MM_COMMUNICATE_HEADER_SIZE + 1;
+ 
+ 	mm_communicate_call_ep_receive(&call_ep, &req_msg, &resp_msg);
+ 
+-	check_sp_msg(&resp_msg, ARM_SVC_ID_SP_EVENT_COMPLETE, MM_RETURN_CODE_INVALID_PARAMETER,
+-		     0, 0, 0);
++	check_sp_msg(&resp_msg, MM_RETURN_CODE_INVALID_PARAMETER, 0, 0, 0, 0);
+ }
+ 
+ TEST(mm_communicate_call_ep, mm_communicate_too_large)
+ {
+ 	CHECK_TRUE(mm_communicate_call_ep_init(&call_ep, comm_buffer, sizeof(comm_buffer)));
+-
+-	req_msg.args[0] = (uintptr_t)comm_buffer;
+-	req_msg.args[1] = sizeof(comm_buffer);
+-
+ 	header->MessageLength = sizeof(comm_buffer) - EFI_MM_COMMUNICATE_HEADER_SIZE + 1;
+ 
+ 	mm_communicate_call_ep_receive(&call_ep, &req_msg, &resp_msg);
+ 
+-	check_sp_msg(&resp_msg, ARM_SVC_ID_SP_EVENT_COMPLETE, MM_RETURN_CODE_INVALID_PARAMETER,
+-		     0, 0, 0);
++	check_sp_msg(&resp_msg, MM_RETURN_CODE_INVALID_PARAMETER, 0, 0, 0, 0);
+ }
+ 
+ TEST(mm_communicate_call_ep, mm_communicate_no_handler)
+ {
+ 	CHECK_TRUE(mm_communicate_call_ep_init(&call_ep, comm_buffer, sizeof(comm_buffer)));
+-
+-	req_msg.args[0] = (uintptr_t)comm_buffer;
+-	req_msg.args[1] = sizeof(comm_buffer);
+-
+ 	header->MessageLength = 0;
+ 
+ 	mm_communicate_call_ep_receive(&call_ep, &req_msg, &resp_msg);
+ 
+-	check_sp_msg(&resp_msg, ARM_SVC_ID_SP_EVENT_COMPLETE, MM_RETURN_CODE_NOT_SUPPORTED,
+-		     0, 0, 0);
++	check_sp_msg(&resp_msg, MM_RETURN_CODE_NOT_SUPPORTED, 0, 0, 0, 0);
+ }
+ 
+ TEST(mm_communicate_call_ep, mm_communicate_single_handler_not_matching)
+@@ -175,16 +170,11 @@ TEST(mm_communicate_call_ep, mm_communicate_single_handler_not_matching)
+ 
+ 	CHECK_TRUE(mm_communicate_call_ep_init(&call_ep, comm_buffer, sizeof(comm_buffer)));
+ 	mm_communicate_call_ep_attach_service(&call_ep, &guid0, &iface);
+-
+-	req_msg.args[0] = (uintptr_t)comm_buffer;
+-	req_msg.args[1] = sizeof(comm_buffer);
+-
+ 	header->MessageLength = 0;
+ 
+ 	mm_communicate_call_ep_receive(&call_ep, &req_msg, &resp_msg);
+ 
+-	check_sp_msg(&resp_msg, ARM_SVC_ID_SP_EVENT_COMPLETE, MM_RETURN_CODE_NOT_SUPPORTED,
+-		     0, 0, 0);
++	check_sp_msg(&resp_msg, MM_RETURN_CODE_NOT_SUPPORTED, 0, 0, 0, 0);
+ }
+ 
+ TEST(mm_communicate_call_ep, mm_communicate_single_handler_matching)
+@@ -211,19 +201,55 @@ TEST(mm_communicate_call_ep, mm_communicate_single_handler_matching)
+ 	CHECK_TRUE(mm_communicate_call_ep_init(&call_ep, comm_buffer, sizeof(comm_buffer)));
+ 	mm_communicate_call_ep_attach_service(&call_ep, &guid0, &iface);
+ 
+-	req_msg.args[0] = (uintptr_t)comm_buffer;
+-	req_msg.args[1] = sizeof(comm_buffer);
++	memcpy(&header->HeaderGuid, &guid0, sizeof(guid0));
++	header->MessageLength = req_len;
++
++	expect_mock_mm_service_receive(&iface, &req, MM_RETURN_CODE_SUCCESS);
++
++	mm_communicate_call_ep_receive(&call_ep, &req_msg, &resp_msg);
++
++	check_sp_msg(&resp_msg, MM_RETURN_CODE_SUCCESS, 0, 0, 0, 0);
++}
++
++TEST(mm_communicate_call_ep, mm_communicate_single_handler_matching_with_offset)
++{
++	const size_t offset = 0x10;
++	EFI_MM_COMMUNICATE_HEADER *header = (EFI_MM_COMMUNICATE_HEADER *)(comm_buffer + offset);
++
++	const size_t req_len = 16;
++	struct mm_service_interface iface = {
++		.context = (void *)0x1234,
++		.receive = mock_mm_service_receive
++	};
++	struct mm_service_call_req req = {
++		.guid = &guid0,
++		.req_buf = {
++			.size = sizeof(comm_buffer) - EFI_MM_COMMUNICATE_HEADER_SIZE - offset,
++			.data_len = req_len,
++			.data = header->Data
++		},
++		.resp_buf = {
++			.size = sizeof(comm_buffer) - EFI_MM_COMMUNICATE_HEADER_SIZE - offset,
++			.data_len = 0,
++			.data = header->Data
++		},
++	};
++
++	CHECK_TRUE(mm_communicate_call_ep_init(&call_ep, comm_buffer, sizeof(comm_buffer)));
++	mm_communicate_call_ep_attach_service(&call_ep, &guid0, &iface);
+ 
+ 	memcpy(&header->HeaderGuid, &guid0, sizeof(guid0));
+ 	header->MessageLength = req_len;
++	req_msg.args.args64[0] = offset;
+ 
+ 	expect_mock_mm_service_receive(&iface, &req, MM_RETURN_CODE_SUCCESS);
+ 
+ 	mm_communicate_call_ep_receive(&call_ep, &req_msg, &resp_msg);
+ 
+-	check_sp_msg(&resp_msg, ARM_SVC_ID_SP_EVENT_COMPLETE, MM_RETURN_CODE_SUCCESS, 0, 0, 0);
++	check_sp_msg(&resp_msg, MM_RETURN_CODE_SUCCESS, 0, 0, 0, 0);
+ }
+ 
++
+ TEST(mm_communicate_call_ep, mm_communicate_single_handler_matching_error)
+ {
+ 	const size_t req_len = 16;
+@@ -248,9 +274,6 @@ TEST(mm_communicate_call_ep, mm_communicate_single_handler_matching_error)
+ 	CHECK_TRUE(mm_communicate_call_ep_init(&call_ep, comm_buffer, sizeof(comm_buffer)));
+ 	mm_communicate_call_ep_attach_service(&call_ep, &guid0, &iface);
+ 
+-	req_msg.args[0] = (uintptr_t)comm_buffer;
+-	req_msg.args[1] = sizeof(comm_buffer);
+-
+ 	memcpy(&header->HeaderGuid, &guid0, sizeof(guid0));
+ 	header->MessageLength = req_len;
+ 
+@@ -258,7 +281,7 @@ TEST(mm_communicate_call_ep, mm_communicate_single_handler_matching_error)
+ 
+ 	mm_communicate_call_ep_receive(&call_ep, &req_msg, &resp_msg);
+ 
+-	check_sp_msg(&resp_msg, ARM_SVC_ID_SP_EVENT_COMPLETE, MM_RETURN_CODE_NO_MEMORY, 0, 0, 0);
++	check_sp_msg(&resp_msg, MM_RETURN_CODE_NO_MEMORY, 0, 0, 0, 0);
+ }
+ 
+ TEST(mm_communicate_call_ep, mm_communicate_two_handlers)
+@@ -290,9 +313,6 @@ TEST(mm_communicate_call_ep, mm_communicate_two_handlers)
+ 	mm_communicate_call_ep_attach_service(&call_ep, &guid0, &iface0);
+ 	mm_communicate_call_ep_attach_service(&call_ep, &guid1, &iface1);
+ 
+-	req_msg.args[0] = (uintptr_t)comm_buffer;
+-	req_msg.args[1] = sizeof(comm_buffer);
+-
+ 	memcpy(&header->HeaderGuid, &guid1, sizeof(guid0));
+ 	header->MessageLength = req_len;
+ 
+@@ -300,5 +320,5 @@ TEST(mm_communicate_call_ep, mm_communicate_two_handlers)
+ 
+ 	mm_communicate_call_ep_receive(&call_ep, &req_msg, &resp_msg);
+ 
+-	check_sp_msg(&resp_msg, ARM_SVC_ID_SP_EVENT_COMPLETE, MM_RETURN_CODE_SUCCESS, 0, 0, 0);
++	check_sp_msg(&resp_msg, MM_RETURN_CODE_SUCCESS, 0, 0, 0, 0);
+ }
+diff --git a/components/rpc/mm_communicate/endpoint/sp/test/test_mock_mm_service.cpp b/components/rpc/mm_communicate/endpoint/sp/test/test_mock_mm_service.cpp
+index 360a8fa..600386e 100644
+--- a/components/rpc/mm_communicate/endpoint/sp/test/test_mock_mm_service.cpp
++++ b/components/rpc/mm_communicate/endpoint/sp/test/test_mock_mm_service.cpp
+@@ -1,6 +1,6 @@
+ // SPDX-License-Identifier: BSD-3-Clause
+ /*
+- * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ * Copyright (c) 2021-2022, Arm Limited and Contributors. All rights reserved.
+  */
+ 
+ #include <CppUTest/TestHarness.h>
+@@ -44,7 +44,7 @@ TEST(mock_mm_service, receive)
+ 			.data = (void *)0x2345
+ 		}
+ 	};
+-	int32_t result = -123456;
++	int64_t result = -123456;
+ 
+ 	expect_mock_mm_service_receive(&iface, &req, result);
+ 	LONGS_EQUAL(result, mock_mm_service_receive(&iface, &req));
+diff --git a/deployments/smm-gateway/common/smm_gateway_sp.c b/deployments/smm-gateway/common/smm_gateway_sp.c
+index 3697b7f..3062877 100644
+--- a/deployments/smm-gateway/common/smm_gateway_sp.c
++++ b/deployments/smm-gateway/common/smm_gateway_sp.c
+@@ -11,6 +11,7 @@
+ #include "components/rpc/mm_communicate/endpoint/sp/mm_communicate_call_ep.h"
+ #include "components/service/smm_variable/frontend/mm_communicate/smm_variable_mm_service.h"
+ #include "platform/interface/memory_region.h"
++#include "protocols/common/mm/mm_smc.h"
+ #include <ffa_api.h>
+ #include <sp_api.h>
+ #include <sp_messaging.h>
+@@ -68,12 +69,20 @@ void __noreturn sp_main(struct ffa_init_info *init_info)
+ 	ffa_msg_wait(&req_msg);
+ 
+ 	while (1) {
++		if (FFA_IS_32_BIT_FUNC(req_msg.function_id)) {
++			EMSG("MM communicate over 32 bit FF-A messages is not supported");
++			ffa_msg_send_direct_resp_32(req_msg.destination_id, req_msg.source_id,
++						    MM_RETURN_CODE_NOT_SUPPORTED, 0, 0, 0, 0,
++						    &req_msg);
++			continue;
++		}
++
+ 		mm_communicate_call_ep_receive(&mm_communicate_call_ep, &req_msg, &resp_msg);
+ 
+-		ffa_msg_send_direct_resp_32(req_msg.destination_id,
+-					 req_msg.source_id, resp_msg.args.args32[0],
+-					 resp_msg.args.args32[1], resp_msg.args.args32[2],
+-					 resp_msg.args.args32[3], resp_msg.args.args32[4],
++		ffa_msg_send_direct_resp_64(req_msg.destination_id,
++					 req_msg.source_id, resp_msg.args.args64[0],
++					 resp_msg.args.args64[1], resp_msg.args.args64[2],
++					 resp_msg.args.args64[3], resp_msg.args.args64[4],
+ 					 &req_msg);
+ 	}
+ 
+-- 
+2.17.1
+
diff --git a/meta-arm/recipes-security/trusted-services/files/0023-Change-MM-communicate-RPC-protocol-of-MM-caller.patch b/meta-arm/recipes-security/trusted-services/files/0023-Change-MM-communicate-RPC-protocol-of-MM-caller.patch
new file mode 100644
index 00000000..4244225b
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/files/0023-Change-MM-communicate-RPC-protocol-of-MM-caller.patch
@@ -0,0 +1,100 @@
+From 96d226e4e0ea9c633dbc5d05ae2a7a2f4ba0f39e Mon Sep 17 00:00:00 2001
+From: Imre Kis <imre.kis@arm.com>
+Date: Fri, 22 Jul 2022 17:22:05 +0200
+Subject: [PATCH 23/24] Change MM communicate RPC protocol of MM caller
+
+Replace buffer address and size parameter by offset in buffer parameter
+and move to 64 bit FF-A direct message call. This change requires an
+updated version of the debugfs driver which supports 64 bit direct
+messages.
+
+Signed-off-by: Imre Kis <imre.kis@arm.com>
+Change-Id: I003c1de7f9c3f45bbc52e4a51d622ec960fa7052
+
+Upstream-Status: Pending [In review]
+Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
+
+---
+ .../caller/linux/mm_communicate_caller.c      | 35 +++++++------------
+ .../LinuxFFAUserShim/LinuxFFAUserShim.cmake   |  2 +-
+ 2 files changed, 14 insertions(+), 23 deletions(-)
+
+diff --git a/components/rpc/mm_communicate/caller/linux/mm_communicate_caller.c b/components/rpc/mm_communicate/caller/linux/mm_communicate_caller.c
+index 0c505b4..0287acf 100644
+--- a/components/rpc/mm_communicate/caller/linux/mm_communicate_caller.c
++++ b/components/rpc/mm_communicate/caller/linux/mm_communicate_caller.c
+@@ -19,7 +19,7 @@
+ #include <string.h>
+ #include <errno.h>
+ 
+-#define KERNEL_MOD_REQ_VER_MAJOR 2
++#define KERNEL_MOD_REQ_VER_MAJOR 5
+ #define KERNEL_MOD_REQ_VER_MINOR 0
+ #define KERNEL_MOD_REQ_VER_PATCH 0
+ 
+@@ -294,37 +294,28 @@ static rpc_status_t call_invoke(
+ 
+ 		direct_msg.dst_id = s->dest_partition_id;
+ 
+-		direct_msg.args[MM_COMMUNICATE_CALL_ARGS_COMM_BUFFER_ADDRESS] = (uintptr_t)s->comm_buffer;
+-		direct_msg.args[MM_COMMUNICATE_CALL_ARGS_COMM_BUFFER_SIZE] = s->comm_buffer_size;
++		direct_msg.args[MM_COMMUNICATE_CALL_ARGS_COMM_BUFFER_OFFSET] = 0;
+ 
+ 		int kernel_op_status = ioctl(s->ffa_fd, FFA_IOC_MSG_SEND, &direct_msg);
+ 
+ 		if (kernel_op_status == 0) {
+-
+ 			/* Kernel send operation completed normally */
+-			uint32_t mm_return_id = direct_msg.args[MM_COMMUNICATE_CALL_ARGS_RETURN_ID];
+ 			int32_t mm_return_code = direct_msg.args[MM_COMMUNICATE_CALL_ARGS_RETURN_CODE];
+ 
+-			if (mm_return_id == ARM_SVC_ID_SP_EVENT_COMPLETE) {
+-
+-				if (mm_return_code == MM_RETURN_CODE_SUCCESS) {
+-
+-					mm_communicate_serializer_header_decode(s->serializer,
+-						s->comm_buffer, (efi_status_t*)opstatus, resp_buf, resp_len);
+-
+-					if (*resp_len > s->req_len) {
++			if (mm_return_code == MM_RETURN_CODE_SUCCESS) {
++				mm_communicate_serializer_header_decode(
++					s->serializer, s->comm_buffer, (efi_status_t *)opstatus,
++					resp_buf, resp_len);
+ 
+-						s->scrub_len =
+-							mm_communicate_serializer_header_size(s->serializer) +
+-							*resp_len;
+-					}
++				if (*resp_len > s->req_len)
++					s->scrub_len =
++						mm_communicate_serializer_header_size(
++							s->serializer) + *resp_len;
+ 
+-					rpc_status = TS_RPC_CALL_ACCEPTED;
+-				}
+-				else {
++				rpc_status = TS_RPC_CALL_ACCEPTED;
++			} else {
+ 
+-					rpc_status = mm_return_code_to_rpc_status(mm_return_code);
+-				}
++				rpc_status = mm_return_code_to_rpc_status(mm_return_code);
+ 			}
+ 		}
+ 	}
+diff --git a/external/LinuxFFAUserShim/LinuxFFAUserShim.cmake b/external/LinuxFFAUserShim/LinuxFFAUserShim.cmake
+index 7ba64af..9c2252c 100644
+--- a/external/LinuxFFAUserShim/LinuxFFAUserShim.cmake
++++ b/external/LinuxFFAUserShim/LinuxFFAUserShim.cmake
+@@ -11,7 +11,7 @@
+ 
+ set(LINUX_FFA_USER_SHIM_URL "https://git.gitlab.arm.com/linux-arm/linux-trusted-services.git"
+ 	CACHE STRING "Linux FF-A user space shim repository URL")
+-set(LINUX_FFA_USER_SHIM_REFSPEC "v4.0.0"
++set(LINUX_FFA_USER_SHIM_REFSPEC "v5.0.0"
+ 	CACHE STRING "Linux FF-A user space shim git refspec")
+ 
+ set(LINUX_FFA_USER_SHIM_SOURCE_DIR "${CMAKE_CURRENT_BINARY_DIR}/_deps/linux_ffa_user_shim-src"
+-- 
+2.17.1
+
diff --git a/meta-arm/recipes-security/trusted-services/files/0024-Deny-64-bit-FF-A-messages-in-FF-A-RPC-endpoint.patch b/meta-arm/recipes-security/trusted-services/files/0024-Deny-64-bit-FF-A-messages-in-FF-A-RPC-endpoint.patch
new file mode 100644
index 00000000..01cf523a
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/files/0024-Deny-64-bit-FF-A-messages-in-FF-A-RPC-endpoint.patch
@@ -0,0 +1,70 @@
+From f173e99554512c982665c1d5d4b0543421177b09 Mon Sep 17 00:00:00 2001
+From: Imre Kis <imre.kis@arm.com>
+Date: Tue, 26 Jul 2022 17:06:46 +0200
+Subject: [PATCH 24/24] Deny 64 bit FF-A messages in FF-A RPC endpoint
+
+FF-A RPC protocol only allows 32 bit FF-A direct messages thus deny all
+64 bit messages in the RPC endpoint.
+
+Signed-off-by: Imre Kis <imre.kis@arm.com>
+Change-Id: I37c95425f80b6e2821b3f6b8649ceba8aa007bce
+
+Upstream-Status: Pending [In review]
+Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
+
+---
+ .../rpc/ffarpc/endpoint/ffarpc_call_ep.c      | 31 ++++++++++++-------
+ 1 file changed, 20 insertions(+), 11 deletions(-)
+
+diff --git a/components/rpc/ffarpc/endpoint/ffarpc_call_ep.c b/components/rpc/ffarpc/endpoint/ffarpc_call_ep.c
+index c024196..3035c16 100644
+--- a/components/rpc/ffarpc/endpoint/ffarpc_call_ep.c
++++ b/components/rpc/ffarpc/endpoint/ffarpc_call_ep.c
+@@ -12,6 +12,7 @@
+ #include <protocols/rpc/common/packed-c/status.h>
+ #include <trace.h>
+ #include <stddef.h>
++#include <string.h>
+ 
+ /* TODO: remove this when own ID will be available in libsp */
+ extern uint16_t own_id;
+@@ -260,17 +261,25 @@ void ffa_call_ep_receive(struct ffa_call_ep *call_ep,
+ 			 const struct sp_msg *req_msg,
+ 			 struct sp_msg *resp_msg)
+ {
+-	const uint32_t *req_args = req_msg->args.args32;
+-	uint32_t *resp_args = resp_msg->args.args32;
+-
+-	uint16_t source_id = req_msg->source_id;
+-	uint32_t ifaceid_opcode = req_args[SP_CALL_ARGS_IFACE_ID_OPCODE];
+-
+-	if (FFA_CALL_ARGS_EXTRACT_IFACE(ifaceid_opcode) == FFA_CALL_MGMT_IFACE_ID) {
+-		/* It's an RPC layer management request */
+-		handle_mgmt_msg(call_ep, source_id, req_args, resp_args);
++	resp_msg->is_64bit_message = req_msg->is_64bit_message;
++	memset(&resp_msg->args, 0x00, sizeof(resp_msg->args));
++
++	if (!req_msg->is_64bit_message) {
++		const uint32_t *req_args = req_msg->args.args32;
++		uint32_t *resp_args = resp_msg->args.args32;
++		uint16_t source_id = req_msg->source_id;
++		uint32_t ifaceid_opcode = req_args[SP_CALL_ARGS_IFACE_ID_OPCODE];
++
++		if (FFA_CALL_ARGS_EXTRACT_IFACE(ifaceid_opcode) == FFA_CALL_MGMT_IFACE_ID) {
++			/* It's an RPC layer management request */
++			handle_mgmt_msg(call_ep, source_id, req_args, resp_args);
++		} else {
++			/* Assume anything else is a service request */
++			handle_service_msg(call_ep, source_id, req_args, resp_args);
++		}
+ 	} else {
+-		/* Assume anything else is a service request */
+-		handle_service_msg(call_ep, source_id, req_args, resp_args);
++		EMSG("64 bit FF-A messages are not supported by the TS RPC layer");
++		resp_msg->args.args64[SP_CALL_ARGS_RESP_RPC_STATUS] =
++			TS_RPC_ERROR_INVALID_PARAMETER;
+ 	}
+ }
+-- 
+2.17.1
+
diff --git a/meta-arm/recipes-security/trusted-services/trusted-services-src.inc b/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
new file mode 100644
index 00000000..0251fef8
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
@@ -0,0 +1,80 @@
+# Define sources of Trusted Service and all external dependencies
+
+LICENSE = "Apache-2.0 & BSD-3-Clause & BSD-2-Clause & Zlib"
+
+SRC_URI = "git://git.trustedfirmware.org/TS/trusted-services.git;protocol=https;branch=integration;name=trusted-services;destsuffix=git/trusted-services \
+           file://0004-correctly-find-headers-dir.patch \
+           file://0005-setting-sysroot-for-libgcc-lookup.patch \
+           file://0006-applying-lowercase-project-convention.patch \
+           file://0009-PSA-CRYPTO-API-INCLUDE.patch \
+           file://0010-change-libts-to-export-CMake-package.patch \
+           file://0011-Adapt-deployments-to-libts-changes.patch \
+           file://0017-Move-libsp-mocks-into-separate-component.patch \
+           file://0018-Add-mock-for-libsp-sp_discovery.patch \
+           file://0019-Add-mock-for-libsp-sp_memory_management.patch \
+           file://0020-Add-mock-for-libsp-sp_messaging.patch \
+           file://0021-Add-64-bit-direct-message-handling-to-libsp.patch \
+           file://0022-Change-MM-communicate-RPC-protocol-of-call-endpoint.patch \
+           file://0023-Change-MM-communicate-RPC-protocol-of-MM-caller.patch \
+           file://0024-Deny-64-bit-FF-A-messages-in-FF-A-RPC-endpoint.patch \
+"
+
+#latest on 05.07.22.
+SRCREV_trusted-services = "1b0c520279445fc4d85fc582eda5e5ff5f380c39"
+LIC_FILES_CHKSUM = "file://${S}/license.rst;md5=ea160bac7f690a069c608516b17997f4"
+
+S = "${WORKDIR}/git/trusted-services"
+PV ?= "0.0+git${SRCPV}"
+
+# DTC, tag "v1.6.1"
+SRC_URI += "git://github.com/dgibson/dtc;name=dtc;protocol=https;branch=main;destsuffix=git/dtc"
+SRCREV_dtc = "b6910bec11614980a21e46fbccc35934b671bd81"
+LIC_FILES_CHKSUM += "file://../dtc/README.license;md5=a1eb22e37f09df5b5511b8a278992d0e"
+
+# MbedTLS, tag "mbedtls-3.1.0"
+SRC_URI += "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;branch=master;destsuffix=git/mbedtls"
+SRCREV_mbedtls = "d65aeb37349ad1a50e0f6c9b694d4b5290d60e49"
+LIC_FILES_CHKSUM += "file://../mbedtls/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+# Nanopb, tag "nanopb-0.4.6"
+SRC_URI += "git://github.com/nanopb/nanopb.git;name=nanopb;protocol=https;branch=master;destsuffix=git/nanopb"
+SRCREV_nanopb = "afc499f9a410fc9bbf6c9c48cdd8d8b199d49eb4"
+LIC_FILES_CHKSUM += "file://../nanopb/LICENSE.txt;md5=9db4b73a55a3994384112efcdb37c01f"
+
+# qcbor, tag "v1.0.0"
+SRC_URI += "git://github.com/laurencelundblade/QCBOR.git;name=qcbor;protocol=https;branch=master;destsuffix=git/qcbor"
+SRCREV_qcbor = "56b17bf9f74096774944bcac0829adcd887d391e"
+LIC_FILES_CHKSUM += "file://../qcbor/README.md;md5=e8ff2e88a722cdc55eddd0bb9aeca002"
+
+# T_Cose
+SRC_URI += "git://github.com/laurencelundblade/t_cose.git;name=tcose;protocol=https;branch=master;destsuffix=git/tcose"
+SRCREV_tcose = "fc3a4b2c7196ff582e8242de8bd4a1bc4eec577f"
+LIC_FILES_CHKSUM += "file://../tcose/LICENSE;md5=b2ebdbfb82602b97aa628f64cf4b65ad"
+
+# CppUTest,  tag "v3.8"
+SRC_URI += "git://github.com/cpputest/cpputest.git;name=cpputest;protocol=https;branch=master;destsuffix=git/cpputest"
+SRCREV_cpputest = "e25097614e1c4856036366877a02346c4b36bb5b"
+LIC_FILES_CHKSUM += "file://../cpputest/COPYING;md5=ce5d5f1fe02bcd1343ced64a06fd4177"
+
+# TS ships patches for external dependencies that needs to be applied
+apply_ts_patches() {
+    for p in ${S}/external/qcbor/*.patch; do
+        patch -p1 -N -d ${WORKDIR}/git/qcbor < ${p} || true
+    done
+    for p in ${S}/external/t_cose/*.patch; do
+        patch -p1 -N -d ${WORKDIR}/git/tcose < ${p} || true
+    done
+    for p in ${S}/external/CppUTest/*.patch; do
+        patch -p1 -d ${WORKDIR}/git/cpputest < ${p}
+    done
+}
+do_patch[postfuncs] += "apply_ts_patches"
+
+# Paths to dependencies required by some TS SPs/tools
+EXTRA_OECMAKE += "-DDTC_SOURCE_DIR=${WORKDIR}/git/dtc \
+                  -DCPPUTEST_SOURCE_DIR=${WORKDIR}/git/cpputest \
+                  -DNANOPB_SOURCE_DIR=${WORKDIR}/git/nanopb \
+                  -DT_COSE_SOURCE_DIR=${WORKDIR}/git/tcose \
+                  -DQCBOR_SOURCE_DIR=${WORKDIR}/git/qcbor \
+                  -DMBEDTLS_SOURCE_DIR=${WORKDIR}/git/mbedtls \
+                 "
diff --git a/meta-arm/recipes-security/trusted-services/trusted-services.inc b/meta-arm/recipes-security/trusted-services/trusted-services.inc
new file mode 100644
index 00000000..0853d054
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/trusted-services.inc
@@ -0,0 +1,47 @@
+SUMMARY ?= "The Trusted Services: framework for developing root-of-trust services"
+HOMEPAGE = "https://trusted-services.readthedocs.io/en/latest/index.html"
+
+LICENSE = "Apache-2.0 & BSD-3-Clause & Zlib"
+LIC_FILES_CHKSUM = "file://${S}/license.rst;md5=ea160bac7f690a069c608516b17997f4"
+
+inherit python3native cmake
+
+COMPATIBLE_HOST = "aarch64.*-linux"
+
+require trusted-services-src.inc
+
+TS_PLATFORM ?= "ts/mock"
+
+# SP images are embedded into optee-os image
+# FIP packaging is not supported yet
+SP_PACKAGING_METHOD ?= "embedded"
+
+SYSROOT_DIRS += "/usr/opteesp /usr/arm-linux"
+
+# In TS cmake files use find_file() to search through source code and build dirs.
+# Yocto cmake class limits CMAKE_FIND_ROOT_PATH and find_file() fails.
+# Include the source tree and build dirs into searchable path.
+OECMAKE_EXTRA_ROOT_PATH = "${WORKDIR}/git/ ${WORKDIR}/build/"
+
+EXTRA_OECMAKE += '-DLIBGCC_LOCATE_CFLAGS="--sysroot=${STAGING_DIR_HOST}" \
+                  -DCROSS_COMPILE="${TARGET_PREFIX}" \
+                  -DSP_PACKAGING_METHOD="${SP_PACKAGING_METHOD}" \
+                  -DTS_PLATFORM="${TS_PLATFORM}" \
+                 '
+export CROSS_COMPILE="${TARGET_PREFIX}"
+
+# Default TS installation path
+TS_INSTALL = "/usr/${TS_ENV}"
+
+# Use the Yocto cmake toolchain for arm-linux TS deployments and
+# the TS opteesp toolchain for opteesp TS deployments
+EXTRA_OECMAKE += "${@oe.utils.conditional('TS_ENV', 'opteesp', \
+                    '-DCMAKE_TOOLCHAIN_FILE=${S}/environments/${TS_ENV}/default_toolchain_file.cmake', \
+                    '-DTS_EXTERNAL_LIB_TOOLCHAIN_FILE=${WORKDIR}/toolchain.cmake', \
+                    d)} \
+                 "
+
+# Paths to pre-built dependencies required by some TS SPs/tools
+EXTRA_OECMAKE += "-Dlibts_DIR=${STAGING_DIR_HOST}${TS_INSTALL}/lib/cmake/ \
+                  -DNEWLIB_INSTALL_DIR=${STAGING_DIR_HOST}${TS_INSTALL}/newlib_install \
+                 "
diff --git a/meta-arm/recipes-security/trusted-services/ts-newlib/0003-Add-newlib-deployment.patch b/meta-arm/recipes-security/trusted-services/ts-newlib/0003-Add-newlib-deployment.patch
new file mode 100644
index 00000000..e43e7d25
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/ts-newlib/0003-Add-newlib-deployment.patch
@@ -0,0 +1,85 @@
+From 03337e3a509eace9f55a46993cfaadee0e796f46 Mon Sep 17 00:00:00 2001
+From: Gyorgy Szing <Gyorgy.Szing@arm.com>
+Date: Fri, 14 Jan 2022 20:35:53 +0000
+Subject: [PATCH 1/1] Add newlib deployment
+
+This deployment allow building newlib directly and not part of SP
+builds. The resulting binary can be used as a pre-build binary for
+building SPs later.
+The intent is to help integration systems, where recursive build is
+problematic, and there is no direct support for building newlib.
+
+Change-Id: I770cdfd3c39eb7bf9764de74dfb191c321c49561
+Signed-off-by: Gyorgy Szing <Gyorgy.Szing@arm.com>
+
+Upstream-Status: Pending [In review]
+Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
+
+---
+ deployments/newlib/opteesp/CMakeLists.txt | 38 +++++++++++++++++++++++
+ tools/b-test/test_data.yaml               |  4 +++
+ 2 files changed, 42 insertions(+)
+ create mode 100644 deployments/newlib/opteesp/CMakeLists.txt
+
+diff --git a/deployments/newlib/opteesp/CMakeLists.txt b/deployments/newlib/opteesp/CMakeLists.txt
+new file mode 100644
+index 00000000..593e0a96
+--- /dev/null
++++ b/deployments/newlib/opteesp/CMakeLists.txt
+@@ -0,0 +1,38 @@
++#-------------------------------------------------------------------------------
++# Copyright (c) 2022, Arm Limited and Contributors. All rights reserved.
++#
++# SPDX-License-Identifier: BSD-3-Clause
++#
++#-------------------------------------------------------------------------------
++cmake_minimum_required(VERSION 3.18 FATAL_ERROR)
++include(../../deployment.cmake REQUIRED)
++
++#-------------------------------------------------------------------------------
++#  The CMakeLists.txt for building the newlib deployment for opteesp
++#
++#  Can be used to build the newlib library, which can be used to build SPs.
++#-------------------------------------------------------------------------------
++include(${TS_ROOT}/environments/opteesp/env.cmake)
++
++project(newlib C)
++
++# This is a dummy library not intended to be compiled ever. It is needed
++# to avoid opteesp specific newlib targeting files.
++add_library(dummy EXCLUDE_FROM_ALL)
++set(TGT dummy)
++# Build newlib as an external component.
++include(${TS_ROOT}/external/newlib/newlib.cmake)
++
++######################################## install
++if (CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
++	set(CMAKE_INSTALL_PREFIX ${CMAKE_BINARY_DIR}/install CACHE PATH "location to install build output to." FORCE)
++endif()
++
++install(DIRECTORY ${NEWLIB_INSTALL_DIR} DESTINATION  ${TS_ENV})
++
++#get_property(_tmp_lib TARGET stdlib::c PROPERTY IMPORTED_LOCATION)
++#get_filename_component(_tmp_path ${_tmp_lib} DIRECTORY)
++#install(DIRECTORY ${_tmp_path} DESTINATION ${TS_ENV})
++
++#get_property(_tmp_path TARGET stdlib::c PROPERTY INTERFACE_INCLUDE_DIRECTORIES)
++#install(DIRECTORY ${_tmp_path} DESTINATION ${TS_ENV})
+diff --git a/tools/b-test/test_data.yaml b/tools/b-test/test_data.yaml
+index 7caafa8b..6bfacc66 100644
+--- a/tools/b-test/test_data.yaml
++++ b/tools/b-test/test_data.yaml
+@@ -69,6 +69,10 @@ data:
+       os_id : "GNU/Linux"
+       params:
+             - "-GUnix Makefiles"
++    - name: "newlib-optee-arm"
++      src: "$TS_ROOT/deployments/newlib/opteesp"
++      params:
++          - "-GUnix Makefiles"
+     - name: "platform-inspect-arm-linux"
+       src: "$TS_ROOT/deployments/platform-inspect/arm-linux"
+       os_id : "GNU/Linux"
+-- 
+2.37.0
+
diff --git a/meta-arm/recipes-security/trusted-services/ts-newlib/0021-newlib-configure.patch b/meta-arm/recipes-security/trusted-services/ts-newlib/0021-newlib-configure.patch
new file mode 100644
index 00000000..a9d291b4
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/ts-newlib/0021-newlib-configure.patch
@@ -0,0 +1,72 @@
+From df66efc0db9899c41632091db11bfe2c05eec1fa Mon Sep 17 00:00:00 2001
+From: Anton Antonov <Anton.Antonov@arm.com>
+Date: Wed, 31 Aug 2022 17:55:21 +0100
+Subject: [PATCH] Allow to define additional partameters for newlib configure.
+
+Do not skip newlib and libgloss when crosscompiling
+
+Upstream-Status: Pending
+Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
+---
+ ...-aarch64-linux-gcc-to-compile-bare-metal-lib.patch | 11 ++++++++++-
+ external/newlib/newlib.cmake                          |  6 ++++++
+ 2 files changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/external/newlib/0001-Allow-aarch64-linux-gcc-to-compile-bare-metal-lib.patch b/external/newlib/0001-Allow-aarch64-linux-gcc-to-compile-bare-metal-lib.patch
+index f87ed5a..7533ed0 100644
+--- a/external/newlib/0001-Allow-aarch64-linux-gcc-to-compile-bare-metal-lib.patch
++++ b/external/newlib/0001-Allow-aarch64-linux-gcc-to-compile-bare-metal-lib.patch
+@@ -16,9 +16,18 @@ Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
+  2 files changed, 2 insertions(+), 2 deletions(-)
+ 
+ diff --git a/configure b/configure
+-index 5db52701..1eb71a80 100755
++index 5db527014..dce91609e 100755
+ --- a/configure
+ +++ b/configure
++@@ -2886,7 +2886,7 @@ esac
++
++ # Some are only suitable for cross toolchains.
++ # Remove these if host=target.
++-cross_only="target-libgloss target-newlib target-opcodes"
+++cross_only="target-opcodes"
++
++ case $is_cross_compiler in
++   no) skipdirs="${skipdirs} ${cross_only}" ;;
+ @@ -3659,7 +3659,7 @@ case "${target}" in
+    *-*-freebsd*)
+      noconfigdirs="$noconfigdirs target-newlib target-libgloss"
+diff --git a/external/newlib/newlib.cmake b/external/newlib/newlib.cmake
+index 13eb78c..5ee99a5 100644
+--- a/external/newlib/newlib.cmake
++++ b/external/newlib/newlib.cmake
+@@ -168,6 +168,10 @@ if (NOT NEWLIB_LIBC_PATH)
+ 	string(REPLACE ";" " -isystem " CFLAGS_FOR_TARGET "${_gcc_include_dirs}")
+ 	set(CFLAGS_FOR_TARGET "-isystem ${CFLAGS_FOR_TARGET} -fpic")
+ 
++	# Split a newlib extra build parameter into a list of parameters
++	set(NEWLIB_EXTRAS ${NEWLIB_EXTRA})
++	separate_arguments(NEWLIB_EXTRAS)
++
+ 	# Newlib configure step
+ 	# CC env var must be unset otherwise configure will assume the cross compiler is the host
+ 	# compiler.
+@@ -175,6 +179,7 @@ if (NOT NEWLIB_LIBC_PATH)
+ 	execute_process(COMMAND
+ 		${CMAKE_COMMAND} -E env --unset=CC PATH=${COMPILER_PATH}:$ENV{PATH} ./configure
+ 			--target=${COMPILER_PREFIX}
++			--host=${COMPILER_PREFIX}
+ 			--prefix=${NEWLIB_INSTALL_DIR}
+ 			--enable-newlib-nano-formatted-io
+ 			--enable-newlib-nano-malloc
+@@ -182,6 +187,7 @@ if (NOT NEWLIB_LIBC_PATH)
+ 			--enable-newlib-reent-small
+ 			--enable-newlib-global-atexit
+ 			--disable-multilib
++			${NEWLIB_EXTRAS}
+ 			CFLAGS_FOR_TARGET=${CFLAGS_FOR_TARGET}
+ 			LDFLAGS_FOR_TARGET=-fpie
+ 		WORKING_DIRECTORY
+-- 
+2.25.1
+
diff --git a/meta-arm/recipes-security/trusted-services/ts-newlib_4.1.0.bb b/meta-arm/recipes-security/trusted-services/ts-newlib_4.1.0.bb
new file mode 100644
index 00000000..94038b5b
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/ts-newlib_4.1.0.bb
@@ -0,0 +1,31 @@
+SUMMARY = "Newlib static libraries built with Trusted Services opteesp deployment options"
+
+TS_ENV = "opteesp"
+
+require trusted-services.inc
+
+SRC_URI += "git://sourceware.org/git/newlib-cygwin.git;name=newlib;protocol=https;branch=master;destsuffix=git/newlib \
+            file://0003-Add-newlib-deployment.patch \
+            file://0021-newlib-configure.patch \
+"
+
+# tag "newlib-0.4.1"
+SRCREV_newlib = "415fdd4279b85eeec9d54775ce13c5c412451e08"
+LIC_FILES_CHKSUM += "file://../newlib/COPYING.NEWLIB;md5=b8dda70da54e0efb49b1074f349d7749"
+
+EXTRA_OECMAKE += '-DNEWLIB_SOURCE_DIR=${WORKDIR}/git/newlib \
+                  -DNEWLIB_EXTRA="CFLAGS=--sysroot=${STAGING_DIR_HOST}" \
+                 '
+
+OECMAKE_SOURCEPATH = "${S}/deployments/newlib/${TS_ENV}/"
+
+# TS ships a patch that needs to be applied to newlib
+apply_ts_patch() {
+    for p in ${S}/external/newlib/*.patch; do
+        patch -p1 -d ${WORKDIR}/git/newlib < ${p}
+    done
+}
+do_patch[postfuncs] += "apply_ts_patch"
+
+FILES:${PN}-dev = "${TS_INSTALL}/newlib_install"
+FILES:${PN}-staticdev = "${TS_INSTALL}/newlib_install/*/lib/*.a"
-- 
2.25.1


