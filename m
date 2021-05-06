Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.3840.1620269097167524675
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 May 2021 19:44:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A74A31B
	for <meta-arm@lists.yoctoproject.org>; Wed,  5 May 2021 19:44:56 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C3D883F73B
	for <meta-arm@lists.yoctoproject.org>; Wed,  5 May 2021 19:44:55 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-toolchain/external-arm-toolchains: Update to the latest
Date: Wed,  5 May 2021 22:44:50 -0400
Message-Id: <20210506024450.21428-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

Change-Id: Ifb5933b08acf13663c7a6231582ee21032b92327
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../conf/machine/include/corstone700.inc      |  5 ++++-
 ...rmcompiler_6.13.bb => armcompiler_6.16.bb} |  6 +++---
 ...b => gcc-aarch64-none-elf_10.2-2020.11.bb} |  4 ++--
 .../gcc-arm-none-eabi_10-2020-q4-major.bb     | 20 +++++++++++++++++++
 ... => gcc-arm-none-eabi_9-2020-q2-update.bb} |  6 +++---
 5 files changed, 32 insertions(+), 9 deletions(-)
 rename meta-arm-toolchain/recipes-devtools/external-arm-toolchain/{armcompiler_6.13.bb => armcompiler_6.16.bb} (91%)
 rename meta-arm-toolchain/recipes-devtools/external-arm-toolchain/{gcc-aarch64-none-elf_9.2-2019.12.bb => gcc-aarch64-none-elf_10.2-2020.11.bb} (83%)
 create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_10-2020-q4-major.bb
 rename meta-arm-toolchain/recipes-devtools/external-arm-toolchain/{gcc-arm-none-eabi_9-2019-q4-major.bb => gcc-arm-none-eabi_9-2020-q2-update.bb} (73%)

diff --git a/meta-arm-bsp/conf/machine/include/corstone700.inc b/meta-arm-bsp/conf/machine/include/corstone700.inc
index 9e79e10..a36383f 100644
--- a/meta-arm-bsp/conf/machine/include/corstone700.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone700.inc
@@ -13,6 +13,9 @@ PREFERRED_VERSION_linux-yocto ?= "5.6%"
 
 PREFERRED_VERSION_trusted-firmware-a ?= "2.4%"
 
+#PREFERRED_PROVIDER_virtual/arm-none-eabi-gcc-native ?= "gcc-arm-none-eabi"
+PREFERRED_VERSION_gcc-arm-none-eabi-native ?= "9-2020-q2-update"
+
 PREFERRED_PROVIDER_virtual/control-processor-firmware ?= "boot-firmware"
 
 EXTRA_IMAGEDEPENDS += " \
@@ -29,4 +32,4 @@ WKS_FILE ?= "arm-reference-image.corstone700.wks"
 VIRTUAL-RUNTIME_dev_manager = "busybox-mdev"
 
 UBOOT_MACHINE ?= "corstone700_defconfig"
-PREFERRED_VERSION_u-boot ?= "2020.04"
\ No newline at end of file
+PREFERRED_VERSION_u-boot ?= "2020.04"
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompiler_6.13.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompiler_6.16.bb
similarity index 91%
rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompiler_6.13.bb
rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompiler_6.16.bb
index 8fbb8d0..b954e76 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompiler_6.13.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompiler_6.16.bb
@@ -24,14 +24,14 @@ LIC_FILES_CHKSUM = "file://license_terms/license_agreement.txt;md5=40cd57dbb1f9d
 
 PROVIDES = "virtual/armcompiler"
 
-ARMCLANG_VERSION = "DS500-BN-00026-r5p0-15rel0"
+ARMCLANG_VERSION = "DS500-BN-00026-r5p0-18rel0"
 
 COMPATIBLE_HOST = "x86_64.*-linux"
 
 SRC_URI = "https://developer.arm.com/-/media/Files/downloads/compiler/${ARMCLANG_VERSION}.tgz;subdir=${ARMCLANG_VERSION}"
 
-SRC_URI[md5sum] = "fbed6edf5eb211c45df7b8548a10535a"
-SRC_URI[sha256sum] = "de3947525d9846a09cca52cfa84eb880e73f04398b778e4e599366d4c2416596"
+SRC_URI[md5sum] = "d41d8cd98f00b204e9800998ecf8427e"
+SRC_URI[sha256sum] = "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
 
 S = "${WORKDIR}/${ARMCLANG_VERSION}"
 
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.2-2020.11.bb
similarity index 83%
rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.2-2020.11.bb
index 5df3727..5cbab9e 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.2-2020.11.bb
@@ -15,8 +15,8 @@ LIC_FILES_CHKSUM_x86-64 = "file://share/doc/gcc/Copying.html;md5=c1df856e21b17e5
 PROVIDES = "virtual/aarch64-none-elf-gcc"
 
 SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-a/${PV}/binrel/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=gnu-a-${HOST_ARCH}"
-SRC_URI[gnu-a-x86_64.sha256sum] = "36d2cbe7c2984f2c20f562ac2f3ba524c59151adfa8ee10f1326c88de337b6d1"
-SRC_URI[gnu-a-aarch64.sha256sum] = "041ca53bdd434b1a48f32161e957da1b84543c373d1881e2fd84a1579f87f243"
+SRC_URI[gnu-a-x86_64.sha256sum] = "32abfbc7b24c56542f2a6e6969d6b8787e47f7223e8f2097d84151ebd9f86743"
+SRC_URI[gnu-a-aarch64.sha256sum] = "4f9f060e2ca993ec9564054e17b6fdeacb47260e983f766f84f157d00345bf29"
 
 S = "${WORKDIR}/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}"
 
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_10-2020-q4-major.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_10-2020-q4-major.bb
new file mode 100644
index 0000000..ffb2a2b
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_10-2020-q4-major.bb
@@ -0,0 +1,20 @@
+# Copyright (C) 2019 Garmin Ltd. or its subsidiaries
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+require arm-binary-toolchain.inc
+
+COMPATIBLE_HOST = "(x86_64|aarch64).*-linux"
+
+SUMMARY = "Baremetal GCC for ARM-R and ARM-M processors"
+LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
+
+LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=c18349634b740b7b95f2c2159af888f5"
+
+PROVIDES = "virtual/arm-none-eabi-gcc"
+
+SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/10-2020q4/${BPN}-${PV}-${HOST_ARCH}-linux.tar.bz2;name=gnu-rm-${HOST_ARCH}"
+SRC_URI[gnu-rm-x86_64.sha256sum] = "21134caa478bbf5352e239fbc6e2da3038f8d2207e089efc96c3b55f1edcd618"
+SRC_URI[gnu-rm-aarch64.sha256sum] = "343d8c812934fe5a904c73583a91edd812b1ac20636eb52de04135bb0f5cf36a"
+
+UPSTREAM_CHECK_URI = "https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads"
+UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>.+)-${HOST_ARCH}-linux\.tar\.\w+"
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2020-q2-update.bb
similarity index 73%
rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2020-q2-update.bb
index a9f8079..4023c48 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2020-q2-update.bb
@@ -12,9 +12,9 @@ LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=c18349634
 
 PROVIDES = "virtual/arm-none-eabi-gcc"
 
-SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/${BPN}-${PV}-${HOST_ARCH}-linux.tar.bz2;name=gnu-rm-${HOST_ARCH}"
-SRC_URI[gnu-rm-x86_64.sha256sum] = "bcd840f839d5bf49279638e9f67890b2ef3a7c9c7a9b25271e83ec4ff41d177a"
-SRC_URI[gnu-rm-aarch64.sha256sum] = "1f5b9309006737950b2218250e6bb392e2d68d4f1a764fe66be96e2a78888d83"
+SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2020q2/${BPN}-${PV}-${HOST_ARCH}-linux.tar.bz2;name=gnu-rm-${HOST_ARCH}"
+SRC_URI[gnu-rm-x86_64.sha256sum] = "5adc2ee03904571c2de79d5cfc0f7fe2a5c5f54f44da5b645c17ee57b217f11f"
+SRC_URI[gnu-rm-aarch64.sha256sum] = "1f4165c25e2cff80e29870f409862487ba470afd436e245ba3c743108e17b8ac"
 
 UPSTREAM_CHECK_URI = "https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads"
 UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>.+)-${HOST_ARCH}-linux\.tar\.\w+"
-- 
2.17.1

