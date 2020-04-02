Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.820.1585844876338998934
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 Apr 2020 09:27:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9FEB340BCC;
	Thu,  2 Apr 2020 16:27:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5XSCznN-1uNj; Thu,  2 Apr 2020 16:27:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6DFBE400E8;
	Thu,  2 Apr 2020 16:27:50 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6F3FD1718FE; Thu,  2 Apr 2020 12:27:49 -0400 (EDT)
Date: Thu, 2 Apr 2020 12:27:49 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>, nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 5/5] optee-examples: cleanup
Message-ID: <20200402162749.GS1578@denix.org>
References: <1585782786-34477-1-git-send-email-denis@denix.org>
 <1585782786-34477-5-git-send-email-denis@denix.org>
 <AM0PR08MB3987297CAB3B18639C55F34892C60@AM0PR08MB3987.eurprd08.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <AM0PR08MB3987297CAB3B18639C55F34892C60@AM0PR08MB3987.eurprd08.prod.outlook.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 02, 2020 at 07:21:47AM +0000, Diego Sueiro wrote:
> > -----Original Message-----
> > From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> > On Behalf Of Denys Dmytriyenko via lists.yoctoproject.org
> > Sent: 02 April 2020 00:13
> > To: meta-arm@lists.yoctoproject.org
> > Cc: Denys Dmytriyenko <denys@ti.com>
> > Subject: [meta-arm] [PATCH 5/5] optee-examples: cleanup
> > 
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > * Rename with _git suffix to match other optee recipes
> > * Set PV
> > * Add DESCRIPTION
> > * Depend on Python3 version of PyCryptodomex instead of Python2 version
> > of PyCrypto
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> 
> Can we take this opportunity to upgrade this recipe to 3.8.0 as well?

See the PV addition below - it is already at 3.8.0


> > ---
> >  .../optee/{optee-examples.bb => optee-examples_git.bb}               | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)  rename meta-arm/recipes-
> > security/optee/{optee-examples.bb => optee-examples_git.bb} (87%)
> > 
> > diff --git a/meta-arm/recipes-security/optee/optee-examples.bb b/meta-
> > arm/recipes-security/optee/optee-examples_git.bb
> > similarity index 87%
> > rename from meta-arm/recipes-security/optee/optee-examples.bb
> > rename to meta-arm/recipes-security/optee/optee-examples_git.bb
> > index aaec4c4..768a55b 100644
> > --- a/meta-arm/recipes-security/optee/optee-examples.bb
> > +++ b/meta-arm/recipes-security/optee/optee-examples_git.bb
> > @@ -1,10 +1,13 @@
> >  SUMMARY = "OP-TEE examples"
> > +DESCRIPTION = "Open Portable Trusted Execution Environment - Sample
> > Applications"
> >  HOMEPAGE = "https://github.com/linaro-swg/optee_examples"
> > 
> >  LICENSE = "GPLv2"
> >  LIC_FILES_CHKSUM =
> > "file://${S}/LICENSE;md5=cd95ab417e23b94f381dafc453d70c30"
> > 
> > -DEPENDS = "optee-client optee-os python-pycrypto-native"
> > +PV = "3.8.0+git${SRCPV}"
> > +
> > +DEPENDS = "optee-client optee-os python3-pycryptodomex-native"
> > 
> >  inherit python3native
> > 
> > --
> > 2.7.4
> 

> 

