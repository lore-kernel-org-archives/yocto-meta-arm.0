Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web12.11206.1586352090680857570
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Apr 2020 06:21:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=d34fmXGE;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f194.google.com with SMTP id g74so3032338qke.13
        for <meta-arm@lists.yoctoproject.org>; Wed, 08 Apr 2020 06:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7h64RsX11dWnjn/9n80mfIeUVVlPy88aX0tE2ZV6fhs=;
        b=d34fmXGEfNP1ZCSAv/ucaDnbRuBPscWM0UNfpjiQs+STFLYOtleSn5KYiaQfJS1eiU
         BInGgfB3vmMDJeiq3Z1vUhU6fvTFqQ65LxsnMLQhHnTqLOwrawIe8izl7app9WQsVwbW
         VLnM+nzlCQp/qyQXTiYZxunsv+6p0vdETjaEzCf028W5cYVQZPIAFniyNjB8P+GS9861
         2o1CMf6Y4JcgWhJznMo/jOOQrvmI8V05Wm6xQwoRHOCbLW5WYeglBYVLeTBL7+h+F8+V
         EAX3vr4Ln4Nf9WhTN5N4JzOJqgjHEmxjKNhG5517RX2demCfVjMTmaFDtjtmbJJfc4Ja
         tGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7h64RsX11dWnjn/9n80mfIeUVVlPy88aX0tE2ZV6fhs=;
        b=oSjh0iAWALxfjf5P5kvAtd4iOOLUZ22tz1SyNsLV6Z3mOOPPnKv3BVRkxIYaocG+JB
         r4FAiOPRCyWyU+VMEX8B/zwluKwZ6kma26keALbflsutaGhH6HAPvqrBoK2Isp/xCt8k
         GJuLLj4vVvJePGEUXNVnxNfElsCOkhb0RqiUaDCZjQSrlkhp9DwFYay2Lqvvaqj8tlTi
         i9192n7Yi8L5BzRxjsyTpomz/5yI9Fqf1VHSI6YHBahqmftcuxQvO3gFO8kPQTTwDI/U
         Y8yE03Maw1yVjYHmeey1w5EpZ8tJBNsoeCOua8jOn5iSi1pHFAQgvPbAM1gb8+o/4/yZ
         iOUg==
X-Gm-Message-State: AGi0PuaYpy6h0ABsdTFc7D6puOc3S8F+1jr0wMPPz+NKiErrPEyuycgp
	yJh7LcT5NgzjoBeYZww1kA4+LFu4WLHlJg==
X-Google-Smtp-Source: APiQypJ3KwMWjilhuakGSc/BtQ51oeinZ7QJtaNaTuXWsIKyTt6kR6Zo1q4kh78eZYbDK1qBjJubLw==
X-Received: by 2002:a37:bd45:: with SMTP id n66mr7601184qkf.73.1586352089565;
        Wed, 08 Apr 2020 06:21:29 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:e180:b789:7869:7b22])
        by smtp.gmail.com with ESMTPSA id n92sm6233904qtd.68.2020.04.08.06.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 06:21:29 -0700 (PDT)
Date: Wed, 8 Apr 2020 09:21:27 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-arm] [PATCH] layer.conf: update LAYERSERIES_COMPAT for dunfell
Message-ID: <20200408132127.GA1355@kudzu.us>
References: <1585684637-53492-1-git-send-email-denis@denix.org>
 <20200408034234.GD29748@kudzu.us>
 <20200408035233.GA1578@denix.org>
 <CAP71WjwNZLxTL1sPW01w3oC1SAuYPb+qPwA9p+982FvqTL+P0w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71WjwNZLxTL1sPW01w3oC1SAuYPb+qPwA9p+982FvqTL+P0w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 08, 2020 at 08:06:14AM +0200, Nicolas Dechesne wrote:
> On Wed, Apr 8, 2020 at 5:52 AM Denys Dmytriyenko <denis@denix.org> wrote:
> 
> > On Tue, Apr 07, 2020 at 11:42:35PM -0400, Jon Mason wrote:
> > > On Tue, Mar 31, 2020 at 03:57:17PM -0400, Denys Dmytriyenko wrote:
> > > > From: Denys Dmytriyenko <denys@ti.com>
> > > >
> > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > ---
> > > >  meta-arm-bsp/conf/layer.conf       | 2 +-
> > > >  meta-arm-toolchain/conf/layer.conf | 3 +--
> > > >  meta-arm/conf/layer.conf           | 2 +-
> > > >  3 files changed, 3 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/meta-arm-bsp/conf/layer.conf
> > b/meta-arm-bsp/conf/layer.conf
> > > > index 0632ba3..8afcbe5 100644
> > > > --- a/meta-arm-bsp/conf/layer.conf
> > > > +++ b/meta-arm-bsp/conf/layer.conf
> > > > @@ -10,7 +10,7 @@ BBFILE_PATTERN_meta-arm-bsp = "^${LAYERDIR}/"
> > > >  BBFILE_PRIORITY_meta-arm-bsp = "6"
> > > >
> > > >  LAYERDEPENDS_meta-arm-bsp = "core openembedded-layer meta-arm"
> > > > -LAYERSERIES_COMPAT_meta-arm-bsp = "warrior zeus"
> > > > +LAYERSERIES_COMPAT_meta-arm-bsp = "warrior zeus dunfell"
> > >
> > > I was actually waiting for dunfell to be released, then I was going to
> > > remove warrior and zeus when adding dunfell.  The logic behind this is
> > > to limit the scope of our support and testing.  To my knowledge, no one
> > > is using meta-arm in production for warrior or zeus, so I don't think
> > > it's an issue.
> >
> > Jon,
> >
> > You can remove warrior and zeus later, but OE-Core master has been only
> > compatible with dunfell for couple weeks now and meta-arm in unusable w/o
> > a similar change.
> 
> 
> +1. We would like to switch our OE RPB builds to meta-arm-toolchain, and
> remove our copy of gcc-arm from meta-linaro-toolchain, but we can't do that
> until this patch gets in.
> OE-core is typically updated several weeks before the release, that allows
> all layers to get ready for the release.

Fair enough, pulling in now.

Thanks,
Jon

> 
> 
> >
> 
> 
> > --
> > Denys
> >
> >
> > > Thanks,
> > > Jon
> > >
> > > >
> > > >  # We have patches for xen but meta-virtualization might not be there
> > so filter
> > > >  # out recipes-extended/xen unless xen is activated in the features
> > > > diff --git a/meta-arm-toolchain/conf/layer.conf
> > b/meta-arm-toolchain/conf/layer.conf
> > > > index a247dc1..3a4c4f0 100644
> > > > --- a/meta-arm-toolchain/conf/layer.conf
> > > > +++ b/meta-arm-toolchain/conf/layer.conf
> > > > @@ -8,8 +8,7 @@ BBFILE_COLLECTIONS += "arm-toolchain"
> > > >  BBFILE_PATTERN_arm-toolchain := "^${LAYERDIR}/"
> > > >  BBFILE_PRIORITY_arm-toolchain = "30"
> > > >
> > > > -LAYERSERIES_COMPAT_arm-toolchain = "zeus"
> > > > +LAYERSERIES_COMPAT_arm-toolchain = "zeus dunfell"
> > > >
> > > >  # do not error out on bbappends for missing recipes
> > > >  BB_DANGLINGAPPENDS_WARNONLY = "true"
> > > > -
> > > > diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
> > > > index 65ccd15..0b93e8d 100644
> > > > --- a/meta-arm/conf/layer.conf
> > > > +++ b/meta-arm/conf/layer.conf
> > > > @@ -10,4 +10,4 @@ BBFILE_PATTERN_meta-arm = "^${LAYERDIR}/"
> > > >  BBFILE_PRIORITY_meta-arm = "6"
> > > >
> > > >  LAYERDEPENDS_meta-arm = "core"
> > > > -LAYERSERIES_COMPAT_meta-arm = "warrior zeus"
> > > > +LAYERSERIES_COMPAT_meta-arm = "warrior zeus dunfell"
> > > > --
> > > > 2.7.4
> > > >
> > >
> > > >
> > >
> >
> > >
> >
> > 
> >

> 

