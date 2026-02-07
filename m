Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BFB2EE0AE0
	for <webhook@archiver.kernel.org>; Sat,  7 Feb 2026 14:06:33 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5337.1770473188466438369
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 07 Feb 2026 06:06:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 90F2240C86;
	Sat,  7 Feb 2026 14:06:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0uj_A2-xHimq; Sat,  7 Feb 2026 14:06:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6059A40A30;
	Sat,  7 Feb 2026 14:06:25 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 921961785D5; Sat,  7 Feb 2026 09:06:24 -0500 (EST)
Date: Sat, 7 Feb 2026 09:06:24 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: johannes.schneider@leica-geosystems.com
Cc: meta-arm@lists.yoctoproject.org, jon.mason@arm.com
Subject: Re: [meta-arm] [PATCH] meta-arm: fixup new override syntax usage
Message-ID: <20260207140624.GF11121@denix.org>
References: <20260207004109.2880231-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260207004109.2880231-1-johannes.schneider@leica-geosystems.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 07 Feb 2026 14:06:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6892

On Sat, Feb 07, 2026 at 12:41:09AM +0000, Johannes Schneider via lists.yoctoproject.org wrote:
> The placing of ' ' in combination with inline python variable
> expansion can lead to missing/skipping the license file checksum
> verification.

This technique is relied upon in so many places, the issue would have been 
noticed long ago, if it was the case.


> Fix this by using '+=' (which itself adds a space) instead of :append
> (which concatenates strings without inserting a space)
> 
> Fixes: 8dfdacd75c6c ("meta-arm: Convert to new override syntax")
> Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
> 
> ---
> 
> By chance we had an incorrect checksum set as
> meta-geosurv-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-leica_2.13.bb
> LIC_FILES_CHKSUM += "file://docs/license.rst;md5=83b7626b8c7a37263c6a58af8d19bee1"
> 
> Which 'bitbake -e' would resolve correctly:
> 
>  # $LIC_FILES_CHKSUM [3 operations]
>  #   set /workspace/layers/openembedded-core/meta/conf/documentation.conf:268
>  #     [doc] "Checksums of the license text in the recipe source code."
>  #   :append /workspace/layers/meta-arm/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc:57
>  #     "${@bb.utils.contains('TFA_MBEDTLS', '1', ' ${LIC_FILES_CHKSUM_MBEDTLS}', '', d)}"
>  #   append /workspace/layers/meta-geosurv-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-leica_2.13.bb:41
>  #     "file://docs/license.rst;md5=83b7626b8c7a37263c6a58af8d19bee1"
>  # pre-expansion value:
>  #   " file://docs/license.rst;md5=83b7626b8c7a37263c6a58af8d19bee1${@bb.utils.contains('TFA_MBEDTLS', '1', ' ${LIC_FILES_CHKSUM_MBEDTLS}', '', d)}"
>  LIC_FILES_CHKSUM=" file://docs/license.rst;md5=83b7626b8c7a37263c6a58af8d19bee1"
> 
> Note the missing space in the pre-expansion value.

The space is not missing, it is embedded in the ' ${LIC_FILES_CHKSUM_MBEDTLS}'
You should be able to check it by setting TFA_MBEDTLS=1 and running bitbake -e


> But the oe-core/meta/classes-global/license.bbclass check would miss.
> 
> This went unnoticed for a long time and over many clean-builds, as
> it would only very rarily raise the QA error.
> 
> Sidenote:
> I've looked over the meta-layer, but didn't spot any similar problems.
> 
> ---
>  .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc     | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> index 6a2c0da9..987b7a66 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> @@ -49,10 +49,10 @@ SRC_URI_MBEDTLS ??= ""
>  # This should be set to MBEDTLS LIC FILES checksum
>  LIC_FILES_CHKSUM_MBEDTLS ??= ""
>  # add MBEDTLS to our sources if activated
> -SRC_URI:append = " ${@bb.utils.contains('TFA_MBEDTLS', '1', '${SRC_URI_MBEDTLS}', '', d)}"

Here the space is always appended, as it's outside of the inline code section.


> +SRC_URI += "${@bb.utils.contains('TFA_MBEDTLS', '1', '${SRC_URI_MBEDTLS}', '', d)}"
>  # Update license variables
>  LICENSE:append = "${@bb.utils.contains('TFA_MBEDTLS', '1', ' & Apache-2.0', '', d)}"
> -LIC_FILES_CHKSUM:append = "${@bb.utils.contains('TFA_MBEDTLS', '1', ' ${LIC_FILES_CHKSUM_MBEDTLS}', '', d)}"

And here the space only gets appended, if the inline code returns true ^^^


> +LIC_FILES_CHKSUM += "${@bb.utils.contains('TFA_MBEDTLS', '1', '${LIC_FILES_CHKSUM_MBEDTLS}', '', d)}"
>  # add mbed TLS to version
>  SRCREV_FORMAT:append = "${@bb.utils.contains('TFA_MBEDTLS', '1', '_mbedtls', '', d)}"
> 
> 
> base-commit: be599f9523c5784904274cec12596ae31e20121f
> -- 
> 2.43.0

