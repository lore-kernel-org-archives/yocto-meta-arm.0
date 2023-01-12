Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F9AAC54EBC
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 13:31:58 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.54760.1673530316187346988
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 12 Jan 2023 05:31:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D701A40C56;
	Thu, 12 Jan 2023 13:31:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ry2abtf3We84; Thu, 12 Jan 2023 13:31:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B817740A3F;
	Thu, 12 Jan 2023 13:31:52 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BF5901636F5; Thu, 12 Jan 2023 08:31:34 -0500 (EST)
Date: Thu, 12 Jan 2023 08:31:34 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Ross Burton <ross.burton@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH 01/10] meta-*: mark layers as compatible
 with mickledore only
Message-ID: <20230112133134.GW22689@denix.org>
References: <20230112110257.2070363-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230112110257.2070363-1-ross.burton@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 12 Jan 2023 13:31:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4274

On Thu, Jan 12, 2023 at 11:02:48AM +0000, Ross Burton wrote:
> oe-core's master branch is diverging fron landgale and meta-arm will be

typo - landgale?


> following this, so drop compatibity with langdale in master so we're
> free to diverge too.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta-arm-bsp/conf/layer.conf       | 2 +-
>  meta-arm-toolchain/conf/layer.conf | 2 +-
>  meta-arm/conf/layer.conf           | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
> index 75efe546..e192a83d 100644
> --- a/meta-arm-bsp/conf/layer.conf
> +++ b/meta-arm-bsp/conf/layer.conf
> @@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-arm-bsp"
>  BBFILE_PATTERN_meta-arm-bsp = "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-arm-bsp = "5"
>  
> -LAYERSERIES_COMPAT_meta-arm-bsp = "langdale mickledore"
> +LAYERSERIES_COMPAT_meta-arm-bsp = "mickledore"
>  
>  LAYERDEPENDS_meta-arm-bsp = "core meta-arm"
>  # This won't be used by layerindex-fetch, but works everywhere else
> diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
> index bb37cd06..a6f403ec 100644
> --- a/meta-arm-toolchain/conf/layer.conf
> +++ b/meta-arm-toolchain/conf/layer.conf
> @@ -9,4 +9,4 @@ BBFILE_PATTERN_arm-toolchain := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_arm-toolchain = "5"
>  
>  LAYERDEPENDS_arm-toolchain = "core"
> -LAYERSERIES_COMPAT_arm-toolchain = "langdale mickledore"
> +LAYERSERIES_COMPAT_arm-toolchain = "mickledore"
> diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
> index 68d8c562..be8201c7 100644
> --- a/meta-arm/conf/layer.conf
> +++ b/meta-arm/conf/layer.conf
> @@ -13,7 +13,7 @@ LAYERDEPENDS_meta-arm = " \
>      core \
>      arm-toolchain \
>  "
> -LAYERSERIES_COMPAT_meta-arm = "langdale mickledore"
> +LAYERSERIES_COMPAT_meta-arm = "mickledore"
>  
>  # runfvp --console needs telnet, so pull this in for testimage.
>  HOSTTOOLS_NONFATAL += "telnet"
> -- 
> 2.34.1

