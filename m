Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web10.17047.1592225130876154956
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Jun 2020 05:45:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Je8VfT9I;
 spf=pass (domain: linaro.org, ip: 209.85.167.67, mailfrom: sumit.garg@linaro.org)
Received: by mail-lf1-f67.google.com with SMTP id z206so9455296lfc.6
        for <meta-arm@lists.yoctoproject.org>; Mon, 15 Jun 2020 05:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rZ0kvaPfkfqooJD7y371kITuYxVVDbcFajLnNKQ9/ns=;
        b=Je8VfT9IT/zxipPnlzqGIgm4y37V84nVE0yCO7Tjj3q20Ep1M7dnWkc6TbOvi6Ngdu
         VfT9hG8FCf1tvcAFQTxecLszIWfcvjmSWUzpOjjgHdgy1XZZNQwGoWxgJ1dIJHxq8+gb
         cVILKxNaBCGzUyaaY1l2+WPGu06IKz7i73IlHeR/4UMdqIPlwlGMFS7G0cRTDPNZFcdv
         EkPGjzP4X9l1usmKFONbGYIiVV5raxX+m4dszV2zi86OMaMvpOAA50DoGxTidn4HifCG
         dQbvpa3GHqLRBhE3DfPwVTb7yTQp6XH/qNTQDQV1fqqFGYC1+nrsiGpjh1H84w/pje9+
         PiqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rZ0kvaPfkfqooJD7y371kITuYxVVDbcFajLnNKQ9/ns=;
        b=sym7yKoM7PEOuzJR5OEf/jRM4gvobzvxGq1EFPhxzQIIrURJgT6qJATISj9MpJqOzE
         3TjpccY4XI6ut7ZwjVNrsOYwm072OI0CNYKEU0NWKiyfy1AIwzMdi+pRwOo7FnuO0CA9
         4rcfOWWYAso3BPuK4limz62sSHIKhbBybhDgWHdgkmnVblO2qvhqOou1fCqvyBJljFrh
         1QWKmaBz8lbTfNFLJGURlw1IAurnNLuAvZhblGvwA6Pl0YEuJPKwyz7dpNz2U5KI5bCu
         Lq4bnThljB7RoE72dgU3j1D5RozYzuR0WqKe2Fd+HzHgJuxIKaV+T6N9wtS7nH6IMkSY
         BX/w==
X-Gm-Message-State: AOAM533SLLdomvD0o2iN3dt/DGGKymb+ghVJ2Kkd4Qv+C0+cHa8WH6bD
	DTqN8Fnv/VIcH0nDK81lYK4mysIhEFTNpAK3JIFB9Q==
X-Google-Smtp-Source: ABdhPJwQ55+N0b+fGzioEnXpcqMv+CP+l9Sw/j10LFkKESn1elSETbgKIWvL51UFfGESGyShLm3DPd31MRldaXaZyUY=
X-Received: by 2002:a05:6512:2027:: with SMTP id s7mr13462574lfs.15.1592225129061;
 Mon, 15 Jun 2020 05:45:29 -0700 (PDT)
MIME-Version: 1.0
References: <1592208433-28086-1-git-send-email-denis@denix.org> <1592208433-28086-4-git-send-email-denis@denix.org>
In-Reply-To: <1592208433-28086-4-git-send-email-denis@denix.org>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Mon, 15 Jun 2020 18:15:17 +0530
Message-ID: <CAFA6WYPHtsVDFwLMwSvTAxND_YGoLfCrgPd=PFcKCnKgk0LL1w@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 4/4] external-arm-sdk-toolchain: add recipe to package gcc/gdb/binutils cross binaries
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, Denys Dmytriyenko <denys@ti.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jun 2020 at 13:37, Denys Dmytriyenko <denis@denix.org> wrote:
>
> From: Denys Dmytriyenko <denys@ti.com>
>
> Allows re-use of prebuilt ARM toolchain binaries for SDK generation.
>
> This code is upstreamed from meta-arago layer.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../conf/distro/include/tcmode-external-arm.inc    |   4 +
>  .../external-arm-sdk-toolchain.bb                  | 136 +++++++++++++++++++++
>  2 files changed, 140 insertions(+)
>  create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
>

Thanks for pushing this recipe upstream. It's good to have the tools
binaries packaged in SDK from pre-built toolchain rather than building
from source.

So I just gave it a try using poky distro which fails with following error:

$ bitbake -c populate_sdk core-image-base
<snip>
Error:
 Problem: package
packagegroup-cross-canadian-qemuarm64-1.0-r0.x86_64_nativesdk requires
gdb-cross-canadian-aarch64, but none of the providers can be installed
  - conflicting requests
  - nothing provides libpython2.7.so.1.0()(64bit) needed by
gdb-cross-canadian-aarch64-8.3.0.20190709+git-r0.x86_64_nativesdk
(try to add '--skip-broken' to skip uninstallable packages)
<snip>

Is there something that I missed while testing?

-Sumit

> diff --git a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> index 9171380..08b87ef 100644
> --- a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> +++ b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> @@ -45,6 +45,10 @@ PREFERRED_PROVIDER_glibc-mtrace = "external-arm-toolchain"
>  PREFERRED_PROVIDER_libc-mtrace = "external-arm-toolchain"
>  PREFERRED_PROVIDER_virtual/linux-libc-headers = "external-arm-toolchain"
>
> +PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-arm-sdk-toolchain-${TRANSLATED_TARGET_ARCH}"
> +PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-arm-sdk-toolchain-${TRANSLATED_TARGET_ARCH}"
> +PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-arm-sdk-toolchain-${TRANSLATED_TARGET_ARCH}"
> +
>  TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_HOST}"
>
>  DISTRO_FEATURES_LIBC = "ipv4 ipv6 libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-crypt \
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
> new file mode 100644
> index 0000000..88fd20e
> --- /dev/null
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
> @@ -0,0 +1,136 @@
> +inherit cross-canadian
> +
> +PN = "external-arm-sdk-toolchain-${TARGET_ARCH}"
> +BPN = "external-arm-sdk-toolchain"
> +
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> +INHIBIT_PACKAGE_STRIP = "1"
> +INHIBIT_SYSROOT_STRIP = "1"
> +INHIBIT_DEFAULT_DEPS = "1"
> +EXCLUDE_FROM_SHLIBS = "1"
> +
> +EAT_LICENSE ??= ""
> +
> +LICENSE = "${EAT_LICENSE}"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> +
> +INSANE_SKIP_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so staticdev file-rdeps libdir"
> +INSANE_SKIP_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so file-rdeps"
> +INSANE_SKIP_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so file-rdeps"
> +
> +PROVIDES = "\
> +       gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} \
> +       gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} \
> +       binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} \
> +"
> +
> +PACKAGES = "\
> +       gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} \
> +       gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} \
> +       binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} \
> +"
> +
> +# Adjust defaults in line with external toolchain
> +bindir = "${exec_prefix}/bin"
> +libdir = "${exec_prefix}/lib"
> +libexecdir = "${exec_prefix}/libexec"
> +datadir = "${exec_prefix}/share"
> +gcclibdir = "${libdir}/gcc"
> +
> +FILES_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
> +       ${prefix}/${EAT_TARGET_SYS}/lib/libstdc++.* \
> +       ${prefix}/${EAT_TARGET_SYS}/lib/libgcc_s.* \
> +       ${prefix}/${EAT_TARGET_SYS}/lib/libsupc++.* \
> +       ${gcclibdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/* \
> +       ${bindir}/${TARGET_PREFIX}gcov \
> +       ${bindir}/${TARGET_PREFIX}gcc* \
> +       ${bindir}/${TARGET_PREFIX}g++ \
> +       ${bindir}/${TARGET_PREFIX}cpp \
> +       ${libexecdir}/* \
> +"
> +
> +FILES_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
> +       ${bindir}/${TARGET_PREFIX}gdb* \
> +       ${datadir}/gdb/* \
> +"
> +
> +FILES_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
> +       ${prefix}/${EAT_TARGET_SYS}/bin/ld* \
> +       ${prefix}/${EAT_TARGET_SYS}/bin/objcopy \
> +       ${prefix}/${EAT_TARGET_SYS}/bin/strip \
> +       ${prefix}/${EAT_TARGET_SYS}/bin/nm \
> +       ${prefix}/${EAT_TARGET_SYS}/bin/ranlib \
> +       ${prefix}/${EAT_TARGET_SYS}/bin/as \
> +       ${prefix}/${EAT_TARGET_SYS}/bin/ar \
> +       ${prefix}/${EAT_TARGET_SYS}/bin/objdump \
> +       ${prefix}/${EAT_TARGET_SYS}/lib/ldscripts/* \
> +       ${bindir}/${TARGET_PREFIX}ld* \
> +       ${bindir}/${TARGET_PREFIX}addr2line \
> +       ${bindir}/${TARGET_PREFIX}objcopy \
> +       ${bindir}/${TARGET_PREFIX}readelf \
> +       ${bindir}/${TARGET_PREFIX}strip \
> +       ${bindir}/${TARGET_PREFIX}nm \
> +       ${bindir}/${TARGET_PREFIX}ranlib \
> +       ${bindir}/${TARGET_PREFIX}gprof \
> +       ${bindir}/${TARGET_PREFIX}as \
> +       ${bindir}/${TARGET_PREFIX}c++filt \
> +       ${bindir}/${TARGET_PREFIX}ar \
> +       ${bindir}/${TARGET_PREFIX}strings \
> +       ${bindir}/${TARGET_PREFIX}objdump \
> +       ${bindir}/${TARGET_PREFIX}size \
> +"
> +
> +DESCRIPTION_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "The GNU cc and gcc C compilers"
> +DESCRIPTION_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb - GNU debugger"
> +DESCRIPTION_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "A GNU collection of binary utilities"
> +
> +LICENSE_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_GCC_LICENSE}"
> +LICENSE_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_GDB_LICENSE}"
> +LICENSE_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_BFD_LICENSE}"
> +
> +PKGV_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_VER_GCC}"
> +PKGV_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_VER_GDB}"
> +PKGV_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_VER_BFD}"
> +
> +do_install() {
> +       install -d ${D}${prefix}/${EAT_TARGET_SYS}/bin
> +       install -d ${D}${prefix}/${EAT_TARGET_SYS}/lib
> +       install -d ${D}${bindir}
> +       install -d ${D}${libdir}
> +       install -d ${D}${prefix}/${EAT_TARGET_SYS}/lib/ldscripts
> +       install -d ${D}${libexecdir}
> +       install -d ${D}${datadir}/gdb
> +       install -d ${D}${gcclibdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include
> +
> +       CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> +
> +       # gcc
> +       for i in libstdc++.* libgcc_s.* libsupc++.*; do
> +               cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/${EAT_LIBDIR}/$i ${D}${prefix}/${EAT_TARGET_SYS}/lib
> +       done
> +       cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/* ${D}${gcclibdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}
> +       for i in gcov gcc* g++ cpp; do
> +               cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/bin/${TARGET_PREFIX}$i ${D}${bindir}
> +       done
> +       cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/libexec/* ${D}${libexecdir}
> +
> +       # gdb
> +       cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/bin/${TARGET_PREFIX}gdb* ${D}${bindir}
> +       cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/share/gdb/* ${D}${datadir}/gdb/
> +
> +       # binutils
> +       for i in ld* objcopy strip nm ranlib as ar objdump; do
> +               cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/bin/$i ${D}${prefix}/${EAT_TARGET_SYS}/bin
> +       done
> +       cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/lib/ldscripts/* ${D}${prefix}/${EAT_TARGET_SYS}/lib/ldscripts
> +       for i in ld* addr2line objcopy readelf strip nm ranlib gprof as c++filt ar strings objdump size; do
> +               cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/bin/${TARGET_PREFIX}$i ${D}${bindir}
> +       done
> +}
> +
> +python () {
> +    if not d.getVar("EAT_VER_MAIN", False):
> +        raise bb.parse.SkipPackage("External ARM toolchain not configured (EAT_VER_MAIN not set).")
> +    if d.getVar('TCLIBC', True) != "glibc":
> +        raise bb.parse.SkipPackage("incompatible with %s" % d.getVar('TCLIBC', True))
> +}
> --
> 2.7.4
>
> 
