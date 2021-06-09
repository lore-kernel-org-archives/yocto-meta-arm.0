Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.5010.1623226686743735867
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Jun 2021 01:18:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WyU6B3E8;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: peron.clem@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id t3so27726167edc.7
        for <meta-arm@lists.yoctoproject.org>; Wed, 09 Jun 2021 01:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WtfCq3Ux3ypQ1CDexuUujAu5PJBjQat4pOFFAfdfbEc=;
        b=WyU6B3E8ZsLs20Q+Ap4tkiLspJbOsSnOAuK0OkUAv9SDkY9SXLSKCK2FVfaKi4k7IS
         jGK2pV9pt0/bWxpAyL8sE56/kvbD4FNZ0D339gXgIEKf1iPNBwEJ3kXCMCkNc0F9gBmt
         asytio1bHBSrqTYE0vwnTVgVNfW7aXJBq78SB7Q/qiunfhCrv9BqDnaQ4yPuFp1OKP1q
         AGoo1uARNN12bT5rmsR/OeJWM4eoToJMnO9vzzgmgWTXwuo0lVQ0N7NejU7yIQ/E3fUZ
         6inonydNK85ZyaNjabMh0l1TNctTV+S1UUKYD6hxHMOXI8nvj7QtbPP9lsydomzs9uqR
         xRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WtfCq3Ux3ypQ1CDexuUujAu5PJBjQat4pOFFAfdfbEc=;
        b=hQE1qlPi7MnwSa+rmtaGOO2jrbt2BUkXxk8wXkbGvwy55DNEMHTFZONEUWzhJMI3Vz
         BZjOS08sEc83vdqtXtRUU/ooW7IENKXB4p4vlltAWY8yKzdHg2UcKGJp/cB+We3R7rIM
         yaMvCiy3WyrBfQf7Q/ZLRu2TJJ30KDlfieJfA7MYaAkdqa1mFnGZWOO4uGVlVQluTjOK
         qAmjH+FCWaCYcgsx1nvps3WCS/olW/GsAElwC/F5l7sOoRy4w6o4gHWkrIZIL2QfWxsE
         shH17mSCR4OcgZwlxfKlgId3lfr7IXa1KETn4UmMpUynyBcMncZj2Sdg5wl2oZ+UoFmh
         RO8Q==
X-Gm-Message-State: AOAM532wgNfXq9j62dNfcGj5NxEguhvQVouKiI/zIbvc79v6seghmN4M
	OIyEvvd7iId4AuLdGLNaDXXj5X4AjtQ7DsQURfo=
X-Google-Smtp-Source: ABdhPJz0mL0ER4hjGIXn3fskPpdX1FpglNb0Y6ziD83uj05osi8pCtR+1fUn69ROPbqCn08rDkQXRvi85QUXVAHMb+k=
X-Received: by 2002:a05:6402:170e:: with SMTP id y14mr30393910edu.367.1623226684741;
 Wed, 09 Jun 2021 01:18:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210501185313.606401-1-peron.clem@gmail.com> <CAAnfSTvyRQEL5Qjt40tgoMouDeerzzQYE7jvBhtnJoSfVdsruw@mail.gmail.com>
 <CAAnfSTsw5pBRgRZqC2efh61AdRDYKYby2apAS9vxOjYLH-67mw@mail.gmail.com>
In-Reply-To: <CAAnfSTsw5pBRgRZqC2efh61AdRDYKYby2apAS9vxOjYLH-67mw@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Wed, 9 Jun 2021 10:17:53 +0200
Message-ID: <CAJiuCcdcfTy9sK77mpotaEV_9uk45-FT7rdsREQWa417xxmhDQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] gator: Add new package
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ross,

I will send a v2.

On Tue, 8 Jun 2021 at 16:05, Ross Burton <ross@burtonini.com> wrote:
>
> Good news: that patch is now merged upstream.
>
> Do you plan on sending a revised gator recipe?
>
> Ross
>
> On Mon, 10 May 2021 at 18:14, Ross Burton <ross@burtonini.com> wrote:
> >
> > On Sat, 1 May 2021 at 19:53, Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.=
com> wrote:
> > > +SUMMARY =3D "DS-5 Streamine Gator daemon"
> >
> > Typo in "Streamline"
> >
> > > +DESCRIPTION =3D "Target-side daemon gathering data for ARM Streamlin=
e \
> > > +Performance Analyzer. Note that Gator uses the Linux Perf API for \
> > > +most of its data collection. Check that your Kernel follow the \
> > > +configuration requirement specified here: \
> > > +https://github.com/ARM-software/gator#kernel-configuration"
> >
> > Far too verbose a DESCRIPTION, the first sentence is sufficient. You
> > can put the kernel configuration in a comment in the recipe.
> >
> > >SRC_URI =3D "git://github.com/ARM-software/gator.git;protocol=3Dhttp;b=
ranch=3Dmaster \
> > >. file://0001-gator-don-t-strip-debug.patch;patchdir=3D.. \
> > >. "
> >
> > There's a mix of spaces and tabs on the line with the patch, just space=
s please.
> >
> > > EXTRA_OEMAKE =3D "'CFLAGS=3D${CFLAGS} ${TARGET_CC_ARCH} -D_DEFAULT_SO=
URCE -DETCDIR=3D\"${sysconfdir}\"' \
> >
> > Also pass V=3D1 so the build log is verbose.
> >
> > I'm guessing this doesn't work on x86-64 hosts?  If so add
> > COMPATIBLE_HOST =3D "aarch64.*-linux" to make that explicit (as
> > otherwise a world build with meta-arm present will try to build it).
> >
> > As this is just the daemon, should the recipe be gator-daemon? Or do
> > you plan to add the rest of the tools in the future?

I don't plan for the moment to add the rest of the tools but maybe someone =
will.
For the package name up to you, what do you prefer?

Clement

> >
> > Ross
