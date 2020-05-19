Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.731.1589905619412978084
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 May 2020 09:27:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 89D5640C06;
	Tue, 19 May 2020 16:26:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kcJAQQ_RGVM9; Tue, 19 May 2020 16:26:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4BBC2403F2;
	Tue, 19 May 2020 16:26:54 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B0D1017316F; Tue, 19 May 2020 12:26:53 -0400 (EDT)
Date: Tue, 19 May 2020 12:26:53 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Jon Mason <jdmason@kudzu.us>
Cc: Diego Sueiro <diego.sueiro@arm.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	Denys Dmytriyenko <denys@ti.com>, nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] trusted-firmware-a: re-enable generation of packages
Message-ID: <20200519162653.GR11927@denix.org>
References: <1589870085-51773-1-git-send-email-denis@denix.org>
 <AM0PR08MB39871EB465BCFEF6BC70B17592B90@AM0PR08MB3987.eurprd08.prod.outlook.com>
 <20200519151754.GA22197@kudzu.us>
MIME-Version: 1.0
In-Reply-To: <20200519151754.GA22197@kudzu.us>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 19, 2020 at 11:17:55AM -0400, Jon Mason wrote:
> On Tue, May 19, 2020 at 09:12:41AM +0000, Diego Sueiro wrote:
> > > -----Original Message-----
> > > From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> > > On Behalf Of Denys Dmytriyenko via lists.yoctoproject.org
> > > Sent: 19 May 2020 07:35
> > > To: meta-arm@lists.yoctoproject.org
> > > Cc: Denys Dmytriyenko <denys@ti.com>
> > > Subject: [meta-arm] [PATCH] trusted-firmware-a: re-enable generation of
> > > packages
> > > 
> > > From: Denys Dmytriyenko <denys@ti.com>
> > > 
> > > There is no need to inherit nopackages. Even when the output binaries are
> > > being consumed from deploy or sysroot, and the main binary package is not
> > > meant to be installed in the rootfs, package generation is still useful for SDK
> > > use cases and as a way to distribute sources (e.g. src.rpm/SRPM) in Distros.
> > > 
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > 
> > Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>
> 
> Pulled into the master branch.

Can this be backported to dunfell, please?
Unfortunately, I missed this earlier, but it's required for out whole product, 
which is beyond just rootfs and there is no easy way to un-inherit nopackages 
from bbappend... Thanks.


> Thanks,
> Jon
> 
> > 
> > > ---
> > >  meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > > b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > > index c9c5710..fe9a4e0 100644
> > > --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > > +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > > @@ -5,7 +5,7 @@ PROVIDES = "virtual/trusted-firmware-a"
> > > 
> > >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > > 
> > > -inherit deploy nopackages
> > > +inherit deploy
> > > 
> > >  COMPATIBLE_MACHINE ?= "invalid"
> > > 
> > > @@ -158,7 +158,10 @@ do_install() {
> > >      done
> > >  }
> > > 
> > > +FILES_${PN} = "/firmware"
> > >  SYSROOT_DIRS += "/firmware"
> > > +# Skip QA check for relocations in .text of elf binaries
> > > +INSANE_SKIP_${PN} = "textrel"
> > > 
> > >  do_deploy() {
> > >      cp -rf ${D}/firmware/* ${DEPLOYDIR}/
> > > --
> > > 2.7.4
> > 
> 
> > 
> 

> 

