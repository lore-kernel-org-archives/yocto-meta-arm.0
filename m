Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.7798.1605288374437783162
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 Nov 2020 09:26:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A08F71042
	for <meta-arm@lists.yoctoproject.org>; Fri, 13 Nov 2020 09:26:13 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1DA5B3F718
	for <meta-arm@lists.yoctoproject.org>; Fri, 13 Nov 2020 09:26:13 -0800 (PST)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp: fix missing stable kernels
Date: Fri, 13 Nov 2020 12:26:05 -0500
Message-Id: <20201113172605.20984-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

Corstone, a5ds, and sgi575 were using the meta-kernel, but recent
updates removed support for their non-LTS kernel.  Change to using the
respective kernels present in linux-yocto until it can be upgraded to
the latest version.

Change-Id: I63f2e511fe69051c06e6559950b798c1371cc8e9
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/layer.conf                     |  2 +-
 meta-arm-bsp/conf/machine/a5ds.conf              |  5 +++--
 .../conf/machine/include/corstone700.inc         |  4 ++--
 meta-arm-bsp/conf/machine/sgi575.conf            |  5 +++--
 .../recipes-kernel/linux/linux-stable_%.bbappend |  3 ---
 .../linux/linux-stable_5.7%.bbappend             |  3 ---
 ...ove-definition-of-traceid_list-global-v.patch |  0
 ...-bp_account-Make-global-variable-static.patch |  0
 ...are-some-global-variables-to-fix-build-.patch |  0
 ...traceevent-Fix-build-with-binutils-2.35.patch |  0
 ...e-perf-able-to-build-with-latest-libbfd.patch |  0
 ...traceevent-Fix-build-with-binutils-2.35.patch |  0
 ...ove-definition-of-traceid_list-global-v.patch |  0
 .../coresight-traceid.patch                      |  0
 ...rstone700.inc => linux-yocto-corstone700.inc} |  8 --------
 ...e_5.3%.bbappend => linux-yocto_5.3%.bbappend} |  2 +-
 .../recipes-kernel/linux/linux-yocto_5.3.bb      | 15 +++++++++++++++
 ...e_5.6%.bbappend => linux-yocto_5.6%.bbappend} |  4 ++--
 .../recipes-kernel/linux/linux-yocto_5.6.bb      | 15 +++++++++++++++
 .../linux/linux-yocto_5.7%.bbappend              |  3 +++
 .../recipes-kernel/linux/linux-yocto_5.7.bb      | 16 ++++++++++++++++
 21 files changed, 61 insertions(+), 24 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-stable_%.bbappend
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-stable_5.7%.bbappend
 rename meta-arm-bsp/recipes-kernel/linux/{linux-stable-5.3 => linux-yocto-5.3}/0001-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-stable-5.3 => linux-yocto-5.3}/0002-perf-tests-bp_account-Make-global-variable-static.patch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-stable-5.3 => linux-yocto-5.3}/0003-perf-bench-Share-some-global-variables-to-fix-build-.patch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-stable-5.3 => linux-yocto-5.3}/0004-libtraceevent-Fix-build-with-binutils-2.35.patch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-stable-5.3 => linux-yocto-5.3}/0005-perf-Make-perf-able-to-build-with-latest-libbfd.patch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-stable-5.6 => linux-yocto-5.6}/0001-libtraceevent-Fix-build-with-binutils-2.35.patch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-stable-5.6 => linux-yocto-5.6}/0002-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-stable-5.7 => linux-yocto-5.7}/coresight-traceid.patch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-stable-corstone700.inc => linux-yocto-corstone700.inc} (93%)
 rename meta-arm-bsp/recipes-kernel/linux/{linux-stable_5.3%.bbappend => linux-yocto_5.3%.bbappend} (88%)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3.bb
 rename meta-arm-bsp/recipes-kernel/linux/{linux-stable_5.6%.bbappend => linux-yocto_5.6%.bbappend} (67%)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6.bb
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7%.bbappend
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7.bb

diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index 1260440..8374012 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -11,7 +11,7 @@ BBFILE_PRIORITY_meta-arm-bsp = "6"
 
 LAYERSERIES_COMPAT_meta-arm-bsp = "gatesgarth"
 
-LAYERDEPENDS_meta-arm-bsp = "core meta-arm meta-kernel"
+LAYERDEPENDS_meta-arm-bsp = "core meta-arm"
 # This won't be used by layerindex-fetch, but works everywhere else
 LAYERDEPENDS_meta-arm-bsp_append_musca-b1 = " meta-python"
 LAYERDEPENDS_meta-arm-bsp_append_musca-s1 = " meta-python"
diff --git a/meta-arm-bsp/conf/machine/a5ds.conf b/meta-arm-bsp/conf/machine/a5ds.conf
index 5aadae5..a0fe029 100644
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
 
diff --git a/meta-arm-bsp/conf/machine/include/corstone700.inc b/meta-arm-bsp/conf/machine/include/corstone700.inc
index 91f290f..4aab85e 100644
--- a/meta-arm-bsp/conf/machine/include/corstone700.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone700.inc
@@ -8,8 +8,8 @@ TFA_PLATFORM = "corstone700"
 
 SERIAL_CONSOLES ?= "115200;ttyAMA0"
 
-PREFERRED_PROVIDER_virtual/kernel_corstone700 = "linux-stable"
-PREFERRED_VERSION_linux-stable ?= "5.6%"
+PREFERRED_PROVIDER_virtual/kernel_corstone700 = "linux-yocto"
+PREFERRED_VERSION_linux-yocto ?= "5.6%"
 
 PREFERRED_PROVIDER_virtual/trusted-firmware-a ?= "trusted-firmware-a"
 PREFERRED_VERSION_trusted-firmware-a ?= "2.3%"
diff --git a/meta-arm-bsp/conf/machine/sgi575.conf b/meta-arm-bsp/conf/machine/sgi575.conf
index 1b6498c..e6d447d 100644
--- a/meta-arm-bsp/conf/machine/sgi575.conf
+++ b/meta-arm-bsp/conf/machine/sgi575.conf
@@ -16,8 +16,9 @@ EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a"
 
 # Use kernel provided by linaro
 KERNEL_IMAGETYPE ?= "Image"
-PREFERRED_PROVIDER_virtual/kernel ?= "linux-stable"
-PREFERRED_VERSION_linux-stable ?= "5.7%"
+PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
+PREFERRED_VERSION_linux-yocto ?= "5.7%"
+KCONFIG_MODE = "--alldefconfig"
 SERIAL_CONSOLES = "115200;ttyAMA0"
 
 #grub-efi
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable_%.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-stable_%.bbappend
deleted file mode 100644
index db850ea..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-stable_%.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-# Add support for Arm Platforms (boards or simulators)
-
-require linux-arm-platforms.inc
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable_5.7%.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-stable_5.7%.bbappend
deleted file mode 100644
index 797c22d..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-stable_5.7%.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/linux-stable-5.7:"
-
-SRC_URI_append = " file://coresight-traceid.patch"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable-5.3/0001-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.3/0001-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-stable-5.3/0001-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.3/0001-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable-5.3/0002-perf-tests-bp_account-Make-global-variable-static.patch b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.3/0002-perf-tests-bp_account-Make-global-variable-static.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-stable-5.3/0002-perf-tests-bp_account-Make-global-variable-static.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.3/0002-perf-tests-bp_account-Make-global-variable-static.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable-5.3/0003-perf-bench-Share-some-global-variables-to-fix-build-.patch b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.3/0003-perf-bench-Share-some-global-variables-to-fix-build-.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-stable-5.3/0003-perf-bench-Share-some-global-variables-to-fix-build-.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.3/0003-perf-bench-Share-some-global-variables-to-fix-build-.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable-5.3/0004-libtraceevent-Fix-build-with-binutils-2.35.patch b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.3/0004-libtraceevent-Fix-build-with-binutils-2.35.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-stable-5.3/0004-libtraceevent-Fix-build-with-binutils-2.35.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.3/0004-libtraceevent-Fix-build-with-binutils-2.35.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable-5.3/0005-perf-Make-perf-able-to-build-with-latest-libbfd.patch b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.3/0005-perf-Make-perf-able-to-build-with-latest-libbfd.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-stable-5.3/0005-perf-Make-perf-able-to-build-with-latest-libbfd.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.3/0005-perf-Make-perf-able-to-build-with-latest-libbfd.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable-5.6/0001-libtraceevent-Fix-build-with-binutils-2.35.patch b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.6/0001-libtraceevent-Fix-build-with-binutils-2.35.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-stable-5.6/0001-libtraceevent-Fix-build-with-binutils-2.35.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.6/0001-libtraceevent-Fix-build-with-binutils-2.35.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable-5.6/0002-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.6/0002-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-stable-5.6/0002-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.6/0002-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable-5.7/coresight-traceid.patch b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.7/coresight-traceid.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-stable-5.7/coresight-traceid.patch
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.7/coresight-traceid.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable-corstone700.inc b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-corstone700.inc
similarity index 93%
rename from meta-arm-bsp/recipes-kernel/linux/linux-stable-corstone700.inc
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto-corstone700.inc
index 975a93f..58b849d 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-stable-corstone700.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-corstone700.inc
@@ -1,13 +1,5 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/files/corstone700:"
 
-# including linux-yocto.inc to use configuration fragments
-require recipes-kernel/linux/linux-yocto.inc
-
-LINUX_VMAJOR = "5"
-LINUX_VMINOR = "6"
-LINUX_VPATCH = "14"
-LINUX_SRCREV = "e3ac9117b18596b7363d5b7904ab03a7d782b40c"
-
 COMPATIBLE_MACHINE = "${MACHINE}"
 
 KMACHINE = "corstone700"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable_5.3%.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3%.bbappend
similarity index 88%
rename from meta-arm-bsp/recipes-kernel/linux/linux-stable_5.3%.bbappend
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3%.bbappend
index cb099d1..f931d7d 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-stable_5.3%.bbappend
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3%.bbappend
@@ -1,4 +1,4 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/linux-stable-5.3:"
+FILESEXTRAPATHS_prepend := "${THISDIR}/linux-yocto-5.3:"
 
 SRC_URI_append = " file://0001-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch \
                    file://0002-perf-tests-bp_account-Make-global-variable-static.patch \
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
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable_5.6%.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6%.bbappend
similarity index 67%
rename from meta-arm-bsp/recipes-kernel/linux/linux-stable_5.6%.bbappend
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6%.bbappend
index 47c51e3..c4c55ad 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-stable_5.6%.bbappend
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6%.bbappend
@@ -1,4 +1,4 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/linux-stable-5.6:"
+FILESEXTRAPATHS_prepend := "${THISDIR}/linux-yocto-5.6:"
 
 SRC_URI_append = " file://0001-libtraceevent-Fix-build-with-binutils-2.35.patch \
                    file://0002-perf-cs-etm-Move-definition-of-traceid_list-global-v.patch"
@@ -7,6 +7,6 @@ SRC_URI_append = " file://0001-libtraceevent-Fix-build-with-binutils-2.35.patch
 # Corstone700 KMACHINE
 #
 MACHINE_KERNEL_REQUIRE ?= ""
-MACHINE_KERNEL_REQUIRE_corstone700 = "linux-stable-corstone700.inc"
+MACHINE_KERNEL_REQUIRE_corstone700 = "linux-yocto-corstone700.inc"
 
 require ${MACHINE_KERNEL_REQUIRE}
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6.bb b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6.bb
new file mode 100644
index 0000000..d17cb30
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.6.bb
@@ -0,0 +1,15 @@
+KBRANCH = "v5.6/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+SRCREV_machine = "e3ac9117b18596b7363d5b7904ab03a7d782b40c"
+SRCREV_meta = "b152cd93ea7046a835c869a76085aefdb6ce7421"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.6;destsuffix=${KMETA}"
+
+LINUX_VERSION = "5.6.14"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+KMETA = "kernel-meta"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7%.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7%.bbappend
new file mode 100644
index 0000000..432fd0c
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7%.bbappend
@@ -0,0 +1,3 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/linux-yocto-5.7:"
+
+SRC_URI_append = " file://coresight-traceid.patch"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7.bb b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7.bb
new file mode 100644
index 0000000..12eaa59
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.7.bb
@@ -0,0 +1,16 @@
+KBRANCH = "v5.7/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+SRCREV_machine = "6b9830fecd4a87d7ebb4d93484fef00f46d0fa0f"
+SRCREV_meta = "b9e6fd082dc5bfb51699809d7119d4b20d280c0b"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.7;destsuffix=${KMETA}"
+
+LINUX_VERSION = "5.7.19"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+KMETA = "kernel-meta"
+
-- 
2.17.1

