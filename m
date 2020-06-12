Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web11.14079.1591940033890868178
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Jun 2020 22:33:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=rs3PFrKr;
 spf=pass (domain: linaro.org, ip: 209.85.208.194, mailfrom: sumit.garg@linaro.org)
Received: by mail-lj1-f194.google.com with SMTP id 9so9655078ljv.5
        for <meta-arm@lists.yoctoproject.org>; Thu, 11 Jun 2020 22:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gn16ViOSNpzrF2ZN5XCko+YWGIe3D+HdRDJKckiL3Us=;
        b=rs3PFrKrNcfzEJLYVpbsuFEf9VYgbt6xeX+drCNj20/D50rXvL27DKMphAVboRTLvK
         J8SsJSiTwBtyeTD6cRVqTajbI5AVp5hYb04TV9cGN+ER1pNaqQtO2PPXJ+mijInHAWe4
         EXYxFlOOzOW6D/0Xtl2uHtGtq6kXOFDgSNPPLFNKNzkVHZqEmeu7hMFmSnsngIbeV8Gt
         YUEhXiUR++nUnrKmnkVwQNY206tBoHjkDT9wcY/T+30Qpufc4qlpezAbWwzvC7GelF3/
         GR50ZG4hDzX/QH57rUQ0Q5RwqEkYficiRu50v1B5RlkVQTcbcNS/086WbRbD4DHhYxw5
         vEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gn16ViOSNpzrF2ZN5XCko+YWGIe3D+HdRDJKckiL3Us=;
        b=Wjc9ZAnHW1KiBmUkPitVeS9fKPkcHfS2Ox39phFQo870gSp4yR1rlSuYR/eTkh1ReL
         7SL7araBH5SOSuhes1eKjwtiM3/jtaKi6VYig8hwoEd9x8/8bBc3gtupEGj2qlV97xxU
         NUOqE5YF53laRbTw+uZNhJi1KysHuz2sDjfTh04jElbGpd1ggdkAMV+wCSrSj+8c/pKH
         /drYvAMGPcUTNYYq3xG6/ixgT82hEUIfKEbPIIC4PDHjWwQUNLXc6e51JPv/uT3J0En0
         IfxX6XGSWMRWopkB3uZKvSbWA6klSX9PcPs34AT3hyatIt66+9t12wJiWwRsZYGCIxmA
         hMew==
X-Gm-Message-State: AOAM532FWXSIs8//gj+AfmuIP52gF6NP35I+0MCxOD5zfK1UNxIOVmPH
	eFJxNj3hCt8MeSe5/ystStthiq0U5aVs/8qXWBGt9A==
X-Google-Smtp-Source: ABdhPJzH5hcZ7BNEgIvMaSiTkPNGCNi9U2HQ/xk2b7AbiZgTF739clUv2ojjBCqYDBXmK7pWFdmExpUVheKrE3Pi5r4=
X-Received: by 2002:a2e:7e08:: with SMTP id z8mr5477609ljc.339.1591940031793;
 Thu, 11 Jun 2020 22:33:51 -0700 (PDT)
MIME-Version: 1.0
References: <1591796582-5015-1-git-send-email-sumit.garg@linaro.org>
 <1591796582-5015-4-git-send-email-sumit.garg@linaro.org> <20200612021536.GF17660@denix.org>
In-Reply-To: <20200612021536.GF17660@denix.org>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Fri, 12 Jun 2020 11:03:39 +0530
Message-ID: <CAFA6WYOYY_Cd9hQ5FRiqm5HAJmF2dMXiSL8Zoprhqk6YDnMuSg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] external-arm-toolchain: Align glibc packaging to OE TARGET_SYS
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, Paul Barker <pbarker@konsulko.com>, wmills@ti.com, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Jun 2020 at 07:45, Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Wed, Jun 10, 2020 at 07:13:00PM +0530, Sumit Garg wrote:
> > OE native and cross compilers (in case of SDK) uses OE TARGET_SYS to
> > create standard paths to search for libraries and headers during
> > compilation.
> >
> > Currently external-arm-toolchain recipe temporarily override TARGET_SYS
> > with EAT_TARGET_SYS and packages libraries and headers corresponding to
> > EAT_TARGET_SYS which leads to failures during native and cross compilation
> > (in case of SDK) such as:
> >
> > $ $CXX -o hello++ hello.cpp
> > In file included from hello.cpp:1:
> > /tmp/armsdk/sysroots/armv7at2hf-neon-oe-linux-gnueabi/usr/include/c++/9.2.1/iostream:38:10: fatal error: bits/c++config.h: No such file or directory
> >    38 | #include <bits/c++config.h>
> >       |          ^~~~~~~~~~~~~~~~~~
> > compilation terminated.
> >
> > $ $CC hello.c
> > real-ld: cannot find crtbeginS.o: No such file or directory
> >
> > So remove temp override of TARGET_SYS and rather package libraries and
> > headers corresponding to OE TARGET_SYS.
>
> Yeah, I tried this before some time ago... It didn't work for me for all the
> use cases. It works for you for SDK because you build an OE compiler from
> sources for that case. If you try to use EAT (external ARM toolchain) with OE
> SDK, it would fail.

Agree, I guess this is one of your downstream use-case which is
something we would like to be supported in upstream as well in future.

>
> TARGET_SYS != EAT_TARGET_SYS is indeed inconvenient, but has been there for
> long time. There are other assumptions and limitations in some places of OE
> and those are not restricted to external-arm-toolchain, e.g. you can see
> similar workarounds for musl toolchain:
>
> /usr/lib:
> arm-oe-linux-musleabi/
> arm-oe-linux-gnueabi -> arm-oe-linux-musleabi
> arm-oe-linux-musleabihf -> arm-oe-linux-musleabi
>
> Similar to that, I've been fixing it in many places like:
>
> /usr/lib:
> arm-linux-gnueabihf/
> arm-linux-gnueabi -> arm-linux-gnueabihf
>
> /usr/include/c++/<version>/:
> arm-linux-gnueabihf/
> arm-linux-gnueabi -> arm-linux-gnueabihf
>
> BTW, arm-linux-gnueabihf is EAT gcc8, EAT gcc9 uses arm-none-linux-gnueabihf:
>
> /usr/lib:
> arm-none-linux-gnueabihf/
> arm-linux-gnueabi -> arm-none-linux-gnueabihf
>
> So, using such symlinks allows both OE compiler and EAT cross-compiler to find
> runtime libraries and headers correctly, both on-target and in SDK sysroot.

Makes sense, will add symlinks for EAT_TARGET_SYS in order to continue
supporting your downstream use-cases.

>
> So, in general, I would welcome this simplification if TARGET_SYS was the same
> as EAT_TARGET_SYS, but I don't believe it's that easy to pull it off...

Yeah, this is the first thing I did to override TARGET_SYS with
EAT_TARGET_SYS but it led to OE recipes to fail.

-Sumit

>
> --
> Denys
>
>
> > This fixes changes added in commit:
> > https://git.linaro.org/openembedded/meta-linaro.git/commit/?id=91ea4d017bf0598e49944e76c889e66d58c066ce
> >
> > Also, update location for unwind.h gcc-arm-common.inc accordingly.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  .../external-arm-toolchain/external-arm-toolchain.bb   | 18 ++++++++++--------
> >  .../recipes-devtools/gcc/gcc-arm-common.inc            |  2 +-
> >  2 files changed, 11 insertions(+), 9 deletions(-)
> >
> > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > index 5d9a0a8..7c7c607 100644
> > --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > @@ -54,7 +54,6 @@ PROVIDES += "\
> >  PV = "${EAT_VER_MAIN}"
> >
> >  BINV = "${EAT_VER_GCC}"
> > -TARGET_SYS = "${EAT_TARGET_SYS}"
> >
> >  SRC_URI = "file://SUPPORTED"
> >
> > @@ -75,8 +74,8 @@ do_install() {
> >       install -d ${D}${datadir}
> >       install -d ${D}${includedir}
> >       install -d ${D}/include
> > -     install -d ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}
> > -     install -d ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}
> > +     install -d ${D}${libdir}/${TARGET_SYS}/${EAT_VER_GCC}
> > +     install -d ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}
> >
> >       CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> >       cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/${EAT_LIBDIR}/*  ${D}${base_libdir}
> > @@ -105,6 +104,9 @@ do_install() {
> >       fi
> >
> >       cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/include/* ${D}${includedir}
> > +     if [ -d ${D}${includedir}/c++/${EAT_VER_GCC}/${EAT_TARGET_SYS} ]; then
> > +             mv ${D}${includedir}/c++/${EAT_VER_GCC}/${EAT_TARGET_SYS} ${D}${includedir}/c++/${EAT_VER_GCC}/${TARGET_SYS}
> > +     fi
> >       ln -sf ../usr/include/c++ ${D}/include/c++
> >
> >       cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/bin/* ${D}${bindir}
> > @@ -116,11 +118,11 @@ do_install() {
> >       sed -i -e 's#/bin/bash#/bin/sh#' ${D}${bindir}/tzselect
> >       sed -i -e 's#/bin/bash#/bin/sh#' ${D}${bindir}/ldd
> >
> > -     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/crt*.o ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
> > -     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/libgcc* ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
> > -     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/libgcov* ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
> > -     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
> > -     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/finclude ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
> > +     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/crt*.o ${D}${libdir}/${TARGET_SYS}/${EAT_VER_GCC}/
> > +     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/libgcc* ${D}${libdir}/${TARGET_SYS}/${EAT_VER_GCC}/
> > +     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/libgcov* ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/
> > +     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/
> > +     cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/finclude ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/
> >
> >       # fix up the copied symlinks (they are still pointing to the multiarch directory)
> >       linker_name="${@bb.utils.contains("TUNE_FEATURES", "aarch64", "ld-linux-aarch64.so.1", bb.utils.contains("TUNE_FEATURES", "callconvention-hard", "ld-linux-armhf.so.3", "ld-linux.so.3",d), d)}"
> > diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc
> > index 5599743..392c57f 100644
> > --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc
> > +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc
> > @@ -12,7 +12,7 @@
> >  do_install_prepend_class-target () {
> >       if [ "${TCMODE}" = "external-arm" -a ! -f ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/include/unwind.h ]; then
> >               install -d ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/include/
> > -             install ${STAGING_LIBDIR}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include/unwind.h ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/include/
> > +             install ${STAGING_LIBDIR}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/include/unwind.h ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/include/
> >       fi
> >  }
> >
> > --
> > 2.7.4
> >
