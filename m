Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A39D6C4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 18:25:35 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web11.2667.1713896730385627225
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Apr 2024 11:25:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=pKpsnVJi;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-437274f3bd4so1162021cf.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 23 Apr 2024 11:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1713896729; x=1714501529; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aSGNOTANVrxLmyYQ23CJ1YCbU2pmMDzxQKIoiaXzfXc=;
        b=pKpsnVJiTeDGxnmakYa9HAZoXyjY0ukDVCOzV06iGhMP5O1X5/uXG9BNPcCdQ7h0fN
         ertM1in9wiwO1MKyQCiYjtyR6LfwUQHwLJEj8cNVSuSi0G6LiBhVzOQSvqnNGToUYQ42
         4wLZQVm9zMUVIXv4sPlDd0WPBqoo0rskBa54kAN9wYz/StzQjN9EmEzyDZb5mV/MfWjR
         VYs8AVW6JhVyk+FZXCsq7Twkn2saSvaEAKXAq3n4daf3hebn4f36lCzUNs/4xjGDvPzz
         i1i2gCFxKHYKRjJ8hfP9zI2CkBri92SS7gJNK3+tAaR8jJtctBEQIV75MFBeD5A6P8ej
         v0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713896729; x=1714501529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSGNOTANVrxLmyYQ23CJ1YCbU2pmMDzxQKIoiaXzfXc=;
        b=jWDWqftegBJH7Oh21Uo/ykfUi8WjocmnZyplr1vj5M9fz7x5DWXVbpF6HYAKlHtbWQ
         UbO3X787sXnaH4kHOyFAVkUpA/tSJvaCfRjG/4rzXbzWgEch6QOYVyUowZ/o9XczU7Tg
         GwUso0wl3cPGpNduyYcEXMVphCRkSgmTWOAG9jCdPloUcScmUVbxhEp5d7MX/IQSIXw4
         /pB3DL+ov4lImer+Oo4DJkT3StgOfinK+PPdHRftHw5kBzqmvaBOFBmRdEiSGhNXWYIq
         MJKPXuY2xnlTPgvUTxJiYJ3z+cQvpFNIRkDV1z1WpslFNH7UKWufUvMff5CkRYNpFDnR
         yiaA==
X-Gm-Message-State: AOJu0YytVx9AcmJLI62Kr0gpj2oBehKibCcJlcschBjj5XU5OucBFvS+
	6p1uCZd68Py0QILbcbQkiGR24OZBMP5tam1VCAZFZwjOuBkJO6SUS6DIAPkdrLhXQg1TIuWmtks
	=
X-Google-Smtp-Source: AGHT+IEscFITO0DFqjOnVVCvlspHhcGaVizOlZ75RKGSfvdeHcKFn79c/tYdi1RejHZP0gsvSVPqKQ==
X-Received: by 2002:ac8:588a:0:b0:437:b995:c48a with SMTP id t10-20020ac8588a000000b00437b995c48amr436207qta.22.1713896729069;
        Tue, 23 Apr 2024 11:25:29 -0700 (PDT)
Received: from localhost ([2605:a601:919e:c800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id he28-20020a05622a601c00b00437543e5307sm5404652qtb.40.2024.04.23.11.25.28
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 11:25:28 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] Revert "arm/uefi_capsule: use U-Boot for capsule generation"
Date: Tue, 23 Apr 2024 14:25:16 -0400
Message-Id: <20240423182517.2590896-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240423182517.2590896-1-jon.mason@arm.com>
References: <20240423182517.2590896-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 23 Apr 2024 18:25:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5599

This reverts commit d0d1b96b0a39b973b6b882e561752c1fd7065fc7.
---
 kas/corstone1000-image-configuration.yml      |  5 --
 .../corstone1000-firmware-deploy-image.inc    |  2 +-
 .../corstone1000-flash-firmware-image.bb      | 26 ++--------
 ...h-firmware-image-capsule-update-image.json | 11 +++++
 meta-arm/classes/uefi_capsule.bbclass         | 49 ++++++++++---------
 5 files changed, 41 insertions(+), 52 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/images/files/corstone1000-flash-firmware-image-capsule-update-image.json

diff --git a/kas/corstone1000-image-configuration.yml b/kas/corstone1000-image-configuration.yml
index 0136048476a2..2b2852230b42 100644
--- a/kas/corstone1000-image-configuration.yml
+++ b/kas/corstone1000-image-configuration.yml
@@ -38,8 +38,3 @@ local_conf_header:
 
     # TS PSA API tests commands for crypto, its, ps and iat
     CORE_IMAGE_EXTRA_INSTALL += "packagegroup-ts-tests-psa"
-
-  capsule: |
-    CAPSULE_EXTENSION = "uefi.capsule"
-    CAPSULE_FW_VERSION = "6"
-    CAPSULE_NAME = "${MACHINE}-v${CAPSULE_FW_VERSION}"
diff --git a/meta-arm-bsp/recipes-bsp/images/corstone1000-firmware-deploy-image.inc b/meta-arm-bsp/recipes-bsp/images/corstone1000-firmware-deploy-image.inc
index f959573d8051..2d192745fdf5 100644
--- a/meta-arm-bsp/recipes-bsp/images/corstone1000-firmware-deploy-image.inc
+++ b/meta-arm-bsp/recipes-bsp/images/corstone1000-firmware-deploy-image.inc
@@ -3,7 +3,7 @@ COMPATIBLE_MACHINE = "corstone1000"
 FIRMWARE_BINARIES = "corstone1000-flash-firmware-image-${MACHINE}.wic \
                      bl1.bin \
                      es_flashfw.bin \
-                     ${CAPSULE_NAME}.${CAPSULE_EXTENSION} \
+                     corstone1000-flash-firmware-image-${MACHINE}.wic.uefi.capsule \
                      corstone1000_capsule_cert.crt \
                      corstone1000_capsule_key.key \
                     "
diff --git a/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-image.bb b/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-image.bb
index 0f5ae011049b..5238d1d34fff 100644
--- a/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-image.bb
+++ b/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-image.bb
@@ -12,12 +12,10 @@ IMAGE_FSTYPES = "wic uefi_capsule"
 inherit image
 inherit tfm_sign_image
 inherit uefi_capsule
-inherit deploy
 
 DEPENDS += "external-system \
             trusted-firmware-a \
             trusted-firmware-m \
-            u-boot \
 "
 
 IMAGE_FEATURES = ""
@@ -25,21 +23,9 @@ IMAGE_LINGUAS = ""
 
 PACKAGE_INSTALL = ""
 
-# The generated ${MACHINE}_image.nopt is used instead of the default wic image
-# for the capsule generation. The uefi.capsule image type doesn't have to
-# depend on the wic because of this.
-#
-# The corstone1000_capsule_cert.crt and corstone1000_capsule_key.key are installed
-# by the U-Boot recipe so this recipe has to depend on that.
-CAPSULE_IMGTYPE = ""
-CAPSULE_CERTIFICATE_PATH = "${DEPLOY_DIR_IMAGE}/corstone1000_capsule_cert.crt"
-CAPSULE_GUID:corstone1000-fvp ?= "989f3a4e-46e0-4cd0-9877-a25c70c01329"
-CAPSULE_GUID:corstone1000-mps3 ?= "df1865d1-90fb-4d59-9c38-c9f2c1bba8cc"
-CAPSULE_IMGLOCATION = "${DEPLOY_DIR_IMAGE}"
-CAPSULE_INDEX = "1"
-CAPSULE_MONOTONIC_COUNT = "1"
-CAPSULE_PRIVATE_KEY_PATH = "${DEPLOY_DIR_IMAGE}/corstone1000_capsule_key.key"
-UEFI_FIRMWARE_BINARY = "${B}/${MACHINE}_image.nopt"
+UEFI_FIRMWARE_BINARY = "${IMAGE_LINK_NAME}.${CAPSULE_IMGTYPE}"
+UEFI_CAPSULE_CONFIG = "${THISDIR}/files/${PN}-capsule-update-image.json"
+CAPSULE_IMGTYPE = "wic"
 
 # TF-A settings for signing host images
 TFA_BL2_BINARY = "bl2-corstone1000.bin"
@@ -87,9 +73,3 @@ create_nopt_image() {
 }
 create_nopt_image[depends] += "mc:firmware:linux-yocto:do_deploy"
 do_image_uefi_capsule[prefuncs] += "create_nopt_image"
-
-do_deploy() {
-    install -m 0755 ${B}/${MACHINE}_image.nopt  ${DEPLOYDIR}
-}
-
-addtask deploy after do_image_uefi_capsule
diff --git a/meta-arm-bsp/recipes-bsp/images/files/corstone1000-flash-firmware-image-capsule-update-image.json b/meta-arm-bsp/recipes-bsp/images/files/corstone1000-flash-firmware-image-capsule-update-image.json
new file mode 100644
index 000000000000..0f011ff740cf
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/images/files/corstone1000-flash-firmware-image-capsule-update-image.json
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
index a0709c0fd015..690e7af4c396 100644
--- a/meta-arm/classes/uefi_capsule.bbclass
+++ b/meta-arm/classes/uefi_capsule.bbclass
@@ -1,10 +1,13 @@
 # This class generates UEFI capsules
 # The current class supports generating a capsule with single firmware binary
 
+DEPENDS += "gettext-native"
+inherit python3native
+
 IMAGE_TYPES += "uefi_capsule"
 
-# u-boot-tools should be installed in the native sysroot directory
-do_image_uefi_capsule[depends] += "u-boot-tools-native:do_populate_sysroot"
+# edk2 base tools should be installed in the native sysroot directory
+do_image_uefi_capsule[depends] += "edk2-basetools-native:do_populate_sysroot"
 
 # By default the wic image is used to create a capsule
 CAPSULE_IMGTYPE ?= "wic"
@@ -15,37 +18,37 @@ CAPSULE_IMGLOCATION ?= "${IMGDEPLOYDIR}"
 # The generated capsule by default has uefi.capsule extension
 CAPSULE_EXTENSION ?= "uefi.capsule"
 
-# The generated capsule's name by default is the same as UEFI_FIRMWARE_BINARY
-CAPSULE_NAME ?= "${UEFI_FIRMWARE_BINARY}"
-
 # The following variables must be set to be able to generate a capsule update
-CAPSULE_CERTIFICATE_PATH ?= ""
-CAPSULE_FW_VERSION ?= ""
-CAPSULE_GUID ?= ""
-CAPSULE_INDEX ?= ""
-CAPSULE_MONOTONIC_COUNT ?= ""
-CAPSULE_PRIVATE_KEY_PATH ?= ""
 UEFI_FIRMWARE_BINARY ?= ""
+UEFI_CAPSULE_CONFIG ?= ""
 
 # Check if the required variables are set
 python() {
-    for var in ["CAPSULE_CERTIFICATE_PATH", "CAPSULE_FW_VERSION", \
-                "CAPSULE_GUID", "CAPSULE_INDEX", \
-                "CAPSULE_MONOTONIC_COUNT", "CAPSULE_PRIVATE_KEY_PATH", \
-                "UEFI_FIRMWARE_BINARY"]:
+    for var in ["UEFI_FIRMWARE_BINARY", "UEFI_CAPSULE_CONFIG"]:
         if not d.getVar(var):
             raise bb.parse.SkipRecipe(f"{var} not set")
 }
 
 IMAGE_CMD:uefi_capsule(){
-    mkeficapsule --certificate ${CAPSULE_CERTIFICATE_PATH} \
-                 --fw-version ${CAPSULE_FW_VERSION} \
-                 --guid ${CAPSULE_GUID} \
-                 --index ${CAPSULE_INDEX} \
-                 --monotonic-count ${CAPSULE_MONOTONIC_COUNT} \
-                 --private-key ${CAPSULE_PRIVATE_KEY_PATH} \
-                 ${UEFI_FIRMWARE_BINARY} \
-                 ${CAPSULE_IMGLOCATION}/${CAPSULE_NAME}.${CAPSULE_EXTENSION}
+
+    # Force the GenerateCapsule script to use python3
+    export PYTHON_COMMAND=${PYTHON}
+
+    # Copy the firmware and the capsule config json to current directory
+    if [ -e ${CAPSULE_IMGLOCATION}/${UEFI_FIRMWARE_BINARY} ]; then
+        cp ${CAPSULE_IMGLOCATION}/${UEFI_FIRMWARE_BINARY} . ;
+    fi
+
+    export UEFI_FIRMWARE_BINARY=${UEFI_FIRMWARE_BINARY}
+    envsubst < ${UEFI_CAPSULE_CONFIG} > ./${MACHINE}-capsule-update-image.json
+
+    ${STAGING_DIR_NATIVE}/usr/bin/edk2-BaseTools/BinWrappers/PosixLike/GenerateCapsule \
+    -e -o ${IMGDEPLOYDIR}/${UEFI_FIRMWARE_BINARY}.${CAPSULE_EXTENSION} -j \
+    ${MACHINE}-capsule-update-image.json
+
+    # Remove the firmware to avoid contamination of IMGDEPLOYDIR
+    rm ${UEFI_FIRMWARE_BINARY}
+
 }
 
 # The firmware binary should be created before generating the capsule
-- 
2.30.2


