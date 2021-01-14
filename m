Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web09.416.1610652177074461538
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 14 Jan 2021 11:22:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=uJqg7pdB;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f169.google.com with SMTP id a6so4364814qtw.6
        for <meta-arm@lists.yoctoproject.org>; Thu, 14 Jan 2021 11:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uU3JGrVXpzRgZWS6crgC76LCkjyPwEewGXuE9aDoYlk=;
        b=uJqg7pdBK1Oeg1YCYLhVKIxEHCn9Junq03oJMHSsBTe5MCwQbj8P7z5oX0Oe+VNvhR
         7fDNbsg09K/YVDA0w2FI+1Wqfmfp7c7PsIGG0T984YzUZfzw3RXtl37WspCjHYGRB7SE
         pw7aJhUcBuMLgGSicw1WeXgI2pwtBetEkFSwyGCSA3GqKG1/vwcpFiMQuzUBj+O773SD
         BG/QVr/NJKFjQtSmGkc0cJqtGPQE/l/f073tHQeHDJwdrsyIeIuC4X9N71Qr/gpmiH7r
         mNuERlmjIHDpCGRT//aftD+HKkXcEHSj9DQ0M+Q9fkzfNbLNiRxbElOVicx6QGEEFD6O
         L71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uU3JGrVXpzRgZWS6crgC76LCkjyPwEewGXuE9aDoYlk=;
        b=sWvrxCrlqAOQDoqg4EAYs64eZAd6l4t7RF5mIBZmr4vst/aMIQ5ariMY1SZ0VUDy0S
         PAwJucl8Pe5X6326tGAH4VEVzyJcul6JwULlS6N13uukoKHW2SIGTbWR9ffmRSpdCJMc
         s0O43IDseT5cR6lkWf9wkxa3CXfVee7106hiTugK84Zh96SLOFRjt2vpdBrKzeTtL1C1
         f67HYEA+fXJTafolaiddnouM6khtUonCPViShzw5QWCBLNqLJJENCodXYmm2GKNvdP1D
         cxorivFg/DeAyiKSubElc7OrJskdsczHUs2APWaHc6OGYXdm0hqmzdu3Llgj2JhrP7k8
         IyAA==
X-Gm-Message-State: AOAM533F8jNRyH8pMEvte3fGaDHVOKEEC2ipZCtyJxbSvkqXMkeBO5a4
	vt+qW46PCgpapKHSLj34l6W18WnTXnJUdg==
X-Google-Smtp-Source: ABdhPJzYfuVecLJioEIVcItvGXudMQ3ZbCIb7smcJ6jvHle0UIqUCDTujaszTmMEY/9tXKijeHwTLA==
X-Received: by 2002:ac8:48d9:: with SMTP id l25mr2706590qtr.60.1610652176278;
        Thu, 14 Jan 2021 11:22:56 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a62f:6d00:1d40:95cb:6898:8d5])
        by smtp.gmail.com with ESMTPSA id m190sm3538999qkb.42.2021.01.14.11.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 11:22:56 -0800 (PST)
Date: Thu, 14 Jan 2021 14:22:54 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/2] kas: rename armgcc fragment to avoid conflicting with musl
Message-ID: <20210114192254.GD511@kudzu.us>
References: <20210112110915.315703-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210112110915.315703-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 12, 2021 at 11:09:14AM +0000, Ross Burton wrote:
> The armgcc fragment was labelled 'libc', which means it would be
> impossible to armgcc+musl.
> 
> Change-Id: I96f1d6e1a77bcd05fe373315f575c57c36417852
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Series pulled into master.

Thanks,
Jon

> ---
>  kas/armgcc.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kas/armgcc.yml b/kas/armgcc.yml
> index 52b09b0..4e05f5e 100644
> --- a/kas/armgcc.yml
> +++ b/kas/armgcc.yml
> @@ -2,5 +2,5 @@ header:
>    version: 9
>  
>  local_conf_header:
> -  libc: |
> +  cc: |
>      GCCVERSION = "arm-10.2"
> -- 
> 2.25.1
> 

> 
> 
> 

