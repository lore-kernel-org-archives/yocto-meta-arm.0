Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web11.5857.1594299305547313926
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Jul 2020 05:55:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=lN8z9m/p;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.196, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f196.google.com with SMTP id r22so1578325qke.13
        for <meta-arm@lists.yoctoproject.org>; Thu, 09 Jul 2020 05:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ah/iw5RlKpXgluSHd3hiIpdMKqOqypvMmZ0bKofrjXU=;
        b=lN8z9m/ppy10T5dItYZ3nFPiAKVl4rN5JxmA3Ha0uB25ntv38P7BaKEB1KrVQr2mz2
         S3CRNdrDDHgYEQyrQjjX4kGMsjlBWocQjHz8MK/7JgK8BcBvvXCc6Ro/R9zc0dpdraHU
         Qw3pCloY2G7UW8Fxsw3IC+Clb6UFvCJotsd8jEDLVBZxN9veivMR5ad80eEr4vBaef6l
         JfhcVDFmCK/Yecu5PA9rh0U1CQtocx4DMy19gJwRW8k5yFy3Qx2gIjU6qbvrS8PijPyR
         6mk8MxWVsV323dPc/4Kg0iFW7CyJh/urd1STKBu41ABQhXU2dQwHZF0fMip+VauPv2Mr
         sblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ah/iw5RlKpXgluSHd3hiIpdMKqOqypvMmZ0bKofrjXU=;
        b=eNcAZGKYjDkTMeGwIbVhEdRJ/WDuP/0dggQYsOn+RXEjEFRxsEs3jocGNXakRG9j+v
         2F6VMkhSDOFaw0zdKZIu3kXCqVu1LJy/g64m09jHi8OYUfoRKxaDNG9U0dBMsuZWlX5D
         T01dwy1gbSxaRXPGti032wBPsqNi/ekQkrVI7/+WmXxFQgDgFvC2hEV2LXFJMlQ3k9tX
         8Qb41JHOydLPrLOZ83eUeJdlEoQULfXT3HFWWKq+Imr8u0o1JivSqWISIbbThDY4X6zs
         /9rTALlJDPi3E91VISHENHSvbXneEQb/oYARnOvgnibz+E7H8cOMhdWz1VlTYD+BkV+D
         C2Yw==
X-Gm-Message-State: AOAM531Nrg57aqVmDRI6fdU+vxYjbdfuCiBnVPZryKs+i5u1MUZqkPug
	p6CUH4hcgskPwVZxiiCqOiCodEJBnqie2g==
X-Google-Smtp-Source: ABdhPJyKvl+YClzZsRgcB4AbXHpK3FKIdvVUlM3h7c+gNHm6pw7ZRPMei1UQrzMxH/REiyRubOloKQ==
X-Received: by 2002:a05:620a:13fb:: with SMTP id h27mr59740145qkl.466.1594299304745;
        Thu, 09 Jul 2020 05:55:04 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:5416:c1ad:e833:f407])
        by smtp.gmail.com with ESMTPSA id z1sm3257276qkl.74.2020.07.09.05.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 05:55:04 -0700 (PDT)
Date: Thu, 9 Jul 2020 08:55:02 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Khasim Mohammed <khasim.mohammed@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-bsp/wic: add default wks file to create EFI disk image
Message-ID: <20200709125502.GC9023@kudzu.us>
References: <20200701152024.16320-1-khasim.mohammed@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200701152024.16320-1-khasim.mohammed@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 01, 2020 at 08:50:24PM +0530, Khasim Mohammed wrote:
> Creates a partitioned EFI disk image that the user
> can directly dd to boot media. The selected bootloader is grub-efi.
> 
> Change-Id: I1a5e8bc953274cdcc1840b27351d8e6444b2c5ab
> Issue-Id: PLATFORMS-3134
> Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>

Applied to master.

Thanks,
Jon

> ---
>  meta-arm-bsp/conf/machine/n1sdp.conf | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
> index 755bb09..318b2d0 100644
> --- a/meta-arm-bsp/conf/machine/n1sdp.conf
> +++ b/meta-arm-bsp/conf/machine/n1sdp.conf
> @@ -15,6 +15,9 @@ IMAGE_FSTYPES += "tar.bz2 ext4"
>  
>  SERIAL_CONSOLES = "115200;ttyAMA0"
>  
> +# Set default WKS
> +WKS_FILE ?= "${@bb.utils.contains("EFI_PROVIDER", "systemd-boot", "systemd-bootdisk.wks", "mkefidisk.wks", d)}"
> +
>  # Use kernel provided by linaro (Contains support for SCMi or HDMI)
>  PREFERRED_PROVIDER_virtual/kernel ?= "linux-linaro-arm"
>  PREFERRED_VERSION_linux-linaro-arm ?= "5.4%"
> -- 
> 2.17.1
> 

> 

