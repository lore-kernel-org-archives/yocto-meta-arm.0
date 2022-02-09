Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 365C0C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 04:14:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.22458.1644380049559216029
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Feb 2022 20:14:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0476FED1
	for <meta-arm@lists.yoctoproject.org>; Tue,  8 Feb 2022 20:14:09 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D5C183F718
	for <meta-arm@lists.yoctoproject.org>; Tue,  8 Feb 2022 20:14:08 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: update zephyr based testing
Date: Tue,  8 Feb 2022 23:14:04 -0500
Message-Id: <20220209041404.13954-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 09 Feb 2022 04:14:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2963

Update the zephyr testcases to be the ones that build and pass tests
(where testing possible).  Also, add comment to qemu-cortex-a53 about
not passing tests.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/microbit-v1.yml     | 4 +---
 ci/musca-b1.yml        | 6 +++++-
 ci/musca-s1.yml        | 5 ++++-
 ci/qemu-cortex-a53.yml | 4 +---
 ci/qemu-cortex-m3.yml  | 2 +-
 ci/qemu-cortex-r5.yml  | 6 +++++-
 6 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/ci/microbit-v1.yml b/ci/microbit-v1.yml
index 7475748..d00ee6a 100644
--- a/ci/microbit-v1.yml
+++ b/ci/microbit-v1.yml
@@ -5,10 +5,8 @@ header:
     - ci/meta-zephyr.yml
 
 local_conf_header:
-  nonbuilding_tests: |
-    ZEPHYRTESTS:remove = "common"
   failing_tests: |
-    ZEPHYRTESTS:remove = "context early_sleep sleep"
+    ZEPHYRTESTS:remove = "common"
 
 machine: microbit-v1
 
diff --git a/ci/musca-b1.yml b/ci/musca-b1.yml
index 0e3ab79..dc9814d 100644
--- a/ci/musca-b1.yml
+++ b/ci/musca-b1.yml
@@ -4,8 +4,12 @@ header:
     - ci/base.yml
     - ci/meta-zephyr.yml
 
+local_conf_header:
+  nonbuilding_tests: |
+    ZEPHYRTESTS:remove = "common sleep poll device queue"
+
 machine: musca-b1
 
 target:
   - trusted-firmware-m
-  - zephyr-philosophers
+  - zephyr-kernel-test-all
diff --git a/ci/musca-s1.yml b/ci/musca-s1.yml
index 523a235..80a59c4 100644
--- a/ci/musca-s1.yml
+++ b/ci/musca-s1.yml
@@ -4,9 +4,12 @@ header:
     - ci/base.yml
     - ci/meta-zephyr.yml
 
+local_conf_header:
+  nonbuilding_tests: |
+    ZEPHYRTESTS:remove = "common sleep poll device queue"
 
 machine: musca-s1
 
 target:
   - trusted-firmware-m
-  - zephyr-philosophers
+  - zephyr-kernel-test-all
diff --git a/ci/qemu-cortex-a53.yml b/ci/qemu-cortex-a53.yml
index 631a9d4..db8bdd8 100644
--- a/ci/qemu-cortex-a53.yml
+++ b/ci/qemu-cortex-a53.yml
@@ -4,9 +4,7 @@ header:
     - ci/base.yml
     - ci/meta-zephyr.yml
 
-local_conf_header:
-  nonbuilding_tests: |
-    ZEPHYRTESTS:remove = "common device poll queue sleep"
+# FIXME - testimage fails all tests currently, but all the tests build
 
 machine: qemu-cortex-a53
 
diff --git a/ci/qemu-cortex-m3.yml b/ci/qemu-cortex-m3.yml
index d9b197c..85bbfc6 100644
--- a/ci/qemu-cortex-m3.yml
+++ b/ci/qemu-cortex-m3.yml
@@ -13,7 +13,7 @@ local_conf_header:
   tclibc: |
     TCLIBC = "newlib"
   nonbuilding_tests: |
-    ZEPHYRTESTS:remove = "common context pending poll sleep"
+    ZEPHYRTESTS:remove = "context pending sleep"
 
 machine: qemu-cortex-m3
 
diff --git a/ci/qemu-cortex-r5.yml b/ci/qemu-cortex-r5.yml
index e3b4c6f..474edc2 100644
--- a/ci/qemu-cortex-r5.yml
+++ b/ci/qemu-cortex-r5.yml
@@ -4,7 +4,11 @@ header:
     - ci/base.yml
     - ci/meta-zephyr.yml
 
+local_conf_header:
+  nonbuilding_tests: |
+    ZEPHYRTESTS:remove = "common poll sleep queue device"
+
 machine: qemu-cortex-r5
 
 target:
-  - zephyr-philosophers
+  - zephyr-kernel-test-all
-- 
2.17.1


