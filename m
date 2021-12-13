Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6953CC4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 16:26:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.13490.1639412788997565179
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 08:26:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7ABFC143B;
	Mon, 13 Dec 2021 08:26:27 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.32.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E9EAB3F73B;
	Mon, 13 Dec 2021 08:26:25 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>,
	Emekcan Aras <emekcan.aras@arm.com>,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 3/6] arm-bsp/psa-arch-tests: corstone1000: build the test
 applications
Date: Mon, 13 Dec 2021 16:26:07 +0000
Message-Id: <20211213162610.31273-4-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211213162610.31273-1-abdellatif.elkhlifi@arm.com>
References: <20211213162610.31273-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 Dec 2021 16:26:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2644

From: Emekcan Aras <Emekcan.Aras@arm.com>

This commit adds support for building/installing the test
application.

Also fixing CMake issues on the current trusted-service CMake source files.

Change-Id: Iae0fc9bf9362cf5b7d65cd7b9f0445f62f3b83eb
Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../psa-arch-tests-corstone1000.inc           | 43 ++++++++++++
 ...arch-test-sysroot_compiler_flags_fix.patch | 68 +++++++++++++++++++
 .../psa-arch-tests_%.bbappend                 |  6 ++
 3 files changed, 117 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/psa-arch-tests-corstone1000.inc
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/psa-arch-tests/corstone1000/0001-psa-arch-test-sysroot_compiler_flags_fix.patch
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/psa-arch-tests_%.bbappend

diff --git a/meta-arm-bsp/recipes-security/trusted-services/psa-arch-tests-corstone1000.inc b/meta-arm-bsp/recipes-security/trusted-services/psa-arch-tests-corstone1000.inc
new file mode 100644
index 0000000..f1aea12
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/psa-arch-tests-corstone1000.inc
@@ -0,0 +1,43 @@
+FILESEXTRAPATHS:prepend := "${THISDIR}/psa-arch-tests/corstone1000:"
+
+DEPENDS += "cmake-native"
+
+export CMAKE_BUILD_PARALLEL_LEVEL
+CMAKE_BUILD_PARALLEL_LEVEL = "${@oe.utils.parallel_make(d, True)}"
+
+COMPATIBLE_MACHINE = "corstone1000"
+
+SRC_URI:append = "\
+    file://0001-psa-arch-test-sysroot_compiler_flags_fix.patch \
+    "
+
+FILES:${PN} += "${libdir}/libts.so*  ${libdir}/deployments  ${bindir}/psa-*"
+FILES:${PN}-dev = "${includedir}/deployments/psa-api-test/"
+
+INSANE_SKIP:${PN} += "rpaths"
+
+do_configure() {
+    for PSA_API_TEST in ${PSA_API_TESTS}; do
+        cmake \
+        -DSYSROOT_YOCTO=${RECIPE_SYSROOT} \
+        -S ${S}/$PSA_API_TEST -B "${B}/$PSA_API_TEST"
+    done
+}
+
+do_compile() {
+    for PSA_API_TEST in ${PSA_API_TESTS}; do
+        cmake --build "${B}/$PSA_API_TEST"
+    done
+}
+
+do_install() {
+    for PSA_API_TEST in ${PSA_API_TESTS}; do
+        install -d -m 0755 ${D}${libdir}/${PSA_API_TEST}
+        install -d -m 0755 ${D}${includedir}/${PSA_API_TEST}
+        install -m 0755 ${B}/${PSA_API_TEST}/libts_install/arm-linux/lib/*.so* ${D}${libdir}
+	install -d -m 0755 ${B}/${PSA_API_TEST}/libts_install/arm-linux/include ${D}${includedir}/${PSA_API_TEST}
+	psafile_fullpath=`ls ${B}/${PSA_API_TEST}/psa-*`
+	psafile_filename="`basename -s .bin ${psafile_fullpath}`"
+        install -D -p -m 0755 ${psafile_fullpath} ${D}/${bindir}/${psafile_filename}
+    done
+}
\ No newline at end of file
diff --git a/meta-arm-bsp/recipes-security/trusted-services/psa-arch-tests/corstone1000/0001-psa-arch-test-sysroot_compiler_flags_fix.patch b/meta-arm-bsp/recipes-security/trusted-services/psa-arch-tests/corstone1000/0001-psa-arch-test-sysroot_compiler_flags_fix.patch
new file mode 100644
index 0000000..e9ce0c5
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/psa-arch-tests/corstone1000/0001-psa-arch-test-sysroot_compiler_flags_fix.patch
@@ -0,0 +1,68 @@
+Upstream-Status: Inappropriate [Not for upstreaming in the original repo]
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+
+From 340ef6788d2803543b15235bf16a79cbc02235bd Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <Emekcan.Aras@arm.com>
+Date: Mon, 6 Dec 2021 10:21:59 +0000
+
+[PATCH] arm-bsp/psa-arch-test: Integrate psa-arch-test
+
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+---
+ deployments/libts/libts-import.cmake         | 4 +++-
+ external/MbedTLS/MbedTLS.cmake               | 1 +
+ external/psa_arch_tests/psa_arch_tests.cmake | 1 +
+ 3 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/deployments/libts/libts-import.cmake b/deployments/libts/libts-import.cmake
+index 792ba86..e3793e8 100644
+--- a/deployments/libts/libts-import.cmake
++++ b/deployments/libts/libts-import.cmake
+@@ -19,7 +19,6 @@ if(NOT DEFINED PROCESSOR_COUNT)
+ 	ProcessorCount(PROCESSOR_COUNT)
+ 	set(PROCESSOR_COUNT ${PROCESSOR_COUNT} CACHE STRING "Number of cores to use for parallel builds.")
+ endif()
+-
+ set(LIBTS_INSTALL_PATH "${CMAKE_CURRENT_BINARY_DIR}/libts_install" CACHE PATH "libts installation directory")
+ set(LIBTS_PACKAGE_PATH "${LIBTS_INSTALL_PATH}/lib/cmake" CACHE PATH "libts CMake package directory")
+ set(LIBTS_SOURCE_DIR "${TS_ROOT}/deployments/libts/${TS_ENV}" CACHE PATH "libts source directory")
+@@ -27,9 +26,12 @@ set(LIBTS_BINARY_DIR "${CMAKE_CURRENT_BINARY_DIR}/_deps/libts-build" CACHE PATH
+ 
+ file(MAKE_DIRECTORY ${LIBTS_BINARY_DIR})
+ 
++set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} --sysroot=${SYSROOT_YOCTO}")
++
+ #Configure the library
+ execute_process(COMMAND
+ 	${CMAKE_COMMAND}
++		-DCMAKE_SYSROOT=${SYSROOT_YOCTO}
+ 		-DCMAKE_INSTALL_PREFIX=${LIBTS_INSTALL_PATH}
+ 		-GUnix\ Makefiles
+ 		${LIBTS_SOURCE_DIR}
+diff --git a/external/MbedTLS/MbedTLS.cmake b/external/MbedTLS/MbedTLS.cmake
+index 3cbaed1..8c53f88 100644
+--- a/external/MbedTLS/MbedTLS.cmake
++++ b/external/MbedTLS/MbedTLS.cmake
+@@ -59,6 +59,7 @@ set(PSA_CRYPTO_API_INCLUDE "${MBEDTLS_INSTALL_PATH}/include" CACHE STRING "PSA C
+ #Configure the library
+ execute_process(COMMAND
+ 	${CMAKE_COMMAND}
++		-DCMAKE_SYSROOT=${SYSROOT_YOCTO}
+ 		-DENABLE_PROGRAMS=OFF
+ 		-DENABLE_TESTING=OFF
+ 		-DUNSAFE_BUILD=ON
+diff --git a/external/psa_arch_tests/psa_arch_tests.cmake b/external/psa_arch_tests/psa_arch_tests.cmake
+index e6ab73f..af00cfc 100644
+--- a/external/psa_arch_tests/psa_arch_tests.cmake
++++ b/external/psa_arch_tests/psa_arch_tests.cmake
+@@ -52,6 +52,7 @@ string(REPLACE ";" " " PSA_ARCH_TEST_EXTERNAL_DEFS "${PSA_ARCH_TEST_EXTERNAL_DEF
+ # Configure the psa-arch-test library
+ execute_process(COMMAND
+ 	${CMAKE_COMMAND}
++			-DCMAKE_SYSROOT=${SYSROOT_YOCTO}
+ 			-DTOOLCHAIN=INHERIT
+ 			-DCMAKE_TOOLCHAIN_FILE=${TS_EXTERNAL_LIB_TOOLCHAIN_FILE}
+ 			-DPSA_INCLUDE_PATHS=${PSA_ARCH_TESTS_EXTERNAL_INCLUDE_PATHS}
+-- 
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/psa-arch-tests_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/psa-arch-tests_%.bbappend
new file mode 100644
index 0000000..e517cd6
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/psa-arch-tests_%.bbappend
@@ -0,0 +1,6 @@
+# Machine specific configurations
+
+MACHINE_PSA_REQUIRE ?= ""
+MACHINE_PSA_REQUIRE:corstone1000 = "psa-arch-tests-corstone1000.inc"
+
+require ${MACHINE_PSA_REQUIRE}
-- 
2.17.1


