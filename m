Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.45329.1593984569174958858
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 05 Jul 2020 14:29:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6FE6840BBB;
	Sun,  5 Jul 2020 21:29:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K8iHZbZV4eyu; Sun,  5 Jul 2020 21:29:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4979F407DA;
	Sun,  5 Jul 2020 21:29:26 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A2B55173C47; Sun,  5 Jul 2020 17:29:25 -0400 (EDT)
Date: Sun, 5 Jul 2020 17:29:25 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm][PATCH] meta-arm: Use dynamic layer magic to build trusted-firmware-m
Message-ID: <20200705212925.GC17660@denix.org>
References: <20200703145233.2494070-1-raj.khem@gmail.com>
 <70b0c7092890fb9841969d1d0df52b2c9fcccac6.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <70b0c7092890fb9841969d1d0df52b2c9fcccac6.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 05, 2020 at 09:15:45PM +0100, Richard Purdie wrote:
> On Fri, 2020-07-03 at 07:52 -0700, Khem Raj wrote:
> > trusted-firmware-m needs arm binary toolchain to build from another
> > layer, this is the only recipe thus far and its better to hide it to
> > majority users who may not be using trusted-firmware-m and thusly
> > meta-arm-toolchain, folks who need to use trusted-firmware-m should
> > explicitly add it to layer mix
> > 
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta-arm/conf/layer.conf                                    | 6 +++++-
> >  .../trusted-firmware-m/trusted-firmware-m_1.0.bb            | 0
> >  2 files changed, 5 insertions(+), 1 deletion(-)
> >  rename meta-arm/{ => dynamic-layers/arm-toolchain}/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb (100%)
> > 
> > diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
> > index 10a7951..2d0c49f 100644
> > --- a/meta-arm/conf/layer.conf
> > +++ b/meta-arm/conf/layer.conf
> > @@ -11,6 +11,10 @@ BBFILE_PRIORITY_meta-arm = "6"
> >  
> >  LAYERDEPENDS_meta-arm = " \
> >      core \
> > -    arm-toolchain \
> >  "
> >  LAYERSERIES_COMPAT_meta-arm = "warrior zeus dunfell"
> > +
> > +BBFILES_DYNAMIC += " \
> > +    arm-toolchain:${LAYERDIR}/dynamic-layers/arm-toolchain/*/*/*.bb \
> > +    arm-toolchain:${LAYERDIR}/dynamic-layers/arm-toolchain/*/*/*.bbappend \
> > +"
> > diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb b/meta-arm/dynamic-layers/arm-toolchain/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
> > similarity index 100%
> > rename from meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
> > rename to meta-arm/dynamic-layers/arm-toolchain/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
> 
> Ross asked to add meta-arm to the autobuilder and I agreed on the basis
> it was passing testing. Due to this change all full builds are now red
> again :(
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/11

FWIW, this has been discussed at length here:
https://lists.yoctoproject.org/g/meta-arm/topic/patch_4_6_arm/75033886

-- 
Denys
