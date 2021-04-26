Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9843.1619604850221251178
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 28 Apr 2021 03:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 803531FB
	for <meta-arm@lists.yoctoproject.org>; Wed, 28 Apr 2021 03:13:59 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 29EDB3F70D
	for <meta-arm@lists.yoctoproject.org>; Wed, 28 Apr 2021 03:13:59 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm: combine linux-yocto bbappend files
Date: Mon, 26 Apr 2021 10:42:32 -0400
Message-Id: <20210426144232.20737-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

Combining linux-yocto bbappend into a single file.

Change-Id: Ica4fc2d0edc9939451c572e5eb65f34e4002c26f
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend  | 11 -----------
 .../recipes-kernel/linux/linux-yocto_5.10.bbappend    |  9 +++++++++
 2 files changed, 9 insertions(+), 11 deletions(-)
 delete mode 100644 meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend

diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend b/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
deleted file mode 100644
index bc60003..0000000
--- a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
+++ /dev/null
@@ -1,11 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}:${THISDIR}/linux-yocto:"
-
-SRC_URI_append_qemuarm64-sbsa = " \
-    file://defconfig.patch \
-    "
-
-COMPATIBLE_MACHINE_generic-arm64 = "generic-arm64"
-
-SRC_URI_append_generic-arm64 = " \
-    file://defconfig.patch \
-    "
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend b/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
index a538dbb..be2545f 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto_5.10.bbappend
@@ -1,3 +1,12 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
+COMPATIBLE_MACHINE_generic-arm64 = "generic-arm64"
+SRC_URI_append_generic-arm64 = " \
+    file://defconfig.patch \
+    "
+
+SRC_URI_append_qemuarm64-sbsa = " \
+    file://defconfig.patch \
+    "
+
 SRC_URI_append_qemuarm64-secureboot = " file://zone_dma_revert.patch"
-- 
2.17.1

