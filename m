Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.3152.1589414767035853449
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 May 2020 17:06:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6F6BD40B89
	for <meta-arm@lists.yoctoproject.org>; Thu, 14 May 2020 00:06:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 56EM6ysOUq7l for <meta-arm@lists.yoctoproject.org>;
	Thu, 14 May 2020 00:06:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 614E1409AA
	for <meta-arm@lists.yoctoproject.org>; Thu, 14 May 2020 00:06:06 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3008917314B; Wed, 13 May 2020 20:06:06 -0400 (EDT)
Date: Wed, 13 May 2020 20:06:06 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/2] trusted-firmware-a: install/deploy multiple variants of the target
Message-ID: <20200514000606.GX11927@denix.org>
References: <160EBBFB41813A0F.24818@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <160EBBFB41813A0F.24818@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Sorry, 2 more patches to be applied on top of the first 2 of mine.

I can also re-send as 4-patch series, if needed.


On Wed, May 13, 2020 at 07:59:59PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Installing and deploying .bin and .elf shouldn't be mutually exclusive.
> There are scenarios where both can be useful - .bin for booting and .elf
> for debugging.
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../trusted-firmware-a/trusted-firmware-a.inc        | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> index 0804689..3ec8c2c 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> @@ -116,29 +116,39 @@ do_install() {
>  
>      install -d -m 755 ${D}/firmware
>      for atfbin in ${TFA_INSTALL_TARGET}; do
> +        processes="0"
>          if [ "$atfbin" = "all" ]; then
>              # Target all is not handled by default
>              bberror "all as TFA_INSTALL_TARGET is not handled by do_install"
>              bberror "Please specify valid targets in TFA_INSTALL_TARGET or"
>              bberror "rewrite or turn off do_install"
>              exit 1
> -        elif [ -f $BUILD_PLAT/$atfbin.bin ]; then
> +        fi
> +
> +        if [ -f $BUILD_PLAT/$atfbin.bin ]; then
>              echo "Install $atfbin.bin"
>              install -m 0644 $BUILD_PLAT/$atfbin.bin \
>                  ${D}/firmware/$atfbin-${TFA_PLATFORM}.bin
> -        elif [ -f $BUILD_PLAT/$atfbin/$atfbin.elf ]; then
> +            processes="1"
> +        fi
> +        if [ -f $BUILD_PLAT/$atfbin/$atfbin.elf ]; then
>              echo "Install $atfbin.elf"
>              install -m 0644 $BUILD_PLAT/$atfbin/$atfbin.elf \
>                  ${D}/firmware/$atfbin-${TFA_PLATFORM}.elf
> -        elif [ -f $BUILD_PLAT/$atfbin ]; then
> +            processes="1"
> +        fi
> +        if [ -f $BUILD_PLAT/$atfbin ]; then
>              echo "Install $atfbin"
>              install -m 0644 $BUILD_PLAT/$atfbin \
>                  ${D}/firmware/$atfbin-${TFA_PLATFORM}
> -        elif [ "$atfbin" = "dtbs" ]; then
> +            processes="1"
> +        fi
> +
> +        if [ "$atfbin" = "dtbs" ]; then
>              echo "dtbs install, skipped"
>          elif [ -f ${B}/tools/$atfbin/$atfbin ]; then
>              echo "Tools $atfbin install, skipped"
> -        else
> +        elif [ "$processed" = "0" ]; then
>              bberror "Unsupported TFA_INSTALL_TARGET target $atfbin"
>              exit 1
>          fi
> -- 
> 2.7.4
> 

> 

