Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE3EC54F64
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:45 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web09.31851.1649054694281534345
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 03 Apr 2022 23:44:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=xmK+v1VC;
 spf=pass (domain: linaro.org, ip: 209.85.216.41,
 mailfrom: sumit.garg@linaro.org)
Received: by mail-pj1-f41.google.com with SMTP id
 o5-20020a17090ad20500b001ca8a1dc47aso2402755pju.1
        for <meta-arm@lists.yoctoproject.org>;
 Sun, 03 Apr 2022 23:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TcHEpTDTofGWfUdB3LpxA6W8GSrZrafv17C7ZbS6iMA=;
        b=xmK+v1VCgI4WwOzhv1dBnWvO9qR5aCGTgkyBfyu703aHMjOy/CgPfj2j+pno6Hepyf
         BFskjmvG7pm+abOfXPY1y6qydO/uoplNp3HWjSycKMG4vTj8cHahUbs+VczJ9hrDrsAg
         7ExKpu19WL6e/AKNOtq8yUoGIU14k+MJVOtH6VoBsSik8brAbRYSHcifmn+t9/MSS47P
         WtjEw+wLa9aXdHqS0mjsnIb9jUc10ySVZSRgo38Zro6nQMT7pGFa1txZlXzyshI1nnn9
         7I32m/lH7k25d9hHT/CYie8DUMT8dW1gRErYtz4tIkKvHo//g3P22tJWhw37Y+NGcjsq
         PSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TcHEpTDTofGWfUdB3LpxA6W8GSrZrafv17C7ZbS6iMA=;
        b=RkPnBGkvNFpYNaUU5fbCZiQEhCKTPr111zx1/NoieFhev3YLCWuEQGSv0h+Wu8rOJX
         jn5AcUc7TwJJZ+JVO5ONrzxZErUgHge8m70WtOjnWYQfLF1ZfrBr2SggKBflhENxgva3
         YnUvbp3BWUiTmjVVpdTSAX0AGI37JPPZjJ+r34yEnQtqnAjPTXAAqVqr/bjFoSTnFLAN
         MT3X5BYM0v8otdFVDpdlcIDUOGqUqxu1CGLejxPxuJz8zds0xzRzQJ8lRiGp8dLhvcSi
         HTWxSHJ2OWfb67daPaXJjcgpnqENXilrrwJmjoXFaPC3+6QilmnISOz0RVqk+UhEPttG
         +bVQ==
X-Gm-Message-State: AOAM532lDUEs5RsUPlU88a9k9Qq9F18olVnoG8qQYHc4GrhT6wbq7Khl
	JG5rHWRVTEmmoxxjGzdeLBBpxd8AlSV0rfHGv8EoRg==
X-Google-Smtp-Source: 
 ABdhPJziq0O2o9wceT5rJ3Y57bBqA3y5G1plAB97AiIpw2QbixfeoUY2OROEQyajHM5+6F2zdb1Xzdq2wjXr3sK1fxM=
X-Received: by 2002:a17:90b:1e43:b0:1c7:46bf:ba29 with SMTP id
 pi3-20020a17090b1e4300b001c746bfba29mr24959727pjb.100.1649054691975; Sun, 03
 Apr 2022 23:44:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220322133415.4089789-1-jon.mason@arm.com>
In-Reply-To: <20220322133415.4089789-1-jon.mason@arm.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 4 Apr 2022 12:14:40 +0530
Message-ID: 
 <CAFA6WYMQpeYvj7+DZsC+ywrjXPUU5=GJ7vHG_Q_ZD0ZV9ix9vg@mail.gmail.com>
Subject: Re: [PATCH] arm-toolchain: update Arm GCC to 11.2
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org, denis@denix.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 04 Apr 2022 18:46:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3234

Hi Jon,

On Tue, 22 Mar 2022 at 19:04, Jon Mason <jdmason@kudzu.us> wrote:
>
> Update the Arm GCC source to the latest version.  Also, update the GCC
> patches to apply cleanly, removing those that are no longer relevant.
> Add the CVEs from Sumit Garg's series.

Thanks Jon for the re-spin and applying this patch to meta-arm. For
the past two weeks I was on paternity leave and came back to work
today. I will look into the issue you have reported while using binary
toolchain releases.

-Sumit

>
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  ci/armgcc.yml                                 |    2 +-
>  ...-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |   70 -
>  .../gcc-arm-10.3/0005-optional-libstdc.patch  |  122 -
>  .../0006-COLLECT_GCC_OPTIONS.patch            |   35 -
>  .../0008-fortran-cross-compile-hack.patch     |   43 -
>  .../gcc-arm-10.3/0009-cpp-honor-sysroot.patch |   51 -
>  .../0010-MIPS64-Default-to-N64-ABI.patch      |   54 -
>  ...gcc-Fix-argument-list-too-long-error.patch |   42 -
>  .../gcc/gcc-arm-10.3/0013-Disable-sdt.patch   |  110 -
>  .../gcc/gcc-arm-10.3/0018-export-CPP.patch    |   50 -
>  ...e-target-gcc-headers-can-be-included.patch |   57 -
>  ...IR-replacement-instead-of-hardcoding.patch |   26 -
>  ...22-aarch64-Add-support-for-musl-ldso.patch |   25 -
>  ...ous-_FOR_BUILD-and-related-variables.patch |  134 -
>  ...027-nios2-Define-MUSL_DYNAMIC_LINKER.patch |   25 -
>  ...-fault-in-precompiled-header-generat.patch |   57 -
>  .../0032-Fix-for-testsuite-failure.patch      |  255 --
>  ...libgomp-libitc-Fix-bootstrap-PR70454.patch |  209 --
>  .../{gcc-arm-10.3.inc =3D> gcc-arm-11.2.inc}    |   35 +-
>  .../gcc-arm-11.2/0001-CVE-2021-42574.patch    | 2282 +++++++++++++++++
>  .../gcc-arm-11.2/0001-CVE-2021-46195.patch    |  128 +
>  .../0001-Fix-install-path-of-linux64.h.patch  |   33 +
>  ...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch |   10 +-
>  .../gcc-arm-11.2/0002-CVE-2021-42574.patch    | 1765 +++++++++++++
>  .../0002-gcc-poison-system-directories.patch  |   52 +-
>  .../gcc-arm-11.2/0003-CVE-2021-42574.patch    |  142 +
>  .../0004-64-bit-multilib-hack.patch           |   33 +-
>  .../gcc-arm-11.2/0004-CVE-2021-42574.patch    |  573 +++++
>  ...ains-something-unsupported-by-the-bu.patch |   63 +
>  ...ts.h-in-B-instead-of-S-and-t-oe-in-B.patch |   16 +-
>  .../gcc-arm-11.2/0009-cpp-honor-sysroot.patch |   59 +
>  ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |   56 +-
>  ...gcc-Fix-argument-list-too-long-error.patch |   38 +
>  .../0014-libtool.patch                        |    2 +-
>  ...s-fix-v4bx-to-linker-to-support-EABI.patch |    4 +-
>  ...-config-files-from-B-instead-of-usin.patch |   14 +-
>  ...ir-from-.la-which-usually-points-to-.patch |    2 +-
>  .../gcc/gcc-arm-11.2/0018-export-CPP.patch    |  199 ++
>  ...e-target-gcc-headers-can-be-included.patch |  113 +
>  ...t-directory-during-relink-if-inst_pr.patch |    2 +-
>  ...-fix-libcc1-s-install-path-and-rpath.patch |    8 +-
>  ...le-sysroot-support-for-nativesdk-gcc.patch |  216 +-
>  ...sroot-gcc-version-specific-dirs-with.patch |    8 +-
>  ...027-nios2-Define-MUSL_DYNAMIC_LINKER.patch |   31 +
>  ...d-to-link-commandline-for-musl-targe.patch |   14 +-
>  ...using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |    4 +-
>  .../0030-sync-gcc-stddef.h-with-musl.patch    |    6 +-
>  ...Re-introduce-spe-commandline-options.patch |   11 +-
>  ...as-for-__cpu_indicator_init-instead-.patch |   12 +-
>  ...s-Do-not-use-__LINE__-for-maintainin.patch |   34 +-
>  ...ngw32-Enable-operation_not_supported.patch |    4 +-
>  ...omic-Do-not-enforce-march-on-aarch64.patch |    8 +-
>  ...prefix-maps-before-checksumming-DIEs.patch |   95 +
>  ...10.3.bb =3D> gcc-cross-canadian_arm-11.2.bb} |    3 -
>  ...ross_arm-10.3.bb =3D> gcc-cross_arm-11.2.bb} |    0
>  ...k_arm-10.3.bb =3D> gcc-crosssdk_arm-11.2.bb} |    0
>  ...me_arm-10.3.bb =3D> gcc-runtime_arm-11.2.bb} |    0
>  ...arm-10.3.bb =3D> gcc-sanitizers_arm-11.2.bb} |    0
>  ...rce_arm-10.3.bb =3D> gcc-source_arm-11.2.bb} |    0
>  .../gcc/{gcc_arm-10.3.bb =3D> gcc_arm-11.2.bb}  |    0
>  ...arm-10.3.bb =3D> libgcc-initial_arm-11.2.bb} |    0
>  ...{libgcc_arm-10.3.bb =3D> libgcc_arm-11.2.bb} |    0
>  ...an_arm-10.3.bb =3D> libgfortran_arm-11.2.bb} |    1 -
>  63 files changed, 5886 insertions(+), 1557 deletions(-)
>  delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/=
0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
>  delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/=
0005-optional-libstdc.patch
>  delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/=
0006-COLLECT_GCC_OPTIONS.patch
>  delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/=
0008-fortran-cross-compile-hack.patch
>  delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/=
0009-cpp-honor-sysroot.patch
>  delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/=
0010-MIPS64-Default-to-N64-ABI.patch
>  delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/=
0012-gcc-Fix-argument-list-too-long-error.patch
>  delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/=
0013-Disable-sdt.patch
>  delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/=
0018-export-CPP.patch
>  delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/=
0019-Ensure-target-gcc-headers-can-be-included.patch
>  delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/=
0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
>  delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/=
0022-aarch64-Add-support-for-musl-ldso.patch
>  delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/=
0026-Fix-various-_FOR_BUILD-and-related-variables.patch
>  delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/=
0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch
>  delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/=
0031-fix-segmentation-fault-in-precompiled-header-generat.patch
>  delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/=
0032-Fix-for-testsuite-failure.patch
>  delete mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/=
0038-libatomic-libgomp-libitc-Fix-bootstrap-PR70454.patch
>  rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.3.inc =3D> gc=
c-arm-11.2.inc} (80%)
>  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/=
0001-CVE-2021-42574.patch
>  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/=
0001-CVE-2021-46195.patch
>  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/=
0001-Fix-install-path-of-linux64.h.patch
>  rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.3 =3D> gcc-ar=
m-11.2}/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch (84%)
>  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/=
0002-CVE-2021-42574.patch
>  rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.3 =3D> gcc-ar=
m-11.2}/0002-gcc-poison-system-directories.patch (85%)
>  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/=
0003-CVE-2021-42574.patch
>  rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.3 =3D> gcc-ar=
m-11.2}/0004-64-bit-multilib-hack.patch (84%)
>  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/=
0004-CVE-2021-42574.patch
>  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/=
0006-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch
>  rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.3 =3D> gcc-ar=
m-11.2}/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch (88%)
>  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/=
0009-cpp-honor-sysroot.patch
>  rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.3 =3D> gcc-ar=
m-11.2}/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch (87=
%)
>  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/=
0012-gcc-Fix-argument-list-too-long-error.patch
>  rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.3 =3D> gcc-ar=
m-11.2}/0014-libtool.patch (94%)
>  rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.3 =3D> gcc-ar=
m-11.2}/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch (93%)
>  rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.3 =3D> gcc-ar=
m-11.2}/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch (89=
%)
>  rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.3 =3D> gcc-ar=
m-11.2}/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch (92=
%)
>  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/=
0018-export-CPP.patch
>  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/=
0019-Ensure-target-gcc-headers-can-be-included.patch
>  rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.3 =3D> gcc-ar=
m-11.2}/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch (93=
%)
>  rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.3 =3D> gcc-ar=
m-11.2}/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch (90%)
>  rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.3 =3D> gcc-ar=
m-11.2}/0024-handle-sysroot-support-for-nativesdk-gcc.patch (65%)
>  rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.3 =3D> gcc-ar=
m-11.2}/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch (92=
%)
>  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/=
0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch
>  rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.3 =3D> gcc-ar=
m-11.2}/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch (80=
%)
>  rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.3 =3D> gcc-ar=
m-11.2}/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch (89%)
>  rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.3 =3D> gcc-ar=
m-11.2}/0030-sync-gcc-stddef.h-with-musl.patch (92%)
>  rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.3 =3D> gcc-ar=
m-11.2}/0033-Re-introduce-spe-commandline-options.patch (78%)
>  rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.3 =3D> gcc-ar=
m-11.2}/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch (90=
%)
>  rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.3 =3D> gcc-ar=
m-11.2}/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch (87=
%)
>  rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.3 =3D> gcc-ar=
m-11.2}/0036-mingw32-Enable-operation_not_supported.patch (89%)
>  rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-arm-10.3 =3D> gcc-ar=
m-11.2}/0037-libatomic-Do-not-enforce-march-on-aarch64.patch (88%)
>  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/=
0041-apply-debug-prefix-maps-before-checksumming-DIEs.patch
>  rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-cross-canadian_arm-1=
0.3.bb =3D> gcc-cross-canadian_arm-11.2.bb} (96%)
>  rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-cross_arm-10.3.bb =
=3D> gcc-cross_arm-11.2.bb} (100%)
>  rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-crosssdk_arm-10.3.bb=
 =3D> gcc-crosssdk_arm-11.2.bb} (100%)
>  rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-runtime_arm-10.3.bb =
=3D> gcc-runtime_arm-11.2.bb} (100%)
>  rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-sanitizers_arm-10.3.=
bb =3D> gcc-sanitizers_arm-11.2.bb} (100%)
>  rename meta-arm-toolchain/recipes-devtools/gcc/{gcc-source_arm-10.3.bb =
=3D> gcc-source_arm-11.2.bb} (100%)
>  rename meta-arm-toolchain/recipes-devtools/gcc/{gcc_arm-10.3.bb =3D> gcc=
_arm-11.2.bb} (100%)
>  rename meta-arm-toolchain/recipes-devtools/gcc/{libgcc-initial_arm-10.3.=
bb =3D> libgcc-initial_arm-11.2.bb} (100%)
>  rename meta-arm-toolchain/recipes-devtools/gcc/{libgcc_arm-10.3.bb =3D> =
libgcc_arm-11.2.bb} (100%)
>  rename meta-arm-toolchain/recipes-devtools/gcc/{libgfortran_arm-10.3.bb =
=3D> libgfortran_arm-11.2.bb} (98%)
>
> diff --git a/ci/armgcc.yml b/ci/armgcc.yml
> index d63ae2406dbd..d46f0b36dad1 100644
> --- a/ci/armgcc.yml
> +++ b/ci/armgcc.yml
> @@ -3,4 +3,4 @@ header:
>
>  local_conf_header:
>    cc: |
> -    GCCVERSION =3D "arm-10.3"
> +    GCCVERSION =3D "arm-11.2"
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0003-gc=
c-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch b/meta-arm-toolchain/recipes-devtoo=
ls/gcc/gcc-arm-10.3/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
> deleted file mode 100644
> index 39b616e82e8a..000000000000
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0003-gcc-4.3.3=
-SYSROOT_CFLAGS_FOR_TARGET.patch
> +++ /dev/null
> @@ -1,70 +0,0 @@
> -From 860a8a2ec653e3c65bc5440f181b459dfe56c8a0 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 09:08:31 +0400
> -Subject: [PATCH] gcc-4.3.3: SYSROOT_CFLAGS_FOR_TARGET
> -
> -Before committing, I noticed that PR/32161 was marked as a dup of PR/320=
09, but my previous patch did not fix it.
> -
> -This alternative patch is better because it lets you just use CFLAGS_FOR=
_TARGET to set the compilation flags for libgcc. Since bootstrapped target =
libraries are never compiled with the native compiler, it makes little sens=
e to use different flags for stage1 and later stages. And it also makes lit=
tle sense to use a different variable than CFLAGS_FOR_TARGET.
> -
> -Other changes I had to do include:
> -
> -- moving the creation of default CFLAGS_FOR_TARGET from Makefile.am to c=
onfigure.ac, because otherwise the BOOT_CFLAGS are substituted into CFLAGS_=
FOR_TARGET (which is "-O2 -g $(CFLAGS)") via $(CFLAGS). It is also cleaner =
this way though.
> -
> -- passing the right CFLAGS to configure scripts as exported environment =
variables
> -
> -I also stopped passing LIBCFLAGS to configure scripts since they are unu=
sed in the whole src tree. And I updated the documentation as H-P reminded =
me to do.
> -
> -Bootstrapped/regtested i686-pc-linux-gnu, will commit to 4.4 shortly. Ok=
 for 4.3?
> -
> -Signed-off-by: Paolo Bonzini  <bonzini@gnu.org>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> ----
> - configure | 32 ++++++++++++++++++++++++++++++++
> - 1 file changed, 32 insertions(+)
> -
> -diff --git a/configure b/configure
> -index 9350b0cf3ed..8ed565c51b3 100755
> ---- a/configure
> -+++ b/configure
> -@@ -6972,6 +6972,38 @@ fi
> -
> -
> -
> -+# During gcc bootstrap, if we use some random cc for stage1 then CFLAGS
> -+# might be empty or "-g".  We don't require a C++ compiler, so CXXFLAGS
> -+# might also be empty (or "-g", if a non-GCC C++ compiler is in the pat=
h).
> -+# We want to ensure that TARGET libraries (which we know are built with
> -+# gcc) are built with "-O2 -g", so include those options when setting
> -+# CFLAGS_FOR_TARGET and CXXFLAGS_FOR_TARGET.
> -+if test "x$CFLAGS_FOR_TARGET" =3D x; then
> -+  CFLAGS_FOR_TARGET=3D$CFLAGS
> -+  case " $CFLAGS " in
> -+    *" -O2 "*) ;;
> -+    *) CFLAGS_FOR_TARGET=3D"-O2 $CFLAGS" ;;
> -+  esac
> -+  case " $CFLAGS " in
> -+    *" -g "* | *" -g3 "*) ;;
> -+    *) CFLAGS_FOR_TARGET=3D"-g $CFLAGS" ;;
> -+  esac
> -+fi
> -+
> -+
> -+if test "x$CXXFLAGS_FOR_TARGET" =3D x; then
> -+  CXXFLAGS_FOR_TARGET=3D$CXXFLAGS
> -+  case " $CXXFLAGS " in
> -+    *" -O2 "*) ;;
> -+    *) CXXFLAGS_FOR_TARGET=3D"-O2 $CXXFLAGS" ;;
> -+  esac
> -+  case " $CXXFLAGS " in
> -+    *" -g "* | *" -g3 "*) ;;
> -+    *) CXXFLAGS_FOR_TARGET=3D"-g $CXXFLAGS" ;;
> -+  esac
> -+fi
> -+
> -+
> - # Handle --with-headers=3DXXX.  If the value is not "yes", the contents=
 of
> - # the named directory are copied to $(tooldir)/sys-include.
> - if test x"${with_headers}" !=3D x && test x"${with_headers}" !=3D xno ;=
 then
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0005-op=
tional-libstdc.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3=
/0005-optional-libstdc.patch
> deleted file mode 100644
> index 9f5b96eb63dc..000000000000
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0005-optional-=
libstdc.patch
> +++ /dev/null
> @@ -1,122 +0,0 @@
> -From dcbfaf57a213e3beaafb0561b007c61501961f03 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 09:12:56 +0400
> -Subject: [PATCH] optional libstdc
> -
> -gcc-runtime builds libstdc++ separately from gcc-cross-*. Its configure =
tests using g++
> -will not run correctly since by default the linker will try to link agai=
nst libstdc++
> -which shouldn't exist yet. We need an option to disable -lstdc++
> -option whilst leaving -lc, -lgcc and other automatic library dependencie=
s added by gcc
> -driver. This patch adds such an option which only disables the -lstdc++.
> -
> -A "standard" gcc build uses xgcc and hence avoids this. We should ask up=
stream how to
> -do this officially, the likely answer is don't build libstdc++ separatel=
y.
> -
> -RP 29/6/10
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Inappropriate [embedded specific]
> ----
> - gcc/c-family/c.opt  |  4 ++++
> - gcc/cp/g++spec.c    |  1 +
> - gcc/doc/invoke.texi | 32 +++++++++++++++++++++++++++++++-
> - gcc/gcc.c           |  1 +
> - 4 files changed, 37 insertions(+), 1 deletion(-)
> -
> -diff --git a/gcc/c-family/c.opt b/gcc/c-family/c.opt
> -index c49da99d395..35f712e2c84 100644
> ---- a/gcc/c-family/c.opt
> -+++ b/gcc/c-family/c.opt
> -@@ -2025,6 +2025,10 @@ nostdinc++
> - C++ ObjC++
> - Do not search standard system include directories for C++.
> -
> -+nostdlib++
> -+Driver
> -+Do not link standard C++ runtime library
> -+
> - o
> - C ObjC C++ ObjC++ Joined Separate
> - ; Documented in common.opt
> -diff --git a/gcc/cp/g++spec.c b/gcc/cp/g++spec.c
> -index 0ab63bcd211..7b081e9e4f0 100644
> ---- a/gcc/cp/g++spec.c
> -+++ b/gcc/cp/g++spec.c
> -@@ -137,6 +137,7 @@ lang_specific_driver (struct cl_decoded_option **in_=
decoded_options,
> -       switch (decoded_options[i].opt_index)
> -       {
> -       case OPT_nostdlib:
> -+      case OPT_nostdlib__:
> -       case OPT_nodefaultlibs:
> -         library =3D -1;
> -         break;
> -diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
> -index cd31b522e42..1f14df48bda 100644
> ---- a/gcc/doc/invoke.texi
> -+++ b/gcc/doc/invoke.texi
> -@@ -230,6 +230,9 @@ in the following sections.
> - -fno-weak  -nostdinc++ @gol
> - -fvisibility-inlines-hidden @gol
> - -fvisibility-ms-compat @gol
> -+-fvtable-verify=3D@r{[}std@r{|}preinit@r{|}none@r{]} @gol
> -+-fvtv-counts -fvtv-debug @gol
> -+-nostdlib++ @gol
> - -fext-numeric-literals @gol
> - -Wabi-tag  -Wcatch-value  -Wcatch-value=3D@var{n} @gol
> - -Wno-class-conversion  -Wclass-memaccess @gol
> -@@ -600,7 +603,7 @@ Objective-C and Objective-C++ Dialects}.
> - -pie  -pthread  -r  -rdynamic @gol
> - -s  -static  -static-pie  -static-libgcc  -static-libstdc++ @gol
> - -static-libasan  -static-libtsan  -static-liblsan  -static-libubsan @go=
l
> ---shared  -shared-libgcc  -symbolic @gol
> -+-shared  -shared-libgcc  -symbolic -nostdlib++ @gol
> - -T @var{script}  -Wl,@var{option}  -Xlinker @var{option} @gol
> - -u @var{symbol}  -z @var{keyword}}
> -
> -@@ -14468,6 +14471,33 @@ Specify that the program entry point is @var{en=
try}.  The argument is
> - interpreted by the linker; the GNU linker accepts either a symbol name
> - or an address.
> -
> -+@item -nostdlib++
> -+@opindex nostdlib++
> -+Do not use the standard system C++ runtime libraries when linking.
> -+Only the libraries you specify will be passed to the linker.
> -+
> -+@cindex @option{-lgcc}, use with @option{-nostdlib}
> -+@cindex @option{-nostdlib} and unresolved references
> -+@cindex unresolved references and @option{-nostdlib}
> -+@cindex @option{-lgcc}, use with @option{-nodefaultlibs}
> -+@cindex @option{-nodefaultlibs} and unresolved references
> -+@cindex unresolved references and @option{-nodefaultlibs}
> -+One of the standard libraries bypassed by @option{-nostdlib} and
> -+@option{-nodefaultlibs} is @file{libgcc.a}, a library of internal subro=
utines
> -+which GCC uses to overcome shortcomings of particular machines, or spec=
ial
> -+needs for some languages.
> -+(@xref{Interface,,Interfacing to GCC Output,gccint,GNU Compiler
> -+Collection (GCC) Internals},
> -+for more discussion of @file{libgcc.a}.)
> -+In most cases, you need @file{libgcc.a} even when you want to avoid
> -+other standard libraries.  In other words, when you specify @option{-no=
stdlib}
> -+or @option{-nodefaultlibs} you should usually specify @option{-lgcc} as=
 well.
> -+This ensures that you have no unresolved references to internal GCC
> -+library subroutines.
> -+(An example of such an internal subroutine is @code{__main}, used to en=
sure C++
> -+constructors are called; @pxref{Collect2,,@code{collect2}, gccint,
> -+GNU Compiler Collection (GCC) Internals}.)
> -+
> - @item -pie
> - @opindex pie
> - Produce a dynamically linked position independent executable on targets
> -diff --git a/gcc/gcc.c b/gcc/gcc.c
> -index f379f71da3d..1ee962acfaa 100644
> ---- a/gcc/gcc.c
> -+++ b/gcc/gcc.c
> -@@ -1051,6 +1051,7 @@ proper position among the other output files.  */
> -     %(mflib) " STACK_SPLIT_SPEC "\
> -     %{fprofile-arcs|fprofile-generate*|coverage:-lgcov} " SANITIZER_SPE=
C " \
> -     %{!nostdlib:%{!r:%{!nodefaultlibs:%(link_ssp) %(link_gcc_c_sequence=
)}}}\
> -+    %{!nostdlib++:}\
> -     %{!nostdlib:%{!r:%{!nostartfiles:%E}}} %{T*}  \n%(post_link) }}}}}}=
"
> - #endif
> -
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0006-CO=
LLECT_GCC_OPTIONS.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-1=
0.3/0006-COLLECT_GCC_OPTIONS.patch
> deleted file mode 100644
> index 7e43284c17ed..000000000000
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0006-COLLECT_G=
CC_OPTIONS.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From a03125f58038c89637445fdfbb6c38d2b276633e Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 09:16:28 +0400
> -Subject: [PATCH] COLLECT_GCC_OPTIONS
> -
> -This patch adds --sysroot into COLLECT_GCC_OPTIONS which is used to
> -invoke collect2.
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> ----
> - gcc/gcc.c | 9 +++++++++
> - 1 file changed, 9 insertions(+)
> -
> -diff --git a/gcc/gcc.c b/gcc/gcc.c
> -index 1ee962acfaa..39b1635651a 100644
> ---- a/gcc/gcc.c
> -+++ b/gcc/gcc.c
> -@@ -4809,6 +4809,15 @@ set_collect_gcc_options (void)
> -               sizeof ("COLLECT_GCC_OPTIONS=3D") - 1);
> -
> -   first_time =3D TRUE;
> -+#ifdef HAVE_LD_SYSROOT
> -+  if (target_system_root_changed && target_system_root)
> -+    {
> -+      obstack_grow (&collect_obstack, "'--sysroot=3D", sizeof("'--sysro=
ot=3D")-1);
> -+      obstack_grow (&collect_obstack, target_system_root,strlen(target_=
system_root));
> -+      obstack_grow (&collect_obstack, "'", 1);
> -+      first_time =3D FALSE;
> -+    }
> -+#endif
> -   for (i =3D 0; (int) i < n_switches; i++)
> -     {
> -       const char *const *args;
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0008-fo=
rtran-cross-compile-hack.patch b/meta-arm-toolchain/recipes-devtools/gcc/gc=
c-arm-10.3/0008-fortran-cross-compile-hack.patch
> deleted file mode 100644
> index 707066291f98..000000000000
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0008-fortran-c=
ross-compile-hack.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From 660bf2b932273e2cde495f31cc031bb084572862 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 09:20:01 +0400
> -Subject: [PATCH] fortran cross-compile hack.
> -
> -* Fortran would have searched for arm-angstrom-gnueabi-gfortran but woul=
d have used
> -used gfortan. For gcc_4.2.2.bb we want to use the gfortran compiler from=
 our cross
> -directory.
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Inappropriate [embedded specific]
> ----
> - libgfortran/configure    | 2 +-
> - libgfortran/configure.ac | 2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/libgfortran/configure b/libgfortran/configure
> -index 1b4a8b10609..d7ab18fc9f9 100755
> ---- a/libgfortran/configure
> -+++ b/libgfortran/configure
> -@@ -13092,7 +13092,7 @@ esac
> -
> - # We need gfortran to compile parts of the library
> - #AC_PROG_FC(gfortran)
> --FC=3D"$GFORTRAN"
> -+#FC=3D"$GFORTRAN"
> - ac_ext=3D${ac_fc_srcext-f}
> - ac_compile=3D'$FC -c $FCFLAGS $ac_fcflags_srcext conftest.$ac_ext >&5'
> - ac_link=3D'$FC -o conftest$ac_exeext $FCFLAGS $LDFLAGS $ac_fcflags_srce=
xt conftest.$ac_ext $LIBS >&5'
> -diff --git a/libgfortran/configure.ac b/libgfortran/configure.ac
> -index 711dc60ff78..3c9bbfbf47d 100644
> ---- a/libgfortran/configure.ac
> -+++ b/libgfortran/configure.ac
> -@@ -258,7 +258,7 @@ AC_SUBST(enable_static)
> -
> - # We need gfortran to compile parts of the library
> - #AC_PROG_FC(gfortran)
> --FC=3D"$GFORTRAN"
> -+#FC=3D"$GFORTRAN"
> - AC_PROG_FC(gfortran)
> -
> - # extra LD Flags which are required for targets
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0009-cp=
p-honor-sysroot.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.=
3/0009-cpp-honor-sysroot.patch
> deleted file mode 100644
> index 3f6b69a3cc87..000000000000
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0009-cpp-honor=
-sysroot.patch
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -From 303cc9292cc0a1bd7bae994dd1e86197fb94068d Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 09:22:00 +0400
> -Subject: [PATCH] cpp: honor sysroot.
> -
> -Currently, if the gcc toolchain is relocated and installed from sstate, =
then you try and compile
> -preprocessed source (.i or .ii files), the compiler will try and access =
the builtin sysroot location
> -rather than the --sysroot option specified on the commandline. If access=
 to that directory is
> -permission denied (unreadable), gcc will error.
> -
> -This happens when ccache is in use due to the fact it uses preprocessed =
source files.
> -
> -The fix below adds %I to the cpp-output spec macro so the default substi=
tutions for -iprefix,
> --isystem, -isysroot happen and the correct sysroot is used.
> -
> -[YOCTO #2074]
> -
> -RP 2012/04/13
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> ----
> - gcc/cp/lang-specs.h | 2 +-
> - gcc/gcc.c           | 2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/gcc/cp/lang-specs.h b/gcc/cp/lang-specs.h
> -index 0ad4a33b93e..16c744f4f90 100644
> ---- a/gcc/cp/lang-specs.h
> -+++ b/gcc/cp/lang-specs.h
> -@@ -66,5 +66,5 @@ along with GCC; see the file COPYING3.  If not see
> -   {".ii", "@c++-cpp-output", 0, 0, 0},
> -   {"@c++-cpp-output",
> -       "%{!E:%{!M:%{!MM:"
> --      "  cc1plus -fpreprocessed %i %(cc1_options) %2"
> -+      "  cc1plus -fpreprocessed %i %I %(cc1_options) %2"
> -       "  %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
> -diff --git a/gcc/gcc.c b/gcc/gcc.c
> -index 39b1635651a..e2e0bcee9b2 100644
> ---- a/gcc/gcc.c
> -+++ b/gcc/gcc.c
> -@@ -1351,7 +1351,7 @@ static const struct compiler default_compilers[] =
=3D
> -                                          %W{o*:--output-pch=3D%*}}%V}}}=
}}}}", 0, 0, 0},
> -   {".i", "@cpp-output", 0, 0, 0},
> -   {"@cpp-output",
> --   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %(cc1_options) %{!fsyntax-onl=
y:%(invoke_as)}}}}", 0, 0, 0},
> -+   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %I %(cc1_options) %{!fsyntax-=
only:%(invoke_as)}}}}", 0, 0, 0},
> -   {".s", "@assembler", 0, 0, 0},
> -   {"@assembler",
> -    "%{!M:%{!MM:%{!E:%{!S:as %(asm_debug) %(asm_options) %i %A }}}}", 0,=
 0, 0},
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0010-MI=
PS64-Default-to-N64-ABI.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc=
-arm-10.3/0010-MIPS64-Default-to-N64-ABI.patch
> deleted file mode 100644
> index 1aa29e6ac50a..000000000000
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0010-MIPS64-De=
fault-to-N64-ABI.patch
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -From b75e8fb1cc1607077a113de40ae0d16ad273f05a Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 09:23:08 +0400
> -Subject: [PATCH] MIPS64: Default to N64 ABI
> -
> -MIPS64 defaults to n32 ABI, this patch makes it
> -so that it defaults to N64 ABI
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Inappropriate [OE config specific]
> ----
> - gcc/config.gcc | 10 +++++-----
> - 1 file changed, 5 insertions(+), 5 deletions(-)
> -
> -diff --git a/gcc/config.gcc b/gcc/config.gcc
> -index 6fcdd771d4c..feafcadfcac 100644
> ---- a/gcc/config.gcc
> -+++ b/gcc/config.gcc
> -@@ -2542,29 +2542,29 @@ mips*-*-linux*)                                #=
 Linux MIPS, either endian.
> -                       default_mips_arch=3Dmips32
> -                       ;;
> -               mips64el-st-linux-gnu)
> --                      default_mips_abi=3Dn32
> -+                      default_mips_abi=3D64
> -                       tm_file=3D"${tm_file} mips/st.h"
> -                       tmake_file=3D"${tmake_file} mips/t-st"
> -                       enable_mips_multilibs=3D"yes"
> -                       ;;
> -               mips64octeon*-*-linux*)
> --                      default_mips_abi=3Dn32
> -+                      default_mips_abi=3D64
> -                       tm_defines=3D"${tm_defines} MIPS_CPU_STRING_DEFAU=
LT=3D\\\"octeon\\\""
> -                       target_cpu_default=3DMASK_SOFT_FLOAT_ABI
> -                       enable_mips_multilibs=3D"yes"
> -                       ;;
> -               mipsisa64r6*-*-linux*)
> --                      default_mips_abi=3Dn32
> -+                      default_mips_abi=3D64
> -                       default_mips_arch=3Dmips64r6
> -                       enable_mips_multilibs=3D"yes"
> -                       ;;
> -               mipsisa64r2*-*-linux*)
> --                      default_mips_abi=3Dn32
> -+                      default_mips_abi=3D64
> -                       default_mips_arch=3Dmips64r2
> -                       enable_mips_multilibs=3D"yes"
> -                       ;;
> -               mips64*-*-linux* | mipsisa64*-*-linux*)
> --                      default_mips_abi=3Dn32
> -+                      default_mips_abi=3D64
> -                       enable_mips_multilibs=3D"yes"
> -                       ;;
> -       esac
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0012-gc=
c-Fix-argument-list-too-long-error.patch b/meta-arm-toolchain/recipes-devto=
ols/gcc/gcc-arm-10.3/0012-gcc-Fix-argument-list-too-long-error.patch
> deleted file mode 100644
> index ad2df921921c..000000000000
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0012-gcc-Fix-a=
rgument-list-too-long-error.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From cc2aac0b93f2f22a5fd0ecd80743e88d4e244597 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 09:26:37 +0400
> -Subject: [PATCH] gcc: Fix argument list too long error.
> -
> -There would be an "Argument list too long" error when the
> -build directory is longer than 200, this is caused by:
> -
> -headers=3D`echo $(PLUGIN_HEADERS) | tr ' ' '\012' | sort -u`
> -
> -The PLUGIN_HEADERS is too long before sort, so the "echo" can't handle
> -it, use the $(sort list) of GNU make which can handle the too long list
> -would fix the problem, the header would be short enough after sorted.
> -The "tr ' ' '\012'" was used for translating the space to "\n", the
> -$(sort list) doesn't need this.
> -
> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -RP: gcc then added *.h and *.def additions to this list, breaking the or=
iginal
> -fix. Add the sort to the original gcc code, leaving the tr+sort to fix t=
he original
> -issue but include the new files too as reported by Zhuang <qiuguang.zqg@=
alibaba-inc.com>
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - gcc/Makefile.in | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> -index 501a5f16d9f..674f1057aaf 100644
> ---- a/gcc/Makefile.in
> -+++ b/gcc/Makefile.in
> -@@ -3609,7 +3609,7 @@ install-plugin: installdirs lang.install-plugin s-=
header-vars install-gengtype
> - # We keep the directory structure for files in config, common/config or
> - # c-family and .def files. All other files are flattened to a single di=
rectory.
> -       $(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
> --      headers=3D`echo $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def=
) | tr ' ' '\012' | sort -u`; \
> -+      headers=3D`echo $(sort $(PLUGIN_HEADERS)) $$(cd $(srcdir); echo *=
.h *.def) | tr ' ' '\012' | sort -u`; \
> -       srcdirstrip=3D`echo "$(srcdir)" | sed 's/[].[^$$\\*|]/\\\\&/g'`; =
\
> -       for file in $$headers; do \
> -         if [ -f $$file ] ; then \
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0013-Di=
sable-sdt.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0013=
-Disable-sdt.patch
> deleted file mode 100644
> index b93ae837ac9d..000000000000
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0013-Disable-s=
dt.patch
> +++ /dev/null
> @@ -1,110 +0,0 @@
> -From d87eef0037d15f363b2614bac531626b87189d4f Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 09:28:10 +0400
> -Subject: [PATCH] Disable sdt.
> -
> -We don't list dtrace in DEPENDS so we shouldn't be depending on this hea=
der.
> -It may or may not exist from preivous builds though. To be determinstic,=
 disable
> -sdt.h usage always. This avoids build failures if the header is removed =
after configure
> -but before libgcc is compiled for example.
> -
> -RP 2012/8/7
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Disable sdt for libstdc++-v3.
> -
> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> -
> -Upstream-Status: Inappropriate [hack]
> ----
> - gcc/configure             | 12 ++++++------
> - gcc/configure.ac          | 18 +++++++++---------
> - libstdc++-v3/configure    |  6 +++---
> - libstdc++-v3/configure.ac |  2 +-
> - 4 files changed, 19 insertions(+), 19 deletions(-)
> -
> -diff --git a/gcc/configure b/gcc/configure
> -index 4d903cf40e8..156090550c2 100755
> ---- a/gcc/configure
> -+++ b/gcc/configure
> -@@ -29830,12 +29830,12 @@ fi
> - { $as_echo "$as_me:${as_lineno-$LINENO}: checking sys/sdt.h in the targ=
et C library" >&5
> - $as_echo_n "checking sys/sdt.h in the target C library... " >&6; }
> - have_sys_sdt_h=3Dno
> --if test -f $target_header_dir/sys/sdt.h; then
> --  have_sys_sdt_h=3Dyes
> --
> --$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
> --
> --fi
> -+#if test -f $target_header_dir/sys/sdt.h; then
> -+#  have_sys_sdt_h=3Dyes
> -+#
> -+#$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
> -+#
> -+#fi
> - { $as_echo "$as_me:${as_lineno-$LINENO}: result: $have_sys_sdt_h" >&5
> - $as_echo "$have_sys_sdt_h" >&6; }
> -
> -diff --git a/gcc/configure.ac b/gcc/configure.ac
> -index 07aacfee055..f31a43e7dd3 100644
> ---- a/gcc/configure.ac
> -+++ b/gcc/configure.ac
> -@@ -6203,15 +6203,15 @@ fi
> - AC_SUBST([enable_default_ssp])
> -
> - # Test for <sys/sdt.h> on the target.
> --GCC_TARGET_TEMPLATE([HAVE_SYS_SDT_H])
> --AC_MSG_CHECKING(sys/sdt.h in the target C library)
> --have_sys_sdt_h=3Dno
> --if test -f $target_header_dir/sys/sdt.h; then
> --  have_sys_sdt_h=3Dyes
> --  AC_DEFINE(HAVE_SYS_SDT_H, 1,
> --            [Define if your target C library provides sys/sdt.h])
> --fi
> --AC_MSG_RESULT($have_sys_sdt_h)
> -+#GCC_TARGET_TEMPLATE([HAVE_SYS_SDT_H])
> -+#AC_MSG_CHECKING(sys/sdt.h in the target C library)
> -+#have_sys_sdt_h=3Dno
> -+#if test -f $target_header_dir/sys/sdt.h; then
> -+#  have_sys_sdt_h=3Dyes
> -+#  AC_DEFINE(HAVE_SYS_SDT_H, 1,
> -+#            [Define if your target C library provides sys/sdt.h])
> -+#fi
> -+#AC_MSG_RESULT($have_sys_sdt_h)
> -
> - # Check if TFmode long double should be used by default or not.
> - # Some glibc targets used DFmode long double, but with glibc 2.4
> -diff --git a/libstdc++-v3/configure b/libstdc++-v3/configure
> -index 766a0a8d504..ba59088a722 100755
> ---- a/libstdc++-v3/configure
> -+++ b/libstdc++-v3/configure
> -@@ -21986,11 +21986,11 @@ ac_compile=3D'$CC -c $CFLAGS $CPPFLAGS conftes=
t.$ac_ext >&5'
> - ac_link=3D'$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftes=
t.$ac_ext $LIBS >&5'
> - ac_compiler_gnu=3D$ac_cv_c_compiler_gnu
> -
> --  if test $glibcxx_cv_sys_sdt_h =3D yes; then
> -+#  if test $glibcxx_cv_sys_sdt_h =3D yes; then
> -
> --$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
> -+#$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
> -
> --  fi
> -+#  fi
> -   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $glibcxx_cv_sys_sdt_=
h" >&5
> - $as_echo "$glibcxx_cv_sys_sdt_h" >&6; }
> -
> -diff --git a/libstdc++-v3/configure.ac b/libstdc++-v3/configure.ac
> -index 07cf05b6856..dd5f26957d5 100644
> ---- a/libstdc++-v3/configure.ac
> -+++ b/libstdc++-v3/configure.ac
> -@@ -240,7 +240,7 @@ GLIBCXX_CHECK_SC_NPROCESSORS_ONLN
> - GLIBCXX_CHECK_SC_NPROC_ONLN
> - GLIBCXX_CHECK_PTHREADS_NUM_PROCESSORS_NP
> - GLIBCXX_CHECK_SYSCTL_HW_NCPU
> --GLIBCXX_CHECK_SDT_H
> -+#GLIBCXX_CHECK_SDT_H
> -
> - # Check for available headers.
> - AC_CHECK_HEADERS([endian.h execinfo.h float.h fp.h ieeefp.h inttypes.h =
\
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0018-ex=
port-CPP.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0018-=
export-CPP.patch
> deleted file mode 100644
> index 5f28e868e2db..000000000000
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0018-export-CP=
P.patch
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -From 9d8512e3efa0d125714bafb907734a0c095b84ce Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 20 Feb 2015 09:40:59 +0000
> -Subject: [PATCH] export CPP
> -
> -The OE environment sets and exports CPP as being the target gcc. When
> -building gcc-cross-canadian for a mingw targetted sdk, the following can=
 be found
> -in build.x86_64-pokysdk-mingw32.i586-poky-linux/build-x86_64-linux/libib=
erty/config.log:
> -
> -configure:3641: checking for _FILE_OFFSET_BITS value needed for large fi=
les
> -configure:3666: gcc  -c -isystem/media/build1/poky/build/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe  conftest.c >&5
> -configure:3666: $? =3D 0
> -configure:3698: result: no
> -configure:3786: checking how to run the C preprocessor
> -configure:3856: result: x86_64-pokysdk-mingw32-gcc -E --sysroot=3D/media=
/build1/poky/build/tmp/sysroots/x86_64-nativesdk-mingw32-pokysdk-mingw32
> -configure:3876: x86_64-pokysdk-mingw32-gcc -E --sysroot=3D/media/build1/=
poky/build/tmp/sysroots/x86_64-nativesdk-mingw32-pokysdk-mingw32 conftest.c
> -configure:3876: $? =3D 0
> -
> -Note this is a *build* target (in build-x86_64-linux) so it should be
> -using the host "gcc", not x86_64-pokysdk-mingw32-gcc. Since the mingw32
> -headers are very different, using the wrong cpp is a real problem. It is=
 leaking
> -into configure through the CPP variable. Ultimately this leads to build
> -failures related to not being able to include a process.h file for pem-u=
nix.c.
> -
> -The fix is to ensure we export a sane CPP value into the build
> -environment when using build targets. We could define a CPP_FOR_BUILD va=
lue which may be
> -the version which needs to be upstreamed but for now, this fix is good e=
nough to
> -avoid the problem.
> -
> -RP 22/08/2013
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - Makefile.in | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/Makefile.in b/Makefile.in
> -index 36e369df6e7..c717903bb13 100644
> ---- a/Makefile.in
> -+++ b/Makefile.in
> -@@ -149,6 +149,7 @@ BUILD_EXPORTS =3D \
> -       AR=3D"$(AR_FOR_BUILD)"; export AR; \
> -       AS=3D"$(AS_FOR_BUILD)"; export AS; \
> -       CC=3D"$(CC_FOR_BUILD)"; export CC; \
> -+      CPP=3D"$(CC_FOR_BUILD) -E"; export CPP; \
> -       CFLAGS=3D"$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
> -       CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> -       CXX=3D"$(CXX_FOR_BUILD)"; export CXX; \
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0019-En=
sure-target-gcc-headers-can-be-included.patch b/meta-arm-toolchain/recipes-=
devtools/gcc/gcc-arm-10.3/0019-Ensure-target-gcc-headers-can-be-included.pa=
tch
> deleted file mode 100644
> index 9e9f2874db5a..000000000000
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0019-Ensure-ta=
rget-gcc-headers-can-be-included.patch
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -From 468604663f799d3d80d0db760f03ba32678801aa Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 20 Feb 2015 10:25:11 +0000
> -Subject: [PATCH] Ensure target gcc headers can be included
> -
> -There are a few headers installed as part of the OpenEmbedded
> -gcc-runtime target (omp.h, ssp/*.h). Being installed from a recipe
> -built for the target architecture, these are within the target
> -sysroot and not cross/nativesdk; thus they weren't able to be
> -found by gcc with the existing search paths. Add support for
> -picking up these headers under the sysroot supplied on the gcc
> -command line in order to resolve this.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - gcc/Makefile.in  | 2 ++
> - gcc/cppdefault.c | 4 ++++
> - 2 files changed, 6 insertions(+)
> -
> -diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> -index 674f1057aaf..087bf3f1137 100644
> ---- a/gcc/Makefile.in
> -+++ b/gcc/Makefile.in
> -@@ -618,6 +618,7 @@ libexecdir =3D @libexecdir@
> -
> - # Directory in which the compiler finds libraries etc.
> - libsubdir =3D $(libdir)/gcc/$(real_target_noncanonical)/$(version)$(acc=
el_dir_suffix)
> -+libsubdir_target =3D $(target_noncanonical)/$(version)
> - # Directory in which the compiler finds executables
> - libexecsubdir =3D $(libexecdir)/gcc/$(real_target_noncanonical)/$(versi=
on)$(accel_dir_suffix)
> - # Directory in which all plugin resources are installed
> -@@ -2948,6 +2949,7 @@ CFLAGS-intl.o +=3D -DLOCALEDIR=3D\"$(localedir)\"
> -
> - PREPROCESSOR_DEFINES =3D \
> -   -DGCC_INCLUDE_DIR=3D\"$(libsubdir)/include\" \
> -+  -DGCC_INCLUDE_SUBDIR_TARGET=3D\"$(libsubdir_target)/include\" \
> -   -DFIXED_INCLUDE_DIR=3D\"$(libsubdir)/include-fixed\" \
> -   -DGPLUSPLUS_INCLUDE_DIR=3D\"$(gcc_gxx_include_dir)\" \
> -   -DGPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT=3D$(gcc_gxx_include_dir_add_sysro=
ot) \
> -diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
> -index af38cc494ea..2f43b88a0c3 100644
> ---- a/gcc/cppdefault.c
> -+++ b/gcc/cppdefault.c
> -@@ -59,6 +59,10 @@ const struct default_include cpp_include_defaults[]
> -     /* This is the dir for gcc's private headers.  */
> -     { GCC_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
> - #endif
> -+#ifdef GCC_INCLUDE_SUBDIR_TARGET
> -+    /* This is the dir for gcc's private headers under the specified sy=
sroot.  */
> -+    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC", 0, =
0, 1, 0 },
> -+#endif
> - #ifdef LOCAL_INCLUDE_DIR
> -     /* /usr/local/include comes before the fixincluded header files.  *=
/
> -     { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0021-Us=
e-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch b/meta-arm-toolcha=
in/recipes-devtools/gcc/gcc-arm-10.3/0021-Use-SYSTEMLIBS_DIR-replacement-in=
stead-of-hardcoding.patch
> deleted file mode 100644
> index 58327209d402..000000000000
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0021-Use-SYSTE=
MLIBS_DIR-replacement-instead-of-hardcoding.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From 7c019b932f06bdce624b4739fba75dacff794076 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 28 Apr 2015 23:15:27 -0700
> -Subject: [PATCH] Use SYSTEMLIBS_DIR replacement instead of hardcoding
> - base_libdir
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - gcc/config/aarch64/aarch64-linux.h | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aar=
ch64-linux.h
> -index e587e2e9ad6..ddc62895693 100644
> ---- a/gcc/config/aarch64/aarch64-linux.h
> -+++ b/gcc/config/aarch64/aarch64-linux.h
> -@@ -21,7 +21,7 @@
> - #ifndef GCC_AARCH64_LINUX_H
> - #define GCC_AARCH64_LINUX_H
> -
> --#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-aarch64%{mbig-endian:_be}%{=
mabi=3Dilp32:_ilp32}.so.1"
> -+#define GLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-linux-aarch64%{mbig-en=
dian:_be}%{mabi=3Dilp32:_ilp32}.so.1"
> -
> - #undef MUSL_DYNAMIC_LINKER
> - #define MUSL_DYNAMIC_LINKER "/lib/ld-musl-aarch64%{mbig-endian:_be}%{ma=
bi=3Dilp32:_ilp32}.so.1"
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0022-aa=
rch64-Add-support-for-musl-ldso.patch b/meta-arm-toolchain/recipes-devtools=
/gcc/gcc-arm-10.3/0022-aarch64-Add-support-for-musl-ldso.patch
> deleted file mode 100644
> index 851f8ed063a5..000000000000
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0022-aarch64-A=
dd-support-for-musl-ldso.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -From ce93292090b1a8cb0b0b0061ec09243936bf9bcf Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 28 Apr 2015 23:18:39 -0700
> -Subject: [PATCH] aarch64: Add support for musl ldso
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - gcc/config/aarch64/aarch64-linux.h | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aar=
ch64-linux.h
> -index ddc62895693..b301825313a 100644
> ---- a/gcc/config/aarch64/aarch64-linux.h
> -+++ b/gcc/config/aarch64/aarch64-linux.h
> -@@ -24,7 +24,7 @@
> - #define GLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-linux-aarch64%{mbig-en=
dian:_be}%{mabi=3Dilp32:_ilp32}.so.1"
> -
> - #undef MUSL_DYNAMIC_LINKER
> --#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-aarch64%{mbig-endian:_be}%{ma=
bi=3Dilp32:_ilp32}.so.1"
> -+#define MUSL_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-musl-aarch64%{mbig-endi=
an:_be}%{mabi=3Dilp32:_ilp32}.so.1"
> -
> - #undef  ASAN_CC1_SPEC
> - #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0026-Fi=
x-various-_FOR_BUILD-and-related-variables.patch b/meta-arm-toolchain/recip=
es-devtools/gcc/gcc-arm-10.3/0026-Fix-various-_FOR_BUILD-and-related-variab=
les.patch
> deleted file mode 100644
> index 0356baac5c03..000000000000
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0026-Fix-vario=
us-_FOR_BUILD-and-related-variables.patch
> +++ /dev/null
> @@ -1,134 +0,0 @@
> -From b647a62ddbbb7fbc58aa865cd2d34539677eb107 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Mon, 7 Dec 2015 23:42:45 +0000
> -Subject: [PATCH] Fix various _FOR_BUILD and related variables
> -
> -When doing a FOR_BUILD thing, you have to override CFLAGS with
> -CFLAGS_FOR_BUILD. And if you use C++, you also have to override
> -CXXFLAGS with CXXFLAGS_FOR_BUILD.
> -Without this, when building for mingw, you end up trying to use
> -the mingw headers for a host build.
> -
> -The same goes for other variables as well, such as CPPFLAGS,
> -CPP, and GMPINC.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
> -Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - Makefile.in      | 6 ++++++
> - Makefile.tpl     | 5 +++++
> - gcc/Makefile.in  | 2 +-
> - gcc/configure    | 2 +-
> - gcc/configure.ac | 2 +-
> - 5 files changed, 14 insertions(+), 3 deletions(-)
> -
> -diff --git a/Makefile.in b/Makefile.in
> -index c717903bb13..5abc649868d 100644
> ---- a/Makefile.in
> -+++ b/Makefile.in
> -@@ -152,6 +152,7 @@ BUILD_EXPORTS =3D \
> -       CPP=3D"$(CC_FOR_BUILD) -E"; export CPP; \
> -       CFLAGS=3D"$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
> -       CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> -+      CPPFLAGS=3D"$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS; \
> -       CXX=3D"$(CXX_FOR_BUILD)"; export CXX; \
> -       CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
> -       GFORTRAN=3D"$(GFORTRAN_FOR_BUILD)"; export GFORTRAN; \
> -@@ -171,6 +172,9 @@ BUILD_EXPORTS =3D \
> - # built for the build system to override those in BASE_FLAGS_TO_PASS.
> - EXTRA_BUILD_FLAGS =3D \
> -       CFLAGS=3D"$(CFLAGS_FOR_BUILD)" \
> -+      CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)" \
> -+      CPP=3D"$(CC_FOR_BUILD) -E" \
> -+      CPPFLAGS=3D"$(CPPFLAGS_FOR_BUILD)" \
> -       LDFLAGS=3D"$(LDFLAGS_FOR_BUILD)"
> -
> - # This is the list of directories to built for the host system.
> -@@ -188,6 +192,7 @@ HOST_SUBDIR =3D @host_subdir@
> - HOST_EXPORTS =3D \
> -       $(BASE_EXPORTS) \
> -       CC=3D"$(CC)"; export CC; \
> -+      CPP=3D"$(CC) -E"; export CPP; \
> -       ADA_CFLAGS=3D"$(ADA_CFLAGS)"; export ADA_CFLAGS; \
> -       CFLAGS=3D"$(CFLAGS)"; export CFLAGS; \
> -       CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> -@@ -776,6 +781,7 @@ BASE_FLAGS_TO_PASS =3D \
> -       "CC_FOR_BUILD=3D$(CC_FOR_BUILD)" \
> -       "CFLAGS_FOR_BUILD=3D$(CFLAGS_FOR_BUILD)" \
> -       "CXX_FOR_BUILD=3D$(CXX_FOR_BUILD)" \
> -+      "CXXFLAGS_FOR_BUILD=3D$(CXXFLAGS_FOR_BUILD)" \
> -       "EXPECT=3D$(EXPECT)" \
> -       "FLEX=3D$(FLEX)" \
> -       "INSTALL=3D$(INSTALL)" \
> -diff --git a/Makefile.tpl b/Makefile.tpl
> -index efed1511750..778beb705b4 100644
> ---- a/Makefile.tpl
> -+++ b/Makefile.tpl
> -@@ -154,6 +154,7 @@ BUILD_EXPORTS =3D \
> -       CC=3D"$(CC_FOR_BUILD)"; export CC; \
> -       CFLAGS=3D"$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
> -       CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> -+      CPPFLAGS=3D"$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS; \
> -       CXX=3D"$(CXX_FOR_BUILD)"; export CXX; \
> -       CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
> -       GFORTRAN=3D"$(GFORTRAN_FOR_BUILD)"; export GFORTRAN; \
> -@@ -173,6 +174,9 @@ BUILD_EXPORTS =3D \
> - # built for the build system to override those in BASE_FLAGS_TO_PASS.
> - EXTRA_BUILD_FLAGS =3D \
> -       CFLAGS=3D"$(CFLAGS_FOR_BUILD)" \
> -+      CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)" \
> -+      CPP=3D"$(CC_FOR_BUILD) -E" \
> -+      CPPFLAGS=3D"$(CPPFLAGS_FOR_BUILD)" \
> -       LDFLAGS=3D"$(LDFLAGS_FOR_BUILD)"
> -
> - # This is the list of directories to built for the host system.
> -@@ -190,6 +194,7 @@ HOST_SUBDIR =3D @host_subdir@
> - HOST_EXPORTS =3D \
> -       $(BASE_EXPORTS) \
> -       CC=3D"$(CC)"; export CC; \
> -+      CPP=3D"$(CC) -E"; export CPP; \
> -       ADA_CFLAGS=3D"$(ADA_CFLAGS)"; export ADA_CFLAGS; \
> -       CFLAGS=3D"$(CFLAGS)"; export CFLAGS; \
> -       CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> -diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> -index 087bf3f1137..272d521a276 100644
> ---- a/gcc/Makefile.in
> -+++ b/gcc/Makefile.in
> -@@ -805,7 +805,7 @@ BUILD_LDFLAGS=3D@BUILD_LDFLAGS@
> - BUILD_NO_PIE_FLAG =3D @BUILD_NO_PIE_FLAG@
> - BUILD_LDFLAGS +=3D $(BUILD_NO_PIE_FLAG)
> - BUILD_CPPFLAGS=3D -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
> --              -I$(srcdir)/../include @INCINTL@ $(CPPINC) $(CPPFLAGS)
> -+              -I$(srcdir)/../include @INCINTL@ $(CPPINC) $(CPPFLAGS_FOR=
_BUILD)
> -
> - # Actual name to use when installing a native compiler.
> - GCC_INSTALL_NAME :=3D $(shell echo gcc|sed '$(program_transform_name)')
> -diff --git a/gcc/configure b/gcc/configure
> -index fde89ad8e89..e042e992419 100755
> ---- a/gcc/configure
> -+++ b/gcc/configure
> -@@ -12319,7 +12319,7 @@ else
> -       CC=3D"${CC_FOR_BUILD}" CFLAGS=3D"${CFLAGS_FOR_BUILD}" \
> -       CXX=3D"${CXX_FOR_BUILD}" CXXFLAGS=3D"${CXXFLAGS_FOR_BUILD}" \
> -       LD=3D"${LD_FOR_BUILD}" LDFLAGS=3D"${LDFLAGS_FOR_BUILD}" \
> --      GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS} -DGENERATOR_FILE" \
> -+      GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS_FOR_BUILD} -DGENERATOR_FILE" \
> -       ${realsrcdir}/configure \
> -               --enable-languages=3D${enable_languages-all} \
> -               ${enable_obsolete+--enable-obsolete=3D"$enable_obsolete"}=
 \
> -diff --git a/gcc/configure.ac b/gcc/configure.ac
> -index cad69549a01..8e35c9be7f9 100644
> ---- a/gcc/configure.ac
> -+++ b/gcc/configure.ac
> -@@ -1903,7 +1903,7 @@ else
> -       CC=3D"${CC_FOR_BUILD}" CFLAGS=3D"${CFLAGS_FOR_BUILD}" \
> -       CXX=3D"${CXX_FOR_BUILD}" CXXFLAGS=3D"${CXXFLAGS_FOR_BUILD}" \
> -       LD=3D"${LD_FOR_BUILD}" LDFLAGS=3D"${LDFLAGS_FOR_BUILD}" \
> --      GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS} -DGENERATOR_FILE" \
> -+      GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS_FOR_BUILD} -DGENERATOR_FILE" \
> -       ${realsrcdir}/configure \
> -               --enable-languages=3D${enable_languages-all} \
> -               ${enable_obsolete+--enable-obsolete=3D"$enable_obsolete"}=
 \
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0027-ni=
os2-Define-MUSL_DYNAMIC_LINKER.patch b/meta-arm-toolchain/recipes-devtools/=
gcc/gcc-arm-10.3/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch
> deleted file mode 100644
> index 47de3c354c48..000000000000
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0027-nios2-Def=
ine-MUSL_DYNAMIC_LINKER.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -From f7a6ddd3fb612393595f6e959e99d48c26f4d14f Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 2 Feb 2016 10:26:10 -0800
> -Subject: [PATCH] nios2: Define MUSL_DYNAMIC_LINKER
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Marek Vasut <marex@denx.de>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - gcc/config/nios2/linux.h | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/gcc/config/nios2/linux.h b/gcc/config/nios2/linux.h
> -index 4bdcdcca1f0..e7943a9d640 100644
> ---- a/gcc/config/nios2/linux.h
> -+++ b/gcc/config/nios2/linux.h
> -@@ -30,6 +30,7 @@
> - #define CPP_SPEC "%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRANT}"
> -
> - #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-nios2.so.1"
> -+#define MUSL_DYNAMIC_LINKER  "/lib/ld-musl-nios2.so.1"
> -
> - #undef LINK_SPEC
> - #define LINK_SPEC LINK_SPEC_ENDIAN \
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0031-fi=
x-segmentation-fault-in-precompiled-header-generat.patch b/meta-arm-toolcha=
in/recipes-devtools/gcc/gcc-arm-10.3/0031-fix-segmentation-fault-in-precomp=
iled-header-generat.patch
> deleted file mode 100644
> index 0b93a055c222..000000000000
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0031-fix-segme=
ntation-fault-in-precompiled-header-generat.patch
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -From d3b25e66c7f9c86b5da0fd3e9e6236e0b59dc934 Mon Sep 17 00:00:00 2001
> -From: Juro Bystricky <juro.bystricky@intel.com>
> -Date: Mon, 19 Mar 2018 22:31:20 -0700
> -Subject: [PATCH] fix segmentation fault in precompiled header generation
> -
> -Prevent a segmentation fault which occurs when using incorrect
> -structure trying to access name of some named operators, such as
> -CPP_NOT, CPP_AND etc. "token->val.node.spelling" cannot be used in
> -those cases, as is may not be initialized at all.
> -
> -[YOCTO #11738]
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - libcpp/lex.c | 26 +++++++++++++++++++++-----
> - 1 file changed, 21 insertions(+), 5 deletions(-)
> -
> -diff --git a/libcpp/lex.c b/libcpp/lex.c
> -index 665297af776..0ac5d67ddf0 100644
> ---- a/libcpp/lex.c
> -+++ b/libcpp/lex.c
> -@@ -3311,11 +3311,27 @@ cpp_spell_token (cpp_reader *pfile, const cpp_to=
ken *token,
> -     spell_ident:
> -     case SPELL_IDENT:
> -       if (forstring)
> --      {
> --        memcpy (buffer, NODE_NAME (token->val.node.spelling),
> --                NODE_LEN (token->val.node.spelling));
> --        buffer +=3D NODE_LEN (token->val.node.spelling);
> --      }
> -+        {
> -+          if (token->type =3D=3D CPP_NAME)
> -+            {
> -+              memcpy (buffer, NODE_NAME (token->val.node.spelling),
> -+                    NODE_LEN (token->val.node.spelling));
> -+              buffer +=3D NODE_LEN (token->val.node.spelling);
> -+              break;
> -+            }
> -+          /* NAMED_OP, cannot use node.spelling */
> -+          if (token->flags & NAMED_OP)
> -+            {
> -+              const char *str =3D cpp_named_operator2name (token->type)=
;
> -+              if (str)
> -+                {
> -+                  size_t len =3D strlen(str);
> -+                  memcpy(buffer, str, len);
> -+                  buffer +=3D len;
> -+                }
> -+              break;
> -+            }
> -+        }
> -       else
> -       buffer =3D _cpp_spell_ident_ucns (buffer, token->val.node.node);
> -       break;
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0032-Fi=
x-for-testsuite-failure.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc=
-arm-10.3/0032-Fix-for-testsuite-failure.patch
> deleted file mode 100644
> index 515c1d81866e..000000000000
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0032-Fix-for-t=
estsuite-failure.patch
> +++ /dev/null
> @@ -1,255 +0,0 @@
> -From a3beed38a5eaa122c375451adafd78289512ac5f Mon Sep 17 00:00:00 2001
> -From: RAGHUNATH LOLUR <raghunath.lolur@kpit.com>
> -Date: Wed, 6 Dec 2017 22:52:26 -0800
> -Subject: [PATCH] Fix for testsuite failure
> -
> -2017-11-16  Raghunath Lolur  <raghunath.lolur@kpit.com>
> -
> -       * gcc.dg/pr56275.c: If SSE is disabled, ensure that
> -       "-mfpmath" is not set to use SSE. Set "-mfpmath=3D387".
> -       * gcc.dg/pr68306.c: Likewise
> -       * gcc.dg/pr68306-2.c: Likewise
> -       * gcc.dg/pr68306-3.c: Likewise
> -       * gcc.dg/pr69634.c: Likewise
> -       * gcc.target/i386/amd64-abi-1.c: Likewise
> -       * gcc.target/i386/funcspec-6.c: Likewise
> -       * gcc.target/i386/interrupt-387-err-1.c: Likewise
> -       * gcc.target/i386/isa-14.c: Likewise
> -       * gcc.target/i386/pr44948-2b.c: Likewise
> -       * gcc.target/i386/pr53425-1.c: Likewise
> -       * gcc.target/i386/pr53425-2.c: Likewise
> -       * gcc.target/i386/pr55247.c: Likewise
> -       * gcc.target/i386/pr59644.c: Likewise
> -       * gcc.target/i386/pr62120.c: Likewise
> -       * gcc.target/i386/pr70467-1.c: Likewise
> -       * gcc.target/i386/warn-vect-op-1.c: Likewise
> -
> -If -Wall, -Werror are used during compilation various test cases fail
> -to compile.
> -
> -If SSE is disabled, be sure to -mfpmath=3D387 to resolve this.
> -
> -This patch removes the changes to Changelog from the original patch.
> -This will help us avoid conflicts.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ----
> - gcc/testsuite/gcc.dg/pr56275.c                      | 2 +-
> - gcc/testsuite/gcc.dg/pr68306-2.c                    | 2 +-
> - gcc/testsuite/gcc.dg/pr68306-3.c                    | 2 +-
> - gcc/testsuite/gcc.dg/pr68306.c                      | 2 +-
> - gcc/testsuite/gcc.dg/pr69634.c                      | 2 +-
> - gcc/testsuite/gcc.target/i386/amd64-abi-1.c         | 2 +-
> - gcc/testsuite/gcc.target/i386/funcspec-6.c          | 1 +
> - gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c | 2 +-
> - gcc/testsuite/gcc.target/i386/isa-14.c              | 2 +-
> - gcc/testsuite/gcc.target/i386/pr44948-2b.c          | 2 +-
> - gcc/testsuite/gcc.target/i386/pr53425-1.c           | 2 +-
> - gcc/testsuite/gcc.target/i386/pr53425-2.c           | 2 +-
> - gcc/testsuite/gcc.target/i386/pr55247.c             | 2 +-
> - gcc/testsuite/gcc.target/i386/pr59644.c             | 2 +-
> - gcc/testsuite/gcc.target/i386/pr62120.c             | 2 +-
> - gcc/testsuite/gcc.target/i386/pr70467-1.c           | 2 +-
> - gcc/testsuite/gcc.target/i386/warn-vect-op-1.c      | 2 +-
> - 17 files changed, 17 insertions(+), 16 deletions(-)
> -
> -diff --git a/gcc/testsuite/gcc.dg/pr56275.c b/gcc/testsuite/gcc.dg/pr562=
75.c
> -index b901bb2b199..a4f6c95e1a1 100644
> ---- a/gcc/testsuite/gcc.dg/pr56275.c
> -+++ b/gcc/testsuite/gcc.dg/pr56275.c
> -@@ -1,6 +1,6 @@
> - /* { dg-do compile } */
> - /* { dg-options "-O2" } */
> --/* { dg-additional-options "-mno-sse" { target { i?86-*-* x86_64-*-* } =
} } */
> -+/* { dg-additional-options "-mno-sse -mfpmath=3D387" { target { i?86-*-=
* x86_64-*-* } } } */
> -
> - typedef long long v2tw __attribute__ ((vector_size (2 * sizeof (long lo=
ng))));
> -
> -diff --git a/gcc/testsuite/gcc.dg/pr68306-2.c b/gcc/testsuite/gcc.dg/pr6=
8306-2.c
> -index 4672ebe7987..2a368c484b6 100644
> ---- a/gcc/testsuite/gcc.dg/pr68306-2.c
> -+++ b/gcc/testsuite/gcc.dg/pr68306-2.c
> -@@ -1,6 +1,6 @@
> - /* { dg-do compile } */
> - /* { dg-options "-O3" } */
> --/* { dg-additional-options "-mno-sse -mno-mmx" { target i?86-*-* x86_64=
-*-* } } */
> -+/* { dg-additional-options "-mno-sse -mno-mmx -mfpmath=3D387" { target =
i?86-*-* x86_64-*-* } } */
> -
> - struct {
> -     int tz_minuteswest;
> -diff --git a/gcc/testsuite/gcc.dg/pr68306-3.c b/gcc/testsuite/gcc.dg/pr6=
8306-3.c
> -index f5a8c102cf8..df3390c64c2 100644
> ---- a/gcc/testsuite/gcc.dg/pr68306-3.c
> -+++ b/gcc/testsuite/gcc.dg/pr68306-3.c
> -@@ -1,6 +1,6 @@
> - /* { dg-do compile } */
> - /* { dg-options "-O3" } */
> --/* { dg-additional-options "-mno-sse -mno-mmx" { target i?86-*-* x86_64=
-*-* } } */
> -+/* { dg-additional-options "-mno-sse -mno-mmx -mfpmath=3D387" { target =
i?86-*-* x86_64-*-* } } */
> - /* { dg-additional-options "-mno-altivec -mno-vsx" { target powerpc*-*-=
* } } */
> -
> - extern void fn2();
> -diff --git a/gcc/testsuite/gcc.dg/pr68306.c b/gcc/testsuite/gcc.dg/pr683=
06.c
> -index 54e5b40f221..0813389e2c1 100644
> ---- a/gcc/testsuite/gcc.dg/pr68306.c
> -+++ b/gcc/testsuite/gcc.dg/pr68306.c
> -@@ -1,6 +1,6 @@
> - /* { dg-do compile } */
> - /* { dg-options "-O3" } */
> --/* { dg-additional-options "-mno-sse -mno-mmx" { target i?86-*-* x86_64=
-*-* } } */
> -+/* { dg-additional-options "-mno-sse -mno-mmx -mfpmath=3D387" { target =
i?86-*-* x86_64-*-* } } */
> -
> - enum powerpc_pmc_type { PPC_PMC_IBM };
> - struct {
> -diff --git a/gcc/testsuite/gcc.dg/pr69634.c b/gcc/testsuite/gcc.dg/pr696=
34.c
> -index 60a56149463..bcc23f9ccd6 100644
> ---- a/gcc/testsuite/gcc.dg/pr69634.c
> -+++ b/gcc/testsuite/gcc.dg/pr69634.c
> -@@ -1,6 +1,6 @@
> - /* { dg-do compile } */
> - /* { dg-options "-O2 -fno-dce -fschedule-insns -fno-tree-vrp -fcompare-=
debug -Wno-psabi" } */
> --/* { dg-additional-options "-mno-sse" { target i?86-*-* x86_64-*-* } } =
*/
> -+/* { dg-additional-options "-mno-sse -mfpmath=3D387" { target i?86-*-* =
x86_64-*-* } } */
> - /* { dg-require-effective-target scheduling } */
> -
> - typedef unsigned short u16;
> -diff --git a/gcc/testsuite/gcc.target/i386/amd64-abi-1.c b/gcc/testsuite=
/gcc.target/i386/amd64-abi-1.c
> -index 69fde57bf06..7f1f1c03edf 100644
> ---- a/gcc/testsuite/gcc.target/i386/amd64-abi-1.c
> -+++ b/gcc/testsuite/gcc.target/i386/amd64-abi-1.c
> -@@ -1,5 +1,5 @@
> - /* { dg-do compile { target { ! ia32 } } } */
> --/* { dg-options "-mno-sse" } */
> -+/* { dg-options "-mno-sse -mfpmath=3D387" } */
> - /* { dg-additional-options "-mabi=3Dsysv" { target *-*-mingw* } } */
> -
> - double foo(void) { return 0; }        /* { dg-error "SSE disabled" } */
> -diff --git a/gcc/testsuite/gcc.target/i386/funcspec-6.c b/gcc/testsuite/=
gcc.target/i386/funcspec-6.c
> -index ea896b7ebfd..bf15569b826 100644
> ---- a/gcc/testsuite/gcc.target/i386/funcspec-6.c
> -+++ b/gcc/testsuite/gcc.target/i386/funcspec-6.c
> -@@ -1,6 +1,7 @@
> - /* Test whether all of the 64-bit function specific options are accepte=
d
> -    without error.  */
> - /* { dg-do compile { target { ! ia32 } } } */
> -+/* { dg-additional-options "-mfpmath=3D387" } */
> -
> - #include "funcspec-56.inc"
> -
> -diff --git a/gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c b/gcc/t=
estsuite/gcc.target/i386/interrupt-387-err-1.c
> -index 8561a3c26d6..6377f814645 100644
> ---- a/gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c
> -+++ b/gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c
> -@@ -1,5 +1,5 @@
> - /* { dg-do compile } */
> --/* { dg-options "-O2 -mgeneral-regs-only -mno-cld -mno-iamcu -m80387" }=
 */
> -+/* { dg-options "-O2 -mgeneral-regs-only -mno-cld -mno-iamcu -m80387 -m=
fpmath=3D387" } */
> -
> - typedef unsigned int uword_t __attribute__ ((mode (__word__)));
> -
> -diff --git a/gcc/testsuite/gcc.target/i386/isa-14.c b/gcc/testsuite/gcc.=
target/i386/isa-14.c
> -index 5d49e6e77fe..1de2db92bdd 100644
> ---- a/gcc/testsuite/gcc.target/i386/isa-14.c
> -+++ b/gcc/testsuite/gcc.target/i386/isa-14.c
> -@@ -1,5 +1,5 @@
> - /* { dg-do run } */
> --/* { dg-options "-march=3Dx86-64 -msse4a -mfma4 -mno-sse" } */
> -+/* { dg-options "-march=3Dx86-64 -msse4a -mfma4 -mno-sse -mfpmath=3D387=
" } */
> -
> - extern void abort (void);
> -
> -diff --git a/gcc/testsuite/gcc.target/i386/pr44948-2b.c b/gcc/testsuite/=
gcc.target/i386/pr44948-2b.c
> -index fa1769b62fb..f79fb12726f 100644
> ---- a/gcc/testsuite/gcc.target/i386/pr44948-2b.c
> -+++ b/gcc/testsuite/gcc.target/i386/pr44948-2b.c
> -@@ -1,5 +1,5 @@
> - /* { dg-do compile } */
> --/* { dg-options "-O -mno-sse -Wno-psabi -mtune=3Dgeneric" } */
> -+/* { dg-options "-O -mno-sse -Wno-psabi -mtune=3Dgeneric -mfpmath=3D387=
" } */
> -
> - struct A
> - {
> -diff --git a/gcc/testsuite/gcc.target/i386/pr53425-1.c b/gcc/testsuite/g=
cc.target/i386/pr53425-1.c
> -index 2e89ff7d81d..6339bf6b736 100644
> ---- a/gcc/testsuite/gcc.target/i386/pr53425-1.c
> -+++ b/gcc/testsuite/gcc.target/i386/pr53425-1.c
> -@@ -1,6 +1,6 @@
> - /* PR target/53425 */
> - /* { dg-do compile { target { ! ia32 } } } */
> --/* { dg-options "-O2 -mno-sse" } */
> -+/* { dg-options "-O2 -mno-sse -mfpmath=3D387" } */
> - /* { dg-skip-if "no SSE vector" { x86_64-*-mingw* } } */
> -
> - typedef double __v2df __attribute__ ((__vector_size__ (16)));
> -diff --git a/gcc/testsuite/gcc.target/i386/pr53425-2.c b/gcc/testsuite/g=
cc.target/i386/pr53425-2.c
> -index 61f6283dbe9..2c5a55f0ac3 100644
> ---- a/gcc/testsuite/gcc.target/i386/pr53425-2.c
> -+++ b/gcc/testsuite/gcc.target/i386/pr53425-2.c
> -@@ -1,6 +1,6 @@
> - /* PR target/53425 */
> - /* { dg-do compile { target { ! ia32 } } } */
> --/* { dg-options "-O2 -mno-sse" } */
> -+/* { dg-options "-O2 -mno-sse -mfpmath=3D387" } */
> - /* { dg-skip-if "no SSE vector" { x86_64-*-mingw* } } */
> -
> - typedef float __v2sf __attribute__ ((__vector_size__ (8)));
> -diff --git a/gcc/testsuite/gcc.target/i386/pr55247.c b/gcc/testsuite/gcc=
.target/i386/pr55247.c
> -index 23366d0909d..9810e3abb76 100644
> ---- a/gcc/testsuite/gcc.target/i386/pr55247.c
> -+++ b/gcc/testsuite/gcc.target/i386/pr55247.c
> -@@ -1,6 +1,6 @@
> - /* { dg-do compile { target { ! ia32 } } } */
> - /* { dg-require-effective-target maybe_x32 } */
> --/* { dg-options "-O2 -mno-sse -mno-mmx -mx32 -maddress-mode=3Dlong" } *=
/
> -+/* { dg-options "-O2 -mno-sse -mno-mmx -mx32 -maddress-mode=3Dlong -mfp=
math=3D387" } */
> -
> - typedef unsigned int uint32_t;
> - typedef uint32_t Elf32_Word;
> -diff --git a/gcc/testsuite/gcc.target/i386/pr59644.c b/gcc/testsuite/gcc=
.target/i386/pr59644.c
> -index 96006b3e338..4287e4538bf 100644
> ---- a/gcc/testsuite/gcc.target/i386/pr59644.c
> -+++ b/gcc/testsuite/gcc.target/i386/pr59644.c
> -@@ -1,6 +1,6 @@
> - /* PR target/59644 */
> - /* { dg-do run { target lp64 } } */
> --/* { dg-options "-O2 -ffreestanding -mno-sse -mpreferred-stack-boundary=
=3D3 -maccumulate-outgoing-args -mno-red-zone" } */
> -+/* { dg-options "-O2 -ffreestanding -mno-sse -mpreferred-stack-boundary=
=3D3 -maccumulate-outgoing-args -mno-red-zone -mfpmath=3D387" } */
> -
> - /* This test uses __builtin_trap () instead of e.g. abort,
> -    because due to -mpreferred-stack-boundary=3D3 it should not call
> -diff --git a/gcc/testsuite/gcc.target/i386/pr62120.c b/gcc/testsuite/gcc=
.target/i386/pr62120.c
> -index 28d85d37712..c93266bd4bc 100644
> ---- a/gcc/testsuite/gcc.target/i386/pr62120.c
> -+++ b/gcc/testsuite/gcc.target/i386/pr62120.c
> -@@ -1,5 +1,5 @@
> - /* { dg-do compile } */
> --/* { dg-options "-mno-sse" } */
> -+/* { dg-options "-mno-sse -mfpmath=3D387" } */
> -
> - void foo ()
> - {
> -diff --git a/gcc/testsuite/gcc.target/i386/pr70467-1.c b/gcc/testsuite/g=
cc.target/i386/pr70467-1.c
> -index 4e112c88d07..bcfb396a68d 100644
> ---- a/gcc/testsuite/gcc.target/i386/pr70467-1.c
> -+++ b/gcc/testsuite/gcc.target/i386/pr70467-1.c
> -@@ -1,6 +1,6 @@
> - /* PR rtl-optimization/70467 */
> - /* { dg-do compile } */
> --/* { dg-options "-O2 -mno-sse" } */
> -+/* { dg-options "-O2 -mno-sse -mfpmath=3D387" } */
> -
> - void foo (unsigned long long *);
> -
> -diff --git a/gcc/testsuite/gcc.target/i386/warn-vect-op-1.c b/gcc/testsu=
ite/gcc.target/i386/warn-vect-op-1.c
> -index 6cda1534311..26e37f5b8ba 100644
> ---- a/gcc/testsuite/gcc.target/i386/warn-vect-op-1.c
> -+++ b/gcc/testsuite/gcc.target/i386/warn-vect-op-1.c
> -@@ -1,5 +1,5 @@
> - /* { dg-do compile { target { ! ia32 } } }  */
> --/* { dg-options "-mno-sse -Wvector-operation-performance" }  */
> -+/* { dg-options "-mno-sse -Wvector-operation-performance -mfpmath=3D387=
" }  */
> - #define vector(elcount, type)  \
> - __attribute__((vector_size((elcount)*sizeof(type)))) type
> -
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0038-li=
batomic-libgomp-libitc-Fix-bootstrap-PR70454.patch b/meta-arm-toolchain/rec=
ipes-devtools/gcc/gcc-arm-10.3/0038-libatomic-libgomp-libitc-Fix-bootstrap-=
PR70454.patch
> deleted file mode 100644
> index 65c3e398fe21..000000000000
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0038-libatomic=
-libgomp-libitc-Fix-bootstrap-PR70454.patch
> +++ /dev/null
> @@ -1,209 +0,0 @@
> -From eb5a17c7b8ed676d83ce4dd0e9623e2ee0191f91 Mon Sep 17 00:00:00 2001
> -From: Jakub Jelinek <jakub@redhat.com>
> -Date: Fri, 15 Jan 2021 13:12:59 +0100
> -Subject: [PATCH] libatomic, libgomp, libitc: Fix bootstrap [PR70454]
> -
> -The recent changes to error on mixing -march=3Di386 and -fcf-protection =
broke
> -bootstrap.  This patch changes lib{atomic,gomp,itm} configury, so that i=
t
> -only adds -march=3Di486 to flags if really needed (i.e. when 486 or late=
r isn't
> -on by default already).  Similarly, it will not use ifuncs if -mcx16
> -(or -march=3Di686 for 32-bit) is on by default.
> -
> -2021-01-15  Jakub Jelinek  <jakub@redhat.com>
> -
> -       PR target/70454
> -libatomic/
> -       * configure.tgt: For i?86 and x86_64 determine if -march=3Di486 n=
eeds to
> -       be added through preprocessor check on
> -       __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4.  Determine if try_ifunc is ne=
eded
> -       based on preprocessor check on __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1=
6
> -       or __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8.
> -libgomp/
> -       * configure.tgt: For i?86 and x86_64 determine if -march=3Di486 n=
eeds to
> -       be added through preprocessor check on
> -       __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4.
> -libitm/
> -       * configure.tgt: For i?86 and x86_64 determine if -march=3Di486 n=
eeds to
> -       be added through preprocessor check on
> -       __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4.
> -
> -Upstream-Status: Backport [master post 10.x release]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - libatomic/configure.tgt | 56 +++++++++++++++++++++++------------------
> - libgomp/configure.tgt   | 35 +++++++++++---------------
> - libitm/configure.tgt    | 37 +++++++++++++--------------
> - 3 files changed, 64 insertions(+), 64 deletions(-)
> -
> -diff --git a/libatomic/configure.tgt b/libatomic/configure.tgt
> -index 5dd0926d207..6ea082a29bc 100644
> ---- a/libatomic/configure.tgt
> -+++ b/libatomic/configure.tgt
> -@@ -81,32 +81,40 @@ case "${target_cpu}" in
> -       ARCH=3Dsparc
> -       ;;
> -
> --  i[3456]86)
> --      case " ${CC} ${CFLAGS} " in
> --        *" -m64 "*|*" -mx32 "*)
> --          ;;
> --        *)
> --          if test -z "$with_arch"; then
> --            XCFLAGS=3D"${XCFLAGS} -march=3Di486 -mtune=3D${target_cpu}"
> --            XCFLAGS=3D"${XCFLAGS} -fomit-frame-pointer"
> --          fi
> --      esac
> --      ARCH=3Dx86
> --      # ??? Detect when -march=3Di686 is already enabled.
> --      try_ifunc=3Dyes
> --      ;;
> --  x86_64)
> --      case " ${CC} ${CFLAGS} " in
> --        *" -m32 "*)
> -+  i[3456]86 | x86_64)
> -+      cat > conftestx.c <<EOF
> -+#ifndef __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4
> -+#error need -march=3Di486
> -+#endif
> -+EOF
> -+      if ${CC} ${CFLAGS} -E conftestx.c > /dev/null 2>&1; then
> -+        :
> -+      else
> -+        if test "${target_cpu}" =3D x86_64; then
> -           XCFLAGS=3D"${XCFLAGS} -march=3Di486 -mtune=3Dgeneric"
> --          XCFLAGS=3D"${XCFLAGS} -fomit-frame-pointer"
> --          ;;
> --        *)
> --          ;;
> --      esac
> -+        else
> -+          XCFLAGS=3D"${XCFLAGS} -march=3Di486 -mtune=3D${target_cpu}"
> -+        fi
> -+        XCFLAGS=3D"${XCFLAGS} -fomit-frame-pointer"
> -+      fi
> -+      cat > conftestx.c <<EOF
> -+#ifdef __x86_64__
> -+#ifndef __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16
> -+#error need -mcx16
> -+#endif
> -+#else
> -+#ifndef __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8
> -+#error need -march=3Di686
> -+#endif
> -+#endif
> -+EOF
> -+      if ${CC} ${CFLAGS} -E conftestx.c > /dev/null 2>&1; then
> -+        try_ifunc=3Dno
> -+      else
> -+        try_ifunc=3Dyes
> -+      fi
> -+      rm -f conftestx.c
> -       ARCH=3Dx86
> --      # ??? Detect when -mcx16 is already enabled.
> --      try_ifunc=3Dyes
> -       ;;
> -
> -   *)                  ARCH=3D"${target_cpu}" ;;
> -diff --git a/libgomp/configure.tgt b/libgomp/configure.tgt
> -index 4790a31e394..761ef2a7db2 100644
> ---- a/libgomp/configure.tgt
> -+++ b/libgomp/configure.tgt
> -@@ -70,28 +70,23 @@ if test x$enable_linux_futex =3D xyes; then
> -       ;;
> -
> -     # Note that bare i386 is not included here.  We need cmpxchg.
> --    i[456]86-*-linux*)
> -+    i[456]86-*-linux* | x86_64-*-linux*)
> -       config_path=3D"linux/x86 linux posix"
> --      case " ${CC} ${CFLAGS} " in
> --        *" -m64 "*|*" -mx32 "*)
> --          ;;
> --        *)
> --          if test -z "$with_arch"; then
> --            XCFLAGS=3D"${XCFLAGS} -march=3Di486 -mtune=3D${target_cpu}"
> --          fi
> --      esac
> --      ;;
> --
> --    # Similar jiggery-pokery for x86_64 multilibs, except here we
> --    # can't rely on the --with-arch configure option, since that
> --    # applies to the 64-bit side.
> --    x86_64-*-linux*)
> --      config_path=3D"linux/x86 linux posix"
> --      case " ${CC} ${CFLAGS} " in
> --        *" -m32 "*)
> -+      cat > conftestx.c <<EOF
> -+#ifndef __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4
> -+#error need -march=3Di486
> -+#endif
> -+EOF
> -+      if ${CC} ${CFLAGS} -E conftestx.c > /dev/null 2>&1; then
> -+        :
> -+      else
> -+        if test "${target_cpu}" =3D x86_64; then
> -           XCFLAGS=3D"${XCFLAGS} -march=3Di486 -mtune=3Dgeneric"
> --          ;;
> --      esac
> -+        else
> -+          XCFLAGS=3D"${XCFLAGS} -march=3Di486 -mtune=3D${target_cpu}"
> -+        fi
> -+      fi
> -+      rm -f conftestx.c
> -       ;;
> -
> -     # Note that sparcv7 and sparcv8 is not included here.  We need cas.
> -diff --git a/libitm/configure.tgt b/libitm/configure.tgt
> -index d1beb5c9ec8..608462e184e 100644
> ---- a/libitm/configure.tgt
> -+++ b/libitm/configure.tgt
> -@@ -59,16 +59,23 @@ case "${target_cpu}" in
> -
> -   arm*)               ARCH=3Darm ;;
> -
> --  i[3456]86)
> --      case " ${CC} ${CFLAGS} " in
> --        *" -m64 "*|*" -mx32 "*)
> --          ;;
> --        *)
> --          if test -z "$with_arch"; then
> --            XCFLAGS=3D"${XCFLAGS} -march=3Di486 -mtune=3D${target_cpu}"
> --            XCFLAGS=3D"${XCFLAGS} -fomit-frame-pointer"
> --          fi
> --      esac
> -+  i[3456]86 | x86_64)
> -+      cat > conftestx.c <<EOF
> -+#ifndef __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4
> -+#error need -march=3Di486
> -+#endif
> -+EOF
> -+      if ${CC} ${CFLAGS} -E conftestx.c > /dev/null 2>&1; then
> -+        :
> -+      else
> -+        if test "${target_cpu}" =3D x86_64; then
> -+          XCFLAGS=3D"${XCFLAGS} -march=3Di486 -mtune=3Dgeneric"
> -+        else
> -+          XCFLAGS=3D"${XCFLAGS} -march=3Di486 -mtune=3D${target_cpu}"
> -+        fi
> -+        XCFLAGS=3D"${XCFLAGS} -fomit-frame-pointer"
> -+      fi
> -+      rm -f conftestx.c
> -       XCFLAGS=3D"${XCFLAGS} -mrtm"
> -       ARCH=3Dx86
> -       ;;
> -@@ -103,16 +110,6 @@ case "${target_cpu}" in
> -       ARCH=3Dsparc
> -       ;;
> -
> --  x86_64)
> --      case " ${CC} ${CFLAGS} " in
> --        *" -m32 "*)
> --          XCFLAGS=3D"${XCFLAGS} -march=3Di486 -mtune=3Dgeneric"
> --          XCFLAGS=3D"${XCFLAGS} -fomit-frame-pointer"
> --          ;;
> --      esac
> --      XCFLAGS=3D"${XCFLAGS} -mrtm"
> --      ARCH=3Dx86
> --      ;;
> -   s390|s390x)
> -       XCFLAGS=3D"${XCFLAGS} -mzarch -mhtm"
> -       ARCH=3Ds390
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3.inc b/m=
eta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2.inc
> similarity index 80%
> rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3.inc
> rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2.inc
> index 20e6d3ea377d..04c6751c26ed 100644
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3.inc
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2.inc
> @@ -1,15 +1,15 @@
>  require recipes-devtools/gcc/gcc-common.inc
>
>  # Third digit in PV should be incremented after a minor release
> -ARM_GCC_VERSION =3D "10.3"
> +ARM_GCC_VERSION =3D "11.2"
>  PV =3D "arm-${ARM_GCC_VERSION}"
> -CVE_VERSION =3D "10.3"
> +CVE_VERSION =3D "11.2"
>
>  # BINV should be incremented to a revision after a minor gcc release
>
> -BINV =3D "10.3.1"
> +BINV =3D "11.2.1"
>
> -MMYY =3D "21.07"
> +MMYY =3D "22.02"
>  RELEASE =3D "20${MMYY}"
>  PR =3D "r${RELEASE}"
>
> @@ -28,22 +28,16 @@ LIC_FILES_CHKSUM =3D "\
>      file://COPYING.RUNTIME;md5=3Dfe60d87048567d4fe8c8a0ed2448bcc8 \
>  "
>
> -BASEURI ?=3D "https://developer.arm.com/-/media/Files/downloads/gnu-a/${=
ARM_GCC_VERSION}-${RELEASE}/srcrel/gcc-arm-src-snapshot-${ARM_GCC_VERSION}-=
${RELEASE}.tar.xz"
> +BASEURI ?=3D "https://developer.arm.com/-/media/Files/downloads/gnu/${AR=
M_GCC_VERSION}-${RELEASE}/srcrel/gcc-arm-src-snapshot-${ARM_GCC_VERSION}-${=
RELEASE}.tar.xz"
>  SRC_URI =3D "\
>             ${BASEURI} \
>             file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
>             file://0002-gcc-poison-system-directories.patch \
> -           file://0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch \
>             file://0004-64-bit-multilib-hack.patch \
> -           file://0005-optional-libstdc.patch \
> -           file://0006-COLLECT_GCC_OPTIONS.patch \
>             file://0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-=
B.patch \
> -           file://0008-fortran-cross-compile-hack.patch \
>             file://0009-cpp-honor-sysroot.patch \
> -           file://0010-MIPS64-Default-to-N64-ABI.patch \
>             file://0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LI=
NKE.patch \
>             file://0012-gcc-Fix-argument-list-too-long-error.patch \
> -           file://0013-Disable-sdt.patch \
>             file://0014-libtool.patch \
>             file://0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI=
.patch \
>             file://0016-Use-the-multilib-config-files-from-B-instead-of-u=
sin.patch \
> @@ -51,26 +45,28 @@ SRC_URI =3D "\
>             file://0018-export-CPP.patch \
>             file://0019-Ensure-target-gcc-headers-can-be-included.patch \
>             file://0020-Don-t-search-host-directory-during-relink-if-inst=
_pr.patch \
> -           file://0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcod=
ing.patch \
> -           file://0022-aarch64-Add-support-for-musl-ldso.patch \
>             file://0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch =
\
>             file://0024-handle-sysroot-support-for-nativesdk-gcc.patch \
>             file://0025-Search-target-sysroot-gcc-version-specific-dirs-w=
ith.patch \
> -           file://0026-Fix-various-_FOR_BUILD-and-related-variables.patc=
h \
>             file://0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch \
>             file://0028-Add-ssp_nonshared-to-link-commandline-for-musl-ta=
rge.patch \
>             file://0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.=
patch \
>             file://0030-sync-gcc-stddef.h-with-musl.patch \
> -           file://0031-fix-segmentation-fault-in-precompiled-header-gene=
rat.patch \
> -           file://0032-Fix-for-testsuite-failure.patch \
>             file://0033-Re-introduce-spe-commandline-options.patch \
>             file://0034-libgcc_s-Use-alias-for-__cpu_indicator_init-inste=
ad-.patch \
>             file://0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintai=
nin.patch \
>             file://0036-mingw32-Enable-operation_not_supported.patch \
>             file://0037-libatomic-Do-not-enforce-march-on-aarch64.patch \
> -           file://0038-libatomic-libgomp-libitc-Fix-bootstrap-PR70454.pa=
tch \
> +           file://0041-apply-debug-prefix-maps-before-checksumming-DIEs.=
patch \
> +           file://0006-If-CXXFLAGS-contains-something-unsupported-by-the=
-bu.patch \
> +           file://0001-Fix-install-path-of-linux64.h.patch \
> +           file://0001-CVE-2021-42574.patch \
> +           file://0002-CVE-2021-42574.patch \
> +           file://0003-CVE-2021-42574.patch \
> +           file://0004-CVE-2021-42574.patch \
> +           file://0001-CVE-2021-46195.patch \
>  "
> -SRC_URI[md5sum] =3D "5f582fd50eee0e40475b93d2d7a18979"
> +SRC_URI[sha256sum] =3D "417662cd4e79e74b9fbac67bf1edac1c03d11ea58f101444=
87b7e25e58ff4931"
>
>  S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-arm-src-snapshot-${ARM_=
GCC_VERSION}-${RELEASE}"
>
> @@ -120,3 +116,6 @@ EXTRA_OECONF_PATHS =3D "\
>      --with-sysroot=3D/not/exist \
>      --with-build-sysroot=3D${STAGING_DIR_TARGET} \
>  "
> +
> +# Is a binutils 2.26 issue, not gcc
> +CVE_CHECK_IGNORE +=3D "CVE-2021-37322"
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0001-CV=
E-2021-42574.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0=
001-CVE-2021-42574.patch
> new file mode 100644
> index 000000000000..4d680ccc8f61
> --- /dev/null
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0001-CVE-2021-=
42574.patch
> @@ -0,0 +1,2282 @@
> +From bd5e882cf6e0def3dd1bc106075d59a303fe0d1e Mon Sep 17 00:00:00 2001
> +From: David Malcolm <dmalcolm@redhat.com>
> +Date: Mon, 18 Oct 2021 18:55:31 -0400
> +Subject: [PATCH] diagnostics: escape non-ASCII source bytes for certain
> + diagnostics
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3Dutf8
> +Content-Transfer-Encoding: 8bit
> +
> +This patch adds support to GCC's diagnostic subsystem for escaping certa=
in
> +bytes and Unicode characters when quoting source code.
> +
> +Specifically, this patch adds a new flag rich_location::m_escape_on_outp=
ut
> +which is a hint from a diagnostic that non-ASCII bytes in the pertinent
> +lines of the user's source code should be escaped when printed.
> +
> +The patch sets this for the following diagnostics:
> +- when complaining about stray bytes in the program (when these
> +are non-printable)
> +- when complaining about "null character(s) ignored");
> +- for -Wnormalized=3D (and generate source ranges for such warnings)
> +
> +The escaping is controlled by a new option:
> +  -fdiagnostics-escape-format=3D[unicode|bytes]
> +
> +For example, consider a diagnostic involing a source line containing the
> +string "before" followed by the Unicode character U+03C0 ("GREEK SMALL
> +LETTER PI", with UTF-8 encoding 0xCF 0x80) followed by the byte 0xBF
> +(a stray UTF-8 trailing byte), followed by the string "after", where the
> +diagnostic highlights the U+03C0 character.
> +
> +By default, this line will be printed verbatim to the user when
> +reporting a diagnostic at it, as:
> +
> + before=C3=8FXafter
> +       ^
> +
> +(using X for the stray byte to avoid putting invalid UTF-8 in this
> +commit message)
> +
> +If the diagnostic sets the "escape" flag, it will be printed as:
> +
> + before<U+03C0><BF>after
> +       ^~~~~~~~
> +
> +with -fdiagnostics-escape-format=3Dunicode (the default), or as:
> +
> +  before<CF><80><BF>after
> +        ^~~~~~~~
> +
> +if the user supplies -fdiagnostics-escape-format=3Dbytes.
> +
> +This only affects how the source is printed; it does not affect
> +how column numbers that are printed (as per -fdiagnostics-column-unit=3D
> +and -fdiagnostics-column-origin=3D).
> +
> +gcc/c-family/ChangeLog:
> +       * c-lex.c (c_lex_with_flags): When complaining about non-printabl=
e
> +       CPP_OTHER tokens, set the "escape on output" flag.
> +
> +gcc/ChangeLog:
> +       * common.opt (fdiagnostics-escape-format=3D): New.
> +       (diagnostics_escape_format): New enum.
> +       (DIAGNOSTICS_ESCAPE_FORMAT_UNICODE): New enum value.
> +       (DIAGNOSTICS_ESCAPE_FORMAT_BYTES): Likewise.
> +       * diagnostic-format-json.cc (json_end_diagnostic): Add
> +       "escape-source" attribute.
> +       * diagnostic-show-locus.c
> +       (exploc_with_display_col::exploc_with_display_col): Replace
> +       "tabstop" param with a cpp_char_column_policy and add an "aspect"
> +       param.  Use these to compute m_display_col accordingly.
> +       (struct char_display_policy): New struct.
> +       (layout::m_policy): New field.
> +       (layout::m_escape_on_output): New field.
> +       (def_policy): New function.
> +       (make_range): Update for changes to exploc_with_display_col ctor.
> +       (default_print_decoded_ch): New.
> +       (width_per_escaped_byte): New.
> +       (escape_as_bytes_width): New.
> +       (escape_as_bytes_print): New.
> +       (escape_as_unicode_width): New.
> +       (escape_as_unicode_print): New.
> +       (make_policy): New.
> +       (layout::layout): Initialize new fields.  Update m_exploc ctor
> +       call for above change to ctor.
> +       (layout::maybe_add_location_range): Update for changes to
> +       exploc_with_display_col ctor.
> +       (layout::calculate_x_offset_display): Update for change to
> +       cpp_display_width.
> +       (layout::print_source_line): Pass policy
> +       to cpp_display_width_computation. Capture cpp_decoded_char when
> +       calling process_next_codepoint.  Move printing of source code to
> +       m_policy.m_print_cb.
> +       (line_label::line_label): Pass in policy rather than context.
> +       (layout::print_any_labels): Update for change to line_label ctor.
> +       (get_affected_range): Pass in policy rather than context, updatin=
g
> +       calls to location_compute_display_column accordingly.
> +       (get_printed_columns): Likewise, also for cpp_display_width.
> +       (correction::correction): Pass in policy rather than tabstop.
> +       (correction::compute_display_cols): Pass m_policy rather than
> +       m_tabstop to cpp_display_width.
> +       (correction::m_tabstop): Replace with...
> +       (correction::m_policy): ...this.
> +       (line_corrections::line_corrections): Pass in policy rather than
> +       context.
> +       (line_corrections::m_context): Replace with...
> +       (line_corrections::m_policy): ...this.
> +       (line_corrections::add_hint): Update to use m_policy rather than
> +       m_context.
> +       (line_corrections::add_hint): Likewise.
> +       (layout::print_trailing_fixits): Likewise.
> +       (selftest::test_display_widths): New.
> +       (selftest::test_layout_x_offset_display_utf8): Update to use
> +       policy rather than tabstop.
> +       (selftest::test_one_liner_labels_utf8): Add test of escaping
> +       source lines.
> +       (selftest::test_diagnostic_show_locus_one_liner_utf8): Update to
> +       use policy rather than tabstop.
> +       (selftest::test_overlapped_fixit_printing): Likewise.
> +       (selftest::test_overlapped_fixit_printing_utf8): Likewise.
> +       (selftest::test_overlapped_fixit_printing_2): Likewise.
> +       (selftest::test_tab_expansion): Likewise.
> +       (selftest::test_escaping_bytes_1): New.
> +       (selftest::test_escaping_bytes_2): New.
> +       (selftest::diagnostic_show_locus_c_tests): Call the new tests.
> +       * diagnostic.c (diagnostic_initialize): Initialize
> +       context->escape_format.
> +       (convert_column_unit): Update to use default character width poli=
cy.
> +       (selftest::test_diagnostic_get_location_text): Likewise.
> +       * diagnostic.h (enum diagnostics_escape_format): New enum.
> +       (diagnostic_context::escape_format): New field.
> +       * doc/invoke.texi (-fdiagnostics-escape-format=3D): New option.
> +       (-fdiagnostics-format=3D): Add "escape-source" attribute to examp=
les
> +       of JSON output, and document it.
> +       * input.c (location_compute_display_column): Pass in "policy"
> +       rather than "tabstop", passing to
> +       cpp_byte_column_to_display_column.
> +       (selftest::test_cpp_utf8): Update to use cpp_char_column_policy.
> +       * input.h (class cpp_char_column_policy): New forward decl.
> +       (location_compute_display_column): Pass in "policy" rather than
> +       "tabstop".
> +       * opts.c (common_handle_option): Handle
> +       OPT_fdiagnostics_escape_format_.
> +       * selftest.c (temp_source_file::temp_source_file): New ctor
> +       overload taking a size_t.
> +       * selftest.h (temp_source_file::temp_source_file): Likewise.
> +
> +gcc/testsuite/ChangeLog:
> +       * c-c++-common/diagnostic-format-json-1.c: Add regexp to consume
> +       "escape-source" attribute.
> +       * c-c++-common/diagnostic-format-json-2.c: Likewise.
> +       * c-c++-common/diagnostic-format-json-3.c: Likewise.
> +       * c-c++-common/diagnostic-format-json-4.c: Likewise, twice.
> +       * c-c++-common/diagnostic-format-json-5.c: Likewise.
> +       * gcc.dg/cpp/warn-normalized-4-bytes.c: New test.
> +       * gcc.dg/cpp/warn-normalized-4-unicode.c: New test.
> +       * gcc.dg/encoding-issues-bytes.c: New test.
> +       * gcc.dg/encoding-issues-unicode.c: New test.
> +       * gfortran.dg/diagnostic-format-json-1.F90: Add regexp to consume
> +       "escape-source" attribute.
> +       * gfortran.dg/diagnostic-format-json-2.F90: Likewise.
> +       * gfortran.dg/diagnostic-format-json-3.F90: Likewise.
> +
> +libcpp/ChangeLog:
> +       * charset.c (convert_escape): Use encoding_rich_location when
> +       complaining about nonprintable unknown escape sequences.
> +       (cpp_display_width_computation::::cpp_display_width_computation):
> +       Pass in policy rather than tabstop.
> +       (cpp_display_width_computation::process_next_codepoint): Add "out=
"
> +       param and populate *out if non-NULL.
> +       (cpp_display_width_computation::advance_display_cols): Pass NULL
> +       to process_next_codepoint.
> +       (cpp_byte_column_to_display_column): Pass in policy rather than
> +       tabstop.  Pass NULL to process_next_codepoint.
> +       (cpp_display_column_to_byte_column): Pass in policy rather than
> +       tabstop.
> +       * errors.c (cpp_diagnostic_get_current_location): New function,
> +       splitting out the logic from...
> +       (cpp_diagnostic): ...here.
> +       (cpp_warning_at): New function.
> +       (cpp_pedwarning_at): New function.
> +       * include/cpplib.h (cpp_warning_at): New decl for rich_location.
> +       (cpp_pedwarning_at): Likewise.
> +       (struct cpp_decoded_char): New.
> +       (struct cpp_char_column_policy): New.
> +       (cpp_display_width_computation::cpp_display_width_computation):
> +       Replace "tabstop" param with "policy".
> +       (cpp_display_width_computation::process_next_codepoint): Add "out=
"
> +       param.
> +       (cpp_display_width_computation::m_tabstop): Replace with...
> +       (cpp_display_width_computation::m_policy): ...this.
> +       (cpp_byte_column_to_display_column): Replace "tabstop" param with
> +       "policy".
> +       (cpp_display_width): Likewise.
> +       (cpp_display_column_to_byte_column): Likewise.
> +       * include/line-map.h (rich_location::escape_on_output_p): New.
> +       (rich_location::set_escape_on_output): New.
> +       (rich_location::m_escape_on_output): New.
> +       * internal.h (cpp_diagnostic_get_current_location): New decl.
> +       (class encoding_rich_location): New.
> +       * lex.c (skip_whitespace): Use encoding_rich_location when
> +       complaining about null characters.
> +       (warn_about_normalization): Generate a source range when
> +       complaining about improperly normalized tokens, rather than just =
a
> +       point, and use encoding_rich_location so that the source code
> +       is escaped on printing.
> +       * line-map.c (rich_location::rich_location): Initialize
> +       m_escape_on_output.
> +
> +Signed-off-by: David Malcolm <dmalcolm@redhat.com>
> +
> +CVE: CVE-2021-42574
> +Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=3Dgcc.gi=
t;h=3Dbd5e882cf6e0def3dd1bc106075d59a303fe0d1e]
> +Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> +
> +---
> + gcc/c-family/c-lex.c                          |   6 +-
> + gcc/common.opt                                |  13 +
> + gcc/diagnostic-format-json.cc                 |   3 +
> + gcc/diagnostic-show-locus.c                   | 580 +++++++++++++++---
> + gcc/diagnostic.c                              |  10 +-
> + gcc/diagnostic.h                              |  18 +
> + gcc/doc/invoke.texi                           |  43 +-
> + gcc/input.c                                   |  62 +-
> + gcc/input.h                                   |   7 +-
> + gcc/opts.c                                    |   4 +
> + gcc/selftest.c                                |  15 +
> + gcc/selftest.h                                |   2 +
> + .../c-c++-common/diagnostic-format-json-1.c   |   1 +
> + .../c-c++-common/diagnostic-format-json-2.c   |   1 +
> + .../c-c++-common/diagnostic-format-json-3.c   |   1 +
> + .../c-c++-common/diagnostic-format-json-4.c   |   2 +
> + .../c-c++-common/diagnostic-format-json-5.c   |   1 +
> + .../gcc.dg/cpp/warn-normalized-4-bytes.c      |  21 +
> + .../gcc.dg/cpp/warn-normalized-4-unicode.c    |  19 +
> + gcc/testsuite/gcc.dg/encoding-issues-bytes.c  | Bin 0 -> 595 bytes
> + .../gcc.dg/encoding-issues-unicode.c          | Bin 0 -> 613 bytes
> + .../gfortran.dg/diagnostic-format-json-1.F90  |   1 +
> + .../gfortran.dg/diagnostic-format-json-2.F90  |   1 +
> + .../gfortran.dg/diagnostic-format-json-3.F90  |   1 +
> + libcpp/charset.c                              |  63 +-
> + libcpp/errors.c                               |  82 ++-
> + libcpp/include/cpplib.h                       |  76 ++-
> + libcpp/include/line-map.h                     |  13 +
> + libcpp/internal.h                             |  23 +
> + libcpp/lex.c                                  |  38 +-
> + libcpp/line-map.c                             |   3 +-
> + 31 files changed, 942 insertions(+), 168 deletions(-)
> + create mode 100644 gcc/testsuite/gcc.dg/cpp/warn-normalized-4-bytes.c
> + create mode 100644 gcc/testsuite/gcc.dg/cpp/warn-normalized-4-unicode.c
> + create mode 100644 gcc/testsuite/gcc.dg/encoding-issues-bytes.c
> + create mode 100644 gcc/testsuite/gcc.dg/encoding-issues-unicode.c
> +
> +diff --git a/gcc/c-family/c-lex.c b/gcc/c-family/c-lex.c
> +--- a/gcc/c-family/c-lex.c     2021-07-27 23:55:06.980283060 -0700
> ++++ b/gcc/c-family/c-lex.c     2021-12-14 01:16:01.541943272 -0800
> +@@ -603,7 +603,11 @@ c_lex_with_flags (tree *value, location_
> +       else if (ISGRAPH (c))
> +         error_at (*loc, "stray %qc in program", (int) c);
> +       else
> +-        error_at (*loc, "stray %<\\%o%> in program", (int) c);
> ++        {
> ++          rich_location rich_loc (line_table, *loc);
> ++          rich_loc.set_escape_on_output (true);
> ++          error_at (&rich_loc, "stray %<\\%o%> in program", (int) c);
> ++        }
> +       }
> +       goto retry;
> +
> +diff --git a/gcc/common.opt b/gcc/common.opt
> +--- a/gcc/common.opt   2021-12-13 22:08:44.939137107 -0800
> ++++ b/gcc/common.opt   2021-12-14 01:16:01.541943272 -0800
> +@@ -1348,6 +1348,10 @@ fdiagnostics-format=3D
> + Common Joined RejectNegative Enum(diagnostics_output_format)
> + -fdiagnostics-format=3D[text|json]      Select output format.
> +
> ++fdiagnostics-escape-format=3D
> ++Common Joined RejectNegative Enum(diagnostics_escape_format)
> ++-fdiagnostics-escape-format=3D[unicode|bytes]   Select how to escape no=
n-printable-ASCII bytes in the source for diagnostics that suggest it.
> ++
> + ; Required for these enum values.
> + SourceInclude
> + diagnostic.h
> +@@ -1362,6 +1366,15 @@ EnumValue
> + Enum(diagnostics_column_unit) String(byte) Value(DIAGNOSTICS_COLUMN_UNI=
T_BYTE)
> +
> + Enum
> ++Name(diagnostics_escape_format) Type(int)
> ++
> ++EnumValue
> ++Enum(diagnostics_escape_format) String(unicode) Value(DIAGNOSTICS_ESCAP=
E_FORMAT_UNICODE)
> ++
> ++EnumValue
> ++Enum(diagnostics_escape_format) String(bytes) Value(DIAGNOSTICS_ESCAPE_=
FORMAT_BYTES)
> ++
> ++Enum
> + Name(diagnostics_output_format) Type(int)
> +
> + EnumValue
> +diff --git a/gcc/diagnostic.c b/gcc/diagnostic.c
> +--- a/gcc/diagnostic.c 2021-07-27 23:55:07.232286576 -0700
> ++++ b/gcc/diagnostic.c 2021-12-14 01:16:01.545943202 -0800
> +@@ -230,6 +230,7 @@ diagnostic_initialize (diagnostic_contex
> +   context->column_unit =3D DIAGNOSTICS_COLUMN_UNIT_DISPLAY;
> +   context->column_origin =3D 1;
> +   context->tabstop =3D 8;
> ++  context->escape_format =3D DIAGNOSTICS_ESCAPE_FORMAT_UNICODE;
> +   context->edit_context_ptr =3D NULL;
> +   context->diagnostic_group_nesting_depth =3D 0;
> +   context->diagnostic_group_emission_count =3D 0;
> +@@ -382,7 +383,10 @@ convert_column_unit (enum diagnostics_co
> +       gcc_unreachable ();
> +
> +     case DIAGNOSTICS_COLUMN_UNIT_DISPLAY:
> +-      return location_compute_display_column (s, tabstop);
> ++      {
> ++      cpp_char_column_policy policy (tabstop, cpp_wcwidth);
> ++      return location_compute_display_column (s, policy);
> ++      }
> +
> +     case DIAGNOSTICS_COLUMN_UNIT_BYTE:
> +       return s.column;
> +@@ -2275,8 +2279,8 @@ test_diagnostic_get_location_text ()
> +     const char *const content =3D "smile \xf0\x9f\x98\x82\n";
> +     const int line_bytes =3D strlen (content) - 1;
> +     const int def_tabstop =3D 8;
> +-    const int display_width =3D cpp_display_width (content, line_bytes,
> +-                                               def_tabstop);
> ++    const cpp_char_column_policy policy (def_tabstop, cpp_wcwidth);
> ++    const int display_width =3D cpp_display_width (content, line_bytes,=
 policy);
> +     ASSERT_EQ (line_bytes - 2, display_width);
> +     temp_source_file tmp (SELFTEST_LOCATION, ".c", content);
> +     const char *const fname =3D tmp.get_filename ();
> +diff --git a/gcc/diagnostic-format-json.cc b/gcc/diagnostic-format-json.=
cc
> +--- a/gcc/diagnostic-format-json.cc    2021-07-27 23:55:07.232286576 -07=
00
> ++++ b/gcc/diagnostic-format-json.cc    2021-12-14 01:16:01.541943272 -08=
00
> +@@ -264,6 +264,9 @@ json_end_diagnostic (diagnostic_context
> +       json::value *path_value =3D context->make_json_for_path (context,=
 path);
> +       diag_obj->set ("path", path_value);
> +     }
> ++
> ++  diag_obj->set ("escape-source",
> ++               new json::literal (richloc->escape_on_output_p ()));
> + }
> +
> + /* No-op implementation of "begin_group_cb" for JSON output.  */
> +diff --git a/gcc/diagnostic.h b/gcc/diagnostic.h
> +--- a/gcc/diagnostic.h 2021-07-27 23:55:07.236286632 -0700
> ++++ b/gcc/diagnostic.h 2021-12-14 01:16:01.545943202 -0800
> +@@ -38,6 +38,20 @@ enum diagnostics_column_unit
> +   DIAGNOSTICS_COLUMN_UNIT_BYTE
> + };
> +
> ++/* An enum for controlling how to print non-ASCII characters/bytes when
> ++   a diagnostic suggests escaping the source code on output.  */
> ++
> ++enum diagnostics_escape_format
> ++{
> ++  /* Escape non-ASCII Unicode characters in the form <U+XXXX> and
> ++     non-UTF-8 bytes in the form <XX>.  */
> ++  DIAGNOSTICS_ESCAPE_FORMAT_UNICODE,
> ++
> ++  /* Escape non-ASCII bytes in the form <XX> (thus showing the underlyi=
ng
> ++     encoding of non-ASCII Unicode characters).  */
> ++  DIAGNOSTICS_ESCAPE_FORMAT_BYTES
> ++};
> ++
> + /* Enum for overriding the standard output format.  */
> +
> + enum diagnostics_output_format
> +@@ -320,6 +334,10 @@ struct diagnostic_context
> +   /* The size of the tabstop for tab expansion.  */
> +   int tabstop;
> +
> ++  /* How should non-ASCII/non-printable bytes be escaped when
> ++     a diagnostic suggests escaping the source code on output.  */
> ++  enum diagnostics_escape_format escape_format;
> ++
> +   /* If non-NULL, an edit_context to which fix-it hints should be
> +      applied, for generating patches.  */
> +   edit_context *edit_context_ptr;
> +diff --git a/gcc/diagnostic-show-locus.c b/gcc/diagnostic-show-locus.c
> +--- a/gcc/diagnostic-show-locus.c      2021-07-27 23:55:07.232286576 -07=
00
> ++++ b/gcc/diagnostic-show-locus.c      2021-12-14 01:16:01.545943202 -08=
00
> +@@ -175,10 +175,26 @@ enum column_unit {
> + class exploc_with_display_col : public expanded_location
> + {
> +  public:
> +-  exploc_with_display_col (const expanded_location &exploc, int tabstop=
)
> +-    : expanded_location (exploc),
> +-      m_display_col (location_compute_display_column (exploc, tabstop))
> +-  {}
> ++  exploc_with_display_col (const expanded_location &exploc,
> ++                         const cpp_char_column_policy &policy,
> ++                         enum location_aspect aspect)
> ++  : expanded_location (exploc),
> ++    m_display_col (location_compute_display_column (exploc, policy))
> ++  {
> ++    if (exploc.column > 0)
> ++      {
> ++      /* m_display_col is now the final column of the byte.
> ++         If escaping has happened, we may want the first column instead=
.  */
> ++      if (aspect !=3D LOCATION_ASPECT_FINISH)
> ++        {
> ++          expanded_location prev_exploc (exploc);
> ++          prev_exploc.column--;
> ++          int prev_display_col
> ++            =3D (location_compute_display_column (prev_exploc, policy))=
;
> ++          m_display_col =3D prev_display_col + 1;
> ++        }
> ++      }
> ++  }
> +
> +   int m_display_col;
> + };
> +@@ -313,6 +329,31 @@ test_line_span ()
> +
> + #endif /* #if CHECKING_P */
> +
> ++/* A bundle of information containing how to print unicode
> ++   characters and bytes when quoting source code.
> ++
> ++   Provides a unified place to support escaping some subset
> ++   of characters to some format.
> ++
> ++   Extends char_column_policy; printing is split out to avoid
> ++   libcpp having to know about pretty_printer.  */
> ++
> ++struct char_display_policy : public cpp_char_column_policy
> ++{
> ++ public:
> ++  char_display_policy (int tabstop,
> ++                     int (*width_cb) (cppchar_t c),
> ++                     void (*print_cb) (pretty_printer *pp,
> ++                                       const cpp_decoded_char &cp))
> ++  : cpp_char_column_policy (tabstop, width_cb),
> ++    m_print_cb (print_cb)
> ++  {
> ++  }
> ++
> ++  void (*m_print_cb) (pretty_printer *pp,
> ++                    const cpp_decoded_char &cp);
> ++};
> ++
> + /* A class to control the overall layout when printing a diagnostic.
> +
> +    The layout is determined within the constructor.
> +@@ -345,6 +386,8 @@ class layout
> +
> +   void print_line (linenum_type row);
> +
> ++  void on_bad_codepoint (const char *ptr, cppchar_t ch, size_t ch_sz);
> ++
> +  private:
> +   bool will_show_line_p (linenum_type row) const;
> +   void print_leading_fixits (linenum_type row);
> +@@ -386,6 +429,7 @@ class layout
> +  private:
> +   diagnostic_context *m_context;
> +   pretty_printer *m_pp;
> ++  char_display_policy m_policy;
> +   location_t m_primary_loc;
> +   exploc_with_display_col m_exploc;
> +   colorizer m_colorizer;
> +@@ -398,6 +442,7 @@ class layout
> +   auto_vec <line_span> m_line_spans;
> +   int m_linenum_width;
> +   int m_x_offset_display;
> ++  bool m_escape_on_output;
> + };
> +
> + /* Implementation of "class colorizer".  */
> +@@ -646,6 +691,11 @@ layout_range::intersects_line_p (linenum
> + /* Default for when we don't care what the tab expansion is set to.  */
> + static const int def_tabstop =3D 8;
> +
> ++static cpp_char_column_policy def_policy ()
> ++{
> ++  return cpp_char_column_policy (8, cpp_wcwidth);
> ++}
> ++
> + /* Create some expanded locations for testing layout_range.  The filena=
me
> +    member of the explocs is set to the empty string.  This member will =
only be
> +    inspected by the calls to location_compute_display_column() made fro=
m the
> +@@ -662,10 +712,13 @@ make_range (int start_line, int start_co
> +     =3D {"", start_line, start_col, NULL, false};
> +   const expanded_location finish_exploc
> +     =3D {"", end_line, end_col, NULL, false};
> +-  return layout_range (exploc_with_display_col (start_exploc, def_tabst=
op),
> +-                     exploc_with_display_col (finish_exploc, def_tabsto=
p),
> ++  return layout_range (exploc_with_display_col (start_exploc, def_polic=
y (),
> ++                                              LOCATION_ASPECT_START),
> ++                     exploc_with_display_col (finish_exploc, def_policy=
 (),
> ++                                              LOCATION_ASPECT_FINISH),
> +                      SHOW_RANGE_WITHOUT_CARET,
> +-                     exploc_with_display_col (start_exploc, def_tabstop=
),
> ++                     exploc_with_display_col (start_exploc, def_policy =
(),
> ++                                              LOCATION_ASPECT_CARET),
> +                      0, NULL);
> + }
> +
> +@@ -959,6 +1012,164 @@ fixit_cmp (const void *p_a, const void *
> +   return hint_a->get_start_loc () - hint_b->get_start_loc ();
> + }
> +
> ++/* Callbacks for use when not escaping the source.  */
> ++
> ++/* The default callback for char_column_policy::m_width_cb is cpp_wcwid=
th.  */
> ++
> ++/* Callback for char_display_policy::m_print_cb for printing source cha=
rs
> ++   when not escaping the source.  */
> ++
> ++static void
> ++default_print_decoded_ch (pretty_printer *pp,
> ++                        const cpp_decoded_char &decoded_ch)
> ++{
> ++  for (const char *ptr =3D decoded_ch.m_start_byte;
> ++       ptr !=3D decoded_ch.m_next_byte; ptr++)
> ++    {
> ++      if (*ptr =3D=3D '\0' || *ptr =3D=3D '\r')
> ++      {
> ++        pp_space (pp);
> ++        continue;
> ++      }
> ++
> ++      pp_character (pp, *ptr);
> ++    }
> ++}
> ++
> ++/* Callbacks for use with DIAGNOSTICS_ESCAPE_FORMAT_BYTES.  */
> ++
> ++static const int width_per_escaped_byte =3D 4;
> ++
> ++/* Callback for char_column_policy::m_width_cb for determining the
> ++   display width when escaping with DIAGNOSTICS_ESCAPE_FORMAT_BYTES.  *=
/
> ++
> ++static int
> ++escape_as_bytes_width (cppchar_t ch)
> ++{
> ++  if (ch < 0x80 && ISPRINT (ch))
> ++    return cpp_wcwidth (ch);
> ++  else
> ++    {
> ++      if (ch <=3D   0x7F) return 1 * width_per_escaped_byte;
> ++      if (ch <=3D  0x7FF) return 2 * width_per_escaped_byte;
> ++      if (ch <=3D 0xFFFF) return 3 * width_per_escaped_byte;
> ++      return 4 * width_per_escaped_byte;
> ++    }
> ++}
> ++
> ++/* Callback for char_display_policy::m_print_cb for printing source cha=
rs
> ++   when escaping with DIAGNOSTICS_ESCAPE_FORMAT_BYTES.  */
> ++
> ++static void
> ++escape_as_bytes_print (pretty_printer *pp,
> ++                     const cpp_decoded_char &decoded_ch)
> ++{
> ++  if (!decoded_ch.m_valid_ch)
> ++    {
> ++      for (const char *iter =3D decoded_ch.m_start_byte;
> ++         iter !=3D decoded_ch.m_next_byte; ++iter)
> ++      {
> ++        char buf[16];
> ++        sprintf (buf, "<%02x>", (unsigned char)*iter);
> ++        pp_string (pp, buf);
> ++      }
> ++      return;
> ++    }
> ++
> ++  cppchar_t ch =3D decoded_ch.m_ch;
> ++  if (ch < 0x80 && ISPRINT (ch))
> ++    pp_character (pp, ch);
> ++  else
> ++    {
> ++      for (const char *iter =3D decoded_ch.m_start_byte;
> ++         iter < decoded_ch.m_next_byte; ++iter)
> ++      {
> ++        char buf[16];
> ++        sprintf (buf, "<%02x>", (unsigned char)*iter);
> ++        pp_string (pp, buf);
> ++      }
> ++    }
> ++}
> ++
> ++/* Callbacks for use with DIAGNOSTICS_ESCAPE_FORMAT_UNICODE.  */
> ++
> ++/* Callback for char_column_policy::m_width_cb for determining the
> ++   display width when escaping with DIAGNOSTICS_ESCAPE_FORMAT_UNICODE. =
 */
> ++
> ++static int
> ++escape_as_unicode_width (cppchar_t ch)
> ++{
> ++  if (ch < 0x80 && ISPRINT (ch))
> ++    return cpp_wcwidth (ch);
> ++  else
> ++    {
> ++      // Width of "<U+%04x>"
> ++      if (ch > 0xfffff)
> ++      return 10;
> ++      else if (ch > 0xffff)
> ++      return 9;
> ++      else
> ++      return 8;
> ++    }
> ++}
> ++
> ++/* Callback for char_display_policy::m_print_cb for printing source cha=
rs
> ++   when escaping with DIAGNOSTICS_ESCAPE_FORMAT_UNICODE.  */
> ++
> ++static void
> ++escape_as_unicode_print (pretty_printer *pp,
> ++                       const cpp_decoded_char &decoded_ch)
> ++{
> ++  if (!decoded_ch.m_valid_ch)
> ++    {
> ++      escape_as_bytes_print (pp, decoded_ch);
> ++      return;
> ++    }
> ++
> ++  cppchar_t ch =3D decoded_ch.m_ch;
> ++  if (ch < 0x80 && ISPRINT (ch))
> ++    pp_character (pp, ch);
> ++  else
> ++    {
> ++      char buf[16];
> ++      sprintf (buf, "<U+%04X>", ch);
> ++      pp_string (pp, buf);
> ++    }
> ++}
> ++
> ++/* Populate a char_display_policy based on DC and RICHLOC.  */
> ++
> ++static char_display_policy
> ++make_policy (const diagnostic_context &dc,
> ++           const rich_location &richloc)
> ++{
> ++  /* The default is to not escape non-ASCII bytes.  */
> ++  char_display_policy result
> ++    (dc.tabstop, cpp_wcwidth, default_print_decoded_ch);
> ++
> ++  /* If the diagnostic suggests escaping non-ASCII bytes, then
> ++     use policy from user-supplied options.  */
> ++  if (richloc.escape_on_output_p ())
> ++    {
> ++      result.m_undecoded_byte_width =3D width_per_escaped_byte;
> ++      switch (dc.escape_format)
> ++      {
> ++      default:
> ++        gcc_unreachable ();
> ++      case DIAGNOSTICS_ESCAPE_FORMAT_UNICODE:
> ++        result.m_width_cb =3D escape_as_unicode_width;
> ++        result.m_print_cb =3D escape_as_unicode_print;
> ++        break;
> ++      case DIAGNOSTICS_ESCAPE_FORMAT_BYTES:
> ++        result.m_width_cb =3D escape_as_bytes_width;
> ++        result.m_print_cb =3D escape_as_bytes_print;
> ++        break;
> ++      }
> ++    }
> ++
> ++  return result;
> ++}
> ++
> + /* Implementation of class layout.  */
> +
> + /* Constructor for class layout.
> +@@ -975,8 +1186,10 @@ layout::layout (diagnostic_context * con
> +               diagnostic_t diagnostic_kind)
> + : m_context (context),
> +   m_pp (context->printer),
> ++  m_policy (make_policy (*context, *richloc)),
> +   m_primary_loc (richloc->get_range (0)->m_loc),
> +-  m_exploc (richloc->get_expanded_location (0), context->tabstop),
> ++  m_exploc (richloc->get_expanded_location (0), m_policy,
> ++          LOCATION_ASPECT_CARET),
> +   m_colorizer (context, diagnostic_kind),
> +   m_colorize_source_p (context->colorize_source_p),
> +   m_show_labels_p (context->show_labels_p),
> +@@ -986,7 +1199,8 @@ layout::layout (diagnostic_context * con
> +   m_fixit_hints (richloc->get_num_fixit_hints ()),
> +   m_line_spans (1 + richloc->get_num_locations ()),
> +   m_linenum_width (0),
> +-  m_x_offset_display (0)
> ++  m_x_offset_display (0),
> ++  m_escape_on_output (richloc->escape_on_output_p ())
> + {
> +   for (unsigned int idx =3D 0; idx < richloc->get_num_locations (); idx=
++)
> +     {
> +@@ -1072,10 +1286,13 @@ layout::maybe_add_location_range (const
> +
> +   /* Everything is now known to be in the correct source file,
> +      but it may require further sanitization.  */
> +-  layout_range ri (exploc_with_display_col (start, m_context->tabstop),
> +-                 exploc_with_display_col (finish, m_context->tabstop),
> ++  layout_range ri (exploc_with_display_col (start, m_policy,
> ++                                          LOCATION_ASPECT_START),
> ++                 exploc_with_display_col (finish, m_policy,
> ++                                          LOCATION_ASPECT_FINISH),
> +                  loc_range->m_range_display_kind,
> +-                 exploc_with_display_col (caret, m_context->tabstop),
> ++                 exploc_with_display_col (caret, m_policy,
> ++                                          LOCATION_ASPECT_CARET),
> +                  original_idx, loc_range->m_label);
> +
> +   /* If we have a range that finishes before it starts (perhaps
> +@@ -1409,7 +1626,7 @@ layout::calculate_x_offset_display ()
> +     =3D get_line_bytes_without_trailing_whitespace (line.get_buffer (),
> +                                                 line.length ());
> +   int eol_display_column
> +-    =3D cpp_display_width (line.get_buffer (), line_bytes, m_context->t=
abstop);
> ++    =3D cpp_display_width (line.get_buffer (), line_bytes, m_policy);
> +   if (caret_display_column > eol_display_column
> +       || !caret_display_column)
> +     {
> +@@ -1488,7 +1705,7 @@ layout::print_source_line (linenum_type
> +   /* This object helps to keep track of which display column we are at,=
 which is
> +      necessary for computing the line bounds in display units, for doin=
g
> +      tab expansion, and for implementing m_x_offset_display.  */
> +-  cpp_display_width_computation dw (line, line_bytes, m_context->tabsto=
p);
> ++  cpp_display_width_computation dw (line, line_bytes, m_policy);
> +
> +   /* Skip the first m_x_offset_display display columns.  In case the le=
ading
> +      portion that will be skipped ends with a character with wcwidth > =
1, then
> +@@ -1536,7 +1753,8 @@ layout::print_source_line (linenum_type
> +        tabs and replacing some control bytes with spaces as necessary. =
 */
> +       const char *c =3D dw.next_byte ();
> +       const int start_disp_col =3D dw.display_cols_processed () + 1;
> +-      const int this_display_width =3D dw.process_next_codepoint ();
> ++      cpp_decoded_char cp;
> ++      const int this_display_width =3D dw.process_next_codepoint (&cp);
> +       if (*c =3D=3D '\t')
> +       {
> +         /* The returned display width is the number of spaces into whic=
h the
> +@@ -1545,15 +1763,6 @@ layout::print_source_line (linenum_type
> +           pp_space (m_pp);
> +         continue;
> +       }
> +-      if (*c =3D=3D '\0' || *c =3D=3D '\r')
> +-      {
> +-        /* cpp_wcwidth() promises to return 1 for all control bytes, an=
d we
> +-           want to output these as a single space too, so this case is
> +-           actually the same as the '\t' case.  */
> +-        gcc_assert (this_display_width =3D=3D 1);
> +-        pp_space (m_pp);
> +-        continue;
> +-      }
> +
> +       /* We have a (possibly multibyte) character to output; update the=
 line
> +        bounds if it is not whitespace.  */
> +@@ -1565,7 +1774,8 @@ layout::print_source_line (linenum_type
> +       }
> +
> +       /* Output the character.  */
> +-      while (c !=3D dw.next_byte ()) pp_character (m_pp, *c++);
> ++      m_policy.m_print_cb (m_pp, cp);
> ++      c =3D dw.next_byte ();
> +     }
> +   print_newline ();
> +   return lbounds;
> +@@ -1664,14 +1874,14 @@ layout::print_annotation_line (linenum_t
> + class line_label
> + {
> + public:
> +-  line_label (diagnostic_context *context, int state_idx, int column,
> ++  line_label (const cpp_char_column_policy &policy,
> ++            int state_idx, int column,
> +             label_text text)
> +   : m_state_idx (state_idx), m_column (column),
> +     m_text (text), m_label_line (0), m_has_vbar (true)
> +   {
> +     const int bytes =3D strlen (text.m_buffer);
> +-    m_display_width
> +-      =3D cpp_display_width (text.m_buffer, bytes, context->tabstop);
> ++    m_display_width =3D cpp_display_width (text.m_buffer, bytes, policy=
);
> +   }
> +
> +   /* Sorting is primarily by column, then by state index.  */
> +@@ -1731,7 +1941,7 @@ layout::print_any_labels (linenum_type r
> +       if (text.m_buffer =3D=3D NULL)
> +         continue;
> +
> +-      labels.safe_push (line_label (m_context, i, disp_col, text));
> ++      labels.safe_push (line_label (m_policy, i, disp_col, text));
> +       }
> +   }
> +
> +@@ -2011,7 +2221,7 @@ public:
> +
> + /* Get the range of bytes or display columns that HINT would affect.  *=
/
> + static column_range
> +-get_affected_range (diagnostic_context *context,
> ++get_affected_range (const cpp_char_column_policy &policy,
> +                   const fixit_hint *hint, enum column_unit col_unit)
> + {
> +   expanded_location exploc_start =3D expand_location (hint->get_start_l=
oc ());
> +@@ -2022,13 +2232,11 @@ get_affected_range (diagnostic_context *
> +   int finish_column;
> +   if (col_unit =3D=3D CU_DISPLAY_COLS)
> +     {
> +-      start_column
> +-      =3D location_compute_display_column (exploc_start, context->tabst=
op);
> ++      start_column =3D location_compute_display_column (exploc_start, p=
olicy);
> +       if (hint->insertion_p ())
> +       finish_column =3D start_column - 1;
> +       else
> +-      finish_column
> +-        =3D location_compute_display_column (exploc_finish, context->ta=
bstop);
> ++      finish_column =3D location_compute_display_column (exploc_finish,=
 policy);
> +     }
> +   else
> +     {
> +@@ -2041,12 +2249,13 @@ get_affected_range (diagnostic_context *
> + /* Get the range of display columns that would be printed for HINT.  */
> +
> + static column_range
> +-get_printed_columns (diagnostic_context *context, const fixit_hint *hin=
t)
> ++get_printed_columns (const cpp_char_column_policy &policy,
> ++                   const fixit_hint *hint)
> + {
> +   expanded_location exploc =3D expand_location (hint->get_start_loc ())=
;
> +-  int start_column =3D location_compute_display_column (exploc, context=
->tabstop);
> ++  int start_column =3D location_compute_display_column (exploc, policy)=
;
> +   int hint_width =3D cpp_display_width (hint->get_string (), hint->get_=
length (),
> +-                                    context->tabstop);
> ++                                    policy);
> +   int final_hint_column =3D start_column + hint_width - 1;
> +   if (hint->insertion_p ())
> +     {
> +@@ -2056,8 +2265,7 @@ get_printed_columns (diagnostic_context
> +     {
> +       exploc =3D expand_location (hint->get_next_loc ());
> +       --exploc.column;
> +-      int finish_column
> +-      =3D location_compute_display_column (exploc, context->tabstop);
> ++      int finish_column =3D location_compute_display_column (exploc, po=
licy);
> +       return column_range (start_column,
> +                          MAX (finish_column, final_hint_column));
> +     }
> +@@ -2075,13 +2283,13 @@ public:
> +             column_range affected_columns,
> +             column_range printed_columns,
> +             const char *new_text, size_t new_text_len,
> +-            int tabstop)
> ++            const cpp_char_column_policy &policy)
> +   : m_affected_bytes (affected_bytes),
> +     m_affected_columns (affected_columns),
> +     m_printed_columns (printed_columns),
> +     m_text (xstrdup (new_text)),
> +     m_byte_length (new_text_len),
> +-    m_tabstop (tabstop),
> ++    m_policy (policy),
> +     m_alloc_sz (new_text_len + 1)
> +   {
> +     compute_display_cols ();
> +@@ -2099,7 +2307,7 @@ public:
> +
> +   void compute_display_cols ()
> +   {
> +-    m_display_cols =3D cpp_display_width (m_text, m_byte_length, m_tabs=
top);
> ++    m_display_cols =3D cpp_display_width (m_text, m_byte_length, m_poli=
cy);
> +   }
> +
> +   void overwrite (int dst_offset, const char_span &src_span)
> +@@ -2127,7 +2335,7 @@ public:
> +   char *m_text;
> +   size_t m_byte_length; /* Not including null-terminator.  */
> +   int m_display_cols;
> +-  int m_tabstop;
> ++  const cpp_char_column_policy &m_policy;
> +   size_t m_alloc_sz;
> + };
> +
> +@@ -2163,15 +2371,16 @@ correction::ensure_terminated ()
> + class line_corrections
> + {
> + public:
> +-  line_corrections (diagnostic_context *context, const char *filename,
> ++  line_corrections (const char_display_policy &policy,
> ++                  const char *filename,
> +                   linenum_type row)
> +-    : m_context (context), m_filename (filename), m_row (row)
> ++  : m_policy (policy), m_filename (filename), m_row (row)
> +   {}
> +   ~line_corrections ();
> +
> +   void add_hint (const fixit_hint *hint);
> +
> +-  diagnostic_context *m_context;
> ++  const char_display_policy &m_policy;
> +   const char *m_filename;
> +   linenum_type m_row;
> +   auto_vec <correction *> m_corrections;
> +@@ -2217,10 +2426,10 @@ source_line::source_line (const char *fi
> + void
> + line_corrections::add_hint (const fixit_hint *hint)
> + {
> +-  column_range affected_bytes =3D get_affected_range (m_context, hint, =
CU_BYTES);
> +-  column_range affected_columns =3D get_affected_range (m_context, hint=
,
> ++  column_range affected_bytes =3D get_affected_range (m_policy, hint, C=
U_BYTES);
> ++  column_range affected_columns =3D get_affected_range (m_policy, hint,
> +                                                     CU_DISPLAY_COLS);
> +-  column_range printed_columns =3D get_printed_columns (m_context, hint=
);
> ++  column_range printed_columns =3D get_printed_columns (m_policy, hint)=
;
> +
> +   /* Potentially consolidate.  */
> +   if (!m_corrections.is_empty ())
> +@@ -2289,7 +2498,7 @@ line_corrections::add_hint (const fixit_
> +                                          printed_columns,
> +                                          hint->get_string (),
> +                                          hint->get_length (),
> +-                                         m_context->tabstop));
> ++                                         m_policy));
> + }
> +
> + /* If there are any fixit hints on source line ROW, print them.
> +@@ -2303,7 +2512,7 @@ layout::print_trailing_fixits (linenum_t
> + {
> +   /* Build a list of correction instances for the line,
> +      potentially consolidating hints (for the sake of readability).  */
> +-  line_corrections corrections (m_context, m_exploc.file, row);
> ++  line_corrections corrections (m_policy, m_exploc.file, row);
> +   for (unsigned int i =3D 0; i < m_fixit_hints.length (); i++)
> +     {
> +       const fixit_hint *hint =3D m_fixit_hints[i];
> +@@ -2646,6 +2855,59 @@ namespace selftest {
> +
> + /* Selftests for diagnostic_show_locus.  */
> +
> ++/* Verify that cpp_display_width correctly handles escaping.  */
> ++
> ++static void
> ++test_display_widths ()
> ++{
> ++  gcc_rich_location richloc (UNKNOWN_LOCATION);
> ++
> ++  /* U+03C0 "GREEK SMALL LETTER PI".  */
> ++  const char *pi =3D "\xCF\x80";
> ++  /* U+1F642 "SLIGHTLY SMILING FACE".  */
> ++  const char *emoji =3D "\xF0\x9F\x99\x82";
> ++  /* Stray trailing byte of a UTF-8 character.  */
> ++  const char *stray =3D "\xBF";
> ++  /* U+10FFFF.  */
> ++  const char *max_codepoint =3D "\xF4\x8F\xBF\xBF";
> ++
> ++  /* No escaping.  */
> ++  {
> ++    test_diagnostic_context dc;
> ++    char_display_policy policy (make_policy (dc, richloc));
> ++    ASSERT_EQ (cpp_display_width (pi, strlen (pi), policy), 1);
> ++    ASSERT_EQ (cpp_display_width (emoji, strlen (emoji), policy), 2);
> ++    ASSERT_EQ (cpp_display_width (stray, strlen (stray), policy), 1);
> ++    /* Don't check width of U+10FFFF; it's in a private use plane.  */
> ++  }
> ++
> ++  richloc.set_escape_on_output (true);
> ++
> ++  {
> ++    test_diagnostic_context dc;
> ++    dc.escape_format =3D DIAGNOSTICS_ESCAPE_FORMAT_UNICODE;
> ++    char_display_policy policy (make_policy (dc, richloc));
> ++    ASSERT_EQ (cpp_display_width (pi, strlen (pi), policy), 8);
> ++    ASSERT_EQ (cpp_display_width (emoji, strlen (emoji), policy), 9);
> ++    ASSERT_EQ (cpp_display_width (stray, strlen (stray), policy), 4);
> ++    ASSERT_EQ (cpp_display_width (max_codepoint, strlen (max_codepoint)=
,
> ++                                policy),
> ++             strlen ("<U+10FFFF>"));
> ++  }
> ++
> ++  {
> ++    test_diagnostic_context dc;
> ++    dc.escape_format =3D DIAGNOSTICS_ESCAPE_FORMAT_BYTES;
> ++    char_display_policy policy (make_policy (dc, richloc));
> ++    ASSERT_EQ (cpp_display_width (pi, strlen (pi), policy), 8);
> ++    ASSERT_EQ (cpp_display_width (emoji, strlen (emoji), policy), 16);
> ++    ASSERT_EQ (cpp_display_width (stray, strlen (stray), policy), 4);
> ++    ASSERT_EQ (cpp_display_width (max_codepoint, strlen (max_codepoint)=
,
> ++                                policy),
> ++             16);
> ++  }
> ++}
> ++
> + /* For precise tests of the layout, make clear where the source line wi=
ll
> +    start.  test_left_margin sets the total byte count from the left sid=
e of the
> +    screen to the start of source lines, after the line number and the s=
eparator,
> +@@ -2715,10 +2977,10 @@ test_layout_x_offset_display_utf8 (const
> +   char_span lspan =3D location_get_source_line (tmp.get_filename (), 1)=
;
> +   ASSERT_EQ (line_display_cols,
> +            cpp_display_width (lspan.get_buffer (), lspan.length (),
> +-                              def_tabstop));
> ++                              def_policy ()));
> +   ASSERT_EQ (line_display_cols,
> +            location_compute_display_column (expand_location (line_end),
> +-                                            def_tabstop));
> ++                                            def_policy ()));
> +   ASSERT_EQ (0, memcmp (lspan.get_buffer () + (emoji_col - 1),
> +                       "\xf0\x9f\x98\x82\xf0\x9f\x98\x82", 8));
> +
> +@@ -2866,12 +3128,13 @@ test_layout_x_offset_display_tab (const
> +   ASSERT_EQ ('\t', *(lspan.get_buffer () + (tab_col - 1)));
> +   for (int tabstop =3D 1; tabstop !=3D num_tabstops; ++tabstop)
> +     {
> ++      cpp_char_column_policy policy (tabstop, cpp_wcwidth);
> +       ASSERT_EQ (line_bytes + extra_width[tabstop],
> +                cpp_display_width (lspan.get_buffer (), lspan.length (),
> +-                                  tabstop));
> ++                                  policy));
> +       ASSERT_EQ (line_bytes + extra_width[tabstop],
> +                location_compute_display_column (expand_location (line_e=
nd),
> +-                                                tabstop));
> ++                                                policy));
> +     }
> +
> +   /* Check that the tab is expanded to the expected number of spaces.  =
*/
> +@@ -4003,6 +4266,43 @@ test_one_liner_labels_utf8 ()
> +                          " bb\xf0\x9f\x98\x82\xf0\x9f\x98\x82\n",
> +                 pp_formatted_text (dc.printer));
> +   }
> ++
> ++  /* Example of escaping the source lines.  */
> ++  {
> ++    text_range_label label0 ("label 0\xf0\x9f\x98\x82");
> ++    text_range_label label1 ("label 1\xcf\x80");
> ++    text_range_label label2 ("label 2\xcf\x80");
> ++    gcc_rich_location richloc (foo, &label0);
> ++    richloc.add_range (bar, SHOW_RANGE_WITHOUT_CARET, &label1);
> ++    richloc.add_range (field, SHOW_RANGE_WITHOUT_CARET, &label2);
> ++    richloc.set_escape_on_output (true);
> ++
> ++    {
> ++      test_diagnostic_context dc;
> ++      dc.escape_format =3D DIAGNOSTICS_ESCAPE_FORMAT_UNICODE;
> ++      diagnostic_show_locus (&dc, &richloc, DK_ERROR);
> ++      ASSERT_STREQ (" <U+1F602>_foo =3D <U+03C0>_bar.<U+1F602>_field<U+=
03C0>;\n"
> ++                  " ^~~~~~~~~~~~~   ~~~~~~~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~=
~\n"
> ++                  " |               |            |\n"
> ++                  " |               |            label 2\xcf\x80\n"
> ++                  " |               label 1\xcf\x80\n"
> ++                  " label 0\xf0\x9f\x98\x82\n",
> ++                  pp_formatted_text (dc.printer));
> ++    }
> ++    {
> ++      test_diagnostic_context dc;
> ++      dc.escape_format =3D DIAGNOSTICS_ESCAPE_FORMAT_BYTES;
> ++      diagnostic_show_locus (&dc, &richloc, DK_ERROR);
> ++      ASSERT_STREQ
> ++      (" <f0><9f><98><82>_foo =3D <cf><80>_bar.<f0><9f><98><82>_field<c=
f><80>;\n"
> ++       " ^~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~\n"
> ++       " |                      |            |\n"
> ++       " |                      |            label 2\xcf\x80\n"
> ++       " |                      label 1\xcf\x80\n"
> ++       " label 0\xf0\x9f\x98\x82\n",
> ++       pp_formatted_text (dc.printer));
> ++    }
> ++  }
> + }
> +
> + /* Make sure that colorization codes don't interrupt a multibyte
> +@@ -4057,9 +4357,9 @@ test_diagnostic_show_locus_one_liner_utf
> +
> +   char_span lspan =3D location_get_source_line (tmp.get_filename (), 1)=
;
> +   ASSERT_EQ (25, cpp_display_width (lspan.get_buffer (), lspan.length (=
),
> +-                                  def_tabstop));
> ++                                  def_policy ()));
> +   ASSERT_EQ (25, location_compute_display_column (expand_location (line=
_end),
> +-                                                def_tabstop));
> ++                                                def_policy ()));
> +
> +   test_one_liner_simple_caret_utf8 ();
> +   test_one_liner_caret_and_range_utf8 ();
> +@@ -4445,30 +4745,31 @@ test_overlapped_fixit_printing (const li
> +                 pp_formatted_text (dc.printer));
> +
> +     /* Unit-test the line_corrections machinery.  */
> ++    char_display_policy policy (make_policy (dc, richloc));
> +     ASSERT_EQ (3, richloc.get_num_fixit_hints ());
> +     const fixit_hint *hint_0 =3D richloc.get_fixit_hint (0);
> +     ASSERT_EQ (column_range (12, 12),
> +-             get_affected_range (&dc, hint_0, CU_BYTES));
> ++             get_affected_range (policy, hint_0, CU_BYTES));
> +     ASSERT_EQ (column_range (12, 12),
> +-             get_affected_range (&dc, hint_0, CU_DISPLAY_COLS));
> +-    ASSERT_EQ (column_range (12, 22), get_printed_columns (&dc, hint_0)=
);
> ++             get_affected_range (policy, hint_0, CU_DISPLAY_COLS));
> ++    ASSERT_EQ (column_range (12, 22), get_printed_columns (policy, hint=
_0));
> +     const fixit_hint *hint_1 =3D richloc.get_fixit_hint (1);
> +     ASSERT_EQ (column_range (18, 18),
> +-             get_affected_range (&dc, hint_1, CU_BYTES));
> ++             get_affected_range (policy, hint_1, CU_BYTES));
> +     ASSERT_EQ (column_range (18, 18),
> +-             get_affected_range (&dc, hint_1, CU_DISPLAY_COLS));
> +-    ASSERT_EQ (column_range (18, 20), get_printed_columns (&dc, hint_1)=
);
> ++             get_affected_range (policy, hint_1, CU_DISPLAY_COLS));
> ++    ASSERT_EQ (column_range (18, 20), get_printed_columns (policy, hint=
_1));
> +     const fixit_hint *hint_2 =3D richloc.get_fixit_hint (2);
> +     ASSERT_EQ (column_range (29, 28),
> +-             get_affected_range (&dc, hint_2, CU_BYTES));
> ++             get_affected_range (policy, hint_2, CU_BYTES));
> +     ASSERT_EQ (column_range (29, 28),
> +-             get_affected_range (&dc, hint_2, CU_DISPLAY_COLS));
> +-    ASSERT_EQ (column_range (29, 29), get_printed_columns (&dc, hint_2)=
);
> ++             get_affected_range (policy, hint_2, CU_DISPLAY_COLS));
> ++    ASSERT_EQ (column_range (29, 29), get_printed_columns (policy, hint=
_2));
> +
> +     /* Add each hint in turn to a line_corrections instance,
> +        and verify that they are consolidated into one correction instan=
ce
> +        as expected.  */
> +-    line_corrections lc (&dc, tmp.get_filename (), 1);
> ++    line_corrections lc (policy, tmp.get_filename (), 1);
> +
> +     /* The first replace hint by itself.  */
> +     lc.add_hint (hint_0);
> +@@ -4660,30 +4961,31 @@ test_overlapped_fixit_printing_utf8 (con
> +                 pp_formatted_text (dc.printer));
> +
> +     /* Unit-test the line_corrections machinery.  */
> ++    char_display_policy policy (make_policy (dc, richloc));
> +     ASSERT_EQ (3, richloc.get_num_fixit_hints ());
> +     const fixit_hint *hint_0 =3D richloc.get_fixit_hint (0);
> +     ASSERT_EQ (column_range (14, 14),
> +-             get_affected_range (&dc, hint_0, CU_BYTES));
> ++             get_affected_range (policy, hint_0, CU_BYTES));
> +     ASSERT_EQ (column_range (12, 12),
> +-             get_affected_range (&dc, hint_0, CU_DISPLAY_COLS));
> +-    ASSERT_EQ (column_range (12, 22), get_printed_columns (&dc, hint_0)=
);
> ++             get_affected_range (policy, hint_0, CU_DISPLAY_COLS));
> ++    ASSERT_EQ (column_range (12, 22), get_printed_columns (policy, hint=
_0));
> +     const fixit_hint *hint_1 =3D richloc.get_fixit_hint (1);
> +     ASSERT_EQ (column_range (22, 22),
> +-             get_affected_range (&dc, hint_1, CU_BYTES));
> ++             get_affected_range (policy, hint_1, CU_BYTES));
> +     ASSERT_EQ (column_range (18, 18),
> +-             get_affected_range (&dc, hint_1, CU_DISPLAY_COLS));
> +-    ASSERT_EQ (column_range (18, 20), get_printed_columns (&dc, hint_1)=
);
> ++             get_affected_range (policy, hint_1, CU_DISPLAY_COLS));
> ++    ASSERT_EQ (column_range (18, 20), get_printed_columns (policy, hint=
_1));
> +     const fixit_hint *hint_2 =3D richloc.get_fixit_hint (2);
> +     ASSERT_EQ (column_range (35, 34),
> +-             get_affected_range (&dc, hint_2, CU_BYTES));
> ++             get_affected_range (policy, hint_2, CU_BYTES));
> +     ASSERT_EQ (column_range (30, 29),
> +-             get_affected_range (&dc, hint_2, CU_DISPLAY_COLS));
> +-    ASSERT_EQ (column_range (30, 30), get_printed_columns (&dc, hint_2)=
);
> ++             get_affected_range (policy, hint_2, CU_DISPLAY_COLS));
> ++    ASSERT_EQ (column_range (30, 30), get_printed_columns (policy, hint=
_2));
> +
> +     /* Add each hint in turn to a line_corrections instance,
> +        and verify that they are consolidated into one correction instan=
ce
> +        as expected.  */
> +-    line_corrections lc (&dc, tmp.get_filename (), 1);
> ++    line_corrections lc (policy, tmp.get_filename (), 1);
> +
> +     /* The first replace hint by itself.  */
> +     lc.add_hint (hint_0);
> +@@ -4877,15 +5179,16 @@ test_overlapped_fixit_printing_2 (const
> +     richloc.add_fixit_insert_before (col_21, "}");
> +
> +     /* These fixits should be accepted; they can't be consolidated.  */
> ++    char_display_policy policy (make_policy (dc, richloc));
> +     ASSERT_EQ (2, richloc.get_num_fixit_hints ());
> +     const fixit_hint *hint_0 =3D richloc.get_fixit_hint (0);
> +     ASSERT_EQ (column_range (23, 22),
> +-             get_affected_range (&dc, hint_0, CU_BYTES));
> +-    ASSERT_EQ (column_range (23, 23), get_printed_columns (&dc, hint_0)=
);
> ++             get_affected_range (policy, hint_0, CU_BYTES));
> ++    ASSERT_EQ (column_range (23, 23), get_printed_columns (policy, hint=
_0));
> +     const fixit_hint *hint_1 =3D richloc.get_fixit_hint (1);
> +     ASSERT_EQ (column_range (21, 20),
> +-             get_affected_range (&dc, hint_1, CU_BYTES));
> +-    ASSERT_EQ (column_range (21, 21), get_printed_columns (&dc, hint_1)=
);
> ++             get_affected_range (policy, hint_1, CU_BYTES));
> ++    ASSERT_EQ (column_range (21, 21), get_printed_columns (policy, hint=
_1));
> +
> +     /* Verify that they're printed correctly.  */
> +     diagnostic_show_locus (&dc, &richloc, DK_ERROR);
> +@@ -5152,10 +5455,11 @@ test_tab_expansion (const line_table_cas
> +      ....................123 45678901234 56789012345  columns  */
> +
> +   const int tabstop =3D 8;
> ++  cpp_char_column_policy policy (tabstop, cpp_wcwidth);
> +   const int first_non_ws_byte_col =3D 7;
> +   const int right_quote_byte_col =3D 15;
> +   const int last_byte_col =3D 25;
> +-  ASSERT_EQ (35, cpp_display_width (content, last_byte_col, tabstop));
> ++  ASSERT_EQ (35, cpp_display_width (content, last_byte_col, policy));
> +
> +   temp_source_file tmp (SELFTEST_LOCATION, ".c", content);
> +   line_table_test ltt (case_);
> +@@ -5198,6 +5502,114 @@ test_tab_expansion (const line_table_cas
> +   }
> + }
> +
> ++/* Verify that the escaping machinery can cope with a variety of differ=
ent
> ++   invalid bytes.  */
> ++
> ++static void
> ++test_escaping_bytes_1 (const line_table_case &case_)
> ++{
> ++  const char content[] =3D "before\0\1\2\3\r\x80\xff""after\n";
> ++  const size_t sz =3D sizeof (content);
> ++  temp_source_file tmp (SELFTEST_LOCATION, ".c", content, sz);
> ++  line_table_test ltt (case_);
> ++  const line_map_ordinary *ord_map =3D linemap_check_ordinary
> ++    (linemap_add (line_table, LC_ENTER, false, tmp.get_filename (), 0))=
;
> ++  linemap_line_start (line_table, 1, 100);
> ++
> ++  location_t finish
> ++    =3D linemap_position_for_line_and_column (line_table, ord_map, 1,
> ++                                          strlen (content));
> ++
> ++  if (finish > LINE_MAP_MAX_LOCATION_WITH_COLS)
> ++    return;
> ++
> ++  /* Locations of the NUL and \r bytes.  */
> ++  location_t nul_loc
> ++    =3D linemap_position_for_line_and_column (line_table, ord_map, 1, 7=
);
> ++  location_t r_loc
> ++    =3D linemap_position_for_line_and_column (line_table, ord_map, 1, 1=
1);
> ++  gcc_rich_location richloc (nul_loc);
> ++  richloc.add_range (r_loc);
> ++
> ++  {
> ++    test_diagnostic_context dc;
> ++    diagnostic_show_locus (&dc, &richloc, DK_ERROR);
> ++    ASSERT_STREQ (" before \1\2\3 \x80\xff""after\n"
> ++                "       ^   ~\n",
> ++                pp_formatted_text (dc.printer));
> ++  }
> ++  richloc.set_escape_on_output (true);
> ++  {
> ++    test_diagnostic_context dc;
> ++    dc.escape_format =3D DIAGNOSTICS_ESCAPE_FORMAT_UNICODE;
> ++    diagnostic_show_locus (&dc, &richloc, DK_ERROR);
> ++    ASSERT_STREQ
> ++      (" before<U+0000><U+0001><U+0002><U+0003><U+000D><80><ff>after\n"
> ++       "       ^~~~~~~~                        ~~~~~~~~\n",
> ++       pp_formatted_text (dc.printer));
> ++  }
> ++  {
> ++    test_diagnostic_context dc;
> ++    dc.escape_format =3D DIAGNOSTICS_ESCAPE_FORMAT_BYTES;
> ++    diagnostic_show_locus (&dc, &richloc, DK_ERROR);
> ++    ASSERT_STREQ (" before<00><01><02><03><0d><80><ff>after\n"
> ++                "       ^~~~            ~~~~\n",
> ++                pp_formatted_text (dc.printer));
> ++  }
> ++}
> ++
> ++/* As above, but verify that we handle the initial byte of a line
> ++   correctly.  */
> ++
> ++static void
> ++test_escaping_bytes_2 (const line_table_case &case_)
> ++{
> ++  const char content[]  =3D "\0after\n";
> ++  const size_t sz =3D sizeof (content);
> ++  temp_source_file tmp (SELFTEST_LOCATION, ".c", content, sz);
> ++  line_table_test ltt (case_);
> ++  const line_map_ordinary *ord_map =3D linemap_check_ordinary
> ++    (linemap_add (line_table, LC_ENTER, false, tmp.get_filename (), 0))=
;
> ++  linemap_line_start (line_table, 1, 100);
> ++
> ++  location_t finish
> ++    =3D linemap_position_for_line_and_column (line_table, ord_map, 1,
> ++                                          strlen (content));
> ++
> ++  if (finish > LINE_MAP_MAX_LOCATION_WITH_COLS)
> ++    return;
> ++
> ++  /* Location of the NUL byte.  */
> ++  location_t nul_loc
> ++    =3D linemap_position_for_line_and_column (line_table, ord_map, 1, 1=
);
> ++  gcc_rich_location richloc (nul_loc);
> ++
> ++  {
> ++    test_diagnostic_context dc;
> ++    diagnostic_show_locus (&dc, &richloc, DK_ERROR);
> ++    ASSERT_STREQ ("  after\n"
> ++                " ^\n",
> ++                pp_formatted_text (dc.printer));
> ++  }
> ++  richloc.set_escape_on_output (true);
> ++  {
> ++    test_diagnostic_context dc;
> ++    dc.escape_format =3D DIAGNOSTICS_ESCAPE_FORMAT_UNICODE;
> ++    diagnostic_show_locus (&dc, &richloc, DK_ERROR);
> ++    ASSERT_STREQ (" <U+0000>after\n"
> ++                " ^~~~~~~~\n",
> ++                pp_formatted_text (dc.printer));
> ++  }
> ++  {
> ++    test_diagnostic_context dc;
> ++    dc.escape_format =3D DIAGNOSTICS_ESCAPE_FORMAT_BYTES;
> ++    diagnostic_show_locus (&dc, &richloc, DK_ERROR);
> ++    ASSERT_STREQ (" <00>after\n"
> ++                " ^~~~\n",
> ++                pp_formatted_text (dc.printer));
> ++  }
> ++}
> ++
> + /* Verify that line numbers are correctly printed for the case of
> +    a multiline range in which the width of the line numbers changes
> +    (e.g. from "9" to "10").  */
> +@@ -5254,6 +5666,8 @@ diagnostic_show_locus_c_tests ()
> +   test_layout_range_for_single_line ();
> +   test_layout_range_for_multiple_lines ();
> +
> ++  test_display_widths ();
> ++
> +   for_each_line_table_case (test_layout_x_offset_display_utf8);
> +   for_each_line_table_case (test_layout_x_offset_display_tab);
> +
> +@@ -5274,6 +5688,8 @@ diagnostic_show_locus_c_tests ()
> +   for_each_line_table_case (test_fixit_replace_containing_newline);
> +   for_each_line_table_case (test_fixit_deletion_affecting_newline);
> +   for_each_line_table_case (test_tab_expansion);
> ++  for_each_line_table_case (test_escaping_bytes_1);
> ++  for_each_line_table_case (test_escaping_bytes_2);
> +
> +   test_line_numbers_multiline_range ();
> + }
> +diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
> +--- a/gcc/doc/invoke.texi      2021-12-13 23:23:05.764437151 -0800
> ++++ b/gcc/doc/invoke.texi      2021-12-14 01:16:01.553943061 -0800
> +@@ -312,7 +312,8 @@ Objective-C and Objective-C++ Dialects}.
> + -fdiagnostics-show-path-depths @gol
> + -fno-show-column @gol
> + -fdiagnostics-column-unit=3D@r{[}display@r{|}byte@r{]} @gol
> +--fdiagnostics-column-origin=3D@var{origin}}
> ++-fdiagnostics-column-origin=3D@var{origin} @gol
> ++-fdiagnostics-escape-format=3D@r{[}unicode@r{|}bytes@r{]}}
> +
> + @item Warning Options
> + @xref{Warning Options,,Options to Request or Suppress Warnings}.
> +@@ -5083,6 +5084,38 @@ first column.  The default value of 1 co
> + behavior and to the GNU style guide.  Some utilities may perform better=
 with an
> + origin of 0; any non-negative value may be specified.
> +
> ++@item -fdiagnostics-escape-format=3D@var{FORMAT}
> ++@opindex fdiagnostics-escape-format
> ++When GCC prints pertinent source lines for a diagnostic it normally att=
empts
> ++to print the source bytes directly.  However, some diagnostics relate t=
o encoding
> ++issues in the source file, such as malformed UTF-8, or issues with Unic=
ode
> ++normalization.  These diagnostics are flagged so that GCC will escape b=
ytes
> ++that are not printable ASCII when printing their pertinent source lines=
.
> ++
> ++This option controls how such bytes should be escaped.
> ++
> ++The default @var{FORMAT}, @samp{unicode} displays Unicode characters th=
at
> ++are not printable ASCII in the form @samp{<U+XXXX>}, and bytes that do =
not
> ++correspond to a Unicode character validly-encoded in UTF-8-encoded will=
 be
> ++displayed as hexadecimal in the form @samp{<XX>}.
> ++
> ++For example, a source line containing the string @samp{before} followed=
 by the
> ++Unicode character U+03C0 (``GREEK SMALL LETTER PI'', with UTF-8 encodin=
g
> ++0xCF 0x80) followed by the byte 0xBF (a stray UTF-8 trailing byte), fol=
lowed by
> ++the string @samp{after} will be printed for such a diagnostic as:
> ++
> ++@smallexample
> ++ before<U+03C0><BF>after
> ++@end smallexample
> ++
> ++Setting @var{FORMAT} to @samp{bytes} will display all non-printable-ASC=
II bytes
> ++in the form @samp{<XX>}, thus showing the underlying encoding of non-AS=
CII
> ++Unicode characters.  For the example above, the following will be print=
ed:
> ++
> ++@smallexample
> ++ before<CF><80><BF>after
> ++@end smallexample
> ++
> + @item -fdiagnostics-format=3D@var{FORMAT}
> + @opindex fdiagnostics-format
> + Select a different format for printing diagnostics.
> +@@ -5150,9 +5183,11 @@ might be printed in JSON form (after for
> +                         @}
> +                     @}
> +                 ],
> ++                "escape-source": false,
> +                 "message": "...this statement, but the latter is @dots{=
}"
> +             @}
> +         ]
> ++      "escape-source": false,
> +       "column-origin": 1,
> +     @},
> +     @dots{}
> +@@ -5239,6 +5274,7 @@ of the expression, which have labels.  I
> +                 "label": "T @{aka struct t@}"
> +             @}
> +         ],
> ++        "escape-source": false,
> +         "message": "invalid operands to binary + @dots{}"
> +     @}
> + @end smallexample
> +@@ -5292,6 +5328,7 @@ might be printed in JSON form as:
> +                 @}
> +             @}
> +         ],
> ++        "escape-source": false,
> +         "message": "\u2018struct s\u2019 has no member named @dots{}"
> +     @}
> + @end smallexample
> +@@ -5349,6 +5386,10 @@ For example, the intraprocedural example
> +     ]
> + @end smallexample
> +
> ++Diagnostics have a boolean attribute @code{escape-source}, hinting whet=
her
> ++non-ASCII bytes should be escaped when printing the pertinent lines of
> ++source code (@code{true} for diagnostics involving source encoding issu=
es).
> ++
> + @end table
> +
> + @node Warning Options
> +diff --git a/gcc/input.c b/gcc/input.c
> +--- a/gcc/input.c      2021-07-27 23:55:07.328287915 -0700
> ++++ b/gcc/input.c      2021-12-14 01:16:01.553943061 -0800
> +@@ -913,7 +913,8 @@ make_location (location_t caret, source_
> +    source line in order to calculate the display width.  If that cannot=
 be done
> +    for any reason, then returns the byte column as a fallback.  */
> + int
> +-location_compute_display_column (expanded_location exploc, int tabstop)
> ++location_compute_display_column (expanded_location exploc,
> ++                               const cpp_char_column_policy &policy)
> + {
> +   if (!(exploc.file && *exploc.file && exploc.line && exploc.column))
> +     return exploc.column;
> +@@ -921,7 +922,7 @@ location_compute_display_column (expande
> +   /* If line is NULL, this function returns exploc.column which is the
> +      desired fallback.  */
> +   return cpp_byte_column_to_display_column (line.get_buffer (), line.le=
ngth (),
> +-                                          exploc.column, tabstop);
> ++                                          exploc.column, policy);
> + }
> +
> + /* Dump statistics to stderr about the memory usage of the line_table
> +@@ -3611,43 +3612,50 @@ test_line_offset_overflow ()
> + void test_cpp_utf8 ()
> + {
> +   const int def_tabstop =3D 8;
> ++  cpp_char_column_policy policy (def_tabstop, cpp_wcwidth);
> ++
> +   /* Verify that wcwidth of invalid UTF-8 or control bytes is 1.  */
> +   {
> +-    int w_bad =3D cpp_display_width ("\xf0!\x9f!\x98!\x82!", 8, def_tab=
stop);
> ++    int w_bad =3D cpp_display_width ("\xf0!\x9f!\x98!\x82!", 8, policy)=
;
> +     ASSERT_EQ (8, w_bad);
> +-    int w_ctrl =3D cpp_display_width ("\r\n\v\0\1", 5, def_tabstop);
> ++    int w_ctrl =3D cpp_display_width ("\r\n\v\0\1", 5, policy);
> +     ASSERT_EQ (5, w_ctrl);
> +   }
> +
> +   /* Verify that wcwidth of valid UTF-8 is as expected.  */
> +   {
> +-    const int w_pi =3D cpp_display_width ("\xcf\x80", 2, def_tabstop);
> ++    const int w_pi =3D cpp_display_width ("\xcf\x80", 2, policy);
> +     ASSERT_EQ (1, w_pi);
> +-    const int w_emoji =3D cpp_display_width ("\xf0\x9f\x98\x82", 4, def=
_tabstop);
> ++    const int w_emoji =3D cpp_display_width ("\xf0\x9f\x98\x82", 4, pol=
icy);
> +     ASSERT_EQ (2, w_emoji);
> +     const int w_umlaut_precomposed =3D cpp_display_width ("\xc3\xbf", 2=
,
> +-                                                      def_tabstop);
> ++                                                      policy);
> +     ASSERT_EQ (1, w_umlaut_precomposed);
> +     const int w_umlaut_combining =3D cpp_display_width ("y\xcc\x88", 3,
> +-                                                    def_tabstop);
> ++                                                    policy);
> +     ASSERT_EQ (1, w_umlaut_combining);
> +-    const int w_han =3D cpp_display_width ("\xe4\xb8\xba", 3, def_tabst=
op);
> ++    const int w_han =3D cpp_display_width ("\xe4\xb8\xba", 3, policy);
> +     ASSERT_EQ (2, w_han);
> +-    const int w_ascii =3D cpp_display_width ("GCC", 3, def_tabstop);
> ++    const int w_ascii =3D cpp_display_width ("GCC", 3, policy);
> +     ASSERT_EQ (3, w_ascii);
> +     const int w_mixed =3D cpp_display_width ("\xcf\x80 =3D 3.14 \xf0\x9=
f\x98\x82"
> +                                          "\x9f! \xe4\xb8\xba y\xcc\x88"=
,
> +-                                         24, def_tabstop);
> ++                                         24, policy);
> +     ASSERT_EQ (18, w_mixed);
> +   }
> +
> +   /* Verify that display width properly expands tabs.  */
> +   {
> +     const char *tstr =3D "\tabc\td";
> +-    ASSERT_EQ (6, cpp_display_width (tstr, 6, 1));
> +-    ASSERT_EQ (10, cpp_display_width (tstr, 6, 3));
> +-    ASSERT_EQ (17, cpp_display_width (tstr, 6, 8));
> +-    ASSERT_EQ (1, cpp_display_column_to_byte_column (tstr, 6, 7, 8));
> ++    ASSERT_EQ (6, cpp_display_width (tstr, 6,
> ++                                   cpp_char_column_policy (1, cpp_wcwid=
th)));
> ++    ASSERT_EQ (10, cpp_display_width (tstr, 6,
> ++                                    cpp_char_column_policy (3, cpp_wcwi=
dth)));
> ++    ASSERT_EQ (17, cpp_display_width (tstr, 6,
> ++                                    cpp_char_column_policy (8, cpp_wcwi=
dth)));
> ++    ASSERT_EQ (1,
> ++             cpp_display_column_to_byte_column
> ++               (tstr, 6, 7, cpp_char_column_policy (8, cpp_wcwidth)));
> +   }
> +
> +   /* Verify that cpp_byte_column_to_display_column can go past the end,
> +@@ -3660,13 +3668,13 @@ void test_cpp_utf8 ()
> +       /* 111122223456
> +        Byte columns.  */
> +
> +-    ASSERT_EQ (5, cpp_display_width (str, 6, def_tabstop));
> ++    ASSERT_EQ (5, cpp_display_width (str, 6, policy));
> +     ASSERT_EQ (105,
> +-             cpp_byte_column_to_display_column (str, 6, 106, def_tabsto=
p));
> ++             cpp_byte_column_to_display_column (str, 6, 106, policy));
> +     ASSERT_EQ (10000,
> +-             cpp_byte_column_to_display_column (NULL, 0, 10000, def_tab=
stop));
> ++             cpp_byte_column_to_display_column (NULL, 0, 10000, policy)=
);
> +     ASSERT_EQ (0,
> +-             cpp_byte_column_to_display_column (NULL, 10000, 0, def_tab=
stop));
> ++             cpp_byte_column_to_display_column (NULL, 10000, 0, policy)=
);
> +   }
> +
> +   /* Verify that cpp_display_column_to_byte_column can go past the end,
> +@@ -3680,25 +3688,25 @@ void test_cpp_utf8 ()
> +       /* 000000000000000000000000000000000111111
> +        111122223333444456666777788889999012345
> +        Byte columns.  */
> +-    ASSERT_EQ (4, cpp_display_column_to_byte_column (str, 15, 2, def_ta=
bstop));
> ++    ASSERT_EQ (4, cpp_display_column_to_byte_column (str, 15, 2, policy=
));
> +     ASSERT_EQ (15,
> +-             cpp_display_column_to_byte_column (str, 15, 11, def_tabsto=
p));
> ++             cpp_display_column_to_byte_column (str, 15, 11, policy));
> +     ASSERT_EQ (115,
> +-             cpp_display_column_to_byte_column (str, 15, 111, def_tabst=
op));
> ++             cpp_display_column_to_byte_column (str, 15, 111, policy));
> +     ASSERT_EQ (10000,
> +-             cpp_display_column_to_byte_column (NULL, 0, 10000, def_tab=
stop));
> ++             cpp_display_column_to_byte_column (NULL, 0, 10000, policy)=
);
> +     ASSERT_EQ (0,
> +-             cpp_display_column_to_byte_column (NULL, 10000, 0, def_tab=
stop));
> ++             cpp_display_column_to_byte_column (NULL, 10000, 0, policy)=
);
> +
> +     /* Verify that we do not interrupt a UTF-8 sequence.  */
> +-    ASSERT_EQ (4, cpp_display_column_to_byte_column (str, 15, 1, def_ta=
bstop));
> ++    ASSERT_EQ (4, cpp_display_column_to_byte_column (str, 15, 1, policy=
));
> +
> +     for (int byte_col =3D 1; byte_col <=3D 15; ++byte_col)
> +       {
> +       const int disp_col
> +-        =3D cpp_byte_column_to_display_column (str, 15, byte_col, def_t=
abstop);
> ++        =3D cpp_byte_column_to_display_column (str, 15, byte_col, polic=
y);
> +       const int byte_col2
> +-        =3D cpp_display_column_to_byte_column (str, 15, disp_col, def_t=
abstop);
> ++        =3D cpp_display_column_to_byte_column (str, 15, disp_col, polic=
y);
> +
> +       /* If we ask for the display column in the middle of a UTF-8
> +          sequence, it will return the length of the partial sequence,
> +diff --git a/gcc/input.h b/gcc/input.h
> +--- a/gcc/input.h      2021-07-27 23:55:07.328287915 -0700
> ++++ b/gcc/input.h      2021-12-14 01:16:01.553943061 -0800
> +@@ -39,8 +39,11 @@ STATIC_ASSERT (BUILTINS_LOCATION < RESER
> + extern bool is_location_from_builtin_token (location_t);
> + extern expanded_location expand_location (location_t);
> +
> +-extern int location_compute_display_column (expanded_location exploc,
> +-                                          int tabstop);
> ++class cpp_char_column_policy;
> ++
> ++extern int
> ++location_compute_display_column (expanded_location exploc,
> ++                               const cpp_char_column_policy &policy);
> +
> + /* A class capturing the bounds of a buffer, to allow for run-time
> +    bounds-checking in a checked build.  */
> +diff --git a/gcc/opts.c b/gcc/opts.c
> +--- a/gcc/opts.c       2021-07-27 23:55:07.364288417 -0700
> ++++ b/gcc/opts.c       2021-12-14 01:16:01.553943061 -0800
> +@@ -2573,6 +2573,10 @@ common_handle_option (struct gcc_options
> +       dc->column_origin =3D value;
> +       break;
> +
> ++    case OPT_fdiagnostics_escape_format_:
> ++      dc->escape_format =3D (enum diagnostics_escape_format)value;
> ++      break;
> ++
> +     case OPT_fdiagnostics_show_cwe:
> +       dc->show_cwe =3D value;
> +       break;
> +diff --git a/gcc/selftest.c b/gcc/selftest.c
> +--- a/gcc/selftest.c   2021-07-27 23:55:07.500290315 -0700
> ++++ b/gcc/selftest.c   2021-12-14 01:16:01.557942991 -0800
> +@@ -193,6 +193,21 @@ temp_source_file::temp_source_file (cons
> +   fclose (out);
> + }
> +
> ++/* As above, but with a size, to allow for NUL bytes in CONTENT.  */
> ++
> ++temp_source_file::temp_source_file (const location &loc,
> ++                                  const char *suffix,
> ++                                  const char *content,
> ++                                  size_t sz)
> ++: named_temp_file (suffix)
> ++{
> ++  FILE *out =3D fopen (get_filename (), "w");
> ++  if (!out)
> ++    fail_formatted (loc, "unable to open tempfile: %s", get_filename ()=
);
> ++  fwrite (content, sz, 1, out);
> ++  fclose (out);
> ++}
> ++
> + /* Avoid introducing locale-specific differences in the results
> +    by hardcoding open_quote and close_quote.  */
> +
> +diff --git a/gcc/selftest.h b/gcc/selftest.h
> +--- a/gcc/selftest.h   2021-07-27 23:55:07.500290315 -0700
> ++++ b/gcc/selftest.h   2021-12-14 01:16:01.557942991 -0800
> +@@ -112,6 +112,8 @@ class temp_source_file : public named_te
> +  public:
> +   temp_source_file (const location &loc, const char *suffix,
> +                   const char *content);
> ++  temp_source_file (const location &loc, const char *suffix,
> ++                  const char *content, size_t sz);
> + };
> +
> + /* RAII-style class for avoiding introducing locale-specific difference=
s
> +diff --git a/gcc/testsuite/c-c++-common/diagnostic-format-json-1.c b/gcc=
/testsuite/c-c++-common/diagnostic-format-json-1.c
> +--- a/gcc/testsuite/c-c++-common/diagnostic-format-json-1.c    2021-07-2=
7 23:55:07.596291654 -0700
> ++++ b/gcc/testsuite/c-c++-common/diagnostic-format-json-1.c    2021-12-1=
4 01:16:01.557942991 -0800
> +@@ -9,6 +9,7 @@
> +
> + /* { dg-regexp "\"kind\": \"error\"" } */
> + /* { dg-regexp "\"column-origin\": 1" } */
> ++/* { dg-regexp "\"escape-source\": false" } */
> + /* { dg-regexp "\"message\": \"#error message\"" } */
> +
> + /* { dg-regexp "\"caret\": \{" } */
> +diff --git a/gcc/testsuite/c-c++-common/diagnostic-format-json-2.c b/gcc=
/testsuite/c-c++-common/diagnostic-format-json-2.c
> +--- a/gcc/testsuite/c-c++-common/diagnostic-format-json-2.c    2021-07-2=
7 23:55:07.596291654 -0700
> ++++ b/gcc/testsuite/c-c++-common/diagnostic-format-json-2.c    2021-12-1=
4 01:16:01.557942991 -0800
> +@@ -9,6 +9,7 @@
> +
> + /* { dg-regexp "\"kind\": \"warning\"" } */
> + /* { dg-regexp "\"column-origin\": 1" } */
> ++/* { dg-regexp "\"escape-source\": false" } */
> + /* { dg-regexp "\"message\": \"#warning message\"" } */
> + /* { dg-regexp "\"option\": \"-Wcpp\"" } */
> + /* { dg-regexp "\"option_url\": \"https:\[^\n\r\"\]*#index-Wcpp\"" } */
> +diff --git a/gcc/testsuite/c-c++-common/diagnostic-format-json-3.c b/gcc=
/testsuite/c-c++-common/diagnostic-format-json-3.c
> +--- a/gcc/testsuite/c-c++-common/diagnostic-format-json-3.c    2021-07-2=
7 23:55:07.596291654 -0700
> ++++ b/gcc/testsuite/c-c++-common/diagnostic-format-json-3.c    2021-12-1=
4 01:16:01.557942991 -0800
> +@@ -9,6 +9,7 @@
> +
> + /* { dg-regexp "\"kind\": \"error\"" } */
> + /* { dg-regexp "\"column-origin\": 1" } */
> ++/* { dg-regexp "\"escape-source\": false" } */
> + /* { dg-regexp "\"message\": \"#warning message\"" } */
> + /* { dg-regexp "\"option\": \"-Werror=3Dcpp\"" } */
> + /* { dg-regexp "\"option_url\": \"https:\[^\n\r\"\]*#index-Wcpp\"" } */
> +diff --git a/gcc/testsuite/c-c++-common/diagnostic-format-json-4.c b/gcc=
/testsuite/c-c++-common/diagnostic-format-json-4.c
> +--- a/gcc/testsuite/c-c++-common/diagnostic-format-json-4.c    2021-07-2=
7 23:55:07.596291654 -0700
> ++++ b/gcc/testsuite/c-c++-common/diagnostic-format-json-4.c    2021-12-1=
4 01:16:01.557942991 -0800
> +@@ -19,6 +19,7 @@ int test (void)
> +
> + /* { dg-regexp "\"kind\": \"note\"" } */
> + /* { dg-regexp "\"message\": \"...this statement, but the latter is mis=
leadingly indented as if it were guarded by the 'if'\"" } */
> ++/* { dg-regexp "\"escape-source\": false" } */
> +
> + /* { dg-regexp "\"caret\": \{" } */
> + /* { dg-regexp "\"file\": \"\[^\n\r\"\]*diagnostic-format-json-4.c\"" }=
 */
> +@@ -39,6 +40,7 @@ int test (void)
> + /* { dg-regexp "\"kind\": \"warning\"" } */
> + /* { dg-regexp "\"column-origin\": 1" } */
> + /* { dg-regexp "\"message\": \"this 'if' clause does not guard...\"" } =
*/
> ++/* { dg-regexp "\"escape-source\": false" } */
> + /* { dg-regexp "\"option\": \"-Wmisleading-indentation\"" } */
> + /* { dg-regexp "\"option_url\": \"https:\[^\n\r\"\]*#index-Wmisleading-=
indentation\"" } */
> +
> +diff --git a/gcc/testsuite/c-c++-common/diagnostic-format-json-5.c b/gcc=
/testsuite/c-c++-common/diagnostic-format-json-5.c
> +--- a/gcc/testsuite/c-c++-common/diagnostic-format-json-5.c    2021-07-2=
7 23:55:07.596291654 -0700
> ++++ b/gcc/testsuite/c-c++-common/diagnostic-format-json-5.c    2021-12-1=
4 01:16:01.557942991 -0800
> +@@ -14,6 +14,7 @@ int test (struct s *ptr)
> +
> + /* { dg-regexp "\"kind\": \"error\"" } */
> + /* { dg-regexp "\"column-origin\": 1" } */
> ++/* { dg-regexp "\"escape-source\": false" } */
> + /* { dg-regexp "\"message\": \".*\"" } */
> +
> + /* Verify fix-it hints.  */
> +diff --git a/gcc/testsuite/gcc.dg/cpp/warn-normalized-4-bytes.c b/gcc/te=
stsuite/gcc.dg/cpp/warn-normalized-4-bytes.c
> +--- a/gcc/testsuite/gcc.dg/cpp/warn-normalized-4-bytes.c       1969-12-3=
1 16:00:00.000000000 -0800
> ++++ b/gcc/testsuite/gcc.dg/cpp/warn-normalized-4-bytes.c       2021-12-1=
4 01:16:01.557942991 -0800
> +@@ -0,0 +1,21 @@
> ++// { dg-do preprocess }
> ++// { dg-options "-std=3Dgnu99 -Werror=3Dnormalized=3Dnfc -fdiagnostics-=
show-caret -fdiagnostics-escape-format=3Dbytes" }
> ++/* { dg-message "some warnings being treated as errors" "" {target "*-*=
-*"} 0 } */
> ++
> ++/* =C3=A0=C2=BD =3D U+0F43 TIBETAN LETTER GHA, which has decomposition =
"0F42 0FB7" i.e.
> ++   U+0F42 TIBETAN LETTER GA: =C3=A0=C2=BD
> ++   U+0FB7 TIBETAN SUBJOINED LETTER HA: =C3=A0=C2=BE=C2=B7
> ++
> ++   The UTF-8 encoding of U+0F43 TIBETAN LETTER GHA is: E0 BD 83.  */
> ++
> ++foo before_\u0F43_after bar // { dg-error "`before_.U00000f43_after' is=
 not in NFC .-Werror=3Dnormalized=3D." }
> ++/* { dg-begin-multiline-output "" }
> ++ foo before_\u0F43_after bar
> ++     ^~~~~~~~~~~~~~~~~~~
> ++   { dg-end-multiline-output "" } */
> ++
> ++foo before_=C3=A0=C2=BD_after bar // { dg-error "`before_.U00000f43_aft=
er' is not in NFC .-Werror=3Dnormalized=3D." }
> ++/* { dg-begin-multiline-output "" }
> ++ foo before_<e0><bd><83>_after bar
> ++     ^~~~~~~~~~~~~~~~~~~~~~~~~
> ++   { dg-end-multiline-output "" } */
> +diff --git a/gcc/testsuite/gcc.dg/cpp/warn-normalized-4-unicode.c b/gcc/=
testsuite/gcc.dg/cpp/warn-normalized-4-unicode.c
> +--- a/gcc/testsuite/gcc.dg/cpp/warn-normalized-4-unicode.c     1969-12-3=
1 16:00:00.000000000 -0800
> ++++ b/gcc/testsuite/gcc.dg/cpp/warn-normalized-4-unicode.c     2021-12-1=
4 01:16:01.557942991 -0800
> +@@ -0,0 +1,19 @@
> ++// { dg-do preprocess }
> ++// { dg-options "-std=3Dgnu99 -Werror=3Dnormalized=3Dnfc -fdiagnostics-=
show-caret -fdiagnostics-escape-format=3Dunicode" }
> ++/* { dg-message "some warnings being treated as errors" "" {target "*-*=
-*"} 0 } */
> ++
> ++/* =C3=A0=C2=BD =3D U+0F43 TIBETAN LETTER GHA, which has decomposition =
"0F42 0FB7" i.e.
> ++   U+0F42 TIBETAN LETTER GA: =C3=A0=C2=BD
> ++   U+0FB7 TIBETAN SUBJOINED LETTER HA: =C3=A0=C2=BE=C2=B7  */
> ++
> ++foo before_\u0F43_after bar  // { dg-error "`before_.U00000f43_after' i=
s not in NFC .-Werror=3Dnormalized=3D." }
> ++/* { dg-begin-multiline-output "" }
> ++ foo before_\u0F43_after bar
> ++     ^~~~~~~~~~~~~~~~~~~
> ++   { dg-end-multiline-output "" } */
> ++
> ++foo before_=C3=A0=C2=BD_after bar // { dg-error "`before_.U00000f43_aft=
er' is not in NFC .-Werror=3Dnormalized=3D." }
> ++/* { dg-begin-multiline-output "" }
> ++ foo before_<U+0F43>_after bar
> ++     ^~~~~~~~~~~~~~~~~~~~~
> ++   { dg-end-multiline-output "" } */
> +diff --git a/gcc/testsuite/gfortran.dg/diagnostic-format-json-1.F90 b/gc=
c/testsuite/gfortran.dg/diagnostic-format-json-1.F90
> +--- a/gcc/testsuite/gfortran.dg/diagnostic-format-json-1.F90   2021-07-2=
7 23:55:08.472303878 -0700
> ++++ b/gcc/testsuite/gfortran.dg/diagnostic-format-json-1.F90   2021-12-1=
4 01:16:01.557942991 -0800
> +@@ -9,6 +9,7 @@
> +
> + ! { dg-regexp "\"kind\": \"error\"" }
> + ! { dg-regexp "\"column-origin\": 1" }
> ++! { dg-regexp "\"escape-source\": false" }
> + ! { dg-regexp "\"message\": \"#error message\"" }
> +
> + ! { dg-regexp "\"caret\": \{" }
> +diff --git a/gcc/testsuite/gfortran.dg/diagnostic-format-json-2.F90 b/gc=
c/testsuite/gfortran.dg/diagnostic-format-json-2.F90
> +--- a/gcc/testsuite/gfortran.dg/diagnostic-format-json-2.F90   2021-07-2=
7 23:55:08.472303878 -0700
> ++++ b/gcc/testsuite/gfortran.dg/diagnostic-format-json-2.F90   2021-12-1=
4 01:16:01.557942991 -0800
> +@@ -9,6 +9,7 @@
> +
> + ! { dg-regexp "\"kind\": \"warning\"" }
> + ! { dg-regexp "\"column-origin\": 1" }
> ++! { dg-regexp "\"escape-source\": false" }
> + ! { dg-regexp "\"message\": \"#warning message\"" }
> + ! { dg-regexp "\"option\": \"-Wcpp\"" }
> + ! { dg-regexp "\"option_url\": \"\[^\n\r\"\]*#index-Wcpp\"" }
> +diff --git a/gcc/testsuite/gfortran.dg/diagnostic-format-json-3.F90 b/gc=
c/testsuite/gfortran.dg/diagnostic-format-json-3.F90
> +--- a/gcc/testsuite/gfortran.dg/diagnostic-format-json-3.F90   2021-07-2=
7 23:55:08.472303878 -0700
> ++++ b/gcc/testsuite/gfortran.dg/diagnostic-format-json-3.F90   2021-12-1=
4 01:16:01.557942991 -0800
> +@@ -9,6 +9,7 @@
> +
> + ! { dg-regexp "\"kind\": \"error\"" }
> + ! { dg-regexp "\"column-origin\": 1" }
> ++! { dg-regexp "\"escape-source\": false" }
> + ! { dg-regexp "\"message\": \"#warning message\"" }
> + ! { dg-regexp "\"option\": \"-Werror=3Dcpp\"" }
> + ! { dg-regexp "\"option_url\": \"\[^\n\r\"\]*#index-Wcpp\"" }
> +diff --git a/libcpp/charset.c b/libcpp/charset.c
> +--- a/libcpp/charset.c 2021-07-27 23:55:08.712307227 -0700
> ++++ b/libcpp/charset.c 2021-12-14 01:16:01.557942991 -0800
> +@@ -1552,12 +1552,14 @@ convert_escape (cpp_reader *pfile, const
> +                  "unknown escape sequence: '\\%c'", (int) c);
> +       else
> +       {
> ++        encoding_rich_location rich_loc (pfile);
> ++
> +         /* diagnostic.c does not support "%03o".  When it does, this
> +            code can use %03o directly in the diagnostic again.  */
> +         char buf[32];
> +         sprintf(buf, "%03o", (int) c);
> +-        cpp_error (pfile, CPP_DL_PEDWARN,
> +-                   "unknown escape sequence: '\\%s'", buf);
> ++        cpp_error_at (pfile, CPP_DL_PEDWARN, &rich_loc,
> ++                      "unknown escape sequence: '\\%s'", buf);
> +       }
> +     }
> +
> +@@ -2280,14 +2282,16 @@ cpp_string_location_reader::get_next ()
> + }
> +
> + cpp_display_width_computation::
> +-cpp_display_width_computation (const char *data, int data_length, int t=
abstop) :
> ++cpp_display_width_computation (const char *data, int data_length,
> ++                             const cpp_char_column_policy &policy) :
> +   m_begin (data),
> +   m_next (m_begin),
> +   m_bytes_left (data_length),
> +-  m_tabstop (tabstop),
> ++  m_policy (policy),
> +   m_display_cols (0)
> + {
> +-  gcc_assert (m_tabstop > 0);
> ++  gcc_assert (policy.m_tabstop > 0);
> ++  gcc_assert (policy.m_width_cb);
> + }
> +
> +
> +@@ -2299,19 +2303,28 @@ cpp_display_width_computation (const cha
> +    point to a valid UTF-8-encoded sequence, then it will be treated as =
a single
> +    byte with display width 1.  m_cur_display_col is the current display=
 column,
> +    relative to which tab stops should be expanded.  Returns the display=
 width of
> +-   the codepoint just processed.  */
> ++   the codepoint just processed.
> ++   If OUT is non-NULL, it is populated.  */
> +
> + int
> +-cpp_display_width_computation::process_next_codepoint ()
> ++cpp_display_width_computation::process_next_codepoint (cpp_decoded_char=
 *out)
> + {
> +   cppchar_t c;
> +   int next_width;
> +
> ++  if (out)
> ++    out->m_start_byte =3D m_next;
> ++
> +   if (*m_next =3D=3D '\t')
> +     {
> +       ++m_next;
> +       --m_bytes_left;
> +-      next_width =3D m_tabstop - (m_display_cols % m_tabstop);
> ++      next_width =3D m_policy.m_tabstop - (m_display_cols % m_policy.m_=
tabstop);
> ++      if (out)
> ++      {
> ++        out->m_ch =3D '\t';
> ++        out->m_valid_ch =3D true;
> ++      }
> +     }
> +   else if (one_utf8_to_cppchar ((const uchar **) &m_next, &m_bytes_left=
, &c)
> +          !=3D 0)
> +@@ -2321,14 +2334,24 @@ cpp_display_width_computation::process_n
> +        of one.  */
> +       ++m_next;
> +       --m_bytes_left;
> +-      next_width =3D 1;
> ++      next_width =3D m_policy.m_undecoded_byte_width;
> ++      if (out)
> ++      out->m_valid_ch =3D false;
> +     }
> +   else
> +     {
> +       /*  one_utf8_to_cppchar() has updated m_next and m_bytes_left for=
 us.  */
> +-      next_width =3D cpp_wcwidth (c);
> ++      next_width =3D m_policy.m_width_cb (c);
> ++      if (out)
> ++      {
> ++        out->m_ch =3D c;
> ++        out->m_valid_ch =3D true;
> ++      }
> +     }
> +
> ++  if (out)
> ++    out->m_next_byte =3D m_next;
> ++
> +   m_display_cols +=3D next_width;
> +   return next_width;
> + }
> +@@ -2344,7 +2367,7 @@ cpp_display_width_computation::advance_d
> +   const int start =3D m_display_cols;
> +   const int target =3D start + n;
> +   while (m_display_cols < target && !done ())
> +-    process_next_codepoint ();
> ++    process_next_codepoint (NULL);
> +   return m_display_cols - start;
> + }
> +
> +@@ -2352,29 +2375,33 @@ cpp_display_width_computation::advance_d
> +     how many display columns are occupied by the first COLUMN bytes.  C=
OLUMN
> +     may exceed DATA_LENGTH, in which case the phantom bytes at the end =
are
> +     treated as if they have display width 1.  Tabs are expanded to the =
next tab
> +-    stop, relative to the start of DATA.  */
> ++    stop, relative to the start of DATA, and non-printable-ASCII charac=
ters
> ++    will be escaped as per POLICY.  */
> +
> + int
> + cpp_byte_column_to_display_column (const char *data, int data_length,
> +-                                 int column, int tabstop)
> ++                                 int column,
> ++                                 const cpp_char_column_policy &policy)
> + {
> +   const int offset =3D MAX (0, column - data_length);
> +-  cpp_display_width_computation dw (data, column - offset, tabstop);
> ++  cpp_display_width_computation dw (data, column - offset, policy);
> +   while (!dw.done ())
> +-    dw.process_next_codepoint ();
> ++    dw.process_next_codepoint (NULL);
> +   return dw.display_cols_processed () + offset;
> + }
> +
> + /*  For the string of length DATA_LENGTH bytes that begins at DATA, com=
pute
> +     the least number of bytes that will result in at least DISPLAY_COL =
display
> +     columns.  The return value may exceed DATA_LENGTH if the entire str=
ing does
> +-    not occupy enough display columns.  */
> ++    not occupy enough display columns.  Non-printable-ASCII characters
> ++    will be escaped as per POLICY.  */
> +
> + int
> + cpp_display_column_to_byte_column (const char *data, int data_length,
> +-                                 int display_col, int tabstop)
> ++                                 int display_col,
> ++                                 const cpp_char_column_policy &policy)
> + {
> +-  cpp_display_width_computation dw (data, data_length, tabstop);
> ++  cpp_display_width_computation dw (data, data_length, policy);
> +   const int avail_display =3D dw.advance_display_cols (display_col);
> +   return dw.bytes_processed () + MAX (0, display_col - avail_display);
> + }
> +diff --git a/libcpp/errors.c b/libcpp/errors.c
> +--- a/libcpp/errors.c  2021-07-27 23:55:08.712307227 -0700
> ++++ b/libcpp/errors.c  2021-12-14 01:16:01.557942991 -0800
> +@@ -27,6 +27,31 @@ along with this program; see the file CO
> + #include "cpplib.h"
> + #include "internal.h"
> +
> ++/* Get a location_t for the current location in PFILE,
> ++   generally that of the previously lexed token.  */
> ++
> ++location_t
> ++cpp_diagnostic_get_current_location (cpp_reader *pfile)
> ++{
> ++  if (CPP_OPTION (pfile, traditional))
> ++    {
> ++      if (pfile->state.in_directive)
> ++      return pfile->directive_line;
> ++      else
> ++      return pfile->line_table->highest_line;
> ++    }
> ++  /* We don't want to refer to a token before the beginning of the
> ++     current run -- that is invalid.  */
> ++  else if (pfile->cur_token =3D=3D pfile->cur_run->base)
> ++    {
> ++      return 0;
> ++    }
> ++  else
> ++    {
> ++      return pfile->cur_token[-1].src_loc;
> ++    }
> ++}
> ++
> + /* Print a diagnostic at the given location.  */
> +
> + ATTRIBUTE_FPTR_PRINTF(5,0)
> +@@ -52,25 +77,7 @@ cpp_diagnostic (cpp_reader * pfile, enum
> +               enum cpp_warning_reason reason,
> +               const char *msgid, va_list *ap)
> + {
> +-  location_t src_loc;
> +-
> +-  if (CPP_OPTION (pfile, traditional))
> +-    {
> +-      if (pfile->state.in_directive)
> +-      src_loc =3D pfile->directive_line;
> +-      else
> +-      src_loc =3D pfile->line_table->highest_line;
> +-    }
> +-  /* We don't want to refer to a token before the beginning of the
> +-     current run -- that is invalid.  */
> +-  else if (pfile->cur_token =3D=3D pfile->cur_run->base)
> +-    {
> +-      src_loc =3D 0;
> +-    }
> +-  else
> +-    {
> +-      src_loc =3D pfile->cur_token[-1].src_loc;
> +-    }
> ++  location_t src_loc =3D cpp_diagnostic_get_current_location (pfile);
> +   rich_location richloc (pfile->line_table, src_loc);
> +   return cpp_diagnostic_at (pfile, level, reason, &richloc, msgid, ap);
> + }
> +@@ -142,6 +149,43 @@ cpp_warning_syshdr (cpp_reader * pfile,
> +
> +   va_end (ap);
> +   return ret;
> ++}
> ++
> ++/* As cpp_warning above, but use RICHLOC as the location of the diagnos=
tic.  */
> ++
> ++bool cpp_warning_at (cpp_reader *pfile, enum cpp_warning_reason reason,
> ++                   rich_location *richloc, const char *msgid, ...)
> ++{
> ++  va_list ap;
> ++  bool ret;
> ++
> ++  va_start (ap, msgid);
> ++
> ++  ret =3D cpp_diagnostic_at (pfile, CPP_DL_WARNING, reason, richloc,
> ++                         msgid, &ap);
> ++
> ++  va_end (ap);
> ++  return ret;
> ++
> ++}
> ++
> ++/* As cpp_pedwarning above, but use RICHLOC as the location of the
> ++   diagnostic.  */
> ++
> ++bool
> ++cpp_pedwarning_at (cpp_reader * pfile, enum cpp_warning_reason reason,
> ++                 rich_location *richloc, const char *msgid, ...)
> ++{
> ++  va_list ap;
> ++  bool ret;
> ++
> ++  va_start (ap, msgid);
> ++
> ++  ret =3D cpp_diagnostic_at (pfile, CPP_DL_PEDWARN, reason, richloc,
> ++                         msgid, &ap);
> ++
> ++  va_end (ap);
> ++  return ret;
> + }
> +
> + /* Print a diagnostic at a specific location.  */
> +diff --git a/libcpp/include/cpplib.h b/libcpp/include/cpplib.h
> +--- a/libcpp/include/cpplib.h  2021-12-13 23:23:05.768437079 -0800
> ++++ b/libcpp/include/cpplib.h  2021-12-14 01:20:16.189507386 -0800
> +@@ -1275,6 +1275,14 @@ extern bool cpp_warning_syshdr (cpp_read
> +                               const char *msgid, ...)
> +   ATTRIBUTE_PRINTF_3;
> +
> ++/* As their counterparts above, but use RICHLOC.  */
> ++extern bool cpp_warning_at (cpp_reader *, enum cpp_warning_reason,
> ++                          rich_location *richloc, const char *msgid, ..=
.)
> ++  ATTRIBUTE_PRINTF_4;
> ++extern bool cpp_pedwarning_at (cpp_reader *, enum cpp_warning_reason,
> ++                             rich_location *richloc, const char *msgid,=
 ...)
> ++  ATTRIBUTE_PRINTF_4;
> ++
> + /* Output a diagnostic with "MSGID: " preceding the
> +    error string of errno.  No location is printed.  */
> + extern bool cpp_errno (cpp_reader *, enum cpp_diagnostic_level,
> +@@ -1435,42 +1443,95 @@ extern const char * cpp_get_userdef_suff
> +
> + /* In charset.c */
> +
> ++/* The result of attempting to decode a run of UTF-8 bytes.  */
> ++
> ++struct cpp_decoded_char
> ++{
> ++  const char *m_start_byte;
> ++  const char *m_next_byte;
> ++
> ++  bool m_valid_ch;
> ++  cppchar_t m_ch;
> ++};
> ++
> ++/* Information for mapping between code points and display columns.
> ++
> ++   This is a tabstop value, along with a callback for getting the
> ++   widths of characters.  Normally this callback is cpp_wcwidth, but we
> ++   support other schemes for escaping non-ASCII unicode as a series of
> ++   ASCII chars when printing the user's source code in diagnostic-show-=
locus.c
> ++
> ++   For example, consider:
> ++   - the Unicode character U+03C0 "GREEK SMALL LETTER PI" (UTF-8: 0xCF =
0x80)
> ++   - the Unicode character U+1F642 "SLIGHTLY SMILING FACE"
> ++     (UTF-8: 0xF0 0x9F 0x99 0x82)
> ++   - the byte 0xBF (a stray trailing byte of a UTF-8 character)
> ++   Normally U+03C0 would occupy one display column, U+1F642
> ++   would occupy two display columns, and the stray byte would be
> ++   printed verbatim as one display column.
> ++
> ++   However when escaping them as unicode code points as "<U+03C0>"
> ++   and "<U+1F642>" they occupy 8 and 9 display columns respectively,
> ++   and when escaping them as bytes as "<CF><80>" and "<F0><9F><99><82>"
> ++   they occupy 8 and 16 display columns respectively.  In both cases
> ++   the stray byte is escaped to <BF> as 4 display columns.  */
> ++
> ++struct cpp_char_column_policy
> ++{
> ++  cpp_char_column_policy (int tabstop,
> ++                        int (*width_cb) (cppchar_t c))
> ++  : m_tabstop (tabstop),
> ++    m_undecoded_byte_width (1),
> ++    m_width_cb (width_cb)
> ++  {}
> ++
> ++  int m_tabstop;
> ++  /* Width in display columns of a stray byte that isn't decodable
> ++     as UTF-8.  */
> ++  int m_undecoded_byte_width;
> ++  int (*m_width_cb) (cppchar_t c);
> ++};
> ++
> + /* A class to manage the state while converting a UTF-8 sequence to cpp=
char_t
> +    and computing the display width one character at a time.  */
> + class cpp_display_width_computation {
> +  public:
> +   cpp_display_width_computation (const char *data, int data_length,
> +-                               int tabstop);
> ++                               const cpp_char_column_policy &policy);
> +   const char *next_byte () const { return m_next; }
> +   int bytes_processed () const { return m_next - m_begin; }
> +   int bytes_left () const { return m_bytes_left; }
> +   bool done () const { return !bytes_left (); }
> +   int display_cols_processed () const { return m_display_cols; }
> +
> +-  int process_next_codepoint ();
> ++  int process_next_codepoint (cpp_decoded_char *out);
> +   int advance_display_cols (int n);
> +
> +  private:
> +   const char *const m_begin;
> +   const char *m_next;
> +   size_t m_bytes_left;
> +-  const int m_tabstop;
> ++  const cpp_char_column_policy &m_policy;
> +   int m_display_cols;
> + };
> +
> + /* Convenience functions that are simple use cases for class
> +    cpp_display_width_computation.  Tab characters will be expanded to s=
paces
> +-   as determined by TABSTOP.  */
> ++   as determined by POLICY.m_tabstop, and non-printable-ASCII character=
s
> ++   will be escaped as per POLICY.  */
> ++
> + int cpp_byte_column_to_display_column (const char *data, int data_lengt=
h,
> +-                                     int column, int tabstop);
> ++                                     int column,
> ++                                     const cpp_char_column_policy &poli=
cy);
> + inline int cpp_display_width (const char *data, int data_length,
> +-                            int tabstop)
> ++                            const cpp_char_column_policy &policy)
> + {
> +   return cpp_byte_column_to_display_column (data, data_length, data_len=
gth,
> +-                                          tabstop);
> ++                                          policy);
> + }
> + int cpp_display_column_to_byte_column (const char *data, int data_lengt=
h,
> +-                                     int display_col, int tabstop);
> ++                                     int display_col,
> ++                                     const cpp_char_column_policy &poli=
cy);
> + int cpp_wcwidth (cppchar_t c);
> +
> + #endif /* ! LIBCPP_CPPLIB_H */
> +diff --git a/libcpp/include/line-map.h b/libcpp/include/line-map.h
> +--- a/libcpp/include/line-map.h        2021-07-27 23:55:08.716307283 -07=
00
> ++++ b/libcpp/include/line-map.h        2021-12-14 01:16:01.557942991 -08=
00
> +@@ -1781,6 +1781,18 @@ class rich_location
> +   const diagnostic_path *get_path () const { return m_path; }
> +   void set_path (const diagnostic_path *path) { m_path =3D path; }
> +
> ++  /* A flag for hinting that the diagnostic involves character encoding
> ++     issues, and thus that it will be helpful to the user if we show so=
me
> ++     representation of how the characters in the pertinent source lines
> ++     are encoded.
> ++     The default is false (i.e. do not escape).
> ++     When set to true, non-ASCII bytes in the pertinent source lines wi=
ll
> ++     be escaped in a manner controlled by the user-supplied option
> ++     -fdiagnostics-escape-format=3D, so that the user can better unders=
tand
> ++     what's going on with the encoding in their source file.  */
> ++  bool escape_on_output_p () const { return m_escape_on_output; }
> ++  void set_escape_on_output (bool flag) { m_escape_on_output =3D flag; =
}
> ++
> + private:
> +   bool reject_impossible_fixit (location_t where);
> +   void stop_supporting_fixits ();
> +@@ -1807,6 +1819,7 @@ protected:
> +   bool m_fixits_cannot_be_auto_applied;
> +
> +   const diagnostic_path *m_path;
> ++  bool m_escape_on_output;
> + };
> +
> + /* A struct for the result of range_label::get_text: a NUL-terminated b=
uffer
> +diff --git a/libcpp/internal.h b/libcpp/internal.h
> +--- a/libcpp/internal.h        2021-12-13 23:23:05.768437079 -0800
> ++++ b/libcpp/internal.h        2021-12-14 01:16:01.557942991 -0800
> +@@ -776,6 +776,9 @@ extern void _cpp_do_file_change (cpp_rea
> + extern void _cpp_pop_buffer (cpp_reader *);
> + extern char *_cpp_bracket_include (cpp_reader *);
> +
> ++/* In errors.c  */
> ++extern location_t cpp_diagnostic_get_current_location (cpp_reader *);
> ++
> + /* In traditional.c.  */
> + extern bool _cpp_scan_out_logical_line (cpp_reader *, cpp_macro *, bool=
);
> + extern bool _cpp_read_logical_line_trad (cpp_reader *);
> +@@ -942,6 +945,26 @@ int linemap_get_expansion_line (class li
> + const char* linemap_get_expansion_filename (class line_maps *,
> +                                           location_t);
> +
> ++/* A subclass of rich_location for emitting a diagnostic
> ++   at the current location of the reader, but flagging
> ++   it with set_escape_on_output (true).  */
> ++class encoding_rich_location : public rich_location
> ++{
> ++ public:
> ++  encoding_rich_location (cpp_reader *pfile)
> ++  : rich_location (pfile->line_table,
> ++                 cpp_diagnostic_get_current_location (pfile))
> ++  {
> ++    set_escape_on_output (true);
> ++  }
> ++
> ++  encoding_rich_location (cpp_reader *pfile, location_t loc)
> ++  : rich_location (pfile->line_table, loc)
> ++  {
> ++    set_escape_on_output (true);
> ++  }
> ++};
> ++
> + #ifdef __cplusplus
> + }
> + #endif
> +diff --git a/libcpp/lex.c b/libcpp/lex.c
> +--- a/libcpp/lex.c     2021-12-14 01:14:48.435225968 -0800
> ++++ b/libcpp/lex.c     2021-12-14 01:24:37.220995816 -0800
> +@@ -1774,7 +1774,11 @@ skip_whitespace (cpp_reader *pfile, cppc
> +   while (is_nvspace (c));
> +
> +   if (saw_NUL)
> +-    cpp_error (pfile, CPP_DL_WARNING, "null character(s) ignored");
> ++    {
> ++      encoding_rich_location rich_loc (pfile);
> ++      cpp_error_at (pfile, CPP_DL_WARNING, &rich_loc,
> ++                  "null character(s) ignored");
> ++    }
> +
> +   buffer->cur--;
> + }
> +@@ -1803,6 +1807,28 @@ warn_about_normalization (cpp_reader *pf
> +   if (CPP_OPTION (pfile, warn_normalize) < NORMALIZE_STATE_RESULT (s)
> +       && !pfile->state.skipping)
> +     {
> ++      location_t loc =3D token->src_loc;
> ++
> ++      /* If possible, create a location range for the token.  */
> ++      if (loc >=3D RESERVED_LOCATION_COUNT
> ++        && token->type !=3D CPP_EOF
> ++        /* There must be no line notes to process.  */
> ++        && (!(pfile->buffer->cur
> ++              >=3D pfile->buffer->notes[pfile->buffer->cur_note].pos
> ++              && !pfile->overlaid_buffer)))
> ++      {
> ++        source_range tok_range;
> ++        tok_range.m_start =3D loc;
> ++        tok_range.m_finish
> ++          =3D linemap_position_for_column (pfile->line_table,
> ++                                         CPP_BUF_COLUMN (pfile->buffer,
> ++                                                         pfile->buffer-=
>cur));
> ++        loc =3D COMBINE_LOCATION_DATA (pfile->line_table,
> ++                                     loc, tok_range, NULL);
> ++      }
> ++
> ++      encoding_rich_location rich_loc (pfile, loc);
> ++
> +       /* Make sure that the token is printed using UCNs, even
> +        if we'd otherwise happily print UTF-8.  */
> +       unsigned char *buf =3D XNEWVEC (unsigned char, cpp_token_len (tok=
en));
> +@@ -1810,11 +1836,11 @@ warn_about_normalization (cpp_reader *pf
> +
> +       sz =3D cpp_spell_token (pfile, token, buf, false) - buf;
> +       if (NORMALIZE_STATE_RESULT (s) =3D=3D normalized_C)
> +-      cpp_warning_with_line (pfile, CPP_W_NORMALIZE, token->src_loc, 0,
> +-                             "`%.*s' is not in NFKC", (int) sz, buf);
> ++      cpp_warning_at (pfile, CPP_W_NORMALIZE, &rich_loc,
> ++                      "`%.*s' is not in NFKC", (int) sz, buf);
> +       else
> +-      cpp_warning_with_line (pfile, CPP_W_NORMALIZE, token->src_loc, 0,
> +-                             "`%.*s' is not in NFC", (int) sz, buf);
> ++      cpp_warning_at (pfile, CPP_W_NORMALIZE, &rich_loc,
> ++                      "`%.*s' is not in NFC", (int) sz, buf);
> +       free (buf);
> +     }
> + }
> +diff --git a/libcpp/line-map.c b/libcpp/line-map.c
> +--- a/libcpp/line-map.c        2021-07-27 23:55:08.716307283 -0700
> ++++ b/libcpp/line-map.c        2021-12-14 01:16:01.561942921 -0800
> +@@ -2086,7 +2086,8 @@ rich_location::rich_location (line_maps
> +   m_fixit_hints (),
> +   m_seen_impossible_fixit (false),
> +   m_fixits_cannot_be_auto_applied (false),
> +-  m_path (NULL)
> ++  m_path (NULL),
> ++  m_escape_on_output (false)
> + {
> +   add_range (loc, SHOW_RANGE_WITH_CARET, label);
> + }
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0001-CV=
E-2021-46195.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0=
001-CVE-2021-46195.patch
> new file mode 100644
> index 000000000000..7b3651c73eb1
> --- /dev/null
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0001-CVE-2021-=
46195.patch
> @@ -0,0 +1,128 @@
> +From f10bec5ffa487ad3033ed5f38cfd0fc7d696deab Mon Sep 17 00:00:00 2001
> +From: Nick Clifton <nickc@redhat.com>
> +Date: Mon, 31 Jan 2022 14:28:42 +0000
> +Subject: [PATCH] libiberty: Fix infinite recursion in rust demangler.
> +
> +libiberty/
> +       PR demangler/98886
> +       PR demangler/99935
> +       * rust-demangle.c (struct rust_demangler): Add a recursion
> +       counter.
> +       (demangle_path): Increment/decrement the recursion counter upon
> +       entry and exit.  Fail if the counter exceeds a fixed limit.
> +       (demangle_type): Likewise.
> +       (rust_demangle_callback): Initialise the recursion counter,
> +       disabling if requested by the option flags.
> +
> +CVE: CVE-2021-46195
> +Upstream-Status: Backport
> +[https://gcc.gnu.org/git/gitweb.cgi?p=3Dgcc.git;h=3Df10bec5ffa487ad3033e=
d5f38cfd0fc7d696deab]
> +Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> +---
> + libiberty/rust-demangle.c | 47 ++++++++++++++++++++++++++++++++++-----
> + 1 file changed, 41 insertions(+), 6 deletions(-)
> +
> +diff --git a/libiberty/rust-demangle.c b/libiberty/rust-demangle.c
> +index 18c760491bd..3b24d63892a 100644
> +--- a/libiberty/rust-demangle.c
> ++++ b/libiberty/rust-demangle.c
> +@@ -74,6 +74,12 @@ struct rust_demangler
> +   /* Rust mangling version, with legacy mangling being -1. */
> +   int version;
> +
> ++  /* Recursion depth.  */
> ++  unsigned int recursion;
> ++  /* Maximum number of times demangle_path may be called recursively.  =
*/
> ++#define RUST_MAX_RECURSION_COUNT  1024
> ++#define RUST_NO_RECURSION_LIMIT   ((unsigned int) -1)
> ++
> +   uint64_t bound_lifetime_depth;
> + };
> +
> +@@ -671,6 +677,15 @@ demangle_path (struct rust_demangler *rdm, int in_v=
alue)
> +   if (rdm->errored)
> +     return;
> +
> ++  if (rdm->recursion !=3D RUST_NO_RECURSION_LIMIT)
> ++    {
> ++      ++ rdm->recursion;
> ++      if (rdm->recursion > RUST_MAX_RECURSION_COUNT)
> ++      /* FIXME: There ought to be a way to report
> ++         that the recursion limit has been reached.  */
> ++      goto fail_return;
> ++    }
> ++
> +   switch (tag =3D next (rdm))
> +     {
> +     case 'C':
> +@@ -688,10 +703,7 @@ demangle_path (struct rust_demangler *rdm, int in_v=
alue)
> +     case 'N':
> +       ns =3D next (rdm);
> +       if (!ISLOWER (ns) && !ISUPPER (ns))
> +-        {
> +-          rdm->errored =3D 1;
> +-          return;
> +-        }
> ++      goto fail_return;
> +
> +       demangle_path (rdm, in_value);
> +
> +@@ -776,9 +788,15 @@ demangle_path (struct rust_demangler *rdm, int in_v=
alue)
> +         }
> +       break;
> +     default:
> +-      rdm->errored =3D 1;
> +-      return;
> ++      goto fail_return;
> +     }
> ++  goto pass_return;
> ++
> ++ fail_return:
> ++  rdm->errored =3D 1;
> ++ pass_return:
> ++  if (rdm->recursion !=3D RUST_NO_RECURSION_LIMIT)
> ++    -- rdm->recursion;
> + }
> +
> + static void
> +@@ -870,6 +888,19 @@ demangle_type (struct rust_demangler *rdm)
> +       return;
> +     }
> +
> ++   if (rdm->recursion !=3D RUST_NO_RECURSION_LIMIT)
> ++    {
> ++      ++ rdm->recursion;
> ++      if (rdm->recursion > RUST_MAX_RECURSION_COUNT)
> ++      /* FIXME: There ought to be a way to report
> ++         that the recursion limit has been reached.  */
> ++      {
> ++        rdm->errored =3D 1;
> ++        -- rdm->recursion;
> ++        return;
> ++      }
> ++    }
> ++
> +   switch (tag)
> +     {
> +     case 'R':
> +@@ -1030,6 +1061,9 @@ demangle_type (struct rust_demangler *rdm)
> +       rdm->next--;
> +       demangle_path (rdm, 0);
> +     }
> ++
> ++  if (rdm->recursion !=3D RUST_NO_RECURSION_LIMIT)
> ++    -- rdm->recursion;
> + }
> +
> + /* A trait in a trait object may have some "existential projections"
> +@@ -1320,6 +1354,7 @@ rust_demangle_callback (const char *mangled, int o=
ptions,
> +   rdm.skipping_printing =3D 0;
> +   rdm.verbose =3D (options & DMGL_VERBOSE) !=3D 0;
> +   rdm.version =3D 0;
> ++  rdm.recursion =3D (options & DMGL_NO_RECURSE_LIMIT) ? RUST_NO_RECURSI=
ON_LIMIT : 0;
> +   rdm.bound_lifetime_depth =3D 0;
> +
> +   /* Rust symbols always start with _R (v0) or _ZN (legacy). */
> +--
> +2.27.0
> +
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0001-Fi=
x-install-path-of-linux64.h.patch b/meta-arm-toolchain/recipes-devtools/gcc=
/gcc-arm-11.2/0001-Fix-install-path-of-linux64.h.patch
> new file mode 100644
> index 000000000000..5bf895d6e719
> --- /dev/null
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0001-Fix-insta=
ll-path-of-linux64.h.patch
> @@ -0,0 +1,33 @@
> +From 58211c7ceb0510b2a11a7f1da3c7fa968c658749 Mon Sep 17 00:00:00 2001
> +From: Andrei Gherzan <andrei.gherzan@huawei.com>
> +Date: Wed, 22 Dec 2021 12:49:25 +0100
> +Subject: [PATCH] Fix install path of linux64.h
> +
> +We add linux64.h to tm includes[1] as a relative path to B. This patch
> +adapts the install path of linux64.h to match the include in tm.h.
> +
> +[1] 0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
> +
> +Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> +
> +Upstream-Status: Inappropriate [configuration]
> +---
> + gcc/Makefile.in | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> +index 9b17d120a..d175ec4e3 100644
> +--- a/gcc/Makefile.in
> ++++ b/gcc/Makefile.in
> +@@ -3693,6 +3693,8 @@ install-plugin: installdirs lang.install-plugin s-=
header-vars install-gengtype
> +         "$(srcdir)"/config/* | "$(srcdir)"/common/config/* \
> +         | "$(srcdir)"/c-family/* | "$(srcdir)"/*.def ) \
> +           base=3D`echo "$$path" | sed -e "s|$$srcdirstrip/||"`;; \
> ++        */linux64.h ) \
> ++          base=3D`dirname $$path`;;\
> +         *) base=3D`basename $$path` ;; \
> +         esac; \
> +         dest=3D$(plugin_includedir)/$$base; \
> +--
> +2.25.1
> +
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0001-gc=
c-4.3.1-ARCH_FLAGS_FOR_TARGET.patch b/meta-arm-toolchain/recipes-devtools/g=
cc/gcc-arm-11.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
> similarity index 84%
> rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0001-gcc=
-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
> rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0001-gcc-4=
.3.1-ARCH_FLAGS_FOR_TARGET.patch
> index 6beedacf6691..0a108ee51b13 100644
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0001-gcc-4.3.1=
-ARCH_FLAGS_FOR_TARGET.patch
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0001-gcc-4.3.1=
-ARCH_FLAGS_FOR_TARGET.patch
> @@ -1,4 +1,4 @@
> -From 2b4a66cbe0bd52e77b37dbaee46e2605d3854412 Mon Sep 17 00:00:00 2001
> +From 368eaf1846733a9920c7cf5bc547a377e7167785 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 29 Mar 2013 08:37:11 +0400
>  Subject: [PATCH] gcc-4.3.1: ARCH_FLAGS_FOR_TARGET
> @@ -12,10 +12,10 @@ Upstream-Status: Inappropriate [embedded specific]
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/configure b/configure
> -index f2ec106a86e..9350b0cf3ed 100755
> +index 504f6410274..bcebad264ec 100755
>  --- a/configure
>  +++ b/configure
> -@@ -7723,7 +7723,7 @@ fi
> +@@ -9728,7 +9728,7 @@ fi
>   # for target_alias and gcc doesn't manage it consistently.
>   target_configargs=3D"--cache-file=3D./config.cache ${target_configargs}=
"
>
> @@ -25,10 +25,10 @@ index f2ec106a86e..9350b0cf3ed 100755
>    *" newlib "*)
>     case " $target_configargs " in
>  diff --git a/configure.ac b/configure.ac
> -index 115db3f402a..5ef61255710 100644
> +index 088e735c5db..1289fe08760 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -3228,7 +3228,7 @@ fi
> +@@ -3240,7 +3240,7 @@ fi
>   # for target_alias and gcc doesn't manage it consistently.
>   target_configargs=3D"--cache-file=3D./config.cache ${target_configargs}=
"
>
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0002-CV=
E-2021-42574.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0=
002-CVE-2021-42574.patch
> new file mode 100644
> index 000000000000..9bad81d4d048
> --- /dev/null
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0002-CVE-2021-=
42574.patch
> @@ -0,0 +1,1765 @@
> +From 51c500269bf53749b107807d84271385fad35628 Mon Sep 17 00:00:00 2001
> +From: Marek Polacek <polacek@redhat.com>
> +Date: Wed, 6 Oct 2021 14:33:59 -0400
> +Subject: [PATCH] libcpp: Implement -Wbidi-chars for CVE-2021-42574 [PR10=
3026]
> +
> +From a link below:
> +"An issue was discovered in the Bidirectional Algorithm in the Unicode
> +Specification through 14.0. It permits the visual reordering of
> +characters via control sequences, which can be used to craft source code
> +that renders different logic than the logical ordering of tokens
> +ingested by compilers and interpreters. Adversaries can leverage this to
> +encode source code for compilers accepting Unicode such that targeted
> +vulnerabilities are introduced invisibly to human reviewers."
> +
> +More info:
> +https://nvd.nist.gov/vuln/detail/CVE-2021-42574
> +https://trojansource.codes/
> +
> +This is not a compiler bug.  However, to mitigate the problem, this patc=
h
> +implements -Wbidi-chars=3D[none|unpaired|any] to warn about possibly
> +misleading Unicode bidirectional control characters the preprocessor may
> +encounter.
> +
> +The default is =3Dunpaired, which warns about improperly terminated
> +bidirectional control characters; e.g. a LRE without its corresponding P=
DF.
> +The level =3Dany warns about any use of bidirectional control characters=
.
> +
> +This patch handles both UCNs and UTF-8 characters.  UCNs designating
> +bidi characters in identifiers are accepted since r204886.  Then r217144
> +enabled -fextended-identifiers by default.  Extended characters in C/C++
> +identifiers have been accepted since r275979.  However, this patch still
> +warns about mixing UTF-8 and UCN bidi characters; there seems to be no
> +good reason to allow mixing them.
> +
> +We warn in different contexts: comments (both C and C++-style), string
> +literals, character constants, and identifiers.  Expectedly, UCNs are ig=
nored
> +in comments and raw string literals.  The bidirectional control characte=
rs
> +can nest so this patch handles that as well.
> +
> +I have not included nor tested this at all with Fortran (which also has
> +string literals and line comments).
> +
> +Dave M. posted patches improving diagnostic involving Unicode characters=
.
> +This patch does not make use of this new infrastructure yet.
> +
> +       PR preprocessor/103026
> +
> +gcc/c-family/ChangeLog:
> +
> +       * c.opt (Wbidi-chars, Wbidi-chars=3D): New option.
> +
> +gcc/ChangeLog:
> +
> +       * doc/invoke.texi: Document -Wbidi-chars.
> +
> +libcpp/ChangeLog:
> +
> +       * include/cpplib.h (enum cpp_bidirectional_level): New.
> +       (struct cpp_options): Add cpp_warn_bidirectional.
> +       (enum cpp_warning_reason): Add CPP_W_BIDIRECTIONAL.
> +       * internal.h (struct cpp_reader): Add warn_bidi_p member
> +       function.
> +       * init.c (cpp_create_reader): Set cpp_warn_bidirectional.
> +       * lex.c (bidi): New namespace.
> +       (get_bidi_utf8): New function.
> +       (get_bidi_ucn): Likewise.
> +       (maybe_warn_bidi_on_close): Likewise.
> +       (maybe_warn_bidi_on_char): Likewise.
> +       (_cpp_skip_block_comment): Implement warning about bidirectional
> +       control characters.
> +       (skip_line_comment): Likewise.
> +       (forms_identifier_p): Likewise.
> +       (lex_identifier): Likewise.
> +       (lex_string): Likewise.
> +       (lex_raw_string): Likewise.
> +
> +gcc/testsuite/ChangeLog:
> +
> +       * c-c++-common/Wbidi-chars-1.c: New test.
> +       * c-c++-common/Wbidi-chars-2.c: New test.
> +       * c-c++-common/Wbidi-chars-3.c: New test.
> +       * c-c++-common/Wbidi-chars-4.c: New test.
> +       * c-c++-common/Wbidi-chars-5.c: New test.
> +       * c-c++-common/Wbidi-chars-6.c: New test.
> +       * c-c++-common/Wbidi-chars-7.c: New test.
> +       * c-c++-common/Wbidi-chars-8.c: New test.
> +       * c-c++-common/Wbidi-chars-9.c: New test.
> +       * c-c++-common/Wbidi-chars-10.c: New test.
> +       * c-c++-common/Wbidi-chars-11.c: New test.
> +       * c-c++-common/Wbidi-chars-12.c: New test.
> +       * c-c++-common/Wbidi-chars-13.c: New test.
> +       * c-c++-common/Wbidi-chars-14.c: New test.
> +       * c-c++-common/Wbidi-chars-15.c: New test.
> +       * c-c++-common/Wbidi-chars-16.c: New test.
> +       * c-c++-common/Wbidi-chars-17.c: New test.
> +
> +CVE: CVE-2021-42574
> +Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=3Dgcc.gi=
t;h=3D51c500269bf53749b107807d84271385fad35628]
> +Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> +
> +---
> + gcc/c-family/c.opt                          |  24 ++
> + gcc/doc/invoke.texi                         |  21 +-
> + gcc/testsuite/c-c++-common/Wbidi-chars-1.c  |  12 +
> + gcc/testsuite/c-c++-common/Wbidi-chars-10.c |  27 ++
> + gcc/testsuite/c-c++-common/Wbidi-chars-11.c |  13 +
> + gcc/testsuite/c-c++-common/Wbidi-chars-12.c |  19 +
> + gcc/testsuite/c-c++-common/Wbidi-chars-13.c |  17 +
> + gcc/testsuite/c-c++-common/Wbidi-chars-14.c |  38 ++
> + gcc/testsuite/c-c++-common/Wbidi-chars-15.c |  59 +++
> + gcc/testsuite/c-c++-common/Wbidi-chars-16.c |  26 ++
> + gcc/testsuite/c-c++-common/Wbidi-chars-17.c |  30 ++
> + gcc/testsuite/c-c++-common/Wbidi-chars-2.c  |   9 +
> + gcc/testsuite/c-c++-common/Wbidi-chars-3.c  |  11 +
> + gcc/testsuite/c-c++-common/Wbidi-chars-4.c  | 188 +++++++++
> + gcc/testsuite/c-c++-common/Wbidi-chars-5.c  | 188 +++++++++
> + gcc/testsuite/c-c++-common/Wbidi-chars-6.c  | 155 ++++++++
> + gcc/testsuite/c-c++-common/Wbidi-chars-7.c  |   9 +
> + gcc/testsuite/c-c++-common/Wbidi-chars-8.c  |  13 +
> + gcc/testsuite/c-c++-common/Wbidi-chars-9.c  |  29 ++
> + libcpp/include/cpplib.h                     |  18 +-
> + libcpp/init.c                               |   1 +
> + libcpp/internal.h                           |   7 +
> + libcpp/lex.c                                | 408 +++++++++++++++++++-
> + 23 files changed, 1315 insertions(+), 7 deletions(-)
> + create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-1.c
> + create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-10.c
> + create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-11.c
> + create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-12.c
> + create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-13.c
> + create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-14.c
> + create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-15.c
> + create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-16.c
> + create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-17.c
> + create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-2.c
> + create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-3.c
> + create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-4.c
> + create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-5.c
> + create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-6.c
> + create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-7.c
> + create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-8.c
> + create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-9.c
> +
> +diff --git a/gcc/c-family/c.opt b/gcc/c-family/c.opt
> +index 8a4cd634f77..3976fc368db 100644
> +--- a/gcc/c-family/c.opt
> ++++ b/gcc/c-family/c.opt
> +@@ -370,6 +370,30 @@ Wbad-function-cast
> + C ObjC Var(warn_bad_function_cast) Warning
> + Warn about casting functions to incompatible types.
> +
> ++Wbidi-chars
> ++C ObjC C++ ObjC++ Warning Alias(Wbidi-chars=3D,any,none)
> ++;
> ++
> ++Wbidi-chars=3D
> ++C ObjC C++ ObjC++ RejectNegative Joined Warning CPP(cpp_warn_bidirectio=
nal) CppReason(CPP_W_BIDIRECTIONAL) Var(warn_bidirectional) Init(bidirectio=
nal_unpaired) Enum(cpp_bidirectional_level)
> ++-Wbidi-chars=3D[none|unpaired|any] Warn about UTF-8 bidirectional contr=
ol characters.
> ++
> ++; Required for these enum values.
> ++SourceInclude
> ++cpplib.h
> ++
> ++Enum
> ++Name(cpp_bidirectional_level) Type(int) UnknownError(argument %qs to %<=
-Wbidi-chars%> not recognized)
> ++
> ++EnumValue
> ++Enum(cpp_bidirectional_level) String(none) Value(bidirectional_none)
> ++
> ++EnumValue
> ++Enum(cpp_bidirectional_level) String(unpaired) Value(bidirectional_unpa=
ired)
> ++
> ++EnumValue
> ++Enum(cpp_bidirectional_level) String(any) Value(bidirectional_any)
> ++
> + Wbool-compare
> + C ObjC C++ ObjC++ Var(warn_bool_compare) Warning LangEnabledBy(C ObjC C=
++ ObjC++,Wall)
> + Warn about boolean expression compared with an integer value different =
from true/false.
> +diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
> +index 6070288856c..a22758d18ee 100644
> +--- a/gcc/doc/invoke.texi
> ++++ b/gcc/doc/invoke.texi
> +@@ -326,7 +326,9 @@ Objective-C and Objective-C++ Dialects}.
> + -Warith-conversion @gol
> + -Warray-bounds  -Warray-bounds=3D@var{n} @gol
> + -Wno-attributes  -Wattribute-alias=3D@var{n} -Wno-attribute-alias @gol
> +--Wno-attribute-warning  -Wbool-compare  -Wbool-operation @gol
> ++-Wno-attribute-warning  @gol
> ++-Wbidi-chars=3D@r{[}none@r{|}unpaired@r{|}any@r{]} @gol
> ++-Wbool-compare  -Wbool-operation @gol
> + -Wno-builtin-declaration-mismatch @gol
> + -Wno-builtin-macro-redefined  -Wc90-c99-compat  -Wc99-c11-compat @gol
> + -Wc11-c2x-compat @gol
> +@@ -7559,6 +7561,23 @@ Attributes considered include @code{allo
> + This is the default.  You can disable these warnings with either
> + @option{-Wno-attribute-alias} or @option{-Wattribute-alias=3D0}.
> +
> ++@item -Wbidi-chars=3D@r{[}none@r{|}unpaired@r{|}any@r{]}
> ++@opindex Wbidi-chars=3D
> ++@opindex Wbidi-chars
> ++@opindex Wno-bidi-chars
> ++Warn about possibly misleading UTF-8 bidirectional control characters i=
n
> ++comments, string literals, character constants, and identifiers.  Such
> ++characters can change left-to-right writing direction into right-to-lef=
t
> ++(and vice versa), which can cause confusion between the logical order a=
nd
> ++visual order.  This may be dangerous; for instance, it may seem that a =
piece
> ++of code is not commented out, whereas it in fact is.
> ++
> ++There are three levels of warning supported by GCC@.  The default is
> ++@option{-Wbidi-chars=3Dunpaired}, which warns about improperly terminat=
ed
> ++bidi contexts.  @option{-Wbidi-chars=3Dnone} turns the warning off.
> ++@option{-Wbidi-chars=3Dany} warns about any use of bidirectional contro=
l
> ++characters.
> ++
> + @item -Wbool-compare
> + @opindex Wno-bool-compare
> + @opindex Wbool-compare
> +diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-10.c b/gcc/testsuite=
/c-c++-common/Wbidi-chars-10.c
> +new file mode 100644
> +index 00000000000..34f5ac19271
> +--- /dev/null
> ++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-10.c
> +@@ -0,0 +1,27 @@
> ++/* PR preprocessor/103026 */
> ++/* { dg-do compile } */
> ++/* { dg-options "-Wbidi-chars=3Dunpaired" } */
> ++/* More nesting testing.  */
> ++
> ++/* RLE=C3=A2=C2=AB LRI=C3=A2=C2=A6 PDF=C3=A2=C2=AC PDI=C3=A2=C2=A9*/
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++int LRE_\u202a_PDF_\u202c;
> ++int LRE_\u202a_PDF_\u202c_LRE_\u202a_PDF_\u202c;
> ++int LRE_\u202a_LRI_\u2066_PDF_\u202c_PDI_\u2069;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++int RLE_\u202b_RLI_\u2067_PDF_\u202c_PDI_\u2069;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++int RLE_\u202b_RLI_\u2067_PDI_\u2069_PDF_\u202c;
> ++int FSI_\u2068_LRO_\u202d_PDI_\u2069_PDF_\u202c;
> ++int FSI_\u2068;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++int FSI_\u2068_PDI_\u2069;
> ++int FSI_\u2068_FSI_\u2068_PDI_\u2069;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++int RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_R=
LI_\u2067_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069=
_PDI_\u2069;
> ++int RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_R=
LI_\u2067_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069=
;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++int RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_R=
LI_\u2067_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069=
_PDF_\u202c;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++int RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_FSI_\u2068_PDI_\u2069_P=
DI_\u2069_PDI_\u2069_PDI_\u2069;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> +diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-11.c b/gcc/testsuite=
/c-c++-common/Wbidi-chars-11.c
> +new file mode 100644
> +index 00000000000..270ce2368a9
> +--- /dev/null
> ++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-11.c
> +@@ -0,0 +1,13 @@
> ++/* PR preprocessor/103026 */
> ++/* { dg-do compile } */
> ++/* { dg-options "-Wbidi-chars=3Dunpaired" } */
> ++/* Test that we warn when mixing UCN and UTF-8.  */
> ++
> ++int LRE_=C3=A2=C2=AA_PDF_\u202c;
> ++/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
> ++int LRE_\u202a_PDF_=C3=A2=C2=AC_;
> ++/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
> ++const char *s1 =3D "LRE_=C3=A2=C2=AA_PDF_\u202c";
> ++/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
> ++const char *s2 =3D "LRE_\u202a_PDF_=C3=A2=C2=AC";
> ++/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
> +diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-12.c b/gcc/testsuite=
/c-c++-common/Wbidi-chars-12.c
> +new file mode 100644
> +index 00000000000..b07eec1da91
> +--- /dev/null
> ++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-12.c
> +@@ -0,0 +1,19 @@
> ++/* PR preprocessor/103026 */
> ++/* { dg-do compile { target { c || c++11 } } } */
> ++/* { dg-options "-Wbidi-chars=3Dany" } */
> ++/* Test raw strings.  */
> ++
> ++const char *s1 =3D R"(a b c LRE=C3=A2=C2=AA 1 2 3 PDF=C3=A2=C2=AC x y z=
)";
> ++/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
> ++const char *s2 =3D R"(a b c RLE=C3=A2=C2=AB 1 2 3 PDF=C3=A2=C2=AC x y z=
)";
> ++/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
> ++const char *s3 =3D R"(a b c LRO=C3=A2=C2=AD 1 2 3 PDF=C3=A2=C2=AC x y z=
)";
> ++/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
> ++const char *s4 =3D R"(a b c RLO=C3=A2=C2=AE 1 2 3 PDF=C3=A2=C2=AC x y z=
)";
> ++/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
> ++const char *s7 =3D R"(a b c FSI=C3=A2=C2=A8 1 2 3 PDI=C3=A2=C2=A9 x y) =
z";
> ++/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
> ++const char *s8 =3D R"(a b c PDI=C3=A2=C2=A9 x y )z";
> ++/* { dg-warning "U\\+2069" "" { target *-*-* } .-1 } */
> ++const char *s9 =3D R"(a b c PDF=C3=A2=C2=AC x y z)";
> ++/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
> +diff -uprN '-x*.orig' '-x*.rej' del/gcc-11.2.0/gcc/testsuite/c-c++-commo=
n/Wbidi-chars-13.c gcc-11.2.0/gcc/testsuite/c-c++-common/Wbidi-chars-13.c
> +--- del/gcc-11.2.0/gcc/testsuite/c-c++-common/Wbidi-chars-13.c 1969-12-3=
1 16:00:00.000000000 -0800
> ++++ gcc-11.2.0/gcc/testsuite/c-c++-common/Wbidi-chars-13.c     2021-12-1=
3 23:11:22.328439287 -0800
> +@@ -0,0 +1,17 @@
> ++/* PR preprocessor/103026 */
> ++/* { dg-do compile { target { c || c++11 } } } */
> ++/* { dg-options "-Wbidi-chars=3Dunpaired" } */
> ++/* Test raw strings.  */
> ++
> ++const char *s1 =3D R"(a b c LRE=C3=A2=C2=AA 1 2 3)";
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++const char *s2 =3D R"(a b c RLE=C3=A2=C2=AB 1 2 3)";
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++const char *s3 =3D R"(a b c LRO=C3=A2=C2=AD 1 2 3)";
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++const char *s4 =3D R"(a b c FSI=C3=A2=C2=A8 1 2 3)";
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++const char *s5 =3D R"(a b c LRI=C3=A2=C2=A6 1 2 3)";
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++const char *s6 =3D R"(a b c RLI=C3=A2=C2=A7 1 2 3)";
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> +diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-14.c b/gcc/testsuite=
/c-c++-common/Wbidi-chars-14.c
> +new file mode 100644
> +index 00000000000..ba5f75d9553
> +--- /dev/null
> ++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-14.c
> +@@ -0,0 +1,38 @@
> ++/* PR preprocessor/103026 */
> ++/* { dg-do compile } */
> ++/* { dg-options "-Wbidi-chars=3Dunpaired" } */
> ++/* Test PDI handling, which also pops any subsequent LREs, RLEs, LROs,
> ++   or RLOs.  */
> ++
> ++/* LRI_=C3=A2=C2=A6_LRI_=C3=A2=C2=A6_RLE_=C3=A2=C2=AB_RLE_=C3=A2=C2=AB_=
RLE_=C3=A2=C2=AB_PDI_=C3=A2=C2=A9*/
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++// LRI_=C3=A2=C2=A6_RLE_=C3=A2=C2=AB_RLE_=C3=A2=C2=AB_RLE_=C3=A2=C2=AB_=
PDI_=C3=A2=C2=A9
> ++// LRI_=C3=A2=C2=A6_RLO_=C3=A2=C2=AE_RLE_=C3=A2=C2=AB_RLE_=C3=A2=C2=AB_=
PDI_=C3=A2=C2=A9
> ++// LRI_=C3=A2=C2=A6_RLO_=C3=A2=C2=AE_RLE_=C3=A2=C2=AB_PDI_=C3=A2=C2=A9
> ++// FSI_=C3=A2=C2=A8_RLO_=C3=A2=C2=AE_PDI_=C3=A2=C2=A9
> ++// FSI_=C3=A2=C2=A8_FSI_=C3=A2=C2=A8_RLO_=C3=A2=C2=AE_PDI_=C3=A2=C2=A9
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++
> ++int LRI_\u2066_LRI_\u2066_LRE_\u202a_LRE_\u202a_LRE_\u202a_PDI_\u2069;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++int LRI_\u2066_LRI_\u2066_LRE_\u202a_LRE_\u202a_LRE_\u202a_PDI_\u2069_P=
DI_\u2069;
> ++int LRI_\u2066_LRI_\u2066_LRI_\u2066_LRE_\u202a_LRE_\u202a_LRE_\u202a_P=
DI_\u2069_PDI_\u2069;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++int PDI_\u2069;
> ++int LRI_\u2066_PDI_\u2069;
> ++int RLI_\u2067_PDI_\u2069;
> ++int LRE_\u202a_LRI_\u2066_PDI_\u2069;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++int LRI_\u2066_LRE_\u202a_PDF_\u202c_PDI_\u2069;
> ++int LRI_\u2066_LRE_\u202a_LRE_\u202a_PDF_\u202c_PDI_\u2069;
> ++int RLI_\u2067_LRI_\u2066_LRE_\u202a_LRE_\u202a_PDF_\u202c_PDI_\u2069;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++int FSI_\u2068_LRI_\u2066_LRE_\u202a_LRE_\u202a_PDF_\u202c_PDI_\u2069;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++int RLO_\u202e_PDI_\u2069;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++int RLI_\u2067_PDI_\u2069_RLI_\u2067;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++int FSI_\u2068_PDF_\u202c_PDI_\u2069;
> ++int FSI_\u2068_FSI_\u2068_PDF_\u202c_PDI_\u2069;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> +diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-15.c b/gcc/testsuite=
/c-c++-common/Wbidi-chars-15.c
> +new file mode 100644
> +index 00000000000..a0ce8ff5e2c
> +--- /dev/null
> ++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-15.c
> +@@ -0,0 +1,59 @@
> ++/* PR preprocessor/103026 */
> ++/* { dg-do compile } */
> ++/* { dg-options "-Wbidi-chars=3Dunpaired" } */
> ++/* Test unpaired bidi control chars in multiline comments.  */
> ++
> ++/*
> ++ * LRE=C3=A2=C2=AA end
> ++ */
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
> ++/*
> ++ * RLE=C3=A2=C2=AB end
> ++ */
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
> ++/*
> ++ * LRO=C3=A2=C2=AD end
> ++ */
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
> ++/*
> ++ * RLO=C3=A2=C2=AE end
> ++ */
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
> ++/*
> ++ * LRI=C3=A2=C2=A6 end
> ++ */
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
> ++/*
> ++ * RLI=C3=A2=C2=A7 end
> ++ */
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
> ++/*
> ++ * FSI=C3=A2=C2=A8 end
> ++ */
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
> ++/* LRE=C3=A2=C2=AA
> ++   PDF=C3=A2=C2=AC */
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
> ++/* FSI=C3=A2=C2=A8
> ++   PDI=C3=A2=C2=A9 */
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
> ++
> ++/* LRE<=C3=A2=C2=AA>
> ++ *
> ++ */
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-3 } */
> ++
> ++/*
> ++ * LRE<=C3=A2=C2=AA>
> ++ */
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
> ++
> ++/*
> ++ *
> ++ * LRE<=C3=A2=C2=AA> */
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++
> ++/* RLI<=C3=A2=C2=A7> */ /* PDI<=C3=A2=C2=A9> */
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++/* LRE<=C3=A2=C2=AA> */ /* PDF<=C3=A2=C2=AC> */
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> +diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-16.c b/gcc/testsuite=
/c-c++-common/Wbidi-chars-16.c
> +new file mode 100644
> +index 00000000000..baa0159861c
> +--- /dev/null
> ++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-16.c
> +@@ -0,0 +1,26 @@
> ++/* PR preprocessor/103026 */
> ++/* { dg-do compile } */
> ++/* { dg-options "-Wbidi-chars=3Dany" } */
> ++/* Test LTR/RTL chars.  */
> ++
> ++/* LTR<=C3=A2> */
> ++/* { dg-warning "U\\+200E" "" { target *-*-* } .-1 } */
> ++// LTR<=C3=A2>
> ++/* { dg-warning "U\\+200E" "" { target *-*-* } .-1 } */
> ++/* RTL<=C3=A2> */
> ++/* { dg-warning "U\\+200F" "" { target *-*-* } .-1 } */
> ++// RTL<=C3=A2>
> ++/* { dg-warning "U\\+200F" "" { target *-*-* } .-1 } */
> ++
> ++const char *s1 =3D "LTR<=C3=A2>";
> ++/* { dg-warning "U\\+200E" "" { target *-*-* } .-1 } */
> ++const char *s2 =3D "LTR\u200e";
> ++/* { dg-warning "U\\+200E" "" { target *-*-* } .-1 } */
> ++const char *s3 =3D "LTR\u200E";
> ++/* { dg-warning "U\\+200E" "" { target *-*-* } .-1 } */
> ++const char *s4 =3D "RTL<=C3=A2>";
> ++/* { dg-warning "U\\+200F" "" { target *-*-* } .-1 } */
> ++const char *s5 =3D "RTL\u200f";
> ++/* { dg-warning "U\\+200F" "" { target *-*-* } .-1 } */
> ++const char *s6 =3D "RTL\u200F";
> ++/* { dg-warning "U\\+200F" "" { target *-*-* } .-1 } */
> +diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-17.c b/gcc/testsuite=
/c-c++-common/Wbidi-chars-17.c
> +new file mode 100644
> +index 00000000000..07cb4321f96
> +--- /dev/null
> ++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-17.c
> +@@ -0,0 +1,30 @@
> ++/* PR preprocessor/103026 */
> ++/* { dg-do compile } */
> ++/* { dg-options "-Wbidi-chars=3Dunpaired" } */
> ++/* Test LTR/RTL chars.  */
> ++
> ++/* LTR<=C3=A2> */
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++// LTR<=C3=A2>
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++/* RTL<=C3=A2> */
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++// RTL<=C3=A2>
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++int ltr_\u200e;
> ++/* { dg-error "universal character " "" { target *-*-* } .-1 } */
> ++int rtl_\u200f;
> ++/* { dg-error "universal character " "" { target *-*-* } .-1 } */
> ++
> ++const char *s1 =3D "LTR<=C3=A2>";
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++const char *s2 =3D "LTR\u200e";
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++const char *s3 =3D "LTR\u200E";
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++const char *s4 =3D "RTL<=C3=A2>";
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++const char *s5 =3D "RTL\u200f";
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++const char *s6 =3D "RTL\u200F";
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> +diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-1.c b/gcc/testsuite/=
c-c++-common/Wbidi-chars-1.c
> +new file mode 100644
> +index 00000000000..2340374f276
> +--- /dev/null
> ++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-1.c
> +@@ -0,0 +1,12 @@
> ++/* PR preprocessor/103026 */
> ++/* { dg-do compile } */
> ++
> ++int main() {
> ++    int isAdmin =3D 0;
> ++    /*=C3=A2=C2=AE } =C3=A2=C2=A6if (isAdmin)=C3=A2=C2=A9 =C3=A2=C2=A6 =
begin admins only */
> ++/* { dg-warning "bidirectional" "" { target *-*-* } .-1 } */
> ++        __builtin_printf("You are an admin.\n");
> ++    /* end admins only =C3=A2=C2=AE { =C3=A2=C2=A6*/
> ++/* { dg-warning "bidirectional" "" { target *-*-* } .-1 } */
> ++    return 0;
> ++}
> +diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-2.c b/gcc/testsuite/=
c-c++-common/Wbidi-chars-2.c
> +new file mode 100644
> +index 00000000000..2340374f276
> +--- /dev/null
> ++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-2.c
> +@@ -0,0 +1,9 @@
> ++/* PR preprocessor/103026 */
> ++/* { dg-do compile } */
> ++
> ++int main() {
> ++    /* Say hello; newline=C3=A2=C2=A7/*/ return 0 ;
> ++/* { dg-warning "bidirectional" "" { target *-*-* } .-1 } */
> ++    __builtin_printf("Hello world.\n");
> ++    return 0;
> ++}
> +diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-3.c b/gcc/testsuite/=
c-c++-common/Wbidi-chars-3.c
> +new file mode 100644
> +index 00000000000..9dc7edb6e64
> +--- /dev/null
> ++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-3.c
> +@@ -0,0 +1,11 @@
> ++/* PR preprocessor/103026 */
> ++/* { dg-do compile } */
> ++
> ++int main() {
> ++    const char* access_level =3D "user";
> ++    if (__builtin_strcmp(access_level, "user=C3=A2=C2=AE =C3=A2=C2=A6//=
 Check if admin=C3=A2=C2=A9 =C3=A2=C2=A6")) {
> ++/* { dg-warning "bidirectional" "" { target *-*-* } .-1 } */
> ++        __builtin_printf("You are an admin.\n");
> ++    }
> ++    return 0;
> ++}
> +diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-4.c b/gcc/testsuite/=
c-c++-common/Wbidi-chars-4.c
> +new file mode 100644
> +index 00000000000..639e5c62e88
> +--- /dev/null
> ++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-4.c
> +@@ -0,0 +1,188 @@
> ++/* PR preprocessor/103026 */
> ++/* { dg-do compile } */
> ++/* { dg-options "-Wbidi-chars=3Dany -Wno-multichar -Wno-overflow" } */
> ++/* Test all bidi chars in various contexts (identifiers, comments,
> ++   string literals, character constants), both UCN and UTF-8.  The bidi
> ++   chars here are properly terminated, except for the character constan=
ts.  */
> ++
> ++/* a b c LRE=C3=A2=C2=AA 1 2 3 PDF=C3=A2=C2=AC x y z */
> ++/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
> ++/* a b c RLE=C3=A2=C2=AB 1 2 3 PDF=C3=A2=C2=AC x y z */
> ++/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
> ++/* a b c LRO=C3=A2=C2=AD 1 2 3 PDF=C3=A2=C2=AC x y z */
> ++/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
> ++/* a b c RLO=C3=A2=C2=AE 1 2 3 PDF=C3=A2=C2=AC x y z */
> ++/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
> ++/* a b c LRI=C3=A2=C2=A6 1 2 3 PDI=C3=A2=C2=A9 x y z */
> ++/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
> ++/* a b c RLI=C3=A2=C2=A7 1 2 3 PDI=C3=A2=C2=A9 x y */
> ++/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
> ++/* a b c FSI=C3=A2=C2=A8 1 2 3 PDI=C3=A2=C2=A9 x y z */
> ++/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
> ++
> ++/* Same but C++ comments instead.  */
> ++// a b c LRE=C3=A2=C2=AA 1 2 3 PDF=C3=A2=C2=AC x y z
> ++/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
> ++// a b c RLE=C3=A2=C2=AB 1 2 3 PDF=C3=A2=C2=AC x y z
> ++/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
> ++// a b c LRO=C3=A2=C2=AD 1 2 3 PDF=C3=A2=C2=AC x y z
> ++/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
> ++// a b c RLO=C3=A2=C2=AE 1 2 3 PDF=C3=A2=C2=AC x y z
> ++/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
> ++// a b c LRI=C3=A2=C2=A6 1 2 3 PDI=C3=A2=C2=A9 x y z
> ++/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
> ++// a b c RLI=C3=A2=C2=A7 1 2 3 PDI=C3=A2=C2=A9 x y
> ++/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
> ++// a b c FSI=C3=A2=C2=A8 1 2 3 PDI=C3=A2=C2=A9 x y z
> ++/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
> ++
> ++/* Here we're closing an unopened context, warn when =3Dany.  */
> ++/* a b c PDI=C3=A2=C2=A9 x y z */
> ++/* { dg-warning "U\\+2069" "" { target *-*-* } .-1 } */
> ++/* a b c PDF=C3=A2=C2=AC x y z */
> ++/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
> ++// a b c PDI=C3=A2=C2=A9 x y z
> ++/* { dg-warning "U\\+2069" "" { target *-*-* } .-1 } */
> ++// a b c PDF=C3=A2=C2=AC x y z
> ++/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
> ++
> ++/* Multiline comments.  */
> ++/* a b c PDI=C3=A2=C2=A9 x y z
> ++   */
> ++/* { dg-warning "U\\+2069" "" { target *-*-* } .-2 } */
> ++/* a b c PDF=C3=A2=C2=AC x y z
> ++   */
> ++/* { dg-warning "U\\+202C" "" { target *-*-* } .-2 } */
> ++/* first
> ++   a b c PDI=C3=A2=C2=A9 x y z
> ++   */
> ++/* { dg-warning "U\\+2069" "" { target *-*-* } .-2 } */
> ++/* first
> ++   a b c PDF=C3=A2=C2=AC x y z
> ++   */
> ++/* { dg-warning "U\\+202C" "" { target *-*-* } .-2 } */
> ++/* first
> ++   a b c PDI=C3=A2=C2=A9 x y z */
> ++/* { dg-warning "U\\+2069" "" { target *-*-* } .-1 } */
> ++/* first
> ++   a b c PDF=C3=A2=C2=AC x y z */
> ++/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
> ++
> ++void
> ++g1 ()
> ++{
> ++  const char *s1 =3D "a b c LRE=C3=A2=C2=AA 1 2 3 PDF=C3=A2=C2=AC x y z=
";
> ++/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
> ++  const char *s2 =3D "a b c RLE=C3=A2=C2=AB 1 2 3 PDF=C3=A2=C2=AC x y z=
";
> ++/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
> ++  const char *s3 =3D "a b c LRO=C3=A2=C2=AD 1 2 3 PDF=C3=A2=C2=AC x y z=
";
> ++/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
> ++  const char *s4 =3D "a b c RLO=C3=A2=C2=AE 1 2 3 PDF=C3=A2=C2=AC x y z=
";
> ++/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
> ++  const char *s5 =3D "a b c LRI=C3=A2=C2=A6 1 2 3 PDI=C3=A2=C2=A9 x y z=
";
> ++/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
> ++  const char *s6 =3D "a b c RLI=C3=A2=C2=A7 1 2 3 PDI=C3=A2=C2=A9 x y z=
";
> ++/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
> ++  const char *s7 =3D "a b c FSI=C3=A2=C2=A8 1 2 3 PDI=C3=A2=C2=A9 x y z=
";
> ++/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
> ++  const char *s8 =3D "a b c PDI=C3=A2=C2=A9 x y z";
> ++/* { dg-warning "U\\+2069" "" { target *-*-* } .-1 } */
> ++  const char *s9 =3D "a b c PDF=C3=A2=C2=AC x y z";
> ++/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
> ++
> ++  const char *s10 =3D "a b c LRE\u202a 1 2 3 PDF\u202c x y z";
> ++/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
> ++  const char *s11 =3D "a b c LRE\u202A 1 2 3 PDF\u202c x y z";
> ++/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
> ++  const char *s12 =3D "a b c RLE\u202b 1 2 3 PDF\u202c x y z";
> ++/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
> ++  const char *s13 =3D "a b c RLE\u202B 1 2 3 PDF\u202c x y z";
> ++/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
> ++  const char *s14 =3D "a b c LRO\u202d 1 2 3 PDF\u202c x y z";
> ++/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
> ++  const char *s15 =3D "a b c LRO\u202D 1 2 3 PDF\u202c x y z";
> ++/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
> ++  const char *s16 =3D "a b c RLO\u202e 1 2 3 PDF\u202c x y z";
> ++/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
> ++  const char *s17 =3D "a b c RLO\u202E 1 2 3 PDF\u202c x y z";
> ++/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
> ++  const char *s18 =3D "a b c LRI\u2066 1 2 3 PDI\u2069 x y z";
> ++/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
> ++  const char *s19 =3D "a b c RLI\u2067 1 2 3 PDI\u2069 x y z";
> ++/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
> ++  const char *s20 =3D "a b c FSI\u2068 1 2 3 PDI\u2069 x y z";
> ++/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
> ++}
> ++
> ++void
> ++g2 ()
> ++{
> ++  const char c1 =3D '\u202a';
> ++/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
> ++  const char c2 =3D '\u202A';
> ++/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
> ++  const char c3 =3D '\u202b';
> ++/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
> ++  const char c4 =3D '\u202B';
> ++/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
> ++  const char c5 =3D '\u202d';
> ++/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
> ++  const char c6 =3D '\u202D';
> ++/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
> ++  const char c7 =3D '\u202e';
> ++/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
> ++  const char c8 =3D '\u202E';
> ++/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
> ++  const char c9 =3D '\u2066';
> ++/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
> ++  const char c10 =3D '\u2067';
> ++/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
> ++  const char c11 =3D '\u2068';
> ++/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
> ++}
> ++
> ++int a=C3=A2=C2=AAb=C3=A2=C2=ACc;
> ++/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
> ++int a=C3=A2=C2=ABb=C3=A2=C2=ACc;
> ++/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
> ++int a=C3=A2=C2=ADb=C3=A2=C2=ACc;
> ++/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
> ++int a=C3=A2=C2=AEb=C3=A2=C2=ACc;
> ++/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
> ++int a=C3=A2=C2=A6b=C3=A2=C2=A9c;
> ++/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
> ++int a=C3=A2=C2=A7b=C3=A2=C2=A9c;
> ++/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
> ++int a=C3=A2=C2=A8b=C3=A2=C2=A9c;
> ++/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
> ++int A=C3=A2=C2=ACX;
> ++/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
> ++int A\u202cY;
> ++/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
> ++int A\u202CY2;
> ++/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
> ++
> ++int d\u202ae\u202cf;
> ++/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
> ++int d\u202Ae\u202cf2;
> ++/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
> ++int d\u202be\u202cf;
> ++/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
> ++int d\u202Be\u202cf2;
> ++/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
> ++int d\u202de\u202cf;
> ++/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
> ++int d\u202De\u202cf2;
> ++/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
> ++int d\u202ee\u202cf;
> ++/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
> ++int d\u202Ee\u202cf2;
> ++/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
> ++int d\u2066e\u2069f;
> ++/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
> ++int d\u2067e\u2069f;
> ++/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
> ++int d\u2068e\u2069f;
> ++/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
> ++int X\u2069;
> ++/* { dg-warning "U\\+2069" "" { target *-*-* } .-1 } */
> +diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-5.c b/gcc/testsuite/=
c-c++-common/Wbidi-chars-5.c
> +new file mode 100644
> +index 00000000000..68cb053144b
> +--- /dev/null
> ++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-5.c
> +@@ -0,0 +1,188 @@
> ++/* PR preprocessor/103026 */
> ++/* { dg-do compile } */
> ++/* { dg-options "-Wbidi-chars=3Dunpaired -Wno-multichar -Wno-overflow" =
} */
> ++/* Test all bidi chars in various contexts (identifiers, comments,
> ++   string literals, character constants), both UCN and UTF-8.  The bidi
> ++   chars here are properly terminated, except for the character constan=
ts.  */
> ++
> ++/* a b c LRE=C3=A2=C2=AA 1 2 3 PDF=C3=A2=C2=AC x y z */
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++/* a b c RLE=C3=A2=C2=AB 1 2 3 PDF=C3=A2=C2=AC x y z */
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++/* a b c LRO=C3=A2=C2=AD 1 2 3 PDF=C3=A2=C2=AC x y z */
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++/* a b c RLO=C3=A2=C2=AE 1 2 3 PDF=C3=A2=C2=AC x y z */
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++/* a b c LRI=C3=A2=C2=A6 1 2 3 PDI=C3=A2=C2=A9 x y z */
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++/* a b c RLI=C3=A2=C2=A7 1 2 3 PDI=C3=A2=C2=A9 x y */
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++/* a b c FSI=C3=A2=C2=A8 1 2 3 PDI=C3=A2=C2=A9 x y z */
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++
> ++/* Same but C++ comments instead.  */
> ++// a b c LRE=C3=A2=C2=AA 1 2 3 PDF=C3=A2=C2=AC x y z
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++// a b c RLE=C3=A2=C2=AB 1 2 3 PDF=C3=A2=C2=AC x y z
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++// a b c LRO=C3=A2=C2=AD 1 2 3 PDF=C3=A2=C2=AC x y z
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++// a b c RLO=C3=A2=C2=AE 1 2 3 PDF=C3=A2=C2=AC x y z
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++// a b c LRI=C3=A2=C2=A6 1 2 3 PDI=C3=A2=C2=A9 x y z
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++// a b c RLI=C3=A2=C2=A7 1 2 3 PDI=C3=A2=C2=A9 x y
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++// a b c FSI=C3=A2=C2=A8 1 2 3 PDI=C3=A2=C2=A9 x y z
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++
> ++/* Here we're closing an unopened context, warn when =3Dany.  */
> ++/* a b c PDI=C3=A2=C2=A9 x y z */
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++/* a b c PDF=C3=A2=C2=AC x y z */
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++// a b c PDI=C3=A2=C2=A9 x y z
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++// a b c PDF=C3=A2=C2=AC x y z
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++
> ++/* Multiline comments.  */
> ++/* a b c PDI=C3=A2=C2=A9 x y z
> ++   */
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-2 } */
> ++/* a b c PDF=C3=A2=C2=AC x y z
> ++   */
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-2 } */
> ++/* first
> ++   a b c PDI=C3=A2=C2=A9 x y z
> ++   */
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-2 } */
> ++/* first
> ++   a b c PDF=C3=A2=C2=AC x y z
> ++   */
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-2 } */
> ++/* first
> ++   a b c PDI=C3=A2=C2=A9 x y z */
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++/* first
> ++   a b c PDF=C3=A2=C2=AC x y z */
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++
> ++void
> ++g1 ()
> ++{
> ++  const char *s1 =3D "a b c LRE=C3=A2=C2=AA 1 2 3 PDF=C3=A2=C2=AC x y z=
";
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++  const char *s2 =3D "a b c RLE=C3=A2=C2=AB 1 2 3 PDF=C3=A2=C2=AC x y z=
";
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++  const char *s3 =3D "a b c LRO=C3=A2=C2=AD 1 2 3 PDF=C3=A2=C2=AC x y z=
";
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++  const char *s4 =3D "a b c RLO=C3=A2=C2=AE 1 2 3 PDF=C3=A2=C2=AC x y z=
";
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++  const char *s5 =3D "a b c LRI=C3=A2=C2=A6 1 2 3 PDI=C3=A2=C2=A9 x y z=
";
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++  const char *s6 =3D "a b c RLI=C3=A2=C2=A7 1 2 3 PDI=C3=A2=C2=A9 x y z=
";
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++  const char *s7 =3D "a b c FSI=C3=A2=C2=A8 1 2 3 PDI=C3=A2=C2=A9 x y z=
";
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++  const char *s8 =3D "a b c PDI=C3=A2=C2=A9 x y z";
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++  const char *s9 =3D "a b c PDF=C3=A2=C2=AC x y z";
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++
> ++  const char *s10 =3D "a b c LRE\u202a 1 2 3 PDF\u202c x y z";
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++  const char *s11 =3D "a b c LRE\u202A 1 2 3 PDF\u202c x y z";
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++  const char *s12 =3D "a b c RLE\u202b 1 2 3 PDF\u202c x y z";
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++  const char *s13 =3D "a b c RLE\u202B 1 2 3 PDF\u202c x y z";
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++  const char *s14 =3D "a b c LRO\u202d 1 2 3 PDF\u202c x y z";
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++  const char *s15 =3D "a b c LRO\u202D 1 2 3 PDF\u202c x y z";
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++  const char *s16 =3D "a b c RLO\u202e 1 2 3 PDF\u202c x y z";
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++  const char *s17 =3D "a b c RLO\u202E 1 2 3 PDF\u202c x y z";
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++  const char *s18 =3D "a b c LRI\u2066 1 2 3 PDI\u2069 x y z";
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++  const char *s19 =3D "a b c RLI\u2067 1 2 3 PDI\u2069 x y z";
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++  const char *s20 =3D "a b c FSI\u2068 1 2 3 PDI\u2069 x y z";
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++}
> ++
> ++void
> ++g2 ()
> ++{
> ++  const char c1 =3D '\u202a';
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++  const char c2 =3D '\u202A';
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++  const char c3 =3D '\u202b';
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++  const char c4 =3D '\u202B';
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++  const char c5 =3D '\u202d';
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++  const char c6 =3D '\u202D';
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++  const char c7 =3D '\u202e';
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++  const char c8 =3D '\u202E';
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++  const char c9 =3D '\u2066';
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++  const char c10 =3D '\u2067';
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++  const char c11 =3D '\u2068';
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++}
> ++
> ++int a=C3=A2=C2=AAb=C3=A2=C2=ACc;
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++int a=C3=A2=C2=ABb=C3=A2=C2=ACc;
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++int a=C3=A2=C2=ADb=C3=A2=C2=ACc;
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++int a=C3=A2=C2=AEb=C3=A2=C2=ACc;
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++int a=C3=A2=C2=A6b=C3=A2=C2=A9c;
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++int a=C3=A2=C2=A7b=C3=A2=C2=A9c;
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++int a=C3=A2=C2=A8b=C3=A2=C2=A9c;
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++int A=C3=A2=C2=ACX;
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++int A\u202cY;
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++int A\u202CY2;
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++
> ++int d\u202ae\u202cf;
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++int d\u202Ae\u202cf2;
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++int d\u202be\u202cf;
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++int d\u202Be\u202cf2;
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++int d\u202de\u202cf;
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++int d\u202De\u202cf2;
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++int d\u202ee\u202cf;
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++int d\u202Ee\u202cf2;
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++int d\u2066e\u2069f;
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++int d\u2067e\u2069f;
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++int d\u2068e\u2069f;
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> ++int X\u2069;
> ++/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
> +diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-6.c b/gcc/testsuite/=
c-c++-common/Wbidi-chars-6.c
> +new file mode 100644
> +index 00000000000..0ce6fff2dee
> +--- /dev/null
> ++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-6.c
> +@@ -0,0 +1,155 @@
> ++/* PR preprocessor/103026 */
> ++/* { dg-do compile } */
> ++/* { dg-options "-Wbidi-chars=3Dunpaired" } */
> ++/* Test nesting of bidi chars in various contexts.  */
> ++
> ++/* Terminated by the wrong char:  */
> ++/* a b c LRE=C3=A2=C2=AA 1 2 3 PDI=C3=A2=C2=A9 x y z */
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++/* a b c RLE=C3=A2=C2=AB 1 2 3 PDI=C3=A2=C2=A9 x y  z*/
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++/* a b c LRO=C3=A2=C2=AD 1 2 3 PDI=C3=A2=C2=A9 x y z */
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++/* a b c RLO=C3=A2=C2=AE 1 2 3 PDI=C3=A2=C2=A9 x y z */
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++/* a b c LRI=C3=A2=C2=A6 1 2 3 PDF=C3=A2=C2=AC x y z */
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++/* a b c RLI=C3=A2=C2=A7 1 2 3 PDF=C3=A2=C2=AC x y z */
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++/* a b c FSI=C3=A2=C2=A8 1 2 3 PDF=C3=A2=C2=AC x y  z*/
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++
> ++/* LRE=C3=A2=C2=AA PDF=C3=A2=C2=AC */
> ++/* LRE=C3=A2=C2=AA LRE=C3=A2=C2=AA PDF=C3=A2=C2=AC PDF=C3=A2=C2=AC */
> ++/* PDF=C3=A2=C2=AC LRE=C3=A2=C2=AA PDF=C3=A2=C2=AC */
> ++/* LRE=C3=A2=C2=AA PDF=C3=A2=C2=AC LRE=C3=A2=C2=AA PDF=C3=A2=C2=AC */
> ++/* LRE=C3=A2=C2=AA LRE=C3=A2=C2=AA PDF=C3=A2=C2=AC */
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++/* PDF=C3=A2=C2=AC LRE=C3=A2=C2=AA */
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++
> ++// a b c LRE=C3=A2=C2=AA 1 2 3 PDI=C3=A2=C2=A9 x y z
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++// a b c RLE=C3=A2=C2=AB 1 2 3 PDI=C3=A2=C2=A9 x y  z*/
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++// a b c LRO=C3=A2=C2=AD 1 2 3 PDI=C3=A2=C2=A9 x y z
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++// a b c RLO=C3=A2=C2=AE 1 2 3 PDI=C3=A2=C2=A9 x y z
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++// a b c LRI=C3=A2=C2=A6 1 2 3 PDF=C3=A2=C2=AC x y z
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++// a b c RLI=C3=A2=C2=A7 1 2 3 PDF=C3=A2=C2=AC x y z
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++// a b c FSI=C3=A2=C2=A8 1 2 3 PDF=C3=A2=C2=AC x y  z
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++
> ++// LRE=C3=A2=C2=AA PDF=C3=A2=C2=AC
> ++// LRE=C3=A2=C2=AA LRE=C3=A2=C2=AA PDF=C3=A2=C2=AC PDF=C3=A2=C2=AC
> ++// PDF=C3=A2=C2=AC LRE=C3=A2=C2=AA PDF=C3=A2=C2=AC
> ++// LRE=C3=A2=C2=AA PDF=C3=A2=C2=AC LRE=C3=A2=C2=AA PDF=C3=A2=C2=AC
> ++// LRE=C3=A2=C2=AA LRE=C3=A2=C2=AA PDF=C3=A2=C2=AC
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++// PDF=C3=A2=C2=AC LRE=C3=A2=C2=AA
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++
> ++void
> ++g1 ()
> ++{
> ++  const char *s1 =3D "a b c LRE=C3=A2=C2=AA 1 2 3 PDI=C3=A2=C2=A9 x y z=
";
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++  const char *s2 =3D "a b c LRE\u202a 1 2 3 PDI\u2069 x y z";
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++  const char *s3 =3D "a b c RLE=C3=A2=C2=AB 1 2 3 PDI=C3=A2=C2=A9 x y "=
;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++  const char *s4 =3D "a b c RLE\u202b 1 2 3 PDI\u2069 x y z";
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++  const char *s5 =3D "a b c LRO=C3=A2=C2=AD 1 2 3 PDI=C3=A2=C2=A9 x y z=
";
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++  const char *s6 =3D "a b c LRO\u202d 1 2 3 PDI\u2069 x y z";
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++  const char *s7 =3D "a b c RLO=C3=A2=C2=AE 1 2 3 PDI=C3=A2=C2=A9 x y z=
";
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++  const char *s8 =3D "a b c RLO\u202e 1 2 3 PDI\u2069 x y z";
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++  const char *s9 =3D "a b c LRI=C3=A2=C2=A6 1 2 3 PDF=C3=A2=C2=AC x y z=
";
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++  const char *s10 =3D "a b c LRI\u2066 1 2 3 PDF\u202c x y z";
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++  const char *s11 =3D "a b c RLI=C3=A2=C2=A7 1 2 3 PDF=C3=A2=C2=AC x y =
z\
> ++    ";
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
> ++  const char *s12 =3D "a b c RLI\u2067 1 2 3 PDF\u202c x y z";
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++  const char *s13 =3D "a b c FSI=C3=A2=C2=A8 1 2 3 PDF=C3=A2=C2=AC x y =
z";
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++  const char *s14 =3D "a b c FSI\u2068 1 2 3 PDF\u202c x y z";
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++  const char *s15 =3D "PDF=C3=A2=C2=AC LRE=C3=A2=C2=AA";
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++  const char *s16 =3D "PDF\u202c LRE\u202a";
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++  const char *s17 =3D "LRE=C3=A2=C2=AA PDF=C3=A2=C2=AC";
> ++  const char *s18 =3D "LRE\u202a PDF\u202c";
> ++  const char *s19 =3D "LRE=C3=A2=C2=AA LRE=C3=A2=C2=AA PDF=C3=A2=C2=AC =
PDF=C3=A2=C2=AC";
> ++  const char *s20 =3D "LRE\u202a LRE\u202a PDF\u202c PDF\u202c";
> ++  const char *s21 =3D "PDF=C3=A2=C2=AC LRE=C3=A2=C2=AA PDF=C3=A2=C2=AC"=
;
> ++  const char *s22 =3D "PDF\u202c LRE\u202a PDF\u202c";
> ++  const char *s23 =3D "LRE=C3=A2=C2=AA LRE=C3=A2=C2=AA PDF=C3=A2=C2=AC"=
;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++  const char *s24 =3D "LRE\u202a LRE\u202a PDF\u202c";
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++  const char *s25 =3D "PDF=C3=A2=C2=AC LRE=C3=A2=C2=AA";
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++  const char *s26 =3D "PDF\u202c LRE\u202a";
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++  const char *s27 =3D "PDF=C3=A2=C2=AC LRE\u202a";
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++  const char *s28 =3D "PDF\u202c LRE=C3=A2=C2=AA";
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++}
> ++
> ++int aLRE=C3=A2=C2=AAbPDI=C3=A2=C2=A9;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++int A\u202aB\u2069C;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++int aRLE=C3=A2=C2=ABbPDI=C3=A2=C2=A9;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++int a\u202bB\u2069c;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++int aLRO=C3=A2=C2=ADbPDI=C3=A2=C2=A9;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++int a\u202db\u2069c2;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++int aRLO=C3=A2=C2=AEbPDI=C3=A2=C2=A9;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++int a\u202eb\u2069;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++int aLRI=C3=A2=C2=A6bPDF=C3=A2=C2=AC;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++int a\u2066b\u202c;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++int aRLI=C3=A2=C2=A7bPDF=C3=A2=C2=ACc
> ++;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
> ++int a\u2067b\u202c;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++int aFSI=C3=A2=C2=A8bPDF=C3=A2=C2=AC;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++int a\u2068b\u202c;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++int aFSI=C3=A2=C2=A8bPD\u202C;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++int aFSI\u2068bPDF=C3=A2=C2=AC_;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++int aLRE=C3=A2=C2=AAbPDF=C3=A2=C2=ACb;
> ++int A\u202aB\u202c;
> ++int a_LRE=C3=A2=C2=AA_LRE=C3=A2=C2=AA_b_PDF=C3=A2=C2=AC_PDF=C3=A2=C2=AC=
;
> ++int A\u202aA\u202aB\u202cB\u202c;
> ++int aPDF=C3=A2=C2=ACbLREadPDF=C3=A2=C2=AC;
> ++int a_\u202C_\u202a_\u202c;
> ++int a_LRE=C3=A2=C2=AA_b_PDF=C3=A2=C2=AC_c_LRE=C3=A2=C2=AA_PDF=C3=A2=C2=
=AC;
> ++int a_\u202a_\u202c_\u202a_\u202c_;
> ++int a_LRE=C3=A2=C2=AA_b_PDF=C3=A2=C2=AC_c_LRE=C3=A2=C2=AA;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++int a_\u202a_\u202c_\u202a_;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> +diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-7.c b/gcc/testsuite/=
c-c++-common/Wbidi-chars-7.c
> +new file mode 100644
> +index 00000000000..d012d420ec0
> +--- /dev/null
> ++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-7.c
> +@@ -0,0 +1,9 @@
> ++/* PR preprocessor/103026 */
> ++/* { dg-do compile } */
> ++/* { dg-options "-Wbidi-chars=3Dany" } */
> ++/* Test we ignore UCNs in comments.  */
> ++
> ++// a b c \u202a 1 2 3
> ++// a b c \u202A 1 2 3
> ++/* a b c \u202a 1 2 3 */
> ++/* a b c \u202A 1 2 3 */
> +diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-8.c b/gcc/testsuite/=
c-c++-common/Wbidi-chars-8.c
> +new file mode 100644
> +index 00000000000..4f54c5092ec
> +--- /dev/null
> ++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-8.c
> +@@ -0,0 +1,13 @@
> ++/* PR preprocessor/103026 */
> ++/* { dg-do compile } */
> ++/* { dg-options "-Wbidi-chars=3Dany" } */
> ++/* Test \u vs \U.  */
> ++
> ++int a_\u202A;
> ++/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
> ++int a_\u202a_2;
> ++/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
> ++int a_\U0000202A_3;
> ++/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
> ++int a_\U0000202a_4;
> ++/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
> +diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-9.c b/gcc/testsuite/=
c-c++-common/Wbidi-chars-9.c
> +new file mode 100644
> +index 00000000000..e2af1b1ca97
> +--- /dev/null
> ++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-9.c
> +@@ -0,0 +1,29 @@
> ++/* PR preprocessor/103026 */
> ++/* { dg-do compile } */
> ++/* { dg-options "-Wbidi-chars=3Dunpaired" } */
> ++/* Test that we properly separate bidi contexts (comment/identifier/cha=
racter
> ++   constant/string literal).  */
> ++
> ++/* LRE ->=C3=A2=C2=AA<- */ int pdf_\u202c_1;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++/* RLE ->=C3=A2=C2=AB<- */ int pdf_\u202c_2;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++/* LRO ->=C3=A2=C2=AD<- */ int pdf_\u202c_3;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++/* RLO ->=C3=A2=C2=AE<- */ int pdf_\u202c_4;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++/* LRI ->=C3=A2=C2=A6<-*/ int pdi_\u2069_1;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++/* RLI ->=C3=A2=C2=A7<- */ int pdi_\u2069_12;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++/* FSI ->=C3=A2=C2=A8<- */ int pdi_\u2069_3;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++
> ++const char *s1 =3D "LRE\u202a"; /* PDF ->=C3=A2=C2=AC<- */
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++/* LRE ->=C3=A2=C2=AA<- */ const char *s2 =3D "PDF\u202c";
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++const char *s3 =3D "LRE\u202a"; int pdf_\u202c_5;
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> ++int lre_\u202a; const char *s4 =3D "PDF\u202c";
> ++/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
> +diff --git a/libcpp/include/cpplib.h b/libcpp/include/cpplib.h
> +index 176f8c5bbce..112b9c24751 100644
> +--- a/libcpp/include/cpplib.h
> ++++ b/libcpp/include/cpplib.h
> +@@ -318,6 +318,17 @@ enum cpp_main_search
> +   CMS_system,  /* Search the system INCLUDE path.  */
> + };
> +
> ++/* The possible bidirectional control characters checking levels, from =
least
> ++   restrictive to most.  */
> ++enum cpp_bidirectional_level {
> ++  /* No checking.  */
> ++  bidirectional_none,
> ++  /* Only detect unpaired uses of bidirectional control characters.  */
> ++  bidirectional_unpaired,
> ++  /* Detect any use of bidirectional control characters.  */
> ++  bidirectional_any
> ++};
> ++
> + /* This structure is nested inside struct cpp_reader, and
> +    carries all the options visible to the command line.  */
> + struct cpp_options
> +@@ -531,6 +542,10 @@ struct cpp_options
> +   /* True if warn about differences between C++98 and C++11.  */
> +   bool cpp_warn_cxx11_compat;
> +
> ++  /* Nonzero if bidirectional control characters checking is on.  See e=
num
> ++     cpp_bidirectional_level.  */
> ++  unsigned char cpp_warn_bidirectional;
> ++
> +   /* Dependency generation.  */
> +   struct
> +   {
> +@@ -635,7 +650,8 @@ enum cpp_warning_reason {
> +   CPP_W_C90_C99_COMPAT,
> +   CPP_W_C11_C2X_COMPAT,
> +   CPP_W_CXX11_COMPAT,
> +-  CPP_W_EXPANSION_TO_DEFINED
> ++  CPP_W_EXPANSION_TO_DEFINED,
> ++  CPP_W_BIDIRECTIONAL
> + };
> +
> + /* Callback for header lookup for HEADER, which is the name of a
> +diff --git a/libcpp/init.c b/libcpp/init.c
> +index 5a424e23553..f9a8f5f088f 100644
> +--- a/libcpp/init.c
> ++++ b/libcpp/init.c
> +@@ -219,6 +219,7 @@ cpp_create_reader (enum c_lang lang, cpp
> +       =3D ENABLE_CANONICAL_SYSTEM_HEADERS;
> +   CPP_OPTION (pfile, ext_numeric_literals) =3D 1;
> +   CPP_OPTION (pfile, warn_date_time) =3D 0;
> ++  CPP_OPTION (pfile, cpp_warn_bidirectional) =3D bidirectional_unpaired=
;
> +
> +   /* Default CPP arithmetic to something sensible for the host for the
> +      benefit of dumb users like fix-header.  */
> +diff --git a/libcpp/internal.h b/libcpp/internal.h
> +index 8577cab6c83..0ce0246c5a2 100644
> +--- a/libcpp/internal.h
> ++++ b/libcpp/internal.h
> +@@ -597,6 +597,13 @@ struct cpp_reader
> +   /* Location identifying the main source file -- intended to be line
> +      zero of said file.  */
> +   location_t main_loc;
> ++
> ++  /* Returns true iff we should warn about UTF-8 bidirectional control
> ++     characters.  */
> ++  bool warn_bidi_p () const
> ++  {
> ++    return CPP_OPTION (this, cpp_warn_bidirectional) !=3D bidirectional=
_none;
> ++  }
> + };
> +
> + /* Character classes.  Based on the more primitive macros in safe-ctype=
.h.
> +diff --git a/libcpp/lex.c b/libcpp/lex.c
> +index fa2253d41c3..6a4fbce6030 100644
> +--- a/libcpp/lex.c
> ++++ b/libcpp/lex.c
> +@@ -1164,6 +1164,324 @@ _cpp_process_line_notes (cpp_reader *pfi
> +     }
> + }
> +
> ++namespace bidi {
> ++  enum class kind {
> ++    NONE, LRE, RLE, LRO, RLO, LRI, RLI, FSI, PDF, PDI, LTR, RTL
> ++  };
> ++
> ++  /* All the UTF-8 encodings of bidi characters start with E2.  */
> ++  constexpr uchar utf8_start =3D 0xe2;
> ++
> ++  /* A vector holding currently open bidi contexts.  We use a char for
> ++     each context, its LSB is 1 if it represents a PDF context, 0 if it
> ++     represents a PDI context.  The next bit is 1 if this context was o=
pen
> ++     by a bidi character written as a UCN, and 0 when it was UTF-8.  */
> ++  semi_embedded_vec <unsigned char, 16> vec;
> ++
> ++  /* Close the whole comment/identifier/string literal/character consta=
nt
> ++     context.  */
> ++  void on_close ()
> ++  {
> ++    vec.truncate (0);
> ++  }
> ++
> ++  /* Pop the last element in the vector.  */
> ++  void pop ()
> ++  {
> ++    unsigned int len =3D vec.count ();
> ++    gcc_checking_assert (len > 0);
> ++    vec.truncate (len - 1);
> ++  }
> ++
> ++  /* Return the context of the Ith element.  */
> ++  kind ctx_at (unsigned int i)
> ++  {
> ++    return (vec[i] & 1) ? kind::PDF : kind::PDI;
> ++  }
> ++
> ++  /* Return which context is currently opened.  */
> ++  kind current_ctx ()
> ++  {
> ++    unsigned int len =3D vec.count ();
> ++    if (len =3D=3D 0)
> ++      return kind::NONE;
> ++    return ctx_at (len - 1);
> ++  }
> ++
> ++  /* Return true if the current context comes from a UCN origin, that i=
s,
> ++     the bidi char which started this bidi context was written as a UCN=
.  */
> ++  bool current_ctx_ucn_p ()
> ++  {
> ++    unsigned int len =3D vec.count ();
> ++    gcc_checking_assert (len > 0);
> ++    return (vec[len - 1] >> 1) & 1;
> ++  }
> ++
> ++  /* We've read a bidi char, update the current vector as necessary.  *=
/
> ++  void on_char (kind k, bool ucn_p)
> ++  {
> ++    switch (k)
> ++      {
> ++      case kind::LRE:
> ++      case kind::RLE:
> ++      case kind::LRO:
> ++      case kind::RLO:
> ++      vec.push (ucn_p ? 3u : 1u);
> ++      break;
> ++      case kind::LRI:
> ++      case kind::RLI:
> ++      case kind::FSI:
> ++      vec.push (ucn_p ? 2u : 0u);
> ++      break;
> ++      /* PDF terminates the scope of the last LRE, RLE, LRO, or RLO
> ++       whose scope has not yet been terminated.  */
> ++      case kind::PDF:
> ++      if (current_ctx () =3D=3D kind::PDF)
> ++        pop ();
> ++      break;
> ++      /* PDI terminates the scope of the last LRI, RLI, or FSI whose
> ++       scope has not yet been terminated, as well as the scopes of
> ++       any subsequent LREs, RLEs, LROs, or RLOs whose scopes have not
> ++       yet been terminated.  */
> ++      case kind::PDI:
> ++      for (int i =3D vec.count () - 1; i >=3D 0; --i)
> ++        if (ctx_at (i) =3D=3D kind::PDI)
> ++          {
> ++            vec.truncate (i);
> ++            break;
> ++          }
> ++      break;
> ++      case kind::LTR:
> ++      case kind::RTL:
> ++      /* These aren't popped by a PDF/PDI.  */
> ++      break;
> ++      [[likely]] case kind::NONE:
> ++      break;
> ++      default:
> ++      abort ();
> ++      }
> ++  }
> ++
> ++  /* Return a descriptive string for K.  */
> ++  const char *to_str (kind k)
> ++  {
> ++    switch (k)
> ++      {
> ++      case kind::LRE:
> ++      return "U+202A (LEFT-TO-RIGHT EMBEDDING)";
> ++      case kind::RLE:
> ++      return "U+202B (RIGHT-TO-LEFT EMBEDDING)";
> ++      case kind::LRO:
> ++      return "U+202D (LEFT-TO-RIGHT OVERRIDE)";
> ++      case kind::RLO:
> ++      return "U+202E (RIGHT-TO-LEFT OVERRIDE)";
> ++      case kind::LRI:
> ++      return "U+2066 (LEFT-TO-RIGHT ISOLATE)";
> ++      case kind::RLI:
> ++      return "U+2067 (RIGHT-TO-LEFT ISOLATE)";
> ++      case kind::FSI:
> ++      return "U+2068 (FIRST STRONG ISOLATE)";
> ++      case kind::PDF:
> ++      return "U+202C (POP DIRECTIONAL FORMATTING)";
> ++      case kind::PDI:
> ++      return "U+2069 (POP DIRECTIONAL ISOLATE)";
> ++      case kind::LTR:
> ++      return "U+200E (LEFT-TO-RIGHT MARK)";
> ++      case kind::RTL:
> ++      return "U+200F (RIGHT-TO-LEFT MARK)";
> ++      default:
> ++      abort ();
> ++      }
> ++  }
> ++}
> ++
> ++/* Parse a sequence of 3 bytes starting with P and return its bidi code=
.  */
> ++
> ++static bidi::kind
> ++get_bidi_utf8 (const unsigned char *const p)
> ++{
> ++  gcc_checking_assert (p[0] =3D=3D bidi::utf8_start);
> ++
> ++  if (p[1] =3D=3D 0x80)
> ++    switch (p[2])
> ++      {
> ++      case 0xaa:
> ++      return bidi::kind::LRE;
> ++      case 0xab:
> ++      return bidi::kind::RLE;
> ++      case 0xac:
> ++      return bidi::kind::PDF;
> ++      case 0xad:
> ++      return bidi::kind::LRO;
> ++      case 0xae:
> ++      return bidi::kind::RLO;
> ++      case 0x8e:
> ++      return bidi::kind::LTR;
> ++      case 0x8f:
> ++      return bidi::kind::RTL;
> ++      default:
> ++      break;
> ++      }
> ++  else if (p[1] =3D=3D 0x81)
> ++    switch (p[2])
> ++      {
> ++      case 0xa6:
> ++      return bidi::kind::LRI;
> ++      case 0xa7:
> ++      return bidi::kind::RLI;
> ++      case 0xa8:
> ++      return bidi::kind::FSI;
> ++      case 0xa9:
> ++      return bidi::kind::PDI;
> ++      default:
> ++      break;
> ++      }
> ++
> ++  return bidi::kind::NONE;
> ++}
> ++
> ++/* Parse a UCN where P points just past \u or \U and return its bidi co=
de.  */
> ++
> ++static bidi::kind
> ++get_bidi_ucn (const unsigned char *p, bool is_U)
> ++{
> ++  /* 6.4.3 Universal Character Names
> ++      \u hex-quad
> ++      \U hex-quad hex-quad
> ++     where \unnnn means \U0000nnnn.  */
> ++
> ++  if (is_U)
> ++    {
> ++      if (p[0] !=3D '0' || p[1] !=3D '0' || p[2] !=3D '0' || p[3] !=3D =
'0')
> ++      return bidi::kind::NONE;
> ++      /* Skip 4B so we can treat \u and \U the same below.  */
> ++      p +=3D 4;
> ++    }
> ++
> ++  /* All code points we are looking for start with 20xx.  */
> ++  if (p[0] !=3D '2' || p[1] !=3D '0')
> ++    return bidi::kind::NONE;
> ++  else if (p[2] =3D=3D '2')
> ++    switch (p[3])
> ++      {
> ++      case 'a':
> ++      case 'A':
> ++      return bidi::kind::LRE;
> ++      case 'b':
> ++      case 'B':
> ++      return bidi::kind::RLE;
> ++      case 'c':
> ++      case 'C':
> ++      return bidi::kind::PDF;
> ++      case 'd':
> ++      case 'D':
> ++      return bidi::kind::LRO;
> ++      case 'e':
> ++      case 'E':
> ++      return bidi::kind::RLO;
> ++      default:
> ++      break;
> ++      }
> ++  else if (p[2] =3D=3D '6')
> ++    switch (p[3])
> ++      {
> ++      case '6':
> ++      return bidi::kind::LRI;
> ++      case '7':
> ++      return bidi::kind::RLI;
> ++      case '8':
> ++      return bidi::kind::FSI;
> ++      case '9':
> ++      return bidi::kind::PDI;
> ++      default:
> ++      break;
> ++      }
> ++  else if (p[2] =3D=3D '0')
> ++    switch (p[3])
> ++      {
> ++      case 'e':
> ++      case 'E':
> ++      return bidi::kind::LTR;
> ++      case 'f':
> ++      case 'F':
> ++      return bidi::kind::RTL;
> ++      default:
> ++      break;
> ++      }
> ++
> ++  return bidi::kind::NONE;
> ++}
> ++
> ++/* We're closing a bidi context, that is, we've encountered a newline,
> ++   are closing a C-style comment, or are at the end of a string literal=
,
> ++   character constant, or identifier.  Warn if this context was not
> ++   properly terminated by a PDI or PDF.  P points to the last character
> ++   in this context.  */
> ++
> ++static void
> ++maybe_warn_bidi_on_close (cpp_reader *pfile, const uchar *p)
> ++{
> ++  if (CPP_OPTION (pfile, cpp_warn_bidirectional) =3D=3D bidirectional_u=
npaired
> ++      && bidi::vec.count () > 0)
> ++    {
> ++      const location_t loc
> ++      =3D linemap_position_for_column (pfile->line_table,
> ++                                     CPP_BUF_COLUMN (pfile->buffer, p))=
;
> ++      cpp_warning_with_line (pfile, CPP_W_BIDIRECTIONAL, loc, 0,
> ++                           "unpaired UTF-8 bidirectional control charac=
ter "
> ++                           "detected");
> ++    }
> ++  /* We're done with this context.  */
> ++  bidi::on_close ();
> ++}
> ++
> ++/* We're at the beginning or in the middle of an identifier/comment/str=
ing
> ++   literal/character constant.  Warn if we've encountered a bidi charac=
ter.
> ++   KIND says which bidi character it was; P points to it in the charact=
er
> ++   stream.  UCN_P is true iff this bidi character was written as a UCN.=
  */
> ++
> ++static void
> ++maybe_warn_bidi_on_char (cpp_reader *pfile, const uchar *p, bidi::kind =
kind,
> ++                       bool ucn_p)
> ++{
> ++  if (__builtin_expect (kind =3D=3D bidi::kind::NONE, 1))
> ++    return;
> ++
> ++  const auto warn_bidi =3D CPP_OPTION (pfile, cpp_warn_bidirectional);
> ++
> ++  if (warn_bidi !=3D bidirectional_none)
> ++    {
> ++      const location_t loc
> ++      =3D linemap_position_for_column (pfile->line_table,
> ++                                     CPP_BUF_COLUMN (pfile->buffer, p))=
;
> ++      /* It seems excessive to warn about a PDI/PDF that is closing
> ++       an opened context because we've already warned about the
> ++       opening character.  Except warn when we have a UCN x UTF-8
> ++       mismatch.  */
> ++      if (kind =3D=3D bidi::current_ctx ())
> ++      {
> ++        if (warn_bidi =3D=3D bidirectional_unpaired
> ++            && bidi::current_ctx_ucn_p () !=3D ucn_p)
> ++          cpp_warning_with_line (pfile, CPP_W_BIDIRECTIONAL, loc, 0,
> ++                                 "UTF-8 vs UCN mismatch when closing "
> ++                                 "a context by \"%s\"", bidi::to_str (k=
ind));
> ++      }
> ++      else if (warn_bidi =3D=3D bidirectional_any)
> ++      {
> ++        if (kind =3D=3D bidi::kind::PDF || kind =3D=3D bidi::kind::PDI)
> ++          cpp_warning_with_line (pfile, CPP_W_BIDIRECTIONAL, loc, 0,
> ++                                 "\"%s\" is closing an unopened context=
",
> ++                                 bidi::to_str (kind));
> ++        else
> ++          cpp_warning_with_line (pfile, CPP_W_BIDIRECTIONAL, loc, 0,
> ++                                 "found problematic Unicode character \=
"%s\"",
> ++                                 bidi::to_str (kind));
> ++      }
> ++    }
> ++  /* We're done with this context.  */
> ++  bidi::on_char (kind, ucn_p);
> ++}
> ++
> + /* Skip a C-style block comment.  We find the end of the comment by
> +    seeing if an asterisk is before every '/' we encounter.  Returns
> +    nonzero if comment terminated by EOF, zero otherwise.
> +@@ -1175,6 +1493,7 @@ _cpp_skip_block_comment (cpp_reader *pfi
> +   cpp_buffer *buffer =3D pfile->buffer;
> +   const uchar *cur =3D buffer->cur;
> +   uchar c;
> ++  const bool warn_bidi_p =3D pfile->warn_bidi_p ();
> +
> +   cur++;
> +   if (*cur =3D=3D '/')
> +@@ -1189,7 +1508,11 @@ _cpp_skip_block_comment (cpp_reader *pfi
> +       if (c =3D=3D '/')
> +       {
> +         if (cur[-2] =3D=3D '*')
> +-          break;
> ++          {
> ++            if (warn_bidi_p)
> ++              maybe_warn_bidi_on_close (pfile, cur);
> ++            break;
> ++          }
> +
> +         /* Warn about potential nested comments, but not if the '/'
> +            comes immediately before the true comment delimiter.
> +@@ -1208,6 +1531,8 @@ _cpp_skip_block_comment (cpp_reader *pfi
> +       {
> +         unsigned int cols;
> +         buffer->cur =3D cur - 1;
> ++        if (warn_bidi_p)
> ++          maybe_warn_bidi_on_close (pfile, cur);
> +         _cpp_process_line_notes (pfile, true);
> +         if (buffer->next_line >=3D buffer->rlimit)
> +           return true;
> +@@ -1218,6 +1543,13 @@ _cpp_skip_block_comment (cpp_reader *pfi
> +
> +         cur =3D buffer->cur;
> +       }
> ++      /* If this is a beginning of a UTF-8 encoding, it might be
> ++       a bidirectional control character.  */
> ++      else if (__builtin_expect (c =3D=3D bidi::utf8_start, 0) && warn_=
bidi_p)
> ++      {
> ++        bidi::kind kind =3D get_bidi_utf8 (cur - 1);
> ++        maybe_warn_bidi_on_char (pfile, cur, kind, /*ucn_p=3D*/false);
> ++      }
> +     }
> +
> +   buffer->cur =3D cur;
> +@@ -1233,9 +1565,31 @@ skip_line_comment (cpp_reader *pfile)
> + {
> +   cpp_buffer *buffer =3D pfile->buffer;
> +   location_t orig_line =3D pfile->line_table->highest_line;
> ++  const bool warn_bidi_p =3D pfile->warn_bidi_p ();
> +
> +-  while (*buffer->cur !=3D '\n')
> +-    buffer->cur++;
> ++  if (!warn_bidi_p)
> ++    while (*buffer->cur !=3D '\n')
> ++      buffer->cur++;
> ++  else
> ++    {
> ++      while (*buffer->cur !=3D '\n'
> ++           && *buffer->cur !=3D bidi::utf8_start)
> ++      buffer->cur++;
> ++      if (__builtin_expect (*buffer->cur =3D=3D bidi::utf8_start, 0))
> ++      {
> ++        while (*buffer->cur !=3D '\n')
> ++          {
> ++            if (__builtin_expect (*buffer->cur =3D=3D bidi::utf8_start,=
 0))
> ++              {
> ++                bidi::kind kind =3D get_bidi_utf8 (buffer->cur);
> ++                maybe_warn_bidi_on_char (pfile, buffer->cur, kind,
> ++                                         /*ucn_p=3D*/false);
> ++              }
> ++            buffer->cur++;
> ++          }
> ++        maybe_warn_bidi_on_close (pfile, buffer->cur);
> ++      }
> ++    }
> +
> +   _cpp_process_line_notes (pfile, true);
> +   return orig_line !=3D pfile->line_table->highest_line;
> +@@ -1317,11 +1671,13 @@ static const cppchar_t utf8_signifier =3D
> +
> + /* Returns TRUE if the sequence starting at buffer->cur is valid in
> +    an identifier.  FIRST is TRUE if this starts an identifier.  */
> ++
> + static bool
> + forms_identifier_p (cpp_reader *pfile, int first,
> +                   struct normalize_state *state)
> + {
> +   cpp_buffer *buffer =3D pfile->buffer;
> ++  const bool warn_bidi_p =3D pfile->warn_bidi_p ();
> +
> +   if (*buffer->cur =3D=3D '$')
> +     {
> +@@ -1344,6 +1700,13 @@ forms_identifier_p (cpp_reader *pfile, i
> +       cppchar_t s;
> +       if (*buffer->cur >=3D utf8_signifier)
> +       {
> ++        if (__builtin_expect (*buffer->cur =3D=3D bidi::utf8_start, 0)
> ++            && warn_bidi_p)
> ++          {
> ++            bidi::kind kind =3D get_bidi_utf8 (buffer->cur);
> ++            maybe_warn_bidi_on_char (pfile, buffer->cur, kind,
> ++                                     /*ucn_p=3D*/false);
> ++          }
> +         if (_cpp_valid_utf8 (pfile, &buffer->cur, buffer->rlimit, 1 + !=
first,
> +                              state, &s))
> +           return true;
> +@@ -1352,6 +1715,13 @@ forms_identifier_p (cpp_reader *pfile, i
> +              && (buffer->cur[1] =3D=3D 'u' || buffer->cur[1] =3D=3D 'U'=
))
> +       {
> +         buffer->cur +=3D 2;
> ++        if (warn_bidi_p)
> ++          {
> ++            bidi::kind kind =3D get_bidi_ucn (buffer->cur,
> ++                                            buffer->cur[-1] =3D=3D 'U')=
;
> ++            maybe_warn_bidi_on_char (pfile, buffer->cur, kind,
> ++                                     /*ucn_p=3D*/true);
> ++          }
> +         if (_cpp_valid_ucn (pfile, &buffer->cur, buffer->rlimit, 1 + !f=
irst,
> +                             state, &s, NULL, NULL))
> +           return true;
> +@@ -1460,6 +1830,7 @@ lex_identifier (cpp_reader *pfile, const
> +   const uchar *cur;
> +   unsigned int len;
> +   unsigned int hash =3D HT_HASHSTEP (0, *base);
> ++  const bool warn_bidi_p =3D pfile->warn_bidi_p ();
> +
> +   cur =3D pfile->buffer->cur;
> +   if (! starts_ucn)
> +@@ -1483,6 +1854,8 @@ lex_identifier (cpp_reader *pfile, const
> +           pfile->buffer->cur++;
> +         }
> +       } while (forms_identifier_p (pfile, false, nst));
> ++      if (warn_bidi_p)
> ++      maybe_warn_bidi_on_close (pfile, pfile->buffer->cur);
> +       result =3D _cpp_interpret_identifier (pfile, base,
> +                                         pfile->buffer->cur - base);
> +       *spelling =3D cpp_lookup (pfile, base, pfile->buffer->cur - base)=
;
> +@@ -1719,6 +2092,7 @@ static void
> + lex_raw_string (cpp_reader *pfile, cpp_token *token, const uchar *base)
> + {
> +   const uchar *pos =3D base;
> ++  const bool warn_bidi_p =3D pfile->warn_bidi_p ();
> +
> +   /* 'tis a pity this information isn't passed down from the lexer's
> +      initial categorization of the token.  */
> +@@ -1955,8 +2329,15 @@ lex_raw_string (cpp_reader *pfile, cpp_t
> +         pos =3D base =3D pfile->buffer->cur;
> +         note =3D &pfile->buffer->notes[pfile->buffer->cur_note];
> +       }
> ++      else if (__builtin_expect ((unsigned char) c =3D=3D bidi::utf8_st=
art, 0)
> ++             && warn_bidi_p)
> ++      maybe_warn_bidi_on_char (pfile, pos - 1, get_bidi_utf8 (pos - 1),
> ++                               /*ucn_p=3D*/false);
> +     }
> +
> ++  if (warn_bidi_p)
> ++    maybe_warn_bidi_on_close (pfile, pos);
> ++
> +   if (CPP_OPTION (pfile, user_literals))
> +     {
> +       /* If a string format macro, say from inttypes.h, is placed touch=
ing
> +@@ -2051,15 +2432,27 @@ lex_string (cpp_reader *pfile, cpp_token
> +   else
> +     terminator =3D '>', type =3D CPP_HEADER_NAME;
> +
> ++  const bool warn_bidi_p =3D pfile->warn_bidi_p ();
> +   for (;;)
> +     {
> +       cppchar_t c =3D *cur++;
> +
> +       /* In #include-style directives, terminators are not escapable.  =
*/
> +       if (c =3D=3D '\\' && !pfile->state.angled_headers && *cur !=3D '\=
n')
> +-      cur++;
> ++      {
> ++        if ((cur[0] =3D=3D 'u' || cur[0] =3D=3D 'U') && warn_bidi_p)
> ++          {
> ++            bidi::kind kind =3D get_bidi_ucn (cur + 1, cur[0] =3D=3D 'U=
');
> ++            maybe_warn_bidi_on_char (pfile, cur, kind, /*ucn_p=3D*/true=
);
> ++          }
> ++        cur++;
> ++      }
> +       else if (c =3D=3D terminator)
> +-      break;
> ++      {
> ++        if (warn_bidi_p)
> ++          maybe_warn_bidi_on_close (pfile, cur - 1);
> ++        break;
> ++      }
> +       else if (c =3D=3D '\n')
> +       {
> +         cur--;
> +@@ -2076,6 +2469,11 @@ lex_string (cpp_reader *pfile, cpp_token
> +       }
> +       else if (c =3D=3D '\0')
> +       saw_NUL =3D true;
> ++      else if (__builtin_expect (c =3D=3D bidi::utf8_start, 0) && warn_=
bidi_p)
> ++      {
> ++        bidi::kind kind =3D get_bidi_utf8 (cur - 1);
> ++        maybe_warn_bidi_on_char (pfile, cur - 1, kind, /*ucn_p=3D*/fals=
e);
> ++      }
> +     }
> +
> +   if (saw_NUL && !pfile->state.skipping)
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0002-gc=
c-poison-system-directories.patch b/meta-arm-toolchain/recipes-devtools/gcc=
/gcc-arm-11.2/0002-gcc-poison-system-directories.patch
> similarity index 85%
> rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0002-gcc=
-poison-system-directories.patch
> rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0002-gcc-p=
oison-system-directories.patch
> index c96f17019652..18a9fb87012f 100644
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0002-gcc-poiso=
n-system-directories.patch
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0002-gcc-poiso=
n-system-directories.patch
> @@ -1,6 +1,6 @@
> -From a4fd05ff8e8ed7252d7b302891ac842cbb190c41 Mon Sep 17 00:00:00 2001
> +From 118c6f054711d437167ff125a88c9236bfc8099c Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 08:59:00 +0400
> +Date: Mon, 8 Mar 2021 16:04:20 -0800
>  Subject: [PATCH] gcc: poison-system-directories
>
>  Add /sw/include and /opt/include based on the original
> @@ -11,11 +11,9 @@ aborted.
>  Instead, we add the two missing items to the current scan.  If the user
>  wants this to be a failure, they can add "-Werror=3Dpoison-system-direct=
ories".
>
> +Upstream-Status: Pending
>  Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> -
> -Upstream-Status: Pending
>  ---
>   gcc/common.opt      |  4 ++++
>   gcc/config.in       | 10 ++++++++++
> @@ -27,10 +25,10 @@ Upstream-Status: Pending
>   7 files changed, 86 insertions(+), 2 deletions(-)
>
>  diff --git a/gcc/common.opt b/gcc/common.opt
> -index ec5235c3a41..ca942863064 100644
> +index c75dd36843e..49acbd6ed44 100644
>  --- a/gcc/common.opt
>  +++ b/gcc/common.opt
> -@@ -682,6 +682,10 @@ Wreturn-local-addr
> +@@ -683,6 +683,10 @@ Wreturn-local-addr
>   Common Var(warn_return_local_addr) Init(1) Warning
>   Warn about returning a pointer/reference to a local or temporary variab=
le.
>
> @@ -42,10 +40,10 @@ index ec5235c3a41..ca942863064 100644
>   Common Var(warn_shadow) Warning
>   Warn when one variable shadows another.  Same as -Wshadow=3Dglobal.
>  diff --git a/gcc/config.in b/gcc/config.in
> -index 364eba47737..7d2c3bbf1a3 100644
> +index 10a13cde586..8848284da41 100644
>  --- a/gcc/config.in
>  +++ b/gcc/config.in
> -@@ -224,6 +224,16 @@
> +@@ -218,6 +218,16 @@
>   #endif
>
>
> @@ -63,18 +61,18 @@ index 364eba47737..7d2c3bbf1a3 100644
>      optimizer and back end) to be checked for dynamic type safety at run=
time.
>      This is quite expensive. */
>  diff --git a/gcc/configure b/gcc/configure
> -index 8fe9c91fd7c..8976850dff6 100755
> +index 9bb436ce7bd..3f0734bff11 100755
>  --- a/gcc/configure
>  +++ b/gcc/configure
> -@@ -1010,6 +1010,7 @@ with_system_zlib
> - enable_maintainer_mode
> +@@ -1020,6 +1020,7 @@ enable_maintainer_mode
>   enable_link_mutex
> + enable_link_serialization
>   enable_version_specific_runtime_libs
>  +enable_poison_system_directories
>   enable_plugin
>   enable_host_shared
>   enable_libquadmath_support
> -@@ -1766,6 +1767,8 @@ Optional Features:
> +@@ -1782,6 +1783,8 @@ Optional Features:
>     --enable-version-specific-runtime-libs
>                             specify that runtime libraries should be inst=
alled
>                             in a compiler-specific directory
> @@ -83,7 +81,7 @@ index 8fe9c91fd7c..8976850dff6 100755
>     --enable-plugin         enable plugin support
>     --enable-host-shared    build host code as shared libraries
>     --disable-libquadmath-support
> -@@ -30276,6 +30279,22 @@ if test "${enable_version_specific_runtime_libs=
+set}" =3D set; then :
> +@@ -31325,6 +31328,22 @@ if test "${enable_version_specific_runtime_libs=
+set}" =3D set; then :
>   fi
>
>
> @@ -107,16 +105,16 @@ index 8fe9c91fd7c..8976850dff6 100755
>
>
>  diff --git a/gcc/configure.ac b/gcc/configure.ac
> -index 84dceb8074a..13eace6cfc6 100644
> +index caa611933df..54e21764b3e 100644
>  --- a/gcc/configure.ac
>  +++ b/gcc/configure.ac
> -@@ -6608,6 +6608,22 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
> +@@ -7123,6 +7123,22 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
>                   [specify that runtime libraries should be
>                    installed in a compiler-specific directory])])
>
>  +AC_ARG_ENABLE([poison-system-directories],
>  +             AS_HELP_STRING([--enable-poison-system-directories],
> -+                          [warn for use of native system header directo=
ries (no/yes/error)]),,
> ++                            [warn for use of native system header direc=
tories (no/yes/error)]),,
>  +             [enable_poison_system_directories=3Dno])
>  +AC_MSG_NOTICE([poisoned directories $enable_poison_system_directories])
>  +if test "x${enable_poison_system_directories}" !=3D "xno"; then
> @@ -134,10 +132,10 @@ index 84dceb8074a..13eace6cfc6 100644
>   AC_SUBST(subdirs)
>   AC_SUBST(srcdir)
>  diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
> -index eabeec944e7..cd31b522e42 100644
> +index 7a368959e5e..6659a903bf0 100644
>  --- a/gcc/doc/invoke.texi
>  +++ b/gcc/doc/invoke.texi
> -@@ -348,6 +348,7 @@ Objective-C and Objective-C++ Dialects}.
> +@@ -369,6 +369,7 @@ Objective-C and Objective-C++ Dialects}.
>   -Wpacked  -Wno-packed-bitfield-compat  -Wpacked-not-aligned  -Wpadded @=
gol
>   -Wparentheses  -Wno-pedantic-ms-format @gol
>   -Wpointer-arith  -Wno-pointer-compare  -Wno-pointer-to-int-cast @gol
> @@ -145,7 +143,7 @@ index eabeec944e7..cd31b522e42 100644
>   -Wno-pragmas  -Wno-prio-ctor-dtor  -Wredundant-decls @gol
>   -Wrestrict  -Wno-return-local-addr  -Wreturn-type @gol
>   -Wno-scalar-storage-order  -Wsequence-point @gol
> -@@ -6926,6 +6927,14 @@ made up of data only and thus requires no special=
 treatment.  But, for
> +@@ -7735,6 +7736,14 @@ made up of data only and thus requires no special=
 treatment.  But, for
>   most targets, it is made up of code and thus requires the stack to be
>   made executable in order for the program to work properly.
>
> @@ -161,10 +159,10 @@ index eabeec944e7..cd31b522e42 100644
>   @opindex Wfloat-equal
>   @opindex Wno-float-equal
>  diff --git a/gcc/gcc.c b/gcc/gcc.c
> -index 9f790db0daf..f379f71da3d 100644
> +index 7837553958b..19c75b6e20d 100644
>  --- a/gcc/gcc.c
>  +++ b/gcc/gcc.c
> -@@ -1041,6 +1041,8 @@ proper position among the other output files.  */
> +@@ -1152,6 +1152,8 @@ proper position among the other output files.  */
>      "%{fuse-ld=3D*:-fuse-ld=3D%*} " LINK_COMPRESS_DEBUG_SPEC \
>      "%X %{o*} %{e*} %{N} %{n} %{r}\
>       %{s} %{t} %{u*} %{z} %{Z} %{!nostdlib:%{!r:%{!nostartfiles:%S}}} \
> @@ -173,7 +171,7 @@ index 9f790db0daf..f379f71da3d 100644
>       %{static|no-pie|static-pie:} %@{L*} %(mfwrap) %(link_libgcc) " \
>       VTABLE_VERIFICATION_SPEC " " SANITIZER_EARLY_SPEC " %o "" \
>       %{fopenacc|fopenmp|%:gt(%{ftree-parallelize-loops=3D*:%*} 1):\
> -@@ -1134,8 +1136,11 @@ static const char *cpp_unique_options =3D
> +@@ -1247,8 +1249,11 @@ static const char *cpp_unique_options =3D
>   static const char *cpp_options =3D
>   "%(cpp_unique_options) %1 %{m*} %{std*&ansi&trigraphs} %{W*&pedantic*} =
%{w}\
>    %{f*} %{g*:%{%:debug-level-gt(0):%{g*}\
> @@ -185,10 +183,10 @@ index 9f790db0daf..f379f71da3d 100644
>  +#endif
>  + " %{undef} %{save-temps*:-fpch-preprocess}";
>
> - /* This contains cpp options which are not passed when the preprocessor
> -    output will be used by another program.  */
> + /* Pass -d* flags, possibly modifying -dumpdir, -dumpbase et al.
> +
>  diff --git a/gcc/incpath.c b/gcc/incpath.c
> -index 8a2bda00f80..9098ab044ab 100644
> +index 446d280321d..fbfc0ce03b8 100644
>  --- a/gcc/incpath.c
>  +++ b/gcc/incpath.c
>  @@ -26,6 +26,7 @@
> @@ -199,7 +197,7 @@ index 8a2bda00f80..9098ab044ab 100644
>
>   /* Microsoft Windows does not natively support inodes.
>      VMS has non-numeric inodes.  */
> -@@ -393,6 +394,26 @@ merge_include_chains (const char *sysroot, cpp_read=
er *pfile, int verbose)
> +@@ -395,6 +396,26 @@ merge_include_chains (const char *sysroot, cpp_read=
er *pfile, int verbose)
>         }
>         fprintf (stderr, _("End of search list.\n"));
>       }
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0003-CV=
E-2021-42574.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0=
003-CVE-2021-42574.patch
> new file mode 100644
> index 000000000000..2995a6fc6133
> --- /dev/null
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0003-CVE-2021-=
42574.patch
> @@ -0,0 +1,142 @@
> +From 1a7f2c0774129750fdf73e9f1b78f0ce983c9ab3 Mon Sep 17 00:00:00 2001
> +From: David Malcolm <dmalcolm@redhat.com>
> +Date: Tue, 2 Nov 2021 09:54:32 -0400
> +Subject: [PATCH] libcpp: escape non-ASCII source bytes in -Wbidi-chars=
=3D
> + [PR103026]
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3Dutf8
> +Content-Transfer-Encoding: 8bit
> +
> +This flags rich_locations associated with -Wbidi-chars=3D so that
> +non-ASCII bytes will be escaped when printing the source lines
> +(using the diagnostics support I added in
> +r12-4825-gbd5e882cf6e0def3dd1bc106075d59a303fe0d1e).
> +
> +In particular, this ensures that the printed source lines will
> +be pure ASCII, and thus the visual ordering of the characters
> +will be the same as the logical ordering.
> +
> +Before:
> +
> +  Wbidi-chars-1.c: In function =C3=A2main=C3=A2:
> +  Wbidi-chars-1.c:6:43: warning: unpaired UTF-8 bidirectional control ch=
aracter detected [-Wbidi-chars=3D]
> +      6 |     /*=C3=A2=C2=AE } =C3=A2=C2=A6if (isAdmin)=C3=A2=C2=A9 =C3=
=A2=C2=A6 begin admins only */
> +        |                                           ^
> +  Wbidi-chars-1.c:9:28: warning: unpaired UTF-8 bidirectional control ch=
aracter detected [-Wbidi-chars=3D]
> +      9 |     /* end admins only =C3=A2=C2=AE { =C3=A2=C2=A6*/
> +        |                            ^
> +
> +  Wbidi-chars-11.c:6:15: warning: UTF-8 vs UCN mismatch when closing a c=
ontext by "U+202C (POP DIRECTIONAL FORMATTING)" [-Wbidi-chars=3D]
> +      6 | int LRE_=C3=A2=C2=AA_PDF_\u202c;
> +        |               ^
> +  Wbidi-chars-11.c:8:19: warning: UTF-8 vs UCN mismatch when closing a c=
ontext by "U+202C (POP DIRECTIONAL FORMATTING)" [-Wbidi-chars=3D]
> +      8 | int LRE_\u202a_PDF_=C3=A2=C2=AC_;
> +        |                   ^
> +  Wbidi-chars-11.c:10:28: warning: UTF-8 vs UCN mismatch when closing a =
context by "U+202C (POP DIRECTIONAL FORMATTING)" [-Wbidi-chars=3D]
> +     10 | const char *s1 =3D "LRE_=C3=A2=C2=AA_PDF_\u202c";
> +        |                            ^
> +  Wbidi-chars-11.c:12:33: warning: UTF-8 vs UCN mismatch when closing a =
context by "U+202C (POP DIRECTIONAL FORMATTING)" [-Wbidi-chars=3D]
> +     12 | const char *s2 =3D "LRE_\u202a_PDF_=C3=A2=C2=AC";
> +        |                                 ^
> +
> +After:
> +
> +  Wbidi-chars-1.c: In function =C3=A2main=C3=A2:
> +  Wbidi-chars-1.c:6:43: warning: unpaired UTF-8 bidirectional control ch=
aracter detected [-Wbidi-chars=3D]
> +      6 |     /*<U+202E> } <U+2066>if (isAdmin)<U+2069> <U+2066> begin a=
dmins only */
> +        |                                                               =
            ^
> +  Wbidi-chars-1.c:9:28: warning: unpaired UTF-8 bidirectional control ch=
aracter detected [-Wbidi-chars=3D]
> +      9 |     /* end admins only <U+202E> { <U+2066>*/
> +        |                                            ^
> +
> +  Wbidi-chars-11.c:6:15: warning: UTF-8 vs UCN mismatch when closing a c=
ontext by "U+202C (POP DIRECTIONAL FORMATTING)" [-Wbidi-chars=3D]
> +      6 | int LRE_<U+202A>_PDF_\u202c;
> +        |                       ^
> +  Wbidi-chars-11.c:8:19: warning: UTF-8 vs UCN mismatch when closing a c=
ontext by "U+202C (POP DIRECTIONAL FORMATTING)" [-Wbidi-chars=3D]
> +      8 | int LRE_\u202a_PDF_<U+202C>_;
> +        |                   ^
> +  Wbidi-chars-11.c:10:28: warning: UTF-8 vs UCN mismatch when closing a =
context by "U+202C (POP DIRECTIONAL FORMATTING)" [-Wbidi-chars=3D]
> +     10 | const char *s1 =3D "LRE_<U+202A>_PDF_\u202c";
> +        |                                    ^
> +  Wbidi-chars-11.c:12:33: warning: UTF-8 vs UCN mismatch when closing a =
context by "U+202C (POP DIRECTIONAL FORMATTING)" [-Wbidi-chars=3D]
> +     12 | const char *s2 =3D "LRE_\u202a_PDF_<U+202C>";
> +        |                                 ^
> +
> +libcpp/ChangeLog:
> +       PR preprocessor/103026
> +       * lex.c (maybe_warn_bidi_on_close): Use a rich_location
> +       and call set_escape_on_output (true) on it.
> +       (maybe_warn_bidi_on_char): Likewise.
> +
> +Signed-off-by: David Malcolm <dmalcolm@redhat.com>
> +
> +CVE: CVE-2021-42574
> +Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=3Dgcc.gi=
t;h=3D1a7f2c0774129750fdf73e9f1b78f0ce983c9ab3]
> +Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> +
> +---
> + libcpp/lex.c | 29 +++++++++++++++++------------
> + 1 file changed, 17 insertions(+), 12 deletions(-)
> +
> +diff --git a/libcpp/lex.c b/libcpp/lex.c
> +index 8188e33b07d..2421d6c0f40 100644
> +--- a/libcpp/lex.c
> ++++ b/libcpp/lex.c
> +@@ -1427,9 +1427,11 @@ maybe_warn_bidi_on_close (cpp_reader *pfile, cons=
t uchar *p)
> +       const location_t loc
> +       =3D linemap_position_for_column (pfile->line_table,
> +                                      CPP_BUF_COLUMN (pfile->buffer, p))=
;
> +-      cpp_warning_with_line (pfile, CPP_W_BIDIRECTIONAL, loc, 0,
> +-                           "unpaired UTF-8 bidirectional control charac=
ter "
> +-                           "detected");
> ++      rich_location rich_loc (pfile->line_table, loc);
> ++      rich_loc.set_escape_on_output (true);
> ++      cpp_warning_at (pfile, CPP_W_BIDIRECTIONAL, &rich_loc,
> ++                    "unpaired UTF-8 bidirectional control character "
> ++                    "detected");
> +     }
> +   /* We're done with this context.  */
> +   bidi::on_close ();
> +@@ -1454,6 +1456,9 @@ maybe_warn_bidi_on_char (cpp_reader *pfile, const =
uchar *p, bidi::kind kind,
> +       const location_t loc
> +       =3D linemap_position_for_column (pfile->line_table,
> +                                      CPP_BUF_COLUMN (pfile->buffer, p))=
;
> ++      rich_location rich_loc (pfile->line_table, loc);
> ++      rich_loc.set_escape_on_output (true);
> ++
> +       /* It seems excessive to warn about a PDI/PDF that is closing
> +        an opened context because we've already warned about the
> +        opening character.  Except warn when we have a UCN x UTF-8
> +@@ -1462,20 +1467,20 @@ maybe_warn_bidi_on_char (cpp_reader *pfile, cons=
t uchar *p, bidi::kind kind,
> +       {
> +         if (warn_bidi =3D=3D bidirectional_unpaired
> +             && bidi::current_ctx_ucn_p () !=3D ucn_p)
> +-          cpp_warning_with_line (pfile, CPP_W_BIDIRECTIONAL, loc, 0,
> +-                                 "UTF-8 vs UCN mismatch when closing "
> +-                                 "a context by \"%s\"", bidi::to_str (k=
ind));
> ++          cpp_warning_at (pfile, CPP_W_BIDIRECTIONAL, &rich_loc,
> ++                          "UTF-8 vs UCN mismatch when closing "
> ++                          "a context by \"%s\"", bidi::to_str (kind));
> +       }
> +       else if (warn_bidi =3D=3D bidirectional_any)
> +       {
> +         if (kind =3D=3D bidi::kind::PDF || kind =3D=3D bidi::kind::PDI)
> +-          cpp_warning_with_line (pfile, CPP_W_BIDIRECTIONAL, loc, 0,
> +-                                 "\"%s\" is closing an unopened context=
",
> +-                                 bidi::to_str (kind));
> ++          cpp_warning_at (pfile, CPP_W_BIDIRECTIONAL, &rich_loc,
> ++                          "\"%s\" is closing an unopened context",
> ++                          bidi::to_str (kind));
> +         else
> +-          cpp_warning_with_line (pfile, CPP_W_BIDIRECTIONAL, loc, 0,
> +-                                 "found problematic Unicode character \=
"%s\"",
> +-                                 bidi::to_str (kind));
> ++          cpp_warning_at (pfile, CPP_W_BIDIRECTIONAL, &rich_loc,
> ++                          "found problematic Unicode character \"%s\"",
> ++                          bidi::to_str (kind));
> +       }
> +     }
> +   /* We're done with this context.  */
> +--
> +2.27.0
> +
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0004-64=
-bit-multilib-hack.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-=
11.2/0004-64-bit-multilib-hack.patch
> similarity index 84%
> rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0004-64-=
bit-multilib-hack.patch
> rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0004-64-bi=
t-multilib-hack.patch
> index 04d8bdf3314e..5f14dd2a58ac 100644
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0004-64-bit-mu=
ltilib-hack.patch
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0004-64-bit-mu=
ltilib-hack.patch
> @@ -1,4 +1,4 @@
> -From d166c36206b276f769e175f39cf44b33c98bd153 Mon Sep 17 00:00:00 2001
> +From 2fa5c93641b75a662839c1b6eee172b6c481c70e Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 29 Mar 2013 09:10:06 +0400
>  Subject: [PATCH] 64-bit multilib hack.
> @@ -19,25 +19,26 @@ and be able to patch these entries with a complete se=
t of correct paths but this
>  don't have such code at this point. This is something the target gcc rec=
ipe should do
>  and override these platform defaults in its build config.
>
> -Do same for riscv64 and aarch64
> +Do same for riscv64, aarch64 & arc
>
>  RP 15/8/11
>
> -Upstream-Status: Inappropriate[OE-Specific]
> +Upstream-Status: Inappropriate [OE-Specific]
>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
>  Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>  ---
>   gcc/config/aarch64/t-aarch64-linux |  8 ++++----
> + gcc/config/arc/t-multilib-linux    |  4 ++--
>   gcc/config/i386/t-linux64          |  6 ++----
>   gcc/config/mips/t-linux64          | 10 +++-------
>   gcc/config/riscv/t-linux           |  6 ++++--
>   gcc/config/rs6000/t-linux64        |  5 ++---
> - 5 files changed, 15 insertions(+), 20 deletions(-)
> + 6 files changed, 17 insertions(+), 22 deletions(-)
>
>  diff --git a/gcc/config/aarch64/t-aarch64-linux b/gcc/config/aarch64/t-a=
arch64-linux
> -index 83e59e33b85..b1356be1fb4 100644
> +index 241b0ef20b6..a7dadb2d64f 100644
>  --- a/gcc/config/aarch64/t-aarch64-linux
>  +++ b/gcc/config/aarch64/t-aarch64-linux
>  @@ -21,8 +21,8 @@
> @@ -53,8 +54,24 @@ index 83e59e33b85..b1356be1fb4 100644
>
>  -MULTILIB_OSDIRNAMES +=3D mabi.ilp32=3D../libilp32$(call if_multiarch,:a=
arch64$(AARCH_BE)-linux-gnu_ilp32)
>  +#MULTILIB_OSDIRNAMES +=3D mabi.ilp32=3D../libilp32$(call if_multiarch,:=
aarch64$(AARCH_BE)-linux-gnu_ilp32)
> +diff --git a/gcc/config/arc/t-multilib-linux b/gcc/config/arc/t-multilib=
-linux
> +index fc3fff640a2..d58e28f6df8 100644
> +--- a/gcc/config/arc/t-multilib-linux
> ++++ b/gcc/config/arc/t-multilib-linux
> +@@ -16,9 +16,9 @@
> + # along with GCC; see the file COPYING3.  If not see
> + # <http://www.gnu.org/licenses/>.
> +
> +-MULTILIB_OPTIONS =3D mcpu=3Dhs/mcpu=3Darchs/mcpu=3Dhs38/mcpu=3Dhs38_lin=
ux/mcpu=3Darc700/mcpu=3Dnps400
> ++#MULTILIB_OPTIONS =3D mcpu=3Dhs/mcpu=3Darchs/mcpu=3Dhs38/mcpu=3Dhs38_li=
nux/mcpu=3Darc700/mcpu=3Dnps400
> +
> +-MULTILIB_DIRNAMES =3D hs archs hs38 hs38_linux arc700 nps400
> ++#MULTILIB_DIRNAMES =3D hs archs hs38 hs38_linux arc700 nps400
> +
> + # Aliases:
> + MULTILIB_MATCHES +=3D mcpu?arc700=3DmA7
>  diff --git a/gcc/config/i386/t-linux64 b/gcc/config/i386/t-linux64
> -index 1171e218578..5e057b7e5db 100644
> +index d288b093522..7b5980a9d21 100644
>  --- a/gcc/config/i386/t-linux64
>  +++ b/gcc/config/i386/t-linux64
>  @@ -32,7 +32,5 @@
> @@ -68,7 +85,7 @@ index 1171e218578..5e057b7e5db 100644
>  +MULTILIB_DIRNAMES =3D . .
>  +MULTILIB_OSDIRNAMES =3D ../$(shell basename $(base_libdir)) ../$(shell =
basename $(base_libdir))
>  diff --git a/gcc/config/mips/t-linux64 b/gcc/config/mips/t-linux64
> -index ceb58d3b5f3..43fe2bf28ab 100644
> +index 130e1f04707..3b7eb6b2a2f 100644
>  --- a/gcc/config/mips/t-linux64
>  +++ b/gcc/config/mips/t-linux64
>  @@ -17,10 +17,6 @@
> @@ -98,7 +115,7 @@ index 216d2776a18..e4d817621fc 100644
>  +#MULTILIB_OSDIRNAMES :=3D $(patsubst lib%,../lib%,$(MULTILIB_DIRNAMES))
>  +MULTILIB_OSDIRNAMES :=3D ../$(shell basename $(base_libdir)) ../$(shell=
 basename $(base_libdir))
>  diff --git a/gcc/config/rs6000/t-linux64 b/gcc/config/rs6000/t-linux64
> -index 264a7e27524..dc9d440f66b 100644
> +index e11a118cb5f..4eaffb416fe 100644
>  --- a/gcc/config/rs6000/t-linux64
>  +++ b/gcc/config/rs6000/t-linux64
>  @@ -26,10 +26,9 @@
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0004-CV=
E-2021-42574.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0=
004-CVE-2021-42574.patch
> new file mode 100644
> index 000000000000..4999c71b641a
> --- /dev/null
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0004-CVE-2021-=
42574.patch
> @@ -0,0 +1,573 @@
> +From bef32d4a28595e933f24fef378cf052a30b674a7 Mon Sep 17 00:00:00 2001
> +From: David Malcolm <dmalcolm@redhat.com>
> +Date: Tue, 2 Nov 2021 15:45:22 -0400
> +Subject: [PATCH] libcpp: capture and underline ranges in -Wbidi-chars=3D
> + [PR103026]
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3Dutf8
> +Content-Transfer-Encoding: 8bit
> +
> +This patch converts the bidi::vec to use a struct so that we can
> +capture location_t values for the bidirectional control characters.
> +
> +Before:
> +
> +  Wbidi-chars-1.c: In function =C3=A2main=C3=A2:
> +  Wbidi-chars-1.c:6:43: warning: unpaired UTF-8 bidirectional control ch=
aracter detected [-Wbidi-chars=3D]
> +      6 |     /*<U+202E> } <U+2066>if (isAdmin)<U+2069> <U+2066> begin a=
dmins only */
> +        |                                                               =
            ^
> +  Wbidi-chars-1.c:9:28: warning: unpaired UTF-8 bidirectional control ch=
aracter detected [-Wbidi-chars=3D]
> +      9 |     /* end admins only <U+202E> { <U+2066>*/
> +        |                                            ^
> +
> +After:
> +
> +  Wbidi-chars-1.c: In function =C3=A2main=C3=A2:
> +  Wbidi-chars-1.c:6:43: warning: unpaired UTF-8 bidirectional control ch=
aracters detected [-Wbidi-chars=3D]
> +      6 |     /*<U+202E> } <U+2066>if (isAdmin)<U+2069> <U+2066> begin a=
dmins only */
> +        |       ~~~~~~~~                                ~~~~~~~~        =
            ^
> +        |       |                                       |               =
            |
> +        |       |                                       |               =
            end of bidirectional context
> +        |       U+202E (RIGHT-TO-LEFT OVERRIDE)         U+2066 (LEFT-TO-=
RIGHT ISOLATE)
> +  Wbidi-chars-1.c:9:28: warning: unpaired UTF-8 bidirectional control ch=
aracters detected [-Wbidi-chars=3D]
> +      9 |     /* end admins only <U+202E> { <U+2066>*/
> +        |                        ~~~~~~~~   ~~~~~~~~ ^
> +        |                        |          |        |
> +        |                        |          |        end of bidirectiona=
l context
> +        |                        |          U+2066 (LEFT-TO-RIGHT ISOLAT=
E)
> +        |                        U+202E (RIGHT-TO-LEFT OVERRIDE)
> +
> +Signed-off-by: David Malcolm <dmalcolm@redhat.com>
> +
> +gcc/testsuite/ChangeLog:
> +       PR preprocessor/103026
> +       * c-c++-common/Wbidi-chars-ranges.c: New test.
> +
> +libcpp/ChangeLog:
> +       PR preprocessor/103026
> +       * lex.c (struct bidi::context): New.
> +       (bidi::vec): Convert to a vec of context rather than unsigned
> +       char.
> +       (bidi::ctx_at): Rename to...
> +       (bidi::pop_kind_at): ...this and reimplement for above change.
> +       (bidi::current_ctx): Update for change to vec.
> +       (bidi::current_ctx_ucn_p): Likewise.
> +       (bidi::current_ctx_loc): New.
> +       (bidi::on_char): Update for usage of context struct.  Add "loc"
> +       param and pass it when pushing contexts.
> +       (get_location_for_byte_range_in_cur_line): New.
> +       (get_bidi_utf8): Rename to...
> +       (get_bidi_utf8_1): ...this, reintroducing...
> +       (get_bidi_utf8): ...as a wrapper, setting *OUT when the result is
> +       not NONE.
> +       (get_bidi_ucn): Rename to...
> +       (get_bidi_ucn_1): ...this, reintroducing...
> +       (get_bidi_ucn): ...as a wrapper, setting *OUT when the result is
> +       not NONE.
> +       (class unpaired_bidi_rich_location): New.
> +       (maybe_warn_bidi_on_close): Use unpaired_bidi_rich_location when
> +       reporting on unpaired bidi chars.  Split into singular vs plural
> +       spellings.
> +       (maybe_warn_bidi_on_char): Pass in a location_t rather than a
> +       const uchar * and use it when emitting warnings, and when calling
> +       bidi::on_char.
> +       (_cpp_skip_block_comment): Capture location when kind is not NONE
> +       and pass it to maybe_warn_bidi_on_char.
> +       (skip_line_comment): Likewise.
> +       (forms_identifier_p): Likewise.
> +       (lex_raw_string): Likewise.
> +       (lex_string): Likewise.
> +
> +Signed-off-by: David Malcolm <dmalcolm@redhat.com>
> +
> +CVE: CVE-2021-42574
> +Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=3Dgcc.gi=
t;h=3Dbef32d4a28595e933f24fef378cf052a30b674a7]
> +Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> +
> +---
> + .../c-c++-common/Wbidi-chars-ranges.c         |  54 ++++
> + libcpp/lex.c                                  | 251 ++++++++++++++----
> + 2 files changed, 257 insertions(+), 48 deletions(-)
> + create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-ranges.c
> +
> +diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-ranges.c b/gcc/tests=
uite/c-c++-common/Wbidi-chars-ranges.c
> +new file mode 100644
> +index 00000000000..298750a2a64
> +--- /dev/null
> ++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-ranges.c
> +@@ -0,0 +1,54 @@
> ++/* PR preprocessor/103026 */
> ++/* { dg-do compile } */
> ++/* { dg-options "-Wbidi-chars=3Dunpaired -fdiagnostics-show-caret" } */
> ++/* Verify that we escape and underline pertinent bidirectional
> ++   control characters when quoting the source.  */
> ++
> ++int test_unpaired_bidi () {
> ++    int isAdmin =3D 0;
> ++    /*=C3=A2=C2=AE } =C3=A2=C2=A6if (isAdmin)=C3=A2=C2=A9 =C3=A2=C2=A6 =
begin admins only */
> ++/* { dg-warning "bidirectional" "" { target *-*-* } .-1 } */
> ++#if 0
> ++   { dg-begin-multiline-output "" }
> ++     /*<U+202E> } <U+2066>if (isAdmin)<U+2069> <U+2066> begin admins on=
ly */
> ++       ~~~~~~~~                                ~~~~~~~~                =
    ^
> ++       |                                       |                       =
    |
> ++       |                                       |                       =
    end of bidirectional context
> ++       U+202E (RIGHT-TO-LEFT OVERRIDE)         U+2066 (LEFT-TO-RIGHT IS=
OLATE)
> ++   { dg-end-multiline-output "" }
> ++#endif
> ++
> ++        __builtin_printf("You are an admin.\n");
> ++    /* end admins only =C3=A2=C2=AE { =C3=A2=C2=A6*/
> ++/* { dg-warning "bidirectional" "" { target *-*-* } .-1 } */
> ++#if 0
> ++   { dg-begin-multiline-output "" }
> ++     /* end admins only <U+202E> { <U+2066>*/
> ++                        ~~~~~~~~   ~~~~~~~~ ^
> ++                        |          |        |
> ++                        |          |        end of bidirectional contex=
t
> ++                        |          U+2066 (LEFT-TO-RIGHT ISOLATE)
> ++                        U+202E (RIGHT-TO-LEFT OVERRIDE)
> ++   { dg-end-multiline-output "" }
> ++#endif
> ++
> ++    return 0;
> ++}
> ++
> ++int LRE_=C3=A2=C2=AA_PDF_\u202c;
> ++/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
> ++#if 0
> ++   { dg-begin-multiline-output "" }
> ++ int LRE_<U+202A>_PDF_\u202c;
> ++         ~~~~~~~~     ^~~~~~
> ++   { dg-end-multiline-output "" }
> ++#endif
> ++
> ++const char *s1 =3D "LRE_=C3=A2=C2=AA_PDF_\u202c";
> ++/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
> ++#if 0
> ++   { dg-begin-multiline-output "" }
> ++ const char *s1 =3D "LRE_<U+202A>_PDF_\u202c";
> ++                       ~~~~~~~~     ^~~~~~
> ++   { dg-end-multiline-output "" }
> ++#endif
> +diff --git a/libcpp/lex.c b/libcpp/lex.c
> +index 2421d6c0f40..94c36f0d014 100644
> +--- a/libcpp/lex.c
> ++++ b/libcpp/lex.c
> +@@ -1172,11 +1172,34 @@ namespace bidi {
> +   /* All the UTF-8 encodings of bidi characters start with E2.  */
> +   constexpr uchar utf8_start =3D 0xe2;
> +
> ++  struct context
> ++  {
> ++    context () {}
> ++    context (location_t loc, kind k, bool pdf, bool ucn)
> ++    : m_loc (loc), m_kind (k), m_pdf (pdf), m_ucn (ucn)
> ++    {
> ++    }
> ++
> ++    kind get_pop_kind () const
> ++    {
> ++      return m_pdf ? kind::PDF : kind::PDI;
> ++    }
> ++    bool ucn_p () const
> ++    {
> ++      return m_ucn;
> ++    }
> ++
> ++    location_t m_loc;
> ++    kind m_kind;
> ++    unsigned m_pdf : 1;
> ++    unsigned m_ucn : 1;
> ++  };
> ++
> +   /* A vector holding currently open bidi contexts.  We use a char for
> +      each context, its LSB is 1 if it represents a PDF context, 0 if it
> +      represents a PDI context.  The next bit is 1 if this context was o=
pen
> +      by a bidi character written as a UCN, and 0 when it was UTF-8.  */
> +-  semi_embedded_vec <unsigned char, 16> vec;
> ++  semi_embedded_vec <context, 16> vec;
> +
> +   /* Close the whole comment/identifier/string literal/character consta=
nt
> +      context.  */
> +@@ -1193,19 +1216,19 @@ namespace bidi {
> +     vec.truncate (len - 1);
> +   }
> +
> +-  /* Return the context of the Ith element.  */
> +-  kind ctx_at (unsigned int i)
> ++  /* Return the pop kind of the context of the Ith element.  */
> ++  kind pop_kind_at (unsigned int i)
> +   {
> +-    return (vec[i] & 1) ? kind::PDF : kind::PDI;
> ++    return vec[i].get_pop_kind ();
> +   }
> +
> +-  /* Return which context is currently opened.  */
> ++  /* Return the pop kind of the context that is currently opened.  */
> +   kind current_ctx ()
> +   {
> +     unsigned int len =3D vec.count ();
> +     if (len =3D=3D 0)
> +       return kind::NONE;
> +-    return ctx_at (len - 1);
> ++    return vec[len - 1].get_pop_kind ();
> +   }
> +
> +   /* Return true if the current context comes from a UCN origin, that i=
s,
> +@@ -1214,11 +1237,19 @@ namespace bidi {
> +   {
> +     unsigned int len =3D vec.count ();
> +     gcc_checking_assert (len > 0);
> +-    return (vec[len - 1] >> 1) & 1;
> ++    return vec[len - 1].m_ucn;
> +   }
> +
> +-  /* We've read a bidi char, update the current vector as necessary.  *=
/
> +-  void on_char (kind k, bool ucn_p)
> ++  location_t current_ctx_loc ()
> ++  {
> ++    unsigned int len =3D vec.count ();
> ++    gcc_checking_assert (len > 0);
> ++    return vec[len - 1].m_loc;
> ++  }
> ++
> ++  /* We've read a bidi char, update the current vector as necessary.
> ++     LOC is only valid when K is not kind::NONE.  */
> ++  void on_char (kind k, bool ucn_p, location_t loc)
> +   {
> +     switch (k)
> +       {
> +@@ -1226,12 +1257,12 @@ namespace bidi {
> +       case kind::RLE:
> +       case kind::LRO:
> +       case kind::RLO:
> +-      vec.push (ucn_p ? 3u : 1u);
> ++      vec.push (context (loc, k, true, ucn_p));
> +       break;
> +       case kind::LRI:
> +       case kind::RLI:
> +       case kind::FSI:
> +-      vec.push (ucn_p ? 2u : 0u);
> ++      vec.push (context (loc, k, false, ucn_p));
> +       break;
> +       /* PDF terminates the scope of the last LRE, RLE, LRO, or RLO
> +        whose scope has not yet been terminated.  */
> +@@ -1245,7 +1276,7 @@ namespace bidi {
> +        yet been terminated.  */
> +       case kind::PDI:
> +       for (int i =3D vec.count () - 1; i >=3D 0; --i)
> +-        if (ctx_at (i) =3D=3D kind::PDI)
> ++        if (pop_kind_at (i) =3D=3D kind::PDI)
> +           {
> +             vec.truncate (i);
> +             break;
> +@@ -1295,10 +1326,47 @@ namespace bidi {
> +   }
> + }
> +
> ++/* Get location_t for the range of bytes [START, START + NUM_BYTES)
> ++   within the current line in FILE, with the caret at START.  */
> ++
> ++static location_t
> ++get_location_for_byte_range_in_cur_line (cpp_reader *pfile,
> ++                                       const unsigned char *const start=
,
> ++                                       size_t num_bytes)
> ++{
> ++  gcc_checking_assert (num_bytes > 0);
> ++
> ++  /* CPP_BUF_COLUMN and linemap_position_for_column both refer
> ++     to offsets in bytes, but CPP_BUF_COLUMN is 0-based,
> ++     whereas linemap_position_for_column is 1-based.  */
> ++
> ++  /* Get 0-based offsets within the line.  */
> ++  size_t start_offset =3D CPP_BUF_COLUMN (pfile->buffer, start);
> ++  size_t end_offset =3D start_offset + num_bytes - 1;
> ++
> ++  /* Now convert to location_t, where "columns" are 1-based byte offset=
s.  */
> ++  location_t start_loc =3D linemap_position_for_column (pfile->line_tab=
le,
> ++                                                    start_offset + 1);
> ++  location_t end_loc =3D linemap_position_for_column (pfile->line_table=
,
> ++                                                   end_offset + 1);
> ++
> ++  if (start_loc =3D=3D end_loc)
> ++    return start_loc;
> ++
> ++  source_range src_range;
> ++  src_range.m_start =3D start_loc;
> ++  src_range.m_finish =3D end_loc;
> ++  location_t combined_loc =3D COMBINE_LOCATION_DATA (pfile->line_table,
> ++                                                 start_loc,
> ++                                                 src_range,
> ++                                                 NULL);
> ++  return combined_loc;
> ++}
> ++
> + /* Parse a sequence of 3 bytes starting with P and return its bidi code=
.  */
> +
> + static bidi::kind
> +-get_bidi_utf8 (const unsigned char *const p)
> ++get_bidi_utf8_1 (const unsigned char *const p)
> + {
> +   gcc_checking_assert (p[0] =3D=3D bidi::utf8_start);
> +
> +@@ -1340,10 +1408,25 @@ get_bidi_utf8 (const unsigned char *cons
> +   return bidi::kind::NONE;
> + }
> +
> ++/* Parse a sequence of 3 bytes starting with P and return its bidi code=
.
> ++   If the kind is not NONE, write the location to *OUT.*/
> ++
> ++static bidi::kind
> ++get_bidi_utf8 (cpp_reader *pfile, const unsigned char *const p, locatio=
n_t *out)
> ++{
> ++  bidi::kind result =3D get_bidi_utf8_1 (p);
> ++  if (result !=3D bidi::kind::NONE)
> ++    {
> ++      /* We have a sequence of 3 bytes starting at P.  */
> ++      *out =3D get_location_for_byte_range_in_cur_line (pfile, p, 3);
> ++    }
> ++  return result;
> ++}
> ++
> + /* Parse a UCN where P points just past \u or \U and return its bidi co=
de.  */
> +
> + static bidi::kind
> +-get_bidi_ucn (const unsigned char *p, bool is_U)
> ++get_bidi_ucn_1 (const unsigned char *p, bool is_U)
> + {
> +   /* 6.4.3 Universal Character Names
> +       \u hex-quad
> +@@ -1412,6 +1495,62 @@ get_bidi_ucn (const unsigned char *p, bo
> +   return bidi::kind::NONE;
> + }
> +
> ++/* Parse a UCN where P points just past \u or \U and return its bidi co=
de.
> ++   If the kind is not NONE, write the location to *OUT.*/
> ++
> ++static bidi::kind
> ++get_bidi_ucn (cpp_reader *pfile,  const unsigned char *p, bool is_U,
> ++            location_t *out)
> ++{
> ++  bidi::kind result =3D get_bidi_ucn_1 (p, is_U);
> ++  if (result !=3D bidi::kind::NONE)
> ++    {
> ++      const unsigned char *start =3D p - 2;
> ++      size_t num_bytes =3D 2 + (is_U ? 8 : 4);
> ++      *out =3D get_location_for_byte_range_in_cur_line (pfile, start, n=
um_bytes);
> ++    }
> ++  return result;
> ++}
> ++
> ++/* Subclass of rich_location for reporting on unpaired UTF-8
> ++   bidirectional control character(s).
> ++   Escape the source lines on output, and show all unclosed
> ++   bidi context, labelling everything.  */
> ++
> ++class unpaired_bidi_rich_location : public rich_location
> ++{
> ++ public:
> ++  class custom_range_label : public range_label
> ++  {
> ++   public:
> ++     label_text get_text (unsigned range_idx) const FINAL OVERRIDE
> ++     {
> ++       /* range 0 is the primary location; each subsequent range i + 1
> ++        is for bidi::vec[i].  */
> ++       if (range_idx > 0)
> ++       {
> ++         const bidi::context &ctxt (bidi::vec[range_idx - 1]);
> ++         return label_text::borrow (bidi::to_str (ctxt.m_kind));
> ++       }
> ++       else
> ++       return label_text::borrow (_("end of bidirectional context"));
> ++     }
> ++  };
> ++
> ++  unpaired_bidi_rich_location (cpp_reader *pfile, location_t loc)
> ++  : rich_location (pfile->line_table, loc, &m_custom_label)
> ++  {
> ++    set_escape_on_output (true);
> ++    for (unsigned i =3D 0; i < bidi::vec.count (); i++)
> ++      add_range (bidi::vec[i].m_loc,
> ++               SHOW_RANGE_WITHOUT_CARET,
> ++               &m_custom_label);
> ++  }
> ++
> ++ private:
> ++   custom_range_label m_custom_label;
> ++};
> ++
> + /* We're closing a bidi context, that is, we've encountered a newline,
> +    are closing a C-style comment, or are at the end of a string literal=
,
> +    character constant, or identifier.  Warn if this context was not
> +@@ -1427,11 +1566,17 @@ maybe_warn_bidi_on_close (cpp_reader *pf
> +       const location_t loc
> +       =3D linemap_position_for_column (pfile->line_table,
> +                                      CPP_BUF_COLUMN (pfile->buffer, p))=
;
> +-      rich_location rich_loc (pfile->line_table, loc);
> +-      rich_loc.set_escape_on_output (true);
> +-      cpp_warning_at (pfile, CPP_W_BIDIRECTIONAL, &rich_loc,
> +-                    "unpaired UTF-8 bidirectional control character "
> +-                    "detected");
> ++      unpaired_bidi_rich_location rich_loc (pfile, loc);
> ++      /* cpp_callbacks doesn't yet have a way to handle singular vs plu=
ral
> ++       forms of a diagnostic, so fake it for now.  */
> ++      if (bidi::vec.count () > 1)
> ++      cpp_warning_at (pfile, CPP_W_BIDIRECTIONAL, &rich_loc,
> ++                      "unpaired UTF-8 bidirectional control characters =
"
> ++                      "detected");
> ++      else
> ++      cpp_warning_at (pfile, CPP_W_BIDIRECTIONAL, &rich_loc,
> ++                      "unpaired UTF-8 bidirectional control character "
> ++                      "detected");
> +     }
> +   /* We're done with this context.  */
> +   bidi::on_close ();
> +@@ -1439,12 +1584,13 @@ maybe_warn_bidi_on_close (cpp_reader *pf
> +
> + /* We're at the beginning or in the middle of an identifier/comment/str=
ing
> +    literal/character constant.  Warn if we've encountered a bidi charac=
ter.
> +-   KIND says which bidi character it was; P points to it in the charact=
er
> +-   stream.  UCN_P is true iff this bidi character was written as a UCN.=
  */
> ++   KIND says which bidi control character it was; UCN_P is true iff thi=
s bidi
> ++   control character was written as a UCN.  LOC is the location of the
> ++   character, but is only valid if KIND !=3D bidi::kind::NONE.  */
> +
> + static void
> +-maybe_warn_bidi_on_char (cpp_reader *pfile, const uchar *p, bidi::kind =
kind,
> +-                       bool ucn_p)
> ++maybe_warn_bidi_on_char (cpp_reader *pfile, bidi::kind kind,
> ++                       bool ucn_p, location_t loc)
> + {
> +   if (__builtin_expect (kind =3D=3D bidi::kind::NONE, 1))
> +     return;
> +@@ -1453,9 +1599,6 @@ maybe_warn_bidi_on_char (cpp_reader *pfi
> +
> +   if (warn_bidi !=3D bidirectional_none)
> +     {
> +-      const location_t loc
> +-      =3D linemap_position_for_column (pfile->line_table,
> +-                                     CPP_BUF_COLUMN (pfile->buffer, p))=
;
> +       rich_location rich_loc (pfile->line_table, loc);
> +       rich_loc.set_escape_on_output (true);
> +
> +@@ -1467,9 +1610,12 @@ maybe_warn_bidi_on_char (cpp_reader *pfi
> +       {
> +         if (warn_bidi =3D=3D bidirectional_unpaired
> +             && bidi::current_ctx_ucn_p () !=3D ucn_p)
> +-          cpp_warning_at (pfile, CPP_W_BIDIRECTIONAL, &rich_loc,
> +-                          "UTF-8 vs UCN mismatch when closing "
> +-                          "a context by \"%s\"", bidi::to_str (kind));
> ++          {
> ++            rich_loc.add_range (bidi::current_ctx_loc ());
> ++            cpp_warning_at (pfile, CPP_W_BIDIRECTIONAL, &rich_loc,
> ++                            "UTF-8 vs UCN mismatch when closing "
> ++                            "a context by \"%s\"", bidi::to_str (kind))=
;
> ++          }
> +       }
> +       else if (warn_bidi =3D=3D bidirectional_any)
> +       {
> +@@ -1484,7 +1630,7 @@ maybe_warn_bidi_on_char (cpp_reader *pfi
> +       }
> +     }
> +   /* We're done with this context.  */
> +-  bidi::on_char (kind, ucn_p);
> ++  bidi::on_char (kind, ucn_p, loc);
> + }
> +
> + /* Skip a C-style block comment.  We find the end of the comment by
> +@@ -1552,8 +1698,9 @@ _cpp_skip_block_comment (cpp_reader *pfi
> +        a bidirectional control character.  */
> +       else if (__builtin_expect (c =3D=3D bidi::utf8_start, 0) && warn_=
bidi_p)
> +       {
> +-        bidi::kind kind =3D get_bidi_utf8 (cur - 1);
> +-        maybe_warn_bidi_on_char (pfile, cur, kind, /*ucn_p=3D*/false);
> ++        location_t loc;
> ++        bidi::kind kind =3D get_bidi_utf8 (pfile, cur - 1, &loc);
> ++        maybe_warn_bidi_on_char (pfile, kind, /*ucn_p=3D*/false, loc);
> +       }
> +     }
> +
> +@@ -1586,9 +1733,9 @@ skip_line_comment (cpp_reader *pfile)
> +           {
> +             if (__builtin_expect (*buffer->cur =3D=3D bidi::utf8_start,=
 0))
> +               {
> +-                bidi::kind kind =3D get_bidi_utf8 (buffer->cur);
> +-                maybe_warn_bidi_on_char (pfile, buffer->cur, kind,
> +-                                         /*ucn_p=3D*/false);
> ++                location_t loc;
> ++                bidi::kind kind =3D get_bidi_utf8 (pfile, buffer->cur, =
&loc);
> ++                maybe_warn_bidi_on_char (pfile, kind, /*ucn_p=3D*/false=
, loc);
> +               }
> +             buffer->cur++;
> +           }
> +@@ -1708,9 +1855,9 @@ forms_identifier_p (cpp_reader *pfile, i
> +         if (__builtin_expect (*buffer->cur =3D=3D bidi::utf8_start, 0)
> +             && warn_bidi_p)
> +           {
> +-            bidi::kind kind =3D get_bidi_utf8 (buffer->cur);
> +-            maybe_warn_bidi_on_char (pfile, buffer->cur, kind,
> +-                                     /*ucn_p=3D*/false);
> ++            location_t loc;
> ++            bidi::kind kind =3D get_bidi_utf8 (pfile, buffer->cur, &loc=
);
> ++            maybe_warn_bidi_on_char (pfile, kind, /*ucn_p=3D*/false, lo=
c);
> +           }
> +         if (_cpp_valid_utf8 (pfile, &buffer->cur, buffer->rlimit, 1 + !=
first,
> +                              state, &s))
> +@@ -1722,10 +1869,12 @@ forms_identifier_p (cpp_reader *pfile, i
> +         buffer->cur +=3D 2;
> +         if (warn_bidi_p)
> +           {
> +-            bidi::kind kind =3D get_bidi_ucn (buffer->cur,
> +-                                            buffer->cur[-1] =3D=3D 'U')=
;
> +-            maybe_warn_bidi_on_char (pfile, buffer->cur, kind,
> +-                                     /*ucn_p=3D*/true);
> ++            location_t loc;
> ++            bidi::kind kind =3D get_bidi_ucn (pfile,
> ++                                            buffer->cur,
> ++                                            buffer->cur[-1] =3D=3D 'U',
> ++                                            &loc);
> ++            maybe_warn_bidi_on_char (pfile, kind, /*ucn_p=3D*/true, loc=
);
> +           }
> +         if (_cpp_valid_ucn (pfile, &buffer->cur, buffer->rlimit, 1 + !f=
irst,
> +                             state, &s, NULL, NULL))
> +@@ -2336,8 +2485,11 @@ lex_raw_string (cpp_reader *pfile, cpp_t
> +       }
> +       else if (__builtin_expect ((unsigned char) c =3D=3D bidi::utf8_st=
art, 0)
> +              && warn_bidi_p)
> +-      maybe_warn_bidi_on_char (pfile, pos - 1, get_bidi_utf8 (pos - 1),
> +-                               /*ucn_p=3D*/false);
> ++      {
> ++        location_t loc;
> ++        bidi::kind kind =3D get_bidi_utf8 (pfile, pos - 1, &loc);
> ++        maybe_warn_bidi_on_char (pfile, kind, /*ucn_p=3D*/false, loc);
> ++      }
> +     }
> +
> +   if (warn_bidi_p)
> +@@ -2447,8 +2599,10 @@ lex_string (cpp_reader *pfile, cpp_token
> +       {
> +         if ((cur[0] =3D=3D 'u' || cur[0] =3D=3D 'U') && warn_bidi_p)
> +           {
> +-            bidi::kind kind =3D get_bidi_ucn (cur + 1, cur[0] =3D=3D 'U=
');
> +-            maybe_warn_bidi_on_char (pfile, cur, kind, /*ucn_p=3D*/true=
);
> ++            location_t loc;
> ++            bidi::kind kind =3D get_bidi_ucn (pfile, cur + 1, cur[0] =
=3D=3D 'U',
> ++                                            &loc);
> ++            maybe_warn_bidi_on_char (pfile, kind, /*ucn_p=3D*/true, loc=
);
> +           }
> +         cur++;
> +       }
> +@@ -2476,8 +2630,9 @@ lex_string (cpp_reader *pfile, cpp_token
> +       saw_NUL =3D true;
> +       else if (__builtin_expect (c =3D=3D bidi::utf8_start, 0) && warn_=
bidi_p)
> +       {
> +-        bidi::kind kind =3D get_bidi_utf8 (cur - 1);
> +-        maybe_warn_bidi_on_char (pfile, cur - 1, kind, /*ucn_p=3D*/fals=
e);
> ++        location_t loc;
> ++        bidi::kind kind =3D get_bidi_utf8 (pfile, cur - 1, &loc);
> ++        maybe_warn_bidi_on_char (pfile, kind, /*ucn_p=3D*/false, loc);
> +       }
> +     }
> +
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0006-If=
-CXXFLAGS-contains-something-unsupported-by-the-bu.patch b/meta-arm-toolcha=
in/recipes-devtools/gcc/gcc-arm-11.2/0006-If-CXXFLAGS-contains-something-un=
supported-by-the-bu.patch
> new file mode 100644
> index 000000000000..98a1bb2a6682
> --- /dev/null
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0006-If-CXXFLA=
GS-contains-something-unsupported-by-the-bu.patch
> @@ -0,0 +1,63 @@
> +From e700190743fa29ddaebd6ee075298a24b1688773 Mon Sep 17 00:00:00 2001
> +From: Richard Purdie <richard.purdie@linuxfoundation.org>
> +Date: Thu, 28 Oct 2021 11:33:40 +0100
> +Subject: [PATCH 6/6] If CXXFLAGS contains something unsupported by the b=
uild
> + CXX, we see build failures (e.g. using -fmacro-prefix-map for the targe=
t).
> +
> +Pass CXXFLAGS_FOR_BUILD in a couple of places to avoid these errors.
> +
> +2021-10-28 Richard Purdie <richard.purdie@linuxfoundation.org>
> +
> +ChangeLog:
> +
> +    * Makefile.in: Regenerate.
> +    * Makefile.tpl: Add missing CXXFLAGS_FOR_BUILD overrides
> +
> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> +---
> + Makefile.in  | 2 ++
> + Makefile.tpl | 2 ++
> + 2 files changed, 4 insertions(+)
> +
> +Upstream-Status: Pending [should be submittable]
> +
> +Index: gcc-11.2.0/Makefile.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-11.2.0.orig/Makefile.in
> ++++ gcc-11.2.0/Makefile.in
> +@@ -172,6 +172,7 @@ BUILD_EXPORTS =3D \
> + # built for the build system to override those in BASE_FLAGS_TO_PASS.
> + EXTRA_BUILD_FLAGS =3D \
> +       CFLAGS=3D"$(CFLAGS_FOR_BUILD)" \
> ++      CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)" \
> +       LDFLAGS=3D"$(LDFLAGS_FOR_BUILD)"
> +
> + # This is the list of directories to built for the host system.
> +@@ -203,6 +204,7 @@ HOST_EXPORTS =3D \
> +       CPP_FOR_BUILD=3D"$(CPP_FOR_BUILD)"; export CPP_FOR_BUILD; \
> +       CPPFLAGS_FOR_BUILD=3D"$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS_FOR=
_BUILD; \
> +       CXX_FOR_BUILD=3D"$(CXX_FOR_BUILD)"; export CXX_FOR_BUILD; \
> ++      CXXFLAGS_FOR_BUILD=3D"$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS_FOR=
_BUILD; \
> +       DLLTOOL=3D"$(DLLTOOL)"; export DLLTOOL; \
> +       LD=3D"$(LD)"; export LD; \
> +       LDFLAGS=3D"$(STAGE1_LDFLAGS) $(LDFLAGS)"; export LDFLAGS; \
> +Index: gcc-11.2.0/Makefile.tpl
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-11.2.0.orig/Makefile.tpl
> ++++ gcc-11.2.0/Makefile.tpl
> +@@ -175,6 +175,7 @@ BUILD_EXPORTS =3D \
> + # built for the build system to override those in BASE_FLAGS_TO_PASS.
> + EXTRA_BUILD_FLAGS =3D \
> +       CFLAGS=3D"$(CFLAGS_FOR_BUILD)" \
> ++      CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)" \
> +       LDFLAGS=3D"$(LDFLAGS_FOR_BUILD)"
> +
> + # This is the list of directories to built for the host system.
> +@@ -206,6 +207,7 @@ HOST_EXPORTS =3D \
> +       CPP_FOR_BUILD=3D"$(CPP_FOR_BUILD)"; export CPP_FOR_BUILD; \
> +       CPPFLAGS_FOR_BUILD=3D"$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS_FOR=
_BUILD; \
> +       CXX_FOR_BUILD=3D"$(CXX_FOR_BUILD)"; export CXX_FOR_BUILD; \
> ++      CXXFLAGS_FOR_BUILD=3D"$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS_FOR=
_BUILD; \
> +       DLLTOOL=3D"$(DLLTOOL)"; export DLLTOOL; \
> +       LD=3D"$(LD)"; export LD; \
> +       LDFLAGS=3D"$(STAGE1_LDFLAGS) $(LDFLAGS)"; export LDFLAGS; \
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0007-Us=
e-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch b/meta-arm-toolchain=
/recipes-devtools/gcc/gcc-arm-11.2/0007-Use-the-defaults.h-in-B-instead-of-=
S-and-t-oe-in-B.patch
> similarity index 88%
> rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0007-Use=
-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
> rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0007-Use-t=
he-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
> index c7693a8b778c..9844c2ae8add 100644
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0007-Use-the-d=
efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0007-Use-the-d=
efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
> @@ -1,4 +1,4 @@
> -From 938b65c6ba6cb4af24285f288126fe65b3e1fa9e Mon Sep 17 00:00:00 2001
> +From e64342df647829d3e1c52fd480a5be7c1281ced0 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 29 Mar 2013 09:17:25 +0400
>  Subject: [PATCH] Use the defaults.h in ${B} instead of ${S}, and t-oe in=
 ${B}
> @@ -26,10 +26,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>   4 files changed, 7 insertions(+), 7 deletions(-)
>
>  diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> -index 646db219460..501a5f16d9f 100644
> +index 8a5fb3fd99c..7da6f439fff 100644
>  --- a/gcc/Makefile.in
>  +++ b/gcc/Makefile.in
> -@@ -540,7 +540,7 @@ TARGET_SYSTEM_ROOT =3D @TARGET_SYSTEM_ROOT@
> +@@ -552,7 +552,7 @@ TARGET_SYSTEM_ROOT =3D @TARGET_SYSTEM_ROOT@
>   TARGET_SYSTEM_ROOT_DEFINE =3D @TARGET_SYSTEM_ROOT_DEFINE@
>
>   xmake_file=3D@xmake_file@
> @@ -39,10 +39,10 @@ index 646db219460..501a5f16d9f 100644
>   TM_MULTILIB_CONFIG=3D@TM_MULTILIB_CONFIG@
>   TM_MULTILIB_EXCEPTIONS_CONFIG=3D@TM_MULTILIB_EXCEPTIONS_CONFIG@
>  diff --git a/gcc/configure b/gcc/configure
> -index 8976850dff6..4d903cf40e8 100755
> +index 3f0734bff11..c5d3bc4ee2d 100755
>  --- a/gcc/configure
>  +++ b/gcc/configure
> -@@ -12710,8 +12710,8 @@ for f in $tm_file; do
> +@@ -13090,8 +13090,8 @@ for f in $tm_file; do
>          tm_include_list=3D"${tm_include_list} $f"
>          ;;
>       defaults.h )
> @@ -54,10 +54,10 @@ index 8976850dff6..4d903cf40e8 100755
>       * )
>          tm_file_list=3D"${tm_file_list} \$(srcdir)/config/$f"
>  diff --git a/gcc/configure.ac b/gcc/configure.ac
> -index 13eace6cfc6..07aacfee055 100644
> +index 54e21764b3e..f83420326d6 100644
>  --- a/gcc/configure.ac
>  +++ b/gcc/configure.ac
> -@@ -2143,8 +2143,8 @@ for f in $tm_file; do
> +@@ -2263,8 +2263,8 @@ for f in $tm_file; do
>          tm_include_list=3D"${tm_include_list} $f"
>          ;;
>       defaults.h )
> @@ -69,7 +69,7 @@ index 13eace6cfc6..07aacfee055 100644
>       * )
>          tm_file_list=3D"${tm_file_list} \$(srcdir)/config/$f"
>  diff --git a/gcc/mkconfig.sh b/gcc/mkconfig.sh
> -index d2c677a4a42..d03852481cb 100644
> +index c49acd8f7e4..a0a657bdbb9 100644
>  --- a/gcc/mkconfig.sh
>  +++ b/gcc/mkconfig.sh
>  @@ -77,7 +77,7 @@ if [ -n "$HEADERS" ]; then
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0009-cp=
p-honor-sysroot.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.=
2/0009-cpp-honor-sysroot.patch
> new file mode 100644
> index 000000000000..37f26f0728bd
> --- /dev/null
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0009-cpp-honor=
-sysroot.patch
> @@ -0,0 +1,59 @@
> +From: Richard Purdie <richard.purdie@linuxfoundation.org>
> +Subject: [PATCH 5/5] gcc: Pass sysroot options to cpp for preprocessed s=
ource
> +
> +OpenEmbedded/Yocto Project extensively uses the --sysroot support within=
 gcc.
> +We discovered that when compiling preprocessed source (.i or .ii files),=
 the
> +compiler will try and access the builtin sysroot location rather than th=
e
> +--sysroot option specified on the commandline. If access to that directo=
ry is
> +permission denied (unreadable), gcc will error. This is particularly pro=
blematic
> +when ccache is involved.
> +
> +This patch adds %I to the cpp-output spec macro so the default substitut=
ions for
> +-iprefix, -isystem, -isysroot happen and the correct sysroot is used.
> +
> +2021-10-27 Richard Purdie <richard.purdie@linuxfoundation.org>
> +
> +gcc/cp/ChangeLog:
> +
> +    * lang-specs.h: Pass sysroot options to cpp for preprocessed source
> +
> +gcc/ChangeLog:
> +
> +    * gcc.c: Pass sysroot options to cpp for preprocessed source
> +
> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> +
> +[YOCTO #2074]
> +
> +Upstream-Status: Submitted [https://gcc.gnu.org/pipermail/gcc-patches/20=
21-October/582725.html]
> +---
> + gcc/cp/lang-specs.h | 2 +-
> + gcc/gcc.c           | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +Index: gcc-11.2.0/gcc/cp/lang-specs.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-11.2.0.orig/gcc/cp/lang-specs.h
> ++++ gcc-11.2.0/gcc/cp/lang-specs.h
> +@@ -116,7 +116,7 @@ along with GCC; see the file COPYING3.
> +   {".ii", "@c++-cpp-output", 0, 0, 0},
> +   {"@c++-cpp-output",
> +       "%{!E:%{!M:%{!MM:"
> +-      "  cc1plus -fpreprocessed %i %(cc1_options) %2"
> ++      "  cc1plus -fpreprocessed %i %I %(cc1_options) %2"
> +       "  %{!fsyntax-only:"
> +       "    %{fmodule-only:%{!S:-o %g.s%V}}"
> +       "    %{!fmodule-only:%{!fmodule-header*:%(invoke_as)}}}"
> +Index: gcc-11.2.0/gcc/gcc.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-11.2.0.orig/gcc/gcc.c
> ++++ gcc-11.2.0/gcc/gcc.c
> +@@ -1470,7 +1470,7 @@ static const struct compiler default_com
> +                                          %W{o*:--output-pch=3D%*}}%V}}}=
}}}}", 0, 0, 0},
> +   {".i", "@cpp-output", 0, 0, 0},
> +   {"@cpp-output",
> +-   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %(cc1_options) %{!fsyntax-onl=
y:%(invoke_as)}}}}", 0, 0, 0},
> ++   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %I %(cc1_options) %{!fsyntax-=
only:%(invoke_as)}}}}", 0, 0, 0},
> +   {".s", "@assembler", 0, 0, 0},
> +   {"@assembler",
> +    "%{!M:%{!MM:%{!E:%{!S:as %(asm_debug) %(asm_options) %i %A }}}}", 0,=
 0, 0},
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0011-De=
fine-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta-arm-toolcha=
in/recipes-devtools/gcc/gcc-arm-11.2/0011-Define-GLIBC_DYNAMIC_LINKER-and-U=
CLIBC_DYNAMIC_LINKE.patch
> similarity index 87%
> rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0011-Def=
ine-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0011-Defin=
e-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> index ee34836ea070..0884730786cd 100644
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0011-Define-GL=
IBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0011-Define-GL=
IBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> @@ -1,4 +1,4 @@
> -From 438b8d40f6060c0d62b474b2ae970241f9635f6b Mon Sep 17 00:00:00 2001
> +From 8e9d6efecdc8c42f47e3a012dee764b13c3dad59 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 29 Mar 2013 09:24:50 +0400
>  Subject: [PATCH] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
> @@ -30,8 +30,7 @@ Upstream-Status: Inappropriate [OE configuration]
>   gcc/config/sparc/linux64.h   |  4 ++--
>   12 files changed, 29 insertions(+), 34 deletions(-)
>
> -diff --git a/gcc/config/alpha/linux-elf.h b/gcc/config/alpha/linux-elf.h
> -index e25fcac3c59..01aca0c6542 100644
> +unchanged:
>  --- a/gcc/config/alpha/linux-elf.h
>  +++ b/gcc/config/alpha/linux-elf.h
>  @@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.  If not see
> @@ -45,8 +44,7 @@ index e25fcac3c59..01aca0c6542 100644
>   #if DEFAULT_LIBC =3D=3D LIBC_UCLIBC
>   #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
>   #elif DEFAULT_LIBC =3D=3D LIBC_GLIBC
> -diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h
> -index 5bdcfa0c5d3..0c0332f317f 100644
> +unchanged:
>  --- a/gcc/config/arm/linux-eabi.h
>  +++ b/gcc/config/arm/linux-eabi.h
>  @@ -65,8 +65,8 @@
> @@ -60,8 +58,7 @@ index 5bdcfa0c5d3..0c0332f317f 100644
>   #define GLIBC_DYNAMIC_LINKER_DEFAULT GLIBC_DYNAMIC_LINKER_SOFT_FLOAT
>
>   #define GLIBC_DYNAMIC_LINKER \
> -diff --git a/gcc/config/arm/linux-elf.h b/gcc/config/arm/linux-elf.h
> -index 0ec3aa53189..abfa9566d74 100644
> +unchanged:
>  --- a/gcc/config/arm/linux-elf.h
>  +++ b/gcc/config/arm/linux-elf.h
>  @@ -60,7 +60,7 @@
> @@ -73,8 +70,7 @@ index 0ec3aa53189..abfa9566d74 100644
>
>   #define LINUX_TARGET_LINK_SPEC  "%{h*} \
>      %{static:-Bstatic} \
> -diff --git a/gcc/config/i386/linux.h b/gcc/config/i386/linux.h
> -index 9f823f125ed..e0390b7d5e3 100644
> +unchanged:
>  --- a/gcc/config/i386/linux.h
>  +++ b/gcc/config/i386/linux.h
>  @@ -20,7 +20,7 @@ along with GCC; see the file COPYING3.  If not see
> @@ -86,8 +82,7 @@ index 9f823f125ed..e0390b7d5e3 100644
>
>   #undef MUSL_DYNAMIC_LINKER
>   #define MUSL_DYNAMIC_LINKER "/lib/ld-musl-i386.so.1"
> -diff --git a/gcc/config/i386/linux64.h b/gcc/config/i386/linux64.h
> -index 6cb68d1ccfa..7de09ec857c 100644
> +unchanged:
>  --- a/gcc/config/i386/linux64.h
>  +++ b/gcc/config/i386/linux64.h
>  @@ -27,9 +27,9 @@ see the files COPYING3 and COPYING.RUNTIME respectivel=
y.  If not, see
> @@ -103,8 +98,7 @@ index 6cb68d1ccfa..7de09ec857c 100644
>
>   #undef MUSL_DYNAMIC_LINKER32
>   #define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-i386.so.1"
> -diff --git a/gcc/config/linux.h b/gcc/config/linux.h
> -index 95654bcdb5a..0c1a8118a26 100644
> +unchanged:
>  --- a/gcc/config/linux.h
>  +++ b/gcc/config/linux.h
>  @@ -94,10 +94,10 @@ see the files COPYING3 and COPYING.RUNTIME respectiv=
ely.  If not, see
> @@ -122,8 +116,7 @@ index 95654bcdb5a..0c1a8118a26 100644
>   #define BIONIC_DYNAMIC_LINKER "/system/bin/linker"
>   #define BIONIC_DYNAMIC_LINKER32 "/system/bin/linker"
>   #define BIONIC_DYNAMIC_LINKER64 "/system/bin/linker64"
> -diff --git a/gcc/config/mips/linux.h b/gcc/config/mips/linux.h
> -index 54446e58e5f..4786ee304c1 100644
> +unchanged:
>  --- a/gcc/config/mips/linux.h
>  +++ b/gcc/config/mips/linux.h
>  @@ -22,20 +22,20 @@ along with GCC; see the file COPYING3.  If not see
> @@ -153,8 +146,7 @@ index 54446e58e5f..4786ee304c1 100644
>
>   #undef MUSL_DYNAMIC_LINKER32
>   #define MUSL_DYNAMIC_LINKER32 \
> -diff --git a/gcc/config/riscv/linux.h b/gcc/config/riscv/linux.h
> -index 4afef7c228c..01997330741 100644
> +unchanged:
>  --- a/gcc/config/riscv/linux.h
>  +++ b/gcc/config/riscv/linux.h
>  @@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.  If not see
> @@ -166,11 +158,10 @@ index 4afef7c228c..01997330741 100644
>
>   #define MUSL_ABI_SUFFIX \
>     "%{mabi=3Dilp32:-sf}" \
> -diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
> -index 2ded3301282..80969a8fd89 100644
> +unchanged:
>  --- a/gcc/config/rs6000/linux64.h
>  +++ b/gcc/config/rs6000/linux64.h
> -@@ -419,24 +419,19 @@ extern int dot_symbols;
> +@@ -336,24 +336,19 @@ extern int dot_symbols;
>   #undef        LINK_OS_DEFAULT_SPEC
>   #define LINK_OS_DEFAULT_SPEC "%(link_os_linux)"
>
> @@ -200,8 +191,7 @@ index 2ded3301282..80969a8fd89 100644
>
>   #undef  DEFAULT_ASM_ENDIAN
>   #if (TARGET_DEFAULT & MASK_LITTLE_ENDIAN)
> -diff --git a/gcc/config/sh/linux.h b/gcc/config/sh/linux.h
> -index c1d0441d488..81373eb8336 100644
> +unchanged:
>  --- a/gcc/config/sh/linux.h
>  +++ b/gcc/config/sh/linux.h
>  @@ -64,7 +64,7 @@ along with GCC; see the file COPYING3.  If not see
> @@ -213,8 +203,7 @@ index c1d0441d488..81373eb8336 100644
>
>   #undef SUBTARGET_LINK_EMUL_SUFFIX
>   #define SUBTARGET_LINK_EMUL_SUFFIX "%{mfdpic:_fd;:_linux}"
> -diff --git a/gcc/config/sparc/linux.h b/gcc/config/sparc/linux.h
> -index 63853e60c03..31219e9892c 100644
> +unchanged:
>  --- a/gcc/config/sparc/linux.h
>  +++ b/gcc/config/sparc/linux.h
>  @@ -78,7 +78,7 @@ extern const char *host_detect_local_cpu (int argc, co=
nst char **argv);
> @@ -226,8 +215,7 @@ index 63853e60c03..31219e9892c 100644
>
>   #undef  LINK_SPEC
>   #define LINK_SPEC "-m elf32_sparc %{shared:-shared} \
> -diff --git a/gcc/config/sparc/linux64.h b/gcc/config/sparc/linux64.h
> -index 19ce84d7adb..0d9cc752931 100644
> +unchanged:
>  --- a/gcc/config/sparc/linux64.h
>  +++ b/gcc/config/sparc/linux64.h
>  @@ -78,8 +78,8 @@ along with GCC; see the file COPYING3.  If not see
> @@ -241,3 +229,19 @@ index 19ce84d7adb..0d9cc752931 100644
>
>   #ifdef SPARC_BI_ARCH
>
> +diff -u b/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aarch6=
4-linux.h
> +--- b/gcc/config/aarch64/aarch64-linux.h
> ++++ b/gcc/config/aarch64/aarch64-linux.h
> +@@ -21,10 +21,10 @@
> + #ifndef GCC_AARCH64_LINUX_H
> + #define GCC_AARCH64_LINUX_H
> +
> +-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-aarch64%{mbig-endian:_be}%{=
mabi=3Dilp32:_ilp32}.so.1"
> ++#define GLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-linux-aarch64%{mbig-en=
dian:_be}%{mabi=3Dilp32:_ilp32}.so.1"
> +
> + #undef MUSL_DYNAMIC_LINKER
> +-#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-aarch64%{mbig-endian:_be}%{ma=
bi=3Dilp32:_ilp32}.so.1"
> ++#define MUSL_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-musl-aarch64%{mbig-endi=
an:_be}%{mabi=3Dilp32:_ilp32}.so.1"
> +
> + #undef  ASAN_CC1_SPEC
> + #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0012-gc=
c-Fix-argument-list-too-long-error.patch b/meta-arm-toolchain/recipes-devto=
ols/gcc/gcc-arm-11.2/0012-gcc-Fix-argument-list-too-long-error.patch
> new file mode 100644
> index 000000000000..ebee30bbd628
> --- /dev/null
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0012-gcc-Fix-a=
rgument-list-too-long-error.patch
> @@ -0,0 +1,38 @@
> +From: Richard Purdie <richard.purdie@linuxfoundation.org>
> +Subject: [PATCH 2/5] gcc: Fix "argument list too long" from install-plug=
ins
> +
> +When building in longer build paths (200+ characters), the
> +"echo $(PLUGIN_HEADERS)" from the install-plugins target would cause an
> +"argument list too long error" on some systems.
> +
> +Avoid this by calling make's sort function on the list which removes
> +duplicates and stops the overflow from reaching the echo command.
> +The original sort is left to handle the the .h and .def files.
> +
> +2021-10-26 Richard Purdie <richard.purdie@linuxfoundation.org>
> +
> +gcc/ChangeLog:
> +
> +    * Makefile.in: Fix "argument list too long" from install-plugins
> +
> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> +
> +Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2021-October/582722=
.html]
> +Upstream-Status: Backport [https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcomm=
it;h=3D66e157188bd2f789809e17e85f917534c9381599]
> +---
> + gcc/Makefile.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +Index: gcc-11.2.0/gcc/Makefile.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-11.2.0.orig/gcc/Makefile.in
> ++++ gcc-11.2.0/gcc/Makefile.in
> +@@ -3678,7 +3678,7 @@ install-plugin: installdirs lang.install
> + # We keep the directory structure for files in config, common/config or
> + # c-family and .def files. All other files are flattened to a single di=
rectory.
> +       $(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
> +-      headers=3D`echo $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def=
) | tr ' ' '\012' | sort -u`; \
> ++      headers=3D`echo $(sort $(PLUGIN_HEADERS)) $$(cd $(srcdir); echo *=
.h *.def) | tr ' ' '\012' | sort -u`; \
> +       srcdirstrip=3D`echo "$(srcdir)" | sed 's/[].[^$$\\*|]/\\\\&/g'`; =
\
> +       for file in $$headers; do \
> +         if [ -f $$file ] ; then \
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0014-li=
btool.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0014-lib=
tool.patch
> similarity index 94%
> rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0014-lib=
tool.patch
> rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0014-libto=
ol.patch
> index 3da3261bfe34..f2b8924ebf44 100644
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0014-libtool.p=
atch
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0014-libtool.p=
atch
> @@ -1,4 +1,4 @@
> -From d1584292b3a199dc6318f7508fd0c74ec4169a21 Mon Sep 17 00:00:00 2001
> +From a5b984db9669cf38a7bd76c3fcdb41c086f740db Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 29 Mar 2013 09:29:11 +0400
>  Subject: [PATCH] libtool
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0015-gc=
c-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch b/meta-arm-toolchain/=
recipes-devtools/gcc/gcc-arm-11.2/0015-gcc-armv4-pass-fix-v4bx-to-linker-to=
-support-EABI.patch
> similarity index 93%
> rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0015-gcc=
-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
> rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0015-gcc-a=
rmv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
> index e08e44cc0428..1ccf39ceba77 100644
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0015-gcc-armv4=
-pass-fix-v4bx-to-linker-to-support-EABI.patch
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0015-gcc-armv4=
-pass-fix-v4bx-to-linker-to-support-EABI.patch
> @@ -1,4 +1,4 @@
> -From b7a96ff62cc0daa3a789c720d30e2edaabbafe5d Mon Sep 17 00:00:00 2001
> +From 0ae7090dec149cb2ff0c87eef87c043d4000ece1 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 29 Mar 2013 09:30:32 +0400
>  Subject: [PATCH] gcc: armv4: pass fix-v4bx to linker to support EABI.
> @@ -19,7 +19,7 @@ Upstream-Status: Pending
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
>  diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h
> -index 0c0332f317f..7b3769e8459 100644
> +index 6bd95855827..77befab5da8 100644
>  --- a/gcc/config/arm/linux-eabi.h
>  +++ b/gcc/config/arm/linux-eabi.h
>  @@ -91,10 +91,14 @@
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0016-Us=
e-the-multilib-config-files-from-B-instead-of-usin.patch b/meta-arm-toolcha=
in/recipes-devtools/gcc/gcc-arm-11.2/0016-Use-the-multilib-config-files-fro=
m-B-instead-of-usin.patch
> similarity index 89%
> rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0016-Use=
-the-multilib-config-files-from-B-instead-of-usin.patch
> rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0016-Use-t=
he-multilib-config-files-from-B-instead-of-usin.patch
> index d86da6517f00..bde7ec660973 100644
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0016-Use-the-m=
ultilib-config-files-from-B-instead-of-usin.patch
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0016-Use-the-m=
ultilib-config-files-from-B-instead-of-usin.patch
> @@ -1,4 +1,4 @@
> -From 187e962aed3b3f39a96eb4419a7fa23e88634efb Mon Sep 17 00:00:00 2001
> +From 5ce8aa4615a3816d12c43752323154744517ae9f Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 29 Mar 2013 09:33:04 +0400
>  Subject: [PATCH] Use the multilib config files from ${B} instead of usin=
g the
> @@ -18,10 +18,10 @@ Upstream-Status: Inappropriate [configuration]
>   2 files changed, 36 insertions(+), 8 deletions(-)
>
>  diff --git a/gcc/configure b/gcc/configure
> -index 156090550c2..fde89ad8e89 100755
> +index 5160917d73e..e663052cad2 100755
>  --- a/gcc/configure
>  +++ b/gcc/configure
> -@@ -12690,10 +12690,20 @@ done
> +@@ -13070,10 +13070,20 @@ done
>   tmake_file_=3D
>   for f in ${tmake_file}
>   do
> @@ -46,7 +46,7 @@ index 156090550c2..fde89ad8e89 100755
>   done
>   tmake_file=3D"${tmake_file_}${omp_device_property_tmake_file}"
>
> -@@ -12704,6 +12714,10 @@ tm_file_list=3D"options.h"
> +@@ -13084,6 +13094,10 @@ tm_file_list=3D"options.h"
>   tm_include_list=3D"options.h insn-constants.h"
>   for f in $tm_file; do
>     case $f in
> @@ -58,10 +58,10 @@ index 156090550c2..fde89ad8e89 100755
>          f=3D`echo $f | sed 's/^..//'`
>          tm_file_list=3D"${tm_file_list} $f"
>  diff --git a/gcc/configure.ac b/gcc/configure.ac
> -index f31a43e7dd3..cad69549a01 100644
> +index 50f78308e8a..2b84875b028 100644
>  --- a/gcc/configure.ac
>  +++ b/gcc/configure.ac
> -@@ -2123,10 +2123,20 @@ done
> +@@ -2243,10 +2243,20 @@ done
>   tmake_file_=3D
>   for f in ${tmake_file}
>   do
> @@ -86,7 +86,7 @@ index f31a43e7dd3..cad69549a01 100644
>   done
>   tmake_file=3D"${tmake_file_}${omp_device_property_tmake_file}"
>
> -@@ -2137,6 +2147,10 @@ tm_file_list=3D"options.h"
> +@@ -2257,6 +2267,10 @@ tm_file_list=3D"options.h"
>   tm_include_list=3D"options.h insn-constants.h"
>   for f in $tm_file; do
>     case $f in
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0017-Av=
oid-using-libdir-from-.la-which-usually-points-to-.patch b/meta-arm-toolcha=
in/recipes-devtools/gcc/gcc-arm-11.2/0017-Avoid-using-libdir-from-.la-which=
-usually-points-to-.patch
> similarity index 92%
> rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0017-Avo=
id-using-libdir-from-.la-which-usually-points-to-.patch
> rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0017-Avoid=
-using-libdir-from-.la-which-usually-points-to-.patch
> index 55eb44e3268e..3e0a1b413618 100644
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0017-Avoid-usi=
ng-libdir-from-.la-which-usually-points-to-.patch
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0017-Avoid-usi=
ng-libdir-from-.la-which-usually-points-to-.patch
> @@ -1,4 +1,4 @@
> -From 6211545ca5aa4a5bfb7c4dfcfdb9db7e5511b40e Mon Sep 17 00:00:00 2001
> +From 75a1ce0265ca123f74f17a40ad8bd8f26d9c2ab3 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 20 Feb 2015 09:39:38 +0000
>  Subject: [PATCH] Avoid using libdir from .la which usually points to a h=
ost
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0018-ex=
port-CPP.patch b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0018-=
export-CPP.patch
> new file mode 100644
> index 000000000000..86ab6574c7b8
> --- /dev/null
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0018-export-CP=
P.patch
> @@ -0,0 +1,199 @@
> +From: Richard Purdie <richard.purdie@linuxfoundation.org>
> +Subject: [PATCH 1/5] Makefile.in: Ensure build CPP/CPPFLAGS is used for =
build targets
> +
> +During cross compiling, CPP is being set to the target compiler even for
> +build targets. As an example, when building a cross compiler targetting
> +mingw, the config.log for libiberty in
> +build.x86_64-pokysdk-mingw32.i586-poky-linux/build-x86_64-linux/libibert=
y/config.log
> +shows:
> +
> +configure:3786: checking how to run the C preprocessor
> +configure:3856: result: x86_64-pokysdk-mingw32-gcc -E --sysroot=3D[sysro=
ot]/x86_64-nativesdk-mingw32-pokysdk-mingw32
> +configure:3876: x86_64-pokysdk-mingw32-gcc -E --sysroot=3D[sysroot]/x86_=
64-nativesdk-mingw32-pokysdk-mingw32 conftest.c
> +configure:3876: $? =3D 0
> +
> +This is libiberty being built for the build environment, not the target =
one
> +(i.e. in build-x86_64-linux). As such it should be using the build envir=
onment's
> +gcc and not the target one. In the mingw case the system headers are qui=
te
> +different leading to build failures related to not being able to include=
 a
> +process.h file for pem-unix.c.
> +
> +Further analysis shows the same issue occuring for CPPFLAGS too.
> +
> +Fix this by adding support for CPP_FOR_BUILD and CPPFLAGS_FOR_BUILD whic=
h
> +for example, avoids mixing the mingw headers for host binaries on linux
> +systems.
> +
> +2021-10-27 Richard Purdie <richard.purdie@linuxfoundation.org>
> +
> +ChangeLog:
> +
> +    * Makefile.tpl: Add CPP_FOR_BUILD and CPPFLAGS_FOR_BUILD support
> +    * Makefile.in: Regenerate.
> +    * configure: Regenerate.
> +    * configure.ac: Add CPP_FOR_BUILD and CPPFLAGS_FOR_BUILD support
> +
> +gcc/ChangeLog:
> +
> +    * configure: Regenerate.
> +    * configure.ac: Use CPPFLAGS_FOR_BUILD for GMPINC
> +
> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> +
> +Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2021-October/582727=
.html]
> +Upstream-Status: Backport [https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcomm=
itdiff;h=3D84401ce5fb4ecab55decb472b168100e7593e01f]
> +---
> + Makefile.in      | 6 ++++++
> + Makefile.tpl     | 6 ++++++
> + configure        | 4 ++++
> + configure.ac     | 4 ++++
> + gcc/configure    | 2 +-
> + gcc/configure.ac | 2 +-
> + 6 files changed, 22 insertions(+), 2 deletions(-)
> +
> +Index: gcc-11.2.0/Makefile.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-11.2.0.orig/Makefile.in
> ++++ gcc-11.2.0/Makefile.in
> +@@ -151,6 +151,8 @@ BUILD_EXPORTS =3D \
> +       CC=3D"$(CC_FOR_BUILD)"; export CC; \
> +       CFLAGS=3D"$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
> +       CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> ++      CPP=3D"$(CPP_FOR_BUILD)"; export CPP; \
> ++      CPPFLAGS=3D"$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS; \
> +       CXX=3D"$(CXX_FOR_BUILD)"; export CXX; \
> +       CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
> +       GFORTRAN=3D"$(GFORTRAN_FOR_BUILD)"; export GFORTRAN; \
> +@@ -198,6 +200,8 @@ HOST_EXPORTS =3D \
> +       AR=3D"$(AR)"; export AR; \
> +       AS=3D"$(AS)"; export AS; \
> +       CC_FOR_BUILD=3D"$(CC_FOR_BUILD)"; export CC_FOR_BUILD; \
> ++      CPP_FOR_BUILD=3D"$(CPP_FOR_BUILD)"; export CPP_FOR_BUILD; \
> ++      CPPFLAGS_FOR_BUILD=3D"$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS_FOR=
_BUILD; \
> +       CXX_FOR_BUILD=3D"$(CXX_FOR_BUILD)"; export CXX_FOR_BUILD; \
> +       DLLTOOL=3D"$(DLLTOOL)"; export DLLTOOL; \
> +       LD=3D"$(LD)"; export LD; \
> +@@ -353,6 +357,8 @@ AR_FOR_BUILD =3D @AR_FOR_BUILD@
> + AS_FOR_BUILD =3D @AS_FOR_BUILD@
> + CC_FOR_BUILD =3D @CC_FOR_BUILD@
> + CFLAGS_FOR_BUILD =3D @CFLAGS_FOR_BUILD@
> ++CPP_FOR_BUILD =3D @CPP_FOR_BUILD@
> ++CPPFLAGS_FOR_BUILD =3D @CPPFLAGS_FOR_BUILD@
> + CXXFLAGS_FOR_BUILD =3D @CXXFLAGS_FOR_BUILD@
> + CXX_FOR_BUILD =3D @CXX_FOR_BUILD@
> + DLLTOOL_FOR_BUILD =3D @DLLTOOL_FOR_BUILD@
> +Index: gcc-11.2.0/Makefile.tpl
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-11.2.0.orig/Makefile.tpl
> ++++ gcc-11.2.0/Makefile.tpl
> +@@ -154,6 +154,8 @@ BUILD_EXPORTS =3D \
> +       CC=3D"$(CC_FOR_BUILD)"; export CC; \
> +       CFLAGS=3D"$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
> +       CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> ++      CPP=3D"$(CPP_FOR_BUILD)"; export CPP; \
> ++      CPPFLAGS=3D"$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS; \
> +       CXX=3D"$(CXX_FOR_BUILD)"; export CXX; \
> +       CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
> +       GFORTRAN=3D"$(GFORTRAN_FOR_BUILD)"; export GFORTRAN; \
> +@@ -201,6 +203,8 @@ HOST_EXPORTS =3D \
> +       AR=3D"$(AR)"; export AR; \
> +       AS=3D"$(AS)"; export AS; \
> +       CC_FOR_BUILD=3D"$(CC_FOR_BUILD)"; export CC_FOR_BUILD; \
> ++      CPP_FOR_BUILD=3D"$(CPP_FOR_BUILD)"; export CPP_FOR_BUILD; \
> ++      CPPFLAGS_FOR_BUILD=3D"$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS_FOR=
_BUILD; \
> +       CXX_FOR_BUILD=3D"$(CXX_FOR_BUILD)"; export CXX_FOR_BUILD; \
> +       DLLTOOL=3D"$(DLLTOOL)"; export DLLTOOL; \
> +       LD=3D"$(LD)"; export LD; \
> +@@ -356,6 +360,8 @@ AR_FOR_BUILD =3D @AR_FOR_BUILD@
> + AS_FOR_BUILD =3D @AS_FOR_BUILD@
> + CC_FOR_BUILD =3D @CC_FOR_BUILD@
> + CFLAGS_FOR_BUILD =3D @CFLAGS_FOR_BUILD@
> ++CPP_FOR_BUILD =3D @CPP_FOR_BUILD@
> ++CPPFLAGS_FOR_BUILD =3D @CPPFLAGS_FOR_BUILD@
> + CXXFLAGS_FOR_BUILD =3D @CXXFLAGS_FOR_BUILD@
> + CXX_FOR_BUILD =3D @CXX_FOR_BUILD@
> + DLLTOOL_FOR_BUILD =3D @DLLTOOL_FOR_BUILD@
> +Index: gcc-11.2.0/configure
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-11.2.0.orig/configure
> ++++ gcc-11.2.0/configure
> +@@ -652,6 +652,8 @@ GFORTRAN_FOR_BUILD
> + DLLTOOL_FOR_BUILD
> + CXX_FOR_BUILD
> + CXXFLAGS_FOR_BUILD
> ++CPPFLAGS_FOR_BUILD
> ++CPP_FOR_BUILD
> + CFLAGS_FOR_BUILD
> + CC_FOR_BUILD
> + AS_FOR_BUILD
> +@@ -4092,6 +4094,7 @@ if test "${build}" !=3D "${host}" ; then
> +   AR_FOR_BUILD=3D${AR_FOR_BUILD-ar}
> +   AS_FOR_BUILD=3D${AS_FOR_BUILD-as}
> +   CC_FOR_BUILD=3D${CC_FOR_BUILD-gcc}
> ++  CPP_FOR_BUILD=3D"${CPP_FOR_BUILD-\$(CPP)}"
> +   CXX_FOR_BUILD=3D${CXX_FOR_BUILD-g++}
> +   GFORTRAN_FOR_BUILD=3D${GFORTRAN_FOR_BUILD-gfortran}
> +   GOC_FOR_BUILD=3D${GOC_FOR_BUILD-gccgo}
> +@@ -9809,6 +9812,7 @@ esac
> + # our build compiler if desired.
> + if test x"${build}" =3D x"${host}" ; then
> +   CFLAGS_FOR_BUILD=3D${CFLAGS_FOR_BUILD-${CFLAGS}}
> ++  CPPFLAGS_FOR_BUILD=3D${CPPFLAGS_FOR_BUILD-${CPPFLAGS}}
> +   CXXFLAGS_FOR_BUILD=3D${CXXFLAGS_FOR_BUILD-${CXXFLAGS}}
> +   LDFLAGS_FOR_BUILD=3D${LDFLAGS_FOR_BUILD-${LDFLAGS}}
> + fi
> +Index: gcc-11.2.0/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-11.2.0.orig/configure.ac
> ++++ gcc-11.2.0/configure.ac
> +@@ -1347,6 +1347,7 @@ if test "${build}" !=3D "${host}" ; then
> +   AR_FOR_BUILD=3D${AR_FOR_BUILD-ar}
> +   AS_FOR_BUILD=3D${AS_FOR_BUILD-as}
> +   CC_FOR_BUILD=3D${CC_FOR_BUILD-gcc}
> ++  CPP_FOR_BUILD=3D"${CPP_FOR_BUILD-\$(CPP)}"
> +   CXX_FOR_BUILD=3D${CXX_FOR_BUILD-g++}
> +   GFORTRAN_FOR_BUILD=3D${GFORTRAN_FOR_BUILD-gfortran}
> +   GOC_FOR_BUILD=3D${GOC_FOR_BUILD-gccgo}
> +@@ -3321,6 +3322,7 @@ esac
> + # our build compiler if desired.
> + if test x"${build}" =3D x"${host}" ; then
> +   CFLAGS_FOR_BUILD=3D${CFLAGS_FOR_BUILD-${CFLAGS}}
> ++  CPPFLAGS_FOR_BUILD=3D${CPPFLAGS_FOR_BUILD-${CPPFLAGS}}
> +   CXXFLAGS_FOR_BUILD=3D${CXXFLAGS_FOR_BUILD-${CXXFLAGS}}
> +   LDFLAGS_FOR_BUILD=3D${LDFLAGS_FOR_BUILD-${LDFLAGS}}
> + fi
> +@@ -3387,6 +3389,8 @@ AC_SUBST(AR_FOR_BUILD)
> + AC_SUBST(AS_FOR_BUILD)
> + AC_SUBST(CC_FOR_BUILD)
> + AC_SUBST(CFLAGS_FOR_BUILD)
> ++AC_SUBST(CPP_FOR_BUILD)
> ++AC_SUBST(CPPFLAGS_FOR_BUILD)
> + AC_SUBST(CXXFLAGS_FOR_BUILD)
> + AC_SUBST(CXX_FOR_BUILD)
> + AC_SUBST(DLLTOOL_FOR_BUILD)
> +Index: gcc-11.2.0/gcc/configure
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-11.2.0.orig/gcc/configure
> ++++ gcc-11.2.0/gcc/configure
> +@@ -12699,7 +12699,7 @@ else
> +       CC=3D"${CC_FOR_BUILD}" CFLAGS=3D"${CFLAGS_FOR_BUILD}" \
> +       CXX=3D"${CXX_FOR_BUILD}" CXXFLAGS=3D"${CXXFLAGS_FOR_BUILD}" \
> +       LD=3D"${LD_FOR_BUILD}" LDFLAGS=3D"${LDFLAGS_FOR_BUILD}" \
> +-      GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS} -DGENERATOR_FILE" \
> ++      GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS_FOR_BUILD} -DGENERATOR_FILE" \
> +       ${realsrcdir}/configure \
> +               --enable-languages=3D${enable_languages-all} \
> +               ${enable_obsolete+--enable-obsolete=3D"$enable_obsolete"}=
 \
> +Index: gcc-11.2.0/gcc/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-11.2.0.orig/gcc/configure.ac
> ++++ gcc-11.2.0/gcc/configure.ac
> +@@ -2023,7 +2023,7 @@ else
> +       CC=3D"${CC_FOR_BUILD}" CFLAGS=3D"${CFLAGS_FOR_BUILD}" \
> +       CXX=3D"${CXX_FOR_BUILD}" CXXFLAGS=3D"${CXXFLAGS_FOR_BUILD}" \
> +       LD=3D"${LD_FOR_BUILD}" LDFLAGS=3D"${LDFLAGS_FOR_BUILD}" \
> +-      GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS} -DGENERATOR_FILE" \
> ++      GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS_FOR_BUILD} -DGENERATOR_FILE" \
> +       ${realsrcdir}/configure \
> +               --enable-languages=3D${enable_languages-all} \
> +               ${enable_obsolete+--enable-obsolete=3D"$enable_obsolete"}=
 \
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0019-En=
sure-target-gcc-headers-can-be-included.patch b/meta-arm-toolchain/recipes-=
devtools/gcc/gcc-arm-11.2/0019-Ensure-target-gcc-headers-can-be-included.pa=
tch
> new file mode 100644
> index 000000000000..120d5a29b2d1
> --- /dev/null
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0019-Ensure-ta=
rget-gcc-headers-can-be-included.patch
> @@ -0,0 +1,113 @@
> +From 6f410ed8fb7eee11ba7a25634c2257666b98ef52 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Fri, 20 Feb 2015 10:25:11 +0000
> +Subject: [PATCH] Ensure target gcc headers can be included
> +
> +There are a few headers installed as part of the OpenEmbedded
> +gcc-runtime target (omp.h, ssp/*.h). Being installed from a recipe
> +built for the target architecture, these are within the target
> +sysroot and not cross/nativesdk; thus they weren't able to be
> +found by gcc with the existing search paths. Add support for
> +picking up these headers under the sysroot supplied on the gcc
> +command line in order to resolve this.
> +
> +Extend target gcc headers search to musl too
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + gcc/Makefile.in           | 2 ++
> + gcc/config/linux.h        | 8 ++++++++
> + gcc/config/rs6000/sysv4.h | 8 ++++++++
> + gcc/cppdefault.c          | 4 ++++
> + 4 files changed, 22 insertions(+)
> +
> +diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> +index 59c45c81393..9b17d120aa1 100644
> +--- a/gcc/Makefile.in
> ++++ b/gcc/Makefile.in
> +@@ -630,6 +630,7 @@ libexecdir =3D @libexecdir@
> +
> + # Directory in which the compiler finds libraries etc.
> + libsubdir =3D $(libdir)/gcc/$(real_target_noncanonical)/$(version)$(acc=
el_dir_suffix)
> ++libsubdir_target =3D $(target_noncanonical)/$(version)
> + # Directory in which the compiler finds executables
> + libexecsubdir =3D $(libexecdir)/gcc/$(real_target_noncanonical)/$(versi=
on)$(accel_dir_suffix)
> + # Directory in which all plugin resources are installed
> +@@ -3016,6 +3017,7 @@ CFLAGS-intl.o +=3D -DLOCALEDIR=3D\"$(localedir)\"
> +
> + PREPROCESSOR_DEFINES =3D \
> +   -DGCC_INCLUDE_DIR=3D\"$(libsubdir)/include\" \
> ++  -DGCC_INCLUDE_SUBDIR_TARGET=3D\"$(libsubdir_target)/include\" \
> +   -DFIXED_INCLUDE_DIR=3D\"$(libsubdir)/include-fixed\" \
> +   -DGPLUSPLUS_INCLUDE_DIR=3D\"$(gcc_gxx_include_dir)\" \
> +   -DGPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT=3D$(gcc_gxx_include_dir_add_sysro=
ot) \
> +diff --git a/gcc/config/linux.h b/gcc/config/linux.h
> +index 87efc5f69fe..b525bcd56b3 100644
> +--- a/gcc/config/linux.h
> ++++ b/gcc/config/linux.h
> +@@ -165,6 +165,13 @@ see the files COPYING3 and COPYING.RUNTIME respecti=
vely.  If not, see
> + #define INCLUDE_DEFAULTS_MUSL_TOOL
> + #endif
> +
> ++#ifdef GCC_INCLUDE_SUBDIR_TARGET
> ++#define INCLUDE_DEFAULTS_MUSL_SUBDIR_TARGET           \
> ++    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC", 0, =
0, 1, 0},
> ++#else
> ++#define INCLUDE_DEFAULTS_MUSL_SUBDIR_TARGET
> ++#endif
> ++
> + #ifdef NATIVE_SYSTEM_HEADER_DIR
> + #define INCLUDE_DEFAULTS_MUSL_NATIVE                  \
> +     { NATIVE_SYSTEM_HEADER_DIR, 0, 0, 0, 1, 2 },      \
> +@@ -191,6 +198,7 @@ see the files COPYING3 and COPYING.RUNTIME respectiv=
ely.  If not, see
> +     INCLUDE_DEFAULTS_MUSL_PREFIX                      \
> +     INCLUDE_DEFAULTS_MUSL_CROSS                               \
> +     INCLUDE_DEFAULTS_MUSL_TOOL                                \
> ++    INCLUDE_DEFAULTS_MUSL_SUBDIR_TARGET                       \
> +     INCLUDE_DEFAULTS_MUSL_NATIVE                      \
> +     { GCC_INCLUDE_DIR, "GCC", 0, 1, 0, 0 },           \
> +     { 0, 0, 0, 0, 0, 0 }                              \
> +diff --git a/gcc/config/rs6000/sysv4.h b/gcc/config/rs6000/sysv4.h
> +index 510abe169c5..0c2bba5ea32 100644
> +--- a/gcc/config/rs6000/sysv4.h
> ++++ b/gcc/config/rs6000/sysv4.h
> +@@ -995,6 +995,13 @@ ncrtn.o%s"
> + #define INCLUDE_DEFAULTS_MUSL_TOOL
> + #endif
> +
> ++#ifdef GCC_INCLUDE_SUBDIR_TARGET
> ++#define INCLUDE_DEFAULTS_MUSL_SUBDIR_TARGET            \
> ++    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC", 0, =
0, 1, 0},
> ++#else
> ++#define INCLUDE_DEFAULTS_MUSL_SUBDIR_TARGET
> ++#endif
> ++
> + #ifdef NATIVE_SYSTEM_HEADER_DIR
> + #define INCLUDE_DEFAULTS_MUSL_NATIVE                  \
> +     { NATIVE_SYSTEM_HEADER_DIR, 0, 0, 0, 1, 2 },      \
> +@@ -1021,6 +1028,7 @@ ncrtn.o%s"
> +     INCLUDE_DEFAULTS_MUSL_PREFIX                      \
> +     INCLUDE_DEFAULTS_MUSL_CROSS                               \
> +     INCLUDE_DEFAULTS_MUSL_TOOL                                \
> ++    INCLUDE_DEFAULTS_MUSL_SUBDIR_TARGET                       \
> +     INCLUDE_DEFAULTS_MUSL_NATIVE                      \
> +     { GCC_INCLUDE_DIR, "GCC", 0, 1, 0, 0 },           \
> +     { 0, 0, 0, 0, 0, 0 }                              \
> +diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
> +index c503d14fc3f..d54d6ce0076 100644
> +--- a/gcc/cppdefault.c
> ++++ b/gcc/cppdefault.c
> +@@ -64,6 +64,10 @@ const struct default_include cpp_include_defaults[]
> +     /* This is the dir for gcc's private headers.  */
> +     { GCC_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
> + #endif
> ++#ifdef GCC_INCLUDE_SUBDIR_TARGET
> ++    /* This is the dir for gcc's private headers under the specified sy=
sroot.  */
> ++    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC", 0, =
0, 1, 0 },
> ++#endif
> + #ifdef LOCAL_INCLUDE_DIR
> +     /* /usr/local/include comes before the fixincluded header files.  *=
/
> +     { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0020-Do=
n-t-search-host-directory-during-relink-if-inst_pr.patch b/meta-arm-toolcha=
in/recipes-devtools/gcc/gcc-arm-11.2/0020-Don-t-search-host-directory-durin=
g-relink-if-inst_pr.patch
> similarity index 93%
> rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0020-Don=
-t-search-host-directory-during-relink-if-inst_pr.patch
> rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0020-Don-t=
-search-host-directory-during-relink-if-inst_pr.patch
> index ce838ebcdb56..bb2a3671f0bf 100644
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0020-Don-t-sea=
rch-host-directory-during-relink-if-inst_pr.patch
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0020-Don-t-sea=
rch-host-directory-during-relink-if-inst_pr.patch
> @@ -1,4 +1,4 @@
> -From dbdf19800e24571603b0baee1734a58ff2cf2974 Mon Sep 17 00:00:00 2001
> +From cd09adb1e7f2a7e81a9f595a17c36f24911b90ac Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Tue, 3 Mar 2015 08:21:19 +0000
>  Subject: [PATCH] Don't search host directory during "relink" if $inst_pr=
efix
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0023-li=
bcc1-fix-libcc1-s-install-path-and-rpath.patch b/meta-arm-toolchain/recipes=
-devtools/gcc/gcc-arm-11.2/0023-libcc1-fix-libcc1-s-install-path-and-rpath.=
patch
> similarity index 90%
> rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0023-lib=
cc1-fix-libcc1-s-install-path-and-rpath.patch
> rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0023-libcc=
1-fix-libcc1-s-install-path-and-rpath.patch
> index d981b3765861..fb4511cc1ac6 100644
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0023-libcc1-fi=
x-libcc1-s-install-path-and-rpath.patch
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0023-libcc1-fi=
x-libcc1-s-install-path-and-rpath.patch
> @@ -1,4 +1,4 @@
> -From cc298bd514d32cea58bfbdbda503d710355e97b4 Mon Sep 17 00:00:00 2001
> +From 2cfc5ee38b3f5ec1d7965aae0991bcd48b5dc2e6 Mon Sep 17 00:00:00 2001
>  From: Robert Yang <liezhi.yang@windriver.com>
>  Date: Sun, 5 Jul 2015 20:25:18 -0700
>  Subject: [PATCH] libcc1: fix libcc1's install path and rpath
> @@ -20,7 +20,7 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
>  diff --git a/libcc1/Makefile.am b/libcc1/Makefile.am
> -index fe7b64cbc6f..bdd0617049b 100644
> +index f148fdd7aa2..0b6eb8f2855 100644
>  --- a/libcc1/Makefile.am
>  +++ b/libcc1/Makefile.am
>  @@ -40,8 +40,8 @@ libiberty =3D $(if $(wildcard $(libiberty_noasan)),$(W=
c)$(libiberty_noasan), \
> @@ -35,10 +35,10 @@ index fe7b64cbc6f..bdd0617049b 100644
>   if ENABLE_PLUGIN
>   plugin_LTLIBRARIES =3D libcc1plugin.la libcp1plugin.la
>  diff --git a/libcc1/Makefile.in b/libcc1/Makefile.in
> -index 2def836cb06..98e12a9d369 100644
> +index 753d435c9cb..455627b0a3b 100644
>  --- a/libcc1/Makefile.in
>  +++ b/libcc1/Makefile.in
> -@@ -394,8 +394,8 @@ libiberty =3D $(if $(wildcard $(libiberty_noasan)),$=
(Wc)$(libiberty_noasan), \
> +@@ -398,8 +398,8 @@ libiberty =3D $(if $(wildcard $(libiberty_noasan)),$=
(Wc)$(libiberty_noasan), \
>             $(Wc)$(libiberty_normal)))
>
>   libiberty_dep =3D $(patsubst $(Wc)%,%,$(libiberty))
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0024-ha=
ndle-sysroot-support-for-nativesdk-gcc.patch b/meta-arm-toolchain/recipes-d=
evtools/gcc/gcc-arm-11.2/0024-handle-sysroot-support-for-nativesdk-gcc.patc=
h
> similarity index 65%
> rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0024-han=
dle-sysroot-support-for-nativesdk-gcc.patch
> rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0024-handl=
e-sysroot-support-for-nativesdk-gcc.patch
> index 6c75c0f2bf9e..b1054fa749e5 100644
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0024-handle-sy=
sroot-support-for-nativesdk-gcc.patch
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0024-handle-sy=
sroot-support-for-nativesdk-gcc.patch
> @@ -1,4 +1,4 @@
> -From 2966f3c43382fa4f79cbac761232dae2e92e7012 Mon Sep 17 00:00:00 2001
> +From 354682ad8f71f62643dcd83f64b51b5979615a0c Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 7 Dec 2015 23:39:54 +0000
>  Subject: [PATCH] handle sysroot support for nativesdk-gcc
> @@ -23,6 +23,9 @@ b) Add other paths which need relocation into a .gccrel=
ocprefix section
>  Upstream-Status: Inappropriate
>  RP 2015/7/28
>
> +Extend the gccrelocprefix support to musl config too, this ensures
> +that gcc will get right bits in SDK installations
> +
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
>  Added PREFIXVAR and EXEC_PREFIXVAR to support runtime relocation.  Witho=
ut
> @@ -32,19 +35,21 @@ implementation.)
>
>  Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
>  ---
> - gcc/c-family/c-opts.c |  4 +--
> - gcc/cppdefault.c      | 63 ++++++++++++++++++++++++++-----------------
> - gcc/cppdefault.h      | 13 ++++-----
> - gcc/gcc.c             | 20 +++++++++-----
> - gcc/incpath.c         | 12 ++++-----
> - gcc/prefix.c          |  6 +++--
> - 6 files changed, 70 insertions(+), 48 deletions(-)
> + gcc/c-family/c-opts.c     |  4 +--
> + gcc/config/linux.h        | 24 +++++++--------
> + gcc/config/rs6000/sysv4.h | 24 +++++++--------
> + gcc/cppdefault.c          | 63 ++++++++++++++++++++++++---------------
> + gcc/cppdefault.h          | 13 ++++----
> + gcc/gcc.c                 | 20 +++++++++----
> + gcc/incpath.c             | 12 ++++----
> + gcc/prefix.c              |  6 ++--
> + 8 files changed, 94 insertions(+), 72 deletions(-)
>
>  diff --git a/gcc/c-family/c-opts.c b/gcc/c-family/c-opts.c
> -index c51d6d34726..aa7507df2cf 100644
> +index 89e05a4c551..5577383665d 100644
>  --- a/gcc/c-family/c-opts.c
>  +++ b/gcc/c-family/c-opts.c
> -@@ -1409,8 +1409,8 @@ add_prefixed_path (const char *suffix, incpath_kin=
d chain)
> +@@ -1436,8 +1436,8 @@ add_prefixed_path (const char *suffix, incpath_kin=
d chain)
>     size_t prefix_len, suffix_len;
>
>     suffix_len =3D strlen (suffix);
> @@ -55,8 +60,164 @@ index c51d6d34726..aa7507df2cf 100644
>
>     path =3D (char *) xmalloc (prefix_len + suffix_len + 1);
>     memcpy (path, prefix, prefix_len);
> +diff --git a/gcc/config/linux.h b/gcc/config/linux.h
> +index b525bcd56b3..ba02c013e30 100644
> +--- a/gcc/config/linux.h
> ++++ b/gcc/config/linux.h
> +@@ -129,53 +129,53 @@ see the files COPYING3 and COPYING.RUNTIME respect=
ively.  If not, see
> +  * Unfortunately, this is mostly duplicated from cppdefault.c */
> + #if DEFAULT_LIBC =3D=3D LIBC_MUSL
> + #define INCLUDE_DEFAULTS_MUSL_GPP                     \
> +-    { GPLUSPLUS_INCLUDE_DIR, "G++", 1, 1,             \
> ++    { GPLUSPLUS_INCLUDE_DIRVAR, "G++", 1, 1,          \
> +       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },         \
> +-    { GPLUSPLUS_TOOL_INCLUDE_DIR, "G++", 1, 1,                \
> ++    { GPLUSPLUS_TOOL_INCLUDE_DIRVAR, "G++", 1, 1,     \
> +       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 1 },         \
> +-    { GPLUSPLUS_BACKWARD_INCLUDE_DIR, "G++", 1, 1,    \
> ++    { GPLUSPLUS_BACKWARD_INCLUDE_DIRVAR, "G++", 1, 1, \
> +       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
> +
> + #ifdef LOCAL_INCLUDE_DIR
> + #define INCLUDE_DEFAULTS_MUSL_LOCAL                   \
> +-    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },             \
> +-    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 0 },
> ++    { LOCAL_INCLUDE_DIRVAR, 0, 0, 1, 1, 2 },          \
> ++    { LOCAL_INCLUDE_DIRVAR, 0, 0, 1, 1, 0 },
> + #else
> + #define INCLUDE_DEFAULTS_MUSL_LOCAL
> + #endif
> +
> + #ifdef PREFIX_INCLUDE_DIR
> + #define INCLUDE_DEFAULTS_MUSL_PREFIX                  \
> +-    { PREFIX_INCLUDE_DIR, 0, 0, 1, 0, 0},
> ++    { PREFIX_INCLUDE_DIRVAR, 0, 0, 1, 0, 0},
> + #else
> + #define INCLUDE_DEFAULTS_MUSL_PREFIX
> + #endif
> +
> + #ifdef CROSS_INCLUDE_DIR
> + #define INCLUDE_DEFAULTS_MUSL_CROSS                   \
> +-    { CROSS_INCLUDE_DIR, "GCC", 0, 0, 0, 0},
> ++    { CROSS_INCLUDE_DIRVAR, "GCC", 0, 0, 0, 0},
> + #else
> + #define INCLUDE_DEFAULTS_MUSL_CROSS
> + #endif
> +
> + #ifdef TOOL_INCLUDE_DIR
> + #define INCLUDE_DEFAULTS_MUSL_TOOL                    \
> +-    { TOOL_INCLUDE_DIR, "BINUTILS", 0, 1, 0, 0},
> ++    { TOOL_INCLUDE_DIRVAR, "BINUTILS", 0, 1, 0, 0},
> + #else
> + #define INCLUDE_DEFAULTS_MUSL_TOOL
> + #endif
> +
> + #ifdef GCC_INCLUDE_SUBDIR_TARGET
> + #define INCLUDE_DEFAULTS_MUSL_SUBDIR_TARGET           \
> +-    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC", 0, =
0, 1, 0},
> ++    { STANDARD_STARTFILE_PREFIX_2VAR, "GCC", 0, 0, 1, 0},
> + #else
> + #define INCLUDE_DEFAULTS_MUSL_SUBDIR_TARGET
> + #endif
> +
> + #ifdef NATIVE_SYSTEM_HEADER_DIR
> + #define INCLUDE_DEFAULTS_MUSL_NATIVE                  \
> +-    { NATIVE_SYSTEM_HEADER_DIR, 0, 0, 0, 1, 2 },      \
> +-    { NATIVE_SYSTEM_HEADER_DIR, 0, 0, 0, 1, 0 },
> ++    { NATIVE_SYSTEM_HEADER_DIRVAR, 0, 0, 0, 1, 2 },   \
> ++    { NATIVE_SYSTEM_HEADER_DIRVAR, 0, 0, 0, 1, 0 },
> + #else
> + #define INCLUDE_DEFAULTS_MUSL_NATIVE
> + #endif
> +@@ -200,7 +200,7 @@ see the files COPYING3 and COPYING.RUNTIME respectiv=
ely.  If not, see
> +     INCLUDE_DEFAULTS_MUSL_TOOL                                \
> +     INCLUDE_DEFAULTS_MUSL_SUBDIR_TARGET                       \
> +     INCLUDE_DEFAULTS_MUSL_NATIVE                      \
> +-    { GCC_INCLUDE_DIR, "GCC", 0, 1, 0, 0 },           \
> ++    { GCC_INCLUDE_DIRVAR, "GCC", 0, 1, 0, 0 },                \
> +     { 0, 0, 0, 0, 0, 0 }                              \
> +   }
> + #endif
> +diff --git a/gcc/config/rs6000/sysv4.h b/gcc/config/rs6000/sysv4.h
> +index 0c2bba5ea32..313a8de4417 100644
> +--- a/gcc/config/rs6000/sysv4.h
> ++++ b/gcc/config/rs6000/sysv4.h
> +@@ -959,53 +959,53 @@ ncrtn.o%s"
> + /* Include order changes for musl, same as in generic linux.h.  */
> + #if DEFAULT_LIBC =3D=3D LIBC_MUSL
> + #define INCLUDE_DEFAULTS_MUSL_GPP                     \
> +-    { GPLUSPLUS_INCLUDE_DIR, "G++", 1, 1,             \
> ++    { GPLUSPLUS_INCLUDE_DIRVAR, "G++", 1, 1,          \
> +       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },         \
> +-    { GPLUSPLUS_TOOL_INCLUDE_DIR, "G++", 1, 1,                \
> ++    { GPLUSPLUS_TOOL_INCLUDE_DIRVAR, "G++", 1, 1,     \
> +       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 1 },         \
> +-    { GPLUSPLUS_BACKWARD_INCLUDE_DIR, "G++", 1, 1,    \
> ++    { GPLUSPLUS_BACKWARD_INCLUDE_DIRVAR, "G++", 1, 1, \
> +       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
> +
> + #ifdef LOCAL_INCLUDE_DIR
> + #define INCLUDE_DEFAULTS_MUSL_LOCAL                   \
> +-    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },             \
> +-    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 0 },
> ++    { LOCAL_INCLUDE_DIRVAR, 0, 0, 1, 1, 2 },          \
> ++    { LOCAL_INCLUDE_DIRVAR, 0, 0, 1, 1, 0 },
> + #else
> + #define INCLUDE_DEFAULTS_MUSL_LOCAL
> + #endif
> +
> + #ifdef PREFIX_INCLUDE_DIR
> + #define INCLUDE_DEFAULTS_MUSL_PREFIX                  \
> +-    { PREFIX_INCLUDE_DIR, 0, 0, 1, 0, 0},
> ++    { PREFIX_INCLUDE_DIRVAR, 0, 0, 1, 0, 0},
> + #else
> + #define INCLUDE_DEFAULTS_MUSL_PREFIX
> + #endif
> +
> + #ifdef CROSS_INCLUDE_DIR
> + #define INCLUDE_DEFAULTS_MUSL_CROSS                   \
> +-    { CROSS_INCLUDE_DIR, "GCC", 0, 0, 0, 0},
> ++    { CROSS_INCLUDE_DIRVAR, "GCC", 0, 0, 0, 0},
> + #else
> + #define INCLUDE_DEFAULTS_MUSL_CROSS
> + #endif
> +
> + #ifdef TOOL_INCLUDE_DIR
> + #define INCLUDE_DEFAULTS_MUSL_TOOL                    \
> +-    { TOOL_INCLUDE_DIR, "BINUTILS", 0, 1, 0, 0},
> ++    { TOOL_INCLUDE_DIRVAR, "BINUTILS", 0, 1, 0, 0},
> + #else
> + #define INCLUDE_DEFAULTS_MUSL_TOOL
> + #endif
> +
> + #ifdef GCC_INCLUDE_SUBDIR_TARGET
> + #define INCLUDE_DEFAULTS_MUSL_SUBDIR_TARGET            \
> +-    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC", 0, =
0, 1, 0},
> ++    { STANDARD_STARTFILE_PREFIX_2VAR, "GCC", 0, 0, 1, 0},
> + #else
> + #define INCLUDE_DEFAULTS_MUSL_SUBDIR_TARGET
> + #endif
> +
> + #ifdef NATIVE_SYSTEM_HEADER_DIR
> + #define INCLUDE_DEFAULTS_MUSL_NATIVE                  \
> +-    { NATIVE_SYSTEM_HEADER_DIR, 0, 0, 0, 1, 2 },      \
> +-    { NATIVE_SYSTEM_HEADER_DIR, 0, 0, 0, 1, 0 },
> ++    { NATIVE_SYSTEM_HEADER_DIRVAR, 0, 0, 0, 1, 2 },   \
> ++    { NATIVE_SYSTEM_HEADER_DIRVAR, 0, 0, 0, 1, 0 },
> + #else
> + #define INCLUDE_DEFAULTS_MUSL_NATIVE
> + #endif
> +@@ -1030,7 +1030,7 @@ ncrtn.o%s"
> +     INCLUDE_DEFAULTS_MUSL_TOOL                                \
> +     INCLUDE_DEFAULTS_MUSL_SUBDIR_TARGET                       \
> +     INCLUDE_DEFAULTS_MUSL_NATIVE                      \
> +-    { GCC_INCLUDE_DIR, "GCC", 0, 1, 0, 0 },           \
> ++    { GCC_INCLUDE_DIRVAR, "GCC", 0, 1, 0, 0 },                \
> +     { 0, 0, 0, 0, 0, 0 }                              \
> +   }
> + #endif
>  diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
> -index 2f43b88a0c3..6b6be04686c 100644
> +index d54d6ce0076..784a92a0c24 100644
>  --- a/gcc/cppdefault.c
>  +++ b/gcc/cppdefault.c
>  @@ -35,6 +35,30 @@
> @@ -90,7 +251,7 @@ index 2f43b88a0c3..6b6be04686c 100644
>   const struct default_include cpp_include_defaults[]
>   #ifdef INCLUDE_DEFAULTS
>   =3D INCLUDE_DEFAULTS;
> -@@ -42,38 +66,38 @@ const struct default_include cpp_include_defaults[]
> +@@ -42,17 +66,17 @@ const struct default_include cpp_include_defaults[]
>   =3D {
>   #ifdef GPLUSPLUS_INCLUDE_DIR
>       /* Pick up GNU C++ generic include files.  */
> @@ -110,6 +271,9 @@ index 2f43b88a0c3..6b6be04686c 100644
>  +    { GPLUSPLUS_BACKWARD_INCLUDE_DIRVAR, "G++", 1, 1,
>         GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
>   #endif
> + #ifdef GPLUSPLUS_LIBCXX_INCLUDE_DIR
> +@@ -62,23 +86,23 @@ const struct default_include cpp_include_defaults[]
> + #endif
>   #ifdef GCC_INCLUDE_DIR
>       /* This is the dir for gcc's private headers.  */
>  -    { GCC_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
> @@ -138,7 +302,7 @@ index 2f43b88a0c3..6b6be04686c 100644
>         /* A multilib suffix needs adding if different multilibs use
>          different headers.  */
>   #ifdef SYSROOT_HEADERS_SUFFIX_SPEC
> -@@ -85,33 +109,24 @@ const struct default_include cpp_include_defaults[]
> +@@ -90,33 +114,24 @@ const struct default_include cpp_include_defaults[]
>   #endif
>   #ifdef CROSS_INCLUDE_DIR
>       /* One place the target system's headers might be.  */
> @@ -179,7 +343,7 @@ index 2f43b88a0c3..6b6be04686c 100644
>   /* This value is set by cpp_relocated at runtime */
>   const char *gcc_exec_prefix;
>  diff --git a/gcc/cppdefault.h b/gcc/cppdefault.h
> -index a681264f75e..5e10a2fa140 100644
> +index fd3c655db1c..20669ac427d 100644
>  --- a/gcc/cppdefault.h
>  +++ b/gcc/cppdefault.h
>  @@ -33,7 +33,8 @@
> @@ -191,8 +355,8 @@ index a681264f75e..5e10a2fa140 100644
>  +
>     const char *const component;        /* The component containing the d=
irectory
>                                    (see update_path in prefix.c) */
> -   const char cplusplus;               /* Only look here if we're compil=
ing C++.  */
> -@@ -50,17 +51,13 @@ struct default_include
> +   const char cplusplus;               /* When this is non-zero, we shou=
ld only
> +@@ -55,17 +56,13 @@ struct default_include
>   };
>
>   extern const struct default_include cpp_include_defaults[];
> @@ -214,7 +378,7 @@ index a681264f75e..5e10a2fa140 100644
>      subdirectory of the actual installation.  */
>   extern const char *gcc_exec_prefix;
>  diff --git a/gcc/gcc.c b/gcc/gcc.c
> -index e2e0bcee9b2..912c2febf94 100644
> +index 8737bae5353..aa6fbe43965 100644
>  --- a/gcc/gcc.c
>  +++ b/gcc/gcc.c
>  @@ -252,6 +252,8 @@ FILE *report_times_to_file =3D NULL;
> @@ -226,7 +390,7 @@ index e2e0bcee9b2..912c2febf94 100644
>   /* Nonzero means pass the updated target_system_root to the compiler.  =
*/
>
>   static int target_system_root_changed;
> -@@ -526,6 +528,7 @@ or with constant text in a single argument.
> +@@ -568,6 +570,7 @@ or with constant text in a single argument.
>    %G     process LIBGCC_SPEC as a spec.
>    %R     Output the concatenation of target_system_root and
>           target_sysroot_suffix.
> @@ -234,7 +398,7 @@ index e2e0bcee9b2..912c2febf94 100644
>    %S     process STARTFILE_SPEC as a spec.  A capital S is actually used=
 here.
>    %E     process ENDFILE_SPEC as a spec.  A capital E is actually used h=
ere.
>    %C     process CPP_SPEC as a spec.
> -@@ -1502,10 +1505,10 @@ static const char *gcc_libexec_prefix;
> +@@ -1621,10 +1624,10 @@ static const char *gcc_libexec_prefix;
>      gcc_exec_prefix is set because, in that case, we know where the
>      compiler has been installed, and use paths relative to that
>      location instead.  */
> @@ -249,7 +413,7 @@ index e2e0bcee9b2..912c2febf94 100644
>
>   /* For native compilers, these are well-known paths containing
>      components that may be provided by the system.  For cross
> -@@ -1513,9 +1516,9 @@ static const char *const standard_startfile_prefix=
 =3D STANDARD_STARTFILE_PREFIX;
> +@@ -1632,9 +1635,9 @@ static const char *const standard_startfile_prefix=
 =3D STANDARD_STARTFILE_PREFIX;
>   static const char *md_exec_prefix =3D MD_EXEC_PREFIX;
>   static const char *md_startfile_prefix =3D MD_STARTFILE_PREFIX;
>   static const char *md_startfile_prefix_1 =3D MD_STARTFILE_PREFIX_1;
> @@ -261,7 +425,7 @@ index e2e0bcee9b2..912c2febf94 100644
>     =3D STANDARD_STARTFILE_PREFIX_2;
>
>   /* A relative path to be used in finding the location of tools
> -@@ -5955,6 +5958,11 @@ do_spec_1 (const char *spec, int inswitch, const =
char *soft_matched_part)
> +@@ -6564,6 +6567,11 @@ do_spec_1 (const char *spec, int inswitch, const =
char *soft_matched_part)
>               }
>             break;
>
> @@ -274,7 +438,7 @@ index e2e0bcee9b2..912c2febf94 100644
>             value =3D do_spec_1 (startfile_spec, 0, NULL);
>             if (value !=3D 0)
>  diff --git a/gcc/incpath.c b/gcc/incpath.c
> -index 9098ab044ab..bfad4ebe382 100644
> +index fbfc0ce03b8..a82e543428b 100644
>  --- a/gcc/incpath.c
>  +++ b/gcc/incpath.c
>  @@ -131,7 +131,7 @@ add_standard_paths (const char *sysroot, const char =
*iprefix,
> @@ -286,7 +450,7 @@ index 9098ab044ab..bfad4ebe382 100644
>       {
>         /* Look for directories that start with the standard prefix.
>          "Translate" them, i.e. replace /usr/local/lib/gcc... with
> -@@ -145,7 +145,7 @@ add_standard_paths (const char *sysroot, const char =
*iprefix,
> +@@ -146,7 +146,7 @@ add_standard_paths (const char *sysroot, const char =
*iprefix,
>                  now.  */
>               if (sysroot && p->add_sysroot)
>                 continue;
> @@ -295,7 +459,7 @@ index 9098ab044ab..bfad4ebe382 100644
>                 {
>                   char *str =3D concat (iprefix, p->fname + len, NULL);
>                   if (p->multilib =3D=3D 1 && imultilib)
> -@@ -185,7 +185,7 @@ add_standard_paths (const char *sysroot, const char =
*iprefix,
> +@@ -187,7 +187,7 @@ add_standard_paths (const char *sysroot, const char =
*iprefix,
>               free (sysroot_no_trailing_dir_separator);
>             }
>           else if (!p->add_sysroot && relocated
> @@ -304,7 +468,7 @@ index 9098ab044ab..bfad4ebe382 100644
>             {
>               static const char *relocated_prefix;
>               char *ostr;
> -@@ -202,12 +202,12 @@ add_standard_paths (const char *sysroot, const cha=
r *iprefix,
> +@@ -204,12 +204,12 @@ add_standard_paths (const char *sysroot, const cha=
r *iprefix,
>                   dummy =3D concat (gcc_exec_prefix, "dummy", NULL);
>                   relocated_prefix
>                     =3D make_relative_prefix (dummy,
> @@ -321,7 +485,7 @@ index 9098ab044ab..bfad4ebe382 100644
>               str =3D update_path (ostr, p->component);
>               free (ostr);
>  diff --git a/gcc/prefix.c b/gcc/prefix.c
> -index 1a403e535bd..c26d07bde12 100644
> +index 747c09de638..f728638dc65 100644
>  --- a/gcc/prefix.c
>  +++ b/gcc/prefix.c
>  @@ -72,7 +72,9 @@ License along with GCC; see the file COPYING3.  If not=
 see
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0025-Se=
arch-target-sysroot-gcc-version-specific-dirs-with.patch b/meta-arm-toolcha=
in/recipes-devtools/gcc/gcc-arm-11.2/0025-Search-target-sysroot-gcc-version=
-specific-dirs-with.patch
> similarity index 92%
> rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0025-Sea=
rch-target-sysroot-gcc-version-specific-dirs-with.patch
> rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0025-Searc=
h-target-sysroot-gcc-version-specific-dirs-with.patch
> index e8b52daf25f9..ff622b105687 100644
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0025-Search-ta=
rget-sysroot-gcc-version-specific-dirs-with.patch
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0025-Search-ta=
rget-sysroot-gcc-version-specific-dirs-with.patch
> @@ -1,4 +1,4 @@
> -From 5fdf6a0e959c26512c795bf904b35348f749406c Mon Sep 17 00:00:00 2001
> +From c55e24459370ad96577496ecd87475e3a9de7dad Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 7 Dec 2015 23:41:45 +0000
>  Subject: [PATCH] Search target sysroot gcc version specific dirs with
> @@ -51,10 +51,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 28 insertions(+), 1 deletion(-)
>
>  diff --git a/gcc/gcc.c b/gcc/gcc.c
> -index 912c2febf94..24a92bf27f9 100644
> +index aa6fbe43965..f8a71a13826 100644
>  --- a/gcc/gcc.c
>  +++ b/gcc/gcc.c
> -@@ -2619,7 +2619,7 @@ for_each_path (const struct path_prefix *paths,
> +@@ -2811,7 +2811,7 @@ for_each_path (const struct path_prefix *paths,
>         if (path =3D=3D NULL)
>         {
>           len =3D paths->max_len + extra_space + 1;
> @@ -63,7 +63,7 @@ index 912c2febf94..24a92bf27f9 100644
>           path =3D XNEWVEC (char, len);
>         }
>
> -@@ -2631,6 +2631,33 @@ for_each_path (const struct path_prefix *paths,
> +@@ -2823,6 +2823,33 @@ for_each_path (const struct path_prefix *paths,
>           /* Look first in MACHINE/VERSION subdirectory.  */
>           if (!skip_multi_dir)
>             {
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0027-ni=
os2-Define-MUSL_DYNAMIC_LINKER.patch b/meta-arm-toolchain/recipes-devtools/=
gcc/gcc-arm-11.2/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch
> new file mode 100644
> index 000000000000..97c271373bdd
> --- /dev/null
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0027-nios2-Def=
ine-MUSL_DYNAMIC_LINKER.patch
> @@ -0,0 +1,31 @@
> +From: Richard Purdie <richard.purdie@linuxfoundation.org>
> +Subject: [PATCH 4/5] gcc/nios2: Define the musl linker
> +
> +Add a definition of the musl linker used on the nios2 platform.
> +
> +2021-10-26 Richard Purdie <richard.purdie@linuxfoundation.org>
> +
> +gcc/ChangeLog:
> +
> +    * config/nios2/linux.h (MUSL_DYNAMIC_LINKER): Add musl linker
> +
> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> +
> +Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2021-October/582723=
.html]
> +Upstream-Status: Backport [https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcomm=
itdiff;h=3De5ddbbf992b909d8e38851bd3179d29389e6ac97]
> +---
> + gcc/config/nios2/linux.h | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +Index: gcc-11.2.0/gcc/config/nios2/linux.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gcc-11.2.0.orig/gcc/config/nios2/linux.h
> ++++ gcc-11.2.0/gcc/config/nios2/linux.h
> +@@ -30,6 +30,7 @@
> + #define CPP_SPEC "%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRANT}"
> +
> + #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-nios2.so.1"
> ++#define MUSL_DYNAMIC_LINKER  "/lib/ld-musl-nios2.so.1"
> +
> + #undef LINK_SPEC
> + #define LINK_SPEC LINK_SPEC_ENDIAN \
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0028-Ad=
d-ssp_nonshared-to-link-commandline-for-musl-targe.patch b/meta-arm-toolcha=
in/recipes-devtools/gcc/gcc-arm-11.2/0028-Add-ssp_nonshared-to-link-command=
line-for-musl-targe.patch
> similarity index 80%
> rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0028-Add=
-ssp_nonshared-to-link-commandline-for-musl-targe.patch
> rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0028-Add-s=
sp_nonshared-to-link-commandline-for-musl-targe.patch
> index cd409a894c24..9c616d24d03f 100644
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0028-Add-ssp_n=
onshared-to-link-commandline-for-musl-targe.patch
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0028-Add-ssp_n=
onshared-to-link-commandline-for-musl-targe.patch
> @@ -1,4 +1,4 @@
> -From 0bb86e4d2ab0bb44bab37a005f971cf94046ff0d Mon Sep 17 00:00:00 2001
> +From 745a2ac7825c73102b888226c54397d21512f86b Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Tue, 27 Jun 2017 18:10:54 -0700
>  Subject: [PATCH] Add ssp_nonshared to link commandline for musl targets
> @@ -22,12 +22,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   gcc/config/rs6000/linux64.h | 10 ++++++++++
>   3 files changed, 27 insertions(+)
>
> -diff --git a/gcc/config/linux.h b/gcc/config/linux.h
> -index 0c1a8118a26..bdc2a2d0659 100644
>  --- a/gcc/config/linux.h
>  +++ b/gcc/config/linux.h
> -@@ -195,6 +195,13 @@ see the files COPYING3 and COPYING.RUNTIME respecti=
vely.  If not, see
> -     { GCC_INCLUDE_DIR, "GCC", 0, 1, 0, 0 },           \
> +@@ -203,6 +203,13 @@ see the files COPYING3 and COPYING.RUNTI
> +     { GCC_INCLUDE_DIRVAR, "GCC", 0, 1, 0, 0 },                \
>       { 0, 0, 0, 0, 0, 0 }                              \
>     }
>  +#ifdef TARGET_LIBC_PROVIDES_SSP
> @@ -40,8 +38,6 @@ index 0c1a8118a26..bdc2a2d0659 100644
>   #endif
>
>   #if (DEFAULT_LIBC =3D=3D LIBC_UCLIBC) && defined (SINGLE_LIBC) /* uClin=
ux */
> -diff --git a/gcc/config/rs6000/linux.h b/gcc/config/rs6000/linux.h
> -index b7026fcbee7..dd54d6c393e 100644
>  --- a/gcc/config/rs6000/linux.h
>  +++ b/gcc/config/rs6000/linux.h
>  @@ -94,6 +94,16 @@
> @@ -61,11 +57,9 @@ index b7026fcbee7..dd54d6c393e 100644
>   #undef LINK_OS_LINUX_SPEC
>   #define LINK_OS_LINUX_SPEC LINK_OS_LINUX_EMUL " %{!shared: %{!static: \
>     %{!static-pie: \
> -diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
> -index 80969a8fd89..97a78ae945c 100644
>  --- a/gcc/config/rs6000/linux64.h
>  +++ b/gcc/config/rs6000/linux64.h
> -@@ -452,6 +452,16 @@ extern int dot_symbols;
> +@@ -369,6 +369,16 @@ extern int dot_symbols;
>                                            " -m elf64ppc")
>   #endif
>
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0029-Li=
nk-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch b/meta-arm-toolchain/r=
ecipes-devtools/gcc/gcc-arm-11.2/0029-Link-libgcc-using-LDFLAGS-not-just-SH=
LIB_LDFLAGS.patch
> similarity index 89%
> rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0029-Lin=
k-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
> rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0029-Link-=
libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
> index 9342329ecf2d..b74aeb8bb641 100644
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0029-Link-libg=
cc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0029-Link-libg=
cc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
> @@ -1,4 +1,4 @@
> -From 61b000792f32d4ca9b4b4498ebb7fd5d1deed710 Mon Sep 17 00:00:00 2001
> +From 695adb4dffb23c6f5cbc757e05cf4187a2bd6528 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 4 May 2016 21:11:34 -0700
>  Subject: [PATCH] Link libgcc using LDFLAGS, not just SHLIB_LDFLAGS
> @@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/libgcc/config/t-slibgcc b/libgcc/config/t-slibgcc
> -index c997553447c..330352c2c81 100644
> +index c59b43b7b69..ca4c141f526 100644
>  --- a/libgcc/config/t-slibgcc
>  +++ b/libgcc/config/t-slibgcc
>  @@ -32,7 +32,7 @@ SHLIB_INSTALL_SOLINK =3D $(LN_S) $(SHLIB_SONAME) \
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0030-sy=
nc-gcc-stddef.h-with-musl.patch b/meta-arm-toolchain/recipes-devtools/gcc/g=
cc-arm-11.2/0030-sync-gcc-stddef.h-with-musl.patch
> similarity index 92%
> rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0030-syn=
c-gcc-stddef.h-with-musl.patch
> rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0030-sync-=
gcc-stddef.h-with-musl.patch
> index ffbf6b97abbd..fd7d604e988f 100644
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0030-sync-gcc-=
stddef.h-with-musl.patch
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0030-sync-gcc-=
stddef.h-with-musl.patch
> @@ -1,4 +1,4 @@
> -From 92f588c68008176e7f6f1b3d534670bddedae783 Mon Sep 17 00:00:00 2001
> +From a9173429ae256c4b4a3ab4d758a6adf42f8c4239 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 3 Feb 2017 12:56:00 -0800
>  Subject: [PATCH] sync gcc stddef.h with musl
> @@ -6,7 +6,7 @@ Subject: [PATCH] sync gcc stddef.h with musl
>  musl defines ptrdiff_t size_t and wchar_t
>  so dont define them here if musl is definining them
>
> -Upstream-Status: Pending
> +Upstream-Status: Backport [https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcomm=
it;h=3D85a438fc78dd12249ca854a3e5c577fefeb1a5cd]
>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> @@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 9 insertions(+)
>
>  diff --git a/gcc/ginclude/stddef.h b/gcc/ginclude/stddef.h
> -index 9d67eac4947..6cb5edbedb4 100644
> +index 66619fe43b1..3f843d6f365 100644
>  --- a/gcc/ginclude/stddef.h
>  +++ b/gcc/ginclude/stddef.h
>  @@ -128,6 +128,7 @@ _TYPE_wchar_t;
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0033-Re=
-introduce-spe-commandline-options.patch b/meta-arm-toolchain/recipes-devto=
ols/gcc/gcc-arm-11.2/0033-Re-introduce-spe-commandline-options.patch
> similarity index 78%
> rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0033-Re-=
introduce-spe-commandline-options.patch
> rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0033-Re-in=
troduce-spe-commandline-options.patch
> index 8a8eda89b1ef..129f555a4880 100644
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0033-Re-introd=
uce-spe-commandline-options.patch
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0033-Re-introd=
uce-spe-commandline-options.patch
> @@ -1,4 +1,4 @@
> -From c1675b1dbc8b662eadaaa8ebf5bbfc783b7ecc75 Mon Sep 17 00:00:00 2001
> +From 0b900d6410b7c1938e86eceb87b032fd538566a9 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 6 Jun 2018 12:10:22 -0700
>  Subject: [PATCH] Re-introduce spe commandline options
> @@ -10,17 +10,18 @@ Upstream-Status: Inappropriate [SPE port is removed f=
rom rs600 port]
>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> - gcc/config/rs6000/rs6000.opt | 12 ++++++++++++
> - 1 file changed, 12 insertions(+)
> + gcc/config/rs6000/rs6000.opt | 13 +++++++++++++
> + 1 file changed, 13 insertions(+)
>
>  diff --git a/gcc/config/rs6000/rs6000.opt b/gcc/config/rs6000/rs6000.opt
> -index 4e3792bcefa..edfa4f7de48 100644
> +index 0dbdf753673..b273eb65c35 100644
>  --- a/gcc/config/rs6000/rs6000.opt
>  +++ b/gcc/config/rs6000/rs6000.opt
> -@@ -344,6 +344,18 @@ mdebug=3D
> +@@ -352,6 +352,19 @@ mdebug=3D
>   Target RejectNegative Joined
>   -mdebug=3D      Enable debug output.
>
> ++; PPC SPE ABI
>  +mspe
>  +Target Var(rs6000_spe) Save
>  +Generate SPE SIMD instructions on E500.
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0034-li=
bgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch b/meta-arm-toolcha=
in/recipes-devtools/gcc/gcc-arm-11.2/0034-libgcc_s-Use-alias-for-__cpu_indi=
cator_init-instead-.patch
> similarity index 90%
> rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0034-lib=
gcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
> rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0034-libgc=
c_s-Use-alias-for-__cpu_indicator_init-instead-.patch
> index 7dd334494d07..3f666dc7bd54 100644
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0034-libgcc_s-=
Use-alias-for-__cpu_indicator_init-instead-.patch
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0034-libgcc_s-=
Use-alias-for-__cpu_indicator_init-instead-.patch
> @@ -1,4 +1,4 @@
> -From 0c8d6cd3a5de6cdb832fdba4ec39d029432e76e6 Mon Sep 17 00:00:00 2001
> +From ea9154338cb3acbd75945fddde4202e73c20dd1a Mon Sep 17 00:00:00 2001
>  From: Szabolcs Nagy <nsz@port70.net>
>  Date: Sat, 24 Oct 2015 20:09:53 +0000
>  Subject: [PATCH] libgcc_s: Use alias for __cpu_indicator_init instead of
> @@ -39,10 +39,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   3 files changed, 6 insertions(+), 6 deletions(-)
>
>  diff --git a/gcc/config/i386/i386-expand.c b/gcc/config/i386/i386-expand=
.c
> -index 47d52550e5e..9cb8cc7950e 100644
> +index ac69eed4d32..ffaa44a16fc 100644
>  --- a/gcc/config/i386/i386-expand.c
>  +++ b/gcc/config/i386/i386-expand.c
> -@@ -10976,10 +10976,10 @@ ix86_expand_builtin (tree exp, rtx target, rtx=
 subtarget,
> +@@ -11038,10 +11038,10 @@ ix86_expand_builtin (tree exp, rtx target, rtx=
 subtarget,
>       {
>       case IX86_BUILTIN_CPU_INIT:
>         {
> @@ -56,11 +56,11 @@ index 47d52550e5e..9cb8cc7950e 100644
>         return expand_expr (call_expr, target, mode, EXPAND_NORMAL);
>         }
>  diff --git a/libgcc/config/i386/cpuinfo.c b/libgcc/config/i386/cpuinfo.c
> -index 83301a1445f..89fdc7eb587 100644
> +index ef463848f9d..1a3de052c80 100644
>  --- a/libgcc/config/i386/cpuinfo.c
>  +++ b/libgcc/config/i386/cpuinfo.c
> -@@ -516,7 +516,7 @@ __cpu_indicator_init (void)
> -   return 0;
> +@@ -63,7 +63,7 @@ __cpu_indicator_init (void)
> +                            __cpu_features2);
>   }
>
>  -#if defined SHARED && defined USE_ELF_SYMVER
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0035-ge=
ntypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch b/meta-arm-toolcha=
in/recipes-devtools/gcc/gcc-arm-11.2/0035-gentypes-genmodes-Do-not-use-__LI=
NE__-for-maintainin.patch
> similarity index 87%
> rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0035-gen=
types-genmodes-Do-not-use-__LINE__-for-maintainin.patch
> rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0035-genty=
pes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
> index b746f17e4e70..874cd7798d32 100644
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0035-gentypes-=
genmodes-Do-not-use-__LINE__-for-maintainin.patch
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0035-gentypes-=
genmodes-Do-not-use-__LINE__-for-maintainin.patch
> @@ -1,4 +1,4 @@
> -From febc910933faf6868805546e0df4a8452a82c225 Mon Sep 17 00:00:00 2001
> +From 520411cf364ee4b0b5a8f0857498aaabd790afb3 Mon Sep 17 00:00:00 2001
>  From: Richard Purdie <richard.purdie@linuxfoundation.org>
>  Date: Tue, 10 Mar 2020 08:26:53 -0700
>  Subject: [PATCH] gentypes/genmodes: Do not use __LINE__ for maintaining
> @@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   2 files changed, 19 insertions(+), 19 deletions(-)
>
>  diff --git a/gcc/gengtype.c b/gcc/gengtype.c
> -index 981577481af..d5700fff401 100644
> +index 5f50242e857..cbaca9b8cd0 100644
>  --- a/gcc/gengtype.c
>  +++ b/gcc/gengtype.c
>  @@ -991,7 +991,7 @@ create_field_at (pair_p next, type_p type, const cha=
r *name, options_p opt,
> @@ -38,7 +38,7 @@ index 981577481af..d5700fff401 100644
>
>   /* Reverse a linked list of 'struct pair's in place.  */
>   pair_p
> -@@ -5187,7 +5187,7 @@ main (int argc, char **argv)
> +@@ -5189,7 +5189,7 @@ main (int argc, char **argv)
>         /* These types are set up with #define or else outside of where
>            we can see them.  We should initialize them before calling
>            read_input_list.  */
> @@ -48,10 +48,10 @@ index 981577481af..d5700fff401 100644
>         POS_HERE (do_scalar_typedef ("CUMULATIVE_ARGS", &pos));
>         POS_HERE (do_scalar_typedef ("REAL_VALUE_TYPE", &pos));
>  diff --git a/gcc/genmodes.c b/gcc/genmodes.c
> -index 21e5f536976..a22f65a232f 100644
> +index c268ebc4c6e..4361f3f1563 100644
>  --- a/gcc/genmodes.c
>  +++ b/gcc/genmodes.c
> -@@ -430,7 +430,7 @@ complete_all_modes (void)
> +@@ -438,7 +438,7 @@ complete_all_modes (void)
>   }
>
>   /* For each mode in class CLASS, construct a corresponding complex mode=
.  */
> @@ -60,7 +60,7 @@ index 21e5f536976..a22f65a232f 100644
>   static void
>   make_complex_modes (enum mode_class cl,
>                     const char *file, unsigned int line)
> -@@ -489,7 +489,7 @@ make_complex_modes (enum mode_class cl,
> +@@ -497,7 +497,7 @@ make_complex_modes (enum mode_class cl,
>      having as many components as necessary.  ORDER is the sorting order
>      of the mode, with smaller numbers indicating a higher priority.  */
>   #define VECTOR_MODES_WITH_PREFIX(PREFIX, C, W, ORDER) \
> @@ -69,7 +69,7 @@ index 21e5f536976..a22f65a232f 100644
>   #define VECTOR_MODES(C, W) VECTOR_MODES_WITH_PREFIX (V, C, W, 0)
>   static void ATTRIBUTE_UNUSED
>   make_vector_modes (enum mode_class cl, const char *prefix, unsigned int=
 width,
> -@@ -541,7 +541,7 @@ make_vector_modes (enum mode_class cl, const char *p=
refix, unsigned int width,
> +@@ -549,7 +549,7 @@ make_vector_modes (enum mode_class cl, const char *p=
refix, unsigned int width,
>   /* Create a vector of booleans called NAME with COUNT elements and
>      BYTESIZE bytes in total.  */
>   #define VECTOR_BOOL_MODE(NAME, COUNT, BYTESIZE) \
> @@ -78,7 +78,7 @@ index 21e5f536976..a22f65a232f 100644
>   static void ATTRIBUTE_UNUSED
>   make_vector_bool_mode (const char *name, unsigned int count,
>                        unsigned int bytesize, const char *file,
> -@@ -563,7 +563,7 @@ make_vector_bool_mode (const char *name, unsigned in=
t count,
> +@@ -571,7 +571,7 @@ make_vector_bool_mode (const char *name, unsigned in=
t count,
>   /* Input.  */
>
>   #define _SPECIAL_MODE(C, N) \
> @@ -87,7 +87,7 @@ index 21e5f536976..a22f65a232f 100644
>   #define RANDOM_MODE(N) _SPECIAL_MODE (RANDOM, N)
>   #define CC_MODE(N) _SPECIAL_MODE (CC, N)
>
> -@@ -576,7 +576,7 @@ make_special_mode (enum mode_class cl, const char *n=
ame,
> +@@ -584,7 +584,7 @@ make_special_mode (enum mode_class cl, const char *n=
ame,
>
>   #define INT_MODE(N, Y) FRACTIONAL_INT_MODE (N, -1U, Y)
>   #define FRACTIONAL_INT_MODE(N, B, Y) \
> @@ -96,7 +96,7 @@ index 21e5f536976..a22f65a232f 100644
>
>   static void
>   make_int_mode (const char *name,
> -@@ -589,16 +589,16 @@ make_int_mode (const char *name,
> +@@ -611,16 +611,16 @@ make_opaque_mode (const char *name,
>   }
>
>   #define FRACT_MODE(N, Y, F) \
> @@ -117,7 +117,7 @@ index 21e5f536976..a22f65a232f 100644
>
>   /* Create a fixed-point mode by setting CL, NAME, BYTESIZE, IBIT, FBIT,
>      FILE, and LINE.  */
> -@@ -619,7 +619,7 @@ make_fixed_point_mode (enum mode_class cl,
> +@@ -641,7 +641,7 @@ make_fixed_point_mode (enum mode_class cl,
>
>   #define FLOAT_MODE(N, Y, F)             FRACTIONAL_FLOAT_MODE (N, -1U, =
Y, F)
>   #define FRACTIONAL_FLOAT_MODE(N, B, Y, F) \
> @@ -126,7 +126,7 @@ index 21e5f536976..a22f65a232f 100644
>
>   static void
>   make_float_mode (const char *name,
> -@@ -636,7 +636,7 @@ make_float_mode (const char *name,
> +@@ -658,7 +658,7 @@ make_float_mode (const char *name,
>   #define DECIMAL_FLOAT_MODE(N, Y, F)   \
>         FRACTIONAL_DECIMAL_FLOAT_MODE (N, -1U, Y, F)
>   #define FRACTIONAL_DECIMAL_FLOAT_MODE(N, B, Y, F)     \
> @@ -135,7 +135,7 @@ index 21e5f536976..a22f65a232f 100644
>
>   static void
>   make_decimal_float_mode (const char *name,
> -@@ -651,7 +651,7 @@ make_decimal_float_mode (const char *name,
> +@@ -673,7 +673,7 @@ make_decimal_float_mode (const char *name,
>   }
>
>   #define RESET_FLOAT_FORMAT(N, F) \
> @@ -144,7 +144,7 @@ index 21e5f536976..a22f65a232f 100644
>   static void ATTRIBUTE_UNUSED
>   reset_float_format (const char *name, const char *format,
>                     const char *file, unsigned int line)
> -@@ -672,7 +672,7 @@ reset_float_format (const char *name, const char *fo=
rmat,
> +@@ -694,7 +694,7 @@ reset_float_format (const char *name, const char *fo=
rmat,
>
>   /* __intN support.  */
>   #define INT_N(M,PREC)                         \
> @@ -153,7 +153,7 @@ index 21e5f536976..a22f65a232f 100644
>   static void ATTRIBUTE_UNUSED
>   make_int_n (const char *m, int bitsize,
>               const char *file, unsigned int line)
> -@@ -701,7 +701,7 @@ make_int_n (const char *m, int bitsize,
> +@@ -723,7 +723,7 @@ make_int_n (const char *m, int bitsize,
>   /* Partial integer modes are specified by relation to a full integer
>      mode.  */
>   #define PARTIAL_INT_MODE(M,PREC,NAME)                         \
> @@ -162,7 +162,7 @@ index 21e5f536976..a22f65a232f 100644
>   static void ATTRIBUTE_UNUSED
>   make_partial_integer_mode (const char *base, const char *name,
>                            unsigned int precision,
> -@@ -728,7 +728,7 @@ make_partial_integer_mode (const char *base, const c=
har *name,
> +@@ -750,7 +750,7 @@ make_partial_integer_mode (const char *base, const c=
har *name,
>   /* A single vector mode can be specified by naming its component
>      mode and the number of components.  */
>   #define VECTOR_MODE(C, M, N) \
> @@ -171,7 +171,7 @@ index 21e5f536976..a22f65a232f 100644
>   static void ATTRIBUTE_UNUSED
>   make_vector_mode (enum mode_class bclass,
>                   const char *base,
> -@@ -771,7 +771,7 @@ make_vector_mode (enum mode_class bclass,
> +@@ -793,7 +793,7 @@ make_vector_mode (enum mode_class bclass,
>
>   /* Adjustability.  */
>   #define _ADD_ADJUST(A, M, X, C1, C2) \
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0036-mi=
ngw32-Enable-operation_not_supported.patch b/meta-arm-toolchain/recipes-dev=
tools/gcc/gcc-arm-11.2/0036-mingw32-Enable-operation_not_supported.patch
> similarity index 89%
> rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0036-min=
gw32-Enable-operation_not_supported.patch
> rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0036-mingw=
32-Enable-operation_not_supported.patch
> index f2d6e30a07fc..3a7618c8202b 100644
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0036-mingw32-E=
nable-operation_not_supported.patch
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0036-mingw32-E=
nable-operation_not_supported.patch
> @@ -1,4 +1,4 @@
> -From 6d9d080ce16de2fda138a8aac579e531bd64221d Mon Sep 17 00:00:00 2001
> +From 96d895c8d5dc895d24fe37aa2b4f201a2566b4cc Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Tue, 12 May 2020 10:39:09 -0700
>  Subject: [PATCH] mingw32: Enable operation_not_supported
> @@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/libstdc++-v3/config/os/mingw32/error_constants.h b/libstdc+=
+-v3/config/os/mingw32/error_constants.h
> -index 2222c5227c4..35290eabfa7 100644
> +index eca06a97014..933cfab49cf 100644
>  --- a/libstdc++-v3/config/os/mingw32/error_constants.h
>  +++ b/libstdc++-v3/config/os/mingw32/error_constants.h
>  @@ -107,7 +107,7 @@ _GLIBCXX_BEGIN_NAMESPACE_VERSION
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0037-li=
batomic-Do-not-enforce-march-on-aarch64.patch b/meta-arm-toolchain/recipes-=
devtools/gcc/gcc-arm-11.2/0037-libatomic-Do-not-enforce-march-on-aarch64.pa=
tch
> similarity index 88%
> rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0037-lib=
atomic-Do-not-enforce-march-on-aarch64.patch
> rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0037-libat=
omic-Do-not-enforce-march-on-aarch64.patch
> index a55fbffb2c86..4c9a79cb64bc 100644
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3/0037-libatomic=
-Do-not-enforce-march-on-aarch64.patch
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0037-libatomic=
-Do-not-enforce-march-on-aarch64.patch
> @@ -1,4 +1,4 @@
> -From f572efe2cee2d580007beb4540925965365ceeb9 Mon Sep 17 00:00:00 2001
> +From 36d4fdbc99e69f9d70a29e2bada40cc3c1534557 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 13 May 2020 15:10:38 -0700
>  Subject: [PATCH] libatomic: Do not enforce march on aarch64
> @@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   2 files changed, 2 deletions(-)
>
>  diff --git a/libatomic/Makefile.am b/libatomic/Makefile.am
> -index 133fbbca77e..ac1ca645876 100644
> +index 0f3cd6f7121..c8124c1d5aa 100644
>  --- a/libatomic/Makefile.am
>  +++ b/libatomic/Makefile.am
>  @@ -125,7 +125,6 @@ libatomic_la_LIBADD =3D $(foreach s,$(SIZES),$(addsu=
ffix _$(s)_.lo,$(SIZEOBJS)))
> @@ -29,10 +29,10 @@ index 133fbbca77e..ac1ca645876 100644
>   endif
>   if ARCH_ARM_LINUX
>  diff --git a/libatomic/Makefile.in b/libatomic/Makefile.in
> -index a51807e95c9..97df2d7ff03 100644
> +index 0a51bd55f01..6d5b1581706 100644
>  --- a/libatomic/Makefile.in
>  +++ b/libatomic/Makefile.in
> -@@ -431,7 +431,6 @@ M_SRC =3D $(firstword $(filter %/$(M_FILE), $(all_c_=
files)))
> +@@ -432,7 +432,6 @@ M_SRC =3D $(firstword $(filter %/$(M_FILE), $(all_c_=
files)))
>   libatomic_la_LIBADD =3D $(foreach s,$(SIZES),$(addsuffix \
>         _$(s)_.lo,$(SIZEOBJS))) $(am__append_1) $(am__append_2) \
>         $(am__append_3) $(am__append_4)
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0041-ap=
ply-debug-prefix-maps-before-checksumming-DIEs.patch b/meta-arm-toolchain/r=
ecipes-devtools/gcc/gcc-arm-11.2/0041-apply-debug-prefix-maps-before-checks=
umming-DIEs.patch
> new file mode 100644
> index 000000000000..c8dcd74b9d55
> --- /dev/null
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-11.2/0041-apply-deb=
ug-prefix-maps-before-checksumming-DIEs.patch
> @@ -0,0 +1,95 @@
> +From 7cc2df084b7977653a9b59cbc34a9ad500ae619c Mon Sep 17 00:00:00 2001
> +From: Richard Biener <rguenther@suse.de>
> +Date: Tue, 20 Jul 2021 11:00:33 +0200
> +Subject: [PATCH] debug/101473 - apply debug prefix maps before checksumm=
ing DIEs
> +
> +The following makes sure to apply the debug prefix maps to filenames
> +before checksumming DIEs to create the global symbol for the CU DIE
> +used by LTO to link the late debug to the early debug.  This avoids
> +binary differences (in said symbol) when compiling with toolchains
> +installed under a different path and that compensated with appropriate
> +-fdebug-prefix-map options.
> +
> +The easiest and most scalable way is to record both the unmapped
> +and the remapped filename in the dwarf_file_data so the remapping
> +process takes place at a single point and only once (otherwise it
> +creates GC garbage at each point doing that).
> +
> +2021-07-20  Richard Biener  <rguenther@suse.de>
> +
> +       PR debug/101473
> +       * dwarf2out.h (dwarf_file_data): Add key member.
> +       * dwarf2out.c (dwarf_file_hasher::equal): Compare key.
> +       (dwarf_file_hasher::hash): Hash key.
> +       (lookup_filename): Remap the filename and store it in the
> +       filename member of dwarf_file_data when creating a new
> +       dwarf_file_data.
> +       (file_name_acquire): Do not remap the filename again.
> +       (maybe_emit_file): Likewise.
> +
> +[YOCTO #14481]
> +
> +Upstream-Status: Backport [https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcomm=
it;h=3D7cc2df084b7977653a9b59cbc34a9ad500ae619c]
> +
> +The upstream patch was modified to compensate for the definition of
> +"struct dwarf_file_data" being in dwarf2out.c rather than dwarf2out.h in
> +this version of gcc.
> +
> +Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
> +---
> +diff -urpN a/gcc/dwarf2out.c b/gcc/dwarf2out.c
> +--- a/gcc/dwarf2out.c  2021-04-27 06:00:13.000000000 -0400
> ++++ b/gcc/dwarf2out.c  2021-07-23 16:40:06.141886167 -0400
> +@@ -1283,6 +1283,7 @@ dwarf2out_switch_text_section (void)
> +
> + /* Data about a single source file.  */
> + struct GTY((for_user)) dwarf_file_data {
> ++  const char * key;
> +   const char * filename;
> +   int emitted_number;
> + };
> +@@ -12334,7 +12335,7 @@ file_name_acquire (dwarf_file_data **slo
> +
> +   fi =3D fnad->files + fnad->used_files++;
> +
> +-  f =3D remap_debug_filename (d->filename);
> ++  f =3D d->filename;
> +
> +   /* Skip all leading "./".  */
> +   while (f[0] =3D=3D '.' && IS_DIR_SEPARATOR (f[1]))
> +@@ -27231,13 +27232,13 @@ dwarf2out_ignore_block (const_tree block
> + bool
> + dwarf_file_hasher::equal (dwarf_file_data *p1, const char *p2)
> + {
> +-  return filename_cmp (p1->filename, p2) =3D=3D 0;
> ++  return filename_cmp (p1->key, p2) =3D=3D 0;
> + }
> +
> + hashval_t
> + dwarf_file_hasher::hash (dwarf_file_data *p)
> + {
> +-  return htab_hash_string (p->filename);
> ++  return htab_hash_string (p->key);
> + }
> +
> + /* Lookup FILE_NAME (in the list of filenames that we know about here i=
n
> +@@ -27267,7 +27268,8 @@ lookup_filename (const char *file_name)
> +     return *slot;
> +
> +   created =3D ggc_alloc<dwarf_file_data> ();
> +-  created->filename =3D file_name;
> ++  created->key =3D file_name;
> ++  created->filename =3D remap_debug_filename (file_name);
> +   created->emitted_number =3D 0;
> +   *slot =3D created;
> +   return created;
> +@@ -27293,8 +27295,7 @@ maybe_emit_file (struct dwarf_file_data
> +       if (output_asm_line_debug_info ())
> +       {
> +         fprintf (asm_out_file, "\t.file %u ", fd->emitted_number);
> +-        output_quoted_string (asm_out_file,
> +-                              remap_debug_filename (fd->filename));
> ++        output_quoted_string (asm_out_file, fd->filename);
> +         fputc ('\n', asm_out_file);
> +       }
> +     }
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross-canadian_a=
rm-10.3.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross-canadian_arm=
-11.2.bb
> similarity index 96%
> rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-cross-canadian_ar=
m-10.3.bb
> rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-cross-canadian_arm-=
11.2.bb
> index 8987a4c17d34..d4bf7bfab45a 100644
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross-canadian_arm-10.3=
.bb
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross-canadian_arm-11.2=
.bb
> @@ -1,5 +1,2 @@
>  require recipes-devtools/gcc/gcc-${PV}.inc
>  require recipes-devtools/gcc/gcc-cross-canadian.inc
> -
> -
> -
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_arm-10.3.b=
b b/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_arm-11.2.bb
> similarity index 100%
> rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_arm-10.3.bb
> rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_arm-11.2.bb
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-crosssdk_arm-10.=
3.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-crosssdk_arm-11.2.bb
> similarity index 100%
> rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-crosssdk_arm-10.3=
.bb
> rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-crosssdk_arm-11.2.b=
b
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-runtime_arm-10.3=
.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-runtime_arm-11.2.bb
> similarity index 100%
> rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-runtime_arm-10.3.=
bb
> rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-runtime_arm-11.2.bb
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-sanitizers_arm-1=
0.3.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-sanitizers_arm-11.2.bb
> similarity index 100%
> rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-sanitizers_arm-10=
.3.bb
> rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-sanitizers_arm-11.2=
.bb
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-source_arm-10.3.=
bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-source_arm-11.2.bb
> similarity index 100%
> rename from meta-arm-toolchain/recipes-devtools/gcc/gcc-source_arm-10.3.b=
b
> rename to meta-arm-toolchain/recipes-devtools/gcc/gcc-source_arm-11.2.bb
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-10.3.bb b/me=
ta-arm-toolchain/recipes-devtools/gcc/gcc_arm-11.2.bb
> similarity index 100%
> rename from meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-10.3.bb
> rename to meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-11.2.bb
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/libgcc-initial_arm-1=
0.3.bb b/meta-arm-toolchain/recipes-devtools/gcc/libgcc-initial_arm-11.2.bb
> similarity index 100%
> rename from meta-arm-toolchain/recipes-devtools/gcc/libgcc-initial_arm-10=
.3.bb
> rename to meta-arm-toolchain/recipes-devtools/gcc/libgcc-initial_arm-11.2=
.bb
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/libgcc_arm-10.3.bb b=
/meta-arm-toolchain/recipes-devtools/gcc/libgcc_arm-11.2.bb
> similarity index 100%
> rename from meta-arm-toolchain/recipes-devtools/gcc/libgcc_arm-10.3.bb
> rename to meta-arm-toolchain/recipes-devtools/gcc/libgcc_arm-11.2.bb
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/libgfortran_arm-10.3=
.bb b/meta-arm-toolchain/recipes-devtools/gcc/libgfortran_arm-11.2.bb
> similarity index 98%
> rename from meta-arm-toolchain/recipes-devtools/gcc/libgfortran_arm-10.3.=
bb
> rename to meta-arm-toolchain/recipes-devtools/gcc/libgfortran_arm-11.2.bb
> index 4e5688e97fb1..fe63d0a4db5c 100644
> --- a/meta-arm-toolchain/recipes-devtools/gcc/libgfortran_arm-10.3.bb
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/libgfortran_arm-11.2.bb
> @@ -1,3 +1,2 @@
>  require recipes-devtools/gcc/gcc-${PV}.inc
>  require recipes-devtools/gcc/libgfortran.inc
> -
> --
> 2.30.2
>

