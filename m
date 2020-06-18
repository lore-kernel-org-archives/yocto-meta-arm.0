Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web12.2864.1592467941231553200
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jun 2020 01:12:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=mNPjJRlE;
 spf=pass (domain: linaro.org, ip: 209.85.208.194, mailfrom: sumit.garg@linaro.org)
Received: by mail-lj1-f194.google.com with SMTP id c17so6093442lji.11
        for <meta-arm@lists.yoctoproject.org>; Thu, 18 Jun 2020 01:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B5auXinu9QmNBjnRL373cvGcX27Rl74YCS345wvzBa4=;
        b=mNPjJRlEzRGPN1FyrC05/ZdSxABewF8F4Ol8/jcCwAuuQZH0oHLCDDBLatj6/XZJT7
         RIDIBVl/NmAxxAtAb50KM0VvIj7m/IzlvIgXLAnIDamN4re0ZKc363Q28LTMy8uPykjL
         pxuCQPw0VyTzxhZ/JAGY4T9D/IsFUrYYmITZVvDTGfiNT0pOVFHGsyAj2/+YVtEGr4B1
         OiTS7IsL03d8TzlzIaFS7R6u9CWXqTXl0dnEmcboW95LTUWObojsiNAN8C7Yi+MPTDGP
         /5mUmZXgfKgacChkVMWugETowOWRMxmQo+6D2laddW2SDgVIHFHdObYn6XVBkZxsGuxV
         X+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B5auXinu9QmNBjnRL373cvGcX27Rl74YCS345wvzBa4=;
        b=uKQFRN2iDuYqRdP1aQJrUcoYFvekBHsGSxniY1NUFQwwZslbwE1sZX8tS8gH1zu+zO
         BOfNiEDy4r5C9EgPF3p6HTzVeKA9erS2qpGCJ54WMlMa30rTXR9DxnsrQg7hPuNprqds
         odg0uPFhyffq3WVf8xYpsu6bVCZUZU/WAsU15ttKktTrqOew+gOmJeF/jAvCDRKnVTcX
         wz3z0HO5dSF+04YppL0MuAwg67kC+LprU27PjgDgBBZ4yTHUVuDcH6GSjsrcF/pgDCLN
         iQReyrLWprtUkJ8TJv4+QMDzdWyU3m1HBAR+EZjUgOPXFkytwHMwflTZSw8vToUes8Ce
         p26w==
X-Gm-Message-State: AOAM530FIX/RNScFKeVRgLwnuKRpIBGWHUKICeojuSpGvtcwkocaQK/r
	QyWxOla6caYjuLgzGKxV5za+NiHTYBH3RMQuLidVuA==
X-Google-Smtp-Source: ABdhPJyqoJbAM16xRiReadFCARuERSZas0OPBMjRmbfvDAHI4R3d9tw3PJBw+Qr8GKLk4VdyjZh144NqaFCxlChrdMI=
X-Received: by 2002:a2e:7e08:: with SMTP id z8mr1541327ljc.339.1592467939081;
 Thu, 18 Jun 2020 01:12:19 -0700 (PDT)
MIME-Version: 1.0
References: <1591957928-5959-1-git-send-email-sumit.garg@linaro.org>
 <1591957928-5959-4-git-send-email-sumit.garg@linaro.org> <20200617191745.GX17660@denix.org>
 <CAFA6WYNud9Q=H3zrwb=7EUg-JkwUHhTzgbuOHb-kNOqa04zUeg@mail.gmail.com> <20200618070306.GC17660@denix.org>
In-Reply-To: <20200618070306.GC17660@denix.org>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Thu, 18 Jun 2020 13:42:06 +0530
Message-ID: <CAFA6WYOyfW1qH11GigPX1F8Q-L_mxR1OZWa6R6qt3PxPMU4+qQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH v3 3/5] external-arm-toolchain: Align glibc packaging to OE TARGET_SYS
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, Paul Barker <pbarker@konsulko.com>, wmills@ti.com, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Jun 2020 at 12:33, Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Thu, Jun 18, 2020 at 11:04:16AM +0530, Sumit Garg wrote:
> > On Thu, 18 Jun 2020 at 00:47, Denys Dmytriyenko <denis@denix.org> wrote:
> > >
> > > Sorry, did we agree to drop this one for now?
> >
> > No, I don't think so. See our last conversation on v2 [1].
> >
> > I think you have already addressed alignment to EAT_TARGET_SYS for
> > pre-built toolchain components packaging in SDK as part of your
> > recipe: external-arm-sdk-toolchain.bb.
> >
> > But we still need this fix for native compilation to work using native
> > OE compiler built from source.
> >
> > [1] https://lists.yoctoproject.org/g/meta-arm/message/637
>
> In there we talked about symlinks between OE TARGET_SYS and EAT_TARGET_SYS.
> Those symlinks will allow using OE-built compilers and prebuilt binaries
> interchangeably. But we don't yet have them in place - that's still on my
> todo list.

Didn't I offer to add that feature in this patch itself to support
your downstream use-cases? But you were reluctant to add those by
yourself.

>
> I have the code in meta-arago and it works for prebuilt cross compiler in SDK
> as well as OE-built native compiler on the target - I just need to get that
> upstreamed. The 4 patches I submitted only set the stage by packaging up the
> prebuilts...
>
> And the change in this patch alone only makes OE-built compiler work while
> breaking prebuilt usage.

The change in this patch is fixing the current broken OE native
compilation and SDK generation (using OE built compiler) upstream.

And it's just a simple change to add symlinks to support
EAT_TARGET_SYS which can be an add-on patch which *you* contribute.

-Sumit

>
> --
> Denys
>
>
> > -Sumit
> >
> > >
> > > On Fri, Jun 12, 2020 at 04:02:06PM +0530, Sumit Garg wrote:
> > > > OE native and cross compilers (in case of SDK) uses OE TARGET_SYS to
> > > > create standard paths to search for libraries and headers during
> > > > compilation.
> > > >
> > > > Currently external-arm-toolchain recipe temporarily override TARGET_SYS
> > > > with EAT_TARGET_SYS and packages libraries and headers corresponding to
> > > > EAT_TARGET_SYS which leads to failures during native and cross compilation
> > > > (in case of SDK) such as:
> > > >
> > > > $ $CXX -o hello++ hello.cpp
> > > > In file included from hello.cpp:1:
> > > > /tmp/armsdk/sysroots/armv7at2hf-neon-oe-linux-gnueabi/usr/include/c++/9.2.1/iostream:38:10: fatal error: bits/c++config.h: No such file or directory
> > > >    38 | #include <bits/c++config.h>
> > > >       |          ^~~~~~~~~~~~~~~~~~
> > > > compilation terminated.
> > > >
> > > > $ $CC hello.c
> > > > real-ld: cannot find crtbeginS.o: No such file or directory
> > > >
> > > > So remove temp override of TARGET_SYS and rather package libraries and
> > > > headers corresponding to OE TARGET_SYS.
> > > >
> > > > This fixes changes added in commit:
> > > > https://git.linaro.org/openembedded/meta-linaro.git/commit/?id=91ea4d017bf0598e49944e76c889e66d58c066ce
> > > >
> > > > Also, update location for unwind.h gcc-arm-common.inc accordingly.
> > > >
> > > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > > > ---
> > > >  .../external-arm-toolchain/external-arm-toolchain.bb   | 18 ++++++++++--------
> > > >  .../recipes-devtools/gcc/gcc-arm-common.inc            |  2 +-
> > > >  2 files changed, 11 insertions(+), 9 deletions(-)
> > > >
> > > > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > > > index 73a2cf6..4face74 100644
> > > > --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > > > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > > > @@ -54,7 +54,6 @@ PROVIDES += "\
> > > >  PV = "${EAT_VER_MAIN}"
> > > >
> > > >  BINV = "${EAT_VER_GCC}"
> > > > -TARGET_SYS = "${EAT_TARGET_SYS}"
> > > >
> > > >  SRC_URI = "file://SUPPORTED"
> > > >
> > > > @@ -75,8 +74,8 @@ do_install() {
> > > >       install -d ${D}${datadir}
> > > >       install -d ${D}${includedir}
> > > >       install -d ${D}/include
> > > > -     install -d ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}
> > > > -     install -d ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}
> > > > +     install -d ${D}${libdir}/${TARGET_SYS}/${EAT_VER_GCC}
> > > > +     install -d ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}
> > > >
> > > >       CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> > > >       cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/${EAT_LIBDIR}/*  ${D}${base_libdir}
> > > > @@ -105,6 +104,9 @@ do_install() {
> > > >       fi
> > > >
> > > >       cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/include/* ${D}${includedir}
> > > > +     if [ -d ${D}${includedir}/c++/${EAT_VER_GCC}/${EAT_TARGET_SYS} ]; then
> > > > +             mv ${D}${includedir}/c++/${EAT_VER_GCC}/${EAT_TARGET_SYS} ${D}${includedir}/c++/${EAT_VER_GCC}/${TARGET_SYS}
> > > > +     fi
> > > >       ln -sf ../usr/include/c++ ${D}/include/c++
> > > >
> > > >       cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/bin/* ${D}${bindir}
> > > > @@ -116,11 +118,11 @@ do_install() {
> > > >       sed -i -e 's#/bin/bash#/bin/sh#' ${D}${bindir}/tzselect
> > > >       sed -i -e 's#/bin/bash#/bin/sh#' ${D}${bindir}/ldd
> > > >
> > > > -     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/crt*.o ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
> > > > -     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/libgcc* ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
> > > > -     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/libgcov* ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
> > > > -     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
> > > > -     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/finclude ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
> > > > +     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/crt*.o ${D}${libdir}/${TARGET_SYS}/${EAT_VER_GCC}/
> > > > +     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/libgcc* ${D}${libdir}/${TARGET_SYS}/${EAT_VER_GCC}/
> > > > +     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/libgcov* ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/
> > > > +     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/
> > > > +     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/finclude ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/
> > > >
> > > >       # fix up the copied symlinks (they are still pointing to the multiarch directory)
> > > >       linker_name="${@bb.utils.contains("TUNE_FEATURES", "aarch64", "ld-linux-aarch64.so.1", bb.utils.contains("TUNE_FEATURES", "callconvention-hard", "ld-linux-armhf.so.3", "ld-linux.so.3",d), d)}"
> > > > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc
> > > > index 5599743..392c57f 100644
> > > > --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc
> > > > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc
> > > > @@ -12,7 +12,7 @@
> > > >  do_install_prepend_class-target () {
> > > >       if [ "${TCMODE}" = "external-arm" -a ! -f ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/include/unwind.h ]; then
> > > >               install -d ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/include/
> > > > -             install ${STAGING_LIBDIR}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include/unwind.h ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/include/
> > > > +             install ${STAGING_LIBDIR}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/include/unwind.h ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/include/
> > > >       fi
> > > >  }
> > > >
> > > > --
> > > > 2.7.4
> > > >
>
> > 
>
