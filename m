Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 321A2C433F5
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 15:21:55 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.425.1651591312571142667
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 May 2022 08:21:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 122C140BE6;
	Tue,  3 May 2022 15:21:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dZu5vB1ZNB8p; Tue,  3 May 2022 15:21:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EA65740ACD;
	Tue,  3 May 2022 15:21:48 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 28FB5174915; Tue,  3 May 2022 11:21:48 -0400 (EDT)
Date: Tue, 3 May 2022 11:21:48 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: Jon Mason <jdmason@kudzu.us>, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] ffa-debugfs-mod: Do not build for TI SOCs
Message-ID: <20220503152148.GW9834@denix.org>
References: <20220501184731.3730441-1-raj.khem@gmail.com>
 <YnEo7I/HCeTzmtBY@kudzu.us>
 <CAMKF1sqk4PSVJJsc-5d=Csf+fPNHjh=k+8ZDw0OzmHHkPiXOaA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAMKF1sqk4PSVJJsc-5d=Csf+fPNHjh=k+8ZDw0OzmHHkPiXOaA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 03 May 2022 15:21:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3340

On Tue, May 03, 2022 at 07:48:20AM -0700, Khem Raj wrote:
> On Tue, May 3, 2022 at 6:06 AM Jon Mason <jdmason@kudzu.us> wrote:
> >
> > On Sun, May 01, 2022 at 11:47:31AM -0700, Khem Raj wrote:
> > > The module can not be compiled without patching kernel 5.10
> > > This helps meta-ti to live in multi-BSP envs
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb b/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
> > > index 4051c34..a4dd38c 100644
> > > --- a/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
> > > +++ b/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
> > > @@ -27,6 +27,7 @@ do_install:append() {
> > >  }
> > >
> > >  COMPATIBLE_HOST = "(arm|aarch64).*-linux"
> > > +COMPATIBLE_HOST:ti-soc = "null"
> >
> > Shouldn't this live in meta-ti?
> 
> yeah perhaps better there.

If the kernel requires patching to use this module from meta-arm, shouldn't 
meta-arm set a bit stricter COMPATIBLE_HOST? How are other BSPs supposed to 
work along with meta-arm?


> > >  # Kernel modules currently RDEPEND on the kernel, which is troublesome when you want to put a
> > >  # kernel module into a initramfs without pulling the kernel into the initramfs, which would be
> > > --
> > > 2.36.0
> > >
> > >

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

