Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3148C43334
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 13:31:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.7200.1655904659858784293
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 Jun 2022 06:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61E7913D5
	for <meta-arm@lists.yoctoproject.org>; Wed, 22 Jun 2022 06:30:59 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1BE893F534
	for <meta-arm@lists.yoctoproject.org>; Wed, 22 Jun 2022 06:30:59 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] ci: work around zephyr test issues
Date: Mon, 20 Jun 2022 11:02:46 -0400
Message-Id: <20220620150246.3171-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 22 Jun 2022 13:31:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3524

zephyr uses icount to improve test accuracy on virtual hardware.  Do
the same here for the same reason for the platforms that actually test.
Also, the common test now appears to work for microbit-v1 and poll doe
snot work for qemu-cortex-m3

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/microbit-v1.yml                     | 4 ----
 ci/qemu-cortex-m3.yml                  | 4 +++-
 meta-arm/conf/machine/microbit-v1.conf | 1 +
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/ci/microbit-v1.yml b/ci/microbit-v1.yml
index d78af2b2..b8501486 100644
--- a/ci/microbit-v1.yml
+++ b/ci/microbit-v1.yml
@@ -4,8 +4,4 @@ header:
     - ci/base.yml
     - ci/meta-zephyr.yml
 
-local_conf_header:
-  failing_tests: |
-    ZEPHYRTESTS:remove = "common"
-
 machine: microbit-v1
diff --git a/ci/qemu-cortex-m3.yml b/ci/qemu-cortex-m3.yml
index 8a96037c..6f892a9e 100644
--- a/ci/qemu-cortex-m3.yml
+++ b/ci/qemu-cortex-m3.yml
@@ -13,6 +13,8 @@ local_conf_header:
   tclibc: |
     TCLIBC = "newlib"
   nonbuilding_tests: |
-    ZEPHYRTESTS:remove = "context pending sleep"
+    ZEPHYRTESTS:remove = "context pending poll sleep"
+  qemu_opts: |
+    QB_OPT_APPEND = "-icount shift=3,align=off,sleep=on -rtc clock=vm"
 
 machine: qemu-cortex-m3
diff --git a/meta-arm/conf/machine/microbit-v1.conf b/meta-arm/conf/machine/microbit-v1.conf
index 6b18191e..ef3872fe 100644
--- a/meta-arm/conf/machine/microbit-v1.conf
+++ b/meta-arm/conf/machine/microbit-v1.conf
@@ -16,6 +16,7 @@ QB_MACHINE = "-machine microbit"
 QB_CPU = "-cpu cortex-m0"
 QB_GRAPHICS = "-nographic -vga none"
 QB_RNG = ""
+QB_OPT_APPEND = "-icount shift=6,align=off,sleep=on -rtc clock=vm"
 
 # Zephyr RTOS settings
 ZEPHYR_BOARD = "qemu_cortex_m0"
-- 
2.17.1


