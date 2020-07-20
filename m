Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.880.1595267494786379889
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Jul 2020 10:51:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0467540C35;
	Mon, 20 Jul 2020 17:51:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HEsVvjAY2W_9; Mon, 20 Jul 2020 17:51:33 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DDAA040B96;
	Mon, 20 Jul 2020 17:51:32 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 43C7D171A9E; Mon, 20 Jul 2020 13:51:32 -0400 (EDT)
Date: Mon, 20 Jul 2020 13:51:32 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] layer.conf: remove dependency on meta-python
Message-ID: <20200720175132.GM17660@denix.org>
References: <1591228165-20078-1-git-send-email-denis@denix.org>
 <20200608155142.GF15959@kudzu.us>
MIME-Version: 1.0
In-Reply-To: <20200608155142.GF15959@kudzu.us>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 08, 2020 at 11:51:43AM -0400, Jon Mason wrote:
> On Wed, Jun 03, 2020 at 07:49:25PM -0400, Denys Dmytriyenko wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > Corresponding Python modules pycryptodome(x) and pyelftools, needed by optee,
> > were moved from meta-python to oe-core.
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> 
> Pulled into master

Can this be backported to dunfell as well, since the required Python module 
move has been finished in oe-core and meta-openembedded few weeks ago and 
there's been plenty of time for everyone to catch up with the change?

-- 
Denys


> Thanks,
> Jon
> 
> > ---
> >  meta-arm/conf/layer.conf | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
> > index d96e9f1..3341972 100644
> > --- a/meta-arm/conf/layer.conf
> > +++ b/meta-arm/conf/layer.conf
> > @@ -11,6 +11,5 @@ BBFILE_PRIORITY_meta-arm = "6"
> >  
> >  LAYERDEPENDS_meta-arm = " \
> >      core \
> > -    meta-python \
> >  "
> >  LAYERSERIES_COMPAT_meta-arm = "warrior zeus dunfell"
> > -- 
> > 2.7.4
> > 
> 
> > 
> 
