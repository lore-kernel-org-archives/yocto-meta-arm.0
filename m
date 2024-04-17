Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 871F4C4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 20:12:25 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.24315.1713384739105061194
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Apr 2024 13:12:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6C0C940C7B;
	Wed, 17 Apr 2024 20:12:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RWapKa8J1xUT; Wed, 17 Apr 2024 20:12:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6A69C40C2A;
	Wed, 17 Apr 2024 20:12:13 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3DDC0163F22; Wed, 17 Apr 2024 16:12:13 -0400 (EDT)
Date: Wed, 17 Apr 2024 16:12:13 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Vasyl Vavrychuk <vvavrychuk@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 2/3] external-arm-toolchain: in libc.so GNU
 ld script use base_libdir
Message-ID: <20240417201213.GU28791@denix.org>
References: <20240417113042.91880-1-vvavrychuk@gmail.com>
 <20240417113042.91880-3-vvavrychuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240417113042.91880-3-vvavrychuk@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 17 Apr 2024 20:12:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5562

On Wed, Apr 17, 2024 at 02:30:41PM +0300, Vasyl Vavrychuk wrote:
> `base_libdir` gets replaced with `/lib` or `/usr/lib` depending on
> `usrmerge` distro feature.
> 
> Signed-off-by: Vasyl Vavrychuk <vvavrychuk@gmail.com>
> ---
>  .../external-arm-toolchain/external-arm-toolchain.bb          | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> index 27aadffd..ab608128 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> @@ -207,9 +207,9 @@ do_install() {
>  	rm -rf ${D}${includedir}/rpcsvc/rquota.*
>  
>  	if [ -f ${D}${libdir}/libc.so ];then
> -		sed -i -e "s# /${EAT_LIBDIR}/${EAT_TARGET_SYS}# ../../${EAT_LIBDIR}#g" -e "s# /usr/${EAT_LIBDIR}/# /usr/lib/#g" -e "s# /usr/${EAT_LIBDIR}/${EAT_TARGET_SYS}# .#g" -e "s# /${EAT_LIBDIR}/ld-linux# ../../${EAT_LIBDIR}/ld-linux#g" ${D}${libdir}/libc.so
> +		sed -i -e "s# /${EAT_LIBDIR}/${EAT_TARGET_SYS}# ../../${EAT_LIBDIR}#g" -e "s# /usr/${EAT_LIBDIR}/# /usr/lib/#g" -e "s# /usr/${EAT_LIBDIR}/${EAT_TARGET_SYS}# .#g" -e "s# /${EAT_LIBDIR}/ld-linux# ../../${base_libdir}/ld-linux#g" ${D}${libdir}/libc.so

Here ^^^ it's not clear why only the last of the sed replacements gets 
updated, not all of them?


>  		sed -i -e "s# /${EAT_LIBDIR}/libc.so.6# /lib/libc.so.6#g" ${D}${libdir}/libc.so
> -		sed -i -e "s# /lib# ../../lib#g" -e "s# /usr/lib# .#g" ${D}${libdir}/libc.so
> +		sed -i -e "s# /lib# ../../${base_libdir}#g" -e "s# /usr/lib# .#g" ${D}${libdir}/libc.so
>  	fi
>  
>  	if [ -f ${D}${base_libdir}/libc.so ];then
> -- 
> 2.40.0
> 

