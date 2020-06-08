Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com [209.85.167.196])
 by mx.groups.io with SMTP id smtpd.web11.28347.1591617754327670692
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Jun 2020 05:02:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=NM7V/hQI;
 spf=pass (domain: konsulko.com, ip: 209.85.167.196, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f196.google.com with SMTP id a137so15033434oii.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 08 Jun 2020 05:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H8i+x7OlTuMHOgq2A4oXILT5ENGIF41h0JG/mxrV3b4=;
        b=NM7V/hQINyc0U3loRJBcxEsOef1r1KffHyKwdiVr2DS2dHPTI3u30CRg0Atj98PCI7
         WPadJVPXjMdzevoVEwweN08b6TRBbo53Q45dQFPIUWFduQw7st03Kl1Jd3BheaooE4yx
         sZxbGQS4lPSnEajjA3vYzdlMWoCJhckjJL2y4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H8i+x7OlTuMHOgq2A4oXILT5ENGIF41h0JG/mxrV3b4=;
        b=OUchoza/0VCg2qVPFIScGyQA04pMHSGzHVFBs/anZ9gfN0OIzZ/xc8eHwVF5Z8T1NV
         shr7PXoGlZXTrkZEAuGDv+ujE0UpU8D8NcpjL/yrrJB9GtSzx/q60tNsIUhP69jKo4o+
         KPHi//l+UBV4gAJyq3WR+BSNxmub+a31ZcOMSV1MniERkuFYSxM2Ldj82jS/72yMbCzC
         eKGVgnCZIISCsnm9SmWEne/7Qkun7dN5KO9MrrhzaC07Yvr/e6KNhGfERtgPQROt/jnp
         i8HOpJmCS/epBDs9EdULDufzh/lF+MEIFO4QKOJDpHsj0B9yAAZ+6TgMkEa3NY/BHi1F
         bXwg==
X-Gm-Message-State: AOAM533WPYe6FO7HqoE+uU7YmPg4gXC0NrBaZ/u8NcOWic7QQvykbvaf
	vHKerifU16lP12yCMYVLLhhzewnfoLcQUc77kxa5WQ==
X-Google-Smtp-Source: ABdhPJwXONITbVRHMzxiz1BkqJ1QXszObg9bLtwMyVTWyIizGyMI9wo2dyZKIVopauRQqlWV5fgj2aJlpcqIl3tQyIY=
X-Received: by 2002:aca:ea46:: with SMTP id i67mr9744626oih.152.1591617753613;
 Mon, 08 Jun 2020 05:02:33 -0700 (PDT)
MIME-Version: 1.0
References: <1591095894-15178-1-git-send-email-sumit.garg@linaro.org>
 <1591095894-15178-3-git-send-email-sumit.garg@linaro.org> <20200604184225.GE17660@denix.org>
 <CAFA6WYORPEGyL+P5pEP0bRUsVT4KUrNhVA3SrxehXQMMatfkxg@mail.gmail.com>
In-Reply-To: <CAFA6WYORPEGyL+P5pEP0bRUsVT4KUrNhVA3SrxehXQMMatfkxg@mail.gmail.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Mon, 8 Jun 2020 13:02:23 +0100
Message-ID: <CAM9ZRVtoRJzcR1ZnfTcR9FF6U6tdcfc0eemKrjXqeXP4YnMB2w@mail.gmail.com>
Subject: Re: [PATCH 2/4] external-arm-toolchain: Refine dev libraies packaging
To: Sumit Garg <sumit.garg@linaro.org>
Cc: Denys Dmytriyenko <denis@denix.org>, meta-arm@lists.yoctoproject.org, wmills@ti.com, 
	Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Jun 2020 at 14:52, Sumit Garg <sumit.garg@linaro.org> wrote:
>
> On Fri, 5 Jun 2020 at 00:12, Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > On Tue, Jun 02, 2020 at 04:34:52PM +0530, Sumit Garg wrote:
> > > OE core by default package all libraies installed as "${libdir}/lib*.so"
> > > or "${libdir}/*.la" as part of "FILES_${PN}-dev" but in case of external
> > > Arm tool-set recipe, multiple packages are provided which needs to
> > > include specific libraries. So split dev libraries packaging accordingly
> > > and only package remaining libraries as part of "FILES_${PN}-dev" which
> > > aren't provided as part of other packages.
> > >
> > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > > ---
> > >  .../external-arm-toolchain.bb                      | 23 ++++++++++++++++++++++
> > >  1 file changed, 23 insertions(+)
> > >
> > > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > > index 04d8923..7f5a6f5 100644
> > > --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > > @@ -545,6 +545,29 @@ FILES_${PN} += "\
> > >       ${base_libdir}/libpcprofile.so \
> > >      "
> > >
> > > +FILES_${PN}-dev_remove = "\
> >
> > Shouldn't be using _remove here. It will probably break anyones .bbappends on
> > this recipe and will make it hard making any adjustments.
> >
>
> Any specific reason to use .bbappends? Why can't those changes land in
> meta-arm instead?
>
> > If you check git logs, you'll see that every time we needed to change the
> > default lists defined by glibc-package.inc in OE-Core, we had to re-create
> > them from scratch.
> >
>
> Sounds reasonable, will create FILES_${PN}-dev from scratch instead.

Denys has made some good comments, I don't have much to add. I did
spot a typo in the subject though, "libraies" should be "libraries".

-- 
Paul Barker
Konsulko Group
