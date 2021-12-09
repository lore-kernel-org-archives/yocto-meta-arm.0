Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8381AC433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 22:18:17 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web12.218.1639088296234520731
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 14:18:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=j3wqxWix;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.174,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f174.google.com with SMTP id v22so6758252qtx.8
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 14:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Zmd45Htx9St+UCeyh30HLaMDJJuLccbtWogo8ehiT90=;
        b=j3wqxWixxJ1EcrfBn1Wt9q9eAEa77ySN6wbrFpT8GDfEk8Eqf/T6y081iyEIhPkkfe
         q1+BPspswmS6yx1+TvjCllX1++SyKSMV17HFcNnziC51WhmzZQAIRbsGcazytXXLJVst
         1F1fyBkclN4bowiQWFIqizkZcXpmSFXCBU97fAyB5qbJMZQhQLSJTyS6c0li3ib51i+W
         sx0E8tFtKHFHb9jkmEUmRBO3KknxzzPpr3xr+U/woe5l6wHVMmlY1t1vFucibHU08wTt
         v/ARIe+3WXivyUGhqClB5AsN06lNnDIsn400BrlldHbJDLgN690hVV+eBA+uohVBqBOd
         rwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Zmd45Htx9St+UCeyh30HLaMDJJuLccbtWogo8ehiT90=;
        b=KCXyL8UZ5+G/zTpVPy6aVJX5sUumOzoWbvEr6WZxkn/KLDXl/jZTMaGrZxoL2lmFhF
         fKQXKEj8kz4Pn6F89m8ThL2SlJnH5dfynpo7SNdzksh9uaWGGCfXzl1TK/xl02sTGSq2
         fSKOsfGeph3hf0DtoFeYdt4jdFyYRpYcl5ayU1khHXRsxoQVnojcKvrcxXB5IdPe0R/I
         nTaS/gEA6dPcM5r/pKFNcOeXVZhATH9umnJ0Waq8LfPDbQo644AL6P5brrMn1OObljTW
         pCkpXaXwQnEgTE4byBkmRaHWpxwLhQ/65C3PW8B7cGfAr1VyFAd53zjmhQfEG0nkHpGv
         9QfA==
X-Gm-Message-State: AOAM532cVhgti3k5WrUlpyoS/4u4+J9O0gj7UFTtWAWBDDgqVmGbckBS
	Yr+x4ZtbaKqHYEvp12BIO1lZ5w==
X-Google-Smtp-Source: 
 ABdhPJwWXU965hWZA89HA9VVxHWX1EuOFy1TfhVyCBUOG22yVHYnXuMsXs1epJiHyPEDVvuQYfduNA==
X-Received: by 2002:ac8:6113:: with SMTP id
 a19mr21656370qtm.307.1639088295366;
        Thu, 09 Dec 2021 14:18:15 -0800 (PST)
Received: from kudzu.us ([2605:a601:a626:6000:28c4:a17f:5953:8cab])
        by smtp.gmail.com with ESMTPSA id o9sm765153qtk.81.2021.12.09.14.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 14:18:15 -0800 (PST)
Date: Thu, 9 Dec 2021 17:18:13 -0500
From: Jon Mason <jdmason@kudzu.us>
To: Hugo L'hostis <Hugo.Lhostis@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] kas: Update include syntax to kas 2.6
Message-ID: <20211209221812.GA17378@kudzu.us>
References: <16BF0C7931AA05CD.7398@lists.yoctoproject.org>
 <DBAPR08MB5560CF14ADBFBBC5053C0F3586709@DBAPR08MB5560.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <DBAPR08MB5560CF14ADBFBBC5053C0F3586709@DBAPR08MB5560.eurprd08.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 09 Dec 2021 22:18:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2608

On Thu, Dec 09, 2021 at 11:32:24AM +0000, Hugo L'hostis wrote:
> Hello,
> 
> Can this patch also be backported on honister please ?

done

> 
> Thanks,
> 
> Hugo
> ________________________________
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org> on behalf of Hugo L'Hostis via lists.yoctoproject.org <hugo.lhostis=arm.com@lists.yoctoproject.org>
> Sent: 09 December 2021 09:34
> To: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> Cc: nd <nd@arm.com>
> Subject: [meta-arm] [PATCH] kas: Update include syntax to kas 2.6
> 
> Using a path relative to a kas yaml file to include another kas yaml
> file won't be supported in the future. This patch also updates the
> documentation for fvp-baser to set the minimal supported version of kas
> to 2.6.
> 
> Signed-off-by: Hugo L'Hostis <hugo.lhostis@arm.com>
> Change-Id: I757103c5433bca7af9ab024370cd1e994d59fe0e
> ---
>  kas/fvp-baser-aemv8r64-rt-bsp.yml                | 2 +-
>  meta-arm-bsp/documentation/fvp-baser-aemv8r64.md | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/kas/fvp-baser-aemv8r64-rt-bsp.yml b/kas/fvp-baser-aemv8r64-rt-bsp.yml
> index 69335e3..19ee747 100644
> --- a/kas/fvp-baser-aemv8r64-rt-bsp.yml
> +++ b/kas/fvp-baser-aemv8r64-rt-bsp.yml
> @@ -1,7 +1,7 @@
>  header:
>    version: 9
>    includes:
> -    - fvp-baser-aemv8r64-bsp.yml
> +    - kas/fvp-baser-aemv8r64-bsp.yml
> 
>  local_conf_header:
>    base-rt: |
> diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
> index 0c801c0..fdf5038 100644
> --- a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
> +++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
> @@ -44,7 +44,8 @@ Ubuntu 20.04.
>  Install the required packages for the build host:
>  https://docs.yoctoproject.org/singleindex.html#required-packages-for-the-build-host
> 
> -Install the kas setup tool for bitbake based projects:
> +Kas is a setup tool for bitbake based projects. The minimal supported version
> +is 2.6, install it like so:
> 
>      pip3 install --user kas
> 
> --
> 2.25.1
> 

