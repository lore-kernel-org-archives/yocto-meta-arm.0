Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web12.10727.1607708087055608742
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Dec 2020 09:34:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=wEUEVCdO;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f177.google.com with SMTP id 19so9169510qkm.8
        for <meta-arm@lists.yoctoproject.org>; Fri, 11 Dec 2020 09:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=upbe7eoag7yQCg4IseqbQMdFTXNPy+JO8YEBLsGEALw=;
        b=wEUEVCdOSww549G+aFC6JlrJLGRwVXIeRP3UYDseXfV65KOjnFPnpeh9PGm+ZsCQJk
         0J3DvKpbMye5eJwPssRdG7Or9aSxZ0k9XUWxPHkGVinDQ9HEeajmiiWJScpfL7LQ7Aj0
         +o9zMlMyjjaPLEtR8mN3TjsyQwAwD05/6tJ3/1uIZXoPUBpAV5CDMZF2Z3aGt+uDYBMN
         wgmRFnH6a8lhGhGgQDiKVuFQ6Nk3rUc4pZWYp5lCoNo3X2w1l7RPJ7DrAecrClKBlMNj
         2C/m+zDPNfxH8SL7hEv54QPRYTzNQV5cVmWI5+81B+sHVLH2dsZ3aTaUagtUgy/kKNeS
         92LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=upbe7eoag7yQCg4IseqbQMdFTXNPy+JO8YEBLsGEALw=;
        b=rryUrA9J7RrSGoVaQO/ZsBAgZYStjHkKwJAHrRt4JQ36A5tjDWZvIEtcd6RnhPoxmR
         0JBZDe6v33tpp6kxAZfoUU7iUq9OTFFXQUQa6O8vUhfjzk/lT3w66vypSPy/K5aoRZ/s
         dsu5oSKgoUfqrW+p2qjMit5P/mSNdjL+M+D06xOm4XxD1KpHt7rTRhGhg6EaY9Q+HYhz
         rM7iNWwfQi0+bz4o5VomqBZmS/wCOdF6VKpaOi5SKCfIucYXKnkl7PgkKYJiarIYAlzG
         D5p0Z25VtofBHsjRzP7eoYT5sd2vp1j3ktsoTXmnaEx9dWg1352xxnXXwL9bPq012N0i
         DbhQ==
X-Gm-Message-State: AOAM533HGqhQ8yHK+AEUSW22CWM0AdKGJGdYphlWJEuolHLA8COem6DY
	Qkgq9gaMmZZZPWA4nDsmJxqrhw==
X-Google-Smtp-Source: ABdhPJx1Y3tQtFQT/G/6u99Mveg9FCFu0M06gJhcd0/ViEcZovnairNBeZFUyDivPUc6QiGtWU5QVg==
X-Received: by 2002:a37:6790:: with SMTP id b138mr16651953qkc.465.1607708086219;
        Fri, 11 Dec 2020 09:34:46 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a606:1b00:c15a:fc65:abe1:c5b4])
        by smtp.gmail.com with ESMTPSA id n9sm6975797qti.75.2020.12.11.09.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 09:34:45 -0800 (PST)
Date: Fri, 11 Dec 2020 12:34:44 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] layers: consolidate layer priority to match oe-core
Message-ID: <20201211173443.GA21671@kudzu.us>
References: <20201210141915.1499208-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201210141915.1499208-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 10, 2020 at 02:19:15PM +0000, Ross Burton wrote:
> Without exceptional justification there is no good reason for layers to
> have a priority other than 5, to match oe-core.  If a layer has a
> priority higher than oe-core's then recipes in that layer take immediate
> preference over those in oe-core and there's no simple way to resolve
> this as that is exactly what is meant to happen.
> 
> As a concrete example, meta-arm-bsp contains older releases of U-Boot
> for platforms that have not yet moved to the latest release in oe-core.
> As the priority of meta-arm-bsp is higher, simply adding this layer to a
> qemuarm build will immediately downgrade u-boot.
> 
> As there is no exceptional justification for the differing priorities,
> unify on 5.
> 
> Change-Id: I1975753b4a9799cc00310a7c8a6a11c2aef41f65
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Applied to master

Thanks,
Jon

> ---
>  meta-arm-autonomy/conf/layer.conf  | 2 +-
>  meta-arm-bsp/conf/layer.conf       | 2 +-
>  meta-arm-toolchain/conf/layer.conf | 2 +-
>  meta-gem5/conf/layer.conf          | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-arm-autonomy/conf/layer.conf b/meta-arm-autonomy/conf/layer.conf
> index 936b6c1..dee0c01 100644
> --- a/meta-arm-autonomy/conf/layer.conf
> +++ b/meta-arm-autonomy/conf/layer.conf
> @@ -9,7 +9,7 @@ BBFILES += " \
>  
>  BBFILE_COLLECTIONS += "meta-arm-autonomy"
>  BBFILE_PATTERN_meta-arm-autonomy = "^${LAYERDIR}/"
> -BBFILE_PRIORITY_meta-arm-autonomy = "6"
> +BBFILE_PRIORITY_meta-arm-autonomy = "5"
>  LAYERDEPENDS_meta-arm-autonomy = " \
>     core \
>     yocto \
> diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
> index 8374012..445697f 100644
> --- a/meta-arm-bsp/conf/layer.conf
> +++ b/meta-arm-bsp/conf/layer.conf
> @@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
>  
>  BBFILE_COLLECTIONS += "meta-arm-bsp"
>  BBFILE_PATTERN_meta-arm-bsp = "^${LAYERDIR}/"
> -BBFILE_PRIORITY_meta-arm-bsp = "6"
> +BBFILE_PRIORITY_meta-arm-bsp = "5"
>  
>  LAYERSERIES_COMPAT_meta-arm-bsp = "gatesgarth"
>  
> diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
> index d0ca75a..1a0499d 100644
> --- a/meta-arm-toolchain/conf/layer.conf
> +++ b/meta-arm-toolchain/conf/layer.conf
> @@ -6,7 +6,7 @@ BBFILES += "\
>  
>  BBFILE_COLLECTIONS += "arm-toolchain"
>  BBFILE_PATTERN_arm-toolchain := "^${LAYERDIR}/"
> -BBFILE_PRIORITY_arm-toolchain = "30"
> +BBFILE_PRIORITY_arm-toolchain = "5"
>  
>  # Additional license directories.
>  LICENSE_PATH += "${LAYERDIR}/custom-licenses"
> diff --git a/meta-gem5/conf/layer.conf b/meta-gem5/conf/layer.conf
> index 58242c3..a6448eb 100644
> --- a/meta-gem5/conf/layer.conf
> +++ b/meta-gem5/conf/layer.conf
> @@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
>  
>  BBFILE_COLLECTIONS += "meta-gem5"
>  BBFILE_PATTERN_meta-gem5 = "^${LAYERDIR}/"
> -BBFILE_PRIORITY_meta-gem5 = "6"
> +BBFILE_PRIORITY_meta-gem5 = "5"
>  
>  LAYERDEPENDS_meta-gem5 = "core openembedded-layer"
>  LAYERSERIES_COMPAT_meta-gem5 = "gatesgarth"
> -- 
> 2.25.1
> 

> 
> 
> 

