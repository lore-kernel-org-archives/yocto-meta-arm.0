Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.360.1589219638779590958
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 May 2020 10:53:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2AF9E40C0F;
	Mon, 11 May 2020 17:53:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sd8a81SZA8Cg; Mon, 11 May 2020 17:53:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0D7F9409AA;
	Mon, 11 May 2020 17:53:57 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C43B8173134; Mon, 11 May 2020 13:53:56 -0400 (EDT)
Date: Mon, 11 May 2020 13:53:56 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm][PATCH 1/3] trusted-firmware-a: Build out of tree
Message-ID: <20200511175356.GM11927@denix.org>
References: <20200511142604.11860-1-JPEWhacker@gmail.com>
 <20200511142604.11860-2-JPEWhacker@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200511142604.11860-2-JPEWhacker@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 11, 2020 at 09:26:02AM -0500, Joshua Watt wrote:
> Use the BUILD_BASE variable to specify an out-of-tree build. Eliminates
> the need to set the TFA_BUILD_DIR.

Reviewed-by: Denys Dmytriyenko <denys@ti.com>


> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  .../trusted-firmware-a/trusted-firmware-a.inc | 31 ++++++++++---------
>  1 file changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> index 93ca199..197ab92 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> @@ -15,12 +15,7 @@ TFA_PLATFORM ?= "invalid"
>  # Build for debug (set TFA_DEBUG to 1 to activate)
>  TFA_DEBUG ?= "0"
>  
> -# Sub-directory in which to build.
> -# This must be coherent with BUILD_PLAT make parameter so that deploy can find
> -# the produced binaries
> -TFA_BUILD_DIR ?= "build-${TFA_PLATFORM}"
> -# set BUILD_PLAT depending on configured BUILD_DIR
> -EXTRA_OEMAKE += "BUILD_PLAT=${TFA_BUILD_DIR}"
> +B = "${WORKDIR}/build"
>  
>  # mbed TLS support (set TFA_MBEDTLS to 1 to activate)
>  TFA_MBEDTLS ?= "0"
> @@ -68,7 +63,7 @@ do_configure[noexec] = "1"
>  DEPENDS_append = " dtc-native openssl-native"
>  
>  # Add platform parameter
> -EXTRA_OEMAKE += "PLAT=${TFA_PLATFORM}"
> +EXTRA_OEMAKE += "BUILD_BASE=${B} PLAT=${TFA_PLATFORM}"
>  
>  # Handle TFA_DEBUG parameter
>  EXTRA_OEMAKE += "${@bb.utils.contains('TFA_DEBUG', '1', ' DEBUG=${TFA_DEBUG}', '', d)}"
> @@ -83,10 +78,16 @@ EXTRA_OEMAKE += "${@bb.utils.contains('TFA_UBOOT', '1', ' BL33=${DEPLOY_DIR_IMAG
>  
>  
>  do_compile() {
> -    oe_runmake ${TFA_BUILD_TARGET}
> +    (cd ${S} && oe_runmake ${TFA_BUILD_TARGET})
>  }
>  
>  do_install() {
> +    if ${@"true" if d.getVar('TFA_DEBUG') == '1' else "false"}; then
> +        BUILD_PLAT=${B}/${TFA_PLATFORM}/debug/
> +    else
> +        BUILD_PLAT=${B}/${TFA_PLATFORM}/release/
> +    fi
> +
>      install -d -m 755 ${D}/firmware
>      for atfbin in ${TFA_INSTALL_TARGET}; do
>          if [ "$atfbin" = "all" ]; then
> @@ -95,21 +96,21 @@ do_install() {
>              bberror "Please specify valid targets in TFA_INSTALL_TARGET or"
>              bberror "rewrite or turn off do_install"
>              exit 1
> -        elif [ -f ${S}/${TFA_BUILD_DIR}/$atfbin.bin ]; then
> +        elif [ -f $BUILD_PLAT/$atfbin.bin ]; then
>              echo "Install $atfbin.bin"
> -            install -m 0644 ${S}/${TFA_BUILD_DIR}/$atfbin.bin \
> +            install -m 0644 $BUILD_PLAT/$atfbin.bin \
>                  ${D}/firmware/$atfbin-${TFA_PLATFORM}.bin
> -        elif [ -f ${S}/${TFA_BUILD_DIR}/$atfbin.elf ]; then
> +        elif [ -f $BUILD_PLAT/$atfbin.elf ]; then
>              echo "Install $atfbin.elf"
> -            install -m 0644 ${S}/${TFA_BUILD_DIR}/$atfbin.elf \
> +            install -m 0644 $BUILD_PLAT/$atfbin.elf \
>                  ${D}/firmware/$atfbin-${TFA_PLATFORM}.elf
> -        elif [ -f ${S}/${TFA_BUILD_DIR}/$atfbin ]; then
> +        elif [ -f $BUILD_PLAT/$atfbin ]; then
>              echo "Install $atfbin"
> -            install -m 0644 ${S}/${TFA_BUILD_DIR}/$atfbin \
> +            install -m 0644 $BUILD_PLAT/$atfbin \
>                  ${D}/firmware/$atfbin-${TFA_PLATFORM}
>          elif [ "$atfbin" = "dtbs" ]; then
>              echo "dtbs install, skipped"
> -        elif [ -f ${S}/tools/$atfbin/$atfbin ]; then
> +        elif [ -f ${B}/tools/$atfbin/$atfbin ]; then
>              echo "Tools $atfbin install, skipped"
>          else
>              bberror "Unsupported TFA_INSTALL_TARGET target $atfbin"
> -- 
> 2.17.1
> 

> 

