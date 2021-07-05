Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.14753.1625511657712847966
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 05 Jul 2021 12:00:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 128A540C2E;
	Mon,  5 Jul 2021 19:00:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id It73-_keLoz1; Mon,  5 Jul 2021 19:00:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EBAB7407FE;
	Mon,  5 Jul 2021 19:00:52 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 44E4B17461E; Mon,  5 Jul 2021 15:00:52 -0400 (EDT)
Date: Mon, 5 Jul 2021 15:00:52 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Ben Horgan <ben.horgan@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-toolchain/gcc-aarch64-none-elf: Fix license checksum on x86_64 host
Message-ID: <20210705190052.GN1528@denix.org>
References: <20210705141651.25564-1-ben.horgan@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210705141651.25564-1-ben.horgan@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

What is the reason for the change?


On Mon, Jul 05, 2021 at 03:16:51PM +0100, Ben Horgan wrote:
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>  .../external-arm-toolchain/gcc-aarch64-none-elf_10.2-2020.11.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.2-2020.11.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.2-2020.11.bb
> index 5cbab9e..4599831 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.2-2020.11.bb
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.2-2020.11.bb
> @@ -10,7 +10,7 @@ LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
>  
>  LIC_FILES_CHKSUM = "${@d.getVar(d.expand("LIC_FILES_CHKSUM_${HOST_ARCH}"))}"
>  LIC_FILES_CHKSUM_aarch64 = "file://share/doc/gcc/Copying.html;md5=1b548d9c341b3b5c82bc88551964aa60"
> -LIC_FILES_CHKSUM_x86-64 = "file://share/doc/gcc/Copying.html;md5=c1df856e21b17e58b0adbe29cacf4bd4"
> +LIC_FILES_CHKSUM_x86-64 = "file://share/doc/gcc/Copying.html;md5=e4bcb5bee0c4a50c06704b0b73fcbe0c"
>  
>  PROVIDES = "virtual/aarch64-none-elf-gcc"
>  
> -- 
> 2.17.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
