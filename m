Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.985.1612462453245881332
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 Feb 2021 10:14:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F3BED6E
	for <meta-arm@lists.yoctoproject.org>; Thu,  4 Feb 2021 10:14:11 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F11C83F73B
	for <meta-arm@lists.yoctoproject.org>; Thu,  4 Feb 2021 10:14:10 -0800 (PST)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/6] gem5/gem5-aarch64-native: don't build gem5 three times
Date: Thu,  4 Feb 2021 13:14:00 -0500
Message-Id: <20210204181405.20275-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

From: Ross Burton <ross.burton@arm.com>

The recipe currently builds gem5 binaries in optimised, fast, and
debug mode.  There is no need to build three at once (and triples the
build time), so simply build the optimised variant by default (as recommended
by upstream) whilst letting the variant be altered by setting
GEM5_BUILD_VARIANT.

Change-Id: I23baeee438d1ff08d1e2a54282141b55500f2ac1
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-gem5/recipes-devtools/gem5/gem5-aarch64-native.inc | 5 ++---
 meta-gem5/recipes-devtools/gem5/gem5-native.inc         | 5 ++++-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native.inc b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native.inc
index 898fa23..0a8e34c 100644
--- a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native.inc
+++ b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native.inc
@@ -1,8 +1,7 @@
 # gem5 aarch64 specific configuration
 
 # Build arm64 gem5
-GEM5_BUILD_CONFIGS ?= "build/ARM/gem5.opt build/ARM/gem5.fast \
-    build/ARM/gem5.debug"
+GEM5_BUILD_CONFIGS ?= "build/ARM/gem5.${GEM5_BUILD_VARIANT}"
 
 SRC_URI += "file://start-gem5.sh"
 
@@ -10,7 +9,7 @@ inherit deploy
 
 # Parameters for the start script
 
-GEM5_RUN_CONFIG ?= "gem5.fast"
+GEM5_RUN_CONFIG ?= "gem5.${GEM5_BUILD_VARIANT}"
 
 # Linux kernel file to boot
 GEM5_RUN_KERNEL ?= "vmlinux"
diff --git a/meta-gem5/recipes-devtools/gem5/gem5-native.inc b/meta-gem5/recipes-devtools/gem5/gem5-native.inc
index 3cad1eb..06c03e4 100644
--- a/meta-gem5/recipes-devtools/gem5/gem5-native.inc
+++ b/meta-gem5/recipes-devtools/gem5/gem5-native.inc
@@ -6,8 +6,11 @@ LICENSE = "BSD & MIT & LGPLv2.1"
 
 # Gem5 build and run parameter
 
+# See http://www.gem5.org/documentation/general_docs/building for the list of variants
+GEM5_BUILD_VARIANT ?= "opt"
+
 # What gem5 binary are we building
-GEM5_BUILD_CONFIGS ?= "build/X86/gem5.opt"
+GEM5_BUILD_CONFIGS ?= "build/X86/gem5.{GEM5_BUILD_VARIANT}"
 
 # Scons build arguments
 GEM5_SCONS_ARGS ?= "CC=${BUILD_CC} CXX=${BUILD_CXX} \
-- 
2.17.1

