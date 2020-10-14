Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web10.9307.1602672849607483356
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Oct 2020 03:54:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=DuPhQZB1;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.196, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f196.google.com with SMTP id z33so1908804qth.8
        for <meta-arm@lists.yoctoproject.org>; Wed, 14 Oct 2020 03:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4EcuE4yHsOzd5+zyWQCVQJcw1Xv/8rpA+DaBmREH3hs=;
        b=DuPhQZB1TTL1+Ary4rbEumPhO6C7ueK3Bu3c6Czy6TfQSvD8WHpnU15ddBqmci4DOM
         oOPG+evU7xlZXvII2ZnndQ3XDRqc9U3/foY2QXbpoLKNbvs6h3QMjbOe3Yrgh/too1HB
         t+EwxmzaR0zsxsIz8hzCNoTIOwuv0dRf+8JDPmAGF0scXycop7OdklS1Sw9k1oyjKzJb
         NR5wX9zbGm21D3ngBwck3NTbEKLE8OeA7IYmPqqSmniv6ZBKA8VvUIh7VJGBJQuZBEjj
         bPxSNeWI/vC1tMI5x+2crojc4WGOIvEfcruQHXJoM+fdieGcG0ZTfbmg+eJK40UR9VjB
         jZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4EcuE4yHsOzd5+zyWQCVQJcw1Xv/8rpA+DaBmREH3hs=;
        b=SmusiBOTaoN/pEWnfJFAjqukFu3LqbHmrqkD/CObaGXOsE0zdWSNlaj9Bih0mOzUAW
         lp5p2xKB9q2V74aKe7Oudsp2OfMXzySrErdC3/+iMJgYguYkFyTFHFITxqDovq4uaZUd
         IZs+mCBhnJdyMwOR+gWrrPA6+EY+kpwdCCBJGdfikcbIXIv/e14f/8J01YfurjSPc4DG
         r2opat2IteogdXHfDPbdWpHcCMTySJBm6mm6xurG6JHiYpwSTcy4uJdIUXplyNvzwEdn
         fLtvCIRSzMDEgbup9ePEXrZQ1bPUD7EYPb4fWDs11c4zeu79bDRgEI984qZKfqX1V8E5
         Hurw==
X-Gm-Message-State: AOAM5322DbEeCRoPXOCq3Gcb/LoBp8T7Pl0h+OFw0L1C5RwaColjTAwR
	taJt++9n/ttIx2AjDxIkCkLCtUuL1K/nQJQB
X-Google-Smtp-Source: ABdhPJzqaDN4hWHjpKke7DyApXUDs1V90w+VDIJaf2eWsfOifq2SbLLDkwj365nlj0ZmcmKYC1B/qA==
X-Received: by 2002:ac8:d6:: with SMTP id d22mr4061874qtg.30.1602672848683;
        Wed, 14 Oct 2020 03:54:08 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id m33sm1165183qtb.65.2020.10.14.03.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 03:54:08 -0700 (PDT)
Date: Wed, 14 Oct 2020 06:54:05 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH 1/2] arm-autonomy: Update Maintainers list
Message-ID: <20201014105404.GA5538@kudzu.us>
References: <3074066cd4d0d95765207943feb2c90d05bfff2e.1602499189.git.diego.sueiro@arm.com>
MIME-Version: 1.0
In-Reply-To: <3074066cd4d0d95765207943feb2c90d05bfff2e.1602499189.git.diego.sueiro@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 12, 2020 at 11:44:07AM +0100, Diego Sueiro wrote:
> Change-Id: If01fcd1aaf971d0e58894661df7fe9f6ab7e5f4a
> Issue-Id: SCM-1520
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>

Both patches pulled into master.

Thanks,
Jon

> ---
>  meta-arm-autonomy/README.md | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arm-autonomy/README.md b/meta-arm-autonomy/README.md
> index 785f278..f882b7c 100644
> --- a/meta-arm-autonomy/README.md
> +++ b/meta-arm-autonomy/README.md
> @@ -88,5 +88,5 @@ would like to contribute, please contact the maintainers
>  
>  Maintainer(s)
>  -------------
> +* Diego Sueiro <diego.sueiro@arm.com>
>  * Bertrand Marquis <bertrand.marquis@arm.com>
> -* Filipe Rinaldi <filipe.rinaldi@arm.com>
> -- 
> 2.7.4
> 

> 
> 
> 

