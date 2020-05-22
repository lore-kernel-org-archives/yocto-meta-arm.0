Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.733.1590189470118086494
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 22 May 2020 16:17:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6EB5740C15;
	Fri, 22 May 2020 23:17:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AFTEaLEMfwUZ; Fri, 22 May 2020 23:17:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2829640A13;
	Fri, 22 May 2020 23:17:48 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E4640173205; Fri, 22 May 2020 19:17:47 -0400 (EDT)
Date: Fri, 22 May 2020 19:17:47 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-toolchain: gcc-aarch64-none-elf: Add recipe
Message-ID: <20200522231747.GD17660@denix.org>
References: <1589964438-6924-1-git-send-email-denis@denix.org>
 <22524.1590037979741392604@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <22524.1590037979741392604@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 20, 2020 at 10:12:59PM -0700, Diego Sueiro wrote:
> On Wed, May 20, 2020 at 09:47 AM, Denys Dmytriyenko wrote:
> > b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
> > @@ -0,0 +1,38 @@
> > +# Copyright (C) 2020 Texas Instruments Inc.
> > +# Released under the MIT license (see COPYING.MIT for the terms)
> > +
> > +SUMMARY = "Baremetal GCC for Aarch64 processors"
> > +LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"

<snip>

> I see lots of commonalities (code duplication) with the 
> gcc-arm-none-eabi_9-2019-q4-major.bb recipe. Isn't now a good opportunity to 
> have a `.inc` to avoid this?

Yes, there's lots of duplication in those 2 recipes. Unfortunately, there's 
copyright in the original one and I cannot touch it w/o a lawyer. That's why 
I don't like copyrights in recipes (nothing much to copyright there anyway)


> The path inside the do_install can be easily controlled by a variable set 
> from the recipes that are including it.

Well, those are technical details I can handle quite easily - I've been doing 
OE for 13+ years. But it is legal issues where I draw the line...

-- 
Denys
