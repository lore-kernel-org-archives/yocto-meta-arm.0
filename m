Received: from mail-il1-f195.google.com (mail-il1-f195.google.com [209.85.166.195])
 by mx.groups.io with SMTP id smtpd.web09.3438.1580245592480450734
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 28 Jan 2020 13:06:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=ygPH2h59;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.195, mailfrom: jdmason@kudzu.us)
Received: by mail-il1-f195.google.com with SMTP id b15so12002640iln.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 28 Jan 2020 13:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=h88hnz3uWOICrnOveTcyV21ZSR5OjMP4cxHXPhjUucA=;
        b=ygPH2h59FGHBom4Czqc2lpb7WqFsG+GE08EMc3eGoBv4t7GF1XQOxh+wN1GcdpTv6v
         HN9MZvu9ce7rgFnOBLseJG9qBb67XVOQx8uD4glXHK5PQb7q1hLNgFtQTFqDivxGwG1p
         q3VZx4dFSa3ytlv7QEN9EtFMbHJn1FqAob/aCjhRORpQBCGIsE6RFjhDIiThylM6QN1c
         1H2mQjkb9ZFjz8q7PltRkGI183brHuHw3ZHR2ou4mWy+Cn74Z+A/jpaVAihi0+BABdir
         56qOW3xQU3HdI0WzUqo7DHvbXNgOTBkZkS7Kt0DZdfwaAeVeIXx4zoOYdZEpSLVqoc5K
         Z11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=h88hnz3uWOICrnOveTcyV21ZSR5OjMP4cxHXPhjUucA=;
        b=sC7EUYxyoI4fyw6XKU1uhrPMlpSd9avGXzxSe5NkDub25reHhGqG1K0Bqz9etAwRDf
         ZnHmewXSw/wtfFkVkDrHB40MKOup4DFn0zM/Z7T0qvM7w52I7D0ef9p9HY2xTbhdIAmI
         nK4aHMBy1AYGBTqPNR2dvCDOJTTe6Rtc0KJyW7HagMETHjeiWRdRTmD6dd861+LDTj39
         3Och2+1RRhvtNAJIFbMPATjooNAdHGJhPotCkOPQ36K+cMvr3eDiXc6YofAg/U5HsyDx
         pHlKK1hIliNQB24jFmQJodotGRUdW3y2kXdUyhCsJKaZh3Kfz2ggQ7WEIwk3vv05ZK7h
         o0lQ==
X-Gm-Message-State: APjAAAWLhLBerrA+JXHGSRx1EL7GdxBE84lD/mKFlGVxi5LHvaFVytLC
	tdlgrMSRL9j7jC+IMboPe0Er/SXxsvW3b9siL7+tAcjznYKk9Q==
X-Google-Smtp-Source: APXvYqxLIx4XngfsjQ1SClxLqKClbCswL9I1NkV09W/mLRpKujGaElLhO7rbqQXQ/3rBRMqwCU43IIsdghkiDTVl64Y=
X-Received: by 2002:a92:77ca:: with SMTP id s193mr11592913ilc.42.1580245589553;
 Tue, 28 Jan 2020 13:06:29 -0800 (PST)
MIME-Version: 1.0
References: <1580124007-23324-1-git-send-email-sumit.garg@linaro.org> <20200128045355.GK4735@denix.org>
In-Reply-To: <20200128045355.GK4735@denix.org>
From: "Jon Mason" <jdmason@kudzu.us>
Date: Tue, 28 Jan 2020 16:06:17 -0500
Message-ID: <CAPoiz9zvPps4ZfkgOwFKEKcKUCdbAov5x9F4+GNfgQ1v5r5YhA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] Import ARM GNU-A toolset recipes from meta-linaro
To: meta-arm@lists.yoctoproject.org
Cc: Sumit Garg <sumit.garg@linaro.org>, jon.mason@arm.com, 
	Daniel Thompson <daniel.thompson@linaro.org>, Nicolas Dechesne <nicolas.dechesne@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2020 at 11:54 PM Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Mon, Jan 27, 2020 at 04:50:07PM +0530, Sumit Garg wrote:
> > Add a new meta-arm-toolchain layer to hold ARM GNU-A toolset recipes
> > imported from meta-linaro tree, branch: master and commit ID:
> > 504ca3b217c9602b10eda0ec8a9f1055b59e482f.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
>
> It's an exact copy of what's currently in meta-linaro-toolchain, but I s=
till
> decided to test it - I applied this patch to meta-arm and reconfigured m=
y
> setup by replacing meta-linaro-toolchain with the new meta-arm-toolchain=
 and
> ran few builds that use external-arm-toolchain and gcc-arm recipes:
>
> Tested-by: Denys Dmytriyenko <denys@ti.com>

Thank you for the patch, Sumit, and for testing, Denys.  It is now
included in meta-arm, see
https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/commit/?id=3Dc0a59f3d9=
4c633d6c902e7bd436690bc890bbc40

Thanks,
Jon

>
>
> > ---
> >  README.md                                          |   3 +
> >  .../include/external-arm-toolchain-versions.inc    | 133 ++++
> >  .../conf/distro/include/tcmode-external-arm.inc    | 116 ++++
> >  meta-arm-toolchain/conf/layer.conf                 |  15 +
> >  .../external-arm-toolchain.bb                      | 666 ++++++++++++=
+++++++++
> >  .../external-arm-toolchain/files/SUPPORTED         |   1 +
> >  .../recipes-devtools/gcc/gcc-arm-8.2.inc           | 114 ++++
> >  .../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch     |  42 ++
> >  .../0003-gcc-poison-system-directories.patch       | 194 ++++++
> >  .../0005-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |  73 +++
> >  .../gcc-arm-8.2/0006-64-bit-multilib-hack.patch    |  85 +++
> >  .../gcc/gcc-arm-8.2/0007-optional-libstdc.patch    | 125 ++++
> >  ...0008-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |  59 ++
> >  .../gcc/gcc-arm-8.2/0009-COLLECT_GCC_OPTIONS.patch |  38 ++
> >  ...efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch |  96 +++
> >  .../0011-fortran-cross-compile-hack.patch          |  46 ++
> >  .../gcc/gcc-arm-8.2/0012-cpp-honor-sysroot.patch   |  54 ++
> >  .../0013-MIPS64-Default-to-N64-ABI.patch           |  57 ++
> >  ...C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 248 ++++++++
> >  ...0015-gcc-Fix-argument-list-too-long-error.patch |  40 ++
> >  .../gcc/gcc-arm-8.2/0016-Disable-sdt.patch         | 113 ++++
> >  .../gcc/gcc-arm-8.2/0017-libtool.patch             |  42 ++
> >  ...4-pass-fix-v4bx-to-linker-to-support-EABI.patch |  43 ++
> >  ...tilib-config-files-from-B-instead-of-usin.patch | 102 ++++
> >  ...-libdir-from-.la-which-usually-points-to-.patch |  31 +
> >  .../gcc/gcc-arm-8.2/0021-export-CPP.patch          |  53 ++
> >  ...-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch |  42 ++
> >  ...Ensure-target-gcc-headers-can-be-included.patch |  62 ++
> >  ...-t-build-with-disable-dependency-tracking.patch |  54 ++
> >  ...h-host-directory-during-relink-if-inst_pr.patch |  38 ++
> >  ...IBS_DIR-replacement-instead-of-hardcoding.patch |  29 +
> >  .../0027-aarch64-Add-support-for-musl-ldso.patch   |  28 +
> >  ...ibcc1-fix-libcc1-s-install-path-and-rpath.patch |  54 ++
> >  ...-handle-sysroot-support-for-nativesdk-gcc.patch | 213 +++++++
> >  ...et-sysroot-gcc-version-specific-dirs-with.patch | 102 ++++
> >  ...-various-_FOR_BUILD-and-related-variables.patch | 137 +++++
> >  .../0032-nios2-Define-MUSL_DYNAMIC_LINKER.patch    |  28 +
> >  ...shared-to-link-commandline-for-musl-targe.patch |  87 +++
> >  ...34-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch | 465 ++++++++++++=
++
> >  ...bgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |  29 +
> >  ...e-alias-for-__cpu_indicator_init-instead-.patch |  86 +++
> >  .../0037-sync-gcc-stddef.h-with-musl.patch         |  91 +++
> >  ...ation-fault-in-precompiled-header-generat.patch |  60 ++
> >  .../0039-Fix-for-testsuite-failure.patch           | 258 ++++++++
> >  ...0040-Re-introduce-spe-commandline-options.patch |  41 ++
> >  .../gcc/gcc-arm-8.2/0041-ARC-fix-spec-gen.patch    |  44 ++
> >  ...werpc-powerpc64-Add-support-for-musl-ldso.patch |  31 +
> >  .../0043-riscv-Disable-multilib-for-OE.patch       |  27 +
> >  .../recipes-devtools/gcc/gcc-arm-8.3.inc           | 113 ++++
> >  .../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch     |  42 ++
> >  .../0002-gcc-poison-system-directories.patch       | 203 +++++++
> >  .../0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |  73 +++
> >  .../gcc-arm-8.3/0004-64-bit-multilib-hack.patch    |  85 +++
> >  .../gcc/gcc-arm-8.3/0005-optional-libstdc.patch    | 125 ++++
> >  ...0006-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |  59 ++
> >  .../gcc/gcc-arm-8.3/0007-COLLECT_GCC_OPTIONS.patch |  38 ++
> >  ...efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch |  96 +++
> >  .../0009-fortran-cross-compile-hack.patch          |  46 ++
> >  .../gcc/gcc-arm-8.3/0010-cpp-honor-sysroot.patch   |  54 ++
> >  .../0011-MIPS64-Default-to-N64-ABI.patch           |  57 ++
> >  ...C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 248 ++++++++
> >  ...0013-gcc-Fix-argument-list-too-long-error.patch |  40 ++
> >  .../gcc/gcc-arm-8.3/0014-Disable-sdt.patch         | 113 ++++
> >  .../gcc/gcc-arm-8.3/0015-libtool.patch             |  42 ++
> >  ...4-pass-fix-v4bx-to-linker-to-support-EABI.patch |  43 ++
> >  ...tilib-config-files-from-B-instead-of-usin.patch | 102 ++++
> >  ...-libdir-from-.la-which-usually-points-to-.patch |  31 +
> >  .../gcc/gcc-arm-8.3/0019-export-CPP.patch          |  53 ++
> >  ...-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch |  42 ++
> >  ...Ensure-target-gcc-headers-can-be-included.patch |  98 +++
> >  ...-t-build-with-disable-dependency-tracking.patch |  54 ++
> >  ...h-host-directory-during-relink-if-inst_pr.patch |  38 ++
> >  ...IBS_DIR-replacement-instead-of-hardcoding.patch |  28 +
> >  .../0025-aarch64-Add-support-for-musl-ldso.patch   |  28 +
> >  ...ibcc1-fix-libcc1-s-install-path-and-rpath.patch |  54 ++
> >  ...-handle-sysroot-support-for-nativesdk-gcc.patch | 213 +++++++
> >  ...et-sysroot-gcc-version-specific-dirs-with.patch | 102 ++++
> >  ...-various-_FOR_BUILD-and-related-variables.patch | 137 +++++
> >  .../0030-nios2-Define-MUSL_DYNAMIC_LINKER.patch    |  28 +
> >  ...shared-to-link-commandline-for-musl-targe.patch |  87 +++
> >  ...32-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch | 125 ++++
> >  ...bgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |  29 +
> >  ...e-alias-for-__cpu_indicator_init-instead-.patch |  85 +++
> >  .../0035-sync-gcc-stddef.h-with-musl.patch         |  91 +++
> >  ...ation-fault-in-precompiled-header-generat.patch |  60 ++
> >  .../0037-Fix-for-testsuite-failure.patch           | 258 ++++++++
> >  ...0038-Re-introduce-spe-commandline-options.patch |  41 ++
> >  .../0039-riscv-Disable-multilib-for-OE.patch       |  27 +
> >  ...werpc-powerpc64-Add-support-for-musl-ldso.patch |  31 +
> >  .../recipes-devtools/gcc/gcc-arm-9.2.inc           | 124 ++++
> >  .../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch     |  42 ++
> >  .../0002-gcc-poison-system-directories.patch       | 203 +++++++
> >  .../0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |  73 +++
> >  .../gcc-arm-9.2/0004-64-bit-multilib-hack.patch    | 119 ++++
> >  .../gcc/gcc-arm-9.2/0005-optional-libstdc.patch    | 125 ++++
> >  .../gcc/gcc-arm-9.2/0006-COLLECT_GCC_OPTIONS.patch |  38 ++
> >  ...efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch |  96 +++
> >  .../0008-fortran-cross-compile-hack.patch          |  46 ++
> >  .../gcc/gcc-arm-9.2/0009-cpp-honor-sysroot.patch   |  54 ++
> >  .../0010-MIPS64-Default-to-N64-ABI.patch           |  57 ++
> >  ...C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 243 ++++++++
> >  ...0012-gcc-Fix-argument-list-too-long-error.patch |  40 ++
> >  .../gcc/gcc-arm-9.2/0013-Disable-sdt.patch         | 113 ++++
> >  .../gcc/gcc-arm-9.2/0014-libtool.patch             |  42 ++
> >  ...4-pass-fix-v4bx-to-linker-to-support-EABI.patch |  43 ++
> >  ...tilib-config-files-from-B-instead-of-usin.patch | 102 ++++
> >  ...-libdir-from-.la-which-usually-points-to-.patch |  31 +
> >  .../gcc/gcc-arm-9.2/0018-export-CPP.patch          |  53 ++
> >  ...Ensure-target-gcc-headers-can-be-included.patch |  55 ++
> >  ...-t-build-with-disable-dependency-tracking.patch |  54 ++
> >  ...h-host-directory-during-relink-if-inst_pr.patch |  38 ++
> >  ...IBS_DIR-replacement-instead-of-hardcoding.patch |  29 +
> >  .../0023-aarch64-Add-support-for-musl-ldso.patch   |  28 +
> >  ...ibcc1-fix-libcc1-s-install-path-and-rpath.patch |  54 ++
> >  ...-handle-sysroot-support-for-nativesdk-gcc.patch | 346 +++++++++++
> >  ...et-sysroot-gcc-version-specific-dirs-with.patch | 102 ++++
> >  ...-various-_FOR_BUILD-and-related-variables.patch | 137 +++++
> >  .../0028-nios2-Define-MUSL_DYNAMIC_LINKER.patch    |  28 +
> >  ...shared-to-link-commandline-for-musl-targe.patch |  87 +++
> >  ...30-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch |  79 +++
> >  ...bgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |  29 +
> >  ...e-alias-for-__cpu_indicator_init-instead-.patch |  86 +++
> >  .../0033-sync-gcc-stddef.h-with-musl.patch         |  91 +++
> >  ...ation-fault-in-precompiled-header-generat.patch |  60 ++
> >  .../0035-Fix-for-testsuite-failure.patch           | 258 ++++++++
> >  ...0036-Re-introduce-spe-commandline-options.patch |  41 ++
> >  ...x-up-libsanitizer-build-with-master-glibc.patch |  70 +++
> >  .../gcc/gcc-cross-canadian_arm-8.2.bb              |   5 +
> >  .../gcc/gcc-cross-canadian_arm-8.3.bb              |   5 +
> >  .../gcc/gcc-cross-canadian_arm-9.2.bb              |   5 +
> >  .../recipes-devtools/gcc/gcc-cross_arm-8.2.bb      |   3 +
> >  .../recipes-devtools/gcc/gcc-cross_arm-8.3.bb      |   3 +
> >  .../recipes-devtools/gcc/gcc-cross_arm-9.2.bb      |   3 +
> >  .../recipes-devtools/gcc/gcc-crosssdk_arm-8.2.bb   |   2 +
> >  .../recipes-devtools/gcc/gcc-crosssdk_arm-8.3.bb   |   2 +
> >  .../recipes-devtools/gcc/gcc-crosssdk_arm-9.2.bb   |   2 +
> >  .../recipes-devtools/gcc/gcc-runtime_arm-8.2.bb    |   7 +
> >  .../recipes-devtools/gcc/gcc-runtime_arm-8.3.bb    |   7 +
> >  .../recipes-devtools/gcc/gcc-runtime_arm-9.2.bb    |   2 +
> >  .../recipes-devtools/gcc/gcc-sanitizers_arm-8.2.bb |   2 +
> >  .../recipes-devtools/gcc/gcc-sanitizers_arm-8.3.bb |   2 +
> >  .../recipes-devtools/gcc/gcc-sanitizers_arm-9.2.bb |   7 +
> >  .../recipes-devtools/gcc/gcc-source_arm-8.2.bb     |   4 +
> >  .../recipes-devtools/gcc/gcc-source_arm-8.3.bb     |   4 +
> >  .../recipes-devtools/gcc/gcc-source_arm-9.2.bb     |   4 +
> >  .../recipes-devtools/gcc/gcc_arm-8.2.bb            |  14 +
> >  .../recipes-devtools/gcc/gcc_arm-8.3.bb            |  14 +
> >  .../recipes-devtools/gcc/gcc_arm-9.2.bb            |  14 +
> >  .../recipes-devtools/gcc/libgcc-initial_arm-8.2.bb |   2 +
> >  .../recipes-devtools/gcc/libgcc-initial_arm-8.3.bb |   2 +
> >  .../recipes-devtools/gcc/libgcc-initial_arm-9.2.bb |   5 +
> >  .../recipes-devtools/gcc/libgcc_arm-8.2.bb         |   2 +
> >  .../recipes-devtools/gcc/libgcc_arm-8.3.bb         |   2 +
> >  .../recipes-devtools/gcc/libgcc_arm-9.2.bb         |   5 +
> >  .../recipes-devtools/gcc/libgfortran_arm-8.2.bb    |   3 +
> >  .../recipes-devtools/gcc/libgfortran_arm-8.3.bb    |   3 +
> >  .../recipes-devtools/gcc/libgfortran_arm-9.2.bb    |   3 +
> >  157 files changed, 11368 insertions(+)
> >  create mode 100644 meta-arm-toolchain/conf/distro/include/external-ar=
m-toolchain-versions.inc
> >  create mode 100644 meta-arm-toolchain/conf/distro/include/tcmode-exte=
rnal-arm.inc
> >  create mode 100644 meta-arm-toolchain/conf/layer.conf
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-t=
oolchain/external-arm-toolchain.bb
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-t=
oolchain/files/SUPPORTED
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2.inc
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0003-gcc-poison-system-directories.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0005-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0006-64-bit-multilib-hack.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0007-optional-libstdc.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0008-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0009-COLLECT_GCC_OPTIONS.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0010-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0011-fortran-cross-compile-hack.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0012-cpp-honor-sysroot.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0013-MIPS64-Default-to-N64-ABI.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0014-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0015-gcc-Fix-argument-list-too-long-error.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0016-Disable-sdt.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0017-libtool.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0018-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0019-Use-the-multilib-config-files-from-B-instead-of-usin.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0020-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0021-export-CPP.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0022-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0023-Ensure-target-gcc-headers-can-be-included.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0024-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0025-Don-t-search-host-directory-during-relink-if-inst_pr.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0026-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0027-aarch64-Add-support-for-musl-ldso.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0028-libcc1-fix-libcc1-s-install-path-and-rpath.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0029-handle-sysroot-support-for-nativesdk-gcc.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0030-Search-target-sysroot-gcc-version-specific-dirs-with.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0031-Fix-various-_FOR_BUILD-and-related-variables.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0032-nios2-Define-MUSL_DYNAMIC_LINKER.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0033-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0034-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0035-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0036-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0037-sync-gcc-stddef.h-with-musl.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0038-fix-segmentation-fault-in-precompiled-header-generat.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0039-Fix-for-testsuite-failure.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0040-Re-introduce-spe-commandline-options.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0041-ARC-fix-spec-gen.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0042-powerpc-powerpc64-Add-support-for-musl-ldso.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0043-riscv-Disable-multilib-for-OE.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3.inc
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3/0002-gcc-poison-system-directories.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3/0004-64-bit-multilib-hack.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3/0005-optional-libstdc.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3/0006-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3/0007-COLLECT_GCC_OPTIONS.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3/0008-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3/0009-fortran-cross-compile-hack.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3/0010-cpp-honor-sysroot.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3/0011-MIPS64-Default-to-N64-ABI.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3/0012-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3/0013-gcc-Fix-argument-list-too-long-error.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3/0014-Disable-sdt.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3/0015-libtool.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3/0016-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3/0017-Use-the-multilib-config-files-from-B-instead-of-usin.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3/0018-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3/0019-export-CPP.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3/0020-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3/0021-Ensure-target-gcc-headers-can-be-included.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3/0022-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3/0023-Don-t-search-host-directory-during-relink-if-inst_pr.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3/0024-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3/0025-aarch64-Add-support-for-musl-ldso.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3/0026-libcc1-fix-libcc1-s-install-path-and-rpath.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3/0027-handle-sysroot-support-for-nativesdk-gcc.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3/0028-Search-target-sysroot-gcc-version-specific-dirs-with.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3/0029-Fix-various-_FOR_BUILD-and-related-variables.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3/0030-nios2-Define-MUSL_DYNAMIC_LINKER.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3/0031-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3/0032-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3/0033-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3/0035-sync-gcc-stddef.h-with-musl.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3/0036-fix-segmentation-fault-in-precompiled-header-generat.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3/0037-Fix-for-testsuite-failure.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3/0038-Re-introduce-spe-commandline-options.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3/0039-riscv-Disable-multilib-for-OE.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3/0040-powerpc-powerpc64-Add-support-for-musl-ldso.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.=
2.inc
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.=
2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.=
2/0002-gcc-poison-system-directories.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.=
2/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.=
2/0004-64-bit-multilib-hack.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.=
2/0005-optional-libstdc.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.=
2/0006-COLLECT_GCC_OPTIONS.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.=
2/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.=
2/0008-fortran-cross-compile-hack.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.=
2/0009-cpp-honor-sysroot.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.=
2/0010-MIPS64-Default-to-N64-ABI.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.=
2/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.=
2/0012-gcc-Fix-argument-list-too-long-error.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.=
2/0013-Disable-sdt.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.=
2/0014-libtool.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.=
2/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.=
2/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.=
2/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.=
2/0018-export-CPP.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.=
2/0019-Ensure-target-gcc-headers-can-be-included.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.=
2/0020-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.=
2/0021-Don-t-search-host-directory-during-relink-if-inst_pr.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.=
2/0022-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.=
2/0023-aarch64-Add-support-for-musl-ldso.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.=
2/0024-libcc1-fix-libcc1-s-install-path-and-rpath.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.=
2/0025-handle-sysroot-support-for-nativesdk-gcc.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.=
2/0026-Search-target-sysroot-gcc-version-specific-dirs-with.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.=
2/0027-Fix-various-_FOR_BUILD-and-related-variables.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.=
2/0028-nios2-Define-MUSL_DYNAMIC_LINKER.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.=
2/0029-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.=
2/0030-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.=
2/0031-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.=
2/0032-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.=
2/0033-sync-gcc-stddef.h-with-musl.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.=
2/0034-fix-segmentation-fault-in-precompiled-header-generat.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.=
2/0035-Fix-for-testsuite-failure.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.=
2/0036-Re-introduce-spe-commandline-options.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.=
2/0037-Fix-up-libsanitizer-build-with-master-glibc.patch
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-cross-=
canadian_arm-8.2.bb
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-cross-=
canadian_arm-8.3.bb
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-cross-=
canadian_arm-9.2.bb
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_=
arm-8.2.bb
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_=
arm-8.3.bb
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_=
arm-9.2.bb
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-crosss=
dk_arm-8.2.bb
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-crosss=
dk_arm-8.3.bb
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-crosss=
dk_arm-9.2.bb
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-runtim=
e_arm-8.2.bb
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-runtim=
e_arm-8.3.bb
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-runtim=
e_arm-9.2.bb
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-saniti=
zers_arm-8.2.bb
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-saniti=
zers_arm-8.3.bb
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-saniti=
zers_arm-9.2.bb
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-source=
_arm-8.2.bb
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-source=
_arm-8.3.bb
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-source=
_arm-9.2.bb
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-8.=
2.bb
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-8.=
3.bb
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-9.=
2.bb
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/libgcc-ini=
tial_arm-8.2.bb
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/libgcc-ini=
tial_arm-8.3.bb
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/libgcc-ini=
tial_arm-9.2.bb
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/libgcc_arm=
-8.2.bb
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/libgcc_arm=
-8.3.bb
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/libgcc_arm=
-9.2.bb
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/libgfortra=
n_arm-8.2.bb
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/libgfortra=
n_arm-8.3.bb
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/libgfortra=
n_arm-9.2.bb
> >
> > diff --git a/README.md b/README.md
> > index dee3b28..20b106a 100644
> > --- a/README.md
> > +++ b/README.md
> > @@ -13,6 +13,9 @@ meta-arm-bsp:
> >  meta-arm-iota:
> >       This layer provides support for Arm's IOTA Linux Distribution
> >
> > +meta-arm-toolchain:
> > +     This layer provides support for Arm's GNU-A toolset releases
> > +
> >  Contributing
> >  ------------
> >  Currently, we only accept patches from the meta-arm mailing list.  Fo=
r general
> > diff --git a/meta-arm-toolchain/conf/distro/include/external-arm-toolc=
hain-versions.inc b/meta-arm-toolchain/conf/distro/include/external-arm-too=
lchain-versions.inc
> > new file mode 100644
> > index 0000000..5c40af2
> > --- /dev/null
> > +++ b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-ve=
rsions.inc
> > @@ -0,0 +1,133 @@
> > +def eat_run(d, cmd, *args):
> > +    import bb.process
> > +    import subprocess
> > +
> > +    topdir =3D d.getVar('TOPDIR', True)
> > +    toolchain_path =3D d.getVar('EXTERNAL_TOOLCHAIN', True)
> > +    if not toolchain_path:
> > +        return 'UNKNOWN', 'UNKNOWN'
> > +
> > +    target_prefix =3D d.getVar('TARGET_PREFIX', True)
> > +    path =3D os.path.join(toolchain_path, 'bin', target_prefix + cmd)
> > +    args =3D [path] + list(args)
> > +
> > +    return bb.process.run(args, cwd=3Dtopdir, stderr=3Dsubprocess.PIP=
E)
> > +
> > +def eat_get_version(d):
> > +    try:
> > +        stdout, stderr =3D eat_run(d, 'gcc', '-v')
> > +    except bb.process.CmdError as exc:
> > +        bb.error('Failed to obtain external Arm toolchain version: %s=
' % exc)
> > +        return 'UNKNOWN'
> > +    else:
> > +        last_line =3D stderr.splitlines()[-1]
> > +        return last_line
> > +
> > +# Extract the YYYY.MM version
> > +def eat_get_main_version(d):
> > +    version =3D eat_get_version(d)
> > +    bb.debug(2, 'Trying for parse version info from: %s' % version)
> > +    if version !=3D 'UNKNOWN':
> > +        if version.split()[4] =3D=3D '(GNU':
> > +            # gcc version 9.2.1 20191025 (GNU Toolchain for the A-pro=
file Architecture 9.2-2019.12 (arm-9.10))
> > +            # gcc version 8.2.1 20180802 (GNU Toolchain for the A-pro=
file Architecture 8.2-2018.11 (arm-rel-8.26))
> > +            return version.split()[10].split('-')[1]
> > +        elif version.split()[3] =3D=3D '(GNU':
> > +            # gcc version 8.3.0 (GNU Toolchain for the A-profile Arch=
itecture 8.3-2019.03 (arm-rel-8.36))
> > +            return version.split()[9].split('-')[1]
> > +        else:
> > +            bb.error('Failed to parse external Arm toolchain version =
from: %s' % version)
> > +    else:
> > +        return version
> > +
> > +# Extract the x.y.z version from 'gcc version 4.9.1'
> > +def eat_get_gcc_version(d):
> > +    version =3D eat_get_version(d)
> > +    if version !=3D 'UNKNOWN':
> > +        return version.split()[2]
> > +    else:
> > +        return version
> > +
> > +def eat_get_libc_version(d):
> > +    import os,bb
> > +    syspath =3D bb.data.expand('${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SY=
S}', d)
> > +    if not syspath:
> > +        return 'UNKNOWN'
> > +
> > +    libpath =3D syspath + '/libc/' + bb.data.expand('${EAT_LIBDIR}/${=
EAT_TARGET_SYS}/', d)
> > +
> > +    if os.path.exists(libpath):
> > +        for file in os.listdir(libpath):
> > +            if file.find('libc-') =3D=3D 0:
> > +                return file[5:-3]
> > +
> > +    libpath =3D syspath + '/libc/' + bb.data.expand('${EAT_LIBDIR}/',=
 d)
> > +
> > +    if os.path.exists(libpath):
> > +        for file in os.listdir(libpath):
> > +            if file.find('libc-') =3D=3D 0:
> > +                return file[5:-3]
> > +
> > +    libpath =3D syspath + '/libc/usr/' + bb.data.expand('${EAT_LIBDIR=
}/${EAT_TARGET_SYS}/', d)
> > +
> > +    if os.path.exists(libpath):
> > +        for file in os.listdir(libpath):
> > +            if file.find('libc-') =3D=3D 0:
> > +                return file[5:-3]
> > +
> > +    libpath =3D syspath + '/libc/usr/' + bb.data.expand('${EAT_LIBDIR=
}/', d)
> > +
> > +    if os.path.exists(libpath):
> > +        for file in os.listdir(libpath):
> > +            if file.find('libc-') =3D=3D 0:
> > +                return file[5:-3]
> > +    return 'UNKNOWN'
> > +
> > +def eat_get_kernel_version(d):
> > +    import os,bb
> > +    syspath =3D bb.data.expand('${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SY=
S}', d)
> > +    if not syspath:
> > +        return 'UNKNOWN'
> > +
> > +    vf =3D syspath + '/libc/usr/include/linux/version.h'
> > +
> > +    try:
> > +        f =3D open(vf, 'r')
> > +    except (OSError, IOError):
> > +        return 'UNKNOWN'
> > +
> > +    l =3D f.readlines();
> > +    f.close();
> > +    for s in l:
> > +        if s.find('LINUX_VERSION_CODE') > 0:
> > +            ver =3D int(s.split()[2])
> > +            maj =3D ver / 65536
> > +            ver =3D ver % 65536
> > +            min =3D ver / 256
> > +            ver =3D ver % 256
> > +            return str(maj)+'.'+str(min)+'.'+str(ver)
> > +    return 'UNKNOWN'
> > +
> > +def eat_get_gdb_version(d):
> > +    try:
> > +        stdout, stderr =3D eat_run(d, 'gdb', '-v')
> > +    except bb.process.CmdError:
> > +        return 'UNKNOWN'
> > +    else:
> > +        first_line =3D stdout.splitlines()[0]
> > +        return first_line.split()[-1]
> > +
> > +python external_arm_toolchain_version_handler () {
> > +    if not isinstance(e, bb.event.ConfigParsed):
> > +        return
> > +    d =3D e.data
> > +    ld =3D d.createCopy()
> > +    ld.finalize()
> > +
> > +    d.setVar('EAT_VER_MAIN', eat_get_main_version(ld))
> > +    d.setVar('EAT_VER_GCC', eat_get_gcc_version(ld))
> > +    d.setVar('EAT_VER_LIBC', eat_get_libc_version(ld))
> > +    d.setVar('EAT_VER_KERNEL', eat_get_kernel_version(ld))
> > +    d.setVar('EAT_VER_GDB', eat_get_gdb_version(ld))
> > +}
> > +addhandler external_arm_toolchain_version_handler
> > diff --git a/meta-arm-toolchain/conf/distro/include/tcmode-external-ar=
m.inc b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> > new file mode 100644
> > index 0000000..8ddaf53
> > --- /dev/null
> > +++ b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> > @@ -0,0 +1,116 @@
> > +#
> > +# Configuration to use an external Arm binary toolchain
> > +#
> > +
> > +EXTERNAL_TOOLCHAIN ?=3D "/usr/local/arm-binary-toolchain/${TARGET_ARC=
H}"
> > +
> > +TOOLCHAIN_PATH_ADD =3D "${EXTERNAL_TOOLCHAIN}/bin:"
> > +PATH =3D. "${TOOLCHAIN_PATH_ADD}"
> > +
> > +EAT_TARGET_SYS_arm ?=3D "${@ 'arm-none-linux-gnueabihf' if os.path.ex=
ists('${EXTERNAL_TOOLCHAIN}/bin/arm-none-linux-gnueabihf-gcc') else 'arm-li=
nux-gnueabihf'}"
> > +EAT_TARGET_SYS_aarch64 ?=3D "${@ 'aarch64-none-linux-gnu' if os.path.=
exists('${EXTERNAL_TOOLCHAIN}/bin/aarch64-none-linux-gnu-gcc') else 'aarch6=
4-linux-gnu'}"
> > +EAT_TARGET_SYS =3D "${TARGET_SYS}"
> > +TARGET_PREFIX =3D "${EAT_TARGET_SYS}-"
> > +
> > +EAT_LIBDIR_arm =3D "lib"
> > +EAT_LIBDIR_aarch64 =3D "lib64"
> > +
> > +GCCMULTILIB_forcevariable =3D "--disable-multilib"
> > +IMAGE_LINGUAS_forcevariable =3D ""
> > +
> > +# Blacklist toolchain recipes as a belt-and-suspenders way to use the=
 external toolchain
> > +PNBLACKLIST[glibc] =3D "Using external toolchain"
> > +PNBLACKLIST[libgcc] =3D "Using external toolchain"
> > +PNBLACKLIST[gcc-cross] =3D "Using external toolchain"
> > +PNBLACKLIST[gcc-runtime] =3D "Using external toolchain"
> > +PNBLACKLIST[gcc-sanitizers] =3D "Using external toolchain"
> > +
> > +PREFERRED_PROVIDER_linux-libc-headers =3D "external-arm-toolchain"
> > +PREFERRED_PROVIDER_linux-libc-headers-dev =3D "external-arm-toolchain=
"
> > +PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc =3D "external-arm-tool=
chain"
> > +PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial =3D "external-=
arm-toolchain"
> > +PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ =3D "external-arm-tool=
chain"
> > +PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils =3D "external-arm=
-toolchain"
> > +PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc =3D "external=
-arm-toolchain"
> > +PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}compilerlibs =3D "external=
-arm-toolchain"
> > +PREFERRED_PROVIDER_glibc =3D "external-arm-toolchain"
> > +PREFERRED_PROVIDER_libgcc =3D "external-arm-toolchain"
> > +PREFERRED_PROVIDER_virtual/libc =3D "external-arm-toolchain"
> > +PREFERRED_PROVIDER_virtual/libc-locale =3D "external-arm-toolchain"
> > +PREFERRED_PROVIDER_virtual/libintl =3D "external-arm-toolchain"
> > +PREFERRED_PROVIDER_virtual/libiconv =3D "external-arm-toolchain"
> > +PREFERRED_PROVIDER_virtual/crypt =3D "external-arm-toolchain"
> > +PREFERRED_PROVIDER_glibc-thread-db =3D "external-arm-toolchain"
> > +PREFERRED_PROVIDER_glibc-mtrace =3D "external-arm-toolchain"
> > +PREFERRED_PROVIDER_libc-mtrace =3D "external-arm-toolchain"
> > +PREFERRED_PROVIDER_virtual/linux-libc-headers =3D "external-arm-toolc=
hain"
> > +TARGET_CPPFLAGS_prepend =3D " -isystem${EXTERNAL_TOOLCHAIN}/${EAT_TAR=
GET_SYS}/include "
> > +TARGET_LDFLAGS_prepend =3D " -L${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS=
}/lib -Wl,-rpath-link,${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/lib "
> > +
> > +TOOLCHAIN_OPTIONS =3D " --sysroot=3D${STAGING_DIR_HOST}"
> > +
> > +DISTRO_FEATURES_LIBC =3D "ipv4 ipv6 libc-backtrace libc-big-macros li=
bc-bsd libc-cxx-tests libc-catgets libc-crypt \
> > +                     libc-crypt-ufc libc-db-aliases libc-envz libc-fc=
vt libc-fmtmsg libc-fstab libc-ftraverse \
> > +                     libc-getlogin libc-idn libc-inet-anl libc-libm l=
ibc-libm-big \
> > +                     libc-locales libc-locale-code libc-charsets \
> > +                     libc-memusage libc-nis libc-nsswitch libc-rcmd l=
ibc-rtld-debug libc-spawn libc-streams libc-sunrpc \
> > +                     libc-utmp libc-utmpx libc-wordexp libc-posix-cla=
ng-wchar libc-posix-regexp libc-posix-regexp-glibc \
> > +                     libc-posix-wchar-io"
> > +
> > +ENABLE_BINARY_LOCALE_GENERATION =3D "0"
> > +GLIBC_INTERNAL_USE_BINARY_LOCALE =3D "precompiled"
> > +LIBCOVERRIDE =3D ":libc-glibc"
> > +
> > +ERROR_QA[type] ?=3D "list"
> > +python toolchain_metadata_setup () {
> > +    import subprocess
> > +    if not isinstance(e, bb.event.ConfigParsed):
> > +        return
> > +
> > +    d =3D e.data
> > +    l =3D d.createCopy()
> > +    l.finalize()
> > +    oe_import(l)
> > +
> > +    external_toolchain =3D l.getVar('EXTERNAL_TOOLCHAIN', True)
> > +    if not external_toolchain or external_toolchain =3D=3D 'UNDEFINED=
':
> > +        bb.fatal("Error: EXTERNAL_TOOLCHAIN must be set to the path t=
o your arm toolchain")
> > +
> > +    if not os.path.exists(external_toolchain):
> > +        bb.fatal("Error: EXTERNAL_TOOLCHAIN path '%s' does not exist"=
 % external_toolchain)
> > +
> > +    # The external toolchain may not have been built with the oe-core=
 preferred
> > +    # gnu hash setting, so ensure that the corresponding sanity check=
 is not an error.
> > +    error_qa =3D oe.data.typed_value('ERROR_QA', l)
> > +    if 'ldflags' in error_qa:
> > +        error_qa.remove('ldflags')
> > +        d.setVar('ERROR_QA', ' '.join(error_qa))
> > +}
> > +addhandler toolchain_metadata_setup
> > +
> > +def populate_toolchain_links(d):
> > +    import errno
> > +    import os
> > +    from glob import glob
> > +
> > +    d =3D d.createCopy()
> > +    d.finalize()
> > +
> > +    pattern =3D bb.data.expand('${EXTERNAL_TOOLCHAIN}/bin/${TARGET_PR=
EFIX}*', d)
> > +    files =3D glob(pattern)
> > +    if not files:
> > +        bb.fatal("Unable to populate toolchain binary symlinks")
> > +
> > +    bindir =3D d.getVar('STAGING_BINDIR_TOOLCHAIN', True)
> > +    bb.mkdirhier(bindir)
> > +    for f in files:
> > +        base =3D os.path.basename(f)
> > +        newpath =3D os.path.join(bindir, base)
> > +        try:
> > +            os.symlink(f, newpath)
> > +        except OSError as exc:
> > +            if exc.errno =3D=3D errno.EEXIST:
> > +                break
> > +            bb.fatal("Unable to populate toolchain binary symlink for=
 %s: %s" % (newpath, exc))
> > +
> > +require conf/distro/include/external-arm-toolchain-versions.inc
> > diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/c=
onf/layer.conf
> > new file mode 100644
> > index 0000000..a247dc1
> > --- /dev/null
> > +++ b/meta-arm-toolchain/conf/layer.conf
> > @@ -0,0 +1,15 @@
> > +BBPATH .=3D ":${LAYERDIR}"
> > +BBFILES +=3D "\
> > +            ${LAYERDIR}/recipes-*/*/*.bb \
> > +            ${LAYERDIR}/recipes-*/*/*.bbappend \
> > +           "
> > +
> > +BBFILE_COLLECTIONS +=3D "arm-toolchain"
> > +BBFILE_PATTERN_arm-toolchain :=3D "^${LAYERDIR}/"
> > +BBFILE_PRIORITY_arm-toolchain =3D "30"
> > +
> > +LAYERSERIES_COMPAT_arm-toolchain =3D "zeus"
> > +
> > +# do not error out on bbappends for missing recipes
> > +BB_DANGLINGAPPENDS_WARNONLY =3D "true"
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchai=
n/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-=
arm-toolchain/external-arm-toolchain.bb
> > new file mode 100644
> > index 0000000..a5ada95
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/exter=
nal-arm-toolchain.bb
> > @@ -0,0 +1,666 @@
> > +require recipes-core/glibc/glibc-package.inc
> > +
> > +INHIBIT_DEFAULT_DEPS =3D "1"
> > +INHIBIT_PACKAGE_STRIP =3D "1"
> > +INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> > +
> > +# License applies to this recipe code, not the toolchain itself
> > +LICENSE =3D "MIT"
> > +LIC_FILES_CHKSUM =3D "\
> > +     file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0bcf8506ecda2f=
7b4f302 \
> > +     file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a038436=
1b4de20420 \
> > +"
> > +
> > +PROVIDES +=3D "\
> > +     linux-libc-headers \
> > +     virtual/${TARGET_PREFIX}gcc \
> > +     virtual/${TARGET_PREFIX}g++ \
> > +     virtual/${TARGET_PREFIX}gcc-initial \
> > +     virtual/${TARGET_PREFIX}binutils \
> > +        binutils-cross-${TARGET_ARCH} \
> > +     virtual/${TARGET_PREFIX}libc-for-gcc \
> > +     virtual/${TARGET_PREFIX}compilerlibs \
> > +     virtual/libc \
> > +     virtual/libintl \
> > +     virtual/libiconv \
> > +     virtual/crypt \
> > +        glibc-mtrace \
> > +     glibc-thread-db \
> > +     glibc \
> > +     libc-mtrace \
> > +     gcc-runtime \
> > +     libgcc \
> > +     libg2c \
> > +     libg2c-dev \
> > +     libssp \
> > +     libssp-dev \
> > +     libssp-staticdev \
> > +     libgfortran \
> > +     libgfortran-dev \
> > +     libgfortran-staticdev \
> > +     libmudflap \
> > +     libmudflap-dev \
> > +     libgomp \
> > +     libgomp-dev \
> > +     libgomp-staticdev \
> > +     libitm \
> > +     libitm-dev \
> > +     libitm-staticdev \
> > +     libquadmath \
> > +     libquadmath-dev \
> > +     libquadmath-staticdev \
> > +     virtual/linux-libc-headers \
> > +     libgcov-staticdev \
> > +     virtual/libc-locale \
> > +"
> > +
> > +PV =3D "${EAT_VER_MAIN}"
> > +
> > +BINV =3D "${EAT_VER_GCC}"
> > +TARGET_SYS =3D "${EAT_TARGET_SYS}"
> > +
> > +SRC_URI =3D "file://SUPPORTED"
> > +
> > +do_install() {
> > +     # Add stubs for files OE-core expects
> > +     install -d ${S}/nscd/
> > +     touch  ${S}/nscd/nscd.init
> > +     touch  ${S}/nscd/nscd.conf
> > +     touch  ${S}/nscd/nscd.service
> > +     touch  ${S}/../makedbs.sh
> > +
> > +     install -d ${D}${base_libdir}
> > +     install -d ${D}${base_sbindir}
> > +     install -d ${D}${bindir}
> > +     install -d ${D}${sbindir}
> > +     install -d ${D}${libdir}
> > +     install -d ${D}${libexecdir}
> > +     install -d ${D}${datadir}
> > +     install -d ${D}${includedir}
> > +     install -d ${D}/include
> > +     install -d ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}
> > +     install -d ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}
> > +
> > +     CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Down=
ership"
> > +     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/${EAT_LIBD=
IR}/*  ${D}${base_libdir}
> > +     if [ -d ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/${EAT_LIBDI=
R}/${EAT_TARGET_SYS} ]; then
> > +             cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/li=
bc/${EAT_LIBDIR}/${EAT_TARGET_SYS}/*  ${D}${base_libdir}
> > +     else
> > +             if [ -f ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/${E=
AT_LIBDIR}/ld-${EAT_VER_LIBC}.so ]; then
> > +                     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET=
_SYS}/libc/${EAT_LIBDIR}/*  ${D}${base_libdir}
> > +             else
> > +                     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET=
_SYS}/libc/usr/${EAT_LIBDIR}/*.so*  ${D}${base_libdir}
> > +             fi
> > +     fi
> > +     if [ -d ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/${EAT_L=
IBDIR}/${EAT_TARGET_SYS} ]; then
> > +             cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/li=
bc/usr/${EAT_LIBDIR}/${EAT_TARGET_SYS}/*  ${D}${libdir}
> > +     else
> > +             cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/li=
bc/usr/${EAT_LIBDIR}/*  ${D}${libdir}
> > +             if [ ! -f ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/$=
{EAT_LIBDIR}/ld-${EAT_VER_LIBC}.so ]; then
> > +                     rm -rf ${D}${libdir}/*.so*
> > +             fi
> > +     fi
> > +     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/s=
hare/*  ${D}${datadir}
> > +     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/i=
nclude/*  ${D}${includedir}
> > +     if [ -d ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/include=
/${EAT_TARGET_SYS} ]; then
> > +             cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/li=
bc/usr/include/${EAT_TARGET_SYS}/*  ${D}${includedir}
> > +             rm -r ${D}${includedir}/${EAT_TARGET_SYS}
> > +     fi
> > +
> > +     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/include/* =
${D}${includedir}
> > +     ln -sf ../usr/include/c++ ${D}/include/c++
> > +
> > +     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/b=
in/* ${D}${bindir}
> > +     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/s=
bin/* ${D}${sbindir}
> > +     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/sbin/=
* ${D}${base_sbindir}
> > +     rm -rf ${D}${bindir}/gdbserver
> > +     sed -i -e 's#/arm/tools/gnu/bash/4.2/rhe6-x86_64##' ${D}${bindir=
}/tzselect
> > +     sed -i -e 's#/arm/tools/gnu/bash/4.2/rhe6-x86_64##' ${D}${bindir=
}/ldd
> > +
> > +     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${=
EAT_VER_GCC}/crt*.o ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
> > +
> > +     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${=
EAT_VER_GCC}/libgcov* ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
> > +     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${=
EAT_VER_GCC}/include ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
> > +     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${=
EAT_VER_GCC}/finclude ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
> > +
> > +     # fix up the copied symlinks (they are still pointing to the mul=
tiarch directory)
> > +     linker_name=3D"${@bb.utils.contains("TUNE_FEATURES", "aarch64", =
"ld-linux-aarch64.so.1", bb.utils.contains("TUNE_FEATURES", "callconvention=
-hard", "ld-linux-armhf.so.3", "ld-linux.so.3",d), d)}"
> > +     ln -sf ld-${EAT_VER_LIBC}.so ${D}${base_libdir}/${linker_name}
> > +     ln -sf ../../lib/librt.so.1 ${D}${libdir}/librt.so
> > +     ln -sf ../../lib/libcrypt.so.1 ${D}${libdir}/libcrypt.so
> > +     ln -sf ../../lib/libresolv.so.2 ${D}${libdir}/libresolv.so
> > +     ln -sf ../../lib/libnss_hesiod.so.2 ${D}${libdir}/libnss_hesiod.=
so
> > +     ln -sf ../../lib/libutil.so.1 ${D}${libdir}/libutil.so
> > +     ln -sf ../../lib/libBrokenLocale.so.1 ${D}${libdir}/libBrokenLoc=
ale.so
> > +     ln -sf ../../lib/libpthread.so.0 ${D}${libdir}/libpthread.so
> > +     ln -sf ../../lib/libthread_db.so.1 ${D}${libdir}/libthread_db.so
> > +     ln -sf ../../lib/libanl.so.1 ${D}${libdir}/libanl.so
> > +     ln -sf ../../lib/libdl.so.2 ${D}${libdir}/libdl.so
> > +     ln -sf ../../lib/libnss_db.so.2 ${D}${libdir}/libnss_db.so
> > +     ln -sf ../../lib/libnss_dns.so.2 ${D}${libdir}/libnss_dns.so
> > +     ln -sf ../../lib/libnss_files.so.2 ${D}${libdir}/libnss_files.so
> > +     ln -sf ../../lib/libnss_compat.so.2 ${D}${libdir}/libnss_compat.=
so
> > +     ln -sf ../../lib/libm.so.6 ${D}${libdir}/libm.so
> > +
> > +     # remove potential .so duplicates from base_libdir
> > +     # for all symlinks created above in libdir
> > +     rm -f ${D}${base_libdir}/librt.so
> > +     rm -f ${D}${base_libdir}/libcrypt.so
> > +     rm -f ${D}${base_libdir}/libresolv.so
> > +     rm -f ${D}${base_libdir}/libnss_hesiod.so
> > +     rm -f ${D}${base_libdir}/libutil.so
> > +     rm -f ${D}${base_libdir}/libBrokenLocale.so
> > +     rm -f ${D}${base_libdir}/libpthread.so
> > +     rm -f ${D}${base_libdir}/libthread_db.so
> > +     rm -f ${D}${base_libdir}/libanl.so
> > +     rm -f ${D}${base_libdir}/libdl.so
> > +     rm -f ${D}${base_libdir}/libnss_db.so
> > +     rm -f ${D}${base_libdir}/libnss_dns.so
> > +     rm -f ${D}${base_libdir}/libnss_files.so
> > +     rm -f ${D}${base_libdir}/libnss_compat.so
> > +     rm -f ${D}${base_libdir}/libm.so
> > +
> > +     # Move these completely to ${libdir} and delete duplicates in ${=
base_libdir}
> > +     for lib in asan atomic gfortran gomp itm lsan sanitizer stdc++ t=
san ubsan; do
> > +             if [ -e ${D}${base_libdir}/lib${lib}.spec ] ; then
> > +                     mv ${D}${base_libdir}/lib${lib}.spec ${D}${libdi=
r}
> > +             fi
> > +             if [ -e ${D}${base_libdir}/lib${lib}.a ] ; then
> > +                     mv ${D}${base_libdir}/lib${lib}.a ${D}${libdir}
> > +             fi
> > +             rm -f ${D}${base_libdir}/lib${lib}*
> > +     done
> > +
> > +     # Clean up duplicate libs that are both in base_libdir and libdi=
r
> > +     rm -f ${D}${libdir}/libgcc*
> > +
> > +     # Besides ld-${EAT_VER_LIBC}.so, other libs can have duplicates =
like lib*-${EAT_VER_LIBC}.so
> > +     # Only remove them if both are regular files and are identical
> > +     for i in ${D}${base_libdir}/lib*-${EAT_VER_LIBC}.so; do
> > +             f=3D$(echo $i | sed 's/-${EAT_VER_LIBC}//')
> > +             l=3D$(ls $f.*)
> > +             if [ $(readlink -f $i ) =3D $l ]; then
> > +                     echo "$i is a symlink of $l, keep it"
> > +             elif [ $(readlink -f $l ) =3D $i ]; then
> > +                     echo "$l is a symlink of $i, keep it"
> > +             else
> > +                     cmp -s $i $l
> > +                     if [ $? -eq 0 ]; then
> > +                             echo "$i is a duplicate of $l, remove it=
"
> > +                             rm $i
> > +                     else
> > +                             echo "$i and $l are different files, kee=
p them both"
> > +                     fi
> > +             fi
> > +     done
> > +
> > +     if [ -d ${D}${base_libdir}/arm-linux-gnueabi ]; then
> > +        rm -rf ${D}${base_libdir}/arm-linux-gnueabi
> > +     fi
> > +
> > +     if [ -d ${D}${base_libdir}/ldscripts ]; then
> > +        rm -rf ${D}${base_libdir}/ldscripts
> > +     fi
> > +
> > +     # Provided by libnsl2
> > +     rm -rf ${D}${includedir}/rpcsvc/yppasswd.*
> > +     # Provided by quota
> > +     rm -rf ${D}${includedir}/rpcsvc/rquota.*
> > +
> > +     if [ -f ${D}${libdir}/libc.so ];then
> > +             sed -i -e "s# /${EAT_LIBDIR}/${EAT_TARGET_SYS}# ../../${=
EAT_LIBDIR}#g" -e "s# /usr/${EAT_LIBDIR}/# /usr/lib/#g" -e "s# /usr/${EAT_L=
IBDIR}/${EAT_TARGET_SYS}# .#g" -e "s# /${EAT_LIBDIR}/ld-linux# ../../${EAT_=
LIBDIR}/ld-linux#g" ${D}${libdir}/libc.so
> > +             sed -i -e "s# /${EAT_LIBDIR}/libc.so.6# /lib/libc.so.6#g=
" ${D}${libdir}/libc.so
> > +             sed -i -e "s# /lib# ../../lib#g" -e "s# /usr/lib# .#g" $=
{D}${libdir}/libc.so
> > +     fi
> > +
> > +     if [ -f ${D}${base_libdir}/libc.so ];then
> > +             sed -i -e "s# /${EAT_LIBDIR}/${EAT_TARGET_SYS}# ../../li=
b#g" -e "s# /usr/${EAT_LIBDIR}/${EAT_TARGET_SYS}# .#g" "s# /${EAT_LIBDIR}/#=
 /lib/#g" ${D}${base_libdir}/libc.so
> > +             if [ -f ${D}${base_libdir}/libc.so.6 ]; then
> > +                     sed -i -e "s# /usr/${EAT_LIBDIR}/libc.so.6# /lib=
/libc.so.6#g" "s# /${EAT_LIBDIR}/libc.so.6# /lib/libc.so.6#g" ${D}${base_li=
bdir}/libc.so.6
> > +             fi
> > +     fi
> > +
> > +     # Remove if empty
> > +     rmdir ${D}${bindir} || true
> > +     rmdir ${D}${sbindir} || true
> > +     rmdir ${D}${base_sbindir} || true
> > +}
> > +
> > +# External toolchain doesn't provide multilib support so make corresp=
onding
> > +# install API as an empty API to avoid an unnecessary errors.
> > +oe_multilib_header () {
> > +     return
> > +}
> > +
> > +PACKAGES_DYNAMIC =3D "^locale-base-.* \
> > +                    ^glibc-gconv-.* ^glibc-charmap-.* ^glibc-localeda=
ta-.* ^glibc-binary-localedata-.* \
> > +                    ^${MLPREFIX}glibc-gconv$"
> > +
> > +# PACKAGES is split up according to the 'source' recipes/includes in =
OE-core
> > +# Stylistic differences are kept to make copy/pasting easier.
> > +
> > +# From gcc-runtime.inc
> > +
> > +PACKAGES +=3D "\
> > +    gcc-runtime-dbg \
> > +    libstdc++ \
> > +    libstdc++-precompile-dev \
> > +    libstdc++-dev \
> > +    libstdc++-staticdev \
> > +    libg2c \
> > +    libg2c-dev \
> > +    libssp \
> > +    libssp-dev \
> > +    libssp-staticdev \
> > +    libmudflap \
> > +    libmudflap-dev \
> > +    libmudflap-staticdev \
> > +    libquadmath \
> > +    libquadmath-dev \
> > +    libquadmath-staticdev \
> > +    libgomp \
> > +    libgomp-dev \
> > +    libgomp-staticdev \
> > +    libatomic \
> > +    libatomic-dev \
> > +    libatomic-staticdev \
> > +    libitm \
> > +    libitm-dev \
> > +    libitm-staticdev \
> > +"
> > +
> > +# From gcc-sanitizers.inc
> > +
> > +PACKAGES +=3D "gcc-sanitizers gcc-sanitizers-dbg"
> > +PACKAGES +=3D "libasan libubsan liblsan libtsan"
> > +PACKAGES +=3D "libasan-dev libubsan-dev liblsan-dev libtsan-dev"
> > +PACKAGES +=3D "libasan-staticdev libubsan-staticdev liblsan-staticdev=
 libtsan-staticdev"
> > +
> > +# From libgfortran.inc:
> > +
> > +PACKAGES +=3D "\
> > +    libgfortran-dbg \
> > +    libgfortran \
> > +    libgfortran-dev \
> > +    libgfortran-staticdev \
> > +"
> > +
> > +# libgcc.inc uses ${PN}, so replace that
> > +
> > +PACKAGES +=3D "\
> > +    libgcc \
> > +    libgcc-dev \
> > +    libgcc-dbg \
> > +"
> > +
> > +# ... and the leftovers
> > +
> > +PACKAGES =3D+ "\
> > +        ${PN}-mtrace \
> > +     libgcov-staticdev \
> > +     linux-libc-headers \
> > +     linux-libc-headers-dev \
> > +"
> > +
> > +INSANE_SKIP_${PN}-dbg =3D "staticdev"
> > +INSANE_SKIP_${PN}-utils +=3D "ldflags"
> > +INSANE_SKIP_libstdc++ +=3D "ldflags"
> > +INSANE_SKIP_libgfortran +=3D "ldflags"
> > +INSANE_SKIP_libgcc +=3D "ldflags dev-deps"
> > +INSANE_SKIP_libgfortran +=3D "ldflags dev-deps"
> > +INSANE_SKIP_libstdc++ +=3D "ldflags dev-deps"
> > +INSANE_SKIP_libatomic +=3D "ldflags"
> > +INSANE_SKIP_libasan +=3D "ldflags"
> > +INSANE_SKIP_libubsan +=3D "ldflags"
> > +INSANE_SKIP_libssp +=3D "ldflags"
> > +INSANE_SKIP_libgomp +=3D "ldflags"
> > +INSANE_SKIP_libitm +=3D "ldflags"
> > +INSANE_SKIP_gdbserver +=3D "ldflags"
> > +
> > +# OE-core has literally listed 'glibc' in LIBC_DEPENDENCIES :/
> > +RPROVIDES_${PN} =3D "glibc rtld(GNU_HASH)"
> > +# Add runtime provides for the other libc* packages as well
> > +RPROVIDES_${PN}-dev =3D "glibc-dev"
> > +RPROVIDES_${PN}-doc =3D "glibc-doc"
> > +RPROVIDES_${PN}-dbg =3D "glibc-dbg"
> > +RPROVIDES_${PN}-pic =3D "glibc-pic"
> > +RPROVIDES_${PN}-utils =3D "glibc-utils"
> > +RPROVIDES_${PN}-mtrace =3D "glibc-mtrace libc-mtrace"
> > +
> > +PKG_${PN} =3D "glibc"
> > +PKG_${PN}-dev =3D "glibc-dev"
> > +PKG_${PN}-doc =3D "glibc-doc"
> > +PKG_${PN}-dbg =3D "glibc-dbg"
> > +PKG_${PN}-pic =3D "glibc-pic"
> > +PKG_${PN}-utils =3D "glibc-utils"
> > +PKG_${PN}-mtrace =3D "glibc-mtrace"
> > +PKG_${PN}-gconv =3D "glibc-gconv"
> > +PKG_${PN}-extra-nss =3D "glibc-extra-nss"
> > +PKG_${PN}-thread-db =3D "glibc-thread-db"
> > +PKG_${PN}-pcprofile =3D "glibc-pcprofile"
> > +PKG_${PN}-staticdev =3D "glibc-staticdev"
> > +
> > +PKGV =3D "${EAT_VER_LIBC}"
> > +PKGV_${PN} =3D "${EAT_VER_LIBC}"
> > +PKGV_${PN}-dev =3D "${EAT_VER_LIBC}"
> > +PKGV_${PN}-doc =3D "${EAT_VER_LIBC}"
> > +PKGV_${PN}-dbg =3D "${EAT_VER_LIBC}"
> > +PKGV_${PN}-pic =3D "${EAT_VER_LIBC}"
> > +PKGV_${PN}-utils =3D "${EAT_VER_LIBC}"
> > +PKGV_${PN}-mtrace =3D "${EAT_VER_LIBC}"
> > +PKGV_${PN}-gconv =3D "${EAT_VER_LIBC}"
> > +PKGV_${PN}-extra-nss =3D "${EAT_VER_LIBC}"
> > +PKGV_${PN}-thread-db =3D "${EAT_VER_LIBC}"
> > +PKGV_${PN}-pcprofile =3D "${EAT_VER_LIBC}"
> > +PKGV_${PN}-staticdev =3D "${EAT_VER_LIBC}"
> > +PKGV_catchsegv =3D "${EAT_VER_LIBC}"
> > +PKGV_glibc-extra-nss =3D "${EAT_VER_LIBC}"
> > +PKGV_glibc-thread-db =3D "${EAT_VER_LIBC}"
> > +
> > +PKGV_libmemusage =3D "${EAT_VER_LIBC}"
> > +PKGV_libsegfault =3D "${EAT_VER_LIBC}"
> > +PKGV_libsotruss =3D "${EAT_VER_LIBC}"
> > +PKGV_sln =3D "${EAT_VER_LIBC}"
> > +PKGV_nscd =3D "${EAT_VER_LIBC}"
> > +PKGV_ldd =3D "${EAT_VER_LIBC}"
> > +
> > +PKGV_libasan-dev =3D "${EAT_VER_GCC}"
> > +PKGV_libasan =3D "${EAT_VER_GCC}"
> > +PKGV_libasan-staticdev =3D "${EAT_VER_GCC}"
> > +PKGV_libatomic-dev =3D "${EAT_VER_GCC}"
> > +PKGV_libatomic =3D "${EAT_VER_GCC}"
> > +PKGV_libatomic-staticdev =3D "${EAT_VER_GCC}"
> > +PKGV_libg2c-dev =3D "${EAT_VER_GCC}"
> > +PKGV_libg2c =3D "${EAT_VER_GCC}"
> > +PKGV_libgcc-dev =3D "${EAT_VER_GCC}"
> > +PKGV_libgcc =3D "${EAT_VER_GCC}"
> > +PKGV_libgfortran-dbg =3D "${EAT_VER_GCC}"
> > +PKGV_libgfortran-dev =3D "${EAT_VER_GCC}"
> > +PKGV_libgfortran =3D "${EAT_VER_GCC}"
> > +PKGV_libgfortran-staticdev =3D "${EAT_VER_GCC}"
> > +PKGV_libgomp-dev =3D "${EAT_VER_GCC}"
> > +PKGV_libgomp =3D "${EAT_VER_GCC}"
> > +PKGV_libgomp-staticdev =3D "${EAT_VER_GCC}"
> > +PKGV_libitm-dev =3D "${EAT_VER_GCC}"
> > +PKGV_libitm =3D "${EAT_VER_GCC}"
> > +PKGV_libitm-staticdev =3D "${EAT_VER_GCC}"
> > +PKGV_liblsan-dev =3D "${EAT_VER_GCC}"
> > +PKGV_liblsan =3D "${EAT_VER_GCC}"
> > +PKGV_liblsan-staticdev =3D "${EAT_VER_GCC}"
> > +PKGV_libmudflap-dev =3D "${EAT_VER_GCC}"
> > +PKGV_libmudflap =3D "${EAT_VER_GCC}"
> > +PKGV_libmudflap-staticdev =3D "${EAT_VER_GCC}"
> > +PKGV_libquadmath-dev =3D "${EAT_VER_GCC}"
> > +PKGV_libquadmath =3D "${EAT_VER_GCC}"
> > +PKGV_libquadmath-staticdev =3D "${EAT_VER_GCC}"
> > +PKGV_libssp-dev =3D "${EAT_VER_GCC}"
> > +PKGV_libssp =3D "${EAT_VER_GCC}"
> > +PKGV_libssp-staticdev =3D "${EAT_VER_GCC}"
> > +PKGV_libstdc++-dbg =3D "${EAT_VER_GCC}"
> > +PKGV_libstdc++-dev =3D "${EAT_VER_GCC}"
> > +PKGV_libstdc++ =3D "${EAT_VER_GCC}"
> > +PKGV_libstdc++-precompile-dev =3D "${EAT_VER_GCC}"
> > +PKGV_libstdc++-staticdev =3D "${EAT_VER_GCC}"
> > +PKGV_libtsan-dev =3D "${EAT_VER_GCC}"
> > +PKGV_libtsan =3D "${EAT_VER_GCC}"
> > +PKGV_libtsan-staticdev =3D "${EAT_VER_GCC}"
> > +PKGV_libubsan-dev =3D "${EAT_VER_GCC}"
> > +PKGV_libubsan =3D "${EAT_VER_GCC}"
> > +PKGV_libubsan-staticdev =3D "${EAT_VER_GCC}"
> > +
> > +PKGV_linux-libc-headers-dev =3D "${EAT_VER_KERNEL}"
> > +PKGV_linux-libc-headers =3D "${EAT_VER_KERNEL}"
> > +
> > +PKGV_gdbserver =3D "${EAT_VER_GDBSERVER}"
> > +
> > +ALLOW_EMPTY_${PN}-mtrace =3D "1"
> > +FILES_${PN}-mtrace =3D "${bindir}/mtrace"
> > +
> > +FILES_libgcov-staticdev =3D "${libdir}/gcc/${TARGET_SYS}/${BINV}/libg=
cov.a"
> > +
> > +FILES_libsegfault =3D "${base_libdir}/libSegFault*"
> > +
> > +FILES_catchsegv =3D "${bindir}/catchsegv"
> > +RDEPENDS_catchsegv =3D "libsegfault"
> > +
> > +RDEPENDS_ldd =3D "bash"
> > +RDEPENDS_tzcode =3D "bash"
> > +
> > +# From libgfortran.inc:
> > +
> > +FILES_libgfortran =3D "${libdir}/libgfortran.so.*"
> > +FILES_libgfortran-dev =3D "\
> > +    ${libdir}/libgfortran*.so \
> > +    ${libdir}/libgfortran.spec \
> > +    ${libdir}/libgfortran.la \
> > +    ${libdir}/gcc/${TARGET_SYS}/${BINV}/libgfortranbegin.* \
> > +    ${libdir}/gcc/${TARGET_SYS}/${BINV}/libcaf_single* \
> > +    ${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude/ \
> > +"
> > +FILES_libgfortran-staticdev =3D "${libdir}/libgfortran.a"
> > +
> > +
> > +# From gcc-sanitizers.inc:
> > +
> > +FILES_libasan +=3D "${libdir}/libasan.so.*"
> > +FILES_libasan-dev +=3D "\
> > +    ${libdir}/libasan_preinit.o \
> > +    ${libdir}/libasan.so \
> > +    ${libdir}/libasan.la \
> > +"
> > +FILES_libasan-staticdev +=3D "${libdir}/libasan.a"
> > +
> > +FILES_libubsan +=3D "${libdir}/libubsan.so.*"
> > +FILES_libubsan-dev +=3D "\
> > +    ${libdir}/libubsan.so \
> > +    ${libdir}/libubsan.la \
> > +"
> > +FILES_libubsan-staticdev +=3D "${libdir}/libubsan.a"
> > +
> > +FILES_liblsan +=3D "${libdir}/liblsan.so.*"
> > +FILES_liblsan-dev +=3D "\
> > +    ${libdir}/liblsan.so \
> > +    ${libdir}/liblsan.la \
> > +    ${libdir}/liblsan_preinit.o \
> > +"
> > +FILES_liblsan-staticdev +=3D "${libdir}/liblsan.a"
> > +
> > +FILES_libtsan +=3D "${libdir}/libtsan.so.*"
> > +FILES_libtsan-dev +=3D "\
> > +    ${libdir}/libtsan.so \
> > +    ${libdir}/libtsan.la \
> > +    ${libdir}/libtsan_*.o \
> > +"
> > +FILES_libtsan-staticdev +=3D "${libdir}/libtsan.a"
> > +
> > +FILES_gcc-sanitizers =3D "${libdir}/*.spec ${libdir}/gcc/${TARGET_SYS=
}/${BINV}/include/sanitizer/*.h"
> > +
> > +# From libgcc.inc:
> > +
> > +FILES_libgcc =3D "${base_libdir}/libgcc_s.so.1"
> > +
> > +FILES_libgcc-dev =3D "\
> > +    ${base_libdir}/libgcc*.so \
> > +    ${@oe.utils.conditional('BASETARGET_SYS', '${TARGET_SYS}', '', '$=
{libdir}/${BASETARGET_SYS}', d)} \
> > +    ${libdir}/${TARGET_SYS}/${BINV}* \
> > +    ${libdir}/${TARGET_ARCH}${TARGET_VENDOR}* \
> > +    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include \
> > +"
> > +
> > +FILES_linux-libc-headers =3D ""
> > +FILES_linux-libc-headers-dev =3D "\
> > +     ${includedir}/asm* \
> > +     ${includedir}/linux \
> > +     ${includedir}/mtd \
> > +     ${includedir}/rdma \
> > +     ${includedir}/scsi \
> > +     ${includedir}/sound \
> > +     ${includedir}/video \
> > +"
> > +FILES_${PN} +=3D "\
> > +     ${libdir}/bin \
> > +     ${libdir}/locale \
> > +     ${libdir}/gconv/gconv-modules \
> > +     ${datadir}/zoneinfo \
> > +     ${base_libdir}/libcrypt*.so.* \
> > +     ${base_libdir}/libcrypt-*.so \
> > +     ${base_libdir}/libc.so.* \
> > +     ${base_libdir}/libc-*.so \
> > +     ${base_libdir}/libm.so.* \
> > +     ${base_libdir}/libmemusage.so \
> > +     ${base_libdir}/libm-*.so \
> > +     ${base_libdir}/ld*.so.* \
> > +     ${base_libdir}/ld-*.so \
> > +     ${base_libdir}/libpthread*.so.* \
> > +     ${base_libdir}/libpthread*.so \
> > +     ${base_libdir}/libpthread-*.so \
> > +     ${base_libdir}/libresolv*.so.* \
> > +     ${base_libdir}/libresolv-*.so \
> > +     ${base_libdir}/librt*.so.* \
> > +     ${base_libdir}/librt-*.so \
> > +     ${base_libdir}/libutil*.so.* \
> > +     ${base_libdir}/libutil-*.so \
> > +     ${base_libdir}/libnss_files*.so.* \
> > +     ${base_libdir}/libnss_files-*.so \
> > +     ${base_libdir}/libnss_compat*.so.* \
> > +     ${base_libdir}/libnss_compat-*.so \
> > +     ${base_libdir}/libnss_dns*.so.* \
> > +     ${base_libdir}/libnss_dns-*.so \
> > +     ${base_libdir}/libnss_nis*.so.* \
> > +     ${base_libdir}/libnss_nisplus-*.so \
> > +     ${base_libdir}/libnss_nisplus*.so.* \
> > +     ${base_libdir}/libnss_nis-*.so \
> > +     ${base_libdir}/libnss_hesiod*.so.* \
> > +     ${base_libdir}/libnss_hesiod-*.so \
> > +     ${base_libdir}/libdl*.so.* \
> > +     ${base_libdir}/libdl-*.so \
> > +     ${base_libdir}/libanl*.so.* \
> > +     ${base_libdir}/libanl-*.so \
> > +     ${base_libdir}/libBrokenLocale*.so.* \
> > +     ${base_libdir}/libBrokenLocale-*.so \
> > +     ${base_libdir}/libthread_db*.so.* \
> > +     ${base_libdir}/libthread_db-*.so \
> > +     ${base_libdir}/libmemusage.so \
> > +     ${base_libdir}/libSegFault.so \
> > +     ${base_libdir}/libpcprofile.so \
> > +    "
> > +
> > +FILES_${PN}-dbg +=3D "${base_libdir}/debug"
> > +
> > +# From gcc-runtime.inc
> > +
> > +# include python debugging scripts
> > +FILES_gcc-runtime-dbg +=3D "\
> > +    ${libdir}/libstdc++.so.*-gdb.py \
> > +    ${datadir}/gcc-${BINV}/python/libstdcxx \
> > +"
> > +
> > +FILES_libg2c =3D "${target_libdir}/libg2c.so.*"
> > +SUMMARY_libg2c =3D "Companion runtime library for g77"
> > +FILES_libg2c-dev =3D "\
> > +    ${libdir}/libg2c.so \
> > +    ${libdir}/libg2c.a \
> > +    ${libdir}/libfrtbegin.a \
> > +"
> > +SUMMARY_libg2c-dev =3D "Companion runtime library for g77 - developme=
nt files"
> > +
> > +FILES_libstdc++ =3D "${libdir}/libstdc++.so.*"
> > +SUMMARY_libstdc++ =3D "GNU standard C++ library"
> > +FILES_libstdc++-dev =3D "\
> > +    /include/c++ \
> > +    ${includedir}/c++/ \
> > +    ${libdir}/libstdc++.so \
> > +    ${libdir}/libstdc++*.la \
> > +    ${libdir}/libsupc++.la \
> > +"
> > +SUMMARY_libstdc++-dev =3D "GNU standard C++ library - development fil=
es"
> > +
> > +FILES_libstdc++-staticdev =3D "\
> > +    ${libdir}/libstdc++*.a \
> > +    ${libdir}/libsupc++.a \
> > +"
> > +SUMMARY_libstdc++-staticdev =3D "GNU standard C++ library - static de=
velopment files"
> > +
> > +FILES_libstdc++-precompile-dev =3D "${includedir}/c++/${TARGET_SYS}/b=
its/*.gch"
> > +SUMMARY_libstdc++-precompile-dev =3D "GNU standard C++ library - prec=
ompiled header files"
> > +
> > +FILES_libssp =3D "${libdir}/libssp.so.*"
> > +SUMMARY_libssp =3D "GNU stack smashing protection library"
> > +FILES_libssp-dev =3D "\
> > +    ${libdir}/libssp*.so \
> > +    ${libdir}/libssp*_nonshared.a \
> > +    ${libdir}/libssp*.la \
> > +    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/ssp \
> > +"
> > +SUMMARY_libssp-dev =3D "GNU stack smashing protection library - devel=
opment files"
> > +FILES_libssp-staticdev =3D "${libdir}/libssp*.a"
> > +SUMMARY_libssp-staticdev =3D "GNU stack smashing protection library -=
 static development files"
> > +
> > +FILES_libquadmath =3D "${libdir}/libquadmath*.so.*"
> > +SUMMARY_libquadmath =3D "GNU quad-precision math library"
> > +FILES_libquadmath-dev =3D "\
> > +    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/quadmath* \
> > +    ${libdir}/libquadmath*.so \
> > +    ${libdir}/libquadmath.la \
> > +"
> > +SUMMARY_libquadmath-dev =3D "GNU quad-precision math library - develo=
pment files"
> > +FILES_libquadmath-staticdev =3D "${libdir}/libquadmath.a"
> > +SUMMARY_libquadmath-staticdev =3D "GNU quad-precision math library - =
static development files"
> > +
> > +# NOTE: mudflap has been removed as of gcc 4.9 and has been supersede=
d by the address sanitiser
> > +FILES_libmudflap =3D "${libdir}/libmudflap*.so.*"
> > +SUMMARY_libmudflap =3D "Pointer debugging library for gcc"
> > +FILES_libmudflap-dev =3D "\
> > +    ${libdir}/libmudflap*.so \
> > +    ${libdir}/libmudflap.la \
> > +"
> > +SUMMARY_libmudflap-dev =3D "Pointer debugging library for gcc - devel=
opment files"
> > +FILES_libmudflap-staticdev =3D "${libdir}/libmudflap.a"
> > +SUMMARY_libmudflap-staticdev =3D "Pointer debugging library for gcc -=
 static development files"
> > +
> > +FILES_libgomp =3D "${libdir}/libgomp*${SOLIBS}"
> > +SUMMARY_libgomp =3D "GNU OpenMP parallel programming library"
> > +FILES_libgomp-dev =3D "\
> > +    ${libdir}/libgomp*${SOLIBSDEV} \
> > +    ${libdir}/libgomp*.la \
> > +    ${libdir}/libgomp.spec \
> > +    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/omp.h \
> > +    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/openacc.h \
> > +"
> > +SUMMARY_libgomp-dev =3D "GNU OpenMP parallel programming library - de=
velopment files"
> > +FILES_libgomp-staticdev =3D "${libdir}/libgomp*.a"
> > +SUMMARY_libgomp-staticdev =3D "GNU OpenMP parallel programming librar=
y - static development files"
> > +
> > +FILES_libatomic =3D "${libdir}/libatomic.so.*"
> > +SUMMARY_libatomic =3D "GNU C++11 atomics support library"
> > +FILES_libatomic-dev =3D "\
> > +    ${libdir}/libatomic.so \
> > +    ${libdir}/libatomic.la \
> > +"
> > +SUMMARY_libatomic-dev =3D "GNU C++11 atomics support library - develo=
pment files"
> > +FILES_libatomic-staticdev =3D "${libdir}/libatomic.a"
> > +SUMMARY_libatomic-staticdev =3D "GNU C++11 atomics support library - =
static development files"
> > +
> > +FILES_libitm =3D "${libdir}/libitm.so.*"
> > +SUMMARY_libitm =3D "GNU transactional memory support library"
> > +FILES_libitm-dev =3D "\
> > +    ${libdir}/libitm.so \
> > +    ${libdir}/libitm.la \
> > +    ${libdir}/libitm.spec \
> > +"
> > +SUMMARY_libitm-dev =3D "GNU transactional memory support library - de=
velopment files"
> > +FILES_libitm-staticdev =3D "${libdir}/libitm.a"
> > +SUMMARY_libitm-staticdev =3D "GNU transactional memory support librar=
y - static development files"
> > +
> > +EAT_VER_MAIN ??=3D ""
> > +
> > +
> > +python () {
> > +    if not d.getVar("EAT_VER_MAIN", False):
> > +        raise bb.parse.SkipPackage("External ARM toolchain not config=
ured (EAT_VER_MAIN not set).")
> > +    import re
> > +    notglibc =3D (re.match('.*uclibc$', d.getVar('TARGET_OS', True)) =
!=3D None) or (re.match('.*musl$', d.getVar('TARGET_OS', True)) !=3D None)
> > +    if notglibc:
> > +        raise bb.parse.SkipPackage("incompatible with target %s" %
> > +                                   d.getVar('TARGET_OS', True))
> > +}
> > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchai=
n/files/SUPPORTED b/meta-arm-toolchain/recipes-devtools/external-arm-toolch=
ain/files/SUPPORTED
> > new file mode 100644
> > index 0000000..9615075
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/files=
/SUPPORTED
> > @@ -0,0 +1 @@
> > +POSIX
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2.inc b=
/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2.inc
> > new file mode 100644
> > index 0000000..c47c320
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2.inc
> > @@ -0,0 +1,114 @@
> > +require recipes-devtools/gcc/gcc-common.inc
> > +
> > +BASEPV =3D "8.2"
> > +PV =3D "arm-${BASEPV}"
> > +
> > +MMYY =3D "19.01"
> > +RELEASE =3D "20${MMYY}"
> > +PR =3D "r${RELEASE}"
> > +BINV =3D "${BASEPV}.1"
> > +
> > +FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/gcc-${BASEPV}:${FILE_DIRNAME}/g=
cc-${BASEPV}/backport:"
> > +
> > +DEPENDS =3D+ "mpfr gmp libmpc zlib flex-native"
> > +NATIVEDEPS =3D "mpfr-native gmp-native libmpc-native zlib-native flex=
-native"
> > +
> > +LICENSE =3D "GPL-3.0-with-GCC-exception & GPLv3"
> > +
> > +LIC_FILES_CHKSUM =3D "\
> > +    file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552 \
> > +    file://COPYING3;md5=3Dd32239bcb673463ab874e80d47fae504 \
> > +    file://COPYING3.LIB;md5=3D6a6a8e020838b23406c81b19c1d46df6 \
> > +    file://COPYING.LIB;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
> > +    file://COPYING.RUNTIME;md5=3Dfe60d87048567d4fe8c8a0ed2448bcc8 \
> > +"
> > +
> > +#BASEURI ?=3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2"
> > +SRCREV =3D "1a721bce9532193e63acdcdb56fc16e8ac70b20a"
> > +BASEURI ?=3D "git://git.linaro.org/toolchain/gcc.git;protocol=3Dhttps=
;branch=3Dlinaro-local/ARM/arm-8-branch"
> > +
> > +SRC_URI =3D "\
> > +           ${BASEURI} \
> > +           file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
> > +           file://0003-gcc-poison-system-directories.patch \
> > +           file://0005-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch \
> > +           file://0006-64-bit-multilib-hack.patch \
> > +           file://0007-optional-libstdc.patch \
> > +           file://0008-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch \
> > +           file://0009-COLLECT_GCC_OPTIONS.patch \
> > +           file://0010-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-=
in-B.patch \
> > +           file://0011-fortran-cross-compile-hack.patch \
> > +           file://0012-cpp-honor-sysroot.patch \
> > +           file://0013-MIPS64-Default-to-N64-ABI.patch \
> > +           file://0014-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC=
_LINKE.patch \
> > +           file://0015-gcc-Fix-argument-list-too-long-error.patch \
> > +           file://0016-Disable-sdt.patch \
> > +           file://0017-libtool.patch \
> > +           file://0018-gcc-armv4-pass-fix-v4bx-to-linker-to-support-E=
ABI.patch \
> > +           file://0019-Use-the-multilib-config-files-from-B-instead-o=
f-usin.patch \
> > +           file://0020-Avoid-using-libdir-from-.la-which-usually-poin=
ts-to-.patch \
> > +           file://0021-export-CPP.patch \
> > +           file://0022-Disable-the-MULTILIB_OSDIRNAMES-and-other-mult=
ilib-o.patch \
> > +           file://0023-Ensure-target-gcc-headers-can-be-included.patc=
h \
> > +           file://0024-gcc-4.8-won-t-build-with-disable-dependency-tr=
acking.patch \
> > +           file://0025-Don-t-search-host-directory-during-relink-if-i=
nst_pr.patch \
> > +           file://0026-Use-SYSTEMLIBS_DIR-replacement-instead-of-hard=
coding.patch \
> > +           file://0027-aarch64-Add-support-for-musl-ldso.patch \
> > +           file://0028-libcc1-fix-libcc1-s-install-path-and-rpath.pat=
ch \
> > +           file://0029-handle-sysroot-support-for-nativesdk-gcc.patch=
 \
> > +           file://0030-Search-target-sysroot-gcc-version-specific-dir=
s-with.patch \
> > +           file://0031-Fix-various-_FOR_BUILD-and-related-variables.p=
atch \
> > +           file://0032-nios2-Define-MUSL_DYNAMIC_LINKER.patch \
> > +           file://0033-Add-ssp_nonshared-to-link-commandline-for-musl=
-targe.patch \
> > +           file://0034-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch \
> > +           file://0035-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLA=
GS.patch \
> > +           file://0036-libgcc_s-Use-alias-for-__cpu_indicator_init-in=
stead-.patch \
> > +           file://0037-sync-gcc-stddef.h-with-musl.patch \
> > +           file://0038-fix-segmentation-fault-in-precompiled-header-g=
enerat.patch \
> > +           file://0039-Fix-for-testsuite-failure.patch \
> > +           file://0040-Re-introduce-spe-commandline-options.patch \
> > +           file://0041-ARC-fix-spec-gen.patch \
> > +           file://0042-powerpc-powerpc64-Add-support-for-musl-ldso.pa=
tch \
> > +           file://0043-riscv-Disable-multilib-for-OE.patch \
> > +           ${BACKPORTS} \
> > +"
> > +BACKPORTS =3D "\
> > +"
> > +
> > +S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/git"
> > +#S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
> > +#S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/git"
> > +#S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${RELEASE}"
> > +B =3D "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
> > +
> > +# Language Overrides
> > +FORTRAN =3D ""
> > +JAVA =3D ""
> > +
> > +LTO =3D "--enable-lto"
> > +SSP ?=3D "--disable-libssp"
> > +SSP_mingw32 =3D "--enable-libssp"
> > +
> > +EXTRA_OECONF_BASE =3D "\
> > +    ${LTO} \
> > +    ${SSP} \
> > +    --enable-libitm \
> > +    --disable-bootstrap \
> > +    --disable-libmudflap \
> > +    --with-system-zlib \
> > +    ${@'--with-linker-hash-style=3D${LINKER_HASH_STYLE}' if '${LINKER=
_HASH_STYLE}' else ''} \
> > +    --enable-linker-build-id \
> > +    --with-ppl=3Dno \
> > +    --with-cloog=3Dno \
> > +    --enable-checking=3Drelease \
> > +    --enable-cheaders=3Dc_global \
> > +    --without-isl \
> > +"
> > +
> > +EXTRA_OECONF_append_aarchilp32 =3D " --with-abi=3Dilp32"
> > +
> > +EXTRA_OECONF_PATHS =3D "\
> > +    --with-gxx-include-dir=3D/not/exist{target_includedir}/c++/${BINV=
} \
> > +    --with-sysroot=3D/not/exist \
> > +    --with-build-sysroot=3D${STAGING_DIR_TARGET} \
> > +"
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0001-=
gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch b/meta-arm-toolchain/recipes-devtools=
/gcc/gcc-arm-8.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
> > new file mode 100644
> > index 0000000..423fe28
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0001-gcc-4.3=
.1-ARCH_FLAGS_FOR_TARGET.patch
> > @@ -0,0 +1,42 @@
> > +From b752fb2b6d6f6da68da5386b96abf0d74cd4bbe6 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 08:37:11 +0400
> > +Subject: [PATCH 01/39] gcc-4.3.1: ARCH_FLAGS_FOR_TARGET
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Inappropriate [embedded specific]
> > +---
> > + configure    | 2 +-
> > + configure.ac | 2 +-
> > + 2 files changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/configure b/configure
> > +index 69c99e99cca..517fb70192e 100755
> > +--- a/configure
> > ++++ b/configure
> > +@@ -7511,7 +7511,7 @@ fi
> > + # for target_alias and gcc doesn't manage it consistently.
> > + target_configargs=3D"--cache-file=3D./config.cache ${target_configar=
gs}"
> > +
> > +-FLAGS_FOR_TARGET=3D
> > ++FLAGS_FOR_TARGET=3D"$ARCH_FLAGS_FOR_TARGET"
> > + case " $target_configdirs " in
> > +  *" newlib "*)
> > +   case " $target_configargs " in
> > +diff --git a/configure.ac b/configure.ac
> > +index a1edc369a27..f8c254f1fac 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -3100,7 +3100,7 @@ fi
> > + # for target_alias and gcc doesn't manage it consistently.
> > + target_configargs=3D"--cache-file=3D./config.cache ${target_configar=
gs}"
> > +
> > +-FLAGS_FOR_TARGET=3D
> > ++FLAGS_FOR_TARGET=3D"$ARCH_FLAGS_FOR_TARGET"
> > + case " $target_configdirs " in
> > +  *" newlib "*)
> > +   case " $target_configargs " in
> > +--
> > +2.17.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0003-=
gcc-poison-system-directories.patch b/meta-arm-toolchain/recipes-devtools/g=
cc/gcc-arm-8.2/0003-gcc-poison-system-directories.patch
> > new file mode 100644
> > index 0000000..0513897
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0003-gcc-poi=
son-system-directories.patch
> > @@ -0,0 +1,194 @@
> > +From 48c670d2678e0323d88eb72205e039f393cabe05 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 08:59:00 +0400
> > +Subject: [PATCH 03/39] gcc: poison-system-directories
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Inappropriate [distribution: codesourcery]
> > +---
> > + gcc/common.opt      |  4 ++++
> > + gcc/config.in       |  6 ++++++
> > + gcc/configure       | 16 ++++++++++++++++
> > + gcc/configure.ac    | 10 ++++++++++
> > + gcc/doc/invoke.texi |  9 +++++++++
> > + gcc/gcc.c           |  2 ++
> > + gcc/incpath.c       | 19 +++++++++++++++++++
> > + 7 files changed, 66 insertions(+)
> > +
> > +diff --git a/gcc/common.opt b/gcc/common.opt
> > +index d6ef85928f3..7b29efe3882 100644
> > +--- a/gcc/common.opt
> > ++++ b/gcc/common.opt
> > +@@ -679,6 +679,10 @@ Wreturn-local-addr
> > + Common Var(warn_return_local_addr) Init(1) Warning
> > + Warn about returning a pointer/reference to a local or temporary var=
iable.
> > +
> > ++Wpoison-system-directories
> > ++Common Var(flag_poison_system_directories) Init(1) Warning
> > ++Warn for -I and -L options using system directories if cross compili=
ng
> > ++
> > + Wshadow
> > + Common Var(warn_shadow) Warning
> > + Warn when one variable shadows another.  Same as -Wshadow=3Dglobal.
> > +diff --git a/gcc/config.in b/gcc/config.in
> > +index 5bccb408016..1c784a8276b 100644
> > +--- a/gcc/config.in
> > ++++ b/gcc/config.in
> > +@@ -194,6 +194,12 @@
> > + #endif
> > +
> > +
> > ++/* Define to warn for use of native system header directories */
> > ++#ifndef USED_FOR_TARGET
> > ++#undef ENABLE_POISON_SYSTEM_DIRECTORIES
> > ++#endif
> > ++
> > ++
> > + /* Define if you want all operations on RTL (the basic data structur=
e of the
> > +    optimizer and back end) to be checked for dynamic type safety at =
runtime.
> > +    This is quite expensive. */
> > +diff --git a/gcc/configure b/gcc/configure
> > +index 5c345ce0fd7..cafd05fd150 100755
> > +--- a/gcc/configure
> > ++++ b/gcc/configure
> > +@@ -953,6 +953,7 @@ with_system_zlib
> > + enable_maintainer_mode
> > + enable_link_mutex
> > + enable_version_specific_runtime_libs
> > ++enable_poison_system_directories
> > + enable_plugin
> > + enable_host_shared
> > + enable_libquadmath_support
> > +@@ -1696,6 +1697,8 @@ Optional Features:
> > +   --enable-version-specific-runtime-libs
> > +                           specify that runtime libraries should be i=
nstalled
> > +                           in a compiler-specific directory
> > ++  --enable-poison-system-directories
> > ++                          warn for use of native system header direc=
tories
> > +   --enable-plugin         enable plugin support
> > +   --enable-host-shared    build host code as shared libraries
> > +   --disable-libquadmath-support
> > +@@ -29715,6 +29718,19 @@ if test "${enable_version_specific_runtime_l=
ibs+set}" =3D set; then :
> > + fi
> > +
> > +
> > ++# Check whether --enable-poison-system-directories was given.
> > ++if test "${enable_poison_system_directories+set}" =3D set; then :
> > ++  enableval=3D$enable_poison_system_directories;
> > ++else
> > ++  enable_poison_system_directories=3Dno
> > ++fi
> > ++
> > ++if test "x${enable_poison_system_directories}" =3D "xyes"; then
> > ++
> > ++$as_echo "#define ENABLE_POISON_SYSTEM_DIRECTORIES 1" >>confdefs.h
> > ++
> > ++fi
> > ++
> > + # Substitute configuration variables
> > +
> > +
> > +diff --git a/gcc/configure.ac b/gcc/configure.ac
> > +index 65dbf1f2f80..dd5b38195ce 100644
> > +--- a/gcc/configure.ac
> > ++++ b/gcc/configure.ac
> > +@@ -6341,6 +6341,16 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
> > +                 [specify that runtime libraries should be
> > +                  installed in a compiler-specific directory])])
> > +
> > ++AC_ARG_ENABLE([poison-system-directories],
> > ++             AS_HELP_STRING([--enable-poison-system-directories],
> > ++                            [warn for use of native system header di=
rectories]),,
> > ++             [enable_poison_system_directories=3Dno])
> > ++if test "x${enable_poison_system_directories}" =3D "xyes"; then
> > ++  AC_DEFINE([ENABLE_POISON_SYSTEM_DIRECTORIES],
> > ++           [1],
> > ++           [Define to warn for use of native system header directori=
es])
> > ++fi
> > ++
> > + # Substitute configuration variables
> > + AC_SUBST(subdirs)
> > + AC_SUBST(srcdir)
> > +diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
> > +index 255149fcfb8..cb71b60fe3c 100644
> > +--- a/gcc/doc/invoke.texi
> > ++++ b/gcc/doc/invoke.texi
> > +@@ -303,6 +303,7 @@ Objective-C and Objective-C++ Dialects}.
> > + -Wpacked  -Wpacked-bitfield-compat -Wpacked-not-aligned -Wpadded @go=
l
> > + -Wparentheses  -Wno-pedantic-ms-format @gol
> > + -Wplacement-new  -Wplacement-new=3D@var{n} @gol
> > ++-Wno-poison-system-directories @gol
> > + -Wpointer-arith  -Wpointer-compare  -Wno-pointer-to-int-cast @gol
> > + -Wno-pragmas  -Wredundant-decls  -Wrestrict  -Wno-return-local-addr =
@gol
> > + -Wreturn-type  -Wsequence-point  -Wshadow  -Wno-shadow-ivar @gol
> > +@@ -5712,6 +5713,14 @@ made up of data only and thus requires no spec=
ial treatment.  But, for
> > + most targets, it is made up of code and thus requires the stack to b=
e
> > + made executable in order for the program to work properly.
> > +
> > ++@item -Wno-poison-system-directories
> > ++@opindex Wno-poison-system-directories
> > ++Do not warn for @option{-I} or @option{-L} options using system
> > ++directories such as @file{/usr/include} when cross compiling.  This
> > ++option is intended for use in chroot environments when such
> > ++directories contain the correct headers and libraries for the target
> > ++system rather than the host.
> > ++
> > + @item -Wfloat-equal
> > + @opindex Wfloat-equal
> > + @opindex Wno-float-equal
> > +diff --git a/gcc/gcc.c b/gcc/gcc.c
> > +index a716f708259..02b3cd39fc2 100644
> > +--- a/gcc/gcc.c
> > ++++ b/gcc/gcc.c
> > +@@ -1037,6 +1037,8 @@ proper position among the other output files.  =
*/
> > +    "%{fuse-ld=3D*:-fuse-ld=3D%*} " LINK_COMPRESS_DEBUG_SPEC \
> > +    "%X %{o*} %{e*} %{N} %{n} %{r}\
> > +     %{s} %{t} %{u*} %{z} %{Z} %{!nostdlib:%{!nostartfiles:%S}} \
> > ++    %{Wno-poison-system-directories:--no-poison-system-directories} =
\
> > ++    %{Werror=3Dpoison-system-directories:--error-poison-system-direc=
tories} \
> > +     %{static|no-pie|static-pie:} %{L*} %(mfwrap) %(link_libgcc) " \
> > +     VTABLE_VERIFICATION_SPEC " " SANITIZER_EARLY_SPEC " %o " CHKP_SP=
EC " \
> > +     %{fopenacc|fopenmp|%:gt(%{ftree-parallelize-loops=3D*:%*} 1):\
> > +diff --git a/gcc/incpath.c b/gcc/incpath.c
> > +index b11c6a57939..e3b7a21966f 100644
> > +--- a/gcc/incpath.c
> > ++++ b/gcc/incpath.c
> > +@@ -26,6 +26,7 @@
> > + #include "intl.h"
> > + #include "incpath.h"
> > + #include "cppdefault.h"
> > ++#include "diagnostic-core.h"
> > +
> > + /* Microsoft Windows does not natively support inodes.
> > +    VMS has non-numeric inodes.  */
> > +@@ -393,6 +394,26 @@ merge_include_chains (const char *sysroot, cpp_r=
eader *pfile, int verbose)
> > +     }
> > +       fprintf (stderr, _("End of search list.\n"));
> > +     }
> > ++
> > ++#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
> > ++  if (flag_poison_system_directories)
> > ++    {
> > ++       struct cpp_dir *p;
> > ++
> > ++       for (p =3D heads[INC_QUOTE]; p; p =3D p->next)
> > ++         {
> > ++          if ((!strncmp (p->name, "/usr/include", 12))
> > ++              || (!strncmp (p->name, "/usr/local/include", 18))
> > ++              || (!strncmp (p->name, "/usr/X11R6/include", 18))
> > ++              || (!strncmp (p->name, "/sw/include", 11))
> > ++              || (!strncmp (p->name, "/opt/include", 12)))
> > ++            warning (OPT_Wpoison_system_directories,
> > ++                     "include location \"%s\" is unsafe for "
> > ++                     "cross-compilation",
> > ++                     p->name);
> > ++         }
> > ++    }
> > ++#endif
> > + }
> > +
> > + /* Use given -I paths for #include "..." but not #include <...>, and
> > +--
> > +2.17.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0005-=
gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch b/meta-arm-toolchain/recipes-devt=
ools/gcc/gcc-arm-8.2/0005-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
> > new file mode 100644
> > index 0000000..8b1b976
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0005-gcc-4.3=
.3-SYSROOT_CFLAGS_FOR_TARGET.patch
> > @@ -0,0 +1,73 @@
> > +From ae3fe6e5e50937de6e4223ca90810187372a8cf5 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:08:31 +0400
> > +Subject: [PATCH 05/39] gcc-4.3.3: SYSROOT_CFLAGS_FOR_TARGET
> > +
> > +Before committing, I noticed that PR/32161 was marked as a dup of PR/=
32009, but my previous patch did not fix it.
> > +
> > +This alternative patch is better because it lets you just use CFLAGS_=
FOR_TARGET to set the compilation flags for libgcc. Since bootstrapped targ=
et libraries are never compiled with the native compiler, it makes little s=
ense to use different flags for stage1 and later stages. And it also makes =
little sense to use a different variable than CFLAGS_FOR_TARGET.
> > +
> > +Other changes I had to do include:
> > +
> > +- moving the creation of default CFLAGS_FOR_TARGET from Makefile.am t=
o configure.ac, because otherwise the BOOT_CFLAGS are substituted into CFLA=
GS_FOR_TARGET (which is "-O2 -g $(CFLAGS)") via $(CFLAGS). It is also clean=
er this way though.
> > +
> > +- passing the right CFLAGS to configure scripts as exported environme=
nt variables
> > +
> > +I also stopped passing LIBCFLAGS to configure scripts since they are =
unused in the whole src tree. And I updated the documentation as H-P remind=
ed me to do.
> > +
> > +Bootstrapped/regtested i686-pc-linux-gnu, will commit to 4.4 shortly.=
 Ok for 4.3?
> > +
> > +Signed-off-by: Paolo Bonzini  <bonzini@gnu.org>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Pending
> > +---
> > + configure | 32 ++++++++++++++++++++++++++++++++
> > + 1 file changed, 32 insertions(+)
> > +
> > +diff --git a/configure b/configure
> > +index 517fb70192e..acd2b97df40 100755
> > +--- a/configure
> > ++++ b/configure
> > +@@ -6772,6 +6772,38 @@ fi
> > +
> > +
> > +
> > ++# During gcc bootstrap, if we use some random cc for stage1 then CFL=
AGS
> > ++# might be empty or "-g".  We don't require a C++ compiler, so CXXFL=
AGS
> > ++# might also be empty (or "-g", if a non-GCC C++ compiler is in the =
path).
> > ++# We want to ensure that TARGET libraries (which we know are built w=
ith
> > ++# gcc) are built with "-O2 -g", so include those options when settin=
g
> > ++# CFLAGS_FOR_TARGET and CXXFLAGS_FOR_TARGET.
> > ++if test "x$CFLAGS_FOR_TARGET" =3D x; then
> > ++  CFLAGS_FOR_TARGET=3D$CFLAGS
> > ++  case " $CFLAGS " in
> > ++    *" -O2 "*) ;;
> > ++    *) CFLAGS_FOR_TARGET=3D"-O2 $CFLAGS" ;;
> > ++  esac
> > ++  case " $CFLAGS " in
> > ++    *" -g "* | *" -g3 "*) ;;
> > ++    *) CFLAGS_FOR_TARGET=3D"-g $CFLAGS" ;;
> > ++  esac
> > ++fi
> > ++
> > ++
> > ++if test "x$CXXFLAGS_FOR_TARGET" =3D x; then
> > ++  CXXFLAGS_FOR_TARGET=3D$CXXFLAGS
> > ++  case " $CXXFLAGS " in
> > ++    *" -O2 "*) ;;
> > ++    *) CXXFLAGS_FOR_TARGET=3D"-O2 $CXXFLAGS" ;;
> > ++  esac
> > ++  case " $CXXFLAGS " in
> > ++    *" -g "* | *" -g3 "*) ;;
> > ++    *) CXXFLAGS_FOR_TARGET=3D"-g $CXXFLAGS" ;;
> > ++  esac
> > ++fi
> > ++
> > ++
> > + # Handle --with-headers=3DXXX.  If the value is not "yes", the conte=
nts of
> > + # the named directory are copied to $(tooldir)/sys-include.
> > + if test x"${with_headers}" !=3D x && test x"${with_headers}" !=3D xn=
o ; then
> > +--
> > +2.17.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0006-=
64-bit-multilib-hack.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-ar=
m-8.2/0006-64-bit-multilib-hack.patch
> > new file mode 100644
> > index 0000000..0dce95c
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0006-64-bit-=
multilib-hack.patch
> > @@ -0,0 +1,85 @@
> > +From 89af3b7399313b337f06c19cc2d787aa16d27711 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:10:06 +0400
> > +Subject: [PATCH 06/39] 64-bit multilib hack.
> > +
> > +GCC has internal multilib handling code but it assumes a very specifi=
c rigid directory
> > +layout. The build system implementation of multilib layout is very ge=
neric and allows
> > +complete customisation of the library directories.
> > +
> > +This patch is a partial solution to allow any custom directories to b=
e passed into gcc
> > +and handled correctly. It forces gcc to use the base_libdir (which is=
 the current
> > +directory, "."). We need to do this for each multilib that is configu=
red as we don't
> > +know which compiler options may be being passed into the compiler. Si=
nce we have a compiler
> > +per mulitlib at this point that isn't an issue.
> > +
> > +The one problem is the target compiler is only going to work for the =
default multlilib at
> > +this point. Ideally we'd figure out which multilibs were being enable=
d with which paths
> > +and be able to patch these entries with a complete set of correct pat=
hs but this we
> > +don't have such code at this point. This is something the target gcc =
recipe should do
> > +and override these platform defaults in its build config.
> > +
> > +RP 15/8/11
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
> > +
> > +Upstream-Status: Pending
> > +---
> > + gcc/config/i386/t-linux64   |  6 ++----
> > + gcc/config/mips/t-linux64   | 10 +++-------
> > + gcc/config/rs6000/t-linux64 |  5 ++---
> > + 3 files changed, 7 insertions(+), 14 deletions(-)
> > +
> > +diff --git a/gcc/config/i386/t-linux64 b/gcc/config/i386/t-linux64
> > +index 8ea0faff369..266c6008004 100644
> > +--- a/gcc/config/i386/t-linux64
> > ++++ b/gcc/config/i386/t-linux64
> > +@@ -32,7 +32,5 @@
> > + #
> > + comma=3D,
> > + MULTILIB_OPTIONS    =3D $(subst $(comma),/,$(TM_MULTILIB_CONFIG))
> > +-MULTILIB_DIRNAMES   =3D $(patsubst m%, %, $(subst /, ,$(MULTILIB_OPT=
IONS)))
> > +-MULTILIB_OSDIRNAMES =3D m64=3D../lib64$(call if_multiarch,:x86_64-li=
nux-gnu)
> > +-MULTILIB_OSDIRNAMES+=3D m32=3D$(if $(wildcard $(shell echo $(SYSTEM_=
HEADER_DIR))/../../usr/lib32),../lib32,../lib)$(call if_multiarch,:i386-lin=
ux-gnu)
> > +-MULTILIB_OSDIRNAMES+=3D mx32=3D../libx32$(call if_multiarch,:x86_64-=
linux-gnux32)
> > ++MULTILIB_DIRNAMES =3D . .
> > ++MULTILIB_OSDIRNAMES =3D ../$(shell basename $(base_libdir)) ../$(she=
ll basename $(base_libdir))
> > +diff --git a/gcc/config/mips/t-linux64 b/gcc/config/mips/t-linux64
> > +index c017b7d04c5..126892cf40b 100644
> > +--- a/gcc/config/mips/t-linux64
> > ++++ b/gcc/config/mips/t-linux64
> > +@@ -17,10 +17,6 @@
> > + # <http://www.gnu.org/licenses/>.
> > +
> > + MULTILIB_OPTIONS =3D mabi=3Dn32/mabi=3D32/mabi=3D64
> > +-MULTILIB_DIRNAMES =3D n32 32 64
> > +-MIPS_EL =3D $(if $(filter %el, $(firstword $(subst -, ,$(target)))),=
el)
> > +-MIPS_SOFT =3D $(if $(strip $(filter MASK_SOFT_FLOAT_ABI, $(target_cp=
u_default)) $(filter soft, $(with_float))),soft)
> > +-MULTILIB_OSDIRNAMES =3D \
> > +-    ../lib32$(call if_multiarch,:mips64$(MIPS_EL)-linux-gnuabin32$(M=
IPS_SOFT)) \
> > +-    ../lib$(call if_multiarch,:mips$(MIPS_EL)-linux-gnu$(MIPS_SOFT))=
 \
> > +-    ../lib64$(call if_multiarch,:mips64$(MIPS_EL)-linux-gnuabi64$(MI=
PS_SOFT))
> > ++MULTILIB_DIRNAMES =3D . . .
> > ++MULTILIB_OSDIRNAMES =3D ../$(shell basename $(base_libdir)) ../$(she=
ll basename $(base_libdir)) ../$(shell basename $(base_libdir))
> > ++
> > +diff --git a/gcc/config/rs6000/t-linux64 b/gcc/config/rs6000/t-linux6=
4
> > +index 0faa2a02df4..13fd8ca971e 100644
> > +--- a/gcc/config/rs6000/t-linux64
> > ++++ b/gcc/config/rs6000/t-linux64
> > +@@ -26,10 +26,9 @@
> > + # MULTILIB_OSDIRNAMES according to what is found on the target.
> > +
> > + MULTILIB_OPTIONS    :=3D m64/m32
> > +-MULTILIB_DIRNAMES   :=3D 64 32
> > ++MULTILIB_DIRNAMES   :=3D . .
> > + MULTILIB_EXTRA_OPTS :=3D
> > +-MULTILIB_OSDIRNAMES :=3D m64=3D../lib64$(call if_multiarch,:powerpc6=
4-linux-gnu)
> > +-MULTILIB_OSDIRNAMES +=3D m32=3D$(if $(wildcard $(shell echo $(SYSTEM=
_HEADER_DIR))/../../usr/lib32),../lib32,../lib)$(call if_multiarch,:powerpc=
-linux-gnu)
> > ++MULTILIB_OSDIRNAMES :=3D ../$(shell basename $(base_libdir)) ../$(sh=
ell basename $(base_libdir))
> > +
> > + rs6000-linux.o: $(srcdir)/config/rs6000/rs6000-linux.c
> > +     $(COMPILE) $<
> > +--
> > +2.17.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0007-=
optional-libstdc.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0007-optional-libstdc.patch
> > new file mode 100644
> > index 0000000..721ea03
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0007-optiona=
l-libstdc.patch
> > @@ -0,0 +1,125 @@
> > +From fb7df63e9548c29b70601d642a1850fc455f8565 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:12:56 +0400
> > +Subject: [PATCH 07/39] optional libstdc
> > +
> > +gcc-runtime builds libstdc++ separately from gcc-cross-*. Its configu=
re tests using g++
> > +will not run correctly since by default the linker will try to link a=
gainst libstdc++
> > +which shouldn't exist yet. We need an option to disable -lstdc++
> > +option whilst leaving -lc, -lgcc and other automatic library dependen=
cies added by gcc
> > +driver. This patch adds such an option which only disables the -lstdc=
++.
> > +
> > +A "standard" gcc build uses xgcc and hence avoids this. We should ask=
 upstream how to
> > +do this officially, the likely answer is don't build libstdc++ separa=
tely.
> > +
> > +RP 29/6/10
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Inappropriate [embedded specific]
> > +---
> > + gcc/c-family/c.opt  |  4 ++++
> > + gcc/cp/g++spec.c    |  1 +
> > + gcc/doc/invoke.texi | 32 +++++++++++++++++++++++++++++++-
> > + gcc/gcc.c           |  1 +
> > + 4 files changed, 37 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/gcc/c-family/c.opt b/gcc/c-family/c.opt
> > +index 5013501b232..6312f2c8f90 100644
> > +--- a/gcc/c-family/c.opt
> > ++++ b/gcc/c-family/c.opt
> > +@@ -1900,6 +1900,10 @@ nostdinc++
> > + C++ ObjC++
> > + Do not search standard system include directories for C++.
> > +
> > ++nostdlib++
> > ++Driver
> > ++Do not link standard C++ runtime library
> > ++
> > + o
> > + C ObjC C++ ObjC++ Joined Separate
> > + ; Documented in common.opt
> > +diff --git a/gcc/cp/g++spec.c b/gcc/cp/g++spec.c
> > +index 443a1746da3..e9b51be62ef 100644
> > +--- a/gcc/cp/g++spec.c
> > ++++ b/gcc/cp/g++spec.c
> > +@@ -137,6 +137,7 @@ lang_specific_driver (struct cl_decoded_option **=
in_decoded_options,
> > +       switch (decoded_options[i].opt_index)
> > +     {
> > +     case OPT_nostdlib:
> > ++    case OPT_nostdlib__:
> > +     case OPT_nodefaultlibs:
> > +       library =3D -1;
> > +       break;
> > +diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
> > +index cb71b60fe3c..b0d481e3a30 100644
> > +--- a/gcc/doc/invoke.texi
> > ++++ b/gcc/doc/invoke.texi
> > +@@ -211,6 +211,9 @@ in the following sections.
> > + -fno-weak  -nostdinc++ @gol
> > + -fvisibility-inlines-hidden @gol
> > + -fvisibility-ms-compat @gol
> > ++-fvtable-verify=3D@r{[}std@r{|}preinit@r{|}none@r{]} @gol
> > ++-fvtv-counts -fvtv-debug @gol
> > ++-nostdlib++ @gol
> > + -fext-numeric-literals @gol
> > + -Wabi=3D@var{n}  -Wabi-tag  -Wconversion-null  -Wctor-dtor-privacy @=
gol
> > + -Wdelete-non-virtual-dtor  -Wliteral-suffix  -Wmultiple-inheritance =
@gol
> > +@@ -509,7 +512,7 @@ Objective-C and Objective-C++ Dialects}.
> > + -s  -static -static-pie -static-libgcc  -static-libstdc++ @gol
> > + -static-libasan  -static-libtsan  -static-liblsan  -static-libubsan =
@gol
> > + -static-libmpx  -static-libmpxwrappers @gol
> > +--shared  -shared-libgcc  -symbolic @gol
> > ++-shared  -shared-libgcc  -symbolic -nostdlib++ @gol
> > + -T @var{script}  -Wl,@var{option}  -Xlinker @var{option} @gol
> > + -u @var{symbol}  -z @var{keyword}}
> > +
> > +@@ -12331,6 +12334,33 @@ library subroutines.
> > + constructors are called; @pxref{Collect2,,@code{collect2}, gccint,
> > + GNU Compiler Collection (GCC) Internals}.)
> > +
> > ++@item -nostdlib++
> > ++@opindex nostdlib++
> > ++Do not use the standard system C++ runtime libraries when linking.
> > ++Only the libraries you specify will be passed to the linker.
> > ++
> > ++@cindex @option{-lgcc}, use with @option{-nostdlib}
> > ++@cindex @option{-nostdlib} and unresolved references
> > ++@cindex unresolved references and @option{-nostdlib}
> > ++@cindex @option{-lgcc}, use with @option{-nodefaultlibs}
> > ++@cindex @option{-nodefaultlibs} and unresolved references
> > ++@cindex unresolved references and @option{-nodefaultlibs}
> > ++One of the standard libraries bypassed by @option{-nostdlib} and
> > ++@option{-nodefaultlibs} is @file{libgcc.a}, a library of internal su=
broutines
> > ++which GCC uses to overcome shortcomings of particular machines, or s=
pecial
> > ++needs for some languages.
> > ++(@xref{Interface,,Interfacing to GCC Output,gccint,GNU Compiler
> > ++Collection (GCC) Internals},
> > ++for more discussion of @file{libgcc.a}.)
> > ++In most cases, you need @file{libgcc.a} even when you want to avoid
> > ++other standard libraries.  In other words, when you specify @option{=
-nostdlib}
> > ++or @option{-nodefaultlibs} you should usually specify @option{-lgcc}=
 as well.
> > ++This ensures that you have no unresolved references to internal GCC
> > ++library subroutines.
> > ++(An example of such an internal subroutine is @code{__main}, used to=
 ensure C++
> > ++constructors are called; @pxref{Collect2,,@code{collect2}, gccint,
> > ++GNU Compiler Collection (GCC) Internals}.)
> > ++
> > + @item -pie
> > + @opindex pie
> > + Produce a dynamically linked position independent executable on targ=
ets
> > +diff --git a/gcc/gcc.c b/gcc/gcc.c
> > +index 02b3cd39fc2..8cd27a5dad5 100644
> > +--- a/gcc/gcc.c
> > ++++ b/gcc/gcc.c
> > +@@ -1047,6 +1047,7 @@ proper position among the other output files.  =
*/
> > +     %(mflib) " STACK_SPLIT_SPEC "\
> > +     %{fprofile-arcs|fprofile-generate*|coverage:-lgcov} " SANITIZER_=
SPEC " \
> > +     %{!nostdlib:%{!nodefaultlibs:%(link_ssp) %(link_gcc_c_sequence)}=
}\
> > ++    %{!nostdlib++:}\
> > +     %{!nostdlib:%{!nostartfiles:%E}} %{T*}  \n%(post_link) }}}}}}"
> > + #endif
> > +
> > +--
> > +2.17.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0008-=
gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch b/meta-arm-toolchain/recipes-dev=
tools/gcc/gcc-arm-8.2/0008-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
> > new file mode 100644
> > index 0000000..a76b7f7
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0008-gcc-dis=
able-MASK_RELAX_PIC_CALLS-bit.patch
> > @@ -0,0 +1,59 @@
> > +From 11eb97efccb90b830c84ed077a25b1a15ad3335b Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:14:20 +0400
> > +Subject: [PATCH 08/39] gcc: disable MASK_RELAX_PIC_CALLS bit
> > +
> > +The new feature added after 4.3.3
> > +"http://www.pubbs.net/200909/gcc/94048-patch-add-support-for-rmipsjal=
r.html"
> > +will cause cc1plus eat up all the system memory when build webkit-gtk=
.
> > +The function mips_get_pic_call_symbol keeps on recursively calling it=
self.
> > +Disable this feature to walk aside the bug.
> > +
> > +Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Inappropriate [configuration]
> > +---
> > + gcc/configure    | 7 -------
> > + gcc/configure.ac | 7 -------
> > + 2 files changed, 14 deletions(-)
> > +
> > +diff --git a/gcc/configure b/gcc/configure
> > +index cafd05fd150..19ba051d673 100755
> > +--- a/gcc/configure
> > ++++ b/gcc/configure
> > +@@ -27553,13 +27553,6 @@ $as_echo_n "checking assembler and linker fo=
r explicit JALR relocation... " >&6;
> > +         rm -f conftest.*
> > +       fi
> > +     fi
> > +-    if test $gcc_cv_as_ld_jalr_reloc =3D yes; then
> > +-      if test x$target_cpu_default =3D x; then
> > +-        target_cpu_default=3DMASK_RELAX_PIC_CALLS
> > +-      else
> > +-        target_cpu_default=3D"($target_cpu_default)|MASK_RELAX_PIC_C=
ALLS"
> > +-      fi
> > +-    fi
> > +     { $as_echo "$as_me:${as_lineno-$LINENO}: result: $gcc_cv_as_ld_j=
alr_reloc" >&5
> > + $as_echo "$gcc_cv_as_ld_jalr_reloc" >&6; }
> > +
> > +diff --git a/gcc/configure.ac b/gcc/configure.ac
> > +index dd5b38195ce..066dfe19bb6 100644
> > +--- a/gcc/configure.ac
> > ++++ b/gcc/configure.ac
> > +@@ -4798,13 +4798,6 @@ x:
> > +         rm -f conftest.*
> > +       fi
> > +     fi
> > +-    if test $gcc_cv_as_ld_jalr_reloc =3D yes; then
> > +-      if test x$target_cpu_default =3D x; then
> > +-        target_cpu_default=3DMASK_RELAX_PIC_CALLS
> > +-      else
> > +-        target_cpu_default=3D"($target_cpu_default)|MASK_RELAX_PIC_C=
ALLS"
> > +-      fi
> > +-    fi
> > +     AC_MSG_RESULT($gcc_cv_as_ld_jalr_reloc)
> > +
> > +     AC_CACHE_CHECK([linker for .eh_frame personality relaxation],
> > +--
> > +2.17.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0009-=
COLLECT_GCC_OPTIONS.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm=
-8.2/0009-COLLECT_GCC_OPTIONS.patch
> > new file mode 100644
> > index 0000000..3abece0
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0009-COLLECT=
_GCC_OPTIONS.patch
> > @@ -0,0 +1,38 @@
> > +From e19d25847f08eeb5ef26a031fa5eff732bfd0d43 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:16:28 +0400
> > +Subject: [PATCH 09/39] COLLECT_GCC_OPTIONS
> > +
> > +This patch adds --sysroot into COLLECT_GCC_OPTIONS which is used to
> > +invoke collect2.
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Pending
> > +---
> > + gcc/gcc.c | 9 +++++++++
> > + 1 file changed, 9 insertions(+)
> > +
> > +diff --git a/gcc/gcc.c b/gcc/gcc.c
> > +index 8cd27a5dad5..d355d65583a 100644
> > +--- a/gcc/gcc.c
> > ++++ b/gcc/gcc.c
> > +@@ -4677,6 +4677,15 @@ set_collect_gcc_options (void)
> > +             sizeof ("COLLECT_GCC_OPTIONS=3D") - 1);
> > +
> > +   first_time =3D TRUE;
> > ++#ifdef HAVE_LD_SYSROOT
> > ++  if (target_system_root_changed && target_system_root)
> > ++    {
> > ++      obstack_grow (&collect_obstack, "'--sysroot=3D", sizeof("'--sy=
sroot=3D")-1);
> > ++      obstack_grow (&collect_obstack, target_system_root,strlen(targ=
et_system_root));
> > ++      obstack_grow (&collect_obstack, "'", 1);
> > ++      first_time =3D FALSE;
> > ++    }
> > ++#endif
> > +   for (i =3D 0; (int) i < n_switches; i++)
> > +     {
> > +       const char *const *args;
> > +--
> > +2.17.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0010-=
Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch b/meta-arm-toolcha=
in/recipes-devtools/gcc/gcc-arm-8.2/0010-Use-the-defaults.h-in-B-instead-of=
-S-and-t-oe-in-B.patch
> > new file mode 100644
> > index 0000000..5785b58
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0010-Use-the=
-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
> > @@ -0,0 +1,96 @@
> > +From 265cb883c310f3bb7e49fd13b81362476fbeb6c1 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:17:25 +0400
> > +Subject: [PATCH 10/39] Use the defaults.h in ${B} instead of ${S}, an=
d t-oe in
> > + ${B}
> > +
> > +Use the defaults.h in ${B} instead of ${S}, and t-oe in ${B}, so that
> > +the source can be shared between gcc-cross-initial,
> > +gcc-cross-intermediate, gcc-cross, gcc-runtime, and also the sdk buil=
d.
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Pending
> > +
> > +While compiling gcc-crosssdk-initial-x86_64 on some host, there is
> > +occasionally failure that test the existance of default.h doesn't
> > +work, the reason is tm_include_list=3D'** defaults.h' rather than
> > +tm_include_list=3D'** ./defaults.h'
> > +
> > +So we add the test condition for this situation.
> > +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > +---
> > + gcc/Makefile.in  | 2 +-
> > + gcc/configure    | 4 ++--
> > + gcc/configure.ac | 4 ++--
> > + gcc/mkconfig.sh  | 4 ++--
> > + 4 files changed, 7 insertions(+), 7 deletions(-)
> > +
> > +diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> > +index 20bee0494b1..1367136bfac 100644
> > +--- a/gcc/Makefile.in
> > ++++ b/gcc/Makefile.in
> > +@@ -538,7 +538,7 @@ TARGET_SYSTEM_ROOT =3D @TARGET_SYSTEM_ROOT@
> > + TARGET_SYSTEM_ROOT_DEFINE =3D @TARGET_SYSTEM_ROOT_DEFINE@
> > +
> > + xmake_file=3D@xmake_file@
> > +-tmake_file=3D@tmake_file@
> > ++tmake_file=3D@tmake_file@ ./t-oe
> > + TM_ENDIAN_CONFIG=3D@TM_ENDIAN_CONFIG@
> > + TM_MULTILIB_CONFIG=3D@TM_MULTILIB_CONFIG@
> > + TM_MULTILIB_EXCEPTIONS_CONFIG=3D@TM_MULTILIB_EXCEPTIONS_CONFIG@
> > +diff --git a/gcc/configure b/gcc/configure
> > +index 19ba051d673..a575839c1b2 100755
> > +--- a/gcc/configure
> > ++++ b/gcc/configure
> > +@@ -12158,8 +12158,8 @@ for f in $tm_file; do
> > +        tm_include_list=3D"${tm_include_list} $f"
> > +        ;;
> > +     defaults.h )
> > +-       tm_file_list=3D"${tm_file_list} \$(srcdir)/$f"
> > +-       tm_include_list=3D"${tm_include_list} $f"
> > ++       tm_file_list=3D"${tm_file_list} ./$f"
> > ++       tm_include_list=3D"${tm_include_list} ./$f"
> > +        ;;
> > +     * )
> > +        tm_file_list=3D"${tm_file_list} \$(srcdir)/config/$f"
> > +diff --git a/gcc/configure.ac b/gcc/configure.ac
> > +index 066dfe19bb6..676116a6d96 100644
> > +--- a/gcc/configure.ac
> > ++++ b/gcc/configure.ac
> > +@@ -1922,8 +1922,8 @@ for f in $tm_file; do
> > +        tm_include_list=3D"${tm_include_list} $f"
> > +        ;;
> > +     defaults.h )
> > +-       tm_file_list=3D"${tm_file_list} \$(srcdir)/$f"
> > +-       tm_include_list=3D"${tm_include_list} $f"
> > ++       tm_file_list=3D"${tm_file_list} ./$f"
> > ++       tm_include_list=3D"${tm_include_list} ./$f"
> > +        ;;
> > +     * )
> > +        tm_file_list=3D"${tm_file_list} \$(srcdir)/config/$f"
> > +diff --git a/gcc/mkconfig.sh b/gcc/mkconfig.sh
> > +index 0f75c863c0b..68d8d6613cf 100644
> > +--- a/gcc/mkconfig.sh
> > ++++ b/gcc/mkconfig.sh
> > +@@ -77,7 +77,7 @@ if [ -n "$HEADERS" ]; then
> > +     if [ $# -ge 1 ]; then
> > +     echo '#ifdef IN_GCC' >> ${output}T
> > +     for file in "$@"; do
> > +-        if test x"$file" =3D x"defaults.h"; then
> > ++        if test x"$file" =3D x"./defaults.h" -o x"$file" =3D x"defau=
lts.h"; then
> > +             postpone_defaults_h=3D"yes"
> > +         else
> > +             echo "# include \"$file\"" >> ${output}T
> > +@@ -106,7 +106,7 @@ esac
> > +
> > + # If we postponed including defaults.h, add the #include now.
> > + if test x"$postpone_defaults_h" =3D x"yes"; then
> > +-    echo "# include \"defaults.h\"" >> ${output}T
> > ++    echo "# include \"./defaults.h\"" >> ${output}T
> > + fi
> > +
> > + # Add multiple inclusion protection guard, part two.
> > +--
> > +2.17.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0011-=
fortran-cross-compile-hack.patch b/meta-arm-toolchain/recipes-devtools/gcc/=
gcc-arm-8.2/0011-fortran-cross-compile-hack.patch
> > new file mode 100644
> > index 0000000..fe0fb7d
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0011-fortran=
-cross-compile-hack.patch
> > @@ -0,0 +1,46 @@
> > +From 71cba188d47b6ae9d9b87261eb4bc9eb68ae355d Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:20:01 +0400
> > +Subject: [PATCH 11/39] fortran cross-compile hack.
> > +
> > +* Fortran would have searched for arm-angstrom-gnueabi-gfortran but w=
ould have used
> > +used gfortan. For gcc_4.2.2.bb we want to use the gfortran compiler f=
rom our cross
> > +directory.
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Inappropriate [embedded specific]
> > +---
> > + libgfortran/configure    | 2 +-
> > + libgfortran/configure.ac | 2 +-
> > + 2 files changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/libgfortran/configure b/libgfortran/configure
> > +index 91fce8fecd0..6747f86eb98 100755
> > +--- a/libgfortran/configure
> > ++++ b/libgfortran/configure
> > +@@ -12883,7 +12883,7 @@ esac
> > +
> > + # We need gfortran to compile parts of the library
> > + #AC_PROG_FC(gfortran)
> > +-FC=3D"$GFORTRAN"
> > ++#FC=3D"$GFORTRAN"
> > + ac_ext=3D${ac_fc_srcext-f}
> > + ac_compile=3D'$FC -c $FCFLAGS $ac_fcflags_srcext conftest.$ac_ext >&=
5'
> > + ac_link=3D'$FC -o conftest$ac_exeext $FCFLAGS $LDFLAGS $ac_fcflags_s=
rcext conftest.$ac_ext $LIBS >&5'
> > +diff --git a/libgfortran/configure.ac b/libgfortran/configure.ac
> > +index bf6d3634dda..9dbe43cc616 100644
> > +--- a/libgfortran/configure.ac
> > ++++ b/libgfortran/configure.ac
> > +@@ -250,7 +250,7 @@ AC_SUBST(enable_static)
> > +
> > + # We need gfortran to compile parts of the library
> > + #AC_PROG_FC(gfortran)
> > +-FC=3D"$GFORTRAN"
> > ++#FC=3D"$GFORTRAN"
> > + AC_PROG_FC(gfortran)
> > +
> > + # extra LD Flags which are required for targets
> > +--
> > +2.17.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0012-=
cpp-honor-sysroot.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8=
.2/0012-cpp-honor-sysroot.patch
> > new file mode 100644
> > index 0000000..961f96f
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0012-cpp-hon=
or-sysroot.patch
> > @@ -0,0 +1,54 @@
> > +From b3e8e7e8ae106e3207e9edc3d23dcce1464b755f Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:22:00 +0400
> > +Subject: [PATCH 12/39] cpp: honor sysroot.
> > +
> > +Currently, if the gcc toolchain is relocated and installed from sstat=
e, then you try and compile
> > +preprocessed source (.i or .ii files), the compiler will try and acce=
ss the builtin sysroot location
> > +rather than the --sysroot option specified on the commandline. If acc=
ess to that directory is
> > +permission denied (unreadable), gcc will error.
> > +
> > +This happens when ccache is in use due to the fact it uses preprocess=
ed source files.
> > +
> > +The fix below adds %I to the cpp-output spec macro so the default sub=
stitutions for -iprefix,
> > +-isystem, -isysroot happen and the correct sysroot is used.
> > +
> > +[YOCTO #2074]
> > +
> > +RP 2012/04/13
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Pending
> > +---
> > + gcc/cp/lang-specs.h | 2 +-
> > + gcc/gcc.c           | 2 +-
> > + 2 files changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/gcc/cp/lang-specs.h b/gcc/cp/lang-specs.h
> > +index f0802b8915c..f324d299849 100644
> > +--- a/gcc/cp/lang-specs.h
> > ++++ b/gcc/cp/lang-specs.h
> > +@@ -64,5 +64,5 @@ along with GCC; see the file COPYING3.  If not see
> > +   {".ii", "@c++-cpp-output", 0, 0, 0},
> > +   {"@c++-cpp-output",
> > +    "%{!M:%{!MM:%{!E:\
> > +-    cc1plus -fpreprocessed %i %(cc1_options) %2\
> > ++    cc1plus -fpreprocessed %i %I %(cc1_options) %2\
> > +     %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
> > +diff --git a/gcc/gcc.c b/gcc/gcc.c
> > +index d355d65583a..570cdc00034 100644
> > +--- a/gcc/gcc.c
> > ++++ b/gcc/gcc.c
> > +@@ -1343,7 +1343,7 @@ static const struct compiler default_compilers[=
] =3D
> > +                                        %W{o*:--output-pch=3D%*}}%V}}=
}}}}}", 0, 0, 0},
> > +   {".i", "@cpp-output", 0, 0, 0},
> > +   {"@cpp-output",
> > +-   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %(cc1_options) %{!fsyntax-=
only:%(invoke_as)}}}}", 0, 0, 0},
> > ++   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %I %(cc1_options) %{!fsynt=
ax-only:%(invoke_as)}}}}", 0, 0, 0},
> > +   {".s", "@assembler", 0, 0, 0},
> > +   {"@assembler",
> > +    "%{!M:%{!MM:%{!E:%{!S:as %(asm_debug) %(asm_options) %i %A }}}}",=
 0, 0, 0},
> > +--
> > +2.17.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0013-=
MIPS64-Default-to-N64-ABI.patch b/meta-arm-toolchain/recipes-devtools/gcc/g=
cc-arm-8.2/0013-MIPS64-Default-to-N64-ABI.patch
> > new file mode 100644
> > index 0000000..8ef8806
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0013-MIPS64-=
Default-to-N64-ABI.patch
> > @@ -0,0 +1,57 @@
> > +From 0f3629978cd7c98614e87d4fd190b89864221631 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:23:08 +0400
> > +Subject: [PATCH 13/39] MIPS64: Default to N64 ABI
> > +
> > +MIPS64 defaults to n32 ABI, this patch makes it
> > +so that it defaults to N64 ABI
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Inappropriate [OE config specific]
> > +---
> > + gcc/config.gcc | 10 +++++-----
> > + 1 file changed, 5 insertions(+), 5 deletions(-)
> > +
> > +diff --git a/gcc/config.gcc b/gcc/config.gcc
> > +index 8741dd1e3b2..2ffcb39d85f 100644
> > +--- a/gcc/config.gcc
> > ++++ b/gcc/config.gcc
> > +@@ -2137,29 +2137,29 @@ mips*-*-linux*)                              =
# Linux MIPS, either endian.
> > +                     default_mips_arch=3Dmips32
> > +                     ;;
> > +             mips64el-st-linux-gnu)
> > +-                    default_mips_abi=3Dn32
> > ++                    default_mips_abi=3D64
> > +                     tm_file=3D"${tm_file} mips/st.h"
> > +                     tmake_file=3D"${tmake_file} mips/t-st"
> > +                     enable_mips_multilibs=3D"yes"
> > +                     ;;
> > +             mips64octeon*-*-linux*)
> > +-                    default_mips_abi=3Dn32
> > ++                    default_mips_abi=3D64
> > +                     tm_defines=3D"${tm_defines} MIPS_CPU_STRING_DEFA=
ULT=3D\\\"octeon\\\""
> > +                     target_cpu_default=3DMASK_SOFT_FLOAT_ABI
> > +                     enable_mips_multilibs=3D"yes"
> > +                     ;;
> > +             mipsisa64r6*-*-linux*)
> > +-                    default_mips_abi=3Dn32
> > ++                    default_mips_abi=3D64
> > +                     default_mips_arch=3Dmips64r6
> > +                     enable_mips_multilibs=3D"yes"
> > +                     ;;
> > +             mipsisa64r2*-*-linux*)
> > +-                    default_mips_abi=3Dn32
> > ++                    default_mips_abi=3D64
> > +                     default_mips_arch=3Dmips64r2
> > +                     enable_mips_multilibs=3D"yes"
> > +                     ;;
> > +             mips64*-*-linux* | mipsisa64*-*-linux*)
> > +-                    default_mips_abi=3Dn32
> > ++                    default_mips_abi=3D64
> > +                     enable_mips_multilibs=3D"yes"
> > +                     ;;
> > +     esac
> > +--
> > +2.17.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0014-=
Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta-arm-toolc=
hain/recipes-devtools/gcc/gcc-arm-8.2/0014-Define-GLIBC_DYNAMIC_LINKER-and-=
UCLIBC_DYNAMIC_LINKE.patch
> > new file mode 100644
> > index 0000000..043bb9d
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0014-Define-=
GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> > @@ -0,0 +1,248 @@
> > +From 53f1c382b1366c5621c8edead9c766950c290fd9 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:24:50 +0400
> > +Subject: [PATCH 14/39] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC=
_LINKER
> > + relative to SYSTEMLIBS_DIR
> > +
> > +This patch defines GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
> > +relative to SYSTEMLIBS_DIR which can be set in generated headers
> > +This breaks the assumption of hardcoded multilib in gcc
> > +Change is only for the supported architectures in OE including
> > +SH, sparc, alpha for possible future support (if any)
> > +
> > +Removes the do_headerfix task in metadata
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Inappropriate [OE configuration]
> > +---
> > + gcc/config/alpha/linux-elf.h |  4 ++--
> > + gcc/config/arm/linux-eabi.h  |  4 ++--
> > + gcc/config/arm/linux-elf.h   |  2 +-
> > + gcc/config/i386/linux.h      |  2 +-
> > + gcc/config/i386/linux64.h    |  6 +++---
> > + gcc/config/linux.h           |  8 ++++----
> > + gcc/config/mips/linux.h      | 12 ++++++------
> > + gcc/config/riscv/linux.h     |  2 +-
> > + gcc/config/rs6000/linux64.h  | 16 ++++++----------
> > + gcc/config/sh/linux.h        |  2 +-
> > + gcc/config/sparc/linux.h     |  2 +-
> > + gcc/config/sparc/linux64.h   |  4 ++--
> > + 12 files changed, 30 insertions(+), 34 deletions(-)
> > +
> > +diff --git a/gcc/config/alpha/linux-elf.h b/gcc/config/alpha/linux-el=
f.h
> > +index 36b74dc1993..02373578af8 100644
> > +--- a/gcc/config/alpha/linux-elf.h
> > ++++ b/gcc/config/alpha/linux-elf.h
> > +@@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.  If not see
> > + #define EXTRA_SPECS \
> > + { "elf_dynamic_linker", ELF_DYNAMIC_LINKER },
> > +
> > +-#define GLIBC_DYNAMIC_LINKER        "/lib/ld-linux.so.2"
> > +-#define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
> > ++#define GLIBC_DYNAMIC_LINKER        SYSTEMLIBS_DIR "ld-linux.so.2"
> > ++#define UCLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-uClibc.so.0"
> > + #if DEFAULT_LIBC =3D=3D LIBC_UCLIBC
> > + #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
> > + #elif DEFAULT_LIBC =3D=3D LIBC_GLIBC
> > +diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.=
h
> > +index 8585fde3d41..b3af68cac57 100644
> > +--- a/gcc/config/arm/linux-eabi.h
> > ++++ b/gcc/config/arm/linux-eabi.h
> > +@@ -62,8 +62,8 @@
> > +    GLIBC_DYNAMIC_LINKER_DEFAULT and TARGET_DEFAULT_FLOAT_ABI.  */
> > +
> > + #undef  GLIBC_DYNAMIC_LINKER
> > +-#define GLIBC_DYNAMIC_LINKER_SOFT_FLOAT "/lib/ld-linux.so.3"
> > +-#define GLIBC_DYNAMIC_LINKER_HARD_FLOAT "/lib/ld-linux-armhf.so.3"
> > ++#define GLIBC_DYNAMIC_LINKER_SOFT_FLOAT SYSTEMLIBS_DIR "ld-linux.so.=
3"
> > ++#define GLIBC_DYNAMIC_LINKER_HARD_FLOAT SYSTEMLIBS_DIR "ld-linux-arm=
hf.so.3"
> > + #define GLIBC_DYNAMIC_LINKER_DEFAULT GLIBC_DYNAMIC_LINKER_SOFT_FLOAT
> > +
> > + #define GLIBC_DYNAMIC_LINKER \
> > +diff --git a/gcc/config/arm/linux-elf.h b/gcc/config/arm/linux-elf.h
> > +index cfcd9cb1a5c..a798e987ecb 100644
> > +--- a/gcc/config/arm/linux-elf.h
> > ++++ b/gcc/config/arm/linux-elf.h
> > +@@ -60,7 +60,7 @@
> > +
> > + #define LIBGCC_SPEC "%{mfloat-abi=3Dsoft*:-lfloat} -lgcc"
> > +
> > +-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
> > ++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
> > +
> > + #define LINUX_TARGET_LINK_SPEC  "%{h*} \
> > +    %{static:-Bstatic} \
> > +diff --git a/gcc/config/i386/linux.h b/gcc/config/i386/linux.h
> > +index 69f97f15b0d..71bc31d9231 100644
> > +--- a/gcc/config/i386/linux.h
> > ++++ b/gcc/config/i386/linux.h
> > +@@ -20,7 +20,7 @@ along with GCC; see the file COPYING3.  If not see
> > + <http://www.gnu.org/licenses/>.  */
> > +
> > + #define GNU_USER_LINK_EMULATION "elf_i386"
> > +-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
> > ++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
> > +
> > + #undef MUSL_DYNAMIC_LINKER
> > + #define MUSL_DYNAMIC_LINKER "/lib/ld-musl-i386.so.1"
> > +diff --git a/gcc/config/i386/linux64.h b/gcc/config/i386/linux64.h
> > +index f2d913e30ac..8725f33d8a5 100644
> > +--- a/gcc/config/i386/linux64.h
> > ++++ b/gcc/config/i386/linux64.h
> > +@@ -27,9 +27,9 @@ see the files COPYING3 and COPYING.RUNTIME respecti=
vely.  If not, see
> > + #define GNU_USER_LINK_EMULATION64 "elf_x86_64"
> > + #define GNU_USER_LINK_EMULATIONX32 "elf32_x86_64"
> > +
> > +-#define GLIBC_DYNAMIC_LINKER32 "/lib/ld-linux.so.2"
> > +-#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux-x86-64.so.2"
> > +-#define GLIBC_DYNAMIC_LINKERX32 "/libx32/ld-linux-x32.so.2"
> > ++#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-linux.so.2"
> > ++#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux-x86-64.so.2"
> > ++#define GLIBC_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ld-linux-x32.so.2"
> > +
> > + #undef MUSL_DYNAMIC_LINKER32
> > + #define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-i386.so.1"
> > +diff --git a/gcc/config/linux.h b/gcc/config/linux.h
> > +index 2ea4ff92c1d..487b0c0923b 100644
> > +--- a/gcc/config/linux.h
> > ++++ b/gcc/config/linux.h
> > +@@ -81,10 +81,10 @@ see the files COPYING3 and COPYING.RUNTIME respec=
tively.  If not, see
> > +    GLIBC_DYNAMIC_LINKER must be defined for each target using them, =
or
> > +    GLIBC_DYNAMIC_LINKER32 and GLIBC_DYNAMIC_LINKER64 for targets
> > +    supporting both 32-bit and 64-bit compilation.  */
> > +-#define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
> > +-#define UCLIBC_DYNAMIC_LINKER32 "/lib/ld-uClibc.so.0"
> > +-#define UCLIBC_DYNAMIC_LINKER64 "/lib/ld64-uClibc.so.0"
> > +-#define UCLIBC_DYNAMIC_LINKERX32 "/lib/ldx32-uClibc.so.0"
> > ++#define UCLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-uClibc.so.0"
> > ++#define UCLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-uClibc.so.0"
> > ++#define UCLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld64-uClibc.so.0"
> > ++#define UCLIBC_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ldx32-uClibc.so.0"
> > + #define BIONIC_DYNAMIC_LINKER "/system/bin/linker"
> > + #define BIONIC_DYNAMIC_LINKER32 "/system/bin/linker"
> > + #define BIONIC_DYNAMIC_LINKER64 "/system/bin/linker64"
> > +diff --git a/gcc/config/mips/linux.h b/gcc/config/mips/linux.h
> > +index 2dfd0c18b90..12057c51b5e 100644
> > +--- a/gcc/config/mips/linux.h
> > ++++ b/gcc/config/mips/linux.h
> > +@@ -22,20 +22,20 @@ along with GCC; see the file COPYING3.  If not se=
e
> > + #define GNU_USER_LINK_EMULATIONN32 "elf32%{EB:b}%{EL:l}tsmipn32"
> > +
> > + #define GLIBC_DYNAMIC_LINKER32 \
> > +-  "%{mnan=3D2008:/lib/ld-linux-mipsn8.so.1;:/lib/ld.so.1}"
> > ++  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld-linux-mipsn8.so.1;:" SYSTEMLIB=
S_DIR "ld.so.1}"
> > + #define GLIBC_DYNAMIC_LINKER64 \
> > +-  "%{mnan=3D2008:/lib64/ld-linux-mipsn8.so.1;:/lib64/ld.so.1}"
> > ++  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld-linux-mipsn8.so.1;:" SYSTEMLIB=
S_DIR "ld.so.1}"
> > + #define GLIBC_DYNAMIC_LINKERN32 \
> > +-  "%{mnan=3D2008:/lib32/ld-linux-mipsn8.so.1;:/lib32/ld.so.1}"
> > ++  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld-linux-mipsn8.so.1;:" SYSTEMLIB=
S_DIR "ld.so.1}"
> > +
> > + #undef UCLIBC_DYNAMIC_LINKER32
> > + #define UCLIBC_DYNAMIC_LINKER32 \
> > +-  "%{mnan=3D2008:/lib/ld-uClibc-mipsn8.so.0;:/lib/ld-uClibc.so.0}"
> > ++  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld-uClibc-mipsn8.so.0;:" SYSTEMLI=
BS_DIR "ld-uClibc.so.0}"
> > + #undef UCLIBC_DYNAMIC_LINKER64
> > + #define UCLIBC_DYNAMIC_LINKER64 \
> > +-  "%{mnan=3D2008:/lib/ld64-uClibc-mipsn8.so.0;:/lib/ld64-uClibc.so.0=
}"
> > ++  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld64-uClibc-mipsn8.so.0;:" SYSTEM=
LIBS_DIR "ld64-uClibc.so.0}"
> > + #define UCLIBC_DYNAMIC_LINKERN32 \
> > +-  "%{mnan=3D2008:/lib32/ld-uClibc-mipsn8.so.0;:/lib32/ld-uClibc.so.0=
}"
> > ++  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld-uClibc-mipsn8.so.0;:" SYSTEMLI=
BS_DIR "ld-uClibc.so.0}"
> > +
> > + #undef MUSL_DYNAMIC_LINKER32
> > + #define MUSL_DYNAMIC_LINKER32 \
> > +diff --git a/gcc/config/riscv/linux.h b/gcc/config/riscv/linux.h
> > +index aa8a28d5d..ebf9551c9 100644
> > +--- a/gcc/config/riscv/linux.h
> > ++++ b/gcc/config/riscv/linux.h
> > +@@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.
> > +     GNU_USER_TARGET_OS_CPP_BUILTINS();                              =
\
> > +   } while (0)
> > +
> > +-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-riscv" XLEN_SPEC "-" ABI=
_SPEC ".so.1"
> > ++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux-riscv" XLEN_SP=
EC "-" ABI_SPEC ".so.1"
> > +
> > + #define MUSL_ABI_SUFFIX \
> > +   "%{mabi=3Dilp32:-sf}" \
> > +diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.=
h
> > +index 90fe6566255..55695dadd91 100644
> > +--- a/gcc/config/rs6000/linux64.h
> > ++++ b/gcc/config/rs6000/linux64.h
> > +@@ -420,16 +420,11 @@ extern int dot_symbols;
> > + #undef      LINK_OS_DEFAULT_SPEC
> > + #define LINK_OS_DEFAULT_SPEC "%(link_os_linux)"
> > +
> > +-#define GLIBC_DYNAMIC_LINKER32 "%(dynamic_linker_prefix)/lib/ld.so.1=
"
> > +-
> > ++#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld.so.1"
> > + #ifdef LINUX64_DEFAULT_ABI_ELFv2
> > +-#define GLIBC_DYNAMIC_LINKER64 \
> > +-"%{mabi=3Delfv1:%(dynamic_linker_prefix)/lib64/ld64.so.1;" \
> > +-":%(dynamic_linker_prefix)/lib64/ld64.so.2}"
> > ++#define GLIBC_DYNAMIC_LINKER64 "%{mabi=3Delfv1:" SYSTEMLIBS_DIR "ld6=
4.so.1;:" SYSTEMLIBS_DIR "ld64.so.2}"
> > + #else
> > +-#define GLIBC_DYNAMIC_LINKER64 \
> > +-"%{mabi=3Delfv2:%(dynamic_linker_prefix)/lib64/ld64.so.2;" \
> > +-":%(dynamic_linker_prefix)/lib64/ld64.so.1}"
> > ++#define GLIBC_DYNAMIC_LINKER64 "%{mabi=3Delfv2:" SYSTEMLIBS_DIR "ld6=
4.so.2;:" SYSTEMLIBS_DIR "ld64.so.1}"
> > + #endif
> > +
> > + #define MUSL_DYNAMIC_LINKER32 \
> > +@@ -437,8 +432,9 @@ extern int dot_symbols;
> > + #define MUSL_DYNAMIC_LINKER64 \
> > +   "/lib/ld-musl-powerpc64" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}=
.so.1"
> > +
> > +-#define UCLIBC_DYNAMIC_LINKER32 "/lib/ld-uClibc.so.0"
> > +-#define UCLIBC_DYNAMIC_LINKER64 "/lib/ld64-uClibc.so.0"
> > ++#define UCLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-uClibc.so.0"
> > ++#define UCLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld64-uClibc.so.0"
> > ++
> > + #if DEFAULT_LIBC =3D=3D LIBC_UCLIBC
> > + #define CHOOSE_DYNAMIC_LINKER(G, U, M) \
> > +   "%{mglibc:" G ";:%{mmusl:" M ";:" U "}}"
> > +diff --git a/gcc/config/sh/linux.h b/gcc/config/sh/linux.h
> > +index 6d2ccd012ba..ec78a89ce15 100644
> > +--- a/gcc/config/sh/linux.h
> > ++++ b/gcc/config/sh/linux.h
> > +@@ -64,7 +64,7 @@ along with GCC; see the file COPYING3.  If not see
> > +   "/lib/ld-musl-sh" MUSL_DYNAMIC_LINKER_E MUSL_DYNAMIC_LINKER_FP \
> > +   "%{mfdpic:-fdpic}.so.1"
> > +
> > +-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
> > ++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
> > +
> > + #undef SUBTARGET_LINK_EMUL_SUFFIX
> > + #define SUBTARGET_LINK_EMUL_SUFFIX "%{mfdpic:_fd;:_linux}"
> > +diff --git a/gcc/config/sparc/linux.h b/gcc/config/sparc/linux.h
> > +index 9fb03af0fe9..401fddbbb22 100644
> > +--- a/gcc/config/sparc/linux.h
> > ++++ b/gcc/config/sparc/linux.h
> > +@@ -83,7 +83,7 @@ extern const char *host_detect_local_cpu (int argc,=
 const char **argv);
> > +    When the -shared link option is used a final link is not being
> > +    done.  */
> > +
> > +-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
> > ++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
> > +
> > + #undef  LINK_SPEC
> > + #define LINK_SPEC "-m elf32_sparc %{shared:-shared} \
> > +diff --git a/gcc/config/sparc/linux64.h b/gcc/config/sparc/linux64.h
> > +index c1fe42165b7..26a79bfa2e3 100644
> > +--- a/gcc/config/sparc/linux64.h
> > ++++ b/gcc/config/sparc/linux64.h
> > +@@ -84,8 +84,8 @@ along with GCC; see the file COPYING3.  If not see
> > +    When the -shared link option is used a final link is not being
> > +    done.  */
> > +
> > +-#define GLIBC_DYNAMIC_LINKER32 "/lib/ld-linux.so.2"
> > +-#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux.so.2"
> > ++#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-linux.so.2"
> > ++#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux.so.2"
> > +
> > + #ifdef SPARC_BI_ARCH
> > +
> > +--
> > +2.17.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0015-=
gcc-Fix-argument-list-too-long-error.patch b/meta-arm-toolchain/recipes-dev=
tools/gcc/gcc-arm-8.2/0015-gcc-Fix-argument-list-too-long-error.patch
> > new file mode 100644
> > index 0000000..4bff842
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0015-gcc-Fix=
-argument-list-too-long-error.patch
> > @@ -0,0 +1,40 @@
> > +From 2e75a14cd60227e036790184f0eb400abc3c870b Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:26:37 +0400
> > +Subject: [PATCH 15/39] gcc: Fix argument list too long error.
> > +
> > +There would be an "Argument list too long" error when the
> > +build directory is longer than 200, this is caused by:
> > +
> > +headers=3D`echo $(PLUGIN_HEADERS) | tr ' ' '\012' | sort -u`
> > +
> > +The PLUGIN_HEADERS is too long before sort, so the "echo" can't handl=
e
> > +it, use the $(sort list) of GNU make which can handle the too long li=
st
> > +would fix the problem, the header would be short enough after sorted.
> > +The "tr ' ' '\012'" was used for translating the space to "\n", the
> > +$(sort list) doesn't need this.
> > +
> > +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Pending
> > +---
> > + gcc/Makefile.in | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> > +index 1367136bfac..71a8275c39f 100644
> > +--- a/gcc/Makefile.in
> > ++++ b/gcc/Makefile.in
> > +@@ -3538,7 +3538,7 @@ install-plugin: installdirs lang.install-plugin=
 s-header-vars install-gengtype
> > + # We keep the directory structure for files in config or c-family an=
d .def
> > + # files. All other files are flattened to a single directory.
> > +     $(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
> > +-    headers=3D`echo $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.de=
f) | tr ' ' '\012' | sort -u`; \
> > ++    headers=3D"$(sort $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.=
def))"; \
> > +     srcdirstrip=3D`echo "$(srcdir)" | sed 's/[].[^$$\\*|]/\\\\&/g'`;=
 \
> > +     for file in $$headers; do \
> > +       if [ -f $$file ] ; then \
> > +--
> > +2.17.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0016-=
Disable-sdt.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/001=
6-Disable-sdt.patch
> > new file mode 100644
> > index 0000000..8197546
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0016-Disable=
-sdt.patch
> > @@ -0,0 +1,113 @@
> > +From 423d87ac47d21e399d759d7ff3b638f0c721a7df Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:28:10 +0400
> > +Subject: [PATCH 16/39] Disable sdt.
> > +
> > +We don't list dtrace in DEPENDS so we shouldn't be depending on this =
header.
> > +It may or may not exist from preivous builds though. To be determinst=
ic, disable
> > +sdt.h usage always. This avoids build failures if the header is remov=
ed after configure
> > +but before libgcc is compiled for example.
> > +
> > +RP 2012/8/7
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Disable sdt for libstdc++-v3.
> > +
> > +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > +
> > +Upstream-Status: Inappropriate [hack]
> > +---
> > + gcc/configure             | 12 ++++++------
> > + gcc/configure.ac          | 18 +++++++++---------
> > + libstdc++-v3/configure    |  6 +++---
> > + libstdc++-v3/configure.ac |  2 +-
> > + 4 files changed, 19 insertions(+), 19 deletions(-)
> > +
> > +diff --git a/gcc/configure b/gcc/configure
> > +index a575839c1b2..872338f29b6 100755
> > +--- a/gcc/configure
> > ++++ b/gcc/configure
> > +@@ -29296,12 +29296,12 @@ fi
> > + { $as_echo "$as_me:${as_lineno-$LINENO}: checking sys/sdt.h in the t=
arget C library" >&5
> > + $as_echo_n "checking sys/sdt.h in the target C library... " >&6; }
> > + have_sys_sdt_h=3Dno
> > +-if test -f $target_header_dir/sys/sdt.h; then
> > +-  have_sys_sdt_h=3Dyes
> > +-
> > +-$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
> > +-
> > +-fi
> > ++#if test -f $target_header_dir/sys/sdt.h; then
> > ++#  have_sys_sdt_h=3Dyes
> > ++#
> > ++#$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
> > ++#
> > ++#fi
> > + { $as_echo "$as_me:${as_lineno-$LINENO}: result: $have_sys_sdt_h" >&=
5
> > + $as_echo "$have_sys_sdt_h" >&6; }
> > +
> > +diff --git a/gcc/configure.ac b/gcc/configure.ac
> > +index 676116a6d96..55046e68926 100644
> > +--- a/gcc/configure.ac
> > ++++ b/gcc/configure.ac
> > +@@ -5957,15 +5957,15 @@ fi
> > + AC_SUBST([enable_default_ssp])
> > +
> > + # Test for <sys/sdt.h> on the target.
> > +-GCC_TARGET_TEMPLATE([HAVE_SYS_SDT_H])
> > +-AC_MSG_CHECKING(sys/sdt.h in the target C library)
> > +-have_sys_sdt_h=3Dno
> > +-if test -f $target_header_dir/sys/sdt.h; then
> > +-  have_sys_sdt_h=3Dyes
> > +-  AC_DEFINE(HAVE_SYS_SDT_H, 1,
> > +-            [Define if your target C library provides sys/sdt.h])
> > +-fi
> > +-AC_MSG_RESULT($have_sys_sdt_h)
> > ++#GCC_TARGET_TEMPLATE([HAVE_SYS_SDT_H])
> > ++#AC_MSG_CHECKING(sys/sdt.h in the target C library)
> > ++#have_sys_sdt_h=3Dno
> > ++#if test -f $target_header_dir/sys/sdt.h; then
> > ++#  have_sys_sdt_h=3Dyes
> > ++#  AC_DEFINE(HAVE_SYS_SDT_H, 1,
> > ++#            [Define if your target C library provides sys/sdt.h])
> > ++#fi
> > ++#AC_MSG_RESULT($have_sys_sdt_h)
> > +
> > + # Check if TFmode long double should be used by default or not.
> > + # Some glibc targets used DFmode long double, but with glibc 2.4
> > +diff --git a/libstdc++-v3/configure b/libstdc++-v3/configure
> > +index c9dbaa139d5..c64a77d152b 100755
> > +--- a/libstdc++-v3/configure
> > ++++ b/libstdc++-v3/configure
> > +@@ -21786,11 +21786,11 @@ ac_compile=3D'$CC -c $CFLAGS $CPPFLAGS conf=
test.$ac_ext >&5'
> > + ac_link=3D'$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conf=
test.$ac_ext $LIBS >&5'
> > + ac_compiler_gnu=3D$ac_cv_c_compiler_gnu
> > +
> > +-  if test $glibcxx_cv_sys_sdt_h =3D yes; then
> > ++#  if test $glibcxx_cv_sys_sdt_h =3D yes; then
> > +
> > +-$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
> > ++#$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
> > +
> > +-  fi
> > ++#  fi
> > +   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $glibcxx_cv_sys_s=
dt_h" >&5
> > + $as_echo "$glibcxx_cv_sys_sdt_h" >&6; }
> > +
> > +diff --git a/libstdc++-v3/configure.ac b/libstdc++-v3/configure.ac
> > +index 0ef96270c9c..afe55a1b215 100644
> > +--- a/libstdc++-v3/configure.ac
> > ++++ b/libstdc++-v3/configure.ac
> > +@@ -230,7 +230,7 @@ GLIBCXX_CHECK_SC_NPROCESSORS_ONLN
> > + GLIBCXX_CHECK_SC_NPROC_ONLN
> > + GLIBCXX_CHECK_PTHREADS_NUM_PROCESSORS_NP
> > + GLIBCXX_CHECK_SYSCTL_HW_NCPU
> > +-GLIBCXX_CHECK_SDT_H
> > ++#GLIBCXX_CHECK_SDT_H
> > +
> > + # Check for available headers.
> > + AC_CHECK_HEADERS([endian.h execinfo.h float.h fp.h ieeefp.h inttypes=
.h \
> > +--
> > +2.17.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0017-=
libtool.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0017-li=
btool.patch
> > new file mode 100644
> > index 0000000..0caa1ce
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0017-libtool=
.patch
> > @@ -0,0 +1,42 @@
> > +From c8b11e96b11910b2d4df6ae8104466e3303d933f Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:29:11 +0400
> > +Subject: [PATCH 17/39] libtool
> > +
> > +libstdc++ from gcc-runtime gets created with -rpath=3D/usr/lib/../lib=
 for qemux86-64
> > +when running on am x86_64 build host.
> > +
> > +This patch stops this speading to libdir in the libstdc++.la file wit=
hin libtool.
> > +Arguably, it shouldn't be passing this into libtool in the first plac=
e but
> > +for now this resolves the nastiest problems this causes.
> > +
> > +func_normal_abspath would resolve an empty path to `pwd` so we need
> > +to filter the zero case.
> > +
> > +RP 2012/8/24
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Pending
> > +---
> > + ltmain.sh | 4 ++++
> > + 1 file changed, 4 insertions(+)
> > +
> > +diff --git a/ltmain.sh b/ltmain.sh
> > +index 9503ec85d70..0121fba707f 100644
> > +--- a/ltmain.sh
> > ++++ b/ltmain.sh
> > +@@ -6359,6 +6359,10 @@ func_mode_link ()
> > +     func_warning "ignoring multiple \`-rpath's for a libtool library=
"
> > +
> > +       install_libdir=3D"$1"
> > ++      if test -n "$install_libdir"; then
> > ++    func_normal_abspath "$install_libdir"
> > ++    install_libdir=3D$func_normal_abspath_result
> > ++      fi
> > +
> > +       oldlibs=3D
> > +       if test -z "$rpath"; then
> > +--
> > +2.17.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0018-=
gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch b/meta-arm-toolchai=
n/recipes-devtools/gcc/gcc-arm-8.2/0018-gcc-armv4-pass-fix-v4bx-to-linker-t=
o-support-EABI.patch
> > new file mode 100644
> > index 0000000..643cc67
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0018-gcc-arm=
v4-pass-fix-v4bx-to-linker-to-support-EABI.patch
> > @@ -0,0 +1,43 @@
> > +From 7dbba844a59bdf6e7d724f8bfa7927246cb7af8f Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:30:32 +0400
> > +Subject: [PATCH 18/39] gcc: armv4: pass fix-v4bx to linker to support=
 EABI.
> > +
> > +The LINK_SPEC for linux gets overwritten by linux-eabi.h which
> > +means the value of TARGET_FIX_V4BX_SPEC gets lost and as a result
> > +the option is not passed to linker when chosing march=3Darmv4
> > +This patch redefines this in linux-eabi.h and reinserts it
> > +for eabi defaulting toolchains.
> > +
> > +We might want to send it upstream.
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Pending
> > +---
> > + gcc/config/arm/linux-eabi.h | 6 +++++-
> > + 1 file changed, 5 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.=
h
> > +index b3af68cac57..330b6e13c5f 100644
> > +--- a/gcc/config/arm/linux-eabi.h
> > ++++ b/gcc/config/arm/linux-eabi.h
> > +@@ -88,10 +88,14 @@
> > + #define MUSL_DYNAMIC_LINKER \
> > +   "/lib/ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=3Dhard:hf}.=
so.1"
> > +
> > ++/* For armv4 we pass --fix-v4bx to linker to support EABI */
> > ++#undef TARGET_FIX_V4BX_SPEC
> > ++#define TARGET_FIX_V4BX_SPEC "%{mcpu=3Darm8|mcpu=3Darm810|mcpu=3Dstr=
ongarm*|march=3Darmv4: --fix-v4bx}"
> > ++
> > + /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
> > +    use the GNU/Linux version, not the generic BPABI version.  */
> > + #undef  LINK_SPEC
> > +-#define LINK_SPEC EABI_LINK_SPEC                                    =
\
> > ++#define LINK_SPEC TARGET_FIX_V4BX_SPEC EABI_LINK_SPEC               =
        \
> > +   LINUX_OR_ANDROID_LD (LINUX_TARGET_LINK_SPEC,                      =
        \
> > +                    LINUX_TARGET_LINK_SPEC " " ANDROID_LINK_SPEC)
> > +
> > +--
> > +2.17.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0019-=
Use-the-multilib-config-files-from-B-instead-of-usin.patch b/meta-arm-toolc=
hain/recipes-devtools/gcc/gcc-arm-8.2/0019-Use-the-multilib-config-files-fr=
om-B-instead-of-usin.patch
> > new file mode 100644
> > index 0000000..0849186
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0019-Use-the=
-multilib-config-files-from-B-instead-of-usin.patch
> > @@ -0,0 +1,102 @@
> > +From 117140acd3c383f620ff75894276001c7405dcce Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:33:04 +0400
> > +Subject: [PATCH 19/39] Use the multilib config files from ${B} instea=
d of
> > + using the ones from ${S}
> > +
> > +Use the multilib config files from ${B} instead of using the ones fro=
m ${S}
> > +so that the source can be shared between gcc-cross-initial,
> > +gcc-cross-intermediate, gcc-cross, gcc-runtime, and also the sdk buil=
d.
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> > +
> > +Upstream-Status: Inappropriate [configuration]
> > +---
> > + gcc/configure    | 22 ++++++++++++++++++----
> > + gcc/configure.ac | 22 ++++++++++++++++++----
> > + 2 files changed, 36 insertions(+), 8 deletions(-)
> > +
> > +diff --git a/gcc/configure b/gcc/configure
> > +index 872338f29b6..cfcadc93a01 100755
> > +--- a/gcc/configure
> > ++++ b/gcc/configure
> > +@@ -12138,10 +12138,20 @@ done
> > + tmake_file_=3D
> > + for f in ${tmake_file}
> > + do
> > +-    if test -f ${srcdir}/config/$f
> > +-    then
> > +-            tmake_file_=3D"${tmake_file_} \$(srcdir)/config/$f"
> > +-    fi
> > ++  case $f in
> > ++    */t-linux64 )
> > ++       if test -f ./config/$f
> > ++       then
> > ++         tmake_file_=3D"${tmake_file_} ./config/$f"
> > ++       fi
> > ++       ;;
> > ++    * )
> > ++       if test -f ${srcdir}/config/$f
> > ++       then
> > ++         tmake_file_=3D"${tmake_file_} \$(srcdir)/config/$f"
> > ++       fi
> > ++       ;;
> > ++  esac
> > + done
> > + tmake_file=3D"${tmake_file_}"
> > +
> > +@@ -12152,6 +12162,10 @@ tm_file_list=3D"options.h"
> > + tm_include_list=3D"options.h insn-constants.h"
> > + for f in $tm_file; do
> > +   case $f in
> > ++    */linux64.h )
> > ++       tm_file_list=3D"${tm_file_list} ./config/$f"
> > ++       tm_include_list=3D"${tm_include_list} ./config/$f"
> > ++       ;;
> > +     ./* )
> > +        f=3D`echo $f | sed 's/^..//'`
> > +        tm_file_list=3D"${tm_file_list} $f"
> > +diff --git a/gcc/configure.ac b/gcc/configure.ac
> > +index 55046e68926..44b90478f55 100644
> > +--- a/gcc/configure.ac
> > ++++ b/gcc/configure.ac
> > +@@ -1902,10 +1902,20 @@ done
> > + tmake_file_=3D
> > + for f in ${tmake_file}
> > + do
> > +-    if test -f ${srcdir}/config/$f
> > +-    then
> > +-            tmake_file_=3D"${tmake_file_} \$(srcdir)/config/$f"
> > +-    fi
> > ++  case $f in
> > ++    */t-linux64 )
> > ++       if test -f ./config/$f
> > ++       then
> > ++         tmake_file_=3D"${tmake_file_} ./config/$f"
> > ++       fi
> > ++       ;;
> > ++    * )
> > ++       if test -f ${srcdir}/config/$f
> > ++       then
> > ++         tmake_file_=3D"${tmake_file_} \$(srcdir)/config/$f"
> > ++       fi
> > ++       ;;
> > ++  esac
> > + done
> > + tmake_file=3D"${tmake_file_}"
> > +
> > +@@ -1916,6 +1926,10 @@ tm_file_list=3D"options.h"
> > + tm_include_list=3D"options.h insn-constants.h"
> > + for f in $tm_file; do
> > +   case $f in
> > ++    */linux64.h )
> > ++       tm_file_list=3D"${tm_file_list} ./config/$f"
> > ++       tm_include_list=3D"${tm_include_list} ./config/$f"
> > ++       ;;
> > +     ./* )
> > +        f=3D`echo $f | sed 's/^..//'`
> > +        tm_file_list=3D"${tm_file_list} $f"
> > +--
> > +2.17.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0020-=
Avoid-using-libdir-from-.la-which-usually-points-to-.patch b/meta-arm-toolc=
hain/recipes-devtools/gcc/gcc-arm-8.2/0020-Avoid-using-libdir-from-.la-whic=
h-usually-points-to-.patch
> > new file mode 100644
> > index 0000000..911fe85
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0020-Avoid-u=
sing-libdir-from-.la-which-usually-points-to-.patch
> > @@ -0,0 +1,31 @@
> > +From a7266111a5ba2d146c979e86ff84f6b807ca5fdc Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 20 Feb 2015 09:39:38 +0000
> > +Subject: [PATCH 20/39] Avoid using libdir from .la which usually poin=
ts to a
> > + host path
> > +
> > +Upstream-Status: Inappropriate [embedded specific]
> > +
> > +Signed-off-by: Jonathan Liu <net147@gmail.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + ltmain.sh | 3 +++
> > + 1 file changed, 3 insertions(+)
> > +
> > +diff --git a/ltmain.sh b/ltmain.sh
> > +index 0121fba707f..52bdbdb5f9c 100644
> > +--- a/ltmain.sh
> > ++++ b/ltmain.sh
> > +@@ -5628,6 +5628,9 @@ func_mode_link ()
> > +         absdir=3D"$abs_ladir"
> > +         libdir=3D"$abs_ladir"
> > +       else
> > ++        # Instead of using libdir from .la which usually points to a=
 host path,
> > ++        # use the path the .la is contained in.
> > ++        libdir=3D"$abs_ladir"
> > +         dir=3D"$libdir"
> > +         absdir=3D"$libdir"
> > +       fi
> > +--
> > +2.17.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0021-=
export-CPP.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0021=
-export-CPP.patch
> > new file mode 100644
> > index 0000000..2e6b411
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0021-export-=
CPP.patch
> > @@ -0,0 +1,53 @@
> > +From c8599fc3b5781b319707c9c0f1b0a1ef7cddb027 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 20 Feb 2015 09:40:59 +0000
> > +Subject: [PATCH 21/39] export CPP
> > +
> > +The OE environment sets and exports CPP as being the target gcc. When
> > +building gcc-cross-canadian for a mingw targetted sdk, the following =
can be found
> > +in build.x86_64-pokysdk-mingw32.i586-poky-linux/build-x86_64-linux/li=
biberty/config.log:
> > +
> > +configure:3641: checking for _FILE_OFFSET_BITS value needed for large=
 files
> > +configure:3666: gcc  -c -isystem/media/build1/poky/build/tmp/sysroots=
/x86_64-linux/usr/include -O2 -pipe  conftest.c >&5
> > +configure:3666: $? =3D 0
> > +configure:3698: result: no
> > +configure:3786: checking how to run the C preprocessor
> > +configure:3856: result: x86_64-pokysdk-mingw32-gcc -E --sysroot=3D/me=
dia/build1/poky/build/tmp/sysroots/x86_64-nativesdk-mingw32-pokysdk-mingw32
> > +configure:3876: x86_64-pokysdk-mingw32-gcc -E --sysroot=3D/media/buil=
d1/poky/build/tmp/sysroots/x86_64-nativesdk-mingw32-pokysdk-mingw32 conftes=
t.c
> > +configure:3876: $? =3D 0
> > +
> > +Note this is a *build* target (in build-x86_64-linux) so it should be
> > +using the host "gcc", not x86_64-pokysdk-mingw32-gcc. Since the mingw=
32
> > +headers are very different, using the wrong cpp is a real problem. It=
 is leaking
> > +into configure through the CPP variable. Ultimately this leads to bui=
ld
> > +failures related to not being able to include a process.h file for pe=
m-unix.c.
> > +
> > +The fix is to ensure we export a sane CPP value into the build
> > +environment when using build targets. We could define a CPP_FOR_BUILD=
 value which may be
> > +the version which needs to be upstreamed but for now, this fix is goo=
d enough to
> > +avoid the problem.
> > +
> > +RP 22/08/2013
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + Makefile.in | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/Makefile.in b/Makefile.in
> > +index 2bf83b72265..1af45580086 100644
> > +--- a/Makefile.in
> > ++++ b/Makefile.in
> > +@@ -149,6 +149,7 @@ BUILD_EXPORTS =3D \
> > +     AR=3D"$(AR_FOR_BUILD)"; export AR; \
> > +     AS=3D"$(AS_FOR_BUILD)"; export AS; \
> > +     CC=3D"$(CC_FOR_BUILD)"; export CC; \
> > ++    CPP=3D"$(CC_FOR_BUILD) -E"; export CPP; \
> > +     CFLAGS=3D"$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
> > +     CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> > +     CXX=3D"$(CXX_FOR_BUILD)"; export CXX; \
> > +--
> > +2.17.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0022-=
Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch b/meta-arm-toolc=
hain/recipes-devtools/gcc/gcc-arm-8.2/0022-Disable-the-MULTILIB_OSDIRNAMES-=
and-other-multilib-o.patch
> > new file mode 100644
> > index 0000000..17c581f
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0022-Disable=
-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
> > @@ -0,0 +1,42 @@
> > +From 5e2ee46c720b6ce03a18da70dd4e0917c258ab0b Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 20 Feb 2015 10:21:55 +0000
> > +Subject: [PATCH 22/39] Disable the MULTILIB_OSDIRNAMES and other mult=
ilib
> > + options.
> > +
> > +Hard coding the MULTILIB_OSDIRNAMES with ../lib64 is causing problems=
 on
> > +systems where the libdir is NOT set to /lib64.  This is allowed by th=
e
> > +ABI, as
> > +long as the dynamic loader is present in /lib.
> > +
> > +We simply want to use the default rules in gcc to find and configure =
the
> > +normal libdir.
> > +
> > +Upstream-Status: Inappropriate[OE-Specific]
> > +
> > +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + gcc/config/aarch64/t-aarch64-linux | 8 ++++----
> > + 1 file changed, 4 insertions(+), 4 deletions(-)
> > +
> > +diff --git a/gcc/config/aarch64/t-aarch64-linux b/gcc/config/aarch64/=
t-aarch64-linux
> > +index b9897785a89..7d06f0d0edb 100644
> > +--- a/gcc/config/aarch64/t-aarch64-linux
> > ++++ b/gcc/config/aarch64/t-aarch64-linux
> > +@@ -21,8 +21,8 @@
> > + LIB1ASMSRC   =3D aarch64/lib1funcs.asm
> > + LIB1ASMFUNCS =3D _aarch64_sync_cache_range
> > +
> > +-AARCH_BE =3D $(if $(findstring TARGET_BIG_ENDIAN_DEFAULT=3D1, $(tm_d=
efines)),_be)
> > +-MULTILIB_OSDIRNAMES =3D mabi.lp64=3D../lib64$(call if_multiarch,:aar=
ch64$(AARCH_BE)-linux-gnu)
> > +-MULTIARCH_DIRNAME =3D $(call if_multiarch,aarch64$(AARCH_BE)-linux-g=
nu)
> > ++#AARCH_BE =3D $(if $(findstring TARGET_BIG_ENDIAN_DEFAULT=3D1, $(tm_=
defines)),_be)
> > ++#MULTILIB_OSDIRNAMES =3D mabi.lp64=3D../lib64$(call if_multiarch,:aa=
rch64$(AARCH_BE)-linux-gnu)
> > ++#MULTIARCH_DIRNAME =3D $(call if_multiarch,aarch64$(AARCH_BE)-linux-=
gnu)
> > +
> > +-MULTILIB_OSDIRNAMES +=3D mabi.ilp32=3D../libilp32$(call if_multiarch=
,:aarch64$(AARCH_BE)-linux-gnu_ilp32)
> > ++#MULTILIB_OSDIRNAMES +=3D mabi.ilp32=3D../libilp32$(call if_multiarc=
h,:aarch64$(AARCH_BE)-linux-gnu_ilp32)
> > +--
> > +2.17.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0023-=
Ensure-target-gcc-headers-can-be-included.patch b/meta-arm-toolchain/recipe=
s-devtools/gcc/gcc-arm-8.2/0023-Ensure-target-gcc-headers-can-be-included.p=
atch
> > new file mode 100644
> > index 0000000..73db3e6
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0023-Ensure-=
target-gcc-headers-can-be-included.patch
> > @@ -0,0 +1,62 @@
> > +From 73766424a2f71b1810fb8afdd863028855d87e5a Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 20 Feb 2015 10:25:11 +0000
> > +Subject: [PATCH 23/39] Ensure target gcc headers can be included
> > +
> > +There are a few headers installed as part of the OpenEmbedded
> > +gcc-runtime target (omp.h, ssp/*.h). Being installed from a recipe
> > +built for the target architecture, these are within the target
> > +sysroot and not cross/nativesdk; thus they weren't able to be
> > +found by gcc with the existing search paths. Add support for
> > +picking up these headers under the sysroot supplied on the gcc
> > +command line in order to resolve this.
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + gcc/Makefile.in  | 2 ++
> > + gcc/cppdefault.c | 4 ++++
> > + gcc/defaults.h   | 9 +++++++++
> > + gcc/gcc.c        | 7 -------
> > + 4 files changed, 15 insertions(+), 7 deletions(-)
> > +
> > +diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> > +index 71a8275c39f..5ae693fb06c 100644
> > +--- a/gcc/Makefile.in
> > ++++ b/gcc/Makefile.in
> > +@@ -614,6 +614,7 @@ libexecdir =3D @libexecdir@
> > +
> > + # Directory in which the compiler finds libraries etc.
> > + libsubdir =3D $(libdir)/gcc/$(real_target_noncanonical)/$(version)$(=
accel_dir_suffix)
> > ++libsubdir_target =3D gcc/$(target_noncanonical)/$(version)
> > + # Directory in which the compiler finds executables
> > + libexecsubdir =3D $(libexecdir)/gcc/$(real_target_noncanonical)/$(ve=
rsion)$(accel_dir_suffix)
> > + # Directory in which all plugin resources are installed
> > +@@ -2870,6 +2871,7 @@ CFLAGS-intl.o +=3D -DLOCALEDIR=3D\"$(localedir)=
\"
> > +
> > + PREPROCESSOR_DEFINES =3D \
> > +   -DGCC_INCLUDE_DIR=3D\"$(libsubdir)/include\" \
> > ++  -DGCC_INCLUDE_SUBDIR_TARGET=3D\"$(libsubdir_target)/include\" \
> > +   -DFIXED_INCLUDE_DIR=3D\"$(libsubdir)/include-fixed\" \
> > +   -DGPLUSPLUS_INCLUDE_DIR=3D\"$(gcc_gxx_include_dir)\" \
> > +   -DGPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT=3D$(gcc_gxx_include_dir_add_sy=
sroot) \
> > +diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
> > +index b36a979d5ba..e2e187dedaf 100644
> > +--- a/gcc/cppdefault.c
> > ++++ b/gcc/cppdefault.c
> > +@@ -59,6 +59,10 @@ const struct default_include cpp_include_defaults[=
]
> > +     /* This is the dir for gcc's private headers.  */
> > +     { GCC_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
> > + #endif
> > ++#ifdef GCC_INCLUDE_SUBDIR_TARGET
> > ++    /* This is the dir for gcc's private headers under the specified=
 sysroot.  */
> > ++    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC", =
0, 0, 1, 0 },
> > ++#endif
> > + #ifdef LOCAL_INCLUDE_DIR
> > +     /* /usr/local/include comes before the fixincluded header files.=
  */
> > +     { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },
> > +--
> > +2.17.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0024-=
gcc-4.8-won-t-build-with-disable-dependency-tracking.patch b/meta-arm-toolc=
hain/recipes-devtools/gcc/gcc-arm-8.2/0024-gcc-4.8-won-t-build-with-disable=
-dependency-tracking.patch
> > new file mode 100644
> > index 0000000..67b47f4
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0024-gcc-4.8=
-won-t-build-with-disable-dependency-tracking.patch
> > @@ -0,0 +1,54 @@
> > +From 57beef69396f6c187014b8e61cdc966218479d07 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 20 Feb 2015 11:17:19 +0000
> > +Subject: [PATCH 24/39] gcc 4.8+ won't build with --disable-dependency=
-tracking
> > +
> > +since the *.Ppo files don't get created unless --enable-dependency-tr=
acking is true.
> > +
> > +This patch ensures we only use those compiler options when its enable=
d.
> > +
> > +Upstream-Status: Submitted
> > +
> > +(Problem was already reported upstream, attached this patch there
> > +http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D55930)
> > +
> > +RP
> > +2012/09/22
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + libatomic/Makefile.am | 3 ++-
> > + libatomic/Makefile.in | 3 ++-
> > + 2 files changed, 4 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/libatomic/Makefile.am b/libatomic/Makefile.am
> > +index 803b292cce5..b47842eb590 100644
> > +--- a/libatomic/Makefile.am
> > ++++ b/libatomic/Makefile.am
> > +@@ -101,7 +101,8 @@ PAT_S            =3D $(word 3,$(PAT_SPLIT))
> > + IFUNC_DEF   =3D -DIFUNC_ALT=3D$(PAT_S)
> > + IFUNC_OPT   =3D $(word $(PAT_S),$(IFUNC_OPTIONS))
> > +
> > +-M_DEPS              =3D -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
> > ++@AMDEP_TRUE@M_DEPS          =3D -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).P=
po
> > ++@AMDEP_FALSE@M_DEPS         =3D
> > + M_SIZE              =3D -DN=3D$(PAT_N)
> > + M_IFUNC             =3D $(if $(PAT_S),$(IFUNC_DEF) $(IFUNC_OPT))
> > + M_FILE              =3D $(PAT_BASE)_n.c
> > +diff --git a/libatomic/Makefile.in b/libatomic/Makefile.in
> > +index c8f38be5835..4fab7cec3ea 100644
> > +--- a/libatomic/Makefile.in
> > ++++ b/libatomic/Makefile.in
> > +@@ -335,7 +335,8 @@ PAT_N =3D $(word 2,$(PAT_SPLIT))
> > + PAT_S =3D $(word 3,$(PAT_SPLIT))
> > + IFUNC_DEF =3D -DIFUNC_ALT=3D$(PAT_S)
> > + IFUNC_OPT =3D $(word $(PAT_S),$(IFUNC_OPTIONS))
> > +-M_DEPS =3D -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
> > ++@AMDEP_TRUE@M_DEPS =3D -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
> > ++@AMDEP_FALSE@M_DEPS =3D
> > + M_SIZE =3D -DN=3D$(PAT_N)
> > + M_IFUNC =3D $(if $(PAT_S),$(IFUNC_DEF) $(IFUNC_OPT))
> > + M_FILE =3D $(PAT_BASE)_n.c
> > +--
> > +2.17.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0025-=
Don-t-search-host-directory-during-relink-if-inst_pr.patch b/meta-arm-toolc=
hain/recipes-devtools/gcc/gcc-arm-8.2/0025-Don-t-search-host-directory-duri=
ng-relink-if-inst_pr.patch
> > new file mode 100644
> > index 0000000..d8b35bb
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0025-Don-t-s=
earch-host-directory-during-relink-if-inst_pr.patch
> > @@ -0,0 +1,38 @@
> > +From fd96c9b35c592f1bdd32bc5ae669157473e44063 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Tue, 3 Mar 2015 08:21:19 +0000
> > +Subject: [PATCH 25/39] Don't search host directory during "relink" if
> > + $inst_prefix is provided
> > +
> > +http://lists.gnu.org/archive/html/libtool-patches/2011-01/msg00026.ht=
ml
> > +
> > +Upstream-Status: Submitted
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + ltmain.sh | 5 +++--
> > + 1 file changed, 3 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/ltmain.sh b/ltmain.sh
> > +index 52bdbdb5f9c..82bcec39f05 100644
> > +--- a/ltmain.sh
> > ++++ b/ltmain.sh
> > +@@ -6004,12 +6004,13 @@ func_mode_link ()
> > +           fi
> > +         else
> > +           # We cannot seem to hardcode it, guess we'll fake it.
> > ++          # Default if $libdir is not relative to the prefix:
> > +           add_dir=3D"-L$libdir"
> > +-          # Try looking first in the location we're being installed =
to.
> > ++
> > +           if test -n "$inst_prefix_dir"; then
> > +             case $libdir in
> > +               [\\/]*)
> > +-                add_dir=3D"$add_dir -L$inst_prefix_dir$libdir"
> > ++                add_dir=3D"-L$inst_prefix_dir$libdir"
> > +                 ;;
> > +             esac
> > +           fi
> > +--
> > +2.17.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0026-=
Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch b/meta-arm-toolc=
hain/recipes-devtools/gcc/gcc-arm-8.2/0026-Use-SYSTEMLIBS_DIR-replacement-i=
nstead-of-hardcoding.patch
> > new file mode 100644
> > index 0000000..d3ab5aa
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0026-Use-SYS=
TEMLIBS_DIR-replacement-instead-of-hardcoding.patch
> > @@ -0,0 +1,29 @@
> > +From c2e400afe8c514357859fca88af4d3e1fcbfe2ff Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Tue, 28 Apr 2015 23:15:27 -0700
> > +Subject: [PATCH 26/39] Use SYSTEMLIBS_DIR replacement instead of hard=
coding
> > + base_libdir
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > +Upstream-Status: Pending
> > +
> > + gcc/config/aarch64/aarch64-linux.h | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/=
aarch64-linux.h
> > +index bf1327e98cc..64436183bc8 100644
> > +--- a/gcc/config/aarch64/aarch64-linux.h
> > ++++ b/gcc/config/aarch64/aarch64-linux.h
> > +@@ -21,7 +21,7 @@
> > + #ifndef GCC_AARCH64_LINUX_H
> > + #define GCC_AARCH64_LINUX_H
> > +
> > +-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-aarch64%{mbig-endian:_be=
}%{mabi=3Dilp32:_ilp32}.so.1"
> > ++#define GLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-linux-aarch64%{mbig=
-endian:_be}%{mabi=3Dilp32:_ilp32}.so.1"
> > +
> > + #undef MUSL_DYNAMIC_LINKER
> > + #define MUSL_DYNAMIC_LINKER "/lib/ld-musl-aarch64%{mbig-endian:_be}%=
{mabi=3Dilp32:_ilp32}.so.1"
> > +--
> > +2.17.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0027-=
aarch64-Add-support-for-musl-ldso.patch b/meta-arm-toolchain/recipes-devtoo=
ls/gcc/gcc-arm-8.2/0027-aarch64-Add-support-for-musl-ldso.patch
> > new file mode 100644
> > index 0000000..9e5ce8a
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0027-aarch64=
-Add-support-for-musl-ldso.patch
> > @@ -0,0 +1,28 @@
> > +From a2cc175769fd8255750eaecae64e3d1f9c38d48f Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Tue, 28 Apr 2015 23:18:39 -0700
> > +Subject: [PATCH 27/39] aarch64: Add support for musl ldso
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > +Upstream-Status: Pending
> > +
> > + gcc/config/aarch64/aarch64-linux.h | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/=
aarch64-linux.h
> > +index 64436183bc8..ba156676026 100644
> > +--- a/gcc/config/aarch64/aarch64-linux.h
> > ++++ b/gcc/config/aarch64/aarch64-linux.h
> > +@@ -24,7 +24,7 @@
> > + #define GLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-linux-aarch64%{mbig=
-endian:_be}%{mabi=3Dilp32:_ilp32}.so.1"
> > +
> > + #undef MUSL_DYNAMIC_LINKER
> > +-#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-aarch64%{mbig-endian:_be}%=
{mabi=3Dilp32:_ilp32}.so.1"
> > ++#define MUSL_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-musl-aarch64%{mbig-e=
ndian:_be}%{mabi=3Dilp32:_ilp32}.so.1"
> > +
> > + #undef  ASAN_CC1_SPEC
> > + #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
> > +--
> > +2.17.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0028-=
libcc1-fix-libcc1-s-install-path-and-rpath.patch b/meta-arm-toolchain/recip=
es-devtools/gcc/gcc-arm-8.2/0028-libcc1-fix-libcc1-s-install-path-and-rpath=
.patch
> > new file mode 100644
> > index 0000000..2673f4e
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0028-libcc1-=
fix-libcc1-s-install-path-and-rpath.patch
> > @@ -0,0 +1,54 @@
> > +From a8a8a02788ff98f253ce0b33adcb0e661d24b1e3 Mon Sep 17 00:00:00 200=
1
> > +From: Robert Yang <liezhi.yang@windriver.com>
> > +Date: Sun, 5 Jul 2015 20:25:18 -0700
> > +Subject: [PATCH 28/39] libcc1: fix libcc1's install path and rpath
> > +
> > +* Install libcc1.so and libcc1plugin.so into
> > +  $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_version), as what we
> > +  had done to lto-plugin.
> > +* Fix bad RPATH iussue:
> > +  gcc-5.2.0: package gcc-plugins contains bad RPATH /patht/to/tmp/sys=
roots/qemux86-64/usr/lib64/../lib64 in file
> > + /path/to/gcc/5.2.0-r0/packages-split/gcc-plugins/usr/lib64/gcc/x86_6=
4-poky-linux/5.2.0/plugin/libcc1plugin.so.0.0.0
> > + [rpaths]
> > +
> > +Upstream-Status: Inappropriate [OE configuration]
> > +
> > +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > +---
> > + libcc1/Makefile.am | 4 ++--
> > + libcc1/Makefile.in | 4 ++--
> > + 2 files changed, 4 insertions(+), 4 deletions(-)
> > +
> > +diff --git a/libcc1/Makefile.am b/libcc1/Makefile.am
> > +index 6ecb66b4365..634cce3c2a9 100644
> > +--- a/libcc1/Makefile.am
> > ++++ b/libcc1/Makefile.am
> > +@@ -37,8 +37,8 @@ libiberty =3D $(if $(wildcard $(libiberty_noasan)),=
$(Wc)$(libiberty_noasan), \
> > +         $(Wc)$(libiberty_normal)))
> > + libiberty_dep =3D $(patsubst $(Wc)%,%,$(libiberty))
> > +
> > +-plugindir =3D $(libdir)/gcc/$(target_noncanonical)/$(gcc_version)/pl=
ugin
> > +-cc1libdir =3D $(libdir)/$(libsuffix)
> > ++cc1libdir =3D $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_version=
)
> > ++plugindir =3D $(cc1libdir)
> > +
> > + if ENABLE_PLUGIN
> > + plugin_LTLIBRARIES =3D libcc1plugin.la libcp1plugin.la
> > +diff --git a/libcc1/Makefile.in b/libcc1/Makefile.in
> > +index 47be10025ad..8d5481d87bd 100644
> > +--- a/libcc1/Makefile.in
> > ++++ b/libcc1/Makefile.in
> > +@@ -303,8 +303,8 @@ libiberty =3D $(if $(wildcard $(libiberty_noasan)=
),$(Wc)$(libiberty_noasan), \
> > +         $(Wc)$(libiberty_normal)))
> > +
> > + libiberty_dep =3D $(patsubst $(Wc)%,%,$(libiberty))
> > +-plugindir =3D $(libdir)/gcc/$(target_noncanonical)/$(gcc_version)/pl=
ugin
> > +-cc1libdir =3D $(libdir)/$(libsuffix)
> > ++cc1libdir =3D $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_version=
)
> > ++plugindir =3D $(cc1libdir)
> > + @ENABLE_PLUGIN_TRUE@plugin_LTLIBRARIES =3D libcc1plugin.la libcp1plu=
gin.la
> > + @ENABLE_PLUGIN_TRUE@cc1lib_LTLIBRARIES =3D libcc1.la
> > + shared_source =3D callbacks.cc callbacks.hh connection.cc connection=
.hh \
> > +--
> > +2.17.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0029-=
handle-sysroot-support-for-nativesdk-gcc.patch b/meta-arm-toolchain/recipes=
-devtools/gcc/gcc-arm-8.2/0029-handle-sysroot-support-for-nativesdk-gcc.pat=
ch
> > new file mode 100644
> > index 0000000..727bb0d
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0029-handle-=
sysroot-support-for-nativesdk-gcc.patch
> > @@ -0,0 +1,213 @@
> > +From 3bb74495e45e0e798daae5556497e688b8fc4eef Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Mon, 7 Dec 2015 23:39:54 +0000
> > +Subject: [PATCH 29/39] handle sysroot support for nativesdk-gcc
> > +
> > +Being able to build a nativesdk gcc is useful, particularly in cases
> > +where the host compiler may be of an incompatible version (or a 32
> > +bit compiler is needed).
> > +
> > +Sadly, building nativesdk-gcc is not straight forward. We install
> > +nativesdk-gcc into a relocatable location and this means that its
> > +library locations can change. "Normal" sysroot support doesn't help
> > +in this case since the values of paths like "libdir" change, not just
> > +base root directory of the system.
> > +
> > +In order to handle this we do two things:
> > +
> > +a) Add %r into spec file markup which can be used for injected paths
> > +   such as SYSTEMLIBS_DIR (see gcc_multilib_setup()).
> > +b) Add other paths which need relocation into a .gccrelocprefix secti=
on
> > +   which the relocation code will notice and adjust automatically.
> > +
> > +Upstream-Status: Inappropriate
> > +RP 2015/7/28
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + gcc/cppdefault.c | 50 +++++++++++++++++++++++++++++++++++-----------=
--
> > + gcc/cppdefault.h |  3 ++-
> > + gcc/gcc.c        | 20 +++++++++++++------
> > + 3 files changed, 53 insertions(+), 20 deletions(-)
> > +
> > +diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
> > +index e2e187dedaf..2faba2b1d63 100644
> > +--- a/gcc/cppdefault.c
> > ++++ b/gcc/cppdefault.c
> > +@@ -35,6 +35,30 @@
> > + # undef CROSS_INCLUDE_DIR
> > + #endif
> > +
> > ++static char GPLUSPLUS_INCLUDE_DIRVAR[4096] __attribute__ ((section (=
".gccrelocprefix"))) =3D GPLUSPLUS_INCLUDE_DIR;
> > ++static char GCC_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccr=
elocprefix"))) =3D GCC_INCLUDE_DIR;
> > ++static char GPLUSPLUS_TOOL_INCLUDE_DIRVAR[4096] __attribute__ ((sect=
ion (".gccrelocprefix"))) =3D GPLUSPLUS_TOOL_INCLUDE_DIR;
> > ++static char GPLUSPLUS_BACKWARD_INCLUDE_DIRVAR[4096] __attribute__ ((=
section (".gccrelocprefix"))) =3D GPLUSPLUS_BACKWARD_INCLUDE_DIR;
> > ++static char STANDARD_STARTFILE_PREFIX_2VAR[4096] __attribute__ ((sec=
tion (".gccrelocprefix"))) =3D STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBD=
IR_TARGET;
> > ++#ifdef LOCAL_INCLUDE_DIR
> > ++static char LOCAL_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gc=
crelocprefix"))) =3D LOCAL_INCLUDE_DIR;
> > ++#endif
> > ++#ifdef PREFIX_INCLUDE_DIR
> > ++static char PREFIX_INCLUDE_DIRVAR[4096] __attribute__ ((section (".g=
ccrelocprefix"))) =3D PREFIX_INCLUDE_DIR;
> > ++#endif
> > ++#ifdef FIXED_INCLUDE_DIR
> > ++static char FIXED_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gc=
crelocprefix"))) =3D FIXED_INCLUDE_DIR;
> > ++#endif
> > ++#ifdef CROSS_INCLUDE_DIR
> > ++static char CROSS_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gc=
crelocprefix"))) =3D CROSS_INCLUDE_DIR;
> > ++#endif
> > ++#ifdef TOOL_INCLUDE_DIR
> > ++static char TOOL_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gcc=
relocprefix"))) =3D TOOL_INCLUDE_DIR;
> > ++#endif
> > ++#ifdef NATIVE_SYSTEM_HEADER_DIR
> > ++static char NATIVE_SYSTEM_HEADER_DIRVAR[4096] __attribute__ ((sectio=
n (".gccrelocprefix"))) =3D NATIVE_SYSTEM_HEADER_DIR;
> > ++#endif
> > ++
> > + const struct default_include cpp_include_defaults[]
> > + #ifdef INCLUDE_DEFAULTS
> > + =3D INCLUDE_DEFAULTS;
> > +@@ -42,38 +66,38 @@ const struct default_include cpp_include_defaults=
[]
> > + =3D {
> > + #ifdef GPLUSPLUS_INCLUDE_DIR
> > +     /* Pick up GNU C++ generic include files.  */
> > +-    { GPLUSPLUS_INCLUDE_DIR, "G++", 1, 1,
> > ++    { GPLUSPLUS_INCLUDE_DIRVAR, "G++", 1, 1,
> > +       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
> > + #endif
> > + #ifdef GPLUSPLUS_TOOL_INCLUDE_DIR
> > +     /* Pick up GNU C++ target-dependent include files.  */
> > +-    { GPLUSPLUS_TOOL_INCLUDE_DIR, "G++", 1, 1,
> > ++    { GPLUSPLUS_TOOL_INCLUDE_DIRVAR, "G++", 1, 1,
> > +       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 1 },
> > + #endif
> > + #ifdef GPLUSPLUS_BACKWARD_INCLUDE_DIR
> > +     /* Pick up GNU C++ backward and deprecated include files.  */
> > +-    { GPLUSPLUS_BACKWARD_INCLUDE_DIR, "G++", 1, 1,
> > ++    { GPLUSPLUS_BACKWARD_INCLUDE_DIRVAR, "G++", 1, 1,
> > +       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
> > + #endif
> > + #ifdef GCC_INCLUDE_DIR
> > +     /* This is the dir for gcc's private headers.  */
> > +-    { GCC_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
> > ++    { GCC_INCLUDE_DIRVAR, "GCC", 0, 0, 0, 0 },
> > + #endif
> > + #ifdef GCC_INCLUDE_SUBDIR_TARGET
> > +     /* This is the dir for gcc's private headers under the specified=
 sysroot.  */
> > +-    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC", =
0, 0, 1, 0 },
> > ++    { STANDARD_STARTFILE_PREFIX_2VAR, "GCC", 0, 0, 1, 0 },
> > + #endif
> > + #ifdef LOCAL_INCLUDE_DIR
> > +     /* /usr/local/include comes before the fixincluded header files.=
  */
> > +-    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },
> > +-    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 0 },
> > ++    { LOCAL_INCLUDE_DIRVAR, 0, 0, 1, 1, 2 },
> > ++    { LOCAL_INCLUDE_DIRVAR, 0, 0, 1, 1, 0 },
> > + #endif
> > + #ifdef PREFIX_INCLUDE_DIR
> > +-    { PREFIX_INCLUDE_DIR, 0, 0, 1, 0, 0 },
> > ++    { PREFIX_INCLUDE_DIRVAR, 0, 0, 1, 0, 0 },
> > + #endif
> > + #ifdef FIXED_INCLUDE_DIR
> > +     /* This is the dir for fixincludes.  */
> > +-    { FIXED_INCLUDE_DIR, "GCC", 0, 0, 0,
> > ++    { FIXED_INCLUDE_DIRVAR, "GCC", 0, 0, 0,
> > +       /* A multilib suffix needs adding if different multilibs use
> > +      different headers.  */
> > + #ifdef SYSROOT_HEADERS_SUFFIX_SPEC
> > +@@ -85,16 +109,16 @@ const struct default_include cpp_include_default=
s[]
> > + #endif
> > + #ifdef CROSS_INCLUDE_DIR
> > +     /* One place the target system's headers might be.  */
> > +-    { CROSS_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
> > ++    { CROSS_INCLUDE_DIRVAR, "GCC", 0, 0, 0, 0 },
> > + #endif
> > + #ifdef TOOL_INCLUDE_DIR
> > +     /* Another place the target system's headers might be.  */
> > +-    { TOOL_INCLUDE_DIR, "BINUTILS", 0, 1, 0, 0 },
> > ++    { TOOL_INCLUDE_DIRVAR, "BINUTILS", 0, 1, 0, 0 },
> > + #endif
> > + #ifdef NATIVE_SYSTEM_HEADER_DIR
> > +     /* /usr/include comes dead last.  */
> > +-    { NATIVE_SYSTEM_HEADER_DIR, NATIVE_SYSTEM_HEADER_COMPONENT, 0, 0=
, 1, 2 },
> > +-    { NATIVE_SYSTEM_HEADER_DIR, NATIVE_SYSTEM_HEADER_COMPONENT, 0, 0=
, 1, 0 },
> > ++    { NATIVE_SYSTEM_HEADER_DIRVAR, NATIVE_SYSTEM_HEADER_COMPONENT, 0=
, 0, 1, 2 },
> > ++    { NATIVE_SYSTEM_HEADER_DIRVAR, NATIVE_SYSTEM_HEADER_COMPONENT, 0=
, 0, 1, 0 },
> > + #endif
> > +     { 0, 0, 0, 0, 0, 0 }
> > +   };
> > +diff --git a/gcc/cppdefault.h b/gcc/cppdefault.h
> > +index 4a0186d1cf2..29e5d9da0dc 100644
> > +--- a/gcc/cppdefault.h
> > ++++ b/gcc/cppdefault.h
> > +@@ -33,7 +33,8 @@
> > +
> > + struct default_include
> > + {
> > +-  const char *const fname;  /* The name of the directory.  */
> > ++  const char *fname;     /* The name of the directory.  */
> > ++
> > +   const char *const component;      /* The component containing the =
directory
> > +                                (see update_path in prefix.c) */
> > +   const char cplusplus;             /* Only look here if we're compi=
ling C++.  */
> > +diff --git a/gcc/gcc.c b/gcc/gcc.c
> > +index 3fb64d453f1..cd0c7fbe961 100644
> > +--- a/gcc/gcc.c
> > ++++ b/gcc/gcc.c
> > +@@ -248,6 +248,8 @@ FILE *report_times_to_file =3D NULL;
> > + #endif
> > + static const char *target_system_root =3D DEFAULT_TARGET_SYSTEM_ROOT=
;
> > +
> > ++static char target_relocatable_prefix[4096] __attribute__ ((section =
(".gccrelocprefix"))) =3D SYSTEMLIBS_DIR;
> > ++
> > + /* Nonzero means pass the updated target_system_root to the compiler=
.  */
> > +
> > + static int target_system_root_changed;
> > +@@ -519,6 +521,7 @@ or with constant text in a single argument.
> > +  %G     process LIBGCC_SPEC as a spec.
> > +  %R     Output the concatenation of target_system_root and
> > +         target_sysroot_suffix.
> > ++ %r     Output the base path target_relocatable_prefix
> > +  %S     process STARTFILE_SPEC as a spec.  A capital S is actually u=
sed here.
> > +  %E     process ENDFILE_SPEC as a spec.  A capital E is actually use=
d here.
> > +  %C     process CPP_SPEC as a spec.
> > +@@ -1487,10 +1490,10 @@ static const char *gcc_libexec_prefix;
> > +    gcc_exec_prefix is set because, in that case, we know where the
> > +    compiler has been installed, and use paths relative to that
> > +    location instead.  */
> > +-static const char *const standard_exec_prefix =3D STANDARD_EXEC_PREF=
IX;
> > +-static const char *const standard_libexec_prefix =3D STANDARD_LIBEXE=
C_PREFIX;
> > +-static const char *const standard_bindir_prefix =3D STANDARD_BINDIR_=
PREFIX;
> > +-static const char *const standard_startfile_prefix =3D STANDARD_STAR=
TFILE_PREFIX;
> > ++static char standard_exec_prefix[4096] __attribute__ ((section (".gc=
crelocprefix"))) =3D STANDARD_EXEC_PREFIX;
> > ++static char standard_libexec_prefix[4096] __attribute__ ((section ("=
.gccrelocprefix"))) =3D STANDARD_LIBEXEC_PREFIX;
> > ++static char standard_bindir_prefix[4096] __attribute__ ((section (".=
gccrelocprefix"))) =3D STANDARD_BINDIR_PREFIX;
> > ++static char *const standard_startfile_prefix =3D STANDARD_STARTFILE_=
PREFIX;
> > +
> > + /* For native compilers, these are well-known paths containing
> > +    components that may be provided by the system.  For cross
> > +@@ -1498,9 +1501,9 @@ static const char *const standard_startfile_pre=
fix =3D STANDARD_STARTFILE_PREFIX;
> > + static const char *md_exec_prefix =3D MD_EXEC_PREFIX;
> > + static const char *md_startfile_prefix =3D MD_STARTFILE_PREFIX;
> > + static const char *md_startfile_prefix_1 =3D MD_STARTFILE_PREFIX_1;
> > +-static const char *const standard_startfile_prefix_1
> > ++static char standard_startfile_prefix_1[4096] __attribute__ ((sectio=
n (".gccrelocprefix")))
> > +   =3D STANDARD_STARTFILE_PREFIX_1;
> > +-static const char *const standard_startfile_prefix_2
> > ++static char standard_startfile_prefix_2[4096] __attribute__ ((sectio=
n (".gccrelocprefix")))
> > +   =3D STANDARD_STARTFILE_PREFIX_2;
> > +
> > + /* A relative path to be used in finding the location of tools
> > +@@ -5849,6 +5852,11 @@ do_spec_1 (const char *spec, int inswitch, con=
st char *soft_matched_part)
> > +           }
> > +         break;
> > +
> > ++          case 'r':
> > ++              obstack_grow (&obstack, target_relocatable_prefix,
> > ++                  strlen (target_relocatable_prefix));
> > ++            break;
> > ++
> > +       case 'S':
> > +         value =3D do_spec_1 (startfile_spec, 0, NULL);
> > +         if (value !=3D 0)
> > +--
> > +2.17.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0030-=
Search-target-sysroot-gcc-version-specific-dirs-with.patch b/meta-arm-toolc=
hain/recipes-devtools/gcc/gcc-arm-8.2/0030-Search-target-sysroot-gcc-versio=
n-specific-dirs-with.patch
> > new file mode 100644
> > index 0000000..33566df
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0030-Search-=
target-sysroot-gcc-version-specific-dirs-with.patch
> > @@ -0,0 +1,102 @@
> > +From f5cc8cd0c44092dc487106ade27e011c1f584ada Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Mon, 7 Dec 2015 23:41:45 +0000
> > +Subject: [PATCH 30/39] Search target sysroot gcc version specific dir=
s with
> > + multilib.
> > +
> > +We install the gcc libraries (such as crtbegin.p) into
> > +<sysroot><libdir>/<target-sys>/5.2.0/
> > +which is a default search path for GCC (aka multi_suffix in the
> > +code below). <target-sys> is 'machine' in gcc's terminology. We use
> > +these directories so that multiple gcc versions could in theory
> > +co-exist on target.
> > +
> > +We only want to build one gcc-cross-canadian per arch and have this w=
ork
> > +for all multilibs. <target-sys> can be handled by mapping the multili=
b
> > +<target-sys> to the one used by gcc-cross-canadian, e.g.
> > +mips64-polkmllib32-linux
> > +is symlinked to by mips64-poky-linux.
> > +
> > +The default gcc search path in the target sysroot for a "lib64" mutli=
lib
> > +is:
> > +
> > +<sysroot>/lib32/mips64-poky-linux/5.2.0/
> > +<sysroot>/lib32/../lib64/
> > +<sysroot>/usr/lib32/mips64-poky-linux/5.2.0/
> > +<sysroot>/usr/lib32/../lib64/
> > +<sysroot>/lib32/
> > +<sysroot>/usr/lib32/
> > +
> > +which means that the lib32 crtbegin.o will be found and the lib64 one=
s
> > +will not which leads to compiler failures.
> > +
> > +This patch injects a multilib version of that path first so the lib64
> > +binaries can be found first. With this change the search path becomes=
:
> > +
> > +<sysroot>/lib32/../lib64/mips64-poky-linux/5.2.0/
> > +<sysroot>/lib32/mips64-poky-linux/5.2.0/
> > +<sysroot>/lib32/../lib64/
> > +<sysroot>/usr/lib32/../lib64/mips64-poky-linux/5.2.0/
> > +<sysroot>/usr/lib32/mips64-poky-linux/5.2.0/
> > +<sysroot>/usr/lib32/../lib64/
> > +<sysroot>/lib32/
> > +<sysroot>/usr/lib32/
> > +
> > +Upstream-Status: Pending
> > +RP 2015/7/31
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + gcc/gcc.c | 29 ++++++++++++++++++++++++++++-
> > + 1 file changed, 28 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/gcc/gcc.c b/gcc/gcc.c
> > +index cd0c7fbe961..f6f3aa077c8 100644
> > +--- a/gcc/gcc.c
> > ++++ b/gcc/gcc.c
> > +@@ -2527,7 +2527,7 @@ for_each_path (const struct path_prefix *paths,
> > +       if (path =3D=3D NULL)
> > +     {
> > +       len =3D paths->max_len + extra_space + 1;
> > +-      len +=3D MAX (MAX (suffix_len, multi_os_dir_len), multiarch_le=
n);
> > ++      len +=3D MAX ((suffix_len + multi_os_dir_len), multiarch_len);
> > +       path =3D XNEWVEC (char, len);
> > +     }
> > +
> > +@@ -2539,6 +2539,33 @@ for_each_path (const struct path_prefix *paths=
,
> > +       /* Look first in MACHINE/VERSION subdirectory.  */
> > +       if (!skip_multi_dir)
> > +         {
> > ++          if (!(pl->os_multilib ? skip_multi_os_dir : skip_multi_dir=
))
> > ++            {
> > ++              const char *this_multi;
> > ++              size_t this_multi_len;
> > ++
> > ++              if (pl->os_multilib)
> > ++                {
> > ++                  this_multi =3D multi_os_dir;
> > ++                  this_multi_len =3D multi_os_dir_len;
> > ++                }
> > ++              else
> > ++                {
> > ++                  this_multi =3D multi_dir;
> > ++                  this_multi_len =3D multi_dir_len;
> > ++                }
> > ++
> > ++              /* Look in multilib MACHINE/VERSION subdirectory first=
 */
> > ++              if (this_multi_len)
> > ++                {
> > ++                  memcpy (path + len, this_multi, this_multi_len + 1=
);
> > ++                  memcpy (path + len + this_multi_len, multi_suffix,=
 suffix_len + 1);
> > ++                  ret =3D callback (path, callback_info);
> > ++                    if (ret)
> > ++                      break;
> > ++                }
> > ++            }
> > ++
> > +           memcpy (path + len, multi_suffix, suffix_len + 1);
> > +           ret =3D callback (path, callback_info);
> > +           if (ret)
> > +--
> > +2.17.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0031-=
Fix-various-_FOR_BUILD-and-related-variables.patch b/meta-arm-toolchain/rec=
ipes-devtools/gcc/gcc-arm-8.2/0031-Fix-various-_FOR_BUILD-and-related-varia=
bles.patch
> > new file mode 100644
> > index 0000000..dabc005
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0031-Fix-var=
ious-_FOR_BUILD-and-related-variables.patch
> > @@ -0,0 +1,137 @@
> > +From 93b4e1d3a0f8417118d1c48fcd1ce51996e1420b Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Mon, 7 Dec 2015 23:42:45 +0000
> > +Subject: [PATCH 31/39] Fix various _FOR_BUILD and related variables
> > +
> > +When doing a FOR_BUILD thing, you have to override CFLAGS with
> > +CFLAGS_FOR_BUILD. And if you use C++, you also have to override
> > +CXXFLAGS with CXXFLAGS_FOR_BUILD.
> > +Without this, when building for mingw, you end up trying to use
> > +the mingw headers for a host build.
> > +
> > +The same goes for other variables as well, such as CPPFLAGS,
> > +CPP, and GMPINC.
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
> > +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + Makefile.in      | 6 ++++++
> > + Makefile.tpl     | 5 +++++
> > + gcc/Makefile.in  | 2 +-
> > + gcc/configure    | 2 +-
> > + gcc/configure.ac | 2 +-
> > + 5 files changed, 14 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/Makefile.in b/Makefile.in
> > +index 1af45580086..8966453c32c 100644
> > +--- a/Makefile.in
> > ++++ b/Makefile.in
> > +@@ -152,6 +152,7 @@ BUILD_EXPORTS =3D \
> > +     CPP=3D"$(CC_FOR_BUILD) -E"; export CPP; \
> > +     CFLAGS=3D"$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
> > +     CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> > ++    CPPFLAGS=3D"$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS; \
> > +     CXX=3D"$(CXX_FOR_BUILD)"; export CXX; \
> > +     CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
> > +     GFORTRAN=3D"$(GFORTRAN_FOR_BUILD)"; export GFORTRAN; \
> > +@@ -169,6 +170,9 @@ BUILD_EXPORTS =3D \
> > + # built for the build system to override those in BASE_FLAGS_TO_PASS=
.
> > + EXTRA_BUILD_FLAGS =3D \
> > +     CFLAGS=3D"$(CFLAGS_FOR_BUILD)" \
> > ++    CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)" \
> > ++    CPP=3D"$(CC_FOR_BUILD) -E" \
> > ++    CPPFLAGS=3D"$(CPPFLAGS_FOR_BUILD)" \
> > +     LDFLAGS=3D"$(LDFLAGS_FOR_BUILD)"
> > +
> > + # This is the list of directories to built for the host system.
> > +@@ -186,6 +190,7 @@ HOST_SUBDIR =3D @host_subdir@
> > + HOST_EXPORTS =3D \
> > +     $(BASE_EXPORTS) \
> > +     CC=3D"$(CC)"; export CC; \
> > ++    CPP=3D"$(CC) -E"; export CPP; \
> > +     ADA_CFLAGS=3D"$(ADA_CFLAGS)"; export ADA_CFLAGS; \
> > +     CFLAGS=3D"$(CFLAGS)"; export CFLAGS; \
> > +     CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> > +@@ -753,6 +758,7 @@ BASE_FLAGS_TO_PASS =3D \
> > +     "CC_FOR_BUILD=3D$(CC_FOR_BUILD)" \
> > +     "CFLAGS_FOR_BUILD=3D$(CFLAGS_FOR_BUILD)" \
> > +     "CXX_FOR_BUILD=3D$(CXX_FOR_BUILD)" \
> > ++    "CXXFLAGS_FOR_BUILD=3D$(CXXFLAGS_FOR_BUILD)" \
> > +     "EXPECT=3D$(EXPECT)" \
> > +     "FLEX=3D$(FLEX)" \
> > +     "INSTALL=3D$(INSTALL)" \
> > +diff --git a/Makefile.tpl b/Makefile.tpl
> > +index abd2bc2fb89..5822b260404 100644
> > +--- a/Makefile.tpl
> > ++++ b/Makefile.tpl
> > +@@ -154,6 +154,7 @@ BUILD_EXPORTS =3D \
> > +     CC=3D"$(CC_FOR_BUILD)"; export CC; \
> > +     CFLAGS=3D"$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
> > +     CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> > ++    CPPFLAGS=3D"$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS; \
> > +     CXX=3D"$(CXX_FOR_BUILD)"; export CXX; \
> > +     CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
> > +     GFORTRAN=3D"$(GFORTRAN_FOR_BUILD)"; export GFORTRAN; \
> > +@@ -171,6 +172,9 @@ BUILD_EXPORTS =3D \
> > + # built for the build system to override those in BASE_FLAGS_TO_PASS=
.
> > + EXTRA_BUILD_FLAGS =3D \
> > +     CFLAGS=3D"$(CFLAGS_FOR_BUILD)" \
> > ++    CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)" \
> > ++    CPP=3D"$(CC_FOR_BUILD) -E" \
> > ++    CPPFLAGS=3D"$(CPPFLAGS_FOR_BUILD)" \
> > +     LDFLAGS=3D"$(LDFLAGS_FOR_BUILD)"
> > +
> > + # This is the list of directories to built for the host system.
> > +@@ -188,6 +192,7 @@ HOST_SUBDIR =3D @host_subdir@
> > + HOST_EXPORTS =3D \
> > +     $(BASE_EXPORTS) \
> > +     CC=3D"$(CC)"; export CC; \
> > ++    CPP=3D"$(CC) -E"; export CPP; \
> > +     ADA_CFLAGS=3D"$(ADA_CFLAGS)"; export ADA_CFLAGS; \
> > +     CFLAGS=3D"$(CFLAGS)"; export CFLAGS; \
> > +     CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> > +diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> > +index 5ae693fb06c..02ee0aa72f4 100644
> > +--- a/gcc/Makefile.in
> > ++++ b/gcc/Makefile.in
> > +@@ -801,7 +801,7 @@ BUILD_LDFLAGS=3D@BUILD_LDFLAGS@
> > + BUILD_NO_PIE_FLAG =3D @BUILD_NO_PIE_FLAG@
> > + BUILD_LDFLAGS +=3D $(BUILD_NO_PIE_FLAG)
> > + BUILD_CPPFLAGS=3D -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
> > +-            -I$(srcdir)/../include @INCINTL@ $(CPPINC) $(CPPFLAGS)
> > ++            -I$(srcdir)/../include @INCINTL@ $(CPPINC) $(CPPFLAGS_FO=
R_BUILD)
> > +
> > + # Actual name to use when installing a native compiler.
> > + GCC_INSTALL_NAME :=3D $(shell echo gcc|sed '$(program_transform_name=
)')
> > +diff --git a/gcc/configure b/gcc/configure
> > +index cfcadc93a01..2f6b4f72ef3 100755
> > +--- a/gcc/configure
> > ++++ b/gcc/configure
> > +@@ -11797,7 +11797,7 @@ else
> > +     CC=3D"${CC_FOR_BUILD}" CFLAGS=3D"${CFLAGS_FOR_BUILD}" \
> > +     CXX=3D"${CXX_FOR_BUILD}" CXXFLAGS=3D"${CXXFLAGS_FOR_BUILD}" \
> > +     LD=3D"${LD_FOR_BUILD}" LDFLAGS=3D"${LDFLAGS_FOR_BUILD}" \
> > +-    GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS} -DGENERATOR_FILE" \
> > ++    GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS_FOR_BUILD} -DGENERATOR_FILE" =
\
> > +     ${realsrcdir}/configure \
> > +             --enable-languages=3D${enable_languages-all} \
> > +             --target=3D$target_alias --host=3D$build_alias --build=
=3D$build_alias
> > +diff --git a/gcc/configure.ac b/gcc/configure.ac
> > +index 44b90478f55..9f8a51fc9bd 100644
> > +--- a/gcc/configure.ac
> > ++++ b/gcc/configure.ac
> > +@@ -1708,7 +1708,7 @@ else
> > +     CC=3D"${CC_FOR_BUILD}" CFLAGS=3D"${CFLAGS_FOR_BUILD}" \
> > +     CXX=3D"${CXX_FOR_BUILD}" CXXFLAGS=3D"${CXXFLAGS_FOR_BUILD}" \
> > +     LD=3D"${LD_FOR_BUILD}" LDFLAGS=3D"${LDFLAGS_FOR_BUILD}" \
> > +-    GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS} -DGENERATOR_FILE" \
> > ++    GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS_FOR_BUILD} -DGENERATOR_FILE" =
\
> > +     ${realsrcdir}/configure \
> > +             --enable-languages=3D${enable_languages-all} \
> > +             --target=3D$target_alias --host=3D$build_alias --build=
=3D$build_alias
> > +--
> > +2.17.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0032-=
nios2-Define-MUSL_DYNAMIC_LINKER.patch b/meta-arm-toolchain/recipes-devtool=
s/gcc/gcc-arm-8.2/0032-nios2-Define-MUSL_DYNAMIC_LINKER.patch
> > new file mode 100644
> > index 0000000..6dd9d54
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0032-nios2-D=
efine-MUSL_DYNAMIC_LINKER.patch
> > @@ -0,0 +1,28 @@
> > +From 99f3e3b427996ac579d95e68440a0bd7af7ef0fc Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Tue, 2 Feb 2016 10:26:10 -0800
> > +Subject: [PATCH 32/39] nios2: Define MUSL_DYNAMIC_LINKER
> > +
> > +Signed-off-by: Marek Vasut <marex@denx.de>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > +Upstream-Status: Pending
> > +
> > + gcc/config/nios2/linux.h | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/gcc/config/nios2/linux.h b/gcc/config/nios2/linux.h
> > +index 4729105626d..36181eb7b85 100644
> > +--- a/gcc/config/nios2/linux.h
> > ++++ b/gcc/config/nios2/linux.h
> > +@@ -30,6 +30,7 @@
> > + #define CPP_SPEC "%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRANT}"
> > +
> > + #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-nios2.so.1"
> > ++#define MUSL_DYNAMIC_LINKER  "/lib/ld-musl-nios2.so.1"
> > +
> > + #undef LINK_SPEC
> > + #define LINK_SPEC LINK_SPEC_ENDIAN \
> > +--
> > +2.17.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0033-=
Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch b/meta-arm-toolc=
hain/recipes-devtools/gcc/gcc-arm-8.2/0033-Add-ssp_nonshared-to-link-comman=
dline-for-musl-targe.patch
> > new file mode 100644
> > index 0000000..05a6b0a
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0033-Add-ssp=
_nonshared-to-link-commandline-for-musl-targe.patch
> > @@ -0,0 +1,87 @@
> > +From 84b55ab2f68710a583d4ec810ea8b3b68576f8aa Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Tue, 27 Jun 2017 18:10:54 -0700
> > +Subject: [PATCH 33/39] Add ssp_nonshared to link commandline for musl=
 targets
> > +
> > +when -fstack-protector options are enabled we need to
> > +link with ssp_shared on musl since it does not provide
> > +the __stack_chk_fail_local() so essentially it provides
> > +libssp but not libssp_nonshared something like
> > +TARGET_LIBC_PROVIDES_SSP_BUT_NOT_SSP_NONSHARED
> > + where-as for glibc the needed symbols
> > +are already present in libc_nonshared library therefore
> > +we do not need any library helper on glibc based systems
> > +but musl needs the libssp_noshared from gcc
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + gcc/config/linux.h          |  7 +++++++
> > + gcc/config/rs6000/linux.h   | 10 ++++++++++
> > + gcc/config/rs6000/linux64.h | 10 ++++++++++
> > + 3 files changed, 27 insertions(+)
> > +
> > +diff --git a/gcc/config/linux.h b/gcc/config/linux.h
> > +index 487b0c0923b..4769d089538 100644
> > +--- a/gcc/config/linux.h
> > ++++ b/gcc/config/linux.h
> > +@@ -182,6 +182,13 @@ see the files COPYING3 and COPYING.RUNTIME respe=
ctively.  If not, see
> > +     { GCC_INCLUDE_DIR, "GCC", 0, 1, 0, 0 },         \
> > +     { 0, 0, 0, 0, 0, 0 }                            \
> > +   }
> > ++#ifdef TARGET_LIBC_PROVIDES_SSP
> > ++#undef LINK_SSP_SPEC
> > ++#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
> > ++                   "|fstack-protector-strong|fstack-protector-explic=
it" \
> > ++                   ":-lssp_nonshared}"
> > ++#endif
> > ++
> > + #endif
> > +
> > + #if (DEFAULT_LIBC =3D=3D LIBC_UCLIBC) && defined (SINGLE_LIBC) /* uC=
linux */
> > +diff --git a/gcc/config/rs6000/linux.h b/gcc/config/rs6000/linux.h
> > +index 01b40c762f6..e7c5e92215c 100644
> > +--- a/gcc/config/rs6000/linux.h
> > ++++ b/gcc/config/rs6000/linux.h
> > +@@ -92,6 +92,16 @@
> > +                                      " -m elf32ppclinux")
> > + #endif
> > +
> > ++/* link libssp_nonshared.a with musl */
> > ++#if DEFAULT_LIBC =3D=3D LIBC_MUSL
> > ++#ifdef TARGET_LIBC_PROVIDES_SSP
> > ++#undef LINK_SSP_SPEC
> > ++#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
> > ++                   "|fstack-protector-strong|fstack-protector-explic=
it" \
> > ++                   ":-lssp_nonshared}"
> > ++#endif
> > ++#endif
> > ++
> > + #undef LINK_OS_LINUX_SPEC
> > + #define LINK_OS_LINUX_SPEC LINK_OS_LINUX_EMUL " %{!shared: %{!static=
: \
> > +   %{!static-pie: \
> > +diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.=
h
> > +index 55695dadd91..60f1ee24985 100644
> > +--- a/gcc/config/rs6000/linux64.h
> > ++++ b/gcc/config/rs6000/linux64.h
> > +@@ -473,6 +473,16 @@ extern int dot_symbols;
> > +                                        " -m elf64ppc")
> > + #endif
> > +
> > ++/* link libssp_nonshared.a with musl */
> > ++#if DEFAULT_LIBC =3D=3D LIBC_MUSL
> > ++#ifdef TARGET_LIBC_PROVIDES_SSP
> > ++#undef LINK_SSP_SPEC
> > ++#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
> > ++                   "|fstack-protector-strong|fstack-protector-explic=
it" \
> > ++                   ":-lssp_nonshared}"
> > ++#endif
> > ++#endif
> > ++
> > + #define LINK_OS_LINUX_SPEC32 LINK_OS_LINUX_EMUL32 " %{!shared: %{!st=
atic: \
> > +   %{!static-pie: \
> > +     %{rdynamic:-export-dynamic} \
> > +--
> > +2.17.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0034-=
libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch b/meta-arm-toolchain/recipes-d=
evtools/gcc/gcc-arm-8.2/0034-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
> > new file mode 100644
> > index 0000000..391cda7
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0034-libgcc-=
Add-knob-to-use-ldbl-128-on-ppc.patch
> > @@ -0,0 +1,465 @@
> > +From faf35e26740461fe1a1da5433d5a0169a663e3b5 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Apr 2016 20:03:28 +0000
> > +Subject: [PATCH 34/39] libgcc: Add knob to use ldbl-128 on ppc
> > +
> > +musl does not support ldbl 128 so we can not assume
> > +that linux as a whole supports ldbl-128 bits, instead
> > +act upon configure option passed to gcc and assume no
> > +on musl and yes otherwise if no option is passed since
> > +default behaviour is to assume ldbl128 it does not
> > +change the defaults
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > +Upstream-Status: Pending
> > +
> > + libgcc/Makefile.in           |  1 +
> > + libgcc/config/rs6000/t-linux |  5 ++++-
> > + libgcc/configure             | 18 ++++++++++++++++++
> > + libgcc/configure.ac          | 12 ++++++++++++
> > + 4 files changed, 35 insertions(+), 1 deletion(-)
> > + mode change 100644 =3D> 100755 libgcc/configure
> > +
> > +diff --git a/libgcc/Makefile.in b/libgcc/Makefile.in
> > +index dd8cee99fd3..b5f478af382 100644
> > +--- a/libgcc/Makefile.in
> > ++++ b/libgcc/Makefile.in
> > +@@ -48,6 +48,7 @@ unwind_header =3D @unwind_header@
> > + md_unwind_header =3D @md_unwind_header@
> > + sfp_machine_header =3D @sfp_machine_header@
> > + thread_header =3D @thread_header@
> > ++with_ldbl128 =3D @with_ldbl128@
> > +
> > + host_noncanonical =3D @host_noncanonical@
> > + real_host_noncanonical =3D @real_host_noncanonical@
> > +diff --git a/libgcc/config/rs6000/t-linux b/libgcc/config/rs6000/t-li=
nux
> > +index 4f6d4c4a4d2..c50dd94a2da 100644
> > +--- a/libgcc/config/rs6000/t-linux
> > ++++ b/libgcc/config/rs6000/t-linux
> > +@@ -1,3 +1,9 @@
> > + SHLIB_MAPFILES +=3D $(srcdir)/config/rs6000/libgcc-glibc.ver
> > +
> > +-HOST_LIBGCC2_CFLAGS +=3D -mlong-double-128 -mno-minimal-toc
> > ++ifeq ($(with_ldbl128),yes)
> > ++HOST_LIBGCC2_CFLAGS +=3D -mlong-double-128
> > ++else
> > ++# We do not want to build ibm-ldouble.c.
> > ++LIB2ADD :=3D $(filter-out %ibm-ldouble.c, $(LIB2ADD))
> > ++endif
> > ++HOST_LIBGCC2_CFLAGS +=3D -mno-minimal-toc
> > +diff --git a/libgcc/config/rs6000/fixtfdi.c b/libgcc/config/rs6000/fi=
xtfdi.c
> > +--- a/libgcc/config/rs6000/fixtfdi.c 1969-12-31 19:00:00.000000000 -0=
500
> > ++++ b/libgcc/config/rs6000/fixtfdi.c 2018-12-12 17:54:50.110755540 -0=
500
> > +@@ -0,0 +1,42 @@
> > ++/* Software floating-point emulation.
> > ++   Convert a to 64bit signed integer
> > ++   Copyright (C) 1997-2016 Free Software Foundation, Inc.
> > ++   This file is part of the GNU C Library.
> > ++   Contributed by Richard Henderson (rth@cygnus.com) and
> > ++              Jakub Jelinek (jj@ultra.linux.cz).
> > ++
> > ++   The GNU C Library is free software; you can redistribute it and/o=
r
> > ++   modify it under the terms of the GNU Lesser General Public
> > ++   License as published by the Free Software Foundation; either
> > ++   version 2.1 of the License, or (at your option) any later version=
.
> > ++
> > ++   In addition to the permissions in the GNU Lesser General Public
> > ++   License, the Free Software Foundation gives you unlimited
> > ++   permission to link the compiled version of this file into
> > ++   combinations with other programs, and to distribute those
> > ++   combinations without any restriction coming from the use of this
> > ++   file.  (The Lesser General Public License restrictions do apply i=
n
> > ++   other respects; for example, they cover modification of the file,
> > ++   and distribution when not linked into a combine executable.)
> > ++
> > ++   The GNU C Library is distributed in the hope that it will be usef=
ul,
> > ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> > ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> > ++   Lesser General Public License for more details.
> > ++
> > ++   You should have received a copy of the GNU Lesser General Public
> > ++   License along with the GNU C Library; if not, see
> > ++   <http://www.gnu.org/licenses/>.  */
> > ++
> > ++#ifdef _ARCH_PPC64
> > ++#include "soft-fp.h"
> > ++#include "quad-float128.h"
> > ++
> > ++DItype
> > ++__fixtfdi (TFtype a)
> > ++{
> > ++  if (a < 0)
> > ++    return - __fixunstfdi (-a);
> > ++  return __fixunstfdi (a);
> > ++}
> > ++#endif
> > +diff --git a/libgcc/config/rs6000/fixunstfdi.c b/libgcc/config/rs6000=
/fixunstfdi.c
> > +--- a/libgcc/config/rs6000/fixunstfdi.c      1969-12-31 19:00:00.0000=
00000 -0500
> > ++++ b/libgcc/config/rs6000/fixunstfdi.c      2018-12-12 17:56:06.1416=
54537 -0500
> > +@@ -0,0 +1,58 @@
> > ++/* Software floating-point emulation.
> > ++   Convert a to 64bit unsigned integer
> > ++   Copyright (C) 1997-2016 Free Software Foundation, Inc.
> > ++   This file is part of the GNU C Library.
> > ++   Contributed by Richard Henderson (rth@cygnus.com) and
> > ++              Jakub Jelinek (jj@ultra.linux.cz).
> > ++
> > ++   The GNU C Library is free software; you can redistribute it and/o=
r
> > ++   modify it under the terms of the GNU Lesser General Public
> > ++   License as published by the Free Software Foundation; either
> > ++   version 2.1 of the License, or (at your option) any later version=
.
> > ++
> > ++   In addition to the permissions in the GNU Lesser General Public
> > ++   License, the Free Software Foundation gives you unlimited
> > ++   permission to link the compiled version of this file into
> > ++   combinations with other programs, and to distribute those
> > ++   combinations without any restriction coming from the use of this
> > ++   file.  (The Lesser General Public License restrictions do apply i=
n
> > ++   other respects; for example, they cover modification of the file,
> > ++   and distribution when not linked into a combine executable.)
> > ++
> > ++   The GNU C Library is distributed in the hope that it will be usef=
ul,
> > ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> > ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> > ++   Lesser General Public License for more details.
> > ++
> > ++   You should have received a copy of the GNU Lesser General Public
> > ++   License along with the GNU C Library; if not, see
> > ++   <http://www.gnu.org/licenses/>.  */
> > ++
> > ++#ifdef _ARCH_PPC64
> > ++#include "soft-fp.h"
> > ++#include "quad-float128.h"
> > ++
> > ++DItype
> > ++__fixunstfdi (TFtype a)
> > ++{
> > ++  if (a < 0)
> > ++    return 0;
> > ++
> > ++  /* Compute high word of result, as a flonum.  */
> > ++  const TFtype b =3D (a / (((UDItype) 1) << (sizeof (SItype) * 8)));
> > ++  /* Convert that to fixed (but not to DItype!),
> > ++     and shift it into the high word.  */
> > ++  UDItype v =3D (USItype) b;
> > ++  v <<=3D (sizeof (SItype) * 8);
> > ++  /* Remove high part from the TFtype, leaving the low part as flonu=
m.  */
> > ++  a -=3D (TFtype) v;
> > ++  /* Convert that to fixed (but not to DItype!) and add it in.
> > ++     Sometimes A comes out negative.  This is significant, since
> > ++     A has more bits than a long int does.  */
> > ++  if (a < 0)
> > ++    v -=3D (USItype) (-a);
> > ++  else
> > ++    v +=3D (USItype) a;
> > ++  return v;
> > ++}
> > ++#endif
> > +diff --git a/libgcc/config/rs6000/floatditf.c b/libgcc/config/rs6000/=
floatditf.c
> > +--- a/libgcc/config/rs6000/floatditf.c       1969-12-31 19:00:00.0000=
00000 -0500
> > ++++ b/libgcc/config/rs6000/floatditf.c       2018-12-12 17:57:55.8529=
53553 -0500
> > +@@ -0,0 +1,47 @@
> > ++/* Software floating-point emulation.
> > ++   Convert a 64bit signed integer to IEEE quad
> > ++   Copyright (C) 1997-2016 Free Software Foundation, Inc.
> > ++   This file is part of the GNU C Library.
> > ++   Contributed by Richard Henderson (rth@cygnus.com) and
> > ++              Jakub Jelinek (jj@ultra.linux.cz).
> > ++
> > ++   The GNU C Library is free software; you can redistribute it and/o=
r
> > ++   modify it under the terms of the GNU Lesser General Public
> > ++   License as published by the Free Software Foundation; either
> > ++   version 2.1 of the License, or (at your option) any later version=
.
> > ++
> > ++   In addition to the permissions in the GNU Lesser General Public
> > ++   License, the Free Software Foundation gives you unlimited
> > ++   permission to link the compiled version of this file into
> > ++   combinations with other programs, and to distribute those
> > ++   combinations without any restriction coming from the use of this
> > ++   file.  (The Lesser General Public License restrictions do apply i=
n
> > ++   other respects; for example, they cover modification of the file,
> > ++   and distribution when not linked into a combine executable.)
> > ++
> > ++   The GNU C Library is distributed in the hope that it will be usef=
ul,
> > ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> > ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> > ++   Lesser General Public License for more details.
> > ++
> > ++   You should have received a copy of the GNU Lesser General Public
> > ++   License along with the GNU C Library; if not, see
> > ++   <http://www.gnu.org/licenses/>.  */
> > ++
> > ++#ifdef _ARCH_PPC64
> > ++#include "soft-fp.h"
> > ++#include "double.h"
> > ++#include "quad-float128.h"
> > ++
> > ++TFtype
> > ++__floatditf (DItype u)
> > ++{
> > ++  DFtype dh, dl;
> > ++
> > ++  dh =3D (SItype) (u >> (sizeof (SItype) * 8));
> > ++  dh *=3D 2.0 * (((UDItype) 1) << ((sizeof (SItype) * 8) - 1));
> > ++  dl =3D (USItype) (u & ((((UDItype) 1) << (sizeof (SItype) * 8)) - =
1));
> > ++
> > ++  return (TFtype) dh + (TFtype) dl;
> > ++}
> > ++#endif
> > +diff --git a/libgcc/config/rs6000/floatunditf.c b/libgcc/config/rs600=
0/floatunditf.c
> > +--- a/libgcc/config/rs6000/floatunditf.c     1969-12-31 19:00:00.0000=
00000 -0500
> > ++++ b/libgcc/config/rs6000/floatunditf.c     2018-12-12 17:57:15.2624=
73574 -0500
> > +@@ -0,0 +1,47 @@
> > ++/* Software floating-point emulation.
> > ++   Convert a 64bit unsigned integer to IEEE quad
> > ++   Copyright (C) 1997-2016 Free Software Foundation, Inc.
> > ++   This file is part of the GNU C Library.
> > ++   Contributed by Richard Henderson (rth@cygnus.com) and
> > ++              Jakub Jelinek (jj@ultra.linux.cz).
> > ++
> > ++   The GNU C Library is free software; you can redistribute it and/o=
r
> > ++   modify it under the terms of the GNU Lesser General Public
> > ++   License as published by the Free Software Foundation; either
> > ++   version 2.1 of the License, or (at your option) any later version=
.
> > ++
> > ++   In addition to the permissions in the GNU Lesser General Public
> > ++   License, the Free Software Foundation gives you unlimited
> > ++   permission to link the compiled version of this file into
> > ++   combinations with other programs, and to distribute those
> > ++   combinations without any restriction coming from the use of this
> > ++   file.  (The Lesser General Public License restrictions do apply i=
n
> > ++   other respects; for example, they cover modification of the file,
> > ++   and distribution when not linked into a combine executable.)
> > ++
> > ++   The GNU C Library is distributed in the hope that it will be usef=
ul,
> > ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> > ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> > ++   Lesser General Public License for more details.
> > ++
> > ++   You should have received a copy of the GNU Lesser General Public
> > ++   License along with the GNU C Library; if not, see
> > ++   <http://www.gnu.org/licenses/>.  */
> > ++
> > ++#ifdef _ARCH_PPC64
> > ++#include "soft-fp.h"
> > ++#include "double.h"
> > ++#include "quad-float128.h"
> > ++
> > ++TFtype
> > ++__floatunditf (UDItype u)
> > ++{
> > ++  DFtype dh, dl;
> > ++
> > ++  dh =3D (USItype) (u >> (sizeof (SItype) * 8));
> > ++  dh *=3D 2.0 * (((UDItype) 1) << ((sizeof (SItype) * 8) - 1));
> > ++  dl =3D (USItype) (u & ((((UDItype) 1) << (sizeof (SItype) * 8)) - =
1));
> > ++
> > ++  return (TFtype) dh + (TFtype) dl;
> > ++}
> > ++#endif
> > +diff --git a/libgcc/config/rs6000/ppc64-fp.c b/libgcc/config/rs6000/p=
pc64-fp.c
> > +--- a/libgcc/config/rs6000/ppc64-fp.c        2018-12-12 17:53:49.5400=
38500 -0500
> > ++++ b/libgcc/config/rs6000/ppc64-fp.c        2018-12-12 17:49:51.8972=
35314 -0500
> > +@@ -25,34 +25,21 @@
> > + <http://www.gnu.org/licenses/>.  */
> > +
> > + #if defined(__powerpc64__) || defined (__64BIT__) || defined(__ppc64=
__)
> > +-#define TMODES
> > + #include "fp-bit.h"
> > +
> > +-extern DItype __fixtfdi (TFtype);
> > + extern DItype __fixdfdi (DFtype);
> > + extern DItype __fixsfdi (SFtype);
> > + extern USItype __fixunsdfsi (DFtype);
> > + extern USItype __fixunssfsi (SFtype);
> > +-extern TFtype __floatditf (DItype);
> > +-extern TFtype __floatunditf (UDItype);
> > + extern DFtype __floatdidf (DItype);
> > + extern DFtype __floatundidf (UDItype);
> > + extern SFtype __floatdisf (DItype);
> > + extern SFtype __floatundisf (UDItype);
> > +-extern DItype __fixunstfdi (TFtype);
> > +
> > + static DItype local_fixunssfdi (SFtype);
> > + static DItype local_fixunsdfdi (DFtype);
> > +
> > + DItype
> > +-__fixtfdi (TFtype a)
> > +-{
> > +-  if (a < 0)
> > +-    return - __fixunstfdi (-a);
> > +-  return __fixunstfdi (a);
> > +-}
> > +-
> > +-DItype
> > + __fixdfdi (DFtype a)
> > + {
> > +   if (a < 0)
> > +@@ -86,30 +73,6 @@
> > +   return (SItype) a;
> > + }
> > +
> > +-TFtype
> > +-__floatditf (DItype u)
> > +-{
> > +-  DFtype dh, dl;
> > +-
> > +-  dh =3D (SItype) (u >> (sizeof (SItype) * 8));
> > +-  dh *=3D 2.0 * (((UDItype) 1) << ((sizeof (SItype) * 8) - 1));
> > +-  dl =3D (USItype) (u & ((((UDItype) 1) << (sizeof (SItype) * 8)) - =
1));
> > +-
> > +-  return (TFtype) dh + (TFtype) dl;
> > +-}
> > +-
> > +-TFtype
> > +-__floatunditf (UDItype u)
> > +-{
> > +-  DFtype dh, dl;
> > +-
> > +-  dh =3D (USItype) (u >> (sizeof (SItype) * 8));
> > +-  dh *=3D 2.0 * (((UDItype) 1) << ((sizeof (SItype) * 8) - 1));
> > +-  dl =3D (USItype) (u & ((((UDItype) 1) << (sizeof (SItype) * 8)) - =
1));
> > +-
> > +-  return (TFtype) dh + (TFtype) dl;
> > +-}
> > +-
> > + DFtype
> > + __floatdidf (DItype u)
> > + {
> > +@@ -183,30 +146,6 @@
> > +   return (SFtype) f;
> > + }
> > +
> > +-DItype
> > +-__fixunstfdi (TFtype a)
> > +-{
> > +-  if (a < 0)
> > +-    return 0;
> > +-
> > +-  /* Compute high word of result, as a flonum.  */
> > +-  const TFtype b =3D (a / (((UDItype) 1) << (sizeof (SItype) * 8)));
> > +-  /* Convert that to fixed (but not to DItype!),
> > +-     and shift it into the high word.  */
> > +-  UDItype v =3D (USItype) b;
> > +-  v <<=3D (sizeof (SItype) * 8);
> > +-  /* Remove high part from the TFtype, leaving the low part as flonu=
m.  */
> > +-  a -=3D (TFtype) v;
> > +-  /* Convert that to fixed (but not to DItype!) and add it in.
> > +-     Sometimes A comes out negative.  This is significant, since
> > +-     A has more bits than a long int does.  */
> > +-  if (a < 0)
> > +-    v -=3D (USItype) (-a);
> > +-  else
> > +-    v +=3D (USItype) a;
> > +-  return v;
> > +-}
> > +-
> > + /* This version is needed to prevent recursion; fixunsdfdi in libgcc
> > +    calls fixdfdi, which in turn calls calls fixunsdfdi.  */
> > +
> > +diff --git a/libgcc/config/rs6000/quad-float128.h b/libgcc/config/rs6=
000/quad-float128.h
> > +--- a/libgcc/config/rs6000/quad-float128.h   2018-12-12 17:53:49.5400=
38500 -0500
> > ++++ b/libgcc/config/rs6000/quad-float128.h   2018-12-12 17:30:19.4234=
68244 -0500
> > +@@ -104,6 +104,11 @@
> > + extern UTItype_ppc __fixunskfti (TFtype);
> > + extern TFtype __floattikf (TItype_ppc);
> > + extern TFtype __floatuntikf (UTItype_ppc);
> > ++
> > ++extern DItype_ppc __fixtfdi (TFtype);
> > ++extern DItype_ppc __fixunstfdi (TFtype);
> > ++extern TFtype __floatditf (DItype_ppc);
> > ++extern TFtype __floatunditf (UDItype_ppc);
> > + #endif
> > +
> > + /* Functions using the ISA 3.0 hardware support.  If the code is com=
piled with
> > +diff --git a/libgcc/config/rs6000/t-float128 b/libgcc/config/rs6000/t=
-float128
> > +--- a/libgcc/config/rs6000/t-float128        2018-12-12 17:53:49.5400=
38500 -0500
> > ++++ b/libgcc/config/rs6000/t-float128        2018-12-12 17:45:12.2339=
37136 -0500
> > +@@ -24,6 +24,7 @@
> > +
> > + # New functions for software emulation
> > + fp128_ppc_funcs             =3D floattikf floatuntikf fixkfti fixuns=
kfti \
> > ++                      floatditf floatunditf fixtfdi fixunstfdi \
> > +                       extendkftf2-sw trunctfkf2-sw \
> > +                       sfp-exceptions _mulkc3 _divkc3 _powikf2
> > +
> > +
> > +diff --git a/libgcc/configure b/libgcc/configure
> > +old mode 100644
> > +new mode 100755
> > +index b2f3f870844..ed806587c17
> > +--- a/libgcc/configure
> > ++++ b/libgcc/configure
> > +@@ -619,6 +619,7 @@ build_vendor
> > + build_cpu
> > + build
> > + with_aix_soname
> > ++with_ldbl128
> > + enable_vtable_verify
> > + enable_shared
> > + libgcc_topdir
> > +@@ -668,6 +669,7 @@ with_cross_host
> > + with_ld
> > + enable_shared
> > + enable_vtable_verify
> > ++with_long_double_128
> > + with_aix_soname
> > + enable_version_specific_runtime_libs
> > + with_slibdir
> > +@@ -1329,6 +1331,7 @@ Optional Packages:
> > +   --with-target-subdir=3DSUBDIR      Configuring in a subdirectory f=
or target
> > +   --with-cross-host=3DHOST           Configuring with a cross compil=
er
> > +   --with-ld               arrange to use the specified ld (full path=
name)
> > ++  --with-long-double-128  use 128-bit long double by default
> > +   --with-aix-soname=3Daix|svr4|both
> > +                           shared library versioning (aka "SONAME") v=
ariant to
> > +                           provide on AIX
> > +@@ -2213,6 +2216,21 @@ fi
> > +
> > +
> > +
> > ++# Check whether --with-long-double-128 was given.
> > ++if test "${with_long_double_128+set}" =3D set; then :
> > ++  withval=3D$with_long_double_128; with_ldbl128=3D"$with_long_double=
_128"
> > ++else
> > ++  case "${host}" in
> > ++ power*-*-musl*)
> > ++   with_ldbl128=3D"no";;
> > ++ *) with_ldbl128=3D"yes";;
> > ++ esac
> > ++
> > ++fi
> > ++
> > ++
> > ++
> > ++
> > + # Check whether --with-aix-soname was given.
> > + if test "${with_aix_soname+set}" =3D set; then :
> > +   withval=3D$with_aix_soname; case "${host}:${enable_shared}" in
> > +diff --git a/libgcc/configure.ac b/libgcc/configure.ac
> > +index b59aa746afc..42220a263c5 100644
> > +--- a/libgcc/configure.ac
> > ++++ b/libgcc/configure.ac
> > +@@ -78,6 +78,18 @@ AC_ARG_ENABLE(vtable-verify,
> > + [enable_vtable_verify=3Dno])
> > + AC_SUBST(enable_vtable_verify)
> > +
> > ++AC_ARG_WITH(long-double-128,
> > ++[AS_HELP_STRING([--with-long-double-128],
> > ++    [use 128-bit long double by default])],
> > ++      with_ldbl128=3D"$with_long_double_128",
> > ++[case "${host}" in
> > ++ power*-*-musl*)
> > ++   with_ldbl128=3D"no";;
> > ++ *) with_ldbl128=3D"yes";;
> > ++ esac
> > ++])
> > ++AC_SUBST(with_ldbl128)
> > ++
> > + AC_ARG_WITH(aix-soname,
> > + [AS_HELP_STRING([--with-aix-soname=3Daix|svr4|both],
> > +     [shared library versioning (aka "SONAME") variant to provide on =
AIX])],
> > +--
> > +2.17.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0035-=
Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch b/meta-arm-toolchain=
/recipes-devtools/gcc/gcc-arm-8.2/0035-Link-libgcc-using-LDFLAGS-not-just-S=
HLIB_LDFLAGS.patch
> > new file mode 100644
> > index 0000000..5e416e0
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0035-Link-li=
bgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
> > @@ -0,0 +1,29 @@
> > +From 775c7fafcbfebed2d4bd8a6a011f18f70f3b59d3 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Wed, 4 May 2016 21:11:34 -0700
> > +Subject: [PATCH 35/39] Link libgcc using LDFLAGS, not just SHLIB_LDFL=
AGS
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + libgcc/config/t-slibgcc | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/libgcc/config/t-slibgcc b/libgcc/config/t-slibgcc
> > +index 7e60b621a2d..ea22ede3361 100644
> > +--- a/libgcc/config/t-slibgcc
> > ++++ b/libgcc/config/t-slibgcc
> > +@@ -32,7 +32,7 @@ SHLIB_INSTALL_SOLINK =3D $(LN_S) $(SHLIB_SONAME) \
> > +     $(DESTDIR)$(slibdir)$(SHLIB_SLIBDIR_QUAL)/$(SHLIB_SOLINK)
> > +
> > + SHLIB_LINK =3D $(CC) $(LIBGCC2_CFLAGS) -shared -nodefaultlibs \
> > +-    $(SHLIB_LDFLAGS) \
> > ++    $(LDFLAGS) $(SHLIB_LDFLAGS) \
> > +     -o $(SHLIB_DIR)/$(SHLIB_SONAME).tmp @multilib_flags@ \
> > +     $(SHLIB_OBJS) $(SHLIB_LC) && \
> > +     rm -f $(SHLIB_DIR)/$(SHLIB_SOLINK) && \
> > +--
> > +2.17.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0036-=
libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch b/meta-arm-toolc=
hain/recipes-devtools/gcc/gcc-arm-8.2/0036-libgcc_s-Use-alias-for-__cpu_ind=
icator_init-instead-.patch
> > new file mode 100644
> > index 0000000..8def33a
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0036-libgcc_=
s-Use-alias-for-__cpu_indicator_init-instead-.patch
> > @@ -0,0 +1,86 @@
> > +From b7faeed60261d7b75f2db3823926de1650ef64bc Mon Sep 17 00:00:00 200=
1
> > +From: Szabolcs Nagy <nsz@port70.net>
> > +Date: Sat, 24 Oct 2015 20:09:53 +0000
> > +Subject: [PATCH 36/39] libgcc_s: Use alias for __cpu_indicator_init i=
nstead of
> > + symver
> > +
> > +Adapter from
> > +
> > +https://gcc.gnu.org/ml/gcc-patches/2015-05/msg00899.html
> > +
> > +This fix was debated but hasnt been applied gcc upstream since
> > +they expect musl to support '@' in symbol versioning which is
> > +a sun/gnu versioning extention. This patch however avoids the
> > +need for the '@' symbols at all
> > +
> > +libgcc/Changelog:
> > +
> > +2015-05-11  Szabolcs Nagy  <szabolcs.nagy@arm.com>
> > +
> > +     * config/i386/cpuinfo.c (__cpu_indicator_init_local): Add.
> > +     (__cpu_indicator_init@GCC_4.8.0, __cpu_model@GCC_4.8.0): Remove.
> > +
> > +     * config/i386/t-linux (HOST_LIBGCC2_CFLAGS): Remove -DUSE_ELF_SY=
MVER.
> > +
> > +gcc/Changelog:
> > +
> > +2015-05-11  Szabolcs Nagy  <szabolcs.nagy@arm.com>
> > +
> > +     * config/i386/i386.c (ix86_expand_builtin): Make __builtin_cpu_i=
nit
> > +     call __cpu_indicator_init_local instead of __cpu_indicator_init.
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > +Upstream-Status: Pending
> > +
> > + gcc/config/i386/i386.c       | 4 ++--
> > + libgcc/config/i386/cpuinfo.c | 6 +++---
> > + libgcc/config/i386/t-linux   | 2 +-
> > + 3 files changed, 6 insertions(+), 6 deletions(-)
> > +
> > +diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c
> > +index 6a2141e48db..455fccbdd50 100644
> > +--- a/gcc/config/i386/i386.c
> > ++++ b/gcc/config/i386/i386.c
> > +@@ -36490,10 +36490,10 @@ ix86_expand_builtin (tree exp, rtx target, =
rtx subtarget,
> > +     {
> > +     case IX86_BUILTIN_CPU_INIT:
> > +       {
> > +-    /* Make it call __cpu_indicator_init in libgcc. */
> > ++    /* Make it call __cpu_indicator_init_local in libgcc.a. */
> > +     tree call_expr, fndecl, type;
> > +         type =3D build_function_type_list (integer_type_node, NULL_T=
REE);
> > +-    fndecl =3D build_fn_decl ("__cpu_indicator_init", type);
> > ++    fndecl =3D build_fn_decl ("__cpu_indicator_init_local", type);
> > +     call_expr =3D build_call_expr (fndecl, 0);
> > +     return expand_expr (call_expr, target, mode, EXPAND_NORMAL);
> > +       }
> > +diff --git a/libgcc/config/i386/cpuinfo.c b/libgcc/config/i386/cpuinf=
o.c
> > +index 86953db2743..e0476272810 100644
> > +--- a/libgcc/config/i386/cpuinfo.c
> > ++++ b/libgcc/config/i386/cpuinfo.c
> > +@@ -482,7 +482,7 @@ __cpu_indicator_init (void)
> > +   return 0;
> > + }
> > +
> > +-#if defined SHARED && defined USE_ELF_SYMVER
> > +-__asm__ (".symver __cpu_indicator_init, __cpu_indicator_init@GCC_4.8=
.0");
> > +-__asm__ (".symver __cpu_model, __cpu_model@GCC_4.8.0");
> > ++#ifndef SHARED
> > ++int __cpu_indicator_init_local (void)
> > ++  __attribute__ ((weak, alias ("__cpu_indicator_init")));
> > + #endif
> > +diff --git a/libgcc/config/i386/t-linux b/libgcc/config/i386/t-linux
> > +index 8506a635790..564296f788e 100644
> > +--- a/libgcc/config/i386/t-linux
> > ++++ b/libgcc/config/i386/t-linux
> > +@@ -3,5 +3,5 @@
> > + # t-slibgcc-elf-ver and t-linux
> > + SHLIB_MAPFILES =3D libgcc-std.ver $(srcdir)/config/i386/libgcc-glibc=
.ver
> > +
> > +-HOST_LIBGCC2_CFLAGS +=3D -mlong-double-80 -DUSE_ELF_SYMVER $(CET_FLA=
GS)
> > ++HOST_LIBGCC2_CFLAGS +=3D -mlong-double-80 $(CET_FLAGS)
> > + CRTSTUFF_T_CFLAGS +=3D $(CET_FLAGS)
> > +--
> > +2.17.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0037-=
sync-gcc-stddef.h-with-musl.patch b/meta-arm-toolchain/recipes-devtools/gcc=
/gcc-arm-8.2/0037-sync-gcc-stddef.h-with-musl.patch
> > new file mode 100644
> > index 0000000..f8a7f41
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0037-sync-gc=
c-stddef.h-with-musl.patch
> > @@ -0,0 +1,91 @@
> > +From 602abaab15ffb60bf1797187a71b485042c56360 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 3 Feb 2017 12:56:00 -0800
> > +Subject: [PATCH 37/39] sync gcc stddef.h with musl
> > +
> > +musl defines ptrdiff_t size_t and wchar_t
> > +so dont define them here if musl is definining them
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > +Upstream-Status: Pending
> > +
> > + gcc/ginclude/stddef.h | 9 +++++++++
> > + 1 file changed, 9 insertions(+)
> > +
> > +diff --git a/gcc/ginclude/stddef.h b/gcc/ginclude/stddef.h
> > +index 31b96a7e5e1..438a3ce7c56 100644
> > +--- a/gcc/ginclude/stddef.h
> > ++++ b/gcc/ginclude/stddef.h
> > +@@ -134,6 +134,7 @@ _TYPE_wchar_t;
> > + #ifndef ___int_ptrdiff_t_h
> > + #ifndef _GCC_PTRDIFF_T
> > + #ifndef _PTRDIFF_T_DECLARED /* DragonFly */
> > ++#ifndef __DEFINED_ptrdiff_t /* musl */
> > + #define _PTRDIFF_T
> > + #define _T_PTRDIFF_
> > + #define _T_PTRDIFF
> > +@@ -143,10 +144,12 @@ _TYPE_wchar_t;
> > + #define ___int_ptrdiff_t_h
> > + #define _GCC_PTRDIFF_T
> > + #define _PTRDIFF_T_DECLARED
> > ++#define __DEFINED_ptrdiff_t /* musl */
> > + #ifndef __PTRDIFF_TYPE__
> > + #define __PTRDIFF_TYPE__ long int
> > + #endif
> > + typedef __PTRDIFF_TYPE__ ptrdiff_t;
> > ++#endif /* __DEFINED_ptrdiff_t */
> > + #endif /* _PTRDIFF_T_DECLARED */
> > + #endif /* _GCC_PTRDIFF_T */
> > + #endif /* ___int_ptrdiff_t_h */
> > +@@ -184,6 +187,7 @@ typedef __PTRDIFF_TYPE__ ptrdiff_t;
> > + #ifndef _GCC_SIZE_T
> > + #ifndef _SIZET_
> > + #ifndef __size_t
> > ++#ifndef __DEFINED_size_t /* musl */
> > + #define __size_t__  /* BeOS */
> > + #define __SIZE_T__  /* Cray Unicos/Mk */
> > + #define _SIZE_T
> > +@@ -200,6 +204,7 @@ typedef __PTRDIFF_TYPE__ ptrdiff_t;
> > + #define ___int_size_t_h
> > + #define _GCC_SIZE_T
> > + #define _SIZET_
> > ++#define __DEFINED_size_t /* musl */
> > + #if (defined (__FreeBSD__) && (__FreeBSD__ >=3D 5)) \
> > +   || defined(__DragonFly__) \
> > +   || defined(__FreeBSD_kernel__)
> > +@@ -235,6 +240,7 @@ typedef long ssize_t;
> > + #endif /* _SIZE_T */
> > + #endif /* __SIZE_T__ */
> > + #endif /* __size_t__ */
> > ++#endif /* __DEFINED_size_t */
> > + #undef      __need_size_t
> > + #endif /* _STDDEF_H or __need_size_t.  */
> > +
> > +@@ -264,6 +270,7 @@ typedef long ssize_t;
> > + #ifndef ___int_wchar_t_h
> > + #ifndef __INT_WCHAR_T_H
> > + #ifndef _GCC_WCHAR_T
> > ++#ifndef __DEFINED_wchar_t /* musl */
> > + #define __wchar_t__ /* BeOS */
> > + #define __WCHAR_T__ /* Cray Unicos/Mk */
> > + #define _WCHAR_T
> > +@@ -279,6 +286,7 @@ typedef long ssize_t;
> > + #define __INT_WCHAR_T_H
> > + #define _GCC_WCHAR_T
> > + #define _WCHAR_T_DECLARED
> > ++#define __DEFINED_wchar_t /* musl */
> > +
> > + /* On BSD/386 1.1, at least, machine/ansi.h defines _BSD_WCHAR_T_
> > +    instead of _WCHAR_T_, and _BSD_RUNE_T_ (which, unlike the other
> > +@@ -344,6 +352,7 @@ typedef __WCHAR_TYPE__ wchar_t;
> > + #endif
> > + #endif /* __WCHAR_T__ */
> > + #endif /* __wchar_t__ */
> > ++#endif /* __DEFINED_wchar_t musl */
> > + #undef      __need_wchar_t
> > + #endif /* _STDDEF_H or __need_wchar_t.  */
> > +
> > +--
> > +2.17.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0038-=
fix-segmentation-fault-in-precompiled-header-generat.patch b/meta-arm-toolc=
hain/recipes-devtools/gcc/gcc-arm-8.2/0038-fix-segmentation-fault-in-precom=
piled-header-generat.patch
> > new file mode 100644
> > index 0000000..224d2ae
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0038-fix-seg=
mentation-fault-in-precompiled-header-generat.patch
> > @@ -0,0 +1,60 @@
> > +From 00694849632dee23741925c6104df134f6bff747 Mon Sep 17 00:00:00 200=
1
> > +From: Juro Bystricky <juro.bystricky@intel.com>
> > +Date: Mon, 19 Mar 2018 22:31:20 -0700
> > +Subject: [PATCH 38/39] fix segmentation fault in precompiled header g=
eneration
> > +
> > +Prevent a segmentation fault which occurs when using incorrect
> > +structure trying to access name of some named operators, such as
> > +CPP_NOT, CPP_AND etc. "token->val.node.spelling" cannot be used in
> > +those cases, as is may not be initialized at all.
> > +
> > +[YOCTO #11738]
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + libcpp/lex.c | 26 +++++++++++++++++++++-----
> > + 1 file changed, 21 insertions(+), 5 deletions(-)
> > +
> > +diff --git a/libcpp/lex.c b/libcpp/lex.c
> > +index 37c365a3560..63480048db6 100644
> > +--- a/libcpp/lex.c
> > ++++ b/libcpp/lex.c
> > +@@ -3279,11 +3279,27 @@ cpp_spell_token (cpp_reader *pfile, const cpp=
_token *token,
> > +     spell_ident:
> > +     case SPELL_IDENT:
> > +       if (forstring)
> > +-    {
> > +-      memcpy (buffer, NODE_NAME (token->val.node.spelling),
> > +-              NODE_LEN (token->val.node.spelling));
> > +-      buffer +=3D NODE_LEN (token->val.node.spelling);
> > +-    }
> > ++        {
> > ++          if (token->type =3D=3D CPP_NAME)
> > ++            {
> > ++              memcpy (buffer, NODE_NAME (token->val.node.spelling),
> > ++                    NODE_LEN (token->val.node.spelling));
> > ++              buffer +=3D NODE_LEN (token->val.node.spelling);
> > ++              break;
> > ++            }
> > ++          /* NAMED_OP, cannot use node.spelling */
> > ++          if (token->flags & NAMED_OP)
> > ++            {
> > ++              const char *str =3D cpp_named_operator2name (token->ty=
pe);
> > ++              if (str)
> > ++                {
> > ++                  size_t len =3D strlen(str);
> > ++                  memcpy(buffer, str, len);
> > ++                  buffer +=3D len;
> > ++                }
> > ++              break;
> > ++            }
> > ++        }
> > +       else
> > +     buffer =3D _cpp_spell_ident_ucns (buffer, token->val.node.node);
> > +       break;
> > +--
> > +2.17.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0039-=
Fix-for-testsuite-failure.patch b/meta-arm-toolchain/recipes-devtools/gcc/g=
cc-arm-8.2/0039-Fix-for-testsuite-failure.patch
> > new file mode 100644
> > index 0000000..f351630
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0039-Fix-for=
-testsuite-failure.patch
> > @@ -0,0 +1,258 @@
> > +From d151a62c252749643c850a08d1335321e5b75d42 Mon Sep 17 00:00:00 200=
1
> > +From: RAGHUNATH LOLUR <raghunath.lolur@kpit.com>
> > +Date: Wed, 6 Dec 2017 22:52:26 -0800
> > +Subject: [PATCH 39/39] Fix for testsuite failure
> > +
> > +2017-11-16  Raghunath Lolur  <raghunath.lolur@kpit.com>
> > +
> > +     * gcc.dg/pr56275.c: If SSE is disabled, ensure that
> > +     "-mfpmath" is not set to use SSE. Set "-mfpmath=3D387".
> > +     * gcc.dg/pr68306.c: Likewise
> > +     * gcc.dg/pr68306-2.c: Likewise
> > +     * gcc.dg/pr68306-3.c: Likewise
> > +     * gcc.dg/pr69634.c: Likewise
> > +     * gcc.target/i386/amd64-abi-1.c: Likewise
> > +     * gcc.target/i386/funcspec-6.c: Likewise
> > +     * gcc.target/i386/interrupt-387-err-1.c: Likewise
> > +     * gcc.target/i386/isa-14.c: Likewise
> > +     * gcc.target/i386/pr44948-2b.c: Likewise
> > +     * gcc.target/i386/pr53425-1.c: Likewise
> > +     * gcc.target/i386/pr53425-2.c: Likewise
> > +     * gcc.target/i386/pr55247.c: Likewise
> > +     * gcc.target/i386/pr59644.c: Likewise
> > +     * gcc.target/i386/pr62120.c: Likewise
> > +     * gcc.target/i386/pr70467-1.c: Likewise
> > +     * gcc.target/i386/warn-vect-op-1.c: Likewise
> > +
> > +If -Wall, -Werror are used during compilation various test cases fail
> > +to compile.
> > +
> > +If SSE is disabled, be sure to -mfpmath=3D387 to resolve this.
> > +
> > +This patch removes the changes to Changelog from the original patch.
> > +This will help us avoid conflicts.
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> > +---
> > + gcc/testsuite/gcc.dg/pr56275.c                      | 2 +-
> > + gcc/testsuite/gcc.dg/pr68306-2.c                    | 2 +-
> > + gcc/testsuite/gcc.dg/pr68306-3.c                    | 2 +-
> > + gcc/testsuite/gcc.dg/pr68306.c                      | 2 +-
> > + gcc/testsuite/gcc.dg/pr69634.c                      | 2 +-
> > + gcc/testsuite/gcc.target/i386/amd64-abi-1.c         | 2 +-
> > + gcc/testsuite/gcc.target/i386/funcspec-6.c          | 1 +
> > + gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c | 2 +-
> > + gcc/testsuite/gcc.target/i386/isa-14.c              | 2 +-
> > + gcc/testsuite/gcc.target/i386/pr44948-2b.c          | 2 +-
> > + gcc/testsuite/gcc.target/i386/pr53425-1.c           | 2 +-
> > + gcc/testsuite/gcc.target/i386/pr53425-2.c           | 2 +-
> > + gcc/testsuite/gcc.target/i386/pr55247.c             | 2 +-
> > + gcc/testsuite/gcc.target/i386/pr59644.c             | 2 +-
> > + gcc/testsuite/gcc.target/i386/pr62120.c             | 2 +-
> > + gcc/testsuite/gcc.target/i386/pr70467-1.c           | 2 +-
> > + gcc/testsuite/gcc.target/i386/warn-vect-op-1.c      | 2 +-
> > + 17 files changed, 17 insertions(+), 16 deletions(-)
> > +
> > +diff --git a/gcc/testsuite/gcc.dg/pr56275.c b/gcc/testsuite/gcc.dg/pr=
56275.c
> > +index b901bb2b199..a4f6c95e1a1 100644
> > +--- a/gcc/testsuite/gcc.dg/pr56275.c
> > ++++ b/gcc/testsuite/gcc.dg/pr56275.c
> > +@@ -1,6 +1,6 @@
> > + /* { dg-do compile } */
> > + /* { dg-options "-O2" } */
> > +-/* { dg-additional-options "-mno-sse" { target { i?86-*-* x86_64-*-*=
 } } } */
> > ++/* { dg-additional-options "-mno-sse -mfpmath=3D387" { target { i?86=
-*-* x86_64-*-* } } } */
> > +
> > + typedef long long v2tw __attribute__ ((vector_size (2 * sizeof (long=
 long))));
> > +
> > +diff --git a/gcc/testsuite/gcc.dg/pr68306-2.c b/gcc/testsuite/gcc.dg/=
pr68306-2.c
> > +index 4672ebe7987..2a368c484b6 100644
> > +--- a/gcc/testsuite/gcc.dg/pr68306-2.c
> > ++++ b/gcc/testsuite/gcc.dg/pr68306-2.c
> > +@@ -1,6 +1,6 @@
> > + /* { dg-do compile } */
> > + /* { dg-options "-O3" } */
> > +-/* { dg-additional-options "-mno-sse -mno-mmx" { target i?86-*-* x86=
_64-*-* } } */
> > ++/* { dg-additional-options "-mno-sse -mno-mmx -mfpmath=3D387" { targ=
et i?86-*-* x86_64-*-* } } */
> > +
> > + struct {
> > +     int tz_minuteswest;
> > +diff --git a/gcc/testsuite/gcc.dg/pr68306-3.c b/gcc/testsuite/gcc.dg/=
pr68306-3.c
> > +index f5a8c102cf8..df3390c64c2 100644
> > +--- a/gcc/testsuite/gcc.dg/pr68306-3.c
> > ++++ b/gcc/testsuite/gcc.dg/pr68306-3.c
> > +@@ -1,6 +1,6 @@
> > + /* { dg-do compile } */
> > + /* { dg-options "-O3" } */
> > +-/* { dg-additional-options "-mno-sse -mno-mmx" { target i?86-*-* x86=
_64-*-* } } */
> > ++/* { dg-additional-options "-mno-sse -mno-mmx -mfpmath=3D387" { targ=
et i?86-*-* x86_64-*-* } } */
> > + /* { dg-additional-options "-mno-altivec -mno-vsx" { target powerpc*=
-*-* } } */
> > +
> > + extern void fn2();
> > +diff --git a/gcc/testsuite/gcc.dg/pr68306.c b/gcc/testsuite/gcc.dg/pr=
68306.c
> > +index 54e5b40f221..0813389e2c1 100644
> > +--- a/gcc/testsuite/gcc.dg/pr68306.c
> > ++++ b/gcc/testsuite/gcc.dg/pr68306.c
> > +@@ -1,6 +1,6 @@
> > + /* { dg-do compile } */
> > + /* { dg-options "-O3" } */
> > +-/* { dg-additional-options "-mno-sse -mno-mmx" { target i?86-*-* x86=
_64-*-* } } */
> > ++/* { dg-additional-options "-mno-sse -mno-mmx -mfpmath=3D387" { targ=
et i?86-*-* x86_64-*-* } } */
> > +
> > + enum powerpc_pmc_type { PPC_PMC_IBM };
> > + struct {
> > +diff --git a/gcc/testsuite/gcc.dg/pr69634.c b/gcc/testsuite/gcc.dg/pr=
69634.c
> > +index 60a56149463..bcc23f9ccd6 100644
> > +--- a/gcc/testsuite/gcc.dg/pr69634.c
> > ++++ b/gcc/testsuite/gcc.dg/pr69634.c
> > +@@ -1,6 +1,6 @@
> > + /* { dg-do compile } */
> > + /* { dg-options "-O2 -fno-dce -fschedule-insns -fno-tree-vrp -fcompa=
re-debug -Wno-psabi" } */
> > +-/* { dg-additional-options "-mno-sse" { target i?86-*-* x86_64-*-* }=
 } */
> > ++/* { dg-additional-options "-mno-sse -mfpmath=3D387" { target i?86-*=
-* x86_64-*-* } } */
> > + /* { dg-require-effective-target scheduling } */
> > +
> > + typedef unsigned short u16;
> > +diff --git a/gcc/testsuite/gcc.target/i386/amd64-abi-1.c b/gcc/testsu=
ite/gcc.target/i386/amd64-abi-1.c
> > +index 69fde57bf06..7f1f1c03edf 100644
> > +--- a/gcc/testsuite/gcc.target/i386/amd64-abi-1.c
> > ++++ b/gcc/testsuite/gcc.target/i386/amd64-abi-1.c
> > +@@ -1,5 +1,5 @@
> > + /* { dg-do compile { target { ! ia32 } } } */
> > +-/* { dg-options "-mno-sse" } */
> > ++/* { dg-options "-mno-sse -mfpmath=3D387" } */
> > + /* { dg-additional-options "-mabi=3Dsysv" { target *-*-mingw* } } */
> > +
> > + double foo(void) { return 0; }      /* { dg-error "SSE disabled" } *=
/
> > +diff --git a/gcc/testsuite/gcc.target/i386/funcspec-6.c b/gcc/testsui=
te/gcc.target/i386/funcspec-6.c
> > +index ea896b7ebfd..bf15569b826 100644
> > +--- a/gcc/testsuite/gcc.target/i386/funcspec-6.c
> > ++++ b/gcc/testsuite/gcc.target/i386/funcspec-6.c
> > +@@ -1,6 +1,7 @@
> > + /* Test whether all of the 64-bit function specific options are acce=
pted
> > +    without error.  */
> > + /* { dg-do compile { target { ! ia32 } } } */
> > ++/* { dg-additional-options "-mfpmath=3D387" } */
> > +
> > + #include "funcspec-56.inc"
> > +
> > +diff --git a/gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c b/gc=
c/testsuite/gcc.target/i386/interrupt-387-err-1.c
> > +index 3fbdc881dda..6b4d9d1252a 100644
> > +--- a/gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c
> > ++++ b/gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c
> > +@@ -1,5 +1,5 @@
> > + /* { dg-do compile } */
> > +-/* { dg-options "-O2 -mgeneral-regs-only -mno-cld -mno-iamcu -m80387=
" } */
> > ++/* { dg-options "-O2 -mgeneral-regs-only -mno-cld -mno-iamcu -m80387=
 -mfpmath=3D387" } */
> > +
> > + typedef unsigned int uword_t __attribute__ ((mode (__word__)));
> > +
> > +diff --git a/gcc/testsuite/gcc.target/i386/isa-14.c b/gcc/testsuite/g=
cc.target/i386/isa-14.c
> > +index 5d49e6e77fe..1de2db92bdd 100644
> > +--- a/gcc/testsuite/gcc.target/i386/isa-14.c
> > ++++ b/gcc/testsuite/gcc.target/i386/isa-14.c
> > +@@ -1,5 +1,5 @@
> > + /* { dg-do run } */
> > +-/* { dg-options "-march=3Dx86-64 -msse4a -mfma4 -mno-sse" } */
> > ++/* { dg-options "-march=3Dx86-64 -msse4a -mfma4 -mno-sse -mfpmath=3D=
387" } */
> > +
> > + extern void abort (void);
> > +
> > +diff --git a/gcc/testsuite/gcc.target/i386/pr44948-2b.c b/gcc/testsui=
te/gcc.target/i386/pr44948-2b.c
> > +index fa1769b62fb..f79fb12726f 100644
> > +--- a/gcc/testsuite/gcc.target/i386/pr44948-2b.c
> > ++++ b/gcc/testsuite/gcc.target/i386/pr44948-2b.c
> > +@@ -1,5 +1,5 @@
> > + /* { dg-do compile } */
> > +-/* { dg-options "-O -mno-sse -Wno-psabi -mtune=3Dgeneric" } */
> > ++/* { dg-options "-O -mno-sse -Wno-psabi -mtune=3Dgeneric -mfpmath=3D=
387" } */
> > +
> > + struct A
> > + {
> > +diff --git a/gcc/testsuite/gcc.target/i386/pr53425-1.c b/gcc/testsuit=
e/gcc.target/i386/pr53425-1.c
> > +index 2e89ff7d81d..6339bf6b736 100644
> > +--- a/gcc/testsuite/gcc.target/i386/pr53425-1.c
> > ++++ b/gcc/testsuite/gcc.target/i386/pr53425-1.c
> > +@@ -1,6 +1,6 @@
> > + /* PR target/53425 */
> > + /* { dg-do compile { target { ! ia32 } } } */
> > +-/* { dg-options "-O2 -mno-sse" } */
> > ++/* { dg-options "-O2 -mno-sse -mfpmath=3D387" } */
> > + /* { dg-skip-if "no SSE vector" { x86_64-*-mingw* } } */
> > +
> > + typedef double __v2df __attribute__ ((__vector_size__ (16)));
> > +diff --git a/gcc/testsuite/gcc.target/i386/pr53425-2.c b/gcc/testsuit=
e/gcc.target/i386/pr53425-2.c
> > +index 61f6283dbe9..2c5a55f0ac3 100644
> > +--- a/gcc/testsuite/gcc.target/i386/pr53425-2.c
> > ++++ b/gcc/testsuite/gcc.target/i386/pr53425-2.c
> > +@@ -1,6 +1,6 @@
> > + /* PR target/53425 */
> > + /* { dg-do compile { target { ! ia32 } } } */
> > +-/* { dg-options "-O2 -mno-sse" } */
> > ++/* { dg-options "-O2 -mno-sse -mfpmath=3D387" } */
> > + /* { dg-skip-if "no SSE vector" { x86_64-*-mingw* } } */
> > +
> > + typedef float __v2sf __attribute__ ((__vector_size__ (8)));
> > +diff --git a/gcc/testsuite/gcc.target/i386/pr55247.c b/gcc/testsuite/=
gcc.target/i386/pr55247.c
> > +index 23366d0909d..9810e3abb76 100644
> > +--- a/gcc/testsuite/gcc.target/i386/pr55247.c
> > ++++ b/gcc/testsuite/gcc.target/i386/pr55247.c
> > +@@ -1,6 +1,6 @@
> > + /* { dg-do compile { target { ! ia32 } } } */
> > + /* { dg-require-effective-target maybe_x32 } */
> > +-/* { dg-options "-O2 -mno-sse -mno-mmx -mx32 -maddress-mode=3Dlong" =
} */
> > ++/* { dg-options "-O2 -mno-sse -mno-mmx -mx32 -maddress-mode=3Dlong -=
mfpmath=3D387" } */
> > +
> > + typedef unsigned int uint32_t;
> > + typedef uint32_t Elf32_Word;
> > +diff --git a/gcc/testsuite/gcc.target/i386/pr59644.c b/gcc/testsuite/=
gcc.target/i386/pr59644.c
> > +index 96006b3e338..4287e4538bf 100644
> > +--- a/gcc/testsuite/gcc.target/i386/pr59644.c
> > ++++ b/gcc/testsuite/gcc.target/i386/pr59644.c
> > +@@ -1,6 +1,6 @@
> > + /* PR target/59644 */
> > + /* { dg-do run { target lp64 } } */
> > +-/* { dg-options "-O2 -ffreestanding -mno-sse -mpreferred-stack-bound=
ary=3D3 -maccumulate-outgoing-args -mno-red-zone" } */
> > ++/* { dg-options "-O2 -ffreestanding -mno-sse -mpreferred-stack-bound=
ary=3D3 -maccumulate-outgoing-args -mno-red-zone -mfpmath=3D387" } */
> > +
> > + /* This test uses __builtin_trap () instead of e.g. abort,
> > +    because due to -mpreferred-stack-boundary=3D3 it should not call
> > +diff --git a/gcc/testsuite/gcc.target/i386/pr62120.c b/gcc/testsuite/=
gcc.target/i386/pr62120.c
> > +index bfb8c4703eb..ed04cf181f3 100644
> > +--- a/gcc/testsuite/gcc.target/i386/pr62120.c
> > ++++ b/gcc/testsuite/gcc.target/i386/pr62120.c
> > +@@ -1,5 +1,5 @@
> > + /* { dg-do compile } */
> > +-/* { dg-options "-mno-sse" } */
> > ++/* { dg-options "-mno-sse -mfpmath=3D387" } */
> > +
> > + void foo ()
> > + {
> > +diff --git a/gcc/testsuite/gcc.target/i386/pr70467-1.c b/gcc/testsuit=
e/gcc.target/i386/pr70467-1.c
> > +index 4e112c88d07..bcfb396a68d 100644
> > +--- a/gcc/testsuite/gcc.target/i386/pr70467-1.c
> > ++++ b/gcc/testsuite/gcc.target/i386/pr70467-1.c
> > +@@ -1,6 +1,6 @@
> > + /* PR rtl-optimization/70467 */
> > + /* { dg-do compile } */
> > +-/* { dg-options "-O2 -mno-sse" } */
> > ++/* { dg-options "-O2 -mno-sse -mfpmath=3D387" } */
> > +
> > + void foo (unsigned long long *);
> > +
> > +diff --git a/gcc/testsuite/gcc.target/i386/warn-vect-op-1.c b/gcc/tes=
tsuite/gcc.target/i386/warn-vect-op-1.c
> > +index 6cda1534311..26e37f5b8ba 100644
> > +--- a/gcc/testsuite/gcc.target/i386/warn-vect-op-1.c
> > ++++ b/gcc/testsuite/gcc.target/i386/warn-vect-op-1.c
> > +@@ -1,5 +1,5 @@
> > + /* { dg-do compile { target { ! ia32 } } }  */
> > +-/* { dg-options "-mno-sse -Wvector-operation-performance" }  */
> > ++/* { dg-options "-mno-sse -Wvector-operation-performance -mfpmath=3D=
387" }  */
> > + #define vector(elcount, type)  \
> > + __attribute__((vector_size((elcount)*sizeof(type)))) type
> > +
> > +--
> > +2.17.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0040-=
Re-introduce-spe-commandline-options.patch b/meta-arm-toolchain/recipes-dev=
tools/gcc/gcc-arm-8.2/0040-Re-introduce-spe-commandline-options.patch
> > new file mode 100644
> > index 0000000..8afa010
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0040-Re-intr=
oduce-spe-commandline-options.patch
> > @@ -0,0 +1,41 @@
> > +From 8fb8f773e117ee70be00bb0da5f343fe110da5c4 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Wed, 6 Jun 2018 12:10:22 -0700
> > +Subject: [PATCH 40/40] Re-introduce spe commandline options
> > +
> > +This should ensure that we keep accepting
> > +spe options
> > +
> > +Upstream-Status: Inappropriate [SPE port is removed from rs600 port]
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + gcc/config/rs6000/rs6000.opt | 12 ++++++++++++
> > + 1 file changed, 12 insertions(+)
> > +
> > +diff --git a/gcc/config/rs6000/rs6000.opt b/gcc/config/rs6000/rs6000.=
opt
> > +index ace8a477550..d6a8f825d88 100644
> > +--- a/gcc/config/rs6000/rs6000.opt
> > ++++ b/gcc/config/rs6000/rs6000.opt
> > +@@ -365,6 +365,18 @@ mdebug=3D
> > + Target RejectNegative Joined
> > + -mdebug=3D    Enable debug output.
> > +
> > ++mspe
> > ++Target Var(rs6000_spe) Save
> > ++Generate SPE SIMD instructions on E500.
> > ++
> > ++mabi=3Dspe
> > ++Target RejectNegative Var(rs6000_spe_abi) Save
> > ++Use the SPE ABI extensions.
> > ++
> > ++mabi=3Dno-spe
> > ++Target RejectNegative Var(rs6000_spe_abi, 0)
> > ++Do not use the SPE ABI extensions.
> > ++
> > + mabi=3Daltivec
> > + Target RejectNegative Var(rs6000_altivec_abi) Save
> > + Use the AltiVec ABI extensions.
> > +--
> > +2.17.1
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0041-=
ARC-fix-spec-gen.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
2/0041-ARC-fix-spec-gen.patch
> > new file mode 100644
> > index 0000000..cbd5e41
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0041-ARC-fix=
-spec-gen.patch
> > @@ -0,0 +1,44 @@
> > +From 892142379c6b99fe8c3ebdfe0b79e2a435228c1d Mon Sep 17 00:00:00 200=
1
> > +From: claziss <claziss@138bc75d-0d04-0410-961f-82ee72b054a4>
> > +Date: Mon, 17 Sep 2018 08:52:10 +0000
> > +Subject: [PATCH] [ARC] Update LINK_EH_SPEC linker spec.
> > +
> > +With no trailing space in LINK_EH_SPEC linker spec gets generated as:
> > +------------------------>8---------------------
> > +%{!r:--build-id} --eh-frame-hdr%{h*} ...
> > +------------------------>8---------------------
> > +
> > +or even worse if hash style is added:
> > +------------------------>8---------------------
> > +%{!r:--build-id} --eh-frame-hdr--hash-style=3Dsysv %{h*} ...
> > +------------------------>8---------------------
> > +
> > +Now if that spec is really used by LD then it fails inevitably
> > +saying that it doesn't know option "--eh-frame-hdr--hash-style=3Dsysv=
".
> > +
> > +2018-09-17  Alexey Brodkin  <abrodkin@synopsys.com>
> > +
> > +     * config/arc/linux.h (LINK_EH_SPEC): Add missing space.
> > +
> > +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@264361 138bc75d-0d04-=
0410-961f-82ee72b054a4
> > +
> > +Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> > +
> > +Upstream-Status: Backport[https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dco=
mmit;h=3D892142379c6b]
> > +---
> > + gcc/config/arc/linux.h | 2 +-
> > + 1 files changed, 1 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/gcc/config/arc/linux.h b/gcc/config/arc/linux.h
> > +index 96d548eae341..62ebe4de0fc7 100644
> > +--- a/gcc/config/arc/linux.h
> > ++++ b/gcc/config/arc/linux.h
> > +@@ -98,7 +98,7 @@ along with GCC; see the file COPYING3.  If not see
> > +    Signalize that because we have fde-glibc, we don't need all C sha=
red libs
> > +    linked against -lgcc_s.  */
> > + #undef LINK_EH_SPEC
> > +-#define LINK_EH_SPEC "--eh-frame-hdr"
> > ++#define LINK_EH_SPEC "--eh-frame-hdr "
> > + #endif
> > +
> > + #undef SUBTARGET_CPP_SPEC
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0042-=
powerpc-powerpc64-Add-support-for-musl-ldso.patch b/meta-arm-toolchain/reci=
pes-devtools/gcc/gcc-arm-8.2/0042-powerpc-powerpc64-Add-support-for-musl-ld=
so.patch
> > new file mode 100644
> > index 0000000..b0c735b
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0042-powerpc=
-powerpc64-Add-support-for-musl-ldso.patch
> > @@ -0,0 +1,31 @@
> > +From 3f5f5da776be86b408a15f38c9782f2185f97073 Mon Sep 17 00:00:00 200=
1
> > +From: Serhey Popovych <serhe.popovych@gmail.com>
> > +Date: Tue, 11 Dec 2018 02:30:50 -0500
> > +Subject: [PATCH] powerpc/powerpc64: Add support for musl ldso
> > +
> > +Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
> > +---
> > +Upstream-Status: Inappropriate [OE-Specific]
> > +
> > + gcc/config/rs6000/linux64.h | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.=
h
> > +index 619e113..ee8b44f 100644
> > +--- a/gcc/config/rs6000/linux64.h
> > ++++ b/gcc/config/rs6000/linux64.h
> > +@@ -421,9 +421,9 @@ extern int dot_symbols;
> > + #endif
> > +
> > + #define MUSL_DYNAMIC_LINKER32 \
> > +-  "/lib/ld-musl-powerpc" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}.s=
o.1"
> > ++  SYSTEMLIBS_DIR "ld-musl-powerpc" MUSL_DYNAMIC_LINKER_E "%{msoft-fl=
oat:-sf}.so.1"
> > + #define MUSL_DYNAMIC_LINKER64 \
> > +-  "/lib/ld-musl-powerpc64" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}=
.so.1"
> > ++  SYSTEMLIBS_DIR "ld-musl-powerpc64" MUSL_DYNAMIC_LINKER_E "%{msoft-=
float:-sf}.so.1"
> > +
> > + #define UCLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-uClibc.so.0"
> > + #define UCLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld64-uClibc.so.0"
> > +--
> > +2.7.4
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0043-=
riscv-Disable-multilib-for-OE.patch b/meta-arm-toolchain/recipes-devtools/g=
cc/gcc-arm-8.2/0043-riscv-Disable-multilib-for-OE.patch
> > new file mode 100644
> > index 0000000..dc28d1b
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2/0043-riscv-D=
isable-multilib-for-OE.patch
> > @@ -0,0 +1,27 @@
> > +From ca0a6e035eef0cdbd0ef3a222c75d4b9f873c512 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 28 Dec 2018 09:59:53 -0800
> > +Subject: [PATCH 39/39] riscv: Disable multilib for OE
> > +
> > +Upstream-Status: Inappropriate [OE-Specific]
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + gcc/config/riscv/t-linux | 6 ++++--
> > + 1 file changed, 4 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/gcc/config/riscv/t-linux b/gcc/config/riscv/t-linux
> > +index 216d2776a18..e4d817621fc 100644
> > +--- a/gcc/config/riscv/t-linux
> > ++++ b/gcc/config/riscv/t-linux
> > +@@ -1,3 +1,5 @@
> > + # Only XLEN and ABI affect Linux multilib dir names, e.g. /lib32/ilp=
32d/
> > +-MULTILIB_DIRNAMES :=3D $(patsubst rv32%,lib32,$(patsubst rv64%,lib64=
,$(MULTILIB_DIRNAMES)))
> > +-MULTILIB_OSDIRNAMES :=3D $(patsubst lib%,../lib%,$(MULTILIB_DIRNAMES=
))
> > ++#MULTILIB_DIRNAMES :=3D $(patsubst rv32%,lib32,$(patsubst rv64%,lib6=
4,$(MULTILIB_DIRNAMES)))
> > ++MULTILIB_DIRNAMES :=3D . .
> > ++#MULTILIB_OSDIRNAMES :=3D $(patsubst lib%,../lib%,$(MULTILIB_DIRNAME=
S))
> > ++MULTILIB_OSDIRNAMES :=3D ../$(shell basename $(base_libdir)) ../$(sh=
ell basename $(base_libdir))
> > +--
> > +2.20.1
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3.inc b=
/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3.inc
> > new file mode 100644
> > index 0000000..65eb0df
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3.inc
> > @@ -0,0 +1,113 @@
> > +require recipes-devtools/gcc/gcc-common.inc
> > +
> > +BASEPV =3D "8.3"
> > +PV =3D "arm-${BASEPV}"
> > +
> > +MMYY =3D "19.03"
> > +RELEASE =3D "20${MMYY}"
> > +PR =3D "r${RELEASE}"
> > +BINV =3D "${BASEPV}.0"
> > +
> > +FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/gcc-${BASEPV}:${FILE_DIRNAME}/g=
cc-${BASEPV}/backport:"
> > +
> > +DEPENDS =3D+ "mpfr gmp libmpc zlib flex-native"
> > +NATIVEDEPS =3D "mpfr-native gmp-native libmpc-native zlib-native flex=
-native"
> > +
> > +LICENSE =3D "GPL-3.0-with-GCC-exception & GPLv3"
> > +
> > +LIC_FILES_CHKSUM =3D "\
> > +    file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552 \
> > +    file://COPYING3;md5=3Dd32239bcb673463ab874e80d47fae504 \
> > +    file://COPYING3.LIB;md5=3D6a6a8e020838b23406c81b19c1d46df6 \
> > +    file://COPYING.LIB;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
> > +    file://COPYING.RUNTIME;md5=3Dfe60d87048567d4fe8c8a0ed2448bcc8 \
> > +"
> > +
> > +#BASEURI ?=3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2"
> > +SRCREV =3D "47335befa47297ab810945cece69c466417a95c1"
> > +BASEURI ?=3D "git://git.linaro.org/toolchain/gcc.git;protocol=3Dhttps=
;branch=3Dlinaro-local/ARM/arm-8-branch"
> > +
> > +SRC_URI =3D "\
> > +           ${BASEURI} \
> > +           file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
> > +           file://0002-gcc-poison-system-directories.patch \
> > +           file://0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch \
> > +           file://0004-64-bit-multilib-hack.patch \
> > +           file://0005-optional-libstdc.patch \
> > +           file://0006-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch \
> > +           file://0007-COLLECT_GCC_OPTIONS.patch \
> > +           file://0008-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-=
in-B.patch \
> > +           file://0009-fortran-cross-compile-hack.patch \
> > +           file://0010-cpp-honor-sysroot.patch \
> > +           file://0011-MIPS64-Default-to-N64-ABI.patch \
> > +           file://0012-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC=
_LINKE.patch \
> > +           file://0013-gcc-Fix-argument-list-too-long-error.patch \
> > +           file://0014-Disable-sdt.patch \
> > +           file://0015-libtool.patch \
> > +           file://0016-gcc-armv4-pass-fix-v4bx-to-linker-to-support-E=
ABI.patch \
> > +           file://0017-Use-the-multilib-config-files-from-B-instead-o=
f-usin.patch \
> > +           file://0018-Avoid-using-libdir-from-.la-which-usually-poin=
ts-to-.patch \
> > +           file://0019-export-CPP.patch \
> > +           file://0020-Disable-the-MULTILIB_OSDIRNAMES-and-other-mult=
ilib-o.patch \
> > +           file://0021-Ensure-target-gcc-headers-can-be-included.patc=
h \
> > +           file://0022-gcc-4.8-won-t-build-with-disable-dependency-tr=
acking.patch \
> > +           file://0023-Don-t-search-host-directory-during-relink-if-i=
nst_pr.patch \
> > +           file://0024-Use-SYSTEMLIBS_DIR-replacement-instead-of-hard=
coding.patch \
> > +           file://0025-aarch64-Add-support-for-musl-ldso.patch \
> > +           file://0026-libcc1-fix-libcc1-s-install-path-and-rpath.pat=
ch \
> > +           file://0027-handle-sysroot-support-for-nativesdk-gcc.patch=
 \
> > +           file://0028-Search-target-sysroot-gcc-version-specific-dir=
s-with.patch \
> > +           file://0029-Fix-various-_FOR_BUILD-and-related-variables.p=
atch \
> > +           file://0030-nios2-Define-MUSL_DYNAMIC_LINKER.patch \
> > +           file://0031-Add-ssp_nonshared-to-link-commandline-for-musl=
-targe.patch \
> > +           file://0032-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch \
> > +           file://0033-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLA=
GS.patch \
> > +           file://0034-libgcc_s-Use-alias-for-__cpu_indicator_init-in=
stead-.patch \
> > +           file://0035-sync-gcc-stddef.h-with-musl.patch \
> > +           file://0036-fix-segmentation-fault-in-precompiled-header-g=
enerat.patch \
> > +           file://0037-Fix-for-testsuite-failure.patch \
> > +           file://0038-Re-introduce-spe-commandline-options.patch \
> > +           file://0039-riscv-Disable-multilib-for-OE.patch \
> > +           file://0040-powerpc-powerpc64-Add-support-for-musl-ldso.pa=
tch \
> > +           ${BACKPORTS} \
> > +"
> > +BACKPORTS =3D "\
> > +"
> > +
> > +S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/git"
> > +#S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
> > +#S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/git"
> > +#S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${RELEASE}"
> > +B =3D "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
> > +
> > +# Language Overrides
> > +FORTRAN =3D ""
> > +JAVA =3D ""
> > +
> > +LTO =3D "--enable-lto"
> > +SSP ?=3D "--disable-libssp"
> > +SSP_mingw32 =3D "--enable-libssp"
> > +
> > +EXTRA_OECONF_BASE =3D "\
> > +    ${LTO} \
> > +    ${SSP} \
> > +    --enable-libitm \
> > +    --disable-bootstrap \
> > +    --disable-libmudflap \
> > +    --with-system-zlib \
> > +    ${@'--with-linker-hash-style=3D${LINKER_HASH_STYLE}' if '${LINKER=
_HASH_STYLE}' else ''} \
> > +    --enable-linker-build-id \
> > +    --with-ppl=3Dno \
> > +    --with-cloog=3Dno \
> > +    --enable-checking=3Drelease \
> > +    --enable-cheaders=3Dc_global \
> > +    --without-isl \
> > +"
> > +
> > +EXTRA_OECONF_append_aarchilp32 =3D " --with-abi=3Dilp32"
> > +
> > +EXTRA_OECONF_PATHS =3D "\
> > +    --with-gxx-include-dir=3D/not/exist{target_includedir}/c++/${BINV=
} \
> > +    --with-sysroot=3D/not/exist \
> > +    --with-build-sysroot=3D${STAGING_DIR_TARGET} \
> > +"
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0001-=
gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch b/meta-arm-toolchain/recipes-devtools=
/gcc/gcc-arm-8.3/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
> > new file mode 100644
> > index 0000000..4ad79e4
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0001-gcc-4.3=
.1-ARCH_FLAGS_FOR_TARGET.patch
> > @@ -0,0 +1,42 @@
> > +From d7b284a9bede9d5059ad7e95a867254bf913c638 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 08:37:11 +0400
> > +Subject: [PATCH 01/40] gcc-4.3.1: ARCH_FLAGS_FOR_TARGET
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Inappropriate [embedded specific]
> > +---
> > + configure    | 2 +-
> > + configure.ac | 2 +-
> > + 2 files changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/configure b/configure
> > +index 0601395512f..8c5b1e9d561 100755
> > +--- a/configure
> > ++++ b/configure
> > +@@ -7507,7 +7507,7 @@ fi
> > + # for target_alias and gcc doesn't manage it consistently.
> > + target_configargs=3D"--cache-file=3D./config.cache ${target_configar=
gs}"
> > +
> > +-FLAGS_FOR_TARGET=3D
> > ++FLAGS_FOR_TARGET=3D"$ARCH_FLAGS_FOR_TARGET"
> > + case " $target_configdirs " in
> > +  *" newlib "*)
> > +   case " $target_configargs " in
> > +diff --git a/configure.ac b/configure.ac
> > +index c3433336523..69c31c65ad7 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -3096,7 +3096,7 @@ fi
> > + # for target_alias and gcc doesn't manage it consistently.
> > + target_configargs=3D"--cache-file=3D./config.cache ${target_configar=
gs}"
> > +
> > +-FLAGS_FOR_TARGET=3D
> > ++FLAGS_FOR_TARGET=3D"$ARCH_FLAGS_FOR_TARGET"
> > + case " $target_configdirs " in
> > +  *" newlib "*)
> > +   case " $target_configargs " in
> > +--
> > +2.21.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0002-=
gcc-poison-system-directories.patch b/meta-arm-toolchain/recipes-devtools/g=
cc/gcc-arm-8.3/0002-gcc-poison-system-directories.patch
> > new file mode 100644
> > index 0000000..e7ff124
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0002-gcc-poi=
son-system-directories.patch
> > @@ -0,0 +1,203 @@
> > +From 95ec476dd7726cc9c1bfd6fb23ba3aea8bbf61a4 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 08:59:00 +0400
> > +Subject: [PATCH 02/40] gcc: poison-system-directories
> > +
> > +Add /sw/include and /opt/include based on the original
> > +zecke-no-host-includes.patch patch.  The original patch checked for
> > +/usr/include, /sw/include and /opt/include and then triggered a failu=
re and
> > +aborted.
> > +
> > +Instead, we add the two missing items to the current scan.  If the us=
er
> > +wants this to be a failure, they can add "-Werror=3Dpoison-system-dir=
ectories".
> > +
> > +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Pending
> > +---
> > + gcc/common.opt      |  4 ++++
> > + gcc/config.in       |  6 ++++++
> > + gcc/configure       | 16 ++++++++++++++++
> > + gcc/configure.ac    | 10 ++++++++++
> > + gcc/doc/invoke.texi |  9 +++++++++
> > + gcc/gcc.c           |  2 ++
> > + gcc/incpath.c       | 21 +++++++++++++++++++++
> > + 7 files changed, 68 insertions(+)
> > +
> > +diff --git a/gcc/common.opt b/gcc/common.opt
> > +index b52ef0b38c8..0de3f0924cd 100644
> > +--- a/gcc/common.opt
> > ++++ b/gcc/common.opt
> > +@@ -679,6 +679,10 @@ Wreturn-local-addr
> > + Common Var(warn_return_local_addr) Init(1) Warning
> > + Warn about returning a pointer/reference to a local or temporary var=
iable.
> > +
> > ++Wpoison-system-directories
> > ++Common Var(flag_poison_system_directories) Init(1) Warning
> > ++Warn for -I and -L options using system directories if cross compili=
ng
> > ++
> > + Wshadow
> > + Common Var(warn_shadow) Warning
> > + Warn when one variable shadows another.  Same as -Wshadow=3Dglobal.
> > +diff --git a/gcc/config.in b/gcc/config.in
> > +index 5bccb408016..1c784a8276b 100644
> > +--- a/gcc/config.in
> > ++++ b/gcc/config.in
> > +@@ -194,6 +194,12 @@
> > + #endif
> > +
> > +
> > ++/* Define to warn for use of native system header directories */
> > ++#ifndef USED_FOR_TARGET
> > ++#undef ENABLE_POISON_SYSTEM_DIRECTORIES
> > ++#endif
> > ++
> > ++
> > + /* Define if you want all operations on RTL (the basic data structur=
e of the
> > +    optimizer and back end) to be checked for dynamic type safety at =
runtime.
> > +    This is quite expensive. */
> > +diff --git a/gcc/configure b/gcc/configure
> > +index 6121e163259..3901722400c 100755
> > +--- a/gcc/configure
> > ++++ b/gcc/configure
> > +@@ -953,6 +953,7 @@ with_system_zlib
> > + enable_maintainer_mode
> > + enable_link_mutex
> > + enable_version_specific_runtime_libs
> > ++enable_poison_system_directories
> > + enable_plugin
> > + enable_host_shared
> > + enable_libquadmath_support
> > +@@ -1696,6 +1697,8 @@ Optional Features:
> > +   --enable-version-specific-runtime-libs
> > +                           specify that runtime libraries should be i=
nstalled
> > +                           in a compiler-specific directory
> > ++  --enable-poison-system-directories
> > ++                          warn for use of native system header direc=
tories
> > +   --enable-plugin         enable plugin support
> > +   --enable-host-shared    build host code as shared libraries
> > +   --disable-libquadmath-support
> > +@@ -29701,6 +29704,19 @@ if test "${enable_version_specific_runtime_l=
ibs+set}" =3D set; then :
> > + fi
> > +
> > +
> > ++# Check whether --enable-poison-system-directories was given.
> > ++if test "${enable_poison_system_directories+set}" =3D set; then :
> > ++  enableval=3D$enable_poison_system_directories;
> > ++else
> > ++  enable_poison_system_directories=3Dno
> > ++fi
> > ++
> > ++if test "x${enable_poison_system_directories}" =3D "xyes"; then
> > ++
> > ++$as_echo "#define ENABLE_POISON_SYSTEM_DIRECTORIES 1" >>confdefs.h
> > ++
> > ++fi
> > ++
> > + # Substitute configuration variables
> > +
> > +
> > +diff --git a/gcc/configure.ac b/gcc/configure.ac
> > +index b066cc609e1..1b1362f70fe 100644
> > +--- a/gcc/configure.ac
> > ++++ b/gcc/configure.ac
> > +@@ -6327,6 +6327,16 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
> > +                 [specify that runtime libraries should be
> > +                  installed in a compiler-specific directory])])
> > +
> > ++AC_ARG_ENABLE([poison-system-directories],
> > ++             AS_HELP_STRING([--enable-poison-system-directories],
> > ++                            [warn for use of native system header di=
rectories]),,
> > ++             [enable_poison_system_directories=3Dno])
> > ++if test "x${enable_poison_system_directories}" =3D "xyes"; then
> > ++  AC_DEFINE([ENABLE_POISON_SYSTEM_DIRECTORIES],
> > ++           [1],
> > ++           [Define to warn for use of native system header directori=
es])
> > ++fi
> > ++
> > + # Substitute configuration variables
> > + AC_SUBST(subdirs)
> > + AC_SUBST(srcdir)
> > +diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
> > +index e5c4e8125aa..fb228631a42 100644
> > +--- a/gcc/doc/invoke.texi
> > ++++ b/gcc/doc/invoke.texi
> > +@@ -304,6 +304,7 @@ Objective-C and Objective-C++ Dialects}.
> > + -Wpacked  -Wpacked-bitfield-compat -Wpacked-not-aligned -Wpadded @go=
l
> > + -Wparentheses  -Wno-pedantic-ms-format @gol
> > + -Wplacement-new  -Wplacement-new=3D@var{n} @gol
> > ++-Wno-poison-system-directories @gol
> > + -Wpointer-arith  -Wpointer-compare  -Wno-pointer-to-int-cast @gol
> > + -Wno-pragmas  -Wredundant-decls  -Wrestrict  -Wno-return-local-addr =
@gol
> > + -Wreturn-type  -Wsequence-point  -Wshadow  -Wno-shadow-ivar @gol
> > +@@ -5743,6 +5744,14 @@ made up of data only and thus requires no spec=
ial treatment.  But, for
> > + most targets, it is made up of code and thus requires the stack to b=
e
> > + made executable in order for the program to work properly.
> > +
> > ++@item -Wno-poison-system-directories
> > ++@opindex Wno-poison-system-directories
> > ++Do not warn for @option{-I} or @option{-L} options using system
> > ++directories such as @file{/usr/include} when cross compiling.  This
> > ++option is intended for use in chroot environments when such
> > ++directories contain the correct headers and libraries for the target
> > ++system rather than the host.
> > ++
> > + @item -Wfloat-equal
> > + @opindex Wfloat-equal
> > + @opindex Wno-float-equal
> > +diff --git a/gcc/gcc.c b/gcc/gcc.c
> > +index a716f708259..02b3cd39fc2 100644
> > +--- a/gcc/gcc.c
> > ++++ b/gcc/gcc.c
> > +@@ -1037,6 +1037,8 @@ proper position among the other output files.  =
*/
> > +    "%{fuse-ld=3D*:-fuse-ld=3D%*} " LINK_COMPRESS_DEBUG_SPEC \
> > +    "%X %{o*} %{e*} %{N} %{n} %{r}\
> > +     %{s} %{t} %{u*} %{z} %{Z} %{!nostdlib:%{!nostartfiles:%S}} \
> > ++    %{Wno-poison-system-directories:--no-poison-system-directories} =
\
> > ++    %{Werror=3Dpoison-system-directories:--error-poison-system-direc=
tories} \
> > +     %{static|no-pie|static-pie:} %{L*} %(mfwrap) %(link_libgcc) " \
> > +     VTABLE_VERIFICATION_SPEC " " SANITIZER_EARLY_SPEC " %o " CHKP_SP=
EC " \
> > +     %{fopenacc|fopenmp|%:gt(%{ftree-parallelize-loops=3D*:%*} 1):\
> > +diff --git a/gcc/incpath.c b/gcc/incpath.c
> > +index b11c6a57939..9a457e02dd3 100644
> > +--- a/gcc/incpath.c
> > ++++ b/gcc/incpath.c
> > +@@ -26,6 +26,7 @@
> > + #include "intl.h"
> > + #include "incpath.h"
> > + #include "cppdefault.h"
> > ++#include "diagnostic-core.h"
> > +
> > + /* Microsoft Windows does not natively support inodes.
> > +    VMS has non-numeric inodes.  */
> > +@@ -393,6 +394,26 @@ merge_include_chains (const char *sysroot, cpp_r=
eader *pfile, int verbose)
> > +     }
> > +       fprintf (stderr, _("End of search list.\n"));
> > +     }
> > ++
> > ++#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
> > ++  if (flag_poison_system_directories)
> > ++    {
> > ++       struct cpp_dir *p;
> > ++
> > ++       for (p =3D heads[INC_QUOTE]; p; p =3D p->next)
> > ++         {
> > ++          if ((!strncmp (p->name, "/usr/include", 12))
> > ++              || (!strncmp (p->name, "/usr/local/include", 18))
> > ++              || (!strncmp (p->name, "/usr/X11R6/include", 18))
> > ++              || (!strncmp (p->name, "/sw/include", 11))
> > ++              || (!strncmp (p->name, "/opt/include", 12)))
> > ++            warning (OPT_Wpoison_system_directories,
> > ++                     "include location \"%s\" is unsafe for "
> > ++                     "cross-compilation",
> > ++                     p->name);
> > ++         }
> > ++    }
> > ++#endif
> > + }
> > +
> > + /* Use given -I paths for #include "..." but not #include <...>, and
> > +--
> > +2.21.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0003-=
gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch b/meta-arm-toolchain/recipes-devt=
ools/gcc/gcc-arm-8.3/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
> > new file mode 100644
> > index 0000000..e62deb2
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0003-gcc-4.3=
.3-SYSROOT_CFLAGS_FOR_TARGET.patch
> > @@ -0,0 +1,73 @@
> > +From 6640d7e39b13d1ef26d249153ab15d510fda3566 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:08:31 +0400
> > +Subject: [PATCH 03/40] gcc-4.3.3: SYSROOT_CFLAGS_FOR_TARGET
> > +
> > +Before committing, I noticed that PR/32161 was marked as a dup of PR/=
32009, but my previous patch did not fix it.
> > +
> > +This alternative patch is better because it lets you just use CFLAGS_=
FOR_TARGET to set the compilation flags for libgcc. Since bootstrapped targ=
et libraries are never compiled with the native compiler, it makes little s=
ense to use different flags for stage1 and later stages. And it also makes =
little sense to use a different variable than CFLAGS_FOR_TARGET.
> > +
> > +Other changes I had to do include:
> > +
> > +- moving the creation of default CFLAGS_FOR_TARGET from Makefile.am t=
o configure.ac, because otherwise the BOOT_CFLAGS are substituted into CFLA=
GS_FOR_TARGET (which is "-O2 -g $(CFLAGS)") via $(CFLAGS). It is also clean=
er this way though.
> > +
> > +- passing the right CFLAGS to configure scripts as exported environme=
nt variables
> > +
> > +I also stopped passing LIBCFLAGS to configure scripts since they are =
unused in the whole src tree. And I updated the documentation as H-P remind=
ed me to do.
> > +
> > +Bootstrapped/regtested i686-pc-linux-gnu, will commit to 4.4 shortly.=
 Ok for 4.3?
> > +
> > +Signed-off-by: Paolo Bonzini  <bonzini@gnu.org>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Pending
> > +---
> > + configure | 32 ++++++++++++++++++++++++++++++++
> > + 1 file changed, 32 insertions(+)
> > +
> > +diff --git a/configure b/configure
> > +index 8c5b1e9d561..2d1fc6b94d9 100755
> > +--- a/configure
> > ++++ b/configure
> > +@@ -6768,6 +6768,38 @@ fi
> > +
> > +
> > +
> > ++# During gcc bootstrap, if we use some random cc for stage1 then CFL=
AGS
> > ++# might be empty or "-g".  We don't require a C++ compiler, so CXXFL=
AGS
> > ++# might also be empty (or "-g", if a non-GCC C++ compiler is in the =
path).
> > ++# We want to ensure that TARGET libraries (which we know are built w=
ith
> > ++# gcc) are built with "-O2 -g", so include those options when settin=
g
> > ++# CFLAGS_FOR_TARGET and CXXFLAGS_FOR_TARGET.
> > ++if test "x$CFLAGS_FOR_TARGET" =3D x; then
> > ++  CFLAGS_FOR_TARGET=3D$CFLAGS
> > ++  case " $CFLAGS " in
> > ++    *" -O2 "*) ;;
> > ++    *) CFLAGS_FOR_TARGET=3D"-O2 $CFLAGS" ;;
> > ++  esac
> > ++  case " $CFLAGS " in
> > ++    *" -g "* | *" -g3 "*) ;;
> > ++    *) CFLAGS_FOR_TARGET=3D"-g $CFLAGS" ;;
> > ++  esac
> > ++fi
> > ++
> > ++
> > ++if test "x$CXXFLAGS_FOR_TARGET" =3D x; then
> > ++  CXXFLAGS_FOR_TARGET=3D$CXXFLAGS
> > ++  case " $CXXFLAGS " in
> > ++    *" -O2 "*) ;;
> > ++    *) CXXFLAGS_FOR_TARGET=3D"-O2 $CXXFLAGS" ;;
> > ++  esac
> > ++  case " $CXXFLAGS " in
> > ++    *" -g "* | *" -g3 "*) ;;
> > ++    *) CXXFLAGS_FOR_TARGET=3D"-g $CXXFLAGS" ;;
> > ++  esac
> > ++fi
> > ++
> > ++
> > + # Handle --with-headers=3DXXX.  If the value is not "yes", the conte=
nts of
> > + # the named directory are copied to $(tooldir)/sys-include.
> > + if test x"${with_headers}" !=3D x && test x"${with_headers}" !=3D xn=
o ; then
> > +--
> > +2.21.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0004-=
64-bit-multilib-hack.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-ar=
m-8.3/0004-64-bit-multilib-hack.patch
> > new file mode 100644
> > index 0000000..371d877
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0004-64-bit-=
multilib-hack.patch
> > @@ -0,0 +1,85 @@
> > +From 1e649d81ca662c4cdf73882ebb8a11f0f19f5baf Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:10:06 +0400
> > +Subject: [PATCH 04/40] 64-bit multilib hack.
> > +
> > +GCC has internal multilib handling code but it assumes a very specifi=
c rigid directory
> > +layout. The build system implementation of multilib layout is very ge=
neric and allows
> > +complete customisation of the library directories.
> > +
> > +This patch is a partial solution to allow any custom directories to b=
e passed into gcc
> > +and handled correctly. It forces gcc to use the base_libdir (which is=
 the current
> > +directory, "."). We need to do this for each multilib that is configu=
red as we don't
> > +know which compiler options may be being passed into the compiler. Si=
nce we have a compiler
> > +per mulitlib at this point that isn't an issue.
> > +
> > +The one problem is the target compiler is only going to work for the =
default multlilib at
> > +this point. Ideally we'd figure out which multilibs were being enable=
d with which paths
> > +and be able to patch these entries with a complete set of correct pat=
hs but this we
> > +don't have such code at this point. This is something the target gcc =
recipe should do
> > +and override these platform defaults in its build config.
> > +
> > +RP 15/8/11
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
> > +
> > +Upstream-Status: Pending
> > +---
> > + gcc/config/i386/t-linux64   |  6 ++----
> > + gcc/config/mips/t-linux64   | 10 +++-------
> > + gcc/config/rs6000/t-linux64 |  5 ++---
> > + 3 files changed, 7 insertions(+), 14 deletions(-)
> > +
> > +diff --git a/gcc/config/i386/t-linux64 b/gcc/config/i386/t-linux64
> > +index 8ea0faff369..266c6008004 100644
> > +--- a/gcc/config/i386/t-linux64
> > ++++ b/gcc/config/i386/t-linux64
> > +@@ -32,7 +32,5 @@
> > + #
> > + comma=3D,
> > + MULTILIB_OPTIONS    =3D $(subst $(comma),/,$(TM_MULTILIB_CONFIG))
> > +-MULTILIB_DIRNAMES   =3D $(patsubst m%, %, $(subst /, ,$(MULTILIB_OPT=
IONS)))
> > +-MULTILIB_OSDIRNAMES =3D m64=3D../lib64$(call if_multiarch,:x86_64-li=
nux-gnu)
> > +-MULTILIB_OSDIRNAMES+=3D m32=3D$(if $(wildcard $(shell echo $(SYSTEM_=
HEADER_DIR))/../../usr/lib32),../lib32,../lib)$(call if_multiarch,:i386-lin=
ux-gnu)
> > +-MULTILIB_OSDIRNAMES+=3D mx32=3D../libx32$(call if_multiarch,:x86_64-=
linux-gnux32)
> > ++MULTILIB_DIRNAMES =3D . .
> > ++MULTILIB_OSDIRNAMES =3D ../$(shell basename $(base_libdir)) ../$(she=
ll basename $(base_libdir))
> > +diff --git a/gcc/config/mips/t-linux64 b/gcc/config/mips/t-linux64
> > +index c017b7d04c5..126892cf40b 100644
> > +--- a/gcc/config/mips/t-linux64
> > ++++ b/gcc/config/mips/t-linux64
> > +@@ -17,10 +17,6 @@
> > + # <http://www.gnu.org/licenses/>.
> > +
> > + MULTILIB_OPTIONS =3D mabi=3Dn32/mabi=3D32/mabi=3D64
> > +-MULTILIB_DIRNAMES =3D n32 32 64
> > +-MIPS_EL =3D $(if $(filter %el, $(firstword $(subst -, ,$(target)))),=
el)
> > +-MIPS_SOFT =3D $(if $(strip $(filter MASK_SOFT_FLOAT_ABI, $(target_cp=
u_default)) $(filter soft, $(with_float))),soft)
> > +-MULTILIB_OSDIRNAMES =3D \
> > +-    ../lib32$(call if_multiarch,:mips64$(MIPS_EL)-linux-gnuabin32$(M=
IPS_SOFT)) \
> > +-    ../lib$(call if_multiarch,:mips$(MIPS_EL)-linux-gnu$(MIPS_SOFT))=
 \
> > +-    ../lib64$(call if_multiarch,:mips64$(MIPS_EL)-linux-gnuabi64$(MI=
PS_SOFT))
> > ++MULTILIB_DIRNAMES =3D . . .
> > ++MULTILIB_OSDIRNAMES =3D ../$(shell basename $(base_libdir)) ../$(she=
ll basename $(base_libdir)) ../$(shell basename $(base_libdir))
> > ++
> > +diff --git a/gcc/config/rs6000/t-linux64 b/gcc/config/rs6000/t-linux6=
4
> > +index 0faa2a02df4..13fd8ca971e 100644
> > +--- a/gcc/config/rs6000/t-linux64
> > ++++ b/gcc/config/rs6000/t-linux64
> > +@@ -26,10 +26,9 @@
> > + # MULTILIB_OSDIRNAMES according to what is found on the target.
> > +
> > + MULTILIB_OPTIONS    :=3D m64/m32
> > +-MULTILIB_DIRNAMES   :=3D 64 32
> > ++MULTILIB_DIRNAMES   :=3D . .
> > + MULTILIB_EXTRA_OPTS :=3D
> > +-MULTILIB_OSDIRNAMES :=3D m64=3D../lib64$(call if_multiarch,:powerpc6=
4-linux-gnu)
> > +-MULTILIB_OSDIRNAMES +=3D m32=3D$(if $(wildcard $(shell echo $(SYSTEM=
_HEADER_DIR))/../../usr/lib32),../lib32,../lib)$(call if_multiarch,:powerpc=
-linux-gnu)
> > ++MULTILIB_OSDIRNAMES :=3D ../$(shell basename $(base_libdir)) ../$(sh=
ell basename $(base_libdir))
> > +
> > + rs6000-linux.o: $(srcdir)/config/rs6000/rs6000-linux.c
> > +     $(COMPILE) $<
> > +--
> > +2.21.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0005-=
optional-libstdc.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.=
3/0005-optional-libstdc.patch
> > new file mode 100644
> > index 0000000..f9cf6c2
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0005-optiona=
l-libstdc.patch
> > @@ -0,0 +1,125 @@
> > +From b486380dcc4758e856ab6d847eb358d05bd79d64 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:12:56 +0400
> > +Subject: [PATCH 05/40] optional libstdc
> > +
> > +gcc-runtime builds libstdc++ separately from gcc-cross-*. Its configu=
re tests using g++
> > +will not run correctly since by default the linker will try to link a=
gainst libstdc++
> > +which shouldn't exist yet. We need an option to disable -lstdc++
> > +option whilst leaving -lc, -lgcc and other automatic library dependen=
cies added by gcc
> > +driver. This patch adds such an option which only disables the -lstdc=
++.
> > +
> > +A "standard" gcc build uses xgcc and hence avoids this. We should ask=
 upstream how to
> > +do this officially, the likely answer is don't build libstdc++ separa=
tely.
> > +
> > +RP 29/6/10
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Inappropriate [embedded specific]
> > +---
> > + gcc/c-family/c.opt  |  4 ++++
> > + gcc/cp/g++spec.c    |  1 +
> > + gcc/doc/invoke.texi | 32 +++++++++++++++++++++++++++++++-
> > + gcc/gcc.c           |  1 +
> > + 4 files changed, 37 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/gcc/c-family/c.opt b/gcc/c-family/c.opt
> > +index f591b39be5a..2955fcea867 100644
> > +--- a/gcc/c-family/c.opt
> > ++++ b/gcc/c-family/c.opt
> > +@@ -1901,6 +1901,10 @@ nostdinc++
> > + C++ ObjC++
> > + Do not search standard system include directories for C++.
> > +
> > ++nostdlib++
> > ++Driver
> > ++Do not link standard C++ runtime library
> > ++
> > + o
> > + C ObjC C++ ObjC++ Joined Separate
> > + ; Documented in common.opt
> > +diff --git a/gcc/cp/g++spec.c b/gcc/cp/g++spec.c
> > +index 443a1746da3..e9b51be62ef 100644
> > +--- a/gcc/cp/g++spec.c
> > ++++ b/gcc/cp/g++spec.c
> > +@@ -137,6 +137,7 @@ lang_specific_driver (struct cl_decoded_option **=
in_decoded_options,
> > +       switch (decoded_options[i].opt_index)
> > +     {
> > +     case OPT_nostdlib:
> > ++    case OPT_nostdlib__:
> > +     case OPT_nodefaultlibs:
> > +       library =3D -1;
> > +       break;
> > +diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
> > +index fb228631a42..310ba8109ed 100644
> > +--- a/gcc/doc/invoke.texi
> > ++++ b/gcc/doc/invoke.texi
> > +@@ -212,6 +212,9 @@ in the following sections.
> > + -fno-weak  -nostdinc++ @gol
> > + -fvisibility-inlines-hidden @gol
> > + -fvisibility-ms-compat @gol
> > ++-fvtable-verify=3D@r{[}std@r{|}preinit@r{|}none@r{]} @gol
> > ++-fvtv-counts -fvtv-debug @gol
> > ++-nostdlib++ @gol
> > + -fext-numeric-literals @gol
> > + -Wabi=3D@var{n}  -Wabi-tag  -Wconversion-null  -Wctor-dtor-privacy @=
gol
> > + -Wdelete-non-virtual-dtor  -Wliteral-suffix  -Wmultiple-inheritance =
@gol
> > +@@ -510,7 +513,7 @@ Objective-C and Objective-C++ Dialects}.
> > + -s  -static -static-pie -static-libgcc  -static-libstdc++ @gol
> > + -static-libasan  -static-libtsan  -static-liblsan  -static-libubsan =
@gol
> > + -static-libmpx  -static-libmpxwrappers @gol
> > +--shared  -shared-libgcc  -symbolic @gol
> > ++-shared  -shared-libgcc  -symbolic -nostdlib++ @gol
> > + -T @var{script}  -Wl,@var{option}  -Xlinker @var{option} @gol
> > + -u @var{symbol}  -z @var{keyword}}
> > +
> > +@@ -12359,6 +12362,33 @@ library subroutines.
> > + constructors are called; @pxref{Collect2,,@code{collect2}, gccint,
> > + GNU Compiler Collection (GCC) Internals}.)
> > +
> > ++@item -nostdlib++
> > ++@opindex nostdlib++
> > ++Do not use the standard system C++ runtime libraries when linking.
> > ++Only the libraries you specify will be passed to the linker.
> > ++
> > ++@cindex @option{-lgcc}, use with @option{-nostdlib}
> > ++@cindex @option{-nostdlib} and unresolved references
> > ++@cindex unresolved references and @option{-nostdlib}
> > ++@cindex @option{-lgcc}, use with @option{-nodefaultlibs}
> > ++@cindex @option{-nodefaultlibs} and unresolved references
> > ++@cindex unresolved references and @option{-nodefaultlibs}
> > ++One of the standard libraries bypassed by @option{-nostdlib} and
> > ++@option{-nodefaultlibs} is @file{libgcc.a}, a library of internal su=
broutines
> > ++which GCC uses to overcome shortcomings of particular machines, or s=
pecial
> > ++needs for some languages.
> > ++(@xref{Interface,,Interfacing to GCC Output,gccint,GNU Compiler
> > ++Collection (GCC) Internals},
> > ++for more discussion of @file{libgcc.a}.)
> > ++In most cases, you need @file{libgcc.a} even when you want to avoid
> > ++other standard libraries.  In other words, when you specify @option{=
-nostdlib}
> > ++or @option{-nodefaultlibs} you should usually specify @option{-lgcc}=
 as well.
> > ++This ensures that you have no unresolved references to internal GCC
> > ++library subroutines.
> > ++(An example of such an internal subroutine is @code{__main}, used to=
 ensure C++
> > ++constructors are called; @pxref{Collect2,,@code{collect2}, gccint,
> > ++GNU Compiler Collection (GCC) Internals}.)
> > ++
> > + @item -pie
> > + @opindex pie
> > + Produce a dynamically linked position independent executable on targ=
ets
> > +diff --git a/gcc/gcc.c b/gcc/gcc.c
> > +index 02b3cd39fc2..8cd27a5dad5 100644
> > +--- a/gcc/gcc.c
> > ++++ b/gcc/gcc.c
> > +@@ -1047,6 +1047,7 @@ proper position among the other output files.  =
*/
> > +     %(mflib) " STACK_SPLIT_SPEC "\
> > +     %{fprofile-arcs|fprofile-generate*|coverage:-lgcov} " SANITIZER_=
SPEC " \
> > +     %{!nostdlib:%{!nodefaultlibs:%(link_ssp) %(link_gcc_c_sequence)}=
}\
> > ++    %{!nostdlib++:}\
> > +     %{!nostdlib:%{!nostartfiles:%E}} %{T*}  \n%(post_link) }}}}}}"
> > + #endif
> > +
> > +--
> > +2.21.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0006-=
gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch b/meta-arm-toolchain/recipes-dev=
tools/gcc/gcc-arm-8.3/0006-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
> > new file mode 100644
> > index 0000000..0cea228
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0006-gcc-dis=
able-MASK_RELAX_PIC_CALLS-bit.patch
> > @@ -0,0 +1,59 @@
> > +From 1dba090a11c40b0926f9707a543d658c95e1f156 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:14:20 +0400
> > +Subject: [PATCH 06/40] gcc: disable MASK_RELAX_PIC_CALLS bit
> > +
> > +The new feature added after 4.3.3
> > +"http://www.pubbs.net/200909/gcc/94048-patch-add-support-for-rmipsjal=
r.html"
> > +will cause cc1plus eat up all the system memory when build webkit-gtk=
.
> > +The function mips_get_pic_call_symbol keeps on recursively calling it=
self.
> > +Disable this feature to walk aside the bug.
> > +
> > +Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Inappropriate [configuration]
> > +---
> > + gcc/configure    | 7 -------
> > + gcc/configure.ac | 7 -------
> > + 2 files changed, 14 deletions(-)
> > +
> > +diff --git a/gcc/configure b/gcc/configure
> > +index 3901722400c..0c9b8ac5f55 100755
> > +--- a/gcc/configure
> > ++++ b/gcc/configure
> > +@@ -27553,13 +27553,6 @@ $as_echo_n "checking assembler and linker fo=
r explicit JALR relocation... " >&6;
> > +         rm -f conftest.*
> > +       fi
> > +     fi
> > +-    if test $gcc_cv_as_ld_jalr_reloc =3D yes; then
> > +-      if test x$target_cpu_default =3D x; then
> > +-        target_cpu_default=3DMASK_RELAX_PIC_CALLS
> > +-      else
> > +-        target_cpu_default=3D"($target_cpu_default)|MASK_RELAX_PIC_C=
ALLS"
> > +-      fi
> > +-    fi
> > +     { $as_echo "$as_me:${as_lineno-$LINENO}: result: $gcc_cv_as_ld_j=
alr_reloc" >&5
> > + $as_echo "$gcc_cv_as_ld_jalr_reloc" >&6; }
> > +
> > +diff --git a/gcc/configure.ac b/gcc/configure.ac
> > +index 1b1362f70fe..53840363115 100644
> > +--- a/gcc/configure.ac
> > ++++ b/gcc/configure.ac
> > +@@ -4798,13 +4798,6 @@ x:
> > +         rm -f conftest.*
> > +       fi
> > +     fi
> > +-    if test $gcc_cv_as_ld_jalr_reloc =3D yes; then
> > +-      if test x$target_cpu_default =3D x; then
> > +-        target_cpu_default=3DMASK_RELAX_PIC_CALLS
> > +-      else
> > +-        target_cpu_default=3D"($target_cpu_default)|MASK_RELAX_PIC_C=
ALLS"
> > +-      fi
> > +-    fi
> > +     AC_MSG_RESULT($gcc_cv_as_ld_jalr_reloc)
> > +
> > +     AC_CACHE_CHECK([linker for .eh_frame personality relaxation],
> > +--
> > +2.21.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0007-=
COLLECT_GCC_OPTIONS.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm=
-8.3/0007-COLLECT_GCC_OPTIONS.patch
> > new file mode 100644
> > index 0000000..8c7e72e
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0007-COLLECT=
_GCC_OPTIONS.patch
> > @@ -0,0 +1,38 @@
> > +From 209e46f45382088caab54425b92b5dfc43ebb4fc Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:16:28 +0400
> > +Subject: [PATCH 07/40] COLLECT_GCC_OPTIONS
> > +
> > +This patch adds --sysroot into COLLECT_GCC_OPTIONS which is used to
> > +invoke collect2.
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Pending
> > +---
> > + gcc/gcc.c | 9 +++++++++
> > + 1 file changed, 9 insertions(+)
> > +
> > +diff --git a/gcc/gcc.c b/gcc/gcc.c
> > +index 8cd27a5dad5..d355d65583a 100644
> > +--- a/gcc/gcc.c
> > ++++ b/gcc/gcc.c
> > +@@ -4677,6 +4677,15 @@ set_collect_gcc_options (void)
> > +             sizeof ("COLLECT_GCC_OPTIONS=3D") - 1);
> > +
> > +   first_time =3D TRUE;
> > ++#ifdef HAVE_LD_SYSROOT
> > ++  if (target_system_root_changed && target_system_root)
> > ++    {
> > ++      obstack_grow (&collect_obstack, "'--sysroot=3D", sizeof("'--sy=
sroot=3D")-1);
> > ++      obstack_grow (&collect_obstack, target_system_root,strlen(targ=
et_system_root));
> > ++      obstack_grow (&collect_obstack, "'", 1);
> > ++      first_time =3D FALSE;
> > ++    }
> > ++#endif
> > +   for (i =3D 0; (int) i < n_switches; i++)
> > +     {
> > +       const char *const *args;
> > +--
> > +2.21.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0008-=
Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch b/meta-arm-toolcha=
in/recipes-devtools/gcc/gcc-arm-8.3/0008-Use-the-defaults.h-in-B-instead-of=
-S-and-t-oe-in-B.patch
> > new file mode 100644
> > index 0000000..f9632af
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0008-Use-the=
-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
> > @@ -0,0 +1,96 @@
> > +From 3bcbdf5ade54a72820ad7798119d0bbad4baf6ec Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:17:25 +0400
> > +Subject: [PATCH 08/40] Use the defaults.h in ${B} instead of ${S}, an=
d t-oe in
> > + ${B}
> > +
> > +Use the defaults.h in ${B} instead of ${S}, and t-oe in ${B}, so that
> > +the source can be shared between gcc-cross-initial,
> > +gcc-cross-intermediate, gcc-cross, gcc-runtime, and also the sdk buil=
d.
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Pending
> > +
> > +While compiling gcc-crosssdk-initial-x86_64 on some host, there is
> > +occasionally failure that test the existance of default.h doesn't
> > +work, the reason is tm_include_list=3D'** defaults.h' rather than
> > +tm_include_list=3D'** ./defaults.h'
> > +
> > +So we add the test condition for this situation.
> > +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > +---
> > + gcc/Makefile.in  | 2 +-
> > + gcc/configure    | 4 ++--
> > + gcc/configure.ac | 4 ++--
> > + gcc/mkconfig.sh  | 4 ++--
> > + 4 files changed, 7 insertions(+), 7 deletions(-)
> > +
> > +diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> > +index 20bee0494b1..1367136bfac 100644
> > +--- a/gcc/Makefile.in
> > ++++ b/gcc/Makefile.in
> > +@@ -538,7 +538,7 @@ TARGET_SYSTEM_ROOT =3D @TARGET_SYSTEM_ROOT@
> > + TARGET_SYSTEM_ROOT_DEFINE =3D @TARGET_SYSTEM_ROOT_DEFINE@
> > +
> > + xmake_file=3D@xmake_file@
> > +-tmake_file=3D@tmake_file@
> > ++tmake_file=3D@tmake_file@ ./t-oe
> > + TM_ENDIAN_CONFIG=3D@TM_ENDIAN_CONFIG@
> > + TM_MULTILIB_CONFIG=3D@TM_MULTILIB_CONFIG@
> > + TM_MULTILIB_EXCEPTIONS_CONFIG=3D@TM_MULTILIB_EXCEPTIONS_CONFIG@
> > +diff --git a/gcc/configure b/gcc/configure
> > +index 0c9b8ac5f55..134c2c2f156 100755
> > +--- a/gcc/configure
> > ++++ b/gcc/configure
> > +@@ -12158,8 +12158,8 @@ for f in $tm_file; do
> > +        tm_include_list=3D"${tm_include_list} $f"
> > +        ;;
> > +     defaults.h )
> > +-       tm_file_list=3D"${tm_file_list} \$(srcdir)/$f"
> > +-       tm_include_list=3D"${tm_include_list} $f"
> > ++       tm_file_list=3D"${tm_file_list} ./$f"
> > ++       tm_include_list=3D"${tm_include_list} ./$f"
> > +        ;;
> > +     * )
> > +        tm_file_list=3D"${tm_file_list} \$(srcdir)/config/$f"
> > +diff --git a/gcc/configure.ac b/gcc/configure.ac
> > +index 53840363115..0c3c82e4ff7 100644
> > +--- a/gcc/configure.ac
> > ++++ b/gcc/configure.ac
> > +@@ -1922,8 +1922,8 @@ for f in $tm_file; do
> > +        tm_include_list=3D"${tm_include_list} $f"
> > +        ;;
> > +     defaults.h )
> > +-       tm_file_list=3D"${tm_file_list} \$(srcdir)/$f"
> > +-       tm_include_list=3D"${tm_include_list} $f"
> > ++       tm_file_list=3D"${tm_file_list} ./$f"
> > ++       tm_include_list=3D"${tm_include_list} ./$f"
> > +        ;;
> > +     * )
> > +        tm_file_list=3D"${tm_file_list} \$(srcdir)/config/$f"
> > +diff --git a/gcc/mkconfig.sh b/gcc/mkconfig.sh
> > +index 0f75c863c0b..68d8d6613cf 100644
> > +--- a/gcc/mkconfig.sh
> > ++++ b/gcc/mkconfig.sh
> > +@@ -77,7 +77,7 @@ if [ -n "$HEADERS" ]; then
> > +     if [ $# -ge 1 ]; then
> > +     echo '#ifdef IN_GCC' >> ${output}T
> > +     for file in "$@"; do
> > +-        if test x"$file" =3D x"defaults.h"; then
> > ++        if test x"$file" =3D x"./defaults.h" -o x"$file" =3D x"defau=
lts.h"; then
> > +             postpone_defaults_h=3D"yes"
> > +         else
> > +             echo "# include \"$file\"" >> ${output}T
> > +@@ -106,7 +106,7 @@ esac
> > +
> > + # If we postponed including defaults.h, add the #include now.
> > + if test x"$postpone_defaults_h" =3D x"yes"; then
> > +-    echo "# include \"defaults.h\"" >> ${output}T
> > ++    echo "# include \"./defaults.h\"" >> ${output}T
> > + fi
> > +
> > + # Add multiple inclusion protection guard, part two.
> > +--
> > +2.21.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0009-=
fortran-cross-compile-hack.patch b/meta-arm-toolchain/recipes-devtools/gcc/=
gcc-arm-8.3/0009-fortran-cross-compile-hack.patch
> > new file mode 100644
> > index 0000000..50d895b
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0009-fortran=
-cross-compile-hack.patch
> > @@ -0,0 +1,46 @@
> > +From e654573352d28f160f379ee77e4067cf108714d0 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:20:01 +0400
> > +Subject: [PATCH 09/40] fortran cross-compile hack.
> > +
> > +* Fortran would have searched for arm-angstrom-gnueabi-gfortran but w=
ould have used
> > +used gfortan. For gcc_4.2.2.bb we want to use the gfortran compiler f=
rom our cross
> > +directory.
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Inappropriate [embedded specific]
> > +---
> > + libgfortran/configure    | 2 +-
> > + libgfortran/configure.ac | 2 +-
> > + 2 files changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/libgfortran/configure b/libgfortran/configure
> > +index 91fce8fecd0..6747f86eb98 100755
> > +--- a/libgfortran/configure
> > ++++ b/libgfortran/configure
> > +@@ -12883,7 +12883,7 @@ esac
> > +
> > + # We need gfortran to compile parts of the library
> > + #AC_PROG_FC(gfortran)
> > +-FC=3D"$GFORTRAN"
> > ++#FC=3D"$GFORTRAN"
> > + ac_ext=3D${ac_fc_srcext-f}
> > + ac_compile=3D'$FC -c $FCFLAGS $ac_fcflags_srcext conftest.$ac_ext >&=
5'
> > + ac_link=3D'$FC -o conftest$ac_exeext $FCFLAGS $LDFLAGS $ac_fcflags_s=
rcext conftest.$ac_ext $LIBS >&5'
> > +diff --git a/libgfortran/configure.ac b/libgfortran/configure.ac
> > +index bf6d3634dda..9dbe43cc616 100644
> > +--- a/libgfortran/configure.ac
> > ++++ b/libgfortran/configure.ac
> > +@@ -250,7 +250,7 @@ AC_SUBST(enable_static)
> > +
> > + # We need gfortran to compile parts of the library
> > + #AC_PROG_FC(gfortran)
> > +-FC=3D"$GFORTRAN"
> > ++#FC=3D"$GFORTRAN"
> > + AC_PROG_FC(gfortran)
> > +
> > + # extra LD Flags which are required for targets
> > +--
> > +2.21.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0010-=
cpp-honor-sysroot.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8=
.3/0010-cpp-honor-sysroot.patch
> > new file mode 100644
> > index 0000000..037eacf
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0010-cpp-hon=
or-sysroot.patch
> > @@ -0,0 +1,54 @@
> > +From 2ae7af4eb70eff6aeda1fe96333ff50cfaa9d906 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:22:00 +0400
> > +Subject: [PATCH 10/40] cpp: honor sysroot.
> > +
> > +Currently, if the gcc toolchain is relocated and installed from sstat=
e, then you try and compile
> > +preprocessed source (.i or .ii files), the compiler will try and acce=
ss the builtin sysroot location
> > +rather than the --sysroot option specified on the commandline. If acc=
ess to that directory is
> > +permission denied (unreadable), gcc will error.
> > +
> > +This happens when ccache is in use due to the fact it uses preprocess=
ed source files.
> > +
> > +The fix below adds %I to the cpp-output spec macro so the default sub=
stitutions for -iprefix,
> > +-isystem, -isysroot happen and the correct sysroot is used.
> > +
> > +[YOCTO #2074]
> > +
> > +RP 2012/04/13
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Pending
> > +---
> > + gcc/cp/lang-specs.h | 2 +-
> > + gcc/gcc.c           | 2 +-
> > + 2 files changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/gcc/cp/lang-specs.h b/gcc/cp/lang-specs.h
> > +index f0802b8915c..f324d299849 100644
> > +--- a/gcc/cp/lang-specs.h
> > ++++ b/gcc/cp/lang-specs.h
> > +@@ -64,5 +64,5 @@ along with GCC; see the file COPYING3.  If not see
> > +   {".ii", "@c++-cpp-output", 0, 0, 0},
> > +   {"@c++-cpp-output",
> > +    "%{!M:%{!MM:%{!E:\
> > +-    cc1plus -fpreprocessed %i %(cc1_options) %2\
> > ++    cc1plus -fpreprocessed %i %I %(cc1_options) %2\
> > +     %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
> > +diff --git a/gcc/gcc.c b/gcc/gcc.c
> > +index d355d65583a..570cdc00034 100644
> > +--- a/gcc/gcc.c
> > ++++ b/gcc/gcc.c
> > +@@ -1343,7 +1343,7 @@ static const struct compiler default_compilers[=
] =3D
> > +                                        %W{o*:--output-pch=3D%*}}%V}}=
}}}}}", 0, 0, 0},
> > +   {".i", "@cpp-output", 0, 0, 0},
> > +   {"@cpp-output",
> > +-   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %(cc1_options) %{!fsyntax-=
only:%(invoke_as)}}}}", 0, 0, 0},
> > ++   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %I %(cc1_options) %{!fsynt=
ax-only:%(invoke_as)}}}}", 0, 0, 0},
> > +   {".s", "@assembler", 0, 0, 0},
> > +   {"@assembler",
> > +    "%{!M:%{!MM:%{!E:%{!S:as %(asm_debug) %(asm_options) %i %A }}}}",=
 0, 0, 0},
> > +--
> > +2.21.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0011-=
MIPS64-Default-to-N64-ABI.patch b/meta-arm-toolchain/recipes-devtools/gcc/g=
cc-arm-8.3/0011-MIPS64-Default-to-N64-ABI.patch
> > new file mode 100644
> > index 0000000..c863cff
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0011-MIPS64-=
Default-to-N64-ABI.patch
> > @@ -0,0 +1,57 @@
> > +From 1e1ea0eb55a594ac4cd7b838f74dec7405aae02b Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:23:08 +0400
> > +Subject: [PATCH 11/40] MIPS64: Default to N64 ABI
> > +
> > +MIPS64 defaults to n32 ABI, this patch makes it
> > +so that it defaults to N64 ABI
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Inappropriate [OE config specific]
> > +---
> > + gcc/config.gcc | 10 +++++-----
> > + 1 file changed, 5 insertions(+), 5 deletions(-)
> > +
> > +diff --git a/gcc/config.gcc b/gcc/config.gcc
> > +index 7af8e028104..fc7c91246ed 100644
> > +--- a/gcc/config.gcc
> > ++++ b/gcc/config.gcc
> > +@@ -2143,29 +2143,29 @@ mips*-*-linux*)                              =
# Linux MIPS, either endian.
> > +                     default_mips_arch=3Dmips32
> > +                     ;;
> > +             mips64el-st-linux-gnu)
> > +-                    default_mips_abi=3Dn32
> > ++                    default_mips_abi=3D64
> > +                     tm_file=3D"${tm_file} mips/st.h"
> > +                     tmake_file=3D"${tmake_file} mips/t-st"
> > +                     enable_mips_multilibs=3D"yes"
> > +                     ;;
> > +             mips64octeon*-*-linux*)
> > +-                    default_mips_abi=3Dn32
> > ++                    default_mips_abi=3D64
> > +                     tm_defines=3D"${tm_defines} MIPS_CPU_STRING_DEFA=
ULT=3D\\\"octeon\\\""
> > +                     target_cpu_default=3DMASK_SOFT_FLOAT_ABI
> > +                     enable_mips_multilibs=3D"yes"
> > +                     ;;
> > +             mipsisa64r6*-*-linux*)
> > +-                    default_mips_abi=3Dn32
> > ++                    default_mips_abi=3D64
> > +                     default_mips_arch=3Dmips64r6
> > +                     enable_mips_multilibs=3D"yes"
> > +                     ;;
> > +             mipsisa64r2*-*-linux*)
> > +-                    default_mips_abi=3Dn32
> > ++                    default_mips_abi=3D64
> > +                     default_mips_arch=3Dmips64r2
> > +                     enable_mips_multilibs=3D"yes"
> > +                     ;;
> > +             mips64*-*-linux* | mipsisa64*-*-linux*)
> > +-                    default_mips_abi=3Dn32
> > ++                    default_mips_abi=3D64
> > +                     enable_mips_multilibs=3D"yes"
> > +                     ;;
> > +     esac
> > +--
> > +2.21.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0012-=
Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta-arm-toolc=
hain/recipes-devtools/gcc/gcc-arm-8.3/0012-Define-GLIBC_DYNAMIC_LINKER-and-=
UCLIBC_DYNAMIC_LINKE.patch
> > new file mode 100644
> > index 0000000..d3be10f
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0012-Define-=
GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> > @@ -0,0 +1,248 @@
> > +From 6f8649936df3677109b8396f563c716ae8b237fe Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:24:50 +0400
> > +Subject: [PATCH 12/40] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC=
_LINKER
> > + relative to SYSTEMLIBS_DIR
> > +
> > +This patch defines GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
> > +relative to SYSTEMLIBS_DIR which can be set in generated headers
> > +This breaks the assumption of hardcoded multilib in gcc
> > +Change is only for the supported architectures in OE including
> > +SH, sparc, alpha for possible future support (if any)
> > +
> > +Removes the do_headerfix task in metadata
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Inappropriate [OE configuration]
> > +---
> > + gcc/config/alpha/linux-elf.h |  4 ++--
> > + gcc/config/arm/linux-eabi.h  |  4 ++--
> > + gcc/config/arm/linux-elf.h   |  2 +-
> > + gcc/config/i386/linux.h      |  2 +-
> > + gcc/config/i386/linux64.h    |  6 +++---
> > + gcc/config/linux.h           |  8 ++++----
> > + gcc/config/mips/linux.h      | 12 ++++++------
> > + gcc/config/riscv/linux.h     |  2 +-
> > + gcc/config/rs6000/linux64.h  | 16 ++++++----------
> > + gcc/config/sh/linux.h        |  2 +-
> > + gcc/config/sparc/linux.h     |  2 +-
> > + gcc/config/sparc/linux64.h   |  4 ++--
> > + 12 files changed, 30 insertions(+), 34 deletions(-)
> > +
> > +diff --git a/gcc/config/alpha/linux-elf.h b/gcc/config/alpha/linux-el=
f.h
> > +index 36b74dc1993..02373578af8 100644
> > +--- a/gcc/config/alpha/linux-elf.h
> > ++++ b/gcc/config/alpha/linux-elf.h
> > +@@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.  If not see
> > + #define EXTRA_SPECS \
> > + { "elf_dynamic_linker", ELF_DYNAMIC_LINKER },
> > +
> > +-#define GLIBC_DYNAMIC_LINKER        "/lib/ld-linux.so.2"
> > +-#define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
> > ++#define GLIBC_DYNAMIC_LINKER        SYSTEMLIBS_DIR "ld-linux.so.2"
> > ++#define UCLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-uClibc.so.0"
> > + #if DEFAULT_LIBC =3D=3D LIBC_UCLIBC
> > + #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
> > + #elif DEFAULT_LIBC =3D=3D LIBC_GLIBC
> > +diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.=
h
> > +index 8585fde3d41..b3af68cac57 100644
> > +--- a/gcc/config/arm/linux-eabi.h
> > ++++ b/gcc/config/arm/linux-eabi.h
> > +@@ -62,8 +62,8 @@
> > +    GLIBC_DYNAMIC_LINKER_DEFAULT and TARGET_DEFAULT_FLOAT_ABI.  */
> > +
> > + #undef  GLIBC_DYNAMIC_LINKER
> > +-#define GLIBC_DYNAMIC_LINKER_SOFT_FLOAT "/lib/ld-linux.so.3"
> > +-#define GLIBC_DYNAMIC_LINKER_HARD_FLOAT "/lib/ld-linux-armhf.so.3"
> > ++#define GLIBC_DYNAMIC_LINKER_SOFT_FLOAT SYSTEMLIBS_DIR "ld-linux.so.=
3"
> > ++#define GLIBC_DYNAMIC_LINKER_HARD_FLOAT SYSTEMLIBS_DIR "ld-linux-arm=
hf.so.3"
> > + #define GLIBC_DYNAMIC_LINKER_DEFAULT GLIBC_DYNAMIC_LINKER_SOFT_FLOAT
> > +
> > + #define GLIBC_DYNAMIC_LINKER \
> > +diff --git a/gcc/config/arm/linux-elf.h b/gcc/config/arm/linux-elf.h
> > +index cfcd9cb1a5c..a798e987ecb 100644
> > +--- a/gcc/config/arm/linux-elf.h
> > ++++ b/gcc/config/arm/linux-elf.h
> > +@@ -60,7 +60,7 @@
> > +
> > + #define LIBGCC_SPEC "%{mfloat-abi=3Dsoft*:-lfloat} -lgcc"
> > +
> > +-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
> > ++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
> > +
> > + #define LINUX_TARGET_LINK_SPEC  "%{h*} \
> > +    %{static:-Bstatic} \
> > +diff --git a/gcc/config/i386/linux.h b/gcc/config/i386/linux.h
> > +index 69f97f15b0d..71bc31d9231 100644
> > +--- a/gcc/config/i386/linux.h
> > ++++ b/gcc/config/i386/linux.h
> > +@@ -20,7 +20,7 @@ along with GCC; see the file COPYING3.  If not see
> > + <http://www.gnu.org/licenses/>.  */
> > +
> > + #define GNU_USER_LINK_EMULATION "elf_i386"
> > +-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
> > ++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
> > +
> > + #undef MUSL_DYNAMIC_LINKER
> > + #define MUSL_DYNAMIC_LINKER "/lib/ld-musl-i386.so.1"
> > +diff --git a/gcc/config/i386/linux64.h b/gcc/config/i386/linux64.h
> > +index f2d913e30ac..8725f33d8a5 100644
> > +--- a/gcc/config/i386/linux64.h
> > ++++ b/gcc/config/i386/linux64.h
> > +@@ -27,9 +27,9 @@ see the files COPYING3 and COPYING.RUNTIME respecti=
vely.  If not, see
> > + #define GNU_USER_LINK_EMULATION64 "elf_x86_64"
> > + #define GNU_USER_LINK_EMULATIONX32 "elf32_x86_64"
> > +
> > +-#define GLIBC_DYNAMIC_LINKER32 "/lib/ld-linux.so.2"
> > +-#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux-x86-64.so.2"
> > +-#define GLIBC_DYNAMIC_LINKERX32 "/libx32/ld-linux-x32.so.2"
> > ++#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-linux.so.2"
> > ++#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux-x86-64.so.2"
> > ++#define GLIBC_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ld-linux-x32.so.2"
> > +
> > + #undef MUSL_DYNAMIC_LINKER32
> > + #define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-i386.so.1"
> > +diff --git a/gcc/config/linux.h b/gcc/config/linux.h
> > +index 2ea4ff92c1d..487b0c0923b 100644
> > +--- a/gcc/config/linux.h
> > ++++ b/gcc/config/linux.h
> > +@@ -81,10 +81,10 @@ see the files COPYING3 and COPYING.RUNTIME respec=
tively.  If not, see
> > +    GLIBC_DYNAMIC_LINKER must be defined for each target using them, =
or
> > +    GLIBC_DYNAMIC_LINKER32 and GLIBC_DYNAMIC_LINKER64 for targets
> > +    supporting both 32-bit and 64-bit compilation.  */
> > +-#define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
> > +-#define UCLIBC_DYNAMIC_LINKER32 "/lib/ld-uClibc.so.0"
> > +-#define UCLIBC_DYNAMIC_LINKER64 "/lib/ld64-uClibc.so.0"
> > +-#define UCLIBC_DYNAMIC_LINKERX32 "/lib/ldx32-uClibc.so.0"
> > ++#define UCLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-uClibc.so.0"
> > ++#define UCLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-uClibc.so.0"
> > ++#define UCLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld64-uClibc.so.0"
> > ++#define UCLIBC_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ldx32-uClibc.so.0"
> > + #define BIONIC_DYNAMIC_LINKER "/system/bin/linker"
> > + #define BIONIC_DYNAMIC_LINKER32 "/system/bin/linker"
> > + #define BIONIC_DYNAMIC_LINKER64 "/system/bin/linker64"
> > +diff --git a/gcc/config/mips/linux.h b/gcc/config/mips/linux.h
> > +index 2dfd0c18b90..12057c51b5e 100644
> > +--- a/gcc/config/mips/linux.h
> > ++++ b/gcc/config/mips/linux.h
> > +@@ -22,20 +22,20 @@ along with GCC; see the file COPYING3.  If not se=
e
> > + #define GNU_USER_LINK_EMULATIONN32 "elf32%{EB:b}%{EL:l}tsmipn32"
> > +
> > + #define GLIBC_DYNAMIC_LINKER32 \
> > +-  "%{mnan=3D2008:/lib/ld-linux-mipsn8.so.1;:/lib/ld.so.1}"
> > ++  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld-linux-mipsn8.so.1;:" SYSTEMLIB=
S_DIR "ld.so.1}"
> > + #define GLIBC_DYNAMIC_LINKER64 \
> > +-  "%{mnan=3D2008:/lib64/ld-linux-mipsn8.so.1;:/lib64/ld.so.1}"
> > ++  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld-linux-mipsn8.so.1;:" SYSTEMLIB=
S_DIR "ld.so.1}"
> > + #define GLIBC_DYNAMIC_LINKERN32 \
> > +-  "%{mnan=3D2008:/lib32/ld-linux-mipsn8.so.1;:/lib32/ld.so.1}"
> > ++  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld-linux-mipsn8.so.1;:" SYSTEMLIB=
S_DIR "ld.so.1}"
> > +
> > + #undef UCLIBC_DYNAMIC_LINKER32
> > + #define UCLIBC_DYNAMIC_LINKER32 \
> > +-  "%{mnan=3D2008:/lib/ld-uClibc-mipsn8.so.0;:/lib/ld-uClibc.so.0}"
> > ++  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld-uClibc-mipsn8.so.0;:" SYSTEMLI=
BS_DIR "ld-uClibc.so.0}"
> > + #undef UCLIBC_DYNAMIC_LINKER64
> > + #define UCLIBC_DYNAMIC_LINKER64 \
> > +-  "%{mnan=3D2008:/lib/ld64-uClibc-mipsn8.so.0;:/lib/ld64-uClibc.so.0=
}"
> > ++  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld64-uClibc-mipsn8.so.0;:" SYSTEM=
LIBS_DIR "ld64-uClibc.so.0}"
> > + #define UCLIBC_DYNAMIC_LINKERN32 \
> > +-  "%{mnan=3D2008:/lib32/ld-uClibc-mipsn8.so.0;:/lib32/ld-uClibc.so.0=
}"
> > ++  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld-uClibc-mipsn8.so.0;:" SYSTEMLI=
BS_DIR "ld-uClibc.so.0}"
> > +
> > + #undef MUSL_DYNAMIC_LINKER32
> > + #define MUSL_DYNAMIC_LINKER32 \
> > +diff --git a/gcc/config/riscv/linux.h b/gcc/config/riscv/linux.h
> > +index aa8a28d5d31..ebf9551c955 100644
> > +--- a/gcc/config/riscv/linux.h
> > ++++ b/gcc/config/riscv/linux.h
> > +@@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.  If not see
> > +     GNU_USER_TARGET_OS_CPP_BUILTINS();                              =
\
> > +   } while (0)
> > +
> > +-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-riscv" XLEN_SPEC "-" ABI=
_SPEC ".so.1"
> > ++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux-riscv" XLEN_SP=
EC "-" ABI_SPEC ".so.1"
> > +
> > + #define MUSL_ABI_SUFFIX \
> > +   "%{mabi=3Dilp32:-sf}" \
> > +diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.=
h
> > +index 44eab40a234..54aa8d957e7 100644
> > +--- a/gcc/config/rs6000/linux64.h
> > ++++ b/gcc/config/rs6000/linux64.h
> > +@@ -413,16 +413,11 @@ extern int dot_symbols;
> > + #undef      LINK_OS_DEFAULT_SPEC
> > + #define LINK_OS_DEFAULT_SPEC "%(link_os_linux)"
> > +
> > +-#define GLIBC_DYNAMIC_LINKER32 "%(dynamic_linker_prefix)/lib/ld.so.1=
"
> > +-
> > ++#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld.so.1"
> > + #ifdef LINUX64_DEFAULT_ABI_ELFv2
> > +-#define GLIBC_DYNAMIC_LINKER64 \
> > +-"%{mabi=3Delfv1:%(dynamic_linker_prefix)/lib64/ld64.so.1;" \
> > +-":%(dynamic_linker_prefix)/lib64/ld64.so.2}"
> > ++#define GLIBC_DYNAMIC_LINKER64 "%{mabi=3Delfv1:" SYSTEMLIBS_DIR "ld6=
4.so.1;:" SYSTEMLIBS_DIR "ld64.so.2}"
> > + #else
> > +-#define GLIBC_DYNAMIC_LINKER64 \
> > +-"%{mabi=3Delfv2:%(dynamic_linker_prefix)/lib64/ld64.so.2;" \
> > +-":%(dynamic_linker_prefix)/lib64/ld64.so.1}"
> > ++#define GLIBC_DYNAMIC_LINKER64 "%{mabi=3Delfv2:" SYSTEMLIBS_DIR "ld6=
4.so.2;:" SYSTEMLIBS_DIR "ld64.so.1}"
> > + #endif
> > +
> > + #define MUSL_DYNAMIC_LINKER32 \
> > +@@ -430,8 +425,9 @@ extern int dot_symbols;
> > + #define MUSL_DYNAMIC_LINKER64 \
> > +   "/lib/ld-musl-powerpc64" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}=
.so.1"
> > +
> > +-#define UCLIBC_DYNAMIC_LINKER32 "/lib/ld-uClibc.so.0"
> > +-#define UCLIBC_DYNAMIC_LINKER64 "/lib/ld64-uClibc.so.0"
> > ++#define UCLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-uClibc.so.0"
> > ++#define UCLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld64-uClibc.so.0"
> > ++
> > + #if DEFAULT_LIBC =3D=3D LIBC_UCLIBC
> > + #define CHOOSE_DYNAMIC_LINKER(G, U, M) \
> > +   "%{mglibc:" G ";:%{mmusl:" M ";:" U "}}"
> > +diff --git a/gcc/config/sh/linux.h b/gcc/config/sh/linux.h
> > +index 6d2ccd012ba..ec78a89ce15 100644
> > +--- a/gcc/config/sh/linux.h
> > ++++ b/gcc/config/sh/linux.h
> > +@@ -64,7 +64,7 @@ along with GCC; see the file COPYING3.  If not see
> > +   "/lib/ld-musl-sh" MUSL_DYNAMIC_LINKER_E MUSL_DYNAMIC_LINKER_FP \
> > +   "%{mfdpic:-fdpic}.so.1"
> > +
> > +-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
> > ++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
> > +
> > + #undef SUBTARGET_LINK_EMUL_SUFFIX
> > + #define SUBTARGET_LINK_EMUL_SUFFIX "%{mfdpic:_fd;:_linux}"
> > +diff --git a/gcc/config/sparc/linux.h b/gcc/config/sparc/linux.h
> > +index 9fb03af0fe9..401fddbbb22 100644
> > +--- a/gcc/config/sparc/linux.h
> > ++++ b/gcc/config/sparc/linux.h
> > +@@ -83,7 +83,7 @@ extern const char *host_detect_local_cpu (int argc,=
 const char **argv);
> > +    When the -shared link option is used a final link is not being
> > +    done.  */
> > +
> > +-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
> > ++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
> > +
> > + #undef  LINK_SPEC
> > + #define LINK_SPEC "-m elf32_sparc %{shared:-shared} \
> > +diff --git a/gcc/config/sparc/linux64.h b/gcc/config/sparc/linux64.h
> > +index c1fe42165b7..26a79bfa2e3 100644
> > +--- a/gcc/config/sparc/linux64.h
> > ++++ b/gcc/config/sparc/linux64.h
> > +@@ -84,8 +84,8 @@ along with GCC; see the file COPYING3.  If not see
> > +    When the -shared link option is used a final link is not being
> > +    done.  */
> > +
> > +-#define GLIBC_DYNAMIC_LINKER32 "/lib/ld-linux.so.2"
> > +-#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux.so.2"
> > ++#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-linux.so.2"
> > ++#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux.so.2"
> > +
> > + #ifdef SPARC_BI_ARCH
> > +
> > +--
> > +2.21.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0013-=
gcc-Fix-argument-list-too-long-error.patch b/meta-arm-toolchain/recipes-dev=
tools/gcc/gcc-arm-8.3/0013-gcc-Fix-argument-list-too-long-error.patch
> > new file mode 100644
> > index 0000000..e9d2cac
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0013-gcc-Fix=
-argument-list-too-long-error.patch
> > @@ -0,0 +1,40 @@
> > +From 9e815965fbaa90134be0e777cfc2fbcfab16b674 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:26:37 +0400
> > +Subject: [PATCH 13/40] gcc: Fix argument list too long error.
> > +
> > +There would be an "Argument list too long" error when the
> > +build directory is longer than 200, this is caused by:
> > +
> > +headers=3D`echo $(PLUGIN_HEADERS) | tr ' ' '\012' | sort -u`
> > +
> > +The PLUGIN_HEADERS is too long before sort, so the "echo" can't handl=
e
> > +it, use the $(sort list) of GNU make which can handle the too long li=
st
> > +would fix the problem, the header would be short enough after sorted.
> > +The "tr ' ' '\012'" was used for translating the space to "\n", the
> > +$(sort list) doesn't need this.
> > +
> > +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Pending
> > +---
> > + gcc/Makefile.in | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> > +index 1367136bfac..71a8275c39f 100644
> > +--- a/gcc/Makefile.in
> > ++++ b/gcc/Makefile.in
> > +@@ -3538,7 +3538,7 @@ install-plugin: installdirs lang.install-plugin=
 s-header-vars install-gengtype
> > + # We keep the directory structure for files in config or c-family an=
d .def
> > + # files. All other files are flattened to a single directory.
> > +     $(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
> > +-    headers=3D`echo $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.de=
f) | tr ' ' '\012' | sort -u`; \
> > ++    headers=3D"$(sort $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.=
def))"; \
> > +     srcdirstrip=3D`echo "$(srcdir)" | sed 's/[].[^$$\\*|]/\\\\&/g'`;=
 \
> > +     for file in $$headers; do \
> > +       if [ -f $$file ] ; then \
> > +--
> > +2.21.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0014-=
Disable-sdt.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/001=
4-Disable-sdt.patch
> > new file mode 100644
> > index 0000000..2bc4451
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0014-Disable=
-sdt.patch
> > @@ -0,0 +1,113 @@
> > +From 00c7a7fdd4b4aad9e57d8b541de17ad209b6cd06 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:28:10 +0400
> > +Subject: [PATCH 14/40] Disable sdt.
> > +
> > +We don't list dtrace in DEPENDS so we shouldn't be depending on this =
header.
> > +It may or may not exist from preivous builds though. To be determinst=
ic, disable
> > +sdt.h usage always. This avoids build failures if the header is remov=
ed after configure
> > +but before libgcc is compiled for example.
> > +
> > +RP 2012/8/7
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Disable sdt for libstdc++-v3.
> > +
> > +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > +
> > +Upstream-Status: Inappropriate [hack]
> > +---
> > + gcc/configure             | 12 ++++++------
> > + gcc/configure.ac          | 18 +++++++++---------
> > + libstdc++-v3/configure    |  6 +++---
> > + libstdc++-v3/configure.ac |  2 +-
> > + 4 files changed, 19 insertions(+), 19 deletions(-)
> > +
> > +diff --git a/gcc/configure b/gcc/configure
> > +index 134c2c2f156..5111ec0aabb 100755
> > +--- a/gcc/configure
> > ++++ b/gcc/configure
> > +@@ -29282,12 +29282,12 @@ fi
> > + { $as_echo "$as_me:${as_lineno-$LINENO}: checking sys/sdt.h in the t=
arget C library" >&5
> > + $as_echo_n "checking sys/sdt.h in the target C library... " >&6; }
> > + have_sys_sdt_h=3Dno
> > +-if test -f $target_header_dir/sys/sdt.h; then
> > +-  have_sys_sdt_h=3Dyes
> > +-
> > +-$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
> > +-
> > +-fi
> > ++#if test -f $target_header_dir/sys/sdt.h; then
> > ++#  have_sys_sdt_h=3Dyes
> > ++#
> > ++#$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
> > ++#
> > ++#fi
> > + { $as_echo "$as_me:${as_lineno-$LINENO}: result: $have_sys_sdt_h" >&=
5
> > + $as_echo "$have_sys_sdt_h" >&6; }
> > +
> > +diff --git a/gcc/configure.ac b/gcc/configure.ac
> > +index 0c3c82e4ff7..3e09af916fd 100644
> > +--- a/gcc/configure.ac
> > ++++ b/gcc/configure.ac
> > +@@ -5943,15 +5943,15 @@ fi
> > + AC_SUBST([enable_default_ssp])
> > +
> > + # Test for <sys/sdt.h> on the target.
> > +-GCC_TARGET_TEMPLATE([HAVE_SYS_SDT_H])
> > +-AC_MSG_CHECKING(sys/sdt.h in the target C library)
> > +-have_sys_sdt_h=3Dno
> > +-if test -f $target_header_dir/sys/sdt.h; then
> > +-  have_sys_sdt_h=3Dyes
> > +-  AC_DEFINE(HAVE_SYS_SDT_H, 1,
> > +-            [Define if your target C library provides sys/sdt.h])
> > +-fi
> > +-AC_MSG_RESULT($have_sys_sdt_h)
> > ++#GCC_TARGET_TEMPLATE([HAVE_SYS_SDT_H])
> > ++#AC_MSG_CHECKING(sys/sdt.h in the target C library)
> > ++#have_sys_sdt_h=3Dno
> > ++#if test -f $target_header_dir/sys/sdt.h; then
> > ++#  have_sys_sdt_h=3Dyes
> > ++#  AC_DEFINE(HAVE_SYS_SDT_H, 1,
> > ++#            [Define if your target C library provides sys/sdt.h])
> > ++#fi
> > ++#AC_MSG_RESULT($have_sys_sdt_h)
> > +
> > + # Check if TFmode long double should be used by default or not.
> > + # Some glibc targets used DFmode long double, but with glibc 2.4
> > +diff --git a/libstdc++-v3/configure b/libstdc++-v3/configure
> > +index 5535bfa2b5a..13d793f5059 100755
> > +--- a/libstdc++-v3/configure
> > ++++ b/libstdc++-v3/configure
> > +@@ -21786,11 +21786,11 @@ ac_compile=3D'$CC -c $CFLAGS $CPPFLAGS conf=
test.$ac_ext >&5'
> > + ac_link=3D'$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conf=
test.$ac_ext $LIBS >&5'
> > + ac_compiler_gnu=3D$ac_cv_c_compiler_gnu
> > +
> > +-  if test $glibcxx_cv_sys_sdt_h =3D yes; then
> > ++#  if test $glibcxx_cv_sys_sdt_h =3D yes; then
> > +
> > +-$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
> > ++#$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
> > +
> > +-  fi
> > ++#  fi
> > +   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $glibcxx_cv_sys_s=
dt_h" >&5
> > + $as_echo "$glibcxx_cv_sys_sdt_h" >&6; }
> > +
> > +diff --git a/libstdc++-v3/configure.ac b/libstdc++-v3/configure.ac
> > +index 0ef96270c9c..afe55a1b215 100644
> > +--- a/libstdc++-v3/configure.ac
> > ++++ b/libstdc++-v3/configure.ac
> > +@@ -230,7 +230,7 @@ GLIBCXX_CHECK_SC_NPROCESSORS_ONLN
> > + GLIBCXX_CHECK_SC_NPROC_ONLN
> > + GLIBCXX_CHECK_PTHREADS_NUM_PROCESSORS_NP
> > + GLIBCXX_CHECK_SYSCTL_HW_NCPU
> > +-GLIBCXX_CHECK_SDT_H
> > ++#GLIBCXX_CHECK_SDT_H
> > +
> > + # Check for available headers.
> > + AC_CHECK_HEADERS([endian.h execinfo.h float.h fp.h ieeefp.h inttypes=
.h \
> > +--
> > +2.21.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0015-=
libtool.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0015-li=
btool.patch
> > new file mode 100644
> > index 0000000..750f8a2
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0015-libtool=
.patch
> > @@ -0,0 +1,42 @@
> > +From 80f2b01b3f917cea08294328c8bbc51dadece4af Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:29:11 +0400
> > +Subject: [PATCH 15/40] libtool
> > +
> > +libstdc++ from gcc-runtime gets created with -rpath=3D/usr/lib/../lib=
 for qemux86-64
> > +when running on am x86_64 build host.
> > +
> > +This patch stops this speading to libdir in the libstdc++.la file wit=
hin libtool.
> > +Arguably, it shouldn't be passing this into libtool in the first plac=
e but
> > +for now this resolves the nastiest problems this causes.
> > +
> > +func_normal_abspath would resolve an empty path to `pwd` so we need
> > +to filter the zero case.
> > +
> > +RP 2012/8/24
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Pending
> > +---
> > + ltmain.sh | 4 ++++
> > + 1 file changed, 4 insertions(+)
> > +
> > +diff --git a/ltmain.sh b/ltmain.sh
> > +index 9503ec85d70..0121fba707f 100644
> > +--- a/ltmain.sh
> > ++++ b/ltmain.sh
> > +@@ -6359,6 +6359,10 @@ func_mode_link ()
> > +     func_warning "ignoring multiple \`-rpath's for a libtool library=
"
> > +
> > +       install_libdir=3D"$1"
> > ++      if test -n "$install_libdir"; then
> > ++    func_normal_abspath "$install_libdir"
> > ++    install_libdir=3D$func_normal_abspath_result
> > ++      fi
> > +
> > +       oldlibs=3D
> > +       if test -z "$rpath"; then
> > +--
> > +2.21.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0016-=
gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch b/meta-arm-toolchai=
n/recipes-devtools/gcc/gcc-arm-8.3/0016-gcc-armv4-pass-fix-v4bx-to-linker-t=
o-support-EABI.patch
> > new file mode 100644
> > index 0000000..9b1b4d4
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0016-gcc-arm=
v4-pass-fix-v4bx-to-linker-to-support-EABI.patch
> > @@ -0,0 +1,43 @@
> > +From a66ec1e382bf869749588f072a4a7c09039f2b3a Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:30:32 +0400
> > +Subject: [PATCH 16/40] gcc: armv4: pass fix-v4bx to linker to support=
 EABI.
> > +
> > +The LINK_SPEC for linux gets overwritten by linux-eabi.h which
> > +means the value of TARGET_FIX_V4BX_SPEC gets lost and as a result
> > +the option is not passed to linker when chosing march=3Darmv4
> > +This patch redefines this in linux-eabi.h and reinserts it
> > +for eabi defaulting toolchains.
> > +
> > +We might want to send it upstream.
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Pending
> > +---
> > + gcc/config/arm/linux-eabi.h | 6 +++++-
> > + 1 file changed, 5 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.=
h
> > +index b3af68cac57..330b6e13c5f 100644
> > +--- a/gcc/config/arm/linux-eabi.h
> > ++++ b/gcc/config/arm/linux-eabi.h
> > +@@ -88,10 +88,14 @@
> > + #define MUSL_DYNAMIC_LINKER \
> > +   "/lib/ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=3Dhard:hf}.=
so.1"
> > +
> > ++/* For armv4 we pass --fix-v4bx to linker to support EABI */
> > ++#undef TARGET_FIX_V4BX_SPEC
> > ++#define TARGET_FIX_V4BX_SPEC "%{mcpu=3Darm8|mcpu=3Darm810|mcpu=3Dstr=
ongarm*|march=3Darmv4: --fix-v4bx}"
> > ++
> > + /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
> > +    use the GNU/Linux version, not the generic BPABI version.  */
> > + #undef  LINK_SPEC
> > +-#define LINK_SPEC EABI_LINK_SPEC                                    =
\
> > ++#define LINK_SPEC TARGET_FIX_V4BX_SPEC EABI_LINK_SPEC               =
        \
> > +   LINUX_OR_ANDROID_LD (LINUX_TARGET_LINK_SPEC,                      =
        \
> > +                    LINUX_TARGET_LINK_SPEC " " ANDROID_LINK_SPEC)
> > +
> > +--
> > +2.21.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0017-=
Use-the-multilib-config-files-from-B-instead-of-usin.patch b/meta-arm-toolc=
hain/recipes-devtools/gcc/gcc-arm-8.3/0017-Use-the-multilib-config-files-fr=
om-B-instead-of-usin.patch
> > new file mode 100644
> > index 0000000..382fecd
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0017-Use-the=
-multilib-config-files-from-B-instead-of-usin.patch
> > @@ -0,0 +1,102 @@
> > +From 624db734f656ad8cdf8b3cf3fc8e860b70c6c251 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:33:04 +0400
> > +Subject: [PATCH 17/40] Use the multilib config files from ${B} instea=
d of
> > + using the ones from ${S}
> > +
> > +Use the multilib config files from ${B} instead of using the ones fro=
m ${S}
> > +so that the source can be shared between gcc-cross-initial,
> > +gcc-cross-intermediate, gcc-cross, gcc-runtime, and also the sdk buil=
d.
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> > +
> > +Upstream-Status: Inappropriate [configuration]
> > +---
> > + gcc/configure    | 22 ++++++++++++++++++----
> > + gcc/configure.ac | 22 ++++++++++++++++++----
> > + 2 files changed, 36 insertions(+), 8 deletions(-)
> > +
> > +diff --git a/gcc/configure b/gcc/configure
> > +index 5111ec0aabb..3d9dcbdc93d 100755
> > +--- a/gcc/configure
> > ++++ b/gcc/configure
> > +@@ -12138,10 +12138,20 @@ done
> > + tmake_file_=3D
> > + for f in ${tmake_file}
> > + do
> > +-    if test -f ${srcdir}/config/$f
> > +-    then
> > +-            tmake_file_=3D"${tmake_file_} \$(srcdir)/config/$f"
> > +-    fi
> > ++  case $f in
> > ++    */t-linux64 )
> > ++       if test -f ./config/$f
> > ++       then
> > ++         tmake_file_=3D"${tmake_file_} ./config/$f"
> > ++       fi
> > ++       ;;
> > ++    * )
> > ++       if test -f ${srcdir}/config/$f
> > ++       then
> > ++         tmake_file_=3D"${tmake_file_} \$(srcdir)/config/$f"
> > ++       fi
> > ++       ;;
> > ++  esac
> > + done
> > + tmake_file=3D"${tmake_file_}"
> > +
> > +@@ -12152,6 +12162,10 @@ tm_file_list=3D"options.h"
> > + tm_include_list=3D"options.h insn-constants.h"
> > + for f in $tm_file; do
> > +   case $f in
> > ++    */linux64.h )
> > ++       tm_file_list=3D"${tm_file_list} ./config/$f"
> > ++       tm_include_list=3D"${tm_include_list} ./config/$f"
> > ++       ;;
> > +     ./* )
> > +        f=3D`echo $f | sed 's/^..//'`
> > +        tm_file_list=3D"${tm_file_list} $f"
> > +diff --git a/gcc/configure.ac b/gcc/configure.ac
> > +index 3e09af916fd..e09c840b605 100644
> > +--- a/gcc/configure.ac
> > ++++ b/gcc/configure.ac
> > +@@ -1902,10 +1902,20 @@ done
> > + tmake_file_=3D
> > + for f in ${tmake_file}
> > + do
> > +-    if test -f ${srcdir}/config/$f
> > +-    then
> > +-            tmake_file_=3D"${tmake_file_} \$(srcdir)/config/$f"
> > +-    fi
> > ++  case $f in
> > ++    */t-linux64 )
> > ++       if test -f ./config/$f
> > ++       then
> > ++         tmake_file_=3D"${tmake_file_} ./config/$f"
> > ++       fi
> > ++       ;;
> > ++    * )
> > ++       if test -f ${srcdir}/config/$f
> > ++       then
> > ++         tmake_file_=3D"${tmake_file_} \$(srcdir)/config/$f"
> > ++       fi
> > ++       ;;
> > ++  esac
> > + done
> > + tmake_file=3D"${tmake_file_}"
> > +
> > +@@ -1916,6 +1926,10 @@ tm_file_list=3D"options.h"
> > + tm_include_list=3D"options.h insn-constants.h"
> > + for f in $tm_file; do
> > +   case $f in
> > ++    */linux64.h )
> > ++       tm_file_list=3D"${tm_file_list} ./config/$f"
> > ++       tm_include_list=3D"${tm_include_list} ./config/$f"
> > ++       ;;
> > +     ./* )
> > +        f=3D`echo $f | sed 's/^..//'`
> > +        tm_file_list=3D"${tm_file_list} $f"
> > +--
> > +2.21.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0018-=
Avoid-using-libdir-from-.la-which-usually-points-to-.patch b/meta-arm-toolc=
hain/recipes-devtools/gcc/gcc-arm-8.3/0018-Avoid-using-libdir-from-.la-whic=
h-usually-points-to-.patch
> > new file mode 100644
> > index 0000000..20e77d6
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0018-Avoid-u=
sing-libdir-from-.la-which-usually-points-to-.patch
> > @@ -0,0 +1,31 @@
> > +From 27cca95dcfeead8c52d292c4824ee96f178d6183 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 20 Feb 2015 09:39:38 +0000
> > +Subject: [PATCH 18/40] Avoid using libdir from .la which usually poin=
ts to a
> > + host path
> > +
> > +Upstream-Status: Inappropriate [embedded specific]
> > +
> > +Signed-off-by: Jonathan Liu <net147@gmail.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + ltmain.sh | 3 +++
> > + 1 file changed, 3 insertions(+)
> > +
> > +diff --git a/ltmain.sh b/ltmain.sh
> > +index 0121fba707f..52bdbdb5f9c 100644
> > +--- a/ltmain.sh
> > ++++ b/ltmain.sh
> > +@@ -5628,6 +5628,9 @@ func_mode_link ()
> > +         absdir=3D"$abs_ladir"
> > +         libdir=3D"$abs_ladir"
> > +       else
> > ++        # Instead of using libdir from .la which usually points to a=
 host path,
> > ++        # use the path the .la is contained in.
> > ++        libdir=3D"$abs_ladir"
> > +         dir=3D"$libdir"
> > +         absdir=3D"$libdir"
> > +       fi
> > +--
> > +2.21.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0019-=
export-CPP.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0019=
-export-CPP.patch
> > new file mode 100644
> > index 0000000..140c67a
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0019-export-=
CPP.patch
> > @@ -0,0 +1,53 @@
> > +From a2936382da81aefa9b69c1fc625f6c706b7ea1d8 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 20 Feb 2015 09:40:59 +0000
> > +Subject: [PATCH 19/40] export CPP
> > +
> > +The OE environment sets and exports CPP as being the target gcc. When
> > +building gcc-cross-canadian for a mingw targetted sdk, the following =
can be found
> > +in build.x86_64-pokysdk-mingw32.i586-poky-linux/build-x86_64-linux/li=
biberty/config.log:
> > +
> > +configure:3641: checking for _FILE_OFFSET_BITS value needed for large=
 files
> > +configure:3666: gcc  -c -isystem/media/build1/poky/build/tmp/sysroots=
/x86_64-linux/usr/include -O2 -pipe  conftest.c >&5
> > +configure:3666: $? =3D 0
> > +configure:3698: result: no
> > +configure:3786: checking how to run the C preprocessor
> > +configure:3856: result: x86_64-pokysdk-mingw32-gcc -E --sysroot=3D/me=
dia/build1/poky/build/tmp/sysroots/x86_64-nativesdk-mingw32-pokysdk-mingw32
> > +configure:3876: x86_64-pokysdk-mingw32-gcc -E --sysroot=3D/media/buil=
d1/poky/build/tmp/sysroots/x86_64-nativesdk-mingw32-pokysdk-mingw32 conftes=
t.c
> > +configure:3876: $? =3D 0
> > +
> > +Note this is a *build* target (in build-x86_64-linux) so it should be
> > +using the host "gcc", not x86_64-pokysdk-mingw32-gcc. Since the mingw=
32
> > +headers are very different, using the wrong cpp is a real problem. It=
 is leaking
> > +into configure through the CPP variable. Ultimately this leads to bui=
ld
> > +failures related to not being able to include a process.h file for pe=
m-unix.c.
> > +
> > +The fix is to ensure we export a sane CPP value into the build
> > +environment when using build targets. We could define a CPP_FOR_BUILD=
 value which may be
> > +the version which needs to be upstreamed but for now, this fix is goo=
d enough to
> > +avoid the problem.
> > +
> > +RP 22/08/2013
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + Makefile.in | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/Makefile.in b/Makefile.in
> > +index 38774f542a6..b426d4f9350 100644
> > +--- a/Makefile.in
> > ++++ b/Makefile.in
> > +@@ -149,6 +149,7 @@ BUILD_EXPORTS =3D \
> > +     AR=3D"$(AR_FOR_BUILD)"; export AR; \
> > +     AS=3D"$(AS_FOR_BUILD)"; export AS; \
> > +     CC=3D"$(CC_FOR_BUILD)"; export CC; \
> > ++    CPP=3D"$(CC_FOR_BUILD) -E"; export CPP; \
> > +     CFLAGS=3D"$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
> > +     CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> > +     CXX=3D"$(CXX_FOR_BUILD)"; export CXX; \
> > +--
> > +2.21.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0020-=
Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch b/meta-arm-toolc=
hain/recipes-devtools/gcc/gcc-arm-8.3/0020-Disable-the-MULTILIB_OSDIRNAMES-=
and-other-multilib-o.patch
> > new file mode 100644
> > index 0000000..b22557e
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0020-Disable=
-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
> > @@ -0,0 +1,42 @@
> > +From d4326ab74a362b0fc83ed866f82c359389a36adc Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 20 Feb 2015 10:21:55 +0000
> > +Subject: [PATCH 20/40] Disable the MULTILIB_OSDIRNAMES and other mult=
ilib
> > + options.
> > +
> > +Hard coding the MULTILIB_OSDIRNAMES with ../lib64 is causing problems=
 on
> > +systems where the libdir is NOT set to /lib64.  This is allowed by th=
e
> > +ABI, as
> > +long as the dynamic loader is present in /lib.
> > +
> > +We simply want to use the default rules in gcc to find and configure =
the
> > +normal libdir.
> > +
> > +Upstream-Status: Inappropriate[OE-Specific]
> > +
> > +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + gcc/config/aarch64/t-aarch64-linux | 8 ++++----
> > + 1 file changed, 4 insertions(+), 4 deletions(-)
> > +
> > +diff --git a/gcc/config/aarch64/t-aarch64-linux b/gcc/config/aarch64/=
t-aarch64-linux
> > +index b9897785a89..7d06f0d0edb 100644
> > +--- a/gcc/config/aarch64/t-aarch64-linux
> > ++++ b/gcc/config/aarch64/t-aarch64-linux
> > +@@ -21,8 +21,8 @@
> > + LIB1ASMSRC   =3D aarch64/lib1funcs.asm
> > + LIB1ASMFUNCS =3D _aarch64_sync_cache_range
> > +
> > +-AARCH_BE =3D $(if $(findstring TARGET_BIG_ENDIAN_DEFAULT=3D1, $(tm_d=
efines)),_be)
> > +-MULTILIB_OSDIRNAMES =3D mabi.lp64=3D../lib64$(call if_multiarch,:aar=
ch64$(AARCH_BE)-linux-gnu)
> > +-MULTIARCH_DIRNAME =3D $(call if_multiarch,aarch64$(AARCH_BE)-linux-g=
nu)
> > ++#AARCH_BE =3D $(if $(findstring TARGET_BIG_ENDIAN_DEFAULT=3D1, $(tm_=
defines)),_be)
> > ++#MULTILIB_OSDIRNAMES =3D mabi.lp64=3D../lib64$(call if_multiarch,:aa=
rch64$(AARCH_BE)-linux-gnu)
> > ++#MULTIARCH_DIRNAME =3D $(call if_multiarch,aarch64$(AARCH_BE)-linux-=
gnu)
> > +
> > +-MULTILIB_OSDIRNAMES +=3D mabi.ilp32=3D../libilp32$(call if_multiarch=
,:aarch64$(AARCH_BE)-linux-gnu_ilp32)
> > ++#MULTILIB_OSDIRNAMES +=3D mabi.ilp32=3D../libilp32$(call if_multiarc=
h,:aarch64$(AARCH_BE)-linux-gnu_ilp32)
> > +--
> > +2.21.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0021-=
Ensure-target-gcc-headers-can-be-included.patch b/meta-arm-toolchain/recipe=
s-devtools/gcc/gcc-arm-8.3/0021-Ensure-target-gcc-headers-can-be-included.p=
atch
> > new file mode 100644
> > index 0000000..60d7269
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0021-Ensure-=
target-gcc-headers-can-be-included.patch
> > @@ -0,0 +1,98 @@
> > +From 476eda9054df443d094273c8b61fce63d940adfc Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 20 Feb 2015 10:25:11 +0000
> > +Subject: [PATCH 21/40] Ensure target gcc headers can be included
> > +
> > +There are a few headers installed as part of the OpenEmbedded
> > +gcc-runtime target (omp.h, ssp/*.h). Being installed from a recipe
> > +built for the target architecture, these are within the target
> > +sysroot and not cross/nativesdk; thus they weren't able to be
> > +found by gcc with the existing search paths. Add support for
> > +picking up these headers under the sysroot supplied on the gcc
> > +command line in order to resolve this.
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + gcc/Makefile.in  | 2 ++
> > + gcc/cppdefault.c | 4 ++++
> > + gcc/defaults.h   | 9 +++++++++
> > + gcc/gcc.c        | 7 -------
> > + 4 files changed, 15 insertions(+), 7 deletions(-)
> > +
> > +diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> > +index 71a8275c39f..5ae693fb06c 100644
> > +--- a/gcc/Makefile.in
> > ++++ b/gcc/Makefile.in
> > +@@ -614,6 +614,7 @@ libexecdir =3D @libexecdir@
> > +
> > + # Directory in which the compiler finds libraries etc.
> > + libsubdir =3D $(libdir)/gcc/$(real_target_noncanonical)/$(version)$(=
accel_dir_suffix)
> > ++libsubdir_target =3D gcc/$(target_noncanonical)/$(version)
> > + # Directory in which the compiler finds executables
> > + libexecsubdir =3D $(libexecdir)/gcc/$(real_target_noncanonical)/$(ve=
rsion)$(accel_dir_suffix)
> > + # Directory in which all plugin resources are installed
> > +@@ -2870,6 +2871,7 @@ CFLAGS-intl.o +=3D -DLOCALEDIR=3D\"$(localedir)=
\"
> > +
> > + PREPROCESSOR_DEFINES =3D \
> > +   -DGCC_INCLUDE_DIR=3D\"$(libsubdir)/include\" \
> > ++  -DGCC_INCLUDE_SUBDIR_TARGET=3D\"$(libsubdir_target)/include\" \
> > +   -DFIXED_INCLUDE_DIR=3D\"$(libsubdir)/include-fixed\" \
> > +   -DGPLUSPLUS_INCLUDE_DIR=3D\"$(gcc_gxx_include_dir)\" \
> > +   -DGPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT=3D$(gcc_gxx_include_dir_add_sy=
sroot) \
> > +diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
> > +index b36a979d5ba..e2e187dedaf 100644
> > +--- a/gcc/cppdefault.c
> > ++++ b/gcc/cppdefault.c
> > +@@ -59,6 +59,10 @@ const struct default_include cpp_include_defaults[=
]
> > +     /* This is the dir for gcc's private headers.  */
> > +     { GCC_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
> > + #endif
> > ++#ifdef GCC_INCLUDE_SUBDIR_TARGET
> > ++    /* This is the dir for gcc's private headers under the specified=
 sysroot.  */
> > ++    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC", =
0, 0, 1, 0 },
> > ++#endif
> > + #ifdef LOCAL_INCLUDE_DIR
> > +     /* /usr/local/include comes before the fixincluded header files.=
  */
> > +     { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },
> > +diff --git a/gcc/defaults.h b/gcc/defaults.h
> > +index 9035b333be8..5982bbda61d 100644
> > +--- a/gcc/defaults.h
> > ++++ b/gcc/defaults.h
> > +@@ -1455,4 +1455,13 @@ see the files COPYING3 and COPYING.RUNTIME res=
pectively.  If not, see
> > + #define DWARF_GNAT_ENCODINGS_DEFAULT DWARF_GNAT_ENCODINGS_GDB
> > + #endif
> > +
> > ++/* Default prefixes to attach to command names.  */
> > ++
> > ++#ifndef STANDARD_STARTFILE_PREFIX_1
> > ++#define STANDARD_STARTFILE_PREFIX_1 "/lib/"
> > ++#endif
> > ++#ifndef STANDARD_STARTFILE_PREFIX_2
> > ++#define STANDARD_STARTFILE_PREFIX_2 "/usr/lib/"
> > ++#endif
> > ++
> > + #endif  /* ! GCC_DEFAULTS_H */
> > +diff --git a/gcc/gcc.c b/gcc/gcc.c
> > +index 570cdc00034..3fb64d453f1 100644
> > +--- a/gcc/gcc.c
> > ++++ b/gcc/gcc.c
> > +@@ -1464,13 +1464,6 @@ static const char *gcc_libexec_prefix;
> > +
> > + /* Default prefixes to attach to command names.  */
> > +
> > +-#ifndef STANDARD_STARTFILE_PREFIX_1
> > +-#define STANDARD_STARTFILE_PREFIX_1 "/lib/"
> > +-#endif
> > +-#ifndef STANDARD_STARTFILE_PREFIX_2
> > +-#define STANDARD_STARTFILE_PREFIX_2 "/usr/lib/"
> > +-#endif
> > +-
> > + #ifdef CROSS_DIRECTORY_STRUCTURE  /* Don't use these prefixes for a =
cross compiler.  */
> > + #undef MD_EXEC_PREFIX
> > + #undef MD_STARTFILE_PREFIX
> > +--
> > +2.21.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0022-=
gcc-4.8-won-t-build-with-disable-dependency-tracking.patch b/meta-arm-toolc=
hain/recipes-devtools/gcc/gcc-arm-8.3/0022-gcc-4.8-won-t-build-with-disable=
-dependency-tracking.patch
> > new file mode 100644
> > index 0000000..6f0d3f1
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0022-gcc-4.8=
-won-t-build-with-disable-dependency-tracking.patch
> > @@ -0,0 +1,54 @@
> > +From bc192f0a07ad819dee93446c5ef6895d9550d92d Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 20 Feb 2015 11:17:19 +0000
> > +Subject: [PATCH 22/40] gcc 4.8+ won't build with --disable-dependency=
-tracking
> > +
> > +since the *.Ppo files don't get created unless --enable-dependency-tr=
acking is true.
> > +
> > +This patch ensures we only use those compiler options when its enable=
d.
> > +
> > +Upstream-Status: Submitted
> > +
> > +(Problem was already reported upstream, attached this patch there
> > +http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D55930)
> > +
> > +RP
> > +2012/09/22
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + libatomic/Makefile.am | 3 ++-
> > + libatomic/Makefile.in | 3 ++-
> > + 2 files changed, 4 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/libatomic/Makefile.am b/libatomic/Makefile.am
> > +index 803b292cce5..b47842eb590 100644
> > +--- a/libatomic/Makefile.am
> > ++++ b/libatomic/Makefile.am
> > +@@ -101,7 +101,8 @@ PAT_S            =3D $(word 3,$(PAT_SPLIT))
> > + IFUNC_DEF   =3D -DIFUNC_ALT=3D$(PAT_S)
> > + IFUNC_OPT   =3D $(word $(PAT_S),$(IFUNC_OPTIONS))
> > +
> > +-M_DEPS              =3D -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
> > ++@AMDEP_TRUE@M_DEPS          =3D -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).P=
po
> > ++@AMDEP_FALSE@M_DEPS         =3D
> > + M_SIZE              =3D -DN=3D$(PAT_N)
> > + M_IFUNC             =3D $(if $(PAT_S),$(IFUNC_DEF) $(IFUNC_OPT))
> > + M_FILE              =3D $(PAT_BASE)_n.c
> > +diff --git a/libatomic/Makefile.in b/libatomic/Makefile.in
> > +index c8f38be5835..4fab7cec3ea 100644
> > +--- a/libatomic/Makefile.in
> > ++++ b/libatomic/Makefile.in
> > +@@ -335,7 +335,8 @@ PAT_N =3D $(word 2,$(PAT_SPLIT))
> > + PAT_S =3D $(word 3,$(PAT_SPLIT))
> > + IFUNC_DEF =3D -DIFUNC_ALT=3D$(PAT_S)
> > + IFUNC_OPT =3D $(word $(PAT_S),$(IFUNC_OPTIONS))
> > +-M_DEPS =3D -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
> > ++@AMDEP_TRUE@M_DEPS =3D -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
> > ++@AMDEP_FALSE@M_DEPS =3D
> > + M_SIZE =3D -DN=3D$(PAT_N)
> > + M_IFUNC =3D $(if $(PAT_S),$(IFUNC_DEF) $(IFUNC_OPT))
> > + M_FILE =3D $(PAT_BASE)_n.c
> > +--
> > +2.21.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0023-=
Don-t-search-host-directory-during-relink-if-inst_pr.patch b/meta-arm-toolc=
hain/recipes-devtools/gcc/gcc-arm-8.3/0023-Don-t-search-host-directory-duri=
ng-relink-if-inst_pr.patch
> > new file mode 100644
> > index 0000000..fe3f343
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0023-Don-t-s=
earch-host-directory-during-relink-if-inst_pr.patch
> > @@ -0,0 +1,38 @@
> > +From 0409d2dd7322ecbed731cbe29b034fea43c5dddc Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Tue, 3 Mar 2015 08:21:19 +0000
> > +Subject: [PATCH 23/40] Don't search host directory during "relink" if
> > + $inst_prefix is provided
> > +
> > +http://lists.gnu.org/archive/html/libtool-patches/2011-01/msg00026.ht=
ml
> > +
> > +Upstream-Status: Submitted
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + ltmain.sh | 5 +++--
> > + 1 file changed, 3 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/ltmain.sh b/ltmain.sh
> > +index 52bdbdb5f9c..82bcec39f05 100644
> > +--- a/ltmain.sh
> > ++++ b/ltmain.sh
> > +@@ -6004,12 +6004,13 @@ func_mode_link ()
> > +           fi
> > +         else
> > +           # We cannot seem to hardcode it, guess we'll fake it.
> > ++          # Default if $libdir is not relative to the prefix:
> > +           add_dir=3D"-L$libdir"
> > +-          # Try looking first in the location we're being installed =
to.
> > ++
> > +           if test -n "$inst_prefix_dir"; then
> > +             case $libdir in
> > +               [\\/]*)
> > +-                add_dir=3D"$add_dir -L$inst_prefix_dir$libdir"
> > ++                add_dir=3D"-L$inst_prefix_dir$libdir"
> > +                 ;;
> > +             esac
> > +           fi
> > +--
> > +2.21.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0024-=
Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch b/meta-arm-toolc=
hain/recipes-devtools/gcc/gcc-arm-8.3/0024-Use-SYSTEMLIBS_DIR-replacement-i=
nstead-of-hardcoding.patch
> > new file mode 100644
> > index 0000000..c388a0a
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0024-Use-SYS=
TEMLIBS_DIR-replacement-instead-of-hardcoding.patch
> > @@ -0,0 +1,28 @@
> > +From 56e2e1fc2a27c4a5cc9b471d5d0af90bcb871bfa Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Tue, 28 Apr 2015 23:15:27 -0700
> > +Subject: [PATCH 24/40] Use SYSTEMLIBS_DIR replacement instead of hard=
coding base_libdir
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + gcc/config/aarch64/aarch64-linux.h | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/=
aarch64-linux.h
> > +index bf1327e98cc..64436183bc8 100644
> > +--- a/gcc/config/aarch64/aarch64-linux.h
> > ++++ b/gcc/config/aarch64/aarch64-linux.h
> > +@@ -21,7 +21,7 @@
> > + #ifndef GCC_AARCH64_LINUX_H
> > + #define GCC_AARCH64_LINUX_H
> > +
> > +-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-aarch64%{mbig-endian:_be=
}%{mabi=3Dilp32:_ilp32}.so.1"
> > ++#define GLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-linux-aarch64%{mbig=
-endian:_be}%{mabi=3Dilp32:_ilp32}.so.1"
> > +
> > + #undef MUSL_DYNAMIC_LINKER
> > + #define MUSL_DYNAMIC_LINKER "/lib/ld-musl-aarch64%{mbig-endian:_be}%=
{mabi=3Dilp32:_ilp32}.so.1"
> > +--
> > +2.21.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0025-=
aarch64-Add-support-for-musl-ldso.patch b/meta-arm-toolchain/recipes-devtoo=
ls/gcc/gcc-arm-8.3/0025-aarch64-Add-support-for-musl-ldso.patch
> > new file mode 100644
> > index 0000000..03f9725
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0025-aarch64=
-Add-support-for-musl-ldso.patch
> > @@ -0,0 +1,28 @@
> > +From b142e77e44e1acece6da54ccdc24c4da89cf4b99 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Tue, 28 Apr 2015 23:18:39 -0700
> > +Subject: [PATCH 25/40] aarch64: Add support for musl ldso
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + gcc/config/aarch64/aarch64-linux.h | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/=
aarch64-linux.h
> > +index 64436183bc8..ba156676026 100644
> > +--- a/gcc/config/aarch64/aarch64-linux.h
> > ++++ b/gcc/config/aarch64/aarch64-linux.h
> > +@@ -24,7 +24,7 @@
> > + #define GLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-linux-aarch64%{mbig=
-endian:_be}%{mabi=3Dilp32:_ilp32}.so.1"
> > +
> > + #undef MUSL_DYNAMIC_LINKER
> > +-#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-aarch64%{mbig-endian:_be}%=
{mabi=3Dilp32:_ilp32}.so.1"
> > ++#define MUSL_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-musl-aarch64%{mbig-e=
ndian:_be}%{mabi=3Dilp32:_ilp32}.so.1"
> > +
> > + #undef  ASAN_CC1_SPEC
> > + #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
> > +--
> > +2.21.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0026-=
libcc1-fix-libcc1-s-install-path-and-rpath.patch b/meta-arm-toolchain/recip=
es-devtools/gcc/gcc-arm-8.3/0026-libcc1-fix-libcc1-s-install-path-and-rpath=
.patch
> > new file mode 100644
> > index 0000000..8591738
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0026-libcc1-=
fix-libcc1-s-install-path-and-rpath.patch
> > @@ -0,0 +1,54 @@
> > +From 3d4e53fc7cd71ce1181af8a5e9655398857af741 Mon Sep 17 00:00:00 200=
1
> > +From: Robert Yang <liezhi.yang@windriver.com>
> > +Date: Sun, 5 Jul 2015 20:25:18 -0700
> > +Subject: [PATCH 26/40] libcc1: fix libcc1's install path and rpath
> > +
> > +* Install libcc1.so and libcc1plugin.so into
> > +  $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_version), as what we
> > +  had done to lto-plugin.
> > +* Fix bad RPATH iussue:
> > +  gcc-5.2.0: package gcc-plugins contains bad RPATH /patht/to/tmp/sys=
roots/qemux86-64/usr/lib64/../lib64 in file
> > + /path/to/gcc/5.2.0-r0/packages-split/gcc-plugins/usr/lib64/gcc/x86_6=
4-poky-linux/5.2.0/plugin/libcc1plugin.so.0.0.0
> > + [rpaths]
> > +
> > +Upstream-Status: Inappropriate [OE configuration]
> > +
> > +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > +---
> > + libcc1/Makefile.am | 4 ++--
> > + libcc1/Makefile.in | 4 ++--
> > + 2 files changed, 4 insertions(+), 4 deletions(-)
> > +
> > +diff --git a/libcc1/Makefile.am b/libcc1/Makefile.am
> > +index 6ecb66b4365..634cce3c2a9 100644
> > +--- a/libcc1/Makefile.am
> > ++++ b/libcc1/Makefile.am
> > +@@ -37,8 +37,8 @@ libiberty =3D $(if $(wildcard $(libiberty_noasan)),=
$(Wc)$(libiberty_noasan), \
> > +         $(Wc)$(libiberty_normal)))
> > + libiberty_dep =3D $(patsubst $(Wc)%,%,$(libiberty))
> > +
> > +-plugindir =3D $(libdir)/gcc/$(target_noncanonical)/$(gcc_version)/pl=
ugin
> > +-cc1libdir =3D $(libdir)/$(libsuffix)
> > ++cc1libdir =3D $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_version=
)
> > ++plugindir =3D $(cc1libdir)
> > +
> > + if ENABLE_PLUGIN
> > + plugin_LTLIBRARIES =3D libcc1plugin.la libcp1plugin.la
> > +diff --git a/libcc1/Makefile.in b/libcc1/Makefile.in
> > +index 47be10025ad..8d5481d87bd 100644
> > +--- a/libcc1/Makefile.in
> > ++++ b/libcc1/Makefile.in
> > +@@ -303,8 +303,8 @@ libiberty =3D $(if $(wildcard $(libiberty_noasan)=
),$(Wc)$(libiberty_noasan), \
> > +         $(Wc)$(libiberty_normal)))
> > +
> > + libiberty_dep =3D $(patsubst $(Wc)%,%,$(libiberty))
> > +-plugindir =3D $(libdir)/gcc/$(target_noncanonical)/$(gcc_version)/pl=
ugin
> > +-cc1libdir =3D $(libdir)/$(libsuffix)
> > ++cc1libdir =3D $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_version=
)
> > ++plugindir =3D $(cc1libdir)
> > + @ENABLE_PLUGIN_TRUE@plugin_LTLIBRARIES =3D libcc1plugin.la libcp1plu=
gin.la
> > + @ENABLE_PLUGIN_TRUE@cc1lib_LTLIBRARIES =3D libcc1.la
> > + shared_source =3D callbacks.cc callbacks.hh connection.cc connection=
.hh \
> > +--
> > +2.21.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0027-=
handle-sysroot-support-for-nativesdk-gcc.patch b/meta-arm-toolchain/recipes=
-devtools/gcc/gcc-arm-8.3/0027-handle-sysroot-support-for-nativesdk-gcc.pat=
ch
> > new file mode 100644
> > index 0000000..4b955de
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0027-handle-=
sysroot-support-for-nativesdk-gcc.patch
> > @@ -0,0 +1,213 @@
> > +From c033c1df11b692213d03db91d6cc145b4adedfac Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Mon, 7 Dec 2015 23:39:54 +0000
> > +Subject: [PATCH 27/40] handle sysroot support for nativesdk-gcc
> > +
> > +Being able to build a nativesdk gcc is useful, particularly in cases
> > +where the host compiler may be of an incompatible version (or a 32
> > +bit compiler is needed).
> > +
> > +Sadly, building nativesdk-gcc is not straight forward. We install
> > +nativesdk-gcc into a relocatable location and this means that its
> > +library locations can change. "Normal" sysroot support doesn't help
> > +in this case since the values of paths like "libdir" change, not just
> > +base root directory of the system.
> > +
> > +In order to handle this we do two things:
> > +
> > +a) Add %r into spec file markup which can be used for injected paths
> > +   such as SYSTEMLIBS_DIR (see gcc_multilib_setup()).
> > +b) Add other paths which need relocation into a .gccrelocprefix secti=
on
> > +   which the relocation code will notice and adjust automatically.
> > +
> > +Upstream-Status: Inappropriate
> > +RP 2015/7/28
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + gcc/cppdefault.c | 50 +++++++++++++++++++++++++++++++++++-----------=
--
> > + gcc/cppdefault.h |  3 ++-
> > + gcc/gcc.c        | 20 +++++++++++++------
> > + 3 files changed, 53 insertions(+), 20 deletions(-)
> > +
> > +diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
> > +index e2e187dedaf..2faba2b1d63 100644
> > +--- a/gcc/cppdefault.c
> > ++++ b/gcc/cppdefault.c
> > +@@ -35,6 +35,30 @@
> > + # undef CROSS_INCLUDE_DIR
> > + #endif
> > +
> > ++static char GPLUSPLUS_INCLUDE_DIRVAR[4096] __attribute__ ((section (=
".gccrelocprefix"))) =3D GPLUSPLUS_INCLUDE_DIR;
> > ++static char GCC_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccr=
elocprefix"))) =3D GCC_INCLUDE_DIR;
> > ++static char GPLUSPLUS_TOOL_INCLUDE_DIRVAR[4096] __attribute__ ((sect=
ion (".gccrelocprefix"))) =3D GPLUSPLUS_TOOL_INCLUDE_DIR;
> > ++static char GPLUSPLUS_BACKWARD_INCLUDE_DIRVAR[4096] __attribute__ ((=
section (".gccrelocprefix"))) =3D GPLUSPLUS_BACKWARD_INCLUDE_DIR;
> > ++static char STANDARD_STARTFILE_PREFIX_2VAR[4096] __attribute__ ((sec=
tion (".gccrelocprefix"))) =3D STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBD=
IR_TARGET;
> > ++#ifdef LOCAL_INCLUDE_DIR
> > ++static char LOCAL_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gc=
crelocprefix"))) =3D LOCAL_INCLUDE_DIR;
> > ++#endif
> > ++#ifdef PREFIX_INCLUDE_DIR
> > ++static char PREFIX_INCLUDE_DIRVAR[4096] __attribute__ ((section (".g=
ccrelocprefix"))) =3D PREFIX_INCLUDE_DIR;
> > ++#endif
> > ++#ifdef FIXED_INCLUDE_DIR
> > ++static char FIXED_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gc=
crelocprefix"))) =3D FIXED_INCLUDE_DIR;
> > ++#endif
> > ++#ifdef CROSS_INCLUDE_DIR
> > ++static char CROSS_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gc=
crelocprefix"))) =3D CROSS_INCLUDE_DIR;
> > ++#endif
> > ++#ifdef TOOL_INCLUDE_DIR
> > ++static char TOOL_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gcc=
relocprefix"))) =3D TOOL_INCLUDE_DIR;
> > ++#endif
> > ++#ifdef NATIVE_SYSTEM_HEADER_DIR
> > ++static char NATIVE_SYSTEM_HEADER_DIRVAR[4096] __attribute__ ((sectio=
n (".gccrelocprefix"))) =3D NATIVE_SYSTEM_HEADER_DIR;
> > ++#endif
> > ++
> > + const struct default_include cpp_include_defaults[]
> > + #ifdef INCLUDE_DEFAULTS
> > + =3D INCLUDE_DEFAULTS;
> > +@@ -42,38 +66,38 @@ const struct default_include cpp_include_defaults=
[]
> > + =3D {
> > + #ifdef GPLUSPLUS_INCLUDE_DIR
> > +     /* Pick up GNU C++ generic include files.  */
> > +-    { GPLUSPLUS_INCLUDE_DIR, "G++", 1, 1,
> > ++    { GPLUSPLUS_INCLUDE_DIRVAR, "G++", 1, 1,
> > +       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
> > + #endif
> > + #ifdef GPLUSPLUS_TOOL_INCLUDE_DIR
> > +     /* Pick up GNU C++ target-dependent include files.  */
> > +-    { GPLUSPLUS_TOOL_INCLUDE_DIR, "G++", 1, 1,
> > ++    { GPLUSPLUS_TOOL_INCLUDE_DIRVAR, "G++", 1, 1,
> > +       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 1 },
> > + #endif
> > + #ifdef GPLUSPLUS_BACKWARD_INCLUDE_DIR
> > +     /* Pick up GNU C++ backward and deprecated include files.  */
> > +-    { GPLUSPLUS_BACKWARD_INCLUDE_DIR, "G++", 1, 1,
> > ++    { GPLUSPLUS_BACKWARD_INCLUDE_DIRVAR, "G++", 1, 1,
> > +       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
> > + #endif
> > + #ifdef GCC_INCLUDE_DIR
> > +     /* This is the dir for gcc's private headers.  */
> > +-    { GCC_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
> > ++    { GCC_INCLUDE_DIRVAR, "GCC", 0, 0, 0, 0 },
> > + #endif
> > + #ifdef GCC_INCLUDE_SUBDIR_TARGET
> > +     /* This is the dir for gcc's private headers under the specified=
 sysroot.  */
> > +-    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC", =
0, 0, 1, 0 },
> > ++    { STANDARD_STARTFILE_PREFIX_2VAR, "GCC", 0, 0, 1, 0 },
> > + #endif
> > + #ifdef LOCAL_INCLUDE_DIR
> > +     /* /usr/local/include comes before the fixincluded header files.=
  */
> > +-    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },
> > +-    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 0 },
> > ++    { LOCAL_INCLUDE_DIRVAR, 0, 0, 1, 1, 2 },
> > ++    { LOCAL_INCLUDE_DIRVAR, 0, 0, 1, 1, 0 },
> > + #endif
> > + #ifdef PREFIX_INCLUDE_DIR
> > +-    { PREFIX_INCLUDE_DIR, 0, 0, 1, 0, 0 },
> > ++    { PREFIX_INCLUDE_DIRVAR, 0, 0, 1, 0, 0 },
> > + #endif
> > + #ifdef FIXED_INCLUDE_DIR
> > +     /* This is the dir for fixincludes.  */
> > +-    { FIXED_INCLUDE_DIR, "GCC", 0, 0, 0,
> > ++    { FIXED_INCLUDE_DIRVAR, "GCC", 0, 0, 0,
> > +       /* A multilib suffix needs adding if different multilibs use
> > +      different headers.  */
> > + #ifdef SYSROOT_HEADERS_SUFFIX_SPEC
> > +@@ -85,16 +109,16 @@ const struct default_include cpp_include_default=
s[]
> > + #endif
> > + #ifdef CROSS_INCLUDE_DIR
> > +     /* One place the target system's headers might be.  */
> > +-    { CROSS_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
> > ++    { CROSS_INCLUDE_DIRVAR, "GCC", 0, 0, 0, 0 },
> > + #endif
> > + #ifdef TOOL_INCLUDE_DIR
> > +     /* Another place the target system's headers might be.  */
> > +-    { TOOL_INCLUDE_DIR, "BINUTILS", 0, 1, 0, 0 },
> > ++    { TOOL_INCLUDE_DIRVAR, "BINUTILS", 0, 1, 0, 0 },
> > + #endif
> > + #ifdef NATIVE_SYSTEM_HEADER_DIR
> > +     /* /usr/include comes dead last.  */
> > +-    { NATIVE_SYSTEM_HEADER_DIR, NATIVE_SYSTEM_HEADER_COMPONENT, 0, 0=
, 1, 2 },
> > +-    { NATIVE_SYSTEM_HEADER_DIR, NATIVE_SYSTEM_HEADER_COMPONENT, 0, 0=
, 1, 0 },
> > ++    { NATIVE_SYSTEM_HEADER_DIRVAR, NATIVE_SYSTEM_HEADER_COMPONENT, 0=
, 0, 1, 2 },
> > ++    { NATIVE_SYSTEM_HEADER_DIRVAR, NATIVE_SYSTEM_HEADER_COMPONENT, 0=
, 0, 1, 0 },
> > + #endif
> > +     { 0, 0, 0, 0, 0, 0 }
> > +   };
> > +diff --git a/gcc/cppdefault.h b/gcc/cppdefault.h
> > +index 4a0186d1cf2..29e5d9da0dc 100644
> > +--- a/gcc/cppdefault.h
> > ++++ b/gcc/cppdefault.h
> > +@@ -33,7 +33,8 @@
> > +
> > + struct default_include
> > + {
> > +-  const char *const fname;  /* The name of the directory.  */
> > ++  const char *fname;     /* The name of the directory.  */
> > ++
> > +   const char *const component;      /* The component containing the =
directory
> > +                                (see update_path in prefix.c) */
> > +   const char cplusplus;             /* Only look here if we're compi=
ling C++.  */
> > +diff --git a/gcc/gcc.c b/gcc/gcc.c
> > +index 3fb64d453f1..cd0c7fbe961 100644
> > +--- a/gcc/gcc.c
> > ++++ b/gcc/gcc.c
> > +@@ -248,6 +248,8 @@ FILE *report_times_to_file =3D NULL;
> > + #endif
> > + static const char *target_system_root =3D DEFAULT_TARGET_SYSTEM_ROOT=
;
> > +
> > ++static char target_relocatable_prefix[4096] __attribute__ ((section =
(".gccrelocprefix"))) =3D SYSTEMLIBS_DIR;
> > ++
> > + /* Nonzero means pass the updated target_system_root to the compiler=
.  */
> > +
> > + static int target_system_root_changed;
> > +@@ -519,6 +521,7 @@ or with constant text in a single argument.
> > +  %G     process LIBGCC_SPEC as a spec.
> > +  %R     Output the concatenation of target_system_root and
> > +         target_sysroot_suffix.
> > ++ %r     Output the base path target_relocatable_prefix
> > +  %S     process STARTFILE_SPEC as a spec.  A capital S is actually u=
sed here.
> > +  %E     process ENDFILE_SPEC as a spec.  A capital E is actually use=
d here.
> > +  %C     process CPP_SPEC as a spec.
> > +@@ -1487,10 +1490,10 @@ static const char *gcc_libexec_prefix;
> > +    gcc_exec_prefix is set because, in that case, we know where the
> > +    compiler has been installed, and use paths relative to that
> > +    location instead.  */
> > +-static const char *const standard_exec_prefix =3D STANDARD_EXEC_PREF=
IX;
> > +-static const char *const standard_libexec_prefix =3D STANDARD_LIBEXE=
C_PREFIX;
> > +-static const char *const standard_bindir_prefix =3D STANDARD_BINDIR_=
PREFIX;
> > +-static const char *const standard_startfile_prefix =3D STANDARD_STAR=
TFILE_PREFIX;
> > ++static char standard_exec_prefix[4096] __attribute__ ((section (".gc=
crelocprefix"))) =3D STANDARD_EXEC_PREFIX;
> > ++static char standard_libexec_prefix[4096] __attribute__ ((section ("=
.gccrelocprefix"))) =3D STANDARD_LIBEXEC_PREFIX;
> > ++static char standard_bindir_prefix[4096] __attribute__ ((section (".=
gccrelocprefix"))) =3D STANDARD_BINDIR_PREFIX;
> > ++static char *const standard_startfile_prefix =3D STANDARD_STARTFILE_=
PREFIX;
> > +
> > + /* For native compilers, these are well-known paths containing
> > +    components that may be provided by the system.  For cross
> > +@@ -1498,9 +1501,9 @@ static const char *const standard_startfile_pre=
fix =3D STANDARD_STARTFILE_PREFIX;
> > + static const char *md_exec_prefix =3D MD_EXEC_PREFIX;
> > + static const char *md_startfile_prefix =3D MD_STARTFILE_PREFIX;
> > + static const char *md_startfile_prefix_1 =3D MD_STARTFILE_PREFIX_1;
> > +-static const char *const standard_startfile_prefix_1
> > ++static char standard_startfile_prefix_1[4096] __attribute__ ((sectio=
n (".gccrelocprefix")))
> > +   =3D STANDARD_STARTFILE_PREFIX_1;
> > +-static const char *const standard_startfile_prefix_2
> > ++static char standard_startfile_prefix_2[4096] __attribute__ ((sectio=
n (".gccrelocprefix")))
> > +   =3D STANDARD_STARTFILE_PREFIX_2;
> > +
> > + /* A relative path to be used in finding the location of tools
> > +@@ -5849,6 +5852,11 @@ do_spec_1 (const char *spec, int inswitch, con=
st char *soft_matched_part)
> > +           }
> > +         break;
> > +
> > ++          case 'r':
> > ++              obstack_grow (&obstack, target_relocatable_prefix,
> > ++                  strlen (target_relocatable_prefix));
> > ++            break;
> > ++
> > +       case 'S':
> > +         value =3D do_spec_1 (startfile_spec, 0, NULL);
> > +         if (value !=3D 0)
> > +--
> > +2.21.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0028-=
Search-target-sysroot-gcc-version-specific-dirs-with.patch b/meta-arm-toolc=
hain/recipes-devtools/gcc/gcc-arm-8.3/0028-Search-target-sysroot-gcc-versio=
n-specific-dirs-with.patch
> > new file mode 100644
> > index 0000000..1b25d78
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0028-Search-=
target-sysroot-gcc-version-specific-dirs-with.patch
> > @@ -0,0 +1,102 @@
> > +From 62240d4c725ea0b43abfb901ddad90e83e29a25c Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Mon, 7 Dec 2015 23:41:45 +0000
> > +Subject: [PATCH 28/40] Search target sysroot gcc version specific dir=
s with
> > + multilib.
> > +
> > +We install the gcc libraries (such as crtbegin.p) into
> > +<sysroot><libdir>/<target-sys>/5.2.0/
> > +which is a default search path for GCC (aka multi_suffix in the
> > +code below). <target-sys> is 'machine' in gcc's terminology. We use
> > +these directories so that multiple gcc versions could in theory
> > +co-exist on target.
> > +
> > +We only want to build one gcc-cross-canadian per arch and have this w=
ork
> > +for all multilibs. <target-sys> can be handled by mapping the multili=
b
> > +<target-sys> to the one used by gcc-cross-canadian, e.g.
> > +mips64-polkmllib32-linux
> > +is symlinked to by mips64-poky-linux.
> > +
> > +The default gcc search path in the target sysroot for a "lib64" mutli=
lib
> > +is:
> > +
> > +<sysroot>/lib32/mips64-poky-linux/5.2.0/
> > +<sysroot>/lib32/../lib64/
> > +<sysroot>/usr/lib32/mips64-poky-linux/5.2.0/
> > +<sysroot>/usr/lib32/../lib64/
> > +<sysroot>/lib32/
> > +<sysroot>/usr/lib32/
> > +
> > +which means that the lib32 crtbegin.o will be found and the lib64 one=
s
> > +will not which leads to compiler failures.
> > +
> > +This patch injects a multilib version of that path first so the lib64
> > +binaries can be found first. With this change the search path becomes=
:
> > +
> > +<sysroot>/lib32/../lib64/mips64-poky-linux/5.2.0/
> > +<sysroot>/lib32/mips64-poky-linux/5.2.0/
> > +<sysroot>/lib32/../lib64/
> > +<sysroot>/usr/lib32/../lib64/mips64-poky-linux/5.2.0/
> > +<sysroot>/usr/lib32/mips64-poky-linux/5.2.0/
> > +<sysroot>/usr/lib32/../lib64/
> > +<sysroot>/lib32/
> > +<sysroot>/usr/lib32/
> > +
> > +Upstream-Status: Pending
> > +RP 2015/7/31
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + gcc/gcc.c | 29 ++++++++++++++++++++++++++++-
> > + 1 file changed, 28 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/gcc/gcc.c b/gcc/gcc.c
> > +index cd0c7fbe961..f6f3aa077c8 100644
> > +--- a/gcc/gcc.c
> > ++++ b/gcc/gcc.c
> > +@@ -2527,7 +2527,7 @@ for_each_path (const struct path_prefix *paths,
> > +       if (path =3D=3D NULL)
> > +     {
> > +       len =3D paths->max_len + extra_space + 1;
> > +-      len +=3D MAX (MAX (suffix_len, multi_os_dir_len), multiarch_le=
n);
> > ++      len +=3D MAX ((suffix_len + multi_os_dir_len), multiarch_len);
> > +       path =3D XNEWVEC (char, len);
> > +     }
> > +
> > +@@ -2539,6 +2539,33 @@ for_each_path (const struct path_prefix *paths=
,
> > +       /* Look first in MACHINE/VERSION subdirectory.  */
> > +       if (!skip_multi_dir)
> > +         {
> > ++          if (!(pl->os_multilib ? skip_multi_os_dir : skip_multi_dir=
))
> > ++            {
> > ++              const char *this_multi;
> > ++              size_t this_multi_len;
> > ++
> > ++              if (pl->os_multilib)
> > ++                {
> > ++                  this_multi =3D multi_os_dir;
> > ++                  this_multi_len =3D multi_os_dir_len;
> > ++                }
> > ++              else
> > ++                {
> > ++                  this_multi =3D multi_dir;
> > ++                  this_multi_len =3D multi_dir_len;
> > ++                }
> > ++
> > ++              /* Look in multilib MACHINE/VERSION subdirectory first=
 */
> > ++              if (this_multi_len)
> > ++                {
> > ++                  memcpy (path + len, this_multi, this_multi_len + 1=
);
> > ++                  memcpy (path + len + this_multi_len, multi_suffix,=
 suffix_len + 1);
> > ++                  ret =3D callback (path, callback_info);
> > ++                    if (ret)
> > ++                      break;
> > ++                }
> > ++            }
> > ++
> > +           memcpy (path + len, multi_suffix, suffix_len + 1);
> > +           ret =3D callback (path, callback_info);
> > +           if (ret)
> > +--
> > +2.21.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0029-=
Fix-various-_FOR_BUILD-and-related-variables.patch b/meta-arm-toolchain/rec=
ipes-devtools/gcc/gcc-arm-8.3/0029-Fix-various-_FOR_BUILD-and-related-varia=
bles.patch
> > new file mode 100644
> > index 0000000..0c8bdb1
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0029-Fix-var=
ious-_FOR_BUILD-and-related-variables.patch
> > @@ -0,0 +1,137 @@
> > +From 1377c738e31a1e1599cfab189485a9459f803e79 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Mon, 7 Dec 2015 23:42:45 +0000
> > +Subject: [PATCH 29/40] Fix various _FOR_BUILD and related variables
> > +
> > +When doing a FOR_BUILD thing, you have to override CFLAGS with
> > +CFLAGS_FOR_BUILD. And if you use C++, you also have to override
> > +CXXFLAGS with CXXFLAGS_FOR_BUILD.
> > +Without this, when building for mingw, you end up trying to use
> > +the mingw headers for a host build.
> > +
> > +The same goes for other variables as well, such as CPPFLAGS,
> > +CPP, and GMPINC.
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
> > +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + Makefile.in      | 6 ++++++
> > + Makefile.tpl     | 5 +++++
> > + gcc/Makefile.in  | 2 +-
> > + gcc/configure    | 2 +-
> > + gcc/configure.ac | 2 +-
> > + 5 files changed, 14 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/Makefile.in b/Makefile.in
> > +index b426d4f9350..a2af9905cce 100644
> > +--- a/Makefile.in
> > ++++ b/Makefile.in
> > +@@ -152,6 +152,7 @@ BUILD_EXPORTS =3D \
> > +     CPP=3D"$(CC_FOR_BUILD) -E"; export CPP; \
> > +     CFLAGS=3D"$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
> > +     CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> > ++    CPPFLAGS=3D"$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS; \
> > +     CXX=3D"$(CXX_FOR_BUILD)"; export CXX; \
> > +     CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
> > +     GFORTRAN=3D"$(GFORTRAN_FOR_BUILD)"; export GFORTRAN; \
> > +@@ -169,6 +170,9 @@ BUILD_EXPORTS =3D \
> > + # built for the build system to override those in BASE_FLAGS_TO_PASS=
.
> > + EXTRA_BUILD_FLAGS =3D \
> > +     CFLAGS=3D"$(CFLAGS_FOR_BUILD)" \
> > ++    CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)" \
> > ++    CPP=3D"$(CC_FOR_BUILD) -E" \
> > ++    CPPFLAGS=3D"$(CPPFLAGS_FOR_BUILD)" \
> > +     LDFLAGS=3D"$(LDFLAGS_FOR_BUILD)"
> > +
> > + # This is the list of directories to built for the host system.
> > +@@ -186,6 +190,7 @@ HOST_SUBDIR =3D @host_subdir@
> > + HOST_EXPORTS =3D \
> > +     $(BASE_EXPORTS) \
> > +     CC=3D"$(CC)"; export CC; \
> > ++    CPP=3D"$(CC) -E"; export CPP; \
> > +     ADA_CFLAGS=3D"$(ADA_CFLAGS)"; export ADA_CFLAGS; \
> > +     CFLAGS=3D"$(CFLAGS)"; export CFLAGS; \
> > +     CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> > +@@ -743,6 +748,7 @@ BASE_FLAGS_TO_PASS =3D \
> > +     "CC_FOR_BUILD=3D$(CC_FOR_BUILD)" \
> > +     "CFLAGS_FOR_BUILD=3D$(CFLAGS_FOR_BUILD)" \
> > +     "CXX_FOR_BUILD=3D$(CXX_FOR_BUILD)" \
> > ++    "CXXFLAGS_FOR_BUILD=3D$(CXXFLAGS_FOR_BUILD)" \
> > +     "EXPECT=3D$(EXPECT)" \
> > +     "FLEX=3D$(FLEX)" \
> > +     "INSTALL=3D$(INSTALL)" \
> > +diff --git a/Makefile.tpl b/Makefile.tpl
> > +index 1f23b79b4b2..6c5652e811d 100644
> > +--- a/Makefile.tpl
> > ++++ b/Makefile.tpl
> > +@@ -154,6 +154,7 @@ BUILD_EXPORTS =3D \
> > +     CC=3D"$(CC_FOR_BUILD)"; export CC; \
> > +     CFLAGS=3D"$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
> > +     CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> > ++    CPPFLAGS=3D"$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS; \
> > +     CXX=3D"$(CXX_FOR_BUILD)"; export CXX; \
> > +     CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
> > +     GFORTRAN=3D"$(GFORTRAN_FOR_BUILD)"; export GFORTRAN; \
> > +@@ -171,6 +172,9 @@ BUILD_EXPORTS =3D \
> > + # built for the build system to override those in BASE_FLAGS_TO_PASS=
.
> > + EXTRA_BUILD_FLAGS =3D \
> > +     CFLAGS=3D"$(CFLAGS_FOR_BUILD)" \
> > ++    CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)" \
> > ++    CPP=3D"$(CC_FOR_BUILD) -E" \
> > ++    CPPFLAGS=3D"$(CPPFLAGS_FOR_BUILD)" \
> > +     LDFLAGS=3D"$(LDFLAGS_FOR_BUILD)"
> > +
> > + # This is the list of directories to built for the host system.
> > +@@ -188,6 +192,7 @@ HOST_SUBDIR =3D @host_subdir@
> > + HOST_EXPORTS =3D \
> > +     $(BASE_EXPORTS) \
> > +     CC=3D"$(CC)"; export CC; \
> > ++    CPP=3D"$(CC) -E"; export CPP; \
> > +     ADA_CFLAGS=3D"$(ADA_CFLAGS)"; export ADA_CFLAGS; \
> > +     CFLAGS=3D"$(CFLAGS)"; export CFLAGS; \
> > +     CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> > +diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> > +index 5ae693fb06c..02ee0aa72f4 100644
> > +--- a/gcc/Makefile.in
> > ++++ b/gcc/Makefile.in
> > +@@ -801,7 +801,7 @@ BUILD_LDFLAGS=3D@BUILD_LDFLAGS@
> > + BUILD_NO_PIE_FLAG =3D @BUILD_NO_PIE_FLAG@
> > + BUILD_LDFLAGS +=3D $(BUILD_NO_PIE_FLAG)
> > + BUILD_CPPFLAGS=3D -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
> > +-            -I$(srcdir)/../include @INCINTL@ $(CPPINC) $(CPPFLAGS)
> > ++            -I$(srcdir)/../include @INCINTL@ $(CPPINC) $(CPPFLAGS_FO=
R_BUILD)
> > +
> > + # Actual name to use when installing a native compiler.
> > + GCC_INSTALL_NAME :=3D $(shell echo gcc|sed '$(program_transform_name=
)')
> > +diff --git a/gcc/configure b/gcc/configure
> > +index 3d9dcbdc93d..aa127a4f6a4 100755
> > +--- a/gcc/configure
> > ++++ b/gcc/configure
> > +@@ -11797,7 +11797,7 @@ else
> > +     CC=3D"${CC_FOR_BUILD}" CFLAGS=3D"${CFLAGS_FOR_BUILD}" \
> > +     CXX=3D"${CXX_FOR_BUILD}" CXXFLAGS=3D"${CXXFLAGS_FOR_BUILD}" \
> > +     LD=3D"${LD_FOR_BUILD}" LDFLAGS=3D"${LDFLAGS_FOR_BUILD}" \
> > +-    GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS} -DGENERATOR_FILE" \
> > ++    GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS_FOR_BUILD} -DGENERATOR_FILE" =
\
> > +     ${realsrcdir}/configure \
> > +             --enable-languages=3D${enable_languages-all} \
> > +             --target=3D$target_alias --host=3D$build_alias --build=
=3D$build_alias
> > +diff --git a/gcc/configure.ac b/gcc/configure.ac
> > +index e09c840b605..18bf53c7e0a 100644
> > +--- a/gcc/configure.ac
> > ++++ b/gcc/configure.ac
> > +@@ -1708,7 +1708,7 @@ else
> > +     CC=3D"${CC_FOR_BUILD}" CFLAGS=3D"${CFLAGS_FOR_BUILD}" \
> > +     CXX=3D"${CXX_FOR_BUILD}" CXXFLAGS=3D"${CXXFLAGS_FOR_BUILD}" \
> > +     LD=3D"${LD_FOR_BUILD}" LDFLAGS=3D"${LDFLAGS_FOR_BUILD}" \
> > +-    GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS} -DGENERATOR_FILE" \
> > ++    GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS_FOR_BUILD} -DGENERATOR_FILE" =
\
> > +     ${realsrcdir}/configure \
> > +             --enable-languages=3D${enable_languages-all} \
> > +             --target=3D$target_alias --host=3D$build_alias --build=
=3D$build_alias
> > +--
> > +2.21.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0030-=
nios2-Define-MUSL_DYNAMIC_LINKER.patch b/meta-arm-toolchain/recipes-devtool=
s/gcc/gcc-arm-8.3/0030-nios2-Define-MUSL_DYNAMIC_LINKER.patch
> > new file mode 100644
> > index 0000000..04e126c
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0030-nios2-D=
efine-MUSL_DYNAMIC_LINKER.patch
> > @@ -0,0 +1,28 @@
> > +From 75da3cc9ca2d3de8c2062f23bf4f72415741ef83 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Tue, 2 Feb 2016 10:26:10 -0800
> > +Subject: [PATCH 30/40] nios2: Define MUSL_DYNAMIC_LINKER
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Marek Vasut <marex@denx.de>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + gcc/config/nios2/linux.h | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/gcc/config/nios2/linux.h b/gcc/config/nios2/linux.h
> > +index 4729105626d..36181eb7b85 100644
> > +--- a/gcc/config/nios2/linux.h
> > ++++ b/gcc/config/nios2/linux.h
> > +@@ -30,6 +30,7 @@
> > + #define CPP_SPEC "%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRANT}"
> > +
> > + #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-nios2.so.1"
> > ++#define MUSL_DYNAMIC_LINKER  "/lib/ld-musl-nios2.so.1"
> > +
> > + #undef LINK_SPEC
> > + #define LINK_SPEC LINK_SPEC_ENDIAN \
> > +--
> > +2.21.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0031-=
Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch b/meta-arm-toolc=
hain/recipes-devtools/gcc/gcc-arm-8.3/0031-Add-ssp_nonshared-to-link-comman=
dline-for-musl-targe.patch
> > new file mode 100644
> > index 0000000..002cf2b
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0031-Add-ssp=
_nonshared-to-link-commandline-for-musl-targe.patch
> > @@ -0,0 +1,87 @@
> > +From f715aeef294b85fa593ef69e6d0114cc7b15312b Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Tue, 27 Jun 2017 18:10:54 -0700
> > +Subject: [PATCH 31/40] Add ssp_nonshared to link commandline for musl=
 targets
> > +
> > +when -fstack-protector options are enabled we need to
> > +link with ssp_shared on musl since it does not provide
> > +the __stack_chk_fail_local() so essentially it provides
> > +libssp but not libssp_nonshared something like
> > +TARGET_LIBC_PROVIDES_SSP_BUT_NOT_SSP_NONSHARED
> > + where-as for glibc the needed symbols
> > +are already present in libc_nonshared library therefore
> > +we do not need any library helper on glibc based systems
> > +but musl needs the libssp_noshared from gcc
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + gcc/config/linux.h          |  7 +++++++
> > + gcc/config/rs6000/linux.h   | 10 ++++++++++
> > + gcc/config/rs6000/linux64.h | 10 ++++++++++
> > + 3 files changed, 27 insertions(+)
> > +
> > +diff --git a/gcc/config/linux.h b/gcc/config/linux.h
> > +index 487b0c0923b..4769d089538 100644
> > +--- a/gcc/config/linux.h
> > ++++ b/gcc/config/linux.h
> > +@@ -182,6 +182,13 @@ see the files COPYING3 and COPYING.RUNTIME respe=
ctively.  If not, see
> > +     { GCC_INCLUDE_DIR, "GCC", 0, 1, 0, 0 },         \
> > +     { 0, 0, 0, 0, 0, 0 }                            \
> > +   }
> > ++#ifdef TARGET_LIBC_PROVIDES_SSP
> > ++#undef LINK_SSP_SPEC
> > ++#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
> > ++                   "|fstack-protector-strong|fstack-protector-explic=
it" \
> > ++                   ":-lssp_nonshared}"
> > ++#endif
> > ++
> > + #endif
> > +
> > + #if (DEFAULT_LIBC =3D=3D LIBC_UCLIBC) && defined (SINGLE_LIBC) /* uC=
linux */
> > +diff --git a/gcc/config/rs6000/linux.h b/gcc/config/rs6000/linux.h
> > +index 01b40c762f6..e7c5e92215c 100644
> > +--- a/gcc/config/rs6000/linux.h
> > ++++ b/gcc/config/rs6000/linux.h
> > +@@ -92,6 +92,16 @@
> > +                                      " -m elf32ppclinux")
> > + #endif
> > +
> > ++/* link libssp_nonshared.a with musl */
> > ++#if DEFAULT_LIBC =3D=3D LIBC_MUSL
> > ++#ifdef TARGET_LIBC_PROVIDES_SSP
> > ++#undef LINK_SSP_SPEC
> > ++#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
> > ++                   "|fstack-protector-strong|fstack-protector-explic=
it" \
> > ++                   ":-lssp_nonshared}"
> > ++#endif
> > ++#endif
> > ++
> > + #undef LINK_OS_LINUX_SPEC
> > + #define LINK_OS_LINUX_SPEC LINK_OS_LINUX_EMUL " %{!shared: %{!static=
: \
> > +   %{!static-pie: \
> > +diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.=
h
> > +index 54aa8d957e7..619e113e2b8 100644
> > +--- a/gcc/config/rs6000/linux64.h
> > ++++ b/gcc/config/rs6000/linux64.h
> > +@@ -466,6 +466,16 @@ extern int dot_symbols;
> > +                                        " -m elf64ppc")
> > + #endif
> > +
> > ++/* link libssp_nonshared.a with musl */
> > ++#if DEFAULT_LIBC =3D=3D LIBC_MUSL
> > ++#ifdef TARGET_LIBC_PROVIDES_SSP
> > ++#undef LINK_SSP_SPEC
> > ++#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
> > ++                   "|fstack-protector-strong|fstack-protector-explic=
it" \
> > ++                   ":-lssp_nonshared}"
> > ++#endif
> > ++#endif
> > ++
> > + #define LINK_OS_LINUX_SPEC32 LINK_OS_LINUX_EMUL32 " %{!shared: %{!st=
atic: \
> > +   %{!static-pie: \
> > +     %{rdynamic:-export-dynamic} \
> > +--
> > +2.21.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0032-=
libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch b/meta-arm-toolchain/recipes-d=
evtools/gcc/gcc-arm-8.3/0032-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
> > new file mode 100644
> > index 0000000..025caba
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0032-libgcc-=
Add-knob-to-use-ldbl-128-on-ppc.patch
> > @@ -0,0 +1,125 @@
> > +From 6dfbca78b8d253aecf9cbb5e68e04b8dd3d6a543 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Apr 2016 20:03:28 +0000
> > +Subject: [PATCH 32/40] libgcc: Add knob to use ldbl-128 on ppc
> > +
> > +musl does not support ldbl 128 so we can not assume
> > +that linux as a whole supports ldbl-128 bits, instead
> > +act upon configure option passed to gcc and assume no
> > +on musl and yes otherwise if no option is passed since
> > +default behaviour is to assume ldbl128 it does not
> > +change the defaults
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + libgcc/Makefile.in           |  1 +
> > + libgcc/config/rs6000/t-linux |  5 ++++-
> > + libgcc/configure             | 18 ++++++++++++++++++
> > + libgcc/configure.ac          | 12 ++++++++++++
> > + 4 files changed, 35 insertions(+), 1 deletion(-)
> > + mode change 100644 =3D> 100755 libgcc/configure
> > +
> > +diff --git a/libgcc/Makefile.in b/libgcc/Makefile.in
> > +index dd8cee99fd3..b5f478af382 100644
> > +--- a/libgcc/Makefile.in
> > ++++ b/libgcc/Makefile.in
> > +@@ -48,6 +48,7 @@ unwind_header =3D @unwind_header@
> > + md_unwind_header =3D @md_unwind_header@
> > + sfp_machine_header =3D @sfp_machine_header@
> > + thread_header =3D @thread_header@
> > ++with_ldbl128 =3D @with_ldbl128@
> > +
> > + host_noncanonical =3D @host_noncanonical@
> > + real_host_noncanonical =3D @real_host_noncanonical@
> > +diff --git a/libgcc/config/rs6000/t-linux b/libgcc/config/rs6000/t-li=
nux
> > +index 4f6d4c4a4d2..c50dd94a2da 100644
> > +--- a/libgcc/config/rs6000/t-linux
> > ++++ b/libgcc/config/rs6000/t-linux
> > +@@ -1,3 +1,6 @@
> > + SHLIB_MAPFILES +=3D $(srcdir)/config/rs6000/libgcc-glibc.ver
> > +
> > +-HOST_LIBGCC2_CFLAGS +=3D -mlong-double-128 -mno-minimal-toc
> > ++ifeq ($(with_ldbl128),yes)
> > ++HOST_LIBGCC2_CFLAGS +=3D -mlong-double-128
> > ++endif
> > ++HOST_LIBGCC2_CFLAGS +=3D -mno-minimal-toc
> > +diff --git a/libgcc/configure b/libgcc/configure
> > +old mode 100644
> > +new mode 100755
> > +index b2f3f870844..ed806587c17
> > +--- a/libgcc/configure
> > ++++ b/libgcc/configure
> > +@@ -619,6 +619,7 @@ build_vendor
> > + build_cpu
> > + build
> > + with_aix_soname
> > ++with_ldbl128
> > + enable_vtable_verify
> > + enable_shared
> > + libgcc_topdir
> > +@@ -668,6 +669,7 @@ with_cross_host
> > + with_ld
> > + enable_shared
> > + enable_vtable_verify
> > ++with_long_double_128
> > + with_aix_soname
> > + enable_version_specific_runtime_libs
> > + with_slibdir
> > +@@ -1329,6 +1331,7 @@ Optional Packages:
> > +   --with-target-subdir=3DSUBDIR      Configuring in a subdirectory f=
or target
> > +   --with-cross-host=3DHOST           Configuring with a cross compil=
er
> > +   --with-ld               arrange to use the specified ld (full path=
name)
> > ++  --with-long-double-128  use 128-bit long double by default
> > +   --with-aix-soname=3Daix|svr4|both
> > +                           shared library versioning (aka "SONAME") v=
ariant to
> > +                           provide on AIX
> > +@@ -2213,6 +2216,21 @@ fi
> > +
> > +
> > +
> > ++# Check whether --with-long-double-128 was given.
> > ++if test "${with_long_double_128+set}" =3D set; then :
> > ++  withval=3D$with_long_double_128; with_ldbl128=3D"$with_long_double=
_128"
> > ++else
> > ++  case "${host}" in
> > ++ power*-*-musl*)
> > ++   with_ldbl128=3D"no";;
> > ++ *) with_ldbl128=3D"yes";;
> > ++ esac
> > ++
> > ++fi
> > ++
> > ++
> > ++
> > ++
> > + # Check whether --with-aix-soname was given.
> > + if test "${with_aix_soname+set}" =3D set; then :
> > +   withval=3D$with_aix_soname; case "${host}:${enable_shared}" in
> > +diff --git a/libgcc/configure.ac b/libgcc/configure.ac
> > +index b59aa746afc..42220a263c5 100644
> > +--- a/libgcc/configure.ac
> > ++++ b/libgcc/configure.ac
> > +@@ -78,6 +78,18 @@ AC_ARG_ENABLE(vtable-verify,
> > + [enable_vtable_verify=3Dno])
> > + AC_SUBST(enable_vtable_verify)
> > +
> > ++AC_ARG_WITH(long-double-128,
> > ++[AS_HELP_STRING([--with-long-double-128],
> > ++    [use 128-bit long double by default])],
> > ++      with_ldbl128=3D"$with_long_double_128",
> > ++[case "${host}" in
> > ++ power*-*-musl*)
> > ++   with_ldbl128=3D"no";;
> > ++ *) with_ldbl128=3D"yes";;
> > ++ esac
> > ++])
> > ++AC_SUBST(with_ldbl128)
> > ++
> > + AC_ARG_WITH(aix-soname,
> > + [AS_HELP_STRING([--with-aix-soname=3Daix|svr4|both],
> > +     [shared library versioning (aka "SONAME") variant to provide on =
AIX])],
> > +--
> > +2.21.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0033-=
Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch b/meta-arm-toolchain=
/recipes-devtools/gcc/gcc-arm-8.3/0033-Link-libgcc-using-LDFLAGS-not-just-S=
HLIB_LDFLAGS.patch
> > new file mode 100644
> > index 0000000..343f7aa
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0033-Link-li=
bgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
> > @@ -0,0 +1,29 @@
> > +From 7e55147e8e609ace6f9eecd86a956636687671f0 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Wed, 4 May 2016 21:11:34 -0700
> > +Subject: [PATCH 33/40] Link libgcc using LDFLAGS, not just SHLIB_LDFL=
AGS
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + libgcc/config/t-slibgcc | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/libgcc/config/t-slibgcc b/libgcc/config/t-slibgcc
> > +index 7e60b621a2d..ea22ede3361 100644
> > +--- a/libgcc/config/t-slibgcc
> > ++++ b/libgcc/config/t-slibgcc
> > +@@ -32,7 +32,7 @@ SHLIB_INSTALL_SOLINK =3D $(LN_S) $(SHLIB_SONAME) \
> > +     $(DESTDIR)$(slibdir)$(SHLIB_SLIBDIR_QUAL)/$(SHLIB_SOLINK)
> > +
> > + SHLIB_LINK =3D $(CC) $(LIBGCC2_CFLAGS) -shared -nodefaultlibs \
> > +-    $(SHLIB_LDFLAGS) \
> > ++    $(LDFLAGS) $(SHLIB_LDFLAGS) \
> > +     -o $(SHLIB_DIR)/$(SHLIB_SONAME).tmp @multilib_flags@ \
> > +     $(SHLIB_OBJS) $(SHLIB_LC) && \
> > +     rm -f $(SHLIB_DIR)/$(SHLIB_SOLINK) && \
> > +--
> > +2.21.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0034-=
libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch b/meta-arm-toolc=
hain/recipes-devtools/gcc/gcc-arm-8.3/0034-libgcc_s-Use-alias-for-__cpu_ind=
icator_init-instead-.patch
> > new file mode 100644
> > index 0000000..92224cc
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0034-libgcc_=
s-Use-alias-for-__cpu_indicator_init-instead-.patch
> > @@ -0,0 +1,85 @@
> > +From 46ca51dd413330bb8425b06283e7667bfb507c3d Mon Sep 17 00:00:00 200=
1
> > +From: Szabolcs Nagy <nsz@port70.net>
> > +Date: Sat, 24 Oct 2015 20:09:53 +0000
> > +Subject: [PATCH 34/40] libgcc_s: Use alias for __cpu_indicator_init i=
nstead of symver
> > +
> > +Adapter from
> > +
> > +https://gcc.gnu.org/ml/gcc-patches/2015-05/msg00899.html
> > +
> > +This fix was debated but hasnt been applied gcc upstream since
> > +they expect musl to support '@' in symbol versioning which is
> > +a sun/gnu versioning extention. This patch however avoids the
> > +need for the '@' symbols at all
> > +
> > +libgcc/Changelog:
> > +
> > +2015-05-11  Szabolcs Nagy  <szabolcs.nagy@arm.com>
> > +
> > +     * config/i386/cpuinfo.c (__cpu_indicator_init_local): Add.
> > +     (__cpu_indicator_init@GCC_4.8.0, __cpu_model@GCC_4.8.0): Remove.
> > +
> > +     * config/i386/t-linux (HOST_LIBGCC2_CFLAGS): Remove -DUSE_ELF_SY=
MVER.
> > +
> > +gcc/Changelog:
> > +
> > +2015-05-11  Szabolcs Nagy  <szabolcs.nagy@arm.com>
> > +
> > +     * config/i386/i386.c (ix86_expand_builtin): Make __builtin_cpu_i=
nit
> > +     call __cpu_indicator_init_local instead of __cpu_indicator_init.
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + gcc/config/i386/i386.c       | 4 ++--
> > + libgcc/config/i386/cpuinfo.c | 6 +++---
> > + libgcc/config/i386/t-linux   | 2 +-
> > + 3 files changed, 6 insertions(+), 6 deletions(-)
> > +
> > +diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c
> > +index a88a29b51e6..6f3f5187970 100644
> > +--- a/gcc/config/i386/i386.c
> > ++++ b/gcc/config/i386/i386.c
> > +@@ -36555,10 +36555,10 @@ ix86_expand_builtin (tree exp, rtx target, =
rtx subtarget,
> > +     {
> > +     case IX86_BUILTIN_CPU_INIT:
> > +       {
> > +-    /* Make it call __cpu_indicator_init in libgcc. */
> > ++    /* Make it call __cpu_indicator_init_local in libgcc.a. */
> > +     tree call_expr, fndecl, type;
> > +         type =3D build_function_type_list (integer_type_node, NULL_T=
REE);
> > +-    fndecl =3D build_fn_decl ("__cpu_indicator_init", type);
> > ++    fndecl =3D build_fn_decl ("__cpu_indicator_init_local", type);
> > +     call_expr =3D build_call_expr (fndecl, 0);
> > +     return expand_expr (call_expr, target, mode, EXPAND_NORMAL);
> > +       }
> > +diff --git a/libgcc/config/i386/cpuinfo.c b/libgcc/config/i386/cpuinf=
o.c
> > +index d1853d5515b..864150c9249 100644
> > +--- a/libgcc/config/i386/cpuinfo.c
> > ++++ b/libgcc/config/i386/cpuinfo.c
> > +@@ -485,7 +485,7 @@ __cpu_indicator_init (void)
> > +   return 0;
> > + }
> > +
> > +-#if defined SHARED && defined USE_ELF_SYMVER
> > +-__asm__ (".symver __cpu_indicator_init, __cpu_indicator_init@GCC_4.8=
.0");
> > +-__asm__ (".symver __cpu_model, __cpu_model@GCC_4.8.0");
> > ++#ifndef SHARED
> > ++int __cpu_indicator_init_local (void)
> > ++  __attribute__ ((weak, alias ("__cpu_indicator_init")));
> > + #endif
> > +diff --git a/libgcc/config/i386/t-linux b/libgcc/config/i386/t-linux
> > +index 8506a635790..564296f788e 100644
> > +--- a/libgcc/config/i386/t-linux
> > ++++ b/libgcc/config/i386/t-linux
> > +@@ -3,5 +3,5 @@
> > + # t-slibgcc-elf-ver and t-linux
> > + SHLIB_MAPFILES =3D libgcc-std.ver $(srcdir)/config/i386/libgcc-glibc=
.ver
> > +
> > +-HOST_LIBGCC2_CFLAGS +=3D -mlong-double-80 -DUSE_ELF_SYMVER $(CET_FLA=
GS)
> > ++HOST_LIBGCC2_CFLAGS +=3D -mlong-double-80 $(CET_FLAGS)
> > + CRTSTUFF_T_CFLAGS +=3D $(CET_FLAGS)
> > +--
> > +2.21.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0035-=
sync-gcc-stddef.h-with-musl.patch b/meta-arm-toolchain/recipes-devtools/gcc=
/gcc-arm-8.3/0035-sync-gcc-stddef.h-with-musl.patch
> > new file mode 100644
> > index 0000000..6ecd6e9
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0035-sync-gc=
c-stddef.h-with-musl.patch
> > @@ -0,0 +1,91 @@
> > +From 38d401fb6ab555d09f4a9a677721dde0743876e1 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 3 Feb 2017 12:56:00 -0800
> > +Subject: [PATCH 35/40] sync gcc stddef.h with musl
> > +
> > +musl defines ptrdiff_t size_t and wchar_t
> > +so dont define them here if musl is definining them
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + gcc/ginclude/stddef.h | 9 +++++++++
> > + 1 file changed, 9 insertions(+)
> > +
> > +diff --git a/gcc/ginclude/stddef.h b/gcc/ginclude/stddef.h
> > +index 31b96a7e5e1..438a3ce7c56 100644
> > +--- a/gcc/ginclude/stddef.h
> > ++++ b/gcc/ginclude/stddef.h
> > +@@ -134,6 +134,7 @@ _TYPE_wchar_t;
> > + #ifndef ___int_ptrdiff_t_h
> > + #ifndef _GCC_PTRDIFF_T
> > + #ifndef _PTRDIFF_T_DECLARED /* DragonFly */
> > ++#ifndef __DEFINED_ptrdiff_t /* musl */
> > + #define _PTRDIFF_T
> > + #define _T_PTRDIFF_
> > + #define _T_PTRDIFF
> > +@@ -143,10 +144,12 @@ _TYPE_wchar_t;
> > + #define ___int_ptrdiff_t_h
> > + #define _GCC_PTRDIFF_T
> > + #define _PTRDIFF_T_DECLARED
> > ++#define __DEFINED_ptrdiff_t /* musl */
> > + #ifndef __PTRDIFF_TYPE__
> > + #define __PTRDIFF_TYPE__ long int
> > + #endif
> > + typedef __PTRDIFF_TYPE__ ptrdiff_t;
> > ++#endif /* __DEFINED_ptrdiff_t */
> > + #endif /* _PTRDIFF_T_DECLARED */
> > + #endif /* _GCC_PTRDIFF_T */
> > + #endif /* ___int_ptrdiff_t_h */
> > +@@ -184,6 +187,7 @@ typedef __PTRDIFF_TYPE__ ptrdiff_t;
> > + #ifndef _GCC_SIZE_T
> > + #ifndef _SIZET_
> > + #ifndef __size_t
> > ++#ifndef __DEFINED_size_t /* musl */
> > + #define __size_t__  /* BeOS */
> > + #define __SIZE_T__  /* Cray Unicos/Mk */
> > + #define _SIZE_T
> > +@@ -200,6 +204,7 @@ typedef __PTRDIFF_TYPE__ ptrdiff_t;
> > + #define ___int_size_t_h
> > + #define _GCC_SIZE_T
> > + #define _SIZET_
> > ++#define __DEFINED_size_t /* musl */
> > + #if (defined (__FreeBSD__) && (__FreeBSD__ >=3D 5)) \
> > +   || defined(__DragonFly__) \
> > +   || defined(__FreeBSD_kernel__)
> > +@@ -235,6 +240,7 @@ typedef long ssize_t;
> > + #endif /* _SIZE_T */
> > + #endif /* __SIZE_T__ */
> > + #endif /* __size_t__ */
> > ++#endif /* __DEFINED_size_t */
> > + #undef      __need_size_t
> > + #endif /* _STDDEF_H or __need_size_t.  */
> > +
> > +@@ -264,6 +270,7 @@ typedef long ssize_t;
> > + #ifndef ___int_wchar_t_h
> > + #ifndef __INT_WCHAR_T_H
> > + #ifndef _GCC_WCHAR_T
> > ++#ifndef __DEFINED_wchar_t /* musl */
> > + #define __wchar_t__ /* BeOS */
> > + #define __WCHAR_T__ /* Cray Unicos/Mk */
> > + #define _WCHAR_T
> > +@@ -279,6 +286,7 @@ typedef long ssize_t;
> > + #define __INT_WCHAR_T_H
> > + #define _GCC_WCHAR_T
> > + #define _WCHAR_T_DECLARED
> > ++#define __DEFINED_wchar_t /* musl */
> > +
> > + /* On BSD/386 1.1, at least, machine/ansi.h defines _BSD_WCHAR_T_
> > +    instead of _WCHAR_T_, and _BSD_RUNE_T_ (which, unlike the other
> > +@@ -344,6 +352,7 @@ typedef __WCHAR_TYPE__ wchar_t;
> > + #endif
> > + #endif /* __WCHAR_T__ */
> > + #endif /* __wchar_t__ */
> > ++#endif /* __DEFINED_wchar_t musl */
> > + #undef      __need_wchar_t
> > + #endif /* _STDDEF_H or __need_wchar_t.  */
> > +
> > +--
> > +2.21.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0036-=
fix-segmentation-fault-in-precompiled-header-generat.patch b/meta-arm-toolc=
hain/recipes-devtools/gcc/gcc-arm-8.3/0036-fix-segmentation-fault-in-precom=
piled-header-generat.patch
> > new file mode 100644
> > index 0000000..c4ce5db
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0036-fix-seg=
mentation-fault-in-precompiled-header-generat.patch
> > @@ -0,0 +1,60 @@
> > +From a9bb29a4e9b478f9b126e483467ce9031c33fe4f Mon Sep 17 00:00:00 200=
1
> > +From: Juro Bystricky <juro.bystricky@intel.com>
> > +Date: Mon, 19 Mar 2018 22:31:20 -0700
> > +Subject: [PATCH 36/40] fix segmentation fault in precompiled header g=
eneration
> > +
> > +Prevent a segmentation fault which occurs when using incorrect
> > +structure trying to access name of some named operators, such as
> > +CPP_NOT, CPP_AND etc. "token->val.node.spelling" cannot be used in
> > +those cases, as is may not be initialized at all.
> > +
> > +[YOCTO #11738]
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + libcpp/lex.c | 26 +++++++++++++++++++++-----
> > + 1 file changed, 21 insertions(+), 5 deletions(-)
> > +
> > +diff --git a/libcpp/lex.c b/libcpp/lex.c
> > +index 37c365a3560..63480048db6 100644
> > +--- a/libcpp/lex.c
> > ++++ b/libcpp/lex.c
> > +@@ -3279,11 +3279,27 @@ cpp_spell_token (cpp_reader *pfile, const cpp=
_token *token,
> > +     spell_ident:
> > +     case SPELL_IDENT:
> > +       if (forstring)
> > +-    {
> > +-      memcpy (buffer, NODE_NAME (token->val.node.spelling),
> > +-              NODE_LEN (token->val.node.spelling));
> > +-      buffer +=3D NODE_LEN (token->val.node.spelling);
> > +-    }
> > ++        {
> > ++          if (token->type =3D=3D CPP_NAME)
> > ++            {
> > ++              memcpy (buffer, NODE_NAME (token->val.node.spelling),
> > ++                    NODE_LEN (token->val.node.spelling));
> > ++              buffer +=3D NODE_LEN (token->val.node.spelling);
> > ++              break;
> > ++            }
> > ++          /* NAMED_OP, cannot use node.spelling */
> > ++          if (token->flags & NAMED_OP)
> > ++            {
> > ++              const char *str =3D cpp_named_operator2name (token->ty=
pe);
> > ++              if (str)
> > ++                {
> > ++                  size_t len =3D strlen(str);
> > ++                  memcpy(buffer, str, len);
> > ++                  buffer +=3D len;
> > ++                }
> > ++              break;
> > ++            }
> > ++        }
> > +       else
> > +     buffer =3D _cpp_spell_ident_ucns (buffer, token->val.node.node);
> > +       break;
> > +--
> > +2.21.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0037-=
Fix-for-testsuite-failure.patch b/meta-arm-toolchain/recipes-devtools/gcc/g=
cc-arm-8.3/0037-Fix-for-testsuite-failure.patch
> > new file mode 100644
> > index 0000000..70999dd
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0037-Fix-for=
-testsuite-failure.patch
> > @@ -0,0 +1,258 @@
> > +From 1e5c1ef34d92b4157e1a24ca743d45f3a7375a5e Mon Sep 17 00:00:00 200=
1
> > +From: RAGHUNATH LOLUR <raghunath.lolur@kpit.com>
> > +Date: Wed, 6 Dec 2017 22:52:26 -0800
> > +Subject: [PATCH 37/40] Fix for testsuite failure
> > +
> > +2017-11-16  Raghunath Lolur  <raghunath.lolur@kpit.com>
> > +
> > +     * gcc.dg/pr56275.c: If SSE is disabled, ensure that
> > +     "-mfpmath" is not set to use SSE. Set "-mfpmath=3D387".
> > +     * gcc.dg/pr68306.c: Likewise
> > +     * gcc.dg/pr68306-2.c: Likewise
> > +     * gcc.dg/pr68306-3.c: Likewise
> > +     * gcc.dg/pr69634.c: Likewise
> > +     * gcc.target/i386/amd64-abi-1.c: Likewise
> > +     * gcc.target/i386/funcspec-6.c: Likewise
> > +     * gcc.target/i386/interrupt-387-err-1.c: Likewise
> > +     * gcc.target/i386/isa-14.c: Likewise
> > +     * gcc.target/i386/pr44948-2b.c: Likewise
> > +     * gcc.target/i386/pr53425-1.c: Likewise
> > +     * gcc.target/i386/pr53425-2.c: Likewise
> > +     * gcc.target/i386/pr55247.c: Likewise
> > +     * gcc.target/i386/pr59644.c: Likewise
> > +     * gcc.target/i386/pr62120.c: Likewise
> > +     * gcc.target/i386/pr70467-1.c: Likewise
> > +     * gcc.target/i386/warn-vect-op-1.c: Likewise
> > +
> > +If -Wall, -Werror are used during compilation various test cases fail
> > +to compile.
> > +
> > +If SSE is disabled, be sure to -mfpmath=3D387 to resolve this.
> > +
> > +This patch removes the changes to Changelog from the original patch.
> > +This will help us avoid conflicts.
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> > +---
> > + gcc/testsuite/gcc.dg/pr56275.c                      | 2 +-
> > + gcc/testsuite/gcc.dg/pr68306-2.c                    | 2 +-
> > + gcc/testsuite/gcc.dg/pr68306-3.c                    | 2 +-
> > + gcc/testsuite/gcc.dg/pr68306.c                      | 2 +-
> > + gcc/testsuite/gcc.dg/pr69634.c                      | 2 +-
> > + gcc/testsuite/gcc.target/i386/amd64-abi-1.c         | 2 +-
> > + gcc/testsuite/gcc.target/i386/funcspec-6.c          | 1 +
> > + gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c | 2 +-
> > + gcc/testsuite/gcc.target/i386/isa-14.c              | 2 +-
> > + gcc/testsuite/gcc.target/i386/pr44948-2b.c          | 2 +-
> > + gcc/testsuite/gcc.target/i386/pr53425-1.c           | 2 +-
> > + gcc/testsuite/gcc.target/i386/pr53425-2.c           | 2 +-
> > + gcc/testsuite/gcc.target/i386/pr55247.c             | 2 +-
> > + gcc/testsuite/gcc.target/i386/pr59644.c             | 2 +-
> > + gcc/testsuite/gcc.target/i386/pr62120.c             | 2 +-
> > + gcc/testsuite/gcc.target/i386/pr70467-1.c           | 2 +-
> > + gcc/testsuite/gcc.target/i386/warn-vect-op-1.c      | 2 +-
> > + 17 files changed, 17 insertions(+), 16 deletions(-)
> > +
> > +diff --git a/gcc/testsuite/gcc.dg/pr56275.c b/gcc/testsuite/gcc.dg/pr=
56275.c
> > +index b901bb2b199..a4f6c95e1a1 100644
> > +--- a/gcc/testsuite/gcc.dg/pr56275.c
> > ++++ b/gcc/testsuite/gcc.dg/pr56275.c
> > +@@ -1,6 +1,6 @@
> > + /* { dg-do compile } */
> > + /* { dg-options "-O2" } */
> > +-/* { dg-additional-options "-mno-sse" { target { i?86-*-* x86_64-*-*=
 } } } */
> > ++/* { dg-additional-options "-mno-sse -mfpmath=3D387" { target { i?86=
-*-* x86_64-*-* } } } */
> > +
> > + typedef long long v2tw __attribute__ ((vector_size (2 * sizeof (long=
 long))));
> > +
> > +diff --git a/gcc/testsuite/gcc.dg/pr68306-2.c b/gcc/testsuite/gcc.dg/=
pr68306-2.c
> > +index 4672ebe7987..2a368c484b6 100644
> > +--- a/gcc/testsuite/gcc.dg/pr68306-2.c
> > ++++ b/gcc/testsuite/gcc.dg/pr68306-2.c
> > +@@ -1,6 +1,6 @@
> > + /* { dg-do compile } */
> > + /* { dg-options "-O3" } */
> > +-/* { dg-additional-options "-mno-sse -mno-mmx" { target i?86-*-* x86=
_64-*-* } } */
> > ++/* { dg-additional-options "-mno-sse -mno-mmx -mfpmath=3D387" { targ=
et i?86-*-* x86_64-*-* } } */
> > +
> > + struct {
> > +     int tz_minuteswest;
> > +diff --git a/gcc/testsuite/gcc.dg/pr68306-3.c b/gcc/testsuite/gcc.dg/=
pr68306-3.c
> > +index f5a8c102cf8..df3390c64c2 100644
> > +--- a/gcc/testsuite/gcc.dg/pr68306-3.c
> > ++++ b/gcc/testsuite/gcc.dg/pr68306-3.c
> > +@@ -1,6 +1,6 @@
> > + /* { dg-do compile } */
> > + /* { dg-options "-O3" } */
> > +-/* { dg-additional-options "-mno-sse -mno-mmx" { target i?86-*-* x86=
_64-*-* } } */
> > ++/* { dg-additional-options "-mno-sse -mno-mmx -mfpmath=3D387" { targ=
et i?86-*-* x86_64-*-* } } */
> > + /* { dg-additional-options "-mno-altivec -mno-vsx" { target powerpc*=
-*-* } } */
> > +
> > + extern void fn2();
> > +diff --git a/gcc/testsuite/gcc.dg/pr68306.c b/gcc/testsuite/gcc.dg/pr=
68306.c
> > +index 54e5b40f221..0813389e2c1 100644
> > +--- a/gcc/testsuite/gcc.dg/pr68306.c
> > ++++ b/gcc/testsuite/gcc.dg/pr68306.c
> > +@@ -1,6 +1,6 @@
> > + /* { dg-do compile } */
> > + /* { dg-options "-O3" } */
> > +-/* { dg-additional-options "-mno-sse -mno-mmx" { target i?86-*-* x86=
_64-*-* } } */
> > ++/* { dg-additional-options "-mno-sse -mno-mmx -mfpmath=3D387" { targ=
et i?86-*-* x86_64-*-* } } */
> > +
> > + enum powerpc_pmc_type { PPC_PMC_IBM };
> > + struct {
> > +diff --git a/gcc/testsuite/gcc.dg/pr69634.c b/gcc/testsuite/gcc.dg/pr=
69634.c
> > +index 60a56149463..bcc23f9ccd6 100644
> > +--- a/gcc/testsuite/gcc.dg/pr69634.c
> > ++++ b/gcc/testsuite/gcc.dg/pr69634.c
> > +@@ -1,6 +1,6 @@
> > + /* { dg-do compile } */
> > + /* { dg-options "-O2 -fno-dce -fschedule-insns -fno-tree-vrp -fcompa=
re-debug -Wno-psabi" } */
> > +-/* { dg-additional-options "-mno-sse" { target i?86-*-* x86_64-*-* }=
 } */
> > ++/* { dg-additional-options "-mno-sse -mfpmath=3D387" { target i?86-*=
-* x86_64-*-* } } */
> > + /* { dg-require-effective-target scheduling } */
> > +
> > + typedef unsigned short u16;
> > +diff --git a/gcc/testsuite/gcc.target/i386/amd64-abi-1.c b/gcc/testsu=
ite/gcc.target/i386/amd64-abi-1.c
> > +index 69fde57bf06..7f1f1c03edf 100644
> > +--- a/gcc/testsuite/gcc.target/i386/amd64-abi-1.c
> > ++++ b/gcc/testsuite/gcc.target/i386/amd64-abi-1.c
> > +@@ -1,5 +1,5 @@
> > + /* { dg-do compile { target { ! ia32 } } } */
> > +-/* { dg-options "-mno-sse" } */
> > ++/* { dg-options "-mno-sse -mfpmath=3D387" } */
> > + /* { dg-additional-options "-mabi=3Dsysv" { target *-*-mingw* } } */
> > +
> > + double foo(void) { return 0; }      /* { dg-error "SSE disabled" } *=
/
> > +diff --git a/gcc/testsuite/gcc.target/i386/funcspec-6.c b/gcc/testsui=
te/gcc.target/i386/funcspec-6.c
> > +index ea896b7ebfd..bf15569b826 100644
> > +--- a/gcc/testsuite/gcc.target/i386/funcspec-6.c
> > ++++ b/gcc/testsuite/gcc.target/i386/funcspec-6.c
> > +@@ -1,6 +1,7 @@
> > + /* Test whether all of the 64-bit function specific options are acce=
pted
> > +    without error.  */
> > + /* { dg-do compile { target { ! ia32 } } } */
> > ++/* { dg-additional-options "-mfpmath=3D387" } */
> > +
> > + #include "funcspec-56.inc"
> > +
> > +diff --git a/gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c b/gc=
c/testsuite/gcc.target/i386/interrupt-387-err-1.c
> > +index 3fbdc881dda..6b4d9d1252a 100644
> > +--- a/gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c
> > ++++ b/gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c
> > +@@ -1,5 +1,5 @@
> > + /* { dg-do compile } */
> > +-/* { dg-options "-O2 -mgeneral-regs-only -mno-cld -mno-iamcu -m80387=
" } */
> > ++/* { dg-options "-O2 -mgeneral-regs-only -mno-cld -mno-iamcu -m80387=
 -mfpmath=3D387" } */
> > +
> > + typedef unsigned int uword_t __attribute__ ((mode (__word__)));
> > +
> > +diff --git a/gcc/testsuite/gcc.target/i386/isa-14.c b/gcc/testsuite/g=
cc.target/i386/isa-14.c
> > +index 5d49e6e77fe..1de2db92bdd 100644
> > +--- a/gcc/testsuite/gcc.target/i386/isa-14.c
> > ++++ b/gcc/testsuite/gcc.target/i386/isa-14.c
> > +@@ -1,5 +1,5 @@
> > + /* { dg-do run } */
> > +-/* { dg-options "-march=3Dx86-64 -msse4a -mfma4 -mno-sse" } */
> > ++/* { dg-options "-march=3Dx86-64 -msse4a -mfma4 -mno-sse -mfpmath=3D=
387" } */
> > +
> > + extern void abort (void);
> > +
> > +diff --git a/gcc/testsuite/gcc.target/i386/pr44948-2b.c b/gcc/testsui=
te/gcc.target/i386/pr44948-2b.c
> > +index fa1769b62fb..f79fb12726f 100644
> > +--- a/gcc/testsuite/gcc.target/i386/pr44948-2b.c
> > ++++ b/gcc/testsuite/gcc.target/i386/pr44948-2b.c
> > +@@ -1,5 +1,5 @@
> > + /* { dg-do compile } */
> > +-/* { dg-options "-O -mno-sse -Wno-psabi -mtune=3Dgeneric" } */
> > ++/* { dg-options "-O -mno-sse -Wno-psabi -mtune=3Dgeneric -mfpmath=3D=
387" } */
> > +
> > + struct A
> > + {
> > +diff --git a/gcc/testsuite/gcc.target/i386/pr53425-1.c b/gcc/testsuit=
e/gcc.target/i386/pr53425-1.c
> > +index 2e89ff7d81d..6339bf6b736 100644
> > +--- a/gcc/testsuite/gcc.target/i386/pr53425-1.c
> > ++++ b/gcc/testsuite/gcc.target/i386/pr53425-1.c
> > +@@ -1,6 +1,6 @@
> > + /* PR target/53425 */
> > + /* { dg-do compile { target { ! ia32 } } } */
> > +-/* { dg-options "-O2 -mno-sse" } */
> > ++/* { dg-options "-O2 -mno-sse -mfpmath=3D387" } */
> > + /* { dg-skip-if "no SSE vector" { x86_64-*-mingw* } } */
> > +
> > + typedef double __v2df __attribute__ ((__vector_size__ (16)));
> > +diff --git a/gcc/testsuite/gcc.target/i386/pr53425-2.c b/gcc/testsuit=
e/gcc.target/i386/pr53425-2.c
> > +index 61f6283dbe9..2c5a55f0ac3 100644
> > +--- a/gcc/testsuite/gcc.target/i386/pr53425-2.c
> > ++++ b/gcc/testsuite/gcc.target/i386/pr53425-2.c
> > +@@ -1,6 +1,6 @@
> > + /* PR target/53425 */
> > + /* { dg-do compile { target { ! ia32 } } } */
> > +-/* { dg-options "-O2 -mno-sse" } */
> > ++/* { dg-options "-O2 -mno-sse -mfpmath=3D387" } */
> > + /* { dg-skip-if "no SSE vector" { x86_64-*-mingw* } } */
> > +
> > + typedef float __v2sf __attribute__ ((__vector_size__ (8)));
> > +diff --git a/gcc/testsuite/gcc.target/i386/pr55247.c b/gcc/testsuite/=
gcc.target/i386/pr55247.c
> > +index 23366d0909d..9810e3abb76 100644
> > +--- a/gcc/testsuite/gcc.target/i386/pr55247.c
> > ++++ b/gcc/testsuite/gcc.target/i386/pr55247.c
> > +@@ -1,6 +1,6 @@
> > + /* { dg-do compile { target { ! ia32 } } } */
> > + /* { dg-require-effective-target maybe_x32 } */
> > +-/* { dg-options "-O2 -mno-sse -mno-mmx -mx32 -maddress-mode=3Dlong" =
} */
> > ++/* { dg-options "-O2 -mno-sse -mno-mmx -mx32 -maddress-mode=3Dlong -=
mfpmath=3D387" } */
> > +
> > + typedef unsigned int uint32_t;
> > + typedef uint32_t Elf32_Word;
> > +diff --git a/gcc/testsuite/gcc.target/i386/pr59644.c b/gcc/testsuite/=
gcc.target/i386/pr59644.c
> > +index 96006b3e338..4287e4538bf 100644
> > +--- a/gcc/testsuite/gcc.target/i386/pr59644.c
> > ++++ b/gcc/testsuite/gcc.target/i386/pr59644.c
> > +@@ -1,6 +1,6 @@
> > + /* PR target/59644 */
> > + /* { dg-do run { target lp64 } } */
> > +-/* { dg-options "-O2 -ffreestanding -mno-sse -mpreferred-stack-bound=
ary=3D3 -maccumulate-outgoing-args -mno-red-zone" } */
> > ++/* { dg-options "-O2 -ffreestanding -mno-sse -mpreferred-stack-bound=
ary=3D3 -maccumulate-outgoing-args -mno-red-zone -mfpmath=3D387" } */
> > +
> > + /* This test uses __builtin_trap () instead of e.g. abort,
> > +    because due to -mpreferred-stack-boundary=3D3 it should not call
> > +diff --git a/gcc/testsuite/gcc.target/i386/pr62120.c b/gcc/testsuite/=
gcc.target/i386/pr62120.c
> > +index bfb8c4703eb..ed04cf181f3 100644
> > +--- a/gcc/testsuite/gcc.target/i386/pr62120.c
> > ++++ b/gcc/testsuite/gcc.target/i386/pr62120.c
> > +@@ -1,5 +1,5 @@
> > + /* { dg-do compile } */
> > +-/* { dg-options "-mno-sse" } */
> > ++/* { dg-options "-mno-sse -mfpmath=3D387" } */
> > +
> > + void foo ()
> > + {
> > +diff --git a/gcc/testsuite/gcc.target/i386/pr70467-1.c b/gcc/testsuit=
e/gcc.target/i386/pr70467-1.c
> > +index 4e112c88d07..bcfb396a68d 100644
> > +--- a/gcc/testsuite/gcc.target/i386/pr70467-1.c
> > ++++ b/gcc/testsuite/gcc.target/i386/pr70467-1.c
> > +@@ -1,6 +1,6 @@
> > + /* PR rtl-optimization/70467 */
> > + /* { dg-do compile } */
> > +-/* { dg-options "-O2 -mno-sse" } */
> > ++/* { dg-options "-O2 -mno-sse -mfpmath=3D387" } */
> > +
> > + void foo (unsigned long long *);
> > +
> > +diff --git a/gcc/testsuite/gcc.target/i386/warn-vect-op-1.c b/gcc/tes=
tsuite/gcc.target/i386/warn-vect-op-1.c
> > +index 6cda1534311..26e37f5b8ba 100644
> > +--- a/gcc/testsuite/gcc.target/i386/warn-vect-op-1.c
> > ++++ b/gcc/testsuite/gcc.target/i386/warn-vect-op-1.c
> > +@@ -1,5 +1,5 @@
> > + /* { dg-do compile { target { ! ia32 } } }  */
> > +-/* { dg-options "-mno-sse -Wvector-operation-performance" }  */
> > ++/* { dg-options "-mno-sse -Wvector-operation-performance -mfpmath=3D=
387" }  */
> > + #define vector(elcount, type)  \
> > + __attribute__((vector_size((elcount)*sizeof(type)))) type
> > +
> > +--
> > +2.21.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0038-=
Re-introduce-spe-commandline-options.patch b/meta-arm-toolchain/recipes-dev=
tools/gcc/gcc-arm-8.3/0038-Re-introduce-spe-commandline-options.patch
> > new file mode 100644
> > index 0000000..8de8892
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0038-Re-intr=
oduce-spe-commandline-options.patch
> > @@ -0,0 +1,41 @@
> > +From f0bea96434ac478c3cff8c29dd97cccfac5b35e3 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Wed, 6 Jun 2018 12:10:22 -0700
> > +Subject: [PATCH 38/40] Re-introduce spe commandline options
> > +
> > +This should ensure that we keep accepting
> > +spe options
> > +
> > +Upstream-Status: Inappropriate [SPE port is removed from rs600 port]
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + gcc/config/rs6000/rs6000.opt | 12 ++++++++++++
> > + 1 file changed, 12 insertions(+)
> > +
> > +diff --git a/gcc/config/rs6000/rs6000.opt b/gcc/config/rs6000/rs6000.=
opt
> > +index ace8a477550..d6a8f825d88 100644
> > +--- a/gcc/config/rs6000/rs6000.opt
> > ++++ b/gcc/config/rs6000/rs6000.opt
> > +@@ -365,6 +365,18 @@ mdebug=3D
> > + Target RejectNegative Joined
> > + -mdebug=3D    Enable debug output.
> > +
> > ++mspe
> > ++Target Var(rs6000_spe) Save
> > ++Generate SPE SIMD instructions on E500.
> > ++
> > ++mabi=3Dspe
> > ++Target RejectNegative Var(rs6000_spe_abi) Save
> > ++Use the SPE ABI extensions.
> > ++
> > ++mabi=3Dno-spe
> > ++Target RejectNegative Var(rs6000_spe_abi, 0)
> > ++Do not use the SPE ABI extensions.
> > ++
> > + mabi=3Daltivec
> > + Target RejectNegative Var(rs6000_altivec_abi) Save
> > + Use the AltiVec ABI extensions.
> > +--
> > +2.21.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0039-=
riscv-Disable-multilib-for-OE.patch b/meta-arm-toolchain/recipes-devtools/g=
cc/gcc-arm-8.3/0039-riscv-Disable-multilib-for-OE.patch
> > new file mode 100644
> > index 0000000..f7b222e
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0039-riscv-D=
isable-multilib-for-OE.patch
> > @@ -0,0 +1,27 @@
> > +From 24f74444c00c6c9bf076fb002614ebf6dec31f1a Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 28 Dec 2018 09:59:53 -0800
> > +Subject: [PATCH 39/40] riscv: Disable multilib for OE
> > +
> > +Upstream-Status: Inappropriate [OE-Specific]
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + gcc/config/riscv/t-linux | 6 ++++--
> > + 1 file changed, 4 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/gcc/config/riscv/t-linux b/gcc/config/riscv/t-linux
> > +index 216d2776a18..e4d817621fc 100644
> > +--- a/gcc/config/riscv/t-linux
> > ++++ b/gcc/config/riscv/t-linux
> > +@@ -1,3 +1,5 @@
> > + # Only XLEN and ABI affect Linux multilib dir names, e.g. /lib32/ilp=
32d/
> > +-MULTILIB_DIRNAMES :=3D $(patsubst rv32%,lib32,$(patsubst rv64%,lib64=
,$(MULTILIB_DIRNAMES)))
> > +-MULTILIB_OSDIRNAMES :=3D $(patsubst lib%,../lib%,$(MULTILIB_DIRNAMES=
))
> > ++#MULTILIB_DIRNAMES :=3D $(patsubst rv32%,lib32,$(patsubst rv64%,lib6=
4,$(MULTILIB_DIRNAMES)))
> > ++MULTILIB_DIRNAMES :=3D . .
> > ++#MULTILIB_OSDIRNAMES :=3D $(patsubst lib%,../lib%,$(MULTILIB_DIRNAME=
S))
> > ++MULTILIB_OSDIRNAMES :=3D ../$(shell basename $(base_libdir)) ../$(sh=
ell basename $(base_libdir))
> > +--
> > +2.21.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0040-=
powerpc-powerpc64-Add-support-for-musl-ldso.patch b/meta-arm-toolchain/reci=
pes-devtools/gcc/gcc-arm-8.3/0040-powerpc-powerpc64-Add-support-for-musl-ld=
so.patch
> > new file mode 100644
> > index 0000000..9fba163
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3/0040-powerpc=
-powerpc64-Add-support-for-musl-ldso.patch
> > @@ -0,0 +1,31 @@
> > +From 4bd0a3866f302725cb4eddcaddaeece64900c42f Mon Sep 17 00:00:00 200=
1
> > +From: Serhey Popovych <serhe.popovych@gmail.com>
> > +Date: Tue, 11 Dec 2018 02:30:50 -0500
> > +Subject: [PATCH 40/40] powerpc/powerpc64: Add support for musl ldso
> > +
> > +Upstream-Status: Inappropriate [OE-Specific]
> > +
> > +Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
> > +---
> > + gcc/config/rs6000/linux64.h | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.=
h
> > +index 619e113e2b8..ee8b44f9374 100644
> > +--- a/gcc/config/rs6000/linux64.h
> > ++++ b/gcc/config/rs6000/linux64.h
> > +@@ -421,9 +421,9 @@ extern int dot_symbols;
> > + #endif
> > +
> > + #define MUSL_DYNAMIC_LINKER32 \
> > +-  "/lib/ld-musl-powerpc" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}.s=
o.1"
> > ++  SYSTEMLIBS_DIR "ld-musl-powerpc" MUSL_DYNAMIC_LINKER_E "%{msoft-fl=
oat:-sf}.so.1"
> > + #define MUSL_DYNAMIC_LINKER64 \
> > +-  "/lib/ld-musl-powerpc64" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}=
.so.1"
> > ++  SYSTEMLIBS_DIR "ld-musl-powerpc64" MUSL_DYNAMIC_LINKER_E "%{msoft-=
float:-sf}.so.1"
> > +
> > + #define UCLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-uClibc.so.0"
> > + #define UCLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld64-uClibc.so.0"
> > +--
> > +2.21.0
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc b=
/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
> > new file mode 100644
> > index 0000000..366a070
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
> > @@ -0,0 +1,124 @@
> > +require recipes-devtools/gcc/gcc-common.inc
> > +
> > +# Third digit in PV should be incremented after a minor release
> > +
> > +PV =3D "arm-9.2"
> > +
> > +# BINV should be incremented to a revision after a minor gcc release
> > +
> > +BINV =3D "9.2.1"
> > +
> > +MMYY =3D "19.12"
> > +RELEASE =3D "20${MMYY}"
> > +PR =3D "r${RELEASE}"
> > +
> > +FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/gcc-arm-9.2:${FILE_DIRNAME}/gcc=
-arm-9.2/backport:"
> > +
> > +DEPENDS =3D+ "mpfr gmp libmpc zlib flex-native"
> > +NATIVEDEPS =3D "mpfr-native gmp-native libmpc-native zlib-native flex=
-native"
> > +
> > +LICENSE =3D "GPL-3.0-with-GCC-exception & GPLv3"
> > +
> > +LIC_FILES_CHKSUM =3D "\
> > +    file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552 \
> > +    file://COPYING3;md5=3Dd32239bcb673463ab874e80d47fae504 \
> > +    file://COPYING3.LIB;md5=3D6a6a8e020838b23406c81b19c1d46df6 \
> > +    file://COPYING.LIB;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
> > +    file://COPYING.RUNTIME;md5=3Dfe60d87048567d4fe8c8a0ed2448bcc8 \
> > +"
> > +
> > +#BASEURI ?=3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
> > +#RELEASE ?=3D "5a5ca2d"
> > +#BASEURI ?=3D "https://repo.or.cz/official-gcc.git/snapshot/${RELEASE=
}.tar.gz;downloadfilename=3Dgcc-${RELEASE}.tar.gz"
> > +BASEURI ?=3D "svn://gcc.gnu.org/svn/gcc/branches/ARM;rev=3D277439;mod=
ule=3Darm-9-branch"
> > +SRC_URI =3D "\
> > +           ${BASEURI} \
> > +           file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
> > +           file://0002-gcc-poison-system-directories.patch \
> > +           file://0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch \
> > +           file://0004-64-bit-multilib-hack.patch \
> > +           file://0005-optional-libstdc.patch \
> > +           file://0006-COLLECT_GCC_OPTIONS.patch \
> > +           file://0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-=
in-B.patch \
> > +           file://0008-fortran-cross-compile-hack.patch \
> > +           file://0009-cpp-honor-sysroot.patch \
> > +           file://0010-MIPS64-Default-to-N64-ABI.patch \
> > +           file://0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC=
_LINKE.patch \
> > +           file://0012-gcc-Fix-argument-list-too-long-error.patch \
> > +           file://0013-Disable-sdt.patch \
> > +           file://0014-libtool.patch \
> > +           file://0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-E=
ABI.patch \
> > +           file://0016-Use-the-multilib-config-files-from-B-instead-o=
f-usin.patch \
> > +           file://0017-Avoid-using-libdir-from-.la-which-usually-poin=
ts-to-.patch \
> > +           file://0018-export-CPP.patch \
> > +           file://0019-Ensure-target-gcc-headers-can-be-included.patc=
h \
> > +           file://0020-gcc-4.8-won-t-build-with-disable-dependency-tr=
acking.patch \
> > +           file://0021-Don-t-search-host-directory-during-relink-if-i=
nst_pr.patch \
> > +           file://0022-Use-SYSTEMLIBS_DIR-replacement-instead-of-hard=
coding.patch \
> > +           file://0023-aarch64-Add-support-for-musl-ldso.patch \
> > +           file://0024-libcc1-fix-libcc1-s-install-path-and-rpath.pat=
ch \
> > +           file://0025-handle-sysroot-support-for-nativesdk-gcc.patch=
 \
> > +           file://0026-Search-target-sysroot-gcc-version-specific-dir=
s-with.patch \
> > +           file://0027-Fix-various-_FOR_BUILD-and-related-variables.p=
atch \
> > +           file://0028-nios2-Define-MUSL_DYNAMIC_LINKER.patch \
> > +           file://0029-Add-ssp_nonshared-to-link-commandline-for-musl=
-targe.patch \
> > +           file://0030-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch \
> > +           file://0031-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLA=
GS.patch \
> > +           file://0032-libgcc_s-Use-alias-for-__cpu_indicator_init-in=
stead-.patch \
> > +           file://0033-sync-gcc-stddef.h-with-musl.patch \
> > +           file://0034-fix-segmentation-fault-in-precompiled-header-g=
enerat.patch \
> > +           file://0035-Fix-for-testsuite-failure.patch \
> > +           file://0036-Re-introduce-spe-commandline-options.patch \
> > +           file://0037-Fix-up-libsanitizer-build-with-master-glibc.pa=
tch \
> > +"
> > +S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/arm-9-branch"
> > +
> > +# For dev release snapshotting
> > +#S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/official-gcc-${RELEASE}=
"
> > +B =3D "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
> > +
> > +# Language Overrides
> > +FORTRAN =3D ""
> > +JAVA =3D ""
> > +
> > +LTO =3D "--enable-lto"
> > +SSP ?=3D "--disable-libssp"
> > +SSP_mingw32 =3D "--enable-libssp"
> > +
> > +EXTRA_OECONF_BASE =3D "\
> > +    ${LTO} \
> > +    ${SSP} \
> > +    --enable-libitm \
> > +    --disable-bootstrap \
> > +    --disable-libmudflap \
> > +    --with-system-zlib \
> > +    ${@'--with-linker-hash-style=3D${LINKER_HASH_STYLE}' if '${LINKER=
_HASH_STYLE}' else ''} \
> > +    --enable-linker-build-id \
> > +    --with-ppl=3Dno \
> > +    --with-cloog=3Dno \
> > +    --enable-checking=3Drelease \
> > +    --enable-cheaders=3Dc_global \
> > +    --without-isl \
> > +"
> > +
> > +EXTRA_OECONF_INITIAL =3D "\
> > +    --disable-libmudflap \
> > +    --disable-libgomp \
> > +    --disable-libitm \
> > +    --disable-libquadmath \
> > +    --with-system-zlib \
> > +    --disable-lto \
> > +    --disable-plugin \
> > +    --enable-linker-build-id \
> > +    --enable-decimal-float=3Dno \
> > +    --without-isl \
> > +    --disable-libssp \
> > +"
> > +
> > +EXTRA_OECONF_append_aarchilp32 =3D " --with-abi=3Dilp32"
> > +
> > +EXTRA_OECONF_PATHS =3D "\
> > +    --with-gxx-include-dir=3D/not/exist{target_includedir}/c++/${BINV=
} \
> > +    --with-sysroot=3D/not/exist \
> > +    --with-build-sysroot=3D${STAGING_DIR_TARGET} \
> > +"
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0001-=
gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch b/meta-arm-toolchain/recipes-devtools=
/gcc/gcc-arm-9.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
> > new file mode 100644
> > index 0000000..9065c30
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0001-gcc-4.3=
.1-ARCH_FLAGS_FOR_TARGET.patch
> > @@ -0,0 +1,42 @@
> > +From 863325ec3c6eb4987be63509ac407b2d13617342 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 08:37:11 +0400
> > +Subject: [PATCH 01/36] gcc-4.3.1: ARCH_FLAGS_FOR_TARGET
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Inappropriate [embedded specific]
> > +---
> > + configure    | 2 +-
> > + configure.ac | 2 +-
> > + 2 files changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/configure b/configure
> > +index abd93a990a9..b121088d778 100755
> > +--- a/configure
> > ++++ b/configure
> > +@@ -7603,7 +7603,7 @@ fi
> > + # for target_alias and gcc doesn't manage it consistently.
> > + target_configargs=3D"--cache-file=3D./config.cache ${target_configar=
gs}"
> > +
> > +-FLAGS_FOR_TARGET=3D
> > ++FLAGS_FOR_TARGET=3D"$ARCH_FLAGS_FOR_TARGET"
> > + case " $target_configdirs " in
> > +  *" newlib "*)
> > +   case " $target_configargs " in
> > +diff --git a/configure.ac b/configure.ac
> > +index 9db4fd14aa2..aad93c4d183 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -3119,7 +3119,7 @@ fi
> > + # for target_alias and gcc doesn't manage it consistently.
> > + target_configargs=3D"--cache-file=3D./config.cache ${target_configar=
gs}"
> > +
> > +-FLAGS_FOR_TARGET=3D
> > ++FLAGS_FOR_TARGET=3D"$ARCH_FLAGS_FOR_TARGET"
> > + case " $target_configdirs " in
> > +  *" newlib "*)
> > +   case " $target_configargs " in
> > +--
> > +2.22.1
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0002-=
gcc-poison-system-directories.patch b/meta-arm-toolchain/recipes-devtools/g=
cc/gcc-arm-9.2/0002-gcc-poison-system-directories.patch
> > new file mode 100644
> > index 0000000..a1116e7
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0002-gcc-poi=
son-system-directories.patch
> > @@ -0,0 +1,203 @@
> > +From 68e78bc15de215fa15c7d8b56bd2e2b0539b34fa Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 08:59:00 +0400
> > +Subject: [PATCH 02/36] gcc: poison-system-directories
> > +
> > +Add /sw/include and /opt/include based on the original
> > +zecke-no-host-includes.patch patch.  The original patch checked for
> > +/usr/include, /sw/include and /opt/include and then triggered a failu=
re and
> > +aborted.
> > +
> > +Instead, we add the two missing items to the current scan.  If the us=
er
> > +wants this to be a failure, they can add "-Werror=3Dpoison-system-dir=
ectories".
> > +
> > +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Pending
> > +---
> > + gcc/common.opt      |  4 ++++
> > + gcc/config.in       |  6 ++++++
> > + gcc/configure       | 16 ++++++++++++++++
> > + gcc/configure.ac    | 10 ++++++++++
> > + gcc/doc/invoke.texi |  9 +++++++++
> > + gcc/gcc.c           |  2 ++
> > + gcc/incpath.c       | 21 +++++++++++++++++++++
> > + 7 files changed, 68 insertions(+)
> > +
> > +diff --git a/gcc/common.opt b/gcc/common.opt
> > +index d342c4f3749..c64fd4a6c50 100644
> > +--- a/gcc/common.opt
> > ++++ b/gcc/common.opt
> > +@@ -684,6 +684,10 @@ Wreturn-local-addr
> > + Common Var(warn_return_local_addr) Init(1) Warning
> > + Warn about returning a pointer/reference to a local or temporary var=
iable.
> > +
> > ++Wpoison-system-directories
> > ++Common Var(flag_poison_system_directories) Init(1) Warning
> > ++Warn for -I and -L options using system directories if cross compili=
ng
> > ++
> > + Wshadow
> > + Common Var(warn_shadow) Warning
> > + Warn when one variable shadows another.  Same as -Wshadow=3Dglobal.
> > +diff --git a/gcc/config.in b/gcc/config.in
> > +index a718ceaf3da..5713342efb1 100644
> > +--- a/gcc/config.in
> > ++++ b/gcc/config.in
> > +@@ -200,6 +200,12 @@
> > + #endif
> > +
> > +
> > ++/* Define to warn for use of native system header directories */
> > ++#ifndef USED_FOR_TARGET
> > ++#undef ENABLE_POISON_SYSTEM_DIRECTORIES
> > ++#endif
> > ++
> > ++
> > + /* Define if you want all operations on RTL (the basic data structur=
e of the
> > +    optimizer and back end) to be checked for dynamic type safety at =
runtime.
> > +    This is quite expensive. */
> > +diff --git a/gcc/configure b/gcc/configure
> > +index 481071b4265..a6ea3a8a84c 100755
> > +--- a/gcc/configure
> > ++++ b/gcc/configure
> > +@@ -995,6 +995,7 @@ with_system_zlib
> > + enable_maintainer_mode
> > + enable_link_mutex
> > + enable_version_specific_runtime_libs
> > ++enable_poison_system_directories
> > + enable_plugin
> > + enable_host_shared
> > + enable_libquadmath_support
> > +@@ -1748,6 +1749,8 @@ Optional Features:
> > +   --enable-version-specific-runtime-libs
> > +                           specify that runtime libraries should be i=
nstalled
> > +                           in a compiler-specific directory
> > ++  --enable-poison-system-directories
> > ++                          warn for use of native system header direc=
tories
> > +   --enable-plugin         enable plugin support
> > +   --enable-host-shared    build host code as shared libraries
> > +   --disable-libquadmath-support
> > +@@ -29750,6 +29753,19 @@ if test "${enable_version_specific_runtime_l=
ibs+set}" =3D set; then :
> > + fi
> > +
> > +
> > ++# Check whether --enable-poison-system-directories was given.
> > ++if test "${enable_poison_system_directories+set}" =3D set; then :
> > ++  enableval=3D$enable_poison_system_directories;
> > ++else
> > ++  enable_poison_system_directories=3Dno
> > ++fi
> > ++
> > ++if test "x${enable_poison_system_directories}" =3D "xyes"; then
> > ++
> > ++$as_echo "#define ENABLE_POISON_SYSTEM_DIRECTORIES 1" >>confdefs.h
> > ++
> > ++fi
> > ++
> > + # Substitute configuration variables
> > +
> > +
> > +diff --git a/gcc/configure.ac b/gcc/configure.ac
> > +index ce2825580c6..d42bbd4fd1c 100644
> > +--- a/gcc/configure.ac
> > ++++ b/gcc/configure.ac
> > +@@ -6378,6 +6378,16 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
> > +                 [specify that runtime libraries should be
> > +                  installed in a compiler-specific directory])])
> > +
> > ++AC_ARG_ENABLE([poison-system-directories],
> > ++             AS_HELP_STRING([--enable-poison-system-directories],
> > ++                            [warn for use of native system header di=
rectories]),,
> > ++             [enable_poison_system_directories=3Dno])
> > ++if test "x${enable_poison_system_directories}" =3D "xyes"; then
> > ++  AC_DEFINE([ENABLE_POISON_SYSTEM_DIRECTORIES],
> > ++           [1],
> > ++           [Define to warn for use of native system header directori=
es])
> > ++fi
> > ++
> > + # Substitute configuration variables
> > + AC_SUBST(subdirs)
> > + AC_SUBST(srcdir)
> > +diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
> > +index 6ef36ce02aa..09414d8cc05 100644
> > +--- a/gcc/doc/invoke.texi
> > ++++ b/gcc/doc/invoke.texi
> > +@@ -332,6 +332,7 @@ Objective-C and Objective-C++ Dialects}.
> > + -Wpacked  -Wpacked-bitfield-compat -Wpacked-not-aligned  -Wpadded @g=
ol
> > + -Wparentheses  -Wno-pedantic-ms-format @gol
> > + -Wplacement-new  -Wplacement-new=3D@var{n} @gol
> > ++-Wno-poison-system-directories @gol
> > + -Wpointer-arith  -Wpointer-compare  -Wno-pointer-to-int-cast @gol
> > + -Wno-pragmas  -Wno-prio-ctor-dtor  -Wredundant-decls @gol
> > + -Wrestrict  -Wno-return-local-addr @gol
> > +@@ -6289,6 +6290,14 @@ made up of data only and thus requires no spec=
ial treatment.  But, for
> > + most targets, it is made up of code and thus requires the stack to b=
e
> > + made executable in order for the program to work properly.
> > +
> > ++@item -Wno-poison-system-directories
> > ++@opindex Wno-poison-system-directories
> > ++Do not warn for @option{-I} or @option{-L} options using system
> > ++directories such as @file{/usr/include} when cross compiling.  This
> > ++option is intended for use in chroot environments when such
> > ++directories contain the correct headers and libraries for the target
> > ++system rather than the host.
> > ++
> > + @item -Wfloat-equal
> > + @opindex Wfloat-equal
> > + @opindex Wno-float-equal
> > +diff --git a/gcc/gcc.c b/gcc/gcc.c
> > +index 4f57765b012..a2601a6bb06 100644
> > +--- a/gcc/gcc.c
> > ++++ b/gcc/gcc.c
> > +@@ -1042,6 +1042,8 @@ proper position among the other output files.  =
*/
> > +    "%{fuse-ld=3D*:-fuse-ld=3D%*} " LINK_COMPRESS_DEBUG_SPEC \
> > +    "%X %{o*} %{e*} %{N} %{n} %{r}\
> > +     %{s} %{t} %{u*} %{z} %{Z} %{!nostdlib:%{!r:%{!nostartfiles:%S}}}=
 \
> > ++    %{Wno-poison-system-directories:--no-poison-system-directories} =
\
> > ++    %{Werror=3Dpoison-system-directories:--error-poison-system-direc=
tories} \
> > +     %{static|no-pie|static-pie:} %@{L*} %(mfwrap) %(link_libgcc) " \
> > +     VTABLE_VERIFICATION_SPEC " " SANITIZER_EARLY_SPEC " %o "" \
> > +     %{fopenacc|fopenmp|%:gt(%{ftree-parallelize-loops=3D*:%*} 1):\
> > +diff --git a/gcc/incpath.c b/gcc/incpath.c
> > +index bcbe2082905..5752298bbf2 100644
> > +--- a/gcc/incpath.c
> > ++++ b/gcc/incpath.c
> > +@@ -26,6 +26,7 @@
> > + #include "intl.h"
> > + #include "incpath.h"
> > + #include "cppdefault.h"
> > ++#include "diagnostic-core.h"
> > +
> > + /* Microsoft Windows does not natively support inodes.
> > +    VMS has non-numeric inodes.  */
> > +@@ -393,6 +394,26 @@ merge_include_chains (const char *sysroot, cpp_r=
eader *pfile, int verbose)
> > +     }
> > +       fprintf (stderr, _("End of search list.\n"));
> > +     }
> > ++
> > ++#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
> > ++  if (flag_poison_system_directories)
> > ++    {
> > ++       struct cpp_dir *p;
> > ++
> > ++       for (p =3D heads[INC_QUOTE]; p; p =3D p->next)
> > ++         {
> > ++          if ((!strncmp (p->name, "/usr/include", 12))
> > ++              || (!strncmp (p->name, "/usr/local/include", 18))
> > ++              || (!strncmp (p->name, "/usr/X11R6/include", 18))
> > ++              || (!strncmp (p->name, "/sw/include", 11))
> > ++              || (!strncmp (p->name, "/opt/include", 12)))
> > ++            warning (OPT_Wpoison_system_directories,
> > ++                     "include location \"%s\" is unsafe for "
> > ++                     "cross-compilation",
> > ++                     p->name);
> > ++         }
> > ++    }
> > ++#endif
> > + }
> > +
> > + /* Use given -I paths for #include "..." but not #include <...>, and
> > +--
> > +2.22.1
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0003-=
gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch b/meta-arm-toolchain/recipes-devt=
ools/gcc/gcc-arm-9.2/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
> > new file mode 100644
> > index 0000000..23039d2
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0003-gcc-4.3=
.3-SYSROOT_CFLAGS_FOR_TARGET.patch
> > @@ -0,0 +1,73 @@
> > +From f8d60c4114acb92361c7b2f4a4561d4661e8da9d Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:08:31 +0400
> > +Subject: [PATCH 03/36] gcc-4.3.3: SYSROOT_CFLAGS_FOR_TARGET
> > +
> > +Before committing, I noticed that PR/32161 was marked as a dup of PR/=
32009, but my previous patch did not fix it.
> > +
> > +This alternative patch is better because it lets you just use CFLAGS_=
FOR_TARGET to set the compilation flags for libgcc. Since bootstrapped targ=
et libraries are never compiled with the native compiler, it makes little s=
ense to use different flags for stage1 and later stages. And it also makes =
little sense to use a different variable than CFLAGS_FOR_TARGET.
> > +
> > +Other changes I had to do include:
> > +
> > +- moving the creation of default CFLAGS_FOR_TARGET from Makefile.am t=
o configure.ac, because otherwise the BOOT_CFLAGS are substituted into CFLA=
GS_FOR_TARGET (which is "-O2 -g $(CFLAGS)") via $(CFLAGS). It is also clean=
er this way though.
> > +
> > +- passing the right CFLAGS to configure scripts as exported environme=
nt variables
> > +
> > +I also stopped passing LIBCFLAGS to configure scripts since they are =
unused in the whole src tree. And I updated the documentation as H-P remind=
ed me to do.
> > +
> > +Bootstrapped/regtested i686-pc-linux-gnu, will commit to 4.4 shortly.=
 Ok for 4.3?
> > +
> > +Signed-off-by: Paolo Bonzini  <bonzini@gnu.org>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Pending
> > +---
> > + configure | 32 ++++++++++++++++++++++++++++++++
> > + 1 file changed, 32 insertions(+)
> > +
> > +diff --git a/configure b/configure
> > +index b121088d778..93aae5bb26f 100755
> > +--- a/configure
> > ++++ b/configure
> > +@@ -6864,6 +6864,38 @@ fi
> > +
> > +
> > +
> > ++# During gcc bootstrap, if we use some random cc for stage1 then CFL=
AGS
> > ++# might be empty or "-g".  We don't require a C++ compiler, so CXXFL=
AGS
> > ++# might also be empty (or "-g", if a non-GCC C++ compiler is in the =
path).
> > ++# We want to ensure that TARGET libraries (which we know are built w=
ith
> > ++# gcc) are built with "-O2 -g", so include those options when settin=
g
> > ++# CFLAGS_FOR_TARGET and CXXFLAGS_FOR_TARGET.
> > ++if test "x$CFLAGS_FOR_TARGET" =3D x; then
> > ++  CFLAGS_FOR_TARGET=3D$CFLAGS
> > ++  case " $CFLAGS " in
> > ++    *" -O2 "*) ;;
> > ++    *) CFLAGS_FOR_TARGET=3D"-O2 $CFLAGS" ;;
> > ++  esac
> > ++  case " $CFLAGS " in
> > ++    *" -g "* | *" -g3 "*) ;;
> > ++    *) CFLAGS_FOR_TARGET=3D"-g $CFLAGS" ;;
> > ++  esac
> > ++fi
> > ++
> > ++
> > ++if test "x$CXXFLAGS_FOR_TARGET" =3D x; then
> > ++  CXXFLAGS_FOR_TARGET=3D$CXXFLAGS
> > ++  case " $CXXFLAGS " in
> > ++    *" -O2 "*) ;;
> > ++    *) CXXFLAGS_FOR_TARGET=3D"-O2 $CXXFLAGS" ;;
> > ++  esac
> > ++  case " $CXXFLAGS " in
> > ++    *" -g "* | *" -g3 "*) ;;
> > ++    *) CXXFLAGS_FOR_TARGET=3D"-g $CXXFLAGS" ;;
> > ++  esac
> > ++fi
> > ++
> > ++
> > + # Handle --with-headers=3DXXX.  If the value is not "yes", the conte=
nts of
> > + # the named directory are copied to $(tooldir)/sys-include.
> > + if test x"${with_headers}" !=3D x && test x"${with_headers}" !=3D xn=
o ; then
> > +--
> > +2.22.1
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0004-=
64-bit-multilib-hack.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-ar=
m-9.2/0004-64-bit-multilib-hack.patch
> > new file mode 100644
> > index 0000000..a79c40c
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0004-64-bit-=
multilib-hack.patch
> > @@ -0,0 +1,119 @@
> > +From c2081c51db589471ea713870c72f13999abda815 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:10:06 +0400
> > +Subject: [PATCH 04/36] 64-bit multilib hack.
> > +
> > +GCC has internal multilib handling code but it assumes a very specifi=
c rigid directory
> > +layout. The build system implementation of multilib layout is very ge=
neric and allows
> > +complete customisation of the library directories.
> > +
> > +This patch is a partial solution to allow any custom directories to b=
e passed into gcc
> > +and handled correctly. It forces gcc to use the base_libdir (which is=
 the current
> > +directory, "."). We need to do this for each multilib that is configu=
red as we don't
> > +know which compiler options may be being passed into the compiler. Si=
nce we have a compiler
> > +per mulitlib at this point that isn't an issue.
> > +
> > +The one problem is the target compiler is only going to work for the =
default multlilib at
> > +this point. Ideally we'd figure out which multilibs were being enable=
d with which paths
> > +and be able to patch these entries with a complete set of correct pat=
hs but this we
> > +don't have such code at this point. This is something the target gcc =
recipe should do
> > +and override these platform defaults in its build config.
> > +
> > +Do same for riscv64 and aarch64
> > +
> > +RP 15/8/11
> > +
> > +Upstream-Status: Inappropriate[OE-Specific]
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
> > +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> > +---
> > + gcc/config/aarch64/t-aarch64-linux |  8 ++++----
> > + gcc/config/i386/t-linux64          |  6 ++----
> > + gcc/config/mips/t-linux64          | 10 +++-------
> > + gcc/config/riscv/t-linux           |  6 ++++--
> > + gcc/config/rs6000/t-linux64        |  5 ++---
> > + 5 files changed, 15 insertions(+), 20 deletions(-)
> > +
> > +diff --git a/gcc/config/aarch64/t-aarch64-linux b/gcc/config/aarch64/=
t-aarch64-linux
> > +index 5ad670ba2ce..e26019e7157 100644
> > +--- a/gcc/config/aarch64/t-aarch64-linux
> > ++++ b/gcc/config/aarch64/t-aarch64-linux
> > +@@ -21,8 +21,8 @@
> > + LIB1ASMSRC   =3D aarch64/lib1funcs.asm
> > + LIB1ASMFUNCS =3D _aarch64_sync_cache_range
> > +
> > +-AARCH_BE =3D $(if $(findstring TARGET_BIG_ENDIAN_DEFAULT=3D1, $(tm_d=
efines)),_be)
> > +-MULTILIB_OSDIRNAMES =3D mabi.lp64=3D../lib64$(call if_multiarch,:aar=
ch64$(AARCH_BE)-linux-gnu)
> > +-MULTIARCH_DIRNAME =3D $(call if_multiarch,aarch64$(AARCH_BE)-linux-g=
nu)
> > ++#AARCH_BE =3D $(if $(findstring TARGET_BIG_ENDIAN_DEFAULT=3D1, $(tm_=
defines)),_be)
> > ++#MULTILIB_OSDIRNAMES =3D mabi.lp64=3D../lib64$(call if_multiarch,:aa=
rch64$(AARCH_BE)-linux-gnu)
> > ++#MULTIARCH_DIRNAME =3D $(call if_multiarch,aarch64$(AARCH_BE)-linux-=
gnu)
> > +
> > +-MULTILIB_OSDIRNAMES +=3D mabi.ilp32=3D../libilp32$(call if_multiarch=
,:aarch64$(AARCH_BE)-linux-gnu_ilp32)
> > ++#MULTILIB_OSDIRNAMES +=3D mabi.ilp32=3D../libilp32$(call if_multiarc=
h,:aarch64$(AARCH_BE)-linux-gnu_ilp32)
> > +diff --git a/gcc/config/i386/t-linux64 b/gcc/config/i386/t-linux64
> > +index c686ab2f0d2..c82b60dadcd 100644
> > +--- a/gcc/config/i386/t-linux64
> > ++++ b/gcc/config/i386/t-linux64
> > +@@ -32,7 +32,5 @@
> > + #
> > + comma=3D,
> > + MULTILIB_OPTIONS    =3D $(subst $(comma),/,$(TM_MULTILIB_CONFIG))
> > +-MULTILIB_DIRNAMES   =3D $(patsubst m%, %, $(subst /, ,$(MULTILIB_OPT=
IONS)))
> > +-MULTILIB_OSDIRNAMES =3D m64=3D../lib64$(call if_multiarch,:x86_64-li=
nux-gnu)
> > +-MULTILIB_OSDIRNAMES+=3D m32=3D$(if $(wildcard $(shell echo $(SYSTEM_=
HEADER_DIR))/../../usr/lib32),../lib32,../lib)$(call if_multiarch,:i386-lin=
ux-gnu)
> > +-MULTILIB_OSDIRNAMES+=3D mx32=3D../libx32$(call if_multiarch,:x86_64-=
linux-gnux32)
> > ++MULTILIB_DIRNAMES =3D . .
> > ++MULTILIB_OSDIRNAMES =3D ../$(shell basename $(base_libdir)) ../$(she=
ll basename $(base_libdir))
> > +diff --git a/gcc/config/mips/t-linux64 b/gcc/config/mips/t-linux64
> > +index 3a2ff700d7d..13ef19576b5 100644
> > +--- a/gcc/config/mips/t-linux64
> > ++++ b/gcc/config/mips/t-linux64
> > +@@ -17,10 +17,6 @@
> > + # <http://www.gnu.org/licenses/>.
> > +
> > + MULTILIB_OPTIONS =3D mabi=3Dn32/mabi=3D32/mabi=3D64
> > +-MULTILIB_DIRNAMES =3D n32 32 64
> > +-MIPS_EL =3D $(if $(filter %el, $(firstword $(subst -, ,$(target)))),=
el)
> > +-MIPS_SOFT =3D $(if $(strip $(filter MASK_SOFT_FLOAT_ABI, $(target_cp=
u_default)) $(filter soft, $(with_float))),soft)
> > +-MULTILIB_OSDIRNAMES =3D \
> > +-    ../lib32$(call if_multiarch,:mips64$(MIPS_EL)-linux-gnuabin32$(M=
IPS_SOFT)) \
> > +-    ../lib$(call if_multiarch,:mips$(MIPS_EL)-linux-gnu$(MIPS_SOFT))=
 \
> > +-    ../lib64$(call if_multiarch,:mips64$(MIPS_EL)-linux-gnuabi64$(MI=
PS_SOFT))
> > ++MULTILIB_DIRNAMES =3D . . .
> > ++MULTILIB_OSDIRNAMES =3D ../$(shell basename $(base_libdir)) ../$(she=
ll basename $(base_libdir)) ../$(shell basename $(base_libdir))
> > ++
> > +diff --git a/gcc/config/riscv/t-linux b/gcc/config/riscv/t-linux
> > +index 216d2776a18..e4d817621fc 100644
> > +--- a/gcc/config/riscv/t-linux
> > ++++ b/gcc/config/riscv/t-linux
> > +@@ -1,3 +1,5 @@
> > + # Only XLEN and ABI affect Linux multilib dir names, e.g. /lib32/ilp=
32d/
> > +-MULTILIB_DIRNAMES :=3D $(patsubst rv32%,lib32,$(patsubst rv64%,lib64=
,$(MULTILIB_DIRNAMES)))
> > +-MULTILIB_OSDIRNAMES :=3D $(patsubst lib%,../lib%,$(MULTILIB_DIRNAMES=
))
> > ++#MULTILIB_DIRNAMES :=3D $(patsubst rv32%,lib32,$(patsubst rv64%,lib6=
4,$(MULTILIB_DIRNAMES)))
> > ++MULTILIB_DIRNAMES :=3D . .
> > ++#MULTILIB_OSDIRNAMES :=3D $(patsubst lib%,../lib%,$(MULTILIB_DIRNAME=
S))
> > ++MULTILIB_OSDIRNAMES :=3D ../$(shell basename $(base_libdir)) ../$(sh=
ell basename $(base_libdir))
> > +diff --git a/gcc/config/rs6000/t-linux64 b/gcc/config/rs6000/t-linux6=
4
> > +index f3c6e2be1d9..bd0393155fa 100644
> > +--- a/gcc/config/rs6000/t-linux64
> > ++++ b/gcc/config/rs6000/t-linux64
> > +@@ -26,10 +26,9 @@
> > + # MULTILIB_OSDIRNAMES according to what is found on the target.
> > +
> > + MULTILIB_OPTIONS    :=3D m64/m32
> > +-MULTILIB_DIRNAMES   :=3D 64 32
> > ++MULTILIB_DIRNAMES   :=3D . .
> > + MULTILIB_EXTRA_OPTS :=3D
> > +-MULTILIB_OSDIRNAMES :=3D m64=3D../lib64$(call if_multiarch,:powerpc6=
4-linux-gnu)
> > +-MULTILIB_OSDIRNAMES +=3D m32=3D$(if $(wildcard $(shell echo $(SYSTEM=
_HEADER_DIR))/../../usr/lib32),../lib32,../lib)$(call if_multiarch,:powerpc=
-linux-gnu)
> > ++MULTILIB_OSDIRNAMES :=3D ../$(shell basename $(base_libdir)) ../$(sh=
ell basename $(base_libdir))
> > +
> > + rs6000-linux.o: $(srcdir)/config/rs6000/rs6000-linux.c
> > +     $(COMPILE) $<
> > +--
> > +2.22.1
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0005-=
optional-libstdc.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.=
2/0005-optional-libstdc.patch
> > new file mode 100644
> > index 0000000..f4fac91
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0005-optiona=
l-libstdc.patch
> > @@ -0,0 +1,125 @@
> > +From e7e504f4a90cfa395e7f8ee779f8c3ed687802ca Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:12:56 +0400
> > +Subject: [PATCH 05/36] optional libstdc
> > +
> > +gcc-runtime builds libstdc++ separately from gcc-cross-*. Its configu=
re tests using g++
> > +will not run correctly since by default the linker will try to link a=
gainst libstdc++
> > +which shouldn't exist yet. We need an option to disable -lstdc++
> > +option whilst leaving -lc, -lgcc and other automatic library dependen=
cies added by gcc
> > +driver. This patch adds such an option which only disables the -lstdc=
++.
> > +
> > +A "standard" gcc build uses xgcc and hence avoids this. We should ask=
 upstream how to
> > +do this officially, the likely answer is don't build libstdc++ separa=
tely.
> > +
> > +RP 29/6/10
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Inappropriate [embedded specific]
> > +---
> > + gcc/c-family/c.opt  |  4 ++++
> > + gcc/cp/g++spec.c    |  1 +
> > + gcc/doc/invoke.texi | 32 +++++++++++++++++++++++++++++++-
> > + gcc/gcc.c           |  1 +
> > + 4 files changed, 37 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/gcc/c-family/c.opt b/gcc/c-family/c.opt
> > +index 916cc67b453..41619fa591c 100644
> > +--- a/gcc/c-family/c.opt
> > ++++ b/gcc/c-family/c.opt
> > +@@ -1952,6 +1952,10 @@ nostdinc++
> > + C++ ObjC++
> > + Do not search standard system include directories for C++.
> > +
> > ++nostdlib++
> > ++Driver
> > ++Do not link standard C++ runtime library
> > ++
> > + o
> > + C ObjC C++ ObjC++ Joined Separate
> > + ; Documented in common.opt
> > +diff --git a/gcc/cp/g++spec.c b/gcc/cp/g++spec.c
> > +index 6c4574a837d..0e2657f00ee 100644
> > +--- a/gcc/cp/g++spec.c
> > ++++ b/gcc/cp/g++spec.c
> > +@@ -137,6 +137,7 @@ lang_specific_driver (struct cl_decoded_option **=
in_decoded_options,
> > +       switch (decoded_options[i].opt_index)
> > +     {
> > +     case OPT_nostdlib:
> > ++    case OPT_nostdlib__:
> > +     case OPT_nodefaultlibs:
> > +       library =3D -1;
> > +       break;
> > +diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
> > +index 09414d8cc05..a43969bc9f0 100644
> > +--- a/gcc/doc/invoke.texi
> > ++++ b/gcc/doc/invoke.texi
> > +@@ -228,6 +228,9 @@ in the following sections.
> > + -fno-weak  -nostdinc++ @gol
> > + -fvisibility-inlines-hidden @gol
> > + -fvisibility-ms-compat @gol
> > ++-fvtable-verify=3D@r{[}std@r{|}preinit@r{|}none@r{]} @gol
> > ++-fvtv-counts -fvtv-debug @gol
> > ++-nostdlib++ @gol
> > + -fext-numeric-literals @gol
> > + -Wabi=3D@var{n}  -Wabi-tag  -Wconversion-null  -Wctor-dtor-privacy @=
gol
> > + -Wdelete-non-virtual-dtor  -Wdeprecated-copy  -Wdeprecated-copy-dtor=
 @gol
> > +@@ -538,7 +541,7 @@ Objective-C and Objective-C++ Dialects}.
> > + -pie  -pthread  -r  -rdynamic @gol
> > + -s  -static  -static-pie  -static-libgcc  -static-libstdc++ @gol
> > + -static-libasan  -static-libtsan  -static-liblsan  -static-libubsan =
@gol
> > +--shared  -shared-libgcc  -symbolic @gol
> > ++-shared  -shared-libgcc  -symbolic -nostdlib++ @gol
> > + -T @var{script}  -Wl,@var{option}  -Xlinker @var{option} @gol
> > + -u @var{symbol}  -z @var{keyword}}
> > +
> > +@@ -13312,6 +13315,33 @@ Specify that the program entry point is @var=
{entry}.  The argument is
> > + interpreted by the linker; the GNU linker accepts either a symbol na=
me
> > + or an address.
> > +
> > ++@item -nostdlib++
> > ++@opindex nostdlib++
> > ++Do not use the standard system C++ runtime libraries when linking.
> > ++Only the libraries you specify will be passed to the linker.
> > ++
> > ++@cindex @option{-lgcc}, use with @option{-nostdlib}
> > ++@cindex @option{-nostdlib} and unresolved references
> > ++@cindex unresolved references and @option{-nostdlib}
> > ++@cindex @option{-lgcc}, use with @option{-nodefaultlibs}
> > ++@cindex @option{-nodefaultlibs} and unresolved references
> > ++@cindex unresolved references and @option{-nodefaultlibs}
> > ++One of the standard libraries bypassed by @option{-nostdlib} and
> > ++@option{-nodefaultlibs} is @file{libgcc.a}, a library of internal su=
broutines
> > ++which GCC uses to overcome shortcomings of particular machines, or s=
pecial
> > ++needs for some languages.
> > ++(@xref{Interface,,Interfacing to GCC Output,gccint,GNU Compiler
> > ++Collection (GCC) Internals},
> > ++for more discussion of @file{libgcc.a}.)
> > ++In most cases, you need @file{libgcc.a} even when you want to avoid
> > ++other standard libraries.  In other words, when you specify @option{=
-nostdlib}
> > ++or @option{-nodefaultlibs} you should usually specify @option{-lgcc}=
 as well.
> > ++This ensures that you have no unresolved references to internal GCC
> > ++library subroutines.
> > ++(An example of such an internal subroutine is @code{__main}, used to=
 ensure C++
> > ++constructors are called; @pxref{Collect2,,@code{collect2}, gccint,
> > ++GNU Compiler Collection (GCC) Internals}.)
> > ++
> > + @item -pie
> > + @opindex pie
> > + Produce a dynamically linked position independent executable on targ=
ets
> > +diff --git a/gcc/gcc.c b/gcc/gcc.c
> > +index a2601a6bb06..cd6c6fc95db 100644
> > +--- a/gcc/gcc.c
> > ++++ b/gcc/gcc.c
> > +@@ -1052,6 +1052,7 @@ proper position among the other output files.  =
*/
> > +     %(mflib) " STACK_SPLIT_SPEC "\
> > +     %{fprofile-arcs|fprofile-generate*|coverage:-lgcov} " SANITIZER_=
SPEC " \
> > +     %{!nostdlib:%{!r:%{!nodefaultlibs:%(link_ssp) %(link_gcc_c_seque=
nce)}}}\
> > ++    %{!nostdlib++:}\
> > +     %{!nostdlib:%{!r:%{!nostartfiles:%E}}} %{T*}  \n%(post_link) }}}=
}}}"
> > + #endif
> > +
> > +--
> > +2.22.1
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0006-=
COLLECT_GCC_OPTIONS.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm=
-9.2/0006-COLLECT_GCC_OPTIONS.patch
> > new file mode 100644
> > index 0000000..9f7e603
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0006-COLLECT=
_GCC_OPTIONS.patch
> > @@ -0,0 +1,38 @@
> > +From b9260cd3ac26b0302824ed466a548464c864d95f Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:16:28 +0400
> > +Subject: [PATCH 06/36] COLLECT_GCC_OPTIONS
> > +
> > +This patch adds --sysroot into COLLECT_GCC_OPTIONS which is used to
> > +invoke collect2.
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Pending
> > +---
> > + gcc/gcc.c | 9 +++++++++
> > + 1 file changed, 9 insertions(+)
> > +
> > +diff --git a/gcc/gcc.c b/gcc/gcc.c
> > +index cd6c6fc95db..7da9c5d457b 100644
> > +--- a/gcc/gcc.c
> > ++++ b/gcc/gcc.c
> > +@@ -4804,6 +4804,15 @@ set_collect_gcc_options (void)
> > +             sizeof ("COLLECT_GCC_OPTIONS=3D") - 1);
> > +
> > +   first_time =3D TRUE;
> > ++#ifdef HAVE_LD_SYSROOT
> > ++  if (target_system_root_changed && target_system_root)
> > ++    {
> > ++      obstack_grow (&collect_obstack, "'--sysroot=3D", sizeof("'--sy=
sroot=3D")-1);
> > ++      obstack_grow (&collect_obstack, target_system_root,strlen(targ=
et_system_root));
> > ++      obstack_grow (&collect_obstack, "'", 1);
> > ++      first_time =3D FALSE;
> > ++    }
> > ++#endif
> > +   for (i =3D 0; (int) i < n_switches; i++)
> > +     {
> > +       const char *const *args;
> > +--
> > +2.22.1
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0007-=
Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch b/meta-arm-toolcha=
in/recipes-devtools/gcc/gcc-arm-9.2/0007-Use-the-defaults.h-in-B-instead-of=
-S-and-t-oe-in-B.patch
> > new file mode 100644
> > index 0000000..28f8fc2
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0007-Use-the=
-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
> > @@ -0,0 +1,96 @@
> > +From 88e728dad53d48c4a19f15e19f66fd23f4820b4a Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:17:25 +0400
> > +Subject: [PATCH 07/36] Use the defaults.h in ${B} instead of ${S}, an=
d t-oe in
> > + ${B}
> > +
> > +Use the defaults.h in ${B} instead of ${S}, and t-oe in ${B}, so that
> > +the source can be shared between gcc-cross-initial,
> > +gcc-cross-intermediate, gcc-cross, gcc-runtime, and also the sdk buil=
d.
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Pending
> > +
> > +While compiling gcc-crosssdk-initial-x86_64 on some host, there is
> > +occasionally failure that test the existance of default.h doesn't
> > +work, the reason is tm_include_list=3D'** defaults.h' rather than
> > +tm_include_list=3D'** ./defaults.h'
> > +
> > +So we add the test condition for this situation.
> > +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > +---
> > + gcc/Makefile.in  | 2 +-
> > + gcc/configure    | 4 ++--
> > + gcc/configure.ac | 4 ++--
> > + gcc/mkconfig.sh  | 4 ++--
> > + 4 files changed, 7 insertions(+), 7 deletions(-)
> > +
> > +diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> > +index 5f43d9de00e..41f0f592ff4 100644
> > +--- a/gcc/Makefile.in
> > ++++ b/gcc/Makefile.in
> > +@@ -540,7 +540,7 @@ TARGET_SYSTEM_ROOT =3D @TARGET_SYSTEM_ROOT@
> > + TARGET_SYSTEM_ROOT_DEFINE =3D @TARGET_SYSTEM_ROOT_DEFINE@
> > +
> > + xmake_file=3D@xmake_file@
> > +-tmake_file=3D@tmake_file@
> > ++tmake_file=3D@tmake_file@ ./t-oe
> > + TM_ENDIAN_CONFIG=3D@TM_ENDIAN_CONFIG@
> > + TM_MULTILIB_CONFIG=3D@TM_MULTILIB_CONFIG@
> > + TM_MULTILIB_EXCEPTIONS_CONFIG=3D@TM_MULTILIB_EXCEPTIONS_CONFIG@
> > +diff --git a/gcc/configure b/gcc/configure
> > +index a6ea3a8a84c..e3bcf8abe9a 100755
> > +--- a/gcc/configure
> > ++++ b/gcc/configure
> > +@@ -12341,8 +12341,8 @@ for f in $tm_file; do
> > +        tm_include_list=3D"${tm_include_list} $f"
> > +        ;;
> > +     defaults.h )
> > +-       tm_file_list=3D"${tm_file_list} \$(srcdir)/$f"
> > +-       tm_include_list=3D"${tm_include_list} $f"
> > ++       tm_file_list=3D"${tm_file_list} ./$f"
> > ++       tm_include_list=3D"${tm_include_list} ./$f"
> > +        ;;
> > +     * )
> > +        tm_file_list=3D"${tm_file_list} \$(srcdir)/config/$f"
> > +diff --git a/gcc/configure.ac b/gcc/configure.ac
> > +index d42bbd4fd1c..2ebc377a74d 100644
> > +--- a/gcc/configure.ac
> > ++++ b/gcc/configure.ac
> > +@@ -1968,8 +1968,8 @@ for f in $tm_file; do
> > +        tm_include_list=3D"${tm_include_list} $f"
> > +        ;;
> > +     defaults.h )
> > +-       tm_file_list=3D"${tm_file_list} \$(srcdir)/$f"
> > +-       tm_include_list=3D"${tm_include_list} $f"
> > ++       tm_file_list=3D"${tm_file_list} ./$f"
> > ++       tm_include_list=3D"${tm_include_list} ./$f"
> > +        ;;
> > +     * )
> > +        tm_file_list=3D"${tm_file_list} \$(srcdir)/config/$f"
> > +diff --git a/gcc/mkconfig.sh b/gcc/mkconfig.sh
> > +index 308b87d0cc1..19068cbc24a 100644
> > +--- a/gcc/mkconfig.sh
> > ++++ b/gcc/mkconfig.sh
> > +@@ -77,7 +77,7 @@ if [ -n "$HEADERS" ]; then
> > +     if [ $# -ge 1 ]; then
> > +     echo '#ifdef IN_GCC' >> ${output}T
> > +     for file in "$@"; do
> > +-        if test x"$file" =3D x"defaults.h"; then
> > ++        if test x"$file" =3D x"./defaults.h" -o x"$file" =3D x"defau=
lts.h"; then
> > +             postpone_defaults_h=3D"yes"
> > +         else
> > +             echo "# include \"$file\"" >> ${output}T
> > +@@ -106,7 +106,7 @@ esac
> > +
> > + # If we postponed including defaults.h, add the #include now.
> > + if test x"$postpone_defaults_h" =3D x"yes"; then
> > +-    echo "# include \"defaults.h\"" >> ${output}T
> > ++    echo "# include \"./defaults.h\"" >> ${output}T
> > + fi
> > +
> > + # Add multiple inclusion protection guard, part two.
> > +--
> > +2.22.1
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0008-=
fortran-cross-compile-hack.patch b/meta-arm-toolchain/recipes-devtools/gcc/=
gcc-arm-9.2/0008-fortran-cross-compile-hack.patch
> > new file mode 100644
> > index 0000000..24e3abe
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0008-fortran=
-cross-compile-hack.patch
> > @@ -0,0 +1,46 @@
> > +From 010f09f2963ede24e85134e5fab2fa627a9afa05 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:20:01 +0400
> > +Subject: [PATCH 08/36] fortran cross-compile hack.
> > +
> > +* Fortran would have searched for arm-angstrom-gnueabi-gfortran but w=
ould have used
> > +used gfortan. For gcc_4.2.2.bb we want to use the gfortran compiler f=
rom our cross
> > +directory.
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Inappropriate [embedded specific]
> > +---
> > + libgfortran/configure    | 2 +-
> > + libgfortran/configure.ac | 2 +-
> > + 2 files changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/libgfortran/configure b/libgfortran/configure
> > +index 60867b93d0e..3fc9fca5b7b 100755
> > +--- a/libgfortran/configure
> > ++++ b/libgfortran/configure
> > +@@ -13071,7 +13071,7 @@ esac
> > +
> > + # We need gfortran to compile parts of the library
> > + #AC_PROG_FC(gfortran)
> > +-FC=3D"$GFORTRAN"
> > ++#FC=3D"$GFORTRAN"
> > + ac_ext=3D${ac_fc_srcext-f}
> > + ac_compile=3D'$FC -c $FCFLAGS $ac_fcflags_srcext conftest.$ac_ext >&=
5'
> > + ac_link=3D'$FC -o conftest$ac_exeext $FCFLAGS $LDFLAGS $ac_fcflags_s=
rcext conftest.$ac_ext $LIBS >&5'
> > +diff --git a/libgfortran/configure.ac b/libgfortran/configure.ac
> > +index 7cfce28ab69..6cd515ee1a4 100644
> > +--- a/libgfortran/configure.ac
> > ++++ b/libgfortran/configure.ac
> > +@@ -250,7 +250,7 @@ AC_SUBST(enable_static)
> > +
> > + # We need gfortran to compile parts of the library
> > + #AC_PROG_FC(gfortran)
> > +-FC=3D"$GFORTRAN"
> > ++#FC=3D"$GFORTRAN"
> > + AC_PROG_FC(gfortran)
> > +
> > + # extra LD Flags which are required for targets
> > +--
> > +2.22.1
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0009-=
cpp-honor-sysroot.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9=
.2/0009-cpp-honor-sysroot.patch
> > new file mode 100644
> > index 0000000..6af0a01
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0009-cpp-hon=
or-sysroot.patch
> > @@ -0,0 +1,54 @@
> > +From 45e9cd39d9c62454d46b9e9473a0c1034ceca15d Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:22:00 +0400
> > +Subject: [PATCH 09/36] cpp: honor sysroot.
> > +
> > +Currently, if the gcc toolchain is relocated and installed from sstat=
e, then you try and compile
> > +preprocessed source (.i or .ii files), the compiler will try and acce=
ss the builtin sysroot location
> > +rather than the --sysroot option specified on the commandline. If acc=
ess to that directory is
> > +permission denied (unreadable), gcc will error.
> > +
> > +This happens when ccache is in use due to the fact it uses preprocess=
ed source files.
> > +
> > +The fix below adds %I to the cpp-output spec macro so the default sub=
stitutions for -iprefix,
> > +-isystem, -isysroot happen and the correct sysroot is used.
> > +
> > +[YOCTO #2074]
> > +
> > +RP 2012/04/13
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Pending
> > +---
> > + gcc/cp/lang-specs.h | 2 +-
> > + gcc/gcc.c           | 2 +-
> > + 2 files changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/gcc/cp/lang-specs.h b/gcc/cp/lang-specs.h
> > +index c6e42eda283..e1ddf066467 100644
> > +--- a/gcc/cp/lang-specs.h
> > ++++ b/gcc/cp/lang-specs.h
> > +@@ -66,5 +66,5 @@ along with GCC; see the file COPYING3.  If not see
> > +   {".ii", "@c++-cpp-output", 0, 0, 0},
> > +   {"@c++-cpp-output",
> > +       "%{!E:%{!M:%{!MM:"
> > +-      "  cc1plus -fpreprocessed %i %(cc1_options) %2"
> > ++      "  cc1plus -fpreprocessed %i %I %(cc1_options) %2"
> > +       "  %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
> > +diff --git a/gcc/gcc.c b/gcc/gcc.c
> > +index 7da9c5d457b..4e7c45b268c 100644
> > +--- a/gcc/gcc.c
> > ++++ b/gcc/gcc.c
> > +@@ -1349,7 +1349,7 @@ static const struct compiler default_compilers[=
] =3D
> > +                                        %W{o*:--output-pch=3D%*}}%V}}=
}}}}}", 0, 0, 0},
> > +   {".i", "@cpp-output", 0, 0, 0},
> > +   {"@cpp-output",
> > +-   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %(cc1_options) %{!fsyntax-=
only:%(invoke_as)}}}}", 0, 0, 0},
> > ++   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %I %(cc1_options) %{!fsynt=
ax-only:%(invoke_as)}}}}", 0, 0, 0},
> > +   {".s", "@assembler", 0, 0, 0},
> > +   {"@assembler",
> > +    "%{!M:%{!MM:%{!E:%{!S:as %(asm_debug) %(asm_options) %i %A }}}}",=
 0, 0, 0},
> > +--
> > +2.22.1
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0010-=
MIPS64-Default-to-N64-ABI.patch b/meta-arm-toolchain/recipes-devtools/gcc/g=
cc-arm-9.2/0010-MIPS64-Default-to-N64-ABI.patch
> > new file mode 100644
> > index 0000000..bc0c6d5
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0010-MIPS64-=
Default-to-N64-ABI.patch
> > @@ -0,0 +1,57 @@
> > +From 1ff4108d707b34e399e9dc418ad1ecc42f72676d Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:23:08 +0400
> > +Subject: [PATCH 10/36] MIPS64: Default to N64 ABI
> > +
> > +MIPS64 defaults to n32 ABI, this patch makes it
> > +so that it defaults to N64 ABI
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Inappropriate [OE config specific]
> > +---
> > + gcc/config.gcc | 10 +++++-----
> > + 1 file changed, 5 insertions(+), 5 deletions(-)
> > +
> > +diff --git a/gcc/config.gcc b/gcc/config.gcc
> > +index ddd3b8f4d9d..fdfc0bd3e82 100644
> > +--- a/gcc/config.gcc
> > ++++ b/gcc/config.gcc
> > +@@ -2282,29 +2282,29 @@ mips*-*-linux*)                              =
# Linux MIPS, either endian.
> > +                     default_mips_arch=3Dmips32
> > +                     ;;
> > +             mips64el-st-linux-gnu)
> > +-                    default_mips_abi=3Dn32
> > ++                    default_mips_abi=3D64
> > +                     tm_file=3D"${tm_file} mips/st.h"
> > +                     tmake_file=3D"${tmake_file} mips/t-st"
> > +                     enable_mips_multilibs=3D"yes"
> > +                     ;;
> > +             mips64octeon*-*-linux*)
> > +-                    default_mips_abi=3Dn32
> > ++                    default_mips_abi=3D64
> > +                     tm_defines=3D"${tm_defines} MIPS_CPU_STRING_DEFA=
ULT=3D\\\"octeon\\\""
> > +                     target_cpu_default=3DMASK_SOFT_FLOAT_ABI
> > +                     enable_mips_multilibs=3D"yes"
> > +                     ;;
> > +             mipsisa64r6*-*-linux*)
> > +-                    default_mips_abi=3Dn32
> > ++                    default_mips_abi=3D64
> > +                     default_mips_arch=3Dmips64r6
> > +                     enable_mips_multilibs=3D"yes"
> > +                     ;;
> > +             mipsisa64r2*-*-linux*)
> > +-                    default_mips_abi=3Dn32
> > ++                    default_mips_abi=3D64
> > +                     default_mips_arch=3Dmips64r2
> > +                     enable_mips_multilibs=3D"yes"
> > +                     ;;
> > +             mips64*-*-linux* | mipsisa64*-*-linux*)
> > +-                    default_mips_abi=3Dn32
> > ++                    default_mips_abi=3D64
> > +                     enable_mips_multilibs=3D"yes"
> > +                     ;;
> > +     esac
> > +--
> > +2.22.1
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0011-=
Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta-arm-toolc=
hain/recipes-devtools/gcc/gcc-arm-9.2/0011-Define-GLIBC_DYNAMIC_LINKER-and-=
UCLIBC_DYNAMIC_LINKE.patch
> > new file mode 100644
> > index 0000000..66fb24d
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0011-Define-=
GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> > @@ -0,0 +1,243 @@
> > +From 72fc3975bcd720b2f8040fa87cd23d3db4c5975a Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:24:50 +0400
> > +Subject: [PATCH] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKE=
R
> > + relative to SYSTEMLIBS_DIR
> > +
> > +This patch defines GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
> > +relative to SYSTEMLIBS_DIR which can be set in generated headers
> > +This breaks the assumption of hardcoded multilib in gcc
> > +Change is only for the supported architectures in OE including
> > +SH, sparc, alpha for possible future support (if any)
> > +
> > +Removes the do_headerfix task in metadata
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Inappropriate [OE configuration]
> > +---
> > + gcc/config/alpha/linux-elf.h |  4 ++--
> > + gcc/config/arm/linux-eabi.h  |  4 ++--
> > + gcc/config/arm/linux-elf.h   |  2 +-
> > + gcc/config/i386/linux.h      |  2 +-
> > + gcc/config/i386/linux64.h    |  6 +++---
> > + gcc/config/linux.h           |  8 ++++----
> > + gcc/config/mips/linux.h      | 12 ++++++------
> > + gcc/config/riscv/linux.h     |  2 +-
> > + gcc/config/rs6000/linux64.h  | 15 +++++----------
> > + gcc/config/sh/linux.h        |  2 +-
> > + gcc/config/sparc/linux.h     |  2 +-
> > + gcc/config/sparc/linux64.h   |  4 ++--
> > + 12 files changed, 29 insertions(+), 34 deletions(-)
> > +
> > +diff --git a/gcc/config/alpha/linux-elf.h b/gcc/config/alpha/linux-el=
f.h
> > +index 824861befec..6afacce3292 100644
> > +--- a/gcc/config/alpha/linux-elf.h
> > ++++ b/gcc/config/alpha/linux-elf.h
> > +@@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.  If not see
> > + #define EXTRA_SPECS \
> > + { "elf_dynamic_linker", ELF_DYNAMIC_LINKER },
> > +
> > +-#define GLIBC_DYNAMIC_LINKER        "/lib/ld-linux.so.2"
> > +-#define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
> > ++#define GLIBC_DYNAMIC_LINKER        SYSTEMLIBS_DIR "ld-linux.so.2"
> > ++#define UCLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-uClibc.so.0"
> > + #if DEFAULT_LIBC =3D=3D LIBC_UCLIBC
> > + #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
> > + #elif DEFAULT_LIBC =3D=3D LIBC_GLIBC
> > +diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.=
h
> > +index 66ec0ea3980..e4ade2e2ab0 100644
> > +--- a/gcc/config/arm/linux-eabi.h
> > ++++ b/gcc/config/arm/linux-eabi.h
> > +@@ -65,8 +65,8 @@
> > +    GLIBC_DYNAMIC_LINKER_DEFAULT and TARGET_DEFAULT_FLOAT_ABI.  */
> > +
> > + #undef  GLIBC_DYNAMIC_LINKER
> > +-#define GLIBC_DYNAMIC_LINKER_SOFT_FLOAT "/lib/ld-linux.so.3"
> > +-#define GLIBC_DYNAMIC_LINKER_HARD_FLOAT "/lib/ld-linux-armhf.so.3"
> > ++#define GLIBC_DYNAMIC_LINKER_SOFT_FLOAT SYSTEMLIBS_DIR "ld-linux.so.=
3"
> > ++#define GLIBC_DYNAMIC_LINKER_HARD_FLOAT SYSTEMLIBS_DIR "ld-linux-arm=
hf.so.3"
> > + #define GLIBC_DYNAMIC_LINKER_DEFAULT GLIBC_DYNAMIC_LINKER_SOFT_FLOAT
> > +
> > + #define GLIBC_DYNAMIC_LINKER \
> > +diff --git a/gcc/config/arm/linux-elf.h b/gcc/config/arm/linux-elf.h
> > +index 9a360defd21..98f6e960b64 100644
> > +--- a/gcc/config/arm/linux-elf.h
> > ++++ b/gcc/config/arm/linux-elf.h
> > +@@ -60,7 +60,7 @@
> > +
> > + #define LIBGCC_SPEC "%{mfloat-abi=3Dsoft*:-lfloat} -lgcc"
> > +
> > +-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
> > ++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
> > +
> > + #define LINUX_TARGET_LINK_SPEC  "%{h*} \
> > +    %{static:-Bstatic} \
> > +diff --git a/gcc/config/i386/linux.h b/gcc/config/i386/linux.h
> > +index 9a6e2d99896..31efbb73016 100644
> > +--- a/gcc/config/i386/linux.h
> > ++++ b/gcc/config/i386/linux.h
> > +@@ -20,7 +20,7 @@ along with GCC; see the file COPYING3.  If not see
> > + <http://www.gnu.org/licenses/>.  */
> > +
> > + #define GNU_USER_LINK_EMULATION "elf_i386"
> > +-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
> > ++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
> > +
> > + #undef MUSL_DYNAMIC_LINKER
> > + #define MUSL_DYNAMIC_LINKER "/lib/ld-musl-i386.so.1"
> > +diff --git a/gcc/config/i386/linux64.h b/gcc/config/i386/linux64.h
> > +index c08221c4210..dbb474d792b 100644
> > +--- a/gcc/config/i386/linux64.h
> > ++++ b/gcc/config/i386/linux64.h
> > +@@ -27,9 +27,9 @@ see the files COPYING3 and COPYING.RUNTIME respecti=
vely.  If not, see
> > + #define GNU_USER_LINK_EMULATION64 "elf_x86_64"
> > + #define GNU_USER_LINK_EMULATIONX32 "elf32_x86_64"
> > +
> > +-#define GLIBC_DYNAMIC_LINKER32 "/lib/ld-linux.so.2"
> > +-#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux-x86-64.so.2"
> > +-#define GLIBC_DYNAMIC_LINKERX32 "/libx32/ld-linux-x32.so.2"
> > ++#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-linux.so.2"
> > ++#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux-x86-64.so.2"
> > ++#define GLIBC_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ld-linux-x32.so.2"
> > +
> > + #undef MUSL_DYNAMIC_LINKER32
> > + #define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-i386.so.1"
> > +diff --git a/gcc/config/linux.h b/gcc/config/linux.h
> > +index c3c4a219e67..4b05d8e93d1 100644
> > +--- a/gcc/config/linux.h
> > ++++ b/gcc/config/linux.h
> > +@@ -94,10 +94,10 @@ see the files COPYING3 and COPYING.RUNTIME respec=
tively.  If not, see
> > +    GLIBC_DYNAMIC_LINKER must be defined for each target using them, =
or
> > +    GLIBC_DYNAMIC_LINKER32 and GLIBC_DYNAMIC_LINKER64 for targets
> > +    supporting both 32-bit and 64-bit compilation.  */
> > +-#define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
> > +-#define UCLIBC_DYNAMIC_LINKER32 "/lib/ld-uClibc.so.0"
> > +-#define UCLIBC_DYNAMIC_LINKER64 "/lib/ld64-uClibc.so.0"
> > +-#define UCLIBC_DYNAMIC_LINKERX32 "/lib/ldx32-uClibc.so.0"
> > ++#define UCLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-uClibc.so.0"
> > ++#define UCLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-uClibc.so.0"
> > ++#define UCLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld64-uClibc.so.0"
> > ++#define UCLIBC_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ldx32-uClibc.so.0"
> > + #define BIONIC_DYNAMIC_LINKER "/system/bin/linker"
> > + #define BIONIC_DYNAMIC_LINKER32 "/system/bin/linker"
> > + #define BIONIC_DYNAMIC_LINKER64 "/system/bin/linker64"
> > +diff --git a/gcc/config/mips/linux.h b/gcc/config/mips/linux.h
> > +index 6f79ac9c01a..25de96f9561 100644
> > +--- a/gcc/config/mips/linux.h
> > ++++ b/gcc/config/mips/linux.h
> > +@@ -22,20 +22,20 @@ along with GCC; see the file COPYING3.  If not se=
e
> > + #define GNU_USER_LINK_EMULATIONN32 "elf32%{EB:b}%{EL:l}tsmipn32"
> > +
> > + #define GLIBC_DYNAMIC_LINKER32 \
> > +-  "%{mnan=3D2008:/lib/ld-linux-mipsn8.so.1;:/lib/ld.so.1}"
> > ++  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld-linux-mipsn8.so.1;:" SYSTEMLIB=
S_DIR "ld.so.1}"
> > + #define GLIBC_DYNAMIC_LINKER64 \
> > +-  "%{mnan=3D2008:/lib64/ld-linux-mipsn8.so.1;:/lib64/ld.so.1}"
> > ++  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld-linux-mipsn8.so.1;:" SYSTEMLIB=
S_DIR "ld.so.1}"
> > + #define GLIBC_DYNAMIC_LINKERN32 \
> > +-  "%{mnan=3D2008:/lib32/ld-linux-mipsn8.so.1;:/lib32/ld.so.1}"
> > ++  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld-linux-mipsn8.so.1;:" SYSTEMLIB=
S_DIR "ld.so.1}"
> > +
> > + #undef UCLIBC_DYNAMIC_LINKER32
> > + #define UCLIBC_DYNAMIC_LINKER32 \
> > +-  "%{mnan=3D2008:/lib/ld-uClibc-mipsn8.so.0;:/lib/ld-uClibc.so.0}"
> > ++  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld-uClibc-mipsn8.so.0;:" SYSTEMLI=
BS_DIR "ld-uClibc.so.0}"
> > + #undef UCLIBC_DYNAMIC_LINKER64
> > + #define UCLIBC_DYNAMIC_LINKER64 \
> > +-  "%{mnan=3D2008:/lib/ld64-uClibc-mipsn8.so.0;:/lib/ld64-uClibc.so.0=
}"
> > ++  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld64-uClibc-mipsn8.so.0;:" SYSTEM=
LIBS_DIR "ld64-uClibc.so.0}"
> > + #define UCLIBC_DYNAMIC_LINKERN32 \
> > +-  "%{mnan=3D2008:/lib32/ld-uClibc-mipsn8.so.0;:/lib32/ld-uClibc.so.0=
}"
> > ++  "%{mnan=3D2008:" SYSTEMLIBS_DIR "ld-uClibc-mipsn8.so.0;:" SYSTEMLI=
BS_DIR "ld-uClibc.so.0}"
> > +
> > + #undef MUSL_DYNAMIC_LINKER32
> > + #define MUSL_DYNAMIC_LINKER32 \
> > +diff --git a/gcc/config/riscv/linux.h b/gcc/config/riscv/linux.h
> > +index 58dd18b89f3..112ba9cd764 100644
> > +--- a/gcc/config/riscv/linux.h
> > ++++ b/gcc/config/riscv/linux.h
> > +@@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.  If not see
> > +     GNU_USER_TARGET_OS_CPP_BUILTINS();                              =
\
> > +   } while (0)
> > +
> > +-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-riscv" XLEN_SPEC "-" ABI=
_SPEC ".so.1"
> > ++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux-riscv" XLEN_SP=
EC "-" ABI_SPEC ".so.1"
> > +
> > + #define MUSL_ABI_SUFFIX \
> > +   "%{mabi=3Dilp32:-sf}" \
> > +diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.=
h
> > +index 9946d3fed94..45a9a7cae59 100644
> > +--- a/gcc/config/rs6000/linux64.h
> > ++++ b/gcc/config/rs6000/linux64.h
> > +@@ -423,24 +423,19 @@ extern int dot_symbols;
> > + #undef      LINK_OS_DEFAULT_SPEC
> > + #define LINK_OS_DEFAULT_SPEC "%(link_os_linux)"
> > +
> > +-#define GLIBC_DYNAMIC_LINKER32 "%(dynamic_linker_prefix)/lib/ld.so.1=
"
> > +-
> > ++#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld.so.1"
> > + #ifdef LINUX64_DEFAULT_ABI_ELFv2
> > +-#define GLIBC_DYNAMIC_LINKER64 \
> > +-"%{mabi=3Delfv1:%(dynamic_linker_prefix)/lib64/ld64.so.1;" \
> > +-":%(dynamic_linker_prefix)/lib64/ld64.so.2}"
> > ++#define GLIBC_DYNAMIC_LINKER64 "%{mabi=3Delfv1:" SYSTEMLIBS_DIR "ld6=
4.so.1;:" SYSTEMLIBS_DIR "ld64.so.2}"
> > + #else
> > +-#define GLIBC_DYNAMIC_LINKER64 \
> > +-"%{mabi=3Delfv2:%(dynamic_linker_prefix)/lib64/ld64.so.2;" \
> > +-":%(dynamic_linker_prefix)/lib64/ld64.so.1}"
> > ++#define GLIBC_DYNAMIC_LINKER64 "%{mabi=3Delfv2:" SYSTEMLIBS_DIR "ld6=
4.so.2;:" SYSTEMLIBS_DIR "ld64.so.1}"
> > + #endif
> > +
> > + #undef MUSL_DYNAMIC_LINKER32
> > + #define MUSL_DYNAMIC_LINKER32 \
> > +-  "/lib/ld-musl-powerpc" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}.s=
o.1"
> > ++  SYSTEMLIBS_DIR "ld-musl-powerpc" MUSL_DYNAMIC_LINKER_E "%{msoft-fl=
oat:-sf}.so.1"
> > + #undef MUSL_DYNAMIC_LINKER64
> > + #define MUSL_DYNAMIC_LINKER64 \
> > +-  "/lib/ld-musl-powerpc64" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}=
.so.1"
> > ++  SYSTEMLIBS_DIR "ld-musl-powerpc64" MUSL_DYNAMIC_LINKER_E "%{msoft-=
float:-sf}.so.1"
> > +
> > + #undef  DEFAULT_ASM_ENDIAN
> > + #if (TARGET_DEFAULT & MASK_LITTLE_ENDIAN)
> > +diff --git a/gcc/config/sh/linux.h b/gcc/config/sh/linux.h
> > +index c9897b7aca5..82f275319cc 100644
> > +--- a/gcc/config/sh/linux.h
> > ++++ b/gcc/config/sh/linux.h
> > +@@ -64,7 +64,7 @@ along with GCC; see the file COPYING3.  If not see
> > +   "/lib/ld-musl-sh" MUSL_DYNAMIC_LINKER_E MUSL_DYNAMIC_LINKER_FP \
> > +   "%{mfdpic:-fdpic}.so.1"
> > +
> > +-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
> > ++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
> > +
> > + #undef SUBTARGET_LINK_EMUL_SUFFIX
> > + #define SUBTARGET_LINK_EMUL_SUFFIX "%{mfdpic:_fd;:_linux}"
> > +diff --git a/gcc/config/sparc/linux.h b/gcc/config/sparc/linux.h
> > +index 08476f1d94d..80440e712ad 100644
> > +--- a/gcc/config/sparc/linux.h
> > ++++ b/gcc/config/sparc/linux.h
> > +@@ -84,7 +84,7 @@ extern const char *host_detect_local_cpu (int argc,=
 const char **argv);
> > +    When the -shared link option is used a final link is not being
> > +    done.  */
> > +
> > +-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
> > ++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
> > +
> > + #undef  LINK_SPEC
> > + #define LINK_SPEC "-m elf32_sparc %{shared:-shared} \
> > +diff --git a/gcc/config/sparc/linux64.h b/gcc/config/sparc/linux64.h
> > +index 789d1df4bd5..b920c680fb1 100644
> > +--- a/gcc/config/sparc/linux64.h
> > ++++ b/gcc/config/sparc/linux64.h
> > +@@ -84,8 +84,8 @@ along with GCC; see the file COPYING3.  If not see
> > +    When the -shared link option is used a final link is not being
> > +    done.  */
> > +
> > +-#define GLIBC_DYNAMIC_LINKER32 "/lib/ld-linux.so.2"
> > +-#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux.so.2"
> > ++#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-linux.so.2"
> > ++#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux.so.2"
> > +
> > + #ifdef SPARC_BI_ARCH
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0012-=
gcc-Fix-argument-list-too-long-error.patch b/meta-arm-toolchain/recipes-dev=
tools/gcc/gcc-arm-9.2/0012-gcc-Fix-argument-list-too-long-error.patch
> > new file mode 100644
> > index 0000000..6053979
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0012-gcc-Fix=
-argument-list-too-long-error.patch
> > @@ -0,0 +1,40 @@
> > +From 2cb227cd8069c73242286f64183fb203f8d2618a Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:26:37 +0400
> > +Subject: [PATCH 12/36] gcc: Fix argument list too long error.
> > +
> > +There would be an "Argument list too long" error when the
> > +build directory is longer than 200, this is caused by:
> > +
> > +headers=3D`echo $(PLUGIN_HEADERS) | tr ' ' '\012' | sort -u`
> > +
> > +The PLUGIN_HEADERS is too long before sort, so the "echo" can't handl=
e
> > +it, use the $(sort list) of GNU make which can handle the too long li=
st
> > +would fix the problem, the header would be short enough after sorted.
> > +The "tr ' ' '\012'" was used for translating the space to "\n", the
> > +$(sort list) doesn't need this.
> > +
> > +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Pending
> > +---
> > + gcc/Makefile.in | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> > +index 41f0f592ff4..0064a282488 100644
> > +--- a/gcc/Makefile.in
> > ++++ b/gcc/Makefile.in
> > +@@ -3537,7 +3537,7 @@ install-plugin: installdirs lang.install-plugin=
 s-header-vars install-gengtype
> > + # We keep the directory structure for files in config or c-family an=
d .def
> > + # files. All other files are flattened to a single directory.
> > +     $(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
> > +-    headers=3D`echo $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.de=
f) | tr ' ' '\012' | sort -u`; \
> > ++    headers=3D"$(sort $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.=
def))"; \
> > +     srcdirstrip=3D`echo "$(srcdir)" | sed 's/[].[^$$\\*|]/\\\\&/g'`;=
 \
> > +     for file in $$headers; do \
> > +       if [ -f $$file ] ; then \
> > +--
> > +2.22.1
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0013-=
Disable-sdt.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/001=
3-Disable-sdt.patch
> > new file mode 100644
> > index 0000000..a21a63c
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0013-Disable=
-sdt.patch
> > @@ -0,0 +1,113 @@
> > +From aea5ffa9d704f4eb8fa93366884d3c26a1dbec49 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:28:10 +0400
> > +Subject: [PATCH 13/36] Disable sdt.
> > +
> > +We don't list dtrace in DEPENDS so we shouldn't be depending on this =
header.
> > +It may or may not exist from preivous builds though. To be determinst=
ic, disable
> > +sdt.h usage always. This avoids build failures if the header is remov=
ed after configure
> > +but before libgcc is compiled for example.
> > +
> > +RP 2012/8/7
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Disable sdt for libstdc++-v3.
> > +
> > +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > +
> > +Upstream-Status: Inappropriate [hack]
> > +---
> > + gcc/configure             | 12 ++++++------
> > + gcc/configure.ac          | 18 +++++++++---------
> > + libstdc++-v3/configure    |  6 +++---
> > + libstdc++-v3/configure.ac |  2 +-
> > + 4 files changed, 19 insertions(+), 19 deletions(-)
> > +
> > +diff --git a/gcc/configure b/gcc/configure
> > +index e3bcf8abe9a..1f1d22ca666 100755
> > +--- a/gcc/configure
> > ++++ b/gcc/configure
> > +@@ -29332,12 +29332,12 @@ fi
> > + { $as_echo "$as_me:${as_lineno-$LINENO}: checking sys/sdt.h in the t=
arget C library" >&5
> > + $as_echo_n "checking sys/sdt.h in the target C library... " >&6; }
> > + have_sys_sdt_h=3Dno
> > +-if test -f $target_header_dir/sys/sdt.h; then
> > +-  have_sys_sdt_h=3Dyes
> > +-
> > +-$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
> > +-
> > +-fi
> > ++#if test -f $target_header_dir/sys/sdt.h; then
> > ++#  have_sys_sdt_h=3Dyes
> > ++#
> > ++#$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
> > ++#
> > ++#fi
> > + { $as_echo "$as_me:${as_lineno-$LINENO}: result: $have_sys_sdt_h" >&=
5
> > + $as_echo "$have_sys_sdt_h" >&6; }
> > +
> > +diff --git a/gcc/configure.ac b/gcc/configure.ac
> > +index 2ebc377a74d..ddc85197588 100644
> > +--- a/gcc/configure.ac
> > ++++ b/gcc/configure.ac
> > +@@ -5995,15 +5995,15 @@ fi
> > + AC_SUBST([enable_default_ssp])
> > +
> > + # Test for <sys/sdt.h> on the target.
> > +-GCC_TARGET_TEMPLATE([HAVE_SYS_SDT_H])
> > +-AC_MSG_CHECKING(sys/sdt.h in the target C library)
> > +-have_sys_sdt_h=3Dno
> > +-if test -f $target_header_dir/sys/sdt.h; then
> > +-  have_sys_sdt_h=3Dyes
> > +-  AC_DEFINE(HAVE_SYS_SDT_H, 1,
> > +-            [Define if your target C library provides sys/sdt.h])
> > +-fi
> > +-AC_MSG_RESULT($have_sys_sdt_h)
> > ++#GCC_TARGET_TEMPLATE([HAVE_SYS_SDT_H])
> > ++#AC_MSG_CHECKING(sys/sdt.h in the target C library)
> > ++#have_sys_sdt_h=3Dno
> > ++#if test -f $target_header_dir/sys/sdt.h; then
> > ++#  have_sys_sdt_h=3Dyes
> > ++#  AC_DEFINE(HAVE_SYS_SDT_H, 1,
> > ++#            [Define if your target C library provides sys/sdt.h])
> > ++#fi
> > ++#AC_MSG_RESULT($have_sys_sdt_h)
> > +
> > + # Check if TFmode long double should be used by default or not.
> > + # Some glibc targets used DFmode long double, but with glibc 2.4
> > +diff --git a/libstdc++-v3/configure b/libstdc++-v3/configure
> > +index 5acf79cba54..191bc6c5796 100755
> > +--- a/libstdc++-v3/configure
> > ++++ b/libstdc++-v3/configure
> > +@@ -22085,11 +22085,11 @@ ac_compile=3D'$CC -c $CFLAGS $CPPFLAGS conf=
test.$ac_ext >&5'
> > + ac_link=3D'$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conf=
test.$ac_ext $LIBS >&5'
> > + ac_compiler_gnu=3D$ac_cv_c_compiler_gnu
> > +
> > +-  if test $glibcxx_cv_sys_sdt_h =3D yes; then
> > ++#  if test $glibcxx_cv_sys_sdt_h =3D yes; then
> > +
> > +-$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
> > ++#$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
> > +
> > +-  fi
> > ++#  fi
> > +   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $glibcxx_cv_sys_s=
dt_h" >&5
> > + $as_echo "$glibcxx_cv_sys_sdt_h" >&6; }
> > +
> > +diff --git a/libstdc++-v3/configure.ac b/libstdc++-v3/configure.ac
> > +index dadd8827b49..6b1ce9957d3 100644
> > +--- a/libstdc++-v3/configure.ac
> > ++++ b/libstdc++-v3/configure.ac
> > +@@ -230,7 +230,7 @@ GLIBCXX_CHECK_SC_NPROCESSORS_ONLN
> > + GLIBCXX_CHECK_SC_NPROC_ONLN
> > + GLIBCXX_CHECK_PTHREADS_NUM_PROCESSORS_NP
> > + GLIBCXX_CHECK_SYSCTL_HW_NCPU
> > +-GLIBCXX_CHECK_SDT_H
> > ++#GLIBCXX_CHECK_SDT_H
> > +
> > + # Check for available headers.
> > + AC_CHECK_HEADERS([endian.h execinfo.h float.h fp.h ieeefp.h inttypes=
.h \
> > +--
> > +2.22.1
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0014-=
libtool.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0014-li=
btool.patch
> > new file mode 100644
> > index 0000000..7a8f3af
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0014-libtool=
.patch
> > @@ -0,0 +1,42 @@
> > +From 6c4d0c303ebc3e1c7e554d54a8bb807d77ed41fd Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:29:11 +0400
> > +Subject: [PATCH 14/36] libtool
> > +
> > +libstdc++ from gcc-runtime gets created with -rpath=3D/usr/lib/../lib=
 for qemux86-64
> > +when running on am x86_64 build host.
> > +
> > +This patch stops this speading to libdir in the libstdc++.la file wit=
hin libtool.
> > +Arguably, it shouldn't be passing this into libtool in the first plac=
e but
> > +for now this resolves the nastiest problems this causes.
> > +
> > +func_normal_abspath would resolve an empty path to `pwd` so we need
> > +to filter the zero case.
> > +
> > +RP 2012/8/24
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Pending
> > +---
> > + ltmain.sh | 4 ++++
> > + 1 file changed, 4 insertions(+)
> > +
> > +diff --git a/ltmain.sh b/ltmain.sh
> > +index 79f9ba89af5..8e222f7c16b 100644
> > +--- a/ltmain.sh
> > ++++ b/ltmain.sh
> > +@@ -6359,6 +6359,10 @@ func_mode_link ()
> > +     func_warning "ignoring multiple \`-rpath's for a libtool library=
"
> > +
> > +       install_libdir=3D"$1"
> > ++      if test -n "$install_libdir"; then
> > ++    func_normal_abspath "$install_libdir"
> > ++    install_libdir=3D$func_normal_abspath_result
> > ++      fi
> > +
> > +       oldlibs=3D
> > +       if test -z "$rpath"; then
> > +--
> > +2.22.1
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0015-=
gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch b/meta-arm-toolchai=
n/recipes-devtools/gcc/gcc-arm-9.2/0015-gcc-armv4-pass-fix-v4bx-to-linker-t=
o-support-EABI.patch
> > new file mode 100644
> > index 0000000..d06ae27
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0015-gcc-arm=
v4-pass-fix-v4bx-to-linker-to-support-EABI.patch
> > @@ -0,0 +1,43 @@
> > +From c5662ff1e7dea2291b9cb7a83cfff3001dd31f53 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:30:32 +0400
> > +Subject: [PATCH 15/36] gcc: armv4: pass fix-v4bx to linker to support=
 EABI.
> > +
> > +The LINK_SPEC for linux gets overwritten by linux-eabi.h which
> > +means the value of TARGET_FIX_V4BX_SPEC gets lost and as a result
> > +the option is not passed to linker when chosing march=3Darmv4
> > +This patch redefines this in linux-eabi.h and reinserts it
> > +for eabi defaulting toolchains.
> > +
> > +We might want to send it upstream.
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Pending
> > +---
> > + gcc/config/arm/linux-eabi.h | 6 +++++-
> > + 1 file changed, 5 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.=
h
> > +index e4ade2e2ab0..108863f69d2 100644
> > +--- a/gcc/config/arm/linux-eabi.h
> > ++++ b/gcc/config/arm/linux-eabi.h
> > +@@ -91,10 +91,14 @@
> > + #define MUSL_DYNAMIC_LINKER \
> > +   "/lib/ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=3Dhard:hf}.=
so.1"
> > +
> > ++/* For armv4 we pass --fix-v4bx to linker to support EABI */
> > ++#undef TARGET_FIX_V4BX_SPEC
> > ++#define TARGET_FIX_V4BX_SPEC "%{mcpu=3Darm8|mcpu=3Darm810|mcpu=3Dstr=
ongarm*|march=3Darmv4: --fix-v4bx}"
> > ++
> > + /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
> > +    use the GNU/Linux version, not the generic BPABI version.  */
> > + #undef  LINK_SPEC
> > +-#define LINK_SPEC EABI_LINK_SPEC                                    =
\
> > ++#define LINK_SPEC TARGET_FIX_V4BX_SPEC EABI_LINK_SPEC               =
        \
> > +   LINUX_OR_ANDROID_LD (LINUX_TARGET_LINK_SPEC,                      =
        \
> > +                    LINUX_TARGET_LINK_SPEC " " ANDROID_LINK_SPEC)
> > +
> > +--
> > +2.22.1
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0016-=
Use-the-multilib-config-files-from-B-instead-of-usin.patch b/meta-arm-toolc=
hain/recipes-devtools/gcc/gcc-arm-9.2/0016-Use-the-multilib-config-files-fr=
om-B-instead-of-usin.patch
> > new file mode 100644
> > index 0000000..310caec
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0016-Use-the=
-multilib-config-files-from-B-instead-of-usin.patch
> > @@ -0,0 +1,102 @@
> > +From e3b693b9d6dc9496f7c98a13b28182d23084215c Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:33:04 +0400
> > +Subject: [PATCH 16/36] Use the multilib config files from ${B} instea=
d of
> > + using the ones from ${S}
> > +
> > +Use the multilib config files from ${B} instead of using the ones fro=
m ${S}
> > +so that the source can be shared between gcc-cross-initial,
> > +gcc-cross-intermediate, gcc-cross, gcc-runtime, and also the sdk buil=
d.
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> > +
> > +Upstream-Status: Inappropriate [configuration]
> > +---
> > + gcc/configure    | 22 ++++++++++++++++++----
> > + gcc/configure.ac | 22 ++++++++++++++++++----
> > + 2 files changed, 36 insertions(+), 8 deletions(-)
> > +
> > +diff --git a/gcc/configure b/gcc/configure
> > +index 1f1d22ca666..911de2cf017 100755
> > +--- a/gcc/configure
> > ++++ b/gcc/configure
> > +@@ -12321,10 +12321,20 @@ done
> > + tmake_file_=3D
> > + for f in ${tmake_file}
> > + do
> > +-    if test -f ${srcdir}/config/$f
> > +-    then
> > +-            tmake_file_=3D"${tmake_file_} \$(srcdir)/config/$f"
> > +-    fi
> > ++  case $f in
> > ++    */t-linux64 )
> > ++       if test -f ./config/$f
> > ++       then
> > ++         tmake_file_=3D"${tmake_file_} ./config/$f"
> > ++       fi
> > ++       ;;
> > ++    * )
> > ++       if test -f ${srcdir}/config/$f
> > ++       then
> > ++         tmake_file_=3D"${tmake_file_} \$(srcdir)/config/$f"
> > ++       fi
> > ++       ;;
> > ++  esac
> > + done
> > + tmake_file=3D"${tmake_file_}"
> > +
> > +@@ -12335,6 +12345,10 @@ tm_file_list=3D"options.h"
> > + tm_include_list=3D"options.h insn-constants.h"
> > + for f in $tm_file; do
> > +   case $f in
> > ++    */linux64.h )
> > ++       tm_file_list=3D"${tm_file_list} ./config/$f"
> > ++       tm_include_list=3D"${tm_include_list} ./config/$f"
> > ++       ;;
> > +     ./* )
> > +        f=3D`echo $f | sed 's/^..//'`
> > +        tm_file_list=3D"${tm_file_list} $f"
> > +diff --git a/gcc/configure.ac b/gcc/configure.ac
> > +index ddc85197588..b413ae9bf25 100644
> > +--- a/gcc/configure.ac
> > ++++ b/gcc/configure.ac
> > +@@ -1948,10 +1948,20 @@ done
> > + tmake_file_=3D
> > + for f in ${tmake_file}
> > + do
> > +-    if test -f ${srcdir}/config/$f
> > +-    then
> > +-            tmake_file_=3D"${tmake_file_} \$(srcdir)/config/$f"
> > +-    fi
> > ++  case $f in
> > ++    */t-linux64 )
> > ++       if test -f ./config/$f
> > ++       then
> > ++         tmake_file_=3D"${tmake_file_} ./config/$f"
> > ++       fi
> > ++       ;;
> > ++    * )
> > ++       if test -f ${srcdir}/config/$f
> > ++       then
> > ++         tmake_file_=3D"${tmake_file_} \$(srcdir)/config/$f"
> > ++       fi
> > ++       ;;
> > ++  esac
> > + done
> > + tmake_file=3D"${tmake_file_}"
> > +
> > +@@ -1962,6 +1972,10 @@ tm_file_list=3D"options.h"
> > + tm_include_list=3D"options.h insn-constants.h"
> > + for f in $tm_file; do
> > +   case $f in
> > ++    */linux64.h )
> > ++       tm_file_list=3D"${tm_file_list} ./config/$f"
> > ++       tm_include_list=3D"${tm_include_list} ./config/$f"
> > ++       ;;
> > +     ./* )
> > +        f=3D`echo $f | sed 's/^..//'`
> > +        tm_file_list=3D"${tm_file_list} $f"
> > +--
> > +2.22.1
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0017-=
Avoid-using-libdir-from-.la-which-usually-points-to-.patch b/meta-arm-toolc=
hain/recipes-devtools/gcc/gcc-arm-9.2/0017-Avoid-using-libdir-from-.la-whic=
h-usually-points-to-.patch
> > new file mode 100644
> > index 0000000..ad1d1d4
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0017-Avoid-u=
sing-libdir-from-.la-which-usually-points-to-.patch
> > @@ -0,0 +1,31 @@
> > +From 09d9ccc1d471020949d1285a5276f17504fd60dd Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 20 Feb 2015 09:39:38 +0000
> > +Subject: [PATCH 17/36] Avoid using libdir from .la which usually poin=
ts to a
> > + host path
> > +
> > +Upstream-Status: Inappropriate [embedded specific]
> > +
> > +Signed-off-by: Jonathan Liu <net147@gmail.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + ltmain.sh | 3 +++
> > + 1 file changed, 3 insertions(+)
> > +
> > +diff --git a/ltmain.sh b/ltmain.sh
> > +index 8e222f7c16b..0a93b4e5c3b 100644
> > +--- a/ltmain.sh
> > ++++ b/ltmain.sh
> > +@@ -5628,6 +5628,9 @@ func_mode_link ()
> > +         absdir=3D"$abs_ladir"
> > +         libdir=3D"$abs_ladir"
> > +       else
> > ++        # Instead of using libdir from .la which usually points to a=
 host path,
> > ++        # use the path the .la is contained in.
> > ++        libdir=3D"$abs_ladir"
> > +         dir=3D"$libdir"
> > +         absdir=3D"$libdir"
> > +       fi
> > +--
> > +2.22.1
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0018-=
export-CPP.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0018=
-export-CPP.patch
> > new file mode 100644
> > index 0000000..0f728ec
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0018-export-=
CPP.patch
> > @@ -0,0 +1,53 @@
> > +From 987338cd847a723de533bb317e452a60b1e52165 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 20 Feb 2015 09:40:59 +0000
> > +Subject: [PATCH 18/36] export CPP
> > +
> > +The OE environment sets and exports CPP as being the target gcc. When
> > +building gcc-cross-canadian for a mingw targetted sdk, the following =
can be found
> > +in build.x86_64-pokysdk-mingw32.i586-poky-linux/build-x86_64-linux/li=
biberty/config.log:
> > +
> > +configure:3641: checking for _FILE_OFFSET_BITS value needed for large=
 files
> > +configure:3666: gcc  -c -isystem/media/build1/poky/build/tmp/sysroots=
/x86_64-linux/usr/include -O2 -pipe  conftest.c >&5
> > +configure:3666: $? =3D 0
> > +configure:3698: result: no
> > +configure:3786: checking how to run the C preprocessor
> > +configure:3856: result: x86_64-pokysdk-mingw32-gcc -E --sysroot=3D/me=
dia/build1/poky/build/tmp/sysroots/x86_64-nativesdk-mingw32-pokysdk-mingw32
> > +configure:3876: x86_64-pokysdk-mingw32-gcc -E --sysroot=3D/media/buil=
d1/poky/build/tmp/sysroots/x86_64-nativesdk-mingw32-pokysdk-mingw32 conftes=
t.c
> > +configure:3876: $? =3D 0
> > +
> > +Note this is a *build* target (in build-x86_64-linux) so it should be
> > +using the host "gcc", not x86_64-pokysdk-mingw32-gcc. Since the mingw=
32
> > +headers are very different, using the wrong cpp is a real problem. It=
 is leaking
> > +into configure through the CPP variable. Ultimately this leads to bui=
ld
> > +failures related to not being able to include a process.h file for pe=
m-unix.c.
> > +
> > +The fix is to ensure we export a sane CPP value into the build
> > +environment when using build targets. We could define a CPP_FOR_BUILD=
 value which may be
> > +the version which needs to be upstreamed but for now, this fix is goo=
d enough to
> > +avoid the problem.
> > +
> > +RP 22/08/2013
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + Makefile.in | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/Makefile.in b/Makefile.in
> > +index 64e091ba71d..255822e3f27 100644
> > +--- a/Makefile.in
> > ++++ b/Makefile.in
> > +@@ -149,6 +149,7 @@ BUILD_EXPORTS =3D \
> > +     AR=3D"$(AR_FOR_BUILD)"; export AR; \
> > +     AS=3D"$(AS_FOR_BUILD)"; export AS; \
> > +     CC=3D"$(CC_FOR_BUILD)"; export CC; \
> > ++    CPP=3D"$(CC_FOR_BUILD) -E"; export CPP; \
> > +     CFLAGS=3D"$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
> > +     CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> > +     CXX=3D"$(CXX_FOR_BUILD)"; export CXX; \
> > +--
> > +2.22.1
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0019-=
Ensure-target-gcc-headers-can-be-included.patch b/meta-arm-toolchain/recipe=
s-devtools/gcc/gcc-arm-9.2/0019-Ensure-target-gcc-headers-can-be-included.p=
atch
> > new file mode 100644
> > index 0000000..53f9e99
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0019-Ensure-=
target-gcc-headers-can-be-included.patch
> > @@ -0,0 +1,55 @@
> > +From d27ba49e2e5c608c43265462d6831363cc7f565b Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 20 Feb 2015 10:25:11 +0000
> > +Subject: [PATCH 19/36] Ensure target gcc headers can be included
> > +
> > +There are a few headers installed as part of the OpenEmbedded
> > +gcc-runtime target (omp.h, ssp/*.h). Being installed from a recipe
> > +built for the target architecture, these are within the target
> > +sysroot and not cross/nativesdk; thus they weren't able to be
> > +found by gcc with the existing search paths. Add support for
> > +picking up these headers under the sysroot supplied on the gcc
> > +command line in order to resolve this.
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + gcc/Makefile.in  | 2 ++
> > + gcc/cppdefault.c | 4 ++++
> > + gcc/defaults.h   | 9 +++++++++
> > + gcc/gcc.c        | 7 -------
> > + 4 files changed, 15 insertions(+), 7 deletions(-)
> > +
> > +--- a/gcc/Makefile.in
> > ++++ b/gcc/Makefile.in
> > +@@ -618,6 +618,7 @@ libexecdir =3D @libexecdir@
> > +
> > + # Directory in which the compiler finds libraries etc.
> > + libsubdir =3D $(libdir)/gcc/$(real_target_noncanonical)/$(version)$(=
accel_dir_suffix)
> > ++libsubdir_target =3D $(target_noncanonical)/$(version)
> > + # Directory in which the compiler finds executables
> > + libexecsubdir =3D $(libexecdir)/gcc/$(real_target_noncanonical)/$(ve=
rsion)$(accel_dir_suffix)
> > + # Directory in which all plugin resources are installed
> > +@@ -2866,6 +2867,7 @@ CFLAGS-intl.o +=3D -DLOCALEDIR=3D\"$(localed
> > +
> > + PREPROCESSOR_DEFINES =3D \
> > +   -DGCC_INCLUDE_DIR=3D\"$(libsubdir)/include\" \
> > ++  -DGCC_INCLUDE_SUBDIR_TARGET=3D\"$(libsubdir_target)/include\" \
> > +   -DFIXED_INCLUDE_DIR=3D\"$(libsubdir)/include-fixed\" \
> > +   -DGPLUSPLUS_INCLUDE_DIR=3D\"$(gcc_gxx_include_dir)\" \
> > +   -DGPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT=3D$(gcc_gxx_include_dir_add_sy=
sroot) \
> > +--- a/gcc/cppdefault.c
> > ++++ b/gcc/cppdefault.c
> > +@@ -59,6 +59,10 @@ const struct default_include cpp_include
> > +     /* This is the dir for gcc's private headers.  */
> > +     { GCC_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
> > + #endif
> > ++#ifdef GCC_INCLUDE_SUBDIR_TARGET
> > ++    /* This is the dir for gcc's private headers under the specified=
 sysroot.  */
> > ++    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC", =
0, 0, 1, 0 },
> > ++#endif
> > + #ifdef LOCAL_INCLUDE_DIR
> > +     /* /usr/local/include comes before the fixincluded header files.=
  */
> > +     { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0020-=
gcc-4.8-won-t-build-with-disable-dependency-tracking.patch b/meta-arm-toolc=
hain/recipes-devtools/gcc/gcc-arm-9.2/0020-gcc-4.8-won-t-build-with-disable=
-dependency-tracking.patch
> > new file mode 100644
> > index 0000000..b0f96d0
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0020-gcc-4.8=
-won-t-build-with-disable-dependency-tracking.patch
> > @@ -0,0 +1,54 @@
> > +From 83bcd4cc47ae63971c888c117abd00dfd506532c Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 20 Feb 2015 11:17:19 +0000
> > +Subject: [PATCH 20/36] gcc 4.8+ won't build with --disable-dependency=
-tracking
> > +
> > +since the *.Ppo files don't get created unless --enable-dependency-tr=
acking is true.
> > +
> > +This patch ensures we only use those compiler options when its enable=
d.
> > +
> > +Upstream-Status: Submitted
> > +
> > +(Problem was already reported upstream, attached this patch there
> > +http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D55930)
> > +
> > +RP
> > +2012/09/22
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + libatomic/Makefile.am | 3 ++-
> > + libatomic/Makefile.in | 3 ++-
> > + 2 files changed, 4 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/libatomic/Makefile.am b/libatomic/Makefile.am
> > +index c1b7c73934a..ef43d62c07a 100644
> > +--- a/libatomic/Makefile.am
> > ++++ b/libatomic/Makefile.am
> > +@@ -101,7 +101,8 @@ PAT_S            =3D $(word 3,$(PAT_SPLIT))
> > + IFUNC_DEF   =3D -DIFUNC_ALT=3D$(PAT_S)
> > + IFUNC_OPT   =3D $(word $(PAT_S),$(IFUNC_OPTIONS))
> > +
> > +-M_DEPS              =3D -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
> > ++@AMDEP_TRUE@M_DEPS          =3D -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).P=
po
> > ++@AMDEP_FALSE@M_DEPS         =3D
> > + M_SIZE              =3D -DN=3D$(PAT_N)
> > + M_IFUNC             =3D $(if $(PAT_S),$(IFUNC_DEF) $(IFUNC_OPT))
> > + M_FILE              =3D $(PAT_BASE)_n.c
> > +diff --git a/libatomic/Makefile.in b/libatomic/Makefile.in
> > +index 29324e3e0ac..d5cdb4259ef 100644
> > +--- a/libatomic/Makefile.in
> > ++++ b/libatomic/Makefile.in
> > +@@ -414,7 +414,8 @@ PAT_N =3D $(word 2,$(PAT_SPLIT))
> > + PAT_S =3D $(word 3,$(PAT_SPLIT))
> > + IFUNC_DEF =3D -DIFUNC_ALT=3D$(PAT_S)
> > + IFUNC_OPT =3D $(word $(PAT_S),$(IFUNC_OPTIONS))
> > +-M_DEPS =3D -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
> > ++@AMDEP_TRUE@M_DEPS =3D -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
> > ++@AMDEP_FALSE@M_DEPS =3D
> > + M_SIZE =3D -DN=3D$(PAT_N)
> > + M_IFUNC =3D $(if $(PAT_S),$(IFUNC_DEF) $(IFUNC_OPT))
> > + M_FILE =3D $(PAT_BASE)_n.c
> > +--
> > +2.22.1
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0021-=
Don-t-search-host-directory-during-relink-if-inst_pr.patch b/meta-arm-toolc=
hain/recipes-devtools/gcc/gcc-arm-9.2/0021-Don-t-search-host-directory-duri=
ng-relink-if-inst_pr.patch
> > new file mode 100644
> > index 0000000..f36ca29
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0021-Don-t-s=
earch-host-directory-during-relink-if-inst_pr.patch
> > @@ -0,0 +1,38 @@
> > +From 667cc8d43e8fb4ac09654ee408da482f96b09580 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Tue, 3 Mar 2015 08:21:19 +0000
> > +Subject: [PATCH 21/36] Don't search host directory during "relink" if
> > + $inst_prefix is provided
> > +
> > +http://lists.gnu.org/archive/html/libtool-patches/2011-01/msg00026.ht=
ml
> > +
> > +Upstream-Status: Submitted
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + ltmain.sh | 5 +++--
> > + 1 file changed, 3 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/ltmain.sh b/ltmain.sh
> > +index 0a93b4e5c3b..6de6ed2f9a0 100644
> > +--- a/ltmain.sh
> > ++++ b/ltmain.sh
> > +@@ -6004,12 +6004,13 @@ func_mode_link ()
> > +           fi
> > +         else
> > +           # We cannot seem to hardcode it, guess we'll fake it.
> > ++          # Default if $libdir is not relative to the prefix:
> > +           add_dir=3D"-L$libdir"
> > +-          # Try looking first in the location we're being installed =
to.
> > ++
> > +           if test -n "$inst_prefix_dir"; then
> > +             case $libdir in
> > +               [\\/]*)
> > +-                add_dir=3D"$add_dir -L$inst_prefix_dir$libdir"
> > ++                add_dir=3D"-L$inst_prefix_dir$libdir"
> > +                 ;;
> > +             esac
> > +           fi
> > +--
> > +2.22.1
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0022-=
Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch b/meta-arm-toolc=
hain/recipes-devtools/gcc/gcc-arm-9.2/0022-Use-SYSTEMLIBS_DIR-replacement-i=
nstead-of-hardcoding.patch
> > new file mode 100644
> > index 0000000..d5b9150
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0022-Use-SYS=
TEMLIBS_DIR-replacement-instead-of-hardcoding.patch
> > @@ -0,0 +1,29 @@
> > +From 279c4de48e3fd61e2f268787ed3f1d69ed9224f8 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Tue, 28 Apr 2015 23:15:27 -0700
> > +Subject: [PATCH 22/36] Use SYSTEMLIBS_DIR replacement instead of hard=
coding
> > + base_libdir
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + gcc/config/aarch64/aarch64-linux.h | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/=
aarch64-linux.h
> > +index 5e8b34ded03..7e628bf661e 100644
> > +--- a/gcc/config/aarch64/aarch64-linux.h
> > ++++ b/gcc/config/aarch64/aarch64-linux.h
> > +@@ -21,7 +21,7 @@
> > + #ifndef GCC_AARCH64_LINUX_H
> > + #define GCC_AARCH64_LINUX_H
> > +
> > +-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-aarch64%{mbig-endian:_be=
}%{mabi=3Dilp32:_ilp32}.so.1"
> > ++#define GLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-linux-aarch64%{mbig=
-endian:_be}%{mabi=3Dilp32:_ilp32}.so.1"
> > +
> > + #undef MUSL_DYNAMIC_LINKER
> > + #define MUSL_DYNAMIC_LINKER "/lib/ld-musl-aarch64%{mbig-endian:_be}%=
{mabi=3Dilp32:_ilp32}.so.1"
> > +--
> > +2.22.1
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0023-=
aarch64-Add-support-for-musl-ldso.patch b/meta-arm-toolchain/recipes-devtoo=
ls/gcc/gcc-arm-9.2/0023-aarch64-Add-support-for-musl-ldso.patch
> > new file mode 100644
> > index 0000000..f811306
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0023-aarch64=
-Add-support-for-musl-ldso.patch
> > @@ -0,0 +1,28 @@
> > +From 1277d12058334087443828dfd57d44e3b1dfcc9a Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Tue, 28 Apr 2015 23:18:39 -0700
> > +Subject: [PATCH 23/36] aarch64: Add support for musl ldso
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + gcc/config/aarch64/aarch64-linux.h | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/=
aarch64-linux.h
> > +index 7e628bf661e..1717cbe5471 100644
> > +--- a/gcc/config/aarch64/aarch64-linux.h
> > ++++ b/gcc/config/aarch64/aarch64-linux.h
> > +@@ -24,7 +24,7 @@
> > + #define GLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-linux-aarch64%{mbig=
-endian:_be}%{mabi=3Dilp32:_ilp32}.so.1"
> > +
> > + #undef MUSL_DYNAMIC_LINKER
> > +-#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-aarch64%{mbig-endian:_be}%=
{mabi=3Dilp32:_ilp32}.so.1"
> > ++#define MUSL_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-musl-aarch64%{mbig-e=
ndian:_be}%{mabi=3Dilp32:_ilp32}.so.1"
> > +
> > + #undef  ASAN_CC1_SPEC
> > + #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
> > +--
> > +2.22.1
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0024-=
libcc1-fix-libcc1-s-install-path-and-rpath.patch b/meta-arm-toolchain/recip=
es-devtools/gcc/gcc-arm-9.2/0024-libcc1-fix-libcc1-s-install-path-and-rpath=
.patch
> > new file mode 100644
> > index 0000000..298b096
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0024-libcc1-=
fix-libcc1-s-install-path-and-rpath.patch
> > @@ -0,0 +1,54 @@
> > +From 4a0487ad75accd780dd155aa59086cc4b11cfc47 Mon Sep 17 00:00:00 200=
1
> > +From: Robert Yang <liezhi.yang@windriver.com>
> > +Date: Sun, 5 Jul 2015 20:25:18 -0700
> > +Subject: [PATCH 24/36] libcc1: fix libcc1's install path and rpath
> > +
> > +* Install libcc1.so and libcc1plugin.so into
> > +  $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_version), as what we
> > +  had done to lto-plugin.
> > +* Fix bad RPATH iussue:
> > +  gcc-5.2.0: package gcc-plugins contains bad RPATH /patht/to/tmp/sys=
roots/qemux86-64/usr/lib64/../lib64 in file
> > + /path/to/gcc/5.2.0-r0/packages-split/gcc-plugins/usr/lib64/gcc/x86_6=
4-poky-linux/5.2.0/plugin/libcc1plugin.so.0.0.0
> > + [rpaths]
> > +
> > +Upstream-Status: Inappropriate [OE configuration]
> > +
> > +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > +---
> > + libcc1/Makefile.am | 4 ++--
> > + libcc1/Makefile.in | 4 ++--
> > + 2 files changed, 4 insertions(+), 4 deletions(-)
> > +
> > +diff --git a/libcc1/Makefile.am b/libcc1/Makefile.am
> > +index 72c6aead475..42a87740b31 100644
> > +--- a/libcc1/Makefile.am
> > ++++ b/libcc1/Makefile.am
> > +@@ -37,8 +37,8 @@ libiberty =3D $(if $(wildcard $(libiberty_noasan)),=
$(Wc)$(libiberty_noasan), \
> > +         $(Wc)$(libiberty_normal)))
> > + libiberty_dep =3D $(patsubst $(Wc)%,%,$(libiberty))
> > +
> > +-plugindir =3D $(libdir)/gcc/$(target_noncanonical)/$(gcc_version)/pl=
ugin
> > +-cc1libdir =3D $(libdir)/$(libsuffix)
> > ++cc1libdir =3D $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_version=
)
> > ++plugindir =3D $(cc1libdir)
> > +
> > + if ENABLE_PLUGIN
> > + plugin_LTLIBRARIES =3D libcc1plugin.la libcp1plugin.la
> > +diff --git a/libcc1/Makefile.in b/libcc1/Makefile.in
> > +index 7104b649026..2103c477468 100644
> > +--- a/libcc1/Makefile.in
> > ++++ b/libcc1/Makefile.in
> > +@@ -393,8 +393,8 @@ libiberty =3D $(if $(wildcard $(libiberty_noasan)=
),$(Wc)$(libiberty_noasan), \
> > +         $(Wc)$(libiberty_normal)))
> > +
> > + libiberty_dep =3D $(patsubst $(Wc)%,%,$(libiberty))
> > +-plugindir =3D $(libdir)/gcc/$(target_noncanonical)/$(gcc_version)/pl=
ugin
> > +-cc1libdir =3D $(libdir)/$(libsuffix)
> > ++cc1libdir =3D $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_version=
)
> > ++plugindir =3D $(cc1libdir)
> > + @ENABLE_PLUGIN_TRUE@plugin_LTLIBRARIES =3D libcc1plugin.la libcp1plu=
gin.la
> > + @ENABLE_PLUGIN_TRUE@cc1lib_LTLIBRARIES =3D libcc1.la
> > + shared_source =3D callbacks.cc callbacks.hh connection.cc connection=
.hh \
> > +--
> > +2.22.1
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0025-=
handle-sysroot-support-for-nativesdk-gcc.patch b/meta-arm-toolchain/recipes=
-devtools/gcc/gcc-arm-9.2/0025-handle-sysroot-support-for-nativesdk-gcc.pat=
ch
> > new file mode 100644
> > index 0000000..2e7a444
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0025-handle-=
sysroot-support-for-nativesdk-gcc.patch
> > @@ -0,0 +1,346 @@
> > +From a183c82ea2af934a8d30055a791dc1d80c9067a9 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Mon, 7 Dec 2015 23:39:54 +0000
> > +Subject: [PATCH 25/36] handle sysroot support for nativesdk-gcc
> > +
> > +Being able to build a nativesdk gcc is useful, particularly in cases
> > +where the host compiler may be of an incompatible version (or a 32
> > +bit compiler is needed).
> > +
> > +Sadly, building nativesdk-gcc is not straight forward. We install
> > +nativesdk-gcc into a relocatable location and this means that its
> > +library locations can change. "Normal" sysroot support doesn't help
> > +in this case since the values of paths like "libdir" change, not just
> > +base root directory of the system.
> > +
> > +In order to handle this we do two things:
> > +
> > +a) Add %r into spec file markup which can be used for injected paths
> > +   such as SYSTEMLIBS_DIR (see gcc_multilib_setup()).
> > +b) Add other paths which need relocation into a .gccrelocprefix secti=
on
> > +   which the relocation code will notice and adjust automatically.
> > +
> > +Upstream-Status: Inappropriate
> > +RP 2015/7/28
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Added PREFIXVAR and EXEC_PREFIXVAR to support runtime relocation.  Wi=
thout
> > +these as part of the gccrelocprefix the system can't do runtime reloc=
ation
> > +if the executable is moved.  (These paths were missed in the original
> > +implementation.)
> > +
> > +Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> > +---
> > + c-family/c-opts.c |    4 +--
> > + cppdefault.c      |   63 +++++++++++++++++++++++++++++++++----------=
-----------
> > + cppdefault.h      |   13 ++++-------
> > + gcc.c             |   20 ++++++++++++-----
> > + incpath.c         |   12 +++++-----
> > + prefix.c          |    4 +--
> > + 6 files changed, 68 insertions(+), 48 deletions(-)
> > +
> > +Index: gcc-9.2.0/gcc/cppdefault.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- gcc-9.2.0.orig/gcc/cppdefault.c
> > ++++ gcc-9.2.0/gcc/cppdefault.c
> > +@@ -35,6 +35,30 @@
> > + # undef CROSS_INCLUDE_DIR
> > + #endif
> > +
> > ++static char GPLUSPLUS_INCLUDE_DIRVAR[4096] __attribute__ ((section (=
".gccrelocprefix"))) =3D GPLUSPLUS_INCLUDE_DIR;
> > ++char GCC_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocpre=
fix"))) =3D GCC_INCLUDE_DIR;
> > ++static char GPLUSPLUS_TOOL_INCLUDE_DIRVAR[4096] __attribute__ ((sect=
ion (".gccrelocprefix"))) =3D GPLUSPLUS_TOOL_INCLUDE_DIR;
> > ++static char GPLUSPLUS_BACKWARD_INCLUDE_DIRVAR[4096] __attribute__ ((=
section (".gccrelocprefix"))) =3D GPLUSPLUS_BACKWARD_INCLUDE_DIR;
> > ++static char STANDARD_STARTFILE_PREFIX_2VAR[4096] __attribute__ ((sec=
tion (".gccrelocprefix"))) =3D STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBD=
IR_TARGET;
> > ++#ifdef LOCAL_INCLUDE_DIR
> > ++static char LOCAL_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gc=
crelocprefix"))) =3D LOCAL_INCLUDE_DIR;
> > ++#endif
> > ++#ifdef PREFIX_INCLUDE_DIR
> > ++static char PREFIX_INCLUDE_DIRVAR[4096] __attribute__ ((section (".g=
ccrelocprefix"))) =3D PREFIX_INCLUDE_DIR;
> > ++#endif
> > ++#ifdef FIXED_INCLUDE_DIR
> > ++static char FIXED_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gc=
crelocprefix"))) =3D FIXED_INCLUDE_DIR;
> > ++#endif
> > ++#ifdef CROSS_INCLUDE_DIR
> > ++static char CROSS_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gc=
crelocprefix"))) =3D CROSS_INCLUDE_DIR;
> > ++#endif
> > ++#ifdef TOOL_INCLUDE_DIR
> > ++static char TOOL_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gcc=
relocprefix"))) =3D TOOL_INCLUDE_DIR;
> > ++#endif
> > ++#ifdef NATIVE_SYSTEM_HEADER_DIR
> > ++static char NATIVE_SYSTEM_HEADER_DIRVAR[4096] __attribute__ ((sectio=
n (".gccrelocprefix"))) =3D NATIVE_SYSTEM_HEADER_DIR;
> > ++#endif
> > ++
> > + const struct default_include cpp_include_defaults[]
> > + #ifdef INCLUDE_DEFAULTS
> > + =3D INCLUDE_DEFAULTS;
> > +@@ -42,38 +66,38 @@ const struct default_include cpp_include
> > + =3D {
> > + #ifdef GPLUSPLUS_INCLUDE_DIR
> > +     /* Pick up GNU C++ generic include files.  */
> > +-    { GPLUSPLUS_INCLUDE_DIR, "G++", 1, 1,
> > ++    { GPLUSPLUS_INCLUDE_DIRVAR, "G++", 1, 1,
> > +       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
> > + #endif
> > + #ifdef GPLUSPLUS_TOOL_INCLUDE_DIR
> > +     /* Pick up GNU C++ target-dependent include files.  */
> > +-    { GPLUSPLUS_TOOL_INCLUDE_DIR, "G++", 1, 1,
> > ++    { GPLUSPLUS_TOOL_INCLUDE_DIRVAR, "G++", 1, 1,
> > +       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 1 },
> > + #endif
> > + #ifdef GPLUSPLUS_BACKWARD_INCLUDE_DIR
> > +     /* Pick up GNU C++ backward and deprecated include files.  */
> > +-    { GPLUSPLUS_BACKWARD_INCLUDE_DIR, "G++", 1, 1,
> > ++    { GPLUSPLUS_BACKWARD_INCLUDE_DIRVAR, "G++", 1, 1,
> > +       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
> > + #endif
> > + #ifdef GCC_INCLUDE_DIR
> > +     /* This is the dir for gcc's private headers.  */
> > +-    { GCC_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
> > ++    { GCC_INCLUDE_DIRVAR, "GCC", 0, 0, 0, 0 },
> > + #endif
> > + #ifdef GCC_INCLUDE_SUBDIR_TARGET
> > +     /* This is the dir for gcc's private headers under the specified=
 sysroot.  */
> > +-    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC", =
0, 0, 1, 0 },
> > ++    { STANDARD_STARTFILE_PREFIX_2VAR, "GCC", 0, 0, 1, 0 },
> > + #endif
> > + #ifdef LOCAL_INCLUDE_DIR
> > +     /* /usr/local/include comes before the fixincluded header files.=
  */
> > +-    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },
> > +-    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 0 },
> > ++    { LOCAL_INCLUDE_DIRVAR, 0, 0, 1, 1, 2 },
> > ++    { LOCAL_INCLUDE_DIRVAR, 0, 0, 1, 1, 0 },
> > + #endif
> > + #ifdef PREFIX_INCLUDE_DIR
> > +-    { PREFIX_INCLUDE_DIR, 0, 0, 1, 0, 0 },
> > ++    { PREFIX_INCLUDE_DIRVAR, 0, 0, 1, 0, 0 },
> > + #endif
> > + #ifdef FIXED_INCLUDE_DIR
> > +     /* This is the dir for fixincludes.  */
> > +-    { FIXED_INCLUDE_DIR, "GCC", 0, 0, 0,
> > ++    { FIXED_INCLUDE_DIRVAR, "GCC", 0, 0, 0,
> > +       /* A multilib suffix needs adding if different multilibs use
> > +      different headers.  */
> > + #ifdef SYSROOT_HEADERS_SUFFIX_SPEC
> > +@@ -85,33 +109,24 @@ const struct default_include cpp_include
> > + #endif
> > + #ifdef CROSS_INCLUDE_DIR
> > +     /* One place the target system's headers might be.  */
> > +-    { CROSS_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
> > ++    { CROSS_INCLUDE_DIRVAR, "GCC", 0, 0, 0, 0 },
> > + #endif
> > + #ifdef TOOL_INCLUDE_DIR
> > +     /* Another place the target system's headers might be.  */
> > +-    { TOOL_INCLUDE_DIR, "BINUTILS", 0, 1, 0, 0 },
> > ++    { TOOL_INCLUDE_DIRVAR, "BINUTILS", 0, 1, 0, 0 },
> > + #endif
> > + #ifdef NATIVE_SYSTEM_HEADER_DIR
> > +     /* /usr/include comes dead last.  */
> > +-    { NATIVE_SYSTEM_HEADER_DIR, NATIVE_SYSTEM_HEADER_COMPONENT, 0, 0=
, 1, 2 },
> > +-    { NATIVE_SYSTEM_HEADER_DIR, NATIVE_SYSTEM_HEADER_COMPONENT, 0, 0=
, 1, 0 },
> > ++    { NATIVE_SYSTEM_HEADER_DIRVAR, NATIVE_SYSTEM_HEADER_COMPONENT, 0=
, 0, 1, 2 },
> > ++    { NATIVE_SYSTEM_HEADER_DIRVAR, NATIVE_SYSTEM_HEADER_COMPONENT, 0=
, 0, 1, 0 },
> > + #endif
> > +     { 0, 0, 0, 0, 0, 0 }
> > +   };
> > + #endif /* no INCLUDE_DEFAULTS */
> > +
> > +-#ifdef GCC_INCLUDE_DIR
> > +-const char cpp_GCC_INCLUDE_DIR[] =3D GCC_INCLUDE_DIR;
> > +-const size_t cpp_GCC_INCLUDE_DIR_len =3D sizeof GCC_INCLUDE_DIR - 8;
> > +-#else
> > +-const char cpp_GCC_INCLUDE_DIR[] =3D "";
> > +-const size_t cpp_GCC_INCLUDE_DIR_len =3D 0;
> > +-#endif
> > +-
> > + /* The configured prefix.  */
> > +-const char cpp_PREFIX[] =3D PREFIX;
> > +-const size_t cpp_PREFIX_len =3D sizeof PREFIX - 1;
> > +-const char cpp_EXEC_PREFIX[] =3D STANDARD_EXEC_PREFIX;
> > ++char PREFIXVAR[4096] __attribute__ ((section (".gccrelocprefix"))) =
=3D PREFIX;
> > ++char EXEC_PREFIXVAR[4096] __attribute__ ((section (".gccrelocprefix"=
))) =3D STANDARD_EXEC_PREFIX;
> > +
> > + /* This value is set by cpp_relocated at runtime */
> > + const char *gcc_exec_prefix;
> > +Index: gcc-9.2.0/gcc/cppdefault.h
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- gcc-9.2.0.orig/gcc/cppdefault.h
> > ++++ gcc-9.2.0/gcc/cppdefault.h
> > +@@ -33,7 +33,8 @@
> > +
> > + struct default_include
> > + {
> > +-  const char *const fname;  /* The name of the directory.  */
> > ++  const char *fname;     /* The name of the directory.  */
> > ++
> > +   const char *const component;      /* The component containing the =
directory
> > +                                (see update_path in prefix.c) */
> > +   const char cplusplus;             /* Only look here if we're compi=
ling C++.  */
> > +@@ -50,17 +51,13 @@ struct default_include
> > + };
> > +
> > + extern const struct default_include cpp_include_defaults[];
> > +-extern const char cpp_GCC_INCLUDE_DIR[];
> > +-extern const size_t cpp_GCC_INCLUDE_DIR_len;
> > ++extern char GCC_INCLUDE_DIRVAR[] __attribute__ ((section (".gccreloc=
prefix")));
> > +
> > + /* The configure-time prefix, i.e., the value supplied as the argume=
nt
> > +    to --prefix=3D.  */
> > +-extern const char cpp_PREFIX[];
> > ++extern char PREFIXVAR[] __attribute__ ((section (".gccrelocprefix"))=
);
> > + /* The length of the configure-time prefix.  */
> > +-extern const size_t cpp_PREFIX_len;
> > +-/* The configure-time execution prefix.  This is typically the lib/g=
cc
> > +-   subdirectory of cpp_PREFIX.  */
> > +-extern const char cpp_EXEC_PREFIX[];
> > ++extern char EXEC_PREFIXVAR[] __attribute__ ((section (".gccrelocpref=
ix")));
> > + /* The run-time execution prefix.  This is typically the lib/gcc
> > +    subdirectory of the actual installation.  */
> > + extern const char *gcc_exec_prefix;
> > +Index: gcc-9.2.0/gcc/gcc.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- gcc-9.2.0.orig/gcc/gcc.c
> > ++++ gcc-9.2.0/gcc/gcc.c
> > +@@ -253,6 +253,8 @@ FILE *report_times_to_file =3D NULL;
> > + #endif
> > + static const char *target_system_root =3D DEFAULT_TARGET_SYSTEM_ROOT=
;
> > +
> > ++static char target_relocatable_prefix[4096] __attribute__ ((section =
(".gccrelocprefix"))) =3D SYSTEMLIBS_DIR;
> > ++
> > + /* Nonzero means pass the updated target_system_root to the compiler=
.  */
> > +
> > + static int target_system_root_changed;
> > +@@ -527,6 +529,7 @@ or with constant text in a single argume
> > +  %G     process LIBGCC_SPEC as a spec.
> > +  %R     Output the concatenation of target_system_root and
> > +         target_sysroot_suffix.
> > ++ %r     Output the base path target_relocatable_prefix
> > +  %S     process STARTFILE_SPEC as a spec.  A capital S is actually u=
sed here.
> > +  %E     process ENDFILE_SPEC as a spec.  A capital E is actually use=
d here.
> > +  %C     process CPP_SPEC as a spec.
> > +@@ -1500,10 +1503,10 @@ static const char *gcc_libexec_prefix;
> > +    gcc_exec_prefix is set because, in that case, we know where the
> > +    compiler has been installed, and use paths relative to that
> > +    location instead.  */
> > +-static const char *const standard_exec_prefix =3D STANDARD_EXEC_PREF=
IX;
> > +-static const char *const standard_libexec_prefix =3D STANDARD_LIBEXE=
C_PREFIX;
> > +-static const char *const standard_bindir_prefix =3D STANDARD_BINDIR_=
PREFIX;
> > +-static const char *const standard_startfile_prefix =3D STANDARD_STAR=
TFILE_PREFIX;
> > ++static char standard_exec_prefix[4096] __attribute__ ((section (".gc=
crelocprefix"))) =3D STANDARD_EXEC_PREFIX;
> > ++static char standard_libexec_prefix[4096] __attribute__ ((section ("=
.gccrelocprefix"))) =3D STANDARD_LIBEXEC_PREFIX;
> > ++static char standard_bindir_prefix[4096] __attribute__ ((section (".=
gccrelocprefix"))) =3D STANDARD_BINDIR_PREFIX;
> > ++static char *const standard_startfile_prefix =3D STANDARD_STARTFILE_=
PREFIX;
> > +
> > + /* For native compilers, these are well-known paths containing
> > +    components that may be provided by the system.  For cross
> > +@@ -1511,9 +1514,9 @@ static const char *const standard_startf
> > + static const char *md_exec_prefix =3D MD_EXEC_PREFIX;
> > + static const char *md_startfile_prefix =3D MD_STARTFILE_PREFIX;
> > + static const char *md_startfile_prefix_1 =3D MD_STARTFILE_PREFIX_1;
> > +-static const char *const standard_startfile_prefix_1
> > ++static char standard_startfile_prefix_1[4096] __attribute__ ((sectio=
n (".gccrelocprefix")))
> > +   =3D STANDARD_STARTFILE_PREFIX_1;
> > +-static const char *const standard_startfile_prefix_2
> > ++static char standard_startfile_prefix_2[4096] __attribute__ ((sectio=
n (".gccrelocprefix")))
> > +   =3D STANDARD_STARTFILE_PREFIX_2;
> > +
> > + /* A relative path to be used in finding the location of tools
> > +@@ -5922,6 +5925,11 @@ do_spec_1 (const char *spec, int inswitc
> > +           }
> > +         break;
> > +
> > ++          case 'r':
> > ++              obstack_grow (&obstack, target_relocatable_prefix,
> > ++                  strlen (target_relocatable_prefix));
> > ++            break;
> > ++
> > +       case 'S':
> > +         value =3D do_spec_1 (startfile_spec, 0, NULL);
> > +         if (value !=3D 0)
> > +Index: gcc-9.2.0/gcc/c-family/c-opts.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- gcc-9.2.0.orig/gcc/c-family/c-opts.c
> > ++++ gcc-9.2.0/gcc/c-family/c-opts.c
> > +@@ -1382,8 +1382,8 @@ add_prefixed_path (const char *suffix, i
> > +   size_t prefix_len, suffix_len;
> > +
> > +   suffix_len =3D strlen (suffix);
> > +-  prefix     =3D iprefix ? iprefix : cpp_GCC_INCLUDE_DIR;
> > +-  prefix_len =3D iprefix ? strlen (iprefix) : cpp_GCC_INCLUDE_DIR_le=
n;
> > ++  prefix     =3D iprefix ? iprefix : GCC_INCLUDE_DIRVAR;
> > ++  prefix_len =3D iprefix ? strlen (iprefix) : strlen(GCC_INCLUDE_DIR=
VAR) - 7;
> > +
> > +   path =3D (char *) xmalloc (prefix_len + suffix_len + 1);
> > +   memcpy (path, prefix, prefix_len);
> > +Index: gcc-9.2.0/gcc/incpath.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- gcc-9.2.0.orig/gcc/incpath.c
> > ++++ gcc-9.2.0/gcc/incpath.c
> > +@@ -131,7 +131,7 @@ add_standard_paths (const char *sysroot,
> > +   int relocated =3D cpp_relocated ();
> > +   size_t len;
> > +
> > +-  if (iprefix && (len =3D cpp_GCC_INCLUDE_DIR_len) !=3D 0)
> > ++  if (iprefix && (len =3D strlen(GCC_INCLUDE_DIRVAR) - 7) !=3D 0)
> > +     {
> > +       /* Look for directories that start with the standard prefix.
> > +      "Translate" them, i.e. replace /usr/local/lib/gcc... with
> > +@@ -145,7 +145,7 @@ add_standard_paths (const char *sysroot,
> > +              now.  */
> > +           if (sysroot && p->add_sysroot)
> > +             continue;
> > +-          if (!filename_ncmp (p->fname, cpp_GCC_INCLUDE_DIR, len))
> > ++          if (!filename_ncmp (p->fname, GCC_INCLUDE_DIRVAR, len))
> > +             {
> > +               char *str =3D concat (iprefix, p->fname + len, NULL);
> > +               if (p->multilib =3D=3D 1 && imultilib)
> > +@@ -185,7 +185,7 @@ add_standard_paths (const char *sysroot,
> > +           free (sysroot_no_trailing_dir_separator);
> > +         }
> > +       else if (!p->add_sysroot && relocated
> > +-               && !filename_ncmp (p->fname, cpp_PREFIX, cpp_PREFIX_l=
en))
> > ++               && !filename_ncmp (p->fname, PREFIXVAR, strlen(PREFIX=
VAR)))
> > +         {
> > +           static const char *relocated_prefix;
> > +           char *ostr;
> > +@@ -202,12 +202,12 @@ add_standard_paths (const char *sysroot,
> > +               dummy =3D concat (gcc_exec_prefix, "dummy", NULL);
> > +               relocated_prefix
> > +                 =3D make_relative_prefix (dummy,
> > +-                                        cpp_EXEC_PREFIX,
> > +-                                        cpp_PREFIX);
> > ++                                        EXEC_PREFIXVAR,
> > ++                                        PREFIXVAR);
> > +               free (dummy);
> > +             }
> > +           ostr =3D concat (relocated_prefix,
> > +-                         p->fname + cpp_PREFIX_len,
> > ++                         p->fname + strlen(PREFIXVAR),
> > +                          NULL);
> > +           str =3D update_path (ostr, p->component);
> > +           free (ostr);
> > +Index: gcc-9.2.0/gcc/prefix.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- gcc-9.2.0.orig/gcc/prefix.c
> > ++++ gcc-9.2.0/gcc/prefix.c
> > +@@ -72,7 +72,9 @@ License along with GCC; see the file COP
> > + #include "prefix.h"
> > + #include "common/common-target.h"
> > +
> > +-static const char *std_prefix =3D PREFIX;
> > ++static const char PREFIXVAR[4096] __attribute__ ((section (".gccrelo=
cprefix"))) =3D PREFIX;
> > ++
> > ++static const char *std_prefix =3D PREFIXVAR;
> > +
> > + static const char *get_key_value (char *);
> > + static char *translate_name (char *);
> > +@@ -212,7 +214,7 @@ translate_name (char *name)
> > +     prefix =3D getenv (key);
> > +
> > +       if (prefix =3D=3D 0)
> > +-    prefix =3D PREFIX;
> > ++    prefix =3D PREFIXVAR;
> > +
> > +       /* We used to strip trailing DIR_SEPARATORs here, but that can
> > +      sometimes yield a result with no separator when one was coded
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0026-=
Search-target-sysroot-gcc-version-specific-dirs-with.patch b/meta-arm-toolc=
hain/recipes-devtools/gcc/gcc-arm-9.2/0026-Search-target-sysroot-gcc-versio=
n-specific-dirs-with.patch
> > new file mode 100644
> > index 0000000..fde206e
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0026-Search-=
target-sysroot-gcc-version-specific-dirs-with.patch
> > @@ -0,0 +1,102 @@
> > +From dab4db14e319f3239a2b4c7d1fbf2971936e27ba Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Mon, 7 Dec 2015 23:41:45 +0000
> > +Subject: [PATCH 26/36] Search target sysroot gcc version specific dir=
s with
> > + multilib.
> > +
> > +We install the gcc libraries (such as crtbegin.p) into
> > +<sysroot><libdir>/<target-sys>/5.2.0/
> > +which is a default search path for GCC (aka multi_suffix in the
> > +code below). <target-sys> is 'machine' in gcc's terminology. We use
> > +these directories so that multiple gcc versions could in theory
> > +co-exist on target.
> > +
> > +We only want to build one gcc-cross-canadian per arch and have this w=
ork
> > +for all multilibs. <target-sys> can be handled by mapping the multili=
b
> > +<target-sys> to the one used by gcc-cross-canadian, e.g.
> > +mips64-polkmllib32-linux
> > +is symlinked to by mips64-poky-linux.
> > +
> > +The default gcc search path in the target sysroot for a "lib64" mutli=
lib
> > +is:
> > +
> > +<sysroot>/lib32/mips64-poky-linux/5.2.0/
> > +<sysroot>/lib32/../lib64/
> > +<sysroot>/usr/lib32/mips64-poky-linux/5.2.0/
> > +<sysroot>/usr/lib32/../lib64/
> > +<sysroot>/lib32/
> > +<sysroot>/usr/lib32/
> > +
> > +which means that the lib32 crtbegin.o will be found and the lib64 one=
s
> > +will not which leads to compiler failures.
> > +
> > +This patch injects a multilib version of that path first so the lib64
> > +binaries can be found first. With this change the search path becomes=
:
> > +
> > +<sysroot>/lib32/../lib64/mips64-poky-linux/5.2.0/
> > +<sysroot>/lib32/mips64-poky-linux/5.2.0/
> > +<sysroot>/lib32/../lib64/
> > +<sysroot>/usr/lib32/../lib64/mips64-poky-linux/5.2.0/
> > +<sysroot>/usr/lib32/mips64-poky-linux/5.2.0/
> > +<sysroot>/usr/lib32/../lib64/
> > +<sysroot>/lib32/
> > +<sysroot>/usr/lib32/
> > +
> > +Upstream-Status: Pending
> > +RP 2015/7/31
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + gcc/gcc.c | 29 ++++++++++++++++++++++++++++-
> > + 1 file changed, 28 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/gcc/gcc.c b/gcc/gcc.c
> > +index db0e2934038..1c21d1b08eb 100644
> > +--- a/gcc/gcc.c
> > ++++ b/gcc/gcc.c
> > +@@ -2610,7 +2610,7 @@ for_each_path (const struct path_prefix *paths,
> > +       if (path =3D=3D NULL)
> > +     {
> > +       len =3D paths->max_len + extra_space + 1;
> > +-      len +=3D MAX (MAX (suffix_len, multi_os_dir_len), multiarch_le=
n);
> > ++      len +=3D MAX ((suffix_len + multi_os_dir_len), multiarch_len);
> > +       path =3D XNEWVEC (char, len);
> > +     }
> > +
> > +@@ -2622,6 +2622,33 @@ for_each_path (const struct path_prefix *paths=
,
> > +       /* Look first in MACHINE/VERSION subdirectory.  */
> > +       if (!skip_multi_dir)
> > +         {
> > ++          if (!(pl->os_multilib ? skip_multi_os_dir : skip_multi_dir=
))
> > ++            {
> > ++              const char *this_multi;
> > ++              size_t this_multi_len;
> > ++
> > ++              if (pl->os_multilib)
> > ++                {
> > ++                  this_multi =3D multi_os_dir;
> > ++                  this_multi_len =3D multi_os_dir_len;
> > ++                }
> > ++              else
> > ++                {
> > ++                  this_multi =3D multi_dir;
> > ++                  this_multi_len =3D multi_dir_len;
> > ++                }
> > ++
> > ++              /* Look in multilib MACHINE/VERSION subdirectory first=
 */
> > ++              if (this_multi_len)
> > ++                {
> > ++                  memcpy (path + len, this_multi, this_multi_len + 1=
);
> > ++                  memcpy (path + len + this_multi_len, multi_suffix,=
 suffix_len + 1);
> > ++                  ret =3D callback (path, callback_info);
> > ++                    if (ret)
> > ++                      break;
> > ++                }
> > ++            }
> > ++
> > +           memcpy (path + len, multi_suffix, suffix_len + 1);
> > +           ret =3D callback (path, callback_info);
> > +           if (ret)
> > +--
> > +2.22.1
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0027-=
Fix-various-_FOR_BUILD-and-related-variables.patch b/meta-arm-toolchain/rec=
ipes-devtools/gcc/gcc-arm-9.2/0027-Fix-various-_FOR_BUILD-and-related-varia=
bles.patch
> > new file mode 100644
> > index 0000000..5d89e8e
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0027-Fix-var=
ious-_FOR_BUILD-and-related-variables.patch
> > @@ -0,0 +1,137 @@
> > +From 8e84bb09d2b7a60487a30e438bb109f31c2c254b Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Mon, 7 Dec 2015 23:42:45 +0000
> > +Subject: [PATCH 27/36] Fix various _FOR_BUILD and related variables
> > +
> > +When doing a FOR_BUILD thing, you have to override CFLAGS with
> > +CFLAGS_FOR_BUILD. And if you use C++, you also have to override
> > +CXXFLAGS with CXXFLAGS_FOR_BUILD.
> > +Without this, when building for mingw, you end up trying to use
> > +the mingw headers for a host build.
> > +
> > +The same goes for other variables as well, such as CPPFLAGS,
> > +CPP, and GMPINC.
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
> > +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + Makefile.in      | 6 ++++++
> > + Makefile.tpl     | 5 +++++
> > + gcc/Makefile.in  | 2 +-
> > + gcc/configure    | 2 +-
> > + gcc/configure.ac | 2 +-
> > + 5 files changed, 14 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/Makefile.in b/Makefile.in
> > +index 255822e3f27..9dc0dff0474 100644
> > +--- a/Makefile.in
> > ++++ b/Makefile.in
> > +@@ -152,6 +152,7 @@ BUILD_EXPORTS =3D \
> > +     CPP=3D"$(CC_FOR_BUILD) -E"; export CPP; \
> > +     CFLAGS=3D"$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
> > +     CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> > ++    CPPFLAGS=3D"$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS; \
> > +     CXX=3D"$(CXX_FOR_BUILD)"; export CXX; \
> > +     CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
> > +     GFORTRAN=3D"$(GFORTRAN_FOR_BUILD)"; export GFORTRAN; \
> > +@@ -171,6 +172,9 @@ BUILD_EXPORTS =3D \
> > + # built for the build system to override those in BASE_FLAGS_TO_PASS=
.
> > + EXTRA_BUILD_FLAGS =3D \
> > +     CFLAGS=3D"$(CFLAGS_FOR_BUILD)" \
> > ++    CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)" \
> > ++    CPP=3D"$(CC_FOR_BUILD) -E" \
> > ++    CPPFLAGS=3D"$(CPPFLAGS_FOR_BUILD)" \
> > +     LDFLAGS=3D"$(LDFLAGS_FOR_BUILD)"
> > +
> > + # This is the list of directories to built for the host system.
> > +@@ -188,6 +192,7 @@ HOST_SUBDIR =3D @host_subdir@
> > + HOST_EXPORTS =3D \
> > +     $(BASE_EXPORTS) \
> > +     CC=3D"$(CC)"; export CC; \
> > ++    CPP=3D"$(CC) -E"; export CPP; \
> > +     ADA_CFLAGS=3D"$(ADA_CFLAGS)"; export ADA_CFLAGS; \
> > +     CFLAGS=3D"$(CFLAGS)"; export CFLAGS; \
> > +     CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> > +@@ -775,6 +780,7 @@ BASE_FLAGS_TO_PASS =3D \
> > +     "CC_FOR_BUILD=3D$(CC_FOR_BUILD)" \
> > +     "CFLAGS_FOR_BUILD=3D$(CFLAGS_FOR_BUILD)" \
> > +     "CXX_FOR_BUILD=3D$(CXX_FOR_BUILD)" \
> > ++    "CXXFLAGS_FOR_BUILD=3D$(CXXFLAGS_FOR_BUILD)" \
> > +     "EXPECT=3D$(EXPECT)" \
> > +     "FLEX=3D$(FLEX)" \
> > +     "INSTALL=3D$(INSTALL)" \
> > +diff --git a/Makefile.tpl b/Makefile.tpl
> > +index 41cae58a267..d3f6b79acdc 100644
> > +--- a/Makefile.tpl
> > ++++ b/Makefile.tpl
> > +@@ -154,6 +154,7 @@ BUILD_EXPORTS =3D \
> > +     CC=3D"$(CC_FOR_BUILD)"; export CC; \
> > +     CFLAGS=3D"$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
> > +     CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> > ++    CPPFLAGS=3D"$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS; \
> > +     CXX=3D"$(CXX_FOR_BUILD)"; export CXX; \
> > +     CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
> > +     GFORTRAN=3D"$(GFORTRAN_FOR_BUILD)"; export GFORTRAN; \
> > +@@ -173,6 +174,9 @@ BUILD_EXPORTS =3D \
> > + # built for the build system to override those in BASE_FLAGS_TO_PASS=
.
> > + EXTRA_BUILD_FLAGS =3D \
> > +     CFLAGS=3D"$(CFLAGS_FOR_BUILD)" \
> > ++    CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)" \
> > ++    CPP=3D"$(CC_FOR_BUILD) -E" \
> > ++    CPPFLAGS=3D"$(CPPFLAGS_FOR_BUILD)" \
> > +     LDFLAGS=3D"$(LDFLAGS_FOR_BUILD)"
> > +
> > + # This is the list of directories to built for the host system.
> > +@@ -190,6 +194,7 @@ HOST_SUBDIR =3D @host_subdir@
> > + HOST_EXPORTS =3D \
> > +     $(BASE_EXPORTS) \
> > +     CC=3D"$(CC)"; export CC; \
> > ++    CPP=3D"$(CC) -E"; export CPP; \
> > +     ADA_CFLAGS=3D"$(ADA_CFLAGS)"; export ADA_CFLAGS; \
> > +     CFLAGS=3D"$(CFLAGS)"; export CFLAGS; \
> > +     CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> > +diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> > +index 21472745c2c..8c93f03ffdc 100644
> > +--- a/gcc/Makefile.in
> > ++++ b/gcc/Makefile.in
> > +@@ -805,7 +805,7 @@ BUILD_LDFLAGS=3D@BUILD_LDFLAGS@
> > + BUILD_NO_PIE_FLAG =3D @BUILD_NO_PIE_FLAG@
> > + BUILD_LDFLAGS +=3D $(BUILD_NO_PIE_FLAG)
> > + BUILD_CPPFLAGS=3D -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
> > +-            -I$(srcdir)/../include @INCINTL@ $(CPPINC) $(CPPFLAGS)
> > ++            -I$(srcdir)/../include @INCINTL@ $(CPPINC) $(CPPFLAGS_FO=
R_BUILD)
> > +
> > + # Actual name to use when installing a native compiler.
> > + GCC_INSTALL_NAME :=3D $(shell echo gcc|sed '$(program_transform_name=
)')
> > +diff --git a/gcc/configure b/gcc/configure
> > +index 911de2cf017..325ace34cdf 100755
> > +--- a/gcc/configure
> > ++++ b/gcc/configure
> > +@@ -11965,7 +11965,7 @@ else
> > +     CC=3D"${CC_FOR_BUILD}" CFLAGS=3D"${CFLAGS_FOR_BUILD}" \
> > +     CXX=3D"${CXX_FOR_BUILD}" CXXFLAGS=3D"${CXXFLAGS_FOR_BUILD}" \
> > +     LD=3D"${LD_FOR_BUILD}" LDFLAGS=3D"${LDFLAGS_FOR_BUILD}" \
> > +-    GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS} -DGENERATOR_FILE" \
> > ++    GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS_FOR_BUILD} -DGENERATOR_FILE" =
\
> > +     ${realsrcdir}/configure \
> > +             --enable-languages=3D${enable_languages-all} \
> > +             --target=3D$target_alias --host=3D$build_alias --build=
=3D$build_alias
> > +diff --git a/gcc/configure.ac b/gcc/configure.ac
> > +index b413ae9bf25..72a6c95121b 100644
> > +--- a/gcc/configure.ac
> > ++++ b/gcc/configure.ac
> > +@@ -1743,7 +1743,7 @@ else
> > +     CC=3D"${CC_FOR_BUILD}" CFLAGS=3D"${CFLAGS_FOR_BUILD}" \
> > +     CXX=3D"${CXX_FOR_BUILD}" CXXFLAGS=3D"${CXXFLAGS_FOR_BUILD}" \
> > +     LD=3D"${LD_FOR_BUILD}" LDFLAGS=3D"${LDFLAGS_FOR_BUILD}" \
> > +-    GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS} -DGENERATOR_FILE" \
> > ++    GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS_FOR_BUILD} -DGENERATOR_FILE" =
\
> > +     ${realsrcdir}/configure \
> > +             --enable-languages=3D${enable_languages-all} \
> > +             --target=3D$target_alias --host=3D$build_alias --build=
=3D$build_alias
> > +--
> > +2.22.1
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0028-=
nios2-Define-MUSL_DYNAMIC_LINKER.patch b/meta-arm-toolchain/recipes-devtool=
s/gcc/gcc-arm-9.2/0028-nios2-Define-MUSL_DYNAMIC_LINKER.patch
> > new file mode 100644
> > index 0000000..84d92a3
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0028-nios2-D=
efine-MUSL_DYNAMIC_LINKER.patch
> > @@ -0,0 +1,28 @@
> > +From 5647f773e28b528a67800ef06ca44730f9f5dc7e Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Tue, 2 Feb 2016 10:26:10 -0800
> > +Subject: [PATCH 28/36] nios2: Define MUSL_DYNAMIC_LINKER
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Marek Vasut <marex@denx.de>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + gcc/config/nios2/linux.h | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/gcc/config/nios2/linux.h b/gcc/config/nios2/linux.h
> > +index 698734add35..eeee60ecfea 100644
> > +--- a/gcc/config/nios2/linux.h
> > ++++ b/gcc/config/nios2/linux.h
> > +@@ -30,6 +30,7 @@
> > + #define CPP_SPEC "%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRANT}"
> > +
> > + #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-nios2.so.1"
> > ++#define MUSL_DYNAMIC_LINKER  "/lib/ld-musl-nios2.so.1"
> > +
> > + #undef LINK_SPEC
> > + #define LINK_SPEC LINK_SPEC_ENDIAN \
> > +--
> > +2.22.1
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0029-=
Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch b/meta-arm-toolc=
hain/recipes-devtools/gcc/gcc-arm-9.2/0029-Add-ssp_nonshared-to-link-comman=
dline-for-musl-targe.patch
> > new file mode 100644
> > index 0000000..d19e5a0
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0029-Add-ssp=
_nonshared-to-link-commandline-for-musl-targe.patch
> > @@ -0,0 +1,87 @@
> > +From 474043ca7a064ca7b0a32308a0ed6f7c546f17b2 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Tue, 27 Jun 2017 18:10:54 -0700
> > +Subject: [PATCH 29/36] Add ssp_nonshared to link commandline for musl=
 targets
> > +
> > +when -fstack-protector options are enabled we need to
> > +link with ssp_shared on musl since it does not provide
> > +the __stack_chk_fail_local() so essentially it provides
> > +libssp but not libssp_nonshared something like
> > +TARGET_LIBC_PROVIDES_SSP_BUT_NOT_SSP_NONSHARED
> > + where-as for glibc the needed symbols
> > +are already present in libc_nonshared library therefore
> > +we do not need any library helper on glibc based systems
> > +but musl needs the libssp_noshared from gcc
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + gcc/config/linux.h          |  7 +++++++
> > + gcc/config/rs6000/linux.h   | 10 ++++++++++
> > + gcc/config/rs6000/linux64.h | 10 ++++++++++
> > + 3 files changed, 27 insertions(+)
> > +
> > +diff --git a/gcc/config/linux.h b/gcc/config/linux.h
> > +index 4b05d8e93d1..0ca117e2ed4 100644
> > +--- a/gcc/config/linux.h
> > ++++ b/gcc/config/linux.h
> > +@@ -195,6 +195,13 @@ see the files COPYING3 and COPYING.RUNTIME respe=
ctively.  If not, see
> > +     { GCC_INCLUDE_DIR, "GCC", 0, 1, 0, 0 },         \
> > +     { 0, 0, 0, 0, 0, 0 }                            \
> > +   }
> > ++#ifdef TARGET_LIBC_PROVIDES_SSP
> > ++#undef LINK_SSP_SPEC
> > ++#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
> > ++                   "|fstack-protector-strong|fstack-protector-explic=
it" \
> > ++                   ":-lssp_nonshared}"
> > ++#endif
> > ++
> > + #endif
> > +
> > + #if (DEFAULT_LIBC =3D=3D LIBC_UCLIBC) && defined (SINGLE_LIBC) /* uC=
linux */
> > +diff --git a/gcc/config/rs6000/linux.h b/gcc/config/rs6000/linux.h
> > +index ffceb32bf65..c82cb2ad05b 100644
> > +--- a/gcc/config/rs6000/linux.h
> > ++++ b/gcc/config/rs6000/linux.h
> > +@@ -94,6 +94,16 @@
> > +                                      " -m elf32ppclinux")
> > + #endif
> > +
> > ++/* link libssp_nonshared.a with musl */
> > ++#if DEFAULT_LIBC =3D=3D LIBC_MUSL
> > ++#ifdef TARGET_LIBC_PROVIDES_SSP
> > ++#undef LINK_SSP_SPEC
> > ++#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
> > ++                   "|fstack-protector-strong|fstack-protector-explic=
it" \
> > ++                   ":-lssp_nonshared}"
> > ++#endif
> > ++#endif
> > ++
> > + #undef LINK_OS_LINUX_SPEC
> > + #define LINK_OS_LINUX_SPEC LINK_OS_LINUX_EMUL " %{!shared: %{!static=
: \
> > +   %{!static-pie: \
> > +diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.=
h
> > +index 45a9a7cae59..d1e88a40e82 100644
> > +--- a/gcc/config/rs6000/linux64.h
> > ++++ b/gcc/config/rs6000/linux64.h
> > +@@ -456,6 +456,16 @@ extern int dot_symbols;
> > +                                        " -m elf64ppc")
> > + #endif
> > +
> > ++/* link libssp_nonshared.a with musl */
> > ++#if DEFAULT_LIBC =3D=3D LIBC_MUSL
> > ++#ifdef TARGET_LIBC_PROVIDES_SSP
> > ++#undef LINK_SSP_SPEC
> > ++#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
> > ++                   "|fstack-protector-strong|fstack-protector-explic=
it" \
> > ++                   ":-lssp_nonshared}"
> > ++#endif
> > ++#endif
> > ++
> > + #define LINK_OS_LINUX_SPEC32 LINK_OS_LINUX_EMUL32 " %{!shared: %{!st=
atic: \
> > +   %{!static-pie: \
> > +     %{rdynamic:-export-dynamic} \
> > +--
> > +2.22.1
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0030-=
libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch b/meta-arm-toolchain/recipes-d=
evtools/gcc/gcc-arm-9.2/0030-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
> > new file mode 100644
> > index 0000000..38eab5a
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0030-libgcc-=
Add-knob-to-use-ldbl-128-on-ppc.patch
> > @@ -0,0 +1,79 @@
> > +From 47467f3ab0fb2f2fcede81060fe8bb339d0909eb Mon Sep 17 00:00:00 200=
1
> > +From: Szabolcs Nagy <nsz@port70.net>
> > +Date: Wed, 28 Feb 2018 00:54:05 +0000
> > +Subject: [PATCH 10/12] ldbl128 config
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + gcc/configure    | 13 +++++++++++++
> > + gcc/configure.ac | 16 ++++++++++++++--
> > + 2 files changed, 27 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/gcc/configure b/gcc/configure
> > +index 6121e163259..07ff8597d48 100755
> > +--- a/gcc/configure
> > ++++ b/gcc/configure
> > +@@ -29309,6 +29309,15 @@ if test "${with_long_double_128+set}" =3D se=
t; then :
> > +   withval=3D$with_long_double_128; gcc_cv_target_ldbl128=3D"$with_lo=
ng_double_128"
> > + else
> > +
> > ++      case "$target" in
> > ++    s390*-*-linux-musl*)
> > ++      gcc_cv_target_ldbl128=3Dyes
> > ++      ;;
> > ++    powerpc*-*-linux-musl*)
> > ++      gcc_cv_target_ldbl128=3Dno
> > ++      ;;
> > ++    *)
> > ++
> > + if test $glibc_version_major -gt 2 \
> > +   || ( test $glibc_version_major -eq 2 && test $glibc_version_minor =
-ge 4 ); then :
> > +   gcc_cv_target_ldbl128=3Dyes
> > +@@ -29320,6 +29329,10 @@ else
> > +       && gcc_cv_target_ldbl128=3Dyes
> > +
> > + fi
> > ++
> > ++      ;;
> > ++      esac
> > ++
> > + fi
> > +
> > +     ;;
> > +diff --git a/gcc/configure.ac b/gcc/configure.ac
> > +index b066cc609e1..6c15ed898c0 100644
> > +--- a/gcc/configure.ac
> > ++++ b/gcc/configure.ac
> > +@@ -5971,13 +5971,25 @@ case "$target" in
> > +     AC_ARG_WITH(long-double-128,
> > +       [AS_HELP_STRING([--with-long-double-128],
> > +                   [use 128-bit long double by default])],
> > +-      gcc_cv_target_ldbl128=3D"$with_long_double_128",
> > ++      gcc_cv_target_ldbl128=3D"$with_long_double_128", [
> > ++      case "$target" in
> > ++    s390*-*-linux-musl*)
> > ++      gcc_cv_target_ldbl128=3Dyes
> > ++      ;;
> > ++    powerpc*-*-linux-musl*)
> > ++      gcc_cv_target_ldbl128=3Dno
> > ++      ;;
> > ++    *)]
> > +       [GCC_GLIBC_VERSION_GTE_IFELSE([2], [4], [gcc_cv_target_ldbl128=
=
=3Dyes], [
> > +       [gcc_cv_target_ldbl128=3Dno
> > +       grep '^[      ]*#[    ]*define[       ][      ]*__LONG_DOUBLE_=
MATH_OPTIONAL' \
> > +         $target_header_dir/bits/wordsize.h > /dev/null 2>&1 \
> > +       && gcc_cv_target_ldbl128=3Dyes
> > +-      ]])])
> > ++      ]])]
> > ++      [
> > ++      ;;
> > ++      esac
> > ++      ])
> > +     ;;
> > + esac
> > + if test x$gcc_cv_target_ldbl128 =3D xyes; then
> > +--
> > +2.17.1
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0031-=
Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch b/meta-arm-toolchain=
/recipes-devtools/gcc/gcc-arm-9.2/0031-Link-libgcc-using-LDFLAGS-not-just-S=
HLIB_LDFLAGS.patch
> > new file mode 100644
> > index 0000000..dc2141d
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0031-Link-li=
bgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
> > @@ -0,0 +1,29 @@
> > +From 266dcc78e4d9d38de2809118977d97dc9270cf1f Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Wed, 4 May 2016 21:11:34 -0700
> > +Subject: [PATCH 31/36] Link libgcc using LDFLAGS, not just SHLIB_LDFL=
AGS
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + libgcc/config/t-slibgcc | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/libgcc/config/t-slibgcc b/libgcc/config/t-slibgcc
> > +index 099bf23e62f..436b277a79f 100644
> > +--- a/libgcc/config/t-slibgcc
> > ++++ b/libgcc/config/t-slibgcc
> > +@@ -32,7 +32,7 @@ SHLIB_INSTALL_SOLINK =3D $(LN_S) $(SHLIB_SONAME) \
> > +     $(DESTDIR)$(slibdir)$(SHLIB_SLIBDIR_QUAL)/$(SHLIB_SOLINK)
> > +
> > + SHLIB_LINK =3D $(CC) $(LIBGCC2_CFLAGS) -shared -nodefaultlibs \
> > +-    $(SHLIB_LDFLAGS) \
> > ++    $(LDFLAGS) $(SHLIB_LDFLAGS) \
> > +     -o $(SHLIB_DIR)/$(SHLIB_SONAME).tmp @multilib_flags@ \
> > +     $(SHLIB_OBJS) $(SHLIB_LC) && \
> > +     rm -f $(SHLIB_DIR)/$(SHLIB_SOLINK) && \
> > +--
> > +2.22.1
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0032-=
libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch b/meta-arm-toolc=
hain/recipes-devtools/gcc/gcc-arm-9.2/0032-libgcc_s-Use-alias-for-__cpu_ind=
icator_init-instead-.patch
> > new file mode 100644
> > index 0000000..8dde016
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0032-libgcc_=
s-Use-alias-for-__cpu_indicator_init-instead-.patch
> > @@ -0,0 +1,86 @@
> > +From 9975b6ed3570bbf7c7d2d82f4d5f733d24ccacf5 Mon Sep 17 00:00:00 200=
1
> > +From: Szabolcs Nagy <nsz@port70.net>
> > +Date: Sat, 24 Oct 2015 20:09:53 +0000
> > +Subject: [PATCH 32/36] libgcc_s: Use alias for __cpu_indicator_init i=
nstead of
> > + symver
> > +
> > +Adapter from
> > +
> > +https://gcc.gnu.org/ml/gcc-patches/2015-05/msg00899.html
> > +
> > +This fix was debated but hasnt been applied gcc upstream since
> > +they expect musl to support '@' in symbol versioning which is
> > +a sun/gnu versioning extention. This patch however avoids the
> > +need for the '@' symbols at all
> > +
> > +libgcc/Changelog:
> > +
> > +2015-05-11  Szabolcs Nagy  <szabolcs.nagy@arm.com>
> > +
> > +     * config/i386/cpuinfo.c (__cpu_indicator_init_local): Add.
> > +     (__cpu_indicator_init@GCC_4.8.0, __cpu_model@GCC_4.8.0): Remove.
> > +
> > +     * config/i386/t-linux (HOST_LIBGCC2_CFLAGS): Remove -DUSE_ELF_SY=
MVER.
> > +
> > +gcc/Changelog:
> > +
> > +2015-05-11  Szabolcs Nagy  <szabolcs.nagy@arm.com>
> > +
> > +     * config/i386/i386.c (ix86_expand_builtin): Make __builtin_cpu_i=
nit
> > +     call __cpu_indicator_init_local instead of __cpu_indicator_init.
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + gcc/config/i386/i386.c       | 4 ++--
> > + libgcc/config/i386/cpuinfo.c | 6 +++---
> > + libgcc/config/i386/t-linux   | 2 +-
> > + 3 files changed, 6 insertions(+), 6 deletions(-)
> > +
> > +diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c
> > +index 2b37296e537..dd380ddba88 100644
> > +--- a/gcc/config/i386/i386.c
> > ++++ b/gcc/config/i386/i386.c
> > +@@ -36658,10 +36658,10 @@ ix86_expand_builtin (tree exp, rtx target, =
rtx subtarget,
> > +     {
> > +     case IX86_BUILTIN_CPU_INIT:
> > +       {
> > +-    /* Make it call __cpu_indicator_init in libgcc. */
> > ++    /* Make it call __cpu_indicator_init_local in libgcc.a. */
> > +     tree call_expr, fndecl, type;
> > +         type =3D build_function_type_list (integer_type_node, NULL_T=
REE);
> > +-    fndecl =3D build_fn_decl ("__cpu_indicator_init", type);
> > ++    fndecl =3D build_fn_decl ("__cpu_indicator_init_local", type);
> > +     call_expr =3D build_call_expr (fndecl, 0);
> > +     return expand_expr (call_expr, target, mode, EXPAND_NORMAL);
> > +       }
> > +diff --git a/libgcc/config/i386/cpuinfo.c b/libgcc/config/i386/cpuinf=
o.c
> > +index d6cb2de6265..ce04ef78205 100644
> > +--- a/libgcc/config/i386/cpuinfo.c
> > ++++ b/libgcc/config/i386/cpuinfo.c
> > +@@ -504,7 +504,7 @@ __cpu_indicator_init (void)
> > +   return 0;
> > + }
> > +
> > +-#if defined SHARED && defined USE_ELF_SYMVER
> > +-__asm__ (".symver __cpu_indicator_init, __cpu_indicator_init@GCC_4.8=
.0");
> > +-__asm__ (".symver __cpu_model, __cpu_model@GCC_4.8.0");
> > ++#ifndef SHARED
> > ++int __cpu_indicator_init_local (void)
> > ++  __attribute__ ((weak, alias ("__cpu_indicator_init")));
> > + #endif
> > +diff --git a/libgcc/config/i386/t-linux b/libgcc/config/i386/t-linux
> > +index 8506a635790..564296f788e 100644
> > +--- a/libgcc/config/i386/t-linux
> > ++++ b/libgcc/config/i386/t-linux
> > +@@ -3,5 +3,5 @@
> > + # t-slibgcc-elf-ver and t-linux
> > + SHLIB_MAPFILES =3D libgcc-std.ver $(srcdir)/config/i386/libgcc-glibc=
.ver
> > +
> > +-HOST_LIBGCC2_CFLAGS +=3D -mlong-double-80 -DUSE_ELF_SYMVER $(CET_FLA=
GS)
> > ++HOST_LIBGCC2_CFLAGS +=3D -mlong-double-80 $(CET_FLAGS)
> > + CRTSTUFF_T_CFLAGS +=3D $(CET_FLAGS)
> > +--
> > +2.22.1
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0033-=
sync-gcc-stddef.h-with-musl.patch b/meta-arm-toolchain/recipes-devtools/gcc=
/gcc-arm-9.2/0033-sync-gcc-stddef.h-with-musl.patch
> > new file mode 100644
> > index 0000000..b99ac42
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0033-sync-gc=
c-stddef.h-with-musl.patch
> > @@ -0,0 +1,91 @@
> > +From 39e2f61d262f9f6c7a91068998dea80791ef665e Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 3 Feb 2017 12:56:00 -0800
> > +Subject: [PATCH 33/36] sync gcc stddef.h with musl
> > +
> > +musl defines ptrdiff_t size_t and wchar_t
> > +so dont define them here if musl is definining them
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + gcc/ginclude/stddef.h | 9 +++++++++
> > + 1 file changed, 9 insertions(+)
> > +
> > +diff --git a/gcc/ginclude/stddef.h b/gcc/ginclude/stddef.h
> > +index da692e1c01a..9a00c261adb 100644
> > +--- a/gcc/ginclude/stddef.h
> > ++++ b/gcc/ginclude/stddef.h
> > +@@ -128,6 +128,7 @@ _TYPE_wchar_t;
> > + #ifndef ___int_ptrdiff_t_h
> > + #ifndef _GCC_PTRDIFF_T
> > + #ifndef _PTRDIFF_T_DECLARED /* DragonFly */
> > ++#ifndef __DEFINED_ptrdiff_t /* musl */
> > + #define _PTRDIFF_T
> > + #define _T_PTRDIFF_
> > + #define _T_PTRDIFF
> > +@@ -137,10 +138,12 @@ _TYPE_wchar_t;
> > + #define ___int_ptrdiff_t_h
> > + #define _GCC_PTRDIFF_T
> > + #define _PTRDIFF_T_DECLARED
> > ++#define __DEFINED_ptrdiff_t /* musl */
> > + #ifndef __PTRDIFF_TYPE__
> > + #define __PTRDIFF_TYPE__ long int
> > + #endif
> > + typedef __PTRDIFF_TYPE__ ptrdiff_t;
> > ++#endif /* __DEFINED_ptrdiff_t */
> > + #endif /* _PTRDIFF_T_DECLARED */
> > + #endif /* _GCC_PTRDIFF_T */
> > + #endif /* ___int_ptrdiff_t_h */
> > +@@ -178,6 +181,7 @@ typedef __PTRDIFF_TYPE__ ptrdiff_t;
> > + #ifndef _GCC_SIZE_T
> > + #ifndef _SIZET_
> > + #ifndef __size_t
> > ++#ifndef __DEFINED_size_t /* musl */
> > + #define __size_t__  /* BeOS */
> > + #define __SIZE_T__  /* Cray Unicos/Mk */
> > + #define _SIZE_T
> > +@@ -194,6 +198,7 @@ typedef __PTRDIFF_TYPE__ ptrdiff_t;
> > + #define ___int_size_t_h
> > + #define _GCC_SIZE_T
> > + #define _SIZET_
> > ++#define __DEFINED_size_t /* musl */
> > + #if defined (__FreeBSD__) \
> > +   || defined(__DragonFly__) \
> > +   || defined(__FreeBSD_kernel__) \
> > +@@ -228,6 +233,7 @@ typedef long ssize_t;
> > + #endif /* _SIZE_T */
> > + #endif /* __SIZE_T__ */
> > + #endif /* __size_t__ */
> > ++#endif /* __DEFINED_size_t */
> > + #undef      __need_size_t
> > + #endif /* _STDDEF_H or __need_size_t.  */
> > +
> > +@@ -257,6 +263,7 @@ typedef long ssize_t;
> > + #ifndef ___int_wchar_t_h
> > + #ifndef __INT_WCHAR_T_H
> > + #ifndef _GCC_WCHAR_T
> > ++#ifndef __DEFINED_wchar_t /* musl */
> > + #define __wchar_t__ /* BeOS */
> > + #define __WCHAR_T__ /* Cray Unicos/Mk */
> > + #define _WCHAR_T
> > +@@ -272,6 +279,7 @@ typedef long ssize_t;
> > + #define __INT_WCHAR_T_H
> > + #define _GCC_WCHAR_T
> > + #define _WCHAR_T_DECLARED
> > ++#define __DEFINED_wchar_t /* musl */
> > +
> > + /* On BSD/386 1.1, at least, machine/ansi.h defines _BSD_WCHAR_T_
> > +    instead of _WCHAR_T_, and _BSD_RUNE_T_ (which, unlike the other
> > +@@ -337,6 +345,7 @@ typedef __WCHAR_TYPE__ wchar_t;
> > + #endif
> > + #endif /* __WCHAR_T__ */
> > + #endif /* __wchar_t__ */
> > ++#endif /* __DEFINED_wchar_t musl */
> > + #undef      __need_wchar_t
> > + #endif /* _STDDEF_H or __need_wchar_t.  */
> > +
> > +--
> > +2.22.1
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0034-=
fix-segmentation-fault-in-precompiled-header-generat.patch b/meta-arm-toolc=
hain/recipes-devtools/gcc/gcc-arm-9.2/0034-fix-segmentation-fault-in-precom=
piled-header-generat.patch
> > new file mode 100644
> > index 0000000..06a3c9f
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0034-fix-seg=
mentation-fault-in-precompiled-header-generat.patch
> > @@ -0,0 +1,60 @@
> > +From aaa896a57b0004a74c1d474e74b21f41147a65cb Mon Sep 17 00:00:00 200=
1
> > +From: Juro Bystricky <juro.bystricky@intel.com>
> > +Date: Mon, 19 Mar 2018 22:31:20 -0700
> > +Subject: [PATCH 34/36] fix segmentation fault in precompiled header g=
eneration
> > +
> > +Prevent a segmentation fault which occurs when using incorrect
> > +structure trying to access name of some named operators, such as
> > +CPP_NOT, CPP_AND etc. "token->val.node.spelling" cannot be used in
> > +those cases, as is may not be initialized at all.
> > +
> > +[YOCTO #11738]
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + libcpp/lex.c | 26 +++++++++++++++++++++-----
> > + 1 file changed, 21 insertions(+), 5 deletions(-)
> > +
> > +diff --git a/libcpp/lex.c b/libcpp/lex.c
> > +index eedfcbb3146..15040a1b1f0 100644
> > +--- a/libcpp/lex.c
> > ++++ b/libcpp/lex.c
> > +@@ -3280,11 +3280,27 @@ cpp_spell_token (cpp_reader *pfile, const cpp=
_token *token,
> > +     spell_ident:
> > +     case SPELL_IDENT:
> > +       if (forstring)
> > +-    {
> > +-      memcpy (buffer, NODE_NAME (token->val.node.spelling),
> > +-              NODE_LEN (token->val.node.spelling));
> > +-      buffer +=3D NODE_LEN (token->val.node.spelling);
> > +-    }
> > ++        {
> > ++          if (token->type =3D=3D CPP_NAME)
> > ++            {
> > ++              memcpy (buffer, NODE_NAME (token->val.node.spelling),
> > ++                    NODE_LEN (token->val.node.spelling));
> > ++              buffer +=3D NODE_LEN (token->val.node.spelling);
> > ++              break;
> > ++            }
> > ++          /* NAMED_OP, cannot use node.spelling */
> > ++          if (token->flags & NAMED_OP)
> > ++            {
> > ++              const char *str =3D cpp_named_operator2name (token->ty=
pe);
> > ++              if (str)
> > ++                {
> > ++                  size_t len =3D strlen(str);
> > ++                  memcpy(buffer, str, len);
> > ++                  buffer +=3D len;
> > ++                }
> > ++              break;
> > ++            }
> > ++        }
> > +       else
> > +     buffer =3D _cpp_spell_ident_ucns (buffer, token->val.node.node);
> > +       break;
> > +--
> > +2.22.1
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0035-=
Fix-for-testsuite-failure.patch b/meta-arm-toolchain/recipes-devtools/gcc/g=
cc-arm-9.2/0035-Fix-for-testsuite-failure.patch
> > new file mode 100644
> > index 0000000..7470cbf
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0035-Fix-for=
-testsuite-failure.patch
> > @@ -0,0 +1,258 @@
> > +From 0f9d449c739df03782ce9d29f6b68d9af976a607 Mon Sep 17 00:00:00 200=
1
> > +From: RAGHUNATH LOLUR <raghunath.lolur@kpit.com>
> > +Date: Wed, 6 Dec 2017 22:52:26 -0800
> > +Subject: [PATCH 35/36] Fix for testsuite failure
> > +
> > +2017-11-16  Raghunath Lolur  <raghunath.lolur@kpit.com>
> > +
> > +     * gcc.dg/pr56275.c: If SSE is disabled, ensure that
> > +     "-mfpmath" is not set to use SSE. Set "-mfpmath=3D387".
> > +     * gcc.dg/pr68306.c: Likewise
> > +     * gcc.dg/pr68306-2.c: Likewise
> > +     * gcc.dg/pr68306-3.c: Likewise
> > +     * gcc.dg/pr69634.c: Likewise
> > +     * gcc.target/i386/amd64-abi-1.c: Likewise
> > +     * gcc.target/i386/funcspec-6.c: Likewise
> > +     * gcc.target/i386/interrupt-387-err-1.c: Likewise
> > +     * gcc.target/i386/isa-14.c: Likewise
> > +     * gcc.target/i386/pr44948-2b.c: Likewise
> > +     * gcc.target/i386/pr53425-1.c: Likewise
> > +     * gcc.target/i386/pr53425-2.c: Likewise
> > +     * gcc.target/i386/pr55247.c: Likewise
> > +     * gcc.target/i386/pr59644.c: Likewise
> > +     * gcc.target/i386/pr62120.c: Likewise
> > +     * gcc.target/i386/pr70467-1.c: Likewise
> > +     * gcc.target/i386/warn-vect-op-1.c: Likewise
> > +
> > +If -Wall, -Werror are used during compilation various test cases fail
> > +to compile.
> > +
> > +If SSE is disabled, be sure to -mfpmath=3D387 to resolve this.
> > +
> > +This patch removes the changes to Changelog from the original patch.
> > +This will help us avoid conflicts.
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> > +---
> > + gcc/testsuite/gcc.dg/pr56275.c                      | 2 +-
> > + gcc/testsuite/gcc.dg/pr68306-2.c                    | 2 +-
> > + gcc/testsuite/gcc.dg/pr68306-3.c                    | 2 +-
> > + gcc/testsuite/gcc.dg/pr68306.c                      | 2 +-
> > + gcc/testsuite/gcc.dg/pr69634.c                      | 2 +-
> > + gcc/testsuite/gcc.target/i386/amd64-abi-1.c         | 2 +-
> > + gcc/testsuite/gcc.target/i386/funcspec-6.c          | 1 +
> > + gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c | 2 +-
> > + gcc/testsuite/gcc.target/i386/isa-14.c              | 2 +-
> > + gcc/testsuite/gcc.target/i386/pr44948-2b.c          | 2 +-
> > + gcc/testsuite/gcc.target/i386/pr53425-1.c           | 2 +-
> > + gcc/testsuite/gcc.target/i386/pr53425-2.c           | 2 +-
> > + gcc/testsuite/gcc.target/i386/pr55247.c             | 2 +-
> > + gcc/testsuite/gcc.target/i386/pr59644.c             | 2 +-
> > + gcc/testsuite/gcc.target/i386/pr62120.c             | 2 +-
> > + gcc/testsuite/gcc.target/i386/pr70467-1.c           | 2 +-
> > + gcc/testsuite/gcc.target/i386/warn-vect-op-1.c      | 2 +-
> > + 17 files changed, 17 insertions(+), 16 deletions(-)
> > +
> > +diff --git a/gcc/testsuite/gcc.dg/pr56275.c b/gcc/testsuite/gcc.dg/pr=
56275.c
> > +index b901bb2b199..a4f6c95e1a1 100644
> > +--- a/gcc/testsuite/gcc.dg/pr56275.c
> > ++++ b/gcc/testsuite/gcc.dg/pr56275.c
> > +@@ -1,6 +1,6 @@
> > + /* { dg-do compile } */
> > + /* { dg-options "-O2" } */
> > +-/* { dg-additional-options "-mno-sse" { target { i?86-*-* x86_64-*-*=
 } } } */
> > ++/* { dg-additional-options "-mno-sse -mfpmath=3D387" { target { i?86=
-*-* x86_64-*-* } } } */
> > +
> > + typedef long long v2tw __attribute__ ((vector_size (2 * sizeof (long=
 long))));
> > +
> > +diff --git a/gcc/testsuite/gcc.dg/pr68306-2.c b/gcc/testsuite/gcc.dg/=
pr68306-2.c
> > +index 4672ebe7987..2a368c484b6 100644
> > +--- a/gcc/testsuite/gcc.dg/pr68306-2.c
> > ++++ b/gcc/testsuite/gcc.dg/pr68306-2.c
> > +@@ -1,6 +1,6 @@
> > + /* { dg-do compile } */
> > + /* { dg-options "-O3" } */
> > +-/* { dg-additional-options "-mno-sse -mno-mmx" { target i?86-*-* x86=
_64-*-* } } */
> > ++/* { dg-additional-options "-mno-sse -mno-mmx -mfpmath=3D387" { targ=
et i?86-*-* x86_64-*-* } } */
> > +
> > + struct {
> > +     int tz_minuteswest;
> > +diff --git a/gcc/testsuite/gcc.dg/pr68306-3.c b/gcc/testsuite/gcc.dg/=
pr68306-3.c
> > +index f5a8c102cf8..df3390c64c2 100644
> > +--- a/gcc/testsuite/gcc.dg/pr68306-3.c
> > ++++ b/gcc/testsuite/gcc.dg/pr68306-3.c
> > +@@ -1,6 +1,6 @@
> > + /* { dg-do compile } */
> > + /* { dg-options "-O3" } */
> > +-/* { dg-additional-options "-mno-sse -mno-mmx" { target i?86-*-* x86=
_64-*-* } } */
> > ++/* { dg-additional-options "-mno-sse -mno-mmx -mfpmath=3D387" { targ=
et i?86-*-* x86_64-*-* } } */
> > + /* { dg-additional-options "-mno-altivec -mno-vsx" { target powerpc*=
-*-* } } */
> > +
> > + extern void fn2();
> > +diff --git a/gcc/testsuite/gcc.dg/pr68306.c b/gcc/testsuite/gcc.dg/pr=
68306.c
> > +index 54e5b40f221..0813389e2c1 100644
> > +--- a/gcc/testsuite/gcc.dg/pr68306.c
> > ++++ b/gcc/testsuite/gcc.dg/pr68306.c
> > +@@ -1,6 +1,6 @@
> > + /* { dg-do compile } */
> > + /* { dg-options "-O3" } */
> > +-/* { dg-additional-options "-mno-sse -mno-mmx" { target i?86-*-* x86=
_64-*-* } } */
> > ++/* { dg-additional-options "-mno-sse -mno-mmx -mfpmath=3D387" { targ=
et i?86-*-* x86_64-*-* } } */
> > +
> > + enum powerpc_pmc_type { PPC_PMC_IBM };
> > + struct {
> > +diff --git a/gcc/testsuite/gcc.dg/pr69634.c b/gcc/testsuite/gcc.dg/pr=
69634.c
> > +index 60a56149463..bcc23f9ccd6 100644
> > +--- a/gcc/testsuite/gcc.dg/pr69634.c
> > ++++ b/gcc/testsuite/gcc.dg/pr69634.c
> > +@@ -1,6 +1,6 @@
> > + /* { dg-do compile } */
> > + /* { dg-options "-O2 -fno-dce -fschedule-insns -fno-tree-vrp -fcompa=
re-debug -Wno-psabi" } */
> > +-/* { dg-additional-options "-mno-sse" { target i?86-*-* x86_64-*-* }=
 } */
> > ++/* { dg-additional-options "-mno-sse -mfpmath=3D387" { target i?86-*=
-* x86_64-*-* } } */
> > + /* { dg-require-effective-target scheduling } */
> > +
> > + typedef unsigned short u16;
> > +diff --git a/gcc/testsuite/gcc.target/i386/amd64-abi-1.c b/gcc/testsu=
ite/gcc.target/i386/amd64-abi-1.c
> > +index 69fde57bf06..7f1f1c03edf 100644
> > +--- a/gcc/testsuite/gcc.target/i386/amd64-abi-1.c
> > ++++ b/gcc/testsuite/gcc.target/i386/amd64-abi-1.c
> > +@@ -1,5 +1,5 @@
> > + /* { dg-do compile { target { ! ia32 } } } */
> > +-/* { dg-options "-mno-sse" } */
> > ++/* { dg-options "-mno-sse -mfpmath=3D387" } */
> > + /* { dg-additional-options "-mabi=3Dsysv" { target *-*-mingw* } } */
> > +
> > + double foo(void) { return 0; }      /* { dg-error "SSE disabled" } *=
/
> > +diff --git a/gcc/testsuite/gcc.target/i386/funcspec-6.c b/gcc/testsui=
te/gcc.target/i386/funcspec-6.c
> > +index ea896b7ebfd..bf15569b826 100644
> > +--- a/gcc/testsuite/gcc.target/i386/funcspec-6.c
> > ++++ b/gcc/testsuite/gcc.target/i386/funcspec-6.c
> > +@@ -1,6 +1,7 @@
> > + /* Test whether all of the 64-bit function specific options are acce=
pted
> > +    without error.  */
> > + /* { dg-do compile { target { ! ia32 } } } */
> > ++/* { dg-additional-options "-mfpmath=3D387" } */
> > +
> > + #include "funcspec-56.inc"
> > +
> > +diff --git a/gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c b/gc=
c/testsuite/gcc.target/i386/interrupt-387-err-1.c
> > +index 8561a3c26d6..6377f814645 100644
> > +--- a/gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c
> > ++++ b/gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c
> > +@@ -1,5 +1,5 @@
> > + /* { dg-do compile } */
> > +-/* { dg-options "-O2 -mgeneral-regs-only -mno-cld -mno-iamcu -m80387=
" } */
> > ++/* { dg-options "-O2 -mgeneral-regs-only -mno-cld -mno-iamcu -m80387=
 -mfpmath=3D387" } */
> > +
> > + typedef unsigned int uword_t __attribute__ ((mode (__word__)));
> > +
> > +diff --git a/gcc/testsuite/gcc.target/i386/isa-14.c b/gcc/testsuite/g=
cc.target/i386/isa-14.c
> > +index 5d49e6e77fe..1de2db92bdd 100644
> > +--- a/gcc/testsuite/gcc.target/i386/isa-14.c
> > ++++ b/gcc/testsuite/gcc.target/i386/isa-14.c
> > +@@ -1,5 +1,5 @@
> > + /* { dg-do run } */
> > +-/* { dg-options "-march=3Dx86-64 -msse4a -mfma4 -mno-sse" } */
> > ++/* { dg-options "-march=3Dx86-64 -msse4a -mfma4 -mno-sse -mfpmath=3D=
387" } */
> > +
> > + extern void abort (void);
> > +
> > +diff --git a/gcc/testsuite/gcc.target/i386/pr44948-2b.c b/gcc/testsui=
te/gcc.target/i386/pr44948-2b.c
> > +index fa1769b62fb..f79fb12726f 100644
> > +--- a/gcc/testsuite/gcc.target/i386/pr44948-2b.c
> > ++++ b/gcc/testsuite/gcc.target/i386/pr44948-2b.c
> > +@@ -1,5 +1,5 @@
> > + /* { dg-do compile } */
> > +-/* { dg-options "-O -mno-sse -Wno-psabi -mtune=3Dgeneric" } */
> > ++/* { dg-options "-O -mno-sse -Wno-psabi -mtune=3Dgeneric -mfpmath=3D=
387" } */
> > +
> > + struct A
> > + {
> > +diff --git a/gcc/testsuite/gcc.target/i386/pr53425-1.c b/gcc/testsuit=
e/gcc.target/i386/pr53425-1.c
> > +index 2e89ff7d81d..6339bf6b736 100644
> > +--- a/gcc/testsuite/gcc.target/i386/pr53425-1.c
> > ++++ b/gcc/testsuite/gcc.target/i386/pr53425-1.c
> > +@@ -1,6 +1,6 @@
> > + /* PR target/53425 */
> > + /* { dg-do compile { target { ! ia32 } } } */
> > +-/* { dg-options "-O2 -mno-sse" } */
> > ++/* { dg-options "-O2 -mno-sse -mfpmath=3D387" } */
> > + /* { dg-skip-if "no SSE vector" { x86_64-*-mingw* } } */
> > +
> > + typedef double __v2df __attribute__ ((__vector_size__ (16)));
> > +diff --git a/gcc/testsuite/gcc.target/i386/pr53425-2.c b/gcc/testsuit=
e/gcc.target/i386/pr53425-2.c
> > +index 61f6283dbe9..2c5a55f0ac3 100644
> > +--- a/gcc/testsuite/gcc.target/i386/pr53425-2.c
> > ++++ b/gcc/testsuite/gcc.target/i386/pr53425-2.c
> > +@@ -1,6 +1,6 @@
> > + /* PR target/53425 */
> > + /* { dg-do compile { target { ! ia32 } } } */
> > +-/* { dg-options "-O2 -mno-sse" } */
> > ++/* { dg-options "-O2 -mno-sse -mfpmath=3D387" } */
> > + /* { dg-skip-if "no SSE vector" { x86_64-*-mingw* } } */
> > +
> > + typedef float __v2sf __attribute__ ((__vector_size__ (8)));
> > +diff --git a/gcc/testsuite/gcc.target/i386/pr55247.c b/gcc/testsuite/=
gcc.target/i386/pr55247.c
> > +index 23366d0909d..9810e3abb76 100644
> > +--- a/gcc/testsuite/gcc.target/i386/pr55247.c
> > ++++ b/gcc/testsuite/gcc.target/i386/pr55247.c
> > +@@ -1,6 +1,6 @@
> > + /* { dg-do compile { target { ! ia32 } } } */
> > + /* { dg-require-effective-target maybe_x32 } */
> > +-/* { dg-options "-O2 -mno-sse -mno-mmx -mx32 -maddress-mode=3Dlong" =
} */
> > ++/* { dg-options "-O2 -mno-sse -mno-mmx -mx32 -maddress-mode=3Dlong -=
mfpmath=3D387" } */
> > +
> > + typedef unsigned int uint32_t;
> > + typedef uint32_t Elf32_Word;
> > +diff --git a/gcc/testsuite/gcc.target/i386/pr59644.c b/gcc/testsuite/=
gcc.target/i386/pr59644.c
> > +index 96006b3e338..4287e4538bf 100644
> > +--- a/gcc/testsuite/gcc.target/i386/pr59644.c
> > ++++ b/gcc/testsuite/gcc.target/i386/pr59644.c
> > +@@ -1,6 +1,6 @@
> > + /* PR target/59644 */
> > + /* { dg-do run { target lp64 } } */
> > +-/* { dg-options "-O2 -ffreestanding -mno-sse -mpreferred-stack-bound=
ary=3D3 -maccumulate-outgoing-args -mno-red-zone" } */
> > ++/* { dg-options "-O2 -ffreestanding -mno-sse -mpreferred-stack-bound=
ary=3D3 -maccumulate-outgoing-args -mno-red-zone -mfpmath=3D387" } */
> > +
> > + /* This test uses __builtin_trap () instead of e.g. abort,
> > +    because due to -mpreferred-stack-boundary=3D3 it should not call
> > +diff --git a/gcc/testsuite/gcc.target/i386/pr62120.c b/gcc/testsuite/=
gcc.target/i386/pr62120.c
> > +index bfb8c4703eb..ed04cf181f3 100644
> > +--- a/gcc/testsuite/gcc.target/i386/pr62120.c
> > ++++ b/gcc/testsuite/gcc.target/i386/pr62120.c
> > +@@ -1,5 +1,5 @@
> > + /* { dg-do compile } */
> > +-/* { dg-options "-mno-sse" } */
> > ++/* { dg-options "-mno-sse -mfpmath=3D387" } */
> > +
> > + void foo ()
> > + {
> > +diff --git a/gcc/testsuite/gcc.target/i386/pr70467-1.c b/gcc/testsuit=
e/gcc.target/i386/pr70467-1.c
> > +index 4e112c88d07..bcfb396a68d 100644
> > +--- a/gcc/testsuite/gcc.target/i386/pr70467-1.c
> > ++++ b/gcc/testsuite/gcc.target/i386/pr70467-1.c
> > +@@ -1,6 +1,6 @@
> > + /* PR rtl-optimization/70467 */
> > + /* { dg-do compile } */
> > +-/* { dg-options "-O2 -mno-sse" } */
> > ++/* { dg-options "-O2 -mno-sse -mfpmath=3D387" } */
> > +
> > + void foo (unsigned long long *);
> > +
> > +diff --git a/gcc/testsuite/gcc.target/i386/warn-vect-op-1.c b/gcc/tes=
tsuite/gcc.target/i386/warn-vect-op-1.c
> > +index 6cda1534311..26e37f5b8ba 100644
> > +--- a/gcc/testsuite/gcc.target/i386/warn-vect-op-1.c
> > ++++ b/gcc/testsuite/gcc.target/i386/warn-vect-op-1.c
> > +@@ -1,5 +1,5 @@
> > + /* { dg-do compile { target { ! ia32 } } }  */
> > +-/* { dg-options "-mno-sse -Wvector-operation-performance" }  */
> > ++/* { dg-options "-mno-sse -Wvector-operation-performance -mfpmath=3D=
387" }  */
> > + #define vector(elcount, type)  \
> > + __attribute__((vector_size((elcount)*sizeof(type)))) type
> > +
> > +--
> > +2.22.1
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0036-=
Re-introduce-spe-commandline-options.patch b/meta-arm-toolchain/recipes-dev=
tools/gcc/gcc-arm-9.2/0036-Re-introduce-spe-commandline-options.patch
> > new file mode 100644
> > index 0000000..4dbcd98
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0036-Re-intr=
oduce-spe-commandline-options.patch
> > @@ -0,0 +1,41 @@
> > +From 71e99c2b58a9eb00cdd65a04aeb6fb78227e3297 Mon Sep 17 00:00:00 200=
1
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Wed, 6 Jun 2018 12:10:22 -0700
> > +Subject: [PATCH 36/36] Re-introduce spe commandline options
> > +
> > +This should ensure that we keep accepting
> > +spe options
> > +
> > +Upstream-Status: Inappropriate [SPE port is removed from rs600 port]
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + gcc/config/rs6000/rs6000.opt | 12 ++++++++++++
> > + 1 file changed, 12 insertions(+)
> > +
> > +diff --git a/gcc/config/rs6000/rs6000.opt b/gcc/config/rs6000/rs6000.=
opt
> > +index f4b5c91e11f..69869350fce 100644
> > +--- a/gcc/config/rs6000/rs6000.opt
> > ++++ b/gcc/config/rs6000/rs6000.opt
> > +@@ -345,6 +345,18 @@ mdebug=3D
> > + Target RejectNegative Joined
> > + -mdebug=3D    Enable debug output.
> > +
> > ++mspe
> > ++Target Var(rs6000_spe) Save
> > ++Generate SPE SIMD instructions on E500.
> > ++
> > ++mabi=3Dspe
> > ++Target RejectNegative Var(rs6000_spe_abi) Save
> > ++Use the SPE ABI extensions.
> > ++
> > ++mabi=3Dno-spe
> > ++Target RejectNegative Var(rs6000_spe_abi, 0)
> > ++Do not use the SPE ABI extensions.
> > ++
> > + mabi=3Daltivec
> > + Target RejectNegative Var(rs6000_altivec_abi) Save
> > + Use the AltiVec ABI extensions.
> > +--
> > +2.22.1
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0037-=
Fix-up-libsanitizer-build-with-master-glibc.patch b/meta-arm-toolchain/reci=
pes-devtools/gcc/gcc-arm-9.2/0037-Fix-up-libsanitizer-build-with-master-gli=
bc.patch
> > new file mode 100644
> > index 0000000..abe074c
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2/0037-Fix-up-=
libsanitizer-build-with-master-glibc.patch
> > @@ -0,0 +1,70 @@
> > +From 7ed24d12664319f34625a12fd8c0f729a0e71f5c Mon Sep 17 00:00:00 200=
1
> > +From: Auto Builder <ab@rdk>
> > +Date: Sun, 22 Dec 2019 02:58:24 +0000
> > +Subject: [PATCH] Fix up libsanitizer build with master glibc
> > +
> > +2019-11-26  Jakub Jelinek  <jakub@redhat.com>
> > +
> > +     PR sanitizer/92154
> > +     * sanitizer_common/sanitizer_platform_limits_posix.h: Cherry-pic=
k
> > +     llvm-project revision 947f9692440836dcb8d88b74b69dd379d85974ce.
> > +     * sanitizer_common/sanitizer_platform_limits_posix.cpp: Likewise=
.
> > +
> > +Upstream-Status: Backport [https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dc=
ommitdiff;h=3Db02486e0951bc0ed38310a03be73e479fc6f3e7a;hp=3D3feeac76ffc3842=
7de2d7d086e2928e63eee2d44]
> > +Signed-off-by: Auto Builder <ab@rdk>
> > +---
> > + .../sanitizer_platform_limits_posix.cc            |  5 +++--
> > + .../sanitizer_platform_limits_posix.h             | 15 +------------=
--
> > + 2 files changed, 4 insertions(+), 16 deletions(-)
> > +
> > +diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_=
posix.cc b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc
> > +index 6cd4a5bac..d823a1219 100644
> > +--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.c=
c
> > ++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.c=
c
> > +@@ -1156,8 +1156,9 @@ CHECK_SIZE_AND_OFFSET(ipc_perm, uid);
> > + CHECK_SIZE_AND_OFFSET(ipc_perm, gid);
> > + CHECK_SIZE_AND_OFFSET(ipc_perm, cuid);
> > + CHECK_SIZE_AND_OFFSET(ipc_perm, cgid);
> > +-#if !defined(__aarch64__) || !SANITIZER_LINUX || __GLIBC_PREREQ (2, =
21)
> > +-/* On aarch64 glibc 2.20 and earlier provided incorrect mode field. =
 */
> > ++#if !SANITIZER_LINUX || __GLIBC_PREREQ (2, 31)
> > ++/* glibc 2.30 and earlier provided 16-bit mode field instead of 32-b=
it
> > ++   on many architectures.  */
> > + CHECK_SIZE_AND_OFFSET(ipc_perm, mode);
> > + #endif
> > +
> > +diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_=
posix.h b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
> > +index 73af92af1..6a673a7c9 100644
> > +--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
> > ++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
> > +@@ -211,26 +211,13 @@ namespace __sanitizer {
> > +     u64 __unused1;
> > +     u64 __unused2;
> > + #elif defined(__sparc__)
> > +-#if defined(__arch64__)
> > +     unsigned mode;
> > +-    unsigned short __pad1;
> > +-#else
> > +-    unsigned short __pad1;
> > +-    unsigned short mode;
> > +     unsigned short __pad2;
> > +-#endif
> > +     unsigned short __seq;
> > +     unsigned long long __unused1;
> > +     unsigned long long __unused2;
> > +-#elif defined(__mips__) || defined(__aarch64__) || defined(__s390x__=
)
> > +-    unsigned int mode;
> > +-    unsigned short __seq;
> > +-    unsigned short __pad1;
> > +-    unsigned long __unused1;
> > +-    unsigned long __unused2;
> > + #else
> > +-    unsigned short mode;
> > +-    unsigned short __pad1;
> > ++    unsigned int mode;
> > +     unsigned short __seq;
> > +     unsigned short __pad2;
> > + #if defined(__x86_64__) && !defined(_LP64)
> > +--
> > +2.17.1
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross-canadia=
n_arm-8.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross-canadian_a=
rm-8.2.bb
> > new file mode 100644
> > index 0000000..8987a4c
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross-canadian_arm-8=
.2.bb
> > @@ -0,0 +1,5 @@
> > +require recipes-devtools/gcc/gcc-${PV}.inc
> > +require recipes-devtools/gcc/gcc-cross-canadian.inc
> > +
> > +
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross-canadia=
n_arm-8.3.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross-canadian_a=
rm-8.3.bb
> > new file mode 100644
> > index 0000000..8987a4c
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross-canadian_arm-8=
.3.bb
> > @@ -0,0 +1,5 @@
> > +require recipes-devtools/gcc/gcc-${PV}.inc
> > +require recipes-devtools/gcc/gcc-cross-canadian.inc
> > +
> > +
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross-canadia=
n_arm-9.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross-canadian_a=
rm-9.2.bb
> > new file mode 100644
> > index 0000000..8987a4c
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross-canadian_arm-9=
.2.bb
> > @@ -0,0 +1,5 @@
> > +require recipes-devtools/gcc/gcc-${PV}.inc
> > +require recipes-devtools/gcc/gcc-cross-canadian.inc
> > +
> > +
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_arm-8.2=
.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_arm-8.2.bb
> > new file mode 100644
> > index 0000000..0a8aa75
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_arm-8.2.bb
> > @@ -0,0 +1,3 @@
> > +require recipes-devtools/gcc/gcc-${PV}.inc
> > +require recipes-devtools/gcc/gcc-cross.inc
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_arm-8.3=
.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_arm-8.3.bb
> > new file mode 100644
> > index 0000000..0a8aa75
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_arm-8.3.bb
> > @@ -0,0 +1,3 @@
> > +require recipes-devtools/gcc/gcc-${PV}.inc
> > +require recipes-devtools/gcc/gcc-cross.inc
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_arm-9.2=
.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_arm-9.2.bb
> > new file mode 100644
> > index 0000000..0a8aa75
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_arm-9.2.bb
> > @@ -0,0 +1,3 @@
> > +require recipes-devtools/gcc/gcc-${PV}.inc
> > +require recipes-devtools/gcc/gcc-cross.inc
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-crosssdk_arm-=
8.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-crosssdk_arm-8.2.bb
> > new file mode 100644
> > index 0000000..0a9f98a
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-crosssdk_arm-8.2.bb
> > @@ -0,0 +1,2 @@
> > +require recipes-devtools/gcc/gcc-cross_${PV}.bb
> > +require recipes-devtools/gcc/gcc-crosssdk.inc
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-crosssdk_arm-=
8.3.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-crosssdk_arm-8.3.bb
> > new file mode 100644
> > index 0000000..0a9f98a
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-crosssdk_arm-8.3.bb
> > @@ -0,0 +1,2 @@
> > +require recipes-devtools/gcc/gcc-cross_${PV}.bb
> > +require recipes-devtools/gcc/gcc-crosssdk.inc
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-crosssdk_arm-=
9.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-crosssdk_arm-9.2.bb
> > new file mode 100644
> > index 0000000..0a9f98a
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-crosssdk_arm-9.2.bb
> > @@ -0,0 +1,2 @@
> > +require recipes-devtools/gcc/gcc-cross_${PV}.bb
> > +require recipes-devtools/gcc/gcc-crosssdk.inc
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-runtime_arm-8=
.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-runtime_arm-8.2.bb
> > new file mode 100644
> > index 0000000..8f41c11
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-runtime_arm-8.2.bb
> > @@ -0,0 +1,7 @@
> > +require recipes-devtools/gcc/gcc-${PV}.inc
> > +require recipes-devtools/gcc/gcc-runtime.inc
> > +
> > +FILES_libgomp-dev +=3D "\
> > +    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/openacc.h \
> > +"
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-runtime_arm-8=
.3.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-runtime_arm-8.3.bb
> > new file mode 100644
> > index 0000000..8f41c11
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-runtime_arm-8.3.bb
> > @@ -0,0 +1,7 @@
> > +require recipes-devtools/gcc/gcc-${PV}.inc
> > +require recipes-devtools/gcc/gcc-runtime.inc
> > +
> > +FILES_libgomp-dev +=3D "\
> > +    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/openacc.h \
> > +"
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-runtime_arm-9=
.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-runtime_arm-9.2.bb
> > new file mode 100644
> > index 0000000..b755f55
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-runtime_arm-9.2.bb
> > @@ -0,0 +1,2 @@
> > +require recipes-devtools/gcc/gcc-${PV}.inc
> > +require recipes-devtools/gcc/gcc-runtime.inc
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-sanitizers_ar=
m-8.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-sanitizers_arm-8.2.b=
b
> > new file mode 100644
> > index 0000000..03769bf
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-sanitizers_arm-8.2.b=
b
> > @@ -0,0 +1,2 @@
> > +require recipes-devtools/gcc/gcc-${PV}.inc
> > +require recipes-devtools/gcc/gcc-sanitizers.inc
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-sanitizers_ar=
m-8.3.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-sanitizers_arm-8.3.b=
b
> > new file mode 100644
> > index 0000000..03769bf
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-sanitizers_arm-8.3.b=
b
> > @@ -0,0 +1,2 @@
> > +require recipes-devtools/gcc/gcc-${PV}.inc
> > +require recipes-devtools/gcc/gcc-sanitizers.inc
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-sanitizers_ar=
m-9.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-sanitizers_arm-9.2.b=
b
> > new file mode 100644
> > index 0000000..9c41e92
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-sanitizers_arm-9.2.b=
b
> > @@ -0,0 +1,7 @@
> > +require recipes-devtools/gcc/gcc-${PV}.inc
> > +require recipes-devtools/gcc/gcc-sanitizers.inc
> > +
> > +# Building with thumb enabled on armv4t armv5t fails with
> > +# sanitizer_linux.s:5749: Error: lo register required -- `ldr ip,[sp]=
,#8'
> > +ARM_INSTRUCTION_SET_armv4 =3D "arm"
> > +ARM_INSTRUCTION_SET_armv5 =3D "arm"
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-source_arm-8.=
2.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-source_arm-8.2.bb
> > new file mode 100644
> > index 0000000..b890fa3
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-source_arm-8.2.bb
> > @@ -0,0 +1,4 @@
> > +require recipes-devtools/gcc/gcc-${PV}.inc
> > +require recipes-devtools/gcc/gcc-source.inc
> > +
> > +EXCLUDE_FROM_WORLD =3D "1"
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-source_arm-8.=
3.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-source_arm-8.3.bb
> > new file mode 100644
> > index 0000000..b890fa3
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-source_arm-8.3.bb
> > @@ -0,0 +1,4 @@
> > +require recipes-devtools/gcc/gcc-${PV}.inc
> > +require recipes-devtools/gcc/gcc-source.inc
> > +
> > +EXCLUDE_FROM_WORLD =3D "1"
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-source_arm-9.=
2.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-source_arm-9.2.bb
> > new file mode 100644
> > index 0000000..b890fa3
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-source_arm-9.2.bb
> > @@ -0,0 +1,4 @@
> > +require recipes-devtools/gcc/gcc-${PV}.inc
> > +require recipes-devtools/gcc/gcc-source.inc
> > +
> > +EXCLUDE_FROM_WORLD =3D "1"
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-8.2.bb b/=
meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-8.2.bb
> > new file mode 100644
> > index 0000000..c4a2de2
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-8.2.bb
> > @@ -0,0 +1,14 @@
> > +require recipes-devtools/gcc/gcc-${PV}.inc
> > +require recipes-devtools/gcc/gcc-target.inc
> > +
> > +# Building with thumb enabled on armv4t armv5t fails with
> > +# | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7438:(.text.unlikely+0x2fa):=
 relocation truncated to fit: R_ARM_THM_CALL against symbol `fancy_abort(ch=
ar const*, int, char const*)' defined in .glue_7 section in linker stubs
> > +# | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7442:(.text.unlikely+0x318):=
 additional relocation overflows omitted from the output
> > +ARM_INSTRUCTION_SET_armv4 =3D "arm"
> > +ARM_INSTRUCTION_SET_armv5 =3D "arm"
> > +
> > +ARMFPARCHEXT_armv6 =3D "${@'+fp' if d.getVar('TARGET_FPU') =3D=3D 'ha=
rd' else ''}"
> > +ARMFPARCHEXT_armv7a =3D "${@'+fp' if d.getVar('TARGET_FPU') =3D=3D 'h=
ard' else ''}"
> > +ARMFPARCHEXT_armv7ve =3D "${@'+fp' if d.getVar('TARGET_FPU') =3D=3D '=
hard' else ''}"
> > +
> > +BBCLASSEXTEND =3D "nativesdk"
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-8.3.bb b/=
meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-8.3.bb
> > new file mode 100644
> > index 0000000..c4a2de2
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-8.3.bb
> > @@ -0,0 +1,14 @@
> > +require recipes-devtools/gcc/gcc-${PV}.inc
> > +require recipes-devtools/gcc/gcc-target.inc
> > +
> > +# Building with thumb enabled on armv4t armv5t fails with
> > +# | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7438:(.text.unlikely+0x2fa):=
 relocation truncated to fit: R_ARM_THM_CALL against symbol `fancy_abort(ch=
ar const*, int, char const*)' defined in .glue_7 section in linker stubs
> > +# | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7442:(.text.unlikely+0x318):=
 additional relocation overflows omitted from the output
> > +ARM_INSTRUCTION_SET_armv4 =3D "arm"
> > +ARM_INSTRUCTION_SET_armv5 =3D "arm"
> > +
> > +ARMFPARCHEXT_armv6 =3D "${@'+fp' if d.getVar('TARGET_FPU') =3D=3D 'ha=
rd' else ''}"
> > +ARMFPARCHEXT_armv7a =3D "${@'+fp' if d.getVar('TARGET_FPU') =3D=3D 'h=
ard' else ''}"
> > +ARMFPARCHEXT_armv7ve =3D "${@'+fp' if d.getVar('TARGET_FPU') =3D=3D '=
hard' else ''}"
> > +
> > +BBCLASSEXTEND =3D "nativesdk"
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-9.2.bb b/=
meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-9.2.bb
> > new file mode 100644
> > index 0000000..c4a2de2
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-9.2.bb
> > @@ -0,0 +1,14 @@
> > +require recipes-devtools/gcc/gcc-${PV}.inc
> > +require recipes-devtools/gcc/gcc-target.inc
> > +
> > +# Building with thumb enabled on armv4t armv5t fails with
> > +# | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7438:(.text.unlikely+0x2fa):=
 relocation truncated to fit: R_ARM_THM_CALL against symbol `fancy_abort(ch=
ar const*, int, char const*)' defined in .glue_7 section in linker stubs
> > +# | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7442:(.text.unlikely+0x318):=
 additional relocation overflows omitted from the output
> > +ARM_INSTRUCTION_SET_armv4 =3D "arm"
> > +ARM_INSTRUCTION_SET_armv5 =3D "arm"
> > +
> > +ARMFPARCHEXT_armv6 =3D "${@'+fp' if d.getVar('TARGET_FPU') =3D=3D 'ha=
rd' else ''}"
> > +ARMFPARCHEXT_armv7a =3D "${@'+fp' if d.getVar('TARGET_FPU') =3D=3D 'h=
ard' else ''}"
> > +ARMFPARCHEXT_armv7ve =3D "${@'+fp' if d.getVar('TARGET_FPU') =3D=3D '=
hard' else ''}"
> > +
> > +BBCLASSEXTEND =3D "nativesdk"
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/libgcc-initial_ar=
m-8.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/libgcc-initial_arm-8.2.b=
b
> > new file mode 100644
> > index 0000000..3e07c71
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/libgcc-initial_arm-8.2.b=
b
> > @@ -0,0 +1,2 @@
> > +require recipes-devtools/gcc/gcc-${PV}.inc
> > +require recipes-devtools/gcc/libgcc-initial.inc
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/libgcc-initial_ar=
m-8.3.bb b/meta-arm-toolchain/recipes-devtools/gcc/libgcc-initial_arm-8.3.b=
b
> > new file mode 100644
> > index 0000000..3e07c71
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/libgcc-initial_arm-8.3.b=
b
> > @@ -0,0 +1,2 @@
> > +require recipes-devtools/gcc/gcc-${PV}.inc
> > +require recipes-devtools/gcc/libgcc-initial.inc
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/libgcc-initial_ar=
m-9.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/libgcc-initial_arm-9.2.b=
b
> > new file mode 100644
> > index 0000000..32f3dc0
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/libgcc-initial_arm-9.2.b=
b
> > @@ -0,0 +1,5 @@
> > +require recipes-devtools/gcc/gcc-${PV}.inc
> > +require recipes-devtools/gcc/libgcc-initial.inc
> > +
> > +# Building with thumb enabled on armv6t fails
> > +ARM_INSTRUCTION_SET_armv6 =3D "arm"
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/libgcc_arm-8.2.bb=
 b/meta-arm-toolchain/recipes-devtools/gcc/libgcc_arm-8.2.bb
> > new file mode 100644
> > index 0000000..340300c
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/libgcc_arm-8.2.bb
> > @@ -0,0 +1,2 @@
> > +require recipes-devtools/gcc/gcc-${PV}.inc
> > +require recipes-devtools/gcc/libgcc.inc
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/libgcc_arm-8.3.bb=
 b/meta-arm-toolchain/recipes-devtools/gcc/libgcc_arm-8.3.bb
> > new file mode 100644
> > index 0000000..340300c
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/libgcc_arm-8.3.bb
> > @@ -0,0 +1,2 @@
> > +require recipes-devtools/gcc/gcc-${PV}.inc
> > +require recipes-devtools/gcc/libgcc.inc
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/libgcc_arm-9.2.bb=
 b/meta-arm-toolchain/recipes-devtools/gcc/libgcc_arm-9.2.bb
> > new file mode 100644
> > index 0000000..572bab1
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/libgcc_arm-9.2.bb
> > @@ -0,0 +1,5 @@
> > +require recipes-devtools/gcc/gcc-${PV}.inc
> > +require recipes-devtools/gcc/libgcc.inc
> > +
> > +# Building with thumb enabled on armv6t fails
> > +ARM_INSTRUCTION_SET_armv6 =3D "arm"
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/libgfortran_arm-8=
.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/libgfortran_arm-8.2.bb
> > new file mode 100644
> > index 0000000..4e5688e
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/libgfortran_arm-8.2.bb
> > @@ -0,0 +1,3 @@
> > +require recipes-devtools/gcc/gcc-${PV}.inc
> > +require recipes-devtools/gcc/libgfortran.inc
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/libgfortran_arm-8=
.3.bb b/meta-arm-toolchain/recipes-devtools/gcc/libgfortran_arm-8.3.bb
> > new file mode 100644
> > index 0000000..4e5688e
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/libgfortran_arm-8.3.bb
> > @@ -0,0 +1,3 @@
> > +require recipes-devtools/gcc/gcc-${PV}.inc
> > +require recipes-devtools/gcc/libgfortran.inc
> > +
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/libgfortran_arm-9=
.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/libgfortran_arm-9.2.bb
> > new file mode 100644
> > index 0000000..4e5688e
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/libgfortran_arm-9.2.bb
> > @@ -0,0 +1,3 @@
> > +require recipes-devtools/gcc/gcc-${PV}.inc
> > +require recipes-devtools/gcc/libgfortran.inc
> > +
> > --
> > 2.7.4
> >
>=20
