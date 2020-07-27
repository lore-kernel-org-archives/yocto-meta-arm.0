Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.62651.1595875074591764438
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 27 Jul 2020 11:37:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8B2BC40BAD;
	Mon, 27 Jul 2020 18:37:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HohhId3SiF6z; Mon, 27 Jul 2020 18:37:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1989940BAB;
	Mon, 27 Jul 2020 18:37:51 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2E7BC171A9E; Mon, 27 Jul 2020 14:37:51 -0400 (EDT)
Date: Mon, 27 Jul 2020 14:37:51 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] optee-os: replace old pycrypto with pycryptodome - a drop-in replacement
Message-ID: <20200727183751.GT17660@denix.org>
References: <1589502694-24528-1-git-send-email-denis@denix.org>
 <6362.1589528670740992908@lists.yoctoproject.org>
 <20200519152013.GD22197@kudzu.us>
 <16247F3E9F1124DB.7156@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <16247F3E9F1124DB.7156@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 23, 2020 at 05:34:31PM -0400, Denys Dmytriyenko wrote:
> On Tue, May 19, 2020 at 11:20:14AM -0400, Jon Mason wrote:
> > On Fri, May 15, 2020 at 12:44:30AM -0700, Diego Sueiro wrote:
> > > On Fri, May 15, 2020 at 01:31 AM, Denys Dmytriyenko wrote:
> > > 
> > > >
> > > > From: Denys Dmytriyenko <denys@ti.com>
> > > > 
> > > > While pycryptodome is a drop-in replacement for the old pycrypto module,
> > > > pycryptodomex uses a separate namespace to not confict with pycrypto.
> > > > Unfortunately, optee-os uses both namespaces, hence both variants of
> > > > pycryptodome and pycryptodomex are needed.
> > > > 
> > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > 
> > > Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>
> > 
> > Pulled in to the master branch.
> 
> Can you please also backport this to dunfell - it is also needed to fully drop 
> dependency on meta-python in dunfell. Thanks!
> 
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/commit/?id=06b648821aa3fbbdf7c00724cf3c3cedbb4f0546

Ping.


> > > > ---
> > > >  meta-arm/recipes-security/optee/optee-os_git.bb | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/meta-arm/recipes-security/optee/optee-os_git.bb
> > > > b/meta-arm/recipes-security/optee/optee-os_git.bb
> > > > index dfff6d1..c9847b5 100644
> > > > --- a/meta-arm/recipes-security/optee/optee-os_git.bb
> > > > +++ b/meta-arm/recipes-security/optee/optee-os_git.bb
> > > > @@ -10,7 +10,7 @@ PV = "3.8.0+git${SRCPV}"
> > > >  inherit deploy python3native
> > > >  require optee.inc
> > > >
> > > > -DEPENDS = "python3-pycrypto-native python3-pyelftools-native
> > > > python3-pycryptodomex-native"
> > > > +DEPENDS = "python3-pycryptodome-native python3-pycryptodomex-native
> > > > python3-pyelftools-native"
> > > >
> > > >  SRCREV = "023e33656e2c9557ce50ad63a98b2e2c9b51c118"
> > > >  SRC_URI = " \
> > > > -- 
> > > > 2.7.4
> > > > 
> > > >
> > 
> > > 
> > 
> 
> > 
> 

> 

