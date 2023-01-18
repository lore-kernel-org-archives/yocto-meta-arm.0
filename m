Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D156C46467
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 15:55:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.19166.1674057297011397438
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 Jan 2023 07:54:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2343AD7
	for <meta-arm@lists.yoctoproject.org>; Wed, 18 Jan 2023 07:55:38 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 85F0E3F67D
	for <meta-arm@lists.yoctoproject.org>; Wed, 18 Jan 2023 07:54:56 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH kirkstone 1/2] arm-bsp/juno: move to compressed initramfs image
Date: Wed, 18 Jan 2023 10:54:51 -0500
Message-Id: <20230118155452.592-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 Jan 2023 15:55:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4298

Change u-boot and machine config to default to booting a compressed
initramfs.  This allows for easier testing.  A compressed image is
needed as the image is too big for the storage, and the error notifying
of such is vague.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/juno.conf           |  7 +++--
 .../recipes-bsp/images/firmware-image-juno.bb |  2 +-
 ...-modify-to-boot-compressed-initramfs.patch | 27 +++++++++++++++++++
 .../u-boot/u-boot_2020.07.bbappend            |  5 +++-
 4 files changed, 37 insertions(+), 4 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/juno/0002-configs-vexpress-modify-to-boot-compressed-initramfs.patch

diff --git a/meta-arm-bsp/conf/machine/juno.conf b/meta-arm-bsp/conf/machine/juno.conf
index fbff8001..69129335 100644
--- a/meta-arm-bsp/conf/machine/juno.conf
+++ b/meta-arm-bsp/conf/machine/juno.conf
@@ -10,10 +10,10 @@ require conf/machine/include/arm/arch-armv8a.inc
 
 MACHINE_FEATURES = "usbhost usbgadget alsa screen wifi bluetooth optee pci"
 
-KERNEL_IMAGETYPE = "Image"
+KERNEL_IMAGETYPE = "Image.gz"
 KERNEL_DEVICETREE = "arm/juno.dtb arm/juno-r1.dtb arm/juno-r2.dtb"
 
-IMAGE_FSTYPES += "tar.bz2 ext4"
+IMAGE_FSTYPES += "tar.bz2 ext4 cpio.gz"
 
 SERIAL_CONSOLES = "115200;ttyAMA0"
 
@@ -25,3 +25,6 @@ EXTRA_IMAGEDEPENDS += "trusted-firmware-a virtual/bootloader firmware-image-juno
 
 # Juno u-boot configuration
 UBOOT_MACHINE = "vexpress_aemv8a_juno_defconfig"
+
+INITRAMFS_IMAGE_BUNDLE ?= "1"
+INITRAMFS_IMAGE = "core-image-minimal"
diff --git a/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb b/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb
index 80565af6..473d28cc 100644
--- a/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb
+++ b/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb
@@ -63,7 +63,7 @@ do_deploy() {
     done
 
     if [ "${INITRAMFS_IMAGE_BUNDLE}" -eq 1 ]; then
-        cp -L -f ${DEPLOY_DIR_IMAGE}/Image-initramfs-juno.bin \
+        cp -L -f ${DEPLOY_DIR_IMAGE}/Image.gz-initramfs-juno.bin \
             ${D}/${UNPACK_DIR}/SOFTWARE/Image
     else
         cp -L -f ${DEPLOY_DIR_IMAGE}/Image ${D}/${UNPACK_DIR}/SOFTWARE/
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/juno/0002-configs-vexpress-modify-to-boot-compressed-initramfs.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/juno/0002-configs-vexpress-modify-to-boot-compressed-initramfs.patch
new file mode 100644
index 00000000..fa008af5
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/juno/0002-configs-vexpress-modify-to-boot-compressed-initramfs.patch
@@ -0,0 +1,27 @@
+From 097a43223da4fa42335944295903ede2755e2dfd Mon Sep 17 00:00:00 2001
+From: Jon Mason <jdmason@kudzu.us>
+Date: Mon, 19 Dec 2022 11:36:04 -0500
+Subject: [PATCH] configs: vexpress: modify to boot compressed initramfs
+
+Signed-off-by: Jon Mason <jdmason@kudzu.us>
+Upstream-Status: Inappropriate
+---
+ include/configs/vexpress_aemv8a.h       | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/include/configs/vexpress_aemv8.h b/include/configs/vexpress_aemv8a.h
+index cd7f6c1b9ba0..c2f5eb302076 100644
+--- a/include/configs/vexpress_aemv8a.h
++++ b/include/configs/vexpress_aemv8a.h
+@@ -164,6 +164,8 @@
+ 				"kernel_name=norkern\0"	\
+ 				"kernel_alt_name=Image\0"	\
+ 				"kernel_addr_r=0x80080000\0" \
++				"kernel_comp_addr_r=0x90000000\0" \
++				"kernel_comp_size=0x3000000\0" \
+ 				"initrd_name=ramdisk.img\0"	\
+ 				"initrd_addr_r=0x88000000\0"	\
+ 				"fdtfile=board.dtb\0" \
+-- 
+2.30.2
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend
index 980e5248..3488862d 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend
@@ -6,4 +6,7 @@ FILESEXTRAPATHS:prepend = "${THIS_DIR}/${BP}:"
 #
 # Juno KMACHINE
 #
-SRC_URI:append:juno = " file://u-boot_vexpress_uenv.patch"
+SRC_URI:append:juno = " \
+    file://u-boot_vexpress_uenv.patch \
+    file://0002-configs-vexpress-modify-to-boot-compressed-initramfs.patch \
+    "
-- 
2.17.1


