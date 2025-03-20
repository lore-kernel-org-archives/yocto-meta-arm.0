Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7B38C35FFF
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 15:14:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10421.1742483641962987616
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Mar 2025 08:14:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18A94106F
	for <meta-arm@lists.yoctoproject.org>; Thu, 20 Mar 2025 08:14:09 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 324B13F673
	for <meta-arm@lists.yoctoproject.org>; Thu, 20 Mar 2025 08:14:01 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm/edk2-firmware: update to edk2-stable202411
Date: Thu, 20 Mar 2025 11:13:58 -0400
Message-Id: <20250320151400.19610-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 20 Mar 2025 15:14:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6407

Update to the latest version of edk2.  Unfortunately, sbsa-ref has a
kernel warning due to the CPU topology that was added.  So, hold this
platform back to 202408 and move those recipes to meta-arm-bsp.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/sbsa-ref.conf       |  4 +++
 .../uefi/edk2-basetools-native_202408.bb      |  0
 .../recipes-bsp/uefi/edk2-firmware_202408.bb  |  2 ++
 .../0001-Platform-StMmRpmb-Fix-build.patch    |  0
 .../uefi/edk2-basetools-native_202411.bb      | 26 +++++++++++++++++++
 meta-arm/recipes-bsp/uefi/edk2-firmware.inc   |  1 -
 .../recipes-bsp/uefi/edk2-firmware_202411.bb  |  7 +++++
 ...-in-the-paths-to-the-SBSA-test-suite.patch |  4 +--
 ...02-Enforce-using-good-old-BFD-linker.patch |  6 ++---
 meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.4.bb   |  2 +-
 10 files changed, 45 insertions(+), 7 deletions(-)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-bsp/uefi/edk2-basetools-native=
_202408.bb (100%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-bsp/uefi/edk2-firmware_202408.=
bb (74%)
 rename {meta-arm =3D> meta-arm-bsp}/recipes-bsp/uefi/files/0001-Platform-S=
tMmRpmb-Fix-build.patch (100%)
 create mode 100644 meta-arm/recipes-bsp/uefi/edk2-basetools-native_202411.=
bb
 create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202411.bb

diff --git a/meta-arm-bsp/conf/machine/sbsa-ref.conf b/meta-arm-bsp/conf/ma=
chine/sbsa-ref.conf
index ccfc45a8e296..116b4276319d 100644
--- a/meta-arm-bsp/conf/machine/sbsa-ref.conf
+++ b/meta-arm-bsp/conf/machine/sbsa-ref.conf
@@ -26,6 +26,10 @@ EFI_PROVIDER ?=3D "${@bb.utils.contains("DISTRO_FEATURES=
", "systemd", "systemd-boo
 SERIAL_CONSOLES ?=3D "115200;ttyAMA0 115200;hvc0"
=20
 EXTRA_IMAGEDEPENDS +=3D "edk2-firmware"
+# FIXME - Currently seeing a kernel warning for the CPU topology when bump=
ing
+# the version past this.  The issue is being tracked in
+# https://github.com/tianocore/edk2-platforms/issues/752
+PREFERRED_VERSION_edk2-firmware ?=3D "202408%"
=20
 QB_SYSTEM_NAME =3D "qemu-system-aarch64"
 QB_MACHINE =3D "-machine sbsa-ref"
diff --git a/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202408.bb b/me=
ta-arm-bsp/recipes-bsp/uefi/edk2-basetools-native_202408.bb
similarity index 100%
rename from meta-arm/recipes-bsp/uefi/edk2-basetools-native_202408.bb
rename to meta-arm-bsp/recipes-bsp/uefi/edk2-basetools-native_202408.bb
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202408.bb b/meta-arm-b=
sp/recipes-bsp/uefi/edk2-firmware_202408.bb
similarity index 74%
rename from meta-arm/recipes-bsp/uefi/edk2-firmware_202408.bb
rename to meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202408.bb
index 81bfc0002396..ea03d47ba1ea 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_202408.bb
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202408.bb
@@ -1,6 +1,8 @@
 SRCREV_edk2           ?=3D "b158dad150bf02879668f72ce306445250838201"
 SRCREV_edk2-platforms ?=3D "a3c898956a4d48dc5980336fa6ce6eeb23c4f72b"
=20
+SRC_URI +=3D "file://0001-Platform-StMmRpmb-Fix-build.patch;patchdir=3Dedk=
2-platforms"
+
 # FIXME - clang is having issues with antlr
 TOOLCHAIN:aarch64 =3D "gcc"
=20
diff --git a/meta-arm/recipes-bsp/uefi/files/0001-Platform-StMmRpmb-Fix-bui=
ld.patch b/meta-arm-bsp/recipes-bsp/uefi/files/0001-Platform-StMmRpmb-Fix-b=
uild.patch
similarity index 100%
rename from meta-arm/recipes-bsp/uefi/files/0001-Platform-StMmRpmb-Fix-buil=
d.patch
rename to meta-arm-bsp/recipes-bsp/uefi/files/0001-Platform-StMmRpmb-Fix-bu=
ild.patch
diff --git a/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202411.bb b/me=
ta-arm/recipes-bsp/uefi/edk2-basetools-native_202411.bb
new file mode 100644
index 000000000000..d89a79015a83
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202411.bb
@@ -0,0 +1,26 @@
+# Install EDK2 Base Tools in native sysroot. Currently the BaseTools are n=
ot
+# built, they are just copied to native sysroot. This is sufficient for
+# generating UEFI capsules as it only depends on some python scripts. Other
+# tools need to be built first before adding to sysroot.
+
+SUMMARY =3D "EDK2 Base Tools"
+LICENSE =3D "BSD-2-Clause-Patent"
+
+# EDK2
+SRC_URI =3D "git://github.com/tianocore/edk2.git;branch=3Dmaster;protocol=
=3Dhttps"
+LIC_FILES_CHKSUM =3D "file://License.txt;md5=3D2b415520383f7964e96700ae12b=
4570a"
+
+SRCREV =3D "b158dad150bf02879668f72ce306445250838201"
+
+UPSTREAM_CHECK_GITTAGREGEX =3D "^edk2-stable(?P<pver>\d+)$"
+
+S =3D "${WORKDIR}/git"
+
+inherit native
+
+RDEPENDS:${PN} +=3D "python3-core"
+
+do_install () {
+    mkdir -p ${D}${bindir}/edk2-BaseTools
+    cp -r ${WORKDIR}/git/BaseTools/* ${D}${bindir}/edk2-BaseTools/
+}
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recipes=
-bsp/uefi/edk2-firmware.inc
index c10154aae09a..42668d9d9cd6 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
@@ -20,7 +20,6 @@ SRCBRANCH_edk2_platforms =3D "master"
 SRC_URI =3D "\
     ${SRC_URI_EDK2};branch=3D${SRCBRANCH_edk2_platforms};name=3Dedk2;dests=
uffix=3Dedk2 \
     ${SRC_URI_EDK2_PLATFORMS};branch=3D${SRCBRANCH_edk2};name=3Dedk2-platf=
orms;destsuffix=3Dedk2/edk2-platforms \
-    file://0001-Platform-StMmRpmb-Fix-build.patch;patchdir=3Dedk2-platform=
s \
 "
=20
 SRCREV_FORMAT         =3D "edk2_edk2-platforms"
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202411.bb b/meta-arm/r=
ecipes-bsp/uefi/edk2-firmware_202411.bb
new file mode 100644
index 000000000000..5892a485ec1b
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_202411.bb
@@ -0,0 +1,7 @@
+SRCREV_edk2           ?=3D "0f3867fa6ef0553e26c42f7d71ff6bdb98429742"
+SRCREV_edk2-platforms ?=3D "2d66a9e048285af8ba4bfe4bdaab37a8e98288b3"
+
+# FIXME - clang is having issues with antlr
+TOOLCHAIN:aarch64 =3D "gcc"
+
+require recipes-bsp/uefi/edk2-firmware.inc
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Patch-in-the-paths-to-=
the-SBSA-test-suite.patch b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Patch-i=
n-the-paths-to-the-SBSA-test-suite.patch
index 6d626be5b8d3..e9f8c4173677 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Patch-in-the-paths-to-the-SBS=
A-test-suite.patch
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs/0001-Patch-in-the-paths-to-the-SBS=
A-test-suite.patch
@@ -10,7 +10,7 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 3 insertions(+)
=20
 diff --git a/ShellPkg/ShellPkg.dsc b/ShellPkg/ShellPkg.dsc
-index 557b0ec0f3d6..85b3f4fc65d0 100644
+index 7e985f8280a7..ca7a716fadc7 100644
 --- a/ShellPkg/ShellPkg.dsc
 +++ b/ShellPkg/ShellPkg.dsc
 @@ -23,6 +23,8 @@
@@ -22,7 +22,7 @@ index 557b0ec0f3d6..85b3f4fc65d0 100644
    UefiApplicationEntryPoint|MdePkg/Library/UefiApplicationEntryPoint/Uefi=
ApplicationEntryPoint.inf=0D
    UefiDriverEntryPoint|MdePkg/Library/UefiDriverEntryPoint/UefiDriverEntr=
yPoint.inf=0D
    UefiBootServicesTableLib|MdePkg/Library/UefiBootServicesTableLib/UefiBo=
otServicesTableLib.inf=0D
-@@ -88,6 +90,7 @@
+@@ -79,6 +81,7 @@
    # Build all the libraries when building this package.=0D
    # This helps developers test changes and how they affect the package.=0D
    #=0D
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs/0002-Enforce-using-good-old=
-BFD-linker.patch b/meta-arm/recipes-bsp/uefi/sbsa-acs/0002-Enforce-using-g=
ood-old-BFD-linker.patch
index 68a25c71c1d1..2d8a33f4a9da 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs/0002-Enforce-using-good-old-BFD-li=
nker.patch
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs/0002-Enforce-using-good-old-BFD-li=
nker.patch
@@ -1,4 +1,4 @@
-From 365fb8ebbefaa3c642e18e3c3a16eeccfa0dcc82 Mon Sep 17 00:00:00 2001
+From a91273485735b89e67050bb39a09b60a16055dbd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 7 Apr 2021 00:16:07 -0700
 Subject: [PATCH] Enforce using good old BFD linker
@@ -17,10 +17,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_def.=
template
-index c34ecfd557c5..153d097a2688 100755
+index 14f3b643c43d..ce3d969625de 100755
 --- a/BaseTools/Conf/tools_def.template
 +++ b/BaseTools/Conf/tools_def.template
-@@ -747,7 +747,7 @@ DEFINE GCC_AARCH64_CC_FLAGS        =3D DEF(GCC_ALL_CC_=
FLAGS) -mlittle-endian -fno-
+@@ -905,7 +905,7 @@ DEFINE GCC_AARCH64_CC_FLAGS        =3D DEF(GCC_ALL_CC_=
FLAGS) -mlittle-endian -fno-
  DEFINE GCC_AARCH64_CC_XIPFLAGS     =3D -mstrict-align -mgeneral-regs-only=
=0D
  DEFINE GCC_RISCV64_CC_XIPFLAGS     =3D -mstrict-align -mgeneral-regs-only=
=0D
  DEFINE GCC_DLINK_FLAGS_COMMON      =3D -nostdlib --pie=0D
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.4.bb b/meta-arm/recipes=
-bsp/uefi/sbsa-acs_7.1.4.bb
index b6361346c5b4..bb668bb48717 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.4.bb
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs_7.1.4.bb
@@ -1,4 +1,4 @@
-require recipes-bsp/uefi/edk2-firmware_202408.bb
+require recipes-bsp/uefi/edk2-firmware_202411.bb
 PROVIDES:remove =3D "virtual/bootloader"
=20
 LICENSE +=3D "& Apache-2.0"
--=20
2.39.5 (Apple Git-154)


