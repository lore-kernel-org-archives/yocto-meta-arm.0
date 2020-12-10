Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web09.13785.1607609210710293896
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 10 Dec 2020 06:06:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=LJo+7COO;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.67, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f67.google.com with SMTP id l14so2398597qvh.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 10 Dec 2020 06:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=D8f5K0ZjtNyH7nHTPLurq79Bnmfg6fLuKKpHUgawHZY=;
        b=LJo+7COO803DBsPnp6Nv7NWi0FZ0XgQVfapjioj68XogW3evxDsvWtNJFlLp0Dm1Lh
         TvqZC1v8sojItSM5hQgNZHL76UxBFy2NeldN6a7wg3sRhdIB/obTHgfLo5/zBe3Fk2Q+
         MNdggcdZO6DaNvcgFo5CgkqI3hotNnEFd4PO1HPLCk5xkGVGaFuJs50tMfY/5WrfX1U1
         QjcEvHy5PVpHeHopFEtdP9MQ/lP+DdabzFLBJk6ljAVrahqllB8ZRthMGfs1kufXFkeB
         JlMFOIZ/ZFsJzoiY6mHFd+neWLOEn3BJYEEMlONwKnhMgw2Nm1/fwUYlu0Mx9YV7y795
         3kJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=D8f5K0ZjtNyH7nHTPLurq79Bnmfg6fLuKKpHUgawHZY=;
        b=VJDg8lzg2w5haKxz1a3R64Xi4UMruT6JUfDJqRXzC5AH975geeoRnrMRdhfDJnuaVI
         n91tgSKYTSCkMwf+mM5Wc8xG0atc2n8V4+eQjFEnxc2wEFa/o7/YUIFO6podKOWh/izn
         k9/7jZMeb4sdtXXANpOPo8ON5p/38PRjSx1psQA2NwdpwdWXe5yXfJGiBuBqOXGnbjDV
         OzgS4Gy/nGq/eEnoBb3fyeXicRAJwLXsJn0fYlwr9SzYlPn9f8Ykxu+LVNkugI/mpvLg
         J0ehnMjycOPqXUDNz/DA0LBaOvCmXZlanUNTTaWuGMIM/N6LipCTPMhYU2H/okiLiWUx
         YuOw==
X-Gm-Message-State: AOAM532+0fDoQWcwnU8OR0pt6oXYm7mIJvbErz1sldZZBJISXips3cEu
	ErpNgPgmsMIht2wcLkZYyHS+357xilWpXQ==
X-Google-Smtp-Source: ABdhPJx/H5vcEAFR7Nz/2p3a8S2xfzReL7ToQFYEHrRIdJoJ5wowKt0nZc1uO1W10d9UFa33L9nRRg==
X-Received: by 2002:a0c:d407:: with SMTP id t7mr9301806qvh.21.1607609208407;
        Thu, 10 Dec 2020 06:06:48 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a606:1b00:8083:6d46:abe1:7466])
        by smtp.gmail.com with ESMTPSA id a194sm2244099qkc.70.2020.12.10.06.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 06:06:47 -0800 (PST)
Date: Thu, 10 Dec 2020 09:06:46 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/3] arm-bsp: switch to linux-yocto for a5ds
Message-ID: <20201210140645.GD27847@kudzu.us>
References: <20201210135721.29575-1-jon.mason@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201210135721.29575-1-jon.mason@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 10, 2020 at 08:57:19AM -0500, Jon Mason wrote:
> Keeping with what is being done on the master branch, switch to using
> linux-yocto for the 5.3 kernel.
> 
> Change-Id: Ic327c6ea6e22d6fc0dd41dfb30755c677e5defff
> Signed-off-by: Jon Mason <jon.mason@arm.com>

Series added to dunfell branch

> ---
>  meta-arm-bsp/conf/layer.conf                      |  2 +-
>  meta-arm-bsp/conf/machine/a5ds.conf               |  5 +++--
>  .../recipes-kernel/linux/linux-stable_%.bbappend  |  3 ---
>  .../recipes-kernel/linux/linux-yocto_5.3.bb       | 15 +++++++++++++++
>  4 files changed, 19 insertions(+), 6 deletions(-)
>  delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-stable_%.bbappend
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3.bb
> 
> diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
> index 0b6985c..1a54ddc 100644
> --- a/meta-arm-bsp/conf/layer.conf
> +++ b/meta-arm-bsp/conf/layer.conf
> @@ -9,5 +9,5 @@ BBFILE_COLLECTIONS += "meta-arm-bsp"
>  BBFILE_PATTERN_meta-arm-bsp = "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-arm-bsp = "6"
>  
> -LAYERDEPENDS_meta-arm-bsp = "core openembedded-layer meta-arm meta-kernel"
> +LAYERDEPENDS_meta-arm-bsp = "core openembedded-layer meta-arm"
>  LAYERSERIES_COMPAT_meta-arm-bsp = "warrior zeus dunfell"
> diff --git a/meta-arm-bsp/conf/machine/a5ds.conf b/meta-arm-bsp/conf/machine/a5ds.conf
> index e7180e9..331d298 100644
> --- a/meta-arm-bsp/conf/machine/a5ds.conf
> +++ b/meta-arm-bsp/conf/machine/a5ds.conf
> @@ -6,9 +6,10 @@
>  
>  require conf/machine/include/tune-cortexa5.inc
>  
> -PREFERRED_PROVIDER_virtual/kernel ?= "linux-stable"
> -PREFERRED_VERSION_linux-stable ?= "5.3%"
> +PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
> +PREFERRED_VERSION_linux-yocto ?= "5.3%"
>  KBUILD_DEFCONFIG = "multi_v7_defconfig"
> +KCONFIG_MODE = "--alldefconfig"
>  
>  EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot"
>  
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable_%.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-stable_%.bbappend
> deleted file mode 100644
> index db850ea..0000000
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-stable_%.bbappend
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -# Add support for Arm Platforms (boards or simulators)
> -
> -require linux-arm-platforms.inc
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3.bb b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3.bb
> new file mode 100644
> index 0000000..9d5e9ce
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.3.bb
> @@ -0,0 +1,15 @@
> +KBRANCH = "v5.3/base"
> +
> +require recipes-kernel/linux/linux-yocto.inc
> +
> +SRCREV_machine = "d4f3318ed8fab6316cb7a269b8f42306632a3876"
> +SRCREV_meta = "8d0ed83a864cc91eef4d2abbc90f13d4ecd1c213"
> +
> +SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
> +           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
> +
> +LINUX_VERSION = "5.3.18"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> +
> +PV = "${LINUX_VERSION}+git${SRCPV}"
> +KMETA = "kernel-meta"
> -- 
> 2.17.1
> 

> 
> 
> 

