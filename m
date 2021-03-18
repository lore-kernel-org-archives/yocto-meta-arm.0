Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.5563.1616050985776784958
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Mar 2021 00:03:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 51BD440BE9;
	Thu, 18 Mar 2021 07:03:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nk2aciFOAW4H; Thu, 18 Mar 2021 07:03:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3516540BA7;
	Thu, 18 Mar 2021 07:03:03 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 91B70174553; Thu, 18 Mar 2021 03:03:02 -0400 (EDT)
Date: Thu, 18 Mar 2021 03:03:02 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] python3-intelhex recipe duplication
Message-ID: <20210318070302.GU18041@denix.org>
References: <CAMKF1soMNKrKD6Pi94wu6KHUE83rY-zDdurWRtJjbOb=pXDmaA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soMNKrKD6Pi94wu6KHUE83rY-zDdurWRtJjbOb=pXDmaA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 17, 2021 at 10:28:04PM -0700, Khem Raj wrote:
> Hi
> 
> I see this
> 
> http://layers.openembedded.org/layerindex/branch/master/recipes/?q=python3-intelhex
> 
> so we have python3-intelhex copies in meta-arm and meta-python, We should
> 
> 1. Upstream is to core and delete all existing copies
> 2. Remove meta-arm copy and let meta-arm depend on meta-python
> 
> What would you prefer?

From the commit log:

https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/commit/?id=a8cb17f9821f32f47890795f4b19a5ace3fc18f4

| Until this is integrated into meta-python (patches sent), hold a copy of
| python3-intelhex in meta-arm for trusted-firmware-m 1.2.

So, it was meant to be temporarily.

On the other hand, as one of the consumers of meta-arm, I'd hate other 
BSP layers that depend on meta-arm to also require meta-oe/meta-python 
dependency. I know we've discussed separating meta-python into own layer 
for years, but it's still part of huge meta-openembedded collection. So, 
my vote would be for #1 above.

-- 
Denys
