Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web10.19257.1597415748635682334
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 14 Aug 2020 07:35:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=talrP+s0;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.65, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f65.google.com with SMTP id y11so4362273qvl.4
        for <meta-arm@lists.yoctoproject.org>; Fri, 14 Aug 2020 07:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2s6CbxaXVCP+QkGGtOQtAltV1RhN8dIuWIdFfM3ae3o=;
        b=talrP+s0lC81yy/rAVqPeVKfCkFASHotbXlZ7g4pGxIt4aLtx4SY55a3KYW5XNiQ6Z
         nLg82I9BtpP3vRRmrPaxCBFlf7RDo7mTOkemF1bC0ndKm2ffubl5ZCDLWy3bB1RVm6qg
         XX7HB918moo97e6/HZC4muSgdZ/eNAAnDqmstDe6WdvHe+tM169nlFUt1wP6IsS2gSk2
         KeCNE1wspx70O+6KuGEVIa/r7PBRVrOt3vkACc10P75ydkRAKjC9Swoslesr/JbgKiEf
         774nxQ5eNgx8DLy2cGUm5rNeAMXkGcYaLSHyNBO5PsyLi9R0JW1unv3G4eFknKSTuf2G
         IdrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2s6CbxaXVCP+QkGGtOQtAltV1RhN8dIuWIdFfM3ae3o=;
        b=WM9n6hfU84SELR3ia9rZTxMn1WtxjlxwyuhOuZWd2Cibfynj4Kej5QU2AZO/K+uGoY
         FHGguQ6t235ewPZ+HnhNZLS9HIwFx3uN7lO7kJ14dYd7DOPVhRac4LW+0RJR0i9T4Ttx
         T0Na/I41Ua9C77F0wgLV5gwjDILWlS7zM2NCaTLm2+PB1LWdWQFghYNHdX+GY/tGN4bW
         2cw+YpBfLspUD5pYvXm3pwoNvXzmPenQl8yD5q3Tyyf+NDrYj8GFIdYhrTIm/M3ilygQ
         aoJpbSo5IzL++aXc+52Hv4nffxV04DHyqqi11+U2BypPHyYKgkyfMFRPnQkZvFlKZdXf
         uFRw==
X-Gm-Message-State: AOAM531hFOrun1JOlqNjUER07mHgIm90+NOsRqhO2gDBE4qohpu+7b8Y
	luZaJZT4HyTBd7pGfC0sHu4X2cbMjQ0XBg/X
X-Google-Smtp-Source: ABdhPJxKCIezVEz6QLzWGwkRsAf5PyilGsgdZdseYmO1yjvWh0n2UXpNOcsI42ySFYzkCJdXsd7TwQ==
X-Received: by 2002:ad4:5252:: with SMTP id s18mr2955255qvq.125.1597415747755;
        Fri, 14 Aug 2020 07:35:47 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:cca3:93d4:6837:123c])
        by smtp.gmail.com with ESMTPSA id l66sm10198075qte.48.2020.08.14.07.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2020 07:35:46 -0700 (PDT)
Date: Fri, 14 Aug 2020 10:35:45 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Anders Dellien <anders.dellien@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-bsp/recipes-kernel: Remove kernel config warnings for fvp-base machines
Message-ID: <20200814143544.GB6409@kudzu.us>
References: <20200814090309.16194-1-anders.dellien@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200814090309.16194-1-anders.dellien@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 14, 2020 at 10:03:09AM +0100, Anders Dellien wrote:
> For fvp-base, enable CONFIG_COMPILE_TEST to remove warning regarding
> CONFIG_ARM_TIMER_SP804
> 
> For fvp-base-arm32, enable CONFIG_MODULES to remove warning regarding
> CONFIG_SCSI_DEBUG
> 
> Change-Id: I02457ae2d50e03367d1ec3aeb3a0f1571c0f2b05
> Signed-off-by: Anders Dellien <anders.dellien@arm.com>

Applied to master.

Thanks,
Jon

> ---
>  .../bsp/arm-platforms/fvp-arm32/fvp-features.cfg                 | 1 +
>  .../arm-platforms-kmeta/bsp/arm-platforms/fvp/fvp-timer.cfg      | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32/fvp-features.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32/fvp-features.cfg
> index f2164f7..42cd476 100644
> --- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32/fvp-features.cfg
> +++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32/fvp-features.cfg
> @@ -1,3 +1,4 @@
> +CONFIG_MODULES=y
>  CONFIG_BLK_DEV_INITRD=y
>  CONFIG_EXT4_FS=y
>  CONFIG_BINFMT_SCRIPT=y
> diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp/fvp-timer.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp/fvp-timer.cfg
> index 144977f..b33c65c 100644
> --- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp/fvp-timer.cfg
> +++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp/fvp-timer.cfg
> @@ -1,3 +1,4 @@
>  # Dual timer module
> +CONFIG_COMPILE_TEST=y
>  CONFIG_ARM_TIMER_SP804=y
>  CONFIG_CLK_SP810=y
> -- 
> 2.17.1
> 

> 

