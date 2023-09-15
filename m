Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FB83CA553F
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 00:12:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9977.1694736747307861617
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 14 Sep 2023 17:12:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B69A1FB
	for <meta-arm@lists.yoctoproject.org>; Thu, 14 Sep 2023 17:13:03 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4602A3F5A1
	for <meta-arm@lists.yoctoproject.org>; Thu, 14 Sep 2023 17:12:26 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/edk2: update to edk2-stable202308
Date: Thu, 14 Sep 2023 19:12:20 -0500
Message-Id: <20230915001220.3766492-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 15 Sep 2023 00:12:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5050

Update to the latest versions of edk2 and edk2-platforms.  This
necessitates updating the patches in sbsa-acs to apply cleanly to the
latest version of edk2.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-bsp/uefi/edk2-firmware_202305.bb          |  2 +-
 ...tive_202305.bb =3D> edk2-basetools-native_202308.bb} |  2 +-
 meta-arm/recipes-bsp/uefi/edk2-firmware_202308.bb     |  7 +++++++
 ...01-Patch-in-the-paths-to-the-SBSA-test-suite.patch | 11 +++++------
 .../0002-Enforce-using-good-old-BFD-linker.patch      |  9 ++++-----
 meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.2.bb           |  2 +-
 6 files changed, 19 insertions(+), 14 deletions(-)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-bsp/uefi/edk2-firmware_202305.=
bb (82%)
 rename meta-arm/recipes-bsp/uefi/{edk2-basetools-native_202305.bb =3D> edk=
2-basetools-native_202308.bb} (93%)
 create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202308.bb

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202305.bb b/meta-arm-b=
sp/recipes-bsp/uefi/edk2-firmware_202305.bb
similarity index 82%
rename from meta-arm/recipes-bsp/uefi/edk2-firmware_202305.bb
rename to meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202305.bb
index fe153f47..23325503 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_202305.bb
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202305.bb
@@ -4,4 +4,4 @@ SRCREV_edk2-platforms ?=3D "be2af02a3fb202756ed9855173e0d0e=
d878ab6be"
 # FIXME - clang is having issues with antlr
 TOOLCHAIN:aarch64 =3D "gcc"
=20
-require edk2-firmware.inc
+require recipes-bsp/uefi/edk2-firmware.inc
diff --git a/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202305.bb b/me=
ta-arm/recipes-bsp/uefi/edk2-basetools-native_202308.bb
similarity index 93%
rename from meta-arm/recipes-bsp/uefi/edk2-basetools-native_202305.bb
rename to meta-arm/recipes-bsp/uefi/edk2-basetools-native_202308.bb
index 3a48ea5e..31b8fb08 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202305.bb
+++ b/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202308.bb
@@ -10,7 +10,7 @@ LICENSE =3D "BSD-2-Clause-Patent"
 SRC_URI =3D "git://github.com/tianocore/edk2.git;branch=3Dmaster;protocol=
=3Dhttps"
 LIC_FILES_CHKSUM =3D "file://License.txt;md5=3D2b415520383f7964e96700ae12b=
4570a"
=20
-SRCREV =3D "ba91d0292e593df8528b66f99c1b0b14fadc8e16"
+SRCREV =3D "819cfc6b42a68790a23509e4fcc58ceb70e1965e"
=20
 S =3D "${WORKDIR}/git"
=20
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202308.bb b/meta-arm/r=
ecipes-bsp/uefi/edk2-firmware_202308.bb
new file mode 100644
index 00000000..8620a67b
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_202308.bb
@@ -0,0 +1,7 @@
+SRCREV_edk2           ?=3D "819cfc6b42a68790a23509e4fcc58ceb70e1965e"
+SRCREV_edk2-platforms ?=3D "bb6841e3fd1c60b3f8510b4fc0a380784e05d326"
+
+# FIXME - clang is having issues with antlr
+TOOLCHAIN:aarch64 =3D "gcc"
+
+require recipes-bsp/uefi/edk2-firmware.inc
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Patch-in-the-paths-to-=
the-SBSA-test-suite.patch b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Patch-i=
n-the-paths-to-the-SBSA-test-suite.patch
index 7b0b9b38..236245fe 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Patch-in-the-paths-to-the-SBS=
A-test-suite.patch
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Patch-in-the-paths-to-the-SBS=
A-test-suite.patch
@@ -1,25 +1,24 @@
-From 97eb384fcc66326f93813ff14b998bb7336a4422 Mon Sep 17 00:00:00 2001
+From 3a164d9f17591a545d1eafa629b486d4a1563722 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Thu, 16 Feb 2023 21:53:25 +0000
 Subject: [PATCH] Patch in the paths to the SBSA test suite
=20
 Upstream-Status: Inappropriate (required action)
 Signed-off-by: Ross Burton <ross.burton@arm.com>
-
 ---
  ShellPkg/ShellPkg.dsc | 3 +++
  1 file changed, 3 insertions(+)
=20
 diff --git a/ShellPkg/ShellPkg.dsc b/ShellPkg/ShellPkg.dsc
-index dd0d88603f..7367c052fc 100644
+index dd0d88603f11..91710c0795dc 100644
 --- a/ShellPkg/ShellPkg.dsc
 +++ b/ShellPkg/ShellPkg.dsc
 @@ -23,6 +23,8 @@
  !include MdePkg/MdeLibs.dsc.inc=0D
  =0D
  [LibraryClasses.common]=0D
-+  SbsaValLib|ShellPkg/Application/sbsa-acs/val/SbsaValLib.inf=0D
-+  SbsaPalLib|ShellPkg/Application/sbsa-acs/platform/pal_uefi/SbsaPalLib.i=
nf=0D
++  SbsaValLib|ShellPkg/Application/sbsa-acs/val/SbsaValLib.inf
++  SbsaPalLib|ShellPkg/Application/sbsa-acs/platform/pal_uefi/SbsaPalLib.i=
nf
    UefiApplicationEntryPoint|MdePkg/Library/UefiApplicationEntryPoint/Uefi=
ApplicationEntryPoint.inf=0D
    UefiDriverEntryPoint|MdePkg/Library/UefiDriverEntryPoint/UefiDriverEntr=
yPoint.inf=0D
    UefiBootServicesTableLib|MdePkg/Library/UefiBootServicesTableLib/UefiBo=
otServicesTableLib.inf=0D
@@ -27,7 +26,7 @@ index dd0d88603f..7367c052fc 100644
    # Build all the libraries when building this package.=0D
    # This helps developers test changes and how they affect the package.=0D
    #=0D
-+  ShellPkg/Application/sbsa-acs/uefi_app/SbsaAvs.inf=0D
++  ShellPkg/Application/sbsa-acs/uefi_app/SbsaAvs.inf
    ShellPkg/Library/UefiShellLib/UefiShellLib.inf=0D
    ShellPkg/Library/UefiShellAcpiViewCommandLib/UefiShellAcpiViewCommandLi=
b.inf=0D
    ShellPkg/Library/UefiShellCommandLib/UefiShellCommandLib.inf=0D
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs/0002-Enforce-using-good-old=
-BFD-linker.patch b/meta-arm/recipes-bsp/uefi/sbsa-acs/0002-Enforce-using-g=
ood-old-BFD-linker.patch
index 154ff0ec..284191d3 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs/0002-Enforce-using-good-old-BFD-li=
nker.patch
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs/0002-Enforce-using-good-old-BFD-li=
nker.patch
@@ -1,4 +1,4 @@
-From 8ce56a02fd722833931d356c372d374845f4c626 Mon Sep 17 00:00:00 2001
+From 6c403e3ccaae3bb3fd9d0ad220ed8ea98b2b1354 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 7 Apr 2021 00:16:07 -0700
 Subject: [PATCH] Enforce using good old BFD linker
@@ -12,18 +12,17 @@ collect2: error: ld returned 1 exit status
=20
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  BaseTools/Conf/tools_def.template | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_def.=
template
-index 503a6687c1..5cbc5c92a5 100755
+index 1bf62362b611..2b41be8d5a44 100755
 --- a/BaseTools/Conf/tools_def.template
 +++ b/BaseTools/Conf/tools_def.template
-@@ -746,7 +746,7 @@ DEFINE GCC_ARM_CC_XIPFLAGS         =3D -mno-unaligned-=
access
- DEFINE GCC_AARCH64_CC_FLAGS        =3D DEF(GCC_ALL_CC_FLAGS) -mlittle-end=
ian -fno-short-enums -fverbose-asm -funsigned-char  -ffunction-sections -fd=
ata-sections -Wno-address -fno-asynchronous-unwind-tables -fno-unwind-table=
s -fno-pic -fno-pie -ffixed-x18=0D
+@@ -747,7 +747,7 @@ DEFINE GCC_AARCH64_CC_FLAGS        =3D DEF(GCC_ALL_CC_=
FLAGS) -mlittle-endian -fno-
  DEFINE GCC_AARCH64_CC_XIPFLAGS     =3D -mstrict-align -mgeneral-regs-only=
=0D
+ DEFINE GCC_RISCV64_CC_XIPFLAGS     =3D -mstrict-align -mgeneral-regs-only=
=0D
  DEFINE GCC_DLINK_FLAGS_COMMON      =3D -nostdlib --pie=0D
 -DEFINE GCC_DLINK2_FLAGS_COMMON     =3D -Wl,--script=3D$(EDK_TOOLS_PATH)/S=
cripts/GccBase.lds=0D
 +DEFINE GCC_DLINK2_FLAGS_COMMON     =3D -fuse-ld=3Dbfd -Wl,--script=3D$(ED=
K_TOOLS_PATH)/Scripts/GccBase.lds=0D
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.2.bb b/meta-arm/recipes=
-bsp/uefi/sbsa-acs_7.1.2.bb
index b6c64685..781d6e05 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.2.bb
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.2.bb
@@ -1,4 +1,4 @@
-require recipes-bsp/uefi/edk2-firmware_202305.bb
+require recipes-bsp/uefi/edk2-firmware_202308.bb
 PROVIDES:remove =3D "virtual/bootloader"
=20
 LICENSE +=3D "& Apache-2.0"
--=20
2.30.2


