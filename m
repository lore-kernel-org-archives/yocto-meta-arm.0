Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED87C5B543
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 13:11:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.86479.1749561076917395438
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 Jun 2025 06:11:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F187E14BF
	for <meta-arm@lists.yoctoproject.org>; Tue, 10 Jun 2025 06:10:56 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 17C3E3F59E
	for <meta-arm@lists.yoctoproject.org>; Tue, 10 Jun 2025 06:11:16 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/sbsa-acs: update to 7.2.2
Date: Tue, 10 Jun 2025 09:11:15 -0400
Message-Id: <20250610131115.17543-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 10 Jun 2025 13:11:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6540

Update to the latest version of SBSA ACS.  Since 7.1.4, BSA things were
put in a separate git repo and it now has a dependency on that.

Also, address an issue with BSA, GCC15, and incompatible pointer type
errors.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...C15-incompatible-pointer-type-errors.patch | 31 +++++++++++++++++++
 ...-in-the-paths-to-the-SBSA-test-suite.patch |  8 ++---
 .../{sbsa-acs_7.1.4.bb =3D> sbsa-acs_7.2.2.bb}  | 11 +++++--
 3 files changed, 44 insertions(+), 6 deletions(-)
 create mode 100644 meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Bug-fix-for-GCC=
15-incompatible-pointer-type-errors.patch
 rename meta-arm/recipes-bsp/uefi/{sbsa-acs_7.1.4.bb =3D> sbsa-acs_7.2.2.bb=
} (67%)

diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Bug-fix-for-GCC15-inco=
mpatible-pointer-type-errors.patch b/meta-arm/recipes-bsp/uefi/sbsa-acs/000=
1-Bug-fix-for-GCC15-incompatible-pointer-type-errors.patch
new file mode 100644
index 000000000000..337bb4bc2278
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Bug-fix-for-GCC15-incompatibl=
e-pointer-type-errors.patch
@@ -0,0 +1,31 @@
+From eaec352436ee0830f2c34088931f707c0ae73d2a Mon Sep 17 00:00:00 2001
+From: Jon Mason <jon.mason@arm.com>
+Date: Sun, 8 Jun 2025 10:33:27 -0400
+Subject: [PATCH] Bug fix for GCC15 incompatible pointer type errors
+
+GCC15 is identifying isr in RegisterInterruptSource as having an
+incompatible pointer type due to the function definition not matching
+the declared one in in edk2 firmware
+EmbeddedPkg/Include/Protocol/HardwareInterrupt.h
+
+Change the local one to match this one and everyone is happy.
+
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+Upstream-Status: Pending [https://github.com/ARM-software/bsa-acs/issues/5=
04]
+---
+ pal/uefi_acpi/common/src/pal_gic.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pal/uefi_acpi/common/src/pal_gic.c b/pal/uefi_acpi/common/src=
/pal_gic.c
+index 755d2bce62ee..e52899eb613e 100644
+--- a/pal/uefi_acpi/common/src/pal_gic.c
++++ b/pal/uefi_acpi/common/src/pal_gic.c
+@@ -198,7 +198,7 @@ pal_gic_create_info_table(GIC_INFO_TABLE *GicTable)
+   @return Status of the operation
+ **/
+ UINT32
+-pal_gic_install_isr(UINT32 int_id,  VOID (*isr)())
++pal_gic_install_isr(UINT32 int_id,  VOID (*isr)(long long unsigned int,  =
EFI_SYSTEM_CONTEXT))
+ {
+=20
+   EFI_STATUS  Status;
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Patch-in-the-paths-to-=
the-SBSA-test-suite.patch b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Patch-i=
n-the-paths-to-the-SBSA-test-suite.patch
index c9aa014cb759..3073e94ae4d9 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Patch-in-the-paths-to-the-SBS=
A-test-suite.patch
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Patch-in-the-paths-to-the-SBS=
A-test-suite.patch
@@ -1,4 +1,4 @@
-From 17df0e93949097c18c65567bdf8c7ad2478f63b4 Mon Sep 17 00:00:00 2001
+From 148120a41c5ef3abe63d9e2e42c6b5c4e425aa5a Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Thu, 16 Feb 2023 21:53:25 -0500
 Subject: [PATCH] Patch in the paths to the SBSA test suite
@@ -10,15 +10,15 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 3 insertions(+)
=20
 diff --git a/ShellPkg/ShellPkg.dsc b/ShellPkg/ShellPkg.dsc
-index 7e985f8280a7..052510236cae 100644
+index 7e985f8280a7..1d23aefa120e 100644
 --- a/ShellPkg/ShellPkg.dsc
 +++ b/ShellPkg/ShellPkg.dsc
 @@ -23,6 +23,8 @@
  !include MdePkg/MdeLibs.dsc.inc=0D
  =0D
  [LibraryClasses.common]=0D
-+  SbsaValLib|ShellPkg/Application/sbsa-acs/val/SbsaValLib.inf=0D
-+  SbsaPalLib|ShellPkg/Application/sbsa-acs/platform/pal_uefi/SbsaPalLib.i=
nf=0D
++  SbsaValLib|ShellPkg/Application/bsa-acs/val/SbsaValLib.inf=0D
++  SbsaPalLib|ShellPkg/Application/bsa-acs/pal/uefi_acpi/SbsaPalLib.inf=0D
    UefiApplicationEntryPoint|MdePkg/Library/UefiApplicationEntryPoint/Uefi=
ApplicationEntryPoint.inf=0D
    UefiDriverEntryPoint|MdePkg/Library/UefiDriverEntryPoint/UefiDriverEntr=
yPoint.inf=0D
    UefiBootServicesTableLib|MdePkg/Library/UefiBootServicesTableLib/UefiBo=
otServicesTableLib.inf=0D
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.4.bb b/meta-arm/recipes=
-bsp/uefi/sbsa-acs_7.2.2.bb
similarity index 67%
rename from meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.4.bb
rename to meta-arm/recipes-bsp/uefi/sbsa-acs_7.2.2.bb
index 961a0c4344c8..766e2e482ec1 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.4.bb
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs_7.2.2.bb
@@ -6,12 +6,18 @@ LIC_FILES_CHKSUM +=3D "file://ShellPkg/Application/sbsa-a=
cs/LICENSE.md;md5=3D2a94494
=20
 SRC_URI +=3D "git://github.com/ARM-software/sbsa-acs;destsuffix=3Dedk2/She=
llPkg/Application/sbsa-acs;protocol=3Dhttps;branch=3Dmaster;name=3Dacs \
             git://github.com/tianocore/edk2-libc;destsuffix=3Dedk2/edk2-li=
bc;protocol=3Dhttps;branch=3Dmaster;name=3Dlibc \
+            git://github.com/ARM-software/bsa-acs.git;destsuffix=3Dedk2/Sh=
ellPkg/Application/bsa-acs;protocol=3Dhttps;branch=3Dmain;name=3Dbsa \
             file://0001-Patch-in-the-paths-to-the-SBSA-test-suite.patch \
             file://0002-Enforce-using-good-old-BFD-linker.patch \
+            file://0001-Bug-fix-for-GCC15-incompatible-pointer-type-errors=
.patch;patchdir=3DShellPkg/Application/bsa-acs \
             "
=20
-SRCREV_acs =3D "be169f0008d86341e1e48cb70d524bd1518c3acc"
-SRCREV_libc =3D "4667a82f0d873221f8b25ea701ce57a29270e4cb"
+# v25.03_REL7.2.2 tag
+SRCREV_acs =3D "642bc12bbc3b526f3931eca580002430c162f2a2"
+# v25.03_REL1.1.0 tag
+SRCREV_bsa =3D "db423614002621e1f0a9440955e3503623ff64f3"
+# v3.6.8.1 tag
+SRCREV_libc =3D "caea801aac338aa60f85a7c10148ca0b4440fff3"
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/ARM-software/sbsa-acs/releases"
=20
@@ -23,6 +29,7 @@ EDK2_PLATFORM =3D "Shell"
 EDK2_PLATFORM_DSC =3D "ShellPkg/ShellPkg.dsc"
 EDK2_EXTRA_BUILD =3D "--module ShellPkg/Application/sbsa-acs/uefi_app/Sbsa=
Avs.inf"
=20
+export BSA_PATH =3D "${S}/ShellPkg/Application/bsa-acs"
 PACKAGES_PATH .=3D ":${S}/edk2-libc"
=20
 do_install() {
--=20
2.39.5 (Apple Git-154)


