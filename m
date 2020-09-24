Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web10.26886.1600978105751050932
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 24 Sep 2020 13:08:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=kw9yryBd;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f193.google.com with SMTP id v54so136138qtj.7
        for <meta-arm@lists.yoctoproject.org>; Thu, 24 Sep 2020 13:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VEuD9qaU36dy3rIS9qf/HBhKneNUdkm9U/HlglKqHZI=;
        b=kw9yryBdMptKtsJaacUyZpt4/VY2pmqm6IPspxUhaMZZ1aRYiIGHQBABcsMFaUGW0r
         4tI/VEgy2elpWswARF6kiCaWEUfZnEt0Kr0Et8DEbiT/eL93Bdta/oC7KlTFwNDNAlG9
         GjieO3veMjSF0knnyT/x8WDVCv4J5gNgVQ8y0O8fKnk2E4V/Fs4SgeD6tbMzguNZ0C5q
         ofYYqIYkvO7XFz7W8HgI+jLpqqKMN7yi0RR9pOu3zanISngPUy9Ed9229cdN2sqm1SDC
         MiAvSob6i/ptoL3Wc7OS69tAZOXTUt0XJschsvSCD6JS2TOGHRKvRDtDE0uO1yJ2WiHC
         WM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VEuD9qaU36dy3rIS9qf/HBhKneNUdkm9U/HlglKqHZI=;
        b=XbJ1J8ilmQ9IlF+ggmAIeILaCHo2NkykZrWpyxBI80QfF8EczjLkBuOTqNLxdLFaB4
         HYOlAzYAbByqiS6vsC83Az9Sylr5CwyOwcg7XmdQfLn9IYYD8AGv6u7OVTPAnLnSnsMP
         eEifpx19nx6jRpoe9TrQj64U4DlwumNsRAjc+KtNsr3Dl2G9Fl4P52aR+1m/ozS/a5lh
         HlHwqYucsD4e1ch8XOA4PNC111+oNsaWJ1ASxe+n3T+hjP4jZZu4r4PaZ1FoU+yPrDmo
         TxFvuS+VBNzEGAQ478xLYNPRXtoYI54fNnpupuJ7pHIiyK71JzUhaSGjNkrWwMtP2S0m
         Dzkg==
X-Gm-Message-State: AOAM531Cblf8yUXUc48BFUOQo6KYZfTdI7UsdodAyIxdxkzeew4Vh6cA
	goZEOKkXYb7qVeLfkd6uCcR1ZnqnFKZCb/Mk
X-Google-Smtp-Source: ABdhPJyKDxps26ihpqZDCXAn4hR4DwJxFMi+O22+KMfS9CQyD9HyW88ykEM+2CGnkYRI7WMFFz/qfg==
X-Received: by 2002:ac8:44c2:: with SMTP id b2mr862603qto.277.1600978104912;
        Thu, 24 Sep 2020 13:08:24 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id l11sm358209qkk.35.2020.09.24.13.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 13:08:23 -0700 (PDT)
Date: Thu, 24 Sep 2020 16:08:19 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Khasim Mohammed <khasim.mohammed@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-bsp/linux-linaro-arm-5.4: fix N1SDP kernel configuration warnings
Message-ID: <20200924200818.GC4275@kudzu.us>
References: <20200924140240.9442-1-khasim.mohammed@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200924140240.9442-1-khasim.mohammed@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 24, 2020 at 07:32:40PM +0530, Khasim Mohammed wrote:
> Update the cfg file to fix build time kernel configuration warnings
> as shown below:
> 
> {{ [NOTE]: 'CONFIG_REALTEK_PHY' last val (m) and .config val do not match
> [INFO]: CONFIG_REALTEK_PHY : y ## .config: 2358 :configs///defconfig (m)
> [INFO]: raw config text:
> 
> Change-Id: Icdd0ed0ecdde887e4dcb5874cc59ce407c8d92db
> Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>

Pulled into master.

Thanks,
Jon

> ---
>  .../linux/linux-linaro-arm-5.4/n1sdp/enable-realtek-R8169.cfg    | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/enable-realtek-R8169.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/enable-realtek-R8169.cfg
> index 192cac0..7a57474 100644
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/enable-realtek-R8169.cfg
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/enable-realtek-R8169.cfg
> @@ -1,2 +1,3 @@
>  # Enable Realtek Gigabit Ethernet adapter
> +CONFIG_REALTEK_PHY=y
>  CONFIG_R8169=y
> -- 
> 2.17.1
> 

> 
> 
> 

