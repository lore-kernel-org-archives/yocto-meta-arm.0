Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web12.26770.1600978145152003932
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 24 Sep 2020 13:09:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=TJi8IUi2;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f195.google.com with SMTP id 19so167508qtp.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 24 Sep 2020 13:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fmM7I0T8YS2OcmVpW59YtqgWQ+vCDXA9b8ulanniQIY=;
        b=TJi8IUi2PVgx56bXPNofVtPAPCyjIDtFmPRbJYk1kYboHYn0qPi0FP45KhdRyl09m+
         2x3zVO1oDD2OP9qbgjTXNWfm5V3RpeX4AxaJowtwx56sceUrjAkrFmAy95PJB8FLx82H
         A6VMOwy3mjLMrpWlQTpm8qOqgN9k1QaWLFsF2UOoDg6Bwo8cj9JN5UR6VmW69uhZ4rBS
         Js1c2rr1TGlOkQ/9dqH6+izajDX1Ge2KhLRaiBPJ/b70KTfOn+kpfNDLTgxmIjJapSVb
         XHGSgMC6HOYN5o8tNqwNtyL76hPflL62+1TUkyA65P/hqBDNsYWXrrKpp9TvN9DEsfcY
         6pPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fmM7I0T8YS2OcmVpW59YtqgWQ+vCDXA9b8ulanniQIY=;
        b=BYxrjZK+PfvHNCSueorppWEDiJT/NSWdEcyXVYj+l0/I5TuW32gCKj8E2kkP1GtL1B
         iBVHK6acNhJ9ZddbX0x9xojXCwXSHxtngqE23fUJzAU1dK3voipZ0eSadWHFKY4uD3KX
         LmWxaZBDw9aYWaZst02X28e0YuJVd98e9A9tbVnw7Lym0u0xnMo7ZZy7aUtIEsp5vK9Z
         xPDrMVfO0FfgaOQs8D8C9UzGXsHst51+ax+8TA29318juqwc3vf9o5qmP2K1SB364Q3C
         XCvg+szOeOZ8nPZ+QfqgvIvxMxqYM231I8QfKCbl9oe3FQ/fBt1cEuGvGixRNIdxNbnB
         uTAQ==
X-Gm-Message-State: AOAM531PhFre/ogD8YjYk67y5nDehZtlRSUZlTQ124RmnaNE2sUxUJaK
	3Zsgstv/qqEhH9t+HVO4PKywEQ==
X-Google-Smtp-Source: ABdhPJyjp/FMXpTJDvaGYUb+NOnkirckCtXCUpqCpUpQDK1OHeZVaVj2RfyTn3BqtU8RvhTCA8GSzw==
X-Received: by 2002:ac8:31d5:: with SMTP id i21mr828287qte.373.1600978144262;
        Thu, 24 Sep 2020 13:09:04 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id j16sm375706qkg.26.2020.09.24.13.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 13:09:03 -0700 (PDT)
Date: Thu, 24 Sep 2020 16:08:59 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Khasim Mohammed <khasim.mohammed@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-bsp/n1sdp: update TFA SRC_REV to include remote chip pcie support
Message-ID: <20200924200858.GD4275@kudzu.us>
References: <20200924140321.9511-1-khasim.mohammed@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200924140321.9511-1-khasim.mohammed@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 24, 2020 at 07:33:21PM +0530, Khasim Mohammed wrote:
> This patch updates the SRC REV for TFA to latest version, this includes
> patch required to add support for remote chip pcie.
> 
> Change-Id: Ifeba55ca14a3437e343c4bed72ca5bb2bbda7d2f
> Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> ---
>  .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
> index 88967a7..a9cf38f 100644
> --- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
> +++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
> @@ -12,6 +12,6 @@ SRC_URI_append = " \
>      file://0001-n1sdp-arm-tf-disable-workaround-for-N1-Erratum-13157.patch \
>      "
>  
> -SRCREV_tfa = "50eee85e044a77ad59f4903a5dad91b266770a1d"
> +SRCREV_tfa = "dffd5192df41e77e27bb524bfe64d747c1c43522"

Pulled into master.

Thanks,
Jon

>  
>  PV = "2.3+git${SRCPV}"
> -- 
> 2.17.1
> 

> 
> 
> 

