Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E3B7FEFB52
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 14:01:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.96281.1772200895599814154
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Feb 2026 06:01:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7DC614BF
	for <meta-arm@lists.yoctoproject.org>; Fri, 27 Feb 2026 06:01:28 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0E4833F62B
	for <meta-arm@lists.yoctoproject.org>; Fri, 27 Feb 2026 06:01:35 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/edk2-firmware: Update to 202602
Date: Fri, 27 Feb 2026 09:01:34 -0500
Message-ID: <20260227140134.69088-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Feb 2026 14:01:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6922

Update edk2, edk2-platforms, and sbsa-acs to the latest versions/SHAs.
A bleeding edge patch from upstream is needed to correct a build race in
antlr, and the latest SHA for edk2-platforms is needed to work around
some compilation issues with ENABLE_TPM in fvp-base.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...511.bb =3D> edk2-basetools-native_202602.bb} |   2 +-
 .../recipes-bsp/uefi/edk2-firmware_202511.bb  |   7 -
 .../recipes-bsp/uefi/edk2-firmware_202602.bb  |   6 +
 ...s-in-MiscChassisManufacturerFunction.patch | 148 ------------------
 ...-C-VfrCompile-Fix-parallel-make-fail.patch |  46 ++++++
 ...def-Use-LLD-to-link-ACPI-table-binar.patch |  42 -----
 meta-arm/recipes-bsp/uefi/sbsa-acs_7.2.2.bb   |   2 +-
 7 files changed, 54 insertions(+), 199 deletions(-)
 rename meta-arm/recipes-bsp/uefi/{edk2-basetools-native_202511.bb =3D> edk=
2-basetools-native_202602.bb} (93%)
 delete mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202511.bb
 create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202602.bb
 delete mode 100644 meta-arm/recipes-bsp/uefi/files/0001-ArmPkg-Fix-errors-=
in-MiscChassisManufacturerFunction.patch
 create mode 100644 meta-arm/recipes-bsp/uefi/files/0001-BaseTools-Source-C=
-VfrCompile-Fix-parallel-make-fail.patch
 delete mode 100644 meta-arm/recipes-bsp/uefi/files/0001-BaseTools-tools_de=
f-Use-LLD-to-link-ACPI-table-binar.patch

diff --git a/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202511.bb b/me=
ta-arm/recipes-bsp/uefi/edk2-basetools-native_202602.bb
similarity index 93%
rename from meta-arm/recipes-bsp/uefi/edk2-basetools-native_202511.bb
rename to meta-arm/recipes-bsp/uefi/edk2-basetools-native_202602.bb
index 7f12b31507a3..c26a34735824 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202511.bb
+++ b/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202602.bb
@@ -10,7 +10,7 @@ LICENSE =3D "BSD-2-Clause-Patent"
 SRC_URI =3D "git://github.com/tianocore/edk2.git;branch=3Dmaster;protocol=
=3Dhttps"
 LIC_FILES_CHKSUM =3D "file://License.txt;md5=3D2b415520383f7964e96700ae12b=
4570a"
=20
-SRCREV =3D "46548b1adac82211d8d11da12dd914f41e7aa775"
+SRCREV =3D "b7a715f7c03c45c6b4575bf88596bfd79658b8ce"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "^edk2-stable(?P<pver>\d+)$"
=20
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202511.bb b/meta-arm/r=
ecipes-bsp/uefi/edk2-firmware_202511.bb
deleted file mode 100644
index c9871e10d557..000000000000
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_202511.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require recipes-bsp/uefi/edk2-firmware.inc
-
-SRCREV_edk2           ?=3D "46548b1adac82211d8d11da12dd914f41e7aa775"
-SRCREV_edk2-platforms ?=3D "675f692ace4ae501c7f6f700cff364b13960e74e"
-
-SRC_URI +=3D "file://0001-BaseTools-tools_def-Use-LLD-to-link-ACPI-table-b=
inar.patch \
-            file://0001-ArmPkg-Fix-errors-in-MiscChassisManufacturerFuncti=
on.patch"
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202602.bb b/meta-arm/r=
ecipes-bsp/uefi/edk2-firmware_202602.bb
new file mode 100644
index 000000000000..de739f37b12b
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_202602.bb
@@ -0,0 +1,6 @@
+require recipes-bsp/uefi/edk2-firmware.inc
+
+SRCREV_edk2           ?=3D "b7a715f7c03c45c6b4575bf88596bfd79658b8ce"
+SRCREV_edk2-platforms ?=3D "75024f5aa54cf4d975d024768604b28c754db338"
+
+SRC_URI +=3D "file://0001-BaseTools-Source-C-VfrCompile-Fix-parallel-make-=
fail.patch"
diff --git a/meta-arm/recipes-bsp/uefi/files/0001-ArmPkg-Fix-errors-in-Misc=
ChassisManufacturerFunction.patch b/meta-arm/recipes-bsp/uefi/files/0001-Ar=
mPkg-Fix-errors-in-MiscChassisManufacturerFunction.patch
deleted file mode 100644
index 06298e43a474..000000000000
--- a/meta-arm/recipes-bsp/uefi/files/0001-ArmPkg-Fix-errors-in-MiscChassis=
ManufacturerFunction.patch
+++ /dev/null
@@ -1,148 +0,0 @@
-From 33e4e73a17bff0823bc916998169b926115b0c6b Mon Sep 17 00:00:00 2001
-From: Mike Beaton <mjsbeaton@gmail.com>
-Date: Mon, 24 Nov 2025 20:40:28 +0000
-Subject: [PATCH] ArmPkg: Fix errors in MiscChassisManufacturerFunction
-
-Initial error found while attempting to implement Azure Pipelines
-CLANGDWARF CI:
-
-ERROR - Compiler #error from /__w/1/s/ArmPkg/Universal/Smbios/SmbiosMiscDx
-e/Type03/MiscChassisManufacturerFunction.c variable 'ContainedElements' is
-uninitialized when passed as a const pointer argument here [-Werror,-Wunin
-itialized-const-pointer]
-
-The code in question should copy the optional ContainedElements from
-InputData, so fix it so that it does.
-
-Additionally:
-
- - Various size calculations in the original code are incorrect, since
-   the base size for calculations should not include ContainedElements,
-   so fix these.
- - Since we are calculating Hdr.Length separately as part of the above,
-   add code to ASSERT and return EFI_OUT_OF_RESOURCES if it would
-   overflow the UINT8 location where it will be stored.
- - Since we are adding a new early exit, fix the fact that no error log
-   message is generated on early exit.
-
-Fixes: bfc0fae459543442f3f17e0de655a72aba5b0920
-
-Signed-off-by: Mike Beaton <mjsbeaton@gmail.com>
-
-Upstream-Status: Backport [33e4e73a17bff0823bc916998169b926115b0c6b]
-Signed-off-by: Jon Mason <jon.mason@arm.com>
----
- .../Type03/MiscChassisManufacturerFunction.c  | 54 ++++++++++---------
- 1 file changed, 29 insertions(+), 25 deletions(-)
-
-diff --git a/ArmPkg/Universal/Smbios/SmbiosMiscDxe/Type03/MiscChassisManuf=
acturerFunction.c b/ArmPkg/Universal/Smbios/SmbiosMiscDxe/Type03/MiscChassi=
sManufacturerFunction.c
-index 6b3b63b0e8d5..363f3bfe30d6 100644
---- a/ArmPkg/Universal/Smbios/SmbiosMiscDxe/Type03/MiscChassisManufacturer=
Function.c
-+++ b/ArmPkg/Universal/Smbios/SmbiosMiscDxe/Type03/MiscChassisManufacturer=
Function.c
-@@ -45,6 +45,9 @@ SMBIOS_MISC_TABLE_FUNCTION (MiscChassisManufacturer) {
-   UINTN               AssertTagStrLen;=0D
-   UINTN               SerialNumStrLen;=0D
-   UINTN               ChaNumStrLen;=0D
-+  UINTN               BaseSize;=0D
-+  UINTN               ExtendLength;=0D
-+  UINTN               HdrLength;=0D
-   EFI_STRING          Manufacturer;=0D
-   EFI_STRING          Version;=0D
-   EFI_STRING          SerialNumber;=0D
-@@ -55,12 +58,6 @@ SMBIOS_MISC_TABLE_FUNCTION (MiscChassisManufacturer) {
-   SMBIOS_TABLE_TYPE3  *InputData;=0D
-   EFI_STATUS          Status;=0D
- =0D
--  UINT8              ContainedElementCount;=0D
--  CONTAINED_ELEMENT  ContainedElements;=0D
--  UINT8              ExtendLength;=0D
--=0D
--  ExtendLength =3D 0;=0D
--=0D
-   //=0D
-   // First check for invalid parameters.=0D
-   //=0D
-@@ -116,14 +113,25 @@ SMBIOS_MISC_TABLE_FUNCTION (MiscChassisManufacturer)=
 {
-   ChassisSkuNumber =3D HiiGetPackageString (&gEfiCallerIdGuid, TokenToGet=
, NULL);=0D
-   ChaNumStrLen     =3D StrLen (ChassisSkuNumber);=0D
- =0D
--  ContainedElementCount =3D InputData->ContainedElementCount;=0D
--  ExtendLength          =3D ContainedElementCount * sizeof (CONTAINED_ELE=
MENT);=0D
-+  STATIC_ASSERT (OFFSET_OF (SMBIOS_TABLE_TYPE3, ContainedElements) =3D=3D=
 0x15, "Base size of SMBIOS_TABLE_TYPE3 does not meet SMBIOS specification"=
);=0D
-+=0D
-+  BaseSize     =3D OFFSET_OF (SMBIOS_TABLE_TYPE3, ContainedElements);=0D
-+  ExtendLength =3D (UINTN)InputData->ContainedElementCount * (UINTN)Input=
Data->ContainedElementRecordLength;=0D
-+=0D
-+  //=0D
-+  // Length of SMBIOS struct includes ContainedElements and SKUNumber.=0D
-+  //=0D
-+  HdrLength =3D BaseSize + ExtendLength + sizeof (SMBIOS_TABLE_STRING);=0D
-+  if (HdrLength > MAX_UINT8) {=0D
-+    ASSERT (HdrLength <=3D MAX_UINT8);=0D
-+    Status =3D EFI_OUT_OF_RESOURCES;=0D
-+    goto Exit;=0D
-+  }=0D
- =0D
-   //=0D
--  // Two zeros following the last string.=0D
-+  // Additional zero follows the last string.=0D
-   //=0D
--  RecordLength =3D sizeof (SMBIOS_TABLE_TYPE3) +=0D
--                 ExtendLength    + 1 +=0D
-+  RecordLength =3D HdrLength       +=0D
-                  ManuStrLen      + 1 +=0D
-                  VerStrLen       + 1 +=0D
-                  SerialNumStrLen + 1 +=0D
-@@ -135,25 +143,20 @@ SMBIOS_MISC_TABLE_FUNCTION (MiscChassisManufacturer)=
 {
-     goto Exit;=0D
-   }=0D
- =0D
--  (VOID)CopyMem (SmbiosRecord, InputData, sizeof (SMBIOS_TABLE_TYPE3));=0D
-+  // Copy base record plus ContainedElements.=0D
-+  (VOID)CopyMem (SmbiosRecord, InputData, BaseSize + ExtendLength);=0D
- =0D
--  SmbiosRecord->Hdr.Length =3D sizeof (SMBIOS_TABLE_TYPE3) + ExtendLength=
 + 1;=0D
-+  SmbiosRecord->Hdr.Length =3D HdrLength;=0D
- =0D
-   SmbiosRecord->Type =3D OemGetChassisType ();=0D
- =0D
--  // ContainedElements=0D
--  ASSERT (ContainedElementCount < 2);=0D
--  (VOID)CopyMem (SmbiosRecord + 1, &ContainedElements, ExtendLength);=0D
--=0D
-   // ChassisSkuNumber=0D
--  SkuNumberField =3D (UINT8 *)SmbiosRecord +=0D
--                   sizeof (SMBIOS_TABLE_TYPE3) -=0D
--                   sizeof (CONTAINED_ELEMENT) + ExtendLength;=0D
-+  SkuNumberField =3D (UINT8 *)SmbiosRecord + BaseSize + ExtendLength;=0D
- =0D
-+  // The string numbers in the fixed position portion of the record are p=
opulated in the input data.=0D
-   *SkuNumberField =3D 5;=0D
- =0D
--  OptionalStrStart =3D (CHAR8 *)((UINT8 *)SmbiosRecord + sizeof (SMBIOS_T=
ABLE_TYPE3) +=0D
--                               ExtendLength + 1);=0D
-+  OptionalStrStart =3D (CHAR8 *)((UINT8 *)SmbiosRecord + HdrLength);=0D
-   UnicodeStrToAsciiStrS (Manufacturer, OptionalStrStart, ManuStrLen + 1);=
=0D
-   StrStart =3D OptionalStrStart + ManuStrLen + 1;=0D
-   UnicodeStrToAsciiStrS (Version, StrStart, VerStrLen + 1);=0D
-@@ -175,6 +178,10 @@ SMBIOS_MISC_TABLE_FUNCTION (MiscChassisManufacturer) {
-   // Now we have got the full smbios record, call smbios protocol to add =
this record.=0D
-   //=0D
-   Status =3D SmbiosMiscAddRecord ((UINT8 *)SmbiosRecord, NULL);=0D
-+=0D
-+  FreePool (SmbiosRecord);=0D
-+=0D
-+Exit:=0D
-   if (EFI_ERROR (Status)) {=0D
-     DEBUG ((=0D
-       DEBUG_ERROR,=0D
-@@ -185,9 +192,6 @@ SMBIOS_MISC_TABLE_FUNCTION (MiscChassisManufacturer) {
-       ));=0D
-   }=0D
- =0D
--  FreePool (SmbiosRecord);=0D
--=0D
--Exit:=0D
-   if (Manufacturer !=3D NULL) {=0D
-     FreePool (Manufacturer);=0D
-   }=0D
diff --git a/meta-arm/recipes-bsp/uefi/files/0001-BaseTools-Source-C-VfrCom=
pile-Fix-parallel-make-fail.patch b/meta-arm/recipes-bsp/uefi/files/0001-Ba=
seTools-Source-C-VfrCompile-Fix-parallel-make-fail.patch
new file mode 100644
index 000000000000..7e7353fbb73c
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/files/0001-BaseTools-Source-C-VfrCompile-Fi=
x-parallel-make-fail.patch
@@ -0,0 +1,46 @@
+From 5f8c99d9a7fe88301b01a7015375a827eecc7985 Mon Sep 17 00:00:00 2001
+From: Michael D Kinney <michael.d.kinney@intel.com>
+Date: Thu, 26 Feb 2026 11:48:11 -0500
+Subject: [PATCH] BaseTools/Source/C/VfrCompile: Fix parallel make failures
+
+Update makefile rules to run antlr and dlg to completion
+before compiling any of the generated cpp files.
+
+Without this change, parallel make may start compiling some
+of the cpp files before both antlr and dlg have finished
+which produces syntax errors from compilation with partially
+generated files.
+
+Also use &: so the targets are treated as a group and the
+rule is only executed once for the entire group. Without
+this change, parallel make may run the rule actions more
+than once and modify the output while it is being used by
+another rule.
+
+Signed-off-by: Michael D Kinney <michael.d.kinney@intel.com>
+
+Upstream-Status: Backport [2f75effb93999adadeead511dd76f86833649b45]
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+---
+ BaseTools/Source/C/VfrCompile/GNUmakefile | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/BaseTools/Source/C/VfrCompile/GNUmakefile b/BaseTools/Source/=
C/VfrCompile/GNUmakefile
+index b469bd3f303f..4f10b1d9338b 100644
+--- a/BaseTools/Source/C/VfrCompile/GNUmakefile
++++ b/BaseTools/Source/C/VfrCompile/GNUmakefile
+@@ -54,10 +54,11 @@ VfrCompiler.o: ../Include/Common/BuildVersion.h
+ =0D
+ include $(MAKEROOT)/Makefiles/footer.makefile=0D
+ =0D
+-VfrSyntax.cpp EfiVfrParser.cpp EfiVfrParser.h VfrParser.dlg VfrTokens.h: =
Pccts/antlr/antlr VfrSyntax.g=0D
+-	Pccts/antlr/antlr -CC -e3 -ck 3 -k 2 -fl VfrParser.dlg -ft VfrTokens.h -=
o . VfrSyntax.g=0D
++ANTLR_GEN =3D VfrSyntax.cpp EfiVfrParser.cpp EfiVfrParser.h VfrParser.dlg=
 VfrTokens.h=0D
++DLG_GEN =3D VfrLexer.cpp VfrLexer.h=0D
+ =0D
+-VfrLexer.cpp VfrLexer.h: Pccts/dlg/dlg VfrParser.dlg=0D
++$(ANTLR_GEN) $(DLG_GEN) &: Pccts/antlr/antlr Pccts/dlg/dlg VfrSyntax.g=0D
++	Pccts/antlr/antlr -CC -e3 -ck 3 -k 2 -fl VfrParser.dlg -ft VfrTokens.h -=
o . VfrSyntax.g=0D
+ 	Pccts/dlg/dlg -C2 -i -CC -cl VfrLexer -o . VfrParser.dlg=0D
+ =0D
+ Pccts/antlr/antlr:=0D
diff --git a/meta-arm/recipes-bsp/uefi/files/0001-BaseTools-tools_def-Use-L=
LD-to-link-ACPI-table-binar.patch b/meta-arm/recipes-bsp/uefi/files/0001-Ba=
seTools-tools_def-Use-LLD-to-link-ACPI-table-binar.patch
deleted file mode 100644
index 4504800da232..000000000000
--- a/meta-arm/recipes-bsp/uefi/files/0001-BaseTools-tools_def-Use-LLD-to-l=
ink-ACPI-table-binar.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 5d38a20196b9b9d15552ba3617ec7f63f6401a5c Mon Sep 17 00:00:00 2001
-From: Ard Biesheuvel <ardb@kernel.org>
-Date: Tue, 25 Nov 2025 14:29:20 +0100
-Subject: [PATCH] BaseTools/tools_def: Use LLD to link ACPI table binaries
-
-Currently, the CLANGDWARF toolchain on AARCH64 fails to pass the
--fuse-ld=3Dlld compiler option, and so linking ACPI table binaries falls
-back to the BFD linker. On non-AARCH64 build systems, this will
-correctly run the cross-linker, based on the -target argument passed to
-Clang, which therefore needs to be installed.
-
-However, the ASLCC invocation fails to pass that same -target argument,
-therefore producing object files for the native architecture, which the
-cross-linker cannot link, resulting in a build error.
-
-So pass the target in ASLCC_FLAGS as well, which is sufficient to get a
-working build. And for good measure, pass -fuse-ld=3Dlld so that we don't
-rely on the BFD cross-linker in the first place.
-
-Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
-
-Upstream-Status: Backport [5d38a20196b9b9d15552ba3617ec7f63f6401a5c]
-Signed-off-by: Jon Mason <jon.mason@arm.com>
----
- BaseTools/Conf/tools_def.template | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_def.=
template
-index 32085ad00af7..d19624fa4628 100755
---- a/BaseTools/Conf/tools_def.template
-+++ b/BaseTools/Conf/tools_def.template
-@@ -1872,8 +1872,8 @@ DEFINE CLANGDWARF_AARCH64_DLINK_FLAGS  =3D DEF(CLANG=
DWARF_AARCH64_TARGET) DEF(GCC_
- *_CLANGDWARF_AARCH64_SLINK_PATH     =3D ENV(CLANGDWARF_BIN)llvm-ar=0D
- *_CLANGDWARF_AARCH64_RC_PATH        =3D ENV(CLANGDWARF_BIN)llvm-objcopy=0D
- =0D
--*_CLANGDWARF_AARCH64_ASLCC_FLAGS    =3D DEF(GCC_ASLCC_FLAGS) -fno-lto=0D
--*_CLANGDWARF_AARCH64_ASLDLINK_FLAGS =3D DEF(CLANGDWARF_AARCH64_TARGET) DE=
F(GCC_AARCH64_ASLDLINK_FLAGS) DEF(CLANGDWARF_DLINK_WARNING_FLAGS)=0D
-+*_CLANGDWARF_AARCH64_ASLCC_FLAGS    =3D DEF(GCC_ASLCC_FLAGS) DEF(CLANGDWA=
RF_AARCH64_TARGET) -fno-lto=0D
-+*_CLANGDWARF_AARCH64_ASLDLINK_FLAGS =3D DEF(CLANGDWARF_AARCH64_TARGET) DE=
F(GCC_AARCH64_ASLDLINK_FLAGS) DEF(CLANGDWARF_DLINK_WARNING_FLAGS) -fuse-ld=
=3Dlld=0D
- *_CLANGDWARF_AARCH64_ASM_FLAGS      =3D DEF(GCC_ASM_FLAGS) DEF(CLANGDWARF=
_AARCH64_TARGET) $(PLATFORM_FLAGS) -Qunused-arguments=0D
- *_CLANGDWARF_AARCH64_DLINK_FLAGS    =3D DEF(CLANGDWARF_AARCH64_TARGET) DE=
F(GCC_AARCH64_DLINK_FLAGS) -z common-page-size=3D0x1000 DEF(CLANGDWARF_DLIN=
K_WARNING_FLAGS)=0D
- *_CLANGDWARF_AARCH64_DLINK_XIPFLAGS =3D -z common-page-size=3D0x20=0D
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs_7.2.2.bb b/meta-arm/recipes=
-bsp/uefi/sbsa-acs_7.2.2.bb
index 5952c25a438e..bc8187ebeb10 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs_7.2.2.bb
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs_7.2.2.bb
@@ -1,4 +1,4 @@
-require recipes-bsp/uefi/edk2-firmware_202511.bb
+require recipes-bsp/uefi/edk2-firmware_202602.bb
 PROVIDES:remove =3D "virtual/bootloader"
=20
 LICENSE +=3D "& Apache-2.0"
--=20
2.50.1 (Apple Git-155)


