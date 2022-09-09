Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5148AECAAD3
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 11:07:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.595.1662721647978099726
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 09 Sep 2022 04:07:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBB23165C;
	Fri,  9 Sep 2022 04:07:33 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com
 [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E0B793F7B4;
	Fri,  9 Sep 2022 04:07:26 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 1/1] arm-bsp/external-system:corstone1000: build and install
 external-system
Date: Fri,  9 Sep 2022 12:07:16 +0100
Message-Id: <20220909110716.43171-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220909110716.43171-1-emekcan.aras@arm.com>
References: <20220909110716.43171-1-emekcan.aras@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 09 Sep 2022 11:07:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3754

From: Vishnu Banavath <vishnu.banavath@arm.com>

This change is to enable build and installing external-system firmware
for corstone1000 platform.

Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
---
 .../conf/machine/corstone1000-fvp.conf        |  3 ++
 .../conf/machine/include/corstone1000.inc     |  3 ++
 .../external-system/external-system_0.1.0.bb  | 49 +++++++++++++++++++
 3 files changed, 55 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb

diff --git a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf b/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
index e79373de..4433f8bd 100644
--- a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
+++ b/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
@@ -33,6 +33,9 @@ FVP_CONFIG[se.nvm.update_raw_image] ?= "0"
 # Boot image
 FVP_DATA ?= "board.flash0=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.wic.nopt@0x68100000"
 
+# External system (cortex-M3)
+FVP_CONFIG[extsys_harness0.extsys_flashloader.fname] ?= "${DEPLOY_DIR_IMAGE}/es_flashfw.bin"
+
 # FVP Terminals
 FVP_TERMINALS[host.host_terminal_0] ?= "Normal World Console"
 FVP_TERMINALS[host.host_terminal_1] ?= "Secure World Console"
diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-arm-bsp/conf/machine/include/corstone1000.inc
index ec482229..5d22b464 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -43,6 +43,9 @@ OPTEE_BINARY = "tee-pager_v2.bin"
 # Trusted Services(TS)
 EXTRA_IMAGEDEPENDS += "secure-partitions"
 
+# External System(Cortex-M3)
+EXTRA_IMAGEDEPENDS += "external-system"
+
 # Linux kernel
 PREFERRED_PROVIDER_virtual/kernel:forcevariable = "linux-yocto"
 PREFERRED_VERSION_linux-yocto = "5.15%"
diff --git a/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb b/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
new file mode 100644
index 00000000..ce5e7a76
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
@@ -0,0 +1,49 @@
+SUMMARY = "External system Cortex-M3 Firmware"
+DESCRIPTION = "Firmware to be loaded and run in External System Harness in\
+               support to the main application CPU."
+HOMEPAGE = "https://git.linaro.org/landing-teams/working/arm/external-system.git"
+DEPENDS = "gcc-arm-none-eabi-native"
+INHIBIT_DEFAULT_DEPS="1"
+LICENSE = "BSD-3-Clause & Apache-2.0"
+LIC_FILES_CHKSUM = "file://license.md;md5=e44b2531cd6ffe9dece394dbe988d9a0 \
+                    file://cmsis/LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e"
+
+SRC_URI = "gitsm://git.linaro.org/landing-teams/working/arm/external-system.git;protocol=https;branch=master"
+SRCREV = "2057819cd3652b457907ad70f6b951cf10c7a481"
+PV .= "+git${SRCPV}"
+
+COMPATIBLE_MACHINE = "(corstone1000)"
+
+# PRODUCT is passed to the Makefile to specify the platform to be used.
+# platform code is same for corstone700 and corstone1000, hence use the
+# same PRODUCT for both.
+PRODUCT = "corstone-700"
+
+S = "${WORKDIR}/git"
+B = "${WORKDIR}/build"
+
+LDFLAGS[unexport] = "1"
+
+do_compile() {
+    oe_runmake -C ${S} V=y \
+        BUILD_PATH=${B} \
+	PRODUCT=${PRODUCT} \
+	CROSS_COMPILE=arm-none-eabi- \
+        all
+}
+
+do_compile[cleandirs] = "${B}"
+
+do_install() {
+    install -D -p -m 0644 ${B}/product/${PRODUCT}/firmware/release/bin/firmware.bin ${D}/firmware/es_flashfw.bin
+}
+
+FILES:${PN} = "/firmware"
+SYSROOT_DIRS += "/firmware"
+
+inherit deploy
+
+do_deploy() {
+    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
+}
+addtask deploy after do_install
-- 
2.17.1


