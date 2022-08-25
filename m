Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58959ECAAD2
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 14:15:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.71142.1661782516909885075
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Aug 2022 07:15:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68C3723A
	for <meta-arm@lists.yoctoproject.org>; Mon, 29 Aug 2022 07:15:22 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2293B3F7B4
	for <meta-arm@lists.yoctoproject.org>; Mon, 29 Aug 2022 07:15:16 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/corstone1000: use compressed kernel image
Date: Thu, 25 Aug 2022 13:36:56 -0400
Message-Id: <20220825173656.10004-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Aug 2022 14:15:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3720

To fit the kernel image into the allotted space, a compressed kernel
image is now needed.  Use the Image.gz from the kernel build process
and change the relevant places to use the new image name.  This also
necessitates adding an unzip command to u-boot to uncompress it to
memory (and the loadm is still needed to setup the efi mem boot device).
Also, the unzipped image is larger than before.  So, increase the size
that loadm is copying.

This change shrinks the kernel image size from 7.8MB to 3.2MB

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../conf/machine/include/corstone1000.inc     |  2 +-
 ...corstone1000-use-a-compressed-kernel.patch | 32 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  1 +
 .../wic/corstone1000-image.corstone1000.wks   |  2 +-
 4 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-corstone1000-use-a-compressed-kernel.patch

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-arm-bsp/conf/machine/include/corstone1000.inc
index 081c8041..ec482229 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -46,7 +46,7 @@ EXTRA_IMAGEDEPENDS += "secure-partitions"
 # Linux kernel
 PREFERRED_PROVIDER_virtual/kernel:forcevariable = "linux-yocto"
 PREFERRED_VERSION_linux-yocto = "5.15%"
-KERNEL_IMAGETYPE = "Image"
+KERNEL_IMAGETYPE = "Image.gz"
 
 INITRAMFS_IMAGE_BUNDLE ?= "1"
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-corstone1000-use-a-compressed-kernel.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-corstone1000-use-a-compressed-kernel.patch
new file mode 100644
index 00000000..4cc2498b
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0025-corstone1000-use-a-compressed-kernel.patch
@@ -0,0 +1,32 @@
+From df70c467c5d100f1522b4521f48da4c51e43688c Mon Sep 17 00:00:00 2001
+From: Jon Mason <jon.mason@arm.com>
+Date: Thu, 25 Aug 2022 13:48:22 +0000
+Subject: [PATCH 25/25] corstone1000: use a compressed kernel
+
+The corstone1000 kernel has become too large to fit in the available
+storage.  Swtiching to a compressed kernel avoids the problem, but
+requires uncompressing it.  Add this decompression to the default boot
+instructions.
+
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+---
+ include/configs/corstone1000.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/include/configs/corstone1000.h b/include/configs/corstone1000.h
+index d9855bf91e..d0cbc40121 100644
+--- a/include/configs/corstone1000.h
++++ b/include/configs/corstone1000.h
+@@ -126,7 +126,8 @@
+ #define CONFIG_BOOTCOMMAND								\
+ 				"run retrieve_kernel_load_addr;"			\
+ 				"echo Loading kernel from $kernel_addr to memory ... ;"	\
+-				"loadm $kernel_addr $kernel_addr_r 0xc00000;"		\
++				"unzip $kernel_addr 0x90000000;"                        \
++				"loadm 0x90000000 $kernel_addr_r 0xd00000;"		\
+ 				"usb start; usb reset;"					\
+ 				"run distro_bootcmd;"					\
+ 				"bootefi $kernel_addr_r $fdtcontroladdr;"
+-- 
+2.30.2
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 0b965a1c..a0a72845 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -42,6 +42,7 @@ SRC_URI:append:corstone1000 = " \
         file://0022-efi_loader-send-bootcomplete-message-to-secure-encla.patch \
         file://0023-efi_loader-fix-null-pointer-exception-with-get_image.patch \
         file://0024-arm-corstone1000-add-mmc-for-fvp.patch \
+        file://0025-corstone1000-use-a-compressed-kernel.patch \
       "
 
 #
diff --git a/meta-arm-bsp/wic/corstone1000-image.corstone1000.wks b/meta-arm-bsp/wic/corstone1000-image.corstone1000.wks
index c58d7d68..76256797 100644
--- a/meta-arm-bsp/wic/corstone1000-image.corstone1000.wks
+++ b/meta-arm-bsp/wic/corstone1000-image.corstone1000.wks
@@ -12,4 +12,4 @@ part --source rawcopy --sourceparams="file=tfm_s_signed.bin" --align 1 --no-tabl
 part --source rawcopy --sourceparams="file=signed_fip-corstone1000.bin" --align 1 --no-table --fixed-size 2
 
 # Rawcopy of kernel with initramfs
-part --source rawcopy --sourceparams="file=Image-initramfs-${MACHINE}.bin" --no-table --fixed-size 12
+part --source rawcopy --sourceparams="file=Image.gz-initramfs-${MACHINE}.bin" --no-table --fixed-size 12
-- 
2.17.1


