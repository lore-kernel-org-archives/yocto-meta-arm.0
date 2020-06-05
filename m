Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.134.1591397966243938007
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 05 Jun 2020 15:59:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A743D40C36;
	Fri,  5 Jun 2020 22:59:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N2E6IUkssvUF; Fri,  5 Jun 2020 22:59:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 862F540AD5;
	Fri,  5 Jun 2020 22:59:23 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4BBF7173209; Fri,  5 Jun 2020 18:59:23 -0400 (EDT)
Date: Fri, 5 Jun 2020 18:59:23 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Ross Burton <ross@burtonini.com>
Cc: Jon Mason <jdmason@kudzu.us>, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-toolchain: merge binary toolchain recipes
Message-ID: <20200605225923.GP17660@denix.org>
References: <20200528233224.28139-1-jdmason@kudzu.us>
 <CAAnfSTtp6Nw9Wm4UrYvSDYY2mnpeTPfROdZLGWMO=dS6RzH7QA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAnfSTtp6Nw9Wm4UrYvSDYY2mnpeTPfROdZLGWMO=dS6RzH7QA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 01, 2020 at 05:12:57PM +0100, Ross Burton wrote:
> On Fri, 29 May 2020 at 00:32, Jon Mason <jdmason@kudzu.us> wrote:
> > -
> > -S = "${WORKDIR}/gcc-arm-${PV}-x86_64-aarch64-none-elf"
> 
> > +S = "${WORKDIR}/${BPN}-${PV}"
> 
> That's the default value.

Yeah, that's the default for one recipe, not the other...

-- 
Denys
