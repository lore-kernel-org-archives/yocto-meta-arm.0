Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2F3CC433F5
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 15:33:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.3154.1637249588970699650
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Nov 2021 07:33:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 660806D
	for <meta-arm@lists.yoctoproject.org>; Thu, 18 Nov 2021 07:33:07 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 41E243F766
	for <meta-arm@lists.yoctoproject.org>; Thu, 18 Nov 2021 07:33:07 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: use matrix for more defined way of doing things and
 cleanup
Date: Wed, 17 Nov 2021 16:03:00 -0500
Message-Id: <20211117210300.7048-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 18 Nov 2021 15:33:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2423

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml         | 111 +++++++++++++++++++++--------------------
 ci/bootstrap.yml       |   9 ----
 ci/clang-bootstrap.yml |  10 ----
 ci/jobs-to-kas         |  32 +++++++-----
 4 files changed, 77 insertions(+), 85 deletions(-)
 delete mode 100644 ci/bootstrap.yml
 delete mode 100644 ci/clang-bootstrap.yml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 50f5ec1..e2d000a 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,9 +1,7 @@
 image: ghcr.io/siemens/kas/kas
 
-# First do a common bootstrap, and then build all the targets
 stages:
   - prep
-  - bootstrap
   - build
 
 # Common job fragment to get a worker ready
@@ -33,7 +31,7 @@ stages:
 .build:
   extends: .setup
   script:
-    - KASFILES=$(./ci/jobs-to-kas $CI_JOB_NAME)
+    - KASFILES=$(./ci/jobs-to-kas "$CI_JOB_NAME")
     - kas shell --update --force-checkout $KASFILES -c 'cat conf/*.conf'
     - kas build $KASFILES
     - ./ci/check-warnings $KAS_WORK_DIR/build/warnings.log
@@ -42,7 +40,7 @@ stages:
 .build_and_test:
   extends: .setup
   script:
-    - KASFILES=$(./ci/jobs-to-kas $CI_JOB_NAME)
+    - KASFILES=$(./ci/jobs-to-kas "$CI_JOB_NAME")
     - kas shell --update --force-checkout $KASFILES -c 'cat conf/*.conf'
     - kas build $KASFILES
     - kas build $KASFILES -c testimage
@@ -58,23 +56,10 @@ update-repos:
   script:
     - flock --verbose --timeout 60 $KAS_REPO_REF_DIR ./ci/update-repos
 
-#
-# Bootstrap stage, bootstrap and machine coverage
-#
-
-# Build a number of native tools first to ensure the other builders don't race
-# over them
-n1sdp/bootstrap:
-  extends: .build
-  stage: bootstrap
-
-n1sdp/clang/clang-bootstrap:
-  extends: .build
-  stage: bootstrap
 
 # What percentage of machines in the layer do we build
 machine-coverage:
-  stage: bootstrap
+  stage: build
   interruptible: true
   script:
     - ./ci/check-machine-coverage
@@ -83,6 +68,11 @@ machine-coverage:
 #
 # Build stage, the actual build jobs
 #
+# Available options for building are
+#  TOOLCHAINS: [gcc, clang, armgcc, external-gccarm]
+#  TCLIBC: [glibc, musl]
+#  VIRT: [none, xen]
+#  TESTING: testimage
 
 # Validate layers are Yocto Project Compatible
 check-layers:
@@ -112,16 +102,19 @@ corstone700-mps3:
 corstone1000-fvp:
   extends: .build
 
-fvp-base/testimage:
+fvp-base:
   extends: .build
+  parallel:
+    matrix:
+      - TESTING: testimage
   tags:
-  - x86_64
+    - x86_64
 
 fvp-base-arm32:
   extends: .build
-
-fvp-base-arm32/external-gccarm:
-  extends: .build
+  parallel:
+    matrix:
+      - TOOLCHAINS: [gcc, external-gccarm]
 
 fvp-baser-aemv8r64:
   extends: .build
@@ -131,9 +124,9 @@ fvps:
 
 gem5-arm64:
   extends: .build
-
-gem5-arm64/xen:
-  extends: .build
+  parallel:
+    matrix:
+      - VIRT: [none, xen]
 
 gem5-atp-arm64:
   extends: .build
@@ -143,12 +136,15 @@ generic-arm64:
 
 juno:
   extends: .build
+  parallel:
+    matrix:
+      - TOOLCHAINS: [gcc, clang]
 
-juno/clang:
-  extends: .build
-
-microbit-v1/testimage-zephyr:
+microbit-v1:
   extends: .build_and_test
+  parallel:
+    matrix:
+      - TESTING: testimage-zephyr
 
 musca-b1:
   extends: .build
@@ -158,48 +154,55 @@ musca-s1:
 
 n1sdp:
   extends: .build
-
-n1sdp/armgcc:
-  extends: .build
+  parallel:
+    matrix:
+      - TOOLCHAINS: [gcc, armgcc]
 
 qemu-cortex-a53:
   extends: .build
 
-qemu-cortex-m3/testimage-zephyr:
+qemu-cortex-m3:
   extends: .build_and_test
+  parallel:
+    matrix:
+      - TESTING: testimage-zephyr
 
 qemu-cortex-r5:
   extends: .build
 
-qemu-generic-arm64/testimage:
-  extends: .build
-
-qemuarm64-secureboot/testimage:
-  extends: .build
-
-qemuarm64-secureboot/clang/testimage:
-  extends: .build
-
-qemuarm64-secureboot/clang/musl/testimage:
-  extends: .build
-
-qemuarm64-secureboot/musl/testimage:
-  extends: .build
-
-qemuarm64/xen:
+qemu-generic-arm64:
   extends: .build
+  parallel:
+    matrix:
+      - TESTING: testimage
 
-qemuarm/clang/testimage:
+qemuarm64-secureboot:
   extends: .build
+  parallel:
+    matrix:
+      - TOOLCHAINS: [gcc, clang]
+        TCLIBC: [glibc, musl]
+        TESTING: testimage
 
-qemuarm/testimage:
+qemuarm64:
   extends: .build
+  parallel:
+    matrix:
+      - VIRT: xen
 
-qemuarm/xen:
+qemuarm:
   extends: .build
+  parallel:
+    matrix:
+      - TOOLCHAINS: [gcc, clang]
+        TESTING: testimage
+      - VIRT: xen
 
-qemuarmv5/testimage:
+qemuarmv5:
   extends: .build
+  parallel:
+    matrix:
+      - TESTING: testimage
 
 sgi575:
   extends: .build
diff --git a/ci/bootstrap.yml b/ci/bootstrap.yml
deleted file mode 100644
index 0e05e46..0000000
--- a/ci/bootstrap.yml
+++ /dev/null
@@ -1,9 +0,0 @@
-header:
-  version: 9
-
-target:
-  - binutils-cross-aarch64
-  - gcc-cross-aarch64
-  - python3-native
-  - opkg-native
-  - rpm-native
diff --git a/ci/clang-bootstrap.yml b/ci/clang-bootstrap.yml
deleted file mode 100644
index f5497ff..0000000
--- a/ci/clang-bootstrap.yml
+++ /dev/null
@@ -1,10 +0,0 @@
-header:
-  version: 9
-
-target:
-  - binutils-cross-aarch64
-  - clang-cross-aarch64
-  - clang-native
-  - python3-native
-  - opkg-native
-  - rpm-native
diff --git a/ci/jobs-to-kas b/ci/jobs-to-kas
index 7057970..f442a22 100755
--- a/ci/jobs-to-kas
+++ b/ci/jobs-to-kas
@@ -1,19 +1,27 @@
 #! /bin/bash
 
-# Read a GitLab CI job name on $1 and transform it to a
-# list of Kas yaml files
+# This script is expecting an input of machine name, optionally followed by a
+# colon and a list of one or more parameters separated by commas between
+# brackets.  For example, the following are acceptable:
+# corstone500
+# fvp-base: [testimage]
+# qemuarm64-secureboot: [clang, glibc, testimage]
+#
+# Turn this list into a series of yml files separated by colons to pass to kas
 
 set -e -u
 
-# Read Job namne from $1 and split on /
-IFS=/ read -r -a PARTS<<<$1
+FILES="ci/$(echo $1 | cut -d ':' -f 1).yml"
 
-# Prefix each part with ci/
-PARTS=("${PARTS[@]/#/ci/}")
+for i in $(echo $1 | cut -s -d ':' -f 2 | sed 's/[][,]//g'); do
+	# Given that there are no yml files for gcc or glibc, as those are the
+	# defaults, we can simply ignore those parameters.  They are necessary
+	# to pass in so that matrix can correctly setup all of the permutations
+	# of each individual run.
+	if [[ $i == 'none' || $i == 'gcc' || $i == 'glibc' ]]; then
+		continue
+	fi
+	FILES+=":ci/$i.yml"
+done
 
-# Suffix each part with .yml
-PARTS=("${PARTS[@]/%/.yml}")
-
-# Print colon-separated
-IFS=":"
-echo "${PARTS[*]}"
+echo $FILES
-- 
2.17.1


