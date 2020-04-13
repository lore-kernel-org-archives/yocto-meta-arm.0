Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.279.1586815600225521724
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Apr 2020 15:06:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 08BB340BAC;
	Mon, 13 Apr 2020 22:06:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wL5efgSQciGH; Mon, 13 Apr 2020 22:06:38 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D9B7D409AA;
	Mon, 13 Apr 2020 22:06:37 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 495191724AE; Mon, 13 Apr 2020 18:06:37 -0400 (EDT)
Date: Mon, 13 Apr 2020 18:06:37 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: Re: [meta-arm][PATCH] optee-os: Mark recipes dormant by default
Message-ID: <20200413220637.GA11927@denix.org>
References: <20200412054531.1804159-1-raj.khem@gmail.com>
 <20200413220519.GD30105@kudzu.us>
MIME-Version: 1.0
In-Reply-To: <20200413220519.GD30105@kudzu.us>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 13, 2020 at 06:05:19PM -0400, Jon Mason wrote:
> On Sat, Apr 11, 2020 at 10:45:31PM -0700, Khem Raj wrote:
> > all arm SOCs may not support optee and there are non-arm machines too
> > this makes this recipe fit into mutli-BSP environments, platforms which
> > support optee should be specifically called out via COMPATIBLE_MACHINE,
> > for general case it remains 'null'
> 
> Pulled into the master branch.

I think this was due to the parsing issues, resolved by another patch. What's 
the point of masking this recipes now?


> Thanks,
> Jon
> 
> > 
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta-arm/recipes-security/optee/optee-client_git.bb   | 2 ++
> >  meta-arm/recipes-security/optee/optee-examples_git.bb | 2 ++
> >  meta-arm/recipes-security/optee/optee-os_git.bb       | 1 +
> >  meta-arm/recipes-security/optee/optee-test_git.bb     | 1 +
> >  meta-arm/recipes-security/optee/optee.inc             | 2 ++
> >  5 files changed, 8 insertions(+)
> >  create mode 100644 meta-arm/recipes-security/optee/optee.inc
> > 
> > diff --git a/meta-arm/recipes-security/optee/optee-client_git.bb b/meta-arm/recipes-security/optee/optee-client_git.bb
> > index a25d343..bae7b20 100644
> > --- a/meta-arm/recipes-security/optee/optee-client_git.bb
> > +++ b/meta-arm/recipes-security/optee/optee-client_git.bb
> > @@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=69663ab153298557a59c67a60a743e5b"
> >  
> >  PV = "3.8.0+git${SRCPV}"
> >  
> > +require optee.inc
> > +
> >  inherit python3native systemd
> >  
> >  SRCREV = "be4fa2e36f717f03ca46e574aa66f697a897d090"
> > diff --git a/meta-arm/recipes-security/optee/optee-examples_git.bb b/meta-arm/recipes-security/optee/optee-examples_git.bb
> > index 768a55b..996e2cd 100644
> > --- a/meta-arm/recipes-security/optee/optee-examples_git.bb
> > +++ b/meta-arm/recipes-security/optee/optee-examples_git.bb
> > @@ -11,6 +11,8 @@ DEPENDS = "optee-client optee-os python3-pycryptodomex-native"
> >  
> >  inherit python3native
> >  
> > +require optee.inc
> > +
> >  SRC_URI = "git://github.com/linaro-swg/optee_examples.git"
> >  SRCREV = "559b2141c16bf0f57ccd72f60e4deb84fc2a05b0"
> >  
> > diff --git a/meta-arm/recipes-security/optee/optee-os_git.bb b/meta-arm/recipes-security/optee/optee-os_git.bb
> > index 47ced12..5c420b7 100644
> > --- a/meta-arm/recipes-security/optee/optee-os_git.bb
> > +++ b/meta-arm/recipes-security/optee/optee-os_git.bb
> > @@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=c1f21c4f72f372ef38a5a4aee55ec173"
> >  PV = "3.8.0+git${SRCPV}"
> >  
> >  inherit deploy python3native
> > +require optee.inc
> >  
> >  DEPENDS = "python3-pycrypto-native python3-pyelftools-native python3-pycryptodomex-native"
> >  
> > diff --git a/meta-arm/recipes-security/optee/optee-test_git.bb b/meta-arm/recipes-security/optee/optee-test_git.bb
> > index 752d75d..ee73a2c 100644
> > --- a/meta-arm/recipes-security/optee/optee-test_git.bb
> > +++ b/meta-arm/recipes-security/optee/optee-test_git.bb
> > @@ -6,6 +6,7 @@ LICENSE = "BSD & GPLv2"
> >  LIC_FILES_CHKSUM = "file://${S}/LICENSE.md;md5=daa2bcccc666345ab8940aab1315a4fa"
> >  
> >  inherit python3native
> > +require optee.inc
> >  
> >  DEPENDS = "optee-client optee-os python3-pycryptodomex-native"
> >  
> > diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/recipes-security/optee/optee.inc
> > new file mode 100644
> > index 0000000..a12521d
> > --- /dev/null
> > +++ b/meta-arm/recipes-security/optee/optee.inc
> > @@ -0,0 +1,2 @@
> > +COMPATIBLE_MACHINE = "null"
> > +# Please add supported machines below
> > -- 
> > 2.26.0
> > 
> 
> > 
> 

> 

