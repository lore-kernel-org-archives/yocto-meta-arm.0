Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F3CAC6FA83
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 10:32:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.27010.1664188349488149260
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Sep 2022 03:32:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: adam.johnston@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B70571063;
	Mon, 26 Sep 2022 03:32:35 -0700 (PDT)
Received: from e114993.cambridge.arm.com (e114993.cambridge.arm.com
 [10.1.194.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F3673F73B;
	Mon, 26 Sep 2022 03:32:28 -0700 (PDT)
From: adam.johnston@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Adam Johnston <adam.johnston@arm.com>
Subject: [PATCH 2/3] arm-bsp/edk2-firmware: Add edk2-platforms patches for
 N1SDP
Date: Mon, 26 Sep 2022 11:32:02 +0100
Message-Id: <20220926103203.1196752-3-adam.johnston@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220926103203.1196752-1-adam.johnston@arm.com>
References: <20220926103203.1196752-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 26 Sep 2022 10:32:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3833

From: Adam Johnston <adam.johnston@arm.com>

This is to align edk2/edk2-platforms with N1SDP-2022.06.22 release

Signed-off-by: Adam Johnston <adam.johnston@arm.com>
---
 .../recipes-bsp/uefi/edk2-firmware-n1sdp.inc  |  4 +-
 ...p-Add-support-to-parse-NT_FW_CONFIG.patch} | 23 ++++---
 ...orm-ARM-N1Sdp-Fix-RemoteDdrSize-cast.patch | 48 +++++++++++++
 ...dp-Modify-the-IRQ-ID-of-Debug-UART-a.patch | 67 +++++++++++++++++++
 4 files changed, 130 insertions(+), 12 deletions(-)
 rename meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/{add-nt-fw-confi=
g.patch =3D> 0001-Platform-ARM-N1sdp-Add-support-to-parse-NT_FW_CONFIG.patc=
h} (95%)
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0002=
-Platform-ARM-N1Sdp-Fix-RemoteDdrSize-cast.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0003=
-Platform-ARM-N1Sdp-Modify-the-IRQ-ID-of-Debug-UART-a.patch

diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc b/meta-a=
rm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
index d5408cee..629ea049 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
@@ -19,7 +19,9 @@ EFI_BOOT_IMAGE     =3D "bootaa64.efi"
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/edk2-platforms:"
=20
 SRC_URI:append =3D "\
-    file://add-nt-fw-config.patch;patchdir=3Dedk2-platforms \
+    file://0001-Platform-ARM-N1sdp-Add-support-to-parse-NT_FW_CONFIG.patch=
;patchdir=3Dedk2-platforms \
+    file://0002-Platform-ARM-N1Sdp-Fix-RemoteDdrSize-cast.patch;patchdir=
=3Dedk2-platforms            \
+    file://0003-Platform-ARM-N1Sdp-Modify-the-IRQ-ID-of-Debug-UART-a.patch=
;patchdir=3Dedk2-platforms \
 "
=20
 do_deploy:append() {
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/add-nt-fw-c=
onfig.patch b/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0001-Platf=
orm-ARM-N1sdp-Add-support-to-parse-NT_FW_CONFIG.patch
similarity index 95%
rename from meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/add-nt-fw-co=
nfig.patch
rename to meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0001-Platform-=
ARM-N1sdp-Add-support-to-parse-NT_FW_CONFIG.patch
index f6f18951..e5526dd6 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/add-nt-fw-config.p=
atch
+++ b/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0001-Platform-ARM-=
N1sdp-Add-support-to-parse-NT_FW_CONFIG.patch
@@ -1,7 +1,7 @@
-From cc58709b32d74273736886ccfc08e4723a436ea4 Mon Sep 17 00:00:00 2001
+From fa3fd24ffbc987e952a2e5610a7b02556afd2087 Mon Sep 17 00:00:00 2001
 From: sahil <sahil@arm.com>
 Date: Thu, 17 Mar 2022 16:28:05 +0530
-Subject: [PATCH] Platform/ARM/N1sdp: Add support to parse NT_FW_CONFIG
+Subject: [PATCH 1/3] Platform/ARM/N1sdp: Add support to parse NT_FW_CONFIG
=20
 NT_FW_CONFIG DTB contains platform information passed by
 Tf-A boot stage.
@@ -11,6 +11,7 @@ it is used in ConfigurationManagerDxe.
=20
 Upstream-Status: Pending
 Signed-off-by: Adam Johnston <adam.johnston@arm.com>
+Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
 Signed-off-by: sahil <sahil@arm.com>
 Change-Id: Ib82571280bf1ca5febe5766e618de09e7b70bb02
=20
@@ -26,7 +27,7 @@ Change-Id: Ib82571280bf1ca5febe5766e618de09e7b70bb02
  8 files changed, 152 insertions(+), 25 deletions(-)
=20
 diff --git a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerD=
xe/ConfigurationManager.c b/Platform/ARM/N1Sdp/ConfigurationManager/Configu=
rationManagerDxe/ConfigurationManager.c
-index f50623ae3f..e023d47cfd 100644
+index f50623ae..e023d47c 100644
 --- a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Conf=
igurationManager.c
 +++ b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Conf=
igurationManager.c
 @@ -1,7 +1,7 @@
@@ -138,7 +139,7 @@ index f50623ae3f..e023d47cfd 100644
    // Configuration Manager Protocol=0D
    Status =3D InitializePlatformRepository (=0D
 diff --git a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerD=
xe/ConfigurationManagerDxe.inf b/Platform/ARM/N1Sdp/ConfigurationManager/Co=
nfigurationManagerDxe/ConfigurationManagerDxe.inf
-index 4f8e7f1302..fb59c29501 100644
+index 4f8e7f13..fb59c295 100644
 --- a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Conf=
igurationManagerDxe.inf
 +++ b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Conf=
igurationManagerDxe.inf
 @@ -1,7 +1,7 @@
@@ -159,7 +160,7 @@ index 4f8e7f1302..fb59c29501 100644
    UefiBootServicesTableLib=0D
    UefiDriverEntryPoint=0D
 diff --git a/Silicon/ARM/NeoverseN1Soc/Include/NeoverseN1Soc.h b/Silicon/A=
RM/NeoverseN1Soc/Include/NeoverseN1Soc.h
-index 097160c7e2..63cebaf0e0 100644
+index 097160c7..63cebaf0 100644
 --- a/Silicon/ARM/NeoverseN1Soc/Include/NeoverseN1Soc.h
 +++ b/Silicon/ARM/NeoverseN1Soc/Include/NeoverseN1Soc.h
 @@ -1,6 +1,6 @@
@@ -203,7 +204,7 @@ index 097160c7e2..63cebaf0e0 100644
 +=0D
  #endif=0D
 diff --git a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/AArch64/Helper.=
S b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/AArch64/Helper.S
-index 8d2069dea8..88ed640d29 100644
+index 8d2069de..88ed640d 100644
 --- a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/AArch64/Helper.S
 +++ b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/AArch64/Helper.S
 @@ -1,6 +1,6 @@
@@ -224,7 +225,7 @@ index 8d2069dea8..88ed640d29 100644
  =0D
  //=0D
 diff --git a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.c b=
/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.c
-index c0effd37f3..fabe902cd0 100644
+index c0effd37..fabe902c 100644
 --- a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.c
 +++ b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.c
 @@ -1,6 +1,6 @@
@@ -269,7 +270,7 @@ index c0effd37f3..fabe902cd0 100644
  };=0D
  =0D
 diff --git a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf=
 b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf
-index 96e590cdd8..6f9c9d5ab6 100644
+index 96e590cd..6f9c9d5a 100644
 --- a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf
 +++ b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf
 @@ -1,7 +1,7 @@
@@ -307,7 +308,7 @@ index 96e590cdd8..6f9c9d5ab6 100644
    gArmMpCoreInfoPpiGuid=0D
 +  gNtFwConfigDtInfoPpiGuid=0D
 diff --git a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.=
c b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
-index 339fa07b32..b58bda4b76 100644
+index 339fa07b..b58bda4b 100644
 --- a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
 +++ b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
 @@ -1,6 +1,6 @@
@@ -441,7 +442,7 @@ index 339fa07b32..b58bda4b76 100644
                               NEOVERSEN1SOC_DRAM_BLOCK1_SIZE / SIZE_1GB) *=
=0D
                              (UINT64)SIZE_1GB);=0D
 diff --git a/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec b/Silicon/ARM/Neo=
verseN1Soc/NeoverseN1Soc.dec
-index d59f25a5b9..4dea8fe1e8 100644
+index d59f25a5..4dea8fe1 100644
 --- a/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec
 +++ b/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec
 @@ -1,7 +1,7 @@
@@ -470,5 +471,5 @@ index d59f25a5b9..4dea8fe1e8 100644
 +[Ppis]=0D
 +  gNtFwConfigDtInfoPpiGuid =3D  { 0xb50dee0e, 0x577f, 0x47fb, { 0x83, 0xd=
0, 0x41, 0x78, 0x61, 0x8b, 0x33, 0x8a } }=0D
 --=20
-2.17.1
+2.37.2
=20
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0002-Platfo=
rm-ARM-N1Sdp-Fix-RemoteDdrSize-cast.patch b/meta-arm-bsp/recipes-bsp/uefi/f=
iles/edk2-platforms/0002-Platform-ARM-N1Sdp-Fix-RemoteDdrSize-cast.patch
new file mode 100644
index 00000000..1c097fcc
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0002-Platform-ARM-=
N1Sdp-Fix-RemoteDdrSize-cast.patch
@@ -0,0 +1,48 @@
+From 73aab76042ae34fa4b07414c1830129e572dcd65 Mon Sep 17 00:00:00 2001
+From: sahil <sahil@arm.com>
+Date: Wed, 20 Apr 2022 12:24:41 +0530
+Subject: [PATCH 2/3] Platform/ARM/N1Sdp: Fix RemoteDdrSize cast
+
+RemoteDdrSize calculation wraps around when booting N1Sdp in
+multichip mode. Casting it to UINT64 to fix the issue.
+
+Upstream-Status: Pending
+Signed-off-by: Adam Johnston <adam.johnston@arm.com>
+Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
+Signed-off-by: sahil <sahil@arm.com>
+Change-Id: I2c2a70c2ab046337236fba92d25dec5905ccd117
+
+---
+ .../ConfigurationManagerDxe/ConfigurationManager.c              | 2 +-
+ Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c  | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerD=
xe/ConfigurationManager.c b/Platform/ARM/N1Sdp/ConfigurationManager/Configu=
rationManagerDxe/ConfigurationManager.c
+index e023d47c..36b5fc9e 100644
+--- a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Conf=
igurationManager.c
++++ b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Conf=
igurationManager.c
+@@ -1254,7 +1254,7 @@ InitializePlatformRepository (
+   PlatRepoInfo->MemAffInfo[LOCAL_DDR_REGION2].Length =3D Dram2Size;=0D
+ =0D
+   if (PlatInfo->MultichipMode =3D=3D 1) {=0D
+-    RemoteDdrSize =3D ((PlatInfo->RemoteDdrSize - 2) * SIZE_1GB);=0D
++    RemoteDdrSize =3D ((UINT64)(PlatInfo->RemoteDdrSize - 2) * SIZE_1GB);=
=0D
+ =0D
+     // Update Remote DDR Region1=0D
+     PlatRepoInfo->MemAffInfo[REMOTE_DDR_REGION1].ProximityDomain =3D 1;=0D
+diff --git a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.=
c b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
+index b58bda4b..fbc9b05e 100644
+--- a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
++++ b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
+@@ -157,7 +157,7 @@ ArmPlatformGetVirtualMemoryMap (
+     DramBlock2Size);=0D
+ =0D
+   if (PlatInfo->MultichipMode =3D=3D 1) {=0D
+-    RemoteDdrSize =3D ((PlatInfo->RemoteDdrSize - 2) * SIZE_1GB);=0D
++    RemoteDdrSize =3D ((UINT64)(PlatInfo->RemoteDdrSize - 2) * SIZE_1GB);=
=0D
+ =0D
+     BuildResourceDescriptorHob (=0D
+       EFI_RESOURCE_SYSTEM_MEMORY,=0D
+--=20
+2.37.2
+
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0003-Platfo=
rm-ARM-N1Sdp-Modify-the-IRQ-ID-of-Debug-UART-a.patch b/meta-arm-bsp/recipes=
-bsp/uefi/files/edk2-platforms/0003-Platform-ARM-N1Sdp-Modify-the-IRQ-ID-of=
-Debug-UART-a.patch
new file mode 100644
index 00000000..f0de02eb
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/0003-Platform-ARM-=
N1Sdp-Modify-the-IRQ-ID-of-Debug-UART-a.patch
@@ -0,0 +1,67 @@
+From adc66d99663f71ec97313c40b0d00a908f292c30 Mon Sep 17 00:00:00 2001
+From: Himanshu Sharma <Himanshu.Sharma@arm.com>
+Date: Mon, 30 May 2022 10:53:30 +0000
+Subject: [PATCH 3/3] Platform/ARM/N1Sdp: Modify the IRQ ID of Debug UART a=
nd
+ routing it to IOFPGA UART1
+
+In DBG2 table, IRQ ID was set as 0 for the UART. This overwrote the
+IPI0 trigger method to "level", which prevented SGI0 to be enabled
+again after a CPU offline/online cycle.
+
+This patch fixes the above issue by assigning a reserved IRQ ID
+for the Debug UART, other than 0 and also routing it to use IOFPGA
+UART1 by unsharing it from currently using serial terminal.
+
+Upstream-Status: Pending
+Signed-off-by: Adam Johnston <adam.johnston@arm.com>
+Signed-off-by: Xueliang Zhong <xueliang.zhong@arm.com>
+Signed-off-by: Himanshu Sharma <Himanshu.Sharma@arm.com>
+Change-Id: I6640c3c8f77afd233304ce9cb06dcf80a8659c16
+
+---
+ .../ConfigurationManagerDxe/ConfigurationManager.c        | 2 +-
+ Platform/ARM/N1Sdp/N1SdpPlatform.dsc                      | 8 ++++----
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerD=
xe/ConfigurationManager.c b/Platform/ARM/N1Sdp/ConfigurationManager/Configu=
rationManagerDxe/ConfigurationManager.c
+index 36b5fc9e..e8873200 100644
+--- a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Conf=
igurationManager.c
++++ b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Conf=
igurationManager.c
+@@ -320,7 +320,7 @@ EDKII_PLATFORM_REPOSITORY_INFO N1sdpRepositoryInfo =3D=
 {
+   // Debug Serial Port=0D
+   {=0D
+     FixedPcdGet64 (PcdSerialDbgRegisterBase),               // BaseAddres=
s=0D
+-    0,                                                      // Interrupt =
-unused=0D
++    250,                                                    // Interrupt =
(reserved)=0D
+     FixedPcdGet64 (PcdSerialDbgUartBaudRate),               // BaudRate=0D
+     FixedPcdGet32 (PcdSerialDbgUartClkInHz),                // Clock=0D
+     EFI_ACPI_DBG2_PORT_SUBTYPE_SERIAL_ARM_PL011_UART        // Port subty=
pe=0D
+diff --git a/Platform/ARM/N1Sdp/N1SdpPlatform.dsc b/Platform/ARM/N1Sdp/N1S=
dpPlatform.dsc
+index 865dd04d..878c8f2f 100644
+--- a/Platform/ARM/N1Sdp/N1SdpPlatform.dsc
++++ b/Platform/ARM/N1Sdp/N1SdpPlatform.dsc
+@@ -4,7 +4,7 @@
+ # This provides platform specific component descriptions and libraries th=
at=0D
+ # conform to EFI/Framework standards.=0D
+ #=0D
+-# Copyright (c) 2018 - 2021, ARM Limited. All rights reserved.<BR>=0D
++# Copyright (c) 2018 - 2022, ARM Limited. All rights reserved.<BR>=0D
+ #=0D
+ # SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ #=0D
+@@ -136,9 +136,9 @@
+   gArmPlatformTokenSpaceGuid.PL011UartInterrupt|95=0D
+ =0D
+   # PL011 Serial Debug UART (DBG2)=0D
+-  gArmPlatformTokenSpaceGuid.PcdSerialDbgRegisterBase|gEfiMdeModulePkgTok=
enSpaceGuid.PcdSerialRegisterBase=0D
+-  gArmPlatformTokenSpaceGuid.PcdSerialDbgUartBaudRate|gEfiMdePkgTokenSpac=
eGuid.PcdUartDefaultBaudRate=0D
+-  gArmPlatformTokenSpaceGuid.PcdSerialDbgUartClkInHz|50000000=0D
++  gArmPlatformTokenSpaceGuid.PcdSerialDbgRegisterBase|0x1C0A0000=0D
++  gArmPlatformTokenSpaceGuid.PcdSerialDbgUartBaudRate|115200=0D
++  gArmPlatformTokenSpaceGuid.PcdSerialDbgUartClkInHz|24000000=0D
+ =0D
+   # SBSA Watchdog=0D
+   gArmTokenSpaceGuid.PcdGenericWatchdogEl2IntrNum|93=0D
+--=20
+2.37.2
+
--=20
2.37.3


