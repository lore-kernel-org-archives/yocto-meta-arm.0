Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.169.1589219104732002199
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 May 2020 10:45:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 25DBF40C0F;
	Mon, 11 May 2020 17:45:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mnXcdqRoFuXv; Mon, 11 May 2020 17:45:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0B92D40A46;
	Mon, 11 May 2020 17:45:02 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 848F3173134; Mon, 11 May 2020 13:45:02 -0400 (EDT)
Date: Mon, 11 May 2020 13:45:02 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm][PATCH 2/3] trusted-firmware-a: Install .elf file from subdirectory
Message-ID: <20200511174502.GK11927@denix.org>
References: <20200511142604.11860-1-JPEWhacker@gmail.com>
 <20200511142604.11860-3-JPEWhacker@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200511142604.11860-3-JPEWhacker@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 11, 2020 at 09:26:03AM -0500, Joshua Watt wrote:
> The ELF files produced are in a subdirectory named by the build target
> (e.g. "bl31/bl31.elf") instead of the BUILD_PLAT directory.
> 
> Specifically allows this recipe to correctly install ATF for Rockchip
> RK3399

I don't think this is specific to Rockchip - for TI K3 platforms it is 
also bl31/bl31.elf

Acked-by: Denys Dmytriyenko <denys@ti.com>


> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc     | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> index 197ab92..2eade9f 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> @@ -100,9 +100,9 @@ do_install() {
>              echo "Install $atfbin.bin"
>              install -m 0644 $BUILD_PLAT/$atfbin.bin \
>                  ${D}/firmware/$atfbin-${TFA_PLATFORM}.bin
> -        elif [ -f $BUILD_PLAT/$atfbin.elf ]; then
> +        elif [ -f $BUILD_PLAT/$atfbin/$atfbin.elf ]; then
>              echo "Install $atfbin.elf"
> -            install -m 0644 $BUILD_PLAT/$atfbin.elf \
> +            install -m 0644 $BUILD_PLAT/$atfbin/$atfbin.elf \
>                  ${D}/firmware/$atfbin-${TFA_PLATFORM}.elf
>          elif [ -f $BUILD_PLAT/$atfbin ]; then
>              echo "Install $atfbin"
> -- 
> 2.17.1
> 

> 

