Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C650CCA47E
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 17:15:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.8844.1655226920053994128
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jun 2022 10:15:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32E061758
	for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jun 2022 10:15:19 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7EABB3F66F
	for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jun 2022 10:15:18 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/6] arm-bsp/juno: Update to u-boot v2022.04
Date: Tue, 14 Jun 2022 13:15:09 -0400
Message-Id: <20220614171514.32495-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Jun 2022 17:15:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3492

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/juno.conf           |  2 +-
 .../juno/u-boot_vexpress_uenv.patch           | 80 -------------------
 ...tom-bootcmd-to-autoboot-from-uEnv.tx.patch | 50 ++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  7 ++
 .../recipes-bsp/u-boot/u-boot_2020.07.bb      | 26 ------
 .../u-boot/u-boot_2020.07.bbappend            |  9 ---
 6 files changed, 58 insertions(+), 116 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/juno/u-boot_vexpress_uenv.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/juno/0001-arm-juno-add-custom-bootcmd-to-autoboot-from-uEnv.tx.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bb
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend

diff --git a/meta-arm-bsp/conf/machine/juno.conf b/meta-arm-bsp/conf/machine/juno.conf
index fbff8001..c002ed63 100644
--- a/meta-arm-bsp/conf/machine/juno.conf
+++ b/meta-arm-bsp/conf/machine/juno.conf
@@ -18,7 +18,7 @@ IMAGE_FSTYPES += "tar.bz2 ext4"
 SERIAL_CONSOLES = "115200;ttyAMA0"
 
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
-PREFERRED_VERSION_u-boot ?= "2020.07"
+PREFERRED_VERSION_u-boot ?= "2022.04"
 PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot"
 
 EXTRA_IMAGEDEPENDS += "trusted-firmware-a virtual/bootloader firmware-image-juno"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/juno/u-boot_vexpress_uenv.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/juno/u-boot_vexpress_uenv.patch
deleted file mode 100644
index 68433ed9..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/juno/u-boot_vexpress_uenv.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From 5372743bab931e0f31e37c3767077abd504eca2b Mon Sep 17 00:00:00 2001
-From: Damodar Santhapuri <damodar.santhapuri@arm.com>
-Date: Thu, 5 Nov 2020 22:40:48 +0530
-Subject: [PATCH] arm: juno: add custom bootcmd to autoboot from uEnv.txt file
-
-enable autoboot support with custom bootcmd loads uEnv.txt
-from NOR to DRAM and import.
-
-Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
-Upstream-Status: Pending
----
- include/configs/vexpress_aemv8a.h | 40 ++++++++++++++++++++++++++-----
- 1 file changed, 34 insertions(+), 6 deletions(-)
-
-diff --git a/include/configs/vexpress_aemv8a.h b/include/configs/vexpress_aemv8a.h
-index 09cdd3dab5..9c9f8dfd16 100644
---- a/include/configs/vexpress_aemv8a.h
-+++ b/include/configs/vexpress_aemv8a.h
-@@ -131,11 +131,39 @@
- 				"kernel_name=norkern\0"	\
- 				"kernel_alt_name=Image\0"	\
- 				"kernel_addr_r=0x80080000\0" \
--				"ramdisk_name=ramdisk.img\0"	\
--				"ramdisk_addr_r=0x88000000\0"	\
-+				"initrd_name=ramdisk.img\0"	\
-+				"initrd_addr_r=0x88000000\0"	\
- 				"fdtfile=board.dtb\0" \
- 				"fdt_alt_name=juno\0" \
- 				"fdt_addr_r=0x80000000\0" \
-+				"fdt_high=0xffffffffffffffff\0" \
-+				"initrd_high=0xffffffffffffffff\0" \
-+                                "bootenvfile=uEnv.txt\0" \
-+                                "bootcmd=run envboot\0" \
-+                                "envboot=if run loadbootenv; then echo Loading env from ${bootenvfile}; run importbootenv; else run default_bootcmd; fi; if test -n $uenvcmd; then echo Running uenvcmd ...; run uenvcmd;fi;\0" \
-+                                "importbootenv=echo Importing environment from memory, size ${filesize}; env import -t ${loadaddr} ${filesize}\0" \
-+                                "loadaddr=0x84000000\0" \
-+                                "filesize=0x4000\0" \
-+                                "loadbootenv=mw.l ${loadaddr} 0 0x1000; afs load ${bootenvfile} ${loadaddr}\0" \
-+                                "default_bootcmd=echo running default boot command; afs load ${kernel_name} ${kernel_addr_r} ; " \
-+                                                "if test $? -eq 1; then "\
-+                                                "  echo Loading ${kernel_alt_name} instead of "\
-+                                                "${kernel_name}; "\
-+                                                "  afs load ${kernel_alt_name} ${kernel_addr_r};"\
-+                                                "fi ; "\
-+		                                "afs load  ${fdtfile} ${fdt_addr_r} ; " \
-+                                                "if test $? -eq 1; then "\
-+                                                "  echo Loading ${fdt_alt_name} instead of "\
-+                                                "${fdtfile}; "\
-+		                                "  afs load ${fdt_alt_name} ${fdt_addr_r}; "\
-+		                                "fi ; "\
-+                                                "fdt addr ${fdt_addr_r}; fdt resize; " \
-+		                                "if afs load  ${initrd_name} ${initrd_addr_r} ; "\
-+		                                "then "\
-+		                                "  setenv initrd_param ${initrd_addr_r}; "\
-+		                                "  else setenv initrd_param -; "\
-+		                                "fi ; " \
-+		                                "booti ${kernel_addr_r} ${initrd_param} ${fdt_addr_r}\0"
- 
- /* Copy the kernel and FDT to DRAM memory and boot */
- #define CONFIG_BOOTCOMMAND	"afs load ${kernel_name} ${kernel_addr_r} ;"\
-@@ -151,12 +179,12 @@
- 				"  afs load ${fdt_alt_name} ${fdt_addr_r}; "\
- 				"fi ; "\
- 				"fdt addr ${fdt_addr_r}; fdt resize; " \
--				"if afs load  ${ramdisk_name} ${ramdisk_addr_r} ; "\
-+				"if afs load  ${initrd_name} ${initrd_addr_r} ; "\
- 				"then "\
--				"  setenv ramdisk_param ${ramdisk_addr_r}; "\
--				"  else setenv ramdisk_param -; "\
-+				"  setenv initrd_param ${initrd_addr_r}; "\
-+				"  else setenv initrd_param -; "\
- 				"fi ; " \
--				"booti ${kernel_addr_r} ${ramdisk_param} ${fdt_addr_r}"
-+				"booti ${kernel_addr_r} ${initrd_param} ${fdt_addr_r}"
- 
- 
- #elif CONFIG_TARGET_VEXPRESS64_BASE_FVP
--- 
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/juno/0001-arm-juno-add-custom-bootcmd-to-autoboot-from-uEnv.tx.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/juno/0001-arm-juno-add-custom-bootcmd-to-autoboot-from-uEnv.tx.patch
new file mode 100644
index 00000000..a6838390
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/juno/0001-arm-juno-add-custom-bootcmd-to-autoboot-from-uEnv.tx.patch
@@ -0,0 +1,50 @@
+From 13dde05efae99c5261ed213108087d0f7ac9581e Mon Sep 17 00:00:00 2001
+From: Damodar Santhapuri <damodar.santhapuri@arm.com>
+Date: Thu, 5 Nov 2020 22:40:48 +0530
+Subject: [PATCH] arm: juno: add custom bootcmd to autoboot from uEnv.txt file
+
+enable autoboot support with custom bootcmd loads uEnv.txt
+from NOR to DRAM and import.
+
+Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
+Upstream-Status: Pending
+---
+ include/configs/vexpress_aemv8.h | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/include/configs/vexpress_aemv8.h b/include/configs/vexpress_aemv8.h
+index f0c5ceb3849a..cd7f6c1b9ba0 100644
+--- a/include/configs/vexpress_aemv8.h
++++ b/include/configs/vexpress_aemv8.h
+@@ -137,13 +137,13 @@
+ 		"  afs load ${fdt_alt_name} ${fdt_addr_r}; "\
+ 		"fi ; "\
+ 		"fdt addr ${fdt_addr_r}; fdt resize; " \
+-		"if afs load  ${ramdisk_name} ${ramdisk_addr_r} ; "\
++		"if afs load  ${initrd_name} ${initrd_addr_r} ; "\
+ 		"then "\
+-		"  setenv ramdisk_param ${ramdisk_addr_r}; "\
++		"  setenv initrd_param ${initrd_addr_r}; "\
+ 		"else "\
+-		"  setenv ramdisk_param -; "\
++		"  setenv initrd_param -; "\
+ 		"fi ; " \
+-		"booti ${kernel_addr_r} ${ramdisk_param} ${fdt_addr_r}\0"
++		"booti ${kernel_addr_r} ${initrd_param} ${fdt_addr_r}"
+ #define BOOTENV_DEV_NAME_AFS(devtypeu, devtypel, instance) "afs "
+ 
+ #define BOOT_TARGET_DEVICES(func)	\
+@@ -164,8 +164,8 @@
+ 				"kernel_name=norkern\0"	\
+ 				"kernel_alt_name=Image\0"	\
+ 				"kernel_addr_r=0x80080000\0" \
+-				"ramdisk_name=ramdisk.img\0"	\
+-				"ramdisk_addr_r=0x88000000\0"	\
++				"initrd_name=ramdisk.img\0"	\
++				"initrd_addr_r=0x88000000\0"	\
+ 				"fdtfile=board.dtb\0" \
+ 				"fdt_alt_name=juno\0" \
+ 				"fdt_addr_r=0x80000000\0" \
+-- 
+2.30.2
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 3de0d7c3..a9baaa0f 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -72,6 +72,13 @@ SRC_URI:append:fvp-baser-aemv8r64 = " \
     file://0010-armv8-Enable-icache-when-switching-exception-levels-.patch \
     "
 
+
+#
+# Juno Machines
+#
+SRC_URI:append:juno = " file://0001-arm-juno-add-custom-bootcmd-to-autoboot-from-uEnv.tx.patch"
+
+
 #
 # TC0 and TC1 MACHINES
 #
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bb b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bb
deleted file mode 100644
index cf6b07f1..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-HOMEPAGE = "http://www.denx.de/wiki/U-Boot/WebHome"
-DESCRIPTION = "U-Boot, a boot loader for Embedded boards based on PowerPC, \
-ARM, MIPS and several other processors, which can be installed in a boot \
-ROM and used to initialize and test the hardware or to download and run \
-application code."
-SECTION = "bootloaders"
-DEPENDS += "flex-native bison-native"
-
-LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://Licenses/README;md5=30503fd321432fc713238f582193b78e"
-PE = "1"
-
-# We use the revision in order to avoid having to fetch it from the
-# repo during parse
-SRCREV = "2f5fbb5b39f7b67044dda5c35e4a4b31685a3109"
-
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master \
-          "
-
-S = "${WORKDIR}/git"
-B = "${WORKDIR}/build"
-do_configure[cleandirs] = "${B}"
-
-require recipes-bsp/u-boot/u-boot.inc
-
-DEPENDS += "bc-native dtc-native"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend
deleted file mode 100644
index 980e5248..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend
+++ /dev/null
@@ -1,9 +0,0 @@
-# Machine specific u-boot
-
-THIS_DIR := "${THISDIR}"
-FILESEXTRAPATHS:prepend = "${THIS_DIR}/${BP}:"
-
-#
-# Juno KMACHINE
-#
-SRC_URI:append:juno = " file://u-boot_vexpress_uenv.patch"
-- 
2.17.1


