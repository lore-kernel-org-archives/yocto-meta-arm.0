Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C2FC369A2
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 03:25:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.16860.1744341937140361110
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 10 Apr 2025 20:25:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6362B1F37
	for <meta-arm@lists.yoctoproject.org>; Thu, 10 Apr 2025 20:25:36 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 072A63F694
	for <meta-arm@lists.yoctoproject.org>; Thu, 10 Apr 2025 20:25:35 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm/edk2-firmware: update to 202502
Date: Thu, 10 Apr 2025 23:25:31 -0400
Message-Id: <20250411032532.10270-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250411032532.10270-1-jon.mason@arm.com>
References: <20250411032532.10270-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 11 Apr 2025 03:25:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6457

Update to the latest tagged version of edk2-firmware.  This requires
rebasing the sbsa-acs patches.  Also, sgi575 works with the latest
version but requires a patch to compile cleanly.

There is an issue with qemuarm/qemuarm64 where the boot device is not
found in edk2 if 'RELEASE' is set as the build mode.  Temporarily
changing that to DEBUG while the issue is being worked on (in
https://github.com/tianocore/edk2/issues/10942).

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/sgi575.conf         |  3 --
 .../recipes-bsp/uefi/edk2-firmware-sgi575.inc |  3 ++
 ...tform-Sgi-workaround-ArmFfaLib-error.patch | 41 +++++++++++++++++++
 ...411.bb =3D> edk2-basetools-native_202502.bb} |  0
 .../recipes-bsp/uefi/edk2-firmware_%.bbappend | 10 +++++
 .../recipes-bsp/uefi/edk2-firmware_202411.bb  | 11 -----
 .../recipes-bsp/uefi/edk2-firmware_202502.bb  |  9 ++++
 ...-in-the-paths-to-the-SBSA-test-suite.patch | 12 +++---
 ...02-Enforce-using-good-old-BFD-linker.patch | 30 +++++++++-----
 meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.4.bb   |  2 +-
 10 files changed, 89 insertions(+), 32 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/0001-Platform-Sgi-w=
orkaround-ArmFfaLib-error.patch
 rename meta-arm/recipes-bsp/uefi/{edk2-basetools-native_202411.bb =3D> edk=
2-basetools-native_202502.bb} (100%)
 delete mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202411.bb
 create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202502.bb

diff --git a/meta-arm-bsp/conf/machine/sgi575.conf b/meta-arm-bsp/conf/mach=
ine/sgi575.conf
index dea764e8cdb6..048e072664b4 100644
--- a/meta-arm-bsp/conf/machine/sgi575.conf
+++ b/meta-arm-bsp/conf/machine/sgi575.conf
@@ -13,9 +13,6 @@ KERNEL_IMAGETYPE ?=3D "Image"
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
 SERIAL_CONSOLES =3D "115200;ttyAMA0"
=20
-#FIXME - for some reason newer EDK2 refuses to boot the kernel
-PREFERRED_VERSION_edk2-firmware ?=3D "202408%"
-
 EFI_PROVIDER ?=3D "${@bb.utils.contains("DISTRO_FEATURES", "systemd", "sys=
temd-boot", "grub-efi", d)}"
 MACHINE_FEATURES +=3D "efi"
=20
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-sgi575.inc b/meta-=
arm-bsp/recipes-bsp/uefi/edk2-firmware-sgi575.inc
index e26225f87a07..042ed59a1ad8 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-sgi575.inc
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-sgi575.inc
@@ -5,3 +5,6 @@ EDK2_PLATFORM_DSC  =3D "Platform/ARM/SgiPkg/Sgi575/Sgi575.d=
sc"
 EDK2_BIN_NAME      =3D "BL33_AP_UEFI.fd"
=20
 COMPATIBLE_MACHINE =3D "sgi575"
+
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
+SRC_URI +=3D " file://0001-Platform-Sgi-workaround-ArmFfaLib-error.patch;p=
atchdir=3Dedk2-platforms"
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/0001-Platform-Sgi-workarou=
nd-ArmFfaLib-error.patch b/meta-arm-bsp/recipes-bsp/uefi/files/0001-Platfor=
m-Sgi-workaround-ArmFfaLib-error.patch
new file mode 100644
index 000000000000..980550900e21
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/uefi/files/0001-Platform-Sgi-workaround-ArmF=
faLib-error.patch
@@ -0,0 +1,41 @@
+From b368ff0e774508b60c18bc19fbfaaa3910616e66 Mon Sep 17 00:00:00 2001
+From: Jon Mason <jon.mason@arm.com>
+Date: Wed, 2 Apr 2025 15:57:21 -0400
+Subject: [PATCH] Platform/Sgi: workaround ArmFfaLib error
+
+When attempting to build sgi575, the following error is encountered
+
+| Active Platform          =3D /builder/meta-arm/build/tmp/work/sgi575-pok=
y-linux/edk2-firmware/202502/edk2/edk2-platforms/Platform/ARM/SgiPkg/Sgi575=
/Sgi575.dsc
+|
+|
+| build.py...
+| /builder/meta-arm/build/tmp/work/sgi575-poky-linux/edk2-firmware/202502/=
edk2/edk2-platforms/Platform/ARM/SgiPkg/Sgi575/Sgi575.dsc(...): error 4000:=
 Instance of library class [ArmFfaLib] is not found
+| 	in [/builder/meta-arm/build/tmp/work/sgi575-poky-linux/edk2-firmware/20=
2502/edk2/ArmPkg/Drivers/MmCommunicationDxe/MmCommunication.inf] [AARCH64]
+| 	consumed by module [/builder/meta-arm/build/tmp/work/sgi575-poky-linux/=
edk2-firmware/202502/edk2/ArmPkg/Drivers/MmCommunicationDxe/MmCommunication=
.inf]
+|
+|
+
+This is because commit 9f9a3de9e4c5595cd42d14c705570887630209d8 in
+edk2-firmware adds a reference to the ArmFfaLib in
+ArmPkg/Drivers/MmCommunicationDxe/MmCommunication.inf
+That file is referenced in Platform/ARM/SgiPkg/SgiPlatform.dsc.inc
+
+To workaround this issue, add the ArmFfaLib to Sgi575.dsc.
+
+Upstream-Status: Pending [https://github.com/tianocore/edk2-platforms/issu=
es/761]
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+---
+ Platform/ARM/SgiPkg/Sgi575/Sgi575.dsc | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/Platform/ARM/SgiPkg/Sgi575/Sgi575.dsc b/Platform/ARM/SgiPkg/S=
gi575/Sgi575.dsc
+index f29272778d73..30f2d1fd49a7 100644
+--- a/Platform/ARM/SgiPkg/Sgi575/Sgi575.dsc
++++ b/Platform/ARM/SgiPkg/Sgi575/Sgi575.dsc
+@@ -55,3 +55,6 @@
+ =0D
+ [Components.common]=0D
+   Platform/ARM/SgiPkg/AcpiTables/Sgi575AcpiTables.inf=0D
++=0D
++[LibraryClasses.common.DXE_RUNTIME_DRIVER]=0D
++  ArmFfaLib|ArmPkg/Library/ArmFfaLib/ArmFfaDxeLib.inf=0D
diff --git a/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202411.bb b/me=
ta-arm/recipes-bsp/uefi/edk2-basetools-native_202502.bb
similarity index 100%
rename from meta-arm/recipes-bsp/uefi/edk2-basetools-native_202411.bb
rename to meta-arm/recipes-bsp/uefi/edk2-basetools-native_202502.bb
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend b/meta-arm/=
recipes-bsp/uefi/edk2-firmware_%.bbappend
index e923d9f034fd..25b52511e4a0 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
@@ -7,11 +7,21 @@ COMPATIBLE_MACHINE:qemuarm64 =3D "qemuarm64"
 EDK2_PLATFORM:qemuarm64      =3D "ArmVirtQemu-AARCH64"
 EDK2_PLATFORM_DSC:qemuarm64  =3D "ArmVirtPkg/ArmVirtQemu.dsc"
 EDK2_BIN_NAME:qemuarm64      =3D "QEMU_EFI.fd"
+# No need for PXE booting in qemu, disable to reduce unnecessary noise
+EDK2_EXTRA_BUILD:qemuarm64 +=3D " -D NETWORK_PXE_BOOT_ENABLE=3DFALSE "
+# FIXME - issue with 'RELEASE' firmware, use 'DEBUG'.  This is being track=
ed in
+# https://github.com/tianocore/edk2/issues/10942
+EDK2_BUILD_RELEASE:qemuarm64 =3D "0"
=20
 COMPATIBLE_MACHINE:qemuarm =3D "qemuarm"
 EDK2_PLATFORM:qemuarm      =3D "ArmVirtQemu-ARM"
 EDK2_PLATFORM_DSC:qemuarm  =3D "ArmVirtPkg/ArmVirtQemu.dsc"
 EDK2_BIN_NAME:qemuarm      =3D "QEMU_EFI.fd"
+# No need for PXE booting in qemu, disable to reduce unnecessary noise
+EDK2_EXTRA_BUILD:qemuarm +=3D " -D NETWORK_PXE_BOOT_ENABLE=3DFALSE "
+# FIXME - issue with 'RELEASE' firmware, use 'DEBUG'.  This is being track=
ed in
+# https://github.com/tianocore/edk2/issues/10942
+EDK2_BUILD_RELEASE:qemuarm =3D "0"
=20
 do_install:append:qemuarm64() {
     install ${B}/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${EDK_COMPILER}=
/FV/${EDK2_BIN_NAME} ${D}/firmware/
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202411.bb b/meta-arm/r=
ecipes-bsp/uefi/edk2-firmware_202411.bb
deleted file mode 100644
index 22e724340ec8..000000000000
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_202411.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-SRCREV_edk2           ?=3D "0f3867fa6ef0553e26c42f7d71ff6bdb98429742"
-SRCREV_edk2-platforms ?=3D "2d66a9e048285af8ba4bfe4bdaab37a8e98288b3"
-
-# FIXME - clang is having issues with antlr
-TOOLCHAIN:aarch64 =3D "gcc"
-
-require recipes-bsp/uefi/edk2-firmware.inc
-
-SRC_URI +=3D "\
-    file://edk2_fix_epoch.patch \
-"
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202502.bb b/meta-arm/r=
ecipes-bsp/uefi/edk2-firmware_202502.bb
new file mode 100644
index 000000000000..1ea9f0751414
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_202502.bb
@@ -0,0 +1,9 @@
+require recipes-bsp/uefi/edk2-firmware.inc
+
+SRCREV_edk2           ?=3D "fbe0805b2091393406952e84724188f8c1941837"
+SRCREV_edk2-platforms ?=3D "728c8bb974be69b4034fad7a1c60917cca2dd03d"
+
+# FIXME - clang is having issues with antlr
+TOOLCHAIN:aarch64 =3D "gcc"
+
+SRC_URI +=3D " file://edk2_fix_epoch.patch"
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Patch-in-the-paths-to-=
the-SBSA-test-suite.patch b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Patch-i=
n-the-paths-to-the-SBSA-test-suite.patch
index e9f8c4173677..c9aa014cb759 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Patch-in-the-paths-to-the-SBS=
A-test-suite.patch
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Patch-in-the-paths-to-the-SBS=
A-test-suite.patch
@@ -1,6 +1,6 @@
-From e7918dbd4a02be2a474534da3f1e565931a5e632 Mon Sep 17 00:00:00 2001
+From 17df0e93949097c18c65567bdf8c7ad2478f63b4 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
-Date: Thu, 16 Feb 2023 21:53:25 +0000
+Date: Thu, 16 Feb 2023 21:53:25 -0500
 Subject: [PATCH] Patch in the paths to the SBSA test suite
=20
 Upstream-Status: Inappropriate (required action)
@@ -10,15 +10,15 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 3 insertions(+)
=20
 diff --git a/ShellPkg/ShellPkg.dsc b/ShellPkg/ShellPkg.dsc
-index 7e985f8280a7..ca7a716fadc7 100644
+index 7e985f8280a7..052510236cae 100644
 --- a/ShellPkg/ShellPkg.dsc
 +++ b/ShellPkg/ShellPkg.dsc
 @@ -23,6 +23,8 @@
  !include MdePkg/MdeLibs.dsc.inc=0D
  =0D
  [LibraryClasses.common]=0D
-+  SbsaValLib|ShellPkg/Application/sbsa-acs/val/SbsaValLib.inf
-+  SbsaPalLib|ShellPkg/Application/sbsa-acs/platform/pal_uefi/SbsaPalLib.i=
nf
++  SbsaValLib|ShellPkg/Application/sbsa-acs/val/SbsaValLib.inf=0D
++  SbsaPalLib|ShellPkg/Application/sbsa-acs/platform/pal_uefi/SbsaPalLib.i=
nf=0D
    UefiApplicationEntryPoint|MdePkg/Library/UefiApplicationEntryPoint/Uefi=
ApplicationEntryPoint.inf=0D
    UefiDriverEntryPoint|MdePkg/Library/UefiDriverEntryPoint/UefiDriverEntr=
yPoint.inf=0D
    UefiBootServicesTableLib|MdePkg/Library/UefiBootServicesTableLib/UefiBo=
otServicesTableLib.inf=0D
@@ -26,7 +26,7 @@ index 7e985f8280a7..ca7a716fadc7 100644
    # Build all the libraries when building this package.=0D
    # This helps developers test changes and how they affect the package.=0D
    #=0D
-+  ShellPkg/Application/sbsa-acs/uefi_app/SbsaAvs.inf
++  ShellPkg/Application/sbsa-acs/uefi_app/SbsaAvs.inf=0D
    ShellPkg/Library/UefiShellLib/UefiShellLib.inf=0D
    ShellPkg/Library/UefiShellAcpiViewCommandLib/UefiShellAcpiViewCommandLi=
b.inf=0D
    ShellPkg/Library/UefiShellCommandLib/UefiShellCommandLib.inf=0D
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs/0002-Enforce-using-good-old=
-BFD-linker.patch b/meta-arm/recipes-bsp/uefi/sbsa-acs/0002-Enforce-using-g=
ood-old-BFD-linker.patch
index 2d8a33f4a9da..f73194d265b8 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs/0002-Enforce-using-good-old-BFD-li=
nker.patch
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs/0002-Enforce-using-good-old-BFD-li=
nker.patch
@@ -1,13 +1,21 @@
-From a91273485735b89e67050bb39a09b60a16055dbd Mon Sep 17 00:00:00 2001
+From 76665f48f5a4672d8c8bed3c57822307193b2b72 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 7 Apr 2021 00:16:07 -0700
+Date: Wed, 7 Apr 2021 00:16:07 -0400
 Subject: [PATCH] Enforce using good old BFD linker
=20
-some distros may use gold as system linker and it crashes while linking th=
e app
+some distros may use gold as system linker and it crashes while linking
+the app
=20
-TOPDIR/build/tmpfs/work/qemuarm64-yoe-linux/sbsa-acs/3.0-r0/recipe-sysroot=
-native/usr/bin/aarch64-yoe-linux/../../libexec/aarch64-yoe-linux/gcc/aarch=
64-yoe-linux/11.0.1/ld: error: TOPDIR/build/tmpfs/work/qemuarm64-yoe-linux/=
sbsa-acs/3.0-r0/edk2/BaseTools/Scripts/GccBase.lds:54:10: INFO section type=
 is unsupported
-TOPDIR/build/tmpfs/work/qemuarm64-yoe-linux/sbsa-acs/3.0-r0/recipe-sysroot=
-native/usr/bin/aarch64-yoe-linux/../../libexec/aarch64-yoe-linux/gcc/aarch=
64-yoe-linux/11.0.1/ld: error: TOPDIR/build/tmpfs/work/qemuarm64-yoe-linux/=
sbsa-acs/3.0-r0/edk2/BaseTools/Scripts/GccBase.lds:66:14: INFO section type=
 is unsupported
-TOPDIR/build/tmpfs/work/qemuarm64-yoe-linux/sbsa-acs/3.0-r0/recipe-sysroot=
-native/usr/bin/aarch64-yoe-linux/../../libexec/aarch64-yoe-linux/gcc/aarch=
64-yoe-linux/11.0.1/ld: internal error in do_layout, at ../../gold/object.c=
c:1939
+TOPDIR/build/tmpfs/work/qemuarm64-yoe-linux/sbsa-acs/3.0-r0/recipe-sysroot=
-native/usr/bin/aarch64-yoe-linux/../../libexec/aarch64-yoe-linux/gcc/aarch=
64-yoe-linux/11.0.1/ld:
+error:
+TOPDIR/build/tmpfs/work/qemuarm64-yoe-linux/sbsa-acs/3.0-r0/edk2/BaseTools=
/Scripts/GccBase.lds:54:10:
+INFO section type is unsupported
+TOPDIR/build/tmpfs/work/qemuarm64-yoe-linux/sbsa-acs/3.0-r0/recipe-sysroot=
-native/usr/bin/aarch64-yoe-linux/../../libexec/aarch64-yoe-linux/gcc/aarch=
64-yoe-linux/11.0.1/ld:
+error:
+TOPDIR/build/tmpfs/work/qemuarm64-yoe-linux/sbsa-acs/3.0-r0/edk2/BaseTools=
/Scripts/GccBase.lds:66:14:
+INFO section type is unsupported
+TOPDIR/build/tmpfs/work/qemuarm64-yoe-linux/sbsa-acs/3.0-r0/recipe-sysroot=
-native/usr/bin/aarch64-yoe-linux/../../libexec/aarch64-yoe-linux/gcc/aarch=
64-yoe-linux/11.0.1/ld:
+internal error in do_layout, at ../../gold/object.cc:1939
 collect2: error: ld returned 1 exit status
=20
 Upstream-Status: Pending
@@ -17,15 +25,15 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_def.=
template
-index 14f3b643c43d..ce3d969625de 100755
+index ffeb22742142..ba24113d216c 100755
 --- a/BaseTools/Conf/tools_def.template
 +++ b/BaseTools/Conf/tools_def.template
-@@ -905,7 +905,7 @@ DEFINE GCC_AARCH64_CC_FLAGS        =3D DEF(GCC_ALL_CC_=
FLAGS) -mlittle-endian -fno-
+@@ -928,7 +928,7 @@ DEFINE GCC_ARM_CC_XIPFLAGS         =3D -mno-unaligned-=
access
+ DEFINE GCC_AARCH64_CC_FLAGS        =3D DEF(GCC_ALL_CC_FLAGS) -mlittle-end=
ian -fno-short-enums -fverbose-asm -funsigned-char  -ffunction-sections -fd=
ata-sections -Wno-address -fno-asynchronous-unwind-tables -fno-unwind-table=
s -fno-pic -fno-pie -ffixed-x18 -mstack-protector-guard=3Dglobal=0D
  DEFINE GCC_AARCH64_CC_XIPFLAGS     =3D -mstrict-align -mgeneral-regs-only=
=0D
  DEFINE GCC_RISCV64_CC_XIPFLAGS     =3D -mstrict-align -mgeneral-regs-only=
=0D
- DEFINE GCC_DLINK_FLAGS_COMMON      =3D -nostdlib --pie=0D
 -DEFINE GCC_DLINK2_FLAGS_COMMON     =3D -Wl,--script=3D$(EDK_TOOLS_PATH)/S=
cripts/GccBase.lds=0D
 +DEFINE GCC_DLINK2_FLAGS_COMMON     =3D -fuse-ld=3Dbfd -Wl,--script=3D$(ED=
K_TOOLS_PATH)/Scripts/GccBase.lds=0D
- DEFINE GCC_IA32_X64_DLINK_COMMON   =3D DEF(GCC_DLINK_FLAGS_COMMON) --gc-s=
ections=0D
- DEFINE GCC_ARM_AARCH64_DLINK_COMMON=3D -Wl,--emit-relocs -nostdlib -Wl,--=
gc-sections -u $(IMAGE_ENTRY_POINT) -Wl,-e,$(IMAGE_ENTRY_POINT),-Map,$(DEST=
_DIR_DEBUG)/$(BASE_NAME).map=0D
+ DEFINE GCC_IA32_X64_DLINK_COMMON   =3D -nostdlib --pie --fatal-warnings -=
z,noexecstack --gc-sections=0D
+ DEFINE GCC_ARM_AARCH64_DLINK_COMMON=3D -Wl,--emit-relocs -nostdlib -Wl,--=
gc-sections -u $(IMAGE_ENTRY_POINT) -Wl,-e,$(IMAGE_ENTRY_POINT),-Map,$(DEST=
_DIR_DEBUG)/$(BASE_NAME).map -Wl,--fatal-warnings -Wl,-z,noexecstack=0D
  DEFINE GCC_LOONGARCH64_DLINK_COMMON=3D -Wl,--emit-relocs -nostdlib -Wl,--=
gc-sections -u $(IMAGE_ENTRY_POINT) -Wl,-e,$(IMAGE_ENTRY_POINT),-Map,$(DEST=
_DIR_DEBUG)/$(BASE_NAME).map=0D
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.4.bb b/meta-arm/recipes=
-bsp/uefi/sbsa-acs_7.1.4.bb
index bb668bb48717..961a0c4344c8 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.4.bb
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.4.bb
@@ -1,4 +1,4 @@
-require recipes-bsp/uefi/edk2-firmware_202411.bb
+require recipes-bsp/uefi/edk2-firmware_202502.bb
 PROVIDES:remove =3D "virtual/bootloader"
=20
 LICENSE +=3D "& Apache-2.0"
--=20
2.39.5 (Apple Git-154)


