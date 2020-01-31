Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.4969.1580515027734170670
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 31 Jan 2020 15:57:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DA66440BDA;
	Fri, 31 Jan 2020 23:57:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CIi2FDloAEwF; Fri, 31 Jan 2020 23:57:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C22C7409E1;
	Fri, 31 Jan 2020 23:56:58 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 00C9F1743D1; Fri, 31 Jan 2020 18:56:57 -0500 (EST)
Date: Fri, 31 Jan 2020 18:56:57 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Peter Griffin <peter.griffin@linaro.org>, jon.mason@arm.com,
	Khem Raj <raj.khem@gmail.com>,
	Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	joakim.bech@linaro.org,
	moorthy.baskaravenkatraman-sambamoorthy@linaro.org,
	alexandre.jutras@linaro.org
Subject: Re: [meta-arm] [PATCH 0/5] Add OP-TEE recipes to meta-arm layer
Message-ID: <20200131235657.GR4735@denix.org>
References: <1580319525-32054-1-git-send-email-peter.griffin@linaro.org>
 <20200130054742.GQ4735@denix.org>
 <CAPoiz9y72c=8WATQEe0kzzdCV+6SFGtSQvM6n-XpU+YLjKqMvw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPoiz9y72c=8WATQEe0kzzdCV+6SFGtSQvM6n-XpU+YLjKqMvw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 31, 2020 at 07:54:08AM +0100, Jon Mason wrote:
> On Thu, Jan 30, 2020 at 6:47 AM Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > Thanks! And for the entire series:
> >
> > Tested-by: Denys Dmytriyenko <denys@ti.com>
> >
> > The only nitpick is that 0001-use-python3-instead-of-python.patch gets
> > created in patch #4, but is added to the recipe in patch #5 - should have
> > been all in one patch.
> 
> I was thinking the same thing.  I can easily squash all of this into
> one patch via git when I merge, if so desired.

I'm fine with squashing few patches, if you want to. Do you want to squash 4 
and 5 only, or all 5 of them into 1?

Denys


> Thanks,
> Jon
> 
> >
> > --
> > Denys
> >
> >
> > On Wed, Jan 29, 2020 at 05:38:40PM +0000, Peter Griffin wrote:
> > > Hi Jon,
> > >
> > > This patch series adds the OP-TEE recipes from meta-linaro
> > > layer to the meta-arm layer which is the new home for generic
> > > Arm architecture components.
> > >
> > > Once these are merged, I will remove them and add a README
> > > in meta-linaro.
> > >
> > > Thanks,
> > >
> > > Peter.
> > >
> > > Peter Griffin (5):
> > >   optee-client.bb: add optee client recipe and patches
> > >   optee-os_git.bb: add optee-os recipe and patches
> > >   optee-examples.bb: add recipe for optee examples
> > >   optee-test_git.bb: add optee-test recipe & patches
> > >   optee-test_git.bb: add python3 backport patch
> > >
> > >  meta-arm/recipes-security/optee/optee-client.bb    | 35 +++++++++++
> > >  .../optee/optee-client/tee-supplicant.service      | 10 ++++
> > >  meta-arm/recipes-security/optee/optee-examples.bb  | 42 +++++++++++++
> > >  ...1-allow-setting-sysroot-for-libgcc-lookup.patch | 13 ++++
> > >  meta-arm/recipes-security/optee/optee-os_git.bb    | 69 ++++++++++++++++++++++
> > >  .../0001-use-python3-instead-of-python.patch       | 48 +++++++++++++++
> > >  meta-arm/recipes-security/optee/optee-test_git.bb  | 50 ++++++++++++++++
> > >  7 files changed, 267 insertions(+)
> > >  create mode 100644 meta-arm/recipes-security/optee/optee-client.bb
> > >  create mode 100644 meta-arm/recipes-security/optee/optee-client/tee-supplicant.service
> > >  create mode 100644 meta-arm/recipes-security/optee/optee-examples.bb
> > >  create mode 100644 meta-arm/recipes-security/optee/optee-os/0001-allow-setting-sysroot-for-libgcc-lookup.patch
> > >  create mode 100644 meta-arm/recipes-security/optee/optee-os_git.bb
> > >  create mode 100644 meta-arm/recipes-security/optee/optee-test/0001-use-python3-instead-of-python.patch
> > >  create mode 100644 meta-arm/recipes-security/optee/optee-test_git.bb
> > >
> > > --
> > > 2.7.4
> > >
> > 

> 

