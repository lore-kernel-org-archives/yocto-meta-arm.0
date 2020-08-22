Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.145779.1598056102613968421
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Aug 2020 17:28:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CB36C40BAD;
	Sat, 22 Aug 2020 00:28:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qjQUAwVfQPrp; Sat, 22 Aug 2020 00:28:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A4FBD40BAB;
	Sat, 22 Aug 2020 00:28:19 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id EBA49174467; Fri, 21 Aug 2020 20:28:18 -0400 (EDT)
Date: Fri, 21 Aug 2020 20:28:18 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Khasim Mohammed <khasim.mohammed@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH v2 1/3] arm/trusted-firmware-a: fix variable name typo
Message-ID: <20200822002818.GN17660@denix.org>
References: <20200821160927.10598-1-khasim.mohammed@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200821160927.10598-1-khasim.mohammed@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 21, 2020 at 09:39:25PM +0530, Khasim Mohammed wrote:
> Variable name "processes" is wrongly mentioned as "processed", this patch
> fixes the same.

Heh, I believe it was meant to be called "processed", i.e. when at least one 
of the checks matches and gets processed, the final condition is not met. So, 
it results in an error only when none of them gets processed.

But looks like I copied and pasted the version with the typo all over the 
place, while using the correct name in the final "if" statement:
https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/commit/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc?id=01825739a4a49d857f7b1a839374da4381b92c2e

Sorry about that. Using the correct name would require fixing it in 4 places 
instead of one. So not sure if it's worth it...


> Change-Id: Id9362f514861c75f8f6a727582e11b0e65736349
> Issue-Id: PLATFORMS-3971
> Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> ---
>  meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> index 4362882..e4847b5 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> @@ -171,7 +171,7 @@ do_install() {
>              echo "dtbs install, skipped"
>          elif [ -f ${B}/tools/$atfbin/$atfbin ]; then
>              echo "Tools $atfbin install, skipped"
> -        elif [ "$processed" = "0" ]; then
> +        elif [ "$processes" = "0" ]; then
>              bberror "Unsupported TFA_INSTALL_TARGET target $atfbin"
>              exit 1
>          fi
> -- 
> 2.17.1
> 

> 

