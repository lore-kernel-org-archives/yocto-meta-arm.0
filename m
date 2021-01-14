Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.479.1610652324047155685
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 14 Jan 2021 11:25:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=ixF5JpHN;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f180.google.com with SMTP id h4so9412279qkk.4
        for <meta-arm@lists.yoctoproject.org>; Thu, 14 Jan 2021 11:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JijIrebE3Vi/EJWvv0i06OfsDwd3SLaH7ivx36FWm74=;
        b=ixF5JpHNMB3f5Ms1Pe2IM8aFaxsun2X7NzO7mgx3kaHEcSWknvNzWa8lCQx9lnaorO
         vREF/TtIE6W/NVSVPJIXjH1w46KQhZMGLWfd2VMgDU/LU+2S4+KmX4JgjGW/0WlFIdTx
         SjI17j/Yd05UzQEEJrUbrSPVIK6/ArlARDvNSrX0boPmeO93/Ktx69CU3rSgycOHOqaw
         7KT4Q6RVFI0EXtrCFF9LeT/B7zE6Kgkd9yip4R51D1BpRQ+GrQVv3hMppbD5t22x6mb+
         Q3T7XyexFaw8c6WxnJm8QzxGvGnKj/HW7dqdWJBPaR5elbebPsMR6xqcuFmedwsiKtO7
         M/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JijIrebE3Vi/EJWvv0i06OfsDwd3SLaH7ivx36FWm74=;
        b=qNppR7CkFgzf6IhYBk+pYFk/YWEFoXQoy9PMQp5LzkUVYk15h6fU5LG1p5ghLRGSk1
         UKga5BrWBxGPMNWdQySB3ri8Oqc9oA73AXGlSBWxdf8e033UMlfWiqlwXbXl4uMM52Nz
         cURvRN0BlWCdsEbCMi+fyZtNZ7WfVYaT1Ln6kqwKvJRvSJwsRm9Edaos7uRnOD2bXpvl
         J94KXq6IEoW+OeOjGjjR/tXkhLXruo/643wK8MGn9esbOxTNlnA0/MMLP8IjG8OmkjTL
         EchsCedTx6WX2zqpRKEqTfN1mBC87q7Nuo3fcaNay/R0d4fG/Mwwt8ZIcJV8sJ9uCHfW
         5Aog==
X-Gm-Message-State: AOAM530nvjA9Qb7PiPaROXT/6F0Ow0CytxGrRNH1Lu4plS6cJbxV/B0W
	+bvqgRBbwvsXCQpL+YQtfPV9drgNT7Kfvg==
X-Google-Smtp-Source: ABdhPJwMJFXzRMbkM84foNWXFjWPWQMovpmxpioT25xYeOZcr8ps6K2CHVDL7PysRlqll3NpAArktQ==
X-Received: by 2002:a37:a57:: with SMTP id 84mr8832329qkk.218.1610652323263;
        Thu, 14 Jan 2021 11:25:23 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a62f:6d00:1d40:95cb:6898:8d5])
        by smtp.gmail.com with ESMTPSA id f24sm3488987qkk.89.2021.01.14.11.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 11:25:23 -0800 (PST)
Date: Thu, 14 Jan 2021 14:25:21 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/2] gem5: use GEM5_RUN_PROFILE in DTB generation
Message-ID: <20210114192521.GK511@kudzu.us>
References: <20210114111619.2170401-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210114111619.2170401-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 14, 2021 at 11:16:18AM +0000, Ross Burton wrote:
> From: Adrian Herrera <adrian.herrera@arm.com>
> 
> Allows to generate DTBs from profiles other than baremetal.py, which is
> the default established by the layer.
> 
> Signed-off-by: Adrian Herrera <adrian.herrera@arm.com>
> Change-Id: Ic990bd6751e473756d0739f421dce4b8f98248d7
> ---

Series pulled into master.

Thanks,
Jon

>  meta-gem5/recipes-devtools/gem5/gem5-aarch64-dtb.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-dtb.bb b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-dtb.bb
> index b97a1b2..50ac030 100644
> --- a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-dtb.bb
> +++ b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-dtb.bb
> @@ -11,7 +11,7 @@ do_configure[noexec] = "1"
>  do_compile() {
>      # generate a dtb using gem5
>      gem5.opt \
> -        ${STAGING_DATADIR_NATIVE}/gem5/configs/example/arm/baremetal.py \
> +        ${STAGING_DATADIR_NATIVE}/gem5/${GEM5_RUN_PROFILE} \
>          --dtb-gen
>  
>      if [ ! -f m5out/system.dtb ]; then
> -- 
> 2.25.1
> 

> 
> 
> 

