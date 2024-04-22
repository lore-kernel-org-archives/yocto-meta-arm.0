Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFBFEC07E8E
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 13:37:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.18670.1713793066461501772
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Apr 2024 06:37:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 51D7B1063;
	Mon, 22 Apr 2024 06:38:14 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E96B3F73F;
	Mon, 22 Apr 2024 06:37:45 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 5/6] arm: remove generic-arm64 and qemu-generic-arm64
Date: Mon, 22 Apr 2024 13:37:38 +0000
Message-Id: <20240422133739.190536-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240422133739.190536-1-ross.burton@arm.com>
References: <20240422133739.190536-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 22 Apr 2024 13:37:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5582

These BSPs are now obsolete.

Users of generic-arm64 should use genericarm64 from meta-yocto-bsp.

Users of qemu-generic-arm64 should use sbsa-ref from meta-arm-bsp.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml                                | 13 -------
 ci/generic-arm64.yml                          |  6 ----
 ci/qemu-generic-arm64.yml                     | 14 --------
 meta-arm/conf/machine/generic-arm64.conf      | 25 --------------
 meta-arm/conf/machine/qemu-generic-arm64.conf | 34 -------------------
 .../trusted-firmware-a_%.bbappend             |  3 --
 .../recipes-bsp/uefi/edk2-firmware_%.bbappend | 18 ----------
 .../generic-arm64-preempt-rt-tweaks.cfg       |  4 ---
 .../generic-arm64-preempt-rt.scc              |  7 ----
 .../generic-arm64-standard.scc                |  6 ----
 .../linux/linux-yocto%.bbappend               |  6 ----
 .../optee-ftpm/optee-ftpm_git.bb              |  1 -
 meta-arm/recipes-security/optee/optee.inc     |  1 -
 13 files changed, 138 deletions(-)
 delete mode 100644 ci/generic-arm64.yml
 delete mode 100644 ci/qemu-generic-arm64.yml
 delete mode 100644 meta-arm/conf/machine/generic-arm64.conf
 delete mode 100644 meta-arm/conf/machine/qemu-generic-arm64.conf
 delete mode 100644 meta-arm/recipes-kernel/linux/files/generic-arm64-kme=
ta/generic-arm64-preempt-rt-tweaks.cfg
 delete mode 100644 meta-arm/recipes-kernel/linux/files/generic-arm64-kme=
ta/generic-arm64-preempt-rt.scc
 delete mode 100644 meta-arm/recipes-kernel/linux/files/generic-arm64-kme=
ta/generic-arm64-standard.scc

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index e94ea733..a0d25063 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -169,9 +169,6 @@ genericarm64:
       - KERNEL: linux-yocto-dev
         TESTING: testimage
=20
-generic-arm64:
-  extends: .build
-
 sbsa-ref:
   extends: .build
   parallel:
@@ -201,16 +198,6 @@ n1sdp:
     matrix:
       - TESTING: [none, n1sdp-ts, n1sdp-optee, tftf]
=20
-qemu-generic-arm64:
-  extends: .build
-  parallel:
-    matrix:
-      - KERNEL: [linux-yocto, linux-yocto-rt]
-        TOOLCHAINS: [gcc, clang]
-        TESTING: testimage
-      - KERNEL: linux-yocto-dev
-        TESTING: testimage
-
 qemuarm64-secureboot:
   extends: .build
   parallel:
diff --git a/ci/generic-arm64.yml b/ci/generic-arm64.yml
deleted file mode 100644
index 5d944ef1..00000000
--- a/ci/generic-arm64.yml
+++ /dev/null
@@ -1,6 +0,0 @@
-header:
-  version: 14
-  includes:
-    - ci/base.yml
-
-machine: generic-arm64
diff --git a/ci/qemu-generic-arm64.yml b/ci/qemu-generic-arm64.yml
deleted file mode 100644
index 43ae2563..00000000
--- a/ci/qemu-generic-arm64.yml
+++ /dev/null
@@ -1,14 +0,0 @@
-header:
-  version: 14
-  includes:
-    - ci/generic-arm64.yml
-
-local_conf_header:
-  failing_tests: |
-    DEFAULT_TEST_SUITES:remove =3D "parselogs"
-
-machine: qemu-generic-arm64
-
-target:
-  - core-image-sato
-  - sbsa-acs
diff --git a/meta-arm/conf/machine/generic-arm64.conf b/meta-arm/conf/mac=
hine/generic-arm64.conf
deleted file mode 100644
index 9594e041..00000000
--- a/meta-arm/conf/machine/generic-arm64.conf
+++ /dev/null
@@ -1,25 +0,0 @@
-#@TYPE: Machine
-#@NAME: generic-arm64
-#@DESCRIPTION: Generic Arm64 machine for typical SystemReady platforms, =
which
-#have working firmware and boot via EFI.
-
-require conf/machine/include/arm/arch-armv8a.inc
-
-PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
-KBUILD_DEFCONFIG =3D "defconfig"
-KCONFIG_MODE =3D "--alldefconfig"
-KERNEL_IMAGETYPE =3D "Image"
-MACHINE_EXTRA_RRECOMMENDS +=3D "kernel-modules linux-firmware"
-
-IMAGE_FSTYPES ?=3D "wic"
-WKS_FILE ?=3D "efi-disk.wks.in"
-EFI_PROVIDER ?=3D "${@bb.utils.contains("DISTRO_FEATURES", "systemd", "s=
ystemd-boot", "grub-efi", d)}"
-
-MACHINE_FEATURES:append =3D " alsa bluetooth efi qemu-usermode rtc scree=
n usbhost vfat wifi"
-
-SERIAL_CONSOLES ?=3D "115200;ttyAMA0 115200;hvc0"
-
-XSERVER ?=3D "xserver-xorg \
-            xf86-video-fbdev \
-            xf86-video-modesetting \
-            "
diff --git a/meta-arm/conf/machine/qemu-generic-arm64.conf b/meta-arm/con=
f/machine/qemu-generic-arm64.conf
deleted file mode 100644
index 6925854f..00000000
--- a/meta-arm/conf/machine/qemu-generic-arm64.conf
+++ /dev/null
@@ -1,34 +0,0 @@
-#@TYPE: Machine
-#@NAME: qemu-generic-arm64
-#@DESCRIPTION: Generic Arm64 machine for typical SystemReady platforms, =
which
-#have working firmware and boot via EFI.
-
-MACHINEOVERRIDES =3D. "generic-arm64:"
-
-require conf/machine/generic-arm64.conf
-require conf/machine/include/qemu.inc
-
-EXTRA_IMAGEDEPENDS +=3D "edk2-firmware"
-
-# This unique WIC file is necessary because kernel boot args cannot be p=
assed
-# because there is no default kernel (see below).  There is no default k=
ernel
-# because QEMU will only allow firmware or kernel to be passed in as a
-# parameter, and we need the firmware.  So, to allow for "ip=3Ddhcp" as =
a kernel
-# boot arg (which we need for testimage), we have to have a WIC file uni=
que to
-# this platform.
-WKS_FILE =3D "qemu-efi-disk.wks.in"
-IMAGE_FSTYPES +=3D "wic.qcow2"
-
-QB_SYSTEM_NAME =3D "qemu-system-aarch64"
-QB_MACHINE =3D "-machine sbsa-ref"
-QB_MEM =3D "-m 1024"
-QB_DEFAULT_FSTYPE =3D "wic.qcow2"
-QB_NETWORK_DEVICE =3D "-device virtio-net-pci,netdev=3Dnet0,mac=3D@MAC@"
-QB_DRIVE_TYPE =3D "/dev/hd"
-QB_ROOTFS_OPT =3D "-drive file=3D@ROOTFS@,if=3Dide,format=3Dqcow2"
-QB_DEFAULT_KERNEL =3D "none"
-QB_OPT_APPEND =3D "-device qemu-xhci -device usb-tablet -device usb-kbd =
-pflash @DEPLOY_DIR_IMAGE@/SBSA_FLASH0.fd -pflash @DEPLOY_DIR_IMAGE@/SBSA=
_FLASH1.fd"
-QB_SERIAL_OPT =3D "-device virtio-serial-pci -chardev null,id=3Dvirtcon =
-device virtconsole,chardev=3Dvirtcon"
-QB_TCPSERIAL_OPT =3D "-device virtio-serial-pci -chardev socket,id=3Dvir=
tcon,port=3D@PORT@,host=3D127.0.0.1 -device virtconsole,chardev=3Dvirtcon=
"
-# sbsa-ref is a true virtual machine so can't use KVM
-QEMU_USE_KVM =3D "0"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%=
.bbappend b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.=
bbappend
index b3624bb3..3d42a97c 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappe=
nd
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappe=
nd
@@ -1,5 +1,4 @@
 COMPATIBLE_MACHINE:qemuarm64-secureboot =3D "qemuarm64-secureboot"
-COMPATIBLE_MACHINE:qemu-generic-arm64 =3D "qemu-generic-arm64"
 COMPATIBLE_MACHINE:qemuarm-secureboot =3D "qemuarm-secureboot"
=20
 #FIXME - clang fails to build tfa for qemuarm-secureboot, and possibly o=
ther
@@ -14,7 +13,6 @@ SRC_URI:append:qemuarm64-secureboot =3D " \
         "
=20
 TFA_PLATFORM:qemuarm64-secureboot =3D "qemu"
-TFA_PLATFORM:qemu-generic-arm64 =3D "qemu_sbsa"
 TFA_PLATFORM:qemuarm-secureboot =3D "qemu"
=20
 # Trusted Services secure partitions require arm-ffa machine feature.
@@ -32,7 +30,6 @@ TFA_BUILD_TARGET:aarch64:qemuall =3D "all fip"
 TFA_BUILD_TARGET:arm:qemuall =3D "all fip"
=20
 TFA_INSTALL_TARGET:qemuarm64-secureboot =3D "flash.bin"
-TFA_INSTALL_TARGET:qemu-generic-arm64 =3D "bl1 fip"
 TFA_INSTALL_TARGET:qemuarm-secureboot =3D "flash.bin"
=20
 DEPENDS:append:aarch64:qemuall =3D " optee-os"
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend b/meta-ar=
m/recipes-bsp/uefi/edk2-firmware_%.bbappend
index 7a39bb03..e923d9f0 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
@@ -13,24 +13,6 @@ EDK2_PLATFORM:qemuarm      =3D "ArmVirtQemu-ARM"
 EDK2_PLATFORM_DSC:qemuarm  =3D "ArmVirtPkg/ArmVirtQemu.dsc"
 EDK2_BIN_NAME:qemuarm      =3D "QEMU_EFI.fd"
=20
-COMPATIBLE_MACHINE:qemu-generic-arm64   =3D "qemu-generic-arm64"
-DEPENDS:append:qemu-generic-arm64       =3D " trusted-firmware-a coreuti=
ls-native"
-EDK2_PLATFORM:qemu-generic-arm64        =3D "SbsaQemu"
-EDK2_PLATFORM_DSC:qemu-generic-arm64    =3D "Platform/Qemu/SbsaQemu/Sbsa=
Qemu.dsc"
-EDK2_BIN_NAME:qemu-generic-arm64        =3D "SBSA_FLASH0.fd"
-
-do_compile:prepend:qemu-generic-arm64() {
-    mkdir -p ${B}/Platform/Qemu/Sbsa/
-    cp ${RECIPE_SYSROOT}/firmware/bl1.bin ${B}/Platform/Qemu/Sbsa/
-    cp ${RECIPE_SYSROOT}/firmware/fip.bin ${B}/Platform/Qemu/Sbsa/
-}
-
-do_install:append:qemu-generic-arm64() {
-    install ${B}/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${EDK_COMPILE=
R}/FV/SBSA_FLASH*.fd ${D}/firmware/
-    # QEMU requires that the images be minimum of 256M in size
-    truncate -s 256M ${D}/firmware/SBSA_FLASH*.fd
-}
-
 do_install:append:qemuarm64() {
     install ${B}/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${EDK_COMPILE=
R}/FV/${EDK2_BIN_NAME} ${D}/firmware/
 }
diff --git a/meta-arm/recipes-kernel/linux/files/generic-arm64-kmeta/gene=
ric-arm64-preempt-rt-tweaks.cfg b/meta-arm/recipes-kernel/linux/files/gen=
eric-arm64-kmeta/generic-arm64-preempt-rt-tweaks.cfg
deleted file mode 100644
index 84e0dd71..00000000
--- a/meta-arm/recipes-kernel/linux/files/generic-arm64-kmeta/generic-arm=
64-preempt-rt-tweaks.cfg
+++ /dev/null
@@ -1,4 +0,0 @@
-# These configurations have a dependency on !PREEMPT_RT. Set them to `n`=
 to
-# avoid complain when do_kernel_configcheck.
-CONFIG_LEDS_TRIGGER_CPU=3Dn
-CONFIG_TRANSPARENT_HUGEPAGE=3Dn
diff --git a/meta-arm/recipes-kernel/linux/files/generic-arm64-kmeta/gene=
ric-arm64-preempt-rt.scc b/meta-arm/recipes-kernel/linux/files/generic-ar=
m64-kmeta/generic-arm64-preempt-rt.scc
deleted file mode 100644
index ae97c2e2..00000000
--- a/meta-arm/recipes-kernel/linux/files/generic-arm64-kmeta/generic-arm=
64-preempt-rt.scc
+++ /dev/null
@@ -1,7 +0,0 @@
-define KMACHINE generic-arm64
-define KTYPE preempt-rt
-define KARCH arm64
-
-kconf hardware generic-arm64-preempt-rt-tweaks.cfg
-include ktypes/preempt-rt/preempt-rt.scc
-include features/bluetooth/bluetooth.scc
diff --git a/meta-arm/recipes-kernel/linux/files/generic-arm64-kmeta/gene=
ric-arm64-standard.scc b/meta-arm/recipes-kernel/linux/files/generic-arm6=
4-kmeta/generic-arm64-standard.scc
deleted file mode 100644
index 70364769..00000000
--- a/meta-arm/recipes-kernel/linux/files/generic-arm64-kmeta/generic-arm=
64-standard.scc
+++ /dev/null
@@ -1,6 +0,0 @@
-define KMACHINE generic-arm64
-define KTYPE standard
-define KARCH arm64
-
-include ktypes/standard/standard.scc
-include features/bluetooth/bluetooth.scc
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend b/meta-a=
rm/recipes-kernel/linux/linux-yocto%.bbappend
index c4e351bb..a287d0e1 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto%.bbappend
@@ -1,11 +1,5 @@
 ARMFILESPATHS :=3D "${THISDIR}/files:"
=20
-COMPATIBLE_MACHINE:generic-arm64 =3D "generic-arm64"
-FILESEXTRAPATHS:prepend:generic-arm64 =3D "${ARMFILESPATHS}"
-SRC_URI:append:generic-arm64 =3D " \
-    file://generic-arm64-kmeta;type=3Dkmeta;destsuffix=3Dgeneric-arm64-k=
meta \
-    "
-
 FILESEXTRAPATHS:prepend:qemuarm64-secureboot =3D "${ARMFILESPATHS}"
 SRC_URI:append:qemuarm64-secureboot =3D " \
     file://tee.cfg \
diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb b/met=
a-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
index 1bb76819..d5f6e01d 100644
--- a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
+++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
@@ -5,7 +5,6 @@ HOMEPAGE =3D "https://github.com/microsoft/ms-tpm-20-ref/=
"
 COMPATIBLE_MACHINE ?=3D "invalid"
 COMPATIBLE_MACHINE:qemuarm64 =3D "qemuarm64"
 COMPATIBLE_MACHINE:qemuarm64-secureboot =3D "qemuarm64"
-COMPATIBLE_MACHINE:qemu-generic-arm64 =3D "qemu-generic-arm64"
 COMPATIBLE_MACHINE:qemuarm-secureboot =3D "qemuarm"
=20
 #FIXME - doesn't currently work with clang
diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/recipes=
-security/optee/optee.inc
index 1569a9df..37676f14 100644
--- a/meta-arm/recipes-security/optee/optee.inc
+++ b/meta-arm/recipes-security/optee/optee.inc
@@ -2,7 +2,6 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "^(?P<pver>\d+(\.\d+)+)$"
=20
 COMPATIBLE_MACHINE ?=3D "invalid"
 COMPATIBLE_MACHINE:qemuarm64 ?=3D "qemuarm64"
-COMPATIBLE_MACHINE:qemu-generic-arm64 ?=3D "qemu-generic-arm64"
 COMPATIBLE_MACHINE:qemuarm ?=3D "qemuarm"
 # Please add supported machines below or set it in .bbappend or .conf
=20
--=20
2.34.1


