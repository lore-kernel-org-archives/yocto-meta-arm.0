Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.44209.1593980149956042955
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 05 Jul 2020 13:15:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gb9TR9ze;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id f7so35668709wrw.1
        for <meta-arm@lists.yoctoproject.org>; Sun, 05 Jul 2020 13:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=810XtPDESthD9AYD2O/3omaNertjJrduDFegLwv3A/g=;
        b=gb9TR9zeqf5NcMS5hm95x5lM4axvag92nYEwgrHeqg+T46A5Fq81z6pjN9/BvpbGlT
         MFew4qstgGOE7fqWuMlzFefzEn3H5AxQYJj5Vp6c2Dt2AR6zVia/BjyrssfiS5D7pYF8
         eETnASDgGE1rD0VNuElnieTT+CGVu9T26yplQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=810XtPDESthD9AYD2O/3omaNertjJrduDFegLwv3A/g=;
        b=ZAV2GRdpnsYRyc8q1l4z4QkwSjeniImHh2hSYF3PbF29IdcE20xqkWV8P7+KXniLR9
         KddT9WlcmXwZUYcc/xk9R8Q8PKzrVw6tv4ersJBcTGcGCSFYEFVEk+lI/9M/uq7HVDyt
         eFke6Hd4aYuaGeoViqL1V5iNT4a9FaEtiYUT6iaNUsRJG2y4DN8T45f1LnlGrYQiN3hG
         DTHoK8l7f2c9Nc/K83VIwzYlnoD1w48T5xQxg3thrOc/Rltgi2+y0m2oT0QdP2EObXkJ
         Y3jDbni0FlVy+k8sI8QqnWecFrV7/RGzrEf+FG9C7HWauhZhQdTk6W0EODIbQOuVQWgc
         47rw==
X-Gm-Message-State: AOAM531QYZqgLjkX0EJWs6ltnMV4X6/ylcd6RiEqkaAMUFdiTPpWufd9
	AUYHQ8YrURqIZuVcf2FcN7/mcQ==
X-Google-Smtp-Source: ABdhPJylpJOEFCN9FlVaOuxSU8fLCpNOMrdJC7m+8ODbp+GQchfSTOOsbIphJ54ZMn4Q1E/2I/Kq2Q==
X-Received: by 2002:adf:fa81:: with SMTP id h1mr47895240wrr.288.1593980148446;
        Sun, 05 Jul 2020 13:15:48 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id y6sm21592210wmy.0.2020.07.05.13.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 13:15:47 -0700 (PDT)
Message-ID: <70b0c7092890fb9841969d1d0df52b2c9fcccac6.camel@linuxfoundation.org>
Subject: Re: [meta-arm][PATCH] meta-arm: Use dynamic layer magic to build trusted-firmware-m
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, meta-arm@lists.yoctoproject.org
Date: Sun, 05 Jul 2020 21:15:45 +0100
In-Reply-To: <20200703145233.2494070-1-raj.khem@gmail.com>
References: <20200703145233.2494070-1-raj.khem@gmail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-07-03 at 07:52 -0700, Khem Raj wrote:
> trusted-firmware-m needs arm binary toolchain to build from another
> layer, this is the only recipe thus far and its better to hide it to
> majority users who may not be using trusted-firmware-m and thusly
> meta-arm-toolchain, folks who need to use trusted-firmware-m should
> explicitly add it to layer mix
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-arm/conf/layer.conf                                    | 6 +++++-
>  .../trusted-firmware-m/trusted-firmware-m_1.0.bb            | 0
>  2 files changed, 5 insertions(+), 1 deletion(-)
>  rename meta-arm/{ => dynamic-layers/arm-toolchain}/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb (100%)
> 
> diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
> index 10a7951..2d0c49f 100644
> --- a/meta-arm/conf/layer.conf
> +++ b/meta-arm/conf/layer.conf
> @@ -11,6 +11,10 @@ BBFILE_PRIORITY_meta-arm = "6"
>  
>  LAYERDEPENDS_meta-arm = " \
>      core \
> -    arm-toolchain \
>  "
>  LAYERSERIES_COMPAT_meta-arm = "warrior zeus dunfell"
> +
> +BBFILES_DYNAMIC += " \
> +    arm-toolchain:${LAYERDIR}/dynamic-layers/arm-toolchain/*/*/*.bb \
> +    arm-toolchain:${LAYERDIR}/dynamic-layers/arm-toolchain/*/*/*.bbappend \
> +"
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb b/meta-arm/dynamic-layers/arm-toolchain/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
> similarity index 100%
> rename from meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
> rename to meta-arm/dynamic-layers/arm-toolchain/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb

Ross asked to add meta-arm to the autobuilder and I agreed on the basis
it was passing testing. Due to this change all full builds are now red
again :(

https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/11

Cheers,

Richard

