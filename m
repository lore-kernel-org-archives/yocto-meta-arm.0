Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.118.1591983675516292080
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Jun 2020 10:41:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BD6B940C06;
	Fri, 12 Jun 2020 17:41:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2oepwAjTnwJA; Fri, 12 Jun 2020 17:41:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8D29B40A35;
	Fri, 12 Jun 2020 17:41:11 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BECBA17320F; Fri, 12 Jun 2020 13:41:10 -0400 (EDT)
Date: Fri, 12 Jun 2020 13:41:10 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Jon Mason <jdmason@kudzu.us>
Cc: Jon Mason <jon.mason@arm.com>, meta-arm@lists.yoctoproject.org,
	nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-bsp: Fix gem5 build break
Message-ID: <20200612174110.GR17660@denix.org>
References: <20200611124826.29927-1-jon.mason@arm.com>
 <20200611173620.GB17660@denix.org>
 <20200612124307.GA14746@kudzu.us>
MIME-Version: 1.0
In-Reply-To: <20200612124307.GA14746@kudzu.us>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 12, 2020 at 08:43:08AM -0400, Jon Mason wrote:
> On Thu, Jun 11, 2020 at 01:36:20PM -0400, Denys Dmytriyenko wrote:
> > On Thu, Jun 11, 2020 at 08:48:26AM -0400, Jon Mason wrote:
> > > OE-core removed DEPLOY_DIR_TOOLS, which is causing a build break on gem5
> > > due to DEPLOY_DIR_TOOLS usage.  Temporarily define it in the recipe to
> > > get it working.
> > 
> > It's coming back, it's in master-next of OE-Core now:
> > https://git.openembedded.org/openembedded-core/commit/?h=master-next&id=6a6cb9bcf97dfad636ab782c1d337003a9118a82
> 
> Alright.  I'd prefer to wait rather than apply and revert.  So,
> dropping this patch.

Yes, it's in master as of this morning.

-- 
Denys
