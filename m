Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.11470.1594992730601188445
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 17 Jul 2020 06:32:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=urrYUwH5;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f195.google.com with SMTP id x62so7581570qtd.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 17 Jul 2020 06:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gJcuxJpH8CHzPei3VbdQAvt5zYIcmfT+ToMTawlPefA=;
        b=urrYUwH5uEVCgFUn2I1cmHEGnLbBASRAv8x/JZHgqpM4drynFnFWD3ZEbC0vXp24Hs
         wWC+4+jX+EWg9gLgOUwzYcsZ366kYcWVBcEIxPqgs1rB4fSaQTujNCLnWZA2Ht/ERlpZ
         w67gFDKcemTUaJo9HIUPHzFGC7P0eFQRpw3+ogFmX4+WP4+g/TfavpEboic2AmhlvTau
         U9KGyL62T+OIbZmGHEGcOhqfE8OWbRhJZoEfwRRo7pECOzgzYt0gPSp2EbOCnUiyHm3r
         ztUBh+jWbrt3UNS3RC2u+hu6b0cmFUd36h7v9L5IHHG+fKp/1DHsGwo9OMSbFnpI+All
         V8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gJcuxJpH8CHzPei3VbdQAvt5zYIcmfT+ToMTawlPefA=;
        b=nKAcj++ANkkqnR27rQ+GCEZFZHPVOayqKNLeUphMUnmuWpblCnkkebotlmJC0TKZbB
         cYBxtQLZWQHER7wejNwHhlZQIb/yz7zr7JD/cqD87lqZEjI/rqoupDleLKay3be7dUG7
         HNtJnNggdrqRrWP9OuVphmQ5veXSf0LL53vEbgBxwH/KrOUj+rvtkTZOi0dg74SEBsdK
         GH+LnbaIfHxN52p2kP5BajG2HDmYwoNtJtBKIKymAfOJ6w+pUnXXPYoOKOR7FeSOL8A9
         XFyapnqEZXcjp3rCVP2R86kLn0glE3cxmMUjEbWJc/b1yUIG1mot+hALV6eyiStojXJT
         0CYA==
X-Gm-Message-State: AOAM5330Hz/CZRsRbPl/Mn4izs+LjlPytXTdgYjGvNVCnd61KdeLsx03
	706d/jNEbUJZYfUwpRDwiSMiAQ==
X-Google-Smtp-Source: ABdhPJywpu3MTOL9PEFsMqbjuWhxDQHOul2N3xMiKs71kgGcta68fTq8D717id6OZYTb9HHLHh7/2A==
X-Received: by 2002:ac8:22cd:: with SMTP id g13mr10711117qta.100.1594992729719;
        Fri, 17 Jul 2020 06:32:09 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:8034:b667:f1cd:123f])
        by smtp.gmail.com with ESMTPSA id 79sm10512005qkd.134.2020.07.17.06.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 06:32:09 -0700 (PDT)
Date: Fri, 17 Jul 2020 09:32:07 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Fabien Parent <fparent@baylibre.com>
Cc: Ross Burton <ross@burtonini.com>, Denys Dmytriyenko <denis@denix.org>,
	Gabor Abonyi <Gabor.Abonyi@arm.com>,
	"JPEWhacker@gmail.com" <JPEWhacker@gmail.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 4/6] arm: trusted-firmware-m: Add recipe
Message-ID: <20200717133206.GH26434@kudzu.us>
References: <20200622071401.2570-5-gabor.abonyi@arm.com>
 <20200622164936.GF17660@denix.org>
 <20200622172654.GC14044@kudzu.us>
 <20200622173611.GG17660@denix.org>
 <e4cd2080-3747-9ead-d307-6394caba82d1@gmail.com>
 <VI1PR0802MB2414E9F9AB2A65D5B27A7DE68E940@VI1PR0802MB2414.eurprd08.prod.outlook.com>
 <20200701180840.GT17660@denix.org>
 <CAAnfSTu3YvnOKHug6ifScDHSYQBPhVEkd7FAY4EN0xwot=6LsA@mail.gmail.com>
 <20200702153948.GB21456@kudzu.us>
 <CAOwMV_wBTPWEz=c_8SnLo4uf5x9vFu4vyfSJEwkFEToU2Fxp0A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOwMV_wBTPWEz=c_8SnLo4uf5x9vFu4vyfSJEwkFEToU2Fxp0A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 16, 2020 at 08:14:33AM +0200, Fabien Parent wrote:
> Hi,
> 
> I'm using meta-arm for the OP-TEE recipe (and soon I will replace our
> TF-A recipe to be based on the one from meta-arm). I just discovered
> this change today by receiving multiple report of the following error
> when trying to build an image based on our layer:
>     ERROR: Layer 'meta-arm' depends on layer 'arm-toolchain', but this
> layer is not enabled in your configuration
>     Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> 
> Usually the stable branches (dunfell in this case) don't add change
> that could break other people's setup like adding a new hard
> dependency. Most of the time the changes are bug-fixes, or minor
> upgrades to packages.
> 
> Shall I consider meta-arm to not follow this rule, and in order to
> never have breakage, pull a specific commit hash instead of pulling
> the current release branch?

We've been very public about the dunfell branch not being a stable
branch. In fact, I even sent out an specific email to this list about
this very topic.  Please read
https://lists.yoctoproject.org/g/meta-arm/message/652

All of that being said, our intention is to never break the dunfell
branch (as we intend on using it for product SW releases).  We are in
the process of rolling out CI for this branch and this should assist
in this task.  Until we have a better setup in place, it is possible
issues might roll through.  I apologize if this causes problems, and
ask that you are patient with us.

Thanks,
Jon


> 
> Thanks,
> Fabien
> 
> On Thu, Jul 2, 2020 at 5:39 PM Jon Mason <jdmason@kudzu.us> wrote:
> >
> > On Thu, Jul 02, 2020 at 10:14:55AM +0100, Ross Burton wrote:
> > > On Wed, 1 Jul 2020 at 19:08, Denys Dmytriyenko <denis@denix.org> wrote:
> > > > meta-arm is meant to be a central place for shared components to be used by
> > > > other BSPs. Kind of a community layer, if you like. And arm-toolchain is kind
> > > > of a special layer and may not be desirable by all BSPs, so that would reduce
> > > > overall usefulness of meta-arm layer. Each individual BSP (and meta-arm-bsp is
> > > > one of those) is free to depend on arm-toolchain layer directly, if needed.
> > >
> > > Arguably, tfm should be in meta-arm for the same reasons that tfa is:
> > > it's a shared component and not specific to a single BSP.
> > >
> > > The need for a binary toolchain is not ideal but simply adding the
> > > layer doesn't cause it to be used by all recipes.  I propose that we
> > > add this series now and evaluate the use of multiconfig to build a
> > > second cross compiler in the future (sooner rather than later).
> >
> > To be clear, this is not a perminent requirement.  I would LOVE for it
> > to be removed, and I am hoping it will be done within the next month
> > or so.  IMHO, having TF-M available with this detriment is superior to
> > not having it due to this issue.
> >
> > If this is a dealbreaker, please let me know.
> >
> > Thanks,
> > Jon
> >
> > >
> > > Ross
> > 
