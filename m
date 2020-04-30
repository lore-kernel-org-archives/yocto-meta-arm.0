Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.359.1588279071423387544
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Apr 2020 13:37:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5B67540C0F
	for <meta-arm@lists.yoctoproject.org>; Thu, 30 Apr 2020 20:37:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wCeUP-KvD0KN for <meta-arm@lists.yoctoproject.org>;
	Thu, 30 Apr 2020 20:37:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4F98140A9E
	for <meta-arm@lists.yoctoproject.org>; Thu, 30 Apr 2020 20:37:50 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 271AB172BDF; Thu, 30 Apr 2020 16:37:50 -0400 (EDT)
Date: Thu, 30 Apr 2020 16:37:50 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 3/4] external-arm-toolchain: add INHIBIT_AUTOTOOLS_DEPS
Message-ID: <20200430203750.GV11927@denix.org>
References: <1588219828-34791-1-git-send-email-denis@denix.org>
 <1588219828-34791-3-git-send-email-denis@denix.org>
 <CAFA6WYOdMJzKaZVT9yws-zPZPHip3GQgX+VxPLnqqv3K0-7Z5w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFA6WYOdMJzKaZVT9yws-zPZPHip3GQgX+VxPLnqqv3K0-7Z5w@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 30, 2020 at 03:54:07PM +0530, Sumit Garg wrote:
> On Thu, 30 Apr 2020 at 09:40, Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > Add for completeness, similar to INHIBIT_DEFAULT_DEPS, to match OE-Core, as
> > there's no autotools usage here.
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  .../recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb    | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > index 33d6c35..adb2fdd 100644
> > --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > @@ -1,6 +1,7 @@
> >  require recipes-core/glibc/glibc-package.inc
> >
> >  INHIBIT_DEFAULT_DEPS = "1"
> > +INHIBIT_AUTOTOOLS_DEPS = "1"
> >
> 
> IIUC, autotools are not something that are included by default under
> DEPENDS. They are included if you specifically do "inherit autotools"
> directly or indirectly which doesn't seem to be the case with this
> recipe. So to me it seems like an unnecessary change.

Fair enough. This one was rather "nice to have" - I was down the rabbit hole 
for binutils-cross-${TARGET_ARCH} addressed in patch #2 and I noticed that 
binutils-cross.inc in OE-Core sets INHIBIT_AUTOTOOLS_DEPS w/o visible use of 
autotools. But I missed that binutils does use autotools for building and 
there is "inherit autotools" in binutils.inc. Yes, external-arm-toolchain 
doesn't inherit autotools, so no need for this variable - please skip this 
patch. Thanks.

-- 
Denys


> >  # License applies to this recipe code, not the toolchain itself
> >  LICENSE = "MIT"
> > --
> > 2.7.4
> >
> > 

> 

