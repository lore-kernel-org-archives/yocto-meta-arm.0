Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web12.26857.1591611005698995876
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Jun 2020 03:10:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=FIiRvi5M;
 spf=pass (domain: linaro.org, ip: 209.85.208.193, mailfrom: sumit.garg@linaro.org)
Received: by mail-lj1-f193.google.com with SMTP id z9so19685353ljh.13
        for <meta-arm@lists.yoctoproject.org>; Mon, 08 Jun 2020 03:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xYasPcdFkRfUsDGOD+1frL4817JdtvnZGu5bF8Ma78c=;
        b=FIiRvi5Mi4elzLOFYl7Q7BsvVqNG0aEDXudUU6sRLfWY1WWcDoEbSZSUVIaH3v4H58
         r7AyEadpdcR+xZNf9SZ5LNxn0WjdOLQKbJ0uSVZBHSHzMHA1+yL9iWoSS+MtqYc66zHB
         Gjg+718hojC7tZrYHn1cFccWZ3a8UqWwCB/SbANmXa71vJjrP3g8Ng1oVXb1c2O/chxb
         fAQ6EgcSQ2OPOH9mLIR/pZ7cSkFP8etIrV3crCqDc5SCOnecT6YSDFM2gz71aWztvAet
         NN2FH9Z0i2G3gqCwgooLtsE6HMziY2YIsfYwPOnvFqgRtfJZLvPnSfmo+zw4hHSYeuIS
         zU4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xYasPcdFkRfUsDGOD+1frL4817JdtvnZGu5bF8Ma78c=;
        b=DphNXgomrbCho7nMPdr4Gh5uVL1blSiXusfl2s8X/vldycsQIMUcQk9CHtmSZNUKvw
         bvudsjP8mgJEIQ+udzg86jXVJdmuhthmWjjeR0FY5sY7jy7Rz0GbJvG3thf69D8Co101
         HUffq0VEi8llecDkctpANkziNTe9bsDFzFFSPuZCOXIQDyd+a9y0Nm6D33c9BNxAF2dk
         VKSDny6uuxVmU9JuxkP+irkJ0M12NNdv8uks3EkEB1ft1/l9iRN0vz0m0l9l6hYnM2F6
         zeJCA/VzF+Xvrjvvhv+aSEqkyGUUGuVtStVVE53X4cc65Ffu8oyyH+oW1gRUWrRFBUFq
         QPcQ==
X-Gm-Message-State: AOAM531rCe5oYDpsxBjNjwzTSKR3npCbOgx45XSoXqcQ0Cv8ZB8LZXb+
	VPGs9VYZIpJHUCx/bp+h2oWmhAXx1Byy+tXloP5TAA==
X-Google-Smtp-Source: ABdhPJx4dwccsTxMU/pmfWP/zGem0OoCk2pKSHNI+WuWFvVHOSfyGEoO/qaPC16mnuczycDZ6ou61tSHjmoJOYayA3I=
X-Received: by 2002:a2e:b04c:: with SMTP id d12mr9859942ljl.256.1591611003565;
 Mon, 08 Jun 2020 03:10:03 -0700 (PDT)
MIME-Version: 1.0
References: <1591230242-20553-1-git-send-email-denis@denix.org>
 <CAFA6WYPQFSvzh9S-vF0Ap2h4fzr0dnwDr8hCDdJ7CLXo2mX4=w@mail.gmail.com> <20200604234543.GJ17660@denix.org>
In-Reply-To: <20200604234543.GJ17660@denix.org>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Mon, 8 Jun 2020 15:39:52 +0530
Message-ID: <CAFA6WYMdN3zHkJL55-si-5U93xk_bebAdR97FsAfyACNPVimtg@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] external-arm-toolchain: un-break target compilation
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, Denys Dmytriyenko <denys@ti.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Jun 2020 at 05:15, Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Thu, Jun 04, 2020 at 11:43:08AM +0530, Sumit Garg wrote:
> > On Thu, 4 Jun 2020 at 05:54, Denys Dmytriyenko <denis@denix.org> wrote:
> > >
> > > From: Denys Dmytriyenko <denys@ti.com>
> > >
> > > Compiling on the target using runtime libs from external-arm-toolchain
> > > requires libgcc.a, as libgcc_s.so explains:
> > >
> > > /* GNU ld script
> > >    Use the shared library, but some functions are only in
> > >    the static library.  */
> > > GROUP ( libgcc_s.so.1 -lgcc )
> > >
> > > Otherwise it results in errors like:
> > > | /usr/lib/gcc/arm-linux-gnueabi/9.2.1/../../../../arm-linux-gnueabi/bin/ld: cannot find -lgcc
> > > | /usr/lib/gcc/arm-linux-gnueabi/9.2.1/../../../../arm-linux-gnueabi/bin/ld: cannot find -lgcc
> > > | collect2: error: ld returned 1 exit status
> >
> > Ah I see, so libgcc.a is mandatory for aarch32 but that isn't the case
> > for aarch64 where only having a shared library seems to be sufficient.
>
> Well, I don't have all the old versions of the toolchain around to check, but
> yes, gcc9 and gcc8 both seem to be like that:
>
> arm32 - libgcc_s.so is an ld script that requires libgcc.a
> arm64 - libgcc_s.so is just a symlink to libgcc_s.so.1
>
> Not sure why arm32 requires some functions from the static lib, while arm64
> doesn't. I would assume it depends on how the toolchain was built...
>
>
> > > This already has been fixed before in this commit:
> > > https://git.linaro.org/openembedded/meta-linaro.git/commit/?id=91ea4d017bf0598e49944e76c889e66d58c066ce
> > >
> >
> > There were mainly two reasons to revert libgcc static library packaging:
> >
> > 1. It was done improperly earlier leading to following QA issues:
> >
> > ERROR: external-arm-toolchain-2019.12-r0 do_package_qa: QA Issue: non
> > -staticdev package contains static .a library: libgcc-dev path
> > '/work/aarch64-poky-linux/external-arm-toolchain/2019.12-r0/packages-split/libgcc-dev/usr/lib/aarch64-none-linux-gnu/9.2.1/libgcc_eh.a'
> > non -staticdev package contains static .a library: libgcc-dev path
> > '/work/aarch64-poky-linux/external-arm-toolchain/2019.12-r0/packages-split/libgcc-dev/usr/lib/aarch64-none-linux-gnu/9.2.1/libgcc.a'
> > [staticdev]
> > ERROR: external-arm-toolchain-2019.12-r0 do_package_qa: QA run found
> > fatal errors. Please consider fixing them.
> > ERROR: Logfile of failure stored in:
> > /home/sumit.garg/T2502/poky/build/tmp/work/aarch64-poky-linux/external-arm-toolchain/2019.12-r0/temp/log.do_package_qa.8281
> > ERROR: Task (/home/sumit.garg/T2502/poky/meta-arm/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb:do_package_qa)
> > failed with exit code '1'
>
> That's what INSANE_SKIP_libgcc-dev += "staticdev" is for - back then it wasn't
> a fatal error, hence wasn't there.
>
>
> > 2. There wasn't any motivation mentioned in your earlier commit
> > message like this commit does to include libgcc static library.
>
> Well, it may not have been 100% clear, but it did imply it was needed for
> development:
>
> * Install additional static libs, stubs and header files
> * Needed for -dev versions of libgcc, libgfortran and other packages
> ...
>
>
> > > But then it got broken/undone here w/o due review:
> > > https://git.linaro.org/openembedded/meta-linaro.git/commit/?id=b43d5f0ce431ba1e242504641266a63293ded5db
> > >
> > > Even though it's a static library, we want it to be in libgcc-dev as it's
> > > not optional, but rather required for development.
> >
> > Yeah it's required for aarch32 but optional for aarch64.
> >
> > So you could elaborate more in the commit message that this change is
> > specifically required for arm32.
>
> Were there any tests done on arm32? How about arm64?
>

I think I was pretty explicit about testing here [1]. Native
compilation wasn't in scope as the native compiler is altogether
different from pre-built toolchain (cross-compilation).

Regarding libgcc for native compilation, I did explore a bit further
and it seems that you are correct, the compiler mandates "-lgcc" to
build executable files while "-lgcc_s" can be used optionally to build
dynamic objects.

So we can go ahead with this patch itself with:

Reviewed-by: Sumit Garg <sumit.garg@linaro.org>

[1] https://lists.yoctoproject.org/g/yocto/message/48094

-Sumit

> >
> > >
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > ---
> > >  .../recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb  | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > > index 04d8923..8cfc208 100644
> > > --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > > @@ -117,7 +117,7 @@ do_install() {
> > >         sed -i -e 's#/bin/bash#/bin/sh#' ${D}${bindir}/ldd
> > >
> > >         cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/crt*.o ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
> > > -
> > > +       cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/libgcc* ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
> > >         cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/libgcov* ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
> > >         cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
> > >         cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/finclude ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
> > > @@ -310,6 +310,7 @@ INSANE_SKIP_${PN}-utils += "ldflags"
> > >  INSANE_SKIP_libstdc++ += "ldflags"
> > >  INSANE_SKIP_libgfortran += "ldflags"
> > >  INSANE_SKIP_libgcc += "ldflags dev-deps"
> > > +INSANE_SKIP_libgcc-dev += "staticdev"
> >
> > This change was missing from your earlier commit.
> >
> > -Sumit
> >
> > >  INSANE_SKIP_libgfortran += "ldflags dev-deps"
> > >  INSANE_SKIP_libstdc++ += "ldflags dev-deps"
> > >  INSANE_SKIP_libatomic += "ldflags"
> > > --
> > > 2.7.4
> > >
> > > 
> >
