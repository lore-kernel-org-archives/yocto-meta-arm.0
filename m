Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.95584.1597863771399186446
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Aug 2020 12:02:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=txWi4SjP;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f195.google.com with SMTP id b14so22610123qkn.4
        for <meta-arm@lists.yoctoproject.org>; Wed, 19 Aug 2020 12:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FU9vTpI8Se65vn2NYqMCKw3blSlyayBEHQ3nDs31CJ4=;
        b=txWi4SjPwBn0C9lRW1obtD+psiMn7x3KrYdW+WCqz/bEURUkFqJ7WhTXJL6BcZ7eok
         uuNbO+Bmc7rwMa3SsUH9qhFhiyCAcN21GwYoZnWLNlbNiKla3smNZFWcrY+BVHIgp6It
         VPbWvB5IJXPPHtWLCw9/BZ+rIjzWyPpa0+ICG3xe6mGK2EnZyKCWjEYcPQwECXkn/xSt
         u64ovU7YrmiVpDuSdE2yndfgnGNZ4Y3t+BjeqN5W10CKYzjcwf1N8cTLuJdhTPiKipAn
         O4rUE11pee6quFue2bcIVHWaP5MBcFuRhc78LhROemZYFLtehtZZJCT8ilnRhW+Ftufh
         INnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FU9vTpI8Se65vn2NYqMCKw3blSlyayBEHQ3nDs31CJ4=;
        b=i0ntOuStRIm4xvLKS1Bx87JNOa7elMZPEhWeNBeOT54dqYp0OYTWgE9P1zVv79FdTo
         skBmCxsHbpshCX9rR+GmZePbw4XxAopeoZfBbx/uaO9lOWGYc0XhjoKzU22o9V1CQlqA
         GBG0du2MUACE9SEsWMIJvlHwR4rwKf8GclUkOjkssXyp7gkNPTOhidYN1wPSybAK7fl0
         /c7Rs8yzG2WnrI73Z+kLiqgwy1lYPWk3YAiNUehdL3XeTAmnubTtjBTBMhs9NOl6Bl06
         CA7nLmzBdoG8Ni4tEnY1vnBr6MEBHliudKwfmV1WnBNAyL9ZQnqJ9S27I8QqBALLBCrc
         m3bA==
X-Gm-Message-State: AOAM531NsSF1tHlyzAU1SdMGywt1n9o4NWAGbzsZJkQvS5kIZ1W6sx66
	vG7+jDvuqsGiI92f7NvkX/36qVPaCGIj4icW
X-Google-Smtp-Source: ABdhPJyteME7dIMAhm+NYVZmaiRMvBI+SrUAR2VmYXDgjZzknl2C/H4pvhabWqbenX2XzKIIqgFMfQ==
X-Received: by 2002:a05:620a:1212:: with SMTP id u18mr22206778qkj.319.1597863770438;
        Wed, 19 Aug 2020 12:02:50 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:85c0:21f7:2371:875f])
        by smtp.gmail.com with ESMTPSA id j31sm29571152qtb.63.2020.08.19.12.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 12:02:50 -0700 (PDT)
Date: Wed, 19 Aug 2020 15:02:48 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-bsp: Correct documentation errors
Message-ID: <20200819190248.GC17082@kudzu.us>
References: <20200819125904.23179-1-jon.mason@arm.com>
 <20200819125904.23179-2-jon.mason@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200819125904.23179-2-jon.mason@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 19, 2020 at 08:59:04AM -0400, Jon Mason wrote:
> Documentation for FVP and Foundation is incorrect in names and missing a
> field.
> 
> Change-Id: I58de54e9d0883671166102e657f53cfad14a2cba
> Signed-off-by: Jon Mason <jon.mason@arm.com>

Pulled into master.

Thanks,
Jon

> ---
>  meta-arm-bsp/documentation/foundation-armv8.md | 3 ++-
>  meta-arm-bsp/documentation/fvp-base.md         | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arm-bsp/documentation/foundation-armv8.md b/meta-arm-bsp/documentation/foundation-armv8.md
> index 1097550..7e73da5 100644
> --- a/meta-arm-bsp/documentation/foundation-armv8.md
> +++ b/meta-arm-bsp/documentation/foundation-armv8.md
> @@ -30,9 +30,10 @@ Once done, do the following to build and run an image:
>  ```
>  bash$ ./Foundation_Platform --cores=4 --no-sve --gicv3 \
>           --data=${YOCTO_DEPLOY_IMGS_DIR}/bl1-fvp.bin@0x0 \
> +         --data=${YOCTO_DEPLOY_IMGS_DIR}/fip-fvp.bin@0x8000000 \
>           --data=${YOCTO_DEPLOY_IMGS_DIR}/Image@0x80080000 \
>           --data=${YOCTO_DEPLOY_IMGS_DIR}/foundation-v8-gicv3-psci.dtb@0x83000000 \
> -         --block-device=${YOCTO_DEPLOY_IMGS_DIR}/core-image-minimal-foundation-armv8.disk.img \
> +         --block-device=${YOCTO_DEPLOY_IMGS_DIR}/core-image-minimal-foundation-armv8.disk.img
>  ```
>  
>  If you have built a configuration without a ramdisk, you can use the following
> diff --git a/meta-arm-bsp/documentation/fvp-base.md b/meta-arm-bsp/documentation/fvp-base.md
> index 0936c19..58604e1 100644
> --- a/meta-arm-bsp/documentation/fvp-base.md
> +++ b/meta-arm-bsp/documentation/fvp-base.md
> @@ -34,7 +34,7 @@ bash$ ./FVP_Base_RevC-2xAEMv8A -C bp.virtio_net.enabled=1 \
>           -C bp.flashloader0.fname=${YOCTO_DEPLOY_IMGS_DIR}/fip-fvp.bin \
>           --data cluster0.cpu0=${YOCTO_DEPLOY_IMGS_DIR}/Image@0x80080000 \
>           --data cluster0.cpu0=${YOCTO_DEPLOY_IMGS_DIR}/fvp-base-gicv3-psci-custom.dtb@0x83000000 \
> -         -C bp.virtioblockdevice.image_path=${YOCTO_DEPLOY_IMGS_DIR}/core-image-minimal-foundation-armv8.disk.img \
> +         -C bp.virtioblockdevice.image_path=${YOCTO_DEPLOY_IMGS_DIR}/core-image-minimal-fvp-base.disk.img
>  ```
>  
>  
> -- 
> 2.17.1
> 

> 

