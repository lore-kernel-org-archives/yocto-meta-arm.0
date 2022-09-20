Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F812C32771
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 12:59:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.5920.1663765187475167327
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Sep 2022 05:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93A3E143D
	for <meta-arm@lists.yoctoproject.org>; Wed, 21 Sep 2022 05:59:53 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E8AE83F73B
	for <meta-arm@lists.yoctoproject.org>; Wed, 21 Sep 2022 05:59:46 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/hafnium: update to 2.7
Date: Tue, 20 Sep 2022 18:39:37 -0400
Message-Id: <20220920223937.8081-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 21 Sep 2022 12:59:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3800

Update the version, update the patches, and drop the ones no longer
necessary.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../files/tc/0003-tc-increase-heap-pages.patch   |  8 ++++----
 meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc  |  6 +-----
 .../0001-define-_Noreturn-if-needed.patch        |  8 +++-----
 .../recipes-bsp/hafnium/hafnium/host-ld.patch    | 13 +++++++++++--
 .../recipes-bsp/hafnium/hafnium/native-dtc.patch | 16 ----------------
 .../hafnium/hafnium/pkg-config-native.patch      | 15 ++++++++++++---
 .../hafnium/{hafnium_2.6.bb => hafnium_2.7.bb}   |  6 +++---
 7 files changed, 34 insertions(+), 38 deletions(-)
 delete mode 100644 meta-arm/recipes-bsp/hafnium/hafnium/native-dtc.patch
 rename meta-arm/recipes-bsp/hafnium/{hafnium_2.6.bb => hafnium_2.7.bb} (93%)

diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0003-tc-increase-heap-pages.patch b/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0003-tc-increase-heap-pages.patch
index 671f6a5c..e8670738 100644
--- a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0003-tc-increase-heap-pages.patch
+++ b/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0003-tc-increase-heap-pages.patch
@@ -5,13 +5,13 @@ Subject: [PATCH] tc: increase heap pages
 
 Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 ---
- project/reference/BUILD.gn | 2 +-
+ /BUILD.gn | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/project/reference/BUILD.gn b/project/reference/BUILD.gn
+diff --git a//BUILD.gn b//BUILD.gn
 index 5d84d13..4ea0890 100644
---- a/project/reference/BUILD.gn
-+++ b/project/reference/BUILD.gn
+--- a//BUILD.gn
++++ b//BUILD.gn
 @@ -233,7 +233,7 @@ aarch64_toolchains("secure_tc") {
    gicd_base_address = "0x30000000"
    gicr_base_address = "0x30080000"
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc b/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc
index 9da9c117..4545c829 100644
--- a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc
+++ b/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc
@@ -9,14 +9,10 @@ PV = "2.7+git${SRCPV}"
 
 FILESEXTRAPATHS:prepend:tc := "${THISDIR}/files/tc:"
 
-SRC_URI:remove = " \
-    file://host-ld.patch \
-    file://native-dtc.patch"
-
 SRC_URI:append = " \
         file://0001-feat-emulate-cntp-timer-register-accesses-using-cnth.patch \
         file://0002-feat-emulate-interrupt-controller-register-access.patch \
-        file://0003-tc-increase-heap-pages.patch \
+        file://0003-tc-increase-heap-pages.patch;patchdir=project/reference \
         "
 
 do_compile() {
diff --git a/meta-arm/recipes-bsp/hafnium/hafnium/0001-define-_Noreturn-if-needed.patch b/meta-arm/recipes-bsp/hafnium/hafnium/0001-define-_Noreturn-if-needed.patch
index b73c5339..6f61177a 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium/0001-define-_Noreturn-if-needed.patch
+++ b/meta-arm/recipes-bsp/hafnium/hafnium/0001-define-_Noreturn-if-needed.patch
@@ -1,4 +1,4 @@
-From 0d941ba32a082023575fd0d14d52a12b7547b367 Mon Sep 17 00:00:00 2001
+From a433727e0fe8424db984f3afa2bda898dd517e9d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 19 Apr 2022 22:32:56 -0700
 Subject: [PATCH] define _Noreturn if needed
@@ -11,12 +11,13 @@ noreturn void panic(const char *fmt, ...);
 ^
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  inc/hf/panic.h | 4 ++++
  1 file changed, 4 insertions(+)
 
 diff --git a/inc/hf/panic.h b/inc/hf/panic.h
-index ec864e4f..588f1193 100644
+index ec864e4..588f119 100644
 --- a/inc/hf/panic.h
 +++ b/inc/hf/panic.h
 @@ -10,4 +10,8 @@
@@ -28,6 +29,3 @@ index ec864e4f..588f1193 100644
 +#endif
 +
  noreturn void panic(const char *fmt, ...);
--- 
-2.36.0
-
diff --git a/meta-arm/recipes-bsp/hafnium/hafnium/host-ld.patch b/meta-arm/recipes-bsp/hafnium/hafnium/host-ld.patch
index 040d61b2..2a342390 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium/host-ld.patch
+++ b/meta-arm/recipes-bsp/hafnium/hafnium/host-ld.patch
@@ -1,3 +1,8 @@
+From 9b1b93184c365a07b340c9404a6a0581e971bd54 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Tue, 9 Nov 2021 23:31:22 +0000
+Subject: [PATCH] arm/hafnium: fix kernel tool linking
+
 We need to be sure that the host linker flags are passed to the kernel build,
 as otherwise it is possible that binaries are incorrectly linked. For example:
 
@@ -7,8 +12,12 @@ ld: .../recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/libcrypto.so: u
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 
+---
+ build/linux/linux.gni | 1 +
+ 1 file changed, 1 insertion(+)
+
 diff --git a/build/linux/linux.gni b/build/linux/linux.gni
-index 65cc9df..19adbfb 100644
+index 45860fa..b010254 100644
 --- a/build/linux/linux.gni
 +++ b/build/linux/linux.gni
 @@ -60,6 +60,7 @@ template("linux_kernel") {
@@ -16,6 +25,6 @@ index 65cc9df..19adbfb 100644
      "LLVM_IAS=1",
      "CROSS_COMPILE=aarch64-linux-gnu-",
 +    "HOSTLDFLAGS=" + getenv("BUILD_LDFLAGS"),
-
+ 
      # Build out-of-tree in `target_out_dir`.
      "O=" + rebase_path(target_out_dir),
diff --git a/meta-arm/recipes-bsp/hafnium/hafnium/native-dtc.patch b/meta-arm/recipes-bsp/hafnium/hafnium/native-dtc.patch
deleted file mode 100644
index 840c0bc9..00000000
--- a/meta-arm/recipes-bsp/hafnium/hafnium/native-dtc.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Use our dtc tools instead of the prebuilt (x86-64-only) binaries.
-
-Upstream-Status: Pending [part of a larger effort to remove prebuilt]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-diff --git a/build/image/dtc.py b/build/image/dtc.py
-index d077818..1513120 100755
---- a/build/image/dtc.py
-+++ b/build/image/dtc.py
-@@ -16,4 +16,2 @@ import sys
--HF_ROOT = os.path.dirname(os.path.dirname(os.path.dirname(__file__)))
--DTC_ROOT = os.path.join(HF_ROOT, "prebuilts", "linux-x64", "dtc")
--DTC = os.path.join(DTC_ROOT, "dtc")
--FDTOVERLAY = os.path.join(DTC_ROOT, "fdtoverlay")
-+DTC = "dtc"
-+FDTOVERLAY = "fdtoverlay"
diff --git a/meta-arm/recipes-bsp/hafnium/hafnium/pkg-config-native.patch b/meta-arm/recipes-bsp/hafnium/hafnium/pkg-config-native.patch
index cccf28a1..40129acf 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium/pkg-config-native.patch
+++ b/meta-arm/recipes-bsp/hafnium/hafnium/pkg-config-native.patch
@@ -1,12 +1,18 @@
-Use pkg-config-native to find the libssl headers.
+From b0405e0e25740ca0ea8b75d9b3b4f35b39d82e0e Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Sat, 17 Jul 2021 14:38:02 -0500
+Subject: [PATCH] Use pkg-config-native to find the libssl headers.
 
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ scripts/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/scripts/Makefile b/scripts/Makefile
 index 9adb6d247..5fe371c7d 100644
---- a/third_party/linux/scripts/Makefile
-+++ b/third_party/linux/scripts/Makefile
+--- a/scripts/Makefile
++++ b/scripts/Makefile
 @@ -3,8 +3,8 @@
  # scripts contains sources for various helper programs used throughout
  # the kernel for the build process.
@@ -18,3 +24,6 @@ index 9adb6d247..5fe371c7d 100644
  
  hostprogs-always-$(CONFIG_BUILD_BIN2C)			+= bin2c
  hostprogs-always-$(CONFIG_KALLSYMS)			+= kallsyms
+-- 
+2.30.2
+
diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.6.bb b/meta-arm/recipes-bsp/hafnium/hafnium_2.7.bb
similarity index 93%
rename from meta-arm/recipes-bsp/hafnium/hafnium_2.6.bb
rename to meta-arm/recipes-bsp/hafnium/hafnium_2.7.bb
index ae89e8d9..f64b3968 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium_2.6.bb
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.7.bb
@@ -12,9 +12,9 @@ inherit deploy python3native pkgconfig
 SRC_URI = "gitsm://git.trustedfirmware.org/hafnium/hafnium.git;protocol=https;branch=master \
            file://0001-define-_Noreturn-if-needed.patch \
            file://host-ld.patch \
-           file://pkg-config-native.patch \
-           file://native-dtc.patch"
-SRCREV = "55b74f893948dd08d2782dd8fa9e903c143a6704"
+           file://pkg-config-native.patch;patchdir=third_party/linux \
+          "
+SRCREV = "79e9522d26fc2a88a44af149034acc27312b73a1"
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
 
-- 
2.17.1


