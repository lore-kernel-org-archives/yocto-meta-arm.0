Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 672D0C4332F
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:51:59 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.10975.1650645622837510399
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 09:40:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6FE4540C2E;
	Fri, 22 Apr 2022 16:40:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lBxxa5sMhZHX; Fri, 22 Apr 2022 16:40:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 415BF40952;
	Fri, 22 Apr 2022 16:40:17 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 74C6A1748D5; Fri, 22 Apr 2022 12:40:16 -0400 (EDT)
Date: Fri, 22 Apr 2022 12:40:16 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: emekcan.aras@arm.com
Cc: meta-arm@lists.yoctoproject.org, Ross.Burton@arm.com, nd@arm.com,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [meta-arm] [PATCH honister 1/1] arm-bsp/trusted-firmware-a:
 corstone1000: update Tfa SHA
Message-ID: <20220422164016.GD12993@denix.org>
References: <20220422152537.230848-1-emekcan.aras@arm.com>
 <20220422152537.230848-2-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422152537.230848-2-emekcan.aras@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:51:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3292

On Fri, Apr 22, 2022 at 04:25:37PM +0100, emekcan.aras@arm.com wrote:
> From: Emekcan Aras <Emekcan.Aras@arm.com>
> 
> This commit updates Tfa SHA to remove the patches from the
> recipe since all of them are upstreamed now.

Why not remove the patch files themselves?


> Signed-off-by: Emekcan Aras emekcan.aras@arm.com
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  .../trusted-firmware-a-corstone1000.inc             | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc
> index 08548d35..59eab653 100644
> --- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc
> +++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone1000.inc
> @@ -11,13 +11,12 @@ PV .= "+git${SRCREV_tfa}"
>  LIC_FILES_CHKSUM="file://docs/license.rst;md5=b2c740efedc159745b9b31f88ff03dde file://mbedtls/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>  
>  FILESEXTRAPATHS:prepend := "${THISDIR}/files/corstone1000:"
> -SRC_URI:append = " \
> -                 file://0001-Rename-Diphda-to-corstone1000.patch \
> -                 file://0002-plat-arm-corstone1000-made-changes-to-accommodate-3M.patch \
> -                 file://0003-corstone1000-implement-platform-specific-psci-reset.patch \
> -                 file://0004-plat-arm-corstone1000-change-base-address-of-FIP-in-the-fl.patch   \
> -                 file://0005-plat-arm-corstone1000-identify-which-bank-to-load-fip-from.patch   \
> -                 "
> +SRCREV_tfa = "cf89fd57ed3286d7842eef41cd72a3977eb6d317"
> +PV = "2.6+git${SRCPV}"
> +
> +SRC_URI:remove = " \
> +     file://ssl.patch \
> +     "  
>  
>  TFA_DEBUG = "1"
>  TFA_UBOOT = "1"
> -- 
> 2.25.1

