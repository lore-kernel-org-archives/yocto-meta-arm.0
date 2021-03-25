Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web11.8032.1616679107374942767
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 25 Mar 2021 06:31:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=T/qmE0Hh;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.172, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f172.google.com with SMTP id g20so1722450qkk.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 25 Mar 2021 06:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Pld1ywKCWkN6JDG85267GRErZ15ntPSE5wPYt882UrM=;
        b=T/qmE0HhpEKd59njpEmoKoddKKwcIf9wLsUOwhAi5z/ATrr7a/AaHuPTudm1RxamfL
         KxVAqjsnRAHBNUmW/s/xSSuv2Dm2dfNDiFGArk56eFxsOSwtbcTsuwNzATG+YlsuA0eY
         BXlihoxDsEIi0u7xGCmx4uh/E5PGLk7vNMINZe+zI0mdGsAgMcwMsia7phqGGJ0C4qq2
         fFTL0iBtn5oRcRfjNc1iChARVGyR6EH+JtZYpxwQhDDO8lRD4Gw2G0QgeLO50yemcpNO
         4x234Oi5trVmYt95s4YNR6eooG+Uh91aBIjfsc1kIY+24G62A/mmbprxbPFGvA7JG+ja
         mZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Pld1ywKCWkN6JDG85267GRErZ15ntPSE5wPYt882UrM=;
        b=ZxjksHNNL0PP0OUcGBBfq1atZ4KZhQ68SJBA4OsP/e8fbZKYsxuUNFWDIDMauZgfOH
         zJatRCIFCEVsTuMw25iilxxjGFXWzjtvAT4F2ZHzZbj0rsfzeHn3dTjqZo60gVsuqvEb
         4CKAzXbbQWl+Li2hJzRhCSqw3OcEGWw57fMibcuMIx+8BD0AKFWpmCCRgO0fLc25GMeY
         tkzJd7eimSkwQ+P2h3rMAtupHmk4+WQWOg+qe5fDnhJxMHXfd637ZFU6oDmumJTMKJM1
         ExLFkJHnGKvo64VlwzMbQE1eV1Z2gZxG7OovvMGiw8YII/II6N16+Gj/7vkDSBYf222v
         Kpmw==
X-Gm-Message-State: AOAM5325o8CAON1tW9peaQVVlkf6as5oliTDBwlyV9nFj/imPvyOHMq7
	lYt3Q/yRseTP3xqYqYCHYWiJbg==
X-Google-Smtp-Source: ABdhPJyMrmOhETBUYoiJN8cw0zqNuyf7gHeIrfnGo66UhE/CLYdVOPB9CTxLgHzzcjduVAQ8PT37SA==
X-Received: by 2002:a37:6312:: with SMTP id x18mr7835060qkb.193.1616679106445;
        Thu, 25 Mar 2021 06:31:46 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a601:f800:b033:7c0e:2324:b6dc])
        by smtp.gmail.com with ESMTPSA id d84sm4158560qke.53.2021.03.25.06.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 06:31:46 -0700 (PDT)
Date: Thu, 25 Mar 2021 09:31:44 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/2] arm-bsp/corstone700: use trusted-firmware-a 2.4
Message-ID: <20210325133144.GB11963@kudzu.us>
References: <20210324114242.600917-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210324114242.600917-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 24, 2021 at 11:42:41AM +0000, Ross Burton wrote:
> Move to the release of 2.4 instead of a snapshot between 2.3 and 2.4
> 
> Change-Id: Ie7bd5a8de310186de14bee9e8f10c1aaae6194e6
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Series applied to master.

Thanks,
Jon

>  meta-arm-bsp/conf/machine/include/corstone700.inc     |  3 +--
>  .../trusted-firmware-a-corstone700.inc                | 11 -----------
>  .../trusted-firmware-a_2.3.bbappend                   |  1 -
>  .../trusted-firmware-a_2.4.bbappend                   |  1 +
>  4 files changed, 2 insertions(+), 14 deletions(-)
> 
> diff --git a/meta-arm-bsp/conf/machine/include/corstone700.inc b/meta-arm-bsp/conf/machine/include/corstone700.inc
> index ab3e2a4..9e79e10 100644
> --- a/meta-arm-bsp/conf/machine/include/corstone700.inc
> +++ b/meta-arm-bsp/conf/machine/include/corstone700.inc
> @@ -11,8 +11,7 @@ SERIAL_CONSOLES ?= "115200;ttyAMA0"
>  PREFERRED_PROVIDER_virtual/kernel_corstone700 = "linux-yocto"
>  PREFERRED_VERSION_linux-yocto ?= "5.6%"
>  
> -PREFERRED_PROVIDER_virtual/trusted-firmware-a ?= "trusted-firmware-a"
> -PREFERRED_VERSION_trusted-firmware-a ?= "2.3%"
> +PREFERRED_VERSION_trusted-firmware-a ?= "2.4%"
>  
>  PREFERRED_PROVIDER_virtual/control-processor-firmware ?= "boot-firmware"
>  
> diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone700.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone700.inc
> index bdffec8..5755005 100644
> --- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone700.inc
> +++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone700.inc
> @@ -7,17 +7,6 @@ TFA_UBOOT = "1"
>  TFA_BUILD_TARGET = "all fip"
>  TFA_INSTALL_TARGET = "fip.bin"
>  
> -LIC_FILES_CHKSUM = "file://license.rst;md5=1dd070c98a281d18d9eefd938729b031"
> -
> -# TF-A v2.3 is not used because the following commit is needed:
> -# fdts: corstone700: add NXP isp1763 node to device tree
> -SRCREV_tfa = "a6f65b11529b618ff04017f64054dc661c489068"
> -
> -# This is incorporated into the SRCREV above
> -SRC_URI_remove = "file://0001-fdts-a5ds-Fix-for-the-system-timer-issue.patch"
> -
> -PV = "2.3+git${SRCPV}"
> -
>  EXTRA_OEMAKE_append = " \
>                          ARCH=aarch32 \
>                          TARGET_PLATFORM=${TFA_TARGET_PLATFORM} \
> diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
> index 0535278..2337caf 100644
> --- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
> +++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
> @@ -3,6 +3,5 @@
>  MACHINE_TFA_REQUIRE ?= ""
>  MACHINE_TFA_REQUIRE_corstone500 = "trusted-firmware-a-corstone500.inc"
>  MACHINE_TFA_REQUIRE_juno = "trusted-firmware-a-juno.inc"
> -MACHINE_TFA_REQUIRE_corstone700 = "trusted-firmware-a-corstone700.inc"
>  
>  require ${MACHINE_TFA_REQUIRE}
> diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.bbappend
> index 8087f39..222aac9 100644
> --- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.bbappend
> +++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.bbappend
> @@ -1,6 +1,7 @@
>  # Machine specific TFAs
>  
>  MACHINE_TFA_REQUIRE ?= ""
> +MACHINE_TFA_REQUIRE_corstone700 = "trusted-firmware-a-corstone700.inc"
>  MACHINE_TFA_REQUIRE_fvp-base = "trusted-firmware-a-fvp.inc"
>  MACHINE_TFA_REQUIRE_fvp-base-arm32 = "trusted-firmware-a-fvp-arm32.inc"
>  MACHINE_TFA_REQUIRE_n1sdp = "trusted-firmware-a-n1sdp.inc"
> -- 
> 2.25.1
> 

> 
> 
> 

