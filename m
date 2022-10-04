Return-Path: <anton.antonov@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77DCDC433FE
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 15:56:58 +0000 (UTC)
Received: from cam-smtp0.cambridge.arm.com (cam-smtp0.cambridge.arm.com
 [217.140.106.51])
 by mx.groups.io with SMTP id smtpd.web09.12687.1664899016965150469
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Oct 2022 08:56:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.106.51, mailfrom: anton.antonov@arm.com)
Received: from atg-devlab-kelpie.cambridge.arm.com
 (atg-devlab-kelpie.cambridge.arm.com [10.2.80.92])
	by cam-smtp0.cambridge.arm.com (8.13.8/8.13.8) with ESMTP id 294FxOUs015038;
	Tue, 4 Oct 2022 16:59:24 +0100
From: Anton Antonov <Anton.Antonov@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Anton.Antonov@arm.com
Subject: [PATCH] meta-arm/trusted-services: Use GCC toolchain for specific TS
 recipes only.
Date: Tue,  4 Oct 2022 16:56:46 +0100
Message-Id: <20221004155646.2527610-1-Anton.Antonov@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Oct 2022 15:56:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3920

This commit also enables clang CI pipelines for TS.

Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
---
 .gitlab-ci.yml                                                | 3 ++-
 .../recipes-security/trusted-services/trusted-services.inc    | 2 --
 meta-arm/recipes-security/trusted-services/ts-demo_git.bb     | 4 ++++
 meta-arm/recipes-security/trusted-services/ts-newlib_4.1.0.bb | 3 +++
 .../trusted-services/ts-psa-iat-api-test_git.bb               | 4 ++++
 meta-arm/recipes-security/trusted-services/ts-sp-common.inc   | 3 +++
 6 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 7474e247..491ccebb 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -157,7 +157,8 @@ qemuarm64-secureboot-ts:
   extends: .build
   parallel:
     matrix:
-      - TCLIBC: [glibc, musl]
+      - TOOLCHAINS: [gcc, clang]
+        TCLIBC: [glibc, musl]
         TESTING: testimage
 
 qemuarm64:
diff --git a/meta-arm/recipes-security/trusted-services/trusted-services.inc b/meta-arm/recipes-security/trusted-services/trusted-services.inc
index a8f49a5e..80c08499 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services.inc
@@ -50,5 +50,3 @@ EXTRA_OECMAKE += "${@oe.utils.conditional('TS_ENV', 'opteesp', \
 EXTRA_OECMAKE += "-Dlibts_DIR=${STAGING_DIR_HOST}${TS_INSTALL}/lib/cmake/ \
                   -DNEWLIB_INSTALL_DIR=${STAGING_DIR_HOST}${TS_INSTALL}/newlib_install \
                  "
-# Newlib does not compile with clang
-TOOLCHAIN = "gcc"
diff --git a/meta-arm/recipes-security/trusted-services/ts-demo_git.bb b/meta-arm/recipes-security/trusted-services/ts-demo_git.bb
index b0abb6ff..a9f7b65f 100644
--- a/meta-arm/recipes-security/trusted-services/ts-demo_git.bb
+++ b/meta-arm/recipes-security/trusted-services/ts-demo_git.bb
@@ -11,6 +11,10 @@ RDEPENDS:${PN} += "libts"
 
 OECMAKE_SOURCEPATH="${S}/deployments/ts-demo/${TS_ENV}"
 
+# Mbedtls 3.1.0 does not compile with clang.
+# This can be removed after TS updated required mbedtls version
+TOOLCHAIN = "gcc"
+
 FILES:${PN} = "${bindir}/ts-demo"
 
 do_install:append () {
diff --git a/meta-arm/recipes-security/trusted-services/ts-newlib_4.1.0.bb b/meta-arm/recipes-security/trusted-services/ts-newlib_4.1.0.bb
index 94038b5b..4009f3a3 100644
--- a/meta-arm/recipes-security/trusted-services/ts-newlib_4.1.0.bb
+++ b/meta-arm/recipes-security/trusted-services/ts-newlib_4.1.0.bb
@@ -13,6 +13,9 @@ SRC_URI += "git://sourceware.org/git/newlib-cygwin.git;name=newlib;protocol=http
 SRCREV_newlib = "415fdd4279b85eeec9d54775ce13c5c412451e08"
 LIC_FILES_CHKSUM += "file://../newlib/COPYING.NEWLIB;md5=b8dda70da54e0efb49b1074f349d7749"
 
+# Newlib does not compile with clang
+TOOLCHAIN = "gcc"
+
 EXTRA_OECMAKE += '-DNEWLIB_SOURCE_DIR=${WORKDIR}/git/newlib \
                   -DNEWLIB_EXTRA="CFLAGS=--sysroot=${STAGING_DIR_HOST}" \
                  '
diff --git a/meta-arm/recipes-security/trusted-services/ts-psa-iat-api-test_git.bb b/meta-arm/recipes-security/trusted-services/ts-psa-iat-api-test_git.bb
index 73c5f61d..f8fb8a46 100644
--- a/meta-arm/recipes-security/trusted-services/ts-psa-iat-api-test_git.bb
+++ b/meta-arm/recipes-security/trusted-services/ts-psa-iat-api-test_git.bb
@@ -17,3 +17,7 @@ SRCREV_psaqcbor = "42272e466a8472948bf8fca076d113b81b99f0e0"
 
 EXTRA_OECMAKE += "-DPSA_TARGET_QCBOR=${WORKDIR}/git/psaqcbor \
                  "
+
+# Mbedtls 3.1.0 does not compile with clang.
+# This can be removed after TS updated required mbedtls version
+TOOLCHAIN = "gcc"
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-common.inc b/meta-arm/recipes-security/trusted-services/ts-sp-common.inc
index e46cd6be..75ddab37 100644
--- a/meta-arm/recipes-security/trusted-services/ts-sp-common.inc
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-common.inc
@@ -27,3 +27,6 @@ EXTRA_OECMAKE += '-DCMAKE_ASM_FLAGS="${DEBUG_PREFIX_MAP}"'
 # Ignore that SP stripped.elf does not have GNU_HASH
 # Older versions of optee support SYSV hash only.
 INSANE_SKIP:${PN}-dev += "ldflags"
+
+# Trusted Services SPs do not compile with clang
+TOOLCHAIN = "gcc"
-- 
2.25.1


