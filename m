Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57C93C4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 20:13:25 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.24336.1713384798119422811
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Apr 2024 13:13:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7A44940C7B;
	Wed, 17 Apr 2024 20:13:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rT5anLPXTG8K; Wed, 17 Apr 2024 20:13:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 80C9140C2A;
	Wed, 17 Apr 2024 20:13:13 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4CABC163F22; Wed, 17 Apr 2024 16:13:13 -0400 (EDT)
Date: Wed, 17 Apr 2024 16:13:13 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Vasyl Vavrychuk <vvavrychuk@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 3/3] external-arm-toolchain: remove
 ${base_libdir}/libpthread*.so from FILES:${PN}
Message-ID: <20240417201313.GV28791@denix.org>
References: <20240417113042.91880-1-vvavrychuk@gmail.com>
 <20240417113042.91880-4-vvavrychuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240417113042.91880-4-vvavrychuk@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 17 Apr 2024 20:13:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5563

On Wed, Apr 17, 2024 at 02:30:42PM +0300, Vasyl Vavrychuk wrote:
> When `usrmerge` distro feature is not enabled, then `${base_libdir}`
> resolves to `/lib` and `/lib/libpthread*.so` does not match any files.
> But, with `usrmerge` distro feature, `${base_libdir}` is `/usr/lib`, so
> removed line leads to `/usr/lib/libpthread.so` symlink included in
> `${PN}` which causes QA check failure.
> 
> Signed-off-by: Vasyl Vavrychuk <vvavrychuk@gmail.com>

Acked-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  .../external-arm-toolchain/external-arm-toolchain.bb             | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> index ab608128..f0955b29 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> @@ -528,7 +528,6 @@ FILES:${PN} += "\
>  	${base_libdir}/ld*.so.* \
>  	${base_libdir}/ld-*.so \
>  	${base_libdir}/libpthread*.so.* \
> -	${base_libdir}/libpthread*.so \
>  	${base_libdir}/libpthread-*.so \
>  	${base_libdir}/libresolv*.so.* \
>  	${base_libdir}/libresolv-*.so \
> -- 
> 2.40.0

