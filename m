Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A26DC3F6B0
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 16:56:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.22433.1658940978796692379
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Jul 2022 09:56:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3F4D113E
	for <meta-arm@lists.yoctoproject.org>; Wed, 27 Jul 2022 09:56:18 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 42C0A3F70D
	for <meta-arm@lists.yoctoproject.org>; Wed, 27 Jul 2022 09:56:18 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: remove zephyr specific testimage hacks
Date: Wed, 27 Jul 2022 12:56:11 -0400
Message-Id: <20220727165611.7089-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 27 Jul 2022 16:56:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3603

meta-zephyr recently was fixed to allow for autotest.  Remove all the
zephyr testing hacks and use that.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml          | 15 ++-------------
 ci/testimage-zephyr.yml |  1 +
 2 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 36cf61ac..840a6507 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -41,17 +41,6 @@ stages:
     paths:
       - $CI_PROJECT_DIR/work/build/tmp/work*/**/temp/log.do_*.*
 
-# Workaround for Zephyr not currectly handling TESTIMAGE_AUTO
-.build_and_test:
-  extends: .setup
-  script:
-    - KASFILES=$(./ci/jobs-to-kas "$CI_JOB_NAME")
-    - kas shell --update --force-checkout $KASFILES -c 'cat conf/*.conf'
-    - kas build $KASFILES
-    - kas build $KASFILES -c testimage
-    - ./ci/check-warnings $KAS_WORK_DIR/build/warnings.log
-
-
 #
 # Prep stage, update repositories once
 #
@@ -138,7 +127,7 @@ juno:
         FIRMWARE: [uboot, edk2]
 
 microbit-v1:
-  extends: .build_and_test
+  extends: .build
   parallel:
     matrix:
       - TESTING: testimage-zephyr
@@ -159,7 +148,7 @@ qemu-cortex-a53:
   extends: .build
 
 qemu-cortex-m3:
-  extends: .build_and_test
+  extends: .build
   parallel:
     matrix:
       - TESTING: testimage-zephyr
diff --git a/ci/testimage-zephyr.yml b/ci/testimage-zephyr.yml
index 7ef051b5..83e17a70 100644
--- a/ci/testimage-zephyr.yml
+++ b/ci/testimage-zephyr.yml
@@ -6,3 +6,4 @@ local_conf_header:
     IMAGE_CLASSES += "testimage"
     TEST_TARGET = "QemuTargetZephyr"
     TEST_SUITES = "zephyr"
+    TESTIMAGE_AUTO = "1"
-- 
2.17.1


