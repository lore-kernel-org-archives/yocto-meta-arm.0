Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62909EE20B8
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 16:20:34 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1072.1770394827703123774
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 06 Feb 2026 08:20:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C83C640CC8;
	Fri,  6 Feb 2026 16:20:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5FvRzDq8Kt1q; Fri,  6 Feb 2026 16:20:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AC63740C8C;
	Fri,  6 Feb 2026 16:20:25 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1211C1785CA; Fri,  6 Feb 2026 11:20:25 -0500 (EST)
Date: Fri, 6 Feb 2026 11:20:25 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: ross.burton@arm.com
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-bsp/external-system: remove redundant
 DEBUG_PREFIX_MAP fiddling
Message-ID: <20260206162025.GD11121@denix.org>
References: <20260206144402.1583348-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206144402.1583348-1-ross.burton@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 06 Feb 2026 16:20:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6889

On Fri, Feb 06, 2026 at 02:44:02PM +0000, Ross Burton via lists.yoctoproject.org wrote:
> We have a newer gcc-arm-none-eabi now, so this can be removed.

Still no plans for a proper baremetal multiconfig? Promises, promises... ;)


> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../recipes-bsp/external-system/external-system_0.1.0.bb   | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb b/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
> index d297c9d047..1d08817e78 100644
> --- a/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
> +++ b/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
> @@ -21,16 +21,13 @@ PRODUCT = "corstone-1000"
>  
>  B = "${WORKDIR}/build"
>  
> -# remove once arm-none-eabi-gcc updates to 13 or newer like poky
> -DEBUG_PREFIX_MAP:remove = "-fcanon-prefix-map"
> -
>  LDFLAGS[unexport] = "1"
>  
>  do_compile() {
>      oe_runmake -C ${S} V=y \
>          BUILD_PATH=${B} \
> -	PRODUCT=${PRODUCT} \
> -	CROSS_COMPILE=arm-none-eabi- \
> +        PRODUCT=${PRODUCT} \
> +        CROSS_COMPILE=arm-none-eabi- \
>          all
>  }
>  
> -- 
> 2.43.0

