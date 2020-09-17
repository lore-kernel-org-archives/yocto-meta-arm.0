Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.461.1600361087050477041
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Sep 2020 09:44:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 37A4040C28;
	Thu, 17 Sep 2020 16:44:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QPYdihECZyGT; Thu, 17 Sep 2020 16:44:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0E21940B7B;
	Thu, 17 Sep 2020 16:44:43 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0F0D417446F; Thu, 17 Sep 2020 12:44:43 -0400 (EDT)
Date: Thu, 17 Sep 2020 12:44:43 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Nathan Dunne <Nathan.Dunne@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-bsp/u-boot: fix THISDIR name collision in u-boot_%.bbappend
Message-ID: <20200917164443.GA19155@denix.org>
References: <20200917095817.27331-1-Nathan.Dunne@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200917095817.27331-1-Nathan.Dunne@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 17, 2020 at 09:58:17AM +0000, Nathan Dunne wrote:
> Renamed ${THISDIR} user defined variable to ${THIS_DIR}, to prevent
> it from breaking ${THISDIR} macro in subsequent u-boot .bbappend files
> 
> Change-Id: I4473ee5c3ac5c0aea9310557294cc9757579bdf1
> Issue-Id: SCM-1302
> Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
> ---
>  meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> index bf57242..5fc3723 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
> @@ -1,7 +1,7 @@
>  # Machine specific u-boot
>  
> -THISDIR := "${THISDIR}"
> -FILESEXTRAPATHS_prepend = "${THISDIR}/files/:${THISDIR}/${BP}:"
> +THIS_DIR := "${THISDIR}"
> +FILESEXTRAPATHS_prepend = "${THIS_DIR}/files/:${THIS_DIR}/${BP}:"
>  FILESEXTRAPATHS_prepend_fvp-base := "${THISDIR}/files/fvp-common:"
>  FILESEXTRAPATHS_prepend_foundation-armv8 := "${THISDIR}/files/fvp-common:"

Why not make these 3 lines above that prepend to FILESEXTRAPATHS consistent?


>  
> -- 
> 2.17.1
> 

> 
> 
> 

