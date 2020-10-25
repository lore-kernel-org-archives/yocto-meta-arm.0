Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web12.26870.1603633354647696366
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 25 Oct 2020 06:42:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=W1vLvXGR;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f194.google.com with SMTP id j62so4871391qtd.0
        for <meta-arm@lists.yoctoproject.org>; Sun, 25 Oct 2020 06:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=C4I3Zp8KoftwcNf8Z8/1fUHAIO5mQKmznF6Fa86jT1s=;
        b=W1vLvXGRfpWynhHK2bKdYpnWFh6g/T5s1cLX0Cwt60T0XVan7xZIYCGkHNMPO9dYSW
         SdVMr7ml3NVY4TF+WPn0kJxjhvpX0Czun4NSwhqRcVgV/p4Iyy659FQKhhN3mYgZkgYR
         Oh6cmdk9Ueu4bHD1SiN4QSPriRlbC0MZIDqRTt0nOMncDWK9n/18MttBEjwluWzToBRo
         6JP1hfwuih4qQ0hU3qVkWgYOk7etNXrbZqGHZBwjXuUn50t+nqX35GMpzfZQCfJkwUiC
         kQKqXHY42MgIynYaMqH0E9EMiIf9tExQdq69t4at/bkPREvJj/w0laRimPu1Lugr9sVL
         NUog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=C4I3Zp8KoftwcNf8Z8/1fUHAIO5mQKmznF6Fa86jT1s=;
        b=Bov61BjculZmaKCf5tFCD5o3wKQcllmCQulfOLn6pJKFnbY7a8xcpULG2DRurdeq6t
         P+w8NkO1UUE2Dya1PaFxDQsk5NYwNUNGe1y8imcUiKmQHsMC6E89ZTa2LEGVmRdMze8P
         /wL4ubz7Ea9nmQOuLx5USZQRAk+gC+6uX47m9u8nmjC0xRHkVj5NRKRwmjpCoRfg2oxr
         8Q47PJzHeilVRJ5q9vK9xwC5JVvsx9t+RCHneKTda1IzwsdwMzNTDPvoLq/DWt2xDo4I
         6m7Z2BNrIAgKHkv1pi135vY9iPIdzIoBCvJIQ8PLF5eDZckTt4/DFvl4pQSqniIKEzsD
         Qncg==
X-Gm-Message-State: AOAM533FLvLEVKCWGEs81pjsjISKiEWqh7sVGlwtThOiI5lHnbWCsreO
	7NGO+ehaH5p5YhumVkkgBzDh2A==
X-Google-Smtp-Source: ABdhPJwKZUEmzbXaStRfiHRs3gXnsDcVgtIbJZQDD+GxP7eVlqBmHFrIstgqKp7iaOGlC8G4y3OyMw==
X-Received: by 2002:ac8:5bc2:: with SMTP id b2mr11989350qtb.284.1603633353626;
        Sun, 25 Oct 2020 06:42:33 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id l14sm4934235qti.34.2020.10.25.06.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 06:42:33 -0700 (PDT)
Date: Sun, 25 Oct 2020 09:42:28 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/3] Drop dunfell support
Message-ID: <20201025134227.GA8073@kudzu.us>
References: <20201017024126.28986-1-jon.mason@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201017024126.28986-1-jon.mason@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 16, 2020 at 10:41:24PM -0400, Jon Mason wrote:
> Drop dunfell support from the master branch in anticipation of the
> gatestgarth release.  All dunfell users should reference the dunfell
> branch.
> 
> Change-Id: I9c5806f698cca42773aaea1fb49e0dfff437eaf4
> Signed-off-by: Jon Mason <jon.mason@arm.com>

Series applied to master

Thanks,
Jon

> ---
>  meta-arm-autonomy/conf/layer.conf  | 2 +-
>  meta-arm-bsp/conf/layer.conf       | 2 +-
>  meta-arm-toolchain/conf/layer.conf | 2 +-
>  meta-arm/conf/layer.conf           | 2 +-
>  meta-gem5/conf/layer.conf          | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/meta-arm-autonomy/conf/layer.conf b/meta-arm-autonomy/conf/layer.conf
> index 5a439e2..936b6c1 100644
> --- a/meta-arm-autonomy/conf/layer.conf
> +++ b/meta-arm-autonomy/conf/layer.conf
> @@ -16,7 +16,7 @@ LAYERDEPENDS_meta-arm-autonomy = " \
>     openembedded-layer \
>     virtualization-layer \
>  "
> -LAYERSERIES_COMPAT_meta-arm-autonomy = "dunfell gatesgarth"
> +LAYERSERIES_COMPAT_meta-arm-autonomy = "gatesgarth"
>  
>  # We don't activate virtualization feature from meta-virtualization as it
>  # brings in lots of stuff we don't need. We need to disable the sanity check
> diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
> index 816ff9d..4de1bfa 100644
> --- a/meta-arm-bsp/conf/layer.conf
> +++ b/meta-arm-bsp/conf/layer.conf
> @@ -10,4 +10,4 @@ BBFILE_PATTERN_meta-arm-bsp = "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-arm-bsp = "6"
>  
>  LAYERDEPENDS_meta-arm-bsp = "core meta-arm meta-kernel"
> -LAYERSERIES_COMPAT_meta-arm-bsp = "dunfell gatesgarth"
> +LAYERSERIES_COMPAT_meta-arm-bsp = "gatesgarth"
> diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
> index 6ab98af..d0ca75a 100644
> --- a/meta-arm-toolchain/conf/layer.conf
> +++ b/meta-arm-toolchain/conf/layer.conf
> @@ -12,7 +12,7 @@ BBFILE_PRIORITY_arm-toolchain = "30"
>  LICENSE_PATH += "${LAYERDIR}/custom-licenses"
>  
>  LAYERDEPENDS_arm-toolchain = "core"
> -LAYERSERIES_COMPAT_arm-toolchain = "dunfell gatesgarth"
> +LAYERSERIES_COMPAT_arm-toolchain = "gatesgarth"
>  
>  # do not error out on bbappends for missing recipes
>  BB_DANGLINGAPPENDS_WARNONLY = "true"
> diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
> index d53c40a..9649738 100644
> --- a/meta-arm/conf/layer.conf
> +++ b/meta-arm/conf/layer.conf
> @@ -13,4 +13,4 @@ LAYERDEPENDS_meta-arm = " \
>      core \
>      arm-toolchain \
>  "
> -LAYERSERIES_COMPAT_meta-arm = "dunfell gatesgarth"
> +LAYERSERIES_COMPAT_meta-arm = "gatesgarth"
> diff --git a/meta-gem5/conf/layer.conf b/meta-gem5/conf/layer.conf
> index 439444c..58242c3 100644
> --- a/meta-gem5/conf/layer.conf
> +++ b/meta-gem5/conf/layer.conf
> @@ -10,4 +10,4 @@ BBFILE_PATTERN_meta-gem5 = "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-gem5 = "6"
>  
>  LAYERDEPENDS_meta-gem5 = "core openembedded-layer"
> -LAYERSERIES_COMPAT_meta-gem5 = "dunfell gatesgarth"
> +LAYERSERIES_COMPAT_meta-gem5 = "gatesgarth"
> -- 
> 2.17.1
> 

> 
> 
> 

