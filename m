Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A7D6C4332F
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 13:36:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.5064.1652880989547498305
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 May 2022 06:36:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11C3B23A
	for <meta-arm@lists.yoctoproject.org>; Wed, 18 May 2022 06:36:29 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E8DBD3F73D
	for <meta-arm@lists.yoctoproject.org>; Wed, 18 May 2022 06:36:28 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/4] arm/scp: remove support for version 2.9
Date: Wed, 18 May 2022 09:36:21 -0400
Message-Id: <20220518133624.24874-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 May 2022 13:36:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3436

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../scp-firmware/scp-firmware_2.10.%.bbappend |  3 +
 .../scp-firmware/scp-firmware_2.9.%.bbappend  | 10 ---
 .../scp-firmware/scp-firmware_2.9.0.bb        | 83 -------------------
 3 files changed, 3 insertions(+), 93 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.9.%.bbappend
 delete mode 100644 meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.9.0.bb

diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.10.%.bbappend b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.10.%.bbappend
index b4f5487d..bb1a48c7 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.10.%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.10.%.bbappend
@@ -2,6 +2,9 @@
 
 MACHINE_SCP_REQUIRE ?= ""
 
+MACHINE_SCP_REQUIRE:juno = "scp-firmware-juno.inc"
+MACHINE_SCP_REQUIRE:n1sdp = "scp-firmware-n1sdp.inc"
+MACHINE_SCP_REQUIRE:sgi575 = "scp-firmware-sgi575.inc"
 MACHINE_SCP_REQUIRE:tc = "scp-firmware-tc.inc"
 
 require ${MACHINE_SCP_REQUIRE}
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.9.%.bbappend b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.9.%.bbappend
deleted file mode 100644
index bb1a48c7..00000000
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.9.%.bbappend
+++ /dev/null
@@ -1,10 +0,0 @@
-# Include machine specific SCP configurations
-
-MACHINE_SCP_REQUIRE ?= ""
-
-MACHINE_SCP_REQUIRE:juno = "scp-firmware-juno.inc"
-MACHINE_SCP_REQUIRE:n1sdp = "scp-firmware-n1sdp.inc"
-MACHINE_SCP_REQUIRE:sgi575 = "scp-firmware-sgi575.inc"
-MACHINE_SCP_REQUIRE:tc = "scp-firmware-tc.inc"
-
-require ${MACHINE_SCP_REQUIRE}
diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.9.0.bb b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.9.0.bb
deleted file mode 100644
index f95d968f..00000000
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.9.0.bb
+++ /dev/null
@@ -1,83 +0,0 @@
-SUMMARY = "SCP and MCP Firmware"
-DESCRIPTION = "Firmware for SCP and MCP software reference implementation"
-HOMEPAGE = "https://github.com/ARM-software/SCP-firmware"
-
-LICENSE = "BSD-3-Clause & Apache-2.0"
-LIC_FILES_CHKSUM = "file://license.md;beginline=5;md5=9db9e3d2fb8d9300a6c3d15101b19731 \
-                    file://contrib/cmsis/git/LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e"
-
-SRC_URI = "gitsm://github.com/ARM-software/SCP-firmware.git;protocol=https;branch=master"
-
-SRCREV  = "77ffab90a9f6071850475087cc5d40610c621126"
-
-PROVIDES += "virtual/control-processor-firmware"
-
-SCP_BUILD_RELEASE   ?= "1"
-SCP_PLATFORM        ?= "invalid"
-SCP_COMPILER        ?= "arm-none-eabi"
-SCP_LOG_LEVEL       ?= "WARN"
-
-INHIBIT_DEFAULT_DEPS = "1"
-DEPENDS = "virtual/arm-none-eabi-gcc-native"
-# For now we only build with GCC, so stop meta-clang trying to get involved
-TOOLCHAIN = "gcc"
-
-SCP_BUILD_STR = "${@bb.utils.contains('SCP_BUILD_RELEASE', '1', 'release', 'debug', d)}"
-
-inherit deploy
-
-B = "${WORKDIR}/build"
-S = "${WORKDIR}/git"
-
-# Allow platform specific copying of only scp or both scp & mcp, default to both
-FW_TARGETS ?= "scp mcp"
-FW_INSTALL ?= "ramfw romfw"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE ?= "invalid"
-
-LDFLAGS[unexport] = "1"
-
-# No configure
-do_configure[noexec] = "1"
-
-EXTRA_OEMAKE = "V=1 \
-                BUILD_PATH='${B}' \
-                PRODUCT='${SCP_PLATFORM}' \
-                MODE='${SCP_BUILD_STR}' \
-                LOG_LEVEL='${SCP_LOG_LEVEL}' \
-                CC='${SCP_COMPILER}-gcc' \
-                AR='${SCP_COMPILER}-ar' \
-                SIZE='${SCP_COMPILER}-size' \
-                OBJCOPY='${SCP_COMPILER}-objcopy' \
-                "
-
-do_compile() {
-    oe_runmake -C "${S}"
-}
-do_compile[cleandirs] += "${B}"
-
-do_install() {
-     install -d ${D}/firmware
-     for FW in ${FW_TARGETS}; do
-        for TYPE in ${FW_INSTALL}; do
-           install -D "${B}/product/${SCP_PLATFORM}/${FW}_${TYPE}/${SCP_BUILD_STR}/bin/${FW}_${TYPE}.bin" "${D}/firmware/"
-           install -D "${B}/product/${SCP_PLATFORM}/${FW}_${TYPE}/${SCP_BUILD_STR}/bin/${FW}_${TYPE}.elf" "${D}/firmware/"
-        done
-     done
-}
-
-FILES:${PN} = "/firmware"
-SYSROOT_DIRS += "/firmware"
-
-FILES:${PN}-dbg += "/firmware/*.elf"
-# Skip QA check for relocations in .text of elf binaries
-INSANE_SKIP:${PN}-dbg = "arch textrel"
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-INHIBIT_PACKAGE_STRIP = "1"
-
-do_deploy() {
-    # Copy the images to deploy directory
-    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
-}
-addtask deploy after do_install
-- 
2.17.1


