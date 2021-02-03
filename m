Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web09.9470.1612361023634460679
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 03 Feb 2021 06:03:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=dFib/q71;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f173.google.com with SMTP id n15so23402651qkh.8
        for <meta-arm@lists.yoctoproject.org>; Wed, 03 Feb 2021 06:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jg2lRIGeEvcQEtpgZXpDepE8AMZ4uxrAvvSxE6UwDCU=;
        b=dFib/q71gCtJpvMPTZKmL2LhYnTx7Lzm3zvPrmy/OHN9KwbMs+oTZz4Kw3Kx1GI5Iw
         xE2Gc0WU15yDDsPaLwr7fT+4UhG2f5bkQsZxS9Cfgz540wi2km3zyAJIVcvcKNoMV1x2
         fuEMq60TNNRSOklCc3gPfCLZvdG/ejhbZ6EfLgwWQtNPWZcxXYcAxGsu9kuEZXFG89z7
         MLR4flwUxmicVDbvIW4umTWRS9DTq7MndGz5on197wXpYAL3kl2ny07s6lpG5JPLUmQB
         ZIoFbf97rgTk8W4czXg8mGtKeT9Qrc1H0onfmK5vqky+RSxAiCd4o5kuYh9QOPRXGbUb
         mvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jg2lRIGeEvcQEtpgZXpDepE8AMZ4uxrAvvSxE6UwDCU=;
        b=bygDfbqt5crooGsOmIJxDiis5iS7wodQENcxly3PLjDtsJy++obJLrxF8tM89MdLPr
         kNfpdFS6xiso8rc2OrDLlPuPw+aEpe3eEvVDgKop1nk/q++CFOk6polVckHHo7Yj/CoJ
         HnYYShLVgV8feuChtWBywXfOuSrF4VeQwq/Ul9LAsIxS4FTGkBi2fULy39ZlNnHoe12s
         lUhamF1GPq+XLttK7JZdny0f5id5q1b2gshs1BXHnOXvHl8VcO7zSXfjUwIhDPFMdpGV
         /ZqlfUh+rlPmUY4mt4lIbXss2uEbBqiyCqm4TA4QuVyyjOle5VccSHy6RX7QuBUlhLI9
         n1yg==
X-Gm-Message-State: AOAM532J83njn7ylGf3kv5hbAaNWWxoun9iwcOMsAps2b9TwZm5cz7Fy
	krKACF/wW2iTuuyMPNgPNkBcbw==
X-Google-Smtp-Source: ABdhPJyfzzA3ljTXz58/gag+/JdpN7c0Wj6UJ8ZC6i6lS77qRyHcgMMBWcMY5Qtk6HIGaZwUiwhXnA==
X-Received: by 2002:a05:620a:110f:: with SMTP id o15mr2484237qkk.206.1612361022760;
        Wed, 03 Feb 2021 06:03:42 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a62f:6d00:b5db:bbf6:3a41:532b])
        by smtp.gmail.com with ESMTPSA id b203sm1633775qkg.26.2021.02.03.06.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 06:03:42 -0800 (PST)
Date: Wed, 3 Feb 2021 09:03:40 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Anders Dellien <anders.dellien@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-bsp/fvp-base*: move to linux yocto kernel 5.10
Message-ID: <20210203140339.GC27584@kudzu.us>
References: <20210202144503.14548-1-anders.dellien@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210202144503.14548-1-anders.dellien@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 02, 2021 at 02:45:03PM +0000, Anders Dellien wrote:
> Move both FVP platforms to linux yocto kernel 5.10
> 
> Change-Id: Idc0b35d201a188d69c2e475f2f864f5bb0f06341
> Signed-off-by: Anders Dellien <anders.dellien@arm.com>
> ---

Patch applied to the master branch

Thanks,
Jon

>  meta-arm-bsp/conf/machine/fvp-common.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arm-bsp/conf/machine/fvp-common.inc b/meta-arm-bsp/conf/machine/fvp-common.inc
> index cdfb538..94aa2bf 100644
> --- a/meta-arm-bsp/conf/machine/fvp-common.inc
> +++ b/meta-arm-bsp/conf/machine/fvp-common.inc
> @@ -29,7 +29,7 @@ DISK_IMG_PARTITION3_CONTENT = ""
>  SERIAL_CONSOLES = "115200;ttyAMA0"
>  
>  PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
> -PREFERRED_VERSION_linux-yocto ?= "5.4%"
> +PREFERRED_VERSION_linux-yocto ?= "5.10%"
>  
>  PREFERRED_VERSION_u-boot ?= "2020.10"
>  PREFERRED_VERSION_trusted-firmware-a ?= "2.4%"
> -- 
> 2.17.1
> 

> 
> 
> 

