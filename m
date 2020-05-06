Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web11.3465.1588780849365230725
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 06 May 2020 09:00:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=fg7njkPi;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.66, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f66.google.com with SMTP id ck5so964817qvb.11
        for <meta-arm@lists.yoctoproject.org>; Wed, 06 May 2020 09:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QfJ2ResY+mMq9iJ9s1uXACqXaroh6rvHkZcQznZXkK8=;
        b=fg7njkPiTYn9gtoIMvyoKkZgHTlsnHjQH+X2lM8RyF+n6umCYoIgFxRkbI07L1t4Ax
         6rlalCvnbc/jP9mX3kQDy1Ps+e3Hh6nVf3AyHI7AH/mpl5SNhouZQ6WOXzwESxvxXkQP
         4nj7mqn96NE4n7oNH0ZbKcRPUwZk1BXt2g9qOgwwgGF7Bb2RpeABjtRILm9hr6lowU5P
         bAhGKfXaPjLZaYPz91QILgqQsYoSCyPrBdTq+bLmNN9MCIg1rrQV/KGNLt+Lq8WO2Ev4
         ZsX5ZyRhVZaEfdKa2VhA1GGm7t+L0GiAQmplVw/zwsjrWTnDMQypkCPsJFBRHNCsbHOl
         AzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QfJ2ResY+mMq9iJ9s1uXACqXaroh6rvHkZcQznZXkK8=;
        b=OxjbtHggCR1BqnEPw38lGp4nZQqUgdE6iI5tzW0Fgg1kgkHio4Xi4o6PV7XS1NdwGq
         fWAtm58E2neTtjGjlC17Wg9v2zrsdryTlQN5NBwwQNeQo5jW+yHBi0TXqYwqNFjMuCc4
         Fuz7+fSN/WcR39AzTOBpboSHM54bysWI235CQZ//wzi0WoPKhWLK20JcINU8bW/PDvRQ
         MNMnwHi2EXNUzW7MULdjWWNOxBtp3w8Fa4Uj7Ez0P8LDo4YZsttvqCMTirUtEd4MRXEJ
         HdTGPDetT24lLFBztpmpa0WLykmzsEQNT/1YNnSSKtITxbolCmwmSwZG5ChRDQjN7mAy
         aQbA==
X-Gm-Message-State: AGi0PuZXCdcKVVHLfOSOQbuZ1O1PBEUepC+sEcW7RT5qTn4T+Uv4zkHg
	5CE0aHKYFkzAjAU3lfmoupD4jHTrKxVn7w==
X-Google-Smtp-Source: APiQypIlPuN/P1+UsGV74R49RpRVL4UPSUmTwU6O84pE701ijCzUXZR92LsfQ+ZeJquLiTlQGRBu3g==
X-Received: by 2002:ad4:54c3:: with SMTP id j3mr8818665qvx.241.1588780848148;
        Wed, 06 May 2020 09:00:48 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:1068:4212:6fd:289b])
        by smtp.gmail.com with ESMTPSA id s8sm1910077qtb.0.2020.05.06.09.00.47
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 09:00:47 -0700 (PDT)
Date: Wed, 6 May 2020 12:00:46 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 2/2] [arm-autonomy] Have meta-arm-bsp specific bbappends as BBFILES_DYNAMIC
Message-ID: <20200506160046.GE22996@kudzu.us>
References: <1588254663-86702-1-git-send-email-diego.sueiro@arm.com>
 <1588254663-86702-2-git-send-email-diego.sueiro@arm.com>
 <92E490B5-C071-439F-BBD2-A6396CB1FE9B@arm.com>
MIME-Version: 1.0
In-Reply-To: <92E490B5-C071-439F-BBD2-A6396CB1FE9B@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 30, 2020 at 02:26:42PM +0000, Bertrand Marquis wrote:
> 
> 
> > On 30 Apr 2020, at 14:51, Diego Sueiro via lists.yoctoproject.org <diego.sueiro=arm.com@lists.yoctoproject.org> wrote:
> > 
> > The boot-wrapper-aarch64_%.bbappend and firmware-image-juno.bbappend
> > should be only considered when meta-arm-bsp layer is present.
> > 
> > Change-Id: Id66a989820675a281946a26b9afec6d5b3d29bca
> > Issue-Id: SCM-984
> > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> 
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Pulled into the master branch.

Thanks,
Jon

> 
> > ---
> > meta-arm-autonomy/conf/layer.conf                                      | 3 +++
> > .../recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend  | 0
> > .../meta-arm-bsp}/recipes-bsp/images/firmware-image-juno.bbappend      | 0
> > .../meta-arm-bsp}/recipes-bsp/images/firmware-image-juno/images-r0.txt | 0
> > .../meta-arm-bsp}/recipes-bsp/images/firmware-image-juno/images-r1.txt | 0
> > .../meta-arm-bsp}/recipes-bsp/images/firmware-image-juno/images-r2.txt | 0
> > .../meta-arm-bsp}/recipes-bsp/images/firmware-image-juno/uEnv.txt      | 0
> > 7 files changed, 3 insertions(+)
> > rename meta-arm-autonomy/{ => dynamic-layers/meta-arm-bsp}/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend (100%)
> > rename meta-arm-autonomy/{ => dynamic-layers/meta-arm-bsp}/recipes-bsp/images/firmware-image-juno.bbappend (100%)
> > rename meta-arm-autonomy/{ => dynamic-layers/meta-arm-bsp}/recipes-bsp/images/firmware-image-juno/images-r0.txt (100%)
> > rename meta-arm-autonomy/{ => dynamic-layers/meta-arm-bsp}/recipes-bsp/images/firmware-image-juno/images-r1.txt (100%)
> > rename meta-arm-autonomy/{ => dynamic-layers/meta-arm-bsp}/recipes-bsp/images/firmware-image-juno/images-r2.txt (100%)
> > rename meta-arm-autonomy/{ => dynamic-layers/meta-arm-bsp}/recipes-bsp/images/firmware-image-juno/uEnv.txt (100%)
> > 
> > diff --git a/meta-arm-autonomy/conf/layer.conf b/meta-arm-autonomy/conf/layer.conf
> > index de79bdf..83c149d 100644
> > --- a/meta-arm-autonomy/conf/layer.conf
> > +++ b/meta-arm-autonomy/conf/layer.conf
> > @@ -29,3 +29,6 @@ ARM_AUTONOMY_DISTRO_CFGDIR = "${LAYERDIR}/conf/distro/include/"
> > # Add class to handle arm-autonomy distro extensions
> > USER_CLASSES_append = " arm-autonomy-features"
> > 
> > +BBFILES_DYNAMIC += " \
> > +    meta-arm-bsp:${LAYERDIR}/dynamic-layers/meta-arm-bsp/*/*/*.bbappend \
> > +"
> > diff --git a/meta-arm-autonomy/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend
> > similarity index 100%
> > rename from meta-arm-autonomy/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend
> > rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend
> > diff --git a/meta-arm-autonomy/recipes-bsp/images/firmware-image-juno.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend
> > similarity index 100%
> > rename from meta-arm-autonomy/recipes-bsp/images/firmware-image-juno.bbappend
> > rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend
> > diff --git a/meta-arm-autonomy/recipes-bsp/images/firmware-image-juno/images-r0.txt b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r0.txt
> > similarity index 100%
> > rename from meta-arm-autonomy/recipes-bsp/images/firmware-image-juno/images-r0.txt
> > rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r0.txt
> > diff --git a/meta-arm-autonomy/recipes-bsp/images/firmware-image-juno/images-r1.txt b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r1.txt
> > similarity index 100%
> > rename from meta-arm-autonomy/recipes-bsp/images/firmware-image-juno/images-r1.txt
> > rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r1.txt
> > diff --git a/meta-arm-autonomy/recipes-bsp/images/firmware-image-juno/images-r2.txt b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r2.txt
> > similarity index 100%
> > rename from meta-arm-autonomy/recipes-bsp/images/firmware-image-juno/images-r2.txt
> > rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r2.txt
> > diff --git a/meta-arm-autonomy/recipes-bsp/images/firmware-image-juno/uEnv.txt b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/uEnv.txt
> > similarity index 100%
> > rename from meta-arm-autonomy/recipes-bsp/images/firmware-image-juno/uEnv.txt
> > rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/uEnv.txt
> > -- 
> > 2.7.4
> > 
> > 
> 

> 

