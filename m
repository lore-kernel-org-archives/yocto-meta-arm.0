Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.59.1603213641492630785
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Oct 2020 10:07:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D292440BD9;
	Tue, 20 Oct 2020 17:07:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RM0P3g6O3WTF; Tue, 20 Oct 2020 17:07:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B74C140BD6;
	Tue, 20 Oct 2020 17:07:19 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D8DBA1744A7; Tue, 20 Oct 2020 13:07:18 -0400 (EDT)
Date: Tue, 20 Oct 2020 13:07:18 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/2] arm-bsp/layer.conf: add meta-python for musca
Message-ID: <20201020170718.GD19155@denix.org>
References: <20201020160136.473402-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201020160136.473402-1-ross.burton@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 20, 2020 at 05:01:35PM +0100, Ross Burton wrote:
> Change-Id: I46568f3144519bc25a65bce3d29d0ae659335f55
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta-arm-bsp/conf/layer.conf | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
> index 816ff9d..eedb7e0 100644
> --- a/meta-arm-bsp/conf/layer.conf
> +++ b/meta-arm-bsp/conf/layer.conf
> @@ -9,5 +9,9 @@ BBFILE_COLLECTIONS += "meta-arm-bsp"
>  BBFILE_PATTERN_meta-arm-bsp = "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-arm-bsp = "6"
>  
> -LAYERDEPENDS_meta-arm-bsp = "core meta-arm meta-kernel"
>  LAYERSERIES_COMPAT_meta-arm-bsp = "dunfell gatesgarth"
> +
> +LAYERDEPENDS_meta-arm-bsp = "core meta-arm meta-kernel"
> +# This won't be used by layerindex-fetch, but works everywhere else
> +LAYERDEPENDS_meta-arm-bsp_append_musca-b1 = " meta-python"
> +LAYERDEPENDS_meta-arm-bsp_append_musca-s1 = " meta-python"

LAYERDEPENDS changing based on the machine being built? Isn't it rather 
backwards?


> -- 
> 2.25.1
> 

> 
> 
> 

