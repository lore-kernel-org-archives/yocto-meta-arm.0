Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A5DDC4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 16:31:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.13450.1639413081952417353
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 08:31:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 604751FB;
	Mon, 13 Dec 2021 08:31:21 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.32.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D77C3F73B;
	Mon, 13 Dec 2021 08:31:20 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH][HONISTER 6/7] arm/secure-partitions: introducing a common
 file
Date: Mon, 13 Dec 2021 16:31:01 +0000
Message-Id: <20211213163102.1039-7-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211213163102.1039-1-abdellatif.elkhlifi@arm.com>
References: <20211213163102.1039-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 Dec 2021 16:31:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2657

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Moving common settings that can be used by other
components to a common file: secure-partitions.inc

Change-Id: I81691ee52bef3dfbd72c59afe20b01a5cf2222ea
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../trusted-services/secure-partitions.inc    | 27 +++++++++++++++++++
 .../trusted-services/secure-partitions_git.bb | 17 +-----------
 2 files changed, 28 insertions(+), 16 deletions(-)
 create mode 100644 meta-arm/recipes-security/trusted-services/secure-partitions.inc

diff --git a/meta-arm/recipes-security/trusted-services/secure-partitions.inc b/meta-arm/recipes-security/trusted-services/secure-partitions.inc
new file mode 100644
index 0000000..1c7aba8
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/secure-partitions.inc
@@ -0,0 +1,27 @@
+SUMMARY = "Secure partitions common inc file"
+
+LICENSE = "Apache-2.0 & BSD-3-Clause & Zlib"
+LIC_FILES_CHKSUM = "file://license.rst;md5=ea160bac7f690a069c608516b17997f4"
+
+SRC_URI = "git://git.trustedfirmware.org/TS/trusted-services.git;protocol=https;branch=integration;name=ts;destsuffix=git/ts"
+
+SRCREV_ts ?= "a365a04f937b9b76ebb2e0eeade226f208cbc0d2"
+
+S = "${WORKDIR}/git/ts"
+B = "${WORKDIR}/build"
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
+EXTRA_OEMAKE += "HOST_PREFIX=${HOST_PREFIX}"
+EXTRA_OEMAKE += "CROSS_COMPILE64=${HOST_PREFIX}"
+
+do_configure[cleandirs] = "${B}"
diff --git a/meta-arm/recipes-security/trusted-services/secure-partitions_git.bb b/meta-arm/recipes-security/trusted-services/secure-partitions_git.bb
index b8b02e0..c90c273 100644
--- a/meta-arm/recipes-security/trusted-services/secure-partitions_git.bb
+++ b/meta-arm/recipes-security/trusted-services/secure-partitions_git.bb
@@ -5,19 +5,13 @@ COMPATIBLE_MACHINE ?= "invalid"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-LICENSE = "Apache-2.0 & BSD-3-Clause & Zlib"
-LIC_FILES_CHKSUM = "file://license.rst;md5=ea160bac7f690a069c608516b17997f4"
-
-SRC_URI = "git://git.trustedfirmware.org/TS/trusted-services.git;protocol=https;branch=integration;name=ts;destsuffix=git/ts"
+require secure-partitions.inc
 
 SRCREV_FORMAT = "ts"
-SRCREV_ts = "c52807cfea6edab5d5c9cc0cfdb18ffe12cfdb0c"
 PV = "0.0+git${SRCPV}"
 
 # Which environment to create the secure partions for (opteesp or shim)
 TS_ENVIRONMENT ?= "opteesp"
-S = "${WORKDIR}/git/ts"
-B = "${WORKDIR}/build"
 
 inherit deploy python3native
 
@@ -28,9 +22,6 @@ DEPENDS = "python3-pycryptodome-native python3-pycryptodomex-native \
 
 DEPENDS:append = " ${@bb.utils.contains('TS_ENVIRONMENT', 'opteesp', 'optee-spdevkit', '', d)}"
 
-EXTRA_OEMAKE += "HOST_PREFIX=${HOST_PREFIX}"
-EXTRA_OEMAKE += "CROSS_COMPILE64=${HOST_PREFIX}"
-
 export CROSS_COMPILE="${TARGET_PREFIX}"
 
 CFLAGS[unexport] = "1"
@@ -38,18 +29,12 @@ CPPFLAGS[unexport] = "1"
 AS[unexport] = "1"
 LD[unexport] = "1"
 
-# setting the linker options used to build the secure partitions
-SECURITY_LDFLAGS = ""
-TARGET_LDFLAGS = "-Wl,--build-id=none -Wl,--hash-style=both"
-
 # only used if TS_ENVIRONMENT is opteesp
 SP_DEV_KIT_DIR = "${@bb.utils.contains('TS_ENVIRONMENT', 'opteesp', '${STAGING_INCDIR}/optee/export-user_sp', '', d)}"
 
 # SP images are embedded into optee os image
 SP_PACKAGING_METHOD ?= "embedded"
 
-do_configure[cleandirs] = "${B}"
-
 do_configure() {
     for TS_DEPLOYMENT in ${TS_DEPLOYMENTS}; do
         cmake \
-- 
2.17.1


