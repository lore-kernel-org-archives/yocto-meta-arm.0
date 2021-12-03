Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 955D3C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 12:29:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10856.1638534565473969567
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 03 Dec 2021 04:29:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20B8C1396;
	Fri,  3 Dec 2021 04:29:25 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.4.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F1F6A3F5A1;
	Fri,  3 Dec 2021 04:29:23 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Satish Kumar <satish.kumar01@arm.com>
Subject: [PATCH 08/11] arm-bsp/u-boot: patch to change kernel flash address
Date: Fri,  3 Dec 2021 12:28:58 +0000
Message-Id: <20211203122901.3549-9-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211203122901.3549-1-abdellatif.elkhlifi@arm.com>
References: <20211203122901.3549-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 03 Dec 2021 12:29:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2521

From: Satish Kumar <satish.kumar01@arm.com>

More space in the flash is reserved up front for metadata
parser and UEFI variables. That requires change in the flash
base address of where images are present.

Change-Id: I2d23d06099ffbf15458afaeb21c5dd4bcc4ffecb
Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
---
 ...nge-base-address-of-kernel-in-the-fl.patch | 47 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0031-corstone1000-change-base-address-of-kernel-in-the-fl.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0031-corstone1000-change-base-address-of-kernel-in-the-fl.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0031-corstone1000-change-base-address-of-kernel-in-the-fl.patch
new file mode 100644
index 0000000..c9bbab1
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0031-corstone1000-change-base-address-of-kernel-in-the-fl.patch
@@ -0,0 +1,47 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+
+From 1e76c4b70c8539c56b4b9ae6b8fd415d811a1812 Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Wed, 1 Dec 2021 19:04:59 +0000
+Subject: [PATCH] corstone1000: change base address of kernel in the flash
+
+More space in the flash is reserved up front for metadata
+parser and UEFI variables. That requires change in the flash
+base address of where images are present.
+
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+---
+ include/configs/corstone1000.h | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/include/configs/corstone1000.h b/include/configs/corstone1000.h
+index bb3b099806..baa0720fb5 100644
+--- a/include/configs/corstone1000.h
++++ b/include/configs/corstone1000.h
+@@ -94,16 +94,16 @@
+     func(USB, usb, 0)
+ #include <config_distro_bootcmd.h>
+ #define CONFIG_EXTRA_ENV_SETTINGS				\
+-                BOOTENV                         \
+-                "usb_pgood_delay=250\0"         \
++				BOOTENV                         \
++				"usb_pgood_delay=250\0"         \
+ 				"fdt_addr_r=0x82000000\0"		\
+-				"kernel_addr=0x08330000\0"		\
++				"kernel_addr=0x083EE000\0"		\
+ 				"kernel_addr_r=0x88200000\0"	\
+ 				"fdt_high=0xffffffff\0"
+-#define CONFIG_BOOTCOMMAND					            \
++#define CONFIG_BOOTCOMMAND					\
+ 				"echo Loading Kernel to memory ... ;"   \
+ 				"loadm $kernel_addr $kernel_addr_r 0xc00000;" \
+-                "usb start; usb reset;" \
+-                "run distro_bootcmd;" \
++				"usb start; usb reset;" \
++				"run distro_bootcmd;" \
+ 				"bootefi $kernel_addr_r $fdtcontroladdr;"
+ #endif
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 6d731bd..5caddc7 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -40,6 +40,7 @@ SRC_URI:append:corstone1000 = " \
       file://0028-arm-corstone1000-fix-unrecognized-filesystem-type-error.patch \
       file://0029-corstone1000-set-CONFIG_PSCI_RESET.patch \
       file://0030-arm-bsp-u-boot-corstone1000-Implement-autoboot-script.patch \
+      file://0031-corstone1000-change-base-address-of-kernel-in-the-fl.patch \
       "
 
 #
-- 
2.17.1


