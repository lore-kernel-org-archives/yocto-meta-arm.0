Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web11.464.1610652280948514290
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 14 Jan 2021 11:24:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=SA2nobbj;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.174, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f174.google.com with SMTP id r9so4356933qtp.11
        for <meta-arm@lists.yoctoproject.org>; Thu, 14 Jan 2021 11:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pvhE0GWIxvBJ9EOklY0ZV0L3D2/ftAkKKPBT4xqMw90=;
        b=SA2nobbjXcAqZMtdAtg4W6tCnTlRiX2g0beqccGf18X2BRTypJN3Q9rvUlcnvo8gn/
         COoUWsurnYlCsOUiPNjXzyfGiOUSKRTliK/r56Q7fpOT61PMdUKXa2ug+qKftAoqrQk+
         LYEzYSxks9sPiBPQRWQQhEa84f8e5ghoFWYCSRDQGkLLLR1uR/PHGSxjWKFVvMajUoD5
         ehuqxJ007tH4bHp4yGdoXABp08Fj4KlW17GwqnSR44Illa9Vu0FiZZYKYqTjklyLF568
         rez8nP3xQrR3/+bhbnkC/obWVy0S20RqAO5ZVl4d8vUk2TmscHcnkJWzZf8ZKS0A8JPQ
         oyqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pvhE0GWIxvBJ9EOklY0ZV0L3D2/ftAkKKPBT4xqMw90=;
        b=luqKInJrgl6gga18zLYL41uyj10zW5R1C+OR2TrWZXjVf3FWKhXWnnCqp/TxeHeGO6
         BNuJDLXCYBziP7eoIXjiLiiYyoxBW/O+Z/BvMDY2+heJKjSa69/ko2UrZB32OWQrO2t4
         ieCzJHuGIOOQ/VGyZ1wBAqmdMPJJ+QHnCz6V29s5rOn2LZeL0Ddl8/lpIRe6yL4dR3A4
         9SrCloaGRPyfKXI9IO+3uCdjtlygGImcvIeGCe5njqkIvPEhMf2kGp69csPYd8OejATs
         Rv5sEDymu/r98uI+eV88SHeN4AqOxhU48kSQv58F7p0oxwm9Zgo+8ns6CE8aDGmbBU+o
         H/NA==
X-Gm-Message-State: AOAM532II9wJd4iLpBUf0q3fA9KOvQ8tX82xwFFbdiCy+UgijZ7qTt8x
	+PltkPlHfJFqvr8AnB6Hlk4Qkg==
X-Google-Smtp-Source: ABdhPJwHnswoa6JGJxtyn5BYtHpllSQNUTCU3Yw7uB4nFUz1qV6ORrT3AeiMLuPkXCv2TMNU1rt9mw==
X-Received: by 2002:ac8:16ac:: with SMTP id r41mr8581022qtj.270.1610652280135;
        Thu, 14 Jan 2021 11:24:40 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a62f:6d00:1d40:95cb:6898:8d5])
        by smtp.gmail.com with ESMTPSA id c17sm3590463qkb.13.2021.01.14.11.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 11:24:39 -0800 (PST)
Date: Thu, 14 Jan 2021 14:24:38 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm/opencsd: upgrade to 1.0.0
Message-ID: <20210114192437.GI511@kudzu.us>
References: <20210112212033.595087-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210112212033.595087-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 12, 2021 at 09:20:33PM +0000, Ross Burton wrote:
> Change-Id: I7c88e60bbeb6d9149d6d6178067bcd149405c111
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Pulled into master.

Thanks,
Jon

>  .../opencsd/{opencsd_0.14.4.bb => opencsd_1.0.0.bb} | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>  rename meta-arm/recipes-devtools/opencsd/{opencsd_0.14.4.bb => opencsd_1.0.0.bb} (64%)
> 
> diff --git a/meta-arm/recipes-devtools/opencsd/opencsd_0.14.4.bb b/meta-arm/recipes-devtools/opencsd/opencsd_1.0.0.bb
> similarity index 64%
> rename from meta-arm/recipes-devtools/opencsd/opencsd_0.14.4.bb
> rename to meta-arm/recipes-devtools/opencsd/opencsd_1.0.0.bb
> index 2d71a56..cb75ce1 100644
> --- a/meta-arm/recipes-devtools/opencsd/opencsd_0.14.4.bb
> +++ b/meta-arm/recipes-devtools/opencsd/opencsd_1.0.0.bb
> @@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=ad8cb685eb324d2fa2530b985a43f3e5"
>  
>  SRC_URI = "git://github.com/Linaro/OpenCSD;protocol=https"
> -SRCREV = "f4344d1b7d5eb191b6af3d64aa253407a2608e15"
> +SRCREV = "01d44a34f8fc057f4b041c01f8d9502d77fe612f"
>  
>  S = "${WORKDIR}/git"
>  
> @@ -19,9 +19,10 @@ EXTRA_OEMAKE = "ARCH='${TARGET_ARCH}' \
>                  LINUX64=1 \
>                  DEBUG=1 \
>                  PREFIX=${D}/usr \
> -                INSTALL_BIN_DIR=${D}/${bindir} \
> -                INSTALL_INCLUDE_DIR=${D}/${includedir} \
> -                INSTALL_LIB_DIR=${D}/${libdir} \
> +                INSTALL_BIN_DIR=${D}${bindir} \
> +                INSTALL_INCLUDE_DIR=${D}${includedir} \
> +                INSTALL_LIB_DIR=${D}${libdir} \
> +                INSTALL_MAN_DIR=${D}${mandir}/man1 \
>                  "
>  
>  do_compile() {
> @@ -29,7 +30,9 @@ do_compile() {
>  }
>  
>  do_install() {
> -    oe_runmake -C ${S}/decoder/build/linux install
> +    # Remove mkdir when upgrading (https://github.com/Linaro/OpenCSD/pull/36)
> +    mkdir --parents ${D}${mandir}/man1
> +    oe_runmake -C ${S}/decoder/build/linux install install_man
>  }
>  
>  BBCLASSEXTEND = "native"
> -- 
> 2.25.1
> 

> 
> 
> 

