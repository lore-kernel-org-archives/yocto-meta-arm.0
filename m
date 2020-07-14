Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.3510.1594753122365188505
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jul 2020 11:58:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=JKj7p9uF;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f195.google.com with SMTP id l6so16617583qkc.6
        for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jul 2020 11:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WSGpK2SfHvBuY+vG0gQzNW005D4CzCWplZueJXdELRY=;
        b=JKj7p9uF1Bk3s4UaAeNX+lmIqe1tt214llBMwjI1Y5Ysn68y+CpQg7cBrfx3IKyyYR
         X71J5Sb9OfgQX92GWb5lYePLyxAiKPCzOajPdWGwTiDEm7oazouiVfRnsv04E0M8C0cT
         ItMqNgShYroXOkHLcdajj6aVoDffZMylcVUsbLEp3KQo6Jz+jd9N+heQxX2BaVTthrqo
         bicP+vHaU9iquXPOlpYl2h/hagBCO8fbaw0x0tFMH6boK8e5NuZEla9ZZ1LZzSB77GQt
         bMfk0O7Ud5i0TooQ72LqnpwS46Ln80CbzvHKIo02XyBhJqpEmPLuUhMEsVgqCZpj3+YS
         am8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WSGpK2SfHvBuY+vG0gQzNW005D4CzCWplZueJXdELRY=;
        b=dnvfwlQzTih6KfbEVM+wwDfiBkketwf77QFo+bVoXAETJdBAixLjLZjzTaGJO8pXt6
         DaL8VnjJVR3Zt2NRhMGXaNqqSKiOgqJIBr0DvQN49cbIc/4uWICxfMfEKroStIJwZbA5
         59ZkBoFC2cUoThuyBuSHCNd1TiWk8mIQMayjcdfZNX1CGCiPkq2tqSFf+bQL3uR5YneC
         nD+CRCekgylz6BUEStAAsXZ00koJ72E7pAlNl7BQuA0+xg4BCdKldlqTPxj9eCII7NvJ
         wbQcrZJXJdj+WsLZnJAPJ/fjnL7T2V525PCqx6FdOIztDoAvG+G9uOFOThOyLH5+xCk9
         ruug==
X-Gm-Message-State: AOAM5319Wvp2acvblp/GVJZTc4+eQHjgm1tHcSVe+IE3t+KHWAgiVwi6
	H0RXVRaIO0EfpYRxvUS/sj+HsfnhidOMcQ==
X-Google-Smtp-Source: ABdhPJxC91E4SXpUKQWXfwMwhHBXFQMrScs+1X1hzt+sXbKOJyO41pTb7coI3YJ0iFuBG+aN//RkYQ==
X-Received: by 2002:a37:855:: with SMTP id 82mr5679773qki.441.1594753121533;
        Tue, 14 Jul 2020 11:58:41 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:d523:4dcb:5d9f:3d2])
        by smtp.gmail.com with ESMTPSA id t138sm22669857qka.15.2020.07.14.11.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 11:58:41 -0700 (PDT)
Date: Tue, 14 Jul 2020 14:58:39 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/2] opencsd: put version into PV instead of SHA
Message-ID: <20200714185839.GG17632@kudzu.us>
References: <20200714130442.580205-1-ross@burtonini.com>
MIME-Version: 1.0
In-Reply-To: <20200714130442.580205-1-ross@burtonini.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 14, 2020 at 02:04:41PM +0100, Ross Burton wrote:
> From: Ross Burton <ross.burton@arm.com>
> 
> Change-Id: I3615737fe64b26249a0405dc20843735913b3078
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Series pulled into master.

Thanks,
Jon

> ---
>  .../opencsd/{opencsd_git.bb => opencsd_0.12.2.bb}                 | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-arm/recipes-devtools/opencsd/{opencsd_git.bb => opencsd_0.12.2.bb} (100%)
> 
> diff --git a/meta-arm/recipes-devtools/opencsd/opencsd_git.bb b/meta-arm/recipes-devtools/opencsd/opencsd_0.12.2.bb
> similarity index 100%
> rename from meta-arm/recipes-devtools/opencsd/opencsd_git.bb
> rename to meta-arm/recipes-devtools/opencsd/opencsd_0.12.2.bb
> -- 
> 2.26.2
> 

> 

