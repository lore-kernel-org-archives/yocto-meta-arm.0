Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C626C433F5
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 13:01:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.56.1664802084733132177
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Oct 2022 06:01:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2580D16F8;
	Mon,  3 Oct 2022 06:01:31 -0700 (PDT)
Received: from e121910.arm.com (unknown [10.57.65.67])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 338E43F73B;
	Mon,  3 Oct 2022 06:01:23 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Vishnu.Banavath@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 10/12] arm-bsp/linux: corstone1000: use arm-ffa machine
 feature
Date: Mon,  3 Oct 2022 14:00:49 +0100
Message-Id: <20221003130051.28934-11-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221003130051.28934-1-abdellatif.elkhlifi@arm.com>
References: <20221003130051.28934-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 03 Oct 2022 13:01:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3904

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

add arm-ffa machine feature which applies FF-A config fragment and kernel patch

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 meta-arm-bsp/conf/machine/include/corstone1000.inc             | 3 +++
 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig | 1 -
 meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc      | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-arm-bsp/conf/machine/include/corstone1000.inc
index 46361bba..4334a5a8 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -57,6 +57,9 @@ INITRAMFS_IMAGE_BUNDLE ?= "1"
 #telling the build system which image is responsible of the generation of the initramfs rootfs
 INITRAMFS_IMAGE = "corstone1000-initramfs-image"
 
+# add FF-A support in the kernel
+MACHINE_FEATURES += "arm-ffa"
+
 # prevent the kernel image from being included in the intramfs rootfs
 PACKAGE_EXCLUDE = "kernel-image-*"
 
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig
index 0cdd3fa4..3fe7a038 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig
@@ -10,7 +10,6 @@ CONFIG_ARCH_VEXPRESS=y
 CONFIG_CMDLINE="console=ttyAMA0 loglevel=9"
 CONFIG_EFI=y
 # CONFIG_SUSPEND is not set
-CONFIG_ARM_FFA_TRANSPORT=y
 CONFIG_EFI_BOOTLOADER_CONTROL=y
 CONFIG_EFI_CAPSULE_LOADER=y
 CONFIG_EFI_TEST=y
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 4a6cc438..0d1017ac 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -32,6 +32,7 @@ KCONFIG_MODE:corstone500 = "--alldefconfig"
 # Corstone1000 KMACHINE
 #
 FILESEXTRAPATHS:prepend:corstone1000 := "${ARMBSPFILESPATHS}"
+FILESEXTRAPATHS:prepend:corstone1000 := "${ARMFILESPATHS}"
 COMPATIBLE_MACHINE:corstone1000 = "${MACHINE}"
 KCONFIG_MODE:corstone1000 = "--alldefconfig"
 KMACHINE:corstone1000 = "corstone1000"
-- 
2.17.1


