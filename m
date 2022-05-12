Return-Path: <vishnu.banavath@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C3EFC433F5
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 16:41:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.223.1652373701046891147
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 12 May 2022 09:41:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: vishnu.banavath@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7EEB3113E;
	Thu, 12 May 2022 09:41:40 -0700 (PDT)
Received: from e125903.cambridge.arm.com (e125903.cambridge.arm.com
 [10.1.195.30])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C51A63F73D;
	Thu, 12 May 2022 09:41:39 -0700 (PDT)
From: vishnu.banavath@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH kirkstone 1/1] arm-bsp/tf-a-tests: Add recipe to build and
 install TFTF
Date: Thu, 12 May 2022 17:41:29 +0100
Message-Id: <20220512164129.28438-2-vishnu.banavath@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220512164129.28438-1-vishnu.banavath@arm.com>
References: <20220512164129.28438-1-vishnu.banavath@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 12 May 2022 16:41:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3392

From: Vishnu Banavath <vishnu.banavath@arm.com>

TFTF is TF-A tests that runs at NS-EL2. This is primarily developed to
test the TF-A interfaces exposed to NS code.

Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
---
 .gitlab-ci.yml                                |  2 +-
 ci/tftf.yml                                   |  7 +++
 kas/corstone1000-base.yml                     |  2 +-
 kas/tftf.yml                                  |  7 +++
 .../conf/machine/include/corstone1000.inc     |  1 -
 .../tf-a-tests_2.6.bbappend                   |  3 ++
 .../trusted-firmware-a-corstone1000.inc       |  2 +-
 .../trusted-firmware-a/tf-a-tests_2.6.bb      | 53 +++++++++++++++++++
 .../trusted-firmware-a/trusted-firmware-a.inc |  4 ++
 9 files changed, 77 insertions(+), 4 deletions(-)
 create mode 100644 ci/tftf.yml
 create mode 100644 kas/tftf.yml
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.6.bbappend
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.6.bb

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index fcc405c6..127a35bb 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -82,7 +82,7 @@ corstone1000-fvp:
   extends: .build
   parallel:
     matrix:
-      - TESTING: testimage
+      - TESTING: [testimage,tftf]
   tags:
     - x86_64
 
diff --git a/ci/tftf.yml b/ci/tftf.yml
new file mode 100644
index 00000000..6e42d9c6
--- /dev/null
+++ b/ci/tftf.yml
@@ -0,0 +1,7 @@
+header:
+  version: 9
+
+local_conf_header:
+  tftf: |
+    TFA_UBOOT = "0"
+    TFTF_TESTS = "1"
diff --git a/kas/corstone1000-base.yml b/kas/corstone1000-base.yml
index 64e3aaf1..181ae8ba 100644
--- a/kas/corstone1000-base.yml
+++ b/kas/corstone1000-base.yml
@@ -31,7 +31,7 @@ repos:
 
   meta-arm-image:
      url: https://git.gitlab.arm.com/arm-reference-solutions/meta-arm-image.git
-     refspec: 9f611833ef58394b707836d69356c4e27d0265fc 
+     refspec: e075959fd718bc3dcedf68965eb9f9205b88d5d0
 
 local_conf_header:
   base: |
diff --git a/kas/tftf.yml b/kas/tftf.yml
new file mode 100644
index 00000000..6e42d9c6
--- /dev/null
+++ b/kas/tftf.yml
@@ -0,0 +1,7 @@
+header:
+  version: 9
+
+local_conf_header:
+  tftf: |
+    TFA_UBOOT = "0"
+    TFTF_TESTS = "1"
diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-arm-bsp/conf/machine/include/corstone1000.inc
index 1faccd0b..28b348b9 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -65,4 +65,3 @@ SERIAL_CONSOLES ?= "115200;ttyAMA0"
 WKS_FILE_DEPENDS:append = " ${EXTRA_IMAGEDEPENDS}"
 
 WKS_FILE ?= "corstone1000-image.corstone1000.wks"
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.6.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.6.bbappend
new file mode 100644
index 00000000..ff22ff12
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.6.bbappend
@@ -0,0 +1,3 @@
+# Machine specific TFAs
+
+COMPATIBLE_MACHINE:corstone1000 = "corstone1000"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc
index e59d31a7..ac4a412c 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc
@@ -11,7 +11,7 @@ SRC_URI:remove = " \
      "  
 
 TFA_DEBUG = "1"
-TFA_UBOOT = "1"
+TFA_UBOOT ?= "1"
 TFA_MBEDTLS = "1"
 TFA_BUILD_TARGET = "bl2 bl31 fip"
 
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.6.bb b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.6.bb
new file mode 100644
index 00000000..2da61165
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.6.bb
@@ -0,0 +1,53 @@
+DESCRIPTION = "Trusted Firmware-A tests(aka TFTF)"
+LICENSE = "BSD-3-Clause & NCSA"
+
+LIC_FILES_CHKSUM += "file://docs/license.rst;md5=6175cc0aa2e63b6d21a32aa0ee7d1b4a"
+
+inherit deploy
+
+COMPATIBLE_MACHINE ?= "invalid"
+
+SRC_URI = "git://git.trustedfirmware.org/TF-A/tf-a-tests.git;protocol=https;branch=master"
+# post v2.6 snapshot
+SRCREV ?= "af5a517ae9f295455122109100fe5d55668e8eaf"
+PV .= "+git${SRCPV}"
+
+DEPENDS += "optee-os"
+
+EXTRA_OEMAKE += "USE_NVM=0"
+EXTRA_OEMAKE += "SHELL_COLOR=1"
+EXTRA_OEMAKE += "DEBUG=1"
+
+# Platform must be set for each machine
+TFA_PLATFORM ?= "invalid"
+
+EXTRA_OEMAKE += "ARCH=aarch64"
+EXTRA_OEMAKE += "LOG_LEVEL=50"
+
+S = "${WORKDIR}/git"
+B = "${WORKDIR}/build"
+
+# Add platform parameter
+EXTRA_OEMAKE += "BUILD_BASE=${B} PLAT=${TFA_PLATFORM}"
+
+# Requires CROSS_COMPILE set by hand as there is no configure script
+export CROSS_COMPILE="${TARGET_PREFIX}"
+
+do_compile() {
+    oe_runmake -C ${S} tftf
+}
+
+do_compile[cleandirs] = "${B}"
+
+FILES:${PN} = "/firmware/tftf.bin"
+SYSROOT_DIRS += "/firmware"
+
+do_install() {
+    install -d -m 755 ${D}/firmware
+    install -m 0644 ${B}/${TFA_PLATFORM}/debug/tftf.bin ${D}/firmware/tftf.bin
+}
+
+do_deploy() {
+    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
+}
+addtask deploy after do_install
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 9f588a71..2e3b50c5 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -135,6 +135,10 @@ EXTRA_OEMAKE += "${@bb.utils.contains('TFA_UBOOT', '1', 'BL33=${DEPLOY_DIR_IMAGE
 DEPENDS += " ${@bb.utils.contains('TFA_UEFI', '1', 'edk2-firmware', '', d)}"
 EXTRA_OEMAKE += "${@bb.utils.contains('TFA_UEFI', '1', 'BL33=${RECIPE_SYSROOT}/firmware/uefi.bin', '', d)}"
 
+# TFTF test support
+DEPENDS += " ${@bb.utils.contains('TFTF_TESTS', '1', 'tf-a-tests', '', d)}"
+EXTRA_OEMAKE += "${@bb.utils.contains('TFTF_TESTS', '1', 'BL33=${RECIPE_SYSROOT}/firmware/tftf.bin', '',d)}"
+
 # Hafnium support
 SEL2_SPMC = "${@'${TFA_SPMD_SPM_AT_SEL2}' if d.getVar('TFA_SPD', True) == 'spmd' else ''}"
 
-- 
2.17.1


