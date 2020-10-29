Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.web11.8556.1603977284680345846
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Oct 2020 06:14:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=oEjs4+tg;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.193, mailfrom: jdmason@kudzu.us)
Received: by mail-il1-f193.google.com with SMTP id g7so2900343ilr.12
        for <meta-arm@lists.yoctoproject.org>; Thu, 29 Oct 2020 06:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Uk9IMjOz4VgBUm9q2WMfkx3BxI54zFEc/d4C1er0zBc=;
        b=oEjs4+tgLu/p82GF97iT4/bZZEekmCCLFcF5O+Udr6OifE0zJCQlFjS4YUBmrrJW1V
         cH8uOkZ3bD+k0fSfYX1PODMk56ad46vuCF2fUtyUFCguhmaX/g/PRfrYFNi/3t22xu3Q
         iokCwX73+nerqxAh2UWz9kPkxau06A0Dl2nyeAlNHfcpm3nOUDzmyGBIr3hySmWJYqry
         uW+EldG68HDMj581WSpT3gLA1VOd8Xcn0NX0SAZIG/VeTwolj7yG0r7//I9o0ZtJHcEv
         bA+bVB8VOs+eC7pGUCB8x2k2GWCEcLGD2lIS74xTqQyZ6z2SIMlS7OUS0LKFui8zyT7z
         tSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Uk9IMjOz4VgBUm9q2WMfkx3BxI54zFEc/d4C1er0zBc=;
        b=MFqIlpwmEgYsliTD+La1ODgL9A8+kMvIKdJ8camruV3kQ6Mzs5MXNhV9cSGdTRsMnw
         OtIqzTBkt36VjolS55ZSR9IdCzVwRcayafNqnLEcVj/QfiSD9tBJKef0HnG2MsrHr915
         6a3TBDoXmJc1yPpsvxRQOEbZoe/wW2XvyosNiU7Z7PVR2txECWQf/zKmR1+0JPpohj7S
         +3CL77eANh6Uf9+VjQgV/kcV5xFbKXg2JVcOHl7nYkwj4WRoJCneFP6YsSmLPVV/Li2H
         rc8TT7RYwfXKxg4FQFYBtg/CQvhpNavKuIGbumtCjCJHWw+gQAWUBYWQI+1IW9L0eRLM
         E7nA==
X-Gm-Message-State: AOAM532FVkeX8ziT45U8PNFFmhm2VbR9zOtH/HO65VPe8cRlMny5hccE
	xYJ4h9TVDaBGoRg80FFDiWjYrw==
X-Google-Smtp-Source: ABdhPJyDlQe1pRglQF7jtIbmgE+QrKBgA4oAagSne9+wS8SN0cW9hmr49e+A5csTFs1szvSd5X8fAg==
X-Received: by 2002:a92:ad0f:: with SMTP id w15mr2837448ilh.97.1603977283913;
        Thu, 29 Oct 2020 06:14:43 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id e204sm2085211iof.16.2020.10.29.06.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 06:14:43 -0700 (PDT)
Date: Thu, 29 Oct 2020 09:14:38 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm/opencsd: upgrade to 1.43.3
Message-ID: <20201029131437.GA23088@kudzu.us>
References: <20201028103649.748730-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201028103649.748730-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 28, 2020 at 10:36:49AM +0000, Ross Burton wrote:
> Change-Id: I7487c116be0f267dfb53f45ff0a5974c8467dbb6
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Pulled into master

Thanks,
Jon

> ---
>  .../opencsd/{opencsd_0.14.2.bb => opencsd_0.14.3.bb}  | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>  rename meta-arm/recipes-devtools/opencsd/{opencsd_0.14.2.bb => opencsd_0.14.3.bb} (66%)
> 
> diff --git a/meta-arm/recipes-devtools/opencsd/opencsd_0.14.2.bb b/meta-arm/recipes-devtools/opencsd/opencsd_0.14.3.bb
> similarity index 66%
> rename from meta-arm/recipes-devtools/opencsd/opencsd_0.14.2.bb
> rename to meta-arm/recipes-devtools/opencsd/opencsd_0.14.3.bb
> index f321c7d..2121241 100644
> --- a/meta-arm/recipes-devtools/opencsd/opencsd_0.14.2.bb
> +++ b/meta-arm/recipes-devtools/opencsd/opencsd_0.14.3.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/Linaro/OpenCSD"
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=ad8cb685eb324d2fa2530b985a43f3e5"
>  
> -SRC_URI = "git://github.com/Linaro/OpenCSD;protocol=http;branch=master"
> -SRCREV = "afdea70b2cafa20837703c387d33cd6776c6d16a"
> +SRC_URI = "git://github.com/Linaro/OpenCSD;protocol=https;branch=master"
> +SRCREV = "957d18219d162f52ebe2426f32a4263ec10f357d"
>  
>  S = "${WORKDIR}/git"
>  
> @@ -25,7 +25,12 @@ do_compile() {
>  }
>  
>  do_install() {
> -    oe_runmake -C ${S}/decoder/build/linux PREFIX=${D}/usr install
> +    oe_runmake \
> +        PREFIX=${D}/usr \
> +        INSTALL_BIN_DIR=${D}/${bindir} \
> +        INSTALL_INCLUDE_DIR=${D}/${includedir} \
> +        INSTALL_LIB_DIR=${D}/${libdir} \
> +        -C ${S}/decoder/build/linux install
>  }
>  
>  BBCLASSEXTEND = "native"
> -- 
> 2.25.1
> 

> 
> 
> 

