Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web12.1310.1592458469967238514
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Jun 2020 22:34:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=LnzbwucO;
 spf=pass (domain: linaro.org, ip: 209.85.167.66, mailfrom: sumit.garg@linaro.org)
Received: by mail-lf1-f66.google.com with SMTP id g139so1903911lfd.10
        for <meta-arm@lists.yoctoproject.org>; Wed, 17 Jun 2020 22:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vpXqmrku0Iilh7umsoLy8rTNPXAxDteO73+58FdnGIw=;
        b=LnzbwucOziUGx7WkSaYc29Mic0b6COGmkZ2mnkXXopEBTwrIBQdbcmtKBqVSnXURUe
         k2wXDinreZQbXmbK97YJKn+WlU9sAdGmr49l6zja5BkxfRgRf9Ivwz/2N0SuVzJSCJnY
         l2M85gXldpioPqPHjdiMR0yeeJXcCsFmNl6Sza3ETPfO5BytzyhyQ9HWBXKukaDu0lGq
         ogB56pL30F1R3kLXQuUcDaq1UMPc4pEKqWDk2sK6qDHLiSwhoW+5JDuZhsUCCkjLj0RQ
         0XgxevbEwGrQeLp4OHpUHYU66DdFBpjxZIA0vTAJRKz/NF0Wraq42R22uf1xZ8peWYYS
         iRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vpXqmrku0Iilh7umsoLy8rTNPXAxDteO73+58FdnGIw=;
        b=kFV//D1gc5MOQ+H/KkCZTdj4+1or+mqFH6zQlHBdC0mQ0+5RsImNm0Ffvg1NesobTw
         ix3kFaW3p+D7ZcTt9e4QRbOZ+1yyXmh1V25zroGiXYg5ZVd7tn8Zs++1t/75arNN6BbS
         7Ast+do4IKC3TaISKxFbw5sHuicJBBZBzCpJRr6WInwwCjlr8DX58WcB/ommskwhry+F
         9NBjxA+fCUBQLczO87NyrVsPsI87iaF0z2xZo8R+sm15Rgb1QlO7nGAHcHAq6MRJUVRS
         k979CDrh4d7g3byeIwLOm0zkGE4lPEJFx+XTebZavWVCZ/bhvzf5wnsn5m8SK+jpVXy9
         TEBA==
X-Gm-Message-State: AOAM532rJxhN6NztkRPfIQeqthznZIXQoR9yYAVeHyJ5mjk46xN1n1ID
	f7DFbggvcoVXQtJssOzfuKdRZCuk8amdFFbOmFU2Yg==
X-Google-Smtp-Source: ABdhPJzZ7K1z5zvoeULMz/42XkS5Oq2zINfC//eBC9OY6ZpIQ/nFLM/o5UQv7jFFPwYue4AMmEKO4w6C43V6yD+T78U=
X-Received: by 2002:ac2:4567:: with SMTP id k7mr1372380lfm.122.1592458468059;
 Wed, 17 Jun 2020 22:34:28 -0700 (PDT)
MIME-Version: 1.0
References: <1591957928-5959-1-git-send-email-sumit.garg@linaro.org>
 <1591957928-5959-4-git-send-email-sumit.garg@linaro.org> <20200617191745.GX17660@denix.org>
In-Reply-To: <20200617191745.GX17660@denix.org>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Thu, 18 Jun 2020 11:04:16 +0530
Message-ID: <CAFA6WYNud9Q=H3zrwb=7EUg-JkwUHhTzgbuOHb-kNOqa04zUeg@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] external-arm-toolchain: Align glibc packaging to OE TARGET_SYS
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, Paul Barker <pbarker@konsulko.com>, wmills@ti.com, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Jun 2020 at 00:47, Denys Dmytriyenko <denis@denix.org> wrote:
>
> Sorry, did we agree to drop this one for now?

No, I don't think so. See our last conversation on v2 [1].

I think you have already addressed alignment to EAT_TARGET_SYS for
pre-built toolchain components packaging in SDK as part of your
recipe: external-arm-sdk-toolchain.bb.

But we still need this fix for native compilation to work using native
OE compiler built from source.

[1] https://lists.yoctoproject.org/g/meta-arm/message/637

-Sumit

>
> On Fri, Jun 12, 2020 at 04:02:06PM +0530, Sumit Garg wrote:
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
> >
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
> > index 73a2cf6..4face74 100644
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
