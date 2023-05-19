Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5753DC7EE30
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 11:24:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.23144.1684495471275443988
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 19 May 2023 04:24:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0B131FB;
	Fri, 19 May 2023 04:25:15 -0700 (PDT)
Received: from R91284ZP.arm.com (unknown [10.57.21.254])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D19653F762;
	Fri, 19 May 2023 04:24:29 -0700 (PDT)
From: Gyorgy Szing <Gyorgy.Szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 09/16] arm-bsp/trusted-services:corstone1000: remove already merged patches
Date: Fri, 19 May 2023 13:23:53 +0200
Message-Id: <20230519112400.340-9-Gyorgy.Szing@arm.com>
X-Mailer: git-send-email 2.39.1.windows.1
In-Reply-To: <20230519112400.340-1-Gyorgy.Szing@arm.com>
References: <20230519112400.340-1-Gyorgy.Szing@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 19 May 2023 11:24:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4673

From: Rui Miguel Silva <rui.silva@linaro.org>

Remove already merged patches in trusted services integration
branch to avoid clash during apply patch stage and rebase the
remaining patches.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 ...1-Add-openamp-to-SE-proxy-deployment.patch |  287 --
 ...b-capsule-update-service-components.patch} |   88 +-
 ...in-AEAD-for-psa-arch-test-54-and-58.patch} |    8 +-
 ...iver-and-the-OpenAmp-conversion-laye.patch | 1091 -------
 .../0003-Add-openamp-rpc-caller.patch         | 1196 --------
 ...=3D> 0003-FMP-Support-in-Corstone1000.patch} |    6 +-
 ...1.7-alignment-Align-PSA-Crypto-SIDs.patch} |   32 +-
 ...-add-psa-client-definitions-for-ff-m.patch |  298 --
 ...mon-service-component-to-ipc-support.patch |  295 --
 ...nment-Align-crypto-iovec-definition.patch} |  135 +-
 .../0006-Add-secure-storage-ipc-backend.patch |  523 ----
 ...gnment-PSA-crypto-client-in-out_vec.patch} |   39 +-
 ...storage-ipc-and-openamp-for-se_proxy.patch |   63 -
 .../corstone1000/0008-Run-psa-arch-test.patch |   72 -
 ...0009-Use-address-instead-of-pointers.patch |  168 --
 ...-Add-psa-ipc-attestation-to-se-proxy.patch |  323 ---
 ...d-as-openamp-rpc-using-secure-storag.patch |  163 --
 .../0012-add-psa-ipc-crypto-backend.patch     | 2570 -----------------
 .../0014-Configure-storage-size.patch         |   42 -
 ...face-structure-aligned-with-tf-m-cha.patch |   31 -
 ...egrate-remaining-psa-ipc-client-APIs.patch |  494 ----
 ...et_key_usage_flags-definition-to-the.patch |   40 -
 ...rstone1000-change-default-smm-values.patch |   37 -
 ...teway-add-checks-for-null-attributes.patch |   35 -
 .../0022-GetNextVariableName-Fix.patch        |   33 -
 ...3-Use-the-stateless-platform-service.patch |  140 -
 .../trusted-services/ts-arm-platforms.inc     |   32 +-
 27 files changed, 128 insertions(+), 8113 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0001-Add-openamp-to-SE-proxy-deployment.patch
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0013=
-Add-stub-capsule-update-service-components.patch =3D> 0001-Add-stub-caps=
ule-update-service-components.patch} (78%)
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0018=
-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch =3D> 0002-Fixes-in-AEAD-=
for-psa-arch-test-54-and-58.patch} (96%)
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0002-Implement-mhu-driver-and-the-OpenAmp-conversion-laye.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0003-Add-openamp-rpc-caller.patch
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0020=
-FMP-Support-in-Corstone1000.patch =3D> 0003-FMP-Support-in-Corstone1000.=
patch} (99%)
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0024=
-TF-Mv1.7-alignment-Align-PSA-Crypto-SIDs.patch =3D> 0004-TF-Mv1.7-alignm=
ent-Align-PSA-Crypto-SIDs.patch} (95%)
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0004-add-psa-client-definitions-for-ff-m.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0005-Add-common-service-component-to-ipc-support.patch
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0025=
-TF-Mv1.7-alignment-Align-crypto-iovec-definition.patch =3D> 0005-TF-Mv1.=
7-alignment-Align-crypto-iovec-definition.patch} (90%)
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0006-Add-secure-storage-ipc-backend.patch
 rename meta-arm-bsp/recipes-security/trusted-services/corstone1000/{0026=
-TF-Mv1.7-alignment-PSA-crypto-client-in-out_vec.patch =3D> 0006-TF-Mv1.7=
-alignment-PSA-crypto-client-in-out_vec.patch} (80%)
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0007-Use-secure-storage-ipc-and-openamp-for-se_proxy.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0008-Run-psa-arch-test.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0009-Use-address-instead-of-pointers.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0010-Add-psa-ipc-attestation-to-se-proxy.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0011-Setup-its-backend-as-openamp-rpc-using-secure-storag.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0012-add-psa-ipc-crypto-backend.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0014-Configure-storage-size.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0015-Fix-Crypto-interface-structure-aligned-with-tf-m-cha.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0016-Integrate-remaining-psa-ipc-client-APIs.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0017-Fix-update-psa_set_key_usage_flags-definition-to-the.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0019-plat-corstone1000-change-default-smm-values.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0021-smm_gateway-add-checks-for-null-attributes.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0022-GetNextVariableName-Fix.patch
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0023-Use-the-stateless-platform-service.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0001-Add-openamp-to-SE-proxy-deployment.patch b/meta-arm-bsp/recipes-secu=
rity/trusted-services/corstone1000/0001-Add-openamp-to-SE-proxy-deploymen=
t.patch
deleted file mode 100644
index c44885cf..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0001-Ad=
d-openamp-to-SE-proxy-deployment.patch
+++ /dev/null
@@ -1,287 +0,0 @@
-From 13de79cd4f0d25b812e5f4ad4a19bc075496be83 Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Fri, 3 Dec 2021 16:36:51 +0000
-Subject: [PATCH 01/20] Add openamp to SE proxy deployment
-
-Openamp is required to communicate between secure partitions(running on
-Cortex-A) and trusted-firmware-m(running on Cortex-M).
-These changes are to fetch libmetal and openamp from github repo's
-and build it.
-
-Upstream-Status: Pending
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- deployments/se-proxy/opteesp/lse.S            | 28 ++++++++
- deployments/se-proxy/se-proxy.cmake           |  8 +++
- external/openamp/libmetal-init-cache.cmake.in | 20 ++++++
- external/openamp/libmetal.cmake               | 67 +++++++++++++++++++
- external/openamp/openamp-init-cache.cmake.in  | 20 ++++++
- external/openamp/openamp.cmake                | 66 ++++++++++++++++++
- 6 files changed, 209 insertions(+)
- create mode 100644 deployments/se-proxy/opteesp/lse.S
- create mode 100644 external/openamp/libmetal-init-cache.cmake.in
- create mode 100644 external/openamp/libmetal.cmake
- create mode 100644 external/openamp/openamp-init-cache.cmake.in
- create mode 100644 external/openamp/openamp.cmake
-
-diff --git a/deployments/se-proxy/opteesp/lse.S b/deployments/se-proxy/o=
pteesp/lse.S
-new file mode 100644
-index 000000000000..8e466d65fc2b
---- /dev/null
-+++ b/deployments/se-proxy/opteesp/lse.S
-@@ -0,0 +1,28 @@
-+// SPDX-License-Identifier: BSD-3-Clause
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ */
-+
-+.text
-+.globl __aarch64_cas4_acq_rel
-+.globl __aarch64_cas4_sync
-+
-+__aarch64_cas4_acq_rel:
-+	mov	w16, w0
-+	ldaxr	w0, [x2]
-+	cmp	w0, w16
-+0:	bne	1f
-+
-+	stlxr	w17, w1, [x2]
-+	cbnz	w17, 0b
-+1:	ret
-+
-+__aarch64_cas4_sync:
-+	mov	w16, w0
-+	ldxr	w0, [x2]
-+	cmp	w0, w16
-+0:	bne	1f
-+
-+	stlxr	w17, w1, [x2]
-+	cbnz	w17, 0b
-+1:	ret
-diff --git a/deployments/se-proxy/se-proxy.cmake b/deployments/se-proxy/=
se-proxy.cmake
-index 426c66c05350..d39873a0fe81 100644
---- a/deployments/se-proxy/se-proxy.cmake
-+++ b/deployments/se-proxy/se-proxy.cmake
-@@ -61,6 +61,7 @@ add_components(TARGET "se-proxy"
- target_sources(se-proxy PRIVATE
- 	${CMAKE_CURRENT_LIST_DIR}/common/se_proxy_sp.c
- 	${CMAKE_CURRENT_LIST_DIR}/common/service_proxy_factory.c
-+	${CMAKE_CURRENT_LIST_DIR}/opteesp/lse.S
- )
-=20
- #----------------------------------------------------------------------=
---------
-@@ -73,6 +74,13 @@ include(../../../external/nanopb/nanopb.cmake)
- target_link_libraries(se-proxy PRIVATE nanopb::protobuf-nanopb-static)
- protobuf_generate_all(TGT "se-proxy" NAMESPACE "protobuf" BASE_DIR "${T=
S_ROOT}/protocols")
-=20
-+# libmetal
-+include(../../../external/openamp/libmetal.cmake)
-+
-+# OpenAMP
-+include(../../../external/openamp/openamp.cmake)
-+target_link_libraries(se-proxy PRIVATE openamp libmetal)
-+
- #################################################################
-=20
- target_include_directories(se-proxy PRIVATE
-diff --git a/external/openamp/libmetal-init-cache.cmake.in b/external/op=
enamp/libmetal-init-cache.cmake.in
-new file mode 100644
-index 000000000000..04c25fbde960
---- /dev/null
-+++ b/external/openamp/libmetal-init-cache.cmake.in
-@@ -0,0 +1,20 @@
-+#----------------------------------------------------------------------=
---------
-+# Copyright (c) 2021-2022, Arm Limited and Contributors. All rights res=
erved.
-+# Copyright (c) 2021-2022, Linaro. All rights reserved.
-+#
-+# SPDX-License-Identifier: BSD-3-Clause
-+#
-+#----------------------------------------------------------------------=
---------
-+
-+set(CMAKE_INSTALL_PREFIX "@BUILD_INSTALL_DIR@" CACHE STRING "")
-+set(CMAKE_TOOLCHAIN_FILE "@TS_EXTERNAL_LIB_TOOLCHAIN_FILE@" CACHE STRIN=
G "")
-+set(BUILD_SHARED_LIBS Off CACHE BOOL "")
-+set(BUILD_STATIC_LIBS On CACHE BOOL "")
-+
-+set(WITH_DOC OFF CACHE BOOL "")
-+set(WITH_TESTS OFF CACHE BOOL "")
-+set(WITH_EXAMPLES OFF CACHE BOOL "")
-+set(WITH_DEFAULT_LOGGER OFF CACHE BOOL "")
-+set(MACHINE "template" CACHE STRING "")
-+
-+@_cmake_fragment@
-diff --git a/external/openamp/libmetal.cmake b/external/openamp/libmetal=
.cmake
-new file mode 100644
-index 000000000000..6e5004ff555c
---- /dev/null
-+++ b/external/openamp/libmetal.cmake
-@@ -0,0 +1,67 @@
-+#----------------------------------------------------------------------=
---------
-+# Copyright (c) 2022 Linaro Limited
-+# Copyright (c) 2022, Arm Limited. All rights reserved.
-+#
-+# SPDX-License-Identifier: BSD-3-Clause
-+#
-+#----------------------------------------------------------------------=
---------
-+
-+set (LIBMETAL_URL "https://github.com/OpenAMP/libmetal.git"
-+		    CACHE STRING "libmetal repository URL")
-+set (LIBMETAL_INSTALL_DIR "${CMAKE_CURRENT_BINARY_DIR}/libmetal_install=
"
-+		    CACHE DIR "libmetal installation directory")
-+set(LIBMETAL_SOURCE_DIR "${CMAKE_CURRENT_BINARY_DIR}/_deps/libmetal"
-+		CACHE DIR "libmetal source-code")
-+set (LIBMETAL_PACKAGE_DIR "${LIBMETAL_INSTALL_DIR}/libmetal/cmake"
-+			    CACHE DIR "libmetal CMake package directory")
-+set (LIBMETAL_TARGET_NAME "libmetal")
-+set (LIBMETAL_REFSPEC "f252f0e007fbfb8b3a52b1d5901250ddac96baad"
-+			CACHE STRING "The version of libmetal to use")
-+set(LIBMETAL_BINARY_DIR "${CMAKE_CURRENT_BINARY_DIR}/_deps/libmetal-bui=
ld")
-+
-+set(GIT_OPTIONS
-+    GIT_REPOSITORY ${LIBMETAL_URL}
-+    GIT_TAG ${LIBMETAL_REFSPEC}
-+    GIT_SHALLOW FALSE
-+)
-+
-+if(NOT LIBMETAL_DEBUG)
-+	set(LIBMETAL_BUILD_TYPE "Release")
-+else()
-+	set(LIBMETAL_BUILD_TYPE "Debug")
-+endif()
-+
-+include(FetchContent)
-+
-+# Checking git
-+find_program(GIT_COMMAND "git")
-+if (NOT GIT_COMMAND)
-+	message(FATAL_ERROR "Please install git")
-+endif()
-+
-+# Only pass libc settings to libmetal if needed. For environments where=
 the
-+# standard library is not overridden, this is not needed.
-+if(TARGET stdlib::c)
-+	include(${TS_ROOT}/tools/cmake/common/PropertyCopy.cmake)
-+
-+	# Save libc settings
-+	save_interface_target_properties(TGT stdlib::c PREFIX LIBC)
-+	# Translate libc settings to cmake code fragment. Will be inserted int=
o
-+	# libmetal-init-cache.cmake.in when LazyFetch configures the file.
-+	translate_interface_target_properties(PREFIX LIBC RES _cmake_fragment)
-+	unset_saved_properties(LIBC)
-+endif()
-+
-+include(${TS_ROOT}/tools/cmake/common/LazyFetch.cmake REQUIRED)
-+LazyFetch_MakeAvailable(DEP_NAME libmetal
-+    FETCH_OPTIONS "${GIT_OPTIONS}"
-+    INSTALL_DIR "${LIBMETAL_INSTALL_DIR}"
-+    CACHE_FILE "${TS_ROOT}/external/openamp/libmetal-init-cache.cmake.i=
n"
-+    SOURCE_DIR "${LIBMETAL_SOURCE_DIR}"
-+)
-+unset(_cmake_fragment)
-+
-+#Create an imported target to have clean abstraction in the build-syste=
m.
-+add_library(libmetal STATIC IMPORTED)
-+set_property(TARGET libmetal PROPERTY IMPORTED_LOCATION "${LIBMETAL_INS=
TALL_DIR}/lib/${CMAKE_STATIC_LIBRARY_PREFIX}metal${CMAKE_STATIC_LIBRARY_S=
UFFIX}")
-+set_property(TARGET libmetal PROPERTY INTERFACE_INCLUDE_DIRECTORIES "${=
LIBMETAL_INSTALL_DIR}/include")
-diff --git a/external/openamp/openamp-init-cache.cmake.in b/external/ope=
namp/openamp-init-cache.cmake.in
-new file mode 100644
-index 000000000000..302b80511bce
---- /dev/null
-+++ b/external/openamp/openamp-init-cache.cmake.in
-@@ -0,0 +1,20 @@
-+#----------------------------------------------------------------------=
---------
-+# Copyright (c) 2021-2022, Arm Limited and Contributors. All rights res=
erved.
-+# Copyright (c) 2021-2022, Linaro. All rights reserved.
-+#
-+# SPDX-License-Identifier: BSD-3-Clause
-+#
-+#----------------------------------------------------------------------=
---------
-+
-+set(CMAKE_INSTALL_PREFIX "@BUILD_INSTALL_DIR@" CACHE STRING "")
-+set(CMAKE_TOOLCHAIN_FILE "@TS_EXTERNAL_LIB_TOOLCHAIN_FILE@" CACHE STRIN=
G "")
-+set(BUILD_SHARED_LIBS Off CACHE BOOL "")
-+set(BUILD_STATIC_LIBS On CACHE BOOL "")
-+
-+set(LIBMETAL_INCLUDE_DIR "@CMAKE_CURRENT_BINARY_DIR@/libmetal_install/i=
nclude" CACHE
-+    STRING "")
-+set(LIBMETAL_LIB "@CMAKE_CURRENT_BINARY_DIR@/libmetal_install/lib" CACH=
E STRING "")
-+set(RPMSG_BUFFER_SIZE "512" CACHE STRING "")
-+set(MACHINE "template" CACHE STRING "")
-+
-+@_cmake_fragment@
-diff --git a/external/openamp/openamp.cmake b/external/openamp/openamp.c=
make
-new file mode 100644
-index 000000000000..449f35f4fda4
---- /dev/null
-+++ b/external/openamp/openamp.cmake
-@@ -0,0 +1,66 @@
-+#----------------------------------------------------------------------=
---------
-+# Copyright (c) 2022 Linaro Limited
-+# Copyright (c) 2022, Arm Limited. All rights reserved.
-+#
-+# SPDX-License-Identifier: BSD-3-Clause
-+#
-+#----------------------------------------------------------------------=
---------
-+
-+set (OPENAMP_URL "https://github.com/OpenAMP/open-amp.git"
-+		    CACHE STRING "OpenAMP repository URL")
-+set (OPENAMP_INSTALL_DIR "${CMAKE_CURRENT_BINARY_DIR}/openamp_install"
-+			    CACHE DIR "OpenAMP installation directory")
-+set (OPENAMP_SOURCE_DIR "${CMAKE_CURRENT_BINARY_DIR}/_deps/openamp"
-+			    CACHE DIR "OpenAMP source code directory")
-+set (OPENAMP_PACKAGE_DIR "${OPENAMP_INSTALL_DIR}/openamp/cmake"
-+			    CACHE DIR "OpenAMP CMake package directory")
-+set (OPENAMP_TARGET_NAME "openamp")
-+set (OPENAMP_REFSPEC "347397decaa43372fc4d00f965640ebde042966d"
-+			CACHE STRING "The version of openamp to use")
-+
-+set(GIT_OPTIONS
-+    GIT_REPOSITORY ${OPENAMP_URL}
-+    GIT_TAG ${OPENAMP_REFSPEC}
-+    GIT_SHALLOW FALSE
-+)
-+
-+if(NOT OPENAMP_DEBUG)
-+	set(OPENAMP_BUILD_TYPE "Release")
-+else()
-+	set(OPENAMP_BUILD_TYPE "Debug")
-+endif()
-+
-+include(FetchContent)
-+
-+# Checking git
-+find_program(GIT_COMMAND "git")
-+if (NOT GIT_COMMAND)
-+	message(FATAL_ERROR "Please install git")
-+endif()
-+
-+# Only pass libc settings to openamp if needed. For environments where =
the
-+# standard library is not overridden, this is not needed.
-+if(TARGET stdlib::c)
-+	include(${TS_ROOT}/tools/cmake/common/PropertyCopy.cmake)
-+
-+	# Save libc settings
-+	save_interface_target_properties(TGT stdlib::c PREFIX LIBC)
-+	# Translate libc settings to cmake code fragment. Will be inserted int=
o
-+	# libmetal-init-cache.cmake.in when LazyFetch configures the file.
-+	translate_interface_target_properties(PREFIX LIBC RES _cmake_fragment)
-+	unset_saved_properties(LIBC)
-+endif()
-+
-+include(${TS_ROOT}/tools/cmake/common/LazyFetch.cmake REQUIRED)
-+LazyFetch_MakeAvailable(DEP_NAME openamp
-+    FETCH_OPTIONS "${GIT_OPTIONS}"
-+    INSTALL_DIR "${OPENAMP_INSTALL_DIR}"
-+    CACHE_FILE "${TS_ROOT}/external/openamp/openamp-init-cache.cmake.in=
"
-+    SOURCE_DIR "${OPENAMP_SOURCE_DIR}"
-+)
-+unset(_cmake_fragment)
-+
-+#Create an imported target to have clean abstraction in the build-syste=
m.
-+add_library(openamp STATIC IMPORTED)
-+set_property(TARGET openamp PROPERTY IMPORTED_LOCATION "${OPENAMP_INSTA=
LL_DIR}/lib/${CMAKE_STATIC_LIBRARY_PREFIX}open_amp${CMAKE_STATIC_LIBRARY_=
SUFFIX}")
-+set_property(TARGET openamp PROPERTY INTERFACE_INCLUDE_DIRECTORIES "${O=
PENAMP_INSTALL_DIR}/include")
---=20
-2.38.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0013-Add-stub-capsule-update-service-components.patch b/meta-arm-bsp/reci=
pes-security/trusted-services/corstone1000/0001-Add-stub-capsule-update-s=
ervice-components.patch
similarity index 78%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
013-Add-stub-capsule-update-service-components.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/000=
1-Add-stub-capsule-update-service-components.patch
index 0040e127..c1775b79 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0013-Ad=
d-stub-capsule-update-service-components.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0001-Ad=
d-stub-capsule-update-service-components.patch
@@ -1,7 +1,7 @@
-From 050be6fdfee656b0556766cc1db30f4c0ea87c79 Mon Sep 17 00:00:00 2001
+From a965129153a0cca340535fe2cf99dbfef9b557da Mon Sep 17 00:00:00 2001
 From: Julian Hall <julian.hall@arm.com>
 Date: Tue, 12 Oct 2021 15:45:41 +0100
-Subject: [PATCH 13/20] Add stub capsule update service components
+Subject: [PATCH 1/6] Add stub capsule update service components
=20
 To facilitate development of a capsule update service provider,
 stub components are added to provide a starting point for an
@@ -18,15 +18,12 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org=
>
  .../provider/capsule_update_provider.c        | 133 ++++++++++++++++++
  .../provider/capsule_update_provider.h        |  51 +++++++
  .../capsule_update/provider/component.cmake   |  13 ++
- deployments/se-proxy/common/se_proxy_sp.c     |   3 +
- .../se-proxy/common/service_proxy_factory.c   |  16 +++
- .../se-proxy/common/service_proxy_factory.h   |   1 +
- deployments/se-proxy/se-proxy.cmake           |   1 +
+ .../se-proxy/infra/corstone1000/infra.cmake   |   1 +
  deployments/se-proxy/se_proxy_interfaces.h    |   9 +-
  .../capsule_update/capsule_update_proto.h     |  13 ++
  protocols/service/capsule_update/opcodes.h    |  17 +++
  protocols/service/capsule_update/parameters.h |  15 ++
- 12 files changed, 292 insertions(+), 4 deletions(-)
+ 9 files changed, 272 insertions(+), 4 deletions(-)
  create mode 100644 components/service/capsule_update/backend/capsule_up=
date_backend.h
  create mode 100644 components/service/capsule_update/provider/capsule_u=
pdate_provider.c
  create mode 100644 components/service/capsule_update/provider/capsule_u=
pdate_provider.h
@@ -280,75 +277,18 @@ index 000000000000..1d412eb234d9
 +target_sources(${TGT} PRIVATE
 +	"${CMAKE_CURRENT_LIST_DIR}/capsule_update_provider.c"
 +	)
-diff --git a/deployments/se-proxy/common/se_proxy_sp.c b/deployments/se-=
proxy/common/se_proxy_sp.c
-index a37396f4454b..a38ad6ca3f56 100644
---- a/deployments/se-proxy/common/se_proxy_sp.c
-+++ b/deployments/se-proxy/common/se_proxy_sp.c
-@@ -77,6 +77,9 @@ void __noreturn sp_main(struct ffa_init_info *init_inf=
o)
- 	}
- 	rpc_demux_attach(&rpc_demux, SE_PROXY_INTERFACE_ID_ATTEST, rpc_iface);
-=20
-+	rpc_iface =3D capsule_update_proxy_create();
-+	rpc_demux_attach(&rpc_demux, SE_PROXY_INTERFACE_ID_CAPSULE_UPDATE, rpc=
_iface);
-+
- 	/* End of boot phase */
- 	result =3D sp_msg_wait(&req_msg);
- 	if (result !=3D SP_RESULT_OK) {
-diff --git a/deployments/se-proxy/common/service_proxy_factory.c b/deplo=
yments/se-proxy/common/service_proxy_factory.c
-index 7edeef8b434a..591cc9eeb59e 100644
---- a/deployments/se-proxy/common/service_proxy_factory.c
-+++ b/deployments/se-proxy/common/service_proxy_factory.c
-@@ -13,6 +13,7 @@
- #include <service/crypto/factory/crypto_provider_factory.h>
- #include <service/secure_storage/frontend/secure_storage_provider/secur=
e_storage_provider.h>
- #include <trace.h>
-+#include <service/capsule_update/provider/capsule_update_provider.h>
-=20
- /* Stub backends */
- #include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-@@ -93,3 +94,18 @@ struct rpc_interface *its_proxy_create(void)
- =20
-         return secure_storage_provider_init(&its_provider, backend);
- }
-+
-+struct rpc_interface *capsule_update_proxy_create(void)
-+{
-+	static struct capsule_update_provider capsule_update_provider;
-+	static struct rpc_caller *capsule_update_caller;
-+
-+	capsule_update_caller =3D openamp_caller_init(&openamp);
-+
-+	if (!capsule_update_caller)
-+	return NULL;
-+
-+	capsule_update_provider.client.caller =3D capsule_update_caller;
-+
-+	return capsule_update_provider_init(&capsule_update_provider);
-+}
-diff --git a/deployments/se-proxy/common/service_proxy_factory.h b/deplo=
yments/se-proxy/common/service_proxy_factory.h
-index 298d407a2371..02aa7fe2550d 100644
---- a/deployments/se-proxy/common/service_proxy_factory.h
-+++ b/deployments/se-proxy/common/service_proxy_factory.h
-@@ -17,6 +17,7 @@ struct rpc_interface *attest_proxy_create(void);
- struct rpc_interface *crypto_proxy_create(void);
- struct rpc_interface *ps_proxy_create(void);
- struct rpc_interface *its_proxy_create(void);
-+struct rpc_interface *capsule_update_proxy_create(void);
-=20
- #ifdef __cplusplus
- }
-diff --git a/deployments/se-proxy/se-proxy.cmake b/deployments/se-proxy/=
se-proxy.cmake
-index 3dbbc36c968d..f0db2d43f443 100644
---- a/deployments/se-proxy/se-proxy.cmake
-+++ b/deployments/se-proxy/se-proxy.cmake
-@@ -51,6 +51,7 @@ add_components(TARGET "se-proxy"
- 		"components/service/attestation/provider/serializer/packed-c"
+diff --git a/deployments/se-proxy/infra/corstone1000/infra.cmake b/deplo=
yments/se-proxy/infra/corstone1000/infra.cmake
+index 4e7e2bd58028..e60b5400617f 100644
+--- a/deployments/se-proxy/infra/corstone1000/infra.cmake
++++ b/deployments/se-proxy/infra/corstone1000/infra.cmake
+@@ -21,6 +21,7 @@ add_components(TARGET "se-proxy"
+ 		"components/service/attestation/key_mngr/local"
  		"components/service/attestation/reporter/psa_ipc"
- 		"components/service/attestation/client/psa_ipc"
+ 		"components/service/crypto/backend/psa_ipc"
 +		"components/service/capsule_update/provider"
- 		"components/rpc/openamp/caller/sp"
+ 		"components/service/secure_storage/backend/secure_storage_ipc"
+ )
 =20
- 		# Stub service provider backends
 diff --git a/deployments/se-proxy/se_proxy_interfaces.h b/deployments/se=
-proxy/se_proxy_interfaces.h
 index 48908f846990..3d4a7c204785 100644
 --- a/deployments/se-proxy/se_proxy_interfaces.h
@@ -432,5 +372,5 @@ index 000000000000..285d924186be
 +
 +#endif /* CAPSULE_UPDATE_PARAMETERS_H */
 --=20
-2.38.1
+2.40.0
=20
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0018-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch b/meta-arm-bsp/recip=
es-security/trusted-services/corstone1000/0002-Fixes-in-AEAD-for-psa-arch=
-test-54-and-58.patch
similarity index 96%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
018-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/000=
2-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch
index c1598a9e..3f3800ce 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0018-Fi=
xes-in-AEAD-for-psa-arch-test-54-and-58.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0002-Fi=
xes-in-AEAD-for-psa-arch-test-54-and-58.patch
@@ -1,7 +1,7 @@
-From 1a4d46fdc0b5745b9cfb0789e4b778111bd6dbbb Mon Sep 17 00:00:00 2001
+From 51a7024967187644011c5043ef0f733cf81b26be Mon Sep 17 00:00:00 2001
 From: Satish Kumar <satish.kumar01@arm.com>
 Date: Mon, 14 Feb 2022 08:22:25 +0000
-Subject: [PATCH 18/20] Fixes in AEAD for psa-arch test 54 and 58.
+Subject: [PATCH 2/6] Fixes in AEAD for psa-arch test 54 and 58.
=20
 Upstream-Status: Pending [Not submitted to upstream yet]
 Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
@@ -29,7 +29,7 @@ index c4ffb20cf7f8..a91f66c14008 100644
 =20
  	/* Mandatory input data parameter */
 diff --git a/components/service/crypto/include/psa/crypto_sizes.h b/comp=
onents/service/crypto/include/psa/crypto_sizes.h
-index 4d7bf6e959b0..e3c4df2927b3 100644
+index 30aa102da581..130d27295878 100644
 --- a/components/service/crypto/include/psa/crypto_sizes.h
 +++ b/components/service/crypto/include/psa/crypto_sizes.h
 @@ -351,7 +351,7 @@
@@ -117,5 +117,5 @@ index 0be266b52403..435fd3b523ce 100644
 =20
  /* Variable length input parameter tags */
 --=20
-2.38.1
+2.40.0
=20
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0002-Implement-mhu-driver-and-the-OpenAmp-conversion-laye.patch b/meta-ar=
m-bsp/recipes-security/trusted-services/corstone1000/0002-Implement-mhu-d=
river-and-the-OpenAmp-conversion-laye.patch
deleted file mode 100644
index 0371a7a4..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0002-Im=
plement-mhu-driver-and-the-OpenAmp-conversion-laye.patch
+++ /dev/null
@@ -1,1091 +0,0 @@
-From 28aedac78016e5063ebd675a43e6c3655f87b442 Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Fri, 3 Dec 2021 18:00:46 +0000
-Subject: [PATCH 02/20] Implement mhu driver and the OpenAmp conversion l=
ayer.
-
-This commit adds an mhu driver (v2.1 and v2) to the secure
-partition se_proxy and a conversion layer to communicate with
-the secure enclave using OpenAmp.
-
-Upstream-Status: Pending
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- .../se-proxy/opteesp/default_se-proxy.dts.in  |  16 +
- .../drivers/arm/mhu_driver/component.cmake    |  12 +
- platform/drivers/arm/mhu_driver/mhu_v2.h      | 391 ++++++++++++
- platform/drivers/arm/mhu_driver/mhu_v2_x.c    | 602 ++++++++++++++++++
- .../providers/arm/corstone1000/platform.cmake |  10 +
- 5 files changed, 1031 insertions(+)
- create mode 100644 platform/drivers/arm/mhu_driver/component.cmake
- create mode 100644 platform/drivers/arm/mhu_driver/mhu_v2.h
- create mode 100644 platform/drivers/arm/mhu_driver/mhu_v2_x.c
- create mode 100644 platform/providers/arm/corstone1000/platform.cmake
-
-diff --git a/deployments/se-proxy/opteesp/default_se-proxy.dts.in b/depl=
oyments/se-proxy/opteesp/default_se-proxy.dts.in
-index 5748d2f80f88..267b4f923540 100644
---- a/deployments/se-proxy/opteesp/default_se-proxy.dts.in
-+++ b/deployments/se-proxy/opteesp/default_se-proxy.dts.in
-@@ -17,4 +17,20 @@
- 	xlat-granule =3D <0>; /* 4KiB */
- 	messaging-method =3D <3>; /* Direct messaging only */
- 	legacy-elf-format =3D <1>;
-+
-+	device-regions {
-+		compatible =3D "arm,ffa-manifest-device-regions";
-+		mhu-sender {
-+			/* Armv8 A Foundation Platform values */
-+			base-address =3D <0x00000000 0x1b820000>;
-+			pages-count =3D <16>;
-+			attributes =3D <0x3>; /* read-write */
-+		};
-+		mhu-receiver {
-+			/* Armv8 A Foundation Platform values */
-+			base-address =3D <0x00000000 0x1b830000>;
-+			pages-count =3D <16>;
-+			attributes =3D <0x3>; /* read-write */
-+		};
-+	};
- };
-diff --git a/platform/drivers/arm/mhu_driver/component.cmake b/platform/=
drivers/arm/mhu_driver/component.cmake
-new file mode 100644
-index 000000000000..77a5a50b67d1
---- /dev/null
-+++ b/platform/drivers/arm/mhu_driver/component.cmake
-@@ -0,0 +1,12 @@
-+#----------------------------------------------------------------------=
---------
-+# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved=
.
-+#
-+# SPDX-License-Identifier: BSD-3-Clause
-+#
-+#----------------------------------------------------------------------=
---------
-+
-+# Add source files for using mhu driver
-+target_sources(${TGT}
-+	PRIVATE
-+	"${CMAKE_CURRENT_LIST_DIR}/mhu_v2_x.c"
-+)
-diff --git a/platform/drivers/arm/mhu_driver/mhu_v2.h b/platform/drivers=
/arm/mhu_driver/mhu_v2.h
-new file mode 100644
-index 000000000000..2e4ba80fab95
---- /dev/null
-+++ b/platform/drivers/arm/mhu_driver/mhu_v2.h
-@@ -0,0 +1,391 @@
-+/*
-+ * Copyright (c) 2021 Arm Limited
-+ *
-+ * Licensed under the Apache License, Version 2.0 (the "License");
-+ * you may not use this file except in compliance with the License.
-+ * You may obtain a copy of the License at
-+ *
-+ *     http://www.apache.org/licenses/LICENSE-2.0
-+ *
-+ * Unless required by applicable law or agreed to in writing, software
-+ * distributed under the License is distributed on an "AS IS" BASIS,
-+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or impl=
ied.
-+ * See the License for the specific language governing permissions and
-+ * limitations under the License.
-+ */
-+
-+/**
-+ * \file mhu_v2_x.h
-+ * \brief Driver for Arm MHU v2.0 and v2.1
-+ */
-+
-+#ifndef __MHU_V2_X_H__
-+#define __MHU_V2_X_H__
-+
-+#include <stdint.h>
-+#include <stdbool.h>
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+#define MHU_2_X_INTR_NR2R_OFF             (0x0u)
-+#define MHU_2_X_INTR_R2NR_OFF             (0x1u)
-+#define MHU_2_1_INTR_CHCOMB_OFF           (0x2u)
-+
-+#define MHU_2_X_INTR_NR2R_MASK            (0x1u << MHU_2_X_INTR_NR2R_OF=
F)
-+#define MHU_2_X_INTR_R2NR_MASK            (0x1u << MHU_2_X_INTR_R2NR_OF=
F)
-+#define MHU_2_1_INTR_CHCOMB_MASK          (0x1u << MHU_2_1_INTR_CHCOMB_=
OFF)
-+
-+enum mhu_v2_x_frame_t {
-+    MHU_V2_X_SENDER_FRAME   =3D 0x0u,
-+    MHU_V2_X_RECEIVER_FRAME =3D 0x1u,
-+};
-+
-+enum mhu_v2_x_supported_revisions {
-+     MHU_REV_READ_FROM_HW =3D 0,
-+     MHU_REV_2_0,
-+     MHU_REV_2_1,
-+};
-+
-+struct mhu_v2_x_dev_t {
-+    uint32_t base;
-+    enum mhu_v2_x_frame_t frame;
-+    uint32_t subversion;    /*!< Hardware subversion: v2.X */
-+    bool is_initialized;    /*!< Indicates if the MHU driver
-+                             *   is initialized and enabled
-+                             */
-+};
-+
-+/**
-+ * \brief MHU v2 error enumeration types.
-+ */
-+enum mhu_v2_x_error_t {
-+    MHU_V_2_X_ERR_NONE                =3D  0,
-+    MHU_V_2_X_ERR_NOT_INIT            =3D -1,
-+    MHU_V_2_X_ERR_ALREADY_INIT        =3D -2,
-+    MHU_V_2_X_ERR_UNSUPPORTED_VERSION =3D -3,
-+    MHU_V_2_X_ERR_INVALID_ARG         =3D -4,
-+    MHU_V_2_X_ERR_GENERAL             =3D -5
-+};
-+
-+/**
-+ * \brief Initializes the driver
-+ *
-+ * \param[in] dev   MHU device struct \ref mhu_v2_x_dev_t
-+ * \param[in] rev   MHU revision (if can't be identified from HW)
-+ *
-+ * Reads the MHU hardware version
-+ *
-+ * \return Returns mhu_v2_x_error_t error code
-+ *
-+ * \note MHU revision only has to be specified when versions can't be r=
ead
-+ *       from HW (ARCH_MAJOR_REV reg reads as 0x0).
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ */
-+enum mhu_v2_x_error_t mhu_v2_x_driver_init(struct mhu_v2_x_dev_t *dev,
-+     enum mhu_v2_x_supported_revisions rev);
-+
-+/**
-+ * \brief Returns the number of channels implemented.
-+ *
-+ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
-+ *
-+ * Returns the number of channels implemented.
-+ *
-+ * \return Returns the number of channels implemented.
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ */
-+uint32_t mhu_v2_x_get_num_channel_implemented(
-+         const struct mhu_v2_x_dev_t *dev);
-+
-+/**
-+ * \brief Sends the value over a channel.
-+ *
-+ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
-+ * \param[in] channel     Channel to send the value over.
-+ * \param[in] val         Value to send.
-+ *
-+ * Sends the value over a channel.
-+ *
-+ * \return Returns mhu_v2_x_error_t error code
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ * \note This function doesn't check if channel is implemented.
-+ */
-+enum mhu_v2_x_error_t mhu_v2_x_channel_send(const struct mhu_v2_x_dev_t=
 *dev,
-+     uint32_t channel, uint32_t val);
-+
-+/**
-+ * \brief Clears the channel after the value is send over it.
-+ *
-+ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
-+ * \param[in] channel     Channel to clear.
-+ *
-+ * Clears the channel after the value is send over it.
-+ *
-+ * \return Returns mhu_v2_x_error_t error code
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ * \note This function doesn't check if channel is implemented.
-+ */
-+enum mhu_v2_x_error_t mhu_v2_x_channel_clear(const struct mhu_v2_x_dev_=
t *dev,
-+     uint32_t channel);
-+
-+/**
-+ * \brief Receives the value over a channel.
-+ *
-+ * \param[in]  dev         MHU device struct \ref mhu_v2_x_dev_t
-+ * \param[in]  channel     Channel to receive the value from.
-+ * \param[out] value       Pointer to variable that will store the valu=
e.
-+ *
-+ * Receives the value over a channel.
-+ *
-+ * \return Returns mhu_v2_x_error_t error code
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ * \note This function doesn't check if channel is implemented.
-+ */
-+enum mhu_v2_x_error_t mhu_v2_x_channel_receive(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t channel, uint32_t *valu=
e);
-+
-+/**
-+ * \brief Sets bits in the Channel Mask.
-+ *
-+ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
-+ * \param[in] channel     Which channel's mask to set.
-+ * \param[in] mask        Mask to be set over a receiver frame.
-+ *
-+ * Sets bits in the Channel Mask.
-+ *
-+ * \return Returns mhu_v2_x_error_t error code
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ * \note This function doesn't check if channel is implemented.
-+ */
-+enum mhu_v2_x_error_t mhu_v2_x_channel_mask_set(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t channel, uint32_t mask)=
;
-+
-+/**
-+ * \brief Clears bits in the Channel Mask.
-+ *
-+ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
-+ * \param[in] channel     Which channel's mask to clear.
-+ * \param[in] mask        Mask to be clear over a receiver frame.
-+ *
-+ * Clears bits in the Channel Mask.
-+ *
-+ * \return Returns mhu_v2_x_error_t error code
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ * \note This function doesn't check if channel is implemented.
-+ */
-+enum mhu_v2_x_error_t mhu_v2_x_channel_mask_clear(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t channel, uint32_t mask)=
;
-+
-+/**
-+ * \brief Enables the Channel interrupt.
-+ *
-+ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
-+ * \param[in] channel     Which channel's interrupt to enable.
-+ *
-+ * Enables the Channel clear interrupt.
-+ *
-+ * \return Returns mhu_v2_x_error_t error code
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ * \note This function doesn't check if channel is implemented.
-+ */
-+enum mhu_v2_x_error_t mhu_v2_x_channel_interrupt_enable(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t channel);
-+
-+/**
-+ * \brief Disables the Channel interrupt.
-+ *
-+ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
-+ * \param[in] channel     Which channel's interrupt to disable.
-+ *
-+ * Disables the Channel interrupt.
-+ *
-+ * \return Returns mhu_v2_x_error_t error code
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ * \note This function doesn't check if channel is implemented.
-+ */
-+enum mhu_v2_x_error_t mhu_v2_x_channel_interrupt_disable(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t channel);
-+
-+/**
-+ * \brief Cleares the Channel interrupt.
-+ *
-+ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
-+ * \param[in] channel     Which channel's interrupt to clear.
-+ *
-+ * Cleares the Channel interrupt.
-+ *
-+ * \return Returns mhu_v2_x_error_t error code
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ * \note This function doesn't check if channel is implemented.
-+ */
-+enum mhu_v2_x_error_t mhu_v2_x_channel_interrupt_clear(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t channel);
-+
-+/**
-+ * \brief Initiates a MHU transfer with the handshake signals.
-+ *
-+ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
-+ *
-+ * Initiates a MHU transfer with the handshake signals in a blocking mo=
de.
-+ *
-+ * \return Returns mhu_v2_x_error_t error code
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ */
-+enum mhu_v2_x_error_t mhu_v2_x_initiate_transfer(
-+     const struct mhu_v2_x_dev_t *dev);
-+
-+/**
-+ * \brief Closes a MHU transfer with the handshake signals.
-+ *
-+ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
-+ *
-+ * Closes a MHU transfer with the handshake signals in a blocking mode.
-+ *
-+ * \return Returns mhu_v2_x_error_t error code
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ */
-+enum mhu_v2_x_error_t mhu_v2_x_close_transfer(
-+     const struct mhu_v2_x_dev_t *dev);
-+
-+/**
-+ * \brief Returns the value of access request signal.
-+ *
-+ * \param[in]  dev         MHU device struct \ref mhu_v2_x_dev_t
-+ * \param[out] val         Pointer to variable that will store the valu=
e.
-+ *
-+ * For more information please read the MHU v2 user guide
-+ *
-+ * \return Returns mhu_v2_x_error_t error code
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ */
-+enum mhu_v2_x_error_t mhu_v2_x_get_access_request(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t *val);
-+
-+/**
-+ * \brief Sets the value of access request signal to high.
-+ *
-+ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
-+ *
-+ * For more information please read the MHU v2 user guide
-+ *
-+ * \return Returns mhu_v2_x_error_t error code
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ */
-+enum mhu_v2_x_error_t mhu_v2_x_set_access_request(
-+     const struct mhu_v2_x_dev_t *dev);
-+
-+/**
-+ * \brief Sets the value of access request signal to low.
-+ *
-+ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
-+ *
-+ * For more information please read the MHU v2 user guide
-+ *
-+ * \return Returns mhu_v2_x_error_t error code
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ */
-+enum mhu_v2_x_error_t mhu_v2_x_reset_access_request(
-+     const struct mhu_v2_x_dev_t *dev);
-+
-+/**
-+ * \brief Returns the value of access ready signal.
-+ *
-+ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
-+ * \param[out] val        Pointer to variable that will store the value=
.
-+ *
-+ * For more information please read the MHU v2 user guide
-+ *
-+ * \return Returns mhu_v2_x_error_t error code
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ */
-+enum mhu_v2_x_error_t mhu_v2_x_get_access_ready(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t *val);
-+
-+/**
-+ * \brief Returns the MHU interrupt status.
-+ *
-+ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
-+ *
-+ * \return Interrupt status register value. Masking is needed for indiv=
idual
-+ *         interrupts.
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ */
-+uint32_t mhu_v2_x_get_interrupt_status(const struct mhu_v2_x_dev_t *dev=
);
-+
-+/**
-+ * \brief Enables MHU interrupts.
-+ *
-+ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
-+ * \param[in] mask        Bit mask for enabling/disabling interrupts
-+ *
-+ * \return Returns mhu_v2_x_error_t error code
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ */
-+enum mhu_v2_x_error_t mhu_v2_x_interrupt_enable(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t mask);
-+
-+/**
-+ * \brief Disables MHU interrupts.
-+ *
-+ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
-+ * \param[in] mask        Bit mask for enabling/disabling interrupts
-+ *
-+ * \return Returns mhu_v2_x_error_t error code
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ */
-+enum mhu_v2_x_error_t mhu_v2_x_interrupt_disable(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t mask);
-+
-+/**
-+ * \brief Clears MHU interrupts.
-+ *
-+ * \param[in] dev         MHU device struct \ref mhu_v2_x_dev_t
-+ * \param[in] mask        Bit mask for clearing interrupts
-+ *
-+ * \return Returns mhu_v2_x_error_t error code
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ */
-+enum mhu_v2_x_error_t mhu_v2_x_interrupt_clear(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t mask);
-+
-+/**
-+ * \brief Returns the first channel number whose interrupt bit is high.
-+ *
-+ * \param[in]  dev         MHU device struct \ref mhu_v2_x_dev_t
-+ * \param[out] channel     Pointer to variable that will have the chann=
el value.
-+ *
-+ * \return Returns the first channel number whose interrupt bit is high=
.
-+ * \return Returns mhu_v2_x_error_t error code.
-+ *
-+ * \note This function doesn't check if dev is NULL.
-+ */
-+enum mhu_v2_x_error_t mhu_v2_1_get_ch_interrupt_num(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t *channel);
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* __MHU_V2_X_H__ */
-diff --git a/platform/drivers/arm/mhu_driver/mhu_v2_x.c b/platform/drive=
rs/arm/mhu_driver/mhu_v2_x.c
-new file mode 100644
-index 000000000000..01d8f659a73a
---- /dev/null
-+++ b/platform/drivers/arm/mhu_driver/mhu_v2_x.c
-@@ -0,0 +1,602 @@
-+/*
-+ * Copyright (c) 2021 Arm Limited
-+ *
-+ * Licensed under the Apache License, Version 2.0 (the "License");
-+ * you may not use this file except in compliance with the License.
-+ * You may obtain a copy of the License at
-+ *
-+ *     http://www.apache.org/licenses/LICENSE-2.0
-+ *
-+ * Unless required by applicable law or agreed to in writing, software
-+ * distributed under the License is distributed on an "AS IS" BASIS,
-+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or impl=
ied.
-+ * See the License for the specific language governing permissions and
-+ * limitations under the License.
-+ */
-+#include <stdint.h>
-+#include <stdbool.h>
-+#include "mhu_v2.h"
-+
-+#define _MHU_V2_X_MAX_CHANNELS    124
-+#define _MHU_V2_1_MAX_CHCOMB_INT  4
-+#define ENABLE                    0x1
-+#define DISABLE                   0x0
-+#define CLEAR_INTR                0x1
-+#define CH_PER_CH_COMB            0x20
-+#define SEND_FRAME(p_mhu)       ((struct _mhu_v2_x_send_frame_t *)p_mhu=
)
-+#define RECV_FRAME(p_mhu)       ((struct _mhu_v2_x_recv_frame_t *)p_mhu=
)
-+
-+#define MHU_MAJOR_REV_V2      0x1u
-+#define MHU_MINOR_REV_2_0     0x0u
-+#define MHU_MINOR_REV_2_1     0x1u
-+
-+struct _mhu_v2_x_send_ch_window_t {
-+    /* Offset: 0x00 (R/ ) Channel Status */
-+    volatile uint32_t ch_st;
-+    /* Offset: 0x04 (R/ ) Reserved */
-+    volatile uint32_t reserved_0;
-+    /* Offset: 0x08 (R/ ) Reserved */
-+    volatile uint32_t reserved_1;
-+    /* Offset: 0x0C ( /W) Channel Set */
-+    volatile uint32_t ch_set;
-+    /* Offset: 0x10 (R/ ) Channel Interrupt Status (Reserved in 2.0) */
-+    volatile uint32_t ch_int_st;
-+    /* Offset: 0x14 ( /W) Channel Interrupt Clear  (Reserved in 2.0) */
-+    volatile uint32_t ch_int_clr;
-+    /* Offset: 0x18 (R/W) Channel Interrupt Enable (Reserved in 2.0) */
-+    volatile uint32_t ch_int_en;
-+    /* Offset: 0x1C (R/ ) Reserved */
-+    volatile uint32_t reserved_2;
-+};
-+
-+struct _mhu_v2_x_send_frame_t {
-+    /* Offset: 0x000 ( / ) Sender Channel Window 0 -123 */
-+    struct _mhu_v2_x_send_ch_window_t send_ch_window[_MHU_V2_X_MAX_CHAN=
NELS];
-+    /* Offset: 0xF80 (R/ ) Message Handling Unit Configuration */
-+    volatile uint32_t mhu_cfg;
-+    /* Offset: 0xF84 (R/W) Response Configuration */
-+    volatile uint32_t resp_cfg;
-+    /* Offset: 0xF88 (R/W) Access Request */
-+    volatile uint32_t access_request;
-+    /* Offset: 0xF8C (R/ ) Access Ready */
-+    volatile uint32_t access_ready;
-+    /* Offset: 0xF90 (R/ ) Interrupt Status */
-+    volatile uint32_t int_st;
-+    /* Offset: 0xF94 ( /W) Interrupt Clear */
-+    volatile uint32_t int_clr;
-+    /* Offset: 0xF98 (R/W) Interrupt Enable */
-+    volatile uint32_t int_en;
-+    /* Offset: 0xF9C (R/ ) Reserved */
-+    volatile uint32_t reserved_0;
-+    /* Offset: 0xFA0 (R/W) Channel Combined Interrupt Stat (Reserved in=
 2.0) */
-+    volatile uint32_t ch_comb_int_st[_MHU_V2_1_MAX_CHCOMB_INT];
-+    /* Offset: =E2=80=AD0xFC4=E2=80=AC (R/ ) Reserved */
-+    volatile uint32_t reserved_1[6];
-+    /* Offset: 0xFC8 (R/ ) Implementer Identification Register */
-+    volatile uint32_t iidr;
-+    /* Offset: 0xFCC (R/ ) Architecture Identification Register */
-+    volatile uint32_t aidr;
-+    /* Offset: 0xFD0 (R/ )  */
-+    volatile uint32_t pid_1[4];
-+    /* Offset: 0xFE0 (R/ )  */
-+    volatile uint32_t pid_0[4];
-+    /* Offset: 0xFF0 (R/ )  */
-+    volatile uint32_t cid[4];
-+};
-+
-+struct _mhu_v2_x_rec_ch_window_t {
-+    /* Offset: 0x00 (R/ ) Channel Status */
-+    volatile uint32_t ch_st;
-+    /* Offset: 0x04 (R/ ) Channel Status Masked */
-+    volatile uint32_t ch_st_msk;
-+    /* Offset: 0x08 ( /W) Channel Clear */
-+    volatile uint32_t ch_clr;
-+    /* Offset: 0x0C (R/ ) Reserved */
-+    volatile uint32_t reserved_0;
-+    /* Offset: 0x10 (R/ ) Channel Mask Status */
-+    volatile uint32_t ch_msk_st;
-+    /* Offset: 0x14 ( /W) Channel Mask Set */
-+    volatile uint32_t ch_msk_set;
-+    /* Offset: 0x18 ( /W) Channel Mask Clear */
-+    volatile uint32_t ch_msk_clr;
-+    /* Offset: 0x1C (R/ ) Reserved */
-+    volatile uint32_t reserved_1;
-+};
-+
-+struct _mhu_v2_x_recv_frame_t {
-+    /* Offset: 0x000 ( / ) Receiver Channel Window 0 -123 */
-+    struct _mhu_v2_x_rec_ch_window_t rec_ch_window[_MHU_V2_X_MAX_CHANNE=
LS];
-+    /* Offset: 0xF80 (R/ ) Message Handling Unit Configuration */
-+    volatile uint32_t mhu_cfg;
-+    /* Offset: 0xF84 (R/ ) Reserved */
-+    volatile uint32_t reserved_0[3];
-+    /* Offset: 0xF90 (R/ ) Interrupt Status (Reserved in 2.0) */
-+    volatile uint32_t int_st;
-+    /* Offset: 0xF94 (R/ ) Interrupt Clear  (Reserved in 2.0) */
-+    volatile uint32_t int_clr;
-+    /* Offset: 0xF98 (R/W) Interrupt Enable (Reserved in 2.0) */
-+    volatile uint32_t int_en;
-+    /* Offset: 0xF9C (R/ ) Reserved  */
-+    volatile uint32_t reserved_1;
-+    /* Offset: 0xFA0 (R/ ) Channel Combined Interrupt Stat (Reserved in=
 2.0) */
-+    volatile uint32_t ch_comb_int_st[_MHU_V2_1_MAX_CHCOMB_INT];
-+    /* Offset: 0xFB0 (R/ ) Reserved */
-+    volatile uint32_t reserved_2[6];
-+    /* Offset: 0xFC8 (R/ ) Implementer Identification Register */
-+    volatile uint32_t iidr;
-+    /* Offset: 0xFCC (R/ ) Architecture Identification Register */
-+    volatile uint32_t aidr;
-+    /* Offset: 0xFD0 (R/ )  */
-+    volatile uint32_t pid_1[4];
-+    /* Offset: 0xFE0 (R/ )  */
-+    volatile uint32_t pid_0[4];
-+    /* Offset: 0xFF0 (R/ )  */
-+    volatile uint32_t cid[4];
-+};
-+
-+union _mhu_v2_x_frame_t {
-+    struct _mhu_v2_x_send_frame_t send_frame;
-+    struct _mhu_v2_x_recv_frame_t recv_frame;
-+};
-+
-+enum mhu_v2_x_error_t mhu_v2_x_driver_init(struct mhu_v2_x_dev_t *dev,
-+     enum mhu_v2_x_supported_revisions rev)
-+{
-+    uint32_t AIDR =3D 0;
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if (dev->is_initialized) {
-+        return MHU_V_2_X_ERR_ALREADY_INIT;
-+    }
-+
-+    if (rev =3D=3D MHU_REV_READ_FROM_HW) {
-+        /* Read revision from HW */
-+        if (dev->frame =3D=3D MHU_V2_X_RECEIVER_FRAME) {
-+            AIDR =3D p_mhu->recv_frame.aidr;
-+        } else {
-+            AIDR =3D p_mhu->send_frame.aidr;
-+        }
-+
-+        /* Get bits 7:4 to read major revision */
-+        if ( ((AIDR >> 4) & 0b1111) !=3D MHU_MAJOR_REV_V2) {
-+            /* Unsupported MHU version */
-+            return MHU_V_2_X_ERR_UNSUPPORTED_VERSION;
-+        } /* No need to save major version, driver only supports MHUv2 =
*/
-+
-+        /* Get bits 3:0 to read minor revision */
-+        dev->subversion =3D AIDR & 0b1111;
-+
-+        if (dev->subversion !=3D MHU_MINOR_REV_2_0 &&
-+            dev->subversion !=3D MHU_MINOR_REV_2_1) {
-+            /* Unsupported subversion */
-+            return MHU_V_2_X_ERR_UNSUPPORTED_VERSION;
-+        }
-+    } else {
-+        /* Revisions were provided by caller */
-+        if (rev =3D=3D MHU_REV_2_0) {
-+            dev->subversion =3D MHU_MINOR_REV_2_0;
-+        } else if (rev =3D=3D MHU_REV_2_1) {
-+            dev->subversion =3D MHU_MINOR_REV_2_1;
-+        } else {
-+            /* Unsupported subversion */
-+            return MHU_V_2_X_ERR_UNSUPPORTED_VERSION;
-+        }/* No need to save major version, driver only supports MHUv2 *=
/
-+    }
-+
-+    dev->is_initialized =3D true;
-+
-+    return MHU_V_2_X_ERR_NONE;
-+}
-+
-+uint32_t mhu_v2_x_get_num_channel_implemented(const struct mhu_v2_x_dev=
_t *dev)
-+{
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if ( !(dev->is_initialized) ) {
-+        return MHU_V_2_X_ERR_NOT_INIT;
-+    }
-+
-+    if(dev->frame =3D=3D MHU_V2_X_SENDER_FRAME) {
-+        return (SEND_FRAME(p_mhu))->mhu_cfg;
-+    } else {
-+        return (RECV_FRAME(p_mhu))->mhu_cfg;
-+    }
-+}
-+
-+enum mhu_v2_x_error_t mhu_v2_x_channel_send(const struct mhu_v2_x_dev_t=
 *dev,
-+     uint32_t channel, uint32_t val)
-+{
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if ( !(dev->is_initialized) ) {
-+        return MHU_V_2_X_ERR_NOT_INIT;
-+    }
-+
-+    if(dev->frame =3D=3D MHU_V2_X_SENDER_FRAME) {
-+        (SEND_FRAME(p_mhu))->send_ch_window[channel].ch_set =3D val;
-+        return MHU_V_2_X_ERR_NONE;
-+    } else {
-+        return MHU_V_2_X_ERR_INVALID_ARG;
-+    }
-+}
-+
-+enum mhu_v2_x_error_t mhu_v2_x_channel_clear(const struct mhu_v2_x_dev_=
t *dev,
-+     uint32_t channel)
-+{
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if ( !(dev->is_initialized) ) {
-+        return MHU_V_2_X_ERR_NOT_INIT;
-+    }
-+
-+    if(dev->frame =3D=3D MHU_V2_X_RECEIVER_FRAME) {
-+        (RECV_FRAME(p_mhu))->rec_ch_window[channel].ch_clr =3D UINT32_M=
AX;
-+        return MHU_V_2_X_ERR_NONE;
-+    } else {
-+        return MHU_V_2_X_ERR_INVALID_ARG;
-+    }
-+}
-+
-+enum mhu_v2_x_error_t mhu_v2_x_channel_receive(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t channel, uint32_t *valu=
e)
-+{
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if ( !(dev->is_initialized) ) {
-+        return MHU_V_2_X_ERR_NOT_INIT;
-+    }
-+
-+    if(dev->frame =3D=3D MHU_V2_X_RECEIVER_FRAME) {
-+        *value =3D (RECV_FRAME(p_mhu))->rec_ch_window[channel].ch_st;
-+        return MHU_V_2_X_ERR_NONE;
-+    } else {
-+        return MHU_V_2_X_ERR_INVALID_ARG;
-+    }
-+}
-+
-+enum mhu_v2_x_error_t mhu_v2_x_channel_mask_set(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t channel, uint32_t mask)
-+{
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if ( !(dev->is_initialized) ) {
-+        return MHU_V_2_X_ERR_NOT_INIT;
-+    }
-+
-+    if(dev->frame =3D=3D MHU_V2_X_RECEIVER_FRAME) {
-+        (RECV_FRAME(p_mhu))->rec_ch_window[channel].ch_msk_set =3D mask=
;
-+        return MHU_V_2_X_ERR_NONE;
-+    } else {
-+        return MHU_V_2_X_ERR_INVALID_ARG;
-+    }
-+}
-+
-+enum mhu_v2_x_error_t mhu_v2_x_channel_mask_clear(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t channel, uint32_t mask)
-+{
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if ( !(dev->is_initialized) ) {
-+        return MHU_V_2_X_ERR_NOT_INIT;
-+    }
-+
-+    if(dev->frame =3D=3D MHU_V2_X_RECEIVER_FRAME) {
-+        (RECV_FRAME(p_mhu))->rec_ch_window[channel].ch_msk_clr =3D mask=
;
-+        return MHU_V_2_X_ERR_NONE;
-+    } else {
-+        return MHU_V_2_X_ERR_INVALID_ARG;
-+    }
-+}
-+
-+enum mhu_v2_x_error_t mhu_v2_x_channel_interrupt_enable(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t channel)
-+{
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if ( !(dev->is_initialized) ) {
-+        return MHU_V_2_X_ERR_NOT_INIT;
-+    }
-+
-+    if (dev->subversion =3D=3D MHU_MINOR_REV_2_1) {
-+        return MHU_V_2_X_ERR_UNSUPPORTED_VERSION;
-+    }
-+
-+    if(dev->frame =3D=3D MHU_V2_X_SENDER_FRAME) {
-+        (SEND_FRAME(p_mhu))->send_ch_window[channel].ch_int_en =3D ENAB=
LE;
-+        return MHU_V_2_X_ERR_NONE;
-+    } else {
-+        return MHU_V_2_X_ERR_INVALID_ARG;
-+    }
-+}
-+
-+enum mhu_v2_x_error_t mhu_v2_x_channel_interrupt_disable(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t channel)
-+{
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if ( !(dev->is_initialized) ) {
-+        return MHU_V_2_X_ERR_NOT_INIT;
-+    }
-+
-+    if (dev->subversion =3D=3D MHU_MINOR_REV_2_1) {
-+        return MHU_V_2_X_ERR_UNSUPPORTED_VERSION;
-+    }
-+
-+    if(dev->frame =3D=3D MHU_V2_X_SENDER_FRAME) {
-+        (SEND_FRAME(p_mhu))->send_ch_window[channel].ch_int_en =3D DISA=
BLE;
-+        return MHU_V_2_X_ERR_NONE;
-+    } else {
-+        return MHU_V_2_X_ERR_INVALID_ARG;
-+    }
-+}
-+
-+enum mhu_v2_x_error_t mhu_v2_x_channel_interrupt_clear(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t channel)
-+{
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if ( !(dev->is_initialized) ) {
-+        return MHU_V_2_X_ERR_NOT_INIT;
-+    }
-+
-+    if (dev->subversion =3D=3D MHU_MINOR_REV_2_1) {
-+        return MHU_V_2_X_ERR_UNSUPPORTED_VERSION;
-+    }
-+
-+    if(dev->frame =3D=3D MHU_V2_X_SENDER_FRAME) {
-+        (SEND_FRAME(p_mhu))->send_ch_window[channel].ch_int_clr =3D CLE=
AR_INTR;
-+        return MHU_V_2_X_ERR_NONE;
-+    } else {
-+        return MHU_V_2_X_ERR_INVALID_ARG;
-+    }
-+}
-+
-+enum mhu_v2_x_error_t mhu_v2_x_initiate_transfer(
-+     const struct mhu_v2_x_dev_t *dev)
-+{
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if ( !(dev->is_initialized) ) {
-+        return MHU_V_2_X_ERR_NOT_INIT;
-+    }
-+
-+    if(dev->frame !=3D MHU_V2_X_SENDER_FRAME) {
-+        return MHU_V_2_X_ERR_INVALID_ARG;
-+    }
-+
-+    (SEND_FRAME(p_mhu))->access_request =3D ENABLE;
-+
-+    while ( !((SEND_FRAME(p_mhu))->access_ready) ) {
-+        /* Wait in a loop for access ready signal to be high */
-+        ;
-+    }
-+
-+    return MHU_V_2_X_ERR_NONE;
-+}
-+
-+enum mhu_v2_x_error_t mhu_v2_x_close_transfer(const struct mhu_v2_x_dev=
_t *dev)
-+{
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if ( !(dev->is_initialized) ) {
-+        return MHU_V_2_X_ERR_NOT_INIT;
-+    }
-+
-+    if(dev->frame !=3D MHU_V2_X_SENDER_FRAME) {
-+        return MHU_V_2_X_ERR_INVALID_ARG;
-+    }
-+
-+    (SEND_FRAME(p_mhu))->access_request =3D DISABLE;
-+
-+    return MHU_V_2_X_ERR_NONE;
-+}
-+
-+enum mhu_v2_x_error_t mhu_v2_x_get_access_request(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t *val)
-+{
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if ( !(dev->is_initialized) ) {
-+        return MHU_V_2_X_ERR_NOT_INIT;
-+    }
-+
-+    if(dev->frame !=3D MHU_V2_X_SENDER_FRAME) {
-+        return MHU_V_2_X_ERR_INVALID_ARG;
-+    }
-+
-+    *val =3D (SEND_FRAME(p_mhu))->access_request;
-+
-+    return MHU_V_2_X_ERR_NONE;
-+}
-+
-+enum mhu_v2_x_error_t mhu_v2_x_set_access_request(
-+     const struct mhu_v2_x_dev_t *dev)
-+{
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if ( !(dev->is_initialized) ) {
-+        return MHU_V_2_X_ERR_NOT_INIT;
-+    }
-+
-+    if(dev->frame !=3D MHU_V2_X_SENDER_FRAME) {
-+        return MHU_V_2_X_ERR_INVALID_ARG;
-+    }
-+
-+    (SEND_FRAME(p_mhu))->access_request =3D ENABLE;
-+
-+    return MHU_V_2_X_ERR_NONE;
-+}
-+
-+enum mhu_v2_x_error_t mhu_v2_x_reset_access_request(
-+     const struct mhu_v2_x_dev_t *dev)
-+{
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if ( !(dev->is_initialized) ) {
-+        return MHU_V_2_X_ERR_NOT_INIT;
-+    }
-+
-+    if(dev->frame !=3D MHU_V2_X_SENDER_FRAME) {
-+        return MHU_V_2_X_ERR_INVALID_ARG;
-+    }
-+
-+    (SEND_FRAME(p_mhu))->access_request =3D DISABLE;
-+
-+    return MHU_V_2_X_ERR_NONE;
-+}
-+
-+enum mhu_v2_x_error_t mhu_v2_x_get_access_ready(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t *val)
-+{
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if ( !(dev->is_initialized) ) {
-+        return MHU_V_2_X_ERR_NOT_INIT;
-+    }
-+
-+    if(dev->frame !=3D MHU_V2_X_SENDER_FRAME) {
-+        return MHU_V_2_X_ERR_INVALID_ARG;
-+    }
-+
-+    *val =3D (SEND_FRAME(p_mhu))->access_ready;
-+
-+    return MHU_V_2_X_ERR_NONE;
-+}
-+
-+uint32_t mhu_v2_x_get_interrupt_status(const struct mhu_v2_x_dev_t *dev=
)
-+{
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if ( !(dev->is_initialized) ) {
-+        return MHU_V_2_X_ERR_NOT_INIT;
-+    }
-+
-+    if(dev->frame =3D=3D MHU_V2_X_SENDER_FRAME) {
-+        return (SEND_FRAME(p_mhu))->int_st;
-+    } else {
-+        return (RECV_FRAME(p_mhu))->int_st;
-+    }
-+}
-+
-+enum mhu_v2_x_error_t mhu_v2_x_interrupt_enable(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t mask)
-+{
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if ( !(dev->is_initialized) ) {
-+        return MHU_V_2_X_ERR_NOT_INIT;
-+    }
-+
-+    if (dev->subversion =3D=3D MHU_MINOR_REV_2_0) {
-+        if (mask & MHU_2_1_INTR_CHCOMB_MASK) {
-+            /* Combined channel IRQ is not present in v2.0 */
-+            return MHU_V_2_X_ERR_INVALID_ARG;
-+        }
-+
-+        if (dev->frame =3D=3D MHU_V2_X_RECEIVER_FRAME) {
-+            /* Only sender frame has these registers */
-+            return MHU_V_2_X_ERR_UNSUPPORTED_VERSION;
-+        }
-+    }
-+
-+    if(dev->frame =3D=3D MHU_V2_X_SENDER_FRAME) {
-+        (SEND_FRAME(p_mhu))->int_en |=3D mask;
-+    } else {
-+        (RECV_FRAME(p_mhu))->int_en |=3D mask;
-+    }
-+
-+    return MHU_V_2_X_ERR_NONE;
-+}
-+
-+enum mhu_v2_x_error_t mhu_v2_x_interrupt_disable(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t mask)
-+{
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if ( !(dev->is_initialized) ) {
-+        return MHU_V_2_X_ERR_NOT_INIT;
-+    }
-+
-+    if (dev->subversion =3D=3D MHU_MINOR_REV_2_0) {
-+        if (mask & MHU_2_1_INTR_CHCOMB_MASK) {
-+            /* Combined channel IRQ is not present in v2.0 */
-+            return MHU_V_2_X_ERR_INVALID_ARG;
-+        }
-+
-+        if (dev->frame =3D=3D MHU_V2_X_RECEIVER_FRAME) {
-+            /* Only sender frame has these registers */
-+            return MHU_V_2_X_ERR_UNSUPPORTED_VERSION;
-+        }
-+    }
-+
-+    if(dev->frame =3D=3D MHU_V2_X_SENDER_FRAME) {
-+        (SEND_FRAME(p_mhu))->int_en &=3D ~mask;
-+    } else {
-+        (RECV_FRAME(p_mhu))->int_en &=3D ~mask;
-+    }
-+
-+    return MHU_V_2_X_ERR_NONE;
-+}
-+
-+enum mhu_v2_x_error_t mhu_v2_x_interrupt_clear(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t mask)
-+{
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if ( !(dev->is_initialized) ) {
-+        return MHU_V_2_X_ERR_NOT_INIT;
-+    }
-+
-+    if (dev->subversion =3D=3D MHU_MINOR_REV_2_0) {
-+        if (mask & MHU_2_1_INTR_CHCOMB_MASK) {
-+            /* Combined channel IRQ is not present in v2.0 */
-+            return MHU_V_2_X_ERR_INVALID_ARG;
-+        }
-+
-+        if (dev->frame =3D=3D MHU_V2_X_RECEIVER_FRAME) {
-+            /* Only sender frame has these registers */
-+            return MHU_V_2_X_ERR_UNSUPPORTED_VERSION;
-+        }
-+    }
-+
-+    if(dev->frame =3D=3D MHU_V2_X_SENDER_FRAME) {
-+        (SEND_FRAME(p_mhu))->int_clr =3D mask;
-+    } else {
-+        (RECV_FRAME(p_mhu))->int_clr =3D mask;
-+    }
-+
-+    return MHU_V_2_X_ERR_NONE;
-+}
-+
-+enum mhu_v2_x_error_t mhu_v2_1_get_ch_interrupt_num(
-+     const struct mhu_v2_x_dev_t *dev, uint32_t *channel)
-+{
-+    uint32_t i, j, status;
-+    union _mhu_v2_x_frame_t *p_mhu =3D (union _mhu_v2_x_frame_t *)dev->=
base;
-+
-+    if ( !(dev->is_initialized) ) {
-+        return MHU_V_2_X_ERR_NOT_INIT;
-+    }
-+
-+    if (dev->subversion !=3D MHU_MINOR_REV_2_1) {
-+        /* Feature is only supported in MHU v2.1 */
-+        return MHU_V_2_X_ERR_UNSUPPORTED_VERSION;
-+    }
-+
-+    for(i =3D 0; i < _MHU_V2_1_MAX_CHCOMB_INT; i++) {
-+        if(dev->frame =3D=3D MHU_V2_X_SENDER_FRAME) {
-+            status =3D (SEND_FRAME(p_mhu))->ch_comb_int_st[i];
-+        } else {
-+            status =3D (RECV_FRAME(p_mhu))->ch_comb_int_st[i];
-+        }
-+
-+        for(j =3D 0; j < CH_PER_CH_COMB; j++) {
-+            if ((status >> CH_PER_CH_COMB - j - 1) & (ENABLE)) {
-+                *channel =3D (CH_PER_CH_COMB - j -1 + (i * CH_PER_CH_CO=
MB));
-+                return MHU_V_2_X_ERR_NONE;
-+            }
-+        }
-+    }
-+
-+    return MHU_V_2_X_ERR_GENERAL;
-+}
-diff --git a/platform/providers/arm/corstone1000/platform.cmake b/platfo=
rm/providers/arm/corstone1000/platform.cmake
-new file mode 100644
-index 000000000000..bb778bb9719b
---- /dev/null
-+++ b/platform/providers/arm/corstone1000/platform.cmake
-@@ -0,0 +1,10 @@
-+#----------------------------------------------------------------------=
---------
-+# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved=
.
-+#
-+# SPDX-License-Identifier: BSD-3-Clause
-+#
-+# Platform definition for the 'fvp_base_revc-2xaem8a' virtual platform.
-+#----------------------------------------------------------------------=
---------
-+
-+# include MHU driver
-+include(${TS_ROOT}/platform/drivers/arm/mhu_driver/component.cmake)
---=20
-2.38.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0003-Add-openamp-rpc-caller.patch b/meta-arm-bsp/recipes-security/trusted=
-services/corstone1000/0003-Add-openamp-rpc-caller.patch
deleted file mode 100644
index 5686face..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0003-Ad=
d-openamp-rpc-caller.patch
+++ /dev/null
@@ -1,1196 +0,0 @@
-From 55394c4c9681af71b1ed7f7ebc7c44b2e1737113 Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Fri, 3 Dec 2021 19:00:54 +0000
-Subject: [PATCH 03/20] Add openamp rpc caller
-
-Upstream-Status: Pending
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- components/rpc/common/caller/rpc_caller.c     |  10 +
- components/rpc/common/interface/rpc_caller.h  |   8 +
- .../rpc/openamp/caller/sp/component.cmake     |  15 +
- .../rpc/openamp/caller/sp/openamp_caller.c    | 203 +++++++
- .../rpc/openamp/caller/sp/openamp_caller.h    |  43 ++
- .../rpc/openamp/caller/sp/openamp_mhu.c       | 191 ++++++
- .../rpc/openamp/caller/sp/openamp_mhu.h       |  19 +
- .../rpc/openamp/caller/sp/openamp_virtio.c    | 555 ++++++++++++++++++
- .../rpc/openamp/caller/sp/openamp_virtio.h    |  24 +
- .../se-proxy/opteesp/default_se-proxy.dts.in  |   6 +
- deployments/se-proxy/se-proxy.cmake           |   1 +
- 11 files changed, 1075 insertions(+)
- create mode 100644 components/rpc/openamp/caller/sp/component.cmake
- create mode 100644 components/rpc/openamp/caller/sp/openamp_caller.c
- create mode 100644 components/rpc/openamp/caller/sp/openamp_caller.h
- create mode 100644 components/rpc/openamp/caller/sp/openamp_mhu.c
- create mode 100644 components/rpc/openamp/caller/sp/openamp_mhu.h
- create mode 100644 components/rpc/openamp/caller/sp/openamp_virtio.c
- create mode 100644 components/rpc/openamp/caller/sp/openamp_virtio.h
-
-diff --git a/components/rpc/common/caller/rpc_caller.c b/components/rpc/=
common/caller/rpc_caller.c
-index 2dceabeb8967..20d889c162b0 100644
---- a/components/rpc/common/caller/rpc_caller.c
-+++ b/components/rpc/common/caller/rpc_caller.c
-@@ -37,3 +37,13 @@ void rpc_caller_end(struct rpc_caller *s, rpc_call_ha=
ndle handle)
- {
- 	s->call_end(s->context, handle);
- }
-+
-+void *rpc_caller_virt_to_phys(struct rpc_caller *s, void *va)
-+{
-+	return s->virt_to_phys(s->context, va);
-+}
-+
-+void *rpc_caller_phys_to_virt(struct rpc_caller *s, void *pa)
-+{
-+	return s->phys_to_virt(s->context, pa);
-+}
-diff --git a/components/rpc/common/interface/rpc_caller.h b/components/r=
pc/common/interface/rpc_caller.h
-index 387489cdb1b2..ef9bb64905ed 100644
---- a/components/rpc/common/interface/rpc_caller.h
-+++ b/components/rpc/common/interface/rpc_caller.h
-@@ -45,6 +45,10 @@ struct rpc_caller
- 		     	rpc_opstatus_t *opstatus, uint8_t **resp_buf, size_t *resp_len)=
;
-=20
- 	void (*call_end)(void *context, rpc_call_handle handle);
-+
-+	void *(*virt_to_phys)(void *context, void *va);
-+
-+	void *(*phys_to_virt)(void *context, void *pa);
- };
-=20
- /*
-@@ -87,6 +91,10 @@ RPC_CALLER_EXPORTED rpc_status_t rpc_caller_invoke(st=
ruct rpc_caller *s, rpc_cal
-  */
- RPC_CALLER_EXPORTED void rpc_caller_end(struct rpc_caller *s, rpc_call_=
handle handle);
-=20
-+RPC_CALLER_EXPORTED void *rpc_caller_virt_to_phys(struct rpc_caller *s,=
 void *va);
-+
-+RPC_CALLER_EXPORTED void *rpc_caller_phys_to_virt(struct rpc_caller *s,=
 void *pa);
-+
- #ifdef __cplusplus
- }
- #endif
-diff --git a/components/rpc/openamp/caller/sp/component.cmake b/componen=
ts/rpc/openamp/caller/sp/component.cmake
-new file mode 100644
-index 000000000000..fc919529d731
---- /dev/null
-+++ b/components/rpc/openamp/caller/sp/component.cmake
-@@ -0,0 +1,15 @@
-+#----------------------------------------------------------------------=
---------
-+# Copyright (c) 2020, Arm Limited and Contributors. All rights reserved=
.
-+#
-+# SPDX-License-Identifier: BSD-3-Clause
-+#
-+#----------------------------------------------------------------------=
---------
-+if (NOT DEFINED TGT)
-+	message(FATAL_ERROR "mandatory parameter TGT is not defined.")
-+endif()
-+
-+target_sources(${TGT} PRIVATE
-+	"${CMAKE_CURRENT_LIST_DIR}/openamp_caller.c"
-+	"${CMAKE_CURRENT_LIST_DIR}/openamp_virtio.c"
-+	"${CMAKE_CURRENT_LIST_DIR}/openamp_mhu.c"
-+	)
-diff --git a/components/rpc/openamp/caller/sp/openamp_caller.c b/compone=
nts/rpc/openamp/caller/sp/openamp_caller.c
-new file mode 100644
-index 000000000000..6cdfb756568f
---- /dev/null
-+++ b/components/rpc/openamp/caller/sp/openamp_caller.c
-@@ -0,0 +1,203 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ * Copyright (c) 2021, Linaro Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#include <stddef.h>
-+#include <trace.h>
-+#include "openamp_caller.h"
-+#include "openamp_mhu.h"
-+#include "openamp_virtio.h"
-+#include <protocols/rpc/common/packed-c/status.h>
-+
-+#define OPENAMP_TRANSACTION_IDLE	0x0
-+#define OPENAMP_TRANSACTION_INPROGRESS	0x1
-+#define OPENAMP_TRANSACTION_INVOKED	0x2
-+
-+static rpc_call_handle openamp_call_begin(void *context, uint8_t **req_=
buf,
-+					  size_t req_len)
-+{
-+	struct openamp_caller *openamp =3D context;
-+	const struct openamp_platform_ops *ops =3D openamp->platform_ops;
-+	rpc_call_handle handle;
-+	int ret;
-+
-+	if (!req_buf) {
-+		EMSG("openamp: call_begin: not req_buf");
-+		return NULL;
-+	}
-+
-+	if (req_len > UINT32_MAX || req_len =3D=3D 0) {
-+		EMSG("openamp: call_begin: resp_len invalid: %lu", req_len);
-+		return NULL;
-+	}
-+
-+	if (openamp->status !=3D OPENAMP_TRANSACTION_IDLE) {
-+		EMSG("openamp: call_begin: transaction not idle");
-+		return NULL;
-+	}
-+
-+	ret =3D ops->platform_call_begin(openamp, req_buf, req_len);
-+	if (ret < 0) {
-+		EMSG("openamp: call_begin: platform begin failed: %d", ret);
-+		return NULL;
-+	}
-+
-+	openamp->status =3D OPENAMP_TRANSACTION_INPROGRESS;
-+	handle =3D openamp;
-+
-+	return handle;
-+}
-+
-+static rpc_status_t openamp_call_invoke(void *context, rpc_call_handle =
handle,
-+					uint32_t opcode, int *opstatus,
-+					uint8_t **resp_buf, size_t *resp_len)
-+{
-+	struct openamp_caller *openamp =3D context;
-+	const struct openamp_platform_ops *ops =3D openamp->platform_ops;
-+	rpc_status_t status;
-+	int ret;
-+
-+	(void)opcode;
-+
-+	if ((handle !=3D openamp) || !opstatus || !resp_buf || !resp_len) {
-+		EMSG("openamp: call_invoke: invalid arguments");
-+		return TS_RPC_ERROR_INVALID_PARAMETER;
-+	}
-+
-+	if (openamp->status !=3D OPENAMP_TRANSACTION_INPROGRESS) {
-+		EMSG("openamp: call_invoke: transaction needed to be started");
-+		return TS_RPC_ERROR_NOT_READY;
-+	}
-+
-+	ret =3D ops->platform_call_invoke(openamp, opstatus, resp_buf, resp_le=
n);
-+	if (ret < 0)
-+		return TS_RPC_ERROR_INTERNAL;
-+
-+	openamp->status =3D OPENAMP_TRANSACTION_INVOKED;
-+	*opstatus =3D 0;
-+
-+	return TS_RPC_CALL_ACCEPTED;
-+}
-+
-+static void openamp_call_end(void *context, rpc_call_handle handle)
-+{
-+	struct openamp_caller *openamp =3D context;
-+	const struct openamp_platform_ops *ops =3D openamp->platform_ops;
-+
-+	if (handle !=3D openamp) {
-+		EMSG("openamp: call_end: invalid arguments");
-+		return;
-+	}
-+
-+	if (openamp->status =3D=3D OPENAMP_TRANSACTION_IDLE) {
-+		EMSG("openamp: call_end: transaction idle");
-+		return;
-+	}
-+
-+	ops->platform_call_end(openamp);
-+
-+	openamp->status =3D OPENAMP_TRANSACTION_IDLE;
-+}
-+
-+static void *openamp_virt_to_phys(void *context, void *va)
-+{
-+	struct openamp_caller *openamp =3D context;
-+	const struct openamp_platform_ops *ops =3D openamp->platform_ops;
-+
-+	return ops->platform_virt_to_phys(openamp, va);
-+}
-+
-+static void *openamp_phys_to_virt(void *context, void *pa)
-+{
-+	struct openamp_caller *openamp =3D context;
-+	const struct openamp_platform_ops *ops =3D openamp->platform_ops;
-+
-+	return ops->platform_phys_to_virt(openamp, pa);
-+}
-+
-+static int openamp_init(struct openamp_caller *openamp)
-+{
-+	const struct openamp_platform_ops *ops =3D openamp->platform_ops;
-+	int ret;
-+
-+	ret =3D ops->transport_init(openamp);
-+	if (ret < 0)
-+		return ret;
-+
-+	ret =3D ops->platform_init(openamp);
-+	if (ret < 0)
-+		goto denit_transport;
-+
-+	return 0;
-+
-+denit_transport:
-+	ops->transport_deinit(openamp);
-+
-+	return ret;
-+}
-+
-+static const struct openamp_platform_ops openamp_virtio_ops =3D {
-+	.transport_init =3D openamp_mhu_init,
-+	.transport_deinit =3D openamp_mhu_deinit,
-+	.transport_notify =3D openamp_mhu_notify_peer,
-+	.transport_receive =3D openamp_mhu_receive,
-+	.platform_init =3D openamp_virtio_init,
-+	.platform_call_begin =3D openamp_virtio_call_begin,
-+	.platform_call_invoke =3D openamp_virtio_call_invoke,
-+	.platform_call_end =3D openamp_virtio_call_end,
-+	.platform_virt_to_phys =3D openamp_virtio_virt_to_phys,
-+	.platform_phys_to_virt =3D openamp_virtio_phys_to_virt,
-+};
-+
-+struct rpc_caller *openamp_caller_init(struct openamp_caller *openamp)
-+{
-+	struct rpc_caller *rpc =3D &openamp->rpc_caller;
-+	int ret;
-+
-+	if (openamp->ref_count)
-+		return rpc;
-+
-+	rpc_caller_init(rpc, openamp);
-+
-+	rpc->call_begin =3D openamp_call_begin;
-+	rpc->call_invoke =3D openamp_call_invoke;
-+	rpc->call_end =3D openamp_call_end;
-+	rpc->virt_to_phys =3D openamp_virt_to_phys;
-+	rpc->phys_to_virt =3D openamp_phys_to_virt;
-+	openamp->platform_ops =3D &openamp_virtio_ops;
-+
-+	ret =3D openamp_init(openamp);
-+	if (ret < 0) {
-+		EMSG("openamp_init: failed to start: %d", ret);
-+		return rpc;
-+	}
-+	openamp->ref_count++;
-+
-+	return rpc;
-+}
-+
-+void openamp_caller_deinit(struct openamp_caller *openamp)
-+{
-+	struct rpc_caller *rpc =3D &openamp->rpc_caller;
-+
-+	if (--openamp->ref_count)
-+		return;
-+
-+	rpc->context =3D NULL;
-+	rpc->call_begin =3D NULL;
-+	rpc->call_invoke =3D NULL;
-+	rpc->call_end =3D NULL;
-+}
-+
-+int openamp_caller_discover(struct openamp_caller *openamp)
-+{
-+	return openamp_init(openamp);
-+}
-+
-+int openamp_caller_open(struct openamp_caller *openamp)
-+{
-+
-+}
-diff --git a/components/rpc/openamp/caller/sp/openamp_caller.h b/compone=
nts/rpc/openamp/caller/sp/openamp_caller.h
-new file mode 100644
-index 000000000000..3fb67c56cc53
---- /dev/null
-+++ b/components/rpc/openamp/caller/sp/openamp_caller.h
-@@ -0,0 +1,43 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ * Copyright (c) 2021, Linaro Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+#ifndef OPENAMP_CALLER_H
-+#define OPENAMP_CALLER_H
-+
-+#include <stddef.h>
-+#include <rpc_caller.h>
-+
-+struct openamp_caller {
-+	struct rpc_caller rpc_caller;
-+	const struct openamp_platform_ops *platform_ops;
-+	uint32_t ref_count;
-+	uint8_t status;
-+
-+	void *transport;
-+	void *platform;
-+};
-+
-+struct openamp_platform_ops {
-+	int (*transport_init)(struct openamp_caller *openamp);
-+	int (*transport_deinit)(struct openamp_caller *openamp);
-+	int (*transport_notify)(struct openamp_caller *openamp);
-+	int (*transport_receive)(struct openamp_caller *openamp);
-+	int (*platform_init)(struct openamp_caller *openamp);
-+	int (*platform_deinit)(struct openamp_caller *openamp);
-+	int (*platform_call_begin)(struct openamp_caller *openamp,
-+				   uint8_t **req_buf, size_t req_len);
-+	int (*platform_call_invoke)(struct openamp_caller *openamp,
-+				    int *opstatus, uint8_t **resp_buf,
-+				    size_t *resp_len);
-+	int (*platform_call_end)(struct openamp_caller *openamp);
-+	void *(*platform_virt_to_phys)(struct openamp_caller *openamp, void *v=
a);
-+	void *(*platform_phys_to_virt)(struct openamp_caller *openamp, void *p=
a);
-+};
-+
-+struct rpc_caller *openamp_caller_init(struct openamp_caller *openamp);
-+void openamp_caller_deinit(struct openamp_caller *openamp);
-+
-+#endif
-diff --git a/components/rpc/openamp/caller/sp/openamp_mhu.c b/components=
/rpc/openamp/caller/sp/openamp_mhu.c
-new file mode 100644
-index 000000000000..ffdadaf870a3
---- /dev/null
-+++ b/components/rpc/openamp/caller/sp/openamp_mhu.c
-@@ -0,0 +1,191 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ * Copyright (c) 2021, Linaro Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#include <config/interface/config_store.h>
-+#include <config/interface/config_blob.h>
-+#include <platform/interface/device_region.h>
-+#include <platform/drivers/arm/mhu_driver/mhu_v2.h>
-+#include <trace.h>
-+#include <errno.h>
-+#include <stdlib.h>
-+#include <stdint.h>
-+#include <stddef.h>
-+#include <limits.h>
-+
-+#include "openamp_caller.h"
-+
-+#define MHU_V_2_NOTIFY_CHANNEL	0
-+#define MHU_V_2_NOTIFY_VALUE	0xff
-+
-+struct openamp_mhu {
-+	struct device_region rx_region;
-+	struct device_region tx_region;
-+	struct mhu_v2_x_dev_t rx_dev;
-+	struct mhu_v2_x_dev_t tx_dev;
-+};
-+
-+static int openamp_mhu_device_get(const char *dev,
-+				  struct device_region *dev_region)
-+{
-+	bool found;
-+
-+	found =3D config_store_query(CONFIG_CLASSIFIER_DEVICE_REGION, dev, 0,
-+				   dev_region, sizeof(*dev_region));
-+	if (!found)
-+		return -EINVAL;
-+
-+	if (!dev_region->base_addr)
-+		return -EINVAL;
-+
-+	IMSG("mhu: device region found: %s addr: 0x%x size: %d", dev,
-+	     dev_region->base_addr, dev_region->io_region_size);
-+
-+	return 0;
-+}
-+
-+int openamp_mhu_receive(struct openamp_caller *openamp)
-+{
-+	struct mhu_v2_x_dev_t *rx_dev;
-+	enum mhu_v2_x_error_t ret;
-+	struct openamp_mhu *mhu;
-+	uint32_t channel =3D 0;
-+	uint32_t irq_status;
-+
-+	if (!openamp->transport) {
-+		EMSG("openamp: mhu: receive transport not initialized");
-+		return -EINVAL;
-+	}
-+
-+	mhu =3D openamp->transport;
-+	rx_dev =3D &mhu->rx_dev;
-+
-+	irq_status =3D 0;
-+
-+	do {
-+		irq_status =3D mhu_v2_x_get_interrupt_status(rx_dev);
-+	} while(!irq_status);
-+
-+	ret =3D mhu_v2_1_get_ch_interrupt_num(rx_dev, &channel);
-+
-+	ret =3D mhu_v2_x_channel_clear(rx_dev, channel);
-+	if (ret !=3D MHU_V_2_X_ERR_NONE) {
-+		EMSG("openamp: mhu: failed to clear channel: %d", channel);
-+		return -EPROTO;
-+	}
-+
-+	return 0;
-+}
-+
-+int openamp_mhu_notify_peer(struct openamp_caller *openamp)
-+{
-+	struct mhu_v2_x_dev_t *tx_dev;
-+	enum mhu_v2_x_error_t ret;
-+	struct openamp_mhu *mhu;
-+	uint32_t access_ready;
-+
-+	if (!openamp->transport) {
-+		EMSG("openamp: mhu: notify transport not initialized");
-+		return -EINVAL;
-+	}
-+
-+	mhu =3D openamp->transport;
-+	tx_dev =3D &mhu->tx_dev;
-+
-+	ret =3D mhu_v2_x_set_access_request(tx_dev);
-+	if (ret !=3D MHU_V_2_X_ERR_NONE) {
-+		EMSG("openamp: mhu: set access request failed");
-+		return -EPROTO;
-+	}
-+
-+	do {
-+		ret =3D mhu_v2_x_get_access_ready(tx_dev, &access_ready);
-+		if (ret !=3D MHU_V_2_X_ERR_NONE) {
-+			EMSG("openamp: mhu: failed to get access_ready");
-+			return -EPROTO;
-+		}
-+	} while (!access_ready);
-+
-+	ret =3D mhu_v2_x_channel_send(tx_dev, MHU_V_2_NOTIFY_CHANNEL,
-+				    MHU_V_2_NOTIFY_VALUE);
-+	if (ret !=3D MHU_V_2_X_ERR_NONE) {
-+		EMSG("openamp: mhu: failed send over channel");
-+		return -EPROTO;
-+	}
-+
-+	ret =3D mhu_v2_x_reset_access_request(tx_dev);
-+	if (ret !=3D MHU_V_2_X_ERR_NONE) {
-+		EMSG("openamp: mhu: failed reset access request");
-+		return -EPROTO;
-+	}
-+
-+	return 0;
-+}
-+
-+int openamp_mhu_init(struct openamp_caller *openamp)
-+{
-+	struct mhu_v2_x_dev_t *rx_dev;
-+	struct mhu_v2_x_dev_t *tx_dev;
-+	struct openamp_mhu *mhu;
-+	int ret;
-+
-+	/* if we already have initialized skip this */
-+	if (openamp->transport)
-+		return 0;
-+
-+	mhu =3D malloc(sizeof(*mhu));
-+	if (!mhu)
-+		return -1;
-+
-+	ret =3D openamp_mhu_device_get("mhu-sender", &mhu->tx_region);
-+	if (ret < 0)
-+		goto free_mhu;
-+
-+	ret =3D openamp_mhu_device_get("mhu-receiver", &mhu->rx_region);
-+	if (ret < 0)
-+		goto free_mhu;
-+
-+	rx_dev =3D &mhu->rx_dev;
-+	tx_dev =3D &mhu->tx_dev;
-+
-+	rx_dev->base =3D  (unsigned int)mhu->rx_region.base_addr;
-+	rx_dev->frame =3D MHU_V2_X_RECEIVER_FRAME;
-+
-+	tx_dev->base =3D  (unsigned int)mhu->tx_region.base_addr;
-+	tx_dev->frame =3D MHU_V2_X_SENDER_FRAME;
-+
-+	ret =3D mhu_v2_x_driver_init(rx_dev, MHU_REV_READ_FROM_HW);
-+	if (ret < 0)
-+		goto free_mhu;
-+
-+	ret =3D mhu_v2_x_driver_init(tx_dev, MHU_REV_READ_FROM_HW);
-+	if (ret < 0)
-+		goto free_mhu;
-+
-+	openamp->transport =3D (void *)mhu;
-+
-+	return 0;
-+
-+free_mhu:
-+	free(mhu);
-+
-+	return ret;
-+}
-+
-+int openamp_mhu_deinit(struct openamp_caller *openamp)
-+{
-+	struct openamp_mhu *mhu;
-+
-+	if (!openamp->transport)
-+		return 0;
-+
-+	mhu =3D openamp->transport;
-+	free(mhu);
-+
-+	openamp->transport =3D NULL;
-+
-+	return 0;
-+}
-diff --git a/components/rpc/openamp/caller/sp/openamp_mhu.h b/components=
/rpc/openamp/caller/sp/openamp_mhu.h
-new file mode 100644
-index 000000000000..2ae5cb8ee1c6
---- /dev/null
-+++ b/components/rpc/openamp/caller/sp/openamp_mhu.h
-@@ -0,0 +1,19 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ * Copyright (c) 2021, Linaro Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+#ifndef OPENAMP_MHU_H
-+#define OPENAMP_MHU_H
-+
-+#include <stddef.h>
-+#include "openamp_caller.h"
-+
-+int openamp_mhu_init(struct openamp_caller *openamp);
-+int openamp_mhu_deinit(struct openamp_caller *openamp);
-+
-+int openamp_mhu_notify_peer(struct openamp_caller *openamp);
-+int openamp_mhu_receive(struct openamp_caller *openamp);
-+
-+#endif
-diff --git a/components/rpc/openamp/caller/sp/openamp_virtio.c b/compone=
nts/rpc/openamp/caller/sp/openamp_virtio.c
-new file mode 100644
-index 000000000000..b7c1aa929111
---- /dev/null
-+++ b/components/rpc/openamp/caller/sp/openamp_virtio.c
-@@ -0,0 +1,555 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ * Copyright (c) 2021, Linaro Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#include <metal/device.h>
-+#include <metal/spinlock.h>
-+#include <openamp/open_amp.h>
-+#include <platform/interface/device_region.h>
-+#include <config/interface/config_store.h>
-+
-+#include <stddef.h>
-+#include <trace.h>
-+#include "openamp_caller.h"
-+
-+#define OPENAMP_SHEM_DEVICE_NAME "openamp-virtio"
-+#define OPENAMP_RPMSG_ENDPOINT_NAME OPENAMP_SHEM_DEVICE_NAME
-+#define OPENAMP_RPMSG_ENDPOINT_ADDR 1024
-+
-+#define OPENAMP_SHEM_PHYS 0x88000000
-+#define OPENAMP_SHEM_PHYS_PAGES 1
-+#define OPENAMP_SHEM_SE_PHYS 0xa8000000
-+
-+#define OPENAMP_SHEM_VDEV_SIZE (4 * 1024)
-+#define OPENAMP_SHEM_VRING_SIZE (4 * 1024)
-+
-+#define OPENAMP_BUFFER_NO_WAIT  0
-+#define OPENAMP_BUFFER_WAIT     1
-+
-+#define VIRTQUEUE_NR            2
-+#define VQ_TX                   0
-+#define VQ_RX                   1
-+
-+#define VRING_DESCRIPTORS       16
-+#define VRING_ALIGN             4
-+
-+#define container_of(ptr, type, member) \
-+	((type *)((char *)(ptr) - (unsigned long)(&((type *)0)->member)))
-+
-+struct openamp_virtio_shm {
-+	uintptr_t base_addr;
-+	size_t size;
-+	uintptr_t vdev_status;
-+	size_t vdev_status_size;
-+	uintptr_t payload_addr;
-+	size_t payload_size;
-+	uintptr_t vring_tx;
-+	size_t vring_tx_size;
-+	uintptr_t vring_rx;
-+	size_t vring_rx_size;
-+
-+	metal_phys_addr_t shm_physmap[OPENAMP_SHEM_PHYS_PAGES];
-+};
-+
-+struct openamp_virtio_metal {
-+	struct metal_spinlock lock;
-+	struct metal_device shm_dev;
-+	struct metal_device *io_dev;
-+
-+	struct metal_io_region *io;
-+	struct openamp_virtio_shm shm;
-+};
-+
-+struct openamp_virtio_device {
-+	struct virtio_device virtio_dev;
-+	struct virtqueue *vq[VIRTQUEUE_NR];
-+	struct virtio_vring_info rvrings[VIRTQUEUE_NR];
-+};
-+
-+struct openamp_virtio_rpmsg {
-+	struct rpmsg_virtio_device rpmsg_vdev;
-+	struct rpmsg_endpoint ep;
-+	uint8_t *req_buf;
-+	uint32_t req_len;
-+	uint8_t *resp_buf;
-+	size_t resp_len;
-+};
-+
-+struct openamp_virtio {
-+	struct openamp_caller *openamp;
-+	struct openamp_virtio_rpmsg rpmsg;
-+	struct openamp_virtio_device vdev;
-+	struct openamp_virtio_metal metal;
-+};
-+
-+static struct openamp_virtio *openamp_virtio_from_dev(struct virtio_dev=
ice *vdev)
-+{
-+	struct openamp_virtio_device *openamp_vdev;
-+
-+	openamp_vdev =3D container_of(vdev, struct openamp_virtio_device,
-+			    virtio_dev);
-+
-+	return container_of(openamp_vdev, struct openamp_virtio, vdev);
-+}
-+
-+static struct openamp_virtio_rpmsg *openamp_virtio_rpmsg_from_dev(struc=
t rpmsg_device *rdev)
-+{
-+	struct rpmsg_virtio_device *rvdev;
-+
-+	rvdev =3D container_of(rdev, struct rpmsg_virtio_device, rdev);
-+
-+	return container_of(rvdev, struct openamp_virtio_rpmsg, rpmsg_vdev);
-+
-+}
-+
-+static void openamp_virtio_metal_device_setup(struct metal_device *shm_=
dev,
-+					      struct openamp_virtio_shm *shm)
-+{
-+	struct metal_io_region *shm_region;
-+
-+	shm_region =3D &shm_dev->regions[0];
-+
-+	shm_dev->name =3D OPENAMP_SHEM_DEVICE_NAME;
-+	shm_dev->num_regions =3D 1;
-+
-+	shm_region->virt =3D (void *)shm->payload_addr;
-+	shm_region->size =3D shm->payload_size;
-+
-+	shm_region->physmap =3D &shm->shm_physmap;
-+	shm_region->page_shift =3D (metal_phys_addr_t)(-1);
-+	shm_region->page_mask =3D (metal_phys_addr_t)(-1);
-+}
-+
-+static int openamp_virtio_metal_init(struct openamp_virtio_metal *metal=
)
-+{
-+	struct metal_init_params params =3D METAL_INIT_DEFAULTS;
-+	struct metal_device *shm_dev =3D &metal->shm_dev;
-+	int ret;
-+
-+	openamp_virtio_metal_device_setup(shm_dev, &metal->shm);
-+
-+	metal_spinlock_init(&metal->lock);
-+
-+	ret =3D metal_init(&params);
-+	if (ret < 0)
-+		return ret;
-+
-+	ret =3D metal_register_generic_device(shm_dev);
-+	if (ret < 0)
-+		goto metal_finish;
-+
-+	ret =3D metal_device_open("generic", OPENAMP_SHEM_DEVICE_NAME,
-+				&metal->io_dev);
-+	if (ret < 0)
-+		goto metal_finish;
-+
-+	metal->io =3D metal_device_io_region(metal->io_dev, 0);
-+	if (!metal->io) {
-+		EMSG("openamp: virtio: failed to init metal io");
-+		ret =3D -EPROTO;
-+		goto metal_finish;
-+	}
-+
-+	return 0;
-+
-+metal_finish:
-+	metal_finish();
-+	return ret;
-+}
-+
-+static unsigned char openamp_virtio_status_get(struct virtio_device *vd=
ev)
-+{
-+	struct openamp_virtio *virtio =3D openamp_virtio_from_dev(vdev);
-+	struct openamp_virtio_shm *shm =3D &virtio->metal.shm;
-+
-+	uint32_t status =3D *(volatile uint32_t *)shm->vdev_status;
-+
-+	return status;
-+}
-+
-+static void openamp_virtio_status_set(struct virtio_device *vdev,
-+				      unsigned char status)
-+{
-+	struct openamp_virtio *virtio =3D openamp_virtio_from_dev(vdev);
-+	struct openamp_virtio_shm *shm =3D &virtio->metal.shm;
-+
-+	*(volatile uint32_t *)shm->vdev_status =3D status;
-+}
-+
-+static int count;
-+
-+static uint32_t openamp_virtio_features_get(struct virtio_device *vdev)
-+{
-+	return 1 << VIRTIO_RPMSG_F_NS;
-+}
-+
-+static void openamp_virtio_notify(struct virtqueue *vq)
-+{
-+	struct openamp_virtio_device *openamp_vdev;
-+	struct openamp_caller *openamp;
-+	struct openamp_virtio *virtio;
-+	int ret;
-+
-+	openamp_vdev =3D container_of(vq->vq_dev, struct openamp_virtio_device=
, virtio_dev);
-+	virtio =3D container_of(openamp_vdev, struct openamp_virtio, vdev);
-+	openamp =3D virtio->openamp;
-+
-+	ret =3D openamp->platform_ops->transport_notify(openamp);
-+	if (ret < 0)
-+		EMSG("openamp: virtio: erro in transport_notify: %d", ret);
-+}
-+
-+const static struct virtio_dispatch openamp_virtio_dispatch =3D {
-+	.get_status =3D openamp_virtio_status_get,
-+	.set_status =3D openamp_virtio_status_set,
-+	.get_features =3D openamp_virtio_features_get,
-+	.notify =3D openamp_virtio_notify,
-+};
-+
-+static int openamp_virtio_device_setup(struct openamp_virtio *virtio)
-+{
-+	struct openamp_virtio_metal *metal =3D &virtio->metal;
-+	struct openamp_virtio_device *openamp_vdev =3D &virtio->vdev;
-+	struct virtio_device *vdev =3D &openamp_vdev->virtio_dev;
-+	struct openamp_virtio_shm *shm =3D &metal->shm;
-+	struct virtio_vring_info *rvring;
-+
-+	rvring =3D &openamp_vdev->rvrings[0];
-+
-+	vdev->role =3D RPMSG_REMOTE;
-+	vdev->vrings_num =3D VIRTQUEUE_NR;
-+	vdev->func =3D &openamp_virtio_dispatch;
-+
-+	openamp_vdev->vq[VQ_TX] =3D virtqueue_allocate(VRING_DESCRIPTORS);
-+	if (!openamp_vdev->vq[VQ_TX]) {
-+		EMSG("openamp: virtio: failed to allocate virtqueue 0");
-+		return -ENOMEM;
-+	}
-+	rvring->io =3D metal->io;
-+	rvring->info.vaddr =3D (void *)shm->vring_tx;
-+	rvring->info.num_descs =3D VRING_DESCRIPTORS;
-+	rvring->info.align =3D VRING_ALIGN;
-+	rvring->vq =3D openamp_vdev->vq[VQ_TX];
-+
-+	openamp_vdev->vq[VQ_RX] =3D virtqueue_allocate(VRING_DESCRIPTORS);
-+	if (!openamp_vdev->vq[VQ_RX]) {
-+		EMSG("openamp: virtio: failed to allocate virtqueue 1");
-+		goto free_vq;
-+	}
-+	rvring =3D &openamp_vdev->rvrings[VQ_RX];
-+	rvring->io =3D metal->io;
-+	rvring->info.vaddr =3D (void *)shm->vring_rx;
-+	rvring->info.num_descs =3D VRING_DESCRIPTORS;
-+	rvring->info.align =3D VRING_ALIGN;
-+	rvring->vq =3D openamp_vdev->vq[VQ_RX];
-+
-+	vdev->vrings_info =3D &openamp_vdev->rvrings[0];
-+
-+	return 0;
-+
-+free_vq:
-+	virtqueue_free(openamp_vdev->vq[VQ_TX]);
-+	virtqueue_free(openamp_vdev->vq[VQ_RX]);
-+
-+	return -ENOMEM;
-+}
-+
-+static int openamp_virtio_rpmsg_endpoint_callback(struct rpmsg_endpoint=
 *ep,
-+						  void *data, size_t len,
-+						  uint32_t src, void *priv)
-+{
-+	struct openamp_virtio_rpmsg *vrpmsg;
-+	struct rpmsg_device *rdev;
-+	struct openamp_virtio *virtio;
-+
-+	rdev =3D ep->rdev;
-+	vrpmsg =3D openamp_virtio_rpmsg_from_dev(rdev);
-+	virtio =3D container_of(vrpmsg, struct openamp_virtio, rpmsg);
-+
-+	rpmsg_hold_rx_buffer(ep, data);
-+	vrpmsg->resp_buf =3D data;
-+	vrpmsg->resp_len =3D len;
-+
-+	return 0;
-+}
-+
-+static void openamp_virtio_rpmsg_service_unbind(struct rpmsg_endpoint *=
ep)
-+{
-+	struct openamp_virtio_rpmsg *vrpmsg;
-+	struct rpmsg_device *rdev;
-+
-+	rdev =3D container_of(ep, struct rpmsg_device, ns_ept);
-+	vrpmsg =3D openamp_virtio_rpmsg_from_dev(rdev);
-+
-+	rpmsg_destroy_ept(&vrpmsg->ep);
-+}
-+
-+static void openamp_virtio_rpmsg_endpoint_bind(struct rpmsg_device *rde=
v,
-+					       const char *name,
-+					       unsigned int dest)
-+{
-+	struct openamp_virtio_rpmsg *vrpmsg;
-+
-+	vrpmsg =3D openamp_virtio_rpmsg_from_dev(rdev);
-+
-+	rpmsg_create_ept(&vrpmsg->ep, rdev, name, RPMSG_ADDR_ANY, dest,
-+			 openamp_virtio_rpmsg_endpoint_callback,
-+			 openamp_virtio_rpmsg_service_unbind);
-+}
-+
-+static int openamp_virtio_rpmsg_device_setup(struct openamp_virtio *vir=
tio,
-+					     struct device_region *virtio_dev)
-+{
-+	struct openamp_virtio_rpmsg *vrpmsg =3D &virtio->rpmsg;
-+	struct rpmsg_virtio_device *rpmsg_vdev =3D &vrpmsg->rpmsg_vdev;
-+	struct openamp_virtio_device *openamp_vdev =3D &virtio->vdev;
-+	struct virtio_device *vdev =3D &openamp_vdev->virtio_dev;
-+	struct openamp_virtio_metal *metal =3D &virtio->metal;
-+	int ret;
-+
-+	/*
-+	 * we assume here that we are the client side and do not need to
-+	 * initialize the share memory poll (this is done at server side).
-+	 */
-+	ret =3D rpmsg_init_vdev(rpmsg_vdev, vdev,
-+			      openamp_virtio_rpmsg_endpoint_bind, metal->io,
-+			      NULL);
-+	if (ret < 0) {
-+		EMSG("openamp: virtio: init vdev failed: %d", ret);
-+		return ret;
-+	}
-+
-+
-+	ret =3D rpmsg_create_ept(&vrpmsg->ep, &rpmsg_vdev->rdev,
-+			       OPENAMP_RPMSG_ENDPOINT_NAME, RPMSG_ADDR_ANY,
-+			       RPMSG_ADDR_ANY,
-+			       openamp_virtio_rpmsg_endpoint_callback,
-+			       openamp_virtio_rpmsg_service_unbind);
-+	if (ret < 0) {
-+		EMSG("openamp: virtio: failed to create endpoint: %d", ret);
-+		return ret;
-+	}
-+
-+	/* set default remote addr */
-+	vrpmsg->ep.dest_addr =3D OPENAMP_RPMSG_ENDPOINT_ADDR;
-+
-+	return 0;
-+}
-+
-+static void openamp_virtio_shm_set(struct openamp_virtio *virtio,
-+				   struct device_region *virtio_region)
-+{
-+	struct openamp_virtio_shm *shm =3D &virtio->metal.shm;
-+
-+	shm->base_addr =3D virtio_region->base_addr;
-+	shm->size =3D virtio_region->io_region_size;
-+
-+	shm->vdev_status =3D shm->base_addr;
-+	shm->vdev_status_size =3D OPENAMP_SHEM_VDEV_SIZE;
-+
-+	shm->vring_rx =3D shm->base_addr + shm->size -
-+		(2 * OPENAMP_SHEM_VRING_SIZE);
-+	shm->vring_rx_size =3D OPENAMP_SHEM_VRING_SIZE;
-+
-+	shm->vring_tx =3D shm->vring_rx + shm->vring_rx_size;
-+	shm->vring_tx_size =3D OPENAMP_SHEM_VRING_SIZE;
-+
-+	shm->payload_addr =3D shm->vdev_status + shm->vdev_status_size;
-+	shm->payload_size =3D shm->size - shm->vdev_status_size -
-+		shm->vring_rx_size - shm->vring_tx_size;
-+
-+	shm->shm_physmap[0] =3D OPENAMP_SHEM_PHYS + shm->vdev_status_size;
-+
-+	IMSG("SHEM: base: 0x%0x size: 0x%0x size: %d",
-+	     shm->base_addr, shm->size, shm->size);
-+	IMSG("VDEV: base: 0x%0x size: 0x%0x size: %d",
-+	     shm->vdev_status, shm->vdev_status_size, shm->vdev_status_size);
-+	IMSG("PAYLOAD: base: 0x%0x size: 0x%0x size: %d",
-+	     shm->payload_addr, shm->payload_size, shm->payload_size);
-+	IMSG("VRING_TX: base: 0x%0x size: 0x%0x size: %d",
-+	     shm->vring_tx, shm->vring_tx_size, shm->vring_tx_size);
-+	IMSG("VRING_RX: base: 0x%0x size: 0x%0x size: %d",
-+	     shm->vring_rx, shm->vring_rx_size, shm->vring_rx_size);
-+	IMSG("PHYMAP: base: 0x%0x", shm->shm_physmap[0]);
-+}
-+
-+static int openamp_virtio_device_get(const char *dev,
-+				     struct device_region *dev_region)
-+{
-+	bool found;
-+
-+	found =3D config_store_query(CONFIG_CLASSIFIER_DEVICE_REGION, dev, 0,
-+				   dev_region, sizeof(*dev_region));
-+	if (!found) {
-+		EMSG("openamp: virtio: device region not found: %s", dev);
-+		return -EINVAL;
-+	}
-+
-+	if (dev_region->base_addr =3D=3D 0 || dev_region->io_region_size =3D=3D=
 0) {
-+		EMSG("openamp: virtio: device region not valid");
-+		return -EINVAL;
-+	}
-+
-+	IMSG("openamp: virtio: device region found: %s addr: 0x%x size: %d",
-+	     dev, dev_region->base_addr, dev_region->io_region_size);
-+
-+	return  0;
-+}
-+
-+int openamp_virtio_call_begin(struct openamp_caller *openamp, uint8_t *=
*req_buf,
-+			      size_t req_len)
-+{
-+	struct openamp_virtio *virtio =3D openamp->platform;
-+	struct openamp_virtio_rpmsg *vrpmsg =3D &virtio->rpmsg;
-+	struct rpmsg_endpoint *ep =3D &vrpmsg->ep;
-+
-+
-+	*req_buf =3D rpmsg_get_tx_payload_buffer(ep, &vrpmsg->req_len,
-+					       OPENAMP_BUFFER_WAIT);
-+	if (*req_buf =3D=3D NULL)
-+		return -EINVAL;
-+
-+	if (vrpmsg->req_len < req_len)
-+		return -E2BIG;
-+
-+	vrpmsg->req_buf =3D *req_buf;
-+
-+	return 0;
-+}
-+
-+int openamp_virtio_call_invoke(struct openamp_caller *openamp, int *ops=
tatus,
-+			       uint8_t **resp_buf, size_t *resp_len)
-+{
-+	const struct openamp_platform_ops *ops =3D openamp->platform_ops;
-+	struct openamp_virtio *virtio =3D openamp->platform;
-+	struct openamp_virtio_device *openamp_vdev =3D &virtio->vdev;
-+	struct openamp_virtio_rpmsg *vrpmsg =3D &virtio->rpmsg;
-+	struct rpmsg_endpoint *ep =3D &vrpmsg->ep;
-+	int ret;
-+
-+	ret =3D rpmsg_send_nocopy(ep, vrpmsg->req_buf, vrpmsg->req_len);
-+	if (ret < 0) {
-+		EMSG("openamp: virtio: send nocopy failed: %d", ret);
-+		return -EIO;
-+	}
-+
-+	if (ret !=3D vrpmsg->req_len) {
-+		EMSG("openamp: virtio: send less bytes %d than requested %d",
-+		     ret, vrpmsg->req_len);
-+		return -EIO;
-+	}
-+
-+	if (!ops->transport_receive)
-+		return 0;
-+
-+	ret =3D ops->transport_receive(openamp);
-+	if (ret < 0) {
-+		EMSG("openamp: virtio: failed transport_receive");
-+		return -EIO;
-+	}
-+
-+	virtqueue_notification(openamp_vdev->vq[VQ_RX]);
-+
-+	*resp_buf =3D vrpmsg->resp_buf;
-+	*resp_len =3D vrpmsg->resp_len;
-+
-+	return  0;
-+}
-+
-+void openamp_virtio_call_end(struct openamp_caller *openamp)
-+{
-+	struct openamp_virtio *virtio =3D openamp->platform;
-+	struct openamp_virtio_rpmsg *vrpmsg =3D &virtio->rpmsg;
-+
-+	rpmsg_release_rx_buffer(&vrpmsg->ep, vrpmsg->resp_buf);
-+
-+	vrpmsg->req_buf =3D NULL;
-+	vrpmsg->req_len =3D 0;
-+	vrpmsg->resp_buf =3D NULL;
-+	vrpmsg->resp_len =3D 0;
-+}
-+
-+void *openamp_virtio_virt_to_phys(struct openamp_caller *openamp, void =
*va)
-+{
-+	struct openamp_virtio *virtio =3D openamp->platform;
-+	struct openamp_virtio_metal *metal =3D &virtio->metal;
-+
-+	return metal_io_virt_to_phys(metal->io, va);
-+}
-+
-+void *openamp_virtio_phys_to_virt(struct openamp_caller *openamp, void =
*pa)
-+{
-+	struct openamp_virtio *virtio =3D openamp->platform;
-+	struct openamp_virtio_metal *metal =3D &virtio->metal;
-+
-+	return metal_io_phys_to_virt(metal->io, pa);
-+}
-+
-+int openamp_virtio_init(struct openamp_caller *openamp)
-+{
-+	struct device_region virtio_dev;
-+	struct openamp_virtio *virtio;
-+	int ret;
-+
-+	if (openamp->platform)
-+		return 0;
-+
-+
-+	virtio =3D malloc(sizeof(*virtio));
-+	if (!virtio)
-+		return -ENOMEM;
-+
-+	virtio->openamp =3D openamp;
-+
-+	ret =3D openamp_virtio_device_get(OPENAMP_SHEM_DEVICE_NAME, &virtio_de=
v);
-+	if (ret < 0)
-+		goto free_virtio;
-+
-+	openamp_virtio_shm_set(virtio, &virtio_dev);
-+
-+	ret =3D openamp_virtio_metal_init(&virtio->metal);
-+	if (ret < 0)
-+		goto free_virtio;
-+
-+	ret =3D openamp_virtio_device_setup(virtio);
-+	if (ret < 0)
-+		goto finish_metal;
-+
-+	ret =3D openamp_virtio_rpmsg_device_setup(virtio, &virtio_dev);
-+	if (ret < 0) {
-+		EMSG("openamp: virtio: rpmsg device setup failed: %d", ret);
-+		goto finish_metal;
-+	}
-+
-+	openamp->platform =3D virtio;
-+
-+	return 0;
-+
-+finish_metal:
-+	metal_finish();
-+
-+free_virtio:
-+	free(virtio);
-+
-+	return ret;
-+}
-+
-+int openamp_virtio_deinit(struct openamp_caller *openamp)
-+{
-+	struct openamp_virtio *virtio;
-+
-+	if (!openamp->platform)
-+		return 0;
-+
-+	virtio =3D openamp->platform;
-+
-+	metal_finish();
-+	free(virtio);
-+
-+	openamp->platform =3D NULL;
-+
-+	return 0;
-+}
-diff --git a/components/rpc/openamp/caller/sp/openamp_virtio.h b/compone=
nts/rpc/openamp/caller/sp/openamp_virtio.h
-new file mode 100644
-index 000000000000..915128ff65ce
---- /dev/null
-+++ b/components/rpc/openamp/caller/sp/openamp_virtio.h
-@@ -0,0 +1,24 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ * Copyright (c) 2021, Linaro Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+#ifndef OPENAMP_VIRTIO_H
-+#define OPENAMP_VIRTIO_H
-+
-+#include <stddef.h>
-+#include "openamp_caller.h"
-+
-+int openamp_virtio_call_begin(struct openamp_caller *openamp, uint8_t *=
*req_buf,
-+			      size_t req_len);
-+int openamp_virtio_call_invoke(struct openamp_caller *openamp, int *ops=
tatus,
-+			       uint8_t **resp_buf, size_t *resp_len);
-+int openamp_virtio_call_end(struct openamp_caller *openamp);
-+void *openamp_virtio_virt_to_phys(struct openamp_caller *openamp, void =
*va);
-+void *openamp_virtio_phys_to_virt(struct openamp_caller *openamp, void =
*pa);
-+
-+int openamp_virtio_init(struct openamp_caller *openamp);
-+int openamp_virtio_deinit(struct openamp_caller *openamp);
-+
-+#endif
-diff --git a/deployments/se-proxy/opteesp/default_se-proxy.dts.in b/depl=
oyments/se-proxy/opteesp/default_se-proxy.dts.in
-index 267b4f923540..04c181586b06 100644
---- a/deployments/se-proxy/opteesp/default_se-proxy.dts.in
-+++ b/deployments/se-proxy/opteesp/default_se-proxy.dts.in
-@@ -32,5 +32,11 @@
- 			pages-count =3D <16>;
- 			attributes =3D <0x3>; /* read-write */
- 		};
-+		openamp-virtio {
-+			/* Armv8 A Foundation Platform values */
-+			base-address =3D <0x00000000 0x88000000>;
-+			pages-count =3D <256>;
-+			attributes =3D <0x3>; /* read-write */
-+		};
- 	};
- };
-diff --git a/deployments/se-proxy/se-proxy.cmake b/deployments/se-proxy/=
se-proxy.cmake
-index d39873a0fe81..34fe5ff1b925 100644
---- a/deployments/se-proxy/se-proxy.cmake
-+++ b/deployments/se-proxy/se-proxy.cmake
-@@ -47,6 +47,7 @@ add_components(TARGET "se-proxy"
- 		"components/service/attestation/include"
- 		"components/service/attestation/provider"
- 		"components/service/attestation/provider/serializer/packed-c"
-+		"components/rpc/openamp/caller/sp"
-=20
- 		# Stub service provider backends
- 		"components/rpc/dummy"
---=20
-2.38.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0020-FMP-Support-in-Corstone1000.patch b/meta-arm-bsp/recipes-security/tr=
usted-services/corstone1000/0003-FMP-Support-in-Corstone1000.patch
similarity index 99%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
020-FMP-Support-in-Corstone1000.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/000=
3-FMP-Support-in-Corstone1000.patch
index ce40df0f..3d743d28 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0020-FM=
P-Support-in-Corstone1000.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0003-FM=
P-Support-in-Corstone1000.patch
@@ -1,7 +1,7 @@
-From 70cf374fb55f2d62ecbe28049253df33b42b6749 Mon Sep 17 00:00:00 2001
+From 5c8ac10337ac853d8a82992fb6e1d91b122b99d2 Mon Sep 17 00:00:00 2001
 From: Satish Kumar <satish.kumar01@arm.com>
 Date: Fri, 8 Jul 2022 09:48:06 +0100
-Subject: [PATCH 20/20] FMP Support in Corstone1000.
+Subject: [PATCH 3/6] FMP Support in Corstone1000.
=20
 The FMP support is used by u-boot to pupolate ESRT information
 for the kernel.
@@ -414,5 +414,5 @@ index 000000000000..95fba2a04d5c
 +
 +#endif /* CORSTONE1000_FMP_SERVICE_H */
 --=20
-2.38.1
+2.40.0
=20
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0024-TF-Mv1.7-alignment-Align-PSA-Crypto-SIDs.patch b/meta-arm-bsp/recipe=
s-security/trusted-services/corstone1000/0004-TF-Mv1.7-alignment-Align-PS=
A-Crypto-SIDs.patch
similarity index 95%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
024-TF-Mv1.7-alignment-Align-PSA-Crypto-SIDs.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/000=
4-TF-Mv1.7-alignment-Align-PSA-Crypto-SIDs.patch
index 7e65de86..628d8682 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0024-TF=
-Mv1.7-alignment-Align-PSA-Crypto-SIDs.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0004-TF=
-Mv1.7-alignment-Align-PSA-Crypto-SIDs.patch
@@ -1,24 +1,25 @@
-From ca7d37502f9453125aead14c7ee5181336cbe8f4 Mon Sep 17 00:00:00 2001
+From c294197b17358b20c75757b9a06d628f43cd7884 Mon Sep 17 00:00:00 2001
 From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
 Date: Thu, 9 Feb 2023 00:22:40 +0000
-Subject: [PATCH 1/3] TF-Mv1.7 alignment: Align PSA Crypto SIDs
+Subject: [PATCH 4/6] TF-Mv1.7 alignment: Align PSA Crypto SIDs
=20
 This patch is to change the PSA Crypto SIDs to match the values of the
 PSA Crypto SID definitions in TF-M v1.7 running on the secure enclave
=20
 Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
 Upstream-Status: Pending [Not submitted yet]
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
  .../service/common/include/psa/crypto_sid.h   | 241 ++++++++++++++++++
- components/service/common/include/psa/sid.h   |  78 +-----
+ components/service/common/include/psa/sid.h   |  76 +-----
  .../caller/psa_ipc/crypto_caller_sign_hash.h  |   4 +-
  .../psa_ipc/crypto_caller_verify_hash.h       |   4 +-
- 4 files changed, 249 insertions(+), 78 deletions(-)
+ 4 files changed, 248 insertions(+), 77 deletions(-)
  create mode 100644 components/service/common/include/psa/crypto_sid.h
=20
 diff --git a/components/service/common/include/psa/crypto_sid.h b/compon=
ents/service/common/include/psa/crypto_sid.h
 new file mode 100644
-index 00000000..5b05f46d
+index 000000000000..5b05f46d7d72
 --- /dev/null
 +++ b/components/service/common/include/psa/crypto_sid.h
 @@ -0,0 +1,241 @@
@@ -264,16 +265,9 @@ index 00000000..5b05f46d
 +
 +#endif /* __PSA_CRYPTO_SID_H__ */
 diff --git a/components/service/common/include/psa/sid.h b/components/se=
rvice/common/include/psa/sid.h
-index 8103a9af..50ad070e 100644
+index 8e2c6bdf2919..5aaa659d49a0 100644
 --- a/components/service/common/include/psa/sid.h
 +++ b/components/service/common/include/psa/sid.h
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2019-2021, Arm Limited. All rights reserved.
-+ * Copyright (c) 2019-2023, Arm Limited. All rights reserved.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  *
 @@ -12,6 +12,9 @@
  extern "C" {
  #endif
@@ -284,9 +278,9 @@ index 8103a9af..50ad070e 100644
  /******** TFM_SP_PS ********/
  #define TFM_PROTECTED_STORAGE_SERVICE_SID                          (0x0=
0000060U)
  #define TFM_PROTECTED_STORAGE_SERVICE_VERSION                      (1U)
-@@ -43,79 +46,6 @@ extern "C" {
- #define TFM_PLATFORM_SERVICE_HANDLE       (0x40000105U)
-=20
+@@ -37,79 +40,6 @@ extern "C" {
+ #define TFM_CRYPTO_VERSION                                         (1U)
+ #define TFM_CRYPTO_HANDLE                                          (0x4=
0000100U)
 =20
 -/**
 - * \brief Define a progressive numerical value for each SID which can b=
e used
@@ -365,7 +359,7 @@ index 8103a9af..50ad070e 100644
  #define TFM_SP_PLATFORM_SYSTEM_RESET_SID                           (0x0=
0000040U)
  #define TFM_SP_PLATFORM_SYSTEM_RESET_VERSION                       (1U)
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_sign_hash.h b/components/service/crypto/client/caller/psa_ipc/crypto_c=
aller_sign_hash.h
-index e4a2b167..9276748d 100644
+index 29bd56e60708..bebfe05c7c49 100644
 --- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_sign=
_hash.h
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_sign=
_hash.h
 @@ -37,7 +37,7 @@ static inline psa_status_t crypto_caller_sign_hash(str=
uct service_client *contex
@@ -387,7 +381,7 @@ index e4a2b167..9276748d 100644
  		.alg =3D alg,
  	};
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_verify_hash.h b/components/service/crypto/client/caller/psa_ipc/crypto=
_caller_verify_hash.h
-index cc9279ee..bcd8e0e4 100644
+index 66281d588626..d0a3850678cb 100644
 --- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_veri=
fy_hash.h
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_veri=
fy_hash.h
 @@ -63,7 +63,7 @@ static inline psa_status_t crypto_caller_verify_hash(s=
truct service_client *cont
@@ -409,5 +403,5 @@ index cc9279ee..bcd8e0e4 100644
 =20
  #ifdef __cplusplus
 --=20
-2.25.1
+2.40.0
=20
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0004-add-psa-client-definitions-for-ff-m.patch b/meta-arm-bsp/recipes-sec=
urity/trusted-services/corstone1000/0004-add-psa-client-definitions-for-f=
f-m.patch
deleted file mode 100644
index 84d418c1..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0004-ad=
d-psa-client-definitions-for-ff-m.patch
+++ /dev/null
@@ -1,298 +0,0 @@
-From fb6d2f33e26c7b6ef88d552feca1f835da3f0df6 Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Fri, 3 Dec 2021 19:05:18 +0000
-Subject: [PATCH 04/20] add psa client definitions for ff-m
-
-Add PSA client definitions in common include to add future
-ff-m support.
-
-Upstream-Status: Pending
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- .../service/common/include/psa/client.h       | 194 ++++++++++++++++++
- components/service/common/include/psa/sid.h   |  71 +++++++
- 2 files changed, 265 insertions(+)
- create mode 100644 components/service/common/include/psa/client.h
- create mode 100644 components/service/common/include/psa/sid.h
-
-diff --git a/components/service/common/include/psa/client.h b/components=
/service/common/include/psa/client.h
-new file mode 100644
-index 000000000000..69ccf14f40a3
---- /dev/null
-+++ b/components/service/common/include/psa/client.h
-@@ -0,0 +1,194 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef SERVICE_PSA_IPC_H
-+#define SERVICE_PSA_IPC_H
-+
-+#include <stddef.h>
-+#include <stdint.h>
-+
-+#include <rpc_caller.h>
-+#include <psa/error.h>
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+#ifndef IOVEC_LEN
-+#define IOVEC_LEN(arr) ((uint32_t)(sizeof(arr)/sizeof(arr[0])))
-+#endif
-+
-+/*********************** PSA Client Macros and Types ******************=
*******/
-+
-+typedef int32_t psa_handle_t;
-+
-+/**
-+ * The version of the PSA Framework API that is being used to build the=
 calling
-+ * firmware. Only part of features of FF-M v1.1 have been implemented. =
FF-M v1.1
-+ * is compatible with v1.0.
-+ */
-+#define PSA_FRAMEWORK_VERSION       (0x0101u)
-+
-+/**
-+ * Return value from psa_version() if the requested RoT Service is not =
present
-+ * in the system.
-+ */
-+#define PSA_VERSION_NONE            (0u)
-+
-+/**
-+ * The zero-value null handle can be assigned to variables used in clie=
nts and
-+ * RoT Services, indicating that there is no current connection or mess=
age.
-+ */
-+#define PSA_NULL_HANDLE             ((psa_handle_t)0)
-+
-+/**
-+ * Tests whether a handle value returned by psa_connect() is valid.
-+ */
-+#define PSA_HANDLE_IS_VALID(handle) ((psa_handle_t)(handle) > 0)
-+
-+/**
-+ * Converts the handle value returned from a failed call psa_connect() =
into
-+ * an error code.
-+ */
-+#define PSA_HANDLE_TO_ERROR(handle) ((psa_status_t)(handle))
-+
-+/**
-+ * Maximum number of input and output vectors for a request to psa_call=
().
-+ */
-+#define PSA_MAX_IOVEC               (4u)
-+
-+/**
-+ * An IPC message type that indicates a generic client request.
-+ */
-+#define PSA_IPC_CALL                (0)
-+
-+/**
-+ * A read-only input memory region provided to an RoT Service.
-+ */
-+struct __attribute__ ((__packed__)) psa_invec {
-+    uint32_t base;           /*!< the start address of the memory buffe=
r */
-+    uint32_t len;                 /*!< the size in bytes               =
       */
-+};
-+
-+/**
-+ * A writable output memory region provided to an RoT Service.
-+ */
-+struct __attribute__ ((__packed__)) psa_outvec {
-+    uint32_t base;                 /*!< the start address of the memory=
 buffer */
-+    uint32_t len;                 /*!< the size in bytes               =
       */
-+};
-+
-+/*************************** PSA Client API ***************************=
*******/
-+
-+/**
-+ * \brief Retrieve the version of the PSA Framework API that is impleme=
nted.
-+ *
-+ * \param[in] rpc_caller        RPC caller to use
-+ * \return version              The version of the PSA Framework implem=
entation
-+ *                              that is providing the runtime services =
to the
-+ *                              caller. The major and minor version are=
 encoded
-+ *                              as follows:
-+ * \arg                           version[15:8] -- major version number=
.
-+ * \arg                           version[7:0]  -- minor version number=
.
-+ */
-+uint32_t psa_framework_version(struct rpc_caller *caller);
-+
-+/**
-+ * \brief Retrieve the version of an RoT Service or indicate that it is=
 not
-+ *        present on this system.
-+ *
-+ * \param[in] rpc_caller        RPC caller to use
-+ * \param[in] sid               ID of the RoT Service to query.
-+ *
-+ * \retval PSA_VERSION_NONE     The RoT Service is not implemented, or =
the
-+ *                              caller is not permitted to access the s=
ervice.
-+ * \retval > 0                  The version of the implemented RoT Serv=
ice.
-+ */
-+uint32_t psa_version(struct rpc_caller *caller, uint32_t sid);
-+
-+/**
-+ * \brief Connect to an RoT Service by its SID.
-+ *
-+ * \param[in] rpc_caller        RPC caller to use
-+ * \param[in] sid               ID of the RoT Service to connect to.
-+ * \param[in] version           Requested version of the RoT Service.
-+ *
-+ * \retval > 0                  A handle for the connection.
-+ * \retval PSA_ERROR_CONNECTION_REFUSED The SPM or RoT Service has refu=
sed the
-+ *                              connection.
-+ * \retval PSA_ERROR_CONNECTION_BUSY The SPM or RoT Service cannot make=
 the
-+ *                              connection at the moment.
-+ * \retval "PROGRAMMER ERROR"   The call is a PROGRAMMER ERROR if one o=
r more
-+ *                              of the following are true:
-+ * \arg                           The RoT Service ID is not present.
-+ * \arg                           The RoT Service version is not suppor=
ted.
-+ * \arg                           The caller is not allowed to access t=
he RoT
-+ *                                service.
-+ */
-+psa_handle_t psa_connect(struct rpc_caller *caller, uint32_t sid,
-+			 uint32_t version);
-+
-+/**
-+ * \brief Call an RoT Service on an established connection.
-+ *
-+ * \note  FF-M 1.0 proposes 6 parameters for psa_call but the secure ga=
teway ABI
-+ *        support at most 4 parameters. TF-M chooses to encode 'in_len'=
,
-+ *        'out_len', and 'type' into a 32-bit integer to improve effici=
ency.
-+ *        Compared with struct-based encoding, this method saves extra =
memory
-+ *        check and memory copy operation. The disadvantage is that the=
 'type'
-+ *        range has to be reduced into a 16-bit integer. So with this e=
ncoding,
-+ *        the valid range for 'type' is 0-32767.
-+ *
-+ * \param[in] rpc_caller        RPC caller to use
-+ * \param[in] handle            A handle to an established connection.
-+ * \param[in] type              The request type.
-+ *                              Must be zero( \ref PSA_IPC_CALL) or pos=
itive.
-+ * \param[in] in_vec            Array of input \ref psa_invec structure=
s.
-+ * \param[in] in_len            Number of input \ref psa_invec structur=
es.
-+ * \param[in,out] out_vec       Array of output \ref psa_outvec structu=
res.
-+ * \param[in] out_len           Number of output \ref psa_outvec struct=
ures.
-+ *
-+ * \retval >=3D0                  RoT Service-specific status value.
-+ * \retval <0                   RoT Service-specific error code.
-+ * \retval PSA_ERROR_PROGRAMMER_ERROR The connection has been terminate=
d by the
-+ *                              RoT Service. The call is a PROGRAMMER E=
RROR if
-+ *                              one or more of the following are true:
-+ * \arg                           An invalid handle was passed.
-+ * \arg                           The connection is already handling a =
request.
-+ * \arg                           type < 0.
-+ * \arg                           An invalid memory reference was provi=
ded.
-+ * \arg                           in_len + out_len > PSA_MAX_IOVEC.
-+ * \arg                           The message is unrecognized by the Ro=
T
-+ *                                Service or incorrectly formatted.
-+ */
-+psa_status_t psa_call(struct rpc_caller *caller, psa_handle_t handle,
-+		      int32_t type, const struct psa_invec *in_vec,
-+		      size_t in_len, struct psa_outvec *out_vec, size_t out_len);
-+
-+/**
-+ * \brief Close a connection to an RoT Service.
-+ *
-+ * \param[in] rpc_caller        RPC caller to use
-+ * \param[in] handle            A handle to an established connection, =
or the
-+ *                              null handle.
-+ *
-+ * \retval void                 Success.
-+ * \retval "PROGRAMMER ERROR"   The call is a PROGRAMMER ERROR if one o=
r more
-+ *                              of the following are true:
-+ * \arg                           An invalid handle was provided that i=
s not
-+ *                                the null handle.
-+ * \arg                           The connection is currently handling =
a
-+ *                                request.
-+ */
-+void psa_close(struct rpc_caller *caller, psa_handle_t handle);
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* SERVICE_PSA_IPC_H */
-+
-+
-diff --git a/components/service/common/include/psa/sid.h b/components/se=
rvice/common/include/psa/sid.h
-new file mode 100644
-index 000000000000..aaa973c6e987
---- /dev/null
-+++ b/components/service/common/include/psa/sid.h
-@@ -0,0 +1,71 @@
-+/*
-+ * Copyright (c) 2019-2021, Arm Limited. All rights reserved.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ *
-+ */
-+
-+#ifndef __PSA_MANIFEST_SID_H__
-+#define __PSA_MANIFEST_SID_H__
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+/******** TFM_SP_PS ********/
-+#define TFM_PROTECTED_STORAGE_SERVICE_SID                          (0x0=
0000060U)
-+#define TFM_PROTECTED_STORAGE_SERVICE_VERSION                      (1U)
-+#define TFM_PROTECTED_STORAGE_SERVICE_HANDLE                       (0x4=
0000101U)
-+
-+/* Invalid UID */
-+#define TFM_PS_INVALID_UID 0
-+
-+/* PS message types that distinguish PS services. */
-+#define TFM_PS_SET                1001
-+#define TFM_PS_GET                1002
-+#define TFM_PS_GET_INFO           1003
-+#define TFM_PS_REMOVE             1004
-+#define TFM_PS_GET_SUPPORT        1005
-+
-+/******** TFM_SP_ITS ********/
-+#define TFM_INTERNAL_TRUSTED_STORAGE_SERVICE_SID                   (0x0=
0000070U)
-+#define TFM_INTERNAL_TRUSTED_STORAGE_SERVICE_VERSION               (1U)
-+#define TFM_INTERNAL_TRUSTED_STORAGE_SERVICE_HANDLE                (0x4=
0000102U)
-+
-+/******** TFM_SP_CRYPTO ********/
-+#define TFM_CRYPTO_SID                                             (0x0=
0000080U)
-+#define TFM_CRYPTO_VERSION                                         (1U)
-+#define TFM_CRYPTO_HANDLE                                          (0x4=
0000100U)
-+
-+/******** TFM_SP_PLATFORM ********/
-+#define TFM_SP_PLATFORM_SYSTEM_RESET_SID                           (0x0=
0000040U)
-+#define TFM_SP_PLATFORM_SYSTEM_RESET_VERSION                       (1U)
-+#define TFM_SP_PLATFORM_IOCTL_SID                                  (0x0=
0000041U)
-+#define TFM_SP_PLATFORM_IOCTL_VERSION                              (1U)
-+#define TFM_SP_PLATFORM_NV_COUNTER_SID                             (0x0=
0000042U)
-+#define TFM_SP_PLATFORM_NV_COUNTER_VERSION                         (1U)
-+
-+/******** TFM_SP_INITIAL_ATTESTATION ********/
-+#define TFM_ATTESTATION_SERVICE_SID                                (0x0=
0000020U)
-+#define TFM_ATTESTATION_SERVICE_VERSION                            (1U)
-+#define TFM_ATTESTATION_SERVICE_HANDLE                             (0x4=
0000103U)
-+
-+/******** TFM_SP_FWU ********/
-+#define TFM_FWU_WRITE_SID                                          (0x0=
00000A0U)
-+#define TFM_FWU_WRITE_VERSION                                      (1U)
-+#define TFM_FWU_INSTALL_SID                                        (0x0=
00000A1U)
-+#define TFM_FWU_INSTALL_VERSION                                    (1U)
-+#define TFM_FWU_ABORT_SID                                          (0x0=
00000A2U)
-+#define TFM_FWU_ABORT_VERSION                                      (1U)
-+#define TFM_FWU_QUERY_SID                                          (0x0=
00000A3U)
-+#define TFM_FWU_QUERY_VERSION                                      (1U)
-+#define TFM_FWU_REQUEST_REBOOT_SID                                 (0x0=
00000A4U)
-+#define TFM_FWU_REQUEST_REBOOT_VERSION                             (1U)
-+#define TFM_FWU_ACCEPT_SID                                         (0x0=
00000A5U)
-+#define TFM_FWU_ACCEPT_VERSION                                     (1U)
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* __PSA_MANIFEST_SID_H__ */
---=20
-2.38.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0005-Add-common-service-component-to-ipc-support.patch b/meta-arm-bsp/rec=
ipes-security/trusted-services/corstone1000/0005-Add-common-service-compo=
nent-to-ipc-support.patch
deleted file mode 100644
index df3cb2f4..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0005-Ad=
d-common-service-component-to-ipc-support.patch
+++ /dev/null
@@ -1,295 +0,0 @@
-From 0311fc8f131fe7a2b0f4dd9988c610fda47394aa Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Fri, 3 Dec 2021 19:13:03 +0000
-Subject: [PATCH 05/20] Add common service component to ipc support
-
-Add support for inter processor communication for PSA
-including, the openamp client side structures lib.
-
-Upstream-Status: Pending
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- .../service/common/psa_ipc/component.cmake    |  13 ++
- .../service/common/psa_ipc/service_psa_ipc.c  |  97 +++++++++++++
- .../psa_ipc/service_psa_ipc_openamp_lib.h     | 131 ++++++++++++++++++
- deployments/se-proxy/se-proxy.cmake           |   1 +
- 4 files changed, 242 insertions(+)
- create mode 100644 components/service/common/psa_ipc/component.cmake
- create mode 100644 components/service/common/psa_ipc/service_psa_ipc.c
- create mode 100644 components/service/common/psa_ipc/service_psa_ipc_op=
enamp_lib.h
-
-diff --git a/components/service/common/psa_ipc/component.cmake b/compone=
nts/service/common/psa_ipc/component.cmake
-new file mode 100644
-index 000000000000..5a1c9e62e2f0
---- /dev/null
-+++ b/components/service/common/psa_ipc/component.cmake
-@@ -0,0 +1,13 @@
-+#----------------------------------------------------------------------=
---------
-+# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved=
.
-+#
-+# SPDX-License-Identifier: BSD-3-Clause
-+#
-+#----------------------------------------------------------------------=
---------
-+if (NOT DEFINED TGT)
-+	message(FATAL_ERROR "mandatory parameter TGT is not defined.")
-+endif()
-+
-+target_sources(${TGT} PRIVATE
-+	"${CMAKE_CURRENT_LIST_DIR}/service_psa_ipc.c"
-+	)
-diff --git a/components/service/common/psa_ipc/service_psa_ipc.c b/compo=
nents/service/common/psa_ipc/service_psa_ipc.c
-new file mode 100644
-index 000000000000..e8093c20a523
---- /dev/null
-+++ b/components/service/common/psa_ipc/service_psa_ipc.c
-@@ -0,0 +1,97 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#include <stddef.h>
-+#include <stdint.h>
-+#include <string.h>
-+#include <trace.h>
-+
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <psa/error.h>
-+#include <rpc_caller.h>
-+
-+#include <psa/client.h>
-+#include "service_psa_ipc_openamp_lib.h"
-+
-+psa_handle_t psa_connect(struct rpc_caller *caller, uint32_t sid,
-+			 uint32_t version)
-+{
-+	psa_status_t psa_status =3D PSA_SUCCESS;
-+	struct s_openamp_msg *resp_msg =3D NULL;
-+	struct ns_openamp_msg *req_msg;
-+	rpc_call_handle rpc_handle;
-+	size_t resp_len;
-+	uint8_t *resp;
-+	uint8_t *req;
-+	int ret;
-+
-+	rpc_handle =3D rpc_caller_begin(caller, &req,
-+				      sizeof(struct ns_openamp_msg));
-+	if (!rpc_handle) {
-+		EMSG("psa_connect: could not get handle");
-+		return PSA_ERROR_GENERIC_ERROR;
-+	}
-+
-+	req_msg =3D (struct ns_openamp_msg *)req;
-+
-+	req_msg->call_type =3D OPENAMP_PSA_CONNECT;
-+	req_msg->params.psa_connect_params.sid =3D sid;
-+	req_msg->params.psa_connect_params.version =3D version;
-+
-+	ret =3D rpc_caller_invoke(caller, rpc_handle, 0, &psa_status, &resp,
-+				&resp_len);
-+	if (ret !=3D TS_RPC_CALL_ACCEPTED) {
-+		EMSG("psa_connect: invoke failed: %d", ret);
-+		return PSA_ERROR_GENERIC_ERROR;
-+	}
-+
-+	if (psa_status =3D=3D PSA_SUCCESS)
-+		resp_msg =3D (struct s_openamp_msg *)resp;
-+
-+	rpc_caller_end(caller, rpc_handle);
-+
-+	return resp_msg ? (psa_handle_t)resp_msg->reply : PSA_NULL_HANDLE;
-+}
-+
-+psa_status_t psa_call(struct rpc_caller *caller, psa_handle_t handle,
-+		      int32_t type, const struct psa_invec *in_vec,
-+		      size_t in_len, struct psa_outvec *out_vec, size_t out_len)
-+{
-+
-+}
-+
-+void psa_close(struct rpc_caller *caller, psa_handle_t handle)
-+{
-+	psa_status_t psa_status =3D PSA_SUCCESS;
-+	struct s_openamp_msg *resp_msg =3D NULL;
-+	struct ns_openamp_msg *req_msg;
-+	rpc_call_handle rpc_handle;
-+	size_t resp_len;
-+	uint8_t *resp;
-+	uint8_t *req;
-+	int ret;
-+
-+	rpc_handle =3D rpc_caller_begin(caller, &req,
-+				      sizeof(struct ns_openamp_msg));
-+	if (!rpc_handle) {
-+		EMSG("psa_close: could not get handle");
-+		return;
-+	}
-+
-+	req_msg =3D (struct ns_openamp_msg *)req;
-+
-+	req_msg->call_type =3D OPENAMP_PSA_CLOSE;
-+	req_msg->params.psa_close_params.handle =3D handle;
-+
-+	ret =3D rpc_caller_invoke(caller, rpc_handle, 0, &psa_status, &resp,
-+				&resp_len);
-+	if (ret !=3D TS_RPC_CALL_ACCEPTED) {
-+		EMSG("psa_close: invoke failed: %d", ret);
-+		return;
-+	}
-+
-+	rpc_caller_end(caller, rpc_handle);
-+}
-diff --git a/components/service/common/psa_ipc/service_psa_ipc_openamp_l=
ib.h b/components/service/common/psa_ipc/service_psa_ipc_openamp_lib.h
-new file mode 100644
-index 000000000000..33ea96660572
---- /dev/null
-+++ b/components/service/common/psa_ipc/service_psa_ipc_openamp_lib.h
-@@ -0,0 +1,131 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef SERVICE_PSA_IPC_OPENAMP_LIB_H
-+#define SERVICE_PSA_IPC_OPENAMP_LIB_H
-+
-+#include <stddef.h>
-+#include <stdint.h>
-+
-+#include <compiler.h>
-+#include <psa/error.h>
-+
-+#include <stdint.h>
-+#include <psa/client.h>
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+/* PSA client call type value */
-+#define OPENAMP_PSA_FRAMEWORK_VERSION       (0x1)
-+#define OPENAMP_PSA_VERSION                 (0x2)
-+#define OPENAMP_PSA_CONNECT                 (0x3)
-+#define OPENAMP_PSA_CALL                    (0x4)
-+#define OPENAMP_PSA_CLOSE                   (0x5)
-+
-+/* Return code of openamp APIs */
-+#define OPENAMP_SUCCESS                     (0)
-+#define OPENAMP_MAP_FULL                    (INT32_MIN + 1)
-+#define OPENAMP_MAP_ERROR                   (INT32_MIN + 2)
-+#define OPENAMP_INVAL_PARAMS                (INT32_MIN + 3)
-+#define OPENAMP_NO_PERMS                    (INT32_MIN + 4)
-+#define OPENAMP_NO_PEND_EVENT               (INT32_MIN + 5)
-+#define OPENAMP_CHAN_BUSY                   (INT32_MIN + 6)
-+#define OPENAMP_CALLBACK_REG_ERROR          (INT32_MIN + 7)
-+#define OPENAMP_INIT_ERROR                  (INT32_MIN + 8)
-+
-+#define HOLD_INPUT_BUFFER (1) /* IF true, TF-M Library will hold the op=
enamp
-+			       * buffer so that openamp shared memory buffer
-+			       * does not get freed.
-+			       */
-+
-+/*
-+ * This structure holds the parameters used in a PSA client call.
-+ */
-+typedef struct __packed psa_client_in_params {
-+	union {
-+		struct __packed {
-+			uint32_t        sid;
-+		} psa_version_params;
-+
-+		struct __packed {
-+			uint32_t        sid;
-+			uint32_t        version;
-+		} psa_connect_params;
-+
-+		struct __packed {
-+			psa_handle_t     handle;
-+			int32_t          type;
-+			uint32_t         in_vec;
-+			uint32_t         in_len;
-+			uint32_t         out_vec;
-+			uint32_t         out_len;
-+		} psa_call_params;
-+
-+		struct __packed {
-+			psa_handle_t    handle;
-+		} psa_close_params;
-+	};
-+} psa_client_in_params_t;
-+
-+/* Openamp message passed from NSPE to SPE to deliver a PSA client call=
 */
-+struct __packed ns_openamp_msg {
-+	uint32_t                      call_type;   /* PSA client call type */
-+	struct psa_client_in_params   params;      /* Contain parameters used =
in PSA
-+						  * client call
-+						  */
-+
-+	int32_t                     client_id;   /* Optional client ID of the
-+						  * non-secure caller.
-+						  * It is required to identify the
-+						  * non-secure task when NSPE OS
-+						  * enforces non-secure task
-+						  * isolation
-+						  */
-+	int32_t                     request_id;  /* This is the unique ID for =
a
-+						  * request send to TF-M by the
-+						  * non-secure core. TF-M forward
-+						  * the ID back to non-secure on the
-+						  * reply to a given request. Using
-+						  * this id, the non-secure library
-+						  * can identify the request for
-+						  * which the reply has received.
-+						  */
-+};
-+
-+/*
-+ * This structure holds the location of the out data of the PSA client =
call.
-+ */
-+struct __packed psa_client_out_params {
-+	uint32_t              out_vec;
-+	uint32_t              out_len;
-+};
-+
-+
-+/* Openamp message from SPE to NSPE delivering the reply back for a PSA=
 client
-+ * call.
-+ */
-+struct __packed s_openamp_msg {
-+	int32_t                     request_id;  /* Using this id, the non-sec=
ure
-+						  * library identifies the request.
-+						  * TF-M forwards the same
-+						  * request-id received on the
-+						  * initial request.
-+						  */
-+	int32_t                     reply;       /* Reply of the PSA client ca=
ll */
-+	struct psa_client_out_params     params;      /* Contain out data resu=
lt of the
-+						       * PSA client call.
-+						       */
-+};
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* SERVICE_PSA_IPC_OPENAMP_LIB_H */
-+
-+
-diff --git a/deployments/se-proxy/se-proxy.cmake b/deployments/se-proxy/=
se-proxy.cmake
-index 34fe5ff1b925..dd0c5d00c21e 100644
---- a/deployments/se-proxy/se-proxy.cmake
-+++ b/deployments/se-proxy/se-proxy.cmake
-@@ -24,6 +24,7 @@ add_components(TARGET "se-proxy"
- 		"components/service/common/include"
- 		"components/service/common/serializer/protobuf"
- 		"components/service/common/client"
-+		"components/service/common/psa_ipc"
- 		"components/service/common/provider"
- 		"components/service/discovery/provider"
- 		"components/service/discovery/provider/serializer/packed-c"
---=20
-2.38.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0025-TF-Mv1.7-alignment-Align-crypto-iovec-definition.patch b/meta-arm-bs=
p/recipes-security/trusted-services/corstone1000/0005-TF-Mv1.7-alignment-=
Align-crypto-iovec-definition.patch
similarity index 90%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
025-TF-Mv1.7-alignment-Align-crypto-iovec-definition.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/000=
5-TF-Mv1.7-alignment-Align-crypto-iovec-definition.patch
index ecea2364..5ed36faf 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0025-TF=
-Mv1.7-alignment-Align-crypto-iovec-definition.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0005-TF=
-Mv1.7-alignment-Align-crypto-iovec-definition.patch
@@ -1,7 +1,7 @@
-From a3e203136e7c552069ae582273e0540a219c105f Mon Sep 17 00:00:00 2001
+From 355e9e1425bbe1d4f27eadf81b91ad047d7b42b5 Mon Sep 17 00:00:00 2001
 From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
 Date: Thu, 9 Feb 2023 00:01:06 +0000
-Subject: [PATCH 2/3] TF-Mv1.7 alignment: Align crypto iovec definition
+Subject: [PATCH 5/6] TF-Mv1.7 alignment: Align crypto iovec definition
=20
 This patch is to align psa_ipc_crypto_pack_iovec with TF-M v1.7
 And propagate changes accross psa_ipc functions
@@ -9,6 +9,7 @@ More accuratly change sfn_id to function_id
=20
 Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
 Upstream-Status: Pending [Not submitted yet]
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
  .../backend/psa_ipc/crypto_ipc_backend.h      | 34 +++++++++----------
  .../caller/psa_ipc/crypto_caller_aead.h       | 24 ++++++-------
@@ -32,7 +33,7 @@ Upstream-Status: Pending [Not submitted yet]
  19 files changed, 73 insertions(+), 73 deletions(-)
=20
 diff --git a/components/service/crypto/backend/psa_ipc/crypto_ipc_backen=
d.h b/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h
-index ec25eaf8..aacd3fcc 100644
+index 678a35810d71..47243648a99f 100644
 --- a/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h
 +++ b/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h
 @@ -28,23 +28,23 @@ struct psa_ipc_crypto_aead_pack_input {
@@ -77,7 +78,7 @@ index ec25eaf8..aacd3fcc 100644
  #define iov_size sizeof(struct psa_ipc_crypto_pack_iovec)
 =20
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_aead.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller=
_aead.h
-index f6aadd8b..efdffdf7 100644
+index 66a2bc958687..f63996a8aad3 100644
 --- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_aead=
.h
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_aead=
.h
 @@ -44,7 +44,7 @@ static inline psa_status_t crypto_caller_aead_encrypt(
@@ -102,94 +103,94 @@ index f6aadd8b..efdffdf7 100644
  	struct rpc_caller *caller =3D ipc->caller;
  	psa_status_t status;
  	struct psa_ipc_crypto_pack_iovec iov =3D {
--	    .sfn_id =3D TFM_CRYPTO_AEAD_ENCRYPT_SETUP_SID,
-+	    .function_id =3D TFM_CRYPTO_AEAD_ENCRYPT_SETUP_SID,
- 	    .key_id =3D key,
- 	    .alg =3D alg,
- 	    .op_handle =3D (*op_handle),
-@@ -185,7 +185,7 @@ static inline psa_status_t crypto_caller_aead_decryp=
t_setup(
+-		.sfn_id =3D TFM_CRYPTO_AEAD_ENCRYPT_SETUP_SID,
++		.function_id =3D TFM_CRYPTO_AEAD_ENCRYPT_SETUP_SID,
+ 		.key_id =3D key,
+ 		.alg =3D alg,
+ 		.op_handle =3D (*op_handle),
+@@ -186,7 +186,7 @@ static inline psa_status_t crypto_caller_aead_decryp=
t_setup(
  	struct rpc_caller *caller =3D ipc->caller;
  	psa_status_t status;
  	struct psa_ipc_crypto_pack_iovec iov =3D {
--	    .sfn_id =3D TFM_CRYPTO_AEAD_DECRYPT_SETUP_SID,
-+	    .function_id =3D TFM_CRYPTO_AEAD_DECRYPT_SETUP_SID,
- 	    .key_id =3D key,
- 	    .alg =3D alg,
- 	    .op_handle =3D (*op_handle),
-@@ -214,7 +214,7 @@ static inline psa_status_t crypto_caller_aead_genera=
te_nonce(
+-		.sfn_id =3D TFM_CRYPTO_AEAD_DECRYPT_SETUP_SID,
++		.function_id =3D TFM_CRYPTO_AEAD_DECRYPT_SETUP_SID,
+ 		.key_id =3D key,
+ 		.alg =3D alg,
+ 		.op_handle =3D (*op_handle),
+@@ -217,7 +217,7 @@ static inline psa_status_t crypto_caller_aead_genera=
te_nonce(
  	struct rpc_caller *caller =3D ipc->caller;
  	psa_status_t status;
  	struct psa_ipc_crypto_pack_iovec iov =3D {
--	    .sfn_id =3D TFM_CRYPTO_AEAD_GENERATE_NONCE_SID,
-+	    .function_id =3D TFM_CRYPTO_AEAD_GENERATE_NONCE_SID,
- 	    .op_handle =3D op_handle,
+-		.sfn_id =3D TFM_CRYPTO_AEAD_GENERATE_NONCE_SID,
++		.function_id =3D TFM_CRYPTO_AEAD_GENERATE_NONCE_SID,
+ 		.op_handle =3D op_handle,
  	};
 =20
-@@ -243,7 +243,7 @@ static inline psa_status_t crypto_caller_aead_set_no=
nce(
+@@ -248,7 +248,7 @@ static inline psa_status_t crypto_caller_aead_set_no=
nce(
  	struct rpc_caller *caller =3D ipc->caller;
  	psa_status_t status;
  	struct psa_ipc_crypto_pack_iovec iov =3D {
--	    .sfn_id =3D TFM_CRYPTO_AEAD_SET_NONCE_SID,
-+	    .function_id =3D TFM_CRYPTO_AEAD_SET_NONCE_SID,
- 	    .op_handle =3D op_handle,
+-		.sfn_id =3D TFM_CRYPTO_AEAD_SET_NONCE_SID,
++		.function_id =3D TFM_CRYPTO_AEAD_SET_NONCE_SID,
+ 		.op_handle =3D op_handle,
  	};
 =20
-@@ -270,7 +270,7 @@ static inline psa_status_t crypto_caller_aead_set_le=
ngths(
+@@ -277,7 +277,7 @@ static inline psa_status_t crypto_caller_aead_set_le=
ngths(
  	struct rpc_caller *caller =3D ipc->caller;
  	psa_status_t status;
  	struct psa_ipc_crypto_pack_iovec iov =3D {
--	    .sfn_id =3D TFM_CRYPTO_AEAD_SET_LENGTHS_SID,
-+	    .function_id =3D TFM_CRYPTO_AEAD_SET_LENGTHS_SID,
- 	    .ad_length =3D ad_length,
- 	    .plaintext_length =3D plaintext_length,
- 	    .op_handle =3D op_handle,
-@@ -299,7 +299,7 @@ static inline psa_status_t crypto_caller_aead_update=
_ad(
+-		.sfn_id =3D TFM_CRYPTO_AEAD_SET_LENGTHS_SID,
++		.function_id =3D TFM_CRYPTO_AEAD_SET_LENGTHS_SID,
+ 		.ad_length =3D ad_length,
+ 		.plaintext_length =3D plaintext_length,
+ 		.op_handle =3D op_handle,
+@@ -307,7 +307,7 @@ static inline psa_status_t crypto_caller_aead_update=
_ad(
  	struct rpc_caller *caller =3D ipc->caller;
  	psa_status_t status;
  	struct psa_ipc_crypto_pack_iovec iov =3D {
--	    .sfn_id =3D TFM_CRYPTO_AEAD_UPDATE_AD_SID,
-+	    .function_id =3D TFM_CRYPTO_AEAD_UPDATE_AD_SID,
- 	    .op_handle =3D op_handle,
+-		.sfn_id =3D TFM_CRYPTO_AEAD_UPDATE_AD_SID,
++		.function_id =3D TFM_CRYPTO_AEAD_UPDATE_AD_SID,
+ 		.op_handle =3D op_handle,
  	};
 =20
-@@ -339,7 +339,7 @@ static inline psa_status_t crypto_caller_aead_update=
(
+@@ -349,7 +349,7 @@ static inline psa_status_t crypto_caller_aead_update=
(
  	struct rpc_caller *caller =3D ipc->caller;
  	psa_status_t status;
  	struct psa_ipc_crypto_pack_iovec iov =3D {
--	    .sfn_id =3D TFM_CRYPTO_AEAD_UPDATE_SID,
-+	    .function_id =3D TFM_CRYPTO_AEAD_UPDATE_SID,
- 	    .op_handle =3D op_handle,
+-		.sfn_id =3D TFM_CRYPTO_AEAD_UPDATE_SID,
++		.function_id =3D TFM_CRYPTO_AEAD_UPDATE_SID,
+ 		.op_handle =3D op_handle,
  	};
 =20
-@@ -383,7 +383,7 @@ static inline psa_status_t crypto_caller_aead_finish=
(
+@@ -395,7 +395,7 @@ static inline psa_status_t crypto_caller_aead_finish=
(
  	struct rpc_caller *caller =3D ipc->caller;
  	psa_status_t status;
  	struct psa_ipc_crypto_pack_iovec iov =3D {
--	    .sfn_id =3D TFM_CRYPTO_AEAD_FINISH_SID,
-+	    .function_id =3D TFM_CRYPTO_AEAD_FINISH_SID,
- 	    .op_handle =3D op_handle,
+-		.sfn_id =3D TFM_CRYPTO_AEAD_FINISH_SID,
++		.function_id =3D TFM_CRYPTO_AEAD_FINISH_SID,
+ 		.op_handle =3D op_handle,
  	};
 =20
-@@ -436,7 +436,7 @@ static inline psa_status_t crypto_caller_aead_verify=
(
+@@ -448,7 +448,7 @@ static inline psa_status_t crypto_caller_aead_verify=
(
  	struct rpc_caller *caller =3D ipc->caller;
  	psa_status_t status;
  	struct psa_ipc_crypto_pack_iovec iov =3D {
--	    .sfn_id =3D TFM_CRYPTO_AEAD_VERIFY_SID,
-+	    .function_id =3D TFM_CRYPTO_AEAD_VERIFY_SID,
- 	    .op_handle =3D op_handle,
+-		.sfn_id =3D TFM_CRYPTO_AEAD_VERIFY_SID,
++		.function_id =3D TFM_CRYPTO_AEAD_VERIFY_SID,
+ 		.op_handle =3D op_handle,
  	};
 =20
-@@ -482,7 +482,7 @@ static inline psa_status_t crypto_caller_aead_abort(
+@@ -494,7 +494,7 @@ static inline psa_status_t crypto_caller_aead_abort(
  	struct rpc_caller *caller =3D ipc->caller;
  	psa_status_t status;
  	struct psa_ipc_crypto_pack_iovec iov =3D {
--	    .sfn_id =3D TFM_CRYPTO_AEAD_ABORT_SID,
-+	    .function_id =3D TFM_CRYPTO_AEAD_ABORT_SID,
- 	    .op_handle =3D op_handle,
+-		.sfn_id =3D TFM_CRYPTO_AEAD_ABORT_SID,
++		.function_id =3D TFM_CRYPTO_AEAD_ABORT_SID,
+ 		.op_handle =3D op_handle,
  	};
 =20
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_asymmetric_decrypt.h b/components/service/crypto/client/caller/psa_ipc=
/crypto_caller_asymmetric_decrypt.h
-index ff01815c..c387eb55 100644
+index d3e43b25f7e5..03682e7cdaa0 100644
 --- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_asym=
metric_decrypt.h
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_asym=
metric_decrypt.h
 @@ -38,7 +38,7 @@ static inline psa_status_t crypto_caller_asymmetric_de=
crypt(
@@ -202,7 +203,7 @@ index ff01815c..c387eb55 100644
  		.alg =3D alg,
  	};
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_asymmetric_encrypt.h b/components/service/crypto/client/caller/psa_ipc=
/crypto_caller_asymmetric_encrypt.h
-index 1daf1689..8eb3de45 100644
+index 124b088f94d8..60f5770e3a1e 100644
 --- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_asym=
metric_encrypt.h
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_asym=
metric_encrypt.h
 @@ -38,7 +38,7 @@ static inline psa_status_t crypto_caller_asymmetric_en=
crypt(
@@ -215,7 +216,7 @@ index 1daf1689..8eb3de45 100644
  		.alg =3D alg,
  	};
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_cipher.h b/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_cipher.h
-index fbefb28d..20aa46a5 100644
+index 8d906aeef2a0..4f885f3445ab 100644
 --- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_ciph=
er.h
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_ciph=
er.h
 @@ -34,7 +34,7 @@ static inline psa_status_t crypto_caller_cipher_encryp=
t_setup(
@@ -282,7 +283,7 @@ index fbefb28d..20aa46a5 100644
  	};
  	struct psa_invec in_vec[] =3D {
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_copy_key.h b/components/service/crypto/client/caller/psa_ipc/crypto_ca=
ller_copy_key.h
-index 9a988171..48157d7e 100644
+index b2e57e1e7255..71cf4381dfe5 100644
 --- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_copy=
_key.h
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_copy=
_key.h
 @@ -33,7 +33,7 @@ static inline psa_status_t crypto_caller_copy_key(stru=
ct service_client *context
@@ -295,7 +296,7 @@ index 9a988171..48157d7e 100644
  	};
  	struct psa_invec in_vec[] =3D {
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_destroy_key.h b/components/service/crypto/client/caller/psa_ipc/crypto=
_caller_destroy_key.h
-index d00f4faa..6d0a05e6 100644
+index 94a01580b482..85bd2b4cde97 100644
 --- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_dest=
roy_key.h
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_dest=
roy_key.h
 @@ -31,7 +31,7 @@ static inline psa_status_t crypto_caller_destroy_key(s=
truct service_client *cont
@@ -308,7 +309,7 @@ index d00f4faa..6d0a05e6 100644
  	};
  	struct psa_invec in_vec[] =3D {
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_export_key.h b/components/service/crypto/client/caller/psa_ipc/crypto_=
caller_export_key.h
-index 8ac5477f..9a6b7013 100644
+index b6dfda38bc23..5e9543085139 100644
 --- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_expo=
rt_key.h
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_expo=
rt_key.h
 @@ -34,7 +34,7 @@ static inline psa_status_t crypto_caller_export_key(st=
ruct service_client *conte
@@ -321,7 +322,7 @@ index 8ac5477f..9a6b7013 100644
  	};
  	struct psa_invec in_vec[] =3D {
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_export_public_key.h b/components/service/crypto/client/caller/psa_ipc/=
crypto_caller_export_public_key.h
-index b24c47f1..52bdd757 100644
+index d154db89bf0b..349dc6cb949c 100644
 --- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_expo=
rt_public_key.h
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_expo=
rt_public_key.h
 @@ -34,7 +34,7 @@ static inline psa_status_t crypto_caller_export_public=
_key(struct service_client
@@ -334,7 +335,7 @@ index b24c47f1..52bdd757 100644
  	};
  	struct psa_invec in_vec[] =3D {
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_generate_key.h b/components/service/crypto/client/caller/psa_ipc/crypt=
o_caller_generate_key.h
-index 1b66ed40..7ed1673b 100644
+index 41dc3a1806ec..31c6901ab88a 100644
 --- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_gene=
rate_key.h
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_gene=
rate_key.h
 @@ -32,7 +32,7 @@ static inline psa_status_t crypto_caller_generate_key(=
struct service_client *con
@@ -347,7 +348,7 @@ index 1b66ed40..7ed1673b 100644
  	struct psa_invec in_vec[] =3D {
  		{ .base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cryp=
to_pack_iovec) },
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_generate_random.h b/components/service/crypto/client/caller/psa_ipc/cr=
ypto_caller_generate_random.h
-index 7c538237..4fb87aa8 100644
+index 50437327ec2a..ce51ded30b1f 100644
 --- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_gene=
rate_random.h
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_gene=
rate_random.h
 @@ -32,7 +32,7 @@ static inline psa_status_t crypto_caller_generate_rand=
om(struct service_client *
@@ -360,7 +361,7 @@ index 7c538237..4fb87aa8 100644
  	struct psa_invec in_vec[] =3D {
  		{ .base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cryp=
to_pack_iovec) },
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_get_key_attributes.h b/components/service/crypto/client/caller/psa_ipc=
/crypto_caller_get_key_attributes.h
-index 22f1d18f..2caa3bd3 100644
+index 3531bd06147f..ea90af7df782 100644
 --- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_get_=
key_attributes.h
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_get_=
key_attributes.h
 @@ -33,7 +33,7 @@ static inline psa_status_t crypto_caller_get_key_attri=
butes(
@@ -373,7 +374,7 @@ index 22f1d18f..2caa3bd3 100644
  	};
  	struct psa_invec in_vec[] =3D {
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_hash.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller=
_hash.h
-index 9f37908a..4fb60d44 100644
+index f63e9812af6c..f7ffaf38c7d0 100644
 --- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_hash=
.h
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_hash=
.h
 @@ -33,7 +33,7 @@ static inline psa_status_t crypto_caller_hash_setup(
@@ -431,7 +432,7 @@ index 9f37908a..4fb60d44 100644
  	};
  	struct psa_invec in_vec[] =3D {
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_import_key.h b/components/service/crypto/client/caller/psa_ipc/crypto_=
caller_import_key.h
-index d4703366..1458163c 100644
+index 72a43c428adf..0c946a25488f 100644
 --- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_impo=
rt_key.h
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_impo=
rt_key.h
 @@ -33,7 +33,7 @@ static inline psa_status_t crypto_caller_import_key(st=
ruct service_client *conte
@@ -444,7 +445,7 @@ index d4703366..1458163c 100644
  	struct psa_invec in_vec[] =3D {
  		{ .base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cryp=
to_pack_iovec) },
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_key_derivation.h b/components/service/crypto/client/caller/psa_ipc/cry=
pto_caller_key_derivation.h
-index 5ce4fb6c..16be9916 100644
+index cacadf09d2c4..8bc32977535d 100644
 --- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_key_=
derivation.h
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_key_=
derivation.h
 @@ -33,7 +33,7 @@ static inline psa_status_t crypto_caller_key_derivatio=
n_setup(
@@ -538,7 +539,7 @@ index 5ce4fb6c..16be9916 100644
  		.key_id =3D private_key,
  	};
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_mac.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_=
mac.h
-index 3a820192..30222800 100644
+index a0092bfd94e7..596923387596 100644
 --- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_mac.=
h
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_mac.=
h
 @@ -34,7 +34,7 @@ static inline psa_status_t crypto_caller_mac_sign_setu=
p(
@@ -596,7 +597,7 @@ index 3a820192..30222800 100644
  	};
  	struct psa_invec in_vec[] =3D {
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_purge_key.h b/components/service/crypto/client/caller/psa_ipc/crypto_c=
aller_purge_key.h
-index a3a796e2..f6ab0978 100644
+index 36a01765b1a3..b5894e06d1ff 100644
 --- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_purg=
e_key.h
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_purg=
e_key.h
 @@ -31,7 +31,7 @@ static inline psa_status_t crypto_caller_purge_key(str=
uct service_client *contex
@@ -609,7 +610,7 @@ index a3a796e2..f6ab0978 100644
  	};
  	struct psa_invec in_vec[] =3D {
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_sign_hash.h b/components/service/crypto/client/caller/psa_ipc/crypto_c=
aller_sign_hash.h
-index 9276748d..8b53e3dc 100644
+index bebfe05c7c49..254ee5a90d89 100644
 --- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_sign=
_hash.h
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_sign=
_hash.h
 @@ -37,7 +37,7 @@ static inline psa_status_t crypto_caller_sign_hash(str=
uct service_client *contex
@@ -631,7 +632,7 @@ index 9276748d..8b53e3dc 100644
  		.alg =3D alg,
  	};
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_verify_hash.h b/components/service/crypto/client/caller/psa_ipc/crypto=
_caller_verify_hash.h
-index bcd8e0e4..c9ed865b 100644
+index d0a3850678cb..515f2a8da39f 100644
 --- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_veri=
fy_hash.h
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_veri=
fy_hash.h
 @@ -31,13 +31,13 @@ static inline psa_status_t crypto_caller_common(stru=
ct service_client *context,
@@ -651,5 +652,5 @@ index bcd8e0e4..c9ed865b 100644
  		.alg =3D alg,
  	};
 --=20
-2.25.1
+2.40.0
=20
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0006-Add-secure-storage-ipc-backend.patch b/meta-arm-bsp/recipes-security=
/trusted-services/corstone1000/0006-Add-secure-storage-ipc-backend.patch
deleted file mode 100644
index 74a83777..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0006-Ad=
d-secure-storage-ipc-backend.patch
+++ /dev/null
@@ -1,523 +0,0 @@
-From ed4371d63cb52c121be9678bc225055944286c30 Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Fri, 3 Dec 2021 19:19:24 +0000
-Subject: [PATCH 06/20] Add secure storage ipc backend
-
-Add secure storage ipc ff-m implementation which may use
-openamp as rpc to communicate with other processor.
-
-Upstream-Status: Pending
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- .../service/common/psa_ipc/service_psa_ipc.c  | 143 +++++++++++-
- .../secure_storage_ipc/component.cmake        |  14 ++
- .../secure_storage_ipc/secure_storage_ipc.c   | 214 ++++++++++++++++++
- .../secure_storage_ipc/secure_storage_ipc.h   |  52 +++++
- deployments/se-proxy/se-proxy.cmake           |   1 +
- 5 files changed, 420 insertions(+), 4 deletions(-)
- create mode 100644 components/service/secure_storage/backend/secure_sto=
rage_ipc/component.cmake
- create mode 100644 components/service/secure_storage/backend/secure_sto=
rage_ipc/secure_storage_ipc.c
- create mode 100644 components/service/secure_storage/backend/secure_sto=
rage_ipc/secure_storage_ipc.h
-
-diff --git a/components/service/common/psa_ipc/service_psa_ipc.c b/compo=
nents/service/common/psa_ipc/service_psa_ipc.c
-index e8093c20a523..95a07c135f31 100644
---- a/components/service/common/psa_ipc/service_psa_ipc.c
-+++ b/components/service/common/psa_ipc/service_psa_ipc.c
-@@ -16,6 +16,52 @@
- #include <psa/client.h>
- #include "service_psa_ipc_openamp_lib.h"
-=20
-+static struct psa_invec *psa_call_in_vec_param(uint8_t *req)
-+{
-+	return (struct psa_invec *)(req + sizeof(struct ns_openamp_msg));
-+}
-+
-+static struct psa_outvec *psa_call_out_vec_param(uint8_t *req, size_t i=
n_len)
-+{
-+	return (struct psa_outvec *)(req + sizeof(struct ns_openamp_msg) +
-+				     (in_len * sizeof(struct psa_invec)));
-+}
-+
-+static size_t psa_call_header_len(const struct psa_invec *in_vec, size_=
t in_len,
-+				  struct psa_outvec *out_vec, size_t out_len)
-+{
-+	return sizeof(struct ns_openamp_msg) + (in_len * sizeof(*in_vec)) +
-+		(out_len * sizeof(*out_vec));
-+}
-+
-+static size_t psa_call_in_vec_len(const struct psa_invec *in_vec, size_=
t in_len)
-+{
-+	size_t req_len =3D 0;
-+	int i;
-+
-+	if (!in_vec || !in_len)
-+		return 0;
-+
-+	for (i =3D 0; i < in_len; i++)
-+		req_len +=3D in_vec[i].len;
-+
-+	return req_len;
-+}
-+
-+static size_t psa_call_out_vec_len(const struct psa_outvec *out_vec, si=
ze_t out_len)
-+{
-+	size_t resp_len =3D 0;
-+	int i;
-+
-+	if (!out_vec || !out_len)
-+		return 0;
-+
-+	for (i =3D 0; i < out_len; i++)
-+		resp_len +=3D out_vec[i].len;
-+
-+	return resp_len;
-+}
-+
- psa_handle_t psa_connect(struct rpc_caller *caller, uint32_t sid,
- 			 uint32_t version)
- {
-@@ -31,7 +77,7 @@ psa_handle_t psa_connect(struct rpc_caller *caller, ui=
nt32_t sid,
- 	rpc_handle =3D rpc_caller_begin(caller, &req,
- 				      sizeof(struct ns_openamp_msg));
- 	if (!rpc_handle) {
--		EMSG("psa_connect: could not get handle");
-+		EMSG("psa_connect: could not get rpc handle");
- 		return PSA_ERROR_GENERIC_ERROR;
- 	}
-=20
-@@ -56,14 +102,100 @@ psa_handle_t psa_connect(struct rpc_caller *caller=
, uint32_t sid,
- 	return resp_msg ? (psa_handle_t)resp_msg->reply : PSA_NULL_HANDLE;
- }
-=20
--psa_status_t psa_call(struct rpc_caller *caller, psa_handle_t handle,
-+psa_status_t psa_call(struct rpc_caller *caller, psa_handle_t psa_handl=
e,
- 		      int32_t type, const struct psa_invec *in_vec,
- 		      size_t in_len, struct psa_outvec *out_vec, size_t out_len)
- {
-+	psa_status_t psa_status =3D PSA_SUCCESS;
-+	struct s_openamp_msg *resp_msg =3D NULL;
-+	struct psa_outvec *out_vec_param;
-+	struct psa_invec *in_vec_param;
-+	struct ns_openamp_msg *req_msg;
-+	rpc_call_handle rpc_handle;
-+	size_t out_vec_len;
-+	size_t in_vec_len;
-+	size_t header_len;
-+	uint8_t *payload;
-+	size_t resp_len;
-+	uint8_t *resp;
-+	uint8_t *req;
-+	int ret;
-+	int i;
-+
-+	if ((psa_handle =3D=3D PSA_NULL_HANDLE) || !caller)
-+		return PSA_ERROR_INVALID_ARGUMENT;
-+
-+	header_len =3D psa_call_header_len(in_vec, in_len, out_vec, out_len);
-+	in_vec_len =3D psa_call_in_vec_len(in_vec, in_len);
-+	out_vec_len =3D psa_call_out_vec_len(out_vec, out_len);
-=20
-+	rpc_handle =3D rpc_caller_begin(caller, &req, header_len + in_vec_len)=
;
-+	if (!rpc_handle) {
-+		EMSG("psa_call: could not get handle");
-+		return PSA_ERROR_GENERIC_ERROR;
-+	}
-+
-+	payload =3D req + header_len;
-+
-+	out_vec_param =3D psa_call_out_vec_param(req, in_len);
-+	in_vec_param =3D psa_call_in_vec_param(req);
-+
-+	req_msg =3D (struct ns_openamp_msg *)req;
-+
-+	req_msg->call_type =3D OPENAMP_PSA_CALL;
-+	req_msg->request_id =3D 1234;
-+	req_msg->params.psa_call_params.handle =3D psa_handle;
-+	req_msg->params.psa_call_params.type =3D type;
-+	req_msg->params.psa_call_params.in_len =3D in_len;
-+	req_msg->params.psa_call_params.in_vec =3D rpc_caller_virt_to_phys(cal=
ler, in_vec_param);
-+	req_msg->params.psa_call_params.out_len =3D out_len;
-+	req_msg->params.psa_call_params.out_vec =3D rpc_caller_virt_to_phys(ca=
ller, out_vec_param);
-+
-+	for (i =3D 0; i < in_len; i++) {
-+		in_vec_param[i].base =3D rpc_caller_virt_to_phys(caller, payload);
-+		in_vec_param[i].len =3D in_vec[i].len;
-+
-+		memcpy(payload, in_vec[i].base, in_vec[i].len);
-+		payload +=3D in_vec[i].len;
-+	}
-+
-+	for (i =3D 0; i < out_len; i++) {
-+		out_vec_param[i].base =3D NULL;
-+		out_vec_param[i].len =3D out_vec[i].len;
-+	}
-+
-+	ret =3D rpc_caller_invoke(caller, rpc_handle, 0, &psa_status, &resp,
-+				&resp_len);
-+	if (ret !=3D TS_RPC_CALL_ACCEPTED) {
-+		EMSG("psa_call: invoke failed: %d", ret);
-+		return PSA_ERROR_GENERIC_ERROR;
-+	}
-+
-+	if (psa_status !=3D PSA_SUCCESS) {
-+		EMSG("psa_call: psa_status invoke failed: %d", psa_status);
-+		return PSA_ERROR_GENERIC_ERROR;
-+	}
-+
-+	resp_msg =3D (struct s_openamp_msg *)resp;
-+
-+	if (!resp_msg || !out_len || resp_msg->reply !=3D PSA_SUCCESS)
-+		goto caller_end;
-+
-+	out_vec_param =3D (struct psa_outvec *)rpc_caller_phys_to_virt(caller,
-+						     resp_msg->params.out_vec);
-+
-+	for (i =3D 0; i < resp_msg->params.out_len; i++) {
-+		memcpy(out_vec[i].base, rpc_caller_phys_to_virt(caller, out_vec_param=
[i].base),
-+		       out_vec[i].len);
-+	}
-+
-+caller_end:
-+	rpc_caller_end(caller, rpc_handle);
-+
-+	return resp_msg ? resp_msg->reply : PSA_ERROR_COMMUNICATION_FAILURE;
- }
-=20
--void psa_close(struct rpc_caller *caller, psa_handle_t handle)
-+void psa_close(struct rpc_caller *caller, psa_handle_t psa_handle)
- {
- 	psa_status_t psa_status =3D PSA_SUCCESS;
- 	struct s_openamp_msg *resp_msg =3D NULL;
-@@ -74,6 +206,9 @@ void psa_close(struct rpc_caller *caller, psa_handle_=
t handle)
- 	uint8_t *req;
- 	int ret;
-=20
-+	if ((psa_handle =3D=3D PSA_NULL_HANDLE) || !caller)
-+		return;
-+
- 	rpc_handle =3D rpc_caller_begin(caller, &req,
- 				      sizeof(struct ns_openamp_msg));
- 	if (!rpc_handle) {
-@@ -84,7 +219,7 @@ void psa_close(struct rpc_caller *caller, psa_handle_=
t handle)
- 	req_msg =3D (struct ns_openamp_msg *)req;
-=20
- 	req_msg->call_type =3D OPENAMP_PSA_CLOSE;
--	req_msg->params.psa_close_params.handle =3D handle;
-+	req_msg->params.psa_close_params.handle =3D psa_handle;
-=20
- 	ret =3D rpc_caller_invoke(caller, rpc_handle, 0, &psa_status, &resp,
- 				&resp_len);
-diff --git a/components/service/secure_storage/backend/secure_storage_ip=
c/component.cmake b/components/service/secure_storage/backend/secure_stor=
age_ipc/component.cmake
-new file mode 100644
-index 000000000000..5d8f6714e0bd
---- /dev/null
-+++ b/components/service/secure_storage/backend/secure_storage_ipc/compo=
nent.cmake
-@@ -0,0 +1,14 @@
-+#----------------------------------------------------------------------=
---------
-+# Copyright (c) 2020-2021, Arm Limited and Contributors. All rights res=
erved.
-+#
-+# SPDX-License-Identifier: BSD-3-Clause
-+#
-+#----------------------------------------------------------------------=
---------
-+if (NOT DEFINED TGT)
-+	message(FATAL_ERROR "mandatory parameter TGT is not defined.")
-+endif()
-+
-+target_sources(${TGT} PRIVATE
-+	"${CMAKE_CURRENT_LIST_DIR}/secure_storage_ipc.c"
-+	)
-+
-diff --git a/components/service/secure_storage/backend/secure_storage_ip=
c/secure_storage_ipc.c b/components/service/secure_storage/backend/secure=
_storage_ipc/secure_storage_ipc.c
-new file mode 100644
-index 000000000000..9b55f77dd395
---- /dev/null
-+++ b/components/service/secure_storage/backend/secure_storage_ipc/secur=
e_storage_ipc.c
-@@ -0,0 +1,214 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include "secure_storage_ipc.h"
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <rpc_caller.h>
-+#include <string.h>
-+#include <trace.h>
-+
-+
-+static psa_status_t secure_storage_ipc_set(void *context, uint32_t clie=
nt_id,
-+			 psa_storage_uid_t uid, size_t data_length,
-+			 const void *p_data, psa_storage_create_flags_t create_flags)
-+{
-+	struct secure_storage_ipc *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->client.caller;
-+	psa_handle_t psa_handle;
-+	psa_status_t psa_status;
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D &uid, .len =3D sizeof(uid) },
-+		{ .base =3D p_data, .len =3D data_length },
-+		{ .base =3D &create_flags, .len =3D sizeof(create_flags) },
-+	};
-+
-+	(void)client_id;
-+
-+	ipc->client.rpc_status =3D TS_RPC_CALL_ACCEPTED;
-+
-+	/* Validating input parameters */
-+	if (p_data =3D=3D NULL)
-+		return PSA_ERROR_INVALID_ARGUMENT;
-+
-+	psa_status =3D psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
-+			      TFM_PS_SET, in_vec, IOVEC_LEN(in_vec), NULL, 0);
-+	if (psa_status < 0)
-+		EMSG("ipc_set: psa_call failed: %d", psa_status);
-+
-+	return psa_status;
-+}
-+
-+static psa_status_t secure_storage_ipc_get(void *context,
-+					   uint32_t client_id,
-+					   psa_storage_uid_t uid,
-+					   size_t data_offset,
-+					   size_t data_size,
-+					   void *p_data,
-+					   size_t *p_data_length)
-+{
-+	struct secure_storage_ipc *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->client.caller;
-+	psa_handle_t psa_handle;
-+	psa_status_t psa_status;
-+	uint32_t offset =3D (uint32_t)data_offset;
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D &uid, .len =3D sizeof(uid) },
-+		{ .base =3D &offset, .len =3D sizeof(offset) },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D p_data, .len =3D data_size },
-+	};
-+
-+	if (!p_data_length) {
-+		EMSG("ipc_get: p_data_length not defined");
-+		return PSA_ERROR_INVALID_ARGUMENT;
-+	}
-+
-+	psa_status =3D psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
-+			      TFM_PS_GET, in_vec, IOVEC_LEN(in_vec),
-+			      out_vec, IOVEC_LEN(out_vec));
-+	if (psa_status =3D=3D PSA_SUCCESS)
-+		*p_data_length =3D out_vec[0].len;
-+
-+	return psa_status;
-+}
-+
-+static psa_status_t secure_storage_ipc_get_info(void *context,
-+						uint32_t client_id,
-+						psa_storage_uid_t uid,
-+						struct psa_storage_info_t *p_info)
-+{
-+	struct secure_storage_ipc *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->client.caller;
-+	psa_handle_t psa_handle;
-+	psa_status_t psa_status;
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D &uid, .len =3D sizeof(uid) },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D p_info, .len =3D sizeof(*p_info) },
-+	};
-+
-+	(void)client_id;
-+
-+	/* Validating input parameters */
-+	if (!p_info)
-+		return PSA_ERROR_INVALID_ARGUMENT;
-+
-+	psa_status =3D psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
-+			      TFM_PS_GET_INFO, in_vec,
-+			      IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+	if (psa_status !=3D PSA_SUCCESS)
-+		EMSG("ipc_get_info: failed to psa_call: %d", psa_status);
-+
-+	return psa_status;
-+}
-+
-+static psa_status_t secure_storage_ipc_remove(void *context,
-+						uint32_t client_id,
-+						psa_storage_uid_t uid)
-+{
-+	struct secure_storage_ipc *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->client.caller;
-+	psa_handle_t psa_handle;
-+	psa_status_t psa_status;
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D &uid, .len =3D sizeof(uid) },
-+	};
-+
-+	(void)client_id;
-+
-+	psa_status =3D psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
-+			      TFM_PS_REMOVE, in_vec,
-+			      IOVEC_LEN(in_vec), NULL, 0);
-+	if (psa_status !=3D PSA_SUCCESS)
-+		EMSG("ipc_remove: failed to psa_call: %d", psa_status);
-+
-+	return psa_status;
-+}
-+
-+static psa_status_t secure_storage_ipc_create(void *context,
-+					      uint32_t client_id,
-+					      uint64_t uid,
-+					      size_t capacity,
-+					      uint32_t create_flags)
-+{
-+	(void)context;
-+	(void)uid;
-+	(void)client_id;
-+	(void)capacity;
-+	(void)create_flags;
-+
-+	return PSA_ERROR_NOT_SUPPORTED;
-+}
-+
-+static psa_status_t secure_storage_set_extended(void *context,
-+						uint32_t client_id,
-+						uint64_t uid,
-+						size_t data_offset,
-+						size_t data_length,
-+						const void *p_data)
-+{
-+	(void)context;
-+	(void)uid;
-+	(void)client_id;
-+	(void)data_offset;
-+	(void)data_length;
-+	(void)p_data;
-+
-+	return PSA_ERROR_NOT_SUPPORTED;
-+}
-+
-+static uint32_t secure_storage_get_support(void *context, uint32_t clie=
nt_id)
-+{
-+	struct secure_storage_ipc *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->client.caller;
-+	psa_handle_t psa_handle;
-+	psa_status_t psa_status;
-+	uint32_t support_flags;
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D &support_flags, .len =3D  sizeof(support_flags) },
-+	};
-+
-+	(void)client_id;
-+
-+	psa_status =3D psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
-+			      TFM_PS_GET_SUPPORT, NULL, 0,
-+			      out_vec, IOVEC_LEN(out_vec));
-+	if (psa_status !=3D PSA_SUCCESS)
-+		EMSG("ipc_get_support: failed to psa_call: %d", psa_status);
-+
-+	return psa_status;
-+}
-+
-+struct storage_backend *secure_storage_ipc_init(struct secure_storage_i=
pc *context,
-+						struct rpc_caller *caller)
-+{
-+	service_client_init(&context->client, caller);
-+
-+	static const struct storage_backend_interface interface =3D
-+	{
-+		.set =3D secure_storage_ipc_set,
-+		.get =3D secure_storage_ipc_get,
-+		.get_info =3D secure_storage_ipc_get_info,
-+		.remove =3D secure_storage_ipc_remove,
-+		.create =3D secure_storage_ipc_create,
-+		.set_extended =3D secure_storage_set_extended,
-+		.get_support =3D secure_storage_get_support,
-+	};
-+
-+	context->backend.context =3D context;
-+	context->backend.interface =3D &interface;
-+
-+	return &context->backend;
-+}
-+
-+void secure_storage_ipc_deinit(struct secure_storage_ipc *context)
-+{
-+	service_client_deinit(&context->client);
-+}
-diff --git a/components/service/secure_storage/backend/secure_storage_ip=
c/secure_storage_ipc.h b/components/service/secure_storage/backend/secure=
_storage_ipc/secure_storage_ipc.h
-new file mode 100644
-index 000000000000..e8c1e8fd2f92
---- /dev/null
-+++ b/components/service/secure_storage/backend/secure_storage_ipc/secur=
e_storage_ipc.h
-@@ -0,0 +1,52 @@
-+/*
-+ * Copyright (c) 2020-2021, Arm Limited and Contributors. All rights re=
served.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef SECURE_STORAGE_IPC_H
-+#define SECURE_STORAGE_IPC_H
-+
-+#include <service/secure_storage/backend/storage_backend.h>
-+#include <service/common/client/service_client.h>
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+/**
-+ * @brief      Secure storage ipc instance
-+ */
-+struct secure_storage_ipc
-+{
-+    struct storage_backend backend;
-+    struct service_client client;
-+};
-+
-+/**
-+ * @brief      Initialize a secure storage ipc client
-+ *
-+ * A secure storage client is a storage backend that makes RPC calls
-+ * to a remote secure storage provider.
-+ *
-+ * @param[in]  context    Instance data
-+ * @param[in]  rpc_caller RPC caller instance
-+ *
-+ *
-+ * @return     Pointer to inialized storage backend or NULL on failure
-+ */
-+struct storage_backend *secure_storage_ipc_init(struct secure_storage_i=
pc *context,
-+						struct rpc_caller *caller);
-+
-+/**
-+ * @brief      Deinitialize a secure storage ipc client
-+ *
-+ * @param[in]  context   Instance data
-+ */
-+void secure_storage_ipc_deinit(struct secure_storage_ipc *context);
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* SECURE_STORAGE_IPC_H */
-diff --git a/deployments/se-proxy/se-proxy.cmake b/deployments/se-proxy/=
se-proxy.cmake
-index dd0c5d00c21e..cd51460406ca 100644
---- a/deployments/se-proxy/se-proxy.cmake
-+++ b/deployments/se-proxy/se-proxy.cmake
-@@ -45,6 +45,7 @@ add_components(TARGET "se-proxy"
- 		"components/service/crypto/factory/full"
- 		"components/service/secure_storage/include"
- 		"components/service/secure_storage/frontend/secure_storage_provider"
-+		"components/service/secure_storage/backend/secure_storage_ipc"
- 		"components/service/attestation/include"
- 		"components/service/attestation/provider"
- 		"components/service/attestation/provider/serializer/packed-c"
---=20
-2.38.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0026-TF-Mv1.7-alignment-PSA-crypto-client-in-out_vec.patch b/meta-arm-bsp=
/recipes-security/trusted-services/corstone1000/0006-TF-Mv1.7-alignment-P=
SA-crypto-client-in-out_vec.patch
similarity index 80%
rename from meta-arm-bsp/recipes-security/trusted-services/corstone1000/0=
026-TF-Mv1.7-alignment-PSA-crypto-client-in-out_vec.patch
rename to meta-arm-bsp/recipes-security/trusted-services/corstone1000/000=
6-TF-Mv1.7-alignment-PSA-crypto-client-in-out_vec.patch
index 0dcdd5da..7a9bee6d 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0026-TF=
-Mv1.7-alignment-PSA-crypto-client-in-out_vec.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0006-TF=
-Mv1.7-alignment-PSA-crypto-client-in-out_vec.patch
@@ -1,7 +1,7 @@
-From ee7e13dcc14110aa16f7c6453cfe72f088857ed2 Mon Sep 17 00:00:00 2001
+From 507008e501c4f5bea0841547a052b3dffd86eb20 Mon Sep 17 00:00:00 2001
 From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
 Date: Thu, 9 Feb 2023 00:34:23 +0000
-Subject: [PATCH 3/3] TF-Mv1.7 alignment: PSA crypto client in/out_vec
+Subject: [PATCH 6/6] TF-Mv1.7 alignment: PSA crypto client in/out_vec
=20
 Few psa crypto operations have different in/out_vec expectations
 This patch is fixing the differences between psa crypto client in TS
@@ -20,6 +20,7 @@ operations:
=20
 Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
 Upstream-Status: Pending [Not submitted yet]
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
  .../crypto/client/caller/psa_ipc/crypto_caller_aead.h       | 6 ++----
  .../crypto/client/caller/psa_ipc/crypto_caller_cipher.h     | 6 ++----
@@ -27,44 +28,44 @@ Upstream-Status: Pending [Not submitted yet]
  3 files changed, 6 insertions(+), 8 deletions(-)
=20
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_aead.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller=
_aead.h
-index efdffdf7..e862c2de 100644
+index f63996a8aad3..393ba447663a 100644
 --- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_aead=
.h
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_aead=
.h
-@@ -222,14 +222,13 @@ static inline psa_status_t crypto_caller_aead_gene=
rate_nonce(
- 	    {.base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cr=
ypto_pack_iovec)},
+@@ -226,14 +226,13 @@ static inline psa_status_t crypto_caller_aead_gene=
rate_nonce(
+ 			.len =3D sizeof(struct psa_ipc_crypto_pack_iovec) },
  	};
  	struct psa_outvec out_vec[] =3D {
--	    {.base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t)},
- 	    {.base =3D psa_ptr_to_u32(nonce), .len =3D nonce_size}
+-		{ .base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t) },
+ 		{ .base =3D psa_ptr_to_u32(nonce), .len =3D nonce_size },
  	};
 =20
  	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
- 	                   IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
+ 			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
 =20
 -	*nonce_length =3D out_vec[1].len;
 +	*nonce_length =3D out_vec[0].len;
+=20
  	return status;
  }
-=20
-@@ -353,7 +352,6 @@ static inline psa_status_t crypto_caller_aead_update=
(
- 	    {.base =3D psa_ptr_const_to_u32(input), .len =3D input_length}
+@@ -364,7 +363,6 @@ static inline psa_status_t crypto_caller_aead_update=
(
+ 		{ .base =3D psa_ptr_const_to_u32(input), .len =3D input_length },
  	};
  	struct psa_outvec out_vec[] =3D {
--	    {.base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t)},
- 	    {.base =3D psa_ptr_const_to_u32(output), .len =3D output_size},
+-		{ .base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t) },
+ 		{ .base =3D psa_ptr_const_to_u32(output), .len =3D output_size },
  	};
 =20
-@@ -365,7 +363,7 @@ static inline psa_status_t crypto_caller_aead_update=
(
+@@ -376,7 +374,7 @@ static inline psa_status_t crypto_caller_aead_update=
(
  	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
- 	                   in_len, out_vec, IOVEC_LEN(out_vec));
+ 			  in_len, out_vec, IOVEC_LEN(out_vec));
 =20
 -	*output_length =3D out_vec[1].len;
 +	*output_length =3D out_vec[0].len;
+=20
  	return status;
  }
-=20
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_cipher.h b/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_cipher.h
-index 20aa46a5..948865e4 100644
+index 4f885f3445ab..0d32444b6bbf 100644
 --- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_ciph=
er.h
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_ciph=
er.h
 @@ -98,14 +98,13 @@ static inline psa_status_t crypto_caller_cipher_gene=
rate_iv(
@@ -100,7 +101,7 @@ index 20aa46a5..948865e4 100644
  	return status;
  }
 diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_hash.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller=
_hash.h
-index 4fb60d44..1e422130 100644
+index f7ffaf38c7d0..77ef4ead1d03 100644
 --- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_hash=
.h
 +++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_hash=
.h
 @@ -172,6 +172,8 @@ static inline psa_status_t crypto_caller_hash_clone(
@@ -113,5 +114,5 @@ index 4fb60d44..1e422130 100644
  	struct psa_outvec out_vec[] =3D {
  		{ .base =3D psa_ptr_to_u32(target_op_handle),
 --=20
-2.25.1
+2.40.0
=20
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0007-Use-secure-storage-ipc-and-openamp-for-se_proxy.patch b/meta-arm-bsp=
/recipes-security/trusted-services/corstone1000/0007-Use-secure-storage-i=
pc-and-openamp-for-se_proxy.patch
deleted file mode 100644
index ad33295d..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0007-Us=
e-secure-storage-ipc-and-openamp-for-se_proxy.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From d1377a5ed909e3a1d9caca56aeda262a80322a4b Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Fri, 3 Dec 2021 19:25:34 +0000
-Subject: [PATCH 07/20] Use secure storage ipc and openamp for se_proxy
-
-Remove mock up backend for secure storage in se proxy
-deployment and use instead the secure storage ipc backend with
-openamp as rpc to secure enclave side.
-
-Upstream-Status: Pending
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- .../se-proxy/common/service_proxy_factory.c      | 16 +++++++++++++---
- 1 file changed, 13 insertions(+), 3 deletions(-)
-
-diff --git a/deployments/se-proxy/common/service_proxy_factory.c b/deplo=
yments/se-proxy/common/service_proxy_factory.c
-index acfb6e8873fa..57290056d614 100644
---- a/deployments/se-proxy/common/service_proxy_factory.c
-+++ b/deployments/se-proxy/common/service_proxy_factory.c
-@@ -6,15 +6,20 @@
-=20
- #include <stddef.h>
- #include <rpc/common/endpoint/rpc_interface.h>
-+#include <rpc/openamp/caller/sp/openamp_caller.h>
- #include <service/attestation/provider/attest_provider.h>
- #include <service/attestation/provider/serializer/packed-c/packedc_atte=
st_provider_serializer.h>
- #include <service/crypto/factory/crypto_provider_factory.h>
- #include <service/secure_storage/frontend/secure_storage_provider/secur=
e_storage_provider.h>
-+#include <trace.h>
-=20
- /* Stub backends */
- #include <service/crypto/backend/stub/stub_crypto_backend.h>
-+#include <service/secure_storage/backend/secure_storage_ipc/secure_stor=
age_ipc.h>
- #include <service/secure_storage/backend/mock_store/mock_store.h>
-=20
-+struct openamp_caller openamp;
-+
- struct rpc_interface *attest_proxy_create(void)
- {
- 	struct rpc_interface *attest_iface;
-@@ -47,10 +52,15 @@ struct rpc_interface *crypto_proxy_create(void)
-=20
- struct rpc_interface *ps_proxy_create(void)
- {
--	static struct mock_store ps_backend;
- 	static struct secure_storage_provider ps_provider;
--
--	struct storage_backend *backend =3D mock_store_init(&ps_backend);
-+	static struct secure_storage_ipc ps_backend;
-+	static struct rpc_caller *storage_caller;
-+	struct storage_backend *backend;
-+
-+	storage_caller =3D openamp_caller_init(&openamp);
-+	if (!storage_caller)
-+		return NULL;
-+	backend =3D secure_storage_ipc_init(&ps_backend, &openamp.rpc_caller);
-=20
- 	return secure_storage_provider_init(&ps_provider, backend);
- }
---=20
-2.38.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0008-Run-psa-arch-test.patch b/meta-arm-bsp/recipes-security/trusted-serv=
ices/corstone1000/0008-Run-psa-arch-test.patch
deleted file mode 100644
index ab576882..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0008-Ru=
n-psa-arch-test.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 1b50ab6b6ff1c6f27ab320e18fb0d4aeb1122f0d Mon Sep 17 00:00:00 2001
-From: Satish Kumar <satish.kumar01@arm.com>
-Date: Sun, 12 Dec 2021 10:43:48 +0000
-Subject: [PATCH 08/20] Run psa-arch-test
-
-Fixes needed to run psa-arch-test
-
-Upstream-Status: Pending
-Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- components/service/common/psa_ipc/service_psa_ipc.c       | 1 +
- .../backend/secure_storage_ipc/secure_storage_ipc.c       | 8 --------
- .../service/secure_storage/include/psa/storage_common.h   | 4 ++--
- 3 files changed, 3 insertions(+), 10 deletions(-)
-
-diff --git a/components/service/common/psa_ipc/service_psa_ipc.c b/compo=
nents/service/common/psa_ipc/service_psa_ipc.c
-index 95a07c135f31..5e5815dbc9cf 100644
---- a/components/service/common/psa_ipc/service_psa_ipc.c
-+++ b/components/service/common/psa_ipc/service_psa_ipc.c
-@@ -185,6 +185,7 @@ psa_status_t psa_call(struct rpc_caller *caller, psa=
_handle_t psa_handle,
- 						     resp_msg->params.out_vec);
-=20
- 	for (i =3D 0; i < resp_msg->params.out_len; i++) {
-+                out_vec[i].len =3D out_vec_param[i].len;
- 		memcpy(out_vec[i].base, rpc_caller_phys_to_virt(caller, out_vec_param=
[i].base),
- 		       out_vec[i].len);
- 	}
-diff --git a/components/service/secure_storage/backend/secure_storage_ip=
c/secure_storage_ipc.c b/components/service/secure_storage/backend/secure=
_storage_ipc/secure_storage_ipc.c
-index 9b55f77dd395..a1f369db253e 100644
---- a/components/service/secure_storage/backend/secure_storage_ipc/secur=
e_storage_ipc.c
-+++ b/components/service/secure_storage/backend/secure_storage_ipc/secur=
e_storage_ipc.c
-@@ -31,10 +31,6 @@ static psa_status_t secure_storage_ipc_set(void *cont=
ext, uint32_t client_id,
-=20
- 	ipc->client.rpc_status =3D TS_RPC_CALL_ACCEPTED;
-=20
--	/* Validating input parameters */
--	if (p_data =3D=3D NULL)
--		return PSA_ERROR_INVALID_ARGUMENT;
--
- 	psa_status =3D psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
- 			      TFM_PS_SET, in_vec, IOVEC_LEN(in_vec), NULL, 0);
- 	if (psa_status < 0)
-@@ -96,10 +92,6 @@ static psa_status_t secure_storage_ipc_get_info(void =
*context,
-=20
- 	(void)client_id;
-=20
--	/* Validating input parameters */
--	if (!p_info)
--		return PSA_ERROR_INVALID_ARGUMENT;
--
- 	psa_status =3D psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
- 			      TFM_PS_GET_INFO, in_vec,
- 			      IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-diff --git a/components/service/secure_storage/include/psa/storage_commo=
n.h b/components/service/secure_storage/include/psa/storage_common.h
-index 4f6ba2a7d822..1fd6b40dc803 100644
---- a/components/service/secure_storage/include/psa/storage_common.h
-+++ b/components/service/secure_storage/include/psa/storage_common.h
-@@ -20,8 +20,8 @@ typedef uint64_t psa_storage_uid_t;
- typedef uint32_t psa_storage_create_flags_t;
-=20
- struct psa_storage_info_t {
--	size_t capacity;
--	size_t size;
-+	uint32_t capacity;
-+	uint32_t size;
- 	psa_storage_create_flags_t flags;
- };
-=20
---=20
-2.38.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0009-Use-address-instead-of-pointers.patch b/meta-arm-bsp/recipes-securit=
y/trusted-services/corstone1000/0009-Use-address-instead-of-pointers.patc=
h
deleted file mode 100644
index 3295fa9b..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0009-Us=
e-address-instead-of-pointers.patch
+++ /dev/null
@@ -1,168 +0,0 @@
-From a6fba503ffddae004e23b32559212e749e8586f6 Mon Sep 17 00:00:00 2001
-From: Satish Kumar <satish.kumar01@arm.com>
-Date: Sun, 12 Dec 2021 10:57:17 +0000
-Subject: [PATCH 09/20] Use address instead of pointers
-
-Since secure enclave is 32bit and we 64bit there is an issue
-in the protocol communication design that force us to handle
-on our side the manipulation of address and pointers to make
-this work.
-
-Upstream-Status: Pending
-Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- .../service/common/include/psa/client.h       | 15 ++++++++++++++
- .../service/common/psa_ipc/service_psa_ipc.c  | 20 ++++++++++++-------
- .../secure_storage_ipc/secure_storage_ipc.c   | 20 +++++++++----------
- 3 files changed, 38 insertions(+), 17 deletions(-)
-
-diff --git a/components/service/common/include/psa/client.h b/components=
/service/common/include/psa/client.h
-index 69ccf14f40a3..12dcd68f8a76 100644
---- a/components/service/common/include/psa/client.h
-+++ b/components/service/common/include/psa/client.h
-@@ -81,6 +81,21 @@ struct __attribute__ ((__packed__)) psa_outvec {
-     uint32_t len;                 /*!< the size in bytes               =
       */
- };
-=20
-+static void *psa_u32_to_ptr(uint32_t addr)
-+{
-+	return (void *)(uintptr_t)addr;
-+}
-+
-+static uint32_t psa_ptr_to_u32(void *ptr)
-+{
-+	return (uintptr_t)ptr;
-+}
-+
-+static uint32_t psa_ptr_const_to_u32(const void *ptr)
-+{
-+	return (uintptr_t)ptr;
-+}
-+
- /*************************** PSA Client API ***************************=
*******/
-=20
- /**
-diff --git a/components/service/common/psa_ipc/service_psa_ipc.c b/compo=
nents/service/common/psa_ipc/service_psa_ipc.c
-index 5e5815dbc9cf..435c6c0a2eba 100644
---- a/components/service/common/psa_ipc/service_psa_ipc.c
-+++ b/components/service/common/psa_ipc/service_psa_ipc.c
-@@ -62,6 +62,11 @@ static size_t psa_call_out_vec_len(const struct psa_o=
utvec *out_vec, size_t out_
- 	return resp_len;
- }
-=20
-+static uint32_t psa_virt_to_phys_u32(struct rpc_caller *caller, void *v=
a)
-+{
-+	return (uintptr_t)rpc_caller_virt_to_phys(caller, va);
-+}
-+
- psa_handle_t psa_connect(struct rpc_caller *caller, uint32_t sid,
- 			 uint32_t version)
- {
-@@ -147,20 +152,20 @@ psa_status_t psa_call(struct rpc_caller *caller, p=
sa_handle_t psa_handle,
- 	req_msg->params.psa_call_params.handle =3D psa_handle;
- 	req_msg->params.psa_call_params.type =3D type;
- 	req_msg->params.psa_call_params.in_len =3D in_len;
--	req_msg->params.psa_call_params.in_vec =3D rpc_caller_virt_to_phys(cal=
ler, in_vec_param);
-+	req_msg->params.psa_call_params.in_vec =3D psa_virt_to_phys_u32(caller=
, in_vec_param);
- 	req_msg->params.psa_call_params.out_len =3D out_len;
--	req_msg->params.psa_call_params.out_vec =3D rpc_caller_virt_to_phys(ca=
ller, out_vec_param);
-+	req_msg->params.psa_call_params.out_vec =3D psa_virt_to_phys_u32(calle=
r, out_vec_param);
-=20
- 	for (i =3D 0; i < in_len; i++) {
--		in_vec_param[i].base =3D rpc_caller_virt_to_phys(caller, payload);
-+		in_vec_param[i].base =3D psa_virt_to_phys_u32(caller, payload);
- 		in_vec_param[i].len =3D in_vec[i].len;
-=20
--		memcpy(payload, in_vec[i].base, in_vec[i].len);
-+		memcpy(payload, psa_u32_to_ptr(in_vec[i].base), in_vec[i].len);
- 		payload +=3D in_vec[i].len;
- 	}
-=20
- 	for (i =3D 0; i < out_len; i++) {
--		out_vec_param[i].base =3D NULL;
-+		out_vec_param[i].base =3D 0;
- 		out_vec_param[i].len =3D out_vec[i].len;
- 	}
-=20
-@@ -182,11 +187,12 @@ psa_status_t psa_call(struct rpc_caller *caller, p=
sa_handle_t psa_handle,
- 		goto caller_end;
-=20
- 	out_vec_param =3D (struct psa_outvec *)rpc_caller_phys_to_virt(caller,
--						     resp_msg->params.out_vec);
-+				psa_u32_to_ptr(resp_msg->params.out_vec));
-=20
- 	for (i =3D 0; i < resp_msg->params.out_len; i++) {
-                 out_vec[i].len =3D out_vec_param[i].len;
--		memcpy(out_vec[i].base, rpc_caller_phys_to_virt(caller, out_vec_param=
[i].base),
-+		memcpy(psa_u32_to_ptr(out_vec[i].base),
-+		       rpc_caller_phys_to_virt(caller,	psa_u32_to_ptr(out_vec_param[i=
].base)),
- 		       out_vec[i].len);
- 	}
-=20
-diff --git a/components/service/secure_storage/backend/secure_storage_ip=
c/secure_storage_ipc.c b/components/service/secure_storage/backend/secure=
_storage_ipc/secure_storage_ipc.c
-index a1f369db253e..bda442a61d5c 100644
---- a/components/service/secure_storage/backend/secure_storage_ipc/secur=
e_storage_ipc.c
-+++ b/components/service/secure_storage/backend/secure_storage_ipc/secur=
e_storage_ipc.c
-@@ -22,9 +22,9 @@ static psa_status_t secure_storage_ipc_set(void *conte=
xt, uint32_t client_id,
- 	psa_handle_t psa_handle;
- 	psa_status_t psa_status;
- 	struct psa_invec in_vec[] =3D {
--		{ .base =3D &uid, .len =3D sizeof(uid) },
--		{ .base =3D p_data, .len =3D data_length },
--		{ .base =3D &create_flags, .len =3D sizeof(create_flags) },
-+		{ .base =3D psa_ptr_to_u32(&uid), .len =3D sizeof(uid) },
-+		{ .base =3D psa_ptr_const_to_u32(p_data), .len =3D data_length },
-+		{ .base =3D psa_ptr_to_u32(&create_flags), .len =3D sizeof(create_fla=
gs) },
- 	};
-=20
- 	(void)client_id;
-@@ -53,11 +53,11 @@ static psa_status_t secure_storage_ipc_get(void *con=
text,
- 	psa_status_t psa_status;
- 	uint32_t offset =3D (uint32_t)data_offset;
- 	struct psa_invec in_vec[] =3D {
--		{ .base =3D &uid, .len =3D sizeof(uid) },
--		{ .base =3D &offset, .len =3D sizeof(offset) },
-+		{ .base =3D psa_ptr_to_u32(&uid), .len =3D sizeof(uid) },
-+		{ .base =3D psa_ptr_to_u32(&offset), .len =3D sizeof(offset) },
- 	};
- 	struct psa_outvec out_vec[] =3D {
--		{ .base =3D p_data, .len =3D data_size },
-+		{ .base =3D psa_ptr_to_u32(p_data), .len =3D data_size },
- 	};
-=20
- 	if (!p_data_length) {
-@@ -84,10 +84,10 @@ static psa_status_t secure_storage_ipc_get_info(void=
 *context,
- 	psa_handle_t psa_handle;
- 	psa_status_t psa_status;
- 	struct psa_invec in_vec[] =3D {
--		{ .base =3D &uid, .len =3D sizeof(uid) },
-+		{ .base =3D psa_ptr_to_u32(&uid), .len =3D sizeof(uid) },
- 	};
- 	struct psa_outvec out_vec[] =3D {
--		{ .base =3D p_info, .len =3D sizeof(*p_info) },
-+		{ .base =3D psa_ptr_to_u32(p_info), .len =3D sizeof(*p_info) },
- 	};
-=20
- 	(void)client_id;
-@@ -110,7 +110,7 @@ static psa_status_t secure_storage_ipc_remove(void *=
context,
- 	psa_handle_t psa_handle;
- 	psa_status_t psa_status;
- 	struct psa_invec in_vec[] =3D {
--		{ .base =3D &uid, .len =3D sizeof(uid) },
-+		{ .base =3D psa_ptr_to_u32(&uid), .len =3D sizeof(uid) },
- 	};
-=20
- 	(void)client_id;
-@@ -164,7 +164,7 @@ static uint32_t secure_storage_get_support(void *con=
text, uint32_t client_id)
- 	psa_status_t psa_status;
- 	uint32_t support_flags;
- 	struct psa_outvec out_vec[] =3D {
--		{ .base =3D &support_flags, .len =3D  sizeof(support_flags) },
-+		{ .base =3D psa_ptr_to_u32(&support_flags), .len =3D  sizeof(support_=
flags) },
- 	};
-=20
- 	(void)client_id;
---=20
-2.38.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0010-Add-psa-ipc-attestation-to-se-proxy.patch b/meta-arm-bsp/recipes-sec=
urity/trusted-services/corstone1000/0010-Add-psa-ipc-attestation-to-se-pr=
oxy.patch
deleted file mode 100644
index 2d0725cb..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0010-Ad=
d-psa-ipc-attestation-to-se-proxy.patch
+++ /dev/null
@@ -1,323 +0,0 @@
-From b142f3c162fb1c28982d26b5ac2181ba79197a28 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Tue, 7 Dec 2021 11:50:00 +0000
-Subject: [PATCH 10/20] Add psa ipc attestation to se proxy
-
-Implement attestation client API as psa ipc and include it to
-se proxy deployment.
-
-Upstream-Status: Pending
-Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- .../client/psa_ipc/component.cmake            | 13 +++
- .../client/psa_ipc/iat_ipc_client.c           | 86 +++++++++++++++++++
- .../reporter/psa_ipc/component.cmake          | 13 +++
- .../reporter/psa_ipc/psa_ipc_attest_report.c  | 45 ++++++++++
- components/service/common/include/psa/sid.h   |  4 +
- .../se-proxy/common/service_proxy_factory.c   |  6 ++
- deployments/se-proxy/se-proxy.cmake           |  7 +-
- ...ble-using-hard-coded-attestation-key.patch | 29 -------
- external/psa_arch_tests/psa_arch_tests.cmake  |  4 -
- 9 files changed, 171 insertions(+), 36 deletions(-)
- create mode 100644 components/service/attestation/client/psa_ipc/compon=
ent.cmake
- create mode 100644 components/service/attestation/client/psa_ipc/iat_ip=
c_client.c
- create mode 100644 components/service/attestation/reporter/psa_ipc/comp=
onent.cmake
- create mode 100644 components/service/attestation/reporter/psa_ipc/psa_=
ipc_attest_report.c
- delete mode 100644 external/psa_arch_tests/0001-Disable-using-hard-code=
d-attestation-key.patch
-
-diff --git a/components/service/attestation/client/psa_ipc/component.cma=
ke b/components/service/attestation/client/psa_ipc/component.cmake
-new file mode 100644
-index 000000000000..a5bc6b4a387e
---- /dev/null
-+++ b/components/service/attestation/client/psa_ipc/component.cmake
-@@ -0,0 +1,13 @@
-+#----------------------------------------------------------------------=
---------
-+# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved=
.
-+#
-+# SPDX-License-Identifier: BSD-3-Clause
-+#
-+#----------------------------------------------------------------------=
---------
-+if (NOT DEFINED TGT)
-+	message(FATAL_ERROR "mandatory parameter TGT is not defined.")
-+endif()
-+
-+target_sources(${TGT} PRIVATE
-+	"${CMAKE_CURRENT_LIST_DIR}/iat_ipc_client.c"
-+	)
-diff --git a/components/service/attestation/client/psa_ipc/iat_ipc_clien=
t.c b/components/service/attestation/client/psa_ipc/iat_ipc_client.c
-new file mode 100644
-index 000000000000..30bd0a13a385
---- /dev/null
-+++ b/components/service/attestation/client/psa_ipc/iat_ipc_client.c
-@@ -0,0 +1,86 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#include <stddef.h>
-+#include <string.h>
-+
-+#include "../psa/iat_client.h"
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <psa/initial_attestation.h>
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <service/common/client/service_client.h>
-+
-+/**
-+ * @brief      The singleton psa_iat_client instance
-+ *
-+ * The psa attestation C API assumes a single backend service provider.
-+ */
-+static struct service_client instance;
-+
-+
-+psa_status_t psa_iat_client_init(struct rpc_caller *caller)
-+{
-+	return service_client_init(&instance, caller);
-+}
-+
-+void psa_iat_client_deinit(void)
-+{
-+	service_client_deinit(&instance);
-+}
-+
-+int psa_iat_client_rpc_status(void)
-+{
-+	return instance.rpc_status;
-+}
-+
-+psa_status_t psa_initial_attest_get_token(const uint8_t *auth_challenge=
,
-+					  size_t challenge_size,
-+					  uint8_t *token_buf,
-+					  size_t token_buf_size,
-+					  size_t *token_size)
-+{
-+	psa_status_t status =3D PSA_ERROR_INVALID_ARGUMENT;
-+	struct rpc_caller *caller =3D instance.caller;
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_const_to_u32(auth_challenge), .len =3D challenge_=
size},
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(token_buf), .len =3D token_buf_size},
-+	};
-+
-+	if (!token_buf || !token_buf_size)
-+		return PSA_ERROR_INVALID_ARGUMENT;
-+
-+	status =3D psa_call(caller, TFM_ATTESTATION_SERVICE_HANDLE,
-+			  TFM_ATTEST_GET_TOKEN, in_vec, IOVEC_LEN(in_vec),
-+			  out_vec, IOVEC_LEN(out_vec));
-+	if (status =3D=3D PSA_SUCCESS) {
-+		*token_size =3D out_vec[0].len;
-+	}
-+
-+	return status;
-+}
-+
-+psa_status_t psa_initial_attest_get_token_size(size_t challenge_size,
-+						size_t *token_size)
-+{
-+	struct rpc_caller *caller =3D instance.caller;
-+	psa_status_t status;
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&challenge_size), .len =3D sizeof(uint32_t=
)}
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(token_size), .len =3D sizeof(uint32_t)}
-+	};
-+
-+	status =3D psa_call(caller, TFM_ATTESTATION_SERVICE_HANDLE,
-+			  TFM_ATTEST_GET_TOKEN_SIZE,
-+			  in_vec, IOVEC_LEN(in_vec),
-+			  out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-diff --git a/components/service/attestation/reporter/psa_ipc/component.c=
make b/components/service/attestation/reporter/psa_ipc/component.cmake
-new file mode 100644
-index 000000000000..b37830c618fe
---- /dev/null
-+++ b/components/service/attestation/reporter/psa_ipc/component.cmake
-@@ -0,0 +1,13 @@
-+#----------------------------------------------------------------------=
---------
-+# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved=
.
-+#
-+# SPDX-License-Identifier: BSD-3-Clause
-+#
-+#----------------------------------------------------------------------=
---------
-+if (NOT DEFINED TGT)
-+	message(FATAL_ERROR "mandatory parameter TGT is not defined.")
-+endif()
-+
-+target_sources(${TGT} PRIVATE
-+	"${CMAKE_CURRENT_LIST_DIR}/psa_ipc_attest_report.c"
-+	)
-diff --git a/components/service/attestation/reporter/psa_ipc/psa_ipc_att=
est_report.c b/components/service/attestation/reporter/psa_ipc/psa_ipc_at=
test_report.c
-new file mode 100644
-index 000000000000..15805e8ed4b1
---- /dev/null
-+++ b/components/service/attestation/reporter/psa_ipc/psa_ipc_attest_rep=
ort.c
-@@ -0,0 +1,45 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+/**
-+ * A attestation reporter for psa ipc
-+ */
-+
-+#include <stddef.h>
-+#include <psa/error.h>
-+#include <service/attestation/reporter/attest_report.h>
-+#include <psa/initial_attestation.h>
-+
-+#define TOKEN_BUF_SIZE	1024
-+
-+static uint8_t token_buf[TOKEN_BUF_SIZE];
-+
-+int attest_report_create(int32_t client_id, const uint8_t *auth_challen=
ge_data,
-+			 size_t auth_challenge_len, const uint8_t **report,
-+			 size_t *report_len)
-+{
-+	*report =3D token_buf;
-+	psa_status_t ret;
-+	size_t token_size =3D 0;
-+
-+	ret =3D psa_initial_attest_get_token(auth_challenge_data,
-+					   auth_challenge_len, token_buf,
-+					   TOKEN_BUF_SIZE, &token_size);
-+	if (ret !=3D PSA_SUCCESS) {
-+		*report =3D NULL;
-+		*report_len =3D 0;
-+		return ret;
-+	}
-+
-+	*report_len =3D token_size;
-+
-+	return PSA_SUCCESS;
-+}
-+
-+void attest_report_destroy(const uint8_t *report)
-+{
-+	(void)report;
-+}
-diff --git a/components/service/common/include/psa/sid.h b/components/se=
rvice/common/include/psa/sid.h
-index aaa973c6e987..833f5039425f 100644
---- a/components/service/common/include/psa/sid.h
-+++ b/components/service/common/include/psa/sid.h
-@@ -50,6 +50,10 @@ extern "C" {
- #define TFM_ATTESTATION_SERVICE_VERSION                            (1U)
- #define TFM_ATTESTATION_SERVICE_HANDLE                             (0x4=
0000103U)
-=20
-+/* Initial Attestation message types that distinguish Attest services. =
*/
-+#define TFM_ATTEST_GET_TOKEN       1001
-+#define TFM_ATTEST_GET_TOKEN_SIZE  1002
-+
- /******** TFM_SP_FWU ********/
- #define TFM_FWU_WRITE_SID                                          (0x0=
00000A0U)
- #define TFM_FWU_WRITE_VERSION                                      (1U)
-diff --git a/deployments/se-proxy/common/service_proxy_factory.c b/deplo=
yments/se-proxy/common/service_proxy_factory.c
-index 57290056d614..4b8cceccbe4d 100644
---- a/deployments/se-proxy/common/service_proxy_factory.c
-+++ b/deployments/se-proxy/common/service_proxy_factory.c
-@@ -23,12 +23,18 @@ struct openamp_caller openamp;
- struct rpc_interface *attest_proxy_create(void)
- {
- 	struct rpc_interface *attest_iface;
-+	struct rpc_caller *attest_caller;
-=20
- 	/* Static objects for proxy instance */
- 	static struct attest_provider attest_provider;
-=20
-+	attest_caller =3D openamp_caller_init(&openamp);
-+	if (!attest_caller)
-+		return NULL;
-+
- 	/* Initialize the service provider */
- 	attest_iface =3D attest_provider_init(&attest_provider);
-+	psa_iat_client_init(&openamp.rpc_caller);
-=20
- 	attest_provider_register_serializer(&attest_provider,
- 		TS_RPC_ENCODING_PACKED_C, packedc_attest_provider_serializer_instance=
());
-diff --git a/deployments/se-proxy/se-proxy.cmake b/deployments/se-proxy/=
se-proxy.cmake
-index cd51460406ca..3dbbc36c968d 100644
---- a/deployments/se-proxy/se-proxy.cmake
-+++ b/deployments/se-proxy/se-proxy.cmake
-@@ -49,14 +49,15 @@ add_components(TARGET "se-proxy"
- 		"components/service/attestation/include"
- 		"components/service/attestation/provider"
- 		"components/service/attestation/provider/serializer/packed-c"
-+		"components/service/attestation/reporter/psa_ipc"
-+		"components/service/attestation/client/psa_ipc"
- 		"components/rpc/openamp/caller/sp"
-=20
- 		# Stub service provider backends
- 		"components/rpc/dummy"
- 		"components/rpc/common/caller"
--		"components/service/attestation/reporter/stub"
--		"components/service/attestation/key_mngr/stub"
--		"components/service/crypto/backend/stub"
-+		"components/service/attestation/key_mngr/local"
-+		"components/service/crypto/backend/psa_ipc"
- 		"components/service/crypto/client/psa"
- 		"components/service/secure_storage/backend/mock_store"
- )
-diff --git a/external/psa_arch_tests/0001-Disable-using-hard-coded-attes=
tation-key.patch b/external/psa_arch_tests/0001-Disable-using-hard-coded-=
attestation-key.patch
-deleted file mode 100644
-index 6664961ab662..000000000000
---- a/external/psa_arch_tests/0001-Disable-using-hard-coded-attestation-=
key.patch
-+++ /dev/null
-@@ -1,29 +0,0 @@
--From dbd25f94eb62a9855bf342dd97503a49ea50f83e Mon Sep 17 00:00:00 2001
--From: Gyorgy Szing <Gyorgy.Szing@arm.com>
--Date: Tue, 8 Feb 2022 17:06:37 +0000
--Subject: [PATCH 1/1] Disable using hard-coded attestation key
--
--Modify platform config to disable using a hard-coded attestation
--key.
--
--Signed-off-by: Gyorgy Szing <Gyorgy.Szing@arm.com>
-----
-- api-tests/platform/targets/tgt_dev_apis_linux/nspe/pal_config.h | 2 +-
-- 1 file changed, 1 insertion(+), 1 deletion(-)
--
--diff --git a/api-tests/platform/targets/tgt_dev_apis_linux/nspe/pal_con=
fig.h b/api-tests/platform/targets/tgt_dev_apis_linux/nspe/pal_config.h
--index 6112ba7..1cdf581 100755
----- a/api-tests/platform/targets/tgt_dev_apis_linux/nspe/pal_config.h
--+++ b/api-tests/platform/targets/tgt_dev_apis_linux/nspe/pal_config.h
--@@ -60,7 +60,7 @@ typedef uint32_t            cfg_id_t;
-- #define CRYPTO_VERSION_BETA3
--=20
-- /* Use hardcoded public key */
---#define PLATFORM_OVERRIDE_ATTEST_PK
--+//#define PLATFORM_OVERRIDE_ATTEST_PK
--=20
-- /*
--  * Include of PSA defined Header files
----=20
--2.17.1
--
-diff --git a/external/psa_arch_tests/psa_arch_tests.cmake b/external/psa=
_arch_tests/psa_arch_tests.cmake
-index a8b77a1fc05e..1995df3e0b49 100644
---- a/external/psa_arch_tests/psa_arch_tests.cmake
-+++ b/external/psa_arch_tests/psa_arch_tests.cmake
-@@ -15,10 +15,6 @@ set(GIT_OPTIONS
- 	GIT_REPOSITORY ${PSA_ARCH_TESTS_URL}
- 	GIT_TAG ${PSA_ARCH_TESTS_REFSPEC}
- 	GIT_SHALLOW FALSE
--	PATCH_COMMAND git stash
--		COMMAND git tag -f ts-before-am
--		COMMAND git am ${CMAKE_CURRENT_LIST_DIR}/0001-Disable-using-hard-code=
d-attestation-key.patch
--		COMMAND git reset ts-before-am
- )
-=20
- # Ensure list of defines is separated correctly
---=20
-2.38.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0011-Setup-its-backend-as-openamp-rpc-using-secure-storag.patch b/meta-ar=
m-bsp/recipes-security/trusted-services/corstone1000/0011-Setup-its-backe=
nd-as-openamp-rpc-using-secure-storag.patch
deleted file mode 100644
index 5803cc17..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0011-Se=
tup-its-backend-as-openamp-rpc-using-secure-storag.patch
+++ /dev/null
@@ -1,163 +0,0 @@
-From 4240977f7c38950f5edb316bb08ae05cb7b99875 Mon Sep 17 00:00:00 2001
-From: Satish Kumar <satish.kumar01@arm.com>
-Date: Thu, 9 Dec 2021 14:11:06 +0000
-Subject: [PATCH 11/20] Setup its backend as openamp rpc using secure sto=
rage
- ipc implementation.
-
-Upstream-Status: Pending
-Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- components/service/common/include/psa/sid.h   | 12 +++++-----
- .../secure_storage_ipc/secure_storage_ipc.c   | 20 ++++++++---------
- .../secure_storage_ipc/secure_storage_ipc.h   |  1 +
- .../se-proxy/common/service_proxy_factory.c   | 22 +++++++++++++------
- 4 files changed, 32 insertions(+), 23 deletions(-)
-
-diff --git a/components/service/common/include/psa/sid.h b/components/se=
rvice/common/include/psa/sid.h
-index 833f5039425f..4a951d4a3502 100644
---- a/components/service/common/include/psa/sid.h
-+++ b/components/service/common/include/psa/sid.h
-@@ -20,12 +20,12 @@ extern "C" {
- /* Invalid UID */
- #define TFM_PS_INVALID_UID 0
-=20
--/* PS message types that distinguish PS services. */
--#define TFM_PS_SET                1001
--#define TFM_PS_GET                1002
--#define TFM_PS_GET_INFO           1003
--#define TFM_PS_REMOVE             1004
--#define TFM_PS_GET_SUPPORT        1005
-+/* PS / ITS message types that distinguish PS services. */
-+#define TFM_PS_ITS_SET                1001
-+#define TFM_PS_ITS_GET                1002
-+#define TFM_PS_ITS_GET_INFO           1003
-+#define TFM_PS_ITS_REMOVE             1004
-+#define TFM_PS_ITS_GET_SUPPORT        1005
-=20
- /******** TFM_SP_ITS ********/
- #define TFM_INTERNAL_TRUSTED_STORAGE_SERVICE_SID                   (0x0=
0000070U)
-diff --git a/components/service/secure_storage/backend/secure_storage_ip=
c/secure_storage_ipc.c b/components/service/secure_storage/backend/secure=
_storage_ipc/secure_storage_ipc.c
-index bda442a61d5c..0e1b48c0d2e2 100644
---- a/components/service/secure_storage/backend/secure_storage_ipc/secur=
e_storage_ipc.c
-+++ b/components/service/secure_storage/backend/secure_storage_ipc/secur=
e_storage_ipc.c
-@@ -31,8 +31,8 @@ static psa_status_t secure_storage_ipc_set(void *conte=
xt, uint32_t client_id,
-=20
- 	ipc->client.rpc_status =3D TS_RPC_CALL_ACCEPTED;
-=20
--	psa_status =3D psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
--			      TFM_PS_SET, in_vec, IOVEC_LEN(in_vec), NULL, 0);
-+	psa_status =3D psa_call(caller, ipc->service_handle, TFM_PS_ITS_SET,
-+			      in_vec, IOVEC_LEN(in_vec), NULL, 0);
- 	if (psa_status < 0)
- 		EMSG("ipc_set: psa_call failed: %d", psa_status);
-=20
-@@ -65,8 +65,8 @@ static psa_status_t secure_storage_ipc_get(void *conte=
xt,
- 		return PSA_ERROR_INVALID_ARGUMENT;
- 	}
-=20
--	psa_status =3D psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
--			      TFM_PS_GET, in_vec, IOVEC_LEN(in_vec),
-+	psa_status =3D psa_call(caller, ipc->service_handle,
-+			      TFM_PS_ITS_GET, in_vec, IOVEC_LEN(in_vec),
- 			      out_vec, IOVEC_LEN(out_vec));
- 	if (psa_status =3D=3D PSA_SUCCESS)
- 		*p_data_length =3D out_vec[0].len;
-@@ -92,8 +92,8 @@ static psa_status_t secure_storage_ipc_get_info(void *=
context,
-=20
- 	(void)client_id;
-=20
--	psa_status =3D psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
--			      TFM_PS_GET_INFO, in_vec,
-+	psa_status =3D psa_call(caller, ipc->service_handle,
-+			      TFM_PS_ITS_GET_INFO, in_vec,
- 			      IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
- 	if (psa_status !=3D PSA_SUCCESS)
- 		EMSG("ipc_get_info: failed to psa_call: %d", psa_status);
-@@ -115,8 +115,8 @@ static psa_status_t secure_storage_ipc_remove(void *=
context,
-=20
- 	(void)client_id;
-=20
--	psa_status =3D psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
--			      TFM_PS_REMOVE, in_vec,
-+	psa_status =3D psa_call(caller, ipc->service_handle,
-+			      TFM_PS_ITS_REMOVE, in_vec,
- 			      IOVEC_LEN(in_vec), NULL, 0);
- 	if (psa_status !=3D PSA_SUCCESS)
- 		EMSG("ipc_remove: failed to psa_call: %d", psa_status);
-@@ -169,8 +169,8 @@ static uint32_t secure_storage_get_support(void *con=
text, uint32_t client_id)
-=20
- 	(void)client_id;
-=20
--	psa_status =3D psa_call(caller, TFM_PROTECTED_STORAGE_SERVICE_HANDLE,
--			      TFM_PS_GET_SUPPORT, NULL, 0,
-+	psa_status =3D psa_call(caller, ipc->service_handle,
-+			      TFM_PS_ITS_GET_SUPPORT, NULL, 0,
- 			      out_vec, IOVEC_LEN(out_vec));
- 	if (psa_status !=3D PSA_SUCCESS)
- 		EMSG("ipc_get_support: failed to psa_call: %d", psa_status);
-diff --git a/components/service/secure_storage/backend/secure_storage_ip=
c/secure_storage_ipc.h b/components/service/secure_storage/backend/secure=
_storage_ipc/secure_storage_ipc.h
-index e8c1e8fd2f92..d9949f6a9305 100644
---- a/components/service/secure_storage/backend/secure_storage_ipc/secur=
e_storage_ipc.h
-+++ b/components/service/secure_storage/backend/secure_storage_ipc/secur=
e_storage_ipc.h
-@@ -21,6 +21,7 @@ struct secure_storage_ipc
- {
-     struct storage_backend backend;
-     struct service_client client;
-+    int32_t service_handle;
- };
-=20
- /**
-diff --git a/deployments/se-proxy/common/service_proxy_factory.c b/deplo=
yments/se-proxy/common/service_proxy_factory.c
-index 4b8cceccbe4d..1110ac46bf8b 100644
---- a/deployments/se-proxy/common/service_proxy_factory.c
-+++ b/deployments/se-proxy/common/service_proxy_factory.c
-@@ -5,6 +5,7 @@
-  */
-=20
- #include <stddef.h>
-+#include <psa/sid.h>
- #include <rpc/common/endpoint/rpc_interface.h>
- #include <rpc/openamp/caller/sp/openamp_caller.h>
- #include <service/attestation/provider/attest_provider.h>
-@@ -60,23 +61,30 @@ struct rpc_interface *ps_proxy_create(void)
- {
- 	static struct secure_storage_provider ps_provider;
- 	static struct secure_storage_ipc ps_backend;
--	static struct rpc_caller *storage_caller;
-+	struct rpc_caller *storage_caller;
- 	struct storage_backend *backend;
-=20
- 	storage_caller =3D openamp_caller_init(&openamp);
- 	if (!storage_caller)
- 		return NULL;
- 	backend =3D secure_storage_ipc_init(&ps_backend, &openamp.rpc_caller);
-+	ps_backend.service_handle =3D TFM_PROTECTED_STORAGE_SERVICE_HANDLE;
-=20
- 	return secure_storage_provider_init(&ps_provider, backend);
- }
-=20
- struct rpc_interface *its_proxy_create(void)
- {
--	static struct mock_store its_backend;
--	static struct secure_storage_provider its_provider;
--
--	struct storage_backend *backend =3D mock_store_init(&its_backend);
--
--	return secure_storage_provider_init(&its_provider, backend);
-+        static struct secure_storage_provider its_provider;
-+        static struct secure_storage_ipc its_backend;
-+        struct rpc_caller *storage_caller;
-+        struct storage_backend *backend;
-+=20
-+        storage_caller =3D openamp_caller_init(&openamp);
-+        if (!storage_caller)
-+        	return NULL;
-+        backend =3D secure_storage_ipc_init(&its_backend, &openamp.rpc_=
caller);
-+        its_backend.service_handle =3D TFM_INTERNAL_TRUSTED_STORAGE_SER=
VICE_HANDLE;
-+=20
-+        return secure_storage_provider_init(&its_provider, backend);
- }
---=20
-2.38.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0012-add-psa-ipc-crypto-backend.patch b/meta-arm-bsp/recipes-security/tru=
sted-services/corstone1000/0012-add-psa-ipc-crypto-backend.patch
deleted file mode 100644
index 67ea7b8c..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0012-ad=
d-psa-ipc-crypto-backend.patch
+++ /dev/null
@@ -1,2570 +0,0 @@
-From 0b5d96b1a9f927dc141047600edf2249af7022c5 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Thu, 9 Dec 2021 14:17:39 +0000
-Subject: [PATCH 12/20] add psa ipc crypto backend
-
-Add psa ipc crypto backend and attach it to se proxy
-deployment.
-
-Upstream-Status: Pending
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- components/service/common/include/psa/sid.h   |  73 +++++
- .../crypto/backend/psa_ipc/component.cmake    |  21 ++
- .../backend/psa_ipc/crypto_ipc_backend.c      |  26 ++
- .../backend/psa_ipc/crypto_ipc_backend.h      |  70 ++++
- .../client/caller/psa_ipc/crypto_caller.h     |  34 ++
- .../caller/psa_ipc/crypto_caller_aead.h       | 252 +++++++++++++++
- .../crypto_caller_asymmetric_decrypt.h        |  76 +++++
- .../crypto_caller_asymmetric_encrypt.h        |  76 +++++
- .../caller/psa_ipc/crypto_caller_cipher.h     | 246 +++++++++++++++
- .../caller/psa_ipc/crypto_caller_copy_key.h   |  57 ++++
- .../psa_ipc/crypto_caller_destroy_key.h       |  51 +++
- .../caller/psa_ipc/crypto_caller_export_key.h |  59 ++++
- .../psa_ipc/crypto_caller_export_public_key.h |  59 ++++
- .../psa_ipc/crypto_caller_generate_key.h      |  55 ++++
- .../psa_ipc/crypto_caller_generate_random.h   |  57 ++++
- .../crypto_caller_get_key_attributes.h        |  56 ++++
- .../caller/psa_ipc/crypto_caller_hash.h       | 220 +++++++++++++
- .../caller/psa_ipc/crypto_caller_import_key.h |  57 ++++
- .../psa_ipc/crypto_caller_key_attributes.h    |  51 +++
- .../psa_ipc/crypto_caller_key_derivation.h    | 298 ++++++++++++++++++
- .../client/caller/psa_ipc/crypto_caller_mac.h | 207 ++++++++++++
- .../caller/psa_ipc/crypto_caller_purge_key.h  |  51 +++
- .../caller/psa_ipc/crypto_caller_sign_hash.h  |  64 ++++
- .../psa_ipc/crypto_caller_verify_hash.h       |  59 ++++
- .../crypto/include/psa/crypto_client_struct.h |   8 +-
- .../service/crypto/include/psa/crypto_sizes.h |   2 +-
- .../se-proxy/common/service_proxy_factory.c   |  15 +-
- .../providers/arm/corstone1000/platform.cmake |   2 +
- 28 files changed, 2292 insertions(+), 10 deletions(-)
- create mode 100644 components/service/crypto/backend/psa_ipc/component.=
cmake
- create mode 100644 components/service/crypto/backend/psa_ipc/crypto_ipc=
_backend.c
- create mode 100644 components/service/crypto/backend/psa_ipc/crypto_ipc=
_backend.h
- create mode 100644 components/service/crypto/client/caller/psa_ipc/cryp=
to_caller.h
- create mode 100644 components/service/crypto/client/caller/psa_ipc/cryp=
to_caller_aead.h
- create mode 100644 components/service/crypto/client/caller/psa_ipc/cryp=
to_caller_asymmetric_decrypt.h
- create mode 100644 components/service/crypto/client/caller/psa_ipc/cryp=
to_caller_asymmetric_encrypt.h
- create mode 100644 components/service/crypto/client/caller/psa_ipc/cryp=
to_caller_cipher.h
- create mode 100644 components/service/crypto/client/caller/psa_ipc/cryp=
to_caller_copy_key.h
- create mode 100644 components/service/crypto/client/caller/psa_ipc/cryp=
to_caller_destroy_key.h
- create mode 100644 components/service/crypto/client/caller/psa_ipc/cryp=
to_caller_export_key.h
- create mode 100644 components/service/crypto/client/caller/psa_ipc/cryp=
to_caller_export_public_key.h
- create mode 100644 components/service/crypto/client/caller/psa_ipc/cryp=
to_caller_generate_key.h
- create mode 100644 components/service/crypto/client/caller/psa_ipc/cryp=
to_caller_generate_random.h
- create mode 100644 components/service/crypto/client/caller/psa_ipc/cryp=
to_caller_get_key_attributes.h
- create mode 100644 components/service/crypto/client/caller/psa_ipc/cryp=
to_caller_hash.h
- create mode 100644 components/service/crypto/client/caller/psa_ipc/cryp=
to_caller_import_key.h
- create mode 100644 components/service/crypto/client/caller/psa_ipc/cryp=
to_caller_key_attributes.h
- create mode 100644 components/service/crypto/client/caller/psa_ipc/cryp=
to_caller_key_derivation.h
- create mode 100644 components/service/crypto/client/caller/psa_ipc/cryp=
to_caller_mac.h
- create mode 100644 components/service/crypto/client/caller/psa_ipc/cryp=
to_caller_purge_key.h
- create mode 100644 components/service/crypto/client/caller/psa_ipc/cryp=
to_caller_sign_hash.h
- create mode 100644 components/service/crypto/client/caller/psa_ipc/cryp=
to_caller_verify_hash.h
-
-diff --git a/components/service/common/include/psa/sid.h b/components/se=
rvice/common/include/psa/sid.h
-index 4a951d4a3502..7a29cc253bad 100644
---- a/components/service/common/include/psa/sid.h
-+++ b/components/service/common/include/psa/sid.h
-@@ -37,6 +37,79 @@ extern "C" {
- #define TFM_CRYPTO_VERSION                                         (1U)
- #define TFM_CRYPTO_HANDLE                                          (0x4=
0000100U)
-=20
-+/**
-+ * \brief Define a progressive numerical value for each SID which can b=
e used
-+ *        when dispatching the requests to the service
-+ */
-+enum {
-+    TFM_CRYPTO_GET_KEY_ATTRIBUTES_SID =3D (0u),
-+    TFM_CRYPTO_RESET_KEY_ATTRIBUTES_SID,
-+    TFM_CRYPTO_OPEN_KEY_SID,
-+    TFM_CRYPTO_CLOSE_KEY_SID,
-+    TFM_CRYPTO_IMPORT_KEY_SID,
-+    TFM_CRYPTO_DESTROY_KEY_SID,
-+    TFM_CRYPTO_EXPORT_KEY_SID,
-+    TFM_CRYPTO_EXPORT_PUBLIC_KEY_SID,
-+    TFM_CRYPTO_PURGE_KEY_SID,
-+    TFM_CRYPTO_COPY_KEY_SID,
-+    TFM_CRYPTO_HASH_COMPUTE_SID,
-+    TFM_CRYPTO_HASH_COMPARE_SID,
-+    TFM_CRYPTO_HASH_SETUP_SID,
-+    TFM_CRYPTO_HASH_UPDATE_SID,
-+    TFM_CRYPTO_HASH_FINISH_SID,
-+    TFM_CRYPTO_HASH_VERIFY_SID,
-+    TFM_CRYPTO_HASH_ABORT_SID,
-+    TFM_CRYPTO_HASH_CLONE_SID,
-+    TFM_CRYPTO_MAC_COMPUTE_SID,
-+    TFM_CRYPTO_MAC_VERIFY_SID,
-+    TFM_CRYPTO_MAC_SIGN_SETUP_SID,
-+    TFM_CRYPTO_MAC_VERIFY_SETUP_SID,
-+    TFM_CRYPTO_MAC_UPDATE_SID,
-+    TFM_CRYPTO_MAC_SIGN_FINISH_SID,
-+    TFM_CRYPTO_MAC_VERIFY_FINISH_SID,
-+    TFM_CRYPTO_MAC_ABORT_SID,
-+    TFM_CRYPTO_CIPHER_ENCRYPT_SID,
-+    TFM_CRYPTO_CIPHER_DECRYPT_SID,
-+    TFM_CRYPTO_CIPHER_ENCRYPT_SETUP_SID,
-+    TFM_CRYPTO_CIPHER_DECRYPT_SETUP_SID,
-+    TFM_CRYPTO_CIPHER_GENERATE_IV_SID,
-+    TFM_CRYPTO_CIPHER_SET_IV_SID,
-+    TFM_CRYPTO_CIPHER_UPDATE_SID,
-+    TFM_CRYPTO_CIPHER_FINISH_SID,
-+    TFM_CRYPTO_CIPHER_ABORT_SID,
-+    TFM_CRYPTO_AEAD_ENCRYPT_SID,
-+    TFM_CRYPTO_AEAD_DECRYPT_SID,
-+    TFM_CRYPTO_AEAD_ENCRYPT_SETUP_SID,
-+    TFM_CRYPTO_AEAD_DECRYPT_SETUP_SID,
-+    TFM_CRYPTO_AEAD_GENERATE_NONCE_SID,
-+    TFM_CRYPTO_AEAD_SET_NONCE_SID,
-+    TFM_CRYPTO_AEAD_SET_LENGTHS_SID,
-+    TFM_CRYPTO_AEAD_UPDATE_AD_SID,
-+    TFM_CRYPTO_AEAD_UPDATE_SID,
-+    TFM_CRYPTO_AEAD_FINISH_SID,
-+    TFM_CRYPTO_AEAD_VERIFY_SID,
-+    TFM_CRYPTO_AEAD_ABORT_SID,
-+    TFM_CRYPTO_SIGN_MESSAGE_SID,
-+    TFM_CRYPTO_VERIFY_MESSAGE_SID,
-+    TFM_CRYPTO_SIGN_HASH_SID,
-+    TFM_CRYPTO_VERIFY_HASH_SID,
-+    TFM_CRYPTO_ASYMMETRIC_ENCRYPT_SID,
-+    TFM_CRYPTO_ASYMMETRIC_DECRYPT_SID,
-+    TFM_CRYPTO_KEY_DERIVATION_SETUP_SID,
-+    TFM_CRYPTO_KEY_DERIVATION_GET_CAPACITY_SID,
-+    TFM_CRYPTO_KEY_DERIVATION_SET_CAPACITY_SID,
-+    TFM_CRYPTO_KEY_DERIVATION_INPUT_BYTES_SID,
-+    TFM_CRYPTO_KEY_DERIVATION_INPUT_KEY_SID,
-+    TFM_CRYPTO_KEY_DERIVATION_KEY_AGREEMENT_SID,
-+    TFM_CRYPTO_KEY_DERIVATION_OUTPUT_BYTES_SID,
-+    TFM_CRYPTO_KEY_DERIVATION_OUTPUT_KEY_SID,
-+    TFM_CRYPTO_KEY_DERIVATION_ABORT_SID,
-+    TFM_CRYPTO_RAW_KEY_AGREEMENT_SID,
-+    TFM_CRYPTO_GENERATE_RANDOM_SID,
-+    TFM_CRYPTO_GENERATE_KEY_SID,
-+    TFM_CRYPTO_SID_MAX,
-+};
-+
- /******** TFM_SP_PLATFORM ********/
- #define TFM_SP_PLATFORM_SYSTEM_RESET_SID                           (0x0=
0000040U)
- #define TFM_SP_PLATFORM_SYSTEM_RESET_VERSION                       (1U)
-diff --git a/components/service/crypto/backend/psa_ipc/component.cmake b=
/components/service/crypto/backend/psa_ipc/component.cmake
-new file mode 100644
-index 000000000000..93c297a83ac6
---- /dev/null
-+++ b/components/service/crypto/backend/psa_ipc/component.cmake
-@@ -0,0 +1,21 @@
-+#----------------------------------------------------------------------=
---------
-+# Copyright (c) 2021, Arm Limited and Contributors. All rights reserved=
.
-+#
-+# SPDX-License-Identifier: BSD-3-Clause
-+#
-+#----------------------------------------------------------------------=
---------
-+if (NOT DEFINED TGT)
-+	message(FATAL_ERROR "mandatory parameter TGT is not defined.")
-+endif()
-+
-+target_sources(${TGT} PRIVATE
-+	"${CMAKE_CURRENT_LIST_DIR}/crypto_ipc_backend.c"
-+	)
-+
-+# The ipc crypto backend uses the psa crypto client to realize the
-+# psa crypto API that the crypto provider depends on.  This define
-+# configures the psa crypto client to be built with the ipc crypto
-+# caller.
-+target_compile_definitions(${TGT} PRIVATE
-+	PSA_CRYPTO_CLIENT_CALLER_SELECTION_H=3D"service/crypto/client/caller/p=
sa_ipc/crypto_caller.h"
-+)
-diff --git a/components/service/crypto/backend/psa_ipc/crypto_ipc_backen=
d.c b/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.c
-new file mode 100644
-index 000000000000..e47cd4ffb4ce
---- /dev/null
-+++ b/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.c
-@@ -0,0 +1,26 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#include <stddef.h>
-+#include <psa/crypto.h>
-+#include <service/crypto/client/psa/psa_crypto_client.h>
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include "crypto_ipc_backend.h"
-+
-+psa_status_t crypto_ipc_backend_init(struct rpc_caller *caller)
-+{
-+	psa_status_t status =3D psa_crypto_client_init(caller);
-+
-+	if (status =3D=3D PSA_SUCCESS)
-+		status =3D psa_crypto_init();
-+
-+	return status;
-+}
-+
-+void crypto_ipc_backend_deinit(void)
-+{
-+	psa_crypto_client_deinit();
-+}
-diff --git a/components/service/crypto/backend/psa_ipc/crypto_ipc_backen=
d.h b/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h
-new file mode 100644
-index 000000000000..c13c20e84131
---- /dev/null
-+++ b/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h
-@@ -0,0 +1,70 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef CRYPTO_IPC_BACKEND_H
-+#define CRYPTO_IPC_BACKEND_H
-+
-+#include <service/crypto/client/psa/psa_crypto_client.h>
-+#include <psa/error.h>
-+#include <rpc_caller.h>
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+/**
-+ * \brief This type is used to overcome a limitation in the number of m=
aximum
-+ *        IOVECs that can be used especially in psa_aead_encrypt and
-+ *        psa_aead_decrypt. To be removed in case the AEAD APIs number =
of
-+ *        parameters passed gets restructured
-+ */
-+#define TFM_CRYPTO_MAX_NONCE_LENGTH (16u)
-+struct psa_ipc_crypto_aead_pack_input {
-+	uint8_t nonce[TFM_CRYPTO_MAX_NONCE_LENGTH];
-+	uint32_t nonce_length;
-+};
-+
-+struct psa_ipc_crypto_pack_iovec {
-+	uint32_t sfn_id;             /*!< Secure function ID used to dispatch =
the
-+				      *   request
-+				      */
-+	uint16_t step;               /*!< Key derivation step */
-+	psa_key_id_t key_id;         /*!< Key id */
-+	psa_algorithm_t alg;         /*!< Algorithm */
-+	uint32_t op_handle;          /*!< Frontend context handle associated t=
o a
-+				      *   multipart operation
-+				      */
-+	uint32_t capacity;             /*!< Key derivation capacity */
-+
-+	struct psa_ipc_crypto_aead_pack_input aead_in; /*!< FixMe: Temporarily=
 used for
-+							    *   AEAD until the API is
-+							    *   restructured
-+							    */
-+};
-+
-+#define iov_size sizeof(struct psa_ipc_crypto_pack_iovec)
-+
-+/**
-+ * \brief Initialize the psa ipc crypto backend
-+ *
-+ * Initializes a crypto backend that uses the psa API client with a
-+ * psa_ipc_backend caller to realize the PSA crypto API used by the cry=
pto
-+ * service proviser.
-+ *
-+ * \return PSA_SUCCESS if backend initialized successfully
-+ */
-+psa_status_t crypto_ipc_backend_init(struct rpc_caller *caller);
-+
-+/**
-+ * \brief Clean-up to free any resource used by the crypto backend
-+ */
-+void crypto_ipc_backend_deinit(void);
-+
-+#ifdef __cplusplus
-+} /* extern "C" */
-+#endif
-+
-+#endif /* CRYPTO_IPC_BACKEND_H */
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller.h
-new file mode 100644
-index 000000000000..0a972187062f
---- /dev/null
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller.h
-@@ -0,0 +1,34 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PSA_IPC_CRYPTO_CALLER_H
-+#define PSA_IPC_CRYPTO_CALLER_H
-+
-+/**
-+ * Includes all header files that form the psa ipc crypto caller
-+ * interface.  May be used by a client that needs to call operations
-+ * provided by a crypto service instance using the psa ipc interface.
-+ */
-+#include "crypto_caller_aead.h"
-+#include "crypto_caller_asymmetric_decrypt.h"
-+#include "crypto_caller_asymmetric_encrypt.h"
-+#include "crypto_caller_cipher.h"
-+#include "crypto_caller_copy_key.h"
-+#include "crypto_caller_destroy_key.h"
-+#include "crypto_caller_export_key.h"
-+#include "crypto_caller_export_public_key.h"
-+#include "crypto_caller_generate_key.h"
-+#include "crypto_caller_generate_random.h"
-+#include "crypto_caller_get_key_attributes.h"
-+#include "crypto_caller_hash.h"
-+#include "crypto_caller_import_key.h"
-+#include "crypto_caller_key_derivation.h"
-+#include "crypto_caller_mac.h"
-+#include "crypto_caller_purge_key.h"
-+#include "crypto_caller_sign_hash.h"
-+#include "crypto_caller_verify_hash.h"
-+
-+#endif /* PSA_IPC_CRYPTO_CALLER_H */
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_aead.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller=
_aead.h
-new file mode 100644
-index 000000000000..78517fe32ca9
---- /dev/null
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_aead=
.h
-@@ -0,0 +1,252 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PSA_IPC_CRYPTO_CALLER_AEAD_H
-+#define PSA_IPC_CRYPTO_CALLER_AEAD_H
-+
-+#include <string.h>
-+#include <stdlib.h>
-+#include <psa/crypto.h>
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <service/common/client/service_client.h>
-+#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <protocols/service/crypto/packed-c/opcodes.h>
-+#include <protocols/service/crypto/packed-c/key_attributes.h>
-+#include <protocols/service/crypto/packed-c/import_key.h>
-+#include "crypto_caller_key_attributes.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+static inline psa_status_t crypto_caller_aead_encrypt(
-+					      struct service_client *context,
-+					      psa_key_id_t key,
-+					      psa_algorithm_t alg,
-+					      const uint8_t *nonce,
-+					      size_t nonce_length,
-+					      const uint8_t *additional_data,
-+					      size_t additional_data_length,
-+					      const uint8_t *plaintext,
-+					      size_t plaintext_length,
-+					      uint8_t *aeadtext,
-+					      size_t aeadtext_size,
-+					      size_t *aeadtext_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	size_t in_len;
-+	int i;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_AEAD_ENCRYPT_SID,
-+		.key_id =3D key,
-+		.alg =3D alg,
-+		.aead_in =3D { .nonce =3D {0}, .nonce_length =3D nonce_length },
-+	};
-+
-+	if (!additional_data && additional_data_length)
-+		return PSA_ERROR_INVALID_ARGUMENT;
-+
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+		{ .base =3D psa_ptr_const_to_u32(plaintext),
-+			.len =3D plaintext_length },
-+		{ .base =3D psa_ptr_const_to_u32(additional_data),
-+			.len =3D additional_data_length},
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(aeadtext), .len =3D aeadtext_size },
-+	};
-+
-+	if (nonce_length > TFM_CRYPTO_MAX_NONCE_LENGTH)
-+		return PSA_ERROR_INVALID_ARGUMENT;
-+
-+	if (nonce) {
-+		for (i =3D 0; i < nonce_length; i++)
-+			iov.aead_in.nonce[i] =3D nonce[i];
-+	}
-+
-+	in_len =3D IOVEC_LEN(in_vec);
-+
-+	if (!additional_data)
-+		in_len--;
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  in_len, out_vec, IOVEC_LEN(out_vec));
-+
-+	*aeadtext_length =3D out_vec[0].len;
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_aead_decrypt(
-+					      struct service_client *context,
-+					      psa_key_id_t key,
-+					      psa_algorithm_t alg,
-+					      const uint8_t *nonce,
-+					      size_t nonce_length,
-+					      const uint8_t *additional_data,
-+					      size_t additional_data_length,
-+					      const uint8_t *aeadtext,
-+					      size_t aeadtext_length,
-+					      uint8_t *plaintext,
-+					      size_t plaintext_size,
-+					      size_t *plaintext_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	size_t in_len;
-+	int i;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_AEAD_DECRYPT_SID,
-+		.key_id =3D key,
-+		.alg =3D alg,
-+		.aead_in =3D { .nonce =3D {0}, .nonce_length =3D nonce_length },
-+	};
-+
-+	if (!additional_data && additional_data_length)
-+		return PSA_ERROR_INVALID_ARGUMENT;
-+
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+		{ .base =3D psa_ptr_const_to_u32(aeadtext),
-+			.len =3D aeadtext_length },
-+		{ .base =3D psa_ptr_const_to_u32(additional_data),
-+			.len =3D additional_data_length},
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(plaintext), .len =3D plaintext_size },
-+	};
-+
-+	if (nonce_length > TFM_CRYPTO_MAX_NONCE_LENGTH)
-+		return PSA_ERROR_INVALID_ARGUMENT;
-+
-+	if (nonce) {
-+		for (i =3D 0; i < nonce_length; i++)
-+			iov.aead_in.nonce[i] =3D nonce[i];
-+	}
-+
-+	in_len =3D IOVEC_LEN(in_vec);
-+
-+	if (!additional_data)
-+		in_len--;
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  in_len, out_vec, IOVEC_LEN(out_vec));
-+
-+	*plaintext_length =3D out_vec[0].len;
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_aead_encrypt_setup(
-+					    struct service_client *context,
-+					    uint32_t *op_handle,
-+					    psa_key_id_t key,
-+					    psa_algorithm_t alg)
-+{
-+	return PSA_ERROR_NOT_SUPPORTED;
-+}
-+
-+static inline psa_status_t crypto_caller_aead_decrypt_setup(
-+					    struct service_client *context,
-+					    uint32_t *op_handle,
-+					    psa_key_id_t key,
-+					    psa_algorithm_t alg)
-+{
-+	return PSA_ERROR_NOT_SUPPORTED;
-+}
-+
-+static inline psa_status_t crypto_caller_aead_generate_nonce(
-+					     struct service_client *context,
-+					     uint32_t op_handle,
-+					     uint8_t *nonce,
-+					     size_t nonce_size,
-+					     size_t *nonce_length)
-+{
-+	return PSA_ERROR_NOT_SUPPORTED;
-+}
-+
-+static inline psa_status_t crypto_caller_aead_set_nonce(
-+						struct service_client *context,
-+						uint32_t op_handle,
-+						const uint8_t *nonce,
-+						size_t nonce_length)
-+{
-+	return PSA_ERROR_NOT_SUPPORTED;
-+}
-+
-+static inline psa_status_t crypto_caller_aead_set_lengths(
-+					  struct service_client *context,
-+					  uint32_t op_handle,
-+					  size_t ad_length,
-+					  size_t plaintext_length)
-+{
-+	return PSA_ERROR_NOT_SUPPORTED;
-+}
-+
-+static inline psa_status_t crypto_caller_aead_update_ad(
-+						struct service_client *context,
-+						uint32_t op_handle,
-+						const uint8_t *input,
-+						size_t input_length)
-+{
-+	return PSA_ERROR_NOT_SUPPORTED;
-+}
-+
-+static inline psa_status_t crypto_caller_aead_update(
-+					     struct service_client *context,
-+					     uint32_t op_handle,
-+					     const uint8_t *input,
-+					     size_t input_length,
-+					     uint8_t *output,
-+					     size_t output_size,
-+					     size_t *output_length)
-+{
-+	return PSA_ERROR_NOT_SUPPORTED;
-+}
-+
-+static inline psa_status_t crypto_caller_aead_finish(
-+					     struct service_client *context,
-+					     uint32_t op_handle,
-+					     uint8_t *aeadtext,
-+					     size_t aeadtext_size,
-+					     size_t *aeadtext_length,
-+					     uint8_t *tag,
-+					     size_t tag_size,
-+					     size_t *tag_length)
-+{
-+	return PSA_ERROR_NOT_SUPPORTED;
-+}
-+
-+static inline psa_status_t crypto_caller_aead_verify(
-+					     struct service_client *context,
-+					     uint32_t op_handle,
-+					     uint8_t *plaintext,
-+					     size_t plaintext_size,
-+					     size_t *plaintext_length,
-+					     const uint8_t *tag,
-+					     size_t tag_length)
-+{
-+	return PSA_ERROR_NOT_SUPPORTED;
-+}
-+
-+static inline psa_status_t crypto_caller_aead_abort(
-+					    struct service_client *context,
-+					    uint32_t op_handle)
-+{
-+	return PSA_ERROR_NOT_SUPPORTED;
-+}
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* PSA_IPC_CRYPTO_CALLER_AEAD_H */
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_asymmetric_decrypt.h b/components/service/crypto/client/caller/psa_ipc=
/crypto_caller_asymmetric_decrypt.h
-new file mode 100644
-index 000000000000..ff01815c09e9
---- /dev/null
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_asym=
metric_decrypt.h
-@@ -0,0 +1,76 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PSA_IPC_CRYPTO_CALLER_ASYMMETRIC_DECRYPT_H
-+#define PSA_IPC_CRYPTO_CALLER_ASYMMETRIC_DECRYPT_H
-+
-+#include <string.h>
-+#include <stdlib.h>
-+#include <psa/crypto.h>
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <service/common/client/service_client.h>
-+#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <protocols/service/crypto/packed-c/opcodes.h>
-+#include <protocols/service/crypto/packed-c/key_attributes.h>
-+#include <protocols/service/crypto/packed-c/import_key.h>
-+#include "crypto_caller_key_attributes.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+static inline psa_status_t crypto_caller_asymmetric_decrypt(
-+				    struct service_client *context,
-+				    psa_key_id_t id,
-+				    psa_algorithm_t alg,
-+				    const uint8_t *input, size_t input_length,
-+				    const uint8_t *salt, size_t salt_length,
-+				    uint8_t *output, size_t output_size,
-+				    size_t *output_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	size_t in_len;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_ASYMMETRIC_DECRYPT_SID,
-+		.key_id =3D id,
-+		.alg =3D alg,
-+	};
-+
-+	/* Sanitize optional input */
-+	if (!salt && salt_length)
-+		return PSA_ERROR_INVALID_ARGUMENT;
-+
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+		{ .base =3D psa_ptr_const_to_u32(input), .len =3D input_length },
-+		{ .base =3D psa_ptr_const_to_u32(salt), .len =3D salt_length },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(output), .len =3D output_size },
-+	};
-+
-+
-+	in_len =3D IOVEC_LEN(in_vec);
-+	if (!salt)
-+		in_len--;
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  in_len, out_vec, IOVEC_LEN(out_vec));
-+
-+	*output_length =3D out_vec[0].len;
-+
-+	return status;
-+}
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* PSA_IPC_CRYPTO_CALLER_ASYMMETRIC_DECRYPT_H */
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_asymmetric_encrypt.h b/components/service/crypto/client/caller/psa_ipc=
/crypto_caller_asymmetric_encrypt.h
-new file mode 100644
-index 000000000000..1daf1689c076
---- /dev/null
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_asym=
metric_encrypt.h
-@@ -0,0 +1,76 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PSA_IPC_CRYPTO_CALLER_ASYMMETRIC_ENCRYPT_H
-+#define PSA_IPC_CRYPTO_CALLER_ASYMMETRIC_ENCRYPT_H
-+
-+#include <string.h>
-+#include <stdlib.h>
-+#include <psa/crypto.h>
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <service/common/client/service_client.h>
-+#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <protocols/service/crypto/packed-c/opcodes.h>
-+#include <protocols/service/crypto/packed-c/key_attributes.h>
-+#include <protocols/service/crypto/packed-c/import_key.h>
-+#include "crypto_caller_key_attributes.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+static inline psa_status_t crypto_caller_asymmetric_encrypt(
-+				    struct service_client *context,
-+				    psa_key_id_t id,
-+				    psa_algorithm_t alg,
-+				    const uint8_t *input, size_t input_length,
-+				    const uint8_t *salt, size_t salt_length,
-+				    uint8_t *output, size_t output_size,
-+				    size_t *output_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	size_t in_len;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_ASYMMETRIC_ENCRYPT_SID,
-+		.key_id =3D id,
-+		.alg =3D alg,
-+	};
-+
-+	/* Sanitize optional input */
-+	if (!salt && salt_length)
-+		return PSA_ERROR_INVALID_ARGUMENT;
-+
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+		{ .base =3D psa_ptr_const_to_u32(input), .len =3D input_length },
-+		{ .base =3D psa_ptr_const_to_u32(salt), .len =3D salt_length },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(output), .len =3D output_size },
-+	};
-+
-+
-+	in_len =3D IOVEC_LEN(in_vec);
-+	if (!salt)
-+		in_len--;
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  in_len, out_vec, IOVEC_LEN(out_vec));
-+
-+	*output_length =3D out_vec[0].len;
-+
-+	return status;
-+}
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* PSA_IPC_CRYPTO_CALLER_ASYMMETRIC_ENCRYPT_H */
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_cipher.h b/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_cipher.h
-new file mode 100644
-index 000000000000..fbefb28d813a
---- /dev/null
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_ciph=
er.h
-@@ -0,0 +1,246 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PSA_IPC_CRYPTO_CALLER_CIPHER_H
-+#define PSA_IPC_CRYPTO_CALLER_CIPHER_H
-+
-+#include <string.h>
-+#include <stdlib.h>
-+#include <psa/crypto.h>
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <service/common/client/service_client.h>
-+#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <protocols/service/crypto/packed-c/opcodes.h>
-+#include <protocols/service/crypto/packed-c/key_attributes.h>
-+#include <protocols/service/crypto/packed-c/import_key.h>
-+#include "crypto_caller_key_attributes.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+static inline psa_status_t crypto_caller_cipher_encrypt_setup(
-+					      struct service_client *context,
-+					      uint32_t *op_handle,
-+					      psa_key_id_t key,
-+					      psa_algorithm_t alg)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_CIPHER_ENCRYPT_SETUP_SID,
-+		.key_id =3D key,
-+		.alg =3D alg,
-+		.op_handle =3D *op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(op_handle), .len =3D sizeof(uint32_t) }
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_cipher_decrypt_setup(
-+					      struct service_client *context,
-+					      uint32_t *op_handle,
-+					      psa_key_id_t key,
-+					      psa_algorithm_t alg)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_CIPHER_DECRYPT_SETUP_SID,
-+		.key_id =3D key,
-+		.alg =3D alg,
-+		.op_handle =3D *op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(op_handle), .len =3D sizeof(uint32_t) }
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_cipher_generate_iv(
-+					    struct service_client *context,
-+					    uint32_t op_handle,
-+					    uint8_t *iv,
-+					    size_t iv_size,
-+					    size_t *iv_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_CIPHER_GENERATE_IV_SID,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t) },
-+		{ .base =3D psa_ptr_to_u32(iv), .len =3D iv_size },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	*iv_length =3D out_vec[1].len;
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_cipher_set_iv(
-+					       struct service_client *context,
-+					       uint32_t op_handle,
-+					       const uint8_t *iv,
-+					       size_t iv_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_CIPHER_SET_IV_SID,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+		{ .base =3D psa_ptr_const_to_u32(iv), .len =3D iv_length },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t) },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_cipher_update(
-+					       struct service_client *context,
-+					       uint32_t op_handle,
-+					       const uint8_t *input,
-+					       size_t input_length,
-+					       uint8_t *output,
-+					       size_t output_size,
-+					       size_t *output_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_CIPHER_UPDATE_SID,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+		{ .base =3D psa_ptr_const_to_u32(input), .len =3D input_length },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t) },
-+		{ .base =3D psa_ptr_to_u32(output), .len =3D output_size },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	*output_length =3D out_vec[1].len;
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_cipher_finish(
-+					       struct service_client *context,
-+					       uint32_t op_handle,
-+					       uint8_t *output,
-+					       size_t output_size,
-+					       size_t *output_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_CIPHER_FINISH_SID,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t) },
-+		{ .base =3D psa_ptr_to_u32(output), .len =3D output_size },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	*output_length =3D out_vec[1].len;
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_cipher_abort(
-+					      struct service_client *context,
-+					      uint32_t op_handle)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_CIPHER_ABORT_SID,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t) },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+static inline size_t crypto_caller_cipher_max_update_size(const struct =
service_client *context)
-+{
-+	/* Returns the maximum number of bytes that may be
-+	 * carried as a parameter of the cipher_update operation
-+	 * using the ipc encoding.
-+	 */
-+	size_t payload_space =3D context->service_info.max_payload;
-+	size_t overhead =3D iov_size;
-+
-+	/* Allow for output to be a whole number of blocks */
-+	overhead +=3D PSA_BLOCK_CIPHER_BLOCK_MAX_SIZE;
-+
-+	return (payload_space > overhead) ? payload_space - overhead : 0;
-+}
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* PSA_IPC_CRYPTO_CALLER_CIPHER_H */
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_copy_key.h b/components/service/crypto/client/caller/psa_ipc/crypto_ca=
ller_copy_key.h
-new file mode 100644
-index 000000000000..9a988171b098
---- /dev/null
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_copy=
_key.h
-@@ -0,0 +1,57 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PSA_IPC_CRYPTO_CALLER_COPY_KEY_H
-+#define PSA_IPC_CRYPTO_CALLER_COPY_KEY_H
-+
-+#include <string.h>
-+#include <stdlib.h>
-+#include <psa/crypto.h>
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <service/common/client/service_client.h>
-+#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <protocols/service/crypto/packed-c/opcodes.h>
-+#include <protocols/service/crypto/packed-c/key_attributes.h>
-+#include <protocols/service/crypto/packed-c/import_key.h>
-+#include "crypto_caller_key_attributes.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+static inline psa_status_t crypto_caller_copy_key(struct service_client=
 *context,
-+						  psa_key_id_t source_key,
-+						  const psa_key_attributes_t *attributes,
-+						  psa_key_id_t *target_key)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_COPY_KEY_SID,
-+		.key_id =3D source_key,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cryp=
to_pack_iovec) },
-+		{ .base =3D psa_ptr_const_to_u32(attributes), .len =3D sizeof(psa_key=
_attributes_t) },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(target_key), .len =3D sizeof(psa_key_id_t)=
 }
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* PSA_IPC_CRYPTO_CALLER_COPY_KEY_H */
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_destroy_key.h b/components/service/crypto/client/caller/psa_ipc/crypto=
_caller_destroy_key.h
-new file mode 100644
-index 000000000000..d00f4faa7a52
---- /dev/null
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_dest=
roy_key.h
-@@ -0,0 +1,51 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PSA_IPC_CRYPTO_CALLER_DESTROY_KEY_H
-+#define PSA_IPC_CRYPTO_CALLER_DESTROY_KEY_H
-+
-+#include <string.h>
-+#include <stdlib.h>
-+#include <psa/crypto.h>
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <service/common/client/service_client.h>
-+#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <protocols/service/crypto/packed-c/opcodes.h>
-+#include <protocols/service/crypto/packed-c/key_attributes.h>
-+#include <protocols/service/crypto/packed-c/import_key.h>
-+#include "crypto_caller_key_attributes.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+static inline psa_status_t crypto_caller_destroy_key(struct service_cli=
ent *context,
-+						     psa_key_id_t id)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_DESTROY_KEY_SID,
-+		.key_id =3D id,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cryp=
to_pack_iovec) },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), NULL, 0);
-+
-+	return status;
-+}
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* PSA_IPC_CRYPTO_CALLER_DESTROY_KEY_H */
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_export_key.h b/components/service/crypto/client/caller/psa_ipc/crypto_=
caller_export_key.h
-new file mode 100644
-index 000000000000..8ac5477f7b9a
---- /dev/null
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_expo=
rt_key.h
-@@ -0,0 +1,59 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PSA_IPC_CRYPTO_CALLER_EXPORT_KEY_H
-+#define PSA_IPC_CRYPTO_CALLER_EXPORT_KEY_H
-+
-+#include <string.h>
-+#include <stdlib.h>
-+#include <psa/crypto.h>
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <service/common/client/service_client.h>
-+#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <protocols/service/crypto/packed-c/opcodes.h>
-+#include <protocols/service/crypto/packed-c/key_attributes.h>
-+#include <protocols/service/crypto/packed-c/import_key.h>
-+#include "crypto_caller_key_attributes.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+static inline psa_status_t crypto_caller_export_key(struct service_clie=
nt *context,
-+						    psa_key_id_t id,
-+						    uint8_t *data,
-+						    size_t data_size,
-+						    size_t *data_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_EXPORT_KEY_SID,
-+		.key_id =3D id,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cryp=
to_pack_iovec) },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(data), .len =3D data_size }
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	*data_length =3D out_vec[0].len;
-+
-+	return status;
-+}
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* PSA_IPC_CRYPTO_CALLER_EXPORT_KEY_H */
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_export_public_key.h b/components/service/crypto/client/caller/psa_ipc/=
crypto_caller_export_public_key.h
-new file mode 100644
-index 000000000000..b24c47f1257e
---- /dev/null
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_expo=
rt_public_key.h
-@@ -0,0 +1,59 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PSA_IPC_CRYPTO_CALLER_EXPORT_PUBLIC_KEY_H
-+#define PSA_IPC_CRYPTO_CALLER_EXPORT_PUBLIC_KEY_H
-+
-+#include <string.h>
-+#include <stdlib.h>
-+#include <psa/crypto.h>
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <service/common/client/service_client.h>
-+#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <protocols/service/crypto/packed-c/opcodes.h>
-+#include <protocols/service/crypto/packed-c/key_attributes.h>
-+#include <protocols/service/crypto/packed-c/import_key.h>
-+#include "crypto_caller_key_attributes.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+static inline psa_status_t crypto_caller_export_public_key(struct servi=
ce_client *context,
-+							   psa_key_id_t id,
-+							   uint8_t *data,
-+							   size_t data_size,
-+							   size_t *data_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_EXPORT_PUBLIC_KEY_SID,
-+		.key_id =3D id,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cryp=
to_pack_iovec) },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(data), .len =3D data_size }
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	*data_length =3D out_vec[0].len;
-+
-+	return status;
-+}
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* PSA_IPC_CRYPTO_CALLER_EXPORT_PUBLIC_KEY_H */
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_generate_key.h b/components/service/crypto/client/caller/psa_ipc/crypt=
o_caller_generate_key.h
-new file mode 100644
-index 000000000000..1b66ed4020de
---- /dev/null
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_gene=
rate_key.h
-@@ -0,0 +1,55 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PSA_IPC_CRYPTO_CALLER_GENERATE_KEY_H
-+#define PSA_IPC_CRYPTO_CALLER_GENERATE_KEY_H
-+
-+#include <string.h>
-+#include <stdlib.h>
-+#include <psa/crypto.h>
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <service/common/client/service_client.h>
-+#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <protocols/service/crypto/packed-c/opcodes.h>
-+#include <protocols/service/crypto/packed-c/key_attributes.h>
-+#include <protocols/service/crypto/packed-c/import_key.h>
-+#include "crypto_caller_key_attributes.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+static inline psa_status_t crypto_caller_generate_key(struct service_cl=
ient *context,
-+						      const psa_key_attributes_t *attributes,
-+						      psa_key_id_t *id)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_GENERATE_KEY_SID,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cryp=
to_pack_iovec) },
-+		{ .base =3D psa_ptr_const_to_u32(attributes), .len =3D sizeof(psa_key=
_attributes_t) },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(id), .len =3D sizeof(psa_key_id_t) }
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* PSA_IPC_CRYPTO_CALLER_GENERATE_KEY_H */
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_generate_random.h b/components/service/crypto/client/caller/psa_ipc/cr=
ypto_caller_generate_random.h
-new file mode 100644
-index 000000000000..7c538237805a
---- /dev/null
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_gene=
rate_random.h
-@@ -0,0 +1,57 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PSA_IPC_CRYPTO_CALLER_GENERATE_RANDOM_H
-+#define PSA_IPC_CRYPTO_CALLER_GENERATE_RANDOM_H
-+
-+#include <string.h>
-+#include <stdlib.h>
-+#include <psa/crypto.h>
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <service/common/client/service_client.h>
-+#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <protocols/service/crypto/packed-c/opcodes.h>
-+#include <protocols/service/crypto/packed-c/key_attributes.h>
-+#include <protocols/service/crypto/packed-c/import_key.h>
-+#include "crypto_caller_key_attributes.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+static inline psa_status_t crypto_caller_generate_random(struct service=
_client *context,
-+							 uint8_t *output,
-+							 size_t output_size)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_GENERATE_RANDOM_SID,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cryp=
to_pack_iovec) },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(output), .len =3D output_size }
-+	};
-+
-+	if (!output_size)
-+		return PSA_SUCCESS;
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* PSA_IPC_CRYPTO_CALLER_GENERATE_RANDOM_H */
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_get_key_attributes.h b/components/service/crypto/client/caller/psa_ipc=
/crypto_caller_get_key_attributes.h
-new file mode 100644
-index 000000000000..22f1d18f1476
---- /dev/null
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_get_=
key_attributes.h
-@@ -0,0 +1,56 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PSA_IPC_CRYPTO_CALLER_GET_KEY_ATTRIBUTES_H
-+#define PSA_IPC_CRYPTO_CALLER_GET_KEY_ATTRIBUTES_H
-+
-+#include <string.h>
-+#include <stdlib.h>
-+#include <psa/crypto.h>
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <service/common/client/service_client.h>
-+#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <protocols/service/crypto/packed-c/opcodes.h>
-+#include <protocols/service/crypto/packed-c/key_attributes.h>
-+#include <protocols/service/crypto/packed-c/import_key.h>
-+#include "crypto_caller_key_attributes.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+static inline psa_status_t crypto_caller_get_key_attributes(
-+					    struct service_client *context,
-+					    psa_key_id_t key,
-+					    psa_key_attributes_t *attributes)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_GET_KEY_ATTRIBUTES_SID,
-+		.key_id =3D key,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cryp=
to_pack_iovec) },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(attributes), .len =3D sizeof(psa_key_attri=
butes_t) }
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* PSA_IPC_CRYPTO_CALLER_GET_KEY_ATTRIBUTES_H */
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_hash.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller=
_hash.h
-new file mode 100644
-index 000000000000..9f37908a2f25
---- /dev/null
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_hash=
.h
-@@ -0,0 +1,220 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PSA_IPC_CRYPTO_CALLER_HASH_H
-+#define PSA_IPC_CRYPTO_CALLER_HASH_H
-+
-+#include <string.h>
-+#include <stdlib.h>
-+#include <psa/crypto.h>
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <service/common/client/service_client.h>
-+#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <protocols/service/crypto/packed-c/opcodes.h>
-+#include <protocols/service/crypto/packed-c/key_attributes.h>
-+#include <protocols/service/crypto/packed-c/import_key.h>
-+#include "crypto_caller_key_attributes.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+static inline psa_status_t crypto_caller_hash_setup(
-+					    struct service_client *context,
-+					    uint32_t *op_handle,
-+					    psa_algorithm_t alg)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_HASH_SETUP_SID,
-+		.alg =3D alg,
-+		.op_handle =3D *op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(op_handle), .len =3D sizeof(uint32_t) }
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_hash_update(
-+					     struct service_client *context,
-+					     uint32_t op_handle,
-+					     const uint8_t *input,
-+					     size_t input_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_HASH_UPDATE_SID,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+		{ .base =3D psa_ptr_const_to_u32(input), .len =3D input_length },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t) },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_hash_finish(
-+					     struct service_client *context,
-+					     uint32_t op_handle,
-+					     uint8_t *hash,
-+					     size_t hash_size,
-+					     size_t *hash_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_HASH_FINISH_SID,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t) },
-+		{ .base =3D psa_ptr_to_u32(hash), .len =3D hash_size},
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	*hash_length =3D out_vec[1].len;
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_hash_abort(
-+					    struct service_client *context,
-+					    uint32_t op_handle)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_HASH_ABORT_SID,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t) },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_hash_verify(
-+					     struct service_client *context,
-+					     uint32_t op_handle,
-+					     const uint8_t *hash,
-+					     size_t hash_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_HASH_VERIFY_SID,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+		{ .base =3D psa_ptr_const_to_u32(hash), .len =3D hash_length},
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t) },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_hash_clone(
-+					    struct service_client *context,
-+					    uint32_t source_op_handle,
-+					    uint32_t *target_op_handle)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_HASH_CLONE_SID,
-+		.op_handle =3D source_op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(target_op_handle),
-+			.len =3D sizeof(uint32_t) },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_hash_suspend(struct service_cl=
ient *context,
-+	uint32_t op_handle,
-+	uint8_t *hash_state,
-+	size_t hash_state_size,
-+	size_t *hash_state_length)
-+{
-+	return PSA_ERROR_NOT_SUPPORTED;
-+}
-+
-+static inline psa_status_t crypto_caller_hash_resume(struct service_cli=
ent *context,
-+	uint32_t op_handle,
-+	const uint8_t *hash_state,
-+	size_t hash_state_length)
-+{
-+	return PSA_ERROR_NOT_SUPPORTED;
-+}
-+
-+static inline size_t crypto_caller_hash_max_update_size(const struct se=
rvice_client *context)
-+{
-+	/* Returns the maximum number of bytes that may be
-+	 * carried as a parameter of the hash_update operation
-+	 * using the packed-c encoding.
-+	 */
-+	size_t payload_space =3D context->service_info.max_payload;
-+	size_t overhead =3D iov_size;
-+
-+	return (payload_space > overhead) ? payload_space - overhead : 0;
-+}
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* PSA_IPC_CRYPTO_CALLER_HASH_H */
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_import_key.h b/components/service/crypto/client/caller/psa_ipc/crypto_=
caller_import_key.h
-new file mode 100644
-index 000000000000..d47033662790
---- /dev/null
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_impo=
rt_key.h
-@@ -0,0 +1,57 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PSA_IPC_CRYPTO_CALLER_IMPORT_KEY_H
-+#define PSA_IPC_CRYPTO_CALLER_IMPORT_KEY_H
-+
-+#include <string.h>
-+#include <stdlib.h>
-+#include <psa/crypto.h>
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <service/common/client/service_client.h>
-+#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <protocols/service/crypto/packed-c/opcodes.h>
-+#include <protocols/service/crypto/packed-c/key_attributes.h>
-+#include <protocols/service/crypto/packed-c/import_key.h>
-+#include "crypto_caller_key_attributes.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+static inline psa_status_t crypto_caller_import_key(struct service_clie=
nt *context,
-+				    const psa_key_attributes_t *attributes,
-+				    const uint8_t *data, size_t data_length,
-+				    psa_key_id_t *id)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_IMPORT_KEY_SID,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cryp=
to_pack_iovec) },
-+		{ .base =3D psa_ptr_const_to_u32(attributes), .len =3D sizeof(psa_key=
_attributes_t) },
-+		{ .base =3D psa_ptr_const_to_u32(data), .len =3D data_length }
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(id), .len =3D sizeof(psa_key_id_t) }
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* PACKEDC_CRYPTO_CALLER_IMPORT_KEY_H */
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_key_attributes.h b/components/service/crypto/client/caller/psa_ipc/cry=
pto_caller_key_attributes.h
-new file mode 100644
-index 000000000000..2fad2f0a64e6
---- /dev/null
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_key_=
attributes.h
-@@ -0,0 +1,51 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PACKEDC_CRYPTO_CALLER_KEY_ATTRIBUTES_H
-+#define PACKEDC_CRYPTO_CALLER_KEY_ATTRIBUTES_H
-+
-+#include <psa/crypto.h>
-+#include <protocols/service/crypto/packed-c/key_attributes.h>
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+static inline void packedc_crypto_caller_translate_key_attributes_to_pr=
oto(
-+	struct ts_crypto_key_attributes *proto_attributes,
-+	const psa_key_attributes_t *psa_attributes)
-+{
-+	proto_attributes->type =3D psa_get_key_type(psa_attributes);
-+	proto_attributes->key_bits =3D psa_get_key_bits(psa_attributes);
-+	proto_attributes->lifetime =3D psa_get_key_lifetime(psa_attributes);
-+	proto_attributes->id =3D psa_get_key_id(psa_attributes);
-+
-+	proto_attributes->policy.usage =3D psa_get_key_usage_flags(psa_attribu=
tes);
-+	proto_attributes->policy.alg =3D psa_get_key_algorithm(psa_attributes)=
;
-+ }
-+
-+static inline void packedc_crypto_caller_translate_key_attributes_from_=
proto(
-+	psa_key_attributes_t *psa_attributes,
-+	const struct ts_crypto_key_attributes *proto_attributes)
-+{
-+	psa_set_key_type(psa_attributes, proto_attributes->type);
-+	psa_set_key_bits(psa_attributes, proto_attributes->key_bits);
-+	psa_set_key_lifetime(psa_attributes, proto_attributes->lifetime);
-+
-+	if (proto_attributes->lifetime =3D=3D PSA_KEY_LIFETIME_PERSISTENT) {
-+
-+		psa_set_key_id(psa_attributes, proto_attributes->id);
-+	}
-+
-+	psa_set_key_usage_flags(psa_attributes, proto_attributes->policy.usage=
);
-+	psa_set_key_algorithm(psa_attributes, proto_attributes->policy.alg);
-+}
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* PACKEDC_CRYPTO_CALLER_KEY_ATTRIBUTES_H */
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_key_derivation.h b/components/service/crypto/client/caller/psa_ipc/cry=
pto_caller_key_derivation.h
-new file mode 100644
-index 000000000000..5ce4fb6cca82
---- /dev/null
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_key_=
derivation.h
-@@ -0,0 +1,298 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PSA_IPC_CRYPTO_CALLER_KEY_DERIVATION_H
-+#define PSA_IPC_CRYPTO_CALLER_KEY_DERIVATION_H
-+
-+#include <string.h>
-+#include <stdlib.h>
-+#include <psa/crypto.h>
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <service/common/client/service_client.h>
-+#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <protocols/service/crypto/packed-c/opcodes.h>
-+#include <protocols/service/crypto/packed-c/key_attributes.h>
-+#include <protocols/service/crypto/packed-c/import_key.h>
-+#include "crypto_caller_key_attributes.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+static inline psa_status_t crypto_caller_key_derivation_setup(
-+					      struct service_client *context,
-+					      uint32_t *op_handle,
-+					      psa_algorithm_t alg)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_KEY_DERIVATION_SETUP_SID,
-+		.alg =3D alg,
-+		.op_handle =3D *op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(op_handle), .len =3D sizeof(uint32_t) }
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_key_derivation_get_capacity(
-+					     struct service_client *context,
-+					     const uint32_t op_handle,
-+					     size_t *capacity)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_KEY_DERIVATION_GET_CAPACITY_SID,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(capacity), .len =3D sizeof(uint32_t) }
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_key_derivation_set_capacity(
-+					     struct service_client *context,
-+					     uint32_t op_handle,
-+					     size_t capacity)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_KEY_DERIVATION_SET_CAPACITY_SID,
-+		.capacity =3D capacity,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), NULL, 0);
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_key_derivation_input_bytes(
-+					    struct service_client *context,
-+					    uint32_t op_handle,
-+					    psa_key_derivation_step_t step,
-+					    const uint8_t *data,
-+					    size_t data_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_KEY_DERIVATION_INPUT_BYTES_SID,
-+		.step =3D step,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+		{ .base =3D psa_ptr_const_to_u32(data), .len =3D data_length },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), NULL, 0);
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_key_derivation_input_key(
-+					  struct service_client *context,
-+					  uint32_t op_handle,
-+					  psa_key_derivation_step_t step,
-+					  psa_key_id_t key)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_KEY_DERIVATION_INPUT_KEY_SID,
-+		.key_id =3D key,
-+		.step =3D step,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), NULL, 0);
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_key_derivation_output_bytes(
-+					     struct service_client *context,
-+					     uint32_t op_handle,
-+					     uint8_t *output,
-+					     size_t output_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_KEY_DERIVATION_OUTPUT_BYTES_SID,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(output), .len =3D output_length },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_key_derivation_output_key(
-+				   struct service_client *context,
-+				   const psa_key_attributes_t *attributes,
-+				   uint32_t op_handle,
-+				   psa_key_id_t *key)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_KEY_DERIVATION_OUTPUT_KEY_SID,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+		{ .base =3D psa_ptr_const_to_u32(attributes),
-+			.len =3D sizeof(psa_key_attributes_t) },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(key), .len =3D sizeof(psa_key_id_t)},
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_key_derivation_abort(
-+					      struct service_client *context,
-+					      uint32_t op_handle)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_KEY_DERIVATION_ABORT_SID,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t) },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_key_derivation_key_agreement(
-+				      struct service_client *context,
-+				      uint32_t op_handle,
-+				      psa_key_derivation_step_t step,
-+				      psa_key_id_t private_key,
-+				      const uint8_t *peer_key,
-+				      size_t peer_key_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_KEY_DERIVATION_KEY_AGREEMENT_SID,
-+		.key_id =3D private_key,
-+		.step =3D step,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+		{ .base =3D psa_ptr_const_to_u32(peer_key),
-+			.len =3D peer_key_length},
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), NULL, 0);
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_raw_key_agreement(
-+					   struct service_client *context,
-+					   psa_algorithm_t alg,
-+					   psa_key_id_t private_key,
-+					   const uint8_t *peer_key,
-+					   size_t peer_key_length,
-+					   uint8_t *output,
-+					   size_t output_size,
-+					   size_t *output_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_RAW_KEY_AGREEMENT_SID,
-+		.alg =3D alg,
-+		.key_id =3D private_key,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+		{ .base =3D psa_ptr_const_to_u32(peer_key),
-+			.len =3D peer_key_length},
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(output), .len =3D output_size },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	*output_length =3D out_vec[0].len;
-+
-+	return status;
-+}
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* PSA_IPC_CRYPTO_CALLER_KEY_DERIVATION_H */
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_mac.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller_=
mac.h
-new file mode 100644
-index 000000000000..3a820192495a
---- /dev/null
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_mac.=
h
-@@ -0,0 +1,207 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PSA_IPC_CRYPTO_CALLER_MAC_H
-+#define PSA_IPC_CRYPTO_CALLER_MAC_H
-+
-+#include <string.h>
-+#include <stdlib.h>
-+#include <psa/crypto.h>
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <service/common/client/service_client.h>
-+#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <protocols/service/crypto/packed-c/opcodes.h>
-+#include <protocols/service/crypto/packed-c/key_attributes.h>
-+#include <protocols/service/crypto/packed-c/import_key.h>
-+#include "crypto_caller_key_attributes.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+static inline psa_status_t crypto_caller_mac_sign_setup(
-+						struct service_client *context,
-+						uint32_t *op_handle,
-+						psa_key_id_t key,
-+						psa_algorithm_t alg)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_MAC_SIGN_SETUP_SID,
-+		.key_id =3D key,
-+		.alg =3D alg,
-+		.op_handle =3D *op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(op_handle), .len =3D sizeof(uint32_t) },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_mac_verify_setup(
-+					  struct service_client *context,
-+					  uint32_t *op_handle,
-+					  psa_key_id_t key,
-+					  psa_algorithm_t alg)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_MAC_VERIFY_SETUP_SID,
-+		.key_id =3D key,
-+		.alg =3D alg,
-+		.op_handle =3D *op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(op_handle), .len =3D sizeof(uint32_t) },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_mac_update(
-+					    struct service_client *context,
-+					    uint32_t op_handle,
-+					    const uint8_t *input,
-+					    size_t input_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_MAC_UPDATE_SID,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+		{ .base =3D psa_ptr_const_to_u32(input), .len =3D input_length },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t) },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_mac_sign_finish(
-+						 struct service_client *context,
-+						 uint32_t op_handle,
-+						 uint8_t *mac,
-+						 size_t mac_size,
-+						 size_t *mac_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_MAC_SIGN_FINISH_SID,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t) },
-+		{ .base =3D psa_ptr_to_u32(mac), .len =3D mac_size },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	*mac_length =3D out_vec[1].len;
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_mac_verify_finish(
-+					   struct service_client *context,
-+					   uint32_t op_handle,
-+					   const uint8_t *mac,
-+					   size_t mac_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_MAC_VERIFY_FINISH_SID,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+		{ .base =3D psa_ptr_const_to_u32(mac), .len =3D mac_length },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t) },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+static inline psa_status_t crypto_caller_mac_abort(
-+					   struct service_client *context,
-+					   uint32_t op_handle)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_MAC_ABORT_SID,
-+		.op_handle =3D op_handle,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t) },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
-+}
-+
-+static inline size_t crypto_caller_mac_max_update_size(const struct ser=
vice_client *context)
-+{
-+	/* Returns the maximum number of bytes that may be
-+	 * carried as a parameter of the mac_update operation
-+	 * using the packed-c encoding.
-+	 */
-+	size_t payload_space =3D context->service_info.max_payload;
-+	size_t overhead =3D iov_size;
-+
-+	return (payload_space > overhead) ? payload_space - overhead : 0;
-+}
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* PSA_IPC_CRYPTO_CALLER_MAC_H */
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_purge_key.h b/components/service/crypto/client/caller/psa_ipc/crypto_c=
aller_purge_key.h
-new file mode 100644
-index 000000000000..a3a796e2166c
---- /dev/null
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_purg=
e_key.h
-@@ -0,0 +1,51 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PACKEDC_CRYPTO_CALLER_PURGE_KEY_H
-+#define PACKEDC_CRYPTO_CALLER_PURGE_KEY_H
-+
-+#include <string.h>
-+#include <stdlib.h>
-+#include <psa/crypto.h>
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <service/common/client/service_client.h>
-+#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <protocols/service/crypto/packed-c/opcodes.h>
-+#include <protocols/service/crypto/packed-c/key_attributes.h>
-+#include <protocols/service/crypto/packed-c/import_key.h>
-+#include "crypto_caller_key_attributes.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+static inline psa_status_t crypto_caller_purge_key(struct service_clien=
t *context,
-+						   psa_key_id_t id)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_PURGE_KEY_SID,
-+		.key_id =3D id,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cryp=
to_pack_iovec) },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), NULL, 0);
-+
-+	return status;
-+}
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* PACKEDC_CRYPTO_CALLER_PURGE_KEY_H */
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_sign_hash.h b/components/service/crypto/client/caller/psa_ipc/crypto_c=
aller_sign_hash.h
-new file mode 100644
-index 000000000000..71d88cededf5
---- /dev/null
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_sign=
_hash.h
-@@ -0,0 +1,64 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PSA_IPC_CRYPTO_CALLER_SIGN_HASH_H
-+#define PSA_IPC_CRYPTO_CALLER_SIGN_HASH_H
-+
-+#include <string.h>
-+#include <stdlib.h>
-+#include <psa/crypto.h>
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <service/common/client/service_client.h>
-+#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <protocols/service/crypto/packed-c/opcodes.h>
-+#include <protocols/service/crypto/packed-c/key_attributes.h>
-+#include <protocols/service/crypto/packed-c/import_key.h>
-+#include "crypto_caller_key_attributes.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+static inline psa_status_t crypto_caller_sign_hash(struct service_clien=
t *context,
-+						   psa_key_id_t id,
-+						   psa_algorithm_t alg,
-+						   const uint8_t *hash,
-+						   size_t hash_length,
-+						   uint8_t *signature,
-+						   size_t signature_size,
-+						   size_t *signature_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_SIGN_HASH_SID,
-+		.key_id =3D id,
-+		.alg =3D alg,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+		{ .base =3D psa_ptr_const_to_u32(hash), .len =3D hash_length },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(signature), .len =3D signature_size },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	*signature_length =3D out_vec[0].len;
-+
-+	return status;
-+}
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* PSA_IPC_CRYPTO_CALLER_SIGN_HASH_H */
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_verify_hash.h b/components/service/crypto/client/caller/psa_ipc/crypto=
_caller_verify_hash.h
-new file mode 100644
-index 000000000000..e16f6e5450af
---- /dev/null
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_veri=
fy_hash.h
-@@ -0,0 +1,59 @@
-+/*
-+ * Copyright (c) 2021, Arm Limited and Contributors. All rights reserve=
d.
-+ *
-+ * SPDX-License-Identifier: BSD-3-Clause
-+ */
-+
-+#ifndef PSA_IPC_CRYPTO_CALLER_VERIFY_HASH_H
-+#define PSA_IPC_CRYPTO_CALLER_VERIFY_HASH_H
-+
-+#include <string.h>
-+#include <stdlib.h>
-+#include <psa/crypto.h>
-+#include <psa/client.h>
-+#include <psa/sid.h>
-+#include <service/common/client/service_client.h>
-+#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
-+#include <protocols/rpc/common/packed-c/status.h>
-+#include <protocols/service/crypto/packed-c/opcodes.h>
-+#include <protocols/service/crypto/packed-c/key_attributes.h>
-+#include <protocols/service/crypto/packed-c/import_key.h>
-+#include "crypto_caller_key_attributes.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+static inline psa_status_t crypto_caller_verify_hash(struct service_cli=
ent *context,
-+						     psa_key_id_t id,
-+						     psa_algorithm_t alg,
-+						     const uint8_t *hash,
-+						     size_t hash_length,
-+						     const uint8_t *signature,
-+						     size_t signature_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_VERIFY_HASH_SID,
-+		.key_id =3D id,
-+		.alg =3D alg,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cryp=
to_pack_iovec) },
-+		{ .base =3D psa_ptr_const_to_u32(hash), .len =3D hash_length },
-+		{ .base =3D psa_ptr_const_to_u32(signature), .len =3D signature_lengt=
h},
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), NULL, 0);
-+
-+	return status;
-+}
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#endif /* PSA_IPC_CRYPTO_CALLER_VERIFY_HASH_H */
-diff --git a/components/service/crypto/include/psa/crypto_client_struct.=
h b/components/service/crypto/include/psa/crypto_client_struct.h
-index abd420c82607..bf95c9821e55 100644
---- a/components/service/crypto/include/psa/crypto_client_struct.h
-+++ b/components/service/crypto/include/psa/crypto_client_struct.h
-@@ -31,12 +31,12 @@ extern "C" {
-  * data structure internally. */
- struct psa_client_key_attributes_s
- {
-+    uint16_t type;
-+    uint16_t bits;
-     uint32_t lifetime;
--    uint32_t id;
--    uint32_t alg;
-+    psa_key_id_t id;
-     uint32_t usage;
--    size_t bits;
--    uint16_t type;
-+    uint32_t alg;
- };
-=20
- #define PSA_CLIENT_KEY_ATTRIBUTES_INIT {0, 0, 0, 0, 0, 0}
-diff --git a/components/service/crypto/include/psa/crypto_sizes.h b/comp=
onents/service/crypto/include/psa/crypto_sizes.h
-index 7a0149bbca62..4d7bf6e959b0 100644
---- a/components/service/crypto/include/psa/crypto_sizes.h
-+++ b/components/service/crypto/include/psa/crypto_sizes.h
-@@ -81,7 +81,7 @@
- #define PSA_HASH_MAX_SIZE 64
- #define PSA_HMAC_MAX_HASH_BLOCK_SIZE 128
- #else
--#define PSA_HASH_MAX_SIZE 32
-+#define PSA_HASH_MAX_SIZE 64
- #define PSA_HMAC_MAX_HASH_BLOCK_SIZE 64
- #endif
-=20
-diff --git a/deployments/se-proxy/common/service_proxy_factory.c b/deplo=
yments/se-proxy/common/service_proxy_factory.c
-index 1110ac46bf8b..7edeef8b434a 100644
---- a/deployments/se-proxy/common/service_proxy_factory.c
-+++ b/deployments/se-proxy/common/service_proxy_factory.c
-@@ -15,7 +15,7 @@
- #include <trace.h>
-=20
- /* Stub backends */
--#include <service/crypto/backend/stub/stub_crypto_backend.h>
-+#include <service/crypto/backend/psa_ipc/crypto_ipc_backend.h>
- #include <service/secure_storage/backend/secure_storage_ipc/secure_stor=
age_ipc.h>
- #include <service/secure_storage/backend/mock_store/mock_store.h>
-=20
-@@ -47,12 +47,17 @@ struct rpc_interface *crypto_proxy_create(void)
- {
- 	struct rpc_interface *crypto_iface =3D NULL;
- 	struct crypto_provider *crypto_provider;
-+	struct rpc_caller *crypto_caller;
-=20
--	if (stub_crypto_backend_init() =3D=3D PSA_SUCCESS) {
-+	crypto_caller =3D openamp_caller_init(&openamp);
-+	if (!crypto_caller)
-+		return NULL;
-+
-+	if (crypto_ipc_backend_init(&openamp.rpc_caller) !=3D PSA_SUCCESS)
-+		return NULL;
-=20
--		crypto_provider =3D crypto_provider_factory_create();
--		crypto_iface =3D service_provider_get_rpc_interface(&crypto_provider-=
>base_provider);
--	}
-+	crypto_provider =3D crypto_provider_factory_create();
-+	crypto_iface =3D service_provider_get_rpc_interface(&crypto_provider->=
base_provider);
-=20
- 	return crypto_iface;
- }
-diff --git a/platform/providers/arm/corstone1000/platform.cmake b/platfo=
rm/providers/arm/corstone1000/platform.cmake
-index bb778bb9719b..51e5faa3e4d8 100644
---- a/platform/providers/arm/corstone1000/platform.cmake
-+++ b/platform/providers/arm/corstone1000/platform.cmake
-@@ -8,3 +8,5 @@
-=20
- # include MHU driver
- include(${TS_ROOT}/platform/drivers/arm/mhu_driver/component.cmake)
-+
-+add_compile_definitions(MBEDTLS_ECP_DP_SECP521R1_ENABLED)
---=20
-2.38.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0014-Configure-storage-size.patch b/meta-arm-bsp/recipes-security/trusted=
-services/corstone1000/0014-Configure-storage-size.patch
deleted file mode 100644
index 22b1da69..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0014-Co=
nfigure-storage-size.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 229ec29154a4404426ad3083af68ca111a214e13 Mon Sep 17 00:00:00 2001
-From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
-Date: Thu, 16 Dec 2021 21:31:40 +0000
-Subject: [PATCH 14/20] Configure storage size
-
-Upstream-Status: Pending
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- .../service/smm_variable/backend/uefi_variable_store.c       | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/components/service/smm_variable/backend/uefi_variable_store=
.c b/components/service/smm_variable/backend/uefi_variable_store.c
-index 611e2e225c6b..6c3b9ed81c25 100644
---- a/components/service/smm_variable/backend/uefi_variable_store.c
-+++ b/components/service/smm_variable/backend/uefi_variable_store.c
-@@ -88,6 +88,7 @@ static efi_status_t check_name_terminator(
-  * may be overridden using uefi_variable_store_set_storage_limits()
-  */
- #define DEFAULT_MAX_VARIABLE_SIZE			(2048)
-+#define CONFIGURE_STORAGE_SIZE			    (50)
-=20
- efi_status_t uefi_variable_store_init(
- 	struct uefi_variable_store *context,
-@@ -101,13 +102,13 @@ efi_status_t uefi_variable_store_init(
- 	/* Initialise persistent store defaults */
- 	context->persistent_store.is_nv =3D true;
- 	context->persistent_store.max_variable_size =3D DEFAULT_MAX_VARIABLE_S=
IZE;
--	context->persistent_store.total_capacity =3D DEFAULT_MAX_VARIABLE_SIZE=
 * max_variables;
-+	context->persistent_store.total_capacity =3D CONFIGURE_STORAGE_SIZE * =
max_variables;
- 	context->persistent_store.storage_backend =3D persistent_store;
-=20
- 	/* Initialise volatile store defaults */
- 	context->volatile_store.is_nv =3D false;
- 	context->volatile_store.max_variable_size =3D DEFAULT_MAX_VARIABLE_SIZ=
E;
--	context->volatile_store.total_capacity =3D DEFAULT_MAX_VARIABLE_SIZE *=
 max_variables;
-+	context->volatile_store.total_capacity =3D CONFIGURE_STORAGE_SIZE * ma=
x_variables;
- 	context->volatile_store.storage_backend =3D volatile_store;
-=20
- 	context->owner_id =3D owner_id;
---=20
-2.38.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0015-Fix-Crypto-interface-structure-aligned-with-tf-m-cha.patch b/meta-ar=
m-bsp/recipes-security/trusted-services/corstone1000/0015-Fix-Crypto-inte=
rface-structure-aligned-with-tf-m-cha.patch
deleted file mode 100644
index 426f2ca5..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0015-Fi=
x-Crypto-interface-structure-aligned-with-tf-m-cha.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From cf83184500703f9b4f2ac04be59cc7d624d8fd66 Mon Sep 17 00:00:00 2001
-From: Satish Kumar <satish.kumar01@arm.com>
-Date: Sun, 13 Feb 2022 09:01:10 +0000
-Subject: [PATCH 15/20] Fix: Crypto interface structure aligned with tf-m
- change.
-
-NO NEED TO RAISE PR: The PR for this FIX  is raied by Emek.
-
-Upstream-Status: Pending
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/components/service/crypto/backend/psa_ipc/crypto_ipc_backen=
d.h b/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h
-index c13c20e84131..ec25eaf868c7 100644
---- a/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h
-+++ b/components/service/crypto/backend/psa_ipc/crypto_ipc_backend.h
-@@ -38,7 +38,8 @@ struct psa_ipc_crypto_pack_iovec {
- 				      *   multipart operation
- 				      */
- 	uint32_t capacity;             /*!< Key derivation capacity */
--
-+	uint32_t ad_length;            /*!< Additional Data length for multipa=
rt AEAD */
-+	uint32_t plaintext_length;     /*!< Plaintext length for multipart AEA=
D */
- 	struct psa_ipc_crypto_aead_pack_input aead_in; /*!< FixMe: Temporarily=
 used for
- 							    *   AEAD until the API is
- 							    *   restructured
---=20
-2.38.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0016-Integrate-remaining-psa-ipc-client-APIs.patch b/meta-arm-bsp/recipes=
-security/trusted-services/corstone1000/0016-Integrate-remaining-psa-ipc-=
client-APIs.patch
deleted file mode 100644
index a59d1400..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0016-In=
tegrate-remaining-psa-ipc-client-APIs.patch
+++ /dev/null
@@ -1,494 +0,0 @@
-From 551d8722769fa2f2d2ac74adcb289333a9b03598 Mon Sep 17 00:00:00 2001
-From: Satish Kumar <satish.kumar01@arm.com>
-Date: Sun, 13 Feb 2022 09:49:51 +0000
-Subject: [PATCH 16/20] Integrate remaining psa-ipc client APIs.
-
-Upstream-Status: Pending
-Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- .../caller/psa_ipc/crypto_caller_aead.h       | 297 +++++++++++++++++-
- .../caller/psa_ipc/crypto_caller_sign_hash.h  |  35 +++
- .../psa_ipc/crypto_caller_verify_hash.h       |  33 +-
- 3 files changed, 352 insertions(+), 13 deletions(-)
-
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_aead.h b/components/service/crypto/client/caller/psa_ipc/crypto_caller=
_aead.h
-index 78517fe32ca9..f6aadd8b9098 100644
---- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_aead=
.h
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_aead=
.h
-@@ -152,7 +152,27 @@ static inline psa_status_t crypto_caller_aead_encry=
pt_setup(
- 					    psa_key_id_t key,
- 					    psa_algorithm_t alg)
- {
--	return PSA_ERROR_NOT_SUPPORTED;
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+	    .sfn_id =3D TFM_CRYPTO_AEAD_ENCRYPT_SETUP_SID,
-+	    .key_id =3D key,
-+	    .alg =3D alg,
-+	    .op_handle =3D (*op_handle),
-+	};
-+
-+	struct psa_invec in_vec[] =3D {
-+	    {.base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cr=
ypto_pack_iovec)}
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+	    {.base =3D psa_ptr_to_u32(op_handle), .len =3D sizeof(uint32_t)}
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+	                   IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
- }
-=20
- static inline psa_status_t crypto_caller_aead_decrypt_setup(
-@@ -161,7 +181,26 @@ static inline psa_status_t crypto_caller_aead_decry=
pt_setup(
- 					    psa_key_id_t key,
- 					    psa_algorithm_t alg)
- {
--	return PSA_ERROR_NOT_SUPPORTED;
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+	    .sfn_id =3D TFM_CRYPTO_AEAD_DECRYPT_SETUP_SID,
-+	    .key_id =3D key,
-+	    .alg =3D alg,
-+	    .op_handle =3D (*op_handle),
-+	};
-+
-+	struct psa_invec in_vec[] =3D {
-+	    {.base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cr=
ypto_pack_iovec)}
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+	    {.base =3D psa_ptr_to_u32(op_handle), .len =3D sizeof(uint32_t)}
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+	                   IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+	return status;
- }
-=20
- static inline psa_status_t crypto_caller_aead_generate_nonce(
-@@ -171,7 +210,27 @@ static inline psa_status_t crypto_caller_aead_gener=
ate_nonce(
- 					     size_t nonce_size,
- 					     size_t *nonce_length)
- {
--	return PSA_ERROR_NOT_SUPPORTED;
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+	    .sfn_id =3D TFM_CRYPTO_AEAD_GENERATE_NONCE_SID,
-+	    .op_handle =3D op_handle,
-+	};
-+
-+	struct psa_invec in_vec[] =3D {
-+	    {.base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cr=
ypto_pack_iovec)},
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+	    {.base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t)},
-+	    {.base =3D psa_ptr_to_u32(nonce), .len =3D nonce_size}
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+	                   IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	*nonce_length =3D out_vec[1].len;
-+	return status;
- }
-=20
- static inline psa_status_t crypto_caller_aead_set_nonce(
-@@ -180,7 +239,25 @@ static inline psa_status_t crypto_caller_aead_set_n=
once(
- 						const uint8_t *nonce,
- 						size_t nonce_length)
- {
--	return PSA_ERROR_NOT_SUPPORTED;
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+	    .sfn_id =3D TFM_CRYPTO_AEAD_SET_NONCE_SID,
-+	    .op_handle =3D op_handle,
-+	};
-+
-+	struct psa_invec in_vec[] =3D {
-+	    {.base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cr=
ypto_pack_iovec)},
-+	    {.base =3D psa_ptr_to_u32(nonce), .len =3D nonce_length}
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+	    {.base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t)}
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+	                   IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+	return status;
- }
-=20
- static inline psa_status_t crypto_caller_aead_set_lengths(
-@@ -189,7 +266,27 @@ static inline psa_status_t crypto_caller_aead_set_l=
engths(
- 					  size_t ad_length,
- 					  size_t plaintext_length)
- {
--	return PSA_ERROR_NOT_SUPPORTED;
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+	    .sfn_id =3D TFM_CRYPTO_AEAD_SET_LENGTHS_SID,
-+	    .ad_length =3D ad_length,
-+	    .plaintext_length =3D plaintext_length,
-+	    .op_handle =3D op_handle,
-+	};
-+
-+	struct psa_invec in_vec[] =3D {
-+	    {.base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cr=
ypto_pack_iovec)},
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+	    {.base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t)}
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+	                   IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	return status;
- }
-=20
- static inline psa_status_t crypto_caller_aead_update_ad(
-@@ -198,7 +295,35 @@ static inline psa_status_t crypto_caller_aead_updat=
e_ad(
- 						const uint8_t *input,
- 						size_t input_length)
- {
--	return PSA_ERROR_NOT_SUPPORTED;
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+	    .sfn_id =3D TFM_CRYPTO_AEAD_UPDATE_AD_SID,
-+	    .op_handle =3D op_handle,
-+	};
-+
-+	/* Sanitize the optional input */
-+	if ((input =3D=3D NULL) && (input_length !=3D 0)) {
-+	    return PSA_ERROR_INVALID_ARGUMENT;
-+	}
-+
-+	struct psa_invec in_vec[] =3D {
-+	    {.base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cr=
ypto_pack_iovec)},
-+	    {.base =3D psa_ptr_const_to_u32(input), .len =3D input_length}
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+	    {.base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t)}
-+	};
-+
-+	size_t in_len =3D IOVEC_LEN(in_vec);
-+
-+	if (input =3D=3D NULL) {
-+	    in_len--;
-+	}
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+	                   in_len, out_vec, IOVEC_LEN(out_vec));
-+	return status;
- }
-=20
- static inline psa_status_t crypto_caller_aead_update(
-@@ -210,7 +335,38 @@ static inline psa_status_t crypto_caller_aead_updat=
e(
- 					     size_t output_size,
- 					     size_t *output_length)
- {
--	return PSA_ERROR_NOT_SUPPORTED;
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+	    .sfn_id =3D TFM_CRYPTO_AEAD_UPDATE_SID,
-+	    .op_handle =3D op_handle,
-+	};
-+
-+	/* Sanitize the optional input */
-+	if ((input =3D=3D NULL) && (input_length !=3D 0)) {
-+	    return PSA_ERROR_INVALID_ARGUMENT;
-+	}
-+
-+	struct psa_invec in_vec[] =3D {
-+	    {.base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cr=
ypto_pack_iovec)},
-+	    {.base =3D psa_ptr_const_to_u32(input), .len =3D input_length}
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+	    {.base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t)},
-+	    {.base =3D psa_ptr_const_to_u32(output), .len =3D output_size},
-+	};
-+
-+	size_t in_len =3D IOVEC_LEN(in_vec);
-+
-+	if (input =3D=3D NULL) {
-+	    in_len--;
-+	}
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+	                   in_len, out_vec, IOVEC_LEN(out_vec));
-+
-+	*output_length =3D out_vec[1].len;
-+	return status;
- }
-=20
- static inline psa_status_t crypto_caller_aead_finish(
-@@ -223,7 +379,48 @@ static inline psa_status_t crypto_caller_aead_finis=
h(
- 					     size_t tag_size,
- 					     size_t *tag_length)
- {
--	return PSA_ERROR_NOT_SUPPORTED;
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+	    .sfn_id =3D TFM_CRYPTO_AEAD_FINISH_SID,
-+	    .op_handle =3D op_handle,
-+	};
-+
-+	/* Sanitize the optional output */
-+	if ((aeadtext =3D=3D NULL) && (aeadtext_size !=3D 0)) {
-+	    return PSA_ERROR_INVALID_ARGUMENT;
-+	}
-+
-+	struct psa_invec in_vec[] =3D {
-+	    {.base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cr=
ypto_pack_iovec)},
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+	    {.base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t)},
-+	    {.base =3D psa_ptr_const_to_u32(tag), .len =3D tag_size},
-+	    {.base =3D psa_ptr_const_to_u32(aeadtext), .len =3D aeadtext_size}
-+	};
-+
-+	size_t out_len =3D IOVEC_LEN(out_vec);
-+
-+	if (aeadtext =3D=3D NULL || aeadtext_size =3D=3D 0) {
-+	    out_len--;
-+	}
-+	if ((out_len =3D=3D 3) && (aeadtext_length =3D=3D NULL)) {
-+	    return PSA_ERROR_INVALID_ARGUMENT;
-+	}
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+	                   IOVEC_LEN(in_vec), out_vec, out_len);
-+
-+	*tag_length =3D out_vec[1].len;
-+
-+	if (out_len =3D=3D 3) {
-+	    *aeadtext_length =3D out_vec[2].len;
-+	} else {
-+	    *aeadtext_length =3D 0;
-+	}
-+	return status;
- }
-=20
- static inline psa_status_t crypto_caller_aead_verify(
-@@ -235,14 +432,94 @@ static inline psa_status_t crypto_caller_aead_veri=
fy(
- 					     const uint8_t *tag,
- 					     size_t tag_length)
- {
--	return PSA_ERROR_NOT_SUPPORTED;
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+	    .sfn_id =3D TFM_CRYPTO_AEAD_VERIFY_SID,
-+	    .op_handle =3D op_handle,
-+	};
-+
-+	/* Sanitize the optional output */
-+	if ((plaintext =3D=3D NULL) && (plaintext_size !=3D 0)) {
-+	    return PSA_ERROR_INVALID_ARGUMENT;
-+	}
-+
-+	struct psa_invec in_vec[] =3D {
-+	    {.base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cr=
ypto_pack_iovec)},
-+	    {.base =3D psa_ptr_const_to_u32(tag), .len =3D tag_length}
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+	    {.base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t)},
-+	    {.base =3D psa_ptr_const_to_u32(plaintext), .len =3D plaintext_siz=
e},
-+	};
-+
-+	size_t out_len =3D IOVEC_LEN(out_vec);
-+
-+	if (plaintext =3D=3D NULL || plaintext_size =3D=3D 0) {
-+	    out_len--;
-+	}
-+	if ((out_len =3D=3D 2) && (plaintext_length =3D=3D NULL)) {
-+	    return PSA_ERROR_INVALID_ARGUMENT;
-+	}
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+	                   IOVEC_LEN(in_vec), out_vec, out_len);
-+
-+	if (out_len =3D=3D 2) {
-+	    *plaintext_length =3D out_vec[1].len;
-+	} else {
-+	    *plaintext_length =3D 0;
-+	}
-+	return status;
- }
-=20
- static inline psa_status_t crypto_caller_aead_abort(
- 					    struct service_client *context,
- 					    uint32_t op_handle)
- {
--	return PSA_ERROR_NOT_SUPPORTED;
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+	    .sfn_id =3D TFM_CRYPTO_AEAD_ABORT_SID,
-+	    .op_handle =3D op_handle,
-+	};
-+
-+	struct psa_invec in_vec[] =3D {
-+	    {.base =3D psa_ptr_to_u32(&iov), .len =3D sizeof(struct psa_ipc_cr=
ypto_pack_iovec)},
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+	    {.base =3D psa_ptr_to_u32(&op_handle), .len =3D sizeof(uint32_t)},
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+	                   IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+	return status;
-+}
-+
-+static inline size_t crypto_caller_aead_max_update_size(const struct se=
rvice_client *context)
-+{
-+       /* Returns the maximum number of bytes that may be
-+        * carried as a parameter of the mac_update operation
-+        *  using the packed-c encoding.
-+        */
-+       size_t payload_space =3D context->service_info.max_payload;
-+       size_t overhead =3D iov_size;
-+
-+       return (payload_space > overhead) ? payload_space - overhead : 0=
;
-+}
-+
-+static inline size_t crypto_caller_aead_max_update_ad_size(const struct=
 service_client *context)
-+{
-+	/* Returns the maximum number of bytes that may be
-+	 * carried as a parameter of the mac_update operation
-+	 *  using the packed-c encoding.
-+	 */
-+	size_t payload_space =3D context->service_info.max_payload;
-+	size_t overhead =3D iov_size;
-+
-+	return (payload_space > overhead) ? payload_space - overhead : 0;
- }
-=20
- #ifdef __cplusplus
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_sign_hash.h b/components/service/crypto/client/caller/psa_ipc/crypto_c=
aller_sign_hash.h
-index 71d88cededf5..e4a2b167defb 100644
---- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_sign=
_hash.h
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_sign=
_hash.h
-@@ -57,6 +57,41 @@ static inline psa_status_t crypto_caller_sign_hash(st=
ruct service_client *contex
- 	return status;
- }
-=20
-+static inline psa_status_t crypto_caller_sign_message(struct service_cl=
ient *context,
-+						   psa_key_id_t id,
-+						   psa_algorithm_t alg,
-+						   const uint8_t *hash,
-+						   size_t hash_length,
-+						   uint8_t *signature,
-+						   size_t signature_size,
-+						   size_t *signature_length)
-+{
-+	struct service_client *ipc =3D context;
-+	struct rpc_caller *caller =3D ipc->caller;
-+	psa_status_t status;
-+	struct psa_ipc_crypto_pack_iovec iov =3D {
-+		.sfn_id =3D TFM_CRYPTO_SIGN_MESSAGE_SID,
-+		.key_id =3D id,
-+		.alg =3D alg,
-+	};
-+	struct psa_invec in_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(&iov), .len =3D iov_size },
-+		{ .base =3D psa_ptr_const_to_u32(hash), .len =3D hash_length },
-+	};
-+	struct psa_outvec out_vec[] =3D {
-+		{ .base =3D psa_ptr_to_u32(signature), .len =3D signature_size },
-+	};
-+
-+	status =3D psa_call(caller, TFM_CRYPTO_HANDLE, PSA_IPC_CALL, in_vec,
-+			  IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-+
-+	*signature_length =3D out_vec[0].len;
-+
-+	return status;
-+}
-+
-+
-+
- #ifdef __cplusplus
- }
- #endif
-diff --git a/components/service/crypto/client/caller/psa_ipc/crypto_call=
er_verify_hash.h b/components/service/crypto/client/caller/psa_ipc/crypto=
_caller_verify_hash.h
-index e16f6e5450af..cc9279ee79f2 100644
---- a/components/service/crypto/client/caller/psa_ipc/crypto_caller_veri=
fy_hash.h
-+++ b/components/service/crypto/client/caller/psa_ipc/crypto_caller_veri=
fy_hash.h
-@@ -24,19 +24,20 @@
- extern "C" {
- #endif
-=20
--static inline psa_status_t crypto_caller_verify_hash(struct service_cli=
ent *context,
-+static inline psa_status_t crypto_caller_common(struct service_client *=
context,
- 						     psa_key_id_t id,
- 						     psa_algorithm_t alg,
- 						     const uint8_t *hash,
- 						     size_t hash_length,
- 						     const uint8_t *signature,
--						     size_t signature_length)
-+						     size_t signature_length,
-+						     uint32_t sfn_id)
- {
- 	struct service_client *ipc =3D context;
- 	struct rpc_caller *caller =3D ipc->caller;
- 	psa_status_t status;
- 	struct psa_ipc_crypto_pack_iovec iov =3D {
--		.sfn_id =3D TFM_CRYPTO_VERIFY_HASH_SID,
-+		.sfn_id =3D sfn_id,
- 		.key_id =3D id,
- 		.alg =3D alg,
- 	};
-@@ -52,6 +53,32 @@ static inline psa_status_t crypto_caller_verify_hash(=
struct service_client *cont
- 	return status;
- }
-=20
-+static inline psa_status_t crypto_caller_verify_hash(struct service_cli=
ent *context,
-+						     psa_key_id_t id,
-+						     psa_algorithm_t alg,
-+						     const uint8_t *hash,
-+						     size_t hash_length,
-+						     const uint8_t *signature,
-+						     size_t signature_length)
-+{
-+
-+	return crypto_caller_common(context,id,alg,hash,hash_length,
-+			signature,signature_length, TFM_CRYPTO_VERIFY_HASH_SID);
-+}
-+
-+static inline psa_status_t crypto_caller_verify_message(struct service_=
client *context,
-+						     psa_key_id_t id,
-+						     psa_algorithm_t alg,
-+						     const uint8_t *hash,
-+						     size_t hash_length,
-+						     const uint8_t *signature,
-+						     size_t signature_length)
-+{
-+
-+	return crypto_caller_common(context,id,alg,hash,hash_length,
-+			signature,signature_length, TFM_CRYPTO_VERIFY_MESSAGE_SID);
-+}
-+
- #ifdef __cplusplus
- }
- #endif
---=20
-2.38.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0017-Fix-update-psa_set_key_usage_flags-definition-to-the.patch b/meta-ar=
m-bsp/recipes-security/trusted-services/corstone1000/0017-Fix-update-psa_=
set_key_usage_flags-definition-to-the.patch
deleted file mode 100644
index 4adcd90a..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0017-Fi=
x-update-psa_set_key_usage_flags-definition-to-the.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 5a5e162e17c9decb04b3b2905a0fb604e8f06e91 Mon Sep 17 00:00:00 2001
-From: Satish Kumar <satish.kumar01@arm.com>
-Date: Mon, 14 Feb 2022 17:52:00 +0000
-Subject: [PATCH 17/20] Fix : update psa_set_key_usage_flags definition t=
o the
- latest from the tf-m
-
-Upstream-Status: Pending
-Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- components/service/crypto/include/psa/crypto_struct.h | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/components/service/crypto/include/psa/crypto_struct.h b/com=
ponents/service/crypto/include/psa/crypto_struct.h
-index 1bc55e375eea..b4a7ed4b39d3 100644
---- a/components/service/crypto/include/psa/crypto_struct.h
-+++ b/components/service/crypto/include/psa/crypto_struct.h
-@@ -155,9 +155,19 @@ static inline psa_key_lifetime_t psa_get_key_lifeti=
me(
-     return( attributes->lifetime );
- }
-=20
-+static inline void psa_extend_key_usage_flags( psa_key_usage_t *usage_f=
lags )
-+{
-+    if( *usage_flags & PSA_KEY_USAGE_SIGN_HASH )
-+        *usage_flags |=3D PSA_KEY_USAGE_SIGN_MESSAGE;
-+
-+    if( *usage_flags & PSA_KEY_USAGE_VERIFY_HASH )
-+        *usage_flags |=3D PSA_KEY_USAGE_VERIFY_MESSAGE;
-+}
-+
- static inline void psa_set_key_usage_flags(psa_key_attributes_t *attrib=
utes,
-                                            psa_key_usage_t usage_flags)
- {
-+    psa_extend_key_usage_flags( &usage_flags );
-     attributes->usage =3D usage_flags;
- }
-=20
---=20
-2.38.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0019-plat-corstone1000-change-default-smm-values.patch b/meta-arm-bsp/rec=
ipes-security/trusted-services/corstone1000/0019-plat-corstone1000-change=
-default-smm-values.patch
deleted file mode 100644
index 02c89d89..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0019-pl=
at-corstone1000-change-default-smm-values.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From c519bae79629bfe551d79cfeb4e7d8a059545145 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Tue, 11 Oct 2022 10:46:10 +0100
-Subject: [PATCH 19/20] plat: corstone1000: change default smm values
-
-Smm gateway uses SE proxy to route the calls for any NV
-storage so set the NV_STORE_SN.
-Change the storage index uid because TF-M in the secure
-enclave reserves the default value (0x1) to some internal
-operation.
-Increase the maximum number of uefi variables to cope with all
-the needs for testing and certification
-
-Upstream-Status: Pending
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- platform/providers/arm/corstone1000/platform.cmake | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/platform/providers/arm/corstone1000/platform.cmake b/platfo=
rm/providers/arm/corstone1000/platform.cmake
-index 51e5faa3e4d8..04b629a81906 100644
---- a/platform/providers/arm/corstone1000/platform.cmake
-+++ b/platform/providers/arm/corstone1000/platform.cmake
-@@ -10,3 +10,9 @@
- include(${TS_ROOT}/platform/drivers/arm/mhu_driver/component.cmake)
-=20
- add_compile_definitions(MBEDTLS_ECP_DP_SECP521R1_ENABLED)
-+
-+target_compile_definitions(${TGT} PRIVATE
-+	SMM_GATEWAY_NV_STORE_SN=3D"sn:ffa:46bb39d1-b4d9-45b5-88ff-040027dab249=
:1"
-+	SMM_VARIABLE_INDEX_STORAGE_UID=3D0x787
-+	SMM_GATEWAY_MAX_UEFI_VARIABLES=3D100
-+)
---=20
-2.38.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0021-smm_gateway-add-checks-for-null-attributes.patch b/meta-arm-bsp/reci=
pes-security/trusted-services/corstone1000/0021-smm_gateway-add-checks-fo=
r-null-attributes.patch
deleted file mode 100644
index 87c053fc..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0021-sm=
m_gateway-add-checks-for-null-attributes.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 6d3cac6f3a6e977e9330c9c06514a372ade170a2 Mon Sep 17 00:00:00 2001
-From: Emekcan <emekcan.aras@arm.com>
-Date: Wed, 2 Nov 2022 09:58:27 +0000
-Subject: [PATCH] smm_gateway: add checks for null attributes
-
-As par EDK-2 and EDK-2 test code, setVariable() with 0=20
-attributes means a delete variable request. Currently,=20
-smm gatway doesn't handle this scenario. This commit adds
-that support.
-
-Upstream-Status: Pending
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
----
- components/service/smm_variable/backend/uefi_variable_store.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/components/service/smm_variable/backend/uefi_variable_store=
.c b/components/service/smm_variable/backend/uefi_variable_store.c
-index 6c3b9ed8..a691dc5d 100644
---- a/components/service/smm_variable/backend/uefi_variable_store.c
-+++ b/components/service/smm_variable/backend/uefi_variable_store.c
-@@ -202,9 +202,9 @@ efi_status_t uefi_variable_store_set_variable(
- 		if (info->is_variable_set) {
-=20
- 			/* It's a request to update to an existing variable */
--			if (!(var->Attributes &
-+			if (!(var->Attributes) || (!(var->Attributes &
- 				(EFI_VARIABLE_APPEND_WRITE | EFI_VARIABLE_AUTHENTICATED_WRITE_ACCES=
S_MASK)) &&
--				!var->DataSize) {
-+				!var->DataSize)) {
-=20
- 				/* It's a remove operation - for a remove, the variable
- 				 * data must be removed from the storage backend before
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0022-GetNextVariableName-Fix.patch b/meta-arm-bsp/recipes-security/truste=
d-services/corstone1000/0022-GetNextVariableName-Fix.patch
deleted file mode 100644
index ed4e6e27..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0022-Ge=
tNextVariableName-Fix.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 2aa665ad2cb13bc79b645db41686449a47593aab Mon Sep 17 00:00:00 2001
-From: Emekcan <emekcan.aras@arm.com>
-Date: Thu, 3 Nov 2022 17:43:40 +0000
-Subject: [PATCH] smm_gateway: GetNextVariableName Fix
-
-GetNextVariableName() should return EFI_BUFFER_TOO_SMALL=20
-when NameSize is smaller than the actual NameSize. It=20
-currently returns EFI_BUFFER_OUT_OF_RESOURCES due to setting
-max_name_len incorrectly. This fixes max_name_len error by
-replacing it with actual NameSize request by u-boot.
-
-Upstream-Status: Pending
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
----
- .../service/smm_variable/provider/smm_variable_provider.c       | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/components/service/smm_variable/provider/smm_variable_provi=
der.c b/components/service/smm_variable/provider/smm_variable_provider.c
-index a9679b7e..6a4b6fa7 100644
---- a/components/service/smm_variable/provider/smm_variable_provider.c
-+++ b/components/service/smm_variable/provider/smm_variable_provider.c
-@@ -197,7 +197,7 @@ static rpc_status_t get_next_variable_name_handler(v=
oid *context, struct call_re
- 			efi_status =3D uefi_variable_store_get_next_variable_name(
- 				&this_instance->variable_store,
- 				(SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME*)resp_buf->data,
--				max_name_len,
-+				((SMM_VARIABLE_COMMUNICATE_GET_NEXT_VARIABLE_NAME*)resp_buf->data)-=
>NameSize,
- 				&resp_buf->data_len);
- 		}
- 		else {
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0023-Use-the-stateless-platform-service.patch b/meta-arm-bsp/recipes-secu=
rity/trusted-services/corstone1000/0023-Use-the-stateless-platform-servic=
e.patch
deleted file mode 100644
index 824196c1..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0023-Us=
e-the-stateless-platform-service.patch
+++ /dev/null
@@ -1,140 +0,0 @@
-From 956b8a8e1dd5702b9c1657f4ec27a7aeddb0758e Mon Sep 17 00:00:00 2001
-From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-Date: Mon, 21 Nov 2022 00:08:20 +0000
-Subject: [PATCH] Use the stateless platform service calls
-
-Calls to psa_connect is not needed and psa_call can be called
-directly with a pre defined handle.
-
-Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
-Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
-Upstream-Status: Inappropriate [Design is to revisted]
-
----
- .../provider/capsule_update_provider.c        | 24 ++++---------------
- .../provider/corstone1000_fmp_service.c       | 10 ++++----
- .../provider/corstone1000_fmp_service.h       |  3 +--
- components/service/common/include/psa/sid.h   |  6 +++++
- 4 files changed, 16 insertions(+), 27 deletions(-)
-
-diff --git a/components/service/capsule_update/provider/capsule_update_p=
rovider.c b/components/service/capsule_update/provider/capsule_update_pro=
vider.c
-index 991a2235..6809249f 100644
---- a/components/service/capsule_update/provider/capsule_update_provider=
.c
-+++ b/components/service/capsule_update/provider/capsule_update_provider=
.c
-@@ -61,7 +61,6 @@ void capsule_update_provider_deinit(struct capsule_upd=
ate_provider *context)
- static rpc_status_t event_handler(uint32_t opcode, struct rpc_caller *c=
aller)
- {
- 	uint32_t ioctl_id;
--	psa_handle_t handle;
- 	rpc_status_t rpc_status =3D TS_RPC_CALL_ACCEPTED;
-=20
- 	struct psa_invec in_vec[] =3D {
-@@ -79,31 +78,18 @@ static rpc_status_t event_handler(uint32_t opcode, s=
truct rpc_caller *caller)
- 		case CAPSULE_UPDATE_REQUEST:
- 		/* Openamp call with IOCTL for firmware update*/
- 		ioctl_id =3D IOCTL_CORSTONE1000_FWU_FLASH_IMAGES;
--		handle =3D psa_connect(caller, TFM_SP_PLATFORM_IOCTL_SID,
--				TFM_SP_PLATFORM_IOCTL_VERSION);
--		if (handle <=3D 0) {
--			EMSG("%s Invalid handle", __func__);
--			rpc_status =3D TS_RPC_ERROR_INVALID_PARAMETER;
--			return rpc_status;
--		}
--		psa_call(caller,handle, PSA_IPC_CALL,
-+		psa_call(caller,TFM_PLATFORM_SERVICE_HANDLE, TFM_PLATFORM_API_ID_IOCT=
L,
- 			in_vec,IOVEC_LEN(in_vec), NULL, 0);
--		set_fmp_image_info(caller, handle);
-+		set_fmp_image_info(caller);
- 		break;
-=20
- 		case KERNEL_STARTED_EVENT:
- 		ioctl_id =3D IOCTL_CORSTONE1000_FWU_HOST_ACK;
- 		/*openamp call with IOCTL for kernel start*/
--		handle =3D psa_connect(caller, TFM_SP_PLATFORM_IOCTL_SID,
--				TFM_SP_PLATFORM_IOCTL_VERSION);
--		if (handle <=3D 0) {
--			EMSG("%s Invalid handle", __func__);
--			rpc_status =3D TS_RPC_ERROR_INVALID_PARAMETER;
--			return rpc_status;
--		}
--		psa_call(caller,handle, PSA_IPC_CALL,
-+	=09
-+		psa_call(caller,TFM_PLATFORM_SERVICE_HANDLE, TFM_PLATFORM_API_ID_IOCT=
L,
- 			in_vec,IOVEC_LEN(in_vec), NULL, 0);
--		set_fmp_image_info(caller, handle);
-+		set_fmp_image_info(caller);
- 		break;
- 		default:
- 			EMSG("%s unsupported opcode", __func__);
-diff --git a/components/service/capsule_update/provider/corstone1000_fmp=
_service.c b/components/service/capsule_update/provider/corstone1000_fmp_=
service.c
-index 6a7a47a7..d811af9f 100644
---- a/components/service/capsule_update/provider/corstone1000_fmp_servic=
e.c
-+++ b/components/service/capsule_update/provider/corstone1000_fmp_servic=
e.c
-@@ -238,8 +238,7 @@ static psa_status_t unpack_image_info(void *buffer, =
uint32_t size)
-     return PSA_SUCCESS;
- }
-=20
--static psa_status_t get_image_info(struct rpc_caller *caller,
--			   psa_handle_t platform_service_handle)
-+static psa_status_t get_image_info(struct rpc_caller *caller)
- {
-     psa_status_t status;
-     psa_handle_t handle;
-@@ -255,7 +254,7 @@ static psa_status_t get_image_info(struct rpc_caller=
 *caller,
-=20
-     memset(image_info_buffer, 0, IMAGE_INFO_BUFFER_SIZE);
-=20
--    psa_call(caller, platform_service_handle, PSA_IPC_CALL,
-+    psa_call(caller, TFM_PLATFORM_SERVICE_HANDLE, TFM_PLATFORM_API_ID_I=
OCTL,
- 	     in_vec, IOVEC_LEN(in_vec), out_vec, IOVEC_LEN(out_vec));
-=20
-     status =3D unpack_image_info(image_info_buffer, IMAGE_INFO_BUFFER_S=
IZE);
-@@ -288,12 +287,11 @@ static psa_status_t set_image_info(struct rpc_call=
er *caller)
-     return PSA_SUCCESS;
- }
-=20
--void set_fmp_image_info(struct rpc_caller *caller,
--			psa_handle_t platform_service_handle)
-+void set_fmp_image_info(struct rpc_caller *caller)
- {
-     psa_status_t status;
-=20
--    status =3D get_image_info(caller, platform_service_handle);
-+    status =3D get_image_info(caller);
-     if (status !=3D PSA_SUCCESS) {
- 	return;
-     }
-diff --git a/components/service/capsule_update/provider/corstone1000_fmp=
_service.h b/components/service/capsule_update/provider/corstone1000_fmp_=
service.h
-index 95fba2a0..963223e8 100644
---- a/components/service/capsule_update/provider/corstone1000_fmp_servic=
e.h
-+++ b/components/service/capsule_update/provider/corstone1000_fmp_servic=
e.h
-@@ -16,8 +16,7 @@ extern "C" {
-=20
- void provision_fmp_variables_metadata(struct rpc_caller *caller);
-=20
--void set_fmp_image_info(struct rpc_caller *caller,
--		psa_handle_t platform_service_handle);
-+void set_fmp_image_info(struct rpc_caller *caller);
-=20
- #ifdef __cplusplus
- } /* extern "C" */
-diff --git a/components/service/common/include/psa/sid.h b/components/se=
rvice/common/include/psa/sid.h
-index 7a29cc25..8103a9af 100644
---- a/components/service/common/include/psa/sid.h
-+++ b/components/service/common/include/psa/sid.h
-@@ -37,6 +37,12 @@ extern "C" {
- #define TFM_CRYPTO_VERSION                                         (1U)
- #define TFM_CRYPTO_HANDLE                                          (0x4=
0000100U)
-=20
-+
-+/******** TFM_PLATFORM_SERVICE *******/
-+#define TFM_PLATFORM_API_ID_IOCTL         (1013)
-+#define TFM_PLATFORM_SERVICE_HANDLE       (0x40000105U)
-+
-+
- /**
-  * \brief Define a progressive numerical value for each SID which can b=
e used
-  *        when dispatching the requests to the service
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platfo=
rms.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms=
.inc
index 867bd66e..17c957e2 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
@@ -2,32 +2,12 @@ FILESEXTRAPATHS:prepend:corstone1000 :=3D "${THISDIR}/c=
orstone1000:"
=20
 COMPATIBLE_MACHINE:corstone1000 =3D "corstone1000"
 SRC_URI:append:corstone1000  =3D " \
-    file://0001-Add-openamp-to-SE-proxy-deployment.patch;patchdir=3D../t=
rusted-services \
-    file://0002-Implement-mhu-driver-and-the-OpenAmp-conversion-laye.pat=
ch;patchdir=3D../trusted-services \
-    file://0003-Add-openamp-rpc-caller.patch;patchdir=3D../trusted-servi=
ces \
-    file://0004-add-psa-client-definitions-for-ff-m.patch;patchdir=3D../=
trusted-services \
-    file://0005-Add-common-service-component-to-ipc-support.patch;patchd=
ir=3D../trusted-services \
-    file://0006-Add-secure-storage-ipc-backend.patch;patchdir=3D../trust=
ed-services \
-    file://0007-Use-secure-storage-ipc-and-openamp-for-se_proxy.patch;pa=
tchdir=3D../trusted-services \
-    file://0008-Run-psa-arch-test.patch;patchdir=3D../trusted-services \
-    file://0009-Use-address-instead-of-pointers.patch;patchdir=3D../trus=
ted-services \
-    file://0010-Add-psa-ipc-attestation-to-se-proxy.patch;patchdir=3D../=
trusted-services \
-    file://0011-Setup-its-backend-as-openamp-rpc-using-secure-storag.pat=
ch;patchdir=3D../trusted-services;patchdir=3D../trusted-services \
-    file://0012-add-psa-ipc-crypto-backend.patch;patchdir=3D../trusted-s=
ervices \
-    file://0013-Add-stub-capsule-update-service-components.patch;patchdi=
r=3D../trusted-services \
-    file://0014-Configure-storage-size.patch;patchdir=3D../trusted-servi=
ces \
-    file://0015-Fix-Crypto-interface-structure-aligned-with-tf-m-cha.pat=
ch;patchdir=3D../trusted-services;patchdir=3D../trusted-services \
-    file://0016-Integrate-remaining-psa-ipc-client-APIs.patch;patchdir=3D=
../trusted-services \
-    file://0017-Fix-update-psa_set_key_usage_flags-definition-to-the.pat=
ch;patchdir=3D../trusted-services;patchdir=3D../trusted-services \
-    file://0018-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch;patchdir=
=3D../trusted-services \
-    file://0019-plat-corstone1000-change-default-smm-values.patch;patchd=
ir=3D../trusted-services \
-    file://0020-FMP-Support-in-Corstone1000.patch;patchdir=3D../trusted-=
services \
-    file://0021-smm_gateway-add-checks-for-null-attributes.patch;patchdi=
r=3D../trusted-services \
-    file://0022-GetNextVariableName-Fix.patch;patchdir=3D../trusted-serv=
ices \
-    file://0023-Use-the-stateless-platform-service.patch;patchdir=3D../t=
rusted-services \
-    file://0024-TF-Mv1.7-alignment-Align-PSA-Crypto-SIDs.patch;patchdir=3D=
../trusted-services \
-    file://0025-TF-Mv1.7-alignment-Align-crypto-iovec-definition.patch;p=
atchdir=3D../trusted-services \
-    file://0026-TF-Mv1.7-alignment-PSA-crypto-client-in-out_vec.patch;pa=
tchdir=3D../trusted-services \
+    file://0001-Add-stub-capsule-update-service-components.patch;patchdi=
r=3D../trusted-services \
+    file://0002-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch;patchdir=
=3D../trusted-services \
+    file://0003-FMP-Support-in-Corstone1000.patch;patchdir=3D../trusted-=
services \
+    file://0004-TF-Mv1.7-alignment-Align-PSA-Crypto-SIDs.patch;patchdir=3D=
../trusted-services \
+    file://0005-TF-Mv1.7-alignment-Align-crypto-iovec-definition.patch;p=
atchdir=3D../trusted-services \
+    file://0006-TF-Mv1.7-alignment-PSA-crypto-client-in-out_vec.patch;pa=
tchdir=3D../trusted-services \
     "
=20
=20
--=20
2.39.1.windows.1


