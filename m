Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.3663.1588883497204190008
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 May 2020 13:31:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=Cf4KDMD6;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.174, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f174.google.com with SMTP id n14so7632218qke.8
        for <meta-arm@lists.yoctoproject.org>; Thu, 07 May 2020 13:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UkT+dzR7RG6ffqCM5/3R65fxraQZXzTG5pGYeXrODxE=;
        b=Cf4KDMD6+h8UlsFZdM4OnVZ+/Eekkcuup9F7F55xVOh0HodkUQRNAjuMH8yB0ACCpm
         T0SfQzhUHjUYvRP53u11WzeQ/VIQU7+YCV3Hya1o06AHWekZLuvnMbq7rC7EVfi/sfFP
         iu8h5QyEKw8sP9HT3//gvrJBC7MQ7aGvGe0sqiJuFspdBnzdqNtuHjjoQmFgMnxmDHh4
         TJ53LPs7RXBJABjMjFMk48fUejl9G6Wo1h1s8KVt4wjZYRUf4DLpfGOdD8qsW8DnAbMd
         lo+/hJhfUs+sULhYoXCevB5Ij+9TcJFy0y2rCLxQtItvK/WyOGdP4mB51VJ0Q3SQ222o
         fnHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UkT+dzR7RG6ffqCM5/3R65fxraQZXzTG5pGYeXrODxE=;
        b=EPQMjm5QGmaJl4BOnJe/grQuJISIitKoNfeRfw1TIeeB0CHcHsR7zYctoq6HkaNgBa
         NFAVVy6DZ7gGnH8SiB3V2bXHKeR/Xep7oz3gAMDb3s7Tz6OEuWU9sFK/H8f5pm9wXS3y
         H+ZB1sQWMSNlhRa2GBfHShB06QBU6MmH4eup7rieC7uPrLjmY29xLIAKhk0sU5Ys/6C8
         NF3IhcC6cFCBtuwFydmuH7MhlFgnWxujiDfJxFgoy9EiRUFcIhr991zyjV6IJzXgGO+O
         6YeTfOBVilnjnosCBy8pR/PCcrXX1FtRY9+jurl654ISY5SB1zE2vG6QadVZ4MnDaAbh
         3uUw==
X-Gm-Message-State: AGi0PuY8zav6GB0hLRpytx/oY7PBTLm1wRWiw8hE61d1Dk/TXqHS1zdb
	Jnifcb1VoeBJGoTxpr3pLleUKD7QBNqdCA==
X-Google-Smtp-Source: APiQypJmx0VTu7eG1y285m5Yt/WdIQCno/X2jPAUqRIroXEwQRflBDdjF2n1BARtoicnrhEnS1AHBg==
X-Received: by 2002:a37:6658:: with SMTP id a85mr16481145qkc.493.1588883496106;
        Thu, 07 May 2020 13:31:36 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:bc2d:d256:cb0b:903c])
        by smtp.gmail.com with ESMTPSA id u35sm4988877qtd.88.2020.05.07.13.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 13:31:35 -0700 (PDT)
Date: Thu, 7 May 2020 16:31:34 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: Re: [meta-arm] [PATCH] [arm-bsp] trusted-firmware-a-fvp: Fix dependency loop
Message-ID: <20200507203133.GC1726@kudzu.us>
References: <20200507103523.38359-1-bertrand.marquis@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200507103523.38359-1-bertrand.marquis@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 07, 2020 at 11:35:23AM +0100, Bertrand Marquis wrote:
> From: Diego Sueiro <diego.sueiro@arm.com>
> 
> When building with INITRAMFS_IMAGE_BUNDLE set, there is a dependency
> loop between trusted-firmware-a:do_install and virtual/kernel:do_deploy
> since the trusted-firmware-a:do_install depends on the kernel dtb to be
> passed to the fiptool to generate the fip.bin binary.
> 
> The kernel dtb is not mandatory to generate the fip.bin if we compile
> the "dtbs" and "fip" targets which will include the in-tree device-tree
> used for the --hw-config (HW_CONFIG property) dynamic configuration
> during the cold boot.
> 
> Change-Id: I7147cc1eeecb7c4b66f198562163438b7b663eba
> Issue-Id: SCM-990
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>

Applied to the master branch of meta-arm.

Thanks,
Jon

> ---
>  .../trusted-firmware-a-fvp.inc                | 19 +------------------
>  1 file changed, 1 insertion(+), 18 deletions(-)
> 
> diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp.inc
> index 3e58ecf..27031eb 100644
> --- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp.inc
> +++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp.inc
> @@ -10,21 +10,4 @@ TFA_PLATFORM = "fvp"
>  TFA_DEBUG = "1"
>  TFA_MBEDTLS = "1"
>  TFA_UBOOT = "1"
> -TFA_BUILD_TARGET = "bl1 bl2 bl31 dtbs fiptool"
> -
> -do_install[depends] += "virtual/kernel:do_deploy"
> -
> -do_install_append() {
> -    ./tools/fiptool/fiptool create \
> -        --tb-fw ${S}/${TFA_BUILD_DIR}/bl2.bin \
> -        --soc-fw ${S}/${TFA_BUILD_DIR}/bl31.bin \
> -        --tb-fw-config ${S}/${TFA_BUILD_DIR}/fdts/fvp_tb_fw_config.dtb \
> -        --soc-fw-config ${S}/${TFA_BUILD_DIR}/fdts/fvp_soc_fw_config.dtb \
> -        --hw-config ${DEPLOY_DIR_IMAGE}/$(basename ${KERNEL_DEVICETREE}) \
> -        --nt-fw ${DEPLOY_DIR_IMAGE}/u-boot.bin \
> -        fip.bin
> -
> -    ./tools/fiptool/fiptool info fip.bin
> -
> -    install -m 0644 ${S}/fip.bin ${D}/firmware/fip-fvp.bin
> -}
> +TFA_BUILD_TARGET = "bl1 bl2 bl31 dtbs fip"
> -- 
> 2.17.1
> 

> 

