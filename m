Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1554EC54EAA
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 18:52:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.110517.1674845512101379905
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Jan 2023 10:51:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9E622B
	for <meta-arm@lists.yoctoproject.org>; Fri, 27 Jan 2023 10:52:32 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B0F293F71E
	for <meta-arm@lists.yoctoproject.org>; Fri, 27 Jan 2023 10:51:50 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/qemuarm-secureboot: Changes for v2023.01 u-boot
Date: Fri, 27 Jan 2023 13:51:46 -0500
Message-Id: <20230127185146.13434-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Jan 2023 18:52:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4332

Update qemuarm-secureboot to work with the latest u-boot version and
remove the old, unneeded version from meta-arm

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/conf/machine/qemuarm-secureboot.conf |  2 +-
 ...rm-make-QFW-MMIO-implied-on-qemu-arm.patch | 34 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot/qemuarm.cfg     |  3 +-
 meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend |  5 ++-
 meta-arm/recipes-bsp/u-boot/u-boot_2022.10.bb | 26 --------------
 5 files changed, 41 insertions(+), 29 deletions(-)
 create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot/0001-qemu-arm-make-QFW-MMIO-implied-on-qemu-arm.patch
 delete mode 100644 meta-arm/recipes-bsp/u-boot/u-boot_2022.10.bb

diff --git a/meta-arm/conf/machine/qemuarm-secureboot.conf b/meta-arm/conf/machine/qemuarm-secureboot.conf
index cb54fe94..db02dc68 100644
--- a/meta-arm/conf/machine/qemuarm-secureboot.conf
+++ b/meta-arm/conf/machine/qemuarm-secureboot.conf
@@ -23,4 +23,4 @@ IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
 MACHINE_FEATURES += "optee-ftpm"
 
 PREFERRED_VERSION_optee-os ?= "3.18.%"
-PREFERRED_VERSION_u-boot ?= "2022.10"
+
diff --git a/meta-arm/recipes-bsp/u-boot/u-boot/0001-qemu-arm-make-QFW-MMIO-implied-on-qemu-arm.patch b/meta-arm/recipes-bsp/u-boot/u-boot/0001-qemu-arm-make-QFW-MMIO-implied-on-qemu-arm.patch
new file mode 100644
index 00000000..8d3b32f8
--- /dev/null
+++ b/meta-arm/recipes-bsp/u-boot/u-boot/0001-qemu-arm-make-QFW-MMIO-implied-on-qemu-arm.patch
@@ -0,0 +1,34 @@
+From 67bb1f111c4668c4dfdc40547cb83fc6c1f010e9 Mon Sep 17 00:00:00 2001
+From: Jon Mason <jdmason@kudzu.us>
+Date: Thu, 26 Jan 2023 11:46:33 -0500
+Subject: [PATCH] qemu: arm: make QFW, MMIO implied on qemu-arm
+
+There are instances when one would not want QFW enabled, like running
+alternative firmware.  Make this choice optional instead of forced by
+using the implied keyword.
+
+Signed-off-by: Jon Mason <jdmason@kudzu.us>
+Upstream-Status: Pending [Not submitted to upstream yet]
+
+---
+ board/emulation/qemu-arm/Kconfig | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/board/emulation/qemu-arm/Kconfig b/board/emulation/qemu-arm/Kconfig
+index ed9949651c4b..93f6f74d5bcc 100644
+--- a/board/emulation/qemu-arm/Kconfig
++++ b/board/emulation/qemu-arm/Kconfig
+@@ -5,8 +5,8 @@ config TEXT_BASE
+ 
+ config BOARD_SPECIFIC_OPTIONS # dummy
+ 	def_bool y
+-	select CMD_QFW
+-	select QFW_MMIO
++	imply CMD_QFW
++	imply QFW_MMIO
+ 	imply VIRTIO_MMIO
+ 	imply VIRTIO_PCI
+ 	imply VIRTIO_NET
+-- 
+2.30.2
+
diff --git a/meta-arm/recipes-bsp/u-boot/u-boot/qemuarm.cfg b/meta-arm/recipes-bsp/u-boot/u-boot/qemuarm.cfg
index db8dfec0..82c25e27 100644
--- a/meta-arm/recipes-bsp/u-boot/u-boot/qemuarm.cfg
+++ b/meta-arm/recipes-bsp/u-boot/u-boot/qemuarm.cfg
@@ -1,6 +1,7 @@
 # This must match the address that TF-A jumps to for BL33
-CONFIG_SYS_TEXT_BASE=0x60000000
+CONFIG_TEXT_BASE=0x60000000
 CONFIG_ENV_IS_NOWHERE=y
 # CONFIG_ENV_IS_IN_FLASH is not set
 # CONFIG_MTD is not set
 # CONFIG_MTD_NOR_FLASH is not set
+# CONFIG_CMD_QFW is not set
diff --git a/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
index 0683a783..58d66e1d 100644
--- a/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -1,4 +1,7 @@
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
 SRC_URI:append:qemuarm64-secureboot = " file://qemuarm64.cfg"
-SRC_URI:append:qemuarm-secureboot = " file://qemuarm.cfg"
+SRC_URI:append:qemuarm-secureboot = " \
+    file://0001-qemu-arm-make-QFW-MMIO-implied-on-qemu-arm.patch \
+    file://qemuarm.cfg \
+    "
diff --git a/meta-arm/recipes-bsp/u-boot/u-boot_2022.10.bb b/meta-arm/recipes-bsp/u-boot/u-boot_2022.10.bb
deleted file mode 100644
index 905ae552..00000000
--- a/meta-arm/recipes-bsp/u-boot/u-boot_2022.10.bb
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
-LIC_FILES_CHKSUM = "file://Licenses/README;md5=2ca5f2c35c8cc335f0a19756634782f1"
-PE = "1"
-
-# We use the revision in order to avoid having to fetch it from the
-# repo during parse
-SRCREV = "4debc57a3da6c3f4d3f89a637e99206f4cea0a96"
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
-DEPENDS += "bc-native dtc-native gnutls-native"
-- 
2.17.1


