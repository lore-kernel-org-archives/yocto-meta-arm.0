Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2030C433F5
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 16:32:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11865.1633710732243348136
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 08 Oct 2021 09:32:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40DAF1063
	for <meta-arm@lists.yoctoproject.org>; Fri,  8 Oct 2021 09:32:11 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2159B3F66F
	for <meta-arm@lists.yoctoproject.org>; Fri,  8 Oct 2021 09:32:11 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: Add zephyr testimage
Date: Fri,  8 Oct 2021 12:32:06 -0400
Message-Id: <20211008163206.7940-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 08 Oct 2021 16:32:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2263

Add the ability to run testimage against zephyr machines.
Unfortunately, this exposes a bug in meta-zephyr with TESTIMAGE_AUTO not
working correctly.  So, work around this until it can be fixed upstream.
Also, qemu-cortex-a53 does not successfully pass any of the tests it
successfully builds.  So, don't run testimage until that can be
addressed.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml          | 18 ++++++++++++++++--
 ci/microbit-v1.yml      |  8 +++++++-
 ci/qemu-cortex-a53.yml  |  6 +++++-
 ci/qemu-cortex-m3.yml   | 16 ++++++++++++++++
 ci/testimage-zephyr.yml |  8 ++++++++
 5 files changed, 52 insertions(+), 4 deletions(-)
 create mode 100644 ci/qemu-cortex-m3.yml
 create mode 100644 ci/testimage-zephyr.yml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 44f3cd1..04e65ff 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -37,6 +37,17 @@ stages:
     - kas build $KASFILES
     - ./ci/check-warnings $KAS_WORK_DIR/build/warnings.log
 
+# Workaround for Zephyr not currectly handling TESTIMAGE_AUTO
+.build_and_test:
+  extends: .setup
+  script:
+    - KASFILES=$(./ci/jobs-to-kas $CI_JOB_NAME)
+    - kas shell --update --force-checkout $KASFILES -c 'cat conf/*.conf'
+    - kas build $KASFILES
+    - kas build $KASFILES -c testimage
+    - ./ci/check-warnings $KAS_WORK_DIR/build/warnings.log
+
+
 #
 # Prep stage, update repositories once
 #
@@ -130,8 +141,8 @@ juno:
 juno/clang:
   extends: .build
 
-microbit-v1:
-  extends: .build
+microbit-v1/testimage-zephyr:
+  extends: .build_and_test
 
 musca-b1:
   extends: .build
@@ -148,6 +159,9 @@ n1sdp/armgcc:
 qemu-cortex-a53:
   extends: .build
 
+qemu-cortex-m3/testimage-zephyr:
+  extends: .build_and_test
+
 qemu-cortex-r5:
   extends: .build
 
diff --git a/ci/microbit-v1.yml b/ci/microbit-v1.yml
index d5e7453..4c0f4e1 100644
--- a/ci/microbit-v1.yml
+++ b/ci/microbit-v1.yml
@@ -4,7 +4,13 @@ header:
     - base.yml
     - meta-zephyr.yml
 
+local_conf_header:
+  nonbuilding_tests: |
+    ZEPHYRTESTS:remove = "common"
+  failing_tests: |
+    ZEPHYRTESTS:remove = "context early_sleep sleep"
+
 machine: microbit-v1
 
 target:
-  - zephyr-philosophers
+  - zephyr-kernel-test-all
diff --git a/ci/qemu-cortex-a53.yml b/ci/qemu-cortex-a53.yml
index 296d8d5..fcecfc8 100644
--- a/ci/qemu-cortex-a53.yml
+++ b/ci/qemu-cortex-a53.yml
@@ -4,7 +4,11 @@ header:
     - base.yml
     - meta-zephyr.yml
 
+local_conf_header:
+  nonbuilding_tests: |
+    ZEPHYRTESTS:remove += "common device poll queue sleep"
+
 machine: qemu-cortex-a53
 
 target:
-  - zephyr-philosophers
+  - zephyr-kernel-test-all
diff --git a/ci/qemu-cortex-m3.yml b/ci/qemu-cortex-m3.yml
new file mode 100644
index 0000000..9333db2
--- /dev/null
+++ b/ci/qemu-cortex-m3.yml
@@ -0,0 +1,16 @@
+header:
+  version: 9
+  includes:
+    - base.yml
+    - meta-zephyr.yml
+
+local_conf_header:
+  tclibc: |
+    TCLIBC = "newlib"
+  nonbuilding_tests: |
+    ZEPHYRTESTS:remove = "common context pending poll sleep"
+
+machine: qemu-cortex-m3
+
+target:
+  - zephyr-kernel-test-all
diff --git a/ci/testimage-zephyr.yml b/ci/testimage-zephyr.yml
new file mode 100644
index 0000000..242320c
--- /dev/null
+++ b/ci/testimage-zephyr.yml
@@ -0,0 +1,8 @@
+header:
+  version: 9
+
+local_conf_header:
+  testimage: |
+    IMAGE_CLASSES += "testimage"
+    TEST_TARGET = "QemuTargetZephyr"
+    TEST_SUITES = "zephyr"
-- 
2.17.1


