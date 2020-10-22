Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.127.1603403110532407938
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Oct 2020 14:45:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DD0D740C35;
	Thu, 22 Oct 2020 21:45:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z3_hkX1wNfbG; Thu, 22 Oct 2020 21:45:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9B00D40B2D;
	Thu, 22 Oct 2020 21:45:04 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7D7DD1744B1; Thu, 22 Oct 2020 17:45:03 -0400 (EDT)
Date: Thu, 22 Oct 2020 17:45:03 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Ross Burton <ross@burtonini.com>
Cc: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	meta-arm@lists.yoctoproject.org, Lakshmi.Kailasanathan@arm.com,
	Ross Burton <Ross.Burton@arm.com>, nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-bsp/corstone700-test-app: adding test recipe for systems comms
Message-ID: <20201022214503.GO19155@denix.org>
References: <20201021171033.21198-1-abdellatif.elkhlifi@arm.com>
 <20201021172340.GF19155@denix.org>
 <CAAnfSTviL7v4i=YVO78ANwTH6859iKivy-Br+AQQXogtG_km9g@mail.gmail.com>
 <20201021185859.GG19155@denix.org>
 <CAAnfSTtRhQt_nFT4wbEOVT=p5Bqo3hiGAgKO9GCvN9Ph5sY1YA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAnfSTtRhQt_nFT4wbEOVT=p5Bqo3hiGAgKO9GCvN9Ph5sY1YA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 22, 2020 at 03:03:33PM +0100, Ross Burton wrote:
> On Wed, 21 Oct 2020 at 19:59, Denys Dmytriyenko <denis@denix.org> wrote:
> 
> > Yeah, I know this is Debian convention for things like -rc1
> >
> > And OpenEmbedded convention for this case historically was 0.9+1.0-rc1
> 
> That was because historically we didn't have ~ support.  We do now.

Oh, great! Is it supported by all package managers, including opkg?

-- 
Denys
