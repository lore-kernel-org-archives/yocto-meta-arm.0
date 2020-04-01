Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.2557.1585783229227167121
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Apr 2020 16:20:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8FF0B40B30;
	Wed,  1 Apr 2020 23:20:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iaEn2Y9jzAsr; Wed,  1 Apr 2020 23:20:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 671FB409AA;
	Wed,  1 Apr 2020 23:20:27 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id DD7C31718F5; Wed,  1 Apr 2020 19:20:26 -0400 (EDT)
Date: Wed, 1 Apr 2020 19:20:26 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org, Khem Raj <raj.khem@gmail.com>
Subject: Re: [meta-arm] [PATCH 1/5] layer.conf: add meta-python to LAYERDEPENDS for optee components
Message-ID: <20200401232026.GR1578@denix.org>
References: <1601D50E043B4BBD.6346@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <1601D50E043B4BBD.6346@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 01, 2020 at 07:13:02PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> optee components use pycrypto, pycryptodomex and pyelftools from meta-python layer

And this is quite unfortunate! As a proposed common dependency for ARM-based 
BSPs, I was hoping meta-arm could stay clean and only depend on OE-Core. While 
meta-python by itself may not be such a big deal, it is not a standalone layer 
and is part of a much larger meta-openembedded collection of layers. So, any 
BSP that wants to depend on meta-arm would now need to pull meta-openembedded 
in its entirety just to use meta-python...

-- 
Denys


> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arm/conf/layer.conf | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
> index 0b93e8d..d96e9f1 100644
> --- a/meta-arm/conf/layer.conf
> +++ b/meta-arm/conf/layer.conf
> @@ -9,5 +9,8 @@ BBFILE_COLLECTIONS += "meta-arm"
>  BBFILE_PATTERN_meta-arm = "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-arm = "6"
>  
> -LAYERDEPENDS_meta-arm = "core"
> +LAYERDEPENDS_meta-arm = " \
> +    core \
> +    meta-python \
> +"
>  LAYERSERIES_COMPAT_meta-arm = "warrior zeus dunfell"
> -- 
> 2.7.4
> 

> 

