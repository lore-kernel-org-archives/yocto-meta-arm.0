Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 789BAC43334
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 20:13:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1710.1655237608433191688
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jun 2022 13:13:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FE661764
	for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jun 2022 13:13:27 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2B12A3F73B
	for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jun 2022 13:13:27 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/optee: update to v3.17
Date: Tue, 14 Jun 2022 16:13:22 -0400
Message-Id: <20220614201322.858-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Jun 2022 20:13:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3501

Update the recipes to v3.17 and remove v3.16

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/conf/machine/qemuarm-secureboot.conf |  3 +++
 .../optee/optee-client_3.16.0.bb              |  3 ---
 .../optee/optee-client_3.17.0.bb              |  3 +++
 ...les_3.16.0.bb => optee-examples_3.17.0.bb} |  0
 ..._3.16.0.bb => optee-os-tadevkit_3.17.0.bb} |  3 ++-
 ...{optee-os_3.16.0.bb => optee-os_3.17.0.bb} |  5 ++--
 .../optee/optee-test/musl-workaround.patch    | 24 +++++++++++++++++++
 .../optee/optee-test_3.16.0.bb                |  3 ---
 .../optee/optee-test_3.17.0.bb                |  7 ++++++
 9 files changed, 42 insertions(+), 9 deletions(-)
 delete mode 100644 meta-arm/recipes-security/optee/optee-client_3.16.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-client_3.17.0.bb
 rename meta-arm/recipes-security/optee/{optee-examples_3.16.0.bb => optee-examples_3.17.0.bb} (100%)
 rename meta-arm/recipes-security/optee/{optee-os-tadevkit_3.16.0.bb => optee-os-tadevkit_3.17.0.bb} (87%)
 rename meta-arm/recipes-security/optee/{optee-os_3.16.0.bb => optee-os_3.17.0.bb} (66%)
 create mode 100644 meta-arm/recipes-security/optee/optee-test/musl-workaround.patch
 delete mode 100644 meta-arm/recipes-security/optee/optee-test_3.16.0.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-test_3.17.0.bb

diff --git a/meta-arm/conf/machine/qemuarm-secureboot.conf b/meta-arm/conf/machine/qemuarm-secureboot.conf
index e8085fa6..a459f3fa 100644
--- a/meta-arm/conf/machine/qemuarm-secureboot.conf
+++ b/meta-arm/conf/machine/qemuarm-secureboot.conf
@@ -20,3 +20,6 @@ WKS_FILE_DEPENDS = "trusted-firmware-a"
 IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
 
 MACHINE_FEATURES += "optee-ftpm"
+
+# FIXME - CPUs 2-4 don't start in the newer OPTEE
+PREFERRED_VERSION_optee-os ?= "3.14%"
diff --git a/meta-arm/recipes-security/optee/optee-client_3.16.0.bb b/meta-arm/recipes-security/optee/optee-client_3.16.0.bb
deleted file mode 100644
index 4a36cbc1..00000000
--- a/meta-arm/recipes-security/optee/optee-client_3.16.0.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require optee-client.inc
-
-SRCREV = "06db73b3f3fdb8d23eceaedbc46c49c0b45fd1e2"
diff --git a/meta-arm/recipes-security/optee/optee-client_3.17.0.bb b/meta-arm/recipes-security/optee/optee-client_3.17.0.bb
new file mode 100644
index 00000000..5de16e7a
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-client_3.17.0.bb
@@ -0,0 +1,3 @@
+require optee-client.inc
+
+SRCREV = "9a337049c52495e5e16b4a94decaa3e58fce793e"
diff --git a/meta-arm/recipes-security/optee/optee-examples_3.16.0.bb b/meta-arm/recipes-security/optee/optee-examples_3.17.0.bb
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-examples_3.16.0.bb
rename to meta-arm/recipes-security/optee/optee-examples_3.17.0.bb
diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.16.0.bb b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.17.0.bb
similarity index 87%
rename from meta-arm/recipes-security/optee/optee-os-tadevkit_3.16.0.bb
rename to meta-arm/recipes-security/optee/optee-os-tadevkit_3.17.0.bb
index c710e27f..5d54d4ed 100644
--- a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.16.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.17.0.bb
@@ -1,10 +1,11 @@
 FILESEXTRAPATHS:prepend := "${THISDIR}/optee-os:"
-require optee-os_3.16.0.bb
+require optee-os_3.17.0.bb
 
 SUMMARY = "OP-TEE Trusted OS TA devkit"
 DESCRIPTION = "OP-TEE TA devkit for build TAs"
 HOMEPAGE = "https://www.op-tee.org/"
 
+DEPENDS += "python3-pycryptodome-native"
 
 do_install() {
     #install TA devkit
diff --git a/meta-arm/recipes-security/optee/optee-os_3.16.0.bb b/meta-arm/recipes-security/optee/optee-os_3.17.0.bb
similarity index 66%
rename from meta-arm/recipes-security/optee/optee-os_3.16.0.bb
rename to meta-arm/recipes-security/optee/optee-os_3.17.0.bb
index 873e964b..b81c12f1 100644
--- a/meta-arm/recipes-security/optee/optee-os_3.16.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_3.17.0.bb
@@ -1,8 +1,9 @@
 require optee-os.inc
 
-SRCREV = "d0b742d1564834dac903f906168d7357063d5459"
+SRCREV = "f9e550142dd4b33ee1112f5dd64ffa94ba79cefa"
 
 SRC_URI:append = " \
     file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
     file://0007-allow-setting-sysroot-for-clang.patch \
-"
+   "
+DEPENDS += "dtc-native"
diff --git a/meta-arm/recipes-security/optee/optee-test/musl-workaround.patch b/meta-arm/recipes-security/optee/optee-test/musl-workaround.patch
new file mode 100644
index 00000000..eed1bd4b
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-test/musl-workaround.patch
@@ -0,0 +1,24 @@
+Hack to work around musl compile error:
+ In file included from optee-test/3.17.0-r0/recipe-sysroot/usr/include/sys/stat.h:23,
+                  from optee-test/3.17.0-r0/git/host/xtest/regression_1000.c:25:
+ optee-test/3.17.0-r0/recipe-sysroot/usr/include/bits/stat.h:17:26: error: expected identifier or '(' before '[' token
+    17 |         unsigned __unused[2];
+       |                          ^
+
+stat.h is not needed, since it is not being used in this file.  So removing it.
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+
+diff --git a/host/xtest/regression_1000.c b/host/xtest/regression_1000.c
+index 4264884..7f1baca 100644
+--- a/host/xtest/regression_1000.c
++++ b/host/xtest/regression_1000.c
+@@ -22,7 +22,6 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+-#include <sys/stat.h>
+ #include <sys/types.h>
+ #include <ta_arm_bti.h>
+ #include <ta_concurrent.h>
diff --git a/meta-arm/recipes-security/optee/optee-test_3.16.0.bb b/meta-arm/recipes-security/optee/optee-test_3.16.0.bb
deleted file mode 100644
index 03f9c34a..00000000
--- a/meta-arm/recipes-security/optee/optee-test_3.16.0.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require optee-test.inc
-
-SRCREV = "1cf0e6d2bdd1145370033d4e182634458528579d"
diff --git a/meta-arm/recipes-security/optee/optee-test_3.17.0.bb b/meta-arm/recipes-security/optee/optee-test_3.17.0.bb
new file mode 100644
index 00000000..6fa10e78
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-test_3.17.0.bb
@@ -0,0 +1,7 @@
+require optee-test.inc
+
+SRC_URI:append = " \
+    file://musl-workaround.patch \
+   "
+
+SRCREV = "44a31d02379bd8e50762caa5e1592ad81e3339af"
-- 
2.17.1


