Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12878C678DC
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 15:16:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.921.1749654972501595914
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 Jun 2025 08:16:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D02415A1
	for <meta-arm@lists.yoctoproject.org>; Wed, 11 Jun 2025 08:15:52 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BD9AC3F59E
	for <meta-arm@lists.yoctoproject.org>; Wed, 11 Jun 2025 08:16:11 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/edk2-firmware: update to 202505
Date: Wed, 11 Jun 2025 11:16:11 -0400
Message-Id: <20250611151611.58317-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 11 Jun 2025 15:16:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6544

Update to the latest version of edk2-firmware.  The sgi issue has been
corrected upstream, so the patch can now be dropped.  Also, no longer
seeing the RELEASE issue on qemuarm/qemuarm64, and removing that
workaround.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-bsp/uefi/edk2-firmware-sgi575.inc |  3 --
 ...tform-Sgi-workaround-ArmFfaLib-error.patch | 41 -------------------
 .../recipes-bsp/uefi/edk2-firmware_%.bbappend |  6 ---
 ...ware_202502.bb =3D> edk2-firmware_202505.bb} |  4 +-
 meta-arm/recipes-bsp/uefi/sbsa-acs_7.2.2.bb   |  2 +-
 5 files changed, 3 insertions(+), 53 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/0001-Platform-Sgi-w=
orkaround-ArmFfaLib-error.patch
 rename meta-arm/recipes-bsp/uefi/{edk2-firmware_202502.bb =3D> edk2-firmwa=
re_202505.bb} (53%)

diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-sgi575.inc b/meta-=
arm-bsp/recipes-bsp/uefi/edk2-firmware-sgi575.inc
index 042ed59a1ad8..e26225f87a07 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-sgi575.inc
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-sgi575.inc
@@ -5,6 +5,3 @@ EDK2_PLATFORM_DSC  =3D "Platform/ARM/SgiPkg/Sgi575/Sgi575.d=
sc"
 EDK2_BIN_NAME      =3D "BL33_AP_UEFI.fd"
=20
 COMPATIBLE_MACHINE =3D "sgi575"
-
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
-SRC_URI +=3D " file://0001-Platform-Sgi-workaround-ArmFfaLib-error.patch;p=
atchdir=3Dedk2-platforms"
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/0001-Platform-Sgi-workarou=
nd-ArmFfaLib-error.patch b/meta-arm-bsp/recipes-bsp/uefi/files/0001-Platfor=
m-Sgi-workaround-ArmFfaLib-error.patch
deleted file mode 100644
index 980550900e21..000000000000
--- a/meta-arm-bsp/recipes-bsp/uefi/files/0001-Platform-Sgi-workaround-ArmF=
faLib-error.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From b368ff0e774508b60c18bc19fbfaaa3910616e66 Mon Sep 17 00:00:00 2001
-From: Jon Mason <jon.mason@arm.com>
-Date: Wed, 2 Apr 2025 15:57:21 -0400
-Subject: [PATCH] Platform/Sgi: workaround ArmFfaLib error
-
-When attempting to build sgi575, the following error is encountered
-
-| Active Platform          =3D /builder/meta-arm/build/tmp/work/sgi575-pok=
y-linux/edk2-firmware/202502/edk2/edk2-platforms/Platform/ARM/SgiPkg/Sgi575=
/Sgi575.dsc
-|
-|
-| build.py...
-| /builder/meta-arm/build/tmp/work/sgi575-poky-linux/edk2-firmware/202502/=
edk2/edk2-platforms/Platform/ARM/SgiPkg/Sgi575/Sgi575.dsc(...): error 4000:=
 Instance of library class [ArmFfaLib] is not found
-| 	in [/builder/meta-arm/build/tmp/work/sgi575-poky-linux/edk2-firmware/20=
2502/edk2/ArmPkg/Drivers/MmCommunicationDxe/MmCommunication.inf] [AARCH64]
-| 	consumed by module [/builder/meta-arm/build/tmp/work/sgi575-poky-linux/=
edk2-firmware/202502/edk2/ArmPkg/Drivers/MmCommunicationDxe/MmCommunication=
.inf]
-|
-|
-
-This is because commit 9f9a3de9e4c5595cd42d14c705570887630209d8 in
-edk2-firmware adds a reference to the ArmFfaLib in
-ArmPkg/Drivers/MmCommunicationDxe/MmCommunication.inf
-That file is referenced in Platform/ARM/SgiPkg/SgiPlatform.dsc.inc
-
-To workaround this issue, add the ArmFfaLib to Sgi575.dsc.
-
-Upstream-Status: Pending [https://github.com/tianocore/edk2-platforms/issu=
es/761]
-Signed-off-by: Jon Mason <jon.mason@arm.com>
----
- Platform/ARM/SgiPkg/Sgi575/Sgi575.dsc | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/Platform/ARM/SgiPkg/Sgi575/Sgi575.dsc b/Platform/ARM/SgiPkg/S=
gi575/Sgi575.dsc
-index f29272778d73..30f2d1fd49a7 100644
---- a/Platform/ARM/SgiPkg/Sgi575/Sgi575.dsc
-+++ b/Platform/ARM/SgiPkg/Sgi575/Sgi575.dsc
-@@ -55,3 +55,6 @@
- =0D
- [Components.common]=0D
-   Platform/ARM/SgiPkg/AcpiTables/Sgi575AcpiTables.inf=0D
-+=0D
-+[LibraryClasses.common.DXE_RUNTIME_DRIVER]=0D
-+  ArmFfaLib|ArmPkg/Library/ArmFfaLib/ArmFfaDxeLib.inf=0D
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend b/meta-arm/=
recipes-bsp/uefi/edk2-firmware_%.bbappend
index 56e785aeb13d..64ec53b35791 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
@@ -4,9 +4,6 @@ EDK2_PLATFORM_DSC:qemuarm64  =3D "ArmVirtPkg/ArmVirtQemu.ds=
c"
 EDK2_BIN_NAME:qemuarm64      =3D "QEMU_EFI.fd"
 # No need for PXE booting in qemu, disable to reduce unnecessary noise
 EDK2_EXTRA_BUILD:qemuarm64 +=3D " -D NETWORK_PXE_BOOT_ENABLE=3DFALSE "
-# FIXME - issue with 'RELEASE' firmware, use 'DEBUG'.  This is being track=
ed in
-# https://github.com/tianocore/edk2/issues/10942
-EDK2_BUILD_RELEASE:qemuarm64 =3D "0"
=20
 COMPATIBLE_MACHINE:qemuarm =3D "qemuarm"
 EDK2_PLATFORM:qemuarm      =3D "ArmVirtQemu-ARM"
@@ -14,9 +11,6 @@ EDK2_PLATFORM_DSC:qemuarm  =3D "ArmVirtPkg/ArmVirtQemu.ds=
c"
 EDK2_BIN_NAME:qemuarm      =3D "QEMU_EFI.fd"
 # No need for PXE booting in qemu, disable to reduce unnecessary noise
 EDK2_EXTRA_BUILD:qemuarm +=3D " -D NETWORK_PXE_BOOT_ENABLE=3DFALSE "
-# FIXME - issue with 'RELEASE' firmware, use 'DEBUG'.  This is being track=
ed in
-# https://github.com/tianocore/edk2/issues/10942
-EDK2_BUILD_RELEASE:qemuarm =3D "0"
=20
 do_install:append:qemuarm64() {
     install ${B}/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${EDK_COMPILER}=
/FV/${EDK2_BIN_NAME} ${D}/firmware/
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202502.bb b/meta-arm/r=
ecipes-bsp/uefi/edk2-firmware_202505.bb
similarity index 53%
rename from meta-arm/recipes-bsp/uefi/edk2-firmware_202502.bb
rename to meta-arm/recipes-bsp/uefi/edk2-firmware_202505.bb
index 1ea9f0751414..89e532593991 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_202502.bb
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_202505.bb
@@ -1,7 +1,7 @@
 require recipes-bsp/uefi/edk2-firmware.inc
=20
-SRCREV_edk2           ?=3D "fbe0805b2091393406952e84724188f8c1941837"
-SRCREV_edk2-platforms ?=3D "728c8bb974be69b4034fad7a1c60917cca2dd03d"
+SRCREV_edk2           ?=3D "6951dfe7d59d144a3a980bd7eda699db2d8554ac"
+SRCREV_edk2-platforms ?=3D "564f6509e89f45b25d97db2772ca9b3bec8b3ed5"
=20
 # FIXME - clang is having issues with antlr
 TOOLCHAIN:aarch64 =3D "gcc"
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs_7.2.2.bb b/meta-arm/recipes=
-bsp/uefi/sbsa-acs_7.2.2.bb
index 766e2e482ec1..2dd1de48c146 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs_7.2.2.bb
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs_7.2.2.bb
@@ -1,4 +1,4 @@
-require recipes-bsp/uefi/edk2-firmware_202502.bb
+require recipes-bsp/uefi/edk2-firmware_202505.bb
 PROVIDES:remove =3D "virtual/bootloader"
=20
 LICENSE +=3D "& Apache-2.0"
--=20
2.39.5 (Apple Git-154)


