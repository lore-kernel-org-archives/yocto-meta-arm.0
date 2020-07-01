Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.3510.1593627057418852917
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Jul 2020 11:10:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AEAB140BA1;
	Wed,  1 Jul 2020 18:10:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eZD6TV3TY5uU; Wed,  1 Jul 2020 18:10:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7CA5F409A6;
	Wed,  1 Jul 2020 18:10:55 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3E8EA173D5E; Wed,  1 Jul 2020 14:10:55 -0400 (EDT)
Date: Wed, 1 Jul 2020 14:10:55 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 4/6] arm: trusted-firmware-m: Add recipe
Message-ID: <20200701181055.GU17660@denix.org>
References: <20200622194802.GI17660@denix.org>
 <31688.1592896016698778890@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <31688.1592896016698778890@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 23, 2020 at 12:06:56AM -0700, Diego Sueiro wrote:
> On Mon, Jun 22, 2020 at 08:48 PM, Denys Dmytriyenko wrote:
> 
> >
> > On Mon, Jun 22, 2020 at 08:29:02PM +0100, Ross Burton wrote:
> > > On Mon, 22 Jun 2020 at 19:44, Denys Dmytriyenko <denis@denix.org> wrote:
> > > > > Looks like it's time to start that multiconfig experiment where we
> > > > > just build another cross compiler inside Yocto.
> > > >
> > > > You can check meta-ti - our K3 platforms have Aarch64 Cortex-A cores and
> > Armv7
> > > > Cortex-R cores, so meta-ti now uses multiconfig to build 2 cross compilers
> > and
> > > > use those for corresponding components. TF-M sounds like a perfect use
> > case
> > > > for that, as well.
> > > 
> > > Awesome for doing it already.  Does it work well?
> > 
> > Works quite well, as long as you can express relations between multiconfigs 
> > with build-time dependency and hand-off via DEPLOY_DIR. Works quite well if 
> > you only need to do firmwares or bootloaders for those extra cores. You can 
> > even have those packaged into a partition in your wic image.
> > 
> > But more complex use cases, which would require run-time dependencies, like 
> > packaging an SDK with both cross-compilers and sysroots, aren't supported yet.
> > 
> > -- 
> > Denys
> >
> On Mon, Jun 22, 2020 at 08:48 PM, Denys Dmytriyenko wrote:
> 
> >
> > On Mon, Jun 22, 2020 at 08:29:02PM +0100, Ross Burton wrote:
> > > On Mon, 22 Jun 2020 at 19:44, Denys Dmytriyenko <denis@denix.org> wrote:
> > > > > Looks like it's time to start that multiconfig experiment where we
> > > > > just build another cross compiler inside Yocto.
> > > >
> > > > You can check meta-ti - our K3 platforms have Aarch64 Cortex-A cores and
> > Armv7
> > > > Cortex-R cores, so meta-ti now uses multiconfig to build 2 cross compilers
> > and
> > > > use those for corresponding components. TF-M sounds like a perfect use
> > case
> > > > for that, as well.
> > > 
> > > Awesome for doing it already.  Does it work well?
> > 
> > Works quite well, as long as you can express relations between multiconfigs 
> > with build-time dependency and hand-off via DEPLOY_DIR. Works quite well if 
> > you only need to do firmwares or bootloaders for those extra cores. You can 
> > even have those packaged into a partition in your wic image.
> > 
> > But more complex use cases, which would require run-time dependencies, like 
> > packaging an SDK with both cross-compilers and sysroots, aren't supported yet.
> > 
> > -- 
> > Denys
> >
> 
> I'm struggling to understand what multiconfig and building the toolchain 
> from source will help on removing the meta-arm dependency on 
> meta-arm-toolchain.
> Can you guys elaborate better?

I don't believe that was directly related. I'm guessing Ross was wondering if 
building a baremetal toolchain from source will reduce dependencies and that 
is indeed possible with multiconfig.

-- 
Denys


> The ideal place for trusted-firmware-[a|m] recipes is meta-arm layer since 
> they are generic and supposed to be specialized/customized/extended/tweaked 
> by BSP layers.
> 
> Using BBFILES_DYNAMIC is a feasible possibility (despite adding at least 
> more two directory levels) if adding meta-arm-toolchain as default 
> dependency on meta-arm will cause so much pain.

> 

