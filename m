Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.13314.1591935302761242773
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Jun 2020 21:15:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 17B6840C37;
	Fri, 12 Jun 2020 04:15:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jc8ypGfRVO96; Fri, 12 Jun 2020 04:15:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1841240A46;
	Fri, 12 Jun 2020 04:14:53 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5437D173217; Fri, 12 Jun 2020 00:14:53 -0400 (EDT)
Date: Fri, 12 Jun 2020 00:14:53 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, pbarker@konsulko.com, wmills@ti.com,
	richard.purdie@linuxfoundation.org, daniel.thompson@linaro.org
Subject: Re: [meta-arm] [PATCH v2 1/5] external-arm-toolchain: Remove glibc locale dependency
Message-ID: <20200612041453.GH17660@denix.org>
References: <1591796582-5015-1-git-send-email-sumit.garg@linaro.org>
 <1591796582-5015-2-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1591796582-5015-2-git-send-email-sumit.garg@linaro.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 10, 2020 at 07:12:58PM +0530, Sumit Garg wrote:
> Currently external Arm toolchain recipe doesn't provide packages
> corresponding to OE glibc locale recipe. So explicitly remove corresponding
> libc dependencies until we sort out glibc locale packaging rather than
> blocking OE SDK generation which is still useful without glibc locale
> packaging.

I guess we can merge this one for now with the idea of getting back to it 
later and trying to properly package gconv libs and locales.

> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>

Reviewed-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> index 9171380..eee1a51 100644
> --- a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> +++ b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> @@ -58,6 +58,7 @@ DISTRO_FEATURES_LIBC = "ipv4 ipv6 libc-backtrace libc-big-macros libc-bsd libc-c
>  ENABLE_BINARY_LOCALE_GENERATION = "0"
>  GLIBC_INTERNAL_USE_BINARY_LOCALE = "precompiled"
>  LIBCOVERRIDE = ":libc-glibc"
> +LIBC_DEPENDENCIES_remove = "glibc-gconv-cp1252 glibc-gconv-ibm850 glibc-gconv-iso8859-1 glibc-gconv-iso8859-15 glibc-localedata-i18n"

BTW, avoiding _remove would require adding intermediary variable to OE-Core 
just for this sub-list in order to clear it out downstream...


>  ERROR_QA[type] ?= "list"
>  python toolchain_metadata_setup () {
> -- 
> 2.7.4
> 

> 

