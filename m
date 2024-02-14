Return-Path: <drew.reed@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D6CCC48BEE
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 14:03:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.42107.1707919399478125955
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Feb 2024 06:03:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: drew.reed@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35FCC1FB;
	Wed, 14 Feb 2024 06:04:00 -0800 (PST)
Received: from C02DP1BVML7H.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 522E23F5A1;
	Wed, 14 Feb 2024 06:03:18 -0800 (PST)
From: drew.reed@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Drew Reed <Drew.Reed@arm.com>
Subject: [PATCH 3/4] bsp,ci: Switch to poky distro
Date: Wed, 14 Feb 2024 14:03:02 +0000
Message-ID: <20240214140303.38535-4-drew.reed@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240214140303.38535-1-drew.reed@arm.com>
References: <20240214140303.38535-1-drew.reed@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 14 Feb 2024 14:03:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5382

From: Drew Reed <Drew.Reed@arm.com>

We can now use the standard poky distro configured to be small by
switching distrobution and using the standard minimal image
from poky.
To do this we also remove and image configuration options from the
machine config and apply them in the kas files.

Signed-off-by: Drew Reed <Drew.Reed@arm.com>
---
 ci/corstone1000-common.yml                    | 31 +++++++++++++++++--
 .../conf/machine/include/corstone1000.inc     | 18 ++---------
 .../images/corstone1000-initramfs-image.bb    | 25 ---------------
 3 files changed, 31 insertions(+), 43 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/images/corstone1000-initramf=
s-image.bb

diff --git a/ci/corstone1000-common.yml b/ci/corstone1000-common.yml
index 09472285..42cf4c95 100644
--- a/ci/corstone1000-common.yml
+++ b/ci/corstone1000-common.yml
@@ -3,13 +3,40 @@ header:
   includes:
     - ci/base.yml
     - ci/meta-openembedded.yml
-    - ci/poky-tiny.yml
     - ci/meta-secure-core.yml
=20
 local_conf_header:
-    extrapackages: |
+  extrapackages: |
     # Intentionally blank to prevent perf from being added to the image =
in base.yml
=20
+  distrosetup: |
+    DISTRO_FEATURES =3D "usbhost ipv4"
+
+  initramfsetup: |
+    # Telling the build system which image is responsible of the generat=
ion of the initramfs rootfs
+    INITRAMFS_IMAGE_BUNDLE =3D "1"
+    INITRAMFS_IMAGE ?=3D "core-image-minimal"
+    IMAGE_FSTYPES =3D "${INITRAMFS_FSTYPES}"
+    IMAGE_NAME_SUFFIX =3D ""
+
+    # enable mdev/busybox for init
+    INIT_MANAGER =3D "mdev-busybox"
+    VIRTUAL-RUNTIME_init_manager =3D "busybox"
+
+    # prevent the kernel image from being included in the intramfs rootf=
s
+    PACKAGE_EXCLUDE +=3D "kernel-image-*"
+    # Don't include kernel binary in rootfs /boot path
+    RRECOMMENDS:${KERNEL_PACKAGE_NAME}-base =3D ""
+
+    # Disable openssl in kmod to shrink the initramfs size
+    PACKAGECONFIG:remove:pn-kmod =3D "openssl"
+
+    # all optee packages
+    IMAGE_INSTALL +=3D "optee-client"
+
+    # TS PSA API tests commands for crypto, its, ps and iat
+    IMAGE_INSTALL +=3D "packagegroup-ts-tests-psa"
+
 target:
   - corstone1000-image
   - perf
diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index 64e166af..4d33b575 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -33,17 +33,13 @@ GRUB_LINUX_APPEND ?=3D "${LINUX_KERNEL_ARGS}"
 IMAGE_CMD:wic[vardeps] +=3D "GRUB_LINUX_APPEND"
=20
 # Linux kernel
-PREFERRED_PROVIDER_virtual/kernel:forcevariable =3D "linux-yocto"
-PREFERRED_VERSION_linux-yocto =3D "6.6.%"
+PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
+PREFERRED_VERSION_linux-yocto ?=3D "6.6.%"
 KERNEL_IMAGETYPE =3D "Image.gz"
 # add FF-A support in the kernel
 MACHINE_FEATURES +=3D "arm-ffa"
 # enable this feature for kernel debugging
 # MACHINE_FEATURES +=3D "corstone1000_kernel_debug"
-# Telling the build system which image is responsible of the generation =
of the initramfs rootfs
-INITRAMFS_IMAGE_BUNDLE =3D "1"
-INITRAMFS_IMAGE ?=3D "corstone1000-initramfs-image"
-IMAGE_NAME_SUFFIX =3D ""
=20
 # login terminal serial port settings
 SERIAL_CONSOLES ?=3D "115200;ttyAMA0"
@@ -52,13 +48,3 @@ WKS_FILE ?=3D "corstone1000-image.corstone1000.wks"
=20
 # making sure EXTRA_IMAGEDEPENDS will be used while creating the image
 WKS_FILE_DEPENDS:append =3D " ${EXTRA_IMAGEDEPENDS}"
-
-# prevent the kernel image from being included in the intramfs rootfs
-PACKAGE_EXCLUDE +=3D "kernel-image-*"
-# Don't include kernel binary in rootfs /boot path
-RRECOMMENDS:${KERNEL_PACKAGE_NAME}-base =3D ""
-
-# Disable python usage in opkg-utils since it won't build with tiny conf=
ig
-PACKAGECONFIG:remove:pn-opkg-utils =3D "python"
-# Disable openssl in kmod to shink the initramfs size
-PACKAGECONFIG:remove:pn-kmod =3D "openssl"
diff --git a/meta-arm-bsp/recipes-bsp/images/corstone1000-initramfs-image=
.bb b/meta-arm-bsp/recipes-bsp/images/corstone1000-initramfs-image.bb
deleted file mode 100644
index cac3b73c..00000000
--- a/meta-arm-bsp/recipes-bsp/images/corstone1000-initramfs-image.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMARY =3D "Corstone1000 platform Initramfs Image"
-DESCRIPTION =3D "This is the main Linux image which includes an initramf=
s kernel/rootfs bundle."
-
-LICENSE =3D "MIT"
-
-COMPATIBLE_MACHINE =3D "corstone1000"
-
-IMAGE_FSTYPES =3D "${INITRAMFS_FSTYPES}"
-
-inherit core-image
-
-# By default all basic packages required for a bootable system are insta=
lled
-# by core-image . These packages are: packagegroup-core-boot and
-# packagegroup-base-extended
-
-inherit image-buildinfo
-
-#package management is not supported in corstone1000
-IMAGE_FEATURES:remove =3D "package-management"
-
-# all optee packages
-IMAGE_INSTALL +=3D "optee-client"
-
-# TS PSA API tests commands for crypto, its, ps and iat
-IMAGE_INSTALL +=3D "packagegroup-ts-tests-psa"
--=20
2.43.0


