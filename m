Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web09.23951.1617033717852025586
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Mar 2021 09:01:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=1Ommi2Xn;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id g20so12904666qkk.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 29 Mar 2021 09:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XjiUs5S2l0clU80ZPx7knZrrcNRYevkSmX8o78YNl14=;
        b=1Ommi2Xnn0ni0B4LrY7hdB0KgKVfZaYwkcIEnoIQDt1iC4v4PRU9F1IUybQvAnHAtD
         WJEL2fmCJ4rOpa3Wdr9qSAD96Y4ZHq3gp64Xc6lCUKCvDV5ucGoGlxWJAjwebybG+VET
         rJYWblw45Pmd1uA1z3zD92OzH1Xco+VfOMIyMeYE7WDPtO30WxxX6sF8ha6/fWnu8mmb
         tXe8MAaklWAlpuO+YBxONrorAk102vc+q31bpxtVb+YM43Av0OZOhj9XSufoCrhcY5Bg
         m+/DTZM6aXePTtTju3YY3lchPmN4pDc1bfPWkOUw+MRduhPlbVI/39kjsS6RrZ0IFqM7
         BxrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XjiUs5S2l0clU80ZPx7knZrrcNRYevkSmX8o78YNl14=;
        b=MXlIPhEzVwRIec5xgtrFWX61Ayorcu3kD+kLm/Q1vsMzCbCWnhqluu5/nkyJDd0RRl
         cKH4GecoMrv8S4LzP7Ev1jut9ltqMkxLZ6UC8FobGCCUfmOw/qqfX6nI5AkNEdlRWijO
         eTSRZEDagPrhtoso7+k038TuwgmKJD3t7XokYPr/9lx3dpDuXNi5gIL8lItueUVAcdbT
         MqCCwRODQvvgfWk2ARgTKEfPjki6KR9Oe2Pk9wCslaxUb+ijk8G6z8CHvHnBxmWG7FrC
         fAdhIzbChRVrd0X0lYbou+pqHOwpEQ4CneI5eybk3Cqpb7ZzikrfahE7iUnx4zTh2GmD
         R6OQ==
X-Gm-Message-State: AOAM5309SaIIdSI6pQZBS3LklEyvFzUSbZ79UoK3/DbVGAXd1ozdbwFR
	/BQok8KPUr78LO4P1cjDYG2U+A==
X-Google-Smtp-Source: ABdhPJxLAwdoA+c1aGLHDrhKtriQqD92VvwZxYL+62OpTKRYcoyNkWlr6Wc0MhXtM7n+PJJtF3CISg==
X-Received: by 2002:ae9:e008:: with SMTP id m8mr26434060qkk.17.1617033716998;
        Mon, 29 Mar 2021 09:01:56 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a601:f800:f5a9:734d:58ab:be1e])
        by smtp.gmail.com with ESMTPSA id c19sm12782648qkl.78.2021.03.29.09.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 09:01:56 -0700 (PDT)
Date: Mon, 29 Mar 2021 12:01:55 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/2] arm-bsp/juno: move tf-a version from 2.3 to 2.4
Message-ID: <20210329160154.GB32356@kudzu.us>
References: <20210326124431.3085123-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210326124431.3085123-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 26, 2021 at 12:44:30PM +0000, Ross Burton wrote:
> From: Damodar Santhapuri <damodar.santhapuri@arm.com>
> 
> Move trusted-firmware-a version to 2.4 for juno
> 
> Change-Id: Ib6e6e5537a7ecb2246d3f96b4beb8893cea605dc
> Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
> ---

Patches in mater.

Thanks,
Jon

>  meta-arm-bsp/conf/machine/juno.conf                             | 2 +-
>  .../trusted-firmware-a/trusted-firmware-a_2.3.bbappend          | 1 -
>  .../trusted-firmware-a/trusted-firmware-a_2.4.bbappend          | 1 +
>  3 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arm-bsp/conf/machine/juno.conf b/meta-arm-bsp/conf/machine/juno.conf
> index 8cff6c4..0e84dd3 100644
> --- a/meta-arm-bsp/conf/machine/juno.conf
> +++ b/meta-arm-bsp/conf/machine/juno.conf
> @@ -21,7 +21,7 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
>  PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
>  PREFERRED_VERSION_linux-yocto ?= "5.4%"
>  PREFERRED_VERSION_scp-firmware ?= "2.6%"
> -PREFERRED_VERSION_trusted-firmware-a ?= "2.3%"
> +PREFERRED_VERSION_trusted-firmware-a ?= "2.4%"
>  PREFERRED_VERSION_u-boot ?= "2020.07"
>  
>  EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot firmware-image-juno"
> diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
> index f5f1632..3c7460f 100644
> --- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
> +++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
> @@ -1,6 +1,5 @@
>  # Machine specific TFAs
>  
>  MACHINE_TFA_REQUIRE ?= ""
> -MACHINE_TFA_REQUIRE_juno = "trusted-firmware-a-juno.inc"
>  
>  require ${MACHINE_TFA_REQUIRE}
> diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.bbappend
> index 36a9e93..bdcdb53 100644
> --- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.bbappend
> +++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.bbappend
> @@ -5,6 +5,7 @@ MACHINE_TFA_REQUIRE_corstone500 = "trusted-firmware-a-corstone500.inc"
>  MACHINE_TFA_REQUIRE_corstone700 = "trusted-firmware-a-corstone700.inc"
>  MACHINE_TFA_REQUIRE_fvp-base = "trusted-firmware-a-fvp.inc"
>  MACHINE_TFA_REQUIRE_fvp-base-arm32 = "trusted-firmware-a-fvp-arm32.inc"
> +MACHINE_TFA_REQUIRE_juno = "trusted-firmware-a-juno.inc"
>  MACHINE_TFA_REQUIRE_n1sdp = "trusted-firmware-a-n1sdp.inc"
>  MACHINE_TFA_REQUIRE_tc0 = "trusted-firmware-a-tc0.inc"
>  
> -- 
> 2.25.1
> 

> 
> 
> 

