Return-Path: <anton.antonov@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F1D8C0502A
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 18:42:08 +0000 (UTC)
Received: from cam-smtp0.cambridge.arm.com (cam-smtp0.cambridge.arm.com
 [217.140.106.51])
 by mx.groups.io with SMTP id smtpd.web12.2682.1661971326706188289
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 31 Aug 2022 11:42:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.106.51, mailfrom: anton.antonov@arm.com)
Received: from atg-devlab-kelpie.cambridge.arm.com
 (atg-devlab-kelpie.cambridge.arm.com [10.2.80.92])
	by cam-smtp0.cambridge.arm.com (8.13.8/8.13.8) with ESMTP id 27VIiIV7011556;
	Wed, 31 Aug 2022 19:44:19 +0100
From: Anton Antonov <Anton.Antonov@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Anton.Antonov@arm.com
Subject: [PATCH 2/7] Recipes for Trusted Services Secure Partitions
Date: Wed, 31 Aug 2022 19:41:52 +0100
Message-Id: <20220831184157.84687-2-Anton.Antonov@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220831184157.84687-1-Anton.Antonov@arm.com>
References: <20220831184157.84687-1-Anton.Antonov@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 31 Aug 2022 18:42:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3726

We define dedicated recipes for all supported TS SPs.

The recipes produce stripped.elf and DTB files for SPs.
These files are automatically included into optee-os image.
See meta-arm/recipes-security/trusted-services/optee-os-ts.inc

This approach allows us to:
- include only required SPs into an optee-os image using MACHINE_FEATURES
- use Yocto cmake bbclass
- fetch and build only required dependencies
- use simple SP specific bbapend files if required

Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
---
 .../trusted-services/trusted-services.inc     |  9 +++--
 .../trusted-services/ts-sp-attestation_git.bb |  7 ++++
 .../trusted-services/ts-sp-common.inc         | 29 ++++++++++++++++
 .../trusted-services/ts-sp-crypto_git.bb      |  9 +++++
 .../0013-env-test-no-std-libs.patch           | 33 +++++++++++++++++++
 .../trusted-services/ts-sp-env-test_git.bb    | 14 ++++++++
 .../trusted-services/ts-sp-its_git.bb         |  7 ++++
 .../trusted-services/ts-sp-se-proxy_git.bb    |  9 +++++
 .../ts-sp-smm-gateway_%.bbappend              |  5 +++
 .../trusted-services/ts-sp-smm-gateway_git.bb |  7 ++++
 .../trusted-services/ts-sp-storage_git.bb     |  7 ++++
 .../trusted-services/ts-uuid.inc              |  9 +++++
 12 files changed, 143 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm/recipes-security/trusted-services/ts-sp-attestation_git.bb
 create mode 100644 meta-arm/recipes-security/trusted-services/ts-sp-common.inc
 create mode 100644 meta-arm/recipes-security/trusted-services/ts-sp-crypto_git.bb
 create mode 100644 meta-arm/recipes-security/trusted-services/ts-sp-env-test/0013-env-test-no-std-libs.patch
 create mode 100644 meta-arm/recipes-security/trusted-services/ts-sp-env-test_git.bb
 create mode 100644 meta-arm/recipes-security/trusted-services/ts-sp-its_git.bb
 create mode 100644 meta-arm/recipes-security/trusted-services/ts-sp-se-proxy_git.bb
 create mode 100644 meta-arm/recipes-security/trusted-services/ts-sp-smm-gateway_%.bbappend
 create mode 100644 meta-arm/recipes-security/trusted-services/ts-sp-smm-gateway_git.bb
 create mode 100644 meta-arm/recipes-security/trusted-services/ts-sp-storage_git.bb
 create mode 100644 meta-arm/recipes-security/trusted-services/ts-uuid.inc

diff --git a/meta-arm/recipes-security/trusted-services/trusted-services.inc b/meta-arm/recipes-security/trusted-services/trusted-services.inc
index 0853d054..80c08499 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services.inc
@@ -2,7 +2,6 @@ SUMMARY ?= "The Trusted Services: framework for developing root-of-trust service
 HOMEPAGE = "https://trusted-services.readthedocs.io/en/latest/index.html"
 
 LICENSE = "Apache-2.0 & BSD-3-Clause & Zlib"
-LIC_FILES_CHKSUM = "file://${S}/license.rst;md5=ea160bac7f690a069c608516b17997f4"
 
 inherit python3native cmake
 
@@ -10,6 +9,12 @@ COMPATIBLE_HOST = "aarch64.*-linux"
 
 require trusted-services-src.inc
 
+# By default bitbake includes only ${S} (i.e git/trusted-services) in the maps.
+# We also need to include the TS dependencies source trees.
+DEBUG_PREFIX_MAP:append = "-fmacro-prefix-map=${WORKDIR}/git=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
+ -fdebug-prefix-map=${WORKDIR}/git=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
+"
+
 TS_PLATFORM ?= "ts/mock"
 
 # SP images are embedded into optee-os image
@@ -18,7 +23,7 @@ SP_PACKAGING_METHOD ?= "embedded"
 
 SYSROOT_DIRS += "/usr/opteesp /usr/arm-linux"
 
-# In TS cmake files use find_file() to search through source code and build dirs.
+# TS cmake files use find_file() to search through source code and build dirs.
 # Yocto cmake class limits CMAKE_FIND_ROOT_PATH and find_file() fails.
 # Include the source tree and build dirs into searchable path.
 OECMAKE_EXTRA_ROOT_PATH = "${WORKDIR}/git/ ${WORKDIR}/build/"
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-attestation_git.bb b/meta-arm/recipes-security/trusted-services/ts-sp-attestation_git.bb
new file mode 100644
index 00000000..eef05fe3
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-attestation_git.bb
@@ -0,0 +1,7 @@
+DESCRIPTION = "Trusted Services attestation service provider"
+
+require ts-sp-common.inc
+
+SP_UUID = "${ATTESTATION_UUID}"
+
+OECMAKE_SOURCEPATH="${S}/deployments/attestation/${TS_ENV}"
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-common.inc b/meta-arm/recipes-security/trusted-services/ts-sp-common.inc
new file mode 100644
index 00000000..e46cd6be
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-common.inc
@@ -0,0 +1,29 @@
+# Common part of all Trusted Services SPs recipes
+
+TS_ENV = "opteesp"
+
+require trusted-services.inc
+require ts-uuid.inc
+
+DEPENDS += "dtc-native ts-newlib"
+
+FILES:${PN}-dev = "${TS_INSTALL}"
+
+# Secure Partition DTS file might be updated in bbapend files
+SP_DTS_FILE ?= "${D}${TS_INSTALL}/manifest/${SP_UUID}.dts"
+
+do_install:append() {
+    # Generate SP DTB which will be included automatically by optee-os build process
+    dtc -I dts -O dtb -o ${D}${TS_INSTALL}/manifest/${SP_UUID}.dtb ${SP_DTS_FILE}
+
+    # We do not need libs and headers
+    rm -r --one-file-system ${D}${TS_INSTALL}/lib
+    rm -r --one-file-system ${D}${TS_INSTALL}/include
+}
+
+# Use Yocto debug prefix maps for compiling assembler.
+EXTRA_OECMAKE += '-DCMAKE_ASM_FLAGS="${DEBUG_PREFIX_MAP}"'
+
+# Ignore that SP stripped.elf does not have GNU_HASH
+# Older versions of optee support SYSV hash only.
+INSANE_SKIP:${PN}-dev += "ldflags"
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-crypto_git.bb b/meta-arm/recipes-security/trusted-services/ts-sp-crypto_git.bb
new file mode 100644
index 00000000..77a28557
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-crypto_git.bb
@@ -0,0 +1,9 @@
+DESCRIPTION = "Trusted Services crypto service provider"
+
+require ts-sp-common.inc
+
+SP_UUID = "${CRYPTO_UUID}"
+
+DEPENDS += "python3-protobuf-native"
+
+OECMAKE_SOURCEPATH="${S}/deployments/crypto/${TS_ENV}"
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-env-test/0013-env-test-no-std-libs.patch b/meta-arm/recipes-security/trusted-services/ts-sp-env-test/0013-env-test-no-std-libs.patch
new file mode 100644
index 00000000..f6269db4
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-env-test/0013-env-test-no-std-libs.patch
@@ -0,0 +1,33 @@
+From 7a0dcc40ea736dc20b25813dfc08e576c2615217 Mon Sep 17 00:00:00 2001
+From: Anton Antonov <Anton.Antonov@arm.com>
+Date: Wed, 31 Aug 2022 17:32:47 +0100
+Subject: [PATCH] Do not use standard libraries in env-test opteesp deployment
+
+In opteesp deployments newlib used used. The standard libraries should not be included.
+
+Upstream-Status: Pending
+Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
+---
+ deployments/env-test/opteesp/CMakeLists.txt | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/deployments/env-test/opteesp/CMakeLists.txt b/deployments/env-test/opteesp/CMakeLists.txt
+index cff00ff..60abc0d 100644
+--- a/deployments/env-test/opteesp/CMakeLists.txt
++++ b/deployments/env-test/opteesp/CMakeLists.txt
+@@ -56,9 +56,9 @@ include(../env-test.cmake REQUIRED)
+ #-------------------------------------------------------------------------------
+ add_platform(TARGET env-test)
+ 
+-if(CMAKE_CROSSCOMPILING)
+-	target_link_libraries(env-test PRIVATE stdc++ gcc m)
+-endif()
++#if(CMAKE_CROSSCOMPILING)
++#	target_link_libraries(env-test PRIVATE stdc++ gcc m)
++#endif()
+ 
+ #################################################################
+ 
+-- 
+2.25.1
+
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-env-test_git.bb b/meta-arm/recipes-security/trusted-services/ts-sp-env-test_git.bb
new file mode 100644
index 00000000..9cd73cbc
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-env-test_git.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Trusted Services test_runner service provider"
+
+require ts-sp-common.inc
+
+# Current version of env-test SP contains hard-coded values for FVP.
+COMPATIBLE_MACHINE ?= "invalid"
+
+SP_UUID = "${ENV_TEST_UUID}"
+
+OECMAKE_SOURCEPATH="${S}/deployments/env-test/${TS_ENV}"
+
+SRC_URI += "\
+            file://0013-env-test-no-std-libs.patch \
+"
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-its_git.bb b/meta-arm/recipes-security/trusted-services/ts-sp-its_git.bb
new file mode 100644
index 00000000..4eb5dc5e
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-its_git.bb
@@ -0,0 +1,7 @@
+DESCRIPTION = "Trusted Services internal secure storage service provider"
+
+require ts-sp-common.inc
+
+SP_UUID = "${ITS_UUID}"
+
+OECMAKE_SOURCEPATH="${S}/deployments/internal-trusted-storage/${TS_ENV}"
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-se-proxy_git.bb b/meta-arm/recipes-security/trusted-services/ts-sp-se-proxy_git.bb
new file mode 100644
index 00000000..b9246418
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-se-proxy_git.bb
@@ -0,0 +1,9 @@
+DESCRIPTION = "Trusted Services proxy service providers"
+
+require ts-sp-common.inc
+
+SP_UUID = "${SE_PROXY_UUID}"
+
+DEPENDS += "python3-protobuf-native"
+
+OECMAKE_SOURCEPATH="${S}/deployments/se-proxy/${TS_ENV}"
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-smm-gateway_%.bbappend b/meta-arm/recipes-security/trusted-services/ts-sp-smm-gateway_%.bbappend
new file mode 100644
index 00000000..c485a562
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-smm-gateway_%.bbappend
@@ -0,0 +1,5 @@
+
+# Update MM communication buffer address for qemuarm64 machine
+EXTRA_OECMAKE:append:qemuarm64-secureboot = "-DMM_COMM_BUFFER_ADDRESS="0x00000000 0x42000000" \
+                                             -DMM_COMM_BUFFER_PAGE_COUNT="1" \
+"
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-smm-gateway_git.bb b/meta-arm/recipes-security/trusted-services/ts-sp-smm-gateway_git.bb
new file mode 100644
index 00000000..06ca6bd1
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-smm-gateway_git.bb
@@ -0,0 +1,7 @@
+DESCRIPTION = "Trusted Services service provider for UEFI SMM services"
+
+require ts-sp-common.inc
+
+SP_UUID = "${SMM_GATEWAY_UUID}"
+
+OECMAKE_SOURCEPATH="${S}/deployments/smm-gateway/${TS_ENV}"
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-storage_git.bb b/meta-arm/recipes-security/trusted-services/ts-sp-storage_git.bb
new file mode 100644
index 00000000..c8937546
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-storage_git.bb
@@ -0,0 +1,7 @@
+DESCRIPTION = "Trusted Services secure storage service provider"
+
+require ts-sp-common.inc
+
+SP_UUID = "${STORAGE_UUID}"
+
+OECMAKE_SOURCEPATH="${S}/deployments/protected-storage/${TS_ENV}"
diff --git a/meta-arm/recipes-security/trusted-services/ts-uuid.inc b/meta-arm/recipes-security/trusted-services/ts-uuid.inc
new file mode 100644
index 00000000..7a39f733
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/ts-uuid.inc
@@ -0,0 +1,9 @@
+# Trusted Services SPs canonical UUIDs
+
+ATTESTATION_UUID = "a1baf155-8876-4695-8f7c-54955e8db974"
+CRYPTO_UUID      = "d9df52d5-16a2-4bb2-9aa4-d26d3b84e8c0"
+ENV_TEST_UUID    = "33c75baf-ac6a-4fe4-8ac7-e9909bee2d17"
+ITS_UUID         = "dc1eef48-b17a-4ccf-ac8b-dfcff7711b14"
+SE_PROXY_UUID    = "46bb39d1-b4d9-45b5-88ff-040027dab249"
+SMM_GATEWAY_UUID = "ed32d533-99e6-4209-9cc0-2d72cdd998a7"
+STORAGE_UUID     = "751bf801-3dde-4768-a514-0f10aeed1790"
-- 
2.25.1


