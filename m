Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.7123.1604452689991246857
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 Nov 2020 17:18:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EEC6340B2D;
	Wed,  4 Nov 2020 01:18:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HHlylChyZLMR; Wed,  4 Nov 2020 01:18:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D38C140AFF;
	Wed,  4 Nov 2020 01:18:07 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2F7F41744E0; Tue,  3 Nov 2020 20:18:07 -0500 (EST)
Date: Tue, 3 Nov 2020 20:18:07 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 4/7] arm/optee-client: rewrite recipe
Message-ID: <20201104011807.GC19155@denix.org>
References: <20201102153341.2844482-1-ross.burton@arm.com>
 <20201102153341.2844482-4-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201102153341.2844482-4-ross.burton@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 02, 2020 at 03:33:38PM +0000, Ross Burton wrote:
> The license is 2-clause BSD, so specify that precisely.
> 
> No need to inherit python3native as it is not used.
> 
> Instead of using the bare Makefile build, use CMake.
> 
> Change-Id: I324f633428f10fdaabaa57b2f2561c2fdc847919
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../recipes-security/optee/optee-client.inc   | 35 +++----------------
>  1 file changed, 5 insertions(+), 30 deletions(-)
> 
> diff --git a/meta-arm/recipes-security/optee/optee-client.inc b/meta-arm/recipes-security/optee/optee-client.inc
> index d82392c..26f9724 100644
> --- a/meta-arm/recipes-security/optee/optee-client.inc
> +++ b/meta-arm/recipes-security/optee/optee-client.inc
> @@ -2,12 +2,10 @@ SUMMARY = "OP-TEE Client API"
>  DESCRIPTION = "Open Portable Trusted Execution Environment - Normal World Client side of the TEE"
>  HOMEPAGE = "https://www.op-tee.org/"
>  
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=69663ab153298557a59c67a60a743e5b"
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=69663ab153298557a59c67a60a743e5b"
>  
> -require optee.inc

Was this a mistake?


> -
> -inherit python3native systemd update-rc.d
> +inherit systemd update-rc.d cmake
>  
>  SRC_URI = " \
>      git://github.com/OP-TEE/optee_client.git \
> @@ -16,31 +14,11 @@ SRC_URI = " \
>  "
>  
>  S = "${WORKDIR}/git"
> -B = "${WORKDIR}/build"
> -
> -EXTRA_OEMAKE = "O=${B}"
> -
> -do_compile() {
> -    cd ${S}
> -    oe_runmake
> -}
> -do_compile[cleandirs] = "${B}"
> -
> -do_install() {
> -    cd ${S}
> -    oe_runmake install
> -
> -    install -D -p -m0755 ${B}/export/usr/sbin/tee-supplicant ${D}${sbindir}/tee-supplicant
>  
> -    install -D -p -m0644 ${B}/export/usr/lib/libteec.so.1.0 ${D}${libdir}/libteec.so.1.0
> -    ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so
> -    ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so.1
> -
> -    install -d ${D}${includedir}
> -    install -p -m0644 ${B}/export/usr/include/*.h ${D}${includedir}
> +EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON"
>  
> +do_install_append() {
>      install -D -p -m0644 ${WORKDIR}/tee-supplicant.service ${D}${systemd_system_unitdir}/tee-supplicant.service
> -
>      install -D -p -m0755 ${WORKDIR}/tee-supplicant.sh ${D}${sysconfdir}/init.d/tee-supplicant
>  
>      sed -i -e s:@sysconfdir@:${sysconfdir}:g \
> @@ -52,8 +30,5 @@ do_install() {
>  SYSTEMD_SERVICE_${PN} = "tee-supplicant.service"
>  
>  INITSCRIPT_PACKAGES = "${PN}"
> -
>  INITSCRIPT_NAME_${PN} = "tee-supplicant"
>  INITSCRIPT_PARAMS_${PN} = "start 10 1 2 3 4 5 . stop 90 0 6 ."
> -
> -
> -- 
> 2.25.1
> 

> 
> 
> 

