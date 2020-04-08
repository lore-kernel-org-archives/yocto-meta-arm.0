Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.5471.1586317955469494410
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Apr 2020 20:52:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C4AEF40C1D;
	Wed,  8 Apr 2020 03:52:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ffMaVGpeprX; Wed,  8 Apr 2020 03:52:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A818A40A6E;
	Wed,  8 Apr 2020 03:52:33 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 697FA1718E9; Tue,  7 Apr 2020 23:52:33 -0400 (EDT)
Date: Tue, 7 Apr 2020 23:52:33 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-arm] [PATCH] layer.conf: update LAYERSERIES_COMPAT for dunfell
Message-ID: <20200408035233.GA1578@denix.org>
References: <1585684637-53492-1-git-send-email-denis@denix.org>
 <20200408034234.GD29748@kudzu.us>
MIME-Version: 1.0
In-Reply-To: <20200408034234.GD29748@kudzu.us>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 07, 2020 at 11:42:35PM -0400, Jon Mason wrote:
> On Tue, Mar 31, 2020 at 03:57:17PM -0400, Denys Dmytriyenko wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  meta-arm-bsp/conf/layer.conf       | 2 +-
> >  meta-arm-toolchain/conf/layer.conf | 3 +--
> >  meta-arm/conf/layer.conf           | 2 +-
> >  3 files changed, 3 insertions(+), 4 deletions(-)
> > 
> > diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
> > index 0632ba3..8afcbe5 100644
> > --- a/meta-arm-bsp/conf/layer.conf
> > +++ b/meta-arm-bsp/conf/layer.conf
> > @@ -10,7 +10,7 @@ BBFILE_PATTERN_meta-arm-bsp = "^${LAYERDIR}/"
> >  BBFILE_PRIORITY_meta-arm-bsp = "6"
> >  
> >  LAYERDEPENDS_meta-arm-bsp = "core openembedded-layer meta-arm"
> > -LAYERSERIES_COMPAT_meta-arm-bsp = "warrior zeus"
> > +LAYERSERIES_COMPAT_meta-arm-bsp = "warrior zeus dunfell"
> 
> I was actually waiting for dunfell to be released, then I was going to
> remove warrior and zeus when adding dunfell.  The logic behind this is
> to limit the scope of our support and testing.  To my knowledge, no one
> is using meta-arm in production for warrior or zeus, so I don't think
> it's an issue.

Jon,

You can remove warrior and zeus later, but OE-Core master has been only 
compatible with dunfell for couple weeks now and meta-arm in unusable w/o 
a similar change.

-- 
Denys


> Thanks,
> Jon
> 
> >  
> >  # We have patches for xen but meta-virtualization might not be there so filter
> >  # out recipes-extended/xen unless xen is activated in the features
> > diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
> > index a247dc1..3a4c4f0 100644
> > --- a/meta-arm-toolchain/conf/layer.conf
> > +++ b/meta-arm-toolchain/conf/layer.conf
> > @@ -8,8 +8,7 @@ BBFILE_COLLECTIONS += "arm-toolchain"
> >  BBFILE_PATTERN_arm-toolchain := "^${LAYERDIR}/"
> >  BBFILE_PRIORITY_arm-toolchain = "30"
> >  
> > -LAYERSERIES_COMPAT_arm-toolchain = "zeus"
> > +LAYERSERIES_COMPAT_arm-toolchain = "zeus dunfell"
> >  
> >  # do not error out on bbappends for missing recipes
> >  BB_DANGLINGAPPENDS_WARNONLY = "true"
> > -
> > diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
> > index 65ccd15..0b93e8d 100644
> > --- a/meta-arm/conf/layer.conf
> > +++ b/meta-arm/conf/layer.conf
> > @@ -10,4 +10,4 @@ BBFILE_PATTERN_meta-arm = "^${LAYERDIR}/"
> >  BBFILE_PRIORITY_meta-arm = "6"
> >  
> >  LAYERDEPENDS_meta-arm = "core"
> > -LAYERSERIES_COMPAT_meta-arm = "warrior zeus"
> > +LAYERSERIES_COMPAT_meta-arm = "warrior zeus dunfell"
> > -- 
> > 2.7.4
> > 
> 
> > 
> 

> 

