Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F22C4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 20:07:05 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.24196.1713384415420752772
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Apr 2024 13:06:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 85EF440C7B;
	Wed, 17 Apr 2024 20:06:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HuoEhPUR8HtP; Wed, 17 Apr 2024 20:06:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 04C6B40A0B;
	Wed, 17 Apr 2024 20:06:50 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0C3FE163F22; Wed, 17 Apr 2024 16:06:50 -0400 (EDT)
Date: Wed, 17 Apr 2024 16:06:50 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Vasyl Vavrychuk <vvavrychuk@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/3] external-arm-toolchain: wrap
 base_libdir vs libdir manipulations under usrmerge check
Message-ID: <20240417200650.GT28791@denix.org>
References: <20240417113042.91880-1-vvavrychuk@gmail.com>
 <20240417113042.91880-2-vvavrychuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240417113042.91880-2-vvavrychuk@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 17 Apr 2024 20:07:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5561

On Wed, Apr 17, 2024 at 02:30:40PM +0300, Vasyl Vavrychuk wrote:
> With `usrmerge` disto feature `base_libdir` and `libdir` are the same,
> so it does not make sense to:
> 
> * removing "duplicates" between them
> * move files from `base_libdir` to `libdir`
> 
> This fixes build error
> 
> | mv: '.../tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/external-arm-toolchain/12.2.Rel1/image/usr/lib/libasan.a' and '.../tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/external-arm-toolchain/12.2.Rel1/image/usr/lib/libasan.a' are the same file
> 
> in case of `usrmerge` feature enabled.
> 
> Signed-off-by: Vasyl Vavrychuk <vvavrychuk@gmail.com>

Acked-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  .../external-arm-toolchain.bb                 | 62 ++++++++++---------
>  1 file changed, 32 insertions(+), 30 deletions(-)
> 
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> index fab17611..27aadffd 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> @@ -135,37 +135,39 @@ do_install() {
>  	ln -sf ../../lib/libm.so.6 ${D}${libdir}/libm.so
>  	ln -sf ../../lib/libc_malloc_debug.so.0 ${D}${libdir}/libc_malloc_debug.so
>  
> -	# remove potential .so duplicates from base_libdir
> -	# for all symlinks created above in libdir
> -	rm -f ${D}${base_libdir}/librt.so
> -	rm -f ${D}${base_libdir}/libcrypt.so
> -	rm -f ${D}${base_libdir}/libresolv.so
> -	rm -f ${D}${base_libdir}/libnss_hesiod.so
> -	rm -f ${D}${base_libdir}/libutil.so
> -	rm -f ${D}${base_libdir}/libBrokenLocale.so
> -	rm -f ${D}${base_libdir}/libpthread.so
> -	rm -f ${D}${base_libdir}/libthread_db.so
> -	rm -f ${D}${base_libdir}/libanl.so
> -	rm -f ${D}${base_libdir}/libdl.so
> -	rm -f ${D}${base_libdir}/libnss_db.so
> -	rm -f ${D}${base_libdir}/libnss_dns.so
> -	rm -f ${D}${base_libdir}/libnss_files.so
> -	rm -f ${D}${base_libdir}/libnss_compat.so
> -	rm -f ${D}${base_libdir}/libm.so
> -
> -	# Move these completely to ${libdir} and delete duplicates in ${base_libdir}
> -	for lib in asan hwasan atomic gfortran gomp itm lsan sanitizer stdc++ tsan ubsan; do
> -		if [ -e ${D}${base_libdir}/lib${lib}.spec ] ; then
> -			mv ${D}${base_libdir}/lib${lib}.spec ${D}${libdir}
> -		fi
> -		if [ -e ${D}${base_libdir}/lib${lib}.a ] ; then
> -			mv ${D}${base_libdir}/lib${lib}.a ${D}${libdir}
> -		fi
> -		rm -f ${D}${base_libdir}/lib${lib}*
> -	done
> +	if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'false', 'true', d)}; then
> +		# remove potential .so duplicates from base_libdir
> +		# for all symlinks created above in libdir
> +		rm -f ${D}${base_libdir}/librt.so
> +		rm -f ${D}${base_libdir}/libcrypt.so
> +		rm -f ${D}${base_libdir}/libresolv.so
> +		rm -f ${D}${base_libdir}/libnss_hesiod.so
> +		rm -f ${D}${base_libdir}/libutil.so
> +		rm -f ${D}${base_libdir}/libBrokenLocale.so
> +		rm -f ${D}${base_libdir}/libpthread.so
> +		rm -f ${D}${base_libdir}/libthread_db.so
> +		rm -f ${D}${base_libdir}/libanl.so
> +		rm -f ${D}${base_libdir}/libdl.so
> +		rm -f ${D}${base_libdir}/libnss_db.so
> +		rm -f ${D}${base_libdir}/libnss_dns.so
> +		rm -f ${D}${base_libdir}/libnss_files.so
> +		rm -f ${D}${base_libdir}/libnss_compat.so
> +		rm -f ${D}${base_libdir}/libm.so
> +
> +		# Move these completely to ${libdir} and delete duplicates in ${base_libdir}
> +		for lib in asan hwasan atomic gfortran gomp itm lsan sanitizer stdc++ tsan ubsan; do
> +			if [ -e ${D}${base_libdir}/lib${lib}.spec ] ; then
> +				mv ${D}${base_libdir}/lib${lib}.spec ${D}${libdir}
> +			fi
> +			if [ -e ${D}${base_libdir}/lib${lib}.a ] ; then
> +				mv ${D}${base_libdir}/lib${lib}.a ${D}${libdir}
> +			fi
> +			rm -f ${D}${base_libdir}/lib${lib}*
> +		done
>  
> -	# Clean up duplicate libs that are both in base_libdir and libdir
> -	rm -f ${D}${libdir}/libgcc*
> +		# Clean up duplicate libs that are both in base_libdir and libdir
> +		rm -f ${D}${libdir}/libgcc*
> +	fi
>  
>  	# Besides ld-${EAT_VER_LIBC}.so, other libs can have duplicates like lib*-${EAT_VER_LIBC}.so
>  	# Only remove them if both are regular files and are identical
> -- 
> 2.40.0

