Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web10.8450.1604587829400532353
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 05 Nov 2020 06:50:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=sAyP5fbw;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.196, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f196.google.com with SMTP id f93so1207997qtb.10
        for <meta-arm@lists.yoctoproject.org>; Thu, 05 Nov 2020 06:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Rzz7abbMN4IDjcFHH46sbbDHNR/eNCLqrc8LgGLLrKo=;
        b=sAyP5fbwk5ml+t/JIoquEdRXprDp+ui21LG7R0lk+t5lcWr9lTrpJ+ONHV2pY1yY0o
         Wt9GZu2gfUtLcxZ32JPccqS7lHPbi9PqXgGhlv5lmSRyk7hiV0YCL2VHuO5NDQ3Mcl9o
         jg0c2zOx0OnO3gmErqPIiEdw68ULePT5bFQKrhlKbJpDNckC/BGYZ0bPxlsdr8buLJvv
         uFowNu/ZsTdxVJBx0AB+ULk2iu76/hHT9emFSzNqjrBLmzvaoqh0t55ck99yWc5n6SIs
         KbG1uG7bJfUbAoRRiGupI4ENoV3BmR2+vh1oLM/h1U9Jq9NugWfUIEITgdme7CAkFk7L
         8m2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Rzz7abbMN4IDjcFHH46sbbDHNR/eNCLqrc8LgGLLrKo=;
        b=mEUDf6ZpAOTS70ApdGnieuK9gCUwNBFI6Da+nio4Z8qa5J0d3WGMl7Tm1aEIhgLz1x
         hzrwLop4aoP361WHtjmAzxErIdFk9pg+zCWJ3UANKpCh3M6izbDfy0p/uX5ninKZgWDQ
         Uth6cKaB0gv24TW6r7lRWAXE2BvwF9krW/p03EQ4Bk7RWyHHDA9fJMy2LT5qjmZu7qbJ
         XGRP6u/tngjln97EZpVPGSdhP55XzGHR/UTNM5HNwmoEV6BUcZK1prIMgxfhDz0Yxupj
         6HBhXNgGeKXupxCntTTrFevWOcF+P40YLhkN/TnoiFn8dD6uhGTNroDefG0iA+1Cw9oF
         Q4MQ==
X-Gm-Message-State: AOAM530mhnmnA5Wyzg/WVw5FskwTvLEKGsc4qPgIVtXaqZgOmdKV9a74
	oLNBYRvQHZXl/Msmzm/IaXZSYA==
X-Google-Smtp-Source: ABdhPJxVrs9SOCLGK0RsWSkF26WgRPGKOaBpbDkcoeDrFcdYn9dIasT7/83NlAX53w+u38hQDYdfRA==
X-Received: by 2002:ac8:ecb:: with SMTP id w11mr2181771qti.113.1604587828540;
        Thu, 05 Nov 2020 06:50:28 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id e6sm998698qtb.32.2020.11.05.06.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 06:50:27 -0800 (PST)
Date: Thu, 5 Nov 2020 09:50:25 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] optee-client: Disable Werror with clang
Message-ID: <20201105145024.GA26392@kudzu.us>
References: <20201104031617.1770048-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201104031617.1770048-1-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 03, 2020 at 07:16:17PM -0800, Khem Raj wrote:
> Main flags are using gcc specific warning options e.g.
> -Wunsafe-loop-optimizations which are unkown to clang so it reports then
> under -Wunknown-warning-option as an error when -Werror is on
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Applied to master.

Thanks,
Jon

> ---
>  meta-arm/recipes-security/optee/optee-client.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arm/recipes-security/optee/optee-client.inc b/meta-arm/recipes-security/optee/optee-client.inc
> index 26f9724..88a9483 100644
> --- a/meta-arm/recipes-security/optee/optee-client.inc
> +++ b/meta-arm/recipes-security/optee/optee-client.inc
> @@ -16,6 +16,7 @@ SRC_URI = " \
>  S = "${WORKDIR}/git"
>  
>  EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON"
> +EXTRA_OECMAKE_append_toolchain-clang = " -DCFG_WERROR=0"
>  
>  do_install_append() {
>      install -D -p -m0644 ${WORKDIR}/tee-supplicant.service ${D}${systemd_system_unitdir}/tee-supplicant.service
> -- 
> 2.29.2
> 

> 
> 
> 

