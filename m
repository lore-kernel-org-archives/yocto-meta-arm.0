Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
 by mx.groups.io with SMTP id smtpd.web10.8661.1592923831893024009
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Jun 2020 07:50:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=iSlaRCCD;
 spf=pass (domain: linaro.org, ip: 209.85.167.68, mailfrom: sumit.garg@linaro.org)
Received: by mail-lf1-f68.google.com with SMTP id u25so11862545lfm.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 23 Jun 2020 07:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NrBZpQXD8x6p9+28jGSnPq4We8yu4hoeLG8iREdETSc=;
        b=iSlaRCCDw0JXfodvVBvnTxTx4GKyASgCiIKHeCIAMTA4dRykYeDV3pV1F+K+veGCqK
         nVXR7ennwBdbTUrXoWMDIWWVKV0JbBkqtYtQJsN9ODUlrDPEBIIJlgCAkbVhDKdvFBqH
         EL8fIks/vpbxdvgnOG/gfDr7uZdxMd6fKoINjyQMXoiz55elKUxTRoHHhUXVbnKed4rb
         9E0xAVtxBUcpX84D8fZIYFG/wWspuY8R8VBugiZWw6wTEyp90A9W5cCERY32o0rzRv00
         9/dnZIx+7lapqSblpot2lyFaMGzkQ5Jl5Fa0qftIcRBeDLdAhXL55GXPnacHO1w3v1ul
         LhXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NrBZpQXD8x6p9+28jGSnPq4We8yu4hoeLG8iREdETSc=;
        b=t+Pn9BeOlrssQHqfTjDRpK+fm6qWEFiyRYW80YcI6z1wdyDeUHdhFjC9avM/k3J9Ut
         7r9OoaaB1GDlkpvUm6m458QyMougUfEv9zKQWxm+e8UDRSyTml8mZXdm2MW5yS5d4ecN
         9fbEsIIDSgRqZP9Ed8x2F5QoVPdoSP/lWqHx18d55CpKnjJN7IPvRb5WAP/aVfaKu3yX
         +lEQl3V0IFWf8w3ejYCYSDwEeiY/rzTcmRv8fgNG9sE5Pfi+Pdqz6D1hX8XJgP7/M1g9
         rzQwynd18TtsRLoR9C7ADT/nryXOoYKq0yfm8Yy7hTM3tG/JlJNSdEjc+R42o1WhypUh
         LFNQ==
X-Gm-Message-State: AOAM532AqdUxefR8OsRMon+CxnQWt9tjz4MWDu9MlK8DUDjwe1sVwB1/
	O/cg8Dxl2F6gc/rYquRfzFYMj0xW/vcEGyo4JODeoQ==
X-Google-Smtp-Source: ABdhPJyWQy1Ho7J1af3CW+I1Hjxjapzc+sZK6pSBLjLsZLswNZQPAbe700WQbJupyjiWgD1D2mf//y3dzfPTIHzBuAQ=
X-Received: by 2002:ac2:47ed:: with SMTP id b13mr5023409lfp.21.1592923830010;
 Tue, 23 Jun 2020 07:50:30 -0700 (PDT)
MIME-Version: 1.0
References: <1592526937-38479-1-git-send-email-denis@denix.org> <1592526937-38479-5-git-send-email-denis@denix.org>
In-Reply-To: <1592526937-38479-5-git-send-email-denis@denix.org>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Tue, 23 Jun 2020 20:20:18 +0530
Message-ID: <CAFA6WYOG6Yqy+aCAmro23scobmQHhhEgPrwOsAR_yjkOMipCQA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH v3 4/5] external-arm-sdk-toolchain: add recipe to package gcc/gdb/binutils cross binaries
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, Denys Dmytriyenko <denys@ti.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jun 2020 at 06:05, Denys Dmytriyenko <denis@denix.org> wrote:
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
>  .../external-arm-sdk-toolchain.bb                  | 140 +++++++++++++++++++++
>  2 files changed, 144 insertions(+)
>  create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
>
> diff --git a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> index eee1a51..7d5aecc 100644
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
> index 0000000..df42b88
> --- /dev/null
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
> @@ -0,0 +1,140 @@
> +inherit cross-canadian
> +
> +PN = "external-arm-sdk-toolchain-${TARGET_ARCH}"
> +BPN = "external-arm-sdk-toolchain"
> +

We should add here PV too as follows:

PV = "${EAT_VER_MAIN}"

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
> +# Skip packaging QA checks for prebuilt binaries
> +INSANE_SKIP_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so staticdev file-rdeps libdir"
> +INSANE_SKIP_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so file-rdeps"
> +INSANE_SKIP_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so file-rdeps"
> +
> +# Skip file dependencies in RPM for prebuilt binaries
> +SKIP_FILEDEPS = "1"
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

As I observed here, all the libraries needed for cross-compilation are
packaged here corresponding to EAT_TARGET_SYS. So why not package
headers here as well required for cross-compilation?

So with the additional change as follows, we basically package every
dependency needed to use EAT for cross-compilation corresponding to
EAT_TARGET_SYS. And hence we don't require:

- symlinks corresponding to EAT_TARGET_SYS in external-arm-toolchain recipe.
- hack in patch #5 can be dropped entirely as headers are packaged by
default at ${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/${EAT_TARGET_SYS}/include.

--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
@@ -45,6 +45,7 @@ FILES_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
        ${prefix}/${EAT_TARGET_SYS}/lib/libstdc++.* \
        ${prefix}/${EAT_TARGET_SYS}/lib/libgcc_s.* \
        ${prefix}/${EAT_TARGET_SYS}/lib/libsupc++.* \
+       ${prefix}/${EAT_TARGET_SYS}/include \
        ${gcclibdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/* \
        ${bindir}/${TARGET_PREFIX}gcov \
        ${bindir}/${TARGET_PREFIX}gcc* \
@@ -99,6 +100,7 @@
PKGV_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =
"${EAT_VER_BFD}"
 do_install() {
        install -d ${D}${prefix}/${EAT_TARGET_SYS}/bin
        install -d ${D}${prefix}/${EAT_TARGET_SYS}/lib
+       install -d ${D}${prefix}/${EAT_TARGET_SYS}/include
        install -d ${D}${bindir}
        install -d ${D}${libdir}
        install -d ${D}${prefix}/${EAT_TARGET_SYS}/lib/ldscripts
@@ -112,6 +114,7 @@ do_install() {
        for i in libstdc++.* libgcc_s.* libsupc++.*; do
                cp ${CP_ARGS}
${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/${EAT_LIBDIR}/$i
${D}${prefix}/${EAT_TARGET_SYS}/lib
        done
+       cp ${CP_ARGS}
${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/include/*
${D}${prefix}/${EAT_TARGET_SYS}/include
        cp ${CP_ARGS}
${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/*
${D}${gcclibdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}
        for i in gcov gcc* g++ cpp; do
                cp ${CP_ARGS}
${EXTERNAL_TOOLCHAIN}/bin/${TARGET_PREFIX}$i ${D}${bindir}

-Sumit

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
