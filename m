Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCF48C677F1
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 20:26:46 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.208697.1673987203751045113
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Jan 2023 12:26:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 267B940C87;
	Tue, 17 Jan 2023 20:26:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CLLEOTJfh4V7; Tue, 17 Jan 2023 20:26:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E21A540C1C;
	Tue, 17 Jan 2023 20:26:37 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A3BB21636FA; Tue, 17 Jan 2023 15:26:19 -0500 (EST)
Date: Tue, 17 Jan 2023 15:26:19 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: "Theodore A. Roth" <troth@openavr.org>
Cc: meta-arm@lists.yoctoproject.org, Ross.Burton@arm.com, jdmason@kudzu.us,
	Emekcan.Aras@arm.com,
	"Theodore A . Roth" <theodore_roth@trimble.com>
Subject: Re: [meta-arm] [PATCH] arm/optee-os: Fix FILESEXTRAPATHS
Message-ID: <20230117202619.GE22689@denix.org>
References: <20230110170627.10991-1-troth@openavr.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230110170627.10991-1-troth@openavr.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 Jan 2023 20:26:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4292

On Tue, Jan 10, 2023 at 10:06:27AM -0700, Theodore A. Roth wrote:
> The include file should be pointing to `optee-os-3.19.0` instead of
> `optee-os-3_19` (which does not exist).
> 
> Fixes: 3259a2a8402f ("arm/optee: support optee 3.19")
> Signed-off-by: Theodore A. Roth <theodore_roth@trimble.com>
> Signed-off-by: Theodore A. Roth <troth@openavr.org>
> ---
>  meta-arm/recipes-security/optee/optee-os-3_19.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arm/recipes-security/optee/optee-os-3_19.inc b/meta-arm/recipes-security/optee/optee-os-3_19.inc
> index 8adb6996..61475dcf 100644
> --- a/meta-arm/recipes-security/optee/optee-os-3_19.inc
> +++ b/meta-arm/recipes-security/optee/optee-os-3_19.inc
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c1f21c4f72f372ef38a5a4aee55ec173"
>  inherit deploy python3native
>  require optee.inc
>  
> -FILESEXTRAPATHS:prepend := "${THISDIR}/optee-os-3_19:"
> +FILESEXTRAPATHS:prepend := "${THISDIR}/optee-os-3.19.0:"

This should be "optee-os-3.19" as correctly explained by Ross here:
https://lists.yoctoproject.org/g/meta-arm/message/4278


>  CVE_PRODUCT = "linaro:op-tee op-tee:op-tee_os"
>  
> -- 
> 2.25.1

