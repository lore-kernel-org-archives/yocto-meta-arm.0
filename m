Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E5FDEE4996
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 14:11:11 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.309.1692627063213687094
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Aug 2023 07:11:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=34pKcmEH;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-40f0b412b78so23383721cf.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 21 Aug 2023 07:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1692627062; x=1693231862;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RUzzJLaqMse2sZMsWMPfFldKxyBCqTn1KrM+5VtKyQI=;
        b=34pKcmEHew1PWopKjcLnK2Hnzjci98XnZkve+rTELJtKBW0/PTEwGR9erJmWprMNUR
         9NXWxcM6dNQNnRI6AUmtIn8ceTwqwV7CAJ1PX31vyHSi/4sTzxN0yWf1oElad1IuLi+T
         gIGN+LWT5Osit8eYdwh3nlXnpWBbbM/SlTggJxvb+JgR0KQ1wBBfVaddLSN35DGzD3Yd
         am2Hl69V7ZALkA8URfd42OyrchvGfBYiiMlxR3Z0JsraqfcjK0T20Plg6yQC+R6J6WwT
         Ct4CApNzERSYk6ePD9VcSykFc5kqnWRRofh3oAnnQozFkkwbP2wniTxl5RMjBT0TxdN9
         nKDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692627062; x=1693231862;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUzzJLaqMse2sZMsWMPfFldKxyBCqTn1KrM+5VtKyQI=;
        b=BAHBykZwLV5n8YcK2MIMiwqYUDKDwoF+/iNTUbZHURXvwb89sq5SLFbtyCvGM1b+SG
         z+WIU9dfcZG3EjC/IRZbbEzfedFbt7vzvFCx2hdPvvAf+Atlumy7wPlkg3874/FJfFba
         Pt6B8dzsyqGETpiQNEwQj4U7piYOGb2j7iF7yd20xrP3tWhYLVFc6l8i7/BB++Nto9vs
         8/yOlik1vUXvGXsXRAkINA361+RIWY/mWl1LipbcidIEEwyTb81dSgjeyh4alVkpL1q3
         IyDCGhk1msU3x8x8eTAqINplDIIwMf/CbgkpfwazMUa/8TyoUMkPAq5rFC0b/QK9hbcx
         85LQ==
X-Gm-Message-State: AOJu0YwnlXJZza9wkzq96g4qGL0PXzLiJefL88a5Ol8Im8aC3iatF4qc
	HhlybtMVf51Da7ssVJJafzjd5A==
X-Google-Smtp-Source: AGHT+IEZHfHof2GI5f1fg4x0iZheIBhz1Js34tiMjpMY10IhvNdvNc6spfRRksBp5+ywQv5ge5bJBw==
X-Received: by 2002:ac8:5808:0:b0:403:acbc:e941 with SMTP id g8-20020ac85808000000b00403acbce941mr9136099qtg.26.1692627062233;
        Mon, 21 Aug 2023 07:11:02 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a68d:9800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id i8-20020a37c208000000b0076da0a9ea32sm1342192qkm.1.2023.08.21.07.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 07:11:01 -0700 (PDT)
Date: Mon, 21 Aug 2023 10:10:54 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Jon Mason <jon.mason@arm.com>, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm/linux-yocto: change defconfig patch for
 6.4
Message-ID: <ZONwbojuy9RV7m4Z@kudzu.us>
References: <20230820215106.3643758-1-jon.mason@arm.com>
 <ZONfwc7SZdVohjFH@nuoska>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZONfwc7SZdVohjFH@nuoska>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 21 Aug 2023 14:11:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4974

On Mon, Aug 21, 2023 at 03:59:45PM +0300, Mikko Rapeli wrote:
> Hi,
> 
> On Sun, Aug 20, 2023 at 04:51:06PM -0500, Jon Mason wrote:
> > Use the patch that Mikko Rapeli is trying to upstream to work around the
> > Nuvoton defconfig issue instead of reverting the patch that added the
> > platform to the kernel.
> > 
> > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > ---
> >  ...g-remove-CONFIG_COMMON_CLK_NPCM8XX-y.patch | 50 +++++++++++++++++++
> >  ...config-Add-Nuvoton-NPCM-family-suppo.patch | 45 -----------------
> >  .../linux/linux-yocto%.bbappend               |  5 ++
> >  .../linux/linux-yocto-rt_6.1%.bbappend        |  1 -
> >  .../linux/linux-yocto_6.1%.bbappend           |  1 -
> >  5 files changed, 55 insertions(+), 47 deletions(-)
> >  create mode 100644 meta-arm/recipes-kernel/linux/files/aarch64/0001-arm64-defconfig-remove-CONFIG_COMMON_CLK_NPCM8XX-y.patch
> >  delete mode 100644 meta-arm/recipes-kernel/linux/files/aarch64/0002-Revert-arm64-defconfig-Add-Nuvoton-NPCM-family-suppo.patch
> > 
> > diff --git a/meta-arm/recipes-kernel/linux/files/aarch64/0001-arm64-defconfig-remove-CONFIG_COMMON_CLK_NPCM8XX-y.patch b/meta-arm/recipes-kernel/linux/files/aarch64/0001-arm64-defconfig-remove-CONFIG_COMMON_CLK_NPCM8XX-y.patch
> > new file mode 100644
> > index 00000000..d7f01853
> > --- /dev/null
> > +++ b/meta-arm/recipes-kernel/linux/files/aarch64/0001-arm64-defconfig-remove-CONFIG_COMMON_CLK_NPCM8XX-y.patch
> > @@ -0,0 +1,50 @@
> > +From 94a5e7ffe5855272708a94190820534c4f51bdd8 Mon Sep 17 00:00:00 2001
> > +From: Mikko Rapeli <mikko.rapeli@linaro.org>
> > +Date: Tue, 15 Aug 2023 10:36:56 +0300
> > +Subject: [PATCH] arm64: defconfig: remove CONFIG_COMMON_CLK_NPCM8XX=y
> > +
> > +There is no code for this config option and enabling it in defconfig
> > +causes warnings from tools which are detecting unused and obsolete
> > +kernel config flags since the flag will be completely missing from
> > +effective build config after "make olddefconfig".
> > +
> > +Fixes yocto kernel recipe build time warning:
> > +
> > +WARNING: [kernel config]: This BSP contains fragments with warnings:
> > +...
> > +[INFO]: the following symbols were not found in the active
> > +configuration:
> > +     - CONFIG_COMMON_CLK_NPCM8XX
> > +
> > +The flag was added with commit 45472f1e5348c7b755b4912f2f529ec81cea044b
> > +v5.19-rc4-15-g45472f1e5348 so 6.1 and 6.4 stable kernel trees are
> > +affected.
> > +
> > +Fixes: 45472f1e5348c7b755b4912f2f529ec81cea044b ("arm64: defconfig: Add Nuvoton NPCM family support")
> > +Cc: stable@kernel.org
> > +Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> > +Cc: Jon Mason <jon.mason@arm.com>
> > +Cc: Jon Mason <jdmason@kudzu.us>
> > +Cc: Ross Burton <ross@burtonini.com>
> > +Cc: Arnd Bergmann <arnd@arndb.de>
> > +Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > +
> > +Signed-off-by: Jon Mason <jon.mason@arm.com>
> > +Upstream-Status: Inappropriate
> 
> Upstream-Status: Submitted [https://lists.infradead.org/pipermail/linux-arm-kernel/2023-August/859760.html]

Good catch, patch updated (not resending, as this is a fairly trivial
change).

Thanks,
Jon

> 
> Cheers,
> 
> -Mikko
> 

