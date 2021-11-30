Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41DD6C433FE
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 17:33:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.79508.1638293624545779720
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Nov 2021 09:33:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3526F106F;
	Tue, 30 Nov 2021 09:33:44 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.3.254])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D438A3F694;
	Tue, 30 Nov 2021 09:33:42 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 2/2] arm-bsp/optee-os: corstone1000: enabling smm-gateway
 partition
Date: Tue, 30 Nov 2021 17:33:31 +0000
Message-Id: <20211130173331.8848-3-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211130173331.8848-1-abdellatif.elkhlifi@arm.com>
References: <20211130173331.8848-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Nov 2021 17:33:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2494

From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>

This commit enables smm-gateway in optee-os by making the following changes:

- Updating the existing SP manifest file with a combined manifest file
  that includes information about both se-proxy and SMM gateway SP.
- Including the SMM gateway SP makefile in optee include file
  to embed smm gateway sp binary into optee image.

Change-Id: Iebcf2c534a9e9ced411c943ff583b522ad9d69fa
Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../corstone1000/sp_manifest_combined_se.dts  | 41 +++++++++++++++++++
 .../optee/optee-os_corstone1000.inc           |  8 +++-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/sp_manifest_combined_se.dts

diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/sp_manifest_combined_se.dts b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/sp_manifest_combined_se.dts
new file mode 100644
index 0000000..c11a8e6
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/sp_manifest_combined_se.dts
@@ -0,0 +1,41 @@
+/*
+* Copyright (c) 2021, Arm Limited and Contributors. All rights reserved.
+*
+* SPDX-License-Identifier: BSD-3-Clause
+*/
+
+/dts-v1/;
+
+/ {
+    se-proxy{
+        compatible = "arm,ffa-manifest-1.0";
+        ffa-version = <0x00010000>; /* 31:16 - Major, 15:0 - Minor */
+        uuid = <0x46bb39d1 0xb4d945b5 0x88ff0400 0x27dab249>;
+        description = "SE Proxy";
+        execution-ctx-count = <1>;
+        exception-level = <1>; /* S-EL0 */
+        execution-state = <0>; /* AArch64 */
+        xlat-granule = <0>; /* 4KiB */
+        messaging-method = <0>; /* Direct messaging only */
+    };
+    smm-gateway{
+        compatible = "arm,ffa-manifest-1.0";
+        ffa-version = <0x00010000>; /* 31:16 - Major, 15:0 - Minor */
+        uuid = <0xed32d533 0x99e64209 0x9cc02d72 0xcdd998a7>;
+        description = "SMM Gateway";
+        execution-ctx-count = <1>;
+        exception-level = <1>; /* S-EL0 */
+        execution-state = <0>; /* AArch64 */
+        xlat-granule = <0>; /* 4KiB */
+        messaging-method = <0>; /* Direct messaging only */
+		device-regions {
+          compatible = "arm,ffa-manifest-device-regions";
+          mm-comm-buffer {
+              /* Armv8 A Foundation Platform values */
+              base-address = <0x00000000 0x02000000>;
+              pages-count = <1>;
+              attributes = <0x3>; /* read-write */
+              };
+		};
+    };
+};
\ No newline at end of file
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_corstone1000.inc b/meta-arm-bsp/recipes-security/optee/optee-os_corstone1000.inc
index eb4d6af..8e13d50 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os_corstone1000.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_corstone1000.inc
@@ -9,5 +9,11 @@ EXTRA_OEMAKE += "'TS_INSTALL_PREFIX=${TS_INSTALL_PREFIX_PATH}'"
 # se-proxy secure partition
 SP_MKFILE_PATH="${TS_INSTALL_PREFIX}/lib/make/se-proxy.mk"
 
+# smm-gateway secure partition
+SP_MKFILE_PATH += "${TS_INSTALL_PREFIX}/lib/make/smm-gateway.mk"
+
 EXTRA_OEMAKE += "'CFG_SP_MKFILE_PATH=${SP_MKFILE_PATH}'"
-EXTRA_OEMAKE += "'CFG_EMBED_DTB_SOURCE_FILE=${TS_INSTALL_PREFIX_PATH}/manifest/46bb39d1-b4d9-45b5-88ff-040027dab249.dts'"
+
+SRC_URI:append = " file://sp_manifest_combined_se.dts;subdir=${S}"
+EMBED_DTB_SOURCE_FILE = "${S}/sp_manifest_combined_se.dts"
+EXTRA_OEMAKE += "CFG_EMBED_DTB_SOURCE_FILE=${EMBED_DTB_SOURCE_FILE}"
-- 
2.17.1


