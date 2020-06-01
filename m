Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web10.1601.1591054528407501548
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 01 Jun 2020 16:35:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=hIXP/fN6;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.65, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f65.google.com with SMTP id p15so908029qvr.9
        for <meta-arm@lists.yoctoproject.org>; Mon, 01 Jun 2020 16:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Qy4is22IBnFDCfXx1I/C/p3iIh6ogCcfxXdklfVEZpY=;
        b=hIXP/fN67ExoAuUGSQAFrfzzAq4YNRqoLvoQT6JlVZ3mbTfRgV37KwQKTB2GJtFxDK
         kld1I75nUVyA7/P8q5+GYZt1OWcLbQPHkzuqqu7gYOWb0j58lo+npILXPoVGGgENope5
         XHRfaGYXTlqVkZYcWy5bEFycTYDE6mN9EIEAoNVhctESYtskpcZMk6BfmeJf6je0ijOO
         yifZKOD8256cUSnQxhSwIw0DwqWil30hHwRyNtQ6Z9p1e1Mw0SJ8tEAjyGdG/w2AjgSI
         9a0ECsmT3JSdmGGN8Y3wynWh6yrLjn5mn7aMlsFMj3QSBTyHxylrz13W/fiImimfd7Po
         7KpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Qy4is22IBnFDCfXx1I/C/p3iIh6ogCcfxXdklfVEZpY=;
        b=iNZBvaU8nV2ZCMLlcZuxCMQOiYkyGd8ErJsu5h41mePUXRTIoBiJ+xg83pRt/1vHum
         x9Njf9mOho+2iCiGm29y2mAp2eKh5nMz/IYoFKegL6LPvqLKtHUSkjAohThEwkq/fQpf
         UMl++r9v0hKU4t0YfW7pLF0Q4Wl5j9GttuAHE4uej3sMuFBjRJQjdSbqLhxz62S6RS3z
         1d4AEv00yalTqGKXt4/wsc0F7CcK0ZRwva0VjRUCx3/FFNNnBCv1pyRN0X6xp+E2ASFi
         jY3j72kTcZZDCtA3ZFe9MTa5YZIZ1jLtSTJ66fVNnduF6r5/TBYsfuJLZymGChy5jEn8
         bQ6w==
X-Gm-Message-State: AOAM533jZVuLZm/1Fcs6aQcBruF0qoNgzVn30E2Q0cd5W9qKyAMayUZz
	0eW5fwr+Ky7MSrkEP5RwfYAncb8affU=
X-Google-Smtp-Source: ABdhPJzFBxnIBlpEbyny87+unpArLAf2jUeo4zCuadFE+QPh4mX5F2HN2XlpblUvKJcXTZt0plWgAQ==
X-Received: by 2002:a0c:c1cf:: with SMTP id v15mr23741349qvh.4.1591054527503;
        Mon, 01 Jun 2020 16:35:27 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:40d9:962b:46e7:a335])
        by smtp.gmail.com with ESMTPSA id r138sm712801qka.56.2020.06.01.16.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 16:35:27 -0700 (PDT)
Date: Mon, 1 Jun 2020 19:35:25 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-toolchain: merge binary toolchain recipes
Message-ID: <20200601233525.GE31505@kudzu.us>
References: <20200528233224.28139-1-jdmason@kudzu.us>
 <CAAnfSTtp6Nw9Wm4UrYvSDYY2mnpeTPfROdZLGWMO=dS6RzH7QA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAnfSTtp6Nw9Wm4UrYvSDYY2mnpeTPfROdZLGWMO=dS6RzH7QA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 01, 2020 at 05:12:57PM +0100, Ross Burton wrote:
> On Fri, 29 May 2020 at 00:32, Jon Mason <jdmason@kudzu.us> wrote:
> > -
> > -S = "${WORKDIR}/gcc-arm-${PV}-x86_64-aarch64-none-elf"
> > -
> > -COMPATIBLE_HOST = "x86_64.*-linux"
> > -
> > -do_install() {
> > -    install -d ${D}${datadir}/aarch64-none-elf/
> > -    cp -r ${S}/. ${D}${datadir}/aarch64-none-elf/
> > -
> > -    install -d ${D}${bindir}
> > -    # Symlink all executables into bindir
> > -    for f in ${D}${datadir}/aarch64-none-elf/bin/aarch64-none-elf-*; do
> > -        lnr $f ${D}${bindir}/$(basename $f)
> > -    done
> > -}
> > -
> > -FILES_${PN} = "${datadir} ${bindir}"
> > -
> > -INSANE_SKIP_${PN} = "already-stripped libdir staticdev file-rdeps"
> > -
> > -INHIBIT_SYSROOT_STRIP = "1"
> > -INHIBIT_PACKAGE_STRIP = "1"
> > -INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> > -
> > -BBCLASSEXTEND = "native nativesdk"
> 
> Forgot to include the include file.
> 
> > +S = "${WORKDIR}/${BPN}-${PV}"
> 
> That's the default value.
> 
> > +NAME = "${BPN}".strip("gcc-")
> 
> That is a syntax error.  Looking at the repetition below, maybe this
> would be better (untested):

Wait, you are not testing this?  SHAME!  Disregard my lack of testing,
as rules do not apply to me.

> BINPATH="${datadir}${@d.getVar("BPN").strip("gcc-")}"

So, this doesn't work, as it outputs 
gcc-arm-none-eabi/usr/share/usr/share/arm-none-eabi/arm-none-eabi/
instead of 
gcc-arm-none-eabi/usr/share/arm-none-eabi/

This is due to the multiple ways this is being used.  I think the
better solution is 
BINNAME = "${@d.getVar("BPN").strip("gcc-")}"

I'll send out v2 shortly.  Thanks for the eyes.

Thanks,
Jon

> 
> Ross
