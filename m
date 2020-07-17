Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web10.11137.1594991760110161454
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 17 Jul 2020 06:16:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=mNA1epUp;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.65, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f65.google.com with SMTP id m9so4207514qvx.5
        for <meta-arm@lists.yoctoproject.org>; Fri, 17 Jul 2020 06:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9/HSd2dYeOxczpHQ8zvK7ViXMddNQMzhG9B2VPEURiE=;
        b=mNA1epUppsdvSnDAgsLG7rVchVKeE2Afwchriymj6OsGDUT3v85wRuRxkH9eMNeNuc
         jqOTPUNrZn2WsPXtxwclszwla5b395R8LeKsEum+TsSc5oQjsiRMfStFkB6gvbjPzsVj
         8WwGGv5qQD2kFf9JF//Ck9xlmzXSdTwfHyO58ZeKtMty5+4+4vBOGNoh9kEdXBa7bzCm
         hgonikJBkgnFdy1pM9yOrQTQ4Nh/15kWDM1PvjVaIQdiuE0CMJWMGmE1YrVnSQM4zwOp
         zYkYiFW62o1QLdZl/YiAZs9FbzlSi/EMJX41H0cLc5P0Ya42mWR/wP5xp7oOETwMPUeY
         tzUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9/HSd2dYeOxczpHQ8zvK7ViXMddNQMzhG9B2VPEURiE=;
        b=Gueu422bqgydxAmQGCtgcr+EoM+WRjlnB6vT8Q6cLpkdM15eQIpNYIZxPn8TC7kH9b
         JoHfLt5d4TMceJBjZLPnpyu+kg5nsr4LFxByZA/C4kjVfLlSRSoR8FfAFRHIbqta/tsQ
         XPI2Q1S4pjwQNABk1cB6x+TASQK+foevOGs50xLoEF2CzcciGyr9ngmTy5tfYkrtR0YE
         W0nqxvGhIPwu99LZYps8osJhrqmEM9fXrlVK2JC33s0xPftkzx6U6Q5e/uXbBhmE8TPT
         QYKCf5+jwYUXa9tRJIHn4qiU7OHDV6NJVIkwJpy0FXIcuqpMsBiW6D1kqPUGNJe/9ZTo
         ntWw==
X-Gm-Message-State: AOAM532oAj/190TyjPBT/dND08e+Z0vR81a4xPUM6nBC3vsC0LsFMdYc
	0WcoaCWFpRFHtWY9gyz79ACIPA==
X-Google-Smtp-Source: ABdhPJzsH0WQWz40vum1WQX7GMPa0Fm7UVY3js3P28Vmr017KyKo1ACRotaOkxyjfataxeZv6uwG0Q==
X-Received: by 2002:a0c:dc8c:: with SMTP id n12mr8862927qvk.221.1594991759042;
        Fri, 17 Jul 2020 06:15:59 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:8034:b667:f1cd:123f])
        by smtp.gmail.com with ESMTPSA id q5sm11824930qtf.12.2020.07.17.06.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 06:15:58 -0700 (PDT)
Date: Fri, 17 Jul 2020 09:15:57 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] Limit legacy compatibility to dunfell
Message-ID: <20200717131556.GF26434@kudzu.us>
References: <20200715125921.3460-1-jon.mason@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200715125921.3460-1-jon.mason@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 15, 2020 at 08:59:20AM -0400, Jon Mason wrote:
> Layers are only being tested against dunfell and gatestgarth.  Limit the
> layer compatibility to only those versions.
> 
> Change-Id: Ib4df617d8991b1c9096b8feaad9228174319bf11
> Signed-off-by: Jon Mason <jon.mason@arm.com>

Applied to master.

Thanks,
Jon

> ---
>  meta-arm-bsp/conf/layer.conf       | 2 +-
>  meta-arm-toolchain/conf/layer.conf | 2 +-
>  meta-arm/conf/layer.conf           | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
> index bcf08ad..816ff9d 100644
> --- a/meta-arm-bsp/conf/layer.conf
> +++ b/meta-arm-bsp/conf/layer.conf
> @@ -10,4 +10,4 @@ BBFILE_PATTERN_meta-arm-bsp = "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-arm-bsp = "6"
>  
>  LAYERDEPENDS_meta-arm-bsp = "core meta-arm meta-kernel"
> -LAYERSERIES_COMPAT_meta-arm-bsp = "warrior zeus dunfell"
> +LAYERSERIES_COMPAT_meta-arm-bsp = "dunfell gatesgarth"
> diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
> index 800d15d..6ab98af 100644
> --- a/meta-arm-toolchain/conf/layer.conf
> +++ b/meta-arm-toolchain/conf/layer.conf
> @@ -12,7 +12,7 @@ BBFILE_PRIORITY_arm-toolchain = "30"
>  LICENSE_PATH += "${LAYERDIR}/custom-licenses"
>  
>  LAYERDEPENDS_arm-toolchain = "core"
> -LAYERSERIES_COMPAT_arm-toolchain = "zeus dunfell"
> +LAYERSERIES_COMPAT_arm-toolchain = "dunfell gatesgarth"
>  
>  # do not error out on bbappends for missing recipes
>  BB_DANGLINGAPPENDS_WARNONLY = "true"
> diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
> index 10a7951..14a5922 100644
> --- a/meta-arm/conf/layer.conf
> +++ b/meta-arm/conf/layer.conf
> @@ -13,4 +13,4 @@ LAYERDEPENDS_meta-arm = " \
>      core \
>      arm-toolchain \
>  "
> -LAYERSERIES_COMPAT_meta-arm = "warrior zeus dunfell"
> +LAYERSERIES_COMPAT_meta-arm = "dunfell gatesgarth"
> -- 
> 2.17.1
> 

> 

