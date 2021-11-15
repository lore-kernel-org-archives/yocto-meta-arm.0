Return-Path: <maxim.uvarov@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3888EC4332F
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 16:03:03 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.24266.1636992182602592263
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 08:03:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=MTlvlY3A;
 spf=pass (domain: linaro.org, ip: 209.85.215.174,
 mailfrom: maxim.uvarov@linaro.org)
Received: by mail-pg1-f174.google.com with SMTP id b4so14914493pgh.10
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 08:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7Y0+SEzaYRX2tYH6x+42TYWftoOMQXa633sxhS7ZLVo=;
        b=MTlvlY3AEmuUSyA5wOWhTpkCd+9bjqgKEuMHItOZYoNDbRR791nKcqCKUvZc3FC2Pb
         ei5RCsQ4JTI/ttMBK2RqKxVKFT0LEVCqTYn3Nlo/I8UrcijPX1w+YSyivXH1gcSNEw+v
         kKDQcrDupCiIU9TaNRACoSUT/7TSo0NRtWFN8uVwyTXvk/J4JgJQe/6z7BC75RdHUNgg
         xYlKe5FX7aH5aYXxIyjW4bQyH425obQuuUeU+ntnK1IYV3Y8f18kMWCihH1Wv2+HeBYN
         bN8mUNTOBEL/kaDoBGjM0bFEiCgkiIf+ZCk4Nl9B2KQLjTqUwNur0pr01wUpyWJFYA1d
         Ww8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7Y0+SEzaYRX2tYH6x+42TYWftoOMQXa633sxhS7ZLVo=;
        b=IXO/wDHnw0jcFWu75OTT7RVkZWUtIpGii4Vwi1DcZj3Ob/9x8dEsaKtrtsk4hg2VqX
         mHULfnjHlPNIM8wlGAvE1nWx/nCNghWG4uDfX1N601duOSawJDAIUoIQYqxr6uVbi8di
         BWuRAvnxr/hdWdJfFzpwf/kkrYiouil4YkMjgp14mk75yq8JAGPKKy6kChuf4zLOuFFT
         ArJ6PGY/g1/zpA8gCYRbhAg3Ubw9LdfQcAdxV43t6wq16VaU8zpsnLYXDzM/aDTP1hQh
         icgpouXlas1GT5wZfSv3Y7Fjc+kn76zdGAKZngB2tg6G1d/c82Iwt8QhyJf/tw22t+4w
         0dDw==
X-Gm-Message-State: AOAM5322mk33yvpTvYFZbRu1eXq0+3jBdMc+pzCPrP4wlu6SJJbbsCJV
	hYgtEn+/NP1EXdYBNnxlMRfwJqhg7scvEea9gCZPmg==
X-Google-Smtp-Source: 
 ABdhPJyRRu/cGZpkELLoYPkJs/FgH/tXxj6AAEOjLuTVKvpgL2OBlYlSxpP1Xssp/gKk03Lq7F6ks+KnovsEuqYbAwc=
X-Received: by 2002:a63:8b41:: with SMTP id
 j62mr25500877pge.420.1636992181544;
 Mon, 15 Nov 2021 08:03:01 -0800 (PST)
MIME-Version: 1.0
References: <20211115140100.24634-1-maxim.uvarov@linaro.org>
 <20211115140100.24634-5-maxim.uvarov@linaro.org>
 <CAAnfSTvdN+Cta73oTQ3MFjNznAT8U0MYaur8h3NzjHUVddMO3Q@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTvdN+Cta73oTQ3MFjNznAT8U0MYaur8h3NzjHUVddMO3Q@mail.gmail.com>
From: Maxim Uvarov <maxim.uvarov@linaro.org>
Date: Mon, 15 Nov 2021 19:02:50 +0300
Message-ID: 
 <CAD8XO3Z10Z2Uhx0tPgDZCvdkch3L7hRqdqjXHtmaomahun=Ebw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCHv3 5/5] tfa: add depends on openssl
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org, Jon.Mason@arm.com, Ross.Burton@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Nov 2021 16:03:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2394

Ross, quick compilation passed without this patch. Please just skip
this v3 series. I will run the build without cache to double check
that it's already fixed.

On Mon, 15 Nov 2021 at 17:03, Ross Burton <ross@burtonini.com> wrote:
>
> Rebase to current master and this will go away.  TF-A doesn't link to
> the target libcrypto.
>
> Ross
>
> On Mon, 15 Nov 2021 at 14:01, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> >
> > build ci/corstone1000-fvp.yml: generated the following error for me:
> > libcrypto.so.3: cannot open shared object file: No such file or directory
> > Add openssl to DEPENDS.
> >
> > Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> > ---
> >  meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > index 243e641..0f7d3de 100644
> > --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > @@ -87,7 +87,7 @@ DEPENDS:remove = "virtual/${TARGET_PREFIX}compilerlibs virtual/libc"
> >
> >  # We need dtc for dtbs compilation
> >  # We need openssl for fiptool
> > -DEPENDS = "dtc-native openssl-native"
> > +DEPENDS = "dtc-native openssl-native openssl"
> >  DEPENDS:append:toolchain-clang = " compiler-rt"
> >
> >  # CC and LD introduce arguments which conflict with those otherwise provided by
> > --
> > 2.17.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#2389): https://lists.yoctoproject.org/g/meta-arm/message/2389
> > Mute This Topic: https://lists.yoctoproject.org/mt/87069393/1676615
> > Group Owner: meta-arm+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [ross@burtonini.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

