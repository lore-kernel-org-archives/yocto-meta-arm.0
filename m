Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94708C433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 18:53:17 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.3261.1645037595985825097
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 16 Feb 2022 10:53:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A9B7540AE9;
	Wed, 16 Feb 2022 18:53:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Do67BBdf55Bt; Wed, 16 Feb 2022 18:53:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 907B1400CF;
	Wed, 16 Feb 2022 18:53:13 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B436D17475F; Wed, 16 Feb 2022 13:53:12 -0500 (EST)
Date: Wed, 16 Feb 2022 13:53:12 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/2] meta-arm-toolchain: Use renamed
 BB_BASEHASH_IGNORE_VARS variable
Message-ID: <20220216185312.GP26229@denix.org>
References: <20220216184220.3494070-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220216184220.3494070-1-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 16 Feb 2022 18:53:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2999

Just to clarify - both of these changes are in oe-core/master-next and have 
not been merged to master yet...


On Wed, Feb 16, 2022 at 10:42:19AM -0800, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-arm-toolchain/conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
> index fe23fd4..778910b 100644
> --- a/meta-arm-toolchain/conf/layer.conf
> +++ b/meta-arm-toolchain/conf/layer.conf
> @@ -15,4 +15,4 @@ LAYERSERIES_COMPAT_arm-toolchain = "honister"
>  BB_DANGLINGAPPENDS_WARNONLY = "true"
>  
>  # These variables are used for armcompiler license
> -BB_HASHBASE_WHITELIST:append = " ARM_TOOL_VARIANT ARMLMD_LICENSE_FILE LM_LICENSE_FILE"
> +BB_BASEHASH_IGNORE_VARS:append = " ARM_TOOL_VARIANT ARMLMD_LICENSE_FILE LM_LICENSE_FILE"
> -- 
> 2.35.1

