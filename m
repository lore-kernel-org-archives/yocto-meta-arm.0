Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 330B6C433F5
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 22:16:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.6922.1636669001629659410
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Nov 2021 14:16:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B14A5ED1
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 Nov 2021 14:16:39 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8C2663F70D
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 Nov 2021 14:16:39 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/qemuarm64-sbsa: replace with qemu-generic-arm64
Date: Thu, 11 Nov 2021 17:16:28 -0500
Message-Id: <20211111221628.32745-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 Nov 2021 22:16:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2378

Migrate the qemuarm64-sbsa machine to use the generic-arm64 machine as a
base.  This new qemu-generic-arm64 should contain only the parts
necessary to boot the generic-arm64 in qemu (using the SBSA machine).
This allows for a single generic image with testing for SBSA compliance.

NOTE: a unique WIC file is needed due to the inability to pass kernel
bootargs (due to needing DHCP for testimage).

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml                                |  2 +-
 ci/qemu-generic-arm64.yml                     | 15 ++++
 ci/qemuarm64-sbsa.yml                         | 11 ---
 meta-arm/conf/machine/generic-arm64.conf      | 16 ++--
 meta-arm/conf/machine/qemu-generic-arm64.conf | 35 ++++++++
 meta-arm/conf/machine/qemuarm64-sbsa.conf     | 30 -------
 .../trusted-firmware-a_%.bbappend             |  5 +-
 .../recipes-bsp/uefi/edk2-firmware_%.bbappend | 21 ++---
 .../linux/linux-yocto/defconfig.patch         | 83 ++++---------------
 .../linux/linux-yocto_%.bbappend              |  5 --
 meta-arm/recipes-security/optee/optee.inc     |  1 +
 meta-arm/wic/qemu-efi-disk.wks.in             | 11 +++
 12 files changed, 100 insertions(+), 135 deletions(-)
 create mode 100644 ci/qemu-generic-arm64.yml
 delete mode 100644 ci/qemuarm64-sbsa.yml
 create mode 100644 meta-arm/conf/machine/qemu-generic-arm64.conf
 delete mode 100644 meta-arm/conf/machine/qemuarm64-sbsa.conf
 create mode 100644 meta-arm/wic/qemu-efi-disk.wks.in

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index e1ce432..7c42542 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -171,7 +171,7 @@ qemu-cortex-m3/testimage-zephyr:
 qemu-cortex-r5:
   extends: .build
 
-qemuarm64-sbsa:
+qemu-generic-arm64/testimage:
   extends: .build
 
 qemuarm64-secureboot/testimage:
diff --git a/ci/qemu-generic-arm64.yml b/ci/qemu-generic-arm64.yml
new file mode 100644
index 0000000..07196ad
--- /dev/null
+++ b/ci/qemu-generic-arm64.yml
@@ -0,0 +1,15 @@
+header:
+  version: 9
+  includes:
+    - generic-arm64.yml
+
+local_conf_header:
+  failing_tests: |
+    DEFAULT_TEST_SUITES:remove = "parselogs"
+
+machine: qemu-generic-arm64
+
+target:
+  - core-image-base
+  - perf
+  - sbsa-acs
diff --git a/ci/qemuarm64-sbsa.yml b/ci/qemuarm64-sbsa.yml
deleted file mode 100644
index 5ba5f27..0000000
--- a/ci/qemuarm64-sbsa.yml
+++ /dev/null
@@ -1,11 +0,0 @@
-header:
-  version: 9
-  includes:
-    - base.yml
-
-machine: qemuarm64-sbsa
-
-target:
-  - core-image-base
-  - perf
-  - sbsa-acs
diff --git a/meta-arm/conf/machine/generic-arm64.conf b/meta-arm/conf/machine/generic-arm64.conf
index 39acc6a..dc411f6 100644
--- a/meta-arm/conf/machine/generic-arm64.conf
+++ b/meta-arm/conf/machine/generic-arm64.conf
@@ -6,18 +6,16 @@
 require conf/machine/include/arm/arch-armv8a.inc
 
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
-
+# Newer versions of the kernel are not booting on QEMU.  Hold it back to a
+#  known working version until it is determined why
+PREFERRED_VERSION_linux-yocto ?= "5.10%"
+KBUILD_DEFCONFIG = "defconfig"
+KCONFIG_MODE = "--alldefconfig"
 KERNEL_IMAGETYPE = "Image"
+MACHINE_EXTRA_RRECOMMENDS += "kernel-modules linux-firmware"
 
 IMAGE_FSTYPES ?= "wic"
-
 WKS_FILE ?= "efi-disk.wks.in"
-
-MACHINE_FEATURES += "alsa bluetooth efi qemu-usermode rtc screen usbhost vfat wifi"
-
 EFI_PROVIDER ?= "${@bb.utils.contains("DISTRO_FEATURES", "systemd", "systemd-boot", "grub-efi", d)}"
 
-KBUILD_DEFCONFIG = "defconfig"
-KCONFIG_MODE = "--alldefconfig"
-
-MACHINE_EXTRA_RRECOMMENDS += "kernel-modules linux-firmware"
+MACHINE_FEATURES:append = " alsa bluetooth efi qemu-usermode rtc screen usbhost vfat wifi"
diff --git a/meta-arm/conf/machine/qemu-generic-arm64.conf b/meta-arm/conf/machine/qemu-generic-arm64.conf
new file mode 100644
index 0000000..717a45c
--- /dev/null
+++ b/meta-arm/conf/machine/qemu-generic-arm64.conf
@@ -0,0 +1,35 @@
+#@TYPE: Machine
+#@NAME: qemu-generic-arm64
+#@DESCRIPTION: Generic Arm64 machine for typical SystemReady platforms, which
+#have working firmware and boot via EFI.
+
+MACHINEOVERRIDES =. "generic-arm64:"
+
+require conf/machine/generic-arm64.conf
+require conf/machine/include/qemu.inc
+
+SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;hvc0"
+SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
+
+EXTRA_IMAGEDEPENDS += "edk2-firmware"
+
+# This unique WIC file is necessary because kernel boot args cannot be passed
+# because there is no default kernel (see below).  There is no default kernel
+# because QEMU will only allow firmware or kernel to be passed in as a
+# parameter, and we need the firmware.  So, to allow for "ip=dhcp" as a kernel
+# boot arg (which we need for testimage), we have to have a WIC file unique to
+# this platform.
+WKS_FILE = "qemu-efi-disk.wks.in"
+IMAGE_FSTYPES += "wic.qcow2"
+
+QB_SYSTEM_NAME = "qemu-system-aarch64"
+QB_MACHINE = "-machine sbsa-ref"
+QB_MEM = "-m 1024"
+QB_DEFAULT_FSTYPE = "wic.qcow2"
+QB_NETWORK_DEVICE = "-device virtio-net-pci,netdev=net0,mac=@MAC@"
+QB_DRIVE_TYPE = "/dev/hd"
+QB_ROOTFS_OPT = "-drive file=@ROOTFS@,if=ide,format=qcow2"
+QB_DEFAULT_KERNEL = "none"
+QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd -pflash @DEPLOY_DIR_IMAGE@/SBSA_FLASH0.fd -pflash @DEPLOY_DIR_IMAGE@/SBSA_FLASH1.fd"
+QB_SERIAL_OPT = "-device virtio-serial-pci -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
+QB_TCPSERIAL_OPT = "-device virtio-serial-pci -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
diff --git a/meta-arm/conf/machine/qemuarm64-sbsa.conf b/meta-arm/conf/machine/qemuarm64-sbsa.conf
deleted file mode 100644
index d2ac56c..0000000
--- a/meta-arm/conf/machine/qemuarm64-sbsa.conf
+++ /dev/null
@@ -1,30 +0,0 @@
-#@TYPE: Machine
-#@NAME: qemuarm64_sbsa
-#@DESCRIPTION: QEMU Machine for Arm Server Base System Architecture
-
-MACHINEOVERRIDES =. "qemuarm64:"
-
-require ${COREBASE}/meta/conf/machine/qemuarm64.conf
-
-KMACHINE = "qemuarm64"
-
-QB_MACHINE = "-machine sbsa-ref"
-QB_MEM = "-m 1024"
-QB_DEFAULT_FSTYPE = "wic.qcow2"
-QB_NETWORK_DEVICE = ""
-QB_DRIVE_TYPE = "/dev/hd"
-QB_ROOTFS_OPT = "-drive file=@ROOTFS@,if=ide,format=qcow2"
-QB_DEFAULT_KERNEL = "none"
-QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
-
-IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
-IMAGE_FSTYPES += "wic wic.qcow2"
-
-WKS_FILE ?= "mkefidisk.wks"
-
-MACHINE_FEATURES += "efi"
-
-EXTRA_IMAGEDEPENDS += "edk2-firmware"
-
-KBUILD_DEFCONFIG = "defconfig"
-KCONFIG_MODE = "--alldefconfig"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index 5b5a049..45c6e92 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -1,7 +1,8 @@
 COMPATIBLE_MACHINE:qemuarm64 = "qemuarm64"
+COMPATIBLE_MACHINE:qemu-generic-arm64 = "qemu-generic-arm64"
 
 TFA_PLATFORM:qemuarm64-secureboot = "qemu"
-TFA_PLATFORM:qemuarm64-sbsa = "qemu_sbsa"
+TFA_PLATFORM:qemu-generic-arm64 = "qemu_sbsa"
 
 TFA_SPD:qemuarm64-secureboot = "opteed"
 
@@ -9,7 +10,7 @@ TFA_UBOOT:qemuarm64-secureboot = "1"
 TFA_BUILD_TARGET:aarch64:qemuall = "all fip"
 
 TFA_INSTALL_TARGET:qemuarm64-secureboot = "flash.bin"
-TFA_INSTALL_TARGET:qemuarm64-sbsa = "bl1 fip"
+TFA_INSTALL_TARGET:qemu-generic-arm64 = "bl1 fip"
 
 DEPENDS:append:aarch64:qemuall = " optee-os"
 
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend b/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
index fbdec1f..c0fc262 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
@@ -1,26 +1,27 @@
-COMPATIBLE_MACHINE = "qemuarm64"
+COMPATIBLE_MACHINE:qemuarm64-secureboot = "qemuarm64"
+COMPATIBLE_MACHINE:qemu-generic-arm64 = "qemu-generic-arm64"
 
-DEPENDS:append:qemuarm64-sbsa = " virtual/trusted-firmware-a"
+DEPENDS:append:qemu-generic-arm64 = " virtual/trusted-firmware-a coreutils-native"
 
 EDK2_BUILD_RELEASE:aarch64:qemuall = "1"
 EDK2_ARCH:aarch64:qemuall          = "AARCH64"
 
-EDK2_PLATFORM:qemuarm64-sbsa      = "SbsaQemu"
-EDK2_PLATFORM_DSC:qemuarm64-sbsa  = "Platform/Qemu/SbsaQemu/SbsaQemu.dsc"
-EDK2_BIN_NAME:qemuarm64-sbsa      = "SBSA_FLASH0.fd"
+EDK2_PLATFORM:qemu-generic-arm64      = "SbsaQemu"
+EDK2_PLATFORM_DSC:qemu-generic-arm64  = "Platform/Qemu/SbsaQemu/SbsaQemu.dsc"
+EDK2_BIN_NAME:qemu-generic-arm64      = "SBSA_FLASH0.fd"
 
 EDK2_PLATFORM:qemuarm64-secureboot      = "ArmVirtQemu-AARCH64"
 EDK2_PLATFORM_DSC:qemuarm64-secureboot  = "ArmVirtPkg/ArmVirtQemu.dsc"
 EDK2_BIN_NAME:qemuarm64-secureboot      = "QEMU_EFI.fd"
 
-do_compile:prepend:qemuarm64-sbsa() {
+do_compile:prepend:qemu-generic-arm64() {
     mkdir -p ${B}/Platform/Qemu/Sbsa/
     cp ${RECIPE_SYSROOT}/firmware/bl1.bin ${B}/Platform/Qemu/Sbsa/
     cp ${RECIPE_SYSROOT}/firmware/fip.bin ${B}/Platform/Qemu/Sbsa/
 }
 
-do_install:append:qemuarm64-sbsa() {
-    install ${B}/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${EDK_COMPILER}/FV/SBSA_FLASH0.fd ${D}/firmware/ovmf-tfa.bin
-    install ${B}/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${EDK_COMPILER}/FV/SBSA_FLASH1.fd ${D}/firmware/ovmf-uefi.bin
-    /usr/bin/truncate -s 256M ${D}/firmware/ovmf*.bin
+do_install:append:qemu-generic-arm64() {
+    install ${B}/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${EDK_COMPILER}/FV/SBSA_FLASH*.fd ${D}/firmware/
+    # QEMU requires that the images be minimum of 256M in size
+    truncate -s 256M ${D}/firmware/SBSA_FLASH*.fd
 }
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/defconfig.patch b/meta-arm/recipes-kernel/linux/linux-yocto/defconfig.patch
index 921d655..2b7cbbb 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto/defconfig.patch
+++ b/meta-arm/recipes-kernel/linux/linux-yocto/defconfig.patch
@@ -21,10 +21,10 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
-index 9907a431db0d..f50751b6eaec 100644
+index 6d84761d1285..9bb5a97d24f0 100644
 --- a/arch/arm64/configs/defconfig
 +++ b/arch/arm64/configs/defconfig
-@@ -538,7 +538,6 @@ CONFIG_GPIO_PCA953X_IRQ=y
+@@ -514,7 +514,6 @@ CONFIG_GPIO_PCA953X_IRQ=y
  CONFIG_GPIO_BD9571MWV=m
  CONFIG_GPIO_MAX77620=y
  CONFIG_GPIO_SL28CPLD=m
@@ -51,13 +51,13 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
-index f50751b6eaec..15595d6db256 100644
+index 6d84761d1285..84a75ed7e167 100644
 --- a/arch/arm64/configs/defconfig
 +++ b/arch/arm64/configs/defconfig
-@@ -789,7 +789,7 @@ CONFIG_SND_AUDIO_GRAPH_CARD=m
- CONFIG_HID_MULTITOUCH=m
- CONFIG_I2C_HID_ACPI=m
- CONFIG_I2C_HID_OF=m
+@@ -727,7 +727,7 @@ CONFIG_SND_SOC_WSA881X=m
+ CONFIG_SND_SIMPLE_CARD=m
+ CONFIG_SND_AUDIO_GRAPH_CARD=m
+ CONFIG_I2C_HID=m
 -CONFIG_USB_CONN_GPIO=m
 +CONFIG_USB_CONN_GPIO=y
  CONFIG_USB=y
@@ -67,66 +67,15 @@ index f50751b6eaec..15595d6db256 100644
 2.25.1
 
 
-From 26e4f7955080cc0f5670471823d73b972d3fe080 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Wed, 8 Sep 2021 11:51:03 +0100
-Subject: [PATCH 4/5] arm64: defconfig: remove obsolete CONFIG_ARCH_AGILEX and
- CONFIG_ARCH_N5X
-
-These config options were removed in 4a9a1a5602 ("arm64: socfpga: merge
-Agilex and N5X into ARCH_INTEL_SOCFPGA"), so remove them from the
-defconfig.
-
-Fixes: 4a9a1a5602 ("arm64: socfpga: merge Agilex and N5X into ARCH_INTEL_SOCFPGA")
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- arch/arm64/configs/defconfig | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
-index 15595d6db256..257167463b60 100644
---- a/arch/arm64/configs/defconfig
-+++ b/arch/arm64/configs/defconfig
-@@ -28,8 +28,6 @@ CONFIG_KALLSYMS_ALL=y
- # CONFIG_COMPAT_BRK is not set
- CONFIG_PROFILING=y
- CONFIG_ARCH_ACTIONS=y
--CONFIG_ARCH_AGILEX=y
--CONFIG_ARCH_N5X=y
- CONFIG_ARCH_SUNXI=y
- CONFIG_ARCH_ALPINE=y
- CONFIG_ARCH_APPLE=y
--- 
-2.25.1
-
-
-From 0931745bfa4e9a8db2885dd20d07426dbaf2fa73 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Wed, 8 Sep 2021 12:19:33 +0100
-Subject: [PATCH 5/5] arm64: defconfig: don't set CONFIG_ACPI_APEI_PCIEAER
-
-Since 8c8ff55 ("PCI/AER: Don't select CONFIG_PCIEAER by default"), PCIe
-Advanced Error Reporting isn't enabled by default.. As this means just
-enabling CONFIG_CPI_APEI_PCIEAR does not have an effect, remove it from
-the defconfig for clarity.
-
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- arch/arm64/configs/defconfig | 1 -
- 1 file changed, 1 deletion(-)
-
 diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
-index 257167463b60..f620f31b0323 100644
+index 6d84761d1285..0f45921cf5b2 100644
 --- a/arch/arm64/configs/defconfig
 +++ b/arch/arm64/configs/defconfig
-@@ -110,7 +110,6 @@ CONFIG_IMX_SCU_PD=y
- CONFIG_ACPI=y
- CONFIG_ACPI_APEI=y
- CONFIG_ACPI_APEI_GHES=y
--CONFIG_ACPI_APEI_PCIEAER=y
- CONFIG_ACPI_APEI_MEMORY_FAILURE=y
- CONFIG_ACPI_APEI_EINJ=y
- CONFIG_VIRTUALIZATION=y
--- 
-2.25.1
-
+@@ -683,7 +683,6 @@ CONFIG_DRM_PANFROST=m
+ CONFIG_FB=y
+ CONFIG_FB_MODE_HELPERS=y
+ CONFIG_FB_EFI=y
+-CONFIG_BACKLIGHT_GENERIC=m
+ CONFIG_BACKLIGHT_PWM=m
+ CONFIG_BACKLIGHT_LP855X=m
+ CONFIG_LOGO=y
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend b/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
index d215d8b..957cc3f 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
@@ -7,11 +7,6 @@ SRC_URI:append:generic-arm64 = " \
     file://tcpci.cfg \
     "
 
-FILESEXTRAPATHS:prepend:qemuarm64-sbsa = "${ARMFILESPATHS}"
-SRC_URI:append:qemuarm64-sbsa = " \
-    file://defconfig.patch \
-    "
-
 FILESEXTRAPATHS:prepend:qemuarm64-secureboot = "${ARMFILESPATHS}"
 SRC_URI:append:qemuarm64-secureboot = " \
     file://zone_dma_revert.patch \
diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/recipes-security/optee/optee.inc
index d498b00..f02a022 100644
--- a/meta-arm/recipes-security/optee/optee.inc
+++ b/meta-arm/recipes-security/optee/optee.inc
@@ -2,6 +2,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 
 COMPATIBLE_MACHINE ?= "invalid"
 COMPATIBLE_MACHINE:qemuarm64 ?= "qemuarm64"
+COMPATIBLE_MACHINE:qemu-generic-arm64 ?= "qemu-generic-arm64"
 # Please add supported machines below or set it in .bbappend or .conf
 
 OPTEEMACHINE ?= "${MACHINE}"
diff --git a/meta-arm/wic/qemu-efi-disk.wks.in b/meta-arm/wic/qemu-efi-disk.wks.in
new file mode 100644
index 0000000..4f898ef
--- /dev/null
+++ b/meta-arm/wic/qemu-efi-disk.wks.in
@@ -0,0 +1,11 @@
+# short-description: Create an EFI disk image
+# long-description: Creates a partitioned EFI disk image that the user
+# can directly dd to boot media.
+
+part /boot --source bootimg-efi --sourceparams="loader=${EFI_PROVIDER}" --label boot --active --align 1024 --use-uuid
+
+part / --source rootfs --fstype=ext4 --label root --align 1024 --use-uuid
+
+part swap --size 44 --label swap --fstype=swap --use-uuid
+
+bootloader --ptable gpt --timeout=5 --append="rootfstype=ext4 ip=dhcp"
-- 
2.17.1


