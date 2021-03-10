Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web09.2543.1615338781846711944
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Mar 2021 17:13:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=aQK6ldhs;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f170.google.com with SMTP id 2so11880580qtw.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 09 Mar 2021 17:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=f7nVw9bdBzmjMXNjwTNDZo2n/xWvyA1cwk1zlxXZffY=;
        b=aQK6ldhsVVoKFi5GvRw6fKEd989AKwy42C6xwa3msCPQ2Pp00Jgp+MovgusfrLcYVA
         gObqpih6TUYzZmVR2xaytHxX/sP07R8uzLZYVoFlFG6Nuq4PLLygRrHw4w+4KYrMvPsi
         6GbhDoV1BxUSvO/InmRBXy8E0yop+8gcs5pdDLhKwbEGEmuLIlmkEqD92e6P59R6sFOA
         M+GlHKNgQCBRMmnPmcu+y5DO/GxwwaXQ8fi64tOnlP3PGp9eyAhT08uNuOZTDMul7Kq/
         gu8/kqCI4CAmXxqdAx6E9+5UK/jR/s1iqTLKOCyXHjMk207dVxKL5fXEEbGhp7huhGGf
         oJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=f7nVw9bdBzmjMXNjwTNDZo2n/xWvyA1cwk1zlxXZffY=;
        b=qMfhhWWZ+jUbGEVmqA6ZVpcos8o6EXaZSwFeYjXpcCfxzNuXx8aOs2acVr2VViCFv5
         aDbYEFJDZC99wWNiEQMVJL8Wr96h/IQZ7XDzmx3YfJumCT8byhbI80hxTGu2jSGzCY3f
         8a6b4ZBOLvs/GwDXaIY1sOXRTKmHwUSzpFE+BJw1/+GjsMe9FcR5EZ062Mz7e9j4H+Sk
         xd3A+1w5631u6ZtZ07UG9hXb2AhoIY2erSsiuFR7KYc7MpiN7dA2y8OMghzlEzj3gYVD
         lOCWXkUp3UCnOvXOtsmrF6OyY8IOjPipwox35OoDOxloby/Q6UAG0HMQDraINsuCdJZL
         QbLA==
X-Gm-Message-State: AOAM530tfOvmvRW7k9w4ZG3H73pngnU35zFJqDRDUSCw+mk0wiFMkwou
	75D20s3trlk341B3MoIdCru2gDU6t12W4pkE
X-Google-Smtp-Source: ABdhPJxbzvcIZn0E5iT3cVBq0VW9Ewmmqz1zmF+HhiAai2frxZZoKuneRI53gPMq7ThQB8Ky0Po2hA==
X-Received: by 2002:ac8:424d:: with SMTP id r13mr772845qtm.196.1615338781011;
        Tue, 09 Mar 2021 17:13:01 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a62f:6d00:55e6:414f:4108:a7b])
        by smtp.gmail.com with ESMTPSA id b21sm11355638qkl.14.2021.03.09.17.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 17:13:00 -0800 (PST)
Date: Tue, 9 Mar 2021 20:12:59 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Peter Hoyes <peter.hoyes@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-bsp/linux: Include standard.scc for n1sdp builds
Message-ID: <20210310011259.GC1938@kudzu.us>
References: <20210309124553.3902908-1-peter.hoyes@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210309124553.3902908-1-peter.hoyes@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 09, 2021 at 12:45:53PM +0000, Peter Hoyes wrote:
> From: Peter Hoyes <Peter.Hoyes@arm.com>
> 
> Follow same pattern as juno and fvp-base, by including
> arm-platforms-kmeta and creating a scc file for n1sdp-standard.
> Without this, warnings are being generated when including scc
> fragments from other layers.
> 
> Issue-Id: SCM-2130
> Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
> Change-Id: Ibf7827c86bc59c728773720e510b44d02b837c1b
> ---

Applied to master

Thanks,
Jon

>  .../arm-platforms-kmeta/bsp/arm-platforms/n1sdp-standard.scc | 5 +++++
>  meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc    | 1 +
>  2 files changed, 6 insertions(+)
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/n1sdp-standard.scc
> 
> diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/n1sdp-standard.scc b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/n1sdp-standard.scc
> new file mode 100644
> index 0000000..8536c81
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/n1sdp-standard.scc
> @@ -0,0 +1,5 @@
> +define KMACHINE n1sdp
> +define KTYPE standard
> +define KARCH arm64
> +
> +include ktypes/standard/standard.scc
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
> index b852644..f2bb079 100644
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
> @@ -12,6 +12,7 @@ SRC_URI_KMETA = "file://arm-platforms-kmeta;type=kmeta;name=arm-platforms-kmeta;
>  SRC_URI_append_fvp-base = " ${SRC_URI_KMETA}"
>  SRC_URI_append_fvp-base-arm32 = " ${SRC_URI_KMETA}"
>  SRC_URI_append_juno = " ${SRC_URI_KMETA}"
> +SRC_URI_append_n1sdp = " ${SRC_URI_KMETA}"
>  SRCREV_arm-platforms-kmeta = "6147e82375aa9df8f2a162d42ea6406c79c854c5"
>  
>  #
> -- 
> 2.25.1
> 

> 
> 
> 

