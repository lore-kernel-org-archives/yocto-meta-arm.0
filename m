Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web11.16592.1589558571175820272
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 15 May 2020 09:02:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LDfl7v81;
 spf=pass (domain: gmail.com, ip: 209.85.166.67, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f67.google.com with SMTP id y10so3287496iov.4
        for <meta-arm@lists.yoctoproject.org>; Fri, 15 May 2020 09:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1zemssE8k6PiADuyZO4N1iiqQKyQNCoYNKyfqm322x8=;
        b=LDfl7v816QxcrutCkTOaeCb9qFgt6hei8jJKKjekDaAqpZBYc2u+8hBBcUCnFzYIP7
         p/uJ9XPc2DONyGL6wXOLz3IlXHi0cT0u1+xvYZ398vS8t3bZIUox60yHdttVqDo8YOw2
         OXRBwGc3HgL0vRI8/+6e+hCjSQ0rVknxvkzOfnQS9yDO0/G9jq57yTKRnMxGiSkAqy4r
         4KpxIhhEOdYD+HbHbXYRbLh4GPM27BdrYEMkssCJWTORMjyTDvYhE9yglZt6u0TYLXEC
         tShav1yrRcOFDT6VmlwSYsrgk29oAki9ZLbFFDOLlXRvXN0WplVIhRk9Nu1uxAxsNk8y
         2TUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1zemssE8k6PiADuyZO4N1iiqQKyQNCoYNKyfqm322x8=;
        b=b1Pan0X83qWzohiBYWy2G0fLxsFPyrwBL8A1OHUXuGMa2OFPYDMOUgSUaDYWJYODgQ
         PnUsp11LEJVsy0SmTeSpA6vgABjBvqWE9XYOKEc3zaYYlzWx5iUitKQ7tuECpgq3gWS9
         qm56n4Ph1A13ia3Uls09pk99vftpSqhYGmHG1eMhmINR5genZF82arWnAgHv0XxP3SlM
         Pa8fmduY2ueJ0VnILJAN4YLi7u29AH4PwZTzKwrSi8x9xNdsP2AZRLC+kWT4S7sBj2NL
         y0boLZMY6bf0x3Uzc7F1SMXHrR+ULkXfUNuIrey3awPE5ORC+TeGa41nDqRjtLIgDVxl
         26Wg==
X-Gm-Message-State: AOAM533C03MiU/gEiggVNrkgNDZRG2PpJbXAzdZI1TcrJXH/tsIkQJ7Z
	EyMph9X/UXdDfD8Kl2Ppsmc7g8up/hE=
X-Google-Smtp-Source: ABdhPJz+ooJ3cCaDAlgr3c9FZCokdo3Ag1t6ZSlCMhZo/glJFNWb6Nu7EPYDi22GkoYBUIbcM0gfzg==
X-Received: by 2002:a6b:e009:: with SMTP id z9mr3382334iog.97.1589558569599;
        Fri, 15 May 2020 09:02:49 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.garmin.com ([2605:a601:ac3d:c100:7472:a058:3fd7:24e9])
        by smtp.gmail.com with ESMTPSA id c10sm878132ioc.24.2020.05.15.09.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 09:02:48 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [meta-arm][PATCH v2 3/3] Add support for booting qemu with TFA and optee
Date: Fri, 15 May 2020 11:02:40 -0500
Message-Id: <20200515160240.16395-4-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200515160240.16395-1-JPEWhacker@gmail.com>
References: <20200513221134.30072-1-JPEWhacker@gmail.com>
 <20200515160240.16395-1-JPEWhacker@gmail.com>

Adds support for booting AArch64 Qemu machines using TF-A + optee +
u-boot. Most of the changes are applicable to any AArch64 qemu target,
and a reference machine called qemuarm64-secureboot has been added that
show how to enable support for it.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../conf/machine/qemuarm64-secureboot.conf    | 26 +++++++++++++
 .../trusted-firmware-a/trusted-firmware-a.inc | 39 ++++++++++++-------
 .../recipes-bsp/u-boot/u-boot/qemuarm64.cfg   |  4 ++
 meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend |  3 ++
 .../linux/linux-yocto-dev.bbappend            |  4 ++
 .../linux/linux-yocto-dev/tee.cfg             |  4 ++
 .../recipes-security/optee/optee-os_git.bb    |  4 ++
 meta-arm/recipes-security/optee/optee.inc     |  2 +-
 meta-arm/wic/qemuarm64.wks                    |  4 ++
 9 files changed, 76 insertions(+), 14 deletions(-)
 create mode 100644 meta-arm/conf/machine/qemuarm64-secureboot.conf
 create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot/qemuarm64.cfg
 create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-dev.bbappend
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto-dev/tee.cfg
 create mode 100644 meta-arm/wic/qemuarm64.wks

diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/conf/machine/qemuarm64-secureboot.conf
new file mode 100644
index 0000000..a5b7401
--- /dev/null
+++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
@@ -0,0 +1,26 @@
+MACHINEOVERRIDES =. "qemuarm64:"
+
+require ${COREBASE}/meta/conf/machine/qemuarm64.conf
+
+KMACHINE = "qemuarm64"
+
+UBOOT_MACHINE = "qemu_arm64_defconfig"
+
+# The 5.4 kernel panics when booting, so use the development kernel until the
+# default kernel is upgraded (5.5. supposedly works)
+PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-dev"
+
+QB_MACHINE = "-machine virt,secure=on"
+QB_OPT_APPEND += "-no-acpi"
+QB_MEM = "-m 1G"
+QB_DEFAULT_FSTYPE = "wic.qcow2"
+QB_DEFAULT_BIOS = "flash.bin"
+QB_FSINFO = "wic:no-kernel-in-fs"
+QB_ROOTFS_OPT = ""
+
+IMAGE_FSTYPES += "wic wic.qcow2"
+
+WKS_FILE ?= "qemuarm64.wks"
+WKS_FILE_DEPENDS = "trusted-firmware-a"
+IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
+
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index c9c5710..1369372 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -7,10 +7,11 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit deploy nopackages
 
-COMPATIBLE_MACHINE ?= "invalid"
+COMPATIBLE_MACHINE = "qemuarm64"
 
 # Platform must be set for each machine
 TFA_PLATFORM ?= "invalid"
+TFA_PLATFORM_aarch64_qemuall = "qemu"
 
 # Some platforms can have multiple board configurations
 # Leave empty for default behavior
@@ -20,6 +21,7 @@ TFA_BOARD ?= ""
 # Few options are "opteed", "tlkd", "trusty", "tspd"...
 # Leave empty to not use SPD
 TFA_SPD ?= ""
+TFA_SPD_aarch64_qemuall = "opteed"
 
 # Build for debug (set TFA_DEBUG to 1 to activate)
 TFA_DEBUG ?= "0"
@@ -44,16 +46,19 @@ SRCREV_FORMAT_append = "${@bb.utils.contains('TFA_MBEDTLS', '1', '_mbedtls', '',
 # U-boot support (set TFA_UBOOT to 1 to activate)
 # When U-Boot support is activated BL33 is activated with u-boot.bin file
 TFA_UBOOT ?= "0"
+TFA_UBOOT_aarch64_qemuall = "1"
 
 # What to build
 # By default we only build bl1, do_deploy will copy
 # everything listed in this variable (by default bl1.bin)
 TFA_BUILD_TARGET ?= "bl1"
+TFA_BUILD_TARGET_aarch64_qemuall = "all fip"
 
 # What to install
 # do_install and do_deploy will install everything listed in this
 # variable. It is set by default to TFA_BUILD_TARGET
 TFA_INSTALL_TARGET ?= "${TFA_BUILD_TARGET}"
+TFA_INSTALL_TARGET_aarch64_qemuall = "flash.bin"
 
 # Requires CROSS_COMPILE set by hand as there is no configure script
 export CROSS_COMPILE="${TARGET_PREFIX}"
@@ -70,6 +75,7 @@ do_configure[noexec] = "1"
 # We need dtc for dtbs compilation
 # We need openssl for fiptool
 DEPENDS_append = " dtc-native openssl-native"
+DEPENDS_append_aarch64_qemuall = " optee-os"
 
 # Add platform parameter
 EXTRA_OEMAKE += "BUILD_BASE=${B} PLAT=${TFA_PLATFORM}"
@@ -91,6 +97,14 @@ EXTRA_OEMAKE += "${@bb.utils.contains('TFA_MBEDTLS', '1', 'MBEDTLS_DIR=${TFA_MBE
 DEPENDS += " ${@bb.utils.contains('TFA_UBOOT', '1', 'u-boot', '', d)}"
 do_compile[depends] += " ${@bb.utils.contains('TFA_UBOOT', '1', 'u-boot:do_deploy', '', d)}"
 EXTRA_OEMAKE += "${@bb.utils.contains('TFA_UBOOT', '1', 'BL33=${DEPLOY_DIR_IMAGE}/u-boot.bin', '',d)}"
+EXTRA_OEMAKE_append_aarch64_qemuall = " \
+    BL32=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-header_v2.bin \
+    BL32_EXTRA1=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-pager_v2.bin \
+    BL32_EXTRA2=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-pageable_v2.bin \
+    BL32_RAM_LOCATION=tdram \
+    "
+
+BUILD_PLAT = "${B}/${TFA_PLATFORM}/${@"debug" if d.getVar("TFA_DEBUG") == "1" else "release"}/"
 
 # The following hack is needed to fit properly in yocto build environment
 # TFA is forcing the host compiler and its flags in the Makefile using :=
@@ -107,13 +121,12 @@ do_compile() {
 }
 do_compile[cleandirs] = "${B}"
 
-do_install() {
-    if ${@"true" if d.getVar('TFA_DEBUG') == '1' else "false"}; then
-        BUILD_PLAT=${B}/${BUILD_DIR}/debug/
-    else
-        BUILD_PLAT=${B}/${BUILD_DIR}/release/
-    fi
+do_compile_append_aarch64_qemuall() {
+    dd if=${BUILD_PLAT}/bl1.bin of=${BUILD_PLAT}/flash.bin bs=4096 conv=notrunc
+    dd if=${BUILD_PLAT}/fip.bin of=${BUILD_PLAT}/flash.bin seek=64 bs=4096 conv=notrunc
+}
 
+do_install() {
     install -d -m 755 ${D}/firmware
     for atfbin in ${TFA_INSTALL_TARGET}; do
         processes="0"
@@ -125,23 +138,23 @@ do_install() {
             exit 1
         fi
 
-        if [ -f $BUILD_PLAT/$atfbin.bin ]; then
+        if [ -f ${BUILD_PLAT}/$atfbin.bin ]; then
             echo "Install $atfbin.bin"
-            install -m 0644 $BUILD_PLAT/$atfbin.bin \
+            install -m 0644 ${BUILD_PLAT}/$atfbin.bin \
                 ${D}/firmware/$atfbin-${TFA_PLATFORM}.bin
             ln -sf $atfbin-${TFA_PLATFORM}.bin ${D}/firmware/$atfbin.bin
             processes="1"
         fi
-        if [ -f $BUILD_PLAT/$atfbin/$atfbin.elf ]; then
+        if [ -f ${BUILD_PLAT}/$atfbin/$atfbin.elf ]; then
             echo "Install $atfbin.elf"
-            install -m 0644 $BUILD_PLAT/$atfbin/$atfbin.elf \
+            install -m 0644 ${BUILD_PLAT}/$atfbin/$atfbin.elf \
                 ${D}/firmware/$atfbin-${TFA_PLATFORM}.elf
             ln -sf $atfbin-${TFA_PLATFORM}.elf ${D}/firmware/$atfbin.elf
             processes="1"
         fi
-        if [ -f $BUILD_PLAT/$atfbin ]; then
+        if [ -f ${BUILD_PLAT}/$atfbin ]; then
             echo "Install $atfbin"
-            install -m 0644 $BUILD_PLAT/$atfbin \
+            install -m 0644 ${BUILD_PLAT}/$atfbin \
                 ${D}/firmware/$atfbin-${TFA_PLATFORM}
             ln -sf $atfbin-${TFA_PLATFORM} ${D}/firmware/$atfbin
             processes="1"
diff --git a/meta-arm/recipes-bsp/u-boot/u-boot/qemuarm64.cfg b/meta-arm/recipes-bsp/u-boot/u-boot/qemuarm64.cfg
new file mode 100644
index 0000000..de0c6ec
--- /dev/null
+++ b/meta-arm/recipes-bsp/u-boot/u-boot/qemuarm64.cfg
@@ -0,0 +1,4 @@
+CONFIG_TFABOOT=y
+# This must match the address that TF-A jumps to for BL33
+CONFIG_SYS_TEXT_BASE=0x60000000
+
diff --git a/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
new file mode 100644
index 0000000..afcd70a
--- /dev/null
+++ b/meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -0,0 +1,3 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI_append_qemuarm64-secureboot = " file://qemuarm64.cfg"
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto-dev.bbappend b/meta-arm/recipes-kernel/linux/linux-yocto-dev.bbappend
new file mode 100644
index 0000000..c7742f8
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-yocto-dev.bbappend
@@ -0,0 +1,4 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI_append_qemuarm64-secureboot = " file://tee.cfg"
+
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto-dev/tee.cfg b/meta-arm/recipes-kernel/linux/linux-yocto-dev/tee.cfg
new file mode 100644
index 0000000..7415e18
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-yocto-dev/tee.cfg
@@ -0,0 +1,4 @@
+CONFIG_HW_RANDOM_OPTEE=m
+CONFIG_TEE=m
+CONFIG_OPTEE=m
+CONFIG_OPTEE_SHM_NUM_PRIV_PAGES=10
diff --git a/meta-arm/recipes-security/optee/optee-os_git.bb b/meta-arm/recipes-security/optee/optee-os_git.bb
index d58b89f..5e3c59a 100644
--- a/meta-arm/recipes-security/optee/optee-os_git.bb
+++ b/meta-arm/recipes-security/optee/optee-os_git.bb
@@ -22,6 +22,8 @@ S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
 
 OPTEEMACHINE ?= "${MACHINE}"
+OPTEEMACHINE_aarch64_qemuall = "vexpress-qemu_armv8a"
+OPTEEMACHINE_armv7a_qemuall = "vexpress-qemu_virt"
 OPTEE_ARCH = "null"
 OPTEE_ARCH_armv7a = "arm32"
 OPTEE_ARCH_aarch64 = "arm64"
@@ -74,6 +76,8 @@ do_deploy() {
 
 addtask deploy before do_build after do_install
 
+SYSROOT_DIRS += "${nonarch_base_libdir}/firmware"
+
 FILES_${PN} = "${nonarch_base_libdir}/firmware/"
 FILES_${PN}-dev = "${includedir}/optee/"
 
diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/recipes-security/optee/optee.inc
index b3e5271..3138148 100644
--- a/meta-arm/recipes-security/optee/optee.inc
+++ b/meta-arm/recipes-security/optee/optee.inc
@@ -1,2 +1,2 @@
-COMPATIBLE_MACHINE ?= "invalid"
+COMPATIBLE_MACHINE = "qemuarm64"
 # Please add supported machines below or set it in .bbappend or .conf
diff --git a/meta-arm/wic/qemuarm64.wks b/meta-arm/wic/qemuarm64.wks
new file mode 100644
index 0000000..7285279
--- /dev/null
+++ b/meta-arm/wic/qemuarm64.wks
@@ -0,0 +1,4 @@
+bootloader --ptable gpt
+
+part /boot --ondisk=vda --align 64 --size=100M --active --source bootimg-partition --fstype=ext4 --label boot --sourceparams="loader=u-boot"
+part /     --ondisk=vda                                 --source rootfs            --fstype=ext4 --label root
-- 
2.17.1

