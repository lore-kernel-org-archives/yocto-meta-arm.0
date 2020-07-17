Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.11123.1594991712438204355
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 17 Jul 2020 06:15:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=El3el83b;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f195.google.com with SMTP id e12so7526611qtr.9
        for <meta-arm@lists.yoctoproject.org>; Fri, 17 Jul 2020 06:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qGXthM2zAWv/+QFDdxZFEVZTJLAmlo3KZainUAjWO38=;
        b=El3el83bI+0XS3kxxg7ON6z7g0IjB+OgYxDyQATDFSirPUkb9y0iNhLjQ9+Q1T9uCL
         DUmJasbMsSBSzjzoK8wsU35KVhGdSSU4tLnB5oyrIHL0FrMfYBb8otl7PWJZoCXG7N/j
         vvtaxmsB77ukuopUgsnFOcma+doKfZWaagEVc44N0hSLR/VbYhRurrby/37+z4fna87p
         RWMN+PZZQefPTYIzM5q7jgeVogpSw0/hpgKipc3pQ11Kg2buoHZ+sBvptjCNzQSo2jjf
         YxOnEcwsvMO5CQYiQMtNyghuJ4/q+U53hE8VkWSOvpHmgOfBUro0knMnwmXjX/x0j0+Z
         abug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qGXthM2zAWv/+QFDdxZFEVZTJLAmlo3KZainUAjWO38=;
        b=gte2SMEYEHZYlEKRg6CRz9E5w1JL0C59sHXK3mDx+YK646tKEHDeG0IjMQMcUKR4s8
         0uxcFDXZWEesoyKjN8G8kpe0KZUFoDsgow9GnZvCOv0b5lmq5GkUL7t+gGABAxjy2lNF
         CXYsJ9Y/Blf4GwXar3g2cR0AeLSjj6Gybl13dHZMTtHOIjrLpYOAjC/sRhUcC1wHuo5d
         tfxc5q7/TnGC53ZMRH5wl24vxjdacQSCc+LX97NoOVdHrr/lJ4rkY4WEHC0XUhORErGR
         hw7G4eWQJbQzCn99XlgqK+iNpajd/3YjzwrGmmcvhzkHh0Y1zQOY21NyJPhSf5E6UY7S
         oG4w==
X-Gm-Message-State: AOAM530a73eRBgqgvu+x37sUS2fyDVJux6MDhdacRNUK6TiVcMrq/4+Q
	c/gXQXiGC7jrO6EEPxyJ+8n9bA==
X-Google-Smtp-Source: ABdhPJwNrxCt7lUe4jTWJYn8oNEEe54X4WbALpH0vQgah1WLT2VUp4bl2tZFa5GD0KewrH1xNl7bgw==
X-Received: by 2002:ac8:6d01:: with SMTP id o1mr10323992qtt.277.1594991711592;
        Fri, 17 Jul 2020 06:15:11 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:8034:b667:f1cd:123f])
        by smtp.gmail.com with ESMTPSA id 142sm10001787qki.35.2020.07.17.06.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 06:15:11 -0700 (PDT)
Date: Fri, 17 Jul 2020 09:15:09 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Khasim Mohammed <khasim.mohammed@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-bsp/wic : add wic image support for N1SDP
Message-ID: <20200717131509.GD26434@kudzu.us>
References: <20200715140651.18822-1-khasim.mohammed@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200715140651.18822-1-khasim.mohammed@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 15, 2020 at 07:36:51PM +0530, Khasim Mohammed wrote:
> - Update IMAGE_FSTYPES to generate a wic image
> - Update MACHINE_FEATURES to include efi as supported feature on N1SDP
> 
> Change-Id: I8c75171270e3b643794af74b734825e1739999e5
> Issue-Id: PLATFORMS-3134
> Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>

Applied to master.

Thanks,
Jon

> ---
>  meta-arm-bsp/conf/machine/n1sdp.conf | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
> index 96a3859..139f619 100644
> --- a/meta-arm-bsp/conf/machine/n1sdp.conf
> +++ b/meta-arm-bsp/conf/machine/n1sdp.conf
> @@ -11,7 +11,7 @@ require conf/machine/include/arm/arch-armv8a.inc
>  KERNEL_IMAGETYPE = "Image"
>  KERNEL_DEVICETREE = "n1sdp/n1sdp.dtb"
>  
> -IMAGE_FSTYPES += "tar.bz2 ext4"
> +IMAGE_FSTYPES += "wic tar.bz2 ext4"
>  
>  SERIAL_CONSOLES = "115200;ttyAMA0"
>  
> @@ -37,3 +37,4 @@ EXTRA_IMAGEDEPENDS += "virtual/uefi-firmware"
>  
>  #grub-efi
>  EFI_PROVIDER ?= "grub-efi"
> +MACHINE_FEATURES += "efi"
> -- 
> 2.17.1
> 

> 

