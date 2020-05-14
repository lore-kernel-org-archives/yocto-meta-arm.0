Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.6513.1589430317159389761
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 May 2020 21:25:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 35DA540C15;
	Thu, 14 May 2020 04:25:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id McP6QXDuzHqz; Thu, 14 May 2020 04:25:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F1FB1403F2;
	Thu, 14 May 2020 04:25:13 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C674717314B; Thu, 14 May 2020 00:25:13 -0400 (EDT)
Date: Thu, 14 May 2020 00:25:13 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org, Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [meta-arm] [PATCH] arm-toolchain: gcc-arm-none-eabi-native: Add recipe
Message-ID: <20200514042513.GY11927@denix.org>
References: <20200514024932.19962-1-jdmason@kudzu.us>
MIME-Version: 1.0
In-Reply-To: <20200514024932.19962-1-jdmason@kudzu.us>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 13, 2020 at 10:49:32PM -0400, Jon Mason wrote:
> Adds a recipe to pull down the prebuilt GCC for compiling on Cortex-R
> and Cortex-M processors from ARM. This toolchain is required to build
> Arm Trusted Firmware for the Rockchip rk3399 SoC, since it must compile
> some firmware for the M0 coprocessor.
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> ---
>  ...cc-arm-none-eabi-native_9-2019-q4-major.bb | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-none-eabi-native_9-2019-q4-major.bb

Why does it have "major" in the version? I know we (TI) previosuly had 
"update" there, but if we are trying to unify, let's do it properly.

Another issue - one of our recipes had native and nativesdk support. This 
seems to be only native.


> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-none-eabi-native_9-2019-q4-major.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-none-eabi-native_9-2019-q4-major.bb
> new file mode 100644
> index 0000000..a0c832d
> --- /dev/null
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-none-eabi-native_9-2019-q4-major.bb
> @@ -0,0 +1,37 @@
> +# Copyright (C) 2019 Garmin Ltd. or its subsidaries

Ouch!


> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +DESCRIPTION = "Baremetal GCC for ARM-R and ARM-M processors"
> +LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> +
> +LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=c18349634b740b7b95f2c2159af888f5"
> +
> +PROVIDES = "virtual/arm-none-eabi-gcc"
> +
> +SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/RC2.1/${BPN}-${PV}-x86_64-linux.tar.bz2"

This doesn't seem like a final release, does it?


> +SRC_URI[md5sum] = "fe0029de4f4ec43cf7008944e34ff8cc"
> +SRC_URI[sha256sum] = "bcd840f839d5bf49279638e9f67890b2ef3a7c9c7a9b25271e83ec4ff41d177a"
> +
> +S = "${WORKDIR}/${BPN}-${PV}"
> +
> +inherit native

BBCLASSEXTEND?


> +COMPATIBLE_HOST = "x86_64.*-linux"
> +
> +do_install() {
> +    install -d ${D}${datadir}/arm-none-eabi/
> +    cp -r ${S}/. ${D}${datadir}/arm-none-eabi/
> +
> +    install -d ${D}${bindir}
> +    # Symlink all executables into bindir
> +    for f in ${D}${datadir}/arm-none-eabi/bin/arm-none-eabi-*; do
> +        lnr $f ${D}${bindir}/$(basename $f)

What the hell is "lnr"? :) What am I missing?

 
> +    done
> +}
> +
> +INSANE_SKIP_${PN} = "already-stripped"
> +
> +INHIBIT_SYSROOT_STRIP = "1"
> +INHIBIT_PACKAGE_STRIP = "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> -- 
> 2.20.1
> 

> 

