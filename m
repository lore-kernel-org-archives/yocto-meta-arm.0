Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web10.18815.1591965907126654335
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Jun 2020 05:45:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=m8Hqk0M0;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f193.google.com with SMTP id g18so6950680qtu.13
        for <meta-arm@lists.yoctoproject.org>; Fri, 12 Jun 2020 05:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=i0vpRzKs6/9Fq0ouFQSHoDIiMwBgXo1B4Qxklcf3z/o=;
        b=m8Hqk0M0xFahgZ01+hP45UvH9QdQioB8+eUBsSr2sJPnOW/rSTzpCmNWTAXf5Xdkhq
         LWWZBLycw9agvdxS178o6jRCF4QNQvRrMzuAqZT8T+jmA8aMGpopLUvF6cwm+7/DO7PE
         OoFQ0/NYzZWNPjwr3BvqfwXafDhVMEf/Q/cQ7QNf/4/UiTb+aXtBStCuxG/DctqGAhQL
         VOlgKTTG1VJAAWXcq+7LTAYiVtgYdfrj22FLJM39U6uOODIBca/RanWvyOYPb/l4rCDU
         f38VOfNIsIj7uLwvgWw8PADVEafZhlqWUiPqDgA/dcYfbzfi++S3AoaP1jClIsYk2xiq
         JUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=i0vpRzKs6/9Fq0ouFQSHoDIiMwBgXo1B4Qxklcf3z/o=;
        b=SebYaFd2EuHz7T7QWlSuEAz+5z/4ienNOmZx0SP/OxuYhl8IJLsCVGPbtm62EXMxMc
         hoKtp2blyOPgcnezu6CtSvKrSW5dM0i/OZbZMG1KR6XKeYZZIetubiFEAcFtpuzWbJaI
         88KM7YQHfH6hen3PdkBFJBQhgTTG58V6dh+zPVqjj5H1c2x9nqxPRrajKcI2d4co88eS
         rehvFiOaxx7M4/I7vgfsEwQPu7sLdVDBrGJnAX9CIYkrNWaEy8gIosyggCj7byxWBcTo
         fMVvnjFYsAY6k4hqmJsotiKtkolQs8Vv5L8ENLRsYQspj4ALc5utaoXsYa5YmlihBE6O
         R3hA==
X-Gm-Message-State: AOAM5332kKfr98476L/dnywkR2MCl/Ie0HBDJh/VLfFS2OPVot7dxtnJ
	iEmh54+gqUEaFBJUgl1w2xlXRpeiIjheJQ==
X-Google-Smtp-Source: ABdhPJzNaxMlD9R79xq2L3IjWFr34HsUcUOUqcP8qV668EIh6k5o0n0kXLLfKmDtm5MsyI/xsAaOcA==
X-Received: by 2002:ac8:369c:: with SMTP id a28mr2973619qtc.55.1591965906262;
        Fri, 12 Jun 2020 05:45:06 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:d487:8053:cdd4:dbb0])
        by smtp.gmail.com with ESMTPSA id h8sm4713563qto.0.2020.06.12.05.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 05:45:05 -0700 (PDT)
Date: Fri, 12 Jun 2020 08:45:04 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] trusted-firmware-a: fiptool build using BUILD_CFLAGS and BUILD_LDFLAGS
Message-ID: <20200612124503.GB14746@kudzu.us>
References: <1591885024-1856-1-git-send-email-diego.sueiro@arm.com>
MIME-Version: 1.0
In-Reply-To: <1591885024-1856-1-git-send-email-diego.sueiro@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 11, 2020 at 03:17:04PM +0100, Diego Sueiro wrote:
> Since the TF-A fiptool is native tool we should be using the
> BUILD_CFLAGS and BUILD_LDFLAGS flags to proper build and execute it.
> 
> Change-Id: I9634604dbc42ba7da85d9b9449f1ed94ecb38df2
> Issue-Id: SCM-888
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>

Pulled into master.

Thanks,
Jon

> ---
>  meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> index 6f64773..e57d3fe 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> @@ -116,9 +116,8 @@ do_compile() {
>      cd ${S}
>  
>      # These changes are needed to have the fiptool compiling and executing properly
> -    sed -i '/^LDLIBS/ s,$, \-L${RECIPE_SYSROOT_NATIVE}${libdir},' ${S}/tools/fiptool/Makefile
> -    sed -i '/^INCLUDE_PATHS/ s,$, \-I${RECIPE_SYSROOT_NATIVE}${includedir},' ${S}/tools/fiptool/Makefile
> -    export LD_LIBRARY_PATH=${STAGING_DIR_NATIVE}${libdir}:$LD_LIBRARY_PATH
> +    sed -i '/^LDLIBS/ s,$, \$\{BUILD_LDFLAGS},' ${S}/tools/fiptool/Makefile
> +    sed -i '/^INCLUDE_PATHS/ s,$, \$\{BUILD_CFLAGS},' ${S}/tools/fiptool/Makefile
>  
>      oe_runmake ${TFA_BUILD_TARGET}
>  }
> -- 
> 2.7.4
> 

> 

