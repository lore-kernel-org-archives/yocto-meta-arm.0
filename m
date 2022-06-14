Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9204DC433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 20:30:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.1887.1655238617099801840
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jun 2022 13:30:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 916421764;
	Tue, 14 Jun 2022 13:30:16 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7F933F73B;
	Tue, 14 Jun 2022 13:30:15 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm/edk2-firmware: upgrade to 2022.05
Date: Tue, 14 Jun 2022 21:30:13 +0100
Message-Id: <20220614203013.1779871-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Jun 2022 20:30:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3502

Add a patch to fix uninitialized varibles, detected by Clang when
building for Juno. However, whilst it now compiles it can't generate
firmware images correctly, so it has to remain forcing GCC.

Remove the workaround to force debug builds when using Clang, as this is
now fixed.

Drop upstreamed patches from sbsa-acs.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/uefi/edk2-firmware-juno.inc   |  5 +-
 meta-arm/recipes-bsp/uefi/edk2-firmware.inc   |  5 +-
 .../recipes-bsp/uefi/edk2-firmware_202202.bb  |  4 --
 .../recipes-bsp/uefi/edk2-firmware_202205.bb  |  4 ++
 meta-arm/recipes-bsp/uefi/files/default.patch | 23 +++++++++
 .../0001-BaseTools-fix-gcc12-warning-1.patch  | 51 -------------------
 .../0001-BaseTools-fix-gcc12-warning.patch    | 49 ------------------
 meta-arm/recipes-bsp/uefi/sbsa-acs_3.1.bb     |  4 +-
 8 files changed, 31 insertions(+), 114 deletions(-)
 delete mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202202.bb
 create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202205.bb
 create mode 100644 meta-arm/recipes-bsp/uefi/files/default.patch
 delete mode 100644 meta-arm/recipes-bsp/uefi/sbsa-acs/0001-BaseTools-fix-g=
cc12-warning-1.patch
 delete mode 100644 meta-arm/recipes-bsp/uefi/sbsa-acs/0001-BaseTools-fix-g=
cc12-warning.patch

diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-juno.inc b/meta-ar=
m-bsp/recipes-bsp/uefi/edk2-firmware-juno.inc
index 076c551a..aac0d1cb 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-juno.inc
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-juno.inc
@@ -4,7 +4,6 @@ EDK2_BIN_NAME      =3D "BL33_AP_UEFI.fd"
=20
 COMPATIBLE_MACHINE =3D "juno"
=20
-# As of 2022-01-10 the Juno build fails with Clang:
-# edk2-firmware/202111-r0/edk2/edk2-platforms/Platform/ARM/Library/ArmShel=
lCmdRunAxf/RunAxf.c:216:11:
-# error: variable 'FileSize' is used uninitialized whenever 'if' condition=
 is false [-Werror,-Wsometimes-uninitialized]
+# As of 2022-06-14 with 2022.05, clang builds fail:
+# "The required fv image size 0x104048 exceeds the set fv image size 0xf90=
00"
 TOOLCHAIN =3D "gcc"
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recipes=
-bsp/uefi/edk2-firmware.inc
index 540eb00c..63c422f6 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
@@ -18,6 +18,7 @@ SRC_URI =3D "\
     ${EDK2_SRC_URI};name=3Dedk2;destsuffix=3Dedk2;nobranch=3D1 \
     ${EDK2_PLATFORMS_SRC_URI};name=3Dedk2-platforms;destsuffix=3Dedk2/edk2=
-platforms;nobranch=3D1 \
     file://unaligned.patch \
+    file://default.patch \
 "
=20
 SRCREV_FORMAT         =3D "edk2_edk2-platforms"
@@ -27,10 +28,6 @@ COMPATIBLE_MACHINE ?=3D "invalid"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 EDK2_BUILD_RELEASE =3D "1"
-# Release builds don't work with clang yet:
-# https://bugzilla.tianocore.org/show_bug.cgi?id=3D3758.
-# Can be removed in 202202 (c9b7c6e)
-EDK2_BUILD_RELEASE:toolchain-clang =3D "0"
=20
 EDK2_PLATFORM      =3D "unset"
 # build --platform
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202202.bb b/meta-arm/r=
ecipes-bsp/uefi/edk2-firmware_202202.bb
deleted file mode 100644
index 441805e3..00000000
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_202202.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-SRCREV_edk2           ?=3D "b24306f15daa2ff8510b06702114724b33895d3c"
-SRCREV_edk2-platforms ?=3D "c9e377b00fc086fcb5a5b41663a0149bde9bcc2e"
-
-require edk2-firmware.inc
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202205.bb b/meta-arm/r=
ecipes-bsp/uefi/edk2-firmware_202205.bb
new file mode 100644
index 00000000..e2606653
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_202205.bb
@@ -0,0 +1,4 @@
+SRCREV_edk2           ?=3D "16779ede2d366bfc6b702e817356ccf43425bcc8"
+SRCREV_edk2-platforms ?=3D "3b896d1a325686de3942723c42f286090453e37a"
+
+require edk2-firmware.inc
diff --git a/meta-arm/recipes-bsp/uefi/files/default.patch b/meta-arm/recip=
es-bsp/uefi/files/default.patch
new file mode 100644
index 00000000..7c2ffc2b
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/files/default.patch
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
+--- a/edk2-platforms/Platform/ARM/Library/ArmShellCmdRunAxf/RunAxf.c
++++ b/edk2-platforms/Platform/ARM/Library/ArmShellCmdRunAxf/RunAxf.c
+@@ -136,1 +136,1 @@ ShellDynCmdRunAxfHandler (
+-  UINTN                       FileSize;=0D
++  UINTN                       FileSize =3D 0;=0D
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-BaseTools-fix-gcc12-wa=
rning-1.patch b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-BaseTools-fix-gcc12=
-warning-1.patch
deleted file mode 100644
index ba41cb23..00000000
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-BaseTools-fix-gcc12-warning-1=
.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 85021f8cf22d1bd4114803c6c610dea5ef0059f1 Mon Sep 17 00:00:00 2001
-From: Gerd Hoffmann <kraxel@redhat.com>
-Date: Thu, 24 Mar 2022 20:04:35 +0800
-Subject: [PATCH] BaseTools: fix gcc12 warning
-
-Sdk/C/LzmaEnc.c: In function ?LzmaEnc_CodeOneMemBlock?:
-Sdk/C/LzmaEnc.c:2828:19: error: storing the address of local variable ?out=
Stream? in ?*p.rc.outStream? [-Werror=3Ddangling-pointer=3D]
- 2828 |   p->rc.outStream =3D &outStream.vt;
-      |   ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
-Sdk/C/LzmaEnc.c:2811:28: note: ?outStream? declared here
- 2811 |   CLzmaEnc_SeqOutStreamBuf outStream;
-      |                            ^~~~~~~~~
-Sdk/C/LzmaEnc.c:2811:28: note: ?pp? declared here
-Sdk/C/LzmaEnc.c:2828:19: error: storing the address of local variable ?out=
Stream? in ?*(CLzmaEnc *)pp.rc.outStream? [-Werror=3Ddangling-pointer=3D]
- 2828 |   p->rc.outStream =3D &outStream.vt;
-      |   ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
-Sdk/C/LzmaEnc.c:2811:28: note: ?outStream? declared here
- 2811 |   CLzmaEnc_SeqOutStreamBuf outStream;
-      |                            ^~~~~~~~~
-Sdk/C/LzmaEnc.c:2811:28: note: ?pp? declared here
-cc1: all warnings being treated as errors
-
-Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/85021f=
8cf22d1bd4114803c6c610dea5ef0059f1]
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
-Reviewed-by: Bob Feng <bob.c.feng@intel.com>
----
- BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c b/BaseTools/S=
ource/C/LzmaCompress/Sdk/C/LzmaEnc.c
-index 4e9b499f8d..4b9f5fa692 100644
---- a/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
-+++ b/BaseTools/Source/C/LzmaCompress/Sdk/C/LzmaEnc.c
-@@ -2825,12 +2825,13 @@ SRes LzmaEnc_CodeOneMemBlock(CLzmaEncHandle pp, Bo=
olInt reInit,
- =0D
-   nowPos64 =3D p->nowPos64;=0D
-   RangeEnc_Init(&p->rc);=0D
--  p->rc.outStream =3D &outStream.vt;=0D
- =0D
-   if (desiredPackSize =3D=3D 0)=0D
-     return SZ_ERROR_OUTPUT_EOF;=0D
- =0D
-+  p->rc.outStream =3D &outStream.vt;=0D
-   res =3D LzmaEnc_CodeOneBlock(p, desiredPackSize, *unpackSize);=0D
-+  p->rc.outStream =3D NULL;=0D
- =0D
-   *unpackSize =3D (UInt32)(p->nowPos64 - nowPos64);=0D
-   *destLen -=3D outStream.rem;=0D
---=20
-2.30.2
-
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-BaseTools-fix-gcc12-wa=
rning.patch b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-BaseTools-fix-gcc12-w=
arning.patch
deleted file mode 100644
index 6c2dc3bc..00000000
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-BaseTools-fix-gcc12-warning.p=
atch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 7b005f344e533cd913c3ca05b266f9872df886d1 Mon Sep 17 00:00:00 2001
-From: Gerd Hoffmann <kraxel@redhat.com>
-Date: Thu, 24 Mar 2022 20:04:34 +0800
-Subject: [PATCH] BaseTools: fix gcc12 warning
-
-GenFfs.c:545:5: error: pointer ?InFileHandle? used after ?fclose? [-Werror=
=3Duse-after-free]
-  545 |     Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  =
of %s", InFileHandle);
-      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
-GenFfs.c:544:5: note: call to ?fclose? here
-  544 |     fclose (InFileHandle);
-      |     ^~~~~~~~~~~~~~~~~~~~~
-
-Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/7b005f=
344e533cd913c3ca05b266f9872df886d1]
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
-Reviewed-by: Bob Feng <bob.c.feng@intel.com>
----
- BaseTools/Source/C/GenFfs/GenFfs.c | 2 +-
- BaseTools/Source/C/GenSec/GenSec.c | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/BaseTools/Source/C/GenFfs/GenFfs.c b/BaseTools/Source/C/GenFf=
s/GenFfs.c
-index 949025c333..d78d62ab36 100644
---- a/BaseTools/Source/C/GenFfs/GenFfs.c
-+++ b/BaseTools/Source/C/GenFfs/GenFfs.c
-@@ -542,7 +542,7 @@ GetAlignmentFromFile(char *InFile, UINT32 *Alignment)
-   PeFileBuffer =3D (UINT8 *) malloc (PeFileSize);=0D
-   if (PeFileBuffer =3D=3D NULL) {=0D
-     fclose (InFileHandle);=0D
--    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  of %s",=
 InFileHandle);=0D
-+    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated for %s",=
 InFile);=0D
-     return EFI_OUT_OF_RESOURCES;=0D
-   }=0D
-   fread (PeFileBuffer, sizeof (UINT8), PeFileSize, InFileHandle);=0D
-diff --git a/BaseTools/Source/C/GenSec/GenSec.c b/BaseTools/Source/C/GenSe=
c/GenSec.c
-index d54a4f9e0a..b1d05367ec 100644
---- a/BaseTools/Source/C/GenSec/GenSec.c
-+++ b/BaseTools/Source/C/GenSec/GenSec.c
-@@ -1062,7 +1062,7 @@ GetAlignmentFromFile(char *InFile, UINT32 *Alignment)
-   PeFileBuffer =3D (UINT8 *) malloc (PeFileSize);=0D
-   if (PeFileBuffer =3D=3D NULL) {=0D
-     fclose (InFileHandle);=0D
--    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated  of %s",=
 InFileHandle);=0D
-+    Error(NULL, 0, 4001, "Resource", "memory cannot be allocated for %s",=
 InFile);=0D
-     return EFI_OUT_OF_RESOURCES;=0D
-   }=0D
-   fread (PeFileBuffer, sizeof (UINT8), PeFileSize, InFileHandle);=0D
---=20
-2.30.2
-
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs_3.1.bb b/meta-arm/recipes-b=
sp/uefi/sbsa-acs_3.1.bb
index a1e896b5..217760c0 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs_3.1.bb
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs_3.1.bb
@@ -1,4 +1,4 @@
-require recipes-bsp/uefi/edk2-firmware_202202.bb
+require recipes-bsp/uefi/edk2-firmware_202205.bb
 PROVIDES:remove =3D "virtual/bootloader"
=20
 LICENSE +=3D "& Apache-2.0"
@@ -8,8 +8,6 @@ SRC_URI +=3D "git://github.com/ARM-software/sbsa-acs;destsu=
ffix=3Dedk2/ShellPkg/Appl
             git://github.com/tianocore/edk2-libc;destsuffix=3Dedk2/edk2-li=
bc;protocol=3Dhttps;branch=3Dmaster;name=3Dlibc \
             file://shell.patch \
             file://use_bfd_linker.patch \
-            file://0001-BaseTools-fix-gcc12-warning.patch \
-            file://0001-BaseTools-fix-gcc12-warning-1.patch \
             "
=20
 SRCREV_acs =3D "ec02a7736ae5714326507c60595f4d5299e3dec8"
--=20
2.25.1


