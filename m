Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.276.1582236866662627369
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Feb 2020 14:14:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CB29A40BFB;
	Thu, 20 Feb 2020 22:14:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ot_Ex7hTKk_z; Thu, 20 Feb 2020 22:14:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AEB6840027;
	Thu, 20 Feb 2020 22:14:24 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1089A174419; Thu, 20 Feb 2020 17:14:24 -0500 (EST)
Date: Thu, 20 Feb 2020 17:14:24 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: Re: [meta-arm] [PATCH] Remove meta-arm-iota
Message-ID: <20200220221424.GH4735@denix.org>
References: <20200220150941.25282-1-jon.mason@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200220150941.25282-1-jon.mason@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 20, 2020 at 10:09:41AM -0500, Jon Mason wrote:
> Feedback received that it is not acceptable to have a distro layer
> inside (https://lists.yoctoproject.org/g/meta-arm/message/6).  Removing
> from meta-arm and will create a separate git repository once that code
> is ready.

I don't think that was the message - as long as all your distro stuff is 
isolated from bsp and the rest into its own layer, it should be fine. You 
don't need to remove it completely into a separate repo.

-- 
Denys


> Change-Id: I74d1083341d90caa038c1bd8c1d53aa565d28460
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  meta-arm-iota/conf/layer.conf | 13 -------------
>  1 file changed, 13 deletions(-)
>  delete mode 100644 meta-arm-iota/conf/layer.conf
> 
> diff --git a/meta-arm-iota/conf/layer.conf b/meta-arm-iota/conf/layer.conf
> deleted file mode 100644
> index 392ed9b..0000000
> --- a/meta-arm-iota/conf/layer.conf
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -# We have a conf and classes directory, add to BBPATH
> -BBPATH .= ":${LAYERDIR}"
> -
> -# We have recipes-* directories, add to BBFILES
> -BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
> -            ${LAYERDIR}/recipes-*/*/*.bbappend"
> -
> -BBFILE_COLLECTIONS += "meta-arm-iota"
> -BBFILE_PATTERN_meta-arm-iota = "^${LAYERDIR}/"
> -BBFILE_PRIORITY_meta-arm-iota = "6"
> -
> -LAYERDEPENDS_meta-arm-iota = "core"
> -LAYERSERIES_COMPAT_meta-arm-iota = "warrior zeus"
> -- 
> 2.17.1
> 

> 

