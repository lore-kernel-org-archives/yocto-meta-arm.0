Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web08.35311.1605536763436991213
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 16 Nov 2020 06:26:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=gYSmElby;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f195.google.com with SMTP id 7so12949627qtp.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 16 Nov 2020 06:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=p0HyzEQsE/lZZeBcFySVwTAtxdI/8v4io6ax9pMRf/g=;
        b=gYSmElbymlxbX/lCU8zqzBXMSqeoN3iG1PIue0CxjDTWpaluc1kn1KLSopWtyFno9n
         B57hFxw7OLIFjuzYPevZRsfFtzPxS0EN2qZMq5T1bANy1jfRwo7gD+Am7oGCFEA/oxJa
         1NJDSJ/2FCoLD5Jaa6t60qsM3xf6BytEToJQ5RKtuDHTNzoO/MePnzg2OaPMYaRTwRQC
         aMgqzSiJHfLuRnbgRteGn3HKJT2YS5vVrhrDBSD3iXw5sd3GKHYJvR9fofQCMMcI6+z0
         A+pvlRNYQdBzlBEE8ufJ8P493OzuFzqqWgJzF64qC35pX3BCNjg+VoMq6vKFXNUBThfo
         LQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=p0HyzEQsE/lZZeBcFySVwTAtxdI/8v4io6ax9pMRf/g=;
        b=bzsQMxjKkNAoyqgoX4Z+Ww9gDgzFjiwYoR5delOA3p6JqNo639EQwRhGNgu7VxASTV
         2RQeU5R/jczmDbcq2lBj5x4rSfjwxDy1vdbswNPD//Jdr2GMEpiAzQHkzZ0lln58WmrB
         w9rqQlQlmAic4gb0Or/psj60exS4Q6d6n3M0yBlqIItETbhnpXTFibLAjaaU0QwOCz+D
         IxAGE+25SXCYt3Q+JYtx4U4aY46wYoOGCUkLvoQRsOUadnIHQXWC6MINdTfZZK72j87l
         vqFmPzvUWjl499pmImNreikLOebgc3W4mMgPk398bYyRaQ4lTxjIZXI4Z0oKzbwHYwIf
         SW1g==
X-Gm-Message-State: AOAM533qcRORPMyFIaA3MIBgfZlvqfNfYLEjRNdLAJKhQPAdNJKgO9c9
	J3KMRESD7hsZr7HbXs3TsUf0PF+f4nEwlA==
X-Google-Smtp-Source: ABdhPJwdrtENryaxJB38C1/JC1yyCjp9whgLW7OR6mVbLPdUnMSoFkDWowMUBNsdT3I6+wpyv1zIDQ==
X-Received: by 2002:ac8:6e8b:: with SMTP id c11mr14559967qtv.2.1605536762614;
        Mon, 16 Nov 2020 06:26:02 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:8d8f:f072:1037:de6f])
        by smtp.gmail.com with ESMTPSA id w54sm12792831qtb.0.2020.11.16.06.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 06:26:02 -0800 (PST)
Date: Mon, 16 Nov 2020 09:26:00 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-bsp: Fix u-boot 2020.07 recipe
Message-ID: <20201116142559.GD20627@kudzu.us>
References: <20201112190611.16494-1-jon.mason@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201112190611.16494-1-jon.mason@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 12, 2020 at 02:06:11PM -0500, Jon Mason wrote:
> The u-boot 2020.07 temporary recipe is a copy of 2020.04, and brought
> with it a limitation in the recipe to only be used on certain hardware.
> Remove this limitation so that it can be used where needed.
> 
> Change-Id: I5b99e92f3f440812ebc1fc550e6b860e6530e9b7
> Signed-off-by: Jon Mason <jon.mason@arm.com>

Applied to master.

Thanks,
Jon

> ---
>  meta-arm-bsp/conf/machine/a5ds.conf               | 1 +
>  meta-arm-bsp/conf/machine/fvp-common.inc          | 2 ++
>  meta-arm-bsp/conf/machine/juno.conf               | 1 +
>  meta-arm-bsp/conf/machine/tc0.conf                | 1 +
>  meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bb | 2 --
>  5 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arm-bsp/conf/machine/a5ds.conf b/meta-arm-bsp/conf/machine/a5ds.conf
> index f7d35e7..5aadae5 100644
> --- a/meta-arm-bsp/conf/machine/a5ds.conf
> +++ b/meta-arm-bsp/conf/machine/a5ds.conf
> @@ -17,6 +17,7 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
>  IMAGE_FSTYPES += "tar.bz2 cpio.gz"
>  
>  # Cortex-a5 u-boot configuration
> +PREFERRED_VERSION_u-boot ?= "2020.07"
>  UBOOT_MACHINE = "designstart_ca5_defconfig"
>  UBOOT_IMAGE_ENTRYPOINT = "0x84000000"
>  UBOOT_IMAGE_LOADADDRESS = "0x84000000"
> diff --git a/meta-arm-bsp/conf/machine/fvp-common.inc b/meta-arm-bsp/conf/machine/fvp-common.inc
> index da45026..ad08c0e 100644
> --- a/meta-arm-bsp/conf/machine/fvp-common.inc
> +++ b/meta-arm-bsp/conf/machine/fvp-common.inc
> @@ -31,6 +31,8 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
>  PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
>  PREFERRED_VERSION_linux-yocto ?= "5.4%"
>  
> +PREFERRED_VERSION_u-boot ?= "2020.07"
> +
>  EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot"
>  
>  # As this is a virtual target that will not be used in the real world there is
> diff --git a/meta-arm-bsp/conf/machine/juno.conf b/meta-arm-bsp/conf/machine/juno.conf
> index 50c9d2f..2f42dea 100644
> --- a/meta-arm-bsp/conf/machine/juno.conf
> +++ b/meta-arm-bsp/conf/machine/juno.conf
> @@ -21,6 +21,7 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
>  PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
>  PREFERRED_VERSION_linux-yocto ?= "5.4%"
>  PREFERRED_VERSION_trusted-firmware-a ?= "2.3%"
> +PREFERRED_VERSION_u-boot ?= "2020.07"
>  
>  EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot firmware-image-juno"
>  
> diff --git a/meta-arm-bsp/conf/machine/tc0.conf b/meta-arm-bsp/conf/machine/tc0.conf
> index 1eb3d87..7776dde 100644
> --- a/meta-arm-bsp/conf/machine/tc0.conf
> +++ b/meta-arm-bsp/conf/machine/tc0.conf
> @@ -10,6 +10,7 @@ require conf/machine/include/arm/arch-armv8a.inc
>  
>  # Das U-boot
>  UBOOT_MACHINE ?= "total_compute_defconfig"
> +PREFERRED_VERSION_u-boot ?= "2020.07"
>  
>  # Trusted firmware A v2.3
>  PREFERRED_PROVIDER_virtual/trusted-firmware-a ?= "trusted-firmware-a"
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bb b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bb
> index 1a9721a..fa99a3a 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bb
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bb
> @@ -6,8 +6,6 @@ application code."
>  SECTION = "bootloaders"
>  DEPENDS += "flex-native bison-native"
>  
> -COMPATIBLE_MACHINE = "(corstone700-*)"
> -
>  LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://Licenses/README;md5=30503fd321432fc713238f582193b78e"
>  PE = "1"
> -- 
> 2.17.1
> 

> 
> 
> 

