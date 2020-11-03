Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.619.1604424056001392113
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 Nov 2020 09:20:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A50F4106F
	for <meta-arm@lists.yoctoproject.org>; Tue,  3 Nov 2020 09:20:55 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3B7793F718
	for <meta-arm@lists.yoctoproject.org>; Tue,  3 Nov 2020 09:20:55 -0800 (PST)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp: Fix cortexm tunes
Date: Tue,  3 Nov 2020 12:20:46 -0500
Message-Id: <20201103172047.18147-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

Fix the cortex-m tunes to actually function properly.  Tested with
meta-zephyr on musca-b1.

Change-Id: Ib797cafc4f82f6a525cf6b9c0ce4a302a9ef65c2
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../conf/machine/include/arm/arch-armv7em.inc |  1 -
 .../conf/machine/include/arm/arch-armv7m.inc  | 13 --------
 .../include/arm/arch-armv8-1m-main.inc        |  1 -
 .../machine/include/arm/arch-armv8-2a.inc     |  1 -
 .../machine/include/arm/arch-armv8m-base.inc  |  1 -
 .../machine/include/arm/arch-armv8m-main.inc  | 33 ++++++++++++++-----
 .../conf/machine/include/tune-cortexm1.inc    |  1 -
 .../conf/machine/include/tune-cortexm23.inc   |  1 -
 .../conf/machine/include/tune-cortexm3.inc    |  1 -
 .../conf/machine/include/tune-cortexm33.inc   | 18 +++++-----
 .../conf/machine/include/tune-cortexm35p.inc  | 10 +++---
 .../conf/machine/include/tune-cortexm4.inc    |  1 -
 .../conf/machine/include/tune-cortexm55.inc   |  1 -
 .../conf/machine/include/tune-cortexm7.inc    |  1 -
 meta-arm-bsp/conf/machine/musca-b1.conf       |  1 +
 15 files changed, 42 insertions(+), 43 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv7em.inc b/meta-arm-bsp/conf/machine/include/arm/arch-armv7em.inc
index 4f21c6a..197286f 100755
--- a/meta-arm-bsp/conf/machine/include/arm/arch-armv7em.inc
+++ b/meta-arm-bsp/conf/machine/include/arm/arch-armv7em.inc
@@ -11,7 +11,6 @@ TUNECONFLICTS[armv7em] = "armv4 armv5 armv6 armv7a"
 
 require conf/machine/include/arm/arch-armv7m.inc
 
-
 AVAILTUNES                            += "armv7em"
 ARMPKGARCH_tune-armv7em                = "armv7em"
 TUNE_FEATURES_tune-armv7em             = "armv7em"
diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv7m.inc b/meta-arm-bsp/conf/machine/include/arm/arch-armv7m.inc
index af82e6c..c659e8b 100755
--- a/meta-arm-bsp/conf/machine/include/arm/arch-armv7m.inc
+++ b/meta-arm-bsp/conf/machine/include/arm/arch-armv7m.inc
@@ -1,15 +1,3 @@
-#
-# Tune Settings for Cortex-M3
-#
-TUNEVALID[cortexm3] = "Enable Cortex-M3 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm3', ' -mcpu=cortex-m3', '', d)}"
-
-
-AVAILTUNES                            += "cortexm3"
-ARMPKGARCH_tune-cortexm3               = "cortexm3"
-TUNE_FEATURES_tune-cortexm3            = "${TUNE_FEATURES_tune-armv7m} cortexm3"
-PACKAGE_EXTRA_ARCHS_tune-cortexm3      = "${PACKAGE_EXTRA_ARCHS_tune-armv7m} cortexm3"
-
 #
 # Defaults for ARMv7-m
 #
@@ -23,7 +11,6 @@ TUNECONFLICTS[armv7m] = "armv4 armv5 armv6 armv7a"
 
 require conf/machine/include/arm/arch-armv6m.inc
 
-
 AVAILTUNES                            += "armv7m"
 ARMPKGARCH_tune-armv7m                 = "armv7m"
 TUNE_FEATURES_tune-armv7m              = "armv7m"
diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv8-1m-main.inc b/meta-arm-bsp/conf/machine/include/arm/arch-armv8-1m-main.inc
index 505897a..fc8add4 100755
--- a/meta-arm-bsp/conf/machine/include/arm/arch-armv8-1m-main.inc
+++ b/meta-arm-bsp/conf/machine/include/arm/arch-armv8-1m-main.inc
@@ -12,7 +12,6 @@ TUNECONFLICTS[armv8-1m-main] = "armv4 armv5 armv6 armv7a"
 
 require conf/machine/include/arm/arch-armv8m-main.inc
 
-
 AVAILTUNES                            += "armv8-1m-main"
 ARMPKGARCH_tune-armv8-1m-main          = "armv8-1m-main"
 TUNE_FEATURES_tune-armv8-1m-main       = "armv8-1m-main"
diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv8-2a.inc b/meta-arm-bsp/conf/machine/include/arm/arch-armv8-2a.inc
index 528c34e..0af949e 100644
--- a/meta-arm-bsp/conf/machine/include/arm/arch-armv8-2a.inc
+++ b/meta-arm-bsp/conf/machine/include/arm/arch-armv8-2a.inc
@@ -7,7 +7,6 @@ MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-2a', 'armv8-2a
 
 require conf/machine/include/arm/arch-armv8a.inc
 
-
 AVAILTUNES += "armv8-2a armv8-2a-crypto"
 ARMPKGARCH_tune-armv8-2a                    ?= "armv8-2a"
 ARMPKGARCH_tune-armv8-2a-crypto             ?= "armv8-2a"
diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-base.inc b/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-base.inc
index 5df1728..04cdf7d 100755
--- a/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-base.inc
+++ b/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-base.inc
@@ -11,7 +11,6 @@ TUNECONFLICTS[armv8m-base] = "armv4 armv5 armv6 armv7a"
 
 require conf/machine/include/arm/arch-armv7m.inc
 
-
 AVAILTUNES                          += "armv8m-base"
 ARMPKGARCH_tune-armv8m-base          = "armv8m-base"
 TUNE_FEATURES_tune-armv8m-base       = "armv8m-base"
diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-main.inc b/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-main.inc
index a03c01c..f2e078d 100755
--- a/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-main.inc
+++ b/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-main.inc
@@ -1,19 +1,36 @@
 #
-#
-# Defaults for ARMv8-M.main
+# Defaults for ARMv8-m.main
 #
 DEFAULTTUNE ?= "armv8m-main"
 
+require conf/machine/include/arm/arch-armv8m-base.inc
+
 TUNEVALID[armv8m-main] = "Enable instructions for ARMv8-m.main"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8m-main', ' -march=armv8-m.main', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8m-main', ' -march=armv8-m.main${MARCH_DSP}${MARCH_FPU}', '', d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8m-main', 'armv8m-main:', '', d)}"
 
 TUNECONFLICTS[armv8m-main] = "armv4 armv5 armv6 armv7a"
 
-require conf/machine/include/arm/arch-armv8m-base.inc
+# FIXME - below taken from meta/conf/machine/include/arm/arch-armv5-dsp.inc and should be put into something more generic
+TUNEVALID[dsp] = "ARM DSP functionality"
+ARMPKGSFX_DSP = "${@bb.utils.contains('TUNE_FEATURES', [ 'dsp' ], 'e', '', d)}"
+MARCH_DSP = "${@bb.utils.contains('TUNE_FEATURES', [ 'dsp' ], '+dsp', '+nodsp', d)}"
 
+# FIXME - Below belongs in meta/conf/machine/include/arm/feature-arm-neon.inc
+TUNEVALID[vfpv5spd16] = "Enable Vector Floating Point Version 5, Single Precision. with 16 registers (fpv5-sp-d16) unit."
+TUNE_CCARGS_MFPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv5spd16', 'fpv5-sp-d16', '', d)}"
+MARCH_FPU = "${@bb.utils.contains('TUNE_FEATURES', [ 'vfpv5spd16' ], '+fp', '+nofp', d)}"
 
-AVAILTUNES                          += "armv8m-main"
-ARMPKGARCH_tune-armv8m-main          = "armv8m-main"
-TUNE_FEATURES_tune-armv8m-main       = "armv8m-main"
-PACKAGE_EXTRA_ARCHS_tune-armv8m-main = "armv8m-main"
+AVAILTUNES                                      += "armv8m-main armv8m-mainearmv8m-main-vfpv5spd16 armv8m-maine-vfpv5spd16"
+ARMPKGARCH_tune-armv8m-main                      = "armv8m-main"
+ARMPKGARCH_tune-armv8m-maine                     = "armv8m-main"
+ARMPKGARCH_tune-armv8m-main-vfpv5spd16           = "armv8m-main"
+ARMPKGARCH_tune-armv8m-maine-vfpv5spd16          = "armv8m-main"
+TUNE_FEATURES_tune-armv8m-main                   = "armv8m-main"
+TUNE_FEATURES_tune-armv8m-maine                  = "${TUNE_FEATURES_tune-armv8m-main} dsp"
+TUNE_FEATURES_tune-armv8m-main-vfpv5spd16        = "${TUNE_FEATURES_tune-armv8m-main} vfpv5spd16"
+TUNE_FEATURES_tune-armv8m-maine-vfpv5spd16       = "${TUNE_FEATURES_tune-armv8m-main-vfpv5spd16} dsp"
+PACKAGE_EXTRA_ARCHS_tune-armv8m-main             = "armv8m-main"
+PACKAGE_EXTRA_ARCHS_tune-armv8m-maine            = "${PACKAGE_EXTRA_ARCHS_tune-armv8m-main} armv8m-maine"
+PACKAGE_EXTRA_ARCHS_tune-armv8m-main-vfpv5spd16  = "${PACKAGE_EXTRA_ARCHS_tune-armv8m-main} armv8m-main-fpv5-spd16"
+PACKAGE_EXTRA_ARCHS_tune-armv8m-maine-vfpv5spd16 = "${PACKAGE_EXTRA_ARCHS_tune-armv8m-main} armv8m-maine-fpv5-spd16"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm1.inc b/meta-arm-bsp/conf/machine/include/tune-cortexm1.inc
index 0bcdbe2..ed36361 100755
--- a/meta-arm-bsp/conf/machine/include/tune-cortexm1.inc
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexm1.inc
@@ -8,7 +8,6 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm1', ' -mcpu=cortex
 
 require conf/machine/include/arm/arch-armv6m.inc
 
-
 AVAILTUNES                            += "cortexm1"
 ARMPKGARCH_tune-cortexm1               = "cortexm1"
 TUNE_FEATURES_tune-cortexm1            = "${TUNE_FEATURES_tune-armv6m} cortexm1"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm23.inc b/meta-arm-bsp/conf/machine/include/tune-cortexm23.inc
index 12d4c14..e2e0a34 100755
--- a/meta-arm-bsp/conf/machine/include/tune-cortexm23.inc
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexm23.inc
@@ -8,7 +8,6 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm23', ' -mcpu=corte
 
 require conf/machine/include/arm/arch-armv8m-base.inc
 
-
 AVAILTUNES                          += "cortexm23"
 ARMPKGARCH_tune-cortexm23            = "cortexm23"
 TUNE_FEATURES_tune-cortexm23         = "${TUNE_FEATURES_tune-armv8m-base} cortexm23"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm3.inc b/meta-arm-bsp/conf/machine/include/tune-cortexm3.inc
index 605c9a7..f837ad2 100755
--- a/meta-arm-bsp/conf/machine/include/tune-cortexm3.inc
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexm3.inc
@@ -8,7 +8,6 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm3', ' -mcpu=cortex
 
 require conf/machine/include/arm/arch-armv7m.inc
 
-
 AVAILTUNES                            += "cortexm3"
 ARMPKGARCH_tune-cortexm3               = "cortexm3"
 TUNE_FEATURES_tune-cortexm3            = "${TUNE_FEATURES_tune-armv7m} cortexm3"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm33.inc b/meta-arm-bsp/conf/machine/include/tune-cortexm33.inc
index d9c88aa..105a605 100755
--- a/meta-arm-bsp/conf/machine/include/tune-cortexm33.inc
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexm33.inc
@@ -1,15 +1,17 @@
 #
 # Tune Settings for Cortex-M33
 #
-DEFAULTTUNE ?= "armv8m"
+DEFAULTTUNE ?= "cortexm33"
 
-TUNEVALID[armv8m] = "Enable instructions for ARMv8-m"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8m', ' -march=armv7-m', '', d)}"
+TUNEVALID[cortexm33] = "Enable Cortex-M33 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm33', ' -mcpu=cortex-m33', '', d)}"
 
 require conf/machine/include/arm/arch-armv8m-main.inc
 
-AVAILTUNES += "armv8m"
-ARMPKGARCH_tune-armv8m ?= "armv8m"
-TUNE_FEATURES_tune-armv8m = "armv8m"
-PACKAGE_EXTRA_ARCHS_tune-armv8m = "armv8m"
-
+# GCC thnks that DSP and VFP are required, but Arm docs say it is
+# optional.  So forcing below so that compiling works, but this should
+# be fixed in GCC
+AVAILTUNES                          += "cortexm33"
+ARMPKGARCH_tune-cortexm33            = "cortexm33"
+TUNE_FEATURES_tune-cortexm33         = "${TUNE_FEATURES_tune-armv8m-maine-vfpv5spd16} cortexm33"
+PACKAGE_EXTRA_ARCHS_tune-cortexm33   = "${PACKAGE_EXTRA_ARCHS_tune-armv8m-maine-vfpv5spd16} cortexm33e-fpv5-spd16"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm35p.inc b/meta-arm-bsp/conf/machine/include/tune-cortexm35p.inc
index 562ee81..7d73421 100755
--- a/meta-arm-bsp/conf/machine/include/tune-cortexm35p.inc
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexm35p.inc
@@ -1,15 +1,17 @@
 #
 # Tune Settings for Cortex-M35P
 #
-DEFAULTTUNE ?= "cortexm33p"
+DEFAULTTUNE ?= "cortexm35p"
 
 TUNEVALID[cortexm35p] = "Enable Cortex-M35p specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm35p', ' -mcpu=cortex-m35p', '', d)}"
 
 require conf/machine/include/arm/arch-armv8m-main.inc
 
-
+# GCC thnks that DSP and VFP are required, but Arm docs say it is
+# optional.  So forcing below so that compiling works, but this should
+# be fixed in GCC
 AVAILTUNES                          += "cortexm35p"
 ARMPKGARCH_tune-cortexm35p           = "cortexm35p"
-TUNE_FEATURES_tune-cortexm35p        = "${TUNE_FEATURES_tune-armv8m-main} cortexm35p"
-PACKAGE_EXTRA_ARCHS_tune-cortexm35p  = "${PACKAGE_EXTRA_ARCHS_tune-armv8m-main} cortexm35p"
+TUNE_FEATURES_tune-cortexm35p        = "${TUNE_FEATURES_tune-armv8m-maine-vfpv5spd16} cortexm35p"
+PACKAGE_EXTRA_ARCHS_tune-cortexm35p  = "${PACKAGE_EXTRA_ARCHS_tune-armv8m-maine-vfpv5spd16} cortexm35pe-fpv5-spd16"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm4.inc b/meta-arm-bsp/conf/machine/include/tune-cortexm4.inc
index 74aa27c..8f498f5 100755
--- a/meta-arm-bsp/conf/machine/include/tune-cortexm4.inc
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexm4.inc
@@ -8,7 +8,6 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm4', ' -mcpu=cortex
 
 require conf/machine/include/arm/arch-armv7em.inc
 
-
 AVAILTUNES                            += "cortexm4"
 ARMPKGARCH_tune-cortexm4               = "cortexm4"
 TUNE_FEATURES_tune-cortexm4            = "${TUNE_FEATURES_tune-armv7em} cortexm4"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm55.inc b/meta-arm-bsp/conf/machine/include/tune-cortexm55.inc
index 3f7f3d7..b92aff1 100755
--- a/meta-arm-bsp/conf/machine/include/tune-cortexm55.inc
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexm55.inc
@@ -8,7 +8,6 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm55', ' -mcpu=corte
 
 require conf/machine/include/arm/arch-armv8-1m-main.inc
 
-
 AVAILTUNES                            += "cortexm55"
 ARMPKGARCH_tune-cortexm55              = "cortexm55"
 TUNE_FEATURES_tune-cortexm55           = "${TUNE_FEATURES_tune-armv8-1m-main} cortexm55"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm7.inc b/meta-arm-bsp/conf/machine/include/tune-cortexm7.inc
index 8409108..21b7c01 100755
--- a/meta-arm-bsp/conf/machine/include/tune-cortexm7.inc
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexm7.inc
@@ -8,7 +8,6 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm7', ' -mcpu=cortex
 
 require conf/machine/include/arm/arch-armv7em.inc
 
-
 AVAILTUNES                            += "cortexm7"
 ARMPKGARCH_tune-cortexm7               = "cortexm7"
 TUNE_FEATURES_tune-cortexm7            = "${TUNE_FEATURES_tune-armv7em} cortexm7"
diff --git a/meta-arm-bsp/conf/machine/musca-b1.conf b/meta-arm-bsp/conf/machine/musca-b1.conf
index 50b2f05..e5b77e7 100644
--- a/meta-arm-bsp/conf/machine/musca-b1.conf
+++ b/meta-arm-bsp/conf/machine/musca-b1.conf
@@ -7,6 +7,7 @@
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-m"
 PREFERRED_VERSION_trusted-firmware-m = "1.0"
 
+DEFAULTTUNE ?= "armv8m-main"
 require conf/machine/include/tune-cortexm33.inc
 
 # GLIBC will not work with Cortex-M.
-- 
2.17.1

