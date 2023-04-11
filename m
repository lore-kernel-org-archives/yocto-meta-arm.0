Return-Path: <xueliang.zhong@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55F46C76196
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 14:48:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.15912.1681224512727012379
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 Apr 2023 07:48:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: xueliang.zhong@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5926AD75;
	Tue, 11 Apr 2023 07:49:16 -0700 (PDT)
Received: from cassini-wfh-server-1.stack04.eu02.mi.arm.com (unknown [10.58.246.234])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC14D3F73F;
	Tue, 11 Apr 2023 07:48:30 -0700 (PDT)
From: xueliang.zhong@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Xueliang Zhong <xueliang.zhong@arm.com>
Subject: [PATCH 1/1] arm-bsp/n1sdp: use edk2-firmware 202211 version
Date: Tue, 11 Apr 2023 14:48:24 +0000
Message-Id: <20230411144824.19142-2-xueliang.zhong@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230411144824.19142-1-xueliang.zhong@arm.com>
References: <20230411144824.19142-1-xueliang.zhong@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 11 Apr 2023 14:48:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4573

From: Xueliang Zhong <xueliang.zhong@arm.com>

The upstream official N1SDP software currently supports edk2-firmware
202211 version. This patch is to align N1SDP Yocto build with upstream
N1SDP software.

Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf          |    1 +
 .../recipes-bsp/uefi/edk2-firmware-n1sdp.inc  |   13 +-
 ...dp-Add-support-to-parse-NT_FW_CONFIG.patch |   42 +-
 ...orm-ARM-N1Sdp-Fix-RemoteDdrSize-cast.patch |   14 +-
 ...dp-Modify-the-IRQ-ID-of-Debug-UART-a.patch |   16 +-
 ...erseN1Soc-Enable-SCP-QSPI-flash-regi.patch |   57 +
 ...RM-N1Sdp-NOR-flash-library-for-N1Sdp.patch |  119 +
 ...N1Sdp-NOR-flash-Dxe-Driver-for-N1Sdp.patch | 2538 +++++++++++++++++
 ...M-N1Sdp-Persistent-storage-for-N1Sdp.patch |   88 +
 ...dp-Enable-FaultTolerantWrite-Dxe-dri.patch |   50 +
 ...dp-manually-poll-QSPI-status-bit-aft.patch |  197 ++
 .../recipes-bsp/uefi/edk2-firmware_202211.bb  |    4 +
 12 files changed, 3091 insertions(+), 48 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0004-Silicon-ARM-NeoverseN1Soc-Enable-SCP-QSPI-flash-regi.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0005-Platform-ARM-N1Sdp-NOR-flash-library-for-N1Sdp.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0006-Platform-ARM-N1Sdp-NOR-flash-Dxe-Driver-for-N1Sdp.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0007-Platform-ARM-N1Sdp-Persistent-storage-for-N1Sdp.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0008-Platform-ARM-N1Sdp-Enable-FaultTolerantWrite-Dxe-dri.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0009-Platform-ARM-N1Sdp-manually-poll-QSPI-status-bit-aft.patch
 create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202211.bb

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
index ef90c639..16b40986 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -29,6 +29,7 @@ EXTRA_IMAGEDEPENDS += "virtual/control-processor-firmware"
 
 #UEFI EDK2 firmware
 EXTRA_IMAGEDEPENDS += "edk2-firmware"
+PREFERRED_VERSION_edk2-firmware ?= "202211"
 
 #optee
 PREFERRED_VERSION_optee-os ?= "3.20.%"
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
index 629ea049..0d557f3c 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
@@ -1,8 +1,3 @@
-# Align with N1SDP-2022.06.22 release
-SRCREV_edk2           = "b24306f15daa2ff8510b06702114724b33895d3c"
-SRCREV_edk2-platforms = "fdaf4eb69a8b6839aecf6d3bdd938aa5c34a8a17"
-PV .= "+git${SRCPV}"
-
 # N1SDP specific EDK2 configurations
 EDK2_BUILD_RELEASE = "0"
 EDK2_PLATFORM      = "n1sdp"
@@ -20,8 +15,14 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/files/edk2-platforms:"
 
 SRC_URI:append = "\
     file://0001-Platform-ARM-N1sdp-Add-support-to-parse-NT_FW_CONFIG.patch;patchdir=edk2-platforms \
-    file://0002-Platform-ARM-N1Sdp-Fix-RemoteDdrSize-cast.patch;patchdir=edk2-platforms            \
+    file://0002-Platform-ARM-N1Sdp-Fix-RemoteDdrSize-cast.patch;patchdir=edk2-platforms \
     file://0003-Platform-ARM-N1Sdp-Modify-the-IRQ-ID-of-Debug-UART-a.patch;patchdir=edk2-platforms \
+    file://0004-Silicon-ARM-NeoverseN1Soc-Enable-SCP-QSPI-flash-regi.patch;patchdir=edk2-platforms \
+    file://0005-Platform-ARM-N1Sdp-NOR-flash-library-for-N1Sdp.patch;patchdir=edk2-platforms \
+    file://0006-Platform-ARM-N1Sdp-NOR-flash-Dxe-Driver-for-N1Sdp.patch;patchdir=edk2-platforms \
+    file://0007-Platform-ARM-N1Sdp-Persistent-storage-for-N1Sdp.patch;patchdir=edk2-platforms \
+    file://0008-Platform-ARM-N1Sdp-Enable-FaultTolerantWrite-Dxe-dri.patch;patchdir=edk2-platforms \
+    file://0009-Platform-ARM-N1Sdp-manually-poll-QSPI-status-bit-aft.patch;patchdir=edk2-platforms \
 "
 
 do_deploy:append() {
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0001-Platform-ARM-N1sdp-Add-support-to-parse-NT_FW_CONFIG.patch b/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0001-Platform-ARM-N1sdp-Add-support-to-parse-NT_FW_CONFIG.patch
index e5526dd6..c7f163b4 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0001-Platform-ARM-N1sdp-Add-support-to-parse-NT_FW_CONFIG.patch
+++ b/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0001-Platform-ARM-N1sdp-Add-support-to-parse-NT_FW_CONFIG.patch
@@ -1,7 +1,7 @@
-From fa3fd24ffbc987e952a2e5610a7b02556afd2087 Mon Sep 17 00:00:00 2001
+From 928cb457b9ab2abefbacad655eefdde943b4ee9a Mon Sep 17 00:00:00 2001
 From: sahil <sahil@arm.com>
 Date: Thu, 17 Mar 2022 16:28:05 +0530
-Subject: [PATCH 1/3] Platform/ARM/N1sdp: Add support to parse NT_FW_CONFIG
+Subject: [PATCH] Platform/ARM/N1sdp: Add support to parse NT_FW_CONFIG
 
 NT_FW_CONFIG DTB contains platform information passed by
 Tf-A boot stage.
@@ -13,8 +13,7 @@ Upstream-Status: Pending
 Signed-off-by: Adam Johnston <adam.johnston@arm.com>
 Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
 Signed-off-by: sahil <sahil@arm.com>
-Change-Id: Ib82571280bf1ca5febe5766e618de09e7b70bb02
-
+Change-Id: I54a86277719607eb00d4a472fae8f13c180eafca
 ---
  .../ConfigurationManager.c                    |  24 ++--
  .../ConfigurationManagerDxe.inf               |   3 +-
@@ -27,7 +26,7 @@ Change-Id: Ib82571280bf1ca5febe5766e618de09e7b70bb02
  8 files changed, 152 insertions(+), 25 deletions(-)
 
 diff --git a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/ConfigurationManager.c b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/ConfigurationManager.c
-index f50623ae..e023d47c 100644
+index a6b4cb0e..c15020f5 100644
 --- a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/ConfigurationManager.c
 +++ b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/ConfigurationManager.c
 @@ -1,7 +1,7 @@
@@ -35,7 +34,7 @@ index f50623ae..e023d47c 100644
    Configuration Manager Dxe
  
 -  Copyright (c) 2021, ARM Limited. All rights reserved.<BR>
-+  Copyright (c) 2021 - 2022, ARM Limited. All rights reserved.<BR>
++  Copyright (c) 2021 - 2023, ARM Limited. All rights reserved.<BR>
  
    SPDX-License-Identifier: BSD-2-Clause-Patent
  
@@ -139,7 +138,7 @@ index f50623ae..e023d47c 100644
    // Configuration Manager Protocol
    Status = InitializePlatformRepository (
 diff --git a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/ConfigurationManagerDxe.inf b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/ConfigurationManagerDxe.inf
-index 4f8e7f13..fb59c295 100644
+index 4f8e7f13..a4e8b783 100644
 --- a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/ConfigurationManagerDxe.inf
 +++ b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/ConfigurationManagerDxe.inf
 @@ -1,7 +1,7 @@
@@ -147,7 +146,7 @@ index 4f8e7f13..fb59c295 100644
  #  Configuration Manager Dxe
  #
 -#  Copyright (c) 2021, ARM Limited. All rights reserved.<BR>
-+#  Copyright (c) 2021 - 2022, ARM Limited. All rights reserved.<BR>
++#  Copyright (c) 2021 - 2023, ARM Limited. All rights reserved.<BR>
  #
  #  SPDX-License-Identifier: BSD-2-Clause-Patent
  #
@@ -160,14 +159,14 @@ index 4f8e7f13..fb59c295 100644
    UefiBootServicesTableLib
    UefiDriverEntryPoint
 diff --git a/Silicon/ARM/NeoverseN1Soc/Include/NeoverseN1Soc.h b/Silicon/ARM/NeoverseN1Soc/Include/NeoverseN1Soc.h
-index 097160c7..63cebaf0 100644
+index 097160c7..4966011e 100644
 --- a/Silicon/ARM/NeoverseN1Soc/Include/NeoverseN1Soc.h
 +++ b/Silicon/ARM/NeoverseN1Soc/Include/NeoverseN1Soc.h
 @@ -1,6 +1,6 @@
  /** @file
  *
 -* Copyright (c) 2018 - 2020, ARM Limited. All rights reserved.
-+* Copyright (c) 2018 - 2022, ARM Limited. All rights reserved.
++* Copyright (c) 2018 - 2023, ARM Limited. All rights reserved.
  *
  * SPDX-License-Identifier: BSD-2-Clause-Patent
  *
@@ -204,14 +203,14 @@ index 097160c7..63cebaf0 100644
 +
  #endif
 diff --git a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/AArch64/Helper.S b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/AArch64/Helper.S
-index 8d2069de..88ed640d 100644
+index 8d2069de..a0b89a7b 100644
 --- a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/AArch64/Helper.S
 +++ b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/AArch64/Helper.S
 @@ -1,6 +1,6 @@
  /** @file
  *
 -*  Copyright (c) 2019 - 2020, ARM Limited. All rights reserved.
-+*  Copyright (c) 2019 - 2022, ARM Limited. All rights reserved.
++*  Copyright (c) 2019 - 2023, ARM Limited. All rights reserved.
  *
  *  SPDX-License-Identifier: BSD-2-Clause-Patent
  *
@@ -225,14 +224,14 @@ index 8d2069de..88ed640d 100644
  
  //
 diff --git a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.c b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.c
-index c0effd37..fabe902c 100644
+index c0effd37..2f753be7 100644
 --- a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.c
 +++ b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.c
 @@ -1,6 +1,6 @@
  /** @file
  
 -  Copyright (c) 2018-2021, ARM Limited. All rights reserved.<BR>
-+  Copyright (c) 2018 - 2022, ARM Limited. All rights reserved.<BR>
++  Copyright (c) 2018 - 2023, ARM Limited. All rights reserved.<BR>
  
    SPDX-License-Identifier: BSD-2-Clause-Patent
  
@@ -270,7 +269,7 @@ index c0effd37..fabe902c 100644
  };
  
 diff --git a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf
-index 96e590cd..6f9c9d5a 100644
+index 96e590cd..78f309c3 100644
 --- a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf
 +++ b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf
 @@ -1,7 +1,7 @@
@@ -278,7 +277,7 @@ index 96e590cd..6f9c9d5a 100644
  #  Platform Library for N1Sdp.
  #
 -#  Copyright (c) 2018-2021, ARM Limited. All rights reserved.<BR>
-+#  Copyright (c) 2018 - 2022, ARM Limited. All rights reserved.<BR>
++#  Copyright (c) 2018 - 2023, ARM Limited. All rights reserved.<BR>
  #
  #  SPDX-License-Identifier: BSD-2-Clause-Patent
  #
@@ -308,14 +307,14 @@ index 96e590cd..6f9c9d5a 100644
    gArmMpCoreInfoPpiGuid
 +  gNtFwConfigDtInfoPpiGuid
 diff --git a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
-index 339fa07b..b58bda4b 100644
+index 339fa07b..1d53ec75 100644
 --- a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
 +++ b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
 @@ -1,6 +1,6 @@
  /** @file
  
 -  Copyright (c) 2018 - 2021, ARM Limited. All rights reserved.<BR>
-+  Copyright (c) 2018 - 2022, ARM Limited. All rights reserved.<BR>
++  Copyright (c) 2018 - 2023, ARM Limited. All rights reserved.<BR>
  
    SPDX-License-Identifier: BSD-2-Clause-Patent
  
@@ -442,7 +441,7 @@ index 339fa07b..b58bda4b 100644
                               NEOVERSEN1SOC_DRAM_BLOCK1_SIZE / SIZE_1GB) *
                              (UINT64)SIZE_1GB);
 diff --git a/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec b/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec
-index d59f25a5..4dea8fe1 100644
+index d59f25a5..9e257ebd 100644
 --- a/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec
 +++ b/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec
 @@ -1,7 +1,7 @@
@@ -450,7 +449,7 @@ index d59f25a5..4dea8fe1 100644
  #  Describes the entire platform configuration.
  #
 -#  Copyright (c) 2018 - 2021, ARM Limited. All rights reserved.<BR>
-+#  Copyright (c) 2018 - 2022, ARM Limited. All rights reserved.<BR>
++#  Copyright (c) 2018 - 2023, ARM Limited. All rights reserved.<BR>
  #
  #  SPDX-License-Identifier: BSD-2-Clause-Patent
  #
@@ -470,6 +469,3 @@ index d59f25a5..4dea8fe1 100644
 +
 +[Ppis]
 +  gNtFwConfigDtInfoPpiGuid =  { 0xb50dee0e, 0x577f, 0x47fb, { 0x83, 0xd0, 0x41, 0x78, 0x61, 0x8b, 0x33, 0x8a } }
--- 
-2.37.2
-
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0002-Platform-ARM-N1Sdp-Fix-RemoteDdrSize-cast.patch b/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0002-Platform-ARM-N1Sdp-Fix-RemoteDdrSize-cast.patch
index 1c097fcc..5e634175 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0002-Platform-ARM-N1Sdp-Fix-RemoteDdrSize-cast.patch
+++ b/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0002-Platform-ARM-N1Sdp-Fix-RemoteDdrSize-cast.patch
@@ -1,7 +1,7 @@
-From 73aab76042ae34fa4b07414c1830129e572dcd65 Mon Sep 17 00:00:00 2001
+From ba3ed154863d1acd0996178beaf3a2bc693b938c Mon Sep 17 00:00:00 2001
 From: sahil <sahil@arm.com>
 Date: Wed, 20 Apr 2022 12:24:41 +0530
-Subject: [PATCH 2/3] Platform/ARM/N1Sdp: Fix RemoteDdrSize cast
+Subject: [PATCH] Platform/ARM/N1Sdp: Fix RemoteDdrSize cast
 
 RemoteDdrSize calculation wraps around when booting N1Sdp in
 multichip mode. Casting it to UINT64 to fix the issue.
@@ -10,15 +10,14 @@ Upstream-Status: Pending
 Signed-off-by: Adam Johnston <adam.johnston@arm.com>
 Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
 Signed-off-by: sahil <sahil@arm.com>
-Change-Id: I2c2a70c2ab046337236fba92d25dec5905ccd117
-
+Change-Id: Ic51269a8d67669684a5f056701cfbef6beb23da2
 ---
  .../ConfigurationManagerDxe/ConfigurationManager.c              | 2 +-
  Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c  | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/ConfigurationManager.c b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/ConfigurationManager.c
-index e023d47c..36b5fc9e 100644
+index c15020f5..b11c0425 100644
 --- a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/ConfigurationManager.c
 +++ b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/ConfigurationManager.c
 @@ -1254,7 +1254,7 @@ InitializePlatformRepository (
@@ -31,7 +30,7 @@ index e023d47c..36b5fc9e 100644
      // Update Remote DDR Region1
      PlatRepoInfo->MemAffInfo[REMOTE_DDR_REGION1].ProximityDomain = 1;
 diff --git a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
-index b58bda4b..fbc9b05e 100644
+index 1d53ec75..5cacd437 100644
 --- a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
 +++ b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
 @@ -157,7 +157,7 @@ ArmPlatformGetVirtualMemoryMap (
@@ -43,6 +42,3 @@ index b58bda4b..fbc9b05e 100644
  
      BuildResourceDescriptorHob (
        EFI_RESOURCE_SYSTEM_MEMORY,
--- 
-2.37.2
-
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0003-Platform-ARM-N1Sdp-Modify-the-IRQ-ID-of-Debug-UART-a.patch b/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0003-Platform-ARM-N1Sdp-Modify-the-IRQ-ID-of-Debug-UART-a.patch
index f0de02eb..cafc2990 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0003-Platform-ARM-N1Sdp-Modify-the-IRQ-ID-of-Debug-UART-a.patch
+++ b/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0003-Platform-ARM-N1Sdp-Modify-the-IRQ-ID-of-Debug-UART-a.patch
@@ -1,7 +1,7 @@
-From adc66d99663f71ec97313c40b0d00a908f292c30 Mon Sep 17 00:00:00 2001
+From 2ccb463274d0c04f1e3253194ea6eee80c31cb49 Mon Sep 17 00:00:00 2001
 From: Himanshu Sharma <Himanshu.Sharma@arm.com>
 Date: Mon, 30 May 2022 10:53:30 +0000
-Subject: [PATCH 3/3] Platform/ARM/N1Sdp: Modify the IRQ ID of Debug UART and
+Subject: [PATCH] Platform/ARM/N1Sdp: Modify the IRQ ID of Debug UART and
  routing it to IOFPGA UART1
 
 In DBG2 table, IRQ ID was set as 0 for the UART. This overwrote the
@@ -16,15 +16,14 @@ Upstream-Status: Pending
 Signed-off-by: Adam Johnston <adam.johnston@arm.com>
 Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
 Signed-off-by: Himanshu Sharma <Himanshu.Sharma@arm.com>
-Change-Id: I6640c3c8f77afd233304ce9cb06dcf80a8659c16
-
+Change-Id: Ib35fecc57f1d8c496135c18dbebd0be0a4b76041
 ---
  .../ConfigurationManagerDxe/ConfigurationManager.c        | 2 +-
  Platform/ARM/N1Sdp/N1SdpPlatform.dsc                      | 8 ++++----
  2 files changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/ConfigurationManager.c b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/ConfigurationManager.c
-index 36b5fc9e..e8873200 100644
+index b11c0425..44046a00 100644
 --- a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/ConfigurationManager.c
 +++ b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/ConfigurationManager.c
 @@ -320,7 +320,7 @@ EDKII_PLATFORM_REPOSITORY_INFO N1sdpRepositoryInfo = {
@@ -37,7 +36,7 @@ index 36b5fc9e..e8873200 100644
      FixedPcdGet32 (PcdSerialDbgUartClkInHz),                // Clock
      EFI_ACPI_DBG2_PORT_SUBTYPE_SERIAL_ARM_PL011_UART        // Port subtype
 diff --git a/Platform/ARM/N1Sdp/N1SdpPlatform.dsc b/Platform/ARM/N1Sdp/N1SdpPlatform.dsc
-index 865dd04d..878c8f2f 100644
+index d04b22d3..676ab677 100644
 --- a/Platform/ARM/N1Sdp/N1SdpPlatform.dsc
 +++ b/Platform/ARM/N1Sdp/N1SdpPlatform.dsc
 @@ -4,7 +4,7 @@
@@ -45,7 +44,7 @@ index 865dd04d..878c8f2f 100644
  # conform to EFI/Framework standards.
  #
 -# Copyright (c) 2018 - 2021, ARM Limited. All rights reserved.<BR>
-+# Copyright (c) 2018 - 2022, ARM Limited. All rights reserved.<BR>
++# Copyright (c) 2018 - 2023, ARM Limited. All rights reserved.<BR>
  #
  # SPDX-License-Identifier: BSD-2-Clause-Patent
  #
@@ -62,6 +61,3 @@ index 865dd04d..878c8f2f 100644
  
    # SBSA Watchdog
    gArmTokenSpaceGuid.PcdGenericWatchdogEl2IntrNum|93
--- 
-2.37.2
-
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0004-Silicon-ARM-NeoverseN1Soc-Enable-SCP-QSPI-flash-regi.patch b/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0004-Silicon-ARM-NeoverseN1Soc-Enable-SCP-QSPI-flash-regi.patch
new file mode 100644
index 00000000..264d262b
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0004-Silicon-ARM-NeoverseN1Soc-Enable-SCP-QSPI-flash-regi.patch
@@ -0,0 +1,57 @@
+From e4b0fced6f3fd3c8ce5ab4d3aae97b880e7e07b0 Mon Sep 17 00:00:00 2001
+From: sahil <sahil@arm.com>
+Date: Mon, 2 May 2022 17:43:17 +0530
+Subject: [PATCH] Silicon/ARM/NeoverseN1Soc: Enable SCP QSPI flash region
+
+Enable SCP QSPI flash region access by adding it in the PlatformLibMem
+
+Upstream-Status: Pending
+Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
+Signed-off-by: sahil <sahil@arm.com>
+Change-Id: I3ff832746ca94974ed72309eebe00e0024c47005
+---
+ Silicon/ARM/NeoverseN1Soc/Include/NeoverseN1Soc.h         | 4 ++++
+ .../NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c    | 8 +++++++-
+ 2 files changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/Silicon/ARM/NeoverseN1Soc/Include/NeoverseN1Soc.h b/Silicon/ARM/NeoverseN1Soc/Include/NeoverseN1Soc.h
+index 4966011e..c7219136 100644
+--- a/Silicon/ARM/NeoverseN1Soc/Include/NeoverseN1Soc.h
++++ b/Silicon/ARM/NeoverseN1Soc/Include/NeoverseN1Soc.h
+@@ -41,6 +41,10 @@
+ #define NEOVERSEN1SOC_EXP_PERIPH_BASE0               0x1C000000
+ #define NEOVERSEN1SOC_EXP_PERIPH_BASE0_SZ            0x1300000
+ 
++// SCP QSPI flash device
++#define NEOVERSEN1SOC_SCP_QSPI_AHB_BASE              0x18000000
++#define NEOVERSEN1SOC_SCP_QSPI_AHB_SZ                0x2000000
++
+ /*
+  * Platform information structure stored in Non-secure SRAM. Platform
+  * information are passed from the trusted firmware with the below structure
+diff --git a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
+index 5cacd437..8bb94074 100644
+--- a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
++++ b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
+@@ -15,7 +15,7 @@
+ #include <NeoverseN1Soc.h>
+ 
+ // The total number of descriptors, including the final "end-of-table" descriptor.
+-#define MAX_VIRTUAL_MEMORY_MAP_DESCRIPTORS 19
++#define MAX_VIRTUAL_MEMORY_MAP_DESCRIPTORS 20
+ 
+ /** A helper function to locate the NtFwConfig PPI and get the base address of
+   NT_FW_CONFIG DT from which values are obtained using FDT helper functions.
+@@ -283,6 +283,12 @@ ArmPlatformGetVirtualMemoryMap (
+   VirtualMemoryTable[Index].Length          = NEOVERSEN1SOC_EXP_PERIPH_BASE0_SZ;
+   VirtualMemoryTable[Index].Attributes      = ARM_MEMORY_REGION_ATTRIBUTE_DEVICE;
+ 
++  // SCP QSPI flash device
++  VirtualMemoryTable[++Index].PhysicalBase  = NEOVERSEN1SOC_SCP_QSPI_AHB_BASE;
++  VirtualMemoryTable[Index].VirtualBase     = NEOVERSEN1SOC_SCP_QSPI_AHB_BASE;
++  VirtualMemoryTable[Index].Length          = NEOVERSEN1SOC_SCP_QSPI_AHB_SZ;
++  VirtualMemoryTable[Index].Attributes      = ARM_MEMORY_REGION_ATTRIBUTE_DEVICE;
++
+   if (PlatInfo->MultichipMode == 1) {
+     //Remote DDR (2GB)
+     VirtualMemoryTable[++Index].PhysicalBase  = PcdGet64 (PcdExtMemorySpace) +
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0005-Platform-ARM-N1Sdp-NOR-flash-library-for-N1Sdp.patch b/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0005-Platform-ARM-N1Sdp-NOR-flash-library-for-N1Sdp.patch
new file mode 100644
index 00000000..eabbaf99
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0005-Platform-ARM-N1Sdp-NOR-flash-library-for-N1Sdp.patch
@@ -0,0 +1,119 @@
+From 70e79ba5300f01a13422452c29e26c69042a0c8c Mon Sep 17 00:00:00 2001
+From: sahil <sahil@arm.com>
+Date: Mon, 2 May 2022 18:50:08 +0530
+Subject: [PATCH] Platform/ARM/N1Sdp: NOR flash library for N1Sdp
+
+Add NOR flash library, this library provides APIs for getting the list
+of NOR flash devices on the platform.
+
+Upstream-Status: Pending
+Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
+Signed-off-by: sahil <sahil@arm.com>
+Change-Id: I39ad4143b7fad7e33b3b151a019a74f23e0ed441
+---
+ .../Library/NorFlashLib/NorFlashLib.c         | 52 +++++++++++++++++++
+ .../Library/NorFlashLib/NorFlashLib.inf       | 36 +++++++++++++
+ 2 files changed, 88 insertions(+)
+ create mode 100644 Silicon/ARM/NeoverseN1Soc/Library/NorFlashLib/NorFlashLib.c
+ create mode 100644 Silicon/ARM/NeoverseN1Soc/Library/NorFlashLib/NorFlashLib.inf
+
+diff --git a/Silicon/ARM/NeoverseN1Soc/Library/NorFlashLib/NorFlashLib.c b/Silicon/ARM/NeoverseN1Soc/Library/NorFlashLib/NorFlashLib.c
+new file mode 100644
+index 00000000..eee3d1c6
+--- /dev/null
++++ b/Silicon/ARM/NeoverseN1Soc/Library/NorFlashLib/NorFlashLib.c
+@@ -0,0 +1,52 @@
++/** @file
++  NOR flash lib for N1Sdp
++
++  Copyright (c) 2023, ARM Limited. All rights reserved.<BR>
++
++  SPDX-License-Identifier: BSD-2-Clause-Patent
++
++**/
++
++#include <Library/DebugLib.h>
++#include <Library/IoLib.h>
++#include <Library/NorFlashPlatformLib.h>
++#include <NeoverseN1Soc.h>
++#include <PiDxe.h>
++
++#define FW_ENV_REGION_BASE            FixedPcdGet32 (PcdFlashNvStorageVariableBase)
++#define FW_ENV_REGION_SIZE            (FixedPcdGet32 (PcdFlashNvStorageVariableSize) + \
++                                      FixedPcdGet32 (PcdFlashNvStorageFtwWorkingSize) + \
++                                      FixedPcdGet32 (PcdFlashNvStorageFtwSpareSize))
++
++STATIC NOR_FLASH_DESCRIPTION mNorFlashDevices[] = {
++  {
++    /// Environment variable region
++    NEOVERSEN1SOC_SCP_QSPI_AHB_BASE,                    ///< device base
++    FW_ENV_REGION_BASE,                                 ///< region base
++    FW_ENV_REGION_SIZE,                                 ///< region size
++    SIZE_4KB,                                           ///< block size
++  },
++};
++
++/**
++  Get NOR flash region info
++
++  @param[out]    NorFlashDevices    NOR flash regions info.
++  @param[out]    Count              number of flash instance.
++
++  @retval        EFI_SUCCESS        Success.
++**/
++EFI_STATUS
++NorFlashPlatformGetDevices (
++  OUT NOR_FLASH_DESCRIPTION   **NorFlashDevices,
++  OUT UINT32                  *Count
++  )
++{
++  if ((NorFlashDevices == NULL) || (Count == NULL)) {
++    return EFI_INVALID_PARAMETER;
++  }
++
++  *NorFlashDevices = mNorFlashDevices;
++  *Count = ARRAY_SIZE (mNorFlashDevices);
++  return EFI_SUCCESS;
++}
+diff --git a/Silicon/ARM/NeoverseN1Soc/Library/NorFlashLib/NorFlashLib.inf b/Silicon/ARM/NeoverseN1Soc/Library/NorFlashLib/NorFlashLib.inf
+new file mode 100644
+index 00000000..784856c8
+--- /dev/null
++++ b/Silicon/ARM/NeoverseN1Soc/Library/NorFlashLib/NorFlashLib.inf
+@@ -0,0 +1,36 @@
++## @file
++#  NOR flash lib for N1Sdp
++#
++#  Copyright (c) 2023, ARM Limited. All rights reserved.<BR>
++#
++#  SPDX-License-Identifier: BSD-2-Clause-Patent
++#
++##
++
++[Defines]
++  INF_VERSION                    = 0x0001001B
++  BASE_NAME                      = NorFlashN1SdpLib
++  FILE_GUID                      = 7006fcf1-a585-4272-92e3-b286b1dff5bb
++  MODULE_TYPE                    = DXE_DRIVER
++  VERSION_STRING                 = 1.0
++  LIBRARY_CLASS                  = NorFlashPlatformLib
++
++[Sources.common]
++  NorFlashLib.c
++
++[Packages]
++  MdeModulePkg/MdeModulePkg.dec
++  MdePkg/MdePkg.dec
++  Platform/ARM/ARM.dec
++  Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec
++
++[LibraryClasses]
++  BaseLib
++  DebugLib
++  IoLib
++
++[FixedPcd]
++  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageFtwSpareSize
++  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageFtwWorkingSize
++  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageVariableBase
++  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageVariableSize
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0006-Platform-ARM-N1Sdp-NOR-flash-Dxe-Driver-for-N1Sdp.patch b/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0006-Platform-ARM-N1Sdp-NOR-flash-Dxe-Driver-for-N1Sdp.patch
new file mode 100644
index 00000000..1db94e49
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0006-Platform-ARM-N1Sdp-NOR-flash-Dxe-Driver-for-N1Sdp.patch
@@ -0,0 +1,2538 @@
+From 726f4505970c82db1822b127059519044dc496c8 Mon Sep 17 00:00:00 2001
+From: sahil <sahil@arm.com>
+Date: Mon, 2 May 2022 19:00:40 +0530
+Subject: [PATCH] Platform/ARM/N1Sdp: NOR flash Dxe Driver for N1Sdp
+
+Add NOR flash DXE driver, this brings up NV storage on
+QSPI's flash device using FVB protocol.
+
+Upstream-Status: Pending
+Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
+Signed-off-by: sahil <sahil@arm.com>
+Change-Id: Ica383c2be6d1805daa19afd98d28b943816218dd
+---
+ .../Drivers/CadenceQspiDxe/CadenceQspiDxe.c   | 366 +++++++
+ .../Drivers/CadenceQspiDxe/CadenceQspiDxe.inf |  70 ++
+ .../Drivers/CadenceQspiDxe/CadenceQspiReg.h   |  31 +
+ .../N1Sdp/Drivers/CadenceQspiDxe/NorFlash.c   | 930 ++++++++++++++++++
+ .../N1Sdp/Drivers/CadenceQspiDxe/NorFlash.h   | 484 +++++++++
+ .../Drivers/CadenceQspiDxe/NorFlashFvb.c      | 573 +++++++++++
+ Platform/ARM/N1Sdp/N1SdpPlatform.dec          |   5 +-
+ 7 files changed, 2458 insertions(+), 1 deletion(-)
+ create mode 100644 Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiDxe.c
+ create mode 100644 Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiDxe.inf
+ create mode 100644 Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiReg.h
+ create mode 100644 Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/NorFlash.c
+ create mode 100644 Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/NorFlash.h
+ create mode 100644 Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/NorFlashFvb.c
+
+diff --git a/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiDxe.c b/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiDxe.c
+new file mode 100644
+index 00000000..fb1dff3e
+--- /dev/null
++++ b/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiDxe.c
+@@ -0,0 +1,366 @@
++/** @file
++  NOR flash DXE
++
++  Copyright (c) 2023, ARM Limited. All rights reserved.<BR>
++
++  SPDX-License-Identifier: BSD-2-Clause-Patent
++
++**/
++
++#include <Library/BaseMemoryLib.h>
++#include <Library/DxeServicesTableLib.h>
++#include <Library/HobLib.h>
++#include <Library/MemoryAllocationLib.h>
++#include <Library/NorFlashInfoLib.h>
++#include <Library/PcdLib.h>
++#include <Library/UefiBootServicesTableLib.h>
++#include <Library/UefiLib.h>
++#include <Library/UefiRuntimeLib.h>
++#include <Library/UefiRuntimeServicesTableLib.h>
++
++#include "NorFlash.h"
++
++STATIC NOR_FLASH_INSTANCE   **mNorFlashInstances;
++STATIC UINT32               mNorFlashDeviceCount;
++
++STATIC EFI_EVENT mNorFlashVirtualAddrChangeEvent;
++
++/**
++  Install Fv block onto variable store region
++
++  @param[in]   Instance         Instance of Nor flash variable region.
++
++  @retval      EFI_SUCCESS      The entry point is executed successfully.
++**/
++EFI_STATUS
++EFIAPI
++NorFlashFvbInitialize (
++  IN NOR_FLASH_INSTANCE* Instance
++  )
++{
++  EFI_STATUS      Status;
++  UINT32          FvbNumLba;
++  EFI_BOOT_MODE   BootMode;
++  UINTN           RuntimeMmioRegionSize;
++  UINTN           RuntimeMmioDeviceSize;
++  UINTN           BlockSize;
++
++  DEBUG ((DEBUG_INFO,"NorFlashFvbInitialize\n"));
++
++  BlockSize = Instance->BlockSize;
++
++  // FirmwareVolumeHeader->FvLength is declared to have the Variable area
++  // AND the FTW working area AND the FTW Spare contiguous.
++  ASSERT (PcdGet32 (PcdFlashNvStorageVariableBase) +
++         PcdGet32 (PcdFlashNvStorageVariableSize) ==
++         PcdGet32 (PcdFlashNvStorageFtwWorkingBase));
++  ASSERT (PcdGet32 (PcdFlashNvStorageFtwWorkingBase) +
++         PcdGet32 (PcdFlashNvStorageFtwWorkingSize) ==
++         PcdGet32 (PcdFlashNvStorageFtwSpareBase));
++
++  // Check if the size of the area is at least one block size.
++  ASSERT ((PcdGet32 (PcdFlashNvStorageVariableSize) > 0) &&
++         (PcdGet32 (PcdFlashNvStorageVariableSize) / BlockSize > 0));
++  ASSERT ((PcdGet32 (PcdFlashNvStorageFtwWorkingSize) > 0) &&
++         (PcdGet32 (PcdFlashNvStorageFtwWorkingSize) / BlockSize > 0));
++  ASSERT ((PcdGet32 (PcdFlashNvStorageFtwSpareSize) > 0) &&
++         (PcdGet32 (PcdFlashNvStorageFtwSpareSize) / BlockSize > 0));
++
++  // Ensure the Variable areas are aligned on block size boundaries.
++  ASSERT ((PcdGet32 (PcdFlashNvStorageVariableBase) % BlockSize) == 0);
++  ASSERT ((PcdGet32 (PcdFlashNvStorageFtwWorkingBase) % BlockSize) == 0);
++  ASSERT ((PcdGet32 (PcdFlashNvStorageFtwSpareBase) % BlockSize) == 0);
++
++  Instance->Initialized = TRUE;
++  mFlashNvStorageVariableBase = FixedPcdGet32 (PcdFlashNvStorageVariableBase);
++
++  // Set the index of the first LBA for the FVB.
++  Instance->StartLba = (PcdGet32 (PcdFlashNvStorageVariableBase) -
++                        Instance->RegionBaseAddress) / BlockSize;
++
++  BootMode = GetBootModeHob ();
++  if (BootMode == BOOT_WITH_DEFAULT_SETTINGS) {
++    Status = EFI_INVALID_PARAMETER;
++  } else {
++    // Determine if there is a valid header at the beginning of the NorFlash.
++    Status = ValidateFvHeader (Instance);
++  }
++
++  // Install the Default FVB header if required.
++  if (EFI_ERROR(Status)) {
++    // There is no valid header, so time to install one.
++    DEBUG ((DEBUG_INFO, "%a: The FVB Header is not valid.\n", __FUNCTION__));
++    DEBUG ((DEBUG_INFO, "%a: Installing a correct one for this volume.\n",
++      __FUNCTION__));
++
++    // Erase all the NorFlash that is reserved for variable storage.
++    FvbNumLba = (PcdGet32 (PcdFlashNvStorageVariableSize) +
++                 PcdGet32 (PcdFlashNvStorageFtwWorkingSize) +
++                 PcdGet32 (PcdFlashNvStorageFtwSpareSize)) /
++                 Instance->BlockSize;
++
++    Status = FvbEraseBlocks (
++               &Instance->FvbProtocol,
++               (EFI_LBA)0,
++               FvbNumLba,
++               EFI_LBA_LIST_TERMINATOR
++               );
++    if (EFI_ERROR(Status)) {
++      return Status;
++    }
++
++    // Install all appropriate headers.
++    Status = InitializeFvAndVariableStoreHeaders (Instance);
++    if (EFI_ERROR(Status)) {
++      return Status;
++    }
++
++    // validate FV header again if FV was created successfully.
++    Status = ValidateFvHeader (Instance);
++    if (EFI_ERROR(Status)) {
++      DEBUG ((DEBUG_ERROR, "ValidateFvHeader is failed \n"));
++      return Status;
++    }
++  }
++
++  // The driver implementing the variable read service can now be dispatched;
++  // the varstore headers are in place.
++  Status = gBS->InstallProtocolInterface (
++                  &gImageHandle,
++                  &gEdkiiNvVarStoreFormattedGuid,
++                  EFI_NATIVE_INTERFACE,
++                  NULL
++                  );
++  if (EFI_ERROR (Status)) {
++    DEBUG ((DEBUG_ERROR,
++      "%a: Failed to install gEdkiiNvVarStoreFormattedGuid\n",
++      __FUNCTION__));
++    return Status;
++  }
++
++  // Declare the Non-Volatile storage as EFI_MEMORY_RUNTIME.
++  RuntimeMmioRegionSize = Instance->Size;
++  RuntimeMmioDeviceSize = Instance->RegionBaseAddress - Instance->DeviceBaseAddress;
++
++  Status = gDS->AddMemorySpace (
++                  EfiGcdMemoryTypeMemoryMappedIo,
++                  Instance->RegionBaseAddress,
++                  RuntimeMmioRegionSize,
++                  EFI_MEMORY_UC | EFI_MEMORY_RUNTIME
++                  );
++  ASSERT_EFI_ERROR (Status);
++
++  Status = gDS->AddMemorySpace (
++                  EfiGcdMemoryTypeMemoryMappedIo,
++                  Instance->DeviceBaseAddress,
++                  RuntimeMmioDeviceSize,
++                  EFI_MEMORY_UC | EFI_MEMORY_RUNTIME
++                  );
++  ASSERT_EFI_ERROR (Status);
++
++  Status = gDS->SetMemorySpaceAttributes (
++                  Instance->RegionBaseAddress,
++                  RuntimeMmioRegionSize,
++                  EFI_MEMORY_UC | EFI_MEMORY_RUNTIME
++                  );
++  ASSERT_EFI_ERROR (Status);
++
++  Status = gDS->SetMemorySpaceAttributes (
++                  Instance->DeviceBaseAddress,
++                  RuntimeMmioDeviceSize,
++                  EFI_MEMORY_UC | EFI_MEMORY_RUNTIME
++                  );
++  ASSERT_EFI_ERROR (Status);
++
++  return Status;
++}
++
++/**
++  Fixup internal data so that EFI can be called in virtual mode.
++  convert any pointers in lib to virtual mode.
++
++  @param[in]    Event   The Event that is being processed
++  @param[in]    Context Event Context
++**/
++STATIC
++VOID
++EFIAPI
++NorFlashVirtualNotifyEvent (
++  IN EFI_EVENT        Event,
++  IN VOID             *Context
++  )
++{
++  UINTN Index;
++
++  EfiConvertPointer (0x0, (VOID**)&mFlashNvStorageVariableBase);
++
++  for (Index = 0; Index < mNorFlashDeviceCount; Index++) {
++    EfiConvertPointer (0x0,
++      (VOID**)&mNorFlashInstances[Index]->HostRegisterBaseAddress);
++    EfiConvertPointer (0x0,
++      (VOID**)&mNorFlashInstances[Index]->DeviceBaseAddress);
++    EfiConvertPointer (0x0,
++      (VOID**)&mNorFlashInstances[Index]->RegionBaseAddress);
++
++    // Convert Fvb.
++    EfiConvertPointer (0x0,
++      (VOID**)&mNorFlashInstances[Index]->FvbProtocol.EraseBlocks);
++    EfiConvertPointer (0x0,
++      (VOID**)&mNorFlashInstances[Index]->FvbProtocol.GetAttributes);
++    EfiConvertPointer (0x0,
++      (VOID**)&mNorFlashInstances[Index]->FvbProtocol.GetBlockSize);
++    EfiConvertPointer (0x0,
++      (VOID**)&mNorFlashInstances[Index]->FvbProtocol.GetPhysicalAddress);
++    EfiConvertPointer (0x0,
++      (VOID**)&mNorFlashInstances[Index]->FvbProtocol.Read);
++    EfiConvertPointer (0x0,
++      (VOID**)&mNorFlashInstances[Index]->FvbProtocol.SetAttributes);
++    EfiConvertPointer (0x0,
++      (VOID**)&mNorFlashInstances[Index]->FvbProtocol.Write);
++
++    if (mNorFlashInstances[Index]->ShadowBuffer != NULL) {
++      EfiConvertPointer (0x0, (VOID**)&mNorFlashInstances[Index]->ShadowBuffer);
++    }
++  }
++}
++
++/**
++  Entrypoint of Platform Nor flash DXE driver
++
++  @param[in]  ImageHandle       The firmware allocated handle for the EFI image.
++  @param[in]  SystemTable       A pointer to the EFI System Table.
++
++  @retval     EFI_SUCCESS       The entry point is executed successfully.
++**/
++EFI_STATUS
++EFIAPI
++NorFlashInitialise (
++  IN EFI_HANDLE           ImageHandle,
++  IN EFI_SYSTEM_TABLE     *SystemTable
++  )
++{
++  EFI_STATUS              Status;
++  EFI_PHYSICAL_ADDRESS    HostRegisterBaseAddress;
++  UINT32                  Index;
++  NOR_FLASH_DESCRIPTION*  NorFlashDevices;
++  BOOLEAN                 ContainVariableStorage;
++
++  HostRegisterBaseAddress = PcdGet32 (PcdCadenceQspiDxeRegBaseAddress);
++
++  Status = gDS->AddMemorySpace (
++                  EfiGcdMemoryTypeMemoryMappedIo,
++                  HostRegisterBaseAddress,
++                  SIZE_64KB,
++                  EFI_MEMORY_UC | EFI_MEMORY_RUNTIME
++                  );
++  ASSERT_EFI_ERROR (Status);
++
++  Status = gDS->SetMemorySpaceAttributes (
++                  HostRegisterBaseAddress,
++                  SIZE_64KB,
++                  EFI_MEMORY_UC | EFI_MEMORY_RUNTIME
++                  );
++  ASSERT_EFI_ERROR (Status);
++
++  // Initialize NOR flash instances.
++  Status = NorFlashPlatformGetDevices (&NorFlashDevices, &mNorFlashDeviceCount);
++  if (EFI_ERROR (Status)) {
++    DEBUG ((DEBUG_ERROR,"NorFlashInitialise: Fail to get Nor Flash devices\n"));
++    return Status;
++  }
++
++  mNorFlashInstances = AllocateRuntimePool (sizeof (NOR_FLASH_INSTANCE*) *
++                                            mNorFlashDeviceCount);
++
++  if(mNorFlashInstances == NULL) {
++    DEBUG ((DEBUG_ERROR,
++      "NorFlashInitialise: Failed to allocate mem for NorFlashInstance\n"));
++    return EFI_OUT_OF_RESOURCES;
++  }
++
++  for (Index = 0; Index < mNorFlashDeviceCount; Index++) {
++    // Check if this NOR Flash device contain the variable storage region.
++    ContainVariableStorage =
++        (NorFlashDevices[Index].RegionBaseAddress <=
++         PcdGet32 (PcdFlashNvStorageVariableBase)) &&
++        (PcdGet32 (PcdFlashNvStorageVariableBase) +
++         PcdGet32 (PcdFlashNvStorageVariableSize) <=
++        NorFlashDevices[Index].RegionBaseAddress + NorFlashDevices[Index].Size);
++
++    Status = NorFlashCreateInstance (
++               HostRegisterBaseAddress,
++               NorFlashDevices[Index].DeviceBaseAddress,
++               NorFlashDevices[Index].RegionBaseAddress,
++               NorFlashDevices[Index].Size,
++               Index,
++               NorFlashDevices[Index].BlockSize,
++               ContainVariableStorage,
++               &mNorFlashInstances[Index]
++               );
++    if (EFI_ERROR (Status)) {
++      DEBUG ((DEBUG_ERROR,
++        "NorFlashInitialise: Fail to create instance for NorFlash[%d]\n",
++        Index));
++      continue;
++    }
++    Status = gBS->InstallMultipleProtocolInterfaces (
++                    &mNorFlashInstances[Index]->Handle,
++                    &gEfiDevicePathProtocolGuid,
++                    &mNorFlashInstances[Index]->DevicePath,
++                    &gEfiFirmwareVolumeBlockProtocolGuid,
++                    &mNorFlashInstances[Index]->FvbProtocol,
++                    NULL
++                    );
++    ASSERT_EFI_ERROR (Status);
++  }
++  // Register for the virtual address change event.
++  Status = gBS->CreateEventEx (
++                  EVT_NOTIFY_SIGNAL,
++                  TPL_NOTIFY,
++                  NorFlashVirtualNotifyEvent,
++                  NULL,
++                  &gEfiEventVirtualAddressChangeGuid,
++                  &mNorFlashVirtualAddrChangeEvent
++                  );
++  ASSERT_EFI_ERROR (Status);
++
++  return Status;
++}
++
++/**
++  Lock all pending read/write to Nor flash device
++
++  @param[in]     Context     Nor flash device context structure.
++**/
++VOID
++EFIAPI
++NorFlashLock (
++  IN NOR_FLASH_LOCK_CONTEXT    *Context
++  )
++{
++  if (!EfiAtRuntime ()) {
++    // Raise TPL to TPL_HIGH to stop anyone from interrupting us.
++    Context->OriginalTPL = gBS->RaiseTPL (TPL_HIGH_LEVEL);
++  } else {
++    Context->InterruptsEnabled = SaveAndDisableInterrupts ();
++  }
++}
++
++/**
++  Unlock all pending read/write to Nor flash device
++
++  @param[in]     Context     Nor flash device context structure.
++**/
++VOID
++EFIAPI
++NorFlashUnlock (
++  IN NOR_FLASH_LOCK_CONTEXT    *Context
++  )
++{
++  if (!EfiAtRuntime ()) {
++    // Interruptions can resume.
++    gBS->RestoreTPL (Context->OriginalTPL);
++  } else if (Context->InterruptsEnabled) {
++    SetInterruptState (TRUE);
++  }
++}
+diff --git a/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiDxe.inf b/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiDxe.inf
+new file mode 100644
+index 00000000..4f20c3ba
+--- /dev/null
++++ b/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiDxe.inf
+@@ -0,0 +1,70 @@
++## @file
++#  NOR flash DXE
++#
++#  Copyright (c) 2023, ARM Limited. All rights reserved.<BR>
++#
++#  SPDX-License-Identifier: BSD-2-Clause-Patent
++#
++##
++
++[Defines]
++  INF_VERSION                    = 0x0001001B
++  BASE_NAME                      = CadenceQspiDxe
++  FILE_GUID                      = CC8A9713-4442-4A6C-B389-8B46490A0641
++  MODULE_TYPE                    = DXE_RUNTIME_DRIVER
++  VERSION_STRING                 = 0.1
++  ENTRY_POINT                    = NorFlashInitialise
++
++[Sources]
++  CadenceQspiDxe.c
++  NorFlash.c
++  NorFlash.h
++  NorFlashFvb.c
++
++[Packages]
++  EmbeddedPkg/EmbeddedPkg.dec
++  MdeModulePkg/MdeModulePkg.dec
++  MdePkg/MdePkg.dec
++  Platform/ARM/ARM.dec
++  Platform/ARM/N1Sdp/N1SdpPlatform.dec
++
++[LibraryClasses]
++  BaseLib
++  BaseMemoryLib
++  DebugLib
++  DevicePathLib
++  DxeServicesTableLib
++  HobLib
++  IoLib
++  MemoryAllocationLib
++  NorFlashInfoLib
++  NorFlashPlatformLib
++  UefiBootServicesTableLib
++  UefiDriverEntryPoint
++  UefiLib
++  UefiRuntimeLib
++  UefiRuntimeServicesTableLib
++
++[Guids]
++  gEdkiiNvVarStoreFormattedGuid
++  gEfiAuthenticatedVariableGuid
++  gEfiEventVirtualAddressChangeGuid
++  gEfiSystemNvDataFvGuid
++  gEfiVariableGuid
++  gEfiGlobalVariableGuid
++
++[Protocols]
++  gEfiDevicePathProtocolGuid
++  gEfiFirmwareVolumeBlockProtocolGuid
++
++[FixedPcd]
++  gArmN1SdpTokenSpaceGuid.PcdCadenceQspiDxeRegBaseAddress
++  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageVariableBase
++  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageVariableSize
++  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageFtwWorkingBase
++  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageFtwWorkingSize
++  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageFtwSpareBase
++  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageFtwSpareSize
++
++[Depex]
++  gEfiCpuArchProtocolGuid
+diff --git a/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiReg.h b/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiReg.h
+new file mode 100644
+index 00000000..fe3b327c
+--- /dev/null
++++ b/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiReg.h
+@@ -0,0 +1,31 @@
++/** @file
++
++  Copyright (c) 2023, ARM Limited. All rights reserved.<BR>
++
++  SPDX-License-Identifier: BSD-2-Clause-Patent
++
++**/
++
++#ifndef CADENCE_QSPI_REG_H_
++#define CADENCE_QSPI_REG_H_
++
++// QSPI Controller defines
++#define CDNS_QSPI_FLASH_CMD_CTRL_REG_OFFSET               0x90
++#define CDNS_QSPI_FLASH_CMD_CTRL_REG_EXECUTE              0x01
++#define CDNS_QSPI_FLASH_CMD_CTRL_REG_ADDR_ENABLE          0x01
++#define CDNS_QSPI_FLASH_CMD_CTRL_REG_ADDR_BIT_POS         19
++#define CDNS_QSPI_FLASH_CMD_CTRL_REG_ADDR_BYTE_BIT_POS    16
++#define CDNS_QSPI_FLASH_CMD_CTRL_REG_STATUS_BIT           0x02
++#define CDNS_QSPI_FLASH_CMD_CTRL_REG_ADDR_BYTE_4B         0x03
++#define CDNS_QSPI_FLASH_CMD_CTRL_REG_ADDR_BYTE_3B         0x02
++#define CDNS_QSPI_FLASH_CMD_CTRL_REG_OPCODE_BIT_POS       24
++#define CDNS_QSPI_FLASH_CMD_CTRL_REG_READ_ENABLE          0x01
++#define CDNS_QSPI_FLASH_CMD_CTRL_REG_READ_BYTE_3B         0x02
++#define CDNS_QSPI_FLASH_CMD_CTRL_REG_READEN_BIT_POS       23
++#define CDNS_QSPI_FLASH_CMD_CTRL_REG_READBYTE_BIT_POS     20
++
++#define CDNS_QSPI_FLASH_CMD_READ_DATA_REG_OFFSET          0xA0
++
++#define CDNS_QSPI_FLASH_CMD_ADDR_REG_OFFSET               0x94
++
++#endif /* CADENCE_QSPI_REG_H_ */
+diff --git a/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/NorFlash.c b/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/NorFlash.c
+new file mode 100644
+index 00000000..188c75e2
+--- /dev/null
++++ b/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/NorFlash.c
+@@ -0,0 +1,930 @@
++/** @file
++
++  Copyright (c) 2023 ARM Limited. All rights reserved.<BR>
++
++  SPDX-License-Identifier: BSD-2-Clause-Patent
++
++**/
++
++#include <Library/BaseMemoryLib.h>
++#include <Library/MemoryAllocationLib.h>
++#include <Library/NorFlashInfoLib.h>
++#include <Library/PcdLib.h>
++#include <Library/UefiBootServicesTableLib.h>
++#include <Library/UefiLib.h>
++
++#include "NorFlash.h"
++
++STATIC CONST NOR_FLASH_INSTANCE mNorFlashInstanceTemplate = {
++  NOR_FLASH_SIGNATURE, // Signature
++  NULL, // Handle
++
++  FALSE, // Initialized
++  NULL, // Initialize
++
++  0, // HostRegisterBaseAddress
++  0, // DeviceBaseAddress
++  0, // RegionBaseAddress
++  0, // Size
++  0, // BlockSize
++  0, // LastBlock
++  0, // StartLba
++  0, // OffsetLba
++
++  {
++    FvbGetAttributes, // GetAttributes
++    FvbSetAttributes, // SetAttributes
++    FvbGetPhysicalAddress,  // GetPhysicalAddress
++    FvbGetBlockSize,  // GetBlockSize
++    FvbRead,  // Read
++    FvbWrite, // Write
++    FvbEraseBlocks, // EraseBlocks
++    NULL, //ParentHandle
++  }, //  FvbProtoccol;
++  NULL, // ShadowBuffer
++
++  {
++    {
++      {
++        HARDWARE_DEVICE_PATH,
++        HW_VENDOR_DP,
++        {
++          (UINT8)(OFFSET_OF (NOR_FLASH_DEVICE_PATH, End)),
++          (UINT8)(OFFSET_OF (NOR_FLASH_DEVICE_PATH, End) >> 8)
++        }
++      },
++    { 0x0, 0x0, 0x0, { 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0 } },
++  },
++  0,  // Index
++
++  {
++    END_DEVICE_PATH_TYPE,
++    END_ENTIRE_DEVICE_PATH_SUBTYPE,
++    { sizeof (EFI_DEVICE_PATH_PROTOCOL), 0 }
++  }
++
++  }, // DevicePath
++  0 // Flags
++};
++
++/**
++  Execute Flash cmd ctrl and Read Status.
++
++  @param[in]      Instance         NOR flash Instance.
++  @param[in]      Val              Value to be written to Flash cmd ctrl Register.
++
++  @retval         EFI_SUCCESS      Request is executed successfully.
++
++**/
++STATIC
++EFI_STATUS
++CdnsQspiExecuteCommand (
++  IN  NOR_FLASH_INSTANCE    *Instance,
++  IN  UINT32                Val
++  )
++{
++  // Set the command
++  MmioWrite32 (Instance->HostRegisterBaseAddress + CDNS_QSPI_FLASH_CMD_CTRL_REG_OFFSET,
++                Val);
++  // Execute the command
++  MmioWrite32 (Instance->HostRegisterBaseAddress + CDNS_QSPI_FLASH_CMD_CTRL_REG_OFFSET,
++                Val | CDNS_QSPI_FLASH_CMD_CTRL_REG_EXECUTE);
++
++  // Wait until command has been executed
++  while ((MmioRead32 (Instance->HostRegisterBaseAddress + CDNS_QSPI_FLASH_CMD_CTRL_REG_OFFSET)
++          & CDNS_QSPI_FLASH_CMD_CTRL_REG_STATUS_BIT) == CDNS_QSPI_FLASH_CMD_CTRL_REG_STATUS_BIT)
++    continue;
++
++  return EFI_SUCCESS;
++}
++
++/**
++  Create Nor flash Instance for given region.
++
++  @param[in]    HostRegisterBase      Base address of Nor flash controller.
++  @param[in]    NorFlashDeviceBase    Base address of flash device.
++  @param[in]    NorFlashRegionBase    Base address of flash region on device.
++  @param[in]    NorFlashSize          Size of flash region.
++  @param[in]    Index                 Index of given flash region.
++  @param[in]    BlockSize             Block size of NOR flash device.
++  @param[in]    HasVarStore           Boolean set for VarStore on given region.
++  @param[out]   NorFlashInstance      Instance of given flash region.
++
++  @retval       EFI_SUCCESS           On successful creation of NOR flash instance.
++**/
++EFI_STATUS
++NorFlashCreateInstance (
++  IN UINTN                  HostRegisterBase,
++  IN UINTN                  NorFlashDeviceBase,
++  IN UINTN                  NorFlashRegionBase,
++  IN UINTN                  NorFlashSize,
++  IN UINT32                 Index,
++  IN UINT32                 BlockSize,
++  IN BOOLEAN                HasVarStore,
++  OUT NOR_FLASH_INSTANCE**  NorFlashInstance
++  )
++{
++  EFI_STATUS Status;
++  NOR_FLASH_INSTANCE* Instance;
++  NOR_FLASH_INFO *FlashInfo;
++  UINT8 JedecId[3];
++
++  ASSERT(NorFlashInstance != NULL);
++  Instance = AllocateRuntimeCopyPool (sizeof (mNorFlashInstanceTemplate),
++                                      &mNorFlashInstanceTemplate);
++  if (Instance == NULL) {
++    return EFI_OUT_OF_RESOURCES;
++  }
++
++  Instance->HostRegisterBaseAddress = HostRegisterBase;
++  Instance->DeviceBaseAddress       = NorFlashDeviceBase;
++  Instance->RegionBaseAddress       = NorFlashRegionBase;
++  Instance->Size                    = NorFlashSize;
++  Instance->BlockSize               = BlockSize;
++  Instance->LastBlock               = (NorFlashSize / BlockSize) - 1;
++
++  Instance->OffsetLba = (NorFlashRegionBase - NorFlashDeviceBase) / BlockSize;
++
++  CopyGuid (&Instance->DevicePath.Vendor.Guid, &gEfiCallerIdGuid);
++  Instance->DevicePath.Index = (UINT8)Index;
++
++  Status = NorFlashReadID (Instance, JedecId);
++  if (EFI_ERROR (Status)) {
++    goto FreeInstance;
++  }
++
++  Status = NorFlashGetInfo (JedecId, &FlashInfo, TRUE);
++  if (EFI_ERROR (Status)) {
++    goto FreeInstance;
++  }
++
++  NorFlashPrintInfo (FlashInfo);
++
++  Instance->Flags = 0;
++  if (FlashInfo->Flags & NOR_FLASH_WRITE_FSR) {
++    Instance->Flags = NOR_FLASH_POLL_FSR;
++  }
++
++  Instance->ShadowBuffer = AllocateRuntimePool (BlockSize);
++  if (Instance->ShadowBuffer == NULL) {
++    Status = EFI_OUT_OF_RESOURCES;
++    goto FreeInstance;
++  }
++
++  if (HasVarStore) {
++    Instance->Initialize = NorFlashFvbInitialize;
++  }
++
++  *NorFlashInstance = Instance;
++  FreePool (FlashInfo);
++  return EFI_SUCCESS;
++
++FreeInstance:
++  FreePool (Instance);
++  return Status;
++}
++
++/**
++  Check whether NOR flash opertions are Locked.
++
++  @param[in]     Instance         NOR flash Instance.
++  @param[in]     BlockAddress     BlockAddress in NOR flash device.
++
++  @retval        FALSE            If NOR flash is not locked.
++**/
++STATIC
++BOOLEAN
++NorFlashBlockIsLocked (
++  IN NOR_FLASH_INSTANCE     *Instance,
++  IN UINTN                  BlockAddress
++  )
++{
++  return FALSE;
++}
++
++/**
++  Unlock NOR flash operations on given block.
++
++  @param[in]      Instance         NOR flash instance.
++  @param[in]      BlockAddress     BlockAddress in NOR flash device.
++
++  @retval         EFI_SUCCESS      NOR flash operations is unlocked.
++**/
++STATIC
++EFI_STATUS
++NorFlashUnlockSingleBlock (
++  IN NOR_FLASH_INSTANCE     *Instance,
++  IN UINTN                  BlockAddress
++  )
++{
++  return EFI_SUCCESS;
++}
++
++/**
++  Unlock NOR flash operations if it is necessary.
++
++  @param[in]      Instance         NOR flash instance.
++  @param[in]      BlockAddress     BlockAddress in NOR flash device.
++
++  @retval         EFI_SUCCESS      Request is executed successfully.
++**/
++STATIC
++EFI_STATUS
++NorFlashUnlockSingleBlockIfNecessary (
++  IN NOR_FLASH_INSTANCE     *Instance,
++  IN UINTN                  BlockAddress
++  )
++{
++  EFI_STATUS Status;
++
++  Status = EFI_SUCCESS;
++
++  if (!NorFlashBlockIsLocked (Instance, BlockAddress)) {
++    Status = NorFlashUnlockSingleBlock (Instance, BlockAddress);
++  }
++
++  return Status;
++}
++
++/**
++  Enable write to NOR flash device.
++
++  @param[in]      Instance         NOR flash instance.
++
++  @retval         EFI_SUCCESS      Request is executed successfully.
++**/
++STATIC
++EFI_STATUS
++NorFlashEnableWrite (
++  IN  NOR_FLASH_INSTANCE    *Instance
++  )
++{
++
++  UINT32          val;
++
++  DEBUG ((DEBUG_INFO, "NorFlashEnableWrite()\n"));
++  val = (SPINOR_OP_WREN << CDNS_QSPI_FLASH_CMD_CTRL_REG_OPCODE_BIT_POS);
++  if (EFI_ERROR (CdnsQspiExecuteCommand (Instance, val))) {
++    return EFI_DEVICE_ERROR;
++  }
++
++  return EFI_SUCCESS;
++}
++
++/**
++  The following function presumes that the block has already been unlocked.
++
++  @param[in]      Instance         NOR flash instance.
++  @param[in]      BlockAddress     Block address within the variable region.
++
++  @retval         EFI_SUCCESS      Request is executed successfully.
++ **/
++EFI_STATUS
++NorFlashEraseSingleBlock (
++  IN NOR_FLASH_INSTANCE     *Instance,
++  IN UINTN                  BlockAddress
++  )
++{
++
++  UINT32 DevConfigVal;
++  UINT32 EraseOffset;
++
++  EraseOffset = 0x0;
++
++  DEBUG ((DEBUG_INFO, "NorFlashEraseSingleBlock(BlockAddress=0x%08x)\n",
++    BlockAddress));
++
++  if (EFI_ERROR (NorFlashEnableWrite (Instance))) {
++    return EFI_DEVICE_ERROR;
++  }
++
++  EraseOffset = BlockAddress - Instance->DeviceBaseAddress;
++
++  MmioWrite32 (Instance->HostRegisterBaseAddress + CDNS_QSPI_FLASH_CMD_ADDR_REG_OFFSET,
++                EraseOffset);
++
++  DevConfigVal = SPINOR_OP_BE_4K << CDNS_QSPI_FLASH_CMD_CTRL_REG_OPCODE_BIT_POS |
++                 CDNS_QSPI_FLASH_CMD_CTRL_REG_ADDR_ENABLE << CDNS_QSPI_FLASH_CMD_CTRL_REG_ADDR_BIT_POS |
++                 CDNS_QSPI_FLASH_CMD_CTRL_REG_ADDR_BYTE_3B << CDNS_QSPI_FLASH_CMD_CTRL_REG_ADDR_BYTE_BIT_POS;
++
++  if (EFI_ERROR (CdnsQspiExecuteCommand (Instance, DevConfigVal))) {
++    return EFI_DEVICE_ERROR;
++  }
++
++  return EFI_SUCCESS;
++}
++
++/**
++  This function unlock and erase an entire NOR Flash block.
++
++  @param[in]     Instance       NOR flash Instance of variable store region.
++  @param[in]     BlockAddress   Block address within the variable store region.
++
++  @retval        EFI_SUCCESS    The erase and unlock successfully completed.
++**/
++EFI_STATUS
++NorFlashUnlockAndEraseSingleBlock (
++  IN NOR_FLASH_INSTANCE     *Instance,
++  IN UINTN                  BlockAddress
++  )
++{
++  EFI_STATUS              Status;
++  UINTN                   Index;
++  NOR_FLASH_LOCK_CONTEXT  Lock;
++  NorFlashLock (&Lock);
++
++  Index = 0;
++  do {
++    // Unlock the block if we have to
++    Status = NorFlashUnlockSingleBlockIfNecessary (Instance, BlockAddress);
++    if (EFI_ERROR (Status)) {
++      break;
++    }
++    Status = NorFlashEraseSingleBlock (Instance, BlockAddress);
++    if (EFI_ERROR (Status)) {
++      break;
++    }
++    Index++;
++  } while ((Index < NOR_FLASH_ERASE_RETRY) && (Status == EFI_WRITE_PROTECTED));
++
++  if (Index == NOR_FLASH_ERASE_RETRY) {
++    DEBUG ((DEBUG_ERROR,
++      "EraseSingleBlock(BlockAddress=0x%08x: Block Locked Error (try to erase %d times)\n",
++      BlockAddress,Index));
++  }
++
++  NorFlashUnlock (&Lock);
++
++  return Status;
++}
++
++/**
++  Write a single word to given location.
++
++  @param[in]    Instance     NOR flash Instance of variable store region.
++  @param[in]    WordAddress  The address in NOR flash to write given word.
++  @param[in]    WriteData    The data to write into NOR flash location.
++
++  @retval       EFI_SUCCESS  The write is completed.
++**/
++STATIC
++EFI_STATUS
++NorFlashWriteSingleWord (
++  IN NOR_FLASH_INSTANCE     *Instance,
++  IN UINTN                  WordAddress,
++  IN UINT32                 WriteData
++  )
++{
++  DEBUG ((DEBUG_INFO,
++    "NorFlashWriteSingleWord(WordAddress=0x%08x, WriteData=0x%08x)\n",
++    WordAddress, WriteData));
++
++  if (EFI_ERROR (NorFlashEnableWrite (Instance))) {
++    return EFI_DEVICE_ERROR;
++  }
++  MmioWrite32 (WordAddress, WriteData);
++  return EFI_SUCCESS;
++}
++
++/**
++  Write a full block to given location.
++
++  @param[in]    Instance           NOR flash Instance of variable store region.
++  @param[in]    Lba                The logical block address in NOR flash.
++  @param[in]    DataBuffer         The data to write into NOR flash location.
++  @param[in]    BlockSizeInWords   The number of bytes to write.
++
++  @retval       EFI_SUCCESS        The write is completed.
++**/
++STATIC
++EFI_STATUS
++NorFlashWriteFullBlock (
++  IN NOR_FLASH_INSTANCE     *Instance,
++  IN EFI_LBA                Lba,
++  IN UINT32                 *DataBuffer,
++  IN UINT32                 BlockSizeInWords
++  )
++{
++  EFI_STATUS              Status;
++  UINTN                   WordAddress;
++  UINT32                  WordIndex;
++  UINTN                   BlockAddress;
++  NOR_FLASH_LOCK_CONTEXT  Lock;
++
++  Status = EFI_SUCCESS;
++
++  // Get the physical address of the block
++  BlockAddress = GET_NOR_BLOCK_ADDRESS (Instance->RegionBaseAddress, Lba,
++                   BlockSizeInWords * 4);
++
++  // Start writing from the first address at the start of the block
++  WordAddress = BlockAddress;
++
++  NorFlashLock (&Lock);
++
++  Status = NorFlashUnlockAndEraseSingleBlock (Instance, BlockAddress);
++  if (EFI_ERROR (Status)) {
++    DEBUG ((DEBUG_ERROR,
++      "WriteSingleBlock: ERROR - Failed to Unlock and Erase the single block at 0x%X\n",
++      BlockAddress));
++    goto EXIT;
++  }
++
++  for (WordIndex=0;
++       WordIndex < BlockSizeInWords;
++       WordIndex++, DataBuffer++, WordAddress += 4) {
++    Status = NorFlashWriteSingleWord (Instance, WordAddress, *DataBuffer);
++    if (EFI_ERROR (Status)) {
++      goto EXIT;
++    }
++  }
++
++EXIT:
++  NorFlashUnlock (&Lock);
++
++  if (EFI_ERROR (Status)) {
++    DEBUG ((DEBUG_ERROR,
++      "NOR FLASH Programming [WriteSingleBlock] failed at address 0x%08x. Exit Status = %r.\n",
++      WordAddress, Status));
++  }
++  return Status;
++}
++
++/**
++  Write a full  block.
++
++  @param[in]    Instance           NOR flash Instance of variable store region.
++  @param[in]    Lba                The starting logical block index.
++  @param[in]    BufferSizeInBytes  The number of bytes to read.
++  @param[in]    Buffer             The pointer to a caller-allocated buffer that
++                                   contains the source for the write.
++
++  @retval       EFI_SUCCESS        The write is completed.
++**/
++EFI_STATUS
++NorFlashWriteBlocks (
++  IN NOR_FLASH_INSTANCE     *Instance,
++  IN EFI_LBA                Lba,
++  IN UINTN                  BufferSizeInBytes,
++  IN VOID                   *Buffer
++  )
++{
++  UINT32          *pWriteBuffer;
++  EFI_STATUS      Status;
++  EFI_LBA         CurrentBlock;
++  UINT32          BlockSizeInWords;
++  UINT32          NumBlocks;
++  UINT32          BlockCount;
++
++  Status = EFI_SUCCESS;
++  // The buffer must be valid
++  if (Buffer == NULL) {
++    return EFI_INVALID_PARAMETER;
++  }
++
++  // We must have some bytes to read
++  DEBUG ((DEBUG_INFO, "NorFlashWriteBlocks: BufferSizeInBytes=0x%x\n",
++    BufferSizeInBytes));
++  if (BufferSizeInBytes == 0) {
++    return EFI_BAD_BUFFER_SIZE;
++  }
++
++  // The size of the buffer must be a multiple of the block size
++  DEBUG ((DEBUG_INFO, "NorFlashWriteBlocks: BlockSize in bytes =0x%x\n",
++    Instance->BlockSize));
++  if ((BufferSizeInBytes % Instance->BlockSize) != 0) {
++    return EFI_BAD_BUFFER_SIZE;
++  }
++
++  // All blocks must be within the device
++  NumBlocks = ((UINT32)BufferSizeInBytes) / Instance->BlockSize;
++
++  DEBUG ((DEBUG_INFO,
++    "NorFlashWriteBlocks: NumBlocks=%d, LastBlock=%ld, Lba=%ld.\n", NumBlocks,
++    Instance->LastBlock, Lba));
++
++  if ((Lba + NumBlocks) > (Instance->LastBlock + 1)) {
++    DEBUG ((DEBUG_ERROR,
++      "NorFlashWriteBlocks: ERROR - Write will exceed last block.\n"));
++    return EFI_INVALID_PARAMETER;
++  }
++
++  ASSERT (((UINTN)Buffer % sizeof (UINT32)) == 0);
++
++  BlockSizeInWords = Instance->BlockSize / 4;
++
++  // Because the target *Buffer is a pointer to VOID, we must put
++  // all the data into a pointer to a proper data type, so use *ReadBuffer
++  pWriteBuffer = (UINT32 *)Buffer;
++
++  CurrentBlock = Lba;
++  for (BlockCount = 0;
++       BlockCount < NumBlocks;
++       BlockCount++, CurrentBlock++, pWriteBuffer += BlockSizeInWords) {
++
++    DEBUG ((DEBUG_INFO, "NorFlashWriteBlocks: Writing block #%d\n",
++      (UINTN)CurrentBlock));
++
++    Status = NorFlashWriteFullBlock (
++               Instance,
++               CurrentBlock,
++               pWriteBuffer,
++               BlockSizeInWords
++               );
++
++    if (EFI_ERROR (Status)) {
++      break;
++    }
++  }
++
++  DEBUG ((DEBUG_INFO, "NorFlashWriteBlocks: Exit Status = %r.\n", Status));
++  return Status;
++}
++
++/**
++  Read a full  block.
++
++  @param[in]     Instance           NOR flash Instance of variable store region.
++  @param[in]     Lba                The starting logical block index to read from.
++  @param[in]     BufferSizeInBytes  The number of bytes to read.
++  @param[out]    Buffer             The pointer to a caller-allocated buffer that
++                                    should be copied with read data.
++
++  @retval        EFI_SUCCESS        The read is completed.
++**/
++EFI_STATUS
++NorFlashReadBlocks (
++  IN NOR_FLASH_INSTANCE   *Instance,
++  IN EFI_LBA              Lba,
++  IN UINTN                BufferSizeInBytes,
++  OUT VOID                *Buffer
++  )
++{
++  UINT32              NumBlocks;
++  UINTN               StartAddress;
++  DEBUG ((DEBUG_INFO,
++    "NorFlashReadBlocks: BufferSize=0x%xB BlockSize=0x%xB LastBlock=%ld, Lba=%ld.\n",
++    BufferSizeInBytes, Instance->BlockSize, Instance->LastBlock,
++    Lba));
++
++  // The buffer must be valid
++  if (Buffer == NULL) {
++    return EFI_INVALID_PARAMETER;
++  }
++
++  // Return if we do not have any byte to read
++  if (BufferSizeInBytes == 0) {
++    return EFI_SUCCESS;
++  }
++
++  // The size of the buffer must be a multiple of the block size
++  if ((BufferSizeInBytes % Instance->BlockSize) != 0) {
++    return EFI_BAD_BUFFER_SIZE;
++  }
++
++  NumBlocks = ((UINT32)BufferSizeInBytes) / Instance->BlockSize;
++
++  if ((Lba + NumBlocks) > (Instance->LastBlock + 1)) {
++    DEBUG ((DEBUG_ERROR,
++      "NorFlashReadBlocks: ERROR - Read will exceed last block\n"));
++    return EFI_INVALID_PARAMETER;
++  }
++
++  // Get the address to start reading from
++  StartAddress = GET_NOR_BLOCK_ADDRESS (Instance->RegionBaseAddress, Lba,
++                                        Instance->BlockSize);
++
++  // Readout the data
++  CopyMem(Buffer, (UINTN *)StartAddress, BufferSizeInBytes);
++
++  return EFI_SUCCESS;
++}
++
++/**
++  Read from nor flash.
++
++  @param[in]     Instance           NOR flash Instance of variable store region.
++  @param[in]     Lba                The starting logical block index to read from.
++  @param[in]     Offset             Offset into the block at which to begin reading.
++  @param[in]     BufferSizeInBytes  The number of bytes to read.
++  @param[out]    Buffer             The pointer to a caller-allocated buffer that
++                                    should copied with read data.
++
++  @retval        EFI_SUCCESS        The read is completed.
++**/
++EFI_STATUS
++NorFlashRead (
++  IN NOR_FLASH_INSTANCE   *Instance,
++  IN EFI_LBA              Lba,
++  IN UINTN                Offset,
++  IN UINTN                BufferSizeInBytes,
++  OUT VOID                *Buffer
++  )
++{
++  UINTN  StartAddress;
++  // The buffer must be valid
++  if (Buffer == NULL) {
++    return EFI_INVALID_PARAMETER;
++  }
++
++  // Return if we do not have any byte to read
++  if (BufferSizeInBytes == 0) {
++    return EFI_SUCCESS;
++  }
++
++  if (((Lba * Instance->BlockSize) + Offset + BufferSizeInBytes) >
++      Instance->Size) {
++    DEBUG ((DEBUG_ERROR,
++      "NorFlashRead: ERROR - Read will exceed device size.\n"));
++    return EFI_INVALID_PARAMETER;
++  }
++
++  // Get the address to start reading from
++  StartAddress = GET_NOR_BLOCK_ADDRESS (Instance->RegionBaseAddress, Lba,
++                                        Instance->BlockSize);
++
++  // Readout the data
++  CopyMem (Buffer, (UINTN *)(StartAddress + Offset), BufferSizeInBytes);
++
++  return EFI_SUCCESS;
++}
++
++/**
++  Write a full or portion of a block.
++
++  @param[in]         Instance     NOR flash Instance of variable store region.
++  @param[in]         Lba          The starting logical block index to write to.
++  @param[in]         Offset       Offset into the block at which to begin writing.
++  @param[in, out]    NumBytes     The total size of the buffer.
++  @param[in]         Buffer       The pointer to a caller-allocated buffer that
++                                  contains the source for the write.
++
++  @retval            EFI_SUCCESS  The write is completed.
++**/
++EFI_STATUS
++NorFlashWriteSingleBlock (
++  IN        NOR_FLASH_INSTANCE   *Instance,
++  IN        EFI_LBA               Lba,
++  IN        UINTN                 Offset,
++  IN OUT    UINTN                *NumBytes,
++  IN        UINT8                *Buffer
++  )
++{
++  EFI_STATUS  Status;
++  UINT32      Tmp;
++  UINT32      TmpBuf;
++  UINT32      WordToWrite;
++  UINT32      Mask;
++  BOOLEAN     DoErase;
++  UINTN       BytesToWrite;
++  UINTN       CurOffset;
++  UINTN       WordAddr;
++  UINTN       BlockSize;
++  UINTN       BlockAddress;
++  UINTN       PrevBlockAddress;
++
++  if (Buffer == NULL) {
++    DEBUG ((DEBUG_ERROR,
++      "NorFlashWriteSingleBlock: ERROR - Buffer is invalid\n" ));
++    return EFI_OUT_OF_RESOURCES;
++  }
++
++  PrevBlockAddress = 0;
++  if (!Instance->Initialized && Instance->Initialize) {
++    Instance->Initialize(Instance);
++  }
++
++  DEBUG ((DEBUG_INFO,
++    "NorFlashWriteSingleBlock(Parameters: Lba=%ld, Offset=0x%x, *NumBytes=0x%x, Buffer @ 0x%08x)\n",
++    Lba, Offset, *NumBytes, Buffer));
++
++  // Localise the block size to avoid de-referencing pointers all the time
++  BlockSize = Instance->BlockSize;
++
++  // The write must not span block boundaries.
++  // We need to check each variable individually because adding two large
++  // values together overflows.
++  if (Offset               >= BlockSize ||
++      *NumBytes            >  BlockSize ||
++      (Offset + *NumBytes) >  BlockSize) {
++    DEBUG ((DEBUG_ERROR,
++      "NorFlashWriteSingleBlock: ERROR - EFI_BAD_BUFFER_SIZE: (Offset=0x%x + NumBytes=0x%x) > BlockSize=0x%x\n",
++      Offset, *NumBytes, BlockSize ));
++    return EFI_BAD_BUFFER_SIZE;
++  }
++
++  // We must have some bytes to write
++  if (*NumBytes == 0) {
++    DEBUG ((DEBUG_ERROR,
++      "NorFlashWriteSingleBlock: ERROR - EFI_BAD_BUFFER_SIZE: (Offset=0x%x + NumBytes=0x%x) > BlockSize=0x%x\n",
++      Offset, *NumBytes, BlockSize ));
++    return EFI_BAD_BUFFER_SIZE;
++  }
++
++  // Pick 128bytes as a good start for word operations as opposed to erasing the
++  // block and writing the data regardless if an erase is really needed.
++  // It looks like most individual NV variable writes are smaller than 128bytes.
++  if (*NumBytes <= 128) {
++    // Check to see if we need to erase before programming the data into NOR.
++    // If the destination bits are only changing from 1s to 0s we can just write.
++    // After a block is erased all bits in the block is set to 1.
++    // If any byte requires us to erase we just give up and rewrite all of it.
++    DoErase      = FALSE;
++    BytesToWrite = *NumBytes;
++    CurOffset    = Offset;
++
++    while (BytesToWrite > 0) {
++      // Read full word from NOR, splice as required. A word is the smallest
++      // unit we can write.
++      Status = NorFlashRead (
++                 Instance,
++                 Lba,
++                 CurOffset & ~(0x3),
++                 sizeof(Tmp),
++                 &Tmp
++                 );
++      if (EFI_ERROR (Status)) {
++        return EFI_DEVICE_ERROR;
++      }
++
++      // Physical address of word in NOR to write.
++      WordAddr = (CurOffset & ~(0x3)) +
++                 GET_NOR_BLOCK_ADDRESS (Instance->RegionBaseAddress, Lba,
++                   BlockSize);
++
++      // The word of data that is to be written.
++      TmpBuf = ReadUnaligned32 ((UINT32 *)(Buffer + (*NumBytes - BytesToWrite)));
++
++      // First do word aligned chunks.
++      if ((CurOffset & 0x3) == 0) {
++        if (BytesToWrite >= 4) {
++          // Is the destination still in 'erased' state?
++          if (~Tmp != 0) {
++            // Check to see if we are only changing bits to zero.
++            if ((Tmp ^ TmpBuf) & TmpBuf) {
++              DoErase = TRUE;
++              break;
++            }
++          }
++          // Write this word to NOR
++          WordToWrite = TmpBuf;
++          CurOffset += sizeof(TmpBuf);
++          BytesToWrite -= sizeof(TmpBuf);
++        } else {
++          // BytesToWrite < 4. Do small writes and left-overs
++          Mask = ~((~0) << (BytesToWrite * 8));
++          // Mask out the bytes we want.
++          TmpBuf &= Mask;
++          // Is the destination still in 'erased' state?
++          if ((Tmp & Mask) != Mask) {
++            // Check to see if we are only changing bits to zero.
++            if ((Tmp ^ TmpBuf) & TmpBuf) {
++              DoErase = TRUE;
++              break;
++            }
++          }
++          // Merge old and new data. Write merged word to NOR
++          WordToWrite = (Tmp & ~Mask) | TmpBuf;
++          CurOffset += BytesToWrite;
++          BytesToWrite = 0;
++        }
++      } else {
++        // Do multiple words, but starting unaligned.
++        if (BytesToWrite > (4 - (CurOffset & 0x3))) {
++          Mask = ((~0) << ((CurOffset & 0x3) * 8));
++          // Mask out the bytes we want.
++          TmpBuf &= Mask;
++          // Is the destination still in 'erased' state?
++          if ((Tmp & Mask) != Mask) {
++            // Check to see if we are only changing bits to zero.
++            if ((Tmp ^ TmpBuf) & TmpBuf) {
++              DoErase = TRUE;
++              break;
++            }
++          }
++          // Merge old and new data. Write merged word to NOR
++          WordToWrite = (Tmp & ~Mask) | TmpBuf;
++          BytesToWrite -= (4 - (CurOffset & 0x3));
++          CurOffset += (4 - (CurOffset & 0x3));
++        } else {
++          // Unaligned and fits in one word.
++          Mask = (~((~0) << (BytesToWrite * 8))) << ((CurOffset & 0x3) * 8);
++          // Mask out the bytes we want.
++          TmpBuf = (TmpBuf << ((CurOffset & 0x3) * 8)) & Mask;
++          // Is the destination still in 'erased' state?
++          if ((Tmp & Mask) != Mask) {
++            // Check to see if we are only changing bits to zero.
++            if ((Tmp ^ TmpBuf) & TmpBuf) {
++              DoErase = TRUE;
++              break;
++            }
++          }
++          // Merge old and new data. Write merged word to NOR
++          WordToWrite = (Tmp & ~Mask) | TmpBuf;
++          CurOffset += BytesToWrite;
++          BytesToWrite = 0;
++        }
++      }
++
++      BlockAddress = GET_NOR_BLOCK_ADDRESS (
++                       Instance->RegionBaseAddress,
++                       Lba,
++                       BlockSize
++                       );
++      if (BlockAddress != PrevBlockAddress) {
++        Status = NorFlashUnlockSingleBlockIfNecessary (Instance, BlockAddress);
++        if (EFI_ERROR (Status)) {
++          return EFI_DEVICE_ERROR;
++        }
++        PrevBlockAddress = BlockAddress;
++      }
++      Status = NorFlashWriteSingleWord (Instance, WordAddr, WordToWrite);
++      if (EFI_ERROR (Status)) {
++        return EFI_DEVICE_ERROR;
++      }
++    }
++    // Exit if we got here and could write all the data. Otherwise do the
++    // Erase-Write cycle.
++    if (!DoErase) {
++      return EFI_SUCCESS;
++    }
++  }
++
++  // Check we did get some memory. Buffer is BlockSize.
++  if (Instance->ShadowBuffer == NULL) {
++    DEBUG ((DEBUG_ERROR, "FvbWrite: ERROR - Buffer not ready\n"));
++    return EFI_DEVICE_ERROR;
++  }
++
++  // Read NOR Flash data into shadow buffer
++  Status = NorFlashReadBlocks (
++             Instance,
++             Lba,
++             BlockSize,
++             Instance->ShadowBuffer
++             );
++  if (EFI_ERROR (Status)) {
++    // Return one of the pre-approved error statuses
++    return EFI_DEVICE_ERROR;
++  }
++
++  // Put the data at the appropriate location inside the buffer area
++  CopyMem ((VOID*)((UINTN)Instance->ShadowBuffer + Offset), Buffer, *NumBytes);
++
++  // Write the modified buffer back to the NorFlash
++  Status = NorFlashWriteBlocks (
++             Instance,
++             Lba,
++             BlockSize,
++             Instance->ShadowBuffer
++             );
++  if (EFI_ERROR (Status)) {
++    // Return one of the pre-approved error statuses
++    return EFI_DEVICE_ERROR;
++  }
++
++  return EFI_SUCCESS;
++}
++
++/**
++  Read JEDEC ID of NOR flash device.
++
++  @param[in]     Instance     NOR flash Instance of variable store region.
++  @param[out]    JedecId      JEDEC ID of NOR flash device.
++
++  @retval        EFI_SUCCESS  The write is completed.
++**/
++EFI_STATUS
++NorFlashReadID (
++  IN  NOR_FLASH_INSTANCE  *Instance,
++  OUT UINT8               JedecId[3]
++  )
++{
++  UINT32 val;
++  if (Instance == NULL || JedecId == NULL) {
++    return EFI_INVALID_PARAMETER;
++  }
++
++  val = SPINOR_OP_RDID << CDNS_QSPI_FLASH_CMD_CTRL_REG_OPCODE_BIT_POS |
++        CDNS_QSPI_FLASH_CMD_CTRL_REG_READ_ENABLE << CDNS_QSPI_FLASH_CMD_CTRL_REG_READEN_BIT_POS |
++        CDNS_QSPI_FLASH_CMD_CTRL_REG_ADDR_BYTE_3B << CDNS_QSPI_FLASH_CMD_CTRL_REG_READBYTE_BIT_POS;
++
++  if (EFI_ERROR (CdnsQspiExecuteCommand (Instance, val))) {
++    return EFI_DEVICE_ERROR;
++  }
++
++  val = MmioRead32 (Instance->HostRegisterBaseAddress + CDNS_QSPI_FLASH_CMD_READ_DATA_REG_OFFSET);
++
++  // Manu.ID field
++  JedecId[0] = (UINT8) val;
++  // Type field
++  JedecId[1] = (UINT8) (val >> 8);
++  // Capacity field
++  JedecId[2] = (UINT8) (val >> 16);
++
++  DEBUG ((DEBUG_INFO,
++    "Nor flash detected, Jedec ID, Manu.Id=%x Type=%x Capacity=%x \n",
++    JedecId[0],JedecId[1],JedecId[2]));
++
++  return EFI_SUCCESS;
++}
+diff --git a/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/NorFlash.h b/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/NorFlash.h
+new file mode 100644
+index 00000000..e720937e
+--- /dev/null
++++ b/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/NorFlash.h
+@@ -0,0 +1,484 @@
++/** @file
++
++  Copyright (c) 2023, ARM Limited. All rights reserved.<BR>
++
++  SPDX-License-Identifier: BSD-2-Clause-Patent
++
++**/
++
++#ifndef NOR_FLASH_DXE_H_
++#define NOR_FLASH_DXE_H_
++
++#include <Guid/EventGroup.h>
++#include <Library/DebugLib.h>
++#include <Library/IoLib.h>
++#include <Library/NorFlashPlatformLib.h>
++#include <PiDxe.h>
++#include <Protocol/BlockIo.h>
++#include <Protocol/DiskIo.h>
++#include <Protocol/FirmwareVolumeBlock.h>
++
++#include "CadenceQspiReg.h"
++
++#define NOR_FLASH_ERASE_RETRY                     10
++
++#define GET_NOR_BLOCK_ADDRESS(BaseAddr, Lba, LbaSize) \
++                                      ((BaseAddr) + (UINTN)((Lba) * (LbaSize)))
++
++#define NOR_FLASH_SIGNATURE          SIGNATURE_32('S', 'n', 'o', 'r')
++#define INSTANCE_FROM_FVB_THIS(a)    CR(a, NOR_FLASH_INSTANCE, FvbProtocol, \
++                                        NOR_FLASH_SIGNATURE)
++
++#define NOR_FLASH_POLL_FSR      BIT0
++
++typedef struct _NOR_FLASH_INSTANCE                NOR_FLASH_INSTANCE;
++
++typedef EFI_STATUS (*NOR_FLASH_INITIALIZE)        (NOR_FLASH_INSTANCE* Instance);
++
++#pragma pack(1)
++typedef struct {
++  VENDOR_DEVICE_PATH                  Vendor;
++  UINT8                               Index;
++  EFI_DEVICE_PATH_PROTOCOL            End;
++} NOR_FLASH_DEVICE_PATH;
++#pragma pack()
++
++struct _NOR_FLASH_INSTANCE {
++  UINT32                              Signature;
++  EFI_HANDLE                          Handle;
++
++  BOOLEAN                             Initialized;
++  NOR_FLASH_INITIALIZE                Initialize;
++
++  UINTN                               HostRegisterBaseAddress;
++  UINTN                               DeviceBaseAddress;
++  UINTN                               RegionBaseAddress;
++  UINTN                               Size;
++  UINTN                               BlockSize;
++  UINTN                               LastBlock;
++  EFI_LBA                             StartLba;
++  EFI_LBA                             OffsetLba;
++
++  EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL FvbProtocol;
++  VOID*                               ShadowBuffer;
++
++  NOR_FLASH_DEVICE_PATH               DevicePath;
++
++  UINT32                              Flags;
++};
++
++typedef struct {
++  EFI_TPL         OriginalTPL;
++  BOOLEAN         InterruptsEnabled;
++} NOR_FLASH_LOCK_CONTEXT;
++
++/**
++  Lock all pending read/write to Nor flash device
++
++  @param[in]     Context     Nor flash device context structure.
++**/
++VOID
++EFIAPI
++NorFlashLock (
++  IN NOR_FLASH_LOCK_CONTEXT    *Context
++  );
++
++/**
++  Unlock all pending read/write to Nor flash device
++
++  @param[in]     Context     Nor flash device context structure.
++**/
++VOID
++EFIAPI
++NorFlashUnlock (
++  IN NOR_FLASH_LOCK_CONTEXT    *Context
++  );
++
++extern UINTN     mFlashNvStorageVariableBase;
++
++/**
++  Create Nor flash Instance for given region.
++
++  @param[in]    HostRegisterBase      Base address of Nor flash controller.
++  @param[in]    NorFlashDeviceBase    Base address of flash device.
++  @param[in]    NorFlashRegionBase    Base address of flash region on device.
++  @param[in]    NorFlashSize          Size of flash region.
++  @param[in]    Index                 Index of given flash region.
++  @param[in]    BlockSize             Block size of NOR flash device.
++  @param[in]    HasVarStore           Boolean set for VarStore on given region.
++  @param[out]   NorFlashInstance      Instance of given flash region.
++
++  @retval       EFI_SUCCESS           On successful creation of NOR flash instance.
++**/
++EFI_STATUS
++NorFlashCreateInstance (
++  IN UINTN                  HostRegisterBase,
++  IN UINTN                  NorFlashDeviceBase,
++  IN UINTN                  NorFlashRegionBase,
++  IN UINTN                  NorFlashSize,
++  IN UINT32                 Index,
++  IN UINT32                 BlockSize,
++  IN BOOLEAN                HasVarStore,
++  OUT NOR_FLASH_INSTANCE**  NorFlashInstance
++  );
++
++/**
++  Install Fv block on to variable store region
++
++  @param[in]   Instance         Instance of Nor flash variable region.
++
++  @retval      EFI_SUCCESS      The entry point is executed successfully.
++**/
++EFI_STATUS
++EFIAPI
++NorFlashFvbInitialize (
++  IN NOR_FLASH_INSTANCE* Instance
++  );
++
++/**
++  Check the integrity of firmware volume header.
++
++  @param[in]  Instance        Instance of Nor flash variable region.
++
++  @retval     EFI_SUCCESS     The firmware volume is consistent.
++  @retval     EFI_NOT_FOUND   The firmware volume has been corrupted.
++
++**/
++EFI_STATUS
++ValidateFvHeader (
++  IN  NOR_FLASH_INSTANCE *Instance
++  );
++
++/**
++  Initialize the FV Header and Variable Store Header
++  to support variable operations.
++
++  @param[in]  Instance      Location to Initialize the headers
++
++  @retval     EFI_SUCCESS   Fv init is done
++
++**/
++EFI_STATUS
++InitializeFvAndVariableStoreHeaders (
++  IN NOR_FLASH_INSTANCE *Instance
++  );
++
++/**
++ Retrieves the attributes and current settings of the block.
++
++ @param[in]   This         Indicates the EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL instance.
++
++ @param[out]  Attributes   Pointer to EFI_FVB_ATTRIBUTES_2 in which the attributes and
++                           current settings are returned.
++                           Type EFI_FVB_ATTRIBUTES_2 is defined in
++                           EFI_FIRMWARE_VOLUME_HEADER.
++
++ @retval      EFI_SUCCESS  The firmware volume attributes were returned.
++
++**/
++EFI_STATUS
++EFIAPI
++FvbGetAttributes(
++  IN CONST  EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL     *This,
++  OUT       EFI_FVB_ATTRIBUTES_2                    *Attributes
++  );
++
++/**
++ Sets configurable firmware volume attributes and returns the
++ new settings of the firmware volume.
++
++
++ @param[in]         This                     EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL instance.
++
++ @param[in, out]    Attributes               On input, Attributes is a pointer to
++                                             EFI_FVB_ATTRIBUTES_2 that contains the desired
++                                             firmware volume settings.
++                                             On successful return, it contains the new
++                                             settings of the firmware volume.
++
++ @retval            EFI_UNSUPPORTED          The firmware volume attributes are not supported.
++
++**/
++EFI_STATUS
++EFIAPI
++FvbSetAttributes(
++  IN CONST  EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL     *This,
++  IN OUT    EFI_FVB_ATTRIBUTES_2                    *Attributes
++  );
++
++/**
++ Retrieves the base address of a memory-mapped firmware volume.
++ This function should be called only for memory-mapped firmware volumes.
++
++ @param[in]     This               EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL instance.
++
++ @param[out]    Address            Pointer to a caller-allocated
++                                   EFI_PHYSICAL_ADDRESS that, on successful
++                                   return from GetPhysicalAddress(), contains the
++                                   base address of the firmware volume.
++
++ @retval        EFI_SUCCESS        The firmware volume base address was returned.
++
++**/
++EFI_STATUS
++EFIAPI
++FvbGetPhysicalAddress(
++  IN CONST  EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL     *This,
++  OUT       EFI_PHYSICAL_ADDRESS                    *Address
++  );
++
++/**
++ Retrieves the size of the requested block.
++ It also returns the number of additional blocks with the identical size.
++ The GetBlockSize() function is used to retrieve the block map
++ (see EFI_FIRMWARE_VOLUME_HEADER).
++
++
++ @param[in]     This                     EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL instance.
++
++ @param[in]     Lba                      Indicates the block whose size to return
++
++ @param[out]    BlockSize                Pointer to a caller-allocated UINTN in which
++                                         the size of the block is returned.
++
++ @param[out]    NumberOfBlocks           Pointer to a caller-allocated UINTN in
++                                         which the number of consecutive blocks,
++                                         starting with Lba, is returned. All
++                                         blocks in this range have a size of
++                                         BlockSize.
++
++ @retval        EFI_SUCCESS              The firmware volume base address was returned.
++
++ @retval        EFI_INVALID_PARAMETER    The requested LBA is out of range.
++
++**/
++EFI_STATUS
++EFIAPI
++FvbGetBlockSize(
++  IN CONST  EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL     *This,
++  IN        EFI_LBA                                 Lba,
++  OUT       UINTN                                   *BlockSize,
++  OUT       UINTN                                   *NumberOfBlocks
++  );
++
++/**
++ Reads the specified number of bytes into a buffer from the specified block.
++
++ The Read() function reads the requested number of bytes from the
++ requested block and stores them in the provided buffer.
++
++ @param[in]       This                 EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL instance.
++
++ @param[in]       Lba                  The starting logical block index from which to read
++
++ @param[in]       Offset               Offset into the block at which to begin reading.
++
++ @param[in, out]  NumBytes             Pointer to a UINTN.
++                                       At entry, *NumBytes contains the total size of the
++                                       buffer. *NumBytes should have a non zero value.
++                                       At exit, *NumBytes contains the total number of
++                                       bytes read.
++
++ @param[in out]   Buffer               Pointer to a caller-allocated buffer that will be
++                                       used to hold the data that is read.
++
++ @retval          EFI_SUCCESS          The firmware volume was read successfully, and
++                                       contents are in Buffer.
++
++ @retval          EFI_BAD_BUFFER_SIZE  Read attempted across an LBA boundary.
++
++ @retval          EFI_DEVICE_ERROR     The block device is not functioning correctly and
++                                       could not be read.
++
++**/
++EFI_STATUS
++EFIAPI
++FvbRead(
++  IN CONST  EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL     *This,
++  IN        EFI_LBA                                 Lba,
++  IN        UINTN                                   Offset,
++  IN OUT    UINTN                                   *NumBytes,
++  IN OUT    UINT8                                   *Buffer
++  );
++
++/**
++ Writes the specified number of bytes from the input buffer to the block.
++
++ @param[in]        This                 EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL instance.
++
++ @param[in]        Lba                  The starting logical block index to write to.
++
++ @param[in]        Offset               Offset into the block at which to begin writing.
++
++ @param[in, out]   NumBytes             The pointer to a UINTN.
++                                        At entry, *NumBytes contains the total size of the
++                                        buffer.
++                                        At exit, *NumBytes contains the total number of
++                                        bytes actually written.
++
++ @param[in]        Buffer               The pointer to a caller-allocated buffer that
++                                        contains the source for the write.
++
++ @retval           EFI_SUCCESS          The firmware volume was written successfully.
++
++**/
++EFI_STATUS
++EFIAPI
++FvbWrite(
++  IN CONST  EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL     *This,
++  IN        EFI_LBA                                 Lba,
++  IN        UINTN                                   Offset,
++  IN OUT    UINTN                                   *NumBytes,
++  IN        UINT8                                   *Buffer
++  );
++
++/**
++ Erases and initialises a firmware volume block.
++
++ @param[in]   This                     EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL
++
++ @param[in]   ...                      The variable argument list is a list of tuples.
++                                       Each tuple describes a range of LBAs to erase
++                                       and consists of the following:
++                                       - An EFI_LBA that indicates the starting LBA
++                                       - A UINTN that indicates the number of blocks
++                                       to erase.
++
++                                       The list is terminated with an
++                                       EFI_LBA_LIST_TERMINATOR.
++
++ @retval      EFI_SUCCESS              The erase request successfully completed.
++
++ @retval      EFI_ACCESS_DENIED        The firmware volume is in the WriteDisabled
++                                       state.
++
++ @retval      EFI_DEVICE_ERROR         The block device is not functioning correctly
++                                       and could not be written.
++                                       The firmware device may have been partially
++                                       erased.
++
++ @retval      EFI_INVALID_PARAMETER    One or more of the LBAs listed in the variable
++                                       argument list do not exist in the firmware
++                                       volume.
++
++**/
++EFI_STATUS
++EFIAPI
++FvbEraseBlocks(
++  IN CONST  EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL     *This,
++  ...
++  );
++
++/**
++  This function unlock and erase an entire NOR Flash block.
++
++  @param[in]     Instance       NOR flash Instance of variable store region.
++  @param[in]     BlockAddress   Block address within the variable store region.
++
++  @retval        EFI_SUCCESS    The erase and unlock successfully completed.
++**/
++EFI_STATUS
++NorFlashUnlockAndEraseSingleBlock (
++  IN NOR_FLASH_INSTANCE     *Instance,
++  IN UINTN                  BlockAddress
++  );
++
++/**
++  Write a full or portion of a block.
++
++  @param[in]        Instance     NOR flash Instance of variable store region.
++  @param[in]        Lba          The starting logical block index to write to.
++  @param[in]        Offset       Offset into the block at which to begin writing.
++  @param[in,out]    NumBytes     The total size of the buffer.
++  @param[in]        Buffer       The pointer to a caller-allocated buffer that
++                                 contains the source for the write.
++
++  @retval           EFI_SUCCESS  The write is completed.
++**/
++EFI_STATUS
++NorFlashWriteSingleBlock (
++  IN        NOR_FLASH_INSTANCE   *Instance,
++  IN        EFI_LBA               Lba,
++  IN        UINTN                 Offset,
++  IN OUT    UINTN                *NumBytes,
++  IN        UINT8                *Buffer
++  );
++
++/**
++  Write a full  block.
++
++  @param[in]    Instance             NOR flash Instance of variable store region.
++  @param[in]    Lba                  The starting logical block index to write to.
++  @param[in]    BufferSizeInBytes    The number of bytes to write.
++  @param[in]    Buffer               The pointer to a caller-allocated buffer that
++                                     contains the source for the write.
++
++  @retval       EFI_SUCCESS          The write is completed.
++**/
++EFI_STATUS
++NorFlashWriteBlocks (
++  IN  NOR_FLASH_INSTANCE *Instance,
++  IN  EFI_LBA            Lba,
++  IN  UINTN              BufferSizeInBytes,
++  IN  VOID               *Buffer
++  );
++
++/**
++  Read a full  block.
++
++  @param[in]     Instance           NOR flash Instance of variable store region.
++  @param[in]     Lba                The starting logical block index to read from.
++  @param[in]     BufferSizeInBytes  The number of bytes to read.
++  @param[out]    Buffer             The pointer to a caller-allocated buffer that
++                                    should be copied with read data.
++
++  @retval        EFI_SUCCESS        The read is completed.
++**/
++EFI_STATUS
++NorFlashReadBlocks (
++  IN NOR_FLASH_INSTANCE   *Instance,
++  IN EFI_LBA              Lba,
++  IN UINTN                BufferSizeInBytes,
++  OUT VOID                *Buffer
++  );
++
++/**
++  Read from nor flash.
++
++  @param[in]     Instance           NOR flash Instance of variable store region.
++  @param[in]     Lba                The starting logical block index to read from.
++  @param[in]     Offset             Offset into the block at which to begin reading.
++  @param[in]     BufferSizeInBytes  The number of bytes to read.
++  @param[out]    Buffer             The pointer to a caller-allocated buffer that
++                                    should copied with read data.
++
++  @retval        EFI_SUCCESS        The read is completed.
++**/
++EFI_STATUS
++NorFlashRead (
++  IN NOR_FLASH_INSTANCE   *Instance,
++  IN EFI_LBA              Lba,
++  IN UINTN                Offset,
++  IN UINTN                BufferSizeInBytes,
++  OUT VOID                *Buffer
++  );
++
++/**
++  Read JEDEC ID of NOR flash device.
++
++  @param[in]     Instance     NOR flash Instance of variable store region.
++  @param[out]    JedecId      JEDEC ID of NOR flash device.
++
++  @retval        EFI_SUCCESS  The write is completed.
++**/
++EFI_STATUS
++NorFlashReadID (
++  IN  NOR_FLASH_INSTANCE  *Instance,
++  OUT UINT8               JedecId[3]
++  );
++
++#define SPINOR_OP_WREN                0x06  // Write enable
++#define SPINOR_OP_BE_4K               0x20  // Erase 4KiB block
++#define SPINOR_OP_RDID                0x9f  // Read JEDEC ID
++
++#endif /* NOR_FLASH_DXE_H_ */
+diff --git a/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/NorFlashFvb.c b/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/NorFlashFvb.c
+new file mode 100644
+index 00000000..edd84c07
+--- /dev/null
++++ b/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/NorFlashFvb.c
+@@ -0,0 +1,573 @@
++/** @file
++
++  Copyright (c) 2023, ARM Limited. All rights reserved.<BR>
++
++  SPDX-License-Identifier: BSD-2-Clause-Patent
++
++**/
++
++#include <Guid/VariableFormat.h>
++#include <Guid/SystemNvDataGuid.h>
++
++#include <Library/BaseLib.h>
++#include <Library/BaseMemoryLib.h>
++#include <Library/MemoryAllocationLib.h>
++#include <Library/PcdLib.h>
++#include <Library/UefiBootServicesTableLib.h>
++#include <Library/UefiLib.h>
++
++#include <PiDxe.h>
++
++#include "NorFlash.h"
++
++UINTN     mFlashNvStorageVariableBase;
++
++/**
++  Initialize the FV Header and Variable Store Header
++  to support variable operations.
++
++  @param[in]  Instance      Location to initialise the headers.
++
++  @retval     EFI_SUCCESS   Fv init is done.
++
++**/
++EFI_STATUS
++InitializeFvAndVariableStoreHeaders (
++  IN NOR_FLASH_INSTANCE *Instance
++  )
++{
++  EFI_STATUS                          Status;
++  VOID*                               Headers;
++  UINTN                               HeadersLength;
++  EFI_FIRMWARE_VOLUME_HEADER          *FirmwareVolumeHeader;
++  VARIABLE_STORE_HEADER               *VariableStoreHeader;
++
++  if (!Instance->Initialized && Instance->Initialize) {
++    Instance->Initialize (Instance);
++  }
++
++  HeadersLength = sizeof (EFI_FIRMWARE_VOLUME_HEADER) +
++                  sizeof (EFI_FV_BLOCK_MAP_ENTRY) +
++                  sizeof (VARIABLE_STORE_HEADER);
++  Headers = AllocateZeroPool (HeadersLength);
++
++  FirmwareVolumeHeader = (EFI_FIRMWARE_VOLUME_HEADER*)Headers;
++  CopyGuid (&FirmwareVolumeHeader->FileSystemGuid, &gEfiSystemNvDataFvGuid);
++  FirmwareVolumeHeader->FvLength =
++      PcdGet32 (PcdFlashNvStorageVariableSize) +
++      PcdGet32 (PcdFlashNvStorageFtwWorkingSize) +
++      PcdGet32 (PcdFlashNvStorageFtwSpareSize);
++  FirmwareVolumeHeader->Signature = EFI_FVH_SIGNATURE;
++  FirmwareVolumeHeader->Attributes = EFI_FVB2_READ_ENABLED_CAP |
++                                     EFI_FVB2_READ_STATUS |
++                                     EFI_FVB2_STICKY_WRITE |
++                                     EFI_FVB2_MEMORY_MAPPED |
++                                     EFI_FVB2_ERASE_POLARITY |
++                                     EFI_FVB2_WRITE_STATUS |
++                                     EFI_FVB2_WRITE_ENABLED_CAP;
++
++  FirmwareVolumeHeader->HeaderLength = sizeof (EFI_FIRMWARE_VOLUME_HEADER) +
++                                       sizeof (EFI_FV_BLOCK_MAP_ENTRY);
++  FirmwareVolumeHeader->Revision = EFI_FVH_REVISION;
++  FirmwareVolumeHeader->BlockMap[0].NumBlocks = Instance->LastBlock + 1;
++  FirmwareVolumeHeader->BlockMap[0].Length    = Instance->BlockSize;
++  FirmwareVolumeHeader->BlockMap[1].NumBlocks = 0;
++  FirmwareVolumeHeader->BlockMap[1].Length    = 0;
++  FirmwareVolumeHeader->Checksum = CalculateCheckSum16 (
++                                     (UINT16*)FirmwareVolumeHeader,
++                                     FirmwareVolumeHeader->HeaderLength);
++
++  VariableStoreHeader = (VOID *)((UINTN)Headers +
++                                 FirmwareVolumeHeader->HeaderLength);
++  CopyGuid (&VariableStoreHeader->Signature, &gEfiAuthenticatedVariableGuid);
++  VariableStoreHeader->Size = PcdGet32 (PcdFlashNvStorageVariableSize) -
++                              FirmwareVolumeHeader->HeaderLength;
++  VariableStoreHeader->Format = VARIABLE_STORE_FORMATTED;
++  VariableStoreHeader->State = VARIABLE_STORE_HEALTHY;
++
++  // Install the combined super-header in the NorFlash
++  Status = FvbWrite (&Instance->FvbProtocol, 0, 0, &HeadersLength, Headers);
++
++  FreePool (Headers);
++  return Status;
++}
++
++/**
++  Check the integrity of firmware volume header.
++
++  @param[in]  Instance        Instance of Nor flash variable region.
++
++  @retval     EFI_SUCCESS     The firmware volume is consistent.
++  @retval     EFI_NOT_FOUND   The firmware volume has been corrupted.
++
++**/
++EFI_STATUS
++ValidateFvHeader (
++  IN  NOR_FLASH_INSTANCE *Instance
++  )
++{
++  EFI_FIRMWARE_VOLUME_HEADER  *FwVolHeader;
++  VARIABLE_STORE_HEADER       *VariableStoreHeader;
++  UINTN                       VariableStoreLength;
++  UINTN                       FvLength;
++
++  FwVolHeader = (EFI_FIRMWARE_VOLUME_HEADER*)Instance->RegionBaseAddress;
++
++  FvLength = PcdGet32 (PcdFlashNvStorageVariableSize) +
++             PcdGet32 (PcdFlashNvStorageFtwWorkingSize) +
++             PcdGet32 (PcdFlashNvStorageFtwSpareSize);
++
++  if ((FwVolHeader->Revision  != EFI_FVH_REVISION)
++      || (FwVolHeader->Signature != EFI_FVH_SIGNATURE)
++      || (FwVolHeader->FvLength  != FvLength)
++      )
++  {
++    DEBUG ((DEBUG_ERROR, "%a: No Firmware Volume header present\n",
++      __FUNCTION__));
++    return EFI_NOT_FOUND;
++  }
++
++  // Check the Firmware Volume Guid
++  if (!CompareGuid (&FwVolHeader->FileSystemGuid, &gEfiSystemNvDataFvGuid)) {
++    DEBUG ((DEBUG_ERROR, "%a: Firmware Volume Guid non-compatible\n",
++      __FUNCTION__));
++    return EFI_NOT_FOUND;
++  }
++
++  VariableStoreHeader = (VOID *)((UINTN)FwVolHeader +
++                                 FwVolHeader->HeaderLength);
++
++  // Check the Variable Store Guid
++  if (!CompareGuid (&VariableStoreHeader->Signature, &gEfiVariableGuid) &&
++      !CompareGuid (&VariableStoreHeader->Signature,
++        &gEfiAuthenticatedVariableGuid)) {
++    DEBUG ((DEBUG_ERROR, "%a: Variable Store Guid non-compatible\n",
++      __FUNCTION__));
++    return EFI_NOT_FOUND;
++  }
++
++  VariableStoreLength = PcdGet32 (PcdFlashNvStorageVariableSize) -
++                        FwVolHeader->HeaderLength;
++  if (VariableStoreHeader->Size != VariableStoreLength) {
++    DEBUG ((DEBUG_ERROR, "%a: Variable Store Length does not match\n",
++      __FUNCTION__));
++    return EFI_NOT_FOUND;
++  }
++  return EFI_SUCCESS;
++}
++
++/**
++ Retrieves the attributes and current settings of the block.
++
++ @param[in]   This         Indicates the EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL instance.
++
++ @param[out]  Attributes   Pointer to EFI_FVB_ATTRIBUTES_2 in which the attributes and
++                           current settings are returned.
++                           Type EFI_FVB_ATTRIBUTES_2 is defined in
++                           EFI_FIRMWARE_VOLUME_HEADER.
++
++ @retval      EFI_SUCCESS  The firmware volume attributes were returned.
++
++**/
++EFI_STATUS
++EFIAPI
++FvbGetAttributes(
++  IN CONST  EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL    *This,
++  OUT       EFI_FVB_ATTRIBUTES_2                   *Attributes
++  )
++{
++  EFI_FVB_ATTRIBUTES_2  FlashFvbAttributes;
++
++  FlashFvbAttributes = EFI_FVB2_READ_ENABLED_CAP | EFI_FVB2_READ_STATUS |
++                       EFI_FVB2_WRITE_ENABLED_CAP | EFI_FVB2_WRITE_STATUS |
++                       EFI_FVB2_STICKY_WRITE | EFI_FVB2_MEMORY_MAPPED |
++                       EFI_FVB2_ERASE_POLARITY;
++
++  *Attributes = FlashFvbAttributes;
++
++  DEBUG ((DEBUG_INFO, "FvbGetAttributes(0x%X)\n", *Attributes));
++
++  return EFI_SUCCESS;
++}
++
++/**
++ Sets configurable firmware volume attributes and returns the
++ new settings of the firmware volume.
++
++
++ @param[in]         This                     EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL instance.
++
++ @param[in, out]    Attributes               On input, Attributes is a pointer to
++                                             EFI_FVB_ATTRIBUTES_2 that contains the desired
++                                             firmware volume settings.
++                                             On successful return, it contains the new
++                                             settings of the firmware volume.
++
++ @retval            EFI_UNSUPPORTED          The firmware volume attributes are not supported.
++
++**/
++EFI_STATUS
++EFIAPI
++FvbSetAttributes(
++  IN CONST  EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL  *This,
++  IN OUT    EFI_FVB_ATTRIBUTES_2                 *Attributes
++  )
++{
++  DEBUG ((DEBUG_INFO, "FvbSetAttributes(0x%X) is not supported\n",
++    *Attributes));
++  return EFI_UNSUPPORTED;
++}
++
++/**
++ Retrieves the base address of a memory-mapped firmware volume.
++ This function should be called only for memory-mapped firmware volumes.
++
++ @param[in]     This               EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL instance.
++
++ @param[out]    Address            Pointer to a caller-allocated
++                                   EFI_PHYSICAL_ADDRESS that, on successful
++                                   return from GetPhysicalAddress(), contains the
++                                   base address of the firmware volume.
++
++ @retval        EFI_SUCCESS        The firmware volume base address was returned.
++
++**/
++EFI_STATUS
++EFIAPI
++FvbGetPhysicalAddress (
++  IN CONST  EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL  *This,
++  OUT       EFI_PHYSICAL_ADDRESS                 *Address
++  )
++{
++  NOR_FLASH_INSTANCE *Instance;
++
++  Instance = INSTANCE_FROM_FVB_THIS (This);
++
++  DEBUG ((DEBUG_INFO, "FvbGetPhysicalAddress(BaseAddress=0x%08x)\n",
++    Instance->RegionBaseAddress));
++
++  ASSERT(Address != NULL);
++
++  *Address = Instance->RegionBaseAddress;
++  return EFI_SUCCESS;
++}
++
++/**
++ Retrieves the size of the requested block.
++ It also returns the number of additional blocks with the identical size.
++ The GetBlockSize() function is used to retrieve the block map
++ (see EFI_FIRMWARE_VOLUME_HEADER).
++
++
++ @param[in]     This                     EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL instance.
++
++ @param[in]     Lba                      Indicates the block whose size to return
++
++ @param[out]    BlockSize                Pointer to a caller-allocated UINTN in which
++                                         the size of the block is returned.
++
++ @param[out]    NumberOfBlocks           Pointer to a caller-allocated UINTN in
++                                         which the number of consecutive blocks,
++                                         starting with Lba, is returned. All
++                                         blocks in this range have a size of
++                                         BlockSize.
++
++ @retval        EFI_SUCCESS              The firmware volume base address was returned.
++
++ @retval        EFI_INVALID_PARAMETER    The requested LBA is out of range.
++
++**/
++EFI_STATUS
++EFIAPI
++FvbGetBlockSize (
++  IN CONST  EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL  *This,
++  IN        EFI_LBA                              Lba,
++  OUT       UINTN                                *BlockSize,
++  OUT       UINTN                                *NumberOfBlocks
++  )
++{
++  EFI_STATUS Status;
++  NOR_FLASH_INSTANCE *Instance;
++
++  Instance = INSTANCE_FROM_FVB_THIS (This);
++
++  DEBUG ((DEBUG_INFO,
++    "FvbGetBlockSize(Lba=%ld, BlockSize=0x%x, LastBlock=%ld)\n", Lba,
++    Instance->BlockSize, Instance->LastBlock));
++
++  if (Lba > Instance->LastBlock) {
++    DEBUG ((DEBUG_ERROR,
++      "FvbGetBlockSize: ERROR - Parameter LBA %ld is beyond the last Lba (%ld).\n",
++      Lba, Instance->LastBlock));
++    Status = EFI_INVALID_PARAMETER;
++  } else {
++    // This is easy because in this platform each NorFlash device has equal sized blocks.
++    *BlockSize = (UINTN) Instance->BlockSize;
++    *NumberOfBlocks = (UINTN) (Instance->LastBlock - Lba + 1);
++
++    DEBUG ((DEBUG_INFO,
++      "FvbGetBlockSize: *BlockSize=0x%x, *NumberOfBlocks=0x%x.\n", *BlockSize,
++      *NumberOfBlocks));
++
++    Status = EFI_SUCCESS;
++  }
++
++  return Status;
++}
++
++/**
++ Reads the specified number of bytes into a buffer from the specified block.
++
++ The Read() function reads the requested number of bytes from the
++ requested block and stores them in the provided buffer.
++
++ @param[in]       This                 EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL instance.
++
++ @param[in]       Lba                  The starting logical block index from which to read
++
++ @param[in]       Offset               Offset into the block at which to begin reading.
++
++ @param[in, out]  NumBytes             Pointer to a UINTN.
++                                       At entry, *NumBytes contains the total size of the
++                                       buffer. *NumBytes should have a non zero value.
++                                       At exit, *NumBytes contains the total number of
++                                       bytes read.
++
++ @param[in, out]  Buffer               Pointer to a caller-allocated buffer that will be
++                                       used to hold the data that is read.
++
++ @retval          EFI_SUCCESS          The firmware volume was read successfully, and
++                                       contents are in Buffer.
++
++ @retval          EFI_BAD_BUFFER_SIZE  Read attempted across an LBA boundary.
++
++ @retval          EFI_DEVICE_ERROR     The block device is not functioning correctly and
++                                       could not be read.
++
++**/
++EFI_STATUS
++EFIAPI
++FvbRead (
++  IN CONST  EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL   *This,
++  IN        EFI_LBA                               Lba,
++  IN        UINTN                                 Offset,
++  IN OUT    UINTN                                 *NumBytes,
++  IN OUT    UINT8                                 *Buffer
++  )
++{
++  EFI_STATUS    Status;
++  UINTN         BlockSize;
++  NOR_FLASH_INSTANCE *Instance;
++
++  Instance = INSTANCE_FROM_FVB_THIS (This);
++
++  DEBUG ((DEBUG_INFO,
++    "FvbRead(Parameters: Lba=%ld, Offset=0x%x, *NumBytes=0x%x, Buffer @ 0x%08x)\n",
++    Instance->StartLba + Lba, Offset, *NumBytes, Buffer));
++
++  if (!Instance->Initialized && Instance->Initialize) {
++    Instance->Initialize(Instance);
++  }
++
++  BlockSize = Instance->BlockSize;
++
++  DEBUG ((DEBUG_INFO,
++    "FvbRead: Check if (Offset=0x%x + NumBytes=0x%x) <= BlockSize=0x%x\n",
++    Offset, *NumBytes, BlockSize ));
++
++  // The read must not span block boundaries.
++  // We need to check each variable individually because adding two large
++  // values together overflows.
++  if (Offset               >= BlockSize ||
++      *NumBytes            >  BlockSize ||
++      (Offset + *NumBytes) >  BlockSize) {
++    DEBUG ((DEBUG_ERROR,
++      "FvbRead: ERROR - EFI_BAD_BUFFER_SIZE: (Offset=0x%x + NumBytes=0x%x) > BlockSize=0x%x\n",
++      Offset, *NumBytes, BlockSize ));
++    return EFI_BAD_BUFFER_SIZE;
++  }
++
++  // We must have some bytes to read
++  if (*NumBytes == 0) {
++    return EFI_BAD_BUFFER_SIZE;
++  }
++
++  // Decide if we are doing full block reads or not.
++  if (*NumBytes % BlockSize != 0) {
++    Status = NorFlashRead (Instance, Instance->StartLba + Lba, Offset,
++                   *NumBytes, Buffer);
++  } else {
++    // Read NOR Flash data into shadow buffer
++    Status = NorFlashReadBlocks (Instance, Instance->StartLba + Lba,
++                   BlockSize, Buffer);
++  }
++  if (EFI_ERROR (Status)) {
++    // Return one of the pre-approved error statuses
++    return EFI_DEVICE_ERROR;
++  }
++  return EFI_SUCCESS;
++}
++
++/**
++ Writes the specified number of bytes from the input buffer to the block.
++
++ @param[in]        This                 EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL instance.
++
++ @param[in]        Lba                  The starting logical block index to write to.
++
++ @param[in]        Offset               Offset into the block at which to begin writing.
++
++ @param[in, out]   NumBytes             The pointer to a UINTN.
++                                        At entry, *NumBytes contains the total size of the
++                                        buffer.
++                                        At exit, *NumBytes contains the total number of
++                                        bytes actually written.
++
++ @param[in]        Buffer               The pointer to a caller-allocated buffer that
++                                        contains the source for the write.
++
++ @retval           EFI_SUCCESS          The firmware volume was written successfully.
++
++**/
++EFI_STATUS
++EFIAPI
++FvbWrite (
++  IN CONST  EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL   *This,
++  IN        EFI_LBA                               Lba,
++  IN        UINTN                                 Offset,
++  IN OUT    UINTN                                 *NumBytes,
++  IN        UINT8                                 *Buffer
++  )
++{
++  NOR_FLASH_INSTANCE *Instance;
++
++  Instance = INSTANCE_FROM_FVB_THIS (This);
++
++  return NorFlashWriteSingleBlock (Instance, Instance->StartLba + Lba, Offset,
++           NumBytes, Buffer);
++}
++
++/**
++ Erases and initialises a firmware volume block.
++
++ @param[in]   This                     EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL
++
++ @param[in]   ...                      The variable argument list is a list of tuples.
++                                       Each tuple describes a range of LBAs to erase
++                                       and consists of the following:
++                                       - An EFI_LBA that indicates the starting LBA
++                                       - A UINTN that indicates the number of blocks
++                                       to erase.
++
++                                       The list is terminated with an
++                                       EFI_LBA_LIST_TERMINATOR.
++
++ @retval      EFI_SUCCESS              The erase request successfully completed.
++
++ @retval      EFI_ACCESS_DENIED        The firmware volume is in the WriteDisabled
++                                       state.
++
++ @retval      EFI_DEVICE_ERROR         The block device is not functioning correctly
++                                       and could not be written.
++                                       The firmware device may have been partially
++                                       erased.
++
++ @retval      EFI_INVALID_PARAMETER   One or more of the LBAs listed in the variable
++                                      argument list do not exist in the firmware
++                                      volume.
++
++**/
++EFI_STATUS
++EFIAPI
++FvbEraseBlocks (
++  IN CONST EFI_FIRMWARE_VOLUME_BLOCK2_PROTOCOL *This,
++  ...
++  )
++{
++  EFI_STATUS  Status;
++  VA_LIST     Args;
++  UINTN       BlockAddress; // Physical address of Lba to erase
++  EFI_LBA     StartingLba;  // Lba from which we start erasing
++  UINTN       NumOfLba;     // Number of Lba blocks to erase
++  NOR_FLASH_INSTANCE *Instance;
++
++  Instance = INSTANCE_FROM_FVB_THIS (This);
++
++  DEBUG ((DEBUG_INFO, "FvbEraseBlocks()\n"));
++
++  Status = EFI_SUCCESS;
++
++  // Before erasing, check the entire list of parameters to ensure
++  // all specified blocks are valid
++
++  VA_START (Args, This);
++  do {
++    // Get the Lba from which we start erasing
++    StartingLba = VA_ARG (Args, EFI_LBA);
++
++    // Have we reached the end of the list?
++    if (StartingLba == EFI_LBA_LIST_TERMINATOR) {
++      break;
++    }
++
++    // How many Lba blocks are we requested to erase?
++    NumOfLba = VA_ARG (Args, UINT32);
++
++    // All blocks must be within range
++    DEBUG ((DEBUG_INFO,
++      "FvbEraseBlocks: Check if: ( StartingLba=%ld + NumOfLba=%d - 1 ) > LastBlock=%ld.\n",
++      Instance->StartLba + StartingLba, NumOfLba, Instance->LastBlock));
++    if (NumOfLba == 0 ||
++        (Instance->StartLba + StartingLba + NumOfLba - 1) >
++        Instance->LastBlock) {
++      VA_END (Args);
++      DEBUG ((DEBUG_ERROR,
++        "FvbEraseBlocks: ERROR - Lba range goes past the last Lba.\n"));
++      return EFI_INVALID_PARAMETER;
++    }
++  } while (TRUE);
++  VA_END (Args);
++
++  VA_START (Args, This);
++  do {
++    // Get the Lba from which we start erasing
++    StartingLba = VA_ARG (Args, EFI_LBA);
++
++    // Have we reached the end of the list?
++    if (StartingLba == EFI_LBA_LIST_TERMINATOR) {
++      // Exit the while loop
++      break;
++    }
++
++    // How many Lba blocks are we requested to erase?
++    NumOfLba = VA_ARG (Args, UINT32);
++
++    // Go through each one and erase it
++    while (NumOfLba > 0) {
++
++      // Get the physical address of Lba to erase
++      BlockAddress = GET_NOR_BLOCK_ADDRESS (
++                       Instance->RegionBaseAddress,
++                       Instance->StartLba + StartingLba,
++                       Instance->BlockSize
++                       );
++
++      // Erase it
++      DEBUG ((DEBUG_INFO, "FvbEraseBlocks: Erasing Lba=%ld @ 0x%08x.\n",
++        Instance->StartLba + StartingLba, BlockAddress));
++      Status = NorFlashUnlockAndEraseSingleBlock (Instance, BlockAddress);
++      if (EFI_ERROR(Status)) {
++        VA_END (Args);
++        return EFI_DEVICE_ERROR;
++      }
++
++      // Move to the next Lba
++      StartingLba++;
++      NumOfLba--;
++    }
++  } while (TRUE);
++  VA_END (Args);
++
++  return Status;
++
++}
+diff --git a/Platform/ARM/N1Sdp/N1SdpPlatform.dec b/Platform/ARM/N1Sdp/N1SdpPlatform.dec
+index 16937197..986a078f 100644
+--- a/Platform/ARM/N1Sdp/N1SdpPlatform.dec
++++ b/Platform/ARM/N1Sdp/N1SdpPlatform.dec
+@@ -1,7 +1,7 @@
+ ## @file
+ #  Describes the N1Sdp configuration.
+ #
+-#  Copyright (c) 2021, ARM Limited. All rights reserved.<BR>
++#  Copyright (c) 2021-2022, ARM Limited. All rights reserved.<BR>
+ #
+ #  SPDX-License-Identifier: BSD-2-Clause-Patent
+ ##
+@@ -89,3 +89,6 @@
+   # unmapped reserved region results in a DECERR response.
+   #
+   gArmN1SdpTokenSpaceGuid.PcdCsComponentSize|0x1000|UINT32|0x00000049
++
++  # Base address of Cadence QSPI controller configuration registers
++  gArmN1SdpTokenSpaceGuid.PcdCadenceQspiDxeRegBaseAddress|0x1C0C0000|UINT32|0x0000004A
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0007-Platform-ARM-N1Sdp-Persistent-storage-for-N1Sdp.patch b/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0007-Platform-ARM-N1Sdp-Persistent-storage-for-N1Sdp.patch
new file mode 100644
index 00000000..197a6eca
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0007-Platform-ARM-N1Sdp-Persistent-storage-for-N1Sdp.patch
@@ -0,0 +1,88 @@
+From e79fd5cfa3190eb27a9637facc9891cab55b5e09 Mon Sep 17 00:00:00 2001
+From: sahil <sahil@arm.com>
+Date: Mon, 2 May 2022 19:24:47 +0530
+Subject: [PATCH] Platform/ARM/N1Sdp: Persistent storage for N1Sdp
+
+Enable persistent storage on QSPI flash device.
+
+Upstream-Status: Pending
+Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
+Signed-off-by: sahil <sahil@arm.com>
+Change-Id: I403113bb885d1d411d433a7f266715d007509a5e
+---
+ Platform/ARM/N1Sdp/N1SdpPlatform.dsc | 18 +++++++++++++-----
+ Platform/ARM/N1Sdp/N1SdpPlatform.fdf |  4 +++-
+ 2 files changed, 16 insertions(+), 6 deletions(-)
+
+diff --git a/Platform/ARM/N1Sdp/N1SdpPlatform.dsc b/Platform/ARM/N1Sdp/N1SdpPlatform.dsc
+index 676ab677..80bc875a 100644
+--- a/Platform/ARM/N1Sdp/N1SdpPlatform.dsc
++++ b/Platform/ARM/N1Sdp/N1SdpPlatform.dsc
+@@ -44,6 +44,9 @@
+   # file explorer library support
+   FileExplorerLib|MdeModulePkg/Library/FileExplorerLib/FileExplorerLib.inf
+ 
++  # NOR flash support
++  NorFlashInfoLib|EmbeddedPkg/Library/NorFlashInfoLib/NorFlashInfoLib.inf
++
+ [LibraryClasses.common.SEC]
+   HobLib|MdePkg/Library/PeiHobLib/PeiHobLib.inf
+   MemoryAllocationLib|MdePkg/Library/PeiMemoryAllocationLib/PeiMemoryAllocationLib.inf
+@@ -161,11 +164,9 @@
+   # ACPI Table Version
+   gEfiMdeModulePkgTokenSpaceGuid.PcdAcpiExposedTableVersions|0x20
+ 
+-  # Runtime Variable storage
+-  gEfiMdeModulePkgTokenSpaceGuid.PcdEmuVariableNvStoreReserved|0
+-  gEfiMdeModulePkgTokenSpaceGuid.PcdEmuVariableNvModeEnable|TRUE
+-  gEfiMdeModulePkgTokenSpaceGuid.PcdMaxVariableSize|0x2000
+-  gEfiMdeModulePkgTokenSpaceGuid.PcdMaxAuthVariableSize|0x2800
++  # NOR flash support
++  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageVariableBase|0x18F00000
++  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageVariableSize|0x00020000
+ 
+ ################################################################################
+ #
+@@ -197,6 +198,12 @@
+       gEfiMdePkgTokenSpaceGuid.PcdDebugPrintErrorLevel|0x8000000F
+   }
+ 
++  # NOR flash support
++  Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiDxe.inf {
++      <LibraryClasses>
++      NorFlashPlatformLib|Silicon/ARM/NeoverseN1Soc/Library/NorFlashLib/NorFlashLib.inf
++  }
++
+   # Architectural Protocols
+   ArmPkg/Drivers/CpuDxe/CpuDxe.inf
+   ArmPkg/Drivers/ArmGic/ArmGicDxe.inf
+@@ -217,6 +224,7 @@
+   MdeModulePkg/Universal/Variable/RuntimeDxe/VariableRuntimeDxe.inf {
+     <LibraryClasses>
+       NULL|MdeModulePkg/Library/VarCheckUefiLib/VarCheckUefiLib.inf
++      NULL|EmbeddedPkg/Library/NvVarStoreFormattedLib/NvVarStoreFormattedLib.inf
+       BaseMemoryLib|MdePkg/Library/BaseMemoryLib/BaseMemoryLib.inf
+   }
+ 
+diff --git a/Platform/ARM/N1Sdp/N1SdpPlatform.fdf b/Platform/ARM/N1Sdp/N1SdpPlatform.fdf
+index e5e24ea5..4329f892 100644
+--- a/Platform/ARM/N1Sdp/N1SdpPlatform.fdf
++++ b/Platform/ARM/N1Sdp/N1SdpPlatform.fdf
+@@ -1,7 +1,7 @@
+ ## @file
+ #  FDF file of N1Sdp
+ #
+-#  Copyright (c) 2018 - 2021, ARM Limited. All rights reserved.<BR>
++#  Copyright (c) 2018 - 2023, ARM Limited. All rights reserved.<BR>
+ #
+ #  SPDX-License-Identifier: BSD-2-Clause-Patent
+ ##
+@@ -140,6 +140,8 @@ READ_LOCK_STATUS   = TRUE
+   INF ArmPkg/Drivers/GenericWatchdogDxe/GenericWatchdogDxe.inf
+   INF ArmPkg/Drivers/TimerDxe/TimerDxe.inf
+ 
++  INF Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiDxe.inf
++
+   INF Platform/ARM/Drivers/BootMonFs/BootMonFs.inf
+   INF MdeModulePkg/Universal/PCD/Dxe/Pcd.inf
+ 
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0008-Platform-ARM-N1Sdp-Enable-FaultTolerantWrite-Dxe-dri.patch b/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0008-Platform-ARM-N1Sdp-Enable-FaultTolerantWrite-Dxe-dri.patch
new file mode 100644
index 00000000..3951b48b
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0008-Platform-ARM-N1Sdp-Enable-FaultTolerantWrite-Dxe-dri.patch
@@ -0,0 +1,50 @@
+From 5e8fbb3ba0f634f7fc873c6577269845f9e243db Mon Sep 17 00:00:00 2001
+From: sahil <sahil@arm.com>
+Date: Mon, 2 May 2022 19:28:19 +0530
+Subject: [PATCH] Platform/ARM/N1Sdp: Enable FaultTolerantWrite Dxe driver for
+ N1Sdp
+
+Upstream-Status: Pending
+Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
+Signed-off-by: sahil <sahil@arm.com>
+Change-Id: If448ad95b2e72cef31ce1e1e5ab2504d607f0545
+---
+ Platform/ARM/N1Sdp/N1SdpPlatform.dsc | 5 +++++
+ Platform/ARM/N1Sdp/N1SdpPlatform.fdf | 1 +
+ 2 files changed, 6 insertions(+)
+
+diff --git a/Platform/ARM/N1Sdp/N1SdpPlatform.dsc b/Platform/ARM/N1Sdp/N1SdpPlatform.dsc
+index 80bc875a..90a0d5b6 100644
+--- a/Platform/ARM/N1Sdp/N1SdpPlatform.dsc
++++ b/Platform/ARM/N1Sdp/N1SdpPlatform.dsc
+@@ -165,6 +165,10 @@
+   gEfiMdeModulePkgTokenSpaceGuid.PcdAcpiExposedTableVersions|0x20
+ 
+   # NOR flash support
++  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageFtwSpareBase|0x18F40000
++  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageFtwSpareSize|0x00020000
++  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageFtwWorkingBase|0x18F20000
++  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageFtwWorkingSize|0x00020000
+   gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageVariableBase|0x18F00000
+   gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageVariableSize|0x00020000
+ 
+@@ -227,6 +231,7 @@
+       NULL|EmbeddedPkg/Library/NvVarStoreFormattedLib/NvVarStoreFormattedLib.inf
+       BaseMemoryLib|MdePkg/Library/BaseMemoryLib/BaseMemoryLib.inf
+   }
++  MdeModulePkg/Universal/FaultTolerantWriteDxe/FaultTolerantWriteDxe.inf
+ 
+   # ACPI Support
+   MdeModulePkg/Universal/Acpi/AcpiTableDxe/AcpiTableDxe.inf
+diff --git a/Platform/ARM/N1Sdp/N1SdpPlatform.fdf b/Platform/ARM/N1Sdp/N1SdpPlatform.fdf
+index 4329f892..17d370a3 100644
+--- a/Platform/ARM/N1Sdp/N1SdpPlatform.fdf
++++ b/Platform/ARM/N1Sdp/N1SdpPlatform.fdf
+@@ -90,6 +90,7 @@ READ_LOCK_STATUS   = TRUE
+   INF MdeModulePkg/Universal/Metronome/Metronome.inf
+   INF MdeModulePkg/Universal/ResetSystemRuntimeDxe/ResetSystemRuntimeDxe.inf
+   INF MdeModulePkg/Universal/CapsuleRuntimeDxe/CapsuleRuntimeDxe.inf
++  INF MdeModulePkg/Universal/FaultTolerantWriteDxe/FaultTolerantWriteDxe.inf
+   INF MdeModulePkg/Universal/MonotonicCounterRuntimeDxe/MonotonicCounterRuntimeDxe.inf
+   INF MdeModulePkg/Universal/SecurityStubDxe/SecurityStubDxe.inf
+   INF MdeModulePkg/Universal/Variable/RuntimeDxe/VariableRuntimeDxe.inf
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0009-Platform-ARM-N1Sdp-manually-poll-QSPI-status-bit-aft.patch b/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0009-Platform-ARM-N1Sdp-manually-poll-QSPI-status-bit-aft.patch
new file mode 100644
index 00000000..8e146995
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0009-Platform-ARM-N1Sdp-manually-poll-QSPI-status-bit-aft.patch
@@ -0,0 +1,197 @@
+From 6d274379f584a638c1f2b4b8a19014d4baef1d9f Mon Sep 17 00:00:00 2001
+From: sahil <sahil@arm.com>
+Date: Thu, 11 Aug 2022 11:26:29 +0530
+Subject: [PATCH] Platform/ARM/N1Sdp: manually poll QSPI status bit after
+ erase/write
+
+This patch adds a function to poll Nor flash memory's status register
+bit (WIP bit) to wait for an erase/write operation to complete.
+The polling timeout is set to 1 second.
+
+Upstream-Status: Pending
+Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
+Signed-off-by: sahil <sahil@arm.com>
+Change-Id: Ie678b7586671964ae0f8506a0542d73cbddddfe4
+---
+ .../Drivers/CadenceQspiDxe/CadenceQspiDxe.inf |  1 +
+ .../Drivers/CadenceQspiDxe/CadenceQspiReg.h   |  6 +-
+ .../N1Sdp/Drivers/CadenceQspiDxe/NorFlash.c   | 80 ++++++++++++++++++-
+ .../N1Sdp/Drivers/CadenceQspiDxe/NorFlash.h   |  5 ++
+ 4 files changed, 88 insertions(+), 4 deletions(-)
+
+diff --git a/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiDxe.inf b/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiDxe.inf
+index 4f20c3ba..7a39eb2d 100644
+--- a/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiDxe.inf
++++ b/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiDxe.inf
+@@ -39,6 +39,7 @@
+   MemoryAllocationLib
+   NorFlashInfoLib
+   NorFlashPlatformLib
++  TimerLib
+   UefiBootServicesTableLib
+   UefiDriverEntryPoint
+   UefiLib
+diff --git a/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiReg.h b/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiReg.h
+index fe3b327c..1971631d 100644
+--- a/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiReg.h
++++ b/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/CadenceQspiReg.h
+@@ -16,13 +16,15 @@
+ #define CDNS_QSPI_FLASH_CMD_CTRL_REG_ADDR_BIT_POS         19
+ #define CDNS_QSPI_FLASH_CMD_CTRL_REG_ADDR_BYTE_BIT_POS    16
+ #define CDNS_QSPI_FLASH_CMD_CTRL_REG_STATUS_BIT           0x02
+-#define CDNS_QSPI_FLASH_CMD_CTRL_REG_ADDR_BYTE_4B         0x03
+-#define CDNS_QSPI_FLASH_CMD_CTRL_REG_ADDR_BYTE_3B         0x02
+ #define CDNS_QSPI_FLASH_CMD_CTRL_REG_OPCODE_BIT_POS       24
+ #define CDNS_QSPI_FLASH_CMD_CTRL_REG_READ_ENABLE          0x01
+ #define CDNS_QSPI_FLASH_CMD_CTRL_REG_READ_BYTE_3B         0x02
+ #define CDNS_QSPI_FLASH_CMD_CTRL_REG_READEN_BIT_POS       23
+ #define CDNS_QSPI_FLASH_CMD_CTRL_REG_READBYTE_BIT_POS     20
++#define CDNS_QSPI_FLASH_CMD_CTRL_REG_DUMMY_8C             0x8
++#define CDNS_QSPI_FLASH_CMD_CTRL_REG_DUMMY_BIT_POS        7
++#define CDNS_QSPI_FLASH_CMD_CTRL_REG_NUM_DATA_BYTES(x) ((x - 1) << CDNS_QSPI_FLASH_CMD_CTRL_REG_READBYTE_BIT_POS)
++#define CDNS_QSPI_FLASH_CMD_CTRL_REG_NUM_ADDR_BYTES(x) ((x - 1) << CDNS_QSPI_FLASH_CMD_CTRL_REG_ADDR_BYTE_BIT_POS)
+ 
+ #define CDNS_QSPI_FLASH_CMD_READ_DATA_REG_OFFSET          0xA0
+ 
+diff --git a/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/NorFlash.c b/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/NorFlash.c
+index 188c75e2..6832351a 100644
+--- a/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/NorFlash.c
++++ b/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/NorFlash.c
+@@ -10,6 +10,7 @@
+ #include <Library/MemoryAllocationLib.h>
+ #include <Library/NorFlashInfoLib.h>
+ #include <Library/PcdLib.h>
++#include <Library/TimerLib.h>
+ #include <Library/UefiBootServicesTableLib.h>
+ #include <Library/UefiLib.h>
+ 
+@@ -184,6 +185,74 @@ FreeInstance:
+   return Status;
+ }
+ 
++/**
++  Converts milliseconds into number of ticks of the performance counter.
++
++  @param[in] Milliseconds  Milliseconds to convert into ticks.
++
++  @retval Milliseconds expressed as number of ticks.
++
++**/
++STATIC
++UINT64
++MilliSecondsToTicks (
++  IN UINTN Milliseconds
++  )
++{
++  CONST UINT64  NanoSecondsPerTick = GetTimeInNanoSecond (1);
++
++  return (Milliseconds * 1000000) / NanoSecondsPerTick;
++}
++
++/**
++  Poll Status register for NOR flash erase/write completion.
++
++  @param[in]      Instance           NOR flash Instance.
++
++  @retval         EFI_SUCCESS        Request is executed successfully.
++  @retval         EFI_TIMEOUT        Operation timed out.
++  @retval         EFI_DEVICE_ERROR   Controller operartion failed.
++
++**/
++STATIC
++EFI_STATUS
++NorFlashPollStatusRegister (
++  IN NOR_FLASH_INSTANCE     *Instance
++  )
++{
++  BOOLEAN     SRegDone;
++  UINT32      val;
++
++  val = SPINOR_OP_RDSR << CDNS_QSPI_FLASH_CMD_CTRL_REG_OPCODE_BIT_POS |
++      CDNS_QSPI_FLASH_CMD_CTRL_REG_READ_ENABLE << CDNS_QSPI_FLASH_CMD_CTRL_REG_READEN_BIT_POS |
++      CDNS_QSPI_FLASH_CMD_CTRL_REG_NUM_DATA_BYTES(1) |
++      CDNS_QSPI_FLASH_CMD_CTRL_REG_DUMMY_8C << CDNS_QSPI_FLASH_CMD_CTRL_REG_DUMMY_BIT_POS;
++
++  CONST UINT64  TickOut =
++    GetPerformanceCounter () + MilliSecondsToTicks (SPINOR_SR_WIP_POLL_TIMEOUT_MS);
++
++  do {
++    if (GetPerformanceCounter () > TickOut) {
++      DEBUG ((
++        DEBUG_ERROR,
++        "NorFlashPollStatusRegister: Timeout waiting for erase/write.\n"
++        ));
++      return EFI_TIMEOUT;
++    }
++
++    if (EFI_ERROR (CdnsQspiExecuteCommand (Instance, val))) {
++      return EFI_DEVICE_ERROR;
++    }
++
++    SRegDone =
++      (MmioRead8 (Instance->HostRegisterBaseAddress + CDNS_QSPI_FLASH_CMD_READ_DATA_REG_OFFSET)
++      & SPINOR_SR_WIP) == 0;
++
++  } while (!SRegDone);
++
++  return EFI_SUCCESS;
++}
++
+ /**
+   Check whether NOR flash opertions are Locked.
+ 
+@@ -305,12 +374,16 @@ NorFlashEraseSingleBlock (
+ 
+   DevConfigVal = SPINOR_OP_BE_4K << CDNS_QSPI_FLASH_CMD_CTRL_REG_OPCODE_BIT_POS |
+                  CDNS_QSPI_FLASH_CMD_CTRL_REG_ADDR_ENABLE << CDNS_QSPI_FLASH_CMD_CTRL_REG_ADDR_BIT_POS |
+-                 CDNS_QSPI_FLASH_CMD_CTRL_REG_ADDR_BYTE_3B << CDNS_QSPI_FLASH_CMD_CTRL_REG_ADDR_BYTE_BIT_POS;
++                 CDNS_QSPI_FLASH_CMD_CTRL_REG_NUM_ADDR_BYTES(3);
+ 
+   if (EFI_ERROR (CdnsQspiExecuteCommand (Instance, DevConfigVal))) {
+     return EFI_DEVICE_ERROR;
+   }
+ 
++  if (EFI_ERROR (NorFlashPollStatusRegister (Instance))) {
++      return EFI_DEVICE_ERROR;
++  }
++
+   return EFI_SUCCESS;
+ }
+ 
+@@ -383,6 +456,9 @@ NorFlashWriteSingleWord (
+     return EFI_DEVICE_ERROR;
+   }
+   MmioWrite32 (WordAddress, WriteData);
++  if (EFI_ERROR (NorFlashPollStatusRegister (Instance))) {
++    return EFI_DEVICE_ERROR;
++  }
+   return EFI_SUCCESS;
+ }
+ 
+@@ -907,7 +983,7 @@ NorFlashReadID (
+ 
+   val = SPINOR_OP_RDID << CDNS_QSPI_FLASH_CMD_CTRL_REG_OPCODE_BIT_POS |
+         CDNS_QSPI_FLASH_CMD_CTRL_REG_READ_ENABLE << CDNS_QSPI_FLASH_CMD_CTRL_REG_READEN_BIT_POS |
+-        CDNS_QSPI_FLASH_CMD_CTRL_REG_ADDR_BYTE_3B << CDNS_QSPI_FLASH_CMD_CTRL_REG_READBYTE_BIT_POS;
++        CDNS_QSPI_FLASH_CMD_CTRL_REG_NUM_DATA_BYTES(3);
+ 
+   if (EFI_ERROR (CdnsQspiExecuteCommand (Instance, val))) {
+     return EFI_DEVICE_ERROR;
+diff --git a/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/NorFlash.h b/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/NorFlash.h
+index e720937e..eb0afc60 100644
+--- a/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/NorFlash.h
++++ b/Platform/ARM/N1Sdp/Drivers/CadenceQspiDxe/NorFlash.h
+@@ -477,8 +477,13 @@ NorFlashReadID (
+   OUT UINT8               JedecId[3]
+   );
+ 
++#define SPINOR_SR_WIP                 BIT0  // Write in progress
++
+ #define SPINOR_OP_WREN                0x06  // Write enable
+ #define SPINOR_OP_BE_4K               0x20  // Erase 4KiB block
+ #define SPINOR_OP_RDID                0x9f  // Read JEDEC ID
++#define SPINOR_OP_RDSR                0x05  // Read status register
++
++#define SPINOR_SR_WIP_POLL_TIMEOUT_MS  1000u // Status Register read timeout
+ 
+ #endif /* NOR_FLASH_DXE_H_ */
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202211.bb b/meta-arm/recipes-bsp/uefi/edk2-firmware_202211.bb
new file mode 100644
index 00000000..386bed4b
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_202211.bb
@@ -0,0 +1,4 @@
+SRCREV_edk2           ?= "fff6d81270b57ee786ea18ad74f43149b9f03494"
+SRCREV_edk2-platforms ?= "982212662c71b6c734b7578526071d6b78da3bcc"
+
+require edk2-firmware.inc
-- 
2.17.1


