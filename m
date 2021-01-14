Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.442.1610652201305479318
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 14 Jan 2021 11:23:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=b1ypQHOc;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.54, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f54.google.com with SMTP id j18so2850579qvu.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 14 Jan 2021 11:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mkA8aQF+l3dqiu3uPsZItQ1obHUfaMKlkPChgtsJtJk=;
        b=b1ypQHOcXoDikP36xnv5gx5Oau6NbgBXVEEJ6cfN6Hrz5XUM94wIkCHcgC9cefBb0D
         r/aVBfaSBCnwGw4CR7oXDUEBkfzIPkM1gcwZOIZDblu8mD8EVtubSUYo3XzIYxMZmY/A
         rbpyXe3a8wAi/RMA9hL3XrXN/7RF6MLhUlYNY9faI2zA2Fyz3ZzLZjAe4nqe24b5Ccn6
         10jf61rMGvgdG1LbP7SJwJS7dkVRzXNhu3b3JghDlO0w+bAS4MsouxX4jTpQ92th3A4p
         i/aiC25yal63Jag5hvoHEV9RETJAJDYOMRjFiVowDOD6aKuPIKqvPCvKyJoHwKfHjHTq
         jAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mkA8aQF+l3dqiu3uPsZItQ1obHUfaMKlkPChgtsJtJk=;
        b=B6Gi7LL8gYO4vCgjyPVlUat/KB1WzrquxIfJMCFDaN5+hE/i/7wEZBzUBTz3yHwNXq
         D8depp54Vgh6XCmamGtu0me6apQ5ubcz066ysyqY0V7ZySCYPT0RQcByo9la/Kx3JMft
         MKSAPvT/NyYBmxn2336CWM/j6dewmjndcfZxCT1xX75Vj9nH4BS1WJj1e09xRi1pNHQb
         COSX2p0uPPU4wsbM9/hgTyTteRzQiI3Wj7xkOSMe1Zq8Cq+vbEpxJF/sPrsHPRmgcsxJ
         89+LXcsmi+sehYC+R3fRlu7E2+BLbokFss8EZ/nvqMvSdF/iq5w8MD0rnk376DMr6Xzp
         TvYw==
X-Gm-Message-State: AOAM531hPsuPCZkoUbY5LDJgY5/KQh7wGrWet67Bg2lWUJtH/8GT5u+2
	ZzuD/VijE+2T6wR3WmFu8WhHIqRWUhGqmA==
X-Google-Smtp-Source: ABdhPJzgHkZCLJqNkFL9mTzPNIB88fBBLyGKJ4dJui1WZgPihAM60CJMugg/WH2GSVXMNyOQPCIvQA==
X-Received: by 2002:ad4:54a3:: with SMTP id r3mr8647212qvy.26.1610652200479;
        Thu, 14 Jan 2021 11:23:20 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a62f:6d00:1d40:95cb:6898:8d5])
        by smtp.gmail.com with ESMTPSA id x25sm3511390qkx.88.2021.01.14.11.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 11:23:20 -0800 (PST)
Date: Thu, 14 Jan 2021 14:23:18 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Anders Dellien <anders.dellien@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-bsp/fvp-base*: move to u-boot 2020.10
Message-ID: <20210114192317.GE511@kudzu.us>
References: <20210112123452.12408-1-anders.dellien@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210112123452.12408-1-anders.dellien@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 12, 2021 at 12:34:52PM +0000, Anders Dellien wrote:
> Move both FVP platforms to u-boot 2020.10
> 
> Change-Id: If94bb5a343e2709574f84283f39d8d227b32d84d
> Signed-off-by: Anders Dellien <anders.dellien@arm.com>
> ---

Pulled into master.

Thanks,
Jon

>  meta-arm-bsp/conf/machine/fvp-common.inc            |  2 +-
>  .../0001-Add-vexpress_aemv8a_aarch32-variant.patch  |  0
>  .../fvp-base}/u-boot_vexpress_fvp.patch             |  0
>  .../recipes-bsp/u-boot/u-boot_2020.07.bbappend      | 11 -----------
>  .../recipes-bsp/u-boot/u-boot_2020.10.bbappend      | 13 +++++++++++++
>  5 files changed, 14 insertions(+), 12 deletions(-)
>  rename meta-arm-bsp/recipes-bsp/u-boot/{u-boot-2020.07 => u-boot-2020.10}/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch (100%)
>  rename meta-arm-bsp/recipes-bsp/u-boot/{u-boot-2020.07/fvp-common => u-boot-2020.10/fvp-base}/u-boot_vexpress_fvp.patch (100%)
>  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.10.bbappend
> 
> diff --git a/meta-arm-bsp/conf/machine/fvp-common.inc b/meta-arm-bsp/conf/machine/fvp-common.inc
> index 9697de5..cdfb538 100644
> --- a/meta-arm-bsp/conf/machine/fvp-common.inc
> +++ b/meta-arm-bsp/conf/machine/fvp-common.inc
> @@ -31,7 +31,7 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
>  PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
>  PREFERRED_VERSION_linux-yocto ?= "5.4%"
>  
> -PREFERRED_VERSION_u-boot ?= "2020.07"
> +PREFERRED_VERSION_u-boot ?= "2020.10"
>  PREFERRED_VERSION_trusted-firmware-a ?= "2.4%"
>  
>  EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot"
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.10/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
> similarity index 100%
> rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
> rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.10/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/fvp-common/u-boot_vexpress_fvp.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.10/fvp-base/u-boot_vexpress_fvp.patch
> similarity index 100%
> rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/fvp-common/u-boot_vexpress_fvp.patch
> rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.10/fvp-base/u-boot_vexpress_fvp.patch
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend
> index 30d1db8..add6a78 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend
> @@ -2,7 +2,6 @@
>  
>  THIS_DIR := "${THISDIR}"
>  FILESEXTRAPATHS_prepend = "${THIS_DIR}/${BP}:"
> -FILESEXTRAPATHS_prepend_fvp-base = "${THIS_DIR}/${BP}/fvp-common:"
>  
>  #
>  # Corstone-500 MACHINE
> @@ -11,16 +10,6 @@ SRC_URI_append_corstone500 = " \
>                     file://0001-armv7-adding-generic-timer-access-through-MMIO.patch \
>                     file://0002-board-arm-add-corstone500-board.patch"
>  
> -#
> -# FVP BASE KMACHINE
> -#
> -SRC_URI_append_fvp-base = " file://u-boot_vexpress_fvp.patch"
> -
> -#
> -# FVP BASE ARM32 KMACHINE
> -#
> -SRC_URI_append_fvp-base-arm32 = " file://0001-Add-vexpress_aemv8a_aarch32-variant.patch"
> -
>  #
>  # Juno KMACHINE
>  #
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.10.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.10.bbappend
> new file mode 100644
> index 0000000..6067981
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.10.bbappend
> @@ -0,0 +1,13 @@
> +# Machine specific u-boot
> +
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${BP}:"
> +
> +#
> +# FVP BASE
> +#
> +SRC_URI_append_fvp-base = " file://u-boot_vexpress_fvp.patch"
> +
> +#
> +# FVP BASE ARM32
> +#
> +SRC_URI_append_fvp-base-arm32 = " file://0001-Add-vexpress_aemv8a_aarch32-variant.patch"
> -- 
> 2.17.1
> 

> 
> 
> 

