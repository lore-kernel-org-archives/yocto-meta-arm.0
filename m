Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 728C0C433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 13:47:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.23865.1664977626213256489
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Oct 2022 06:47:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63F261476
	for <meta-arm@lists.yoctoproject.org>; Wed,  5 Oct 2022 06:47:12 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7B4C13F792
	for <meta-arm@lists.yoctoproject.org>; Wed,  5 Oct 2022 06:47:05 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] CI: cleanups for targets and removed tests
Date: Wed,  5 Oct 2022 09:47:00 -0400
Message-Id: <20221005134700.7308-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221005134700.7308-1-jon.mason@arm.com>
References: <20221005134700.7308-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 05 Oct 2022 13:47:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3936

Some of the removed tests are now working and some of the systems are
not testing against sato (as being done in base.yml).  Update these and
add some comments.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/clang.yml                | 6 ------
 ci/corstone1000-common.yml  | 4 +++-
 ci/corstone500.yml          | 1 +
 ci/qemu-generic-arm64.yml   | 2 +-
 ci/qemuarm64-secureboot.yml | 5 -----
 5 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/ci/clang.yml b/ci/clang.yml
index 80b9a4e3..a2063f19 100644
--- a/ci/clang.yml
+++ b/ci/clang.yml
@@ -8,9 +8,3 @@ repos:
 local_conf_header:
   clang: |
     TOOLCHAIN = "clang"
-    # Clang causes more binaries to have buildpaths in the debug symbols
-    # https://github.com/llvm/llvm-project/issues/56609
-    WARN_QA:remove = "buildpaths"
-
-target:
-  - core-image-base
diff --git a/ci/corstone1000-common.yml b/ci/corstone1000-common.yml
index 6599d97a..970a87c9 100644
--- a/ci/corstone1000-common.yml
+++ b/ci/corstone1000-common.yml
@@ -3,11 +3,13 @@ header:
   includes:
     - ci/base.yml
     - ci/meta-openembedded.yml
+
 local_conf_header:
     perf: |
+    # Intentionally blank to prevent perf from being added to the image in base.yml
 
 distro: poky-tiny
 
 target:
-  - perf
   - corstone1000-image
+  - perf
diff --git a/ci/corstone500.yml b/ci/corstone500.yml
index ef78cacd..d51d45fb 100644
--- a/ci/corstone500.yml
+++ b/ci/corstone500.yml
@@ -8,6 +8,7 @@ local_conf_header:
     INHERIT += "fvpboot"
     IMAGE_FEATURES:remove = " ssh-server-dropbear"
   perf: |
+    # Intentionally blank to prevent perf from being added to the image in base.yml
 
 machine: corstone500
 
diff --git a/ci/qemu-generic-arm64.yml b/ci/qemu-generic-arm64.yml
index 87cbd2f8..32c4b981 100644
--- a/ci/qemu-generic-arm64.yml
+++ b/ci/qemu-generic-arm64.yml
@@ -10,5 +10,5 @@ local_conf_header:
 machine: qemu-generic-arm64
 
 target:
-  - core-image-base
+  - core-image-sato
   - sbsa-acs
diff --git a/ci/qemuarm64-secureboot.yml b/ci/qemuarm64-secureboot.yml
index c3522e17..f617dfc5 100644
--- a/ci/qemuarm64-secureboot.yml
+++ b/ci/qemuarm64-secureboot.yml
@@ -5,11 +5,6 @@ header:
 
 machine: qemuarm64-secureboot
 
-local_conf_header:
-  failing_tests: |
-    # software IO TLB: Cannot allocate buffer
-    DEFAULT_TEST_SUITES:remove = "parselogs"
-
 target:
   - core-image-base
   - optee-examples
-- 
2.17.1


