Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web10.168.1605888726005635245
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 20 Nov 2020 08:12:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=TcR/f05H;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.196, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f196.google.com with SMTP id l2so9407894qkf.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 20 Nov 2020 08:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eQW5JgHHdMkfoufvTLyEyKtNgDvRvLfGqsyeRsUKXC4=;
        b=TcR/f05HxldZo6iWLsDLtPYmzMfZ7UE510HoXOMzOhPiEvE6+5dzOY2ldY8iOxBqH+
         wqGC2uaEWz+McmbCHUQmqq0dOouOvgj5MrIBNJxJ5q6lIfj1n2PhRvANQ7QVXnq+pAuE
         t733INq2VwVOmjsW9LDRAPLbg6FgHg5cLyUst65oM01eWzPZ4O9WyHOgVPWaztIkW6xx
         RimQMtlzuDGShFcgO39FkdgTdVfFEMrRMhgoYfAYCwXAHh3tEeC0Zzyzx190l3e2rvnm
         19oS9yuzo7peqY/XlWlMyJhMTjLl2+oTwMtquJQW6QorRTHgwG9ZYqBI5oMWCWGW7Knr
         aaMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eQW5JgHHdMkfoufvTLyEyKtNgDvRvLfGqsyeRsUKXC4=;
        b=CGVK3HKIhDRVojl+UCCtl0Na7M2m9KStd8SdHQWLD02ov7AqhJOkBlZ3jdf/F+ONkl
         nS2oLLWEwqqhkrhE7pWA1N8S9cvrrsz/LBwwnI+XkV8MzmbJvT2I7OoVLUM4RwLbmVUC
         lyrV8tdJTwRGd1NXdX3ndYXjxzm9Nw8sFM3T4fzwOGdEUiQMgqOTJFubkl44zh+hQSpb
         hR1PmSTiqgde9bIbLp0AWjt/QQhDGPDbXt0pkPfy6/cESNcLkbtoK6opZVaMQ630kNVr
         X/PfvlFo19VyTcFzalk1Ao4qDSksG0wxk/+c6byPAYQKHg6mOKxNIULj7uQ2c/XmQZ8V
         ghXg==
X-Gm-Message-State: AOAM5314z81bGHk+hmILBbAOqi93wpTkup7T5nIxs5NNh3bW5pnwKCsH
	j3AklhtSeZO4okIESVogkccn1HDfD2MCbQ==
X-Google-Smtp-Source: ABdhPJxw9ogkGaHEog56m/K7oMgCgVsEpfjQvKZiQ0DRrf1GJbLAuHuKvpHCjTUaBlJYOXkPTNmj8w==
X-Received: by 2002:a37:9441:: with SMTP id w62mr17208053qkd.474.1605888725210;
        Fri, 20 Nov 2020 08:12:05 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a606:1b00:1180:47ef:a8ed:94a9])
        by smtp.gmail.com with ESMTPSA id c79sm2304678qke.69.2020.11.20.08.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 08:12:05 -0800 (PST)
Date: Fri, 20 Nov 2020 11:12:03 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/2] arm/optee-os: add CVE_PRODUCT tag
Message-ID: <20201120161203.GB4483@kudzu.us>
References: <20201119084505.2718682-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201119084505.2718682-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 19, 2020 at 08:45:04AM +0000, Ross Burton wrote:
> There are known CVEs for optee-os, so set the CVE_PRODUCT to ensure that
> they are found.
> 
> Change-Id: Ibe88c2193a8e33f603386beedc76fe60eac1b3ea
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Pulled in to master.

Should this be applied to dunfell and gatesgarth?

Thanks,
Jon

> ---
>  meta-arm/recipes-security/optee/optee-os.inc | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
> index ea6c496..f8697cf 100644
> --- a/meta-arm/recipes-security/optee/optee-os.inc
> +++ b/meta-arm/recipes-security/optee/optee-os.inc
> @@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c1f21c4f72f372ef38a5a4aee55ec173"
>  inherit deploy python3native
>  require optee.inc
>  
> +CVE_PRODUCT = "linaro:op-tee op-tee:op-tee_os"
> +
>  DEPENDS = "python3-pycryptodome-native python3-pycryptodomex-native python3-pyelftools-native"
>  
>  DEPENDS_append_toolchain-clang = " compiler-rt"
> -- 
> 2.25.1
> 

> 
> 
> 

