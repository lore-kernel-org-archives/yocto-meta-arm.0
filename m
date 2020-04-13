Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.845.1586817615253917113
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Apr 2020 15:40:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9B0BA40C48;
	Mon, 13 Apr 2020 22:40:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W7-n1psO0JId; Mon, 13 Apr 2020 22:40:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 810CA40C47;
	Mon, 13 Apr 2020 22:40:13 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 33DDF1724AE; Mon, 13 Apr 2020 18:40:13 -0400 (EDT)
Date: Mon, 13 Apr 2020 18:40:13 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: Re: [meta-arm][PATCH] optee-os: Mark recipes dormant by default
Message-ID: <20200413224013.GB11927@denix.org>
References: <20200412054531.1804159-1-raj.khem@gmail.com>
 <20200413220519.GD30105@kudzu.us>
 <16058061C39D13E2.17445@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <16058061C39D13E2.17445@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 13, 2020 at 06:06:37PM -0400, Denys Dmytriyenko wrote:
> On Mon, Apr 13, 2020 at 06:05:19PM -0400, Jon Mason wrote:
> > On Sat, Apr 11, 2020 at 10:45:31PM -0700, Khem Raj wrote:
> > > all arm SOCs may not support optee and there are non-arm machines too
> > > this makes this recipe fit into mutli-BSP environments, platforms which
> > > support optee should be specifically called out via COMPATIBLE_MACHINE,
> > > for general case it remains 'null'
> > 
> > Pulled into the master branch.
> 
> I think this was due to the parsing issues, resolved by another patch. What's 
> the point of masking this recipes now?
> 
> 
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  
> > > diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/recipes-security/optee/optee.inc
> > > new file mode 100644
> > > index 0000000..a12521d
> > > --- /dev/null
> > > +++ b/meta-arm/recipes-security/optee/optee.inc
> > > @@ -0,0 +1,2 @@
> > > +COMPATIBLE_MACHINE = "null"
> > > +# Please add supported machines below

Can we instead of neutering all OPTEE recipes and requiring BSPs to provide 
bbappends with COMPATIBLE_MACHINE for opt-in, add EXCLUDE_FROM_WORLD = "1"?

-- 
Denys
