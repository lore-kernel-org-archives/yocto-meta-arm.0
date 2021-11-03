Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A4FFC433EF
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 14:16:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.12218.1636035374484287214
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 Nov 2021 07:16:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED71312FC
	for <meta-arm@lists.yoctoproject.org>; Thu,  4 Nov 2021 07:16:13 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D0ADD3F7D7
	for <meta-arm@lists.yoctoproject.org>; Thu,  4 Nov 2021 07:16:13 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm/qemuarm64-sbsa: move to generic-arm64
Date: Wed,  3 Nov 2021 14:36:20 -0400
Message-Id: <20211103183620.15870-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211103183620.15870-1-jon.mason@arm.com>
References: <20211103183620.15870-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 04 Nov 2021 14:16:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2339

Get qemuarm64-sbsa working again and combine it with generic-arm64.
This allows for a single generic image with testing for SBSA compliance.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml                                |  5 +-
 ci/generic-arm64.yml                          |  9 ++
 ci/qemuarm64-sbsa.yml                         | 11 ---
 meta-arm/conf/machine/generic-arm64.conf      | 25 +++++-
 meta-arm/conf/machine/qemuarm64-sbsa.conf     | 30 -------
 .../trusted-firmware-a_%.bbappend             | 13 ++-
 .../recipes-bsp/uefi/edk2-firmware_%.bbappend | 24 +++---
 .../linux/linux-yocto/defconfig.patch         | 83 ++++---------------
 .../linux/linux-yocto_%.bbappend              |  5 --
 meta-arm/recipes-security/optee/optee.inc     |  2 +
 10 files changed, 75 insertions(+), 132 deletions(-)
 delete mode 100644 ci/qemuarm64-sbsa.yml
 delete mode 100644 meta-arm/conf/machine/qemuarm64-sbsa.conf

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index e1ce432..4e8e1e9 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -138,7 +138,7 @@ gem5-arm64/xen:
 gem5-atp-arm64:
   extends: .build
 
-generic-arm64:
+generic-arm64/testimage:
   extends: .build
 
 juno:
@@ -171,9 +171,6 @@ qemu-cortex-m3/testimage-zephyr:
 qemu-cortex-r5:
   extends: .build
 
-qemuarm64-sbsa:
-  extends: .build
-
 qemuarm64-secureboot/testimage:
   extends: .build
 
diff --git a/ci/generic-arm64.yml b/ci/generic-arm64.yml
index a7365b8..32a8e57 100644
--- a/ci/generic-arm64.yml
+++ b/ci/generic-arm64.yml
@@ -3,4 +3,13 @@ header:
   includes:
     - base.yml
 
+local_conf_header:
+  failing_tests: |
+    DEFAULT_TEST_SUITES:remove = "parselogs"
+
 machine: generic-arm64
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
index 39acc6a..013a9fa 100644
--- a/meta-arm/conf/machine/generic-arm64.conf
+++ b/meta-arm/conf/machine/generic-arm64.conf
@@ -4,20 +4,41 @@
 #have working firmware and boot via EFI.
 
 require conf/machine/include/arm/arch-armv8a.inc
+require conf/machine/include/qemu.inc
 
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
 
 KERNEL_IMAGETYPE = "Image"
 
-IMAGE_FSTYPES ?= "wic"
-
 WKS_FILE ?= "efi-disk.wks.in"
 
 MACHINE_FEATURES += "alsa bluetooth efi qemu-usermode rtc screen usbhost vfat wifi"
 
 EFI_PROVIDER ?= "${@bb.utils.contains("DISTRO_FEATURES", "systemd", "systemd-boot", "grub-efi", d)}"
 
+PREFERRED_VERSION_linux-yocto ?= "5.10%"
 KBUILD_DEFCONFIG = "defconfig"
 KCONFIG_MODE = "--alldefconfig"
 
 MACHINE_EXTRA_RRECOMMENDS += "kernel-modules linux-firmware"
+
+SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;hvc0"
+SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
+
+EXTRA_IMAGEDEPENDS += "edk2-firmware"
+DISTRO_FEATURES:append = " systemd"
+VIRTUAL-RUNTIME_init_manager = "systemd"
+
+IMAGE_FSTYPES += "wic wic.qcow2"
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
index 5b5a049..51598c8 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -1,17 +1,20 @@
 COMPATIBLE_MACHINE:qemuarm64 = "qemuarm64"
+COMPATIBLE_MACHINE:generic-arm64 = "generic-arm64"
 
 TFA_PLATFORM:qemuarm64-secureboot = "qemu"
-TFA_PLATFORM:qemuarm64-sbsa = "qemu_sbsa"
+TFA_PLATFORM:generic-arm64 = "qemu_sbsa"
 
 TFA_SPD:qemuarm64-secureboot = "opteed"
 
 TFA_UBOOT:qemuarm64-secureboot = "1"
 TFA_BUILD_TARGET:aarch64:qemuall = "all fip"
+TFA_BUILD_TARGET:generic-arm64 = "all fip"
 
 TFA_INSTALL_TARGET:qemuarm64-secureboot = "flash.bin"
-TFA_INSTALL_TARGET:qemuarm64-sbsa = "bl1 fip"
+TFA_INSTALL_TARGET:generic-arm64 = "bl1 fip"
 
 DEPENDS:append:aarch64:qemuall = " optee-os"
+DEPENDS:append:generic-arm64 = " optee-os"
 
 EXTRA_OEMAKE:append:aarch64:qemuall = " \
     BL32=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-header_v2.bin \
@@ -19,6 +22,12 @@ EXTRA_OEMAKE:append:aarch64:qemuall = " \
     BL32_EXTRA2=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-pageable_v2.bin \
     BL32_RAM_LOCATION=tdram \
     "
+EXTRA_OEMAKE:append:generic-arm64 = " \
+    BL32=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-header_v2.bin \
+    BL32_EXTRA1=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-pager_v2.bin \
+    BL32_EXTRA2=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-pageable_v2.bin \
+    BL32_RAM_LOCATION=tdram \
+    "
 
 do_compile:append:qemuarm64-secureboot() {
     # Create a secure flash image for booting AArch64 Qemu. See:
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend b/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
index fbdec1f..b072327 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
@@ -1,26 +1,28 @@
-COMPATIBLE_MACHINE = "qemuarm64"
+COMPATIBLE_MACHINE:aarch64:qemuall = "qemuarm64"
+COMPATIBLE_MACHINE:generic-arm64 = "generic-arm64"
 
-DEPENDS:append:qemuarm64-sbsa = " virtual/trusted-firmware-a"
+DEPENDS:append:generic-arm64 = " virtual/trusted-firmware-a"
 
 EDK2_BUILD_RELEASE:aarch64:qemuall = "1"
-EDK2_ARCH:aarch64:qemuall          = "AARCH64"
+EDK2_BUILD_RELEASE:generic-arm64   = "1"
+EDK2_ARCH:aarch64                  = "AARCH64"
 
-EDK2_PLATFORM:qemuarm64-sbsa      = "SbsaQemu"
-EDK2_PLATFORM_DSC:qemuarm64-sbsa  = "Platform/Qemu/SbsaQemu/SbsaQemu.dsc"
-EDK2_BIN_NAME:qemuarm64-sbsa      = "SBSA_FLASH0.fd"
+EDK2_PLATFORM:generic-arm64      = "SbsaQemu"
+EDK2_PLATFORM_DSC:generic-arm64  = "Platform/Qemu/SbsaQemu/SbsaQemu.dsc"
+EDK2_BIN_NAME:generic-arm64      = "SBSA_FLASH0.fd"
 
 EDK2_PLATFORM:qemuarm64-secureboot      = "ArmVirtQemu-AARCH64"
 EDK2_PLATFORM_DSC:qemuarm64-secureboot  = "ArmVirtPkg/ArmVirtQemu.dsc"
 EDK2_BIN_NAME:qemuarm64-secureboot      = "QEMU_EFI.fd"
 
-do_compile:prepend:qemuarm64-sbsa() {
+do_compile:prepend:generic-arm64() {
     mkdir -p ${B}/Platform/Qemu/Sbsa/
     cp ${RECIPE_SYSROOT}/firmware/bl1.bin ${B}/Platform/Qemu/Sbsa/
     cp ${RECIPE_SYSROOT}/firmware/fip.bin ${B}/Platform/Qemu/Sbsa/
 }
 
-do_install:append:qemuarm64-sbsa() {
-    install ${B}/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${EDK_COMPILER}/FV/SBSA_FLASH0.fd ${D}/firmware/ovmf-tfa.bin
-    install ${B}/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${EDK_COMPILER}/FV/SBSA_FLASH1.fd ${D}/firmware/ovmf-uefi.bin
-    /usr/bin/truncate -s 256M ${D}/firmware/ovmf*.bin
+do_install:append:generic-arm64() {
+    install ${B}/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${EDK_COMPILER}/FV/SBSA_FLASH*.fd ${D}/firmware/
+    # QEMU requires that the images be minimum of 256M in size
+    /usr/bin/truncate -s 256M ${D}/firmware/SBSA_FLASH*.fd
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
index d498b00..88e4dc5 100644
--- a/meta-arm/recipes-security/optee/optee.inc
+++ b/meta-arm/recipes-security/optee/optee.inc
@@ -2,10 +2,12 @@ UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 
 COMPATIBLE_MACHINE ?= "invalid"
 COMPATIBLE_MACHINE:qemuarm64 ?= "qemuarm64"
+COMPATIBLE_MACHINE:generic-arm64 ?= "generic-arm64"
 # Please add supported machines below or set it in .bbappend or .conf
 
 OPTEEMACHINE ?= "${MACHINE}"
 OPTEEMACHINE:aarch64:qemuall ?= "vexpress-qemu_armv8a"
+OPTEEMACHINE:generic-arm64 ?= "vexpress-qemu_armv8a"
 
 OPTEE_ARCH = "null"
 OPTEE_ARCH:armv7a = "arm32"
-- 
2.17.1


