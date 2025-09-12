Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0798CAC592
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 21:27:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.247.1757712446438478330
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Sep 2025 14:27:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88D7D169E
	for <meta-arm@lists.yoctoproject.org>; Fri, 12 Sep 2025 14:27:17 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A6BA13F694
	for <meta-arm@lists.yoctoproject.org>; Fri, 12 Sep 2025 14:27:25 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm/edk2-firmware: update to 202508
Date: Fri, 12 Sep 2025 17:27:23 -0400
Message-Id: <20250912212725.95249-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 12 Sep 2025 21:27:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6707

Update edk2-firmware to the latest release and update edk2-basetools to
match this update (as the previous update did not do this).

Also, fix clang compile issues.  This change should fix any clang
compile issues since edk2-stable202108 (completely untested, but that is
when the relevant variables were renamed).

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...-native_202502.bb =3D> edk2-basetools-native_202508.bb} | 2 +-
 meta-arm/recipes-bsp/uefi/edk2-firmware.inc              | 3 ++-
 meta-arm/recipes-bsp/uefi/edk2-firmware_202505.bb        | 9 ---------
 meta-arm/recipes-bsp/uefi/edk2-firmware_202508.bb        | 6 ++++++
 .../0002-Enforce-using-good-old-BFD-linker.patch         | 8 ++++----
 meta-arm/recipes-bsp/uefi/sbsa-acs_7.2.2.bb              | 8 +++++++-
 6 files changed, 20 insertions(+), 16 deletions(-)
 rename meta-arm/recipes-bsp/uefi/{edk2-basetools-native_202502.bb =3D> edk=
2-basetools-native_202508.bb} (93%)
 delete mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202505.bb
 create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202508.bb

diff --git a/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202502.bb b/me=
ta-arm/recipes-bsp/uefi/edk2-basetools-native_202508.bb
similarity index 93%
rename from meta-arm/recipes-bsp/uefi/edk2-basetools-native_202502.bb
rename to meta-arm/recipes-bsp/uefi/edk2-basetools-native_202508.bb
index 0c08fce758d7..3c47b91a9069 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202502.bb
+++ b/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202508.bb
@@ -10,7 +10,7 @@ LICENSE =3D "BSD-2-Clause-Patent"
 SRC_URI =3D "git://github.com/tianocore/edk2.git;branch=3Dmaster;protocol=
=3Dhttps"
 LIC_FILES_CHKSUM =3D "file://License.txt;md5=3D2b415520383f7964e96700ae12b=
4570a"
=20
-SRCREV =3D "b158dad150bf02879668f72ce306445250838201"
+SRCREV =3D "d46aa46c8361194521391aa581593e556c707c6e"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "^edk2-stable(?P<pver>\d+)$"
=20
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recipes=
-bsp/uefi/edk2-firmware.inc
index a1840b16ec7d..a5590d3b7274 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
@@ -54,6 +54,7 @@ EDK2_BUILD_MODE ?=3D "${@bb.utils.contains('EDK2_BUILD_RE=
LEASE', '1', 'RELEASE', '
 # Baremetal, no need for a C library
 DEPENDS:remove =3D "virtual/${TARGET_PREFIX}compilerlibs virtual/libc"
 DEPENDS +=3D "util-linux-native iasl-native"
+DEPENDS:append:toolchain-clang =3D " lld-native"
=20
 inherit deploy
=20
@@ -77,7 +78,7 @@ EDK_COMPILER ?=3D "GCC5"
 export GCC5_AARCH64_PREFIX =3D "${TARGET_PREFIX}"
 export GCC5_ARM_PREFIX =3D "${TARGET_PREFIX}"
=20
-EDK_COMPILER:toolchain-clang =3D "CLANG38"
+EDK_COMPILER:toolchain-clang =3D "CLANGDWARF"
 export CLANG38_AARCH64_PREFIX =3D "${TARGET_PREFIX}"
 export CLANG38_ARM_PREFIX =3D "${TARGET_PREFIX}"
=20
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202505.bb b/meta-arm/r=
ecipes-bsp/uefi/edk2-firmware_202505.bb
deleted file mode 100644
index 89e532593991..000000000000
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_202505.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require recipes-bsp/uefi/edk2-firmware.inc
-
-SRCREV_edk2           ?=3D "6951dfe7d59d144a3a980bd7eda699db2d8554ac"
-SRCREV_edk2-platforms ?=3D "564f6509e89f45b25d97db2772ca9b3bec8b3ed5"
-
-# FIXME - clang is having issues with antlr
-TOOLCHAIN:aarch64 =3D "gcc"
-
-SRC_URI +=3D " file://edk2_fix_epoch.patch"
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202508.bb b/meta-arm/r=
ecipes-bsp/uefi/edk2-firmware_202508.bb
new file mode 100644
index 000000000000..6a82835f054c
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_202508.bb
@@ -0,0 +1,6 @@
+require recipes-bsp/uefi/edk2-firmware.inc
+
+SRCREV_edk2           ?=3D "d46aa46c8361194521391aa581593e556c707c6e"
+SRCREV_edk2-platforms ?=3D "d82aa92c1d360c1b53ccad4dc45bdd8164a560d5"
+
+SRC_URI +=3D " file://edk2_fix_epoch.patch"
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs/0002-Enforce-using-good-old=
-BFD-linker.patch b/meta-arm/recipes-bsp/uefi/sbsa-acs/0002-Enforce-using-g=
ood-old-BFD-linker.patch
index f73194d265b8..c05ef32479f3 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs/0002-Enforce-using-good-old-BFD-li=
nker.patch
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs/0002-Enforce-using-good-old-BFD-li=
nker.patch
@@ -1,4 +1,4 @@
-From 76665f48f5a4672d8c8bed3c57822307193b2b72 Mon Sep 17 00:00:00 2001
+From da0d96f0dc5fceafa34a7cc7d4d05f6f89336a87 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 7 Apr 2021 00:16:07 -0400
 Subject: [PATCH] Enforce using good old BFD linker
@@ -25,7 +25,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_def.=
template
-index ffeb22742142..ba24113d216c 100755
+index 0caa1c90018f..0b62fdc9ee72 100755
 --- a/BaseTools/Conf/tools_def.template
 +++ b/BaseTools/Conf/tools_def.template
 @@ -928,7 +928,7 @@ DEFINE GCC_ARM_CC_XIPFLAGS         =3D -mno-unaligned-=
access
@@ -34,6 +34,6 @@ index ffeb22742142..ba24113d216c 100755
  DEFINE GCC_RISCV64_CC_XIPFLAGS     =3D -mstrict-align -mgeneral-regs-only=
=0D
 -DEFINE GCC_DLINK2_FLAGS_COMMON     =3D -Wl,--script=3D$(EDK_TOOLS_PATH)/S=
cripts/GccBase.lds=0D
 +DEFINE GCC_DLINK2_FLAGS_COMMON     =3D -fuse-ld=3Dbfd -Wl,--script=3D$(ED=
K_TOOLS_PATH)/Scripts/GccBase.lds=0D
- DEFINE GCC_IA32_X64_DLINK_COMMON   =3D -nostdlib --pie --fatal-warnings -=
z,noexecstack --gc-sections=0D
- DEFINE GCC_ARM_AARCH64_DLINK_COMMON=3D -Wl,--emit-relocs -nostdlib -Wl,--=
gc-sections -u $(IMAGE_ENTRY_POINT) -Wl,-e,$(IMAGE_ENTRY_POINT),-Map,$(DEST=
_DIR_DEBUG)/$(BASE_NAME).map -Wl,--fatal-warnings -Wl,-z,noexecstack=0D
+ DEFINE GCC_ARM_AARCH64_DLINK_COMMON=3D -Wl,--emit-relocs -nostdlib -Wl,--=
gc-sections -u $(IMAGE_ENTRY_POINT) -Wl,-e,$(IMAGE_ENTRY_POINT),-Map,$(DEST=
_DIR_DEBUG)/$(BASE_NAME).map=0D
  DEFINE GCC_LOONGARCH64_DLINK_COMMON=3D -Wl,--emit-relocs -nostdlib -Wl,--=
gc-sections -u $(IMAGE_ENTRY_POINT) -Wl,-e,$(IMAGE_ENTRY_POINT),-Map,$(DEST=
_DIR_DEBUG)/$(BASE_NAME).map=0D
+ DEFINE GCC_ARM_DLINK_FLAGS         =3D DEF(GCC_ARM_AARCH64_DLINK_COMMON) =
-z common-page-size=3D0x20 -Wl,--pic-veneer=0D
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs_7.2.2.bb b/meta-arm/recipes=
-bsp/uefi/sbsa-acs_7.2.2.bb
index 2dd1de48c146..c037725ac66f 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs_7.2.2.bb
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs_7.2.2.bb
@@ -1,4 +1,4 @@
-require recipes-bsp/uefi/edk2-firmware_202505.bb
+require recipes-bsp/uefi/edk2-firmware_202508.bb
 PROVIDES:remove =3D "virtual/bootloader"
=20
 LICENSE +=3D "& Apache-2.0"
@@ -21,6 +21,12 @@ SRCREV_libc =3D "caea801aac338aa60f85a7c10148ca0b4440fff=
3"
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/ARM-software/sbsa-acs/releases"
=20
+# FIXME - some weirdness here with clang.  Looks like there are some
+# hardcoded assembly instructions which need feature enablement that
+# magically happens in gcc, but needs explicit enablement in clang.
+# Hardcode GCC until this can be bottomed out.
+TOOLCHAIN:aarch64 =3D "gcc"
+
 COMPATIBLE_HOST =3D "aarch64.*-linux"
 COMPATIBLE_MACHINE =3D ""
 PACKAGE_ARCH =3D "${TUNE_PKGARCH}"
--=20
2.39.5 (Apple Git-154)


