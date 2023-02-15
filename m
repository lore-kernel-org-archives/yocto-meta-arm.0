Return-Path: <gowtham.sureshkumar@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 934F3C636D4
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 19:37:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2650.1676489839818205624
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 15 Feb 2023 11:37:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gowtham.sureshkumar@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD58E1042;
	Wed, 15 Feb 2023 11:38:01 -0800 (PST)
Received: from e126345.arm.com (unknown [10.57.47.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0CAAC3F663;
	Wed, 15 Feb 2023 11:37:17 -0800 (PST)
From: gowtham.sureshkumar@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
Subject: [PATCH 1/1] arm-bsp/uefi_capsule: Use json file to pass capsule config
Date: Wed, 15 Feb 2023 19:37:06 +0000
Message-Id: <20230215193706.2341-1-gowtham.sureshkumar@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 15 Feb 2023 19:37:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4397

From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>

This patch uses the json config file for UEFI capsule generation
as this is efficient and easily scalable to generate multiple
capsules.

Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
---
 .../recipes-bsp/images/corstone1000-image.bb  |  8 +++---
 ...rstone1000-image-capsule-update-image.json | 11 ++++++++
 meta-arm/classes/uefi_capsule.bbclass         | 27 ++++++++++++-------
 3 files changed, 32 insertions(+), 14 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/images/files/corstone1000-image-capsule-update-image.json

diff --git a/meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb b/meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb
index b0a71bca..932b1619 100644
--- a/meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb
+++ b/meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb
@@ -13,11 +13,9 @@ PACKAGE_INSTALL = ""
 
 IMAGE_FSTYPES += "wic wic.nopt uefi_capsule"
 
-UEFI_FIRMWARE_BINARY = "corstone1000-image-${MACHINE}.wic.nopt"
-UEFI_FIRMWARE_VERSION = "5"
-UEFI_FIRMWARE_LSV = "0"
-UEFI_FIRMWARE_GUID = "e2bb9c06-70e9-4b14-97a3-5a7913176e3f"
-UEFI_FIRMWARE_UPDATE_INDEX = "0"
+UEFI_FIRMWARE_BINARY = "${PN}-${MACHINE}.${CAPSULE_IMGTYPE}"
+UEFI_CAPSULE_CONFIG = "${THISDIR}/files/${PN}-capsule-update-image.json"
+CAPSULE_IMGTYPE = "wic.nopt"
 
 do_sign_images() {
     # Sign TF-A BL2
diff --git a/meta-arm-bsp/recipes-bsp/images/files/corstone1000-image-capsule-update-image.json b/meta-arm-bsp/recipes-bsp/images/files/corstone1000-image-capsule-update-image.json
new file mode 100644
index 00000000..0f011ff7
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/images/files/corstone1000-image-capsule-update-image.json
@@ -0,0 +1,11 @@
+{
+    "Payloads": [
+        {
+            "FwVersion": "5",
+            "Guid": "e2bb9c06-70e9-4b14-97a3-5a7913176e3f",
+            "LowestSupportedVersion": "1",
+            "Payload": "$UEFI_FIRMWARE_BINARY",
+            "UpdateImageIndex": "0"
+        }
+    ]
+}
diff --git a/meta-arm/classes/uefi_capsule.bbclass b/meta-arm/classes/uefi_capsule.bbclass
index 0c3d3845..cf708412 100644
--- a/meta-arm/classes/uefi_capsule.bbclass
+++ b/meta-arm/classes/uefi_capsule.bbclass
@@ -1,6 +1,7 @@
 # This class generates UEFI capsules
 # The current class supports generating a capsule with single firmware binary
 
+DEPENDS += "gettext-native"
 inherit python3native
 
 IMAGE_TYPES += "uefi_capsule"
@@ -19,14 +20,11 @@ CAPSULE_EXTENSION ?= "uefi.capsule"
 
 # The following variables must be set to be able to generate a capsule update
 UEFI_FIRMWARE_BINARY ?= ""
-UEFI_FIRMWARE_VERSION ?= ""
-UEFI_FIRMWARE_LSV ?= ""
-UEFI_FIRMWARE_GUID ?= ""
-UEFI_FIRMWARE_UPDATE_INDEX ?= ""
+UEFI_CAPSULE_CONFIG ?= ""
 
 # Check if the required variables are set
 python() {
-    for var in ["UEFI_FIRMWARE_BINARY", "UEFI_FIRMWARE_VERSION", "UEFI_FIRMWARE_LSV", "UEFI_FIRMWARE_GUID", "UEFI_FIRMWARE_UPDATE_INDEX"]:
+    for var in ["UEFI_FIRMWARE_BINARY", "UEFI_CAPSULE_CONFIG"]:
         if not d.getVar(var):
             raise bb.parse.SkipRecipe(f"{var} not set")
 }
@@ -36,10 +34,21 @@ IMAGE_CMD:uefi_capsule(){
     # Force the GenerateCapsule script to use python3
     export PYTHON_COMMAND=${PYTHON}
 
-    ${STAGING_DIR_NATIVE}/usr/bin/edk2-BaseTools/BinWrappers/PosixLike/GenerateCapsule -e -o \
-    ${CAPSULE_IMGLOCATION}/${UEFI_FIRMWARE_BINARY}.${CAPSULE_EXTENSION} --fw-version ${UEFI_FIRMWARE_VERSION} \
-    --lsv ${UEFI_FIRMWARE_LSV} --guid ${UEFI_FIRMWARE_GUID} --verbose --update-image-index \
-    ${UEFI_FIRMWARE_UPDATE_INDEX} --verbose ${CAPSULE_IMGLOCATION}/${UEFI_FIRMWARE_BINARY}
+    # Copy the firmware and the capsule config json to current directory
+    if [ -e ${CAPSULE_IMGLOCATION}/${UEFI_FIRMWARE_BINARY} ]; then
+        cp ${CAPSULE_IMGLOCATION}/${UEFI_FIRMWARE_BINARY} . ;
+    fi
+
+    export UEFI_FIRMWARE_BINARY=${UEFI_FIRMWARE_BINARY}
+    envsubst < ${UEFI_CAPSULE_CONFIG} > ./${MACHINE}-capsule-update-image.json
+
+    ${STAGING_DIR_NATIVE}/usr/bin/edk2-BaseTools/BinWrappers/PosixLike/GenerateCapsule \
+    -e -o ${UEFI_FIRMWARE_BINARY}.${CAPSULE_EXTENSION} -j \
+    ${MACHINE}-capsule-update-image.json
+
+    # Remove the firmware to avoid contamination of IMGDEPLOYDIR
+    rm ${UEFI_FIRMWARE_BINARY}
+
 }
 
 # The firmware binary should be created before generating the capsule
-- 
2.17.1


