Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
 by mx.groups.io with SMTP id smtpd.web12.17064.1602781033065253548
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 15 Oct 2020 09:57:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=o8iuDz2a;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.196, mailfrom: jdmason@kudzu.us)
Received: by mail-il1-f196.google.com with SMTP id y16so5041858ila.7
        for <meta-arm@lists.yoctoproject.org>; Thu, 15 Oct 2020 09:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yyi+6Ya/sQiYUARHIbsIpglzhlGqV0SIh6lL2W4k7oU=;
        b=o8iuDz2atVJF06dwqBTxHjD1bfJOsEqHVvy/YlDkKKrMVV4IE/QbPtI9uokh3kcFOw
         /s8HgpNmxniQDvTd1XV2ZulKgAowZ1KfkpQvQvNWe1HL4F5+hiIAxPi8M78psm9xVWPo
         CtXr3OJXNZ3ZmoPFYWNwnFKAvgLZFrTaDtgLFEueld3gnagaL3l1psU6SKcN+/2uXUks
         INGeJKg5uHedJxXzh/UW8VJ9/GNafFJvGyz3UjrbGQ51vsV6jGZHxyEYuHUtQfGIn9Zq
         ChTJ7GmL09mM/dfJwN7gTFkMw0JcWCvrCzWpBhsPOjeZs5maQ/IzWAQ695abcR8kw/A4
         1+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yyi+6Ya/sQiYUARHIbsIpglzhlGqV0SIh6lL2W4k7oU=;
        b=bwwW3nU989wgqteDaSxfcW1rks8r/uL/YHr6NVCszWixuzE7AVyaUIvM48jNN0PHe0
         cIaUCtQ/YVFeSFQkGILcnLnkQTjegAggZS7uvgaEVfCXVaYZgZ6PCFXbK/jgxmWAV0Q4
         Z/mSep4ko3p++jXJLC2p1B+Sv8HcRhrcRyccWZeXdUEhC3o5S8Myf2EQW0pkVUz+6iLk
         wT+Obgmp8ti/loqSNiaGqXCV60uw1SAOb7Jo2BbF1xypS0E/ILZVTw2ddmsk/09TBga2
         Qr6Dj96lZXjtbxdR3MyKXaSV2zxsLlQEk8Jr4owMQpIKDULI2PEbzG9Tewu+Lbpz8Abt
         pH2A==
X-Gm-Message-State: AOAM530mI6kBEH2FBTvg1Rf/WvBnecm8MV4lPercFoDYuMie14Njf5eW
	a5PYXE6I9uq93/pIBReAaRLO5F+PCERqUfYs
X-Google-Smtp-Source: ABdhPJyGPCVC7GCc9h3nx9rmp8ht4q5WNFjrtKOb5e8C796UlObjsQ3mNjyV0T2ulwX4nV2kjDlFZQ==
X-Received: by 2002:a92:dcc7:: with SMTP id b7mr3858631ilr.210.1602781032433;
        Thu, 15 Oct 2020 09:57:12 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id v18sm2959334ilj.12.2020.10.15.09.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 09:57:12 -0700 (PDT)
Date: Thu, 15 Oct 2020 12:57:07 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-bsp/musca-*: use newlib for libc
Message-ID: <20201015165706.GB9521@kudzu.us>
References: <20201014155214.2936166-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201014155214.2936166-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 14, 2020 at 04:52:14PM +0100, Ross Burton wrote:
> Whilst glibc is definitely not an option for Cortex-M cores, newlib is
> a viable libc implementation that is useful to default too.
> 
> Change-Id: I1f3a53e43945f486aa2e7bce019f105c55df5e87
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Pulled into master.

Thanks,
Jon

> ---
>  meta-arm-bsp/conf/machine/musca-b1.conf | 2 +-
>  meta-arm-bsp/conf/machine/musca-s1.conf | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arm-bsp/conf/machine/musca-b1.conf b/meta-arm-bsp/conf/machine/musca-b1.conf
> index 40964be..50b2f05 100644
> --- a/meta-arm-bsp/conf/machine/musca-b1.conf
> +++ b/meta-arm-bsp/conf/machine/musca-b1.conf
> @@ -10,7 +10,7 @@ PREFERRED_VERSION_trusted-firmware-m = "1.0"
>  require conf/machine/include/tune-cortexm33.inc
>  
>  # GLIBC will not work with Cortex-M.
> -TCLIBC = "baremetal"
> +TCLIBC = "newlib"
>  
>  # For runqemu
>  require conf/machine/include/qemu.inc
> diff --git a/meta-arm-bsp/conf/machine/musca-s1.conf b/meta-arm-bsp/conf/machine/musca-s1.conf
> index d2e5ab7..66e0a35 100644
> --- a/meta-arm-bsp/conf/machine/musca-s1.conf
> +++ b/meta-arm-bsp/conf/machine/musca-s1.conf
> @@ -10,4 +10,4 @@ PREFERRED_VERSION_trusted-firmware-m = "1.0"
>  require conf/machine/include/tune-cortexm33.inc
>  
>  # GLIBC will not work with Cortex-M.
> -TCLIBC = "baremetal"
> +TCLIBC = "newlib"
> -- 
> 2.25.1
> 

> 
> 
> 

