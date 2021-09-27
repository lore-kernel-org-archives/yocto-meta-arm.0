Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A08FAC433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 13:18:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.31027.1632748706806785100
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 27 Sep 2021 06:18:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07944D6E
	for <meta-arm@lists.yoctoproject.org>; Mon, 27 Sep 2021 06:18:26 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DFAE63F718
	for <meta-arm@lists.yoctoproject.org>; Mon, 27 Sep 2021 06:18:25 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-toolchain: use variables
Date: Mon, 27 Sep 2021 09:18:20 -0400
Message-Id: <20210927131820.19364-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 27 Sep 2021 13:18:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2236

Use variables to make it easier to upgrade when the time comes.

Change-Id: I9f2575279fe79bc0d895d47fdaffd2d5edd4aa59
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-devtools/gcc/gcc-arm-10.3.inc              | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3.inc b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3.inc
index 72a6b46..187f4f4 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3.inc
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3.inc
@@ -1,8 +1,8 @@
 require recipes-devtools/gcc/gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
-
-PV = "arm-10.3"
+GCC_VERSION = "10.3"
+PV = "arm-${GCC_VERSION}"
 CVE_VERSION = "10.3"
 
 # BINV should be incremented to a revision after a minor gcc release
@@ -13,7 +13,7 @@ MMYY = "21.07"
 RELEASE = "20${MMYY}"
 PR = "r${RELEASE}"
 
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-arm-10.3:${FILE_DIRNAME}/gcc-arm-10.3/backport:"
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-arm-${GCC_VERSION}:${FILE_DIRNAME}/gcc-arm-${GCC_VERSION}/backport:"
 
 DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
 NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native"
@@ -28,7 +28,7 @@ LIC_FILES_CHKSUM = "\
     file://COPYING.RUNTIME;md5=fe60d87048567d4fe8c8a0ed2448bcc8 \
 "
 
-BASEURI ?= "https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-2021.07/srcrel/gcc-arm-src-snapshot-10.3-2021.07.tar.xz"
+BASEURI ?= "https://developer.arm.com/-/media/Files/downloads/gnu-a/${GCC_VERSION}-${RELEASE}/srcrel/gcc-arm-src-snapshot-${GCC_VERSION}-${RELEASE}.tar.xz"
 SRC_URI = "\
            ${BASEURI} \
            file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
@@ -72,7 +72,7 @@ SRC_URI = "\
 "
 SRC_URI[md5sum] = "5f582fd50eee0e40475b93d2d7a18979"
 
-S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-arm-src-snapshot-10.3-2021.07"
+S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-arm-src-snapshot-${GCC_VERSION}-${RELEASE}"
 
 # For dev release snapshotting
 #S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${RELEASE}"
-- 
2.17.1


