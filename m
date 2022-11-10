Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7703C4332F
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 15:45:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9215.1668095127917885288
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 10 Nov 2022 07:45:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF6E51FB;
	Thu, 10 Nov 2022 07:45:33 -0800 (PST)
Received: from e121910.cambridge.arm.com (e121910.cambridge.arm.com [10.1.32.125])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 333443F703;
	Thu, 10 Nov 2022 07:45:26 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Vishnu.Banavath@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 2/3] arm-bsp/documentation: corstone1000: 2022.11.10 RC: update the release notes
Date: Thu, 10 Nov 2022 15:45:06 +0000
Message-Id: <20221110154507.23779-3-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221110154507.23779-1-abdellatif.elkhlifi@arm.com>
References: <20221110154507.23779-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 10 Nov 2022 15:45:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4120

From: Vishnu Banavath <vishnu.banavath@arm.com>

Aligning the release notes with the latest Corstone1000 SW updates.

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../corstone1000/release-notes.rst            | 54 +++++++++++++------
 1 file changed, 38 insertions(+), 16 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/release-notes.rst b/meta-arm-bsp/documentation/corstone1000/release-notes.rst
index 385331bd..f657c26b 100644
--- a/meta-arm-bsp/documentation/corstone1000/release-notes.rst
+++ b/meta-arm-bsp/documentation/corstone1000/release-notes.rst
@@ -7,23 +7,45 @@
 Release notes
 #############
 
+**************************
+Release notes - 2022.11.10
+**************************
+
+Known Issues or Limitations
+---------------------------
+ - The external-system can not be reset individually on (or using) AN550_v1 FPGA release. However, the system-wide reset still applies to the external-system.
+ - FPGA supports Linux distro install and boot through installer. However, FVP only supports openSUSE raw image installation and boot.
+ - Due to the performance uplimit of MPS3 FPGA and FVP, some Linux distros like Fedora Rawhide can not boot on Corstone-1000 (i.e. user may experience timeouts or boot hang).
+ - Below SCT FAILURE is a known issues in the FVP:
+   UEFI Compliant - Boot from network protocols must be implemented -- FAILURE
+ - Known limitations regarding ACS tests: The behavior after running ACS tests on FVP is not consistent.  Both behaviors are expected and are valid;
+   The system might boot till the Linux prompt. Or, the system might wait after finishing the ACS tests.
+   In both cases, the system executes the entire test suite and writes the results as stated in the user guide.
+
+Platform Support
+-----------------
+ - This software release is tested on Corstone-1000 FPGA version AN550_v1
+   https://developer.arm.com/downloads/-/download-fpga-images
+ - This software release is tested on Corstone-1000 Fast Model platform (FVP) version 11.19_21
+   https://developer.arm.com/tools-and-software/open-source-software/arm-platforms-software/arm-ecosystem-fvps
+
 **************************
 Release notes - 2022.04.04
 **************************
 
 Known Issues or Limitations
 ---------------------------
- - FGPA support Linux distro install and boot through installer. However,
+ - FPGA support Linux distro install and boot through installer. However,
    FVP only support openSUSE raw image installation and boot.
  - Due to the performance uplimit of MPS3 FPGA and FVP, some Linux distros like Fedora Rawhide
-   cannot boot on corstone1000 (i.e. user may experience timeouts or boot hang).
+   cannot boot on Corstone-1000 (i.e. user may experience timeouts or boot hang).
  - Below SCT FAILURE is a known issues in the FVP:
    UEFI Compliant - Boot from network protocols must be implemented -- FAILURE
 
 Platform Support
 -----------------
- - This software release is tested on corstone1000 FPGA version AN550_v1
- - This software release is tested on corstone1000 Fast Model platform (FVP) version 11.17_23
+ - This software release is tested on Corstone-1000 FPGA version AN550_v1
+ - This software release is tested on Corstone-1000 Fast Model platform (FVP) version 11.17_23
    https://developer.arm.com/tools-and-software/open-source-software/arm-platforms-software/arm-ecosystem-fvps
 
 **************************
@@ -32,13 +54,13 @@ Release notes - 2022.02.25
 
 Known Issues or Limitations
 ---------------------------
- - The following tests only work on corstone1000 FPGA: ACS tests (SCT, FWTS,
+ - The following tests only work on Corstone-1000 FPGA: ACS tests (SCT, FWTS,
    BSA), manual capsule update test, Linux distro install and boot.
 
 Platform Support
 ----------------
- - This software release is tested on corstone1000 FPGA version AN550_v1
- - This software release is tested on corstone1000 Fast Model platform (FVP) version 11.17_23
+ - This software release is tested on Corstone-1000 FPGA version AN550_v1
+ - This software release is tested on Corstone-1000 Fast Model platform (FVP) version 11.17_23
    https://developer.arm.com/tools-and-software/open-source-software/arm-platforms-software/arm-ecosystem-fvps
 
 Release notes - 2022.02.21
@@ -46,13 +68,13 @@ Release notes - 2022.02.21
 
 Known Issues or Limitations
 ---------------------------
- - The following tests only work on corstone1000 FPGA: ACS tests (SCT, FWTS,
+ - The following tests only work on Corstone-1000 FPGA: ACS tests (SCT, FWTS,
    BSA), manual capsule update test, Linux distro install and boot, psa-arch-test.
 
 Platform Support
 ----------------
- - This software release is tested on corstone1000 FPGA version AN550_v1
- - This software release is tested on corstone1000 Fast Model platform (FVP) version 11.16.21
+ - This software release is tested on Corstone-1000 FPGA version AN550_v1
+ - This software release is tested on Corstone-1000 Fast Model platform (FVP) version 11.16.21
    https://developer.arm.com/tools-and-software/open-source-software/arm-platforms-software/arm-ecosystem-fvps
 
 Release notes - 2022.01.18
@@ -85,13 +107,13 @@ The following components are present in the release:
 
 Platform Support
 ----------------
- - This software release is tested on corstone1000 FPGA version AN550_v1
- - This software release is tested on corstone1000 Fast Model platform (FVP) version 11.16.21
+ - This software release is tested on Corstone-1000 FPGA version AN550_v1
+ - This software release is tested on Corstone-1000 Fast Model platform (FVP) version 11.16.21
    https://developer.arm.com/tools-and-software/open-source-software/arm-platforms-software/arm-ecosystem-fvps
 
 Known Issues or Limitations
 ---------------------------
- - The following tests only work on corstone1000 FPGA: ACS tests (SCT, FWTS,
+ - The following tests only work on Corstone-1000 FPGA: ACS tests (SCT, FWTS,
    BSA), manual capsule update test, Linux distro install and boot, and
    psa-arch-tests.
  - Only the manual capsule update from UEFI shell is supported on FPGA.
@@ -107,7 +129,7 @@ Release notes - 2021.10.29
 
 Software Features
 -----------------
-This initial release of corstone1000 supports booting Linux on the Cortex-A35
+This initial release of Corstone-1000 supports booting Linux on the Cortex-A35
 and TF-M/MCUBOOT in the Secure Enclave. The following components are present in
 the release:
 
@@ -119,7 +141,7 @@ the release:
 
 Platform Support
 ----------------
- - This Software release is tested on corstone1000 Fast Model platform (FVP) version 11.16.21
+ - This Software release is tested on Corstone-1000 Fast Model platform (FVP) version 11.16.21
    https://developer.arm.com/tools-and-software/open-source-software/arm-platforms-software/arm-ecosystem-fvps
 
 Known Issues or Limitations
@@ -134,4 +156,4 @@ For support email: support-subsystem-iot@arm.com
 
 --------------
 
-*Copyright (c) 2021, Arm Limited. All rights reserved.*
+*Copyright (c) 2022, Arm Limited. All rights reserved.*
-- 
2.17.1


