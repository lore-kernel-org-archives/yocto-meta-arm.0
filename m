Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE01C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:32:20 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web09.20529.1646058739586869294
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 28 Feb 2022 06:32:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=1+ySbwXa;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.49,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f49.google.com with SMTP id h13so12662369qvk.12
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 28 Feb 2022 06:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+USj0EG/2ESGIReAP6A1c72R0WzIqpbIEfP2BoFcWjY=;
        b=1+ySbwXarWQsi7gAstcMQgJf28pBIfBr9bBtl5Zox5wabRJy6YYZDfyvuXQb2pZABK
         QbPCqKin/xa52OPfi8ktbgpRXgd6pbgmb8Jzw/iI2nDr9LQK7t7xfENDl4h7W49IaWuI
         TMB41BkBCsyK/P2BAf4AXEqx0bPxN7YbwIZV08cwquuz+dR28dczmA9/12EZa3n4RR3h
         GUiAzTyv3ahDrBJj8p8sVhieq6GsK1BlMjRk11lzENbbtv2KdqZV7n3wiQ4gBABiyNbp
         ysm8AaYmvb4PS9AX+ezo9ML89TAs5azCQ9izuo+sIOthD2yL48AAqyoVroAgj/iH/UvP
         s98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+USj0EG/2ESGIReAP6A1c72R0WzIqpbIEfP2BoFcWjY=;
        b=4ksObhen/AwaItdePQ415gfnHV8RX6EzJr5rUbP4fr2U31ZLrDvhinvIo1n2YyaMB7
         MgtqhG68Zif5LbXE0eQByF/c94Jn0sD1oQsv5fvQJkoKFpFz79oj8TFrZ7zro4bfQ+/t
         mX8Dj5x0azgZRmt5/zA790UqPyWCNJ+HQlyYJ53apD+kvr4eIHTGaLPYL5XvTBLlWQnz
         0uq53PdQRjbO4ASv4e1LcwbRR+h2KDauvmc+ft/SngOqevqx0sDVNrpbcX5fQ8c/Cf2k
         gglqu4E+DaaQpyBi4HHkN0JRFooIpyBalr7yt/AWxrw1JDJU4i30MpWvFkdEt08yW534
         7Pnw==
X-Gm-Message-State: AOAM531Z7sgz3chWxrBBagk3CYkTnUU4jxpQSogje1/80L07xOkf4k6w
	dWUb90vlUQaeVWRSnromxWdvfg==
X-Google-Smtp-Source: 
 ABdhPJymnjwhsSHi69KgvTfbJv7p2SsmkOzdJomU40GLFh6c7olgLUdbgwfIbM9pAKAi+Y6lcHul2Q==
X-Received: by 2002:ac8:5f4e:0:b0:2df:f369:1e2e with SMTP id
 y14-20020ac85f4e000000b002dff3691e2emr9847689qta.259.1646058738610;
        Mon, 28 Feb 2022 06:32:18 -0800 (PST)
Received: from kudzu.us ([2605:a601:a665:9200:919c:55a6:55ad:dbe7])
        by smtp.gmail.com with ESMTPSA id
 p4-20020a378d04000000b0047cfa3a0cffsm5132430qkd.34.2022.02.28.06.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 06:32:18 -0800 (PST)
Date: Mon, 28 Feb 2022 09:32:16 -0500
From: Jon Mason <jdmason@kudzu.us>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Sumit Garg <sumit.garg@linaro.org>, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] external-arm-toolchain: convert remaining
 licenses to SPDX
Message-ID: <Yhzc8IYycBxTjgRl@kudzu.us>
References: <20220224172442.2136276-1-denis@denix.org>
 <CAFA6WYPdD1eUTRZc7qXG6ANn2YnLhH23v+afS95NtV3t9sSz_w@mail.gmail.com>
 <20220225212033.GA26229@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220225212033.GA26229@denix.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 28 Feb 2022 14:32:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3076

On Fri, Feb 25, 2022 at 04:20:33PM -0500, Denys Dmytriyenko wrote:
> On Fri, Feb 25, 2022 at 10:51:13AM +0530, Sumit Garg wrote:
> > Hi Denys,
> > 
> > On Thu, 24 Feb 2022 at 22:54, Denys Dmytriyenko <denis@denix.org> wrote:
> > >
> > > As automated script missed those.
> > > Also, correct GPLv3 to actually be GPL-3.0-only for toolchain components.
> > >
> > > Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> > > ---
> > >  .../recipes-devtools/external-arm-toolchain/license.inc   | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > >
> > 
> > It looks like there is already a patch merged to fix this.
> > 
> > [1] https://git.yoctoproject.org/meta-arm/commit/?id=74bd32b2e619b0308b6e44841c6bb2c5968346ee
> 
> It was not in the master at the time and there were no patch on the mailing 
> list.

Sorry, the build was broken and we were a little (over) eager to get
it working. 

> 
> 
> > -Sumit
> > 
> > > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
> > > index 10f2542..4260dc7 100644
> > > --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
> > > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
> > > @@ -1,9 +1,9 @@
> > >  LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only & GPL-2.0-only & LGPL-3.0-only & LGPL-2.1-only & LGPL-2.0-only"
> > >
> > > -EAT_BFD_LICENSE = "GPL-3.0"
> > > -EAT_GCC_LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> > > -EAT_GDB_LICENSE = "GPL-3.0"
> > > -EAT_LIBC_LICENSE = "GPLv2 & LGPLv2.1"
> > > +EAT_BFD_LICENSE = "GPL-3.0-only"
> > > +EAT_GCC_LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only"
> > > +EAT_GDB_LICENSE = "GPL-3.0-only"
> > > +EAT_LIBC_LICENSE = "GPL-2.0-only & LGPL-2.1-only"
> > >  EAT_RLE_LICENSE = "GPL-3.0-with-GCC-exception"
> > >
> > >  LICENSE:${PN} = "${EAT_LIBC_LICENSE}"
> > > --
> > > 2.25.1
> 

