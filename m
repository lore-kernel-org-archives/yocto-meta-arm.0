Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.21080.1591296150908766627
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 Jun 2020 11:42:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1EC1040C2E;
	Thu,  4 Jun 2020 18:42:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bWJoFhIbqYbh; Thu,  4 Jun 2020 18:42:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id ACB2540B53;
	Thu,  4 Jun 2020 18:42:25 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2E81517320C; Thu,  4 Jun 2020 14:42:25 -0400 (EDT)
Date: Thu, 4 Jun 2020 14:42:25 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, pbarker@konsulko.com, wmills@ti.com,
	daniel.thompson@linaro.org
Subject: Re: [PATCH 2/4] external-arm-toolchain: Refine dev libraies packaging
Message-ID: <20200604184225.GE17660@denix.org>
References: <1591095894-15178-1-git-send-email-sumit.garg@linaro.org>
 <1591095894-15178-3-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1591095894-15178-3-git-send-email-sumit.garg@linaro.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 02, 2020 at 04:34:52PM +0530, Sumit Garg wrote:
> OE core by default package all libraies installed as "${libdir}/lib*.so"
> or "${libdir}/*.la" as part of "FILES_${PN}-dev" but in case of external
> Arm tool-set recipe, multiple packages are provided which needs to
> include specific libraries. So split dev libraries packaging accordingly
> and only package remaining libraries as part of "FILES_${PN}-dev" which
> aren't provided as part of other packages.
> 
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  .../external-arm-toolchain.bb                      | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> index 04d8923..7f5a6f5 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> @@ -545,6 +545,29 @@ FILES_${PN} += "\
>  	${base_libdir}/libpcprofile.so \
>      "
>  
> +FILES_${PN}-dev_remove = "\

Shouldn't be using _remove here. It will probably break anyones .bbappends on 
this recipe and will make it hard making any adjustments.

If you check git logs, you'll see that every time we needed to change the 
default lists defined by glibc-package.inc in OE-Core, we had to re-create 
them from scratch.


> +	${libdir}/lib*.so \
> +	${libdir}/*.la \
> +    "
> +FILES_${PN}-dev += "\
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
