Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web11.11708.1601346085585825550
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 28 Sep 2020 19:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=w92tC7hT;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f195.google.com with SMTP id q5so3037889qkc.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 28 Sep 2020 19:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XvC+myWcskIUPhLH5yI26DbcybVA1echtHrl/6Xfgzk=;
        b=w92tC7hTKwnGvWAue7uzAm4GJ4pfnuL3UpjHe3Y68iKo4U9hqNREY7ljSOpZeB1R6e
         DWvGx5TyCI0R9JR2uoCWAz02K0jr5cwsJhPIIrD+TVznVUuX5AR+VAhYGWbmWQEQ2rcl
         MS3eBDIsuOyMLtpR8NaE2GRag1ZC9lunRjIuYyZ8yYIGurV2VvD/2hYwiyCA2PlAE+Pj
         BCz6mIGk54MkCj39R4nK/uAQlmbs+lETZBysO312+6NT0Q7tJmNPAgG8FKcwsGgrbmdt
         Egeh7aQwBKzeLuecUl+aFkbMucDCN//V2mMQ5PlYt9xC9AQrqjk1Co/Bv+wH0iVUMuAm
         kk/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XvC+myWcskIUPhLH5yI26DbcybVA1echtHrl/6Xfgzk=;
        b=ro8OUYIrlhz1BQGvuzJPgZWKoHep31w/jSPiFgIjdl9a9inwtjcHYgpo8qr/o3Faau
         ny3qoKL3bTs+OBjRpnw/FUokQd4iWG3y3S2sooUIT90E33sHlsDUJmX4kvskcxMg7htT
         4HDhL4wKHy9G/HtSWxXaIbrkQT3mR/fQuAycouO2kor87Vp6T/Ayq7t5VBLSGAbzs1dp
         jVP7y+k4VSUWYlDe7XmOPahKtBSy5ah6yS63ZcJqh4xkfoJxrfQbOdTm8rpkOiWYzGyI
         EITAlgOxmZPMlQ6n1UElzmB0o4j+L2aNE6g78GslxkJgLeIEqoNH41ufMv5kS7DmpPGe
         R7yA==
X-Gm-Message-State: AOAM532BfU5Vhbmp4mNBH8yj/r8C6mxmdk5zN0TB0yUd2174CYRvIKEO
	VhcCjlQH8doYYzWclZDyH3JTRL3rohgpGI4e
X-Google-Smtp-Source: ABdhPJxXo4tfs6g2kbEOcD9lS4X0/D5DmOQyh5bieDw0vdXOLT/+rM76E8/+2K1L4W176L19fFTZnQ==
X-Received: by 2002:a05:620a:1411:: with SMTP id d17mr2385232qkj.325.1601346084606;
        Mon, 28 Sep 2020 19:21:24 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id v8sm3237993qkb.23.2020.09.28.19.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 19:21:24 -0700 (PDT)
Date: Mon, 28 Sep 2020 22:21:21 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Anders Dellien <anders.dellien@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH v2 1/1] arm-bsp/recipes-kernel: Update fvp-base-arm32 BSP definition
Message-ID: <20200929022120.GA28739@kudzu.us>
References: <20200928172535.18807-1-anders.dellien@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200928172535.18807-1-anders.dellien@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 28, 2020 at 06:25:35PM +0100, Anders Dellien wrote:
> Update to use the yocto-kernel-cache 'standard' configuration
> and edit 'fvp-features.cfg' to remove duplicate configs.

Included in master.

Thanks,
Jon

> 
> Change-Id: I49617bdac554571aa1242080797cb60327e527da
> Signed-off-by: Anders Dellien <anders.dellien@arm.com>
> ---
>  .../bsp/arm-platforms/fvp-arm32-standard.scc  |  3 ++-
>  .../bsp/arm-platforms/fvp-arm32.scc           |  2 --
>  .../arm-platforms/fvp-arm32/fvp-features.cfg  | 25 +++----------------
>  .../0001-ARM-vexpress-enable-GICv3.patch      |  0
>  .../fvp-base-arm32-dts.patch                  |  0
>  .../linux/linux-arm-platforms.inc             |  3 ++-
>  6 files changed, 8 insertions(+), 25 deletions(-)
>  rename meta-arm-bsp/recipes-kernel/linux/{arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32 => files/fvp-base-arm32}/0001-ARM-vexpress-enable-GICv3.patch (100%)
>  rename meta-arm-bsp/recipes-kernel/linux/files/{ => fvp-base-arm32}/fvp-base-arm32-dts.patch (100%)
> 
> diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32-standard.scc b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32-standard.scc
> index a92d945..6569027 100644
> --- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32-standard.scc
> +++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32-standard.scc
> @@ -1,7 +1,8 @@
>  define KMACHINE fvp-arm32
>  define KTYPE standard
>  define KARCH arm
> -define KMETA_EXTERNAL_BSP t
> +
> +include ktypes/standard/standard.scc
>  
>  include fvp-arm32.scc
>  
> diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32.scc b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32.scc
> index f95b036..85659aa 100644
> --- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32.scc
> +++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32.scc
> @@ -1,8 +1,6 @@
>  include features/input/input.scc
>  include cfg/timer/no_hz.scc
>  
> -patch fvp-arm32/0001-ARM-vexpress-enable-GICv3.patch
> -
>  kconf hardware fvp-arm32/fvp-board.cfg
>  kconf hardware fvp-arm32/fvp-features.cfg
>  kconf hardware fvp/fvp-net.cfg
> diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32/fvp-features.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32/fvp-features.cfg
> index 42cd476..12e7697 100644
> --- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32/fvp-features.cfg
> +++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32/fvp-features.cfg
> @@ -1,26 +1,9 @@
> -CONFIG_MODULES=y
> -CONFIG_BLK_DEV_INITRD=y
> -CONFIG_EXT4_FS=y
> -CONFIG_BINFMT_SCRIPT=y
>  CONFIG_BINFMT_MISC=y
> -CONFIG_PRINTK_TIME=y
> +CONFIG_BOUNCE=y
>  CONFIG_HIGHMEM=y
> -CONFIG_IKCONFIG=y
> -CONFIG_IKCONFIG_PROC=y
> -CONFIG_TMPFS=y
> -CONFIG_TMPFS_POSIX_ACL=y
> -CONFIG_TMPFS_XATTR=y
> -CONFIG_DEVTMPFS=y
> -CONFIG_DEVTMPFS_MOUNT=y
> -CONFIG_DEBUG_FS=y
> -CONFIG_GENERIC_SCHED_CLOCK=y
> -CONFIG_CLKDEV_LOOKUP=y
> -CONFIG_NET=y
> -CONFIG_NETDEVICES=y
> -CONFIG_UNIX=y
> -CONFIG_ETHERNET=y
> +CONFIG_HIGHPTE=y
> +CONFIG_KERNEL_MODE_NEON=y
> +CONFIG_NEON=y
>  CONFIG_VFP=y
>  CONFIG_VFPv3=y
> -CONFIG_NEON=y
> -CONFIG_KERNEL_MODE_NEON=y
>  
> diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32/0001-ARM-vexpress-enable-GICv3.patch b/meta-arm-bsp/recipes-kernel/linux/files/fvp-base-arm32/0001-ARM-vexpress-enable-GICv3.patch
> similarity index 100%
> rename from meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32/0001-ARM-vexpress-enable-GICv3.patch
> rename to meta-arm-bsp/recipes-kernel/linux/files/fvp-base-arm32/0001-ARM-vexpress-enable-GICv3.patch
> diff --git a/meta-arm-bsp/recipes-kernel/linux/files/fvp-base-arm32-dts.patch b/meta-arm-bsp/recipes-kernel/linux/files/fvp-base-arm32/fvp-base-arm32-dts.patch
> similarity index 100%
> rename from meta-arm-bsp/recipes-kernel/linux/files/fvp-base-arm32-dts.patch
> rename to meta-arm-bsp/recipes-kernel/linux/files/fvp-base-arm32/fvp-base-arm32-dts.patch
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
> index 79ef26e..b76d68b 100644
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
> @@ -41,7 +41,8 @@ SRC_URI_append_fvp-base = " file://fvp-base-dts.patch"
>  #
>  COMPATIBLE_MACHINE_fvp-base-arm32 = "fvp-base-arm32"
>  KMACHINE_fvp-base-arm32 = "fvp-arm32"
> -SRC_URI_append_fvp-base-arm32 = " file://fvp-base-arm32-dts.patch"
> +SRC_URI_append_fvp-base-arm32 = " file://fvp-base-arm32-dts.patch \
> +                                  file://0001-ARM-vexpress-enable-GICv3.patch"
>  
>  #
>  # Juno KMACHINE
> -- 
> 2.17.1
> 

> 
> 
> 

