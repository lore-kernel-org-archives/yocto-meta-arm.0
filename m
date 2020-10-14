Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web10.9345.1602672990331968616
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Oct 2020 03:56:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=E3Rg+HqN;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f193.google.com with SMTP id r8so1891910qtp.13
        for <meta-arm@lists.yoctoproject.org>; Wed, 14 Oct 2020 03:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BFvog4U7woljGCC6iL2s/bl9idiWyJX0MWsUuTsj0vw=;
        b=E3Rg+HqNb3LsKqdNzj++1WRQyOD0P5ettQXZE5hdeHiF7bh+4G3G+b6tefnVJW6jKm
         K8Bj1KN1rmZKjTJuuVRi0zB2WqiTzE+t5QpTxkM7jCEcNNREM7SZHJq0E3iyJ3APjJtu
         TW7cWEEK08uc3n4i7TC8iRPNnpMrjV5NtgprqTvDMKPRekht8gsIpjmf5BE/Kw+RlKTW
         svpVi72Oebxf/sN1vmlhIsfFB6GmKcs/9g0xoEWBPFT/c3b627gYPd8IY4F4YqgGNPfF
         2vIuAMAXu4fgnnvtx15KJJMmvhpQ2JAO6oqTeLaqmJO8xOKmMKhe4/SB0l0q4D/PnrL8
         qlNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BFvog4U7woljGCC6iL2s/bl9idiWyJX0MWsUuTsj0vw=;
        b=T05bdkWSEK+2dHEqYYeg0NTvGGPzj7xVNX+1gQ0/PpoJEGHzpkWP/Ja+KxSb5cXDCW
         i+v/RrmQZcbNIDFP0EAUQoUnCV+EkMwVLvs2mmUJmk63pvlrFmKcv6sPI7i0OIS3PopN
         tQpbnSBM9D204yIo9HIrMEWJEHzCtouTX0OeMN0aLFOw8tXq2cQCLc5O6r56DICEJSeB
         j0TDh7yDiSnfT7d/k3jimtpJ4nxtllHWY252VHJr4nlcKP0unIVOR7A6VB5VY9JH4B0Z
         mkfT0QcQwNhy/egl5G6bm3MxubYbbCIHuThgky6ktFdeylfmczAL2pWXtCzOdEPwEVI+
         da3w==
X-Gm-Message-State: AOAM532gdwDubzFerOKGe9cvCE/mEvnYIKw4fYBIMEvKX9VnMxnzJnJl
	q24lQoeJHvc196Yrp0ePoPY/ng==
X-Google-Smtp-Source: ABdhPJze7kV3jxiKzq3F3GRSUfOLm62gU1RGdt0Mtmbz3qKiaU74DPSE09i/O3Xa4LZGDEs/nlsc5g==
X-Received: by 2002:ac8:3ffb:: with SMTP id v56mr4269866qtk.364.1602672989478;
        Wed, 14 Oct 2020 03:56:29 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id w5sm1061629qkf.31.2020.10.14.03.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 03:56:29 -0700 (PDT)
Date: Wed, 14 Oct 2020 06:56:26 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-bsp: fix cortexa32 tune
Message-ID: <20201014105626.GD5538@kudzu.us>
References: <20201012155524.30084-1-jon.mason@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201012155524.30084-1-jon.mason@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 12, 2020 at 11:55:24AM -0400, Jon Mason wrote:
> Cortex-A32 is 32bit only, but the recent changes had it working as
> 64bit (causing build breaks).  This reverts that change in this file.
> 
> Change-Id: I58115096477424127baf99712b96131d2a0b0497
> Signed-off-by: Jon Mason <jon.mason@arm.com>

Included in master, but all tunes are going to be dropped from
meta-arm-bsp very soon.

Thanks,
Jon

> ---
>  meta-arm-bsp/conf/machine/include/tune-cortexa32.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa32.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa32.inc
> index a11ab7b..e86de6c 100644
> --- a/meta-arm-bsp/conf/machine/include/tune-cortexa32.inc
> +++ b/meta-arm-bsp/conf/machine/include/tune-cortexa32.inc
> @@ -9,7 +9,7 @@ require conf/machine/include/arm/arch-armv8a.inc
>  AVAILTUNES += "cortexa32 cortexa32-crypto"
>  ARMPKGARCH_tune-cortexa32             = "cortexa32"
>  ARMPKGARCH_tune-cortexa32-crypto      = "cortexa32"
> -TUNE_FEATURES_tune-cortexa32          = "${TUNE_FEATURES_tune-armv8a-crc} cortexa32"
> +TUNE_FEATURES_tune-cortexa32          = "armv8a cortexa32 crc"
>  TUNE_FEATURES_tune-cortexa32-crypto   = "${TUNE_FEATURES_tune-cortexa32} crypto"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa32             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa32"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa32-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa32 cortexa32-crypto"
> -- 
> 2.17.1
> 

> 
> 
> 

