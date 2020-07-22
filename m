Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.22481.1595434063456622942
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 Jul 2020 09:07:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 33EB040C1F;
	Wed, 22 Jul 2020 16:07:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R0W1SE0cayYZ; Wed, 22 Jul 2020 16:07:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0746D40BBB;
	Wed, 22 Jul 2020 16:07:40 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 62510171A9E; Wed, 22 Jul 2020 12:07:40 -0400 (EDT)
Date: Wed, 22 Jul 2020 12:07:40 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] layer.conf: remove dependency on meta-python
Message-ID: <20200722160740.GP17660@denix.org>
References: <1591228165-20078-1-git-send-email-denis@denix.org>
 <20200608155142.GF15959@kudzu.us>
 <16238755CA6601E8.5706@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <16238755CA6601E8.5706@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 20, 2020 at 01:51:32PM -0400, Denys Dmytriyenko wrote:
> On Mon, Jun 08, 2020 at 11:51:43AM -0400, Jon Mason wrote:
> > On Wed, Jun 03, 2020 at 07:49:25PM -0400, Denys Dmytriyenko wrote:
> > > From: Denys Dmytriyenko <denys@ti.com>
> > > 
> > > Corresponding Python modules pycryptodome(x) and pyelftools, needed by optee,
> > > were moved from meta-python to oe-core.
> > > 
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > 
> > Pulled into master
> 
> Can this be backported to dunfell as well, since the required Python module 
> move has been finished in oe-core and meta-openembedded few weeks ago and 
> there's been plenty of time for everyone to catch up with the change?

Are there any objections to this change? Please let me know. Thanks.


> -- 
> Denys
> 
> 
> > Thanks,
> > Jon
> > 
> > > ---
> > >  meta-arm/conf/layer.conf | 1 -
> > >  1 file changed, 1 deletion(-)
> > > 
> > > diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
> > > index d96e9f1..3341972 100644
> > > --- a/meta-arm/conf/layer.conf
> > > +++ b/meta-arm/conf/layer.conf
> > > @@ -11,6 +11,5 @@ BBFILE_PRIORITY_meta-arm = "6"
> > >  
> > >  LAYERDEPENDS_meta-arm = " \
> > >      core \
> > > -    meta-python \
> > >  "
> > >  LAYERSERIES_COMPAT_meta-arm = "warrior zeus dunfell"
> > > -- 
> > > 2.7.4
> > > 
> > 
> > > 
> > 

> 

