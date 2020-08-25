Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.3532.1598386305633402798
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 25 Aug 2020 13:11:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=YttAdpto;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f195.google.com with SMTP id p4so11130qkf.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 25 Aug 2020 13:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+2cwSoGTtebFaTmujKGG3qMGC5bsKVhPpXUX5KrXcig=;
        b=YttAdptomBd+pM2dAcdqVCQNrncWVpIpvx/NFb+M1odGShiwaLue+2s3O0E9EIRaw1
         vqvU95lKQRxzoeBQvFw0JE+E70RYA7+rZHgeegZaFnXqBbBWAPGIhzbgg09hPPBLGX+d
         RauAwwz+FzKLM0IjMI592iZL/gxkr+X+ZbpXB0Pi8LXw8HEJt9d+xsYYDp5bmy/LON2/
         KPS3ghj6aMbqlztSA7XoK36z1TqIwX9K3xNorNFrk7snVRaDfZ7bQC2yQElHPrsTVPcm
         cPNQ5i71CmPyJVZqNnY7jInZkb7As43QJNcWS3WEqwM21hDgTrHcakr+gwZnhuhRCPY3
         Si/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+2cwSoGTtebFaTmujKGG3qMGC5bsKVhPpXUX5KrXcig=;
        b=APFDwZUU2XV+GGKslGFj4XtTAHj9HvPesN9pzu1Wu+MYDgSFRMQe4W4PJtMw70L3T1
         I/CQBN9n0SOALgZk2cDUtplautg8pj1xgKEx8xygJn7t08xCJcpljqPODa2/dkt5c69O
         DVYBhR4lZIx3oM1ZugUKkLSf5CEqLflktpC1eBZZu54VXQC6aMQDYllI1tdfGEg3FBry
         8pSUutTKkMDn94DJWovpXYG9kB048L2kh6oBxVP7MuLQ8JDuCRqHkhW0RJDxfS80Wggy
         6d4Qsdyc6AnxUkEzWLYo8XodHLwJ0/7uySISuwoFkqNQ0OjTJdQD0uyHrnTDw6hWoSjD
         I2Tw==
X-Gm-Message-State: AOAM531CXASrSSv0Iupsjz4I9Ba61/PWbTTY0iIleWrg0NTRXYOAT6n6
	Q77E8DcQTHWDRUVbJ/J7Gwv43A==
X-Google-Smtp-Source: ABdhPJxsRL/xZJ2m/13ss6hA9Ote5KMA7pX7GN7he+l0FbqGy4BDHpyfsKJMREjkrIyXpObBX1tLGg==
X-Received: by 2002:a37:84d:: with SMTP id 74mr10866935qki.490.1598386304715;
        Tue, 25 Aug 2020 13:11:44 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id b187sm12258284qkd.107.2020.08.25.13.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 13:11:44 -0700 (PDT)
Date: Tue, 25 Aug 2020 16:11:41 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm: trusted-firmware-a variable name misuse
Message-ID: <20200825201141.GA24495@kudzu.us>
References: <20200825023220.27193-1-jon.mason@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200825023220.27193-1-jon.mason@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 24, 2020 at 10:32:19PM -0400, Jon Mason wrote:
> "processes" should be "processed" in trusted-firmware-a.inc, as it
> signifies if the relevant part has been installed/processed.
> 
> Change-Id: I2d1ffbb0c6d14d280b6f9c9cc45c04c7c32409a7
> Signed-off-by: Jon Mason <jon.mason@arm.com>

Pulled into master.

Thanks,
Jon

> ---
>  .../trusted-firmware-a/trusted-firmware-a.inc        | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> index 4956c4f..e1cffdf 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> @@ -136,7 +136,7 @@ do_compile_append_aarch64_qemuall() {
>  do_install() {
>      install -d -m 755 ${D}/firmware
>      for atfbin in ${TFA_INSTALL_TARGET}; do
> -        processes="0"
> +        processed="0"
>          if [ "$atfbin" = "all" ]; then
>              # Target all is not handled by default
>              bberror "all as TFA_INSTALL_TARGET is not handled by do_install"
> @@ -150,32 +150,32 @@ do_install() {
>              install -m 0644 ${BUILD_DIR}/$atfbin.bin \
>                  ${D}/firmware/$atfbin-${TFA_PLATFORM}.bin
>              ln -sf $atfbin-${TFA_PLATFORM}.bin ${D}/firmware/$atfbin.bin
> -            processes="1"
> +            processed="1"
>          fi
>          if [ -f ${BUILD_DIR}/$atfbin/$atfbin.elf ]; then
>              echo "Install $atfbin.elf"
>              install -m 0644 ${BUILD_DIR}/$atfbin/$atfbin.elf \
>                  ${D}/firmware/$atfbin-${TFA_PLATFORM}.elf
>              ln -sf $atfbin-${TFA_PLATFORM}.elf ${D}/firmware/$atfbin.elf
> -            processes="1"
> +            processed="1"
>          fi
>          if [ -f ${BUILD_DIR}/$atfbin ]; then
>              echo "Install $atfbin"
>              install -m 0644 ${BUILD_DIR}/$atfbin \
>                  ${D}/firmware/$atfbin-${TFA_PLATFORM}
>              ln -sf $atfbin-${TFA_PLATFORM} ${D}/firmware/$atfbin
> -            processes="1"
> +            processed="1"
>          fi
>          if [ -f ${BUILD_DIR}/fdts/$atfbin.dtb ]; then
>              echo "Install $atfbin.dtb"
>              install -m 0644 "${BUILD_DIR}/fdts/$atfbin.dtb" \
>                  "${D}/firmware/$atfbin.dtb"
> -            processes="1"
> +            processed="1"
>          elif [ "$atfbin" = "dtbs" ]; then
>              echo "dtbs install, skipped: set dtbs in TFA_INSTALL_TARGET"
>          elif [ -f ${B}/tools/$atfbin/$atfbin ]; then
>              echo "Tools $atfbin install, skipped"
> -        elif [ "$processes" = "0" ]; then
> +        elif [ "$processed" = "0" ]; then
>              bberror "Unsupported TFA_INSTALL_TARGET target $atfbin"
>              exit 1
>          fi
> -- 
> 2.17.1
> 

> 

