Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37B01C3A59D
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 16:33:20 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web12.8807.1649252969740361578
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 06 Apr 2022 06:49:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=T8ANaB/A;
 spf=pass (domain: linaro.org, ip: 209.85.216.53,
 mailfrom: sumit.garg@linaro.org)
Received: by mail-pj1-f53.google.com with SMTP id
 s14-20020a17090a880e00b001caaf6d3dd1so5797051pjn.3
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 06 Apr 2022 06:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WqfbDXPLBIEzlfJ2PMdliF3qcqcXjz+ilHlmn2p3LNE=;
        b=T8ANaB/ACbYoBABDa2LPmvaHLvNPwkTm2uc0uxn0RAogzXgJZtVmB8GzKCBb2KbVOI
         2/JO0sKw4tr9T9c6XtrYtmTPbHwS5aN3mK7y3g/S05j+CUovU1qdHVHhtkLVXrZmbZ/z
         AjT3oth5LgUEJ6JwBf8xxGGmcc2ldQU7O0OXidaWte/NOTMaxkDW7JCQUClt0eGM5xJ4
         bt4vZ+LErVd9YJlB1mUNnqJYgtZd7YdckRCYXVEy+Hbkdu+1zND1TtIsBTeAbe89sQEi
         xrIsjIZq4J1dMv2lSOlprOJfApK/6ACvJSdH77Kp+lBqqAaHCCFo8CflsCGbDmxKMn+I
         uvzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WqfbDXPLBIEzlfJ2PMdliF3qcqcXjz+ilHlmn2p3LNE=;
        b=OSMXaCPJVy68ckUGzLZEPlzKUslh9Ec4V8Mutg7CFg7HMl4Vsm3ai3QKtDAWzTknSW
         jTQJ8DNp4m2RTP1ym2CVToVoEF63FabotrpzLjS/YuReNPoNJObxK5U9cNFdbgEh2ZgN
         BR6W46UrShDLC8G7MRPoMnJck8NpyrrG9d3oggOMD1moFFFYIkOCcBCkVJ5724HOl/Ec
         m7wmJ3vSIUonRUZisKPSGySakreqs4JZsXiiRLVyGJji6mwr8d6KpEFSMabNcze/dsRv
         x3YrMjVH/n/fOYYNBWwcUviSoXp00vVBzXUsGsWoPMY6lzfPxIDcpt/env+SAQPgpTPK
         X9Sg==
X-Gm-Message-State: AOAM532CivBVav5D2K6Zpv/pvSg/OhhZZjbYiKZ8ZVzafZciWd1C1zMm
	FkDXhw5Xf80PMkjmKxwJROXgAO2Zjc4ND3GISjwiWQ==
X-Google-Smtp-Source: 
 ABdhPJx68x4LlVtvDYHPjeqXk8d1gS+gejPVd0v8dmYHrZ14ALQyhimHYg1EdnYa1tChg9DbPXqBDN/RblI7DYolY48=
X-Received: by 2002:a17:902:c745:b0:153:b0e:8586 with SMTP id
 q5-20020a170902c74500b001530b0e8586mr8412706plq.9.1649252969192; Wed, 06 Apr
 2022 06:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220405134810.1999000-1-ross.burton@arm.com>
 <20220405134810.1999000-2-ross.burton@arm.com>
In-Reply-To: <20220405134810.1999000-2-ross.burton@arm.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 6 Apr 2022 19:19:18 +0530
Message-ID: 
 <CAFA6WYP0TgiAUQA6qVyWQvjGn0CAh6hBb+tVtkW89KzOS72J3A@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 2/2] arm-toolchain/tcmode-external-arm: skip
 gcc-cross-*
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 06 Apr 2022 16:33:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3244

On Tue, 5 Apr 2022 at 19:18, Ross Burton <ross@burtonini.com> wrote:
>
> SKIP_RECIPE applies to the full recipe names, which are gcc-cross-[arch].
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc | 2 ++
>  1 file changed, 2 insertions(+)
>

Reviewed-by: Sumit Garg <sumit.garg@linaro.org>

> diff --git a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> index d413e3fa..178fb71e 100644
> --- a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> +++ b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> @@ -22,6 +22,8 @@ IMAGE_LINGUAS:forcevariable = ""
>  SKIP_RECIPE[glibc] = "Using external toolchain"
>  SKIP_RECIPE[libgcc] = "Using external toolchain"
>  SKIP_RECIPE[gcc-cross] = "Using external toolchain"
> +SKIP_RECIPE[gcc-cross-aarch64] = "Using external toolchain"
> +SKIP_RECIPE[gcc-cross-arm] = "Using external toolchain"
>  SKIP_RECIPE[gcc-runtime] = "Using external toolchain"
>  SKIP_RECIPE[gcc-sanitizers] = "Using external toolchain"
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3238): https://lists.yoctoproject.org/g/meta-arm/message/3238
> Mute This Topic: https://lists.yoctoproject.org/mt/90265724/1777089
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [sumit.garg@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>

