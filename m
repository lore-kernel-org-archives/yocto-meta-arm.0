Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.1906.1591896984341415930
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Jun 2020 10:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B726640C1C;
	Thu, 11 Jun 2020 17:36:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n_g3N--1oxuC; Thu, 11 Jun 2020 17:36:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 55A9A40BB1;
	Thu, 11 Jun 2020 17:36:21 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 039A3173217; Thu, 11 Jun 2020 13:36:21 -0400 (EDT)
Date: Thu, 11 Jun 2020 13:36:20 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-bsp: Fix gem5 build break
Message-ID: <20200611173620.GB17660@denix.org>
References: <20200611124826.29927-1-jon.mason@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200611124826.29927-1-jon.mason@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 11, 2020 at 08:48:26AM -0400, Jon Mason wrote:
> OE-core removed DEPLOY_DIR_TOOLS, which is causing a build break on gem5
> due to DEPLOY_DIR_TOOLS usage.  Temporarily define it in the recipe to
> get it working.

It's coming back, it's in master-next of OE-Core now:
https://git.openembedded.org/openembedded-core/commit/?h=master-next&id=6a6cb9bcf97dfad636ab782c1d337003a9118a82


> Change-Id: I8d4d6e73009cab8ad7102045b855afcad34d3bf3
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  meta-arm-bsp/conf/machine/gem5-arm64.conf | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-arm-bsp/conf/machine/gem5-arm64.conf b/meta-arm-bsp/conf/machine/gem5-arm64.conf
> index 4db86c9..fc31bcf 100644
> --- a/meta-arm-bsp/conf/machine/gem5-arm64.conf
> +++ b/meta-arm-bsp/conf/machine/gem5-arm64.conf
> @@ -51,3 +51,5 @@ EXTRA_IMAGEDEPENDS += "gem5-aarch64-native"
>  # rngd (Part of rng-tools) takes ~7 mins to init resulting in a slow boot time.
>  PACKAGE_EXCLUDE_append = " rng-tools"
>  IMAGE_INSTALL_append = " haveged"
> +
> +DEPLOY_DIR_TOOLS = "${DEPLOY_DIR}/tools"
> -- 
> 2.17.1
> 

> 

