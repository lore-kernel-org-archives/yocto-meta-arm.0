Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF861C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 12:53:01 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web12.10852.1639054380550337979
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 04:53:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=RgSKz0n2;
 spf=pass (domain: burtonini.com, ip: 209.85.128.50,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f50.google.com with SMTP id 133so4145473wme.0
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 04:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4tRYscLat8FJBr72mTrS6fWa5kxDnh21q6AT1sMuzmQ=;
        b=RgSKz0n2OjtmxVeOTqoAbiECMV6UbirXNjDjBaNb7M1Xn5NgUhD5EmAx2mYK4Eefs/
         uOEJUn7VjRrFgFgvGDtsLVldWTHWpKJJqcmyLNpAZa9wDSNIYiMeZ7K47gWkOMTO7rt/
         /uG4X/Tu8ifGb2bDqsHwsexvQlwwIQ/Wo/8CeOYfJj4AXbnkYTVJydKLpkpw46dAiLFu
         NI8v9ItTWrr3z+540w9D19Y9IVCjkUU7GLRz4cGz1qVgpVj3McsTwhQka3WVHP6DEunP
         PvlD24tOKkj0TxIGjbMnbS/HUxdCOYLCg3pLcL/k5i0rVzhn/K6+Ri7XAGIZVDHWHAfW
         e+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4tRYscLat8FJBr72mTrS6fWa5kxDnh21q6AT1sMuzmQ=;
        b=DK8CU4qsZSd1NiI2cbV5t5pGtqLnHwZhzpTFY/TZ2ftar2hp2C9qNYr+ogf9j1hfVk
         e7a8oKnu6naxk4BRzN4zgtJJCPRpILBqDK2Vu9G52oT+dGlO+9hNqkAE2tvbJb0937ja
         Rs3QcIlBZzMltKOjBftPwSAEE73khhq6j/xtNi47NZ5eVvmL8zqmJY9wSzBT+h8CYsbR
         ufH/J5SB7zqhEzj0cv1mg/5W1bCQhaqEV/3zsQfVhlSxGKKKb15o4iExaP30U+VNaFFH
         oGGfCyvMQA2/G8qKsVbtEC7fY60CFOnC1o2XAd8p11c2iMVyl3HVA7MpfIUw8tY1Su0q
         RWQA==
X-Gm-Message-State: AOAM530yVmBnQRY73LzVnb1KkI0/910j8ImmA0MXD1NuAv5Ncii6kOMc
	kQbmEWZmCbUWIQn9j+mxRbyArFuaAUWgz97ZkNltFg==
X-Google-Smtp-Source: 
 ABdhPJxL5NDCvcdARWnTTvL1iADFd41T2ljReOrQZM+5hA+ZZswu4ZjIZ7Q7P5EQJ3sHKSmyIc4+Ha9fwSXBsIxbGC0=
X-Received: by 2002:a05:600c:350a:: with SMTP id
 h10mr6771266wmq.62.1639054378864;
 Thu, 09 Dec 2021 04:52:58 -0800 (PST)
MIME-Version: 1.0
References: <20211208205809.3079680-1-raj.khem@gmail.com>
In-Reply-To: <20211208205809.3079680-1-raj.khem@gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Thu, 9 Dec 2021 12:52:48 +0000
Message-ID: 
 <CAAnfSTvf-bYpV67hyZOsw7MuefFdbBiGJfWkB4t0rFMweT4ebA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] trusted-firmware-a: Pin to use gcc for now
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 09 Dec 2021 12:53:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2575

What machine was this on?

Ross

On Wed, 8 Dec 2021 at 20:58, Khem Raj <raj.khem@gmail.com> wrote:
>
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
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2572): https://lists.yoctoproject.org/g/meta-arm/message/2572
> Mute This Topic: https://lists.yoctoproject.org/mt/87598328/1676615
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

