Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web12.9360.1614695294367698065
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 02 Mar 2021 06:28:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=rKDz9Jds;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f175.google.com with SMTP id q85so20308196qke.8
        for <meta-arm@lists.yoctoproject.org>; Tue, 02 Mar 2021 06:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MVfV0s3iZGnkOc6fgxt/Q0qS7dRgWJjvml5FW07jvBY=;
        b=rKDz9Jdsuns0KKvmO6NXXsAc7YLhzNfunkdfPpWn+gFVxBPuI9OnE2WIJtufVj8jY8
         wMU4ymP1g3zajUWDE8kfdWI93yw0jUmmlg5+JPS9Udvij6LGjgVQrNBR+8YleOLyh9if
         +fmle53jUHizaThIRgo7WhGmixRqK+3z1Dpu9ZhNfl/rQL8gZFDiXCJ/Q0NxbUS1Mqg2
         DcmMUVbT85I6jTVtpaj96FiaH52hCr1T1cWE582t89uzVjg6F2pgGr71qSjUkYHzFXFW
         fHla4obwZ7XRPq0MfuGa/02ClKq89JqIGur0OXf61au4HzAgL6/LEFI6xBvJ5yYDCVEM
         9bAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MVfV0s3iZGnkOc6fgxt/Q0qS7dRgWJjvml5FW07jvBY=;
        b=I5+mB5N91kM4019IVB2vBzHYKsSeWwgTmCQdCaT6S7l7VNkbM9tXb+61V3yjwBNARJ
         fLC0VuCIcnxail7OiNGN/ucZoAwEQFzFURSkVY15kdmoX8OClWNAMzUa3p3cRck6jTmh
         5T58N9Mu712kHVlfOB7zxSV+F7HIKRulidGNJi5c0o2UAhFKH27klbpwQsuXW3TeuSzj
         afCt4dBjUQdlgTxtGi6n+g5tWHS+fEnqJgDKbzPHAZ2N/PlrGQxO2OQzruimB5bbUw+O
         DJF7mtWcJjG/aTeknkVS7S0yNdIF11H3J+f7lM+T/H7X69aASDPcu4Cl+GDio7mPr1vV
         vfIw==
X-Gm-Message-State: AOAM531wISDRckhMRjeb0gbHCCtez45YspihNN+1PP5lYMnp8/13tla8
	BmZFi68iZC9y+CeTNQ+s1mPirw==
X-Google-Smtp-Source: ABdhPJxX3dETSGwRHGct82eq+YVq3vendQ3ocFzbHrXMpzLWYXvnvnfDyNrBwSAHSTFS2WfRP528hw==
X-Received: by 2002:a37:a715:: with SMTP id q21mr15554958qke.309.1614695293464;
        Tue, 02 Mar 2021 06:28:13 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a62f:6d00:b028:6684:bbdb:6f5e])
        by smtp.gmail.com with ESMTPSA id x7sm14998783qkf.111.2021.03.02.06.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 06:28:13 -0800 (PST)
Date: Tue, 2 Mar 2021 09:28:11 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com,
	Anders Dellien <anders.dellien@arm.com>
Subject: Re: [meta-arm] [PATCH 1/3] arm-bsp/fvp-base*: move to u-boot 2021.01
Message-ID: <20210302142810.GA25624@kudzu.us>
References: <ff23c6e49ff925107b7378afe0430ed4c6950b63.1614269958.git.diego.sueiro@arm.com>
MIME-Version: 1.0
In-Reply-To: <ff23c6e49ff925107b7378afe0430ed4c6950b63.1614269958.git.diego.sueiro@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 25, 2021 at 04:20:24PM +0000, Diego Sueiro wrote:
> From: Anders Dellien <anders.dellien@arm.com>
> 
> Move both FVP platforms to u-boot 2021.01
> 
> Change-Id: I764ff964025bb1a0266f4c91469372ed5ffffde2
> Signed-off-by: Anders Dellien <anders.dellien@arm.com>
> ---

Series applied to master.

Thanks,
Jon

>  meta-arm-bsp/conf/machine/fvp-common.inc                        | 2 +-
>  .../0001-Add-vexpress_aemv8a_aarch32-variant.patch              | 0
>  .../fvp-base/u-boot_vexpress_fvp.patch                          | 0
>  .../u-boot/{u-boot_2020.10.bbappend => u-boot_2021.01.bbappend} | 0
>  4 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta-arm-bsp/recipes-bsp/u-boot/{u-boot-2020.10 => u-boot-2021.01}/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch (100%)
>  rename meta-arm-bsp/recipes-bsp/u-boot/{u-boot-2020.10 => u-boot-2021.01}/fvp-base/u-boot_vexpress_fvp.patch (100%)
>  rename meta-arm-bsp/recipes-bsp/u-boot/{u-boot_2020.10.bbappend => u-boot_2021.01.bbappend} (100%)
> 
> diff --git a/meta-arm-bsp/conf/machine/fvp-common.inc b/meta-arm-bsp/conf/machine/fvp-common.inc
> index 94aa2bf..c4a5f6b 100644
> --- a/meta-arm-bsp/conf/machine/fvp-common.inc
> +++ b/meta-arm-bsp/conf/machine/fvp-common.inc
> @@ -31,7 +31,7 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
>  PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
>  PREFERRED_VERSION_linux-yocto ?= "5.10%"
>  
> -PREFERRED_VERSION_u-boot ?= "2020.10"
> +PREFERRED_VERSION_u-boot ?= "2021.01"
>  PREFERRED_VERSION_trusted-firmware-a ?= "2.4%"
>  
>  EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot"
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.10/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.01/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
> similarity index 100%
> rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.10/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
> rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.01/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.10/fvp-base/u-boot_vexpress_fvp.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.01/fvp-base/u-boot_vexpress_fvp.patch
> similarity index 100%
> rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.10/fvp-base/u-boot_vexpress_fvp.patch
> rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.01/fvp-base/u-boot_vexpress_fvp.patch
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.10.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.01.bbappend
> similarity index 100%
> rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.10.bbappend
> rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.01.bbappend
> -- 
> 2.17.1
> 

> 
> 
> 

