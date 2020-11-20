Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web12.173.1605888754596766039
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 20 Nov 2020 08:12:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=zaSlmwMo;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f194.google.com with SMTP id y197so9343257qkb.7
        for <meta-arm@lists.yoctoproject.org>; Fri, 20 Nov 2020 08:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=P8p1E+ojfX8hL6eAEta6B57R67CGVh0YAEyUgzLoui4=;
        b=zaSlmwMosA3mFtehkrSQ8zQX25MF/cX8aryfMHke3OjwpnVVPxcDEwXVmqN/o9wzG3
         FC+nbEZdO0YRzxR71oHdJDOCT7lpqxvjHFen66Yaa1uq0no5fraEw1/ijN3NqapAVniL
         1/AayaQg05idvwCNoyyOr5UyCwoDbERyaEc7l4ivPehJioNwFL5qNDudzDkLvP2dRGSF
         JmQ0dn8lo2TXJQ2CYJpL3dpg3Z8uq7Yhl5nokIMPpA+xMNRxfXqewjDuxfkwsyWd0DEH
         3C+ZGFdJaQ5J/SuLNx5gR2jmJLXa5WJh5gpAD/Ch6p05n3kvnoQNuGklJYmRKZeZiA1M
         hBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=P8p1E+ojfX8hL6eAEta6B57R67CGVh0YAEyUgzLoui4=;
        b=ExTuMG4aEI57K9y36xIocpqDBXKawyqK31ag1FUnHfRG6X4yWdWOW23gs/MmQDOJU4
         3oHqatcHuF+c6axjpr7kibVUrEYzpAAuj/S9CBBgnBBPSnPPBc+J6QQeufeTPkjQj5+j
         kNUKe5nZRrjOoBeQqueOKXF3114SZkffdC1h1g3o8W0En2zY+qIxO6IFSA8UeaPA5AVp
         zOBCaWDNc+fSFwnUxBcYDlYgDPK6Z8hyqtwQYm+bIn3Pk4Ae78jy5rxthYcuccnbYHRl
         R4tCvKpWKgbNzvjtnyODVoTc2NXWaj3M+I5ujeJQnwk+qdNR9xJ7ZBawEHXzJrDku4ix
         9dBg==
X-Gm-Message-State: AOAM5331mtpWSfTkH/IIUyLvAcRhs/MhK2lWxmr7tduDUNsrXYLtsQDp
	w2FnsNldN0gDzVxixfnJ6gQzbA==
X-Google-Smtp-Source: ABdhPJxV599V1kJk+fbWb6HxbQa8X4VSsULvjtw13WpRSue6T8PbKm4JVYl4npGpNjZ5UWB1cfK3vw==
X-Received: by 2002:a37:d13:: with SMTP id 19mr16227940qkn.489.1605888753751;
        Fri, 20 Nov 2020 08:12:33 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a606:1b00:1180:47ef:a8ed:94a9])
        by smtp.gmail.com with ESMTPSA id y35sm2435210qty.58.2020.11.20.08.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 08:12:33 -0800 (PST)
Date: Fri, 20 Nov 2020 11:12:31 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/5] arm-bsp/fvp-common: explicitly select trusted-firmware-a 2.3
Message-ID: <20201120161231.GC4483@kudzu.us>
References: <20201120134506.1494232-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201120134506.1494232-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 20, 2020 at 01:45:02PM +0000, Ross Burton wrote:
> These BSPs don't select a version of trusted-firmware-a, for clarity and
> allow smooth upgrades explictly select 2.3.
> 
> Change-Id: Ieea7d075d709e2006ebf217d802f3eeecfb9a281
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Applied to master.

Thanks,
Jon

> ---
>  meta-arm-bsp/conf/machine/fvp-common.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arm-bsp/conf/machine/fvp-common.inc b/meta-arm-bsp/conf/machine/fvp-common.inc
> index ad08c0e..841760e 100644
> --- a/meta-arm-bsp/conf/machine/fvp-common.inc
> +++ b/meta-arm-bsp/conf/machine/fvp-common.inc
> @@ -32,6 +32,7 @@ PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
>  PREFERRED_VERSION_linux-yocto ?= "5.4%"
>  
>  PREFERRED_VERSION_u-boot ?= "2020.07"
> +PREFERRED_VERSION_trusted-firmware-a ?= "2.3%"
>  
>  EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot"
>  
> -- 
> 2.25.1
> 

> 
> 
> 

