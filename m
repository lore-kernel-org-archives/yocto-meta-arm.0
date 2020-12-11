Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web12.9700.1607704453649628760
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Dec 2020 08:34:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=FEsAdpRD;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id 1so8973755qka.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 11 Dec 2020 08:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=V0YtLW7i/ds34soMsRE6u+xZJSx3rbjaBUoAohC0SZE=;
        b=FEsAdpRDnoWQ1h74qNPViS/1zPhJ7mTtz5Ebj111TzzxtWn3OrtRdDFeOuRl/1iYCm
         iQhvDkgk13nNYWi66wopy3o3YDqPL62bvPABqPuxSDTLGL0B831cHIiBG18rrwrFyL4q
         X1wF9+zsF+R68JXPmsa0od9pGV6qujbBTXU4cYC6HtSvWdoP3NLjv2d35hZ7wWkgBAxb
         +HxvyNfjf2JTfbCt3DNZR3iF2LWzwuVHwm1ytPdrrpYhlCnpnUvifwwT4mBSKIRaAyrc
         V1UVwYzIUozN+GUsCJl5An6BMIcaD6bZp0n+GDvuAtNZlSIfPhN4fncmx6gqv4NUb7LL
         0JZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=V0YtLW7i/ds34soMsRE6u+xZJSx3rbjaBUoAohC0SZE=;
        b=Rpfy857VyGHUe1iI64pOIUFu38Uhpg2N8WDhOaGnc1GVE5GTzuNsX0+Jy9bZU3IREw
         kCIHc7o8TGrMPO4mHZBwLDel4yqLgOFoWehHDLlLUEPORVWPG9jDAIlNzp04qg5EZhSQ
         b2Kjg6Z/yoMVu/zlEpGf6gpMJNtP+I7yDWfdPQhr5pngd5baZfAjDDzlfNQi+yWcsszL
         BkzTYWfgrHRQbU0zsFYzjCZck3AS58gu28GkMec1jKZ1+0Pwrp+4DJrOxLcwUjjgDDj4
         qqXQRBgf6hwpQJx9fWHMmhcvD3dHAOn96ud1OPbaLaRDN96hNUOX7NtVdvCTE7taP0Ac
         AOdA==
X-Gm-Message-State: AOAM5315hmXf0lruNvSE5GcPyfQlOQyelADyE7E18Ac/PYeJIlASdu6L
	/NPxC0AdVzxiJkhQIRVt1Q4QrfRaBnM6uw==
X-Google-Smtp-Source: ABdhPJyYDwXU4gZWvXJDtDs5XgSzyK42XGnnqNNxn/3axCdp1XHUbdfzQ4oA92UMx3ZevNN9zJbpZA==
X-Received: by 2002:ae9:e308:: with SMTP id v8mr8526268qkf.339.1607704452578;
        Fri, 11 Dec 2020 08:34:12 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a606:1b00:c15a:fc65:abe1:c5b4])
        by smtp.gmail.com with ESMTPSA id j96sm7130014qtb.24.2020.12.11.08.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 08:34:12 -0800 (PST)
Date: Fri, 11 Dec 2020 11:34:10 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH][gatesgarth] arm/qemuarm64-secureboot: don't use -dev kernel
Message-ID: <20201211163410.GA13879@kudzu.us>
References: <20201210142658.1499868-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201210142658.1499868-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 10, 2020 at 02:26:58PM +0000, Ross Burton wrote:
> From: Ross Burton <ross@burtonini.com>
> 
> According to the comment linux-yocto-dev was being used to get a 5.5
> kernel as 5.4 was panicking on boot.  Now linux-yocto defaults to 5.8
> so just use the standard kernel instead.
> 
> Change-Id: Id382c69f16f2ff4b2cbc63be94a645e56616549d
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> Signed-off-by: Jon Mason <jon.mason@arm.com>

Applied to gatesgarth branch.

Thanks,
Jon

> ---
>  meta-arm/conf/machine/qemuarm64-secureboot.conf | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/conf/machine/qemuarm64-secureboot.conf
> index f2c15e6..fe19ed2 100644
> --- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
> +++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
> @@ -6,10 +6,6 @@ KMACHINE = "qemuarm64"
>  
>  UBOOT_MACHINE = "qemu_arm64_defconfig"
>  
> -# The 5.4 kernel panics when booting, so use the development kernel until the
> -# default kernel is upgraded (5.5. supposedly works)
> -PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-dev"
> -
>  QB_MACHINE = "-machine virt,secure=on"
>  QB_OPT_APPEND += "-no-acpi"
>  QB_MEM = "-m 1024"
> @@ -23,4 +19,3 @@ IMAGE_FSTYPES += "wic wic.qcow2"
>  WKS_FILE ?= "qemuarm64.wks"
>  WKS_FILE_DEPENDS = "trusted-firmware-a"
>  IMAGE_BOOT_FILES = "${KERNEL_IMAGETYPE}"
> -
> -- 
> 2.25.1
> 

> 
> 
> 

