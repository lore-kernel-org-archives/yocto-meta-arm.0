Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web08.8093.1616679084072289768
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 25 Mar 2021 06:31:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=fX6JifYH;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f179.google.com with SMTP id i19so1589914qtv.7
        for <meta-arm@lists.yoctoproject.org>; Thu, 25 Mar 2021 06:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jQ90cqigtbGpH7Fm7jruJL2ZICNGvjz0QFLIK2D1UsI=;
        b=fX6JifYHUOCUskX6jUl5PxMX/j2Xbq+TLUE4CnZNbxjuU9A/jnbXw5CietgF5KsoGJ
         GPdU4QLl6FSc+Ok1V2JlngboS8WDpPwtIeZahoggM9LLPX3YEKXhbtb1nnnMi6Q26Vtc
         CKLTcpwEVW++BFtPzd8hhn/PdY2UUv8OceDAQCj4n0KbncaJHl4Ak7BH/N/rkoulhsmq
         ISdU0KaRlJVmdApP6yoaT05qZLeHQwtTulrU3Q7stAjRGBt+xBFR8OW2rt291+G/iscu
         mPMFHZmS4o9NuSJFjffkM7ZF91SvYz5T3SlGh7uIlS/OHJm10er2BO1LtCDQBekJIeut
         gODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jQ90cqigtbGpH7Fm7jruJL2ZICNGvjz0QFLIK2D1UsI=;
        b=Mvr+pmjcTMnIHz+NbrlSeyZhGLje8yOcukQ30i2exWm3WBNVRpuioHDAuj8QKL1Pgc
         qPPzdg85zRZn7Oq99TZOE62ypqO9X3ATSMgRVWQfzQtZaSFdz23SZcCERDQwmtG9fafk
         Ema0peIOpZaZpd0r2Z14I9csK9cF329jl1zuRVu3fh6/Zy0SKx7RZ1Ymkq6mheIlAVP2
         tQ08fPTjxYbFzoNIOJA+uQ+lI0MwfHkR8KDi4qLuwQACbLQNba8bB+ge3II0pJ61r8TC
         wje0Wqe7X/ASey9iY2zxel+VtGu9JXIomLPzo+j77X6A6NX4XQmWZs/jZEAGq8LLDxE+
         AEDg==
X-Gm-Message-State: AOAM531aRuvOAuwiEh14uOCqqoaWNZYBBpVbJiRc1oq4pnUYfe+Wvo0D
	c9JO+oKIDAOavN+2SrVKV6Juyw==
X-Google-Smtp-Source: ABdhPJy4sJUAV/lR8vcfuaB0dUIMqgoL2/VhwwE4NM7xeijlGowoAJbo0NxsirjgbX8OFZoyH9rP6w==
X-Received: by 2002:ac8:4415:: with SMTP id j21mr7538667qtn.87.1616679083139;
        Thu, 25 Mar 2021 06:31:23 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a601:f800:8daf:27b6:797e:9e83])
        by smtp.gmail.com with ESMTPSA id i14sm3549161qtq.81.2021.03.25.06.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 06:31:23 -0700 (PDT)
Date: Thu, 25 Mar 2021 09:31:21 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/2] arm/edk2-firmware: clean up build invocation
Message-ID: <20210325133121.GA11963@kudzu.us>
References: <20210324114224.600705-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210324114224.600705-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 24, 2021 at 11:42:23AM +0000, Ross Burton wrote:
> Add some comments to make it clear what variables are being passed as
> what arguments to build.
> 
> The build tool is on PATH, so there's no need to use an absolute path.
> 
> Change-Id: If9229d4927205e1b9a9a0bf7f7526e33006a03fd
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Series applied to master.

Thanks,
Jon

>  meta-arm/recipes-bsp/uefi/edk2-firmware.inc | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> index 4748ae3..073f5c9 100644
> --- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> +++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> @@ -25,11 +25,14 @@ UPSTREAM_CHECK_GITTAGREGEX = "^edk2-stable(?P<pver>\d+)$"
>  
>  EDK2_BUILD_RELEASE = ""
>  EDK2_PLATFORM      = ""
> +# build --platform
>  EDK2_PLATFORM_DSC  = ""
>  EDK2_BIN_NAME      = ""
> +# build --arch
>  EDK2_ARCH          = ""
>  
> -EDK2_BUILD_MODE = "${@bb.utils.contains('EDK2_BUILD_RELEASE', '1', 'RELEASE', 'DEBUG', d)}"
> +# build --buildtarget
> +EDK2_BUILD_MODE ?= "${@bb.utils.contains('EDK2_BUILD_RELEASE', '1', 'RELEASE', 'DEBUG', d)}"
>  
>  # Baremetal, no need for a C library
>  DEPENDS_remove = "virtual/${TARGET_PREFIX}compilerlibs virtual/libc"
> @@ -72,11 +75,11 @@ do_compile() {
>      oe_runmake -C ${S}/BaseTools
>  
>      PATH="${WORKSPACE}:${BTOOLS_PATH}:$PATH" \
> -    "${S}/BaseTools/BinWrappers/PosixLike/build" \
> -       -a "${EDK2_ARCH}" \
> -       -b ${EDK2_BUILD_MODE} \
> -       -t ${EDK_COMPILER} \
> -       -p ${EDK2_PLATFORM_DSC}
> +    build \
> +       --arch "${EDK2_ARCH}" \
> +       --buildtarget ${EDK2_BUILD_MODE} \
> +       --tagname ${EDK_COMPILER} \
> +       --platform ${EDK2_PLATFORM_DSC}
>  }
>  
>  do_install() {
> -- 
> 2.25.1
> 

> 
> 
> 

