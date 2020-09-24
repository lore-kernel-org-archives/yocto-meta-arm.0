Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.26941.1600978043192431112
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 24 Sep 2020 13:07:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=JXZxBASm;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f193.google.com with SMTP id g72so707297qke.8
        for <meta-arm@lists.yoctoproject.org>; Thu, 24 Sep 2020 13:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=b23U4BZfXvkxMHn9A3In+V9z1sAv557SP7pH80/yujc=;
        b=JXZxBASmYubh/L3nf161Jnmr09BZi8VZEZmUHrvopTLoXv+gH47FdhzvElXkzJR3/k
         KHvsy0grMAzc7i4wHr3OoPjcIVO0LQRkcScZgzhwnikCFMtZBGnMgEyNSkcVtmvc0G9x
         Pvn1ARUtWWvoY2XW07cw03PaDq5Oqyn2eDSo+kFKsplI/pNVNfnlx1Y4KOa5YCv+6A3y
         pE785LfSTMH7h2trqKIxM1F0M0kk9u2fwoggIsRCz6EiuLQts1Ufak1OOmfZOsPZq893
         k/fGZ6YYx9p/e1Nd5t7qRGDjoXKTxCnBYXfaBPJ31uA8RiWut2a+QAgussU5I/xRZ/YJ
         pvnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=b23U4BZfXvkxMHn9A3In+V9z1sAv557SP7pH80/yujc=;
        b=TPp12zH5GiO7XGvdRoKBOMeucTusMLosbKgayY3EExWxZDLnVpjOQSYHQt9VSncHy6
         5BPsWqtZzuv+4BUfRwxCz/+04kWNS1SfhDfG+Z035TVXeAnKpk3WD891HxbMWjHozCHh
         xrvwcIgClA/Gpe91re1RmK5PTv6HSO2OCE1dboix6btQxbFykbX6l/j6UqrQDFoaTeaC
         p+4Xvlc6mdMYVmDExzu/PV9QUdhoulubB0VE3swsMOMCSOalba+BzZCcthdFWmWjVvjs
         +xmyfPyJdfANapB/DKNM1RS8I6sy92VduDALb2YHzOWbGkCQUkg1j0jlEt3UP0rkizst
         DFvg==
X-Gm-Message-State: AOAM531tSNDJVBkHfDE3BKixAzKvolpMIZDKospbDDjXoCzv9dbxBq8f
	3MteeM4ZAV0eNzsaa5dOSZnL7yiPNhEzdBaV
X-Google-Smtp-Source: ABdhPJwYSSY5tJrXtMWcZ/XQt4znFXF5haO9F6JENgOKrTtEZ2uSfyKKtfyGrdI5PvCHnfQpqaLq2g==
X-Received: by 2002:a37:6610:: with SMTP id a16mr825809qkc.134.1600978042016;
        Thu, 24 Sep 2020 13:07:22 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id a24sm340057qko.82.2020.09.24.13.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 13:07:21 -0700 (PDT)
Date: Thu, 24 Sep 2020 16:07:16 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org,
	Anders Dellien <anders.dellien@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-bsp/u-boot: Rebase FVP patches on u-boot 2020.07
Message-ID: <20200924200715.GA4275@kudzu.us>
References: <163788029F349896.14754@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <163788029F349896.14754@lists.yoctoproject.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 23, 2020 at 05:48:51PM -0400, Jon Mason via lists.yoctoproject.org wrote:
> From: Anders Dellien <anders.dellien@arm.com>
> 
> This removes fuzz warnings when applying the patches.
> 
> Also change 'earlyprintk' parameter to 'earlycon' as
> the former isn't support for AArch64.
> 
> Change-Id: I7d9ee3e3ab47877e1d85862dbc835e0d5dac0ecc
> Signed-off-by: Anders Dellien <anders.dellien@arm.com>

Pulled into master.

Thanks,
Jon

> ---
>  .../fvp-common/u-boot_vexpress_fvp.patch         |  2 +-
>  .../fvp-common/u-boot_vexpress_fvp.patch         | 16 ++++++++++++++++
>  .../recipes-bsp/u-boot/u-boot_%.bbappend         |  4 ++--
>  3 files changed, 19 insertions(+), 3 deletions(-)
>  rename meta-arm-bsp/recipes-bsp/u-boot/{files => u-boot-2020.01}/fvp-common/u-boot_vexpress_fvp.patch (78%)
>  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/fvp-common/u-boot_vexpress_fvp.patch
> 
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/fvp-common/u-boot_vexpress_fvp.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/fvp-common/u-boot_vexpress_fvp.patch
> similarity index 78%
> rename from meta-arm-bsp/recipes-bsp/u-boot/files/fvp-common/u-boot_vexpress_fvp.patch
> rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/fvp-common/u-boot_vexpress_fvp.patch
> index bdca202c9aa2..19e1a569cc04 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/files/fvp-common/u-boot_vexpress_fvp.patch
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/fvp-common/u-boot_vexpress_fvp.patch
> @@ -7,7 +7,7 @@ index c9cec8322c..3a339be6a2 100644
>   CONFIG_BOOTDELAY=1
>   CONFIG_USE_BOOTARGS=y
>  -CONFIG_BOOTARGS="console=ttyAMA0 earlycon=pl011,0x1c090000 debug user_debug=31 loglevel=9"
> -+CONFIG_BOOTARGS="console=ttyAMA0 earlyprintk=pl011,0x1c090000 debug user_debug=31 androidboot.hardware=fvpbase root=/dev/vda2 rw rootwait loglevel=9"
> ++CONFIG_BOOTARGS="console=ttyAMA0 earlycon=pl011,0x1c090000 debug user_debug=31 androidboot.hardware=fvpbase root=/dev/vda2 rw rootwait loglevel=9"
>   # CONFIG_USE_BOOTCOMMAND is not set
>   # CONFIG_DISPLAY_CPUINFO is not set
>   # CONFIG_DISPLAY_BOARDINFO is not set
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/fvp-common/u-boot_vexpress_fvp.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/fvp-common/u-boot_vexpress_fvp.patch
> new file mode 100644
> index 000000000000..9a21687e07c0
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/fvp-common/u-boot_vexpress_fvp.patch
> @@ -0,0 +1,16 @@
> +Upstream-Status: Inappropriate [OE config specific]
> +
> +diff --git a/configs/vexpress_aemv8a_semi_defconfig b/configs/vexpress_aemv8a_semi_defconfig
> +index f0ac2f9da3..93fcd3026a 100644
> +--- a/configs/vexpress_aemv8a_semi_defconfig
> ++++ b/configs/vexpress_aemv8a_semi_defconfig
> +@@ -10,7 +10,7 @@ CONFIG_DISTRO_DEFAULTS=y
> + CONFIG_ANDROID_BOOT_IMAGE=y
> + CONFIG_BOOTDELAY=1
> + CONFIG_USE_BOOTARGS=y
> +-CONFIG_BOOTARGS="console=ttyAMA0 earlycon=pl011,0x1c090000 debug user_debug=31 loglevel=9"
> ++CONFIG_BOOTARGS="console=ttyAMA0 earlycon=pl011,0x1c090000 debug user_debug=31 androidboot.hardware=fvpbase root=/dev/vda2 rw rootwait loglevel=9"
> + # CONFIG_USE_BOOTCOMMAND is not set
> + # CONFIG_DISPLAY_CPUINFO is not set
> + # CONFIG_DISPLAY_BOARDINFO is not set
> +
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> index 5fc3723c72aa..205c3c477dec 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> @@ -2,8 +2,8 @@
>  
>  THIS_DIR := "${THISDIR}"
>  FILESEXTRAPATHS_prepend = "${THIS_DIR}/files/:${THIS_DIR}/${BP}:"
> -FILESEXTRAPATHS_prepend_fvp-base := "${THISDIR}/files/fvp-common:"
> -FILESEXTRAPATHS_prepend_foundation-armv8 := "${THISDIR}/files/fvp-common:"
> +FILESEXTRAPATHS_prepend_fvp-base = "${THIS_DIR}/${BP}/fvp-common:"
> +FILESEXTRAPATHS_prepend_foundation-armv8 = "${THIS_DIR}/${BP}/fvp-common:"
>  
>  #
>  # Cortex-A5 DesignStart KMACHINE
> -- 
> 2.20.1
> 

> 
> 
> 

