Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web10.1201.1589407905068512104
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 May 2020 15:11:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lZlFhbWL;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id f3so861040ioj.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 13 May 2020 15:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=U2gELMU4mb+P3bFdYWaaw3wuozFmFHz0cfoR+5LumeQ=;
        b=lZlFhbWLgF69YgSkRSa8T5cBWg9vuMVU0X7jUaW4mDaA/dq1sxEmCjk4VG7f5+RMMk
         9jJxToD5lXEKWyG5d4zuDd63g6d4kuIkd9dTca95AqaHPdF4pjPE9+3kADe6InC0ZnRS
         dD24V50EiQp8EnFoQ3pcfq6YAEkxeyF1zB084uIdrd7dtJcvSj8pybU5FEdPAtSNwAlQ
         9V5iRA3FvuqWuEGmweTNs4qT7mVKFFGZvZpVOzOeXbeK8qtSInOsYaHOCSm/hUYPKs+o
         xqXuawLyyiM3FaJTT2CGAGYZe5p8IvuYIqsgIXw6toinuBmpuuIMPnpWRIN8+bjOS22h
         8HAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=U2gELMU4mb+P3bFdYWaaw3wuozFmFHz0cfoR+5LumeQ=;
        b=MLqnNg6o+ucgCG5sztwl4eseHS3GovBkLTaXiRFdvzLHbjsldVmClfmFaIAYQlse7j
         b/QeZTgvOGPTQ+Ulw4PAtL9XuSLSXRkHrjDqlzJHcbboRMNsqSN2aELAcrk84S8MnMw+
         NivpAcoaQ4QlRZzkExwcXHtgeo7odfbWWSbc3xXd6eZElZVLsylfc7oqI/5sm7zWKOvn
         cCIl8hLLhql9ZPoC+5ZUHVpM7AEeL3gUFdTrKe7IYwuykmXHpNbHHqw7/O0PnZw1LLXW
         ewl04wrPT8XzkBivN2jpHXTBgvZ2XE/NMKG3/eEs02NNzVmDf+MW6x6uUPz5YrbiboP6
         BsDg==
X-Gm-Message-State: AOAM530C965FqQHIvO6tDfYLYprEHssWWP9kq3eKgUsj6jCvCNA4tn0M
	18mF41VeWAZsY39KQzfKhnOPirRXv4k=
X-Google-Smtp-Source: ABdhPJwtHWSdKrZZhtkfWE82XIuhXvxolgtI0pBtw8pZ+Q/7JmsYfDk9FTAKXMTwJTmWBVodlmE1zw==
X-Received: by 2002:a6b:750c:: with SMTP id l12mr1387288ioh.66.1589407904036;
        Wed, 13 May 2020 15:11:44 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.garmin.com ([2605:a601:ac3d:c100:11af:b72d:1039:51ec])
        by smtp.gmail.com with ESMTPSA id t20sm341890iob.27.2020.05.13.15.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 15:11:41 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [meta-arm][PATCH] Add support for booting qemu with TFA and optee
Date: Wed, 13 May 2020 17:11:34 -0500
Message-Id: <20200513221134.30072-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1

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
 .../recipes-security/optee/optee-os_git.bb    |  6 +++
 meta-arm/recipes-security/optee/optee.inc     |  2 +-
 meta-arm/wic/qemuarm64.wks                    |  4 ++
 7 files changed, 70 insertions(+), 14 deletions(-)
 create mode 100644 meta-arm/conf/machine/qemuarm64-secureboot.conf
 create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot/qemuarm64.cfg
 create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot_%.bbappend
 create mode 100644 meta-arm/wic/qemuarm64.wks

diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/conf/machine/qemuarm64-secureboot.conf
new file mode 100644
index 0000000..cfb358b
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
+QB_DEFAULT_BIOS = "flash.bin-qemu"
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
index 4b5da7a..64497d6 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -7,10 +7,11 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit deploy nopackages
 
-COMPATIBLE_MACHINE ?= "invalid"
+COMPATIBLE_MACHINE = "qemuarm64"
 
 # Platform must be set for each machine
 TFA_PLATFORM ?= "invalid"
+TFA_PLATFORM_aarch64_qemuall = "qemu"
 
 # Build for debug (set TFA_DEBUG to 1 to activate)
 TFA_DEBUG ?= "0"
@@ -35,16 +36,19 @@ SRCREV_FORMAT_append = "${@bb.utils.contains('TFA_MBEDTLS', '1', '_mbedtls', '',
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
@@ -61,6 +65,7 @@ do_configure[noexec] = "1"
 # We need dtc for dtbs compilation
 # We need openssl for fiptool
 DEPENDS_append = " dtc-native openssl-native"
+DEPENDS_append_aarch64_qemuall = " optee-os"
 
 # Add platform parameter
 EXTRA_OEMAKE += "BUILD_BASE=${B} PLAT=${TFA_PLATFORM}"
@@ -76,6 +81,15 @@ DEPENDS += " ${@bb.utils.contains('TFA_UBOOT', '1', 'u-boot', '', d)}"
 do_compile[depends] += " ${@bb.utils.contains('TFA_UBOOT', '1', 'u-boot:do_deploy', '', d)}"
 EXTRA_OEMAKE += "${@bb.utils.contains('TFA_UBOOT', '1', ' BL33=${DEPLOY_DIR_IMAGE}/u-boot.bin', '',d)}"
 
+EXTRA_OEMAKE_append_aarch64_qemuall = " \
+    BL32=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-header_v2.bin \
+    BL32_EXTRA1=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-pager_v2.bin \
+    BL32_EXTRA2=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-pageable_v2.bin \
+    BL32_RAM_LOCATION=tdram \
+    SPD=opteed \
+    "
+BUILD_PLAT = "${B}/${TFA_PLATFORM}/${@"debug" if d.getVar("TFA_DEBUG") == "1" else "release"}/"
+
 # The following hack is needed to fit properly in yocto build environment
 # TFA is forcing the host compiler and its flags in the Makefile using :=
 # assignment for GCC and CFLAGS.
@@ -91,13 +105,12 @@ do_compile() {
 }
 do_compile[cleandirs] = "${B}"
 
-do_install() {
-    if ${@"true" if d.getVar('TFA_DEBUG') == '1' else "false"}; then
-        BUILD_PLAT=${B}/${TFA_PLATFORM}/debug/
-    else
-        BUILD_PLAT=${B}/${TFA_PLATFORM}/release/
-    fi
+do_compile_append_aarch64_qemuall() {
+    dd if=${BUILD_PLAT}/bl1.bin of=${BUILD_PLAT}/flash.bin bs=4096 conv=notrunc
+    dd if=${BUILD_PLAT}/fip.bin of=${BUILD_PLAT}/flash.bin seek=64 bs=4096 conv=notrunc
+}
 
+do_install() {
     install -d -m 755 ${D}/firmware
     for atfbin in ${TFA_INSTALL_TARGET}; do
         if [ "$atfbin" = "all" ]; then
@@ -106,17 +119,17 @@ do_install() {
             bberror "Please specify valid targets in TFA_INSTALL_TARGET or"
             bberror "rewrite or turn off do_install"
             exit 1
-        elif [ -f $BUILD_PLAT/$atfbin.bin ]; then
+        elif [ -f ${BUILD_PLAT}/$atfbin.bin ]; then
             echo "Install $atfbin.bin"
-            install -m 0644 $BUILD_PLAT/$atfbin.bin \
+            install -m 0644 ${BUILD_PLAT}/$atfbin.bin \
                 ${D}/firmware/$atfbin-${TFA_PLATFORM}.bin
-        elif [ -f $BUILD_PLAT/$atfbin/$atfbin.elf ]; then
+        elif [ -f ${BUILD_PLAT}/$atfbin/$atfbin.elf ]; then
             echo "Install $atfbin.elf"
-            install -m 0644 $BUILD_PLAT/$atfbin/$atfbin.elf \
+            install -m 0644 ${BUILD_PLAT}/$atfbin/$atfbin.elf \
                 ${D}/firmware/$atfbin-${TFA_PLATFORM}.elf
-        elif [ -f $BUILD_PLAT/$atfbin ]; then
+        elif [ -f ${BUILD_PLAT}/$atfbin ]; then
             echo "Install $atfbin"
-            install -m 0644 $BUILD_PLAT/$atfbin \
+            install -m 0644 ${BUILD_PLAT}/$atfbin \
                 ${D}/firmware/$atfbin-${TFA_PLATFORM}
         elif [ "$atfbin" = "dtbs" ]; then
             echo "dtbs install, skipped"
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
diff --git a/meta-arm/recipes-security/optee/optee-os_git.bb b/meta-arm/recipes-security/optee/optee-os_git.bb
index dfff6d1..aa51376 100644
--- a/meta-arm/recipes-security/optee/optee-os_git.bb
+++ b/meta-arm/recipes-security/optee/optee-os_git.bb
@@ -21,7 +21,11 @@ SRC_URI = " \
 S = "${WORKDIR}/git"
 
 OPTEEMACHINE ?= "${MACHINE}"
+OPTEEMACHINE_aarch64_qemuall = "vexpress-qemu_armv8a"
+OPTEEMACHINE_armv7a_qemuall = "vexpress-qemu_virt"
+
 OPTEEOUTPUTMACHINE ?= "${MACHINE}"
+OPTEEOUTPUTMACHINE_qemuall = "vexpress"
 
 OPTEE_ARCH = "null"
 OPTEE_ARCH_armv7a = "arm32"
@@ -72,6 +76,8 @@ do_deploy() {
 
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

