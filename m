Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web09.8335.1607434254944315406
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Dec 2020 05:30:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=jyiGb8kN;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.52, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f52.google.com with SMTP id s6so463813qvn.6
        for <meta-arm@lists.yoctoproject.org>; Tue, 08 Dec 2020 05:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LGfYpUbjtbQEagPNv/MmGP5km5W4+MVSu9Wi7tzyghg=;
        b=jyiGb8kNEKLSfdOH7sLsyi+8RZTMvJtfL3kFQcacFgbB6MIe2JGvW22XplKBQXBZBz
         SHePmIybg/LFOBMJceL2CeWYgMNeBlSiIWdjeMvIzfKaoZB97K1Ebt6YV3lzHssbDlPH
         MJK+YM7oXsrUMFvUc7s7bXkWMaispgYbrhD8t1E8eDd3H06A5tM/sOnJns1ic5xsQVt0
         BmaXl+7+Q8Rv7ye9dlY7RuoJRNCtqf0eEEY84+/iskI0rxbCM2Kf+mTf87gg4LrlVqOL
         /AqvZ3oCMQxDKTCJZz5EhrG7g/si8HzCNfc5kSUdxUUCRQJ8ltPLepE96zXgzYXdeg2r
         l9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LGfYpUbjtbQEagPNv/MmGP5km5W4+MVSu9Wi7tzyghg=;
        b=W0BxCd2FK3dY41jC15ecRPs3vdOdMq9F4TlFaycv0wQgnbJP5sDMJnLozHCBOaRV+X
         OMXTVk3ltOo6dOe2THLfHdmxt3JdDPyMNBn7OdVnTDS9UQnb8F4KarW4uLE2Ks+g5gSR
         Xr86o1SJKP15Vx2kewTJPS7/g5+ivXJI5nIynx8kZ5fiRZaeE6vD/QTkuk2cLoG7r067
         ANtVjrEd2P6LqjcpqKBpCb/foO69n77ETJbpk4gbIAjH8HAWqgwWQ26hLl7BtZT+CzKI
         bVIO+nyeQR8ogkJTF14hXHmL0RguC7GHF7G9+wG+vgBJAIHviXPC3n4iE+V6DFJ1oXJM
         acEA==
X-Gm-Message-State: AOAM531FHJnPhLCF6n9z8aS5qll/pmg4SFClg7/coKdFIbhGggTMmUyl
	aaNqFZHcP13bNNYa0X1dXjYvOA==
X-Google-Smtp-Source: ABdhPJxnWhcfyBkcx1l31uKI4/2LA9G5WV+Tlgb+9L/hzyHP/3zT9g2bnY5j3lrWvZa7l9c74JvlDg==
X-Received: by 2002:a0c:b753:: with SMTP id q19mr27309191qve.49.1607434254008;
        Tue, 08 Dec 2020 05:30:54 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a606:1b00:d96a:5ab0:517:f408])
        by smtp.gmail.com with ESMTPSA id f185sm3197683qkb.119.2020.12.08.05.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 05:30:53 -0800 (PST)
Date: Tue, 8 Dec 2020 08:30:51 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH][dunfell 01/17] external-arm-toolchain: un-break target compilation
Message-ID: <20201208133051.GA31024@kudzu.us>
References: <20201204152905.1160276-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201204152905.1160276-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 04, 2020 at 03:28:49PM +0000, Ross Burton wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Compiling on the target using runtime libs from external-arm-toolchain
> requires libgcc.a, as libgcc_s.so explains:
> 
> /* GNU ld script
>    Use the shared library, but some functions are only in
>    the static library.  */
> GROUP ( libgcc_s.so.1 -lgcc )
> 
> Otherwise it results in errors like:
> | /usr/lib/gcc/arm-linux-gnueabi/9.2.1/../../../../arm-linux-gnueabi/bin/ld: cannot find -lgcc
> | /usr/lib/gcc/arm-linux-gnueabi/9.2.1/../../../../arm-linux-gnueabi/bin/ld: cannot find -lgcc
> | collect2: error: ld returned 1 exit status
> 
> This already has been fixed before in this commit:
> https://git.linaro.org/openembedded/meta-linaro.git/commit/?id=91ea4d017bf0598e49944e76c889e66d58c066ce
> 
> But then it got broken/undone here w/o due review:
> https://git.linaro.org/openembedded/meta-linaro.git/commit/?id=b43d5f0ce431ba1e242504641266a63293ded5db
> 
> Even though it's a static library, we want it to be in libgcc-dev as it's
> not optional, but rather required for development.
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
> Signed-off-by: Jon Mason <jon.mason@arm.com>

Series applied to dunfell branch.

Thanks,
Jon

> ---
>  .../external-arm-toolchain/external-arm-toolchain.bb           | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> index 04d8923..8cfc208 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> @@ -117,7 +117,7 @@ do_install() {
>  	sed -i -e 's#/bin/bash#/bin/sh#' ${D}${bindir}/ldd
>  
>  	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/crt*.o ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
> -
> +	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/libgcc* ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
>  	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/libgcov* ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
>  	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
>  	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/finclude ${D}${libdir}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
> @@ -310,6 +310,7 @@ INSANE_SKIP_${PN}-utils += "ldflags"
>  INSANE_SKIP_libstdc++ += "ldflags"
>  INSANE_SKIP_libgfortran += "ldflags"
>  INSANE_SKIP_libgcc += "ldflags dev-deps"
> +INSANE_SKIP_libgcc-dev += "staticdev"
>  INSANE_SKIP_libgfortran += "ldflags dev-deps"
>  INSANE_SKIP_libstdc++ += "ldflags dev-deps"
>  INSANE_SKIP_libatomic += "ldflags"
> -- 
> 2.25.1
> 

> 
> 
> 

