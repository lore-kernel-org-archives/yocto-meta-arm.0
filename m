Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.13511.1607608648038700228
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 10 Dec 2020 05:57:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6AF4A1FB
	for <meta-arm@lists.yoctoproject.org>; Thu, 10 Dec 2020 05:57:27 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EA4983F718
	for <meta-arm@lists.yoctoproject.org>; Thu, 10 Dec 2020 05:57:26 -0800 (PST)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm-bsp: switch to linux-yocto for a5ds
Date: Thu, 10 Dec 2020 08:57:19 -0500
Message-Id: <20201210135721.29575-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

Keeping with what is being done on the master branch, switch to using
linux-yocto for the 5.3 kernel.

Change-Id: Ic327c6ea6e22d6fc0dd41dfb30755c677e5defff
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/layer.conf                      |  2 +-
 meta-arm-bsp/conf/machine/a5ds.conf               |  5 +++--
 .../recipes-kernel/linux/linux-stable_%.bbappend  |  3 ---
 .../recipes-kernel/linux/linux-yocto_5.3.bb       | 15 +++++++++++++++
 4 files changed, 19 insertions(+), 6 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-stable_%.bbappend
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3.bb

diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index 0b6985c..1a54ddc 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -9,5 +9,5 @@ BBFILE_COLLECTIONS += "meta-arm-bsp"
 BBFILE_PATTERN_meta-arm-bsp = "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arm-bsp = "6"
 
-LAYERDEPENDS_meta-arm-bsp = "core openembedded-layer meta-arm meta-kernel"
+LAYERDEPENDS_meta-arm-bsp = "core openembedded-layer meta-arm"
 LAYERSERIES_COMPAT_meta-arm-bsp = "warrior zeus dunfell"
diff --git a/meta-arm-bsp/conf/machine/a5ds.conf b/meta-arm-bsp/conf/machine/a5ds.conf
index e7180e9..331d298 100644
--- a/meta-arm-bsp/conf/machine/a5ds.conf
+++ b/meta-arm-bsp/conf/machine/a5ds.conf
@@ -6,9 +6,10 @@
 
 require conf/machine/include/tune-cortexa5.inc
 
-PREFERRED_PROVIDER_virtual/kernel ?= "linux-stable"
-PREFERRED_VERSION_linux-stable ?= "5.3%"
+PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
+PREFERRED_VERSION_linux-yocto ?= "5.3%"
 KBUILD_DEFCONFIG = "multi_v7_defconfig"
+KCONFIG_MODE = "--alldefconfig"
 
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot"
 
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable_%.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-stable_%.bbappend
deleted file mode 100644
index db850ea..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-stable_%.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-# Add support for Arm Platforms (boards or simulators)
-
-require linux-arm-platforms.inc
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3.bb b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3.bb
new file mode 100644
index 0000000..9d5e9ce
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3.bb
@@ -0,0 +1,15 @@
+KBRANCH = "v5.3/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+SRCREV_machine = "d4f3318ed8fab6316cb7a269b8f42306632a3876"
+SRCREV_meta = "8d0ed83a864cc91eef4d2abbc90f13d4ecd1c213"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
+
+LINUX_VERSION = "5.3.18"
+LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+KMETA = "kernel-meta"
-- 
2.17.1

