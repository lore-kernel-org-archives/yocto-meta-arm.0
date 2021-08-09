Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.7524.1628600075222215782
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 Aug 2021 05:54:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CEE11FB
	for <meta-arm@lists.yoctoproject.org>; Tue, 10 Aug 2021 05:54:29 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7288D3F70D
	for <meta-arm@lists.yoctoproject.org>; Tue, 10 Aug 2021 05:54:29 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/6] arm-bsp: Update kernel recipes to match upstream format
Date: Mon,  9 Aug 2021 19:05:08 -0400
Message-Id: <20210809230513.14521-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

Using recipes-kernel/linux/linux-yocto_5.4.bb as a guide, format the
kernel recipes to match.  This enables easier diffing and updating.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3.bb | 11 +++++++++--
 meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6.bb | 11 +++++++++--
 meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7.bb | 10 ++++++++--
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3.bb b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3.bb
index 9d5e9ce..036cb00 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3.bb
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3.bb
@@ -1,4 +1,4 @@
-KBRANCH = "v5.3/base"
+KBRANCH ?= "v5.3/standard/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
@@ -8,8 +8,15 @@ SRCREV_meta = "8d0ed83a864cc91eef4d2abbc90f13d4ecd1c213"
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION = "5.3.18"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
+LINUX_VERSION = "5.3.18"
+
+DEPENDS += "openssl-native util-linux-native"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
+
 KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "1"
+
+# Functionality flags
+KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6.bb b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6.bb
index d17cb30..33e6dd9 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6.bb
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6.bb
@@ -1,4 +1,4 @@
-KBRANCH = "v5.6/base"
+KBRANCH ?= "v5.6/standard/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
@@ -8,8 +8,15 @@ SRCREV_meta = "b152cd93ea7046a835c869a76085aefdb6ce7421"
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.6;destsuffix=${KMETA}"
 
-LINUX_VERSION = "5.6.14"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
+LINUX_VERSION = "5.6.14"
+
+DEPENDS += "openssl-native util-linux-native"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
+
 KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "1"
+
+# Functionality flags
+KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7.bb b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7.bb
index 12eaa59..81b602d 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7.bb
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7.bb
@@ -1,4 +1,4 @@
-KBRANCH = "v5.7/base"
+KBRANCH ?= "v5.7/standard/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
@@ -8,9 +8,15 @@ SRCREV_meta = "b9e6fd082dc5bfb51699809d7119d4b20d280c0b"
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.7;destsuffix=${KMETA}"
 
-LINUX_VERSION = "5.7.19"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
+LINUX_VERSION = "5.7.19"
+
+DEPENDS += "openssl-native util-linux-native"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
+
 KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "1"
 
+# Functionality flags
+KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
-- 
2.17.1

