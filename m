Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
 by mx.groups.io with SMTP id smtpd.web11.4785.1592286990667501739
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Jun 2020 22:56:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=pUTBgtOq;
 spf=pass (domain: linaro.org, ip: 209.85.167.65, mailfrom: sumit.garg@linaro.org)
Received: by mail-lf1-f65.google.com with SMTP id t74so3412587lff.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 15 Jun 2020 22:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nl/K6nhwWS7oSf5N/ueEUqdDCrCTZgJ8m6fegdBT5Fw=;
        b=pUTBgtOq+fN24vj4KIIdHZeLW8ERdbmAcwqN9mBfrkxiksFmxwcbrhtpkVobFnbOKa
         YtBbMN/FdS6O3KT0wykV3X8V3NIOqEI0yAYCQcq58L3Q1Z2rKerOhmS3HGCtp8fXFuMz
         fLyKLpScXv8sZm3gwiTbKh99XFUKvlDz3Im+Pxl/51vVUn4zwYEEAoacY04Vj1kgrQaH
         sUXTUtr250cuJEkKWfptqrl8Y7GZzo2PNgL2C7U+TZeIjhw/5wBtnYfQKiZwSEFu2lwr
         wLiNGm3Ud+7sEVIwZk9tzSCujHi1a6j4ERpA6msZ4JKaX4hWQcLGjnWCcTt1hUKXwFBv
         XWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nl/K6nhwWS7oSf5N/ueEUqdDCrCTZgJ8m6fegdBT5Fw=;
        b=jzus499lNDtirMTbHMZRQt/euKWD3WN1eufR5cKQUi+cPor+JgmK1lKtDmls+2mMBa
         vI2+3GItYOSsrpDNWPY06yCFrVbUSO2KhETtBLpBgYRrK8z3apRBTd8NZ0rju8qvjDk6
         xy6VVTDwV2n+JmfmpqbN8n/TM0n6VuGTdEPGajMNGvKYUTc9PyXEoHlwoDB+JcvoHvAn
         lNpkcgRssDpjLwgP1sQBNONqTQFvCt3XHdBEFVNW+UtELdzXf+5A4atrD4TXPZoydDVU
         1uUo9w2xYsaILn3jKkc/d13+yIt7B+6rFCS6ghGL+7Nr/q1GQ9gjwDHEKnw+oAvCShp9
         lAUg==
X-Gm-Message-State: AOAM532iUJtkyRWfxpZwof1ywkUUFvgSOrw/twANJlr+YF+0nmUPF6tm
	+uEJFzKig8e5ojImXrn637A/TqY6d5LfjY2UeiNjlw==
X-Google-Smtp-Source: ABdhPJwkIEweuk9eNVhnQqVuCPvaqnrOv1N1wcvBhk+fpQh9w+7KvaXlJngdqqw03lEE8NdunXgGzhrTKhgVpmvDqgk=
X-Received: by 2002:a05:6512:2027:: with SMTP id s7mr801316lfs.15.1592286988518;
 Mon, 15 Jun 2020 22:56:28 -0700 (PDT)
MIME-Version: 1.0
References: <1592208433-28086-1-git-send-email-denis@denix.org>
 <1592208433-28086-4-git-send-email-denis@denix.org> <CAFA6WYPHtsVDFwLMwSvTAxND_YGoLfCrgPd=PFcKCnKgk0LL1w@mail.gmail.com>
 <20200615182027.GW17660@denix.org>
In-Reply-To: <20200615182027.GW17660@denix.org>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Tue, 16 Jun 2020 11:26:17 +0530
Message-ID: <CAFA6WYM+OcicX3jgTQ4xX-uKT2=mnoZE9P752YKfd3wqotADDQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 4/4] external-arm-sdk-toolchain: add recipe to package gcc/gdb/binutils cross binaries
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, Denys Dmytriyenko <denys@ti.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jun 2020 at 23:50, Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Mon, Jun 15, 2020 at 06:15:17PM +0530, Sumit Garg wrote:
> > On Mon, 15 Jun 2020 at 13:37, Denys Dmytriyenko <denis@denix.org> wrote:
> > >
> > > From: Denys Dmytriyenko <denys@ti.com>
> > >
> > > Allows re-use of prebuilt ARM toolchain binaries for SDK generation.
> > >
> > > This code is upstreamed from meta-arago layer.
> > >
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > ---
> > >  .../conf/distro/include/tcmode-external-arm.inc    |   4 +
> > >  .../external-arm-sdk-toolchain.bb                  | 136 +++++++++++++++++++++
> > >  2 files changed, 140 insertions(+)
> > >  create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
> > >
> >
> > Thanks for pushing this recipe upstream. It's good to have the tools
> > binaries packaged in SDK from pre-built toolchain rather than building
> > from source.
> >
> > So I just gave it a try using poky distro which fails with following error:
> >
> > $ bitbake -c populate_sdk core-image-base
> > <snip>
> > Error:
> >  Problem: package
> > packagegroup-cross-canadian-qemuarm64-1.0-r0.x86_64_nativesdk requires
> > gdb-cross-canadian-aarch64, but none of the providers can be installed
> >   - conflicting requests
> >   - nothing provides libpython2.7.so.1.0()(64bit) needed by
> > gdb-cross-canadian-aarch64-8.3.0.20190709+git-r0.x86_64_nativesdk
>
> ^^^ looks like 8.3 toolchain has some python2-linked binaries, which would
> require dependency on meta-python2.

Here 8.3.0 is gdb version rather than toolchain version. See below:

$ ~/tc_install/gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu/bin/aarch64-none-linux-gnu-gdb
--version
GNU gdb (GNU Toolchain for the A-profile Architecture 9.2-2019.12
(arm-9.10)) 8.3.0.20190709-git
Copyright (C) 2019 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

> Let me check which binary is that, maybe
> we can just drop it. Or we can just skip this check with INSANE_SKIP...
>
> BTW, I don't see this issue with 9.2 toolchain.
>

Strangely, I see this issue with 9.2 toolchain for aarch64.

-Sumit

> --
> Denys
>
>
> > (try to add '--skip-broken' to skip uninstallable packages)
> > <snip>
> >
> > Is there something that I missed while testing?
> >
> > -Sumit
> >
> > > diff --git a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> > > index 9171380..08b87ef 100644
> > > --- a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> > > +++ b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> > > @@ -45,6 +45,10 @@ PREFERRED_PROVIDER_glibc-mtrace = "external-arm-toolchain"
> > >  PREFERRED_PROVIDER_libc-mtrace = "external-arm-toolchain"
> > >  PREFERRED_PROVIDER_virtual/linux-libc-headers = "external-arm-toolchain"
> > >
> > > +PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-arm-sdk-toolchain-${TRANSLATED_TARGET_ARCH}"
> > > +PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-arm-sdk-toolchain-${TRANSLATED_TARGET_ARCH}"
> > > +PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-arm-sdk-toolchain-${TRANSLATED_TARGET_ARCH}"
> > > +
> > >  TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_HOST}"
> > >
> > >  DISTRO_FEATURES_LIBC = "ipv4 ipv6 libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-crypt \
> > > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
> > > new file mode 100644
> > > index 0000000..88fd20e
> > > --- /dev/null
> > > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
> > > @@ -0,0 +1,136 @@
> > > +inherit cross-canadian
> > > +
> > > +PN = "external-arm-sdk-toolchain-${TARGET_ARCH}"
> > > +BPN = "external-arm-sdk-toolchain"
> > > +
> > > +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> > > +INHIBIT_PACKAGE_STRIP = "1"
> > > +INHIBIT_SYSROOT_STRIP = "1"
> > > +INHIBIT_DEFAULT_DEPS = "1"
> > > +EXCLUDE_FROM_SHLIBS = "1"
> > > +
> > > +EAT_LICENSE ??= ""
> > > +
> > > +LICENSE = "${EAT_LICENSE}"
> > > +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> > > +
> > > +INSANE_SKIP_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so staticdev file-rdeps libdir"
> > > +INSANE_SKIP_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so file-rdeps"
> > > +INSANE_SKIP_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so file-rdeps"
> > > +
> > > +PROVIDES = "\
> > > +       gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} \
> > > +       gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} \
> > > +       binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} \
> > > +"
> > > +
> > > +PACKAGES = "\
> > > +       gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} \
> > > +       gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} \
> > > +       binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} \
> > > +"
> > > +
> > > +# Adjust defaults in line with external toolchain
> > > +bindir = "${exec_prefix}/bin"
> > > +libdir = "${exec_prefix}/lib"
> > > +libexecdir = "${exec_prefix}/libexec"
> > > +datadir = "${exec_prefix}/share"
> > > +gcclibdir = "${libdir}/gcc"
> > > +
> > > +FILES_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
> > > +       ${prefix}/${EAT_TARGET_SYS}/lib/libstdc++.* \
> > > +       ${prefix}/${EAT_TARGET_SYS}/lib/libgcc_s.* \
> > > +       ${prefix}/${EAT_TARGET_SYS}/lib/libsupc++.* \
> > > +       ${gcclibdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/* \
> > > +       ${bindir}/${TARGET_PREFIX}gcov \
> > > +       ${bindir}/${TARGET_PREFIX}gcc* \
> > > +       ${bindir}/${TARGET_PREFIX}g++ \
> > > +       ${bindir}/${TARGET_PREFIX}cpp \
> > > +       ${libexecdir}/* \
> > > +"
> > > +
> > > +FILES_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
> > > +       ${bindir}/${TARGET_PREFIX}gdb* \
> > > +       ${datadir}/gdb/* \
> > > +"
> > > +
> > > +FILES_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
> > > +       ${prefix}/${EAT_TARGET_SYS}/bin/ld* \
> > > +       ${prefix}/${EAT_TARGET_SYS}/bin/objcopy \
> > > +       ${prefix}/${EAT_TARGET_SYS}/bin/strip \
> > > +       ${prefix}/${EAT_TARGET_SYS}/bin/nm \
> > > +       ${prefix}/${EAT_TARGET_SYS}/bin/ranlib \
> > > +       ${prefix}/${EAT_TARGET_SYS}/bin/as \
> > > +       ${prefix}/${EAT_TARGET_SYS}/bin/ar \
> > > +       ${prefix}/${EAT_TARGET_SYS}/bin/objdump \
> > > +       ${prefix}/${EAT_TARGET_SYS}/lib/ldscripts/* \
> > > +       ${bindir}/${TARGET_PREFIX}ld* \
> > > +       ${bindir}/${TARGET_PREFIX}addr2line \
> > > +       ${bindir}/${TARGET_PREFIX}objcopy \
> > > +       ${bindir}/${TARGET_PREFIX}readelf \
> > > +       ${bindir}/${TARGET_PREFIX}strip \
> > > +       ${bindir}/${TARGET_PREFIX}nm \
> > > +       ${bindir}/${TARGET_PREFIX}ranlib \
> > > +       ${bindir}/${TARGET_PREFIX}gprof \
> > > +       ${bindir}/${TARGET_PREFIX}as \
> > > +       ${bindir}/${TARGET_PREFIX}c++filt \
> > > +       ${bindir}/${TARGET_PREFIX}ar \
> > > +       ${bindir}/${TARGET_PREFIX}strings \
> > > +       ${bindir}/${TARGET_PREFIX}objdump \
> > > +       ${bindir}/${TARGET_PREFIX}size \
> > > +"
> > > +
> > > +DESCRIPTION_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "The GNU cc and gcc C compilers"
> > > +DESCRIPTION_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb - GNU debugger"
> > > +DESCRIPTION_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "A GNU collection of binary utilities"
> > > +
> > > +LICENSE_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_GCC_LICENSE}"
> > > +LICENSE_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_GDB_LICENSE}"
> > > +LICENSE_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_BFD_LICENSE}"
> > > +
> > > +PKGV_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_VER_GCC}"
> > > +PKGV_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_VER_GDB}"
> > > +PKGV_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_VER_BFD}"
> > > +
> > > +do_install() {
> > > +       install -d ${D}${prefix}/${EAT_TARGET_SYS}/bin
> > > +       install -d ${D}${prefix}/${EAT_TARGET_SYS}/lib
> > > +       install -d ${D}${bindir}
> > > +       install -d ${D}${libdir}
> > > +       install -d ${D}${prefix}/${EAT_TARGET_SYS}/lib/ldscripts
> > > +       install -d ${D}${libexecdir}
> > > +       install -d ${D}${datadir}/gdb
> > > +       install -d ${D}${gcclibdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include
> > > +
> > > +       CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> > > +
> > > +       # gcc
> > > +       for i in libstdc++.* libgcc_s.* libsupc++.*; do
> > > +               cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/${EAT_LIBDIR}/$i ${D}${prefix}/${EAT_TARGET_SYS}/lib
> > > +       done
> > > +       cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/* ${D}${gcclibdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}
> > > +       for i in gcov gcc* g++ cpp; do
> > > +               cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/bin/${TARGET_PREFIX}$i ${D}${bindir}
> > > +       done
> > > +       cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/libexec/* ${D}${libexecdir}
> > > +
> > > +       # gdb
> > > +       cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/bin/${TARGET_PREFIX}gdb* ${D}${bindir}
> > > +       cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/share/gdb/* ${D}${datadir}/gdb/
> > > +
> > > +       # binutils
> > > +       for i in ld* objcopy strip nm ranlib as ar objdump; do
> > > +               cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/bin/$i ${D}${prefix}/${EAT_TARGET_SYS}/bin
> > > +       done
> > > +       cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/lib/ldscripts/* ${D}${prefix}/${EAT_TARGET_SYS}/lib/ldscripts
> > > +       for i in ld* addr2line objcopy readelf strip nm ranlib gprof as c++filt ar strings objdump size; do
> > > +               cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/bin/${TARGET_PREFIX}$i ${D}${bindir}
> > > +       done
> > > +}
> > > +
> > > +python () {
> > > +    if not d.getVar("EAT_VER_MAIN", False):
> > > +        raise bb.parse.SkipPackage("External ARM toolchain not configured (EAT_VER_MAIN not set).")
> > > +    if d.getVar('TCLIBC', True) != "glibc":
> > > +        raise bb.parse.SkipPackage("incompatible with %s" % d.getVar('TCLIBC', True))
> > > +}
> > > --
> > > 2.7.4
> > >
> > > 
> >
