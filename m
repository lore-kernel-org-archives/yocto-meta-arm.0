Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web11.12064.1591367070747362213
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 05 Jun 2020 07:24:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=wkCdHSSr;
 spf=pass (domain: linaro.org, ip: 209.85.208.196, mailfrom: sumit.garg@linaro.org)
Received: by mail-lj1-f196.google.com with SMTP id z9so11940880ljh.13
        for <meta-arm@lists.yoctoproject.org>; Fri, 05 Jun 2020 07:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rFkZjBrCu5kbJF6j3VLAb39BgzzHfyEXe+GGcRaIMwg=;
        b=wkCdHSSr773VVFSjPRWyLbHtYYMkOSXjUjTCvAM2cwtcdDRlra9BG2wfjYujpVBow5
         9pDVV1bkKFZpH7HvAxXU1f+HRRO01XJhKvz9oe0YAghbrmsQMdVkBiaAKMvsB4YxpQCL
         6ybu6G7DXKj0N54u0krK7uBJkrH6ZYlXByRwMhZHGRFud2x2bmp2Z6AhcxEE+cG+9MBr
         Ce/mUZNjVUDRGU1QTwoXOIog1o01TZoyGSSOHWBSFCwmd1tQJKtX6KLC8H4OE8rASY2m
         aqdzd2HIKmL4bS4npO+9r7xvaCuz1McRN6kFllA3imP255dCf1s/zLaHbRNehPrHUPBe
         Dzgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rFkZjBrCu5kbJF6j3VLAb39BgzzHfyEXe+GGcRaIMwg=;
        b=BExyQV68wzKsaj10xdInyuKqbCsMKLe8hj3lcMrRYsp8qcEBIgtbX+g3wcsHNHNGqb
         zFs5CxQDct8CjbqojgF+TK3zbmrcYsQuhJhHhQyCYVtrq9WbYoy1r8BkNlABy9d5yRbj
         xOa5CC8j5Y0tmk9grT+0sgwkK5c1sKIheih/CKhZtTon32Ks9Vi5cgaWQIJtJ5RM7kLb
         QST5wTNyzsdqojVmfAOhyODVhUYhPw3bZyCW8c8bYWj83LxJq8WR/vFZ/j5goC0iGZT3
         5oD78Yj6olU1MPjHx8B+hV8DPx4vTePr5Wh50U9FtE+gFHlAxkqAGJKgg4ZE+nQd+rBS
         2O6Q==
X-Gm-Message-State: AOAM530VXqdQfY7YmKeqm79xKlAAUCKmdQQapRci59TEM1hSCluomDUj
	FFKSLio3zEL8RqV7nktYQ0bsU3/2LGCZJnyjsacSFw==
X-Google-Smtp-Source: ABdhPJyOCyFyTj8hIl0p4edBCJjvDrMSWOdXehf+5Qb4wPQG5UnFMgDbrhg4J+pbSBgSs7Pb9hcFfQbakbYVfoQJROw=
X-Received: by 2002:a2e:9e19:: with SMTP id e25mr5255354ljk.30.1591367068800;
 Fri, 05 Jun 2020 07:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <1591095894-15178-1-git-send-email-sumit.garg@linaro.org>
 <1591095894-15178-2-git-send-email-sumit.garg@linaro.org> <20200604183630.GD17660@denix.org>
In-Reply-To: <20200604183630.GD17660@denix.org>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Fri, 5 Jun 2020 19:54:17 +0530
Message-ID: <CAFA6WYP+hyXXm47Y9=Jov0=44uO=6iwr6o4jinzvYb8QAXBV0Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] external-arm-toolchain: Remove glibc locale dependency
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, Paul Barker <pbarker@konsulko.com>, wmills@ti.com, 
	Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Jun 2020 at 00:06, Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Tue, Jun 02, 2020 at 04:34:51PM +0530, Sumit Garg wrote:
> > External Arm tool-set
>
> Why do you call it tool-set? It's definitely not critical, but toolchain is
> kind of a standard name for this:
> https://en.wikipedia.org/wiki/Toolchain
>

Okay.

>
> > doesn't seem to provide packages corresponding to OE glibc locale recipe.
>
> Actually, the toolchain itself does provide all the gconv libs, AFAICS,
> it's just they are not packaged by the recipe.

Yes, I saw those libraries provided by toolchain iself. But I am a
little skeptical about whether we would be able to generate dynamic
glibc locale data package using pre-built toolchain.

> When I hit it back in April,
> I just didn't have time and ended up with LIBC_DEPENDENCIES_remove hack as
> a temporary workaround, planning to enevtually go back and fix it properly:
> http://arago-project.org/git/?p=meta-arago.git;a=blobdiff;f=meta-arago-distro/conf/distro/arago.conf;hb=84c30ee97056589ba0811428527f4adf8268c9b2;hpb=3a4ed9d1e8a118aefb2ef49ce450f74f14e239d0
>

I do look forward to your patch adding support for glibc locale
packages but until then we shouldn't block usage of SDKs.

> So, re-using this LIBC_DEPENDENCIES_remove here in upstream meta-arm isn't
> correct...
>

I think it's a separate feature rather than a gating item to use SDKs.
So it's better to advertise properly what is currently being supported
by pre-built toolchain rather than failing due to missing features.

We can definitely get rid of this once we sort out proper packaging
for glibc locale using pre-built toolchain.

>
> > So explicitly remove corresponding libc dependencies.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> > index 9171380..eee1a51 100644
> > --- a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> > +++ b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> > @@ -58,6 +58,7 @@ DISTRO_FEATURES_LIBC = "ipv4 ipv6 libc-backtrace libc-big-macros libc-bsd libc-c
> >  ENABLE_BINARY_LOCALE_GENERATION = "0"
> >  GLIBC_INTERNAL_USE_BINARY_LOCALE = "precompiled"
> >  LIBCOVERRIDE = ":libc-glibc"
> > +LIBC_DEPENDENCIES_remove = "glibc-gconv-cp1252 glibc-gconv-ibm850 glibc-gconv-iso8859-1 glibc-gconv-iso8859-15 glibc-localedata-i18n"
>
> You shouldn't be using _remove in meta-arm, as it's not the final layer and
> there won't be any way to override this in BSPs or Distros.
>

Do you have any other alternative way to achieve similar functionality
as this comes from tclibc-glibc.inc?

-Sumit

>
> >  ERROR_QA[type] ?= "list"
> >  python toolchain_metadata_setup () {
> > --
> > 2.7.4
> >
