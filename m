Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 345FEC433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 12:54:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.40236.1658235241551751548
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 Jul 2022 05:54:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: adam.johnston@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A12B0153B;
	Tue, 19 Jul 2022 05:54:01 -0700 (PDT)
Received: from e114993.cambridge.arm.com (e114993.cambridge.arm.com
 [10.1.194.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4330C3F766;
	Tue, 19 Jul 2022 05:54:00 -0700 (PDT)
From: adam.johnston@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Adam Johnston <adam.johnston@arm.com>
Subject: [PATCH 1/1] arm-bsp/edk2-firmware: Add NT_FW_CONFIG to N1SDP to fix
 aborts when accessing virtual memory
Date: Tue, 19 Jul 2022 13:53:25 +0100
Message-Id: <20220719125325.923598-2-adam.johnston@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220719125325.923598-1-adam.johnston@arm.com>
References: <20220719125325.923598-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 19 Jul 2022 12:54:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3569

From: Adam Johnston <adam.johnston@arm.com>

NT_FW_CONFIG DTB contains platform information passed by TF-A boot
stage. This information is used for Virtual memory map generation
during PEI phase and passed on to DXE phase as a HOB, where it is used
in ConfigurationManagerDxe.

Signed-off-by: Adam Johnston <adam.johnston@arm.com>
---
 .../recipes-bsp/uefi/edk2-firmware-n1sdp.inc  |   6 +
 .../edk2-platforms/add-nt-fw-config.patch     | 474 ++++++++++++++++++
 2 files changed, 480 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/add-=
nt-fw-config.patch

diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc b/meta-a=
rm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
index 8930c040..90c3f2ae 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
@@ -11,6 +11,12 @@ COMPATIBLE_MACHINE =3D "n1sdp"
 EFIDIR             =3D "/EFI/BOOT"
 EFI_BOOT_IMAGE     =3D "bootaa64.efi"
=20
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/edk2-platforms:"
+
+SRC_URI:append =3D "\
+    file://add-nt-fw-config.patch;patchdir=3Dedk2-platforms \
+"
+
 do_deploy:append() {
     EFIPATH=3D$(echo "${EFIDIR}" | sed 's/\//\\/g')
     printf 'FS2:%s\%s\n' "$EFIPATH" "${EFI_BOOT_IMAGE}" > ${DEPLOYDIR}/sta=
rtup.nsh
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/add-nt-fw-c=
onfig.patch b/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/add-nt-fw-=
config.patch
new file mode 100644
index 00000000..f6f18951
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/add-nt-fw-config.p=
atch
@@ -0,0 +1,474 @@
+From cc58709b32d74273736886ccfc08e4723a436ea4 Mon Sep 17 00:00:00 2001
+From: sahil <sahil@arm.com>
+Date: Thu, 17 Mar 2022 16:28:05 +0530
+Subject: [PATCH] Platform/ARM/N1sdp: Add support to parse NT_FW_CONFIG
+
+NT_FW_CONFIG DTB contains platform information passed by
+Tf-A boot stage.
+This information is used for Virtual memory map generation
+during PEI phase and passed on to DXE phase as a HOB, where
+it is used in ConfigurationManagerDxe.
+
+Upstream-Status: Pending
+Signed-off-by: Adam Johnston <adam.johnston@arm.com>
+Signed-off-by: sahil <sahil@arm.com>
+Change-Id: Ib82571280bf1ca5febe5766e618de09e7b70bb02
+
+---
+ .../ConfigurationManager.c                    |  24 ++--
+ .../ConfigurationManagerDxe.inf               |   3 +-
+ .../ARM/NeoverseN1Soc/Include/NeoverseN1Soc.h |  16 +--
+ .../Library/PlatformLib/AArch64/Helper.S      |   4 +-
+ .../Library/PlatformLib/PlatformLib.c         |  12 +-
+ .../Library/PlatformLib/PlatformLib.inf       |   8 +-
+ .../Library/PlatformLib/PlatformLibMem.c      | 103 +++++++++++++++++-
+ Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec   |   7 +-
+ 8 files changed, 152 insertions(+), 25 deletions(-)
+
+diff --git a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerD=
xe/ConfigurationManager.c b/Platform/ARM/N1Sdp/ConfigurationManager/Configu=
rationManagerDxe/ConfigurationManager.c
+index f50623ae3f..e023d47cfd 100644
+--- a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Conf=
igurationManager.c
++++ b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Conf=
igurationManager.c
+@@ -1,7 +1,7 @@
+ /** @file=0D
+   Configuration Manager Dxe=0D
+ =0D
+-  Copyright (c) 2021, ARM Limited. All rights reserved.<BR>=0D
++  Copyright (c) 2021 - 2022, ARM Limited. All rights reserved.<BR>=0D
+ =0D
+   SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ =0D
+@@ -16,6 +16,7 @@
+ #include <IndustryStandard/SerialPortConsoleRedirectionTable.h>=0D
+ #include <Library/ArmLib.h>=0D
+ #include <Library/DebugLib.h>=0D
++#include <Library/HobLib.h>=0D
+ #include <Library/IoLib.h>=0D
+ #include <Library/PcdLib.h>=0D
+ #include <Library/UefiBootServicesTableLib.h>=0D
+@@ -28,6 +29,7 @@
+ #include "Platform.h"=0D
+ =0D
+ extern struct EFI_ACPI_HETEROGENEOUS_MEMORY_ATTRIBUTE_TABLE Hmat;=0D
++static NEOVERSEN1SOC_PLAT_INFO *PlatInfo;=0D
+ =0D
+ /** The platform configuration repository information.=0D
+ */=0D
+@@ -1242,13 +1244,11 @@ InitializePlatformRepository (
+   IN  EDKII_PLATFORM_REPOSITORY_INFO  * CONST PlatRepoInfo=0D
+   )=0D
+ {=0D
+-  NEOVERSEN1SOC_PLAT_INFO       *PlatInfo;=0D
+   UINT64                        Dram2Size;=0D
+   UINT64                        RemoteDdrSize;=0D
+ =0D
+   RemoteDdrSize =3D 0;=0D
+ =0D
+-  PlatInfo =3D (NEOVERSEN1SOC_PLAT_INFO *)NEOVERSEN1SOC_PLAT_INFO_STRUCT_=
BASE;=0D
+   Dram2Size =3D ((PlatInfo->LocalDdrSize - 2) * SIZE_1GB);=0D
+ =0D
+   PlatRepoInfo->MemAffInfo[LOCAL_DDR_REGION2].Length =3D Dram2Size;=0D
+@@ -1512,7 +1512,6 @@ GetGicCInfo (
+   )=0D
+ {=0D
+   EDKII_PLATFORM_REPOSITORY_INFO  * PlatformRepo;=0D
+-  NEOVERSEN1SOC_PLAT_INFO           *PlatInfo;=0D
+   UINT32                            TotalObjCount;=0D
+   UINT32                            ObjIndex;=0D
+ =0D
+@@ -1523,7 +1522,6 @@ GetGicCInfo (
+   }=0D
+ =0D
+   PlatformRepo =3D This->PlatRepoInfo;=0D
+-  PlatInfo =3D (NEOVERSEN1SOC_PLAT_INFO *)NEOVERSEN1SOC_PLAT_INFO_STRUCT_=
BASE;=0D
+ =0D
+   if (PlatInfo->MultichipMode =3D=3D 1) {=0D
+     TotalObjCount =3D PLAT_CPU_COUNT * 2;=0D
+@@ -1623,7 +1621,6 @@ GetStandardNameSpaceObject (
+ {=0D
+   EFI_STATUS                        Status;=0D
+   EDKII_PLATFORM_REPOSITORY_INFO  * PlatformRepo;=0D
+-  NEOVERSEN1SOC_PLAT_INFO           *PlatInfo;=0D
+   UINT32                            AcpiTableCount;=0D
+ =0D
+   if ((This =3D=3D NULL) || (CmObject =3D=3D NULL)) {=0D
+@@ -1634,7 +1631,7 @@ GetStandardNameSpaceObject (
+ =0D
+   Status =3D EFI_NOT_FOUND;=0D
+   PlatformRepo =3D This->PlatRepoInfo;=0D
+-  PlatInfo =3D (NEOVERSEN1SOC_PLAT_INFO *)NEOVERSEN1SOC_PLAT_INFO_STRUCT_=
BASE;=0D
++=0D
+   AcpiTableCount =3D ARRAY_SIZE (PlatformRepo->CmAcpiTableList);=0D
+   if (PlatInfo->MultichipMode =3D=3D 0)=0D
+         AcpiTableCount -=3D 1;=0D
+@@ -1697,7 +1694,6 @@ GetArmNameSpaceObject (
+ {=0D
+   EFI_STATUS                        Status;=0D
+   EDKII_PLATFORM_REPOSITORY_INFO  * PlatformRepo;=0D
+-  NEOVERSEN1SOC_PLAT_INFO           *PlatInfo;=0D
+   UINT32                            GicRedistCount;=0D
+   UINT32                            GicCpuCount;=0D
+   UINT32                            ProcHierarchyInfoCount;=0D
+@@ -1718,8 +1714,6 @@ GetArmNameSpaceObject (
+   Status =3D EFI_NOT_FOUND;=0D
+   PlatformRepo =3D This->PlatRepoInfo;=0D
+ =0D
+-  // Probe for multi chip information=0D
+-  PlatInfo =3D (NEOVERSEN1SOC_PLAT_INFO *)NEOVERSEN1SOC_PLAT_INFO_STRUCT_=
BASE;=0D
+   if (PlatInfo->MultichipMode =3D=3D 1) {=0D
+     GicRedistCount =3D 2;=0D
+     GicCpuCount =3D PLAT_CPU_COUNT * 2;=0D
+@@ -2162,8 +2156,18 @@ ConfigurationManagerDxeInitialize (
+   IN EFI_SYSTEM_TABLE  * SystemTable=0D
+   )=0D
+ {=0D
++  VOID *PlatInfoHob;=0D
+   EFI_STATUS  Status;=0D
+ =0D
++  PlatInfoHob =3D GetFirstGuidHob (&gArmNeoverseN1SocPlatformInfoDescript=
orGuid);=0D
++=0D
++  if (PlatInfoHob =3D=3D NULL) {=0D
++    DEBUG ((DEBUG_ERROR, "Platform HOB is NULL\n"));=0D
++    return EFI_NOT_FOUND;=0D
++  }=0D
++=0D
++  PlatInfo =3D (NEOVERSEN1SOC_PLAT_INFO *)GET_GUID_HOB_DATA (PlatInfoHob)=
;=0D
++=0D
+   // Initialize the Platform Configuration Repository before installing t=
he=0D
+   // Configuration Manager Protocol=0D
+   Status =3D InitializePlatformRepository (=0D
+diff --git a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerD=
xe/ConfigurationManagerDxe.inf b/Platform/ARM/N1Sdp/ConfigurationManager/Co=
nfigurationManagerDxe/ConfigurationManagerDxe.inf
+index 4f8e7f1302..fb59c29501 100644
+--- a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Conf=
igurationManagerDxe.inf
++++ b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Conf=
igurationManagerDxe.inf
+@@ -1,7 +1,7 @@
+ ## @file=0D
+ #  Configuration Manager Dxe=0D
+ #=0D
+-#  Copyright (c) 2021, ARM Limited. All rights reserved.<BR>=0D
++#  Copyright (c) 2021 - 2022, ARM Limited. All rights reserved.<BR>=0D
+ #=0D
+ #  SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ #=0D
+@@ -42,6 +42,7 @@
+ =0D
+ [LibraryClasses]=0D
+   ArmPlatformLib=0D
++  HobLib=0D
+   PrintLib=0D
+   UefiBootServicesTableLib=0D
+   UefiDriverEntryPoint=0D
+diff --git a/Silicon/ARM/NeoverseN1Soc/Include/NeoverseN1Soc.h b/Silicon/A=
RM/NeoverseN1Soc/Include/NeoverseN1Soc.h
+index 097160c7e2..63cebaf0e0 100644
+--- a/Silicon/ARM/NeoverseN1Soc/Include/NeoverseN1Soc.h
++++ b/Silicon/ARM/NeoverseN1Soc/Include/NeoverseN1Soc.h
+@@ -1,6 +1,6 @@
+ /** @file=0D
+ *=0D
+-* Copyright (c) 2018 - 2020, ARM Limited. All rights reserved.=0D
++* Copyright (c) 2018 - 2022, ARM Limited. All rights reserved.=0D
+ *=0D
+ * SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ *=0D
+@@ -41,11 +41,6 @@
+ #define NEOVERSEN1SOC_EXP_PERIPH_BASE0               0x1C000000=0D
+ #define NEOVERSEN1SOC_EXP_PERIPH_BASE0_SZ            0x1300000=0D
+ =0D
+-// Base address to a structure of type NEOVERSEN1SOC_PLAT_INFO which is=0D
+-// pre-populated by a earlier boot stage=0D
+-#define NEOVERSEN1SOC_PLAT_INFO_STRUCT_BASE          (NEOVERSEN1SOC_NON_S=
ECURE_SRAM_BASE + \=0D
+-                                                      0x00008000)=0D
+-=0D
+ /*=0D
+  * Platform information structure stored in Non-secure SRAM. Platform=0D
+  * information are passed from the trusted firmware with the below struct=
ure=0D
+@@ -55,12 +50,17 @@
+ typedef struct {=0D
+   /*! 0 - Single Chip, 1 - Chip to Chip (C2C) */=0D
+   UINT8   MultichipMode;=0D
+-  /*! Slave count in C2C mode */=0D
+-  UINT8   SlaveCount;=0D
++  /*! Secondary chip count in C2C mode */=0D
++  UINT8   SecondaryChipCount;=0D
+   /*! Local DDR memory size in GigaBytes */=0D
+   UINT8   LocalDdrSize;=0D
+   /*! Remote DDR memory size in GigaBytes */=0D
+   UINT8   RemoteDdrSize;=0D
+ } NEOVERSEN1SOC_PLAT_INFO;=0D
+ =0D
++// NT_FW_CONFIG DT structure=0D
++typedef struct {=0D
++  UINT64                  NtFwConfigDtAddr;=0D
++} NEOVERSEN1SOC_NT_FW_CONFIG_INFO_PPI;=0D
++=0D
+ #endif=0D
+diff --git a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/AArch64/Helper.=
S b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/AArch64/Helper.S
+index 8d2069dea8..88ed640d29 100644
+--- a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/AArch64/Helper.S
++++ b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/AArch64/Helper.S
+@@ -1,6 +1,6 @@
+ /** @file=0D
+ *=0D
+-*  Copyright (c) 2019 - 2020, ARM Limited. All rights reserved.=0D
++*  Copyright (c) 2019 - 2022, ARM Limited. All rights reserved.=0D
+ *=0D
+ *  SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ *=0D
+@@ -25,6 +25,8 @@ GCC_ASM_EXPORT(ArmPlatformIsPrimaryCore)
+ // the UEFI firmware through the CPU registers.=0D
+ //=0D
+ ASM_PFX(ArmPlatformPeiBootAction):=0D
++  adr  x10, NtFwConfigDtBlob=0D
++  str  x0, [x10]=0D
+   ret=0D
+ =0D
+ //=0D
+diff --git a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.c b=
/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.c
+index c0effd37f3..fabe902cd0 100644
+--- a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.c
++++ b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.c
+@@ -1,6 +1,6 @@
+ /** @file=0D
+ =0D
+-  Copyright (c) 2018-2021, ARM Limited. All rights reserved.<BR>=0D
++  Copyright (c) 2018 - 2022, ARM Limited. All rights reserved.<BR>=0D
+ =0D
+   SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ =0D
+@@ -8,8 +8,12 @@
+ =0D
+ #include <Library/ArmPlatformLib.h>=0D
+ #include <Library/BaseLib.h>=0D
++#include <NeoverseN1Soc.h>=0D
+ #include <Ppi/ArmMpCoreInfo.h>=0D
+ =0D
++UINT64 NtFwConfigDtBlob;=0D
++STATIC NEOVERSEN1SOC_NT_FW_CONFIG_INFO_PPI mNtFwConfigDtInfoPpi;=0D
++=0D
+ STATIC ARM_CORE_INFO mCoreInfoTable[] =3D {=0D
+   { 0x0, 0x0 }, // Cluster 0, Core 0=0D
+   { 0x0, 0x1 }, // Cluster 0, Core 1=0D
+@@ -46,6 +50,7 @@ ArmPlatformInitialize (
+   IN     UINTN                  MpId=0D
+   )=0D
+ {=0D
++  mNtFwConfigDtInfoPpi.NtFwConfigDtAddr =3D NtFwConfigDtBlob;=0D
+   return RETURN_SUCCESS;=0D
+ }=0D
+ =0D
+@@ -80,6 +85,11 @@ EFI_PEI_PPI_DESCRIPTOR gPlatformPpiTable[] =3D {
+     EFI_PEI_PPI_DESCRIPTOR_PPI,=0D
+     &gArmMpCoreInfoPpiGuid,=0D
+     &mMpCoreInfoPpi=0D
++  },=0D
++  {=0D
++    EFI_PEI_PPI_DESCRIPTOR_PPI,=0D
++    &gNtFwConfigDtInfoPpiGuid,=0D
++    &mNtFwConfigDtInfoPpi=0D
+   }=0D
+ };=0D
+ =0D
+diff --git a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf=
 b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf
+index 96e590cdd8..6f9c9d5ab6 100644
+--- a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf
++++ b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf
+@@ -1,7 +1,7 @@
+ ## @file=0D
+ #  Platform Library for N1Sdp.=0D
+ #=0D
+-#  Copyright (c) 2018-2021, ARM Limited. All rights reserved.<BR>=0D
++#  Copyright (c) 2018 - 2022, ARM Limited. All rights reserved.<BR>=0D
+ #=0D
+ #  SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ #=0D
+@@ -18,10 +18,14 @@
+ [Packages]=0D
+   ArmPkg/ArmPkg.dec=0D
+   ArmPlatformPkg/ArmPlatformPkg.dec=0D
++  EmbeddedPkg/EmbeddedPkg.dec=0D
+   MdeModulePkg/MdeModulePkg.dec=0D
+   MdePkg/MdePkg.dec=0D
+   Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec=0D
+ =0D
++[LibraryClasses]=0D
++  FdtLib=0D
++=0D
+ [Sources.common]=0D
+   PlatformLibMem.c=0D
+   PlatformLib.c=0D
+@@ -59,7 +63,9 @@
+   gEfiMdePkgTokenSpaceGuid.PcdPciExpressBaseAddress=0D
+ =0D
+ [Guids]=0D
++  gArmNeoverseN1SocPlatformInfoDescriptorGuid=0D
+   gEfiHobListGuid          ## CONSUMES  ## SystemTable=0D
+ =0D
+ [Ppis]=0D
+   gArmMpCoreInfoPpiGuid=0D
++  gNtFwConfigDtInfoPpiGuid=0D
+diff --git a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.=
c b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
+index 339fa07b32..b58bda4b76 100644
+--- a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
++++ b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
+@@ -1,6 +1,6 @@
+ /** @file=0D
+ =0D
+-  Copyright (c) 2018 - 2021, ARM Limited. All rights reserved.<BR>=0D
++  Copyright (c) 2018 - 2022, ARM Limited. All rights reserved.<BR>=0D
+ =0D
+   SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ =0D
+@@ -10,11 +10,95 @@
+ #include <Library/DebugLib.h>=0D
+ #include <Library/HobLib.h>=0D
+ #include <Library/MemoryAllocationLib.h>=0D
++#include <Library/PeiServicesLib.h>=0D
++#include <libfdt.h>=0D
+ #include <NeoverseN1Soc.h>=0D
+ =0D
+ // The total number of descriptors, including the final "end-of-table" de=
scriptor.=0D
+ #define MAX_VIRTUAL_MEMORY_MAP_DESCRIPTORS 19=0D
+ =0D
++/** A helper function to locate the NtFwConfig PPI and get the base addre=
ss of=0D
++  NT_FW_CONFIG DT from which values are obtained using FDT helper functio=
ns.=0D
++=0D
++  @param [out]  plat_info  Pointer to the NeoverseN1Soc PLATFORM_INFO HOB=
=0D
++=0D
++  @retval EFI_SUCCESS            Success.=0D
++  returns EFI_INVALID_PARAMETER  A parameter is invalid.=0D
++**/=0D
++EFI_STATUS=0D
++GetNeoverseN1SocPlatInfo (=0D
++  OUT NEOVERSEN1SOC_PLAT_INFO *plat_info=0D
++  )=0D
++{=0D
++  CONST UINT32                   *Property;=0D
++  INT32                          Offset;=0D
++  CONST VOID                     *NtFwCfgDtBlob;=0D
++  NEOVERSEN1SOC_NT_FW_CONFIG_INFO_PPI  *NtFwConfigInfoPpi;=0D
++  EFI_STATUS                     Status;=0D
++=0D
++  Status =3D PeiServicesLocatePpi (=0D
++             &gNtFwConfigDtInfoPpiGuid,=0D
++             0,=0D
++             NULL,=0D
++             (VOID **)&NtFwConfigInfoPpi=0D
++             );=0D
++=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((=0D
++      DEBUG_ERROR,=0D
++      "PeiServicesLocatePpi failed with error %r\n",=0D
++      Status=0D
++      ));=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  NtFwCfgDtBlob =3D (VOID *)(UINTN)NtFwConfigInfoPpi->NtFwConfigDtAddr;=0D
++  if (fdt_check_header (NtFwCfgDtBlob) !=3D 0) {=0D
++    DEBUG ((DEBUG_ERROR, "Invalid DTB file %p passed\n", NtFwCfgDtBlob));=
=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  Offset =3D fdt_subnode_offset (NtFwCfgDtBlob, 0, "platform-info");=0D
++  if (Offset =3D=3D -FDT_ERR_NOTFOUND) {=0D
++    DEBUG ((DEBUG_ERROR, "Invalid DTB : platform-info node not found\n"))=
;=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  Property =3D fdt_getprop (NtFwCfgDtBlob, Offset, "local-ddr-size", NULL=
);=0D
++  if (Property =3D=3D NULL) {=0D
++    DEBUG ((DEBUG_ERROR, "local-ddr-size property not found\n"));=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  plat_info->LocalDdrSize =3D fdt32_to_cpu (*Property);=0D
++=0D
++  Property =3D fdt_getprop (NtFwCfgDtBlob, Offset, "remote-ddr-size", NUL=
L);=0D
++  if (Property =3D=3D NULL) {=0D
++    DEBUG ((DEBUG_ERROR, "remote-ddr-size property not found\n"));=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  plat_info->RemoteDdrSize =3D fdt32_to_cpu (*Property);=0D
++=0D
++  Property =3D fdt_getprop (NtFwCfgDtBlob, Offset, "secondary-chip-count"=
, NULL);=0D
++  if (Property =3D=3D NULL) {=0D
++    DEBUG ((DEBUG_ERROR, "secondary-chip-count property not found\n"));=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  plat_info->SecondaryChipCount =3D fdt32_to_cpu (*Property);=0D
++=0D
++  Property =3D fdt_getprop (NtFwCfgDtBlob, Offset, "multichip-mode", NULL=
);=0D
++  if (Property =3D=3D NULL) {=0D
++    DEBUG ((DEBUG_ERROR, "multichip-mode property not found\n"));=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  plat_info->MultichipMode =3D fdt32_to_cpu (*Property);=0D
++=0D
++  return EFI_SUCCESS;=0D
++}=0D
++=0D
+ /**=0D
+   Returns the Virtual Memory Map of the platform.=0D
+ =0D
+@@ -36,9 +120,24 @@ ArmPlatformGetVirtualMemoryMap (
+   NEOVERSEN1SOC_PLAT_INFO       *PlatInfo;=0D
+   UINT64                        DramBlock2Size;=0D
+   UINT64                        RemoteDdrSize;=0D
++  EFI_STATUS                    Status;=0D
+ =0D
+   Index =3D 0;=0D
+-  PlatInfo =3D (NEOVERSEN1SOC_PLAT_INFO *)NEOVERSEN1SOC_PLAT_INFO_STRUCT_=
BASE;=0D
++=0D
++  // Create platform info HOB=0D
++  PlatInfo =3D (NEOVERSEN1SOC_PLAT_INFO *)BuildGuidHob (=0D
++                                        &gArmNeoverseN1SocPlatformInfoDes=
criptorGuid,=0D
++                                        sizeof (NEOVERSEN1SOC_PLAT_INFO)=
=0D
++                                        );=0D
++=0D
++  if (PlatInfo =3D=3D NULL) {=0D
++    DEBUG ((DEBUG_ERROR, "Platform HOB is NULL\n"));=0D
++    ASSERT (FALSE);=0D
++    return;=0D
++  }=0D
++=0D
++  Status =3D GetNeoverseN1SocPlatInfo (PlatInfo);=0D
++  ASSERT (Status =3D=3D 0);=0D
+   DramBlock2Size =3D ((UINT64)(PlatInfo->LocalDdrSize -=0D
+                              NEOVERSEN1SOC_DRAM_BLOCK1_SIZE / SIZE_1GB) *=
=0D
+                             (UINT64)SIZE_1GB);=0D
+diff --git a/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec b/Silicon/ARM/Neo=
verseN1Soc/NeoverseN1Soc.dec
+index d59f25a5b9..4dea8fe1e8 100644
+--- a/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec
++++ b/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec
+@@ -1,7 +1,7 @@
+ ## @file=0D
+ #  Describes the entire platform configuration.=0D
+ #=0D
+-#  Copyright (c) 2018 - 2021, ARM Limited. All rights reserved.<BR>=0D
++#  Copyright (c) 2018 - 2022, ARM Limited. All rights reserved.<BR>=0D
+ #=0D
+ #  SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ #=0D
+@@ -22,6 +22,8 @@
+   Include                        # Root include for the package=0D
+ =0D
+ [Guids.common]=0D
++  # ARM NeoverseN1Soc Platform Info descriptor=0D
++  gArmNeoverseN1SocPlatformInfoDescriptorGuid =3D { 0x095cb024, 0x1e00, 0=
x4d6f, { 0xaa, 0x34, 0x4a, 0xf8, 0xaf, 0x0e, 0xad, 0x99 } }=0D
+   gArmNeoverseN1SocTokenSpaceGuid =3D { 0xab93eb78, 0x60d7, 0x4099, { 0xa=
c, 0xeb, 0x6d, 0xb5, 0x02, 0x58, 0x7c, 0x24 } }=0D
+ =0D
+ [PcdsFixedAtBuild]=0D
+@@ -83,3 +85,6 @@
+   gArmNeoverseN1SocTokenSpaceGuid.PcdRemotePcieMmio32Translation|0x400000=
00000|UINT64|0x0000004F=0D
+   gArmNeoverseN1SocTokenSpaceGuid.PcdRemotePcieMmio64Translation|0x400000=
00000|UINT64|0x00000050=0D
+   gArmNeoverseN1SocTokenSpaceGuid.PcdRemotePcieSegmentNumber|2|UINT32|0x0=
0000051=0D
++=0D
++[Ppis]=0D
++  gNtFwConfigDtInfoPpiGuid =3D  { 0xb50dee0e, 0x577f, 0x47fb, { 0x83, 0xd=
0, 0x41, 0x78, 0x61, 0x8b, 0x33, 0x8a } }=0D
+--=20
+2.17.1
+
--=20
2.17.1


