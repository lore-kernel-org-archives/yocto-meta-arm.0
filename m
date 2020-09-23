Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web11.3309.1600825039989334999
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 22 Sep 2020 18:37:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=BrpOLTjJ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f195.google.com with SMTP id w16so21331743qkj.7
        for <meta-arm@lists.yoctoproject.org>; Tue, 22 Sep 2020 18:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tvhW6f4RTLRIVHTGtvsworL0x/1SKufVx5vPcq4iNck=;
        b=BrpOLTjJiVkjscNCkVQClptlfoi+brBT4m5kfHGQ1l4qxuLzdV8klM31ses5immClG
         vlRswhaVOkuUjgqxfGkj2EWc0KnmxvLdStm1PChuRVVVcE8lI95YNZhmQ1dVkhVQIFum
         I3/KxVxD3gOusKUSIhBpEKcnr7EBfwqVCnPaFl6p8s/zkQwFsbmM14ig7rZys8NBO+8Y
         zeFkBXdNvYb5rnxsLDysnZDq04akJCC/RsuWjgpZS6LxIrEmO5xYzK2wWCzzJsOL0nt2
         iKBtHb8+FwV+Gr6IqicqJOlr89JIYvyn1gvzDHLoKEwwLfYW2WAJb9JPY1DN44b3YeOA
         qELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tvhW6f4RTLRIVHTGtvsworL0x/1SKufVx5vPcq4iNck=;
        b=ZpfN0RRaoZR7dk9MSMhAvWLYrSW6O73V35AnGSvfNZTB1Krk/E/TCU655751ZPmJw9
         rafe7cwk7qA4oSzo2+Gd5SLAXDXIRXiUeLfjwadw4dHXEowWcvZrQTJ6y2k+IN4lKw1M
         DJQyF99DFEsbKLi8Q0BOKiMKNuAlFeNk8VhMFVF+Y+WXu1fAWuQpkh5WOqCTUN3E/qgW
         ghU8PCsByNHWKh11kqNuYcaCsdOs546iDhQPZhiFSu8BgyCvwOUpuLMBYvasxoVyPgWr
         j5TBkOKM5b56GiPJk/GU9lVEOLDtUmpHXvpCweu5am6d7cLWenUMcl7ZZxBphQqoimCh
         EcMg==
X-Gm-Message-State: AOAM533PQG4CuZkVdtbMPv6c89mFHnxHpvVuR6JS99sneRSeupM17ET/
	0mLNLsDXwuTUBdvDaQ5PzDj7Bw==
X-Google-Smtp-Source: ABdhPJyhXdUnqhlwXu8X/9PLeyasN1zHqNH8uQgn7PzMuIfaDTfFKg/7bc3VElNlfdOafVCKNbLpdQ==
X-Received: by 2002:a05:620a:1266:: with SMTP id b6mr7911786qkl.371.1600825039080;
        Tue, 22 Sep 2020 18:37:19 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id g12sm12917692qke.90.2020.09.22.18.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 18:37:18 -0700 (PDT)
Date: Tue, 22 Sep 2020 21:37:16 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Anders Dellien <anders.dellien@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-bsp/recipes-kernel: Update fvp-base-arm32 BSP definition
Message-ID: <20200923013715.GA19045@kudzu.us>
References: <20200922152757.26272-1-anders.dellien@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200922152757.26272-1-anders.dellien@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 22, 2020 at 04:27:57PM +0100, Anders Dellien wrote:
> Update to use the yocto-kernel-cache 'standard' configuration
> and edit 'fvp-features.cfg' to remove duplicate configs.
> 
> Change-Id: I49617bdac554571aa1242080797cb60327e527da
> Signed-off-by: Anders Dellien <anders.dellien@arm.com>

I'm seeing the following error when building with this patch on poky

ERROR: linux-yocto-5.4.65+gitAUTOINC+0d860e0757_406008bf32-r0 do_kernel_metadata: Could not generate configuration queue for fvp-arm32.
ERROR: linux-yocto-5.4.65+gitAUTOINC+0d860e0757_406008bf32-r0 do_kernel_metadata: Execution of '/home/jdm/yocto/poky/build/tmp/work/fvp_base_arm32-poky-linux-gnueabi/linux-yocto/5.4.65+gitAUTOINC+0d860e0757_406008bf32-r0/temp/run.do_kernel_metadata.17584' failed with exit code 1:
#
# scc v0.8
# processed: Wed 23 Sep 2020 01:29:25 AM UTC
#
# This is a scc output file, do not edit
#
[ERROR]: processing of file /tmp/tmp.QDfblVF700 failed
# _reloc_dir /home/jdm/yocto/poky/build/tmp/work/fvp_base_arm32-poky-linux-gnueabi/linux-yocto/5.4.65+gitAUTOINC+0d860e0757_406008bf32-r0
# _reloc_dir /home/jdm/yocto/poky/build/tmp/work/fvp_base_arm32-poky-linux-gnueabi/linux-yocto/5.4.65+gitAUTOINC+0d860e0757_406008bf32-r0
# _reloc_dir /home/jdm/yocto/poky/build/tmp/work/fvp_base_arm32-poky-linux-gnueabi/linux-yocto/5.4.65+gitAUTOINC+0d860e0757_406008bf32-r0
# _reloc_dir /home/jdm/yocto/poky/build/tmp/work/fvp_base_arm32-poky-linux-gnueabi/linux-yocto/5.4.65+gitAUTOINC+0d860e0757_406008bf32-r0
# _reloc_dir /home/jdm/yocto/meta-arm/meta-arm-bsp/recipes-kernel/linux/files
# _reloc_dir /home/jdm/yocto/meta-arm/meta-arm-bsp/recipes-kernel/linux
/home/jdm/yocto/poky/build/tmp/hosttools/dirname: invalid option -- 'd'
Try '/home/jdm/yocto/poky/build/tmp/hosttools/dirname --help' for more information.
WARNING: exit code 1 from a shell command.

It looks like it's not coming together with the patch.  I removed the
patch and it worked.  So, that might be a good place to start the
debug.

Thanks,
Jon


> ---
>  .../bsp/arm-platforms/fvp-arm32-standard.scc  |  3 ++-
>  .../bsp/arm-platforms/fvp-arm32.scc           |  2 --
>  .../arm-platforms/fvp-arm32/fvp-features.cfg  | 25 +++----------------
>  .../0001-ARM-vexpress-enable-GICv3.patch      |  0
>  .../linux/linux-arm-platforms.inc             |  3 ++-
>  5 files changed, 8 insertions(+), 25 deletions(-)
>  rename meta-arm-bsp/recipes-kernel/linux/{arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32 => files/fvp-base-arm32}/0001-ARM-vexpress-enable-GICv3.patch (100%)
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

