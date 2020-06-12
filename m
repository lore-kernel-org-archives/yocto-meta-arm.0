Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.1320.1591987252630487007
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Jun 2020 11:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EDE6940C06;
	Fri, 12 Jun 2020 18:40:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rUIUrh1M3gIr; Fri, 12 Jun 2020 18:40:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F10EB40B30;
	Fri, 12 Jun 2020 18:40:47 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 61D7617320F; Fri, 12 Jun 2020 14:40:47 -0400 (EDT)
Date: Fri, 12 Jun 2020 14:40:47 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Jon Mason <jdmason@kudzu.us>, Diego Sueiro <diego.sueiro@arm.com>,
	meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] trusted-firmware-a: fiptool build using BUILD_CFLAGS and BUILD_LDFLAGS
Message-ID: <20200612184047.GS17660@denix.org>
References: <20200612124503.GB14746@kudzu.us>
 <14107.1591966447946904888@lists.yoctoproject.org>
 <20200612130041.GC14746@kudzu.us>
 <fb140298-1fe5-c166-d9eb-d71fa050ecea@gmail.com>
MIME-Version: 1.0
In-Reply-To: <fb140298-1fe5-c166-d9eb-d71fa050ecea@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 12, 2020 at 10:45:20AM -0500, Joshua Watt wrote:
> 
> On 6/12/20 8:00 AM, Jon Mason wrote:
> >On Fri, Jun 12, 2020 at 05:54:07AM -0700, Diego Sueiro wrote:
> >>On Fri, Jun 12, 2020 at 01:45 PM, Jon Mason wrote:
> >>
> >>>On Thu, Jun 11, 2020 at 03:17:04PM +0100, Diego Sueiro wrote:
> >>>>Since the TF-A fiptool is native tool we should be using the
> >>>>BUILD_CFLAGS and BUILD_LDFLAGS flags to proper build and execute it.
> >>>>
> >>>>Change-Id: I9634604dbc42ba7da85d9b9449f1ed94ecb38df2
> >>>>Issue-Id: SCM-888
> >>>>Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> >>>Pulled into master.
> >>Thanks.
> >>
> >>Could you please backport it to dunfell?
> >Yes, this seems like a good bug fix.  I just want to make sure that
> >Denys and Joshua are aware, since it might break them.
> 
> Thanks for the heads up. I tested this on master with rock-pi-4 and
> qemuarm-secureboot, and everything looks OK.

I also tested this change against TI platforms and seems fine. Thanks.

-- 
Denys
