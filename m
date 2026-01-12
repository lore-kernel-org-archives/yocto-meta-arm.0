Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA24CF45C9
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 19:05:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40734.1768244698815541681
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 12 Jan 2026 11:04:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99A371516
	for <meta-arm@lists.yoctoproject.org>; Mon, 12 Jan 2026 11:04:51 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 328583F694
	for <meta-arm@lists.yoctoproject.org>; Mon, 12 Jan 2026 11:04:58 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/edk2-firmware: update to edk2-stable202511
Date: Mon, 12 Jan 2026 14:04:57 -0500
Message-ID: <20260112190457.93847-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260112190457.93847-1-jon.mason@arm.com>
References: <20260112190457.93847-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 12 Jan 2026 19:05:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6839

Update edk2-firmware and edk2-basetools to the 202511 stable release.

Patches from upstream were needed to get it compiling with clang.

edk2 dropped support for 32bit arm and x86, see
https://edk2.groups.io/g/devel/topic/rfc_remove_ovmf_ia32_and/114152215
Therefore, we're dropping qemuarm edk2 testing and relevant bits

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml                                |   1 -
 .../cases/parselogs-ignores-sbsa-ref.txt      |   3 -
 ...508.bb =3D> edk2-basetools-native_202511.bb} |   2 +-
 .../recipes-bsp/uefi/edk2-firmware_%.bbappend |  11 --
 .../recipes-bsp/uefi/edk2-firmware_202508.bb  |   9 --
 .../recipes-bsp/uefi/edk2-firmware_202511.bb  |   7 +
 ...s-in-MiscChassisManufacturerFunction.patch | 148 ++++++++++++++++++
 ...def-Use-LLD-to-link-ACPI-table-binar.patch |  42 +++++
 .../uefi/files/edk2_fix_epoch.patch           |  33 ----
 ...02-Enforce-using-good-old-BFD-linker.patch |  10 +-
 meta-arm/recipes-bsp/uefi/sbsa-acs_7.2.2.bb   |   2 +-
 11 files changed, 204 insertions(+), 64 deletions(-)
 rename meta-arm/recipes-bsp/uefi/{edk2-basetools-native_202508.bb =3D> edk=
2-basetools-native_202511.bb} (93%)
 delete mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202508.bb
 create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202511.bb
 create mode 100644 meta-arm/recipes-bsp/uefi/files/0001-ArmPkg-Fix-errors-=
in-MiscChassisManufacturerFunction.patch
 create mode 100644 meta-arm/recipes-bsp/uefi/files/0001-BaseTools-tools_de=
f-Use-LLD-to-link-ACPI-table-binar.patch
 delete mode 100644 meta-arm/recipes-bsp/uefi/files/edk2_fix_epoch.patch

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 095a1addc21b..ef7cf1904589 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -308,7 +308,6 @@ qemuarm:
   parallel:
     matrix:
       - TOOLCHAINS: [gcc, clang]
-        FIRMWARE: edk2
         TESTING: testimage
       - DISTRO: poky-tiny
         TESTING: testimage
diff --git a/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-sbsa-ref=
.txt b/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-sbsa-ref.txt
index fab5cc623354..99e6fee7a452 100644
--- a/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-sbsa-ref.txt
+++ b/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-sbsa-ref.txt
@@ -1,6 +1,3 @@
-# The release of EDK2 after 202402 should fix this
-NUMA: Failed to initialise from firmware
-
 # TODO: we should be using bochsdrm over efifb?
 efifb: cannot reserve video memory at 0x80000000
=20
diff --git a/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202508.bb b/me=
ta-arm/recipes-bsp/uefi/edk2-basetools-native_202511.bb
similarity index 93%
rename from meta-arm/recipes-bsp/uefi/edk2-basetools-native_202508.bb
rename to meta-arm/recipes-bsp/uefi/edk2-basetools-native_202511.bb
index 3c47b91a9069..7f12b31507a3 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202508.bb
+++ b/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202511.bb
@@ -10,7 +10,7 @@ LICENSE =3D "BSD-2-Clause-Patent"
 SRC_URI =3D "git://github.com/tianocore/edk2.git;branch=3Dmaster;protocol=
=3Dhttps"
 LIC_FILES_CHKSUM =3D "file://License.txt;md5=3D2b415520383f7964e96700ae12b=
4570a"
=20
-SRCREV =3D "d46aa46c8361194521391aa581593e556c707c6e"
+SRCREV =3D "46548b1adac82211d8d11da12dd914f41e7aa775"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "^edk2-stable(?P<pver>\d+)$"
=20
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend b/meta-arm/=
recipes-bsp/uefi/edk2-firmware_%.bbappend
index 64ec53b35791..b806bf8768e8 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
@@ -5,17 +5,6 @@ EDK2_BIN_NAME:qemuarm64      =3D "QEMU_EFI.fd"
 # No need for PXE booting in qemu, disable to reduce unnecessary noise
 EDK2_EXTRA_BUILD:qemuarm64 +=3D " -D NETWORK_PXE_BOOT_ENABLE=3DFALSE "
=20
-COMPATIBLE_MACHINE:qemuarm =3D "qemuarm"
-EDK2_PLATFORM:qemuarm      =3D "ArmVirtQemu-ARM"
-EDK2_PLATFORM_DSC:qemuarm  =3D "ArmVirtPkg/ArmVirtQemu.dsc"
-EDK2_BIN_NAME:qemuarm      =3D "QEMU_EFI.fd"
-# No need for PXE booting in qemu, disable to reduce unnecessary noise
-EDK2_EXTRA_BUILD:qemuarm +=3D " -D NETWORK_PXE_BOOT_ENABLE=3DFALSE "
-
 do_install:append:qemuarm64() {
     install ${B}/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${EDK_COMPILER}=
/FV/${EDK2_BIN_NAME} ${D}/firmware/
 }
-
-do_install:append:qemuarm() {
-    install ${B}/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${EDK_COMPILER}=
/FV/${EDK2_BIN_NAME} ${D}/firmware/
-}
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202508.bb b/meta-arm/r=
ecipes-bsp/uefi/edk2-firmware_202508.bb
deleted file mode 100644
index 7d766d594d85..000000000000
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_202508.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require recipes-bsp/uefi/edk2-firmware.inc
-
-SRCREV_edk2           ?=3D "d46aa46c8361194521391aa581593e556c707c6e"
-SRCREV_edk2-platforms ?=3D "d82aa92c1d360c1b53ccad4dc45bdd8164a560d5"
-
-SRC_URI +=3D "file://edk2_fix_epoch.patch"
-
-#FIXME - arm32 doesn't work with clang due to a linker issue
-TOOLCHAIN:arm =3D "gcc"
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202511.bb b/meta-arm/r=
ecipes-bsp/uefi/edk2-firmware_202511.bb
new file mode 100644
index 000000000000..c9871e10d557
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_202511.bb
@@ -0,0 +1,7 @@
+require recipes-bsp/uefi/edk2-firmware.inc
+
+SRCREV_edk2           ?=3D "46548b1adac82211d8d11da12dd914f41e7aa775"
+SRCREV_edk2-platforms ?=3D "675f692ace4ae501c7f6f700cff364b13960e74e"
+
+SRC_URI +=3D "file://0001-BaseTools-tools_def-Use-LLD-to-link-ACPI-table-b=
inar.patch \
+            file://0001-ArmPkg-Fix-errors-in-MiscChassisManufacturerFuncti=
on.patch"
diff --git a/meta-arm/recipes-bsp/uefi/files/0001-ArmPkg-Fix-errors-in-Misc=
ChassisManufacturerFunction.patch b/meta-arm/recipes-bsp/uefi/files/0001-Ar=
mPkg-Fix-errors-in-MiscChassisManufacturerFunction.patch
new file mode 100644
index 000000000000..06298e43a474
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/files/0001-ArmPkg-Fix-errors-in-MiscChassis=
ManufacturerFunction.patch
@@ -0,0 +1,148 @@
+From 33e4e73a17bff0823bc916998169b926115b0c6b Mon Sep 17 00:00:00 2001
+From: Mike Beaton <mjsbeaton@gmail.com>
+Date: Mon, 24 Nov 2025 20:40:28 +0000
+Subject: [PATCH] ArmPkg: Fix errors in MiscChassisManufacturerFunction
+
+Initial error found while attempting to implement Azure Pipelines
+CLANGDWARF CI:
+
+ERROR - Compiler #error from /__w/1/s/ArmPkg/Universal/Smbios/SmbiosMiscDx
+e/Type03/MiscChassisManufacturerFunction.c variable 'ContainedElements' is
+uninitialized when passed as a const pointer argument here [-Werror,-Wunin
+itialized-const-pointer]
+
+The code in question should copy the optional ContainedElements from
+InputData, so fix it so that it does.
+
+Additionally:
+
+ - Various size calculations in the original code are incorrect, since
+   the base size for calculations should not include ContainedElements,
+   so fix these.
+ - Since we are calculating Hdr.Length separately as part of the above,
+   add code to ASSERT and return EFI_OUT_OF_RESOURCES if it would
+   overflow the UINT8 location where it will be stored.
+ - Since we are adding a new early exit, fix the fact that no error log
+   message is generated on early exit.
+
+Fixes: bfc0fae459543442f3f17e0de655a72aba5b0920
+
+Signed-off-by: Mike Beaton <mjsbeaton@gmail.com>
+
+Upstream-Status: Backport [33e4e73a17bff0823bc916998169b926115b0c6b]
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+---
+ .../Type03/MiscChassisManufacturerFunction.c  | 54 ++++++++++---------
+ 1 file changed, 29 insertions(+), 25 deletions(-)
+
+diff --git a/ArmPkg/Universal/Smbios/SmbiosMiscDxe/Type03/MiscChassisManuf=
acturerFunction.c b/ArmPkg/Universal/Smbios/SmbiosMiscDxe/Type03/MiscChassi=
sManufacturerFunction.c
+index 6b3b63b0e8d5..363f3bfe30d6 100644
+--- a/ArmPkg/Universal/Smbios/SmbiosMiscDxe/Type03/MiscChassisManufacturer=
Function.c
++++ b/ArmPkg/Universal/Smbios/SmbiosMiscDxe/Type03/MiscChassisManufacturer=
Function.c
+@@ -45,6 +45,9 @@ SMBIOS_MISC_TABLE_FUNCTION (MiscChassisManufacturer) {
+   UINTN               AssertTagStrLen;=0D
+   UINTN               SerialNumStrLen;=0D
+   UINTN               ChaNumStrLen;=0D
++  UINTN               BaseSize;=0D
++  UINTN               ExtendLength;=0D
++  UINTN               HdrLength;=0D
+   EFI_STRING          Manufacturer;=0D
+   EFI_STRING          Version;=0D
+   EFI_STRING          SerialNumber;=0D
+@@ -55,12 +58,6 @@ SMBIOS_MISC_TABLE_FUNCTION (MiscChassisManufacturer) {
+   SMBIOS_TABLE_TYPE3  *InputData;=0D
+   EFI_STATUS          Status;=0D
+ =0D
+-  UINT8              ContainedElementCount;=0D
+-  CONTAINED_ELEMENT  ContainedElements;=0D
+-  UINT8              ExtendLength;=0D
+-=0D
+-  ExtendLength =3D 0;=0D
+-=0D
+   //=0D
+   // First check for invalid parameters.=0D
+   //=0D
+@@ -116,14 +113,25 @@ SMBIOS_MISC_TABLE_FUNCTION (MiscChassisManufacturer)=
 {
+   ChassisSkuNumber =3D HiiGetPackageString (&gEfiCallerIdGuid, TokenToGet=
, NULL);=0D
+   ChaNumStrLen     =3D StrLen (ChassisSkuNumber);=0D
+ =0D
+-  ContainedElementCount =3D InputData->ContainedElementCount;=0D
+-  ExtendLength          =3D ContainedElementCount * sizeof (CONTAINED_ELE=
MENT);=0D
++  STATIC_ASSERT (OFFSET_OF (SMBIOS_TABLE_TYPE3, ContainedElements) =3D=3D=
 0x15, "Base size of SMBIOS_TABLE_TYPE3 does not meet SMBIOS specification"=
);=0D
++=0D
++  BaseSize     =3D OFFSET_OF (SMBIOS_TABLE_TYPE3, ContainedElements);=0D
++  ExtendLength =3D (UINTN)InputData->ContainedElementCount * (UINTN)Input=
Data->ContainedElementRecordLength;=0D
++=0D
++  //=0D
++  // Length of SMBIOS struct includes ContainedElements and SKUNumber.=0D
++  //=0D
++  HdrLength =3D BaseSize + ExtendLength + sizeof (SMBIOS_TABLE_STRING);=0D
++  if (HdrLength > MAX_UINT8) {=0D
++    ASSERT (HdrLength <=3D MAX_UINT8);=0D
++    Status =3D EFI_OUT_OF_RESOURCES;=0D
++    goto Exit;=0D
++  }=0D
+ =0D
+   //=0D
+-  // Two zeros following the last string.=0D
++  // Additional zero follows the last string.=0D
+   //=0D
+-  RecordLength =3D sizeof (SMBIOS_TABLE_TYPE3) +=0D
+-                 ExtendLength    + 1 +=0D
++  RecordLength =3D HdrLength       +=0D
+                  ManuStrLen      + 1 +=0D
+                  VerStrLen       + 1 +=0D
+                  SerialNumStrLen + 1 +=0D
+@@ -135,25 +143,20 @@ SMBIOS_MISC_TABLE_FUNCTION (MiscChassisManufacturer)=
 {
+     goto Exit;=0D
+   }=0D
+ =0D
+-  (VOID)CopyMem (SmbiosRecord, InputData, sizeof (SMBIOS_TABLE_TYPE3));=0D
++  // Copy base record plus ContainedElements.=0D
++  (VOID)CopyMem (SmbiosRecord, InputData, BaseSize + ExtendLength);=0D
+ =0D
+-  SmbiosRecord->Hdr.Length =3D sizeof (SMBIOS_TABLE_TYPE3) + ExtendLength=
 + 1;=0D
++  SmbiosRecord->Hdr.Length =3D HdrLength;=0D
+ =0D
+   SmbiosRecord->Type =3D OemGetChassisType ();=0D
+ =0D
+-  // ContainedElements=0D
+-  ASSERT (ContainedElementCount < 2);=0D
+-  (VOID)CopyMem (SmbiosRecord + 1, &ContainedElements, ExtendLength);=0D
+-=0D
+   // ChassisSkuNumber=0D
+-  SkuNumberField =3D (UINT8 *)SmbiosRecord +=0D
+-                   sizeof (SMBIOS_TABLE_TYPE3) -=0D
+-                   sizeof (CONTAINED_ELEMENT) + ExtendLength;=0D
++  SkuNumberField =3D (UINT8 *)SmbiosRecord + BaseSize + ExtendLength;=0D
+ =0D
++  // The string numbers in the fixed position portion of the record are p=
opulated in the input data.=0D
+   *SkuNumberField =3D 5;=0D
+ =0D
+-  OptionalStrStart =3D (CHAR8 *)((UINT8 *)SmbiosRecord + sizeof (SMBIOS_T=
ABLE_TYPE3) +=0D
+-                               ExtendLength + 1);=0D
++  OptionalStrStart =3D (CHAR8 *)((UINT8 *)SmbiosRecord + HdrLength);=0D
+   UnicodeStrToAsciiStrS (Manufacturer, OptionalStrStart, ManuStrLen + 1);=
=0D
+   StrStart =3D OptionalStrStart + ManuStrLen + 1;=0D
+   UnicodeStrToAsciiStrS (Version, StrStart, VerStrLen + 1);=0D
+@@ -175,6 +178,10 @@ SMBIOS_MISC_TABLE_FUNCTION (MiscChassisManufacturer) {
+   // Now we have got the full smbios record, call smbios protocol to add =
this record.=0D
+   //=0D
+   Status =3D SmbiosMiscAddRecord ((UINT8 *)SmbiosRecord, NULL);=0D
++=0D
++  FreePool (SmbiosRecord);=0D
++=0D
++Exit:=0D
+   if (EFI_ERROR (Status)) {=0D
+     DEBUG ((=0D
+       DEBUG_ERROR,=0D
+@@ -185,9 +192,6 @@ SMBIOS_MISC_TABLE_FUNCTION (MiscChassisManufacturer) {
+       ));=0D
+   }=0D
+ =0D
+-  FreePool (SmbiosRecord);=0D
+-=0D
+-Exit:=0D
+   if (Manufacturer !=3D NULL) {=0D
+     FreePool (Manufacturer);=0D
+   }=0D
diff --git a/meta-arm/recipes-bsp/uefi/files/0001-BaseTools-tools_def-Use-L=
LD-to-link-ACPI-table-binar.patch b/meta-arm/recipes-bsp/uefi/files/0001-Ba=
seTools-tools_def-Use-LLD-to-link-ACPI-table-binar.patch
new file mode 100644
index 000000000000..4504800da232
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/files/0001-BaseTools-tools_def-Use-LLD-to-l=
ink-ACPI-table-binar.patch
@@ -0,0 +1,42 @@
+From 5d38a20196b9b9d15552ba3617ec7f63f6401a5c Mon Sep 17 00:00:00 2001
+From: Ard Biesheuvel <ardb@kernel.org>
+Date: Tue, 25 Nov 2025 14:29:20 +0100
+Subject: [PATCH] BaseTools/tools_def: Use LLD to link ACPI table binaries
+
+Currently, the CLANGDWARF toolchain on AARCH64 fails to pass the
+-fuse-ld=3Dlld compiler option, and so linking ACPI table binaries falls
+back to the BFD linker. On non-AARCH64 build systems, this will
+correctly run the cross-linker, based on the -target argument passed to
+Clang, which therefore needs to be installed.
+
+However, the ASLCC invocation fails to pass that same -target argument,
+therefore producing object files for the native architecture, which the
+cross-linker cannot link, resulting in a build error.
+
+So pass the target in ASLCC_FLAGS as well, which is sufficient to get a
+working build. And for good measure, pass -fuse-ld=3Dlld so that we don't
+rely on the BFD cross-linker in the first place.
+
+Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
+
+Upstream-Status: Backport [5d38a20196b9b9d15552ba3617ec7f63f6401a5c]
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+---
+ BaseTools/Conf/tools_def.template | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_def.=
template
+index 32085ad00af7..d19624fa4628 100755
+--- a/BaseTools/Conf/tools_def.template
++++ b/BaseTools/Conf/tools_def.template
+@@ -1872,8 +1872,8 @@ DEFINE CLANGDWARF_AARCH64_DLINK_FLAGS  =3D DEF(CLANG=
DWARF_AARCH64_TARGET) DEF(GCC_
+ *_CLANGDWARF_AARCH64_SLINK_PATH     =3D ENV(CLANGDWARF_BIN)llvm-ar=0D
+ *_CLANGDWARF_AARCH64_RC_PATH        =3D ENV(CLANGDWARF_BIN)llvm-objcopy=0D
+ =0D
+-*_CLANGDWARF_AARCH64_ASLCC_FLAGS    =3D DEF(GCC_ASLCC_FLAGS) -fno-lto=0D
+-*_CLANGDWARF_AARCH64_ASLDLINK_FLAGS =3D DEF(CLANGDWARF_AARCH64_TARGET) DE=
F(GCC_AARCH64_ASLDLINK_FLAGS) DEF(CLANGDWARF_DLINK_WARNING_FLAGS)=0D
++*_CLANGDWARF_AARCH64_ASLCC_FLAGS    =3D DEF(GCC_ASLCC_FLAGS) DEF(CLANGDWA=
RF_AARCH64_TARGET) -fno-lto=0D
++*_CLANGDWARF_AARCH64_ASLDLINK_FLAGS =3D DEF(CLANGDWARF_AARCH64_TARGET) DE=
F(GCC_AARCH64_ASLDLINK_FLAGS) DEF(CLANGDWARF_DLINK_WARNING_FLAGS) -fuse-ld=
=3Dlld=0D
+ *_CLANGDWARF_AARCH64_ASM_FLAGS      =3D DEF(GCC_ASM_FLAGS) DEF(CLANGDWARF=
_AARCH64_TARGET) $(PLATFORM_FLAGS) -Qunused-arguments=0D
+ *_CLANGDWARF_AARCH64_DLINK_FLAGS    =3D DEF(CLANGDWARF_AARCH64_TARGET) DE=
F(GCC_AARCH64_DLINK_FLAGS) -z common-page-size=3D0x1000 DEF(CLANGDWARF_DLIN=
K_WARNING_FLAGS)=0D
+ *_CLANGDWARF_AARCH64_DLINK_XIPFLAGS =3D -z common-page-size=3D0x20=0D
diff --git a/meta-arm/recipes-bsp/uefi/files/edk2_fix_epoch.patch b/meta-ar=
m/recipes-bsp/uefi/files/edk2_fix_epoch.patch
deleted file mode 100644
index d128df46bf12..000000000000
--- a/meta-arm/recipes-bsp/uefi/files/edk2_fix_epoch.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From ef9dfeb6e96bf7f71162691a78d6b82c9516c0c0 Mon Sep 17 00:00:00 2001
-From: Mikko Rapeli <mikko.rapeli@linaro.org>
-Date: Tue, 1 Apr 2025 10:34:31 -0400
-Subject: [PATCH] edk2-firmware: fix SOURCE_DATE_EPOCH use
-
-printenv host tool is not exposed to recipes so
-just set epoch using SOURCE_DATE_EPOCH which is always
-set. Fixes compile error:
-
-Building ... ../build/tmp_zynqmp-kria-starter-psa/work/zynqmp_kria_starter=
_psa-poky-linux/edk2-firmware/202411/edk2/MdePkg/Library/UefiMemoryAllocati=
onLib/UefiMemoryAllocationLib.inf [AARCH64]
-../build/tmp_zynqmp-kria-starter-psa/work/zynqmp_kria_starter_psa-poky-lin=
ux/edk2-firmware/202411/edk2/EmbeddedPkg/Library/VirtualRealTimeClockLib/Vi=
rtualRealTimeClockLib.c: In function 'LibGetTime':
-<command-line>: error: stray '`' in program
-../build/tmp_zynqmp-kria-starter-psa/work/zynqmp_kria_starter_psa-poky-lin=
ux/edk2-firmware/202411/edk2/EmbeddedPkg/Library/VirtualRealTimeClockLib/Vi=
rtualRealTimeClockLib.c:89:20: note: in expansion of macro 'BUILD_EPOCH'
-   89 |     EpochSeconds =3D BUILD_EPOCH;
-      |                    ^~~~~~~~~~~
-
-Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
-
-Upstream-Status: Inappropriate [OE specific build config fix, though filed=
 as https://github.com/tianocore/edk2/issues/10910]
----
- .../Library/VirtualRealTimeClockLib/VirtualRealTimeClockLib.inf | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/EmbeddedPkg/Library/VirtualRealTimeClockLib/VirtualRealTimeCl=
ockLib.inf b/EmbeddedPkg/Library/VirtualRealTimeClockLib/VirtualRealTimeClo=
ckLib.inf
-index 285e880daab8..e1c986a6532d 100644
---- a/EmbeddedPkg/Library/VirtualRealTimeClockLib/VirtualRealTimeClockLib.=
inf
-+++ b/EmbeddedPkg/Library/VirtualRealTimeClockLib/VirtualRealTimeClockLib.=
inf
-@@ -34,4 +34,4 @@
- =0D
- # Current usage of this library expects GCC in a UNIX-like shell environm=
ent with the date command=0D
- [BuildOptions]=0D
--  GCC:*_*_*_CC_FLAGS =3D -DBUILD_EPOCH=3D`printenv SOURCE_DATE_EPOCH || d=
ate +%s`=0D
-+  GCC:*_*_*_CC_FLAGS =3D -DBUILD_EPOCH=3D${SOURCE_DATE_EPOCH}=0D
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs/0002-Enforce-using-good-old=
-BFD-linker.patch b/meta-arm/recipes-bsp/uefi/sbsa-acs/0002-Enforce-using-g=
ood-old-BFD-linker.patch
index c05ef32479f3..42523d0e9a1c 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs/0002-Enforce-using-good-old-BFD-li=
nker.patch
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs/0002-Enforce-using-good-old-BFD-li=
nker.patch
@@ -1,4 +1,4 @@
-From da0d96f0dc5fceafa34a7cc7d4d05f6f89336a87 Mon Sep 17 00:00:00 2001
+From af134611c744322e1d159794c426fbdd02e151cc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 7 Apr 2021 00:16:07 -0400
 Subject: [PATCH] Enforce using good old BFD linker
@@ -25,15 +25,15 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_def.=
template
-index 0caa1c90018f..0b62fdc9ee72 100755
+index 90a389bdff07..93f7b5cde437 100755
 --- a/BaseTools/Conf/tools_def.template
 +++ b/BaseTools/Conf/tools_def.template
-@@ -928,7 +928,7 @@ DEFINE GCC_ARM_CC_XIPFLAGS         =3D -mno-unaligned-=
access
+@@ -839,7 +839,7 @@ DEFINE GCC_LOONGARCH64_CC_FLAGS    =3D DEF(GCC_ALL_CC_=
FLAGS) -mabi=3Dlp64d -fno-asyn
  DEFINE GCC_AARCH64_CC_FLAGS        =3D DEF(GCC_ALL_CC_FLAGS) -mlittle-end=
ian -fno-short-enums -fverbose-asm -funsigned-char  -ffunction-sections -fd=
ata-sections -Wno-address -fno-asynchronous-unwind-tables -fno-unwind-table=
s -fno-pic -fno-pie -ffixed-x18 -mstack-protector-guard=3Dglobal=0D
  DEFINE GCC_AARCH64_CC_XIPFLAGS     =3D -mstrict-align -mgeneral-regs-only=
=0D
  DEFINE GCC_RISCV64_CC_XIPFLAGS     =3D -mstrict-align -mgeneral-regs-only=
=0D
 -DEFINE GCC_DLINK2_FLAGS_COMMON     =3D -Wl,--script=3D$(EDK_TOOLS_PATH)/S=
cripts/GccBase.lds=0D
 +DEFINE GCC_DLINK2_FLAGS_COMMON     =3D -fuse-ld=3Dbfd -Wl,--script=3D$(ED=
K_TOOLS_PATH)/Scripts/GccBase.lds=0D
- DEFINE GCC_ARM_AARCH64_DLINK_COMMON=3D -Wl,--emit-relocs -nostdlib -Wl,--=
gc-sections -u $(IMAGE_ENTRY_POINT) -Wl,-e,$(IMAGE_ENTRY_POINT),-Map,$(DEST=
_DIR_DEBUG)/$(BASE_NAME).map=0D
  DEFINE GCC_LOONGARCH64_DLINK_COMMON=3D -Wl,--emit-relocs -nostdlib -Wl,--=
gc-sections -u $(IMAGE_ENTRY_POINT) -Wl,-e,$(IMAGE_ENTRY_POINT),-Map,$(DEST=
_DIR_DEBUG)/$(BASE_NAME).map=0D
- DEFINE GCC_ARM_DLINK_FLAGS         =3D DEF(GCC_ARM_AARCH64_DLINK_COMMON) =
-z common-page-size=3D0x20 -Wl,--pic-veneer=0D
+ DEFINE GCC_AARCH64_DLINK_FLAGS     =3D -Wl,--emit-relocs -nostdlib -Wl,--=
gc-sections -u $(IMAGE_ENTRY_POINT) -Wl,-e,$(IMAGE_ENTRY_POINT),-Map,$(DEST=
_DIR_DEBUG)/$(BASE_NAME).map -z common-page-size=3D0x20=0D
+ DEFINE GCC_LOONGARCH64_DLINK_FLAGS =3D DEF(GCC_LOONGARCH64_DLINK_COMMON) =
-z common-page-size=3D0x20=0D
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs_7.2.2.bb b/meta-arm/recipes=
-bsp/uefi/sbsa-acs_7.2.2.bb
index c037725ac66f..5952c25a438e 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs_7.2.2.bb
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs_7.2.2.bb
@@ -1,4 +1,4 @@
-require recipes-bsp/uefi/edk2-firmware_202508.bb
+require recipes-bsp/uefi/edk2-firmware_202511.bb
 PROVIDES:remove =3D "virtual/bootloader"
=20
 LICENSE +=3D "& Apache-2.0"
--=20
2.50.1 (Apple Git-155)


