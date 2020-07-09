Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web12.6037.1594299101401497975
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Jul 2020 05:51:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=gB8qez71;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f193.google.com with SMTP id q198so1617579qka.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 09 Jul 2020 05:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Up3LC/MW8dc3EYoetOmW/UB1j3cAJfHjC4yEVjyJaaw=;
        b=gB8qez71Kh/T5Yy7a38HlyajQgmRiXIwTC82EwMsVbKQfFuJWSoAcVY31F8VuH4fnd
         FiApNGJwL54u5CAfl0MRwDenK8l9BN34f6yumTY9o1/WLxuHQ6R7Dfibkhc2+Jh9Xwnf
         IugByMQLyQCouf2CKK8hit10JsHqg5IhV9QZ4f+GaqopXOQw+s0GyASi1aDut04nF/WH
         BtWcJcApmF38GOw94B7XI6BCJZgEV3DqhUPlU1ZLN+IVDEXWg2gR5+FAWMGkqZ3ZEQIc
         n11oVyhnTpoIJ/HrfLEqLXxUtsjLS+y/TBB9J+B4QWPbeXYMXsuUoLkVtbvrEIsivTf/
         ddsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Up3LC/MW8dc3EYoetOmW/UB1j3cAJfHjC4yEVjyJaaw=;
        b=K2Qlz4/NRmNgcF+diGXbGmghXNjrZUjyM7v2XQ8i96J7zxB4Wuid1a49FKojk5BC3h
         tvczfNGs/3a/91g1tPV/eluGkxdzBAv2OIHXHWdHSmHACf0BgP4JknmVGTrsIjrwE9ha
         SDIX354LdW+hv6B6Rvq5ePvTmS7cq/OMGyjDTLPz3Ku1GbuQCwN2aYJ2dZi5OidtySgS
         H7+v3GQkiPrUgUQHx+wM/mpIOO1idOTpZW3VDpCzAkDPmLUaWo/OOu71OQYL/AsVoIlc
         4jtV36qTqphNhHZpSxE6z6Lh1JdZcn2C9Is50jMqvNEg+O+dQPZjMq4tUjQeY1txDFqO
         KJgg==
X-Gm-Message-State: AOAM532SLoUfm8pTqSeD8b9FjxkgFbpaMA5Ng5C409tp4IbD9TBfhm47
	k1GAf0/Hkt5HyAJrXz2Ah7z0bQ==
X-Google-Smtp-Source: ABdhPJw/zyORbPyF6IOxvxcjlCCs9fkJuhIWlgjltUT+4H0rfwtW5OV0q4VOt8MzO0kZo+60sxy7tg==
X-Received: by 2002:a37:a643:: with SMTP id p64mr61849082qke.214.1594299100437;
        Thu, 09 Jul 2020 05:51:40 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:5416:c1ad:e833:f407])
        by smtp.gmail.com with ESMTPSA id q5sm3972017qtf.12.2020.07.09.05.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 05:51:40 -0700 (PDT)
Date: Thu, 9 Jul 2020 08:51:38 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/2] arm-bsp/trusted-firmware-a: move A5 DesignStart to 2.3
Message-ID: <20200709125138.GA9023@kudzu.us>
References: <20200707162459.131391-1-ross@burtonini.com>
MIME-Version: 1.0
In-Reply-To: <20200707162459.131391-1-ross@burtonini.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 07, 2020 at 05:24:58PM +0100, Ross Burton wrote:
> From: Ross Burton <ross.burton@arm.com>
> 
> 0001-plat-arm-a5ds-move-dtb-to-a-new-address.patch was never applied,
> and has been merged upstream so drop it.
> 
> The recipe was using the _git.bb recipe and setting the SRCREV to a
> commit 300+ commits past 2.2 but not quite 2.3.  Instead, just use 2.3.
> 
> Change-Id: I76aee592e7ce3ec23268872d7f202efa945e5e59
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Series applied to master.

Thanks,
Jon

> ---
>  ...t-arm-a5ds-move-dtb-to-a-new-address.patch | 31 -------------------
>  .../trusted-firmware-a-a5ds.inc               |  5 ---
>  .../trusted-firmware-a_2.3.bbappend           |  1 +
>  .../trusted-firmware-a_git.bbappend           |  7 -----
>  4 files changed, 1 insertion(+), 43 deletions(-)
>  delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/a5ds/0001-plat-arm-a5ds-move-dtb-to-a-new-address.patch
>  delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bbappend
> 
> diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/a5ds/0001-plat-arm-a5ds-move-dtb-to-a-new-address.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/a5ds/0001-plat-arm-a5ds-move-dtb-to-a-new-address.patch
> deleted file mode 100644
> index 8d848ec..0000000
> --- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/a5ds/0001-plat-arm-a5ds-move-dtb-to-a-new-address.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From d3cadbc6f1060020960dc05af0465db919bbbe2b Mon Sep 17 00:00:00 2001
> -From: Rui Miguel Silva <rui.silva@linaro.org>
> -Date: Fri, 30 Aug 2019 13:38:44 +0100
> -Subject: [PATCH] plat/arm: a5ds: move dtb to a new address
> -
> -When Using bigger kernel images (>8.4MB compressed zImage) and at
> -decompress and final location init stage of kernel start makes it
> -override dtb at this address, to avoid this move the dtb a little
> -higher in address related.
> -
> -Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> ----
> - plat/arm/board/a5ds/fdts/a5ds_tb_fw_config.dts | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/plat/arm/board/a5ds/fdts/a5ds_tb_fw_config.dts b/plat/arm/board/a5ds/fdts/a5ds_tb_fw_config.dts
> -index 9ab2d9656600..c616ff772237 100644
> ---- a/plat/arm/board/a5ds/fdts/a5ds_tb_fw_config.dts
> -+++ b/plat/arm/board/a5ds/fdts/a5ds_tb_fw_config.dts
> -@@ -10,7 +10,7 @@
> -       /* Platform Config */
> -       plat_arm_bl2 {
> -               compatible = "arm,tb_fw";
> --              hw_config_addr = <0x0 0x82000000>;
> -+              hw_config_addr = <0x0 0x83000000>;
> -               hw_config_max_size = <0x01000000>;
> -               /* Disable authentication for development */
> -               disable_auth = <0x0>;
> ---
> -2.22.1
> -
> diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-a5ds.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-a5ds.inc
> index aa21b74..d892794 100644
> --- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-a5ds.inc
> +++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-a5ds.inc
> @@ -7,9 +7,6 @@ TFA_UBOOT = "1"
>  TFA_BUILD_TARGET = "all fip"
>  TFA_INSTALL_TARGET = "bl1.bin fip.bin"
>  
> -SRCREV = "5d3ee0764b03567bf3501edf47d67d72daff0cb3"
> -LIC_FILES_CHKSUM = "file://license.rst;md5=1dd070c98a281d18d9eefd938729b031"
> -
>  EXTRA_OEMAKE_append = " \
>                      ARCH=aarch32 \
>                      FVP_HW_CONFIG_DTS=fdts/a5ds.dts \
> @@ -18,5 +15,3 @@ EXTRA_OEMAKE_append = " \
>                      ARM_CORTEX_A5=yes \
>                      ARM_XLAT_TABLES_LIB_V1=1 \
>                      "
> -
> -
> diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
> index b642708..d8aa786 100644
> --- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
> +++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
> @@ -2,5 +2,6 @@
>  
>  MACHINE_TFA_REQUIRE ?= ""
>  MACHINE_TFA_REQUIRE_tc0 = "trusted-firmware-a-tc0.inc"
> +MACHINE_TFA_REQUIRE_a5ds = "trusted-firmware-a-a5ds.inc"
>  
>  require ${MACHINE_TFA_REQUIRE}
> diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bbappend
> deleted file mode 100644
> index 772f65a..0000000
> --- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bbappend
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -# Machine specific TFAs
> -
> -MACHINE_TFA_REQUIRE ?= ""
> -
> -MACHINE_TFA_REQUIRE_a5ds = "trusted-firmware-a-a5ds.inc"
> -
> -require ${MACHINE_TFA_REQUIRE}
> -- 
> 2.26.2
> 

> 

