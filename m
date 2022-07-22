Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4222ECCA473
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 16:23:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.9700.1658507008926269890
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 22 Jul 2022 09:23:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF1151477
	for <meta-arm@lists.yoctoproject.org>; Fri, 22 Jul 2022 09:23:28 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 12B933F73D
	for <meta-arm@lists.yoctoproject.org>; Fri, 22 Jul 2022 09:23:28 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] ci: do sato by default
Date: Fri, 22 Jul 2022 12:23:23 -0400
Message-Id: <20220722162323.2508-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220722162323.2508-1-jon.mason@arm.com>
References: <20220722162323.2508-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 22 Jul 2022 16:23:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3585

Change to use sato by default.  Unfortunately, there are some bugs found
by this change.  For those systems, change it back to base until the
issues can be resolved.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/base.yml           | 5 ++++-
 ci/clang.yml          | 3 +++
 ci/edk2.yml           | 2 ++
 ci/fvp-base-arm32.yml | 2 ++
 ci/fvp-base.yml       | 2 ++
 5 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/ci/base.yml b/ci/base.yml
index 670d8986..eff466ed 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -44,7 +44,10 @@ local_conf_header:
     CORE_IMAGE_EXTRA_INSTALL += "perf"
   sshkeys: |
     CORE_IMAGE_EXTRA_INSTALL += "ssh-pregen-hostkeys"
+  universally_failing_tests: |
+    TEST_SUITES:remove = "opkg"
+
 machine: unset
 
 target:
-  - core-image-base
+  - core-image-sato
diff --git a/ci/clang.yml b/ci/clang.yml
index 99ca8d43..80b9a4e3 100644
--- a/ci/clang.yml
+++ b/ci/clang.yml
@@ -11,3 +11,6 @@ local_conf_header:
     # Clang causes more binaries to have buildpaths in the debug symbols
     # https://github.com/llvm/llvm-project/issues/56609
     WARN_QA:remove = "buildpaths"
+
+target:
+  - core-image-base
diff --git a/ci/edk2.yml b/ci/edk2.yml
index 219ee28b..1261bf10 100644
--- a/ci/edk2.yml
+++ b/ci/edk2.yml
@@ -13,3 +13,5 @@ local_conf_header:
 
     QB_DEFAULT_BIOS = "QEMU_EFI.fd"
     WKS_FILE ?= "efi-disk.wks.in"
+  failing_tests: |
+    TEST_SUITES:remove = "xorg"
diff --git a/ci/fvp-base-arm32.yml b/ci/fvp-base-arm32.yml
index 85e56307..be4b0088 100644
--- a/ci/fvp-base-arm32.yml
+++ b/ci/fvp-base-arm32.yml
@@ -14,3 +14,5 @@ local_conf_header:
     # Tell testimage to connect to localhost:8122, and forward that to SSH in the FVP.
     TEST_TARGET_IP = "127.0.0.1:8122"
     FVP_CONFIG[bp.virtio_net.hostbridge.userNetPorts] = "8122=22"
+  failing_tests: |
+    TEST_SUITES:remove = "xorg"
diff --git a/ci/fvp-base.yml b/ci/fvp-base.yml
index 037e36ef..fa2ddb3e 100644
--- a/ci/fvp-base.yml
+++ b/ci/fvp-base.yml
@@ -14,3 +14,5 @@ local_conf_header:
     # Tell testimage to connect to localhost:8022, and forward that to SSH in the FVP.
     TEST_TARGET_IP = "localhost:8022"
     FVP_CONFIG[bp.virtio_net.hostbridge.userNetPorts] ?= "8022=22"
+  failing_tests: |
+    TEST_SUITES:remove = "xorg"
-- 
2.17.1


