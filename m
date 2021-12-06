Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1571BC433F5
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 13:25:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.51315.1638797133999124591
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Dec 2021 05:25:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 749026D;
	Mon,  6 Dec 2021 05:25:33 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.4.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3922D3F73D;
	Mon,  6 Dec 2021 05:25:32 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH][HONISTER 07/13] arm-bsp/u-boot: corstone1000: Implement
 autoboot storage device selection
Date: Mon,  6 Dec 2021 13:25:07 +0000
Message-Id: <20211206132513.20172-8-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211206132513.20172-1-abdellatif.elkhlifi@arm.com>
References: <20211206132513.20172-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 06 Dec 2021 13:25:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2541

From: Emekcan Aras <Emekcan.Aras@arm.com>

This commit implements distro_bootcmd in config_bootcommand in u-boot.
This command traverses all the USB devices connected to the board and
finds a usb device that has bootable image to boot from it. If it cannot
find a usb device with the bootable image, it will boot the system using
the existing flash.

Change-Id: Ia05ca02d6f490a1b51fcf377afcc86ea0ed4e19c
Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 ...rstone1000-Implement-autoboot-script.patch | 64 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-arm-bsp-u-boot-corstone1000-Implement-autoboot-script.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-arm-bsp-u-boot-corstone1000-Implement-autoboot-script.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-arm-bsp-u-boot-corstone1000-Implement-autoboot-script.patch
new file mode 100644
index 0000000..ee25dec
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0030-arm-bsp-u-boot-corstone1000-Implement-autoboot-script.patch
@@ -0,0 +1,64 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+
+From e51542907203c46bdbbd78aa1c76058204fd75f1 Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <Emekcan.Aras@arm.com>
+Date: Thu, 25 Nov 2021 16:54:57 +0000
+Subject: [PATCH] arm-bsp/u-boot: corstone1000: Implement autoboot
+ storage device selection
+
+This commit implements distro_bootcmd in config_bootcommand in u-boot.
+This command traverses all the USB devices connected to the board and
+finds a usb device that has bootable image to boot from it. If it cannot
+find a usb device with the bootable image, it will boot the system using
+the existing flash.
+
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+---
+ configs/corstone1000_defconfig |  2 +-
+ include/configs/corstone1000.h | 15 ++++++++++-----
+ 2 files changed, 11 insertions(+), 6 deletions(-)
+
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defconfig
+index 10b7c3ea18..0b9ead461b 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -66,4 +66,4 @@ CONFIG_EFI_GET_TIME=y
+ CONFIG_EFI_SET_TIME=y
+ CONFIG_RTC_EMULATION=y
+ CONFIG_PSCI_RESET=y
+-
++CONFIG_DISTRO_DEFAULTS=y
+diff --git a/include/configs/corstone1000.h b/include/configs/corstone1000.h
+index b0932f9f33..d029059a81 100644
+--- a/include/configs/corstone1000.h
++++ b/include/configs/corstone1000.h
+@@ -85,15 +85,20 @@
+ #define CONFIG_SYS_CBSIZE		512	/* Console I/O Buffer Size */
+ #define CONFIG_SYS_MAXARGS		64	/* max command args */
+ 
+-#define CONFIG_EXTRA_ENV_SETTINGS					\
++#define BOOT_TARGET_DEVICES(func) \
++    func(USB, usb, 0)
++#include <config_distro_bootcmd.h>
++#define CONFIG_EXTRA_ENV_SETTINGS				\
++                BOOTENV                         \
+                 "usb_pgood_delay=250\0"         \
+ 				"fdt_addr_r=0x82000000\0"		\
+ 				"kernel_addr=0x08330000\0"		\
+-				"kernel_addr_r=0x82100000\0"		\
++				"kernel_addr_r=0x88200000\0"	\
+ 				"fdt_high=0xffffffff\0"
+-
+-#define CONFIG_BOOTCOMMAND					\
+-				"echo Loading Kernel to memory ... ;" \
++#define CONFIG_BOOTCOMMAND					            \
++				"echo Loading Kernel to memory ... ;"   \
+ 				"loadm $kernel_addr $kernel_addr_r 0xc00000;" \
++                "usb start; usb reset;" \
++                "run distro_bootcmd;" \
+ 				"bootefi $kernel_addr_r $fdtcontroladdr;"
+ #endif
+-- 
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 8ce19ba..e97ddc7 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -41,6 +41,7 @@ SRC_URI:append:corstone1000 = " \
       file://0027-corstone1000-Make-sure-shared-buffer-contents-are-no.patch \
       file://0028-arm-corstone1000-fix-unrecognized-filesystem-type-error.patch \
       file://0029-corstone1000-set-CONFIG_PSCI_RESET.patch \
+      file://0030-arm-bsp-u-boot-corstone1000-Implement-autoboot-script.patch \
       "
 
 #
-- 
2.17.1


