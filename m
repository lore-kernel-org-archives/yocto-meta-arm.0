Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D85BCC4321E
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 09:16:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.5849.1666170971722911228
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Oct 2022 02:16:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 806B71063;
	Wed, 19 Oct 2022 02:16:17 -0700 (PDT)
Received: from e121910.arm.com (unknown [10.57.5.203])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 89DC03F7D8;
	Wed, 19 Oct 2022 02:16:09 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Vishnu.Banavath@arm.com,
	Devaraj.Ranganna@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Jon Mason <jon.mason@arm.com>
Subject: [PATCH kirkstone 1/2] arm-bsp/corstone1000: use compressed kernel image
Date: Wed, 19 Oct 2022 10:15:56 +0100
Message-Id: <20221019091557.3949-2-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221019091557.3949-1-abdellatif.elkhlifi@arm.com>
References: <20221019091557.3949-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Oct 2022 09:16:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3981

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

To fit the kernel image into the allotted space, a compressed kernel
image is now needed.  Use the Image.gz from the kernel build process
and change the relevant places to use the new image name.  This also
necessitates adding an unzip command to u-boot to uncompress it to
memory (and the loadm is still needed to setup the efi mem boot device).
Also, the unzipped image is larger than before.  So, increase the size
that loadm is copying.

This change shrinks the initramfs bundle size from 12MB to 4.8MB

Signed-off-by: Jon Mason <jon.mason@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../conf/machine/include/corstone1000.inc     |  2 +-
 ...corstone1000-use-a-compressed-kernel.patch | 35 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  1 +
 .../wic/corstone1000-image.corstone1000.wks   |  2 +-
 4 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-corstone1000-use-a-compressed-kernel.patch

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-arm-bsp/conf/machine/include/corstone1000.inc
index 28b348b9..3053c1c2 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -48,7 +48,7 @@ EXTRA_IMAGEDEPENDS += "secure-partitions"
 # Linux kernel
 PREFERRED_PROVIDER_virtual/kernel:forcevariable = "linux-yocto"
 PREFERRED_VERSION_linux-yocto = "5.15%"
-KERNEL_IMAGETYPE = "Image"
+KERNEL_IMAGETYPE = "Image.gz"
 
 INITRAMFS_IMAGE_BUNDLE ?= "1"
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-corstone1000-use-a-compressed-kernel.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-corstone1000-use-a-compressed-kernel.patch
new file mode 100644
index 00000000..77f2e26b
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0028-corstone1000-use-a-compressed-kernel.patch
@@ -0,0 +1,35 @@
+From 348cdb4bab63ad0a6b373396ad522f1bcc2d6bdb Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Mon, 17 Oct 2022 15:41:20 +0100
+Subject: [PATCH] corstone1000: use a compressed kernel
+
+The corstone1000 kernel has become too large to fit in the available
+storage.  Swtiching to a compressed kernel avoids the problem, but
+requires uncompressing it.  Add this decompression to the default boot
+instructions.
+
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+
+---
+ include/configs/corstone1000.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/include/configs/corstone1000.h b/include/configs/corstone1000.h
+index d9855bf91e..a66e3a8c10 100644
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
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 75d086b1..b47303d9 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -44,6 +44,7 @@ SRC_URI:append:corstone1000 = " \
         file://0025-efi_loader-send-bootcomplete-message-to-secure-encla.patch \
         file://0026-efi_loader-fix-null-pointer-exception-with-get_image.patch \
         file://0027-arm-corstone1000-add-mmc-for-fvp.patch \
+        file://0028-corstone1000-use-a-compressed-kernel.patch \
       "
 
 #
diff --git a/meta-arm-bsp/wic/corstone1000-image.corstone1000.wks b/meta-arm-bsp/wic/corstone1000-image.corstone1000.wks
index c58d7d68..238b497b 100644
--- a/meta-arm-bsp/wic/corstone1000-image.corstone1000.wks
+++ b/meta-arm-bsp/wic/corstone1000-image.corstone1000.wks
@@ -12,4 +12,4 @@ part --source rawcopy --sourceparams="file=tfm_s_signed.bin" --align 1 --no-tabl
 part --source rawcopy --sourceparams="file=signed_fip-corstone1000.bin" --align 1 --no-table --fixed-size 2
 
 # Rawcopy of kernel with initramfs
-part --source rawcopy --sourceparams="file=Image-initramfs-${MACHINE}.bin" --no-table --fixed-size 12
+part --source rawcopy --sourceparams="file=Image.gz-initramfs-${MACHINE}.bin" --no-table --fixed-size 12
\ No newline at end of file
-- 
2.17.1


