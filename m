Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E913AC5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 17:03:02 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.17901.1709744581567073127
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 06 Mar 2024 09:03:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7366A40C3A;
	Wed,  6 Mar 2024 17:03:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qH2lk-JbyWWP; Wed,  6 Mar 2024 17:03:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5C1C240C16;
	Wed,  6 Mar 2024 17:02:58 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 87F11163ECA; Wed,  6 Mar 2024 12:02:57 -0500 (EST)
Date: Wed, 6 Mar 2024 12:02:57 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: delane.brandy@arm.com
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/2] arm/trusted-firmware-a: fix mbedTLS
 version
Message-ID: <20240306170257.GK6072@denix.org>
References: <20240306105015.2630056-1-delane.brandy@arm.com>
 <20240306105015.2630056-2-delane.brandy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240306105015.2630056-2-delane.brandy@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 06 Mar 2024 17:03:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5415

On Wed, Mar 06, 2024 at 02:51:06AM -0800, delane.brandy@arm.com wrote:
> From: Delane Brandy <delane.brandy@arm.com>
> 
> Update mbedTLS version as TF-A 2.10 supports mbedTLS 3.4.1, as seen:
> https://trustedfirmware-a.readthedocs.io/en/v2.10/change-log.html#new-features
> 
> Signed-off-by: Delane Brandy <delane.brandy@arm.com>
> ---
>  .../trusted-firmware-a/trusted-firmware-a_2.10.0.bb         | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.0.bb
> index 4f019844..d25c0aaa 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.0.bb
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.0.bb
> @@ -5,8 +5,8 @@ SRCREV_tfa = "b6c0948400594e3cc4dbb5a4ef04b815d2675808"
>  
>  LIC_FILES_CHKSUM += "file://docs/license.rst;md5=b2c740efedc159745b9b31f88ff03dde"
>  
> -# mbedtls-3.5.1
> +# mbedtls-3.4.1
>  SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls;branch=master"
> -SRCREV_mbedtls = "edb8fec9882084344a314368ac7fd957a187519c"
> +SRCREV_mbedtls = "72718dd87e087215ce9155a826ee5a66cfbe9631"
>  
> -LIC_FILES_CHKSUM_MBEDTLS = "file://mbedtls/LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
> +LIC_FILES_CHKSUM_MBEDTLS = "file://mbedtls/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"

Why did the license checksum change? Missing License-Update: tag?

-- 
Denys

