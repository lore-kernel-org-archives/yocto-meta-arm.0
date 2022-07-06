Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15DD3C43334
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 17:59:23 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.381.1657130356818261791
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 06 Jul 2022 10:59:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1D1D240CF5;
	Wed,  6 Jul 2022 17:59:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x5avoR4Q1qW2; Wed,  6 Jul 2022 17:59:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0557840C61;
	Wed,  6 Jul 2022 17:59:14 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A38071749A2; Wed,  6 Jul 2022 13:59:14 -0400 (EDT)
Date: Wed, 6 Jul 2022 13:59:14 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm/trusted-firmware-a: Fix v1.5 recipe
Message-ID: <20220706175914.GD18692@denix.org>
References: <20220629133650.21058-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220629133650.21058-1-jon.mason@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 06 Jul 2022 17:59:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3550

On Wed, Jun 29, 2022 at 09:36:50AM -0400, Jon Mason wrote:
> 0003-xlat-tables-v2-remove-tautological-assert.patch does not apply on
> the TF-A v1.5 sources.  Move that file append to the v2.4 recipe so that
> it will not attempt to apply for v1.5.
> 
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc  | 1 -
>  .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.bb    | 2 ++
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> index 807e1254..cea5476a 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> @@ -57,7 +57,6 @@ SRCREV_FORMAT_append = "${@bb.utils.contains('TFA_MBEDTLS', '1', '_mbedtls', '',
>  
>  SRC_URI_append = " \
>      file://0002-pmf.h-made-PMF_STOTE_ENABLE-pass-Wtautological.patch  \
> -    file://0003-xlat-tables-v2-remove-tautological-assert.patch \
>      "
>  
>  # U-boot support (set TFA_UBOOT to 1 to activate)
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.bb
> index f23132af..d8e87405 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.bb
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.bb
> @@ -13,3 +13,5 @@ SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=ht
>  SRCREV_mbedtls = "523f0554b6cdc7ace5d360885c3f5bbcc73ec0e8"
>  
>  LIC_FILES_CHKSUM_MBEDTLS = "file://mbedtls/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> +
> +SRC_URI_append = "file://0003-xlat-tables-v2-remove-tautological-assert.patch"

1. missing leading space in append override
2. old override syntax - what branch is it, master?

-- 
Denys

