Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.43913.1629227314243386162
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Aug 2021 12:08:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C08131B
	for <meta-arm@lists.yoctoproject.org>; Tue, 17 Aug 2021 12:08:27 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 008B63F40C
	for <meta-arm@lists.yoctoproject.org>; Tue, 17 Aug 2021 12:08:26 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm-bsp: remove upstreamed cortex-m tunes
Date: Mon, 16 Aug 2021 17:39:11 -0400
Message-Id: <20210816213913.8016-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../conf/machine/include/arm/arch-armv7em.inc | 17 ---------
 .../conf/machine/include/arm/arch-armv7m.inc  | 17 ---------
 .../include/arm/arch-armv8-1m-main.inc        | 18 ----------
 .../machine/include/arm/arch-armv8m-base.inc  | 17 ---------
 .../machine/include/arm/arch-armv8m-main.inc  | 36 -------------------
 .../include/arm/armv8-1m/tune-cortexm55.inc   | 14 --------
 .../include/arm/armv8-m/tune-cortexm23.inc    | 14 --------
 .../include/arm/armv8-m/tune-cortexm33.inc    | 17 ---------
 .../include/arm/armv8-m/tune-cortexm35p.inc   | 17 ---------
 .../machine/include/arm/tune-cortexm1.inc     | 14 --------
 .../machine/include/arm/tune-cortexm3.inc     | 14 --------
 .../machine/include/arm/tune-cortexm4.inc     | 14 --------
 .../machine/include/arm/tune-cortexm7.inc     | 14 --------
 13 files changed, 223 deletions(-)
 delete mode 100755 meta-arm-bsp/conf/machine/include/arm/arch-armv7em.inc
 delete mode 100755 meta-arm-bsp/conf/machine/include/arm/arch-armv7m.inc
 delete mode 100755 meta-arm-bsp/conf/machine/include/arm/arch-armv8-1m-main.inc
 delete mode 100755 meta-arm-bsp/conf/machine/include/arm/arch-armv8m-base.inc
 delete mode 100755 meta-arm-bsp/conf/machine/include/arm/arch-armv8m-main.inc
 delete mode 100644 meta-arm-bsp/conf/machine/include/arm/armv8-1m/tune-cortexm55.inc
 delete mode 100644 meta-arm-bsp/conf/machine/include/arm/armv8-m/tune-cortexm23.inc
 delete mode 100644 meta-arm-bsp/conf/machine/include/arm/armv8-m/tune-cortexm33.inc
 delete mode 100644 meta-arm-bsp/conf/machine/include/arm/armv8-m/tune-cortexm35p.inc
 delete mode 100644 meta-arm-bsp/conf/machine/include/arm/tune-cortexm1.inc
 delete mode 100644 meta-arm-bsp/conf/machine/include/arm/tune-cortexm3.inc
 delete mode 100644 meta-arm-bsp/conf/machine/include/arm/tune-cortexm4.inc
 delete mode 100644 meta-arm-bsp/conf/machine/include/arm/tune-cortexm7.inc

diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv7em.inc b/meta-arm-bsp/conf/machine/include/arm/arch-armv7em.inc
deleted file mode 100755
index adcab27..0000000
--- a/meta-arm-bsp/conf/machine/include/arm/arch-armv7em.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-#
-# Defaults for ARMv7e-m
-#
-DEFAULTTUNE ?= "armv7em"
-
-TUNEVALID[armv7em] = "Enable instructions for ARMv7e-m"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7em', ' -march=armv7e-m', '', d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7em', 'armv7em:', '', d)}"
-
-TUNECONFLICTS[armv7em] = "armv4 armv5 armv6 armv7a"
-
-require conf/machine/include/arm/arch-armv7m.inc
-
-AVAILTUNES                            += "armv7em"
-ARMPKGARCH:tune-armv7em                = "armv7em"
-TUNE_FEATURES:tune-armv7em             = "armv7em"
-PACKAGE_EXTRA_ARCHS:tune-armv7em       = "armv7em"
diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv7m.inc b/meta-arm-bsp/conf/machine/include/arm/arch-armv7m.inc
deleted file mode 100755
index a36c265..0000000
--- a/meta-arm-bsp/conf/machine/include/arm/arch-armv7m.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-#
-# Defaults for ARMv7-m
-#
-DEFAULTTUNE ?= "armv7m"
-
-TUNEVALID[armv7m] = "Enable instructions for ARMv7-m"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7m', ' -march=armv7-m', '', d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7m', 'armv7m:', '', d)}"
-
-TUNECONFLICTS[armv7m] = "armv4 armv5 armv6 armv7a"
-
-require conf/machine/include/arm/arch-armv6m.inc
-
-AVAILTUNES                            += "armv7m"
-ARMPKGARCH:tune-armv7m                 = "armv7m"
-TUNE_FEATURES:tune-armv7m              = "armv7m"
-PACKAGE_EXTRA_ARCHS:tune-armv7m        = "armv7m"
diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv8-1m-main.inc b/meta-arm-bsp/conf/machine/include/arm/arch-armv8-1m-main.inc
deleted file mode 100755
index 9171b31..0000000
--- a/meta-arm-bsp/conf/machine/include/arm/arch-armv8-1m-main.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-#
-#
-# Defaults for ARMv8.1-M.main
-#
-DEFAULTTUNE ?= "armv8-1m-main"
-
-TUNEVALID[armv8-1m-main] = "Enable instructions for ARMv8.1-m.main"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8-1m-main', ' -march=armv8.1-m.main', '', d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-1m-main', 'armv8-1m-main:', '', d)}"
-
-TUNECONFLICTS[armv8-1m-main] = "armv4 armv5 armv6 armv7a"
-
-require conf/machine/include/arm/arch-armv8m-main.inc
-
-AVAILTUNES                            += "armv8-1m-main"
-ARMPKGARCH:tune-armv8-1m-main          = "armv8-1m-main"
-TUNE_FEATURES:tune-armv8-1m-main       = "armv8-1m-main"
-PACKAGE_EXTRA_ARCHS:tune-armv8-1m-main = "armv8-1m-main"
diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-base.inc b/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-base.inc
deleted file mode 100755
index d9a341c..0000000
--- a/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-base.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-#
-# Defaults for ARMv8-m.base
-#
-DEFAULTTUNE ?= "armv8m-base"
-
-TUNEVALID[armv8m-base] = "Enable instructions for ARMv8-m.base"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8m-base', ' -march=armv8-m.base', '', d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8m-base', 'armv8m-base:', '', d)}"
-
-TUNECONFLICTS[armv8m-base] = "armv4 armv5 armv6 armv7a"
-
-require conf/machine/include/arm/arch-armv7m.inc
-
-AVAILTUNES                          += "armv8m-base"
-ARMPKGARCH:tune-armv8m-base          = "armv8m-base"
-TUNE_FEATURES:tune-armv8m-base       = "armv8m-base"
-PACKAGE_EXTRA_ARCHS:tune-armv8m-base = "armv8m-base"
diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-main.inc b/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-main.inc
deleted file mode 100755
index 27f552b..0000000
--- a/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-main.inc
+++ /dev/null
@@ -1,36 +0,0 @@
-#
-# Defaults for ARMv8-m.main
-#
-DEFAULTTUNE ?= "armv8m-main"
-
-require conf/machine/include/arm/arch-armv8m-base.inc
-
-TUNEVALID[armv8m-main] = "Enable instructions for ARMv8-m.main"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8m-main', ' -march=armv8-m.main${MARCH_DSP}${MARCH_FPU}', '', d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8m-main', 'armv8m-main:', '', d)}"
-
-TUNECONFLICTS[armv8m-main] = "armv4 armv5 armv6 armv7a"
-
-# FIXME - below taken from meta/conf/machine/include/arm/arch-armv5-dsp.inc and should be put into something more generic
-TUNEVALID[dsp] = "ARM DSP functionality"
-ARMPKGSFX_DSP = "${@bb.utils.contains('TUNE_FEATURES', [ 'dsp' ], 'e', '', d)}"
-MARCH_DSP = "${@bb.utils.contains('TUNE_FEATURES', [ 'dsp' ], '+dsp', '+nodsp', d)}"
-
-# FIXME - Below belongs in meta/conf/machine/include/arm/feature-arm-neon.inc
-TUNEVALID[vfpv5spd16] = "Enable Vector Floating Point Version 5, Single Precision. with 16 registers (fpv5-sp-d16) unit."
-TUNE_CCARGS_MFPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv5spd16', 'fpv5-sp-d16', '', d)}"
-MARCH_FPU = "${@bb.utils.contains('TUNE_FEATURES', [ 'vfpv5spd16' ], '+fp', '+nofp', d)}"
-
-AVAILTUNES                                      += "armv8m-main armv8m-mainearmv8m-main-vfpv5spd16 armv8m-maine-vfpv5spd16"
-ARMPKGARCH:tune-armv8m-main                      = "armv8m-main"
-ARMPKGARCH:tune-armv8m-maine                     = "armv8m-main"
-ARMPKGARCH:tune-armv8m-main-vfpv5spd16           = "armv8m-main"
-ARMPKGARCH:tune-armv8m-maine-vfpv5spd16          = "armv8m-main"
-TUNE_FEATURES:tune-armv8m-main                   = "armv8m-main"
-TUNE_FEATURES:tune-armv8m-maine                  = "${TUNE_FEATURES:tune-armv8m-main} dsp"
-TUNE_FEATURES:tune-armv8m-main-vfpv5spd16        = "${TUNE_FEATURES:tune-armv8m-main} vfpv5spd16"
-TUNE_FEATURES:tune-armv8m-maine-vfpv5spd16       = "${TUNE_FEATURES:tune-armv8m-main-vfpv5spd16} dsp"
-PACKAGE_EXTRA_ARCHS:tune-armv8m-main             = "armv8m-main"
-PACKAGE_EXTRA_ARCHS:tune-armv8m-maine            = "${PACKAGE_EXTRA_ARCHS:tune-armv8m-main} armv8m-maine"
-PACKAGE_EXTRA_ARCHS:tune-armv8m-main-vfpv5spd16  = "${PACKAGE_EXTRA_ARCHS:tune-armv8m-main} armv8m-main-fpv5-spd16"
-PACKAGE_EXTRA_ARCHS:tune-armv8m-maine-vfpv5spd16 = "${PACKAGE_EXTRA_ARCHS:tune-armv8m-main} armv8m-maine-fpv5-spd16"
diff --git a/meta-arm-bsp/conf/machine/include/arm/armv8-1m/tune-cortexm55.inc b/meta-arm-bsp/conf/machine/include/arm/armv8-1m/tune-cortexm55.inc
deleted file mode 100644
index 493ad67..0000000
--- a/meta-arm-bsp/conf/machine/include/arm/armv8-1m/tune-cortexm55.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-#
-# Tune Settings for Cortex-M55
-#
-DEFAULTTUNE ?= "cortexm55"
-
-TUNEVALID[cortexm55] = "Enable Cortex-M55 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm55', ' -mcpu=cortex-m55', '', d)}"
-
-require conf/machine/include/arm/arch-armv8-1m-main.inc
-
-AVAILTUNES                            += "cortexm55"
-ARMPKGARCH:tune-cortexm55              = "cortexm55"
-TUNE_FEATURES:tune-cortexm55           = "${TUNE_FEATURES:tune-armv8-1m-main} cortexm55"
-PACKAGE_EXTRA_ARCHS:tune-cortexm55     = "${PACKAGE_EXTRA_ARCHS:tune-armv8-1m-main} cortexm55"
diff --git a/meta-arm-bsp/conf/machine/include/arm/armv8-m/tune-cortexm23.inc b/meta-arm-bsp/conf/machine/include/arm/armv8-m/tune-cortexm23.inc
deleted file mode 100644
index 25780bc..0000000
--- a/meta-arm-bsp/conf/machine/include/arm/armv8-m/tune-cortexm23.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-#
-# Tune Settings for Cortex-M23
-#
-DEFAULTTUNE ?= "cortexm23"
-
-TUNEVALID[cortexm23] = "Enable Cortex-M23 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm23', ' -mcpu=cortex-m23', '', d)}"
-
-require conf/machine/include/arm/arch-armv8m-base.inc
-
-AVAILTUNES                          += "cortexm23"
-ARMPKGARCH:tune-cortexm23            = "cortexm23"
-TUNE_FEATURES:tune-cortexm23         = "${TUNE_FEATURES:tune-armv8m-base} cortexm23"
-PACKAGE_EXTRA_ARCHS:tune-cortexm23   = "${PACKAGE_EXTRA_ARCHS:tune-armv8m-base} cortexm23"
diff --git a/meta-arm-bsp/conf/machine/include/arm/armv8-m/tune-cortexm33.inc b/meta-arm-bsp/conf/machine/include/arm/armv8-m/tune-cortexm33.inc
deleted file mode 100644
index 04d1fe2..0000000
--- a/meta-arm-bsp/conf/machine/include/arm/armv8-m/tune-cortexm33.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-#
-# Tune Settings for Cortex-M33
-#
-DEFAULTTUNE ?= "cortexm33"
-
-TUNEVALID[cortexm33] = "Enable Cortex-M33 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm33', ' -mcpu=cortex-m33', '', d)}"
-
-require conf/machine/include/arm/arch-armv8m-main.inc
-
-# GCC thnks that DSP and VFP are required, but Arm docs say it is
-# optional.  So forcing below so that compiling works, but this should
-# be fixed in GCC
-AVAILTUNES                          += "cortexm33"
-ARMPKGARCH:tune-cortexm33            = "cortexm33"
-TUNE_FEATURES:tune-cortexm33         = "${TUNE_FEATURES:tune-armv8m-maine-vfpv5spd16} cortexm33"
-PACKAGE_EXTRA_ARCHS:tune-cortexm33   = "${PACKAGE_EXTRA_ARCHS:tune-armv8m-maine-vfpv5spd16} cortexm33e-fpv5-spd16"
diff --git a/meta-arm-bsp/conf/machine/include/arm/armv8-m/tune-cortexm35p.inc b/meta-arm-bsp/conf/machine/include/arm/armv8-m/tune-cortexm35p.inc
deleted file mode 100644
index 60e978f..0000000
--- a/meta-arm-bsp/conf/machine/include/arm/armv8-m/tune-cortexm35p.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-#
-# Tune Settings for Cortex-M35P
-#
-DEFAULTTUNE ?= "cortexm35p"
-
-TUNEVALID[cortexm35p] = "Enable Cortex-M35p specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm35p', ' -mcpu=cortex-m35p', '', d)}"
-
-require conf/machine/include/arm/arch-armv8m-main.inc
-
-# GCC thnks that DSP and VFP are required, but Arm docs say it is
-# optional.  So forcing below so that compiling works, but this should
-# be fixed in GCC
-AVAILTUNES                          += "cortexm35p"
-ARMPKGARCH:tune-cortexm35p           = "cortexm35p"
-TUNE_FEATURES:tune-cortexm35p        = "${TUNE_FEATURES:tune-armv8m-maine-vfpv5spd16} cortexm35p"
-PACKAGE_EXTRA_ARCHS:tune-cortexm35p  = "${PACKAGE_EXTRA_ARCHS:tune-armv8m-maine-vfpv5spd16} cortexm35pe-fpv5-spd16"
diff --git a/meta-arm-bsp/conf/machine/include/arm/tune-cortexm1.inc b/meta-arm-bsp/conf/machine/include/arm/tune-cortexm1.inc
deleted file mode 100644
index 16661f3..0000000
--- a/meta-arm-bsp/conf/machine/include/arm/tune-cortexm1.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-#
-# Tune Settings for Cortex-M1
-#
-DEFAULTTUNE ?= "cortexm1"
-
-TUNEVALID[cortexm1] = "Enable Cortex-M1 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm1', ' -mcpu=cortex-m1', '', d)}"
-
-require conf/machine/include/arm/arch-armv6m.inc
-
-AVAILTUNES                            += "cortexm1"
-ARMPKGARCH:tune-cortexm1               = "cortexm1"
-TUNE_FEATURES:tune-cortexm1            = "${TUNE_FEATURES:tune-armv6m} cortexm1"
-PACKAGE_EXTRA_ARCHS:tune-cortexm1      = "${PACKAGE_EXTRA_ARCHS:tune-armv6m} cortexm1"
diff --git a/meta-arm-bsp/conf/machine/include/arm/tune-cortexm3.inc b/meta-arm-bsp/conf/machine/include/arm/tune-cortexm3.inc
deleted file mode 100644
index a6cb566..0000000
--- a/meta-arm-bsp/conf/machine/include/arm/tune-cortexm3.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-#
-# Tune Settings for Cortex-M3
-#
-DEFAULTTUNE ?= "cortexm3"
-
-TUNEVALID[cortexm3] = "Enable Cortex-M3 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm3', ' -mcpu=cortex-m3', '', d)}"
-
-require conf/machine/include/arm/arch-armv7m.inc
-
-AVAILTUNES                            += "cortexm3"
-ARMPKGARCH:tune-cortexm3               = "cortexm3"
-TUNE_FEATURES:tune-cortexm3            = "${TUNE_FEATURES:tune-armv7m} cortexm3"
-PACKAGE_EXTRA_ARCHS:tune-cortexm3      = "${PACKAGE_EXTRA_ARCHS:tune-armv7m} cortexm3"
diff --git a/meta-arm-bsp/conf/machine/include/arm/tune-cortexm4.inc b/meta-arm-bsp/conf/machine/include/arm/tune-cortexm4.inc
deleted file mode 100644
index e86622f..0000000
--- a/meta-arm-bsp/conf/machine/include/arm/tune-cortexm4.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-#
-# Tune Settings for Cortex-M4
-#
-DEFAULTTUNE ?= "cortexm4"
-
-TUNEVALID[cortexm4] = "Enable Cortex-M4 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm4', ' -mcpu=cortex-m4', '', d)}"
-
-require conf/machine/include/arm/arch-armv7em.inc
-
-AVAILTUNES                            += "cortexm4"
-ARMPKGARCH:tune-cortexm4               = "cortexm4"
-TUNE_FEATURES:tune-cortexm4            = "${TUNE_FEATURES:tune-armv7em} cortexm4"
-PACKAGE_EXTRA_ARCHS:tune-cortexm4      = "${PACKAGE_EXTRA_ARCHS:tune-armv7em} cortexm4"
diff --git a/meta-arm-bsp/conf/machine/include/arm/tune-cortexm7.inc b/meta-arm-bsp/conf/machine/include/arm/tune-cortexm7.inc
deleted file mode 100644
index 6434ec6..0000000
--- a/meta-arm-bsp/conf/machine/include/arm/tune-cortexm7.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-#
-# Tune Settings for Cortex-M7
-#
-DEFAULTTUNE ?= "cortexm7"
-
-TUNEVALID[cortexm7] = "Enable Cortex-M7 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm7', ' -mcpu=cortex-m7', '', d)}"
-
-require conf/machine/include/arm/arch-armv7em.inc
-
-AVAILTUNES                            += "cortexm7"
-ARMPKGARCH:tune-cortexm7               = "cortexm7"
-TUNE_FEATURES:tune-cortexm7            = "${TUNE_FEATURES:tune-armv7em} cortexm7"
-PACKAGE_EXTRA_ARCHS:tune-cortexm7      = "${PACKAGE_EXTRA_ARCHS:tune-armv7em} cortexm7"
-- 
2.17.1

