Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.12808.1623161123749663854
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Jun 2021 07:05:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=op4biacG;
 spf=pass (domain: burtonini.com, ip: 209.85.128.42, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f42.google.com with SMTP id 3-20020a05600c0243b029019f2f9b2b8aso1955173wmj.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 08 Jun 2021 07:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3iY24C1vvRmqclS+iWslAQXZiF6TiYSMZPL5YKrZwtI=;
        b=op4biacGcBMwgJLPM90SbaDzNzXV6GKsoXZQ7tvkQ5G9DzvSslAQSM9PHlGaLOUhA+
         ZHNha7ydX55K0EgXtpZGLEOPGI1qvjeLKIlvadnRLC5Ei3MtI0k55D7Sr0NratcZrooG
         /y+MmbCdSPJt4rqJJRvxZyV9w2snPV6i5IbewWbyZVPUkMI+QDcYmLFoBI9jPYd4oKzJ
         mpdPwaTo6zm0/fe/1KoC5N0FfNlzp88MCRGtutk9sJdPeH7HJ/DowY/nQ+HptJKF+6JS
         ro/q7q1PbEvx5k+XDn+nspcnaxiwPUHF3hAItf4wj5E4WjWt6Fuzl+eKv/tegtybcjPC
         hWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3iY24C1vvRmqclS+iWslAQXZiF6TiYSMZPL5YKrZwtI=;
        b=ILwqX7PfPoeMHwoBE7jEic0WRFWpI56uHPC+p3+TS5cCmSr4TFMzXCJJMhneQ8hvA5
         xwiOOfVfnL8UUiQwLL1v6K6qmrLNaiice3vY+/EJDpn/bRMmqH0lXa0p/ukN6zOVmzKY
         +BCXYNwbSat7zaP1gZB/RHJ4uKGRJEd3+Pj4Exg7uhLl6psnFVA+kORccXIgXHuhMXwC
         gxKtUICK7ZvuBSJJp9YtxKXZ+OxfIX1o/m9H2qpj+u0L4JVAbnr5c1Q15amHngtroakl
         03UlPItBhfdjmj5u/uwIat0E5aaCIIx0sBRsy1x6hsQ2Ger1CEGybhcp5OpVnu0afL+W
         +Sxg==
X-Gm-Message-State: AOAM531lKr9+UrBT74CnJVoa/dH+OoCIphsarRSSTrJB2XoP0mZU2aPc
	mpkoej6NhxlkggwqrrkE9+I6EzxMhtdxg4Yt8lgR9w==
X-Google-Smtp-Source: ABdhPJz1YgXm6YtbkuH+hbcwkmB1Dwrgb5+/CSVp78P0mgvEj/FWwBhBkFuOR6QsD1URRaY0QY8YNs2/P94MSp9pNpg=
X-Received: by 2002:a1c:e409:: with SMTP id b9mr4470135wmh.63.1623161121971;
 Tue, 08 Jun 2021 07:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210501185313.606401-1-peron.clem@gmail.com> <CAAnfSTvyRQEL5Qjt40tgoMouDeerzzQYE7jvBhtnJoSfVdsruw@mail.gmail.com>
In-Reply-To: <CAAnfSTvyRQEL5Qjt40tgoMouDeerzzQYE7jvBhtnJoSfVdsruw@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 8 Jun 2021 15:05:11 +0100
Message-ID: <CAAnfSTsw5pBRgRZqC2efh61AdRDYKYby2apAS9vxOjYLH-67mw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] gator: Add new package
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Good news: that patch is now merged upstream.

Do you plan on sending a revised gator recipe?

Ross

On Mon, 10 May 2021 at 18:14, Ross Burton <ross@burtonini.com> wrote:
>
> On Sat, 1 May 2021 at 19:53, Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.co=
m> wrote:
> > +SUMMARY =3D "DS-5 Streamine Gator daemon"
>
> Typo in "Streamline"
>
> > +DESCRIPTION =3D "Target-side daemon gathering data for ARM Streamline =
\
> > +Performance Analyzer. Note that Gator uses the Linux Perf API for \
> > +most of its data collection. Check that your Kernel follow the \
> > +configuration requirement specified here: \
> > +https://github.com/ARM-software/gator#kernel-configuration"
>
> Far too verbose a DESCRIPTION, the first sentence is sufficient. You
> can put the kernel configuration in a comment in the recipe.
>
> >SRC_URI =3D "git://github.com/ARM-software/gator.git;protocol=3Dhttp;bra=
nch=3Dmaster \
> >. file://0001-gator-don-t-strip-debug.patch;patchdir=3D.. \
> >. "
>
> There's a mix of spaces and tabs on the line with the patch, just spaces =
please.
>
> > EXTRA_OEMAKE =3D "'CFLAGS=3D${CFLAGS} ${TARGET_CC_ARCH} -D_DEFAULT_SOUR=
CE -DETCDIR=3D\"${sysconfdir}\"' \
>
> Also pass V=3D1 so the build log is verbose.
>
> I'm guessing this doesn't work on x86-64 hosts?  If so add
> COMPATIBLE_HOST =3D "aarch64.*-linux" to make that explicit (as
> otherwise a world build with meta-arm present will try to build it).
>
> As this is just the daemon, should the recipe be gator-daemon? Or do
> you plan to add the rest of the tools in the future?
>
> Ross
