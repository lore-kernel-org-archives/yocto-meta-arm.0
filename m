Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.3607.1615453714722652270
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Mar 2021 01:08:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: nathan.dunne@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54D8A1FB;
	Thu, 11 Mar 2021 01:08:33 -0800 (PST)
Received: from e120809.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A141A3F70D;
	Thu, 11 Mar 2021 01:08:32 -0800 (PST)
From: "Nathan Dunne" <Nathan.Dunne@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Nathan Dunne <Nathan.Dunne@arm.com>
Subject: [PATCH 1/2] arm-autonomy: Moved dynamic-layers/meta-gem5 to meta-gem5
Date: Thu, 11 Mar 2021 09:08:08 +0000
Message-Id: <20210311090809.13483-1-nathan.dunne@arm.com>
X-Mailer: git-send-email 2.17.1

From: Nathan Dunne <Nathan.Dunne@arm.com>

Gem5 xen support in meta-arm-autonomy moved to meta-gem5 under
dynamic-layers/meta-virtualization. Any dependencies on 'arm-autonomy-host'
or 'arm-autonomy-guest' in DISTRO_FEATURES replaced with 'xen'.

Issue-Id: SCM-2091
Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
Change-Id: Ia2db68e2cd88c4277e8edc213aebb88d90c0cd23
---
 meta-arm-autonomy/conf/layer.conf             |  1 -
 .../xenguest/xenguest-network.bbappend        |  1 -
 .../recipes-kernel/linux/linux-%.bbappend     | 15 --------
 meta-gem5/conf/layer.conf                     |  5 +++
 .../boot-wrapper-aarch64_%.bbappend           |  0
 .../gem5/gem5-aarch64-native_20.bbappend      |  2 +-
 .../xen/files/gem5-arm64/early-printk.cfg     |  0
 .../recipes-extended/xen/xen_%.bbappend       |  0
 .../recipes-kernel/linux/linux-%.bbappend     | 14 +++++++
 .../features}/disable-arm64-sve.cfg           |  0
 .../features}/disable-arm64-sve.scc           |  0
 ...Fix-atomics-permission-checks-in-TLB.patch | 38 +++++++++++++++++++
 .../gem5/gem5-aarch64-native_20.bb            |  3 +-
 13 files changed, 60 insertions(+), 19 deletions(-)
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xenguest/xenguest-network.bbappend
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/linux-%.bbappend
 rename {meta-arm-autonomy/dynamic-layers/meta-gem5 => meta-gem5/dynamic-layers/meta-virtualization}/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend (100%)
 rename {meta-arm-autonomy/dynamic-layers/meta-gem5 => meta-gem5/dynamic-layers/meta-virtualization}/recipes-devtools/gem5/gem5-aarch64-native_20.bbappend (80%)
 rename {meta-arm-autonomy/dynamic-layers/meta-gem5 => meta-gem5/dynamic-layers/meta-virtualization}/recipes-extended/xen/files/gem5-arm64/early-printk.cfg (100%)
 rename {meta-arm-autonomy/dynamic-layers/meta-gem5 => meta-gem5/dynamic-layers/meta-virtualization}/recipes-extended/xen/xen_%.bbappend (100%)
 create mode 100644 meta-gem5/dynamic-layers/meta-virtualization/recipes-kernel/linux/linux-%.bbappend
 rename {meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/arm-autonomy-kmeta-extra-gem5/features/arm-autonomy => meta-gem5/dynamic-layers/meta-virtualization/recipes-kernel/linux/virtualization-kmeta-extra-gem5/features}/disable-arm64-sve.cfg (100%)
 rename {meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/arm-autonomy-kmeta-extra-gem5/features/arm-autonomy => meta-gem5/dynamic-layers/meta-virtualization/recipes-kernel/linux/virtualization-kmeta-extra-gem5/features}/disable-arm64-sve.scc (100%)
 create mode 100644 meta-gem5/recipes-devtools/gem5/gem5-aarch64-native/0002-arch-arm-Fix-atomics-permission-checks-in-TLB.patch

diff --git a/meta-arm-autonomy/conf/layer.conf b/meta-arm-autonomy/conf/layer.conf
index 4bcf0cd..d577a55 100644
--- a/meta-arm-autonomy/conf/layer.conf
+++ b/meta-arm-autonomy/conf/layer.conf
@@ -34,7 +34,6 @@ USER_CLASSES_append = " arm-autonomy-features"
 BBFILES_DYNAMIC += " \
     meta-arm-bsp:${LAYERDIR}/dynamic-layers/meta-arm-bsp/*/*/*.bbappend \
     meta-arm-bsp:${LAYERDIR}/dynamic-layers/meta-arm-bsp/*/*/*.bb \
-    meta-gem5:${LAYERDIR}/dynamic-layers/meta-gem5/*/*/*.bbappend \
 "
 # Root directory for the meta-arm-autonomy/dynamic-layers/meta-arm-bsp
 ARM_AUTONOMY_ARM_BSP_DYNAMIC_DIR = "${ARM_AUTONOMY_LAYERDIR}/dynamic-layers/meta-arm-bsp"
diff --git a/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xenguest/xenguest-network.bbappend b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xenguest/xenguest-network.bbappend
deleted file mode 100644
index 0283702..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xenguest/xenguest-network.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-XENGUEST_NETWORK_BRIDGE_MEMBERS_gem5-arm64 ?= "eth0"
diff --git a/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/linux-%.bbappend b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/linux-%.bbappend
deleted file mode 100644
index 0d0047a..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/linux-%.bbappend
+++ /dev/null
@@ -1,15 +0,0 @@
-FILESEXTRAPATHS_prepend_gem5-arm64 := "${THISDIR}:"
-
-#
-# arm-autonomy kmeta extra
-#
-SRC_URI_append_gem5-arm64 = " file://arm-autonomy-kmeta-extra-gem5;type=kmeta;name=arm-autonomy-kmeta-extra-gem5;destsuffix=arm-autonomy-kmeta-extra-gem5"
-
-# We need to turn off SVE support in the Linux kernel otherwise Xen is stopping
-# Linux kernel with a coredump while trying to access XEN bit of CPACR1 core
-# register.
-LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE_gem5-arm64 = "${@bb.utils.contains_any('DISTRO_FEATURES', \
-                                         'arm-autonomy-host arm-autonomy-guest', \
-                                         ' features/arm-autonomy/disable-arm64-sve.scc','',d)}"
-
-KERNEL_FEATURES_append_gem5-arm64 = "${LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE}"
diff --git a/meta-gem5/conf/layer.conf b/meta-gem5/conf/layer.conf
index bf42f74..e29c940 100644
--- a/meta-gem5/conf/layer.conf
+++ b/meta-gem5/conf/layer.conf
@@ -12,3 +12,8 @@ BBFILE_PRIORITY_meta-gem5 = "5"
 LAYERDEPENDS_meta-gem5 = "core openembedded-layer meta-arm"
 LAYERSERIES_COMPAT_meta-gem5 = "gatesgarth"
 
+BBFILES_DYNAMIC += " \
+    virtualization-layer:${LAYERDIR}/dynamic-layers/meta-virtualization/*/*/*.bbappend \
+"
+
+DISTRO_FEATURES_NATIVE_append = " ${@bb.utils.filter('DISTRO_FEATURES', 'xen', d)}"
diff --git a/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend b/meta-gem5/dynamic-layers/meta-virtualization/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend
similarity index 100%
rename from meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend
rename to meta-gem5/dynamic-layers/meta-virtualization/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend
diff --git a/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bbappend b/meta-gem5/dynamic-layers/meta-virtualization/recipes-devtools/gem5/gem5-aarch64-native_20.bbappend
similarity index 80%
rename from meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bbappend
rename to meta-gem5/dynamic-layers/meta-virtualization/recipes-devtools/gem5/gem5-aarch64-native_20.bbappend
index 71b308a..8239a40 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bbappend
+++ b/meta-gem5/dynamic-layers/meta-virtualization/recipes-devtools/gem5/gem5-aarch64-native_20.bbappend
@@ -1,7 +1,7 @@
 # When booting gem5-arm64 with Xen we need to set the cpu as Cortex A53 and
 # remove support for pointer authentification
 GEM5_RUN_EXTRA_append = " \
-${@bb.utils.contains('DISTRO_FEATURES_NATIVE', 'arm-autonomy-host', \
+${@bb.utils.contains('DISTRO_FEATURES_NATIVE', 'xen', \
 '--param=system.cpu_cluster[0].cpus[0].isa[0].midr=0x410fd030 \
 --param=system.cpu_cluster[0].cpus[0].isa[0].id_aa64isar1_el1=0x0', \
 '', d)}"
diff --git a/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xen/files/gem5-arm64/early-printk.cfg b/meta-gem5/dynamic-layers/meta-virtualization/recipes-extended/xen/files/gem5-arm64/early-printk.cfg
similarity index 100%
rename from meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xen/files/gem5-arm64/early-printk.cfg
rename to meta-gem5/dynamic-layers/meta-virtualization/recipes-extended/xen/files/gem5-arm64/early-printk.cfg
diff --git a/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xen/xen_%.bbappend b/meta-gem5/dynamic-layers/meta-virtualization/recipes-extended/xen/xen_%.bbappend
similarity index 100%
rename from meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xen/xen_%.bbappend
rename to meta-gem5/dynamic-layers/meta-virtualization/recipes-extended/xen/xen_%.bbappend
diff --git a/meta-gem5/dynamic-layers/meta-virtualization/recipes-kernel/linux/linux-%.bbappend b/meta-gem5/dynamic-layers/meta-virtualization/recipes-kernel/linux/linux-%.bbappend
new file mode 100644
index 0000000..5d3b52c
--- /dev/null
+++ b/meta-gem5/dynamic-layers/meta-virtualization/recipes-kernel/linux/linux-%.bbappend
@@ -0,0 +1,14 @@
+FILESEXTRAPATHS_prepend_gem5-arm64 := "${THISDIR}:"
+
+#
+# virtualization kmeta extra
+#
+SRC_URI_append_gem5-arm64 = " file://virtualization-kmeta-extra-gem5;type=kmeta;name=virtualization-kmeta-extra-gem5;destsuffix=virtualization-kmeta-extra-gem5"
+
+# We need to turn off SVE support in the Linux kernel otherwise Xen is stopping
+# Linux kernel with a coredump while trying to access XEN bit of CPACR1 core
+# register.
+LINUX_VIRTUALIZATION_DISABLE_ARM64_SVE_gem5-arm64 = "${@bb.utils.contains('DISTRO_FEATURES', \
+                                         'xen', ' features/disable-arm64-sve.scc','',d)}"
+
+KERNEL_FEATURES_append_gem5-arm64 = "${LINUX_VIRTUALIZATION_DISABLE_ARM64_SVE}"
diff --git a/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/arm-autonomy-kmeta-extra-gem5/features/arm-autonomy/disable-arm64-sve.cfg b/meta-gem5/dynamic-layers/meta-virtualization/recipes-kernel/linux/virtualization-kmeta-extra-gem5/features/disable-arm64-sve.cfg
similarity index 100%
rename from meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/arm-autonomy-kmeta-extra-gem5/features/arm-autonomy/disable-arm64-sve.cfg
rename to meta-gem5/dynamic-layers/meta-virtualization/recipes-kernel/linux/virtualization-kmeta-extra-gem5/features/disable-arm64-sve.cfg
diff --git a/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/arm-autonomy-kmeta-extra-gem5/features/arm-autonomy/disable-arm64-sve.scc b/meta-gem5/dynamic-layers/meta-virtualization/recipes-kernel/linux/virtualization-kmeta-extra-gem5/features/disable-arm64-sve.scc
similarity index 100%
rename from meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/arm-autonomy-kmeta-extra-gem5/features/arm-autonomy/disable-arm64-sve.scc
rename to meta-gem5/dynamic-layers/meta-virtualization/recipes-kernel/linux/virtualization-kmeta-extra-gem5/features/disable-arm64-sve.scc
diff --git a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native/0002-arch-arm-Fix-atomics-permission-checks-in-TLB.patch b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native/0002-arch-arm-Fix-atomics-permission-checks-in-TLB.patch
new file mode 100644
index 0000000..36cb167
--- /dev/null
+++ b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native/0002-arch-arm-Fix-atomics-permission-checks-in-TLB.patch
@@ -0,0 +1,38 @@
+From c47920d81c4c29e8c868c005ff4330c46becbad5 Mon Sep 17 00:00:00 2001
+From: Giacomo Travaglini <giacomo.travaglini@arm.com>
+Date: Wed, 03 Mar 2021 11:38:06 +0000
+Subject: [PATCH] arch-arm: Fix atomics permission checks in TLB
+
+For stage 2 translations, atomic accesses were not checking the
+access permission bits in the page table descriptors, and were
+instead wrongly using the nature of the request itself
+(r/w booleans).
+
+Change-Id: I27fbc95f04ea659e77ad5a3afb551873c9c971f0
+Signed-off-by: Giacomo Travaglini <giacomo.travaglini@arm.com>
+Reviewed-on: https://gem5-review.googlesource.com/c/public/gem5/+/42073
+Reviewed-by: Jason Lowe-Power <power.jg@gmail.com>
+Reviewed-by: Richard Cooper <richard.cooper@arm.com>
+Reviewed-by: Bobby R. Bruce <bbruce@ucdavis.edu>
+Maintainer: Jason Lowe-Power <power.jg@gmail.com>
+Maintainer: Bobby R. Bruce <bbruce@ucdavis.edu>
+Tested-by: kokoro <noreply+kokoro@google.com>
+
+Upstream-Status: Backport
+Signed-off-By: Nathan Dunne <nathan.dunne@arm.com>
+---
+
+diff --git a/src/arch/arm/tlb.cc b/src/arch/arm/tlb.cc
+index fd72d25..8e5b3ca 100644
+--- a/src/arch/arm/tlb.cc
++++ b/src/arch/arm/tlb.cc
+@@ -872,8 +872,7 @@
+             // sctlr.wxn overrides the xn bit
+             grant = !wxn && !xn;
+         } else if (is_atomic) {
+-            grant = r && w;
+-            grant_read = r;
++            grant = hap;
+         } else if (is_write) {
+             grant = hap & 0x2;
+         } else { // is_read
diff --git a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb
index 79cf910..711ab95 100644
--- a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb
+++ b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb
@@ -1,6 +1,7 @@
 require gem5-source_20.inc
 
-SRC_URI += "file://0001-dev-arm-SMMUv3-enable-interrupt-interface.patch"
+SRC_URI += "file://0001-dev-arm-SMMUv3-enable-interrupt-interface.patch \
+            file://0002-arch-arm-Fix-atomics-permission-checks-in-TLB.patch"
 
 BPN = "gem5-aarch64-native"
 
-- 
2.17.1

