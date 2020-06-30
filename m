Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6028.1593480059523909313
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Jun 2020 18:20:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E855840BA1;
	Tue, 30 Jun 2020 01:20:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N20nWJlM4Fxa; Tue, 30 Jun 2020 01:20:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B6271409DE;
	Tue, 30 Jun 2020 01:20:56 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5C1181707D8; Mon, 29 Jun 2020 21:20:56 -0400 (EDT)
Date: Mon, 29 Jun 2020 21:20:56 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-arm] [PATCH v3 4/5] external-arm-sdk-toolchain: add recipe to package gcc/gdb/binutils cross binaries
Message-ID: <20200630012056.GP17660@denix.org>
References: <1592526937-38479-1-git-send-email-denis@denix.org>
 <1592526937-38479-5-git-send-email-denis@denix.org>
 <CAFA6WYOG6Yqy+aCAmro23scobmQHhhEgPrwOsAR_yjkOMipCQA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFA6WYOG6Yqy+aCAmro23scobmQHhhEgPrwOsAR_yjkOMipCQA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 23, 2020 at 08:20:18PM +0530, Sumit Garg wrote:
> On Fri, 19 Jun 2020 at 06:05, Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > Allows re-use of prebuilt ARM toolchain binaries for SDK generation.
> >
> > This code is upstreamed from meta-arago layer.
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  .../conf/distro/include/tcmode-external-arm.inc    |   4 +
> >  .../external-arm-sdk-toolchain.bb                  | 140 +++++++++++++++++++++
> >  2 files changed, 144 insertions(+)
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
> >
> > diff --git a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> > index eee1a51..7d5aecc 100644
> > --- a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> > +++ b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> > @@ -45,6 +45,10 @@ PREFERRED_PROVIDER_glibc-mtrace = "external-arm-toolchain"
> >  PREFERRED_PROVIDER_libc-mtrace = "external-arm-toolchain"
> >  PREFERRED_PROVIDER_virtual/linux-libc-headers = "external-arm-toolchain"
> >
> > +PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-arm-sdk-toolchain-${TRANSLATED_TARGET_ARCH}"
> > +PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-arm-sdk-toolchain-${TRANSLATED_TARGET_ARCH}"
> > +PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-arm-sdk-toolchain-${TRANSLATED_TARGET_ARCH}"
> > +
> >  TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_HOST}"
> >
> >  DISTRO_FEATURES_LIBC = "ipv4 ipv6 libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-crypt \
> > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
> > new file mode 100644
> > index 0000000..df42b88
> > --- /dev/null
> > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
> > @@ -0,0 +1,140 @@
> > +inherit cross-canadian
> > +
> > +PN = "external-arm-sdk-toolchain-${TARGET_ARCH}"
> > +BPN = "external-arm-sdk-toolchain"
> > +
> 
> We should add here PV too as follows:
> 
> PV = "${EAT_VER_MAIN}"

Ok, fine, even though there's no ${PN} package generated, it would help with 
all the temp dirs.


> > +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> > +INHIBIT_PACKAGE_STRIP = "1"
> > +INHIBIT_SYSROOT_STRIP = "1"
> > +INHIBIT_DEFAULT_DEPS = "1"
> > +EXCLUDE_FROM_SHLIBS = "1"
> > +
> > +EAT_LICENSE ??= ""
> > +
> > +LICENSE = "${EAT_LICENSE}"
> > +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> > +
> > +# Skip packaging QA checks for prebuilt binaries
> > +INSANE_SKIP_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so staticdev file-rdeps libdir"
> > +INSANE_SKIP_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so file-rdeps"
> > +INSANE_SKIP_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so file-rdeps"
> > +
> > +# Skip file dependencies in RPM for prebuilt binaries
> > +SKIP_FILEDEPS = "1"
> > +
> > +PROVIDES = "\
> > +       gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} \
> > +       gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} \
> > +       binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} \
> > +"
> > +
> > +PACKAGES = "\
> > +       gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} \
> > +       gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} \
> > +       binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} \
> > +"
> > +
> > +# Adjust defaults in line with external toolchain
> > +bindir = "${exec_prefix}/bin"
> > +libdir = "${exec_prefix}/lib"
> > +libexecdir = "${exec_prefix}/libexec"
> > +datadir = "${exec_prefix}/share"
> > +gcclibdir = "${libdir}/gcc"
> > +
> > +FILES_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
> > +       ${prefix}/${EAT_TARGET_SYS}/lib/libstdc++.* \
> > +       ${prefix}/${EAT_TARGET_SYS}/lib/libgcc_s.* \
> > +       ${prefix}/${EAT_TARGET_SYS}/lib/libsupc++.* \
> > +       ${gcclibdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/* \
> 
> As I observed here, all the libraries needed for cross-compilation are
> packaged here corresponding to EAT_TARGET_SYS. So why not package
> headers here as well required for cross-compilation?

See my reply to 0/5 - getting headers from these packages for the target would 
be problematic.


> So with the additional change as follows, we basically package every
> dependency needed to use EAT for cross-compilation corresponding to
> EAT_TARGET_SYS. And hence we don't require:
> 
> - symlinks corresponding to EAT_TARGET_SYS in external-arm-toolchain recipe.
> - hack in patch #5 can be dropped entirely as headers are packaged by
> default at ${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/${EAT_TARGET_SYS}/include.
> 
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
> @@ -45,6 +45,7 @@ FILES_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
>         ${prefix}/${EAT_TARGET_SYS}/lib/libstdc++.* \
>         ${prefix}/${EAT_TARGET_SYS}/lib/libgcc_s.* \
>         ${prefix}/${EAT_TARGET_SYS}/lib/libsupc++.* \
> +       ${prefix}/${EAT_TARGET_SYS}/include \
>         ${gcclibdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/* \
>         ${bindir}/${TARGET_PREFIX}gcov \
>         ${bindir}/${TARGET_PREFIX}gcc* \
> @@ -99,6 +100,7 @@
> PKGV_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =
> "${EAT_VER_BFD}"
>  do_install() {
>         install -d ${D}${prefix}/${EAT_TARGET_SYS}/bin
>         install -d ${D}${prefix}/${EAT_TARGET_SYS}/lib
> +       install -d ${D}${prefix}/${EAT_TARGET_SYS}/include
>         install -d ${D}${bindir}
>         install -d ${D}${libdir}
>         install -d ${D}${prefix}/${EAT_TARGET_SYS}/lib/ldscripts
> @@ -112,6 +114,7 @@ do_install() {
>         for i in libstdc++.* libgcc_s.* libsupc++.*; do
>                 cp ${CP_ARGS}
> ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/${EAT_LIBDIR}/$i
> ${D}${prefix}/${EAT_TARGET_SYS}/lib
>         done
> +       cp ${CP_ARGS}
> ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/include/*
> ${D}${prefix}/${EAT_TARGET_SYS}/include
>         cp ${CP_ARGS}
> ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/*
> ${D}${gcclibdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}
>         for i in gcov gcc* g++ cpp; do
>                 cp ${CP_ARGS}
> ${EXTERNAL_TOOLCHAIN}/bin/${TARGET_PREFIX}$i ${D}${bindir}
> 
> -Sumit
> 
> > +       ${bindir}/${TARGET_PREFIX}gcov \
> > +       ${bindir}/${TARGET_PREFIX}gcc* \
> > +       ${bindir}/${TARGET_PREFIX}g++ \
> > +       ${bindir}/${TARGET_PREFIX}cpp \
> > +       ${libexecdir}/* \
> > +"
> > +
> > +FILES_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
> > +       ${bindir}/${TARGET_PREFIX}gdb* \
> > +       ${datadir}/gdb/* \
> > +"
> > +
> > +FILES_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
> > +       ${prefix}/${EAT_TARGET_SYS}/bin/ld* \
> > +       ${prefix}/${EAT_TARGET_SYS}/bin/objcopy \
> > +       ${prefix}/${EAT_TARGET_SYS}/bin/strip \
> > +       ${prefix}/${EAT_TARGET_SYS}/bin/nm \
> > +       ${prefix}/${EAT_TARGET_SYS}/bin/ranlib \
> > +       ${prefix}/${EAT_TARGET_SYS}/bin/as \
> > +       ${prefix}/${EAT_TARGET_SYS}/bin/ar \
> > +       ${prefix}/${EAT_TARGET_SYS}/bin/objdump \
> > +       ${prefix}/${EAT_TARGET_SYS}/lib/ldscripts/* \
> > +       ${bindir}/${TARGET_PREFIX}ld* \
> > +       ${bindir}/${TARGET_PREFIX}addr2line \
> > +       ${bindir}/${TARGET_PREFIX}objcopy \
> > +       ${bindir}/${TARGET_PREFIX}readelf \
> > +       ${bindir}/${TARGET_PREFIX}strip \
> > +       ${bindir}/${TARGET_PREFIX}nm \
> > +       ${bindir}/${TARGET_PREFIX}ranlib \
> > +       ${bindir}/${TARGET_PREFIX}gprof \
> > +       ${bindir}/${TARGET_PREFIX}as \
> > +       ${bindir}/${TARGET_PREFIX}c++filt \
> > +       ${bindir}/${TARGET_PREFIX}ar \
> > +       ${bindir}/${TARGET_PREFIX}strings \
> > +       ${bindir}/${TARGET_PREFIX}objdump \
> > +       ${bindir}/${TARGET_PREFIX}size \
> > +"
> > +
> > +DESCRIPTION_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "The GNU cc and gcc C compilers"
> > +DESCRIPTION_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb - GNU debugger"
> > +DESCRIPTION_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "A GNU collection of binary utilities"
> > +
> > +LICENSE_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_GCC_LICENSE}"
> > +LICENSE_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_GDB_LICENSE}"
> > +LICENSE_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_BFD_LICENSE}"
> > +
> > +PKGV_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_VER_GCC}"
> > +PKGV_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_VER_GDB}"
> > +PKGV_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_VER_BFD}"
> > +
> > +do_install() {
> > +       install -d ${D}${prefix}/${EAT_TARGET_SYS}/bin
> > +       install -d ${D}${prefix}/${EAT_TARGET_SYS}/lib
> > +       install -d ${D}${bindir}
> > +       install -d ${D}${libdir}
> > +       install -d ${D}${prefix}/${EAT_TARGET_SYS}/lib/ldscripts
> > +       install -d ${D}${libexecdir}
> > +       install -d ${D}${datadir}/gdb
> > +       install -d ${D}${gcclibdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include
> > +
> > +       CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> > +
> > +       # gcc
> > +       for i in libstdc++.* libgcc_s.* libsupc++.*; do
> > +               cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/${EAT_LIBDIR}/$i ${D}${prefix}/${EAT_TARGET_SYS}/lib
> > +       done
> > +       cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/* ${D}${gcclibdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}
> > +       for i in gcov gcc* g++ cpp; do
> > +               cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/bin/${TARGET_PREFIX}$i ${D}${bindir}
> > +       done
> > +       cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/libexec/* ${D}${libexecdir}
> > +
> > +       # gdb
> > +       cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/bin/${TARGET_PREFIX}gdb* ${D}${bindir}
> > +       cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/share/gdb/* ${D}${datadir}/gdb/
> > +
> > +       # binutils
> > +       for i in ld* objcopy strip nm ranlib as ar objdump; do
> > +               cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/bin/$i ${D}${prefix}/${EAT_TARGET_SYS}/bin
> > +       done
> > +       cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/lib/ldscripts/* ${D}${prefix}/${EAT_TARGET_SYS}/lib/ldscripts
> > +       for i in ld* addr2line objcopy readelf strip nm ranlib gprof as c++filt ar strings objdump size; do
> > +               cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/bin/${TARGET_PREFIX}$i ${D}${bindir}
> > +       done
> > +}
> > +
> > +python () {
> > +    if not d.getVar("EAT_VER_MAIN", False):
> > +        raise bb.parse.SkipPackage("External ARM toolchain not configured (EAT_VER_MAIN not set).")
> > +    if d.getVar('TCLIBC', True) != "glibc":
> > +        raise bb.parse.SkipPackage("incompatible with %s" % d.getVar('TCLIBC', True))
> > +}
> > --
> > 2.7.4
> >
> > 

> 

