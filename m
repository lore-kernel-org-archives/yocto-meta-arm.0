Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.9359.1605207978639767064
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 12 Nov 2020 11:06:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 788C11042
	for <meta-arm@lists.yoctoproject.org>; Thu, 12 Nov 2020 11:06:17 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2698E3F6CF
	for <meta-arm@lists.yoctoproject.org>; Thu, 12 Nov 2020 11:06:17 -0800 (PST)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp: Fix u-boot 2020.07 recipe
Date: Thu, 12 Nov 2020 14:06:11 -0500
Message-Id: <20201112190611.16494-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

The u-boot 2020.07 temporary recipe is a copy of 2020.04, and brought
with it a limitation in the recipe to only be used on certain hardware.
Remove this limitation so that it can be used where needed.

Change-Id: I5b99e92f3f440812ebc1fc550e6b860e6530e9b7
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/a5ds.conf               | 1 +
 meta-arm-bsp/conf/machine/fvp-common.inc          | 2 ++
 meta-arm-bsp/conf/machine/juno.conf               | 1 +
 meta-arm-bsp/conf/machine/tc0.conf                | 1 +
 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bb | 2 --
 5 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/a5ds.conf b/meta-arm-bsp/conf/machine/a5ds.conf
index f7d35e7..5aadae5 100644
--- a/meta-arm-bsp/conf/machine/a5ds.conf
+++ b/meta-arm-bsp/conf/machine/a5ds.conf
@@ -17,6 +17,7 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
 IMAGE_FSTYPES += "tar.bz2 cpio.gz"
 
 # Cortex-a5 u-boot configuration
+PREFERRED_VERSION_u-boot ?= "2020.07"
 UBOOT_MACHINE = "designstart_ca5_defconfig"
 UBOOT_IMAGE_ENTRYPOINT = "0x84000000"
 UBOOT_IMAGE_LOADADDRESS = "0x84000000"
diff --git a/meta-arm-bsp/conf/machine/fvp-common.inc b/meta-arm-bsp/conf/machine/fvp-common.inc
index da45026..ad08c0e 100644
--- a/meta-arm-bsp/conf/machine/fvp-common.inc
+++ b/meta-arm-bsp/conf/machine/fvp-common.inc
@@ -31,6 +31,8 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?= "5.4%"
 
+PREFERRED_VERSION_u-boot ?= "2020.07"
+
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot"
 
 # As this is a virtual target that will not be used in the real world there is
diff --git a/meta-arm-bsp/conf/machine/juno.conf b/meta-arm-bsp/conf/machine/juno.conf
index 50c9d2f..2f42dea 100644
--- a/meta-arm-bsp/conf/machine/juno.conf
+++ b/meta-arm-bsp/conf/machine/juno.conf
@@ -21,6 +21,7 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?= "5.4%"
 PREFERRED_VERSION_trusted-firmware-a ?= "2.3%"
+PREFERRED_VERSION_u-boot ?= "2020.07"
 
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot firmware-image-juno"
 
diff --git a/meta-arm-bsp/conf/machine/tc0.conf b/meta-arm-bsp/conf/machine/tc0.conf
index 1eb3d87..7776dde 100644
--- a/meta-arm-bsp/conf/machine/tc0.conf
+++ b/meta-arm-bsp/conf/machine/tc0.conf
@@ -10,6 +10,7 @@ require conf/machine/include/arm/arch-armv8a.inc
 
 # Das U-boot
 UBOOT_MACHINE ?= "total_compute_defconfig"
+PREFERRED_VERSION_u-boot ?= "2020.07"
 
 # Trusted firmware A v2.3
 PREFERRED_PROVIDER_virtual/trusted-firmware-a ?= "trusted-firmware-a"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bb b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bb
index 1a9721a..fa99a3a 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bb
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bb
@@ -6,8 +6,6 @@ application code."
 SECTION = "bootloaders"
 DEPENDS += "flex-native bison-native"
 
-COMPATIBLE_MACHINE = "(corstone700-*)"
-
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=30503fd321432fc713238f582193b78e"
 PE = "1"
-- 
2.17.1

