Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2126.1592463793732511342
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jun 2020 00:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 05AB040B7F;
	Thu, 18 Jun 2020 07:03:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lAnaWbHvioIo; Thu, 18 Jun 2020 07:03:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1821440AD5;
	Thu, 18 Jun 2020 07:03:07 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6AEF217320A; Thu, 18 Jun 2020 03:03:06 -0400 (EDT)
Date: Thu, 18 Jun 2020 03:03:06 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Paul Barker <pbarker@konsulko.com>,
	wmills@ti.com, Richard Purdie <richard.purdie@linuxfoundation.org>,
	Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [meta-arm] [PATCH v3 3/5] external-arm-toolchain: Align glibc packaging to OE TARGET_SYS
Message-ID: <20200618070306.GC17660@denix.org>
References: <1591957928-5959-1-git-send-email-sumit.garg@linaro.org>
 <1591957928-5959-4-git-send-email-sumit.garg@linaro.org>
 <20200617191745.GX17660@denix.org>
 <CAFA6WYNud9Q=H3zrwb=7EUg-JkwUHhTzgbuOHb-kNOqa04zUeg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFA6WYNud9Q=H3zrwb=7EUg-JkwUHhTzgbuOHb-kNOqa04zUeg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 18, 2020 at 11:04:16AM +0530, Sumit Garg wrote:
> On Thu, 18 Jun 2020 at 00:47, Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > Sorry, did we agree to drop this one for now?
> 
> No, I don't think so. See our last conversation on v2 [1].
> 
> I think you have already addressed alignment to EAT_TARGET_SYS for
> pre-built toolchain components packaging in SDK as part of your
> recipe: external-arm-sdk-toolchain.bb.
> 
> But we still need this fix for native compilation to work using native
> OE compiler built from source.
> 
> [1] https://lists.yoctoproject.org/g/meta-arm/message/637

In there we talked about symlinks between OE TARGET_SYS and EAT_TARGET_SYS. 
Those symlinks will allow using OE-built compilers and prebuilt binaries 
interchangeably. But we don't yet have them in place - that's still on my 
todo list.

I have the code in meta-arago and it works for prebuilt cross compiler in SDK 
as well as OE-built native compiler on the target - I just need to get that 
upstreamed. The 4 patches I submitted only set the stage by packaging up the 
prebuilts...

And the change in this patch alone only makes OE-built compiler work while 
breaking prebuilt usage.

-- 
Denys


> -Sumit
> 
> >
> > On Fri, Jun 12, 2020 at 04:02:06PM +0530, Sumit Garg wrote:
> > > OE native and cross compilers (in case of SDK) uses OE TARGET_SYS to
> > > create standard paths to search for libraries and headers during
> > > compilation.
> > >
> > > Currently external-arm-toolchain recipe temporarily override TARGET_SYS
> > > with EAT_TARGET_SYS and packages libraries and headers corresponding to
> > > EAT_TARGET_SYS which leads to failures during native and cross compilation
> > > (in case of SDK) such as:
> > >
> > > $ $CXX -o hello++ hello.cpp
> > > In file included from hello.cpp:1:
> > > /tmp/armsdk/sysroots/armv7at2hf-neon-oe-linux-gnueabi/usr/include/c++/9.2.1/iostream:38:10: fatal error: bits/c++config.h: No such file or directory
> > >    38 | #include <bits/c++config.h>
> > >       |          ^~~~~~~~~~~~~~~~~~
> > > compilation terminated.
> > >
> > > $ $CC hello.c
> > > real-ld: cannot find crtbeginS.o: No such file or directory
> > >
> > > So remove temp override of TARGET_SYS and rather package libraries and
> > > headers corresponding to OE TARGET_SYS.
> > >
> > > This fixes changes added in commit:
> > > https://git.linaro.org/openembedded/meta-linaro.git/commit/?id=91ea4d017bf0598e49944e76c889e66d58c066ce
> > >
> > > Also, update location for unwind.h gcc-arm-common.inc accordingly.
> > >
> > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > > ---
> > >  .../external-arm-toolchain/external-arm-toolchain.bb   | 18 ++++++++++--------
> > >  .../recipes-devtools/gcc/gcc-arm-common.inc            |  2 +-
> > >  2 files changed, 11 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > > index 73a2cf6..4face74 100644
> > > --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > > @@ -54,7 +54,6 @@ PROVIDES += "\
> > >  PV = "${EAT_VER_MAIN}"
> > >
> > >  BINV = "${EAT_VER_GCC}"
> > > -TARGET_SYS = "${EAT_TARGET_SYS}"
> > >
> > >  SRC_URI = "file://SUPPORTED"
> > >
> > > @@ -75,8 +74,8 @@ do_install() {
> > >       install -d ${D}${datadir}
> > >       install -d ${D}${includedir}
> > >       install -d ${D}/include
> > > -     install -d ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}
> > > -     install -d ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}
> > > +     install -d ${D}${libdir}/${TARGET_SYS}/${EAT_VER_GCC}
> > > +     install -d ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}
> > >
> > >       CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> > >       cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/${EAT_LIBDIR}/*  ${D}${base_libdir}
> > > @@ -105,6 +104,9 @@ do_install() {
> > >       fi
> > >
> > >       cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/include/* ${D}${includedir}
> > > +     if [ -d ${D}${includedir}/c++/${EAT_VER_GCC}/${EAT_TARGET_SYS} ]; then
> > > +             mv ${D}${includedir}/c++/${EAT_VER_GCC}/${EAT_TARGET_SYS} ${D}${includedir}/c++/${EAT_VER_GCC}/${TARGET_SYS}
> > > +     fi
> > >       ln -sf ../usr/include/c++ ${D}/include/c++
> > >
> > >       cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/bin/* ${D}${bindir}
> > > @@ -116,11 +118,11 @@ do_install() {
> > >       sed -i -e 's#/bin/bash#/bin/sh#' ${D}${bindir}/tzselect
> > >       sed -i -e 's#/bin/bash#/bin/sh#' ${D}${bindir}/ldd
> > >
> > > -     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/crt*.o ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
> > > -     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/libgcc* ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
> > > -     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/libgcov* ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
> > > -     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
> > > -     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/finclude ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
> > > +     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/crt*.o ${D}${libdir}/${TARGET_SYS}/${EAT_VER_GCC}/
> > > +     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/libgcc* ${D}${libdir}/${TARGET_SYS}/${EAT_VER_GCC}/
> > > +     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/libgcov* ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/
> > > +     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/
> > > +     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/finclude ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/
> > >
> > >       # fix up the copied symlinks (they are still pointing to the multiarch directory)
> > >       linker_name="${@bb.utils.contains("TUNE_FEATURES", "aarch64", "ld-linux-aarch64.so.1", bb.utils.contains("TUNE_FEATURES", "callconvention-hard", "ld-linux-armhf.so.3", "ld-linux.so.3",d), d)}"
> > > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc
> > > index 5599743..392c57f 100644
> > > --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc
> > > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc
> > > @@ -12,7 +12,7 @@
> > >  do_install_prepend_class-target () {
> > >       if [ "${TCMODE}" = "external-arm" -a ! -f ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/include/unwind.h ]; then
> > >               install -d ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/include/
> > > -             install ${STAGING_LIBDIR}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include/unwind.h ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/include/
> > > +             install ${STAGING_LIBDIR}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/include/unwind.h ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/include/
> > >       fi
> > >  }
> > >
> > > --
> > > 2.7.4
> > >

> 

