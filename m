Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web08.7104.1609935811517825816
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 06 Jan 2021 04:23:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=O8vBWD9N;
 spf=pass (domain: linaro.org, ip: 209.85.214.169, mailfrom: sumit.garg@linaro.org)
Received: by mail-pl1-f169.google.com with SMTP id r4so1451378pls.11
        for <meta-arm@lists.yoctoproject.org>; Wed, 06 Jan 2021 04:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=25+adyJAGk+O3umJnxavyonn9MomtXgRIHBGsmzHU4E=;
        b=O8vBWD9ND1uh6yGbuEjl1KqjeF0KtC/c4bb7mXIC/Npye2AwZxZ/MWyuQK97DY2lym
         HqRu7hwXOqWv2ZoOa/Zu6n2Ndlr0gdIHsJvP0iEm8jVcrP/rEweTUS5SSJeWgZlj2zei
         ZETDwXFER7838/lE2XdnVr7KgPHnlKUpmluRsHuPVkqW4BAJ27WKHYvVFv9seuY015NQ
         oGN3NRgkDfK+CVqMVP3UtFZZ5XaLaf96UUge9rePUav6AjOIt5KcJdzNn2xNMakW6JRa
         3ie7osnDT1lKoXj0myDBkD5/46+lxDT93oM8JPgx5Px5S+xbMJPSzHD7Z72X3rPvSEzM
         V23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=25+adyJAGk+O3umJnxavyonn9MomtXgRIHBGsmzHU4E=;
        b=BZEEmnlqRqjRRMGm6cPYCCHV2l4EwIUxNmRW4LUybOGZ823UnmUFUM7e2ezVIkdNHb
         Tc/MmMv9Hjep7+5iOJ9GqGWslTFG9Ts3FycuXcBO4MQQhOiO2NfBN3UK/yV9k+ORxzCq
         YVWjow5FjRqdJsndFDxapqT73vYmFwANxI0H23IUyyU24FNpX4hbD/x3tpABeRj+wS77
         z/Mtw7AfMo7U9RaIS8E+HUiVAk6JSkg+XaBdXqf6DogE5T8nxHjcLiraalwbdrmA/gEx
         djC7Va0VOhlqZ8BjuZUsp1Bu4c611wZ5PQQe68t1uL41HLE2E7JUA3yrUnJcXuj/h5/E
         UdLg==
X-Gm-Message-State: AOAM5326eoaUZJegE2DCT/zVyMApOYjwJ5bk/i7gAL1i6u6SvLIp/yAy
	VDqVp7/fp2WxksP6IK3SsDqxpMDkRzABrA==
X-Google-Smtp-Source: ABdhPJyGI6e4/H4tXHrUI9QIFkSYltAisKLf7l8UGmUawzBHA56xtUkbnA3tEYKzO0H7aL/kSjTx3Q==
X-Received: by 2002:a17:902:ac93:b029:db:c725:e321 with SMTP id h19-20020a170902ac93b02900dbc725e321mr4335316plr.41.1609935807091;
        Wed, 06 Jan 2021 04:23:27 -0800 (PST)
Return-Path: <sumit.garg@linaro.org>
Received: from localhost.localdomain ([122.173.219.238])
        by smtp.gmail.com with ESMTPSA id z3sm2479019pfq.89.2021.01.06.04.23.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Jan 2021 04:23:26 -0800 (PST)
From: "Sumit Garg" <sumit.garg@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: jon.mason@arm.com,
	ross.burton@arm.com,
	denys@ti.com,
	nicolas.dechesne@linaro.org,
	daniel.thompson@linaro.org,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [meta-arm][PATCH 1/2] arm-toolchain: Add support for GCC 10.2-2020.11
Date: Wed,  6 Jan 2021 17:52:43 +0530
Message-Id: <1609935764-15151-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4

Add support for GNU-A toolchain version: 10.2-2020.11.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 .../recipes-devtools/gcc/gcc-arm-10.2.inc     | 121 ++++++
 ...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch |  39 ++
 ...0001-lib-Remove-i-86-march-overrides.patch | 113 ++++++
 .../0002-gcc-poison-system-directories.patch  | 200 ++++++++++
 ...-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |  70 ++++
 .../0004-64-bit-multilib-hack.patch           | 116 ++++++
 .../gcc-arm-10.2/0005-optional-libstdc.patch  | 122 ++++++
 .../0006-COLLECT_GCC_OPTIONS.patch            |  35 ++
 ...ts.h-in-B-instead-of-S-and-t-oe-in-B.patch |  92 +++++
 .../0008-fortran-cross-compile-hack.patch     |  43 +++
 .../gcc-arm-10.2/0009-cpp-honor-sysroot.patch |  51 +++
 .../0010-MIPS64-Default-to-N64-ABI.patch      |  54 +++
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 243 ++++++++++++
 ...gcc-Fix-argument-list-too-long-error.patch |  41 ++
 .../gcc/gcc-arm-10.2/0013-Disable-sdt.patch   | 110 ++++++
 .../gcc/gcc-arm-10.2/0014-libtool.patch       |  39 ++
 ...s-fix-v4bx-to-linker-to-support-EABI.patch |  40 ++
 ...-config-files-from-B-instead-of-usin.patch |  99 +++++
 ...ir-from-.la-which-usually-points-to-.patch |  28 ++
 .../gcc/gcc-arm-10.2/0018-export-CPP.patch    |  50 +++
 ...e-target-gcc-headers-can-be-included.patch |  57 +++
 ...t-directory-during-relink-if-inst_pr.patch |  35 ++
 ...IR-replacement-instead-of-hardcoding.patch |  26 ++
 ...22-aarch64-Add-support-for-musl-ldso.patch |  25 ++
 ...-fix-libcc1-s-install-path-and-rpath.patch |  51 +++
 ...le-sysroot-support-for-nativesdk-gcc.patch | 349 ++++++++++++++++++
 ...sroot-gcc-version-specific-dirs-with.patch |  99 +++++
 ...ous-_FOR_BUILD-and-related-variables.patch | 134 +++++++
 ...027-nios2-Define-MUSL_DYNAMIC_LINKER.patch |  25 ++
 ...d-to-link-commandline-for-musl-targe.patch |  84 +++++
 ...using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |  26 ++
 .../0030-sync-gcc-stddef.h-with-musl.patch    |  88 +++++
 ...-fault-in-precompiled-header-generat.patch |  57 +++
 .../0032-Fix-for-testsuite-failure.patch      | 255 +++++++++++++
 ...Re-introduce-spe-commandline-options.patch |  38 ++
 ...as-for-__cpu_indicator_init-instead-.patch |  83 +++++
 ...s-Do-not-use-__LINE__-for-maintainin.patch | 182 +++++++++
 ...ngw32-Enable-operation_not_supported.patch |  26 ++
 ...omic-Do-not-enforce-march-on-aarch64.patch |  42 +++
 .../gcc/gcc-cross-canadian_arm-10.2.bb        |   5 +
 .../gcc/gcc-cross_arm-10.2.bb                 |   3 +
 .../gcc/gcc-crosssdk_arm-10.2.bb              |   2 +
 .../gcc/gcc-runtime_arm-10.2.bb               |   2 +
 .../gcc/gcc-sanitizers_arm-10.2.bb            |   7 +
 .../gcc/gcc-source_arm-10.2.bb                |   4 +
 .../recipes-devtools/gcc/gcc_arm-10.2.bb      |  15 +
 .../gcc/libgcc-initial_arm-10.2.bb            |   5 +
 .../recipes-devtools/gcc/libgcc_arm-10.2.bb   |   5 +
 .../gcc/libgfortran_arm-10.2.bb               |   3 +
 49 files changed, 3439 insertions(+)
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2.inc
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0001-lib-Remove-i-86-march-overrides.patch
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0002-gcc-poison-system-directories.patch
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0004-64-bit-multilib-hack.patch
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0005-optional-libstdc.patch
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0006-COLLECT_GCC_OPTIONS.patch
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0008-fortran-cross-compile-hack.patch
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0009-cpp-honor-sysroot.patch
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0010-MIPS64-Default-to-N64-ABI.patch
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0012-gcc-Fix-argument-list-too-long-error.patch
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0013-Disable-sdt.patch
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0014-libtool.patch
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0018-export-CPP.patch
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0019-Ensure-target-gcc-headers-can-be-included.patch
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0022-aarch64-Add-support-for-musl-ldso.patch
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0024-handle-sysroot-support-for-nativesdk-gcc.patch
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0026-Fix-various-_FOR_BUILD-and-related-variables.patch
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0030-sync-gcc-stddef.h-with-musl.patch
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0031-fix-segmentation-fault-in-precompiled-header-generat.patch
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0032-Fix-for-testsuite-failure.patch
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0033-Re-introduce-spe-commandline-options.patch
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0036-mingw32-Enable-operation_not_supported.patch
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0037-libatomic-Do-not-enforce-march-on-aarch64.patch
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-cross-canadian_arm-10.2.bb
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_arm-10.2.bb
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-crosssdk_arm-10.2.bb
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-runtime_arm-10.2.bb
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-sanitizers_arm-10.2.bb
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-source_arm-10.2.bb
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-10.2.bb
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/libgcc-initial_arm-10.2.bb
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/libgcc_arm-10.2.bb
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/libgfortran_arm-10.2.bb

diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2.inc b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2.inc
new file mode 100644
index 0000000..2a82293
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2.inc
@@ -0,0 +1,121 @@
+require recipes-devtools/gcc/gcc-common.inc
+
+# Third digit in PV should be incremented after a minor release
+
+PV = "arm-10.2"
+CVE_VERSION = "10.2"
+
+# BINV should be incremented to a revision after a minor gcc release
+
+BINV = "10.2.1"
+
+MMYY = "20.11"
+RELEASE = "20${MMYY}"
+PR = "r${RELEASE}"
+
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-arm-10.2:${FILE_DIRNAME}/gcc-arm-10.2/backport:"
+
+DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
+NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native"
+
+LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
+
+LIC_FILES_CHKSUM = "\
+    file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
+    file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
+    file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
+    file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
+    file://COPYING.RUNTIME;md5=fe60d87048567d4fe8c8a0ed2448bcc8 \
+"
+
+BASEURI ?= "https://developer.arm.com/-/media/Files/downloads/gnu-a/10.2-2020.11/srcrel/gcc-arm-src-snapshot-10.2-2020.11.tar.xz"
+SRC_URI = "\
+           ${BASEURI} \
+           file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
+           file://0002-gcc-poison-system-directories.patch \
+           file://0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch \
+           file://0004-64-bit-multilib-hack.patch \
+           file://0005-optional-libstdc.patch \
+           file://0006-COLLECT_GCC_OPTIONS.patch \
+           file://0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch \
+           file://0008-fortran-cross-compile-hack.patch \
+           file://0009-cpp-honor-sysroot.patch \
+           file://0010-MIPS64-Default-to-N64-ABI.patch \
+           file://0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch \
+           file://0012-gcc-Fix-argument-list-too-long-error.patch \
+           file://0013-Disable-sdt.patch \
+           file://0014-libtool.patch \
+           file://0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch \
+           file://0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch \
+           file://0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch \
+           file://0018-export-CPP.patch \
+           file://0019-Ensure-target-gcc-headers-can-be-included.patch \
+           file://0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch \
+           file://0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch \
+           file://0022-aarch64-Add-support-for-musl-ldso.patch \
+           file://0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch \
+           file://0024-handle-sysroot-support-for-nativesdk-gcc.patch \
+           file://0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch \
+           file://0026-Fix-various-_FOR_BUILD-and-related-variables.patch \
+           file://0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch \
+           file://0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch \
+           file://0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch \
+           file://0030-sync-gcc-stddef.h-with-musl.patch \
+           file://0031-fix-segmentation-fault-in-precompiled-header-generat.patch \
+           file://0032-Fix-for-testsuite-failure.patch \
+           file://0033-Re-introduce-spe-commandline-options.patch \
+           file://0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
+           file://0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch \
+           file://0036-mingw32-Enable-operation_not_supported.patch \
+           file://0037-libatomic-Do-not-enforce-march-on-aarch64.patch \
+           file://0001-lib-Remove-i-86-march-overrides.patch \
+"
+SRC_URI[md5sum] = "ce6ebec573e3e52cdb770c8f822aad17"
+
+S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-arm-src-snapshot-10.2-2020.11"
+# For dev release snapshotting
+#S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${RELEASE}"
+#B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
+
+# Language Overrides
+FORTRAN = ""
+JAVA = ""
+
+SSP ?= "--disable-libssp"
+SSP_mingw32 = "--enable-libssp"
+
+EXTRA_OECONF_BASE = "\
+    ${SSP} \
+    --enable-libitm \
+    --enable-lto \
+    --disable-bootstrap \
+    --with-system-zlib \
+    ${@'--with-linker-hash-style=${LINKER_HASH_STYLE}' if '${LINKER_HASH_STYLE}' else ''} \
+    --enable-linker-build-id \
+    --with-ppl=no \
+    --with-cloog=no \
+    --enable-checking=release \
+    --enable-cheaders=c_global \
+    --without-isl \
+"
+
+EXTRA_OECONF_INITIAL = "\
+    --disable-libgomp \
+    --disable-libitm \
+    --disable-libquadmath \
+    --with-system-zlib \
+    --disable-lto \
+    --disable-plugin \
+    --enable-linker-build-id \
+    --enable-decimal-float=no \
+    --without-isl \
+    --disable-libssp \
+"
+
+EXTRA_OECONF_append_aarchilp32 = " --with-abi=ilp32"
+
+EXTRA_OECONF_PATHS = "\
+    --with-gxx-include-dir=/not/exist{target_includedir}/c++/${BINV} \
+    --with-sysroot=/not/exist \
+    --with-build-sysroot=${STAGING_DIR_TARGET} \
+"
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
new file mode 100644
index 0000000..82ae9f8
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
@@ -0,0 +1,39 @@
+From f2a5dc3bc7e5727d6bf77e1c6e8a31a6f000883d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 08:37:11 +0400
+Subject: [PATCH] gcc-4.3.1: ARCH_FLAGS_FOR_TARGET
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Inappropriate [embedded specific]
+---
+ configure    | 2 +-
+ configure.ac | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index 4cc938ebb7d..226a64939d1 100755
+--- a/configure
++++ b/configure
+@@ -7722,7 +7722,7 @@ fi
+ # for target_alias and gcc doesn't manage it consistently.
+ target_configargs="--cache-file=./config.cache ${target_configargs}"
+ 
+-FLAGS_FOR_TARGET=
++FLAGS_FOR_TARGET="$ARCH_FLAGS_FOR_TARGET"
+ case " $target_configdirs " in
+  *" newlib "*)
+   case " $target_configargs " in
+diff --git a/configure.ac b/configure.ac
+index c78d9cbea62..f024f4bac9b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3227,7 +3227,7 @@ fi
+ # for target_alias and gcc doesn't manage it consistently.
+ target_configargs="--cache-file=./config.cache ${target_configargs}"
+ 
+-FLAGS_FOR_TARGET=
++FLAGS_FOR_TARGET="$ARCH_FLAGS_FOR_TARGET"
+ case " $target_configdirs " in
+  *" newlib "*)
+   case " $target_configargs " in
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0001-lib-Remove-i-86-march-overrides.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0001-lib-Remove-i-86-march-overrides.patch
new file mode 100644
index 0000000..3f04e12
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0001-lib-Remove-i-86-march-overrides.patch
@@ -0,0 +1,113 @@
+From 3776789cde95916f95deef48acf9532b0ebf91ae Mon Sep 17 00:00:00 2001
+From: Nathan Rossi <nathan@nathanrossi.com>
+Date: Tue, 15 Dec 2020 11:43:36 +1000
+Subject: [PATCH] lib*: Remove i*86 march overrides
+
+OE does not pass the '--with-arch' option to gccs configure, as such
+some gcc-runtime libraries try to override the value of '-march' and
+'-mtune' which OE already provides. This causes conflicts with other
+i*86 instruction/architecture flags (e.g. -msse* and -mfpmath=*).
+Additionally this caused the following libraries to be built with less
+optimized tune configurations.
+
+Upstream suggests that this should be detecting or otherwise checking if
+the target supports the desired functionality before overriding.
+
+    https://gcc.gnu.org/legacy-ml/gcc-patches/2016-04/msg01344.html
+
+libatomic also overrides the '-march' specifically for IFUNC objects.
+OE already supplies the correct march flag, so remove setting.
+
+Upstream-Status: Inappropriate [OE Specific]
+Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
+---
+ libatomic/Makefile.am   | 1 -
+ libatomic/Makefile.in   | 1 -
+ libatomic/configure.tgt | 9 ---------
+ libgomp/configure.tgt   | 8 --------
+ libitm/configure.tgt    | 9 ---------
+ 5 files changed, 28 deletions(-)
+
+diff --git a/libatomic/Makefile.am b/libatomic/Makefile.am
+index ac1ca64587..5aa16e0699 100644
+--- a/libatomic/Makefile.am
++++ b/libatomic/Makefile.am
+@@ -133,7 +133,6 @@ libatomic_la_LIBADD += $(foreach s,$(SIZES),$(addsuffix _$(s)_1_.lo,$(SIZEOBJS))
+ libatomic_la_LIBADD += $(addsuffix _8_2_.lo,$(SIZEOBJS))
+ endif
+ if ARCH_I386
+-IFUNC_OPTIONS	     = -march=i586
+ libatomic_la_LIBADD += $(addsuffix _8_1_.lo,$(SIZEOBJS))
+ endif
+ if ARCH_X86_64
+diff --git a/libatomic/Makefile.in b/libatomic/Makefile.in
+index 97df2d7ff0..82c511d420 100644
+--- a/libatomic/Makefile.in
++++ b/libatomic/Makefile.in
+@@ -432,7 +432,6 @@ libatomic_la_LIBADD = $(foreach s,$(SIZES),$(addsuffix \
+ 	_$(s)_.lo,$(SIZEOBJS))) $(am__append_1) $(am__append_2) \
+ 	$(am__append_3) $(am__append_4)
+ @ARCH_ARM_LINUX_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -march=armv7-a+fp -DHAVE_KERNEL64
+-@ARCH_I386_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -march=i586
+ @ARCH_X86_64_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -mcx16
+ libatomic_convenience_la_SOURCES = $(libatomic_la_SOURCES)
+ libatomic_convenience_la_LIBADD = $(libatomic_la_LIBADD)
+diff --git a/libatomic/configure.tgt b/libatomic/configure.tgt
+index 5dd0926d20..3cc41773c3 100644
+--- a/libatomic/configure.tgt
++++ b/libatomic/configure.tgt
+@@ -82,15 +82,6 @@ case "${target_cpu}" in
+ 	;;
+ 
+   i[3456]86)
+-	case " ${CC} ${CFLAGS} " in
+-	  *" -m64 "*|*" -mx32 "*)
+-	    ;;
+-	  *)
+-	    if test -z "$with_arch"; then
+-	      XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
+-	      XCFLAGS="${XCFLAGS} -fomit-frame-pointer"
+-	    fi
+-	esac
+ 	ARCH=x86
+ 	# ??? Detect when -march=i686 is already enabled.
+ 	try_ifunc=yes
+diff --git a/libgomp/configure.tgt b/libgomp/configure.tgt
+index 4790a31e39..46c4c958e6 100644
+--- a/libgomp/configure.tgt
++++ b/libgomp/configure.tgt
+@@ -72,14 +72,6 @@ if test x$enable_linux_futex = xyes; then
+     # Note that bare i386 is not included here.  We need cmpxchg.
+     i[456]86-*-linux*)
+ 	config_path="linux/x86 linux posix"
+-	case " ${CC} ${CFLAGS} " in
+-	  *" -m64 "*|*" -mx32 "*)
+-	    ;;
+-	  *)
+-	    if test -z "$with_arch"; then
+-	      XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
+-	    fi
+-	esac
+ 	;;
+ 
+     # Similar jiggery-pokery for x86_64 multilibs, except here we
+diff --git a/libitm/configure.tgt b/libitm/configure.tgt
+index 04109160e9..3d78ea609d 100644
+--- a/libitm/configure.tgt
++++ b/libitm/configure.tgt
+@@ -59,15 +59,6 @@ case "${target_cpu}" in
+   arm*)		ARCH=arm ;;
+ 
+   i[3456]86)
+-	case " ${CC} ${CFLAGS} " in
+-	  *" -m64 "*|*" -mx32 "*)
+-	    ;;
+-	  *)
+-	    if test -z "$with_arch"; then
+-	      XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
+-	      XCFLAGS="${XCFLAGS} -fomit-frame-pointer"
+-	    fi
+-	esac
+ 	XCFLAGS="${XCFLAGS} -mrtm"
+ 	ARCH=x86
+ 	;;
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0002-gcc-poison-system-directories.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0002-gcc-poison-system-directories.patch
new file mode 100644
index 0000000..30a8486
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0002-gcc-poison-system-directories.patch
@@ -0,0 +1,200 @@
+From 74cc21f474402cf3578e37e1d7a1a22bbd070f6a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 08:59:00 +0400
+Subject: [PATCH] gcc: poison-system-directories
+
+Add /sw/include and /opt/include based on the original
+zecke-no-host-includes.patch patch.  The original patch checked for
+/usr/include, /sw/include and /opt/include and then triggered a failure and
+aborted.
+
+Instead, we add the two missing items to the current scan.  If the user
+wants this to be a failure, they can add "-Werror=poison-system-directories".
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+---
+ gcc/common.opt      |  4 ++++
+ gcc/config.in       |  6 ++++++
+ gcc/configure       | 16 ++++++++++++++++
+ gcc/configure.ac    | 10 ++++++++++
+ gcc/doc/invoke.texi |  9 +++++++++
+ gcc/gcc.c           |  2 ++
+ gcc/incpath.c       | 21 +++++++++++++++++++++
+ 7 files changed, 68 insertions(+)
+
+diff --git a/gcc/common.opt b/gcc/common.opt
+index 65a82410abc..415f38fa1f4 100644
+--- a/gcc/common.opt
++++ b/gcc/common.opt
+@@ -682,6 +682,10 @@ Wreturn-local-addr
+ Common Var(warn_return_local_addr) Init(1) Warning
+ Warn about returning a pointer/reference to a local or temporary variable.
+ 
++Wpoison-system-directories
++Common Var(flag_poison_system_directories) Init(1) Warning
++Warn for -I and -L options using system directories if cross compiling
++
+ Wshadow
+ Common Var(warn_shadow) Warning
+ Warn when one variable shadows another.  Same as -Wshadow=global.
+diff --git a/gcc/config.in b/gcc/config.in
+index 809e7b26823..5adeaeed36b 100644
+--- a/gcc/config.in
++++ b/gcc/config.in
+@@ -224,6 +224,12 @@
+ #endif
+ 
+ 
++/* Define to warn for use of native system header directories */
++#ifndef USED_FOR_TARGET
++#undef ENABLE_POISON_SYSTEM_DIRECTORIES
++#endif
++
++
+ /* Define if you want all operations on RTL (the basic data structure of the
+    optimizer and back end) to be checked for dynamic type safety at runtime.
+    This is quite expensive. */
+diff --git a/gcc/configure b/gcc/configure
+index cd3d9516fce..8de766a942c 100755
+--- a/gcc/configure
++++ b/gcc/configure
+@@ -1010,6 +1010,7 @@ with_system_zlib
+ enable_maintainer_mode
+ enable_link_mutex
+ enable_version_specific_runtime_libs
++enable_poison_system_directories
+ enable_plugin
+ enable_host_shared
+ enable_libquadmath_support
+@@ -1766,6 +1767,8 @@ Optional Features:
+   --enable-version-specific-runtime-libs
+                           specify that runtime libraries should be installed
+                           in a compiler-specific directory
++  --enable-poison-system-directories
++                          warn for use of native system header directories
+   --enable-plugin         enable plugin support
+   --enable-host-shared    build host code as shared libraries
+   --disable-libquadmath-support
+@@ -30235,6 +30238,19 @@ if test "${enable_version_specific_runtime_libs+set}" = set; then :
+ fi
+ 
+ 
++# Check whether --enable-poison-system-directories was given.
++if test "${enable_poison_system_directories+set}" = set; then :
++  enableval=$enable_poison_system_directories;
++else
++  enable_poison_system_directories=no
++fi
++
++if test "x${enable_poison_system_directories}" = "xyes"; then
++
++$as_echo "#define ENABLE_POISON_SYSTEM_DIRECTORIES 1" >>confdefs.h
++
++fi
++
+ # Substitute configuration variables
+ 
+ 
+diff --git a/gcc/configure.ac b/gcc/configure.ac
+index 0de3b4bf97b..8bfd6feb780 100644
+--- a/gcc/configure.ac
++++ b/gcc/configure.ac
+@@ -6595,6 +6595,16 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
+                 [specify that runtime libraries should be
+                  installed in a compiler-specific directory])])
+ 
++AC_ARG_ENABLE([poison-system-directories],
++             AS_HELP_STRING([--enable-poison-system-directories],
++                            [warn for use of native system header directories]),,
++             [enable_poison_system_directories=no])
++if test "x${enable_poison_system_directories}" = "xyes"; then
++  AC_DEFINE([ENABLE_POISON_SYSTEM_DIRECTORIES],
++           [1],
++           [Define to warn for use of native system header directories])
++fi
++
+ # Substitute configuration variables
+ AC_SUBST(subdirs)
+ AC_SUBST(srcdir)
+diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
+index f98161391a0..f12d8d12150 100644
+--- a/gcc/doc/invoke.texi
++++ b/gcc/doc/invoke.texi
+@@ -348,6 +348,7 @@ Objective-C and Objective-C++ Dialects}.
+ -Wpacked  -Wno-packed-bitfield-compat  -Wpacked-not-aligned  -Wpadded @gol
+ -Wparentheses  -Wno-pedantic-ms-format @gol
+ -Wpointer-arith  -Wno-pointer-compare  -Wno-pointer-to-int-cast @gol
++-Wno-poison-system-directories @gol
+ -Wno-pragmas  -Wno-prio-ctor-dtor  -Wredundant-decls @gol
+ -Wrestrict  -Wno-return-local-addr  -Wreturn-type @gol
+ -Wno-scalar-storage-order  -Wsequence-point @gol
+@@ -6924,6 +6925,14 @@ made up of data only and thus requires no special treatment.  But, for
+ most targets, it is made up of code and thus requires the stack to be
+ made executable in order for the program to work properly.
+ 
++@item -Wno-poison-system-directories
++@opindex Wno-poison-system-directories
++Do not warn for @option{-I} or @option{-L} options using system
++directories such as @file{/usr/include} when cross compiling.  This
++option is intended for use in chroot environments when such
++directories contain the correct headers and libraries for the target
++system rather than the host.
++
+ @item -Wfloat-equal
+ @opindex Wfloat-equal
+ @opindex Wno-float-equal
+diff --git a/gcc/gcc.c b/gcc/gcc.c
+index 9f790db0daf..b2200c5185a 100644
+--- a/gcc/gcc.c
++++ b/gcc/gcc.c
+@@ -1041,6 +1041,8 @@ proper position among the other output files.  */
+    "%{fuse-ld=*:-fuse-ld=%*} " LINK_COMPRESS_DEBUG_SPEC \
+    "%X %{o*} %{e*} %{N} %{n} %{r}\
+     %{s} %{t} %{u*} %{z} %{Z} %{!nostdlib:%{!r:%{!nostartfiles:%S}}} \
++    %{Wno-poison-system-directories:--no-poison-system-directories} \
++    %{Werror=poison-system-directories:--error-poison-system-directories} \
+     %{static|no-pie|static-pie:} %@{L*} %(mfwrap) %(link_libgcc) " \
+     VTABLE_VERIFICATION_SPEC " " SANITIZER_EARLY_SPEC " %o "" \
+     %{fopenacc|fopenmp|%:gt(%{ftree-parallelize-loops=*:%*} 1):\
+diff --git a/gcc/incpath.c b/gcc/incpath.c
+index 8a2bda00f80..9098ab044ab 100644
+--- a/gcc/incpath.c
++++ b/gcc/incpath.c
+@@ -26,6 +26,7 @@
+ #include "intl.h"
+ #include "incpath.h"
+ #include "cppdefault.h"
++#include "diagnostic-core.h"
+ 
+ /* Microsoft Windows does not natively support inodes.
+    VMS has non-numeric inodes.  */
+@@ -393,6 +394,26 @@ merge_include_chains (const char *sysroot, cpp_reader *pfile, int verbose)
+ 	}
+       fprintf (stderr, _("End of search list.\n"));
+     }
++
++#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
++  if (flag_poison_system_directories)
++    {
++       struct cpp_dir *p;
++
++       for (p = heads[INC_QUOTE]; p; p = p->next)
++         {
++          if ((!strncmp (p->name, "/usr/include", 12))
++              || (!strncmp (p->name, "/usr/local/include", 18))
++              || (!strncmp (p->name, "/usr/X11R6/include", 18))
++              || (!strncmp (p->name, "/sw/include", 11))
++              || (!strncmp (p->name, "/opt/include", 12)))
++            warning (OPT_Wpoison_system_directories,
++                     "include location \"%s\" is unsafe for "
++                     "cross-compilation",
++                     p->name);
++         }
++    }
++#endif
+ }
+ 
+ /* Use given -I paths for #include "..." but not #include <...>, and
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
new file mode 100644
index 0000000..27237fe
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
@@ -0,0 +1,70 @@
+From 6e3395c0bc933bdc3242d1dead4896d0aa4e11a8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:08:31 +0400
+Subject: [PATCH] gcc-4.3.3: SYSROOT_CFLAGS_FOR_TARGET
+
+Before committing, I noticed that PR/32161 was marked as a dup of PR/32009, but my previous patch did not fix it.
+
+This alternative patch is better because it lets you just use CFLAGS_FOR_TARGET to set the compilation flags for libgcc. Since bootstrapped target libraries are never compiled with the native compiler, it makes little sense to use different flags for stage1 and later stages. And it also makes little sense to use a different variable than CFLAGS_FOR_TARGET.
+
+Other changes I had to do include:
+
+- moving the creation of default CFLAGS_FOR_TARGET from Makefile.am to configure.ac, because otherwise the BOOT_CFLAGS are substituted into CFLAGS_FOR_TARGET (which is "-O2 -g $(CFLAGS)") via $(CFLAGS). It is also cleaner this way though.
+
+- passing the right CFLAGS to configure scripts as exported environment variables
+
+I also stopped passing LIBCFLAGS to configure scripts since they are unused in the whole src tree. And I updated the documentation as H-P reminded me to do.
+
+Bootstrapped/regtested i686-pc-linux-gnu, will commit to 4.4 shortly. Ok for 4.3?
+
+Signed-off-by: Paolo Bonzini  <bonzini@gnu.org>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+---
+ configure | 32 ++++++++++++++++++++++++++++++++
+ 1 file changed, 32 insertions(+)
+
+diff --git a/configure b/configure
+index 226a64939d1..b31dc137fc9 100755
+--- a/configure
++++ b/configure
+@@ -6971,6 +6971,38 @@ fi
+ 
+ 
+ 
++# During gcc bootstrap, if we use some random cc for stage1 then CFLAGS
++# might be empty or "-g".  We don't require a C++ compiler, so CXXFLAGS
++# might also be empty (or "-g", if a non-GCC C++ compiler is in the path).
++# We want to ensure that TARGET libraries (which we know are built with
++# gcc) are built with "-O2 -g", so include those options when setting
++# CFLAGS_FOR_TARGET and CXXFLAGS_FOR_TARGET.
++if test "x$CFLAGS_FOR_TARGET" = x; then
++  CFLAGS_FOR_TARGET=$CFLAGS
++  case " $CFLAGS " in
++    *" -O2 "*) ;;
++    *) CFLAGS_FOR_TARGET="-O2 $CFLAGS" ;;
++  esac
++  case " $CFLAGS " in
++    *" -g "* | *" -g3 "*) ;;
++    *) CFLAGS_FOR_TARGET="-g $CFLAGS" ;;
++  esac
++fi
++
++
++if test "x$CXXFLAGS_FOR_TARGET" = x; then
++  CXXFLAGS_FOR_TARGET=$CXXFLAGS
++  case " $CXXFLAGS " in
++    *" -O2 "*) ;;
++    *) CXXFLAGS_FOR_TARGET="-O2 $CXXFLAGS" ;;
++  esac
++  case " $CXXFLAGS " in
++    *" -g "* | *" -g3 "*) ;;
++    *) CXXFLAGS_FOR_TARGET="-g $CXXFLAGS" ;;
++  esac
++fi
++
++
+ # Handle --with-headers=XXX.  If the value is not "yes", the contents of
+ # the named directory are copied to $(tooldir)/sys-include.
+ if test x"${with_headers}" != x && test x"${with_headers}" != xno ; then
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0004-64-bit-multilib-hack.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0004-64-bit-multilib-hack.patch
new file mode 100644
index 0000000..7c751be
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0004-64-bit-multilib-hack.patch
@@ -0,0 +1,116 @@
+From 85a7c5aeb82ed61e6ef6d8e061b9da9e6a4a652c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:10:06 +0400
+Subject: [PATCH] 64-bit multilib hack.
+
+GCC has internal multilib handling code but it assumes a very specific rigid directory
+layout. The build system implementation of multilib layout is very generic and allows
+complete customisation of the library directories.
+
+This patch is a partial solution to allow any custom directories to be passed into gcc
+and handled correctly. It forces gcc to use the base_libdir (which is the current
+directory, "."). We need to do this for each multilib that is configured as we don't
+know which compiler options may be being passed into the compiler. Since we have a compiler
+per mulitlib at this point that isn't an issue.
+
+The one problem is the target compiler is only going to work for the default multlilib at
+this point. Ideally we'd figure out which multilibs were being enabled with which paths
+and be able to patch these entries with a complete set of correct paths but this we
+don't have such code at this point. This is something the target gcc recipe should do
+and override these platform defaults in its build config.
+
+Do same for riscv64 and aarch64
+
+RP 15/8/11
+
+Upstream-Status: Inappropriate[OE-Specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+---
+ gcc/config/aarch64/t-aarch64-linux |  8 ++++----
+ gcc/config/i386/t-linux64          |  6 ++----
+ gcc/config/mips/t-linux64          | 10 +++-------
+ gcc/config/riscv/t-linux           |  6 ++++--
+ gcc/config/rs6000/t-linux64        |  5 ++---
+ 5 files changed, 15 insertions(+), 20 deletions(-)
+
+diff --git a/gcc/config/aarch64/t-aarch64-linux b/gcc/config/aarch64/t-aarch64-linux
+index 83e59e33b85..b1356be1fb4 100644
+--- a/gcc/config/aarch64/t-aarch64-linux
++++ b/gcc/config/aarch64/t-aarch64-linux
+@@ -21,8 +21,8 @@
+ LIB1ASMSRC   = aarch64/lib1funcs.asm
+ LIB1ASMFUNCS = _aarch64_sync_cache_range
+ 
+-AARCH_BE = $(if $(findstring TARGET_BIG_ENDIAN_DEFAULT=1, $(tm_defines)),_be)
+-MULTILIB_OSDIRNAMES = mabi.lp64=../lib64$(call if_multiarch,:aarch64$(AARCH_BE)-linux-gnu)
+-MULTIARCH_DIRNAME = $(call if_multiarch,aarch64$(AARCH_BE)-linux-gnu)
++#AARCH_BE = $(if $(findstring TARGET_BIG_ENDIAN_DEFAULT=1, $(tm_defines)),_be)
++#MULTILIB_OSDIRNAMES = mabi.lp64=../lib64$(call if_multiarch,:aarch64$(AARCH_BE)-linux-gnu)
++#MULTIARCH_DIRNAME = $(call if_multiarch,aarch64$(AARCH_BE)-linux-gnu)
+ 
+-MULTILIB_OSDIRNAMES += mabi.ilp32=../libilp32$(call if_multiarch,:aarch64$(AARCH_BE)-linux-gnu_ilp32)
++#MULTILIB_OSDIRNAMES += mabi.ilp32=../libilp32$(call if_multiarch,:aarch64$(AARCH_BE)-linux-gnu_ilp32)
+diff --git a/gcc/config/i386/t-linux64 b/gcc/config/i386/t-linux64
+index 1171e218578..5e057b7e5db 100644
+--- a/gcc/config/i386/t-linux64
++++ b/gcc/config/i386/t-linux64
+@@ -32,7 +32,5 @@
+ #
+ comma=,
+ MULTILIB_OPTIONS    = $(subst $(comma),/,$(TM_MULTILIB_CONFIG))
+-MULTILIB_DIRNAMES   = $(patsubst m%, %, $(subst /, ,$(MULTILIB_OPTIONS)))
+-MULTILIB_OSDIRNAMES = m64=../lib64$(call if_multiarch,:x86_64-linux-gnu)
+-MULTILIB_OSDIRNAMES+= m32=$(if $(wildcard $(shell echo $(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib)$(call if_multiarch,:i386-linux-gnu)
+-MULTILIB_OSDIRNAMES+= mx32=../libx32$(call if_multiarch,:x86_64-linux-gnux32)
++MULTILIB_DIRNAMES = . .
++MULTILIB_OSDIRNAMES = ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
+diff --git a/gcc/config/mips/t-linux64 b/gcc/config/mips/t-linux64
+index ceb58d3b5f3..43fe2bf28ab 100644
+--- a/gcc/config/mips/t-linux64
++++ b/gcc/config/mips/t-linux64
+@@ -17,10 +17,6 @@
+ # <http://www.gnu.org/licenses/>.
+ 
+ MULTILIB_OPTIONS = mabi=n32/mabi=32/mabi=64
+-MULTILIB_DIRNAMES = n32 32 64
+-MIPS_EL = $(if $(filter %el, $(firstword $(subst -, ,$(target)))),el)
+-MIPS_SOFT = $(if $(strip $(filter MASK_SOFT_FLOAT_ABI, $(target_cpu_default)) $(filter soft, $(with_float))),soft)
+-MULTILIB_OSDIRNAMES = \
+-	../lib32$(call if_multiarch,:mips64$(MIPS_EL)-linux-gnuabin32$(MIPS_SOFT)) \
+-	../lib$(call if_multiarch,:mips$(MIPS_EL)-linux-gnu$(MIPS_SOFT)) \
+-	../lib64$(call if_multiarch,:mips64$(MIPS_EL)-linux-gnuabi64$(MIPS_SOFT))
++MULTILIB_DIRNAMES = . . .
++MULTILIB_OSDIRNAMES = ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
++
+diff --git a/gcc/config/riscv/t-linux b/gcc/config/riscv/t-linux
+index 216d2776a18..e4d817621fc 100644
+--- a/gcc/config/riscv/t-linux
++++ b/gcc/config/riscv/t-linux
+@@ -1,3 +1,5 @@
+ # Only XLEN and ABI affect Linux multilib dir names, e.g. /lib32/ilp32d/
+-MULTILIB_DIRNAMES := $(patsubst rv32%,lib32,$(patsubst rv64%,lib64,$(MULTILIB_DIRNAMES)))
+-MULTILIB_OSDIRNAMES := $(patsubst lib%,../lib%,$(MULTILIB_DIRNAMES))
++#MULTILIB_DIRNAMES := $(patsubst rv32%,lib32,$(patsubst rv64%,lib64,$(MULTILIB_DIRNAMES)))
++MULTILIB_DIRNAMES := . .
++#MULTILIB_OSDIRNAMES := $(patsubst lib%,../lib%,$(MULTILIB_DIRNAMES))
++MULTILIB_OSDIRNAMES := ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
+diff --git a/gcc/config/rs6000/t-linux64 b/gcc/config/rs6000/t-linux64
+index 264a7e27524..dc9d440f66b 100644
+--- a/gcc/config/rs6000/t-linux64
++++ b/gcc/config/rs6000/t-linux64
+@@ -26,10 +26,9 @@
+ # MULTILIB_OSDIRNAMES according to what is found on the target.
+ 
+ MULTILIB_OPTIONS    := m64/m32
+-MULTILIB_DIRNAMES   := 64 32
++MULTILIB_DIRNAMES   := . .
+ MULTILIB_EXTRA_OPTS := 
+-MULTILIB_OSDIRNAMES := m64=../lib64$(call if_multiarch,:powerpc64-linux-gnu)
+-MULTILIB_OSDIRNAMES += m32=$(if $(wildcard $(shell echo $(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib)$(call if_multiarch,:powerpc-linux-gnu)
++MULTILIB_OSDIRNAMES := ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
+ 
+ rs6000-linux.o: $(srcdir)/config/rs6000/rs6000-linux.c
+ 	$(COMPILE) $<
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0005-optional-libstdc.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0005-optional-libstdc.patch
new file mode 100644
index 0000000..4020c9e
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0005-optional-libstdc.patch
@@ -0,0 +1,122 @@
+From 6ddfb0bfcd1eea71acd37ab06f7a4510b9f1d12b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:12:56 +0400
+Subject: [PATCH] optional libstdc
+
+gcc-runtime builds libstdc++ separately from gcc-cross-*. Its configure tests using g++
+will not run correctly since by default the linker will try to link against libstdc++
+which shouldn't exist yet. We need an option to disable -lstdc++
+option whilst leaving -lc, -lgcc and other automatic library dependencies added by gcc
+driver. This patch adds such an option which only disables the -lstdc++.
+
+A "standard" gcc build uses xgcc and hence avoids this. We should ask upstream how to
+do this officially, the likely answer is don't build libstdc++ separately.
+
+RP 29/6/10
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Inappropriate [embedded specific]
+---
+ gcc/c-family/c.opt  |  4 ++++
+ gcc/cp/g++spec.c    |  1 +
+ gcc/doc/invoke.texi | 32 +++++++++++++++++++++++++++++++-
+ gcc/gcc.c           |  1 +
+ 4 files changed, 37 insertions(+), 1 deletion(-)
+
+diff --git a/gcc/c-family/c.opt b/gcc/c-family/c.opt
+index c49da99d395..35f712e2c84 100644
+--- a/gcc/c-family/c.opt
++++ b/gcc/c-family/c.opt
+@@ -2025,6 +2025,10 @@ nostdinc++
+ C++ ObjC++
+ Do not search standard system include directories for C++.
+ 
++nostdlib++
++Driver
++Do not link standard C++ runtime library
++
+ o
+ C ObjC C++ ObjC++ Joined Separate
+ ; Documented in common.opt
+diff --git a/gcc/cp/g++spec.c b/gcc/cp/g++spec.c
+index 0ab63bcd211..7b081e9e4f0 100644
+--- a/gcc/cp/g++spec.c
++++ b/gcc/cp/g++spec.c
+@@ -137,6 +137,7 @@ lang_specific_driver (struct cl_decoded_option **in_decoded_options,
+       switch (decoded_options[i].opt_index)
+ 	{
+ 	case OPT_nostdlib:
++	case OPT_nostdlib__:
+ 	case OPT_nodefaultlibs:
+ 	  library = -1;
+ 	  break;
+diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
+index f12d8d12150..cf6cb428e7d 100644
+--- a/gcc/doc/invoke.texi
++++ b/gcc/doc/invoke.texi
+@@ -230,6 +230,9 @@ in the following sections.
+ -fno-weak  -nostdinc++ @gol
+ -fvisibility-inlines-hidden @gol
+ -fvisibility-ms-compat @gol
++-fvtable-verify=@r{[}std@r{|}preinit@r{|}none@r{]} @gol
++-fvtv-counts -fvtv-debug @gol
++-nostdlib++ @gol
+ -fext-numeric-literals @gol
+ -Wabi-tag  -Wcatch-value  -Wcatch-value=@var{n} @gol
+ -Wno-class-conversion  -Wclass-memaccess @gol
+@@ -599,7 +602,7 @@ Objective-C and Objective-C++ Dialects}.
+ -pie  -pthread  -r  -rdynamic @gol
+ -s  -static  -static-pie  -static-libgcc  -static-libstdc++ @gol
+ -static-libasan  -static-libtsan  -static-liblsan  -static-libubsan @gol
+--shared  -shared-libgcc  -symbolic @gol
++-shared  -shared-libgcc  -symbolic -nostdlib++ @gol
+ -T @var{script}  -Wl,@var{option}  -Xlinker @var{option} @gol
+ -u @var{symbol}  -z @var{keyword}}
+ 
+@@ -14407,6 +14410,33 @@ Specify that the program entry point is @var{entry}.  The argument is
+ interpreted by the linker; the GNU linker accepts either a symbol name
+ or an address.
+ 
++@item -nostdlib++
++@opindex nostdlib++
++Do not use the standard system C++ runtime libraries when linking.
++Only the libraries you specify will be passed to the linker.
++
++@cindex @option{-lgcc}, use with @option{-nostdlib}
++@cindex @option{-nostdlib} and unresolved references
++@cindex unresolved references and @option{-nostdlib}
++@cindex @option{-lgcc}, use with @option{-nodefaultlibs}
++@cindex @option{-nodefaultlibs} and unresolved references
++@cindex unresolved references and @option{-nodefaultlibs}
++One of the standard libraries bypassed by @option{-nostdlib} and
++@option{-nodefaultlibs} is @file{libgcc.a}, a library of internal subroutines
++which GCC uses to overcome shortcomings of particular machines, or special
++needs for some languages.
++(@xref{Interface,,Interfacing to GCC Output,gccint,GNU Compiler
++Collection (GCC) Internals},
++for more discussion of @file{libgcc.a}.)
++In most cases, you need @file{libgcc.a} even when you want to avoid
++other standard libraries.  In other words, when you specify @option{-nostdlib}
++or @option{-nodefaultlibs} you should usually specify @option{-lgcc} as well.
++This ensures that you have no unresolved references to internal GCC
++library subroutines.
++(An example of such an internal subroutine is @code{__main}, used to ensure C++
++constructors are called; @pxref{Collect2,,@code{collect2}, gccint,
++GNU Compiler Collection (GCC) Internals}.)
++
+ @item -pie
+ @opindex pie
+ Produce a dynamically linked position independent executable on targets
+diff --git a/gcc/gcc.c b/gcc/gcc.c
+index b2200c5185a..f8be58ce0a6 100644
+--- a/gcc/gcc.c
++++ b/gcc/gcc.c
+@@ -1051,6 +1051,7 @@ proper position among the other output files.  */
+     %(mflib) " STACK_SPLIT_SPEC "\
+     %{fprofile-arcs|fprofile-generate*|coverage:-lgcov} " SANITIZER_SPEC " \
+     %{!nostdlib:%{!r:%{!nodefaultlibs:%(link_ssp) %(link_gcc_c_sequence)}}}\
++    %{!nostdlib++:}\
+     %{!nostdlib:%{!r:%{!nostartfiles:%E}}} %{T*}  \n%(post_link) }}}}}}"
+ #endif
+ 
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0006-COLLECT_GCC_OPTIONS.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0006-COLLECT_GCC_OPTIONS.patch
new file mode 100644
index 0000000..9fbbe80
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0006-COLLECT_GCC_OPTIONS.patch
@@ -0,0 +1,35 @@
+From a6c90d3a9c5010b4aa7cc30467cf81ca7e0f430e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:16:28 +0400
+Subject: [PATCH] COLLECT_GCC_OPTIONS
+
+This patch adds --sysroot into COLLECT_GCC_OPTIONS which is used to
+invoke collect2.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+---
+ gcc/gcc.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/gcc/gcc.c b/gcc/gcc.c
+index f8be58ce0a6..48b0f9dde81 100644
+--- a/gcc/gcc.c
++++ b/gcc/gcc.c
+@@ -4806,6 +4806,15 @@ set_collect_gcc_options (void)
+ 		sizeof ("COLLECT_GCC_OPTIONS=") - 1);
+ 
+   first_time = TRUE;
++#ifdef HAVE_LD_SYSROOT
++  if (target_system_root_changed && target_system_root)
++    {
++      obstack_grow (&collect_obstack, "'--sysroot=", sizeof("'--sysroot=")-1);
++      obstack_grow (&collect_obstack, target_system_root,strlen(target_system_root));
++      obstack_grow (&collect_obstack, "'", 1);
++      first_time = FALSE;
++    }
++#endif
+   for (i = 0; (int) i < n_switches; i++)
+     {
+       const char *const *args;
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
new file mode 100644
index 0000000..a764bdd
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
@@ -0,0 +1,92 @@
+From 5670d4489f119d2da661734895ac0be99b606d1b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:17:25 +0400
+Subject: [PATCH] Use the defaults.h in ${B} instead of ${S}, and t-oe in ${B}
+
+Use the defaults.h in ${B} instead of ${S}, and t-oe in ${B}, so that
+the source can be shared between gcc-cross-initial,
+gcc-cross-intermediate, gcc-cross, gcc-runtime, and also the sdk build.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+
+While compiling gcc-crosssdk-initial-x86_64 on some host, there is
+occasionally failure that test the existance of default.h doesn't
+work, the reason is tm_include_list='** defaults.h' rather than
+tm_include_list='** ./defaults.h'
+
+So we add the test condition for this situation.
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ gcc/Makefile.in  | 2 +-
+ gcc/configure    | 4 ++--
+ gcc/configure.ac | 4 ++--
+ gcc/mkconfig.sh  | 4 ++--
+ 4 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/gcc/Makefile.in b/gcc/Makefile.in
+index 543b477ff18..a67d2cc18d6 100644
+--- a/gcc/Makefile.in
++++ b/gcc/Makefile.in
+@@ -540,7 +540,7 @@ TARGET_SYSTEM_ROOT = @TARGET_SYSTEM_ROOT@
+ TARGET_SYSTEM_ROOT_DEFINE = @TARGET_SYSTEM_ROOT_DEFINE@
+ 
+ xmake_file=@xmake_file@
+-tmake_file=@tmake_file@
++tmake_file=@tmake_file@ ./t-oe
+ TM_ENDIAN_CONFIG=@TM_ENDIAN_CONFIG@
+ TM_MULTILIB_CONFIG=@TM_MULTILIB_CONFIG@
+ TM_MULTILIB_EXCEPTIONS_CONFIG=@TM_MULTILIB_EXCEPTIONS_CONFIG@
+diff --git a/gcc/configure b/gcc/configure
+index 8de766a942c..b26e8fc7fee 100755
+--- a/gcc/configure
++++ b/gcc/configure
+@@ -12705,8 +12705,8 @@ for f in $tm_file; do
+        tm_include_list="${tm_include_list} $f"
+        ;;
+     defaults.h )
+-       tm_file_list="${tm_file_list} \$(srcdir)/$f"
+-       tm_include_list="${tm_include_list} $f"
++       tm_file_list="${tm_file_list} ./$f"
++       tm_include_list="${tm_include_list} ./$f"
+        ;;
+     * )
+        tm_file_list="${tm_file_list} \$(srcdir)/config/$f"
+diff --git a/gcc/configure.ac b/gcc/configure.ac
+index 8bfd6feb780..26fa46802c7 100644
+--- a/gcc/configure.ac
++++ b/gcc/configure.ac
+@@ -2138,8 +2138,8 @@ for f in $tm_file; do
+        tm_include_list="${tm_include_list} $f"
+        ;;
+     defaults.h )
+-       tm_file_list="${tm_file_list} \$(srcdir)/$f"
+-       tm_include_list="${tm_include_list} $f"
++       tm_file_list="${tm_file_list} ./$f"
++       tm_include_list="${tm_include_list} ./$f"
+        ;;
+     * )
+        tm_file_list="${tm_file_list} \$(srcdir)/config/$f"
+diff --git a/gcc/mkconfig.sh b/gcc/mkconfig.sh
+index d2c677a4a42..d03852481cb 100644
+--- a/gcc/mkconfig.sh
++++ b/gcc/mkconfig.sh
+@@ -77,7 +77,7 @@ if [ -n "$HEADERS" ]; then
+     if [ $# -ge 1 ]; then
+ 	echo '#ifdef IN_GCC' >> ${output}T
+ 	for file in "$@"; do
+-	    if test x"$file" = x"defaults.h"; then
++	    if test x"$file" = x"./defaults.h" -o x"$file" = x"defaults.h"; then
+ 		postpone_defaults_h="yes"
+ 	    else
+ 		echo "# include \"$file\"" >> ${output}T
+@@ -106,7 +106,7 @@ esac
+ 
+ # If we postponed including defaults.h, add the #include now.
+ if test x"$postpone_defaults_h" = x"yes"; then
+-    echo "# include \"defaults.h\"" >> ${output}T
++    echo "# include \"./defaults.h\"" >> ${output}T
+ fi
+ 
+ # Add multiple inclusion protection guard, part two.
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0008-fortran-cross-compile-hack.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0008-fortran-cross-compile-hack.patch
new file mode 100644
index 0000000..714db3b
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0008-fortran-cross-compile-hack.patch
@@ -0,0 +1,43 @@
+From f05062625e7a4751be723595a2f7a4b7fbeff311 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:20:01 +0400
+Subject: [PATCH] fortran cross-compile hack.
+
+* Fortran would have searched for arm-angstrom-gnueabi-gfortran but would have used
+used gfortan. For gcc_4.2.2.bb we want to use the gfortran compiler from our cross
+directory.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Inappropriate [embedded specific]
+---
+ libgfortran/configure    | 2 +-
+ libgfortran/configure.ac | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libgfortran/configure b/libgfortran/configure
+index b4cf854ddb3..e8e0ac3b1cf 100755
+--- a/libgfortran/configure
++++ b/libgfortran/configure
+@@ -13090,7 +13090,7 @@ esac
+ 
+ # We need gfortran to compile parts of the library
+ #AC_PROG_FC(gfortran)
+-FC="$GFORTRAN"
++#FC="$GFORTRAN"
+ ac_ext=${ac_fc_srcext-f}
+ ac_compile='$FC -c $FCFLAGS $ac_fcflags_srcext conftest.$ac_ext >&5'
+ ac_link='$FC -o conftest$ac_exeext $FCFLAGS $LDFLAGS $ac_fcflags_srcext conftest.$ac_ext $LIBS >&5'
+diff --git a/libgfortran/configure.ac b/libgfortran/configure.ac
+index 711dc60ff78..3c9bbfbf47d 100644
+--- a/libgfortran/configure.ac
++++ b/libgfortran/configure.ac
+@@ -258,7 +258,7 @@ AC_SUBST(enable_static)
+ 
+ # We need gfortran to compile parts of the library
+ #AC_PROG_FC(gfortran)
+-FC="$GFORTRAN"
++#FC="$GFORTRAN"
+ AC_PROG_FC(gfortran)
+ 
+ # extra LD Flags which are required for targets
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0009-cpp-honor-sysroot.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0009-cpp-honor-sysroot.patch
new file mode 100644
index 0000000..8ad6853
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0009-cpp-honor-sysroot.patch
@@ -0,0 +1,51 @@
+From 1d76de7f1f5c99f1fa1a4b14aedad3d702e4e136 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:22:00 +0400
+Subject: [PATCH] cpp: honor sysroot.
+
+Currently, if the gcc toolchain is relocated and installed from sstate, then you try and compile
+preprocessed source (.i or .ii files), the compiler will try and access the builtin sysroot location
+rather than the --sysroot option specified on the commandline. If access to that directory is
+permission denied (unreadable), gcc will error.
+
+This happens when ccache is in use due to the fact it uses preprocessed source files.
+
+The fix below adds %I to the cpp-output spec macro so the default substitutions for -iprefix,
+-isystem, -isysroot happen and the correct sysroot is used.
+
+[YOCTO #2074]
+
+RP 2012/04/13
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+---
+ gcc/cp/lang-specs.h | 2 +-
+ gcc/gcc.c           | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gcc/cp/lang-specs.h b/gcc/cp/lang-specs.h
+index 0ad4a33b93e..16c744f4f90 100644
+--- a/gcc/cp/lang-specs.h
++++ b/gcc/cp/lang-specs.h
+@@ -66,5 +66,5 @@ along with GCC; see the file COPYING3.  If not see
+   {".ii", "@c++-cpp-output", 0, 0, 0},
+   {"@c++-cpp-output",
+       "%{!E:%{!M:%{!MM:"
+-      "  cc1plus -fpreprocessed %i %(cc1_options) %2"
++      "  cc1plus -fpreprocessed %i %I %(cc1_options) %2"
+       "  %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
+diff --git a/gcc/gcc.c b/gcc/gcc.c
+index 48b0f9dde81..c87f603955f 100644
+--- a/gcc/gcc.c
++++ b/gcc/gcc.c
+@@ -1348,7 +1348,7 @@ static const struct compiler default_compilers[] =
+ 					   %W{o*:--output-pch=%*}}%V}}}}}}}", 0, 0, 0},
+   {".i", "@cpp-output", 0, 0, 0},
+   {"@cpp-output",
+-   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %(cc1_options) %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
++   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %I %(cc1_options) %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
+   {".s", "@assembler", 0, 0, 0},
+   {"@assembler",
+    "%{!M:%{!MM:%{!E:%{!S:as %(asm_debug) %(asm_options) %i %A }}}}", 0, 0, 0},
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0010-MIPS64-Default-to-N64-ABI.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0010-MIPS64-Default-to-N64-ABI.patch
new file mode 100644
index 0000000..625e2d8
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0010-MIPS64-Default-to-N64-ABI.patch
@@ -0,0 +1,54 @@
+From 4fad4433c96bc9d0d9d124f9674fb3389f6f426e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:23:08 +0400
+Subject: [PATCH] MIPS64: Default to N64 ABI
+
+MIPS64 defaults to n32 ABI, this patch makes it
+so that it defaults to N64 ABI
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Inappropriate [OE config specific]
+---
+ gcc/config.gcc | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/gcc/config.gcc b/gcc/config.gcc
+index cf1a87e2efd..37c4221a39f 100644
+--- a/gcc/config.gcc
++++ b/gcc/config.gcc
+@@ -2511,29 +2511,29 @@ mips*-*-linux*)				# Linux MIPS, either endian.
+ 			default_mips_arch=mips32
+ 			;;
+ 		mips64el-st-linux-gnu)
+-			default_mips_abi=n32
++			default_mips_abi=64
+ 			tm_file="${tm_file} mips/st.h"
+ 			tmake_file="${tmake_file} mips/t-st"
+ 			enable_mips_multilibs="yes"
+ 			;;
+ 		mips64octeon*-*-linux*)
+-			default_mips_abi=n32
++			default_mips_abi=64
+ 			tm_defines="${tm_defines} MIPS_CPU_STRING_DEFAULT=\\\"octeon\\\""
+ 			target_cpu_default=MASK_SOFT_FLOAT_ABI
+ 			enable_mips_multilibs="yes"
+ 			;;
+ 		mipsisa64r6*-*-linux*)
+-			default_mips_abi=n32
++			default_mips_abi=64
+ 			default_mips_arch=mips64r6
+ 			enable_mips_multilibs="yes"
+ 			;;
+ 		mipsisa64r2*-*-linux*)
+-			default_mips_abi=n32
++			default_mips_abi=64
+ 			default_mips_arch=mips64r2
+ 			enable_mips_multilibs="yes"
+ 			;;
+ 		mips64*-*-linux* | mipsisa64*-*-linux*)
+-			default_mips_abi=n32
++			default_mips_abi=64
+ 			enable_mips_multilibs="yes"
+ 			;;
+ 	esac
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
new file mode 100644
index 0000000..e357976
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
@@ -0,0 +1,243 @@
+From 8fc016a53c22c19feccbfa13ebdf19090dc67058 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:24:50 +0400
+Subject: [PATCH] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
+ relative to SYSTEMLIBS_DIR
+
+This patch defines GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
+relative to SYSTEMLIBS_DIR which can be set in generated headers
+This breaks the assumption of hardcoded multilib in gcc
+Change is only for the supported architectures in OE including
+SH, sparc, alpha for possible future support (if any)
+
+Removes the do_headerfix task in metadata
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Inappropriate [OE configuration]
+---
+ gcc/config/alpha/linux-elf.h |  4 ++--
+ gcc/config/arm/linux-eabi.h  |  4 ++--
+ gcc/config/arm/linux-elf.h   |  2 +-
+ gcc/config/i386/linux.h      |  2 +-
+ gcc/config/i386/linux64.h    |  6 +++---
+ gcc/config/linux.h           |  8 ++++----
+ gcc/config/mips/linux.h      | 12 ++++++------
+ gcc/config/riscv/linux.h     |  2 +-
+ gcc/config/rs6000/linux64.h  | 15 +++++----------
+ gcc/config/sh/linux.h        |  2 +-
+ gcc/config/sparc/linux.h     |  2 +-
+ gcc/config/sparc/linux64.h   |  4 ++--
+ 12 files changed, 29 insertions(+), 34 deletions(-)
+
+diff --git a/gcc/config/alpha/linux-elf.h b/gcc/config/alpha/linux-elf.h
+index e25fcac3c59..01aca0c6542 100644
+--- a/gcc/config/alpha/linux-elf.h
++++ b/gcc/config/alpha/linux-elf.h
+@@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.  If not see
+ #define EXTRA_SPECS \
+ { "elf_dynamic_linker", ELF_DYNAMIC_LINKER },
+ 
+-#define GLIBC_DYNAMIC_LINKER	"/lib/ld-linux.so.2"
+-#define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
++#define GLIBC_DYNAMIC_LINKER	SYSTEMLIBS_DIR "ld-linux.so.2"
++#define UCLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-uClibc.so.0"
+ #if DEFAULT_LIBC == LIBC_UCLIBC
+ #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
+ #elif DEFAULT_LIBC == LIBC_GLIBC
+diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h
+index 5bdcfa0c5d3..0c0332f317f 100644
+--- a/gcc/config/arm/linux-eabi.h
++++ b/gcc/config/arm/linux-eabi.h
+@@ -65,8 +65,8 @@
+    GLIBC_DYNAMIC_LINKER_DEFAULT and TARGET_DEFAULT_FLOAT_ABI.  */
+ 
+ #undef  GLIBC_DYNAMIC_LINKER
+-#define GLIBC_DYNAMIC_LINKER_SOFT_FLOAT "/lib/ld-linux.so.3"
+-#define GLIBC_DYNAMIC_LINKER_HARD_FLOAT "/lib/ld-linux-armhf.so.3"
++#define GLIBC_DYNAMIC_LINKER_SOFT_FLOAT SYSTEMLIBS_DIR "ld-linux.so.3"
++#define GLIBC_DYNAMIC_LINKER_HARD_FLOAT SYSTEMLIBS_DIR "ld-linux-armhf.so.3"
+ #define GLIBC_DYNAMIC_LINKER_DEFAULT GLIBC_DYNAMIC_LINKER_SOFT_FLOAT
+ 
+ #define GLIBC_DYNAMIC_LINKER \
+diff --git a/gcc/config/arm/linux-elf.h b/gcc/config/arm/linux-elf.h
+index 0ec3aa53189..abfa9566d74 100644
+--- a/gcc/config/arm/linux-elf.h
++++ b/gcc/config/arm/linux-elf.h
+@@ -60,7 +60,7 @@
+ 
+ #define LIBGCC_SPEC "%{mfloat-abi=soft*:-lfloat} -lgcc"
+ 
+-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
+ 
+ #define LINUX_TARGET_LINK_SPEC  "%{h*} \
+    %{static:-Bstatic} \
+diff --git a/gcc/config/i386/linux.h b/gcc/config/i386/linux.h
+index 9f823f125ed..e0390b7d5e3 100644
+--- a/gcc/config/i386/linux.h
++++ b/gcc/config/i386/linux.h
+@@ -20,7 +20,7 @@ along with GCC; see the file COPYING3.  If not see
+ <http://www.gnu.org/licenses/>.  */
+ 
+ #define GNU_USER_LINK_EMULATION "elf_i386"
+-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
+ 
+ #undef MUSL_DYNAMIC_LINKER
+ #define MUSL_DYNAMIC_LINKER "/lib/ld-musl-i386.so.1"
+diff --git a/gcc/config/i386/linux64.h b/gcc/config/i386/linux64.h
+index 6cb68d1ccfa..7de09ec857c 100644
+--- a/gcc/config/i386/linux64.h
++++ b/gcc/config/i386/linux64.h
+@@ -27,9 +27,9 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+ #define GNU_USER_LINK_EMULATION64 "elf_x86_64"
+ #define GNU_USER_LINK_EMULATIONX32 "elf32_x86_64"
+ 
+-#define GLIBC_DYNAMIC_LINKER32 "/lib/ld-linux.so.2"
+-#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux-x86-64.so.2"
+-#define GLIBC_DYNAMIC_LINKERX32 "/libx32/ld-linux-x32.so.2"
++#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-linux.so.2"
++#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux-x86-64.so.2"
++#define GLIBC_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ld-linux-x32.so.2"
+ 
+ #undef MUSL_DYNAMIC_LINKER32
+ #define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-i386.so.1"
+diff --git a/gcc/config/linux.h b/gcc/config/linux.h
+index 95654bcdb5a..0c1a8118a26 100644
+--- a/gcc/config/linux.h
++++ b/gcc/config/linux.h
+@@ -94,10 +94,10 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+    GLIBC_DYNAMIC_LINKER must be defined for each target using them, or
+    GLIBC_DYNAMIC_LINKER32 and GLIBC_DYNAMIC_LINKER64 for targets
+    supporting both 32-bit and 64-bit compilation.  */
+-#define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
+-#define UCLIBC_DYNAMIC_LINKER32 "/lib/ld-uClibc.so.0"
+-#define UCLIBC_DYNAMIC_LINKER64 "/lib/ld64-uClibc.so.0"
+-#define UCLIBC_DYNAMIC_LINKERX32 "/lib/ldx32-uClibc.so.0"
++#define UCLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-uClibc.so.0"
++#define UCLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-uClibc.so.0"
++#define UCLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld64-uClibc.so.0"
++#define UCLIBC_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ldx32-uClibc.so.0"
+ #define BIONIC_DYNAMIC_LINKER "/system/bin/linker"
+ #define BIONIC_DYNAMIC_LINKER32 "/system/bin/linker"
+ #define BIONIC_DYNAMIC_LINKER64 "/system/bin/linker64"
+diff --git a/gcc/config/mips/linux.h b/gcc/config/mips/linux.h
+index 54446e58e5f..4786ee304c1 100644
+--- a/gcc/config/mips/linux.h
++++ b/gcc/config/mips/linux.h
+@@ -22,20 +22,20 @@ along with GCC; see the file COPYING3.  If not see
+ #define GNU_USER_LINK_EMULATIONN32 "elf32%{EB:b}%{EL:l}tsmipn32"
+ 
+ #define GLIBC_DYNAMIC_LINKER32 \
+-  "%{mnan=2008:/lib/ld-linux-mipsn8.so.1;:/lib/ld.so.1}"
++  "%{mnan=2008:" SYSTEMLIBS_DIR "ld-linux-mipsn8.so.1;:" SYSTEMLIBS_DIR "ld.so.1}"
+ #define GLIBC_DYNAMIC_LINKER64 \
+-  "%{mnan=2008:/lib64/ld-linux-mipsn8.so.1;:/lib64/ld.so.1}"
++  "%{mnan=2008:" SYSTEMLIBS_DIR "ld-linux-mipsn8.so.1;:" SYSTEMLIBS_DIR "ld.so.1}"
+ #define GLIBC_DYNAMIC_LINKERN32 \
+-  "%{mnan=2008:/lib32/ld-linux-mipsn8.so.1;:/lib32/ld.so.1}"
++  "%{mnan=2008:" SYSTEMLIBS_DIR "ld-linux-mipsn8.so.1;:" SYSTEMLIBS_DIR "ld.so.1}"
+ 
+ #undef UCLIBC_DYNAMIC_LINKER32
+ #define UCLIBC_DYNAMIC_LINKER32 \
+-  "%{mnan=2008:/lib/ld-uClibc-mipsn8.so.0;:/lib/ld-uClibc.so.0}"
++  "%{mnan=2008:" SYSTEMLIBS_DIR "ld-uClibc-mipsn8.so.0;:" SYSTEMLIBS_DIR "ld-uClibc.so.0}"
+ #undef UCLIBC_DYNAMIC_LINKER64
+ #define UCLIBC_DYNAMIC_LINKER64 \
+-  "%{mnan=2008:/lib/ld64-uClibc-mipsn8.so.0;:/lib/ld64-uClibc.so.0}"
++  "%{mnan=2008:" SYSTEMLIBS_DIR "ld64-uClibc-mipsn8.so.0;:" SYSTEMLIBS_DIR "ld64-uClibc.so.0}"
+ #define UCLIBC_DYNAMIC_LINKERN32 \
+-  "%{mnan=2008:/lib32/ld-uClibc-mipsn8.so.0;:/lib32/ld-uClibc.so.0}"
++  "%{mnan=2008:" SYSTEMLIBS_DIR "ld-uClibc-mipsn8.so.0;:" SYSTEMLIBS_DIR "ld-uClibc.so.0}"
+ 
+ #undef MUSL_DYNAMIC_LINKER32
+ #define MUSL_DYNAMIC_LINKER32 \
+diff --git a/gcc/config/riscv/linux.h b/gcc/config/riscv/linux.h
+index 4afef7c228c..01997330741 100644
+--- a/gcc/config/riscv/linux.h
++++ b/gcc/config/riscv/linux.h
+@@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.  If not see
+     GNU_USER_TARGET_OS_CPP_BUILTINS();				\
+   } while (0)
+ 
+-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-riscv" XLEN_SPEC "-" ABI_SPEC ".so.1"
++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux-riscv" XLEN_SPEC "-" ABI_SPEC ".so.1"
+ 
+ #define MUSL_ABI_SUFFIX \
+   "%{mabi=ilp32:-sf}" \
+diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
+index 34776c8421e..967c1c43c63 100644
+--- a/gcc/config/rs6000/linux64.h
++++ b/gcc/config/rs6000/linux64.h
+@@ -419,24 +419,19 @@ extern int dot_symbols;
+ #undef	LINK_OS_DEFAULT_SPEC
+ #define LINK_OS_DEFAULT_SPEC "%(link_os_linux)"
+ 
+-#define GLIBC_DYNAMIC_LINKER32 "%(dynamic_linker_prefix)/lib/ld.so.1"
+-
++#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld.so.1"
+ #ifdef LINUX64_DEFAULT_ABI_ELFv2
+-#define GLIBC_DYNAMIC_LINKER64 \
+-"%{mabi=elfv1:%(dynamic_linker_prefix)/lib64/ld64.so.1;" \
+-":%(dynamic_linker_prefix)/lib64/ld64.so.2}"
++#define GLIBC_DYNAMIC_LINKER64 "%{mabi=elfv1:" SYSTEMLIBS_DIR "ld64.so.1;:" SYSTEMLIBS_DIR "ld64.so.2}"
+ #else
+-#define GLIBC_DYNAMIC_LINKER64 \
+-"%{mabi=elfv2:%(dynamic_linker_prefix)/lib64/ld64.so.2;" \
+-":%(dynamic_linker_prefix)/lib64/ld64.so.1}"
++#define GLIBC_DYNAMIC_LINKER64 "%{mabi=elfv2:" SYSTEMLIBS_DIR "ld64.so.2;:" SYSTEMLIBS_DIR "ld64.so.1}"
+ #endif
+ 
+ #undef MUSL_DYNAMIC_LINKER32
+ #define MUSL_DYNAMIC_LINKER32 \
+-  "/lib/ld-musl-powerpc" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}.so.1"
++  SYSTEMLIBS_DIR "ld-musl-powerpc" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}.so.1"
+ #undef MUSL_DYNAMIC_LINKER64
+ #define MUSL_DYNAMIC_LINKER64 \
+-  "/lib/ld-musl-powerpc64" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}.so.1"
++  SYSTEMLIBS_DIR "ld-musl-powerpc64" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}.so.1"
+ 
+ #undef  DEFAULT_ASM_ENDIAN
+ #if (TARGET_DEFAULT & MASK_LITTLE_ENDIAN)
+diff --git a/gcc/config/sh/linux.h b/gcc/config/sh/linux.h
+index c1d0441d488..81373eb8336 100644
+--- a/gcc/config/sh/linux.h
++++ b/gcc/config/sh/linux.h
+@@ -64,7 +64,7 @@ along with GCC; see the file COPYING3.  If not see
+   "/lib/ld-musl-sh" MUSL_DYNAMIC_LINKER_E MUSL_DYNAMIC_LINKER_FP \
+   "%{mfdpic:-fdpic}.so.1"
+ 
+-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
+ 
+ #undef SUBTARGET_LINK_EMUL_SUFFIX
+ #define SUBTARGET_LINK_EMUL_SUFFIX "%{mfdpic:_fd;:_linux}"
+diff --git a/gcc/config/sparc/linux.h b/gcc/config/sparc/linux.h
+index 81201e67a2f..8b6fc577594 100644
+--- a/gcc/config/sparc/linux.h
++++ b/gcc/config/sparc/linux.h
+@@ -84,7 +84,7 @@ extern const char *host_detect_local_cpu (int argc, const char **argv);
+    When the -shared link option is used a final link is not being
+    done.  */
+ 
+-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
+ 
+ #undef  LINK_SPEC
+ #define LINK_SPEC "-m elf32_sparc %{shared:-shared} \
+diff --git a/gcc/config/sparc/linux64.h b/gcc/config/sparc/linux64.h
+index a1a0efd8f28..85d1084afc2 100644
+--- a/gcc/config/sparc/linux64.h
++++ b/gcc/config/sparc/linux64.h
+@@ -84,8 +84,8 @@ along with GCC; see the file COPYING3.  If not see
+    When the -shared link option is used a final link is not being
+    done.  */
+ 
+-#define GLIBC_DYNAMIC_LINKER32 "/lib/ld-linux.so.2"
+-#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux.so.2"
++#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-linux.so.2"
++#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux.so.2"
+ 
+ #ifdef SPARC_BI_ARCH
+ 
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0012-gcc-Fix-argument-list-too-long-error.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0012-gcc-Fix-argument-list-too-long-error.patch
new file mode 100644
index 0000000..88e1715
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0012-gcc-Fix-argument-list-too-long-error.patch
@@ -0,0 +1,41 @@
+From a22d1264049d29b90663cf5667049ae6f9b7a5ce Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:26:37 +0400
+Subject: [PATCH] gcc: Fix argument list too long error.
+
+There would be an "Argument list too long" error when the
+build directory is longer than 200, this is caused by:
+
+headers=`echo $(PLUGIN_HEADERS) | tr ' ' '\012' | sort -u`
+
+The PLUGIN_HEADERS is too long before sort, so the "echo" can't handle
+it, use the $(sort list) of GNU make which can handle the too long list
+would fix the problem, the header would be short enough after sorted.
+The "tr ' ' '\012'" was used for translating the space to "\n", the
+$(sort list) doesn't need this.
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+RP: gcc then added *.h and *.def additions to this list, breaking the original
+fix. Add the sort to the original gcc code, leaving the tr+sort to fix the original
+issue but include the new files too as reported by Zhuang <qiuguang.zqg@alibaba-inc.com>
+
+Upstream-Status: Pending
+---
+ gcc/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gcc/Makefile.in b/gcc/Makefile.in
+index a67d2cc18d6..480c9366418 100644
+--- a/gcc/Makefile.in
++++ b/gcc/Makefile.in
+@@ -3606,7 +3606,7 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
+ # We keep the directory structure for files in config or c-family and .def
+ # files. All other files are flattened to a single directory.
+ 	$(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
+-	headers=`echo $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def) | tr ' ' '\012' | sort -u`; \
++	headers=`echo $(sort $(PLUGIN_HEADERS)) $$(cd $(srcdir); echo *.h *.def) | tr ' ' '\012' | sort -u`; \
+ 	srcdirstrip=`echo "$(srcdir)" | sed 's/[].[^$$\\*|]/\\\\&/g'`; \
+ 	for file in $$headers; do \
+ 	  if [ -f $$file ] ; then \
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0013-Disable-sdt.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0013-Disable-sdt.patch
new file mode 100644
index 0000000..207cdb5
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0013-Disable-sdt.patch
@@ -0,0 +1,110 @@
+From fa47586935a18ecfc2ad5586802e326e21741b7b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:28:10 +0400
+Subject: [PATCH] Disable sdt.
+
+We don't list dtrace in DEPENDS so we shouldn't be depending on this header.
+It may or may not exist from preivous builds though. To be determinstic, disable
+sdt.h usage always. This avoids build failures if the header is removed after configure
+but before libgcc is compiled for example.
+
+RP 2012/8/7
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Disable sdt for libstdc++-v3.
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
+Upstream-Status: Inappropriate [hack]
+---
+ gcc/configure             | 12 ++++++------
+ gcc/configure.ac          | 18 +++++++++---------
+ libstdc++-v3/configure    |  6 +++---
+ libstdc++-v3/configure.ac |  2 +-
+ 4 files changed, 19 insertions(+), 19 deletions(-)
+
+diff --git a/gcc/configure b/gcc/configure
+index b26e8fc7fee..6080f86145e 100755
+--- a/gcc/configure
++++ b/gcc/configure
+@@ -29789,12 +29789,12 @@ fi
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking sys/sdt.h in the target C library" >&5
+ $as_echo_n "checking sys/sdt.h in the target C library... " >&6; }
+ have_sys_sdt_h=no
+-if test -f $target_header_dir/sys/sdt.h; then
+-  have_sys_sdt_h=yes
+-
+-$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
+-
+-fi
++#if test -f $target_header_dir/sys/sdt.h; then
++#  have_sys_sdt_h=yes
++#
++#$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
++#
++#fi
+ { $as_echo "$as_me:${as_lineno-$LINENO}: result: $have_sys_sdt_h" >&5
+ $as_echo "$have_sys_sdt_h" >&6; }
+ 
+diff --git a/gcc/configure.ac b/gcc/configure.ac
+index 26fa46802c7..42be5252778 100644
+--- a/gcc/configure.ac
++++ b/gcc/configure.ac
+@@ -6190,15 +6190,15 @@ fi
+ AC_SUBST([enable_default_ssp])
+ 
+ # Test for <sys/sdt.h> on the target.
+-GCC_TARGET_TEMPLATE([HAVE_SYS_SDT_H])
+-AC_MSG_CHECKING(sys/sdt.h in the target C library)
+-have_sys_sdt_h=no
+-if test -f $target_header_dir/sys/sdt.h; then
+-  have_sys_sdt_h=yes
+-  AC_DEFINE(HAVE_SYS_SDT_H, 1,
+-            [Define if your target C library provides sys/sdt.h])
+-fi
+-AC_MSG_RESULT($have_sys_sdt_h)
++#GCC_TARGET_TEMPLATE([HAVE_SYS_SDT_H])
++#AC_MSG_CHECKING(sys/sdt.h in the target C library)
++#have_sys_sdt_h=no
++#if test -f $target_header_dir/sys/sdt.h; then
++#  have_sys_sdt_h=yes
++#  AC_DEFINE(HAVE_SYS_SDT_H, 1,
++#            [Define if your target C library provides sys/sdt.h])
++#fi
++#AC_MSG_RESULT($have_sys_sdt_h)
+ 
+ # Check if TFmode long double should be used by default or not.
+ # Some glibc targets used DFmode long double, but with glibc 2.4
+diff --git a/libstdc++-v3/configure b/libstdc++-v3/configure
+index 9f9c5a2419a..71ed13b815b 100755
+--- a/libstdc++-v3/configure
++++ b/libstdc++-v3/configure
+@@ -22615,11 +22615,11 @@ ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
+ ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
+ ac_compiler_gnu=$ac_cv_c_compiler_gnu
+ 
+-  if test $glibcxx_cv_sys_sdt_h = yes; then
++#  if test $glibcxx_cv_sys_sdt_h = yes; then
+ 
+-$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
++#$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
+ 
+-  fi
++#  fi
+   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $glibcxx_cv_sys_sdt_h" >&5
+ $as_echo "$glibcxx_cv_sys_sdt_h" >&6; }
+ 
+diff --git a/libstdc++-v3/configure.ac b/libstdc++-v3/configure.ac
+index 699e55fd829..5c7a7bda439 100644
+--- a/libstdc++-v3/configure.ac
++++ b/libstdc++-v3/configure.ac
+@@ -241,7 +241,7 @@ GLIBCXX_CHECK_SC_NPROCESSORS_ONLN
+ GLIBCXX_CHECK_SC_NPROC_ONLN
+ GLIBCXX_CHECK_PTHREADS_NUM_PROCESSORS_NP
+ GLIBCXX_CHECK_SYSCTL_HW_NCPU
+-GLIBCXX_CHECK_SDT_H
++#GLIBCXX_CHECK_SDT_H
+ 
+ # Check for available headers.
+ AC_CHECK_HEADERS([endian.h execinfo.h float.h fp.h ieeefp.h inttypes.h \
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0014-libtool.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0014-libtool.patch
new file mode 100644
index 0000000..f4e70c3
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0014-libtool.patch
@@ -0,0 +1,39 @@
+From 6ecd478881468934444ff85611fd43f7033b1e81 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:29:11 +0400
+Subject: [PATCH] libtool
+
+libstdc++ from gcc-runtime gets created with -rpath=/usr/lib/../lib for qemux86-64
+when running on am x86_64 build host.
+
+This patch stops this speading to libdir in the libstdc++.la file within libtool.
+Arguably, it shouldn't be passing this into libtool in the first place but
+for now this resolves the nastiest problems this causes.
+
+func_normal_abspath would resolve an empty path to `pwd` so we need
+to filter the zero case.
+
+RP 2012/8/24
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+---
+ ltmain.sh | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/ltmain.sh b/ltmain.sh
+index 70990740b6c..ee938056bef 100644
+--- a/ltmain.sh
++++ b/ltmain.sh
+@@ -6359,6 +6359,10 @@ func_mode_link ()
+ 	func_warning "ignoring multiple \`-rpath's for a libtool library"
+ 
+       install_libdir="$1"
++      if test -n "$install_libdir"; then
++	func_normal_abspath "$install_libdir"
++	install_libdir=$func_normal_abspath_result
++      fi
+ 
+       oldlibs=
+       if test -z "$rpath"; then
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
new file mode 100644
index 0000000..bc2674a
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
@@ -0,0 +1,40 @@
+From de4427fa49c07dc651ee6ceaf5c5078700ca3b08 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:30:32 +0400
+Subject: [PATCH] gcc: armv4: pass fix-v4bx to linker to support EABI.
+
+The LINK_SPEC for linux gets overwritten by linux-eabi.h which
+means the value of TARGET_FIX_V4BX_SPEC gets lost and as a result
+the option is not passed to linker when chosing march=armv4
+This patch redefines this in linux-eabi.h and reinserts it
+for eabi defaulting toolchains.
+
+We might want to send it upstream.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+---
+ gcc/config/arm/linux-eabi.h | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h
+index 0c0332f317f..7b3769e8459 100644
+--- a/gcc/config/arm/linux-eabi.h
++++ b/gcc/config/arm/linux-eabi.h
+@@ -91,10 +91,14 @@
+ #define MUSL_DYNAMIC_LINKER \
+   "/lib/ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=hard:hf}%{mfdpic:-fdpic}.so.1"
+ 
++/* For armv4 we pass --fix-v4bx to linker to support EABI */
++#undef TARGET_FIX_V4BX_SPEC
++#define TARGET_FIX_V4BX_SPEC "%{mcpu=arm8|mcpu=arm810|mcpu=strongarm*|march=armv4: --fix-v4bx}"
++
+ /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
+    use the GNU/Linux version, not the generic BPABI version.  */
+ #undef  LINK_SPEC
+-#define LINK_SPEC EABI_LINK_SPEC					\
++#define LINK_SPEC TARGET_FIX_V4BX_SPEC EABI_LINK_SPEC			\
+   LINUX_OR_ANDROID_LD (LINUX_TARGET_LINK_SPEC,				\
+ 		       LINUX_TARGET_LINK_SPEC " " ANDROID_LINK_SPEC)
+ 
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
new file mode 100644
index 0000000..1dc4bb8
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
@@ -0,0 +1,99 @@
+From 6b363c2c1c089ee900efa6013aefba1003840a37 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:33:04 +0400
+Subject: [PATCH] Use the multilib config files from ${B} instead of using the
+ ones from ${S}
+
+Use the multilib config files from ${B} instead of using the ones from ${S}
+so that the source can be shared between gcc-cross-initial,
+gcc-cross-intermediate, gcc-cross, gcc-runtime, and also the sdk build.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
+
+Upstream-Status: Inappropriate [configuration]
+---
+ gcc/configure    | 22 ++++++++++++++++++----
+ gcc/configure.ac | 22 ++++++++++++++++++----
+ 2 files changed, 36 insertions(+), 8 deletions(-)
+
+diff --git a/gcc/configure b/gcc/configure
+index 6080f86145e..825a9652329 100755
+--- a/gcc/configure
++++ b/gcc/configure
+@@ -12685,10 +12685,20 @@ done
+ tmake_file_=
+ for f in ${tmake_file}
+ do
+-	if test -f ${srcdir}/config/$f
+-	then
+-		tmake_file_="${tmake_file_} \$(srcdir)/config/$f"
+-	fi
++  case $f in
++    */t-linux64 )
++       if test -f ./config/$f
++       then
++         tmake_file_="${tmake_file_} ./config/$f"
++       fi
++       ;;
++    * )
++       if test -f ${srcdir}/config/$f
++       then
++         tmake_file_="${tmake_file_} \$(srcdir)/config/$f"
++       fi
++       ;;
++  esac
+ done
+ tmake_file="${tmake_file_}${omp_device_property_tmake_file}"
+ 
+@@ -12699,6 +12709,10 @@ tm_file_list="options.h"
+ tm_include_list="options.h insn-constants.h"
+ for f in $tm_file; do
+   case $f in
++    */linux64.h )
++       tm_file_list="${tm_file_list} ./config/$f"
++       tm_include_list="${tm_include_list} ./config/$f"
++       ;;
+     ./* )
+        f=`echo $f | sed 's/^..//'`
+        tm_file_list="${tm_file_list} $f"
+diff --git a/gcc/configure.ac b/gcc/configure.ac
+index 42be5252778..6099eb3251f 100644
+--- a/gcc/configure.ac
++++ b/gcc/configure.ac
+@@ -2118,10 +2118,20 @@ done
+ tmake_file_=
+ for f in ${tmake_file}
+ do
+-	if test -f ${srcdir}/config/$f
+-	then
+-		tmake_file_="${tmake_file_} \$(srcdir)/config/$f"
+-	fi
++  case $f in
++    */t-linux64 )
++       if test -f ./config/$f
++       then
++         tmake_file_="${tmake_file_} ./config/$f"
++       fi
++       ;;
++    * )
++       if test -f ${srcdir}/config/$f
++       then
++         tmake_file_="${tmake_file_} \$(srcdir)/config/$f"
++       fi
++       ;;
++  esac
+ done
+ tmake_file="${tmake_file_}${omp_device_property_tmake_file}"
+ 
+@@ -2132,6 +2142,10 @@ tm_file_list="options.h"
+ tm_include_list="options.h insn-constants.h"
+ for f in $tm_file; do
+   case $f in
++    */linux64.h )
++       tm_file_list="${tm_file_list} ./config/$f"
++       tm_include_list="${tm_include_list} ./config/$f"
++       ;;
+     ./* )
+        f=`echo $f | sed 's/^..//'`
+        tm_file_list="${tm_file_list} $f"
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
new file mode 100644
index 0000000..05f1284
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
@@ -0,0 +1,28 @@
+From 08752c2f1d21553301bee5757c453c6a36cbe03c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 20 Feb 2015 09:39:38 +0000
+Subject: [PATCH] Avoid using libdir from .la which usually points to a host
+ path
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ ltmain.sh | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/ltmain.sh b/ltmain.sh
+index ee938056bef..9ebc7e3d1e0 100644
+--- a/ltmain.sh
++++ b/ltmain.sh
+@@ -5628,6 +5628,9 @@ func_mode_link ()
+ 	    absdir="$abs_ladir"
+ 	    libdir="$abs_ladir"
+ 	  else
++	    # Instead of using libdir from .la which usually points to a host path,
++	    # use the path the .la is contained in.
++	    libdir="$abs_ladir"
+ 	    dir="$libdir"
+ 	    absdir="$libdir"
+ 	  fi
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0018-export-CPP.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0018-export-CPP.patch
new file mode 100644
index 0000000..886a122
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0018-export-CPP.patch
@@ -0,0 +1,50 @@
+From 5c3d66378c7ff60ca11a875aa4aa6f8a8529d43a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 20 Feb 2015 09:40:59 +0000
+Subject: [PATCH] export CPP
+
+The OE environment sets and exports CPP as being the target gcc. When
+building gcc-cross-canadian for a mingw targetted sdk, the following can be found
+in build.x86_64-pokysdk-mingw32.i586-poky-linux/build-x86_64-linux/libiberty/config.log:
+
+configure:3641: checking for _FILE_OFFSET_BITS value needed for large files
+configure:3666: gcc  -c -isystem/media/build1/poky/build/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe  conftest.c >&5
+configure:3666: $? = 0
+configure:3698: result: no
+configure:3786: checking how to run the C preprocessor
+configure:3856: result: x86_64-pokysdk-mingw32-gcc -E --sysroot=/media/build1/poky/build/tmp/sysroots/x86_64-nativesdk-mingw32-pokysdk-mingw32
+configure:3876: x86_64-pokysdk-mingw32-gcc -E --sysroot=/media/build1/poky/build/tmp/sysroots/x86_64-nativesdk-mingw32-pokysdk-mingw32 conftest.c
+configure:3876: $? = 0
+
+Note this is a *build* target (in build-x86_64-linux) so it should be
+using the host "gcc", not x86_64-pokysdk-mingw32-gcc. Since the mingw32
+headers are very different, using the wrong cpp is a real problem. It is leaking
+into configure through the CPP variable. Ultimately this leads to build
+failures related to not being able to include a process.h file for pem-unix.c.
+
+The fix is to ensure we export a sane CPP value into the build
+environment when using build targets. We could define a CPP_FOR_BUILD value which may be
+the version which needs to be upstreamed but for now, this fix is good enough to
+avoid the problem.
+
+RP 22/08/2013
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile.in b/Makefile.in
+index 36e369df6e7..c717903bb13 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -149,6 +149,7 @@ BUILD_EXPORTS = \
+ 	AR="$(AR_FOR_BUILD)"; export AR; \
+ 	AS="$(AS_FOR_BUILD)"; export AS; \
+ 	CC="$(CC_FOR_BUILD)"; export CC; \
++	CPP="$(CC_FOR_BUILD) -E"; export CPP; \
+ 	CFLAGS="$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
+ 	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
+ 	CXX="$(CXX_FOR_BUILD)"; export CXX; \
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0019-Ensure-target-gcc-headers-can-be-included.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0019-Ensure-target-gcc-headers-can-be-included.patch
new file mode 100644
index 0000000..2797b2c
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0019-Ensure-target-gcc-headers-can-be-included.patch
@@ -0,0 +1,57 @@
+From 378b752c5d9a3dba4e58cdadf8b4b4f34ea99a76 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 20 Feb 2015 10:25:11 +0000
+Subject: [PATCH] Ensure target gcc headers can be included
+
+There are a few headers installed as part of the OpenEmbedded
+gcc-runtime target (omp.h, ssp/*.h). Being installed from a recipe
+built for the target architecture, these are within the target
+sysroot and not cross/nativesdk; thus they weren't able to be
+found by gcc with the existing search paths. Add support for
+picking up these headers under the sysroot supplied on the gcc
+command line in order to resolve this.
+
+Upstream-Status: Pending
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gcc/Makefile.in  | 2 ++
+ gcc/cppdefault.c | 4 ++++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/gcc/Makefile.in b/gcc/Makefile.in
+index 480c9366418..011c7ac2db6 100644
+--- a/gcc/Makefile.in
++++ b/gcc/Makefile.in
+@@ -618,6 +618,7 @@ libexecdir = @libexecdir@
+ 
+ # Directory in which the compiler finds libraries etc.
+ libsubdir = $(libdir)/gcc/$(real_target_noncanonical)/$(version)$(accel_dir_suffix)
++libsubdir_target = $(target_noncanonical)/$(version)
+ # Directory in which the compiler finds executables
+ libexecsubdir = $(libexecdir)/gcc/$(real_target_noncanonical)/$(version)$(accel_dir_suffix)
+ # Directory in which all plugin resources are installed
+@@ -2946,6 +2947,7 @@ CFLAGS-intl.o += -DLOCALEDIR=\"$(localedir)\"
+ 
+ PREPROCESSOR_DEFINES = \
+   -DGCC_INCLUDE_DIR=\"$(libsubdir)/include\" \
++  -DGCC_INCLUDE_SUBDIR_TARGET=\"$(libsubdir_target)/include\" \
+   -DFIXED_INCLUDE_DIR=\"$(libsubdir)/include-fixed\" \
+   -DGPLUSPLUS_INCLUDE_DIR=\"$(gcc_gxx_include_dir)\" \
+   -DGPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT=$(gcc_gxx_include_dir_add_sysroot) \
+diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
+index af38cc494ea..2f43b88a0c3 100644
+--- a/gcc/cppdefault.c
++++ b/gcc/cppdefault.c
+@@ -59,6 +59,10 @@ const struct default_include cpp_include_defaults[]
+     /* This is the dir for gcc's private headers.  */
+     { GCC_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
+ #endif
++#ifdef GCC_INCLUDE_SUBDIR_TARGET
++    /* This is the dir for gcc's private headers under the specified sysroot.  */
++    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC", 0, 0, 1, 0 },
++#endif
+ #ifdef LOCAL_INCLUDE_DIR
+     /* /usr/local/include comes before the fixincluded header files.  */
+     { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch
new file mode 100644
index 0000000..c3baf8b
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch
@@ -0,0 +1,35 @@
+From 870e805d705d99d9b9d7dbd09727f9c1d2ad9c1d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 3 Mar 2015 08:21:19 +0000
+Subject: [PATCH] Don't search host directory during "relink" if $inst_prefix
+ is provided
+
+http://lists.gnu.org/archive/html/libtool-patches/2011-01/msg00026.html
+
+Upstream-Status: Submitted
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ ltmain.sh | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/ltmain.sh b/ltmain.sh
+index 9ebc7e3d1e0..7ea79fa8be6 100644
+--- a/ltmain.sh
++++ b/ltmain.sh
+@@ -6004,12 +6004,13 @@ func_mode_link ()
+ 	      fi
+ 	    else
+ 	      # We cannot seem to hardcode it, guess we'll fake it.
++	      # Default if $libdir is not relative to the prefix:
+ 	      add_dir="-L$libdir"
+-	      # Try looking first in the location we're being installed to.
++
+ 	      if test -n "$inst_prefix_dir"; then
+ 		case $libdir in
+ 		  [\\/]*)
+-		    add_dir="$add_dir -L$inst_prefix_dir$libdir"
++		    add_dir="-L$inst_prefix_dir$libdir"
+ 		    ;;
+ 		esac
+ 	      fi
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
new file mode 100644
index 0000000..abee486
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
@@ -0,0 +1,26 @@
+From aba42de763a619355471efd1573561b0cbf51162 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 28 Apr 2015 23:15:27 -0700
+Subject: [PATCH] Use SYSTEMLIBS_DIR replacement instead of hardcoding
+ base_libdir
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gcc/config/aarch64/aarch64-linux.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aarch64-linux.h
+index e587e2e9ad6..ddc62895693 100644
+--- a/gcc/config/aarch64/aarch64-linux.h
++++ b/gcc/config/aarch64/aarch64-linux.h
+@@ -21,7 +21,7 @@
+ #ifndef GCC_AARCH64_LINUX_H
+ #define GCC_AARCH64_LINUX_H
+ 
+-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
++#define GLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-linux-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
+ 
+ #undef MUSL_DYNAMIC_LINKER
+ #define MUSL_DYNAMIC_LINKER "/lib/ld-musl-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0022-aarch64-Add-support-for-musl-ldso.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0022-aarch64-Add-support-for-musl-ldso.patch
new file mode 100644
index 0000000..c55b66d
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0022-aarch64-Add-support-for-musl-ldso.patch
@@ -0,0 +1,25 @@
+From d63820a78d92f302410358293546f01c7ad17bd8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 28 Apr 2015 23:18:39 -0700
+Subject: [PATCH] aarch64: Add support for musl ldso
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gcc/config/aarch64/aarch64-linux.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aarch64-linux.h
+index ddc62895693..b301825313a 100644
+--- a/gcc/config/aarch64/aarch64-linux.h
++++ b/gcc/config/aarch64/aarch64-linux.h
+@@ -24,7 +24,7 @@
+ #define GLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-linux-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
+ 
+ #undef MUSL_DYNAMIC_LINKER
+-#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
++#define MUSL_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-musl-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
+ 
+ #undef  ASAN_CC1_SPEC
+ #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch
new file mode 100644
index 0000000..80c4d22
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch
@@ -0,0 +1,51 @@
+From 3474e16ad4ea8cf4e0e330568e3bc9039e723dce Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Sun, 5 Jul 2015 20:25:18 -0700
+Subject: [PATCH] libcc1: fix libcc1's install path and rpath
+
+* Install libcc1.so and libcc1plugin.so into
+  $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_version), as what we
+  had done to lto-plugin.
+* Fix bad RPATH iussue:
+  gcc-5.2.0: package gcc-plugins contains bad RPATH /patht/to/tmp/sysroots/qemux86-64/usr/lib64/../lib64 in file
+ /path/to/gcc/5.2.0-r0/packages-split/gcc-plugins/usr/lib64/gcc/x86_64-poky-linux/5.2.0/plugin/libcc1plugin.so.0.0.0
+ [rpaths]
+
+Upstream-Status: Inappropriate [OE configuration]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ libcc1/Makefile.am | 4 ++--
+ libcc1/Makefile.in | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/libcc1/Makefile.am b/libcc1/Makefile.am
+index c005b0dad4a..ec31d35b7b9 100644
+--- a/libcc1/Makefile.am
++++ b/libcc1/Makefile.am
+@@ -37,8 +37,8 @@ libiberty = $(if $(wildcard $(libiberty_noasan)),$(Wc)$(libiberty_noasan), \
+ 	    $(Wc)$(libiberty_normal)))
+ libiberty_dep = $(patsubst $(Wc)%,%,$(libiberty))
+ 
+-plugindir = $(libdir)/gcc/$(target_noncanonical)/$(gcc_version)/plugin
+-cc1libdir = $(libdir)/$(libsuffix)
++cc1libdir = $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_version)
++plugindir = $(cc1libdir)
+ 
+ if ENABLE_PLUGIN
+ plugin_LTLIBRARIES = libcc1plugin.la libcp1plugin.la
+diff --git a/libcc1/Makefile.in b/libcc1/Makefile.in
+index 7104b649026..2103c477468 100644
+--- a/libcc1/Makefile.in
++++ b/libcc1/Makefile.in
+@@ -393,8 +393,8 @@ libiberty = $(if $(wildcard $(libiberty_noasan)),$(Wc)$(libiberty_noasan), \
+ 	    $(Wc)$(libiberty_normal)))
+ 
+ libiberty_dep = $(patsubst $(Wc)%,%,$(libiberty))
+-plugindir = $(libdir)/gcc/$(target_noncanonical)/$(gcc_version)/plugin
+-cc1libdir = $(libdir)/$(libsuffix)
++cc1libdir = $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_version)
++plugindir = $(cc1libdir)
+ @ENABLE_PLUGIN_TRUE@plugin_LTLIBRARIES = libcc1plugin.la libcp1plugin.la
+ @ENABLE_PLUGIN_TRUE@cc1lib_LTLIBRARIES = libcc1.la
+ shared_source = callbacks.cc callbacks.hh connection.cc connection.hh \
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0024-handle-sysroot-support-for-nativesdk-gcc.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0024-handle-sysroot-support-for-nativesdk-gcc.patch
new file mode 100644
index 0000000..dc3e6da
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0024-handle-sysroot-support-for-nativesdk-gcc.patch
@@ -0,0 +1,349 @@
+From 702daf2e9cb97337e0e594fcd435b1b61a917d14 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 7 Dec 2015 23:39:54 +0000
+Subject: [PATCH] handle sysroot support for nativesdk-gcc
+
+Being able to build a nativesdk gcc is useful, particularly in cases
+where the host compiler may be of an incompatible version (or a 32
+bit compiler is needed).
+
+Sadly, building nativesdk-gcc is not straight forward. We install
+nativesdk-gcc into a relocatable location and this means that its
+library locations can change. "Normal" sysroot support doesn't help
+in this case since the values of paths like "libdir" change, not just
+base root directory of the system.
+
+In order to handle this we do two things:
+
+a) Add %r into spec file markup which can be used for injected paths
+   such as SYSTEMLIBS_DIR (see gcc_multilib_setup()).
+b) Add other paths which need relocation into a .gccrelocprefix section
+   which the relocation code will notice and adjust automatically.
+
+Upstream-Status: Inappropriate
+RP 2015/7/28
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Added PREFIXVAR and EXEC_PREFIXVAR to support runtime relocation.  Without
+these as part of the gccrelocprefix the system can't do runtime relocation
+if the executable is moved.  (These paths were missed in the original
+implementation.)
+
+Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
+---
+ gcc/c-family/c-opts.c |  4 +--
+ gcc/cppdefault.c      | 63 ++++++++++++++++++++++++++-----------------
+ gcc/cppdefault.h      | 13 ++++-----
+ gcc/gcc.c             | 20 +++++++++-----
+ gcc/incpath.c         | 12 ++++-----
+ gcc/prefix.c          |  6 +++--
+ 6 files changed, 70 insertions(+), 48 deletions(-)
+
+diff --git a/gcc/c-family/c-opts.c b/gcc/c-family/c-opts.c
+index 58ba0948e79..806bbcfb7a5 100644
+--- a/gcc/c-family/c-opts.c
++++ b/gcc/c-family/c-opts.c
+@@ -1409,8 +1409,8 @@ add_prefixed_path (const char *suffix, incpath_kind chain)
+   size_t prefix_len, suffix_len;
+ 
+   suffix_len = strlen (suffix);
+-  prefix     = iprefix ? iprefix : cpp_GCC_INCLUDE_DIR;
+-  prefix_len = iprefix ? strlen (iprefix) : cpp_GCC_INCLUDE_DIR_len;
++  prefix     = iprefix ? iprefix : GCC_INCLUDE_DIRVAR;
++  prefix_len = iprefix ? strlen (iprefix) : strlen(GCC_INCLUDE_DIRVAR) - 7;
+ 
+   path = (char *) xmalloc (prefix_len + suffix_len + 1);
+   memcpy (path, prefix, prefix_len);
+diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
+index 2f43b88a0c3..6b6be04686c 100644
+--- a/gcc/cppdefault.c
++++ b/gcc/cppdefault.c
+@@ -35,6 +35,30 @@
+ # undef CROSS_INCLUDE_DIR
+ #endif
+ 
++static char GPLUSPLUS_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = GPLUSPLUS_INCLUDE_DIR;
++char GCC_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = GCC_INCLUDE_DIR;
++static char GPLUSPLUS_TOOL_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = GPLUSPLUS_TOOL_INCLUDE_DIR;
++static char GPLUSPLUS_BACKWARD_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = GPLUSPLUS_BACKWARD_INCLUDE_DIR;
++static char STANDARD_STARTFILE_PREFIX_2VAR[4096] __attribute__ ((section (".gccrelocprefix"))) = STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET;
++#ifdef LOCAL_INCLUDE_DIR
++static char LOCAL_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = LOCAL_INCLUDE_DIR;
++#endif
++#ifdef PREFIX_INCLUDE_DIR
++static char PREFIX_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = PREFIX_INCLUDE_DIR;
++#endif
++#ifdef FIXED_INCLUDE_DIR
++static char FIXED_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = FIXED_INCLUDE_DIR;
++#endif
++#ifdef CROSS_INCLUDE_DIR
++static char CROSS_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = CROSS_INCLUDE_DIR;
++#endif
++#ifdef TOOL_INCLUDE_DIR
++static char TOOL_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = TOOL_INCLUDE_DIR;
++#endif
++#ifdef NATIVE_SYSTEM_HEADER_DIR
++static char NATIVE_SYSTEM_HEADER_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = NATIVE_SYSTEM_HEADER_DIR;
++#endif
++
+ const struct default_include cpp_include_defaults[]
+ #ifdef INCLUDE_DEFAULTS
+ = INCLUDE_DEFAULTS;
+@@ -42,38 +66,38 @@ const struct default_include cpp_include_defaults[]
+ = {
+ #ifdef GPLUSPLUS_INCLUDE_DIR
+     /* Pick up GNU C++ generic include files.  */
+-    { GPLUSPLUS_INCLUDE_DIR, "G++", 1, 1,
++    { GPLUSPLUS_INCLUDE_DIRVAR, "G++", 1, 1,
+       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
+ #endif
+ #ifdef GPLUSPLUS_TOOL_INCLUDE_DIR
+     /* Pick up GNU C++ target-dependent include files.  */
+-    { GPLUSPLUS_TOOL_INCLUDE_DIR, "G++", 1, 1,
++    { GPLUSPLUS_TOOL_INCLUDE_DIRVAR, "G++", 1, 1,
+       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 1 },
+ #endif
+ #ifdef GPLUSPLUS_BACKWARD_INCLUDE_DIR
+     /* Pick up GNU C++ backward and deprecated include files.  */
+-    { GPLUSPLUS_BACKWARD_INCLUDE_DIR, "G++", 1, 1,
++    { GPLUSPLUS_BACKWARD_INCLUDE_DIRVAR, "G++", 1, 1,
+       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
+ #endif
+ #ifdef GCC_INCLUDE_DIR
+     /* This is the dir for gcc's private headers.  */
+-    { GCC_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
++    { GCC_INCLUDE_DIRVAR, "GCC", 0, 0, 0, 0 },
+ #endif
+ #ifdef GCC_INCLUDE_SUBDIR_TARGET
+     /* This is the dir for gcc's private headers under the specified sysroot.  */
+-    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC", 0, 0, 1, 0 },
++    { STANDARD_STARTFILE_PREFIX_2VAR, "GCC", 0, 0, 1, 0 },
+ #endif
+ #ifdef LOCAL_INCLUDE_DIR
+     /* /usr/local/include comes before the fixincluded header files.  */
+-    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },
+-    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 0 },
++    { LOCAL_INCLUDE_DIRVAR, 0, 0, 1, 1, 2 },
++    { LOCAL_INCLUDE_DIRVAR, 0, 0, 1, 1, 0 },
+ #endif
+ #ifdef PREFIX_INCLUDE_DIR
+-    { PREFIX_INCLUDE_DIR, 0, 0, 1, 0, 0 },
++    { PREFIX_INCLUDE_DIRVAR, 0, 0, 1, 0, 0 },
+ #endif
+ #ifdef FIXED_INCLUDE_DIR
+     /* This is the dir for fixincludes.  */
+-    { FIXED_INCLUDE_DIR, "GCC", 0, 0, 0,
++    { FIXED_INCLUDE_DIRVAR, "GCC", 0, 0, 0,
+       /* A multilib suffix needs adding if different multilibs use
+ 	 different headers.  */
+ #ifdef SYSROOT_HEADERS_SUFFIX_SPEC
+@@ -85,33 +109,24 @@ const struct default_include cpp_include_defaults[]
+ #endif
+ #ifdef CROSS_INCLUDE_DIR
+     /* One place the target system's headers might be.  */
+-    { CROSS_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
++    { CROSS_INCLUDE_DIRVAR, "GCC", 0, 0, 0, 0 },
+ #endif
+ #ifdef TOOL_INCLUDE_DIR
+     /* Another place the target system's headers might be.  */
+-    { TOOL_INCLUDE_DIR, "BINUTILS", 0, 1, 0, 0 },
++    { TOOL_INCLUDE_DIRVAR, "BINUTILS", 0, 1, 0, 0 },
+ #endif
+ #ifdef NATIVE_SYSTEM_HEADER_DIR
+     /* /usr/include comes dead last.  */
+-    { NATIVE_SYSTEM_HEADER_DIR, NATIVE_SYSTEM_HEADER_COMPONENT, 0, 0, 1, 2 },
+-    { NATIVE_SYSTEM_HEADER_DIR, NATIVE_SYSTEM_HEADER_COMPONENT, 0, 0, 1, 0 },
++    { NATIVE_SYSTEM_HEADER_DIRVAR, NATIVE_SYSTEM_HEADER_COMPONENT, 0, 0, 1, 2 },
++    { NATIVE_SYSTEM_HEADER_DIRVAR, NATIVE_SYSTEM_HEADER_COMPONENT, 0, 0, 1, 0 },
+ #endif
+     { 0, 0, 0, 0, 0, 0 }
+   };
+ #endif /* no INCLUDE_DEFAULTS */
+ 
+-#ifdef GCC_INCLUDE_DIR
+-const char cpp_GCC_INCLUDE_DIR[] = GCC_INCLUDE_DIR;
+-const size_t cpp_GCC_INCLUDE_DIR_len = sizeof GCC_INCLUDE_DIR - 8;
+-#else
+-const char cpp_GCC_INCLUDE_DIR[] = "";
+-const size_t cpp_GCC_INCLUDE_DIR_len = 0;
+-#endif
+-
+ /* The configured prefix.  */
+-const char cpp_PREFIX[] = PREFIX;
+-const size_t cpp_PREFIX_len = sizeof PREFIX - 1;
+-const char cpp_EXEC_PREFIX[] = STANDARD_EXEC_PREFIX;
++char PREFIXVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = PREFIX;
++char EXEC_PREFIXVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = STANDARD_EXEC_PREFIX;
+ 
+ /* This value is set by cpp_relocated at runtime */
+ const char *gcc_exec_prefix;
+diff --git a/gcc/cppdefault.h b/gcc/cppdefault.h
+index a681264f75e..5e10a2fa140 100644
+--- a/gcc/cppdefault.h
++++ b/gcc/cppdefault.h
+@@ -33,7 +33,8 @@
+ 
+ struct default_include
+ {
+-  const char *const fname;	/* The name of the directory.  */
++  const char *fname;     /* The name of the directory.  */
++
+   const char *const component;	/* The component containing the directory
+ 				   (see update_path in prefix.c) */
+   const char cplusplus;		/* Only look here if we're compiling C++.  */
+@@ -50,17 +51,13 @@ struct default_include
+ };
+ 
+ extern const struct default_include cpp_include_defaults[];
+-extern const char cpp_GCC_INCLUDE_DIR[];
+-extern const size_t cpp_GCC_INCLUDE_DIR_len;
++extern char GCC_INCLUDE_DIRVAR[] __attribute__ ((section (".gccrelocprefix")));
+ 
+ /* The configure-time prefix, i.e., the value supplied as the argument
+    to --prefix=.  */
+-extern const char cpp_PREFIX[];
++extern char PREFIXVAR[] __attribute__ ((section (".gccrelocprefix")));
+ /* The length of the configure-time prefix.  */
+-extern const size_t cpp_PREFIX_len;
+-/* The configure-time execution prefix.  This is typically the lib/gcc
+-   subdirectory of cpp_PREFIX.  */
+-extern const char cpp_EXEC_PREFIX[];
++extern char EXEC_PREFIXVAR[] __attribute__ ((section (".gccrelocprefix")));
+ /* The run-time execution prefix.  This is typically the lib/gcc
+    subdirectory of the actual installation.  */
+ extern const char *gcc_exec_prefix;
+diff --git a/gcc/gcc.c b/gcc/gcc.c
+index c87f603955f..535d5c3bb65 100644
+--- a/gcc/gcc.c
++++ b/gcc/gcc.c
+@@ -252,6 +252,8 @@ FILE *report_times_to_file = NULL;
+ #endif
+ static const char *target_system_root = DEFAULT_TARGET_SYSTEM_ROOT;
+ 
++static char target_relocatable_prefix[4096] __attribute__ ((section (".gccrelocprefix"))) = SYSTEMLIBS_DIR;
++
+ /* Nonzero means pass the updated target_system_root to the compiler.  */
+ 
+ static int target_system_root_changed;
+@@ -526,6 +528,7 @@ or with constant text in a single argument.
+  %G     process LIBGCC_SPEC as a spec.
+  %R     Output the concatenation of target_system_root and
+         target_sysroot_suffix.
++ %r     Output the base path target_relocatable_prefix
+  %S     process STARTFILE_SPEC as a spec.  A capital S is actually used here.
+  %E     process ENDFILE_SPEC as a spec.  A capital E is actually used here.
+  %C     process CPP_SPEC as a spec.
+@@ -1499,10 +1502,10 @@ static const char *gcc_libexec_prefix;
+    gcc_exec_prefix is set because, in that case, we know where the
+    compiler has been installed, and use paths relative to that
+    location instead.  */
+-static const char *const standard_exec_prefix = STANDARD_EXEC_PREFIX;
+-static const char *const standard_libexec_prefix = STANDARD_LIBEXEC_PREFIX;
+-static const char *const standard_bindir_prefix = STANDARD_BINDIR_PREFIX;
+-static const char *const standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;
++static char standard_exec_prefix[4096] __attribute__ ((section (".gccrelocprefix"))) = STANDARD_EXEC_PREFIX;
++static char standard_libexec_prefix[4096] __attribute__ ((section (".gccrelocprefix"))) = STANDARD_LIBEXEC_PREFIX;
++static char standard_bindir_prefix[4096] __attribute__ ((section (".gccrelocprefix"))) = STANDARD_BINDIR_PREFIX;
++static char *const standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;
+ 
+ /* For native compilers, these are well-known paths containing
+    components that may be provided by the system.  For cross
+@@ -1510,9 +1513,9 @@ static const char *const standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;
+ static const char *md_exec_prefix = MD_EXEC_PREFIX;
+ static const char *md_startfile_prefix = MD_STARTFILE_PREFIX;
+ static const char *md_startfile_prefix_1 = MD_STARTFILE_PREFIX_1;
+-static const char *const standard_startfile_prefix_1
++static char standard_startfile_prefix_1[4096] __attribute__ ((section (".gccrelocprefix")))
+   = STANDARD_STARTFILE_PREFIX_1;
+-static const char *const standard_startfile_prefix_2
++static char standard_startfile_prefix_2[4096] __attribute__ ((section (".gccrelocprefix")))
+   = STANDARD_STARTFILE_PREFIX_2;
+ 
+ /* A relative path to be used in finding the location of tools
+@@ -5952,6 +5955,11 @@ do_spec_1 (const char *spec, int inswitch, const char *soft_matched_part)
+ 	      }
+ 	    break;
+ 
++          case 'r':
++              obstack_grow (&obstack, target_relocatable_prefix,
++		      strlen (target_relocatable_prefix));
++            break;
++
+ 	  case 'S':
+ 	    value = do_spec_1 (startfile_spec, 0, NULL);
+ 	    if (value != 0)
+diff --git a/gcc/incpath.c b/gcc/incpath.c
+index 9098ab044ab..bfad4ebe382 100644
+--- a/gcc/incpath.c
++++ b/gcc/incpath.c
+@@ -131,7 +131,7 @@ add_standard_paths (const char *sysroot, const char *iprefix,
+   int relocated = cpp_relocated ();
+   size_t len;
+ 
+-  if (iprefix && (len = cpp_GCC_INCLUDE_DIR_len) != 0)
++  if (iprefix && (len = strlen(GCC_INCLUDE_DIRVAR) - 7) != 0)
+     {
+       /* Look for directories that start with the standard prefix.
+ 	 "Translate" them, i.e. replace /usr/local/lib/gcc... with
+@@ -145,7 +145,7 @@ add_standard_paths (const char *sysroot, const char *iprefix,
+ 		 now.  */
+ 	      if (sysroot && p->add_sysroot)
+ 		continue;
+-	      if (!filename_ncmp (p->fname, cpp_GCC_INCLUDE_DIR, len))
++	      if (!filename_ncmp (p->fname, GCC_INCLUDE_DIRVAR, len))
+ 		{
+ 		  char *str = concat (iprefix, p->fname + len, NULL);
+ 		  if (p->multilib == 1 && imultilib)
+@@ -185,7 +185,7 @@ add_standard_paths (const char *sysroot, const char *iprefix,
+ 	      free (sysroot_no_trailing_dir_separator);
+ 	    }
+ 	  else if (!p->add_sysroot && relocated
+-		   && !filename_ncmp (p->fname, cpp_PREFIX, cpp_PREFIX_len))
++		   && !filename_ncmp (p->fname, PREFIXVAR, strlen(PREFIXVAR)))
+ 	    {
+  	      static const char *relocated_prefix;
+ 	      char *ostr;
+@@ -202,12 +202,12 @@ add_standard_paths (const char *sysroot, const char *iprefix,
+ 		  dummy = concat (gcc_exec_prefix, "dummy", NULL);
+ 		  relocated_prefix
+ 		    = make_relative_prefix (dummy,
+-					    cpp_EXEC_PREFIX,
+-					    cpp_PREFIX);
++					    EXEC_PREFIXVAR,
++					    PREFIXVAR);
+ 		  free (dummy);
+ 		}
+ 	      ostr = concat (relocated_prefix,
+-			     p->fname + cpp_PREFIX_len,
++			     p->fname + strlen(PREFIXVAR),
+ 			     NULL);
+ 	      str = update_path (ostr, p->component);
+ 	      free (ostr);
+diff --git a/gcc/prefix.c b/gcc/prefix.c
+index 1a403e535bd..c26d07bde12 100644
+--- a/gcc/prefix.c
++++ b/gcc/prefix.c
+@@ -72,7 +72,9 @@ License along with GCC; see the file COPYING3.  If not see
+ #include "prefix.h"
+ #include "common/common-target.h"
+ 
+-static const char *std_prefix = PREFIX;
++char PREFIXVAR1[4096] __attribute__ ((section (".gccrelocprefix"))) = PREFIX;
++
++static const char *std_prefix = PREFIXVAR1;
+ 
+ static const char *get_key_value (char *);
+ static char *translate_name (char *);
+@@ -212,7 +214,7 @@ translate_name (char *name)
+ 	prefix = getenv (key);
+ 
+       if (prefix == 0)
+-	prefix = PREFIX;
++	prefix = PREFIXVAR1;
+ 
+       /* We used to strip trailing DIR_SEPARATORs here, but that can
+ 	 sometimes yield a result with no separator when one was coded
+-- 
+2.29.2
+
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch
new file mode 100644
index 0000000..abf1f84
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch
@@ -0,0 +1,99 @@
+From 9c0c73ee48dbee2aad57f4dcdad1b7b74e77b944 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 7 Dec 2015 23:41:45 +0000
+Subject: [PATCH] Search target sysroot gcc version specific dirs with
+ multilib.
+
+We install the gcc libraries (such as crtbegin.p) into
+<sysroot><libdir>/<target-sys>/5.2.0/
+which is a default search path for GCC (aka multi_suffix in the
+code below). <target-sys> is 'machine' in gcc's terminology. We use
+these directories so that multiple gcc versions could in theory
+co-exist on target.
+
+We only want to build one gcc-cross-canadian per arch and have this work
+for all multilibs. <target-sys> can be handled by mapping the multilib
+<target-sys> to the one used by gcc-cross-canadian, e.g.
+mips64-polkmllib32-linux
+is symlinked to by mips64-poky-linux.
+
+The default gcc search path in the target sysroot for a "lib64" mutlilib
+is:
+
+<sysroot>/lib32/mips64-poky-linux/5.2.0/
+<sysroot>/lib32/../lib64/
+<sysroot>/usr/lib32/mips64-poky-linux/5.2.0/
+<sysroot>/usr/lib32/../lib64/
+<sysroot>/lib32/
+<sysroot>/usr/lib32/
+
+which means that the lib32 crtbegin.o will be found and the lib64 ones
+will not which leads to compiler failures.
+
+This patch injects a multilib version of that path first so the lib64
+binaries can be found first. With this change the search path becomes:
+
+<sysroot>/lib32/../lib64/mips64-poky-linux/5.2.0/
+<sysroot>/lib32/mips64-poky-linux/5.2.0/
+<sysroot>/lib32/../lib64/
+<sysroot>/usr/lib32/../lib64/mips64-poky-linux/5.2.0/
+<sysroot>/usr/lib32/mips64-poky-linux/5.2.0/
+<sysroot>/usr/lib32/../lib64/
+<sysroot>/lib32/
+<sysroot>/usr/lib32/
+
+Upstream-Status: Pending
+RP 2015/7/31
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gcc/gcc.c | 29 ++++++++++++++++++++++++++++-
+ 1 file changed, 28 insertions(+), 1 deletion(-)
+
+diff --git a/gcc/gcc.c b/gcc/gcc.c
+index 535d5c3bb65..04647ae812d 100644
+--- a/gcc/gcc.c
++++ b/gcc/gcc.c
+@@ -2616,7 +2616,7 @@ for_each_path (const struct path_prefix *paths,
+       if (path == NULL)
+ 	{
+ 	  len = paths->max_len + extra_space + 1;
+-	  len += MAX (MAX (suffix_len, multi_os_dir_len), multiarch_len);
++	  len += MAX ((suffix_len + multi_os_dir_len), multiarch_len);
+ 	  path = XNEWVEC (char, len);
+ 	}
+ 
+@@ -2628,6 +2628,33 @@ for_each_path (const struct path_prefix *paths,
+ 	  /* Look first in MACHINE/VERSION subdirectory.  */
+ 	  if (!skip_multi_dir)
+ 	    {
++	      if (!(pl->os_multilib ? skip_multi_os_dir : skip_multi_dir))
++	        {
++	          const char *this_multi;
++	          size_t this_multi_len;
++
++	          if (pl->os_multilib)
++		    {
++		      this_multi = multi_os_dir;
++		      this_multi_len = multi_os_dir_len;
++		    }
++	          else
++		    {
++		      this_multi = multi_dir;
++		      this_multi_len = multi_dir_len;
++		    }
++
++	          /* Look in multilib MACHINE/VERSION subdirectory first */
++	          if (this_multi_len)
++	            {
++		      memcpy (path + len, this_multi, this_multi_len + 1);
++	              memcpy (path + len + this_multi_len, multi_suffix, suffix_len + 1);
++	              ret = callback (path, callback_info);
++	                if (ret)
++		          break;
++	            }
++	        }
++
+ 	      memcpy (path + len, multi_suffix, suffix_len + 1);
+ 	      ret = callback (path, callback_info);
+ 	      if (ret)
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0026-Fix-various-_FOR_BUILD-and-related-variables.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0026-Fix-various-_FOR_BUILD-and-related-variables.patch
new file mode 100644
index 0000000..97bf2f3
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0026-Fix-various-_FOR_BUILD-and-related-variables.patch
@@ -0,0 +1,134 @@
+From 3a003af8804dda90fdf4862eca5f66cb12faaf02 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 7 Dec 2015 23:42:45 +0000
+Subject: [PATCH] Fix various _FOR_BUILD and related variables
+
+When doing a FOR_BUILD thing, you have to override CFLAGS with
+CFLAGS_FOR_BUILD. And if you use C++, you also have to override
+CXXFLAGS with CXXFLAGS_FOR_BUILD.
+Without this, when building for mingw, you end up trying to use
+the mingw headers for a host build.
+
+The same goes for other variables as well, such as CPPFLAGS,
+CPP, and GMPINC.
+
+Upstream-Status: Pending
+
+Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile.in      | 6 ++++++
+ Makefile.tpl     | 5 +++++
+ gcc/Makefile.in  | 2 +-
+ gcc/configure    | 2 +-
+ gcc/configure.ac | 2 +-
+ 5 files changed, 14 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index c717903bb13..5abc649868d 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -152,6 +152,7 @@ BUILD_EXPORTS = \
+ 	CPP="$(CC_FOR_BUILD) -E"; export CPP; \
+ 	CFLAGS="$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
+ 	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
++	CPPFLAGS="$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS; \
+ 	CXX="$(CXX_FOR_BUILD)"; export CXX; \
+ 	CXXFLAGS="$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
+ 	GFORTRAN="$(GFORTRAN_FOR_BUILD)"; export GFORTRAN; \
+@@ -171,6 +172,9 @@ BUILD_EXPORTS = \
+ # built for the build system to override those in BASE_FLAGS_TO_PASS.
+ EXTRA_BUILD_FLAGS = \
+ 	CFLAGS="$(CFLAGS_FOR_BUILD)" \
++	CXXFLAGS="$(CXXFLAGS_FOR_BUILD)" \
++	CPP="$(CC_FOR_BUILD) -E" \
++	CPPFLAGS="$(CPPFLAGS_FOR_BUILD)" \
+ 	LDFLAGS="$(LDFLAGS_FOR_BUILD)"
+ 
+ # This is the list of directories to built for the host system.
+@@ -188,6 +192,7 @@ HOST_SUBDIR = @host_subdir@
+ HOST_EXPORTS = \
+ 	$(BASE_EXPORTS) \
+ 	CC="$(CC)"; export CC; \
++	CPP="$(CC) -E"; export CPP; \
+ 	ADA_CFLAGS="$(ADA_CFLAGS)"; export ADA_CFLAGS; \
+ 	CFLAGS="$(CFLAGS)"; export CFLAGS; \
+ 	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
+@@ -776,6 +781,7 @@ BASE_FLAGS_TO_PASS = \
+ 	"CC_FOR_BUILD=$(CC_FOR_BUILD)" \
+ 	"CFLAGS_FOR_BUILD=$(CFLAGS_FOR_BUILD)" \
+ 	"CXX_FOR_BUILD=$(CXX_FOR_BUILD)" \
++	"CXXFLAGS_FOR_BUILD=$(CXXFLAGS_FOR_BUILD)" \
+ 	"EXPECT=$(EXPECT)" \
+ 	"FLEX=$(FLEX)" \
+ 	"INSTALL=$(INSTALL)" \
+diff --git a/Makefile.tpl b/Makefile.tpl
+index efed1511750..778beb705b4 100644
+--- a/Makefile.tpl
++++ b/Makefile.tpl
+@@ -154,6 +154,7 @@ BUILD_EXPORTS = \
+ 	CC="$(CC_FOR_BUILD)"; export CC; \
+ 	CFLAGS="$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
+ 	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
++	CPPFLAGS="$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS; \
+ 	CXX="$(CXX_FOR_BUILD)"; export CXX; \
+ 	CXXFLAGS="$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
+ 	GFORTRAN="$(GFORTRAN_FOR_BUILD)"; export GFORTRAN; \
+@@ -173,6 +174,9 @@ BUILD_EXPORTS = \
+ # built for the build system to override those in BASE_FLAGS_TO_PASS.
+ EXTRA_BUILD_FLAGS = \
+ 	CFLAGS="$(CFLAGS_FOR_BUILD)" \
++	CXXFLAGS="$(CXXFLAGS_FOR_BUILD)" \
++	CPP="$(CC_FOR_BUILD) -E" \
++	CPPFLAGS="$(CPPFLAGS_FOR_BUILD)" \
+ 	LDFLAGS="$(LDFLAGS_FOR_BUILD)"
+ 
+ # This is the list of directories to built for the host system.
+@@ -190,6 +194,7 @@ HOST_SUBDIR = @host_subdir@
+ HOST_EXPORTS = \
+ 	$(BASE_EXPORTS) \
+ 	CC="$(CC)"; export CC; \
++	CPP="$(CC) -E"; export CPP; \
+ 	ADA_CFLAGS="$(ADA_CFLAGS)"; export ADA_CFLAGS; \
+ 	CFLAGS="$(CFLAGS)"; export CFLAGS; \
+ 	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
+diff --git a/gcc/Makefile.in b/gcc/Makefile.in
+index 011c7ac2db6..2f1165f7b5e 100644
+--- a/gcc/Makefile.in
++++ b/gcc/Makefile.in
+@@ -805,7 +805,7 @@ BUILD_LDFLAGS=@BUILD_LDFLAGS@
+ BUILD_NO_PIE_FLAG = @BUILD_NO_PIE_FLAG@
+ BUILD_LDFLAGS += $(BUILD_NO_PIE_FLAG)
+ BUILD_CPPFLAGS= -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
+-		-I$(srcdir)/../include @INCINTL@ $(CPPINC) $(CPPFLAGS)
++		-I$(srcdir)/../include @INCINTL@ $(CPPINC) $(CPPFLAGS_FOR_BUILD)
+ 
+ # Actual name to use when installing a native compiler.
+ GCC_INSTALL_NAME := $(shell echo gcc|sed '$(program_transform_name)')
+diff --git a/gcc/configure b/gcc/configure
+index 825a9652329..ff46cf58960 100755
+--- a/gcc/configure
++++ b/gcc/configure
+@@ -12314,7 +12314,7 @@ else
+ 	CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
+ 	CXX="${CXX_FOR_BUILD}" CXXFLAGS="${CXXFLAGS_FOR_BUILD}" \
+ 	LD="${LD_FOR_BUILD}" LDFLAGS="${LDFLAGS_FOR_BUILD}" \
+-	GMPINC="" CPPFLAGS="${CPPFLAGS} -DGENERATOR_FILE" \
++	GMPINC="" CPPFLAGS="${CPPFLAGS_FOR_BUILD} -DGENERATOR_FILE" \
+ 	${realsrcdir}/configure \
+ 		--enable-languages=${enable_languages-all} \
+ 		${enable_obsolete+--enable-obsolete="$enable_obsolete"} \
+diff --git a/gcc/configure.ac b/gcc/configure.ac
+index 6099eb3251f..b3c345b61dc 100644
+--- a/gcc/configure.ac
++++ b/gcc/configure.ac
+@@ -1898,7 +1898,7 @@ else
+ 	CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
+ 	CXX="${CXX_FOR_BUILD}" CXXFLAGS="${CXXFLAGS_FOR_BUILD}" \
+ 	LD="${LD_FOR_BUILD}" LDFLAGS="${LDFLAGS_FOR_BUILD}" \
+-	GMPINC="" CPPFLAGS="${CPPFLAGS} -DGENERATOR_FILE" \
++	GMPINC="" CPPFLAGS="${CPPFLAGS_FOR_BUILD} -DGENERATOR_FILE" \
+ 	${realsrcdir}/configure \
+ 		--enable-languages=${enable_languages-all} \
+ 		${enable_obsolete+--enable-obsolete="$enable_obsolete"} \
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch
new file mode 100644
index 0000000..3cd75b7
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch
@@ -0,0 +1,25 @@
+From 4e53d0ae70af85af0e112a48a3e4dfe4c39f4a8d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 2 Feb 2016 10:26:10 -0800
+Subject: [PATCH] nios2: Define MUSL_DYNAMIC_LINKER
+
+Upstream-Status: Pending
+
+Signed-off-by: Marek Vasut <marex@denx.de>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gcc/config/nios2/linux.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gcc/config/nios2/linux.h b/gcc/config/nios2/linux.h
+index 4bdcdcca1f0..e7943a9d640 100644
+--- a/gcc/config/nios2/linux.h
++++ b/gcc/config/nios2/linux.h
+@@ -30,6 +30,7 @@
+ #define CPP_SPEC "%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRANT}"
+ 
+ #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-nios2.so.1"
++#define MUSL_DYNAMIC_LINKER  "/lib/ld-musl-nios2.so.1"
+ 
+ #undef LINK_SPEC
+ #define LINK_SPEC LINK_SPEC_ENDIAN \
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
new file mode 100644
index 0000000..2a6769a
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
@@ -0,0 +1,84 @@
+From 5db0404eb770ac477fd99d444226bcf021067584 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 27 Jun 2017 18:10:54 -0700
+Subject: [PATCH] Add ssp_nonshared to link commandline for musl targets
+
+when -fstack-protector options are enabled we need to
+link with ssp_shared on musl since it does not provide
+the __stack_chk_fail_local() so essentially it provides
+libssp but not libssp_nonshared something like
+TARGET_LIBC_PROVIDES_SSP_BUT_NOT_SSP_NONSHARED
+ where-as for glibc the needed symbols
+are already present in libc_nonshared library therefore
+we do not need any library helper on glibc based systems
+but musl needs the libssp_noshared from gcc
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gcc/config/linux.h          |  7 +++++++
+ gcc/config/rs6000/linux.h   | 10 ++++++++++
+ gcc/config/rs6000/linux64.h | 10 ++++++++++
+ 3 files changed, 27 insertions(+)
+
+diff --git a/gcc/config/linux.h b/gcc/config/linux.h
+index 0c1a8118a26..bdc2a2d0659 100644
+--- a/gcc/config/linux.h
++++ b/gcc/config/linux.h
+@@ -195,6 +195,13 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+     { GCC_INCLUDE_DIR, "GCC", 0, 1, 0, 0 },		\
+     { 0, 0, 0, 0, 0, 0 }				\
+   }
++#ifdef TARGET_LIBC_PROVIDES_SSP
++#undef LINK_SSP_SPEC
++#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
++		       "|fstack-protector-strong|fstack-protector-explicit" \
++		       ":-lssp_nonshared}"
++#endif
++
+ #endif
+ 
+ #if (DEFAULT_LIBC == LIBC_UCLIBC) && defined (SINGLE_LIBC) /* uClinux */
+diff --git a/gcc/config/rs6000/linux.h b/gcc/config/rs6000/linux.h
+index b7026fcbee7..dd54d6c393e 100644
+--- a/gcc/config/rs6000/linux.h
++++ b/gcc/config/rs6000/linux.h
+@@ -94,6 +94,16 @@
+ 					 " -m elf32ppclinux")
+ #endif
+ 
++/* link libssp_nonshared.a with musl */
++#if DEFAULT_LIBC == LIBC_MUSL
++#ifdef TARGET_LIBC_PROVIDES_SSP
++#undef LINK_SSP_SPEC
++#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
++		       "|fstack-protector-strong|fstack-protector-explicit" \
++		       ":-lssp_nonshared}"
++#endif
++#endif
++
+ #undef LINK_OS_LINUX_SPEC
+ #define LINK_OS_LINUX_SPEC LINK_OS_LINUX_EMUL " %{!shared: %{!static: \
+   %{!static-pie: \
+diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
+index 967c1c43c63..dc5e4d97975 100644
+--- a/gcc/config/rs6000/linux64.h
++++ b/gcc/config/rs6000/linux64.h
+@@ -452,6 +452,16 @@ extern int dot_symbols;
+ 					   " -m elf64ppc")
+ #endif
+ 
++/* link libssp_nonshared.a with musl */
++#if DEFAULT_LIBC == LIBC_MUSL
++#ifdef TARGET_LIBC_PROVIDES_SSP
++#undef LINK_SSP_SPEC
++#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
++		       "|fstack-protector-strong|fstack-protector-explicit" \
++		       ":-lssp_nonshared}"
++#endif
++#endif
++
+ #define LINK_OS_LINUX_SPEC32 LINK_OS_LINUX_EMUL32 " %{!shared: %{!static: \
+   %{!static-pie: \
+     %{rdynamic:-export-dynamic} \
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
new file mode 100644
index 0000000..767cba0
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
@@ -0,0 +1,26 @@
+From fbc926dbf6a47fa623b9c94cd9b09a0e90448fdc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 4 May 2016 21:11:34 -0700
+Subject: [PATCH] Link libgcc using LDFLAGS, not just SHLIB_LDFLAGS
+
+Upstream-Status: Pending
+
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libgcc/config/t-slibgcc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libgcc/config/t-slibgcc b/libgcc/config/t-slibgcc
+index c997553447c..330352c2c81 100644
+--- a/libgcc/config/t-slibgcc
++++ b/libgcc/config/t-slibgcc
+@@ -32,7 +32,7 @@ SHLIB_INSTALL_SOLINK = $(LN_S) $(SHLIB_SONAME) \
+ 	$(DESTDIR)$(slibdir)$(SHLIB_SLIBDIR_QUAL)/$(SHLIB_SOLINK)
+ 
+ SHLIB_LINK = $(CC) $(LIBGCC2_CFLAGS) -shared -nodefaultlibs \
+-	$(SHLIB_LDFLAGS) \
++	$(LDFLAGS) $(SHLIB_LDFLAGS) \
+ 	-o $(SHLIB_DIR)/$(SHLIB_SONAME).tmp @multilib_flags@ \
+ 	$(SHLIB_OBJS) $(SHLIB_LC) && \
+ 	rm -f $(SHLIB_DIR)/$(SHLIB_SOLINK) && \
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0030-sync-gcc-stddef.h-with-musl.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0030-sync-gcc-stddef.h-with-musl.patch
new file mode 100644
index 0000000..4f18907
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0030-sync-gcc-stddef.h-with-musl.patch
@@ -0,0 +1,88 @@
+From 24dc04dc8d69e3bf61322615b3ef18e02ccd311e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 3 Feb 2017 12:56:00 -0800
+Subject: [PATCH] sync gcc stddef.h with musl
+
+musl defines ptrdiff_t size_t and wchar_t
+so dont define them here if musl is definining them
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gcc/ginclude/stddef.h | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/gcc/ginclude/stddef.h b/gcc/ginclude/stddef.h
+index 9d67eac4947..6cb5edbedb4 100644
+--- a/gcc/ginclude/stddef.h
++++ b/gcc/ginclude/stddef.h
+@@ -128,6 +128,7 @@ _TYPE_wchar_t;
+ #ifndef ___int_ptrdiff_t_h
+ #ifndef _GCC_PTRDIFF_T
+ #ifndef _PTRDIFF_T_DECLARED /* DragonFly */
++#ifndef __DEFINED_ptrdiff_t /* musl */
+ #define _PTRDIFF_T
+ #define _T_PTRDIFF_
+ #define _T_PTRDIFF
+@@ -137,10 +138,12 @@ _TYPE_wchar_t;
+ #define ___int_ptrdiff_t_h
+ #define _GCC_PTRDIFF_T
+ #define _PTRDIFF_T_DECLARED
++#define __DEFINED_ptrdiff_t /* musl */
+ #ifndef __PTRDIFF_TYPE__
+ #define __PTRDIFF_TYPE__ long int
+ #endif
+ typedef __PTRDIFF_TYPE__ ptrdiff_t;
++#endif /* __DEFINED_ptrdiff_t */
+ #endif /* _PTRDIFF_T_DECLARED */
+ #endif /* _GCC_PTRDIFF_T */
+ #endif /* ___int_ptrdiff_t_h */
+@@ -178,6 +181,7 @@ typedef __PTRDIFF_TYPE__ ptrdiff_t;
+ #ifndef _GCC_SIZE_T
+ #ifndef _SIZET_
+ #ifndef __size_t
++#ifndef __DEFINED_size_t /* musl */
+ #define __size_t__	/* BeOS */
+ #define __SIZE_T__	/* Cray Unicos/Mk */
+ #define _SIZE_T
+@@ -194,6 +198,7 @@ typedef __PTRDIFF_TYPE__ ptrdiff_t;
+ #define ___int_size_t_h
+ #define _GCC_SIZE_T
+ #define _SIZET_
++#define __DEFINED_size_t /* musl */
+ #if defined (__FreeBSD__) \
+   || defined(__DragonFly__) \
+   || defined(__FreeBSD_kernel__) \
+@@ -228,6 +233,7 @@ typedef long ssize_t;
+ #endif /* _SIZE_T */
+ #endif /* __SIZE_T__ */
+ #endif /* __size_t__ */
++#endif /* __DEFINED_size_t */
+ #undef	__need_size_t
+ #endif /* _STDDEF_H or __need_size_t.  */
+ 
+@@ -257,6 +263,7 @@ typedef long ssize_t;
+ #ifndef ___int_wchar_t_h
+ #ifndef __INT_WCHAR_T_H
+ #ifndef _GCC_WCHAR_T
++#ifndef __DEFINED_wchar_t /* musl */
+ #define __wchar_t__	/* BeOS */
+ #define __WCHAR_T__	/* Cray Unicos/Mk */
+ #define _WCHAR_T
+@@ -272,6 +279,7 @@ typedef long ssize_t;
+ #define __INT_WCHAR_T_H
+ #define _GCC_WCHAR_T
+ #define _WCHAR_T_DECLARED
++#define __DEFINED_wchar_t /* musl */
+ 
+ /* On BSD/386 1.1, at least, machine/ansi.h defines _BSD_WCHAR_T_
+    instead of _WCHAR_T_, and _BSD_RUNE_T_ (which, unlike the other
+@@ -337,6 +345,7 @@ typedef __WCHAR_TYPE__ wchar_t;
+ #endif
+ #endif /* __WCHAR_T__ */
+ #endif /* __wchar_t__ */
++#endif /* __DEFINED_wchar_t musl */
+ #undef	__need_wchar_t
+ #endif /* _STDDEF_H or __need_wchar_t.  */
+ 
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0031-fix-segmentation-fault-in-precompiled-header-generat.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0031-fix-segmentation-fault-in-precompiled-header-generat.patch
new file mode 100644
index 0000000..702279a
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0031-fix-segmentation-fault-in-precompiled-header-generat.patch
@@ -0,0 +1,57 @@
+From 27b8ba5555ada2dab076988529bfb84d00a4b901 Mon Sep 17 00:00:00 2001
+From: Juro Bystricky <juro.bystricky@intel.com>
+Date: Mon, 19 Mar 2018 22:31:20 -0700
+Subject: [PATCH] fix segmentation fault in precompiled header generation
+
+Prevent a segmentation fault which occurs when using incorrect
+structure trying to access name of some named operators, such as
+CPP_NOT, CPP_AND etc. "token->val.node.spelling" cannot be used in
+those cases, as is may not be initialized at all.
+
+[YOCTO #11738]
+
+Upstream-Status: Pending
+
+Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libcpp/lex.c | 26 +++++++++++++++++++++-----
+ 1 file changed, 21 insertions(+), 5 deletions(-)
+
+diff --git a/libcpp/lex.c b/libcpp/lex.c
+index 56ac3a1dd73..73a951148b3 100644
+--- a/libcpp/lex.c
++++ b/libcpp/lex.c
+@@ -3311,11 +3311,27 @@ cpp_spell_token (cpp_reader *pfile, const cpp_token *token,
+     spell_ident:
+     case SPELL_IDENT:
+       if (forstring)
+-	{
+-	  memcpy (buffer, NODE_NAME (token->val.node.spelling),
+-		  NODE_LEN (token->val.node.spelling));
+-	  buffer += NODE_LEN (token->val.node.spelling);
+-	}
++        {
++          if (token->type == CPP_NAME)
++            {
++              memcpy (buffer, NODE_NAME (token->val.node.spelling),
++                    NODE_LEN (token->val.node.spelling));
++              buffer += NODE_LEN (token->val.node.spelling);
++              break;
++            }
++          /* NAMED_OP, cannot use node.spelling */
++          if (token->flags & NAMED_OP)
++            {
++              const char *str = cpp_named_operator2name (token->type);
++              if (str)
++                {
++                  size_t len = strlen(str);
++                  memcpy(buffer, str, len);
++                  buffer += len;
++                }
++              break;
++            }
++        }
+       else
+ 	buffer = _cpp_spell_ident_ucns (buffer, token->val.node.node);
+       break;
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0032-Fix-for-testsuite-failure.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0032-Fix-for-testsuite-failure.patch
new file mode 100644
index 0000000..0a0767b
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0032-Fix-for-testsuite-failure.patch
@@ -0,0 +1,255 @@
+From 2512aacf023c679d86d8f40caff4f6ff412b32ff Mon Sep 17 00:00:00 2001
+From: RAGHUNATH LOLUR <raghunath.lolur@kpit.com>
+Date: Wed, 6 Dec 2017 22:52:26 -0800
+Subject: [PATCH] Fix for testsuite failure
+
+2017-11-16  Raghunath Lolur  <raghunath.lolur@kpit.com>
+
+	* gcc.dg/pr56275.c: If SSE is disabled, ensure that
+	"-mfpmath" is not set to use SSE. Set "-mfpmath=387".
+	* gcc.dg/pr68306.c: Likewise
+	* gcc.dg/pr68306-2.c: Likewise
+	* gcc.dg/pr68306-3.c: Likewise
+	* gcc.dg/pr69634.c: Likewise
+	* gcc.target/i386/amd64-abi-1.c: Likewise
+	* gcc.target/i386/funcspec-6.c: Likewise
+	* gcc.target/i386/interrupt-387-err-1.c: Likewise
+	* gcc.target/i386/isa-14.c: Likewise
+	* gcc.target/i386/pr44948-2b.c: Likewise
+	* gcc.target/i386/pr53425-1.c: Likewise
+	* gcc.target/i386/pr53425-2.c: Likewise
+	* gcc.target/i386/pr55247.c: Likewise
+	* gcc.target/i386/pr59644.c: Likewise
+	* gcc.target/i386/pr62120.c: Likewise
+	* gcc.target/i386/pr70467-1.c: Likewise
+	* gcc.target/i386/warn-vect-op-1.c: Likewise
+
+If -Wall, -Werror are used during compilation various test cases fail
+to compile.
+
+If SSE is disabled, be sure to -mfpmath=387 to resolve this.
+
+This patch removes the changes to Changelog from the original patch.
+This will help us avoid conflicts.
+
+Upstream-Status: Pending
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+---
+ gcc/testsuite/gcc.dg/pr56275.c                      | 2 +-
+ gcc/testsuite/gcc.dg/pr68306-2.c                    | 2 +-
+ gcc/testsuite/gcc.dg/pr68306-3.c                    | 2 +-
+ gcc/testsuite/gcc.dg/pr68306.c                      | 2 +-
+ gcc/testsuite/gcc.dg/pr69634.c                      | 2 +-
+ gcc/testsuite/gcc.target/i386/amd64-abi-1.c         | 2 +-
+ gcc/testsuite/gcc.target/i386/funcspec-6.c          | 1 +
+ gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c | 2 +-
+ gcc/testsuite/gcc.target/i386/isa-14.c              | 2 +-
+ gcc/testsuite/gcc.target/i386/pr44948-2b.c          | 2 +-
+ gcc/testsuite/gcc.target/i386/pr53425-1.c           | 2 +-
+ gcc/testsuite/gcc.target/i386/pr53425-2.c           | 2 +-
+ gcc/testsuite/gcc.target/i386/pr55247.c             | 2 +-
+ gcc/testsuite/gcc.target/i386/pr59644.c             | 2 +-
+ gcc/testsuite/gcc.target/i386/pr62120.c             | 2 +-
+ gcc/testsuite/gcc.target/i386/pr70467-1.c           | 2 +-
+ gcc/testsuite/gcc.target/i386/warn-vect-op-1.c      | 2 +-
+ 17 files changed, 17 insertions(+), 16 deletions(-)
+
+diff --git a/gcc/testsuite/gcc.dg/pr56275.c b/gcc/testsuite/gcc.dg/pr56275.c
+index b901bb2b199..a4f6c95e1a1 100644
+--- a/gcc/testsuite/gcc.dg/pr56275.c
++++ b/gcc/testsuite/gcc.dg/pr56275.c
+@@ -1,6 +1,6 @@
+ /* { dg-do compile } */
+ /* { dg-options "-O2" } */
+-/* { dg-additional-options "-mno-sse" { target { i?86-*-* x86_64-*-* } } } */
++/* { dg-additional-options "-mno-sse -mfpmath=387" { target { i?86-*-* x86_64-*-* } } } */
+ 
+ typedef long long v2tw __attribute__ ((vector_size (2 * sizeof (long long))));
+ 
+diff --git a/gcc/testsuite/gcc.dg/pr68306-2.c b/gcc/testsuite/gcc.dg/pr68306-2.c
+index 4672ebe7987..2a368c484b6 100644
+--- a/gcc/testsuite/gcc.dg/pr68306-2.c
++++ b/gcc/testsuite/gcc.dg/pr68306-2.c
+@@ -1,6 +1,6 @@
+ /* { dg-do compile } */
+ /* { dg-options "-O3" } */
+-/* { dg-additional-options "-mno-sse -mno-mmx" { target i?86-*-* x86_64-*-* } } */
++/* { dg-additional-options "-mno-sse -mno-mmx -mfpmath=387" { target i?86-*-* x86_64-*-* } } */
+ 
+ struct {
+     int tz_minuteswest;
+diff --git a/gcc/testsuite/gcc.dg/pr68306-3.c b/gcc/testsuite/gcc.dg/pr68306-3.c
+index f5a8c102cf8..df3390c64c2 100644
+--- a/gcc/testsuite/gcc.dg/pr68306-3.c
++++ b/gcc/testsuite/gcc.dg/pr68306-3.c
+@@ -1,6 +1,6 @@
+ /* { dg-do compile } */
+ /* { dg-options "-O3" } */
+-/* { dg-additional-options "-mno-sse -mno-mmx" { target i?86-*-* x86_64-*-* } } */
++/* { dg-additional-options "-mno-sse -mno-mmx -mfpmath=387" { target i?86-*-* x86_64-*-* } } */
+ /* { dg-additional-options "-mno-altivec -mno-vsx" { target powerpc*-*-* } } */
+ 
+ extern void fn2();
+diff --git a/gcc/testsuite/gcc.dg/pr68306.c b/gcc/testsuite/gcc.dg/pr68306.c
+index 54e5b40f221..0813389e2c1 100644
+--- a/gcc/testsuite/gcc.dg/pr68306.c
++++ b/gcc/testsuite/gcc.dg/pr68306.c
+@@ -1,6 +1,6 @@
+ /* { dg-do compile } */
+ /* { dg-options "-O3" } */
+-/* { dg-additional-options "-mno-sse -mno-mmx" { target i?86-*-* x86_64-*-* } } */
++/* { dg-additional-options "-mno-sse -mno-mmx -mfpmath=387" { target i?86-*-* x86_64-*-* } } */
+ 
+ enum powerpc_pmc_type { PPC_PMC_IBM };
+ struct {
+diff --git a/gcc/testsuite/gcc.dg/pr69634.c b/gcc/testsuite/gcc.dg/pr69634.c
+index 60a56149463..bcc23f9ccd6 100644
+--- a/gcc/testsuite/gcc.dg/pr69634.c
++++ b/gcc/testsuite/gcc.dg/pr69634.c
+@@ -1,6 +1,6 @@
+ /* { dg-do compile } */
+ /* { dg-options "-O2 -fno-dce -fschedule-insns -fno-tree-vrp -fcompare-debug -Wno-psabi" } */
+-/* { dg-additional-options "-mno-sse" { target i?86-*-* x86_64-*-* } } */
++/* { dg-additional-options "-mno-sse -mfpmath=387" { target i?86-*-* x86_64-*-* } } */
+ /* { dg-require-effective-target scheduling } */
+ 
+ typedef unsigned short u16;
+diff --git a/gcc/testsuite/gcc.target/i386/amd64-abi-1.c b/gcc/testsuite/gcc.target/i386/amd64-abi-1.c
+index 69fde57bf06..7f1f1c03edf 100644
+--- a/gcc/testsuite/gcc.target/i386/amd64-abi-1.c
++++ b/gcc/testsuite/gcc.target/i386/amd64-abi-1.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile { target { ! ia32 } } } */
+-/* { dg-options "-mno-sse" } */
++/* { dg-options "-mno-sse -mfpmath=387" } */
+ /* { dg-additional-options "-mabi=sysv" { target *-*-mingw* } } */
+ 
+ double foo(void) { return 0; }	/* { dg-error "SSE disabled" } */
+diff --git a/gcc/testsuite/gcc.target/i386/funcspec-6.c b/gcc/testsuite/gcc.target/i386/funcspec-6.c
+index ea896b7ebfd..bf15569b826 100644
+--- a/gcc/testsuite/gcc.target/i386/funcspec-6.c
++++ b/gcc/testsuite/gcc.target/i386/funcspec-6.c
+@@ -1,6 +1,7 @@
+ /* Test whether all of the 64-bit function specific options are accepted
+    without error.  */
+ /* { dg-do compile { target { ! ia32 } } } */
++/* { dg-additional-options "-mfpmath=387" } */
+ 
+ #include "funcspec-56.inc"
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c b/gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c
+index 8561a3c26d6..6377f814645 100644
+--- a/gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c
++++ b/gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mgeneral-regs-only -mno-cld -mno-iamcu -m80387" } */
++/* { dg-options "-O2 -mgeneral-regs-only -mno-cld -mno-iamcu -m80387 -mfpmath=387" } */
+ 
+ typedef unsigned int uword_t __attribute__ ((mode (__word__)));
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/isa-14.c b/gcc/testsuite/gcc.target/i386/isa-14.c
+index 5d49e6e77fe..1de2db92bdd 100644
+--- a/gcc/testsuite/gcc.target/i386/isa-14.c
++++ b/gcc/testsuite/gcc.target/i386/isa-14.c
+@@ -1,5 +1,5 @@
+ /* { dg-do run } */
+-/* { dg-options "-march=x86-64 -msse4a -mfma4 -mno-sse" } */
++/* { dg-options "-march=x86-64 -msse4a -mfma4 -mno-sse -mfpmath=387" } */
+ 
+ extern void abort (void);
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/pr44948-2b.c b/gcc/testsuite/gcc.target/i386/pr44948-2b.c
+index fa1769b62fb..f79fb12726f 100644
+--- a/gcc/testsuite/gcc.target/i386/pr44948-2b.c
++++ b/gcc/testsuite/gcc.target/i386/pr44948-2b.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O -mno-sse -Wno-psabi -mtune=generic" } */
++/* { dg-options "-O -mno-sse -Wno-psabi -mtune=generic -mfpmath=387" } */
+ 
+ struct A
+ { 
+diff --git a/gcc/testsuite/gcc.target/i386/pr53425-1.c b/gcc/testsuite/gcc.target/i386/pr53425-1.c
+index 2e89ff7d81d..6339bf6b736 100644
+--- a/gcc/testsuite/gcc.target/i386/pr53425-1.c
++++ b/gcc/testsuite/gcc.target/i386/pr53425-1.c
+@@ -1,6 +1,6 @@
+ /* PR target/53425 */
+ /* { dg-do compile { target { ! ia32 } } } */
+-/* { dg-options "-O2 -mno-sse" } */
++/* { dg-options "-O2 -mno-sse -mfpmath=387" } */
+ /* { dg-skip-if "no SSE vector" { x86_64-*-mingw* } } */
+ 
+ typedef double __v2df __attribute__ ((__vector_size__ (16)));
+diff --git a/gcc/testsuite/gcc.target/i386/pr53425-2.c b/gcc/testsuite/gcc.target/i386/pr53425-2.c
+index 61f6283dbe9..2c5a55f0ac3 100644
+--- a/gcc/testsuite/gcc.target/i386/pr53425-2.c
++++ b/gcc/testsuite/gcc.target/i386/pr53425-2.c
+@@ -1,6 +1,6 @@
+ /* PR target/53425 */
+ /* { dg-do compile { target { ! ia32 } } } */
+-/* { dg-options "-O2 -mno-sse" } */
++/* { dg-options "-O2 -mno-sse -mfpmath=387" } */
+ /* { dg-skip-if "no SSE vector" { x86_64-*-mingw* } } */
+ 
+ typedef float __v2sf __attribute__ ((__vector_size__ (8)));
+diff --git a/gcc/testsuite/gcc.target/i386/pr55247.c b/gcc/testsuite/gcc.target/i386/pr55247.c
+index 23366d0909d..9810e3abb76 100644
+--- a/gcc/testsuite/gcc.target/i386/pr55247.c
++++ b/gcc/testsuite/gcc.target/i386/pr55247.c
+@@ -1,6 +1,6 @@
+ /* { dg-do compile { target { ! ia32 } } } */
+ /* { dg-require-effective-target maybe_x32 } */
+-/* { dg-options "-O2 -mno-sse -mno-mmx -mx32 -maddress-mode=long" } */
++/* { dg-options "-O2 -mno-sse -mno-mmx -mx32 -maddress-mode=long -mfpmath=387" } */
+ 
+ typedef unsigned int uint32_t;
+ typedef uint32_t Elf32_Word;
+diff --git a/gcc/testsuite/gcc.target/i386/pr59644.c b/gcc/testsuite/gcc.target/i386/pr59644.c
+index 96006b3e338..4287e4538bf 100644
+--- a/gcc/testsuite/gcc.target/i386/pr59644.c
++++ b/gcc/testsuite/gcc.target/i386/pr59644.c
+@@ -1,6 +1,6 @@
+ /* PR target/59644 */
+ /* { dg-do run { target lp64 } } */
+-/* { dg-options "-O2 -ffreestanding -mno-sse -mpreferred-stack-boundary=3 -maccumulate-outgoing-args -mno-red-zone" } */
++/* { dg-options "-O2 -ffreestanding -mno-sse -mpreferred-stack-boundary=3 -maccumulate-outgoing-args -mno-red-zone -mfpmath=387" } */
+ 
+ /* This test uses __builtin_trap () instead of e.g. abort,
+    because due to -mpreferred-stack-boundary=3 it should not call
+diff --git a/gcc/testsuite/gcc.target/i386/pr62120.c b/gcc/testsuite/gcc.target/i386/pr62120.c
+index 28d85d37712..c93266bd4bc 100644
+--- a/gcc/testsuite/gcc.target/i386/pr62120.c
++++ b/gcc/testsuite/gcc.target/i386/pr62120.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-mno-sse" } */
++/* { dg-options "-mno-sse -mfpmath=387" } */
+ 
+ void foo ()
+ {
+diff --git a/gcc/testsuite/gcc.target/i386/pr70467-1.c b/gcc/testsuite/gcc.target/i386/pr70467-1.c
+index 4e112c88d07..bcfb396a68d 100644
+--- a/gcc/testsuite/gcc.target/i386/pr70467-1.c
++++ b/gcc/testsuite/gcc.target/i386/pr70467-1.c
+@@ -1,6 +1,6 @@
+ /* PR rtl-optimization/70467 */
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mno-sse" } */
++/* { dg-options "-O2 -mno-sse -mfpmath=387" } */
+ 
+ void foo (unsigned long long *);
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/warn-vect-op-1.c b/gcc/testsuite/gcc.target/i386/warn-vect-op-1.c
+index 6cda1534311..26e37f5b8ba 100644
+--- a/gcc/testsuite/gcc.target/i386/warn-vect-op-1.c
++++ b/gcc/testsuite/gcc.target/i386/warn-vect-op-1.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile { target { ! ia32 } } }  */
+-/* { dg-options "-mno-sse -Wvector-operation-performance" }  */
++/* { dg-options "-mno-sse -Wvector-operation-performance -mfpmath=387" }  */
+ #define vector(elcount, type)  \
+ __attribute__((vector_size((elcount)*sizeof(type)))) type
+ 
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0033-Re-introduce-spe-commandline-options.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0033-Re-introduce-spe-commandline-options.patch
new file mode 100644
index 0000000..ba7c2b8
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0033-Re-introduce-spe-commandline-options.patch
@@ -0,0 +1,38 @@
+From 3fc06241ce37e2e4b3ed21ace28d347eb511448d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 6 Jun 2018 12:10:22 -0700
+Subject: [PATCH] Re-introduce spe commandline options
+
+This should ensure that we keep accepting
+spe options
+
+Upstream-Status: Inappropriate [SPE port is removed from rs600 port]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gcc/config/rs6000/rs6000.opt | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/gcc/config/rs6000/rs6000.opt b/gcc/config/rs6000/rs6000.opt
+index f95b8279270..0e52d51409d 100644
+--- a/gcc/config/rs6000/rs6000.opt
++++ b/gcc/config/rs6000/rs6000.opt
+@@ -344,6 +344,18 @@ mdebug=
+ Target RejectNegative Joined
+ -mdebug=	Enable debug output.
+ 
++mspe
++Target Var(rs6000_spe) Save
++Generate SPE SIMD instructions on E500.
++
++mabi=spe
++Target RejectNegative Var(rs6000_spe_abi) Save
++Use the SPE ABI extensions.
++
++mabi=no-spe
++Target RejectNegative Var(rs6000_spe_abi, 0)
++Do not use the SPE ABI extensions.
++
+ mabi=altivec
+ Target RejectNegative Var(rs6000_altivec_abi) Save
+ Use the AltiVec ABI extensions.
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
new file mode 100644
index 0000000..4ce9dc6
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
@@ -0,0 +1,83 @@
+From b42ff59c3fe2967d37815c8db72a47b9b7f585b4 Mon Sep 17 00:00:00 2001
+From: Szabolcs Nagy <nsz@port70.net>
+Date: Sat, 24 Oct 2015 20:09:53 +0000
+Subject: [PATCH] libgcc_s: Use alias for __cpu_indicator_init instead of
+ symver
+
+Adapter from
+
+https://gcc.gnu.org/ml/gcc-patches/2015-05/msg00899.html
+
+This fix was debated but hasnt been applied gcc upstream since
+they expect musl to support '@' in symbol versioning which is
+a sun/gnu versioning extention. This patch however avoids the
+need for the '@' symbols at all
+
+libgcc/Changelog:
+
+2015-05-11  Szabolcs Nagy  <szabolcs.nagy@arm.com>
+
+	* config/i386/cpuinfo.c (__cpu_indicator_init_local): Add.
+	(__cpu_indicator_init@GCC_4.8.0, __cpu_model@GCC_4.8.0): Remove.
+
+	* config/i386/t-linux (HOST_LIBGCC2_CFLAGS): Remove -DUSE_ELF_SYMVER.
+
+gcc/Changelog:
+
+2015-05-11  Szabolcs Nagy  <szabolcs.nagy@arm.com>
+
+	* config/i386/i386-expand.c (ix86_expand_builtin): Make __builtin_cpu_init
+	call __cpu_indicator_init_local instead of __cpu_indicator_init.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gcc/config/i386/i386-expand.c | 4 ++--
+ libgcc/config/i386/cpuinfo.c  | 6 +++---
+ libgcc/config/i386/t-linux    | 2 +-
+ 3 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/gcc/config/i386/i386-expand.c b/gcc/config/i386/i386-expand.c
+index 48f00c5fcfc..468f5f71fac 100644
+--- a/gcc/config/i386/i386-expand.c
++++ b/gcc/config/i386/i386-expand.c
+@@ -10941,10 +10941,10 @@ ix86_expand_builtin (tree exp, rtx target, rtx subtarget,
+     {
+     case IX86_BUILTIN_CPU_INIT:
+       {
+-	/* Make it call __cpu_indicator_init in libgcc. */
++	/* Make it call __cpu_indicator_init_local in libgcc.a. */
+ 	tree call_expr, fndecl, type;
+         type = build_function_type_list (integer_type_node, NULL_TREE); 
+-	fndecl = build_fn_decl ("__cpu_indicator_init", type);
++	fndecl = build_fn_decl ("__cpu_indicator_init_local", type);
+ 	call_expr = build_call_expr (fndecl, 0); 
+ 	return expand_expr (call_expr, target, mode, EXPAND_NORMAL);
+       }
+diff --git a/libgcc/config/i386/cpuinfo.c b/libgcc/config/i386/cpuinfo.c
+index 00322c58622..f42bbb8af98 100644
+--- a/libgcc/config/i386/cpuinfo.c
++++ b/libgcc/config/i386/cpuinfo.c
+@@ -508,7 +508,7 @@ __cpu_indicator_init (void)
+   return 0;
+ }
+ 
+-#if defined SHARED && defined USE_ELF_SYMVER
+-__asm__ (".symver __cpu_indicator_init, __cpu_indicator_init@GCC_4.8.0");
+-__asm__ (".symver __cpu_model, __cpu_model@GCC_4.8.0");
++#ifndef SHARED
++int __cpu_indicator_init_local (void)
++  __attribute__ ((weak, alias ("__cpu_indicator_init")));
+ #endif
+diff --git a/libgcc/config/i386/t-linux b/libgcc/config/i386/t-linux
+index 8506a635790..564296f788e 100644
+--- a/libgcc/config/i386/t-linux
++++ b/libgcc/config/i386/t-linux
+@@ -3,5 +3,5 @@
+ # t-slibgcc-elf-ver and t-linux
+ SHLIB_MAPFILES = libgcc-std.ver $(srcdir)/config/i386/libgcc-glibc.ver
+ 
+-HOST_LIBGCC2_CFLAGS += -mlong-double-80 -DUSE_ELF_SYMVER $(CET_FLAGS)
++HOST_LIBGCC2_CFLAGS += -mlong-double-80 $(CET_FLAGS)
+ CRTSTUFF_T_CFLAGS += $(CET_FLAGS)
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
new file mode 100644
index 0000000..dd1bf6d
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
@@ -0,0 +1,182 @@
+From 0395060a7dcf98c5f5a65103f6aaa71d6b862259 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Tue, 10 Mar 2020 08:26:53 -0700
+Subject: [PATCH] gentypes/genmodes: Do not use __LINE__ for maintaining
+ reproducibility
+
+Inserting line numbers into generated code means its not always reproducible wth
+differing versions of host gcc. Void the issue by not adding these.
+
+Upstream-Status: Inappropriate [OE Reproducibility specific]
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gcc/gengtype.c |  6 +++---
+ gcc/genmodes.c | 32 ++++++++++++++++----------------
+ 2 files changed, 19 insertions(+), 19 deletions(-)
+
+diff --git a/gcc/gengtype.c b/gcc/gengtype.c
+index 981577481af..d5700fff401 100644
+--- a/gcc/gengtype.c
++++ b/gcc/gengtype.c
+@@ -991,7 +991,7 @@ create_field_at (pair_p next, type_p type, const char *name, options_p opt,
+ /* Create a fake field with the given type and name.  NEXT is the next
+    field in the chain.  */
+ #define create_field(next,type,name) \
+-    create_field_all (next,type,name, 0, this_file, __LINE__)
++    create_field_all (next,type,name, 0, this_file, 0)
+ 
+ /* Like create_field, but the field is only valid when condition COND
+    is true.  */
+@@ -1024,7 +1024,7 @@ create_optional_field_ (pair_p next, type_p type, const char *name,
+ }
+ 
+ #define create_optional_field(next,type,name,cond)	\
+-       create_optional_field_(next,type,name,cond,__LINE__)
++       create_optional_field_(next,type,name,cond,0)
+ 
+ /* Reverse a linked list of 'struct pair's in place.  */
+ pair_p
+@@ -5187,7 +5187,7 @@ main (int argc, char **argv)
+       /* These types are set up with #define or else outside of where
+          we can see them.  We should initialize them before calling
+          read_input_list.  */
+-#define POS_HERE(Call) do { pos.file = this_file; pos.line = __LINE__; \
++#define POS_HERE(Call) do { pos.file = this_file; pos.line = 0; \
+ 	Call;} while (0)
+       POS_HERE (do_scalar_typedef ("CUMULATIVE_ARGS", &pos));
+       POS_HERE (do_scalar_typedef ("REAL_VALUE_TYPE", &pos));
+diff --git a/gcc/genmodes.c b/gcc/genmodes.c
+index bd78310ea24..dbd02c51a4c 100644
+--- a/gcc/genmodes.c
++++ b/gcc/genmodes.c
+@@ -430,7 +430,7 @@ complete_all_modes (void)
+ }
+ 
+ /* For each mode in class CLASS, construct a corresponding complex mode.  */
+-#define COMPLEX_MODES(C) make_complex_modes (MODE_##C, __FILE__, __LINE__)
++#define COMPLEX_MODES(C) make_complex_modes (MODE_##C, __FILE__, 0)
+ static void
+ make_complex_modes (enum mode_class cl,
+ 		    const char *file, unsigned int line)
+@@ -489,7 +489,7 @@ make_complex_modes (enum mode_class cl,
+    having as many components as necessary.  ORDER is the sorting order
+    of the mode, with smaller numbers indicating a higher priority.  */
+ #define VECTOR_MODES_WITH_PREFIX(PREFIX, C, W, ORDER) \
+-  make_vector_modes (MODE_##C, #PREFIX, W, ORDER, __FILE__, __LINE__)
++  make_vector_modes (MODE_##C, #PREFIX, W, ORDER, __FILE__, 0)
+ #define VECTOR_MODES(C, W) VECTOR_MODES_WITH_PREFIX (V, C, W, 0)
+ static void ATTRIBUTE_UNUSED
+ make_vector_modes (enum mode_class cl, const char *prefix, unsigned int width,
+@@ -541,7 +541,7 @@ make_vector_modes (enum mode_class cl, const char *prefix, unsigned int width,
+ /* Create a vector of booleans called NAME with COUNT elements and
+    BYTESIZE bytes in total.  */
+ #define VECTOR_BOOL_MODE(NAME, COUNT, BYTESIZE) \
+-  make_vector_bool_mode (#NAME, COUNT, BYTESIZE, __FILE__, __LINE__)
++  make_vector_bool_mode (#NAME, COUNT, BYTESIZE, __FILE__, 0)
+ static void ATTRIBUTE_UNUSED
+ make_vector_bool_mode (const char *name, unsigned int count,
+ 		       unsigned int bytesize, const char *file,
+@@ -563,7 +563,7 @@ make_vector_bool_mode (const char *name, unsigned int count,
+ /* Input.  */
+ 
+ #define _SPECIAL_MODE(C, N) \
+-  make_special_mode (MODE_##C, #N, __FILE__, __LINE__)
++  make_special_mode (MODE_##C, #N, __FILE__, 0)
+ #define RANDOM_MODE(N) _SPECIAL_MODE (RANDOM, N)
+ #define CC_MODE(N) _SPECIAL_MODE (CC, N)
+ 
+@@ -576,7 +576,7 @@ make_special_mode (enum mode_class cl, const char *name,
+ 
+ #define INT_MODE(N, Y) FRACTIONAL_INT_MODE (N, -1U, Y)
+ #define FRACTIONAL_INT_MODE(N, B, Y) \
+-  make_int_mode (#N, B, Y, __FILE__, __LINE__)
++  make_int_mode (#N, B, Y, __FILE__, 0)
+ 
+ static void
+ make_int_mode (const char *name,
+@@ -589,16 +589,16 @@ make_int_mode (const char *name,
+ }
+ 
+ #define FRACT_MODE(N, Y, F) \
+-	make_fixed_point_mode (MODE_FRACT, #N, Y, 0, F, __FILE__, __LINE__)
++	make_fixed_point_mode (MODE_FRACT, #N, Y, 0, F, __FILE__, 0)
+ 
+ #define UFRACT_MODE(N, Y, F) \
+-	make_fixed_point_mode (MODE_UFRACT, #N, Y, 0, F, __FILE__, __LINE__)
++	make_fixed_point_mode (MODE_UFRACT, #N, Y, 0, F, __FILE__, 0)
+ 
+ #define ACCUM_MODE(N, Y, I, F) \
+-	make_fixed_point_mode (MODE_ACCUM, #N, Y, I, F, __FILE__, __LINE__)
++	make_fixed_point_mode (MODE_ACCUM, #N, Y, I, F, __FILE__, 0)
+ 
+ #define UACCUM_MODE(N, Y, I, F) \
+-	make_fixed_point_mode (MODE_UACCUM, #N, Y, I, F, __FILE__, __LINE__)
++	make_fixed_point_mode (MODE_UACCUM, #N, Y, I, F, __FILE__, 0)
+ 
+ /* Create a fixed-point mode by setting CL, NAME, BYTESIZE, IBIT, FBIT,
+    FILE, and LINE.  */
+@@ -619,7 +619,7 @@ make_fixed_point_mode (enum mode_class cl,
+ 
+ #define FLOAT_MODE(N, Y, F)             FRACTIONAL_FLOAT_MODE (N, -1U, Y, F)
+ #define FRACTIONAL_FLOAT_MODE(N, B, Y, F) \
+-  make_float_mode (#N, B, Y, #F, __FILE__, __LINE__)
++  make_float_mode (#N, B, Y, #F, __FILE__, 0)
+ 
+ static void
+ make_float_mode (const char *name,
+@@ -636,7 +636,7 @@ make_float_mode (const char *name,
+ #define DECIMAL_FLOAT_MODE(N, Y, F)	\
+ 	FRACTIONAL_DECIMAL_FLOAT_MODE (N, -1U, Y, F)
+ #define FRACTIONAL_DECIMAL_FLOAT_MODE(N, B, Y, F)	\
+-  make_decimal_float_mode (#N, B, Y, #F, __FILE__, __LINE__)
++  make_decimal_float_mode (#N, B, Y, #F, __FILE__, 0)
+ 
+ static void
+ make_decimal_float_mode (const char *name,
+@@ -651,7 +651,7 @@ make_decimal_float_mode (const char *name,
+ }
+ 
+ #define RESET_FLOAT_FORMAT(N, F) \
+-  reset_float_format (#N, #F, __FILE__, __LINE__)
++  reset_float_format (#N, #F, __FILE__, 0)
+ static void ATTRIBUTE_UNUSED
+ reset_float_format (const char *name, const char *format,
+ 		    const char *file, unsigned int line)
+@@ -672,7 +672,7 @@ reset_float_format (const char *name, const char *format,
+ 
+ /* __intN support.  */
+ #define INT_N(M,PREC)				\
+-  make_int_n (#M, PREC, __FILE__, __LINE__)
++  make_int_n (#M, PREC, __FILE__, 0)
+ static void ATTRIBUTE_UNUSED
+ make_int_n (const char *m, int bitsize,
+             const char *file, unsigned int line)
+@@ -701,7 +701,7 @@ make_int_n (const char *m, int bitsize,
+ /* Partial integer modes are specified by relation to a full integer
+    mode.  */
+ #define PARTIAL_INT_MODE(M,PREC,NAME)				\
+-  make_partial_integer_mode (#M, #NAME, PREC, __FILE__, __LINE__)
++  make_partial_integer_mode (#M, #NAME, PREC, __FILE__, 0)
+ static void ATTRIBUTE_UNUSED
+ make_partial_integer_mode (const char *base, const char *name,
+ 			   unsigned int precision,
+@@ -728,7 +728,7 @@ make_partial_integer_mode (const char *base, const char *name,
+ /* A single vector mode can be specified by naming its component
+    mode and the number of components.  */
+ #define VECTOR_MODE(C, M, N) \
+-  make_vector_mode (MODE_##C, #M, N, __FILE__, __LINE__);
++  make_vector_mode (MODE_##C, #M, N, __FILE__, 0);
+ static void ATTRIBUTE_UNUSED
+ make_vector_mode (enum mode_class bclass,
+ 		  const char *base,
+@@ -771,7 +771,7 @@ make_vector_mode (enum mode_class bclass,
+ 
+ /* Adjustability.  */
+ #define _ADD_ADJUST(A, M, X, C1, C2) \
+-  new_adjust (#M, &adj_##A, #A, #X, MODE_##C1, MODE_##C2, __FILE__, __LINE__)
++  new_adjust (#M, &adj_##A, #A, #X, MODE_##C1, MODE_##C2, __FILE__, 0)
+ 
+ #define ADJUST_NUNITS(M, X)    _ADD_ADJUST (nunits, M, X, RANDOM, RANDOM)
+ #define ADJUST_BYTESIZE(M, X)  _ADD_ADJUST (bytesize, M, X, RANDOM, RANDOM)
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0036-mingw32-Enable-operation_not_supported.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0036-mingw32-Enable-operation_not_supported.patch
new file mode 100644
index 0000000..de82a3a
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0036-mingw32-Enable-operation_not_supported.patch
@@ -0,0 +1,26 @@
+From 6f87a095f0e696bec07a50df789c9db8bdbca43d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 12 May 2020 10:39:09 -0700
+Subject: [PATCH] mingw32: Enable operation_not_supported
+
+Fixes nativesdk build errors on mingw32 gcc-runtime
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libstdc++-v3/config/os/mingw32/error_constants.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libstdc++-v3/config/os/mingw32/error_constants.h b/libstdc++-v3/config/os/mingw32/error_constants.h
+index 68ac72a78fb..71cd5815b81 100644
+--- a/libstdc++-v3/config/os/mingw32/error_constants.h
++++ b/libstdc++-v3/config/os/mingw32/error_constants.h
+@@ -107,7 +107,7 @@ _GLIBCXX_BEGIN_NAMESPACE_VERSION
+ #ifdef _GLIBCXX_HAVE_EPERM
+       operation_not_permitted = 		EPERM,
+ #endif
+-//    operation_not_supported = 		EOPNOTSUPP,
++      operation_not_supported = 		EOPNOTSUPP,
+ #ifdef _GLIBCXX_HAVE_EWOULDBLOCK
+       operation_would_block = 			EWOULDBLOCK,
+ #endif
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0037-libatomic-Do-not-enforce-march-on-aarch64.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0037-libatomic-Do-not-enforce-march-on-aarch64.patch
new file mode 100644
index 0000000..3946ace
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0037-libatomic-Do-not-enforce-march-on-aarch64.patch
@@ -0,0 +1,42 @@
+From 38d262bfe7c0c894c364dc6e4dc7971e78a73974 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 13 May 2020 15:10:38 -0700
+Subject: [PATCH] libatomic: Do not enforce march on aarch64
+
+OE passes the right options via gcc compiler cmdline via TUNE_CCARGS
+this can conflict between -mcpu settings and -march setting here, since
+-mcpu will translate into an appropriate -march, lets depend on that
+instead of setting it explicitly
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libatomic/Makefile.am | 1 -
+ libatomic/Makefile.in | 1 -
+ 2 files changed, 2 deletions(-)
+
+diff --git a/libatomic/Makefile.am b/libatomic/Makefile.am
+index 133fbbca77e..ac1ca645876 100644
+--- a/libatomic/Makefile.am
++++ b/libatomic/Makefile.am
+@@ -125,7 +125,6 @@ libatomic_la_LIBADD = $(foreach s,$(SIZES),$(addsuffix _$(s)_.lo,$(SIZEOBJS)))
+ ## On a target-specific basis, include alternates to be selected by IFUNC.
+ if HAVE_IFUNC
+ if ARCH_AARCH64_LINUX
+-IFUNC_OPTIONS	     = -march=armv8-a+lse
+ libatomic_la_LIBADD += $(foreach s,$(SIZES),$(addsuffix _$(s)_1_.lo,$(SIZEOBJS)))
+ endif
+ if ARCH_ARM_LINUX
+diff --git a/libatomic/Makefile.in b/libatomic/Makefile.in
+index a51807e95c9..97df2d7ff03 100644
+--- a/libatomic/Makefile.in
++++ b/libatomic/Makefile.in
+@@ -431,7 +431,6 @@ M_SRC = $(firstword $(filter %/$(M_FILE), $(all_c_files)))
+ libatomic_la_LIBADD = $(foreach s,$(SIZES),$(addsuffix \
+ 	_$(s)_.lo,$(SIZEOBJS))) $(am__append_1) $(am__append_2) \
+ 	$(am__append_3) $(am__append_4)
+-@ARCH_AARCH64_LINUX_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -march=armv8-a+lse
+ @ARCH_ARM_LINUX_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -march=armv7-a+fp -DHAVE_KERNEL64
+ @ARCH_I386_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -march=i586
+ @ARCH_X86_64_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -mcx16
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross-canadian_arm-10.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross-canadian_arm-10.2.bb
new file mode 100644
index 0000000..8987a4c
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross-canadian_arm-10.2.bb
@@ -0,0 +1,5 @@
+require recipes-devtools/gcc/gcc-${PV}.inc
+require recipes-devtools/gcc/gcc-cross-canadian.inc
+
+
+
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_arm-10.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_arm-10.2.bb
new file mode 100644
index 0000000..0a8aa75
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_arm-10.2.bb
@@ -0,0 +1,3 @@
+require recipes-devtools/gcc/gcc-${PV}.inc
+require recipes-devtools/gcc/gcc-cross.inc
+
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-crosssdk_arm-10.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-crosssdk_arm-10.2.bb
new file mode 100644
index 0000000..0a9f98a
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-crosssdk_arm-10.2.bb
@@ -0,0 +1,2 @@
+require recipes-devtools/gcc/gcc-cross_${PV}.bb
+require recipes-devtools/gcc/gcc-crosssdk.inc
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-runtime_arm-10.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-runtime_arm-10.2.bb
new file mode 100644
index 0000000..b755f55
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-runtime_arm-10.2.bb
@@ -0,0 +1,2 @@
+require recipes-devtools/gcc/gcc-${PV}.inc
+require recipes-devtools/gcc/gcc-runtime.inc
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-sanitizers_arm-10.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-sanitizers_arm-10.2.bb
new file mode 100644
index 0000000..9c41e92
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-sanitizers_arm-10.2.bb
@@ -0,0 +1,7 @@
+require recipes-devtools/gcc/gcc-${PV}.inc
+require recipes-devtools/gcc/gcc-sanitizers.inc
+
+# Building with thumb enabled on armv4t armv5t fails with
+# sanitizer_linux.s:5749: Error: lo register required -- `ldr ip,[sp],#8'
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-source_arm-10.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-source_arm-10.2.bb
new file mode 100644
index 0000000..b890fa3
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-source_arm-10.2.bb
@@ -0,0 +1,4 @@
+require recipes-devtools/gcc/gcc-${PV}.inc
+require recipes-devtools/gcc/gcc-source.inc
+
+EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-10.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-10.2.bb
new file mode 100644
index 0000000..51a0877
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-10.2.bb
@@ -0,0 +1,15 @@
+require recipes-devtools/gcc/gcc-${PV}.inc
+require recipes-devtools/gcc/gcc-target.inc
+require recipes-devtools/gcc/gcc-arm-common.inc
+
+# Building with thumb enabled on armv4t armv5t fails with
+# | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7438:(.text.unlikely+0x2fa): relocation truncated to fit: R_ARM_THM_CALL against symbol `fancy_abort(char const*, int, char const*)' defined in .glue_7 section in linker stubs
+# | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7442:(.text.unlikely+0x318): additional relocation overflows omitted from the output
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
+
+ARMFPARCHEXT_armv6 = "${@'+fp' if d.getVar('TARGET_FPU') == 'hard' else ''}"
+ARMFPARCHEXT_armv7a = "${@'+fp' if d.getVar('TARGET_FPU') == 'hard' else ''}"
+ARMFPARCHEXT_armv7ve = "${@'+fp' if d.getVar('TARGET_FPU') == 'hard' else ''}"
+
+BBCLASSEXTEND = "nativesdk"
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/libgcc-initial_arm-10.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/libgcc-initial_arm-10.2.bb
new file mode 100644
index 0000000..32f3dc0
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/libgcc-initial_arm-10.2.bb
@@ -0,0 +1,5 @@
+require recipes-devtools/gcc/gcc-${PV}.inc
+require recipes-devtools/gcc/libgcc-initial.inc
+
+# Building with thumb enabled on armv6t fails
+ARM_INSTRUCTION_SET_armv6 = "arm"
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/libgcc_arm-10.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/libgcc_arm-10.2.bb
new file mode 100644
index 0000000..572bab1
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/libgcc_arm-10.2.bb
@@ -0,0 +1,5 @@
+require recipes-devtools/gcc/gcc-${PV}.inc
+require recipes-devtools/gcc/libgcc.inc
+
+# Building with thumb enabled on armv6t fails
+ARM_INSTRUCTION_SET_armv6 = "arm"
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/libgfortran_arm-10.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/libgfortran_arm-10.2.bb
new file mode 100644
index 0000000..4e5688e
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/libgfortran_arm-10.2.bb
@@ -0,0 +1,3 @@
+require recipes-devtools/gcc/gcc-${PV}.inc
+require recipes-devtools/gcc/libgfortran.inc
+
-- 
2.17.1

