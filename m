Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C5AC4332F
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 13:01:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.66.1664802086460604186
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Oct 2022 06:01:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E26F216F8;
	Mon,  3 Oct 2022 06:01:32 -0700 (PDT)
Received: from e121910.arm.com (unknown [10.57.65.67])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B56723F73B;
	Mon,  3 Oct 2022 06:01:24 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Vishnu.Banavath@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 11/12] arm/secure-partitions: drop use of the recipe
Date: Mon,  3 Oct 2022 14:00:50 +0100
Message-Id: <20221003130051.28934-12-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221003130051.28934-1-abdellatif.elkhlifi@arm.com>
References: <20221003130051.28934-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 03 Oct 2022 13:01:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3905

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

secure-partitions recipe is replaced with the new design of
 trusted services recipes.

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../secure-partitions_%.bbappend              |  4 -
 .../trusted-services/secure-partitions.inc    | 27 -------
 .../trusted-services/secure-partitions_git.bb | 74 -------------------
 3 files changed, 105 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/trusted-services/secure-partitions_%.bbappend
 delete mode 100644 meta-arm/recipes-security/trusted-services/secure-partitions.inc
 delete mode 100644 meta-arm/recipes-security/trusted-services/secure-partitions_git.bb

diff --git a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions_%.bbappend b/meta-arm-bsp/recipes-security/trusted-services/secure-partitions_%.bbappend
deleted file mode 100644
index 8a37a281..00000000
--- a/meta-arm-bsp/recipes-security/trusted-services/secure-partitions_%.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-MACHINE_TS_REQUIRE ?= ""
-MACHINE_TS_REQUIRE:corstone1000 = "ts-corstone1000.inc"
-
-require ${MACHINE_TS_REQUIRE}
diff --git a/meta-arm/recipes-security/trusted-services/secure-partitions.inc b/meta-arm/recipes-security/trusted-services/secure-partitions.inc
deleted file mode 100644
index 1df7409c..00000000
--- a/meta-arm/recipes-security/trusted-services/secure-partitions.inc
+++ /dev/null
@@ -1,27 +0,0 @@
-LICENSE = "Apache-2.0 & BSD-3-Clause & Zlib"
-LIC_FILES_CHKSUM = "file://license.rst;md5=ea160bac7f690a069c608516b17997f4"
-
-SRC_URI = "git://git.trustedfirmware.org/TS/trusted-services.git;protocol=https;branch=integration;name=ts;destsuffix=git/ts"
-
-SRCREV_ts ?= "a365a04f937b9b76ebb2e0eeade226f208cbc0d2"
-
-S = "${WORKDIR}/git/ts"
-B = "${WORKDIR}/build"
-
-export CROSS_COMPILE="${TARGET_PREFIX}"
-
-CFLAGS[unexport] = "1"
-CPPFLAGS[unexport] = "1"
-AS[unexport] = "1"
-LD[unexport] = "1"
-
-# setting the linker options used to build the secure partitions
-SECURITY_LDFLAGS = ""
-TARGET_LDFLAGS = "-Wl,--build-id=none -Wl,--hash-style=both"
-
-do_configure[cleandirs] = "${B}"
-
-# Currently trusted-services and psa-arch-tests use FetchContent to download
-# more sources during do_configure. Until this is resolved we need to allow
-# network operations.
-do_configure[network] = "1"
diff --git a/meta-arm/recipes-security/trusted-services/secure-partitions_git.bb b/meta-arm/recipes-security/trusted-services/secure-partitions_git.bb
deleted file mode 100644
index fca6d9d3..00000000
--- a/meta-arm/recipes-security/trusted-services/secure-partitions_git.bb
+++ /dev/null
@@ -1,74 +0,0 @@
-SUMMARY = "Trusted Services secure partitions"
-HOMEPAGE = "https://trusted-services.readthedocs.io/en/latest/index.html"
-
-COMPATIBLE_MACHINE ?= "invalid"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-require secure-partitions.inc
-
-SRCREV_FORMAT = "ts"
-PV = "0.0+git${SRCPV}"
-
-# Which environment to create the secure partions for (opteesp or shim)
-TS_ENVIRONMENT ?= "opteesp"
-
-inherit deploy python3native
-
-DEPENDS = "python3-pycryptodome-native python3-pycryptodomex-native \
-           python3-pyelftools-native python3-grpcio-tools-native \
-           python3-protobuf-native protobuf-native cmake-native \
-           "
-
-DEPENDS:append = " ${@bb.utils.contains('TS_ENVIRONMENT', 'opteesp', 'optee-spdevkit', '', d)}"
-
-export CROSS_COMPILE="${TARGET_PREFIX}"
-
-CFLAGS[unexport] = "1"
-CPPFLAGS[unexport] = "1"
-AS[unexport] = "1"
-LD[unexport] = "1"
-
-# only used if TS_ENVIRONMENT is opteesp
-SP_DEV_KIT_DIR = "${@bb.utils.contains('TS_ENVIRONMENT', 'opteesp', '${STAGING_INCDIR}/optee/export-user_sp', '', d)}"
-
-# SP images are embedded into optee os image
-SP_PACKAGING_METHOD ?= "embedded"
-
-do_configure() {
-    for TS_DEPLOYMENT in ${TS_DEPLOYMENTS}; do
-        cmake \
-          -DCMAKE_INSTALL_PREFIX=${D}/firmware/sp \
-          -DSP_DEV_KIT_DIR=${SP_DEV_KIT_DIR} \
-          -DSP_PACKAGING_METHOD=${SP_PACKAGING_METHOD} \
-	  -DTS_PLATFORM="${TS_PLATFORM}" \
-          -S ${S}/$TS_DEPLOYMENT -B "${B}/$TS_DEPLOYMENT"
-    done
-}
-
-do_compile() {
-    for TS_DEPLOYMENT in ${TS_DEPLOYMENTS}; do
-        cmake --build "${B}/$TS_DEPLOYMENT"
-    done
-}
-
-do_install () {
-    if [ "${TS_ENVIRONMENT}" = "opteesp" ]; then
-        for TS_DEPLOYMENT in ${TS_DEPLOYMENTS}; do
-            cmake --install "${B}/$TS_DEPLOYMENT"
-        done
-    fi
-}
-
-SYSROOT_DIRS = "/firmware"
-
-do_deploy() {
-    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
-}
-addtask deploy after do_install
-
-FILES:${PN} = "/firmware/sp/opteesp*"
-
-# Build paths are currently embedded
-INSANE_SKIP:${PN} += "buildpaths"
-INSANE_SKIP:${PN}-dbg += "buildpaths"
-- 
2.17.1


