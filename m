Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.5862.1615985846115054953
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Mar 2021 05:57:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=uJ36DM3o;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f179.google.com with SMTP id h7so1262564qtx.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 17 Mar 2021 05:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2g65JKvWI++lmkmz91GL6VdLmAg6t7ndM2KlQV201BA=;
        b=uJ36DM3ol10NLj1chX44JdPNaOVQCnni0hghco1XOV2yEw9vtY/H5MuC1XTKOMCexv
         HtusKSteop97vQzqokDJt/mtLDiKggQDrPILCYsugLA2zxrn9qjwdeCnxBmKrBgIkizR
         dZOQd8v77lBq9tQtyJS6msfj4jdHsa52I3KSi6gnx+D5fXB6or9as8JqsNdK7Uf39MAA
         YkSYI+Ny6V6DhW2ZKWUciGc7tHyEj4lNo7oDO+iorhN/kEnHh4Lve/KQp7R7/lYOo3KB
         XR5nUQMf9vmCQkOFnfvivAdsmYRPrKswU05Rh1zDFi+2ymSGV82P8LJ2nMPBAhm4mKuj
         GKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2g65JKvWI++lmkmz91GL6VdLmAg6t7ndM2KlQV201BA=;
        b=YXs/hX2r8zzQuq2UpDLNveFfJyfaoqBhMxqv3G6KNqlZrNMUcDSdDF+aIYF8eFyaRm
         GNvW0xBlYlkI1nmZFYtaThgU9No57aHRDvK81X82lDesKp8fjeyFoujARrVc3S1gPp66
         CdzDVoyEefGqYHEVr1BpoOs0zJjMUEP9P8pRwJBXNvLuCm8djzo85qJs+4DrZgNeYPA4
         L3r/yo6Xs32QEGJcNoGhEILs2KZfKP/XhyE2OMK1PUVTdOhtiW/8E3haOaKP2rr++oNb
         3UZ7aBtN6E58YsvwvylFwC5m/8xktp4C5zEywC2aJZwoa9XcOQV0rCU7WYfz5BNCKaUG
         0nyQ==
X-Gm-Message-State: AOAM5318rGgSgjdiJrSm0fQ87HCX6ECeW3qjJobSRmdPxE59pwZovIKL
	oM97OogDJYVwY80rvWwWbVIcdA==
X-Google-Smtp-Source: ABdhPJyXoWfbCDGUHFK4JDlda9Dd8HB/jTcF9VjLUzQGXlwogPaOQDm+iYH4swtFiHW+N9k3jgLkog==
X-Received: by 2002:ac8:4543:: with SMTP id z3mr3885782qtn.286.1615985845093;
        Wed, 17 Mar 2021 05:57:25 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a601:f800:ec25:3ae9:5fa2:9872])
        by smtp.gmail.com with ESMTPSA id w197sm17088332qkb.89.2021.03.17.05.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 05:57:24 -0700 (PDT)
Date: Wed, 17 Mar 2021 08:57:23 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] layers: add hardknott to compatible release branches
Message-ID: <20210317125722.GA31574@kudzu.us>
References: <20210316210921.3215579-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210316210921.3215579-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 16, 2021 at 09:09:21PM +0000, Ross Burton wrote:
> Upstream oe-core is preparing to be the Hardknott release, so add
> hardknott to our compatible release list.
> 
> Once hardknott is public we should remove gatesgarth.
> 
> Change-Id: Ia5c59e703910db96a3967a1ecad074ac80d03ee9
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Pulled into master

Thanks,
Jon

>  meta-arm-autonomy/conf/layer.conf  | 2 +-
>  meta-arm-bsp/conf/layer.conf       | 2 +-
>  meta-arm-toolchain/conf/layer.conf | 2 +-
>  meta-arm/conf/layer.conf           | 2 +-
>  meta-gem5/conf/layer.conf          | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/meta-arm-autonomy/conf/layer.conf b/meta-arm-autonomy/conf/layer.conf
> index d577a55..2372af6 100644
> --- a/meta-arm-autonomy/conf/layer.conf
> +++ b/meta-arm-autonomy/conf/layer.conf
> @@ -17,7 +17,7 @@ LAYERDEPENDS_meta-arm-autonomy = " \
>     networking-layer \
>     virtualization-layer \
>  "
> -LAYERSERIES_COMPAT_meta-arm-autonomy = "gatesgarth"
> +LAYERSERIES_COMPAT_meta-arm-autonomy = "gatesgarth hardknott"
>  
>  # We don't activate virtualization feature from meta-virtualization as it
>  # brings in lots of stuff we don't need. We need to disable the sanity check
> diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
> index 445697f..622f89e 100644
> --- a/meta-arm-bsp/conf/layer.conf
> +++ b/meta-arm-bsp/conf/layer.conf
> @@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-arm-bsp"
>  BBFILE_PATTERN_meta-arm-bsp = "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-arm-bsp = "5"
>  
> -LAYERSERIES_COMPAT_meta-arm-bsp = "gatesgarth"
> +LAYERSERIES_COMPAT_meta-arm-bsp = "gatesgarth hardknott"
>  
>  LAYERDEPENDS_meta-arm-bsp = "core meta-arm"
>  # This won't be used by layerindex-fetch, but works everywhere else
> diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
> index 1a0499d..2e53e42 100644
> --- a/meta-arm-toolchain/conf/layer.conf
> +++ b/meta-arm-toolchain/conf/layer.conf
> @@ -12,7 +12,7 @@ BBFILE_PRIORITY_arm-toolchain = "5"
>  LICENSE_PATH += "${LAYERDIR}/custom-licenses"
>  
>  LAYERDEPENDS_arm-toolchain = "core"
> -LAYERSERIES_COMPAT_arm-toolchain = "gatesgarth"
> +LAYERSERIES_COMPAT_arm-toolchain = "gatesgarth hardknott"
>  
>  # do not error out on bbappends for missing recipes
>  BB_DANGLINGAPPENDS_WARNONLY = "true"
> diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
> index 9649738..9116563 100644
> --- a/meta-arm/conf/layer.conf
> +++ b/meta-arm/conf/layer.conf
> @@ -13,4 +13,4 @@ LAYERDEPENDS_meta-arm = " \
>      core \
>      arm-toolchain \
>  "
> -LAYERSERIES_COMPAT_meta-arm = "gatesgarth"
> +LAYERSERIES_COMPAT_meta-arm = "gatesgarth hardknott"
> diff --git a/meta-gem5/conf/layer.conf b/meta-gem5/conf/layer.conf
> index e29c940..055d50f 100644
> --- a/meta-gem5/conf/layer.conf
> +++ b/meta-gem5/conf/layer.conf
> @@ -10,7 +10,7 @@ BBFILE_PATTERN_meta-gem5 = "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-gem5 = "5"
>  
>  LAYERDEPENDS_meta-gem5 = "core openembedded-layer meta-arm"
> -LAYERSERIES_COMPAT_meta-gem5 = "gatesgarth"
> +LAYERSERIES_COMPAT_meta-gem5 = "gatesgarth hardknott"
>  
>  BBFILES_DYNAMIC += " \
>      virtualization-layer:${LAYERDIR}/dynamic-layers/meta-virtualization/*/*/*.bbappend \
> -- 
> 2.25.1
> 

> 
> 
> 

