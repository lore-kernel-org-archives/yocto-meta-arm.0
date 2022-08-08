Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA2FC25B08
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 19:35:22 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.3017.1659987316993068653
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Aug 2022 12:35:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=xvSyDGyz;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.208.170,
 mailfrom: jdmason@kudzu.us)
Received: by mail-lj1-f170.google.com with SMTP id v7so10900495ljj.4
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Aug 2022 12:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=vCVdxO0ZyYLsTwoQDujNTzXwkPT72yn3KBQoE9C1kQc=;
        b=xvSyDGyzm9rkAjmSZGRFpPBzDOjnZwanXLUDgtP5+9sxm8Kg/8IN8OrX/WkAaj/7ie
         SSEVS6OiVFUnBKu9TXSoVLOIvEmFAT0Nts6JqEjh8aciEuHm8V7xjSHPXcz2+UrVqrib
         E9FdzLxgZH7mrw7UNMpRWde50I+Rd/6VILT5wPMfG7uH8Ln6/4EO5hEk99SVYiE7Pzxr
         sO8GIIBMVoMI5WZWhZwfVWltjv+UQIpEAwhvSvVoZdC5va5LhBfMUssITkGJbfZXweEf
         Z2ckE3YhcYd1mc5q4lNxtfcfMyq8HV6v5cY81/CX1QO4ICk/pmcH6knMN8dKrkS5dLmj
         6j/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=vCVdxO0ZyYLsTwoQDujNTzXwkPT72yn3KBQoE9C1kQc=;
        b=mUsXqbXbhBwRLpOj8RJgUaGBIx3nWf32R4aakotmrCxKUW9HaLvr1bHuDV4vKAwAHP
         cUf/AgIEKW1TgfABlrGwVxvAYLY1JMfCK6fkmvwCDakn4DZPxCbPC2Xj8++bLywIOPPC
         L+g2VknM8jRLnI+HF4taXiDoDOGYLsBuKpvXPwI4+lF3AHtVs3MJDWpCGY38nkCT5zZj
         aqDL3x1rDD3KiZ100Y6HivUYA5ZKLM1dOGG+Jij6UGKqu/hXj/nR5Ou7YAbaQzAaW8vp
         tEtnsghA78niE5iBMQVLKAqyf3Y9TBEOmiGMvqUHkYc3S2Gw4Kuns7Fn1n4V/r2T6TFd
         v40Q==
X-Gm-Message-State: ACgBeo2K9Av8RSZqUAlcWXU6dzSMrWeyNoWNro2/f6UbgJSKbKir5tlp
	3BcqCIjvClMD4kC/5zHbV5FObmsWs7BY9LERkMhVqg==
X-Google-Smtp-Source: 
 AA6agR6Tie+puDdlYum3S5uHYx7KfKsk9ndBx8kSoS6fGTKUOoaD50KedWJgSCuL4EEIybynfHFc5cB+QH+PjgYdDRw=
X-Received: by 2002:a2e:9950:0:b0:25e:5777:a17b with SMTP id
 r16-20020a2e9950000000b0025e5777a17bmr6218211ljj.32.1659987314945; Mon, 08
 Aug 2022 12:35:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220802155620.31970-1-jon.mason@arm.com>
In-Reply-To: <20220802155620.31970-1-jon.mason@arm.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Mon, 8 Aug 2022 15:35:03 -0400
Message-ID: 
 <CAPoiz9zhtdkT6==mE7JSFJ_nQOFU544_m_MQ5pVt1RyfV8Fy_w@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] gem5: add meta-arm-bsp dependency
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 08 Aug 2022 19:35:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3660

This email's subject should've included "kirkstone".  So, I'm resending it.

Thanks,
Jon

On Mon, Aug 8, 2022 at 2:53 PM Jon Mason <jon.mason@arm.com> wrote:
>
> meta-gem5 needs the 5.4 kernel, which is only present in the
> meta-arm-bsp layer.  Add this as a dependency to resolve issues.
>
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  meta-gem5/conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-gem5/conf/layer.conf b/meta-gem5/conf/layer.conf
> index d329bd04..3affe251 100644
> --- a/meta-gem5/conf/layer.conf
> +++ b/meta-gem5/conf/layer.conf
> @@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-gem5"
>  BBFILE_PATTERN_meta-gem5 = "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-gem5 = "5"
>
> -LAYERDEPENDS_meta-gem5 = "core openembedded-layer meta-arm"
> +LAYERDEPENDS_meta-gem5 = "core openembedded-layer meta-arm meta-arm-bsp"
>  LAYERSERIES_COMPAT_meta-gem5 = "kirkstone"
>
>  BBFILES_DYNAMIC += " \
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3653): https://lists.yoctoproject.org/g/meta-arm/message/3653
> Mute This Topic: https://lists.yoctoproject.org/mt/92899328/3616920
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@kudzu.us]
> -=-=-=-=-=-=-=-=-=-=-=-
>

