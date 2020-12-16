Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.491.1608140900216987912
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 16 Dec 2020 09:48:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: usama.arif@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B02D61FB;
	Wed, 16 Dec 2020 09:48:19 -0800 (PST)
Received: from usaari01.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 17E433F66B;
	Wed, 16 Dec 2020 09:48:18 -0800 (PST)
From: "Usama Arif" <usama.arif@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Usama Arif <usama.arif@arm.com>
Subject: [PATCH 2/3] arm-bsp/tc0: Enable verified u-boot
Date: Wed, 16 Dec 2020 17:48:04 +0000
Message-Id: <20201216174805.50683-2-usama.arif@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201216174805.50683-1-usama.arif@arm.com>
References: <20201216174805.50683-1-usama.arif@arm.com>

This involes creating the fitImage which contains
both the kernel and ramdisk. The fitImage is also
signed.

Signed-off-by: Usama Arif <usama.arif@arm.com>
Change-Id: I2fc50740aac3e347be02438cf54ef5741183a670
---
 meta-arm-bsp/conf/machine/tc0.conf | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/tc0.conf b/meta-arm-bsp/conf/machine/tc0.conf
index eed3acf..6c366da 100644
--- a/meta-arm-bsp/conf/machine/tc0.conf
+++ b/meta-arm-bsp/conf/machine/tc0.conf
@@ -11,18 +11,34 @@ require conf/machine/include/arm/arch-armv8a.inc
 # Das U-boot
 UBOOT_MACHINE ?= "total_compute_defconfig"
 PREFERRED_VERSION_u-boot ?= "2020.10"
+UBOOT_RD_LOADADDRESS = "0x88000000"
+UBOOT_RD_ENTRYPOINT = "0x88000000"
+UBOOT_LOADADDRESS = "0x80080000"
+UBOOT_ENTRYPOINT = "0x80080000"
+# Below options will generate a key to sign the kernel Image and INITRAMFS_IMAGE
+# according to the default parameters of kernel-fitimage.bbclass. If the user
+# would prefer to use their own keys, disable the key generation using the
+# FIT_GENERATE_KEYS parameter and specify the location of the keys using the
+# below paramters.
+UBOOT_SIGN_ENABLE = "1"
+UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb"
+UBOOT_SIGN_KEYNAME = "dev_key"
+UBOOT_SIGN_KEYDIR = "${DEPLOY_DIR_IMAGE}/keys"
+FIT_GENERATE_KEYS = "1"
 
 # Trusted firmware A v2.3
 PREFERRED_PROVIDER_virtual/trusted-firmware-a ?= "trusted-firmware-a"
 PREFERRED_VERSION_trusted-firmware-a ?= "2.3%"
-EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a"
 
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-arm64-ack"
 PREFERRED_VERSION_linux-arm64-ack ?= "5.4"
 
 # Cannot use the default zImage on arm64
 KERNEL_IMAGETYPE = "Image"
-KERNEL_BOOTCMD = "booti"
-IMAGE_FSTYPES += "cpio.gz.u-boot"
+KERNEL_IMAGETYPES += "fitImage"
+KERNEL_CLASSES = " kernel-fitimage "
+
+IMAGE_FSTYPES += "cpio.gz"
+INITRAMFS_IMAGE ?= "core-image-minimal"
 
 SERIAL_CONSOLES = "115200;ttyAMA0"
-- 
2.17.1

