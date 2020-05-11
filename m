Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1628.1589218087097264901
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 May 2020 10:28:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1692340C0F;
	Mon, 11 May 2020 17:28:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w8W3GtKWZmoD; Mon, 11 May 2020 17:28:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E445240A46;
	Mon, 11 May 2020 17:28:03 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id EF403173134; Mon, 11 May 2020 13:28:02 -0400 (EDT)
Date: Mon, 11 May 2020 13:28:02 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org, Khem Raj <raj.khem@gmail.com>,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [meta-arm] [PATCH 1/5] layer.conf: add meta-python to LAYERDEPENDS for optee components
Message-ID: <20200511172802.GH11927@denix.org>
References: <1601D50E043B4BBD.6346@lists.yoctoproject.org>
 <1601D572187EB9D1.6346@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <1601D572187EB9D1.6346@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 01, 2020 at 07:20:26PM -0400, Denys Dmytriyenko wrote:
> On Wed, Apr 01, 2020 at 07:13:02PM -0400, Denys Dmytriyenko wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > optee components use pycrypto, pycryptodomex and pyelftools from meta-python layer
> 
> And this is quite unfortunate! As a proposed common dependency for ARM-based 
> BSPs, I was hoping meta-arm could stay clean and only depend on OE-Core. While 
> meta-python by itself may not be such a big deal, it is not a standalone layer 
> and is part of a much larger meta-openembedded collection of layers. So, any 
> BSP that wants to depend on meta-arm would now need to pull meta-openembedded 
> in its entirety just to use meta-python...

+Joshua


> -- 
> Denys
> 
> 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  meta-arm/conf/layer.conf | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
> > index 0b93e8d..d96e9f1 100644
> > --- a/meta-arm/conf/layer.conf
> > +++ b/meta-arm/conf/layer.conf
> > @@ -9,5 +9,8 @@ BBFILE_COLLECTIONS += "meta-arm"
> >  BBFILE_PATTERN_meta-arm = "^${LAYERDIR}/"
> >  BBFILE_PRIORITY_meta-arm = "6"
> >  
> > -LAYERDEPENDS_meta-arm = "core"
> > +LAYERDEPENDS_meta-arm = " \
> > +    core \
> > +    meta-python \
> > +"
> >  LAYERSERIES_COMPAT_meta-arm = "warrior zeus dunfell"
> > -- 
> > 2.7.4
> > 
> 
> > 
> 

> 

