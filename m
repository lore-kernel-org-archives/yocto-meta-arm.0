Return-Path: <rui.silva@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5FAAC43217
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 21:01:58 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.1782.1666040514511086231
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 17 Oct 2022 14:01:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=KQmsBR7c;
 spf=pass (domain: linaro.org, ip: 209.85.221.52, mailfrom: rui.silva@linaro.org)
Received: by mail-wr1-f52.google.com with SMTP id w18so20385825wro.7
        for <meta-arm@lists.yoctoproject.org>; Mon, 17 Oct 2022 14:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNKC2l98rBxnPDtVnODo1KOqc8XbZjcQ4BZ+c//vxM4=;
        b=KQmsBR7cITZ3L9ZYh0s0xCLK9vktq9Wkfwy+qtgyDDHkGXdoac5JyzZl8tGEwfZSl3
         LfM/aTDn4zlBBWnQnrY+I5dV/kE2rnXvFb+am8VqTmBgTJp6w8npZKX8Xi7jEY1lSsQU
         LQpiQCcApvQeUjOb5av4rG5DmF5b+IJFIP3tCV6cfgUHQjKR0VHJvz3LACrjLGfSC1rZ
         /4WsTJgvhj8tgUgArC0vf808e1mIii8Xji1t2urw9v3+S0JqQNH6wuGHkx2M+EtCq9N9
         JWQZdga+9jjHb70t27bfe+bl5ICSuQDr+3mak3cNeKOB83zNms35CSutQ8Z76sYUP6LP
         q37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zNKC2l98rBxnPDtVnODo1KOqc8XbZjcQ4BZ+c//vxM4=;
        b=ePGv3FRMQsVpmAKM4zK/24BR6nK+80AHxL0/rI1JAu64eZ6n3KqfTx8/9sdwuUglqX
         XhFo1k76q2WNiUP6wL5yK/IpentSDQ+GBA41/qkyLpPKUJtcTaeC6jIcrgUW26RJ/g33
         jCjyX3JmDDwCGdmZHSFqUAr9EtqLM0HwgdQIxD3Kl+jKPblBoxFbuw7XSmJbIyc+X6Pu
         qtWs2wUl+p/PldJmxTMTVm13nlNvxdqwLaW7+QEaEsALw0WUzyx4OljDGC+LnUgHyNm4
         4g/U+BGo49u/zcRtzTyYHAahtknO74X4F/emOle1HCSGBALoby56OmwKH+y9c6ehag/D
         ltZQ==
X-Gm-Message-State: ACrzQf35CYZwUFJzfD8FKPbO3t/SaeAtR8HzrZy95mCtXyespUGCuUVl
	2o+am2ILfF9PRxjAxqdtdTV6b7astL0N/A==
X-Google-Smtp-Source: AMsMyM4g/yQBV7jKDu4q9MbQj9e2vvS82I60SLCfZMy4539CjrE28NXTJAWp4FafBqO3cfwct6o6xg==
X-Received: by 2002:a05:6000:15ce:b0:230:a14d:997b with SMTP id y14-20020a05600015ce00b00230a14d997bmr7428262wry.370.1666040510577;
        Mon, 17 Oct 2022 14:01:50 -0700 (PDT)
Received: from arch-thunder.local (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id j19-20020a05600c1c1300b003c6c1686b10sm18091805wms.7.2022.10.17.14.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 14:01:50 -0700 (PDT)
From: Rui Miguel Silva <rui.silva@linaro.org>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 2/2] arm-bsp/trusted-services: support for libmetal and openamp
Date: Mon, 17 Oct 2022 22:01:36 +0100
Message-Id: <20221017210136.352276-3-rui.silva@linaro.org>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221017210136.352276-1-rui.silva@linaro.org>
References: <20221017210136.352276-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 17 Oct 2022 21:01:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3977

Add support for libmetal and openamp as backend for se-proxy
and smm-gateway SP. For that also introduce a change to newlib
in memcpy optimization to avoid unaligned data-aborts in
__packed structures handling.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 ...1-Add-openamp-to-SE-proxy-deployment.patch |  287 ++
 ...ver-and-the-OpenAmp-conversion-laye.patch} |   76 +-
 .../0003-Add-openamp-rpc-caller.patch         | 1196 ++++++++
 ...-add-psa-client-definitions-for-ff-m.patch |  298 ++
 ...mon-service-component-to-ipc-support.patch |  295 ++
 .../0006-Add-secure-storage-ipc-backend.patch |  523 ++++
 ...storage-ipc-and-openamp-for-se_proxy.patch |   63 +
 .../corstone1000/0008-Run-psa-arch-test.patch |   72 +
 ...0009-Use-address-instead-of-pointers.patch |  168 ++
 ...-Add-psa-ipc-attestation-to-se-proxy.patch |  266 ++
 ...d-as-openamp-rpc-using-secure-storag.patch |  163 ++
 .../0012-add-psa-ipc-crypto-backend.patch     | 2584 +++++++++++++++++
 ...ub-capsule-update-service-components.patch |  436 +++
 .../0014-Configure-storage-size.patch         |   42 +
 ...face-structure-aligned-with-tf-m-cha.patch |   31 +
 ...egrate-remaining-psa-ipc-client-APIs.patch |  494 ++++
 ...et_key_usage_flags-definition-to-the.patch |   40 +
 ...-in-AEAD-for-psa-arch-test-54-and-58.patch |  120 +
 ...rstone1000-change-default-smm-values.patch |   37 +
 ...corstone1000-platform-to-drivers-arm.patch |   36 -
 ...wlib-memcpy-remove-optimized-version.patch |  210 ++
 .../trusted-services/ts-corstone1000.inc      |   27 +-
 .../trusted-services/ts-newlib_%.bbappend     |    6 +
 .../trusted-services/trusted-services-src.inc |   12 +
 24 files changed, 7418 insertions(+), 64 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0001-Add-openamp-to-SE-proxy-deployment.patch
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0027-Add-MHU-driver.patch => 0002-Implement-mhu-driver-and-the-OpenAmp-conversion-laye.patch} (94%)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0003-Add-openamp-rpc-caller.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0004-add-psa-client-definitions-for-ff-m.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0005-Add-common-service-component-to-ipc-support.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0006-Add-secure-storage-ipc-backend.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0007-Use-secure-storage-ipc-and-openamp-for-se_proxy.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0008-Run-psa-arch-test.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0009-Use-address-instead-of-pointers.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0010-Add-psa-ipc-attestation-to-se-proxy.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0011-Setup-its-backend-as-openamp-rpc-using-secure-storag.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0012-add-psa-ipc-crypto-backend.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0013-Add-stub-capsule-update-service-components.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0014-Configure-storage-size.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0015-Fix-Crypto-interface-structure-aligned-with-tf-m-cha.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0016-Integrate-remaining-psa-ipc-client-APIs.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0017-Fix-update-psa_set_key_usage_flags-definition-to-the.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0018-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0019-plat-corstone1000-change-default-smm-values.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0026-plat-add-corstone1000-platform-to-drivers-arm.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/ts-newlib/0001-newlib-memcpy-remove-optimized-version.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/ts-newlib_%.bbappend

diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0001-Add-openamp-to-SE-proxy-deployment.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0001-Add-openamp-to-SE-proxy-deployment.patch
new file mode 100644
index 000000000000..801905d97a11
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0001-Add-openamp-to-SE-proxy-deployment.patch
@@ -0,0 +1,287 @@
+From 7c9589c4bb056db5e1696f2a777891ab235b1b63 Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Fri, 3 Dec 2021 16:36:51 +0000
+Subject: [PATCH 01/19] Add openamp to SE proxy deployment
+
+Openamp is required to communicate between secure partitions(running on
+Cortex-A) and trusted-firmware-m(running on Cortex-M).
+These changes are to fetch libmetal and openamp from github repo's
+and build it.
+
+Upstream-Status: Pending
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ deployments/se-proxy/opteesp/lse.S            | 28 ++++++++
+ deployments/se-proxy/se-proxy.cmake           |  8 +++
+ external/openamp/libmetal-init-cache.cmake.in | 20 ++++++
+ external/openamp/libmetal.cmake               | 67 +++++++++++++++++++
+ external/openamp/openamp-init-cache.cmake.in  | 20 ++++++
+ external/openamp/openamp.cmake                | 66 ++++++++++++++++++
+ 6 files changed, 209 insertions(+)
+ create mode 100644 deployments/se-proxy/opteesp/lse.S
+ create mode 100644 external/openamp/libmetal-init-cache.cmake.in
+ create mode 100644 external/openamp/libmetal.cmake
+ create mode 100644 external/openamp/openamp-init-cache.cmake.in
+ create mode 100644 external/openamp/openamp.cmake
+
+diff --git a/deployments/se-proxy/opteesp/lse.S b/deployments/se-proxy/opteesp/lse.S
+new file mode 100644
+index 000000000000..8e466d65fc2b
+--- /dev/null
++++ b/deployments/se-proxy/opteesp/lse.S
+@@ -0,0 +1,28 @@
++// SPDX-License-Identifier: BSD-3-Clause
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ */
++
++.text
++.globl __aarch64_cas4_acq_rel
++.globl __aarch64_cas4_sync
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
++__aarch64_cas4_sync:
++	mov	w16, w0
++	ldxr	w0, [x2]
++	cmp	w0, w16
++0:	bne	1f
++
++	stlxr	w17, w1, [x2]
++	cbnz	w17, 0b
++1:	ret
+diff --git a/deployments/se-proxy/se-proxy.cmake b/deployments/se-proxy/se-proxy.cmake
+index 426c66c05350..d39873a0fe81 100644
+--- a/deployments/se-proxy/se-proxy.cmake
++++ b/deployments/se-proxy/se-proxy.cmake
+@@ -61,6 +61,7 @@ add_components(TARGET "se-proxy"
+ target_sources(se-proxy PRIVATE
+ 	${CMAKE_CURRENT_LIST_DIR}/common/se_proxy_sp.c
+ 	${CMAKE_CURRENT_LIST_DIR}/common/service_proxy_factory.c
++	${CMAKE_CURRENT_LIST_DIR}/opteesp/lse.S
+ )
+ 
+ #-------------------------------------------------------------------------------
+@@ -73,6 +74,13 @@ include(../../../external/nanopb/nanopb.cmake)
+ target_link_libraries(se-proxy PRIVATE nanopb::protobuf-nanopb-static)
+ protobuf_generate_all(TGT "se-proxy" NAMESPACE "protobuf" BASE_DIR "${TS_ROOT}/protocols")
+ 
++# libmetal
++include(../../../external/openamp/libmetal.cmake)
++
++# OpenAMP
++include(../../../external/openamp/openamp.cmake)
++target_link_libraries(se-proxy PRIVATE openamp libmetal)
++
+ #################################################################
+ 
+ target_include_directories(se-proxy PRIVATE
+diff --git a/external/openamp/libmetal-init-cache.cmake.in b/external/openamp/libmetal-init-cache.cmake.in
+new file mode 100644
+index 000000000000..04c25fbde960
+--- /dev/null
++++ b/external/openamp/libmetal-init-cache.cmake.in
+@@ -0,0 +1,20 @@
++#-------------------------------------------------------------------------------
++# Copyright (c) 2021-2022, Arm Limited and Contributors. All rights reserved.
++# Copyright (c) 2021-2022, Linaro. All rights reserved.
++#
++# SPDX-License-Identifier: BSD-3-Clause
++#
++#-------------------------------------------------------------------------------
++
++set(CMAKE_INSTALL_PREFIX "@BUILD_INSTALL_DIR@" CACHE STRING "")
++set(CMAKE_TOOLCHAIN_FILE "@TS_EXTERNAL_LIB_TOOLCHAIN_FILE@" CACHE STRING "")
++set(BUILD_SHARED_LIBS Off CACHE BOOL "")
++set(BUILD_STATIC_LIBS On CACHE BOOL "")
++
++set(WITH_DOC OFF CACHE BOOL "")
++set(WITH_TESTS OFF CACHE BOOL "")
++set(WITH_EXAMPLES OFF CACHE BOOL "")
++set(WITH_DEFAULT_LOGGER OFF CACHE BOOL "")
++set(MACHINE "template" CACHE STRING "")
++
++@_cmake_fragment@
+diff --git a/external/openamp/libmetal.cmake b/external/openamp/libmetal.cmake
+new file mode 100644
+index 000000000000..6e5004ff555c
+--- /dev/null
++++ b/external/openamp/libmetal.cmake
+@@ -0,0 +1,67 @@
++#-------------------------------------------------------------------------------
++# Copyright (c) 2022 Linaro Limited
++# Copyright (c) 2022, Arm Limited. All rights reserved.
++#
++# SPDX-License-Identifier: BSD-3-Clause
++#
++#-------------------------------------------------------------------------------
++
++set (LIBMETAL_URL "https://github.com/OpenAMP/libmetal.git"
++		    CACHE STRING "libmetal repository URL")
++set (LIBMETAL_INSTALL_DIR "${CMAKE_CURRENT_BINARY_DIR}/libmetal_install"
++		    CACHE DIR "libmetal installation directory")
++set(LIBMETAL_SOURCE_DIR "${CMAKE_CURRENT_BINARY_DIR}/_deps/libmetal"
++		CACHE DIR "libmetal source-code")
++set (LIBMETAL_PACKAGE_DIR "${LIBMETAL_INSTALL_DIR}/libmetal/cmake"
++			    CACHE DIR "libmetal CMake package directory")
++set (LIBMETAL_TARGET_NAME "libmetal")
++set (LIBMETAL_REFSPEC "f252f0e007fbfb8b3a52b1d5901250ddac96baad"
++			CACHE STRING "The version of libmetal to use")
++set(LIBMETAL_BINARY_DIR "${CMAKE_CURRENT_BINARY_DIR}/_deps/libmetal-build")
++
++set(GIT_OPTIONS
++    GIT_REPOSITORY ${LIBMETAL_URL}
++    GIT_TAG ${LIBMETAL_REFSPEC}
++    GIT_SHALLOW FALSE
++)
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
++# Only pass libc settings to libmetal if needed. For environments where the
++# standard library is not overridden, this is not needed.
++if(TARGET stdlib::c)
++	include(${TS_ROOT}/tools/cmake/common/PropertyCopy.cmake)
++
++	# Save libc settings
++	save_interface_target_properties(TGT stdlib::c PREFIX LIBC)
++	# Translate libc settings to cmake code fragment. Will be inserted into
++	# libmetal-init-cache.cmake.in when LazyFetch configures the file.
++	translate_interface_target_properties(PREFIX LIBC RES _cmake_fragment)
++	unset_saved_properties(LIBC)
++endif()
++
++include(${TS_ROOT}/tools/cmake/common/LazyFetch.cmake REQUIRED)
++LazyFetch_MakeAvailable(DEP_NAME libmetal
++    FETCH_OPTIONS "${GIT_OPTIONS}"
++    INSTALL_DIR "${LIBMETAL_INSTALL_DIR}"
++    CACHE_FILE "${TS_ROOT}/external/openamp/libmetal-init-cache.cmake.in"
++    SOURCE_DIR "${LIBMETAL_SOURCE_DIR}"
++)
++unset(_cmake_fragment)
++
++#Create an imported target to have clean abstraction in the build-system.
++add_library(libmetal STATIC IMPORTED)
++set_property(TARGET libmetal PROPERTY IMPORTED_LOCATION "${LIBMETAL_INSTALL_DIR}/lib/${CMAKE_STATIC_LIBRARY_PREFIX}metal${CMAKE_STATIC_LIBRARY_SUFFIX}")
++set_property(TARGET libmetal PROPERTY INTERFACE_INCLUDE_DIRECTORIES "${LIBMETAL_INSTALL_DIR}/include")
+diff --git a/external/openamp/openamp-init-cache.cmake.in b/external/openamp/openamp-init-cache.cmake.in
+new file mode 100644
+index 000000000000..302b80511bce
+--- /dev/null
++++ b/external/openamp/openamp-init-cache.cmake.in
+@@ -0,0 +1,20 @@
++#-------------------------------------------------------------------------------
++# Copyright (c) 2021-2022, Arm Limited and Contributors. All rights reserved.
++# Copyright (c) 2021-2022, Linaro. All rights reserved.
++#
++# SPDX-License-Identifier: BSD-3-Clause
++#
++#-------------------------------------------------------------------------------
++
++set(CMAKE_INSTALL_PREFIX "@BUILD_INSTALL_DIR@" CACHE STRING "")
++set(CMAKE_TOOLCHAIN_FILE "@TS_EXTERNAL_LIB_TOOLCHAIN_FILE@" CACHE STRING "")
++set(BUILD_SHARED_LIBS Off CACHE BOOL "")
++set(BUILD_STATIC_LIBS On CACHE BOOL "")
++
++set(LIBMETAL_INCLUDE_DIR "@CMAKE_CURRENT_BINARY_DIR@/libmetal_install/include" CACHE
++    STRING "")
++set(LIBMETAL_LIB "@CMAKE_CURRENT_BINARY_DIR@/libmetal_install/lib" CACHE STRING "")
++set(RPMSG_BUFFER_SIZE "512" CACHE STRING "")
++set(MACHINE "template" CACHE STRING "")
++
++@_cmake_fragment@
+diff --git a/external/openamp/openamp.cmake b/external/openamp/openamp.cmake
+new file mode 100644
+index 000000000000..449f35f4fda4
+--- /dev/null
++++ b/external/openamp/openamp.cmake
+@@ -0,0 +1,66 @@
++#-------------------------------------------------------------------------------
++# Copyright (c) 2022 Linaro Limited
++# Copyright (c) 2022, Arm Limited. All rights reserved.
++#
++# SPDX-License-Identifier: BSD-3-Clause
++#
++#-------------------------------------------------------------------------------
++
++set (OPENAMP_URL "https://github.com/OpenAMP/open-amp.git"
++		    CACHE STRING "OpenAMP repository URL")
++set (OPENAMP_INSTALL_DIR "${CMAKE_CURRENT_BINARY_DIR}/openamp_install"
++			    CACHE DIR "OpenAMP installation directory")
++set (OPENAMP_SOURCE_DIR "${CMAKE_CURRENT_BINARY_DIR}/_deps/openamp"
++			    CACHE DIR "OpenAMP source code directory")
++set (OPENAMP_PACKAGE_DIR "${OPENAMP_INSTALL_DIR}/openamp/cmake"
++			    CACHE DIR "OpenAMP CMake package directory")
++set (OPENAMP_TARGET_NAME "openamp")
++set (OPENAMP_REFSPEC "347397decaa43372fc4d00f965640ebde042966d"
++			CACHE STRING "The version of openamp to use")
++
++set(GIT_OPTIONS
++    GIT_REPOSITORY ${OPENAMP_URL}
++    GIT_TAG ${OPENAMP_REFSPEC}
++    GIT_SHALLOW FALSE
++)
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
++# Only pass libc settings to openamp if needed. For environments where the
++# standard library is not overridden, this is not needed.
++if(TARGET stdlib::c)
++	include(${TS_ROOT}/tools/cmake/common/PropertyCopy.cmake)
++
++	# Save libc settings
++	save_interface_target_properties(TGT stdlib::c PREFIX LIBC)
++	# Translate libc settings to cmake code fragment. Will be inserted into
++	# libmetal-init-cache.cmake.in when LazyFetch configures the file.
++	translate_interface_target_properties(PREFIX LIBC RES _cmake_fragment)
++	unset_saved_properties(LIBC)
++endif()
++
++include(${TS_ROOT}/tools/cmake/common/LazyFetch.cmake REQUIRED)
++LazyFetch_MakeAvailable(DEP_NAME openamp
++    FETCH_OPTIONS "${GIT_OPTIONS}"
++    INSTALL_DIR "${OPENAMP_INSTALL_DIR}"
++    CACHE_FILE "${TS_ROOT}/external/openamp/openamp-init-cache.cmake.in"
++    SOURCE_DIR "${OPENAMP_SOURCE_DIR}"
++)
++unset(_cmake_fragment)
++
++#Create an imported target to have clean abstraction in the build-system.
++add_library(openamp STATIC IMPORTED)
++set_property(TARGET openamp PROPERTY IMPORTED_LOCATION "${OPENAMP_INSTALL_DIR}/lib/${CMAKE_STATIC_LIBRARY_PREFIX}open_amp${CMAKE_STATIC_LIBRARY_SUFFIX}")
++set_property(TARGET openamp PROPERTY INTERFACE_INCLUDE_DIRECTORIES "${OPENAMP_INSTALL_DIR}/include")
+-- 
+2.38.0
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0027-Add-MHU-driver.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0002-Implement-mhu-driver-and-the-OpenAmp-conversion-laye.patch
similarity index 94%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0027-Add-MHU-driver.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/0002-Implement-mhu-driver-and-the-OpenAmp-conversion-laye.patch
index 77be7f3573ff..39edc9d1e39d 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0027-Add-MHU-driver.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0002-Implement-mhu-driver-and-the-OpenAmp-conversion-laye.patch
@@ -1,27 +1,55 @@
-From 9e6f16c236fbf5d8631ebc53a79c80b85042b736 Mon Sep 17 00:00:00 2001
+From e4ccb92f8de94a82edd3548d62c853790ae36bd1 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Tue, 27 Sep 2022 18:47:36 +0100
-Subject: [PATCH 27/27] Add MHU driver
+Date: Fri, 3 Dec 2021 18:00:46 +0000
+Subject: [PATCH 02/19] Implement mhu driver and the OpenAmp conversion layer.
 
-This change is to add MHU driver. This is required to communicate
-between cortex-A and cortex-M
+This commit adds an mhu driver (v2.1 and v2) to the secure
+partition se_proxy and a conversion layer to communicate with
+the secure enclave using OpenAmp.
 
+Upstream-Status: Pending
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
+ .../se-proxy/opteesp/default_se-proxy.dts.in  |  16 +
  .../drivers/arm/mhu_driver/component.cmake    |  12 +
  platform/drivers/arm/mhu_driver/mhu_v2.h      | 391 ++++++++++++
  platform/drivers/arm/mhu_driver/mhu_v2_x.c    | 602 ++++++++++++++++++
- .../providers/arm/corstone1000/platform.cmake |   3 +
- 4 files changed, 1008 insertions(+)
+ .../providers/arm/corstone1000/platform.cmake |  10 +
+ 5 files changed, 1031 insertions(+)
  create mode 100644 platform/drivers/arm/mhu_driver/component.cmake
  create mode 100644 platform/drivers/arm/mhu_driver/mhu_v2.h
  create mode 100644 platform/drivers/arm/mhu_driver/mhu_v2_x.c
+ create mode 100644 platform/providers/arm/corstone1000/platform.cmake
 
+diff --git a/deployments/se-proxy/opteesp/default_se-proxy.dts.in b/deployments/se-proxy/opteesp/default_se-proxy.dts.in
+index 5748d2f80f88..267b4f923540 100644
+--- a/deployments/se-proxy/opteesp/default_se-proxy.dts.in
++++ b/deployments/se-proxy/opteesp/default_se-proxy.dts.in
+@@ -17,4 +17,20 @@
+ 	xlat-granule = <0>; /* 4KiB */
+ 	messaging-method = <3>; /* Direct messaging only */
+ 	legacy-elf-format = <1>;
++
++	device-regions {
++		compatible = "arm,ffa-manifest-device-regions";
++		mhu-sender {
++			/* Armv8 A Foundation Platform values */
++			base-address = <0x00000000 0x1b820000>;
++			pages-count = <16>;
++			attributes = <0x3>; /* read-write */
++		};
++		mhu-receiver {
++			/* Armv8 A Foundation Platform values */
++			base-address = <0x00000000 0x1b830000>;
++			pages-count = <16>;
++			attributes = <0x3>; /* read-write */
++		};
++	};
+ };
 diff --git a/platform/drivers/arm/mhu_driver/component.cmake b/platform/drivers/arm/mhu_driver/component.cmake
 new file mode 100644
-index 00000000..77a5a50b
+index 000000000000..77a5a50b67d1
 --- /dev/null
 +++ b/platform/drivers/arm/mhu_driver/component.cmake
 @@ -0,0 +1,12 @@
@@ -39,7 +67,7 @@ index 00000000..77a5a50b
 +)
 diff --git a/platform/drivers/arm/mhu_driver/mhu_v2.h b/platform/drivers/arm/mhu_driver/mhu_v2.h
 new file mode 100644
-index 00000000..2e4ba80f
+index 000000000000..2e4ba80fab95
 --- /dev/null
 +++ b/platform/drivers/arm/mhu_driver/mhu_v2.h
 @@ -0,0 +1,391 @@
@@ -436,7 +464,7 @@ index 00000000..2e4ba80f
 +#endif /* __MHU_V2_X_H__ */
 diff --git a/platform/drivers/arm/mhu_driver/mhu_v2_x.c b/platform/drivers/arm/mhu_driver/mhu_v2_x.c
 new file mode 100644
-index 00000000..01d8f659
+index 000000000000..01d8f659a73a
 --- /dev/null
 +++ b/platform/drivers/arm/mhu_driver/mhu_v2_x.c
 @@ -0,0 +1,602 @@
@@ -1043,19 +1071,21 @@ index 00000000..01d8f659
 +    return MHU_V_2_X_ERR_GENERAL;
 +}
 diff --git a/platform/providers/arm/corstone1000/platform.cmake b/platform/providers/arm/corstone1000/platform.cmake
-index 14a9f6b0..df9cab71 100644
---- a/platform/providers/arm/corstone1000/platform.cmake
+new file mode 100644
+index 000000000000..bb778bb9719b
+--- /dev/null
 +++ b/platform/providers/arm/corstone1000/platform.cmake
-@@ -6,6 +6,9 @@
- # Platform definition for the corstone1000 platform.
- #-------------------------------------------------------------------------------
- 
+@@ -0,0 +1,10 @@
++#-------------------------------------------------------------------------------
++# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++#
++# SPDX-License-Identifier: BSD-3-Clause
++#
++# Platform definition for the 'fvp_base_revc-2xaem8a' virtual platform.
++#-------------------------------------------------------------------------------
++
 +# include MHU driver
 +include(${TS_ROOT}/platform/drivers/arm/mhu_driver/component.cmake)
-+
- target_compile_definitions(${TGT} PRIVATE
- 	SMM_GATEWAY_NV_STORE_SN="sn:ffa:46bb39d1-b4d9-45b5-88ff-040027dab249:1"
- )
 -- 
-2.17.1
+2.38.0
 
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0003-Add-openamp-rpc-caller.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0003-Add-openamp-rpc-caller.patch
new file mode 100644
index 000000000000..bf52a2382bd1
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0003-Add-openamp-rpc-caller.patch
@@ -0,0 +1,1196 @@
+From e187510a814b48b7b2e477a9913ee35b68522d06 Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Fri, 3 Dec 2021 19:00:54 +0000
+Subject: [PATCH 03/19] Add openamp rpc caller
+
+Upstream-Status: Pending
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ components/rpc/common/caller/rpc_caller.c     |  10 +
+ components/rpc/common/interface/rpc_caller.h  |   8 +
+ .../rpc/openamp/caller/sp/component.cmake     |  15 +
+ .../rpc/openamp/caller/sp/openamp_caller.c    | 203 +++++++
+ .../rpc/openamp/caller/sp/openamp_caller.h    |  43 ++
+ .../rpc/openamp/caller/sp/openamp_mhu.c       | 191 ++++++
+ .../rpc/openamp/caller/sp/openamp_mhu.h       |  19 +
+ .../rpc/openamp/caller/sp/openamp_virtio.c    | 555 ++++++++++++++++++
+ .../rpc/openamp/caller/sp/openamp_virtio.h    |  24 +
+ .../se-proxy/opteesp/default_se-proxy.dts.in  |   6 +
+ deployments/se-proxy/se-proxy.cmake           |   1 +
+ 11 files changed, 1075 insertions(+)
+ create mode 100644 components/rpc/openamp/caller/sp/component.cmake
+ create mode 100644 components/rpc/openamp/caller/sp/openamp_caller.c
+ create mode 100644 components/rpc/openamp/caller/sp/openamp_caller.h
+ create mode 100644 components/rpc/openamp/caller/sp/openamp_mhu.c
+ create mode 100644 components/rpc/openamp/caller/sp/openamp_mhu.h
+ create mode 100644 components/rpc/openamp/caller/sp/openamp_virtio.c
+ create mode 100644 components/rpc/openamp/caller/sp/openamp_virtio.h
+
+diff --git a/components/rpc/common/caller/rpc_caller.c b/components/rpc/common/caller/rpc_caller.c
+index 2dceabeb8967..20d889c162b0 100644
+--- a/components/rpc/common/caller/rpc_caller.c
++++ b/components/rpc/common/caller/rpc_caller.c
+@@ -37,3 +37,13 @@ void rpc_caller_end(struct rpc_caller *s, rpc_call_handle handle)
+ {
+ 	s->call_end(s->context, handle);
+ }
++
++void *rpc_caller_virt_to_phys(struct rpc_caller *s, void *va)
++{
++	return s->virt_to_phys(s->context, va);
++}
++
++void *rpc_caller_phys_to_virt(struct rpc_caller *s, void *pa)
++{
++	return s->phys_to_virt(s->context, pa);
++}
+diff --git a/components/rpc/common/interface/rpc_caller.h b/components/rpc/common/interface/rpc_caller.h
+index 387489cdb1b2..ef9bb64905ed 100644
+--- a/components/rpc/common/interface/rpc_caller.h
++++ b/components/rpc/common/interface/rpc_caller.h
+@@ -45,6 +45,10 @@ struct rpc_caller
+ 		     	rpc_opstatus_t *opstatus, uint8_t **resp_buf, size_t *resp_len);
+ 
+ 	void (*call_end)(void *context, rpc_call_handle handle);
++
++	void *(*virt_to_phys)(void *context, void *va);
++
++	void *(*phys_to_virt)(void *context, void *pa);
+ };
+ 
+ /*
+@@ -87,6 +91,10 @@ RPC_CALLER_EXPORTED rpc_status_t rpc_caller_invoke(struct rpc_caller *s, rpc_cal
+  */
+ RPC_CALLER_EXPORTED void rpc_caller_end(struct rpc_caller *s, rpc_call_handle handle);
+ 
++RPC_CALLER_EXPORTED void *rpc_caller_virt_to_phys(struct rpc_caller *s, void *va);
++
++RPC_CALLER_EXPORTED void *rpc_caller_phys_to_virt(struct rpc_caller *s, void *pa);
++
+ #ifdef __cplusplus
+ }
+ #endif
+diff --git a/components/rpc/openamp/caller/sp/component.cmake b/components/rpc/openamp/caller/sp/component.cmake
+new file mode 100644
+index 000000000000..fc919529d731
+--- /dev/null
++++ b/components/rpc/openamp/caller/sp/component.cmake
+@@ -0,0 +1,15 @@
++#-------------------------------------------------------------------------------
++# Copyright (c) 2020, Arm Limited and Contributors. All rights reserved.
++#
++# SPDX-License-Identifier: BSD-3-Clause
++#
++#-------------------------------------------------------------------------------
++if (NOT DEFINED TGT)
++	message(FATAL_ERROR "mandatory parameter TGT is not defined.")
++endif()
++
++target_sources(${TGT} PRIVATE
++	"${CMAKE_CURRENT_LIST_DIR}/openamp_caller.c"
++	"${CMAKE_CURRENT_LIST_DIR}/openamp_virtio.c"
++	"${CMAKE_CURRENT_LIST_DIR}/openamp_mhu.c"
++	)
+diff --git a/components/rpc/openamp/caller/sp/openamp_caller.c b/components/rpc/openamp/caller/sp/openamp_caller.c
+new file mode 100644
+index 000000000000..6cdfb756568f
+--- /dev/null
++++ b/components/rpc/openamp/caller/sp/openamp_caller.c
+@@ -0,0 +1,203 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ * Copyright (c) 2021, Linaro Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#include <stddef.h>
++#include <trace.h>
++#include "openamp_caller.h"
++#include "openamp_mhu.h"
++#include "openamp_virtio.h"
++#include <protocols/rpc/common/packed-c/status.h>
++
++#define OPENAMP_TRANSACTION_IDLE	0x0
++#define OPENAMP_TRANSACTION_INPROGRESS	0x1
++#define OPENAMP_TRANSACTION_INVOKED	0x2
++
++static rpc_call_handle openamp_call_begin(void *context, uint8_t **req_buf,
++					  size_t req_len)
++{
++	struct openamp_caller *openamp = context;
++	const struct openamp_platform_ops *ops = openamp->platform_ops;
++	rpc_call_handle handle;
++	int ret;
++
++	if (!req_buf) {
++		EMSG("openamp: call_begin: not req_buf");
++		return NULL;
++	}
++
++	if (req_len > UINT32_MAX || req_len == 0) {
++		EMSG("openamp: call_begin: resp_len invalid: %lu", req_len);
++		return NULL;
++	}
++
++	if (openamp->status != OPENAMP_TRANSACTION_IDLE) {
++		EMSG("openamp: call_begin: transaction not idle");
++		return NULL;
++	}
++
++	ret = ops->platform_call_begin(openamp, req_buf, req_len);
++	if (ret < 0) {
++		EMSG("openamp: call_begin: platform begin failed: %d", ret);
++		return NULL;
++	}
++
++	openamp->status = OPENAMP_TRANSACTION_INPROGRESS;
++	handle = openamp;
++
++	return handle;
++}
++
++static rpc_status_t openamp_call_invoke(void *context, rpc_call_handle handle,
++					uint32_t opcode, int *opstatus,
++					uint8_t **resp_buf, size_t *resp_len)
++{
++	struct openamp_caller *openamp = context;
++	const struct openamp_platform_ops *ops = openamp->platform_ops;
++	rpc_status_t status;
++	int ret;
++
++	(void)opcode;
++
++	if ((handle != openamp) || !opstatus || !resp_buf || !resp_len) {
++		EMSG("openamp: call_invoke: invalid arguments");
++		return TS_RPC_ERROR_INVALID_PARAMETER;
++	}
++
++	if (openamp->status != OPENAMP_TRANSACTION_INPROGRESS) {
++		EMSG("openamp: call_invoke: transaction needed to be started");
++		return TS_RPC_ERROR_NOT_READY;
++	}
++
++	ret = ops->platform_call_invoke(openamp, opstatus, resp_buf, resp_len);
++	if (ret < 0)
++		return TS_RPC_ERROR_INTERNAL;
++
++	openamp->status = OPENAMP_TRANSACTION_INVOKED;
++	*opstatus = 0;
++
++	return TS_RPC_CALL_ACCEPTED;
++}
++
++static void openamp_call_end(void *context, rpc_call_handle handle)
++{
++	struct openamp_caller *openamp = context;
++	const struct openamp_platform_ops *ops = openamp->platform_ops;
++
++	if (handle != openamp) {
++		EMSG("openamp: call_end: invalid arguments");
++		return;
++	}
++
++	if (openamp->status == OPENAMP_TRANSACTION_IDLE) {
++		EMSG("openamp: call_end: transaction idle");
++		return;
++	}
++
++	ops->platform_call_end(openamp);
++
++	openamp->status = OPENAMP_TRANSACTION_IDLE;
++}
++
++static void *openamp_virt_to_phys(void *context, void *va)
++{
++	struct openamp_caller *openamp = context;
++	const struct openamp_platform_ops *ops = openamp->platform_ops;
++
++	return ops->platform_virt_to_phys(openamp, va);
++}
++
++static void *openamp_phys_to_virt(void *context, void *pa)
++{
++	struct openamp_caller *openamp = context;
++	const struct openamp_platform_ops *ops = openamp->platform_ops;
++
++	return ops->platform_phys_to_virt(openamp, pa);
++}
++
++static int openamp_init(struct openamp_caller *openamp)
++{
++	const struct openamp_platform_ops *ops = openamp->platform_ops;
++	int ret;
++
++	ret = ops->transport_init(openamp);
++	if (ret < 0)
++		return ret;
++
++	ret = ops->platform_init(openamp);
++	if (ret < 0)
++		goto denit_transport;
++
++	return 0;
++
++denit_transport:
++	ops->transport_deinit(openamp);
++
++	return ret;
++}
++
++static const struct openamp_platform_ops openamp_virtio_ops = {
++	.transport_init = openamp_mhu_init,
++	.transport_deinit = openamp_mhu_deinit,
++	.transport_notify = openamp_mhu_notify_peer,
++	.transport_receive = openamp_mhu_receive,
++	.platform_init = openamp_virtio_init,
++	.platform_call_begin = openamp_virtio_call_begin,
++	.platform_call_invoke = openamp_virtio_call_invoke,
++	.platform_call_end = openamp_virtio_call_end,
++	.platform_virt_to_phys = openamp_virtio_virt_to_phys,
++	.platform_phys_to_virt = openamp_virtio_phys_to_virt,
++};
++
++struct rpc_caller *openamp_caller_init(struct openamp_caller *openamp)
++{
++	struct rpc_caller *rpc = &openamp->rpc_caller;
++	int ret;
++
++	if (openamp->ref_count)
++		return rpc;
++
++	rpc_caller_init(rpc, openamp);
++
++	rpc->call_begin = openamp_call_begin;
++	rpc->call_invoke = openamp_call_invoke;
++	rpc->call_end = openamp_call_end;
++	rpc->virt_to_phys = openamp_virt_to_phys;
++	rpc->phys_to_virt = openamp_phys_to_virt;
++	openamp->platform_ops = &openamp_virtio_ops;
++
++	ret = openamp_init(openamp);
++	if (ret < 0) {
++		EMSG("openamp_init: failed to start: %d", ret);
++		return rpc;
++	}
++	openamp->ref_count++;
++
++	return rpc;
++}
++
++void openamp_caller_deinit(struct openamp_caller *openamp)
++{
++	struct rpc_caller *rpc = &openamp->rpc_caller;
++
++	if (--openamp->ref_count)
++		return;
++
++	rpc->context = NULL;
++	rpc->call_begin = NULL;
++	rpc->call_invoke = NULL;
++	rpc->call_end = NULL;
++}
++
++int openamp_caller_discover(struct openamp_caller *openamp)
++{
++	return openamp_init(openamp);
++}
++
++int openamp_caller_open(struct openamp_caller *openamp)
++{
++
++}
+diff --git a/components/rpc/openamp/caller/sp/openamp_caller.h b/components/rpc/openamp/caller/sp/openamp_caller.h
+new file mode 100644
+index 000000000000..3fb67c56cc53
+--- /dev/null
++++ b/components/rpc/openamp/caller/sp/openamp_caller.h
+@@ -0,0 +1,43 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ * Copyright (c) 2021, Linaro Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++#ifndef OPENAMP_CALLER_H
++#define OPENAMP_CALLER_H
++
++#include <stddef.h>
++#include <rpc_caller.h>
++
++struct openamp_caller {
++	struct rpc_caller rpc_caller;
++	const struct openamp_platform_ops *platform_ops;
++	uint32_t ref_count;
++	uint8_t status;
++
++	void *transport;
++	void *platform;
++};
++
++struct openamp_platform_ops {
++	int (*transport_init)(struct openamp_caller *openamp);
++	int (*transport_deinit)(struct openamp_caller *openamp);
++	int (*transport_notify)(struct openamp_caller *openamp);
++	int (*transport_receive)(struct openamp_caller *openamp);
++	int (*platform_init)(struct openamp_caller *openamp);
++	int (*platform_deinit)(struct openamp_caller *openamp);
++	int (*platform_call_begin)(struct openamp_caller *openamp,
++				   uint8_t **req_buf, size_t req_len);
++	int (*platform_call_invoke)(struct openamp_caller *openamp,
++				    int *opstatus, uint8_t **resp_buf,
++				    size_t *resp_len);
++	int (*platform_call_end)(struct openamp_caller *openamp);
++	void *(*platform_virt_to_phys)(struct openamp_caller *openamp, void *va);
++	void *(*platform_phys_to_virt)(struct openamp_caller *openamp, void *pa);
++};
++
++struct rpc_caller *openamp_caller_init(struct openamp_caller *openamp);
++void openamp_caller_deinit(struct openamp_caller *openamp);
++
++#endif
+diff --git a/components/rpc/openamp/caller/sp/openamp_mhu.c b/components/rpc/openamp/caller/sp/openamp_mhu.c
+new file mode 100644
+index 000000000000..ffdadaf870a3
+--- /dev/null
++++ b/components/rpc/openamp/caller/sp/openamp_mhu.c
+@@ -0,0 +1,191 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ * Copyright (c) 2021, Linaro Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#include <config/interface/config_store.h>
++#include <config/interface/config_blob.h>
++#include <platform/interface/device_region.h>
++#include <platform/drivers/arm/mhu_driver/mhu_v2.h>
++#include <trace.h>
++#include <errno.h>
++#include <stdlib.h>
++#include <stdint.h>
++#include <stddef.h>
++#include <limits.h>
++
++#include "openamp_caller.h"
++
++#define MHU_V_2_NOTIFY_CHANNEL	0
++#define MHU_V_2_NOTIFY_VALUE	0xff
++
++struct openamp_mhu {
++	struct device_region rx_region;
++	struct device_region tx_region;
++	struct mhu_v2_x_dev_t rx_dev;
++	struct mhu_v2_x_dev_t tx_dev;
++};
++
++static int openamp_mhu_device_get(const char *dev,
++				  struct device_region *dev_region)
++{
++	bool found;
++
++	found = config_store_query(CONFIG_CLASSIFIER_DEVICE_REGION, dev, 0,
++				   dev_region, sizeof(*dev_region));
++	if (!found)
++		return -EINVAL;
++
++	if (!dev_region->base_addr)
++		return -EINVAL;
++
++	IMSG("mhu: device region found: %s addr: 0x%x size: %d", dev,
++	     dev_region->base_addr, dev_region->io_region_size);
++
++	return 0;
++}
++
++int openamp_mhu_receive(struct openamp_caller *openamp)
++{
++	struct mhu_v2_x_dev_t *rx_dev;
++	enum mhu_v2_x_error_t ret;
++	struct openamp_mhu *mhu;
++	uint32_t channel = 0;
++	uint32_t irq_status;
++
++	if (!openamp->transport) {
++		EMSG("openamp: mhu: receive transport not initialized");
++		return -EINVAL;
++	}
++
++	mhu = openamp->transport;
++	rx_dev = &mhu->rx_dev;
++
++	irq_status = 0;
++
++	do {
++		irq_status = mhu_v2_x_get_interrupt_status(rx_dev);
++	} while(!irq_status);
++
++	ret = mhu_v2_1_get_ch_interrupt_num(rx_dev, &channel);
++
++	ret = mhu_v2_x_channel_clear(rx_dev, channel);
++	if (ret != MHU_V_2_X_ERR_NONE) {
++		EMSG("openamp: mhu: failed to clear channel: %d", channel);
++		return -EPROTO;
++	}
++
++	return 0;
++}
++
++int openamp_mhu_notify_peer(struct openamp_caller *openamp)
++{
++	struct mhu_v2_x_dev_t *tx_dev;
++	enum mhu_v2_x_error_t ret;
++	struct openamp_mhu *mhu;
++	uint32_t access_ready;
++
++	if (!openamp->transport) {
++		EMSG("openamp: mhu: notify transport not initialized");
++		return -EINVAL;
++	}
++
++	mhu = openamp->transport;
++	tx_dev = &mhu->tx_dev;
++
++	ret = mhu_v2_x_set_access_request(tx_dev);
++	if (ret != MHU_V_2_X_ERR_NONE) {
++		EMSG("openamp: mhu: set access request failed");
++		return -EPROTO;
++	}
++
++	do {
++		ret = mhu_v2_x_get_access_ready(tx_dev, &access_ready);
++		if (ret != MHU_V_2_X_ERR_NONE) {
++			EMSG("openamp: mhu: failed to get access_ready");
++			return -EPROTO;
++		}
++	} while (!access_ready);
++
++	ret = mhu_v2_x_channel_send(tx_dev, MHU_V_2_NOTIFY_CHANNEL,
++				    MHU_V_2_NOTIFY_VALUE);
++	if (ret != MHU_V_2_X_ERR_NONE) {
++		EMSG("openamp: mhu: failed send over channel");
++		return -EPROTO;
++	}
++
++	ret = mhu_v2_x_reset_access_request(tx_dev);
++	if (ret != MHU_V_2_X_ERR_NONE) {
++		EMSG("openamp: mhu: failed reset access request");
++		return -EPROTO;
++	}
++
++	return 0;
++}
++
++int openamp_mhu_init(struct openamp_caller *openamp)
++{
++	struct mhu_v2_x_dev_t *rx_dev;
++	struct mhu_v2_x_dev_t *tx_dev;
++	struct openamp_mhu *mhu;
++	int ret;
++
++	/* if we already have initialized skip this */
++	if (openamp->transport)
++		return 0;
++
++	mhu = malloc(sizeof(*mhu));
++	if (!mhu)
++		return -1;
++
++	ret = openamp_mhu_device_get("mhu-sender", &mhu->tx_region);
++	if (ret < 0)
++		goto free_mhu;
++
++	ret = openamp_mhu_device_get("mhu-receiver", &mhu->rx_region);
++	if (ret < 0)
++		goto free_mhu;
++
++	rx_dev = &mhu->rx_dev;
++	tx_dev = &mhu->tx_dev;
++
++	rx_dev->base =  (unsigned int)mhu->rx_region.base_addr;
++	rx_dev->frame = MHU_V2_X_RECEIVER_FRAME;
++
++	tx_dev->base =  (unsigned int)mhu->tx_region.base_addr;
++	tx_dev->frame = MHU_V2_X_SENDER_FRAME;
++
++	ret = mhu_v2_x_driver_init(rx_dev, MHU_REV_READ_FROM_HW);
++	if (ret < 0)
++		goto free_mhu;
++
++	ret = mhu_v2_x_driver_init(tx_dev, MHU_REV_READ_FROM_HW);
++	if (ret < 0)
++		goto free_mhu;
++
++	openamp->transport = (void *)mhu;
++
++	return 0;
++
++free_mhu:
++	free(mhu);
++
++	return ret;
++}
++
++int openamp_mhu_deinit(struct openamp_caller *openamp)
++{
++	struct openamp_mhu *mhu;
++
++	if (!openamp->transport)
++		return 0;
++
++	mhu = openamp->transport;
++	free(mhu);
++
++	openamp->transport = NULL;
++
++	return 0;
++}
+diff --git a/components/rpc/openamp/caller/sp/openamp_mhu.h b/components/rpc/openamp/caller/sp/openamp_mhu.h
+new file mode 100644
+index 000000000000..2ae5cb8ee1c6
+--- /dev/null
++++ b/components/rpc/openamp/caller/sp/openamp_mhu.h
+@@ -0,0 +1,19 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ * Copyright (c) 2021, Linaro Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++#ifndef OPENAMP_MHU_H
++#define OPENAMP_MHU_H
++
++#include <stddef.h>
++#include "openamp_caller.h"
++
++int openamp_mhu_init(struct openamp_caller *openamp);
++int openamp_mhu_deinit(struct openamp_caller *openamp);
++
++int openamp_mhu_notify_peer(struct openamp_caller *openamp);
++int openamp_mhu_receive(struct openamp_caller *openamp);
++
++#endif
+diff --git a/components/rpc/openamp/caller/sp/openamp_virtio.c b/components/rpc/openamp/caller/sp/openamp_virtio.c
+new file mode 100644
+index 000000000000..b7c1aa929111
+--- /dev/null
++++ b/components/rpc/openamp/caller/sp/openamp_virtio.c
+@@ -0,0 +1,555 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ * Copyright (c) 2021, Linaro Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#include <metal/device.h>
++#include <metal/spinlock.h>
++#include <openamp/open_amp.h>
++#include <platform/interface/device_region.h>
++#include <config/interface/config_store.h>
++
++#include <stddef.h>
++#include <trace.h>
++#include "openamp_caller.h"
++
++#define OPENAMP_SHEM_DEVICE_NAME "openamp-virtio"
++#define OPENAMP_RPMSG_ENDPOINT_NAME OPENAMP_SHEM_DEVICE_NAME
++#define OPENAMP_RPMSG_ENDPOINT_ADDR 1024
++
++#define OPENAMP_SHEM_PHYS 0x88000000
++#define OPENAMP_SHEM_PHYS_PAGES 1
++#define OPENAMP_SHEM_SE_PHYS 0xa8000000
++
++#define OPENAMP_SHEM_VDEV_SIZE (4 * 1024)
++#define OPENAMP_SHEM_VRING_SIZE (4 * 1024)
++
++#define OPENAMP_BUFFER_NO_WAIT  0
++#define OPENAMP_BUFFER_WAIT     1
++
++#define VIRTQUEUE_NR            2
++#define VQ_TX                   0
++#define VQ_RX                   1
++
++#define VRING_DESCRIPTORS       16
++#define VRING_ALIGN             4
++
++#define container_of(ptr, type, member) \
++	((type *)((char *)(ptr) - (unsigned long)(&((type *)0)->member)))
++
++struct openamp_virtio_shm {
++	uintptr_t base_addr;
++	size_t size;
++	uintptr_t vdev_status;
++	size_t vdev_status_size;
++	uintptr_t payload_addr;
++	size_t payload_size;
++	uintptr_t vring_tx;
++	size_t vring_tx_size;
++	uintptr_t vring_rx;
++	size_t vring_rx_size;
++
++	metal_phys_addr_t shm_physmap[OPENAMP_SHEM_PHYS_PAGES];
++};
++
++struct openamp_virtio_metal {
++	struct metal_spinlock lock;
++	struct metal_device shm_dev;
++	struct metal_device *io_dev;
++
++	struct metal_io_region *io;
++	struct openamp_virtio_shm shm;
++};
++
++struct openamp_virtio_device {
++	struct virtio_device virtio_dev;
++	struct virtqueue *vq[VIRTQUEUE_NR];
++	struct virtio_vring_info rvrings[VIRTQUEUE_NR];
++};
++
++struct openamp_virtio_rpmsg {
++	struct rpmsg_virtio_device rpmsg_vdev;
++	struct rpmsg_endpoint ep;
++	uint8_t *req_buf;
++	uint32_t req_len;
++	uint8_t *resp_buf;
++	size_t resp_len;
++};
++
++struct openamp_virtio {
++	struct openamp_caller *openamp;
++	struct openamp_virtio_rpmsg rpmsg;
++	struct openamp_virtio_device vdev;
++	struct openamp_virtio_metal metal;
++};
++
++static struct openamp_virtio *openamp_virtio_from_dev(struct virtio_device *vdev)
++{
++	struct openamp_virtio_device *openamp_vdev;
++
++	openamp_vdev = container_of(vdev, struct openamp_virtio_device,
++			    virtio_dev);
++
++	return container_of(openamp_vdev, struct openamp_virtio, vdev);
++}
++
++static struct openamp_virtio_rpmsg *openamp_virtio_rpmsg_from_dev(struct rpmsg_device *rdev)
++{
++	struct rpmsg_virtio_device *rvdev;
++
++	rvdev = container_of(rdev, struct rpmsg_virtio_device, rdev);
++
++	return container_of(rvdev, struct openamp_virtio_rpmsg, rpmsg_vdev);
++
++}
++
++static void openamp_virtio_metal_device_setup(struct metal_device *shm_dev,
++					      struct openamp_virtio_shm *shm)
++{
++	struct metal_io_region *shm_region;
++
++	shm_region = &shm_dev->regions[0];
++
++	shm_dev->name = OPENAMP_SHEM_DEVICE_NAME;
++	shm_dev->num_regions = 1;
++
++	shm_region->virt = (void *)shm->payload_addr;
++	shm_region->size = shm->payload_size;
++
++	shm_region->physmap = &shm->shm_physmap;
++	shm_region->page_shift = (metal_phys_addr_t)(-1);
++	shm_region->page_mask = (metal_phys_addr_t)(-1);
++}
++
++static int openamp_virtio_metal_init(struct openamp_virtio_metal *metal)
++{
++	struct metal_init_params params = METAL_INIT_DEFAULTS;
++	struct metal_device *shm_dev = &metal->shm_dev;
++	int ret;
++
++	openamp_virtio_metal_device_setup(shm_dev, &metal->shm);
++
++	metal_spinlock_init(&metal->lock);
++
++	ret = metal_init(&params);
++	if (ret < 0)
++		return ret;
++
++	ret = metal_register_generic_device(shm_dev);
++	if (ret < 0)
++		goto metal_finish;
++
++	ret = metal_device_open("generic", OPENAMP_SHEM_DEVICE_NAME,
++				&metal->io_dev);
++	if (ret < 0)
++		goto metal_finish;
++
++	metal->io = metal_device_io_region(metal->io_dev, 0);
++	if (!metal->io) {
++		EMSG("openamp: virtio: failed to init metal io");
++		ret = -EPROTO;
++		goto metal_finish;
++	}
++
++	return 0;
++
++metal_finish:
++	metal_finish();
++	return ret;
++}
++
++static unsigned char openamp_virtio_status_get(struct virtio_device *vdev)
++{
++	struct openamp_virtio *virtio = openamp_virtio_from_dev(vdev);
++	struct openamp_virtio_shm *shm = &virtio->metal.shm;
++
++	uint32_t status = *(volatile uint32_t *)shm->vdev_status;
++
++	return status;
++}
++
++static void openamp_virtio_status_set(struct virtio_device *vdev,
++				      unsigned char status)
++{
++	struct openamp_virtio *virtio = openamp_virtio_from_dev(vdev);
++	struct openamp_virtio_shm *shm = &virtio->metal.shm;
++
++	*(volatile uint32_t *)shm->vdev_status = status;
++}
++
++static int count;
++
++static uint32_t openamp_virtio_features_get(struct virtio_device *vdev)
++{
++	return 1 << VIRTIO_RPMSG_F_NS;
++}
++
++static void openamp_virtio_notify(struct virtqueue *vq)
++{
++	struct openamp_virtio_device *openamp_vdev;
++	struct openamp_caller *openamp;
++	struct openamp_virtio *virtio;
++	int ret;
++
++	openamp_vdev = container_of(vq->vq_dev, struct openamp_virtio_device, virtio_dev);
++	virtio = container_of(openamp_vdev, struct openamp_virtio, vdev);
++	openamp = virtio->openamp;
++
++	ret = openamp->platform_ops->transport_notify(openamp);
++	if (ret < 0)
++		EMSG("openamp: virtio: erro in transport_notify: %d", ret);
++}
++
++const static struct virtio_dispatch openamp_virtio_dispatch = {
++	.get_status = openamp_virtio_status_get,
++	.set_status = openamp_virtio_status_set,
++	.get_features = openamp_virtio_features_get,
++	.notify = openamp_virtio_notify,
++};
++
++static int openamp_virtio_device_setup(struct openamp_virtio *virtio)
++{
++	struct openamp_virtio_metal *metal = &virtio->metal;
++	struct openamp_virtio_device *openamp_vdev = &virtio->vdev;
++	struct virtio_device *vdev = &openamp_vdev->virtio_dev;
++	struct openamp_virtio_shm *shm = &metal->shm;
++	struct virtio_vring_info *rvring;
++
++	rvring = &openamp_vdev->rvrings[0];
++
++	vdev->role = RPMSG_REMOTE;
++	vdev->vrings_num = VIRTQUEUE_NR;
++	vdev->func = &openamp_virtio_dispatch;
++
++	openamp_vdev->vq[VQ_TX] = virtqueue_allocate(VRING_DESCRIPTORS);
++	if (!openamp_vdev->vq[VQ_TX]) {
++		EMSG("openamp: virtio: failed to allocate virtqueue 0");
++		return -ENOMEM;
++	}
++	rvring->io = metal->io;
++	rvring->info.vaddr = (void *)shm->vring_tx;
++	rvring->info.num_descs = VRING_DESCRIPTORS;
++	rvring->info.align = VRING_ALIGN;
++	rvring->vq = openamp_vdev->vq[VQ_TX];
++
++	openamp_vdev->vq[VQ_RX] = virtqueue_allocate(VRING_DESCRIPTORS);
++	if (!openamp_vdev->vq[VQ_RX]) {
++		EMSG("openamp: virtio: failed to allocate virtqueue 1");
++		goto free_vq;
++	}
++	rvring = &openamp_vdev->rvrings[VQ_RX];
++	rvring->io = metal->io;
++	rvring->info.vaddr = (void *)shm->vring_rx;
++	rvring->info.num_descs = VRING_DESCRIPTORS;
++	rvring->info.align = VRING_ALIGN;
++	rvring->vq = openamp_vdev->vq[VQ_RX];
++
++	vdev->vrings_info = &openamp_vdev->rvrings[0];
++
++	return 0;
++
++free_vq:
++	virtqueue_free(openamp_vdev->vq[VQ_TX]);
++	virtqueue_free(openamp_vdev->vq[VQ_RX]);
++
++	return -ENOMEM;
++}
++
++static int openamp_virtio_rpmsg_endpoint_callback(struct rpmsg_endpoint *ep,
++						  void *data, size_t len,
++						  uint32_t src, void *priv)
++{
++	struct openamp_virtio_rpmsg *vrpmsg;
++	struct rpmsg_device *rdev;
++	struct openamp_virtio *virtio;
++
++	rdev = ep->rdev;
++	vrpmsg = openamp_virtio_rpmsg_from_dev(rdev);
++	virtio = container_of(vrpmsg, struct openamp_virtio, rpmsg);
++
++	rpmsg_hold_rx_buffer(ep, data);
++	vrpmsg->resp_buf = data;
++	vrpmsg->resp_len = len;
++
++	return 0;
++}
++
++static void openamp_virtio_rpmsg_service_unbind(struct rpmsg_endpoint *ep)
++{
++	struct openamp_virtio_rpmsg *vrpmsg;
++	struct rpmsg_device *rdev;
++
++	rdev = container_of(ep, struct rpmsg_device, ns_ept);
++	vrpmsg = openamp_virtio_rpmsg_from_dev(rdev);
++
++	rpmsg_destroy_ept(&vrpmsg->ep);
++}
++
++static void openamp_virtio_rpmsg_endpoint_bind(struct rpmsg_device *rdev,
++					       const char *name,
++					       unsigned int dest)
++{
++	struct openamp_virtio_rpmsg *vrpmsg;
++
++	vrpmsg = openamp_virtio_rpmsg_from_dev(rdev);
++
++	rpmsg_create_ept(&vrpmsg->ep, rdev, name, RPMSG_ADDR_ANY, dest,
++			 openamp_virtio_rpmsg_endpoint_callback,
++			 openamp_virtio_rpmsg_service_unbind);
++}
++
++static int openamp_virtio_rpmsg_device_setup(struct openamp_virtio *virtio,
++					     struct device_region *virtio_dev)
++{
++	struct openamp_virtio_rpmsg *vrpmsg = &virtio->rpmsg;
++	struct rpmsg_virtio_device *rpmsg_vdev = &vrpmsg->rpmsg_vdev;
++	struct openamp_virtio_device *openamp_vdev = &virtio->vdev;
++	struct virtio_device *vdev = &openamp_vdev->virtio_dev;
++	struct openamp_virtio_metal *metal = &virtio->metal;
++	int ret;
++
++	/*
++	 * we assume here that we are the client side and do not need to
++	 * initialize the share memory poll (this is done at server side).
++	 */
++	ret = rpmsg_init_vdev(rpmsg_vdev, vdev,
++			      openamp_virtio_rpmsg_endpoint_bind, metal->io,
++			      NULL);
++	if (ret < 0) {
++		EMSG("openamp: virtio: init vdev failed: %d", ret);
++		return ret;
++	}
++
++
++	ret = rpmsg_create_ept(&vrpmsg->ep, &rpmsg_vdev->rdev,
++			       OPENAMP_RPMSG_ENDPOINT_NAME, RPMSG_ADDR_ANY,
++			       RPMSG_ADDR_ANY,
++			       openamp_virtio_rpmsg_endpoint_callback,
++			       openamp_virtio_rpmsg_service_unbind);
++	if (ret < 0) {
++		EMSG("openamp: virtio: failed to create endpoint: %d", ret);
++		return ret;
++	}
++
++	/* set default remote addr */
++	vrpmsg->ep.dest_addr = OPENAMP_RPMSG_ENDPOINT_ADDR;
++
++	return 0;
++}
++
++static void openamp_virtio_shm_set(struct openamp_virtio *virtio,
++				   struct device_region *virtio_region)
++{
++	struct openamp_virtio_shm *shm = &virtio->metal.shm;
++
++	shm->base_addr = virtio_region->base_addr;
++	shm->size = virtio_region->io_region_size;
++
++	shm->vdev_status = shm->base_addr;
++	shm->vdev_status_size = OPENAMP_SHEM_VDEV_SIZE;
++
++	shm->vring_rx = shm->base_addr + shm->size -
++		(2 * OPENAMP_SHEM_VRING_SIZE);
++	shm->vring_rx_size = OPENAMP_SHEM_VRING_SIZE;
++
++	shm->vring_tx = shm->vring_rx + shm->vring_rx_size;
++	shm->vring_tx_size = OPENAMP_SHEM_VRING_SIZE;
++
++	shm->payload_addr = shm->vdev_status + shm->vdev_status_size;
++	shm->payload_size = shm->size - shm->vdev_status_size -
++		shm->vring_rx_size - shm->vring_tx_size;
++
++	shm->shm_physmap[0] = OPENAMP_SHEM_PHYS + shm->vdev_status_size;
++
++	IMSG("SHEM: base: 0x%0x size: 0x%0x size: %d",
++	     shm->base_addr, shm->size, shm->size);
++	IMSG("VDEV: base: 0x%0x size: 0x%0x size: %d",
++	     shm->vdev_status, shm->vdev_status_size, shm->vdev_status_size);
++	IMSG("PAYLOAD: base: 0x%0x size: 0x%0x size: %d",
++	     shm->payload_addr, shm->payload_size, shm->payload_size);
++	IMSG("VRING_TX: base: 0x%0x size: 0x%0x size: %d",
++	     shm->vring_tx, shm->vring_tx_size, shm->vring_tx_size);
++	IMSG("VRING_RX: base: 0x%0x size: 0x%0x size: %d",
++	     shm->vring_rx, shm->vring_rx_size, shm->vring_rx_size);
++	IMSG("PHYMAP: base: 0x%0x", shm->shm_physmap[0]);
++}
++
++static int openamp_virtio_device_get(const char *dev,
++				     struct device_region *dev_region)
++{
++	bool found;
++
++	found = config_store_query(CONFIG_CLASSIFIER_DEVICE_REGION, dev, 0,
++				   dev_region, sizeof(*dev_region));
++	if (!found) {
++		EMSG("openamp: virtio: device region not found: %s", dev);
++		return -EINVAL;
++	}
++
++	if (dev_region->base_addr == 0 || dev_region->io_region_size == 0) {
++		EMSG("openamp: virtio: device region not valid");
++		return -EINVAL;
++	}
++
++	IMSG("openamp: virtio: device region found: %s addr: 0x%x size: %d",
++	     dev, dev_region->base_addr, dev_region->io_region_size);
++
++	return  0;
++}
++
++int openamp_virtio_call_begin(struct openamp_caller *openamp, uint8_t **req_buf,
++			      size_t req_len)
++{
++	struct openamp_virtio *virtio = openamp->platform;
++	struct openamp_virtio_rpmsg *vrpmsg = &virtio->rpmsg;
++	struct rpmsg_endpoint *ep = &vrpmsg->ep;
++
++
++	*req_buf = rpmsg_get_tx_payload_buffer(ep, &vrpmsg->req_len,
++					       OPENAMP_BUFFER_WAIT);
++	if (*req_buf == NULL)
++		return -EINVAL;
++
++	if (vrpmsg->req_len < req_len)
++		return -E2BIG;
++
++	vrpmsg->req_buf = *req_buf;
++
++	return 0;
++}
++
++int openamp_virtio_call_invoke(struct openamp_caller *openamp, int *opstatus,
++			       uint8_t **resp_buf, size_t *resp_len)
++{
++	const struct openamp_platform_ops *ops = openamp->platform_ops;
++	struct openamp_virtio *virtio = openamp->platform;
++	struct openamp_virtio_device *openamp_vdev = &virtio->vdev;
++	struct openamp_virtio_rpmsg *vrpmsg = &virtio->rpmsg;
++	struct rpmsg_endpoint *ep = &vrpmsg->ep;
++	int ret;
++
++	ret = rpmsg_send_nocopy(ep, vrpmsg->req_buf, vrpmsg->req_len);
++	if (ret < 0) {
++		EMSG("openamp: virtio: send nocopy failed: %d", ret);
++		return -EIO;
++	}
++
++	if (ret != vrpmsg->req_len) {
++		EMSG("openamp: virtio: send less bytes %d than requested %d",
++		     ret, vrpmsg->req_len);
++		return -EIO;
++	}
++
++	if (!ops->transport_receive)
++		return 0;
++
++	ret = ops->transport_receive(openamp);
++	if (ret < 0) {
++		EMSG("openamp: virtio: failed transport_receive");
++		return -EIO;
++	}
++
++	virtqueue_notification(openamp_vdev->vq[VQ_RX]);
++
++	*resp_buf = vrpmsg->resp_buf;
++	*resp_len = vrpmsg->resp_len;
++
++	return  0;
++}
++
++void openamp_virtio_call_end(struct openamp_caller *openamp)
++{
++	struct openamp_virtio *virtio = openamp->platform;
++	struct openamp_virtio_rpmsg *vrpmsg = &virtio->rpmsg;
++
++	rpmsg_release_rx_buffer(&vrpmsg->ep, vrpmsg->resp_buf);
++
++	vrpmsg->req_buf = NULL;
++	vrpmsg->req_len = 0;
++	vrpmsg->resp_buf = NULL;
++	vrpmsg->resp_len = 0;
++}
++
++void *openamp_virtio_virt_to_phys(struct openamp_caller *openamp, void *va)
++{
++	struct openamp_virtio *virtio = openamp->platform;
++	struct openamp_virtio_metal *metal = &virtio->metal;
++
++	return metal_io_virt_to_phys(metal->io, va);
++}
++
++void *openamp_virtio_phys_to_virt(struct openamp_caller *openamp, void *pa)
++{
++	struct openamp_virtio *virtio = openamp->platform;
++	struct openamp_virtio_metal *metal = &virtio->metal;
++
++	return metal_io_phys_to_virt(metal->io, pa);
++}
++
++int openamp_virtio_init(struct openamp_caller *openamp)
++{
++	struct device_region virtio_dev;
++	struct openamp_virtio *virtio;
++	int ret;
++
++	if (openamp->platform)
++		return 0;
++
++
++	virtio = malloc(sizeof(*virtio));
++	if (!virtio)
++		return -ENOMEM;
++
++	virtio->openamp = openamp;
++
++	ret = openamp_virtio_device_get(OPENAMP_SHEM_DEVICE_NAME, &virtio_dev);
++	if (ret < 0)
++		goto free_virtio;
++
++	openamp_virtio_shm_set(virtio, &virtio_dev);
++
++	ret = openamp_virtio_metal_init(&virtio->metal);
++	if (ret < 0)
++		goto free_virtio;
++
++	ret = openamp_virtio_device_setup(virtio);
++	if (ret < 0)
++		goto finish_metal;
++
++	ret = openamp_virtio_rpmsg_device_setup(virtio, &virtio_dev);
++	if (ret < 0) {
++		EMSG("openamp: virtio: rpmsg device setup failed: %d", ret);
++		goto finish_metal;
++	}
++
++	openamp->platform = virtio;
++
++	return 0;
++
++finish_metal:
++	metal_finish();
++
++free_virtio:
++	free(virtio);
++
++	return ret;
++}
++
++int openamp_virtio_deinit(struct openamp_caller *openamp)
++{
++	struct openamp_virtio *virtio;
++
++	if (!openamp->platform)
++		return 0;
++
++	virtio = openamp->platform;
++
++	metal_finish();
++	free(virtio);
++
++	openamp->platform = NULL;
++
++	return 0;
++}
+diff --git a/components/rpc/openamp/caller/sp/openamp_virtio.h b/components/rpc/openamp/caller/sp/openamp_virtio.h
+new file mode 100644
+index 000000000000..915128ff65ce
+--- /dev/null
++++ b/components/rpc/openamp/caller/sp/openamp_virtio.h
+@@ -0,0 +1,24 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ * Copyright (c) 2021, Linaro Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++#ifndef OPENAMP_VIRTIO_H
++#define OPENAMP_VIRTIO_H
++
++#include <stddef.h>
++#include "openamp_caller.h"
++
++int openamp_virtio_call_begin(struct openamp_caller *openamp, uint8_t **req_buf,
++			      size_t req_len);
++int openamp_virtio_call_invoke(struct openamp_caller *openamp, int *opstatus,
++			       uint8_t **resp_buf, size_t *resp_len);
++int openamp_virtio_call_end(struct openamp_caller *openamp);
++void *openamp_virtio_virt_to_phys(struct openamp_caller *openamp, void *va);
++void *openamp_virtio_phys_to_virt(struct openamp_caller *openamp, void *pa);
++
++int openamp_virtio_init(struct openamp_caller *openamp);
++int openamp_virtio_deinit(struct openamp_caller *openamp);
++
++#endif
+diff --git a/deployments/se-proxy/opteesp/default_se-proxy.dts.in b/deployments/se-proxy/opteesp/default_se-proxy.dts.in
+index 267b4f923540..04c181586b06 100644
+--- a/deployments/se-proxy/opteesp/default_se-proxy.dts.in
++++ b/deployments/se-proxy/opteesp/default_se-proxy.dts.in
+@@ -32,5 +32,11 @@
+ 			pages-count = <16>;
+ 			attributes = <0x3>; /* read-write */
+ 		};
++		openamp-virtio {
++			/* Armv8 A Foundation Platform values */
++			base-address = <0x00000000 0x88000000>;
++			pages-count = <256>;
++			attributes = <0x3>; /* read-write */
++		};
+ 	};
+ };
+diff --git a/deployments/se-proxy/se-proxy.cmake b/deployments/se-proxy/se-proxy.cmake
+index d39873a0fe81..34fe5ff1b925 100644
+--- a/deployments/se-proxy/se-proxy.cmake
++++ b/deployments/se-proxy/se-proxy.cmake
+@@ -47,6 +47,7 @@ add_components(TARGET "se-proxy"
+ 		"components/service/attestation/include"
+ 		"components/service/attestation/provider"
+ 		"components/service/attestation/provider/serializer/packed-c"
++		"components/rpc/openamp/caller/sp"
+ 
+ 		# Stub service provider backends
+ 		"components/rpc/dummy"
+-- 
+2.38.0
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0004-add-psa-client-definitions-for-ff-m.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0004-add-psa-client-definitions-for-ff-m.patch
new file mode 100644
index 000000000000..324622456059
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0004-add-psa-client-definitions-for-ff-m.patch
@@ -0,0 +1,298 @@
+From 8c1bc5a7ae525d64802e2a06746f698f54cf07ca Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Fri, 3 Dec 2021 19:05:18 +0000
+Subject: [PATCH 04/19] add psa client definitions for ff-m
+
+Add PSA client definitions in common include to add future
+ff-m support.
+
+Upstream-Status: Pending
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ .../service/common/include/psa/client.h       | 194 ++++++++++++++++++
+ components/service/common/include/psa/sid.h   |  71 +++++++
+ 2 files changed, 265 insertions(+)
+ create mode 100644 components/service/common/include/psa/client.h
+ create mode 100644 components/service/common/include/psa/sid.h
+
+diff --git a/components/service/common/include/psa/client.h b/components/service/common/include/psa/client.h
+new file mode 100644
+index 000000000000..69ccf14f40a3
+--- /dev/null
++++ b/components/service/common/include/psa/client.h
+@@ -0,0 +1,194 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef SERVICE_PSA_IPC_H
++#define SERVICE_PSA_IPC_H
++
++#include <stddef.h>
++#include <stdint.h>
++
++#include <rpc_caller.h>
++#include <psa/error.h>
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++#ifndef IOVEC_LEN
++#define IOVEC_LEN(arr) ((uint32_t)(sizeof(arr)/sizeof(arr[0])))
++#endif
++
++/*********************** PSA Client Macros and Types *************************/
++
++typedef int32_t psa_handle_t;
++
++/**
++ * The version of the PSA Framework API that is being used to build the calling
++ * firmware. Only part of features of FF-M v1.1 have been implemented. FF-M v1.1
++ * is compatible with v1.0.
++ */
++#define PSA_FRAMEWORK_VERSION       (0x0101u)
++
++/**
++ * Return value from psa_version() if the requested RoT Service is not present
++ * in the system.
++ */
++#define PSA_VERSION_NONE            (0u)
++
++/**
++ * The zero-value null handle can be assigned to variables used in clients and
++ * RoT Services, indicating that there is no current connection or message.
++ */
++#define PSA_NULL_HANDLE             ((psa_handle_t)0)
++
++/**
++ * Tests whether a handle value returned by psa_connect() is valid.
++ */
++#define PSA_HANDLE_IS_VALID(handle) ((psa_handle_t)(handle) > 0)
++
++/**
++ * Converts the handle value returned from a failed call psa_connect() into
++ * an error code.
++ */
++#define PSA_HANDLE_TO_ERROR(handle) ((psa_status_t)(handle))
++
++/**
++ * Maximum number of input and output vectors for a request to psa_call().
++ */
++#define PSA_MAX_IOVEC               (4u)
++
++/**
++ * An IPC message type that indicates a generic client request.
++ */
++#define PSA_IPC_CALL                (0)
++
++/**
++ * A read-only input memory region provided to an RoT Service.
++ */
++struct __attribute__ ((__packed__)) psa_invec {
++    uint32_t base;           /*!< the start address of the memory buffer */
++    uint32_t len;                 /*!< the size in bytes                      */
++};
++
++/**
++ * A writable output memory region provided to an RoT Service.
++ */
++struct __attribute__ ((__packed__)) psa_outvec {
++    uint32_t base;                 /*!< the start address of the memory buffer */
++    uint32_t len;                 /*!< the size in bytes                      */
++};
++
++/*************************** PSA Client API **********************************/
++
++/**
++ * \brief Retrieve the version of the PSA Framework API that is implemented.
++ *
++ * \param[in] rpc_caller        RPC caller to use
++ * \return version              The version of the PSA Framework implementation
++ *                              that is providing the runtime services to the
++ *                              caller. The major and minor version are encoded
++ *                              as follows:
++ * \arg                           version[15:8] -- major version number.
++ * \arg                           version[7:0]  -- minor version number.
++ */
++uint32_t psa_framework_version(struct rpc_caller *caller);
++
++/**
++ * \brief Retrieve the version of an RoT Service or indicate that it is not
++ *        present on this system.
++ *
++ * \param[in] rpc_caller        RPC caller to use
++ * \param[in] sid               ID of the RoT Service to query.
++ *
++ * \retval PSA_VERSION_NONE     The RoT Service is not implemented, or the
++ *                              caller is not permitted to access the service.
++ * \retval > 0                  The version of the implemented RoT Service.
++ */
++uint32_t psa_version(struct rpc_caller *caller, uint32_t sid);
++
++/**
++ * \brief Connect to an RoT Service by its SID.
++ *
++ * \param[in] rpc_caller        RPC caller to use
++ * \param[in] sid               ID of the RoT Service to connect to.
++ * \param[in] version           Requested version of the RoT Service.
++ *
++ * \retval > 0                  A handle for the connection.
++ * \retval PSA_ERROR_CONNECTION_REFUSED The SPM or RoT Service has refused the
++ *                              connection.
++ * \retval PSA_ERROR_CONNECTION_BUSY The SPM or RoT Service cannot make the
++ *                              connection at the moment.
++ * \retval "PROGRAMMER ERROR"   The call is a PROGRAMMER ERROR if one or more
++ *                              of the following are true:
++ * \arg                           The RoT Service ID is not present.
++ * \arg                           The RoT Service version is not supported.
++ * \arg                           The caller is not allowed to access the RoT
++ *                                service.
++ */
++psa_handle_t psa_connect(struct rpc_caller *caller, uint32_t sid,
++			 uint32_t version);
++
++/**
++ * \brief Call an RoT Service on an established connection.
++ *
++ * \note  FF-M 1.0 proposes 6 parameters for psa_call but the secure gateway ABI
++ *        support at most 4 parameters. TF-M chooses to encode 'in_len',
++ *        'out_len', and 'type' into a 32-bit integer to improve efficiency.
++ *        Compared with struct-based encoding, this method saves extra memory
++ *        check and memory copy operation. The disadvantage is that the 'type'
++ *        range has to be reduced into a 16-bit integer. So with this encoding,
++ *        the valid range for 'type' is 0-32767.
++ *
++ * \param[in] rpc_caller        RPC caller to use
++ * \param[in] handle            A handle to an established connection.
++ * \param[in] type              The request type.
++ *                              Must be zero( \ref PSA_IPC_CALL) or positive.
++ * \param[in] in_vec            Array of input \ref psa_invec structures.
++ * \param[in] in_len            Number of input \ref psa_invec structures.
++ * \param[in,out] out_vec       Array of output \ref psa_outvec structures.
++ * \param[in] out_len           Number of output \ref psa_outvec structures.
++ *
++ * \retval >=0                  RoT Service-specific status value.
++ * \retval <0                   RoT Service-specific error code.
++ * \retval PSA_ERROR_PROGRAMMER_ERROR The connection has been terminated by the
++ *                              RoT Service. The call is a PROGRAMMER ERROR if
++ *                              one or more of the following are true:
++ * \arg                           An invalid handle was passed.
++ * \arg                           The connection is already handling a request.
++ * \arg                           type < 0.
++ * \arg                           An invalid memory reference was provided.
++ * \arg                           in_len + out_len > PSA_MAX_IOVEC.
++ * \arg                           The message is unrecognized by the RoT
++ *                                Service or incorrectly formatted.
++ */
++psa_status_t psa_call(struct rpc_caller *caller, psa_handle_t handle,
++		      int32_t type, const struct psa_invec *in_vec,
++		      size_t in_len, struct psa_outvec *out_vec, size_t out_len);
++
++/**
++ * \brief Close a connection to an RoT Service.
++ *
++ * \param[in] rpc_caller        RPC caller to use
++ * \param[in] handle            A handle to an established connection, or the
++ *                              null handle.
++ *
++ * \retval void                 Success.
++ * \retval "PROGRAMMER ERROR"   The call is a PROGRAMMER ERROR if one or more
++ *                              of the following are true:
++ * \arg                           An invalid handle was provided that is not
++ *                                the null handle.
++ * \arg                           The connection is currently handling a
++ *                                request.
++ */
++void psa_close(struct rpc_caller *caller, psa_handle_t handle);
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* SERVICE_PSA_IPC_H */
++
++
+diff --git a/components/service/common/include/psa/sid.h b/components/service/common/include/psa/sid.h
+new file mode 100644
+index 000000000000..aaa973c6e987
+--- /dev/null
++++ b/components/service/common/include/psa/sid.h
+@@ -0,0 +1,71 @@
++/*
++ * Copyright (c) 2019-2021, Arm Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++
++#ifndef __PSA_MANIFEST_SID_H__
++#define __PSA_MANIFEST_SID_H__
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++/******** TFM_SP_PS ********/
++#define TFM_PROTECTED_STORAGE_SERVICE_SID                          (0x00000060U)
++#define TFM_PROTECTED_STORAGE_SERVICE_VERSION                      (1U)
++#define TFM_PROTECTED_STORAGE_SERVICE_HANDLE                       (0x40000101U)
++
++/* Invalid UID */
++#define TFM_PS_INVALID_UID 0
++
++/* PS message types that distinguish PS services. */
++#define TFM_PS_SET                1001
++#define TFM_PS_GET                1002
++#define TFM_PS_GET_INFO           1003
++#define TFM_PS_REMOVE             1004
++#define TFM_PS_GET_SUPPORT        1005
++
++/******** TFM_SP_ITS ********/
++#define TFM_INTERNAL_TRUSTED_STORAGE_SERVICE_SID                   (0x00000070U)
++#define TFM_INTERNAL_TRUSTED_STORAGE_SERVICE_VERSION               (1U)
++#define TFM_INTERNAL_TRUSTED_STORAGE_SERVICE_HANDLE                (0x40000102U)
++
++/******** TFM_SP_CRYPTO ********/
++#define TFM_CRYPTO_SID                                             (0x00000080U)
++#define TFM_CRYPTO_VERSION                                         (1U)
++#define TFM_CRYPTO_HANDLE                                          (0x40000100U)
++
++/******** TFM_SP_PLATFORM ********/
++#define TFM_SP_PLATFORM_SYSTEM_RESET_SID                           (0x00000040U)
++#define TFM_SP_PLATFORM_SYSTEM_RESET_VERSION                       (1U)
++#define TFM_SP_PLATFORM_IOCTL_SID                                  (0x00000041U)
++#define TFM_SP_PLATFORM_IOCTL_VERSION                              (1U)
++#define TFM_SP_PLATFORM_NV_COUNTER_SID                             (0x00000042U)
++#define TFM_SP_PLATFORM_NV_COUNTER_VERSION                         (1U)
++
++/******** TFM_SP_INITIAL_ATTESTATION ********/
++#define TFM_ATTESTATION_SERVICE_SID                                (0x00000020U)
++#define TFM_ATTESTATION_SERVICE_VERSION                            (1U)
++#define TFM_ATTESTATION_SERVICE_HANDLE                             (0x40000103U)
++
++/******** TFM_SP_FWU ********/
++#define TFM_FWU_WRITE_SID                                          (0x000000A0U)
++#define TFM_FWU_WRITE_VERSION                                      (1U)
++#define TFM_FWU_INSTALL_SID                                        (0x000000A1U)
++#define TFM_FWU_INSTALL_VERSION                                    (1U)
++#define TFM_FWU_ABORT_SID                                          (0x000000A2U)
++#define TFM_FWU_ABORT_VERSION                                      (1U)
++#define TFM_FWU_QUERY_SID                                          (0x000000A3U)
++#define TFM_FWU_QUERY_VERSION                                      (1U)
++#define TFM_FWU_REQUEST_REBOOT_SID                                 (0x000000A4U)
++#define TFM_FWU_REQUEST_REBOOT_VERSION                             (1U)
++#define TFM_FWU_ACCEPT_SID                                         (0x000000A5U)
++#define TFM_FWU_ACCEPT_VERSION                                     (1U)
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* __PSA_MANIFEST_SID_H__ */
+-- 
+2.38.0
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0005-Add-common-service-component-to-ipc-support.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0005-Add-common-service-component-to-ipc-support.patch
new file mode 100644
index 000000000000..e179fb035a4a
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0005-Add-common-service-component-to-ipc-support.patch
@@ -0,0 +1,295 @@
+From e9778f726ed582360152f150301995b10d268aae Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Fri, 3 Dec 2021 19:13:03 +0000
+Subject: [PATCH 05/19] Add common service component to ipc support
+
+Add support for inter processor communication for PSA
+including, the openamp client side structures lib.
+
+Upstream-Status: Pending
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ .../service/common/psa_ipc/component.cmake    |  13 ++
+ .../service/common/psa_ipc/service_psa_ipc.c  |  97 +++++++++++++
+ .../psa_ipc/service_psa_ipc_openamp_lib.h     | 131 ++++++++++++++++++
+ deployments/se-proxy/se-proxy.cmake           |   1 +
+ 4 files changed, 242 insertions(+)
+ create mode 100644 components/service/common/psa_ipc/component.cmake
+ create mode 100644 components/service/common/psa_ipc/service_psa_ipc.c
+ create mode 100644 components/service/common/psa_ipc/service_psa_ipc_openamp_lib.h
+
+diff --git a/components/service/common/psa_ipc/component.cmake b/components/service/common/psa_ipc/component.cmake
+new file mode 100644
+index 000000000000..5a1c9e62e2f0
+--- /dev/null
++++ b/components/service/common/psa_ipc/component.cmake
+@@ -0,0 +1,13 @@
++#-------------------------------------------------------------------------------
++# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++#
++# SPDX-License-Identifier: BSD-3-Clause
++#
++#-------------------------------------------------------------------------------
++if (NOT DEFINED TGT)
++	message(FATAL_ERROR "mandatory parameter TGT is not defined.")
++endif()
++
++target_sources(${TGT} PRIVATE
++	"${CMAKE_CURRENT_LIST_DIR}/service_psa_ipc.c"
++	)
+diff --git a/components/service/common/psa_ipc/service_psa_ipc.c b/components/service/common/psa_ipc/service_psa_ipc.c
+new file mode 100644
+index 000000000000..e8093c20a523
+--- /dev/null
++++ b/components/service/common/psa_ipc/service_psa_ipc.c
+@@ -0,0 +1,97 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#include <stddef.h>
++#include <stdint.h>
++#include <string.h>
++#include <trace.h>
++
++#include <protocols/rpc/common/packed-c/status.h>
++#include <psa/error.h>
++#include <rpc_caller.h>
++
++#include <psa/client.h>
++#include "service_psa_ipc_openamp_lib.h"
++
++psa_handle_t psa_connect(struct rpc_caller *caller, uint32_t sid,
++			 uint32_t version)
++{
++	psa_status_t psa_status = PSA_SUCCESS;
++	struct s_openamp_msg *resp_msg = NULL;
++	struct ns_openamp_msg *req_msg;
++	rpc_call_handle rpc_handle;
++	size_t resp_len;
++	uint8_t *resp;
++	uint8_t *req;
++	int ret;
++
++	rpc_handle = rpc_caller_begin(caller, &req,
++				      sizeof(struct ns_openamp_msg));
++	if (!rpc_handle) {
++		EMSG("psa_connect: could not get handle");
++		return PSA_ERROR_GENERIC_ERROR;
++	}
++
++	req_msg = (struct ns_openamp_msg *)req;
++
++	req_msg->call_type = OPENAMP_PSA_CONNECT;
++	req_msg->params.psa_connect_params.sid = sid;
++	req_msg->params.psa_connect_params.version = version;
++
++	ret = rpc_caller_invoke(caller, rpc_handle, 0, &psa_status, &resp,
++				&resp_len);
++	if (ret != TS_RPC_CALL_ACCEPTED) {
++		EMSG("psa_connect: invoke failed: %d", ret);
++		return PSA_ERROR_GENERIC_ERROR;
++	}
++
++	if (psa_status == PSA_SUCCESS)
++		resp_msg = (struct s_openamp_msg *)resp;
++
++	rpc_caller_end(caller, rpc_handle);
++
++	return resp_msg ? (psa_handle_t)resp_msg->reply : PSA_NULL_HANDLE;
++}
++
++psa_status_t psa_call(struct rpc_caller *caller, psa_handle_t handle,
++		      int32_t type, const struct psa_invec *in_vec,
++		      size_t in_len, struct psa_outvec *out_vec, size_t out_len)
++{
++
++}
++
++void psa_close(struct rpc_caller *caller, psa_handle_t handle)
++{
++	psa_status_t psa_status = PSA_SUCCESS;
++	struct s_openamp_msg *resp_msg = NULL;
++	struct ns_openamp_msg *req_msg;
++	rpc_call_handle rpc_handle;
++	size_t resp_len;
++	uint8_t *resp;
++	uint8_t *req;
++	int ret;
++
++	rpc_handle = rpc_caller_begin(caller, &req,
++				      sizeof(struct ns_openamp_msg));
++	if (!rpc_handle) {
++		EMSG("psa_close: could not get handle");
++		return;
++	}
++
++	req_msg = (struct ns_openamp_msg *)req;
++
++	req_msg->call_type = OPENAMP_PSA_CLOSE;
++	req_msg->params.psa_close_params.handle = handle;
++
++	ret = rpc_caller_invoke(caller, rpc_handle, 0, &psa_status, &resp,
++				&resp_len);
++	if (ret != TS_RPC_CALL_ACCEPTED) {
++		EMSG("psa_close: invoke failed: %d", ret);
++		return;
++	}
++
++	rpc_caller_end(caller, rpc_handle);
++}
+diff --git a/components/service/common/psa_ipc/service_psa_ipc_openamp_lib.h b/components/service/common/psa_ipc/service_psa_ipc_openamp_lib.h
+new file mode 100644
+index 000000000000..33ea96660572
+--- /dev/null
++++ b/components/service/common/psa_ipc/service_psa_ipc_openamp_lib.h
+@@ -0,0 +1,131 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef SERVICE_PSA_IPC_OPENAMP_LIB_H
++#define SERVICE_PSA_IPC_OPENAMP_LIB_H
++
++#include <stddef.h>
++#include <stdint.h>
++
++#include <compiler.h>
++#include <psa/error.h>
++
++#include <stdint.h>
++#include <psa/client.h>
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++/* PSA client call type value */
++#define OPENAMP_PSA_FRAMEWORK_VERSION       (0x1)
++#define OPENAMP_PSA_VERSION                 (0x2)
++#define OPENAMP_PSA_CONNECT                 (0x3)
++#define OPENAMP_PSA_CALL                    (0x4)
++#define OPENAMP_PSA_CLOSE                   (0x5)
++
++/* Return code of openamp APIs */
++#define OPENAMP_SUCCESS                     (0)
++#define OPENAMP_MAP_FULL                    (INT32_MIN + 1)
++#define OPENAMP_MAP_ERROR                   (INT32_MIN + 2)
++#define OPENAMP_INVAL_PARAMS                (INT32_MIN + 3)
++#define OPENAMP_NO_PERMS                    (INT32_MIN + 4)
++#define OPENAMP_NO_PEND_EVENT               (INT32_MIN + 5)
++#define OPENAMP_CHAN_BUSY                   (INT32_MIN + 6)
++#define OPENAMP_CALLBACK_REG_ERROR          (INT32_MIN + 7)
++#define OPENAMP_INIT_ERROR                  (INT32_MIN + 8)
++
++#define HOLD_INPUT_BUFFER (1) /* IF true, TF-M Library will hold the openamp
++			       * buffer so that openamp shared memory buffer
++			       * does not get freed.
++			       */
++
++/*
++ * This structure holds the parameters used in a PSA client call.
++ */
++typedef struct __packed psa_client_in_params {
++	union {
++		struct __packed {
++			uint32_t        sid;
++		} psa_version_params;
++
++		struct __packed {
++			uint32_t        sid;
++			uint32_t        version;
++		} psa_connect_params;
++
++		struct __packed {
++			psa_handle_t     handle;
++			int32_t          type;
++			uint32_t         in_vec;
++			uint32_t         in_len;
++			uint32_t         out_vec;
++			uint32_t         out_len;
++		} psa_call_params;
++
++		struct __packed {
++			psa_handle_t    handle;
++		} psa_close_params;
++	};
++} psa_client_in_params_t;
++
++/* Openamp message passed from NSPE to SPE to deliver a PSA client call */
++struct __packed ns_openamp_msg {
++	uint32_t                      call_type;   /* PSA client call type */
++	struct psa_client_in_params   params;      /* Contain parameters used in PSA
++						  * client call
++						  */
++
++	int32_t                     client_id;   /* Optional client ID of the
++						  * non-secure caller.
++						  * It is required to identify the
++						  * non-secure task when NSPE OS
++						  * enforces non-secure task
++						  * isolation
++						  */
++	int32_t                     request_id;  /* This is the unique ID for a
++						  * request send to TF-M by the
++						  * non-secure core. TF-M forward
++						  * the ID back to non-secure on the
++						  * reply to a given request. Using
++						  * this id, the non-secure library
++						  * can identify the request for
++						  * which the reply has received.
++						  */
++};
++
++/*
++ * This structure holds the location of the out data of the PSA client call.
++ */
++struct __packed psa_client_out_params {
++	uint32_t              out_vec;
++	uint32_t              out_len;
++};
++
++
++/* Openamp message from SPE to NSPE delivering the reply back for a PSA client
++ * call.
++ */
++struct __packed s_openamp_msg {
++	int32_t                     request_id;  /* Using this id, the non-secure
++						  * library identifies the request.
++						  * TF-M forwards the same
++						  * request-id received on the
++						  * initial request.
++						  */
++	int32_t                     reply;       /* Reply of the PSA client call */
++	struct psa_client_out_params     params;      /* Contain out data result of the
++						       * PSA client call.
++						       */
++};
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* SERVICE_PSA_IPC_OPENAMP_LIB_H */
++
++
+diff --git a/deployments/se-proxy/se-proxy.cmake b/deployments/se-proxy/se-proxy.cmake
+index 34fe5ff1b925..dd0c5d00c21e 100644
+--- a/deployments/se-proxy/se-proxy.cmake
++++ b/deployments/se-proxy/se-proxy.cmake
+@@ -24,6 +24,7 @@ add_components(TARGET "se-proxy"
+ 		"components/service/common/include"
+ 		"components/service/common/serializer/protobuf"
+ 		"components/service/common/client"
++		"components/service/common/psa_ipc"
+ 		"components/service/common/provider"
+ 		"components/service/discovery/provider"
+ 		"components/service/discovery/provider/serializer/packed-c"
+-- 
+2.38.0
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0006-Add-secure-storage-ipc-backend.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0006-Add-secure-storage-ipc-backend.patch
new file mode 100644
index 000000000000..cac43ec4bc18
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0006-Add-secure-storage-ipc-backend.patch
@@ -0,0 +1,523 @@
+From 0df82487a7a253c601ca20ca1bd64fbb9ed64230 Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Fri, 3 Dec 2021 19:19:24 +0000
+Subject: [PATCH 06/19] Add secure storage ipc backend
+
+Add secure storage ipc ff-m implementation which may use
+openamp as rpc to communicate with other processor.
+
+Upstream-Status: Pending
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ .../service/common/psa_ipc/service_psa_ipc.c  | 143 +++++++++++-
+ .../secure_storage_ipc/component.cmake        |  14 ++
+ .../secure_storage_ipc/secure_storage_ipc.c   | 214 ++++++++++++++++++
+ .../secure_storage_ipc/secure_storage_ipc.h   |  52 +++++
+ deployments/se-proxy/se-proxy.cmake           |   1 +
+ 5 files changed, 420 insertions(+), 4 deletions(-)
+ create mode 100644 components/service/secure_storage/backend/secure_storage_ipc/component.cmake
+ create mode 100644 components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c
+ create mode 100644 components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.h
+
+diff --git a/components/service/common/psa_ipc/service_psa_ipc.c b/components/service/common/psa_ipc/service_psa_ipc.c
+index e8093c20a523..95a07c135f31 100644
+--- a/components/service/common/psa_ipc/service_psa_ipc.c
++++ b/components/service/common/psa_ipc/service_psa_ipc.c
+@@ -16,6 +16,52 @@
+ #include <psa/client.h>
+ #include "service_psa_ipc_openamp_lib.h"
+ 
++static struct psa_invec *psa_call_in_vec_param(uint8_t *req)
++{
++	return (struct psa_invec *)(req + sizeof(struct ns_openamp_msg));
++}
++
++static struct psa_outvec *psa_call_out_vec_param(uint8_t *req, size_t in_len)
++{
++	return (struct psa_outvec *)(req + sizeof(struct ns_openamp_msg) +
++				     (in_len * sizeof(struct psa_invec)));
++}
++
++static size_t psa_call_header_len(const struct psa_invec *in_vec, size_t in_len,
++				  struct psa_outvec *out_vec, size_t out_len)
++{
++	return sizeof(struct ns_openamp_msg) + (in_len * sizeof(*in_vec)) +
++		(out_len * sizeof(*out_vec));
++}
++
++static size_t psa_call_in_vec_len(const struct psa_invec *in_vec, size_t in_len)
++{
++	size_t req_len = 0;
++	int i;
++
++	if (!in_vec || !in_len)
++		return 0;
++
++	for (i = 0; i < in_len; i++)
++		req_len += in_vec[i].len;
++
++	return req_len;
++}
++
++static size_t psa_call_out_vec_len(const struct psa_outvec *out_vec, size_t out_len)
++{
++	size_t resp_len = 0;
++	int i;
++
++	if (!out_vec || !out_len)
++		return 0;
++
++	for (i = 0; i < out_len; i++)
++		resp_len += out_vec[i].len;
++
++	return resp_len;
++}
++
+ psa_handle_t psa_connect(struct rpc_caller *caller, uint32_t sid,
+ 			 uint32_t version)
+ {
+@@ -31,7 +77,7 @@ psa_handle_t psa_connect(struct rpc_caller *caller, uint32_t sid,
+ 	rpc_handle = rpc_caller_begin(caller, &req,
+ 				      sizeof(struct ns_openamp_msg));
+ 	if (!rpc_handle) {
+-		EMSG("psa_connect: could not get handle");
++		EMSG("psa_connect: could not get rpc handle");
+ 		return PSA_ERROR_GENERIC_ERROR;
+ 	}
+ 
+@@ -56,14 +102,100 @@ psa_handle_t psa_connect(struct rpc_caller *caller, uint32_t sid,
+ 	return resp_msg ? (psa_handle_t)resp_msg->reply : PSA_NULL_HANDLE;
+ }
+ 
+-psa_status_t psa_call(struct rpc_caller *caller, psa_handle_t handle,
++psa_status_t psa_call(struct rpc_caller *caller, psa_handle_t psa_handle,
+ 		      int32_t type, const struct psa_invec *in_vec,
+ 		      size_t in_len, struct psa_outvec *out_vec, size_t out_len)
+ {
++	psa_status_t psa_status = PSA_SUCCESS;
++	struct s_openamp_msg *resp_msg = NULL;
++	struct psa_outvec *out_vec_param;
++	struct psa_invec *in_vec_param;
++	struct ns_openamp_msg *req_msg;
++	rpc_call_handle rpc_handle;
++	size_t out_vec_len;
++	size_t in_vec_len;
++	size_t header_len;
++	uint8_t *payload;
++	size_t resp_len;
++	uint8_t *resp;
++	uint8_t *req;
++	int ret;
++	int i;
++
++	if ((psa_handle == PSA_NULL_HANDLE) || !caller)
++		return PSA_ERROR_INVALID_ARGUMENT;
++
++	header_len = psa_call_header_len(in_vec, in_len, out_vec, out_len);
++	in_vec_len = psa_call_in_vec_len(in_vec, in_len);
++	out_vec_len = psa_call_out_vec_len(out_vec, out_len);
+ 
++	rpc_handle = rpc_caller_begin(caller, &req, header_len + in_vec_len);
++	if (!rpc_handle) {
++		EMSG("psa_call: could not get handle");
++		return PSA_ERROR_GENERIC_ERROR;
++	}
++
++	payload = req + header_len;
++
++	out_vec_param = psa_call_out_vec_param(req, in_len);
++	in_vec_param = psa_call_in_vec_param(req);
++
++	req_msg = (struct ns_openamp_msg *)req;
++
++	req_msg->call_type = OPENAMP_PSA_CALL;
++	req_msg->request_id = 1234;
++	req_msg->params.psa_call_params.handle = psa_handle;
++	req_msg->params.psa_call_params.type = type;
++	req_msg->params.psa_call_params.in_len = in_len;
++	req_msg->params.psa_call_params.in_vec = rpc_caller_virt_to_phys(caller, in_vec_param);
++	req_msg->params.psa_call_params.out_len = out_len;
++	req_msg->params.psa_call_params.out_vec = rpc_caller_virt_to_phys(caller, out_vec_param);
++
++	for (i = 0; i < in_len; i++) {
++		in_vec_param[i].base = rpc_caller_virt_to_phys(caller, payload);
++		in_vec_param[i].len = in_vec[i].len;
++
++		memcpy(payload, in_vec[i].base, in_vec[i].len);
++		payload += in_vec[i].len;
++	}
++
++	for (i = 0; i < out_len; i++) {
++		out_vec_param[i].base = NULL;
++		out_vec_param[i].len = out_vec[i].len;
++	}
++
++	ret = rpc_caller_invoke(caller, rpc_handle, 0, &psa_status, &resp,
++				&resp_len);
++	if (ret != TS_RPC_CALL_ACCEPTED) {
++		EMSG("psa_call: invoke failed: %d", ret);
++		return PSA_ERROR_GENERIC_ERROR;
++	}
++
++	if (psa_status != PSA_SUCCESS) {
++		EMSG("psa_call: psa_status invoke failed: %d", psa_status);
++		return PSA_ERROR_GENERIC_ERROR;
++	}
++
++	resp_msg = (struct s_openamp_msg *)resp;
++
++	if (!resp_msg || !out_len || resp_msg->reply != PSA_SUCCESS)
++		goto caller_end;
++
++	out_vec_param = (struct psa_outvec *)rpc_caller_phys_to_virt(caller,
++						     resp_msg->params.out_vec);
++
++	for (i = 0; i < resp_msg->params.out_len; i++) {
++		memcpy(out_vec[i].base, rpc_caller_phys_to_virt(caller, out_vec_param[i].base),
++		       out_vec[i].len);
++	}
++
++caller_end:
++	rpc_caller_end(caller, rpc_handle);
++
++	return resp_msg ? resp_msg->reply : PSA_ERROR_COMMUNICATION_FAILURE;
+ }
+ 
+-void psa_close(struct rpc_caller *caller, psa_handle_t handle)
++void psa_close(struct rpc_caller *caller, psa_handle_t psa_handle)
+ {
+ 	psa_status_t psa_status = PSA_SUCCESS;
+ 	struct s_openamp_msg *resp_msg = NULL;
+@@ -74,6 +206,9 @@ void psa_close(struct rpc_caller *caller, psa_handle_t handle)
+ 	uint8_t *req;
+ 	int ret;
+ 
++	if ((psa_handle == PSA_NULL_HANDLE) || !caller)
++		return;
++
+ 	rpc_handle = rpc_caller_begin(caller, &req,
+ 				      sizeof(struct ns_openamp_msg));
+ 	if (!rpc_handle) {
+@@ -84,7 +219,7 @@ void psa_close(struct rpc_caller *caller, psa_handle_t handle)
+ 	req_msg = (struct ns_openamp_msg *)req;
+ 
+ 	req_msg->call_type = OPENAMP_PSA_CLOSE;
+-	req_msg->params.psa_close_params.handle = handle;
++	req_msg->params.psa_close_params.handle = psa_handle;
+ 
+ 	ret = rpc_caller_invoke(caller, rpc_handle, 0, &psa_status, &resp,
+ 				&resp_len);
+diff --git a/components/service/secure_storage/backend/secure_storage_ipc/component.cmake b/components/service/secure_storage/backend/secure_storage_ipc/component.cmake
+new file mode 100644
+index 000000000000..5d8f6714e0bd
+--- /dev/null
++++ b/components/service/secure_storage/backend/secure_storage_ipc/component.cmake
+@@ -0,0 +1,14 @@
++#-------------------------------------------------------------------------------
++# Copyright (c) 2020-2021, Arm Limited and Contributors. All rights reserved.
++#
++# SPDX-License-Identifier: BSD-3-Clause
++#
++#-------------------------------------------------------------------------------
++if (NOT DEFINED TGT)
++	message(FATAL_ERROR "mandatory parameter TGT is not defined.")
++endif()
++
++target_sources(${TGT} PRIVATE
++	"${CMAKE_CURRENT_LIST_DIR}/secure_storage_ipc.c"
++	)
++
+diff --git a/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c b/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c
+new file mode 100644
+index 000000000000..9b55f77dd395
+--- /dev/null
++++ b/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c
+@@ -0,0 +1,214 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#include <protocols/rpc/common/packed-c/status.h>
++#include "secure_storage_ipc.h"
++#include <psa/client.h>
++#include <psa/sid.h>
++#include <rpc_caller.h>
++#include <string.h>
++#include <trace.h>
++
++
++static psa_status_t secure_storage_ipc_set(void *context, uint32_t client_id,
++			 psa_storage_uid_t uid, size_t data_length,
++			 const void *p_data, psa_storage_create_flags_t create_flags)
++{
++	struct secure_storage_ipc *ipc = context;
++	struct rpc_caller *caller = ipc->client.caller;
++	psa_handle_t psa_handle;
++	psa_status_t psa_status;
++	struct psa_invec in_vec[] = {
++		{ .base = &uid, .len = sizeof(uid) },
++		{ .base = p_data, .len = data_length },
++		{ .base = &create_flags, .len = sizeof(create_flags) },
++	};
++
++	(void)client_id;
++
++	ipc->client.rpc_status = TS_RPC_CALL_ACCEPTED;
++
++	/* Validating input parameters */
++	if (p_data == NULL)
++		return PSA_ERROR_INVALID_ARGUMENT;
++
++	psa_status = psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
++			      TFM_PS_SET, in_vec, IOVEC_LEN(in_vec), NULL, 0);
++	if (psa_status < 0)
++		EMSG("ipc_set: psa_call failed: %d", psa_status);
++
++	return psa_status;
++}
++
++static psa_status_t secure_storage_ipc_get(void *context,
++					   uint32_t client_id,
++					   psa_storage_uid_t uid,
++					   size_t data_offset,
++					   size_t data_size,
++					   void *p_data,
++					   size_t *p_data_length)
++{
++	struct secure_storage_ipc *ipc = context;
++	struct rpc_caller *caller = ipc->client.caller;
++	psa_handle_t psa_handle;
++	psa_status_t psa_status;
++	uint32_t offset = (uint32_t)data_offset;
++	struct psa_invec in_vec[] = {
++		{ .base = &uid, .len = sizeof(uid) },
++		{ .base = &offset, .len = sizeof(offset) },
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = p_data, .len = data_size },
++	};
++
++	if (!p_data_length) {
++		EMSG("ipc_get: p_data_length not defined");
++		return PSA_ERROR_INVALID_ARGUMENT;
++	}
++
++	psa_status = psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
++			      TFM_PS_GET, in_vec, IOVEC_LEN(in_vec),
++			      out_vec, IOVEC_LEN(out_vec));
++	if (psa_status == PSA_SUCCESS)
++		*p_data_length = out_vec[0].len;
++
++	return psa_status;
++}
++
++static psa_status_t secure_storage_ipc_get_info(void *context,
++						uint32_t client_id,
++						psa_storage_uid_t uid,
++						struct psa_storage_info_t *p_info)
++{
++	struct secure_storage_ipc *ipc = context;
++	struct rpc_caller *caller = ipc->client.caller;
++	psa_handle_t psa_handle;
++	psa_status_t psa_status;
++	struct psa_invec in_vec[] = {
++		{ .base = &uid, .len = sizeof(uid) },
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = p_info, .len = sizeof(*p_info) },
++	};
++
++	(void)client_id;
++
++	/* Validating input parameters */
++	if (!p_info)
++		return PSA_ERROR_INVALID_ARGUMENT;
++
++	psa_status = psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
++			      TFM_PS_GET_INFO, in_vec,
++			      IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++	if (psa_status != PSA_SUCCESS)
++		EMSG("ipc_get_info: failed to psa_call: %d", psa_status);
++
++	return psa_status;
++}
++
++static psa_status_t secure_storage_ipc_remove(void *context,
++						uint32_t client_id,
++						psa_storage_uid_t uid)
++{
++	struct secure_storage_ipc *ipc = context;
++	struct rpc_caller *caller = ipc->client.caller;
++	psa_handle_t psa_handle;
++	psa_status_t psa_status;
++	struct psa_invec in_vec[] = {
++		{ .base = &uid, .len = sizeof(uid) },
++	};
++
++	(void)client_id;
++
++	psa_status = psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
++			      TFM_PS_REMOVE, in_vec,
++			      IOVEC_LEN(in_vec), NULL, 0);
++	if (psa_status != PSA_SUCCESS)
++		EMSG("ipc_remove: failed to psa_call: %d", psa_status);
++
++	return psa_status;
++}
++
++static psa_status_t secure_storage_ipc_create(void *context,
++					      uint32_t client_id,
++					      uint64_t uid,
++					      size_t capacity,
++					      uint32_t create_flags)
++{
++	(void)context;
++	(void)uid;
++	(void)client_id;
++	(void)capacity;
++	(void)create_flags;
++
++	return PSA_ERROR_NOT_SUPPORTED;
++}
++
++static psa_status_t secure_storage_set_extended(void *context,
++						uint32_t client_id,
++						uint64_t uid,
++						size_t data_offset,
++						size_t data_length,
++						const void *p_data)
++{
++	(void)context;
++	(void)uid;
++	(void)client_id;
++	(void)data_offset;
++	(void)data_length;
++	(void)p_data;
++
++	return PSA_ERROR_NOT_SUPPORTED;
++}
++
++static uint32_t secure_storage_get_support(void *context, uint32_t client_id)
++{
++	struct secure_storage_ipc *ipc = context;
++	struct rpc_caller *caller = ipc->client.caller;
++	psa_handle_t psa_handle;
++	psa_status_t psa_status;
++	uint32_t support_flags;
++	struct psa_outvec out_vec[] = {
++		{ .base = &support_flags, .len =  sizeof(support_flags) },
++	};
++
++	(void)client_id;
++
++	psa_status = psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
++			      TFM_PS_GET_SUPPORT, NULL, 0,
++			      out_vec, IOVEC_LEN(out_vec));
++	if (psa_status != PSA_SUCCESS)
++		EMSG("ipc_get_support: failed to psa_call: %d", psa_status);
++
++	return psa_status;
++}
++
++struct storage_backend *secure_storage_ipc_init(struct secure_storage_ipc *context,
++						struct rpc_caller *caller)
++{
++	service_client_init(&context->client, caller);
++
++	static const struct storage_backend_interface interface =
++	{
++		.set = secure_storage_ipc_set,
++		.get = secure_storage_ipc_get,
++		.get_info = secure_storage_ipc_get_info,
++		.remove = secure_storage_ipc_remove,
++		.create = secure_storage_ipc_create,
++		.set_extended = secure_storage_set_extended,
++		.get_support = secure_storage_get_support,
++	};
++
++	context->backend.context = context;
++	context->backend.interface = &interface;
++
++	return &context->backend;
++}
++
++void secure_storage_ipc_deinit(struct secure_storage_ipc *context)
++{
++	service_client_deinit(&context->client);
++}
+diff --git a/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.h b/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.h
+new file mode 100644
+index 000000000000..e8c1e8fd2f92
+--- /dev/null
++++ b/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.h
+@@ -0,0 +1,52 @@
++/*
++ * Copyright (c) 2020-2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef SECURE_STORAGE_IPC_H
++#define SECURE_STORAGE_IPC_H
++
++#include <service/secure_storage/backend/storage_backend.h>
++#include <service/common/client/service_client.h>
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++/**
++ * @brief      Secure storage ipc instance
++ */
++struct secure_storage_ipc
++{
++    struct storage_backend backend;
++    struct service_client client;
++};
++
++/**
++ * @brief      Initialize a secure storage ipc client
++ *
++ * A secure storage client is a storage backend that makes RPC calls
++ * to a remote secure storage provider.
++ *
++ * @param[in]  context    Instance data
++ * @param[in]  rpc_caller RPC caller instance
++ *
++ *
++ * @return     Pointer to inialized storage backend or NULL on failure
++ */
++struct storage_backend *secure_storage_ipc_init(struct secure_storage_ipc *context,
++						struct rpc_caller *caller);
++
++/**
++ * @brief      Deinitialize a secure storage ipc client
++ *
++ * @param[in]  context   Instance data
++ */
++void secure_storage_ipc_deinit(struct secure_storage_ipc *context);
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* SECURE_STORAGE_IPC_H */
+diff --git a/deployments/se-proxy/se-proxy.cmake b/deployments/se-proxy/se-proxy.cmake
+index dd0c5d00c21e..cd51460406ca 100644
+--- a/deployments/se-proxy/se-proxy.cmake
++++ b/deployments/se-proxy/se-proxy.cmake
+@@ -45,6 +45,7 @@ add_components(TARGET "se-proxy"
+ 		"components/service/crypto/factory/full"
+ 		"components/service/secure_storage/include"
+ 		"components/service/secure_storage/frontend/secure_storage_provider"
++		"components/service/secure_storage/backend/secure_storage_ipc"
+ 		"components/service/attestation/include"
+ 		"components/service/attestation/provider"
+ 		"components/service/attestation/provider/serializer/packed-c"
+-- 
+2.38.0
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0007-Use-secure-storage-ipc-and-openamp-for-se_proxy.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0007-Use-secure-storage-ipc-and-openamp-for-se_proxy.patch
new file mode 100644
index 000000000000..192e9768bd6b
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0007-Use-secure-storage-ipc-and-openamp-for-se_proxy.patch
@@ -0,0 +1,63 @@
+From 9c7f1e6a5eb9ab887e568cfa3c2003583d387bc9 Mon Sep 17 00:00:00 2001
+From: Vishnu Banavath <vishnu.banavath@arm.com>
+Date: Fri, 3 Dec 2021 19:25:34 +0000
+Subject: [PATCH 07/19] Use secure storage ipc and openamp for se_proxy
+
+Remove mock up backend for secure storage in se proxy
+deployment and use instead the secure storage ipc backend with
+openamp as rpc to secure enclave side.
+
+Upstream-Status: Pending
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ .../se-proxy/common/service_proxy_factory.c      | 16 +++++++++++++---
+ 1 file changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/deployments/se-proxy/common/service_proxy_factory.c b/deployments/se-proxy/common/service_proxy_factory.c
+index acfb6e8873fa..57290056d614 100644
+--- a/deployments/se-proxy/common/service_proxy_factory.c
++++ b/deployments/se-proxy/common/service_proxy_factory.c
+@@ -6,15 +6,20 @@
+ 
+ #include <stddef.h>
+ #include <rpc/common/endpoint/rpc_interface.h>
++#include <rpc/openamp/caller/sp/openamp_caller.h>
+ #include <service/attestation/provider/attest_provider.h>
+ #include <service/attestation/provider/serializer/packed-c/packedc_attest_provider_serializer.h>
+ #include <service/crypto/factory/crypto_provider_factory.h>
+ #include <service/secure_storage/frontend/secure_storage_provider/secure_storage_provider.h>
++#include <trace.h>
+ 
+ /* Stub backends */
+ #include <service/crypto/backend/stub/stub_crypto_backend.h>
++#include <service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.h>
+ #include <service/secure_storage/backend/mock_store/mock_store.h>
+ 
++struct openamp_caller openamp;
++
+ struct rpc_interface *attest_proxy_create(void)
+ {
+ 	struct rpc_interface *attest_iface;
+@@ -47,10 +52,15 @@ struct rpc_interface *crypto_proxy_create(void)
+ 
+ struct rpc_interface *ps_proxy_create(void)
+ {
+-	static struct mock_store ps_backend;
+ 	static struct secure_storage_provider ps_provider;
+-
+-	struct storage_backend *backend = mock_store_init(&ps_backend);
++	static struct secure_storage_ipc ps_backend;
++	static struct rpc_caller *storage_caller;
++	struct storage_backend *backend;
++
++	storage_caller = openamp_caller_init(&openamp);
++	if (!storage_caller)
++		return NULL;
++	backend = secure_storage_ipc_init(&ps_backend, &openamp.rpc_caller);
+ 
+ 	return secure_storage_provider_init(&ps_provider, backend);
+ }
+-- 
+2.38.0
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0008-Run-psa-arch-test.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0008-Run-psa-arch-test.patch
new file mode 100644
index 000000000000..ce7aacf3cd93
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0008-Run-psa-arch-test.patch
@@ -0,0 +1,72 @@
+From d9169d380366afc63af5d4bf02791aeb41f47897 Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Sun, 12 Dec 2021 10:43:48 +0000
+Subject: [PATCH 08/19] Run psa-arch-test
+
+Fixes needed to run psa-arch-test
+
+Upstream-Status: Pending
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ components/service/common/psa_ipc/service_psa_ipc.c       | 1 +
+ .../backend/secure_storage_ipc/secure_storage_ipc.c       | 8 --------
+ .../service/secure_storage/include/psa/storage_common.h   | 4 ++--
+ 3 files changed, 3 insertions(+), 10 deletions(-)
+
+diff --git a/components/service/common/psa_ipc/service_psa_ipc.c b/components/service/common/psa_ipc/service_psa_ipc.c
+index 95a07c135f31..5e5815dbc9cf 100644
+--- a/components/service/common/psa_ipc/service_psa_ipc.c
++++ b/components/service/common/psa_ipc/service_psa_ipc.c
+@@ -185,6 +185,7 @@ psa_status_t psa_call(struct rpc_caller *caller, psa_handle_t psa_handle,
+ 						     resp_msg->params.out_vec);
+ 
+ 	for (i = 0; i < resp_msg->params.out_len; i++) {
++                out_vec[i].len = out_vec_param[i].len;
+ 		memcpy(out_vec[i].base, rpc_caller_phys_to_virt(caller, out_vec_param[i].base),
+ 		       out_vec[i].len);
+ 	}
+diff --git a/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c b/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c
+index 9b55f77dd395..a1f369db253e 100644
+--- a/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c
++++ b/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c
+@@ -31,10 +31,6 @@ static psa_status_t secure_storage_ipc_set(void *context, uint32_t client_id,
+ 
+ 	ipc->client.rpc_status = TS_RPC_CALL_ACCEPTED;
+ 
+-	/* Validating input parameters */
+-	if (p_data == NULL)
+-		return PSA_ERROR_INVALID_ARGUMENT;
+-
+ 	psa_status = psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
+ 			      TFM_PS_SET, in_vec, IOVEC_LEN(in_vec), NULL, 0);
+ 	if (psa_status < 0)
+@@ -96,10 +92,6 @@ static psa_status_t secure_storage_ipc_get_info(void *context,
+ 
+ 	(void)client_id;
+ 
+-	/* Validating input parameters */
+-	if (!p_info)
+-		return PSA_ERROR_INVALID_ARGUMENT;
+-
+ 	psa_status = psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
+ 			      TFM_PS_GET_INFO, in_vec,
+ 			      IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
+diff --git a/components/service/secure_storage/include/psa/storage_common.h b/components/service/secure_storage/include/psa/storage_common.h
+index 4f6ba2a7d822..1fd6b40dc803 100644
+--- a/components/service/secure_storage/include/psa/storage_common.h
++++ b/components/service/secure_storage/include/psa/storage_common.h
+@@ -20,8 +20,8 @@ typedef uint64_t psa_storage_uid_t;
+ typedef uint32_t psa_storage_create_flags_t;
+ 
+ struct psa_storage_info_t {
+-	size_t capacity;
+-	size_t size;
++	uint32_t capacity;
++	uint32_t size;
+ 	psa_storage_create_flags_t flags;
+ };
+ 
+-- 
+2.38.0
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0009-Use-address-instead-of-pointers.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0009-Use-address-instead-of-pointers.patch
new file mode 100644
index 000000000000..ca0c9d9575c3
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0009-Use-address-instead-of-pointers.patch
@@ -0,0 +1,168 @@
+From ee767c1ae857cfcc8b4bb520b2558091e253cf94 Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Sun, 12 Dec 2021 10:57:17 +0000
+Subject: [PATCH 09/19] Use address instead of pointers
+
+Since secure enclave is 32bit and we 64bit there is an issue
+in the protocol communication design that force us to handle
+on our side the manipulation of address and pointers to make
+this work.
+
+Upstream-Status: Pending
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ .../service/common/include/psa/client.h       | 15 ++++++++++++++
+ .../service/common/psa_ipc/service_psa_ipc.c  | 20 ++++++++++++-------
+ .../secure_storage_ipc/secure_storage_ipc.c   | 20 +++++++++----------
+ 3 files changed, 38 insertions(+), 17 deletions(-)
+
+diff --git a/components/service/common/include/psa/client.h b/components/service/common/include/psa/client.h
+index 69ccf14f40a3..12dcd68f8a76 100644
+--- a/components/service/common/include/psa/client.h
++++ b/components/service/common/include/psa/client.h
+@@ -81,6 +81,21 @@ struct __attribute__ ((__packed__)) psa_outvec {
+     uint32_t len;                 /*!< the size in bytes                      */
+ };
+ 
++static void *psa_u32_to_ptr(uint32_t addr)
++{
++	return (void *)(uintptr_t)addr;
++}
++
++static uint32_t psa_ptr_to_u32(void *ptr)
++{
++	return (uintptr_t)ptr;
++}
++
++static uint32_t psa_ptr_const_to_u32(const void *ptr)
++{
++	return (uintptr_t)ptr;
++}
++
+ /*************************** PSA Client API **********************************/
+ 
+ /**
+diff --git a/components/service/common/psa_ipc/service_psa_ipc.c b/components/service/common/psa_ipc/service_psa_ipc.c
+index 5e5815dbc9cf..435c6c0a2eba 100644
+--- a/components/service/common/psa_ipc/service_psa_ipc.c
++++ b/components/service/common/psa_ipc/service_psa_ipc.c
+@@ -62,6 +62,11 @@ static size_t psa_call_out_vec_len(const struct psa_outvec *out_vec, size_t out_
+ 	return resp_len;
+ }
+ 
++static uint32_t psa_virt_to_phys_u32(struct rpc_caller *caller, void *va)
++{
++	return (uintptr_t)rpc_caller_virt_to_phys(caller, va);
++}
++
+ psa_handle_t psa_connect(struct rpc_caller *caller, uint32_t sid,
+ 			 uint32_t version)
+ {
+@@ -147,20 +152,20 @@ psa_status_t psa_call(struct rpc_caller *caller, psa_handle_t psa_handle,
+ 	req_msg->params.psa_call_params.handle = psa_handle;
+ 	req_msg->params.psa_call_params.type = type;
+ 	req_msg->params.psa_call_params.in_len = in_len;
+-	req_msg->params.psa_call_params.in_vec = rpc_caller_virt_to_phys(caller, in_vec_param);
++	req_msg->params.psa_call_params.in_vec = psa_virt_to_phys_u32(caller, in_vec_param);
+ 	req_msg->params.psa_call_params.out_len = out_len;
+-	req_msg->params.psa_call_params.out_vec = rpc_caller_virt_to_phys(caller, out_vec_param);
++	req_msg->params.psa_call_params.out_vec = psa_virt_to_phys_u32(caller, out_vec_param);
+ 
+ 	for (i = 0; i < in_len; i++) {
+-		in_vec_param[i].base = rpc_caller_virt_to_phys(caller, payload);
++		in_vec_param[i].base = psa_virt_to_phys_u32(caller, payload);
+ 		in_vec_param[i].len = in_vec[i].len;
+ 
+-		memcpy(payload, in_vec[i].base, in_vec[i].len);
++		memcpy(payload, psa_u32_to_ptr(in_vec[i].base), in_vec[i].len);
+ 		payload += in_vec[i].len;
+ 	}
+ 
+ 	for (i = 0; i < out_len; i++) {
+-		out_vec_param[i].base = NULL;
++		out_vec_param[i].base = 0;
+ 		out_vec_param[i].len = out_vec[i].len;
+ 	}
+ 
+@@ -182,11 +187,12 @@ psa_status_t psa_call(struct rpc_caller *caller, psa_handle_t psa_handle,
+ 		goto caller_end;
+ 
+ 	out_vec_param = (struct psa_outvec *)rpc_caller_phys_to_virt(caller,
+-						     resp_msg->params.out_vec);
++				psa_u32_to_ptr(resp_msg->params.out_vec));
+ 
+ 	for (i = 0; i < resp_msg->params.out_len; i++) {
+                 out_vec[i].len = out_vec_param[i].len;
+-		memcpy(out_vec[i].base, rpc_caller_phys_to_virt(caller, out_vec_param[i].base),
++		memcpy(psa_u32_to_ptr(out_vec[i].base),
++		       rpc_caller_phys_to_virt(caller,	psa_u32_to_ptr(out_vec_param[i].base)),
+ 		       out_vec[i].len);
+ 	}
+ 
+diff --git a/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c b/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c
+index a1f369db253e..bda442a61d5c 100644
+--- a/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c
++++ b/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c
+@@ -22,9 +22,9 @@ static psa_status_t secure_storage_ipc_set(void *context, uint32_t client_id,
+ 	psa_handle_t psa_handle;
+ 	psa_status_t psa_status;
+ 	struct psa_invec in_vec[] = {
+-		{ .base = &uid, .len = sizeof(uid) },
+-		{ .base = p_data, .len = data_length },
+-		{ .base = &create_flags, .len = sizeof(create_flags) },
++		{ .base = psa_ptr_to_u32(&uid), .len = sizeof(uid) },
++		{ .base = psa_ptr_const_to_u32(p_data), .len = data_length },
++		{ .base = psa_ptr_to_u32(&create_flags), .len = sizeof(create_flags) },
+ 	};
+ 
+ 	(void)client_id;
+@@ -53,11 +53,11 @@ static psa_status_t secure_storage_ipc_get(void *context,
+ 	psa_status_t psa_status;
+ 	uint32_t offset = (uint32_t)data_offset;
+ 	struct psa_invec in_vec[] = {
+-		{ .base = &uid, .len = sizeof(uid) },
+-		{ .base = &offset, .len = sizeof(offset) },
++		{ .base = psa_ptr_to_u32(&uid), .len = sizeof(uid) },
++		{ .base = psa_ptr_to_u32(&offset), .len = sizeof(offset) },
+ 	};
+ 	struct psa_outvec out_vec[] = {
+-		{ .base = p_data, .len = data_size },
++		{ .base = psa_ptr_to_u32(p_data), .len = data_size },
+ 	};
+ 
+ 	if (!p_data_length) {
+@@ -84,10 +84,10 @@ static psa_status_t secure_storage_ipc_get_info(void *context,
+ 	psa_handle_t psa_handle;
+ 	psa_status_t psa_status;
+ 	struct psa_invec in_vec[] = {
+-		{ .base = &uid, .len = sizeof(uid) },
++		{ .base = psa_ptr_to_u32(&uid), .len = sizeof(uid) },
+ 	};
+ 	struct psa_outvec out_vec[] = {
+-		{ .base = p_info, .len = sizeof(*p_info) },
++		{ .base = psa_ptr_to_u32(p_info), .len = sizeof(*p_info) },
+ 	};
+ 
+ 	(void)client_id;
+@@ -110,7 +110,7 @@ static psa_status_t secure_storage_ipc_remove(void *context,
+ 	psa_handle_t psa_handle;
+ 	psa_status_t psa_status;
+ 	struct psa_invec in_vec[] = {
+-		{ .base = &uid, .len = sizeof(uid) },
++		{ .base = psa_ptr_to_u32(&uid), .len = sizeof(uid) },
+ 	};
+ 
+ 	(void)client_id;
+@@ -164,7 +164,7 @@ static uint32_t secure_storage_get_support(void *context, uint32_t client_id)
+ 	psa_status_t psa_status;
+ 	uint32_t support_flags;
+ 	struct psa_outvec out_vec[] = {
+-		{ .base = &support_flags, .len =  sizeof(support_flags) },
++		{ .base = psa_ptr_to_u32(&support_flags), .len =  sizeof(support_flags) },
+ 	};
+ 
+ 	(void)client_id;
+-- 
+2.38.0
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0010-Add-psa-ipc-attestation-to-se-proxy.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0010-Add-psa-ipc-attestation-to-se-proxy.patch
new file mode 100644
index 000000000000..d47b0decf5e6
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0010-Add-psa-ipc-attestation-to-se-proxy.patch
@@ -0,0 +1,266 @@
+From afdeb8e098a1f2822adf2ea83ded8dd9e2d021ba Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Tue, 7 Dec 2021 11:50:00 +0000
+Subject: [PATCH 10/19] Add psa ipc attestation to se proxy
+
+Implement attestation client API as psa ipc and include it to
+se proxy deployment.
+
+Upstream-Status: Pending
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ .../client/psa_ipc/component.cmake            | 13 +++
+ .../client/psa_ipc/iat_ipc_client.c           | 86 +++++++++++++++++++
+ .../reporter/psa_ipc/component.cmake          | 13 +++
+ .../reporter/psa_ipc/psa_ipc_attest_report.c  | 45 ++++++++++
+ components/service/common/include/psa/sid.h   |  4 +
+ .../se-proxy/common/service_proxy_factory.c   |  6 ++
+ deployments/se-proxy/se-proxy.cmake           |  3 +-
+ 7 files changed, 169 insertions(+), 1 deletion(-)
+ create mode 100644 components/service/attestation/client/psa_ipc/component.cmake
+ create mode 100644 components/service/attestation/client/psa_ipc/iat_ipc_client.c
+ create mode 100644 components/service/attestation/reporter/psa_ipc/component.cmake
+ create mode 100644 components/service/attestation/reporter/psa_ipc/psa_ipc_attest_report.c
+
+diff --git a/components/service/attestation/client/psa_ipc/component.cmake b/components/service/attestation/client/psa_ipc/component.cmake
+new file mode 100644
+index 000000000000..a5bc6b4a387e
+--- /dev/null
++++ b/components/service/attestation/client/psa_ipc/component.cmake
+@@ -0,0 +1,13 @@
++#-------------------------------------------------------------------------------
++# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++#
++# SPDX-License-Identifier: BSD-3-Clause
++#
++#-------------------------------------------------------------------------------
++if (NOT DEFINED TGT)
++	message(FATAL_ERROR "mandatory parameter TGT is not defined.")
++endif()
++
++target_sources(${TGT} PRIVATE
++	"${CMAKE_CURRENT_LIST_DIR}/iat_ipc_client.c"
++	)
+diff --git a/components/service/attestation/client/psa_ipc/iat_ipc_client.c b/components/service/attestation/client/psa_ipc/iat_ipc_client.c
+new file mode 100644
+index 000000000000..30bd0a13a385
+--- /dev/null
++++ b/components/service/attestation/client/psa_ipc/iat_ipc_client.c
+@@ -0,0 +1,86 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#include <stddef.h>
++#include <string.h>
++
++#include "../psa/iat_client.h"
++#include <protocols/rpc/common/packed-c/status.h>
++#include <psa/initial_attestation.h>
++#include <psa/client.h>
++#include <psa/sid.h>
++#include <service/common/client/service_client.h>
++
++/**
++ * @brief      The singleton psa_iat_client instance
++ *
++ * The psa attestation C API assumes a single backend service provider.
++ */
++static struct service_client instance;
++
++
++psa_status_t psa_iat_client_init(struct rpc_caller *caller)
++{
++	return service_client_init(&instance, caller);
++}
++
++void psa_iat_client_deinit(void)
++{
++	service_client_deinit(&instance);
++}
++
++int psa_iat_client_rpc_status(void)
++{
++	return instance.rpc_status;
++}
++
++psa_status_t psa_initial_attest_get_token(const uint8_t *auth_challenge,
++					  size_t challenge_size,
++					  uint8_t *token_buf,
++					  size_t token_buf_size,
++					  size_t *token_size)
++{
++	psa_status_t status = PSA_ERROR_INVALID_ARGUMENT;
++	struct rpc_caller *caller = instance.caller;
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_const_to_u32(auth_challenge), .len = challenge_size},
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(token_buf), .len = token_buf_size},
++	};
++
++	if (!token_buf || !token_buf_size)
++		return PSA_ERROR_INVALID_ARGUMENT;
++
++	status = psa_call(caller, TFM_ATTESTATION_SERVICE_HANDLE,
++			  TFM_ATTEST_GET_TOKEN, in_vec, IOVEC_LEN(in_vec),
++			  out_vec, IOVEC_LEN(out_vec));
++	if (status == PSA_SUCCESS) {
++		*token_size = out_vec[0].len;
++	}
++
++	return status;
++}
++
++psa_status_t psa_initial_attest_get_token_size(size_t challenge_size,
++						size_t *token_size)
++{
++	struct rpc_caller *caller = instance.caller;
++	psa_status_t status;
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&challenge_size), .len = sizeof(uint32_t)}
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(token_size), .len = sizeof(uint32_t)}
++	};
++
++	status = psa_call(caller, TFM_ATTESTATION_SERVICE_HANDLE,
++			  TFM_ATTEST_GET_TOKEN_SIZE,
++			  in_vec, IOVEC_LEN(in_vec),
++			  out_vec, IOVEC_LEN(out_vec));
++
++	return status;
++}
+diff --git a/components/service/attestation/reporter/psa_ipc/component.cmake b/components/service/attestation/reporter/psa_ipc/component.cmake
+new file mode 100644
+index 000000000000..b37830c618fe
+--- /dev/null
++++ b/components/service/attestation/reporter/psa_ipc/component.cmake
+@@ -0,0 +1,13 @@
++#-------------------------------------------------------------------------------
++# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++#
++# SPDX-License-Identifier: BSD-3-Clause
++#
++#-------------------------------------------------------------------------------
++if (NOT DEFINED TGT)
++	message(FATAL_ERROR "mandatory parameter TGT is not defined.")
++endif()
++
++target_sources(${TGT} PRIVATE
++	"${CMAKE_CURRENT_LIST_DIR}/psa_ipc_attest_report.c"
++	)
+diff --git a/components/service/attestation/reporter/psa_ipc/psa_ipc_attest_report.c b/components/service/attestation/reporter/psa_ipc/psa_ipc_attest_report.c
+new file mode 100644
+index 000000000000..15805e8ed4b1
+--- /dev/null
++++ b/components/service/attestation/reporter/psa_ipc/psa_ipc_attest_report.c
+@@ -0,0 +1,45 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++/**
++ * A attestation reporter for psa ipc
++ */
++
++#include <stddef.h>
++#include <psa/error.h>
++#include <service/attestation/reporter/attest_report.h>
++#include <psa/initial_attestation.h>
++
++#define TOKEN_BUF_SIZE	1024
++
++static uint8_t token_buf[TOKEN_BUF_SIZE];
++
++int attest_report_create(int32_t client_id, const uint8_t *auth_challenge_data,
++			 size_t auth_challenge_len, const uint8_t **report,
++			 size_t *report_len)
++{
++	*report = token_buf;
++	psa_status_t ret;
++	size_t token_size = 0;
++
++	ret = psa_initial_attest_get_token(auth_challenge_data,
++					   auth_challenge_len, token_buf,
++					   TOKEN_BUF_SIZE, &token_size);
++	if (ret != PSA_SUCCESS) {
++		*report = NULL;
++		*report_len = 0;
++		return ret;
++	}
++
++	*report_len = token_size;
++
++	return PSA_SUCCESS;
++}
++
++void attest_report_destroy(const uint8_t *report)
++{
++	(void)report;
++}
+diff --git a/components/service/common/include/psa/sid.h b/components/service/common/include/psa/sid.h
+index aaa973c6e987..833f5039425f 100644
+--- a/components/service/common/include/psa/sid.h
++++ b/components/service/common/include/psa/sid.h
+@@ -50,6 +50,10 @@ extern "C" {
+ #define TFM_ATTESTATION_SERVICE_VERSION                            (1U)
+ #define TFM_ATTESTATION_SERVICE_HANDLE                             (0x40000103U)
+ 
++/* Initial Attestation message types that distinguish Attest services. */
++#define TFM_ATTEST_GET_TOKEN       1001
++#define TFM_ATTEST_GET_TOKEN_SIZE  1002
++
+ /******** TFM_SP_FWU ********/
+ #define TFM_FWU_WRITE_SID                                          (0x000000A0U)
+ #define TFM_FWU_WRITE_VERSION                                      (1U)
+diff --git a/deployments/se-proxy/common/service_proxy_factory.c b/deployments/se-proxy/common/service_proxy_factory.c
+index 57290056d614..4b8cceccbe4d 100644
+--- a/deployments/se-proxy/common/service_proxy_factory.c
++++ b/deployments/se-proxy/common/service_proxy_factory.c
+@@ -23,12 +23,18 @@ struct openamp_caller openamp;
+ struct rpc_interface *attest_proxy_create(void)
+ {
+ 	struct rpc_interface *attest_iface;
++	struct rpc_caller *attest_caller;
+ 
+ 	/* Static objects for proxy instance */
+ 	static struct attest_provider attest_provider;
+ 
++	attest_caller = openamp_caller_init(&openamp);
++	if (!attest_caller)
++		return NULL;
++
+ 	/* Initialize the service provider */
+ 	attest_iface = attest_provider_init(&attest_provider);
++	psa_iat_client_init(&openamp.rpc_caller);
+ 
+ 	attest_provider_register_serializer(&attest_provider,
+ 		TS_RPC_ENCODING_PACKED_C, packedc_attest_provider_serializer_instance());
+diff --git a/deployments/se-proxy/se-proxy.cmake b/deployments/se-proxy/se-proxy.cmake
+index cd51460406ca..38d26821d44d 100644
+--- a/deployments/se-proxy/se-proxy.cmake
++++ b/deployments/se-proxy/se-proxy.cmake
+@@ -49,12 +49,13 @@ add_components(TARGET "se-proxy"
+ 		"components/service/attestation/include"
+ 		"components/service/attestation/provider"
+ 		"components/service/attestation/provider/serializer/packed-c"
++		"components/service/attestation/reporter/psa_ipc"
++		"components/service/attestation/client/psa_ipc"
+ 		"components/rpc/openamp/caller/sp"
+ 
+ 		# Stub service provider backends
+ 		"components/rpc/dummy"
+ 		"components/rpc/common/caller"
+-		"components/service/attestation/reporter/stub"
+ 		"components/service/attestation/key_mngr/stub"
+ 		"components/service/crypto/backend/stub"
+ 		"components/service/crypto/client/psa"
+-- 
+2.38.0
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0011-Setup-its-backend-as-openamp-rpc-using-secure-storag.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0011-Setup-its-backend-as-openamp-rpc-using-secure-storag.patch
new file mode 100644
index 000000000000..988fbbecdd6c
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0011-Setup-its-backend-as-openamp-rpc-using-secure-storag.patch
@@ -0,0 +1,163 @@
+From 94770f9660154bb1157e19c11fb706889a81ae73 Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Thu, 9 Dec 2021 14:11:06 +0000
+Subject: [PATCH 11/19] Setup its backend as openamp rpc using secure storage
+ ipc implementation.
+
+Upstream-Status: Pending
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ components/service/common/include/psa/sid.h   | 12 +++++-----
+ .../secure_storage_ipc/secure_storage_ipc.c   | 20 ++++++++---------
+ .../secure_storage_ipc/secure_storage_ipc.h   |  1 +
+ .../se-proxy/common/service_proxy_factory.c   | 22 +++++++++++++------
+ 4 files changed, 32 insertions(+), 23 deletions(-)
+
+diff --git a/components/service/common/include/psa/sid.h b/components/service/common/include/psa/sid.h
+index 833f5039425f..4a951d4a3502 100644
+--- a/components/service/common/include/psa/sid.h
++++ b/components/service/common/include/psa/sid.h
+@@ -20,12 +20,12 @@ extern "C" {
+ /* Invalid UID */
+ #define TFM_PS_INVALID_UID 0
+ 
+-/* PS message types that distinguish PS services. */
+-#define TFM_PS_SET                1001
+-#define TFM_PS_GET                1002
+-#define TFM_PS_GET_INFO           1003
+-#define TFM_PS_REMOVE             1004
+-#define TFM_PS_GET_SUPPORT        1005
++/* PS / ITS message types that distinguish PS services. */
++#define TFM_PS_ITS_SET                1001
++#define TFM_PS_ITS_GET                1002
++#define TFM_PS_ITS_GET_INFO           1003
++#define TFM_PS_ITS_REMOVE             1004
++#define TFM_PS_ITS_GET_SUPPORT        1005
+ 
+ /******** TFM_SP_ITS ********/
+ #define TFM_INTERNAL_TRUSTED_STORAGE_SERVICE_SID                   (0x00000070U)
+diff --git a/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c b/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c
+index bda442a61d5c..0e1b48c0d2e2 100644
+--- a/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c
++++ b/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.c
+@@ -31,8 +31,8 @@ static psa_status_t secure_storage_ipc_set(void *context, uint32_t client_id,
+ 
+ 	ipc->client.rpc_status = TS_RPC_CALL_ACCEPTED;
+ 
+-	psa_status = psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
+-			      TFM_PS_SET, in_vec, IOVEC_LEN(in_vec), NULL, 0);
++	psa_status = psa_call(caller, ipc->service_handle, TFM_PS_ITS_SET,
++			      in_vec, IOVEC_LEN(in_vec), NULL, 0);
+ 	if (psa_status < 0)
+ 		EMSG("ipc_set: psa_call failed: %d", psa_status);
+ 
+@@ -65,8 +65,8 @@ static psa_status_t secure_storage_ipc_get(void *context,
+ 		return PSA_ERROR_INVALID_ARGUMENT;
+ 	}
+ 
+-	psa_status = psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
+-			      TFM_PS_GET, in_vec, IOVEC_LEN(in_vec),
++	psa_status = psa_call(caller, ipc->service_handle,
++			      TFM_PS_ITS_GET, in_vec, IOVEC_LEN(in_vec),
+ 			      out_vec, IOVEC_LEN(out_vec));
+ 	if (psa_status == PSA_SUCCESS)
+ 		*p_data_length = out_vec[0].len;
+@@ -92,8 +92,8 @@ static psa_status_t secure_storage_ipc_get_info(void *context,
+ 
+ 	(void)client_id;
+ 
+-	psa_status = psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
+-			      TFM_PS_GET_INFO, in_vec,
++	psa_status = psa_call(caller, ipc->service_handle,
++			      TFM_PS_ITS_GET_INFO, in_vec,
+ 			      IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
+ 	if (psa_status != PSA_SUCCESS)
+ 		EMSG("ipc_get_info: failed to psa_call: %d", psa_status);
+@@ -115,8 +115,8 @@ static psa_status_t secure_storage_ipc_remove(void *context,
+ 
+ 	(void)client_id;
+ 
+-	psa_status = psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
+-			      TFM_PS_REMOVE, in_vec,
++	psa_status = psa_call(caller, ipc->service_handle,
++			      TFM_PS_ITS_REMOVE, in_vec,
+ 			      IOVEC_LEN(in_vec), NULL, 0);
+ 	if (psa_status != PSA_SUCCESS)
+ 		EMSG("ipc_remove: failed to psa_call: %d", psa_status);
+@@ -169,8 +169,8 @@ static uint32_t secure_storage_get_support(void *context, uint32_t client_id)
+ 
+ 	(void)client_id;
+ 
+-	psa_status = psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
+-			      TFM_PS_GET_SUPPORT, NULL, 0,
++	psa_status = psa_call(caller, ipc->service_handle,
++			      TFM_PS_ITS_GET_SUPPORT, NULL, 0,
+ 			      out_vec, IOVEC_LEN(out_vec));
+ 	if (psa_status != PSA_SUCCESS)
+ 		EMSG("ipc_get_support: failed to psa_call: %d", psa_status);
+diff --git a/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.h b/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.h
+index e8c1e8fd2f92..d9949f6a9305 100644
+--- a/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.h
++++ b/components/service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.h
+@@ -21,6 +21,7 @@ struct secure_storage_ipc
+ {
+     struct storage_backend backend;
+     struct service_client client;
++    int32_t service_handle;
+ };
+ 
+ /**
+diff --git a/deployments/se-proxy/common/service_proxy_factory.c b/deployments/se-proxy/common/service_proxy_factory.c
+index 4b8cceccbe4d..1110ac46bf8b 100644
+--- a/deployments/se-proxy/common/service_proxy_factory.c
++++ b/deployments/se-proxy/common/service_proxy_factory.c
+@@ -5,6 +5,7 @@
+  */
+ 
+ #include <stddef.h>
++#include <psa/sid.h>
+ #include <rpc/common/endpoint/rpc_interface.h>
+ #include <rpc/openamp/caller/sp/openamp_caller.h>
+ #include <service/attestation/provider/attest_provider.h>
+@@ -60,23 +61,30 @@ struct rpc_interface *ps_proxy_create(void)
+ {
+ 	static struct secure_storage_provider ps_provider;
+ 	static struct secure_storage_ipc ps_backend;
+-	static struct rpc_caller *storage_caller;
++	struct rpc_caller *storage_caller;
+ 	struct storage_backend *backend;
+ 
+ 	storage_caller = openamp_caller_init(&openamp);
+ 	if (!storage_caller)
+ 		return NULL;
+ 	backend = secure_storage_ipc_init(&ps_backend, &openamp.rpc_caller);
++	ps_backend.service_handle = TFM_PROTECTED_STORAGE_SERVICE_HANDLE;
+ 
+ 	return secure_storage_provider_init(&ps_provider, backend);
+ }
+ 
+ struct rpc_interface *its_proxy_create(void)
+ {
+-	static struct mock_store its_backend;
+-	static struct secure_storage_provider its_provider;
+-
+-	struct storage_backend *backend = mock_store_init(&its_backend);
+-
+-	return secure_storage_provider_init(&its_provider, backend);
++        static struct secure_storage_provider its_provider;
++        static struct secure_storage_ipc its_backend;
++        struct rpc_caller *storage_caller;
++        struct storage_backend *backend;
++ 
++        storage_caller = openamp_caller_init(&openamp);
++        if (!storage_caller)
++        	return NULL;
++        backend = secure_storage_ipc_init(&its_backend, &openamp.rpc_caller);
++        its_backend.service_handle = TFM_INTERNAL_TRUSTED_STORAGE_SERVICE_HANDLE;
++ 
++        return secure_storage_provider_init(&its_provider, backend);
+ }
+-- 
+2.38.0
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0012-add-psa-ipc-crypto-backend.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0012-add-psa-ipc-crypto-backend.patch
new file mode 100644
index 000000000000..fdc39b0d3c8b
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0012-add-psa-ipc-crypto-backend.patch
@@ -0,0 +1,2584 @@
+From 896b5009bb07c4b53541290e1712856063411107 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Thu, 9 Dec 2021 14:17:39 +0000
+Subject: [PATCH 12/19] add psa ipc crypto backend
+
+Add psa ipc crypto backend and attach it to se proxy
+deployment.
+
+Upstream-Status: Pending
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ components/service/common/include/psa/sid.h   |  73 +++++
+ .../crypto/backend/psa_ipc/component.cmake    |  21 ++
+ .../backend/psa_ipc/crypto_ipc_backend.c      |  26 ++
+ .../backend/psa_ipc/crypto_ipc_backend.h      |  70 ++++
+ .../client/caller/psa_ipc/crypto_caller.h     |  34 ++
+ .../caller/psa_ipc/crypto_caller_aead.h       | 252 +++++++++++++++
+ .../crypto_caller_asymmetric_decrypt.h        |  76 +++++
+ .../crypto_caller_asymmetric_encrypt.h        |  76 +++++
+ .../caller/psa_ipc/crypto_caller_cipher.h     | 246 +++++++++++++++
+ .../caller/psa_ipc/crypto_caller_copy_key.h   |  57 ++++
+ .../psa_ipc/crypto_caller_destroy_key.h       |  51 +++
+ .../caller/psa_ipc/crypto_caller_export_key.h |  59 ++++
+ .../psa_ipc/crypto_caller_export_public_key.h |  59 ++++
+ .../psa_ipc/crypto_caller_generate_key.h      |  55 ++++
+ .../psa_ipc/crypto_caller_generate_random.h   |  57 ++++
+ .../crypto_caller_get_key_attributes.h        |  56 ++++
+ .../caller/psa_ipc/crypto_caller_hash.h       | 220 +++++++++++++
+ .../caller/psa_ipc/crypto_caller_import_key.h |  57 ++++
+ .../psa_ipc/crypto_caller_key_attributes.h    |  51 +++
+ .../psa_ipc/crypto_caller_key_derivation.h    | 298 ++++++++++++++++++
+ .../client/caller/psa_ipc/crypto_caller_mac.h | 207 ++++++++++++
+ .../caller/psa_ipc/crypto_caller_purge_key.h  |  51 +++
+ .../caller/psa_ipc/crypto_caller_sign_hash.h  |  64 ++++
+ .../psa_ipc/crypto_caller_verify_hash.h       |  59 ++++
+ .../crypto/include/psa/crypto_client_struct.h |   8 +-
+ .../service/crypto/include/psa/crypto_sizes.h |   2 +-
+ .../se-proxy/common/service_proxy_factory.c   |  15 +-
+ deployments/se-proxy/se-proxy.cmake           |   2 +-
+ .../providers/arm/corstone1000/platform.cmake |   2 +
+ 29 files changed, 2293 insertions(+), 11 deletions(-)
+ create mode 100644 components/service/crypto/backend/psa_ipc/component.cmake
+ create mode 100644 components/service/crypto/backend/psa_ipc/crypto_ipc_backend.c
+ create mode 100644 components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h
+ create mode 100644 components/service/crypto/client/caller/psa_ipc/crypto_caller.h
+ create mode 100644 components/service/crypto/client/caller/psa_ipc/crypto_caller_aead.h
+ create mode 100644 components/service/crypto/client/caller/psa_ipc/crypto_caller_asymmetric_decrypt.h
+ create mode 100644 components/service/crypto/client/caller/psa_ipc/crypto_caller_asymmetric_encrypt.h
+ create mode 100644 components/service/crypto/client/caller/psa_ipc/crypto_caller_cipher.h
+ create mode 100644 components/service/crypto/client/caller/psa_ipc/crypto_caller_copy_key.h
+ create mode 100644 components/service/crypto/client/caller/psa_ipc/crypto_caller_destroy_key.h
+ create mode 100644 components/service/crypto/client/caller/psa_ipc/crypto_caller_export_key.h
+ create mode 100644 components/service/crypto/client/caller/psa_ipc/crypto_caller_export_public_key.h
+ create mode 100644 components/service/crypto/client/caller/psa_ipc/crypto_caller_generate_key.h
+ create mode 100644 components/service/crypto/client/caller/psa_ipc/crypto_caller_generate_random.h
+ create mode 100644 components/service/crypto/client/caller/psa_ipc/crypto_caller_get_key_attributes.h
+ create mode 100644 components/service/crypto/client/caller/psa_ipc/crypto_caller_hash.h
+ create mode 100644 components/service/crypto/client/caller/psa_ipc/crypto_caller_import_key.h
+ create mode 100644 components/service/crypto/client/caller/psa_ipc/crypto_caller_key_attributes.h
+ create mode 100644 components/service/crypto/client/caller/psa_ipc/crypto_caller_key_derivation.h
+ create mode 100644 components/service/crypto/client/caller/psa_ipc/crypto_caller_mac.h
+ create mode 100644 components/service/crypto/client/caller/psa_ipc/crypto_caller_purge_key.h
+ create mode 100644 components/service/crypto/client/caller/psa_ipc/crypto_caller_sign_hash.h
+ create mode 100644 components/service/crypto/client/caller/psa_ipc/crypto_caller_verify_hash.h
+
+diff --git a/components/service/common/include/psa/sid.h b/components/service/common/include/psa/sid.h
+index 4a951d4a3502..7a29cc253bad 100644
+--- a/components/service/common/include/psa/sid.h
++++ b/components/service/common/include/psa/sid.h
+@@ -37,6 +37,79 @@ extern "C" {
+ #define TFM_CRYPTO_VERSION                                         (1U)
+ #define TFM_CRYPTO_HANDLE                                          (0x40000100U)
+ 
++/**
++ * \brief Define a progressive numerical value for each SID which can be used
++ *        when dispatching the requests to the service
++ */
++enum {
++    TFM_CRYPTO_GET_KEY_ATTRIBUTES_SID = (0u),
++    TFM_CRYPTO_RESET_KEY_ATTRIBUTES_SID,
++    TFM_CRYPTO_OPEN_KEY_SID,
++    TFM_CRYPTO_CLOSE_KEY_SID,
++    TFM_CRYPTO_IMPORT_KEY_SID,
++    TFM_CRYPTO_DESTROY_KEY_SID,
++    TFM_CRYPTO_EXPORT_KEY_SID,
++    TFM_CRYPTO_EXPORT_PUBLIC_KEY_SID,
++    TFM_CRYPTO_PURGE_KEY_SID,
++    TFM_CRYPTO_COPY_KEY_SID,
++    TFM_CRYPTO_HASH_COMPUTE_SID,
++    TFM_CRYPTO_HASH_COMPARE_SID,
++    TFM_CRYPTO_HASH_SETUP_SID,
++    TFM_CRYPTO_HASH_UPDATE_SID,
++    TFM_CRYPTO_HASH_FINISH_SID,
++    TFM_CRYPTO_HASH_VERIFY_SID,
++    TFM_CRYPTO_HASH_ABORT_SID,
++    TFM_CRYPTO_HASH_CLONE_SID,
++    TFM_CRYPTO_MAC_COMPUTE_SID,
++    TFM_CRYPTO_MAC_VERIFY_SID,
++    TFM_CRYPTO_MAC_SIGN_SETUP_SID,
++    TFM_CRYPTO_MAC_VERIFY_SETUP_SID,
++    TFM_CRYPTO_MAC_UPDATE_SID,
++    TFM_CRYPTO_MAC_SIGN_FINISH_SID,
++    TFM_CRYPTO_MAC_VERIFY_FINISH_SID,
++    TFM_CRYPTO_MAC_ABORT_SID,
++    TFM_CRYPTO_CIPHER_ENCRYPT_SID,
++    TFM_CRYPTO_CIPHER_DECRYPT_SID,
++    TFM_CRYPTO_CIPHER_ENCRYPT_SETUP_SID,
++    TFM_CRYPTO_CIPHER_DECRYPT_SETUP_SID,
++    TFM_CRYPTO_CIPHER_GENERATE_IV_SID,
++    TFM_CRYPTO_CIPHER_SET_IV_SID,
++    TFM_CRYPTO_CIPHER_UPDATE_SID,
++    TFM_CRYPTO_CIPHER_FINISH_SID,
++    TFM_CRYPTO_CIPHER_ABORT_SID,
++    TFM_CRYPTO_AEAD_ENCRYPT_SID,
++    TFM_CRYPTO_AEAD_DECRYPT_SID,
++    TFM_CRYPTO_AEAD_ENCRYPT_SETUP_SID,
++    TFM_CRYPTO_AEAD_DECRYPT_SETUP_SID,
++    TFM_CRYPTO_AEAD_GENERATE_NONCE_SID,
++    TFM_CRYPTO_AEAD_SET_NONCE_SID,
++    TFM_CRYPTO_AEAD_SET_LENGTHS_SID,
++    TFM_CRYPTO_AEAD_UPDATE_AD_SID,
++    TFM_CRYPTO_AEAD_UPDATE_SID,
++    TFM_CRYPTO_AEAD_FINISH_SID,
++    TFM_CRYPTO_AEAD_VERIFY_SID,
++    TFM_CRYPTO_AEAD_ABORT_SID,
++    TFM_CRYPTO_SIGN_MESSAGE_SID,
++    TFM_CRYPTO_VERIFY_MESSAGE_SID,
++    TFM_CRYPTO_SIGN_HASH_SID,
++    TFM_CRYPTO_VERIFY_HASH_SID,
++    TFM_CRYPTO_ASYMMETRIC_ENCRYPT_SID,
++    TFM_CRYPTO_ASYMMETRIC_DECRYPT_SID,
++    TFM_CRYPTO_KEY_DERIVATION_SETUP_SID,
++    TFM_CRYPTO_KEY_DERIVATION_GET_CAPACITY_SID,
++    TFM_CRYPTO_KEY_DERIVATION_SET_CAPACITY_SID,
++    TFM_CRYPTO_KEY_DERIVATION_INPUT_BYTES_SID,
++    TFM_CRYPTO_KEY_DERIVATION_INPUT_KEY_SID,
++    TFM_CRYPTO_KEY_DERIVATION_KEY_AGREEMENT_SID,
++    TFM_CRYPTO_KEY_DERIVATION_OUTPUT_BYTES_SID,
++    TFM_CRYPTO_KEY_DERIVATION_OUTPUT_KEY_SID,
++    TFM_CRYPTO_KEY_DERIVATION_ABORT_SID,
++    TFM_CRYPTO_RAW_KEY_AGREEMENT_SID,
++    TFM_CRYPTO_GENERATE_RANDOM_SID,
++    TFM_CRYPTO_GENERATE_KEY_SID,
++    TFM_CRYPTO_SID_MAX,
++};
++
+ /******** TFM_SP_PLATFORM ********/
+ #define TFM_SP_PLATFORM_SYSTEM_RESET_SID                           (0x00000040U)
+ #define TFM_SP_PLATFORM_SYSTEM_RESET_VERSION                       (1U)
+diff --git a/components/service/crypto/backend/psa_ipc/component.cmake b/components/service/crypto/backend/psa_ipc/component.cmake
+new file mode 100644
+index 000000000000..93c297a83ac6
+--- /dev/null
++++ b/components/service/crypto/backend/psa_ipc/component.cmake
+@@ -0,0 +1,21 @@
++#-------------------------------------------------------------------------------
++# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++#
++# SPDX-License-Identifier: BSD-3-Clause
++#
++#-------------------------------------------------------------------------------
++if (NOT DEFINED TGT)
++	message(FATAL_ERROR "mandatory parameter TGT is not defined.")
++endif()
++
++target_sources(${TGT} PRIVATE
++	"${CMAKE_CURRENT_LIST_DIR}/crypto_ipc_backend.c"
++	)
++
++# The ipc crypto backend uses the psa crypto client to realize the
++# psa crypto API that the crypto provider depends on.  This define
++# configures the psa crypto client to be built with the ipc crypto
++# caller.
++target_compile_definitions(${TGT} PRIVATE
++	PSA_CRYPTO_CLIENT_CALLER_SELECTION_H="service/crypto/client/caller/psa_ipc/crypto_caller.h"
++)
+diff --git a/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.c b/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.c
+new file mode 100644
+index 000000000000..e47cd4ffb4ce
+--- /dev/null
++++ b/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.c
+@@ -0,0 +1,26 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#include <stddef.h>
++#include <psa/crypto.h>
++#include <service/crypto/client/psa/psa_crypto_client.h>
++#include <protocols/rpc/common/packed-c/status.h>
++#include "crypto_ipc_backend.h"
++
++psa_status_t crypto_ipc_backend_init(struct rpc_caller *caller)
++{
++	psa_status_t status = psa_crypto_client_init(caller);
++
++	if (status == PSA_SUCCESS)
++		status = psa_crypto_init();
++
++	return status;
++}
++
++void crypto_ipc_backend_deinit(void)
++{
++	psa_crypto_client_deinit();
++}
+diff --git a/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h b/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h
+new file mode 100644
+index 000000000000..c13c20e84131
+--- /dev/null
++++ b/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h
+@@ -0,0 +1,70 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef CRYPTO_IPC_BACKEND_H
++#define CRYPTO_IPC_BACKEND_H
++
++#include <service/crypto/client/psa/psa_crypto_client.h>
++#include <psa/error.h>
++#include <rpc_caller.h>
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++/**
++ * \brief This type is used to overcome a limitation in the number of maximum
++ *        IOVECs that can be used especially in psa_aead_encrypt and
++ *        psa_aead_decrypt. To be removed in case the AEAD APIs number of
++ *        parameters passed gets restructured
++ */
++#define TFM_CRYPTO_MAX_NONCE_LENGTH (16u)
++struct psa_ipc_crypto_aead_pack_input {
++	uint8_t nonce[TFM_CRYPTO_MAX_NONCE_LENGTH];
++	uint32_t nonce_length;
++};
++
++struct psa_ipc_crypto_pack_iovec {
++	uint32_t sfn_id;             /*!< Secure function ID used to dispatch the
++				      *   request
++				      */
++	uint16_t step;               /*!< Key derivation step */
++	psa_key_id_t key_id;         /*!< Key id */
++	psa_algorithm_t alg;         /*!< Algorithm */
++	uint32_t op_handle;          /*!< Frontend context handle associated to a
++				      *   multipart operation
++				      */
++	uint32_t capacity;             /*!< Key derivation capacity */
++
++	struct psa_ipc_crypto_aead_pack_input aead_in; /*!< FixMe: Temporarily used for
++							    *   AEAD until the API is
++							    *   restructured
++							    */
++};
++
++#define iov_size sizeof(struct psa_ipc_crypto_pack_iovec)
++
++/**
++ * \brief Initialize the psa ipc crypto backend
++ *
++ * Initializes a crypto backend that uses the psa API client with a
++ * psa_ipc_backend caller to realize the PSA crypto API used by the crypto
++ * service proviser.
++ *
++ * \return PSA_SUCCESS if backend initialized successfully
++ */
++psa_status_t crypto_ipc_backend_init(struct rpc_caller *caller);
++
++/**
++ * \brief Clean-up to free any resource used by the crypto backend
++ */
++void crypto_ipc_backend_deinit(void);
++
++#ifdef __cplusplus
++} /* extern "C" */
++#endif
++
++#endif /* CRYPTO_IPC_BACKEND_H */
+diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller.h
+new file mode 100644
+index 000000000000..0a972187062f
+--- /dev/null
++++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller.h
+@@ -0,0 +1,34 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef PSA_IPC_CRYPTO_CALLER_H
++#define PSA_IPC_CRYPTO_CALLER_H
++
++/**
++ * Includes all header files that form the psa ipc crypto caller
++ * interface.  May be used by a client that needs to call operations
++ * provided by a crypto service instance using the psa ipc interface.
++ */
++#include "crypto_caller_aead.h"
++#include "crypto_caller_asymmetric_decrypt.h"
++#include "crypto_caller_asymmetric_encrypt.h"
++#include "crypto_caller_cipher.h"
++#include "crypto_caller_copy_key.h"
++#include "crypto_caller_destroy_key.h"
++#include "crypto_caller_export_key.h"
++#include "crypto_caller_export_public_key.h"
++#include "crypto_caller_generate_key.h"
++#include "crypto_caller_generate_random.h"
++#include "crypto_caller_get_key_attributes.h"
++#include "crypto_caller_hash.h"
++#include "crypto_caller_import_key.h"
++#include "crypto_caller_key_derivation.h"
++#include "crypto_caller_mac.h"
++#include "crypto_caller_purge_key.h"
++#include "crypto_caller_sign_hash.h"
++#include "crypto_caller_verify_hash.h"
++
++#endif /* PSA_IPC_CRYPTO_CALLER_H */
+diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_aead.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_aead.h
+new file mode 100644
+index 000000000000..78517fe32ca9
+--- /dev/null
++++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_aead.h
+@@ -0,0 +1,252 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef PSA_IPC_CRYPTO_CALLER_AEAD_H
++#define PSA_IPC_CRYPTO_CALLER_AEAD_H
++
++#include <string.h>
++#include <stdlib.h>
++#include <psa/crypto.h>
++#include <psa/client.h>
++#include <psa/sid.h>
++#include <service/common/client/service_client.h>
++#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
++#include <protocols/rpc/common/packed-c/status.h>
++#include <protocols/service/crypto/packed-c/opcodes.h>
++#include <protocols/service/crypto/packed-c/key_attributes.h>
++#include <protocols/service/crypto/packed-c/import_key.h>
++#include "crypto_caller_key_attributes.h"
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++static inline psa_status_t crypto_caller_aead_encrypt(
++					      struct service_client *context,
++					      psa_key_id_t key,
++					      psa_algorithm_t alg,
++					      const uint8_t *nonce,
++					      size_t nonce_length,
++					      const uint8_t *additional_data,
++					      size_t additional_data_length,
++					      const uint8_t *plaintext,
++					      size_t plaintext_length,
++					      uint8_t *aeadtext,
++					      size_t aeadtext_size,
++					      size_t *aeadtext_length)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	size_t in_len;
++	int i;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_AEAD_ENCRYPT_SID,
++		.key_id = key,
++		.alg = alg,
++		.aead_in = { .nonce = {0}, .nonce_length = nonce_length },
++	};
++
++	if (!additional_data && additional_data_length)
++		return PSA_ERROR_INVALID_ARGUMENT;
++
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = iov_size },
++		{ .base = psa_ptr_const_to_u32(plaintext),
++			.len = plaintext_length },
++		{ .base = psa_ptr_const_to_u32(additional_data),
++			.len = additional_data_length},
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(aeadtext), .len = aeadtext_size },
++	};
++
++	if (nonce_length > TFM_CRYPTO_MAX_NONCE_LENGTH)
++		return PSA_ERROR_INVALID_ARGUMENT;
++
++	if (nonce) {
++		for (i = 0; i < nonce_length; i++)
++			iov.aead_in.nonce[i] = nonce[i];
++	}
++
++	in_len = IOVEC_LEN(in_vec);
++
++	if (!additional_data)
++		in_len--;
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  in_len, out_vec, IOVEC_LEN(out_vec));
++
++	*aeadtext_length = out_vec[0].len;
++
++	return status;
++}
++
++static inline psa_status_t crypto_caller_aead_decrypt(
++					      struct service_client *context,
++					      psa_key_id_t key,
++					      psa_algorithm_t alg,
++					      const uint8_t *nonce,
++					      size_t nonce_length,
++					      const uint8_t *additional_data,
++					      size_t additional_data_length,
++					      const uint8_t *aeadtext,
++					      size_t aeadtext_length,
++					      uint8_t *plaintext,
++					      size_t plaintext_size,
++					      size_t *plaintext_length)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	size_t in_len;
++	int i;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_AEAD_DECRYPT_SID,
++		.key_id = key,
++		.alg = alg,
++		.aead_in = { .nonce = {0}, .nonce_length = nonce_length },
++	};
++
++	if (!additional_data && additional_data_length)
++		return PSA_ERROR_INVALID_ARGUMENT;
++
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = iov_size },
++		{ .base = psa_ptr_const_to_u32(aeadtext),
++			.len = aeadtext_length },
++		{ .base = psa_ptr_const_to_u32(additional_data),
++			.len = additional_data_length},
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(plaintext), .len = plaintext_size },
++	};
++
++	if (nonce_length > TFM_CRYPTO_MAX_NONCE_LENGTH)
++		return PSA_ERROR_INVALID_ARGUMENT;
++
++	if (nonce) {
++		for (i = 0; i < nonce_length; i++)
++			iov.aead_in.nonce[i] = nonce[i];
++	}
++
++	in_len = IOVEC_LEN(in_vec);
++
++	if (!additional_data)
++		in_len--;
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  in_len, out_vec, IOVEC_LEN(out_vec));
++
++	*plaintext_length = out_vec[0].len;
++
++	return status;
++}
++
++static inline psa_status_t crypto_caller_aead_encrypt_setup(
++					    struct service_client *context,
++					    uint32_t *op_handle,
++					    psa_key_id_t key,
++					    psa_algorithm_t alg)
++{
++	return PSA_ERROR_NOT_SUPPORTED;
++}
++
++static inline psa_status_t crypto_caller_aead_decrypt_setup(
++					    struct service_client *context,
++					    uint32_t *op_handle,
++					    psa_key_id_t key,
++					    psa_algorithm_t alg)
++{
++	return PSA_ERROR_NOT_SUPPORTED;
++}
++
++static inline psa_status_t crypto_caller_aead_generate_nonce(
++					     struct service_client *context,
++					     uint32_t op_handle,
++					     uint8_t *nonce,
++					     size_t nonce_size,
++					     size_t *nonce_length)
++{
++	return PSA_ERROR_NOT_SUPPORTED;
++}
++
++static inline psa_status_t crypto_caller_aead_set_nonce(
++						struct service_client *context,
++						uint32_t op_handle,
++						const uint8_t *nonce,
++						size_t nonce_length)
++{
++	return PSA_ERROR_NOT_SUPPORTED;
++}
++
++static inline psa_status_t crypto_caller_aead_set_lengths(
++					  struct service_client *context,
++					  uint32_t op_handle,
++					  size_t ad_length,
++					  size_t plaintext_length)
++{
++	return PSA_ERROR_NOT_SUPPORTED;
++}
++
++static inline psa_status_t crypto_caller_aead_update_ad(
++						struct service_client *context,
++						uint32_t op_handle,
++						const uint8_t *input,
++						size_t input_length)
++{
++	return PSA_ERROR_NOT_SUPPORTED;
++}
++
++static inline psa_status_t crypto_caller_aead_update(
++					     struct service_client *context,
++					     uint32_t op_handle,
++					     const uint8_t *input,
++					     size_t input_length,
++					     uint8_t *output,
++					     size_t output_size,
++					     size_t *output_length)
++{
++	return PSA_ERROR_NOT_SUPPORTED;
++}
++
++static inline psa_status_t crypto_caller_aead_finish(
++					     struct service_client *context,
++					     uint32_t op_handle,
++					     uint8_t *aeadtext,
++					     size_t aeadtext_size,
++					     size_t *aeadtext_length,
++					     uint8_t *tag,
++					     size_t tag_size,
++					     size_t *tag_length)
++{
++	return PSA_ERROR_NOT_SUPPORTED;
++}
++
++static inline psa_status_t crypto_caller_aead_verify(
++					     struct service_client *context,
++					     uint32_t op_handle,
++					     uint8_t *plaintext,
++					     size_t plaintext_size,
++					     size_t *plaintext_length,
++					     const uint8_t *tag,
++					     size_t tag_length)
++{
++	return PSA_ERROR_NOT_SUPPORTED;
++}
++
++static inline psa_status_t crypto_caller_aead_abort(
++					    struct service_client *context,
++					    uint32_t op_handle)
++{
++	return PSA_ERROR_NOT_SUPPORTED;
++}
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* PSA_IPC_CRYPTO_CALLER_AEAD_H */
+diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_asymmetric_decrypt.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_asymmetric_decrypt.h
+new file mode 100644
+index 000000000000..ff01815c09e9
+--- /dev/null
++++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_asymmetric_decrypt.h
+@@ -0,0 +1,76 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef PSA_IPC_CRYPTO_CALLER_ASYMMETRIC_DECRYPT_H
++#define PSA_IPC_CRYPTO_CALLER_ASYMMETRIC_DECRYPT_H
++
++#include <string.h>
++#include <stdlib.h>
++#include <psa/crypto.h>
++#include <psa/client.h>
++#include <psa/sid.h>
++#include <service/common/client/service_client.h>
++#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
++#include <protocols/rpc/common/packed-c/status.h>
++#include <protocols/service/crypto/packed-c/opcodes.h>
++#include <protocols/service/crypto/packed-c/key_attributes.h>
++#include <protocols/service/crypto/packed-c/import_key.h>
++#include "crypto_caller_key_attributes.h"
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++static inline psa_status_t crypto_caller_asymmetric_decrypt(
++				    struct service_client *context,
++				    psa_key_id_t id,
++				    psa_algorithm_t alg,
++				    const uint8_t *input, size_t input_length,
++				    const uint8_t *salt, size_t salt_length,
++				    uint8_t *output, size_t output_size,
++				    size_t *output_length)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	size_t in_len;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_ASYMMETRIC_DECRYPT_SID,
++		.key_id = id,
++		.alg = alg,
++	};
++
++	/* Sanitize optional input */
++	if (!salt && salt_length)
++		return PSA_ERROR_INVALID_ARGUMENT;
++
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = iov_size },
++		{ .base = psa_ptr_const_to_u32(input), .len = input_length },
++		{ .base = psa_ptr_const_to_u32(salt), .len = salt_length },
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(output), .len = output_size },
++	};
++
++
++	in_len = IOVEC_LEN(in_vec);
++	if (!salt)
++		in_len--;
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  in_len, out_vec, IOVEC_LEN(out_vec));
++
++	*output_length = out_vec[0].len;
++
++	return status;
++}
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* PSA_IPC_CRYPTO_CALLER_ASYMMETRIC_DECRYPT_H */
+diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_asymmetric_encrypt.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_asymmetric_encrypt.h
+new file mode 100644
+index 000000000000..1daf1689c076
+--- /dev/null
++++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_asymmetric_encrypt.h
+@@ -0,0 +1,76 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef PSA_IPC_CRYPTO_CALLER_ASYMMETRIC_ENCRYPT_H
++#define PSA_IPC_CRYPTO_CALLER_ASYMMETRIC_ENCRYPT_H
++
++#include <string.h>
++#include <stdlib.h>
++#include <psa/crypto.h>
++#include <psa/client.h>
++#include <psa/sid.h>
++#include <service/common/client/service_client.h>
++#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
++#include <protocols/rpc/common/packed-c/status.h>
++#include <protocols/service/crypto/packed-c/opcodes.h>
++#include <protocols/service/crypto/packed-c/key_attributes.h>
++#include <protocols/service/crypto/packed-c/import_key.h>
++#include "crypto_caller_key_attributes.h"
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++static inline psa_status_t crypto_caller_asymmetric_encrypt(
++				    struct service_client *context,
++				    psa_key_id_t id,
++				    psa_algorithm_t alg,
++				    const uint8_t *input, size_t input_length,
++				    const uint8_t *salt, size_t salt_length,
++				    uint8_t *output, size_t output_size,
++				    size_t *output_length)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	size_t in_len;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_ASYMMETRIC_ENCRYPT_SID,
++		.key_id = id,
++		.alg = alg,
++	};
++
++	/* Sanitize optional input */
++	if (!salt && salt_length)
++		return PSA_ERROR_INVALID_ARGUMENT;
++
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = iov_size },
++		{ .base = psa_ptr_const_to_u32(input), .len = input_length },
++		{ .base = psa_ptr_const_to_u32(salt), .len = salt_length },
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(output), .len = output_size },
++	};
++
++
++	in_len = IOVEC_LEN(in_vec);
++	if (!salt)
++		in_len--;
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  in_len, out_vec, IOVEC_LEN(out_vec));
++
++	*output_length = out_vec[0].len;
++
++	return status;
++}
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* PSA_IPC_CRYPTO_CALLER_ASYMMETRIC_ENCRYPT_H */
+diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_cipher.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_cipher.h
+new file mode 100644
+index 000000000000..fbefb28d813a
+--- /dev/null
++++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_cipher.h
+@@ -0,0 +1,246 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef PSA_IPC_CRYPTO_CALLER_CIPHER_H
++#define PSA_IPC_CRYPTO_CALLER_CIPHER_H
++
++#include <string.h>
++#include <stdlib.h>
++#include <psa/crypto.h>
++#include <psa/client.h>
++#include <psa/sid.h>
++#include <service/common/client/service_client.h>
++#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
++#include <protocols/rpc/common/packed-c/status.h>
++#include <protocols/service/crypto/packed-c/opcodes.h>
++#include <protocols/service/crypto/packed-c/key_attributes.h>
++#include <protocols/service/crypto/packed-c/import_key.h>
++#include "crypto_caller_key_attributes.h"
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++static inline psa_status_t crypto_caller_cipher_encrypt_setup(
++					      struct service_client *context,
++					      uint32_t *op_handle,
++					      psa_key_id_t key,
++					      psa_algorithm_t alg)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_CIPHER_ENCRYPT_SETUP_SID,
++		.key_id = key,
++		.alg = alg,
++		.op_handle = *op_handle,
++	};
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = iov_size },
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(op_handle), .len = sizeof(uint32_t) }
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++	return status;
++}
++
++static inline psa_status_t crypto_caller_cipher_decrypt_setup(
++					      struct service_client *context,
++					      uint32_t *op_handle,
++					      psa_key_id_t key,
++					      psa_algorithm_t alg)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_CIPHER_DECRYPT_SETUP_SID,
++		.key_id = key,
++		.alg = alg,
++		.op_handle = *op_handle,
++	};
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = iov_size },
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(op_handle), .len = sizeof(uint32_t) }
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++	return status;
++}
++
++static inline psa_status_t crypto_caller_cipher_generate_iv(
++					    struct service_client *context,
++					    uint32_t op_handle,
++					    uint8_t *iv,
++					    size_t iv_size,
++					    size_t *iv_length)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_CIPHER_GENERATE_IV_SID,
++		.op_handle = op_handle,
++	};
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = iov_size },
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(&op_handle), .len = sizeof(uint32_t) },
++		{ .base = psa_ptr_to_u32(iv), .len = iv_size },
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++	*iv_length = out_vec[1].len;
++
++	return status;
++}
++
++static inline psa_status_t crypto_caller_cipher_set_iv(
++					       struct service_client *context,
++					       uint32_t op_handle,
++					       const uint8_t *iv,
++					       size_t iv_length)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_CIPHER_SET_IV_SID,
++		.op_handle = op_handle,
++	};
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = iov_size },
++		{ .base = psa_ptr_const_to_u32(iv), .len = iv_length },
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(&op_handle), .len = sizeof(uint32_t) },
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++	return status;
++}
++
++static inline psa_status_t crypto_caller_cipher_update(
++					       struct service_client *context,
++					       uint32_t op_handle,
++					       const uint8_t *input,
++					       size_t input_length,
++					       uint8_t *output,
++					       size_t output_size,
++					       size_t *output_length)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_CIPHER_UPDATE_SID,
++		.op_handle = op_handle,
++	};
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = iov_size },
++		{ .base = psa_ptr_const_to_u32(input), .len = input_length },
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(&op_handle), .len = sizeof(uint32_t) },
++		{ .base = psa_ptr_to_u32(output), .len = output_size },
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++	*output_length = out_vec[1].len;
++
++	return status;
++}
++
++static inline psa_status_t crypto_caller_cipher_finish(
++					       struct service_client *context,
++					       uint32_t op_handle,
++					       uint8_t *output,
++					       size_t output_size,
++					       size_t *output_length)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_CIPHER_FINISH_SID,
++		.op_handle = op_handle,
++	};
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = iov_size },
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(&op_handle), .len = sizeof(uint32_t) },
++		{ .base = psa_ptr_to_u32(output), .len = output_size },
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++	*output_length = out_vec[1].len;
++
++	return status;
++}
++
++static inline psa_status_t crypto_caller_cipher_abort(
++					      struct service_client *context,
++					      uint32_t op_handle)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_CIPHER_ABORT_SID,
++		.op_handle = op_handle,
++	};
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = iov_size },
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(&op_handle), .len = sizeof(uint32_t) },
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++	return status;
++}
++
++static inline size_t crypto_caller_cipher_max_update_size(const struct service_client *context)
++{
++	/* Returns the maximum number of bytes that may be
++	 * carried as a parameter of the cipher_update operation
++	 * using the ipc encoding.
++	 */
++	size_t payload_space = context->service_info.max_payload;
++	size_t overhead = iov_size;
++
++	/* Allow for output to be a whole number of blocks */
++	overhead += PSA_BLOCK_CIPHER_BLOCK_MAX_SIZE;
++
++	return (payload_space > overhead) ? payload_space - overhead : 0;
++}
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* PSA_IPC_CRYPTO_CALLER_CIPHER_H */
+diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_copy_key.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_copy_key.h
+new file mode 100644
+index 000000000000..9a988171b098
+--- /dev/null
++++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_copy_key.h
+@@ -0,0 +1,57 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef PSA_IPC_CRYPTO_CALLER_COPY_KEY_H
++#define PSA_IPC_CRYPTO_CALLER_COPY_KEY_H
++
++#include <string.h>
++#include <stdlib.h>
++#include <psa/crypto.h>
++#include <psa/client.h>
++#include <psa/sid.h>
++#include <service/common/client/service_client.h>
++#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
++#include <protocols/rpc/common/packed-c/status.h>
++#include <protocols/service/crypto/packed-c/opcodes.h>
++#include <protocols/service/crypto/packed-c/key_attributes.h>
++#include <protocols/service/crypto/packed-c/import_key.h>
++#include "crypto_caller_key_attributes.h"
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++static inline psa_status_t crypto_caller_copy_key(struct service_client *context,
++						  psa_key_id_t source_key,
++						  const psa_key_attributes_t *attributes,
++						  psa_key_id_t *target_key)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_COPY_KEY_SID,
++		.key_id = source_key,
++	};
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = sizeof(struct psa_ipc_crypto_pack_iovec) },
++		{ .base = psa_ptr_const_to_u32(attributes), .len = sizeof(psa_key_attributes_t) },
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(target_key), .len = sizeof(psa_key_id_t) }
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++	return status;
++}
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* PSA_IPC_CRYPTO_CALLER_COPY_KEY_H */
+diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_destroy_key.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_destroy_key.h
+new file mode 100644
+index 000000000000..d00f4faa7a52
+--- /dev/null
++++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_destroy_key.h
+@@ -0,0 +1,51 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef PSA_IPC_CRYPTO_CALLER_DESTROY_KEY_H
++#define PSA_IPC_CRYPTO_CALLER_DESTROY_KEY_H
++
++#include <string.h>
++#include <stdlib.h>
++#include <psa/crypto.h>
++#include <psa/client.h>
++#include <psa/sid.h>
++#include <service/common/client/service_client.h>
++#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
++#include <protocols/rpc/common/packed-c/status.h>
++#include <protocols/service/crypto/packed-c/opcodes.h>
++#include <protocols/service/crypto/packed-c/key_attributes.h>
++#include <protocols/service/crypto/packed-c/import_key.h>
++#include "crypto_caller_key_attributes.h"
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++static inline psa_status_t crypto_caller_destroy_key(struct service_client *context,
++						     psa_key_id_t id)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_DESTROY_KEY_SID,
++		.key_id = id,
++	};
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = sizeof(struct psa_ipc_crypto_pack_iovec) },
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), NULL, 0);
++
++	return status;
++}
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* PSA_IPC_CRYPTO_CALLER_DESTROY_KEY_H */
+diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_export_key.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_export_key.h
+new file mode 100644
+index 000000000000..8ac5477f7b9a
+--- /dev/null
++++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_export_key.h
+@@ -0,0 +1,59 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef PSA_IPC_CRYPTO_CALLER_EXPORT_KEY_H
++#define PSA_IPC_CRYPTO_CALLER_EXPORT_KEY_H
++
++#include <string.h>
++#include <stdlib.h>
++#include <psa/crypto.h>
++#include <psa/client.h>
++#include <psa/sid.h>
++#include <service/common/client/service_client.h>
++#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
++#include <protocols/rpc/common/packed-c/status.h>
++#include <protocols/service/crypto/packed-c/opcodes.h>
++#include <protocols/service/crypto/packed-c/key_attributes.h>
++#include <protocols/service/crypto/packed-c/import_key.h>
++#include "crypto_caller_key_attributes.h"
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++static inline psa_status_t crypto_caller_export_key(struct service_client *context,
++						    psa_key_id_t id,
++						    uint8_t *data,
++						    size_t data_size,
++						    size_t *data_length)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_EXPORT_KEY_SID,
++		.key_id = id,
++	};
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = sizeof(struct psa_ipc_crypto_pack_iovec) },
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(data), .len = data_size }
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++	*data_length = out_vec[0].len;
++
++	return status;
++}
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* PSA_IPC_CRYPTO_CALLER_EXPORT_KEY_H */
+diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_export_public_key.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_export_public_key.h
+new file mode 100644
+index 000000000000..b24c47f1257e
+--- /dev/null
++++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_export_public_key.h
+@@ -0,0 +1,59 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef PSA_IPC_CRYPTO_CALLER_EXPORT_PUBLIC_KEY_H
++#define PSA_IPC_CRYPTO_CALLER_EXPORT_PUBLIC_KEY_H
++
++#include <string.h>
++#include <stdlib.h>
++#include <psa/crypto.h>
++#include <psa/client.h>
++#include <psa/sid.h>
++#include <service/common/client/service_client.h>
++#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
++#include <protocols/rpc/common/packed-c/status.h>
++#include <protocols/service/crypto/packed-c/opcodes.h>
++#include <protocols/service/crypto/packed-c/key_attributes.h>
++#include <protocols/service/crypto/packed-c/import_key.h>
++#include "crypto_caller_key_attributes.h"
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++static inline psa_status_t crypto_caller_export_public_key(struct service_client *context,
++							   psa_key_id_t id,
++							   uint8_t *data,
++							   size_t data_size,
++							   size_t *data_length)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_EXPORT_PUBLIC_KEY_SID,
++		.key_id = id,
++	};
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = sizeof(struct psa_ipc_crypto_pack_iovec) },
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(data), .len = data_size }
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++	*data_length = out_vec[0].len;
++
++	return status;
++}
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* PSA_IPC_CRYPTO_CALLER_EXPORT_PUBLIC_KEY_H */
+diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_generate_key.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_generate_key.h
+new file mode 100644
+index 000000000000..1b66ed4020de
+--- /dev/null
++++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_generate_key.h
+@@ -0,0 +1,55 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef PSA_IPC_CRYPTO_CALLER_GENERATE_KEY_H
++#define PSA_IPC_CRYPTO_CALLER_GENERATE_KEY_H
++
++#include <string.h>
++#include <stdlib.h>
++#include <psa/crypto.h>
++#include <psa/client.h>
++#include <psa/sid.h>
++#include <service/common/client/service_client.h>
++#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
++#include <protocols/rpc/common/packed-c/status.h>
++#include <protocols/service/crypto/packed-c/opcodes.h>
++#include <protocols/service/crypto/packed-c/key_attributes.h>
++#include <protocols/service/crypto/packed-c/import_key.h>
++#include "crypto_caller_key_attributes.h"
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++static inline psa_status_t crypto_caller_generate_key(struct service_client *context,
++						      const psa_key_attributes_t *attributes,
++						      psa_key_id_t *id)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_GENERATE_KEY_SID,
++	};
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = sizeof(struct psa_ipc_crypto_pack_iovec) },
++		{ .base = psa_ptr_const_to_u32(attributes), .len = sizeof(psa_key_attributes_t) },
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(id), .len = sizeof(psa_key_id_t) }
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++	return status;
++}
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* PSA_IPC_CRYPTO_CALLER_GENERATE_KEY_H */
+diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_generate_random.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_generate_random.h
+new file mode 100644
+index 000000000000..7c538237805a
+--- /dev/null
++++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_generate_random.h
+@@ -0,0 +1,57 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef PSA_IPC_CRYPTO_CALLER_GENERATE_RANDOM_H
++#define PSA_IPC_CRYPTO_CALLER_GENERATE_RANDOM_H
++
++#include <string.h>
++#include <stdlib.h>
++#include <psa/crypto.h>
++#include <psa/client.h>
++#include <psa/sid.h>
++#include <service/common/client/service_client.h>
++#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
++#include <protocols/rpc/common/packed-c/status.h>
++#include <protocols/service/crypto/packed-c/opcodes.h>
++#include <protocols/service/crypto/packed-c/key_attributes.h>
++#include <protocols/service/crypto/packed-c/import_key.h>
++#include "crypto_caller_key_attributes.h"
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++static inline psa_status_t crypto_caller_generate_random(struct service_client *context,
++							 uint8_t *output,
++							 size_t output_size)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_GENERATE_RANDOM_SID,
++	};
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = sizeof(struct psa_ipc_crypto_pack_iovec) },
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(output), .len = output_size }
++	};
++
++	if (!output_size)
++		return PSA_SUCCESS;
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++	return status;
++}
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* PSA_IPC_CRYPTO_CALLER_GENERATE_RANDOM_H */
+diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_get_key_attributes.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_get_key_attributes.h
+new file mode 100644
+index 000000000000..22f1d18f1476
+--- /dev/null
++++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_get_key_attributes.h
+@@ -0,0 +1,56 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef PSA_IPC_CRYPTO_CALLER_GET_KEY_ATTRIBUTES_H
++#define PSA_IPC_CRYPTO_CALLER_GET_KEY_ATTRIBUTES_H
++
++#include <string.h>
++#include <stdlib.h>
++#include <psa/crypto.h>
++#include <psa/client.h>
++#include <psa/sid.h>
++#include <service/common/client/service_client.h>
++#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
++#include <protocols/rpc/common/packed-c/status.h>
++#include <protocols/service/crypto/packed-c/opcodes.h>
++#include <protocols/service/crypto/packed-c/key_attributes.h>
++#include <protocols/service/crypto/packed-c/import_key.h>
++#include "crypto_caller_key_attributes.h"
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++static inline psa_status_t crypto_caller_get_key_attributes(
++					    struct service_client *context,
++					    psa_key_id_t key,
++					    psa_key_attributes_t *attributes)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_GET_KEY_ATTRIBUTES_SID,
++		.key_id = key,
++	};
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = sizeof(struct psa_ipc_crypto_pack_iovec) },
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(attributes), .len = sizeof(psa_key_attributes_t) }
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++	return status;
++}
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* PSA_IPC_CRYPTO_CALLER_GET_KEY_ATTRIBUTES_H */
+diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_hash.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_hash.h
+new file mode 100644
+index 000000000000..9f37908a2f25
+--- /dev/null
++++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_hash.h
+@@ -0,0 +1,220 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef PSA_IPC_CRYPTO_CALLER_HASH_H
++#define PSA_IPC_CRYPTO_CALLER_HASH_H
++
++#include <string.h>
++#include <stdlib.h>
++#include <psa/crypto.h>
++#include <psa/client.h>
++#include <psa/sid.h>
++#include <service/common/client/service_client.h>
++#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
++#include <protocols/rpc/common/packed-c/status.h>
++#include <protocols/service/crypto/packed-c/opcodes.h>
++#include <protocols/service/crypto/packed-c/key_attributes.h>
++#include <protocols/service/crypto/packed-c/import_key.h>
++#include "crypto_caller_key_attributes.h"
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++static inline psa_status_t crypto_caller_hash_setup(
++					    struct service_client *context,
++					    uint32_t *op_handle,
++					    psa_algorithm_t alg)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_HASH_SETUP_SID,
++		.alg = alg,
++		.op_handle = *op_handle,
++	};
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = iov_size },
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(op_handle), .len = sizeof(uint32_t) }
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++	return status;
++}
++
++static inline psa_status_t crypto_caller_hash_update(
++					     struct service_client *context,
++					     uint32_t op_handle,
++					     const uint8_t *input,
++					     size_t input_length)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_HASH_UPDATE_SID,
++		.op_handle = op_handle,
++	};
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = iov_size },
++		{ .base = psa_ptr_const_to_u32(input), .len = input_length },
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(&op_handle), .len = sizeof(uint32_t) },
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++	return status;
++}
++
++static inline psa_status_t crypto_caller_hash_finish(
++					     struct service_client *context,
++					     uint32_t op_handle,
++					     uint8_t *hash,
++					     size_t hash_size,
++					     size_t *hash_length)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_HASH_FINISH_SID,
++		.op_handle = op_handle,
++	};
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = iov_size },
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(&op_handle), .len = sizeof(uint32_t) },
++		{ .base = psa_ptr_to_u32(hash), .len = hash_size},
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++	*hash_length = out_vec[1].len;
++
++	return status;
++}
++
++static inline psa_status_t crypto_caller_hash_abort(
++					    struct service_client *context,
++					    uint32_t op_handle)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_HASH_ABORT_SID,
++		.op_handle = op_handle,
++	};
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = iov_size },
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(&op_handle), .len = sizeof(uint32_t) },
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++	return status;
++}
++
++static inline psa_status_t crypto_caller_hash_verify(
++					     struct service_client *context,
++					     uint32_t op_handle,
++					     const uint8_t *hash,
++					     size_t hash_length)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_HASH_VERIFY_SID,
++		.op_handle = op_handle,
++	};
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = iov_size },
++		{ .base = psa_ptr_const_to_u32(hash), .len = hash_length},
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(&op_handle), .len = sizeof(uint32_t) },
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++	return status;
++}
++
++static inline psa_status_t crypto_caller_hash_clone(
++					    struct service_client *context,
++					    uint32_t source_op_handle,
++					    uint32_t *target_op_handle)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_HASH_CLONE_SID,
++		.op_handle = source_op_handle,
++	};
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = iov_size },
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(target_op_handle),
++			.len = sizeof(uint32_t) },
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++	return status;
++}
++
++static inline psa_status_t crypto_caller_hash_suspend(struct service_client *context,
++	uint32_t op_handle,
++	uint8_t *hash_state,
++	size_t hash_state_size,
++	size_t *hash_state_length)
++{
++	return PSA_ERROR_NOT_SUPPORTED;
++}
++
++static inline psa_status_t crypto_caller_hash_resume(struct service_client *context,
++	uint32_t op_handle,
++	const uint8_t *hash_state,
++	size_t hash_state_length)
++{
++	return PSA_ERROR_NOT_SUPPORTED;
++}
++
++static inline size_t crypto_caller_hash_max_update_size(const struct service_client *context)
++{
++	/* Returns the maximum number of bytes that may be
++	 * carried as a parameter of the hash_update operation
++	 * using the packed-c encoding.
++	 */
++	size_t payload_space = context->service_info.max_payload;
++	size_t overhead = iov_size;
++
++	return (payload_space > overhead) ? payload_space - overhead : 0;
++}
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* PSA_IPC_CRYPTO_CALLER_HASH_H */
+diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_import_key.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_import_key.h
+new file mode 100644
+index 000000000000..d47033662790
+--- /dev/null
++++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_import_key.h
+@@ -0,0 +1,57 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef PSA_IPC_CRYPTO_CALLER_IMPORT_KEY_H
++#define PSA_IPC_CRYPTO_CALLER_IMPORT_KEY_H
++
++#include <string.h>
++#include <stdlib.h>
++#include <psa/crypto.h>
++#include <psa/client.h>
++#include <psa/sid.h>
++#include <service/common/client/service_client.h>
++#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
++#include <protocols/rpc/common/packed-c/status.h>
++#include <protocols/service/crypto/packed-c/opcodes.h>
++#include <protocols/service/crypto/packed-c/key_attributes.h>
++#include <protocols/service/crypto/packed-c/import_key.h>
++#include "crypto_caller_key_attributes.h"
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++static inline psa_status_t crypto_caller_import_key(struct service_client *context,
++				    const psa_key_attributes_t *attributes,
++				    const uint8_t *data, size_t data_length,
++				    psa_key_id_t *id)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_IMPORT_KEY_SID,
++	};
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = sizeof(struct psa_ipc_crypto_pack_iovec) },
++		{ .base = psa_ptr_const_to_u32(attributes), .len = sizeof(psa_key_attributes_t) },
++		{ .base = psa_ptr_const_to_u32(data), .len = data_length }
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(id), .len = sizeof(psa_key_id_t) }
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++	return status;
++}
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* PACKEDC_CRYPTO_CALLER_IMPORT_KEY_H */
+diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_key_attributes.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_key_attributes.h
+new file mode 100644
+index 000000000000..2fad2f0a64e6
+--- /dev/null
++++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_key_attributes.h
+@@ -0,0 +1,51 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef PACKEDC_CRYPTO_CALLER_KEY_ATTRIBUTES_H
++#define PACKEDC_CRYPTO_CALLER_KEY_ATTRIBUTES_H
++
++#include <psa/crypto.h>
++#include <protocols/service/crypto/packed-c/key_attributes.h>
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++static inline void packedc_crypto_caller_translate_key_attributes_to_proto(
++	struct ts_crypto_key_attributes *proto_attributes,
++	const psa_key_attributes_t *psa_attributes)
++{
++	proto_attributes->type = psa_get_key_type(psa_attributes);
++	proto_attributes->key_bits = psa_get_key_bits(psa_attributes);
++	proto_attributes->lifetime = psa_get_key_lifetime(psa_attributes);
++	proto_attributes->id = psa_get_key_id(psa_attributes);
++
++	proto_attributes->policy.usage = psa_get_key_usage_flags(psa_attributes);
++	proto_attributes->policy.alg = psa_get_key_algorithm(psa_attributes);
++ }
++
++static inline void packedc_crypto_caller_translate_key_attributes_from_proto(
++	psa_key_attributes_t *psa_attributes,
++	const struct ts_crypto_key_attributes *proto_attributes)
++{
++	psa_set_key_type(psa_attributes, proto_attributes->type);
++	psa_set_key_bits(psa_attributes, proto_attributes->key_bits);
++	psa_set_key_lifetime(psa_attributes, proto_attributes->lifetime);
++
++	if (proto_attributes->lifetime == PSA_KEY_LIFETIME_PERSISTENT) {
++
++		psa_set_key_id(psa_attributes, proto_attributes->id);
++	}
++
++	psa_set_key_usage_flags(psa_attributes, proto_attributes->policy.usage);
++	psa_set_key_algorithm(psa_attributes, proto_attributes->policy.alg);
++}
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* PACKEDC_CRYPTO_CALLER_KEY_ATTRIBUTES_H */
+diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_key_derivation.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_key_derivation.h
+new file mode 100644
+index 000000000000..5ce4fb6cca82
+--- /dev/null
++++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_key_derivation.h
+@@ -0,0 +1,298 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef PSA_IPC_CRYPTO_CALLER_KEY_DERIVATION_H
++#define PSA_IPC_CRYPTO_CALLER_KEY_DERIVATION_H
++
++#include <string.h>
++#include <stdlib.h>
++#include <psa/crypto.h>
++#include <psa/client.h>
++#include <psa/sid.h>
++#include <service/common/client/service_client.h>
++#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
++#include <protocols/rpc/common/packed-c/status.h>
++#include <protocols/service/crypto/packed-c/opcodes.h>
++#include <protocols/service/crypto/packed-c/key_attributes.h>
++#include <protocols/service/crypto/packed-c/import_key.h>
++#include "crypto_caller_key_attributes.h"
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++static inline psa_status_t crypto_caller_key_derivation_setup(
++					      struct service_client *context,
++					      uint32_t *op_handle,
++					      psa_algorithm_t alg)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_KEY_DERIVATION_SETUP_SID,
++		.alg = alg,
++		.op_handle = *op_handle,
++	};
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = iov_size },
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(op_handle), .len = sizeof(uint32_t) }
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++	return status;
++}
++
++static inline psa_status_t crypto_caller_key_derivation_get_capacity(
++					     struct service_client *context,
++					     const uint32_t op_handle,
++					     size_t *capacity)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_KEY_DERIVATION_GET_CAPACITY_SID,
++		.op_handle = op_handle,
++	};
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = iov_size },
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(capacity), .len = sizeof(uint32_t) }
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++	return status;
++}
++
++static inline psa_status_t crypto_caller_key_derivation_set_capacity(
++					     struct service_client *context,
++					     uint32_t op_handle,
++					     size_t capacity)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_KEY_DERIVATION_SET_CAPACITY_SID,
++		.capacity = capacity,
++		.op_handle = op_handle,
++	};
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = iov_size },
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), NULL, 0);
++
++	return status;
++}
++
++static inline psa_status_t crypto_caller_key_derivation_input_bytes(
++					    struct service_client *context,
++					    uint32_t op_handle,
++					    psa_key_derivation_step_t step,
++					    const uint8_t *data,
++					    size_t data_length)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_KEY_DERIVATION_INPUT_BYTES_SID,
++		.step = step,
++		.op_handle = op_handle,
++	};
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = iov_size },
++		{ .base = psa_ptr_const_to_u32(data), .len = data_length },
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), NULL, 0);
++
++	return status;
++}
++
++static inline psa_status_t crypto_caller_key_derivation_input_key(
++					  struct service_client *context,
++					  uint32_t op_handle,
++					  psa_key_derivation_step_t step,
++					  psa_key_id_t key)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_KEY_DERIVATION_INPUT_KEY_SID,
++		.key_id = key,
++		.step = step,
++		.op_handle = op_handle,
++	};
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = iov_size },
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), NULL, 0);
++
++	return status;
++}
++
++static inline psa_status_t crypto_caller_key_derivation_output_bytes(
++					     struct service_client *context,
++					     uint32_t op_handle,
++					     uint8_t *output,
++					     size_t output_length)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_KEY_DERIVATION_OUTPUT_BYTES_SID,
++		.op_handle = op_handle,
++	};
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = iov_size },
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(output), .len = output_length },
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++	return status;
++}
++
++static inline psa_status_t crypto_caller_key_derivation_output_key(
++				   struct service_client *context,
++				   const psa_key_attributes_t *attributes,
++				   uint32_t op_handle,
++				   psa_key_id_t *key)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_KEY_DERIVATION_OUTPUT_KEY_SID,
++		.op_handle = op_handle,
++	};
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = iov_size },
++		{ .base = psa_ptr_const_to_u32(attributes),
++			.len = sizeof(psa_key_attributes_t) },
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(key), .len = sizeof(psa_key_id_t)},
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++	return status;
++}
++
++static inline psa_status_t crypto_caller_key_derivation_abort(
++					      struct service_client *context,
++					      uint32_t op_handle)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_KEY_DERIVATION_ABORT_SID,
++		.op_handle = op_handle,
++	};
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = iov_size },
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(&op_handle), .len = sizeof(uint32_t) },
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++	return status;
++}
++
++static inline psa_status_t crypto_caller_key_derivation_key_agreement(
++				      struct service_client *context,
++				      uint32_t op_handle,
++				      psa_key_derivation_step_t step,
++				      psa_key_id_t private_key,
++				      const uint8_t *peer_key,
++				      size_t peer_key_length)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_KEY_DERIVATION_KEY_AGREEMENT_SID,
++		.key_id = private_key,
++		.step = step,
++		.op_handle = op_handle,
++	};
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = iov_size },
++		{ .base = psa_ptr_const_to_u32(peer_key),
++			.len = peer_key_length},
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), NULL, 0);
++
++	return status;
++}
++
++static inline psa_status_t crypto_caller_raw_key_agreement(
++					   struct service_client *context,
++					   psa_algorithm_t alg,
++					   psa_key_id_t private_key,
++					   const uint8_t *peer_key,
++					   size_t peer_key_length,
++					   uint8_t *output,
++					   size_t output_size,
++					   size_t *output_length)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_RAW_KEY_AGREEMENT_SID,
++		.alg = alg,
++		.key_id = private_key,
++	};
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = iov_size },
++		{ .base = psa_ptr_const_to_u32(peer_key),
++			.len = peer_key_length},
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(output), .len = output_size },
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++	*output_length = out_vec[0].len;
++
++	return status;
++}
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* PSA_IPC_CRYPTO_CALLER_KEY_DERIVATION_H */
+diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_mac.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_mac.h
+new file mode 100644
+index 000000000000..3a820192495a
+--- /dev/null
++++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_mac.h
+@@ -0,0 +1,207 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef PSA_IPC_CRYPTO_CALLER_MAC_H
++#define PSA_IPC_CRYPTO_CALLER_MAC_H
++
++#include <string.h>
++#include <stdlib.h>
++#include <psa/crypto.h>
++#include <psa/client.h>
++#include <psa/sid.h>
++#include <service/common/client/service_client.h>
++#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
++#include <protocols/rpc/common/packed-c/status.h>
++#include <protocols/service/crypto/packed-c/opcodes.h>
++#include <protocols/service/crypto/packed-c/key_attributes.h>
++#include <protocols/service/crypto/packed-c/import_key.h>
++#include "crypto_caller_key_attributes.h"
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++static inline psa_status_t crypto_caller_mac_sign_setup(
++						struct service_client *context,
++						uint32_t *op_handle,
++						psa_key_id_t key,
++						psa_algorithm_t alg)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_MAC_SIGN_SETUP_SID,
++		.key_id = key,
++		.alg = alg,
++		.op_handle = *op_handle,
++	};
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = iov_size },
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(op_handle), .len = sizeof(uint32_t) },
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++	return status;
++}
++
++static inline psa_status_t crypto_caller_mac_verify_setup(
++					  struct service_client *context,
++					  uint32_t *op_handle,
++					  psa_key_id_t key,
++					  psa_algorithm_t alg)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_MAC_VERIFY_SETUP_SID,
++		.key_id = key,
++		.alg = alg,
++		.op_handle = *op_handle,
++	};
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = iov_size },
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(op_handle), .len = sizeof(uint32_t) },
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++	return status;
++}
++
++static inline psa_status_t crypto_caller_mac_update(
++					    struct service_client *context,
++					    uint32_t op_handle,
++					    const uint8_t *input,
++					    size_t input_length)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_MAC_UPDATE_SID,
++		.op_handle = op_handle,
++	};
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = iov_size },
++		{ .base = psa_ptr_const_to_u32(input), .len = input_length },
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(&op_handle), .len = sizeof(uint32_t) },
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++	return status;
++}
++
++static inline psa_status_t crypto_caller_mac_sign_finish(
++						 struct service_client *context,
++						 uint32_t op_handle,
++						 uint8_t *mac,
++						 size_t mac_size,
++						 size_t *mac_length)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_MAC_SIGN_FINISH_SID,
++		.op_handle = op_handle,
++	};
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = iov_size },
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(&op_handle), .len = sizeof(uint32_t) },
++		{ .base = psa_ptr_to_u32(mac), .len = mac_size },
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++	*mac_length = out_vec[1].len;
++
++	return status;
++}
++
++static inline psa_status_t crypto_caller_mac_verify_finish(
++					   struct service_client *context,
++					   uint32_t op_handle,
++					   const uint8_t *mac,
++					   size_t mac_length)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_MAC_VERIFY_FINISH_SID,
++		.op_handle = op_handle,
++	};
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = iov_size },
++		{ .base = psa_ptr_const_to_u32(mac), .len = mac_length },
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(&op_handle), .len = sizeof(uint32_t) },
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++	return status;
++}
++
++static inline psa_status_t crypto_caller_mac_abort(
++					   struct service_client *context,
++					   uint32_t op_handle)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_MAC_ABORT_SID,
++		.op_handle = op_handle,
++	};
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = iov_size },
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(&op_handle), .len = sizeof(uint32_t) },
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++	return status;
++}
++
++static inline size_t crypto_caller_mac_max_update_size(const struct service_client *context)
++{
++	/* Returns the maximum number of bytes that may be
++	 * carried as a parameter of the mac_update operation
++	 * using the packed-c encoding.
++	 */
++	size_t payload_space = context->service_info.max_payload;
++	size_t overhead = iov_size;
++
++	return (payload_space > overhead) ? payload_space - overhead : 0;
++}
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* PSA_IPC_CRYPTO_CALLER_MAC_H */
+diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_purge_key.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_purge_key.h
+new file mode 100644
+index 000000000000..a3a796e2166c
+--- /dev/null
++++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_purge_key.h
+@@ -0,0 +1,51 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef PACKEDC_CRYPTO_CALLER_PURGE_KEY_H
++#define PACKEDC_CRYPTO_CALLER_PURGE_KEY_H
++
++#include <string.h>
++#include <stdlib.h>
++#include <psa/crypto.h>
++#include <psa/client.h>
++#include <psa/sid.h>
++#include <service/common/client/service_client.h>
++#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
++#include <protocols/rpc/common/packed-c/status.h>
++#include <protocols/service/crypto/packed-c/opcodes.h>
++#include <protocols/service/crypto/packed-c/key_attributes.h>
++#include <protocols/service/crypto/packed-c/import_key.h>
++#include "crypto_caller_key_attributes.h"
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++static inline psa_status_t crypto_caller_purge_key(struct service_client *context,
++						   psa_key_id_t id)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_PURGE_KEY_SID,
++		.key_id = id,
++	};
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = sizeof(struct psa_ipc_crypto_pack_iovec) },
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), NULL, 0);
++
++	return status;
++}
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* PACKEDC_CRYPTO_CALLER_PURGE_KEY_H */
+diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_sign_hash.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_sign_hash.h
+new file mode 100644
+index 000000000000..71d88cededf5
+--- /dev/null
++++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_sign_hash.h
+@@ -0,0 +1,64 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef PSA_IPC_CRYPTO_CALLER_SIGN_HASH_H
++#define PSA_IPC_CRYPTO_CALLER_SIGN_HASH_H
++
++#include <string.h>
++#include <stdlib.h>
++#include <psa/crypto.h>
++#include <psa/client.h>
++#include <psa/sid.h>
++#include <service/common/client/service_client.h>
++#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
++#include <protocols/rpc/common/packed-c/status.h>
++#include <protocols/service/crypto/packed-c/opcodes.h>
++#include <protocols/service/crypto/packed-c/key_attributes.h>
++#include <protocols/service/crypto/packed-c/import_key.h>
++#include "crypto_caller_key_attributes.h"
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++static inline psa_status_t crypto_caller_sign_hash(struct service_client *context,
++						   psa_key_id_t id,
++						   psa_algorithm_t alg,
++						   const uint8_t *hash,
++						   size_t hash_length,
++						   uint8_t *signature,
++						   size_t signature_size,
++						   size_t *signature_length)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_SIGN_HASH_SID,
++		.key_id = id,
++		.alg = alg,
++	};
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = iov_size },
++		{ .base = psa_ptr_const_to_u32(hash), .len = hash_length },
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(signature), .len = signature_size },
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++	*signature_length = out_vec[0].len;
++
++	return status;
++}
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* PSA_IPC_CRYPTO_CALLER_SIGN_HASH_H */
+diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_verify_hash.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_verify_hash.h
+new file mode 100644
+index 000000000000..e16f6e5450af
+--- /dev/null
++++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_verify_hash.h
+@@ -0,0 +1,59 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef PSA_IPC_CRYPTO_CALLER_VERIFY_HASH_H
++#define PSA_IPC_CRYPTO_CALLER_VERIFY_HASH_H
++
++#include <string.h>
++#include <stdlib.h>
++#include <psa/crypto.h>
++#include <psa/client.h>
++#include <psa/sid.h>
++#include <service/common/client/service_client.h>
++#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
++#include <protocols/rpc/common/packed-c/status.h>
++#include <protocols/service/crypto/packed-c/opcodes.h>
++#include <protocols/service/crypto/packed-c/key_attributes.h>
++#include <protocols/service/crypto/packed-c/import_key.h>
++#include "crypto_caller_key_attributes.h"
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++static inline psa_status_t crypto_caller_verify_hash(struct service_client *context,
++						     psa_key_id_t id,
++						     psa_algorithm_t alg,
++						     const uint8_t *hash,
++						     size_t hash_length,
++						     const uint8_t *signature,
++						     size_t signature_length)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_VERIFY_HASH_SID,
++		.key_id = id,
++		.alg = alg,
++	};
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = sizeof(struct psa_ipc_crypto_pack_iovec) },
++		{ .base = psa_ptr_const_to_u32(hash), .len = hash_length },
++		{ .base = psa_ptr_const_to_u32(signature), .len = signature_length},
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), NULL, 0);
++
++	return status;
++}
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* PSA_IPC_CRYPTO_CALLER_VERIFY_HASH_H */
+diff --git a/components/service/crypto/include/psa/crypto_client_struct.h b/components/service/crypto/include/psa/crypto_client_struct.h
+index abd420c82607..bf95c9821e55 100644
+--- a/components/service/crypto/include/psa/crypto_client_struct.h
++++ b/components/service/crypto/include/psa/crypto_client_struct.h
+@@ -31,12 +31,12 @@ extern "C" {
+  * data structure internally. */
+ struct psa_client_key_attributes_s
+ {
++    uint16_t type;
++    uint16_t bits;
+     uint32_t lifetime;
+-    uint32_t id;
+-    uint32_t alg;
++    psa_key_id_t id;
+     uint32_t usage;
+-    size_t bits;
+-    uint16_t type;
++    uint32_t alg;
+ };
+ 
+ #define PSA_CLIENT_KEY_ATTRIBUTES_INIT {0, 0, 0, 0, 0, 0}
+diff --git a/components/service/crypto/include/psa/crypto_sizes.h b/components/service/crypto/include/psa/crypto_sizes.h
+index 7a0149bbca62..4d7bf6e959b0 100644
+--- a/components/service/crypto/include/psa/crypto_sizes.h
++++ b/components/service/crypto/include/psa/crypto_sizes.h
+@@ -81,7 +81,7 @@
+ #define PSA_HASH_MAX_SIZE 64
+ #define PSA_HMAC_MAX_HASH_BLOCK_SIZE 128
+ #else
+-#define PSA_HASH_MAX_SIZE 32
++#define PSA_HASH_MAX_SIZE 64
+ #define PSA_HMAC_MAX_HASH_BLOCK_SIZE 64
+ #endif
+ 
+diff --git a/deployments/se-proxy/common/service_proxy_factory.c b/deployments/se-proxy/common/service_proxy_factory.c
+index 1110ac46bf8b..7edeef8b434a 100644
+--- a/deployments/se-proxy/common/service_proxy_factory.c
++++ b/deployments/se-proxy/common/service_proxy_factory.c
+@@ -15,7 +15,7 @@
+ #include <trace.h>
+ 
+ /* Stub backends */
+-#include <service/crypto/backend/stub/stub_crypto_backend.h>
++#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
+ #include <service/secure_storage/backend/secure_storage_ipc/secure_storage_ipc.h>
+ #include <service/secure_storage/backend/mock_store/mock_store.h>
+ 
+@@ -47,12 +47,17 @@ struct rpc_interface *crypto_proxy_create(void)
+ {
+ 	struct rpc_interface *crypto_iface = NULL;
+ 	struct crypto_provider *crypto_provider;
++	struct rpc_caller *crypto_caller;
+ 
+-	if (stub_crypto_backend_init() == PSA_SUCCESS) {
++	crypto_caller = openamp_caller_init(&openamp);
++	if (!crypto_caller)
++		return NULL;
++
++	if (crypto_ipc_backend_init(&openamp.rpc_caller) != PSA_SUCCESS)
++		return NULL;
+ 
+-		crypto_provider = crypto_provider_factory_create();
+-		crypto_iface = service_provider_get_rpc_interface(&crypto_provider->base_provider);
+-	}
++	crypto_provider = crypto_provider_factory_create();
++	crypto_iface = service_provider_get_rpc_interface(&crypto_provider->base_provider);
+ 
+ 	return crypto_iface;
+ }
+diff --git a/deployments/se-proxy/se-proxy.cmake b/deployments/se-proxy/se-proxy.cmake
+index 38d26821d44d..f647190d9559 100644
+--- a/deployments/se-proxy/se-proxy.cmake
++++ b/deployments/se-proxy/se-proxy.cmake
+@@ -57,7 +57,7 @@ add_components(TARGET "se-proxy"
+ 		"components/rpc/dummy"
+ 		"components/rpc/common/caller"
+ 		"components/service/attestation/key_mngr/stub"
+-		"components/service/crypto/backend/stub"
++		"components/service/crypto/backend/psa_ipc"
+ 		"components/service/crypto/client/psa"
+ 		"components/service/secure_storage/backend/mock_store"
+ )
+diff --git a/platform/providers/arm/corstone1000/platform.cmake b/platform/providers/arm/corstone1000/platform.cmake
+index bb778bb9719b..51e5faa3e4d8 100644
+--- a/platform/providers/arm/corstone1000/platform.cmake
++++ b/platform/providers/arm/corstone1000/platform.cmake
+@@ -8,3 +8,5 @@
+ 
+ # include MHU driver
+ include(${TS_ROOT}/platform/drivers/arm/mhu_driver/component.cmake)
++
++add_compile_definitions(MBEDTLS_ECP_DP_SECP521R1_ENABLED)
+-- 
+2.38.0
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0013-Add-stub-capsule-update-service-components.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0013-Add-stub-capsule-update-service-components.patch
new file mode 100644
index 000000000000..1a6e8f50f13f
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0013-Add-stub-capsule-update-service-components.patch
@@ -0,0 +1,436 @@
+From 6b8ebdeb8caa6326ae2a4befaf4410a7a54d4e02 Mon Sep 17 00:00:00 2001
+From: Julian Hall <julian.hall@arm.com>
+Date: Tue, 12 Oct 2021 15:45:41 +0100
+Subject: [PATCH 13/19] Add stub capsule update service components
+
+To facilitate development of a capsule update service provider,
+stub components are added to provide a starting point for an
+implementation. The capsule update service provider is integrated
+into the se-proxy/common deployment.
+
+Upstream-Status: Pending
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+Signed-off-by: Julian Hall <julian.hall@arm.com>
+Change-Id: I0d4049bb4de5af7ca80806403301692507085d28
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ .../backend/capsule_update_backend.h          |  24 ++++
+ .../provider/capsule_update_provider.c        | 133 ++++++++++++++++++
+ .../provider/capsule_update_provider.h        |  51 +++++++
+ .../capsule_update/provider/component.cmake   |  13 ++
+ deployments/se-proxy/common/se_proxy_sp.c     |   3 +
+ .../se-proxy/common/service_proxy_factory.c   |  16 +++
+ .../se-proxy/common/service_proxy_factory.h   |   1 +
+ deployments/se-proxy/se-proxy.cmake           |   1 +
+ deployments/se-proxy/se_proxy_interfaces.h    |   9 +-
+ .../capsule_update/capsule_update_proto.h     |  13 ++
+ protocols/service/capsule_update/opcodes.h    |  17 +++
+ protocols/service/capsule_update/parameters.h |  15 ++
+ 12 files changed, 292 insertions(+), 4 deletions(-)
+ create mode 100644 components/service/capsule_update/backend/capsule_update_backend.h
+ create mode 100644 components/service/capsule_update/provider/capsule_update_provider.c
+ create mode 100644 components/service/capsule_update/provider/capsule_update_provider.h
+ create mode 100644 components/service/capsule_update/provider/component.cmake
+ create mode 100644 protocols/service/capsule_update/capsule_update_proto.h
+ create mode 100644 protocols/service/capsule_update/opcodes.h
+ create mode 100644 protocols/service/capsule_update/parameters.h
+
+diff --git a/components/service/capsule_update/backend/capsule_update_backend.h b/components/service/capsule_update/backend/capsule_update_backend.h
+new file mode 100644
+index 000000000000..f3144ff1d7d5
+--- /dev/null
++++ b/components/service/capsule_update/backend/capsule_update_backend.h
+@@ -0,0 +1,24 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef CAPSULE_UPDATE_BACKEND_H
++#define CAPSULE_UPDATE_BACKEND_H
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++/**
++ * Defines the common capsule update backend interface.  Concrete backends
++ * implement this interface for different types of platform.
++ */
++
++
++#ifdef __cplusplus
++} /* extern "C" */
++#endif
++
++#endif /* CAPSULE_UPDATE_BACKEND_H */
+diff --git a/components/service/capsule_update/provider/capsule_update_provider.c b/components/service/capsule_update/provider/capsule_update_provider.c
+new file mode 100644
+index 000000000000..e133753f8560
+--- /dev/null
++++ b/components/service/capsule_update/provider/capsule_update_provider.c
+@@ -0,0 +1,133 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#include <psa/client.h>
++#include <psa/sid.h>
++#include <trace.h>
++
++#include <protocols/service/capsule_update/capsule_update_proto.h>
++#include <protocols/rpc/common/packed-c/status.h>
++#include "capsule_update_provider.h"
++
++
++#define CAPSULE_UPDATE_REQUEST (0x1)
++#define KERNEL_STARTED_EVENT   (0x2)
++
++enum corstone1000_ioctl_id_t {
++	IOCTL_CORSTONE1000_FWU_FLASH_IMAGES = 0,
++	IOCTL_CORSTONE1000_FWU_HOST_ACK,
++};
++
++/* Service request handlers */
++static rpc_status_t update_capsule_handler(void *context, struct call_req *req);
++static rpc_status_t boot_confirmed_handler(void *context, struct call_req *req);
++
++/* Handler mapping table for service */
++static const struct service_handler handler_table[] = {
++	{CAPSULE_UPDATE_OPCODE_UPDATE_CAPSULE,			update_capsule_handler},
++	{CAPSULE_UPDATE_OPCODE_BOOT_CONFIRMED,			boot_confirmed_handler}
++};
++
++struct rpc_interface *capsule_update_provider_init(
++	struct capsule_update_provider *context)
++{
++	struct rpc_interface *rpc_interface = NULL;
++
++	if (context) {
++
++		service_provider_init(
++			&context->base_provider,
++			context,
++			handler_table,
++			sizeof(handler_table)/sizeof(struct service_handler));
++
++		rpc_interface = service_provider_get_rpc_interface(&context->base_provider);
++	}
++
++	return rpc_interface;
++}
++
++void capsule_update_provider_deinit(struct capsule_update_provider *context)
++{
++	(void)context;
++}
++
++static rpc_status_t event_handler(uint32_t opcode, struct rpc_caller *caller)
++{
++	uint32_t ioctl_id;
++	psa_handle_t handle;
++	rpc_status_t rpc_status = TS_RPC_CALL_ACCEPTED;
++
++	struct psa_invec in_vec[] = {
++			{ .base = &ioctl_id, .len = sizeof(ioctl_id) }
++	};
++
++	if(!caller) {
++		EMSG("event_handler rpc_caller is NULL");
++		rpc_status = TS_RPC_ERROR_RESOURCE_FAILURE;
++		return rpc_status;
++	}
++
++	IMSG("event handler opcode %x", opcode);
++	switch(opcode) {
++		case CAPSULE_UPDATE_REQUEST:
++		/* Openamp call with IOCTL for firmware update*/
++		ioctl_id = IOCTL_CORSTONE1000_FWU_FLASH_IMAGES;
++		handle = psa_connect(caller, TFM_SP_PLATFORM_IOCTL_SID,
++				TFM_SP_PLATFORM_IOCTL_VERSION);
++		if (handle <= 0) {
++			EMSG("%s Invalid handle", __func__);
++			rpc_status = TS_RPC_ERROR_INVALID_PARAMETER;
++			return rpc_status;
++		}
++		psa_call(caller,handle, PSA_IPC_CALL,
++			in_vec,IOVEC_LEN(in_vec), NULL, 0);
++		break;
++
++		case KERNEL_STARTED_EVENT:
++		ioctl_id = IOCTL_CORSTONE1000_FWU_HOST_ACK;
++		/*openamp call with IOCTL for kernel start*/
++		handle = psa_connect(caller, TFM_SP_PLATFORM_IOCTL_SID,
++				TFM_SP_PLATFORM_IOCTL_VERSION);
++		if (handle <= 0) {
++			EMSG("%s Invalid handle", __func__);
++			rpc_status = TS_RPC_ERROR_INVALID_PARAMETER;
++			return rpc_status;
++		}
++		psa_call(caller,handle, PSA_IPC_CALL,
++			in_vec,IOVEC_LEN(in_vec), NULL, 0);
++		break;
++		default:
++			EMSG("%s unsupported opcode", __func__);
++			rpc_status = TS_RPC_ERROR_INVALID_PARAMETER;
++			return rpc_status;
++	}
++	return rpc_status;
++
++}
++
++static rpc_status_t update_capsule_handler(void *context, struct call_req *req)
++{
++	struct capsule_update_provider *this_instance = (struct capsule_update_provider*)context;
++	struct rpc_caller *caller = this_instance->client.caller;
++	uint32_t opcode = req->opcode;
++	rpc_status_t rpc_status = TS_RPC_ERROR_NOT_READY;
++
++	rpc_status = event_handler(opcode, caller);
++	return rpc_status;
++}
++
++static rpc_status_t boot_confirmed_handler(void *context, struct call_req *req)
++{
++	struct capsule_update_provider *this_instance = (struct capsule_update_provider*)context;
++	struct rpc_caller *caller = this_instance->client.caller;
++	uint32_t opcode = req->opcode;
++	rpc_status_t rpc_status = TS_RPC_ERROR_NOT_READY;
++
++	rpc_status = event_handler(opcode, caller);
++
++	return rpc_status;
++}
+diff --git a/components/service/capsule_update/provider/capsule_update_provider.h b/components/service/capsule_update/provider/capsule_update_provider.h
+new file mode 100644
+index 000000000000..3de49854ea90
+--- /dev/null
++++ b/components/service/capsule_update/provider/capsule_update_provider.h
+@@ -0,0 +1,51 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef CAPSULE_UPDATE_PROVIDER_H
++#define CAPSULE_UPDATE_PROVIDER_H
++
++#include <rpc/common/endpoint/rpc_interface.h>
++#include <service/common/provider/service_provider.h>
++#include <service/common/client/service_client.h>
++#include <service/capsule_update/backend/capsule_update_backend.h>
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++/**
++ * The capsule_update_provider is a service provider that accepts update capsule
++ * requests and delegates them to a suitable backend that applies the update.
++ */
++struct capsule_update_provider
++{
++	struct service_provider base_provider;
++	struct service_client client;
++};
++
++/**
++ * \brief Initialize an instance of the capsule update service provider
++ *
++ * @param[in] context The instance to initialize
++ *
++ * \return An rpc_interface or NULL on failure
++ */
++struct rpc_interface *capsule_update_provider_init(
++	struct capsule_update_provider *context);
++
++/**
++ * \brief Cleans up when the instance is no longer needed
++ *
++ * \param[in] context   The instance to de-initialize
++ */
++void capsule_update_provider_deinit(
++	struct capsule_update_provider *context);
++
++#ifdef __cplusplus
++} /* extern "C" */
++#endif
++
++#endif /* CAPSULE_UPDATE_PROVIDER_H */
+diff --git a/components/service/capsule_update/provider/component.cmake b/components/service/capsule_update/provider/component.cmake
+new file mode 100644
+index 000000000000..1d412eb234d9
+--- /dev/null
++++ b/components/service/capsule_update/provider/component.cmake
+@@ -0,0 +1,13 @@
++#-------------------------------------------------------------------------------
++# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++#
++# SPDX-License-Identifier: BSD-3-Clause
++#
++#-------------------------------------------------------------------------------
++if (NOT DEFINED TGT)
++	message(FATAL_ERROR "mandatory parameter TGT is not defined.")
++endif()
++
++target_sources(${TGT} PRIVATE
++	"${CMAKE_CURRENT_LIST_DIR}/capsule_update_provider.c"
++	)
+diff --git a/deployments/se-proxy/common/se_proxy_sp.c b/deployments/se-proxy/common/se_proxy_sp.c
+index a37396f4454b..a38ad6ca3f56 100644
+--- a/deployments/se-proxy/common/se_proxy_sp.c
++++ b/deployments/se-proxy/common/se_proxy_sp.c
+@@ -77,6 +77,9 @@ void __noreturn sp_main(struct ffa_init_info *init_info)
+ 	}
+ 	rpc_demux_attach(&rpc_demux, SE_PROXY_INTERFACE_ID_ATTEST, rpc_iface);
+ 
++	rpc_iface = capsule_update_proxy_create();
++	rpc_demux_attach(&rpc_demux, SE_PROXY_INTERFACE_ID_CAPSULE_UPDATE, rpc_iface);
++
+ 	/* End of boot phase */
+ 	result = sp_msg_wait(&req_msg);
+ 	if (result != SP_RESULT_OK) {
+diff --git a/deployments/se-proxy/common/service_proxy_factory.c b/deployments/se-proxy/common/service_proxy_factory.c
+index 7edeef8b434a..591cc9eeb59e 100644
+--- a/deployments/se-proxy/common/service_proxy_factory.c
++++ b/deployments/se-proxy/common/service_proxy_factory.c
+@@ -13,6 +13,7 @@
+ #include <service/crypto/factory/crypto_provider_factory.h>
+ #include <service/secure_storage/frontend/secure_storage_provider/secure_storage_provider.h>
+ #include <trace.h>
++#include <service/capsule_update/provider/capsule_update_provider.h>
+ 
+ /* Stub backends */
+ #include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
+@@ -93,3 +94,18 @@ struct rpc_interface *its_proxy_create(void)
+  
+         return secure_storage_provider_init(&its_provider, backend);
+ }
++
++struct rpc_interface *capsule_update_proxy_create(void)
++{
++	static struct capsule_update_provider capsule_update_provider;
++	static struct rpc_caller *capsule_update_caller;
++
++	capsule_update_caller = openamp_caller_init(&openamp);
++
++	if (!capsule_update_caller)
++	return NULL;
++
++	capsule_update_provider.client.caller = capsule_update_caller;
++
++	return capsule_update_provider_init(&capsule_update_provider);
++}
+diff --git a/deployments/se-proxy/common/service_proxy_factory.h b/deployments/se-proxy/common/service_proxy_factory.h
+index 298d407a2371..02aa7fe2550d 100644
+--- a/deployments/se-proxy/common/service_proxy_factory.h
++++ b/deployments/se-proxy/common/service_proxy_factory.h
+@@ -17,6 +17,7 @@ struct rpc_interface *attest_proxy_create(void);
+ struct rpc_interface *crypto_proxy_create(void);
+ struct rpc_interface *ps_proxy_create(void);
+ struct rpc_interface *its_proxy_create(void);
++struct rpc_interface *capsule_update_proxy_create(void);
+ 
+ #ifdef __cplusplus
+ }
+diff --git a/deployments/se-proxy/se-proxy.cmake b/deployments/se-proxy/se-proxy.cmake
+index f647190d9559..e35b0d0f610d 100644
+--- a/deployments/se-proxy/se-proxy.cmake
++++ b/deployments/se-proxy/se-proxy.cmake
+@@ -51,6 +51,7 @@ add_components(TARGET "se-proxy"
+ 		"components/service/attestation/provider/serializer/packed-c"
+ 		"components/service/attestation/reporter/psa_ipc"
+ 		"components/service/attestation/client/psa_ipc"
++		"components/service/capsule_update/provider"
+ 		"components/rpc/openamp/caller/sp"
+ 
+ 		# Stub service provider backends
+diff --git a/deployments/se-proxy/se_proxy_interfaces.h b/deployments/se-proxy/se_proxy_interfaces.h
+index 48908f846990..3d4a7c204785 100644
+--- a/deployments/se-proxy/se_proxy_interfaces.h
++++ b/deployments/se-proxy/se_proxy_interfaces.h
+@@ -8,9 +8,10 @@
+ #define SE_PROXY_INTERFACES_H
+ 
+ /* Interface IDs from service endpoints available from an se-proxy deployment */
+-#define SE_PROXY_INTERFACE_ID_ITS			(0)
+-#define SE_PROXY_INTERFACE_ID_PS			(1)
+-#define SE_PROXY_INTERFACE_ID_CRYPTO		(2)
+-#define SE_PROXY_INTERFACE_ID_ATTEST		(3)
++#define SE_PROXY_INTERFACE_ID_ITS			    (0)
++#define SE_PROXY_INTERFACE_ID_PS			    (1)
++#define SE_PROXY_INTERFACE_ID_CRYPTO		    (2)
++#define SE_PROXY_INTERFACE_ID_ATTEST		    (3)
++#define SE_PROXY_INTERFACE_ID_CAPSULE_UPDATE    (4)
+ 
+ #endif /* SE_PROXY_INTERFACES_H */
+diff --git a/protocols/service/capsule_update/capsule_update_proto.h b/protocols/service/capsule_update/capsule_update_proto.h
+new file mode 100644
+index 000000000000..8f326cd387fb
+--- /dev/null
++++ b/protocols/service/capsule_update/capsule_update_proto.h
+@@ -0,0 +1,13 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef CAPSULE_UPDATE_PROTO_H
++#define CAPSULE_UPDATE_PROTO_H
++
++#include <protocols/service/capsule_update/opcodes.h>
++#include <protocols/service/capsule_update/parameters.h>
++
++#endif /* CAPSULE_UPDATE_PROTO_H */
+diff --git a/protocols/service/capsule_update/opcodes.h b/protocols/service/capsule_update/opcodes.h
+new file mode 100644
+index 000000000000..8185a0902378
+--- /dev/null
++++ b/protocols/service/capsule_update/opcodes.h
+@@ -0,0 +1,17 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef CAPSULE_UPDATE_OPCODES_H
++#define CAPSULE_UPDATE_OPCODES_H
++
++/**
++ * Opcode definitions for the capsule update service
++ */
++
++#define CAPSULE_UPDATE_OPCODE_UPDATE_CAPSULE		1
++#define CAPSULE_UPDATE_OPCODE_BOOT_CONFIRMED		2
++
++#endif /* CAPSULE_UPDATE_OPCODES_H */
+diff --git a/protocols/service/capsule_update/parameters.h b/protocols/service/capsule_update/parameters.h
+new file mode 100644
+index 000000000000..285d924186be
+--- /dev/null
++++ b/protocols/service/capsule_update/parameters.h
+@@ -0,0 +1,15 @@
++/*
++ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef CAPSULE_UPDATE_PARAMETERS_H
++#define CAPSULE_UPDATE_PARAMETERS_H
++
++/**
++ * Operation parameter definitions for the capsule update service access protocol.
++ */
++
++
++#endif /* CAPSULE_UPDATE_PARAMETERS_H */
+-- 
+2.38.0
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0014-Configure-storage-size.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0014-Configure-storage-size.patch
new file mode 100644
index 000000000000..52c793cc120e
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0014-Configure-storage-size.patch
@@ -0,0 +1,42 @@
+From a71b26f867f1b4a08285d6da82528de6a54321f2 Mon Sep 17 00:00:00 2001
+From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
+Date: Thu, 16 Dec 2021 21:31:40 +0000
+Subject: [PATCH 14/19] Configure storage size
+
+Upstream-Status: Pending
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ .../service/smm_variable/backend/uefi_variable_store.c       | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/components/service/smm_variable/backend/uefi_variable_store.c b/components/service/smm_variable/backend/uefi_variable_store.c
+index 715ccc3cb546..aeb8a22062b7 100644
+--- a/components/service/smm_variable/backend/uefi_variable_store.c
++++ b/components/service/smm_variable/backend/uefi_variable_store.c
+@@ -88,6 +88,7 @@ static efi_status_t check_name_terminator(
+  * may be overridden using uefi_variable_store_set_storage_limits()
+  */
+ #define DEFAULT_MAX_VARIABLE_SIZE			(2048)
++#define CONFIGURE_STORAGE_SIZE			    (50)
+ 
+ efi_status_t uefi_variable_store_init(
+ 	struct uefi_variable_store *context,
+@@ -101,13 +102,13 @@ efi_status_t uefi_variable_store_init(
+ 	/* Initialise persistent store defaults */
+ 	context->persistent_store.is_nv = true;
+ 	context->persistent_store.max_variable_size = DEFAULT_MAX_VARIABLE_SIZE;
+-	context->persistent_store.total_capacity = DEFAULT_MAX_VARIABLE_SIZE * max_variables;
++	context->persistent_store.total_capacity = CONFIGURE_STORAGE_SIZE * max_variables;
+ 	context->persistent_store.storage_backend = persistent_store;
+ 
+ 	/* Initialise volatile store defaults */
+ 	context->volatile_store.is_nv = false;
+ 	context->volatile_store.max_variable_size = DEFAULT_MAX_VARIABLE_SIZE;
+-	context->volatile_store.total_capacity = DEFAULT_MAX_VARIABLE_SIZE * max_variables;
++	context->volatile_store.total_capacity = CONFIGURE_STORAGE_SIZE * max_variables;
+ 	context->volatile_store.storage_backend = volatile_store;
+ 
+ 	context->owner_id = owner_id;
+-- 
+2.38.0
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0015-Fix-Crypto-interface-structure-aligned-with-tf-m-cha.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0015-Fix-Crypto-interface-structure-aligned-with-tf-m-cha.patch
new file mode 100644
index 000000000000..a8f5559d106b
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0015-Fix-Crypto-interface-structure-aligned-with-tf-m-cha.patch
@@ -0,0 +1,31 @@
+From 3cc9c417f12f005244530d8d706a6b7f3be35627 Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Sun, 13 Feb 2022 09:01:10 +0000
+Subject: [PATCH 15/19] Fix: Crypto interface structure aligned with tf-m
+ change.
+
+NO NEED TO RAISE PR: The PR for this FIX  is raied by Emek.
+
+Upstream-Status: Pending
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h b/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h
+index c13c20e84131..ec25eaf868c7 100644
+--- a/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h
++++ b/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h
+@@ -38,7 +38,8 @@ struct psa_ipc_crypto_pack_iovec {
+ 				      *   multipart operation
+ 				      */
+ 	uint32_t capacity;             /*!< Key derivation capacity */
+-
++	uint32_t ad_length;            /*!< Additional Data length for multipart AEAD */
++	uint32_t plaintext_length;     /*!< Plaintext length for multipart AEAD */
+ 	struct psa_ipc_crypto_aead_pack_input aead_in; /*!< FixMe: Temporarily used for
+ 							    *   AEAD until the API is
+ 							    *   restructured
+-- 
+2.38.0
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0016-Integrate-remaining-psa-ipc-client-APIs.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0016-Integrate-remaining-psa-ipc-client-APIs.patch
new file mode 100644
index 000000000000..a0911970e696
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0016-Integrate-remaining-psa-ipc-client-APIs.patch
@@ -0,0 +1,494 @@
+From c54afe45c1be25c4819b0f762cf03a24e6343ce5 Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Sun, 13 Feb 2022 09:49:51 +0000
+Subject: [PATCH 16/19] Integrate remaining psa-ipc client APIs.
+
+Upstream-Status: Pending
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ .../caller/psa_ipc/crypto_caller_aead.h       | 297 +++++++++++++++++-
+ .../caller/psa_ipc/crypto_caller_sign_hash.h  |  35 +++
+ .../psa_ipc/crypto_caller_verify_hash.h       |  33 +-
+ 3 files changed, 352 insertions(+), 13 deletions(-)
+
+diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_aead.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_aead.h
+index 78517fe32ca9..f6aadd8b9098 100644
+--- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_aead.h
++++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_aead.h
+@@ -152,7 +152,27 @@ static inline psa_status_t crypto_caller_aead_encrypt_setup(
+ 					    psa_key_id_t key,
+ 					    psa_algorithm_t alg)
+ {
+-	return PSA_ERROR_NOT_SUPPORTED;
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++	    .sfn_id = TFM_CRYPTO_AEAD_ENCRYPT_SETUP_SID,
++	    .key_id = key,
++	    .alg = alg,
++	    .op_handle = (*op_handle),
++	};
++
++	struct psa_invec in_vec[] = {
++	    {.base = psa_ptr_to_u32(&iov), .len = sizeof(struct psa_ipc_crypto_pack_iovec)}
++	};
++	struct psa_outvec out_vec[] = {
++	    {.base = psa_ptr_to_u32(op_handle), .len = sizeof(uint32_t)}
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++	                   IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++	return status;
+ }
+ 
+ static inline psa_status_t crypto_caller_aead_decrypt_setup(
+@@ -161,7 +181,26 @@ static inline psa_status_t crypto_caller_aead_decrypt_setup(
+ 					    psa_key_id_t key,
+ 					    psa_algorithm_t alg)
+ {
+-	return PSA_ERROR_NOT_SUPPORTED;
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++	    .sfn_id = TFM_CRYPTO_AEAD_DECRYPT_SETUP_SID,
++	    .key_id = key,
++	    .alg = alg,
++	    .op_handle = (*op_handle),
++	};
++
++	struct psa_invec in_vec[] = {
++	    {.base = psa_ptr_to_u32(&iov), .len = sizeof(struct psa_ipc_crypto_pack_iovec)}
++	};
++	struct psa_outvec out_vec[] = {
++	    {.base = psa_ptr_to_u32(op_handle), .len = sizeof(uint32_t)}
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++	                   IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++	return status;
+ }
+ 
+ static inline psa_status_t crypto_caller_aead_generate_nonce(
+@@ -171,7 +210,27 @@ static inline psa_status_t crypto_caller_aead_generate_nonce(
+ 					     size_t nonce_size,
+ 					     size_t *nonce_length)
+ {
+-	return PSA_ERROR_NOT_SUPPORTED;
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++	    .sfn_id = TFM_CRYPTO_AEAD_GENERATE_NONCE_SID,
++	    .op_handle = op_handle,
++	};
++
++	struct psa_invec in_vec[] = {
++	    {.base = psa_ptr_to_u32(&iov), .len = sizeof(struct psa_ipc_crypto_pack_iovec)},
++	};
++	struct psa_outvec out_vec[] = {
++	    {.base = psa_ptr_to_u32(&op_handle), .len = sizeof(uint32_t)},
++	    {.base = psa_ptr_to_u32(nonce), .len = nonce_size}
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++	                   IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++	*nonce_length = out_vec[1].len;
++	return status;
+ }
+ 
+ static inline psa_status_t crypto_caller_aead_set_nonce(
+@@ -180,7 +239,25 @@ static inline psa_status_t crypto_caller_aead_set_nonce(
+ 						const uint8_t *nonce,
+ 						size_t nonce_length)
+ {
+-	return PSA_ERROR_NOT_SUPPORTED;
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++	    .sfn_id = TFM_CRYPTO_AEAD_SET_NONCE_SID,
++	    .op_handle = op_handle,
++	};
++
++	struct psa_invec in_vec[] = {
++	    {.base = psa_ptr_to_u32(&iov), .len = sizeof(struct psa_ipc_crypto_pack_iovec)},
++	    {.base = psa_ptr_to_u32(nonce), .len = nonce_length}
++	};
++	struct psa_outvec out_vec[] = {
++	    {.base = psa_ptr_to_u32(&op_handle), .len = sizeof(uint32_t)}
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++	                   IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++	return status;
+ }
+ 
+ static inline psa_status_t crypto_caller_aead_set_lengths(
+@@ -189,7 +266,27 @@ static inline psa_status_t crypto_caller_aead_set_lengths(
+ 					  size_t ad_length,
+ 					  size_t plaintext_length)
+ {
+-	return PSA_ERROR_NOT_SUPPORTED;
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++	    .sfn_id = TFM_CRYPTO_AEAD_SET_LENGTHS_SID,
++	    .ad_length = ad_length,
++	    .plaintext_length = plaintext_length,
++	    .op_handle = op_handle,
++	};
++
++	struct psa_invec in_vec[] = {
++	    {.base = psa_ptr_to_u32(&iov), .len = sizeof(struct psa_ipc_crypto_pack_iovec)},
++	};
++	struct psa_outvec out_vec[] = {
++	    {.base = psa_ptr_to_u32(&op_handle), .len = sizeof(uint32_t)}
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++	                   IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++	return status;
+ }
+ 
+ static inline psa_status_t crypto_caller_aead_update_ad(
+@@ -198,7 +295,35 @@ static inline psa_status_t crypto_caller_aead_update_ad(
+ 						const uint8_t *input,
+ 						size_t input_length)
+ {
+-	return PSA_ERROR_NOT_SUPPORTED;
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++	    .sfn_id = TFM_CRYPTO_AEAD_UPDATE_AD_SID,
++	    .op_handle = op_handle,
++	};
++
++	/* Sanitize the optional input */
++	if ((input == NULL) && (input_length != 0)) {
++	    return PSA_ERROR_INVALID_ARGUMENT;
++	}
++
++	struct psa_invec in_vec[] = {
++	    {.base = psa_ptr_to_u32(&iov), .len = sizeof(struct psa_ipc_crypto_pack_iovec)},
++	    {.base = psa_ptr_const_to_u32(input), .len = input_length}
++	};
++	struct psa_outvec out_vec[] = {
++	    {.base = psa_ptr_to_u32(&op_handle), .len = sizeof(uint32_t)}
++	};
++
++	size_t in_len = IOVEC_LEN(in_vec);
++
++	if (input == NULL) {
++	    in_len--;
++	}
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++	                   in_len, out_vec, IOVEC_LEN(out_vec));
++	return status;
+ }
+ 
+ static inline psa_status_t crypto_caller_aead_update(
+@@ -210,7 +335,38 @@ static inline psa_status_t crypto_caller_aead_update(
+ 					     size_t output_size,
+ 					     size_t *output_length)
+ {
+-	return PSA_ERROR_NOT_SUPPORTED;
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++	    .sfn_id = TFM_CRYPTO_AEAD_UPDATE_SID,
++	    .op_handle = op_handle,
++	};
++
++	/* Sanitize the optional input */
++	if ((input == NULL) && (input_length != 0)) {
++	    return PSA_ERROR_INVALID_ARGUMENT;
++	}
++
++	struct psa_invec in_vec[] = {
++	    {.base = psa_ptr_to_u32(&iov), .len = sizeof(struct psa_ipc_crypto_pack_iovec)},
++	    {.base = psa_ptr_const_to_u32(input), .len = input_length}
++	};
++	struct psa_outvec out_vec[] = {
++	    {.base = psa_ptr_to_u32(&op_handle), .len = sizeof(uint32_t)},
++	    {.base = psa_ptr_const_to_u32(output), .len = output_size},
++	};
++
++	size_t in_len = IOVEC_LEN(in_vec);
++
++	if (input == NULL) {
++	    in_len--;
++	}
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++	                   in_len, out_vec, IOVEC_LEN(out_vec));
++
++	*output_length = out_vec[1].len;
++	return status;
+ }
+ 
+ static inline psa_status_t crypto_caller_aead_finish(
+@@ -223,7 +379,48 @@ static inline psa_status_t crypto_caller_aead_finish(
+ 					     size_t tag_size,
+ 					     size_t *tag_length)
+ {
+-	return PSA_ERROR_NOT_SUPPORTED;
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++	    .sfn_id = TFM_CRYPTO_AEAD_FINISH_SID,
++	    .op_handle = op_handle,
++	};
++
++	/* Sanitize the optional output */
++	if ((aeadtext == NULL) && (aeadtext_size != 0)) {
++	    return PSA_ERROR_INVALID_ARGUMENT;
++	}
++
++	struct psa_invec in_vec[] = {
++	    {.base = psa_ptr_to_u32(&iov), .len = sizeof(struct psa_ipc_crypto_pack_iovec)},
++	};
++	struct psa_outvec out_vec[] = {
++	    {.base = psa_ptr_to_u32(&op_handle), .len = sizeof(uint32_t)},
++	    {.base = psa_ptr_const_to_u32(tag), .len = tag_size},
++	    {.base = psa_ptr_const_to_u32(aeadtext), .len = aeadtext_size}
++	};
++
++	size_t out_len = IOVEC_LEN(out_vec);
++
++	if (aeadtext == NULL || aeadtext_size == 0) {
++	    out_len--;
++	}
++	if ((out_len == 3) && (aeadtext_length == NULL)) {
++	    return PSA_ERROR_INVALID_ARGUMENT;
++	}
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++	                   IOVEC_LEN(in_vec), out_vec, out_len);
++
++	*tag_length = out_vec[1].len;
++
++	if (out_len == 3) {
++	    *aeadtext_length = out_vec[2].len;
++	} else {
++	    *aeadtext_length = 0;
++	}
++	return status;
+ }
+ 
+ static inline psa_status_t crypto_caller_aead_verify(
+@@ -235,14 +432,94 @@ static inline psa_status_t crypto_caller_aead_verify(
+ 					     const uint8_t *tag,
+ 					     size_t tag_length)
+ {
+-	return PSA_ERROR_NOT_SUPPORTED;
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++	    .sfn_id = TFM_CRYPTO_AEAD_VERIFY_SID,
++	    .op_handle = op_handle,
++	};
++
++	/* Sanitize the optional output */
++	if ((plaintext == NULL) && (plaintext_size != 0)) {
++	    return PSA_ERROR_INVALID_ARGUMENT;
++	}
++
++	struct psa_invec in_vec[] = {
++	    {.base = psa_ptr_to_u32(&iov), .len = sizeof(struct psa_ipc_crypto_pack_iovec)},
++	    {.base = psa_ptr_const_to_u32(tag), .len = tag_length}
++	};
++	struct psa_outvec out_vec[] = {
++	    {.base = psa_ptr_to_u32(&op_handle), .len = sizeof(uint32_t)},
++	    {.base = psa_ptr_const_to_u32(plaintext), .len = plaintext_size},
++	};
++
++	size_t out_len = IOVEC_LEN(out_vec);
++
++	if (plaintext == NULL || plaintext_size == 0) {
++	    out_len--;
++	}
++	if ((out_len == 2) && (plaintext_length == NULL)) {
++	    return PSA_ERROR_INVALID_ARGUMENT;
++	}
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++	                   IOVEC_LEN(in_vec), out_vec, out_len);
++
++	if (out_len == 2) {
++	    *plaintext_length = out_vec[1].len;
++	} else {
++	    *plaintext_length = 0;
++	}
++	return status;
+ }
+ 
+ static inline psa_status_t crypto_caller_aead_abort(
+ 					    struct service_client *context,
+ 					    uint32_t op_handle)
+ {
+-	return PSA_ERROR_NOT_SUPPORTED;
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++	    .sfn_id = TFM_CRYPTO_AEAD_ABORT_SID,
++	    .op_handle = op_handle,
++	};
++
++	struct psa_invec in_vec[] = {
++	    {.base = psa_ptr_to_u32(&iov), .len = sizeof(struct psa_ipc_crypto_pack_iovec)},
++	};
++	struct psa_outvec out_vec[] = {
++	    {.base = psa_ptr_to_u32(&op_handle), .len = sizeof(uint32_t)},
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++	                   IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++	return status;
++}
++
++static inline size_t crypto_caller_aead_max_update_size(const struct service_client *context)
++{
++       /* Returns the maximum number of bytes that may be
++        * carried as a parameter of the mac_update operation
++        *  using the packed-c encoding.
++        */
++       size_t payload_space = context->service_info.max_payload;
++       size_t overhead = iov_size;
++
++       return (payload_space > overhead) ? payload_space - overhead : 0;
++}
++
++static inline size_t crypto_caller_aead_max_update_ad_size(const struct service_client *context)
++{
++	/* Returns the maximum number of bytes that may be
++	 * carried as a parameter of the mac_update operation
++	 *  using the packed-c encoding.
++	 */
++	size_t payload_space = context->service_info.max_payload;
++	size_t overhead = iov_size;
++
++	return (payload_space > overhead) ? payload_space - overhead : 0;
+ }
+ 
+ #ifdef __cplusplus
+diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_sign_hash.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_sign_hash.h
+index 71d88cededf5..e4a2b167defb 100644
+--- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_sign_hash.h
++++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_sign_hash.h
+@@ -57,6 +57,41 @@ static inline psa_status_t crypto_caller_sign_hash(struct service_client *contex
+ 	return status;
+ }
+ 
++static inline psa_status_t crypto_caller_sign_message(struct service_client *context,
++						   psa_key_id_t id,
++						   psa_algorithm_t alg,
++						   const uint8_t *hash,
++						   size_t hash_length,
++						   uint8_t *signature,
++						   size_t signature_size,
++						   size_t *signature_length)
++{
++	struct service_client *ipc = context;
++	struct rpc_caller *caller = ipc->caller;
++	psa_status_t status;
++	struct psa_ipc_crypto_pack_iovec iov = {
++		.sfn_id = TFM_CRYPTO_SIGN_MESSAGE_SID,
++		.key_id = id,
++		.alg = alg,
++	};
++	struct psa_invec in_vec[] = {
++		{ .base = psa_ptr_to_u32(&iov), .len = iov_size },
++		{ .base = psa_ptr_const_to_u32(hash), .len = hash_length },
++	};
++	struct psa_outvec out_vec[] = {
++		{ .base = psa_ptr_to_u32(signature), .len = signature_size },
++	};
++
++	status = psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
++			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
++
++	*signature_length = out_vec[0].len;
++
++	return status;
++}
++
++
++
+ #ifdef __cplusplus
+ }
+ #endif
+diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_caller_verify_hash.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_verify_hash.h
+index e16f6e5450af..cc9279ee79f2 100644
+--- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_verify_hash.h
++++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_verify_hash.h
+@@ -24,19 +24,20 @@
+ extern "C" {
+ #endif
+ 
+-static inline psa_status_t crypto_caller_verify_hash(struct service_client *context,
++static inline psa_status_t crypto_caller_common(struct service_client *context,
+ 						     psa_key_id_t id,
+ 						     psa_algorithm_t alg,
+ 						     const uint8_t *hash,
+ 						     size_t hash_length,
+ 						     const uint8_t *signature,
+-						     size_t signature_length)
++						     size_t signature_length,
++						     uint32_t sfn_id)
+ {
+ 	struct service_client *ipc = context;
+ 	struct rpc_caller *caller = ipc->caller;
+ 	psa_status_t status;
+ 	struct psa_ipc_crypto_pack_iovec iov = {
+-		.sfn_id = TFM_CRYPTO_VERIFY_HASH_SID,
++		.sfn_id = sfn_id,
+ 		.key_id = id,
+ 		.alg = alg,
+ 	};
+@@ -52,6 +53,32 @@ static inline psa_status_t crypto_caller_verify_hash(struct service_client *cont
+ 	return status;
+ }
+ 
++static inline psa_status_t crypto_caller_verify_hash(struct service_client *context,
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
++static inline psa_status_t crypto_caller_verify_message(struct service_client *context,
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
+2.38.0
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0017-Fix-update-psa_set_key_usage_flags-definition-to-the.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0017-Fix-update-psa_set_key_usage_flags-definition-to-the.patch
new file mode 100644
index 000000000000..e7c1dc33f89f
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0017-Fix-update-psa_set_key_usage_flags-definition-to-the.patch
@@ -0,0 +1,40 @@
+From b1ff44c650ae82f364a2f74059eeb280996dc4f8 Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Mon, 14 Feb 2022 17:52:00 +0000
+Subject: [PATCH 17/19] Fix : update psa_set_key_usage_flags definition to the
+ latest from the tf-m
+
+Upstream-Status: Pending
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ components/service/crypto/include/psa/crypto_struct.h | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/components/service/crypto/include/psa/crypto_struct.h b/components/service/crypto/include/psa/crypto_struct.h
+index 1bc55e375eea..b4a7ed4b39d3 100644
+--- a/components/service/crypto/include/psa/crypto_struct.h
++++ b/components/service/crypto/include/psa/crypto_struct.h
+@@ -155,9 +155,19 @@ static inline psa_key_lifetime_t psa_get_key_lifetime(
+     return( attributes->lifetime );
+ }
+ 
++static inline void psa_extend_key_usage_flags( psa_key_usage_t *usage_flags )
++{
++    if( *usage_flags & PSA_KEY_USAGE_SIGN_HASH )
++        *usage_flags |= PSA_KEY_USAGE_SIGN_MESSAGE;
++
++    if( *usage_flags & PSA_KEY_USAGE_VERIFY_HASH )
++        *usage_flags |= PSA_KEY_USAGE_VERIFY_MESSAGE;
++}
++
+ static inline void psa_set_key_usage_flags(psa_key_attributes_t *attributes,
+                                            psa_key_usage_t usage_flags)
+ {
++    psa_extend_key_usage_flags( &usage_flags );
+     attributes->usage = usage_flags;
+ }
+ 
+-- 
+2.38.0
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0018-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0018-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch
new file mode 100644
index 000000000000..0fdb254f997f
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0018-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch
@@ -0,0 +1,120 @@
+From a1da63a8c4d55d52321608a72129af49e0a498b2 Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Mon, 14 Feb 2022 08:22:25 +0000
+Subject: [PATCH 18/19] Fixes in AEAD for psa-arch test 54 and 58.
+
+Upstream-Status: Pending
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ .../crypto/client/caller/packed-c/crypto_caller_aead.h    | 1 +
+ components/service/crypto/include/psa/crypto_sizes.h      | 2 +-
+ .../crypto/provider/extension/aead/aead_provider.c        | 8 ++++++--
+ .../extension/aead/serializer/aead_provider_serializer.h  | 1 +
+ .../packed-c/packedc_aead_provider_serializer.c           | 2 ++
+ protocols/service/crypto/packed-c/aead.h                  | 1 +
+ 6 files changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/components/service/crypto/client/caller/packed-c/crypto_caller_aead.h b/components/service/crypto/client/caller/packed-c/crypto_caller_aead.h
+index c4ffb20cf7f8..a91f66c14008 100644
+--- a/components/service/crypto/client/caller/packed-c/crypto_caller_aead.h
++++ b/components/service/crypto/client/caller/packed-c/crypto_caller_aead.h
+@@ -309,6 +309,7 @@ static inline psa_status_t crypto_caller_aead_update(struct service_client *cont
+ 	size_t req_len = req_fixed_len;
+ 
+ 	*output_length = 0;
++        req_msg.output_size = output_size;
+ 	req_msg.op_handle = op_handle;
+ 
+ 	/* Mandatory input data parameter */
+diff --git a/components/service/crypto/include/psa/crypto_sizes.h b/components/service/crypto/include/psa/crypto_sizes.h
+index 4d7bf6e959b0..e3c4df2927b3 100644
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
+diff --git a/components/service/crypto/provider/extension/aead/aead_provider.c b/components/service/crypto/provider/extension/aead/aead_provider.c
+index 14a25436b3f6..6b144db821de 100644
+--- a/components/service/crypto/provider/extension/aead/aead_provider.c
++++ b/components/service/crypto/provider/extension/aead/aead_provider.c
+@@ -283,10 +283,11 @@ static rpc_status_t aead_update_handler(void *context, struct call_req *req)
+ 	uint32_t op_handle;
+ 	const uint8_t *input;
+ 	size_t input_len;
++        uint32_t recv_output_size;
+ 
+ 	if (serializer)
+ 		rpc_status = serializer->deserialize_aead_update_req(req_buf, &op_handle,
+-			&input, &input_len);
++			&recv_output_size, &input, &input_len);
+ 
+ 	if (rpc_status == TS_RPC_CALL_ACCEPTED) {
+ 
+@@ -300,9 +301,12 @@ static rpc_status_t aead_update_handler(void *context, struct call_req *req)
+ 		if (crypto_context) {
+ 
+ 			size_t output_len = 0;
+-			size_t output_size = PSA_AEAD_UPDATE_OUTPUT_MAX_SIZE(input_len);
++			size_t output_size = PSA_AEAD_UPDATE_OUTPUT_MAX_SIZE(24);
+ 			uint8_t *output = malloc(output_size);
+ 
++                        if (recv_output_size < output_size) {
++                            output_size = recv_output_size;
++                        }
+ 			if (output) {
+ 
+ 				psa_status = psa_aead_update(&crypto_context->op.aead,
+diff --git a/components/service/crypto/provider/extension/aead/serializer/aead_provider_serializer.h b/components/service/crypto/provider/extension/aead/serializer/aead_provider_serializer.h
+index bb1a2a97e4b7..0156aaba3fe3 100644
+--- a/components/service/crypto/provider/extension/aead/serializer/aead_provider_serializer.h
++++ b/components/service/crypto/provider/extension/aead/serializer/aead_provider_serializer.h
+@@ -51,6 +51,7 @@ struct aead_provider_serializer {
+ 	/* Operation: aead_update */
+ 	rpc_status_t (*deserialize_aead_update_req)(const struct call_param_buf *req_buf,
+ 		uint32_t *op_handle,
++                uint32_t *output_size,
+ 		const uint8_t **input, size_t *input_len);
+ 
+ 	rpc_status_t (*serialize_aead_update_resp)(struct call_param_buf *resp_buf,
+diff --git a/components/service/crypto/provider/extension/aead/serializer/packed-c/packedc_aead_provider_serializer.c b/components/service/crypto/provider/extension/aead/serializer/packed-c/packedc_aead_provider_serializer.c
+index 6f00b3e3f6f1..45c739abcbb4 100644
+--- a/components/service/crypto/provider/extension/aead/serializer/packed-c/packedc_aead_provider_serializer.c
++++ b/components/service/crypto/provider/extension/aead/serializer/packed-c/packedc_aead_provider_serializer.c
+@@ -192,6 +192,7 @@ static rpc_status_t deserialize_aead_update_ad_req(const struct call_param_buf *
+ /* Operation: aead_update */
+ static rpc_status_t deserialize_aead_update_req(const struct call_param_buf *req_buf,
+ 	uint32_t *op_handle,
++        uint32_t *output_size,
+ 	const uint8_t **input, size_t *input_len)
+ {
+ 	rpc_status_t rpc_status = TS_RPC_ERROR_INVALID_REQ_BODY;
+@@ -208,6 +209,7 @@ static rpc_status_t deserialize_aead_update_req(const struct call_param_buf *req
+ 		memcpy(&recv_msg, req_buf->data, expected_fixed_len);
+ 
+ 		*op_handle = recv_msg.op_handle;
++                *output_size = recv_msg.output_size;
+ 
+ 		tlv_const_iterator_begin(&req_iter,
+ 			(uint8_t*)req_buf->data + expected_fixed_len,
+diff --git a/protocols/service/crypto/packed-c/aead.h b/protocols/service/crypto/packed-c/aead.h
+index 0be266b52403..435fd3b523ce 100644
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
+2.38.0
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0019-plat-corstone1000-change-default-smm-values.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0019-plat-corstone1000-change-default-smm-values.patch
new file mode 100644
index 000000000000..984e2977d2a7
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0019-plat-corstone1000-change-default-smm-values.patch
@@ -0,0 +1,37 @@
+From 07ad7e1f7ba06045bf331d5b73a6adf38a098fb7 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Tue, 11 Oct 2022 10:46:10 +0100
+Subject: [PATCH 19/19] plat: corstone1000: change default smm values
+
+Smm gateway uses SE proxy to route the calls for any NV
+storage so set the NV_STORE_SN.
+Change the storage index uid because TF-M in the secure
+enclave reserves the default value (0x1) to some internal
+operation.
+Increase the maximum number of uefi variables to cope with all
+the needs for testing and certification
+
+Upstream-Status: Pending
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ platform/providers/arm/corstone1000/platform.cmake | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/platform/providers/arm/corstone1000/platform.cmake b/platform/providers/arm/corstone1000/platform.cmake
+index 51e5faa3e4d8..04b629a81906 100644
+--- a/platform/providers/arm/corstone1000/platform.cmake
++++ b/platform/providers/arm/corstone1000/platform.cmake
+@@ -10,3 +10,9 @@
+ include(${TS_ROOT}/platform/drivers/arm/mhu_driver/component.cmake)
+ 
+ add_compile_definitions(MBEDTLS_ECP_DP_SECP521R1_ENABLED)
++
++target_compile_definitions(${TGT} PRIVATE
++	SMM_GATEWAY_NV_STORE_SN="sn:ffa:46bb39d1-b4d9-45b5-88ff-040027dab249:1"
++	SMM_VARIABLE_INDEX_STORAGE_UID=0x787
++	SMM_GATEWAY_MAX_UEFI_VARIABLES=100
++)
+-- 
+2.38.0
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0026-plat-add-corstone1000-platform-to-drivers-arm.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0026-plat-add-corstone1000-platform-to-drivers-arm.patch
deleted file mode 100644
index 3b15c7218f75..000000000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0026-plat-add-corstone1000-platform-to-drivers-arm.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From d262ab277a87c1cda4f71137f6bb963066ba6997 Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Tue, 13 Sep 2022 16:46:14 +0100
-Subject: [PATCH 26/27] plat: add corstone1000 platform to drivers/arm
-
-This change is to add corstone1000 platform cmake. Smm gateway
-uses SE proxy to route the calls for any NV storage.
-
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
----
- platform/providers/arm/corstone1000/platform.cmake | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
- create mode 100644 platform/providers/arm/corstone1000/platform.cmake
-
-diff --git a/platform/providers/arm/corstone1000/platform.cmake b/platform/providers/arm/corstone1000/platform.cmake
-new file mode 100644
-index 00000000..14a9f6b0
---- /dev/null
-+++ b/platform/providers/arm/corstone1000/platform.cmake
-@@ -0,0 +1,12 @@
-+#-------------------------------------------------------------------------------
-+# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
-+#
-+# SPDX-License-Identifier: BSD-3-Clause
-+#
-+# Platform definition for the corstone1000 platform.
-+#-------------------------------------------------------------------------------
-+
-+target_compile_definitions(${TGT} PRIVATE
-+	SMM_GATEWAY_NV_STORE_SN="sn:ffa:46bb39d1-b4d9-45b5-88ff-040027dab249:1"
-+)
-+
--- 
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/ts-newlib/0001-newlib-memcpy-remove-optimized-version.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/ts-newlib/0001-newlib-memcpy-remove-optimized-version.patch
new file mode 100644
index 000000000000..7d8504d9389c
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/ts-newlib/0001-newlib-memcpy-remove-optimized-version.patch
@@ -0,0 +1,210 @@
+From 03d97c104f2d68cffd1bfc48cd62727e13a64712 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Fri, 14 Oct 2022 17:42:52 +0100
+Subject: [PATCH] newlib: memcpy: remove optimized version
+
+When creating messages packed to send over openamp we may need
+to do some copy in unaligned address, because of that we may
+not always use the assembler optimized version, which will
+trough a data-abort on aligned address exception.
+
+So, we may just use the version in string.h (the same used in
+optee-os) that will take care to check and use different
+optimization based on given source or destination address's.
+
+Upstream-Status: Pending
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ newlib/libc/machine/aarch64/memcpy-stub.c |   2 +-
+ newlib/libc/machine/aarch64/memcpy.S      | 166 ----------------------
+ 2 files changed, 1 insertion(+), 167 deletions(-)
+
+diff --git a/newlib/libc/machine/aarch64/memcpy-stub.c b/newlib/libc/machine/aarch64/memcpy-stub.c
+index cd6d72a8b8af..5f2b7968c7fc 100644
+--- a/newlib/libc/machine/aarch64/memcpy-stub.c
++++ b/newlib/libc/machine/aarch64/memcpy-stub.c
+@@ -27,5 +27,5 @@
+ #if (defined (__OPTIMIZE_SIZE__) || defined (PREFER_SIZE_OVER_SPEED))
+ # include "../../string/memcpy.c"
+ #else
+-/* See memcpy.S  */
++# include "../../string/memcpy.c"
+ #endif
+diff --git a/newlib/libc/machine/aarch64/memcpy.S b/newlib/libc/machine/aarch64/memcpy.S
+index 463bad0a1816..2a1460546374 100644
+--- a/newlib/libc/machine/aarch64/memcpy.S
++++ b/newlib/libc/machine/aarch64/memcpy.S
+@@ -61,170 +61,4 @@
+ #if (defined (__OPTIMIZE_SIZE__) || defined (PREFER_SIZE_OVER_SPEED))
+ /* See memcpy-stub.c  */
+ #else
+-
+-#define dstin	x0
+-#define src	x1
+-#define count	x2
+-#define dst	x3
+-#define srcend	x4
+-#define dstend	x5
+-#define A_l	x6
+-#define A_lw	w6
+-#define A_h	x7
+-#define A_hw	w7
+-#define B_l	x8
+-#define B_lw	w8
+-#define B_h	x9
+-#define C_l	x10
+-#define C_h	x11
+-#define D_l	x12
+-#define D_h	x13
+-#define E_l	src
+-#define E_h	count
+-#define F_l	srcend
+-#define F_h	dst
+-#define tmp1	x9
+-
+-#define L(l) .L ## l
+-
+-	.macro def_fn f p2align=0
+-	.text
+-	.p2align \p2align
+-	.global \f
+-	.type \f, %function
+-\f:
+-	.endm
+-
+-/* Copies are split into 3 main cases: small copies of up to 16 bytes,
+-   medium copies of 17..96 bytes which are fully unrolled. Large copies
+-   of more than 96 bytes align the destination and use an unrolled loop
+-   processing 64 bytes per iteration.
+-   Small and medium copies read all data before writing, allowing any
+-   kind of overlap, and memmove tailcalls memcpy for these cases as
+-   well as non-overlapping copies.
+-*/
+-
+-def_fn memcpy p2align=6
+-	prfm	PLDL1KEEP, [src]
+-	add	srcend, src, count
+-	add	dstend, dstin, count
+-	cmp	count, 16
+-	b.ls	L(copy16)
+-	cmp	count, 96
+-	b.hi	L(copy_long)
+-
+-	/* Medium copies: 17..96 bytes.  */
+-	sub	tmp1, count, 1
+-	ldp	A_l, A_h, [src]
+-	tbnz	tmp1, 6, L(copy96)
+-	ldp	D_l, D_h, [srcend, -16]
+-	tbz	tmp1, 5, 1f
+-	ldp	B_l, B_h, [src, 16]
+-	ldp	C_l, C_h, [srcend, -32]
+-	stp	B_l, B_h, [dstin, 16]
+-	stp	C_l, C_h, [dstend, -32]
+-1:
+-	stp	A_l, A_h, [dstin]
+-	stp	D_l, D_h, [dstend, -16]
+-	ret
+-
+-	.p2align 4
+-	/* Small copies: 0..16 bytes.  */
+-L(copy16):
+-	cmp	count, 8
+-	b.lo	1f
+-	ldr	A_l, [src]
+-	ldr	A_h, [srcend, -8]
+-	str	A_l, [dstin]
+-	str	A_h, [dstend, -8]
+-	ret
+-	.p2align 4
+-1:
+-	tbz	count, 2, 1f
+-	ldr	A_lw, [src]
+-	ldr	A_hw, [srcend, -4]
+-	str	A_lw, [dstin]
+-	str	A_hw, [dstend, -4]
+-	ret
+-
+-	/* Copy 0..3 bytes.  Use a branchless sequence that copies the same
+-	   byte 3 times if count==1, or the 2nd byte twice if count==2.  */
+-1:
+-	cbz	count, 2f
+-	lsr	tmp1, count, 1
+-	ldrb	A_lw, [src]
+-	ldrb	A_hw, [srcend, -1]
+-	ldrb	B_lw, [src, tmp1]
+-	strb	A_lw, [dstin]
+-	strb	B_lw, [dstin, tmp1]
+-	strb	A_hw, [dstend, -1]
+-2:	ret
+-
+-	.p2align 4
+-	/* Copy 64..96 bytes.  Copy 64 bytes from the start and
+-	   32 bytes from the end.  */
+-L(copy96):
+-	ldp	B_l, B_h, [src, 16]
+-	ldp	C_l, C_h, [src, 32]
+-	ldp	D_l, D_h, [src, 48]
+-	ldp	E_l, E_h, [srcend, -32]
+-	ldp	F_l, F_h, [srcend, -16]
+-	stp	A_l, A_h, [dstin]
+-	stp	B_l, B_h, [dstin, 16]
+-	stp	C_l, C_h, [dstin, 32]
+-	stp	D_l, D_h, [dstin, 48]
+-	stp	E_l, E_h, [dstend, -32]
+-	stp	F_l, F_h, [dstend, -16]
+-	ret
+-
+-	/* Align DST to 16 byte alignment so that we don't cross cache line
+-	   boundaries on both loads and stores.	 There are at least 96 bytes
+-	   to copy, so copy 16 bytes unaligned and then align.	The loop
+-	   copies 64 bytes per iteration and prefetches one iteration ahead.  */
+-
+-	.p2align 4
+-L(copy_long):
+-	and	tmp1, dstin, 15
+-	bic	dst, dstin, 15
+-	ldp	D_l, D_h, [src]
+-	sub	src, src, tmp1
+-	add	count, count, tmp1	/* Count is now 16 too large.  */
+-	ldp	A_l, A_h, [src, 16]
+-	stp	D_l, D_h, [dstin]
+-	ldp	B_l, B_h, [src, 32]
+-	ldp	C_l, C_h, [src, 48]
+-	ldp	D_l, D_h, [src, 64]!
+-	subs	count, count, 128 + 16	/* Test and readjust count.  */
+-	b.ls	2f
+-1:
+-	stp	A_l, A_h, [dst, 16]
+-	ldp	A_l, A_h, [src, 16]
+-	stp	B_l, B_h, [dst, 32]
+-	ldp	B_l, B_h, [src, 32]
+-	stp	C_l, C_h, [dst, 48]
+-	ldp	C_l, C_h, [src, 48]
+-	stp	D_l, D_h, [dst, 64]!
+-	ldp	D_l, D_h, [src, 64]!
+-	subs	count, count, 64
+-	b.hi	1b
+-
+-	/* Write the last full set of 64 bytes.	 The remainder is at most 64
+-	   bytes, so it is safe to always copy 64 bytes from the end even if
+-	   there is just 1 byte left.  */
+-2:
+-	ldp	E_l, E_h, [srcend, -64]
+-	stp	A_l, A_h, [dst, 16]
+-	ldp	A_l, A_h, [srcend, -48]
+-	stp	B_l, B_h, [dst, 32]
+-	ldp	B_l, B_h, [srcend, -32]
+-	stp	C_l, C_h, [dst, 48]
+-	ldp	C_l, C_h, [srcend, -16]
+-	stp	D_l, D_h, [dst, 64]
+-	stp	E_l, E_h, [dstend, -64]
+-	stp	A_l, A_h, [dstend, -48]
+-	stp	B_l, B_h, [dstend, -32]
+-	stp	C_l, C_h, [dstend, -16]
+-	ret
+-
+-	.size	memcpy, . - memcpy
+ #endif
+-- 
+2.38.0
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
index 12d300a04b51..aa8f271df29f 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
@@ -1,11 +1,28 @@
 FILESEXTRAPATHS:prepend := "${THISDIR}/corstone1000:"
 
 SRC_URI:append = " \
-                  file://0026-plat-add-corstone1000-platform-to-drivers-arm.patch \
-                  file://0027-Add-MHU-driver.patch \
-		  "
+    file://0001-Add-openamp-to-SE-proxy-deployment.patch \
+    file://0002-Implement-mhu-driver-and-the-OpenAmp-conversion-laye.patch \
+    file://0003-Add-openamp-rpc-caller.patch \
+    file://0004-add-psa-client-definitions-for-ff-m.patch \
+    file://0005-Add-common-service-component-to-ipc-support.patch \
+    file://0006-Add-secure-storage-ipc-backend.patch \
+    file://0007-Use-secure-storage-ipc-and-openamp-for-se_proxy.patch \
+    file://0008-Run-psa-arch-test.patch \
+    file://0009-Use-address-instead-of-pointers.patch \
+    file://0010-Add-psa-ipc-attestation-to-se-proxy.patch \
+    file://0011-Setup-its-backend-as-openamp-rpc-using-secure-storag.patch \
+    file://0012-add-psa-ipc-crypto-backend.patch \
+    file://0013-Add-stub-capsule-update-service-components.patch \
+    file://0014-Configure-storage-size.patch \
+    file://0015-Fix-Crypto-interface-structure-aligned-with-tf-m-cha.patch \
+    file://0016-Integrate-remaining-psa-ipc-client-APIs.patch \
+    file://0017-Fix-update-psa_set_key_usage_flags-definition-to-the.patch \
+    file://0018-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch \
+    file://0019-plat-corstone1000-change-default-smm-values.patch \
+    "
 
 
 EXTRA_OECMAKE:append = "-DMM_COMM_BUFFER_ADDRESS="0x00000000 0x02000000" \
-                                             -DMM_COMM_BUFFER_PAGE_COUNT="1" \
-"
+    -DMM_COMM_BUFFER_PAGE_COUNT="1" \
+    "
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-newlib_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/ts-newlib_%.bbappend
new file mode 100644
index 000000000000..845f88349351
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-newlib_%.bbappend
@@ -0,0 +1,6 @@
+FILESEXTRAPATHS:prepend := "${THISDIR}/corstone1000/${PN}:"
+
+SRC_URI:append:corstone1000 = " \
+  file://0001-newlib-memcpy-remove-optimized-version.patch;patchdir=../newlib \
+"
+
diff --git a/meta-arm/recipes-security/trusted-services/trusted-services-src.inc b/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
index c8aa821a7d0c..dc295506bbc9 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
@@ -42,6 +42,16 @@ SRC_URI += "git://github.com/cpputest/cpputest.git;name=cpputest;protocol=https;
 SRCREV_cpputest = "e25097614e1c4856036366877a02346c4b36bb5b"
 LIC_FILES_CHKSUM += "file://../cpputest/COPYING;md5=ce5d5f1fe02bcd1343ced64a06fd4177"
 
+# Libmetal
+SRC_URI += "git://github.com/OpenAMP/libmetal.git;name=libmetal;protocol=https;branch=main;destsuffix=git/libmetal"
+SRCREV_libmetal = "f252f0e007fbfb8b3a52b1d5901250ddac96baad"
+LIC_FILES_CHKSUM += "file://../libmetal/LICENSE.md;md5=fe0b8a4beea8f0813b606d15a3df3d3c"
+
+# Openamp
+SRC_URI += "git://github.com/OpenAMP/open-amp.git;name=openamp;protocol=https;branch=main;destsuffix=git/openamp"
+SRCREV_openamp = "347397decaa43372fc4d00f965640ebde042966d"
+LIC_FILES_CHKSUM += "file://../openamp/LICENSE.md;md5=a8d8cf662ef6bf9936a1e1413585ecbf"
+
 # TS ships patches for external dependencies that needs to be applied
 apply_ts_patches() {
     for p in ${S}/external/qcbor/*.patch; do
@@ -63,4 +73,6 @@ EXTRA_OECMAKE += "-DDTC_SOURCE_DIR=${WORKDIR}/git/dtc \
                   -DT_COSE_SOURCE_DIR=${WORKDIR}/git/tcose \
                   -DQCBOR_SOURCE_DIR=${WORKDIR}/git/qcbor \
                   -DMBEDTLS_SOURCE_DIR=${WORKDIR}/git/mbedtls \
+                  -DOPENAMP_SOURCE_DIR=${WORKDIR}/git/openamp \
+                  -DLIBMETAL_SOURCE_DIR=${WORKDIR}/git/libmetal \
                  "
-- 
2.38.0


