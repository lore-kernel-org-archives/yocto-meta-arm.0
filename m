Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.9323.1602672909698210857
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Oct 2020 03:55:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=L0efbK9E;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f195.google.com with SMTP id i22so2293203qkn.9
        for <meta-arm@lists.yoctoproject.org>; Wed, 14 Oct 2020 03:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vpnWIXIXFZxl9rW9B9Mgn4yHJ3FXPuT/Yhn+rWttK6Q=;
        b=L0efbK9EekfM8oENEH+e0uO2kQLg5qk1huYW2hixV/VFMCNowquQv1IdD/PwA3BXg2
         BtLH/FmWemy7WzeNUh/QS/jiUxUfDbvNws6H1aBRmJhXtU4O1Bbw4MLsWY3RPIVtFbgM
         K77Yd/0/WGh7Petc6LEH2KrQ3xUjZdfbm33+glYLWxkACyF7RG8vYtA0eZ+hI4H1NFrF
         bcFCnVQfdnQ7LynwEG8CcQKc25wbyliyauGwiaYJOu+/KJx1/4WiH+ylkMUwY0gsZOjg
         +ULUFiAdvZE5Vj9OpdGXFDVUM3AmuTp3mL8BHJxmW/+oQcssQqVF4tiU+sIPXtlW8bIq
         XlTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vpnWIXIXFZxl9rW9B9Mgn4yHJ3FXPuT/Yhn+rWttK6Q=;
        b=ozC7QrDnRoQ0lOxogqpP/KtdoRyTH3OIJ5et4pNNLd6RmdMdM9SEsFmNMdGzIxMSQj
         takX/s6FWbjeB6eKsEZTcv4/wCzTlqxsV1svYNzRCVjlWpLztYe2MXXgKTzVXLxz7o1w
         2WLDXT0nmE+9ghPwRo5ERUpi0dhWP2MEeP+c76t50ubM7cNx0HFHhOYTT8abXOj8TJ7M
         veM7Jz08zK0FueSY3PVv/qWlWD8+/A7MwFu7PgBmgbvprOGbho6drciM3R7pdu5Sd12d
         H/jzTIRgSKxvwlWNM0Lt5jgOgpH0N3VcJjJlqej1LPN02czimXzAKU5NzljU+zlzvtM3
         l5HQ==
X-Gm-Message-State: AOAM531/5L4a6ncK8FIAoGTnz4eIqq1m0FIQC9d6PFY6t9fbs8vfCXj8
	eVTcYTu/irbr8R/9Kni5zvOI7g==
X-Google-Smtp-Source: ABdhPJzc4wnHEa1X9cKxT3olt6pKwkmfpiMqQIiBlQf0XVatH9GmTE5UwrKfOjXpN5G+9vodNvCYSA==
X-Received: by 2002:a05:620a:21da:: with SMTP id h26mr4257948qka.123.1602672908788;
        Wed, 14 Oct 2020 03:55:08 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id 6sm1063510qkj.75.2020.10.14.03.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 03:55:08 -0700 (PDT)
Date: Wed, 14 Oct 2020 06:55:03 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Usama Arif <usama.arif@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH 1/2] arm-bsp/trusted-firmware-a: Update SHA for tc0
Message-ID: <20201014105503.GC5538@kudzu.us>
References: <20201013111812.52597-1-usama.arif@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201013111812.52597-1-usama.arif@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 13, 2020 at 12:18:11PM +0100, Usama Arif wrote:
> This SHA of trusted-firmware-a includes support for
> additional features for tc0 including TZC and cpuidle.
> 
> Change-Id: I004f9614b2bada9b88d2fce90f0f10064d8437e4
> Signed-off-by: Usama Arif <usama.arif@arm.com>

Both patches pulled into master.

Thanks,
Jon

> ---
>  .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.inc   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.inc
> index e2f41f1..9af04e8 100644
> --- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.inc
> +++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.inc
> @@ -1,7 +1,7 @@
>  # TCO specific TFA configuration
>  
>  # Intermediate SHA with 2.3 baseline version
> -SRCREV_tfa = "2fe7d18b0d99fdf4c4dbf84863bb2036dfebc537"
> +SRCREV_tfa = "16796a25fefc4ecf780211bf554d3b8dc5436fa4"
>  
>  DEPENDS += "scp-firmware"
>  
> -- 
> 2.17.1
> 

> 
> 
> 

