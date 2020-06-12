Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.13396.1591935798896655341
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Jun 2020 21:23:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4371840C37;
	Fri, 12 Jun 2020 04:23:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lfSxw1OGB7cg; Fri, 12 Jun 2020 04:23:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 196F740A46;
	Fri, 12 Jun 2020 04:23:12 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id CBF6D173217; Fri, 12 Jun 2020 00:23:11 -0400 (EDT)
Date: Fri, 12 Jun 2020 00:23:11 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, pbarker@konsulko.com, wmills@ti.com,
	richard.purdie@linuxfoundation.org, daniel.thompson@linaro.org
Subject: Re: [PATCH v2 2/5] external-arm-toolchain: Refine dev libraries/headers packaging
Message-ID: <20200612042311.GI17660@denix.org>
References: <1591796582-5015-1-git-send-email-sumit.garg@linaro.org>
 <1591796582-5015-3-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1591796582-5015-3-git-send-email-sumit.garg@linaro.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 10, 2020 at 07:12:59PM +0530, Sumit Garg wrote:
> OE core by default package all libraries/headers installed as
> "${libdir}/lib*.so", "${libdir}/*.la" and {includedir} as part of
> FILES_${PN}-dev" but in case of external Arm toolchain recipe, multiple
> packages are provided which needs to include specific libraries and
> headers. So define "FILES_${PN}-dev" from scratch in order to package
> dev libraries/headers as part of intended packages and only package
> remaining libraries/headers as part of "FILES_${PN}-dev".

This is probably fine, but have you considered/tried re-ordering list of 
PACKAGES, moving ${PN}-dev to the end? That way it would let other packages 
to pick up their files before collecting the remainder. Not sure, but I wonder 
if that would be any cleaner...


> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  .../external-arm-toolchain.bb                      | 48 ++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> index 8cfc208..5d9a0a8 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> @@ -546,6 +546,54 @@ FILES_${PN} += "\
>  	${base_libdir}/libpcprofile.so \
>      "
>  
> +FILES_${PN}-dev = "\
> +	${includedir}/*.h \
> +	${includedir}/netatalk/ \
> +	${includedir}/netiucv/ \
> +	${includedir}/neteconet/ \
> +	${includedir}/nfs/ \
> +	${includedir}/rpcsvc/ \
> +	${includedir}/netipx/ \
> +	${includedir}/misc/ \
> +	${includedir}/rpc/ \
> +	${includedir}/sys/ \
> +	${includedir}/netrose/ \
> +	${includedir}/arpa/ \
> +	${includedir}/netinet/ \
> +	${includedir}/netrom/ \
> +	${includedir}/finclude/ \
> +	${includedir}/netax25/ \
> +	${includedir}/netash/ \
> +	${includedir}/bits/ \
> +	${includedir}/xen/ \
> +	${includedir}/netpacket/ \
> +	${includedir}/drm/ \
> +	${includedir}/net/ \
> +	${includedir}/protocols/ \
> +	${includedir}/gnu/ \
> +	${base_libdir}/*_nonshared.a \
> +	${base_libdir}/*.o \
> +	${datadir}/aclocal \
> +	${libdir}/*.o \
> +	${libdir}/*_nonshared.a \
> +	${libdir}/libcrypt.so \
> +	${libdir}/libc.so \
> +	${libdir}/libm.so \
> +	${libdir}/libpthread.so \
> +	${libdir}/libresolv.so \
> +	${libdir}/librt.so \
> +	${libdir}/libutil.so \
> +	${libdir}/libnss_files.so \
> +	${libdir}/libnss_compat.so \
> +	${libdir}/libnss_dns.so \
> +	${libdir}/libnss_hesiod.so \
> +	${libdir}/libnss_db.so \
> +	${libdir}/libdl.so \
> +	${libdir}/libanl.so \
> +	${libdir}/libBrokenLocale.so \
> +	${libdir}/libthread_db.so \
> +    "
> +
>  FILES_${PN}-dbg += "${base_libdir}/debug"
>  
>  # From gcc-runtime.inc
> -- 
> 2.7.4
> 
