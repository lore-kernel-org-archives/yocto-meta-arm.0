Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web11.19189.1591965791646860560
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Jun 2020 05:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=Ktmh6Mma;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.66, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f66.google.com with SMTP id di13so4250811qvb.12
        for <meta-arm@lists.yoctoproject.org>; Fri, 12 Jun 2020 05:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DTffsUj0DrLIxG7ore4Z4O9A3O6YX7ciLR48GIYTXTI=;
        b=Ktmh6Mmaj/YvhDqOyrRIrB6QNnnW/zKTe8VJtUQBC1hLlYqpAAyQoeEtczmVKZLqLr
         LByuzT81+FhO4v/+7Sb2a7GRj2jfRzVhKxz3Ley3hMhex+8yP3GF9mP8kJy433hI/Isn
         orptilQhU+DT/DYUDRADx5fC8wOpf/Y9fnFEIiZ4I0Eg6HiNNgQL2MwH9ITl8s4flxui
         hDsqrZSN//4KvbuCiPzeXvzTSbVMNNbZIJ2eyj2aDEUFHZHsUVUKKGufOyu6Y9bJBxaF
         RMMOk2EfXfjTHS4vNJAjQgFdPanaI2Z4T4lfIj9fJDtdhffvwL6pRihox5pQwjTsCkSg
         Px4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DTffsUj0DrLIxG7ore4Z4O9A3O6YX7ciLR48GIYTXTI=;
        b=bN7ib9W1k5DeL9AFcSJ/MJIqdwXAhS7moC8RHjqqpM9XWgz/63xLUGky9yndMWIAzd
         u4+qI42B5V/3VSXQnmQVqKZ6qqXJFLqYja9KFtnkVBHz6Swz3LbF7mbSJjPt2pHPjJI/
         4MiH6rnL3mdysgYL0VtDQ0A0Osvr9iAMr5uYHWNfujz8ixcj89qochsqQ7EZ8pUhlkrd
         RMPM23hXZ7wUv1qshiQSpsYZlU0pVthCrEjThyPfdhkPC79JrKfHVbb9RcrJ6AEI6ffP
         Vno70g/CR+4GoFtEHXBFoerGbqU73rPCFd5J7K9FuYusxRDMWOwRJmOWuuhmf1KGyM3w
         onmw==
X-Gm-Message-State: AOAM533AkztV5qITtF+Yszzc01P2PfLO98So2CzZHbJ+ZXlj/4xrbEwW
	WakGqbKrDqN3zFZadDid8nX40A==
X-Google-Smtp-Source: ABdhPJyTzKEaq7WEj0cFjyP4LP+CjtkOA1UpBnuX6j1YkwnEqh1Lb/6Ay03CMZxIlqjpCQ7I9mqGrw==
X-Received: by 2002:a05:6214:1705:: with SMTP id db5mr12293254qvb.14.1591965790627;
        Fri, 12 Jun 2020 05:43:10 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:d487:8053:cdd4:dbb0])
        by smtp.gmail.com with ESMTPSA id n13sm5122576qtb.20.2020.06.12.05.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 05:43:10 -0700 (PDT)
Date: Fri, 12 Jun 2020 08:43:08 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Jon Mason <jon.mason@arm.com>, meta-arm@lists.yoctoproject.org,
	nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-bsp: Fix gem5 build break
Message-ID: <20200612124307.GA14746@kudzu.us>
References: <20200611124826.29927-1-jon.mason@arm.com>
 <20200611173620.GB17660@denix.org>
MIME-Version: 1.0
In-Reply-To: <20200611173620.GB17660@denix.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 11, 2020 at 01:36:20PM -0400, Denys Dmytriyenko wrote:
> On Thu, Jun 11, 2020 at 08:48:26AM -0400, Jon Mason wrote:
> > OE-core removed DEPLOY_DIR_TOOLS, which is causing a build break on gem5
> > due to DEPLOY_DIR_TOOLS usage.  Temporarily define it in the recipe to
> > get it working.
> 
> It's coming back, it's in master-next of OE-Core now:
> https://git.openembedded.org/openembedded-core/commit/?h=master-next&id=6a6cb9bcf97dfad636ab782c1d337003a9118a82

Alright.  I'd prefer to wait rather than apply and revert.  So,
dropping this patch.

Thanks,
Jon

> 
> 
> > Change-Id: I8d4d6e73009cab8ad7102045b855afcad34d3bf3
> > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > ---
> >  meta-arm-bsp/conf/machine/gem5-arm64.conf | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/meta-arm-bsp/conf/machine/gem5-arm64.conf b/meta-arm-bsp/conf/machine/gem5-arm64.conf
> > index 4db86c9..fc31bcf 100644
> > --- a/meta-arm-bsp/conf/machine/gem5-arm64.conf
> > +++ b/meta-arm-bsp/conf/machine/gem5-arm64.conf
> > @@ -51,3 +51,5 @@ EXTRA_IMAGEDEPENDS += "gem5-aarch64-native"
> >  # rngd (Part of rng-tools) takes ~7 mins to init resulting in a slow boot time.
> >  PACKAGE_EXCLUDE_append = " rng-tools"
> >  IMAGE_INSTALL_append = " haveged"
> > +
> > +DEPLOY_DIR_TOOLS = "${DEPLOY_DIR}/tools"
> > -- 
> > 2.17.1
> > 
> 
> > 
> 

> 

