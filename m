Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web10.37343.1595249969639939051
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Jul 2020 05:59:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=hO8t4N07;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.66, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f66.google.com with SMTP id m8so7284989qvk.7
        for <meta-arm@lists.yoctoproject.org>; Mon, 20 Jul 2020 05:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=R1WFssaTf/PiSgenQ50fKEEqmBjZ0rtg/UTMgwmnPjo=;
        b=hO8t4N07dXJPQIHrdUcilQtZibOcKaov9y5ZbpIbrJBK6PXnZrAZSQ+HbNJSOWaspu
         nDxpxSwJ/ST54+tWhyeW7tESxNwjCcfebzAS9exOro7PqNRdIk6VjzAgPs/whAgdozj6
         GKalf6yHpcxvgjCNNA+ksVjPpkQk4pxBS6f4eOf++rZcFBzY/mA1UEEEW85Y6Ky3BRi2
         ps1XEUSnZ84BRCkH+oTMic2J2oNAVwYMWmdX7FDQYg2SPjRfH50VEMFnuK0yNPX0nkxE
         5tLwI2Jlrp9f3R/rLdGvUPILrO2IpfDKnLsF/AmmvnANMPYTFKirwLr1jOpDSDWMVeGP
         2oqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=R1WFssaTf/PiSgenQ50fKEEqmBjZ0rtg/UTMgwmnPjo=;
        b=nkGtolfQkMfXN57BhuwIxoQIj7I0pla+s2nhCwK5sVWbIjQG91/bq0/fDcKAqF6OKO
         X2eOI9H6tCThKSQBTm2djmztlT0H+8rFeuXQeX1ysBtfP4D6A4k/Vjsmdt/SCEyBSH4s
         x61yFm4mmrLIPiqGzr0j1Y44yITv772joMhSh7sQy4l18wfrGusCWlPq+G40iAWfd0GX
         1cxxOqGXyXO3VCi9MykShT0K+w+jxTx9M1d5UV5YWR32DfTQh1hOSPAnWYP+knaD2/5G
         tKKPi7TZZ49C/a7jx+ep+icZg49lPgBmn5RliKm/6VMndgKMh5WxBYAYXNODOgyjouyT
         2ahA==
X-Gm-Message-State: AOAM530POlm9TO/svrNBl/+NEubF2hTI2aVolg3Xz2ua5CjZlb/tPZFp
	dPy77Re6Wr89WKm/r5TMSZWQ9GhyoWXRCQ==
X-Google-Smtp-Source: ABdhPJxt6ePzzjcnD98EMj590sP44KfOzVOnLg2tm7HMG2mWHNFpRenGkN8rOZsy+EmcmkAingCXdg==
X-Received: by 2002:a0c:facb:: with SMTP id p11mr21256609qvo.243.1595249968713;
        Mon, 20 Jul 2020 05:59:28 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:68c0:88e3:405a:691])
        by smtp.gmail.com with ESMTPSA id p186sm17907029qkf.33.2020.07.20.05.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 05:59:28 -0700 (PDT)
Date: Mon, 20 Jul 2020 08:59:26 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-bsp: FVP include cleanup
Message-ID: <20200720125926.GA11870@kudzu.us>
References: <20200716180733.12009-1-jon.mason@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200716180733.12009-1-jon.mason@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 16, 2020 at 02:07:33PM -0400, Jon Mason wrote:
> No real benefit to having the FVP inc file in a layer above the conf
> files.  Move the file down one level and rename to make it more
> consistent with the layout.
> 
> Change-Id: If32c0462352fbe2f3496957b1b2a169cfd7e7f66
> Signed-off-by: Jon Mason <jon.mason@arm.com>

Applied to master.

Thanks,
Jon

> ---
>  meta-arm-bsp/conf/machine/foundation-armv8.conf                 | 2 +-
>  meta-arm-bsp/conf/machine/fvp-base.conf                         | 2 +-
>  .../conf/machine/{fvp-common/fvp.inc => fvp-common.inc}         | 0
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-arm-bsp/conf/machine/{fvp-common/fvp.inc => fvp-common.inc} (100%)
> 
> diff --git a/meta-arm-bsp/conf/machine/foundation-armv8.conf b/meta-arm-bsp/conf/machine/foundation-armv8.conf
> index 73d2798..c1b9f4d 100644
> --- a/meta-arm-bsp/conf/machine/foundation-armv8.conf
> +++ b/meta-arm-bsp/conf/machine/foundation-armv8.conf
> @@ -4,7 +4,7 @@
>  #@NAME: Armv8-A Foundation Platform machine
>  #@DESCRIPTION: Machine configuration for Armv8-A Foundation Platform model
>  
> -require conf/machine/fvp-common/fvp.inc
> +require conf/machine/fvp-common.inc
>  
>  KERNEL_DEVICETREE = "arm/foundation-v8-gicv3-psci.dtb"
>  
> diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/machine/fvp-base.conf
> index 3039644..bd3c62d 100644
> --- a/meta-arm-bsp/conf/machine/fvp-base.conf
> +++ b/meta-arm-bsp/conf/machine/fvp-base.conf
> @@ -4,7 +4,7 @@
>  #@NAME: Armv8-A Base Platform FVP machine
>  #@DESCRIPTION: Machine configuration for Armv8-A Base Platform FVP model
>  
> -require conf/machine/fvp-common/fvp.inc
> +require conf/machine/fvp-common.inc
>  
>  KERNEL_DEVICETREE = "arm/fvp-base-gicv3-psci-custom.dtb"
>  
> diff --git a/meta-arm-bsp/conf/machine/fvp-common/fvp.inc b/meta-arm-bsp/conf/machine/fvp-common.inc
> similarity index 100%
> rename from meta-arm-bsp/conf/machine/fvp-common/fvp.inc
> rename to meta-arm-bsp/conf/machine/fvp-common.inc
> -- 
> 2.17.1
> 

> 

