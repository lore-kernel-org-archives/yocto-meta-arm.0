Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web10.79.1607365988133401880
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Dec 2020 10:33:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=RrVdWGdq;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f176.google.com with SMTP id c14so516665qtn.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 07 Dec 2020 10:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=H+mRWgbrcJhHq0wBSMDbNA4HOO5k5x94WeyHz5cjiWY=;
        b=RrVdWGdquOHTByX9fGjkMSh9xiryqRpcp9ay5PYvWPGk+NPowU47tRyaMN063vqmqX
         TC+QO/tQk6tyXMwaAbXePDN2qvT+azs9o1F1wpI+ih+ti12lirZIFoDgNdiqjM4/Vpb5
         p7+Q3Zl+Ur3sW5Q5VvLQi36fbM+yh7NZRnuTe7U6Ys0hs7Z/Yv/LwlE3VOAKz6Uccx9Z
         QG/ia3LdGoqrNYQHfmhMR58NsIXViCEjVgf+bu/9pQB7R0ss0PplN3ZfuZWY+6fwsBke
         M5UAhBUC9YlARLredU+DzRmSycYJF+XQQijUU5GlJhM7c4s2spv8EPYvwO16upBR5QWr
         CytA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=H+mRWgbrcJhHq0wBSMDbNA4HOO5k5x94WeyHz5cjiWY=;
        b=f98NRGYwKuIg33qGmxZ7zrdWSubjbUcbCSMkSYyFEDKx6q7M3eyovBNDuzbtvv8QEd
         wS04zU5DkttZ270gmMm2Afv5FmIfxxL/ABGS8qPeaihs74/cXc1MUlIJsP53Mji7on63
         9x9H8858bgn/YQZ/v6HTBonpvgHvrxjUFpAQBjX52HGc4LBBbWPQqVMmJ6HEaJgUeEvL
         PXBQzmhT11OTu0DHonVpTP9bCNYWkfTrDoO8g4/KibaK/Q7plX5/mH2lXNvIvUjFlt5/
         A+RHdf5BqY1DjIjUesIvhnU0yRq1EDZuhX7zFG/7EQIitvWjiWxLedx5WExELCSpIw4b
         ol+w==
X-Gm-Message-State: AOAM530MthRxMtWCKMpL6A6K+Kgnao/KP+qWkUvK9x/kWTm/iugrHA1+
	di3qlIrZf57DOl5Lo0YUJnBk0VU7hKwDbA==
X-Google-Smtp-Source: ABdhPJyj+oX6LkLLpsrWOQm1f3a7+wwI7eEHt72r3TkumiuwY8REJTgfxXmbUao6KWnYwSmODQg47g==
X-Received: by 2002:ac8:724d:: with SMTP id l13mr25029387qtp.373.1607365987263;
        Mon, 07 Dec 2020 10:33:07 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a606:1b00:d96a:5ab0:517:f408])
        by smtp.gmail.com with ESMTPSA id b33sm13397337qta.62.2020.12.07.10.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 10:33:06 -0800 (PST)
Date: Mon, 7 Dec 2020 13:33:05 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/4] arm/trusted-firmware-m: clean up DEPENDS
Message-ID: <20201207183304.GB16303@kudzu.us>
References: <20201203172059.1347328-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201203172059.1347328-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 03, 2020 at 05:20:56PM +0000, Ross Burton wrote:
> TFM_DEPENDS isn't used anywhere so remove it.
> 
> Change-Id: I7707ada458a001a081aac1f417dc78d6ca37a307
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Series pulled into master.

Thanks,
Jon

> ---
>  .../recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
> index 80df2f1..f24f579 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
> +++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
> @@ -35,11 +35,8 @@ SRCREV_cmsis = "5.5.0"
>  
>  inherit python3native deploy
>  
> -TFM_DEPENDS ?= ""
> -DEPENDS += "${TFM_DEPENDS}"
>  DEPENDS += "cmake-native"
> -DEPENDS += "python3-cryptography-native python3-pyasn1-native"
> -DEPENDS += "python3-cbor-native"
> +DEPENDS += "python3-cryptography-native python3-pyasn1-native python3-cbor-native"
>  
>  S = "${WORKDIR}/git/tfm"
>  B = "${WORKDIR}/build"
> -- 
> 2.25.1
> 

> 
> 
> 

