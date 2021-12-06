Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1788EC433FE
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 13:25:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.51314.1638797141949845023
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Dec 2021 05:25:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AF5E6D;
	Mon,  6 Dec 2021 05:25:41 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.4.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 67D313F73D;
	Mon,  6 Dec 2021 05:25:40 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Satish Kumar <satish.kumar01@arm.com>
Subject: [PATCH][HONISTER 12/13] arm-bsp/u-boot: identify which bank to load
 kernel from
Date: Mon,  6 Dec 2021 13:25:12 +0000
Message-Id: <20211206132513.20172-13-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211206132513.20172-1-abdellatif.elkhlifi@arm.com>
References: <20211206132513.20172-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 06 Dec 2021 13:25:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2546

From: Satish Kumar <satish.kumar01@arm.com>

Secure enclave, based on the firmware update state of the
system, decides the boot bank. In this commit, u-boot
identifies the selected boot bank and loads the kernel
from it.

Change-Id: Ifcef126dc79c7808b30ef0319d83482d2d29fd13
Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
---
 ...0-identify-which-bank-to-load-kernel.patch | 66 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0032-arm-corstone1000-identify-which-bank-to-load-kernel.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0032-arm-corstone1000-identify-which-bank-to-load-kernel.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0032-arm-corstone1000-identify-which-bank-to-load-kernel.patch
new file mode 100644
index 0000000..80fc6d3
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0032-arm-corstone1000-identify-which-bank-to-load-kernel.patch
@@ -0,0 +1,66 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+
+From abc455d29aa9c983c6af2fa75870a7ee95da2496 Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Wed, 1 Dec 2021 19:17:57 +0000
+Subject: [PATCH] arm: corstone1000: identify which bank to load kernel from
+
+Secure enclave, based on the firmware update state of the
+system, decides the boot bank. In this commit, u-boot
+identifies the selected boot bank and loads the kernel
+from it.
+
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+---
+ configs/corstone1000_defconfig |  2 +-
+ include/configs/corstone1000.h | 18 ++++++++++++++----
+ 2 files changed, 15 insertions(+), 5 deletions(-)
+
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defconfig
+index 0b9ead461b..3c00e13ceb 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -29,7 +29,7 @@ CONFIG_CMD_BOOTEFI_HELLO=y
+ CONFIG_CMD_NVEDIT_EFI=y
+ # CONFIG_CMD_LOADS is not set
+ CONFIG_CMD_USB=y
+-# CONFIG_CMD_ITEST is not set
++CONFIG_CMD_ITEST=y
+ # CONFIG_CMD_SETEXPR is not set
+ CONFIG_CMD_DHCP=y
+ # CONFIG_CMD_NFS is not set
+diff --git a/include/configs/corstone1000.h b/include/configs/corstone1000.h
+index baa0720fb5..7c6f66c891 100644
+--- a/include/configs/corstone1000.h
++++ b/include/configs/corstone1000.h
+@@ -97,12 +97,22 @@
+ 				BOOTENV                         \
+ 				"usb_pgood_delay=250\0"         \
+ 				"fdt_addr_r=0x82000000\0"		\
+-				"kernel_addr=0x083EE000\0"		\
+-				"kernel_addr_r=0x88200000\0"	\
++				"boot_bank_flag=0x08002000\0"		\
++				"kernel_addr_bank_0=0x083EE000\0"			\
++				"kernel_addr_bank_1=0x0936E000\0"			\
++				"retrieve_kernel_load_addr="				\
++					"if itest.l *${boot_bank_flag} == 0; then "	\
++					    "setenv kernel_addr $kernel_addr_bank_0;"	\
++					"else "						\
++					    "setenv kernel_addr $kernel_addr_bank_1;"	\
++					"fi;"						\
++					"\0"							\
++				"kernel_addr_r=0x88200000\0"				\
+ 				"fdt_high=0xffffffff\0"
+ #define CONFIG_BOOTCOMMAND					\
+-				"echo Loading Kernel to memory ... ;"   \
+-				"loadm $kernel_addr $kernel_addr_r 0xc00000;" \
++				"run retrieve_kernel_load_addr;" \
++				"echo Loading kernel from $kernel_addr to memory ... ;" \
++				"loadm $kernel_addr $kernel_addr_r 0xc00000;"		\
+ 				"usb start; usb reset;" \
+ 				"run distro_bootcmd;" \
+ 				"bootefi $kernel_addr_r $fdtcontroladdr;"
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 9e9fc48..dc54fdf 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -43,6 +43,7 @@ SRC_URI:append:corstone1000 = " \
       file://0029-corstone1000-set-CONFIG_PSCI_RESET.patch \
       file://0030-arm-bsp-u-boot-corstone1000-Implement-autoboot-script.patch \
       file://0031-corstone1000-change-base-address-of-kernel-in-the-fl.patch \
+      file://0032-arm-corstone1000-identify-which-bank-to-load-kernel.patch \
       "
 
 #
-- 
2.17.1


