Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web12.14496.1629895261824200250
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 25 Aug 2021 05:41:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=AynIbFX4;
 spf=pass (domain: linaro.org, ip: 209.85.215.172, mailfrom: sumit.garg@linaro.org)
Received: by mail-pg1-f172.google.com with SMTP id 17so22934084pgp.4
        for <meta-arm@lists.yoctoproject.org>; Wed, 25 Aug 2021 05:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gqeetX0cCtQBYvLTuf5h9kDyX7viC4+0zNYY3lNJm7o=;
        b=AynIbFX4nzSi5rQFE+7YSaHw0usvCneRY1enPCfM45pOSy3YLd2JNygbKuwDJUCL45
         hVZykXK3PjMoI6Wk/Z/hRn4SmrVyFItHjtQqZIx4XZ8g6GwDdxv4DCXVtQkNzKvcSvcw
         N3ukIUznPEtjouvSd7qbOcK8mjctWqLcn1xBo9yPEb2sf5S9kYoTkFkgwiZWa3elBh5p
         TNfMvQv+Dt0bY1PtT9NS/t52MgJUTp+V3apkQ9PJzDP8VLjfye+eTL0ZD3Nqcz79+PlU
         D2ztUlEN+3Aovhl45rvId6CN4FSiGl2cXP51ZUMt/ftDN8aBneal1xZ1qKnXZclikIpE
         0z0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gqeetX0cCtQBYvLTuf5h9kDyX7viC4+0zNYY3lNJm7o=;
        b=nPNL38P73275XO8i2VZW7SFEh0GwCKT84BCJ5gksR/BwsL9919AMdGUFg3/cj/+hCm
         tmkU3PNwcnSBVNEI4GMTf3/M2jvZro5AU80juKnyiVFLi8LaIYl/+OHiOVJ9Nnzgpg1J
         Wz5fmLZ4vmmNqPYP5ciRs9q2XhxH2y/Mmt/++gfnY0tvi2Qstx6UFvDEtPs5Gj5bQ8QZ
         hDA7XtR5ven9mZNuhAJZ1paPk/GzwNURTBOwPXkwiecbiK8Fog/MbovMCBeS/5g+H3su
         T2HYA/nreir6K6KhhgORaVzH4wSbZ+0F6Fq9s34788hVsD9VPiCI26p0s6eLpvuAy884
         4zbw==
X-Gm-Message-State: AOAM530YPajxGbyhS+Q5rPedIQanBmYdoxR5rmGAvIKZ7wxC8NhT5+0B
	3/6Rs44AU15rC7Gd0mOnVtq2+QelmOexww==
X-Google-Smtp-Source: ABdhPJw/kIbiZ1ba0DROppw+UUic7Z5vFqy/r0A99xrEYwF2tvh4Fxgk6kbD49RHFjzP2EeiwLGhlw==
X-Received: by 2002:a63:ff51:: with SMTP id s17mr42023903pgk.415.1629895259951;
        Wed, 25 Aug 2021 05:40:59 -0700 (PDT)
Return-Path: <sumit.garg@linaro.org>
Received: from localhost.localdomain ([223.178.210.108])
        by smtp.gmail.com with ESMTPSA id f9sm5708858pjq.36.2021.08.25.05.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 05:40:58 -0700 (PDT)
From: "Sumit Garg" <sumit.garg@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Jon.Mason@arm.com,
	Ross.Burton@arm.com,
	daniel.thompson@linaro.org,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH v2] arm-toolchain: Uprev 10.2 -> 10.3
Date: Wed, 25 Aug 2021 18:10:38 +0530
Message-Id: <20210825124038.788842-1-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update Arm GCC toolchain recipe and patches accordingly.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>

Changes in v2:
- Drop support for 10.2 release.
- Update CI to use 10.3 release instead.

---
 ci/armgcc.yml                                 |   2 +-
 ...0001-lib-Remove-i-86-march-overrides.patch | 113 ----------
 .../{gcc-arm-10.2.inc => gcc-arm-10.3.inc}    |  19 +-
 ...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch |  10 +-
 .../0002-gcc-poison-system-directories.patch  |  66 ++++--
 ...-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |   6 +-
 .../0004-64-bit-multilib-hack.patch           |   2 +-
 .../0005-optional-libstdc.patch               |  10 +-
 .../0006-COLLECT_GCC_OPTIONS.patch            |   6 +-
 ...ts.h-in-B-instead-of-S-and-t-oe-in-B.patch |  12 +-
 .../0008-fortran-cross-compile-hack.patch     |   6 +-
 .../0009-cpp-honor-sysroot.patch              |   6 +-
 .../0010-MIPS64-Default-to-N64-ABI.patch      |   6 +-
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |  12 +-
 ...gcc-Fix-argument-list-too-long-error.patch |  11 +-
 .../0013-Disable-sdt.patch                    |  18 +-
 .../0014-libtool.patch                        |   2 +-
 ...s-fix-v4bx-to-linker-to-support-EABI.patch |   2 +-
 ...-config-files-from-B-instead-of-usin.patch |  14 +-
 ...ir-from-.la-which-usually-points-to-.patch |   2 +-
 .../0018-export-CPP.patch                     |   2 +-
 ...e-target-gcc-headers-can-be-included.patch |   6 +-
 ...t-directory-during-relink-if-inst_pr.patch |   2 +-
 ...IR-replacement-instead-of-hardcoding.patch |   2 +-
 ...22-aarch64-Add-support-for-musl-ldso.patch |   2 +-
 ...-fix-libcc1-s-install-path-and-rpath.patch |  10 +-
 ...le-sysroot-support-for-nativesdk-gcc.patch |  15 +-
 ...sroot-gcc-version-specific-dirs-with.patch |   8 +-
 ...ous-_FOR_BUILD-and-related-variables.patch |  12 +-
 ...027-nios2-Define-MUSL_DYNAMIC_LINKER.patch |   2 +-
 ...d-to-link-commandline-for-musl-targe.patch |   4 +-
 ...using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |   2 +-
 .../0030-sync-gcc-stddef.h-with-musl.patch    |   2 +-
 ...-fault-in-precompiled-header-generat.patch |   4 +-
 .../0032-Fix-for-testsuite-failure.patch      |   2 +-
 ...Re-introduce-spe-commandline-options.patch |   6 +-
 ...as-for-__cpu_indicator_init-instead-.patch |  10 +-
 ...s-Do-not-use-__LINE__-for-maintainin.patch |   4 +-
 ...ngw32-Enable-operation_not_supported.patch |   8 +-
 ...omic-Do-not-enforce-march-on-aarch64.patch |   2 +-
 ...libgomp-libitc-Fix-bootstrap-PR70454.patch | 209 ++++++++++++++++++
 ...10.2.bb => gcc-cross-canadian_arm-10.3.bb} |   0
 ...ross_arm-10.2.bb => gcc-cross_arm-10.3.bb} |   0
 ...k_arm-10.2.bb => gcc-crosssdk_arm-10.3.bb} |   0
 ...me_arm-10.2.bb => gcc-runtime_arm-10.3.bb} |   0
 ...arm-10.2.bb => gcc-sanitizers_arm-10.3.bb} |   0
 ...rce_arm-10.2.bb => gcc-source_arm-10.3.bb} |   0
 .../gcc/{gcc_arm-10.2.bb => gcc_arm-10.3.bb}  |   0
 ...arm-10.2.bb => libgcc-initial_arm-10.3.bb} |   0
 ...{libgcc_arm-10.2.bb => libgcc_arm-10.3.bb} |   0
 ...an_arm-10.2.bb => libgfortran_arm-10.3.bb} |   0
 51 files changed, 381 insertions(+), 258 deletions(-)
 delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0001-lib-Remove-i-86-march-overrides.patch
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.2.inc => gcc-arm-10.3.inc} (92%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.2 => gcc-arm-10.3}/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch (84%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.2 => gcc-arm-10.3}/0002-gcc-poison-system-directories.patch (75%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.2 => gcc-arm-10.3}/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch (95%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.2 => gcc-arm-10.3}/0004-64-bit-multilib-hack.patch (98%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.2 => gcc-arm-10.3}/0005-optional-libstdc.patch (94%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.2 => gcc-arm-10.3}/0006-COLLECT_GCC_OPTIONS.patch (85%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.2 => gcc-arm-10.3}/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch (91%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.2 => gcc-arm-10.3}/0008-fortran-cross-compile-hack.patch (91%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.2 => gcc-arm-10.3}/0009-cpp-honor-sysroot.patch (92%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.2 => gcc-arm-10.3}/0010-MIPS64-Default-to-N64-ABI.patch (89%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.2 => gcc-arm-10.3}/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch (97%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.2 => gcc-arm-10.3}/0012-gcc-Fix-argument-list-too-long-error.patch (81%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.2 => gcc-arm-10.3}/0013-Disable-sdt.patch (89%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.2 => gcc-arm-10.3}/0014-libtool.patch (94%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.2 => gcc-arm-10.3}/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch (95%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.2 => gcc-arm-10.3}/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch (89%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.2 => gcc-arm-10.3}/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch (92%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.2 => gcc-arm-10.3}/0018-export-CPP.patch (97%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.2 => gcc-arm-10.3}/0019-Ensure-target-gcc-headers-can-be-included.patch (93%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.2 => gcc-arm-10.3}/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch (93%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.2 => gcc-arm-10.3}/0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch (93%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.2 => gcc-arm-10.3}/0022-aarch64-Add-support-for-musl-ldso.patch (93%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.2 => gcc-arm-10.3}/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch (87%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.2 => gcc-arm-10.3}/0024-handle-sysroot-support-for-nativesdk-gcc.patch (97%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.2 => gcc-arm-10.3}/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch (92%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.2 => gcc-arm-10.3}/0026-Fix-various-_FOR_BUILD-and-related-variables.patch (95%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.2 => gcc-arm-10.3}/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch (92%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.2 => gcc-arm-10.3}/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch (96%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.2 => gcc-arm-10.3}/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch (93%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.2 => gcc-arm-10.3}/0030-sync-gcc-stddef.h-with-musl.patch (97%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.2 => gcc-arm-10.3}/0031-fix-segmentation-fault-in-precompiled-header-generat.patch (94%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.2 => gcc-arm-10.3}/0032-Fix-for-testsuite-failure.patch (99%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.2 => gcc-arm-10.3}/0033-Re-introduce-spe-commandline-options.patch (87%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.2 => gcc-arm-10.3}/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch (91%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.2 => gcc-arm-10.3}/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch (98%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.2 => gcc-arm-10.3}/0036-mingw32-Enable-operation_not_supported.patch (83%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.2 => gcc-arm-10.3}/0037-libatomic-Do-not-enforce-march-on-aarch64.patch (96%)
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0038-libatomic-libgomp-libitc-Fix-bootstrap-PR70454.patch
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-cross-canadian_arm-10.2.bb => gcc-cross-canadian_arm-10.3.bb} (100%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-cross_arm-10.2.bb => gcc-cross_arm-10.3.bb} (100%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-crosssdk_arm-10.2.bb => gcc-crosssdk_arm-10.3.bb} (100%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-runtime_arm-10.2.bb => gcc-runtime_arm-10.3.bb} (100%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-sanitizers_arm-10.2.bb => gcc-sanitizers_arm-10.3.bb} (100%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-source_arm-10.2.bb => gcc-source_arm-10.3.bb} (100%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{gcc_arm-10.2.bb => gcc_arm-10.3.bb} (100%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{libgcc-initial_arm-10.2.bb => libgcc-initial_arm-10.3.bb} (100%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{libgcc_arm-10.2.bb => libgcc_arm-10.3.bb} (100%)
 rename meta-arm-toolchain/recipes-devtools/gcc/{libgfortran_arm-10.2.bb => libgfortran_arm-10.3.bb} (100%)

diff --git a/ci/armgcc.yml b/ci/armgcc.yml
index 4e05f5e..72274a8 100644
--- a/ci/armgcc.yml
+++ b/ci/armgcc.yml
@@ -3,4 +3,4 @@ header:
 
 local_conf_header:
   cc: |
-    GCCVERSION = "arm-10.2"
+    GCCVERSION = "arm-10.3"
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0001-lib-Remove-i-86-march-overrides.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0001-lib-Remove-i-86-march-overrides.patch
deleted file mode 100644
index 3f04e12..0000000
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0001-lib-Remove-i-86-march-overrides.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-From 3776789cde95916f95deef48acf9532b0ebf91ae Mon Sep 17 00:00:00 2001
-From: Nathan Rossi <nathan@nathanrossi.com>
-Date: Tue, 15 Dec 2020 11:43:36 +1000
-Subject: [PATCH] lib*: Remove i*86 march overrides
-
-OE does not pass the '--with-arch' option to gccs configure, as such
-some gcc-runtime libraries try to override the value of '-march' and
-'-mtune' which OE already provides. This causes conflicts with other
-i*86 instruction/architecture flags (e.g. -msse* and -mfpmath=*).
-Additionally this caused the following libraries to be built with less
-optimized tune configurations.
-
-Upstream suggests that this should be detecting or otherwise checking if
-the target supports the desired functionality before overriding.
-
-    https://gcc.gnu.org/legacy-ml/gcc-patches/2016-04/msg01344.html
-
-libatomic also overrides the '-march' specifically for IFUNC objects.
-OE already supplies the correct march flag, so remove setting.
-
-Upstream-Status: Inappropriate [OE Specific]
-Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
----
- libatomic/Makefile.am   | 1 -
- libatomic/Makefile.in   | 1 -
- libatomic/configure.tgt | 9 ---------
- libgomp/configure.tgt   | 8 --------
- libitm/configure.tgt    | 9 ---------
- 5 files changed, 28 deletions(-)
-
-diff --git a/libatomic/Makefile.am b/libatomic/Makefile.am
-index ac1ca64587..5aa16e0699 100644
---- a/libatomic/Makefile.am
-+++ b/libatomic/Makefile.am
-@@ -133,7 +133,6 @@ libatomic_la_LIBADD += $(foreach s,$(SIZES),$(addsuffix _$(s)_1_.lo,$(SIZEOBJS))
- libatomic_la_LIBADD += $(addsuffix _8_2_.lo,$(SIZEOBJS))
- endif
- if ARCH_I386
--IFUNC_OPTIONS	     = -march=i586
- libatomic_la_LIBADD += $(addsuffix _8_1_.lo,$(SIZEOBJS))
- endif
- if ARCH_X86_64
-diff --git a/libatomic/Makefile.in b/libatomic/Makefile.in
-index 97df2d7ff0..82c511d420 100644
---- a/libatomic/Makefile.in
-+++ b/libatomic/Makefile.in
-@@ -432,7 +432,6 @@ libatomic_la_LIBADD = $(foreach s,$(SIZES),$(addsuffix \
- 	_$(s)_.lo,$(SIZEOBJS))) $(am__append_1) $(am__append_2) \
- 	$(am__append_3) $(am__append_4)
- @ARCH_ARM_LINUX_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -march=armv7-a+fp -DHAVE_KERNEL64
--@ARCH_I386_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -march=i586
- @ARCH_X86_64_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -mcx16
- libatomic_convenience_la_SOURCES = $(libatomic_la_SOURCES)
- libatomic_convenience_la_LIBADD = $(libatomic_la_LIBADD)
-diff --git a/libatomic/configure.tgt b/libatomic/configure.tgt
-index 5dd0926d20..3cc41773c3 100644
---- a/libatomic/configure.tgt
-+++ b/libatomic/configure.tgt
-@@ -82,15 +82,6 @@ case "${target_cpu}" in
- 	;;
- 
-   i[3456]86)
--	case " ${CC} ${CFLAGS} " in
--	  *" -m64 "*|*" -mx32 "*)
--	    ;;
--	  *)
--	    if test -z "$with_arch"; then
--	      XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
--	      XCFLAGS="${XCFLAGS} -fomit-frame-pointer"
--	    fi
--	esac
- 	ARCH=x86
- 	# ??? Detect when -march=i686 is already enabled.
- 	try_ifunc=yes
-diff --git a/libgomp/configure.tgt b/libgomp/configure.tgt
-index 4790a31e39..46c4c958e6 100644
---- a/libgomp/configure.tgt
-+++ b/libgomp/configure.tgt
-@@ -72,14 +72,6 @@ if test x$enable_linux_futex = xyes; then
-     # Note that bare i386 is not included here.  We need cmpxchg.
-     i[456]86-*-linux*)
- 	config_path="linux/x86 linux posix"
--	case " ${CC} ${CFLAGS} " in
--	  *" -m64 "*|*" -mx32 "*)
--	    ;;
--	  *)
--	    if test -z "$with_arch"; then
--	      XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
--	    fi
--	esac
- 	;;
- 
-     # Similar jiggery-pokery for x86_64 multilibs, except here we
-diff --git a/libitm/configure.tgt b/libitm/configure.tgt
-index 04109160e9..3d78ea609d 100644
---- a/libitm/configure.tgt
-+++ b/libitm/configure.tgt
-@@ -59,15 +59,6 @@ case "${target_cpu}" in
-   arm*)		ARCH=arm ;;
- 
-   i[3456]86)
--	case " ${CC} ${CFLAGS} " in
--	  *" -m64 "*|*" -mx32 "*)
--	    ;;
--	  *)
--	    if test -z "$with_arch"; then
--	      XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
--	      XCFLAGS="${XCFLAGS} -fomit-frame-pointer"
--	    fi
--	esac
- 	XCFLAGS="${XCFLAGS} -mrtm"
- 	ARCH=x86
- 	;;
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2.inc b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3.inc
similarity index 92%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2.inc
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3.inc
index dc611c3..72a6b46 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2.inc
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3.inc
@@ -2,18 +2,18 @@ require recipes-devtools/gcc/gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
 
-PV = "arm-10.2"
-CVE_VERSION = "10.2"
+PV = "arm-10.3"
+CVE_VERSION = "10.3"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "10.2.1"
+BINV = "10.3.1"
 
-MMYY = "20.11"
+MMYY = "21.07"
 RELEASE = "20${MMYY}"
 PR = "r${RELEASE}"
 
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-arm-10.2:${FILE_DIRNAME}/gcc-arm-10.2/backport:"
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-arm-10.3:${FILE_DIRNAME}/gcc-arm-10.3/backport:"
 
 DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
 NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native"
@@ -28,7 +28,7 @@ LIC_FILES_CHKSUM = "\
     file://COPYING.RUNTIME;md5=fe60d87048567d4fe8c8a0ed2448bcc8 \
 "
 
-BASEURI ?= "https://developer.arm.com/-/media/Files/downloads/gnu-a/10.2-2020.11/srcrel/gcc-arm-src-snapshot-10.2-2020.11.tar.xz"
+BASEURI ?= "https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-2021.07/srcrel/gcc-arm-src-snapshot-10.3-2021.07.tar.xz"
 SRC_URI = "\
            ${BASEURI} \
            file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
@@ -68,11 +68,12 @@ SRC_URI = "\
            file://0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch \
            file://0036-mingw32-Enable-operation_not_supported.patch \
            file://0037-libatomic-Do-not-enforce-march-on-aarch64.patch \
-           file://0001-lib-Remove-i-86-march-overrides.patch \
+           file://0038-libatomic-libgomp-libitc-Fix-bootstrap-PR70454.patch \
 "
-SRC_URI[md5sum] = "ce6ebec573e3e52cdb770c8f822aad17"
+SRC_URI[md5sum] = "5f582fd50eee0e40475b93d2d7a18979"
+
+S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-arm-src-snapshot-10.3-2021.07"
 
-S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-arm-src-snapshot-10.2-2020.11"
 # For dev release snapshotting
 #S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${RELEASE}"
 #B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
similarity index 84%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
index 82ae9f8..6beedac 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
@@ -1,4 +1,4 @@
-From f2a5dc3bc7e5727d6bf77e1c6e8a31a6f000883d Mon Sep 17 00:00:00 2001
+From 2b4a66cbe0bd52e77b37dbaee46e2605d3854412 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 08:37:11 +0400
 Subject: [PATCH] gcc-4.3.1: ARCH_FLAGS_FOR_TARGET
@@ -12,10 +12,10 @@ Upstream-Status: Inappropriate [embedded specific]
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index 4cc938ebb7d..226a64939d1 100755
+index f2ec106a86e..9350b0cf3ed 100755
 --- a/configure
 +++ b/configure
-@@ -7722,7 +7722,7 @@ fi
+@@ -7723,7 +7723,7 @@ fi
  # for target_alias and gcc doesn't manage it consistently.
  target_configargs="--cache-file=./config.cache ${target_configargs}"
  
@@ -25,10 +25,10 @@ index 4cc938ebb7d..226a64939d1 100755
   *" newlib "*)
    case " $target_configargs " in
 diff --git a/configure.ac b/configure.ac
-index c78d9cbea62..f024f4bac9b 100644
+index 115db3f402a..5ef61255710 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3227,7 +3227,7 @@ fi
+@@ -3228,7 +3228,7 @@ fi
  # for target_alias and gcc doesn't manage it consistently.
  target_configargs="--cache-file=./config.cache ${target_configargs}"
  
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0002-gcc-poison-system-directories.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0002-gcc-poison-system-directories.patch
similarity index 75%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0002-gcc-poison-system-directories.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0002-gcc-poison-system-directories.patch
index 30a8486..c96f170 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0002-gcc-poison-system-directories.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0002-gcc-poison-system-directories.patch
@@ -1,4 +1,4 @@
-From 74cc21f474402cf3578e37e1d7a1a22bbd070f6a Mon Sep 17 00:00:00 2001
+From a4fd05ff8e8ed7252d7b302891ac842cbb190c41 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 08:59:00 +0400
 Subject: [PATCH] gcc: poison-system-directories
@@ -13,20 +13,21 @@ wants this to be a failure, they can add "-Werror=poison-system-directories".
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
 
 Upstream-Status: Pending
 ---
  gcc/common.opt      |  4 ++++
- gcc/config.in       |  6 ++++++
- gcc/configure       | 16 ++++++++++++++++
- gcc/configure.ac    | 10 ++++++++++
+ gcc/config.in       | 10 ++++++++++
+ gcc/configure       | 19 +++++++++++++++++++
+ gcc/configure.ac    | 16 ++++++++++++++++
  gcc/doc/invoke.texi |  9 +++++++++
- gcc/gcc.c           |  2 ++
+ gcc/gcc.c           |  9 +++++++--
  gcc/incpath.c       | 21 +++++++++++++++++++++
- 7 files changed, 68 insertions(+)
+ 7 files changed, 86 insertions(+), 2 deletions(-)
 
 diff --git a/gcc/common.opt b/gcc/common.opt
-index 65a82410abc..415f38fa1f4 100644
+index ec5235c3a41..ca942863064 100644
 --- a/gcc/common.opt
 +++ b/gcc/common.opt
 @@ -682,6 +682,10 @@ Wreturn-local-addr
@@ -41,10 +42,10 @@ index 65a82410abc..415f38fa1f4 100644
  Common Var(warn_shadow) Warning
  Warn when one variable shadows another.  Same as -Wshadow=global.
 diff --git a/gcc/config.in b/gcc/config.in
-index 809e7b26823..5adeaeed36b 100644
+index 364eba47737..7d2c3bbf1a3 100644
 --- a/gcc/config.in
 +++ b/gcc/config.in
-@@ -224,6 +224,12 @@
+@@ -224,6 +224,16 @@
  #endif
  
  
@@ -52,13 +53,17 @@ index 809e7b26823..5adeaeed36b 100644
 +#ifndef USED_FOR_TARGET
 +#undef ENABLE_POISON_SYSTEM_DIRECTORIES
 +#endif
++/* Define to warn for use of native system header directories */
++#ifndef USED_FOR_TARGET
++#undef POISON_BY_DEFAULT
++#endif
 +
 +
  /* Define if you want all operations on RTL (the basic data structure of the
     optimizer and back end) to be checked for dynamic type safety at runtime.
     This is quite expensive. */
 diff --git a/gcc/configure b/gcc/configure
-index cd3d9516fce..8de766a942c 100755
+index 8fe9c91fd7c..8976850dff6 100755
 --- a/gcc/configure
 +++ b/gcc/configure
 @@ -1010,6 +1010,7 @@ with_system_zlib
@@ -78,7 +83,7 @@ index cd3d9516fce..8de766a942c 100755
    --enable-plugin         enable plugin support
    --enable-host-shared    build host code as shared libraries
    --disable-libquadmath-support
-@@ -30235,6 +30238,19 @@ if test "${enable_version_specific_runtime_libs+set}" = set; then :
+@@ -30276,6 +30279,22 @@ if test "${enable_version_specific_runtime_libs+set}" = set; then :
  fi
  
  
@@ -89,9 +94,12 @@ index cd3d9516fce..8de766a942c 100755
 +  enable_poison_system_directories=no
 +fi
 +
-+if test "x${enable_poison_system_directories}" = "xyes"; then
++if test "x${enable_poison_system_directories}" != "xno"; then
 +
 +$as_echo "#define ENABLE_POISON_SYSTEM_DIRECTORIES 1" >>confdefs.h
++if test "$enable_poison_system_directories" = "error"; then
++$as_echo "#define POISON_BY_DEFAULT 1" >>confdefs.h
++fi
 +
 +fi
 +
@@ -99,28 +107,34 @@ index cd3d9516fce..8de766a942c 100755
  
  
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 0de3b4bf97b..8bfd6feb780 100644
+index 84dceb8074a..13eace6cfc6 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -6595,6 +6595,16 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
+@@ -6608,6 +6608,22 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
                  [specify that runtime libraries should be
                   installed in a compiler-specific directory])])
  
 +AC_ARG_ENABLE([poison-system-directories],
 +             AS_HELP_STRING([--enable-poison-system-directories],
-+                            [warn for use of native system header directories]),,
++			    [warn for use of native system header directories (no/yes/error)]),,
 +             [enable_poison_system_directories=no])
-+if test "x${enable_poison_system_directories}" = "xyes"; then
++AC_MSG_NOTICE([poisoned directories $enable_poison_system_directories])
++if test "x${enable_poison_system_directories}" != "xno"; then
++  AC_MSG_NOTICE([poisoned directories enabled])
 +  AC_DEFINE([ENABLE_POISON_SYSTEM_DIRECTORIES],
 +           [1],
 +           [Define to warn for use of native system header directories])
++  if test $enable_poison_system_directories = "error"; then
++   AC_MSG_NOTICE([poisoned directories are fatal])
++   AC_DEFINE([POISON_BY_DEFAULT], [1], [Define to make poison warnings errors])
++  fi
 +fi
 +
  # Substitute configuration variables
  AC_SUBST(subdirs)
  AC_SUBST(srcdir)
 diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index f98161391a0..f12d8d12150 100644
+index eabeec944e7..cd31b522e42 100644
 --- a/gcc/doc/invoke.texi
 +++ b/gcc/doc/invoke.texi
 @@ -348,6 +348,7 @@ Objective-C and Objective-C++ Dialects}.
@@ -131,7 +145,7 @@ index f98161391a0..f12d8d12150 100644
  -Wno-pragmas  -Wno-prio-ctor-dtor  -Wredundant-decls @gol
  -Wrestrict  -Wno-return-local-addr  -Wreturn-type @gol
  -Wno-scalar-storage-order  -Wsequence-point @gol
-@@ -6924,6 +6925,14 @@ made up of data only and thus requires no special treatment.  But, for
+@@ -6926,6 +6927,14 @@ made up of data only and thus requires no special treatment.  But, for
  most targets, it is made up of code and thus requires the stack to be
  made executable in order for the program to work properly.
  
@@ -147,7 +161,7 @@ index f98161391a0..f12d8d12150 100644
  @opindex Wfloat-equal
  @opindex Wno-float-equal
 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 9f790db0daf..b2200c5185a 100644
+index 9f790db0daf..f379f71da3d 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
 @@ -1041,6 +1041,8 @@ proper position among the other output files.  */
@@ -159,6 +173,20 @@ index 9f790db0daf..b2200c5185a 100644
      %{static|no-pie|static-pie:} %@{L*} %(mfwrap) %(link_libgcc) " \
      VTABLE_VERIFICATION_SPEC " " SANITIZER_EARLY_SPEC " %o "" \
      %{fopenacc|fopenmp|%:gt(%{ftree-parallelize-loops=*:%*} 1):\
+@@ -1134,8 +1136,11 @@ static const char *cpp_unique_options =
+ static const char *cpp_options =
+ "%(cpp_unique_options) %1 %{m*} %{std*&ansi&trigraphs} %{W*&pedantic*} %{w}\
+  %{f*} %{g*:%{%:debug-level-gt(0):%{g*}\
+- %{!fno-working-directory:-fworking-directory}}} %{O*}\
+- %{undef} %{save-temps*:-fpch-preprocess}";
++ %{!fno-working-directory:-fworking-directory}}} %{O*}"
++#ifdef POISON_BY_DEFAULT
++ " -Werror=poison-system-directories"
++#endif
++ " %{undef} %{save-temps*:-fpch-preprocess}";
+ 
+ /* This contains cpp options which are not passed when the preprocessor
+    output will be used by another program.  */
 diff --git a/gcc/incpath.c b/gcc/incpath.c
 index 8a2bda00f80..9098ab044ab 100644
 --- a/gcc/incpath.c
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
similarity index 95%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
index 27237fe..39b616e 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
@@ -1,4 +1,4 @@
-From 6e3395c0bc933bdc3242d1dead4896d0aa4e11a8 Mon Sep 17 00:00:00 2001
+From 860a8a2ec653e3c65bc5440f181b459dfe56c8a0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:08:31 +0400
 Subject: [PATCH] gcc-4.3.3: SYSROOT_CFLAGS_FOR_TARGET
@@ -26,10 +26,10 @@ Upstream-Status: Pending
  1 file changed, 32 insertions(+)
 
 diff --git a/configure b/configure
-index 226a64939d1..b31dc137fc9 100755
+index 9350b0cf3ed..8ed565c51b3 100755
 --- a/configure
 +++ b/configure
-@@ -6971,6 +6971,38 @@ fi
+@@ -6972,6 +6972,38 @@ fi
  
  
  
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0004-64-bit-multilib-hack.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0004-64-bit-multilib-hack.patch
similarity index 98%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0004-64-bit-multilib-hack.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0004-64-bit-multilib-hack.patch
index 7c751be..04d8bdf 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0004-64-bit-multilib-hack.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0004-64-bit-multilib-hack.patch
@@ -1,4 +1,4 @@
-From 85a7c5aeb82ed61e6ef6d8e061b9da9e6a4a652c Mon Sep 17 00:00:00 2001
+From d166c36206b276f769e175f39cf44b33c98bd153 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:10:06 +0400
 Subject: [PATCH] 64-bit multilib hack.
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0005-optional-libstdc.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0005-optional-libstdc.patch
similarity index 94%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0005-optional-libstdc.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0005-optional-libstdc.patch
index 4020c9e..9f5b96e 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0005-optional-libstdc.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0005-optional-libstdc.patch
@@ -1,4 +1,4 @@
-From 6ddfb0bfcd1eea71acd37ab06f7a4510b9f1d12b Mon Sep 17 00:00:00 2001
+From dcbfaf57a213e3beaafb0561b007c61501961f03 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:12:56 +0400
 Subject: [PATCH] optional libstdc
@@ -52,7 +52,7 @@ index 0ab63bcd211..7b081e9e4f0 100644
  	  library = -1;
  	  break;
 diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index f12d8d12150..cf6cb428e7d 100644
+index cd31b522e42..1f14df48bda 100644
 --- a/gcc/doc/invoke.texi
 +++ b/gcc/doc/invoke.texi
 @@ -230,6 +230,9 @@ in the following sections.
@@ -65,7 +65,7 @@ index f12d8d12150..cf6cb428e7d 100644
  -fext-numeric-literals @gol
  -Wabi-tag  -Wcatch-value  -Wcatch-value=@var{n} @gol
  -Wno-class-conversion  -Wclass-memaccess @gol
-@@ -599,7 +602,7 @@ Objective-C and Objective-C++ Dialects}.
+@@ -600,7 +603,7 @@ Objective-C and Objective-C++ Dialects}.
  -pie  -pthread  -r  -rdynamic @gol
  -s  -static  -static-pie  -static-libgcc  -static-libstdc++ @gol
  -static-libasan  -static-libtsan  -static-liblsan  -static-libubsan @gol
@@ -74,7 +74,7 @@ index f12d8d12150..cf6cb428e7d 100644
  -T @var{script}  -Wl,@var{option}  -Xlinker @var{option} @gol
  -u @var{symbol}  -z @var{keyword}}
  
-@@ -14407,6 +14410,33 @@ Specify that the program entry point is @var{entry}.  The argument is
+@@ -14468,6 +14471,33 @@ Specify that the program entry point is @var{entry}.  The argument is
  interpreted by the linker; the GNU linker accepts either a symbol name
  or an address.
  
@@ -109,7 +109,7 @@ index f12d8d12150..cf6cb428e7d 100644
  @opindex pie
  Produce a dynamically linked position independent executable on targets
 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index b2200c5185a..f8be58ce0a6 100644
+index f379f71da3d..1ee962acfaa 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
 @@ -1051,6 +1051,7 @@ proper position among the other output files.  */
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0006-COLLECT_GCC_OPTIONS.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0006-COLLECT_GCC_OPTIONS.patch
similarity index 85%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0006-COLLECT_GCC_OPTIONS.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0006-COLLECT_GCC_OPTIONS.patch
index 9fbbe80..7e43284 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0006-COLLECT_GCC_OPTIONS.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0006-COLLECT_GCC_OPTIONS.patch
@@ -1,4 +1,4 @@
-From a6c90d3a9c5010b4aa7cc30467cf81ca7e0f430e Mon Sep 17 00:00:00 2001
+From a03125f58038c89637445fdfbb6c38d2b276633e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:16:28 +0400
 Subject: [PATCH] COLLECT_GCC_OPTIONS
@@ -14,10 +14,10 @@ Upstream-Status: Pending
  1 file changed, 9 insertions(+)
 
 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index f8be58ce0a6..48b0f9dde81 100644
+index 1ee962acfaa..39b1635651a 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
-@@ -4806,6 +4806,15 @@ set_collect_gcc_options (void)
+@@ -4809,6 +4809,15 @@ set_collect_gcc_options (void)
  		sizeof ("COLLECT_GCC_OPTIONS=") - 1);
  
    first_time = TRUE;
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
similarity index 91%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
index a764bdd..c7693a8 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
@@ -1,4 +1,4 @@
-From 5670d4489f119d2da661734895ac0be99b606d1b Mon Sep 17 00:00:00 2001
+From 938b65c6ba6cb4af24285f288126fe65b3e1fa9e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:17:25 +0400
 Subject: [PATCH] Use the defaults.h in ${B} instead of ${S}, and t-oe in ${B}
@@ -26,7 +26,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  4 files changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 543b477ff18..a67d2cc18d6 100644
+index 646db219460..501a5f16d9f 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
 @@ -540,7 +540,7 @@ TARGET_SYSTEM_ROOT = @TARGET_SYSTEM_ROOT@
@@ -39,10 +39,10 @@ index 543b477ff18..a67d2cc18d6 100644
  TM_MULTILIB_CONFIG=@TM_MULTILIB_CONFIG@
  TM_MULTILIB_EXCEPTIONS_CONFIG=@TM_MULTILIB_EXCEPTIONS_CONFIG@
 diff --git a/gcc/configure b/gcc/configure
-index 8de766a942c..b26e8fc7fee 100755
+index 8976850dff6..4d903cf40e8 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -12705,8 +12705,8 @@ for f in $tm_file; do
+@@ -12710,8 +12710,8 @@ for f in $tm_file; do
         tm_include_list="${tm_include_list} $f"
         ;;
      defaults.h )
@@ -54,10 +54,10 @@ index 8de766a942c..b26e8fc7fee 100755
      * )
         tm_file_list="${tm_file_list} \$(srcdir)/config/$f"
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 8bfd6feb780..26fa46802c7 100644
+index 13eace6cfc6..07aacfee055 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -2138,8 +2138,8 @@ for f in $tm_file; do
+@@ -2143,8 +2143,8 @@ for f in $tm_file; do
         tm_include_list="${tm_include_list} $f"
         ;;
      defaults.h )
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0008-fortran-cross-compile-hack.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0008-fortran-cross-compile-hack.patch
similarity index 91%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0008-fortran-cross-compile-hack.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0008-fortran-cross-compile-hack.patch
index 714db3b..7070662 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0008-fortran-cross-compile-hack.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0008-fortran-cross-compile-hack.patch
@@ -1,4 +1,4 @@
-From f05062625e7a4751be723595a2f7a4b7fbeff311 Mon Sep 17 00:00:00 2001
+From 660bf2b932273e2cde495f31cc031bb084572862 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:20:01 +0400
 Subject: [PATCH] fortran cross-compile hack.
@@ -16,10 +16,10 @@ Upstream-Status: Inappropriate [embedded specific]
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/libgfortran/configure b/libgfortran/configure
-index b4cf854ddb3..e8e0ac3b1cf 100755
+index 1b4a8b10609..d7ab18fc9f9 100755
 --- a/libgfortran/configure
 +++ b/libgfortran/configure
-@@ -13090,7 +13090,7 @@ esac
+@@ -13092,7 +13092,7 @@ esac
  
  # We need gfortran to compile parts of the library
  #AC_PROG_FC(gfortran)
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0009-cpp-honor-sysroot.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0009-cpp-honor-sysroot.patch
similarity index 92%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0009-cpp-honor-sysroot.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0009-cpp-honor-sysroot.patch
index 8ad6853..3f6b69a 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0009-cpp-honor-sysroot.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0009-cpp-honor-sysroot.patch
@@ -1,4 +1,4 @@
-From 1d76de7f1f5c99f1fa1a4b14aedad3d702e4e136 Mon Sep 17 00:00:00 2001
+From 303cc9292cc0a1bd7bae994dd1e86197fb94068d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:22:00 +0400
 Subject: [PATCH] cpp: honor sysroot.
@@ -37,10 +37,10 @@ index 0ad4a33b93e..16c744f4f90 100644
 +      "  cc1plus -fpreprocessed %i %I %(cc1_options) %2"
        "  %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 48b0f9dde81..c87f603955f 100644
+index 39b1635651a..e2e0bcee9b2 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
-@@ -1348,7 +1348,7 @@ static const struct compiler default_compilers[] =
+@@ -1351,7 +1351,7 @@ static const struct compiler default_compilers[] =
  					   %W{o*:--output-pch=%*}}%V}}}}}}}", 0, 0, 0},
    {".i", "@cpp-output", 0, 0, 0},
    {"@cpp-output",
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0010-MIPS64-Default-to-N64-ABI.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0010-MIPS64-Default-to-N64-ABI.patch
similarity index 89%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0010-MIPS64-Default-to-N64-ABI.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0010-MIPS64-Default-to-N64-ABI.patch
index 625e2d8..1aa29e6 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0010-MIPS64-Default-to-N64-ABI.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0010-MIPS64-Default-to-N64-ABI.patch
@@ -1,4 +1,4 @@
-From 4fad4433c96bc9d0d9d124f9674fb3389f6f426e Mon Sep 17 00:00:00 2001
+From b75e8fb1cc1607077a113de40ae0d16ad273f05a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:23:08 +0400
 Subject: [PATCH] MIPS64: Default to N64 ABI
@@ -14,10 +14,10 @@ Upstream-Status: Inappropriate [OE config specific]
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/gcc/config.gcc b/gcc/config.gcc
-index cf1a87e2efd..37c4221a39f 100644
+index 6fcdd771d4c..feafcadfcac 100644
 --- a/gcc/config.gcc
 +++ b/gcc/config.gcc
-@@ -2511,29 +2511,29 @@ mips*-*-linux*)				# Linux MIPS, either endian.
+@@ -2542,29 +2542,29 @@ mips*-*-linux*)				# Linux MIPS, either endian.
  			default_mips_arch=mips32
  			;;
  		mips64el-st-linux-gnu)
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
similarity index 97%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
index e357976..ee34836 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
@@ -1,4 +1,4 @@
-From 8fc016a53c22c19feccbfa13ebdf19090dc67058 Mon Sep 17 00:00:00 2001
+From 438b8d40f6060c0d62b474b2ae970241f9635f6b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:24:50 +0400
 Subject: [PATCH] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
@@ -167,7 +167,7 @@ index 4afef7c228c..01997330741 100644
  #define MUSL_ABI_SUFFIX \
    "%{mabi=ilp32:-sf}" \
 diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
-index 34776c8421e..967c1c43c63 100644
+index 2ded3301282..80969a8fd89 100644
 --- a/gcc/config/rs6000/linux64.h
 +++ b/gcc/config/rs6000/linux64.h
 @@ -419,24 +419,19 @@ extern int dot_symbols;
@@ -214,10 +214,10 @@ index c1d0441d488..81373eb8336 100644
  #undef SUBTARGET_LINK_EMUL_SUFFIX
  #define SUBTARGET_LINK_EMUL_SUFFIX "%{mfdpic:_fd;:_linux}"
 diff --git a/gcc/config/sparc/linux.h b/gcc/config/sparc/linux.h
-index 81201e67a2f..8b6fc577594 100644
+index 63853e60c03..31219e9892c 100644
 --- a/gcc/config/sparc/linux.h
 +++ b/gcc/config/sparc/linux.h
-@@ -84,7 +84,7 @@ extern const char *host_detect_local_cpu (int argc, const char **argv);
+@@ -78,7 +78,7 @@ extern const char *host_detect_local_cpu (int argc, const char **argv);
     When the -shared link option is used a final link is not being
     done.  */
  
@@ -227,10 +227,10 @@ index 81201e67a2f..8b6fc577594 100644
  #undef  LINK_SPEC
  #define LINK_SPEC "-m elf32_sparc %{shared:-shared} \
 diff --git a/gcc/config/sparc/linux64.h b/gcc/config/sparc/linux64.h
-index a1a0efd8f28..85d1084afc2 100644
+index 19ce84d7adb..0d9cc752931 100644
 --- a/gcc/config/sparc/linux64.h
 +++ b/gcc/config/sparc/linux64.h
-@@ -84,8 +84,8 @@ along with GCC; see the file COPYING3.  If not see
+@@ -78,8 +78,8 @@ along with GCC; see the file COPYING3.  If not see
     When the -shared link option is used a final link is not being
     done.  */
  
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0012-gcc-Fix-argument-list-too-long-error.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0012-gcc-Fix-argument-list-too-long-error.patch
similarity index 81%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0012-gcc-Fix-argument-list-too-long-error.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0012-gcc-Fix-argument-list-too-long-error.patch
index 88e1715..ad2df92 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0012-gcc-Fix-argument-list-too-long-error.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0012-gcc-Fix-argument-list-too-long-error.patch
@@ -1,4 +1,4 @@
-From a22d1264049d29b90663cf5667049ae6f9b7a5ce Mon Sep 17 00:00:00 2001
+From cc2aac0b93f2f22a5fd0ecd80743e88d4e244597 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:26:37 +0400
 Subject: [PATCH] gcc: Fix argument list too long error.
@@ -22,17 +22,18 @@ fix. Add the sort to the original gcc code, leaving the tr+sort to fix the origi
 issue but include the new files too as reported by Zhuang <qiuguang.zqg@alibaba-inc.com>
 
 Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  gcc/Makefile.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index a67d2cc18d6..480c9366418 100644
+index 501a5f16d9f..674f1057aaf 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
-@@ -3606,7 +3606,7 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
- # We keep the directory structure for files in config or c-family and .def
- # files. All other files are flattened to a single directory.
+@@ -3609,7 +3609,7 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
+ # We keep the directory structure for files in config, common/config or
+ # c-family and .def files. All other files are flattened to a single directory.
  	$(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
 -	headers=`echo $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def) | tr ' ' '\012' | sort -u`; \
 +	headers=`echo $(sort $(PLUGIN_HEADERS)) $$(cd $(srcdir); echo *.h *.def) | tr ' ' '\012' | sort -u`; \
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0013-Disable-sdt.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0013-Disable-sdt.patch
similarity index 89%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0013-Disable-sdt.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0013-Disable-sdt.patch
index 207cdb5..b93ae83 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0013-Disable-sdt.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0013-Disable-sdt.patch
@@ -1,4 +1,4 @@
-From fa47586935a18ecfc2ad5586802e326e21741b7b Mon Sep 17 00:00:00 2001
+From d87eef0037d15f363b2614bac531626b87189d4f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:28:10 +0400
 Subject: [PATCH] Disable sdt.
@@ -25,10 +25,10 @@ Upstream-Status: Inappropriate [hack]
  4 files changed, 19 insertions(+), 19 deletions(-)
 
 diff --git a/gcc/configure b/gcc/configure
-index b26e8fc7fee..6080f86145e 100755
+index 4d903cf40e8..156090550c2 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -29789,12 +29789,12 @@ fi
+@@ -29830,12 +29830,12 @@ fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking sys/sdt.h in the target C library" >&5
  $as_echo_n "checking sys/sdt.h in the target C library... " >&6; }
  have_sys_sdt_h=no
@@ -48,10 +48,10 @@ index b26e8fc7fee..6080f86145e 100755
  $as_echo "$have_sys_sdt_h" >&6; }
  
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 26fa46802c7..42be5252778 100644
+index 07aacfee055..f31a43e7dd3 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -6190,15 +6190,15 @@ fi
+@@ -6203,15 +6203,15 @@ fi
  AC_SUBST([enable_default_ssp])
  
  # Test for <sys/sdt.h> on the target.
@@ -77,10 +77,10 @@ index 26fa46802c7..42be5252778 100644
  # Check if TFmode long double should be used by default or not.
  # Some glibc targets used DFmode long double, but with glibc 2.4
 diff --git a/libstdc++-v3/configure b/libstdc++-v3/configure
-index 9f9c5a2419a..71ed13b815b 100755
+index 766a0a8d504..ba59088a722 100755
 --- a/libstdc++-v3/configure
 +++ b/libstdc++-v3/configure
-@@ -22615,11 +22615,11 @@ ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
+@@ -21986,11 +21986,11 @@ ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
  ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
  ac_compiler_gnu=$ac_cv_c_compiler_gnu
  
@@ -96,10 +96,10 @@ index 9f9c5a2419a..71ed13b815b 100755
  $as_echo "$glibcxx_cv_sys_sdt_h" >&6; }
  
 diff --git a/libstdc++-v3/configure.ac b/libstdc++-v3/configure.ac
-index 699e55fd829..5c7a7bda439 100644
+index 07cf05b6856..dd5f26957d5 100644
 --- a/libstdc++-v3/configure.ac
 +++ b/libstdc++-v3/configure.ac
-@@ -241,7 +241,7 @@ GLIBCXX_CHECK_SC_NPROCESSORS_ONLN
+@@ -240,7 +240,7 @@ GLIBCXX_CHECK_SC_NPROCESSORS_ONLN
  GLIBCXX_CHECK_SC_NPROC_ONLN
  GLIBCXX_CHECK_PTHREADS_NUM_PROCESSORS_NP
  GLIBCXX_CHECK_SYSCTL_HW_NCPU
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0014-libtool.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0014-libtool.patch
similarity index 94%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0014-libtool.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0014-libtool.patch
index f4e70c3..3da3261 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0014-libtool.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0014-libtool.patch
@@ -1,4 +1,4 @@
-From 6ecd478881468934444ff85611fd43f7033b1e81 Mon Sep 17 00:00:00 2001
+From d1584292b3a199dc6318f7508fd0c74ec4169a21 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:29:11 +0400
 Subject: [PATCH] libtool
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
similarity index 95%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
index bc2674a..e08e44c 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
@@ -1,4 +1,4 @@
-From de4427fa49c07dc651ee6ceaf5c5078700ca3b08 Mon Sep 17 00:00:00 2001
+From b7a96ff62cc0daa3a789c720d30e2edaabbafe5d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:30:32 +0400
 Subject: [PATCH] gcc: armv4: pass fix-v4bx to linker to support EABI.
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
similarity index 89%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
index 1dc4bb8..d86da65 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
@@ -1,4 +1,4 @@
-From 6b363c2c1c089ee900efa6013aefba1003840a37 Mon Sep 17 00:00:00 2001
+From 187e962aed3b3f39a96eb4419a7fa23e88634efb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:33:04 +0400
 Subject: [PATCH] Use the multilib config files from ${B} instead of using the
@@ -18,10 +18,10 @@ Upstream-Status: Inappropriate [configuration]
  2 files changed, 36 insertions(+), 8 deletions(-)
 
 diff --git a/gcc/configure b/gcc/configure
-index 6080f86145e..825a9652329 100755
+index 156090550c2..fde89ad8e89 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -12685,10 +12685,20 @@ done
+@@ -12690,10 +12690,20 @@ done
  tmake_file_=
  for f in ${tmake_file}
  do
@@ -46,7 +46,7 @@ index 6080f86145e..825a9652329 100755
  done
  tmake_file="${tmake_file_}${omp_device_property_tmake_file}"
  
-@@ -12699,6 +12709,10 @@ tm_file_list="options.h"
+@@ -12704,6 +12714,10 @@ tm_file_list="options.h"
  tm_include_list="options.h insn-constants.h"
  for f in $tm_file; do
    case $f in
@@ -58,10 +58,10 @@ index 6080f86145e..825a9652329 100755
         f=`echo $f | sed 's/^..//'`
         tm_file_list="${tm_file_list} $f"
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 42be5252778..6099eb3251f 100644
+index f31a43e7dd3..cad69549a01 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -2118,10 +2118,20 @@ done
+@@ -2123,10 +2123,20 @@ done
  tmake_file_=
  for f in ${tmake_file}
  do
@@ -86,7 +86,7 @@ index 42be5252778..6099eb3251f 100644
  done
  tmake_file="${tmake_file_}${omp_device_property_tmake_file}"
  
-@@ -2132,6 +2142,10 @@ tm_file_list="options.h"
+@@ -2137,6 +2147,10 @@ tm_file_list="options.h"
  tm_include_list="options.h insn-constants.h"
  for f in $tm_file; do
    case $f in
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
similarity index 92%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
index 05f1284..55eb44e 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
@@ -1,4 +1,4 @@
-From 08752c2f1d21553301bee5757c453c6a36cbe03c Mon Sep 17 00:00:00 2001
+From 6211545ca5aa4a5bfb7c4dfcfdb9db7e5511b40e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 09:39:38 +0000
 Subject: [PATCH] Avoid using libdir from .la which usually points to a host
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0018-export-CPP.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0018-export-CPP.patch
similarity index 97%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0018-export-CPP.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0018-export-CPP.patch
index 886a122..5f28e86 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0018-export-CPP.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0018-export-CPP.patch
@@ -1,4 +1,4 @@
-From 5c3d66378c7ff60ca11a875aa4aa6f8a8529d43a Mon Sep 17 00:00:00 2001
+From 9d8512e3efa0d125714bafb907734a0c095b84ce Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 09:40:59 +0000
 Subject: [PATCH] export CPP
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0019-Ensure-target-gcc-headers-can-be-included.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0019-Ensure-target-gcc-headers-can-be-included.patch
similarity index 93%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0019-Ensure-target-gcc-headers-can-be-included.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0019-Ensure-target-gcc-headers-can-be-included.patch
index 2797b2c..9e9f287 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0019-Ensure-target-gcc-headers-can-be-included.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0019-Ensure-target-gcc-headers-can-be-included.patch
@@ -1,4 +1,4 @@
-From 378b752c5d9a3dba4e58cdadf8b4b4f34ea99a76 Mon Sep 17 00:00:00 2001
+From 468604663f799d3d80d0db760f03ba32678801aa Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 10:25:11 +0000
 Subject: [PATCH] Ensure target gcc headers can be included
@@ -21,7 +21,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 6 insertions(+)
 
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 480c9366418..011c7ac2db6 100644
+index 674f1057aaf..087bf3f1137 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
 @@ -618,6 +618,7 @@ libexecdir = @libexecdir@
@@ -32,7 +32,7 @@ index 480c9366418..011c7ac2db6 100644
  # Directory in which the compiler finds executables
  libexecsubdir = $(libexecdir)/gcc/$(real_target_noncanonical)/$(version)$(accel_dir_suffix)
  # Directory in which all plugin resources are installed
-@@ -2946,6 +2947,7 @@ CFLAGS-intl.o += -DLOCALEDIR=\"$(localedir)\"
+@@ -2948,6 +2949,7 @@ CFLAGS-intl.o += -DLOCALEDIR=\"$(localedir)\"
  
  PREPROCESSOR_DEFINES = \
    -DGCC_INCLUDE_DIR=\"$(libsubdir)/include\" \
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch
similarity index 93%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch
index c3baf8b..ce838eb 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch
@@ -1,4 +1,4 @@
-From 870e805d705d99d9b9d7dbd09727f9c1d2ad9c1d Mon Sep 17 00:00:00 2001
+From dbdf19800e24571603b0baee1734a58ff2cf2974 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 3 Mar 2015 08:21:19 +0000
 Subject: [PATCH] Don't search host directory during "relink" if $inst_prefix
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
similarity index 93%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
index abee486..5832720 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
@@ -1,4 +1,4 @@
-From aba42de763a619355471efd1573561b0cbf51162 Mon Sep 17 00:00:00 2001
+From 7c019b932f06bdce624b4739fba75dacff794076 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 28 Apr 2015 23:15:27 -0700
 Subject: [PATCH] Use SYSTEMLIBS_DIR replacement instead of hardcoding
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0022-aarch64-Add-support-for-musl-ldso.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0022-aarch64-Add-support-for-musl-ldso.patch
similarity index 93%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0022-aarch64-Add-support-for-musl-ldso.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0022-aarch64-Add-support-for-musl-ldso.patch
index c55b66d..851f8ed 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0022-aarch64-Add-support-for-musl-ldso.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0022-aarch64-Add-support-for-musl-ldso.patch
@@ -1,4 +1,4 @@
-From d63820a78d92f302410358293546f01c7ad17bd8 Mon Sep 17 00:00:00 2001
+From ce93292090b1a8cb0b0b0061ec09243936bf9bcf Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 28 Apr 2015 23:18:39 -0700
 Subject: [PATCH] aarch64: Add support for musl ldso
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch
similarity index 87%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch
index 80c4d22..d981b37 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch
@@ -1,4 +1,4 @@
-From 3474e16ad4ea8cf4e0e330568e3bc9039e723dce Mon Sep 17 00:00:00 2001
+From cc298bd514d32cea58bfbdbda503d710355e97b4 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Sun, 5 Jul 2015 20:25:18 -0700
 Subject: [PATCH] libcc1: fix libcc1's install path and rpath
@@ -20,10 +20,10 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  2 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/libcc1/Makefile.am b/libcc1/Makefile.am
-index c005b0dad4a..ec31d35b7b9 100644
+index fe7b64cbc6f..bdd0617049b 100644
 --- a/libcc1/Makefile.am
 +++ b/libcc1/Makefile.am
-@@ -37,8 +37,8 @@ libiberty = $(if $(wildcard $(libiberty_noasan)),$(Wc)$(libiberty_noasan), \
+@@ -40,8 +40,8 @@ libiberty = $(if $(wildcard $(libiberty_noasan)),$(Wc)$(libiberty_noasan), \
  	    $(Wc)$(libiberty_normal)))
  libiberty_dep = $(patsubst $(Wc)%,%,$(libiberty))
  
@@ -35,10 +35,10 @@ index c005b0dad4a..ec31d35b7b9 100644
  if ENABLE_PLUGIN
  plugin_LTLIBRARIES = libcc1plugin.la libcp1plugin.la
 diff --git a/libcc1/Makefile.in b/libcc1/Makefile.in
-index 7104b649026..2103c477468 100644
+index 2def836cb06..98e12a9d369 100644
 --- a/libcc1/Makefile.in
 +++ b/libcc1/Makefile.in
-@@ -393,8 +393,8 @@ libiberty = $(if $(wildcard $(libiberty_noasan)),$(Wc)$(libiberty_noasan), \
+@@ -394,8 +394,8 @@ libiberty = $(if $(wildcard $(libiberty_noasan)),$(Wc)$(libiberty_noasan), \
  	    $(Wc)$(libiberty_normal)))
  
  libiberty_dep = $(patsubst $(Wc)%,%,$(libiberty))
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0024-handle-sysroot-support-for-nativesdk-gcc.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0024-handle-sysroot-support-for-nativesdk-gcc.patch
similarity index 97%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0024-handle-sysroot-support-for-nativesdk-gcc.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0024-handle-sysroot-support-for-nativesdk-gcc.patch
index dc3e6da..6c75c0f 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0024-handle-sysroot-support-for-nativesdk-gcc.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0024-handle-sysroot-support-for-nativesdk-gcc.patch
@@ -1,4 +1,4 @@
-From 702daf2e9cb97337e0e594fcd435b1b61a917d14 Mon Sep 17 00:00:00 2001
+From 2966f3c43382fa4f79cbac761232dae2e92e7012 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Dec 2015 23:39:54 +0000
 Subject: [PATCH] handle sysroot support for nativesdk-gcc
@@ -41,7 +41,7 @@ Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
  6 files changed, 70 insertions(+), 48 deletions(-)
 
 diff --git a/gcc/c-family/c-opts.c b/gcc/c-family/c-opts.c
-index 58ba0948e79..806bbcfb7a5 100644
+index c51d6d34726..aa7507df2cf 100644
 --- a/gcc/c-family/c-opts.c
 +++ b/gcc/c-family/c-opts.c
 @@ -1409,8 +1409,8 @@ add_prefixed_path (const char *suffix, incpath_kind chain)
@@ -214,7 +214,7 @@ index a681264f75e..5e10a2fa140 100644
     subdirectory of the actual installation.  */
  extern const char *gcc_exec_prefix;
 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index c87f603955f..535d5c3bb65 100644
+index e2e0bcee9b2..912c2febf94 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
 @@ -252,6 +252,8 @@ FILE *report_times_to_file = NULL;
@@ -234,7 +234,7 @@ index c87f603955f..535d5c3bb65 100644
   %S     process STARTFILE_SPEC as a spec.  A capital S is actually used here.
   %E     process ENDFILE_SPEC as a spec.  A capital E is actually used here.
   %C     process CPP_SPEC as a spec.
-@@ -1499,10 +1502,10 @@ static const char *gcc_libexec_prefix;
+@@ -1502,10 +1505,10 @@ static const char *gcc_libexec_prefix;
     gcc_exec_prefix is set because, in that case, we know where the
     compiler has been installed, and use paths relative to that
     location instead.  */
@@ -249,7 +249,7 @@ index c87f603955f..535d5c3bb65 100644
  
  /* For native compilers, these are well-known paths containing
     components that may be provided by the system.  For cross
-@@ -1510,9 +1513,9 @@ static const char *const standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;
+@@ -1513,9 +1516,9 @@ static const char *const standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;
  static const char *md_exec_prefix = MD_EXEC_PREFIX;
  static const char *md_startfile_prefix = MD_STARTFILE_PREFIX;
  static const char *md_startfile_prefix_1 = MD_STARTFILE_PREFIX_1;
@@ -261,7 +261,7 @@ index c87f603955f..535d5c3bb65 100644
    = STANDARD_STARTFILE_PREFIX_2;
  
  /* A relative path to be used in finding the location of tools
-@@ -5952,6 +5955,11 @@ do_spec_1 (const char *spec, int inswitch, const char *soft_matched_part)
+@@ -5955,6 +5958,11 @@ do_spec_1 (const char *spec, int inswitch, const char *soft_matched_part)
  	      }
  	    break;
  
@@ -344,6 +344,3 @@ index 1a403e535bd..c26d07bde12 100644
  
        /* We used to strip trailing DIR_SEPARATORs here, but that can
  	 sometimes yield a result with no separator when one was coded
--- 
-2.29.2
-
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch
similarity index 92%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch
index abf1f84..e8b52da 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch
@@ -1,4 +1,4 @@
-From 9c0c73ee48dbee2aad57f4dcdad1b7b74e77b944 Mon Sep 17 00:00:00 2001
+From 5fdf6a0e959c26512c795bf904b35348f749406c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Dec 2015 23:41:45 +0000
 Subject: [PATCH] Search target sysroot gcc version specific dirs with
@@ -51,10 +51,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 28 insertions(+), 1 deletion(-)
 
 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 535d5c3bb65..04647ae812d 100644
+index 912c2febf94..24a92bf27f9 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
-@@ -2616,7 +2616,7 @@ for_each_path (const struct path_prefix *paths,
+@@ -2619,7 +2619,7 @@ for_each_path (const struct path_prefix *paths,
        if (path == NULL)
  	{
  	  len = paths->max_len + extra_space + 1;
@@ -63,7 +63,7 @@ index 535d5c3bb65..04647ae812d 100644
  	  path = XNEWVEC (char, len);
  	}
  
-@@ -2628,6 +2628,33 @@ for_each_path (const struct path_prefix *paths,
+@@ -2631,6 +2631,33 @@ for_each_path (const struct path_prefix *paths,
  	  /* Look first in MACHINE/VERSION subdirectory.  */
  	  if (!skip_multi_dir)
  	    {
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0026-Fix-various-_FOR_BUILD-and-related-variables.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0026-Fix-various-_FOR_BUILD-and-related-variables.patch
similarity index 95%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0026-Fix-various-_FOR_BUILD-and-related-variables.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0026-Fix-various-_FOR_BUILD-and-related-variables.patch
index 97bf2f3..0356baa 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0026-Fix-various-_FOR_BUILD-and-related-variables.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0026-Fix-various-_FOR_BUILD-and-related-variables.patch
@@ -1,4 +1,4 @@
-From 3a003af8804dda90fdf4862eca5f66cb12faaf02 Mon Sep 17 00:00:00 2001
+From b647a62ddbbb7fbc58aa865cd2d34539677eb107 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Dec 2015 23:42:45 +0000
 Subject: [PATCH] Fix various _FOR_BUILD and related variables
@@ -94,7 +94,7 @@ index efed1511750..778beb705b4 100644
  	CFLAGS="$(CFLAGS)"; export CFLAGS; \
  	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 011c7ac2db6..2f1165f7b5e 100644
+index 087bf3f1137..272d521a276 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
 @@ -805,7 +805,7 @@ BUILD_LDFLAGS=@BUILD_LDFLAGS@
@@ -107,10 +107,10 @@ index 011c7ac2db6..2f1165f7b5e 100644
  # Actual name to use when installing a native compiler.
  GCC_INSTALL_NAME := $(shell echo gcc|sed '$(program_transform_name)')
 diff --git a/gcc/configure b/gcc/configure
-index 825a9652329..ff46cf58960 100755
+index fde89ad8e89..e042e992419 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -12314,7 +12314,7 @@ else
+@@ -12319,7 +12319,7 @@ else
  	CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
  	CXX="${CXX_FOR_BUILD}" CXXFLAGS="${CXXFLAGS_FOR_BUILD}" \
  	LD="${LD_FOR_BUILD}" LDFLAGS="${LDFLAGS_FOR_BUILD}" \
@@ -120,10 +120,10 @@ index 825a9652329..ff46cf58960 100755
  		--enable-languages=${enable_languages-all} \
  		${enable_obsolete+--enable-obsolete="$enable_obsolete"} \
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 6099eb3251f..b3c345b61dc 100644
+index cad69549a01..8e35c9be7f9 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -1898,7 +1898,7 @@ else
+@@ -1903,7 +1903,7 @@ else
  	CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
  	CXX="${CXX_FOR_BUILD}" CXXFLAGS="${CXXFLAGS_FOR_BUILD}" \
  	LD="${LD_FOR_BUILD}" LDFLAGS="${LDFLAGS_FOR_BUILD}" \
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch
similarity index 92%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch
index 3cd75b7..47de3c3 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch
@@ -1,4 +1,4 @@
-From 4e53d0ae70af85af0e112a48a3e4dfe4c39f4a8d Mon Sep 17 00:00:00 2001
+From f7a6ddd3fb612393595f6e959e99d48c26f4d14f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 2 Feb 2016 10:26:10 -0800
 Subject: [PATCH] nios2: Define MUSL_DYNAMIC_LINKER
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
similarity index 96%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
index 2a6769a..cd409a8 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
@@ -1,4 +1,4 @@
-From 5db0404eb770ac477fd99d444226bcf021067584 Mon Sep 17 00:00:00 2001
+From 0bb86e4d2ab0bb44bab37a005f971cf94046ff0d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 27 Jun 2017 18:10:54 -0700
 Subject: [PATCH] Add ssp_nonshared to link commandline for musl targets
@@ -62,7 +62,7 @@ index b7026fcbee7..dd54d6c393e 100644
  #define LINK_OS_LINUX_SPEC LINK_OS_LINUX_EMUL " %{!shared: %{!static: \
    %{!static-pie: \
 diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
-index 967c1c43c63..dc5e4d97975 100644
+index 80969a8fd89..97a78ae945c 100644
 --- a/gcc/config/rs6000/linux64.h
 +++ b/gcc/config/rs6000/linux64.h
 @@ -452,6 +452,16 @@ extern int dot_symbols;
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
similarity index 93%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
index 767cba0..9342329 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
@@ -1,4 +1,4 @@
-From fbc926dbf6a47fa623b9c94cd9b09a0e90448fdc Mon Sep 17 00:00:00 2001
+From 61b000792f32d4ca9b4b4498ebb7fd5d1deed710 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 4 May 2016 21:11:34 -0700
 Subject: [PATCH] Link libgcc using LDFLAGS, not just SHLIB_LDFLAGS
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0030-sync-gcc-stddef.h-with-musl.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0030-sync-gcc-stddef.h-with-musl.patch
similarity index 97%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0030-sync-gcc-stddef.h-with-musl.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0030-sync-gcc-stddef.h-with-musl.patch
index 4f18907..ffbf6b9 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0030-sync-gcc-stddef.h-with-musl.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0030-sync-gcc-stddef.h-with-musl.patch
@@ -1,4 +1,4 @@
-From 24dc04dc8d69e3bf61322615b3ef18e02ccd311e Mon Sep 17 00:00:00 2001
+From 92f588c68008176e7f6f1b3d534670bddedae783 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Feb 2017 12:56:00 -0800
 Subject: [PATCH] sync gcc stddef.h with musl
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0031-fix-segmentation-fault-in-precompiled-header-generat.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0031-fix-segmentation-fault-in-precompiled-header-generat.patch
similarity index 94%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0031-fix-segmentation-fault-in-precompiled-header-generat.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0031-fix-segmentation-fault-in-precompiled-header-generat.patch
index 702279a..0b93a05 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0031-fix-segmentation-fault-in-precompiled-header-generat.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0031-fix-segmentation-fault-in-precompiled-header-generat.patch
@@ -1,4 +1,4 @@
-From 27b8ba5555ada2dab076988529bfb84d00a4b901 Mon Sep 17 00:00:00 2001
+From d3b25e66c7f9c86b5da0fd3e9e6236e0b59dc934 Mon Sep 17 00:00:00 2001
 From: Juro Bystricky <juro.bystricky@intel.com>
 Date: Mon, 19 Mar 2018 22:31:20 -0700
 Subject: [PATCH] fix segmentation fault in precompiled header generation
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 21 insertions(+), 5 deletions(-)
 
 diff --git a/libcpp/lex.c b/libcpp/lex.c
-index 56ac3a1dd73..73a951148b3 100644
+index 665297af776..0ac5d67ddf0 100644
 --- a/libcpp/lex.c
 +++ b/libcpp/lex.c
 @@ -3311,11 +3311,27 @@ cpp_spell_token (cpp_reader *pfile, const cpp_token *token,
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0032-Fix-for-testsuite-failure.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0032-Fix-for-testsuite-failure.patch
similarity index 99%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0032-Fix-for-testsuite-failure.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0032-Fix-for-testsuite-failure.patch
index 0a0767b..515c1d8 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0032-Fix-for-testsuite-failure.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0032-Fix-for-testsuite-failure.patch
@@ -1,4 +1,4 @@
-From 2512aacf023c679d86d8f40caff4f6ff412b32ff Mon Sep 17 00:00:00 2001
+From a3beed38a5eaa122c375451adafd78289512ac5f Mon Sep 17 00:00:00 2001
 From: RAGHUNATH LOLUR <raghunath.lolur@kpit.com>
 Date: Wed, 6 Dec 2017 22:52:26 -0800
 Subject: [PATCH] Fix for testsuite failure
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0033-Re-introduce-spe-commandline-options.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0033-Re-introduce-spe-commandline-options.patch
similarity index 87%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0033-Re-introduce-spe-commandline-options.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0033-Re-introduce-spe-commandline-options.patch
index ba7c2b8..8a8eda8 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0033-Re-introduce-spe-commandline-options.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0033-Re-introduce-spe-commandline-options.patch
@@ -1,4 +1,4 @@
-From 3fc06241ce37e2e4b3ed21ace28d347eb511448d Mon Sep 17 00:00:00 2001
+From c1675b1dbc8b662eadaaa8ebf5bbfc783b7ecc75 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 6 Jun 2018 12:10:22 -0700
 Subject: [PATCH] Re-introduce spe commandline options
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 12 insertions(+)
 
 diff --git a/gcc/config/rs6000/rs6000.opt b/gcc/config/rs6000/rs6000.opt
-index f95b8279270..0e52d51409d 100644
+index 4e3792bcefa..edfa4f7de48 100644
 --- a/gcc/config/rs6000/rs6000.opt
 +++ b/gcc/config/rs6000/rs6000.opt
 @@ -344,6 +344,18 @@ mdebug=
@@ -33,6 +33,6 @@ index f95b8279270..0e52d51409d 100644
 +Target RejectNegative Var(rs6000_spe_abi, 0)
 +Do not use the SPE ABI extensions.
 +
+ ; Altivec ABI
  mabi=altivec
  Target RejectNegative Var(rs6000_altivec_abi) Save
- Use the AltiVec ABI extensions.
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
similarity index 91%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
index 4ce9dc6..7dd3344 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
@@ -1,4 +1,4 @@
-From b42ff59c3fe2967d37815c8db72a47b9b7f585b4 Mon Sep 17 00:00:00 2001
+From 0c8d6cd3a5de6cdb832fdba4ec39d029432e76e6 Mon Sep 17 00:00:00 2001
 From: Szabolcs Nagy <nsz@port70.net>
 Date: Sat, 24 Oct 2015 20:09:53 +0000
 Subject: [PATCH] libgcc_s: Use alias for __cpu_indicator_init instead of
@@ -39,10 +39,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/gcc/config/i386/i386-expand.c b/gcc/config/i386/i386-expand.c
-index 48f00c5fcfc..468f5f71fac 100644
+index 47d52550e5e..9cb8cc7950e 100644
 --- a/gcc/config/i386/i386-expand.c
 +++ b/gcc/config/i386/i386-expand.c
-@@ -10941,10 +10941,10 @@ ix86_expand_builtin (tree exp, rtx target, rtx subtarget,
+@@ -10976,10 +10976,10 @@ ix86_expand_builtin (tree exp, rtx target, rtx subtarget,
      {
      case IX86_BUILTIN_CPU_INIT:
        {
@@ -56,10 +56,10 @@ index 48f00c5fcfc..468f5f71fac 100644
  	return expand_expr (call_expr, target, mode, EXPAND_NORMAL);
        }
 diff --git a/libgcc/config/i386/cpuinfo.c b/libgcc/config/i386/cpuinfo.c
-index 00322c58622..f42bbb8af98 100644
+index 83301a1445f..89fdc7eb587 100644
 --- a/libgcc/config/i386/cpuinfo.c
 +++ b/libgcc/config/i386/cpuinfo.c
-@@ -508,7 +508,7 @@ __cpu_indicator_init (void)
+@@ -516,7 +516,7 @@ __cpu_indicator_init (void)
    return 0;
  }
  
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
similarity index 98%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
index dd1bf6d..b746f17 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
@@ -1,4 +1,4 @@
-From 0395060a7dcf98c5f5a65103f6aaa71d6b862259 Mon Sep 17 00:00:00 2001
+From febc910933faf6868805546e0df4a8452a82c225 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 10 Mar 2020 08:26:53 -0700
 Subject: [PATCH] gentypes/genmodes: Do not use __LINE__ for maintaining
@@ -48,7 +48,7 @@ index 981577481af..d5700fff401 100644
        POS_HERE (do_scalar_typedef ("CUMULATIVE_ARGS", &pos));
        POS_HERE (do_scalar_typedef ("REAL_VALUE_TYPE", &pos));
 diff --git a/gcc/genmodes.c b/gcc/genmodes.c
-index bd78310ea24..dbd02c51a4c 100644
+index 21e5f536976..a22f65a232f 100644
 --- a/gcc/genmodes.c
 +++ b/gcc/genmodes.c
 @@ -430,7 +430,7 @@ complete_all_modes (void)
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0036-mingw32-Enable-operation_not_supported.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0036-mingw32-Enable-operation_not_supported.patch
similarity index 83%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0036-mingw32-Enable-operation_not_supported.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0036-mingw32-Enable-operation_not_supported.patch
index de82a3a..f2d6e30 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0036-mingw32-Enable-operation_not_supported.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0036-mingw32-Enable-operation_not_supported.patch
@@ -1,4 +1,4 @@
-From 6f87a095f0e696bec07a50df789c9db8bdbca43d Mon Sep 17 00:00:00 2001
+From 6d9d080ce16de2fda138a8aac579e531bd64221d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 12 May 2020 10:39:09 -0700
 Subject: [PATCH] mingw32: Enable operation_not_supported
@@ -12,15 +12,15 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libstdc++-v3/config/os/mingw32/error_constants.h b/libstdc++-v3/config/os/mingw32/error_constants.h
-index 68ac72a78fb..71cd5815b81 100644
+index 2222c5227c4..35290eabfa7 100644
 --- a/libstdc++-v3/config/os/mingw32/error_constants.h
 +++ b/libstdc++-v3/config/os/mingw32/error_constants.h
 @@ -107,7 +107,7 @@ _GLIBCXX_BEGIN_NAMESPACE_VERSION
- #ifdef _GLIBCXX_HAVE_EPERM
+ #ifdef EPERM
        operation_not_permitted = 		EPERM,
  #endif
 -//    operation_not_supported = 		EOPNOTSUPP,
 +      operation_not_supported = 		EOPNOTSUPP,
- #ifdef _GLIBCXX_HAVE_EWOULDBLOCK
+ #ifdef EWOULDBLOCK
        operation_would_block = 			EWOULDBLOCK,
  #endif
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0037-libatomic-Do-not-enforce-march-on-aarch64.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0037-libatomic-Do-not-enforce-march-on-aarch64.patch
similarity index 96%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0037-libatomic-Do-not-enforce-march-on-aarch64.patch
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0037-libatomic-Do-not-enforce-march-on-aarch64.patch
index 3946ace..a55fbff 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.2/0037-libatomic-Do-not-enforce-march-on-aarch64.patch
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0037-libatomic-Do-not-enforce-march-on-aarch64.patch
@@ -1,4 +1,4 @@
-From 38d262bfe7c0c894c364dc6e4dc7971e78a73974 Mon Sep 17 00:00:00 2001
+From f572efe2cee2d580007beb4540925965365ceeb9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 13 May 2020 15:10:38 -0700
 Subject: [PATCH] libatomic: Do not enforce march on aarch64
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0038-libatomic-libgomp-libitc-Fix-bootstrap-PR70454.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0038-libatomic-libgomp-libitc-Fix-bootstrap-PR70454.patch
new file mode 100644
index 0000000..65c3e39
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0038-libatomic-libgomp-libitc-Fix-bootstrap-PR70454.patch
@@ -0,0 +1,209 @@
+From eb5a17c7b8ed676d83ce4dd0e9623e2ee0191f91 Mon Sep 17 00:00:00 2001
+From: Jakub Jelinek <jakub@redhat.com>
+Date: Fri, 15 Jan 2021 13:12:59 +0100
+Subject: [PATCH] libatomic, libgomp, libitc: Fix bootstrap [PR70454]
+
+The recent changes to error on mixing -march=i386 and -fcf-protection broke
+bootstrap.  This patch changes lib{atomic,gomp,itm} configury, so that it
+only adds -march=i486 to flags if really needed (i.e. when 486 or later isn't
+on by default already).  Similarly, it will not use ifuncs if -mcx16
+(or -march=i686 for 32-bit) is on by default.
+
+2021-01-15  Jakub Jelinek  <jakub@redhat.com>
+
+	PR target/70454
+libatomic/
+	* configure.tgt: For i?86 and x86_64 determine if -march=i486 needs to
+	be added through preprocessor check on
+	__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4.  Determine if try_ifunc is needed
+	based on preprocessor check on __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16
+	or __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8.
+libgomp/
+	* configure.tgt: For i?86 and x86_64 determine if -march=i486 needs to
+	be added through preprocessor check on
+	__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4.
+libitm/
+	* configure.tgt: For i?86 and x86_64 determine if -march=i486 needs to
+	be added through preprocessor check on
+	__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4.
+
+Upstream-Status: Backport [master post 10.x release]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libatomic/configure.tgt | 56 +++++++++++++++++++++++------------------
+ libgomp/configure.tgt   | 35 +++++++++++---------------
+ libitm/configure.tgt    | 37 +++++++++++++--------------
+ 3 files changed, 64 insertions(+), 64 deletions(-)
+
+diff --git a/libatomic/configure.tgt b/libatomic/configure.tgt
+index 5dd0926d207..6ea082a29bc 100644
+--- a/libatomic/configure.tgt
++++ b/libatomic/configure.tgt
+@@ -81,32 +81,40 @@ case "${target_cpu}" in
+ 	ARCH=sparc
+ 	;;
+ 
+-  i[3456]86)
+-	case " ${CC} ${CFLAGS} " in
+-	  *" -m64 "*|*" -mx32 "*)
+-	    ;;
+-	  *)
+-	    if test -z "$with_arch"; then
+-	      XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
+-	      XCFLAGS="${XCFLAGS} -fomit-frame-pointer"
+-	    fi
+-	esac
+-	ARCH=x86
+-	# ??? Detect when -march=i686 is already enabled.
+-	try_ifunc=yes
+-	;;
+-  x86_64)
+-	case " ${CC} ${CFLAGS} " in
+-	  *" -m32 "*)
++  i[3456]86 | x86_64)
++	cat > conftestx.c <<EOF
++#ifndef __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4
++#error need -march=i486
++#endif
++EOF
++	if ${CC} ${CFLAGS} -E conftestx.c > /dev/null 2>&1; then
++	  :
++	else
++	  if test "${target_cpu}" = x86_64; then
+ 	    XCFLAGS="${XCFLAGS} -march=i486 -mtune=generic"
+-	    XCFLAGS="${XCFLAGS} -fomit-frame-pointer"
+-	    ;;
+-	  *)
+-	    ;;
+-	esac
++	  else
++	    XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
++	  fi
++	  XCFLAGS="${XCFLAGS} -fomit-frame-pointer"
++	fi
++	cat > conftestx.c <<EOF
++#ifdef __x86_64__
++#ifndef __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16
++#error need -mcx16
++#endif
++#else
++#ifndef __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8
++#error need -march=i686
++#endif
++#endif
++EOF
++	if ${CC} ${CFLAGS} -E conftestx.c > /dev/null 2>&1; then
++	  try_ifunc=no
++	else
++	  try_ifunc=yes
++	fi
++	rm -f conftestx.c
+ 	ARCH=x86
+-	# ??? Detect when -mcx16 is already enabled.
+-	try_ifunc=yes
+ 	;;
+ 
+   *)			ARCH="${target_cpu}" ;;
+diff --git a/libgomp/configure.tgt b/libgomp/configure.tgt
+index 4790a31e394..761ef2a7db2 100644
+--- a/libgomp/configure.tgt
++++ b/libgomp/configure.tgt
+@@ -70,28 +70,23 @@ if test x$enable_linux_futex = xyes; then
+ 	;;
+ 
+     # Note that bare i386 is not included here.  We need cmpxchg.
+-    i[456]86-*-linux*)
++    i[456]86-*-linux* | x86_64-*-linux*)
+ 	config_path="linux/x86 linux posix"
+-	case " ${CC} ${CFLAGS} " in
+-	  *" -m64 "*|*" -mx32 "*)
+-	    ;;
+-	  *)
+-	    if test -z "$with_arch"; then
+-	      XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
+-	    fi
+-	esac
+-	;;
+-
+-    # Similar jiggery-pokery for x86_64 multilibs, except here we
+-    # can't rely on the --with-arch configure option, since that
+-    # applies to the 64-bit side.
+-    x86_64-*-linux*)
+-	config_path="linux/x86 linux posix"
+-	case " ${CC} ${CFLAGS} " in
+-	  *" -m32 "*)
++	cat > conftestx.c <<EOF
++#ifndef __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4
++#error need -march=i486
++#endif
++EOF
++	if ${CC} ${CFLAGS} -E conftestx.c > /dev/null 2>&1; then
++	  :
++	else
++	  if test "${target_cpu}" = x86_64; then
+ 	    XCFLAGS="${XCFLAGS} -march=i486 -mtune=generic"
+-	    ;;
+-	esac
++	  else
++	    XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
++	  fi
++	fi
++	rm -f conftestx.c
+ 	;;
+ 
+     # Note that sparcv7 and sparcv8 is not included here.  We need cas.
+diff --git a/libitm/configure.tgt b/libitm/configure.tgt
+index d1beb5c9ec8..608462e184e 100644
+--- a/libitm/configure.tgt
++++ b/libitm/configure.tgt
+@@ -59,16 +59,23 @@ case "${target_cpu}" in
+ 
+   arm*)		ARCH=arm ;;
+ 
+-  i[3456]86)
+-	case " ${CC} ${CFLAGS} " in
+-	  *" -m64 "*|*" -mx32 "*)
+-	    ;;
+-	  *)
+-	    if test -z "$with_arch"; then
+-	      XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
+-	      XCFLAGS="${XCFLAGS} -fomit-frame-pointer"
+-	    fi
+-	esac
++  i[3456]86 | x86_64)
++	cat > conftestx.c <<EOF
++#ifndef __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4
++#error need -march=i486
++#endif
++EOF
++	if ${CC} ${CFLAGS} -E conftestx.c > /dev/null 2>&1; then
++	  :
++	else
++	  if test "${target_cpu}" = x86_64; then
++	    XCFLAGS="${XCFLAGS} -march=i486 -mtune=generic"
++	  else
++	    XCFLAGS="${XCFLAGS} -march=i486 -mtune=${target_cpu}"
++	  fi
++	  XCFLAGS="${XCFLAGS} -fomit-frame-pointer"
++	fi
++	rm -f conftestx.c
+ 	XCFLAGS="${XCFLAGS} -mrtm"
+ 	ARCH=x86
+ 	;;
+@@ -103,16 +110,6 @@ case "${target_cpu}" in
+ 	ARCH=sparc
+ 	;;
+ 
+-  x86_64)
+-	case " ${CC} ${CFLAGS} " in
+-	  *" -m32 "*)
+-	    XCFLAGS="${XCFLAGS} -march=i486 -mtune=generic"
+-	    XCFLAGS="${XCFLAGS} -fomit-frame-pointer"
+-	    ;;
+-	esac
+-	XCFLAGS="${XCFLAGS} -mrtm"
+-	ARCH=x86
+-	;;
+   s390|s390x)
+ 	XCFLAGS="${XCFLAGS} -mzarch -mhtm"
+ 	ARCH=s390
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross-canadian_arm-10.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross-canadian_arm-10.3.bb
similarity index 100%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-cross-canadian_arm-10.2.bb
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-cross-canadian_arm-10.3.bb
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_arm-10.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_arm-10.3.bb
similarity index 100%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_arm-10.2.bb
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_arm-10.3.bb
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-crosssdk_arm-10.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-crosssdk_arm-10.3.bb
similarity index 100%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-crosssdk_arm-10.2.bb
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-crosssdk_arm-10.3.bb
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-runtime_arm-10.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-runtime_arm-10.3.bb
similarity index 100%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-runtime_arm-10.2.bb
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-runtime_arm-10.3.bb
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-sanitizers_arm-10.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-sanitizers_arm-10.3.bb
similarity index 100%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-sanitizers_arm-10.2.bb
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-sanitizers_arm-10.3.bb
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-source_arm-10.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-source_arm-10.3.bb
similarity index 100%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-source_arm-10.2.bb
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-source_arm-10.3.bb
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-10.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-10.3.bb
similarity index 100%
rename from meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-10.2.bb
rename to meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-10.3.bb
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/libgcc-initial_arm-10.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/libgcc-initial_arm-10.3.bb
similarity index 100%
rename from meta-arm-toolchain/recipes-devtools/gcc/libgcc-initial_arm-10.2.bb
rename to meta-arm-toolchain/recipes-devtools/gcc/libgcc-initial_arm-10.3.bb
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/libgcc_arm-10.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/libgcc_arm-10.3.bb
similarity index 100%
rename from meta-arm-toolchain/recipes-devtools/gcc/libgcc_arm-10.2.bb
rename to meta-arm-toolchain/recipes-devtools/gcc/libgcc_arm-10.3.bb
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/libgfortran_arm-10.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/libgfortran_arm-10.3.bb
similarity index 100%
rename from meta-arm-toolchain/recipes-devtools/gcc/libgfortran_arm-10.2.bb
rename to meta-arm-toolchain/recipes-devtools/gcc/libgfortran_arm-10.3.bb
-- 
2.25.1

