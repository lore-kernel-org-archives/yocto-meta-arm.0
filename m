Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web11.13344.1608045442794629751
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 15 Dec 2020 07:17:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=jcnrw7pj;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f194.google.com with SMTP id h4so14516761qkk.4
        for <meta-arm@lists.yoctoproject.org>; Tue, 15 Dec 2020 07:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NTz6j1xH2yx7QZiSt2qj0yp/cgnhr5W77n0ohE3fwis=;
        b=jcnrw7pjXEI1FACBIdwnE71wzkLOc3uWsoa3mkZhnaDB/91J/gfGBKPPAoydIlfSMh
         kVprdD+1aoKv7LrPWc0Mwq1YO2RhjO/pB+R1sWsnWtxDRB0Lk5yO876PaZ6YYMLuA1uK
         BnZs4qgqlk5DedrciL2XjCXvDJuGcsu6xC5Q0rlzh6DOfiRzPOU6d2EL3iFuXo0L4rPo
         m1xvS8lwiCOPgV9vHeqvrKrsEqHpI3DNw9v64CxXHLM+mT6p8jR0Tj+8eePChY5oX9zx
         enWBpesgtfzzdkMnD/K+W28AsBqWGYF+pGwmN5uDwn2oWRlO8gpiNBwbfP4+nxjwl+Pi
         hERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NTz6j1xH2yx7QZiSt2qj0yp/cgnhr5W77n0ohE3fwis=;
        b=sTxFNXbfM8EWrFkQgUbZHWwzbCM0TefNk75NXsULm/kMj5z3a8jVMbfxea1+0SfLzs
         ZKNC43UZIE8foRc3z+GuGKW8Zh7TASqBDoN6hpFgk4Hk0Si7dzG0p24CPd4X31VflMb6
         w+ZSGtDrXyiXtToUPz5Yrx6NaFEeQMXxZG+Hs9hIqD5uXwb+dpMF+mga/aYb9y2aGYWy
         WbYdKC5uC9R/ORat75sXUPYZUfnU14Rc7u85eVcGzcgEpJMwV0Q78o0tK2JfutnDqbIq
         GDiNbS+XtEsN7Byk2FYokm/iYHnoq5nwMIy8zxh1QH4O7p2Lc+yo+EWsz46NAGbU52rG
         KEww==
X-Gm-Message-State: AOAM531dMB2WNDkjuxB0J6BkS/tUWtD9HkHv9thtWo4pQQFr/L0OtCBX
	APcf0BrYVy8L38l68UGSqu5tGw==
X-Google-Smtp-Source: ABdhPJxok1Im4T00mns/wsiZPX5T+RU88c/Pr1XuToj6LJ0vdwEvOMW/gfhKGFSYnV3Wk81u8Fhz7A==
X-Received: by 2002:a05:620a:15e3:: with SMTP id p3mr33481355qkm.397.1608045441641;
        Tue, 15 Dec 2020 07:17:21 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a606:1b00:4438:99f1:e83e:f284])
        by smtp.gmail.com with ESMTPSA id o21sm15676222qko.9.2020.12.15.07.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 07:17:21 -0800 (PST)
Date: Tue, 15 Dec 2020 10:17:19 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/7] arm/optee: add upstream tag regex
Message-ID: <20201215151719.GG20024@kudzu.us>
References: <20201215092030.2723188-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201215092030.2723188-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 15, 2020 at 09:20:24AM +0000, Ross Burton wrote:
> So that the automatic latest upstream release detection works correctly,
> specify what release tags look like.
> 
> Change-Id: Ibc43aecd3cb4def85e2f1549d16f5bcb27cfb703
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Series applied to master.

Thanks,
Jon

> ---
>  meta-arm/recipes-security/optee/optee-client.inc | 2 ++
>  meta-arm/recipes-security/optee/optee.inc        | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/meta-arm/recipes-security/optee/optee-client.inc b/meta-arm/recipes-security/optee/optee-client.inc
> index 88a9483..f697386 100644
> --- a/meta-arm/recipes-security/optee/optee-client.inc
> +++ b/meta-arm/recipes-security/optee/optee-client.inc
> @@ -13,6 +13,8 @@ SRC_URI = " \
>      file://tee-supplicant.sh \
>  "
>  
> +UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
> +
>  S = "${WORKDIR}/git"
>  
>  EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON"
> diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/recipes-security/optee/optee.inc
> index 8aaf616..6f6f26d 100644
> --- a/meta-arm/recipes-security/optee/optee.inc
> +++ b/meta-arm/recipes-security/optee/optee.inc
> @@ -1,3 +1,5 @@
> +UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
> +
>  COMPATIBLE_MACHINE ?= "invalid"
>  COMPATIBLE_MACHINE_qemuarm64 ?= "qemuarm64"
>  # Please add supported machines below or set it in .bbappend or .conf
> -- 
> 2.25.1
> 

> 
> 
> 

