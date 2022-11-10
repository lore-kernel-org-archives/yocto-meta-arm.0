Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E82E7C433FE
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 15:45:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.9019.1668095129943244373
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 10 Nov 2022 07:45:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 901D41FB;
	Thu, 10 Nov 2022 07:45:35 -0800 (PST)
Received: from e121910.cambridge.arm.com (e121910.cambridge.arm.com [10.1.32.125])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0CEF53F703;
	Thu, 10 Nov 2022 07:45:27 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Vishnu.Banavath@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 3/3] arm-bsp/documentation: corstone1000: 2022.11.10 RC: update the change log
Date: Thu, 10 Nov 2022 15:45:07 +0000
Message-Id: <20221110154507.23779-4-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221110154507.23779-1-abdellatif.elkhlifi@arm.com>
References: <20221110154507.23779-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 10 Nov 2022 15:45:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4121

From: Vishnu Banavath <vishnu.banavath@arm.com>

Aligning the change log with the latest Corstone1000 SW updates.

Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../documentation/corstone1000/change-log.rst | 88 ++++++++++++++++---
 1 file changed, 77 insertions(+), 11 deletions(-)

diff --git a/meta-arm-bsp/documentation/corstone1000/change-log.rst b/meta-arm-bsp/documentation/corstone1000/change-log.rst
index 5d6493a4..7cdcd28d 100644
--- a/meta-arm-bsp/documentation/corstone1000/change-log.rst
+++ b/meta-arm-bsp/documentation/corstone1000/change-log.rst
@@ -8,7 +8,73 @@ Change Log
 ##########
 
 This document contains a summary of the new features, changes and
-fixes in each release of corstone1000 software stack.
+fixes in each release of Corstone-1000 software stack.
+
+******************
+Version 2022.11.10
+******************
+
+Changes
+=======
+
+- Booting the External System (Cortex-M3) with RTX RTOS
+- Adding MHU communication between the HOST (Cortex-A35) and the External System
+- Adding a Linux application to test the External System
+- Adding ESRT (EFI System Resource Table) support
+- Upgrading the SW stack recipes
+- Upgrades for the U-Boot FF-A driver and MM communication
+
+Corstone-1000 components versions
+=======================================
+
++-------------------------------------------+------------+
+| arm-ffa-tee                               | 1.1.1      |
++-------------------------------------------+------------+
+| arm-ffa-user                              | 5.0.0      |
++-------------------------------------------+------------+
+| corstone1000-external-sys-tests           | 1.0        |
++-------------------------------------------+------------+
+| external-system                           | 0.1.0      |
++-------------------------------------------+------------+
+| linux-yocto                               | 5.19       |
++-------------------------------------------+------------+
+| u-boot                                    | 2022.07    |
++-------------------------------------------+------------+
+| optee-client                              | 3.18.0     |
++-------------------------------------------+------------+
+| optee-os                                  | 3.18.0     |
++-------------------------------------------+------------+
+| trusted-firmware-a                        | 2.7.0      |
++-------------------------------------------+------------+
+| trusted-firmware-m                        | 1.6.0      |
++-------------------------------------------+------------+
+| ts-newlib                                 | 4.1.0      |
++-------------------------------------------+------------+
+| ts-psa-{crypto, iat, its. ps}-api-test    | 451aa087a4 |
++-------------------------------------------+------------+
+| ts-sp-{se-proxy, smm-gateway}             | 3d4956770f |
++-------------------------------------------+------------+
+
+Yocto distribution components versions
+=======================================
+
++-------------------------------------------+---------------------+
+| meta-arm                                  | langdale            |
++-------------------------------------------+---------------------+
+| poky                                      | langdale            |
++-------------------------------------------+---------------------+
+| meta-openembedded                         | langdale            |
++-------------------------------------------+---------------------+
+| busybox                                   | 1.35.0              |
++-------------------------------------------+---------------------+
+| musl                                      | 1.2.3+git37e18b7bf3 |
++-------------------------------------------+---------------------+
+| gcc-arm-none-eabi-native                  | 11.2-2022.02        |
++-------------------------------------------+---------------------+
+| gcc-cross-aarch64                         | 12.2                |
++-------------------------------------------+---------------------+
+| openssl                                   | 3.0.5               |
++-------------------------------------------+---------------------+
 
 ******************
 Version 2022.04.04
@@ -26,10 +92,10 @@ Version 2022.02.25
 
 Changes
 =======
-- Building and running psa-arch-tests on corstone1000 FVP
-- Enabled smm-gateway partition in Trusted Service on corstone1000 FVP
-- Enabled MHU driver in Trusted Service on corstone1000 FVP
-- Enabled OpenAMP support in SE proxy SP on corstone1000 FVP
+- Building and running psa-arch-tests on Corstone-1000 FVP
+- Enabled smm-gateway partition in Trusted Service on Corstone-1000 FVP
+- Enabled MHU driver in Trusted Service on Corstone-1000 FVP
+- Enabled OpenAMP support in SE proxy SP on Corstone-1000 FVP
 
 ******************
 Version 2022.02.21
@@ -48,7 +114,7 @@ Changes
 =======
 - psa-arch-tests: change master to main for psa-arch-tests
 - U-Boot: fix null pointer exception for get_image_info
-- TF-M: fix capsule instability issue for corstone1000
+- TF-M: fix capsule instability issue for Corstone-1000
 
 ******************
 Version 2022.01.07
@@ -56,9 +122,9 @@ Version 2022.01.07
 
 Changes
 =======
-- corstone1000: fix SystemReady-IR ACS test (SCT, FWTS) failures.
+- Corstone-1000: fix SystemReady-IR ACS test (SCT, FWTS) failures.
 - U-Boot: send bootcomplete event to secure enclave.
-- U-Boot: support populating corstone1000 image_info to ESRT table.
+- U-Boot: support populating Corstone-1000 image_info to ESRT table.
 - U-Boot: add ethernet device and enable configs to support bootfromnetwork SCT.
 
 ******************
@@ -67,7 +133,7 @@ Version 2021.12.15
 
 Changes
 =======
-- Enabling corstone1000 FPGA support on:
+- Enabling Corstone-1000 FPGA support on:
   - Linux 5.10
   - OP-TEE 3.14
   - Trusted Firmware-A 2.5
@@ -83,7 +149,7 @@ Version 2021.10.29
 
 Changes
 =======
-- Enabling corstone1000 FVP support on:
+- Enabling Corstone-1000 FVP support on:
   - Linux 5.10
   - OP-TEE 3.14
   - Trusted Firmware-A 2.5
@@ -95,4 +161,4 @@ Changes
 
 --------------
 
-*Copyright (c) 2021, Arm Limited. All rights reserved.*
+*Copyright (c) 2022, Arm Limited. All rights reserved.*
-- 
2.17.1


