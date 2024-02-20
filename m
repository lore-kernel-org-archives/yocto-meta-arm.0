Return-Path: <drew.reed@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D8DC54788
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 15:47:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.16436.1708444071597374956
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Feb 2024 07:47:51 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: drew.reed@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BC58FEC;
	Tue, 20 Feb 2024 07:48:30 -0800 (PST)
Received: from C02DP1BVML7H.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5BEC83F73F;
	Tue, 20 Feb 2024 07:47:50 -0800 (PST)
From: drew.reed@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Drew Reed <Drew.Reed@arm.com>
Subject: [PATCH 2/4] bsp,ci: Build Corstone-1000 firmware under multiconfig
Date: Tue, 20 Feb 2024 15:47:39 +0000
Message-ID: <20240220154741.66754-3-drew.reed@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240220154741.66754-1-drew.reed@arm.com>
References: <20240220154741.66754-1-drew.reed@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 20 Feb 2024 15:47:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5389

From: Drew Reed <Drew.Reed@arm.com>

By building the Corstone-1000 firmware under the firmware multiconfig we
can also build a minimal standard core image to be mounted in the fvp as
a mass storage device.
To do this we had to enable the MMC card interface in the Corstone-1000
kernel configuration.

Signed-off-by: Drew Reed <Drew.Reed@arm.com>
---
 ci/corstone1000-common.yml                    | 28 +++++++++-------
 ci/corstone1000-fvp.yml                       |  5 ---
 .../conf/machine/corstone1000-fvp.conf        |  3 +-
 .../conf/machine/include/corstone1000.inc     | 13 ++++++--
 .../corstone1000-firmware-deploy-image.inc    | 11 +++++++
 .../images/firmware-deploy-image.bbappend     |  4 +++
 .../linux/files/corstone1000/defconfig        | 33 +++++++++++++++++++
 .../wic/corstone1000-flash-firmware.wks.in    |  2 +-
 meta-arm-bsp/wic/efi-disk-no-swap.wks.in      | 10 ++++++
 9 files changed, 89 insertions(+), 20 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/images/corstone1000-firmware=
-deploy-image.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/images/firmware-deploy-image=
.bbappend
 create mode 100644 meta-arm-bsp/wic/efi-disk-no-swap.wks.in

diff --git a/ci/corstone1000-common.yml b/ci/corstone1000-common.yml
index 5720b783..50327694 100644
--- a/ci/corstone1000-common.yml
+++ b/ci/corstone1000-common.yml
@@ -9,27 +9,33 @@ local_conf_header:
   extrapackages: |
     # Intentionally blank to prevent perf from being added to the image =
in base.yml
=20
+  firmwarebuild: |
+    # Only needed as kas doesn't add it automatically unless you have 2 =
targets in seperate configs
+    BBMULTICONFIG ?=3D "firmware"
+
   distrosetup: |
     DISTRO_FEATURES =3D "usbhost ipv4"
=20
   initramfsetup: |
     # Telling the build system which image is responsible of the generat=
ion of the initramfs rootfs
-    INITRAMFS_IMAGE_BUNDLE =3D "1"
-    INITRAMFS_IMAGE ?=3D "core-image-minimal"
-    IMAGE_FSTYPES =3D "${INITRAMFS_FSTYPES}"
-    IMAGE_NAME_SUFFIX =3D ""
+    INITRAMFS_IMAGE_BUNDLE:firmware =3D "1"
+    INITRAMFS_IMAGE:firmware ?=3D "core-image-minimal"
+    IMAGE_FSTYPES:firmware:pn-core-image-minimal =3D "${INITRAMFS_FSTYPE=
S}"
+    IMAGE_NAME_SUFFIX:firmware =3D ""
=20
     # enable mdev/busybox for init
-    INIT_MANAGER =3D "mdev-busybox"
-    VIRTUAL-RUNTIME_init_manager =3D "busybox"
+    INIT_MANAGER:firmware =3D "mdev-busybox"
+    VIRTUAL-RUNTIME_init_manager:firmware =3D "busybox"
=20
     # prevent the kernel image from being included in the intramfs rootf=
s
-    PACKAGE_EXCLUDE +=3D "kernel-image-*"
-    # Don't include kernel binary in rootfs /boot path
-    RRECOMMENDS:${KERNEL_PACKAGE_NAME}-base =3D ""
+    PACKAGE_EXCLUDE:firmware +=3D "kernel-image-*"
=20
     # Disable openssl in kmod to shrink the initramfs size
-    PACKAGECONFIG:remove:pn-kmod =3D "openssl"
+    PACKAGECONFIG:remove:firmware:pn-kmod =3D "openssl"
+
+  imageextras: |
+    # Don't include kernel binary in rootfs /boot path
+    RRECOMMENDS:${KERNEL_PACKAGE_NAME}-base =3D ""
=20
     # all optee packages
     IMAGE_INSTALL +=3D "optee-client"
@@ -38,5 +44,5 @@ local_conf_header:
     IMAGE_INSTALL +=3D "packagegroup-ts-tests-psa"
=20
 target:
-  - corstone1000-flash-firmware-image
+  - core-image-minimal
   - perf
diff --git a/ci/corstone1000-fvp.yml b/ci/corstone1000-fvp.yml
index 25f8edf8..c4e57379 100644
--- a/ci/corstone1000-fvp.yml
+++ b/ci/corstone1000-fvp.yml
@@ -4,9 +4,4 @@ header:
     - ci/corstone1000-common.yml
     - ci/fvp.yml
=20
-local_conf_header:
-    fvp-config: |
-        # Remove Dropbear SSH as it will not fit into the corstone1000 i=
mage.
-        IMAGE_FEATURES:remove =3D " ssh-server-dropbear"
-
 machine: corstone1000-fvp
diff --git a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf b/meta-arm-b=
sp/conf/machine/corstone1000-fvp.conf
index 9c070b3d..b15c0faa 100644
--- a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
+++ b/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
@@ -35,7 +35,7 @@ FVP_CONFIG[se.nvm.update_raw_image] ?=3D "0"
 FVP_CONFIG[se.cryptocell.USER_OTP_FILTERING_DISABLE] ?=3D "1"
=20
 # Boot image
-FVP_DATA ?=3D "board.flash0=3D${IMAGE_NAME}.wic@0x68000000"
+FVP_DATA ?=3D "board.flash0=3Dcorstone1000-flash-firmware-image-${MACHIN=
E}.wic@0x68000000"
=20
 # External system (cortex-M3)
 FVP_CONFIG[extsys_harness0.extsys_flashloader.fname] ?=3D "es_flashfw.bi=
n"
@@ -53,6 +53,7 @@ FVP_CONFIG[board.msd_mmc.diagnostics] ?=3D "2"
 FVP_CONFIG[board.msd_mmc.p_max_block_count] ?=3D "0xFFFF"
 FVP_CONFIG[board.msd_config.pl180_fifo_depth] ?=3D "16"
 FVP_CONFIG[board.msd_mmc.support_unpadded_images] ?=3D "true"
+FVP_CONFIG[board.msd_mmc.p_mmc_file] ?=3D "${IMAGE_NAME}.wic"
=20
 # MMC2 card configuration
 FVP_CONFIG[board.msd_mmc_2.card_type] ?=3D "SDHC"
diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index 373dd04c..a88f19c4 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -35,7 +35,8 @@ IMAGE_CMD:wic[vardeps] +=3D "GRUB_LINUX_APPEND"
 # Linux kernel
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?=3D "6.6.%"
-KERNEL_IMAGETYPE =3D "Image.gz"
+KERNEL_IMAGETYPE =3D "Image"
+KERNEL_IMAGETYPE:firmware =3D "Image.gz"
 # add FF-A support in the kernel
 MACHINE_FEATURES +=3D "arm-ffa"
 # enable this feature for kernel debugging
@@ -44,7 +45,15 @@ MACHINE_FEATURES +=3D "arm-ffa"
 # login terminal serial port settings
 SERIAL_CONSOLES ?=3D "115200;ttyAMA0"
=20
-WKS_FILE ?=3D "corstone1000-flash-firmware.wks.in"
+IMAGE_FSTYPES +=3D "wic"
+# Need to clear the suffix so TESTIMAGE_AUTO works
+IMAGE_NAME_SUFFIX =3D ""
+WKS_FILE ?=3D "efi-disk-no-swap.wks.in"
+WKS_FILE:firmware ?=3D "corstone1000-flash-firmware.wks.in"
=20
 # making sure EXTRA_IMAGEDEPENDS will be used while creating the image
 WKS_FILE_DEPENDS:append =3D " ${EXTRA_IMAGEDEPENDS}"
+
+# If not build under the firmware multiconf we need to build the actual =
firmware
+EXTRA_IMAGEDEPENDS =3D "${@bb.utils.contains('DISTROOVERRIDES', 'firmwar=
e', \
+                        '', 'firmware-deploy-image', d)}"
diff --git a/meta-arm-bsp/recipes-bsp/images/corstone1000-firmware-deploy=
-image.inc b/meta-arm-bsp/recipes-bsp/images/corstone1000-firmware-deploy=
-image.inc
new file mode 100644
index 00000000..2d192745
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/images/corstone1000-firmware-deploy-image.=
inc
@@ -0,0 +1,11 @@
+COMPATIBLE_MACHINE =3D "corstone1000"
+
+FIRMWARE_BINARIES =3D "corstone1000-flash-firmware-image-${MACHINE}.wic =
\
+                     bl1.bin \
+                     es_flashfw.bin \
+                     corstone1000-flash-firmware-image-${MACHINE}.wic.ue=
fi.capsule \
+                     corstone1000_capsule_cert.crt \
+                     corstone1000_capsule_key.key \
+                    "
+
+do_deploy[mcdepends] =3D "mc::firmware:corstone1000-flash-firmware-image=
:do_image_complete"
diff --git a/meta-arm-bsp/recipes-bsp/images/firmware-deploy-image.bbappe=
nd b/meta-arm-bsp/recipes-bsp/images/firmware-deploy-image.bbappend
new file mode 100644
index 00000000..888db54c
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/images/firmware-deploy-image.bbappend
@@ -0,0 +1,4 @@
+MACHINE_DEPLOY_FIRMWARE_REQUIRE ?=3D ""
+MACHINE_DEPLOY_FIRMWARE_REQUIRE:corstone1000 =3D "corstone1000-firmware-=
deploy-image.inc"
+
+require ${MACHINE_DEPLOY_FIRMWARE_REQUIRE}
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconf=
ig b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig
index 8abcaed4..d67e9484 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/defconfig
@@ -89,3 +89,36 @@ CONFIG_LIBCRC32C=3Dy
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_DEBUG_FS=3Dy
 CONFIG_PANIC_TIMEOUT=3D5
+CONFIG_REGULATOR=3Dy
+# CONFIG_REGULATOR_DEBUG is not set
+CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
+# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
+# CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
+# CONFIG_REGULATOR_GPIO is not set
+# CONFIG_REGULATOR_VCTRL is not set
+# CONFIG_REGULATOR_VEXPRESS is not set
+CONFIG_MMC=3Dy
+# CONFIG_PWRSEQ_EMMC is not set
+CONFIG_PWRSEQ_SIMPLE=3Dy
+CONFIG_MMC_BLOCK=3Dy
+CONFIG_MMC_BLOCK_MINORS=3D8
+# CONFIG_SDIO_UART is not set
+# CONFIG_MMC_TEST is not set
+# CONFIG_MMC_DEBUG is not set
+CONFIG_MMC_ARMMMCI=3Dy
+# CONFIG_MMC_STM32_SDMMC is not set
+# CONFIG_MMC_SDHCI is not set
+# CONFIG_MMC_DW is not set
+# CONFIG_MMC_VUB300 is not set
+# CONFIG_MMC_USHC is not set
+# CONFIG_MMC_USDHI6ROL0 is not set
+# CONFIG_MMC_CQHCI is not set
+# CONFIG_MMC_HSQ is not set
+# CONFIG_MMC_MTK is not set
+CONFIG_EXT2_FS=3Dy
+# CONFIG_EXT2_FS_XATTR is not set
+CONFIG_EXT3_FS=3Dy
+CONFIG_EXT4_FS=3Dy
+# CONFIG_EXT4_FS_POSIX_ACL is not set
+# CONFIG_EXT4_FS_SECURITY is not set
+# CONFIG_EXT4_DEBUG is not set
diff --git a/meta-arm-bsp/wic/corstone1000-flash-firmware.wks.in b/meta-a=
rm-bsp/wic/corstone1000-flash-firmware.wks.in
index 71ab20f2..88559dee 100644
--- a/meta-arm-bsp/wic/corstone1000-flash-firmware.wks.in
+++ b/meta-arm-bsp/wic/corstone1000-flash-firmware.wks.in
@@ -1,4 +1,4 @@
-# WIC partitioning for corstone1000
+# WIC partitioning for corstone1000 internal flash
 # Layout and maximum sizes (to be defined):
 #
=20
diff --git a/meta-arm-bsp/wic/efi-disk-no-swap.wks.in b/meta-arm-bsp/wic/=
efi-disk-no-swap.wks.in
new file mode 100644
index 00000000..61902dfd
--- /dev/null
+++ b/meta-arm-bsp/wic/efi-disk-no-swap.wks.in
@@ -0,0 +1,10 @@
+# short-description: Create an EFI disk image without a swap partition
+# long-description: Creates a partitioned EFI disk image that the user
+# can directly dd to boot media.  This image will not contain a swap
+# partition but will contain custom machine specific grub arguments.
+
+part /boot --source bootimg-efi --sourceparams=3D"loader=3D${EFI_PROVIDE=
R}" --label boot --active --align 1024 --use-uuid
+
+part / --source rootfs --fstype=3Dext4 --label root --align 1024 --use-u=
uid
+
+bootloader --ptable gpt --timeout=3D1 --append=3D"${GRUB_LINUX_APPEND}"
--=20
2.43.0


