Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD34AC433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 17:57:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.56.1655229437568265065
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jun 2022 10:57:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50E691764
	for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jun 2022 10:57:17 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CF9163F66F
	for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jun 2022 10:57:16 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/trusted-firmware-a: Update to 2.7.0
Date: Tue, 14 Jun 2022 13:57:12 -0400
Message-Id: <20220614175712.330-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Jun 2022 17:57:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3497

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...01-plat-tc-Increase-maximum-BL2-size.patch | 16 +++++-----
 ...dd-trusty_sp_fw_config-build-option.patch} |  6 ++--
 ...t-tc-enable-CI-700-PMU-for-profiling.patch | 32 -------------------
 ...plat-arm-increase-sp-max-image-size.patch} |  2 +-
 ...-plat-tc-increase-tc_tzc_dram1_size.patch} |  4 +--
 ...tc-add-spmc-manifest-with-trusty-sp.patch} |  2 +-
 ...te-dts-with-trusty-compatible-strin.patch} |  2 +-
 ...ch => 0007-fix-plat-tc-disable-smmu.patch} |  2 +-
 ...s_2.6.bbappend => tf-a-tests_2.7.bbappend} |  0
 .../trusted-firmware-a-corstone1000.inc       |  6 ----
 .../trusted-firmware-a-tc.inc                 | 21 ++++--------
 ...append => trusted-firmware-a_2.7.bbappend} |  0
 .../{tf-a-tests_2.6.bb => tf-a-tests_2.7.bb}  |  4 +--
 .../trusted-firmware-a/trusted-firmware-a.inc |  4 +--
 .../trusted-firmware-a_%.bbappend             |  4 +++
 ...are-a_2.6.bb => trusted-firmware-a_2.7.bb} |  4 +--
 ...ol-native_2.5.bb => fiptool-native_2.7.bb} |  9 +++---
 17 files changed, 35 insertions(+), 83 deletions(-)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/{0003-Makefile-add-trusty_sp_fw_config-build-option.patch => 0002-Makefile-add-trusty_sp_fw_config-build-option.patch} (92%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0002-feat-tc-enable-CI-700-PMU-for-profiling.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/{0004-fix-plat-arm-increase-sp-max-image-size.patch => 0003-fix-plat-arm-increase-sp-max-image-size.patch} (93%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/{0005-fix-plat-tc-increase-tc_tzc_dram1_size.patch => 0004-fix-plat-tc-increase-tc_tzc_dram1_size.patch} (95%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/{0006-feat-plat-tc-add-spmc-manifest-with-trusty-sp.patch => 0005-feat-plat-tc-add-spmc-manifest-with-trusty-sp.patch} (98%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/{0007-feat-plat-tc-update-dts-with-trusty-compatible-strin.patch => 0006-feat-plat-tc-update-dts-with-trusty-compatible-strin.patch} (95%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/{0008-fix-plat-tc-disable-smmu.patch => 0007-fix-plat-tc-disable-smmu.patch} (96%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/{tf-a-tests_2.6.bbappend => tf-a-tests_2.7.bbappend} (100%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/{trusted-firmware-a_2.6.bbappend => trusted-firmware-a_2.7.bbappend} (100%)
 rename meta-arm/recipes-bsp/trusted-firmware-a/{tf-a-tests_2.6.bb => tf-a-tests_2.7.bb} (92%)
 rename meta-arm/recipes-bsp/trusted-firmware-a/{trusted-firmware-a_2.6.bb => trusted-firmware-a_2.7.bb} (85%)
 rename meta-arm/recipes-devtools/fiptool/{fiptool-native_2.5.bb => fiptool-native_2.7.bb} (76%)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0001-plat-tc-Increase-maximum-BL2-size.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0001-plat-tc-Increase-maximum-BL2-size.patch
index e9755efc..74ab3612 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0001-plat-tc-Increase-maximum-BL2-size.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0001-plat-tc-Increase-maximum-BL2-size.patch
@@ -1,7 +1,7 @@
-From 923deccc1de17b05826143e476b840253bb2bb7b Mon Sep 17 00:00:00 2001
+From 008cfc6457c239466ca62610d59aaf1a78f6b2f6 Mon Sep 17 00:00:00 2001
 From: Tudor Cretu <tudor.cretu@arm.com>
 Date: Fri, 21 May 2021 14:56:37 +0000
-Subject: [PATCH] plat: tc: Increase maximum BL2 size.
+Subject: [PATCH 1/7] plat: tc: Increase maximum BL2 size.
 
 BL2 size gets increased due to the firmware update changes.
 Increase the MAX_BL2_SIZE by 8Kb.
@@ -10,11 +10,11 @@ Signed-off-by: Tudor Cretu <tudor.cretu@arm.com>
 Change-Id: I1cb28b0eb7f834426873ff9f4c40bd496413806f
 Upstream-Status: Pending [Not submitted to upstream yet]
 ---
- plat/arm/board/tc/include/platform_def.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ plat/arm/board/tc/include/platform_def.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/plat/arm/board/tc/include/platform_def.h b/plat/arm/board/tc/include/platform_def.h
-index ccabced9e..f45457b9f 100644
+index 745d91cab..cd77773aa 100644
 --- a/plat/arm/board/tc/include/platform_def.h
 +++ b/plat/arm/board/tc/include/platform_def.h
 @@ -120,9 +120,9 @@
@@ -27,7 +27,7 @@ index ccabced9e..f45457b9f 100644
 -# define PLAT_ARM_MAX_BL2_SIZE		0x14000
 +# define PLAT_ARM_MAX_BL2_SIZE		0x19000
  #endif
-
+ 
  /*
 @@ -130,7 +130,7 @@
   * calculated using the current BL31 PROGBITS debug size plus the sizes of
@@ -35,9 +35,9 @@ index ccabced9e..f45457b9f 100644
   */
 -#define PLAT_ARM_MAX_BL31_SIZE		0x3F000
 +#define PLAT_ARM_MAX_BL31_SIZE		0x4F000
-
+ 
  /*
   * Size of cacheable stacks
 -- 
-2.17.1
+2.30.2
 
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0003-Makefile-add-trusty_sp_fw_config-build-option.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0002-Makefile-add-trusty_sp_fw_config-build-option.patch
similarity index 92%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0003-Makefile-add-trusty_sp_fw_config-build-option.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0002-Makefile-add-trusty_sp_fw_config-build-option.patch
index f5ddb0f2..75cabdd8 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0003-Makefile-add-trusty_sp_fw_config-build-option.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0002-Makefile-add-trusty_sp_fw_config-build-option.patch
@@ -1,4 +1,4 @@
-From f602df2563cbae1fce2559430a394180983fbbaf Mon Sep 17 00:00:00 2001
+From 2f8b0cc6be3787717247d1c02a45181a5ac6f125 Mon Sep 17 00:00:00 2001
 From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Date: Mon, 11 Apr 2022 14:36:54 +0100
 Subject: [PATCH 2/7] Makefile: add trusty_sp_fw_config build option
@@ -12,10 +12,10 @@ Upstream-Status: Pending [Not submitted to upstream yet]
  2 files changed, 8 insertions(+)
 
 diff --git a/Makefile b/Makefile
-index f91699c44..f401a0010 100644
+index 3941f8698..a20d647a2 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -533,6 +533,10 @@ ifneq (${SPD},none)
+@@ -531,6 +531,10 @@ ifneq (${SPD},none)
              DTC_CPPFLAGS	+=	-DOPTEE_SP_FW_CONFIG
          endif
  
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0002-feat-tc-enable-CI-700-PMU-for-profiling.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0002-feat-tc-enable-CI-700-PMU-for-profiling.patch
deleted file mode 100644
index c9016084..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0002-feat-tc-enable-CI-700-PMU-for-profiling.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 1565ac8995f90113b2be5acddc86773bfe0a0ac9 Mon Sep 17 00:00:00 2001
-From: Rupinderjit Singh <rupinderjit.singh@arm.com>
-Date: Tue, 22 Feb 2022 21:50:33 +0000
-Subject: [PATCH 1/7] feat(tc): enable CI-700 PMU for profiling
-
-Change-Id: Iaafdfc440b362022e6103eabf3fb2ebed85b6575
-Signed-off-by: Rupinderjit Singh <rupinderjit.singh@arm.com>
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/14918]
----
- fdts/tc.dts | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/fdts/tc.dts b/fdts/tc.dts
-index 7c0e84260..20992294b 100644
---- a/fdts/tc.dts
-+++ b/fdts/tc.dts
-@@ -261,6 +261,12 @@
- 		arm,mhuv2-protocols = <0 1>;
- 	};
- 
-+	cmn-pmu {
-+		compatible = "arm,ci-700";
-+		reg = <0x0 0x50000000 0x0 0x10000000>;
-+		interrupts = <0x0 460 0x4>;
-+	};
-+
- 	scmi {
- 		compatible = "arm,scmi";
- 		mbox-names = "tx", "rx";
--- 
-2.30.2
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0004-fix-plat-arm-increase-sp-max-image-size.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0003-fix-plat-arm-increase-sp-max-image-size.patch
similarity index 93%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0004-fix-plat-arm-increase-sp-max-image-size.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0003-fix-plat-arm-increase-sp-max-image-size.patch
index c61e9b58..6807191e 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0004-fix-plat-arm-increase-sp-max-image-size.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0003-fix-plat-arm-increase-sp-max-image-size.patch
@@ -1,4 +1,4 @@
-From d5a8e035de394f7a8924151318abc094d9ae68ae Mon Sep 17 00:00:00 2001
+From 0060b1a4fbe3bc9992f59a2d4cb986821f7bcf13 Mon Sep 17 00:00:00 2001
 From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Date: Mon, 11 Apr 2022 18:31:01 +0100
 Subject: [PATCH 3/7] fix(plat/arm): increase sp max image size
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0005-fix-plat-tc-increase-tc_tzc_dram1_size.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0004-fix-plat-tc-increase-tc_tzc_dram1_size.patch
similarity index 95%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0005-fix-plat-tc-increase-tc_tzc_dram1_size.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0004-fix-plat-tc-increase-tc_tzc_dram1_size.patch
index c6d4d862..aec8be0c 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0005-fix-plat-tc-increase-tc_tzc_dram1_size.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0004-fix-plat-tc-increase-tc_tzc_dram1_size.patch
@@ -1,4 +1,4 @@
-From f6485e50af73c905faa0777e462ffdfa483d19da Mon Sep 17 00:00:00 2001
+From 000e19d360a5ad9abd7d823af86a364bac2afc58 Mon Sep 17 00:00:00 2001
 From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Date: Mon, 11 Apr 2022 17:38:17 +0100
 Subject: [PATCH 4/7] fix(plat/tc): increase tc_tzc_dram1_size
@@ -30,7 +30,7 @@ index 20992294b..af64504a4 100644
  		};
  	};
 diff --git a/plat/arm/board/tc/include/platform_def.h b/plat/arm/board/tc/include/platform_def.h
-index 745d91cab..73b984308 100644
+index cd77773aa..35d8fd24e 100644
 --- a/plat/arm/board/tc/include/platform_def.h
 +++ b/plat/arm/board/tc/include/platform_def.h
 @@ -31,7 +31,7 @@
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0006-feat-plat-tc-add-spmc-manifest-with-trusty-sp.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0005-feat-plat-tc-add-spmc-manifest-with-trusty-sp.patch
similarity index 98%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0006-feat-plat-tc-add-spmc-manifest-with-trusty-sp.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0005-feat-plat-tc-add-spmc-manifest-with-trusty-sp.patch
index 73a301b8..0b34683e 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0006-feat-plat-tc-add-spmc-manifest-with-trusty-sp.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0005-feat-plat-tc-add-spmc-manifest-with-trusty-sp.patch
@@ -1,4 +1,4 @@
-From bdf66cf30ed4cb0c16a5335fbb68fa0b2e253f7c Mon Sep 17 00:00:00 2001
+From a04466ceb81a04c5179e8064837c34a89c2b11bd Mon Sep 17 00:00:00 2001
 From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Date: Mon, 11 Apr 2022 14:43:15 +0100
 Subject: [PATCH 5/7] feat(plat/tc): add spmc manifest with trusty sp
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0007-feat-plat-tc-update-dts-with-trusty-compatible-strin.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0006-feat-plat-tc-update-dts-with-trusty-compatible-strin.patch
similarity index 95%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0007-feat-plat-tc-update-dts-with-trusty-compatible-strin.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0006-feat-plat-tc-update-dts-with-trusty-compatible-strin.patch
index f623e4de..e2bfb2c5 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0007-feat-plat-tc-update-dts-with-trusty-compatible-strin.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0006-feat-plat-tc-update-dts-with-trusty-compatible-strin.patch
@@ -1,4 +1,4 @@
-From c2f939891e46e2ef9b54ed5e270e42187fdc57b3 Mon Sep 17 00:00:00 2001
+From 96151af7eed28d63fdaa1ac6de2d14a9c71f1d4a Mon Sep 17 00:00:00 2001
 From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Date: Wed, 30 Mar 2022 12:14:49 +0000
 Subject: [PATCH 6/7] feat(plat/tc): update dts with trusty compatible string
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0008-fix-plat-tc-disable-smmu.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0007-fix-plat-tc-disable-smmu.patch
similarity index 96%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0008-fix-plat-tc-disable-smmu.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0007-fix-plat-tc-disable-smmu.patch
index 50924869..91f5a9ef 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0008-fix-plat-tc-disable-smmu.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/tc/0007-fix-plat-tc-disable-smmu.patch
@@ -1,4 +1,4 @@
-From d67e1f76be37127b0fe2a84ee631c5a799c426ba Mon Sep 17 00:00:00 2001
+From 1a051bef6c63f6871edd8d87e969460f073820a7 Mon Sep 17 00:00:00 2001
 From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
 Date: Wed, 27 Apr 2022 18:15:47 +0100
 Subject: [PATCH 7/7] fix(plat/tc): disable smmu
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.6.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.6.bbappend
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.bbappend
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc
index bf5d2759..341c8a27 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc
@@ -3,17 +3,11 @@
 COMPATIBLE_MACHINE = "(corstone1000)"
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/files/corstone1000:"
-SRCREV_tfa = "cf89fd57ed3286d7842eef41cd72a3977eb6d317"
-PV = "2.6+git${SRCPV}"
 
 SRC_URI:append = " \ 
 	file://0001-Fix-FF-A-version-in-SPMC-manifest.patch \
 	"
 
-SRC_URI:remove = " \
-     file://ssl.patch \
-     "  
-
 TFA_DEBUG = "1"
 TFA_UBOOT ?= "1"
 TFA_MBEDTLS = "1"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.inc
index 25f67160..8cb53dec 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.inc
@@ -1,28 +1,19 @@
 # TC0 specific TFA configuration
 
-# Intermediate SHA with 2.6 baseline version
-SRCREV_tfa = "141791088eb846c55291b1664813710ed3b532a1"
-PV = "2.6+git${SRCPV}"
-
 DEPENDS += "scp-firmware util-linux-native gptfdisk-native"
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/files/tc:"
 SRC_URI:append = " \
     file://0001-plat-tc-Increase-maximum-BL2-size.patch \
-    file://0002-feat-tc-enable-CI-700-PMU-for-profiling.patch \
-    file://0003-Makefile-add-trusty_sp_fw_config-build-option.patch \
-    file://0004-fix-plat-arm-increase-sp-max-image-size.patch \
-    file://0005-fix-plat-tc-increase-tc_tzc_dram1_size.patch \
-    file://0006-feat-plat-tc-add-spmc-manifest-with-trusty-sp.patch \
-    file://0007-feat-plat-tc-update-dts-with-trusty-compatible-strin.patch \
-    file://0008-fix-plat-tc-disable-smmu.patch \
+    file://0002-Makefile-add-trusty_sp_fw_config-build-option.patch \
+    file://0003-fix-plat-arm-increase-sp-max-image-size.patch \
+    file://0004-fix-plat-tc-increase-tc_tzc_dram1_size.patch \
+    file://0005-feat-plat-tc-add-spmc-manifest-with-trusty-sp.patch \
+    file://0006-feat-plat-tc-update-dts-with-trusty-compatible-strin.patch \
+    file://0007-fix-plat-tc-disable-smmu.patch \
     file://generate_metadata.py \
     "
 
-SRC_URI:remove = " \
-    file://ssl.patch \
-    "
-
 COMPATIBLE_MACHINE = "(tc?)"
 
 TFA_PLATFORM = "tc"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.7.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bbappend
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.7.bbappend
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.6.bb b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.bb
similarity index 92%
rename from meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.6.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.bb
index 2da61165..0c06440f 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.6.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.bb
@@ -8,9 +8,7 @@ inherit deploy
 COMPATIBLE_MACHINE ?= "invalid"
 
 SRC_URI = "git://git.trustedfirmware.org/TF-A/tf-a-tests.git;protocol=https;branch=master"
-# post v2.6 snapshot
-SRCREV ?= "af5a517ae9f295455122109100fe5d55668e8eaf"
-PV .= "+git${SRCPV}"
+SRCREV ?= "5f591f67738a1bbe6b262c53d9dad46ed8bbcd67"
 
 DEPENDS += "optee-os"
 
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 510a7d44..dfb56753 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -5,9 +5,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit deploy
 
-SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa;branch=master \
-           file://ssl.patch \
-	    file://build-deps-upgrade-to-mbed-TLS-2.28.0.patch"
+SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa;branch=master"
 
 UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index 76d2f410..8815510e 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -2,6 +2,10 @@ COMPATIBLE_MACHINE:qemuarm64-secureboot = "qemuarm64-secureboot"
 COMPATIBLE_MACHINE:qemu-generic-arm64 = "qemu-generic-arm64"
 COMPATIBLE_MACHINE:qemuarm-secureboot = "qemuarm-secureboot"
 
+#FIXME - clang fails to build tfa for qemuarm-secureboot, and possibly other
+# arm/aarch32.  This is a known testing hole in TF-A.
+TOOLCHAIN:qemuarm-secureboot = "gcc"
+
 TFA_PLATFORM:qemuarm64-secureboot = "qemu"
 TFA_PLATFORM:qemu-generic-arm64 = "qemu_sbsa"
 TFA_PLATFORM:qemuarm-secureboot = "qemu"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.7.bb
similarity index 85%
rename from meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.7.bb
index 89a92141..537ec320 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.7.bb
@@ -1,7 +1,7 @@
 require trusted-firmware-a.inc
 
-# TF-A v2.6
-SRCREV_tfa = "a1f02f4f3daae7e21ee58b4c93ec3e46b8f28d15"
+# TF-A v2.7
+SRCREV_tfa = "35f4c7295bafeb32c8bcbdfb6a3f2e74a57e732b"
 
 LIC_FILES_CHKSUM += "file://docs/license.rst;md5=b2c740efedc159745b9b31f88ff03dde"
 
diff --git a/meta-arm/recipes-devtools/fiptool/fiptool-native_2.5.bb b/meta-arm/recipes-devtools/fiptool/fiptool-native_2.7.bb
similarity index 76%
rename from meta-arm/recipes-devtools/fiptool/fiptool-native_2.5.bb
rename to meta-arm/recipes-devtools/fiptool/fiptool-native_2.7.bb
index 1d771b6d..ec531e44 100644
--- a/meta-arm/recipes-devtools/fiptool/fiptool-native_2.5.bb
+++ b/meta-arm/recipes-devtools/fiptool/fiptool-native_2.7.bb
@@ -5,12 +5,11 @@
 DESCRIPTION = "fiptool - Trusted Firmware tool for packaging"
 LICENSE = "BSD-3-Clause"
 
-SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;destsuffix=fiptool-${PV};protocol=https;branch=master \
-           file://ssl.patch"
-LIC_FILES_CHKSUM = "file://docs/license.rst;md5=713afe122abbe07f067f939ca3c480c5"
+SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;destsuffix=fiptool-${PV};protocol=https;branch=master"
+LIC_FILES_CHKSUM = "file://docs/license.rst;md5=b2c740efedc159745b9b31f88ff03dde"
 
-# Use fiptool from TF-A v2.5
-SRCREV = "c158878249f1bd930906ebd744b90d3f2a8265f1"
+# Use fiptool from TF-A v2.7
+SRCREV = "35f4c7295bafeb32c8bcbdfb6a3f2e74a57e732b"
 
 DEPENDS += "openssl-native"
 
-- 
2.17.1


