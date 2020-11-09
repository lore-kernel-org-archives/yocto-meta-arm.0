Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.17979.1604954403101502967
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 09 Nov 2020 12:40:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=D5gsBWlC;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f195.google.com with SMTP id y197so9306102qkb.7
        for <meta-arm@lists.yoctoproject.org>; Mon, 09 Nov 2020 12:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MGva/173vTPFduD6Qyt9tz0dKD/u6e6ZumvFBPp24Kg=;
        b=D5gsBWlCDoTBJ/kHyCUMG+PSnGBPZkfaRNEf0YVrheBJPqKTcBCWA1GXz81oG3v4FD
         96Iwp8H94PkzEwEplhi5yDAz7hEpLeqDcWTsv3Mbmu8SXPe10RgaRqYk24bf/ngVDuwt
         KIjEtPHH1P16puh2i69OdrHg4Y5j2L0LsgWPbZUjhBVBasjCsTx2PRVHigDTBZQC04yl
         6zHJJFT18zgx62P1TbbUu0bUdhqKhXwPyPgQCSi97KW5xQnm5soNeyQubJpoRZtIf5Qf
         w/ZoRvrRAb/s8q+45AbVYirANkWka7BrTnz4h/qvXA1aqppjMJnEpIPPigapOhchLU7V
         y7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MGva/173vTPFduD6Qyt9tz0dKD/u6e6ZumvFBPp24Kg=;
        b=e9KENNik03TscP/yv82oJ4d0+ZO9wxrF9w9uhX57OQ7Zc2jfHFT0B5h2CjKRe2zx1e
         gj0wPRQIJCcVvcDQFDnOFfuGiwv1cRZCpbKGQGBGJitNxwPvnb4uIF7sPGagEMQAHokq
         4AHoANQLpWWafpPf6iXGYWgjnP09AG6xMCUT7GChRap3J4vwC/a9oY9D3B9k0syIhZti
         WEEn5jqUxQQ7vHxaR4qiLpo73EmGqWpfFRqpfS4FPBuVCiQoRAhLup1XHTTFIEf/Iyr9
         LVhlNkFibzXPJAa8SJt8717oJTck2IdLgXLI80zTryzrcPqc7NLM94aUd/Bd8tnuYPGk
         kvcA==
X-Gm-Message-State: AOAM5322tyY03Kd16CWFXcsXV5pGsrN3BjFOGYMj+shObgAeHGZEdsGU
	d9a3ZnpqdDdhnAhaed6lkPK0ew==
X-Google-Smtp-Source: ABdhPJzMVBqQTWDoxke6hjldPCUiI2A4QY3Bvbwx5KOd/zKTrvVEW6z/Yo66jsIxWOYDiGlrQLgINA==
X-Received: by 2002:a37:a481:: with SMTP id n123mr15425110qke.114.1604954402248;
        Mon, 09 Nov 2020 12:40:02 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:e05c:37c6:4b68:d472])
        by smtp.gmail.com with ESMTPSA id s134sm2442649qke.99.2020.11.09.12.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 12:40:01 -0800 (PST)
Date: Mon, 9 Nov 2020 15:40:00 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-autonomy/linux-arm-autonomy: Introduce xen-common.scc KERNEL_FEATURES
Message-ID: <20201109203959.GD17359@kudzu.us>
References: <de4c26d7c083cda26d9280ce7ec17f7013821244.1604915177.git.diego.sueiro@arm.com>
MIME-Version: 1.0
In-Reply-To: <de4c26d7c083cda26d9280ce7ec17f7013821244.1604915177.git.diego.sueiro@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 09, 2020 at 09:47:34AM +0000, Diego Sueiro wrote:
> Add xen-common.scc KERNEL_FEATURES to group common kernel configs and patches
> for both Xen Host and Guest.
> 
> Change-Id: I3a14386e387b9778c962dd9fdbe9a60ce2e97e77
> Issue-Id: SCM-1520
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>

Patch pushed to master.

Thanks,
Jon

> ---
>  .../features/arm-autonomy/xen-common.cfg           | 31 ++++++++++++++++++++++
>  .../features/arm-autonomy/xen-common.scc           |  5 ++++
>  .../features/arm-autonomy/xen-guest.cfg            | 26 ------------------
>  .../features/arm-autonomy/xen-guest.scc            |  2 --
>  .../features/arm-autonomy/xen-host.cfg             | 28 -------------------
>  .../features/arm-autonomy/xen-host.scc             |  2 --
>  .../recipes-kernel/linux/linux-arm-autonomy.inc    |  6 +++++
>  7 files changed, 42 insertions(+), 58 deletions(-)
>  create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-common.cfg
>  create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-common.scc
> 
> diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-common.cfg b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-common.cfg
> new file mode 100644
> index 0000000..1e61403
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-common.cfg
> @@ -0,0 +1,31 @@
> +CONFIG_PARAVIRT=y
> +CONFIG_XEN=y
> +
> +CONFIG_BLOCK=y
> +
> +CONFIG_SCSI=y
> +
> +CONFIG_NET=y
> +
> +CONFIG_HVC_IRQ=y
> +
> +CONFIG_HVC_XEN=y
> +
> +CONFIG_WATCHDOG=y
> +CONFIG_XEN_WDT=y
> +
> +CONFIG_XEN_BALLOON=y
> +
> +CONFIG_XEN_DEV_EVTCHN=y
> +
> +CONFIG_XENFS=y
> +CONFIG_XEN_COMPAT_XENFS=y
> +
> +CONFIG_XEN_SYS_HYPERVISOR=y
> +
> +CONFIG_XEN_GNTDEV=y
> +CONFIG_XEN_GRANT_DEV_ALLOC=y
> +CONFIG_SWIOTLB_XEN=y
> +
> +CONFIG_XEN_EFI=y
> +CONFIG_XEN_AUTO_XLATE=y
> diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-common.scc b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-common.scc
> new file mode 100644
> index 0000000..beee091
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-common.scc
> @@ -0,0 +1,5 @@
> +define KFEATURE_DESCRIPTION "Common XEN (Host and Guest) configs and patches on autonomy systems"
> +
> +kconf non-hardware xen-common.cfg
> +
> +patch 0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti-.patch
> diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-guest.cfg b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-guest.cfg
> index e4e44a9..bb2cbd5 100644
> --- a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-guest.cfg
> +++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-guest.cfg
> @@ -1,27 +1,15 @@
> -CONFIG_PARAVIRT=y
> -CONFIG_XEN=y
> -
> -CONFIG_BLOCK=y
>  CONFIG_XEN_BLKDEV_FRONTEND=y
>  
> -CONFIG_SCSI=y
>  CONFIG_XEN_SCSI_FRONTEND=y
>  
> -CONFIG_NET=y
>  CONFIG_XEN_NETDEV_FRONTEND=y
>  
>  CONFIG_INPUT=y
>  CONFIG_INPUT_MISC=y
>  CONFIG_INPUT_XEN_KBDDEV_FRONTEND=y
>  
> -CONFIG_HVC_IRQ=y
> -
> -CONFIG_HVC_XEN=y
>  CONFIG_HVC_XEN_FRONTEND=y
>  
> -CONFIG_WATCHDOG=y
> -CONFIG_XEN_WDT=y
> -
>  CONFIG_FB_SYS_FILLRECT=y
>  CONFIG_FB_SYS_COPYAREA=y
>  CONFIG_FB_SYS_IMAGEBLIT=y
> @@ -29,21 +17,7 @@ CONFIG_FB_SYS_FOPS=y
>  CONFIG_FB_DEFERRED_IO=y
>  CONFIG_XEN_FBDEV_FRONTEND=y
>  
> -CONFIG_XEN_BALLOON=y
> -
> -CONFIG_XEN_DEV_EVTCHN=y
> -
> -CONFIG_XENFS=y
> -CONFIG_XEN_COMPAT_XENFS=y
> -
> -CONFIG_XEN_SYS_HYPERVISOR=y
>  CONFIG_XEN_XENBUS_FRONTEND=y
> -CONFIG_XEN_GNTDEV=y
> -CONFIG_XEN_GRANT_DEV_ALLOC=y
> -CONFIG_SWIOTLB_XEN=y
> -
> -CONFIG_XEN_EFI=y
> -CONFIG_XEN_AUTO_XLATE=y
>  
>  CONFIG_DRM=y
>  CONFIG_DRM_XEN=y
> diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-guest.scc b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-guest.scc
> index b681177..17ded00 100644
> --- a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-guest.scc
> +++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-guest.scc
> @@ -1,5 +1,3 @@
>  define KFEATURE_DESCRIPTION "Enable XEN Guest Frontend Drivers"
>  
>  kconf non-hardware xen-guest.cfg
> -
> -patch 0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti-.patch
> diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.cfg b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.cfg
> index d457cb8..54bd605 100644
> --- a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.cfg
> +++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.cfg
> @@ -1,38 +1,10 @@
> -CONFIG_PARAVIRT=y
> -CONFIG_XEN=y
> -
> -CONFIG_BLOCK=y
>  CONFIG_XEN_BLKDEV_BACKEND=y
>  
> -CONFIG_SCSI=y
>  CONFIG_TARGET_CORE=y
>  CONFIG_XEN_SCSI_BACKEND=y
>  
> -CONFIG_NET=y
>  CONFIG_XEN_NETDEV_BACKEND=y
>  
> -CONFIG_HVC_IRQ=y
> -
> -CONFIG_HVC_XEN=y
> -
> -CONFIG_WATCHDOG=y
> -CONFIG_XEN_WDT=y
> -
> -CONFIG_XEN_BALLOON=y
> -
> -CONFIG_XEN_DEV_EVTCHN=y
> -
> -CONFIG_XENFS=y
> -CONFIG_XEN_COMPAT_XENFS=y
> -
> -CONFIG_XEN_SYS_HYPERVISOR=y
> -CONFIG_XEN_GNTDEV=y
> -CONFIG_XEN_GRANT_DEV_ALLOC=y
> -CONFIG_SWIOTLB_XEN=y
> -
> -CONFIG_XEN_EFI=y
> -CONFIG_XEN_AUTO_XLATE=y
> -
>  # For LVM2 we need Multiple Devices and Device Mapper support
>  CONFIG_MD=y
>  CONFIG_BLK_DEV_DM=y
> diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.scc b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.scc
> index 61b96a2..7185775 100644
> --- a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.scc
> +++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.scc
> @@ -1,5 +1,3 @@
>  define KFEATURE_DESCRIPTION "Enable XEN Host Drivers on autonomy systems"
>  
>  kconf non-hardware xen-host.cfg
> -
> -patch 0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti-.patch
> diff --git a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> index d59ca8f..c5cb66d 100644
> --- a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> +++ b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> @@ -7,6 +7,11 @@ FILESEXTRAPATHS_prepend := "${THISDIR}:"
>  #
>  SRC_URI_append = " file://arm-autonomy-kmeta;type=kmeta;name=arm-autonomy-kmeta;destsuffix=arm-autonomy-kmeta"
>  
> +# Add common Xen (host and guest) configs and patches
> +KERNEL_FEATURES += "${@bb.utils.contains_any('DISTRO_FEATURES', \
> +        'arm-autonomy-host arm-autonomy-guest', \
> +        'features/arm-autonomy/xen-common.scc', '', d)}"
> +
>  
>  # Add xen host drivers to kernel if arm-autonomy-host is activated
>  KERNEL_FEATURES += "${@bb.utils.contains('DISTRO_FEATURES', \
> @@ -20,6 +25,7 @@ KERNEL_FEATURES += "${@bb.utils.contains('DISTRO_FEATURES', \
>  KERNEL_FEATURES += "${@bb.utils.contains('DISTRO_FEATURES', \
>          'arm-autonomy-guest', 'features/arm-autonomy/xen-guest.scc', '', d)}"
>  
> +
>  # Add support for arm64-autonomy-guest machine
>  COMPATIBLE_MACHINE_arm64-autonomy-guest = "arm64-autonomy-guest"
>  KMACHINE_arm64-autonomy-guest = "arm64-autonomy-guest"
> -- 
> 2.7.4
> 

> 
> 
> 

