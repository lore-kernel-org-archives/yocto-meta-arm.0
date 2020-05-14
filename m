Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.83.1589486625874153762
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 14 May 2020 13:03:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E730040C15;
	Thu, 14 May 2020 20:03:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ummGKMZIi_IV; Thu, 14 May 2020 20:03:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A691E40A93;
	Thu, 14 May 2020 20:03:41 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4FD1E173169; Thu, 14 May 2020 16:03:41 -0400 (EDT)
Date: Thu, 14 May 2020 16:03:41 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Ross Burton <ross@burtonini.com>
Cc: Jon Mason <jdmason@kudzu.us>, meta-arm@lists.yoctoproject.org,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [meta-arm] [PATCH] arm-toolchain: gcc-arm-none-eabi-native: Add recipe
Message-ID: <20200514200341.GZ11927@denix.org>
References: <20200514024932.19962-1-jdmason@kudzu.us>
 <20200514042513.GY11927@denix.org>
 <CAAnfSTuU5Yc9ch52kRm2i64FsQ1e-o11Gf8ZrRg-0_SKCOT-3w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAnfSTuU5Yc9ch52kRm2i64FsQ1e-o11Gf8ZrRg-0_SKCOT-3w@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 14, 2020 at 09:10:33AM +0100, Ross Burton wrote:
> On Thu, 14 May 2020 at 05:25, Denys Dmytriyenko <denis@denix.org> wrote:
> > What the hell is "lnr"? :) What am I missing?
> 
> It's a script in oe-core/scripts that is basically a clone of 'ln
> --relative', as it's a really useful feature that isn't available on
> some old but supported build hosts.
> 
> Old but supported at the time that is, I do wonder if those hosts are
> no longer supported.

Ah, interesting! Thanks for the info!

-- 
Denys
