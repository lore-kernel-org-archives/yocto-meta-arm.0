Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.917.1615574404535200528
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Mar 2021 10:40:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A14D1042
	for <meta-arm@lists.yoctoproject.org>; Fri, 12 Mar 2021 10:40:03 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 195243F7D7
	for <meta-arm@lists.yoctoproject.org>; Fri, 12 Mar 2021 10:40:03 -0800 (PST)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm/machine: create generic-arm64 machine
Date: Fri, 12 Mar 2021 13:39:56 -0500
Message-Id: <20210312183956.24840-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210312183956.24840-1-jon.mason@arm.com>
References: <20210312183956.24840-1-jon.mason@arm.com>

Create a generic Arm64 system for creating a SystemReady file system.
Due to it being as generic as possible, the image created
by this should run on any hardware that already has the requisite
firmware present.

Change-Id: Ie0d71f91145311e90d228bc403e653a7ef059838
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml                                |  3 +++
 kas/generic-arm64.yml                         |  6 +++++
 meta-arm/conf/machine/generic-arm64.conf      | 23 +++++++++++++++++++
 .../linux/linux-yocto_%.bbappend              |  6 +++++
 4 files changed, 38 insertions(+)
 create mode 100644 kas/generic-arm64.yml
 create mode 100644 meta-arm/conf/machine/generic-arm64.conf

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index ccf58bb..e2a6ee6 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -76,6 +76,9 @@ gem5-arm64:
 gem5-arm64-xen:
   extends: .build
 
+generic-arm64:
+  extends: .build
+
 juno:
   extends: .build
 
diff --git a/kas/generic-arm64.yml b/kas/generic-arm64.yml
new file mode 100644
index 0000000..a7365b8
--- /dev/null
+++ b/kas/generic-arm64.yml
@@ -0,0 +1,6 @@
+header:
+  version: 9
+  includes:
+    - base.yml
+
+machine: generic-arm64
diff --git a/meta-arm/conf/machine/generic-arm64.conf b/meta-arm/conf/machine/generic-arm64.conf
new file mode 100644
index 0000000..05b3e70
--- /dev/null
+++ b/meta-arm/conf/machine/generic-arm64.conf
@@ -0,0 +1,23 @@
+#@TYPE: Machine
+#@NAME: generic-arm64
+#@DESCRIPTION: Generic Arm64 machine for creating rootfs that should work on all arm64 hardware
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+SERIAL_CONSOLES ?= "115200;ttyAMA0"
+SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
+
+PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
+PREFERRED_VERSION_linux-yocto ?= "5.10%"
+
+KERNEL_IMAGETYPE = "Image"
+
+IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
+IMAGE_FSTYPES ?= "wic"
+
+WKS_FILE ?= "mkefidisk.wks"
+
+MACHINE_FEATURES += "efi"
+
+KBUILD_DEFCONFIG = "defconfig"
+KCONFIG_MODE = "--alldefconfig"
diff --git a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend b/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
index 6fc96c5..bc60003 100644
--- a/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
+++ b/meta-arm/recipes-kernel/linux/linux-yocto_%.bbappend
@@ -3,3 +3,9 @@ FILESEXTRAPATHS_prepend := "${THISDIR}:${THISDIR}/linux-yocto:"
 SRC_URI_append_qemuarm64-sbsa = " \
     file://defconfig.patch \
     "
+
+COMPATIBLE_MACHINE_generic-arm64 = "generic-arm64"
+
+SRC_URI_append_generic-arm64 = " \
+    file://defconfig.patch \
+    "
-- 
2.17.1

