Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A71B5C38159
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 15:54:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.19245.1674057253088837405
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 Jan 2023 07:54:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D903EAD7
	for <meta-arm@lists.yoctoproject.org>; Wed, 18 Jan 2023 07:54:54 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8A7F63F67D
	for <meta-arm@lists.yoctoproject.org>; Wed, 18 Jan 2023 07:54:12 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm-bsp/juno: move to compressed initramfs image
Date: Wed, 18 Jan 2023 10:54:05 -0500
Message-Id: <20230118155406.30116-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 Jan 2023 15:54:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4296

Change u-boot and machine config to default to booting a compressed
initramfs.  This allows for easier testing.  A compressed image is
needed as the image is too big for the storage, and the error notifying
of such is vague.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/juno.conf           |  7 +++-
 .../recipes-bsp/images/firmware-image-juno.bb |  2 +-
 ...-modify-to-boot-compressed-initramfs.patch | 41 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  4 +-
 4 files changed, 50 insertions(+), 4 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/juno/0002-configs-vexpress-modify-to-boot-compressed-initramfs.patch

diff --git a/meta-arm-bsp/conf/machine/juno.conf b/meta-arm-bsp/conf/machine/juno.conf
index c002ed63..4a86d4e2 100644
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
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/juno/0002-configs-vexpress-modify-to-boot-compressed-initramfs.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/juno/0002-configs-vexpress-modify-to-boot-compressed-initramfs.patch
new file mode 100644
index 00000000..2bf68fe6
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/juno/0002-configs-vexpress-modify-to-boot-compressed-initramfs.patch
@@ -0,0 +1,41 @@
+From 097a43223da4fa42335944295903ede2755e2dfd Mon Sep 17 00:00:00 2001
+From: Jon Mason <jdmason@kudzu.us>
+Date: Mon, 19 Dec 2022 11:36:04 -0500
+Subject: [PATCH] configs: vexpress: modify to boot compressed initramfs
+
+Signed-off-by: Jon Mason <jdmason@kudzu.us>
+Upstream-Status: Inappropriate
+
+---
+ configs/vexpress_aemv8a_juno_defconfig | 1 +
+ include/configs/vexpress_aemv8.h       | 2 ++
+ 2 files changed, 3 insertions(+)
+
+diff --git a/configs/vexpress_aemv8a_juno_defconfig b/configs/vexpress_aemv8a_juno_defconfig
+index e02124cc7f54..6ffe8f5fe67e 100644
+--- a/configs/vexpress_aemv8a_juno_defconfig
++++ b/configs/vexpress_aemv8a_juno_defconfig
+@@ -16,6 +16,7 @@ CONFIG_SYS_LOAD_ADDR=0x90000000
+ CONFIG_BOOTDELAY=1
+ CONFIG_USE_BOOTARGS=y
+ CONFIG_BOOTARGS="console=ttyAMA0,115200n8 root=/dev/sda2 rw rootwait earlycon=pl011,0x7ff80000 debug user_debug=31 androidboot.hardware=juno loglevel=9"
++CONFIG_BOOTCOMMAND="echo running default boot command; afs load ${kernel_name} ${kernel_addr_r} ; if test $? -eq 1; then   echo Loading ${kernel_alt_name} instead of ${kernel_name};   afs load ${kernel_alt_name} ${kernel_addr_r};fi ; afs load  ${fdtfile} ${fdt_addr_r} ; if test $? -eq 1; then   echo Loading ${fdt_alt_name} instead of ${fdtfile};   afs load ${fdt_alt_name} ${fdt_addr_r}; fi ; fdt addr ${fdt_addr_r}; fdt resize; if afs load  ${initrd_name} ${initrd_addr_r} ; then   setenv initrd_param ${initrd_addr_r};   else setenv initrd_param -; fi ; booti ${kernel_addr_r} ${initrd_param} ${fdt_addr_r}"
+ # CONFIG_DISPLAY_CPUINFO is not set
+ # CONFIG_DISPLAY_BOARDINFO is not set
+ CONFIG_SYS_PROMPT="VExpress64# "
+diff --git a/include/configs/vexpress_aemv8.h b/include/configs/vexpress_aemv8.h
+index cd7f6c1b9ba0..c2f5eb302076 100644
+--- a/include/configs/vexpress_aemv8.h
++++ b/include/configs/vexpress_aemv8.h
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
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 5e46f487..f26ab4a6 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -77,7 +77,9 @@ SRC_URI:append:fvp-baser-aemv8r64 = " \
 #
 # Juno Machines
 #
-SRC_URI:append:juno = " file://0001-arm-juno-add-custom-bootcmd-to-autoboot-from-uEnv.tx.patch"
+SRC_URI:append:juno = " file://0001-arm-juno-add-custom-bootcmd-to-autoboot-from-uEnv.tx.patch \
+                        file://0002-configs-vexpress-modify-to-boot-compressed-initramfs.patch \
+                      "
 
 
 #
-- 
2.17.1


