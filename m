Return-Path: <gowtham.sureshkumar@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51008C7EE32
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 14:42:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.24978.1677595338265266394
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 28 Feb 2023 06:42:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gowtham.sureshkumar@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EEC69C14;
	Tue, 28 Feb 2023 06:43:00 -0800 (PST)
Received: from e126345.cambridge.arm.com (e126345.cambridge.arm.com [10.1.32.131])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C948F3F67D;
	Tue, 28 Feb 2023 06:42:16 -0800 (PST)
From: gowtham.sureshkumar@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>,
	Jon Mason <jon.mason@arm.com>
Subject: [PATCH langdale 2/6] arm-bsp/uefi_capsule: Add UEFI capsule generation class
Date: Tue, 28 Feb 2023 14:41:48 +0000
Message-Id: <20230228144152.17041-3-gowtham.sureshkumar@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230228144152.17041-1-gowtham.sureshkumar@arm.com>
References: <20230228144152.17041-1-gowtham.sureshkumar@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 28 Feb 2023 14:42:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4460

From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>

This class currently supports only a single firmware binary. The
required capsule parameters needs to be set, if not the build fails.

Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/classes/uefi_capsule.bbclass | 46 +++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 meta-arm/classes/uefi_capsule.bbclass

diff --git a/meta-arm/classes/uefi_capsule.bbclass b/meta-arm/classes/uefi_capsule.bbclass
new file mode 100644
index 00000000..0c3d3845
--- /dev/null
+++ b/meta-arm/classes/uefi_capsule.bbclass
@@ -0,0 +1,46 @@
+# This class generates UEFI capsules
+# The current class supports generating a capsule with single firmware binary
+
+inherit python3native
+
+IMAGE_TYPES += "uefi_capsule"
+
+# edk2 base tools should be installed in the native sysroot directory
+do_image_uefi_capsule[depends] += "edk2-basetools-native:do_populate_sysroot"
+
+# By default the wic image is used to create a capsule
+CAPSULE_IMGTYPE ?= "wic"
+
+# IMGDEPLOYDIR is used as the default location of firmware binary for which the capsule needs to be created
+CAPSULE_IMGLOCATION ?= "${IMGDEPLOYDIR}"
+
+# The generated capsule by default has uefi.capsule extension
+CAPSULE_EXTENSION ?= "uefi.capsule"
+
+# The following variables must be set to be able to generate a capsule update
+UEFI_FIRMWARE_BINARY ?= ""
+UEFI_FIRMWARE_VERSION ?= ""
+UEFI_FIRMWARE_LSV ?= ""
+UEFI_FIRMWARE_GUID ?= ""
+UEFI_FIRMWARE_UPDATE_INDEX ?= ""
+
+# Check if the required variables are set
+python() {
+    for var in ["UEFI_FIRMWARE_BINARY", "UEFI_FIRMWARE_VERSION", "UEFI_FIRMWARE_LSV", "UEFI_FIRMWARE_GUID", "UEFI_FIRMWARE_UPDATE_INDEX"]:
+        if not d.getVar(var):
+            raise bb.parse.SkipRecipe(f"{var} not set")
+}
+
+IMAGE_CMD:uefi_capsule(){
+
+    # Force the GenerateCapsule script to use python3
+    export PYTHON_COMMAND=${PYTHON}
+
+    ${STAGING_DIR_NATIVE}/usr/bin/edk2-BaseTools/BinWrappers/PosixLike/GenerateCapsule -e -o \
+    ${CAPSULE_IMGLOCATION}/${UEFI_FIRMWARE_BINARY}.${CAPSULE_EXTENSION} --fw-version ${UEFI_FIRMWARE_VERSION} \
+    --lsv ${UEFI_FIRMWARE_LSV} --guid ${UEFI_FIRMWARE_GUID} --verbose --update-image-index \
+    ${UEFI_FIRMWARE_UPDATE_INDEX} --verbose ${CAPSULE_IMGLOCATION}/${UEFI_FIRMWARE_BINARY}
+}
+
+# The firmware binary should be created before generating the capsule
+IMAGE_TYPEDEP:uefi_capsule:append = "${CAPSULE_IMGTYPE}"
-- 
2.17.1


