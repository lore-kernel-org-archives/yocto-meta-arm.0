Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.16929.1603306747020335473
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Oct 2020 11:59:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 63DEE40BD6;
	Wed, 21 Oct 2020 18:59:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N46SEsmIC6mM; Wed, 21 Oct 2020 18:59:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F19C840B2D;
	Wed, 21 Oct 2020 18:58:59 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4F2F31744A8; Wed, 21 Oct 2020 14:58:59 -0400 (EDT)
Date: Wed, 21 Oct 2020 14:58:59 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Ross Burton <ross@burtonini.com>
Cc: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	meta-arm@lists.yoctoproject.org, Lakshmi.Kailasanathan@arm.com,
	Ross Burton <Ross.Burton@arm.com>, nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-bsp/corstone700-test-app: adding test recipe for systems comms
Message-ID: <20201021185859.GG19155@denix.org>
References: <20201021171033.21198-1-abdellatif.elkhlifi@arm.com>
 <20201021172340.GF19155@denix.org>
 <CAAnfSTviL7v4i=YVO78ANwTH6859iKivy-Br+AQQXogtG_km9g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAnfSTviL7v4i=YVO78ANwTH6859iKivy-Br+AQQXogtG_km9g@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 21, 2020 at 07:39:16PM +0100, Ross Burton wrote:
> On Wed, 21 Oct 2020 at 18:23, Denys Dmytriyenko <denis@denix.org> wrote:
> > > +PV .= "~git${SRCPV}"
> >
> > OpenEmbedded convention is to use "+git..."
> 
> + and ~ have different behaviour, so the question is whether this SHA
> is before or after the 1.0 release.
> 
> If the 1.0 release hasn't happened yet, ~ is correct.  If 1.0 has
> already happened, + would be correct.
> 
> The lack of a 1.0 tag suggests that ~ is in fact the correct character to use.
> 
> ( 1.0~1 < 1.0 < 1.0+1)

Yeah, I know this is Debian convention for things like -rc1

And OpenEmbedded convention for this case historically was 0.9+1.0-rc1

-- 
Denys
