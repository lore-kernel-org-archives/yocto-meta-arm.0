Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5450DC433F5
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 13:08:09 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web12.11002.1639055287993871246
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 05:08:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=7QYIn+Mu;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.180,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f180.google.com with SMTP id o17so5247698qtk.1
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 05:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=76BbWazeX16MfZhrqTFL17+hy2veh0SIBYlPUapddGE=;
        b=7QYIn+MuFJfDTd3QG3yowLRZyf/QhE6MXSyVKx1BCQ6EQQ/hhtBhajJ8XmAuMr+OZe
         I2IlhN3P193ohPZmoaN+r1g12Ehm+mMsPEZ+v9IcH1BH0jjYy3/CNOm+f9/e88BV9c/b
         ICMvMfya9z3CVzHD2lcQ1bKpXmxl7GGvDVXVACEvhGvW2DY9TGStV/tC4u2JPOVce2ej
         FAwHw6B9XA84vNZRpCvls3QvYo4Ckn5CVdmzXXVI2QBM3QEGLG1DawHGI36P42mOngQQ
         rpJRF6s7975XiwcPU8s8OEpP1LNJQk3nWvCX5hv3sW20/KxG6IHL62pJkvu4pkyacFiq
         jAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=76BbWazeX16MfZhrqTFL17+hy2veh0SIBYlPUapddGE=;
        b=a9zwWYYMTchUUV9RTYKali6WU/TIC2gNUUP9R0jTHyz5nQK04u7FusWzo7DmbqkbZ9
         gRp+20aOqO84BJ2flTillk2nsPMHruM8qvlSV4268eTL5O7y6yqDCp1vOxed8BwahF+8
         Zu5CsQ7upzwc1YbSvsqhoqSMBo1bSeeStGPN9xmAflf3V3OwQ/MdKT4WNWxY314DZp7o
         HqZF4OeEaGunvTjp5i/EKoaT5kBv1RzBV8UdRERNIFwZv8RzRO6cSSJbR/bDIArYaxuq
         FrYB+5X/W/scuAdKvHmqYfR4OKHiuPMV/824nBq5+PHGNZIBFPFyiJmnaN8WGwRk7l3j
         VWJA==
X-Gm-Message-State: AOAM5315MSo/fSqpRxq7jmOM42dWGLC/ao1hXYa9f/YUNmzerG3dL/E1
	KcYJ1Dxou/8pCYbvGO7DMNHE1g==
X-Google-Smtp-Source: 
 ABdhPJyHcxZHZJqd6lUmfxYIRYqYsYAKx5AbeMcfB/GtIYoDM+PHf6tsw49rBeOFn59z2K0u33l2Vg==
X-Received: by 2002:ac8:5b83:: with SMTP id a3mr17606949qta.62.1639055287020;
        Thu, 09 Dec 2021 05:08:07 -0800 (PST)
Received: from kudzu.us ([2605:a601:a626:6000:28c4:a17f:5953:8cab])
        by smtp.gmail.com with ESMTPSA id
 p1sm2676341qke.109.2021.12.09.05.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 05:08:06 -0800 (PST)
Date: Thu, 9 Dec 2021 08:08:05 -0500
From: Jon Mason <jdmason@kudzu.us>
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH] trusted-firmware-a: Pin to use gcc for now
Message-ID: <20211209130803.GA30223@kudzu.us>
References: <20211208205809.3079680-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208205809.3079680-1-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 09 Dec 2021 13:08:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2576

On Wed, Dec 08, 2021 at 12:58:09PM -0800, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb
> index ec1bec9..dd8fd44 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.bb
> @@ -10,3 +10,8 @@ SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=ht
>  SRCREV_mbedtls = "e483a77c85e1f9c1dd2eb1c5a8f552d2617fe400"
>  
>  LIC_FILES_CHKSUM_MBEDTLS = "file://mbedtls/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> +
> +# code bloats with clang and results in error below now
> +# | aarch64-yoe-linux-musl-ld: region `PMUSRAM' overflowed by 3928 bytes
> +# this needs fixing until then use gcc
> +TOOLCHAIN = "gcc"

Is the above error something that you will fix?  If so, can you open a
bug somewhere (like the yp bugzilla)?  If not, can you tell us how to
reproduce so that we can open a ticket in our internal jira?

I don't want this to be a forgotten workaround.

Thanks,
Jon

> -- 
> 2.34.1
> 
> 

