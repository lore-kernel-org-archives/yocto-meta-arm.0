Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69C5DCA100C
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 19:54:10 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.515.1725047640330155978
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 30 Aug 2024 12:54:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 58FC340C3E;
	Fri, 30 Aug 2024 19:53:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qLEpStsvYq46; Fri, 30 Aug 2024 19:53:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3C5CA40A03;
	Fri, 30 Aug 2024 19:53:58 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 414B3164064; Fri, 30 Aug 2024 15:53:57 -0400 (EDT)
Date: Fri, 30 Aug 2024 15:53:57 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm/trusted-firmware-a: update LICENSE entry
Message-ID: <20240830195357.GF17572@denix.org>
References: <20240830155148.24392-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830155148.24392-1-jon.mason@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 30 Aug 2024 19:54:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6043

On Fri, Aug 30, 2024 at 11:51:48AM -0400, Jon Mason wrote:
> As pointed out by Denys Dmytriyenko, the LICENSE entry in
> trusted-firmware-a is not accurate.  docs/license.rst specifies the
> licenses to be BSD 3 Clause for the project, with code from other
> projects imported as:
> libc BSD-3-Clause
> libfdt BSD-2-Clause
> LLVM BSD-3-Clause
> zlib BSD-3-Clause
> STMicroelectronics platform source code BSD-3-Clause
> Linux source  MIT
> DICE Apache 2.0
> 
> Note: these are the license the code is imported with (according to
> license.rst), not a listing of the license(s) of those sources.
> 
> Signed-off-by: Jon Mason <jon.mason@arm.com>

Acked-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> index 80d41f328afa..f90b588444a4 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> @@ -1,5 +1,5 @@
>  DESCRIPTION = "Trusted Firmware-A"
> -LICENSE = "BSD-3-Clause & MIT"
> +LICENSE = "BSD-2-Clause & BSD-3-Clause & MIT & Apache-2.0"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -- 
> 2.39.3 (Apple Git-146)

