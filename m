Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E3A0C433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Oct 2021 11:28:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.4101.1635506909652156413
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 Oct 2021 04:28:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 536DF1FB;
	Fri, 29 Oct 2021 04:28:29 -0700 (PDT)
Received: from e121910.arm.com (unknown [10.57.80.198])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 73B163F5A1;
	Fri, 29 Oct 2021 04:28:27 -0700 (PDT)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Arpita.S.K@arm.com,
	Jon.Mason@arm.com,
	Ross.Burton@arm.com,
	Vishnu.Banavath@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Satish Kumar <satish.kumar01@arm.com>
Subject: [PATCH 09/13] arm-bsp/trusted-firmware-m: corstone1000: signing
 trusted-firmware-a binaries
Date: Fri, 29 Oct 2021 12:27:49 +0100
Message-Id: <20211029112753.8231-10-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211029112753.8231-1-abdellatif.elkhlifi@arm.com>
References: <20211029112753.8231-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 29 Oct 2021 11:28:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2322

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

This commit allows to sign trusted-firmware-a BL2 and FIP using MCUBOOT
tools.

Change-Id: Ide3045982f5f8515c1ccd59b6b0d29816fbfdd68
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
---
 .../conf/machine/include/corstone1000.inc     | 12 +++++
 .../trusted-firmware-a-corstone1000.inc       |  3 ++
 .../trusted-firmware-m-corstone1000.inc       | 19 +++++++
 .../trusted-firmware-m-sign-host-images.inc   | 50 +++++++++++++++++++
 4 files changed, 84 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-sign-host-images.inc

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-arm-bsp/conf/machine/include/corstone1000.inc
index 0cc315b..753347d 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -7,11 +7,23 @@ TFA_PLATFORM = "corstone1000"
 PREFERRED_VERSION_trusted-firmware-a ?= "2.5%"
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a"
 
+TFA_BL2_BINARY = "bl2-corstone1000.bin"
+TFA_FIP_BINARY = "fip-corstone1000.bin"
+
 # TF-M
 PREFERRED_VERSION_trusted-firmware-m ?= "1.4%"
 TFM_PLATFORM = "arm/corstone1000"
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-m"
 
+# TF-M settings for signing host images
+TFA_BL2_RE_IMAGE_LOAD_ADDRESS = "0x62353000"
+TFA_BL2_RE_SIGN_BIN_SIZE = "0x2d000"
+TFA_FIP_RE_IMAGE_LOAD_ADDRESS = "0x68130000"
+TFA_FIP_RE_SIGN_BIN_SIZE = "0x00200000"
+RE_LAYOUT_WRAPPER_VERSION = "0.0.7"
+TFM_SIGN_PRIVATE_KEY = "${S}/bl2/ext/mcuboot/root-RSA-3072_1.pem"
+RE_IMAGE_OFFSET = "0x1000"
+
 # u-boot
 PREFERRED_VERSION_u-boot ?= "2021.07"
 EXTRA_IMAGEDEPENDS += "u-boot"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc
index 44f2696..833396e 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc
@@ -45,3 +45,6 @@ EXTRA_OEMAKE:append = " \
                         BL32=${RECIPE_SYSROOT}/lib/firmware/tee-pager_v2.bin \
                         LOG_LEVEL=50 \
                         "
+
+# trigger TF-M build so TF-A binaries get signed
+do_deploy[depends]+= "virtual/trusted-firmware-m:do_prepare_recipe_sysroot"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc
index 1967365..997859c 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-corstone1000.inc
@@ -17,6 +17,13 @@ SRCREV_tfm = "ccd82e35f539c0d7261b2935d6d30c550cfc6736"
 
 SRCREV_FORMAT = "tfm_mcuboot_tfm-tests_mbedtls"
 
+# The install task signs the TF-A BL2 and FIP binaries.
+# So they need to be copied to the sysroot. Hence the dependencies below:
+do_prepare_recipe_sysroot[depends]+= "virtual/trusted-firmware-a:do_populate_sysroot"
+
+# adding host images signing support
+require trusted-firmware-m-sign-host-images.inc
+
 do_install() {
   if [ ! -d "${B}/install/outputs/ARM/CORSTONE1000" ]
   then
@@ -27,4 +34,16 @@ do_install() {
   install -D -p -m 0644 ${B}/install/outputs/ARM/CORSTONE1000/bl2_signed.bin ${D}/firmware/bl2_signed.bin
   install -D -p -m 0644 ${B}/install/outputs/ARM/CORSTONE1000/bl1.bin ${D}/firmware/bl1.bin
 
+  #
+  # Signing TF-A BL2 and the FIP image
+  #
+
+  sign_host_image ${TFA_BL2_BINARY} ${RECIPE_SYSROOT}/firmware ${TFA_BL2_RE_IMAGE_LOAD_ADDRESS} ${TFA_BL2_RE_SIGN_BIN_SIZE}
+
+  fiptool update \
+      --tb-fw ${D}/firmware/signed_${TFA_BL2_BINARY} \
+      ${RECIPE_SYSROOT}/firmware/${TFA_FIP_BINARY}
+
+  sign_host_image ${TFA_FIP_BINARY} ${RECIPE_SYSROOT}/firmware ${TFA_FIP_RE_IMAGE_LOAD_ADDRESS} ${TFA_FIP_RE_SIGN_BIN_SIZE}
+
 }
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-sign-host-images.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-sign-host-images.inc
new file mode 100644
index 0000000..49af356
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-sign-host-images.inc
@@ -0,0 +1,50 @@
+# Signing host images using TF-M tools
+
+DEPENDS += "python3-imgtool-native fiptool-native"
+
+#
+# sign_host_image
+#
+# Description:
+#
+# A generic function that signs a host image
+# using MCUBOOT format
+#
+# Arguments:
+#
+# $1 ... host binary to sign
+# $2 ... host binary path
+# $3 ... load address of the given binary
+# $4 ... signed binary size
+#
+# Note: The signed binary is copied to ${D}/firmware
+#
+sign_host_image() {
+
+    host_binary_filename="`basename -s .bin ${1}`"
+    host_binary_layout="${host_binary_filename}_ns"
+
+    cat << EOF > ${B}/${host_binary_layout}
+enum image_attributes {
+    RE_IMAGE_LOAD_ADDRESS = ${3},
+    RE_SIGN_BIN_SIZE = ${4},
+};
+EOF
+
+    host_binary="${2}/`basename ${1}`"
+    host_binary_signed="${D}/firmware/signed_`basename ${1}`"
+
+    ${PYTHON} ${S}/bl2/ext/mcuboot/scripts/wrapper/wrapper.py \
+            -v ${RE_LAYOUT_WRAPPER_VERSION} \
+            --layout ${B}/${host_binary_layout} \
+            -k  ${TFM_SIGN_PRIVATE_KEY} \
+            --public-key-format full \
+            --align 1 \
+            --pad \
+            --pad-header \
+            -H ${RE_IMAGE_OFFSET} \
+            -s auto \
+            ${host_binary} \
+            ${host_binary_signed}
+
+}
-- 
2.17.1


