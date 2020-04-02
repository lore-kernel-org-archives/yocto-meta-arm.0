Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.866.1585844971637002859
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 Apr 2020 09:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 167DA400E8;
	Thu,  2 Apr 2020 16:29:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LmOGgGEwURmP; Thu,  2 Apr 2020 16:29:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E1C6840027;
	Thu,  2 Apr 2020 16:29:29 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id AB6341718FE; Thu,  2 Apr 2020 12:29:29 -0400 (EDT)
Date: Thu, 2 Apr 2020 12:29:29 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-arm] [PATCH 5/5] optee-examples: cleanup
Message-ID: <20200402162929.GT1578@denix.org>
References: <1585782786-34477-1-git-send-email-denis@denix.org>
 <1585782786-34477-5-git-send-email-denis@denix.org>
 <CADrjBPqCtonpTnaAXiKh_2SGsm2nrAjKDxGoN7Rit0L972XrzQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADrjBPqCtonpTnaAXiKh_2SGsm2nrAjKDxGoN7Rit0L972XrzQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 02, 2020 at 10:57:51AM +0100, Peter Griffin wrote:
> Hi Denys,
> 
> On Thu, 2 Apr 2020 at 00:13, Denys Dmytriyenko <denis@denix.org> wrote:
> 
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > * Rename with _git suffix to match other optee recipes
> > * Set PV
> > * Add DESCRIPTION
> > * Depend on Python3 version of PyCryptodomex instead of Python2 version of
> > PyCrypto
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  .../optee/{optee-examples.bb => optee-examples_git.bb}               | 5
> > ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >  rename meta-arm/recipes-security/optee/{optee-examples.bb =>
> > optee-examples_git.bb} (87%)
> >
> > diff --git a/meta-arm/recipes-security/optee/optee-examples.bb
> > b/meta-arm/recipes-security/optee/optee-examples_git.bb
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
> >
> 
> You have set PV to indicate 3.8.0 but not updated the SRCREV?

Same SRCREV - the code hasn't been updated between 3.7.0 and 3.8.0


> Apart from that:
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> 
> regards,
> 
> Peter.

> 

