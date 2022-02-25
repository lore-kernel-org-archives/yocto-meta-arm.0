Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE465C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 21:20:36 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2734.1645824035736207642
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 25 Feb 2022 13:20:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0AB4F40AE9;
	Fri, 25 Feb 2022 21:20:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q80IMG81gj7v; Fri, 25 Feb 2022 21:20:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E595A40A46;
	Fri, 25 Feb 2022 21:20:33 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id AAD501747B1; Fri, 25 Feb 2022 16:20:33 -0500 (EST)
Date: Fri, 25 Feb 2022 16:20:33 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] external-arm-toolchain: convert remaining
 licenses to SPDX
Message-ID: <20220225212033.GA26229@denix.org>
References: <20220224172442.2136276-1-denis@denix.org>
 <CAFA6WYPdD1eUTRZc7qXG6ANn2YnLhH23v+afS95NtV3t9sSz_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAFA6WYPdD1eUTRZc7qXG6ANn2YnLhH23v+afS95NtV3t9sSz_w@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 25 Feb 2022 21:20:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3071

On Fri, Feb 25, 2022 at 10:51:13AM +0530, Sumit Garg wrote:
> Hi Denys,
> 
> On Thu, 24 Feb 2022 at 22:54, Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > As automated script missed those.
> > Also, correct GPLv3 to actually be GPL-3.0-only for toolchain components.
> >
> > Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> > ---
> >  .../recipes-devtools/external-arm-toolchain/license.inc   | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> 
> It looks like there is already a patch merged to fix this.
> 
> [1] https://git.yoctoproject.org/meta-arm/commit/?id=74bd32b2e619b0308b6e44841c6bb2c5968346ee

It was not in the master at the time and there were no patch on the mailing 
list.


> -Sumit
> 
> > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
> > index 10f2542..4260dc7 100644
> > --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
> > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
> > @@ -1,9 +1,9 @@
> >  LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only & GPL-2.0-only & LGPL-3.0-only & LGPL-2.1-only & LGPL-2.0-only"
> >
> > -EAT_BFD_LICENSE = "GPL-3.0"
> > -EAT_GCC_LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> > -EAT_GDB_LICENSE = "GPL-3.0"
> > -EAT_LIBC_LICENSE = "GPLv2 & LGPLv2.1"
> > +EAT_BFD_LICENSE = "GPL-3.0-only"
> > +EAT_GCC_LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only"
> > +EAT_GDB_LICENSE = "GPL-3.0-only"
> > +EAT_LIBC_LICENSE = "GPL-2.0-only & LGPL-2.1-only"
> >  EAT_RLE_LICENSE = "GPL-3.0-with-GCC-exception"
> >
> >  LICENSE:${PN} = "${EAT_LIBC_LICENSE}"
> > --
> > 2.25.1

