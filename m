Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56945C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 14:57:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.92717.1638370655288715413
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Dec 2021 06:57:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5A6A147A
	for <meta-arm@lists.yoctoproject.org>; Wed,  1 Dec 2021 06:57:34 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E99943F766
	for <meta-arm@lists.yoctoproject.org>; Wed,  1 Dec 2021 06:57:33 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/7] arm-bsp/edk2-firmware: drop N1SDP patches
Date: Wed,  1 Dec 2021 14:57:25 +0000
Message-Id: <20211201145729.4138705-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211201145729.4138705-1-ross.burton@arm.com>
References: <20211201145729.4138705-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 01 Dec 2021 14:57:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2503

These patches have been merged into edk2-platforms bd53d309 onwards,
which is built with edk2-firmware 202111.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/uefi/edk2-firmware-n1sdp.inc  |    7 -
 .../n1sdp/Add-mem-regions-to-support.patch    |  216 -
 .../Configuration-Manager-for-N1SDP.patch     | 4111 -----------------
 ...able-N1SDP-platform-specific-configs.patch |  245 -
 .../n1sdp/Introduce-platform-DXE-driver.patch |  122 -
 5 files changed, 4701 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/Add-mem-regio=
ns-to-support.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/Configuration=
-Manager-for-N1SDP.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/Enable-N1SDP-=
platform-specific-configs.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/Introduce-pla=
tform-DXE-driver.patch

diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc b/meta-a=
rm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
index 3749d01e..c8400132 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
@@ -1,10 +1,3 @@
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
-
-SRC_URI:append =3D " file://Add-mem-regions-to-support.patch;patchdir=3D${=
S}/edk2-platforms \
-                   file://Introduce-platform-DXE-driver.patch;patchdir=3D$=
{S}/edk2-platforms \
-                   file://Enable-N1SDP-platform-specific-configs.patch;pat=
chdir=3D${S}/edk2-platforms \
-                   file://Configuration-Manager-for-N1SDP.patch;patchdir=
=3D${S}/edk2-platforms "
-
 # N1SDP specific EDK2 configurations
 EDK2_BUILD_RELEASE =3D "0"
 EDK2_PLATFORM      =3D "n1sdp"
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/Add-mem-regions-to-s=
upport.patch b/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/Add-mem-regions-to=
-support.patch
deleted file mode 100644
index 6f47e2e0..00000000
--- a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/Add-mem-regions-to-support.=
patch
+++ /dev/null
@@ -1,216 +0,0 @@
-From f5ad583b2b3d480ab21682056b56eb59057fca70 Mon Sep 17 00:00:00 2001
-From: Khasim Syed Mohammed <khasim.mohammed@arm.com>
-Date: Tue, 6 Apr 2021 15:06:57 +0530
-Subject: [PATCH 1/4] Silicon/ARM/NeoverseN1Soc: Add mem regions to support=
 C2C
- usecase
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
-
-This patch adds resource descriptor for multi-chip usecase and
-introduces corresponding PCD definitions.
-
-Change-Id: Iadf432a8008f1becf916e21ff84fa1c387b1ceae
-
-Signed-off-by: Chandni Cherukuri <chandni.cherukuri@arm.com>
-Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
----
- .../Library/PlatformLib/PlatformLib.inf       | 14 +++-
- .../Library/PlatformLib/PlatformLibMem.c      | 67 ++++++++++++++++++-
- Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec   | 28 +++++++-
- 3 files changed, 103 insertions(+), 6 deletions(-)
-
-diff --git a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf=
 b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf
-index 166c9e0444..791aeb96ad 100644
---- a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf
-+++ b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf
-@@ -1,6 +1,6 @@
- ## @file=0D
- #=0D
--#  Copyright (c) 2018-2020, ARM Limited. All rights reserved.=0D
-+#  Copyright (c) 2018-2021, ARM Limited. All rights reserved.<BR>=0D
- #=0D
- #  SPDX-License-Identifier: BSD-2-Clause-Patent=0D
- #=0D
-@@ -47,6 +47,18 @@
- =0D
-   gArmNeoverseN1SocTokenSpaceGuid.PcdDramBlock2Base=0D
- =0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdExtMemorySpace=0D
-+=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixBusMax=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixBusMin=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixExpressBaseAddress=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixMmio32Base=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixMmio32Size=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixMmio64Base=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixMmio64Size=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixRootPortConfigBaseAddress=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixRootPortConfigBaseSize=0D
-+=0D
- [Guids]=0D
-   gEfiHobListGuid          ## CONSUMES  ## SystemTable=0D
- =0D
-diff --git a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.=
c b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
-index f9b3d03753..a2785dcfbd 100644
---- a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
-+++ b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
-@@ -1,6 +1,6 @@
- /** @file=0D
- *=0D
--*  Copyright (c) 2018 - 2020, ARM Limited. All rights reserved.=0D
-+*  Copyright (c) 2018 - 2021, ARM Limited. All rights reserved.<BR>=0D
- *=0D
- *  SPDX-License-Identifier: BSD-2-Clause-Patent=0D
- *=0D
-@@ -13,7 +13,7 @@
- #include <NeoverseN1Soc.h>=0D
- =0D
- // The total number of descriptors, including the final "end-of-table" de=
scriptor.=0D
--#define MAX_VIRTUAL_MEMORY_MAP_DESCRIPTORS 13=0D
-+#define MAX_VIRTUAL_MEMORY_MAP_DESCRIPTORS 19=0D
- =0D
- /**=0D
-   Returns the Virtual Memory Map of the platform.=0D
-@@ -35,6 +35,7 @@ ArmPlatformGetVirtualMemoryMap (
-   EFI_RESOURCE_ATTRIBUTE_TYPE   ResourceAttributes;=0D
-   NEOVERSEN1SOC_PLAT_INFO       *PlatInfo;=0D
-   UINT64                        DramBlock2Size;=0D
-+  UINT64                        RemoteDdrSize;=0D
- =0D
-   PlatInfo =3D (NEOVERSEN1SOC_PLAT_INFO *)NEOVERSEN1SOC_PLAT_INFO_STRUCT_=
BASE;=0D
-   DramBlock2Size =3D ((UINT64)(PlatInfo->LocalDdrSize -=0D
-@@ -55,6 +56,24 @@ ArmPlatformGetVirtualMemoryMap (
-     FixedPcdGet64 (PcdDramBlock2Base),=0D
-     DramBlock2Size);=0D
- =0D
-+  if (PlatInfo->MultichipMode =3D=3D 1) {=0D
-+    RemoteDdrSize =3D ((PlatInfo->RemoteDdrSize - 2) * 1024UL * 1024UL * =
1024UL);=0D
-+=0D
-+    BuildResourceDescriptorHob (=0D
-+      EFI_RESOURCE_SYSTEM_MEMORY,=0D
-+      ResourceAttributes,=0D
-+      FixedPcdGet64 (PcdExtMemorySpace) + FixedPcdGet64 (PcdSystemMemoryB=
ase),=0D
-+      PcdGet64 (PcdSystemMemorySize)=0D
-+      );=0D
-+=0D
-+    BuildResourceDescriptorHob (=0D
-+      EFI_RESOURCE_SYSTEM_MEMORY,=0D
-+      ResourceAttributes,=0D
-+      FixedPcdGet64 (PcdExtMemorySpace) + FixedPcdGet64 (PcdDramBlock2Bas=
e),=0D
-+      RemoteDdrSize=0D
-+      );=0D
-+  }=0D
-+=0D
-   ASSERT (VirtualMemoryMap !=3D NULL);=0D
-   Index =3D 0;=0D
- =0D
-@@ -114,6 +133,32 @@ ArmPlatformGetVirtualMemoryMap (
-   VirtualMemoryTable[Index].Length          =3D PcdGet64 (PcdPcieMmio64Si=
ze);=0D
-   VirtualMemoryTable[Index].Attributes      =3D ARM_MEMORY_REGION_ATTRIBU=
TE_DEVICE;=0D
- =0D
-+  // CCIX RC Configuration Space=0D
-+  VirtualMemoryTable[++Index].PhysicalBase  =3D PcdGet32 (PcdCcixRootPort=
ConfigBaseAddress);=0D
-+  VirtualMemoryTable[Index].VirtualBase     =3D PcdGet32 (PcdCcixRootPort=
ConfigBaseAddress);=0D
-+  VirtualMemoryTable[Index].Length          =3D PcdGet32 (PcdCcixRootPort=
ConfigBaseSize);=0D
-+  VirtualMemoryTable[Index].Attributes      =3D ARM_MEMORY_REGION_ATTRIBU=
TE_DEVICE;=0D
-+=0D
-+  // CCIX ECAM Configuration Space=0D
-+  VirtualMemoryTable[++Index].PhysicalBase  =3D PcdGet32 (PcdCcixExpressB=
aseAddress);=0D
-+  VirtualMemoryTable[Index].VirtualBase     =3D PcdGet32 (PcdCcixExpressB=
aseAddress);=0D
-+  VirtualMemoryTable[Index].Length          =3D (FixedPcdGet32 (PcdCcixBu=
sMax) -=0D
-+                                               FixedPcdGet32 (PcdCcixBusM=
in) + 1) *=0D
-+                                               SIZE_1MB;=0D
-+  VirtualMemoryTable[Index].Attributes      =3D ARM_MEMORY_REGION_ATTRIBU=
TE_DEVICE;=0D
-+=0D
-+  // CCIX MMIO32 Memory Space=0D
-+  VirtualMemoryTable[++Index].PhysicalBase  =3D PcdGet32 (PcdCcixMmio32Ba=
se);=0D
-+  VirtualMemoryTable[Index].VirtualBase     =3D PcdGet32 (PcdCcixMmio32Ba=
se);=0D
-+  VirtualMemoryTable[Index].Length          =3D PcdGet32 (PcdCcixMmio32Si=
ze);=0D
-+  VirtualMemoryTable[Index].Attributes      =3D ARM_MEMORY_REGION_ATTRIBU=
TE_DEVICE;=0D
-+=0D
-+ // CCIX MMIO64 Memory Space=0D
-+  VirtualMemoryTable[++Index].PhysicalBase  =3D PcdGet64 (PcdCcixMmio64Ba=
se);=0D
-+  VirtualMemoryTable[Index].VirtualBase     =3D PcdGet64 (PcdCcixMmio64Ba=
se);=0D
-+  VirtualMemoryTable[Index].Length          =3D PcdGet64 (PcdCcixMmio64Si=
ze);=0D
-+  VirtualMemoryTable[Index].Attributes      =3D ARM_MEMORY_REGION_ATTRIBU=
TE_DEVICE;=0D
-+=0D
-   // SubSystem Pheripherals - UART0=0D
-   VirtualMemoryTable[++Index].PhysicalBase  =3D NEOVERSEN1SOC_UART0_BASE;=
=0D
-   VirtualMemoryTable[Index].VirtualBase     =3D NEOVERSEN1SOC_UART0_BASE;=
=0D
-@@ -138,6 +183,24 @@ ArmPlatformGetVirtualMemoryMap (
-   VirtualMemoryTable[Index].Length          =3D NEOVERSEN1SOC_EXP_PERIPH_=
BASE0_SZ;=0D
-   VirtualMemoryTable[Index].Attributes      =3D ARM_MEMORY_REGION_ATTRIBU=
TE_DEVICE;=0D
- =0D
-+  if (PlatInfo->MultichipMode =3D=3D 1) {=0D
-+    //Remote DDR (2GB)=0D
-+    VirtualMemoryTable[++Index].PhysicalBase  =3D PcdGet64 (PcdExtMemoryS=
pace) +=0D
-+                                                PcdGet64 (PcdSystemMemory=
Base);=0D
-+    VirtualMemoryTable[Index].VirtualBase     =3D PcdGet64 (PcdExtMemoryS=
pace) +=0D
-+                                                PcdGet64 (PcdSystemMemory=
Base);=0D
-+    VirtualMemoryTable[Index].Length          =3D PcdGet64 (PcdSystemMemo=
rySize);=0D
-+    VirtualMemoryTable[Index].Attributes      =3D ARM_MEMORY_REGION_ATTRI=
BUTE_WRITE_THROUGH;=0D
-+=0D
-+    //Remote DDR=0D
-+    VirtualMemoryTable[++Index].PhysicalBase  =3D PcdGet64 (PcdExtMemoryS=
pace) +=0D
-+                                                PcdGet64 (PcdDramBlock2Ba=
se);=0D
-+    VirtualMemoryTable[Index].VirtualBase     =3D PcdGet64 (PcdExtMemoryS=
pace) +=0D
-+                                                PcdGet64 (PcdDramBlock2Ba=
se);=0D
-+    VirtualMemoryTable[Index].Length          =3D RemoteDdrSize;=0D
-+    VirtualMemoryTable[Index].Attributes      =3D ARM_MEMORY_REGION_ATTRI=
BUTE_WRITE_THROUGH;=0D
-+  }=0D
-+=0D
-   // End of Table=0D
-   VirtualMemoryTable[++Index].PhysicalBase  =3D 0;=0D
-   VirtualMemoryTable[Index].VirtualBase     =3D 0;=0D
-diff --git a/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec b/Silicon/ARM/Neo=
verseN1Soc/NeoverseN1Soc.dec
-index 54b793a937..aa7c6615d1 100644
---- a/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec
-+++ b/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec
-@@ -1,5 +1,5 @@
- #=0D
--#  Copyright (c) 2018 - 2020, ARM Limited. All rights reserved.=0D
-+#  Copyright (c) 2018 - 2021, ARM Limited. All rights reserved.<BR>=0D
- #=0D
- #  SPDX-License-Identifier: BSD-2-Clause-Patent=0D
- #=0D
-@@ -33,8 +33,8 @@
-   gArmNeoverseN1SocTokenSpaceGuid.PcdPcieBusMax|17|UINT32|0x00000005=0D
-   gArmNeoverseN1SocTokenSpaceGuid.PcdPcieBusMin|0|UINT32|0x00000006=0D
-   gArmNeoverseN1SocTokenSpaceGuid.PcdPcieIoBase|0x0|UINT32|0x00000007=0D
--  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieIoMaxBase|0x00FFFFFF|UINT32|0x00=
000008=0D
--  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieIoSize|0x01000000|UINT32|0x00000=
009=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieIoMaxBase|0x001FFFF|UINT32|0x000=
00008=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieIoSize|0x020000|UINT32|0x0000000=
9=0D
-   gArmNeoverseN1SocTokenSpaceGuid.PcdPcieIoTranslation|0x75200000|UINT32|=
0x0000000A=0D
-   gArmNeoverseN1SocTokenSpaceGuid.PcdPcieMmio32Base|0x71200000|UINT32|0x0=
000000B=0D
-   gArmNeoverseN1SocTokenSpaceGuid.PcdPcieMmio32MaxBase|0x751FFFFF|UINT32|=
0x0000000C=0D
-@@ -44,3 +44,25 @@
-   gArmNeoverseN1SocTokenSpaceGuid.PcdPcieMmio64MaxBase|0x28FFFFFFFF|UINT6=
4|0x00000010=0D
-   gArmNeoverseN1SocTokenSpaceGuid.PcdPcieMmio64Size|0x2000000000|UINT64|0=
x00000011=0D
-   gArmNeoverseN1SocTokenSpaceGuid.PcdPcieMmio64Translation|0x0|UINT64|0x0=
0000012=0D
-+=0D
-+  # CCIX=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixBusCount|18|UINT32|0x00000016=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixBusMax|17|UINT32|0x00000017=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixBusMin|0|UINT32|0x00000018=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixExpressBaseAddress|0x68000000|UI=
NT32|0x00000019=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixIoBase|0x0|UINT32|0x0000001A=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixIoMaxBase|0x01FFFF|UINT32|0x0000=
001B=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixIoSize|0x020000|UINT32|0x0000001=
C=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixIoTranslation|0x6D200000|UINT32|=
0x00000001D=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixMmio32Base|0x69200000|UINT32|0x0=
000001E=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixMmio32MaxBase|0x6D1FFFFF|UINT32|=
0x00000001F=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixMmio32Size|0x04000000|UINT32|0x0=
0000020=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixMmio32Translation|0x0|UINT32|0x0=
0000021=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixMmio64Base|0x2900000000|UINT64|0=
x00000022=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixMmio64MaxBase|0x48FFFFFFFF|UINT6=
4|0x00000023=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixMmio64Size|0x2000000000|UINT64|0=
x00000024=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixMmio64Translation|0x0|UINT64|0x0=
0000025=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixRootPortConfigBaseAddress|0x6200=
0000|UINT32|0x00000026=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixRootPortConfigBaseSize|0x0000100=
0|UINT32|0x00000027=0D
-+=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdExtMemorySpace|0x40000000000|UINT64|=
0x00000029=0D
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/Configuration-Manage=
r-for-N1SDP.patch b/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/Configuration=
-Manager-for-N1SDP.patch
deleted file mode 100644
index d74371e9..00000000
--- a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/Configuration-Manager-for-N=
1SDP.patch
+++ /dev/null
@@ -1,4111 +0,0 @@
-From 007f8e0b68ca39a3155e42707e9d955791eaabcd Mon Sep 17 00:00:00 2001
-From: Khasim Syed Mohammed <khasim.mohammed@arm.com>
-Date: Tue, 6 Apr 2021 15:28:37 +0530
-Subject: [PATCH 4/4] Platform/ARM/N1Sdp: Configuration Manager for N1SDP
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
-
-The dynamic tables framework utilizes the configuration manager
-protocol to get the platform specific information required for
-building the firmware tables.
-
-The configuration manager is a platform specific component that
-collates the platform hardware information and builds an abstract
-platform configuration repository. The configuration manager also
-implements the configuration manager protocol which returns the
-hardware information requested by the table generators.
-
-This patch implements the configuration manager for N1SDP
-platform. It enables support for generating the following
-ACPI tables:
-             1. FACP
-             2. DSDT
-             3. GTDT
-             4. APIC
-             5. SPCR
-             6. DBG2
-             7. PPTT
-             8. IORT
-             9. MCFG
-            10. SSDT - PCI
-            11. SSDT - REMOTE PCI
-
-Also added :
-   ACPI bindings for CoreSight components.
-   Support for Arm CMN-600 PMU
-   HMAT table and expose CCIX memory as EFI_MEMORY_SP
-
-Change-Id: I100d592769642f4a6d18846a66f9f2bb047f0856
-Signed-off-by: Sami Mujawar <sami.mujawar@arm.com>
-Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
-Signed-off-by: Chandni Cherukuri <chandni.cherukuri@arm.com>
-Signed-off-by: Manoj Kumar <manoj.kumar3@arm.com>
-Signed-off-by: Patrik Berglund <patrik.berglund@arm.com>
-Signed-off-by: anukou01 <anurag.koul@arm.com>
-Signed-off-by: Sayanta Pattanayak <sayanta.pattanayak@arm.com>
----
- .../ConfigurationManager.dsc.inc              |   16 +
- .../AslTables/Dsdt.asl                        |  478 ++++
- .../AslTables/SsdtPci.asl                     |  248 ++
- .../AslTables/SsdtRemotePci.asl               |  157 ++
- .../ConfigurationManager.c                    | 2219 +++++++++++++++++
- .../ConfigurationManager.h                    |  310 +++
- .../ConfigurationManagerDxe.inf               |  171 ++
- .../ConfigurationManagerDxe/Hmat.c            |  104 +
- .../ConfigurationManagerDxe/Platform.h        |   92 +
- .../N1Sdp/Drivers/PlatformDxe/PlatformDxe.c   |    1 +
- .../N1Sdp/Drivers/PlatformDxe/PlatformDxe.inf |    4 +
- Platform/ARM/N1Sdp/Include/N1SdpAcpiHeader.h  |   35 +
- Platform/ARM/N1Sdp/N1SdpPlatform.dec          |   12 +-
- Platform/ARM/N1Sdp/N1SdpPlatform.dsc          |    9 +
- Platform/ARM/N1Sdp/N1SdpPlatform.fdf          |    9 +
- Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec   |    5 +
- 16 files changed, 3868 insertions(+), 2 deletions(-)
- create mode 100644 Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationM=
anager.dsc.inc
- create mode 100644 Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationM=
anagerDxe/AslTables/Dsdt.asl
- create mode 100644 Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationM=
anagerDxe/AslTables/SsdtPci.asl
- create mode 100644 Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationM=
anagerDxe/AslTables/SsdtRemotePci.asl
- create mode 100644 Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationM=
anagerDxe/ConfigurationManager.c
- create mode 100644 Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationM=
anagerDxe/ConfigurationManager.h
- create mode 100644 Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationM=
anagerDxe/ConfigurationManagerDxe.inf
- create mode 100644 Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationM=
anagerDxe/Hmat.c
- create mode 100644 Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationM=
anagerDxe/Platform.h
- create mode 100644 Platform/ARM/N1Sdp/Include/N1SdpAcpiHeader.h
-
-diff --git a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManager.=
dsc.inc b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManager.dsc.=
inc
-new file mode 100644
-index 0000000000..bcd4bf334d
---- /dev/null
-+++ b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManager.dsc.inc
-@@ -0,0 +1,16 @@
-+## @file=0D
-+#  dsc include file for Configuration Manager=0D
-+#=0D
-+#  Copyright (c) 2021, ARM Limited. All rights reserved.<BR>=0D
-+#=0D
-+#  SPDX-License-Identifier: BSD-2-Clause-Patent=0D
-+#=0D
-+##=0D
-+=0D
-+[Defines]=0D
-+=0D
-+[BuildOptions]=0D
-+=0D
-+[Components.common]=0D
-+  # Configuration Manager=0D
-+  Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Configu=
rationManagerDxe.inf=0D
-diff --git a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerD=
xe/AslTables/Dsdt.asl b/Platform/ARM/N1Sdp/ConfigurationManager/Configurati=
onManagerDxe/AslTables/Dsdt.asl
-new file mode 100644
-index 0000000000..cfb5dc0dca
---- /dev/null
-+++ b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/AslT=
ables/Dsdt.asl
-@@ -0,0 +1,478 @@
-+/** @file=0D
-+*  Differentiated System Description Table Fields (DSDT)=0D
-+*=0D
-+*  Copyright (c) 2021, ARM Limited. All rights reserved.<BR>=0D
-+*=0D
-+*  SPDX-License-Identifier: BSD-2-Clause-Patent=0D
-+*=0D
-+**/=0D
-+=0D
-+#include "N1SdpAcpiHeader.h"=0D
-+#include "NeoverseN1Soc.h"=0D
-+=0D
-+#define ACPI_GRAPH_REV        0=0D
-+#define ACPI_GRAPH_UUID       "ab02a46b-74c7-45a2-bd68-f7d344ef2153"=0D
-+=0D
-+#define CORESIGHT_GRAPH_UUID  "3ecbc8b6-1d0e-4fb3-8107-e627f805c6cd"=0D
-+=0D
-+#define CS_LINK_MASTER        1=0D
-+#define CS_LINK_SLAVE         0=0D
-+=0D
-+#define DSD_CS_GRAPH_BEGIN(_nports)       \=0D
-+        Package () {                      \=0D
-+          1,                              \=0D
-+          ToUUID(CORESIGHT_GRAPH_UUID),   \=0D
-+          _nports,=0D
-+=0D
-+#define DSD_CS_GRAPH_END  \=0D
-+        }=0D
-+=0D
-+#define DSD_GRAPH_BEGIN(_nports)      \=0D
-+     ToUUID(ACPI_GRAPH_UUID),         \=0D
-+     Package() {                      \=0D
-+       ACPI_GRAPH_REV,                \=0D
-+       1,                             \=0D
-+       DSD_CS_GRAPH_BEGIN(_nports)=0D
-+=0D
-+#define DSD_GRAPH_END     \=0D
-+       DSD_CS_GRAPH_END   \=0D
-+     }=0D
-+=0D
-+#define DSD_PORTS_BEGIN(_nports)    \=0D
-+   Name (_DSD,  Package () {        \=0D
-+     DSD_GRAPH_BEGIN(_nports)=0D
-+=0D
-+#define DSD_PORTS_END     \=0D
-+   DSD_GRAPH_END          \=0D
-+  })=0D
-+=0D
-+#define CS_PORT(_port, _rport, _rphandle, _dir)       \=0D
-+    Package () { _port, _rport, _rphandle, _dir}=0D
-+=0D
-+#define CS_INPUT_PORT(_port, _rport, _rphandle)       \=0D
-+    CS_PORT(_port, _rport, _rphandle, CS_LINK_SLAVE)=0D
-+=0D
-+#define CS_OUTPUT_PORT(_port, _rport, _rphandle)      \=0D
-+    CS_PORT(_port, _rport, _rphandle, CS_LINK_MASTER)=0D
-+=0D
-+DefinitionBlock("Dsdt.aml", "DSDT", 1, "ARMLTD", "N1SDP", EFI_ACPI_ARM_OE=
M_REVISION) {=0D
-+  Scope(_SB) {=0D
-+    Device(CP00) { // Ares-0: Cluster 0, Cpu 0=0D
-+      Name(_HID, "ACPI0007")=0D
-+      Name(_UID, Zero)=0D
-+      Name(_STA, 0xF)=0D
-+      Device(ETM0) { // ETM on Cluster0 CPU0=0D
-+        Name (_HID, "ARMHC500")=0D
-+        Name (_CID, "ARMHC500")=0D
-+        Name (_CRS, ResourceTemplate() {=0D
-+          QWordMemory (=0D
-+            ResourceProducer,=0D
-+            PosDecode,=0D
-+            MinFixed,=0D
-+            MaxFixed,=0D
-+            Cacheable,=0D
-+            ReadWrite,=0D
-+            0x00000000,                                   // Granularity=
=0D
-+            FixedPcdGet64 (PcdCsEtm0Base),                // Min Base Add=
ress=0D
-+            FixedPcdGet64 (PcdCsEtm0MaxBase),             // Max Base Add=
ress=0D
-+            0,                                            // Translate=0D
-+            FixedPcdGet32 (PcdCsComponentSize)            // Length=0D
-+          )=0D
-+        })=0D
-+        DSD_PORTS_BEGIN(1)=0D
-+        CS_OUTPUT_PORT(0, 0, \_SB_.SFN0)=0D
-+        DSD_PORTS_END=0D
-+      } // ETM0=0D
-+    }=0D
-+=0D
-+    Device(CP01) { // Ares-1: Cluster 0, Cpu 1=0D
-+      Name(_HID, "ACPI0007")=0D
-+      Name(_UID, One)=0D
-+      Name(_STA, 0xF)=0D
-+      Device(ETM1) { // ETM on Cluster0 CPU1=0D
-+        Name (_HID, "ARMHC500")=0D
-+        Name (_CID, "ARMHC500")=0D
-+        Name (_CRS, ResourceTemplate() {=0D
-+          QWordMemory (=0D
-+            ResourceProducer,=0D
-+            PosDecode,=0D
-+            MinFixed,=0D
-+            MaxFixed,=0D
-+            Cacheable,=0D
-+            ReadWrite,=0D
-+            0x00000000,                               // Granularity=0D
-+            FixedPcdGet64 (PcdCsEtm1Base),            // Min Base Address=
=0D
-+            FixedPcdGet64 (PcdCsEtm1MaxBase),         // Max Base Address=
=0D
-+            0,                                        // Translate=0D
-+            FixedPcdGet32 (PcdCsComponentSize)        // Length=0D
-+          )=0D
-+        })=0D
-+        DSD_PORTS_BEGIN(1)=0D
-+        CS_OUTPUT_PORT(0, 1, \_SB_.SFN0)=0D
-+        DSD_PORTS_END=0D
-+      } // ETM1=0D
-+    }=0D
-+=0D
-+    Device(CP02) { // Ares-2: Cluster 1, Cpu 0=0D
-+      Name(_HID, "ACPI0007")=0D
-+      Name(_UID, 2)=0D
-+      Name(_STA, 0xF)=0D
-+      Device(ETM2) { // ETM on Cluster1 CPU0=0D
-+        Name (_HID, "ARMHC500")=0D
-+        Name (_CID, "ARMHC500")=0D
-+        Name (_CRS, ResourceTemplate() {=0D
-+          QWordMemory (=0D
-+            ResourceProducer,=0D
-+            PosDecode,=0D
-+            MinFixed,=0D
-+            MaxFixed,=0D
-+            Cacheable,=0D
-+            ReadWrite,=0D
-+            0x00000000,                               // Granularity=0D
-+            FixedPcdGet64 (PcdCsEtm2Base),            // Min Base Address=
=0D
-+            FixedPcdGet64 (PcdCsEtm2MaxBase),         // Max Base Address=
=0D
-+            0,                                        // Translate=0D
-+            FixedPcdGet32 (PcdCsComponentSize)        // Length=0D
-+          )=0D
-+        })=0D
-+        DSD_PORTS_BEGIN(1)=0D
-+        CS_OUTPUT_PORT(0, 0, \_SB_.SFN1)=0D
-+        DSD_PORTS_END=0D
-+      } // ETM2=0D
-+    }=0D
-+=0D
-+    Device(CP03) { // Ares-3: Cluster 1, Cpu 1=0D
-+      Name(_HID, "ACPI0007")=0D
-+      Name(_UID, 3)=0D
-+      Name(_STA, 0xF)=0D
-+      Device(ETM3) { // ETM on Cluster0 CPU0=0D
-+        Name (_HID, "ARMHC500")=0D
-+        Name (_CID, "ARMHC500")=0D
-+        Name (_CRS, ResourceTemplate() {=0D
-+          QWordMemory (=0D
-+            ResourceProducer,=0D
-+            PosDecode,=0D
-+            MinFixed,=0D
-+            MaxFixed,=0D
-+            Cacheable,=0D
-+            ReadWrite,=0D
-+            0x00000000,                               // Granularity=0D
-+            FixedPcdGet64 (PcdCsEtm3Base),            // Min Base Address=
=0D
-+            FixedPcdGet64 (PcdCsEtm3MaxBase),         // Max Base Address=
=0D
-+            0,                                        // Translate=0D
-+            FixedPcdGet32 (PcdCsComponentSize)        // Length=0D
-+          )=0D
-+        })=0D
-+=0D
-+        DSD_PORTS_BEGIN(1)=0D
-+        CS_OUTPUT_PORT(0, 1, \_SB_.SFN1)=0D
-+        DSD_PORTS_END=0D
-+      } // ETM3=0D
-+    }=0D
-+=0D
-+    Device(ETF0) {=0D
-+      Name(_HID, "ARMHC97C")          // TMC=0D
-+      Name(_CID, "ARMHC97C")          // TMC=0D
-+      Name(_CRS, ResourceTemplate() {=0D
-+        QWordMemory (=0D
-+          ResourceProducer,=0D
-+          PosDecode,=0D
-+          MinFixed,=0D
-+          MaxFixed,=0D
-+          Cacheable,=0D
-+          ReadWrite,=0D
-+          0x00000000,                               // Granularity=0D
-+          FixedPcdGet64 (PcdCsEtf0Base),            // Min Base Address=0D
-+          FixedPcdGet64 (PcdCsEtf0MaxBase),         // Max Base Address=0D
-+          0,                                        // Translate=0D
-+          FixedPcdGet32 (PcdCsComponentSize)        // Length=0D
-+        )=0D
-+      })=0D
-+=0D
-+      DSD_PORTS_BEGIN(2)=0D
-+      CS_OUTPUT_PORT(0, 0, \_SB_.FUN),=0D
-+      CS_INPUT_PORT(0, 0, \_SB_.SFN0)=0D
-+      DSD_PORTS_END=0D
-+    } // ETF0=0D
-+=0D
-+    Device(ETF1) {=0D
-+      Name(_HID, "ARMHC97C")          // TMC=0D
-+      Name(_CID, "ARMHC97C")          // TMC=0D
-+      Name(_CRS, ResourceTemplate() {=0D
-+        QWordMemory (=0D
-+          ResourceProducer,=0D
-+          PosDecode,=0D
-+          MinFixed,=0D
-+          MaxFixed,=0D
-+          Cacheable,=0D
-+          ReadWrite,=0D
-+          0x00000000,                               // Granularity=0D
-+          FixedPcdGet64 (PcdCsEtf1Base),            // Min Base Address=0D
-+          FixedPcdGet64 (PcdCsEtf1MaxBase),         // Max Base Address=0D
-+          0,                                        // Translate=0D
-+          FixedPcdGet32 (PcdCsComponentSize)        // Length=0D
-+        )=0D
-+      })=0D
-+=0D
-+      DSD_PORTS_BEGIN(2)=0D
-+      CS_OUTPUT_PORT(0, 1, \_SB_.FUN),=0D
-+      CS_INPUT_PORT(0, 0, \_SB_.SFN1)=0D
-+      DSD_PORTS_END=0D
-+    } // ETF1=0D
-+=0D
-+    Device(ETF2) {=0D
-+      Name(_HID, "ARMHC97C")          // TMC=0D
-+      Name(_CID, "ARMHC97C")          // TMC=0D
-+      Name(_CRS, ResourceTemplate() {=0D
-+        QWordMemory (=0D
-+          ResourceProducer,=0D
-+          PosDecode,=0D
-+          MinFixed,=0D
-+          MaxFixed,=0D
-+          Cacheable,=0D
-+          ReadWrite,=0D
-+          0x00000000,                               // Granularity=0D
-+          FixedPcdGet64 (PcdCsEtf2Base),            // Min Base Address=0D
-+          FixedPcdGet64 (PcdCsEtf2MaxBase),         // Max Base Address=0D
-+          0,                                        // Translate=0D
-+          FixedPcdGet32 (PcdCsComponentSize)        // Length=0D
-+        )=0D
-+      })=0D
-+=0D
-+      DSD_PORTS_BEGIN(2)=0D
-+      CS_OUTPUT_PORT(0, 5, \_SB_.MFUN),=0D
-+      CS_INPUT_PORT(0, 0, \_SB_.STM0)=0D
-+      DSD_PORTS_END=0D
-+    } // ETF2=0D
-+=0D
-+    Device(FUN) {=0D
-+      Name(_HID, "ARMHC9FF")=0D
-+      Name(_CID, "ARMHC9FF")=0D
-+      Name(_CRS, ResourceTemplate() {=0D
-+        QWordMemory (=0D
-+          ResourceProducer,=0D
-+          PosDecode,=0D
-+          MinFixed,=0D
-+          MaxFixed,=0D
-+          Cacheable,=0D
-+          ReadWrite,=0D
-+          0x00000000,                               // Granularity=0D
-+          FixedPcdGet64 (PcdCsFunnel0Base),         // Min Base Address=0D
-+          FixedPcdGet64 (PcdCsFunnel0MaxBase),      // Max Base Address=0D
-+          0,                                        // Translate=0D
-+          FixedPcdGet32 (PcdCsComponentSize)        // Length=0D
-+        )=0D
-+      })=0D
-+      DSD_PORTS_BEGIN(3)=0D
-+      CS_OUTPUT_PORT(0, 0, \_SB_.MFUN),=0D
-+      CS_INPUT_PORT(0, 0, \_SB_.ETF0),=0D
-+      CS_INPUT_PORT(1, 0, \_SB_.ETF1)=0D
-+      DSD_PORTS_END=0D
-+    } // FUN=0D
-+=0D
-+    Device(STM0) {=0D
-+      Name(_HID, "ARMHC502")    // STM=0D
-+      Name(_CID, "ARMHC502")=0D
-+      Name(_CRS, ResourceTemplate() {=0D
-+        QWordMemory (=0D
-+          ResourceProducer,=0D
-+          PosDecode,=0D
-+          MinFixed,=0D
-+          MaxFixed,=0D
-+          Cacheable,=0D
-+          ReadWrite,=0D
-+          0x00000000,                               // Granularity=0D
-+          FixedPcdGet64 (PcdCsStmBase),             // Min Base Address=0D
-+          FixedPcdGet64 (PcdCsStmMaxBase),          // Max Base Address=0D
-+          0,                                        // Translate=0D
-+          FixedPcdGet32 (PcdCsComponentSize)        // Length=0D
-+        )=0D
-+        Memory32Fixed(ReadWrite,=0D
-+                      FixedPcdGet32 (PcdCsStmStimulusBase),=0D
-+                      FixedPcdGet32 (PcdCsStmStimulusSize))=0D
-+      })=0D
-+=0D
-+      DSD_PORTS_BEGIN(1)=0D
-+      CS_OUTPUT_PORT(0, 0, \_SB_.ETF2)=0D
-+      DSD_PORTS_END=0D
-+    }=0D
-+=0D
-+    Device(MFUN) {              // Master Funnel=0D
-+      Name(_HID, "ARMHC9FF")    // Funnel=0D
-+      Name(_CID, "ARMHC9FF")    // Funnel=0D
-+      Name(_CRS, ResourceTemplate() {=0D
-+        QWordMemory (=0D
-+          ResourceProducer,=0D
-+          PosDecode,=0D
-+          MinFixed,=0D
-+          MaxFixed,=0D
-+          Cacheable,=0D
-+          ReadWrite,=0D
-+          0x00000000,                               // Granularity=0D
-+          FixedPcdGet64 (PcdCsFunnel1Base),         // Min Base Address=0D
-+          FixedPcdGet64 (PcdCsFunnel1MaxBase),      // Max Base Address=0D
-+          0,                                        // Translate=0D
-+          FixedPcdGet32 (PcdCsComponentSize)        // Length=0D
-+        )=0D
-+      })=0D
-+=0D
-+      DSD_PORTS_BEGIN(3)=0D
-+      CS_OUTPUT_PORT(0, 0, \_SB_.REP),=0D
-+      CS_INPUT_PORT(0, 0, \_SB_.FUN),=0D
-+      CS_INPUT_PORT(5, 0, \_SB_.ETF2)=0D
-+      DSD_PORTS_END=0D
-+    } // MFUN=0D
-+=0D
-+    Device(REP) {=0D
-+      Name(_HID, "ARMHC98D")          // Replicator=0D
-+      Name(_CID, "ARMHC98D")          // Replicator=0D
-+      Name(_CRS, ResourceTemplate() {=0D
-+        QWordMemory (=0D
-+          ResourceProducer,=0D
-+          PosDecode,=0D
-+          MinFixed,=0D
-+          MaxFixed,=0D
-+          Cacheable,=0D
-+          ReadWrite,=0D
-+          0x00000000,                               // Granularity=0D
-+          FixedPcdGet64 (PcdCsReplicatorBase),      // Min Base Address=0D
-+          FixedPcdGet64 (PcdCsReplicatorMaxBase),   // Max Base Address=0D
-+          0,                                        // Translate=0D
-+          FixedPcdGet32 (PcdCsComponentSize)        // Length=0D
-+        )=0D
-+      })=0D
-+=0D
-+      DSD_PORTS_BEGIN(3)=0D
-+      CS_OUTPUT_PORT(0, 0, \_SB_.TPIU),=0D
-+      CS_OUTPUT_PORT(1, 0, \_SB_.ETR),=0D
-+      CS_INPUT_PORT(0, 0, \_SB_.MFUN)=0D
-+      DSD_PORTS_END=0D
-+    } // REP=0D
-+=0D
-+    Device(TPIU) {=0D
-+      Name(_HID, "ARMHC979")          // TPIU=0D
-+      Name(_CID, "ARMHC979")          // TPIU=0D
-+      Name(_CRS, ResourceTemplate() {=0D
-+        QWordMemory (=0D
-+          ResourceProducer,=0D
-+          PosDecode,=0D
-+          MinFixed,=0D
-+          MaxFixed,=0D
-+          Cacheable,=0D
-+          ReadWrite,=0D
-+          0x00000000,                               // Granularity=0D
-+          FixedPcdGet64 (PcdCsTpiuBase),            // Min Base Address=0D
-+          FixedPcdGet64 (PcdCsTpiuMaxBase),         // Max Base Address=0D
-+          0,                                        // Translate=0D
-+          FixedPcdGet32 (PcdCsComponentSize)        // Length=0D
-+        )=0D
-+      })=0D
-+=0D
-+      DSD_PORTS_BEGIN(1)=0D
-+      CS_INPUT_PORT(0, 0, \_SB_.REP)=0D
-+      DSD_PORTS_END=0D
-+    } // TPIU=0D
-+=0D
-+    Device(ETR) {=0D
-+      Name(_HID, "ARMHC97C")        // TMC=0D
-+      Name(_CID, "ARMHC97C")        // TMC=0D
-+      Name(_CCA, 0)                 // The ETR on this platform is not co=
herent=0D
-+      Name(_CRS, ResourceTemplate() {=0D
-+        QWordMemory (=0D
-+          ResourceProducer,=0D
-+          PosDecode,=0D
-+          MinFixed,=0D
-+          MaxFixed,=0D
-+          Cacheable,=0D
-+          ReadWrite,=0D
-+          0x00000000,                               // Granularity=0D
-+          FixedPcdGet64 (PcdCsEtrBase),             // Min Base Address=0D
-+          FixedPcdGet64 (PcdCsEtrMaxBase),          // Max Base Address=0D
-+          0,                                        // Translate=0D
-+          FixedPcdGet32 (PcdCsComponentSize)        // Length=0D
-+        )=0D
-+      })=0D
-+=0D
-+      Name(_DSD, Package() {=0D
-+         DSD_GRAPH_BEGIN(1)=0D
-+         CS_INPUT_PORT(0, 1, \_SB_.REP)=0D
-+         DSD_GRAPH_END,=0D
-+=0D
-+         ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),=0D
-+         Package() {=0D
-+            Package(2) {"arm,scatter-gather", 1}=0D
-+         }=0D
-+      })=0D
-+=0D
-+    } // ETR=0D
-+=0D
-+    Device(SFN0) {              // Static Funnel 0=0D
-+      Name(_HID, "ARMHC9FE")    // Funnel=0D
-+      Name(_CID, "ARMHC9FE")    // Funnel=0D
-+=0D
-+      DSD_PORTS_BEGIN(3)=0D
-+      CS_OUTPUT_PORT(0, 0, \_SB_.ETF0),=0D
-+      CS_INPUT_PORT(0, 0, \_SB_.CP00.ETM0),=0D
-+      CS_INPUT_PORT(1, 0, \_SB_.CP01.ETM1)=0D
-+      DSD_PORTS_END=0D
-+    } // SFN0=0D
-+=0D
-+    Device(SFN1) {              // Static Funnel 1=0D
-+      Name(_HID, "ARMHC9FE")    // Funnel=0D
-+      Name(_CID, "ARMHC9FE")    // Funnel=0D
-+=0D
-+      DSD_PORTS_BEGIN(3)=0D
-+      CS_OUTPUT_PORT(0, 0, \_SB_.ETF1),=0D
-+      CS_INPUT_PORT(0, 0, \_SB_.CP02.ETM2),=0D
-+      CS_INPUT_PORT(1, 0, \_SB_.CP03.ETM3)=0D
-+      DSD_PORTS_END=0D
-+    } // SFN1=0D
-+=0D
-+    Device(CMN6) {=0D
-+      Name(_HID, "ARMHC600")=0D
-+=0D
-+      Name(_CRS, ResourceTemplate () {=0D
-+        // Region location is platform specific=0D
-+        // Other name(s) of this region: PERIPHBASE=0D
-+        QWordMemory (=0D
-+          ResourceConsumer,=0D
-+          PosDecode,=0D
-+          MinFixed,=0D
-+          MaxFixed,=0D
-+          NonCacheable,=0D
-+          ReadWrite,=0D
-+          0x00000000,=0D
-+          0x50000000,=0D
-+          0x5FFFFFFF,=0D
-+          0x00000000,=0D
-+          0x10000000,=0D
-+          ,=0D
-+          ,=0D
-+          CFGR=0D
-+        )=0D
-+=0D
-+        // Sub-region location is platform specific=0D
-+        // Other name(s) of this region: ROOTNODEBASE=0D
-+        QWordMemory (=0D
-+          ResourceConsumer,=0D
-+          PosDecode,=0D
-+          MinFixed,=0D
-+          MaxFixed,=0D
-+          NonCacheable,=0D
-+          ReadWrite,=0D
-+          0x00000000,=0D
-+          0x50D00000,=0D
-+          0x50D03FFF,=0D
-+          0x00000000,=0D
-+          0x00004000,=0D
-+          ,=0D
-+          ,=0D
-+          ROOT=0D
-+        )=0D
-+=0D
-+        // CMN600_INTREQPMU_DTC0=0D
-+        Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive) { 78 }=
=0D
-+      })=0D
-+    }=0D
-+  } // Scope(_SB)=0D
-+}=0D
-diff --git a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerD=
xe/AslTables/SsdtPci.asl b/Platform/ARM/N1Sdp/ConfigurationManager/Configur=
ationManagerDxe/AslTables/SsdtPci.asl
-new file mode 100644
-index 0000000000..8073df7676
---- /dev/null
-+++ b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/AslT=
ables/SsdtPci.asl
-@@ -0,0 +1,248 @@
-+/** @file=0D
-+*  Secondary System Description Table (SSDT)=0D
-+*=0D
-+*  Copyright (c) 2021, ARM Limited. All rights reserved.<BR>=0D
-+*=0D
-+*  SPDX-License-Identifier: BSD-2-Clause-Patent=0D
-+*=0D
-+**/=0D
-+=0D
-+#include "N1SdpAcpiHeader.h"=0D
-+=0D
-+/*=0D
-+  See ACPI 6.1 Section 6.2.13=0D
-+=0D
-+  There are two ways that _PRT can be used.=0D
-+=0D
-+  In the first model, a PCI Link device is used to provide additional=0D
-+  configuration information such as whether the interrupt is Level or=0D
-+  Edge triggered, it is active High or Low, Shared or Exclusive, etc.=0D
-+=0D
-+  In the second model, the PCI interrupts are hardwired to specific=0D
-+  interrupt inputs on the interrupt controller and are not=0D
-+  configurable. In this case, the Source field in _PRT does not=0D
-+  reference a device, but instead contains the value zero, and the=0D
-+  Source Index field contains the global system interrupt to which the=0D
-+  PCI interrupt is hardwired.=0D
-+=0D
-+  We use the first model with link indirection to set the correct=0D
-+  interrupt type as PCI defaults (Level Triggered, Active Low) are not=0D
-+  compatible with GICv2.=0D
-+*/=0D
-+#define LNK_DEVICE(Unique_Id, Link_Name, irq)                           \=
=0D
-+  Device(Link_Name) {                                                   \=
=0D
-+  Name(_HID, EISAID("PNP0C0F"))                                         \=
=0D
-+  Name(_UID, Unique_Id)                                                 \=
=0D
-+  Name(_PRS, ResourceTemplate() {                                       \=
=0D
-+    Interrupt(ResourceProducer, Level, ActiveHigh, Exclusive) { irq }   \=
=0D
-+    })                                                                  \=
=0D
-+  Method (_CRS, 0) { Return (_PRS) }                                    \=
=0D
-+  Method (_SRS, 1) { }                                                  \=
=0D
-+  Method (_DIS) { }                                                     \=
=0D
-+}=0D
-+=0D
-+#define PRT_ENTRY(Address, Pin, Link)                                    =
               \=0D
-+  Package (4) {                                                          =
               \=0D
-+    Address,  /* uses the same format as _ADR */                         =
               \=0D
-+    Pin,      /* The PCI pin number of the device (0-INTA, 1-INTB, 2-INTC=
, 3-INTD)  */  \=0D
-+    Link,     /* Interrupt allocated via Link device  */                 =
               \=0D
-+    Zero      /* global system interrupt number (no used) */             =
               \=0D
-+}=0D
-+=0D
-+/*=0D
-+  See Reference [1] 6.1.1=0D
-+  "High word-Device #, Low word-Function #. (for example, device 3,=0D
-+  function 2 is 0x00030002). To refer to all the functions on a device #,=
=0D
-+  use a function number of FFFF)."=0D
-+*/=0D
-+#define ROOT_PRT_ENTRY(Pin, Link)   PRT_ENTRY(0x0000FFFF, Pin, Link)  // =
Device 0 for Bridge.=0D
-+=0D
-+DefinitionBlock("SsdtPci.aml", "SSDT", 1, "ARMLTD", "N1SDP",=0D
-+                EFI_ACPI_ARM_OEM_REVISION)=0D
-+{=0D
-+  Scope (_SB) {=0D
-+=0D
-+    // PCI Root Complex=0D
-+    LNK_DEVICE(1, LNKA, 201)=0D
-+    LNK_DEVICE(2, LNKB, 202)=0D
-+    LNK_DEVICE(3, LNKC, 203)=0D
-+    LNK_DEVICE(4, LNKD, 204)=0D
-+    LNK_DEVICE(5, LNKE, 233)=0D
-+    LNK_DEVICE(6, LNKF, 234)=0D
-+    LNK_DEVICE(7, LNKG, 235)=0D
-+    LNK_DEVICE(8, LNKH, 236)=0D
-+=0D
-+    // PCI Root Complex=0D
-+    Device(PCI0) {=0D
-+      Name (_HID, EISAID("PNP0A08")) // PCI Express Root Bridge=0D
-+      Name (_CID, EISAID("PNP0A03")) // Compatible PCI Root Bridge=0D
-+      Name (_SEG, Zero)              // PCI Segment Group number=0D
-+      Name (_BBN, Zero)              // PCI Base Bus Number=0D
-+      Name (_CCA, 1)                 // Cache Coherency Attribute=0D
-+=0D
-+      // Root Complex 0=0D
-+      Device (RP0) {=0D
-+        Name(_ADR, 0xF0000000)    // Dev 0, Func 0=0D
-+      }=0D
-+=0D
-+      // PCI Routing Table=0D
-+      Name(_PRT, Package() {=0D
-+        ROOT_PRT_ENTRY(0, LNKA),   // INTA=0D
-+        ROOT_PRT_ENTRY(1, LNKB),   // INTB=0D
-+        ROOT_PRT_ENTRY(2, LNKC),   // INTC=0D
-+        ROOT_PRT_ENTRY(3, LNKD),   // INTD=0D
-+      })=0D
-+=0D
-+      // Root complex resources=0D
-+      Method (_CRS, 0, Serialized) {=0D
-+        Name (RBUF, ResourceTemplate () {=0D
-+          WordBusNumber (                                       // Bus nu=
mbers assigned to this root=0D
-+            ResourceProducer,=0D
-+            MinFixed,=0D
-+            MaxFixed,=0D
-+            PosDecode,=0D
-+            0,                                                  // Addres=
sGranularity=0D
-+            FixedPcdGet32 (PcdPcieBusMin),                      // Addres=
sMinimum - Minimum Bus Number=0D
-+            FixedPcdGet32 (PcdPcieBusMax),                      // Addres=
sMaximum - Maximum Bus Number=0D
-+            0,                                                  // Addres=
sTranslation - Set to 0=0D
-+            FixedPcdGet32 (PcdPcieBusCount)                     // RangeL=
ength - Number of Busses=0D
-+          )=0D
-+=0D
-+          DWordMemory (                               // 32-bit BAR Windo=
ws=0D
-+            ResourceProducer,=0D
-+            PosDecode,=0D
-+            MinFixed,=0D
-+            MaxFixed,=0D
-+            Cacheable,=0D
-+            ReadWrite,=0D
-+            0x00000000,                               // Granularity=0D
-+            FixedPcdGet32 (PcdPcieMmio32Base),        // Min Base Address=
=0D
-+            FixedPcdGet32 (PcdPcieMmio32MaxBase),     // Max Base Address=
=0D
-+            FixedPcdGet32 (PcdPcieMmio32Translation), // Translate=0D
-+            FixedPcdGet32 (PcdPcieMmio32Size)         // Length=0D
-+          )=0D
-+=0D
-+          QWordMemory (                               // 64-bit BAR Windo=
ws=0D
-+            ResourceProducer,=0D
-+            PosDecode,=0D
-+            MinFixed,=0D
-+            MaxFixed,=0D
-+            Cacheable,=0D
-+            ReadWrite,=0D
-+            0x00000000,                               // Granularity=0D
-+            FixedPcdGet64 (PcdPcieMmio64Base),        // Min Base Address=
=0D
-+            FixedPcdGet64 (PcdPcieMmio64MaxBase),     // Max Base Address=
=0D
-+            FixedPcdGet64 (PcdPcieMmio64Translation), // Translate=0D
-+            FixedPcdGet64 (PcdPcieMmio64Size)         // Length=0D
-+          )=0D
-+=0D
-+          DWordIo (                                   // IO window=0D
-+            ResourceProducer,=0D
-+            MinFixed,=0D
-+            MaxFixed,=0D
-+            PosDecode,=0D
-+            EntireRange,=0D
-+            0x00000000,                               // Granularity=0D
-+            FixedPcdGet32 (PcdPcieIoBase),            // Min Base Address=
=0D
-+            FixedPcdGet32 (PcdPcieIoMaxBase),         // Max Base Address=
=0D
-+            FixedPcdGet32 (PcdPcieIoTranslation),     // Translate=0D
-+            FixedPcdGet32 (PcdPcieIoSize),            // Length=0D
-+            ,=0D
-+            ,=0D
-+            ,=0D
-+            TypeTranslation=0D
-+          )=0D
-+        }) // Name(RBUF)=0D
-+=0D
-+        Return (RBUF)=0D
-+      } // Method (_CRS)=0D
-+    }=0D
-+=0D
-+  // CCIX Root Complex=0D
-+    Device(PCI1) {=0D
-+      Name (_HID, EISAID("PNP0A08")) // PCI Express Root Bridge=0D
-+      Name (_CID, EISAID("PNP0A03")) // Compatible PCI Root Bridge=0D
-+      Name (_SEG, 1)                 // PCI Segment Group number=0D
-+      Name (_BBN, Zero)              // PCI Base Bus Number=0D
-+      Name (_CCA, 1)                 // Cache Coherency Attribute=0D
-+=0D
-+    // Root Complex 1=0D
-+      Device (RP1) {=0D
-+        Name(_ADR, 0xF0000000)    // Dev 0, Func 0=0D
-+      }=0D
-+=0D
-+    // PCI Routing Table=0D
-+        Name(_PRT, Package() {=0D
-+         ROOT_PRT_ENTRY(0, LNKE),   // INTA=0D
-+         ROOT_PRT_ENTRY(1, LNKF),   // INTB=0D
-+         ROOT_PRT_ENTRY(2, LNKG),   // INTC=0D
-+         ROOT_PRT_ENTRY(3, LNKH),   // INTD=0D
-+        })=0D
-+=0D
-+    // Root complex resources=0D
-+      Method (_CRS, 0, Serialized) {=0D
-+        Name (RBUF, ResourceTemplate () {=0D
-+          WordBusNumber (      // Bus numbers assigned to this root=0D
-+            ResourceProducer,=0D
-+            MinFixed,=0D
-+            MaxFixed,=0D
-+            PosDecode,=0D
-+            0,                                                  // Addres=
sGranularity=0D
-+            FixedPcdGet32 (PcdCcixBusMin),                      // Addres=
sMinimum - Minimum Bus Number=0D
-+            FixedPcdGet32 (PcdCcixBusMax),                      // Addres=
sMaximum - Maximum Bus Number=0D
-+            0,                                                  // Addres=
sTranslation - Set to 0=0D
-+            FixedPcdGet32 (PcdCcixBusCount)                     // RangeL=
ength - Number of Busses=0D
-+          )=0D
-+=0D
-+          DWordMemory (        // 32-bit BAR Windows=0D
-+            ResourceProducer,=0D
-+            PosDecode,=0D
-+            MinFixed,=0D
-+            MaxFixed,=0D
-+            Cacheable,=0D
-+            ReadWrite,=0D
-+            0x00000000,        // Granularity=0D
-+            FixedPcdGet32 (PcdCcixMmio32Base),        // Min Base Address=
=0D
-+            FixedPcdGet32 (PcdCcixMmio32MaxBase),     // Max Base Address=
=0D
-+            FixedPcdGet32 (PcdCcixMmio32Translation), // Translate=0D
-+            FixedPcdGet32 (PcdCcixMmio32Size)         // Length=0D
-+          )=0D
-+=0D
-+          QWordMemory (        // 64-bit BAR Windows=0D
-+            ResourceProducer,=0D
-+            PosDecode,=0D
-+            MinFixed,=0D
-+            MaxFixed,=0D
-+            Cacheable,=0D
-+            ReadWrite,=0D
-+            0x00000000,        // Granularity=0D
-+            FixedPcdGet64 (PcdCcixMmio64Base),        // Min Base Address=
=0D
-+            FixedPcdGet64 (PcdCcixMmio64MaxBase),     // Max Base Address=
=0D
-+            FixedPcdGet64 (PcdCcixMmio64Translation), // Translate=0D
-+            FixedPcdGet64 (PcdCcixMmio64Size)         // Length=0D
-+          )=0D
-+=0D
-+          DWordIo (             // IO window=0D
-+            ResourceProducer,=0D
-+            MinFixed,=0D
-+            MaxFixed,=0D
-+            PosDecode,=0D
-+            EntireRange,=0D
-+            0x00000000,         // Granularity=0D
-+            FixedPcdGet32 (PcdCcixIoBase),            // Min Base Address=
=0D
-+            FixedPcdGet32 (PcdCcixIoMaxBase),         // Max Base Address=
=0D
-+            FixedPcdGet32 (PcdCcixIoTranslation),     // Translate=0D
-+            FixedPcdGet32 (PcdCcixIoSize),            // Length=0D
-+            ,=0D
-+            ,=0D
-+            ,=0D
-+            TypeTranslation=0D
-+          )=0D
-+        }) // Name(RBUF)=0D
-+=0D
-+        Return (RBUF)=0D
-+      } // Method (_CRS)=0D
-+    }=0D
-+=0D
-+  }=0D
-+}=0D
-diff --git a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerD=
xe/AslTables/SsdtRemotePci.asl b/Platform/ARM/N1Sdp/ConfigurationManager/Co=
nfigurationManagerDxe/AslTables/SsdtRemotePci.asl
-new file mode 100644
-index 0000000000..630b9accbf
---- /dev/null
-+++ b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/AslT=
ables/SsdtRemotePci.asl
-@@ -0,0 +1,157 @@
-+/** @file=0D
-+*  Secondary System Description Table (SSDT)=0D
-+*=0D
-+*  Copyright (c) 2021, ARM Limited. All rights reserved.<BR>=0D
-+*=0D
-+*  SPDX-License-Identifier: BSD-2-Clause-Patent=0D
-+*=0D
-+**/=0D
-+=0D
-+#include "N1SdpAcpiHeader.h"=0D
-+=0D
-+/*=0D
-+  See ACPI 6.1 Section 6.2.13=0D
-+=0D
-+  There are two ways that _PRT can be used.=0D
-+=0D
-+  In the first model, a PCI Link device is used to provide additional=0D
-+  configuration information such as whether the interrupt is Level or=0D
-+  Edge triggered, it is active High or Low, Shared or Exclusive, etc.=0D
-+=0D
-+  In the second model, the PCI interrupts are hardwired to specific=0D
-+  interrupt inputs on the interrupt controller and are not=0D
-+  configurable. In this case, the Source field in _PRT does not=0D
-+  reference a device, but instead contains the value zero, and the=0D
-+  Source Index field contains the global system interrupt to which the=0D
-+  PCI interrupt is hardwired.=0D
-+=0D
-+  We use the first model with link indirection to set the correct=0D
-+  interrupt type as PCI defaults (Level Triggered, Active Low) are not=0D
-+  compatible with GICv2.=0D
-+*/=0D
-+#define LNK_DEVICE(Unique_Id, Link_Name, irq)                           \=
=0D
-+  Device(Link_Name) {                                                   \=
=0D
-+  Name(_HID, EISAID("PNP0C0F"))                                         \=
=0D
-+  Name(_UID, Unique_Id)                                                 \=
=0D
-+  Name(_PRS, ResourceTemplate() {                                       \=
=0D
-+    Interrupt(ResourceProducer, Level, ActiveHigh, Exclusive) { irq }   \=
=0D
-+    })                                                                  \=
=0D
-+  Method (_CRS, 0) { Return (_PRS) }                                    \=
=0D
-+  Method (_SRS, 1) { }                                                  \=
=0D
-+  Method (_DIS) { }                                                     \=
=0D
-+}=0D
-+=0D
-+#define PRT_ENTRY(Address, Pin, Link)                                    =
               \=0D
-+  Package (4) {                                                          =
               \=0D
-+    Address,  /* uses the same format as _ADR */                         =
               \=0D
-+    Pin,      /* The PCI pin number of the device (0-INTA, 1-INTB, 2-INTC=
, 3-INTD)  */  \=0D
-+    Link,     /* Interrupt allocated via Link device  */                 =
               \=0D
-+    Zero      /* global system interrupt number (no used) */             =
               \=0D
-+}=0D
-+=0D
-+/*=0D
-+  See Reference [1] 6.1.1=0D
-+  "High word-Device #, Low word-Function #. (for example, device 3,=0D
-+  function 2 is 0x00030002). To refer to all the functions on a device #,=
=0D
-+  use a function number of FFFF)."=0D
-+*/=0D
-+#define ROOT_PRT_ENTRY(Pin, Link)   PRT_ENTRY(0x0000FFFF, Pin, Link)  // =
Device 0 for Bridge.=0D
-+=0D
-+DefinitionBlock("SsdtRemotePci.aml", "SSDT", 1, "ARMLTD", "N1SDP",=0D
-+                EFI_ACPI_ARM_OEM_REVISION)=0D
-+{=0D
-+  Scope (_SB) {=0D
-+=0D
-+    // Remote PCI Root Complex=0D
-+    LNK_DEVICE(9, LNKI, 681)=0D
-+    LNK_DEVICE(10, LNKJ, 682)=0D
-+    LNK_DEVICE(11, LNKK, 683)=0D
-+    LNK_DEVICE(12, LNKL, 684)=0D
-+=0D
-+    //Remote PCIe root complex=0D
-+      Device(PCI2) {=0D
-+      Name (_HID, EISAID("PNP0A08")) // PCI Express Root Bridge=0D
-+      Name (_CID, EISAID("PNP0A03")) // Compatible PCI Root Bridge=0D
-+      Name (_SEG, 2)                 // PCI Segment Group number=0D
-+      Name (_BBN, Zero)              // PCI Base Bus Number=0D
-+      Name (_CCA, 1)                 // Cache Coherency Attribute=0D
-+=0D
-+      // Remote Root Complex 0=0D
-+      Device (RP0) {=0D
-+        Name(_ADR, 0xF0000000)    // Dev 0, Func 0=0D
-+      }=0D
-+=0D
-+      // PCI Routing Table=0D
-+      Name(_PRT, Package() {=0D
-+        ROOT_PRT_ENTRY(0, LNKI),   // INTA=0D
-+        ROOT_PRT_ENTRY(1, LNKJ),   // INTB=0D
-+        ROOT_PRT_ENTRY(2, LNKK),   // INTC=0D
-+        ROOT_PRT_ENTRY(3, LNKL),   // INTD=0D
-+      })=0D
-+=0D
-+      // Root complex resources=0D
-+      Method (_CRS, 0, Serialized) {=0D
-+        Name (RBUF, ResourceTemplate () {=0D
-+          WordBusNumber (                                       // Bus nu=
mbers assigned to this root=0D
-+            ResourceProducer,=0D
-+            MinFixed,=0D
-+            MaxFixed,=0D
-+            PosDecode,=0D
-+            0,                                                  // Addres=
sGranularity=0D
-+            FixedPcdGet32 (PcdPcieBusMin),                      // Addres=
sMinimum - Minimum Bus Number=0D
-+            FixedPcdGet32 (PcdPcieBusMax),                      // Addres=
sMaximum - Maximum Bus Number=0D
-+            0,                                                  // Addres=
sTranslation - Set to 0=0D
-+            FixedPcdGet32 (PcdPcieBusCount)                     // RangeL=
ength - Number of Busses=0D
-+          )=0D
-+=0D
-+          QWordMemory (                               // 32-bit BAR Windo=
ws=0D
-+            ResourceProducer,=0D
-+            PosDecode,=0D
-+            MinFixed,=0D
-+            MaxFixed,=0D
-+            Cacheable,=0D
-+            ReadWrite,=0D
-+            0x00000000,                               // Granularity=0D
-+            FixedPcdGet32 (PcdPcieMmio32Base),        // Min Base Address=
=0D
-+            FixedPcdGet32 (PcdPcieMmio32MaxBase),     // Max Base Address=
=0D
-+            FixedPcdGet32 (PcdRemotePcieMmio32Translation), // Translate=
=0D
-+            FixedPcdGet32 (PcdPcieMmio32Size)         // Length=0D
-+          )=0D
-+=0D
-+          QWordMemory (                               // 64-bit BAR Windo=
ws=0D
-+            ResourceProducer,=0D
-+            PosDecode,=0D
-+            MinFixed,=0D
-+            MaxFixed,=0D
-+            Cacheable,=0D
-+            ReadWrite,=0D
-+            0x00000000,                               // Granularity=0D
-+            FixedPcdGet64 (PcdPcieMmio64Base),        // Min Base Address=
=0D
-+            FixedPcdGet64 (PcdPcieMmio64MaxBase),     // Max Base Address=
=0D
-+            FixedPcdGet64 (PcdRemotePcieMmio64Translation), // Translate=
=0D
-+            FixedPcdGet64 (PcdPcieMmio64Size)         // Length=0D
-+          )=0D
-+=0D
-+          QWordIo (                                   // IO window=0D
-+            ResourceProducer,=0D
-+            MinFixed,=0D
-+            MaxFixed,=0D
-+            PosDecode,=0D
-+            EntireRange,=0D
-+            0x00000000,                               // Granularity=0D
-+            FixedPcdGet32 (PcdPcieIoBase),            // Min Base Address=
=0D
-+            FixedPcdGet32 (PcdPcieIoMaxBase),         // Max Base Address=
=0D
-+            FixedPcdGet64 (PcdRemotePcieIoTranslation),     // Translate=
=0D
-+            FixedPcdGet32 (PcdPcieIoSize),            // Length=0D
-+            ,=0D
-+            ,=0D
-+            ,=0D
-+            TypeTranslation=0D
-+          )=0D
-+        }) // Name(RBUF)=0D
-+=0D
-+        Return (RBUF)=0D
-+      } // Method (_CRS)=0D
-+    }=0D
-+  }=0D
-+}=0D
-diff --git a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerD=
xe/ConfigurationManager.c b/Platform/ARM/N1Sdp/ConfigurationManager/Configu=
rationManagerDxe/ConfigurationManager.c
-new file mode 100644
-index 0000000000..2b320ecbeb
---- /dev/null
-+++ b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Conf=
igurationManager.c
-@@ -0,0 +1,2219 @@
-+/** @file=0D
-+  Configuration Manager Dxe=0D
-+=0D
-+  Copyright (c) 2021, ARM Limited. All rights reserved.<BR>=0D
-+=0D
-+  SPDX-License-Identifier: BSD-2-Clause-Patent=0D
-+=0D
-+  @par Glossary:=0D
-+    - Cm or CM   - Configuration Manager=0D
-+    - Obj or OBJ - Object=0D
-+**/=0D
-+=0D
-+#include <IndustryStandard/DebugPort2Table.h>=0D
-+#include <IndustryStandard/SerialPortConsoleRedirectionTable.h>=0D
-+#include <IndustryStandard/IoRemappingTable.h>=0D
-+#include <IndustryStandard/MemoryMappedConfigurationSpaceAccessTable.h>=0D
-+#include <Library/IoLib.h>=0D
-+#include <Library/ArmLib.h>=0D
-+#include <Library/DebugLib.h>=0D
-+#include <Library/IoLib.h>=0D
-+#include <Library/PcdLib.h>=0D
-+#include <Library/UefiBootServicesTableLib.h>=0D
-+#include <Protocol/AcpiTable.h>=0D
-+#include <Protocol/ConfigurationManagerProtocol.h>=0D
-+#include <NeoverseN1Soc.h>=0D
-+#include "N1SdpAcpiHeader.h"=0D
-+#include "ConfigurationManager.h"=0D
-+#include "Platform.h"=0D
-+=0D
-+extern struct EFI_ACPI_HETEROGENEOUS_MEMORY_ATTRIBUTE_TABLE Hmat;=0D
-+=0D
-+/** The platform configuration repository information.=0D
-+*/=0D
-+STATIC=0D
-+EDKII_PLATFORM_REPOSITORY_INFO N1sdpRepositoryInfo =3D {=0D
-+  // Configuration Manager information=0D
-+  { CONFIGURATION_MANAGER_REVISION, CFG_MGR_OEM_ID },=0D
-+=0D
-+  // ACPI Table List=0D
-+  {=0D
-+    // FADT Table=0D
-+    {=0D
-+      EFI_ACPI_6_3_FIXED_ACPI_DESCRIPTION_TABLE_SIGNATURE,=0D
-+      EFI_ACPI_6_3_FIXED_ACPI_DESCRIPTION_TABLE_REVISION,=0D
-+      CREATE_STD_ACPI_TABLE_GEN_ID (EStdAcpiTableIdFadt),=0D
-+      NULL=0D
-+    },=0D
-+    // GTDT Table=0D
-+    {=0D
-+      EFI_ACPI_6_3_GENERIC_TIMER_DESCRIPTION_TABLE_SIGNATURE,=0D
-+      EFI_ACPI_6_3_GENERIC_TIMER_DESCRIPTION_TABLE_REVISION,=0D
-+      CREATE_STD_ACPI_TABLE_GEN_ID (EStdAcpiTableIdGtdt),=0D
-+      NULL=0D
-+    },=0D
-+    // MADT Table=0D
-+    {=0D
-+      EFI_ACPI_6_3_MULTIPLE_APIC_DESCRIPTION_TABLE_SIGNATURE,=0D
-+      EFI_ACPI_6_3_MULTIPLE_APIC_DESCRIPTION_TABLE_REVISION,=0D
-+      CREATE_STD_ACPI_TABLE_GEN_ID (EStdAcpiTableIdMadt),=0D
-+      NULL=0D
-+    },=0D
-+    // SPCR Table=0D
-+    {=0D
-+      EFI_ACPI_6_3_SERIAL_PORT_CONSOLE_REDIRECTION_TABLE_SIGNATURE,=0D
-+      EFI_ACPI_SERIAL_PORT_CONSOLE_REDIRECTION_TABLE_REVISION,=0D
-+      CREATE_STD_ACPI_TABLE_GEN_ID (EStdAcpiTableIdSpcr),=0D
-+      NULL=0D
-+    },=0D
-+    // DSDT Table=0D
-+    {=0D
-+      EFI_ACPI_6_3_DIFFERENTIATED_SYSTEM_DESCRIPTION_TABLE_SIGNATURE,=0D
-+      0, // Unused=0D
-+      CREATE_STD_ACPI_TABLE_GEN_ID (EStdAcpiTableIdDsdt),=0D
-+      (EFI_ACPI_DESCRIPTION_HEADER*)dsdt_aml_code=0D
-+    },=0D
-+    // DBG2 Table=0D
-+    {=0D
-+      EFI_ACPI_6_3_DEBUG_PORT_2_TABLE_SIGNATURE,=0D
-+      EFI_ACPI_DBG2_DEBUG_DEVICE_INFORMATION_STRUCT_REVISION,=0D
-+      CREATE_STD_ACPI_TABLE_GEN_ID (EStdAcpiTableIdDbg2),=0D
-+      NULL=0D
-+    },=0D
-+    // PPTT Table=0D
-+    {=0D
-+      EFI_ACPI_6_3_PROCESSOR_PROPERTIES_TOPOLOGY_TABLE_STRUCTURE_SIGNATUR=
E,=0D
-+      EFI_ACPI_6_3_PROCESSOR_PROPERTIES_TOPOLOGY_TABLE_REVISION,=0D
-+      CREATE_STD_ACPI_TABLE_GEN_ID (EStdAcpiTableIdPptt),=0D
-+      NULL=0D
-+    },=0D
-+    // IORT Table=0D
-+    {=0D
-+      EFI_ACPI_6_3_IO_REMAPPING_TABLE_SIGNATURE,=0D
-+      EFI_ACPI_IO_REMAPPING_TABLE_REVISION,=0D
-+      CREATE_STD_ACPI_TABLE_GEN_ID (EStdAcpiTableIdIort),=0D
-+      NULL=0D
-+    },=0D
-+    // PCI MCFG Table=0D
-+    {=0D
-+      EFI_ACPI_6_3_PCI_EXPRESS_MEMORY_MAPPED_CONFIGURATION_SPACE_BASE_ADD=
RESS_DESCRIPTION_TABLE_SIGNATURE,=0D
-+      EFI_ACPI_MEMORY_MAPPED_CONFIGURATION_SPACE_ACCESS_TABLE_REVISION,=0D
-+      CREATE_STD_ACPI_TABLE_GEN_ID (EStdAcpiTableIdMcfg),=0D
-+      NULL,=0D
-+      SIGNATURE_64 ('A','R','M','N','1','S','D','P'),=0D
-+      0x20181101 // The Linux kernel patch for MCFG is applied only when=
=0D
-+                 // the OemRevision is 0x20181101=0D
-+    },=0D
-+    // SSDT table describing the PCI root complex=0D
-+    {=0D
-+      EFI_ACPI_6_3_SECONDARY_SYSTEM_DESCRIPTION_TABLE_SIGNATURE,=0D
-+      0, // Unused=0D
-+      CREATE_STD_ACPI_TABLE_GEN_ID (EStdAcpiTableIdSsdt),=0D
-+      (EFI_ACPI_DESCRIPTION_HEADER*)ssdtpci_aml_code=0D
-+    },=0D
-+    // SRAT Table=0D
-+    {=0D
-+      EFI_ACPI_6_3_SYSTEM_RESOURCE_AFFINITY_TABLE_SIGNATURE,=0D
-+      EFI_ACPI_6_3_SYSTEM_RESOURCE_AFFINITY_TABLE_REVISION,=0D
-+      CREATE_STD_ACPI_TABLE_GEN_ID (EStdAcpiTableIdSrat),=0D
-+      NULL=0D
-+    },=0D
-+    // HMAT Table=0D
-+    {=0D
-+      EFI_ACPI_6_3_HETEROGENEOUS_MEMORY_ATTRIBUTE_TABLE_SIGNATURE,=0D
-+      EFI_ACPI_6_3_HETEROGENEOUS_MEMORY_ATTRIBUTE_TABLE_REVISION,=0D
-+      CREATE_STD_ACPI_TABLE_GEN_ID (EStdAcpiTableIdRaw),=0D
-+      (EFI_ACPI_DESCRIPTION_HEADER*)&Hmat=0D
-+    },=0D
-+    // SSDT table describing the Remote Chip PCI root complex=0D
-+    {=0D
-+      EFI_ACPI_6_3_SECONDARY_SYSTEM_DESCRIPTION_TABLE_SIGNATURE,=0D
-+      0, // Unused=0D
-+      CREATE_STD_ACPI_TABLE_GEN_ID (EStdAcpiTableIdSsdt),=0D
-+      (EFI_ACPI_DESCRIPTION_HEADER*)ssdtremotepci_aml_code=0D
-+    },=0D
-+  },=0D
-+=0D
-+  // Boot architecture information=0D
-+  { EFI_ACPI_6_3_ARM_PSCI_COMPLIANT },              // BootArchFlags=0D
-+=0D
-+#ifdef HEADLESS_PLATFORM=0D
-+  // Fixed feature flag information=0D
-+  { EFI_ACPI_6_3_HEADLESS },                        // Fixed feature flag=
s=0D
-+#endif=0D
-+=0D
-+  // Power management profile information=0D
-+  { EFI_ACPI_6_3_PM_PROFILE_ENTERPRISE_SERVER },    // PowerManagement Pr=
ofile=0D
-+=0D
-+  /* GIC CPU Interface information=0D
-+     GIC_ENTRY (CPUInterfaceNumber, Mpidr, PmuIrq, VGicIrq, GicRedistBase=
,=0D
-+                EnergyEfficiency, SpeIrq, ProximityDomain, ClockDomain)=0D
-+  */=0D
-+  {=0D
-+    GICC_ENTRY (0, GET_MPID3 (0x0, 0x0, 0x0, 0x0), 23, 25, 0, 0, 21, 0, 0=
),=0D
-+    GICC_ENTRY (1, GET_MPID3 (0x0, 0x0, 0x1, 0x0), 23, 25, 0, 0, 21, 0, 0=
),=0D
-+    GICC_ENTRY (2, GET_MPID3 (0x0, 0x1, 0x0, 0x0), 23, 25, 0, 0, 21, 0, 0=
),=0D
-+    GICC_ENTRY (3, GET_MPID3 (0x0, 0x1, 0x1, 0x0), 23, 25, 0, 0, 21, 0, 0=
),=0D
-+    GICC_ENTRY (4, GET_MPID3 (0x1, 0x0, 0x0, 0x0), 23, 25, 0, 0, 21, 1, 0=
),=0D
-+    GICC_ENTRY (5, GET_MPID3 (0x1, 0x0, 0x1, 0x0), 23, 25, 0, 0, 21, 1, 0=
),=0D
-+    GICC_ENTRY (6, GET_MPID3 (0x1, 0x1, 0x0, 0x0), 23, 25, 0, 0, 21, 1, 0=
),=0D
-+    GICC_ENTRY (7, GET_MPID3 (0x1, 0x1, 0x1, 0x0), 23, 25, 0, 0, 21, 1, 0=
),=0D
-+  },=0D
-+=0D
-+  // GIC Distributor Info=0D
-+  {=0D
-+    FixedPcdGet64 (PcdGicDistributorBase),  // UINT64  PhysicalBaseAddres=
s=0D
-+    0,                                      // UINT32  SystemVectorBase=0D
-+    3                                       // UINT8   GicVersion=0D
-+  },=0D
-+=0D
-+  // GIC Re-Distributor Info=0D
-+  {=0D
-+    {=0D
-+      // UINT64  DiscoveryRangeBaseAddress=0D
-+      FixedPcdGet64 (PcdGicRedistributorsBase),=0D
-+      // UINT32  DiscoveryRangeLength=0D
-+      SIZE_1MB=0D
-+    },=0D
-+    {=0D
-+      // UINT64  DiscoveryRangeBaseAddress=0D
-+      FixedPcdGet64 (PcdGicRedistributorsBase) + (1ULL << 42),=0D
-+      // UINT32  DiscoveryRangeLength=0D
-+      SIZE_1MB=0D
-+    },=0D
-+  },=0D
-+=0D
-+  // GIC ITS=0D
-+  {=0D
-+    // GIC ITS - CCIX TCU=0D
-+    {=0D
-+      // The GIC ITS ID.=0D
-+      0,=0D
-+      // The physical address for the Interrupt Translation Service=0D
-+      0x30040000,=0D
-+      //Proximity Domain=0D
-+      0=0D
-+    },=0D
-+    // GIC ITS - PCIe TCU=0D
-+    {=0D
-+      // The GIC ITS ID.=0D
-+      1,=0D
-+      // The physical address for the Interrupt Translation Service=0D
-+      0x30060000,=0D
-+      //Proximity Domain=0D
-+      0=0D
-+    },=0D
-+    // GIC ITS - CCIX RC=0D
-+    {=0D
-+      // The GIC ITS ID.=0D
-+      2,=0D
-+      // The physical address for the Interrupt Translation Service=0D
-+      0x30080000,=0D
-+      //Proximity Domain=0D
-+      0=0D
-+    },=0D
-+    // GIC ITS - PCIe RC=0D
-+    {=0D
-+      // The GIC ITS ID.=0D
-+      3,=0D
-+      // The physical address for the Interrupt Translation Service=0D
-+      0x300A0000,=0D
-+      //Proximity Domain=0D
-+      0=0D
-+    },=0D
-+    //Remote chip GIC ITS - PCIe TCU=0D
-+    {=0D
-+     ITS_REMOTE_SMMU_PCIE,=0D
-+     0x40030060000,=0D
-+     1=0D
-+    },=0D
-+    //Remote chip GIC ITS - PCIe RC=0D
-+    {=0D
-+     ITS_REMOTE_PCIE,=0D
-+     0x400300a0000,=0D
-+     1=0D
-+    },=0D
-+  },=0D
-+=0D
-+  // Generic Timer Info=0D
-+  {=0D
-+    // The physical base address for the counter control frame=0D
-+    N1SDP_SYSTEM_TIMER_BASE_ADDRESS,=0D
-+    // The physical base address for the counter read frame=0D
-+    N1SDP_CNT_READ_BASE_ADDRESS,=0D
-+    // The secure PL1 timer interrupt=0D
-+    FixedPcdGet32 (PcdArmArchTimerSecIntrNum),=0D
-+    // The secure PL1 timer flags=0D
-+    N1SDP_GTDT_GTIMER_FLAGS,=0D
-+    // The non-secure PL1 timer interrupt=0D
-+    FixedPcdGet32 (PcdArmArchTimerIntrNum),=0D
-+    // The non-secure PL1 timer flags=0D
-+    N1SDP_GTDT_GTIMER_FLAGS,=0D
-+    // The virtual timer interrupt=0D
-+    FixedPcdGet32 (PcdArmArchTimerVirtIntrNum),=0D
-+    // The virtual timer flags=0D
-+    N1SDP_GTDT_GTIMER_FLAGS,=0D
-+    // The non-secure PL2 timer interrupt=0D
-+    FixedPcdGet32 (PcdArmArchTimerHypIntrNum),=0D
-+    // The non-secure PL2 timer flags=0D
-+    N1SDP_GTDT_GTIMER_FLAGS=0D
-+  },=0D
-+=0D
-+  // Generic Timer Block Information=0D
-+  {=0D
-+    {=0D
-+      // The physical base address for the GT Block Timer structure=0D
-+      N1SDP_GT_BLOCK_CTL_BASE,=0D
-+      // The number of timer frames implemented in the GT Block=0D
-+      N1SDP_TIMER_FRAMES_COUNT,=0D
-+      // Reference token for the GT Block timer frame list=0D
-+      REFERENCE_TOKEN (GTBlock0TimerInfo)=0D
-+    }=0D
-+  },=0D
-+=0D
-+  // GT Block Timer Frames=0D
-+  {=0D
-+    // Frame 0=0D
-+    {=0D
-+      0,                                  // UINT8   FrameNumber=0D
-+      N1SDP_GT_BLOCK_FRAME0_CTL_BASE,     // UINT64  PhysicalAddressCntBa=
se=0D
-+      N1SDP_GT_BLOCK_FRAME0_CTL_EL0_BASE, // UINT64  PhysicalAddressCntEL=
0Base=0D
-+      N1SDP_GT_BLOCK_FRAME0_GSIV,         // UINT32  PhysicalTimerGSIV=0D
-+      N1SDP_GTX_TIMER_FLAGS,              // UINT32  PhysicalTimerFlags=0D
-+      0,                                  // UINT32  VirtualTimerGSIV=0D
-+      0,                                  // UINT32  VirtualTimerFlags=0D
-+      N1SDP_GTX_COMMON_FLAGS_NS           // UINT32  CommonFlags=0D
-+    },=0D
-+    // Frame 1=0D
-+    {=0D
-+      1,                                  // UINT8   FrameNumber=0D
-+      N1SDP_GT_BLOCK_FRAME1_CTL_BASE,     // UINT64  PhysicalAddressCntBa=
se=0D
-+      N1SDP_GT_BLOCK_FRAME1_CTL_EL0_BASE, // UINT64  PhysicalAddressCntEL=
0Base=0D
-+      N1SDP_GT_BLOCK_FRAME1_GSIV,         // UINT32  PhysicalTimerGSIV=0D
-+      N1SDP_GTX_TIMER_FLAGS,              // UINT32  PhysicalTimerFlags=0D
-+      0,                                  // UINT32  VirtualTimerGSIV=0D
-+      0,                                  // UINT32  VirtualTimerFlags=0D
-+      N1SDP_GTX_COMMON_FLAGS_S            // UINT32  CommonFlags=0D
-+    },=0D
-+  },=0D
-+=0D
-+  // Watchdog Info=0D
-+  {=0D
-+    // The physical base address of the SBSA Watchdog control frame=0D
-+    FixedPcdGet64 (PcdGenericWatchdogControlBase),=0D
-+    // The physical base address of the SBSA Watchdog refresh frame=0D
-+    FixedPcdGet64 (PcdGenericWatchdogRefreshBase),=0D
-+    // The watchdog interrupt=0D
-+    FixedPcdGet32 (PcdGenericWatchdogEl2IntrNum),=0D
-+    // The watchdog flags=0D
-+    N1SDP_SBSA_WATCHDOG_FLAGS=0D
-+  },=0D
-+=0D
-+  // SPCR Serial Port=0D
-+  {=0D
-+    FixedPcdGet64 (PcdSerialRegisterBase),                  // BaseAddres=
s=0D
-+    FixedPcdGet32 (PL011UartInterrupt),                     // Interrupt=
=0D
-+    FixedPcdGet64 (PcdUartDefaultBaudRate),                 // BaudRate=0D
-+    FixedPcdGet32 (PL011UartClkInHz),                       // Clock=0D
-+    EFI_ACPI_DBG2_PORT_SUBTYPE_SERIAL_ARM_SBSA_GENERIC_UART // Port subty=
pe=0D
-+  },=0D
-+  // Debug Serial Port=0D
-+  {=0D
-+    FixedPcdGet64 (PcdSerialDbgRegisterBase),               // BaseAddres=
s=0D
-+    0,                                                      // Interrupt =
-unused=0D
-+    FixedPcdGet64 (PcdSerialDbgUartBaudRate),               // BaudRate=0D
-+    FixedPcdGet32 (PcdSerialDbgUartClkInHz),                // Clock=0D
-+    EFI_ACPI_DBG2_PORT_SUBTYPE_SERIAL_ARM_SBSA_GENERIC_UART // Port subty=
pe=0D
-+  },=0D
-+=0D
-+  // Processor Hierarchy Nodes=0D
-+  {=0D
-+    // Package=0D
-+    {=0D
-+      // CM_OBJECT_TOKEN  Token=0D
-+      REFERENCE_TOKEN (ProcHierarchyInfo[0]),=0D
-+      // UINT32  Flags=0D
-+      PROC_NODE_FLAGS (=0D
-+        EFI_ACPI_6_3_PPTT_PACKAGE_PHYSICAL,=0D
-+        EFI_ACPI_6_3_PPTT_PROCESSOR_ID_INVALID,=0D
-+        EFI_ACPI_6_3_PPTT_PROCESSOR_IS_NOT_THREAD,=0D
-+        EFI_ACPI_6_3_PPTT_NODE_IS_NOT_LEAF,=0D
-+        EFI_ACPI_6_3_PPTT_IMPLEMENTATION_IDENTICAL=0D
-+      ),=0D
-+      // CM_OBJECT_TOKEN  ParentToken=0D
-+      CM_NULL_TOKEN,=0D
-+      // CM_OBJECT_TOKEN  GicCToken=0D
-+      CM_NULL_TOKEN,=0D
-+      // UINT32  NoOfPrivateResources=0D
-+      SOC_RESOURCE_COUNT,=0D
-+      // CM_OBJECT_TOKEN  PrivateResourcesArrayToken=0D
-+      REFERENCE_TOKEN (SocResources)=0D
-+    },=0D
-+    // Cluster0=0D
-+    {=0D
-+      // CM_OBJECT_TOKEN  Token=0D
-+      REFERENCE_TOKEN (ProcHierarchyInfo[1]),=0D
-+      // UINT32  Flags=0D
-+      PROC_NODE_FLAGS (=0D
-+        EFI_ACPI_6_3_PPTT_PACKAGE_NOT_PHYSICAL,=0D
-+        EFI_ACPI_6_3_PPTT_PROCESSOR_ID_INVALID,=0D
-+        EFI_ACPI_6_3_PPTT_PROCESSOR_IS_NOT_THREAD,=0D
-+        EFI_ACPI_6_3_PPTT_NODE_IS_NOT_LEAF,=0D
-+        EFI_ACPI_6_3_PPTT_IMPLEMENTATION_IDENTICAL=0D
-+      ),=0D
-+      // CM_OBJECT_TOKEN  ParentToken=0D
-+      REFERENCE_TOKEN (ProcHierarchyInfo[0]), // -> Package=0D
-+      // CM_OBJECT_TOKEN  GicCToken=0D
-+      CM_NULL_TOKEN,=0D
-+      // UINT32  NoOfPrivateResources=0D
-+      CLUSTER_RESOURCE_COUNT,=0D
-+      // CM_OBJECT_TOKEN  PrivateResourcesArrayToken=0D
-+      REFERENCE_TOKEN (ClusterResources)=0D
-+    },=0D
-+    // Cluster1=0D
-+    {=0D
-+      // CM_OBJECT_TOKEN  Token=0D
-+      REFERENCE_TOKEN (ProcHierarchyInfo[2]),=0D
-+      // UINT32  Flags=0D
-+      PROC_NODE_FLAGS (=0D
-+        EFI_ACPI_6_3_PPTT_PACKAGE_NOT_PHYSICAL,=0D
-+        EFI_ACPI_6_3_PPTT_PROCESSOR_ID_INVALID,=0D
-+        EFI_ACPI_6_3_PPTT_PROCESSOR_IS_NOT_THREAD,=0D
-+        EFI_ACPI_6_3_PPTT_NODE_IS_NOT_LEAF,=0D
-+        EFI_ACPI_6_3_PPTT_IMPLEMENTATION_IDENTICAL=0D
-+      ),=0D
-+      // CM_OBJECT_TOKEN  ParentToken=0D
-+      REFERENCE_TOKEN (ProcHierarchyInfo[0]), // -> Package=0D
-+      // CM_OBJECT_TOKEN  GicCToken=0D
-+      CM_NULL_TOKEN,=0D
-+      // UINT32  NoOfPrivateResources=0D
-+      CLUSTER_RESOURCE_COUNT,=0D
-+      // CM_OBJECT_TOKEN  PrivateResourcesArrayToken=0D
-+      REFERENCE_TOKEN (ClusterResources)=0D
-+    },=0D
-+    // Cluster0 - Cpu0=0D
-+    {=0D
-+      // CM_OBJECT_TOKEN  Token=0D
-+      REFERENCE_TOKEN (ProcHierarchyInfo[3]),=0D
-+      // UINT32  Flags=0D
-+      PROC_NODE_FLAGS (=0D
-+        EFI_ACPI_6_3_PPTT_PACKAGE_NOT_PHYSICAL,=0D
-+        EFI_ACPI_6_3_PPTT_PROCESSOR_ID_VALID,=0D
-+        EFI_ACPI_6_3_PPTT_PROCESSOR_IS_NOT_THREAD,=0D
-+        EFI_ACPI_6_3_PPTT_NODE_IS_LEAF,=0D
-+        EFI_ACPI_6_3_PPTT_IMPLEMENTATION_NOT_IDENTICAL=0D
-+      ),=0D
-+      // CM_OBJECT_TOKEN  ParentToken=0D
-+      REFERENCE_TOKEN (ProcHierarchyInfo[1]), // -> 'cluster in Cluster0=
=0D
-+      // CM_OBJECT_TOKEN  GicCToken=0D
-+      REFERENCE_TOKEN (GicCInfo[0]),=0D
-+      // UINT32  NoOfPrivateResources=0D
-+      CORE_RESOURCE_COUNT,=0D
-+      // CM_OBJECT_TOKEN  PrivateResourcesArrayToken=0D
-+      REFERENCE_TOKEN (CoreResources)=0D
-+    },=0D
-+    // Cluster0 - Cpu1=0D
-+    {=0D
-+      // CM_OBJECT_TOKEN  Token=0D
-+      REFERENCE_TOKEN (ProcHierarchyInfo[4]),=0D
-+      // UINT32  Flags=0D
-+      PROC_NODE_FLAGS (=0D
-+        EFI_ACPI_6_3_PPTT_PACKAGE_NOT_PHYSICAL,=0D
-+        EFI_ACPI_6_3_PPTT_PROCESSOR_ID_VALID,=0D
-+        EFI_ACPI_6_3_PPTT_PROCESSOR_IS_NOT_THREAD,=0D
-+        EFI_ACPI_6_3_PPTT_NODE_IS_LEAF,=0D
-+        EFI_ACPI_6_3_PPTT_IMPLEMENTATION_NOT_IDENTICAL=0D
-+      ),=0D
-+      // CM_OBJECT_TOKEN  ParentToken=0D
-+      REFERENCE_TOKEN (ProcHierarchyInfo[1]), // -> 'cluster in Cluster0=
=0D
-+      // CM_OBJECT_TOKEN  GicCToken=0D
-+      REFERENCE_TOKEN (GicCInfo[1]),=0D
-+      // UINT32  NoOfPrivateResources=0D
-+      CORE_RESOURCE_COUNT,=0D
-+      // CM_OBJECT_TOKEN  PrivateResourcesArrayToken=0D
-+      REFERENCE_TOKEN (CoreResources)=0D
-+    },=0D
-+    // Cluster1 - Cpu0=0D
-+    {=0D
-+      // CM_OBJECT_TOKEN  Token=0D
-+      REFERENCE_TOKEN (ProcHierarchyInfo[3]),=0D
-+      // UINT32  Flags=0D
-+      PROC_NODE_FLAGS (=0D
-+        EFI_ACPI_6_3_PPTT_PACKAGE_NOT_PHYSICAL,=0D
-+        EFI_ACPI_6_3_PPTT_PROCESSOR_ID_VALID,=0D
-+        EFI_ACPI_6_3_PPTT_PROCESSOR_IS_NOT_THREAD,=0D
-+        EFI_ACPI_6_3_PPTT_NODE_IS_LEAF,=0D
-+        EFI_ACPI_6_3_PPTT_IMPLEMENTATION_NOT_IDENTICAL=0D
-+      ),=0D
-+      // CM_OBJECT_TOKEN  ParentToken=0D
-+      REFERENCE_TOKEN (ProcHierarchyInfo[2]), // -> 'cluster in Cluster1=
=0D
-+      // CM_OBJECT_TOKEN  GicCToken=0D
-+      REFERENCE_TOKEN (GicCInfo[2]),=0D
-+      // UINT32  NoOfPrivateResources=0D
-+      CORE_RESOURCE_COUNT,=0D
-+      // CM_OBJECT_TOKEN  PrivateResourcesArrayToken=0D
-+      REFERENCE_TOKEN (CoreResources)=0D
-+    },=0D
-+    // Cluster1 - Cpu1=0D
-+    {=0D
-+      // CM_OBJECT_TOKEN  Token=0D
-+      REFERENCE_TOKEN (ProcHierarchyInfo[4]),=0D
-+      // UINT32  Flags=0D
-+      PROC_NODE_FLAGS (=0D
-+        EFI_ACPI_6_3_PPTT_PACKAGE_NOT_PHYSICAL,=0D
-+        EFI_ACPI_6_3_PPTT_PROCESSOR_ID_VALID,=0D
-+        EFI_ACPI_6_3_PPTT_PROCESSOR_IS_NOT_THREAD,=0D
-+        EFI_ACPI_6_3_PPTT_NODE_IS_LEAF,=0D
-+        EFI_ACPI_6_3_PPTT_IMPLEMENTATION_NOT_IDENTICAL=0D
-+      ),=0D
-+      // CM_OBJECT_TOKEN  ParentToken=0D
-+      REFERENCE_TOKEN (ProcHierarchyInfo[2]), // -> 'cluster in Cluster1=
=0D
-+      // CM_OBJECT_TOKEN  GicCToken=0D
-+      REFERENCE_TOKEN (GicCInfo[3]),=0D
-+      // UINT32  NoOfPrivateResources=0D
-+      CORE_RESOURCE_COUNT,=0D
-+      // CM_OBJECT_TOKEN  PrivateResourcesArrayToken=0D
-+      REFERENCE_TOKEN (CoreResources)=0D
-+    },=0D
-+=0D
-+    // Slave chip hierarchy=0D
-+    // Package=0D
-+    {=0D
-+      // CM_OBJECT_TOKEN  Token=0D
-+      REFERENCE_TOKEN (ProcHierarchyInfo[7]),=0D
-+      // UINT32  Flags=0D
-+      PROC_NODE_FLAGS (=0D
-+        EFI_ACPI_6_3_PPTT_PACKAGE_PHYSICAL,=0D
-+        EFI_ACPI_6_3_PPTT_PROCESSOR_ID_INVALID,=0D
-+        EFI_ACPI_6_3_PPTT_PROCESSOR_IS_NOT_THREAD,=0D
-+        EFI_ACPI_6_3_PPTT_NODE_IS_NOT_LEAF,=0D
-+        EFI_ACPI_6_3_PPTT_IMPLEMENTATION_IDENTICAL=0D
-+      ),=0D
-+      // CM_OBJECT_TOKEN  ParentToken=0D
-+      CM_NULL_TOKEN,=0D
-+      // CM_OBJECT_TOKEN  GicCToken=0D
-+      CM_NULL_TOKEN,=0D
-+      // UINT32  NoOfPrivateResources=0D
-+      SOC_RESOURCE_COUNT,=0D
-+      // CM_OBJECT_TOKEN  PrivateResourcesArrayToken=0D
-+      REFERENCE_TOKEN (SocResources)=0D
-+    },=0D
-+    // Cluster0=0D
-+    {=0D
-+      // CM_OBJECT_TOKEN  Token=0D
-+      REFERENCE_TOKEN (ProcHierarchyInfo[8]),=0D
-+      // UINT32  Flags=0D
-+      PROC_NODE_FLAGS (=0D
-+        EFI_ACPI_6_3_PPTT_PACKAGE_NOT_PHYSICAL,=0D
-+        EFI_ACPI_6_3_PPTT_PROCESSOR_ID_INVALID,=0D
-+        EFI_ACPI_6_3_PPTT_PROCESSOR_IS_NOT_THREAD,=0D
-+        EFI_ACPI_6_3_PPTT_NODE_IS_NOT_LEAF,=0D
-+        EFI_ACPI_6_3_PPTT_IMPLEMENTATION_IDENTICAL=0D
-+      ),=0D
-+      // CM_OBJECT_TOKEN  ParentToken=0D
-+      REFERENCE_TOKEN (ProcHierarchyInfo[7]), // -> Package=0D
-+      // CM_OBJECT_TOKEN  GicCToken=0D
-+      CM_NULL_TOKEN,=0D
-+      // UINT32  NoOfPrivateResources=0D
-+      CLUSTER_RESOURCE_COUNT,=0D
-+      // CM_OBJECT_TOKEN  PrivateResourcesArrayToken=0D
-+      REFERENCE_TOKEN (ClusterResources)=0D
-+    },=0D
-+    // Cluster1=0D
-+    {=0D
-+      // CM_OBJECT_TOKEN  Token=0D
-+      REFERENCE_TOKEN (ProcHierarchyInfo[9]),=0D
-+      // UINT32  Flags=0D
-+      PROC_NODE_FLAGS (=0D
-+        EFI_ACPI_6_3_PPTT_PACKAGE_NOT_PHYSICAL,=0D
-+        EFI_ACPI_6_3_PPTT_PROCESSOR_ID_INVALID,=0D
-+        EFI_ACPI_6_3_PPTT_PROCESSOR_IS_NOT_THREAD,=0D
-+        EFI_ACPI_6_3_PPTT_NODE_IS_NOT_LEAF,=0D
-+        EFI_ACPI_6_3_PPTT_IMPLEMENTATION_IDENTICAL=0D
-+      ),=0D
-+      // CM_OBJECT_TOKEN  ParentToken=0D
-+      REFERENCE_TOKEN (ProcHierarchyInfo[7]), // -> Package=0D
-+      // CM_OBJECT_TOKEN  GicCToken=0D
-+      CM_NULL_TOKEN,=0D
-+      // UINT32  NoOfPrivateResources=0D
-+      CLUSTER_RESOURCE_COUNT,=0D
-+      // CM_OBJECT_TOKEN  PrivateResourcesArrayToken=0D
-+      REFERENCE_TOKEN (ClusterResources)=0D
-+    },=0D
-+    // Cluster0 - Cpu0=0D
-+    {=0D
-+      // CM_OBJECT_TOKEN  Token=0D
-+      REFERENCE_TOKEN (ProcHierarchyInfo[10]),=0D
-+      // UINT32  Flags=0D
-+      PROC_NODE_FLAGS (=0D
-+        EFI_ACPI_6_3_PPTT_PACKAGE_NOT_PHYSICAL,=0D
-+        EFI_ACPI_6_3_PPTT_PROCESSOR_ID_VALID,=0D
-+        EFI_ACPI_6_3_PPTT_PROCESSOR_IS_NOT_THREAD,=0D
-+        EFI_ACPI_6_3_PPTT_NODE_IS_LEAF,=0D
-+        EFI_ACPI_6_3_PPTT_IMPLEMENTATION_NOT_IDENTICAL=0D
-+      ),=0D
-+      // CM_OBJECT_TOKEN  ParentToken=0D
-+      REFERENCE_TOKEN (ProcHierarchyInfo[8]), // -> 'cluster in Cluster0=
=0D
-+      // CM_OBJECT_TOKEN  GicCToken=0D
-+      REFERENCE_TOKEN (GicCInfo[4]),=0D
-+      // UINT32  NoOfPrivateResources=0D
-+      CORE_RESOURCE_COUNT,=0D
-+      // CM_OBJECT_TOKEN  PrivateResourcesArrayToken=0D
-+      REFERENCE_TOKEN (CoreResources)=0D
-+    },=0D
-+    // Cluster0 - Cpu1=0D
-+    {=0D
-+      // CM_OBJECT_TOKEN  Token=0D
-+      REFERENCE_TOKEN (ProcHierarchyInfo[11]),=0D
-+      // UINT32  Flags=0D
-+      PROC_NODE_FLAGS (=0D
-+        EFI_ACPI_6_3_PPTT_PACKAGE_NOT_PHYSICAL,=0D
-+        EFI_ACPI_6_3_PPTT_PROCESSOR_ID_VALID,=0D
-+        EFI_ACPI_6_3_PPTT_PROCESSOR_IS_NOT_THREAD,=0D
-+        EFI_ACPI_6_3_PPTT_NODE_IS_LEAF,=0D
-+        EFI_ACPI_6_3_PPTT_IMPLEMENTATION_NOT_IDENTICAL=0D
-+      ),=0D
-+      // CM_OBJECT_TOKEN  ParentToken=0D
-+      REFERENCE_TOKEN (ProcHierarchyInfo[8]), // -> 'cluster in Cluster0=
=0D
-+      // CM_OBJECT_TOKEN  GicCToken=0D
-+      REFERENCE_TOKEN (GicCInfo[5]),=0D
-+      // UINT32  NoOfPrivateResources=0D
-+      CORE_RESOURCE_COUNT,=0D
-+      // CM_OBJECT_TOKEN  PrivateResourcesArrayToken=0D
-+      REFERENCE_TOKEN (CoreResources)=0D
-+    },=0D
-+    // Cluster1 - Cpu0=0D
-+    {=0D
-+      // CM_OBJECT_TOKEN  Token=0D
-+      REFERENCE_TOKEN (ProcHierarchyInfo[10]),=0D
-+      // UINT32  Flags=0D
-+      PROC_NODE_FLAGS (=0D
-+        EFI_ACPI_6_3_PPTT_PACKAGE_NOT_PHYSICAL,=0D
-+        EFI_ACPI_6_3_PPTT_PROCESSOR_ID_VALID,=0D
-+        EFI_ACPI_6_3_PPTT_PROCESSOR_IS_NOT_THREAD,=0D
-+        EFI_ACPI_6_3_PPTT_NODE_IS_LEAF,=0D
-+        EFI_ACPI_6_3_PPTT_IMPLEMENTATION_NOT_IDENTICAL=0D
-+      ),=0D
-+      // CM_OBJECT_TOKEN  ParentToken=0D
-+      REFERENCE_TOKEN (ProcHierarchyInfo[9]), // -> 'cluster in Cluster1=
=0D
-+      // CM_OBJECT_TOKEN  GicCToken=0D
-+      REFERENCE_TOKEN (GicCInfo[6]),=0D
-+      // UINT32  NoOfPrivateResources=0D
-+      CORE_RESOURCE_COUNT,=0D
-+      // CM_OBJECT_TOKEN  PrivateResourcesArrayToken=0D
-+      REFERENCE_TOKEN (CoreResources)=0D
-+    },=0D
-+    // Cluster1 - Cpu1=0D
-+    {=0D
-+      // CM_OBJECT_TOKEN  Token=0D
-+      REFERENCE_TOKEN (ProcHierarchyInfo[11]),=0D
-+      // UINT32  Flags=0D
-+      PROC_NODE_FLAGS (=0D
-+        EFI_ACPI_6_3_PPTT_PACKAGE_NOT_PHYSICAL,=0D
-+        EFI_ACPI_6_3_PPTT_PROCESSOR_ID_VALID,=0D
-+        EFI_ACPI_6_3_PPTT_PROCESSOR_IS_NOT_THREAD,=0D
-+        EFI_ACPI_6_3_PPTT_NODE_IS_LEAF,=0D
-+        EFI_ACPI_6_3_PPTT_IMPLEMENTATION_NOT_IDENTICAL=0D
-+      ),=0D
-+      // CM_OBJECT_TOKEN  ParentToken=0D
-+      REFERENCE_TOKEN (ProcHierarchyInfo[9]), // -> 'cluster in Cluster1=
=0D
-+      // CM_OBJECT_TOKEN  GicCToken=0D
-+      REFERENCE_TOKEN (GicCInfo[7]),=0D
-+      // UINT32  NoOfPrivateResources=0D
-+      CORE_RESOURCE_COUNT,=0D
-+      // CM_OBJECT_TOKEN  PrivateResourcesArrayToken=0D
-+      REFERENCE_TOKEN (CoreResources)=0D
-+    },=0D
-+  },=0D
-+=0D
-+  // Cache information=0D
-+  {=0D
-+    // 'cluster's L3 cache=0D
-+    {=0D
-+      REFERENCE_TOKEN (CacheInfo[0]),  // CM_OBJECT_TOKEN  Token=0D
-+      CM_NULL_TOKEN,                   // CM_OBJECT_TOKEN  NextLevelOfCac=
heToken=0D
-+      SIZE_1MB,                        // UINT32  Size=0D
-+      2048,                            // UINT32  NumberOfSets=0D
-+      8,                               // UINT32  Associativity=0D
-+      CACHE_ATTRIBUTES (               // UINT8   Attributes=0D
-+        EFI_ACPI_6_3_CACHE_ATTRIBUTES_ALLOCATION_READ,=0D
-+        EFI_ACPI_6_3_CACHE_ATTRIBUTES_CACHE_TYPE_UNIFIED,=0D
-+        EFI_ACPI_6_3_CACHE_ATTRIBUTES_WRITE_POLICY_WRITE_BACK=0D
-+      ),=0D
-+      64                               // UINT16  LineSize=0D
-+    },=0D
-+    // 'core's L1 instruction cache=0D
-+    {=0D
-+      REFERENCE_TOKEN (CacheInfo[1]),  // CM_OBJECT_TOKEN  Token=0D
-+      REFERENCE_TOKEN (CacheInfo[3]),  // CM_OBJECT_TOKEN  NextLevelOfCac=
heToken=0D
-+      SIZE_64KB,                       // UINT32  Size=0D
-+      256,                             // UINT32  NumberOfSets=0D
-+      4,                               // UINT32  Associativity=0D
-+      CACHE_ATTRIBUTES (               // UINT8   Attributes=0D
-+        EFI_ACPI_6_3_CACHE_ATTRIBUTES_ALLOCATION_READ,=0D
-+        EFI_ACPI_6_3_CACHE_ATTRIBUTES_CACHE_TYPE_INSTRUCTION,=0D
-+        EFI_ACPI_6_3_CACHE_ATTRIBUTES_WRITE_POLICY_WRITE_BACK=0D
-+      ),=0D
-+      64                               // UINT16  LineSize=0D
-+    },=0D
-+    // 'core's L1 data cache=0D
-+    {=0D
-+      REFERENCE_TOKEN (CacheInfo[2]),  // CM_OBJECT_TOKEN  Token=0D
-+      REFERENCE_TOKEN (CacheInfo[3]),  // CM_OBJECT_TOKEN  NextLevelOfCac=
heToken=0D
-+      SIZE_64KB,                       // UINT32  Size=0D
-+      256,                             // UINT32  NumberOfSets=0D
-+      4,                               // UINT32  Associativity=0D
-+      CACHE_ATTRIBUTES (               // UINT8   Attributes=0D
-+        EFI_ACPI_6_3_CACHE_ATTRIBUTES_ALLOCATION_READ_WRITE,=0D
-+        EFI_ACPI_6_3_CACHE_ATTRIBUTES_CACHE_TYPE_DATA,=0D
-+        EFI_ACPI_6_3_CACHE_ATTRIBUTES_WRITE_POLICY_WRITE_BACK=0D
-+      ),=0D
-+      64                               // UINT16  LineSize=0D
-+    },=0D
-+    // cores's L2 cache=0D
-+    {=0D
-+      REFERENCE_TOKEN (CacheInfo[3]),  // CM_OBJECT_TOKEN  Token=0D
-+      CM_NULL_TOKEN,                   // CM_OBJECT_TOKEN  NextLevelOfCac=
heToken=0D
-+      SIZE_1MB,                        // UINT32  Size=0D
-+      2048,                            // UINT32  NumberOfSets=0D
-+      8,                               // UINT32  Associativity=0D
-+      CACHE_ATTRIBUTES (               // UINT8   Attributes=0D
-+        EFI_ACPI_6_3_CACHE_ATTRIBUTES_ALLOCATION_READ,=0D
-+        EFI_ACPI_6_3_CACHE_ATTRIBUTES_CACHE_TYPE_UNIFIED,=0D
-+        EFI_ACPI_6_3_CACHE_ATTRIBUTES_WRITE_POLICY_WRITE_BACK=0D
-+      ),=0D
-+      64                               // UINT16  LineSize=0D
-+    },=0D
-+    // slc cache=0D
-+    {=0D
-+      REFERENCE_TOKEN (CacheInfo[4]),  // CM_OBJECT_TOKEN  Token=0D
-+      CM_NULL_TOKEN,                   // CM_OBJECT_TOKEN  NextLevelOfCac=
heToken=0D
-+      SIZE_8MB,                        // UINT32  Size=0D
-+      8192,                            // UINT32  NumberOfSets=0D
-+      16,                              // UINT32  Associativity=0D
-+      CACHE_ATTRIBUTES (               // UINT8   Attributes=0D
-+        EFI_ACPI_6_3_CACHE_ATTRIBUTES_ALLOCATION_READ,=0D
-+        EFI_ACPI_6_3_CACHE_ATTRIBUTES_CACHE_TYPE_UNIFIED,=0D
-+        EFI_ACPI_6_3_CACHE_ATTRIBUTES_WRITE_POLICY_WRITE_BACK=0D
-+      ),=0D
-+      64                               // UINT16  LineSize=0D
-+    },=0D
-+  },=0D
-+  // Resources private to the 'cluster (shared among cores) in Cluster=0D
-+  {=0D
-+    { REFERENCE_TOKEN (CacheInfo[0]) }  // -> 'cluster's L3 cache in Clus=
ter=0D
-+  },=0D
-+  // Resources private to each individual 'core instance in Cluster=0D
-+  {=0D
-+    { REFERENCE_TOKEN (CacheInfo[1]) }, // -> 'core's L1 I-cache in Clust=
er=0D
-+    { REFERENCE_TOKEN (CacheInfo[2]) }, // -> 'core's L1 D-cache in Clust=
er=0D
-+    { REFERENCE_TOKEN (CacheInfo[3]) }  // -> 'core's L2 cache in Cluster=
=0D
-+  },=0D
-+=0D
-+  // Resources private to the SoC=0D
-+  {=0D
-+    { REFERENCE_TOKEN (CacheInfo[4])   },  // -> slc for SoC=0D
-+  },=0D
-+=0D
-+  // ITS group node=0D
-+  {=0D
-+    {=0D
-+      // Reference token for this Iort node=0D
-+      REFERENCE_TOKEN (ItsGroupInfo[ITS_SMMU_CCIX]),=0D
-+      // The number of ITS identifiers in the ITS node.=0D
-+      1,=0D
-+      // Reference token for the ITS identifier array=0D
-+      REFERENCE_TOKEN (ItsIdentifierArray[ITS_SMMU_CCIX])=0D
-+    },=0D
-+    {=0D
-+      // Reference token for this Iort node=0D
-+      REFERENCE_TOKEN (ItsGroupInfo[ITS_SMMU_PCIE]),=0D
-+      // The number of ITS identifiers in the ITS node.=0D
-+      1,=0D
-+      // Reference token for the ITS identifier array=0D
-+      REFERENCE_TOKEN (ItsIdentifierArray[ITS_SMMU_PCIE])=0D
-+    },=0D
-+    {=0D
-+      // Reference token for this Iort node=0D
-+      REFERENCE_TOKEN (ItsGroupInfo[ITS_CCIX]),=0D
-+      // The number of ITS identifiers in the ITS node.=0D
-+      1,=0D
-+      // Reference token for the ITS identifier array=0D
-+      REFERENCE_TOKEN (ItsIdentifierArray[ITS_CCIX])=0D
-+    },=0D
-+    {=0D
-+      // Reference token for this Iort node=0D
-+      REFERENCE_TOKEN (ItsGroupInfo[ITS_PCIE]),=0D
-+      // The number of ITS identifiers in the ITS node.=0D
-+      1,=0D
-+      // Reference token for the ITS identifier array=0D
-+      REFERENCE_TOKEN (ItsIdentifierArray[ITS_PCIE])=0D
-+    },=0D
-+    //Remote Chip ITS=0D
-+    {=0D
-+      REFERENCE_TOKEN (ItsGroupInfo[ITS_REMOTE_SMMU_PCIE]),=0D
-+      1,=0D
-+      REFERENCE_TOKEN (ItsIdentifierArray[ITS_REMOTE_SMMU_PCIE])=0D
-+    },=0D
-+    {=0D
-+      REFERENCE_TOKEN (ItsGroupInfo[ITS_REMOTE_PCIE]),=0D
-+      1,=0D
-+      REFERENCE_TOKEN (ItsIdentifierArray[ITS_REMOTE_PCIE])=0D
-+    },=0D
-+  },=0D
-+  // ITS identifier array=0D
-+  {=0D
-+    {=0D
-+      // The ITS Identifier - 0=0D
-+      ITS_SMMU_CCIX=0D
-+    },=0D
-+    {=0D
-+      // The ITS Identifier - 1=0D
-+      ITS_SMMU_PCIE=0D
-+    },=0D
-+    {=0D
-+      // The ITS Identifier - 2=0D
-+      ITS_CCIX=0D
-+    },=0D
-+    {=0D
-+      // The ITS Identifier - 3=0D
-+      ITS_PCIE=0D
-+    },=0D
-+    {=0D
-+      // The ITS Identifier - 4=0D
-+      ITS_REMOTE_SMMU_PCIE=0D
-+    },=0D
-+    {=0D
-+      // The ITS Identifier - 5=0D
-+      ITS_REMOTE_PCIE=0D
-+    }=0D
-+  },=0D
-+=0D
-+  {=0D
-+    // SMMUv3 Node=0D
-+    {=0D
-+      // Reference token for this Iort node=0D
-+      REFERENCE_TOKEN (SmmuV3Info[SMMUV3INFO_PCIE]),=0D
-+      // Number of ID mappings=0D
-+      2,=0D
-+      // Reference token for the ID mapping array=0D
-+      REFERENCE_TOKEN (DeviceIdMapping[DEVICEIDMAPPING_SMMU_PCIE][0]),=0D
-+=0D
-+      // SMMU Base Address=0D
-+      0x4F400000,=0D
-+      // SMMU flags=0D
-+      EFI_ACPI_IORT_SMMUv3_FLAG_COHAC_OVERRIDE,=0D
-+      // VATOS address=0D
-+      0,=0D
-+      // Model=0D
-+      EFI_ACPI_IORT_SMMUv3_MODEL_GENERIC,=0D
-+      // GSIV of the Event interrupt if SPI based=0D
-+      0x10B,=0D
-+      // PRI Interrupt if SPI based=0D
-+      0,=0D
-+      // GERR interrupt if GSIV based=0D
-+      0x10D,=0D
-+      // Sync interrupt if GSIV based=0D
-+      0x10C,=0D
-+=0D
-+      // Proximity domain flag, ignored in this case=0D
-+      0,=0D
-+      // Index into the array of ID mapping, ignored as SMMU=0D
-+      // control interrupts are GSIV based=0D
-+      1=0D
-+    },=0D
-+    // SMMUv3 Node=0D
-+    {=0D
-+      // Reference token for this Iort node=0D
-+      REFERENCE_TOKEN (SmmuV3Info[SMMUV3INFO_CCIX]),=0D
-+      // Number of ID mappings=0D
-+      2,=0D
-+      // Reference token for the ID mapping array=0D
-+      REFERENCE_TOKEN (DeviceIdMapping[DEVICEIDMAPPING_SMMU_CCIX][0]),=0D
-+=0D
-+      // SMMU Base Address=0D
-+      0x4F000000,=0D
-+      // SMMU flags=0D
-+      EFI_ACPI_IORT_SMMUv3_FLAG_COHAC_OVERRIDE,=0D
-+      // VATOS address=0D
-+      0,=0D
-+      // Model=0D
-+      EFI_ACPI_IORT_SMMUv3_MODEL_GENERIC,=0D
-+      // GSIV of the Event interrupt if SPI based=0D
-+      0x104,=0D
-+      // PRI Interrupt if SPI based=0D
-+      0,=0D
-+      // GERR interrupt if GSIV based=0D
-+      0x106,=0D
-+      // Sync interrupt if GSIV based=0D
-+      0x105,=0D
-+=0D
-+      // Proximity domain flag, ignored in this case=0D
-+      0,=0D
-+      // Index into the array of ID mapping, ignored as SMMU=0D
-+      // control interrupts are GSIV based=0D
-+      1=0D
-+    },=0D
-+    //Remote Chip SMMU V3 setting=0D
-+    {=0D
-+      REFERENCE_TOKEN (SmmuV3Info[SMMUV3INFO_REMOTE_PCIE]),=0D
-+      2,=0D
-+      REFERENCE_TOKEN (DeviceIdMapping[DEVICEIDMAPPING_REMOTE_SMMU_PCIE][=
0]),=0D
-+      0x4004f400000,=0D
-+      EFI_ACPI_IORT_SMMUv3_FLAG_COHAC_OVERRIDE,=0D
-+      0,=0D
-+      EFI_ACPI_IORT_SMMUv3_MODEL_GENERIC,=0D
-+      747,=0D
-+      0,=0D
-+      749,=0D
-+      748,=0D
-+      0,=0D
-+      1=0D
-+    }=0D
-+  },=0D
-+=0D
-+  {=0D
-+    // Root Complex node info=0D
-+    {=0D
-+      // Reference token for this Iort node=0D
-+      REFERENCE_TOKEN (RootComplexInfo[0]),=0D
-+      // Number of ID mappings=0D
-+      1,=0D
-+      // Reference token for the ID mapping array=0D
-+      REFERENCE_TOKEN (DeviceIdMapping[DEVICEIDMAPPING_PCIE][0]),=0D
-+=0D
-+      // Memory access properties : Cache coherent attributes=0D
-+      EFI_ACPI_IORT_MEM_ACCESS_PROP_CCA,=0D
-+      // Memory access properties : Allocation hints=0D
-+      0,=0D
-+      // Memory access properties : Memory access flags=0D
-+      0,=0D
-+      // ATS attributes=0D
-+      EFI_ACPI_IORT_ROOT_COMPLEX_ATS_SUPPORTED,=0D
-+      // PCI segment number=0D
-+      0,=0D
-+      // Memory address size limit=0D
-+      42=0D
-+    },=0D
-+      // Root Complex node info=0D
-+    {=0D
-+      // Reference token for this Iort node=0D
-+      REFERENCE_TOKEN (RootComplexInfo[1]),=0D
-+      // Number of ID mappings=0D
-+      1,=0D
-+      // Reference token for the ID mapping array=0D
-+      REFERENCE_TOKEN (DeviceIdMapping[DEVICEIDMAPPING_PCIE][1]),=0D
-+=0D
-+      // Memory access properties : Cache coherent attributes=0D
-+      EFI_ACPI_IORT_MEM_ACCESS_PROP_CCA,=0D
-+      // Memory access properties : Allocation hints=0D
-+      0,=0D
-+      // Memory access properties : Memory access flags=0D
-+      0,=0D
-+      // ATS attributes=0D
-+      EFI_ACPI_IORT_ROOT_COMPLEX_ATS_SUPPORTED,=0D
-+      // PCI segment number=0D
-+      1,=0D
-+      // Memory address size limit=0D
-+      42=0D
-+    },=0D
-+     //Remote Chip Root Complex node Info=0D
-+    {=0D
-+      REFERENCE_TOKEN (RootComplexInfo[ROOT_REMOTE_PCIE]),=0D
-+      1,=0D
-+      REFERENCE_TOKEN (DeviceIdMapping[DEVICEIDMAPPING_REMOTE_PCIE][0]),=
=0D
-+      EFI_ACPI_IORT_MEM_ACCESS_PROP_CCA,=0D
-+      0,=0D
-+      0,=0D
-+      EFI_ACPI_IORT_ROOT_COMPLEX_ATS_SUPPORTED,=0D
-+      2,=0D
-+      42=0D
-+    }=0D
-+  },=0D
-+=0D
-+  // Array of Device ID mappings=0D
-+  {=0D
-+    // DeviceIdMapping[0][0] - [0][1]=0D
-+    {=0D
-+      /* Mapping SMMUv3 -> ITS Group=0D
-+      */=0D
-+=0D
-+      // SMMUv3 device ID mapping=0D
-+      {=0D
-+        // Input base=0D
-+        0x0,=0D
-+        // Number of input IDs=0D
-+        0x0000FFFF,=0D
-+        // Output Base=0D
-+        0x0,=0D
-+        // Output reference=0D
-+        REFERENCE_TOKEN (ItsGroupInfo[ITS_PCIE]),=0D
-+        // Flags=0D
-+        0=0D
-+      },=0D
-+      // SMMUv3 device ID mapping=0D
-+      {=0D
-+        // Input base=0D
-+        0x0,=0D
-+        // Number of input IDs=0D
-+        0x00000001,=0D
-+        // Output Base=0D
-+        0x0,=0D
-+        // Output reference token for the IORT node=0D
-+        REFERENCE_TOKEN (ItsGroupInfo[ITS_SMMU_PCIE]),=0D
-+        // Flags=0D
-+        EFI_ACPI_IORT_ID_MAPPING_FLAGS_SINGLE=0D
-+      }=0D
-+    },=0D
-+    // DeviceIdMapping[1][0] - [1][1]=0D
-+    {=0D
-+      /* Mapping SMMUv3 -> ITS Group=0D
-+      */=0D
-+=0D
-+      // SMMUv3 device ID mapping=0D
-+      {=0D
-+        // Input base=0D
-+        0x0,=0D
-+        // Number of input IDs=0D
-+        0x0000FFFF,=0D
-+        // Output Base=0D
-+        0x0,=0D
-+        // Output reference=0D
-+        REFERENCE_TOKEN (ItsGroupInfo[ITS_CCIX]),=0D
-+        // Flags=0D
-+        0=0D
-+      },=0D
-+      // SMMUv3 device ID mapping=0D
-+      {=0D
-+        // Input base=0D
-+        0x0,=0D
-+        // Number of input IDs=0D
-+        0x00000001,=0D
-+        // Output Base=0D
-+        0x0,=0D
-+        // Output reference token for the IORT node=0D
-+        REFERENCE_TOKEN (ItsGroupInfo[ITS_SMMU_CCIX]),=0D
-+        // Flags=0D
-+        EFI_ACPI_IORT_ID_MAPPING_FLAGS_SINGLE=0D
-+      }=0D
-+    },=0D
-+    // DeviceIdMapping[2][0] - [2][1]=0D
-+    {=0D
-+      // Mapping for  RootComplex -> SMMUv3=0D
-+=0D
-+      // Device ID mapping for Root complex node=0D
-+      {=0D
-+        // Input base=0D
-+        0x0,=0D
-+        // Number of input IDs=0D
-+        0x0000FFFF,=0D
-+        // Output Base=0D
-+        0x0,=0D
-+        // Output reference=0D
-+        REFERENCE_TOKEN (SmmuV3Info[SMMUV3INFO_PCIE]),=0D
-+        // Flags=0D
-+        0=0D
-+      },=0D
-+      // Device ID mapping for Root complex node=0D
-+      {=0D
-+        // Input base=0D
-+        0x0,=0D
-+        // Number of input IDs=0D
-+        0x0000FFFF,=0D
-+        // Output Base=0D
-+        0x0,=0D
-+        // Output reference token for the IORT node=0D
-+        REFERENCE_TOKEN (SmmuV3Info[SMMUV3INFO_CCIX]),=0D
-+        // Flags=0D
-+        0=0D
-+      }=0D
-+    },=0D
-+      // Mapping of Remote Chip SMMUv3 -> ITS Group=0D
-+    {=0D
-+      {=0D
-+        0x0,=0D
-+        0x0000ffff,=0D
-+        0x0,=0D
-+        REFERENCE_TOKEN (ItsGroupInfo[ITS_REMOTE_PCIE]),=0D
-+        0=0D
-+      },=0D
-+      {=0D
-+        0x0,=0D
-+        0x00000001,=0D
-+        0x0,=0D
-+        REFERENCE_TOKEN (ItsGroupInfo[ITS_REMOTE_SMMU_PCIE]),=0D
-+        EFI_ACPI_IORT_ID_MAPPING_FLAGS_SINGLE=0D
-+      }=0D
-+    },=0D
-+      // Mapping for  Remote Chip RootComplex -> SMMUv3=0D
-+    {=0D
-+      {=0D
-+        0x0,=0D
-+        0x0000ffff,=0D
-+        0x0,=0D
-+        REFERENCE_TOKEN (SmmuV3Info[SMMUV3INFO_REMOTE_PCIE]),=0D
-+        0=0D
-+      }=0D
-+    },=0D
-+  },=0D
-+=0D
-+  // PCI Configuration Space Info=0D
-+  {=0D
-+    // PCIe ECAM=0D
-+    {=0D
-+      0x70000000,      // Base Address=0D
-+      0x0,             // Segment Group Number=0D
-+      0x0,             // Start Bus Number=0D
-+      17               // End Bus Number=0D
-+    },=0D
-+    // CCIX ECAM=0D
-+    {=0D
-+      0x68000000,      // Base Address=0D
-+      0x1,             // Segment Group Number=0D
-+      0x0,               // Start Bus Number=0D
-+      17               // End Bus Number=0D
-+    },=0D
-+    //Remote Chip PCIe ECAM=0D
-+    {=0D
-+      0x40070000000,   // Base Address=0D
-+      0x2,             // Segment Group Number=0D
-+      0x0,             // Start Bus Number=0D
-+      17               // End Bus Number=0D
-+    }=0D
-+  },=0D
-+=0D
-+  // Memory Affinity Info=0D
-+  {=0D
-+    {=0D
-+      // Proximity domain to which memory range belongs=0D
-+      0,=0D
-+      //Base Address=0D
-+      0x80000000,=0D
-+      //Length=0D
-+      0x80000000,=0D
-+      //Flags=0D
-+      EFI_ACPI_6_3_MEMORY_ENABLED=0D
-+    },=0D
-+    {=0D
-+      // Proximity domain to which memory range belongs=0D
-+      0,=0D
-+      //Base Address=0D
-+      0x8080000000,=0D
-+      //Length is updated dynamically from SRAM=0D
-+      0,=0D
-+      //Flags=0D
-+      EFI_ACPI_6_3_MEMORY_ENABLED=0D
-+    }=0D
-+  }=0D
-+=0D
-+};=0D
-+=0D
-+/** A helper function for returning the Configuration Manager Objects.=0D
-+  @param [in]       CmObjectId     The Configuration Manager Object ID.=0D
-+  @param [in]       Object         Pointer to the Object(s).=0D
-+  @param [in]       ObjectSize     Total size of the Object(s).=0D
-+  @param [in]       ObjectCount    Number of Objects.=0D
-+  @param [in, out]  CmObjectDesc   Pointer to the Configuration Manager O=
bject=0D
-+                                   descriptor describing the requested Ob=
ject.=0D
-+  @retval EFI_SUCCESS           Success.=0D
-+**/=0D
-+STATIC=0D
-+EFI_STATUS=0D
-+EFIAPI=0D
-+HandleCmObject (=0D
-+  IN  CONST CM_OBJECT_ID                CmObjectId,=0D
-+  IN        VOID                *       Object,=0D
-+  IN  CONST UINTN                       ObjectSize,=0D
-+  IN  CONST UINTN                       ObjectCount,=0D
-+  IN  OUT   CM_OBJ_DESCRIPTOR   * CONST CmObjectDesc=0D
-+  )=0D
-+{=0D
-+  CmObjectDesc->ObjectId =3D CmObjectId;=0D
-+  CmObjectDesc->Size =3D ObjectSize;=0D
-+  CmObjectDesc->Data =3D (VOID*)Object;=0D
-+  CmObjectDesc->Count =3D ObjectCount;=0D
-+  DEBUG ((=0D
-+    DEBUG_INFO,=0D
-+    "INFO: CmObjectId =3D %x, Ptr =3D 0x%p, Size =3D %d, Count =3D %d\n",=
=0D
-+    CmObjectId,=0D
-+    CmObjectDesc->Data,=0D
-+    CmObjectDesc->Size,=0D
-+    CmObjectDesc->Count=0D
-+    ));=0D
-+  return EFI_SUCCESS;=0D
-+}=0D
-+=0D
-+/** A helper function for returning the Configuration Manager Objects tha=
t=0D
-+    match the token.=0D
-+  @param [in]  This               Pointer to the Configuration Manager Pr=
otocol.=0D
-+  @param [in]  CmObjectId         The Configuration Manager Object ID.=0D
-+  @param [in]  Object             Pointer to the Object(s).=0D
-+  @param [in]  ObjectSize         Total size of the Object(s).=0D
-+  @param [in]  ObjectCount        Number of Objects.=0D
-+  @param [in]  Token              A token identifying the object.=0D
-+  @param [in]  HandlerProc        A handler function to search the object=
=0D
-+                                  referenced by the token.=0D
-+  @param [in, out]  CmObjectDesc  Pointer to the Configuration Manager Ob=
ject=0D
-+                                  descriptor describing the requested Obj=
ect.=0D
-+  @retval EFI_SUCCESS           Success.=0D
-+  @retval EFI_INVALID_PARAMETER A parameter is invalid.=0D
-+  @retval EFI_NOT_FOUND         The required object information is not fo=
und.=0D
-+**/=0D
-+STATIC=0D
-+EFI_STATUS=0D
-+EFIAPI=0D
-+HandleCmObjectRefByToken (=0D
-+  IN  CONST EDKII_CONFIGURATION_MANAGER_PROTOCOL  * CONST This,=0D
-+  IN  CONST CM_OBJECT_ID                                  CmObjectId,=0D
-+  IN        VOID                                  *       Object,=0D
-+  IN  CONST UINTN                                         ObjectSize,=0D
-+  IN  CONST UINTN                                         ObjectCount,=0D
-+  IN  CONST CM_OBJECT_TOKEN                               Token,=0D
-+  IN  CONST CM_OBJECT_HANDLER_PROC                        HandlerProc,=0D
-+  IN  OUT   CM_OBJ_DESCRIPTOR                     * CONST CmObjectDesc=0D
-+  )=0D
-+{=0D
-+  EFI_STATUS  Status;=0D
-+  CmObjectDesc->ObjectId =3D CmObjectId;=0D
-+  if (Token =3D=3D CM_NULL_TOKEN) {=0D
-+    CmObjectDesc->Size =3D ObjectSize;=0D
-+    CmObjectDesc->Data =3D (VOID*)Object;=0D
-+    CmObjectDesc->Count =3D ObjectCount;=0D
-+    Status =3D EFI_SUCCESS;=0D
-+  } else {=0D
-+    Status =3D HandlerProc (This, CmObjectId, Token, CmObjectDesc);=0D
-+  }=0D
-+=0D
-+  DEBUG ((=0D
-+    DEBUG_INFO,=0D
-+    "INFO: Token =3D 0x%p, CmObjectId =3D %x, Ptr =3D 0x%p, Size =3D %d, =
Count =3D %d\n",=0D
-+    (VOID*)Token,=0D
-+    CmObjectId,=0D
-+    CmObjectDesc->Data,=0D
-+    CmObjectDesc->Size,=0D
-+    CmObjectDesc->Count=0D
-+    ));=0D
-+  return Status;=0D
-+}=0D
-+=0D
-+/** A helper function for returning Configuration Manager Object(s) refer=
enced=0D
-+    by token when the entire platform repository is in scope and the=0D
-+    CM_NULL_TOKEN value is not allowed.=0D
-+  @param [in]  This               Pointer to the Configuration Manager Pr=
otocol.=0D
-+  @param [in]  CmObjectId         The Configuration Manager Object ID.=0D
-+  @param [in]  Token              A token identifying the object.=0D
-+  @param [in]  HandlerProc        A handler function to search the object=
(s)=0D
-+                                  referenced by the token.=0D
-+  @param [in, out]  CmObjectDesc  Pointer to the Configuration Manager Ob=
ject=0D
-+                                  descriptor describing the requested Obj=
ect.=0D
-+  @retval EFI_SUCCESS           Success.=0D
-+  @retval EFI_INVALID_PARAMETER A parameter is invalid.=0D
-+  @retval EFI_NOT_FOUND         The required object information is not fo=
und.=0D
-+**/=0D
-+STATIC=0D
-+EFI_STATUS=0D
-+EFIAPI=0D
-+HandleCmObjectSearchPlatformRepo (=0D
-+  IN  CONST EDKII_CONFIGURATION_MANAGER_PROTOCOL  * CONST This,=0D
-+  IN  CONST CM_OBJECT_ID                                  CmObjectId,=0D
-+  IN  CONST CM_OBJECT_TOKEN                               Token,=0D
-+  IN  CONST CM_OBJECT_HANDLER_PROC                        HandlerProc,=0D
-+  IN  OUT   CM_OBJ_DESCRIPTOR                     * CONST CmObjectDesc=0D
-+  )=0D
-+{=0D
-+  EFI_STATUS  Status;=0D
-+  CmObjectDesc->ObjectId =3D CmObjectId;=0D
-+  if (Token =3D=3D CM_NULL_TOKEN) {=0D
-+    DEBUG ((=0D
-+      DEBUG_ERROR,=0D
-+      "ERROR: CM_NULL_TOKEN value is not allowed when searching"=0D
-+      " the entire platform repository.\n"=0D
-+      ));=0D
-+    return EFI_INVALID_PARAMETER;=0D
-+  }=0D
-+=0D
-+  Status =3D HandlerProc (This, CmObjectId, Token, CmObjectDesc);=0D
-+  DEBUG ((=0D
-+    DEBUG_INFO,=0D
-+    "INFO: Token =3D 0x%p, CmObjectId =3D %x, Ptr =3D 0x%p, Size =3D %d, =
Count =3D %d\n",=0D
-+    CmObjectId,=0D
-+    (VOID*)Token,=0D
-+    CmObjectDesc->Data,=0D
-+    CmObjectDesc->Size,=0D
-+    CmObjectDesc->Count=0D
-+    ));=0D
-+  return Status;=0D
-+}=0D
-+=0D
-+/** Initialize the Platform Configuration Repository.=0D
-+=0D
-+  @param [in]  This        Pointer to the Platform Configuration Reposito=
ry.=0D
-+=0D
-+  @retval=0D
-+    EFI_SUCCESS   Success=0D
-+**/=0D
-+STATIC=0D
-+EFI_STATUS=0D
-+EFIAPI=0D
-+InitializePlatformRepository (=0D
-+  IN  EDKII_PLATFORM_REPOSITORY_INFO  * CONST PlatformRepo=0D
-+  )=0D
-+{=0D
-+  return EFI_SUCCESS;=0D
-+}=0D
-+=0D
-+/** Return a GT Block timer frame info list.=0D
-+=0D
-+  @param [in]      This        Pointer to the Configuration Manager Proto=
col.=0D
-+  @param [in]      CmObjectId  The Configuration Manager Object ID.=0D
-+  @param [in]      Token       A token for identifying the object=0D
-+  @param [in, out] CmObject    Pointer to the Configuration Manager Objec=
t=0D
-+                               descriptor describing the requested Object=
.=0D
-+=0D
-+  @retval EFI_SUCCESS           Success.=0D
-+  @retval EFI_INVALID_PARAMETER A parameter is invalid.=0D
-+  @retval EFI_NOT_FOUND         The required object information is not fo=
und.=0D
-+**/=0D
-+EFI_STATUS=0D
-+EFIAPI=0D
-+GetGTBlockTimerFrameInfo (=0D
-+  IN  CONST EDKII_CONFIGURATION_MANAGER_PROTOCOL  * CONST This,=0D
-+  IN  CONST CM_OBJECT_ID                                  CmObjectId,=0D
-+  IN  CONST CM_OBJECT_TOKEN                               Token,=0D
-+  IN  OUT   CM_OBJ_DESCRIPTOR                     * CONST CmObject=0D
-+  )=0D
-+{=0D
-+  EDKII_PLATFORM_REPOSITORY_INFO  * PlatformRepo;=0D
-+=0D
-+  if ((This =3D=3D NULL) || (CmObject =3D=3D NULL)) {=0D
-+    ASSERT (This !=3D NULL);=0D
-+    ASSERT (CmObject !=3D NULL);=0D
-+    return EFI_INVALID_PARAMETER;=0D
-+  }=0D
-+=0D
-+  PlatformRepo =3D This->PlatRepoInfo;=0D
-+=0D
-+  if (Token !=3D (CM_OBJECT_TOKEN)&PlatformRepo->GTBlock0TimerInfo) {=0D
-+    return EFI_NOT_FOUND;=0D
-+  }=0D
-+=0D
-+  CmObject->ObjectId =3D CmObjectId;=0D
-+  CmObject->Size =3D sizeof (PlatformRepo->GTBlock0TimerInfo);=0D
-+  CmObject->Data =3D (VOID*)&PlatformRepo->GTBlock0TimerInfo;=0D
-+  CmObject->Count =3D sizeof (PlatformRepo->GTBlock0TimerInfo) /=0D
-+                      sizeof (PlatformRepo->GTBlock0TimerInfo[0]);=0D
-+  return EFI_SUCCESS;=0D
-+}=0D
-+=0D
-+/** Return an ITS identifier array.=0D
-+=0D
-+  @param [in]  This        Pointer to the Configuration Manager Protocol.=
=0D
-+  @param [in]  CmObjectId  The Configuration Manager Object ID.=0D
-+  @param [in]  Token       A token for identifying the object=0D
-+  @param [out] CmObject    Pointer to the Configuration Manager Object=0D
-+                           descriptor describing the requested Object.=0D
-+=0D
-+  @retval EFI_SUCCESS           Success.=0D
-+  @retval EFI_INVALID_PARAMETER A parameter is invalid.=0D
-+  @retval EFI_NOT_FOUND         The required object information is not fo=
und.=0D
-+*/=0D
-+EFI_STATUS=0D
-+EFIAPI=0D
-+GetItsIdentifierArray (=0D
-+  IN  CONST EDKII_CONFIGURATION_MANAGER_PROTOCOL  * CONST This,=0D
-+  IN  CONST CM_OBJECT_ID                                  CmObjectId,=0D
-+  IN  CONST CM_OBJECT_TOKEN                               Token,=0D
-+  IN  OUT   CM_OBJ_DESCRIPTOR                     * CONST CmObject=0D
-+  )=0D
-+{=0D
-+  EDKII_PLATFORM_REPOSITORY_INFO  * PlatformRepo;=0D
-+  UINTN                             Count;=0D
-+  UINTN                             Index;=0D
-+=0D
-+  if ((This =3D=3D NULL) || (CmObject =3D=3D NULL)) {=0D
-+    ASSERT (This !=3D NULL);=0D
-+    ASSERT (CmObject !=3D NULL);=0D
-+    return EFI_INVALID_PARAMETER;=0D
-+  }=0D
-+=0D
-+  PlatformRepo =3D This->PlatRepoInfo;=0D
-+=0D
-+  Count =3D sizeof (PlatformRepo->ItsIdentifierArray) /=0D
-+            sizeof (PlatformRepo->ItsIdentifierArray[0]);=0D
-+=0D
-+  for (Index =3D 0; Index < Count; Index++) {=0D
-+    if (Token =3D=3D (CM_OBJECT_TOKEN)&PlatformRepo->ItsIdentifierArray[I=
ndex]) {=0D
-+      CmObject->ObjectId =3D CmObjectId;=0D
-+      CmObject->Size =3D sizeof (PlatformRepo->ItsIdentifierArray[0]);=0D
-+      CmObject->Data =3D (VOID*)&PlatformRepo->ItsIdentifierArray[Index];=
=0D
-+      CmObject->Count =3D 1;=0D
-+      return EFI_SUCCESS;=0D
-+    }=0D
-+  }=0D
-+=0D
-+  return EFI_NOT_FOUND;=0D
-+}=0D
-+=0D
-+/** Return an ITS group info.=0D
-+=0D
-+  @param [in]  This        Pointer to the Configuration Manager Protocol.=
=0D
-+  @param [in]  CmObjectId  The Configuration Manager Object ID.=0D
-+  @param [in]  Token       A token for identifying the object=0D
-+  @param [out] CmObject    Pointer to the Configuration Manager Object=0D
-+                           descriptor describing the requested Object.=0D
-+=0D
-+  @retval EFI_SUCCESS           Success.=0D
-+  @retval EFI_INVALID_PARAMETER A parameter is invalid.=0D
-+  @retval EFI_NOT_FOUND         The required object information is not fo=
und.=0D
-+*/=0D
-+EFI_STATUS=0D
-+EFIAPI=0D
-+GetItsGroupInfo (=0D
-+  IN  CONST EDKII_CONFIGURATION_MANAGER_PROTOCOL  * CONST This,=0D
-+  IN  CONST CM_OBJECT_ID                                  CmObjectId,=0D
-+  IN  CONST CM_OBJECT_TOKEN                               Token,=0D
-+  IN  OUT   CM_OBJ_DESCRIPTOR                     * CONST CmObject=0D
-+  )=0D
-+{=0D
-+  EDKII_PLATFORM_REPOSITORY_INFO  * PlatformRepo;=0D
-+  UINTN                             Count;=0D
-+  UINTN                             Index;=0D
-+=0D
-+  if ((This =3D=3D NULL) || (CmObject =3D=3D NULL)) {=0D
-+    ASSERT (This !=3D NULL);=0D
-+    ASSERT (CmObject !=3D NULL);=0D
-+    return EFI_INVALID_PARAMETER;=0D
-+  }=0D
-+=0D
-+  PlatformRepo =3D This->PlatRepoInfo;=0D
-+=0D
-+  Count =3D sizeof (PlatformRepo->ItsGroupInfo) /=0D
-+            sizeof (PlatformRepo->ItsGroupInfo[0]);=0D
-+=0D
-+  for (Index =3D 0; Index < Count; Index++) {=0D
-+    if (Token =3D=3D (CM_OBJECT_TOKEN)&PlatformRepo->ItsGroupInfo[Index])=
 {=0D
-+      CmObject->ObjectId =3D CmObjectId;=0D
-+      CmObject->Size =3D sizeof (PlatformRepo->ItsGroupInfo[0]);=0D
-+      CmObject->Data =3D (VOID*)&PlatformRepo->ItsGroupInfo[Index];=0D
-+      CmObject->Count =3D 1;=0D
-+      return EFI_SUCCESS;=0D
-+    }=0D
-+  }=0D
-+=0D
-+  return EFI_NOT_FOUND;=0D
-+}=0D
-+=0D
-+/** Return a device Id mapping array.=0D
-+=0D
-+  @param [in]  This        Pointer to the Configuration Manager Protocol.=
=0D
-+  @param [in]  CmObjectId  The Configuration Manager Object ID.=0D
-+  @param [in]  Token       A token for identifying the object=0D
-+  @param [out] CmObject    Pointer to the Configuration Manager Object=0D
-+                           descriptor describing the requested Object.=0D
-+=0D
-+  @retval EFI_SUCCESS           Success.=0D
-+  @retval EFI_INVALID_PARAMETER A parameter is invalid.=0D
-+  @retval EFI_NOT_FOUND         The required object information is not fo=
und.=0D
-+*/=0D
-+EFI_STATUS=0D
-+EFIAPI=0D
-+GetDeviceIdMappingArray (=0D
-+  IN  CONST EDKII_CONFIGURATION_MANAGER_PROTOCOL  * CONST This,=0D
-+  IN  CONST CM_OBJECT_ID                                  CmObjectId,=0D
-+  IN  CONST CM_OBJECT_TOKEN                               Token,=0D
-+  IN  OUT   CM_OBJ_DESCRIPTOR                     * CONST CmObject=0D
-+  )=0D
-+{=0D
-+  EDKII_PLATFORM_REPOSITORY_INFO  * PlatformRepo;=0D
-+  UINTN                             Count;=0D
-+=0D
-+  if ((This =3D=3D NULL) || (CmObject =3D=3D NULL)) {=0D
-+    ASSERT (This !=3D NULL);=0D
-+    ASSERT (CmObject !=3D NULL);=0D
-+    return EFI_INVALID_PARAMETER;=0D
-+  }=0D
-+=0D
-+  PlatformRepo =3D This->PlatRepoInfo;=0D
-+=0D
-+  DEBUG ((DEBUG_INFO, "DeviceIdMapping - Token =3D %p\n"));=0D
-+=0D
-+  if (Token =3D=3D (CM_OBJECT_TOKEN)&PlatformRepo->DeviceIdMapping[0][0])=
 {=0D
-+    Count =3D 2;=0D
-+    DEBUG ((DEBUG_INFO, "DeviceIdMapping - Found DeviceIdMapping[0][0]\n"=
));=0D
-+  } else if (Token =3D=3D=0D
-+             (CM_OBJECT_TOKEN)&PlatformRepo->DeviceIdMapping[1][0]) {=0D
-+    Count =3D 2;=0D
-+    DEBUG ((DEBUG_INFO, "DeviceIdMapping - Found DeviceIdMapping[1][0]\n"=
));=0D
-+  } else if (Token =3D=3D=0D
-+             (CM_OBJECT_TOKEN)&PlatformRepo->DeviceIdMapping[2][0]) {=0D
-+    Count  =3D 1;=0D
-+    DEBUG ((DEBUG_INFO, "DeviceIdMapping - Found DeviceIdMapping[2][0]\n"=
));=0D
-+  } else if (Token =3D=3D=0D
-+             (CM_OBJECT_TOKEN)&PlatformRepo->DeviceIdMapping[2][1]) {=0D
-+    Count  =3D 1;=0D
-+    DEBUG ((DEBUG_INFO, "DeviceIdMapping - Found DeviceIdMapping[2][1]\n"=
));=0D
-+  } else if (Token =3D=3D=0D
-+             (CM_OBJECT_TOKEN)&PlatformRepo->DeviceIdMapping[DEVICEIDMAPP=
ING_REMOTE_SMMU_PCIE][0]) {=0D
-+    Count =3D 2;=0D
-+    DEBUG ((DEBUG_INFO, "DeviceIdMapping - Found DeviceIdMapping[DEVICEID=
MAPPING_REMOTE_SMMU_PCIE][0]\n"));=0D
-+  } else if (Token =3D=3D=0D
-+             (CM_OBJECT_TOKEN)&PlatformRepo->DeviceIdMapping[DEVICEIDMAPP=
ING_REMOTE_PCIE][0]) {=0D
-+    Count  =3D 1;=0D
-+    DEBUG ((DEBUG_INFO, "DeviceIdMapping - Found DeviceIdMapping[DEVICEID=
MAPPING_REMOTE_PCIE][0]\n"));=0D
-+  } else {=0D
-+    DEBUG ((DEBUG_INFO, "DeviceIdMapping - Not Found\n"));=0D
-+    return EFI_NOT_FOUND;=0D
-+  }=0D
-+=0D
-+  CmObject->Data =3D (VOID*)Token;=0D
-+  CmObject->ObjectId =3D CmObjectId;=0D
-+  CmObject->Count =3D Count;=0D
-+  CmObject->Size =3D Count * sizeof (CM_ARM_ID_MAPPING);=0D
-+=0D
-+  return EFI_SUCCESS;=0D
-+}=0D
-+=0D
-+/** Return GIC CPU Interface Info.=0D
-+=0D
-+  @param [in]      This           Pointer to the Configuration Manager Pr=
otocol.=0D
-+  @param [in]      CmObjectId     The Object ID of the CM object requeste=
d=0D
-+  @param [in]      SearchToken    A unique token for identifying the requ=
ested=0D
-+                                  CM_ARM_GICC_INFO object.=0D
-+  @param [in, out] CmObject       Pointer to the Configuration Manager Ob=
ject=0D
-+                                  descriptor describing the requested Obj=
ect.=0D
-+=0D
-+  @retval EFI_SUCCESS             Success.=0D
-+  @retval EFI_INVALID_PARAMETER   A parameter is invalid.=0D
-+  @retval EFI_NOT_FOUND           The required object information is not =
found.=0D
-+**/=0D
-+EFI_STATUS=0D
-+EFIAPI=0D
-+GetGicCInfo (=0D
-+  IN  CONST EDKII_CONFIGURATION_MANAGER_PROTOCOL  * CONST This,=0D
-+  IN  CONST CM_OBJECT_ID                                  CmObjectId,=0D
-+  IN  CONST CM_OBJECT_TOKEN                               SearchToken,=0D
-+  IN  OUT   CM_OBJ_DESCRIPTOR                     * CONST CmObject=0D
-+  )=0D
-+{=0D
-+  EDKII_PLATFORM_REPOSITORY_INFO  * PlatformRepo;=0D
-+  NEOVERSEN1SOC_PLAT_INFO         *PlatInfo;=0D
-+  UINT32                          TotalObjCount;=0D
-+  UINT32                          ObjIndex;=0D
-+=0D
-+  if ((This =3D=3D NULL) || (CmObject =3D=3D NULL)) {=0D
-+    ASSERT (This !=3D NULL);=0D
-+    ASSERT (CmObject !=3D NULL);=0D
-+    return EFI_INVALID_PARAMETER;=0D
-+  }=0D
-+=0D
-+  PlatformRepo =3D This->PlatRepoInfo;=0D
-+  PlatInfo =3D (NEOVERSEN1SOC_PLAT_INFO *)NEOVERSEN1SOC_PLAT_INFO_STRUCT_=
BASE;=0D
-+=0D
-+  if (PlatInfo->MultichipMode)=0D
-+    TotalObjCount =3D PLAT_CPU_COUNT * 2;=0D
-+  else=0D
-+    TotalObjCount =3D PLAT_CPU_COUNT;=0D
-+=0D
-+  for (ObjIndex =3D 0; ObjIndex < TotalObjCount; ObjIndex++) {=0D
-+    if (SearchToken =3D=3D (CM_OBJECT_TOKEN)&PlatformRepo->GicCInfo[ObjIn=
dex]) {=0D
-+      CmObject->ObjectId =3D CmObjectId;=0D
-+      CmObject->Size =3D sizeof (PlatformRepo->GicCInfo[ObjIndex]);=0D
-+      CmObject->Data =3D (VOID*)&PlatformRepo->GicCInfo[ObjIndex];=0D
-+      CmObject->Count =3D 1;=0D
-+      return EFI_SUCCESS;=0D
-+    }=0D
-+  }=0D
-+=0D
-+  return EFI_NOT_FOUND;=0D
-+}=0D
-+=0D
-+/** Return a list of Configuration Manager object references pointed to b=
y the=0D
-+    given input token.=0D
-+=0D
-+  @param [in]      This           Pointer to the Configuration Manager Pr=
otocol.=0D
-+  @param [in]      CmObjectId     The Object ID of the CM object requeste=
d=0D
-+  @param [in]      SearchToken    A unique token for identifying the requ=
ested=0D
-+                                  CM_ARM_OBJ_REF list.=0D
-+  @param [in, out] CmObject       Pointer to the Configuration Manager Ob=
ject=0D
-+                                  descriptor describing the requested Obj=
ect.=0D
-+=0D
-+  @retval EFI_SUCCESS             Success.=0D
-+  @retval EFI_INVALID_PARAMETER   A parameter is invalid.=0D
-+  @retval EFI_NOT_FOUND           The required object information is not =
found.=0D
-+**/=0D
-+EFI_STATUS=0D
-+EFIAPI=0D
-+GetCmObjRefs (=0D
-+  IN  CONST EDKII_CONFIGURATION_MANAGER_PROTOCOL  * CONST This,=0D
-+  IN  CONST CM_OBJECT_ID                                  CmObjectId,=0D
-+  IN  CONST CM_OBJECT_TOKEN                               SearchToken,=0D
-+  IN  OUT   CM_OBJ_DESCRIPTOR                     * CONST CmObject=0D
-+  )=0D
-+{=0D
-+  EDKII_PLATFORM_REPOSITORY_INFO  * PlatformRepo;=0D
-+=0D
-+  if ((This =3D=3D NULL) || (CmObject =3D=3D NULL)) {=0D
-+    ASSERT (This !=3D NULL);=0D
-+    ASSERT (CmObject !=3D NULL);=0D
-+    return EFI_INVALID_PARAMETER;=0D
-+  }=0D
-+=0D
-+  PlatformRepo =3D This->PlatRepoInfo;=0D
-+=0D
-+  if (SearchToken =3D=3D (CM_OBJECT_TOKEN)&PlatformRepo->ClusterResources=
) {=0D
-+    CmObject->Size =3D sizeof (PlatformRepo->ClusterResources);=0D
-+    CmObject->Data =3D (VOID*)&PlatformRepo->ClusterResources;=0D
-+    CmObject->Count =3D ARRAY_SIZE (PlatformRepo->ClusterResources);=0D
-+    return EFI_SUCCESS;=0D
-+  }=0D
-+  if (SearchToken =3D=3D (CM_OBJECT_TOKEN)&PlatformRepo->CoreResources) {=
=0D
-+    CmObject->Size =3D sizeof (PlatformRepo->CoreResources);=0D
-+    CmObject->Data =3D (VOID*)&PlatformRepo->CoreResources;=0D
-+    CmObject->Count =3D ARRAY_SIZE (PlatformRepo->CoreResources);=0D
-+    return EFI_SUCCESS;=0D
-+  }=0D
-+  if (SearchToken =3D=3D (CM_OBJECT_TOKEN)&PlatformRepo->SocResources) {=
=0D
-+    CmObject->Size =3D sizeof (PlatformRepo->SocResources);=0D
-+    CmObject->Data =3D (VOID*)&PlatformRepo->SocResources;=0D
-+    CmObject->Count =3D ARRAY_SIZE (PlatformRepo->SocResources);=0D
-+    return EFI_SUCCESS;=0D
-+  }=0D
-+=0D
-+  return EFI_NOT_FOUND;=0D
-+}=0D
-+=0D
-+/** Return a standard namespace object.=0D
-+=0D
-+  @param [in]      This        Pointer to the Configuration Manager Proto=
col.=0D
-+  @param [in]      CmObjectId  The Configuration Manager Object ID.=0D
-+  @param [in]      Token       An optional token identifying the object. =
If=0D
-+                               unused this must be CM_NULL_TOKEN.=0D
-+  @param [in, out] CmObject    Pointer to the Configuration Manager Objec=
t=0D
-+                               descriptor describing the requested Object=
.=0D
-+=0D
-+  @retval EFI_SUCCESS           Success.=0D
-+  @retval EFI_INVALID_PARAMETER A parameter is invalid.=0D
-+  @retval EFI_NOT_FOUND         The required object information is not fo=
und.=0D
-+**/=0D
-+EFI_STATUS=0D
-+EFIAPI=0D
-+GetStandardNameSpaceObject (=0D
-+  IN  CONST EDKII_CONFIGURATION_MANAGER_PROTOCOL  * CONST This,=0D
-+  IN  CONST CM_OBJECT_ID                                  CmObjectId,=0D
-+  IN  CONST CM_OBJECT_TOKEN                               Token OPTIONAL,=
=0D
-+  IN  OUT   CM_OBJ_DESCRIPTOR                     * CONST CmObject=0D
-+  )=0D
-+{=0D
-+  EFI_STATUS                      Status;=0D
-+  EDKII_PLATFORM_REPOSITORY_INFO  * PlatformRepo;=0D
-+  NEOVERSEN1SOC_PLAT_INFO         *PlatInfo;=0D
-+  UINT32                           AcpiTableCount;=0D
-+=0D
-+  if ((This =3D=3D NULL) || (CmObject =3D=3D NULL)) {=0D
-+    ASSERT (This !=3D NULL);=0D
-+    ASSERT (CmObject !=3D NULL);=0D
-+    return EFI_INVALID_PARAMETER;=0D
-+  }=0D
-+=0D
-+  Status =3D EFI_NOT_FOUND;=0D
-+  PlatformRepo =3D This->PlatRepoInfo;=0D
-+  PlatInfo =3D (NEOVERSEN1SOC_PLAT_INFO *)NEOVERSEN1SOC_PLAT_INFO_STRUCT_=
BASE;=0D
-+  AcpiTableCount =3D (sizeof (PlatformRepo->CmAcpiTableList) /=0D
-+                    sizeof (PlatformRepo->CmAcpiTableList[0]));=0D
-+  if (!PlatInfo->MultichipMode)=0D
-+        AcpiTableCount -=3D 1;=0D
-+=0D
-+  switch (GET_CM_OBJECT_ID (CmObjectId)) {=0D
-+    case EStdObjCfgMgrInfo:=0D
-+      Status =3D HandleCmObject (=0D
-+                 CmObjectId,=0D
-+                 &PlatformRepo->CmInfo,=0D
-+                 sizeof (PlatformRepo->CmInfo),=0D
-+                 1,=0D
-+                 CmObject=0D
-+                 );=0D
-+      break;=0D
-+    case EStdObjAcpiTableList:=0D
-+      Status =3D HandleCmObject (=0D
-+                 CmObjectId,=0D
-+                 &PlatformRepo->CmAcpiTableList,=0D
-+                 sizeof (PlatformRepo->CmAcpiTableList),=0D
-+                 AcpiTableCount,=0D
-+                 CmObject=0D
-+                 );=0D
-+      break;=0D
-+    default: {=0D
-+      Status =3D EFI_NOT_FOUND;=0D
-+      DEBUG ((=0D
-+        DEBUG_ERROR,=0D
-+        "ERROR: Object 0x%x. Status =3D %r\n",=0D
-+        CmObjectId,=0D
-+        Status=0D
-+        ));=0D
-+      break;=0D
-+    }=0D
-+  }=0D
-+=0D
-+  return Status;=0D
-+}=0D
-+=0D
-+/** Return an ARM namespace object.=0D
-+=0D
-+  @param [in]      This        Pointer to the Configuration Manager Proto=
col.=0D
-+  @param [in]      CmObjectId  The Configuration Manager Object ID.=0D
-+  @param [in]      Token       An optional token identifying the object. =
If=0D
-+                               unused this must be CM_NULL_TOKEN.=0D
-+  @param [in, out] CmObject    Pointer to the Configuration Manager Objec=
t=0D
-+                               descriptor describing the requested Object=
.=0D
-+=0D
-+  @retval EFI_SUCCESS           Success.=0D
-+  @retval EFI_INVALID_PARAMETER A parameter is invalid.=0D
-+  @retval EFI_NOT_FOUND         The required object information is not fo=
und.=0D
-+**/=0D
-+EFI_STATUS=0D
-+EFIAPI=0D
-+GetArmNameSpaceObject (=0D
-+  IN  CONST EDKII_CONFIGURATION_MANAGER_PROTOCOL  * CONST This,=0D
-+  IN  CONST CM_OBJECT_ID                                  CmObjectId,=0D
-+  IN  CONST CM_OBJECT_TOKEN                               Token OPTIONAL,=
=0D
-+  IN  OUT   CM_OBJ_DESCRIPTOR                     * CONST CmObject=0D
-+  )=0D
-+{=0D
-+  EFI_STATUS                        Status;=0D
-+  EDKII_PLATFORM_REPOSITORY_INFO  * PlatformRepo;=0D
-+  NEOVERSEN1SOC_PLAT_INFO         *PlatInfo;=0D
-+  UINT32                          GicRedistCount;=0D
-+  UINT32                          GicCpuCount;=0D
-+  UINT32                          ProcHierarchyInfoCount;=0D
-+  UINT32                          GicItsInfoCount;=0D
-+  UINT32                          ItsGroupInfoCount;=0D
-+  UINT32                          ItsIdentifierArrayCount;=0D
-+  UINT32                          SmmuV3InfoCount;=0D
-+  UINT32                          DeviceIdMappingCount;=0D
-+  UINT32                          RootComplexInfoCount;=0D
-+  UINT32                          PciConfigInfoCount;=0D
-+=0D
-+  if ((This =3D=3D NULL) || (CmObject =3D=3D NULL)) {=0D
-+    ASSERT (This !=3D NULL);=0D
-+    ASSERT (CmObject !=3D NULL);=0D
-+    return EFI_INVALID_PARAMETER;=0D
-+  }=0D
-+=0D
-+  Status =3D EFI_NOT_FOUND;=0D
-+  PlatformRepo =3D This->PlatRepoInfo;=0D
-+=0D
-+  /* Probe for multi chip information */=0D
-+  PlatInfo =3D (NEOVERSEN1SOC_PLAT_INFO *)NEOVERSEN1SOC_PLAT_INFO_STRUCT_=
BASE;=0D
-+  if (PlatInfo->MultichipMode) {=0D
-+    GicRedistCount =3D 2;=0D
-+    GicCpuCount =3D PLAT_CPU_COUNT * 2;=0D
-+    ProcHierarchyInfoCount =3D PLAT_PROC_HIERARCHY_NODE_COUNT * 2;=0D
-+    GicItsInfoCount =3D ITS_MAX;=0D
-+    ItsGroupInfoCount =3D ITS_MAX;=0D
-+    ItsIdentifierArrayCount =3D ITS_MAX;=0D
-+    SmmuV3InfoCount =3D SMMUV3INFO_MAX;=0D
-+    DeviceIdMappingCount =3D DEVICEIDMAPPING_MAX;=0D
-+    RootComplexInfoCount =3D ROOT_PCIE_MAX;=0D
-+    PciConfigInfoCount =3D ROOT_PCIE_MAX;=0D
-+  } else {=0D
-+    GicRedistCount =3D 1;=0D
-+    GicCpuCount =3D PLAT_CPU_COUNT;=0D
-+    ProcHierarchyInfoCount =3D PLAT_PROC_HIERARCHY_NODE_COUNT;=0D
-+    GicItsInfoCount =3D ITS_MASTER_CHIP_MAX;=0D
-+    ItsGroupInfoCount =3D ITS_MASTER_CHIP_MAX;=0D
-+    ItsIdentifierArrayCount =3D ITS_MASTER_CHIP_MAX;=0D
-+    SmmuV3InfoCount =3D SMMUV3INFO_MASTER_CHIP_MAX;=0D
-+    DeviceIdMappingCount =3D DEVICEIDMAPPING_MASTER_CHIP_MAX;=0D
-+    RootComplexInfoCount =3D ROOT_PCIE_MASTER_CHIP_MAX;=0D
-+    PciConfigInfoCount =3D ROOT_PCIE_MASTER_CHIP_MAX;=0D
-+  }=0D
-+=0D
-+  switch (GET_CM_OBJECT_ID (CmObjectId)) {=0D
-+    case EArmObjBootArchInfo:=0D
-+      Status =3D HandleCmObject (=0D
-+                 CmObjectId,=0D
-+                 &PlatformRepo->BootArchInfo,=0D
-+                 sizeof (PlatformRepo->BootArchInfo),=0D
-+                 1,=0D
-+                 CmObject=0D
-+                 );=0D
-+      break;=0D
-+=0D
-+#ifdef HEADLESS_PLATFORM=0D
-+    case EArmObjFixedFeatureFlags:=0D
-+      Status =3D HandleCmObject (=0D
-+                 CmObjectId,=0D
-+                 &PlatformRepo->FixedFeatureFlags,=0D
-+                 sizeof (PlatformRepo->FixedFeatureFlags),=0D
-+                 1,=0D
-+                 CmObject=0D
-+                 );=0D
-+#endif=0D
-+      break;=0D
-+=0D
-+    case EArmObjPowerManagementProfileInfo:=0D
-+      Status =3D HandleCmObject (=0D
-+                 CmObjectId,=0D
-+                 &PlatformRepo->PmProfileInfo,=0D
-+                 sizeof (PlatformRepo->PmProfileInfo),=0D
-+                 1,=0D
-+                 CmObject=0D
-+                 );=0D
-+      break;=0D
-+=0D
-+    case EArmObjGenericTimerInfo:=0D
-+      Status =3D HandleCmObject (=0D
-+                 CmObjectId,=0D
-+                 &PlatformRepo->GenericTimerInfo,=0D
-+                 sizeof (PlatformRepo->GenericTimerInfo),=0D
-+                 1,=0D
-+                 CmObject=0D
-+                 );=0D
-+      break;=0D
-+=0D
-+    case EArmObjPlatformGenericWatchdogInfo:=0D
-+      Status =3D HandleCmObject (=0D
-+                 CmObjectId,=0D
-+                 &PlatformRepo->Watchdog,=0D
-+                 sizeof (PlatformRepo->Watchdog),=0D
-+                 1,=0D
-+                 CmObject=0D
-+                 );=0D
-+      break;=0D
-+=0D
-+    case EArmObjPlatformGTBlockInfo:=0D
-+      Status =3D HandleCmObject (=0D
-+                 CmObjectId,=0D
-+                 PlatformRepo->GTBlockInfo,=0D
-+                 sizeof (PlatformRepo->GTBlockInfo),=0D
-+                 ARRAY_SIZE (PlatformRepo->GTBlockInfo),=0D
-+                 CmObject=0D
-+                 );=0D
-+      break;=0D
-+=0D
-+    case EArmObjGTBlockTimerFrameInfo:=0D
-+      Status =3D HandleCmObjectRefByToken (=0D
-+                 This,=0D
-+                 CmObjectId,=0D
-+                 PlatformRepo->GTBlock0TimerInfo,=0D
-+                 sizeof (PlatformRepo->GTBlock0TimerInfo),=0D
-+                 ARRAY_SIZE (PlatformRepo->GTBlock0TimerInfo),=0D
-+                 Token,=0D
-+                 GetGTBlockTimerFrameInfo,=0D
-+                 CmObject=0D
-+                 );=0D
-+      break;=0D
-+=0D
-+    case EArmObjGicCInfo:=0D
-+      Status =3D HandleCmObjectRefByToken (=0D
-+                 This,=0D
-+                 CmObjectId,=0D
-+                 PlatformRepo->GicCInfo,=0D
-+                 sizeof (PlatformRepo->GicCInfo),=0D
-+                 GicCpuCount,=0D
-+                 Token,=0D
-+                 GetGicCInfo,=0D
-+                 CmObject=0D
-+                 );=0D
-+      break;=0D
-+=0D
-+    case EArmObjGicDInfo:=0D
-+      Status =3D HandleCmObject (=0D
-+                 CmObjectId,=0D
-+                 &PlatformRepo->GicDInfo,=0D
-+                 sizeof (PlatformRepo->GicDInfo),=0D
-+                 1,=0D
-+                 CmObject=0D
-+                 );=0D
-+      break;=0D
-+=0D
-+    case EArmObjGicRedistributorInfo:=0D
-+      Status =3D HandleCmObject (=0D
-+                 CmObjectId,=0D
-+                 PlatformRepo->GicRedistInfo,=0D
-+                 sizeof (PlatformRepo->GicRedistInfo),=0D
-+                 GicRedistCount,=0D
-+                 CmObject=0D
-+                 );=0D
-+      break;=0D
-+=0D
-+    case EArmObjSerialConsolePortInfo:=0D
-+      Status =3D HandleCmObject (=0D
-+                 CmObjectId,=0D
-+                 &PlatformRepo->SpcrSerialPort,=0D
-+                 sizeof (PlatformRepo->SpcrSerialPort),=0D
-+                 1,=0D
-+                 CmObject=0D
-+                 );=0D
-+      break;=0D
-+=0D
-+    case  EArmObjSerialDebugPortInfo:=0D
-+      Status =3D HandleCmObject (=0D
-+                 CmObjectId,=0D
-+                 &PlatformRepo->DbgSerialPort,=0D
-+                 sizeof (PlatformRepo->DbgSerialPort),=0D
-+                 1,=0D
-+                 CmObject=0D
-+                 );=0D
-+      break;=0D
-+=0D
-+    case EArmObjGicItsInfo:=0D
-+      Status =3D HandleCmObject (=0D
-+                 CmObjectId,=0D
-+                 PlatformRepo->GicItsInfo,=0D
-+                 sizeof (PlatformRepo->GicItsInfo),=0D
-+                 GicItsInfoCount,=0D
-+                 CmObject=0D
-+                 );=0D
-+      break;=0D
-+=0D
-+    case EArmObjSmmuV3:=0D
-+      Status =3D HandleCmObject (=0D
-+                 CmObjectId,=0D
-+                 PlatformRepo->SmmuV3Info,=0D
-+                 sizeof (PlatformRepo->SmmuV3Info),=0D
-+                 SmmuV3InfoCount,=0D
-+                 CmObject=0D
-+                 );=0D
-+      break;=0D
-+=0D
-+    case EArmObjItsGroup:=0D
-+      Status =3D HandleCmObjectRefByToken (=0D
-+                 This,=0D
-+                 CmObjectId,=0D
-+                 PlatformRepo->ItsGroupInfo,=0D
-+                 sizeof (PlatformRepo->ItsGroupInfo),=0D
-+                 ItsGroupInfoCount,=0D
-+                 Token,=0D
-+                 GetItsGroupInfo,=0D
-+                 CmObject=0D
-+                 );=0D
-+      break;=0D
-+=0D
-+    case EArmObjGicItsIdentifierArray:=0D
-+      Status =3D HandleCmObjectRefByToken (=0D
-+                 This,=0D
-+                 CmObjectId,=0D
-+                 PlatformRepo->ItsIdentifierArray,=0D
-+                 sizeof (PlatformRepo->ItsIdentifierArray),=0D
-+                 ItsIdentifierArrayCount,=0D
-+                 Token,=0D
-+                 GetItsIdentifierArray,=0D
-+                 CmObject=0D
-+                 );=0D
-+      break;=0D
-+=0D
-+    case EArmObjRootComplex:=0D
-+      Status =3D HandleCmObject (=0D
-+                 CmObjectId,=0D
-+                 PlatformRepo->RootComplexInfo,=0D
-+                 sizeof (PlatformRepo->RootComplexInfo),=0D
-+                 RootComplexInfoCount,=0D
-+                 CmObject=0D
-+                 );=0D
-+      break;=0D
-+=0D
-+    case EArmObjIdMappingArray:=0D
-+      Status =3D HandleCmObjectRefByToken (=0D
-+                 This,=0D
-+                 CmObjectId,=0D
-+                 PlatformRepo->DeviceIdMapping,=0D
-+                 sizeof (PlatformRepo->DeviceIdMapping),=0D
-+                 DeviceIdMappingCount,=0D
-+                 Token,=0D
-+                 GetDeviceIdMappingArray,=0D
-+                 CmObject=0D
-+                 );=0D
-+      break;=0D
-+=0D
-+    case EArmObjProcHierarchyInfo:=0D
-+      Status =3D HandleCmObject (=0D
-+                 CmObjectId,=0D
-+                 PlatformRepo->ProcHierarchyInfo,=0D
-+                 sizeof (PlatformRepo->ProcHierarchyInfo),=0D
-+                 ProcHierarchyInfoCount,=0D
-+                 CmObject=0D
-+                 );=0D
-+      break;=0D
-+=0D
-+    case EArmObjCacheInfo:=0D
-+      Status =3D HandleCmObject (=0D
-+                 CmObjectId,=0D
-+                 PlatformRepo->CacheInfo,=0D
-+                 sizeof (PlatformRepo->CacheInfo),=0D
-+                 ARRAY_SIZE (PlatformRepo->CacheInfo),=0D
-+                 CmObject=0D
-+                 );=0D
-+      break;=0D
-+=0D
-+    case EArmObjCmRef:=0D
-+      Status =3D HandleCmObjectSearchPlatformRepo (=0D
-+                 This,=0D
-+                 CmObjectId,=0D
-+                 Token,=0D
-+                 GetCmObjRefs,=0D
-+                 CmObject=0D
-+                 );=0D
-+      break;=0D
-+=0D
-+    case EArmObjPciConfigSpaceInfo:=0D
-+      Status =3D HandleCmObject (=0D
-+                 CmObjectId,=0D
-+                 PlatformRepo->PciConfigInfo,=0D
-+                 sizeof (PlatformRepo->PciConfigInfo),=0D
-+                 PciConfigInfoCount,=0D
-+                 CmObject=0D
-+                 );=0D
-+      break;=0D
-+=0D
-+    case EArmObjMemoryAffinityInfo:=0D
-+      Status =3D HandleCmObject (=0D
-+                 CmObjectId,=0D
-+                 PlatformRepo->MemAffInfo,=0D
-+                 sizeof (PlatformRepo->MemAffInfo),=0D
-+                 ARRAY_SIZE (PlatformRepo->MemAffInfo),=0D
-+                 CmObject=0D
-+                 );=0D
-+      break;=0D
-+=0D
-+    default: {=0D
-+      Status =3D EFI_NOT_FOUND;=0D
-+      DEBUG ((=0D
-+        DEBUG_INFO,=0D
-+        "INFO: Object 0x%x. Status =3D %r\n",=0D
-+        CmObjectId,=0D
-+        Status=0D
-+        ));=0D
-+      break;=0D
-+    }=0D
-+  }//switch=0D
-+=0D
-+  return Status;=0D
-+}=0D
-+=0D
-+/** Return an OEM namespace object.=0D
-+=0D
-+  @param [in]      This        Pointer to the Configuration Manager Proto=
col.=0D
-+  @param [in]      CmObjectId  The Configuration Manager Object ID.=0D
-+  @param [in]      Token       An optional token identifying the object. =
If=0D
-+                               unused this must be CM_NULL_TOKEN.=0D
-+  @param [in, out] CmObject    Pointer to the Configuration Manager Objec=
t=0D
-+                               descriptor describing the requested Object=
.=0D
-+=0D
-+  @retval EFI_SUCCESS           Success.=0D
-+  @retval EFI_INVALID_PARAMETER A parameter is invalid.=0D
-+  @retval EFI_NOT_FOUND         The required object information is not fo=
und.=0D
-+**/=0D
-+EFI_STATUS=0D
-+EFIAPI=0D
-+GetOemNameSpaceObject (=0D
-+  IN  CONST EDKII_CONFIGURATION_MANAGER_PROTOCOL  * CONST This,=0D
-+  IN  CONST CM_OBJECT_ID                                  CmObjectId,=0D
-+  IN  CONST CM_OBJECT_TOKEN                               Token OPTIONAL,=
=0D
-+  IN  OUT   CM_OBJ_DESCRIPTOR                     * CONST CmObject=0D
-+  )=0D
-+{=0D
-+  EFI_STATUS  Status;=0D
-+=0D
-+  Status =3D EFI_SUCCESS;=0D
-+  if ((This =3D=3D NULL) || (CmObject =3D=3D NULL)) {=0D
-+    ASSERT (This !=3D NULL);=0D
-+    ASSERT (CmObject !=3D NULL);=0D
-+    return EFI_INVALID_PARAMETER;=0D
-+  }=0D
-+=0D
-+  switch (GET_CM_OBJECT_ID (CmObjectId)) {=0D
-+    default: {=0D
-+      Status =3D EFI_NOT_FOUND;=0D
-+      DEBUG ((=0D
-+        DEBUG_ERROR,=0D
-+        "ERROR: Object 0x%x. Status =3D %r\n",=0D
-+        CmObjectId,=0D
-+        Status=0D
-+        ));=0D
-+      break;=0D
-+    }=0D
-+  }=0D
-+=0D
-+  return Status;=0D
-+}=0D
-+=0D
-+/** The GetObject function defines the interface implemented by the=0D
-+    Configuration Manager Protocol for returning the Configuration=0D
-+    Manager Objects.=0D
-+=0D
-+  @param [in]      This        Pointer to the Configuration Manager Proto=
col.=0D
-+  @param [in]      CmObjectId  The Configuration Manager Object ID.=0D
-+  @param [in]      Token       An optional token identifying the object. =
If=0D
-+                               unused this must be CM_NULL_TOKEN.=0D
-+  @param [in, out] CmObject    Pointer to the Configuration Manager Objec=
t=0D
-+                               descriptor describing the requested Object=
.=0D
-+=0D
-+  @retval EFI_SUCCESS           Success.=0D
-+  @retval EFI_INVALID_PARAMETER A parameter is invalid.=0D
-+  @retval EFI_NOT_FOUND         The required object information is not fo=
und.=0D
-+**/=0D
-+EFI_STATUS=0D
-+EFIAPI=0D
-+N1sdpPlatformGetObject (=0D
-+  IN  CONST EDKII_CONFIGURATION_MANAGER_PROTOCOL  * CONST This,=0D
-+  IN  CONST CM_OBJECT_ID                                  CmObjectId,=0D
-+  IN  CONST CM_OBJECT_TOKEN                               Token OPTIONAL,=
=0D
-+  IN  OUT   CM_OBJ_DESCRIPTOR                     * CONST CmObject=0D
-+  )=0D
-+{=0D
-+  EFI_STATUS  Status;=0D
-+=0D
-+  if ((This =3D=3D NULL) || (CmObject =3D=3D NULL)) {=0D
-+    ASSERT (This !=3D NULL);=0D
-+    ASSERT (CmObject !=3D NULL);=0D
-+    return EFI_INVALID_PARAMETER;=0D
-+  }=0D
-+=0D
-+  switch (GET_CM_NAMESPACE_ID (CmObjectId)) {=0D
-+    case EObjNameSpaceStandard:=0D
-+      Status =3D GetStandardNameSpaceObject (This, CmObjectId, Token, CmO=
bject);=0D
-+      break;=0D
-+    case EObjNameSpaceArm:=0D
-+      Status =3D GetArmNameSpaceObject (This, CmObjectId, Token, CmObject=
);=0D
-+      break;=0D
-+    case EObjNameSpaceOem:=0D
-+      Status =3D GetOemNameSpaceObject (This, CmObjectId, Token, CmObject=
);=0D
-+      break;=0D
-+    default: {=0D
-+      Status =3D EFI_INVALID_PARAMETER;=0D
-+      DEBUG ((=0D
-+        DEBUG_ERROR,=0D
-+        "ERROR: Unknown Namespace Object =3D 0x%x. Status =3D %r\n",=0D
-+        CmObjectId,=0D
-+        Status=0D
-+        ));=0D
-+      break;=0D
-+    }=0D
-+  }=0D
-+=0D
-+  return Status;=0D
-+}=0D
-+=0D
-+/** The SetObject function defines the interface implemented by the=0D
-+    Configuration Manager Protocol for updating the Configuration=0D
-+    Manager Objects.=0D
-+=0D
-+  @param [in]      This        Pointer to the Configuration Manager Proto=
col.=0D
-+  @param [in]      CmObjectId  The Configuration Manager Object ID.=0D
-+  @param [in]      Token       An optional token identifying the object. =
If=0D
-+                               unused this must be CM_NULL_TOKEN.=0D
-+  @param [in]      CmObject    Pointer to the Configuration Manager Objec=
t=0D
-+                               descriptor describing the Object.=0D
-+=0D
-+  @retval EFI_UNSUPPORTED  This operation is not supported.=0D
-+**/=0D
-+EFI_STATUS=0D
-+EFIAPI=0D
-+N1sdpPlatformSetObject (=0D
-+  IN  CONST EDKII_CONFIGURATION_MANAGER_PROTOCOL  * CONST This,=0D
-+  IN  CONST CM_OBJECT_ID                                  CmObjectId,=0D
-+  IN  CONST CM_OBJECT_TOKEN                               Token OPTIONAL,=
=0D
-+  IN        CM_OBJ_DESCRIPTOR                     * CONST CmObject=0D
-+  )=0D
-+{=0D
-+  return EFI_UNSUPPORTED;=0D
-+}=0D
-+=0D
-+/** A structure describing the configuration manager protocol interface.=
=0D
-+*/=0D
-+STATIC=0D
-+CONST=0D
-+EDKII_CONFIGURATION_MANAGER_PROTOCOL N1sdpPlatformConfigManagerProtocol =
=3D {=0D
-+  CREATE_REVISION(1,0),=0D
-+  N1sdpPlatformGetObject,=0D
-+  N1sdpPlatformSetObject,=0D
-+  &N1sdpRepositoryInfo=0D
-+};=0D
-+=0D
-+/**=0D
-+  Entrypoint of Configuration Manager Dxe.=0D
-+=0D
-+  @param  ImageHandle=0D
-+  @param  SystemTable=0D
-+=0D
-+  @return EFI_SUCCESS=0D
-+  @return EFI_LOAD_ERROR=0D
-+  @return EFI_OUT_OF_RESOURCES=0D
-+=0D
-+**/=0D
-+EFI_STATUS=0D
-+EFIAPI=0D
-+ConfigurationManagerDxeInitialize (=0D
-+  IN EFI_HANDLE          ImageHandle,=0D
-+  IN EFI_SYSTEM_TABLE  * SystemTable=0D
-+  )=0D
-+{=0D
-+  EFI_STATUS  Status;=0D
-+  NEOVERSEN1SOC_PLAT_INFO       *PlatInfo;=0D
-+  UINT64                        Dram2Size;=0D
-+  UINT64                        RemoteDdrSize =3D 0;=0D
-+=0D
-+  PlatInfo =3D (NEOVERSEN1SOC_PLAT_INFO *)NEOVERSEN1SOC_PLAT_INFO_STRUCT_=
BASE;=0D
-+  Dram2Size =3D ((PlatInfo->LocalDdrSize - 2) * 1024UL * 1024UL * 1024UL)=
;=0D
-+=0D
-+  N1sdpPlatformConfigManagerProtocol.PlatRepoInfo->MemAffInfo[LOCAL_DDR_R=
EGION2]. \=0D
-+    Length =3D Dram2Size;=0D
-+=0D
-+  if (PlatInfo->MultichipMode =3D=3D 1) {=0D
-+    RemoteDdrSize =3D ((PlatInfo->RemoteDdrSize -2) * 1024UL * 1024UL * 1=
024UL);=0D
-+=0D
-+    //Update Remote DDR Region1=0D
-+    N1sdpPlatformConfigManagerProtocol.PlatRepoInfo->MemAffInfo[REMOTE_DD=
R_REGION1]. \=0D
-+      ProximityDomain =3D 1;=0D
-+    N1sdpPlatformConfigManagerProtocol.PlatRepoInfo->MemAffInfo[REMOTE_DD=
R_REGION1]. \=0D
-+      BaseAddress =3D FixedPcdGet64 (PcdExtMemorySpace) + FixedPcdGet64 (=
PcdSystemMemoryBase);=0D
-+    N1sdpPlatformConfigManagerProtocol.PlatRepoInfo->MemAffInfo[REMOTE_DD=
R_REGION1]. \=0D
-+      Length =3D FixedPcdGet64 (PcdSystemMemorySize);=0D
-+    N1sdpPlatformConfigManagerProtocol.PlatRepoInfo->MemAffInfo[REMOTE_DD=
R_REGION1]. \=0D
-+      Flags =3D EFI_ACPI_6_3_MEMORY_ENABLED;=0D
-+=0D
-+    //Update Remote DDR Region2=0D
-+    N1sdpPlatformConfigManagerProtocol.PlatRepoInfo->MemAffInfo[REMOTE_DD=
R_REGION2]. \=0D
-+      ProximityDomain =3D 1;=0D
-+    N1sdpPlatformConfigManagerProtocol.PlatRepoInfo->MemAffInfo[REMOTE_DD=
R_REGION2]. \=0D
-+      BaseAddress =3D FixedPcdGet64 (PcdExtMemorySpace) + FixedPcdGet64 (=
PcdDramBlock2Base);=0D
-+    N1sdpPlatformConfigManagerProtocol.PlatRepoInfo->MemAffInfo[REMOTE_DD=
R_REGION2]. \=0D
-+      Length =3D RemoteDdrSize;=0D
-+    N1sdpPlatformConfigManagerProtocol.PlatRepoInfo->MemAffInfo[REMOTE_DD=
R_REGION2]. \=0D
-+      Flags =3D EFI_ACPI_6_3_MEMORY_ENABLED;=0D
-+  }=0D
-+=0D
-+  // Initialize the Platform Configuration Repository before installing t=
he=0D
-+  // Configuration Manager Protocol=0D
-+  Status =3D InitializePlatformRepository (=0D
-+    N1sdpPlatformConfigManagerProtocol.PlatRepoInfo=0D
-+    );=0D
-+  if (EFI_ERROR (Status)) {=0D
-+    DEBUG ((=0D
-+      DEBUG_ERROR,=0D
-+      "ERROR: Failed to initialize the Platform Configuration Repository.=
" \=0D
-+      " Status =3D %r\n",=0D
-+      Status=0D
-+      ));=0D
-+  }=0D
-+=0D
-+  Status =3D gBS->InstallProtocolInterface (=0D
-+                  &ImageHandle,=0D
-+                  &gEdkiiConfigurationManagerProtocolGuid,=0D
-+                  EFI_NATIVE_INTERFACE,=0D
-+                  (VOID*)&N1sdpPlatformConfigManagerProtocol=0D
-+                  );=0D
-+  if (EFI_ERROR (Status)) {=0D
-+    DEBUG ((=0D
-+      DEBUG_ERROR,=0D
-+      "ERROR: Failed to get Install Configuration Manager Protocol." \=0D
-+      " Status =3D %r\n",=0D
-+      Status=0D
-+      ));=0D
-+    goto error_handler;=0D
-+  }=0D
-+=0D
-+error_handler:=0D
-+  return Status;=0D
-+}=0D
-diff --git a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerD=
xe/ConfigurationManager.h b/Platform/ARM/N1Sdp/ConfigurationManager/Configu=
rationManagerDxe/ConfigurationManager.h
-new file mode 100644
-index 0000000000..d7bd5bdd94
---- /dev/null
-+++ b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Conf=
igurationManager.h
-@@ -0,0 +1,310 @@
-+/** @file=0D
-+=0D
-+  Copyright (c) 2021, ARM Limited. All rights reserved.<BR>=0D
-+=0D
-+  SPDX-License-Identifier: BSD-2-Clause-Patent=0D
-+=0D
-+  @par Glossary:=0D
-+    - Cm or CM   - Configuration Manager=0D
-+    - Obj or OBJ - Object=0D
-+**/=0D
-+=0D
-+#ifndef CONFIGURATION_MANAGER_H_=0D
-+#define CONFIGURATION_MANAGER_H_=0D
-+=0D
-+/** C array containing the compiled AML template.=0D
-+    This symbol is defined in the auto generated C file=0D
-+    containing the AML bytecode array.=0D
-+*/=0D
-+extern CHAR8  dsdt_aml_code[];=0D
-+extern CHAR8  ssdtpci_aml_code[];=0D
-+extern CHAR8  ssdtremotepci_aml_code[];=0D
-+=0D
-+/** The configuration manager version.=0D
-+*/=0D
-+#define CONFIGURATION_MANAGER_REVISION CREATE_REVISION (1, 0)=0D
-+=0D
-+/** The OEM ID=0D
-+*/=0D
-+#define CFG_MGR_OEM_ID    { 'A', 'R', 'M', 'L', 'T', 'D' }=0D
-+=0D
-+/** A helper macro for mapping a reference token=0D
-+*/=0D
-+#define REFERENCE_TOKEN(Field)                                    \=0D
-+  (CM_OBJECT_TOKEN)((UINT8*)&N1sdpRepositoryInfo +                \=0D
-+    OFFSET_OF (EDKII_PLATFORM_REPOSITORY_INFO, Field))=0D
-+=0D
-+/** A helper macro that constructs the MPID based on the=0D
-+    Aff0, Aff1, Aff2, Aff3 values=0D
-+*/=0D
-+#define GET_MPID3(Aff3, Aff2, Aff1, Aff0)                         \=0D
-+  (((Aff3##ULL) << 32) | ((Aff2) << 16) | ((Aff1) << 8) | (Aff0))=0D
-+=0D
-+/** A helper macro for populating the GIC CPU information=0D
-+*/=0D
-+#define GICC_ENTRY(                                                      =
\=0D
-+          CPUInterfaceNumber,                                            =
\=0D
-+          Mpidr,                                                         =
\=0D
-+          PmuIrq,                                                        =
\=0D
-+          VGicIrq,                                                       =
\=0D
-+          GicRedistBase,                                                 =
\=0D
-+          EnergyEfficiency,                                              =
\=0D
-+          SpeIrq,                                                        =
\=0D
-+          ProximityDomain,                                               =
\=0D
-+          ClockDomain                                                    =
\=0D
-+          ) {                                                            =
\=0D
-+    CPUInterfaceNumber,       /* UINT32  CPUInterfaceNumber           */ =
\=0D
-+    CPUInterfaceNumber,       /* UINT32  AcpiProcessorUid             */ =
\=0D
-+    EFI_ACPI_6_2_GIC_ENABLED, /* UINT32  Flags                        */ =
\=0D
-+    0,                        /* UINT32  ParkingProtocolVersion       */ =
\=0D
-+    PmuIrq,                   /* UINT32  PerformanceInterruptGsiv     */ =
\=0D
-+    0,                        /* UINT64  ParkedAddress                */ =
\=0D
-+    FixedPcdGet64 (                                                      =
\=0D
-+      PcdGicInterruptInterfaceBase                                       =
\=0D
-+      ),                      /* UINT64  PhysicalBaseAddress          */ =
\=0D
-+    0,                        /* UINT64  GICV                         */ =
\=0D
-+    0,                        /* UINT64  GICH                         */ =
\=0D
-+    VGicIrq,                  /* UINT32  VGICMaintenanceInterrupt     */ =
\=0D
-+    GicRedistBase,            /* UINT64  GICRBaseAddress              */ =
\=0D
-+    Mpidr,                    /* UINT64  MPIDR                        */ =
\=0D
-+    EnergyEfficiency,         /* UINT8   ProcessorPowerEfficiencyClass*/ =
\=0D
-+    SpeIrq,                   /* UINT16  SpeOverflowInterrupt         */ =
\=0D
-+    ProximityDomain,          /* UINT32  ProximityDomain              */ =
\=0D
-+    ClockDomain,              /* UINT32  ClockDomain                  */ =
\=0D
-+    EFI_ACPI_6_3_GICC_ENABLED,/* UINT32  Flags                        */ =
\=0D
-+    }=0D
-+=0D
-+/** A helper macro for populating the Processor Hierarchy Node flags=0D
-+*/=0D
-+#define PROC_NODE_FLAGS(                                                \=
=0D
-+          PhysicalPackage,                                              \=
=0D
-+          AcpiProcessorIdValid,                                         \=
=0D
-+          ProcessorIsThread,                                            \=
=0D
-+          NodeIsLeaf,                                                   \=
=0D
-+          IdenticalImplementation                                       \=
=0D
-+          )                                                             \=
=0D
-+  (                                                                     \=
=0D
-+    PhysicalPackage |                                                   \=
=0D
-+    (AcpiProcessorIdValid << 1) |                                       \=
=0D
-+    (ProcessorIsThread << 2) |                                          \=
=0D
-+    (NodeIsLeaf << 3) |                                                 \=
=0D
-+    (IdenticalImplementation << 4)                                      \=
=0D
-+  )=0D
-+=0D
-+/** A helper macro for populating the Cache Type Structure's attributes=0D
-+*/=0D
-+#define CACHE_ATTRIBUTES(                                               \=
=0D
-+          AllocationType,                                               \=
=0D
-+          CacheType,                                                    \=
=0D
-+          WritePolicy                                                   \=
=0D
-+          )                                                             \=
=0D
-+  (                                                                     \=
=0D
-+    AllocationType |                                                    \=
=0D
-+    (CacheType << 2) |                                                  \=
=0D
-+    (WritePolicy << 4)                                                  \=
=0D
-+  )=0D
-+=0D
-+/** A function that prepares Configuration Manager Objects for returning.=
=0D
-+  @param [in]  This        Pointer to the Configuration Manager Protocol.=
=0D
-+  @param [in]  CmObjectId  The Configuration Manager Object ID.=0D
-+  @param [in]  Token       A token for identifying the object.=0D
-+  @param [out] CmObject    Pointer to the Configuration Manager Object=0D
-+                           descriptor describing the requested Object.=0D
-+  @retval EFI_SUCCESS           Success.=0D
-+  @retval EFI_INVALID_PARAMETER A parameter is invalid.=0D
-+  @retval EFI_NOT_FOUND         The required object information is not fo=
und.=0D
-+**/=0D
-+typedef EFI_STATUS (*CM_OBJECT_HANDLER_PROC) (=0D
-+  IN  CONST EDKII_CONFIGURATION_MANAGER_PROTOCOL  * CONST This,=0D
-+  IN  CONST CM_OBJECT_ID                                  CmObjectId,=0D
-+  IN  CONST CM_OBJECT_TOKEN                               Token,=0D
-+  IN  OUT   CM_OBJ_DESCRIPTOR                     * CONST CmObject=0D
-+  );=0D
-+=0D
-+/** The number of CPUs=0D
-+*/=0D
-+#define PLAT_CPU_COUNT              4=0D
-+=0D
-+/** The number of ACPI tables to install=0D
-+*/=0D
-+#define PLAT_ACPI_TABLE_COUNT       13=0D
-+=0D
-+/** The number of platform generic timer blocks=0D
-+*/=0D
-+#define PLAT_GTBLOCK_COUNT          1=0D
-+=0D
-+/** The number of timer frames per generic timer block=0D
-+*/=0D
-+#define PLAT_GTFRAME_COUNT          2=0D
-+=0D
-+/** The number of Processor Hierarchy Nodes=0D
-+    - one package node=0D
-+    - two cluster nodes=0D
-+    - two cores in cluster 0=0D
-+    - two cores in cluster 1=0D
-+*/=0D
-+#define PLAT_PROC_HIERARCHY_NODE_COUNT  7=0D
-+=0D
-+/** The number of unique cache structures:=0D
-+    - cluster L3 unified cache=0D
-+    - core L1 instruction cache=0D
-+    - core L1 data cache=0D
-+    - core L2 cache=0D
-+    - slc unified cache=0D
-+*/=0D
-+#define PLAT_CACHE_COUNT                5=0D
-+=0D
-+/** The number of resources private to the cluster=0D
-+    - L3 cache=0D
-+*/=0D
-+#define CLUSTER_RESOURCE_COUNT  1=0D
-+=0D
-+/** The number of resources private to 'core instance=0D
-+    - L1 data cache=0D
-+    - L1 instruction cache=0D
-+    - L2 cache=0D
-+*/=0D
-+#define CORE_RESOURCE_COUNT  3=0D
-+=0D
-+/** The number of resources private to SoC=0D
-+    - slc cache=0D
-+*/=0D
-+#define SOC_RESOURCE_COUNT  1=0D
-+=0D
-+/** Number of memory affinity entries=0D
-+*/=0D
-+#define LOCAL_DDR_REGION1   0=0D
-+#define LOCAL_DDR_REGION2   1=0D
-+#define REMOTE_DDR_REGION1  2=0D
-+#define REMOTE_DDR_REGION2  3=0D
-+#define DDR_REGION_COUNT    4=0D
-+=0D
-+enum {=0D
-+   ITS_SMMU_CCIX =3D 0,=0D
-+   ITS_SMMU_PCIE,=0D
-+   ITS_CCIX,=0D
-+   ITS_PCIE,=0D
-+   ITS_MASTER_CHIP_MAX,=0D
-+   ITS_REMOTE_SMMU_PCIE =3D ITS_MASTER_CHIP_MAX,=0D
-+   ITS_REMOTE_PCIE,=0D
-+   ITS_MAX=0D
-+};=0D
-+=0D
-+enum {=0D
-+   SMMUV3INFO_PCIE =3D 0,=0D
-+   SMMUV3INFO_CCIX,=0D
-+   SMMUV3INFO_MASTER_CHIP_MAX,=0D
-+   SMMUV3INFO_REMOTE_PCIE =3D SMMUV3INFO_MASTER_CHIP_MAX,=0D
-+   SMMUV3INFO_MAX=0D
-+};=0D
-+=0D
-+enum {=0D
-+   ROOT_PCIE =3D 0,=0D
-+   ROOT_PCIE_CCIX,=0D
-+   ROOT_PCIE_MASTER_CHIP_MAX,=0D
-+   ROOT_REMOTE_PCIE =3D ROOT_PCIE_MASTER_CHIP_MAX,=0D
-+   ROOT_PCIE_MAX=0D
-+};=0D
-+=0D
-+enum {=0D
-+   DEVICEIDMAPPING_SMMU_PCIE =3D 0,=0D
-+   DEVICEIDMAPPING_SMMU_CCIX,=0D
-+   DEVICEIDMAPPING_PCIE,=0D
-+   DEVICEIDMAPPING_MASTER_CHIP_MAX,=0D
-+   DEVICEIDMAPPING_REMOTE_SMMU_PCIE =3D DEVICEIDMAPPING_MASTER_CHIP_MAX,=
=0D
-+   DEVICEIDMAPPING_REMOTE_PCIE,=0D
-+   DEVICEIDMAPPING_MAX,=0D
-+};=0D
-+=0D
-+/** A structure describing the platform configuration=0D
-+    manager repository information=0D
-+*/=0D
-+typedef struct PlatformRepositoryInfo {=0D
-+  /// Configuration Manager Information=0D
-+  CM_STD_OBJ_CONFIGURATION_MANAGER_INFO CmInfo;=0D
-+=0D
-+  /// List of ACPI tables=0D
-+  CM_STD_OBJ_ACPI_TABLE_INFO            CmAcpiTableList[PLAT_ACPI_TABLE_C=
OUNT];=0D
-+=0D
-+  /// Boot architecture information=0D
-+  CM_ARM_BOOT_ARCH_INFO                 BootArchInfo;=0D
-+=0D
-+#ifdef HEADLESS_PLATFORM=0D
-+  /// Fixed feature flag information=0D
-+  CM_ARM_FIXED_FEATURE_FLAGS            FixedFeatureFlags;=0D
-+#endif=0D
-+=0D
-+  /// Power management profile information=0D
-+  CM_ARM_POWER_MANAGEMENT_PROFILE_INFO  PmProfileInfo;=0D
-+=0D
-+  /// GIC CPU interface information=0D
-+  CM_ARM_GICC_INFO                      GicCInfo[PLAT_CPU_COUNT * 2];=0D
-+=0D
-+  /// GIC distributor information=0D
-+  CM_ARM_GICD_INFO                      GicDInfo;=0D
-+=0D
-+  /// GIC Redistributor information=0D
-+  CM_ARM_GIC_REDIST_INFO                GicRedistInfo[2];=0D
-+=0D
-+  /// GIC ITS information=0D
-+  CM_ARM_GIC_ITS_INFO                   GicItsInfo[ITS_MAX];=0D
-+=0D
-+  /// Generic timer information=0D
-+  CM_ARM_GENERIC_TIMER_INFO             GenericTimerInfo;=0D
-+=0D
-+  /// Generic timer block information=0D
-+  CM_ARM_GTBLOCK_INFO                   GTBlockInfo[PLAT_GTBLOCK_COUNT];=
=0D
-+=0D
-+  /// Generic timer frame information=0D
-+  CM_ARM_GTBLOCK_TIMER_FRAME_INFO       GTBlock0TimerInfo[PLAT_GTFRAME_CO=
UNT];=0D
-+=0D
-+  /// Watchdog information=0D
-+  CM_ARM_GENERIC_WATCHDOG_INFO          Watchdog;=0D
-+=0D
-+  /** Serial port information for the=0D
-+      serial port console redirection port=0D
-+  */=0D
-+  CM_ARM_SERIAL_PORT_INFO               SpcrSerialPort;=0D
-+=0D
-+  /// Serial port information for the DBG2 UART port=0D
-+  CM_ARM_SERIAL_PORT_INFO               DbgSerialPort;=0D
-+=0D
-+  // Processor topology information=0D
-+  CM_ARM_PROC_HIERARCHY_INFO            ProcHierarchyInfo[PLAT_PROC_HIERA=
RCHY_NODE_COUNT * 2];=0D
-+=0D
-+  // Cache information=0D
-+  CM_ARM_CACHE_INFO                     CacheInfo[PLAT_CACHE_COUNT];=0D
-+=0D
-+  // Cluster private resources=0D
-+  CM_ARM_OBJ_REF                        ClusterResources[CLUSTER_RESOURCE=
_COUNT];=0D
-+=0D
-+  // Core private resources=0D
-+  CM_ARM_OBJ_REF                        CoreResources[CORE_RESOURCE_COUNT=
];=0D
-+=0D
-+  // SoC Resources=0D
-+  CM_ARM_OBJ_REF                        SocResources[SOC_RESOURCE_COUNT];=
=0D
-+=0D
-+  /// ITS Group node=0D
-+  CM_ARM_ITS_GROUP_NODE                 ItsGroupInfo[ITS_MAX];=0D
-+=0D
-+  /// ITS Identifier array=0D
-+  CM_ARM_ITS_IDENTIFIER                 ItsIdentifierArray[ITS_MAX];=0D
-+=0D
-+  /// SMMUv3 node=0D
-+  CM_ARM_SMMUV3_NODE                    SmmuV3Info[SMMUV3INFO_MAX];=0D
-+=0D
-+  /// PCI Root complex node=0D
-+  CM_ARM_ROOT_COMPLEX_NODE              RootComplexInfo[ROOT_PCIE_MAX];=0D
-+=0D
-+  /// Array of DeviceID mapping=0D
-+  CM_ARM_ID_MAPPING                     DeviceIdMapping[DEVICEIDMAPPING_M=
AX][2];=0D
-+=0D
-+  /// PCI configuration space information=0D
-+  CM_ARM_PCI_CONFIG_SPACE_INFO          PciConfigInfo[ROOT_PCIE_MAX];=0D
-+=0D
-+  /// Memory Affinity Info=0D
-+  CM_ARM_MEMORY_AFFINITY_INFO           MemAffInfo[DDR_REGION_COUNT];=0D
-+=0D
-+} EDKII_PLATFORM_REPOSITORY_INFO;=0D
-+=0D
-+#endif // CONFIGURATION_MANAGER_H_=0D
-diff --git a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerD=
xe/ConfigurationManagerDxe.inf b/Platform/ARM/N1Sdp/ConfigurationManager/Co=
nfigurationManagerDxe/ConfigurationManagerDxe.inf
-new file mode 100644
-index 0000000000..c91495a295
---- /dev/null
-+++ b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Conf=
igurationManagerDxe.inf
-@@ -0,0 +1,171 @@
-+## @file=0D
-+#  Configuration Manager Dxe=0D
-+#=0D
-+#  Copyright (c) 2021, ARM Limited. All rights reserved.<BR>=0D
-+#=0D
-+#  SPDX-License-Identifier: BSD-2-Clause-Patent=0D
-+#=0D
-+##=0D
-+=0D
-+[Defines]=0D
-+  INF_VERSION                    =3D 0x0001001B=0D
-+  BASE_NAME                      =3D ConfigurationManagerDxe=0D
-+  FILE_GUID                      =3D 6F9C3B47-6F7D-44B6-87E5-4B7F44A60147=
=0D
-+  MODULE_TYPE                    =3D DXE_DRIVER=0D
-+  VERSION_STRING                 =3D 1.0=0D
-+  ENTRY_POINT                    =3D ConfigurationManagerDxeInitialize=0D
-+=0D
-+#=0D
-+# The following information is for reference only and not required by the=
 build tools.=0D
-+#=0D
-+#  VALID_ARCHITECTURES           =3D ARM AARCH64=0D
-+#=0D
-+=0D
-+[Sources]=0D
-+  AslTables/Dsdt.asl=0D
-+  AslTables/SsdtPci.asl=0D
-+  AslTables/SsdtRemotePci.asl=0D
-+  ConfigurationManager.c=0D
-+  Hmat.c=0D
-+=0D
-+[Packages]=0D
-+  ArmPkg/ArmPkg.dec=0D
-+  ArmPlatformPkg/ArmPlatformPkg.dec=0D
-+  DynamicTablesPkg/DynamicTablesPkg.dec=0D
-+  EmbeddedPkg/EmbeddedPkg.dec=0D
-+  MdeModulePkg/MdeModulePkg.dec=0D
-+  MdePkg/MdePkg.dec=0D
-+  Platform/ARM/N1Sdp/N1SdpPlatform.dec=0D
-+  Platform/ARM/VExpressPkg/ArmVExpressPkg.dec=0D
-+  Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec=0D
-+=0D
-+[LibraryClasses]=0D
-+  ArmPlatformLib=0D
-+  PrintLib=0D
-+  UefiBootServicesTableLib=0D
-+  UefiDriverEntryPoint=0D
-+  UefiRuntimeServicesTableLib=0D
-+=0D
-+[Protocols]=0D
-+  gEdkiiConfigurationManagerProtocolGuid=0D
-+=0D
-+[FixedPcd]=0D
-+  # PL011 Serial Debug UART=0D
-+  gArmPlatformTokenSpaceGuid.PcdSerialDbgRegisterBase=0D
-+  gArmPlatformTokenSpaceGuid.PcdSerialDbgUartBaudRate=0D
-+  gArmPlatformTokenSpaceGuid.PcdSerialDbgUartClkInHz=0D
-+=0D
-+  gArmPlatformTokenSpaceGuid.PL011UartClkInHz=0D
-+  gArmPlatformTokenSpaceGuid.PL011UartInterrupt=0D
-+=0D
-+  gArmTokenSpaceGuid.PcdArmArchTimerHypIntrNum=0D
-+  gArmTokenSpaceGuid.PcdArmArchTimerIntrNum=0D
-+  gArmTokenSpaceGuid.PcdArmArchTimerSecIntrNum=0D
-+  gArmTokenSpaceGuid.PcdArmArchTimerVirtIntrNum=0D
-+=0D
-+  # SBSA Generic Watchdog=0D
-+  gArmTokenSpaceGuid.PcdGenericWatchdogControlBase=0D
-+  gArmTokenSpaceGuid.PcdGenericWatchdogEl2IntrNum=0D
-+  gArmTokenSpaceGuid.PcdGenericWatchdogRefreshBase=0D
-+=0D
-+  gArmTokenSpaceGuid.PcdGicDistributorBase=0D
-+  gArmTokenSpaceGuid.PcdGicInterruptInterfaceBase=0D
-+  gArmTokenSpaceGuid.PcdGicRedistributorsBase=0D
-+=0D
-+  gEfiMdeModulePkgTokenSpaceGuid.PcdSerialRegisterBase=0D
-+  gEfiMdePkgTokenSpaceGuid.PcdUartDefaultBaudRate=0D
-+=0D
-+  gArmPlatformTokenSpaceGuid.PcdCoreCount=0D
-+  gArmPlatformTokenSpaceGuid.PcdClusterCount=0D
-+=0D
-+  gArmN1SdpTokenSpaceGuid.PcdPcieExpressBaseAddress=0D
-+=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdExtMemorySpace=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdDramBlock2Base=0D
-+=0D
-+  gArmTokenSpaceGuid.PcdSystemMemoryBase=0D
-+  gArmTokenSpaceGuid.PcdSystemMemorySize=0D
-+=0D
-+  #PCIe=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieRootPortConfigBaseAddress=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieRootPortConfigBaseSize=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieBusCount=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieBusMax=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieBusMin=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieIoBase=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieIoMaxBase=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieIoSize=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieIoTranslation=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieMmio32Base=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieMmio32MaxBase=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieMmio32Size=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieMmio32Translation=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieMmio64Base=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieMmio64MaxBase=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieMmio64Size=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieMmio64Translation=0D
-+=0D
-+  # CCIX=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixBusCount=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixBusMax=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixBusMin=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixExpressBaseAddress=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixIoBase=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixIoMaxBase=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixIoSize=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixIoTranslation=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixMmio32Base=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixMmio32MaxBase=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixMmio32Size=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixMmio32Translation=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixMmio64Base=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixMmio64MaxBase=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixMmio64Size=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixMmio64Translation=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixRootPortConfigBaseAddress=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixRootPortConfigBaseSize=0D
-+=0D
-+  # Coresight=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsEtm0Base=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsEtm0MaxBase=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsEtm1Base=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsEtm1MaxBase=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsEtm2Base=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsEtm2MaxBase=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsEtm3Base=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsEtm3MaxBase=0D
-+=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsEtf0Base=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsEtf0MaxBase=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsEtf1Base=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsEtf1MaxBase=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsEtf2Base=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsEtf2MaxBase=0D
-+=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsFunnel0Base=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsFunnel0MaxBase=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsFunnel1Base=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsFunnel1MaxBase=0D
-+=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsReplicatorBase=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsReplicatorMaxBase=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsTpiuBase=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsTpiuMaxBase=0D
-+=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsEtrBase=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsEtrMaxBase=0D
-+=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsStmBase=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsStmMaxBase=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsStmStimulusBase=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsStmStimulusSize=0D
-+=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsComponentSize=0D
-+=0D
-+  # Remote PCIe=0D
-+  gArmN1SdpTokenSpaceGuid.PcdRemotePcieIoTranslation=0D
-+  gArmN1SdpTokenSpaceGuid.PcdRemotePcieMmio32Translation=0D
-+  gArmN1SdpTokenSpaceGuid.PcdRemotePcieMmio64Translation=0D
-+=0D
-+[Depex]=0D
-+  TRUE=0D
-diff --git a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerD=
xe/Hmat.c b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe=
/Hmat.c
-new file mode 100644
-index 0000000000..c69d03c9ae
---- /dev/null
-+++ b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Hmat=
.c
-@@ -0,0 +1,104 @@
-+/** @file=0D
-+*  Heterogeneous Memory Attribute Table (HMAT)=0D
-+*=0D
-+*  Copyright (c) 2021, ARM Limited. All rights reserved.<BR>=0D
-+*=0D
-+*  SPDX-License-Identifier: BSD-2-Clause-Patent=0D
-+*=0D
-+**/=0D
-+=0D
-+#include <IndustryStandard/Acpi.h>=0D
-+#include <Library/AcpiLib.h>=0D
-+#include <Library/ArmLib.h>=0D
-+#include "N1SdpAcpiHeader.h"=0D
-+=0D
-+//=0D
-+// Heterogeneous Memory Attribute Table=0D
-+//=0D
-+#pragma pack (1)=0D
-+=0D
-+typedef struct {=0D
-+  EFI_ACPI_6_3_HMAT_STRUCTURE_SYSTEM_LOCALITY_LATENCY_AND_BANDWIDTH_INFO =
LatencyStruct;=0D
-+  UINT32 InitiatorProximityDomainList[1];=0D
-+  UINT32 TargetProximityDomainList[2];=0D
-+  UINT16 LatencyEntry[1][2];=0D
-+} EFI_ACPI_6_3_HMAT_SYSTEM_LOCALITY_LATENCY_STRUCTURE;=0D
-+=0D
-+typedef struct {=0D
-+  EFI_ACPI_6_3_HETEROGENEOUS_MEMORY_ATTRIBUTE_TABLE_HEADER       Header;=
=0D
-+  EFI_ACPI_6_3_HMAT_STRUCTURE_MEMORY_PROXIMITY_DOMAIN_ATTRIBUTES Memory[2=
];=0D
-+  EFI_ACPI_6_3_HMAT_SYSTEM_LOCALITY_LATENCY_STRUCTURE            LatencyI=
nfo;=0D
-+} EFI_ACPI_HETEROGENEOUS_MEMORY_ATTRIBUTE_TABLE;=0D
-+=0D
-+#pragma pack ()=0D
-+=0D
-+EFI_ACPI_HETEROGENEOUS_MEMORY_ATTRIBUTE_TABLE Hmat =3D {=0D
-+  // Header=0D
-+  {=0D
-+    ARM_ACPI_HEADER (=0D
-+      EFI_ACPI_6_3_HETEROGENEOUS_MEMORY_ATTRIBUTE_TABLE_SIGNATURE,=0D
-+      EFI_ACPI_HETEROGENEOUS_MEMORY_ATTRIBUTE_TABLE,=0D
-+      EFI_ACPI_6_3_HETEROGENEOUS_MEMORY_ATTRIBUTE_TABLE_REVISION=0D
-+    ),=0D
-+    {0x00, 0x00, 0x00, 0x00},=0D
-+  },=0D
-+=0D
-+  // Memory Attribute Structure=0D
-+  {=0D
-+    {=0D
-+      EFI_ACPI_6_3_HMAT_TYPE_MEMORY_PROXIMITY_DOMAIN_ATTRIBUTES, // Type=
=0D
-+      {0x00, 0x00}, // Reserved=0D
-+      40, // Length=0D
-+      {.InitiatorProximityDomainValid =3D 1}, // Flags=0D
-+      {0x00, 0x00}, // Reserved1=0D
-+      0, // InitiatorProximityDomain=0D
-+      0, // MemoryProximityDomain=0D
-+      { 0x00, 0x00, 0x00, 0x00,=0D
-+        0x00, 0x00, 0x00, 0x00,=0D
-+        0x00, 0x00, 0x00, 0x00,=0D
-+        0x00, 0x00, 0x00, 0x00,=0D
-+        0x00, 0x00, 0x00, 0x00,=0D
-+      }, // Reserved2=0D
-+    },=0D
-+    {=0D
-+      EFI_ACPI_6_3_HMAT_TYPE_MEMORY_PROXIMITY_DOMAIN_ATTRIBUTES, // Type=
=0D
-+      {0x00, 0x00}, // Reserved=0D
-+      40, // Length=0D
-+      {.InitiatorProximityDomainValid =3D 1}, // Flags=0D
-+      {0x00, 0x00}, // Reserved1=0D
-+      0, // InitiatorProximityDomain=0D
-+      1, // MemoryProximityDomain=0D
-+      { 0x00, 0x00, 0x00, 0x00,=0D
-+        0x00, 0x00, 0x00, 0x00,=0D
-+        0x00, 0x00, 0x00, 0x00,=0D
-+        0x00, 0x00, 0x00, 0x00,=0D
-+        0x00, 0x00, 0x00, 0x00,=0D
-+      }, // Reserved2=0D
-+    },=0D
-+  },=0D
-+=0D
-+  // System Locality Latency Structure (LatencyInfo)=0D
-+  {=0D
-+    // LatencyStruct=0D
-+    {=0D
-+      EFI_ACPI_6_3_HMAT_TYPE_SYSTEM_LOCALITY_LATENCY_AND_BANDWIDTH_INFO, =
// Type=0D
-+      {0x00, 0x00}, // Reserved=0D
-+      sizeof (EFI_ACPI_6_3_HMAT_SYSTEM_LOCALITY_LATENCY_STRUCTURE), // Le=
ngth=0D
-+      {.MemoryHierarchy =3D 0}, // Flags=0D
-+      0, // DataType - Access latency=0D
-+      {0x00, 0x00}, // Reserved1=0D
-+      1, // NumberOfInitiatorProximityDomains=0D
-+      2, // NumberOfTargetProximityDomains=0D
-+      {0x00, 0x00, 0x00, 0x00}, // Reserved2=0D
-+      1000, // EntryBaseUnit - 1000ps =3D 1ns=0D
-+    },=0D
-+    // InitiatorProximityDomainList=0D
-+    { 0 },=0D
-+    // TargetProximityDomainList=0D
-+    { 0, 1 },=0D
-+    // LatencyEntry=0D
-+    {=0D
-+      {119, 200}, // [0][0], [0][1]=0D
-+    },=0D
-+  },=0D
-+};=0D
-diff --git a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerD=
xe/Platform.h b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManage=
rDxe/Platform.h
-new file mode 100644
-index 0000000000..d220b09446
---- /dev/null
-+++ b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Plat=
form.h
-@@ -0,0 +1,92 @@
-+/** @file=0D
-+=0D
-+  Copyright (c) 2021, ARM Limited. All rights reserved.<BR>=0D
-+=0D
-+  SPDX-License-Identifier: BSD-2-Clause-Patent=0D
-+=0D
-+**/=0D
-+=0D
-+#ifndef PLATFORM_H_=0D
-+#define PLATFORM_H_=0D
-+=0D
-+#define ENABLE_MEM_MAPPED_TIMER=0D
-+=0D
-+#ifdef ENABLE_MEM_MAPPED_TIMER=0D
-+// REFCLK CNTControl=0D
-+#define N1SDP_SYSTEM_TIMER_BASE_ADDRESS   0x2A430000=0D
-+// REFCLK CNTRead=0D
-+#define N1SDP_CNT_READ_BASE_ADDRESS       0x2A800000=0D
-+#else=0D
-+#define N1SDP_SYSTEM_TIMER_BASE_ADDRESS   0xFFFFFFFFFFFFFFFF=0D
-+#define N1SDP_CNT_READ_BASE_ADDRESS       0xFFFFFFFFFFFFFFFF=0D
-+#endif=0D
-+=0D
-+// GT Block Timer=0D
-+// AP_REFCLK CNTCTL=0D
-+#define N1SDP_GT_BLOCK_CTL_BASE           0x2A810000=0D
-+#define N1SDP_TIMER_FRAMES_COUNT          2=0D
-+=0D
-+// GT Block Timer Frames=0D
-+// AP_REFCLK_S CNTBase0=0D
-+#define N1SDP_GT_BLOCK_FRAME0_CTL_BASE      0x2A830000=0D
-+#define N1SDP_GT_BLOCK_FRAME0_CTL_EL0_BASE  0xFFFFFFFFFFFFFFFF=0D
-+#define N1SDP_GT_BLOCK_FRAME0_GSIV          92=0D
-+=0D
-+// AP_REFCLK_NS CNTBase1=0D
-+#define N1SDP_GT_BLOCK_FRAME1_CTL_BASE      0x2A820000=0D
-+#define N1SDP_GT_BLOCK_FRAME1_CTL_EL0_BASE  0xFFFFFFFFFFFFFFFF=0D
-+#define N1SDP_GT_BLOCK_FRAME1_GSIV          91=0D
-+=0D
-+#define GTDT_TIMER_EDGE_TRIGGERED   \=0D
-+          EFI_ACPI_6_3_GTDT_TIMER_FLAG_TIMER_INTERRUPT_MODE=0D
-+#define GTDT_TIMER_LEVEL_TRIGGERED  0=0D
-+#define GTDT_TIMER_ACTIVE_LOW       \=0D
-+          EFI_ACPI_6_3_GTDT_TIMER_FLAG_TIMER_INTERRUPT_POLARITY=0D
-+#define GTDT_TIMER_ACTIVE_HIGH      0=0D
-+#define GTDT_TIMER_SAVE_CONTEXT     \=0D
-+          EFI_ACPI_6_3_GTDT_TIMER_FLAG_ALWAYS_ON_CAPABILITY=0D
-+#define GTDT_TIMER_LOSE_CONTEXT     0=0D
-+=0D
-+#define N1SDP_GTDT_GTIMER_FLAGS       (GTDT_TIMER_LOSE_CONTEXT   | \=0D
-+                                         GTDT_TIMER_ACTIVE_LOW   | \=0D
-+                                         GTDT_TIMER_LEVEL_TRIGGERED)=0D
-+=0D
-+// GT Block Timer Flags=0D
-+#define GTX_TIMER_EDGE_TRIGGERED    \=0D
-+          EFI_ACPI_6_3_GTDT_GT_BLOCK_TIMER_FLAG_TIMER_INTERRUPT_MODE=0D
-+#define GTX_TIMER_LEVEL_TRIGGERED   0=0D
-+#define GTX_TIMER_ACTIVE_LOW        \=0D
-+          EFI_ACPI_6_3_GTDT_GT_BLOCK_TIMER_FLAG_TIMER_INTERRUPT_POLARITY=
=0D
-+#define GTX_TIMER_ACTIVE_HIGH       0=0D
-+=0D
-+#define N1SDP_GTX_TIMER_FLAGS         (GTX_TIMER_ACTIVE_HIGH | \=0D
-+                                         GTX_TIMER_LEVEL_TRIGGERED)=0D
-+=0D
-+#define GTX_TIMER_SECURE            \=0D
-+          EFI_ACPI_6_3_GTDT_GT_BLOCK_COMMON_FLAG_SECURE_TIMER=0D
-+#define GTX_TIMER_NON_SECURE        0=0D
-+#define GTX_TIMER_SAVE_CONTEXT      \=0D
-+          EFI_ACPI_6_3_GTDT_GT_BLOCK_COMMON_FLAG_ALWAYS_ON_CAPABILITY=0D
-+#define GTX_TIMER_LOSE_CONTEXT      0=0D
-+=0D
-+#define N1SDP_GTX_COMMON_FLAGS_S      (GTX_TIMER_SAVE_CONTEXT      | \=0D
-+                                         GTX_TIMER_SECURE)=0D
-+#define N1SDP_GTX_COMMON_FLAGS_NS     (GTX_TIMER_SAVE_CONTEXT      | \=0D
-+                                         GTX_TIMER_NON_SECURE)=0D
-+=0D
-+// Watchdog=0D
-+#define SBSA_WATCHDOG_EDGE_TRIGGERED   \=0D
-+          EFI_ACPI_6_3_GTDT_SBSA_GENERIC_WATCHDOG_FLAG_TIMER_INTERRUPT_MO=
DE=0D
-+#define SBSA_WATCHDOG_LEVEL_TRIGGERED  0=0D
-+#define SBSA_WATCHDOG_ACTIVE_LOW       \=0D
-+          EFI_ACPI_6_3_GTDT_SBSA_GENERIC_WATCHDOG_FLAG_TIMER_INTERRUPT_PO=
LARITY=0D
-+#define SBSA_WATCHDOG_ACTIVE_HIGH      0=0D
-+#define SBSA_WATCHDOG_SECURE           \=0D
-+          EFI_ACPI_6_3_GTDT_SBSA_GENERIC_WATCHDOG_FLAG_SECURE_TIMER=0D
-+#define SBSA_WATCHDOG_NON_SECURE       0=0D
-+=0D
-+#define N1SDP_SBSA_WATCHDOG_FLAGS        (SBSA_WATCHDOG_NON_SECURE       =
| \=0D
-+                                            SBSA_WATCHDOG_ACTIVE_HIGH    =
| \=0D
-+                                            SBSA_WATCHDOG_LEVEL_TRIGGERED=
)=0D
-+=0D
-+#endif // PLATFORM_H_=0D
-diff --git a/Platform/ARM/N1Sdp/Drivers/PlatformDxe/PlatformDxe.c b/Platfo=
rm/ARM/N1Sdp/Drivers/PlatformDxe/PlatformDxe.c
-index c9eac1e4a9..ed36828cc3 100644
---- a/Platform/ARM/N1Sdp/Drivers/PlatformDxe/PlatformDxe.c
-+++ b/Platform/ARM/N1Sdp/Drivers/PlatformDxe/PlatformDxe.c
-@@ -6,6 +6,7 @@
- *=0D
- **/=0D
- =0D
-+#include <Library/AcpiLib.h>=0D
- #include <Library/DebugLib.h>=0D
- #include <Library/UefiBootServicesTableLib.h>=0D
- #include <Protocol/RamDisk.h>=0D
-diff --git a/Platform/ARM/N1Sdp/Drivers/PlatformDxe/PlatformDxe.inf b/Plat=
form/ARM/N1Sdp/Drivers/PlatformDxe/PlatformDxe.inf
-index 0a3915734d..fce530ee3e 100644
---- a/Platform/ARM/N1Sdp/Drivers/PlatformDxe/PlatformDxe.inf
-+++ b/Platform/ARM/N1Sdp/Drivers/PlatformDxe/PlatformDxe.inf
-@@ -26,9 +26,13 @@
-   Platform/ARM/N1Sdp/N1SdpPlatform.dec=0D
- =0D
- [LibraryClasses]=0D
-+  AcpiLib=0D
-   HobLib=0D
-   UefiDriverEntryPoint=0D
- =0D
-+[Guids]=0D
-+  gN1SdpAcpiTableFileGuid=0D
-+=0D
- [Protocols]=0D
-   gEfiRamDiskProtocolGuid=0D
- =0D
-diff --git a/Platform/ARM/N1Sdp/Include/N1SdpAcpiHeader.h b/Platform/ARM/N=
1Sdp/Include/N1SdpAcpiHeader.h
-new file mode 100644
-index 0000000000..4692ee4f46
---- /dev/null
-+++ b/Platform/ARM/N1Sdp/Include/N1SdpAcpiHeader.h
-@@ -0,0 +1,35 @@
-+/** @file=0D
-+=0D
-+  Copyright (c) 2021, ARM Limited. All rights reserved.<BR>=0D
-+=0D
-+  SPDX-License-Identifier: BSD-2-Clause-Patent=0D
-+=0D
-+**/=0D
-+=0D
-+#ifndef N1SDP_ACPI_HEADER__=0D
-+#define N1SDP_ACPI_HEADER__=0D
-+=0D
-+//=0D
-+// ACPI table information used to initialize tables.=0D
-+//=0D
-+#define EFI_ACPI_ARM_OEM_ID           'A','R','M','L','T','D'   // OEMID =
6 bytes long=0D
-+#define EFI_ACPI_ARM_OEM_TABLE_ID     SIGNATURE_64('A','R','M','N','1','S=
','D','P') // OEM table id 8 bytes long=0D
-+#define EFI_ACPI_ARM_OEM_REVISION     0x20181101=0D
-+#define EFI_ACPI_ARM_CREATOR_ID       SIGNATURE_32('A','R','M',' ')=0D
-+#define EFI_ACPI_ARM_CREATOR_REVISION 0x00000099=0D
-+=0D
-+// A macro to initialise the common header part of EFI ACPI tables as def=
ined by=0D
-+// EFI_ACPI_DESCRIPTION_HEADER structure.=0D
-+#define ARM_ACPI_HEADER(Signature, Type, Revision) {              \=0D
-+    Signature,                      /* UINT32  Signature */       \=0D
-+    sizeof (Type),                  /* UINT32  Length */          \=0D
-+    Revision,                       /* UINT8   Revision */        \=0D
-+    0,                              /* UINT8   Checksum */        \=0D
-+    { EFI_ACPI_ARM_OEM_ID },        /* UINT8   OemId[6] */        \=0D
-+    EFI_ACPI_ARM_OEM_TABLE_ID,      /* UINT64  OemTableId */      \=0D
-+    EFI_ACPI_ARM_OEM_REVISION,      /* UINT32  OemRevision */     \=0D
-+    EFI_ACPI_ARM_CREATOR_ID,        /* UINT32  CreatorId */       \=0D
-+    EFI_ACPI_ARM_CREATOR_REVISION   /* UINT32  CreatorRevision */ \=0D
-+  }=0D
-+=0D
-+#endif /* N1SDP_ACPI_HEADER__ */=0D
-diff --git a/Platform/ARM/N1Sdp/N1SdpPlatform.dec b/Platform/ARM/N1Sdp/N1S=
dpPlatform.dec
-index 6b83d7c442..2a290e0ad4 100644
---- a/Platform/ARM/N1Sdp/N1SdpPlatform.dec
-+++ b/Platform/ARM/N1Sdp/N1SdpPlatform.dec
-@@ -20,17 +20,22 @@
- #=0D
- #########################################################################=
#######=0D
- [Includes.common]=0D
-+  Include                        # Root include for the package=0D
- =0D
- [LibraryClasses]=0D
-   ArmPlatformLib|Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLi=
b.inf=0D
- =0D
- [Guids.common]=0D
-   gArmN1SdpTokenSpaceGuid =3D  { 0xd8f1624a, 0x98c1, 0x4f64, { 0xa6, 0x41=
, 0x19, 0x5e, 0xb5, 0x3b, 0x26, 0x0f } }=0D
-+  gN1SdpAcpiTableFileGuid =3D  { 0x9af67d31, 0x7de8, 0x4a71, { 0xa9, 0xa8=
, 0xa5, 0x97, 0xa2, 0x76, 0x59, 0xce } }=0D
- =0D
- [PcdsFixedAtBuild]=0D
-   gArmN1SdpTokenSpaceGuid.PcdRamDiskBase|0x88000000|UINT32|0x00000001=0D
-   gArmN1SdpTokenSpaceGuid.PcdRamDiskSize|0x18000000|UINT32|0x00000002=0D
- =0D
-+  # PCIe=0D
-+  gArmN1SdpTokenSpaceGuid.PcdPcieExpressBaseAddress|0x70000000|UINT32|0x0=
0000007=0D
-+=0D
-   # External memory=0D
-   gArmNeoverseN1SocTokenSpaceGuid.PcdExtMemorySpace|0|UINT64|0x00000029=0D
- =0D
-@@ -38,9 +43,7 @@
-   gArmN1SdpTokenSpaceGuid.PcdRamDiskSupported|FALSE|BOOLEAN|0x00000003=0D
- =0D
- [PcdsFixedAtBuild.common]=0D
--  #=0D
-   # CoreSight Debug and Trace components=0D
--  #=0D
- =0D
-   # CoreSight ETMs=0D
-   gArmN1SdpTokenSpaceGuid.PcdCsEtm0Base|0x402040000|UINT64|0x0000002D=0D
-@@ -89,3 +92,8 @@
-   # unmapped reserved region results in a DECERR response.=0D
-   #=0D
-   gArmN1SdpTokenSpaceGuid.PcdCsComponentSize|0x1000|UINT32|0x00000049=0D
-+=0D
-+  # Remote Chip PCIe=0D
-+  gArmN1SdpTokenSpaceGuid.PcdRemotePcieIoTranslation|0x40075200000|UINT64=
|0x0000004A=0D
-+  gArmN1SdpTokenSpaceGuid.PcdRemotePcieMmio32Translation|0x40000000000|UI=
NT64|0x0000004B=0D
-+  gArmN1SdpTokenSpaceGuid.PcdRemotePcieMmio64Translation|0x40000000000|UI=
NT64|0x0000004C=0D
-diff --git a/Platform/ARM/N1Sdp/N1SdpPlatform.dsc b/Platform/ARM/N1Sdp/N1S=
dpPlatform.dsc
-index 1b46eb2734..b59a563806 100644
---- a/Platform/ARM/N1Sdp/N1SdpPlatform.dsc
-+++ b/Platform/ARM/N1Sdp/N1SdpPlatform.dsc
-@@ -23,6 +23,8 @@
- =0D
- !include Platform/ARM/VExpressPkg/ArmVExpress.dsc.inc=0D
- !include MdePkg/MdeLibs.dsc.inc=0D
-+!include DynamicTablesPkg/DynamicTables.dsc.inc=0D
-+!include Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManager.dsc=
.inc=0D
- =0D
- [LibraryClasses.common]=0D
-   ArmLib|ArmPkg/Library/ArmLib/ArmBaseLib.inf=0D
-@@ -153,6 +155,9 @@
-   gArmPlatformTokenSpaceGuid.PcdCoreCount|2=0D
-   gArmPlatformTokenSpaceGuid.PcdClusterCount|2=0D
- =0D
-+  # ACPI Table Version=0D
-+  gEfiMdeModulePkgTokenSpaceGuid.PcdAcpiExposedTableVersions|0x20=0D
-+=0D
-   # Runtime Variable storage=0D
-   gEfiMdeModulePkgTokenSpaceGuid.PcdEmuVariableNvStoreReserved|0=0D
-   gEfiMdeModulePkgTokenSpaceGuid.PcdEmuVariableNvModeEnable|TRUE=0D
-@@ -212,6 +217,10 @@
-       BaseMemoryLib|MdePkg/Library/BaseMemoryLib/BaseMemoryLib.inf=0D
-   }=0D
- =0D
-+  # ACPI Support=0D
-+  MdeModulePkg/Universal/Acpi/AcpiTableDxe/AcpiTableDxe.inf=0D
-+  MdeModulePkg/Universal/HiiDatabaseDxe/HiiDatabaseDxe.inf=0D
-+=0D
-   # Platform driver=0D
-   Platform/ARM/N1Sdp/Drivers/PlatformDxe/PlatformDxe.inf=0D
- =0D
-diff --git a/Platform/ARM/N1Sdp/N1SdpPlatform.fdf b/Platform/ARM/N1Sdp/N1S=
dpPlatform.fdf
-index 64a812f563..444f3363e4 100644
---- a/Platform/ARM/N1Sdp/N1SdpPlatform.fdf
-+++ b/Platform/ARM/N1Sdp/N1SdpPlatform.fdf
-@@ -92,6 +92,15 @@ READ_LOCK_STATUS   =3D TRUE
-   INF MdeModulePkg/Universal/SecurityStubDxe/SecurityStubDxe.inf=0D
-   INF MdeModulePkg/Universal/Variable/RuntimeDxe/VariableRuntimeDxe.inf=0D
- =0D
-+  # ACPI Support=0D
-+  INF MdeModulePkg/Universal/Acpi/AcpiTableDxe/AcpiTableDxe.inf=0D
-+=0D
-+  # Configuration Manager=0D
-+  INF Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Con=
figurationManagerDxe.inf=0D
-+=0D
-+  # Dynamic Table fdf=0D
-+  !include DynamicTablesPkg/DynamicTables.fdf.inc=0D
-+=0D
-   # Human Interface Support=0D
-   INF MdeModulePkg/Universal/HiiDatabaseDxe/HiiDatabaseDxe.inf=0D
- =0D
-diff --git a/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec b/Silicon/ARM/Neo=
verseN1Soc/NeoverseN1Soc.dec
-index aa7c6615d1..a8b9019f73 100644
---- a/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec
-+++ b/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec
-@@ -66,3 +66,8 @@
-   gArmNeoverseN1SocTokenSpaceGuid.PcdCcixRootPortConfigBaseSize|0x0000100=
0|UINT32|0x00000027=0D
- =0D
-   gArmNeoverseN1SocTokenSpaceGuid.PcdExtMemorySpace|0x40000000000|UINT64|=
0x00000029=0D
-+=0D
-+  # Remote Chip PCIe=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdRemotePcieIoTranslation|0x4007520000=
0|UINT64|0x0000004A=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdRemotePcieMmio32Translation|0x400000=
00000|UINT64|0x0000004B=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdRemotePcieMmio64Translation|0x400000=
00000|UINT64|0x0000004C=0D
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/Enable-N1SDP-platfor=
m-specific-configs.patch b/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/Enable=
-N1SDP-platform-specific-configs.patch
deleted file mode 100644
index 3c2854d6..00000000
--- a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/Enable-N1SDP-platform-speci=
fic-configs.patch
+++ /dev/null
@@ -1,245 +0,0 @@
-From 94709b223eeb11c56f882d94df93579d2294ce6b Mon Sep 17 00:00:00 2001
-From: Khasim Syed Mohammed <khasim.mohammed@arm.com>
-Date: Tue, 6 Apr 2021 15:20:46 +0530
-Subject: [PATCH 3/4] Platform/ARM/N1Sdp: Enable N1SDP platform specific
- configurations
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
-
-The patch
-  - adds GUIDs for Coresight,
-  - RAM Disk device registration and support.
-
-Change-Id: Ic6adb6400a114c1bbbba08008a8c1e187deb2e4e
-
-Signed-off-by: Deepak Pandey <Deepak.Pandey@arm.com>
-Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
----
- Platform/ARM/N1Sdp/N1SdpPlatform.dec | 91 ++++++++++++++++++++++++++++
- Platform/ARM/N1Sdp/N1SdpPlatform.dsc | 25 +++++++-
- Platform/ARM/N1Sdp/N1SdpPlatform.fdf |  9 ++-
- 3 files changed, 123 insertions(+), 2 deletions(-)
- create mode 100644 Platform/ARM/N1Sdp/N1SdpPlatform.dec
-
-diff --git a/Platform/ARM/N1Sdp/N1SdpPlatform.dec b/Platform/ARM/N1Sdp/N1S=
dpPlatform.dec
-new file mode 100644
-index 0000000000..6b83d7c442
---- /dev/null
-+++ b/Platform/ARM/N1Sdp/N1SdpPlatform.dec
-@@ -0,0 +1,91 @@
-+#=0D
-+#  Copyright (c) 2021, ARM Limited. All rights reserved.<BR>=0D
-+#=0D
-+#  SPDX-License-Identifier: BSD-2-Clause-Patent=0D
-+#=0D
-+=0D
-+[Defines]=0D
-+  DEC_SPECIFICATION              =3D 0x0001001A=0D
-+  PACKAGE_NAME                   =3D N1SdpPlatform=0D
-+  PACKAGE_GUID                   =3D 29aacb23-61e8-4fe2-8a06-793537cd26e9=
=0D
-+  PACKAGE_VERSION                =3D 0.1=0D
-+=0D
-+#########################################################################=
#######=0D
-+#=0D
-+# Include Section - list of Include Paths that are provided by this packa=
ge.=0D
-+#                   Comments are used for Keywords and Module Types.=0D
-+#=0D
-+# Supported Module Types:=0D
-+#  BASE SEC PEI_CORE PEIM DXE_CORE DXE_DRIVER DXE_RUNTIME_DRIVER DXE_SMM_=
DRIVER DXE_SAL_DRIVER UEFI_DRIVER UEFI_APPLICATION=0D
-+#=0D
-+#########################################################################=
#######=0D
-+[Includes.common]=0D
-+=0D
-+[LibraryClasses]=0D
-+  ArmPlatformLib|Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLi=
b.inf=0D
-+=0D
-+[Guids.common]=0D
-+  gArmN1SdpTokenSpaceGuid =3D  { 0xd8f1624a, 0x98c1, 0x4f64, { 0xa6, 0x41=
, 0x19, 0x5e, 0xb5, 0x3b, 0x26, 0x0f } }=0D
-+=0D
-+[PcdsFixedAtBuild]=0D
-+  gArmN1SdpTokenSpaceGuid.PcdRamDiskBase|0x88000000|UINT32|0x00000001=0D
-+  gArmN1SdpTokenSpaceGuid.PcdRamDiskSize|0x18000000|UINT32|0x00000002=0D
-+=0D
-+  # External memory=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdExtMemorySpace|0|UINT64|0x00000029=0D
-+=0D
-+[PcdsFeatureFlag.common]=0D
-+  gArmN1SdpTokenSpaceGuid.PcdRamDiskSupported|FALSE|BOOLEAN|0x00000003=0D
-+=0D
-+[PcdsFixedAtBuild.common]=0D
-+  #=0D
-+  # CoreSight Debug and Trace components=0D
-+  #=0D
-+=0D
-+  # CoreSight ETMs=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsEtm0Base|0x402040000|UINT64|0x0000002D=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsEtm0MaxBase|0x402040FFF|UINT64|0x0000002E=
=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsEtm1Base|0x402140000|UINT64|0x0000002F=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsEtm1MaxBase|0x402140FFF|UINT64|0x00000030=
=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsEtm2Base|0x403040000|UINT64|0x00000031=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsEtm2MaxBase|0x403040FFF|UINT64|0x00000032=
=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsEtm3Base|0x403140000|UINT64|0x00000033=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsEtm3MaxBase|0x403140FFF|UINT64|0x00000034=
=0D
-+=0D
-+  # CoreSight TMC (ETRs/ETFs/ETBs)=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsEtf0Base|0x400410000|UINT64|0x00000035=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsEtf0MaxBase|0x400410FFF|UINT64|0x00000036=
=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsEtf1Base|0x400420000|UINT64|0x00000037=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsEtf1MaxBase|0x400420FFF|UINT64|0x00000038=
=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsEtf2Base|0x400010000|UINT64|0x00000039=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsEtf2MaxBase|0x400010FFF|UINT64|0x0000003A=
=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsEtrBase|0x400120000|UINT64|0x00000043=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsEtrMaxBase|0x400120FFF|UINT64|0x00000044=0D
-+=0D
-+  # CoreSight Dynamic Funnel(s)=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsFunnel0Base|0x4000B0000|UINT64|0x0000003B=
=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsFunnel0MaxBase|0x4000B0FFF|UINT64|0x000000=
3C=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsFunnel1Base|0x4000A0000|UINT64|0x0000003D=
=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsFunnel1MaxBase|0x4000A0FFF|UINT64|0x000000=
3E=0D
-+=0D
-+  # CoreSight Dynamic Replicator(s)=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsReplicatorBase|0x400110000|UINT64|0x000000=
3F=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsReplicatorMaxBase|0x400110FFF|UINT64|0x000=
00040=0D
-+=0D
-+  # CoreSight TPIU=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsTpiuBase|0x400130000|UINT64|0x00000041=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsTpiuMaxBase|0x400130FFF|UINT64|0x00000042=
=0D
-+=0D
-+  # CoreSight STM and STM Stimulus=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsStmBase|0x400800000|UINT64|0x00000045=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsStmMaxBase|0x400800FFF|UINT64|0x00000046=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsStmStimulusBase|0x4D000000|UINT32|0x000000=
47=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsStmStimulusSize|0x1000000|UINT32|0x0000004=
8=0D
-+=0D
-+  # CoreSight Components' Size=0D
-+  #=0D
-+  # Newton TRMs specify the size for these coresight components as 64K.=0D
-+  # The actual size is just 4K though 64K is reserved. Access to the=0D
-+  # unmapped reserved region results in a DECERR response.=0D
-+  #=0D
-+  gArmN1SdpTokenSpaceGuid.PcdCsComponentSize|0x1000|UINT32|0x00000049=0D
-diff --git a/Platform/ARM/N1Sdp/N1SdpPlatform.dsc b/Platform/ARM/N1Sdp/N1S=
dpPlatform.dsc
-index 92376aab8f..1b46eb2734 100644
---- a/Platform/ARM/N1Sdp/N1SdpPlatform.dsc
-+++ b/Platform/ARM/N1Sdp/N1SdpPlatform.dsc
-@@ -1,5 +1,5 @@
- #=0D
--#  Copyright (c) 2018 - 2020, ARM Limited. All rights reserved.=0D
-+#  Copyright (c) 2018 - 2021, ARM Limited. All rights reserved.<BR>=0D
- #=0D
- #  SPDX-License-Identifier: BSD-2-Clause-Patent=0D
- #=0D
-@@ -32,6 +32,9 @@
-   TimerLib|ArmPkg/Library/ArmArchTimerLib/ArmArchTimerLib.inf=0D
-   UefiUsbLib|MdePkg/Library/UefiUsbLib/UefiUsbLib.inf=0D
- =0D
-+  # Ramdisk Support=0D
-+  FileExplorerLib|MdeModulePkg/Library/FileExplorerLib/FileExplorerLib.in=
f=0D
-+=0D
- [LibraryClasses.common.SEC]=0D
-   HobLib|MdePkg/Library/PeiHobLib/PeiHobLib.inf=0D
-   MemoryAllocationLib|MdePkg/Library/PeiMemoryAllocationLib/PeiMemoryAllo=
cationLib.inf=0D
-@@ -70,6 +73,9 @@
- [LibraryClasses.common.DXE_RUNTIME_DRIVER]=0D
-   BaseMemoryLib|MdePkg/Library/BaseMemoryLib/BaseMemoryLib.inf=0D
-   HobLib|MdePkg/Library/DxeHobLib/DxeHobLib.inf=0D
-+!if $(TARGET) !=3D RELEASE=0D
-+  DebugLib|MdePkg/Library/DxeRuntimeDebugLibSerialPort/DxeRuntimeDebugLib=
SerialPort.inf=0D
-+!endif=0D
- =0D
- [LibraryClasses.common.UEFI_DRIVER, LibraryClasses.common.UEFI_APPLICATIO=
N, LibraryClasses.common.DXE_RUNTIME_DRIVER, LibraryClasses.common.DXE_DRIV=
ER]=0D
-   PcdLib|MdePkg/Library/DxePcdLib/DxePcdLib.inf=0D
-@@ -81,11 +87,16 @@
- #########################################################################=
#######=0D
- =0D
- [PcdsFeatureFlag.common]=0D
-+  gArmN1SdpTokenSpaceGuid.PcdRamDiskSupported|TRUE=0D
-   gEfiMdeModulePkgTokenSpaceGuid.PcdTurnOffUsbLegacySupport|TRUE=0D
- =0D
- [PcdsFixedAtBuild.common]=0D
-   gArmTokenSpaceGuid.PcdVFPEnabled|1=0D
- =0D
-+  # RAM Disk=0D
-+  gArmN1SdpTokenSpaceGuid.PcdRamDiskBase|0x88000000=0D
-+  gArmN1SdpTokenSpaceGuid.PcdRamDiskSize|0x18000000=0D
-+=0D
-   # Stacks for MPCores in Normal World=0D
-   gArmPlatformTokenSpaceGuid.PcdCPUCoresStackBase|0x80000000=0D
-   gArmPlatformTokenSpaceGuid.PcdCPUCorePrimaryStackSize|0x40000=0D
-@@ -98,6 +109,9 @@
-   # Secondary DDR memory=0D
-   gArmNeoverseN1SocTokenSpaceGuid.PcdDramBlock2Base|0x8080000000=0D
- =0D
-+  # External memory=0D
-+  gArmNeoverseN1SocTokenSpaceGuid.PcdExtMemorySpace|0x40000000000=0D
-+=0D
-   # GIC Base Addresses=0D
-   gArmTokenSpaceGuid.PcdGicInterruptInterfaceBase|0x2C000000=0D
-   gArmTokenSpaceGuid.PcdGicDistributorBase|0x30000000=0D
-@@ -197,6 +211,9 @@
-       BaseMemoryLib|MdePkg/Library/BaseMemoryLib/BaseMemoryLib.inf=0D
-   }=0D
- =0D
-+  # Platform driver=0D
-+  Platform/ARM/N1Sdp/Drivers/PlatformDxe/PlatformDxe.inf=0D
-+=0D
-   # Human Interface Support=0D
-   MdeModulePkg/Universal/HiiDatabaseDxe/HiiDatabaseDxe.inf=0D
- =0D
-@@ -235,6 +252,9 @@
-   # SATA Controller=0D
-   MdeModulePkg/Bus/Pci/SataControllerDxe/SataControllerDxe.inf=0D
- =0D
-+  # NVMe boot devices=0D
-+  MdeModulePkg/Bus/Pci/NvmExpressDxe/NvmExpressDxe.inf=0D
-+=0D
-   # Usb Support=0D
-   MdeModulePkg/Bus/Pci/UhciDxe/UhciDxe.inf=0D
-   MdeModulePkg/Bus/Pci/EhciDxe/EhciDxe.inf=0D
-@@ -243,3 +263,6 @@
-   MdeModulePkg/Bus/Usb/UsbKbDxe/UsbKbDxe.inf=0D
-   MdeModulePkg/Bus/Usb/UsbMassStorageDxe/UsbMassStorageDxe.inf=0D
-   MdeModulePkg/Bus/Pci/NonDiscoverablePciDeviceDxe/NonDiscoverablePciDevi=
ceDxe.inf=0D
-+=0D
-+  # RAM Disk=0D
-+  MdeModulePkg/Universal/Disk/RamDiskDxe/RamDiskDxe.inf=0D
-diff --git a/Platform/ARM/N1Sdp/N1SdpPlatform.fdf b/Platform/ARM/N1Sdp/N1S=
dpPlatform.fdf
-index c4e1f7b4b8..64a812f563 100644
---- a/Platform/ARM/N1Sdp/N1SdpPlatform.fdf
-+++ b/Platform/ARM/N1Sdp/N1SdpPlatform.fdf
-@@ -1,5 +1,5 @@
- #=0D
--#  Copyright (c) 2018 - 2020, ARM Limited. All rights reserved.=0D
-+#  Copyright (c) 2018 - 2021, ARM Limited. All rights reserved.<BR>=0D
- #=0D
- #  SPDX-License-Identifier: BSD-2-Clause-Patent=0D
- #=0D
-@@ -109,6 +109,9 @@ READ_LOCK_STATUS   =3D TRUE
-   # SATA Controller=0D
-   INF MdeModulePkg/Bus/Pci/SataControllerDxe/SataControllerDxe.inf=0D
- =0D
-+  # NVMe boot devices=0D
-+  INF  MdeModulePkg/Bus/Pci/NvmExpressDxe/NvmExpressDxe.inf=0D
-+=0D
-   # Usb Support=0D
-   INF MdeModulePkg/Bus/Pci/UhciDxe/UhciDxe.inf=0D
-   INF MdeModulePkg/Bus/Pci/EhciDxe/EhciDxe.inf=0D
-@@ -137,10 +140,14 @@ READ_LOCK_STATUS   =3D TRUE
- =0D
-   # FV FileSystem=0D
-   INF MdeModulePkg/Universal/FvSimpleFileSystemDxe/FvSimpleFileSystemDxe.=
inf=0D
-+  INF MdeModulePkg/Universal/Disk/RamDiskDxe/RamDiskDxe.inf=0D
- =0D
-   # UEFI applications=0D
-   INF  ShellPkg/Application/Shell/Shell.inf=0D
- =0D
-+  # Platform driver=0D
-+  INF Platform/ARM/N1Sdp/Drivers/PlatformDxe/PlatformDxe.inf=0D
-+=0D
-   # Bds=0D
-   INF MdeModulePkg/Application/UiApp/UiApp.inf=0D
-   INF MdeModulePkg/Universal/DevicePathDxe/DevicePathDxe.inf=0D
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/Introduce-platform-D=
XE-driver.patch b/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/Introduce-platf=
orm-DXE-driver.patch
deleted file mode 100644
index 274806a4..00000000
--- a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/Introduce-platform-DXE-driv=
er.patch
+++ /dev/null
@@ -1,122 +0,0 @@
-From 5119374cdf5b86e8b6ff38329d87f0e494e2b356 Mon Sep 17 00:00:00 2001
-From: Khasim Syed Mohammed <khasim.mohammed@arm.com>
-Date: Tue, 6 Apr 2021 15:12:27 +0530
-Subject: [PATCH 2/4] Platform/ARM/N1Sdp: Introduce platform DXE driver
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
-
-Add an initial platform DXE driver and support for ramdisk devices.
-
-Change-Id: Idf61fdc3dbde384e0414a80739078bb206784fc3
-
-Signed-off-by: Deepak Pandey <Deepak.Pandey@arm.com>
-Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
----
- .../N1Sdp/Drivers/PlatformDxe/PlatformDxe.c   | 43 +++++++++++++++++++
- .../N1Sdp/Drivers/PlatformDxe/PlatformDxe.inf | 43 +++++++++++++++++++
- 2 files changed, 86 insertions(+)
- create mode 100644 Platform/ARM/N1Sdp/Drivers/PlatformDxe/PlatformDxe.c
- create mode 100644 Platform/ARM/N1Sdp/Drivers/PlatformDxe/PlatformDxe.inf
-
-diff --git a/Platform/ARM/N1Sdp/Drivers/PlatformDxe/PlatformDxe.c b/Platfo=
rm/ARM/N1Sdp/Drivers/PlatformDxe/PlatformDxe.c
-new file mode 100644
-index 0000000000..c9eac1e4a9
---- /dev/null
-+++ b/Platform/ARM/N1Sdp/Drivers/PlatformDxe/PlatformDxe.c
-@@ -0,0 +1,43 @@
-+/** @file=0D
-+*=0D
-+*  Copyright (c) 2021, ARM Limited. All rights reserved.<BR>=0D
-+*=0D
-+*  SPDX-License-Identifier: BSD-2-Clause-Patent=0D
-+*=0D
-+**/=0D
-+=0D
-+#include <Library/DebugLib.h>=0D
-+#include <Library/UefiBootServicesTableLib.h>=0D
-+#include <Protocol/RamDisk.h>=0D
-+=0D
-+EFI_STATUS=0D
-+EFIAPI=0D
-+ArmN1SdpEntryPoint (=0D
-+  IN EFI_HANDLE         ImageHandle,=0D
-+  IN EFI_SYSTEM_TABLE   *SystemTable=0D
-+  )=0D
-+{=0D
-+  EFI_STATUS                 Status;=0D
-+  EFI_RAM_DISK_PROTOCOL      *RamDisk;=0D
-+  EFI_DEVICE_PATH_PROTOCOL   *DevicePath;=0D
-+=0D
-+  Status =3D EFI_UNSUPPORTED;=0D
-+  if (FeaturePcdGet (PcdRamDiskSupported)) {=0D
-+    Status =3D gBS->LocateProtocol (&gEfiRamDiskProtocolGuid, NULL, (VOID=
**) &RamDisk);=0D
-+    if (EFI_ERROR (Status)) {=0D
-+      DEBUG ((DEBUG_ERROR, "%a: Couldn't find the RAM Disk protocol - %r\=
n", __FUNCTION__, Status));=0D
-+      return Status;=0D
-+    }=0D
-+=0D
-+    Status =3D RamDisk->Register (=0D
-+               (UINTN)PcdGet32(PcdRamDiskBase),=0D
-+               (UINTN)PcdGet32(PcdRamDiskSize),=0D
-+               &gEfiVirtualCdGuid,=0D
-+               NULL,=0D
-+               &DevicePath);=0D
-+    if (EFI_ERROR (Status)) {=0D
-+      DEBUG ((DEBUG_ERROR, "%a: Failed to register RAM Disk - %r\n", __FU=
NCTION__, Status));=0D
-+    }=0D
-+  }=0D
-+  return Status;=0D
-+}=0D
-diff --git a/Platform/ARM/N1Sdp/Drivers/PlatformDxe/PlatformDxe.inf b/Plat=
form/ARM/N1Sdp/Drivers/PlatformDxe/PlatformDxe.inf
-new file mode 100644
-index 0000000000..0a3915734d
---- /dev/null
-+++ b/Platform/ARM/N1Sdp/Drivers/PlatformDxe/PlatformDxe.inf
-@@ -0,0 +1,43 @@
-+## @file=0D
-+#=0D
-+#  Copyright (c) 2021, ARM Limited. All rights reserved.<BR>=0D
-+#=0D
-+#  SPDX-License-Identifier: BSD-2-Clause-Patent=0D
-+#=0D
-+##=0D
-+=0D
-+[Defines]=0D
-+  INF_VERSION                    =3D 0x0001001B=0D
-+  BASE_NAME                      =3D PlatformDxe=0D
-+  FILE_GUID                      =3D 11fc8b5a-377d-47a8-aee9-0093d3d3407f=
=0D
-+  MODULE_TYPE                    =3D DXE_DRIVER=0D
-+  VERSION_STRING                 =3D 1.0=0D
-+  ENTRY_POINT                    =3D ArmN1SdpEntryPoint=0D
-+=0D
-+[Sources.common]=0D
-+  PlatformDxe.c=0D
-+=0D
-+[Packages]=0D
-+  ArmPkg/ArmPkg.dec=0D
-+  ArmPlatformPkg/ArmPlatformPkg.dec=0D
-+  EmbeddedPkg/EmbeddedPkg.dec=0D
-+  MdePkg/MdePkg.dec=0D
-+  MdeModulePkg/MdeModulePkg.dec=0D
-+  Platform/ARM/N1Sdp/N1SdpPlatform.dec=0D
-+=0D
-+[LibraryClasses]=0D
-+  HobLib=0D
-+  UefiDriverEntryPoint=0D
-+=0D
-+[Protocols]=0D
-+  gEfiRamDiskProtocolGuid=0D
-+=0D
-+[FeaturePcd]=0D
-+  gArmN1SdpTokenSpaceGuid.PcdRamDiskSupported=0D
-+=0D
-+[FixedPcd]=0D
-+  gArmN1SdpTokenSpaceGuid.PcdRamDiskBase=0D
-+  gArmN1SdpTokenSpaceGuid.PcdRamDiskSize=0D
-+=0D
-+[Depex]=0D
-+  gEfiRamDiskProtocolGuid=0D
---=20
-2.17.1
-
--=20
2.25.1


