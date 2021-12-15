Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D207CC4332F
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:43:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.35.1639582919808930415
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 15 Dec 2021 07:42:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB68E6D
	for <meta-arm@lists.yoctoproject.org>; Wed, 15 Dec 2021 07:41:52 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C28073F774
	for <meta-arm@lists.yoctoproject.org>; Wed, 15 Dec 2021 07:41:52 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp: add zephyr for musca-s1
Date: Wed, 15 Dec 2021 10:41:45 -0500
Message-Id: <20211215154145.6610-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 16 Dec 2021 01:43:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2720

Zephyr supports musca-s1 boards.  Add support in the machine config file
and the relevant CI entries to build it.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/musca-s1.yml                         |  4 +++-
 meta-arm-bsp/conf/machine/musca-s1.conf | 15 +++++++++++++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/ci/musca-s1.yml b/ci/musca-s1.yml
index 29f289a..523a235 100644
--- a/ci/musca-s1.yml
+++ b/ci/musca-s1.yml
@@ -2,9 +2,11 @@ header:
   version: 11
   includes:
     - ci/base.yml
-    - ci/meta-openembedded.yml
+    - ci/meta-zephyr.yml
+
 
 machine: musca-s1
 
 target:
   - trusted-firmware-m
+  - zephyr-philosophers
diff --git a/meta-arm-bsp/conf/machine/musca-s1.conf b/meta-arm-bsp/conf/machine/musca-s1.conf
index be15c60..d18c06c 100644
--- a/meta-arm-bsp/conf/machine/musca-s1.conf
+++ b/meta-arm-bsp/conf/machine/musca-s1.conf
@@ -9,4 +9,19 @@ require conf/machine/include/arm/armv8-m/tune-cortexm33.inc
 # GLIBC will not work with Cortex-M.
 TCLIBC = "newlib"
 
+# For runqemu
+IMAGE_FSTYPES += "ext4"
+IMAGE_CLASSES += "qemuboot"
+QB_SYSTEM_NAME = "qemu-system-arm"
+QB_MACHINE = "-machine musca-s1"
+QB_CPU = "-cpu cortex-m33"
+QB_OPT_APPEND = "-nographic -vga none"
+QB_MEM = "512k"
+QB_RNG = ""
+
+# Zephyr RTOS settings
+ZEPHYR_BOARD = "v2m_musca_s1"
+ZEPHYR_INHERIT_CLASSES += "zephyr-qemuboot"
+ARCH:musca-s1 = "arm"
+
 TFM_PLATFORM = "arm/musca_s1"
-- 
2.17.1


