Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web10.2554.1621898420843712473
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 May 2021 16:20:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=K2w/Hj9B;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f177.google.com with SMTP id t20so21890663qtx.8
        for <meta-arm@lists.yoctoproject.org>; Mon, 24 May 2021 16:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=J8R7rF1OX4yPpH1Rd9DlIZVP5vsWfKKpEWCNHzRKIk8=;
        b=K2w/Hj9B7PWJG+uKxnLX5cgLZ6Iek6ijqQG6iWGnFatk4x7Ez/1gLnbihfHYB++F10
         Ejxm8H9SAu9wF9Fv2vqaQ/LYj7UGz35K2W/Go7CHl7z9bgmUK1M3K+2DPdqI1/SjN6w8
         iTeJmOXPIzAn+7OLNpHdNYuzAX4nW8yMZ72+OpVOqdwW7DN8o+nDpuc1537vbZYHSE+g
         JUk0745B3lBYhyA+CLqtfoZ1v4oVszlK0yG8RfNq9oiY/bXqaEKVguXRtuGx99b0MezC
         +P0Kf+a7nG01iiuO3zoGMen5vLyPTsPrV7mSECNAOUugTwArjbaOz8XyLnJVSH+x1QBD
         4eCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=J8R7rF1OX4yPpH1Rd9DlIZVP5vsWfKKpEWCNHzRKIk8=;
        b=uDBZKQJP6rP2gNWJ2//YarKFXRHA6wngbuy63rUop2Xu0EcVd6ydc7TKxudqESonSe
         W0vRMoRg2hQHS2LUHA50IwztNlKtTytyeHSwjnhWS/Ak2P0fHu7SXS9oyNawJ3PNcUX/
         294eRBCnVcZiyvVaR6s9uGimb0jdHWSB95X8JGnh5eVNmTcDEszqiMLYpMNi18V5wbGP
         djhea2Yn636e3QmWCwSJAd1PDlR+/NP3Jndw8CyntoyLVH7sZ6B0Ls4JzmYbm/kdQn3G
         j3xngx3vVtZU3GsKxQ50jeLzbmwpI5C5IvEYsuwSyj3lxXLLu+mstBv5Bo8RllwsPS46
         jEew==
X-Gm-Message-State: AOAM533Tuj9+S3PJzH0I+FEmQ24q6Eo6JxSmXL10GB6b5+8Vwd9kolRL
	Z8sGdi+QMIiyqCQlM+u6hSNYPr45ZCnlDhS+
X-Google-Smtp-Source: ABdhPJxCKDi0IDmc8uajdhiTCdYRNrT1vvDcRWm3+1MXbWczRA7AdUuooC1JBaiqL9F+vrP4GY1kjg==
X-Received: by 2002:ac8:7619:: with SMTP id t25mr28749289qtq.312.1621898420010;
        Mon, 24 May 2021 16:20:20 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:e800:1cd0:dce4:7cd5:acc])
        by smtp.gmail.com with ESMTPSA id 127sm11177312qkl.116.2021.05.24.16.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 16:20:19 -0700 (PDT)
Date: Mon, 24 May 2021 19:20:18 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm/trusted-firmare-a: update to version 2.5
Message-ID: <20210524232018.GB5325@kudzu.us>
References: <20210524204620.25097-1-jon.mason@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210524204620.25097-1-jon.mason@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 24, 2021 at 04:46:20PM -0400, Jon Mason wrote:
> Update to TF-A v2.5 and MBED TLS 2.26, and all machines using 2.4 to the
> newer version.  Also, n1sdp was using an intermediary SHA, but is now
> updated to the latest (which includes that intermediary SHA).
> 
> Change-Id: Ia5ec3cecf9090fd5f5da28efff4c1d6cce1efc19
> Signed-off-by: Jon Mason <jon.mason@arm.com>

Pulled into master.

Thanks,
Jon

> ---
>  meta-arm-bsp/conf/machine/corstone500.conf                | 4 ++--
>  meta-arm-bsp/conf/machine/fvp-common.inc                  | 2 +-
>  meta-arm-bsp/conf/machine/include/corstone700.inc         | 4 ++--
>  meta-arm-bsp/conf/machine/juno.conf                       | 2 +-
>  meta-arm-bsp/conf/machine/n1sdp.conf                      | 2 +-
>  meta-arm-bsp/conf/machine/sgi575.conf                     | 2 +-
>  meta-arm-bsp/conf/machine/tc0.conf                        | 2 +-
>  .../trusted-firmware-a/trusted-firmware-a-n1sdp.inc       | 3 ---
>  ...are-a_2.4.bbappend => trusted-firmware-a_2.5.bbappend} | 0
>  ...rusted-firmware-a_2.4.bb => trusted-firmware-a_2.5.bb} | 8 ++++----
>  10 files changed, 13 insertions(+), 16 deletions(-)
>  rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/{trusted-firmware-a_2.4.bbappend => trusted-firmware-a_2.5.bbappend} (100%)
>  rename meta-arm/recipes-bsp/trusted-firmware-a/{trusted-firmware-a_2.4.bb => trusted-firmware-a_2.5.bb} (71%)
> 
> diff --git a/meta-arm-bsp/conf/machine/corstone500.conf b/meta-arm-bsp/conf/machine/corstone500.conf
> index 29291a0..b119137 100644
> --- a/meta-arm-bsp/conf/machine/corstone500.conf
> +++ b/meta-arm-bsp/conf/machine/corstone500.conf
> @@ -17,7 +17,7 @@ PREFERRED_VERSION_linux-yocto ?= "5.3%"
>  KBUILD_DEFCONFIG = "multi_v7_defconfig"
>  KCONFIG_MODE = "--alldefconfig"
>  
> -PREFERRED_VERSION_trusted-firmware-a ?= "2.4%"
> +PREFERRED_VERSION_trusted-firmware-a ?= "2.5%"
>  
>  EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot"
>  
> @@ -29,4 +29,4 @@ IMAGE_FSTYPES += "tar.bz2 cpio.gz"
>  UBOOT_MACHINE = "designstart_ca5_defconfig"
>  UBOOT_IMAGE_ENTRYPOINT = "0x84000000"
>  UBOOT_IMAGE_LOADADDRESS = "0x84000000"
> -PREFERRED_VERSION_u-boot ?= "2020.07"
> \ No newline at end of file
> +PREFERRED_VERSION_u-boot ?= "2020.07"
> diff --git a/meta-arm-bsp/conf/machine/fvp-common.inc b/meta-arm-bsp/conf/machine/fvp-common.inc
> index 169c0a3..925da27 100644
> --- a/meta-arm-bsp/conf/machine/fvp-common.inc
> +++ b/meta-arm-bsp/conf/machine/fvp-common.inc
> @@ -16,7 +16,7 @@ PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
>  PREFERRED_VERSION_linux-yocto ?= "5.10%"
>  
>  PREFERRED_VERSION_u-boot ?= "2021.01"
> -PREFERRED_VERSION_trusted-firmware-a ?= "2.4%"
> +PREFERRED_VERSION_trusted-firmware-a ?= "2.5%"
>  
>  EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot"
>  
> diff --git a/meta-arm-bsp/conf/machine/include/corstone700.inc b/meta-arm-bsp/conf/machine/include/corstone700.inc
> index 19a3c85..228fdd2 100644
> --- a/meta-arm-bsp/conf/machine/include/corstone700.inc
> +++ b/meta-arm-bsp/conf/machine/include/corstone700.inc
> @@ -11,7 +11,7 @@ SERIAL_CONSOLES ?= "115200;ttyAMA0"
>  PREFERRED_PROVIDER_virtual/kernel_corstone700 = "linux-yocto"
>  PREFERRED_VERSION_linux-yocto ?= "5.6%"
>  
> -PREFERRED_VERSION_trusted-firmware-a ?= "2.4%"
> +PREFERRED_VERSION_trusted-firmware-a ?= "2.5%"
>  
>  PREFERRED_VERSION_gcc-arm-none-eabi-native ?= "9-2020-q2-update"
>  
> @@ -31,4 +31,4 @@ WKS_FILE ?= "arm-reference-image.corstone700.wks"
>  VIRTUAL-RUNTIME_dev_manager = "busybox-mdev"
>  
>  UBOOT_MACHINE ?= "corstone700_defconfig"
> -PREFERRED_VERSION_u-boot ?= "2020.04"
> \ No newline at end of file
> +PREFERRED_VERSION_u-boot ?= "2020.04"
> diff --git a/meta-arm-bsp/conf/machine/juno.conf b/meta-arm-bsp/conf/machine/juno.conf
> index 1d7be29..1000dad 100644
> --- a/meta-arm-bsp/conf/machine/juno.conf
> +++ b/meta-arm-bsp/conf/machine/juno.conf
> @@ -20,7 +20,7 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
>  # Use kernel provided by yocto
>  PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
>  PREFERRED_VERSION_linux-yocto ?= "5.4%"
> -PREFERRED_VERSION_trusted-firmware-a ?= "2.4%"
> +PREFERRED_VERSION_trusted-firmware-a ?= "2.5%"
>  PREFERRED_VERSION_u-boot ?= "2020.07"
>  
>  EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot firmware-image-juno"
> diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
> index 3de47c8..2126cc1 100644
> --- a/meta-arm-bsp/conf/machine/n1sdp.conf
> +++ b/meta-arm-bsp/conf/machine/n1sdp.conf
> @@ -24,7 +24,7 @@ PREFERRED_VERSION_linux-yocto ?= "5.10%"
>  # RTL8168E Gigabit Ethernet Controller is attached to the PCIe interface
>  MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "linux-firmware-rtl8168"
>  
> -PREFERRED_VERSION_trusted-firmware-a ?= "2.4%"
> +PREFERRED_VERSION_trusted-firmware-a ?= "2.5%"
>  
>  EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a"
>  EXTRA_IMAGEDEPENDS += "virtual/control-processor-firmware"
> diff --git a/meta-arm-bsp/conf/machine/sgi575.conf b/meta-arm-bsp/conf/machine/sgi575.conf
> index 2004369..cf91266 100644
> --- a/meta-arm-bsp/conf/machine/sgi575.conf
> +++ b/meta-arm-bsp/conf/machine/sgi575.conf
> @@ -8,7 +8,7 @@ require conf/machine/include/arm/armv8-2a/tune-cortexa75.inc
>  
>  EXTRA_IMAGEDEPENDS += "virtual/control-processor-firmware"
>  
> -PREFERRED_VERSION_trusted-firmware-a ?= "2.4%"
> +PREFERRED_VERSION_trusted-firmware-a ?= "2.5%"
>  
>  EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a"
>  
> diff --git a/meta-arm-bsp/conf/machine/tc0.conf b/meta-arm-bsp/conf/machine/tc0.conf
> index eda3324..6bcb6c8 100644
> --- a/meta-arm-bsp/conf/machine/tc0.conf
> +++ b/meta-arm-bsp/conf/machine/tc0.conf
> @@ -27,7 +27,7 @@ UBOOT_SIGN_KEYDIR = "${DEPLOY_DIR_IMAGE}/keys"
>  FIT_GENERATE_KEYS = "1"
>  
>  PREFERRED_PROVIDER_virtual/trusted-firmware-a ?= "trusted-firmware-a"
> -PREFERRED_VERSION_trusted-firmware-a ?= "2.4%"
> +PREFERRED_VERSION_trusted-firmware-a ?= "2.5%"
>  
>  PREFERRED_PROVIDER_virtual/kernel ?= "linux-arm64-ack"
>  PREFERRED_VERSION_linux-arm64-ack ?= "5.4"
> diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
> index 9a49c00..112fac8 100644
> --- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
> +++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
> @@ -7,6 +7,3 @@ TFA_INSTALL_TARGET = "bl31 n1sdp-multi-chip n1sdp-single-chip"
>  TFA_DEBUG          = "1"
>  TFA_MBEDTLS        = "0"
>  TFA_UBOOT          = "0"
> -
> -SRCREV_tfa = "332649da478147b3d03132deb3783dd62fd475d7"
> -PV = "2.4+git${SRCPV}"
> diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.5.bbappend
> similarity index 100%
> rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.bbappend
> rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.5.bbappend
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.5.bb
> similarity index 71%
> rename from meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.bb
> rename to meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.5.bb
> index f23132a..dded003 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.bb
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.5.bb
> @@ -3,13 +3,13 @@ require trusted-firmware-a.inc
>  # Use TF-A for version
>  SRCREV_FORMAT = "tfa"
>  
> -# TF-A v2.4
> -SRCREV_tfa = "e2c509a39c6cc4dda8734e6509cdbe6e3603cdfc"
> +# TF-A v2.5
> +SRCREV_tfa = "1e13c500a0351ac4b55d09a63f7008e2438550f8"
>  
>  LIC_FILES_CHKSUM += "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89"
>  
> -# mbed TLS v2.24.0
> +# mbed TLS v2.26.0
>  SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls;branch=master"
> -SRCREV_mbedtls = "523f0554b6cdc7ace5d360885c3f5bbcc73ec0e8"
> +SRCREV_mbedtls = "e483a77c85e1f9c1dd2eb1c5a8f552d2617fe400"
>  
>  LIC_FILES_CHKSUM_MBEDTLS = "file://mbedtls/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> -- 
> 2.17.1
> 

> 
> 
> 

