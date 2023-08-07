Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6CCEC04A6A
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 15:16:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.37164.1691421392583145348
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Aug 2023 08:16:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16DACD75
	for <meta-arm@lists.yoctoproject.org>; Mon,  7 Aug 2023 08:17:15 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0B9E13F59C
	for <meta-arm@lists.yoctoproject.org>; Mon,  7 Aug 2023 08:16:32 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/6] arm/edk2: move 202211 recipe to meta-arm-bsp
Date: Mon,  7 Aug 2023 10:16:16 -0500
Message-Id: <20230807151620.3597527-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230807151620.3597527-1-jon.mason@arm.com>
References: <20230807151620.3597527-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 07 Aug 2023 15:16:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4935

202211 is only used in meta-arm-bsp, and all other users should be using
the latest version.  Move it there until n1sdp can be updated to the
latest.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-bsp/uefi/edk2-firmware_202211.bb  |   2 +-
 ...g-QemuVirtMemInfoLib-use-HOB-not-PCD.patch | 290 ++++++++++++++++++
 ...g-ArmVirtQemu-omit-PCD-PEIM-unless-T.patch |  89 ++++++
 .../recipes-bsp/uefi/files/default.patch      |  23 ++
 4 files changed, 403 insertions(+), 1 deletion(-)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-bsp/uefi/edk2-firmware_202211.=
bb (76%)
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/0001-Revert-ArmVirt=
Pkg-QemuVirtMemInfoLib-use-HOB-not-PCD.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/0002-Revert-ArmVirt=
Pkg-ArmVirtQemu-omit-PCD-PEIM-unless-T.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/default.patch

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202211.bb b/meta-arm-b=
sp/recipes-bsp/uefi/edk2-firmware_202211.bb
similarity index 76%
rename from meta-arm/recipes-bsp/uefi/edk2-firmware_202211.bb
rename to meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202211.bb
index 386bed4b..378f5854 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_202211.bb
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202211.bb
@@ -1,4 +1,4 @@
 SRCREV_edk2           ?=3D "fff6d81270b57ee786ea18ad74f43149b9f03494"
 SRCREV_edk2-platforms ?=3D "982212662c71b6c734b7578526071d6b78da3bcc"
=20
-require edk2-firmware.inc
+require recipes-bsp/uefi/edk2-firmware.inc
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/0001-Revert-ArmVirtPkg-Qem=
uVirtMemInfoLib-use-HOB-not-PCD.patch b/meta-arm-bsp/recipes-bsp/uefi/files=
/0001-Revert-ArmVirtPkg-QemuVirtMemInfoLib-use-HOB-not-PCD.patch
new file mode 100644
index 00000000..824c6ccb
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/uefi/files/0001-Revert-ArmVirtPkg-QemuVirtMe=
mInfoLib-use-HOB-not-PCD.patch
@@ -0,0 +1,290 @@
+From 44b69c8d7c8ed665b4f8d8a9953ea23a731d221f Mon Sep 17 00:00:00 2001
+From: Your Name <you@example.com>
+Date: Fri, 10 Mar 2023 18:46:49 +0000
+Subject: [PATCH] Revert "ArmVirtPkg/QemuVirtMemInfoLib: use HOB not PCD to
+ record the memory size"
+
+This reverts commit 7136d5491e225c57f1d73e4a1b7ac27ed656ff72.
+
+Upstream-Status: Inappropriate [other]
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+
+---
+ ArmVirtPkg/ArmVirtPkg.dec                     |  1 -
+ ArmVirtPkg/ArmVirtQemu.dsc                    |  6 ++--
+ .../ArmVirtMemoryInitPeiLib.c                 | 14 ++------
+ .../ArmVirtMemoryInitPeiLib.inf               |  1 -
+ .../QemuVirtMemInfoLib/QemuVirtMemInfoLib.c   | 35 ++-----------------
+ .../QemuVirtMemInfoLib/QemuVirtMemInfoLib.inf |  5 +--
+ .../QemuVirtMemInfoPeiLib.inf                 |  8 ++---
+ .../QemuVirtMemInfoPeiLibConstructor.c        | 30 +++++++---------
+ 8 files changed, 25 insertions(+), 75 deletions(-)
+
+diff --git a/ArmVirtPkg/ArmVirtPkg.dec b/ArmVirtPkg/ArmVirtPkg.dec
+index 4645c91a83..d2d325d71e 100644
+--- a/ArmVirtPkg/ArmVirtPkg.dec
++++ b/ArmVirtPkg/ArmVirtPkg.dec
+@@ -32,7 +32,6 @@
+   gArmVirtTokenSpaceGuid =3D { 0x0B6F5CA7, 0x4F53, 0x445A, { 0xB7, 0x6E, =
0x2E, 0x36, 0x5B, 0x80, 0x63, 0x66 } }=0D
+   gEarlyPL011BaseAddressGuid       =3D { 0xB199DEA9, 0xFD5C, 0x4A84, { 0x=
80, 0x82, 0x2F, 0x41, 0x70, 0x78, 0x03, 0x05 } }=0D
+   gEarly16550UartBaseAddressGuid   =3D { 0xea67ca3e, 0x1f54, 0x436b, { 0x=
97, 0x88, 0xd4, 0xeb, 0x29, 0xc3, 0x42, 0x67 } }=0D
+-  gArmVirtSystemMemorySizeGuid     =3D { 0x504eccb9, 0x1bf0, 0x4420, { 0x=
86, 0x5d, 0xdc, 0x66, 0x06, 0xd4, 0x13, 0xbf } }=0D
+ =0D
+ [PcdsFeatureFlag]=0D
+   #=0D
+diff --git a/ArmVirtPkg/ArmVirtQemu.dsc b/ArmVirtPkg/ArmVirtQemu.dsc
+index 72a0cacab4..2e786dad12 100644
+--- a/ArmVirtPkg/ArmVirtQemu.dsc
++++ b/ArmVirtPkg/ArmVirtQemu.dsc
+@@ -226,9 +226,6 @@
+   # Shadowing PEI modules is absolutely pointless when the NOR flash is e=
mulated=0D
+   gEfiMdeModulePkgTokenSpaceGuid.PcdShadowPeimOnBoot|FALSE=0D
+ =0D
+-  # System Memory Size -- 128 MB initially, actual size will be fetched f=
rom DT=0D
+-  gArmTokenSpaceGuid.PcdSystemMemorySize|0x8000000=0D
+-=0D
+ [PcdsFixedAtBuild.AARCH64]=0D
+   # Clearing BIT0 in this PCD prevents installing a 32-bit SMBIOS entry p=
oint,=0D
+   # if the entry point version is >=3D 3.0. AARCH64 OSes cannot assume th=
e=0D
+@@ -245,6 +242,9 @@
+   #  enumeration to complete before installing ACPI tables.=0D
+   gEfiMdeModulePkgTokenSpaceGuid.PcdPciDisableBusEnumeration|TRUE=0D
+ =0D
++  # System Memory Size -- 1 MB initially, actual size will be fetched fro=
m DT=0D
++  gArmTokenSpaceGuid.PcdSystemMemorySize|0x00100000=0D
++=0D
+   gArmTokenSpaceGuid.PcdArmArchTimerSecIntrNum|0x0=0D
+   gArmTokenSpaceGuid.PcdArmArchTimerIntrNum|0x0=0D
+   gArmTokenSpaceGuid.PcdArmArchTimerVirtIntrNum|0x0=0D
+diff --git a/ArmVirtPkg/Library/ArmVirtMemoryInitPeiLib/ArmVirtMemoryInitP=
eiLib.c b/ArmVirtPkg/Library/ArmVirtMemoryInitPeiLib/ArmVirtMemoryInitPeiLi=
b.c
+index 72e5c65af7..98d90ad420 100644
+--- a/ArmVirtPkg/Library/ArmVirtMemoryInitPeiLib/ArmVirtMemoryInitPeiLib.c
++++ b/ArmVirtPkg/Library/ArmVirtMemoryInitPeiLib/ArmVirtMemoryInitPeiLib.c
+@@ -52,19 +52,10 @@ MemoryPeim (
+ {=0D
+   EFI_RESOURCE_ATTRIBUTE_TYPE  ResourceAttributes;=0D
+   UINT64                       SystemMemoryTop;=0D
+-  UINT64                       SystemMemorySize;=0D
+-  VOID                         *Hob;=0D
+ =0D
+   // Ensure PcdSystemMemorySize has been set=0D
+   ASSERT (PcdGet64 (PcdSystemMemorySize) !=3D 0);=0D
+ =0D
+-  SystemMemorySize =3D PcdGet64 (PcdSystemMemorySize);=0D
+-=0D
+-  Hob =3D GetFirstGuidHob (&gArmVirtSystemMemorySizeGuid);=0D
+-  if (Hob !=3D NULL) {=0D
+-    SystemMemorySize =3D *(UINT64 *)GET_GUID_HOB_DATA (Hob);=0D
+-  }=0D
+-=0D
+   //=0D
+   // Now, the permanent memory has been installed, we can call AllocatePa=
ges()=0D
+   //=0D
+@@ -75,7 +66,8 @@ MemoryPeim (
+                         EFI_RESOURCE_ATTRIBUTE_TESTED=0D
+                         );=0D
+ =0D
+-  SystemMemoryTop =3D PcdGet64 (PcdSystemMemoryBase) + SystemMemorySize;=
=0D
++  SystemMemoryTop =3D PcdGet64 (PcdSystemMemoryBase) +=0D
++                    PcdGet64 (PcdSystemMemorySize);=0D
+ =0D
+   if (SystemMemoryTop - 1 > MAX_ALLOC_ADDRESS) {=0D
+     BuildResourceDescriptorHob (=0D
+@@ -95,7 +87,7 @@ MemoryPeim (
+       EFI_RESOURCE_SYSTEM_MEMORY,=0D
+       ResourceAttributes,=0D
+       PcdGet64 (PcdSystemMemoryBase),=0D
+-      SystemMemorySize=0D
++      PcdGet64 (PcdSystemMemorySize)=0D
+       );=0D
+   }=0D
+ =0D
+diff --git a/ArmVirtPkg/Library/ArmVirtMemoryInitPeiLib/ArmVirtMemoryInitP=
eiLib.inf b/ArmVirtPkg/Library/ArmVirtMemoryInitPeiLib/ArmVirtMemoryInitPei=
Lib.inf
+index 48d9c66b22..21327f79f4 100644
+--- a/ArmVirtPkg/Library/ArmVirtMemoryInitPeiLib/ArmVirtMemoryInitPeiLib.i=
nf
++++ b/ArmVirtPkg/Library/ArmVirtMemoryInitPeiLib/ArmVirtMemoryInitPeiLib.i=
nf
+@@ -34,7 +34,6 @@
+   CacheMaintenanceLib=0D
+ =0D
+ [Guids]=0D
+-  gArmVirtSystemMemorySizeGuid=0D
+   gEfiMemoryTypeInformationGuid=0D
+ =0D
+ [FeaturePcd]=0D
+diff --git a/ArmVirtPkg/Library/QemuVirtMemInfoLib/QemuVirtMemInfoLib.c b/=
ArmVirtPkg/Library/QemuVirtMemInfoLib/QemuVirtMemInfoLib.c
+index 9cf43f06c0..cf569bed99 100644
+--- a/ArmVirtPkg/Library/QemuVirtMemInfoLib/QemuVirtMemInfoLib.c
++++ b/ArmVirtPkg/Library/QemuVirtMemInfoLib/QemuVirtMemInfoLib.c
+@@ -6,12 +6,10 @@
+ =0D
+ **/=0D
+ =0D
+-#include <Uefi.h>=0D
+-#include <Pi/PiMultiPhase.h>=0D
++#include <Base.h>=0D
+ #include <Library/ArmLib.h>=0D
+ #include <Library/BaseMemoryLib.h>=0D
+ #include <Library/DebugLib.h>=0D
+-#include <Library/HobLib.h>=0D
+ #include <Library/MemoryAllocationLib.h>=0D
+ =0D
+ // Number of Virtual Memory Map Descriptors=0D
+@@ -26,28 +24,6 @@
+ #define MACH_VIRT_PERIPH_BASE  0x08000000=0D
+ #define MACH_VIRT_PERIPH_SIZE  SIZE_128MB=0D
+ =0D
+-/**=0D
+-  Default library constructur that obtains the memory size from a PCD.=0D
+-=0D
+-  @return  Always returns RETURN_SUCCESS=0D
+-=0D
+-**/=0D
+-RETURN_STATUS=0D
+-EFIAPI=0D
+-QemuVirtMemInfoLibConstructor (=0D
+-  VOID=0D
+-  )=0D
+-{=0D
+-  UINT64  Size;=0D
+-  VOID    *Hob;=0D
+-=0D
+-  Size =3D PcdGet64 (PcdSystemMemorySize);=0D
+-  Hob  =3D BuildGuidDataHob (&gArmVirtSystemMemorySizeGuid, &Size, sizeof=
 Size);=0D
+-  ASSERT (Hob !=3D NULL);=0D
+-=0D
+-  return RETURN_SUCCESS;=0D
+-}=0D
+-=0D
+ /**=0D
+   Return the Virtual Memory Map of your platform=0D
+ =0D
+@@ -67,16 +43,9 @@ ArmVirtGetMemoryMap (
+   )=0D
+ {=0D
+   ARM_MEMORY_REGION_DESCRIPTOR  *VirtualMemoryTable;=0D
+-  VOID                          *MemorySizeHob;=0D
+ =0D
+   ASSERT (VirtualMemoryMap !=3D NULL);=0D
+ =0D
+-  MemorySizeHob =3D GetFirstGuidHob (&gArmVirtSystemMemorySizeGuid);=0D
+-  ASSERT (MemorySizeHob !=3D NULL);=0D
+-  if (MemorySizeHob =3D=3D NULL) {=0D
+-    return;=0D
+-  }=0D
+-=0D
+   VirtualMemoryTable =3D AllocatePool (=0D
+                          sizeof (ARM_MEMORY_REGION_DESCRIPTOR) *=0D
+                          MAX_VIRTUAL_MEMORY_MAP_DESCRIPTORS=0D
+@@ -90,7 +59,7 @@ ArmVirtGetMemoryMap (
+   // System DRAM=0D
+   VirtualMemoryTable[0].PhysicalBase =3D PcdGet64 (PcdSystemMemoryBase);=
=0D
+   VirtualMemoryTable[0].VirtualBase  =3D VirtualMemoryTable[0].PhysicalBa=
se;=0D
+-  VirtualMemoryTable[0].Length       =3D *(UINT64 *)GET_GUID_HOB_DATA (Me=
morySizeHob);=0D
++  VirtualMemoryTable[0].Length       =3D PcdGet64 (PcdSystemMemorySize);=
=0D
+   VirtualMemoryTable[0].Attributes   =3D ARM_MEMORY_REGION_ATTRIBUTE_WRIT=
E_BACK;=0D
+ =0D
+   DEBUG ((=0D
+diff --git a/ArmVirtPkg/Library/QemuVirtMemInfoLib/QemuVirtMemInfoLib.inf =
b/ArmVirtPkg/Library/QemuVirtMemInfoLib/QemuVirtMemInfoLib.inf
+index 6acad8bbd7..7150de6c10 100644
+--- a/ArmVirtPkg/Library/QemuVirtMemInfoLib/QemuVirtMemInfoLib.inf
++++ b/ArmVirtPkg/Library/QemuVirtMemInfoLib/QemuVirtMemInfoLib.inf
+@@ -14,7 +14,6 @@
+   MODULE_TYPE                    =3D BASE=0D
+   VERSION_STRING                 =3D 1.0=0D
+   LIBRARY_CLASS                  =3D ArmVirtMemInfoLib=0D
+-  CONSTRUCTOR                    =3D QemuVirtMemInfoLibConstructor=0D
+ =0D
+ [Sources]=0D
+   QemuVirtMemInfoLib.c=0D
+@@ -31,9 +30,7 @@
+   BaseMemoryLib=0D
+   DebugLib=0D
+   MemoryAllocationLib=0D
+-=0D
+-[Guids]=0D
+-  gArmVirtSystemMemorySizeGuid=0D
++  PcdLib=0D
+ =0D
+ [Pcd]=0D
+   gArmTokenSpaceGuid.PcdFvBaseAddress=0D
+diff --git a/ArmVirtPkg/Library/QemuVirtMemInfoLib/QemuVirtMemInfoPeiLib.i=
nf b/ArmVirtPkg/Library/QemuVirtMemInfoLib/QemuVirtMemInfoPeiLib.inf
+index f045e39a41..7ecf6dfbb7 100644
+--- a/ArmVirtPkg/Library/QemuVirtMemInfoLib/QemuVirtMemInfoPeiLib.inf
++++ b/ArmVirtPkg/Library/QemuVirtMemInfoLib/QemuVirtMemInfoPeiLib.inf
+@@ -32,16 +32,16 @@
+   BaseMemoryLib=0D
+   DebugLib=0D
+   FdtLib=0D
++  PcdLib=0D
+   MemoryAllocationLib=0D
+ =0D
+-[Guids]=0D
+-  gArmVirtSystemMemorySizeGuid=0D
+-=0D
+-[FixedPcd]=0D
++[Pcd]=0D
+   gArmTokenSpaceGuid.PcdFdBaseAddress=0D
+   gArmTokenSpaceGuid.PcdFvBaseAddress=0D
+   gArmTokenSpaceGuid.PcdSystemMemoryBase=0D
+   gArmTokenSpaceGuid.PcdSystemMemorySize=0D
++=0D
++[FixedPcd]=0D
+   gArmTokenSpaceGuid.PcdFdSize=0D
+   gArmTokenSpaceGuid.PcdFvSize=0D
+   gArmVirtTokenSpaceGuid.PcdDeviceTreeInitialBaseAddress=0D
+diff --git a/ArmVirtPkg/Library/QemuVirtMemInfoLib/QemuVirtMemInfoPeiLibCo=
nstructor.c b/ArmVirtPkg/Library/QemuVirtMemInfoLib/QemuVirtMemInfoPeiLibCo=
nstructor.c
+index c47ab82966..33d3597d57 100644
+--- a/ArmVirtPkg/Library/QemuVirtMemInfoLib/QemuVirtMemInfoPeiLibConstruct=
or.c
++++ b/ArmVirtPkg/Library/QemuVirtMemInfoLib/QemuVirtMemInfoPeiLibConstruct=
or.c
+@@ -6,10 +6,9 @@
+ =0D
+ **/=0D
+ =0D
+-#include <Uefi.h>=0D
+-#include <Pi/PiMultiPhase.h>=0D
++#include <Base.h>=0D
+ #include <Library/DebugLib.h>=0D
+-#include <Library/HobLib.h>=0D
++#include <Library/PcdLib.h>=0D
+ #include <libfdt.h>=0D
+ =0D
+ RETURN_STATUS=0D
+@@ -18,14 +17,14 @@ QemuVirtMemInfoPeiLibConstructor (
+   VOID=0D
+   )=0D
+ {=0D
+-  VOID          *DeviceTreeBase;=0D
+-  INT32         Node, Prev;=0D
+-  UINT64        NewBase, CurBase;=0D
+-  UINT64        NewSize, CurSize;=0D
+-  CONST CHAR8   *Type;=0D
+-  INT32         Len;=0D
+-  CONST UINT64  *RegProp;=0D
+-  VOID          *Hob;=0D
++  VOID           *DeviceTreeBase;=0D
++  INT32          Node, Prev;=0D
++  UINT64         NewBase, CurBase;=0D
++  UINT64         NewSize, CurSize;=0D
++  CONST CHAR8    *Type;=0D
++  INT32          Len;=0D
++  CONST UINT64   *RegProp;=0D
++  RETURN_STATUS  PcdStatus;=0D
+ =0D
+   NewBase =3D 0;=0D
+   NewSize =3D 0;=0D
+@@ -87,13 +86,8 @@ QemuVirtMemInfoPeiLibConstructor (
+   // Make sure the start of DRAM matches our expectation=0D
+   //=0D
+   ASSERT (FixedPcdGet64 (PcdSystemMemoryBase) =3D=3D NewBase);=0D
+-=0D
+-  Hob =3D BuildGuidDataHob (=0D
+-          &gArmVirtSystemMemorySizeGuid,=0D
+-          &NewSize,=0D
+-          sizeof NewSize=0D
+-          );=0D
+-  ASSERT (Hob !=3D NULL);=0D
++  PcdStatus =3D PcdSet64S (PcdSystemMemorySize, NewSize);=0D
++  ASSERT_RETURN_ERROR (PcdStatus);=0D
+ =0D
+   //=0D
+   // We need to make sure that the machine we are running on has at least=
=0D
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/0002-Revert-ArmVirtPkg-Arm=
VirtQemu-omit-PCD-PEIM-unless-T.patch b/meta-arm-bsp/recipes-bsp/uefi/files=
/0002-Revert-ArmVirtPkg-ArmVirtQemu-omit-PCD-PEIM-unless-T.patch
new file mode 100644
index 00000000..64e85ab1
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/uefi/files/0002-Revert-ArmVirtPkg-ArmVirtQem=
u-omit-PCD-PEIM-unless-T.patch
@@ -0,0 +1,89 @@
+From caef501f2c05ba2170d0a449856900919021d6f6 Mon Sep 17 00:00:00 2001
+From: Your Name <you@example.com>
+Date: Fri, 10 Mar 2023 18:47:09 +0000
+Subject: [PATCH] Revert "ArmVirtPkg/ArmVirtQemu: omit PCD PEIM unless TPM
+ support is enabled"
+
+This reverts commit b6efc505e4d6eb2055a39afd0a1ee67846a1e5f9.
+
+Upstream-Status: Inappropriate [other]
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+
+---
+ ArmVirtPkg/ArmVirtQemu.dsc | 22 +++++-----------------
+ ArmVirtPkg/ArmVirtQemu.fdf |  2 +-
+ 2 files changed, 6 insertions(+), 18 deletions(-)
+
+diff --git a/ArmVirtPkg/ArmVirtQemu.dsc b/ArmVirtPkg/ArmVirtQemu.dsc
+index 2e786dad12..0f8157a032 100644
+--- a/ArmVirtPkg/ArmVirtQemu.dsc
++++ b/ArmVirtPkg/ArmVirtQemu.dsc
+@@ -293,15 +293,10 @@
+   #=0D
+   # TPM2 support=0D
+   #=0D
+-!if $(TPM2_ENABLE) =3D=3D TRUE=0D
+   gEfiSecurityPkgTokenSpaceGuid.PcdTpmBaseAddress|0x0=0D
++!if $(TPM2_ENABLE) =3D=3D TRUE=0D
+   gEfiSecurityPkgTokenSpaceGuid.PcdTpmInstanceGuid|{0x00, 0x00, 0x00, 0x0=
0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}=
=0D
+   gEfiSecurityPkgTokenSpaceGuid.PcdTpm2HashMask|0=0D
+-!else=0D
+-[PcdsPatchableInModule]=0D
+-  # make this PCD patchable instead of dynamic when TPM support is not en=
abled=0D
+-  # this permits setting the PCD in unreachable code without pulling in d=
ynamic PCD support=0D
+-  gEfiSecurityPkgTokenSpaceGuid.PcdTpmBaseAddress|0x0=0D
+ !endif=0D
+ =0D
+ [PcdsDynamicHii]=0D
+@@ -314,13 +309,6 @@
+ =0D
+   gEfiMdePkgTokenSpaceGuid.PcdPlatformBootTimeOut|L"Timeout"|gEfiGlobalVa=
riableGuid|0x0|5=0D
+ =0D
+-[LibraryClasses.common.PEI_CORE, LibraryClasses.common.PEIM]=0D
+-!if $(TPM2_ENABLE) =3D=3D TRUE=0D
+-  PcdLib|MdePkg/Library/PeiPcdLib/PeiPcdLib.inf=0D
+-!else=0D
+-  PcdLib|MdePkg/Library/BasePcdLibNull/BasePcdLibNull.inf=0D
+-!endif=0D
+-=0D
+ #########################################################################=
#######=0D
+ #=0D
+ # Components Section - list of all EDK II Modules needed by this Platform=
=0D
+@@ -332,6 +320,10 @@
+   #=0D
+   ArmPlatformPkg/PrePeiCore/PrePeiCoreUniCore.inf=0D
+   MdeModulePkg/Core/Pei/PeiMain.inf=0D
++  MdeModulePkg/Universal/PCD/Pei/Pcd.inf {=0D
++    <LibraryClasses>=0D
++      PcdLib|MdePkg/Library/BasePcdLibNull/BasePcdLibNull.inf=0D
++  }=0D
+   ArmPlatformPkg/PlatformPei/PlatformPeim.inf=0D
+   ArmVirtPkg/MemoryInitPei/MemoryInitPeim.inf {=0D
+     <LibraryClasses>=0D
+@@ -342,10 +334,6 @@
+   ArmPkg/Drivers/CpuPei/CpuPei.inf=0D
+ =0D
+ !if $(TPM2_ENABLE) =3D=3D TRUE=0D
+-  MdeModulePkg/Universal/PCD/Pei/Pcd.inf {=0D
+-    <LibraryClasses>=0D
+-      PcdLib|MdePkg/Library/BasePcdLibNull/BasePcdLibNull.inf=0D
+-  }=0D
+   MdeModulePkg/Universal/ResetSystemPei/ResetSystemPei.inf {=0D
+     <LibraryClasses>=0D
+       ResetSystemLib|ArmVirtPkg/Library/ArmVirtPsciResetSystemPeiLib/ArmV=
irtPsciResetSystemPeiLib.inf=0D
+diff --git a/ArmVirtPkg/ArmVirtQemu.fdf b/ArmVirtPkg/ArmVirtQemu.fdf
+index 764f652afd..c85e36b185 100644
+--- a/ArmVirtPkg/ArmVirtQemu.fdf
++++ b/ArmVirtPkg/ArmVirtQemu.fdf
+@@ -109,10 +109,10 @@ READ_LOCK_STATUS   =3D TRUE
+   INF ArmPlatformPkg/PlatformPei/PlatformPeim.inf=0D
+   INF ArmVirtPkg/MemoryInitPei/MemoryInitPeim.inf=0D
+   INF ArmPkg/Drivers/CpuPei/CpuPei.inf=0D
++  INF MdeModulePkg/Universal/PCD/Pei/Pcd.inf=0D
+   INF MdeModulePkg/Core/DxeIplPeim/DxeIpl.inf=0D
+ =0D
+ !if $(TPM2_ENABLE) =3D=3D TRUE=0D
+-  INF MdeModulePkg/Universal/PCD/Pei/Pcd.inf=0D
+   INF MdeModulePkg/Universal/ResetSystemPei/ResetSystemPei.inf=0D
+   INF OvmfPkg/Tcg/Tcg2Config/Tcg2ConfigPei.inf=0D
+   INF SecurityPkg/Tcg/Tcg2Pei/Tcg2Pei.inf=0D
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/default.patch b/meta-arm-b=
sp/recipes-bsp/uefi/files/default.patch
new file mode 100644
index 00000000..fca232f0
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/uefi/files/default.patch
@@ -0,0 +1,23 @@
+Platform/ARM: fix uninitialized variable FileSize in RunAxf
+
+Clang 14 detects a potentially uninitialized variable FileSize:
+
+RunAxf.c:216:11: error: variable 'FileSize' is used uninitialized
+                        whenever 'if' condition is false
+RunAxf.c:281:38: note: uninitialized use occurs here
+WriteBackDataCacheRange (FileData, FileSize);
+                                    ^~~~~~~~
+
+Reading the code it doesn't look like this can actually happen, but we
+can keep clang happy by initialising FileSize to 0.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/Platform/ARM/Library/ArmShellCmdRunAxf/RunAxf.c b/Platform/AR=
M/Library/ArmShellCmdRunAxf/RunAxf.c
+index d23739ad38..fba5e0ba30 100644
+--- a/Platform/ARM/Library/ArmShellCmdRunAxf/RunAxf.c
++++ b/Platform/ARM/Library/ArmShellCmdRunAxf/RunAxf.c
+@@ -136,1 +136,1 @@ ShellDynCmdRunAxfHandler (
+-  UINTN                       FileSize;=0D
++  UINTN                       FileSize =3D 0;=0D
--=20
2.30.2


