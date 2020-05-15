Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.4894.1589503427105868536
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 14 May 2020 17:43:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 74BDA40C1D;
	Fri, 15 May 2020 00:43:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ftcs7Y1mVPdi; Fri, 15 May 2020 00:43:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4CD0640A46;
	Fri, 15 May 2020 00:43:44 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 10036173169; Thu, 14 May 2020 20:43:44 -0400 (EDT)
Date: Thu, 14 May 2020 20:43:44 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org, Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [meta-arm] [PATCH] arm-toolchain: gcc-arm-none-eabi-native: Add recipe
Message-ID: <20200515004344.GA11927@denix.org>
References: <20200514140646.26519-1-jdmason@kudzu.us>
MIME-Version: 1.0
In-Reply-To: <20200514140646.26519-1-jdmason@kudzu.us>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 14, 2020 at 10:06:46AM -0400, Jon Mason wrote:
> Adds a recipe to pull down the prebuilt GCC for compiling on Cortex-R
> and Cortex-M processors from ARM. This toolchain is required to build
> Arm Trusted Firmware for the Rockchip rk3399 SoC, since it must compile
> some firmware for the M0 coprocessor.
> 
> This was originally taken from meta-rockchip, but has been modified from
> mailing list feedback.
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> ---
>  ...cc-arm-none-eabi-native_9-2019-q4-major.bb | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi-native_9-2019-q4-major.bb
> 
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi-native_9-2019-q4-major.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi-native_9-2019-q4-major.bb
> new file mode 100644
> index 0000000..f1c0cff
> --- /dev/null
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi-native_9-2019-q4-major.bb
> @@ -0,0 +1,39 @@
> +# Copyright (C) 2019 Garmin Ltd. or its subsidaries
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +DESCRIPTION = "Baremetal GCC for ARM-R and ARM-M processors"

Should this be SUMMARY?


> +LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> +
> +LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=c18349634b740b7b95f2c2159af888f5"
> +
> +PROVIDES = "virtual/arm-none-eabi-gcc"
> +
> +SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/${BPN}-${PV}-x86_64-linux.tar.bz2"
> +
> +SRC_URI[md5sum] = "fe0029de4f4ec43cf7008944e34ff8cc"
> +SRC_URI[sha256sum] = "bcd840f839d5bf49279638e9f67890b2ef3a7c9c7a9b25271e83ec4ff41d177a"
> +
> +S = "${WORKDIR}/${BPN}-${PV}"
> +
> +inherit native

Is this needed with BBCLASSEXTEND?


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
> +    done
> +}
> +
> +INSANE_SKIP_${PN} = "already-stripped"

Requires FILES_${PN}, since this can now be a proper nativesdk package.
Also, probably will need more INSANE_SKIP for nativesdk package as well...


> +INHIBIT_SYSROOT_STRIP = "1"
> +INHIBIT_PACKAGE_STRIP = "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> +
> +BBCLASSEXTEND = "native nativesdk"
> -- 
> 2.20.1
> 

> 

