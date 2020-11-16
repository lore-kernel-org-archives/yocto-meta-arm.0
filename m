Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web08.35336.1605536830206993447
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 16 Nov 2020 06:27:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=YBvlju7n;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f194.google.com with SMTP id n132so16900063qke.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 16 Nov 2020 06:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=b7sxlkuExbNErOen/Z20pkWoNqmy41rbPvKm0+sECjs=;
        b=YBvlju7noyYALsYCruN8NErW0tb6d8ErKhrSH8xabwTFLLmZxEWeNp0KSTB4Qit3Ru
         oefRsiYxaWX0blBeF0VQd0iHlQ6Bs8UxAFXPHCcgGHIS8kpwGpDB+6r1C3GHEHDi0hss
         SFwokXgPyvhsKPWy0bRQPl/Kw2ZZ4NtvsZiB7u5l/8LvNvUL3h+f1OZay/3zDEo259Qi
         cks5WBCPaPAOgCGhfkIOgKCtoYzrCmxSZB20OBxmzep1y3LmMyP9p6aVdSZjUQna/Jc0
         6AxSfMxTvHi/lqJ+CPTX1KwurKVF0YuJSXwGJIVGSNwzXsK0qG/BPg7tuFfGOud9nIJh
         eH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=b7sxlkuExbNErOen/Z20pkWoNqmy41rbPvKm0+sECjs=;
        b=MsDuaWLzP1U37Nxv265jr5dHUav9BsnT1GGh9mcc6CgpyFy5/u2NaVWQ+183nJQD5l
         M4WBi/2hHtNNCRp7sJXCSXymlrm9TFVEwe0liWbfz8J3uLnihM/T2Fx4qKP908m69faZ
         qP2AezQC7GGS39w+tdv67liucENLErwX0H2wy98BFWre81nIgStJ+LBiY8Pc0k+ddfxL
         Pi2tYzuiFUhYP+Tpi9gNGAOlypaVfZXFLrs8qTqXyziU9kXREMOobt48MYzySBnPJc3G
         d04jx5G1yFa+diJX3ExkD51AEW7zCOxB1o36CPfU09Yjv43Jh3mEbI/mwD5AYnCU4Aip
         FkVg==
X-Gm-Message-State: AOAM530jvOGj+XnZcRTXIu2KFNoeZHmNVSXnAbXiyajR3ttZja2mNvuJ
	CaJKVPeWgLX4oknSWrndE8c7NmaRtIRPiA==
X-Google-Smtp-Source: ABdhPJyZYKw4Uo8ixhHBLCR83B+98vOUoUyxdq25jMEGJtOJz8eXt+PmmBDPZ4eF1+T/n7oTgzMetg==
X-Received: by 2002:a05:620a:1389:: with SMTP id k9mr14214367qki.46.1605536829308;
        Mon, 16 Nov 2020 06:27:09 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:8d8f:f072:1037:de6f])
        by smtp.gmail.com with ESMTPSA id a7sm11990969qth.41.2020.11.16.06.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 06:27:08 -0800 (PST)
Date: Mon, 16 Nov 2020 09:27:07 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/2] gem5/gem5-aarch64-native: don't specify -j twice
Message-ID: <20201116142706.GF20627@kudzu.us>
References: <20201113164836.3926050-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201113164836.3926050-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 13, 2020 at 04:48:35PM +0000, Ross Burton wrote:
> There's no need to pass -j here as the scons clas does this already.
> 
> Also, BB_NUMBER_THREADS is the number of BitBake threads, not the number
> of parallel make jobs.
> 
> Change-Id: Ib6179bf05c5ec57b7cbe9c045f7bea86518d35af
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Applied to master.

Thanks,
Jon

> ---
>  meta-gem5/recipes-devtools/gem5/gem5-native.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-gem5/recipes-devtools/gem5/gem5-native.inc b/meta-gem5/recipes-devtools/gem5/gem5-native.inc
> index 1df94d0..3c891ba 100644
> --- a/meta-gem5/recipes-devtools/gem5/gem5-native.inc
> +++ b/meta-gem5/recipes-devtools/gem5/gem5-native.inc
> @@ -10,7 +10,7 @@ LICENSE = "BSD & MIT & LGPLv2.1"
>  GEM5_BUILD_CONFIGS ?= "build/X86/gem5.opt"
>  
>  # Scons build arguments
> -GEM5_SCONS_ARGS ?= "-j ${BB_NUMBER_THREADS} CC=${BUILD_CC} CXX=${BUILD_CXX} \
> +GEM5_SCONS_ARGS ?= "CC=${BUILD_CC} CXX=${BUILD_CXX} \
>      AS=${BUILD_AS} AR=${BUILD_AR} ${GEM5_BUILD_CONFIGS} \
>      PYTHON_CONFIG=python3-config"
>  
> -- 
> 2.25.1
> 

> 
> 
> 

