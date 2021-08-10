Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.11444.1628705957137135562
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 Aug 2021 11:19:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5BA28D6E
	for <meta-arm@lists.yoctoproject.org>; Wed, 11 Aug 2021 11:19:15 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3BB693F40C
	for <meta-arm@lists.yoctoproject.org>; Wed, 11 Aug 2021 11:19:15 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp: tune file clean-up
Date: Tue, 10 Aug 2021 16:44:56 -0400
Message-Id: <20210810204456.16005-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1

Remove tune files that are already in oe-core, and move ARMv8 ones to
their theoretical location.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../conf/machine/include/arm/arch-armv6m.inc  | 19 -------------------
 .../machine/include/arm/arch-armv8-2a.inc     | 18 ------------------
 .../{ => arm/armv8-1m}/tune-cortexm55.inc     |  0
 .../{ => arm/armv8-m}/tune-cortexm23.inc      |  0
 .../{ => arm/armv8-m}/tune-cortexm33.inc      |  0
 .../{ => arm/armv8-m}/tune-cortexm35p.inc     |  0
 .../include/{ => arm}/tune-cortexm1.inc       |  0
 .../include/{ => arm}/tune-cortexm3.inc       |  0
 .../include/{ => arm}/tune-cortexm4.inc       |  0
 .../include/{ => arm}/tune-cortexm7.inc       |  0
 .../conf/machine/include/tune-cortexm0.inc    | 14 --------------
 .../machine/include/tune-cortexm0plus.inc     | 14 --------------
 meta-arm-bsp/conf/machine/musca-b1.conf       |  2 +-
 meta-arm-bsp/conf/machine/musca-s1.conf       |  2 +-
 14 files changed, 2 insertions(+), 67 deletions(-)
 delete mode 100755 meta-arm-bsp/conf/machine/include/arm/arch-armv6m.inc
 delete mode 100644 meta-arm-bsp/conf/machine/include/arm/arch-armv8-2a.inc
 rename meta-arm-bsp/conf/machine/include/{ => arm/armv8-1m}/tune-cortexm55.inc (100%)
 mode change 100755 => 100644
 rename meta-arm-bsp/conf/machine/include/{ => arm/armv8-m}/tune-cortexm23.inc (100%)
 mode change 100755 => 100644
 rename meta-arm-bsp/conf/machine/include/{ => arm/armv8-m}/tune-cortexm33.inc (100%)
 mode change 100755 => 100644
 rename meta-arm-bsp/conf/machine/include/{ => arm/armv8-m}/tune-cortexm35p.inc (100%)
 mode change 100755 => 100644
 rename meta-arm-bsp/conf/machine/include/{ => arm}/tune-cortexm1.inc (100%)
 mode change 100755 => 100644
 rename meta-arm-bsp/conf/machine/include/{ => arm}/tune-cortexm3.inc (100%)
 mode change 100755 => 100644
 rename meta-arm-bsp/conf/machine/include/{ => arm}/tune-cortexm4.inc (100%)
 mode change 100755 => 100644
 rename meta-arm-bsp/conf/machine/include/{ => arm}/tune-cortexm7.inc (100%)
 mode change 100755 => 100644
 delete mode 100755 meta-arm-bsp/conf/machine/include/tune-cortexm0.inc
 delete mode 100755 meta-arm-bsp/conf/machine/include/tune-cortexm0plus.inc

diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv6m.inc b/meta-arm-bsp/conf/machine/include/arm/arch-armv6m.inc
deleted file mode 100755
index e7ca665..0000000
--- a/meta-arm-bsp/conf/machine/include/arm/arch-armv6m.inc
+++ /dev/null
@@ -1,19 +0,0 @@
-# Tuning for ARMV6-m defined in ARM v6-M ArchitectureReference Manual
-# at https://static.docs.arm.com/ddi0419/d/DDI0419D_armv6m_arm.pdf
-DEFAULTTUNE ?= "armv6m"
-
-TUNEVALID[armv6m] = "Enable instructions for ARMv6-m"
-TUNECONFLICTS[armv6m] = "armv4 armv5 armv6 armv7a"
-
-# Use armv6s-m instead of armv6-m to avoid gcc bug "SVC is not permitted on this architecture".
-# SVC is a valid instruction.
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv6m', ' -march=armv6s-m', '', d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv6m', 'armv6m:', '', d)}"
-
-require conf/machine/include/arm/arch-armv5.inc
-
-# Little Endian
-AVAILTUNES += "armv6m"
-ARMPKGARCH:tune-armv6m             = "armv6m"
-TUNE_FEATURES:tune-armv6m          = "armv6m"
-PACKAGE_EXTRA_ARCHS:tune-armv6m    = "armv6m"
diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv8-2a.inc b/meta-arm-bsp/conf/machine/include/arm/arch-armv8-2a.inc
deleted file mode 100644
index 3bfe0d5..0000000
--- a/meta-arm-bsp/conf/machine/include/arm/arch-armv8-2a.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-DEFAULTTUNE ?= "armv8-2a"
-
-TUNEVALID[armv8-2a] = "Enable instructions for ARMv8-a"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8-2a', ' -march=armv8.2-a', '', d)}"
-# TUNE crypto will be handled by arch-armv8a.inc below
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-2a', 'armv8-2a:', '', d)}"
-
-require conf/machine/include/arm/arch-armv8a.inc
-
-AVAILTUNES += "armv8-2a armv8-2a-crypto"
-ARMPKGARCH:tune-armv8-2a                    ?= "armv8-2a"
-ARMPKGARCH:tune-armv8-2a-crypto             ?= "armv8-2a"
-TUNE_FEATURES:tune-armv8-2a                  = "aarch64 armv8-2a"
-TUNE_FEATURES:tune-armv8-2a-crypto           = "${TUNE_FEATURES:tune-armv8-2a} crypto"
-PACKAGE_EXTRA_ARCHS:tune-armv8-2a            = "${PACKAGE_EXTRA_ARCHS:tune-armv8a} armv8-2a"
-PACKAGE_EXTRA_ARCHS:tune-armv8-2a-crypto     = "${PACKAGE_EXTRA_ARCHS:tune-armv8-2a} armv8-2a-crypto"
-BASE_LIB:tune-armv8-2a                       = "lib64"
-BASE_LIB:tune-armv8-2a-crypto                = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm55.inc b/meta-arm-bsp/conf/machine/include/arm/armv8-1m/tune-cortexm55.inc
old mode 100755
new mode 100644
similarity index 100%
rename from meta-arm-bsp/conf/machine/include/tune-cortexm55.inc
rename to meta-arm-bsp/conf/machine/include/arm/armv8-1m/tune-cortexm55.inc
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm23.inc b/meta-arm-bsp/conf/machine/include/arm/armv8-m/tune-cortexm23.inc
old mode 100755
new mode 100644
similarity index 100%
rename from meta-arm-bsp/conf/machine/include/tune-cortexm23.inc
rename to meta-arm-bsp/conf/machine/include/arm/armv8-m/tune-cortexm23.inc
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm33.inc b/meta-arm-bsp/conf/machine/include/arm/armv8-m/tune-cortexm33.inc
old mode 100755
new mode 100644
similarity index 100%
rename from meta-arm-bsp/conf/machine/include/tune-cortexm33.inc
rename to meta-arm-bsp/conf/machine/include/arm/armv8-m/tune-cortexm33.inc
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm35p.inc b/meta-arm-bsp/conf/machine/include/arm/armv8-m/tune-cortexm35p.inc
old mode 100755
new mode 100644
similarity index 100%
rename from meta-arm-bsp/conf/machine/include/tune-cortexm35p.inc
rename to meta-arm-bsp/conf/machine/include/arm/armv8-m/tune-cortexm35p.inc
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm1.inc b/meta-arm-bsp/conf/machine/include/arm/tune-cortexm1.inc
old mode 100755
new mode 100644
similarity index 100%
rename from meta-arm-bsp/conf/machine/include/tune-cortexm1.inc
rename to meta-arm-bsp/conf/machine/include/arm/tune-cortexm1.inc
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm3.inc b/meta-arm-bsp/conf/machine/include/arm/tune-cortexm3.inc
old mode 100755
new mode 100644
similarity index 100%
rename from meta-arm-bsp/conf/machine/include/tune-cortexm3.inc
rename to meta-arm-bsp/conf/machine/include/arm/tune-cortexm3.inc
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm4.inc b/meta-arm-bsp/conf/machine/include/arm/tune-cortexm4.inc
old mode 100755
new mode 100644
similarity index 100%
rename from meta-arm-bsp/conf/machine/include/tune-cortexm4.inc
rename to meta-arm-bsp/conf/machine/include/arm/tune-cortexm4.inc
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm7.inc b/meta-arm-bsp/conf/machine/include/arm/tune-cortexm7.inc
old mode 100755
new mode 100644
similarity index 100%
rename from meta-arm-bsp/conf/machine/include/tune-cortexm7.inc
rename to meta-arm-bsp/conf/machine/include/arm/tune-cortexm7.inc
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm0.inc b/meta-arm-bsp/conf/machine/include/tune-cortexm0.inc
deleted file mode 100755
index 5b29600..0000000
--- a/meta-arm-bsp/conf/machine/include/tune-cortexm0.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-#
-# Tune Settings for Cortex-M0
-#
-DEFAULTTUNE ?= "cortexm0"
-
-TUNEVALID[cortexm0] = "Enable Cortex-M0 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm0', ' -mcpu=cortex-m0', '', d)}"
-
-require conf/machine/include/arm/arch-armv6m.inc
-
-AVAILTUNES                            += "cortexm0"
-ARMPKGARCH:tune-cortexm0               = "cortexm0"
-TUNE_FEATURES:tune-cortexm0            = "${TUNE_FEATURES:tune-armv6m} cortexm0"
-PACKAGE_EXTRA_ARCHS:tune-cortexm0      = "${PACKAGE_EXTRA_ARCHS:tune-armv6m} cortexm0"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm0plus.inc b/meta-arm-bsp/conf/machine/include/tune-cortexm0plus.inc
deleted file mode 100755
index 1a3bee4..0000000
--- a/meta-arm-bsp/conf/machine/include/tune-cortexm0plus.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-#
-# Tune Settings for Cortex-M0+
-#
-DEFAULTTUNE ?= "cortexm0-plus"
-
-TUNEVALID[cortexm0-plus] = "Enable Cortex-M0 Plus specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm0-plus', ' -mcpu=cortex-m0plus', '', d)}"
-
-require conf/machine/include/arm/arch-armv6m.inc
-
-AVAILTUNES                            += "cortexm0-plus"
-ARMPKGARCH:tune-cortexm0-plus          = "cortexm0-plus"
-TUNE_FEATURES:tune-cortexm0-plus       = "${TUNE_FEATURES:tune-armv6m} cortexm0-plus"
-PACKAGE_EXTRA_ARCHS:tune-cortexm0-plus = "${PACKAGE_EXTRA_ARCHS:tune-armv6m} cortexm0-plus"
diff --git a/meta-arm-bsp/conf/machine/musca-b1.conf b/meta-arm-bsp/conf/machine/musca-b1.conf
index 76fe8c8..fa1264e 100644
--- a/meta-arm-bsp/conf/machine/musca-b1.conf
+++ b/meta-arm-bsp/conf/machine/musca-b1.conf
@@ -5,7 +5,7 @@
 #@DESCRIPTION: Machine configuration for Musca-B1
 
 DEFAULTTUNE ?= "armv8m-main"
-require conf/machine/include/tune-cortexm33.inc
+require conf/machine/include/arm/armv8-m/tune-cortexm33.inc
 
 # GLIBC will not work with Cortex-M.
 TCLIBC = "newlib"
diff --git a/meta-arm-bsp/conf/machine/musca-s1.conf b/meta-arm-bsp/conf/machine/musca-s1.conf
index 4b06c74..d71cdfe 100644
--- a/meta-arm-bsp/conf/machine/musca-s1.conf
+++ b/meta-arm-bsp/conf/machine/musca-s1.conf
@@ -4,7 +4,7 @@
 #@NAME: Musca-S1 machine
 #@DESCRIPTION: Machine configuration for Musca-S1
 
-require conf/machine/include/tune-cortexm33.inc
+require conf/machine/include/arm/armv8-m/tune-cortexm33.inc
 
 # GLIBC will not work with Cortex-M.
 TCLIBC = "newlib"
-- 
2.17.1

