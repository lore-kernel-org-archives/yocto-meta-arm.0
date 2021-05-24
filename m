Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.724.1621889188056685995
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 May 2021 13:46:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F8A1D6E
	for <meta-arm@lists.yoctoproject.org>; Mon, 24 May 2021 13:46:26 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 304DE3F73D
	for <meta-arm@lists.yoctoproject.org>; Mon, 24 May 2021 13:46:26 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/trusted-firmare-a: update to version 2.5
Date: Mon, 24 May 2021 16:46:20 -0400
Message-Id: <20210524204620.25097-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

Update to TF-A v2.5 and MBED TLS 2.26, and all machines using 2.4 to the
newer version.  Also, n1sdp was using an intermediary SHA, but is now
updated to the latest (which includes that intermediary SHA).

Change-Id: Ia5ec3cecf9090fd5f5da28efff4c1d6cce1efc19
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/corstone500.conf                | 4 ++--
 meta-arm-bsp/conf/machine/fvp-common.inc                  | 2 +-
 meta-arm-bsp/conf/machine/include/corstone700.inc         | 4 ++--
 meta-arm-bsp/conf/machine/juno.conf                       | 2 +-
 meta-arm-bsp/conf/machine/n1sdp.conf                      | 2 +-
 meta-arm-bsp/conf/machine/sgi575.conf                     | 2 +-
 meta-arm-bsp/conf/machine/tc0.conf                        | 2 +-
 .../trusted-firmware-a/trusted-firmware-a-n1sdp.inc       | 3 ---
 ...are-a_2.4.bbappend => trusted-firmware-a_2.5.bbappend} | 0
 ...rusted-firmware-a_2.4.bb => trusted-firmware-a_2.5.bb} | 8 ++++----
 10 files changed, 13 insertions(+), 16 deletions(-)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/{trusted-firmware-a_2.4.bbappend => trusted-firmware-a_2.5.bbappend} (100%)
 rename meta-arm/recipes-bsp/trusted-firmware-a/{trusted-firmware-a_2.4.bb => trusted-firmware-a_2.5.bb} (71%)

diff --git a/meta-arm-bsp/conf/machine/corstone500.conf b/meta-arm-bsp/conf/machine/corstone500.conf
index 29291a0..b119137 100644
--- a/meta-arm-bsp/conf/machine/corstone500.conf
+++ b/meta-arm-bsp/conf/machine/corstone500.conf
@@ -17,7 +17,7 @@ PREFERRED_VERSION_linux-yocto ?= "5.3%"
 KBUILD_DEFCONFIG = "multi_v7_defconfig"
 KCONFIG_MODE = "--alldefconfig"
 
-PREFERRED_VERSION_trusted-firmware-a ?= "2.4%"
+PREFERRED_VERSION_trusted-firmware-a ?= "2.5%"
 
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot"
 
@@ -29,4 +29,4 @@ IMAGE_FSTYPES += "tar.bz2 cpio.gz"
 UBOOT_MACHINE = "designstart_ca5_defconfig"
 UBOOT_IMAGE_ENTRYPOINT = "0x84000000"
 UBOOT_IMAGE_LOADADDRESS = "0x84000000"
-PREFERRED_VERSION_u-boot ?= "2020.07"
\ No newline at end of file
+PREFERRED_VERSION_u-boot ?= "2020.07"
diff --git a/meta-arm-bsp/conf/machine/fvp-common.inc b/meta-arm-bsp/conf/machine/fvp-common.inc
index 169c0a3..925da27 100644
--- a/meta-arm-bsp/conf/machine/fvp-common.inc
+++ b/meta-arm-bsp/conf/machine/fvp-common.inc
@@ -16,7 +16,7 @@ PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?= "5.10%"
 
 PREFERRED_VERSION_u-boot ?= "2021.01"
-PREFERRED_VERSION_trusted-firmware-a ?= "2.4%"
+PREFERRED_VERSION_trusted-firmware-a ?= "2.5%"
 
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot"
 
diff --git a/meta-arm-bsp/conf/machine/include/corstone700.inc b/meta-arm-bsp/conf/machine/include/corstone700.inc
index 19a3c85..228fdd2 100644
--- a/meta-arm-bsp/conf/machine/include/corstone700.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone700.inc
@@ -11,7 +11,7 @@ SERIAL_CONSOLES ?= "115200;ttyAMA0"
 PREFERRED_PROVIDER_virtual/kernel_corstone700 = "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?= "5.6%"
 
-PREFERRED_VERSION_trusted-firmware-a ?= "2.4%"
+PREFERRED_VERSION_trusted-firmware-a ?= "2.5%"
 
 PREFERRED_VERSION_gcc-arm-none-eabi-native ?= "9-2020-q2-update"
 
@@ -31,4 +31,4 @@ WKS_FILE ?= "arm-reference-image.corstone700.wks"
 VIRTUAL-RUNTIME_dev_manager = "busybox-mdev"
 
 UBOOT_MACHINE ?= "corstone700_defconfig"
-PREFERRED_VERSION_u-boot ?= "2020.04"
\ No newline at end of file
+PREFERRED_VERSION_u-boot ?= "2020.04"
diff --git a/meta-arm-bsp/conf/machine/juno.conf b/meta-arm-bsp/conf/machine/juno.conf
index 1d7be29..1000dad 100644
--- a/meta-arm-bsp/conf/machine/juno.conf
+++ b/meta-arm-bsp/conf/machine/juno.conf
@@ -20,7 +20,7 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
 # Use kernel provided by yocto
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?= "5.4%"
-PREFERRED_VERSION_trusted-firmware-a ?= "2.4%"
+PREFERRED_VERSION_trusted-firmware-a ?= "2.5%"
 PREFERRED_VERSION_u-boot ?= "2020.07"
 
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot firmware-image-juno"
diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
index 3de47c8..2126cc1 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -24,7 +24,7 @@ PREFERRED_VERSION_linux-yocto ?= "5.10%"
 # RTL8168E Gigabit Ethernet Controller is attached to the PCIe interface
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "linux-firmware-rtl8168"
 
-PREFERRED_VERSION_trusted-firmware-a ?= "2.4%"
+PREFERRED_VERSION_trusted-firmware-a ?= "2.5%"
 
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a"
 EXTRA_IMAGEDEPENDS += "virtual/control-processor-firmware"
diff --git a/meta-arm-bsp/conf/machine/sgi575.conf b/meta-arm-bsp/conf/machine/sgi575.conf
index 2004369..cf91266 100644
--- a/meta-arm-bsp/conf/machine/sgi575.conf
+++ b/meta-arm-bsp/conf/machine/sgi575.conf
@@ -8,7 +8,7 @@ require conf/machine/include/arm/armv8-2a/tune-cortexa75.inc
 
 EXTRA_IMAGEDEPENDS += "virtual/control-processor-firmware"
 
-PREFERRED_VERSION_trusted-firmware-a ?= "2.4%"
+PREFERRED_VERSION_trusted-firmware-a ?= "2.5%"
 
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a"
 
diff --git a/meta-arm-bsp/conf/machine/tc0.conf b/meta-arm-bsp/conf/machine/tc0.conf
index eda3324..6bcb6c8 100644
--- a/meta-arm-bsp/conf/machine/tc0.conf
+++ b/meta-arm-bsp/conf/machine/tc0.conf
@@ -27,7 +27,7 @@ UBOOT_SIGN_KEYDIR = "${DEPLOY_DIR_IMAGE}/keys"
 FIT_GENERATE_KEYS = "1"
 
 PREFERRED_PROVIDER_virtual/trusted-firmware-a ?= "trusted-firmware-a"
-PREFERRED_VERSION_trusted-firmware-a ?= "2.4%"
+PREFERRED_VERSION_trusted-firmware-a ?= "2.5%"
 
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-arm64-ack"
 PREFERRED_VERSION_linux-arm64-ack ?= "5.4"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
index 9a49c00..112fac8 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
@@ -7,6 +7,3 @@ TFA_INSTALL_TARGET = "bl31 n1sdp-multi-chip n1sdp-single-chip"
 TFA_DEBUG          = "1"
 TFA_MBEDTLS        = "0"
 TFA_UBOOT          = "0"
-
-SRCREV_tfa = "332649da478147b3d03132deb3783dd62fd475d7"
-PV = "2.4+git${SRCPV}"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.5.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.bbappend
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.5.bbappend
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.5.bb
similarity index 71%
rename from meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.5.bb
index f23132a..dded003 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.5.bb
@@ -3,13 +3,13 @@ require trusted-firmware-a.inc
 # Use TF-A for version
 SRCREV_FORMAT = "tfa"
 
-# TF-A v2.4
-SRCREV_tfa = "e2c509a39c6cc4dda8734e6509cdbe6e3603cdfc"
+# TF-A v2.5
+SRCREV_tfa = "1e13c500a0351ac4b55d09a63f7008e2438550f8"
 
 LIC_FILES_CHKSUM += "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89"
 
-# mbed TLS v2.24.0
+# mbed TLS v2.26.0
 SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls;branch=master"
-SRCREV_mbedtls = "523f0554b6cdc7ace5d360885c3f5bbcc73ec0e8"
+SRCREV_mbedtls = "e483a77c85e1f9c1dd2eb1c5a8f552d2617fe400"
 
 LIC_FILES_CHKSUM_MBEDTLS = "file://mbedtls/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
-- 
2.17.1

