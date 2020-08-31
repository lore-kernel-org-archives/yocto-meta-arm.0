Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web10.62859.1598905687387909139
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 31 Aug 2020 13:28:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=x2cszCcU;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.65, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f65.google.com with SMTP id o2so3271675qvk.6
        for <meta-arm@lists.yoctoproject.org>; Mon, 31 Aug 2020 13:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TuK4g1ydHajIfmfTbRD3kXDXsX7dPnZ5/yb0CrO5EuY=;
        b=x2cszCcU9SaTZShwVSDS0XCwDRe38la6SXNWcfJlyrTEZuMqCBnWmyaBahZKcKypQ/
         UXbEbt58aXbOZaJW3JoSOjGGctloFEJI8zbru6rXa6YCuvwV/S9I2/GxLa/YqKdr8859
         9cqVXZ6i4cEmTEgGMMCckC93XgYDLRL/QKxRBEy5xKE3HjleDUCuqkw5DXGRTI7/ioNU
         Z3ypjP2NmUMiYf1Ur3/uiNnFDQKPM5GYyGTk1xrrj+Hq0IpE0okhwNJxyFDUT9R8oJZA
         GqJ6wBnVhP5ui8KMBfBzbWogMbKLER7vSbTFnuFluXLuQ+qqaAvv3gVhSv9Zzfpcjz/R
         OVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TuK4g1ydHajIfmfTbRD3kXDXsX7dPnZ5/yb0CrO5EuY=;
        b=c1g7z983CySDhmM47dvd54ngsdEj3km141FPxOyhwhJc//IaTTOc5VtvxxxdDi+SXj
         dBdeVdcK/AIA1qUkCw8Hm4v51N0LMLu1Tz3S2FLwMVlQ4jjQ5os6CfMC4LEcgw7sd+hF
         USYmpQFtJTcGbdd3vfnUv8mCMxOAOmSCoxONnqVd3H1mIeHKqpfBFIHqCXeGFT+9PvT5
         /yp80C+F5gcVCDTXNGIAmFjzJGDOyWNRBh7l/bAJBq7tbdaLv0wnri2rpCV06Fd1YrrA
         i16oC0jPp1Bl+wGDIExgXHdfRPrHG3QTzni2ftVWwchkEqHPTuaVQBDbdh9nACfN8dB2
         mJEQ==
X-Gm-Message-State: AOAM533l1hbcPJJgNIy3/46Z+1lWL7cATxoQFN7O7mfWiriE+ZKhI//F
	A/4JsnjaX/9PlSe5ldbeihe3B5aKZ6P28uf+
X-Google-Smtp-Source: ABdhPJzJncqUApytQK84DQDbvrtHfUnuGJ09x23TtyN0fnjaGnJjRNpvpM8fm5/uJ1eQ2zJFb4oLRA==
X-Received: by 2002:a0c:8b48:: with SMTP id d8mr2116065qvc.211.1598905686619;
        Mon, 31 Aug 2020 13:28:06 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id 7sm2487413qkh.60.2020.08.31.13.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 13:28:06 -0700 (PDT)
Date: Mon, 31 Aug 2020 16:28:01 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-bsp/trusted-firmware-a: reorder the build targets
Message-ID: <20200831202801.GD17615@kudzu.us>
References: <20200828104934.1325606-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200828104934.1325606-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 28, 2020 at 11:49:34AM +0100, Ross Burton wrote:
> Build the DTBs before the FIP, as the latter depends on the former to exist.
> 
> Change-Id: I6059805458b12cb87c2af77eb924778844dc88ec
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Pulled into master.

Thanks,
Jon

> ---
>  .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc
> index c685d7d..3aa8520 100644
> --- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc
> +++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc
> @@ -5,7 +5,7 @@ TFA_PLATFORM = "juno"
>  TFA_DEBUG = "1"
>  TFA_MBEDTLS = "1"
>  TFA_UBOOT = "1"
> -TFA_BUILD_TARGET = "bl1 bl2 bl31 fip dtbs"
> +TFA_BUILD_TARGET = "bl1 bl2 bl31 dtbs fip"
>  
>  # Juno needs the System Control Processor Firmware
>  DEPENDS += "virtual/control-processor-firmware"
> -- 
> 2.28.0
> 

> 

