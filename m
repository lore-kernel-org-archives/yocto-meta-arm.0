Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web12.99.1607366018915895832
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Dec 2020 10:33:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=z5oQ2XPI;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.66, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f66.google.com with SMTP id ek7so6987633qvb.6
        for <meta-arm@lists.yoctoproject.org>; Mon, 07 Dec 2020 10:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lyKzFJVVdH6ygzq+cm4DaS0Q66GWVHBRtdz7BT6tjbE=;
        b=z5oQ2XPIPSONDuCLzrk+ajukrNnGn40NWeqd5z+EB2NSzRxZTqvPOwjf1UNyZDzpsi
         HKNGABAQWeRqaBewU91CxghUf76YchyjAxUBebAzM/Kk85HcrkVetRJRRDZ8Gk2S5O35
         wQWfKoBF/Mj3CBLNtbcAjL8J+KNqzZJhL55EXXvy0mvOzeIQGlLfqknHBMEQlj8/yD7p
         //c16kEJdDO1xdXZqlTS2PbTnCsQN+rQJT55zCg1m0nknBi+/XpWF6Kgt6Z5YA75L7G7
         DYWkv28DOgqrFsmAw+4l1jUqW55JRWcrF/zd/KaQ79g16KxFcN18OA9k7fXzG5I6w0eS
         S/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lyKzFJVVdH6ygzq+cm4DaS0Q66GWVHBRtdz7BT6tjbE=;
        b=tC9VXSsGsibIY7Dw31do1tISCiPyCo56yCsBNBE+dNHukwIoIOg9J9WxzHo+eC9qiw
         y4fNkfXaDhyxplHHM7DUkcYuUF4QKBrDR6MOOFqkvDuHGik0a8NbboEWMDvge6Gn4uKI
         3FlSn2NP+fQNaFWTiinDVl0K09IG8nlRK87tH2OpF/eYuY24hA0ltxh9m4vXNGU1uidX
         kPK/F2heY4Mnz0GYyfd7BW8PcR+KKxDoQ9bAH9ZsQShn9iWJhDTWJ2SYcPC5rBHn6CyO
         jA5td1avMm01JcYdFjcI6A10IL80jWdb4pHF8+O9tnOzD9e6ymNnR2WpZi6k8FBheO8J
         S3aA==
X-Gm-Message-State: AOAM531TiFwOHtMSbwcc4wf8uEIIUWy9q8gKQxFIaoxV222K4fMC2dno
	t4QhURDAzb/v3V39nLWspl604w==
X-Google-Smtp-Source: ABdhPJywJxUKcEgJvlwyy5LsIq7Y1XnHzMHo67D3Iiaw+aKCbT8qjiLyQ2XSWhazniG3DElzsRIOiw==
X-Received: by 2002:ad4:4bb2:: with SMTP id i18mr22529408qvw.52.1607366018096;
        Mon, 07 Dec 2020 10:33:38 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a606:1b00:d96a:5ab0:517:f408])
        by smtp.gmail.com with ESMTPSA id p48sm13154922qtp.67.2020.12.07.10.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 10:33:37 -0800 (PST)
Date: Mon, 7 Dec 2020 13:33:36 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm/opencsd: upgrade to 1.14.4
Message-ID: <20201207183336.GC16303@kudzu.us>
References: <20201203172137.1347737-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201203172137.1347737-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 03, 2020 at 05:21:37PM +0000, Ross Burton wrote:
> Notable changes include resolving a build race.
> 
> Clean up the recipe so that arguments are not passed twice in do_compile(),
> and always pass the install path arguments to clean up the tasks.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> Change-Id: I7e32a40092403fd0c0c53d157ae4581f7903356c

Pulled into master.

Thanks,
Jon

> ---
>  .../{opencsd_0.14.3.bb => opencsd_0.14.4.bb}    | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
>  rename meta-arm/recipes-devtools/opencsd/{opencsd_0.14.3.bb => opencsd_0.14.4.bb} (61%)
> 
> diff --git a/meta-arm/recipes-devtools/opencsd/opencsd_0.14.3.bb b/meta-arm/recipes-devtools/opencsd/opencsd_0.14.4.bb
> similarity index 61%
> rename from meta-arm/recipes-devtools/opencsd/opencsd_0.14.3.bb
> rename to meta-arm/recipes-devtools/opencsd/opencsd_0.14.4.bb
> index bec3dc7..2d71a56 100644
> --- a/meta-arm/recipes-devtools/opencsd/opencsd_0.14.3.bb
> +++ b/meta-arm/recipes-devtools/opencsd/opencsd_0.14.4.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/Linaro/OpenCSD"
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=ad8cb685eb324d2fa2530b985a43f3e5"
>  
> -SRC_URI = "git://github.com/Linaro/OpenCSD;protocol=https;branch=master"
> -SRCREV = "957d18219d162f52ebe2426f32a4263ec10f357d"
> +SRC_URI = "git://github.com/Linaro/OpenCSD;protocol=https"
> +SRCREV = "f4344d1b7d5eb191b6af3d64aa253407a2608e15"
>  
>  S = "${WORKDIR}/git"
>  
> @@ -18,19 +18,18 @@ EXTRA_OEMAKE = "ARCH='${TARGET_ARCH}' \
>                  LINKER='${CXX}' \
>                  LINUX64=1 \
>                  DEBUG=1 \
> +                PREFIX=${D}/usr \
> +                INSTALL_BIN_DIR=${D}/${bindir} \
> +                INSTALL_INCLUDE_DIR=${D}/${includedir} \
> +                INSTALL_LIB_DIR=${D}/${libdir} \
>                  "
>  
>  do_compile() {
> -    oe_runmake -C ${S}/decoder/build/linux ${EXTRA_OEMAKE}
> +    oe_runmake -C ${S}/decoder/build/linux
>  }
>  
>  do_install() {
> -    oe_runmake \
> -        PREFIX=${D}/usr \
> -        INSTALL_BIN_DIR=${D}/${bindir} \
> -        INSTALL_INCLUDE_DIR=${D}/${includedir} \
> -        INSTALL_LIB_DIR=${D}/${libdir} \
> -        -C ${S}/decoder/build/linux install
> +    oe_runmake -C ${S}/decoder/build/linux install
>  }
>  
>  BBCLASSEXTEND = "native"
> -- 
> 2.25.1
> 

> 
> 
> 

