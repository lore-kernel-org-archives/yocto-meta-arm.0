Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.8853.1603208225427631806
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Oct 2020 08:37:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7785D6E
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 Oct 2020 08:37:00 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A73483F66B
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 Oct 2020 08:37:00 -0700 (PDT)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm-bsp: remove cortex-a tune files
Date: Fri, 16 Oct 2020 22:41:25 -0400
Message-Id: <20201017024126.28986-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201017024126.28986-1-jon.mason@arm.com>
References: <20201017024126.28986-1-jon.mason@arm.com>

Cortex-a tune files have been accepted into openembedded-core.  So,
those should be used in place of these.  Removing these to prevent any
issues.

Change-Id: Ifca1557a88e50ce6947524222ba7f852fd9a282c
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../conf/machine/include/tune-cortexa15.inc   | 51 -----------------
 .../conf/machine/include/tune-cortexa17.inc   | 51 -----------------
 .../conf/machine/include/tune-cortexa32.inc   | 17 ------
 .../conf/machine/include/tune-cortexa34.inc   | 20 -------
 .../conf/machine/include/tune-cortexa35.inc   | 17 ------
 .../conf/machine/include/tune-cortexa5.inc    | 51 -----------------
 .../conf/machine/include/tune-cortexa53.inc   | 17 ------
 .../conf/machine/include/tune-cortexa55.inc   | 13 -----
 .../include/tune-cortexa57-cortexa53.inc      | 14 -----
 .../conf/machine/include/tune-cortexa57.inc   | 17 ------
 .../conf/machine/include/tune-cortexa65.inc   | 16 ------
 .../conf/machine/include/tune-cortexa65ae.inc | 16 ------
 .../conf/machine/include/tune-cortexa7.inc    | 51 -----------------
 .../include/tune-cortexa72-cortexa53.inc      | 19 -------
 .../conf/machine/include/tune-cortexa72.inc   | 13 -----
 .../include/tune-cortexa73-cortexa35.inc      | 21 -------
 .../include/tune-cortexa73-cortexa53.inc      | 19 -------
 .../conf/machine/include/tune-cortexa73.inc   | 16 ------
 .../include/tune-cortexa75-cortexa55.inc      | 20 -------
 .../conf/machine/include/tune-cortexa75.inc   | 16 ------
 .../include/tune-cortexa76-cortexa55.inc      | 20 -------
 .../conf/machine/include/tune-cortexa76.inc   | 16 ------
 .../conf/machine/include/tune-cortexa76ae.inc | 16 ------
 .../conf/machine/include/tune-cortexa77.inc   | 16 ------
 .../conf/machine/include/tune-cortexa8.inc    | 39 -------------
 .../conf/machine/include/tune-cortexa9.inc    | 55 -------------------
 26 files changed, 637 deletions(-)
 delete mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa15.inc
 delete mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa17.inc
 delete mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa32.inc
 delete mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa34.inc
 delete mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa35.inc
 delete mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa5.inc
 delete mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa53.inc
 delete mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa55.inc
 delete mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa57-cortexa53.inc
 delete mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa57.inc
 delete mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa65.inc
 delete mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa65ae.inc
 delete mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa7.inc
 delete mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa72-cortexa53.inc
 delete mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa72.inc
 delete mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa35.inc
 delete mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa53.inc
 delete mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa73.inc
 delete mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc
 delete mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa75.inc
 delete mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa76-cortexa55.inc
 delete mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa76.inc
 delete mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa76ae.inc
 delete mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa77.inc
 delete mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa8.inc
 delete mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa9.inc

diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa15.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa15.inc
deleted file mode 100644
index 0457c2d..0000000
--- a/meta-arm-bsp/conf/machine/include/tune-cortexa15.inc
+++ /dev/null
@@ -1,51 +0,0 @@
-DEFAULTTUNE ?= "armv7vethf-neon"
-
-require conf/machine/include/arm/arch-armv7ve.inc
-
-TUNEVALID[cortexa15] = "Enable Cortex-A15 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa15', ' -mcpu=cortex-a15', '', d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa15', 'armv7ve:', '', d)}"
-
-# Little Endian base configs
-AVAILTUNES += "cortexa15 cortexa15t cortexa15-neon cortexa15t-neon cortexa15-neon-vfpv4 cortexa15t-neon-vfpv4"
-ARMPKGARCH_tune-cortexa15             = "cortexa15"
-ARMPKGARCH_tune-cortexa15t            = "cortexa15"
-ARMPKGARCH_tune-cortexa15-neon        = "cortexa15"
-ARMPKGARCH_tune-cortexa15t-neon       = "cortexa15"
-ARMPKGARCH_tune-cortexa15-neon-vfpv4  = "cortexa15"
-ARMPKGARCH_tune-cortexa15t-neon-vfpv4 = "cortexa15"
-# mcpu is used so don't use armv7ve as we don't want march
-TUNE_FEATURES_tune-cortexa15             = "arm vfp cortexa15"
-TUNE_FEATURES_tune-cortexa15t            = "${TUNE_FEATURES_tune-cortexa15} thumb"
-TUNE_FEATURES_tune-cortexa15-neon        = "${TUNE_FEATURES_tune-cortexa15} neon"
-TUNE_FEATURES_tune-cortexa15t-neon       = "${TUNE_FEATURES_tune-cortexa15-neon} thumb"
-TUNE_FEATURES_tune-cortexa15-neon-vfpv4  = "${TUNE_FEATURES_tune-cortexa15-neon} vfpv4"
-TUNE_FEATURES_tune-cortexa15t-neon-vfpv4 = "${TUNE_FEATURES_tune-cortexa15-neon-vfpv4} thumb"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve} cortexa15-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet} cortexa15-vfp cortexa15t2-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon} cortexa15-vfp cortexa15-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon} cortexa15-vfp cortexa15-neon cortexa15t2-vfp cortexa15t2-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon-vfpv4} cortexa15-vfp cortexa15-neon cortexa15-neon-vfpv4"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon-vfpv4} cortexa15-vfp cortexa15-neon cortexa15-neon-vfpv4 cortexa15t2-vfp cortexa15t2-neon cortexa15t2-neon-vfpv4"
-
-# HF Tunes
-AVAILTUNES += "cortexa15hf cortexa15thf cortexa15hf-neon cortexa15thf-neon cortexa15hf-neon-vfpv4 cortexa15thf-neon-vfpv4"
-ARMPKGARCH_tune-cortexa15hf             = "cortexa15"
-ARMPKGARCH_tune-cortexa15thf            = "cortexa15"
-ARMPKGARCH_tune-cortexa15hf-neon        = "cortexa15"
-ARMPKGARCH_tune-cortexa15thf-neon       = "cortexa15"
-ARMPKGARCH_tune-cortexa15hf-neon-vfpv4  = "cortexa15"
-ARMPKGARCH_tune-cortexa15thf-neon-vfpv4 = "cortexa15"
-# mcpu is used so don't use armv7ve as we don't want march
-TUNE_FEATURES_tune-cortexa15hf             = "${TUNE_FEATURES_tune-cortexa15} callconvention-hard"
-TUNE_FEATURES_tune-cortexa15thf            = "${TUNE_FEATURES_tune-cortexa15t} callconvention-hard"
-TUNE_FEATURES_tune-cortexa15hf-neon        = "${TUNE_FEATURES_tune-cortexa15-neon} callconvention-hard"
-TUNE_FEATURES_tune-cortexa15thf-neon       = "${TUNE_FEATURES_tune-cortexa15t-neon} callconvention-hard"
-TUNE_FEATURES_tune-cortexa15hf-neon-vfpv4  = "${TUNE_FEATURES_tune-cortexa15-neon-vfpv4} callconvention-hard"
-TUNE_FEATURES_tune-cortexa15thf-neon-vfpv4 = "${TUNE_FEATURES_tune-cortexa15t-neon-vfpv4} callconvention-hard"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf} cortexa15hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf} cortexa15hf-vfp cortexa15t2hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon} cortexa15hf-vfp cortexa15hf-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon} cortexa15hf-vfp cortexa15hf-neon cortexa15t2hf-vfp cortexa15t2hf-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon-vfpv4} cortexa15hf-vfp cortexa15hf-neon cortexa15hf-neon-vfpv4"
-PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon-vfpv4} cortexa15hf-vfp cortexa15hf-neon cortexa15hf-neon-vfpv4 cortexa15t2hf-vfp cortexa15t2hf-neon cortexa15t2hf-neon-vfpv4"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa17.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa17.inc
deleted file mode 100644
index 6a2107f..0000000
--- a/meta-arm-bsp/conf/machine/include/tune-cortexa17.inc
+++ /dev/null
@@ -1,51 +0,0 @@
-DEFAULTTUNE ?= "armv7vethf-neon"
-
-require conf/machine/include/arm/arch-armv7ve.inc
-
-TUNEVALID[cortexa17] = "Enable Cortex-A17 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa17', ' -mcpu=cortex-a17', '', d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa17', 'armv7ve:', '', d)}"
-
-# Little Endian base configs
-AVAILTUNES += "cortexa17 cortexa17t cortexa17-neon cortexa17t-neon cortexa17-neon-vfpv4 cortexa17t-neon-vfpv4"
-ARMPKGARCH_tune-cortexa17             = "cortexa17"
-ARMPKGARCH_tune-cortexa17t            = "cortexa17"
-ARMPKGARCH_tune-cortexa17-neon        = "cortexa17"
-ARMPKGARCH_tune-cortexa17t-neon       = "cortexa17"
-ARMPKGARCH_tune-cortexa17-neon-vfpv4  = "cortexa17"
-ARMPKGARCH_tune-cortexa17t-neon-vfpv4 = "cortexa17"
-# mcpu is used so don't use armv7ve as we don't want march
-TUNE_FEATURES_tune-cortexa17             = "arm vfp cortexa17"
-TUNE_FEATURES_tune-cortexa17t            = "${TUNE_FEATURES_tune-cortexa17} thumb"
-TUNE_FEATURES_tune-cortexa17-neon        = "${TUNE_FEATURES_tune-cortexa17} neon"
-TUNE_FEATURES_tune-cortexa17t-neon       = "${TUNE_FEATURES_tune-cortexa17-neon} thumb"
-TUNE_FEATURES_tune-cortexa17-neon-vfpv4  = "${TUNE_FEATURES_tune-cortexa17-neon} vfpv4"
-TUNE_FEATURES_tune-cortexa17t-neon-vfpv4 = "${TUNE_FEATURES_tune-cortexa17-neon-vfpv4} thumb"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve} cortexa17-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet} cortexa17-vfp cortexa17t2-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon} cortexa17-vfp cortexa17-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon} cortexa17-vfp cortexa17-neon cortexa17t2-vfp cortexa17t2-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon-vfpv4} cortexa17-vfp cortexa17-neon cortexa17-neon-vfpv4"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17t-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon-vfpv4} cortexa17-vfp cortexa17-neon cortexa17-neon-vfpv4 cortexa17t2-vfp cortexa17t2-neon cortexa17t2-neon-vfpv4"
-
-# HF Tunes
-AVAILTUNES += "cortexa17hf cortexa17thf cortexa17hf-neon cortexa17thf-neon cortexa17hf-neon-vfpv4 cortexa17thf-neon-vfpv4"
-ARMPKGARCH_tune-cortexa17hf             = "cortexa17"
-ARMPKGARCH_tune-cortexa17thf            = "cortexa17"
-ARMPKGARCH_tune-cortexa17hf-neon        = "cortexa17"
-ARMPKGARCH_tune-cortexa17thf-neon       = "cortexa17"
-ARMPKGARCH_tune-cortexa17hf-neon-vfpv4  = "cortexa17"
-ARMPKGARCH_tune-cortexa17thf-neon-vfpv4 = "cortexa17"
-# mcpu is used so don't use armv7ve as we don't want march
-TUNE_FEATURES_tune-cortexa17hf             = "${TUNE_FEATURES_tune-cortexa17} callconvention-hard"
-TUNE_FEATURES_tune-cortexa17thf            = "${TUNE_FEATURES_tune-cortexa17t} callconvention-hard"
-TUNE_FEATURES_tune-cortexa17hf-neon        = "${TUNE_FEATURES_tune-cortexa17-neon} callconvention-hard"
-TUNE_FEATURES_tune-cortexa17thf-neon       = "${TUNE_FEATURES_tune-cortexa17t-neon} callconvention-hard"
-TUNE_FEATURES_tune-cortexa17hf-neon-vfpv4  = "${TUNE_FEATURES_tune-cortexa17-neon-vfpv4} callconvention-hard"
-TUNE_FEATURES_tune-cortexa17thf-neon-vfpv4 = "${TUNE_FEATURES_tune-cortexa17t-neon-vfpv4} callconvention-hard"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf} cortexa17hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf} cortexa17hf-vfp cortexa17t2hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon} cortexa17hf-vfp cortexa17hf-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon} cortexa17hf-vfp cortexa17hf-neon cortexa17t2hf-vfp cortexa17t2hf-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17hf-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon-vfpv4} cortexa17hf-vfp cortexa17hf-neon cortexa17hf-neon-vfpv4"
-PACKAGE_EXTRA_ARCHS_tune-cortexa17thf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon-vfpv4} cortexa17hf-vfp cortexa17hf-neon cortexa17hf-neon-vfpv4 cortexa17t2hf-vfp cortexa17t2hf-neon cortexa17t2hf-neon-vfpv4"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa32.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa32.inc
deleted file mode 100644
index e86de6c..0000000
--- a/meta-arm-bsp/conf/machine/include/tune-cortexa32.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-DEFAULTTUNE ?= "cortexa32"
-
-TUNEVALID[cortexa32] = "Enable Cortex-A32 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa32', ' -mcpu=cortex-a32', '', d)}"
-
-require conf/machine/include/arm/arch-armv8a.inc
-
-# Little Endian base configs
-AVAILTUNES += "cortexa32 cortexa32-crypto"
-ARMPKGARCH_tune-cortexa32             = "cortexa32"
-ARMPKGARCH_tune-cortexa32-crypto      = "cortexa32"
-TUNE_FEATURES_tune-cortexa32          = "armv8a cortexa32 crc"
-TUNE_FEATURES_tune-cortexa32-crypto   = "${TUNE_FEATURES_tune-cortexa32} crypto"
-PACKAGE_EXTRA_ARCHS_tune-cortexa32             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa32"
-PACKAGE_EXTRA_ARCHS_tune-cortexa32-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa32 cortexa32-crypto"
-BASE_LIB_tune-cortexa32               = "lib"
-BASE_LIB_tune-cortexa32-crypto        = "lib"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa34.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa34.inc
deleted file mode 100644
index f7d4c87..0000000
--- a/meta-arm-bsp/conf/machine/include/tune-cortexa34.inc
+++ /dev/null
@@ -1,20 +0,0 @@
-#
-# Tune Settings for Cortex-A34
-#
-DEFAULTTUNE ?= "cortexa34"
-
-TUNEVALID[cortexa34] = "Enable Cortex-A34 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa34', ' -mcpu=cortex-a34', '', d)}"
-
-require conf/machine/include/arm/arch-armv8a.inc
-
-# Little Endian base configs
-AVAILTUNES                                += "cortexa34 cortexa34-crypto"
-ARMPKGARCH_tune-cortexa34                  = "cortexa34"
-ARMPKGARCH_tune-cortexa34-crypto           = "cortexa34"
-TUNE_FEATURES_tune-cortexa34               = "${TUNE_FEATURES_tune-armv8a-crc} cortexa34"
-TUNE_FEATURES_tune-cortexa34-crypto        = "${TUNE_FEATURES_tune-cortexa34} crypto"
-PACKAGE_EXTRA_ARCHS_tune-cortexa34         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa34"
-PACKAGE_EXTRA_ARCHS_tune-cortexa34-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa34 cortexa34-crypto"
-BASE_LIB_tune-cortexa34                    = "lib64"
-BASE_LIB_tune-cortexa34-crypto             = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa35.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa35.inc
deleted file mode 100644
index cb3ad4c..0000000
--- a/meta-arm-bsp/conf/machine/include/tune-cortexa35.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-DEFAULTTUNE ?= "cortexa35"
-
-TUNEVALID[cortexa35] = "Enable Cortex-A35 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa35', ' -mcpu=cortex-a35', '', d)}"
-
-require conf/machine/include/arm/arch-armv8a.inc
-
-# Little Endian base configs
-AVAILTUNES += "cortexa35 cortexa35-crypto"
-ARMPKGARCH_tune-cortexa35             = "cortexa35"
-ARMPKGARCH_tune-cortexa35-crypto      = "cortexa35"
-TUNE_FEATURES_tune-cortexa35          = "${TUNE_FEATURES_tune-armv8a-crc} cortexa35"
-TUNE_FEATURES_tune-cortexa35-crypto   = "${TUNE_FEATURES_tune-cortexa35} crypto"
-PACKAGE_EXTRA_ARCHS_tune-cortexa35             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa35"
-PACKAGE_EXTRA_ARCHS_tune-cortexa35-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa35 cortexa35-crypto"
-BASE_LIB_tune-cortexa35               = "lib64"
-BASE_LIB_tune-cortexa35-crypto        = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa5.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa5.inc
deleted file mode 100644
index 923b758..0000000
--- a/meta-arm-bsp/conf/machine/include/tune-cortexa5.inc
+++ /dev/null
@@ -1,51 +0,0 @@
-DEFAULTTUNE ?= "armv7athf-neon"
-
-require conf/machine/include/arm/arch-armv7a.inc
-
-TUNEVALID[cortexa5] = "Enable Cortex-A5 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa5', ' -mcpu=cortex-a5', '', d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa5', 'armv7a:', '', d)}"
-
-# Little Endian base configs
-AVAILTUNES += "cortexa5 cortexa5t cortexa5-neon cortexa5t-neon cortexa5-neon-vfpv4 cortexa5t-neon-vfpv4"
-ARMPKGARCH_tune-cortexa5             = "cortexa5"
-ARMPKGARCH_tune-cortexa5t            = "cortexa5"
-ARMPKGARCH_tune-cortexa5-neon        = "cortexa5"
-ARMPKGARCH_tune-cortexa5t-neon       = "cortexa5"
-ARMPKGARCH_tune-cortexa5-neon-vfpv4  = "cortexa5"
-ARMPKGARCH_tune-cortexa5t-neon-vfpv4 = "cortexa5"
-# mcpu is used so don't use armv7a as we don't want march
-TUNE_FEATURES_tune-cortexa5             = "arm vfp cortexa5"
-TUNE_FEATURES_tune-cortexa5t            = "${TUNE_FEATURES_tune-cortexa5} thumb"
-TUNE_FEATURES_tune-cortexa5-neon        = "${TUNE_FEATURES_tune-cortexa5} neon"
-TUNE_FEATURES_tune-cortexa5t-neon       = "${TUNE_FEATURES_tune-cortexa5-neon} thumb"
-TUNE_FEATURES_tune-cortexa5-neon-vfpv4  = "${TUNE_FEATURES_tune-cortexa5-neon} vfpv4"
-TUNE_FEATURES_tune-cortexa5t-neon-vfpv4 = "${TUNE_FEATURES_tune-cortexa5-neon-vfpv4} thumb"
-PACKAGE_EXTRA_ARCHS_tune-cortexa5             = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa5-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa5t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa5-vfp cortexa5t2-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa5-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa5-vfp cortexa5-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa5t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa5-vfp cortexa5-neon cortexa5t2-vfp cortexa5t2-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa5-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon-vfpv4} cortexa5-vfp cortexa5-neon cortexa5-neon-vfpv4"
-PACKAGE_EXTRA_ARCHS_tune-cortexa5t-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon-vfpv4} cortexa5-vfp cortexa5-neon cortexa5-neon-vfpv4 cortexa5t2-vfp cortexa5t2-neon cortexa5t2-neon-vfpv4"
-
-# HF Tunes
-AVAILTUNES += "cortexa5hf cortexa5thf cortexa5hf-neon cortexa5thf-neon cortexa5hf-neon-vfpv4 cortexa5thf-neon-vfpv4"
-ARMPKGARCH_tune-cortexa5hf             = "cortexa5"
-ARMPKGARCH_tune-cortexa5thf            = "cortexa5"
-ARMPKGARCH_tune-cortexa5hf-neon        = "cortexa5"
-ARMPKGARCH_tune-cortexa5thf-neon       = "cortexa5"
-ARMPKGARCH_tune-cortexa5hf-neon-vfpv4  = "cortexa5"
-ARMPKGARCH_tune-cortexa5thf-neon-vfpv4 = "cortexa5"
-# mcpu is used so don't use armv7a as we don't want march
-TUNE_FEATURES_tune-cortexa5hf             = "${TUNE_FEATURES_tune-cortexa5} callconvention-hard"
-TUNE_FEATURES_tune-cortexa5thf            = "${TUNE_FEATURES_tune-cortexa5t} callconvention-hard"
-TUNE_FEATURES_tune-cortexa5hf-neon        = "${TUNE_FEATURES_tune-cortexa5-neon} callconvention-hard"
-TUNE_FEATURES_tune-cortexa5thf-neon       = "${TUNE_FEATURES_tune-cortexa5t-neon} callconvention-hard"
-TUNE_FEATURES_tune-cortexa5hf-neon-vfpv4  = "${TUNE_FEATURES_tune-cortexa5-neon-vfpv4} callconvention-hard"
-TUNE_FEATURES_tune-cortexa5thf-neon-vfpv4 = "${TUNE_FEATURES_tune-cortexa5t-neon-vfpv4} callconvention-hard"
-PACKAGE_EXTRA_ARCHS_tune-cortexa5hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa5hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa5thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa5hf-vfp cortexa5t2hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa5hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa5hf-vfp cortexa5hf-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa5thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa5hf-vfp cortexa5hf-neon cortexa5t2hf-vfp cortexa5t2hf-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa5hf-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon-vfpv4} cortexa5hf-vfp cortexa5hf-neon cortexa5hf-neon-vfpv4"
-PACKAGE_EXTRA_ARCHS_tune-cortexa5thf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon-vfpv4} cortexa5hf-vfp cortexa5hf-neon cortexa5hf-neon-vfpv4 cortexa5t2hf-vfp cortexa5t2hf-neon cortexa5t2hf-neon-vfpv4"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa53.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa53.inc
deleted file mode 100644
index 7f8863a..0000000
--- a/meta-arm-bsp/conf/machine/include/tune-cortexa53.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-DEFAULTTUNE ?= "cortexa53"
-
-TUNEVALID[cortexa53] = "Enable Cortex-A53 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa53', ' -mcpu=cortex-a53', '', d)}"
-
-require conf/machine/include/arm/arch-armv8a.inc
-
-# Little Endian base configs
-AVAILTUNES += "cortexa53 cortexa53-crypto"
-ARMPKGARCH_tune-cortexa53             = "cortexa53"
-ARMPKGARCH_tune-cortexa53-crypto      = "cortexa53-crypto"
-TUNE_FEATURES_tune-cortexa53          = "${TUNE_FEATURES_tune-armv8a-crc} cortexa53"
-TUNE_FEATURES_tune-cortexa53-crypto   = "${TUNE_FEATURES_tune-cortexa53} crypto"
-PACKAGE_EXTRA_ARCHS_tune-cortexa53             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa53"
-PACKAGE_EXTRA_ARCHS_tune-cortexa53-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa53 cortexa53-crypto"
-BASE_LIB_tune-cortexa53               = "lib64"
-BASE_LIB_tune-cortexa53-crypto        = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa55.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa55.inc
deleted file mode 100644
index e962973..0000000
--- a/meta-arm-bsp/conf/machine/include/tune-cortexa55.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-DEFAULTTUNE ?= "cortexa55"
-
-TUNEVALID[cortexa55] = "Enable Cortex-A55 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa55', ' -mcpu=cortex-a55', '', d)}"
-
-require conf/machine/include/arm/arch-armv8-2a.inc
-
-# Little Endian base configs
-AVAILTUNES += "cortexa55"
-ARMPKGARCH_tune-cortexa55             = "cortexa55"
-TUNE_FEATURES_tune-cortexa55          = "${TUNE_FEATURES_tune-armv8-2a-crypto} cortexa55"
-PACKAGE_EXTRA_ARCHS_tune-cortexa55    = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa55"
-BASE_LIB_tune-cortexa55               = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa57-cortexa53.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa57-cortexa53.inc
deleted file mode 100644
index d329d61..0000000
--- a/meta-arm-bsp/conf/machine/include/tune-cortexa57-cortexa53.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-DEFAULTTUNE ?= "cortexa57-cortexa53"
-
-TUNEVALID[cortexa57-cortexa53] = "Enable big.LITTLE Cortex-A57.Cortex-A53 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa57-cortexa53", " -mcpu=cortex-a57.cortex-a53", "", d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa57-cortexa53", "cortexa57-cortexa53:", "", d)}"
-
-require conf/machine/include/arm/arch-armv8a.inc
-
-# Little Endian base configs
-AVAILTUNES += "cortexa57-cortexa53"
-ARMPKGARCH_tune-cortexa57-cortexa53 = "cortexa57-cortexa53"
-TUNE_FEATURES_tune-cortexa57-cortexa53 = "${TUNE_FEATURES_tune-armv8a-crc} cortexa57-cortexa53"
-PACKAGE_EXTRA_ARCHS_tune-cortexa57-cortexa53 = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa57-cortexa53"
-BASE_LIB_tune-cortexa57-cortexa53 = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa57.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa57.inc
deleted file mode 100644
index 91fa668..0000000
--- a/meta-arm-bsp/conf/machine/include/tune-cortexa57.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-DEFAULTTUNE ?= "cortexa57"
-
-TUNEVALID[cortexa57] = "Enable Cortex-A57 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa57', ' -mcpu=cortex-a57', '', d)}"
-
-require conf/machine/include/arm/arch-armv8a.inc
-
-# Little Endian base configs
-AVAILTUNES += "cortexa57 cortexa57-crypto"
-ARMPKGARCH_tune-cortexa57             = "cortexa57"
-ARMPKGARCH_tune-cortexa57-crypto      = "cortexa57-crypto"
-TUNE_FEATURES_tune-cortexa57          = "${TUNE_FEATURES_tune-armv8a-crc} cortexa57"
-TUNE_FEATURES_tune-cortexa57-crypto   = "${TUNE_FEATURES_tune-cortexa57} crypto"
-PACKAGE_EXTRA_ARCHS_tune-cortexa57             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa57"
-PACKAGE_EXTRA_ARCHS_tune-cortexa57-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa57 cortexa57-crypto"
-BASE_LIB_tune-cortexa57               = "lib64"
-BASE_LIB_tune-cortexa57-crypto        = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa65.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa65.inc
deleted file mode 100644
index ecf17fb..0000000
--- a/meta-arm-bsp/conf/machine/include/tune-cortexa65.inc
+++ /dev/null
@@ -1,16 +0,0 @@
-#
-# Tune Settings for Cortex-A65
-#
-DEFAULTTUNE ?= "cortexa65"
-
-TUNEVALID[cortexa65] = "Enable Cortex-A65 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa65', ' -mcpu=cortex-a65', '', d)}"
-
-require conf/machine/include/arm/arch-armv8-2a.inc
-
-# Little Endian base configs
-AVAILTUNES                                         += "cortexa65"
-ARMPKGARCH_tune-cortexa65                           = "cortexa65"
-TUNE_FEATURES_tune-cortexa65                        = "${TUNE_FEATURES_tune-armv8-2a-crypto} cortexa55"
-PACKAGE_EXTRA_ARCHS_tune-cortexa65                  = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa65"
-BASE_LIB_tune-cortexa65                             = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa65ae.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa65ae.inc
deleted file mode 100644
index aea47d0..0000000
--- a/meta-arm-bsp/conf/machine/include/tune-cortexa65ae.inc
+++ /dev/null
@@ -1,16 +0,0 @@
-#
-# Tune Settings for Cortex-A65AE
-#
-DEFAULTTUNE                                        ?= "cortexa65ae"
-
-TUNEVALID[cortexa65ae] = "Enable Cortex-A65AE specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa65ae', ' -mcpu=cortex-a65ae', '', d)}"
-
-require conf/machine/include/arm/arch-armv8-2a.inc
-
-# Little Endian base configs
-AVAILTUNES                                         += "cortexa65ae"
-ARMPKGARCH_tune-cortexa65ae                         = "cortexa65ae"
-TUNE_FEATURES_tune-cortexa65ae                      = "${TUNE_FEATURES_tune-armv8-2a-crypto} cortexa65ae"
-PACKAGE_EXTRA_ARCHS_tune-cortexa65ae                = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa65ae"
-BASE_LIB_tune-cortexa65ae                           = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa7.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa7.inc
deleted file mode 100644
index 05081dc..0000000
--- a/meta-arm-bsp/conf/machine/include/tune-cortexa7.inc
+++ /dev/null
@@ -1,51 +0,0 @@
-DEFAULTTUNE ?= "armv7vethf-neon"
-
-require conf/machine/include/arm/arch-armv7ve.inc
-
-TUNEVALID[cortexa7] = "Enable Cortex-A7 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa7', ' -mcpu=cortex-a7', '', d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa7', 'armv7ve:', '', d)}"
-
-# Little Endian base configs
-AVAILTUNES += "cortexa7 cortexa7t cortexa7-neon cortexa7t-neon cortexa7-neon-vfpv4 cortexa7t-neon-vfpv4"
-ARMPKGARCH_tune-cortexa7             = "cortexa7"
-ARMPKGARCH_tune-cortexa7t            = "cortexa7"
-ARMPKGARCH_tune-cortexa7-neon        = "cortexa7"
-ARMPKGARCH_tune-cortexa7t-neon       = "cortexa7"
-ARMPKGARCH_tune-cortexa7-neon-vfpv4  = "cortexa7"
-ARMPKGARCH_tune-cortexa7t-neon-vfpv4 = "cortexa7"
-# mcpu is used so don't use armv7ve as we don't want march
-TUNE_FEATURES_tune-cortexa7             = "arm vfp cortexa7"
-TUNE_FEATURES_tune-cortexa7t            = "${TUNE_FEATURES_tune-cortexa7} thumb"
-TUNE_FEATURES_tune-cortexa7-neon        = "${TUNE_FEATURES_tune-cortexa7} neon"
-TUNE_FEATURES_tune-cortexa7t-neon       = "${TUNE_FEATURES_tune-cortexa7-neon} thumb"
-TUNE_FEATURES_tune-cortexa7-neon-vfpv4  = "${TUNE_FEATURES_tune-cortexa7-neon} vfpv4"
-TUNE_FEATURES_tune-cortexa7t-neon-vfpv4 = "${TUNE_FEATURES_tune-cortexa7-neon-vfpv4} thumb"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve} cortexa7-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet} cortexa7-vfp cortexa7t2-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon} cortexa7-vfp cortexa7-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon} cortexa7-vfp cortexa7-neon cortexa7t2-vfp cortexa7t2-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon-vfpv4} cortexa7-vfp cortexa7-neon cortexa7-neon-vfpv4"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7t-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vet-neon-vfpv4} cortexa7-vfp cortexa7-neon cortexa7-neon-vfpv4 cortexa7t2-vfp cortexa7t2-neon cortexa7t2-neon-vfpv4"
-
-# HF Tunes
-AVAILTUNES += "cortexa7hf cortexa7thf cortexa7hf-neon cortexa7thf-neon cortexa7hf-neon-vfpv4 cortexa7thf-neon-vfpv4"
-ARMPKGARCH_tune-cortexa7hf             = "cortexa7"
-ARMPKGARCH_tune-cortexa7thf            = "cortexa7"
-ARMPKGARCH_tune-cortexa7hf-neon        = "cortexa7"
-ARMPKGARCH_tune-cortexa7thf-neon       = "cortexa7"
-ARMPKGARCH_tune-cortexa7hf-neon-vfpv4  = "cortexa7"
-ARMPKGARCH_tune-cortexa7thf-neon-vfpv4 = "cortexa7"
-# mcpu is used so don't use armv7ve as we don't want march
-TUNE_FEATURES_tune-cortexa7hf             = "${TUNE_FEATURES_tune-cortexa7} callconvention-hard"
-TUNE_FEATURES_tune-cortexa7thf            = "${TUNE_FEATURES_tune-cortexa7t} callconvention-hard"
-TUNE_FEATURES_tune-cortexa7hf-neon        = "${TUNE_FEATURES_tune-cortexa7-neon} callconvention-hard"
-TUNE_FEATURES_tune-cortexa7thf-neon       = "${TUNE_FEATURES_tune-cortexa7t-neon} callconvention-hard"
-TUNE_FEATURES_tune-cortexa7hf-neon-vfpv4  = "${TUNE_FEATURES_tune-cortexa7-neon-vfpv4} callconvention-hard"
-TUNE_FEATURES_tune-cortexa7thf-neon-vfpv4 = "${TUNE_FEATURES_tune-cortexa7t-neon-vfpv4} callconvention-hard"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf} cortexa7hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf} cortexa7hf-vfp cortexa7t2hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon} cortexa7hf-vfp cortexa7hf-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon} cortexa7hf-vfp cortexa7hf-neon cortexa7t2hf-vfp cortexa7t2hf-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7hf-neon-vfpv4  = "${PACKAGE_EXTRA_ARCHS_tune-armv7vehf-neon-vfpv4} cortexa7hf-vfp cortexa7hf-neon cortexa7hf-neon-vfpv4"
-PACKAGE_EXTRA_ARCHS_tune-cortexa7thf-neon-vfpv4 = "${PACKAGE_EXTRA_ARCHS_tune-armv7vethf-neon-vfpv4} cortexa7hf-vfp cortexa7hf-neon cortexa7hf-neon-vfpv4 cortexa7t2hf-vfp cortexa7t2hf-neon cortexa7t2hf-neon-vfpv4"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa72-cortexa53.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa72-cortexa53.inc
deleted file mode 100644
index 98e8eba..0000000
--- a/meta-arm-bsp/conf/machine/include/tune-cortexa72-cortexa53.inc
+++ /dev/null
@@ -1,19 +0,0 @@
-DEFAULTTUNE ?= "cortexa72-cortexa53"
-
-TUNEVALID[cortexa72-cortexa53] = "Enable big.LITTLE Cortex-A72.Cortex-A53 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-cortexa53", " -mcpu=cortex-a72.cortex-a53", "", d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-cortexa53", "cortexa72-cortexa53:", "", d)}"
-
-require conf/machine/include/arm/arch-armv8a.inc
-
-# cortexa72.cortexa53 implies crc support
-AVAILTUNES += "cortexa72-cortexa53 cortexa72-cortexa53-crypto"
-ARMPKGARCH_tune-cortexa72-cortexa53                  = "cortexa72-cortexa53"
-ARMPKGARCH_tune-cortexa72-cortexa53-crypto           = "cortexa72-cortexa53-crypto"
-TUNE_FEATURES_tune-cortexa72-cortexa53               = "${TUNE_FEATURES_tune-armv8a-crc} cortexa72-cortexa53"
-TUNE_FEATURES_tune-cortexa72-cortexa53-crypto        = "${TUNE_FEATURES_tune-cortexa72-cortexa53} crypto"
-PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa72-cortexa53"
-PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72-cortexa53 cortexa72-cortexa53-crypto"
-BASE_LIB_tune-cortexa72-cortexa53                    = "lib64"
-BASE_LIB_tune-cortexa72-cortexa53-crypto             = "lib64"
-
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa72.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa72.inc
deleted file mode 100644
index b3f68ab..0000000
--- a/meta-arm-bsp/conf/machine/include/tune-cortexa72.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-DEFAULTTUNE ?= "cortexa72"
-
-TUNEVALID[cortexa72] = "Enable Cortex-A72 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa72', ' -mcpu=cortex-a72', '', d)}"
-
-require conf/machine/include/arm/arch-armv8a.inc
-
-# Little Endian base configs
-AVAILTUNES += "cortexa72"
-ARMPKGARCH_tune-cortexa72             = "cortexa72"
-TUNE_FEATURES_tune-cortexa72          = "${TUNE_FEATURES_tune-armv8a-crc-crypto} cortexa72"
-PACKAGE_EXTRA_ARCHS_tune-cortexa72    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72"
-BASE_LIB_tune-cortexa72               = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa35.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa35.inc
deleted file mode 100644
index 927296c..0000000
--- a/meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa35.inc
+++ /dev/null
@@ -1,21 +0,0 @@
-#
-# Tune Settings for big.LITTLE Cortex-A73 - Cortex-A35
-#
-DEFAULTTUNE ?= "cortexa73-cortexa35"
-
-TUNEVALID[cortexa73-cortexa35] = "Enable big.LITTLE Cortex-A73.Cortex-A35 specific processor optimizations"
-MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa35", "cortexa73-cortexa35:", "", d)}"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa35", " -mcpu=cortex-a73.cortex-a35", "", d)}"
-
-require conf/machine/include/arm/arch-armv8a.inc
-
-# cortexa73.cortexa35 implies crc support
-AVAILTUNES                                          += "cortexa73-cortexa35 cortexa73-cortexa35-crypto"
-ARMPKGARCH_tune-cortexa73-cortexa35                  = "cortexa73-cortexa35"
-ARMPKGARCH_tune-cortexa73-cortexa35-crypto           = "cortexa73-cortexa35-crypto"
-TUNE_FEATURES_tune-cortexa73-cortexa35               = "${TUNE_FEATURES_tune-armv8a-crc} cortexa73-cortexa35"
-TUNE_FEATURES_tune-cortexa73-cortexa35-crypto        = "${TUNE_FEATURES_tune-cortexa73-cortexa35} crypto"
-PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa35         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa73-cortexa35"
-PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa35-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa73-cortexa35 cortexa73-cortexa35-crypto"
-BASE_LIB_tune-cortexa73-cortexa35                    = "lib64"
-BASE_LIB_tune-cortexa73-cortexa35-crypto             = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa53.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa53.inc
deleted file mode 100644
index 3750f07..0000000
--- a/meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa53.inc
+++ /dev/null
@@ -1,19 +0,0 @@
-DEFAULTTUNE ?= "cortexa73-cortexa53"
-
-TUNEVALID[cortexa73-cortexa53] = "Enable big.LITTLE Cortex-A73.Cortex-A53 specific processor optimizations"
-MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa53", "cortexa73-cortexa53:", "", d)}"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa53", " -mcpu=cortex-a73.cortex-a53", "", d)}"
-
-require conf/machine/include/arm/arch-armv8a.inc
-
-# cortexa73.cortexa53 implies crc support
-AVAILTUNES += "cortexa73-cortexa53 cortexa73-cortexa53-crypto"
-ARMPKGARCH_tune-cortexa73-cortexa53                  = "cortexa73-cortexa53"
-ARMPKGARCH_tune-cortexa73-cortexa53-crypto           = "cortexa73-cortexa53-crypto"
-TUNE_FEATURES_tune-cortexa73-cortexa53               = "${TUNE_FEATURES_tune-armv8a-crc} cortexa73-cortexa53"
-TUNE_FEATURES_tune-cortexa73-cortexa53-crypto        = "${TUNE_FEATURES_tune-cortexa73-cortexa53} crypto"
-PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa53         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa73-cortexa53"
-PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa53-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa73-cortexa53 cortexa73-cortexa53-crypto"
-BASE_LIB_tune-cortexa73-cortexa53                    = "lib64"
-BASE_LIB_tune-cortexa73-cortexa53-crypto             = "lib64"
-
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa73.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa73.inc
deleted file mode 100644
index ed2deb9..0000000
--- a/meta-arm-bsp/conf/machine/include/tune-cortexa73.inc
+++ /dev/null
@@ -1,16 +0,0 @@
-#
-# Tune Settings for Cortex-A73
-#
-DEFAULTTUNE ?= "cortexa73"
-
-TUNEVALID[cortexa73] = "Enable Cortex-A73 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa73', ' -mcpu=cortex-a73', '', d)}"
-
-require conf/machine/include/arm/arch-armv8a.inc
-
-# Little Endian base configs
-AVAILTUNES                                += "cortexa73"
-ARMPKGARCH_tune-cortexa73                  = "cortexa73"
-TUNE_FEATURES_tune-cortexa73               = "${TUNE_FEATURES_tune-armv8a-crc-crypto} cortexa73"
-PACKAGE_EXTRA_ARCHS_tune-cortexa73         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa73"
-BASE_LIB_tune-cortexa73                    = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc
deleted file mode 100644
index 9c45fe9..0000000
--- a/meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc
+++ /dev/null
@@ -1,20 +0,0 @@
-#
-# Tune Settings for big.LITTLE Cortex-A75 - Cortex-A55
-#
-DEFAULTTUNE                                        ?= "cortexa75-cortexa55"
-
-TUNEVALID[cortexa75-cortexa55] = "Enable big.LITTLE Cortex-A75.Cortex-A55 specific processor optimizations"
-MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa75-cortexa55", "cortexa75-cortexa55:", "", d)}"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa75-cortexa55", " -mcpu=cortex-a75.cortex-a55", "", d)}"
-
-require conf/machine/include/arm/arch-armv8-2a.inc
-
-AVAILTUNES                                         += "cortexa75-cortexa55 cortexa75-cortexa55-crypto"
-ARMPKGARCH_tune-cortexa75-cortexa55                 = "cortexa75-cortexa55"
-ARMPKGARCH_tune-cortexa75-cortexa55-crypto          = "cortexa75-cortexa55-crypto"
-TUNE_FEATURES_tune-cortexa75-cortexa55              = "${TUNE_FEATURES_tune-armv8-2a} cortexa75-cortexa55"
-TUNE_FEATURES_tune-cortexa75-cortexa55-crypto       = "${TUNE_FEATURES_tune-cortexa75-cortexa55} crypto"
-PACKAGE_EXTRA_ARCHS_tune-cortexa75-cortexa55        = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a} cortexa75-cortexa55"
-PACKAGE_EXTRA_ARCHS_tune-cortexa75-cortexa55-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa75-cortexa55 cortexa75-cortexa55-crypto"
-BASE_LIB_tune-cortexa75-cortexa55                   = "lib64"
-BASE_LIB_tune-cortexa75-cortexa55-crypto            = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa75.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa75.inc
deleted file mode 100644
index d019450..0000000
--- a/meta-arm-bsp/conf/machine/include/tune-cortexa75.inc
+++ /dev/null
@@ -1,16 +0,0 @@
-#
-# Tune Settings for Cortex-A75
-#
-DEFAULTTUNE ?= "cortexa75"
-
-TUNEVALID[cortexa75] = "Enable Cortex-A75 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa75', ' -mcpu=cortex-a75', '', d)}"
-
-require conf/machine/include/arm/arch-armv8-2a.inc
-
-# Little Endian base configs
-AVAILTUNES                                         += "cortexa75"
-ARMPKGARCH_tune-cortexa75                           = "cortexa75"
-TUNE_FEATURES_tune-cortexa75                        = "${TUNE_FEATURES_tune-armv8-2a-crypto} cortexa75"
-PACKAGE_EXTRA_ARCHS_tune-cortexa75                  = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa75"
-BASE_LIB_tune-cortexa75                             = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa76-cortexa55.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa76-cortexa55.inc
deleted file mode 100644
index cae8ffe..0000000
--- a/meta-arm-bsp/conf/machine/include/tune-cortexa76-cortexa55.inc
+++ /dev/null
@@ -1,20 +0,0 @@
-#
-# Tune Settings for big.LITTLE Cortex-A76 - Cortex-A55
-#
-DEFAULTTUNE                                        ?= "cortexa76-cortexa55"
-
-TUNEVALID[cortexa76-cortexa55] = "Enable big.LITTLE Cortex-A76.Cortex-A55 specific processor optimizations"
-MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa76-cortexa55", "cortexa76-cortexa55:", "", d)}"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa76-cortexa55", " -mcpu=cortex-a76.cortex-a55", "", d)}"
-
-require conf/machine/include/arm/arch-armv8-2a.inc
-
-AVAILTUNES                                         += "cortexa76-cortexa55 cortexa76-cortexa55-crypto"
-ARMPKGARCH_tune-cortexa76-cortexa55                 = "cortexa76-cortexa55"
-ARMPKGARCH_tune-cortexa76-cortexa55-crypto          = "cortexa76-cortexa55-crypto"
-TUNE_FEATURES_tune-cortexa76-cortexa55              = "${TUNE_FEATURES_tune-armv8-2a} cortexa76-cortexa55"
-TUNE_FEATURES_tune-cortexa76-cortexa55-crypto       = "${TUNE_FEATURES_tune-cortexa76-cortexa55} crypto"
-PACKAGE_EXTRA_ARCHS_tune-cortexa76-cortexa55        = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a} cortexa76-cortexa55"
-PACKAGE_EXTRA_ARCHS_tune-cortexa76-cortexa55-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa76-cortexa55 cortexa76-cortexa55-crypto"
-BASE_LIB_tune-cortexa76-cortexa55                   = "lib64"
-BASE_LIB_tune-cortexa76-cortexa55-crypto            = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa76.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa76.inc
deleted file mode 100644
index ae3661a..0000000
--- a/meta-arm-bsp/conf/machine/include/tune-cortexa76.inc
+++ /dev/null
@@ -1,16 +0,0 @@
-#
-# Tune Settings for Cortex-A76
-#
-DEFAULTTUNE                                        ?= "cortexa76"
-
-TUNEVALID[cortexa76] = "Enable Cortex-A76 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa76', ' -mcpu=cortex-a76', '', d)}"
-
-require conf/machine/include/arm/arch-armv8-2a.inc
-
-# Little Endian base configs
-AVAILTUNES                                         += "cortexa76"
-ARMPKGARCH_tune-cortexa76                           = "cortexa76"
-TUNE_FEATURES_tune-cortexa76                        = "${TUNE_FEATURES_tune-armv8-2a-crypto} cortexa76"
-PACKAGE_EXTRA_ARCHS_tune-cortexa76                  = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa76"
-BASE_LIB_tune-cortexa76                             = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa76ae.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa76ae.inc
deleted file mode 100644
index d368aa1..0000000
--- a/meta-arm-bsp/conf/machine/include/tune-cortexa76ae.inc
+++ /dev/null
@@ -1,16 +0,0 @@
-#
-# Tune Settings for Cortex-A76AE
-#
-DEFAULTTUNE                                        ?= "cortexa76ae"
-
-TUNEVALID[cortexa76ae] = "Enable Cortex-A76AE specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa76ae', ' -mcpu=cortex-a76ae', '', d)}"
-
-require conf/machine/include/arm/arch-armv8-2a.inc
-
-# Little Endian base configs
-AVAILTUNES                                         += "cortexa76ae"
-ARMPKGARCH_tune-cortexa76ae                         = "cortexa76ae"
-TUNE_FEATURES_tune-cortexa65ae                      = "${TUNE_FEATURES_tune-armv8-2a-crypto} cortexa76ae"
-PACKAGE_EXTRA_ARCHS_tune-cortexa76ae                = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa76ae"
-BASE_LIB_tune-cortexa76ae                           = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa77.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa77.inc
deleted file mode 100644
index 048fa31..0000000
--- a/meta-arm-bsp/conf/machine/include/tune-cortexa77.inc
+++ /dev/null
@@ -1,16 +0,0 @@
-#
-# Tune Settings for Cortex-A77
-#
-DEFAULTTUNE                                        ?= "cortexa77"
-
-TUNEVALID[cortexa77] = "Enable Cortex-A77 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa77', ' -mcpu=cortex-a77', '', d)}"
-
-require conf/machine/include/arm/arch-armv8-2a.inc
-
-# Little Endian base configs
-AVAILTUNES                                         += "cortexa77"
-ARMPKGARCH_tune-cortexa77                           = "cortexa77"
-TUNE_FEATURES_tune-cortexa77                        = "${TUNE_FEATURES_tune-armv8-2a-crypto} cortexa77"
-PACKAGE_EXTRA_ARCHS_tune-cortexa77                  = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa77"
-BASE_LIB_tune-cortexa77                             = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa8.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa8.inc
deleted file mode 100644
index f27bfb8..0000000
--- a/meta-arm-bsp/conf/machine/include/tune-cortexa8.inc
+++ /dev/null
@@ -1,39 +0,0 @@
-DEFAULTTUNE ?= "armv7athf-neon"
-
-require conf/machine/include/arm/arch-armv7a.inc
-
-TUNEVALID[cortexa8] = "Enable Cortex-A8 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa8', ' -mcpu=cortex-a8', '', d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa8', 'armv7a:', '', d)}"
-
-# Little Endian base configs
-AVAILTUNES += "cortexa8 cortexa8t cortexa8-neon cortexa8t-neon"
-ARMPKGARCH_tune-cortexa8             = "cortexa8"
-ARMPKGARCH_tune-cortexa8t            = "cortexa8"
-ARMPKGARCH_tune-cortexa8-neon        = "cortexa8"
-ARMPKGARCH_tune-cortexa8t-neon       = "cortexa8"
-# mcpu is used so don't use armv7a as we don't want march
-TUNE_FEATURES_tune-cortexa8             = "arm vfp cortexa8"
-TUNE_FEATURES_tune-cortexa8t            = "${TUNE_FEATURES_tune-cortexa8} thumb"
-TUNE_FEATURES_tune-cortexa8-neon        = "${TUNE_FEATURES_tune-cortexa8} neon"
-TUNE_FEATURES_tune-cortexa8t-neon       = "${TUNE_FEATURES_tune-cortexa8-neon} thumb"
-PACKAGE_EXTRA_ARCHS_tune-cortexa8             = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa8-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa8t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa8-vfp cortexa8t2-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa8-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa8-vfp cortexa8-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa8t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa8-vfp cortexa8-neon cortexa8t2-vfp cortexa8t2-neon"
-
-# HF Tunes
-AVAILTUNES += "cortexa8hf cortexa8thf cortexa8hf-neon cortexa8thf-neon"
-ARMPKGARCH_tune-cortexa8hf             = "cortexa8"
-ARMPKGARCH_tune-cortexa8thf            = "cortexa8"
-ARMPKGARCH_tune-cortexa8hf-neon        = "cortexa8"
-ARMPKGARCH_tune-cortexa8thf-neon       = "cortexa8"
-# mcpu is used so don't use armv7a as we don't want march
-TUNE_FEATURES_tune-cortexa8hf             = "${TUNE_FEATURES_tune-cortexa8} callconvention-hard"
-TUNE_FEATURES_tune-cortexa8thf            = "${TUNE_FEATURES_tune-cortexa8t} callconvention-hard"
-TUNE_FEATURES_tune-cortexa8hf-neon        = "${TUNE_FEATURES_tune-cortexa8-neon} callconvention-hard"
-TUNE_FEATURES_tune-cortexa8thf-neon       = "${TUNE_FEATURES_tune-cortexa8t-neon} callconvention-hard"
-PACKAGE_EXTRA_ARCHS_tune-cortexa8hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa8hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa8thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa8hf-vfp cortexa8t2hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa8hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa8hf-vfp cortexa8hf-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa8thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa8hf-vfp cortexa8hf-neon cortexa8t2hf-vfp cortexa8t2hf-neon"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa9.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa9.inc
deleted file mode 100644
index 0eb8f3b..0000000
--- a/meta-arm-bsp/conf/machine/include/tune-cortexa9.inc
+++ /dev/null
@@ -1,55 +0,0 @@
-DEFAULTTUNE ?= "armv7athf-neon"
-
-require conf/machine/include/arm/arch-armv7a.inc
-
-TUNEVALID[cortexa9] = "Enable Cortex-A9 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa9', ' -mcpu=cortex-a9', '', d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa9', 'armv7a:', '', d)}"
-
-# Little Endian base configs
-AVAILTUNES += "cortexa9 cortexa9t cortexa9-neon cortexa9t-neon"
-ARMPKGARCH_tune-cortexa9             = "cortexa9"
-ARMPKGARCH_tune-cortexa9t            = "cortexa9"
-ARMPKGARCH_tune-cortexa9-neon        = "cortexa9"
-ARMPKGARCH_tune-cortexa9t-neon       = "cortexa9"
-# mcpu is used so don't use armv7a as we don't want march
-TUNE_FEATURES_tune-cortexa9             = "arm vfp cortexa9"
-TUNE_FEATURES_tune-cortexa9t            = "${TUNE_FEATURES_tune-cortexa9} thumb"
-TUNE_FEATURES_tune-cortexa9-neon        = "${TUNE_FEATURES_tune-cortexa9} neon"
-TUNE_FEATURES_tune-cortexa9t-neon       = "${TUNE_FEATURES_tune-cortexa9-neon} thumb"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9             = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} cortexa9-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9t            = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} cortexa9-vfp cortexa9t2-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-neon} cortexa9-vfp cortexa9-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9t-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-neon} cortexa9-vfp cortexa9-neon cortexa9t2-vfp cortexa9t2-neon"
-
-# HF Tunes
-AVAILTUNES += "cortexa9hf cortexa9thf cortexa9hf-neon cortexa9thf-neon"
-ARMPKGARCH_tune-cortexa9hf             = "cortexa9"
-ARMPKGARCH_tune-cortexa9thf            = "cortexa9"
-ARMPKGARCH_tune-cortexa9hf-neon        = "cortexa9"
-ARMPKGARCH_tune-cortexa9thf-neon       = "cortexa9"
-# mcpu is used so don't use armv7a as we don't want march
-TUNE_FEATURES_tune-cortexa9hf             = "${TUNE_FEATURES_tune-cortexa9} callconvention-hard"
-TUNE_FEATURES_tune-cortexa9thf            = "${TUNE_FEATURES_tune-cortexa9t} callconvention-hard"
-TUNE_FEATURES_tune-cortexa9hf-neon        = "${TUNE_FEATURES_tune-cortexa9-neon} callconvention-hard"
-TUNE_FEATURES_tune-cortexa9thf-neon       = "${TUNE_FEATURES_tune-cortexa9t-neon} callconvention-hard"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9hf             = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf} cortexa9hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9thf            = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf} cortexa9hf-vfp cortexa9t2hf-vfp"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9hf-neon        = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-neon} cortexa9hf-vfp cortexa9hf-neon"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9thf-neon       = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-neon} cortexa9hf-vfp cortexa9hf-neon cortexa9t2hf-vfp cortexa9t2hf-neon"
-
-# VFPv3 Tunes
-AVAILTUNES += "cortexa9-vfpv3 cortexa9t-vfpv3 cortexa9hf-vfpv3 cortexa9thf-vfpv3"
-ARMPKGARCH_tune-cortexa9-vfpv3          = "cortexa9"
-ARMPKGARCH_tune-cortexa9t-vfpv3         = "cortexa9"
-ARMPKGARCH_tune-cortexa9hf-vfpv3        = "cortexa9"
-ARMPKGARCH_tune-cortexa9thf-vfpv3       = "cortexa9"
-# mcpu is used so don't use armv7a as we don't want march
-TUNE_FEATURES_tune-cortexa9-vfpv3           = "${TUNE_FEATURES_tune-cortexa9} vfpv3"
-TUNE_FEATURES_tune-cortexa9t-vfpv3          = "${TUNE_FEATURES_tune-cortexa9t} vfpv3"
-TUNE_FEATURES_tune-cortexa9hf-vfpv3         = "${TUNE_FEATURES_tune-cortexa9hf} vfpv3"
-TUNE_FEATURES_tune-cortexa9thf-vfpv3        = "${TUNE_FEATURES_tune-cortexa9thf} vfpv3"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9-vfpv3           = "${PACKAGE_EXTRA_ARCHS_tune-armv7a-vfpv3} cortexa9-vfp cortexa9-vfpv3"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9t-vfpv3          = "${PACKAGE_EXTRA_ARCHS_tune-armv7at-vfpv3} cortexa9-vfp cortexa9-vfpv3 cortexa9t2-vfp cortexa9t2-vfpv3"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9hf-vfpv3         = "${PACKAGE_EXTRA_ARCHS_tune-armv7ahf-vfpv3} cortexa9hf-vfp cortexa9hf-vfpv3"
-PACKAGE_EXTRA_ARCHS_tune-cortexa9thf-vfpv3        = "${PACKAGE_EXTRA_ARCHS_tune-armv7athf-vfpv3} cortexa9hf-vfp cortexa9hf-vfpv3 cortexa9t2hf-vfp cortexa9t2hf-vfpv3"
-- 
2.17.1

