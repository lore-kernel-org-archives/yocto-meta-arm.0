Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web12.3499.1594753087003211408
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jul 2020 11:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=tW2M3pXR;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f194.google.com with SMTP id o38so13683402qtf.6
        for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jul 2020 11:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uw8vPKlvvS0542QYnSkObhqrl8iT6TBBHoErQbVIxkY=;
        b=tW2M3pXR3RDlqKeK5UpAanQIB9KRFGfKrqTaCbfDwSHkI1Qb/rQaPqwCGsNM5x86rj
         NJfgS5PilMX0vqUtihpRNk1lSlsLIvIY1Byyq/zZ2ZRJPn3oJFD6sWdR1xa72ISMYLyP
         oXkWRwwbq1LPNFpnRpqCrDrK+lJ8waYD9hpONcFkljWgc6uJQGr0ks3xPh+RNrs0COq3
         kv8V8KM3jzPH7HBmOB2XPcKJZbOCh0fi329aB9Uls3iWgKHoc9JJAxhv1SNJ92dQdtYS
         HKgY9XrnQZ3SISedYgD2stm83FvNKNzXFvNh6hgld/cw2hA85Sq3J1Yp1qBb/cgpqBHX
         YS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uw8vPKlvvS0542QYnSkObhqrl8iT6TBBHoErQbVIxkY=;
        b=ldcO/7dbySonniZS6NmsO4olkolMRfUZMwqmI2FUwXHbqedrK5fl6p/hzkcV+iGMYp
         zjJm/mR0rSLHE0xupXQAzvQCo/TTUrpdVDTr1AO4XTxWFDIvYXAVl7e6HaAOux5x5r9/
         vF+5UUz5nPKG8qjq05Y7lWGZDRCxPT+no56+BYukbgLu+jFx0BYhzQr2ZRl6iwwbWgB8
         1uL4yZDcQI+En9BBKbKB/sJjLTp5fNFvIQ6M4o2bM3pk/sDh6bkF/nmE3G6MHQfa9/5g
         JXO/uUY8oG8LbgmsgZnjwKIvNHzB7ocmsfLB4ZeiWXmCK4s5MV/EQHLkGoWSn2eUWqfi
         V9AA==
X-Gm-Message-State: AOAM53239n6gNEgnEEMpZ4ORu15EuJAn4jF/xwOGfWJFSHO91nHf/1eC
	KGjHRyuF3q9FWTMeW+8Nem0J3w==
X-Google-Smtp-Source: ABdhPJwD4hEbyxoDT7hWmluuE+2LVCE+hG2tlgKb6SWnZg+5fdlkX+VQIdJLx0wju9+yc69145rqtQ==
X-Received: by 2002:ac8:649:: with SMTP id e9mr6041405qth.314.1594753086131;
        Tue, 14 Jul 2020 11:58:06 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:d523:4dcb:5d9f:3d2])
        by smtp.gmail.com with ESMTPSA id 1sm24166927qki.122.2020.07.14.11.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 11:58:05 -0700 (PDT)
Date: Tue, 14 Jul 2020 14:58:04 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH 1/4] arm-bsp: Migrate a5ds to meta-kernel for stable kernels
Message-ID: <20200714185803.GF17632@kudzu.us>
References: <20200714125834.31338-1-jon.mason@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200714125834.31338-1-jon.mason@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 14, 2020 at 08:58:31AM -0400, Jon Mason wrote:
> a5ds is having issues building its stable kernel on master.  Migrate to
> meta-kernel to fix the build break.  This has the benefit of meta-arm
> not having a unique stable kernel recipe to maintain and support.
> 
> Also, change the name of linux-yocto-arm-platforms to be more
> generic, as it doesn't accurately reflect where it is currently being
> used and can be used by different kernels going forward.
> 
> Change-Id: I4e76c7f1ee4b84641279a389820940fac7130df1
> Signed-off-by: Jon Mason <jon.mason@arm.com>

Series pulled into master.

Thanks,
Jon

> ---
>  meta-arm-bsp/conf/layer.conf                  |  2 +-
>  meta-arm-bsp/conf/machine/a5ds.conf           |  4 ++--
>  ...-platforms.inc => linux-arm-platforms.inc} |  6 +++++
>  .../linux/linux-stable_%.bbappend             |  3 +++
>  .../linux/linux-upstream-arm-platforms.inc    | 24 -------------------
>  .../linux/linux-upstream-arm_5.3.bb           |  8 -------
>  6 files changed, 12 insertions(+), 35 deletions(-)
>  rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto-arm-platforms.inc => linux-arm-platforms.inc} (91%)
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-stable_%.bbappend
>  delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms.inc
>  delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm_5.3.bb
> 
> diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
> index 7fe0e63..bcf08ad 100644
> --- a/meta-arm-bsp/conf/layer.conf
> +++ b/meta-arm-bsp/conf/layer.conf
> @@ -9,5 +9,5 @@ BBFILE_COLLECTIONS += "meta-arm-bsp"
>  BBFILE_PATTERN_meta-arm-bsp = "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-arm-bsp = "6"
>  
> -LAYERDEPENDS_meta-arm-bsp = "core meta-arm"
> +LAYERDEPENDS_meta-arm-bsp = "core meta-arm meta-kernel"
>  LAYERSERIES_COMPAT_meta-arm-bsp = "warrior zeus dunfell"
> diff --git a/meta-arm-bsp/conf/machine/a5ds.conf b/meta-arm-bsp/conf/machine/a5ds.conf
> index fa7d88e..e7180e9 100644
> --- a/meta-arm-bsp/conf/machine/a5ds.conf
> +++ b/meta-arm-bsp/conf/machine/a5ds.conf
> @@ -6,8 +6,8 @@
>  
>  require conf/machine/include/tune-cortexa5.inc
>  
> -PREFERRED_PROVIDER_virtual/kernel ?= "linux-upstream-arm"
> -PREFERRED_VERSION_linux-upstream-arm ?= "5.3%"
> +PREFERRED_PROVIDER_virtual/kernel ?= "linux-stable"
> +PREFERRED_VERSION_linux-stable ?= "5.3%"
>  KBUILD_DEFCONFIG = "multi_v7_defconfig"
>  
>  EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot"
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
> similarity index 91%
> rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto-arm-platforms.inc
> rename to meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
> index 3ddebb9..fb37610 100644
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-arm-platforms.inc
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
> @@ -15,6 +15,12 @@ SRC_URI_append_juno = " ${SRC_URI_KMETA}"
>  SRC_URI_append_gem5-arm64 = " ${SRC_URI_KMETA}"
>  SRCREV_arm-platforms-kmeta = "6147e82375aa9df8f2a162d42ea6406c79c854c5"
>  
> +#
> +# Cortex-A5 DesignStart KMACHINE
> +#
> +COMPATIBLE_MACHINE_a5ds = "a5ds"
> +KMACHINE_a5ds = "a5ds"
> +
>  #
>  # FVP FOUNDATION KMACHINE
>  #
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable_%.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-stable_%.bbappend
> new file mode 100644
> index 0000000..db850ea
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-stable_%.bbappend
> @@ -0,0 +1,3 @@
> +# Add support for Arm Platforms (boards or simulators)
> +
> +require linux-arm-platforms.inc
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms.inc
> deleted file mode 100644
> index 472cea8..0000000
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms.inc
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -DESCRIPTION = "Linux Kernel based on upstream tree"
> -SECTION = "kernel"
> -LICENSE = "GPLv2"
> -SRCREV_FORMAT = "kernel"
> -
> -require recipes-kernel/linux/linux-yocto.inc
> -
> -KERNEL_VERSION_SANITY_SKIP = "1"
> -
> -S = "${WORKDIR}/git"
> -
> -# Override do_kernel_configme to avoid kernel being assembled into a linux-yocto
> -# style kernel
> -# https://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#ref-tasks-kernel_configme
> -do_kernel_configme[noexec] = "1"
> -
> -# Make sure no branch is defined since here we track a specific version
> -KBRANCH = ""
> -
> -LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> -
> -SRC_URI = "\
> -        git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux;protocol=git;nobranch=1 \
> -        "
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm_5.3.bb b/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm_5.3.bb
> deleted file mode 100644
> index 88a06c4..0000000
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm_5.3.bb
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -# Add support for Upstream Kernel for Arm Platforms (boards or simulators)
> -
> -SUMMARY = "Linux Kernel Upstream, supported by Arm/Linaro"
> -
> -require recipes-kernel/linux/linux-upstream-arm-platforms.inc
> -
> -SRCREV = "v${PV}"
> -LINUX_VERSION ?= "${PV}"
> -- 
> 2.17.1
> 

> 

