Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81E00C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 13:28:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.6241.1665408501626921831
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 06:28:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1209D11FB
	for <meta-arm@lists.yoctoproject.org>; Mon, 10 Oct 2022 06:28:27 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B552B3F766
	for <meta-arm@lists.yoctoproject.org>; Mon, 10 Oct 2022 06:28:20 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp: zephyr removal
Date: Fri,  7 Oct 2022 11:09:35 -0400
Message-Id: <20221007150935.17721-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 10 Oct 2022 13:28:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3944

Since meta-zephyr is doing CI, there is no need to replicate that here.
Remove all of the zephyr references.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/meta-zephyr.yml                      | 13 -------------
 ci/musca-b1.yml                         |  7 +------
 ci/musca-s1.yml                         |  7 +------
 ci/testimage-zephyr.yml                 |  9 ---------
 ci/update-repos                         |  1 -
 meta-arm-bsp/conf/machine/musca-b1.conf |  5 -----
 meta-arm-bsp/conf/machine/musca-s1.conf |  5 -----
 meta-arm-bsp/documentation/musca-b1.md  | 13 +------------
 8 files changed, 3 insertions(+), 57 deletions(-)
 delete mode 100644 ci/meta-zephyr.yml
 delete mode 100644 ci/testimage-zephyr.yml

diff --git a/ci/meta-zephyr.yml b/ci/meta-zephyr.yml
deleted file mode 100644
index bdd0e2bb..00000000
--- a/ci/meta-zephyr.yml
+++ /dev/null
@@ -1,13 +0,0 @@
-header:
-  version: 11
-  includes:
-    - ci/meta-openembedded.yml
-
-repos:
-  meta-zephyr:
-    url: https://git.yoctoproject.org/git/meta-zephyr
-    layers:
-      meta-zephyr-core:
-
-target:
-  - zephyr-kernel-test-all
diff --git a/ci/musca-b1.yml b/ci/musca-b1.yml
index dc9814d2..b38dd1e4 100644
--- a/ci/musca-b1.yml
+++ b/ci/musca-b1.yml
@@ -2,14 +2,9 @@ header:
   version: 11
   includes:
     - ci/base.yml
-    - ci/meta-zephyr.yml
-
-local_conf_header:
-  nonbuilding_tests: |
-    ZEPHYRTESTS:remove = "common sleep poll device queue"
+    - ci/meta-openembedded.yml
 
 machine: musca-b1
 
 target:
   - trusted-firmware-m
-  - zephyr-kernel-test-all
diff --git a/ci/musca-s1.yml b/ci/musca-s1.yml
index 80a59c48..29f289a3 100644
--- a/ci/musca-s1.yml
+++ b/ci/musca-s1.yml
@@ -2,14 +2,9 @@ header:
   version: 11
   includes:
     - ci/base.yml
-    - ci/meta-zephyr.yml
-
-local_conf_header:
-  nonbuilding_tests: |
-    ZEPHYRTESTS:remove = "common sleep poll device queue"
+    - ci/meta-openembedded.yml
 
 machine: musca-s1
 
 target:
   - trusted-firmware-m
-  - zephyr-kernel-test-all
diff --git a/ci/testimage-zephyr.yml b/ci/testimage-zephyr.yml
deleted file mode 100644
index 83e17a70..00000000
--- a/ci/testimage-zephyr.yml
+++ /dev/null
@@ -1,9 +0,0 @@
-header:
-  version: 11
-
-local_conf_header:
-  testimage: |
-    IMAGE_CLASSES += "testimage"
-    TEST_TARGET = "QemuTargetZephyr"
-    TEST_SUITES = "zephyr"
-    TESTIMAGE_AUTO = "1"
diff --git a/ci/update-repos b/ci/update-repos
index a68257bb..91ff1975 100755
--- a/ci/update-repos
+++ b/ci/update-repos
@@ -22,7 +22,6 @@ repositories = (
     "https://git.yoctoproject.org/git/poky",
     "https://git.openembedded.org/meta-openembedded",
     "https://git.yoctoproject.org/git/meta-virtualization",
-    "https://git.yoctoproject.org/git/meta-zephyr",
     "https://github.com/kraj/meta-clang",
 )
 
diff --git a/meta-arm-bsp/conf/machine/musca-b1.conf b/meta-arm-bsp/conf/machine/musca-b1.conf
index a7895b81..c5ef3233 100644
--- a/meta-arm-bsp/conf/machine/musca-b1.conf
+++ b/meta-arm-bsp/conf/machine/musca-b1.conf
@@ -20,9 +20,4 @@ QB_GRAPHICS = "-nographic -vga none"
 QB_MEM = "512k"
 QB_RNG = ""
 
-# Zephyr RTOS settings
-ZEPHYR_BOARD = "v2m_musca_b1"
-ZEPHYR_INHERIT_CLASSES += "zephyr-qemuboot"
-ARCH:musca-b1 = "arm"
-
 TFM_PLATFORM = "arm/musca_b1/sse_200"
diff --git a/meta-arm-bsp/conf/machine/musca-s1.conf b/meta-arm-bsp/conf/machine/musca-s1.conf
index 0cfd56e0..3d3bc4de 100644
--- a/meta-arm-bsp/conf/machine/musca-s1.conf
+++ b/meta-arm-bsp/conf/machine/musca-s1.conf
@@ -19,9 +19,4 @@ QB_GRAPHICS = "-nographic -vga none"
 QB_MEM = "512k"
 QB_RNG = ""
 
-# Zephyr RTOS settings
-ZEPHYR_BOARD = "v2m_musca_s1"
-ZEPHYR_INHERIT_CLASSES += "zephyr-qemuboot"
-ARCH:musca-s1 = "arm"
-
 TFM_PLATFORM = "arm/musca_s1"
diff --git a/meta-arm-bsp/documentation/musca-b1.md b/meta-arm-bsp/documentation/musca-b1.md
index a9af03f5..a7439e53 100644
--- a/meta-arm-bsp/documentation/musca-b1.md
+++ b/meta-arm-bsp/documentation/musca-b1.md
@@ -4,9 +4,6 @@
 For a description of the hardware, go to
 https://developer.arm.com/tools-and-software/development-boards/iot-test-chips-and-boards/musca-b-test-chip-board
 
-For current supported hardware by Zephyr, go to
-https://docs.zephyrproject.org/2.3.0/boards/arm/v2m_musca/doc/index.html
-
 For emulated hardware, go to
 https://www.qemu.org/docs/master/system/arm/musca.html
 
@@ -14,13 +11,5 @@ https://www.qemu.org/docs/master/system/arm/musca.html
 In the local.conf file, MACHINE should be set as follows:
 MACHINE ?= "musca-b1"
 
-To build for Zephyr:
-```bash$ bitbake-layers layerindex-fetch meta-zephyr```
-```bash$ bitbake zephyr-philosophers```
-
-To build the trusted firmware-m (and not Zephyr):
+To build the trusted firmware-m:
 ```bash$ bitbake trusted-firmware-m```
-
-## Running
-To run Zephyr on the QEMU based machine, execute the following command
-```bash$ runqemu qemu-musca-b1```
-- 
2.17.1


