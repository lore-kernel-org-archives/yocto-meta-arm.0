Return-Path: <drew.reed@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A9DAC48BED
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 14:03:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.42105.1707919397410867053
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Feb 2024 06:03:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: drew.reed@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA5731FB;
	Wed, 14 Feb 2024 06:03:57 -0800 (PST)
Received: from C02DP1BVML7H.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E561F3F5A1;
	Wed, 14 Feb 2024 06:03:15 -0800 (PST)
From: drew.reed@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Drew Reed <Drew.Reed@arm.com>
Subject: [PATCH 2/4] bsp: Move machine settings
Date: Wed, 14 Feb 2024 14:03:01 +0000
Message-ID: <20240214140303.38535-3-drew.reed@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240214140303.38535-1-drew.reed@arm.com>
References: <20240214140303.38535-1-drew.reed@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 14 Feb 2024 14:03:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5381

From: Drew Reed <Drew.Reed@arm.com>

Moves a number of setting from the machine definition to the actual
recipes they apply too.
Added image configuration and dependancies to the flash image definition
file.
Reordered the settings in the machine definition to group them by
component that are related to.

Signed-off-by: Drew Reed <Drew.Reed@arm.com>
---
 .../conf/machine/include/corstone1000.inc     | 63 +++++++++----------
 .../recipes-bsp/images/corstone1000-image.bb  | 27 ++++++--
 2 files changed, 49 insertions(+), 41 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index a1e67c21..64e166af 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -2,70 +2,63 @@ require conf/machine/include/arm/armv8a/tune-cortexa35.=
inc
=20
 MACHINEOVERRIDES =3D. "corstone1000:"
=20
+# TF-M
+PREFERRED_VERSION_trusted-firmware-m ?=3D "1.8.%"
+
 # TF-A
 TFA_PLATFORM =3D "corstone1000"
-EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a"
 PREFERRED_VERSION_trusted-firmware-a ?=3D "2.9.%"
 PREFERRED_VERSION_tf-a-tests ?=3D "2.8.%"
=20
 TFA_BL2_BINARY =3D "bl2-corstone1000.bin"
 TFA_FIP_BINARY =3D "fip-corstone1000.bin"
=20
-# TF-M
-EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-m"
-PREFERRED_VERSION_trusted-firmware-m ?=3D "1.8.%"
-
-# TF-M settings for signing host images
-TFA_BL2_RE_IMAGE_LOAD_ADDRESS =3D "0x62353000"
-TFA_BL2_RE_SIGN_BIN_SIZE =3D "0x2d000"
-TFA_FIP_RE_IMAGE_LOAD_ADDRESS =3D "0x68130000"
-TFA_FIP_RE_SIGN_BIN_SIZE =3D "0x00200000"
-
-# u-boot
-PREFERRED_VERSION_u-boot ?=3D "2023.07%"
-EXTRA_IMAGEDEPENDS +=3D "u-boot"
-
-#optee
+# optee
 PREFERRED_VERSION_optee-os ?=3D "4.1.%"
-EXTRA_IMAGEDEPENDS +=3D "optee-os"
-OPTEE_ARCH =3D "arm64"
-OPTEE_BINARY =3D "tee-pager_v2.bin"
=20
-# Include smm-gateway and se-proxy SPs into optee-os binary
-MACHINE_FEATURES +=3D "ts-smm-gateway ts-se-proxy"
+# Trusted Services
 TS_PLATFORM =3D "arm/corstone1000"
 TS_SP_SE_PROXY_CONFIG =3D "corstone1000"
+# Include smm-gateway and se-proxy SPs into optee-os binary
+MACHINE_FEATURES +=3D "ts-smm-gateway ts-se-proxy"
=20
-# External System(Cortex-M3)
-EXTRA_IMAGEDEPENDS +=3D "external-system"
+# u-boot
+PREFERRED_VERSION_u-boot ?=3D "2023.07%"
+MACHINE_FEATURES +=3D "efi"
+EFI_PROVIDER ?=3D "grub-efi"
+
+# Grub
+LINUX_KERNEL_ARGS ?=3D "earlycon=3Dpl011,0x1a510000 console=3DttyAMA0,11=
5200"
+GRUB_LINUX_APPEND ?=3D "${LINUX_KERNEL_ARGS}"
+IMAGE_CMD:wic[vardeps] +=3D "GRUB_LINUX_APPEND"
=20
 # Linux kernel
 PREFERRED_PROVIDER_virtual/kernel:forcevariable =3D "linux-yocto"
 PREFERRED_VERSION_linux-yocto =3D "6.6.%"
 KERNEL_IMAGETYPE =3D "Image.gz"
-
-INITRAMFS_IMAGE_BUNDLE ?=3D "1"
-
-#telling the build system which image is responsible of the generation o=
f the initramfs rootfs
-INITRAMFS_IMAGE =3D "corstone1000-initramfs-image"
-IMAGE_NAME_SUFFIX =3D ""
-
 # add FF-A support in the kernel
 MACHINE_FEATURES +=3D "arm-ffa"
-
-# prevent the kernel image from being included in the intramfs rootfs
-PACKAGE_EXCLUDE =3D "kernel-image-*"
-
 # enable this feature for kernel debugging
 # MACHINE_FEATURES +=3D "corstone1000_kernel_debug"
+# Telling the build system which image is responsible of the generation =
of the initramfs rootfs
+INITRAMFS_IMAGE_BUNDLE =3D "1"
+INITRAMFS_IMAGE ?=3D "corstone1000-initramfs-image"
+IMAGE_NAME_SUFFIX =3D ""
=20
 # login terminal serial port settings
 SERIAL_CONSOLES ?=3D "115200;ttyAMA0"
=20
+WKS_FILE ?=3D "corstone1000-image.corstone1000.wks"
+
 # making sure EXTRA_IMAGEDEPENDS will be used while creating the image
 WKS_FILE_DEPENDS:append =3D " ${EXTRA_IMAGEDEPENDS}"
=20
-WKS_FILE ?=3D "corstone1000-image.corstone1000.wks"
+# prevent the kernel image from being included in the intramfs rootfs
+PACKAGE_EXCLUDE +=3D "kernel-image-*"
+# Don't include kernel binary in rootfs /boot path
+RRECOMMENDS:${KERNEL_PACKAGE_NAME}-base =3D ""
=20
+# Disable python usage in opkg-utils since it won't build with tiny conf=
ig
+PACKAGECONFIG:remove:pn-opkg-utils =3D "python"
 # Disable openssl in kmod to shink the initramfs size
 PACKAGECONFIG:remove:pn-kmod =3D "openssl"
diff --git a/meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb b/meta=
-arm-bsp/recipes-bsp/images/corstone1000-image.bb
index e7d00596..73fc1766 100644
--- a/meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb
+++ b/meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb
@@ -5,19 +5,35 @@ LICENSE =3D "MIT"
=20
 COMPATIBLE_MACHINE =3D "corstone1000"
=20
+# IMAGE_FSTYPES must be set before 'inherit image'
+# https://docs.yoctoproject.org/ref-manual/variables.html#term-IMAGE_FST=
YPES
+IMAGE_FSTYPES =3D "wic uefi_capsule"
+
 inherit image
 inherit tfm_sign_image
-inherit  uefi_capsule
+inherit uefi_capsule
=20
-PACKAGE_INSTALL =3D ""
+DEPENDS +=3D "external-system \
+            trusted-firmware-a \
+            trusted-firmware-m \
+"
=20
-IMAGE_FSTYPES +=3D "wic uefi_capsule"
+IMAGE_FEATURES =3D ""
+IMAGE_LINGUAS =3D ""
+
+PACKAGE_INSTALL =3D ""
=20
-UEFI_FIRMWARE_BINARY =3D "${PN}-${MACHINE}.${CAPSULE_IMGTYPE}"
+UEFI_FIRMWARE_BINARY =3D "${IMAGE_LINK_NAME}.${CAPSULE_IMGTYPE}"
 UEFI_CAPSULE_CONFIG =3D "${THISDIR}/files/${PN}-capsule-update-image.jso=
n"
 CAPSULE_IMGTYPE =3D "wic"
=20
-# TF-X settings for signing host images
+# TF-A settings for signing host images
+TFA_BL2_BINARY =3D "bl2-corstone1000.bin"
+TFA_FIP_BINARY =3D "fip-corstone1000.bin"
+TFA_BL2_RE_IMAGE_LOAD_ADDRESS =3D "0x62353000"
+TFA_BL2_RE_SIGN_BIN_SIZE =3D "0x2d000"
+TFA_FIP_RE_IMAGE_LOAD_ADDRESS =3D "0x68130000"
+TFA_FIP_RE_SIGN_BIN_SIZE =3D "0x00200000"
 RE_LAYOUT_WRAPPER_VERSION =3D "0.0.7"
 TFM_SIGN_PRIVATE_KEY =3D "${libdir}/tfm-scripts/root-RSA-3072_1.pem"
 RE_IMAGE_OFFSET =3D "0x1000"
@@ -38,6 +54,5 @@ do_sign_images() {
         ${TFA_FIP_RE_IMAGE_LOAD_ADDRESS} ${TFA_FIP_RE_SIGN_BIN_SIZE}
 }
 do_sign_images[depends] =3D "\
-    trusted-firmware-a:do_populate_sysroot \
     fiptool-native:do_populate_sysroot \
     "
--=20
2.43.0


