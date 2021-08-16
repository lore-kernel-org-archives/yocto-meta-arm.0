Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.43897.1629227317954744946
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Aug 2021 12:08:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FF361042
	for <meta-arm@lists.yoctoproject.org>; Tue, 17 Aug 2021 12:08:27 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3F6A23F40C
	for <meta-arm@lists.yoctoproject.org>; Tue, 17 Aug 2021 12:08:27 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm-bsp: cortex-r tunes
Date: Mon, 16 Aug 2021 17:39:12 -0400
Message-Id: <20210816213913.8016-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210816213913.8016-1-jon.mason@arm.com>
References: <20210816213913.8016-1-jon.mason@arm.com>

Add support for all of the Cortex-R CPUs currently supported in GCC.
Having to get creative here to properly use the GCC extensions.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../conf/machine/include/arm/arch-armv7r.inc  | 30 +++++++++++++++
 .../conf/machine/include/arm/arch-armv8r.inc  | 38 +++++++++++++++++++
 .../include/arm/armv7r/tune-cortexr4.inc      | 14 +++++++
 .../include/arm/armv7r/tune-cortexr4f.inc     | 14 +++++++
 .../include/arm/armv7r/tune-cortexr5.inc      | 14 +++++++
 .../include/arm/armv7r/tune-cortexr7.inc      | 14 +++++++
 .../include/arm/armv7r/tune-cortexr8.inc      | 14 +++++++
 .../include/arm/armv8r/arch-armv8r64.inc      | 34 +++++------------
 .../include/arm/armv8r/tune-cortexr52.inc     | 14 +++++++
 .../machine/include/arm/feature-arm-crc.inc   |  4 ++
 .../include/arm/feature-arm-crypto.inc        |  5 +++
 .../machine/include/arm/feature-arm-idiv.inc  |  2 +
 .../machine/include/arm/feature-arm-simd.inc  |  5 +++
 13 files changed, 177 insertions(+), 25 deletions(-)
 create mode 100755 meta-arm-bsp/conf/machine/include/arm/arch-armv7r.inc
 create mode 100755 meta-arm-bsp/conf/machine/include/arm/arch-armv8r.inc
 create mode 100644 meta-arm-bsp/conf/machine/include/arm/armv7r/tune-cortexr4.inc
 create mode 100644 meta-arm-bsp/conf/machine/include/arm/armv7r/tune-cortexr4f.inc
 create mode 100644 meta-arm-bsp/conf/machine/include/arm/armv7r/tune-cortexr5.inc
 create mode 100644 meta-arm-bsp/conf/machine/include/arm/armv7r/tune-cortexr7.inc
 create mode 100644 meta-arm-bsp/conf/machine/include/arm/armv7r/tune-cortexr8.inc
 create mode 100644 meta-arm-bsp/conf/machine/include/arm/armv8r/tune-cortexr52.inc
 create mode 100644 meta-arm-bsp/conf/machine/include/arm/feature-arm-crc.inc
 create mode 100644 meta-arm-bsp/conf/machine/include/arm/feature-arm-crypto.inc
 create mode 100644 meta-arm-bsp/conf/machine/include/arm/feature-arm-idiv.inc
 create mode 100644 meta-arm-bsp/conf/machine/include/arm/feature-arm-simd.inc

diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv7r.inc b/meta-arm-bsp/conf/machine/include/arm/arch-armv7r.inc
new file mode 100755
index 0000000..dd81135
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/arm/arch-armv7r.inc
@@ -0,0 +1,30 @@
+#
+# Defaults for ARMv7-r
+#
+DEFAULTTUNE ?= "armv7r"
+
+TUNEVALID[armv7r] = "Enable instructions for ARMv7-r"
+TUNE_CCARGS_MARCH = "${@bb.utils.contains('TUNE_FEATURES', 'armv7r', ' -march=armv7-r', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7r', 'armv7r:', '', d)}"
+
+TUNECONFLICTS[armv7r] = "armv4 armv5 armv6 armv7a"
+
+require conf/machine/include/arm/arch-armv6.inc
+require conf/machine/include/arm/feature-arm-idiv.inc
+require conf/machine/include/arm/feature-arm-neon.inc
+
+AVAILTUNES                            += "armv7r armv7r-vfpv3d16"
+ARMPKGARCH:tune-armv7r                 = "armv7r"
+ARMPKGARCH:tune-armv7r-vfpv3d16        = "armv7r"
+TUNE_FEATURES:tune-armv7r              = "armv7r"
+TUNE_FEATURES:tune-armv7r-vfpv3d16     = "${TUNE_FEATURES:tune-armv7r} vfpv3d16"
+PACKAGE_EXTRA_ARCHS:tune-armv7r        = "armv7r"
+PACKAGE_EXTRA_ARCHS:tune-armv7r-vfpv3d16  = "${PACKAGE_EXTRA_ARCHS:tune-armv7r} tune-armv7r-fpv3d16"
+
+# FIXME - This goes in arch-arm.inc when upstreamed
+# Some -march settings need a +X option passed in.  Since we cannot guarantee that any specified TUNE_CCARGS option is set in any order, we must hard code the order here to allow for it.
+TUNE_CCARGS_MARCH_OPTS ??= ""
+TUNE_CCARGS .= "${TUNE_CCARGS_MARCH}${TUNE_CCARGS_MARCH_OPTS}"
+
+# FIXME - Thise goes in feature-arm-neon.inc when upstreamed
+TUNE_CCARGS_MARCH_OPTS .= "${@bb.utils.contains('TUNE_FEATURES', [ 'vfpv3d16', 'vfpv5spd16' ], '+fp', '', d)}"
diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv8r.inc b/meta-arm-bsp/conf/machine/include/arm/arch-armv8r.inc
new file mode 100755
index 0000000..be4ef3e
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/arm/arch-armv8r.inc
@@ -0,0 +1,38 @@
+#
+# Defaults for ARMv8-r
+#
+DEFAULTTUNE ?= "armv8r"
+
+TUNEVALID[armv8r] = "Enable instructions for ARMv8-r"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8r', ' -march=armv8-r', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8r', 'armv8r:', '', d)}"
+
+require conf/machine/include/arm/arch-arm64.inc
+require conf/machine/include/arm/feature-arm-simd.inc
+require conf/machine/include/arm/feature-arm-crc.inc
+require conf/machine/include/arm/feature-arm-crypto.inc
+
+# All ARMv8 has floating point hardware built in.  Null it here to avoid any confusion for 32bit.
+TARGET_FPU_32 = ""
+
+AVAILTUNES += "armv8r armv8r-crc armv8r-crypto armv8r-simd armv8r-crc-crypto armv8r-crc-simd armv8r-crc-crypto-simd"
+ARMPKGARCH:tune-armv8r                          = "armv8r"
+ARMPKGARCH:tune-armv8r-crc                      = "armv8r"
+ARMPKGARCH:tune-armv8r-crypto                   = "armv8r"
+ARMPKGARCH:tune-armv8r-simd                     = "armv8r"
+ARMPKGARCH:tune-armv8r-crc-crypto               = "armv8r"
+ARMPKGARCH:tune-armv8r-crc-simd                 = "armv8r"
+ARMPKGARCH:tune-armv8r-crc-crypto-simd          = "armv8r"
+TUNE_FEATURES:tune-armv8r                       = "armv8r"
+TUNE_FEATURES:tune-armv8r-crc                   = "${TUNE_FEATURES:tune-armv8r} crc"
+TUNE_FEATURES:tune-armv8r-crypto                = "${TUNE_FEATURES:tune-armv8r} crypto"
+TUNE_FEATURES:tune-armv8r-simd                  = "${TUNE_FEATURES:tune-armv8r} simd"
+TUNE_FEATURES:tune-armv8r-crc-crypto            = "${TUNE_FEATURES:tune-armv8r-crc} crypto"
+TUNE_FEATURES:tune-armv8r-crc-simd              = "${TUNE_FEATURES:tune-armv8r-crc} simd"
+TUNE_FEATURES:tune-armv8r-crc-crypto-simd       = "${TUNE_FEATURES:tune-armv8r-crc-crypto} simd"
+PACKAGE_EXTRA_ARCHS:tune-armv8r                 = "armv8r"
+PACKAGE_EXTRA_ARCHS:tune-armv8r-crc             = "${PACKAGE_EXTRA_ARCHS:tune-armv8r} armv8r-crc"
+PACKAGE_EXTRA_ARCHS:tune-armv8r-crypto          = "${PACKAGE_EXTRA_ARCHS:tune-armv8r} armv8r-crypto"
+PACKAGE_EXTRA_ARCHS:tune-armv8r-simd            = "${PACKAGE_EXTRA_ARCHS:tune-armv8r} armv8r-simd"
+PACKAGE_EXTRA_ARCHS:tune-armv8r-crc-simd        = "${PACKAGE_EXTRA_ARCHS:tune-armv8r-crc} armv8r-simd armv8r-crc-simd"
+PACKAGE_EXTRA_ARCHS:tune-armv8r-crc-crypto-simd = "${PACKAGE_EXTRA_ARCHS:tune-armv8r-crc-simd} armv8r-crc-crypto-simd"
diff --git a/meta-arm-bsp/conf/machine/include/arm/armv7r/tune-cortexr4.inc b/meta-arm-bsp/conf/machine/include/arm/armv7r/tune-cortexr4.inc
new file mode 100644
index 0000000..0eed729
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/arm/armv7r/tune-cortexr4.inc
@@ -0,0 +1,14 @@
+#
+# Tune Settings for Cortex-R4
+#
+DEFAULTTUNE ?= "cortexr4"
+
+TUNEVALID[cortexr4] = "Enable Cortex-R4 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexr4', ' -mcpu=cortex-r4', '', d)}"
+
+require conf/machine/include/arm/arch-armv7r.inc
+
+AVAILTUNES                            += "cortexr4"
+ARMPKGARCH:tune-cortexr4               = "cortexr4"
+TUNE_FEATURES:tune-cortexr4            = "${TUNE_FEATURES:tune-armv7r} cortexr4"
+PACKAGE_EXTRA_ARCHS:tune-cortexr4      = "${PACKAGE_EXTRA_ARCHS:tune-armv7r} cortexr4"
diff --git a/meta-arm-bsp/conf/machine/include/arm/armv7r/tune-cortexr4f.inc b/meta-arm-bsp/conf/machine/include/arm/armv7r/tune-cortexr4f.inc
new file mode 100644
index 0000000..0712b3a
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/arm/armv7r/tune-cortexr4f.inc
@@ -0,0 +1,14 @@
+#
+# Tune Settings for Cortex-R4F
+#
+DEFAULTTUNE ?= "cortexr4f"
+
+TUNEVALID[cortexr4f] = "Enable Cortex-R4F specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexr4f', ' -mcpu=cortex-r4f', '', d)}"
+
+require conf/machine/include/arm/arch-armv7r.inc
+
+AVAILTUNES                            += "cortexr4f"
+ARMPKGARCH:tune-cortexr4f              = "cortexr4f"
+TUNE_FEATURES:tune-cortexr4f           = "${TUNE_FEATURES:tune-armv7r-vfpv3d16} cortexr4f"
+PACKAGE_EXTRA_ARCHS:tune-cortexr4f     = "${PACKAGE_EXTRA_ARCHS:tune-armv7r-vfpv3d16} cortexr4f-vfpv3d16"
diff --git a/meta-arm-bsp/conf/machine/include/arm/armv7r/tune-cortexr5.inc b/meta-arm-bsp/conf/machine/include/arm/armv7r/tune-cortexr5.inc
new file mode 100644
index 0000000..ecaaa0d
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/arm/armv7r/tune-cortexr5.inc
@@ -0,0 +1,14 @@
+#
+# Tune Settings for Cortex-R5
+#
+DEFAULTTUNE ?= "cortexr5"
+
+TUNEVALID[cortexr5] = "Enable Cortex-R5 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexr5', ' -mcpu=cortex-r5', '', d)}"
+
+require conf/machine/include/arm/arch-armv7r.inc
+
+AVAILTUNES                            += "cortexr5"
+ARMPKGARCH:tune-cortexr5               = "cortexr5"
+TUNE_FEATURES:tune-cortexr5            = "${TUNE_FEATURES:tune-armv7r-vfpv3d16} cortexr5 idiv"
+PACKAGE_EXTRA_ARCHS:tune-cortexr5      = "${PACKAGE_EXTRA_ARCHS:tune-armv7r-vfpv3d16} cortexr5-vfpv3d16"
diff --git a/meta-arm-bsp/conf/machine/include/arm/armv7r/tune-cortexr7.inc b/meta-arm-bsp/conf/machine/include/arm/armv7r/tune-cortexr7.inc
new file mode 100644
index 0000000..bfae1f0
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/arm/armv7r/tune-cortexr7.inc
@@ -0,0 +1,14 @@
+#
+# Tune Settings for Cortex-R7
+#
+DEFAULTTUNE ?= "cortexr7"
+
+TUNEVALID[cortexr7] = "Enable Cortex-R7 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexr7', ' -mcpu=cortex-r7', '', d)}"
+
+require conf/machine/include/arm/arch-armv7r.inc
+
+AVAILTUNES                            += "cortexr7"
+ARMPKGARCH:tune-cortexr7               = "cortexr7"
+TUNE_FEATURES:tune-cortexr7            = "${TUNE_FEATURES:tune-armv7r-vfpv3d16} cortexr7 idiv"
+PACKAGE_EXTRA_ARCHS:tune-cortexr7      = "${PACKAGE_EXTRA_ARCHS:tune-armv7r-vfpv3d16} cortexr7-vfpv3d16"
diff --git a/meta-arm-bsp/conf/machine/include/arm/armv7r/tune-cortexr8.inc b/meta-arm-bsp/conf/machine/include/arm/armv7r/tune-cortexr8.inc
new file mode 100644
index 0000000..7fb824f
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/arm/armv7r/tune-cortexr8.inc
@@ -0,0 +1,14 @@
+#
+# Tune Settings for Cortex-R8
+#
+DEFAULTTUNE ?= "cortexr8"
+
+TUNEVALID[cortexr8] = "Enable Cortex-R8 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexr8', ' -mcpu=cortex-r8', '', d)}"
+
+require conf/machine/include/arm/arch-armv7r.inc
+
+AVAILTUNES                            += "cortexr8"
+ARMPKGARCH:tune-cortexr8               = "cortexr8"
+TUNE_FEATURES:tune-cortexr8            = "${TUNE_FEATURES:tune-armv7r-vfpv3d16} cortexr8 idiv"
+PACKAGE_EXTRA_ARCHS:tune-cortexr8      = "${PACKAGE_EXTRA_ARCHS:tune-armv7r-vfpv3d16} cortexr8-vfpv3d16"
diff --git a/meta-arm-bsp/conf/machine/include/arm/armv8r/arch-armv8r64.inc b/meta-arm-bsp/conf/machine/include/arm/armv8r/arch-armv8r64.inc
index f9383fc..5db12e2 100644
--- a/meta-arm-bsp/conf/machine/include/arm/armv8r/arch-armv8r64.inc
+++ b/meta-arm-bsp/conf/machine/include/arm/armv8r/arch-armv8r64.inc
@@ -1,26 +1,10 @@
-DEFAULTTUNE ?= "armv8r"
+require conf/machine/include/arm/arch-armv8r.inc
 
-TUNEVALID[armv8r] = "Enable instructions for ARMv8-r"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8r', ' -march=armv8-r', '', d)}"
-TUNEVALID[crc] = "Enable instructions for ARMv8-r Cyclic Redundancy Check (CRC)"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'crc', '+crc', '', d)}"
-TUNEVALID[crypto] = "Enable instructions for ARMv8-r cryptographic"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '+crypto', '', d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8r', 'armv8-r:', '', d)}"
-
-require conf/machine/include/arm/arch-arm64.inc
-
-# Little Endian base configs
-AVAILTUNES += "armv8r armv8r-crc armv8r-crypto"
-ARMPKGARCH:tune-armv8r                    ?= "armv8r"
-ARMPKGARCH:tune-armv8r-crc                ?= "armv8r"
-ARMPKGARCH:tune-armv8r-crypto             ?= "armv8r"
-TUNE_FEATURES:tune-armv8r                  = "aarch64 armv8r"
-TUNE_FEATURES:tune-armv8r-crc              = "${TUNE_FEATURES:tune-armv8r} crc"
-TUNE_FEATURES:tune-armv8r-crypto           = "${TUNE_FEATURES:tune-armv8r} crypto"
-PACKAGE_EXTRA_ARCHS:tune-armv8r            = "aarch64 armv8r"
-PACKAGE_EXTRA_ARCHS:tune-armv8r-crc        = "${PACKAGE_EXTRA_ARCHS:tune-armv8r} armv8r-crc"
-PACKAGE_EXTRA_ARCHS:tune-armv8r-crypto     = "${PACKAGE_EXTRA_ARCHS:tune-armv8r} armv8r-crypto"
-BASE_LIB:tune-armv8r                       = "lib64"
-BASE_LIB:tune-armv8r-crc                   = "lib64"
-BASE_LIB:tune-armv8r-crypto                = "lib64"
+TUNE_FEATURES:tune-armv8r            =+ "aarch64"
+PACKAGE_EXTRA_ARCHS:tune-armv8r      =+ "aarch64"
+BASE_LIB:tune-armv8r                 = "lib64"
+BASE_LIB:tune-armv8r-crc             = "lib64"
+BASE_LIB:tune-armv8r-crypto          = "lib64"
+BASE_LIB:tune-armv8r-simd            = "lib64"
+BASE_LIB:tune-armv8r-crc-simd        = "lib64"
+BASE_LIB:tune-armv8r-crc-crypto-simd = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/arm/armv8r/tune-cortexr52.inc b/meta-arm-bsp/conf/machine/include/arm/armv8r/tune-cortexr52.inc
new file mode 100644
index 0000000..3a97cf8
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/arm/armv8r/tune-cortexr52.inc
@@ -0,0 +1,14 @@
+#
+# Tune Settings for Cortex-R52
+#
+DEFAULTTUNE ?= "cortexr52"
+
+TUNEVALID[cortexr52] = "Enable Cortex-R52 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexr52', ' -mcpu=cortex-r52', '', d)}"
+
+require conf/machine/include/arm/arch-armv8r.inc
+
+AVAILTUNES                             += "cortexr52"
+ARMPKGARCH:tune-cortexr52               = "cortexr52"
+TUNE_FEATURES:tune-cortexr52            = "${TUNE_FEATURES:tune-armv8r-crc-simd} cortexr52"
+PACKAGE_EXTRA_ARCHS:tune-cortexr52      = "${PACKAGE_EXTRA_ARCHS:tune-armv8r-crc-simd} cortexr52"
diff --git a/meta-arm-bsp/conf/machine/include/arm/feature-arm-crc.inc b/meta-arm-bsp/conf/machine/include/arm/feature-arm-crc.inc
new file mode 100644
index 0000000..8a69d2e
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/arm/feature-arm-crc.inc
@@ -0,0 +1,4 @@
+# Cyclic Redundancy Check (CRC) instructions for armv8-a and armv8-r
+
+TUNEVALID[crc] = "Enable instructions for ARMv8 Cyclic Redundancy Check (CRC)"
+TUNE_CCARGS_MARCH_OPTS .= "${@bb.utils.contains('TUNE_FEATURES', 'crc', '+crc', '', d)}"
diff --git a/meta-arm-bsp/conf/machine/include/arm/feature-arm-crypto.inc b/meta-arm-bsp/conf/machine/include/arm/feature-arm-crypto.inc
new file mode 100644
index 0000000..aade6ce
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/arm/feature-arm-crypto.inc
@@ -0,0 +1,5 @@
+# Cryptographic instructions for:
+# armv8-a, armv8.1-a, armv8.3-a, armv8.4-a, armv8.5-a, armv8.6-a, and armv8-r
+
+TUNEVALID[crypto] = "Enable cryptographic instructions for ARMv8"
+TUNE_CCARGS_MARCH_OPTS .= "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '+crypto', '', d)}"
diff --git a/meta-arm-bsp/conf/machine/include/arm/feature-arm-idiv.inc b/meta-arm-bsp/conf/machine/include/arm/feature-arm-idiv.inc
new file mode 100644
index 0000000..0ea42b1
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/arm/feature-arm-idiv.inc
@@ -0,0 +1,2 @@
+TUNEVALID[idiv] = "ARM-state integer division instructions"
+TUNE_CCARGS_MARCH_OPTS .= "${@bb.utils.contains('TUNE_FEATURES', 'idiv', '+idiv', '', d)}"
diff --git a/meta-arm-bsp/conf/machine/include/arm/feature-arm-simd.inc b/meta-arm-bsp/conf/machine/include/arm/feature-arm-simd.inc
new file mode 100644
index 0000000..1afaf8d
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/arm/feature-arm-simd.inc
@@ -0,0 +1,5 @@
+# Advanced SIMD and floating-point instructions for armv7-a, armv7ve,
+# armv8-a, armv8.1-a, armv8.3-a, armv8.4-a, armv8.5-a, armv8.6-a, and armv8-r
+
+TUNEVALID[simd] = "Enable instructions for Advanced SIMD and floating-point units"
+TUNE_CCARGS_MARCH_OPTS .= "${@bb.utils.contains('TUNE_FEATURES', 'simd', '+simd', '', d)}"
-- 
2.17.1

