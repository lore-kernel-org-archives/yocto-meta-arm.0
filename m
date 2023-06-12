Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A2C6C7EE2E
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 16:05:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.63513.1686585916132166455
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 12 Jun 2023 09:05:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2FF4E1FB;
	Mon, 12 Jun 2023 09:06:00 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 565DB3F5A1;
	Mon, 12 Jun 2023 09:05:14 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-toolchain/gcc-arm-12.2: remove
Date: Mon, 12 Jun 2023 17:05:13 +0100
Message-Id: <20230612160513.938778-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 12 Jun 2023 16:05:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4762

From: Ross Burton <ross.burton@arm.com>

This recipe is a rebuild from source of the Arm GCC release, with
patches from oe-core added to make it work well in our environment.

Most people are happy with the GCC in oe-core, and this release is often
behind: at the time of writing oe-core has mainline GCC 13.1, but Arm
GCC is 12.2.  Users who actually want the improvements in Arm GCC will
likely want to use the binary toolchain so that they can have support
from Arm, and they're welcome to do so via the "external-arm" binary
toolchain.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml                                |   5 +-
 ci/armgcc.yml                                 |   6 -
 meta-arm-toolchain/README.md                  |  17 +-
 .../recipes-devtools/gcc/gcc-arm-12.2.inc     | 112 ----
 ...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch |  39 --
 .../0002-gcc-poison-system-directories.patch  | 239 --------
 .../0003-64-bit-multilib-hack.patch           | 134 -----
 ...R_BUILD-in-a-couple-of-places-to-avo.patch |  64 ---
 ...ts.h-in-B-instead-of-S-and-t-oe-in-B.patch |  92 ----
 .../gcc-arm-12.2/0006-cpp-honor-sysroot.patch |  53 --
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 403 --------------
 .../gcc/gcc-arm-12.2/0008-libtool.patch       |  39 --
 ...s-fix-v4bx-to-linker-to-support-EABI.patch |  40 --
 ...-config-files-from-B-instead-of-usin.patch |  99 ----
 ...ir-from-.la-which-usually-points-to-.patch |  28 -
 ...e-target-gcc-headers-can-be-included.patch | 113 ----
 ...t-directory-during-relink-if-inst_pr.patch |  35 --
 ...-fix-libcc1-s-install-path-and-rpath.patch |  51 --
 ...le-sysroot-support-for-nativesdk-gcc.patch | 510 ------------------
 ...sroot-gcc-version-specific-dirs-with.patch |  99 ----
 ...d-to-link-commandline-for-musl-targe.patch |  84 ---
 ...Re-introduce-spe-commandline-options.patch |  39 --
 ...as-for-__cpu_indicator_init-instead-.patch |  83 ---
 ...s-Do-not-use-__LINE__-for-maintainin.patch | 182 -------
 ...omic-Do-not-enforce-march-on-aarch64.patch |  42 --
 .../0024-Fix-install-path-of-linux64.h.patch  |  31 --
 .../0026-rust-recursion-limit.patch           |  93 ----
 .../gcc/gcc-arm-12.2/hardcoded-paths.patch    |  19 -
 .../gcc-arm-12.2/prefix-map-realpath.patch    |  63 ---
 .../recipes-devtools/gcc/gcc-arm-common.inc   |  27 -
 .../gcc/gcc-cross-canadian_arm-12.2.bb        |   2 -
 .../gcc/gcc-cross_arm-12.2.bb                 |   3 -
 .../gcc/gcc-crosssdk_arm-12.2.bb              |   2 -
 .../gcc/gcc-runtime_arm-12.2.bb               |   2 -
 .../gcc/gcc-sanitizers_arm-12.2.bb            |   7 -
 .../gcc/gcc-source_arm-12.2.bb                |   4 -
 .../recipes-devtools/gcc/gcc_arm-12.2.bb      |  15 -
 .../gcc/libgcc-initial_arm-12.2.bb            |   5 -
 .../recipes-devtools/gcc/libgcc_arm-12.2.bb   |   5 -
 .../gcc/libgfortran_arm-12.2.bb               |   2 -
 40 files changed, 3 insertions(+), 2885 deletions(-)
 delete mode 100644 ci/armgcc.yml
 delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2.=
inc
 delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/=
0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
 delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/=
0002-gcc-poison-system-directories.patch
 delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/=
0003-64-bit-multilib-hack.patch
 delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/=
0004-Pass-CXXFLAGS_FOR_BUILD-in-a-couple-of-places-to-avo.patch
 delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/=
0005-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
 delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/=
0006-cpp-honor-sysroot.patch
 delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/=
0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
 delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/=
0008-libtool.patch
 delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/=
0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
 delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/=
0010-Use-the-multilib-config-files-from-B-instead-of-usin.patch
 delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/=
0011-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
 delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/=
0013-Ensure-target-gcc-headers-can-be-included.patch
 delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/=
0014-Don-t-search-host-directory-during-relink-if-inst_pr.patch
 delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/=
0015-libcc1-fix-libcc1-s-install-path-and-rpath.patch
 delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/=
0016-handle-sysroot-support-for-nativesdk-gcc.patch
 delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/=
0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch
 delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/=
0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
 delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/=
0019-Re-introduce-spe-commandline-options.patch
 delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/=
0020-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
 delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/=
0021-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
 delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/=
0023-libatomic-Do-not-enforce-march-on-aarch64.patch
 delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/=
0024-Fix-install-path-of-linux64.h.patch
 delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/=
0026-rust-recursion-limit.patch
 delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/=
hardcoded-paths.patch
 delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/=
prefix-map-realpath.patch
 delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-commo=
n.inc
 delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-cross-can=
adian_arm-12.2.bb
 delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_arm=
-12.2.bb
 delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-crosssdk_=
arm-12.2.bb
 delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-runtime_a=
rm-12.2.bb
 delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-sanitizer=
s_arm-12.2.bb
 delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-source_ar=
m-12.2.bb
 delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-12.2.=
bb
 delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/libgcc-initia=
l_arm-12.2.bb
 delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/libgcc_arm-12=
.2.bb
 delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/libgfortran_a=
rm-12.2.bb

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 0ae5c995..74105e65 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -85,7 +85,7 @@ update-repos:
 # Available options for building are
 #  DISTRO: [poky, poky-tiny]
 #  KERNEL: [linux-yocto, linux-yocto-dev, linux-yocto-rt]
-#  TOOLCHAINS: [gcc, clang, armgcc, external-gccarm]
+#  TOOLCHAINS: [gcc, clang, external-gccarm]
 #  TCLIBC: [glibc, musl]
 #  FIRMWARE: [u-boot, edk2]
 #  TS: [none, trusted-services]
@@ -149,8 +149,7 @@ n1sdp:
   extends: .build
   parallel:
     matrix:
-      - TOOLCHAINS: [gcc, armgcc]
-        TS: [none, n1sdp-ts]
+      - TS: [none, n1sdp-ts]
=20
 qemu-generic-arm64:
   extends: .build
diff --git a/ci/armgcc.yml b/ci/armgcc.yml
deleted file mode 100644
index 9fb38cf2..00000000
--- a/ci/armgcc.yml
+++ /dev/null
@@ -1,6 +0,0 @@
-header:
-  version: 11
-
-local_conf_header:
-  cc: |
-    GCCVERSION =3D "arm-12.2"
diff --git a/meta-arm-toolchain/README.md b/meta-arm-toolchain/README.md
index 9ee05ed0..9830b95a 100644
--- a/meta-arm-toolchain/README.md
+++ b/meta-arm-toolchain/README.md
@@ -1,26 +1,11 @@
 meta-arm-toolchain Yocto Layer
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
=20
-This layer contains recipes for GNU Arm toolchains which could either be=
 built
-from source or pre-built toolchain binaries.
+This layer contains recipes for the prebuilt GNU Arm toolchains.
=20
 Information regarding contributing, reporting bugs, etc can be found in =
the
 top-level meta-arm readme file.
=20
-Source Arm toolchain for Linux development
-------------------------------------------
-
-Recipes for GNU Arm toolchain built from source are provided under
-``recipes-devtools/gcc/``. In order to use Arm toolchain instead of OE c=
ore
-toolchain, one just needs to override ``GCCVERSION`` in corresponding di=
stro
-conf file.
-
--  Eg. to use GNU Arm toolchain version ``9.2``
-   GCCVERSION =3D "arm-9.2"
-
-Pre-built Arm toolchain for Linux development
----------------------------------------------
-
 Recipes for pre-built GNU Arm toolchain for Linux development are provid=
ed under
 ``recipes-devtools/external-arm-toolchain/``.
=20
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2.inc b/m=
eta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2.inc
deleted file mode 100644
index 06bd8fa6..00000000
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2.inc
+++ /dev/null
@@ -1,112 +0,0 @@
-require recipes-devtools/gcc/gcc-common.inc
-
-# Third digit in PV should be incremented after a minor release
-ARM_GCC_VERSION =3D "12.2"
-ARM_GCC_SUB_VERSION =3D "rel1"
-PV =3D "arm-${ARM_GCC_VERSION}"
-CVE_VERSION =3D "12.2"
-
-# BINV should be incremented to a revision after a minor gcc release
-
-BINV =3D "12.2.1"
-
-MMYY =3D "22.12"
-RELEASE =3D "20${MMYY}"
-PR =3D "r${RELEASE}"
-
-FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/gcc-arm-${ARM_GCC_VERSION}:${FILE_=
DIRNAME}/gcc-arm-${ARM_GCC_VERSION}/backport:"
-
-DEPENDS =3D+ "mpfr gmp libmpc zlib flex-native"
-NATIVEDEPS =3D "mpfr-native gmp-native libmpc-native zlib-native flex-na=
tive zstd-native"
-
-LICENSE =3D "GPL-3.0-with-GCC-exception & GPL-3.0-only"
-
-LIC_FILES_CHKSUM =3D "\
-    file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552 \
-    file://COPYING3;md5=3Dd32239bcb673463ab874e80d47fae504 \
-    file://COPYING3.LIB;md5=3D6a6a8e020838b23406c81b19c1d46df6 \
-    file://COPYING.LIB;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
-    file://COPYING.RUNTIME;md5=3Dfe60d87048567d4fe8c8a0ed2448bcc8 \
-"
-
-BASEURI ?=3D "https://developer.arm.com/-/media/Files/downloads/gnu/${AR=
M_GCC_VERSION}.${ARM_GCC_SUB_VERSION}/srcrel/arm-gnu-toolchain-src-snapsh=
ot-${ARM_GCC_VERSION}.${ARM_GCC_SUB_VERSION}.tar.xz"
-SRC_URI =3D "${BASEURI} \
-           file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
-           file://0002-gcc-poison-system-directories.patch \
-           file://0003-64-bit-multilib-hack.patch \
-           file://0004-Pass-CXXFLAGS_FOR_BUILD-in-a-couple-of-places-to-=
avo.patch \
-           file://0005-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-=
B.patch \
-           file://0006-cpp-honor-sysroot.patch \
-           file://0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LI=
NKE.patch \
-           file://0008-libtool.patch \
-           file://0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI=
.patch \
-           file://0010-Use-the-multilib-config-files-from-B-instead-of-u=
sin.patch \
-           file://0011-Avoid-using-libdir-from-.la-which-usually-points-=
to-.patch \
-           file://0013-Ensure-target-gcc-headers-can-be-included.patch \
-           file://0014-Don-t-search-host-directory-during-relink-if-inst=
_pr.patch \
-           file://0015-libcc1-fix-libcc1-s-install-path-and-rpath.patch =
\
-           file://0016-handle-sysroot-support-for-nativesdk-gcc.patch \
-           file://0017-Search-target-sysroot-gcc-version-specific-dirs-w=
ith.patch \
-           file://0018-Add-ssp_nonshared-to-link-commandline-for-musl-ta=
rge.patch \
-           file://0019-Re-introduce-spe-commandline-options.patch \
-           file://0020-libgcc_s-Use-alias-for-__cpu_indicator_init-inste=
ad-.patch \
-           file://0021-gentypes-genmodes-Do-not-use-__LINE__-for-maintai=
nin.patch \
-           file://0023-libatomic-Do-not-enforce-march-on-aarch64.patch \
-           file://0024-Fix-install-path-of-linux64.h.patch \
-           file://0026-rust-recursion-limit.patch \
-           file://prefix-map-realpath.patch \
-           file://hardcoded-paths.patch \
-"
-SRC_URI[sha256sum] =3D "108b5e0786b988c7ce24b82187d8cf643fefbd8e3db24fa5=
f67e530e727d0c70"
-
-S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/arm-gnu-toolchain-src-snaps=
hot-${ARM_GCC_VERSION}.${ARM_GCC_SUB_VERSION}"
-
-# For dev release snapshotting
-#S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${RELEASE}"
-#B =3D "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
-
-# Language Overrides
-FORTRAN =3D ""
-JAVA =3D ""
-
-SSP ?=3D "--disable-libssp"
-SSP:mingw32 =3D "--enable-libssp"
-
-EXTRA_OECONF_BASE =3D "\
-    ${SSP} \
-    --enable-libitm \
-    --enable-lto \
-    --disable-bootstrap \
-    --with-system-zlib \
-    ${@'--with-linker-hash-style=3D${LINKER_HASH_STYLE}' if '${LINKER_HA=
SH_STYLE}' else ''} \
-    --enable-linker-build-id \
-    --with-ppl=3Dno \
-    --with-cloog=3Dno \
-    --enable-checking=3Drelease \
-    --enable-cheaders=3Dc_global \
-    --without-isl \
-"
-
-EXTRA_OECONF_INITIAL =3D "\
-    --disable-libgomp \
-    --disable-libitm \
-    --disable-libquadmath \
-    --with-system-zlib \
-    --disable-lto \
-    --disable-plugin \
-    --enable-linker-build-id \
-    --enable-decimal-float=3Dno \
-    --without-isl \
-    --disable-libssp \
-"
-
-EXTRA_OECONF:append_aarchilp32 =3D " --with-abi=3Dilp32"
-
-EXTRA_OECONF_PATHS =3D "\
-    --with-gxx-include-dir=3D/not/exist{target_includedir}/c++/${BINV} \
-    --with-sysroot=3D/not/exist \
-    --with-build-sysroot=3D${STAGING_DIR_TARGET} \
-"
-
-# Is a binutils 2.26 issue, not gcc
-CVE_CHECK_IGNORE +=3D "CVE-2021-37322"
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0001-gc=
c-4.3.1-ARCH_FLAGS_FOR_TARGET.patch b/meta-arm-toolchain/recipes-devtools=
/gcc/gcc-arm-12.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
deleted file mode 100644
index 66e582ca..00000000
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0001-gcc-4.3.1=
-ARCH_FLAGS_FOR_TARGET.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 31f94ef5b43a984a98f0eebd2dcf1b53aa1d7bce Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 08:37:11 +0400
-Subject: [PATCH] gcc-4.3.1: ARCH_FLAGS_FOR_TARGET
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Inappropriate [embedded specific]
----
- configure    | 2 +-
- configure.ac | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure b/configure
-index 5dcaab14ae9..f76310a36bb 100755
---- a/configure
-+++ b/configure
-@@ -10165,7 +10165,7 @@ fi
- # for target_alias and gcc doesn't manage it consistently.
- target_configargs=3D"--cache-file=3D./config.cache ${target_configargs}=
"
-=20
--FLAGS_FOR_TARGET=3D
-+FLAGS_FOR_TARGET=3D"$ARCH_FLAGS_FOR_TARGET"
- case " $target_configdirs " in
-  *" newlib "*)
-   case " $target_configargs " in
-diff --git a/configure.ac b/configure.ac
-index 85977482aee..8b9097c7a45 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3346,7 +3346,7 @@ fi
- # for target_alias and gcc doesn't manage it consistently.
- target_configargs=3D"--cache-file=3D./config.cache ${target_configargs}=
"
-=20
--FLAGS_FOR_TARGET=3D
-+FLAGS_FOR_TARGET=3D"$ARCH_FLAGS_FOR_TARGET"
- case " $target_configdirs " in
-  *" newlib "*)
-   case " $target_configargs " in
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0002-gc=
c-poison-system-directories.patch b/meta-arm-toolchain/recipes-devtools/g=
cc/gcc-arm-12.2/0002-gcc-poison-system-directories.patch
deleted file mode 100644
index 5aa635b3..00000000
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0002-gcc-poiso=
n-system-directories.patch
+++ /dev/null
@@ -1,239 +0,0 @@
-From 99f1e61b2957226254a116fde7fd73bf07034012 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 8 Mar 2021 16:04:20 -0800
-Subject: [PATCH] gcc: poison-system-directories
-
-Add /sw/include and /opt/include based on the original
-zecke-no-host-includes.patch patch.  The original patch checked for
-/usr/include, /sw/include and /opt/include and then triggered a failure =
and
-aborted.
-
-Instead, we add the two missing items to the current scan.  If the user
-wants this to be a failure, they can add "-Werror=3Dpoison-system-direct=
ories".
-
-Upstream-Status: Pending
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gcc/common.opt      |  4 ++++
- gcc/config.in       | 10 ++++++++++
- gcc/configure       | 19 +++++++++++++++++++
- gcc/configure.ac    | 16 ++++++++++++++++
- gcc/doc/invoke.texi |  9 +++++++++
- gcc/gcc.cc          | 15 ++++++++++++---
- gcc/incpath.cc      | 21 +++++++++++++++++++++
- 7 files changed, 91 insertions(+), 3 deletions(-)
-
-diff --git a/gcc/common.opt b/gcc/common.opt
-index 8a0dafc52..0357868e2 100644
---- a/gcc/common.opt
-+++ b/gcc/common.opt
-@@ -710,6 +710,10 @@ Wreturn-local-addr
- Common Var(warn_return_local_addr) Init(1) Warning
- Warn about returning a pointer/reference to a local or temporary variab=
le.
-=20
-+Wpoison-system-directories
-+Common Var(flag_poison_system_directories) Init(1) Warning
-+Warn for -I and -L options using system directories if cross compiling
-+
- Wshadow
- Common Var(warn_shadow) Warning
- Warn when one variable shadows another.  Same as -Wshadow=3Dglobal.
-diff --git a/gcc/config.in b/gcc/config.in
-index 64c27c9cf..a693cb8a8 100644
---- a/gcc/config.in
-+++ b/gcc/config.in
-@@ -230,6 +230,16 @@
- #endif
-=20
-=20
-+/* Define to warn for use of native system header directories */
-+#ifndef USED_FOR_TARGET
-+#undef ENABLE_POISON_SYSTEM_DIRECTORIES
-+#endif
-+/* Define to warn for use of native system header directories */
-+#ifndef USED_FOR_TARGET
-+#undef POISON_BY_DEFAULT
-+#endif
-+
-+
- /* Define if you want all operations on RTL (the basic data structure o=
f the
-    optimizer and back end) to be checked for dynamic type safety at run=
time.
-    This is quite expensive. */
-diff --git a/gcc/configure b/gcc/configure
-index 2b83acfb0..8bb97578c 100755
---- a/gcc/configure
-+++ b/gcc/configure
-@@ -1023,6 +1023,7 @@ enable_maintainer_mode
- enable_link_mutex
- enable_link_serialization
- enable_version_specific_runtime_libs
-+enable_poison_system_directories
- enable_plugin
- enable_host_shared
- enable_libquadmath_support
-@@ -1785,6 +1786,8 @@ Optional Features:
-   --enable-version-specific-runtime-libs
-                           specify that runtime libraries should be inst=
alled
-                           in a compiler-specific directory
-+  --enable-poison-system-directories
-+                          warn for use of native system header director=
ies
-   --enable-plugin         enable plugin support
-   --enable-host-shared    build host code as shared libraries
-   --disable-libquadmath-support
-@@ -31996,6 +31999,22 @@ if test "${enable_version_specific_runtime_libs=
+set}" =3D set; then :
- fi
-=20
-=20
-+# Check whether --enable-poison-system-directories was given.
-+if test "${enable_poison_system_directories+set}" =3D set; then :
-+  enableval=3D$enable_poison_system_directories;
-+else
-+  enable_poison_system_directories=3Dno
-+fi
-+
-+if test "x${enable_poison_system_directories}" !=3D "xno"; then
-+
-+$as_echo "#define ENABLE_POISON_SYSTEM_DIRECTORIES 1" >>confdefs.h
-+if test "$enable_poison_system_directories" =3D "error"; then
-+$as_echo "#define POISON_BY_DEFAULT 1" >>confdefs.h
-+fi
-+
-+fi
-+
- # Substitute configuration variables
-=20
-=20
-diff --git a/gcc/configure.ac b/gcc/configure.ac
-index daf2a708c..6155b83a7 100644
---- a/gcc/configure.ac
-+++ b/gcc/configure.ac
-@@ -7435,6 +7435,22 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
-                 [specify that runtime libraries should be
-                  installed in a compiler-specific directory])])
-=20
-+AC_ARG_ENABLE([poison-system-directories],
-+             AS_HELP_STRING([--enable-poison-system-directories],
-+                            [warn for use of native system header direc=
tories (no/yes/error)]),,
-+             [enable_poison_system_directories=3Dno])
-+AC_MSG_NOTICE([poisoned directories $enable_poison_system_directories])
-+if test "x${enable_poison_system_directories}" !=3D "xno"; then
-+  AC_MSG_NOTICE([poisoned directories enabled])
-+  AC_DEFINE([ENABLE_POISON_SYSTEM_DIRECTORIES],
-+           [1],
-+           [Define to warn for use of native system header directories]=
)
-+  if test $enable_poison_system_directories =3D "error"; then
-+   AC_MSG_NOTICE([poisoned directories are fatal])
-+   AC_DEFINE([POISON_BY_DEFAULT], [1], [Define to make poison warnings =
errors])
-+  fi
-+fi
-+
- # Substitute configuration variables
- AC_SUBST(subdirs)
- AC_SUBST(srcdir)
-diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index ff6c338be..a8ebfa59a 100644
---- a/gcc/doc/invoke.texi
-+++ b/gcc/doc/invoke.texi
-@@ -379,6 +379,7 @@ Objective-C and Objective-C++ Dialects}.
- -Wpacked  -Wno-packed-bitfield-compat  -Wpacked-not-aligned  -Wpadded @=
gol
- -Wparentheses  -Wno-pedantic-ms-format @gol
- -Wpointer-arith  -Wno-pointer-compare  -Wno-pointer-to-int-cast @gol
-+-Wno-poison-system-directories @gol
- -Wno-pragmas  -Wno-prio-ctor-dtor  -Wredundant-decls @gol
- -Wrestrict  -Wno-return-local-addr  -Wreturn-type @gol
- -Wno-scalar-storage-order  -Wsequence-point @gol
-@@ -8029,6 +8030,14 @@ made up of data only and thus requires no special=
 treatment.  But, for
- most targets, it is made up of code and thus requires the stack to be
- made executable in order for the program to work properly.
-=20
-+@item -Wno-poison-system-directories
-+@opindex Wno-poison-system-directories
-+Do not warn for @option{-I} or @option{-L} options using system
-+directories such as @file{/usr/include} when cross compiling.  This
-+option is intended for use in chroot environments when such
-+directories contain the correct headers and libraries for the target
-+system rather than the host.
-+
- @item -Wfloat-equal
- @opindex Wfloat-equal
- @opindex Wno-float-equal
-diff --git a/gcc/gcc.cc b/gcc/gcc.cc
-index beefde7f6..4e6557b3c 100644
---- a/gcc/gcc.cc
-+++ b/gcc/gcc.cc
-@@ -1162,6 +1162,8 @@ proper position among the other output files.  */
-    "%{fuse-ld=3D*:-fuse-ld=3D%*} " LINK_COMPRESS_DEBUG_SPEC \
-    "%X %{o*} %{e*} %{N} %{n} %{r}\
-     %{s} %{t} %{u*} %{z} %{Z} %{!nostdlib:%{!r:%{!nostartfiles:%S}}} \
-+    %{Wno-poison-system-directories:--no-poison-system-directories} \
-+    %{Werror=3Dpoison-system-directories:--error-poison-system-director=
ies} \
-     %{static|no-pie|static-pie:} %@{L*} %(mfwrap) %(link_libgcc) " \
-     VTABLE_VERIFICATION_SPEC " " SANITIZER_EARLY_SPEC " %o "" \
-     %{fopenacc|fopenmp|%:gt(%{ftree-parallelize-loops=3D*:%*} 1):\
-@@ -1257,8 +1259,11 @@ static const char *cpp_unique_options =3D
- static const char *cpp_options =3D
- "%(cpp_unique_options) %1 %{m*} %{std*&ansi&trigraphs} %{W*&pedantic*} =
%{w}\
-  %{f*} %{g*:%{%:debug-level-gt(0):%{g*}\
-- %{!fno-working-directory:-fworking-directory}}} %{O*}\
-- %{undef} %{save-temps*:-fpch-preprocess}";
-+ %{!fno-working-directory:-fworking-directory}}} %{O*}"
-+#ifdef POISON_BY_DEFAULT
-+ " %{!Wno-error=3Dpoison-system-directories:-Werror=3Dpoison-system-dir=
ectories}"
-+#endif
-+ " %{undef} %{save-temps*:-fpch-preprocess}";
-=20
- /* Pass -d* flags, possibly modifying -dumpdir, -dumpbase et al.
-=20
-@@ -1287,7 +1292,11 @@ static const char *cc1_options =3D
-  %{coverage:-fprofile-arcs -ftest-coverage}\
-  %{fprofile-arcs|fprofile-generate*|coverage:\
-    %{!fprofile-update=3Dsingle:\
--     %{pthread:-fprofile-update=3Dprefer-atomic}}}";
-+     %{pthread:-fprofile-update=3Dprefer-atomic}}}"
-+#ifdef POISON_BY_DEFAULT
-+ " %{!Wno-error=3Dpoison-system-directories:-Werror=3Dpoison-system-dir=
ectories}"
-+#endif
-+  ;
-=20
- static const char *asm_options =3D
- "%{-target-help:%:print-asm-header()} "
-diff --git a/gcc/incpath.cc b/gcc/incpath.cc
-index 622204a38..5ac03c086 100644
---- a/gcc/incpath.cc
-+++ b/gcc/incpath.cc
-@@ -26,6 +26,7 @@
- #include "intl.h"
- #include "incpath.h"
- #include "cppdefault.h"
-+#include "diagnostic-core.h"
-=20
- /* Microsoft Windows does not natively support inodes.
-    VMS has non-numeric inodes.  */
-@@ -399,6 +400,26 @@ merge_include_chains (const char *sysroot, cpp_read=
er *pfile, int verbose)
- 	}
-       fprintf (stderr, _("End of search list.\n"));
-     }
-+
-+#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
-+  if (flag_poison_system_directories)
-+    {
-+       struct cpp_dir *p;
-+
-+       for (p =3D heads[INC_QUOTE]; p; p =3D p->next)
-+         {
-+          if ((!strncmp (p->name, "/usr/include", 12))
-+              || (!strncmp (p->name, "/usr/local/include", 18))
-+              || (!strncmp (p->name, "/usr/X11R6/include", 18))
-+              || (!strncmp (p->name, "/sw/include", 11))
-+              || (!strncmp (p->name, "/opt/include", 12)))
-+            warning (OPT_Wpoison_system_directories,
-+                     "include location \"%s\" is unsafe for "
-+                     "cross-compilation",
-+                     p->name);
-+         }
-+    }
-+#endif
- }
-=20
- /* Use given -I paths for #include "..." but not #include <...>, and
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0003-64=
-bit-multilib-hack.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-ar=
m-12.2/0003-64-bit-multilib-hack.patch
deleted file mode 100644
index e83f05b8..00000000
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0003-64-bit-mu=
ltilib-hack.patch
+++ /dev/null
@@ -1,134 +0,0 @@
-From 34b861e7a4cfd7b1f0d2c0f8cf9bb0b0b81eb61a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 09:10:06 +0400
-Subject: [PATCH] 64-bit multilib hack.
-
-GCC has internal multilib handling code but it assumes a very specific r=
igid directory
-layout. The build system implementation of multilib layout is very gener=
ic and allows
-complete customisation of the library directories.
-
-This patch is a partial solution to allow any custom directories to be p=
assed into gcc
-and handled correctly. It forces gcc to use the base_libdir (which is th=
e current
-directory, "."). We need to do this for each multilib that is configured=
 as we don't
-know which compiler options may be being passed into the compiler. Since=
 we have a compiler
-per mulitlib at this point that isn't an issue.
-
-The one problem is the target compiler is only going to work for the def=
ault multlilib at
-this point. Ideally we'd figure out which multilibs were being enabled w=
ith which paths
-and be able to patch these entries with a complete set of correct paths =
but this we
-don't have such code at this point. This is something the target gcc rec=
ipe should do
-and override these platform defaults in its build config.
-
-Do same for riscv64, aarch64 & arc
-
-RP 15/8/11
-
-Upstream-Status: Inappropriate [OE-Specific]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gcc/config/aarch64/t-aarch64-linux |  8 ++++----
- gcc/config/arc/t-multilib-linux    |  4 ++--
- gcc/config/i386/t-linux64          |  6 ++----
- gcc/config/mips/t-linux64          | 10 +++-------
- gcc/config/riscv/t-linux           |  6 ++++--
- gcc/config/rs6000/t-linux64        |  5 ++---
- 6 files changed, 17 insertions(+), 22 deletions(-)
-
-diff --git a/gcc/config/aarch64/t-aarch64-linux b/gcc/config/aarch64/t-a=
arch64-linux
-index d0cd546002a..f4056d68372 100644
---- a/gcc/config/aarch64/t-aarch64-linux
-+++ b/gcc/config/aarch64/t-aarch64-linux
-@@ -21,8 +21,8 @@
- LIB1ASMSRC   =3D aarch64/lib1funcs.asm
- LIB1ASMFUNCS =3D _aarch64_sync_cache_range
-=20
--AARCH_BE =3D $(if $(findstring TARGET_BIG_ENDIAN_DEFAULT=3D1, $(tm_defi=
nes)),_be)
--MULTILIB_OSDIRNAMES =3D mabi.lp64=3D../lib64$(call if_multiarch,:aarch6=
4$(AARCH_BE)-linux-gnu)
--MULTIARCH_DIRNAME =3D $(call if_multiarch,aarch64$(AARCH_BE)-linux-gnu)
-+#AARCH_BE =3D $(if $(findstring TARGET_BIG_ENDIAN_DEFAULT=3D1, $(tm_def=
ines)),_be)
-+#MULTILIB_OSDIRNAMES =3D mabi.lp64=3D../lib64$(call if_multiarch,:aarch=
64$(AARCH_BE)-linux-gnu)
-+#MULTIARCH_DIRNAME =3D $(call if_multiarch,aarch64$(AARCH_BE)-linux-gnu=
)
-=20
--MULTILIB_OSDIRNAMES +=3D mabi.ilp32=3D../libilp32$(call if_multiarch,:a=
arch64$(AARCH_BE)-linux-gnu_ilp32)
-+#MULTILIB_OSDIRNAMES +=3D mabi.ilp32=3D../libilp32$(call if_multiarch,:=
aarch64$(AARCH_BE)-linux-gnu_ilp32)
-diff --git a/gcc/config/arc/t-multilib-linux b/gcc/config/arc/t-multilib=
-linux
-index ecb9ae6859f..12a164028d4 100644
---- a/gcc/config/arc/t-multilib-linux
-+++ b/gcc/config/arc/t-multilib-linux
-@@ -16,9 +16,9 @@
- # along with GCC; see the file COPYING3.  If not see
- # <http://www.gnu.org/licenses/>.
-=20
--MULTILIB_OPTIONS =3D mcpu=3Dhs/mcpu=3Darchs/mcpu=3Dhs38/mcpu=3Dhs38_lin=
ux/mcpu=3Darc700/mcpu=3Dnps400
-+#MULTILIB_OPTIONS =3D mcpu=3Dhs/mcpu=3Darchs/mcpu=3Dhs38/mcpu=3Dhs38_li=
nux/mcpu=3Darc700/mcpu=3Dnps400
-=20
--MULTILIB_DIRNAMES =3D hs archs hs38 hs38_linux arc700 nps400
-+#MULTILIB_DIRNAMES =3D hs archs hs38 hs38_linux arc700 nps400
-=20
- # Aliases:
- MULTILIB_MATCHES +=3D mcpu?arc700=3DmA7
-diff --git a/gcc/config/i386/t-linux64 b/gcc/config/i386/t-linux64
-index 5526ad0e6cc..fa51c88912b 100644
---- a/gcc/config/i386/t-linux64
-+++ b/gcc/config/i386/t-linux64
-@@ -32,7 +32,5 @@
- #
- comma=3D,
- MULTILIB_OPTIONS    =3D $(subst $(comma),/,$(TM_MULTILIB_CONFIG))
--MULTILIB_DIRNAMES   =3D $(patsubst m%, %, $(subst /, ,$(MULTILIB_OPTION=
S)))
--MULTILIB_OSDIRNAMES =3D m64=3D../lib64$(call if_multiarch,:x86_64-linux=
-gnu)
--MULTILIB_OSDIRNAMES+=3D m32=3D$(if $(wildcard $(shell echo $(SYSTEM_HEA=
DER_DIR))/../../usr/lib32),../lib32,../lib)$(call if_multiarch,:i386-linu=
x-gnu)
--MULTILIB_OSDIRNAMES+=3D mx32=3D../libx32$(call if_multiarch,:x86_64-lin=
ux-gnux32)
-+MULTILIB_DIRNAMES =3D . .
-+MULTILIB_OSDIRNAMES =3D ../$(shell basename $(base_libdir)) ../$(shell =
basename $(base_libdir))
-diff --git a/gcc/config/mips/t-linux64 b/gcc/config/mips/t-linux64
-index 2fdd8e00407..04f2099250f 100644
---- a/gcc/config/mips/t-linux64
-+++ b/gcc/config/mips/t-linux64
-@@ -17,10 +17,6 @@
- # <http://www.gnu.org/licenses/>.
-=20
- MULTILIB_OPTIONS =3D mabi=3Dn32/mabi=3D32/mabi=3D64
--MULTILIB_DIRNAMES =3D n32 32 64
--MIPS_EL =3D $(if $(filter %el, $(firstword $(subst -, ,$(target)))),el)
--MIPS_SOFT =3D $(if $(strip $(filter MASK_SOFT_FLOAT_ABI, $(target_cpu_d=
efault)) $(filter soft, $(with_float))),soft)
--MULTILIB_OSDIRNAMES =3D \
--	../lib32$(call if_multiarch,:mips64$(MIPS_EL)-linux-gnuabin32$(MIPS_SO=
FT)) \
--	../lib$(call if_multiarch,:mips$(MIPS_EL)-linux-gnu$(MIPS_SOFT)) \
--	../lib64$(call if_multiarch,:mips64$(MIPS_EL)-linux-gnuabi64$(MIPS_SOF=
T))
-+MULTILIB_DIRNAMES =3D . . .
-+MULTILIB_OSDIRNAMES =3D ../$(shell basename $(base_libdir)) ../$(shell =
basename $(base_libdir)) ../$(shell basename $(base_libdir))
-+
-diff --git a/gcc/config/riscv/t-linux b/gcc/config/riscv/t-linux
-index 216d2776a18..e4d817621fc 100644
---- a/gcc/config/riscv/t-linux
-+++ b/gcc/config/riscv/t-linux
-@@ -1,3 +1,5 @@
- # Only XLEN and ABI affect Linux multilib dir names, e.g. /lib32/ilp32d=
/
--MULTILIB_DIRNAMES :=3D $(patsubst rv32%,lib32,$(patsubst rv64%,lib64,$(=
MULTILIB_DIRNAMES)))
--MULTILIB_OSDIRNAMES :=3D $(patsubst lib%,../lib%,$(MULTILIB_DIRNAMES))
-+#MULTILIB_DIRNAMES :=3D $(patsubst rv32%,lib32,$(patsubst rv64%,lib64,$=
(MULTILIB_DIRNAMES)))
-+MULTILIB_DIRNAMES :=3D . .
-+#MULTILIB_OSDIRNAMES :=3D $(patsubst lib%,../lib%,$(MULTILIB_DIRNAMES))
-+MULTILIB_OSDIRNAMES :=3D ../$(shell basename $(base_libdir)) ../$(shell=
 basename $(base_libdir))
-diff --git a/gcc/config/rs6000/t-linux64 b/gcc/config/rs6000/t-linux64
-index 47e0efd5764..05f5a3f188e 100644
---- a/gcc/config/rs6000/t-linux64
-+++ b/gcc/config/rs6000/t-linux64
-@@ -26,10 +26,9 @@
- # MULTILIB_OSDIRNAMES according to what is found on the target.
-=20
- MULTILIB_OPTIONS    :=3D m64/m32
--MULTILIB_DIRNAMES   :=3D 64 32
-+MULTILIB_DIRNAMES   :=3D . .
- MULTILIB_EXTRA_OPTS :=3D=20
--MULTILIB_OSDIRNAMES :=3D m64=3D../lib64$(call if_multiarch,:powerpc64-l=
inux-gnu)
--MULTILIB_OSDIRNAMES +=3D m32=3D$(if $(wildcard $(shell echo $(SYSTEM_HE=
ADER_DIR))/../../usr/lib32),../lib32,../lib)$(call if_multiarch,:powerpc-=
linux-gnu)
-+MULTILIB_OSDIRNAMES :=3D ../$(shell basename $(base_libdir)) ../$(shell=
 basename $(base_libdir))
-=20
- rs6000-linux.o: $(srcdir)/config/rs6000/rs6000-linux.cc
- 	$(COMPILE) $<
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0004-Pa=
ss-CXXFLAGS_FOR_BUILD-in-a-couple-of-places-to-avo.patch b/meta-arm-toolc=
hain/recipes-devtools/gcc/gcc-arm-12.2/0004-Pass-CXXFLAGS_FOR_BUILD-in-a-=
couple-of-places-to-avo.patch
deleted file mode 100644
index e8f21634..00000000
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0004-Pass-CXXF=
LAGS_FOR_BUILD-in-a-couple-of-places-to-avo.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 7f40f8321fb999e9b34d948724517d3fb0d26820 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Thu, 28 Oct 2021 11:33:40 +0100
-Subject: [PATCH] Pass CXXFLAGS_FOR_BUILD in a couple of places to avoid =
these
- errors.
-
-If CXXFLAGS contains something unsupported by the build CXX, we see buil=
d failures (e.g. using -fmacro-prefix-map for the target).
-
-2021-10-28 Richard Purdie <richard.purdie@linuxfoundation.org>
-
-ChangeLog:
-
-    * Makefile.in: Regenerate.
-    * Makefile.tpl: Add missing CXXFLAGS_FOR_BUILD overrides
-
-Upstream-Status: Pending [should be submittable]
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile.in  | 2 ++
- Makefile.tpl | 2 ++
- 2 files changed, 4 insertions(+)
-
-diff --git a/Makefile.in b/Makefile.in
-index 593495e1650..1d9c83cc566 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -176,6 +176,7 @@ BUILD_EXPORTS =3D \
- # built for the build system to override those in BASE_FLAGS_TO_PASS.
- EXTRA_BUILD_FLAGS =3D \
- 	CFLAGS=3D"$(CFLAGS_FOR_BUILD)" \
-+	CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)" \
- 	LDFLAGS=3D"$(LDFLAGS_FOR_BUILD)"
-=20
- # This is the list of directories to built for the host system.
-@@ -207,6 +208,7 @@ HOST_EXPORTS =3D \
- 	CPP_FOR_BUILD=3D"$(CPP_FOR_BUILD)"; export CPP_FOR_BUILD; \
- 	CPPFLAGS_FOR_BUILD=3D"$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS_FOR_BUIL=
D; \
- 	CXX_FOR_BUILD=3D"$(CXX_FOR_BUILD)"; export CXX_FOR_BUILD; \
-+	CXXFLAGS_FOR_BUILD=3D"$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS_FOR_BUIL=
D; \
- 	DLLTOOL=3D"$(DLLTOOL)"; export DLLTOOL; \
- 	DSYMUTIL=3D"$(DSYMUTIL)"; export DSYMUTIL; \
- 	LD=3D"$(LD)"; export LD; \
-diff --git a/Makefile.tpl b/Makefile.tpl
-index ef58fac2b9a..bab04f335c2 100644
---- a/Makefile.tpl
-+++ b/Makefile.tpl
-@@ -179,6 +179,7 @@ BUILD_EXPORTS =3D \
- # built for the build system to override those in BASE_FLAGS_TO_PASS.
- EXTRA_BUILD_FLAGS =3D \
- 	CFLAGS=3D"$(CFLAGS_FOR_BUILD)" \
-+	CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)" \
- 	LDFLAGS=3D"$(LDFLAGS_FOR_BUILD)"
-=20
- # This is the list of directories to built for the host system.
-@@ -210,6 +211,7 @@ HOST_EXPORTS =3D \
- 	CPP_FOR_BUILD=3D"$(CPP_FOR_BUILD)"; export CPP_FOR_BUILD; \
- 	CPPFLAGS_FOR_BUILD=3D"$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS_FOR_BUIL=
D; \
- 	CXX_FOR_BUILD=3D"$(CXX_FOR_BUILD)"; export CXX_FOR_BUILD; \
-+	CXXFLAGS_FOR_BUILD=3D"$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS_FOR_BUIL=
D; \
- 	DLLTOOL=3D"$(DLLTOOL)"; export DLLTOOL; \
- 	DSYMUTIL=3D"$(DSYMUTIL)"; export DSYMUTIL; \
- 	LD=3D"$(LD)"; export LD; \
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0005-Us=
e-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch b/meta-arm-toolcha=
in/recipes-devtools/gcc/gcc-arm-12.2/0005-Use-the-defaults.h-in-B-instead=
-of-S-and-t-oe-in-B.patch
deleted file mode 100644
index e34eb2cf..00000000
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0005-Use-the-d=
efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From 5455fc1de74897a27c1199dc5611ec02243e24af Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 09:17:25 +0400
-Subject: [PATCH] Use the defaults.h in ${B} instead of ${S}, and t-oe in=
 ${B}
-
-Use the defaults.h in ${B} instead of ${S}, and t-oe in ${B}, so that
-the source can be shared between gcc-cross-initial,
-gcc-cross-intermediate, gcc-cross, gcc-runtime, and also the sdk build.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-
-While compiling gcc-crosssdk-initial-x86_64 on some host, there is
-occasionally failure that test the existance of default.h doesn't
-work, the reason is tm_include_list=3D'** defaults.h' rather than
-tm_include_list=3D'** ./defaults.h'
-
-So we add the test condition for this situation.
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- gcc/Makefile.in  | 2 +-
- gcc/configure    | 4 ++--
- gcc/configure.ac | 4 ++--
- gcc/mkconfig.sh  | 4 ++--
- 4 files changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 31ff95500c9..a8277254696 100644
---- a/gcc/Makefile.in
-+++ b/gcc/Makefile.in
-@@ -553,7 +553,7 @@ TARGET_SYSTEM_ROOT =3D @TARGET_SYSTEM_ROOT@
- TARGET_SYSTEM_ROOT_DEFINE =3D @TARGET_SYSTEM_ROOT_DEFINE@
-=20
- xmake_file=3D@xmake_file@
--tmake_file=3D@tmake_file@
-+tmake_file=3D@tmake_file@ ./t-oe
- TM_ENDIAN_CONFIG=3D@TM_ENDIAN_CONFIG@
- TM_MULTILIB_CONFIG=3D@TM_MULTILIB_CONFIG@
- TM_MULTILIB_EXCEPTIONS_CONFIG=3D@TM_MULTILIB_EXCEPTIONS_CONFIG@
-diff --git a/gcc/configure b/gcc/configure
-index dc2d59701ad..3fc0e2f5813 100755
---- a/gcc/configure
-+++ b/gcc/configure
-@@ -13381,8 +13381,8 @@ for f in $tm_file; do
-        tm_include_list=3D"${tm_include_list} $f"
-        ;;
-     defaults.h )
--       tm_file_list=3D"${tm_file_list} \$(srcdir)/$f"
--       tm_include_list=3D"${tm_include_list} $f"
-+       tm_file_list=3D"${tm_file_list} ./$f"
-+       tm_include_list=3D"${tm_include_list} ./$f"
-        ;;
-     * )
-        tm_file_list=3D"${tm_file_list} \$(srcdir)/config/$f"
-diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 36ce78924de..46de496b256 100644
---- a/gcc/configure.ac
-+++ b/gcc/configure.ac
-@@ -2332,8 +2332,8 @@ for f in $tm_file; do
-        tm_include_list=3D"${tm_include_list} $f"
-        ;;
-     defaults.h )
--       tm_file_list=3D"${tm_file_list} \$(srcdir)/$f"
--       tm_include_list=3D"${tm_include_list} $f"
-+       tm_file_list=3D"${tm_file_list} ./$f"
-+       tm_include_list=3D"${tm_include_list} ./$f"
-        ;;
-     * )
-        tm_file_list=3D"${tm_file_list} \$(srcdir)/config/$f"
-diff --git a/gcc/mkconfig.sh b/gcc/mkconfig.sh
-index 91cc43f69ff..8de33713cd8 100644
---- a/gcc/mkconfig.sh
-+++ b/gcc/mkconfig.sh
-@@ -77,7 +77,7 @@ if [ -n "$HEADERS" ]; then
-     if [ $# -ge 1 ]; then
- 	echo '#ifdef IN_GCC' >> ${output}T
- 	for file in "$@"; do
--	    if test x"$file" =3D x"defaults.h"; then
-+	    if test x"$file" =3D x"./defaults.h" -o x"$file" =3D x"defaults.h"=
; then
- 		postpone_defaults_h=3D"yes"
- 	    else
- 		echo "# include \"$file\"" >> ${output}T
-@@ -106,7 +106,7 @@ esac
-=20
- # If we postponed including defaults.h, add the #include now.
- if test x"$postpone_defaults_h" =3D x"yes"; then
--    echo "# include \"defaults.h\"" >> ${output}T
-+    echo "# include \"./defaults.h\"" >> ${output}T
- fi
-=20
- # Add multiple inclusion protection guard, part two.
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0006-cp=
p-honor-sysroot.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-1=
2.2/0006-cpp-honor-sysroot.patch
deleted file mode 100644
index b08aecc7..00000000
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0006-cpp-honor=
-sysroot.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From abc3b82ab24169277f2090e9df1ceac3573142be Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 09:22:00 +0400
-Subject: [PATCH] cpp: honor sysroot.
-
-Currently, if the gcc toolchain is relocated and installed from sstate, =
then you try and compile
-preprocessed source (.i or .ii files), the compiler will try and access =
the builtin sysroot location
-rather than the --sysroot option specified on the commandline. If access=
 to that directory is
-permission denied (unreadable), gcc will error.
-
-This happens when ccache is in use due to the fact it uses preprocessed =
source files.
-
-The fix below adds %I to the cpp-output spec macro so the default substi=
tutions for -iprefix,
--isystem, -isysroot happen and the correct sysroot is used.
-
-[YOCTO #2074]
-
-RP 2012/04/13
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
----
- gcc/cp/lang-specs.h | 2 +-
- gcc/gcc.cc          | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gcc/cp/lang-specs.h b/gcc/cp/lang-specs.h
-index f35c9fab76b..19ddc98ce7f 100644
---- a/gcc/cp/lang-specs.h
-+++ b/gcc/cp/lang-specs.h
-@@ -116,7 +116,7 @@ along with GCC; see the file COPYING3.  If not see
-   {".ii", "@c++-cpp-output", 0, 0, 0},
-   {"@c++-cpp-output",
-       "%{!E:%{!M:%{!MM:"
--      "  cc1plus -fpreprocessed %i %(cc1_options) %2"
-+      "  cc1plus -fpreprocessed %i %I %(cc1_options) %2"
-       "  %{!fsyntax-only:"
-       "    %{fmodule-only:%{!S:-o %g.s%V}}"
-       "    %{!fmodule-only:%{!fmodule-header*:%(invoke_as)}}}"
-diff --git a/gcc/gcc.cc b/gcc/gcc.cc
-index ce161d3c853..aa4cf92fb78 100644
---- a/gcc/gcc.cc
-+++ b/gcc/gcc.cc
-@@ -1476,7 +1476,7 @@ static const struct compiler default_compilers[] =3D
- 					   %W{o*:--output-pch=3D%*}}%V}}}}}}}", 0, 0, 0},
-   {".i", "@cpp-output", 0, 0, 0},
-   {"@cpp-output",
--   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %(cc1_options) %{!fsyntax-onl=
y:%(invoke_as)}}}}", 0, 0, 0},
-+   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %I %(cc1_options) %{!fsyntax-=
only:%(invoke_as)}}}}", 0, 0, 0},
-   {".s", "@assembler", 0, 0, 0},
-   {"@assembler",
-    "%{!M:%{!MM:%{!E:%{!S:as %(asm_debug) %(asm_options) %i %A }}}}", 0,=
 0, 0},
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0007-De=
fine-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta-arm-toolc=
hain/recipes-devtools/gcc/gcc-arm-12.2/0007-Define-GLIBC_DYNAMIC_LINKER-a=
nd-UCLIBC_DYNAMIC_LINKE.patch
deleted file mode 100644
index b59eed57..00000000
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0007-Define-GL=
IBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
+++ /dev/null
@@ -1,403 +0,0 @@
-From 4de00af67b57b5440bdf61ab364ad959ad0aeee7 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 09:24:50 +0400
-Subject: [PATCH] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
- relative to SYSTEMLIBS_DIR
-
-This patch defines GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
-relative to SYSTEMLIBS_DIR which can be set in generated headers
-This breaks the assumption of hardcoded multilib in gcc
-Change is only for the supported architectures in OE including
-SH, sparc, alpha for possible future support (if any)
-
-Removes the do_headerfix task in metadata
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Inappropriate [OE configuration]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gcc/config/aarch64/aarch64-linux.h |  4 ++--
- gcc/config/alpha/linux-elf.h       |  4 ++--
- gcc/config/arm/linux-eabi.h        |  6 +++---
- gcc/config/arm/linux-elf.h         |  2 +-
- gcc/config/i386/linux.h            |  4 ++--
- gcc/config/i386/linux64.h          | 12 ++++++------
- gcc/config/linux.h                 |  8 ++++----
- gcc/config/loongarch/gnu-user.h    |  4 ++--
- gcc/config/microblaze/linux.h      |  4 ++--
- gcc/config/mips/linux.h            | 18 +++++++++---------
- gcc/config/nios2/linux.h           |  4 ++--
- gcc/config/riscv/linux.h           |  4 ++--
- gcc/config/rs6000/linux64.h        | 15 +++++----------
- gcc/config/rs6000/sysv4.h          |  4 ++--
- gcc/config/s390/linux.h            |  8 ++++----
- gcc/config/sh/linux.h              |  4 ++--
- gcc/config/sparc/linux.h           |  2 +-
- gcc/config/sparc/linux64.h         |  4 ++--
- 18 files changed, 53 insertions(+), 58 deletions(-)
-
-diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aar=
ch64-linux.h
-index 5e4553d79f5..877e8841eb2 100644
---- a/gcc/config/aarch64/aarch64-linux.h
-+++ b/gcc/config/aarch64/aarch64-linux.h
-@@ -21,10 +21,10 @@
- #ifndef GCC_AARCH64_LINUX_H
- #define GCC_AARCH64_LINUX_H
-=20
--#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-aarch64%{mbig-endian:_be}%{=
mabi=3Dilp32:_ilp32}.so.1"
-+#define GLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-linux-aarch64%{mbig-en=
dian:_be}%{mabi=3Dilp32:_ilp32}.so.1"
-=20
- #undef MUSL_DYNAMIC_LINKER
--#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-aarch64%{mbig-endian:_be}%{ma=
bi=3Dilp32:_ilp32}.so.1"
-+#define MUSL_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-musl-aarch64%{mbig-endi=
an:_be}%{mabi=3Dilp32:_ilp32}.so.1"
-=20
- #undef  ASAN_CC1_SPEC
- #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
-diff --git a/gcc/config/alpha/linux-elf.h b/gcc/config/alpha/linux-elf.h
-index 17f16a55910..0a7be38fa63 100644
---- a/gcc/config/alpha/linux-elf.h
-+++ b/gcc/config/alpha/linux-elf.h
-@@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.  If not see
- #define EXTRA_SPECS \
- { "elf_dynamic_linker", ELF_DYNAMIC_LINKER },
-=20
--#define GLIBC_DYNAMIC_LINKER	"/lib/ld-linux.so.2"
--#define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
-+#define GLIBC_DYNAMIC_LINKER	SYSTEMLIBS_DIR "ld-linux.so.2"
-+#define UCLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-uClibc.so.0"
- #if DEFAULT_LIBC =3D=3D LIBC_UCLIBC
- #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
- #elif DEFAULT_LIBC =3D=3D LIBC_GLIBC
-diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h
-index 50cc0bc6d08..17c18b27145 100644
---- a/gcc/config/arm/linux-eabi.h
-+++ b/gcc/config/arm/linux-eabi.h
-@@ -65,8 +65,8 @@
-    GLIBC_DYNAMIC_LINKER_DEFAULT and TARGET_DEFAULT_FLOAT_ABI.  */
-=20
- #undef  GLIBC_DYNAMIC_LINKER
--#define GLIBC_DYNAMIC_LINKER_SOFT_FLOAT "/lib/ld-linux.so.3"
--#define GLIBC_DYNAMIC_LINKER_HARD_FLOAT "/lib/ld-linux-armhf.so.3"
-+#define GLIBC_DYNAMIC_LINKER_SOFT_FLOAT SYSTEMLIBS_DIR "ld-linux.so.3"
-+#define GLIBC_DYNAMIC_LINKER_HARD_FLOAT SYSTEMLIBS_DIR "ld-linux-armhf.=
so.3"
- #define GLIBC_DYNAMIC_LINKER_DEFAULT GLIBC_DYNAMIC_LINKER_SOFT_FLOAT
-=20
- #define GLIBC_DYNAMIC_LINKER \
-@@ -89,7 +89,7 @@
- #define MUSL_DYNAMIC_LINKER_E "%{mbig-endian:eb}"
- #endif
- #define MUSL_DYNAMIC_LINKER \
--  "/lib/ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=3Dhard:hf}%{mf=
dpic:-fdpic}.so.1"
-+  SYSTEMLIBS_DIR "ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=3Dha=
rd:hf}%{mfdpic:-fdpic}.so.1"
-=20
- /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
-    use the GNU/Linux version, not the generic BPABI version.  */
-diff --git a/gcc/config/arm/linux-elf.h b/gcc/config/arm/linux-elf.h
-index df3da67c4f0..37456e9d5a4 100644
---- a/gcc/config/arm/linux-elf.h
-+++ b/gcc/config/arm/linux-elf.h
-@@ -60,7 +60,7 @@
-=20
- #define LIBGCC_SPEC "%{mfloat-abi=3Dsoft*:-lfloat} -lgcc"
-=20
--#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
-+#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
-=20
- #define LINUX_TARGET_LINK_SPEC  "%{h*} \
-    %{static:-Bstatic} \
-diff --git a/gcc/config/i386/linux.h b/gcc/config/i386/linux.h
-index 5d99ee56d5b..a76022c9ccc 100644
---- a/gcc/config/i386/linux.h
-+++ b/gcc/config/i386/linux.h
-@@ -20,7 +20,7 @@ along with GCC; see the file COPYING3.  If not see
- <http://www.gnu.org/licenses/>.  */
-=20
- #define GNU_USER_LINK_EMULATION "elf_i386"
--#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
-+#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
-=20
- #undef MUSL_DYNAMIC_LINKER
--#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-i386.so.1"
-+#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-musl-i386.so.1"
-diff --git a/gcc/config/i386/linux64.h b/gcc/config/i386/linux64.h
-index 8681e36f10d..ddce49b6b60 100644
---- a/gcc/config/i386/linux64.h
-+++ b/gcc/config/i386/linux64.h
-@@ -27,13 +27,13 @@ see the files COPYING3 and COPYING.RUNTIME respectiv=
ely.  If not, see
- #define GNU_USER_LINK_EMULATION64 "elf_x86_64"
- #define GNU_USER_LINK_EMULATIONX32 "elf32_x86_64"
-=20
--#define GLIBC_DYNAMIC_LINKER32 "/lib/ld-linux.so.2"
--#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux-x86-64.so.2"
--#define GLIBC_DYNAMIC_LINKERX32 "/libx32/ld-linux-x32.so.2"
-+#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-linux.so.2"
-+#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux-x86-64.so.2"
-+#define GLIBC_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ld-linux-x32.so.2"
-=20
- #undef MUSL_DYNAMIC_LINKER32
--#define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-i386.so.1"
-+#define MUSL_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-musl-i386.so.1"
- #undef MUSL_DYNAMIC_LINKER64
--#define MUSL_DYNAMIC_LINKER64 "/lib/ld-musl-x86_64.so.1"
-+#define MUSL_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-musl-x86_64.so.1"
- #undef MUSL_DYNAMIC_LINKERX32
--#define MUSL_DYNAMIC_LINKERX32 "/lib/ld-musl-x32.so.1"
-+#define MUSL_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ld-musl-x32.so.1"
-diff --git a/gcc/config/linux.h b/gcc/config/linux.h
-index 74f70793d90..4ce173384ef 100644
---- a/gcc/config/linux.h
-+++ b/gcc/config/linux.h
-@@ -99,10 +99,10 @@ see the files COPYING3 and COPYING.RUNTIME respectiv=
ely.  If not, see
-    GLIBC_DYNAMIC_LINKER must be defined for each target using them, or
-    GLIBC_DYNAMIC_LINKER32 and GLIBC_DYNAMIC_LINKER64 for targets
-    supporting both 32-bit and 64-bit compilation.  */
--#define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
--#define UCLIBC_DYNAMIC_LINKER32 "/lib/ld-uClibc.so.0"
--#define UCLIBC_DYNAMIC_LINKER64 "/lib/ld64-uClibc.so.0"
--#define UCLIBC_DYNAMIC_LINKERX32 "/lib/ldx32-uClibc.so.0"
-+#define UCLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-uClibc.so.0"
-+#define UCLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-uClibc.so.0"
-+#define UCLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld64-uClibc.so.0"
-+#define UCLIBC_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ldx32-uClibc.so.0"
- #define BIONIC_DYNAMIC_LINKER "/system/bin/linker"
- #define BIONIC_DYNAMIC_LINKER32 "/system/bin/linker"
- #define BIONIC_DYNAMIC_LINKER64 "/system/bin/linker64"
-diff --git a/gcc/config/loongarch/gnu-user.h b/gcc/config/loongarch/gnu-=
user.h
-index 664dc9206ad..082bd7cfc6f 100644
---- a/gcc/config/loongarch/gnu-user.h
-+++ b/gcc/config/loongarch/gnu-user.h
-@@ -31,11 +31,11 @@ along with GCC; see the file COPYING3.  If not see
-=20
- #undef GLIBC_DYNAMIC_LINKER
- #define GLIBC_DYNAMIC_LINKER \
--  "/lib" ABI_GRLEN_SPEC "/ld-linux-loongarch-" ABI_SPEC ".so.1"
-+  SYSTEMLIBS_DIR "ld-linux-loongarch-" ABI_SPEC ".so.1"
-=20
- #undef MUSL_DYNAMIC_LINKER
- #define MUSL_DYNAMIC_LINKER \
--  "/lib" ABI_GRLEN_SPEC "/ld-musl-loongarch-" ABI_SPEC ".so.1"
-+  SYSTEMLIBS_DIR "ld-musl-loongarch-" ABI_SPEC ".so.1"
-=20
- #undef GNU_USER_TARGET_LINK_SPEC
- #define GNU_USER_TARGET_LINK_SPEC \
-diff --git a/gcc/config/microblaze/linux.h b/gcc/config/microblaze/linux=
.h
-index 5b1a365eda4..2e63df1ae9c 100644
---- a/gcc/config/microblaze/linux.h
-+++ b/gcc/config/microblaze/linux.h
-@@ -28,7 +28,7 @@
- #undef TLS_NEEDS_GOT
- #define TLS_NEEDS_GOT 1
-=20
--#define GLIBC_DYNAMIC_LINKER "/lib/ld.so.1"
-+#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "/ld.so.1"
- #define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
-=20
- #if TARGET_BIG_ENDIAN_DEFAULT =3D=3D 0 /* LE */
-@@ -38,7 +38,7 @@
- #endif
-=20
- #undef MUSL_DYNAMIC_LINKER
--#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-microblaze" MUSL_DYNAMIC_LINK=
ER_E ".so.1"
-+#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-musl-microblaze" MUSL_DY=
NAMIC_LINKER_E ".so.1"
-=20
- #undef  SUBTARGET_EXTRA_SPECS
- #define SUBTARGET_EXTRA_SPECS \
-diff --git a/gcc/config/mips/linux.h b/gcc/config/mips/linux.h
-index 230b7789bb8..d96d134bfcf 100644
---- a/gcc/config/mips/linux.h
-+++ b/gcc/config/mips/linux.h
-@@ -22,29 +22,29 @@ along with GCC; see the file COPYING3.  If not see
- #define GNU_USER_LINK_EMULATIONN32 "elf32%{EB:b}%{EL:l}tsmipn32"
-=20
- #define GLIBC_DYNAMIC_LINKER32 \
--  "%{mnan=3D2008:/lib/ld-linux-mipsn8.so.1;:/lib/ld.so.1}"
-+  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld-linux-mipsn8.so.1;:" SYSTEMLIBS_D=
IR "ld.so.1}"
- #define GLIBC_DYNAMIC_LINKER64 \
--  "%{mnan=3D2008:/lib64/ld-linux-mipsn8.so.1;:/lib64/ld.so.1}"
-+  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld-linux-mipsn8.so.1;:" SYSTEMLIBS_D=
IR "ld.so.1}"
- #define GLIBC_DYNAMIC_LINKERN32 \
--  "%{mnan=3D2008:/lib32/ld-linux-mipsn8.so.1;:/lib32/ld.so.1}"
-+  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld-linux-mipsn8.so.1;:" SYSTEMLIBS_D=
IR "ld.so.1}"
-=20
- #undef UCLIBC_DYNAMIC_LINKER32
- #define UCLIBC_DYNAMIC_LINKER32 \
--  "%{mnan=3D2008:/lib/ld-uClibc-mipsn8.so.0;:/lib/ld-uClibc.so.0}"
-+  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld-uClibc-mipsn8.so.0;:" SYSTEMLIBS_=
DIR "ld-uClibc.so.0}"
- #undef UCLIBC_DYNAMIC_LINKER64
- #define UCLIBC_DYNAMIC_LINKER64 \
--  "%{mnan=3D2008:/lib/ld64-uClibc-mipsn8.so.0;:/lib/ld64-uClibc.so.0}"
-+  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld64-uClibc-mipsn8.so.0;:" SYSTEMLIB=
S_DIR "ld64-uClibc.so.0}"
- #define UCLIBC_DYNAMIC_LINKERN32 \
--  "%{mnan=3D2008:/lib32/ld-uClibc-mipsn8.so.0;:/lib32/ld-uClibc.so.0}"
-+  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld-uClibc-mipsn8.so.0;:" SYSTEMLIBS_=
DIR "ld-uClibc.so.0}"
-=20
- #undef MUSL_DYNAMIC_LINKER32
- #define MUSL_DYNAMIC_LINKER32 \
--  "/lib/ld-musl-mips%{mips32r6|mips64r6:r6}%{EL:el}%{msoft-float:-sf}.s=
o.1"
-+  SYSTEMLIBS_DIR "ld-musl-mips%{mips32r6|mips64r6:r6}%{EL:el}%{msoft-fl=
oat:-sf}.so.1"
- #undef MUSL_DYNAMIC_LINKER64
- #define MUSL_DYNAMIC_LINKER64 \
--  "/lib/ld-musl-mips64%{mips64r6:r6}%{EL:el}%{msoft-float:-sf}.so.1"
-+  SYSTEMLIBS_DIR "ld-musl-mips64%{mips64r6:r6}%{EL:el}%{msoft-float:-sf=
}.so.1"
- #define MUSL_DYNAMIC_LINKERN32 \
--  "/lib/ld-musl-mipsn32%{mips64r6:r6}%{EL:el}%{msoft-float:-sf}.so.1"
-+  SYSTEMLIBS_DIR "ld-musl-mipsn32%{mips64r6:r6}%{EL:el}%{msoft-float:-s=
f}.so.1"
-=20
- #define BIONIC_DYNAMIC_LINKERN32 "/system/bin/linker32"
- #define GNU_USER_DYNAMIC_LINKERN32 \
-diff --git a/gcc/config/nios2/linux.h b/gcc/config/nios2/linux.h
-index f5dd813acad..7a13e1c9799 100644
---- a/gcc/config/nios2/linux.h
-+++ b/gcc/config/nios2/linux.h
-@@ -29,8 +29,8 @@
- #undef CPP_SPEC
- #define CPP_SPEC "%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRANT}"
-=20
--#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-nios2.so.1"
--#define MUSL_DYNAMIC_LINKER  "/lib/ld-musl-nios2.so.1"
-+#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux-nios2.so.1"
-+#define MUSL_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-musl-nios2.so.1"
-=20
- #undef LINK_SPEC
- #define LINK_SPEC LINK_SPEC_ENDIAN \
-diff --git a/gcc/config/riscv/linux.h b/gcc/config/riscv/linux.h
-index 38803723ba9..d5ef8a96a19 100644
---- a/gcc/config/riscv/linux.h
-+++ b/gcc/config/riscv/linux.h
-@@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.  If not see
-     GNU_USER_TARGET_OS_CPP_BUILTINS();				\
-   } while (0)
-=20
--#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-riscv" XLEN_SPEC "-" ABI_SP=
EC ".so.1"
-+#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux-riscv" XLEN_SPEC =
"-" ABI_SPEC ".so.1"
-=20
- #define MUSL_ABI_SUFFIX \
-   "%{mabi=3Dilp32:-sf}" \
-@@ -33,7 +33,7 @@ along with GCC; see the file COPYING3.  If not see
-   "%{mabi=3Dlp64d:}"
-=20
- #undef MUSL_DYNAMIC_LINKER
--#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-riscv" XLEN_SPEC MUSL_ABI_SUF=
FIX ".so.1"
-+#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-musl-riscv" XLEN_SPEC MU=
SL_ABI_SUFFIX ".so.1"
-=20
- /* Because RISC-V only has word-sized atomics, it requries libatomic wh=
ere
-    others do not.  So link libatomic by default, as needed.  */
-diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
-index b2a7afabc73..364c1a5b155 100644
---- a/gcc/config/rs6000/linux64.h
-+++ b/gcc/config/rs6000/linux64.h
-@@ -339,24 +339,19 @@ extern int dot_symbols;
- #undef	LINK_OS_DEFAULT_SPEC
- #define LINK_OS_DEFAULT_SPEC "%(link_os_linux)"
-=20
--#define GLIBC_DYNAMIC_LINKER32 "%(dynamic_linker_prefix)/lib/ld.so.1"
--
-+#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld.so.1"
- #ifdef LINUX64_DEFAULT_ABI_ELFv2
--#define GLIBC_DYNAMIC_LINKER64 \
--"%{mabi=3Delfv1:%(dynamic_linker_prefix)/lib64/ld64.so.1;" \
--":%(dynamic_linker_prefix)/lib64/ld64.so.2}"
-+#define GLIBC_DYNAMIC_LINKER64 "%{mabi=3Delfv1:" SYSTEMLIBS_DIR "ld64.s=
o.1;:" SYSTEMLIBS_DIR "ld64.so.2}"
- #else
--#define GLIBC_DYNAMIC_LINKER64 \
--"%{mabi=3Delfv2:%(dynamic_linker_prefix)/lib64/ld64.so.2;" \
--":%(dynamic_linker_prefix)/lib64/ld64.so.1}"
-+#define GLIBC_DYNAMIC_LINKER64 "%{mabi=3Delfv2:" SYSTEMLIBS_DIR "ld64.s=
o.2;:" SYSTEMLIBS_DIR "ld64.so.1}"
- #endif
-=20
- #undef MUSL_DYNAMIC_LINKER32
- #define MUSL_DYNAMIC_LINKER32 \
--  "/lib/ld-musl-powerpc" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}.so.1=
"
-+  SYSTEMLIBS_DIR "ld-musl-powerpc" MUSL_DYNAMIC_LINKER_E "%{msoft-float=
:-sf}.so.1"
- #undef MUSL_DYNAMIC_LINKER64
- #define MUSL_DYNAMIC_LINKER64 \
--  "/lib/ld-musl-powerpc64" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}.so=
.1"
-+  SYSTEMLIBS_DIR "ld-musl-powerpc64" MUSL_DYNAMIC_LINKER_E "%{msoft-flo=
at:-sf}.so.1"
-=20
- #undef  DEFAULT_ASM_ENDIAN
- #if (TARGET_DEFAULT & MASK_LITTLE_ENDIAN)
-diff --git a/gcc/config/rs6000/sysv4.h b/gcc/config/rs6000/sysv4.h
-index 7e2519de5d4..a73954d9de5 100644
---- a/gcc/config/rs6000/sysv4.h
-+++ b/gcc/config/rs6000/sysv4.h
-@@ -779,10 +779,10 @@ GNU_USER_TARGET_CC1_SPEC
-=20
- #define MUSL_DYNAMIC_LINKER_E ENDIAN_SELECT("","le","")
-=20
--#define GLIBC_DYNAMIC_LINKER "/lib/ld.so.1"
-+#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld.so.1"
- #undef MUSL_DYNAMIC_LINKER
- #define MUSL_DYNAMIC_LINKER \
--  "/lib/ld-musl-powerpc" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}.so.1=
"
-+  SYSTEMLIBS_DIR "ld-musl-powerpc" MUSL_DYNAMIC_LINKER_E "%{msoft-float=
:-sf}.so.1"
-=20
- #ifndef GNU_USER_DYNAMIC_LINKER
- #define GNU_USER_DYNAMIC_LINKER GLIBC_DYNAMIC_LINKER
-diff --git a/gcc/config/s390/linux.h b/gcc/config/s390/linux.h
-index d7b7e7a7b02..0139b4d06ca 100644
---- a/gcc/config/s390/linux.h
-+++ b/gcc/config/s390/linux.h
-@@ -72,13 +72,13 @@ along with GCC; see the file COPYING3.  If not see
- #define MULTILIB_DEFAULTS { "m31" }
- #endif
-=20
--#define GLIBC_DYNAMIC_LINKER32 "/lib/ld.so.1"
--#define GLIBC_DYNAMIC_LINKER64 "/lib/ld64.so.1"
-+#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld.so.1"
-+#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld64.so.1"
-=20
- #undef MUSL_DYNAMIC_LINKER32
--#define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-s390.so.1"
-+#define MUSL_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-musl-s390.so.1"
- #undef MUSL_DYNAMIC_LINKER64
--#define MUSL_DYNAMIC_LINKER64 "/lib/ld-musl-s390x.so.1"
-+#define MUSL_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-musl-s390x.so.1"
-=20
- #undef  LINK_SPEC
- #define LINK_SPEC \
-diff --git a/gcc/config/sh/linux.h b/gcc/config/sh/linux.h
-index d96d077c99e..7d27f9893ee 100644
---- a/gcc/config/sh/linux.h
-+++ b/gcc/config/sh/linux.h
-@@ -61,10 +61,10 @@ along with GCC; see the file COPYING3.  If not see
-=20
- #undef MUSL_DYNAMIC_LINKER
- #define MUSL_DYNAMIC_LINKER \
--  "/lib/ld-musl-sh" MUSL_DYNAMIC_LINKER_E MUSL_DYNAMIC_LINKER_FP \
-+  SYSTEMLIBS_DIR "ld-musl-sh" MUSL_DYNAMIC_LINKER_E MUSL_DYNAMIC_LINKER=
_FP \
-   "%{mfdpic:-fdpic}.so.1"
-=20
--#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
-+#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
-=20
- #undef SUBTARGET_LINK_EMUL_SUFFIX
- #define SUBTARGET_LINK_EMUL_SUFFIX "%{mfdpic:_fd;:_linux}"
-diff --git a/gcc/config/sparc/linux.h b/gcc/config/sparc/linux.h
-index 6a809e9092d..60603765ad6 100644
---- a/gcc/config/sparc/linux.h
-+++ b/gcc/config/sparc/linux.h
-@@ -78,7 +78,7 @@ extern const char *host_detect_local_cpu (int argc, co=
nst char **argv);
-    When the -shared link option is used a final link is not being
-    done.  */
-=20
--#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
-+#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
-=20
- #undef  LINK_SPEC
- #define LINK_SPEC "-m elf32_sparc %{shared:-shared} \
-diff --git a/gcc/config/sparc/linux64.h b/gcc/config/sparc/linux64.h
-index d08a2ef96fe..e6955da0a5b 100644
---- a/gcc/config/sparc/linux64.h
-+++ b/gcc/config/sparc/linux64.h
-@@ -78,8 +78,8 @@ along with GCC; see the file COPYING3.  If not see
-    When the -shared link option is used a final link is not being
-    done.  */
-=20
--#define GLIBC_DYNAMIC_LINKER32 "/lib/ld-linux.so.2"
--#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux.so.2"
-+#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-linux.so.2"
-+#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux.so.2"
-=20
- #ifdef SPARC_BI_ARCH
-=20
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0008-li=
btool.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0008-l=
ibtool.patch
deleted file mode 100644
index c9bc38cc..00000000
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0008-libtool.p=
atch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 5117519c1897a49b09fe7fff213b9c2ea15d37f5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 09:29:11 +0400
-Subject: [PATCH] libtool
-
-libstdc++ from gcc-runtime gets created with -rpath=3D/usr/lib/../lib fo=
r qemux86-64
-when running on am x86_64 build host.
-
-This patch stops this speading to libdir in the libstdc++.la file within=
 libtool.
-Arguably, it shouldn't be passing this into libtool in the first place b=
ut
-for now this resolves the nastiest problems this causes.
-
-func_normal_abspath would resolve an empty path to `pwd` so we need
-to filter the zero case.
-
-RP 2012/8/24
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
----
- ltmain.sh | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/ltmain.sh b/ltmain.sh
-index 70990740b6c..ee938056bef 100644
---- a/ltmain.sh
-+++ b/ltmain.sh
-@@ -6359,6 +6359,10 @@ func_mode_link ()
- 	func_warning "ignoring multiple \`-rpath's for a libtool library"
-=20
-       install_libdir=3D"$1"
-+      if test -n "$install_libdir"; then
-+	func_normal_abspath "$install_libdir"
-+	install_libdir=3D$func_normal_abspath_result
-+      fi
-=20
-       oldlibs=3D
-       if test -z "$rpath"; then
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0009-gc=
c-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch b/meta-arm-toolchai=
n/recipes-devtools/gcc/gcc-arm-12.2/0009-gcc-armv4-pass-fix-v4bx-to-linke=
r-to-support-EABI.patch
deleted file mode 100644
index dd67b115..00000000
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0009-gcc-armv4=
-pass-fix-v4bx-to-linker-to-support-EABI.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 32129f9682d0d27fc67af10f077ad2768935cbe6 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 09:30:32 +0400
-Subject: [PATCH] gcc: armv4: pass fix-v4bx to linker to support EABI.
-
-The LINK_SPEC for linux gets overwritten by linux-eabi.h which
-means the value of TARGET_FIX_V4BX_SPEC gets lost and as a result
-the option is not passed to linker when chosing march=3Darmv4
-This patch redefines this in linux-eabi.h and reinserts it
-for eabi defaulting toolchains.
-
-We might want to send it upstream.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
----
- gcc/config/arm/linux-eabi.h | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h
-index 17c18b27145..8eacb099317 100644
---- a/gcc/config/arm/linux-eabi.h
-+++ b/gcc/config/arm/linux-eabi.h
-@@ -91,10 +91,14 @@
- #define MUSL_DYNAMIC_LINKER \
-   SYSTEMLIBS_DIR "ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=3Dha=
rd:hf}%{mfdpic:-fdpic}.so.1"
-=20
-+/* For armv4 we pass --fix-v4bx to linker to support EABI */
-+#undef TARGET_FIX_V4BX_SPEC
-+#define TARGET_FIX_V4BX_SPEC "%{mcpu=3Darm8|mcpu=3Darm810|mcpu=3Dstrong=
arm*|march=3Darmv4: --fix-v4bx}"
-+
- /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
-    use the GNU/Linux version, not the generic BPABI version.  */
- #undef  LINK_SPEC
--#define LINK_SPEC EABI_LINK_SPEC					\
-+#define LINK_SPEC TARGET_FIX_V4BX_SPEC EABI_LINK_SPEC			\
-   LINUX_OR_ANDROID_LD (LINUX_TARGET_LINK_SPEC,				\
- 		       LINUX_TARGET_LINK_SPEC " " ANDROID_LINK_SPEC)
-=20
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0010-Us=
e-the-multilib-config-files-from-B-instead-of-usin.patch b/meta-arm-toolc=
hain/recipes-devtools/gcc/gcc-arm-12.2/0010-Use-the-multilib-config-files=
-from-B-instead-of-usin.patch
deleted file mode 100644
index 45edc62e..00000000
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0010-Use-the-m=
ultilib-config-files-from-B-instead-of-usin.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From bf85b8bbcb4b77725d4c22c1bb25a29f6ff21038 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 09:33:04 +0400
-Subject: [PATCH] Use the multilib config files from ${B} instead of usin=
g the
- ones from ${S}
-
-Use the multilib config files from ${B} instead of using the ones from $=
{S}
-so that the source can be shared between gcc-cross-initial,
-gcc-cross-intermediate, gcc-cross, gcc-runtime, and also the sdk build.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
-
-Upstream-Status: Inappropriate [configuration]
----
- gcc/configure    | 22 ++++++++++++++++++----
- gcc/configure.ac | 22 ++++++++++++++++++----
- 2 files changed, 36 insertions(+), 8 deletions(-)
-
-diff --git a/gcc/configure b/gcc/configure
-index 3fc0e2f5813..2f0f0e057a9 100755
---- a/gcc/configure
-+++ b/gcc/configure
-@@ -13361,10 +13361,20 @@ done
- tmake_file_=3D
- for f in ${tmake_file}
- do
--	if test -f ${srcdir}/config/$f
--	then
--		tmake_file_=3D"${tmake_file_} \$(srcdir)/config/$f"
--	fi
-+  case $f in
-+    */t-linux64 )
-+       if test -f ./config/$f
-+       then
-+         tmake_file_=3D"${tmake_file_} ./config/$f"
-+       fi
-+       ;;
-+    * )
-+       if test -f ${srcdir}/config/$f
-+       then
-+         tmake_file_=3D"${tmake_file_} \$(srcdir)/config/$f"
-+       fi
-+       ;;
-+  esac
- done
- tmake_file=3D"${tmake_file_}${omp_device_property_tmake_file}"
-=20
-@@ -13375,6 +13385,10 @@ tm_file_list=3D"options.h"
- tm_include_list=3D"options.h insn-constants.h"
- for f in $tm_file; do
-   case $f in
-+    */linux64.h )
-+       tm_file_list=3D"${tm_file_list} ./config/$f"
-+       tm_include_list=3D"${tm_include_list} ./config/$f"
-+       ;;
-     ./* )
-        f=3D`echo $f | sed 's/^..//'`
-        tm_file_list=3D"${tm_file_list} $f"
-diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 46de496b256..6155b83a732 100644
---- a/gcc/configure.ac
-+++ b/gcc/configure.ac
-@@ -2312,10 +2312,20 @@ done
- tmake_file_=3D
- for f in ${tmake_file}
- do
--	if test -f ${srcdir}/config/$f
--	then
--		tmake_file_=3D"${tmake_file_} \$(srcdir)/config/$f"
--	fi
-+  case $f in
-+    */t-linux64 )
-+       if test -f ./config/$f
-+       then
-+         tmake_file_=3D"${tmake_file_} ./config/$f"
-+       fi
-+       ;;
-+    * )
-+       if test -f ${srcdir}/config/$f
-+       then
-+         tmake_file_=3D"${tmake_file_} \$(srcdir)/config/$f"
-+       fi
-+       ;;
-+  esac
- done
- tmake_file=3D"${tmake_file_}${omp_device_property_tmake_file}"
-=20
-@@ -2326,6 +2336,10 @@ tm_file_list=3D"options.h"
- tm_include_list=3D"options.h insn-constants.h"
- for f in $tm_file; do
-   case $f in
-+    */linux64.h )
-+       tm_file_list=3D"${tm_file_list} ./config/$f"
-+       tm_include_list=3D"${tm_include_list} ./config/$f"
-+       ;;
-     ./* )
-        f=3D`echo $f | sed 's/^..//'`
-        tm_file_list=3D"${tm_file_list} $f"
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0011-Av=
oid-using-libdir-from-.la-which-usually-points-to-.patch b/meta-arm-toolc=
hain/recipes-devtools/gcc/gcc-arm-12.2/0011-Avoid-using-libdir-from-.la-w=
hich-usually-points-to-.patch
deleted file mode 100644
index 352c6eec..00000000
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0011-Avoid-usi=
ng-libdir-from-.la-which-usually-points-to-.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From e5463727ff028cee5e452da38f5b4c44d52e412e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 20 Feb 2015 09:39:38 +0000
-Subject: [PATCH] Avoid using libdir from .la which usually points to a h=
ost
- path
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Jonathan Liu <net147@gmail.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- ltmain.sh | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/ltmain.sh b/ltmain.sh
-index ee938056bef..9ebc7e3d1e0 100644
---- a/ltmain.sh
-+++ b/ltmain.sh
-@@ -5628,6 +5628,9 @@ func_mode_link ()
- 	    absdir=3D"$abs_ladir"
- 	    libdir=3D"$abs_ladir"
- 	  else
-+	    # Instead of using libdir from .la which usually points to a host =
path,
-+	    # use the path the .la is contained in.
-+	    libdir=3D"$abs_ladir"
- 	    dir=3D"$libdir"
- 	    absdir=3D"$libdir"
- 	  fi
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0013-En=
sure-target-gcc-headers-can-be-included.patch b/meta-arm-toolchain/recipe=
s-devtools/gcc/gcc-arm-12.2/0013-Ensure-target-gcc-headers-can-be-include=
d.patch
deleted file mode 100644
index 61e61ecc..00000000
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0013-Ensure-ta=
rget-gcc-headers-can-be-included.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-From 612801d426e75ff997cfabda380dbe52c2cbc532 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 20 Feb 2015 10:25:11 +0000
-Subject: [PATCH] Ensure target gcc headers can be included
-
-There are a few headers installed as part of the OpenEmbedded
-gcc-runtime target (omp.h, ssp/*.h). Being installed from a recipe
-built for the target architecture, these are within the target
-sysroot and not cross/nativesdk; thus they weren't able to be
-found by gcc with the existing search paths. Add support for
-picking up these headers under the sysroot supplied on the gcc
-command line in order to resolve this.
-
-Extend target gcc headers search to musl too
-
-Upstream-Status: Pending
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gcc/Makefile.in           | 2 ++
- gcc/config/linux.h        | 8 ++++++++
- gcc/config/rs6000/sysv4.h | 8 ++++++++
- gcc/cppdefault.cc         | 4 ++++
- 4 files changed, 22 insertions(+)
-
-diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index a8277254696..07fa63b6640 100644
---- a/gcc/Makefile.in
-+++ b/gcc/Makefile.in
-@@ -632,6 +632,7 @@ libexecdir =3D @libexecdir@
-=20
- # Directory in which the compiler finds libraries etc.
- libsubdir =3D $(libdir)/gcc/$(real_target_noncanonical)/$(version)$(acc=
el_dir_suffix)
-+libsubdir_target =3D $(target_noncanonical)/$(version)
- # Directory in which the compiler finds executables
- libexecsubdir =3D $(libexecdir)/gcc/$(real_target_noncanonical)/$(versi=
on)$(accel_dir_suffix)
- # Directory in which all plugin resources are installed
-@@ -3024,6 +3025,7 @@ CFLAGS-intl.o +=3D -DLOCALEDIR=3D\"$(localedir)\"
-=20
- PREPROCESSOR_DEFINES =3D \
-   -DGCC_INCLUDE_DIR=3D\"$(libsubdir)/include\" \
-+  -DGCC_INCLUDE_SUBDIR_TARGET=3D\"$(libsubdir_target)/include\" \
-   -DFIXED_INCLUDE_DIR=3D\"$(libsubdir)/include-fixed\" \
-   -DGPLUSPLUS_INCLUDE_DIR=3D\"$(gcc_gxx_include_dir)\" \
-   -DGPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT=3D$(gcc_gxx_include_dir_add_sysro=
ot) \
-diff --git a/gcc/config/linux.h b/gcc/config/linux.h
-index 4ce173384ef..8a3cd4f2d34 100644
---- a/gcc/config/linux.h
-+++ b/gcc/config/linux.h
-@@ -170,6 +170,13 @@ see the files COPYING3 and COPYING.RUNTIME respecti=
vely.  If not, see
- #define INCLUDE_DEFAULTS_MUSL_TOOL
- #endif
-=20
-+#ifdef GCC_INCLUDE_SUBDIR_TARGET
-+#define INCLUDE_DEFAULTS_MUSL_SUBDIR_TARGET		\
-+    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC", 0, =
0, 1, 0},
-+#else
-+#define INCLUDE_DEFAULTS_MUSL_SUBDIR_TARGET
-+#endif
-+
- #ifdef NATIVE_SYSTEM_HEADER_DIR
- #define INCLUDE_DEFAULTS_MUSL_NATIVE			\
-     { NATIVE_SYSTEM_HEADER_DIR, 0, 0, 0, 1, 2 },	\
-@@ -196,6 +203,7 @@ see the files COPYING3 and COPYING.RUNTIME respectiv=
ely.  If not, see
-     INCLUDE_DEFAULTS_MUSL_PREFIX			\
-     INCLUDE_DEFAULTS_MUSL_CROSS				\
-     INCLUDE_DEFAULTS_MUSL_TOOL				\
-+    INCLUDE_DEFAULTS_MUSL_SUBDIR_TARGET			\
-     INCLUDE_DEFAULTS_MUSL_NATIVE			\
-     { GCC_INCLUDE_DIR, "GCC", 0, 1, 0, 0 },		\
-     { 0, 0, 0, 0, 0, 0 }				\
-diff --git a/gcc/config/rs6000/sysv4.h b/gcc/config/rs6000/sysv4.h
-index a73954d9de5..e5dd6538358 100644
---- a/gcc/config/rs6000/sysv4.h
-+++ b/gcc/config/rs6000/sysv4.h
-@@ -994,6 +994,13 @@ ncrtn.o%s"
- #define INCLUDE_DEFAULTS_MUSL_TOOL
- #endif
-=20
-+#ifdef GCC_INCLUDE_SUBDIR_TARGET
-+#define INCLUDE_DEFAULTS_MUSL_SUBDIR_TARGET            \
-+    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC", 0, =
0, 1, 0},
-+#else
-+#define INCLUDE_DEFAULTS_MUSL_SUBDIR_TARGET
-+#endif
-+
- #ifdef NATIVE_SYSTEM_HEADER_DIR
- #define INCLUDE_DEFAULTS_MUSL_NATIVE			\
-     { NATIVE_SYSTEM_HEADER_DIR, 0, 0, 0, 1, 2 },	\
-@@ -1020,6 +1027,7 @@ ncrtn.o%s"
-     INCLUDE_DEFAULTS_MUSL_PREFIX			\
-     INCLUDE_DEFAULTS_MUSL_CROSS				\
-     INCLUDE_DEFAULTS_MUSL_TOOL				\
-+    INCLUDE_DEFAULTS_MUSL_SUBDIR_TARGET			\
-     INCLUDE_DEFAULTS_MUSL_NATIVE			\
-     { GCC_INCLUDE_DIR, "GCC", 0, 1, 0, 0 },		\
-     { 0, 0, 0, 0, 0, 0 }				\
-diff --git a/gcc/cppdefault.cc b/gcc/cppdefault.cc
-index 7888300f277..52cf14e92f8 100644
---- a/gcc/cppdefault.cc
-+++ b/gcc/cppdefault.cc
-@@ -64,6 +64,10 @@ const struct default_include cpp_include_defaults[]
-     /* This is the dir for gcc's private headers.  */
-     { GCC_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
- #endif
-+#ifdef GCC_INCLUDE_SUBDIR_TARGET
-+    /* This is the dir for gcc's private headers under the specified sy=
sroot.  */
-+    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC", 0, =
0, 1, 0 },
-+#endif
- #ifdef LOCAL_INCLUDE_DIR
-     /* /usr/local/include comes before the fixincluded header files.  *=
/
-     { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0014-Do=
n-t-search-host-directory-during-relink-if-inst_pr.patch b/meta-arm-toolc=
hain/recipes-devtools/gcc/gcc-arm-12.2/0014-Don-t-search-host-directory-d=
uring-relink-if-inst_pr.patch
deleted file mode 100644
index 94308b2a..00000000
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0014-Don-t-sea=
rch-host-directory-during-relink-if-inst_pr.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 9ae49e7b88c208ab79ec9c2fc4a2fa8a3f1e85bb Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 3 Mar 2015 08:21:19 +0000
-Subject: [PATCH] Don't search host directory during "relink" if $inst_pr=
efix
- is provided
-
-http://lists.gnu.org/archive/html/libtool-patches/2011-01/msg00026.html
-
-Upstream-Status: Submitted
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- ltmain.sh | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/ltmain.sh b/ltmain.sh
-index 9ebc7e3d1e0..7ea79fa8be6 100644
---- a/ltmain.sh
-+++ b/ltmain.sh
-@@ -6004,12 +6004,13 @@ func_mode_link ()
- 	      fi
- 	    else
- 	      # We cannot seem to hardcode it, guess we'll fake it.
-+	      # Default if $libdir is not relative to the prefix:
- 	      add_dir=3D"-L$libdir"
--	      # Try looking first in the location we're being installed to.
-+
- 	      if test -n "$inst_prefix_dir"; then
- 		case $libdir in
- 		  [\\/]*)
--		    add_dir=3D"$add_dir -L$inst_prefix_dir$libdir"
-+		    add_dir=3D"-L$inst_prefix_dir$libdir"
- 		    ;;
- 		esac
- 	      fi
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0015-li=
bcc1-fix-libcc1-s-install-path-and-rpath.patch b/meta-arm-toolchain/recip=
es-devtools/gcc/gcc-arm-12.2/0015-libcc1-fix-libcc1-s-install-path-and-rp=
ath.patch
deleted file mode 100644
index ce9635ce..00000000
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0015-libcc1-fi=
x-libcc1-s-install-path-and-rpath.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From bf918db7117f41d3c04162095641165ca241707d Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Sun, 5 Jul 2015 20:25:18 -0700
-Subject: [PATCH] libcc1: fix libcc1's install path and rpath
-
-* Install libcc1.so and libcc1plugin.so into
-  $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_version), as what we
-  had done to lto-plugin.
-* Fix bad RPATH iussue:
-  gcc-5.2.0: package gcc-plugins contains bad RPATH /patht/to/tmp/sysroo=
ts/qemux86-64/usr/lib64/../lib64 in file
- /path/to/gcc/5.2.0-r0/packages-split/gcc-plugins/usr/lib64/gcc/x86_64-p=
oky-linux/5.2.0/plugin/libcc1plugin.so.0.0.0
- [rpaths]
-
-Upstream-Status: Inappropriate [OE configuration]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- libcc1/Makefile.am | 4 ++--
- libcc1/Makefile.in | 4 ++--
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/libcc1/Makefile.am b/libcc1/Makefile.am
-index 6e3a34ff7e2..3f3f6391aba 100644
---- a/libcc1/Makefile.am
-+++ b/libcc1/Makefile.am
-@@ -40,8 +40,8 @@ libiberty =3D $(if $(wildcard $(libiberty_noasan)),$(W=
c)$(libiberty_noasan), \
- 	    $(Wc)$(libiberty_normal)))
- libiberty_dep =3D $(patsubst $(Wc)%,%,$(libiberty))
-=20
--plugindir =3D $(libdir)/gcc/$(target_noncanonical)/$(gcc_version)/plugi=
n
--cc1libdir =3D $(libdir)/$(libsuffix)
-+cc1libdir =3D $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_version)
-+plugindir =3D $(cc1libdir)
-=20
- if ENABLE_PLUGIN
- plugin_LTLIBRARIES =3D libcc1plugin.la libcp1plugin.la
-diff --git a/libcc1/Makefile.in b/libcc1/Makefile.in
-index f8f590d71e9..56462492045 100644
---- a/libcc1/Makefile.in
-+++ b/libcc1/Makefile.in
-@@ -396,8 +396,8 @@ libiberty =3D $(if $(wildcard $(libiberty_noasan)),$=
(Wc)$(libiberty_noasan), \
- 	    $(Wc)$(libiberty_normal)))
-=20
- libiberty_dep =3D $(patsubst $(Wc)%,%,$(libiberty))
--plugindir =3D $(libdir)/gcc/$(target_noncanonical)/$(gcc_version)/plugi=
n
--cc1libdir =3D $(libdir)/$(libsuffix)
-+cc1libdir =3D $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_version)
-+plugindir =3D $(cc1libdir)
- @ENABLE_PLUGIN_TRUE@plugin_LTLIBRARIES =3D libcc1plugin.la libcp1plugin=
.la
- @ENABLE_PLUGIN_TRUE@cc1lib_LTLIBRARIES =3D libcc1.la
- shared_source =3D callbacks.cc callbacks.hh connection.cc connection.hh=
 \
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0016-ha=
ndle-sysroot-support-for-nativesdk-gcc.patch b/meta-arm-toolchain/recipes=
-devtools/gcc/gcc-arm-12.2/0016-handle-sysroot-support-for-nativesdk-gcc.=
patch
deleted file mode 100644
index 3b547195..00000000
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0016-handle-sy=
sroot-support-for-nativesdk-gcc.patch
+++ /dev/null
@@ -1,510 +0,0 @@
-From 4fbbd40d7db89cdbeaf93df1e1da692b1f80a5bc Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 7 Dec 2015 23:39:54 +0000
-Subject: [PATCH] handle sysroot support for nativesdk-gcc
-
-Being able to build a nativesdk gcc is useful, particularly in cases
-where the host compiler may be of an incompatible version (or a 32
-bit compiler is needed).
-
-Sadly, building nativesdk-gcc is not straight forward. We install
-nativesdk-gcc into a relocatable location and this means that its
-library locations can change. "Normal" sysroot support doesn't help
-in this case since the values of paths like "libdir" change, not just
-base root directory of the system.
-
-In order to handle this we do two things:
-
-a) Add %r into spec file markup which can be used for injected paths
-   such as SYSTEMLIBS_DIR (see gcc_multilib_setup()).
-b) Add other paths which need relocation into a .gccrelocprefix section
-   which the relocation code will notice and adjust automatically.
-
-Upstream-Status: Inappropriate
-RP 2015/7/28
-
-Extend the gccrelocprefix support to musl config too, this ensures
-that gcc will get right bits in SDK installations
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Added PREFIXVAR and EXEC_PREFIXVAR to support runtime relocation.  Witho=
ut
-these as part of the gccrelocprefix the system can't do runtime relocati=
on
-if the executable is moved.  (These paths were missed in the original
-implementation.)
-
-Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
----
- gcc/c-family/c-opts.cc    |  4 +--
- gcc/config/linux.h        | 24 +++++++--------
- gcc/config/rs6000/sysv4.h | 24 +++++++--------
- gcc/cppdefault.cc         | 63 ++++++++++++++++++++++++---------------
- gcc/cppdefault.h          | 13 ++++----
- gcc/gcc.cc                | 20 +++++++++----
- gcc/incpath.cc            | 12 ++++----
- gcc/prefix.cc             |  6 ++--
- 8 files changed, 94 insertions(+), 72 deletions(-)
-
-diff --git a/gcc/c-family/c-opts.cc b/gcc/c-family/c-opts.cc
-index a341a061758..83b0bef4dbb 100644
---- a/gcc/c-family/c-opts.cc
-+++ b/gcc/c-family/c-opts.cc
-@@ -1458,8 +1458,8 @@ add_prefixed_path (const char *suffix, incpath_kin=
d chain)
-   size_t prefix_len, suffix_len;
-=20
-   suffix_len =3D strlen (suffix);
--  prefix     =3D iprefix ? iprefix : cpp_GCC_INCLUDE_DIR;
--  prefix_len =3D iprefix ? strlen (iprefix) : cpp_GCC_INCLUDE_DIR_len;
-+  prefix     =3D iprefix ? iprefix : GCC_INCLUDE_DIRVAR;
-+  prefix_len =3D iprefix ? strlen (iprefix) : strlen(GCC_INCLUDE_DIRVAR=
) - 7;
-=20
-   path =3D (char *) xmalloc (prefix_len + suffix_len + 1);
-   memcpy (path, prefix, prefix_len);
-diff --git a/gcc/config/linux.h b/gcc/config/linux.h
-index 8a3cd4f2d34..58143dff731 100644
---- a/gcc/config/linux.h
-+++ b/gcc/config/linux.h
-@@ -134,53 +134,53 @@ see the files COPYING3 and COPYING.RUNTIME respect=
ively.  If not, see
-  * Unfortunately, this is mostly duplicated from cppdefault.cc */
- #if DEFAULT_LIBC =3D=3D LIBC_MUSL
- #define INCLUDE_DEFAULTS_MUSL_GPP			\
--    { GPLUSPLUS_INCLUDE_DIR, "G++", 1, 1,		\
-+    { GPLUSPLUS_INCLUDE_DIRVAR, "G++", 1, 1,		\
-       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },		\
--    { GPLUSPLUS_TOOL_INCLUDE_DIR, "G++", 1, 1,		\
-+    { GPLUSPLUS_TOOL_INCLUDE_DIRVAR, "G++", 1, 1,	\
-       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 1 },		\
--    { GPLUSPLUS_BACKWARD_INCLUDE_DIR, "G++", 1, 1,	\
-+    { GPLUSPLUS_BACKWARD_INCLUDE_DIRVAR, "G++", 1, 1,	\
-       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
-=20
- #ifdef LOCAL_INCLUDE_DIR
- #define INCLUDE_DEFAULTS_MUSL_LOCAL			\
--    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },		\
--    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 0 },
-+    { LOCAL_INCLUDE_DIRVAR, 0, 0, 1, 1, 2 },		\
-+    { LOCAL_INCLUDE_DIRVAR, 0, 0, 1, 1, 0 },
- #else
- #define INCLUDE_DEFAULTS_MUSL_LOCAL
- #endif
-=20
- #ifdef PREFIX_INCLUDE_DIR
- #define INCLUDE_DEFAULTS_MUSL_PREFIX			\
--    { PREFIX_INCLUDE_DIR, 0, 0, 1, 0, 0},
-+    { PREFIX_INCLUDE_DIRVAR, 0, 0, 1, 0, 0},
- #else
- #define INCLUDE_DEFAULTS_MUSL_PREFIX
- #endif
-=20
- #ifdef CROSS_INCLUDE_DIR
- #define INCLUDE_DEFAULTS_MUSL_CROSS			\
--    { CROSS_INCLUDE_DIR, "GCC", 0, 0, 0, 0},
-+    { CROSS_INCLUDE_DIRVAR, "GCC", 0, 0, 0, 0},
- #else
- #define INCLUDE_DEFAULTS_MUSL_CROSS
- #endif
-=20
- #ifdef TOOL_INCLUDE_DIR
- #define INCLUDE_DEFAULTS_MUSL_TOOL			\
--    { TOOL_INCLUDE_DIR, "BINUTILS", 0, 1, 0, 0},
-+    { TOOL_INCLUDE_DIRVAR, "BINUTILS", 0, 1, 0, 0},
- #else
- #define INCLUDE_DEFAULTS_MUSL_TOOL
- #endif
-=20
- #ifdef GCC_INCLUDE_SUBDIR_TARGET
- #define INCLUDE_DEFAULTS_MUSL_SUBDIR_TARGET		\
--    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC", 0, =
0, 1, 0},
-+    { STANDARD_STARTFILE_PREFIX_2VAR, "GCC", 0, 0, 1, 0},
- #else
- #define INCLUDE_DEFAULTS_MUSL_SUBDIR_TARGET
- #endif
-=20
- #ifdef NATIVE_SYSTEM_HEADER_DIR
- #define INCLUDE_DEFAULTS_MUSL_NATIVE			\
--    { NATIVE_SYSTEM_HEADER_DIR, 0, 0, 0, 1, 2 },	\
--    { NATIVE_SYSTEM_HEADER_DIR, 0, 0, 0, 1, 0 },
-+    { NATIVE_SYSTEM_HEADER_DIRVAR, 0, 0, 0, 1, 2 },	\
-+    { NATIVE_SYSTEM_HEADER_DIRVAR, 0, 0, 0, 1, 0 },
- #else
- #define INCLUDE_DEFAULTS_MUSL_NATIVE
- #endif
-@@ -205,7 +205,7 @@ see the files COPYING3 and COPYING.RUNTIME respectiv=
ely.  If not, see
-     INCLUDE_DEFAULTS_MUSL_TOOL				\
-     INCLUDE_DEFAULTS_MUSL_SUBDIR_TARGET			\
-     INCLUDE_DEFAULTS_MUSL_NATIVE			\
--    { GCC_INCLUDE_DIR, "GCC", 0, 1, 0, 0 },		\
-+    { GCC_INCLUDE_DIRVAR, "GCC", 0, 1, 0, 0 },		\
-     { 0, 0, 0, 0, 0, 0 }				\
-   }
- #endif
-diff --git a/gcc/config/rs6000/sysv4.h b/gcc/config/rs6000/sysv4.h
-index e5dd6538358..b496849b792 100644
---- a/gcc/config/rs6000/sysv4.h
-+++ b/gcc/config/rs6000/sysv4.h
-@@ -958,53 +958,53 @@ ncrtn.o%s"
- /* Include order changes for musl, same as in generic linux.h.  */
- #if DEFAULT_LIBC =3D=3D LIBC_MUSL
- #define INCLUDE_DEFAULTS_MUSL_GPP			\
--    { GPLUSPLUS_INCLUDE_DIR, "G++", 1, 1,		\
-+    { GPLUSPLUS_INCLUDE_DIRVAR, "G++", 1, 1,		\
-       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },		\
--    { GPLUSPLUS_TOOL_INCLUDE_DIR, "G++", 1, 1,		\
-+    { GPLUSPLUS_TOOL_INCLUDE_DIRVAR, "G++", 1, 1,	\
-       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 1 },		\
--    { GPLUSPLUS_BACKWARD_INCLUDE_DIR, "G++", 1, 1,	\
-+    { GPLUSPLUS_BACKWARD_INCLUDE_DIRVAR, "G++", 1, 1,	\
-       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
-=20
- #ifdef LOCAL_INCLUDE_DIR
- #define INCLUDE_DEFAULTS_MUSL_LOCAL			\
--    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },		\
--    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 0 },
-+    { LOCAL_INCLUDE_DIRVAR, 0, 0, 1, 1, 2 },		\
-+    { LOCAL_INCLUDE_DIRVAR, 0, 0, 1, 1, 0 },
- #else
- #define INCLUDE_DEFAULTS_MUSL_LOCAL
- #endif
-=20
- #ifdef PREFIX_INCLUDE_DIR
- #define INCLUDE_DEFAULTS_MUSL_PREFIX			\
--    { PREFIX_INCLUDE_DIR, 0, 0, 1, 0, 0},
-+    { PREFIX_INCLUDE_DIRVAR, 0, 0, 1, 0, 0},
- #else
- #define INCLUDE_DEFAULTS_MUSL_PREFIX
- #endif
-=20
- #ifdef CROSS_INCLUDE_DIR
- #define INCLUDE_DEFAULTS_MUSL_CROSS			\
--    { CROSS_INCLUDE_DIR, "GCC", 0, 0, 0, 0},
-+    { CROSS_INCLUDE_DIRVAR, "GCC", 0, 0, 0, 0},
- #else
- #define INCLUDE_DEFAULTS_MUSL_CROSS
- #endif
-=20
- #ifdef TOOL_INCLUDE_DIR
- #define INCLUDE_DEFAULTS_MUSL_TOOL			\
--    { TOOL_INCLUDE_DIR, "BINUTILS", 0, 1, 0, 0},
-+    { TOOL_INCLUDE_DIRVAR, "BINUTILS", 0, 1, 0, 0},
- #else
- #define INCLUDE_DEFAULTS_MUSL_TOOL
- #endif
-=20
- #ifdef GCC_INCLUDE_SUBDIR_TARGET
- #define INCLUDE_DEFAULTS_MUSL_SUBDIR_TARGET            \
--    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC", 0, =
0, 1, 0},
-+    { STANDARD_STARTFILE_PREFIX_2VAR, "GCC", 0, 0, 1, 0},
- #else
- #define INCLUDE_DEFAULTS_MUSL_SUBDIR_TARGET
- #endif
-=20
- #ifdef NATIVE_SYSTEM_HEADER_DIR
- #define INCLUDE_DEFAULTS_MUSL_NATIVE			\
--    { NATIVE_SYSTEM_HEADER_DIR, 0, 0, 0, 1, 2 },	\
--    { NATIVE_SYSTEM_HEADER_DIR, 0, 0, 0, 1, 0 },
-+    { NATIVE_SYSTEM_HEADER_DIRVAR, 0, 0, 0, 1, 2 },	\
-+    { NATIVE_SYSTEM_HEADER_DIRVAR, 0, 0, 0, 1, 0 },
- #else
- #define INCLUDE_DEFAULTS_MUSL_NATIVE
- #endif
-@@ -1029,7 +1029,7 @@ ncrtn.o%s"
-     INCLUDE_DEFAULTS_MUSL_TOOL				\
-     INCLUDE_DEFAULTS_MUSL_SUBDIR_TARGET			\
-     INCLUDE_DEFAULTS_MUSL_NATIVE			\
--    { GCC_INCLUDE_DIR, "GCC", 0, 1, 0, 0 },		\
-+    { GCC_INCLUDE_DIRVAR, "GCC", 0, 1, 0, 0 },		\
-     { 0, 0, 0, 0, 0, 0 }				\
-   }
- #endif
-diff --git a/gcc/cppdefault.cc b/gcc/cppdefault.cc
-index 52cf14e92f8..d8977afc05e 100644
---- a/gcc/cppdefault.cc
-+++ b/gcc/cppdefault.cc
-@@ -35,6 +35,30 @@
- # undef CROSS_INCLUDE_DIR
- #endif
-=20
-+static char GPLUSPLUS_INCLUDE_DIRVAR[4096] __attribute__ ((section (".g=
ccrelocprefix"))) =3D GPLUSPLUS_INCLUDE_DIR;
-+char GCC_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix=
"))) =3D GCC_INCLUDE_DIR;
-+static char GPLUSPLUS_TOOL_INCLUDE_DIRVAR[4096] __attribute__ ((section=
 (".gccrelocprefix"))) =3D GPLUSPLUS_TOOL_INCLUDE_DIR;
-+static char GPLUSPLUS_BACKWARD_INCLUDE_DIRVAR[4096] __attribute__ ((sec=
tion (".gccrelocprefix"))) =3D GPLUSPLUS_BACKWARD_INCLUDE_DIR;
-+static char STANDARD_STARTFILE_PREFIX_2VAR[4096] __attribute__ ((sectio=
n (".gccrelocprefix"))) =3D STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDI=
R_TARGET;
-+#ifdef LOCAL_INCLUDE_DIR
-+static char LOCAL_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccre=
locprefix"))) =3D LOCAL_INCLUDE_DIR;
-+#endif
-+#ifdef PREFIX_INCLUDE_DIR
-+static char PREFIX_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccr=
elocprefix"))) =3D PREFIX_INCLUDE_DIR;
-+#endif
-+#ifdef FIXED_INCLUDE_DIR
-+static char FIXED_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccre=
locprefix"))) =3D FIXED_INCLUDE_DIR;
-+#endif
-+#ifdef CROSS_INCLUDE_DIR
-+static char CROSS_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccre=
locprefix"))) =3D CROSS_INCLUDE_DIR;
-+#endif
-+#ifdef TOOL_INCLUDE_DIR
-+static char TOOL_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrel=
ocprefix"))) =3D TOOL_INCLUDE_DIR;
-+#endif
-+#ifdef NATIVE_SYSTEM_HEADER_DIR
-+static char NATIVE_SYSTEM_HEADER_DIRVAR[4096] __attribute__ ((section (=
".gccrelocprefix"))) =3D NATIVE_SYSTEM_HEADER_DIR;
-+#endif
-+
- const struct default_include cpp_include_defaults[]
- #ifdef INCLUDE_DEFAULTS
- =3D INCLUDE_DEFAULTS;
-@@ -42,17 +66,17 @@ const struct default_include cpp_include_defaults[]
- =3D {
- #ifdef GPLUSPLUS_INCLUDE_DIR
-     /* Pick up GNU C++ generic include files.  */
--    { GPLUSPLUS_INCLUDE_DIR, "G++", 1, 1,
-+    { GPLUSPLUS_INCLUDE_DIRVAR, "G++", 1, 1,
-       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
- #endif
- #ifdef GPLUSPLUS_TOOL_INCLUDE_DIR
-     /* Pick up GNU C++ target-dependent include files.  */
--    { GPLUSPLUS_TOOL_INCLUDE_DIR, "G++", 1, 1,
-+    { GPLUSPLUS_TOOL_INCLUDE_DIRVAR, "G++", 1, 1,
-       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 1 },
- #endif
- #ifdef GPLUSPLUS_BACKWARD_INCLUDE_DIR
-     /* Pick up GNU C++ backward and deprecated include files.  */
--    { GPLUSPLUS_BACKWARD_INCLUDE_DIR, "G++", 1, 1,
-+    { GPLUSPLUS_BACKWARD_INCLUDE_DIRVAR, "G++", 1, 1,
-       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
- #endif
- #ifdef GPLUSPLUS_LIBCXX_INCLUDE_DIR
-@@ -62,23 +86,23 @@ const struct default_include cpp_include_defaults[]
- #endif
- #ifdef GCC_INCLUDE_DIR
-     /* This is the dir for gcc's private headers.  */
--    { GCC_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
-+    { GCC_INCLUDE_DIRVAR, "GCC", 0, 0, 0, 0 },
- #endif
- #ifdef GCC_INCLUDE_SUBDIR_TARGET
-     /* This is the dir for gcc's private headers under the specified sy=
sroot.  */
--    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC", 0, =
0, 1, 0 },
-+    { STANDARD_STARTFILE_PREFIX_2VAR, "GCC", 0, 0, 1, 0 },
- #endif
- #ifdef LOCAL_INCLUDE_DIR
-     /* /usr/local/include comes before the fixincluded header files.  *=
/
--    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },
--    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 0 },
-+    { LOCAL_INCLUDE_DIRVAR, 0, 0, 1, 1, 2 },
-+    { LOCAL_INCLUDE_DIRVAR, 0, 0, 1, 1, 0 },
- #endif
- #ifdef PREFIX_INCLUDE_DIR
--    { PREFIX_INCLUDE_DIR, 0, 0, 1, 0, 0 },
-+    { PREFIX_INCLUDE_DIRVAR, 0, 0, 1, 0, 0 },
- #endif
- #ifdef FIXED_INCLUDE_DIR
-     /* This is the dir for fixincludes.  */
--    { FIXED_INCLUDE_DIR, "GCC", 0, 0, 0,
-+    { FIXED_INCLUDE_DIRVAR, "GCC", 0, 0, 0,
-       /* A multilib suffix needs adding if different multilibs use
- 	 different headers.  */
- #ifdef SYSROOT_HEADERS_SUFFIX_SPEC
-@@ -90,33 +114,24 @@ const struct default_include cpp_include_defaults[]
- #endif
- #ifdef CROSS_INCLUDE_DIR
-     /* One place the target system's headers might be.  */
--    { CROSS_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
-+    { CROSS_INCLUDE_DIRVAR, "GCC", 0, 0, 0, 0 },
- #endif
- #ifdef TOOL_INCLUDE_DIR
-     /* Another place the target system's headers might be.  */
--    { TOOL_INCLUDE_DIR, "BINUTILS", 0, 1, 0, 0 },
-+    { TOOL_INCLUDE_DIRVAR, "BINUTILS", 0, 1, 0, 0 },
- #endif
- #ifdef NATIVE_SYSTEM_HEADER_DIR
-     /* /usr/include comes dead last.  */
--    { NATIVE_SYSTEM_HEADER_DIR, NATIVE_SYSTEM_HEADER_COMPONENT, 0, 0, 1=
, 2 },
--    { NATIVE_SYSTEM_HEADER_DIR, NATIVE_SYSTEM_HEADER_COMPONENT, 0, 0, 1=
, 0 },
-+    { NATIVE_SYSTEM_HEADER_DIRVAR, NATIVE_SYSTEM_HEADER_COMPONENT, 0, 0=
, 1, 2 },
-+    { NATIVE_SYSTEM_HEADER_DIRVAR, NATIVE_SYSTEM_HEADER_COMPONENT, 0, 0=
, 1, 0 },
- #endif
-     { 0, 0, 0, 0, 0, 0 }
-   };
- #endif /* no INCLUDE_DEFAULTS */
-=20
--#ifdef GCC_INCLUDE_DIR
--const char cpp_GCC_INCLUDE_DIR[] =3D GCC_INCLUDE_DIR;
--const size_t cpp_GCC_INCLUDE_DIR_len =3D sizeof GCC_INCLUDE_DIR - 8;
--#else
--const char cpp_GCC_INCLUDE_DIR[] =3D "";
--const size_t cpp_GCC_INCLUDE_DIR_len =3D 0;
--#endif
--
- /* The configured prefix.  */
--const char cpp_PREFIX[] =3D PREFIX;
--const size_t cpp_PREFIX_len =3D sizeof PREFIX - 1;
--const char cpp_EXEC_PREFIX[] =3D STANDARD_EXEC_PREFIX;
-+char PREFIXVAR[4096] __attribute__ ((section (".gccrelocprefix"))) =3D =
PREFIX;
-+char EXEC_PREFIXVAR[4096] __attribute__ ((section (".gccrelocprefix")))=
 =3D STANDARD_EXEC_PREFIX;
-=20
- /* This value is set by cpp_relocated at runtime */
- const char *gcc_exec_prefix;
-diff --git a/gcc/cppdefault.h b/gcc/cppdefault.h
-index fb97c0b5814..6267150facc 100644
---- a/gcc/cppdefault.h
-+++ b/gcc/cppdefault.h
-@@ -33,7 +33,8 @@
-=20
- struct default_include
- {
--  const char *const fname;	/* The name of the directory.  */
-+  const char *fname;     /* The name of the directory.  */
-+
-   const char *const component;	/* The component containing the director=
y
- 				   (see update_path in prefix.cc) */
-   const char cplusplus;		/* When this is non-zero, we should only
-@@ -55,17 +56,13 @@ struct default_include
- };
-=20
- extern const struct default_include cpp_include_defaults[];
--extern const char cpp_GCC_INCLUDE_DIR[];
--extern const size_t cpp_GCC_INCLUDE_DIR_len;
-+extern char GCC_INCLUDE_DIRVAR[] __attribute__ ((section (".gccrelocpre=
fix")));
-=20
- /* The configure-time prefix, i.e., the value supplied as the argument
-    to --prefix=3D.  */
--extern const char cpp_PREFIX[];
-+extern char PREFIXVAR[] __attribute__ ((section (".gccrelocprefix")));
- /* The length of the configure-time prefix.  */
--extern const size_t cpp_PREFIX_len;
--/* The configure-time execution prefix.  This is typically the lib/gcc
--   subdirectory of cpp_PREFIX.  */
--extern const char cpp_EXEC_PREFIX[];
-+extern char EXEC_PREFIXVAR[] __attribute__ ((section (".gccrelocprefix"=
)));
- /* The run-time execution prefix.  This is typically the lib/gcc
-    subdirectory of the actual installation.  */
- extern const char *gcc_exec_prefix;
-diff --git a/gcc/gcc.cc b/gcc/gcc.cc
-index aa4cf92fb78..5569a39a14a 100644
---- a/gcc/gcc.cc
-+++ b/gcc/gcc.cc
-@@ -252,6 +252,8 @@ FILE *report_times_to_file =3D NULL;
- #endif
- static const char *target_system_root =3D DEFAULT_TARGET_SYSTEM_ROOT;
-=20
-+static char target_relocatable_prefix[4096] __attribute__ ((section (".=
gccrelocprefix"))) =3D SYSTEMLIBS_DIR;
-+
- /* Nonzero means pass the updated target_system_root to the compiler.  =
*/
-=20
- static int target_system_root_changed;
-@@ -575,6 +577,7 @@ or with constant text in a single argument.
-  %G     process LIBGCC_SPEC as a spec.
-  %R     Output the concatenation of target_system_root and
-         target_sysroot_suffix.
-+ %r     Output the base path target_relocatable_prefix
-  %S     process STARTFILE_SPEC as a spec.  A capital S is actually used=
 here.
-  %E     process ENDFILE_SPEC as a spec.  A capital E is actually used h=
ere.
-  %C     process CPP_SPEC as a spec.
-@@ -1627,10 +1630,10 @@ static const char *gcc_libexec_prefix;
-    gcc_exec_prefix is set because, in that case, we know where the
-    compiler has been installed, and use paths relative to that
-    location instead.  */
--static const char *const standard_exec_prefix =3D STANDARD_EXEC_PREFIX;
--static const char *const standard_libexec_prefix =3D STANDARD_LIBEXEC_P=
REFIX;
--static const char *const standard_bindir_prefix =3D STANDARD_BINDIR_PRE=
FIX;
--static const char *const standard_startfile_prefix =3D STANDARD_STARTFI=
LE_PREFIX;
-+static char standard_exec_prefix[4096] __attribute__ ((section (".gccre=
locprefix"))) =3D STANDARD_EXEC_PREFIX;
-+static char standard_libexec_prefix[4096] __attribute__ ((section (".gc=
crelocprefix"))) =3D STANDARD_LIBEXEC_PREFIX;
-+static char standard_bindir_prefix[4096] __attribute__ ((section (".gcc=
relocprefix"))) =3D STANDARD_BINDIR_PREFIX;
-+static char *const standard_startfile_prefix =3D STANDARD_STARTFILE_PRE=
FIX;
-=20
- /* For native compilers, these are well-known paths containing
-    components that may be provided by the system.  For cross
-@@ -1638,9 +1641,9 @@ static const char *const standard_startfile_prefix=
 =3D STANDARD_STARTFILE_PREFIX;
- static const char *md_exec_prefix =3D MD_EXEC_PREFIX;
- static const char *md_startfile_prefix =3D MD_STARTFILE_PREFIX;
- static const char *md_startfile_prefix_1 =3D MD_STARTFILE_PREFIX_1;
--static const char *const standard_startfile_prefix_1
-+static char standard_startfile_prefix_1[4096] __attribute__ ((section (=
".gccrelocprefix")))
-   =3D STANDARD_STARTFILE_PREFIX_1;
--static const char *const standard_startfile_prefix_2
-+static char standard_startfile_prefix_2[4096] __attribute__ ((section (=
".gccrelocprefix")))
-   =3D STANDARD_STARTFILE_PREFIX_2;
-=20
- /* A relative path to be used in finding the location of tools
-@@ -6676,6 +6679,11 @@ do_spec_1 (const char *spec, int inswitch, const =
char *soft_matched_part)
- 	      }
- 	    break;
-=20
-+          case 'r':
-+              obstack_grow (&obstack, target_relocatable_prefix,
-+		      strlen (target_relocatable_prefix));
-+            break;
-+
- 	  case 'S':
- 	    value =3D do_spec_1 (startfile_spec, 0, NULL);
- 	    if (value !=3D 0)
-diff --git a/gcc/incpath.cc b/gcc/incpath.cc
-index c80f100f476..5ac03c08693 100644
---- a/gcc/incpath.cc
-+++ b/gcc/incpath.cc
-@@ -135,7 +135,7 @@ add_standard_paths (const char *sysroot, const char =
*iprefix,
-   int relocated =3D cpp_relocated ();
-   size_t len;
-=20
--  if (iprefix && (len =3D cpp_GCC_INCLUDE_DIR_len) !=3D 0)
-+  if (iprefix && (len =3D strlen(GCC_INCLUDE_DIRVAR) - 7) !=3D 0)
-     {
-       /* Look for directories that start with the standard prefix.
- 	 "Translate" them, i.e. replace /usr/local/lib/gcc... with
-@@ -150,7 +150,7 @@ add_standard_paths (const char *sysroot, const char =
*iprefix,
- 		 now.  */
- 	      if (sysroot && p->add_sysroot)
- 		continue;
--	      if (!filename_ncmp (p->fname, cpp_GCC_INCLUDE_DIR, len))
-+	      if (!filename_ncmp (p->fname, GCC_INCLUDE_DIRVAR, len))
- 		{
- 		  char *str =3D concat (iprefix, p->fname + len, NULL);
- 		  if (p->multilib =3D=3D 1 && imultilib)
-@@ -191,7 +191,7 @@ add_standard_paths (const char *sysroot, const char =
*iprefix,
- 	      free (sysroot_no_trailing_dir_separator);
- 	    }
- 	  else if (!p->add_sysroot && relocated
--		   && !filename_ncmp (p->fname, cpp_PREFIX, cpp_PREFIX_len))
-+		   && !filename_ncmp (p->fname, PREFIXVAR, strlen(PREFIXVAR)))
- 	    {
-  	      static const char *relocated_prefix;
- 	      char *ostr;
-@@ -208,12 +208,12 @@ add_standard_paths (const char *sysroot, const cha=
r *iprefix,
- 		  dummy =3D concat (gcc_exec_prefix, "dummy", NULL);
- 		  relocated_prefix
- 		    =3D make_relative_prefix (dummy,
--					    cpp_EXEC_PREFIX,
--					    cpp_PREFIX);
-+					    EXEC_PREFIXVAR,
-+					    PREFIXVAR);
- 		  free (dummy);
- 		}
- 	      ostr =3D concat (relocated_prefix,
--			     p->fname + cpp_PREFIX_len,
-+			     p->fname + strlen(PREFIXVAR),
- 			     NULL);
- 	      str =3D update_path (ostr, p->component);
- 	      free (ostr);
-diff --git a/gcc/prefix.cc b/gcc/prefix.cc
-index 096ed5afa3d..2526f0ecc39 100644
---- a/gcc/prefix.cc
-+++ b/gcc/prefix.cc
-@@ -72,7 +72,9 @@ License along with GCC; see the file COPYING3.  If not=
 see
- #include "prefix.h"
- #include "common/common-target.h"
-=20
--static const char *std_prefix =3D PREFIX;
-+char PREFIXVAR1[4096] __attribute__ ((section (".gccrelocprefix"))) =3D=
 PREFIX;
-+
-+static const char *std_prefix =3D PREFIXVAR1;
-=20
- static const char *get_key_value (char *);
- static char *translate_name (char *);
-@@ -212,7 +214,7 @@ translate_name (char *name)
- 	prefix =3D getenv (key);
-=20
-       if (prefix =3D=3D 0)
--	prefix =3D PREFIX;
-+	prefix =3D PREFIXVAR1;
-=20
-       /* We used to strip trailing DIR_SEPARATORs here, but that can
- 	 sometimes yield a result with no separator when one was coded
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0017-Se=
arch-target-sysroot-gcc-version-specific-dirs-with.patch b/meta-arm-toolc=
hain/recipes-devtools/gcc/gcc-arm-12.2/0017-Search-target-sysroot-gcc-ver=
sion-specific-dirs-with.patch
deleted file mode 100644
index 9b05da64..00000000
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0017-Search-ta=
rget-sysroot-gcc-version-specific-dirs-with.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From 33a1f07a4417247dc24819d4e583ca09f56d5a7b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 7 Dec 2015 23:41:45 +0000
-Subject: [PATCH] Search target sysroot gcc version specific dirs with
- multilib.
-
-We install the gcc libraries (such as crtbegin.p) into
-<sysroot><libdir>/<target-sys>/5.2.0/
-which is a default search path for GCC (aka multi_suffix in the
-code below). <target-sys> is 'machine' in gcc's terminology. We use
-these directories so that multiple gcc versions could in theory
-co-exist on target.
-
-We only want to build one gcc-cross-canadian per arch and have this work
-for all multilibs. <target-sys> can be handled by mapping the multilib
-<target-sys> to the one used by gcc-cross-canadian, e.g.
-mips64-polkmllib32-linux
-is symlinked to by mips64-poky-linux.
-
-The default gcc search path in the target sysroot for a "lib64" mutlilib
-is:
-
-<sysroot>/lib32/mips64-poky-linux/5.2.0/
-<sysroot>/lib32/../lib64/
-<sysroot>/usr/lib32/mips64-poky-linux/5.2.0/
-<sysroot>/usr/lib32/../lib64/
-<sysroot>/lib32/
-<sysroot>/usr/lib32/
-
-which means that the lib32 crtbegin.o will be found and the lib64 ones
-will not which leads to compiler failures.
-
-This patch injects a multilib version of that path first so the lib64
-binaries can be found first. With this change the search path becomes:
-
-<sysroot>/lib32/../lib64/mips64-poky-linux/5.2.0/
-<sysroot>/lib32/mips64-poky-linux/5.2.0/
-<sysroot>/lib32/../lib64/
-<sysroot>/usr/lib32/../lib64/mips64-poky-linux/5.2.0/
-<sysroot>/usr/lib32/mips64-poky-linux/5.2.0/
-<sysroot>/usr/lib32/../lib64/
-<sysroot>/lib32/
-<sysroot>/usr/lib32/
-
-Upstream-Status: Pending
-RP 2015/7/31
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gcc/gcc.cc | 29 ++++++++++++++++++++++++++++-
- 1 file changed, 28 insertions(+), 1 deletion(-)
-
-diff --git a/gcc/gcc.cc b/gcc/gcc.cc
-index 5569a39a14a..4598f6cd7c9 100644
---- a/gcc/gcc.cc
-+++ b/gcc/gcc.cc
-@@ -2817,7 +2817,7 @@ for_each_path (const struct path_prefix *paths,
-       if (path =3D=3D NULL)
- 	{
- 	  len =3D paths->max_len + extra_space + 1;
--	  len +=3D MAX (MAX (suffix_len, multi_os_dir_len), multiarch_len);
-+	  len +=3D MAX ((suffix_len + multi_os_dir_len), multiarch_len);
- 	  path =3D XNEWVEC (char, len);
- 	}
-=20
-@@ -2829,6 +2829,33 @@ for_each_path (const struct path_prefix *paths,
- 	  /* Look first in MACHINE/VERSION subdirectory.  */
- 	  if (!skip_multi_dir)
- 	    {
-+	      if (!(pl->os_multilib ? skip_multi_os_dir : skip_multi_dir))
-+	        {
-+	          const char *this_multi;
-+	          size_t this_multi_len;
-+
-+	          if (pl->os_multilib)
-+		    {
-+		      this_multi =3D multi_os_dir;
-+		      this_multi_len =3D multi_os_dir_len;
-+		    }
-+	          else
-+		    {
-+		      this_multi =3D multi_dir;
-+		      this_multi_len =3D multi_dir_len;
-+		    }
-+
-+	          /* Look in multilib MACHINE/VERSION subdirectory first */
-+	          if (this_multi_len)
-+	            {
-+		      memcpy (path + len, this_multi, this_multi_len + 1);
-+	              memcpy (path + len + this_multi_len, multi_suffix, suffi=
x_len + 1);
-+	              ret =3D callback (path, callback_info);
-+	                if (ret)
-+		          break;
-+	            }
-+	        }
-+
- 	      memcpy (path + len, multi_suffix, suffix_len + 1);
- 	      ret =3D callback (path, callback_info);
- 	      if (ret)
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0018-Ad=
d-ssp_nonshared-to-link-commandline-for-musl-targe.patch b/meta-arm-toolc=
hain/recipes-devtools/gcc/gcc-arm-12.2/0018-Add-ssp_nonshared-to-link-com=
mandline-for-musl-targe.patch
deleted file mode 100644
index 56793e03..00000000
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0018-Add-ssp_n=
onshared-to-link-commandline-for-musl-targe.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From d7dc2861840e88a4592817a398a054a886c3f3ee Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 27 Jun 2017 18:10:54 -0700
-Subject: [PATCH] Add ssp_nonshared to link commandline for musl targets
-
-when -fstack-protector options are enabled we need to
-link with ssp_shared on musl since it does not provide
-the __stack_chk_fail_local() so essentially it provides
-libssp but not libssp_nonshared something like
-TARGET_LIBC_PROVIDES_SSP_BUT_NOT_SSP_NONSHARED
- where-as for glibc the needed symbols
-are already present in libc_nonshared library therefore
-we do not need any library helper on glibc based systems
-but musl needs the libssp_noshared from gcc
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gcc/config/linux.h          |  7 +++++++
- gcc/config/rs6000/linux.h   | 10 ++++++++++
- gcc/config/rs6000/linux64.h | 10 ++++++++++
- 3 files changed, 27 insertions(+)
-
-diff --git a/gcc/config/linux.h b/gcc/config/linux.h
-index 58143dff731..d2409ccac26 100644
---- a/gcc/config/linux.h
-+++ b/gcc/config/linux.h
-@@ -208,6 +208,13 @@ see the files COPYING3 and COPYING.RUNTIME respecti=
vely.  If not, see
-     { GCC_INCLUDE_DIRVAR, "GCC", 0, 1, 0, 0 },		\
-     { 0, 0, 0, 0, 0, 0 }				\
-   }
-+#ifdef TARGET_LIBC_PROVIDES_SSP
-+#undef LINK_SSP_SPEC
-+#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
-+		       "|fstack-protector-strong|fstack-protector-explicit" \
-+		       ":-lssp_nonshared}"
-+#endif
-+
- #endif
-=20
- #if (DEFAULT_LIBC =3D=3D LIBC_UCLIBC) && defined (SINGLE_LIBC) /* uClin=
ux */
-diff --git a/gcc/config/rs6000/linux.h b/gcc/config/rs6000/linux.h
-index 8c9039ac1e5..259cd485973 100644
---- a/gcc/config/rs6000/linux.h
-+++ b/gcc/config/rs6000/linux.h
-@@ -99,6 +99,16 @@
- 					 " -m elf32ppclinux")
- #endif
-=20
-+/* link libssp_nonshared.a with musl */
-+#if DEFAULT_LIBC =3D=3D LIBC_MUSL
-+#ifdef TARGET_LIBC_PROVIDES_SSP
-+#undef LINK_SSP_SPEC
-+#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
-+		       "|fstack-protector-strong|fstack-protector-explicit" \
-+		       ":-lssp_nonshared}"
-+#endif
-+#endif
-+
- #undef LINK_OS_LINUX_SPEC
- #define LINK_OS_LINUX_SPEC LINK_OS_LINUX_EMUL " %{!shared: %{!static: \
-   %{!static-pie: \
-diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
-index 364c1a5b155..e33d9ae98e0 100644
---- a/gcc/config/rs6000/linux64.h
-+++ b/gcc/config/rs6000/linux64.h
-@@ -372,6 +372,16 @@ extern int dot_symbols;
- 					   " -m elf64ppc")
- #endif
-=20
-+/* link libssp_nonshared.a with musl */
-+#if DEFAULT_LIBC =3D=3D LIBC_MUSL
-+#ifdef TARGET_LIBC_PROVIDES_SSP
-+#undef LINK_SSP_SPEC
-+#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
-+		       "|fstack-protector-strong|fstack-protector-explicit" \
-+		       ":-lssp_nonshared}"
-+#endif
-+#endif
-+
- #define LINK_OS_LINUX_SPEC32 LINK_OS_LINUX_EMUL32 " %{!shared: %{!stati=
c: \
-   %{!static-pie: \
-     %{rdynamic:-export-dynamic} \
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0019-Re=
-introduce-spe-commandline-options.patch b/meta-arm-toolchain/recipes-dev=
tools/gcc/gcc-arm-12.2/0019-Re-introduce-spe-commandline-options.patch
deleted file mode 100644
index bb1699be..00000000
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0019-Re-introd=
uce-spe-commandline-options.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From bf0d7c463e1fab62804556099b56319fe94be1eb Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 6 Jun 2018 12:10:22 -0700
-Subject: [PATCH] Re-introduce spe commandline options
-
-This should ensure that we keep accepting
-spe options
-
-Upstream-Status: Inappropriate [SPE port is removed from rs600 port]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gcc/config/rs6000/rs6000.opt | 13 +++++++++++++
- 1 file changed, 13 insertions(+)
-
-diff --git a/gcc/config/rs6000/rs6000.opt b/gcc/config/rs6000/rs6000.opt
-index 4931d781c4e..3fb87b6f7d5 100644
---- a/gcc/config/rs6000/rs6000.opt
-+++ b/gcc/config/rs6000/rs6000.opt
-@@ -348,6 +348,19 @@ mdebug=3D
- Target RejectNegative Joined
- -mdebug=3D	Enable debug output.
-=20
-+; PPC SPE ABI
-+mspe
-+Target Var(rs6000_spe) Save
-+Generate SPE SIMD instructions on E500.
-+
-+mabi=3Dspe
-+Target RejectNegative Var(rs6000_spe_abi) Save
-+Use the SPE ABI extensions.
-+
-+mabi=3Dno-spe
-+Target RejectNegative Var(rs6000_spe_abi, 0)
-+Do not use the SPE ABI extensions.
-+
- ; Altivec ABI
- mabi=3Daltivec
- Target RejectNegative Var(rs6000_altivec_abi) Save
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0020-li=
bgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch b/meta-arm-toolc=
hain/recipes-devtools/gcc/gcc-arm-12.2/0020-libgcc_s-Use-alias-for-__cpu_=
indicator_init-instead-.patch
deleted file mode 100644
index f3709208..00000000
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0020-libgcc_s-=
Use-alias-for-__cpu_indicator_init-instead-.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From a32c75b37209d6836eaaa943dc6b1207acba5d27 Mon Sep 17 00:00:00 2001
-From: Szabolcs Nagy <nsz@port70.net>
-Date: Sat, 24 Oct 2015 20:09:53 +0000
-Subject: [PATCH] libgcc_s: Use alias for __cpu_indicator_init instead of
- symver
-
-Adapter from
-
-https://gcc.gnu.org/ml/gcc-patches/2015-05/msg00899.html
-
-This fix was debated but hasnt been applied gcc upstream since
-they expect musl to support '@' in symbol versioning which is
-a sun/gnu versioning extention. This patch however avoids the
-need for the '@' symbols at all
-
-libgcc/Changelog:
-
-2015-05-11  Szabolcs Nagy  <szabolcs.nagy@arm.com>
-
-	* config/i386/cpuinfo.c (__cpu_indicator_init_local): Add.
-	(__cpu_indicator_init@GCC_4.8.0, __cpu_model@GCC_4.8.0): Remove.
-
-	* config/i386/t-linux (HOST_LIBGCC2_CFLAGS): Remove -DUSE_ELF_SYMVER.
-
-gcc/Changelog:
-
-2015-05-11  Szabolcs Nagy  <szabolcs.nagy@arm.com>
-
-	* config/i386/i386-expand.c (ix86_expand_builtin): Make __builtin_cpu_i=
nit
-	call __cpu_indicator_init_local instead of __cpu_indicator_init.
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gcc/config/i386/i386-expand.cc | 4 ++--
- libgcc/config/i386/cpuinfo.c   | 6 +++---
- libgcc/config/i386/t-linux     | 2 +-
- 3 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/gcc/config/i386/i386-expand.cc b/gcc/config/i386/i386-expan=
d.cc
-index 68978ef8dc2..0c71f36b572 100644
---- a/gcc/config/i386/i386-expand.cc
-+++ b/gcc/config/i386/i386-expand.cc
-@@ -12321,10 +12321,10 @@ ix86_expand_builtin (tree exp, rtx target, rtx=
 subtarget,
-     {
-     case IX86_BUILTIN_CPU_INIT:
-       {
--	/* Make it call __cpu_indicator_init in libgcc.  */
-+	/* Make it call __cpu_indicator_init_local in libgcc.a.  */
- 	tree call_expr, fndecl, type;
- 	type =3D build_function_type_list (integer_type_node, NULL_TREE);
--	fndecl =3D build_fn_decl ("__cpu_indicator_init", type);
-+	fndecl =3D build_fn_decl ("__cpu_indicator_init_local", type);
- 	call_expr =3D build_call_expr (fndecl, 0);
- 	return expand_expr (call_expr, target, mode, EXPAND_NORMAL);
-       }
-diff --git a/libgcc/config/i386/cpuinfo.c b/libgcc/config/i386/cpuinfo.c
-index dab1d98060f..cf824b4114a 100644
---- a/libgcc/config/i386/cpuinfo.c
-+++ b/libgcc/config/i386/cpuinfo.c
-@@ -63,7 +63,7 @@ __cpu_indicator_init (void)
- 			     __cpu_features2);
- }
-=20
--#if defined SHARED && defined USE_ELF_SYMVER
--__asm__ (".symver __cpu_indicator_init, __cpu_indicator_init@GCC_4.8.0"=
);
--__asm__ (".symver __cpu_model, __cpu_model@GCC_4.8.0");
-+#ifndef SHARED
-+int __cpu_indicator_init_local (void)
-+  __attribute__ ((weak, alias ("__cpu_indicator_init")));
- #endif
-diff --git a/libgcc/config/i386/t-linux b/libgcc/config/i386/t-linux
-index 8506a635790..564296f788e 100644
---- a/libgcc/config/i386/t-linux
-+++ b/libgcc/config/i386/t-linux
-@@ -3,5 +3,5 @@
- # t-slibgcc-elf-ver and t-linux
- SHLIB_MAPFILES =3D libgcc-std.ver $(srcdir)/config/i386/libgcc-glibc.ve=
r
-=20
--HOST_LIBGCC2_CFLAGS +=3D -mlong-double-80 -DUSE_ELF_SYMVER $(CET_FLAGS)
-+HOST_LIBGCC2_CFLAGS +=3D -mlong-double-80 $(CET_FLAGS)
- CRTSTUFF_T_CFLAGS +=3D $(CET_FLAGS)
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0021-ge=
ntypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch b/meta-arm-toolc=
hain/recipes-devtools/gcc/gcc-arm-12.2/0021-gentypes-genmodes-Do-not-use-=
__LINE__-for-maintainin.patch
deleted file mode 100644
index f5f04ae3..00000000
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0021-gentypes-=
genmodes-Do-not-use-__LINE__-for-maintainin.patch
+++ /dev/null
@@ -1,182 +0,0 @@
-From 4efc42b99c96b026f560b0918de7e237ac3dc8d1 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Tue, 10 Mar 2020 08:26:53 -0700
-Subject: [PATCH] gentypes/genmodes: Do not use __LINE__ for maintaining
- reproducibility
-
-Inserting line numbers into generated code means its not always reproduc=
ible wth
-differing versions of host gcc. Void the issue by not adding these.
-
-Upstream-Status: Inappropriate [OE Reproducibility specific]
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gcc/gengtype.cc |  6 +++---
- gcc/genmodes.cc | 32 ++++++++++++++++----------------
- 2 files changed, 19 insertions(+), 19 deletions(-)
-
-diff --git a/gcc/gengtype.cc b/gcc/gengtype.cc
-index 386ae1b0506..9762e914296 100644
---- a/gcc/gengtype.cc
-+++ b/gcc/gengtype.cc
-@@ -1006,7 +1006,7 @@ create_field_at (pair_p next, type_p type, const c=
har *name, options_p opt,
- /* Create a fake field with the given type and name.  NEXT is the next
-    field in the chain.  */
- #define create_field(next,type,name) \
--    create_field_all (next,type,name, 0, this_file, __LINE__)
-+    create_field_all (next,type,name, 0, this_file, 0)
-=20
- /* Like create_field, but the field is only valid when condition COND
-    is true.  */
-@@ -1039,7 +1039,7 @@ create_optional_field_ (pair_p next, type_p type, =
const char *name,
- }
-=20
- #define create_optional_field(next,type,name,cond)	\
--       create_optional_field_(next,type,name,cond,__LINE__)
-+       create_optional_field_(next,type,name,cond,0)
-=20
- /* Reverse a linked list of 'struct pair's in place.  */
- pair_p
-@@ -5238,7 +5238,7 @@ main (int argc, char **argv)
-       /* These types are set up with #define or else outside of where
-          we can see them.  We should initialize them before calling
-          read_input_list.  */
--#define POS_HERE(Call) do { pos.file =3D this_file; pos.line =3D __LINE=
__; \
-+#define POS_HERE(Call) do { pos.file =3D this_file; pos.line =3D 0; \
- 	Call;} while (0)
-       POS_HERE (do_scalar_typedef ("CUMULATIVE_ARGS", &pos));
-       POS_HERE (do_scalar_typedef ("REAL_VALUE_TYPE", &pos));
-diff --git a/gcc/genmodes.cc b/gcc/genmodes.cc
-index 59850bb070a..e187f8542a1 100644
---- a/gcc/genmodes.cc
-+++ b/gcc/genmodes.cc
-@@ -440,7 +440,7 @@ complete_all_modes (void)
- }
-=20
- /* For each mode in class CLASS, construct a corresponding complex mode=
.  */
--#define COMPLEX_MODES(C) make_complex_modes (MODE_##C, __FILE__, __LINE=
__)
-+#define COMPLEX_MODES(C) make_complex_modes (MODE_##C, __FILE__, 0)
- static void
- make_complex_modes (enum mode_class cl,
- 		    const char *file, unsigned int line)
-@@ -499,7 +499,7 @@ make_complex_modes (enum mode_class cl,
-    having as many components as necessary.  ORDER is the sorting order
-    of the mode, with smaller numbers indicating a higher priority.  */
- #define VECTOR_MODES_WITH_PREFIX(PREFIX, C, W, ORDER) \
--  make_vector_modes (MODE_##C, #PREFIX, W, ORDER, __FILE__, __LINE__)
-+  make_vector_modes (MODE_##C, #PREFIX, W, ORDER, __FILE__, 0)
- #define VECTOR_MODES(C, W) VECTOR_MODES_WITH_PREFIX (V, C, W, 0)
- static void ATTRIBUTE_UNUSED
- make_vector_modes (enum mode_class cl, const char *prefix, unsigned int=
 width,
-@@ -552,7 +552,7 @@ make_vector_modes (enum mode_class cl, const char *p=
refix, unsigned int width,
-    BYTESIZE bytes in total.  */
- #define VECTOR_BOOL_MODE(NAME, COUNT, COMPONENT, BYTESIZE)		\
-   make_vector_bool_mode (#NAME, COUNT, #COMPONENT, BYTESIZE,		\
--			 __FILE__, __LINE__)
-+			 __FILE__, 0)
- static void ATTRIBUTE_UNUSED
- make_vector_bool_mode (const char *name, unsigned int count,
- 		       const char *component, unsigned int bytesize,
-@@ -574,7 +574,7 @@ make_vector_bool_mode (const char *name, unsigned in=
t count,
- /* Input.  */
-=20
- #define _SPECIAL_MODE(C, N) \
--  make_special_mode (MODE_##C, #N, __FILE__, __LINE__)
-+  make_special_mode (MODE_##C, #N, __FILE__, 0)
- #define RANDOM_MODE(N) _SPECIAL_MODE (RANDOM, N)
- #define CC_MODE(N) _SPECIAL_MODE (CC, N)
-=20
-@@ -587,7 +587,7 @@ make_special_mode (enum mode_class cl, const char *n=
ame,
-=20
- #define INT_MODE(N, Y) FRACTIONAL_INT_MODE (N, -1U, Y)
- #define FRACTIONAL_INT_MODE(N, B, Y) \
--  make_int_mode (#N, B, Y, __FILE__, __LINE__)
-+  make_int_mode (#N, B, Y, __FILE__, 0)
-=20
- static void
- make_int_mode (const char *name,
-@@ -628,16 +628,16 @@ make_opaque_mode (const char *name,
- }
-=20
- #define FRACT_MODE(N, Y, F) \
--	make_fixed_point_mode (MODE_FRACT, #N, Y, 0, F, __FILE__, __LINE__)
-+	make_fixed_point_mode (MODE_FRACT, #N, Y, 0, F, __FILE__, 0)
-=20
- #define UFRACT_MODE(N, Y, F) \
--	make_fixed_point_mode (MODE_UFRACT, #N, Y, 0, F, __FILE__, __LINE__)
-+	make_fixed_point_mode (MODE_UFRACT, #N, Y, 0, F, __FILE__, 0)
-=20
- #define ACCUM_MODE(N, Y, I, F) \
--	make_fixed_point_mode (MODE_ACCUM, #N, Y, I, F, __FILE__, __LINE__)
-+	make_fixed_point_mode (MODE_ACCUM, #N, Y, I, F, __FILE__, 0)
-=20
- #define UACCUM_MODE(N, Y, I, F) \
--	make_fixed_point_mode (MODE_UACCUM, #N, Y, I, F, __FILE__, __LINE__)
-+	make_fixed_point_mode (MODE_UACCUM, #N, Y, I, F, __FILE__, 0)
-=20
- /* Create a fixed-point mode by setting CL, NAME, BYTESIZE, IBIT, FBIT,
-    FILE, and LINE.  */
-@@ -658,7 +658,7 @@ make_fixed_point_mode (enum mode_class cl,
-=20
- #define FLOAT_MODE(N, Y, F)             FRACTIONAL_FLOAT_MODE (N, -1U, =
Y, F)
- #define FRACTIONAL_FLOAT_MODE(N, B, Y, F) \
--  make_float_mode (#N, B, Y, #F, __FILE__, __LINE__)
-+  make_float_mode (#N, B, Y, #F, __FILE__, 0)
-=20
- static void
- make_float_mode (const char *name,
-@@ -675,7 +675,7 @@ make_float_mode (const char *name,
- #define DECIMAL_FLOAT_MODE(N, Y, F)	\
- 	FRACTIONAL_DECIMAL_FLOAT_MODE (N, -1U, Y, F)
- #define FRACTIONAL_DECIMAL_FLOAT_MODE(N, B, Y, F)	\
--  make_decimal_float_mode (#N, B, Y, #F, __FILE__, __LINE__)
-+  make_decimal_float_mode (#N, B, Y, #F, __FILE__, 0)
-=20
- static void
- make_decimal_float_mode (const char *name,
-@@ -690,7 +690,7 @@ make_decimal_float_mode (const char *name,
- }
-=20
- #define RESET_FLOAT_FORMAT(N, F) \
--  reset_float_format (#N, #F, __FILE__, __LINE__)
-+  reset_float_format (#N, #F, __FILE__, 0)
- static void ATTRIBUTE_UNUSED
- reset_float_format (const char *name, const char *format,
- 		    const char *file, unsigned int line)
-@@ -711,7 +711,7 @@ reset_float_format (const char *name, const char *fo=
rmat,
-=20
- /* __intN support.  */
- #define INT_N(M,PREC)				\
--  make_int_n (#M, PREC, __FILE__, __LINE__)
-+  make_int_n (#M, PREC, __FILE__, 0)
- static void ATTRIBUTE_UNUSED
- make_int_n (const char *m, int bitsize,
-             const char *file, unsigned int line)
-@@ -740,7 +740,7 @@ make_int_n (const char *m, int bitsize,
- /* Partial integer modes are specified by relation to a full integer
-    mode.  */
- #define PARTIAL_INT_MODE(M,PREC,NAME)				\
--  make_partial_integer_mode (#M, #NAME, PREC, __FILE__, __LINE__)
-+  make_partial_integer_mode (#M, #NAME, PREC, __FILE__, 0)
- static void ATTRIBUTE_UNUSED
- make_partial_integer_mode (const char *base, const char *name,
- 			   unsigned int precision,
-@@ -767,7 +767,7 @@ make_partial_integer_mode (const char *base, const c=
har *name,
- /* A single vector mode can be specified by naming its component
-    mode and the number of components.  */
- #define VECTOR_MODE_WITH_PREFIX(PREFIX, C, M, N, ORDER) \
--  make_vector_mode (MODE_##C, #PREFIX, #M, N, ORDER, __FILE__, __LINE__=
);
-+  make_vector_mode (MODE_##C, #PREFIX, #M, N, ORDER, __FILE__, 0);
- #define VECTOR_MODE(C, M, N) VECTOR_MODE_WITH_PREFIX(V, C, M, N, 0);
- static void ATTRIBUTE_UNUSED
- make_vector_mode (enum mode_class bclass,
-@@ -814,7 +814,7 @@ make_vector_mode (enum mode_class bclass,
-=20
- /* Adjustability.  */
- #define _ADD_ADJUST(A, M, X, C1, C2) \
--  new_adjust (#M, &adj_##A, #A, #X, MODE_##C1, MODE_##C2, __FILE__, __L=
INE__)
-+  new_adjust (#M, &adj_##A, #A, #X, MODE_##C1, MODE_##C2, __FILE__, 0)
-=20
- #define ADJUST_NUNITS(M, X)    _ADD_ADJUST (nunits, M, X, RANDOM, RANDO=
M)
- #define ADJUST_BYTESIZE(M, X)  _ADD_ADJUST (bytesize, M, X, RANDOM, RAN=
DOM)
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0023-li=
batomic-Do-not-enforce-march-on-aarch64.patch b/meta-arm-toolchain/recipe=
s-devtools/gcc/gcc-arm-12.2/0023-libatomic-Do-not-enforce-march-on-aarch6=
4.patch
deleted file mode 100644
index 2f016598..00000000
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0023-libatomic=
-Do-not-enforce-march-on-aarch64.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 52931ec7a708b58d68e69ce9eb99001ae9f099dd Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 13 May 2020 15:10:38 -0700
-Subject: [PATCH] libatomic: Do not enforce march on aarch64
-
-OE passes the right options via gcc compiler cmdline via TUNE_CCARGS
-this can conflict between -mcpu settings and -march setting here, since
--mcpu will translate into an appropriate -march, lets depend on that
-instead of setting it explicitly
-
-Upstream-Status: Inappropriate [OE-Specific]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libatomic/Makefile.am | 1 -
- libatomic/Makefile.in | 1 -
- 2 files changed, 2 deletions(-)
-
-diff --git a/libatomic/Makefile.am b/libatomic/Makefile.am
-index d88515e4a03..e0e2f8b442a 100644
---- a/libatomic/Makefile.am
-+++ b/libatomic/Makefile.am
-@@ -125,7 +125,6 @@ libatomic_la_LIBADD =3D $(foreach s,$(SIZES),$(addsu=
ffix _$(s)_.lo,$(SIZEOBJS)))
- ## On a target-specific basis, include alternates to be selected by IFU=
NC.
- if HAVE_IFUNC
- if ARCH_AARCH64_LINUX
--IFUNC_OPTIONS	     =3D -march=3Darmv8-a+lse
- libatomic_la_LIBADD +=3D $(foreach s,$(SIZES),$(addsuffix _$(s)_1_.lo,$=
(SIZEOBJS)))
- endif
- if ARCH_ARM_LINUX
-diff --git a/libatomic/Makefile.in b/libatomic/Makefile.in
-index 80d25653dc7..7377689ab34 100644
---- a/libatomic/Makefile.in
-+++ b/libatomic/Makefile.in
-@@ -434,7 +434,6 @@ M_SRC =3D $(firstword $(filter %/$(M_FILE), $(all_c_=
files)))
- libatomic_la_LIBADD =3D $(foreach s,$(SIZES),$(addsuffix \
- 	_$(s)_.lo,$(SIZEOBJS))) $(am__append_1) $(am__append_2) \
- 	$(am__append_3) $(am__append_4)
--@ARCH_AARCH64_LINUX_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS =3D -march=3Dar=
mv8-a+lse
- @ARCH_ARM_LINUX_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS =3D -march=3Darmv7-=
a+fp -DHAVE_KERNEL64
- @ARCH_I386_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS =3D -march=3Di586
- @ARCH_X86_64_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS =3D -mcx16 -mcx16
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0024-Fi=
x-install-path-of-linux64.h.patch b/meta-arm-toolchain/recipes-devtools/g=
cc/gcc-arm-12.2/0024-Fix-install-path-of-linux64.h.patch
deleted file mode 100644
index 555be623..00000000
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0024-Fix-insta=
ll-path-of-linux64.h.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 3e67c9c77e46132c252911bf1e5e4222dfd3aa34 Mon Sep 17 00:00:00 2001
-From: Andrei Gherzan <andrei.gherzan@huawei.com>
-Date: Wed, 22 Dec 2021 12:49:25 +0100
-Subject: [PATCH] Fix install path of linux64.h
-
-We add linux64.h to tm includes[1] as a relative path to B. This patch
-adapts the install path of linux64.h to match the include in tm.h.
-
-[1] 0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
-
-Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
-
-Upstream-Status: Inappropriate [configuration]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gcc/Makefile.in | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 07fa63b6640..0def7394454 100644
---- a/gcc/Makefile.in
-+++ b/gcc/Makefile.in
-@@ -3706,6 +3706,8 @@ install-plugin: installdirs lang.install-plugin s-=
header-vars install-gengtype
- 	  "$(srcdir)"/config/* | "$(srcdir)"/common/config/* \
- 	  | "$(srcdir)"/c-family/* | "$(srcdir)"/*.def ) \
- 	    base=3D`echo "$$path" | sed -e "s|$$srcdirstrip/||"`;; \
-+	  */linux64.h ) \
-+	    base=3D`dirname $$path`;;\
- 	  *) base=3D`basename $$path` ;; \
- 	  esac; \
- 	  dest=3D$(plugin_includedir)/$$base; \
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0026-ru=
st-recursion-limit.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-ar=
m-12.2/0026-rust-recursion-limit.patch
deleted file mode 100644
index e13a9962..00000000
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/0026-rust-recu=
rsion-limit.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From 9234cdca6ee88badfc00297e72f13dac4e540c79 Mon Sep 17 00:00:00 2001
-From: Nick Clifton <nickc@redhat.com>
-Date: Fri, 1 Jul 2022 15:58:52 +0100
-Subject: [PATCH] Add a recursion limit to the demangle_const function in=
 the
- Rust demangler.
-
-libiberty/
-	PR demangler/105039
-	* rust-demangle.c (demangle_const): Add recursion limit.
-
-Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=3Dgcc.gi=
t;h=3D9234cdca6ee88badfc00297e72f13dac4e540c79]
-Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
----
- libiberty/rust-demangle.c | 29 ++++++++++++++++++++---------
- 1 file changed, 20 insertions(+), 9 deletions(-)
-
-diff --git a/libiberty/rust-demangle.c b/libiberty/rust-demangle.c
-index bb58d900e27..36afcfae278 100644
---- a/libiberty/rust-demangle.c
-+++ b/libiberty/rust-demangle.c
-@@ -126,7 +126,7 @@ parse_integer_62 (struct rust_demangler *rdm)
-     return 0;
-=20
-   x =3D 0;
--  while (!eat (rdm, '_'))
-+  while (!eat (rdm, '_') && !rdm->errored)
-     {
-       c =3D next (rdm);
-       x *=3D 62;
-@@ -1148,6 +1148,15 @@ demangle_const (struct rust_demangler *rdm)
-   if (rdm->errored)
-     return;
-=20
-+  if (rdm->recursion !=3D RUST_NO_RECURSION_LIMIT)
-+    {
-+      ++ rdm->recursion;
-+      if (rdm->recursion > RUST_MAX_RECURSION_COUNT)
-+	/* FIXME: There ought to be a way to report
-+	   that the recursion limit has been reached.  */
-+	goto fail_return;
-+    }
-+
-   if (eat (rdm, 'B'))
-     {
-       backref =3D parse_integer_62 (rdm);
-@@ -1158,7 +1167,7 @@ demangle_const (struct rust_demangler *rdm)
-           demangle_const (rdm);
-           rdm->next =3D old_next;
-         }
--      return;
-+      goto pass_return;
-     }
-=20
-   ty_tag =3D next (rdm);
-@@ -1167,7 +1176,7 @@ demangle_const (struct rust_demangler *rdm)
-     /* Placeholder. */
-     case 'p':
-       PRINT ("_");
--      return;
-+      goto pass_return;
-=20
-     /* Unsigned integer types. */
-     case 'h':
-@@ -1200,18 +1209,20 @@ demangle_const (struct rust_demangler *rdm)
-       break;
-=20
-     default:
--      rdm->errored =3D 1;
--      return;
-+      goto fail_return;
-     }
-=20
--  if (rdm->errored)
--    return;
--
--  if (rdm->verbose)
-+  if (!rdm->errored && rdm->verbose)
-     {
-       PRINT (": ");
-       PRINT (basic_type (ty_tag));
-     }
-+
-+ fail_return:
-+  rdm->errored =3D 1;
-+ pass_return:
-+  if (rdm->recursion !=3D RUST_NO_RECURSION_LIMIT)
-+    -- rdm->recursion;
- }
-=20
- static void
---=20
-2.31.1
-
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/hardcod=
ed-paths.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/har=
dcoded-paths.patch
deleted file mode 100644
index f3485858..00000000
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/hardcoded-path=
s.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Avoid encoding build paths into sources used for floating point on power=
pc.
-(MACHINE=3Dqemuppc bitbake libgcc).
-
-Upstream-Status: Submitted [https://gcc.gnu.org/pipermail/gcc-patches/20=
22-August/599882.html]
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: gcc-12.1.0/libgcc/config/rs6000/t-float128
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- gcc-12.1.0.orig/libgcc/config/rs6000/t-float128
-+++ gcc-12.1.0/libgcc/config/rs6000/t-float128
-@@ -103,7 +103,7 @@ $(ibm128_dec_objs)	: INTERNAL_CFLAGS +=3D
- $(fp128_softfp_src) : $(srcdir)/soft-fp/$(subst -sw,,$(subst kf,tf,$@))=
 $(fp128_dep)
- 	@src=3D"$(srcdir)/soft-fp/$(subst -sw,,$(subst kf,tf,$@))"; \
- 	echo "Create $@"; \
--	(echo "/* file created from $$src */"; \
-+	(echo "/* file created from `basename $$src` */"; \
- 	 echo; \
- 	 sed -f $(fp128_sed) < $$src) > $@
-=20
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/prefix-=
map-realpath.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2=
/prefix-map-realpath.patch
deleted file mode 100644
index 7f1a2dee..00000000
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-12.2/prefix-map-rea=
lpath.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-Relative paths don't work with -fdebug-prefix-map and friends. This
-can lead to paths which the user wanted to be remapped being missed.
-Setting -fdebug-prefix-map to work with a relative path isn't practical
-either.
-
-Instead, call gcc's realpath function on the incomming path name before
-comparing it with the remapping. This means other issues like symlinks
-are also accounted for and leads to a more consistent remapping experien=
ce.
-
-Upstream-Status: Submitted [https://gcc.gnu.org/pipermail/gcc-patches/20=
22-August/599885.html]
-[Also https://gcc.gnu.org/pipermail/gcc-patches/2022-August/599884.html]
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-
-Index: gcc-12.1.0/gcc/file-prefix-map.cc
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- gcc-12.1.0.orig/gcc/file-prefix-map.cc
-+++ gcc-12.1.0/gcc/file-prefix-map.cc
-@@ -70,19 +70,28 @@ remap_filename (file_prefix_map *maps, c
-   file_prefix_map *map;
-   char *s;
-   const char *name;
-+  char *realname;
-   size_t name_len;
-=20
-+  if (lbasename (filename) =3D=3D filename)
-+    return filename;
-+
-+  realname =3D lrealpath (filename);
-+
-   for (map =3D maps; map; map =3D map->next)
--    if (filename_ncmp (filename, map->old_prefix, map->old_len) =3D=3D =
0)
-+    if (filename_ncmp (realname, map->old_prefix, map->old_len) =3D=3D =
0)
-       break;
--  if (!map)
-+  if (!map) {
-+    free (realname);
-     return filename;
--  name =3D filename + map->old_len;
-+  }
-+  name =3D realname + map->old_len;
-   name_len =3D strlen (name) + 1;
-=20
-   s =3D (char *) ggc_alloc_atomic (name_len + map->new_len);
-   memcpy (s, map->new_prefix, map->new_len);
-   memcpy (s + map->new_len, name, name_len);
-+  free (realname);
-   return s;
- }
-=20
-Index: gcc-12.1.0/libcpp/macro.cc
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- gcc-12.1.0.orig/libcpp/macro.cc
-+++ gcc-12.1.0/libcpp/macro.cc
-@@ -563,7 +563,7 @@ _cpp_builtin_macro_text (cpp_reader *pfi
- 	    if (!name)
- 	      abort ();
- 	  }
--	if (pfile->cb.remap_filename)
-+	if (pfile->cb.remap_filename && !pfile->state.in_directive)
- 	  name =3D pfile->cb.remap_filename (name);
- 	len =3D strlen (name);
- 	buf =3D _cpp_unaligned_alloc (pfile, len * 2 + 3);
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc b=
/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc
deleted file mode 100644
index fa23e846..00000000
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc
+++ /dev/null
@@ -1,27 +0,0 @@
-# gcc-target.inc in OE-Core has these 2 lines in do_install():
-#
-# | # Add unwind.h, it comes from libgcc which we don't want to build ag=
ain
-# | install ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${B=
INV}/include/unwind.h ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/
-#
-# When TCMODE=3D"external-arm" libgcc is provided by external-arm-toolch=
ain.bb
-# And while it stages the necessary unwind.h file, it ends up in slightl=
y
-# different location. While this is a kludge, be very conservative - onl=
y
-# copy the file for target build in recipe-specific sysroot, in external=
-arm
-# toolchain mode and if the required file does not exist already.
-
-do_install:prepend:class-target () {
-	if [ "${TCMODE}" =3D "external-arm" -a ! -f ${STAGING_LIBDIR_NATIVE}/${=
TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/include/unwind.h ]; then
-		install -d ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${=
BINV}/include/
-		install ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}=
/include/unwind.h ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS=
}/${BINV}/include/
-	fi
-}
-
-# When TCMODE=3D"external-arm" and TARGET_SYS is different from EAT_TARG=
ET_SYS,
-# gcc installs additional aliases as ${TARGET_SYS}-${EAT_TARGET_SYS}-gcc=
, etc.
-# Since those are not packaged and not too useful, let's remove them to =
avoid
-# QA issues
-do_install:append () {
-	for f in g++ gcc gcc-ar gcc-ranlib gcc-nm; do
-		rm -f ${D}${bindir}/${TARGET_SYS}-${EAT_TARGET_SYS}-$f
-	done
-}
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross-canadian_a=
rm-12.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross-canadian_a=
rm-12.2.bb
deleted file mode 100644
index d4bf7bfa..00000000
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross-canadian_arm-12.2=
.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require recipes-devtools/gcc/gcc-${PV}.inc
-require recipes-devtools/gcc/gcc-cross-canadian.inc
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_arm-12.2.b=
b b/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_arm-12.2.bb
deleted file mode 100644
index 0a8aa75b..00000000
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_arm-12.2.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require recipes-devtools/gcc/gcc-${PV}.inc
-require recipes-devtools/gcc/gcc-cross.inc
-
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-crosssdk_arm-12.=
2.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-crosssdk_arm-12.2.bb
deleted file mode 100644
index 0a9f98a1..00000000
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-crosssdk_arm-12.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require recipes-devtools/gcc/gcc-cross_${PV}.bb
-require recipes-devtools/gcc/gcc-crosssdk.inc
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-runtime_arm-12.2=
.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-runtime_arm-12.2.bb
deleted file mode 100644
index b755f555..00000000
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-runtime_arm-12.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require recipes-devtools/gcc/gcc-${PV}.inc
-require recipes-devtools/gcc/gcc-runtime.inc
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-sanitizers_arm-1=
2.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-sanitizers_arm-12.2.=
bb
deleted file mode 100644
index e88ebe1a..00000000
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-sanitizers_arm-12.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require recipes-devtools/gcc/gcc-${PV}.inc
-require recipes-devtools/gcc/gcc-sanitizers.inc
-
-# Building with thumb enabled on armv4t armv5t fails with
-# sanitizer_linux.s:5749: Error: lo register required -- `ldr ip,[sp],#8=
'
-ARM_INSTRUCTION_SET:armv4 =3D "arm"
-ARM_INSTRUCTION_SET:armv5 =3D "arm"
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-source_arm-12.2.=
bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-source_arm-12.2.bb
deleted file mode 100644
index b890fa33..00000000
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-source_arm-12.2.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require recipes-devtools/gcc/gcc-${PV}.inc
-require recipes-devtools/gcc/gcc-source.inc
-
-EXCLUDE_FROM_WORLD =3D "1"
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-12.2.bb b/me=
ta-arm-toolchain/recipes-devtools/gcc/gcc_arm-12.2.bb
deleted file mode 100644
index 92967301..00000000
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-12.2.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require recipes-devtools/gcc/gcc-${PV}.inc
-require recipes-devtools/gcc/gcc-target.inc
-require recipes-devtools/gcc/gcc-arm-common.inc
-
-# Building with thumb enabled on armv4t armv5t fails with
-# | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7438:(.text.unlikely+0x2fa): re=
location truncated to fit: R_ARM_THM_CALL against symbol `fancy_abort(cha=
r const*, int, char const*)' defined in .glue_7 section in linker stubs
-# | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7442:(.text.unlikely+0x318): ad=
ditional relocation overflows omitted from the output
-ARM_INSTRUCTION_SET:armv4 =3D "arm"
-ARM_INSTRUCTION_SET:armv5 =3D "arm"
-
-ARMFPARCHEXT:armv6 =3D "${@'+fp' if d.getVar('TARGET_FPU') =3D=3D 'hard'=
 else ''}"
-ARMFPARCHEXT:armv7a =3D "${@'+fp' if d.getVar('TARGET_FPU') =3D=3D 'hard=
' else ''}"
-ARMFPARCHEXT:armv7ve =3D "${@'+fp' if d.getVar('TARGET_FPU') =3D=3D 'har=
d' else ''}"
-
-BBCLASSEXTEND =3D "nativesdk"
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/libgcc-initial_arm-1=
2.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/libgcc-initial_arm-12.2.=
bb
deleted file mode 100644
index ca1159c5..00000000
--- a/meta-arm-toolchain/recipes-devtools/gcc/libgcc-initial_arm-12.2.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require recipes-devtools/gcc/gcc-${PV}.inc
-require recipes-devtools/gcc/libgcc-initial.inc
-
-# Building with thumb enabled on armv6t fails
-ARM_INSTRUCTION_SET:armv6 =3D "arm"
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/libgcc_arm-12.2.bb b=
/meta-arm-toolchain/recipes-devtools/gcc/libgcc_arm-12.2.bb
deleted file mode 100644
index 35ac5dfe..00000000
--- a/meta-arm-toolchain/recipes-devtools/gcc/libgcc_arm-12.2.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require recipes-devtools/gcc/gcc-${PV}.inc
-require recipes-devtools/gcc/libgcc.inc
-
-# Building with thumb enabled on armv6t fails
-ARM_INSTRUCTION_SET:armv6 =3D "arm"
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/libgfortran_arm-12.2=
.bb b/meta-arm-toolchain/recipes-devtools/gcc/libgfortran_arm-12.2.bb
deleted file mode 100644
index fe63d0a4..00000000
--- a/meta-arm-toolchain/recipes-devtools/gcc/libgfortran_arm-12.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require recipes-devtools/gcc/gcc-${PV}.inc
-require recipes-devtools/gcc/libgfortran.inc
--=20
2.34.1


