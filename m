Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 399E4C433F5
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 13:36:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.5065.1652880990013513679
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 May 2022 06:36:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D7901474
	for <meta-arm@lists.yoctoproject.org>; Wed, 18 May 2022 06:36:29 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 818BD3F73D
	for <meta-arm@lists.yoctoproject.org>; Wed, 18 May 2022 06:36:29 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/4] arm/machine: used QB_GRAPICS
Date: Wed, 18 May 2022 09:36:24 -0400
Message-Id: <20220518133624.24874-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220518133624.24874-1-jon.mason@arm.com>
References: <20220518133624.24874-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 May 2022 13:36:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3439

QB_OPT_APPEND is being used for the graphics parameters, use QB_GRAPHICS
instead.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/musca-b1.conf       | 2 +-
 meta-arm-bsp/conf/machine/musca-s1.conf       | 2 +-
 meta-arm-bsp/conf/machine/qemu-cortex-r5.conf | 2 +-
 meta-arm/conf/machine/microbit-v1.conf        | 2 +-
 meta-arm/conf/machine/qemu-cortex-a53.conf    | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/musca-b1.conf b/meta-arm-bsp/conf/machine/musca-b1.conf
index 073c466e..a7895b81 100644
--- a/meta-arm-bsp/conf/machine/musca-b1.conf
+++ b/meta-arm-bsp/conf/machine/musca-b1.conf
@@ -16,7 +16,7 @@ IMAGE_CLASSES += "qemuboot"
 QB_SYSTEM_NAME = "qemu-system-arm"
 QB_MACHINE = "-machine musca-b1"
 QB_CPU = "-cpu cortex-m33"
-QB_OPT_APPEND = "-nographic -vga none"
+QB_GRAPHICS = "-nographic -vga none"
 QB_MEM = "512k"
 QB_RNG = ""
 
diff --git a/meta-arm-bsp/conf/machine/musca-s1.conf b/meta-arm-bsp/conf/machine/musca-s1.conf
index d18c06c2..0cfd56e0 100644
--- a/meta-arm-bsp/conf/machine/musca-s1.conf
+++ b/meta-arm-bsp/conf/machine/musca-s1.conf
@@ -15,7 +15,7 @@ IMAGE_CLASSES += "qemuboot"
 QB_SYSTEM_NAME = "qemu-system-arm"
 QB_MACHINE = "-machine musca-s1"
 QB_CPU = "-cpu cortex-m33"
-QB_OPT_APPEND = "-nographic -vga none"
+QB_GRAPHICS = "-nographic -vga none"
 QB_MEM = "512k"
 QB_RNG = ""
 
diff --git a/meta-arm-bsp/conf/machine/qemu-cortex-r5.conf b/meta-arm-bsp/conf/machine/qemu-cortex-r5.conf
index 29b37d79..5a0ea69b 100644
--- a/meta-arm-bsp/conf/machine/qemu-cortex-r5.conf
+++ b/meta-arm-bsp/conf/machine/qemu-cortex-r5.conf
@@ -13,7 +13,7 @@ QB_SYSTEM_NAME = "qemu-system-aarch64"
 QB_MACHINE = "-machine xlnx-zcu102"
 QB_CPU = "-cpu cortex-r5"
 QB_MEM = "-m 64k"
-QB_OPT_APPEND = "-nographic -vga none"
+QB_GRAPHICS = "-nographic -vga none"
 QB_RNG = ""
 
 # Zephyr RTOS settings
diff --git a/meta-arm/conf/machine/microbit-v1.conf b/meta-arm/conf/machine/microbit-v1.conf
index 1fa2532f..6b18191e 100644
--- a/meta-arm/conf/machine/microbit-v1.conf
+++ b/meta-arm/conf/machine/microbit-v1.conf
@@ -14,7 +14,7 @@ TCLIBC = "newlib"
 QB_SYSTEM_NAME = "qemu-system-arm"
 QB_MACHINE = "-machine microbit"
 QB_CPU = "-cpu cortex-m0"
-QB_OPT_APPEND = "-nographic -vga none"
+QB_GRAPHICS = "-nographic -vga none"
 QB_RNG = ""
 
 # Zephyr RTOS settings
diff --git a/meta-arm/conf/machine/qemu-cortex-a53.conf b/meta-arm/conf/machine/qemu-cortex-a53.conf
index b97cde7e..7147face 100644
--- a/meta-arm/conf/machine/qemu-cortex-a53.conf
+++ b/meta-arm/conf/machine/qemu-cortex-a53.conf
@@ -11,7 +11,7 @@ TCLIBC = "newlib"
 QB_SYSTEM_NAME = "qemu-system-aarch64"
 QB_MACHINE = "-machine virt"
 QB_CPU = "-cpu cortex-a53"
-QB_OPT_APPEND = "-nographic -vga none"
+QB_GRAPHICS = "-nographic -vga none"
 
 # Zephyr RTOS settings
 ZEPHYR_BOARD = "qemu_cortex_a53"
-- 
2.17.1


