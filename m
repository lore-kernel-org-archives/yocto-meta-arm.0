Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4622EC433F5
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 12:49:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.60590.1638190175674172385
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Nov 2021 04:49:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 533151042;
	Mon, 29 Nov 2021 04:49:35 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.2.170])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E3E153F766;
	Mon, 29 Nov 2021 04:49:33 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH][HONISTER 4/5] arm/secure-partitions: introducing the recipe
Date: Mon, 29 Nov 2021 12:49:14 +0000
Message-Id: <20211129124915.23058-5-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211129124915.23058-1-abdellatif.elkhlifi@arm.com>
References: <20211129124915.23058-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Nov 2021 12:49:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2469

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Adding secure-partitions recipe.

Change-Id: I4320fb7087157a7c0f9305ce1d8f8574d4500fd0
Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../trusted-services/secure-partitions_git.bb | 91 +++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 meta-arm/recipes-security/trusted-services/secure-partitions_git.bb

diff --git a/meta-arm/recipes-security/trusted-services/secure-partitions_git.bb b/meta-arm/recipes-security/trusted-services/secure-partitions_git.bb
new file mode 100644
index 0000000..0c825e6
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/secure-partitions_git.bb
@@ -0,0 +1,91 @@
+SUMMARY = "Trusted Services secure partitions"
+HOMEPAGE = "https://trusted-services.readthedocs.io/en/latest/index.html"
+
+COMPATIBLE_MACHINE ?= "invalid"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+LICENSE = "Apache-2.0 & BSD-3-Clause & Zlib"
+LIC_FILES_CHKSUM = "file://license.rst;md5=ea160bac7f690a069c608516b17997f4 \
+                    file://../mbedcrypto/LICENSE;md5=302d50a6369f5f22efdb674db908167a \
+                    file://../nanopb/LICENSE.txt;md5=9db4b73a55a3994384112efcdb37c01f"
+
+SRC_URI = "git://git.trustedfirmware.org/TS/trusted-services.git;protocol=https;branch=integration;name=ts;destsuffix=git/ts ${SRC_URI_MBED} ${SRC_URI_NANOPB}"
+
+SRC_URI_MBED = "git://github.com/ARMmbed/mbed-crypto.git;protocol=https;branch=development;name=mbed;destsuffix=git/mbedcrypto"
+SRC_URI_NANOPB = "git://github.com/nanopb/nanopb.git;name=nanopb;protocol=https;branch=master;destsuffix=git/nanopb"
+
+SRCREV_FORMAT = "ts"
+SRCREV_ts = "c52807cfea6edab5d5c9cc0cfdb18ffe12cfdb0c"
+SRCREV_mbed = "cf4a40ba0a3086cabb5a8227245191161fd26383"
+SRCREV_nanopb = "df0e92f474f9cca704fe2b31483f0b4d1b1715a4"
+PV = "0.0+git${SRCPV}"
+
+# Which environment to create the secure partions for (opteesp or shim)
+TS_ENVIRONMENT ?= "opteesp"
+S = "${WORKDIR}/git/ts"
+B = "${WORKDIR}/build"
+
+inherit deploy python3native
+
+DEPENDS = "python3-pycryptodome-native python3-pycryptodomex-native \
+           python3-pyelftools-native python3-grpcio-tools-native \
+           python3-protobuf-native protobuf-native cmake-native \
+           "
+
+DEPENDS:append = " ${@bb.utils.contains('TS_ENVIRONMENT', 'opteesp', 'optee-spdevkit', '', d)}"
+
+EXTRA_OEMAKE += "HOST_PREFIX=${HOST_PREFIX}"
+EXTRA_OEMAKE += "CROSS_COMPILE64=${HOST_PREFIX}"
+
+export CROSS_COMPILE="${TARGET_PREFIX}"
+
+CFLAGS[unexport] = "1"
+CPPFLAGS[unexport] = "1"
+AS[unexport] = "1"
+LD[unexport] = "1"
+
+# setting the linker options used to build the secure partitions
+SECURITY_LDFLAGS = ""
+TARGET_LDFLAGS = "-Wl,--build-id=none -Wl,--hash-style=both"
+
+# only used if TS_ENVIRONMENT is opteesp
+SP_DEV_KIT_DIR = "${@bb.utils.contains('TS_ENVIRONMENT', 'opteesp', '${STAGING_INCDIR}/optee/export-user_sp', '', d)}"
+
+# SP images are embedded into optee os image
+SP_PACKAGING_METHOD ?= "embedded"
+
+do_configure[cleandirs] = "${B}"
+
+do_configure() {
+    for TS_DEPLOYMENT in ${TS_DEPLOYMENTS}; do
+        cmake \
+          -DCMAKE_INSTALL_PREFIX=${D}/firmware/sp \
+          -DSP_DEV_KIT_DIR=${SP_DEV_KIT_DIR} \
+          -DSP_PACKAGING_METHOD=${SP_PACKAGING_METHOD} \
+          -S ${S}/$TS_DEPLOYMENT -B "${B}/$TS_DEPLOYMENT"
+    done
+}
+
+do_compile() {
+    for TS_DEPLOYMENT in ${TS_DEPLOYMENTS}; do
+        cmake --build "${B}/$TS_DEPLOYMENT"
+    done
+}
+
+do_install () {
+    if [ "${TS_ENVIRONMENT}" = "opteesp" ]; then
+        for TS_DEPLOYMENT in ${TS_DEPLOYMENTS}; do
+            cmake --install "${B}/$TS_DEPLOYMENT"
+        done
+    fi
+}
+
+SYSROOT_DIRS = "/firmware"
+
+do_deploy() {
+    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
+}
+addtask deploy after do_install
+
+FILES:${PN} = "/firmware/*"
-- 
2.17.1


