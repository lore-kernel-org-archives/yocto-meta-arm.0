Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F76CE6F083
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 18:55:34 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1985.1730487325183677910
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 01 Nov 2024 11:55:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7B64D4126D;
	Fri,  1 Nov 2024 18:55:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bjMNnoW7GGT0; Fri,  1 Nov 2024 18:55:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4FF8E4126C;
	Fri,  1 Nov 2024 18:55:22 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0E93A1640C3; Fri,  1 Nov 2024 14:55:22 -0400 (EDT)
Date: Fri, 1 Nov 2024 14:55:22 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: romain.naour@smile.fr
Cc: meta-arm@lists.yoctoproject.org, jon.mason@arm.com
Subject: Re: [meta-arm] [PATCH v2 1/8] external-arm-toolchain: remove old
 sed fixup for libc.so
Message-ID: <20241101185522.GJ20070@denix.org>
References: <20241025165002.2794821-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025165002.2794821-1-romain.naour@smile.fr>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 01 Nov 2024 18:55:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6239

FYI, Ross and I discussed the whole external toolchain support a while back 
and we were under the impression that there were no users of it and he was 
planning to deprecate the entire external toolchain support after Styhead was 
out. I wonder if your patchset changes the plans...

Either way, I reviewed your patches and they seem reasonable. I currently 
don't have an active setup with external toolchain, so was not able to do any 
testing yet.

If Jon is willing to run these through the CI paces, I won't mind giving my 
Reviewed-by: stamp.

-- 
Denys


On Fri, Oct 25, 2024 at 06:49:55PM +0200, Romain Naour via lists.yoctoproject.org wrote:
> As reported by Vasyl Vavrychuk [1], /${EAT_LIBDIR}/${EAT_TARGET_SYS}
> is not present in libc.so in the latest prebuilt toolchains:
> 
> ARM32:
>   $ cat ./gcc-arm-8.3-2019.03-x86_64-arm-linux-gnueabihf/arm-linux-gnueabihf/libc/usr/lib/libc.so
>   OUTPUT_FORMAT(elf32-littlearm)
>   GROUP ( /lib/libc.so.6 /usr/lib/libc_nonshared.a  AS_NEEDED ( /lib/ld-linux-armhf.so.3 ) )
> 
>   $ cat ./gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf/arm-none-linux-gnueabihf/libc/usr/lib/libc.so
>   OUTPUT_FORMAT(elf32-littlearm)
>   GROUP ( /lib/libc.so.6 /usr/lib/libc_nonshared.a  AS_NEEDED ( /lib/ld-linux-armhf.so.3 ) )
> 
>   $ cat ./arm-gnu-toolchain-12.3.rel1-x86_64-arm-none-linux-gnueabihf/arm-none-linux-gnueabihf/libc/usr/lib/libc.so
>   OUTPUT_FORMAT(elf32-littlearm)
>   GROUP ( /lib/libc.so.6 /usr/lib/libc_nonshared.a  AS_NEEDED ( /lib/ld-linux-armhf.so.3 ) )
> 
>   $ cat ./arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-linux-gnueabihf/arm-none-linux-gnueabihf/libc/usr/lib/libc.so
>   OUTPUT_FORMAT(elf32-littlearm)
>   GROUP ( /lib/libc.so.6 /usr/lib/libc_nonshared.a  AS_NEEDED ( /lib/ld-linux-armhf.so.3 ) )
> 
> Aarch64:
>   $ cat ./gcc-linaro-7.3.1-2018.05-x86_64_aarch64-linux-gnu/aarch64-linux-gnu/libc/usr/lib/libc.so
>   OUTPUT_FORMAT(elf64-littleaarch64)
>   GROUP ( /lib/libc.so.6 /usr/lib/libc_nonshared.a  AS_NEEDED ( /lib/ld-linux-aarch64.so.1 ) )
> 
>   $ cat ./gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/lib64/libc.so
>   OUTPUT_FORMAT(elf64-littleaarch64)
>   GROUP ( /lib64/libc.so.6 /usr/lib64/libc_nonshared.a  AS_NEEDED ( /lib/ld-linux-aarch64.so.1 ) )
> 
>   $ cat ./arm-gnu-toolchain-12.3.rel1-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/lib64/libc.so
>   OUTPUT_FORMAT(elf64-littleaarch64)
>   GROUP ( /lib64/libc.so.6 /usr/lib64/libc_nonshared.a  AS_NEEDED ( /lib/ld-linux-aarch64.so.1 ) )
> 
>   $ cat ./arm-gnu-toolchain-13.3.rel1-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/lib64/libc.so
>   OUTPUT_FORMAT(elf64-littleaarch64)
>   GROUP ( /lib64/libc.so.6 /usr/lib64/libc_nonshared.a  AS_NEEDED ( /lib/ld-linux-aarch64.so.1 ) )
> 
> We can safely remove old sed fixup for libc.so.
> 
> [1] https://lists.yoctoproject.org/g/meta-arm/message/5565
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  .../external-arm-toolchain/external-arm-toolchain.bb          | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> index 1e8c1116..1095736b 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> @@ -213,13 +213,13 @@ do_install() {
>  	rm -rf ${D}${includedir}/rpcsvc/rquota.*
>  
>  	if [ -f ${D}${libdir}/libc.so ];then
> -		sed -i -e "s# /${EAT_LIBDIR}/${EAT_TARGET_SYS}# ../../${EAT_LIBDIR}#g" -e "s# /usr/${EAT_LIBDIR}/# /usr/lib/#g" -e "s# /usr/${EAT_LIBDIR}/${EAT_TARGET_SYS}# .#g" -e "s# /${EAT_LIBDIR}/ld-linux# ../../${EAT_LIBDIR}/ld-linux#g" ${D}${libdir}/libc.so
> +		sed -i -e "s# /usr/${EAT_LIBDIR}/# /usr/lib/#g" -e "s# /${EAT_LIBDIR}/ld-linux# ../../${EAT_LIBDIR}/ld-linux#g" ${D}${libdir}/libc.so
>  		sed -i -e "s# /${EAT_LIBDIR}/libc.so.6# /lib/libc.so.6#g" ${D}${libdir}/libc.so
>  		sed -i -e "s# /lib# ../../lib#g" -e "s# /usr/lib# .#g" ${D}${libdir}/libc.so
>  	fi
>  
>  	if [ -f ${D}${base_libdir}/libc.so ];then
> -		sed -i -e "s# /${EAT_LIBDIR}/${EAT_TARGET_SYS}# ../../lib#g" -e "s# /usr/${EAT_LIBDIR}/${EAT_TARGET_SYS}# .#g" -e "s# /${EAT_LIBDIR}/# /lib/#g" ${D}${base_libdir}/libc.so
> +		sed -i -e "s# /${EAT_LIBDIR}/# /lib/#g" ${D}${base_libdir}/libc.so
>  		if [ -f ${D}${base_libdir}/libc.so.6 ]; then
>  			sed -i -e "s# /usr/${EAT_LIBDIR}/libc.so.6# /lib/libc.so.6#g" -e "s# /${EAT_LIBDIR}/libc.so.6# /lib/libc.so.6#g" ${D}${base_libdir}/libc.so.6
>  		fi
> -- 
> 2.45.0

