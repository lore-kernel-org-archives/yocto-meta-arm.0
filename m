Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2834.1586825327169957248
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Apr 2020 17:48:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7AFF840C6A;
	Tue, 14 Apr 2020 00:48:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DdVO_lG4ZCHp; Tue, 14 Apr 2020 00:48:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6058740C5A;
	Tue, 14 Apr 2020 00:48:45 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id AE77C172565; Mon, 13 Apr 2020 20:48:44 -0400 (EDT)
Date: Mon, 13 Apr 2020 20:48:44 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm][PATCH] optee-os: Mark recipes dormant by default
Message-ID: <20200414004844.GC11927@denix.org>
References: <20200412054531.1804159-1-raj.khem@gmail.com>
 <20200413220519.GD30105@kudzu.us>
 <16058061C39D13E2.17445@lists.yoctoproject.org>
 <20200413224013.GB11927@denix.org>
 <CAMKF1soD3EJLe4tLfH-t8ovh0rMc5T4hAy+862aeGr_cRU1uww@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soD3EJLe4tLfH-t8ovh0rMc5T4hAy+862aeGr_cRU1uww@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 13, 2020 at 04:55:25PM -0700, Khem Raj wrote:
> On Mon, Apr 13, 2020 at 3:40 PM Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > On Mon, Apr 13, 2020 at 06:06:37PM -0400, Denys Dmytriyenko wrote:
> > > On Mon, Apr 13, 2020 at 06:05:19PM -0400, Jon Mason wrote:
> > > > On Sat, Apr 11, 2020 at 10:45:31PM -0700, Khem Raj wrote:
> > > > > all arm SOCs may not support optee and there are non-arm machines too
> > > > > this makes this recipe fit into mutli-BSP environments, platforms which
> > > > > support optee should be specifically called out via COMPATIBLE_MACHINE,
> > > > > for general case it remains 'null'
> > > >
> > > > Pulled into the master branch.
> > >
> > > I think this was due to the parsing issues, resolved by another patch. What's
> > > the point of masking this recipes now?
> > >
> > >
> > > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > > ---
> > > > >
> > > > > diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/recipes-security/optee/optee.inc
> > > > > new file mode 100644
> > > > > index 0000000..a12521d
> > > > > --- /dev/null
> > > > > +++ b/meta-arm/recipes-security/optee/optee.inc
> > > > > @@ -0,0 +1,2 @@
> > > > > +COMPATIBLE_MACHINE = "null"
> > > > > +# Please add supported machines below
> >
> > Can we instead of neutering all OPTEE recipes and requiring BSPs to provide
> > bbappends with COMPATIBLE_MACHINE for opt-in, add EXCLUDE_FROM_WORLD = "1"?
> 
> its fine to provide it via bbappends, as long as it is per machine,
> which really supports Optee
> it is also educational to understand the recipes thats way, excluding
> from world is then not required.

This is rather backwards. OPTEE is widely used these days.

What's the harm for the recipe to be fully open and compatible, if it's not 
being built by default?

Otherwise, we should similarly neuter ATF, U-boot and even kernel - not 
all platforms are supported by those and require per-machine support and 
configarion added. Why not require those to be opt-in via bbappends?

-- 
Denys
