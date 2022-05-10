Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C9DAC433EF
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 16:43:02 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.1245.1652200975511190880
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 May 2022 09:42:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 25EBE40C2C;
	Tue, 10 May 2022 16:42:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v97L6pq43nBg; Tue, 10 May 2022 16:42:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0970A400CF;
	Tue, 10 May 2022 16:42:52 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BDD34174923; Tue, 10 May 2022 12:42:51 -0400 (EDT)
Date: Tue, 10 May 2022 12:42:51 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ross Burton <ross.burton@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] CI: use kirkstone branches for meta-clang
 and meta-virtualization
Message-ID: <20220510164251.GR9834@denix.org>
References: <20220510101508.2785347-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220510101508.2785347-1-ross.burton@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 10 May 2022 16:43:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3376

On Tue, May 10, 2022 at 11:15:08AM +0100, Ross Burton wrote:
> These branches have kirkstone branches now, so use them.

Did you mean "these *layers* have kirsktone branches now"?


> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  ci/clang.yml               | 1 -
>  ci/meta-virtualization.yml | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/ci/clang.yml b/ci/clang.yml
> index e5e7dd5f..a2063f19 100644
> --- a/ci/clang.yml
> +++ b/ci/clang.yml
> @@ -4,7 +4,6 @@ header:
>  repos:
>    meta-clang:
>      url: https://github.com/kraj/meta-clang
> -    refspec: master
>  
>  local_conf_header:
>    clang: |
> diff --git a/ci/meta-virtualization.yml b/ci/meta-virtualization.yml
> index 8791fc3b..1cd0e21a 100644
> --- a/ci/meta-virtualization.yml
> +++ b/ci/meta-virtualization.yml
> @@ -6,4 +6,3 @@ header:
>  repos:
>    meta-virtualization:
>      url: git://git.yoctoproject.org/meta-virtualization
> -    refspec: master
> -- 
> 2.25.1
> 

