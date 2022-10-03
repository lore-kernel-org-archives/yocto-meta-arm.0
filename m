Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E16CC4332F
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 13:01:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.64.1664802067834505393
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Oct 2022 06:01:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E23616F8;
	Mon,  3 Oct 2022 06:01:14 -0700 (PDT)
Received: from e121910.arm.com (unknown [10.57.65.67])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1671F3F73B;
	Mon,  3 Oct 2022 06:01:05 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Vishnu.Banavath@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 01/12] arm-bsp/u-boot: corstone1000: update initramfs bundle
 size
Date: Mon,  3 Oct 2022 14:00:40 +0100
Message-Id: <20221003130051.28934-2-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221003130051.28934-1-abdellatif.elkhlifi@arm.com>
References: <20221003130051.28934-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 03 Oct 2022 13:01:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3895

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

increase the size of the initramfs bundle used in the boot command

The new trusted services support increases the rootfs size.
When decompressed the initramfs bundle size is around 15M.

u-boot boot command needs to be updated with this size to be able to load
all the initramfs bundle.

When compressed the initramfs bundle size is around 5.4M
(Image.gz-initramfs--5.15.59)

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 ...-corstone1000-use-a-compressed-kernel.patch | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-corstone1000-use-a-compressed-kernel.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-corstone1000-use-a-compressed-kernel.patch
index 4cc2498b..59000cd5 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-corstone1000-use-a-compressed-kernel.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-corstone1000-use-a-compressed-kernel.patch
@@ -1,7 +1,7 @@
-From df70c467c5d100f1522b4521f48da4c51e43688c Mon Sep 17 00:00:00 2001
+From 26c8a8528b794dbaba49bcf3e1bae8a1e15a8448 Mon Sep 17 00:00:00 2001
 From: Jon Mason <jon.mason@arm.com>
-Date: Thu, 25 Aug 2022 13:48:22 +0000
-Subject: [PATCH 25/25] corstone1000: use a compressed kernel
+Date: Thu, 25 Aug 2022 11:21:28 +0100
+Subject: [PATCH] corstone1000: add compressed kernel support
 
 The corstone1000 kernel has become too large to fit in the available
 storage.  Swtiching to a compressed kernel avoids the problem, but
@@ -9,24 +9,26 @@ requires uncompressing it.  Add this decompression to the default boot
 instructions.
 
 Signed-off-by: Jon Mason <jon.mason@arm.com>
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
 ---
  include/configs/corstone1000.h | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/include/configs/corstone1000.h b/include/configs/corstone1000.h
-index d9855bf91e..d0cbc40121 100644
+index 815239590e..a8aa105fe6 100644
 --- a/include/configs/corstone1000.h
 +++ b/include/configs/corstone1000.h
-@@ -126,7 +126,8 @@
+@@ -120,7 +120,8 @@
  #define CONFIG_BOOTCOMMAND								\
  				"run retrieve_kernel_load_addr;"			\
  				"echo Loading kernel from $kernel_addr to memory ... ;"	\
 -				"loadm $kernel_addr $kernel_addr_r 0xc00000;"		\
-+				"unzip $kernel_addr 0x90000000;"                        \
-+				"loadm 0x90000000 $kernel_addr_r 0xd00000;"		\
++				"unzip $kernel_addr 0x90000000;"	\
++				"loadm 0x90000000 $kernel_addr_r 0xf00000;"		\
  				"usb start; usb reset;"					\
  				"run distro_bootcmd;"					\
  				"bootefi $kernel_addr_r $fdtcontroladdr;"
 -- 
-2.30.2
+2.17.1
 
-- 
2.17.1


