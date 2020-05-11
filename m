Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.97.1589218904050931864
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 May 2020 10:41:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7ACF140C0F;
	Mon, 11 May 2020 17:41:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z2GuGfLYBSOT; Mon, 11 May 2020 17:41:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1A94340A46;
	Mon, 11 May 2020 17:41:42 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D3D81173134; Mon, 11 May 2020 13:41:41 -0400 (EDT)
Date: Mon, 11 May 2020 13:41:41 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm][PATCH 3/3] trusted-firmware-a: Add recipe for version 2.3
Message-ID: <20200511174141.GJ11927@denix.org>
References: <20200511142604.11860-1-JPEWhacker@gmail.com>
 <20200511142604.11860-4-JPEWhacker@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200511142604.11860-4-JPEWhacker@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 11, 2020 at 09:26:04AM -0500, Joshua Watt wrote:
> Adds a recipe for the 2.3 version of TF-A.

Why not upgrade?


> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  .../trusted-firmware-a_2.3.bb                 | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
> 
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
> new file mode 100644
> index 0000000..0b66d5e
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
> @@ -0,0 +1,25 @@
> +LIC_FILES_CHKSUM = "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89"
> +
> +SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa"
> +SRCREV_FORMAT = "tfa"
> +# Trusted firmware-A 2.3
> +SRCREV_tfa = "8ff55a9e14a23d7c7f89f52465bcc6307850aa33"
> +
> +#
> +# mbed TLS source
> +# Those are used in trusted-firmware-a.inc if TFA_MBEDTLS is set to 1
> +#
> +
> +LIC_FILES_CHKSUM_MBEDTLS += " \
> +    file://mbedtls/apache-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57 \
> +    file://mbedtls/LICENSE;md5=302d50a6369f5f22efdb674db908167a \
> +    "
> +
> +SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls"
> +# mbed TLS v2.16.2
> +SRCREV_mbedtls = "d81c11b8ab61fd5b2da8133aa73c5fe33a0633eb"
> +
> +S = "${WORKDIR}/git"
> +
> +require trusted-firmware-a.inc
> +
> -- 
> 2.17.1
> 

> 

