Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E33A9C4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 17:07:39 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.27326.1714410457709392179
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Apr 2024 10:07:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B880940C1E;
	Mon, 29 Apr 2024 17:07:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MO4byXHohGuu; Mon, 29 Apr 2024 17:07:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 384D440BD4;
	Mon, 29 Apr 2024 17:07:33 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C9CAD163F4A; Mon, 29 Apr 2024 13:07:32 -0400 (EDT)
Date: Mon, 29 Apr 2024 13:07:32 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ross Burton <ross.burton@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH v2 3/5] external-arm-toolchain: ignore
 warnings about 32-bit time types
Message-ID: <20240429170732.GM28791@denix.org>
References: <20240429163859.507226-1-ross.burton@arm.com>
 <20240429163859.507226-3-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240429163859.507226-3-ross.burton@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Apr 2024 17:07:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5631

On Mon, Apr 29, 2024 at 04:38:57PM +0000, Ross Burton wrote:
> Functions that take 32-bit time_t types are unavoidable in the libc, so
> ignore the warnings.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Reviewed-by: Denys Dmytriyenko <denis@denix.org>


> ---
>  .../external-arm-toolchain/external-arm-toolchain.bb             | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> index fab17611..49ad7442 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> @@ -316,6 +316,7 @@ PACKAGES += "\
>  	${PN}-staticdev \
>  "
>  
> +INSANE_SKIP += " 32bit-time"
>  INSANE_SKIP:${PN}-dbg = "staticdev"
>  INSANE_SKIP:${PN}-utils += "ldflags"
>  INSANE_SKIP:libstdc++ += "ldflags"
> -- 
> 2.34.1

