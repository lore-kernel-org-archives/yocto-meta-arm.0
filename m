Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C9DDC43219
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 13:59:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12518.1638971958325585272
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Dec 2021 05:59:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03BE511FB;
	Wed,  8 Dec 2021 05:59:18 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.6.202])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9AD803F73B;
	Wed,  8 Dec 2021 05:59:16 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 5/8] arm-bsp/secure-partitions: corstone1000: add openamp
 support in SE proxy SP
Date: Wed,  8 Dec 2021 13:58:57 +0000
Message-Id: <20211208135900.683-6-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211208135900.683-1-abdellatif.elkhlifi@arm.com>
References: <20211208135900.683-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 08 Dec 2021 13:59:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2566

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

This change is to fetch and build openamp and libmetal
as part of SE proxy secure partitions

Change-Id: I251525f830535ceb1e1fc9f994c22a8b149fe7b6
Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
---
 ...7-Add-openamp-to-SE-proxy-deployment.patch | 259 ++++++++++++++++++
 .../trusted-services/ts-corstone1000.inc      |  14 +-
 2 files changed, 271 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0007-Add-openamp-to-SE-proxy-deployment.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0007-Add-openamp-to-SE-proxy-deployment.patch b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0007-Add-openamp-to-SE-proxy-deployment.patch
new file mode 100644
index 0000000..c47475e
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions/0007-Add-openamp-to-SE-proxy-deployment.patch
@@ -0,0 +1,259 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+From afaab8162d5e5a22c0a89aebd46ca6480151d19e Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Fri, 3 Dec 2021 16:36:51 +0000
+Subject: [PATCH] Add openamp to SE proxy deployment
+
+Openamp is required to communicate between secure partitions(running on
+Cortex-A) and trusted-firmware-m(running on Cortex-M).
+These changes are to fetch libmetal and openamp from github repo's
+and build it.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
+diff --git a/deployments/se-proxy/opteesp/CMakeLists.txt b/deployments/se-proxy/opteesp/CMakeLists.txt
+index 2fb4bcc..8591826 100644
+--- a/deployments/se-proxy/opteesp/CMakeLists.txt
++++ b/deployments/se-proxy/opteesp/CMakeLists.txt
+@@ -86,6 +86,7 @@ add_components(TARGET "se-proxy"
+ target_sources(se-proxy PRIVATE
+ 	se_proxy_sp.c
+ 	service_proxy_factory.c
++	lse.S
+ )
+ 
+ #-------------------------------------------------------------------------------
+@@ -95,7 +96,6 @@ target_sources(se-proxy PRIVATE
+ # temporarily force platform - with this change, the build interface to
+ # an external builder such as a Yocto recipe is unchanged.  Should remove
+ # once the build interface is published.
+-set(TS_PLATFORM "arm/fvp/fvp_base_revc-2xaemv8a" CACHE STRING "Overridden" FORCE)
+ 
+ add_platform(TARGET "se-proxy")
+ 
+@@ -110,6 +110,19 @@ include(../../../external/nanopb/nanopb.cmake)
+ target_link_libraries(se-proxy PRIVATE nanopb::protobuf-nanopb-static)
+ protobuf_generate_all(TGT "se-proxy" NAMESPACE "protobuf" BASE_DIR "${TS_ROOT}/protocols")
+ 
++# libmetal
++list(APPEND LIBMETAL_EXTERNAL_INCLUDE_PATHS ${SP_DEV_KIT_INCLUDE_DIR})
++set(LIBMETAL_EXTRA_INCLUDE_PATHS ${LIBMETAL_EXTRA_INCLUDE_PATHS}
++	CACHE STRING "" FORCE)
++include(../../../external/openamp/libmetal.cmake)
++
++# OpenAMP
++list(APPEND OPENAMP_EXTERNAL_INCLUDE_PATHS ${SP_DEV_KIT_INCLUDE_DIR})
++set(OPENAMP_EXTRA_INCLUDE_PATHS ${OPENAMP_EXTRA_INCLUDE_PATHS}
++	CACHE STRING "" FORCE)
++include(../../../external/openamp/openamp.cmake)
++target_link_libraries(se-proxy PRIVATE openamp libmetal)
++
+ #################################################################
+ 
+ target_compile_definitions(se-proxy PRIVATE
+diff --git a/deployments/se-proxy/opteesp/lse.S b/deployments/se-proxy/opteesp/lse.S
+new file mode 100644
+index 0000000..840683a
+--- /dev/null
++++ b/deployments/se-proxy/opteesp/lse.S
+@@ -0,0 +1,19 @@
++// SPDX-License-Identifier: BSD-3-Clause
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ */
++
++.text
++.globl __aarch64_cas4_acq_rel
++
++__aarch64_cas4_acq_rel:
++	mov	w16, w0
++	ldaxr	w0, [x2]
++	cmp	w0, w16
++0:	bne	1f
++
++	stlxr	w17, w1, [x2]
++	cbnz	w17, 0b
++1:	ret
++
++
+diff --git a/external/openamp/libmetal.cmake b/external/openamp/libmetal.cmake
+new file mode 100644
+index 0000000..3a647e6
+--- /dev/null
++++ b/external/openamp/libmetal.cmake
+@@ -0,0 +1,81 @@
++#-------------------------------------------------------------------------------
++# Copyright (c) 2021 Linaro Limited
++# Copyright (c) 2021, Arm Limited. All rights reserved.
++#
++# SPDX-License-Identifier: BSD-3-Clause
++#
++#-------------------------------------------------------------------------------
++
++set (LIBMETAL_URL "https://github.com/OpenAMP/libmetal.git" CACHE STRING "libmetal repository URL")
++set (LIBMETAL_INSTALL_PATH "${CMAKE_CURRENT_BINARY_DIR}/libmetal_install" CACHE PATH "libmetal installation directory")
++set (LIBMETAL_PACKAGE_PATH "${LIBMETAL_INSTALL_PATH}/libmetal/cmake" CACHE PATH "libmetal CMake package directory")
++set (LIBMETAL_TARGET_NAME "libmetal")
++set (LIBMETAL_VERSION "f252f0e007fbfb8b3a52b1d5901250ddac96baad"  CACHE STRING "The version of libmetal to use")
++
++if(NOT LIBMETAL_DEBUG)
++	set(LIBMETAL_BUILD_TYPE "Release")
++else()
++	set(LIBMETAL_BUILD_TYPE "Debug")
++endif()
++
++include(FetchContent)
++
++# Checking git
++find_program(GIT_COMMAND "git")
++if (NOT GIT_COMMAND)
++	message(FATAL_ERROR "Please install git")
++endif()
++
++FetchContent_Declare(
++	libmetal
++	GIT_REPOSITORY ${LIBMETAL_URL}
++	GIT_TAG ${LIBMETAL_VERSION}
++)
++
++# FetchContent_GetProperties exports libmetal_SOURCE_DIR and libmetal_BINARY_DIR variables
++FetchContent_GetProperties(libmetal)
++if(NOT libmetal_POPULATED)
++	message(STATUS "Fetching libmetal")
++	FetchContent_Populate(libmetal)
++endif()
++
++# Ensure list of include paths is separated correctly
++string(REPLACE ";" "\\;" LIBMETAL_EXTERNAL_INCLUDE_PATHS "${LIBMETAL_EXTERNAL_INCLUDE_PATHS}")
++
++#Configure the library
++execute_process(COMMAND
++	${CMAKE_COMMAND}
++			-DCMAKE_BUILD_TYPE=${LIBMETAL_BUILD_TYPE}
++			-DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
++			-DCMAKE_C_COMPILER_ID=${CMAKE_C_COMPILER_ID}
++			-DCMAKE_TOOLCHAIN_FILE=${TS_EXTERNAL_LIB_TOOLCHAIN_FILE}
++			-DCMAKE_INSTALL_PREFIX=${LIBMETAL_INSTALL_PATH}
++			-DCMAKE_C_FLAGS_DEBUG=${CMAKE_C_FLAGS_DEBUG}
++			-DCMAKE_C_FLAGS=${CMAKE_C_FLAGS}
++			-DCMAKE_C_OUTPUT_EXTENSION=.o
++			-DCMAKE_C_COMPILER_WORKS=true
++			-DCMAKE_SYSTEM_PROCESSOR=arm
++			-DWITH_DOC=off
++			-DWITH_TESTS=off
++			-DWITH_EXAMPLES=off
++			-DWITH_DEFAULT_LOGGER=off
++			-DEXTERNAL_INCLUDE_PATHS=${LIBMETAL_EXTERNAL_INCLUDE_PATHS}
++			-DMACHINE=template
++			${libmetal_SOURCE_DIR}
++	WORKING_DIRECTORY
++			${libmetal_BINARY_DIR}
++)
++
++# Build the library
++execute_process(COMMAND
++    ${CMAKE_COMMAND} --build ${libmetal_BINARY_DIR} -- install
++		RESULT_VARIABLE _exec_error
++	)
++if (_exec_error)
++	message(FATAL_ERROR "Build step of libmetal failed with ${_exec_error}.")
++endif()
++
++#Create an imported target to have clean abstraction in the build-system.
++add_library(libmetal STATIC IMPORTED)
++set_property(TARGET libmetal PROPERTY IMPORTED_LOCATION "${LIBMETAL_INSTALL_PATH}/lib/${CMAKE_STATIC_LIBRARY_PREFIX}metal${CMAKE_STATIC_LIBRARY_SUFFIX}")
++set_property(TARGET libmetal PROPERTY INTERFACE_INCLUDE_DIRECTORIES "${LIBMETAL_INSTALL_PATH}/include")
+diff --git a/external/openamp/openamp.cmake b/external/openamp/openamp.cmake
+new file mode 100644
+index 0000000..aae13ba
+--- /dev/null
++++ b/external/openamp/openamp.cmake
+@@ -0,0 +1,82 @@
++#-------------------------------------------------------------------------------
++# Copyright (c) 2021 Linaro Limited
++# Copyright (c) 2021, Arm Limited. All rights reserved.
++#
++# SPDX-License-Identifier: BSD-3-Clause
++#
++#-------------------------------------------------------------------------------
++
++set (OPENAMP_URL "https://github.com/OpenAMP/open-amp.git" CACHE STRING "OpenAMP repository URL")
++set (OPENAMP_INSTALL_PATH "${CMAKE_CURRENT_BINARY_DIR}/openamp_install" CACHE PATH "OpenAMP installation directory")
++set (OPENAMP_PACKAGE_PATH "${OPENAMP_INSTALL_PATH}/openamp/cmake" CACHE PATH "OpenAMP CMake package directory")
++set (OPENAMP_TARGET_NAME "openamp")
++set (OPENAMP_VERSION "347397decaa43372fc4d00f965640ebde042966d"  CACHE STRING "The version of openamp to use")
++
++
++if(NOT OPENAMP_DEBUG)
++	set(OPENAMP_BUILD_TYPE "Release")
++else()
++	set(OPENAMP_BUILD_TYPE "Debug")
++endif()
++
++include(FetchContent)
++
++# Checking git
++find_program(GIT_COMMAND "git")
++if (NOT GIT_COMMAND)
++	message(FATAL_ERROR "Please install git")
++endif()
++
++FetchContent_Declare(
++	openamp
++	GIT_REPOSITORY ${OPENAMP_URL}
++	GIT_TAG ${OPENAMP_VERSION}
++)
++
++# FetchContent_GetProperties exports openamp_SOURCE_DIR and openamp_BINARY_DIR variables
++FetchContent_GetProperties(openamp)
++if(NOT openamp_POPULATED)
++	message(STATUS "Fetching openamp")
++	FetchContent_Populate(openamp)
++endif()
++
++# Ensure list of include paths is separated correctly
++get_target_property(_libmetal_inc libmetal INTERFACE_INCLUDE_DIRECTORIES)
++set (_openam_external_include_paths ${_libmetal_inc} ${OPENAMP_EXTERNAL_INCLUDE_PATHS})
++string(REPLACE ";" "\\;" OPENAMP_EXTERNAL_INCLUDE_PATHS "${_openam_external_include_paths}")
++
++#Configure the library
++execute_process(COMMAND
++	${CMAKE_COMMAND}
++			-DCMAKE_BUILD_TYPE=${OPENAMP_BUILD_TYPE}
++			-DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
++			-DCMAKE_C_COMPILER_ID=${CMAKE_C_COMPILER_ID}
++			-DCMAKE_TOOLCHAIN_FILE=${TS_EXTERNAL_LIB_TOOLCHAIN_FILE}
++			-DCMAKE_INSTALL_PREFIX=${OPENAMP_INSTALL_PATH}
++			-DCMAKE_C_FLAGS_DEBUG=${CMAKE_C_FLAGS_DEBUG}
++			-DLIBMETAL_INCLUDE_DIR=${CMAKE_CURRENT_BINARY_DIR}/libmetal/lib/include
++			-DLIBMETAL_LIB=${CMAKE_CURRENT_BINARY_DIR}/libmetal/lib
++			-DCMAKE_C_OUTPUT_EXTENSION=.o
++			-DCMAKE_C_COMPILER_WORKS=true
++			-DCMAKE_SYSTEM_PROCESSOR=arm
++			-DEXTERNAL_INCLUDE_PATHS=${OPENAMP_EXTERNAL_INCLUDE_PATHS}
++			-DMACHINE=template
++			-DRPMSG_BUFFER_SIZE=512
++			${openamp_SOURCE_DIR}
++	WORKING_DIRECTORY
++			${openamp_BINARY_DIR}
++)
++
++# Build the library
++execute_process(COMMAND
++    ${CMAKE_COMMAND} --build ${openamp_BINARY_DIR} -- install
++		RESULT_VARIABLE _exec_error
++	)
++if (_exec_error)
++	message(FATAL_ERROR "Build step of OpenAMP failed with ${_exec_error}.")
++endif()
++
++#Create an imported target to have clean abstraction in the build-system.
++add_library(openamp STATIC IMPORTED)
++set_property(TARGET openamp PROPERTY IMPORTED_LOCATION "${OPENAMP_INSTALL_PATH}/lib/${CMAKE_STATIC_LIBRARY_PREFIX}open_amp${CMAKE_STATIC_LIBRARY_SUFFIX}")
++set_property(TARGET openamp PROPERTY INTERFACE_INCLUDE_DIRECTORIES "${OPENAMP_INSTALL_PATH}/include")
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
index 36e2da4..04bde3c 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
@@ -3,17 +3,21 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/secure-partitions:"
 COMPATIBLE_MACHINE = "corstone1000"
 
 LIC_FILES_CHKSUM += "file://../mbedcrypto/LICENSE;md5=302d50a6369f5f22efdb674db908167a \
-                                             file://../nanopb/LICENSE.txt;md5=9db4b73a55a3994384112efcdb37c01f"
+                                             file://../nanopb/LICENSE.txt;md5=9db4b73a55a3994384112efcdb37c01f \
+                                             file://../openamp/LICENSE.md;md5=a8d8cf662ef6bf9936a1e1413585ecbf \
+					     file://../libmetal/LICENSE.md;md5=fe0b8a4beea8f0813b606d15a3df3d3c \
+                                             "
 
 
 SRC_URI:append = " \
-                 ${SRC_URI_MBED} ${SRC_URI_NANOPB} \
+                 ${SRC_URI_MBED} ${SRC_URI_NANOPB} ${SRC_URI_OPENAMP} ${SRC_URI_LIBMETAL} \
                   file://0001-tools-cmake-common-applying-lowercase-project-convention.patch \
                   file://0002-fix-EARLY_TA_PATHS-env-variable.patch \
                   file://0003-se-proxy-dts-add-se-proxy-as-child-node.patch \
                   file://0004-Update-mm-comm-buffer-region-in-dts-file.patch \
                   file://0005-Configure-NV-storage-macro.patch \
                   file://0006-Use-device-region.patch \
+                  file://0007-Add-openamp-to-SE-proxy-deployment.patch \
 		  "
 
 SRCREV_ts = "882a2db4f9181fc6ddb505b82262f82e5a0c2fd5"
@@ -24,6 +28,12 @@ SRCREV_mbed = "cf4a40ba0a3086cabb5a8227245191161fd26383"
 SRC_URI_NANOPB = "git://github.com/nanopb/nanopb.git;name=nanopb;protocol=https;branch=master;destsuffix=git/nanopb"
 SRCREV_nanopb = "df0e92f474f9cca704fe2b31483f0b4d1b1715a4"
 
+SRC_URI_OPENAMP = "git://github.com/OpenAMP/open-amp.git;name=openamp;protocol=https;branch=master;destsuffix=git/openamp"
+SRCREV_openamp = "347397decaa43372fc4d00f965640ebde042966d"
+
+SRC_URI_LIBMETAL = "git://github.com/OpenAMP/libmetal.git;name=libmetal;protocol=https;branch=main;destsuffix=git/libmetal"
+SRCREV_libmetal = "f252f0e007fbfb8b3a52b1d5901250ddac96baad"
+
 TS_PLATFORM = "arm/fvp/fvp_base_revc-2xaemv8a"
 TS_ENVIRONMENT = "opteesp"
 SP_PACKAGING_METHOD = "embedded"
-- 
2.17.1


