Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.33022.1591631267626305447
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Jun 2020 08:47:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=DQb4dtmc;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f195.google.com with SMTP id c12so17649833qkk.13
        for <meta-arm@lists.yoctoproject.org>; Mon, 08 Jun 2020 08:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3dNRLsl9MJPOXMjM3ezC6eO28jb3D93ZB/iiwQ1IkFQ=;
        b=DQb4dtmcxIvNnYvRxbVSkZySlAg91aIzma59WQq/AnCRes2nhdv7GblH4LmIelSjnA
         xnxY79ZdjbewrpX41gHU/RGJVmXjFqG1Kj7lfpH+ukaROyULsSCYcpBZD4MpLbFghKbP
         FL34dGk/GcTAt1GTvGwKllvajWiDplCmcV4zgLQx/8MFxtu/OhR5u0+c0apQhawCG7Ju
         UjQZqSmJAMJO+3UMKA9LBXOGaqUWcASpiv4JHCiVmYbci9kGZfPNndWCipMPJArpsVo0
         p3uUmQ7u8+N2SYWhY1DIM2OFUYB5TVmoJl3VucDhaj7GtaQ9FmsTIaOtPwQ18skk87gz
         v/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3dNRLsl9MJPOXMjM3ezC6eO28jb3D93ZB/iiwQ1IkFQ=;
        b=rJ1WInuYZVSnjNMgMlxgeSJmxCnotn+JAxNBFm9IwTCgfcR9YR2Zb6Z0Qj0T9eaug6
         JByn4Ww3f6+r0qG2x+ZtIj/3JlVUpxuo/LRYF4OwsnjJgkLfgHCibfOudGp7Pc9ODd3m
         9wzP05pi6Sl5UurndZnBfgS+PcKKiIFIDvkof673Uhyjvipm1MPANwgeUq1/EEYsCDgD
         eOztJu9jehBhTXko5iT4OiCGTboEiM6TI9q6leXLgguxJF4OGlI9HSBHHPi+yn+zn2hT
         ETF59EEBvfGwo6wm7Qy6n3H9krJ3BcJxbYD1hdJ5suG1iiA6m/pxEPsRKAXGk/RLIN5d
         Y/DQ==
X-Gm-Message-State: AOAM530SR6nu50i6yZO0tOcsfiCcMCmszVvnk+Q2jPkiUrY+rSQ3pC3H
	mIN7UF3wT0G2mu3v14G4lgztTQ==
X-Google-Smtp-Source: ABdhPJwL9zCH4CealM847OEovFB4fD2cZoPEKupFnxXdBv0+sTep2JQTXhmvSEnI3WkMsEEt5MptsA==
X-Received: by 2002:a05:620a:1f7:: with SMTP id x23mr22223572qkn.270.1591631266707;
        Mon, 08 Jun 2020 08:47:46 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:b9b3:35e6:b1bd:2c87])
        by smtp.gmail.com with ESMTPSA id w10sm8038069qtc.15.2020.06.08.08.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 08:47:46 -0700 (PDT)
Date: Mon, 8 Jun 2020 11:47:44 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: Denys Dmytriyenko <denis@denix.org>, meta-arm@lists.yoctoproject.org,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-arm] [PATCH] external-arm-toolchain: un-break target compilation
Message-ID: <20200608154744.GC15959@kudzu.us>
References: <1591230242-20553-1-git-send-email-denis@denix.org>
 <CAFA6WYPQFSvzh9S-vF0Ap2h4fzr0dnwDr8hCDdJ7CLXo2mX4=w@mail.gmail.com>
 <20200604234543.GJ17660@denix.org>
 <CAFA6WYMdN3zHkJL55-si-5U93xk_bebAdR97FsAfyACNPVimtg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFA6WYMdN3zHkJL55-si-5U93xk_bebAdR97FsAfyACNPVimtg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 08, 2020 at 03:39:52PM +0530, Sumit Garg wrote:
> On Fri, 5 Jun 2020 at 05:15, Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > On Thu, Jun 04, 2020 at 11:43:08AM +0530, Sumit Garg wrote:
> > > On Thu, 4 Jun 2020 at 05:54, Denys Dmytriyenko <denis@denix.org> wrote:
> > > >
> > > > From: Denys Dmytriyenko <denys@ti.com>
> > > >
> > > > Compiling on the target using runtime libs from external-arm-toolchain
> > > > requires libgcc.a, as libgcc_s.so explains:
> > > >
> > > > /* GNU ld script
> > > >    Use the shared library, but some functions are only in
> > > >    the static library.  */
> > > > GROUP ( libgcc_s.so.1 -lgcc )
> > > >
> > > > Otherwise it results in errors like:
> > > > | /usr/lib/gcc/arm-linux-gnueabi/9.2.1/../../../../arm-linux-gnueabi/bin/ld: cannot find -lgcc
> > > > | /usr/lib/gcc/arm-linux-gnueabi/9.2.1/../../../../arm-linux-gnueabi/bin/ld: cannot find -lgcc
> > > > | collect2: error: ld returned 1 exit status
> > >
> > > Ah I see, so libgcc.a is mandatory for aarch32 but that isn't the case
> > > for aarch64 where only having a shared library seems to be sufficient.
> >
> > Well, I don't have all the old versions of the toolchain around to check, but
> > yes, gcc9 and gcc8 both seem to be like that:
> >
> > arm32 - libgcc_s.so is an ld script that requires libgcc.a
> > arm64 - libgcc_s.so is just a symlink to libgcc_s.so.1
> >
> > Not sure why arm32 requires some functions from the static lib, while arm64
> > doesn't. I would assume it depends on how the toolchain was built...
> >
> >
> > > > This already has been fixed before in this commit:
> > > > https://git.linaro.org/openembedded/meta-linaro.git/commit/?id=91ea4d017bf0598e49944e76c889e66d58c066ce
> > > >
> > >
> > > There were mainly two reasons to revert libgcc static library packaging:
> > >
> > > 1. It was done improperly earlier leading to following QA issues:
> > >
> > > ERROR: external-arm-toolchain-2019.12-r0 do_package_qa: QA Issue: non
> > > -staticdev package contains static .a library: libgcc-dev path
> > > '/work/aarch64-poky-linux/external-arm-toolchain/2019.12-r0/packages-split/libgcc-dev/usr/lib/aarch64-none-linux-gnu/9.2.1/libgcc_eh.a'
> > > non -staticdev package contains static .a library: libgcc-dev path
> > > '/work/aarch64-poky-linux/external-arm-toolchain/2019.12-r0/packages-split/libgcc-dev/usr/lib/aarch64-none-linux-gnu/9.2.1/libgcc.a'
> > > [staticdev]
> > > ERROR: external-arm-toolchain-2019.12-r0 do_package_qa: QA run found
> > > fatal errors. Please consider fixing them.
> > > ERROR: Logfile of failure stored in:
> > > /home/sumit.garg/T2502/poky/build/tmp/work/aarch64-poky-linux/external-arm-toolchain/2019.12-r0/temp/log.do_package_qa.8281
> > > ERROR: Task (/home/sumit.garg/T2502/poky/meta-arm/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb:do_package_qa)
> > > failed with exit code '1'
> >
> > That's what INSANE_SKIP_libgcc-dev += "staticdev" is for - back then it wasn't
> > a fatal error, hence wasn't there.
> >
> >
> > > 2. There wasn't any motivation mentioned in your earlier commit
> > > message like this commit does to include libgcc static library.
> >
> > Well, it may not have been 100% clear, but it did imply it was needed for
> > development:
> >
> > * Install additional static libs, stubs and header files
> > * Needed for -dev versions of libgcc, libgfortran and other packages
> > ...
> >
> >
> > > > But then it got broken/undone here w/o due review:
> > > > https://git.linaro.org/openembedded/meta-linaro.git/commit/?id=b43d5f0ce431ba1e242504641266a63293ded5db
> > > >
> > > > Even though it's a static library, we want it to be in libgcc-dev as it's
> > > > not optional, but rather required for development.
> > >
> > > Yeah it's required for aarch32 but optional for aarch64.
> > >
> > > So you could elaborate more in the commit message that this change is
> > > specifically required for arm32.
> >
> > Were there any tests done on arm32? How about arm64?
> >
> 
> I think I was pretty explicit about testing here [1]. Native
> compilation wasn't in scope as the native compiler is altogether
> different from pre-built toolchain (cross-compilation).
> 
> Regarding libgcc for native compilation, I did explore a bit further
> and it seems that you are correct, the compiler mandates "-lgcc" to
> build executable files while "-lgcc_s" can be used optionally to build
> dynamic objects.
> 
> So we can go ahead with this patch itself with:
> 
> Reviewed-by: Sumit Garg <sumit.garg@linaro.org>

Pulled into master.

Thanks,
Jon

> 
> [1] https://lists.yoctoproject.org/g/yocto/message/48094
> 
> -Sumit
> 
> > >
> > > >
> > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > ---
> > > >  .../recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb  | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > > > index 04d8923..8cfc208 100644
> > > > --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > > > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > > > @@ -117,7 +117,7 @@ do_install() {
> > > >         sed -i -e 's#/bin/bash#/bin/sh#' ${D}${bindir}/ldd
> > > >
> > > >         cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/crt*.o ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
> > > > -
> > > > +       cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/libgcc* ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
> > > >         cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/libgcov* ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
> > > >         cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
> > > >         cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/finclude ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
> > > > @@ -310,6 +310,7 @@ INSANE_SKIP_${PN}-utils += "ldflags"
> > > >  INSANE_SKIP_libstdc++ += "ldflags"
> > > >  INSANE_SKIP_libgfortran += "ldflags"
> > > >  INSANE_SKIP_libgcc += "ldflags dev-deps"
> > > > +INSANE_SKIP_libgcc-dev += "staticdev"
> > >
> > > This change was missing from your earlier commit.
> > >
> > > -Sumit
> > >
> > > >  INSANE_SKIP_libgfortran += "ldflags dev-deps"
> > > >  INSANE_SKIP_libstdc++ += "ldflags dev-deps"
> > > >  INSANE_SKIP_libatomic += "ldflags"
> > > > --
> > > > 2.7.4
> > > >
> > > > 
> > >

> 

