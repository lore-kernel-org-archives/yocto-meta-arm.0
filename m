Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF4DFC43334
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 19:06:50 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web11.44747.1658257607220514426
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 Jul 2022 12:06:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=LJGFlPNV;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.172,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f172.google.com with SMTP id g1so11214759qki.7
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 Jul 2022 12:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sAo6V2pSiYbVY7RrUy2JsDhIC6E1rp82r24HjnpSdzs=;
        b=LJGFlPNV8uydTGQttq3Wo8lJHMHjlMARr2eMpIZlHK6gAeMeo4eFTZ64TdFaW9b9/U
         By/tzx7aaGrntbzLNSy6sjjvYrc2EYFWAbXamM1muWDDCxAZvysSkz5pxkCzicCyCGNs
         rHr+PnAboyl3r7Y9CF/JotqKvqfItHIdeVC3bNolLGqu0MyHtFyakXtt4Yy1bwC8Mwb9
         A45e3bUhkKAt3zTLqjWwbqbPGh/Mpdjmzl0bF5bTxMHQiO/ovwJWEMMOHKxaBpeHRWhq
         6oL8luZgau4PPs2NXNbp9RDGHRBIxa0E8ukcIEBzb2npIh/2frPRXe3SacKlSA0RxcI/
         LXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sAo6V2pSiYbVY7RrUy2JsDhIC6E1rp82r24HjnpSdzs=;
        b=hBeHzRDJvLvbm22Qji0BWpA2VFuJQOIykoqSLvjF5OvoriP+TXgUdZh9Qvz3UpNy61
         HldimUMeVf60SukglLQ2azWqg4aO/dxy53IGVfUV/0J2Ym1USyTvAUWre13lcHIQPfMn
         LKhvPqoPkP8W1H+9H19A5QQkuDhvCryl6dvwiRFKKVuN23Su/0PLiGJIXcW6ZPFFoRMv
         RE9yX/U69SwOoTgL9t1qwag4Y5hLThkWe1e0U7mfurdVRiTSMaX0QS+1It7t9GXfuN7P
         dmRirO4C9TmzkfwYzo1KiPdEQha7hj3t5+yoLswUSrfFGx47rXYEdOyXXsvy4lhtFhrV
         uSGg==
X-Gm-Message-State: AJIora8wlyf5Hk9CwQROuSj/mG0bVDaVFuGUD9yNlqngtrNCfdaPvQ5n
	xk2m1/xMgGV8Eh5akaZC5yipbw==
X-Google-Smtp-Source: 
 AGRyM1sI7MijAJ2GA07DEvrAaXWp0VJods9ANCrFvr9nUTDJXaudJuuBX0+75F4FhCytyTMXYXKlMg==
X-Received: by 2002:a05:620a:6c4:b0:6b5:d024:ccca with SMTP id
 4-20020a05620a06c400b006b5d024cccamr13883571qky.324.1658257604819;
        Tue, 19 Jul 2022 12:06:44 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 do1-20020a05620a2b0100b006b5c80e2b6asm14524561qkb.12.2022.07.19.12.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 12:06:44 -0700 (PDT)
Date: Tue, 19 Jul 2022 15:06:41 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Adam Johnston <adam.johnston@arm.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	Ross Burton <Ross.Burton@arm.com>, nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 1/1] arm-bsp/edk2-firmware: Add NT_FW_CONFIG
 to N1SDP to fix aborts when accessing virtual memory
Message-ID: <YtcAwTMw0JgiLKBA@kudzu.us>
References: <20220719125325.923598-1-adam.johnston@arm.com>
 <20220719125325.923598-2-adam.johnston@arm.com>
 <YtbNzdle16tMkd7q@kudzu.us>
 <PAXPR08MB6432D717560C0FCA9B93BD4BE98F9@PAXPR08MB6432.eurprd08.prod.outlook.com>
 <20220719182003.GC18692@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220719182003.GC18692@denix.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 19 Jul 2022 19:06:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3573

On Tue, Jul 19, 2022 at 02:20:03PM -0400, Denys Dmytriyenko wrote:
> Unfortunately, MTAs are known to lose CRLFs in clear-text inlined patches. The 
> workaround is for the maintainer to get such patch directly from the author - 
> emailed as an attachment, zip file or a local tranfer...
> 
> -- 
> Denys

Yes, this is my bad.  I should've gotten it offline instead of
flaming.  It's handled now, and in the master branch.

Thanks,
Jon

> 
> 
> On Tue, Jul 19, 2022 at 04:05:19PM +0000, Adam Johnston wrote:
> > Hi Jon,
> > 
> > The EDK2 patch contains CRLFs which need to be preserved.
> > The log is consistent with them being replaced with LF, but it's not clear where they have been lost.
> > 
> > Thanks and Regards
> > 
> > Adam
> > 
> > -----Original Message-----
> > From: Jon Mason <jdmason@kudzu.us> 
> > Sent: 19 July 2022 16:29
> > To: Adam Johnston <Adam.Johnston@arm.com>
> > Cc: meta-arm@lists.yoctoproject.org; Ross Burton <Ross.Burton@arm.com>; nd <nd@arm.com>
> > Subject: Re: [PATCH 1/1] arm-bsp/edk2-firmware: Add NT_FW_CONFIG to N1SDP to fix aborts when accessing virtual memory
> > 
> > On Tue, Jul 19, 2022 at 01:53:25PM +0100, adam.johnston@arm.com wrote:
> > > From: Adam Johnston <adam.johnston@arm.com>
> > > 
> > > NT_FW_CONFIG DTB contains platform information passed by TF-A boot 
> > > stage. This information is used for Virtual memory map generation 
> > > during PEI phase and passed on to DXE phase as a HOB, where it is used 
> > > in ConfigurationManagerDxe.
> > > 
> > > Signed-off-by: Adam Johnston <adam.johnston@arm.com>
> > > ---
> > 
> > This patch is failing because the patch below doesn't apply cleanly.
> > See https://gitlab.com/jonmason00/meta-arm/-/jobs/2740824630
> > 
> > Thanks,
> > Jon
> > 
> > >  .../recipes-bsp/uefi/edk2-firmware-n1sdp.inc  |   6 +
> > >  .../edk2-platforms/add-nt-fw-config.patch     | 474 ++++++++++++++++++
> > >  2 files changed, 480 insertions(+)
> > >  create mode 100644 
> > > meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/add-nt-fw-config.pa
> > > tch
> > > 
> > > diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc 
> > > b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
> > > index 8930c040..90c3f2ae 100644
> > > --- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
> > > +++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
> > > @@ -11,6 +11,12 @@ COMPATIBLE_MACHINE = "n1sdp"
> > >  EFIDIR             = "/EFI/BOOT"
> > >  EFI_BOOT_IMAGE     = "bootaa64.efi"
> > >  
> > > +FILESEXTRAPATHS:prepend := "${THISDIR}/files/edk2-platforms:"
> > > +
> > > +SRC_URI:append = "\
> > > +    file://add-nt-fw-config.patch;patchdir=edk2-platforms \ "
> > > +
> > >  do_deploy:append() {
> > >      EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
> > >      printf 'FS2:%s\%s\n' "$EFIPATH" "${EFI_BOOT_IMAGE}" > 
> > > ${DEPLOYDIR}/startup.nsh diff --git 
> > > a/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/add-nt-fw-config.
> > > patch 
> > > b/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/add-nt-fw-config.
> > > patch
> > > new file mode 100644
> > > index 00000000..f6f18951
> > > --- /dev/null
> > > +++ b/meta-arm-bsp/recipes-bsp/uefi/files/edk2-platforms/add-nt-fw-con
> > > +++ fig.patch
> > > @@ -0,0 +1,474 @@
> > > +From cc58709b32d74273736886ccfc08e4723a436ea4 Mon Sep 17 00:00:00 
> > > +2001
> > > +From: sahil <sahil@arm.com>
> > > +Date: Thu, 17 Mar 2022 16:28:05 +0530
> > > +Subject: [PATCH] Platform/ARM/N1sdp: Add support to parse 
> > > +NT_FW_CONFIG
> > > +
> > > +NT_FW_CONFIG DTB contains platform information passed by Tf-A boot 
> > > +stage.
> > > +This information is used for Virtual memory map generation during PEI 
> > > +phase and passed on to DXE phase as a HOB, where it is used in 
> > > +ConfigurationManagerDxe.
> > > +
> > > +Upstream-Status: Pending
> > > +Signed-off-by: Adam Johnston <adam.johnston@arm.com>
> > > +Signed-off-by: sahil <sahil@arm.com>
> > > +Change-Id: Ib82571280bf1ca5febe5766e618de09e7b70bb02
> > > +
> > > +---
> > > + .../ConfigurationManager.c                    |  24 ++--
> > > + .../ConfigurationManagerDxe.inf               |   3 +-
> > > + .../ARM/NeoverseN1Soc/Include/NeoverseN1Soc.h |  16 +--
> > > + .../Library/PlatformLib/AArch64/Helper.S      |   4 +-
> > > + .../Library/PlatformLib/PlatformLib.c         |  12 +-
> > > + .../Library/PlatformLib/PlatformLib.inf       |   8 +-
> > > + .../Library/PlatformLib/PlatformLibMem.c      | 103 +++++++++++++++++-
> > > + Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec   |   7 +-
> > > + 8 files changed, 152 insertions(+), 25 deletions(-)
> > > +
> > > +diff --git 
> > > +a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Con
> > > +figurationManager.c 
> > > +b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Con
> > > +figurationManager.c
> > > +index f50623ae3f..e023d47cfd 100644
> > > +--- 
> > > +a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Con
> > > +figurationManager.c
> > > ++++ b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe
> > > ++++ /ConfigurationManager.c
> > > +@@ -1,7 +1,7 @@
> > > + /** @file
> > > +   Configuration Manager Dxe
> > > + 
> > > +-  Copyright (c) 2021, ARM Limited. All rights reserved.<BR>
> > > ++  Copyright (c) 2021 - 2022, ARM Limited. All rights reserved.<BR>
> > > + 
> > > +   SPDX-License-Identifier: BSD-2-Clause-Patent
> > > + 
> > > +@@ -16,6 +16,7 @@
> > > + #include <IndustryStandard/SerialPortConsoleRedirectionTable.h>
> > > + #include <Library/ArmLib.h>
> > > + #include <Library/DebugLib.h>
> > > ++#include <Library/HobLib.h>
> > > + #include <Library/IoLib.h>
> > > + #include <Library/PcdLib.h>
> > > + #include <Library/UefiBootServicesTableLib.h>
> > > +@@ -28,6 +29,7 @@
> > > + #include "Platform.h"
> > > + 
> > > + extern struct EFI_ACPI_HETEROGENEOUS_MEMORY_ATTRIBUTE_TABLE Hmat;
> > > ++static NEOVERSEN1SOC_PLAT_INFO *PlatInfo;
> > > + 
> > > + /** The platform configuration repository information.
> > > + */
> > > +@@ -1242,13 +1244,11 @@ InitializePlatformRepository (
> > > +   IN  EDKII_PLATFORM_REPOSITORY_INFO  * CONST PlatRepoInfo
> > > +   )
> > > + {
> > > +-  NEOVERSEN1SOC_PLAT_INFO       *PlatInfo;
> > > +   UINT64                        Dram2Size;
> > > +   UINT64                        RemoteDdrSize;
> > > + 
> > > +   RemoteDdrSize = 0;
> > > + 
> > > +-  PlatInfo = (NEOVERSEN1SOC_PLAT_INFO *)NEOVERSEN1SOC_PLAT_INFO_STRUCT_BASE;
> > > +   Dram2Size = ((PlatInfo->LocalDdrSize - 2) * SIZE_1GB);
> > > + 
> > > +   PlatRepoInfo->MemAffInfo[LOCAL_DDR_REGION2].Length = Dram2Size; @@ 
> > > +-1512,7 +1512,6 @@ GetGicCInfo (
> > > +   )
> > > + {
> > > +   EDKII_PLATFORM_REPOSITORY_INFO  * PlatformRepo;
> > > +-  NEOVERSEN1SOC_PLAT_INFO           *PlatInfo;
> > > +   UINT32                            TotalObjCount;
> > > +   UINT32                            ObjIndex;
> > > + 
> > > +@@ -1523,7 +1522,6 @@ GetGicCInfo (
> > > +   }
> > > + 
> > > +   PlatformRepo = This->PlatRepoInfo;
> > > +-  PlatInfo = (NEOVERSEN1SOC_PLAT_INFO 
> > > +*)NEOVERSEN1SOC_PLAT_INFO_STRUCT_BASE;
> > > + 
> > > +   if (PlatInfo->MultichipMode == 1) {
> > > +     TotalObjCount = PLAT_CPU_COUNT * 2; @@ -1623,7 +1621,6 @@ 
> > > +GetStandardNameSpaceObject (  {
> > > +   EFI_STATUS                        Status;
> > > +   EDKII_PLATFORM_REPOSITORY_INFO  * PlatformRepo;
> > > +-  NEOVERSEN1SOC_PLAT_INFO           *PlatInfo;
> > > +   UINT32                            AcpiTableCount;
> > > + 
> > > +   if ((This == NULL) || (CmObject == NULL)) { @@ -1634,7 +1631,7 @@ 
> > > +GetStandardNameSpaceObject (
> > > + 
> > > +   Status = EFI_NOT_FOUND;
> > > +   PlatformRepo = This->PlatRepoInfo;
> > > +-  PlatInfo = (NEOVERSEN1SOC_PLAT_INFO 
> > > +*)NEOVERSEN1SOC_PLAT_INFO_STRUCT_BASE;
> > > ++
> > > +   AcpiTableCount = ARRAY_SIZE (PlatformRepo->CmAcpiTableList);
> > > +   if (PlatInfo->MultichipMode == 0)
> > > +         AcpiTableCount -= 1;
> > > +@@ -1697,7 +1694,6 @@ GetArmNameSpaceObject (  {
> > > +   EFI_STATUS                        Status;
> > > +   EDKII_PLATFORM_REPOSITORY_INFO  * PlatformRepo;
> > > +-  NEOVERSEN1SOC_PLAT_INFO           *PlatInfo;
> > > +   UINT32                            GicRedistCount;
> > > +   UINT32                            GicCpuCount;
> > > +   UINT32                            ProcHierarchyInfoCount;
> > > +@@ -1718,8 +1714,6 @@ GetArmNameSpaceObject (
> > > +   Status = EFI_NOT_FOUND;
> > > +   PlatformRepo = This->PlatRepoInfo;
> > > + 
> > > +-  // Probe for multi chip information
> > > +-  PlatInfo = (NEOVERSEN1SOC_PLAT_INFO *)NEOVERSEN1SOC_PLAT_INFO_STRUCT_BASE;
> > > +   if (PlatInfo->MultichipMode == 1) {
> > > +     GicRedistCount = 2;
> > > +     GicCpuCount = PLAT_CPU_COUNT * 2; @@ -2162,8 +2156,18 @@ 
> > > +ConfigurationManagerDxeInitialize (
> > > +   IN EFI_SYSTEM_TABLE  * SystemTable
> > > +   )
> > > + {
> > > ++  VOID *PlatInfoHob;
> > > +   EFI_STATUS  Status;
> > > + 
> > > ++  PlatInfoHob = GetFirstGuidHob 
> > > ++ (&gArmNeoverseN1SocPlatformInfoDescriptorGuid);
> > > ++
> > > ++  if (PlatInfoHob == NULL) {
> > > ++    DEBUG ((DEBUG_ERROR, "Platform HOB is NULL\n"));
> > > ++    return EFI_NOT_FOUND;
> > > ++  }
> > > ++
> > > ++  PlatInfo = (NEOVERSEN1SOC_PLAT_INFO *)GET_GUID_HOB_DATA 
> > > ++ (PlatInfoHob);
> > > ++
> > > +   // Initialize the Platform Configuration Repository before installing the
> > > +   // Configuration Manager Protocol
> > > +   Status = InitializePlatformRepository ( diff --git 
> > > +a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Con
> > > +figurationManagerDxe.inf 
> > > +b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Con
> > > +figurationManagerDxe.inf
> > > +index 4f8e7f1302..fb59c29501 100644
> > > +--- 
> > > +a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Con
> > > +figurationManagerDxe.inf
> > > ++++ b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe
> > > ++++ /ConfigurationManagerDxe.inf
> > > +@@ -1,7 +1,7 @@
> > > + ## @file
> > > + #  Configuration Manager Dxe
> > > + #
> > > +-#  Copyright (c) 2021, ARM Limited. All rights reserved.<BR>
> > > ++#  Copyright (c) 2021 - 2022, ARM Limited. All rights reserved.<BR>
> > > + #
> > > + #  SPDX-License-Identifier: BSD-2-Clause-Patent  # @@ -42,6 +42,7 @@
> > > + 
> > > + [LibraryClasses]
> > > +   ArmPlatformLib
> > > ++  HobLib
> > > +   PrintLib
> > > +   UefiBootServicesTableLib
> > > +   UefiDriverEntryPoint
> > > +diff --git a/Silicon/ARM/NeoverseN1Soc/Include/NeoverseN1Soc.h 
> > > +b/Silicon/ARM/NeoverseN1Soc/Include/NeoverseN1Soc.h
> > > +index 097160c7e2..63cebaf0e0 100644
> > > +--- a/Silicon/ARM/NeoverseN1Soc/Include/NeoverseN1Soc.h
> > > ++++ b/Silicon/ARM/NeoverseN1Soc/Include/NeoverseN1Soc.h
> > > +@@ -1,6 +1,6 @@
> > > + /** @file
> > > + *
> > > +-* Copyright (c) 2018 - 2020, ARM Limited. All rights reserved.
> > > ++* Copyright (c) 2018 - 2022, ARM Limited. All rights reserved.
> > > + *
> > > + * SPDX-License-Identifier: BSD-2-Clause-Patent
> > > + *
> > > +@@ -41,11 +41,6 @@
> > > + #define NEOVERSEN1SOC_EXP_PERIPH_BASE0               0x1C000000
> > > + #define NEOVERSEN1SOC_EXP_PERIPH_BASE0_SZ            0x1300000
> > > + 
> > > +-// Base address to a structure of type NEOVERSEN1SOC_PLAT_INFO which 
> > > +is -// pre-populated by a earlier boot stage
> > > +-#define NEOVERSEN1SOC_PLAT_INFO_STRUCT_BASE          (NEOVERSEN1SOC_NON_SECURE_SRAM_BASE + \
> > > +-                                                      0x00008000)
> > > +-
> > > + /*
> > > +  * Platform information structure stored in Non-secure SRAM. 
> > > +Platform
> > > +  * information are passed from the trusted firmware with the below 
> > > +structure @@ -55,12 +50,17 @@  typedef struct {
> > > +   /*! 0 - Single Chip, 1 - Chip to Chip (C2C) */
> > > +   UINT8   MultichipMode;
> > > +-  /*! Slave count in C2C mode */
> > > +-  UINT8   SlaveCount;
> > > ++  /*! Secondary chip count in C2C mode */
> > > ++  UINT8   SecondaryChipCount;
> > > +   /*! Local DDR memory size in GigaBytes */
> > > +   UINT8   LocalDdrSize;
> > > +   /*! Remote DDR memory size in GigaBytes */
> > > +   UINT8   RemoteDdrSize;
> > > + } NEOVERSEN1SOC_PLAT_INFO;
> > > + 
> > > ++// NT_FW_CONFIG DT structure
> > > ++typedef struct {
> > > ++  UINT64                  NtFwConfigDtAddr;
> > > ++} NEOVERSEN1SOC_NT_FW_CONFIG_INFO_PPI;
> > > ++
> > > + #endif
> > > +diff --git 
> > > +a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/AArch64/Helper.S 
> > > +b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/AArch64/Helper.S
> > > +index 8d2069dea8..88ed640d29 100644
> > > +--- a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/AArch64/Helper.S
> > > ++++ b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/AArch64/Helper.S
> > > +@@ -1,6 +1,6 @@
> > > + /** @file
> > > + *
> > > +-*  Copyright (c) 2019 - 2020, ARM Limited. All rights reserved.
> > > ++*  Copyright (c) 2019 - 2022, ARM Limited. All rights reserved.
> > > + *
> > > + *  SPDX-License-Identifier: BSD-2-Clause-Patent
> > > + *
> > > +@@ -25,6 +25,8 @@ GCC_ASM_EXPORT(ArmPlatformIsPrimaryCore)
> > > + // the UEFI firmware through the CPU registers.
> > > + //
> > > + ASM_PFX(ArmPlatformPeiBootAction):
> > > ++  adr  x10, NtFwConfigDtBlob
> > > ++  str  x0, [x10]
> > > +   ret
> > > + 
> > > + //
> > > +diff --git 
> > > +a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.c 
> > > +b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.c
> > > +index c0effd37f3..fabe902cd0 100644
> > > +--- a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.c
> > > ++++ b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.c
> > > +@@ -1,6 +1,6 @@
> > > + /** @file
> > > + 
> > > +-  Copyright (c) 2018-2021, ARM Limited. All rights reserved.<BR>
> > > ++  Copyright (c) 2018 - 2022, ARM Limited. All rights reserved.<BR>
> > > + 
> > > +   SPDX-License-Identifier: BSD-2-Clause-Patent
> > > + 
> > > +@@ -8,8 +8,12 @@
> > > + 
> > > + #include <Library/ArmPlatformLib.h>
> > > + #include <Library/BaseLib.h>
> > > ++#include <NeoverseN1Soc.h>
> > > + #include <Ppi/ArmMpCoreInfo.h>
> > > + 
> > > ++UINT64 NtFwConfigDtBlob;
> > > ++STATIC NEOVERSEN1SOC_NT_FW_CONFIG_INFO_PPI mNtFwConfigDtInfoPpi;
> > > ++
> > > + STATIC ARM_CORE_INFO mCoreInfoTable[] = {
> > > +   { 0x0, 0x0 }, // Cluster 0, Core 0
> > > +   { 0x0, 0x1 }, // Cluster 0, Core 1 @@ -46,6 +50,7 @@ 
> > > +ArmPlatformInitialize (
> > > +   IN     UINTN                  MpId
> > > +   )
> > > + {
> > > ++  mNtFwConfigDtInfoPpi.NtFwConfigDtAddr = NtFwConfigDtBlob;
> > > +   return RETURN_SUCCESS;
> > > + }
> > > + 
> > > +@@ -80,6 +85,11 @@ EFI_PEI_PPI_DESCRIPTOR gPlatformPpiTable[] = {
> > > +     EFI_PEI_PPI_DESCRIPTOR_PPI,
> > > +     &gArmMpCoreInfoPpiGuid,
> > > +     &mMpCoreInfoPpi
> > > ++  },
> > > ++  {
> > > ++    EFI_PEI_PPI_DESCRIPTOR_PPI,
> > > ++    &gNtFwConfigDtInfoPpiGuid,
> > > ++    &mNtFwConfigDtInfoPpi
> > > +   }
> > > + };
> > > + 
> > > +diff --git 
> > > +a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf 
> > > +b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf
> > > +index 96e590cdd8..6f9c9d5ab6 100644
> > > +--- a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf
> > > ++++ b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf
> > > +@@ -1,7 +1,7 @@
> > > + ## @file
> > > + #  Platform Library for N1Sdp.
> > > + #
> > > +-#  Copyright (c) 2018-2021, ARM Limited. All rights reserved.<BR>
> > > ++#  Copyright (c) 2018 - 2022, ARM Limited. All rights reserved.<BR>
> > > + #
> > > + #  SPDX-License-Identifier: BSD-2-Clause-Patent  # @@ -18,10 +18,14 
> > > +@@  [Packages]
> > > +   ArmPkg/ArmPkg.dec
> > > +   ArmPlatformPkg/ArmPlatformPkg.dec
> > > ++  EmbeddedPkg/EmbeddedPkg.dec
> > > +   MdeModulePkg/MdeModulePkg.dec
> > > +   MdePkg/MdePkg.dec
> > > +   Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec
> > > + 
> > > ++[LibraryClasses]
> > > ++  FdtLib
> > > ++
> > > + [Sources.common]
> > > +   PlatformLibMem.c
> > > +   PlatformLib.c
> > > +@@ -59,7 +63,9 @@
> > > +   gEfiMdePkgTokenSpaceGuid.PcdPciExpressBaseAddress
> > > + 
> > > + [Guids]
> > > ++  gArmNeoverseN1SocPlatformInfoDescriptorGuid
> > > +   gEfiHobListGuid          ## CONSUMES  ## SystemTable
> > > + 
> > > + [Ppis]
> > > +   gArmMpCoreInfoPpiGuid
> > > ++  gNtFwConfigDtInfoPpiGuid
> > > +diff --git 
> > > +a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c 
> > > +b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
> > > +index 339fa07b32..b58bda4b76 100644
> > > +--- a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
> > > ++++ b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
> > > +@@ -1,6 +1,6 @@
> > > + /** @file
> > > + 
> > > +-  Copyright (c) 2018 - 2021, ARM Limited. All rights reserved.<BR>
> > > ++  Copyright (c) 2018 - 2022, ARM Limited. All rights reserved.<BR>
> > > + 
> > > +   SPDX-License-Identifier: BSD-2-Clause-Patent
> > > + 
> > > +@@ -10,11 +10,95 @@
> > > + #include <Library/DebugLib.h>
> > > + #include <Library/HobLib.h>
> > > + #include <Library/MemoryAllocationLib.h>
> > > ++#include <Library/PeiServicesLib.h>
> > > ++#include <libfdt.h>
> > > + #include <NeoverseN1Soc.h>
> > > + 
> > > + // The total number of descriptors, including the final "end-of-table" descriptor.
> > > + #define MAX_VIRTUAL_MEMORY_MAP_DESCRIPTORS 19
> > > + 
> > > ++/** A helper function to locate the NtFwConfig PPI and get the base 
> > > ++address of
> > > ++  NT_FW_CONFIG DT from which values are obtained using FDT helper functions.
> > > ++
> > > ++  @param [out]  plat_info  Pointer to the NeoverseN1Soc 
> > > ++ PLATFORM_INFO HOB
> > > ++
> > > ++  @retval EFI_SUCCESS            Success.
> > > ++  returns EFI_INVALID_PARAMETER  A parameter is invalid.
> > > ++**/
> > > ++EFI_STATUS
> > > ++GetNeoverseN1SocPlatInfo (
> > > ++  OUT NEOVERSEN1SOC_PLAT_INFO *plat_info
> > > ++  )
> > > ++{
> > > ++  CONST UINT32                   *Property;
> > > ++  INT32                          Offset;
> > > ++  CONST VOID                     *NtFwCfgDtBlob;
> > > ++  NEOVERSEN1SOC_NT_FW_CONFIG_INFO_PPI  *NtFwConfigInfoPpi;
> > > ++  EFI_STATUS                     Status;
> > > ++
> > > ++  Status = PeiServicesLocatePpi (
> > > ++             &gNtFwConfigDtInfoPpiGuid,
> > > ++             0,
> > > ++             NULL,
> > > ++             (VOID **)&NtFwConfigInfoPpi
> > > ++             );
> > > ++
> > > ++  if (EFI_ERROR (Status)) {
> > > ++    DEBUG ((
> > > ++      DEBUG_ERROR,
> > > ++      "PeiServicesLocatePpi failed with error %r\n",
> > > ++      Status
> > > ++      ));
> > > ++    return EFI_INVALID_PARAMETER;
> > > ++  }
> > > ++
> > > ++  NtFwCfgDtBlob = (VOID 
> > > ++ *)(UINTN)NtFwConfigInfoPpi->NtFwConfigDtAddr;
> > > ++  if (fdt_check_header (NtFwCfgDtBlob) != 0) {
> > > ++    DEBUG ((DEBUG_ERROR, "Invalid DTB file %p passed\n", NtFwCfgDtBlob));
> > > ++    return EFI_INVALID_PARAMETER;
> > > ++  }
> > > ++
> > > ++  Offset = fdt_subnode_offset (NtFwCfgDtBlob, 0, "platform-info");  
> > > ++ if (Offset == -FDT_ERR_NOTFOUND) {
> > > ++    DEBUG ((DEBUG_ERROR, "Invalid DTB : platform-info node not found\n"));
> > > ++    return EFI_INVALID_PARAMETER;
> > > ++  }
> > > ++
> > > ++  Property = fdt_getprop (NtFwCfgDtBlob, Offset, "local-ddr-size", 
> > > ++ NULL);  if (Property == NULL) {
> > > ++    DEBUG ((DEBUG_ERROR, "local-ddr-size property not found\n"));
> > > ++    return EFI_INVALID_PARAMETER;
> > > ++  }
> > > ++
> > > ++  plat_info->LocalDdrSize = fdt32_to_cpu (*Property);
> > > ++
> > > ++  Property = fdt_getprop (NtFwCfgDtBlob, Offset, "remote-ddr-size", 
> > > ++ NULL);  if (Property == NULL) {
> > > ++    DEBUG ((DEBUG_ERROR, "remote-ddr-size property not found\n"));
> > > ++    return EFI_INVALID_PARAMETER;
> > > ++  }
> > > ++
> > > ++  plat_info->RemoteDdrSize = fdt32_to_cpu (*Property);
> > > ++
> > > ++  Property = fdt_getprop (NtFwCfgDtBlob, Offset, 
> > > ++ "secondary-chip-count", NULL);  if (Property == NULL) {
> > > ++    DEBUG ((DEBUG_ERROR, "secondary-chip-count property not found\n"));
> > > ++    return EFI_INVALID_PARAMETER;
> > > ++  }
> > > ++
> > > ++  plat_info->SecondaryChipCount = fdt32_to_cpu (*Property);
> > > ++
> > > ++  Property = fdt_getprop (NtFwCfgDtBlob, Offset, "multichip-mode", 
> > > ++ NULL);  if (Property == NULL) {
> > > ++    DEBUG ((DEBUG_ERROR, "multichip-mode property not found\n"));
> > > ++    return EFI_INVALID_PARAMETER;
> > > ++  }
> > > ++
> > > ++  plat_info->MultichipMode = fdt32_to_cpu (*Property);
> > > ++
> > > ++  return EFI_SUCCESS;
> > > ++}
> > > ++
> > > + /**
> > > +   Returns the Virtual Memory Map of the platform.
> > > + 
> > > +@@ -36,9 +120,24 @@ ArmPlatformGetVirtualMemoryMap (
> > > +   NEOVERSEN1SOC_PLAT_INFO       *PlatInfo;
> > > +   UINT64                        DramBlock2Size;
> > > +   UINT64                        RemoteDdrSize;
> > > ++  EFI_STATUS                    Status;
> > > + 
> > > +   Index = 0;
> > > +-  PlatInfo = (NEOVERSEN1SOC_PLAT_INFO 
> > > +*)NEOVERSEN1SOC_PLAT_INFO_STRUCT_BASE;
> > > ++
> > > ++  // Create platform info HOB
> > > ++  PlatInfo = (NEOVERSEN1SOC_PLAT_INFO *)BuildGuidHob (
> > > ++                                        &gArmNeoverseN1SocPlatformInfoDescriptorGuid,
> > > ++                                        sizeof (NEOVERSEN1SOC_PLAT_INFO)
> > > ++                                        );
> > > ++
> > > ++  if (PlatInfo == NULL) {
> > > ++    DEBUG ((DEBUG_ERROR, "Platform HOB is NULL\n"));
> > > ++    ASSERT (FALSE);
> > > ++    return;
> > > ++  }
> > > ++
> > > ++  Status = GetNeoverseN1SocPlatInfo (PlatInfo);  ASSERT (Status == 
> > > ++ 0);
> > > +   DramBlock2Size = ((UINT64)(PlatInfo->LocalDdrSize -
> > > +                              NEOVERSEN1SOC_DRAM_BLOCK1_SIZE / SIZE_1GB) *
> > > +                             (UINT64)SIZE_1GB); diff --git 
> > > +a/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec 
> > > +b/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec
> > > +index d59f25a5b9..4dea8fe1e8 100644
> > > +--- a/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec
> > > ++++ b/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec
> > > +@@ -1,7 +1,7 @@
> > > + ## @file
> > > + #  Describes the entire platform configuration.
> > > + #
> > > +-#  Copyright (c) 2018 - 2021, ARM Limited. All rights reserved.<BR>
> > > ++#  Copyright (c) 2018 - 2022, ARM Limited. All rights reserved.<BR>
> > > + #
> > > + #  SPDX-License-Identifier: BSD-2-Clause-Patent  # @@ -22,6 +22,8 @@
> > > +   Include                        # Root include for the package
> > > + 
> > > + [Guids.common]
> > > ++  # ARM NeoverseN1Soc Platform Info descriptor  
> > > ++ gArmNeoverseN1SocPlatformInfoDescriptorGuid = { 0x095cb024, 0x1e00, 
> > > ++ 0x4d6f, { 0xaa, 0x34, 0x4a, 0xf8, 0xaf, 0x0e, 0xad, 0x99 } }
> > > +   gArmNeoverseN1SocTokenSpaceGuid = { 0xab93eb78, 0x60d7, 0x4099, { 
> > > + 0xac, 0xeb, 0x6d, 0xb5, 0x02, 0x58, 0x7c, 0x24 } }
> > > + 
> > > + [PcdsFixedAtBuild]
> > > +@@ -83,3 +85,6 @@
> > > +   gArmNeoverseN1SocTokenSpaceGuid.PcdRemotePcieMmio32Translation|0x40000000000|UINT64|0x0000004F
> > > +   gArmNeoverseN1SocTokenSpaceGuid.PcdRemotePcieMmio64Translation|0x40000000000|UINT64|0x00000050
> > > +   
> > > +gArmNeoverseN1SocTokenSpaceGuid.PcdRemotePcieSegmentNumber|2|UINT32|0
> > > +x00000051
> > > ++
> > > ++[Ppis]
> > > ++  gNtFwConfigDtInfoPpiGuid =  { 0xb50dee0e, 0x577f, 0x47fb, { 0x83, 
> > > ++0xd0, 0x41, 0x78, 0x61, 0x8b, 0x33, 0x8a } }
> > > +--
> > > +2.17.1
> > > +
> > > --
> > > 2.17.1
> > > 
> > > 
> 

