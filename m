Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.568.1596212837069164286
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 31 Jul 2020 09:27:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 156B540BAB;
	Fri, 31 Jul 2020 16:27:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rO-XYLedqFnI; Fri, 31 Jul 2020 16:27:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BCD76409DE;
	Fri, 31 Jul 2020 16:27:14 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 32B9B173BE2; Fri, 31 Jul 2020 12:27:14 -0400 (EDT)
Date: Fri, 31 Jul 2020 12:27:14 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] optee-os: replace old pycrypto with pycryptodome - a drop-in replacement
Message-ID: <20200731162714.GA17660@denix.org>
References: <1589502694-24528-1-git-send-email-denis@denix.org>
 <6362.1589528670740992908@lists.yoctoproject.org>
 <20200519152013.GD22197@kudzu.us>
 <16247F3E9F1124DB.7156@lists.yoctoproject.org>
 <1625AFED0AD12072.11956@lists.yoctoproject.org>
 <20200729205454.GW17660@denix.org>
 <20200731140556.GA1853@kudzu.us>
MIME-Version: 1.0
In-Reply-To: <20200731140556.GA1853@kudzu.us>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 31, 2020 at 10:05:56AM -0400, Jon Mason wrote:
> On Wed, Jul 29, 2020 at 04:54:54PM -0400, Denys Dmytriyenko wrote:
> > On Mon, Jul 27, 2020 at 02:37:51PM -0400, Denys Dmytriyenko wrote:
> > > On Thu, Jul 23, 2020 at 05:34:31PM -0400, Denys Dmytriyenko wrote:
> > > > On Tue, May 19, 2020 at 11:20:14AM -0400, Jon Mason wrote:
> > > > > On Fri, May 15, 2020 at 12:44:30AM -0700, Diego Sueiro wrote:
> > > > > > On Fri, May 15, 2020 at 01:31 AM, Denys Dmytriyenko wrote:
> > > > > > 
> > > > > > >
> > > > > > > From: Denys Dmytriyenko <denys@ti.com>
> > > > > > > 
> > > > > > > While pycryptodome is a drop-in replacement for the old pycrypto module,
> > > > > > > pycryptodomex uses a separate namespace to not confict with pycrypto.
> > > > > > > Unfortunately, optee-os uses both namespaces, hence both variants of
> > > > > > > pycryptodome and pycryptodomex are needed.
> > > > > > > 
> > > > > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > > > 
> > > > > > Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>
> > > > > 
> > > > > Pulled in to the master branch.
> > > > 
> > > > Can you please also backport this to dunfell - it is also needed to fully drop 
> > > > dependency on meta-python in dunfell. Thanks!
> > > > 
> > > > http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/commit/?id=06b648821aa3fbbdf7c00724cf3c3cedbb4f0546
> > > 
> > > Ping.
> > 
> > Just wanted to check if there are any concerns with this backport. Thanks.
> > 
> > Denys
> 
> Terribly sorry in the delay.  This caused a discussion internally and
> got lost in the shuffle.  I'll sanity check agin shortly, but there
> was no issues on dunfell with the patch.  However in testing it, we
> found that there are still python dependencies in master.  So, I think
> we can apply to dunfell, but need to revert in master.  I'm currently
> looking for alternatives to the revert in master.

Where does the dependency on meta-python in master come from? Is it still from 
optee? Or is there something else?

Denys


> Thanks,
> Jon
> 
> > 
> > 
> > > > > > > ---
> > > > > > >  meta-arm/recipes-security/optee/optee-os_git.bb | 2 +-
> > > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > > 
> > > > > > > diff --git a/meta-arm/recipes-security/optee/optee-os_git.bb
> > > > > > > b/meta-arm/recipes-security/optee/optee-os_git.bb
> > > > > > > index dfff6d1..c9847b5 100644
> > > > > > > --- a/meta-arm/recipes-security/optee/optee-os_git.bb
> > > > > > > +++ b/meta-arm/recipes-security/optee/optee-os_git.bb
> > > > > > > @@ -10,7 +10,7 @@ PV = "3.8.0+git${SRCPV}"
> > > > > > >  inherit deploy python3native
> > > > > > >  require optee.inc
> > > > > > >
> > > > > > > -DEPENDS = "python3-pycrypto-native python3-pyelftools-native
> > > > > > > python3-pycryptodomex-native"
> > > > > > > +DEPENDS = "python3-pycryptodome-native python3-pycryptodomex-native
> > > > > > > python3-pyelftools-native"
> > > > > > >
> > > > > > >  SRCREV = "023e33656e2c9557ce50ad63a98b2e2c9b51c118"
> > > > > > >  SRC_URI = " \
> > > > > > > -- 
> > > > > > > 2.7.4
> > > > > > > 
> > > > > > >
> > > > > 
> > > > > > 
> > > > > 
> > > > 
> > > > > 
> > > > 
> > > 
> > > > 
> > > 
> > 
> > > 
> > 
> 
> > 
> 
