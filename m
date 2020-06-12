Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web11.15038.1591945986196643659
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Jun 2020 00:13:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=XY8M3dvB;
 spf=pass (domain: linaro.org, ip: 209.85.167.66, mailfrom: sumit.garg@linaro.org)
Received: by mail-lf1-f66.google.com with SMTP id 82so4927205lfh.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 12 Jun 2020 00:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AvmZurHJwBP+CJQUjXvvNe0gZ5rscSyHt3PQwD2JkYk=;
        b=XY8M3dvBPzl54Fs9yRb9vP2ENBQgjaQqjdv4hLyXc/IiErVa/9dVGRlrVyWjgYoAdS
         bhsWRm0lvZsZcZBGU3zq56XUdACzrHwRAX53X9rFm85nyhuPvZ5+MWnrbdNvg6VFXSni
         FMgYpQjbIBof7Qu2+u3Kpy/IqNxEoQiynMx7CLJ4zEwz+haH57vhO6RM7ZiOjY/kAcC1
         ITnzZRVc6q4Y3OTPRiTqkSvV4gvtXQRDbgZbxResNLyvWsV9tomSqe9cSgEilFIQgFDl
         QYjwL32uIBYhR1+6SfuW3YrdZVEOzh4JtaI7HkEwEPUcWNsApqDXbqnJ6Mc0TeWf4RWo
         UkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AvmZurHJwBP+CJQUjXvvNe0gZ5rscSyHt3PQwD2JkYk=;
        b=KAQv14aMGy+hwr2WwQwSe/HXmTBBCJBSHtIxRQiCVq/zE7P6KWcq812jt7HY3eU8PH
         AS5HOQCIoxzBtyvBGHTIgV0xG/iGTmch+hbkobPR07Z+z5JB5wG5FVstvRLgRSIZCbs9
         3Ij7KuU9A7XnK/gL+74+9ltWv/oFwqyzpoJhQSwZJq+hdfqC/zp+55ybcU7pFVooNq/w
         UZHqL7cnfXzHe990D7mBz/s591gnZ0kJ/tivTNqVtT1F9jfe/nIm0xPcLBKgaBzuGugh
         q7SQuNSljUuRdSZbss+gIg8rN7ye5m3IjSbQYv3/RFsLPZCoduQqBgxS8WZVe2iYefNY
         b8Xg==
X-Gm-Message-State: AOAM533pzWfF3EYOCyCScqeRRI3vlojnwWZuaCFiuqdesA+dDGmR3Shc
	GVOULYLI1vO+ZLRwuJYvrHHmx8hTt0q1gPXJprO2hw==
X-Google-Smtp-Source: ABdhPJz9EHrNTQ94ZHzmlaEs/hfdI8AKUNYKI3vDgbkR09V+9rOFY1UMn1xT/T76vJsiVmPLdZKKt8+vT581Hlt1Uds=
X-Received: by 2002:ac2:44bb:: with SMTP id c27mr6339098lfm.59.1591945984159;
 Fri, 12 Jun 2020 00:13:04 -0700 (PDT)
MIME-Version: 1.0
References: <1591796582-5015-1-git-send-email-sumit.garg@linaro.org>
 <1591796582-5015-4-git-send-email-sumit.garg@linaro.org> <20200612021536.GF17660@denix.org>
 <CAFA6WYOYY_Cd9hQ5FRiqm5HAJmF2dMXiSL8Zoprhqk6YDnMuSg@mail.gmail.com> <20200612061627.GN17660@denix.org>
In-Reply-To: <20200612061627.GN17660@denix.org>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Fri, 12 Jun 2020 12:42:52 +0530
Message-ID: <CAFA6WYOcO_bjp4XOTz1O3ObURnAPmR_6voOgQXqsfwMyFWHoHg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] external-arm-toolchain: Align glibc packaging to OE TARGET_SYS
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, Paul Barker <pbarker@konsulko.com>, wmills@ti.com, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Jun 2020 at 11:46, Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Fri, Jun 12, 2020 at 11:03:39AM +0530, Sumit Garg wrote:
> > On Fri, 12 Jun 2020 at 07:45, Denys Dmytriyenko <denis@denix.org> wrote:
> > >
> > > On Wed, Jun 10, 2020 at 07:13:00PM +0530, Sumit Garg wrote:
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
> > >
> > > Yeah, I tried this before some time ago... It didn't work for me for all the
> > > use cases. It works for you for SDK because you build an OE compiler from
> > > sources for that case. If you try to use EAT (external ARM toolchain) with OE
> > > SDK, it would fail.
> >
> > Agree, I guess this is one of your downstream use-case which is
> > something we would like to be supported in upstream as well in future.
> >
> > >
> > > TARGET_SYS != EAT_TARGET_SYS is indeed inconvenient, but has been there for
> > > long time. There are other assumptions and limitations in some places of OE
> > > and those are not restricted to external-arm-toolchain, e.g. you can see
> > > similar workarounds for musl toolchain:
> > >
> > > /usr/lib:
> > > arm-oe-linux-musleabi/
> > > arm-oe-linux-gnueabi -> arm-oe-linux-musleabi
> > > arm-oe-linux-musleabihf -> arm-oe-linux-musleabi
> > >
> > > Similar to that, I've been fixing it in many places like:
> > >
> > > /usr/lib:
> > > arm-linux-gnueabihf/
> > > arm-linux-gnueabi -> arm-linux-gnueabihf
> > >
> > > /usr/include/c++/<version>/:
> > > arm-linux-gnueabihf/
> > > arm-linux-gnueabi -> arm-linux-gnueabihf
> > >
> > > BTW, arm-linux-gnueabihf is EAT gcc8, EAT gcc9 uses arm-none-linux-gnueabihf:
> > >
> > > /usr/lib:
> > > arm-none-linux-gnueabihf/
> > > arm-linux-gnueabi -> arm-none-linux-gnueabihf
> > >
> > > So, using such symlinks allows both OE compiler and EAT cross-compiler to find
> > > runtime libraries and headers correctly, both on-target and in SDK sysroot.
> >
> > Makes sense, will add symlinks for EAT_TARGET_SYS in order to continue
> > supporting your downstream use-cases.
>
> You don't have to do everything by yourself - I'm more than happy to
> contribute! Let me dust off some of my code... :)

Sure, I would be happy for you to contribute this change. So is it
fine that we go ahead with this patch-set with you contributing
additional patch based on this patch-set?

-Sumit

>
>
> > > So, in general, I would welcome this simplification if TARGET_SYS was the same
> > > as EAT_TARGET_SYS, but I don't believe it's that easy to pull it off...
> >
> > Yeah, this is the first thing I did to override TARGET_SYS with
> > EAT_TARGET_SYS but it led to OE recipes to fail.
> >
> > -Sumit
> >
> > >
> > > --
> > > Denys
> > >
> > >
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
> > > > index 5d9a0a8..7c7c607 100644
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
> >
