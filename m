Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web11.1809.1602092142734098955
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 07 Oct 2020 10:35:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=MZwMaA80;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f195.google.com with SMTP id c2so3753306qkf.10
        for <meta-arm@lists.yoctoproject.org>; Wed, 07 Oct 2020 10:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=u/e0onhd7df5rBgTRs026S34VwIT2wK7WCax/ubQwZU=;
        b=MZwMaA80v1VJkGodLSisJp0A8iwJIGush6SVL2AWCJ3cGh+NxwXLnBWhzNYSQPxB5D
         0TOCmpRpUovdUSyx1CJKArrCnGgWYx6EnISVy/e3vggIhqgAWGsvUnZTsJVdk9WfU11P
         J2wLfpTGqfAvRDo1F2cWTj5r16N3ph7Mv+ENqv1U0vIsLFa3ao2XLSRwV2iLE2bvj6Yt
         H6Pv8cahGzjI8bW1FE4ZkLu1NB3pjTrfQsy876kgpaSopD9dH869L2irvRfIhv+lHPnl
         W+j3w8QCLHsv1DfQpRioV8Rq61TSBLGw3sSY9/0CnzaG2159IY8BfXJKsZl/w/khTjPO
         mVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=u/e0onhd7df5rBgTRs026S34VwIT2wK7WCax/ubQwZU=;
        b=RfALxCl/QPLZuLDSD0L4QBfPuxMtUJEIs4IMCUIjEs7ht7Hd7vcdonNonHw/Wvenfq
         TqHR2CYTN4OQhPRUyVQLr4avRA9+lxc6+Xxc2RkRtWm/Po329X2bT+fGcWrFkWYo5lXR
         gKsBOwWaKugLR35qP7QdkoZeqlYzaZ+gTsMtjK4q5WgQWzLP3gcCaTxyd4GRiTGDSu8l
         KERgj2iDEE8bNLLpeIGDdcjXlWSSkGOwIOIUJ3oQyYrYGpN38TRgKJNWpuzPkzoBJLzE
         6xZdf3zzy6JA9MdZqVm4M/17K0R7zj1ojuuGUMx5sRLHF0l6P9WA+ckSDBwrzNY0PY/x
         gaTQ==
X-Gm-Message-State: AOAM533Le+XMfSSmzWyQj7q9c5dsQ2vGA5dPrtt8K7gMZeMP972QEQU2
	XLg5XF5IWgFcHWwNlljOtEpjvw==
X-Google-Smtp-Source: ABdhPJxY/ZP2V8ekFXdUt7pJKZJ2zLfLgv+r6UIu9KBaVyxRpgmc6CCaEr3QavuTmaf8kgzUXrtX+A==
X-Received: by 2002:a37:4854:: with SMTP id v81mr4123846qka.20.1602092141788;
        Wed, 07 Oct 2020 10:35:41 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id r190sm1972038qkf.101.2020.10.07.10.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 10:35:41 -0700 (PDT)
Date: Wed, 7 Oct 2020 13:35:36 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: lakshmi Kailasanathan <lakshmi.kailasanathan@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-bsp/corstone700-mps3: Enabling NXP ISP1763 USB host controller in linux
Message-ID: <20201007173535.GA13763@kudzu.us>
References: <20201007085455.26838-1-lakshmi.Kailasanathan@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201007085455.26838-1-lakshmi.Kailasanathan@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 07, 2020 at 09:54:55AM +0100, lakshmi Kailasanathan wrote:
> This commit adds  usb host in the v5.6 kernel as a machine feature
> to support the USB host controller and mass storage for MPS3 board.
> The kernel binary size increase with this hence wks file updated.
> The node for USB controller is added to device tree in the TF-A and
> updated the sha to reflect it.
> 
> Change-Id: Iad3348f8dc599d5642ddfa0c5199485eeaca0991
> Signed-off-by: lakshmi Kailasanathan <lakshmi.Kailasanathan@arm.com>

Pulled into master.

Thanks,
Jon

> ---
>  meta-arm-bsp/conf/machine/corstone700-mps3.conf           | 5 +++++
>  .../trusted-firmware-a/trusted-firmware-a-corstone700.inc | 4 ++--
>  .../bsp/arm-platforms/corstone700/usb_host.cfg            | 8 ++++++++
>  .../recipes-kernel/linux/linux-stable-corstone700.inc     | 5 +++++
>  meta-arm-bsp/wic/arm-reference-image.corstone700.wks      | 2 +-
>  5 files changed, 21 insertions(+), 3 deletions(-)
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/usb_host.cfg
> 
> diff --git a/meta-arm-bsp/conf/machine/corstone700-mps3.conf b/meta-arm-bsp/conf/machine/corstone700-mps3.conf
> index 88ef5c1..9aaa17c 100644
> --- a/meta-arm-bsp/conf/machine/corstone700-mps3.conf
> +++ b/meta-arm-bsp/conf/machine/corstone700-mps3.conf
> @@ -9,4 +9,9 @@ require conf/machine/include/corstone700.inc
>  # MACHINE_FEATURES_remove = "eth_lan9115"
>  MACHINE_FEATURES += "eth_lan9115"
>  
> +# default feature used: usb_host
> +# add the following line to local.conf to disable the feature:
> +# MACHINE_FEATURES_remove = "usb_host"
> +MACHINE_FEATURES += "usb_host"
> +
>  TFA_TARGET_PLATFORM = "fpga"
> diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone700.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone700.inc
> index 175e333..f48ac64 100644
> --- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone700.inc
> +++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone700.inc
> @@ -10,8 +10,8 @@ TFA_INSTALL_TARGET = "fip.bin"
>  LIC_FILES_CHKSUM = "file://license.rst;md5=1dd070c98a281d18d9eefd938729b031"
>  
>  # TF-A v2.3 is not used because the following commit is needed:
> -# corstone700: splitting the platform support into FVP and FPGA
> -SRCREV_tfa = "ef93cfa3a2591084307a41e64f1cbba327310749"
> +# fdts: corstone700: add NXP isp1763 node to device tree
> +SRCREV_tfa = "a6f65b11529b618ff04017f64054dc661c489068"
>  
>  PV = "2.3+git${SRCPV}"
>  
> diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/usb_host.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/usb_host.cfg
> new file mode 100644
> index 0000000..de4752e
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/usb_host.cfg
> @@ -0,0 +1,8 @@
> +CONFIG_SCSI=y
> +CONFIG_BLK_DEV_SD=y
> +CONFIG_USB=y
> +CONFIG_USB_STORAGE=y
> +CONFIG_USB_ISP1760=y
> +CONFIG_USB_ISP1760_HOST_ROLE=y
> +CONFIG_USB_GADGET=y
> +CONFIG_USB_MASS_STORAGE=y
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable-corstone700.inc b/meta-arm-bsp/recipes-kernel/linux/linux-stable-corstone700.inc
> index 95a8bab..975a93f 100644
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-stable-corstone700.inc
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-stable-corstone700.inc
> @@ -59,4 +59,9 @@ KERNEL_FEATURES_append_corstone700-mps3 = " \
>                           'bsp/arm-platforms/corstone700/xip_dhcp_cmdline.cfg \
>                            bsp/arm-platforms/corstone700/eth_lan9115.scc', \
>                           'bsp/arm-platforms/corstone700/xip_cmdline.cfg', \
> +                          d)} \
> +    ${@bb.utils.contains('MACHINE_FEATURES', \
> +                         'usb_host', \
> +                         'bsp/arm-platforms/corstone700/usb_host.cfg', \
> +                        '', \
>                            d)}"
> diff --git a/meta-arm-bsp/wic/arm-reference-image.corstone700.wks b/meta-arm-bsp/wic/arm-reference-image.corstone700.wks
> index 39c70ce..af03b05 100644
> --- a/meta-arm-bsp/wic/arm-reference-image.corstone700.wks
> +++ b/meta-arm-bsp/wic/arm-reference-image.corstone700.wks
> @@ -19,4 +19,4 @@ part --source rawcopy --sourceparams="file=fip.bin-corstone700" --no-table --ali
>  part --source rawcopy --sourceparams="file=${IMGDEPLOYDIR}/arm-reference-image-${MACHINE}.cramfs-xip" --no-table --fixed-size 2
>  
>  # Rawcopy of the kernel binary
> -part --source rawcopy --sourceparams="file=xipImage" --no-table --fixed-size 3
> +part --source rawcopy --sourceparams="file=xipImage" --no-table --fixed-size 4
> -- 
> 2.17.1
> 

> 
> 
> 

