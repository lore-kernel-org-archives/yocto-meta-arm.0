Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web12.48381.1591047104564447264
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 01 Jun 2020 14:31:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=F8y0GTNp;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f194.google.com with SMTP id f18so10644159qkh.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 01 Jun 2020 14:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=k92iG3i1DFw0UTthh/sAkOlI1H7nkRG38F2FKyc5oq4=;
        b=F8y0GTNpIWRLDB5FrHJXPCcz9SgG4LBDRHw6pRYBpely57b8ujkPj/yhy1nMr+avF8
         g+80mWxc4VGvxD/6Ku1WEcHGfHuppznrg8Nm+gFMz0xbYLTjM7Btwfv1WcUk4RWxDVo5
         zjDdalrmOqyOH3s8xjK/sCuuvG5VOV3NHCEk6aWoRXGuBUbN1WOT2JJc3uDrFo92vG2X
         Sf3wUgHehit9RPdvMfYO5hUu4h0KpcQXhUqkR9wI8pMfQyuP2K2jznaUL8EAW6UqVfvc
         tyB6IbYAuSj1TfV38m3h3aS7wIJ86hn8+OHkoEirPodKFuF+nmCD+KByfkJVTkyl6EZK
         vQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=k92iG3i1DFw0UTthh/sAkOlI1H7nkRG38F2FKyc5oq4=;
        b=dUXeoGUtP1bw7KWfUo2X2KOhjtEOukcquIdFNQiJleVMJnR7VzDLiygS6mRtZ1aKsA
         tM8hMUWLknCJj+HDHsGYtsMLKcxOfI0i1KEuQ4k4Zm5uiYLxxsm6nSoTlSlNHm8UbuM+
         u9BJf+utgpFMChFgKOtleEcHgR9SIYbVxHeZCxDbT6ck4/BrhnreEe6lml5nBVf9cpte
         dIQBZyyBVLewrWIXU5R5SVxexbz6C70aDONQ+cpTvTPejygdImbxyPQnxlACsXaR8bJo
         AB8POoE5MABaowEM16sluR9KGNTs2klyV9bQcGsVDqjZQiCq3oDk3tUktLcjupybzq9g
         p3Dw==
X-Gm-Message-State: AOAM5326+IRRXyIlxLp5LmPA+QJoHaPIiKRIqJy7WLTScGP1VBk2KMTs
	3kQFMAAClXKR/o9ZcPTy6+secA==
X-Google-Smtp-Source: ABdhPJxPbHNOlMx/Rg6yNgvbPgmWAqDFLLLV5G4OZohR5u1JFYv6O74CtfLzQckg7w3xIaGr0kaJUA==
X-Received: by 2002:a05:620a:118a:: with SMTP id b10mr22682754qkk.305.1591047103647;
        Mon, 01 Jun 2020 14:31:43 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:40d9:962b:46e7:a335])
        by smtp.gmail.com with ESMTPSA id a82sm508357qkb.29.2020.06.01.14.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 14:31:43 -0700 (PDT)
Date: Mon, 1 Jun 2020 17:31:41 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm][PATCH] meta-arm: Remove meta-python dependency
Message-ID: <20200601213141.GA31505@kudzu.us>
References: <20200529151427.20272-1-JPEWhacker@gmail.com>
 <90DD68A5-0834-4C82-8A06-BC3972756CA3@arm.com>
 <6d6ccf5c-f134-1a15-e5eb-8f5e10d03832@gmail.com>
 <09986319-6338-471F-A0C1-5096F5ED7AA3@arm.com>
 <CAJdd5Gag=0HF8+5KiF0DoLG1WZs+0ngbnT7G8CS1dFa=ydqjoQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJdd5Gag=0HF8+5KiF0DoLG1WZs+0ngbnT7G8CS1dFa=ydqjoQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 30, 2020 at 01:39:49PM -0500, Joshua Watt wrote:
> On Fri, May 29, 2020, 10:37 AM Bertrand Marquis <Bertrand.Marquis@arm.com>
> wrote:
> 
> >
> >
> > > On 29 May 2020, at 16:32, Joshua Watt <JPEWhacker@gmail.com> wrote:
> > >
> > >
> > > On 5/29/20 10:21 AM, Bertrand Marquis wrote:
> > >>
> > >>> On 29 May 2020, at 16:14, Joshua Watt via lists.yoctoproject.org
> > <JPEWhacker=gmail.com@lists.yoctoproject.org> wrote:
> > >>>
> > >>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > >>> ---
> > >>> meta-arm/conf/layer.conf | 3 +--
> > >>> 1 file changed, 1 insertion(+), 2 deletions(-)
> > >>>
> > >>> diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
> > >>> index d96e9f1..1c241d4 100644
> > >>> --- a/meta-arm/conf/layer.conf
> > >>> +++ b/meta-arm/conf/layer.conf
> > >>> @@ -11,6 +11,5 @@ BBFILE_PRIORITY_meta-arm = "6"
> > >>>
> > >>> LAYERDEPENDS_meta-arm = " \
> > >>>     core \
> > >>> -    meta-python \
> > >>> "
> > >>> -LAYERSERIES_COMPAT_meta-arm = "warrior zeus dunfell"
> > >>> +LAYERSERIES_COMPAT_meta-arm = "gatesgarth"
> > >> Could you explain why you want to remove dunfell compatibility ?
> > >
> > > dunfell doesn't have the required python recipes in oe-core, so it isn't
> > compatible with it anymore.
> >
> > Nothing has been tested or is compatible with gatesgarth right now so this
> > change will really have a breaking impact.
> >
> 
> Right, you certainly wouldn't want to backport it to the dunfell branch;
> this is just for master where the next release would be gatesgarth anyway.
> 
> Also, with the qemu support I added, I think we have reasonable testing
> coverage on meta-arm, and in particular enough to have high confidence in
> this change.
> 
> Finally, FWIW, upstream oe-core and meta-python have already made these
> changes on their master branches, so it seems like we wouldn't want a
> useless dependency on meta-python in meta-arm, *especially* if the idea is
> to get other bsp layers to depend on meta-arm to consolidate things like
> TF-A and optee.

We currently have a requirement for dunfell compatability on the
meta-arm master branch for Arm's BSP software releases (which will
be YP based going forward).  To make a stable release for our
customers, we need to draw a line between stablity of our dependent
layers and the latest code in the meta-arm layer.  This especially
relates to the BSPs Arm will be adding to meta-arm-bsp in this
release.

We do not have to keep dunfell support in master after the release of
gatesgarth, but we will need it until then.  So, please stash this
patch until October (which will be here sooner than you think).

Thanks,
Jon


> 
> 
> > Bertrand
> >
> > >
> > >
> > >>
> > >> Bertrand
> > >>
> > >>> --
> > >>> 2.17.1
> > >>>
> > >>> 
> >
> >

> 

