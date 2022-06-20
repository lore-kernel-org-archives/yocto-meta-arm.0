Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC054CCA473
	for <webhook@archiver.kernel.org>; Fri, 24 Jun 2022 17:26:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.10466.1656091574642988102
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 24 Jun 2022 10:26:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45D951042
	for <meta-arm@lists.yoctoproject.org>; Fri, 24 Jun 2022 10:26:14 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F014C3F792
	for <meta-arm@lists.yoctoproject.org>; Fri, 24 Jun 2022 10:26:13 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/edk2: add support for qemuarm and qemuarm64
Date: Mon, 20 Jun 2022 11:29:12 -0400
Message-Id: <20220620152913.3563-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 24 Jun 2022 17:26:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3538

Add basic support for running edk2 on qemuarm and qemuarm64.  This
necessitated the need to add ACPI and EFI to the default kernel configs
for these machines.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware.inc     |  5 +++++
 .../recipes-bsp/uefi/edk2-firmware_%.bbappend   | 17 +++++++++++++++++
 .../recipes-kernel/linux/linux-yocto/efi.cfg    |  2 ++
 .../recipes-kernel/linux/linux-yocto_%.bbappend |  6 ++++++
 4 files changed, 30 insertions(+)
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto/efi.cfg

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
index 63c422f6..21bc58dd 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
@@ -71,9 +71,14 @@ export BTOOLS_PATH = "${EDK_TOOLS_PATH}/BinWrappers/PosixLike"
 
 EDK_COMPILER ?= "GCC5"
 export GCC5_AARCH64_PREFIX = "${TARGET_PREFIX}"
+export GCC5_ARM_PREFIX = "${TARGET_PREFIX}"
 
 EDK_COMPILER:toolchain-clang = "CLANG38"
 export CLANG38_AARCH64_PREFIX = "${TARGET_PREFIX}"
+export CLANG38_ARM_PREFIX = "${TARGET_PREFIX}"
+
+#FIXME - arm32 doesn't work with clang due to a linker issue
+TOOLCHAIN:arm = "gcc"
 
 do_configure:prepend() {
     sed -i -e "s#-target ${HOST_ARCH}-linux-gnu*#-target ${HOST_SYS}#" ${S}/BaseTools/Conf/tools_def.template
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend b/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
index f65cb094..7a39bb03 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
@@ -3,6 +3,15 @@ EDK2_PLATFORM:qemuarm64-secureboot      = "ArmVirtQemu-AARCH64"
 EDK2_PLATFORM_DSC:qemuarm64-secureboot  = "ArmVirtPkg/ArmVirtQemu.dsc"
 EDK2_BIN_NAME:qemuarm64-secureboot      = "QEMU_EFI.fd"
 
+COMPATIBLE_MACHINE:qemuarm64 = "qemuarm64"
+EDK2_PLATFORM:qemuarm64      = "ArmVirtQemu-AARCH64"
+EDK2_PLATFORM_DSC:qemuarm64  = "ArmVirtPkg/ArmVirtQemu.dsc"
+EDK2_BIN_NAME:qemuarm64      = "QEMU_EFI.fd"
+
+COMPATIBLE_MACHINE:qemuarm = "qemuarm"
+EDK2_PLATFORM:qemuarm      = "ArmVirtQemu-ARM"
+EDK2_PLATFORM_DSC:qemuarm  = "ArmVirtPkg/ArmVirtQemu.dsc"
+EDK2_BIN_NAME:qemuarm      = "QEMU_EFI.fd"
 
 COMPATIBLE_MACHINE:qemu-generic-arm64   = "qemu-generic-arm64"
 DEPENDS:append:qemu-generic-arm64       = " trusted-firmware-a coreutils-native"
@@ -21,3 +30,11 @@ do_install:append:qemu-generic-arm64() {
     # QEMU requires that the images be minimum of 256M in size
     truncate -s 256M ${D}/firmware/SBSA_FLASH*.fd
 }
+
+do_install:append:qemuarm64() {
+    install ${B}/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${EDK_COMPILER}/FV/${EDK2_BIN_NAME} ${D}/firmware/
+}
+
+do_install:append:qemuarm() {
+    install ${B}/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${EDK_COMPILER}/FV/${EDK2_BIN_NAME} ${D}/firmware/
+}
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/efi.cfg b/meta-arm/recipes-kernel/linux/linux-yocto/efi.cfg
new file mode 100644
index 00000000..00be1bc6
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-yocto/efi.cfg
@@ -0,0 +1,2 @@
+CONFIG_ACPI=y
+CONFIG_EFI=y
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend b/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
index cf093f04..1d01daa0 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
@@ -16,3 +16,9 @@ FILESEXTRAPATHS:prepend:qemuarm-secureboot = "${ARMFILESPATHS}"
 SRC_URI:append:qemuarm-secureboot = " \
     file://tee.cfg \
     "
+
+FILESEXTRAPATHS:prepend:qemuarm64 = "${ARMFILESPATHS}"
+SRC_URI:append:qemuarm64 = " file://efi.cfg"
+
+FILESEXTRAPATHS:prepend:qemuarm = "${ARMFILESPATHS}"
+SRC_URI:append:qemuarm = " file://efi.cfg"
-- 
2.17.1


