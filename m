Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.39892.1615224627037898218
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Mar 2021 09:30:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=rRQOQ6bz;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.54, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f54.google.com with SMTP id gi9so4957336qvb.10
        for <meta-arm@lists.yoctoproject.org>; Mon, 08 Mar 2021 09:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3Yh91ZGtjsEoS2h5pQc6rXcAT/WBNYczvvNwH9fLut8=;
        b=rRQOQ6bz7eH+obm6LUg7me2uD0J6xI0u2nY7NXdEAv9poTR3vlpgyios5Mo3mLTQ1I
         Pz60D6uIvCcgwpWqSopvqxUOHo/PoWmbW39gEiADR1PexV8Ay2hjImZTnQ8AtoGTsjfa
         /mP1IKxoHJNr9W8hzuEf/PZHl9ZOnQLumWczN1SG5Ryf3UPIIr4WFehrSboEFEWBD0pu
         lUIrQJB86Og4nZTTd22BN3jOqQyKurar3E0NsmDbZXJFOu8gdC9IwkLlQSQhaYmg4YEX
         iAh7A+RvYauoo4evsE9DA43GMMOOcGGEmf5YuU5a/ZIWX0B11DMWioYX+Zs7zEWwTc/y
         U6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3Yh91ZGtjsEoS2h5pQc6rXcAT/WBNYczvvNwH9fLut8=;
        b=oLxC8V2wl43KkDZjIyh3wWah0dkhuN4pj1nVisDh3YW4fgTqq9X6onUvHFOhYIabmG
         e+7cD4tGWojI+/NsSzdWbCmAWIggGUP3WVuCn49sKZoTx91COFLaI3lynen36uehhxik
         Kjjp7QD4eDbwAH8650u8U5/u0UXpTcyCm1xCMyTEfKhbOd3RBM+tAfo72KwLd4vCVWcR
         0iRWvJhHATAiYkeSC6O33X2B0WONcxIUT3g49gtmVj0GSHcn2+Xy2hj7IW8rOzg5q2Zc
         dztZSAbakiOnjWwwoBFIfE7g978waDHGg12hcpEZYBNdwII4HBvsXPnnpltrQJOxIrqE
         ISjg==
X-Gm-Message-State: AOAM530ljFe1b1BaFY9+pZFUzsNUnUXh8ugILlKns3S0xQbv7JQt4+km
	aFsnPBmF7y/cJO7Dm+PjdX0Vmg==
X-Google-Smtp-Source: ABdhPJxAUYRhF5hrKpeY4PeS5p2c0eMqt5fOR0kKf/U1PStqmvxTz2PrOSmDIbrtcg7v4ci4/KaOtg==
X-Received: by 2002:a05:6214:248a:: with SMTP id gi10mr21336747qvb.35.1615224626225;
        Mon, 08 Mar 2021 09:30:26 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a62f:6d00:21eb:6765:e1df:ed61])
        by smtp.gmail.com with ESMTPSA id c7sm8002256qtc.82.2021.03.08.09.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 09:30:26 -0800 (PST)
Date: Mon, 8 Mar 2021 12:30:24 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org, Jon Mason <jon.mason@arm.com>,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [meta-arm] [PATCH] optee: Check for meta-clang for TOOLCHAIN variable
Message-ID: <20210308173024.GB17460@kudzu.us>
References: <20210307174628.2544454-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210307174628.2544454-1-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Mar 07, 2021 at 09:46:28AM -0800, Khem Raj wrote:
> This covers the case when meta-clang is not in layers but TOOLCHAIN
> variable is defined ( via config metadata e.g. local.conf ), the value
> for TOOLCHAIN should be discarded in this case.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Jon Mason <jon.mason@arm.com>
> Cc: Ross Burton <ross.burton@arm.com>
> ---

Applied to the master branch.

Thanks,
Jon

>  meta-arm/recipes-security/optee/optee.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/recipes-security/optee/optee.inc
> index 6f6f26d..d093b48 100644
> --- a/meta-arm/recipes-security/optee/optee.inc
> +++ b/meta-arm/recipes-security/optee/optee.inc
> @@ -12,7 +12,8 @@ OPTEE_ARCH_armv7a = "arm32"
>  OPTEE_ARCH_aarch64 = "arm64"
>  OPTEE_CORE = "${@d.getVar('OPTEE_ARCH').upper()}"
>  
> -OPTEE_COMPILER = "${@d.getVar('TOOLCHAIN') or 'gcc'}"
> +OPTEE_TOOLCHAIN = "${@d.getVar('TOOLCHAIN') or 'gcc'}"
> +OPTEE_COMPILER = "${@bb.utils.contains("BBFILE_COLLECTIONS", "clang-layer", "${OPTEE_TOOLCHAIN}", "gcc", d)}"
>  
>  # Set here but not passed to EXTRA_OEMAKE by default as that breaks
>  # the optee-os build
> -- 
> 2.30.1
> 

> 
> 
> 

