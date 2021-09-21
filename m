Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.2510.1632250822460614779
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 Sep 2021 12:00:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1DF0640C7B;
	Tue, 21 Sep 2021 19:00:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l8khMRRh3o7C; Tue, 21 Sep 2021 19:00:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 063E040BEC;
	Tue, 21 Sep 2021 19:00:19 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 405C1174676; Tue, 21 Sep 2021 15:00:19 -0400 (EDT)
Date: Tue, 21 Sep 2021 15:00:19 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/2] arm-toolchain/gcc-aarch64-none-elf: upgrade to 10.3-2021.07
Message-ID: <20210921190019.GL1528@denix.org>
References: <20210920150500.939582-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210920150500.939582-1-ross.burton@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 20, 2021 at 04:04:59PM +0100, Ross Burton wrote:
> Change-Id: Ie58f448511ef4f1d23cfd4a9d1dc275f7a216a50
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  ...10.2-2020.11.bb => gcc-aarch64-none-elf_10.3-2021.07.bb} | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-arm-toolchain/recipes-devtools/external-arm-toolchain/{gcc-aarch64-none-elf_10.2-2020.11.bb => gcc-aarch64-none-elf_10.3-2021.07.bb} (80%)
> 
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.2-2020.11.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.3-2021.07.bb
> similarity index 80%
> rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.2-2020.11.bb
> rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.3-2021.07.bb
> index fabe1b16..c1758a33 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.2-2020.11.bb
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.3-2021.07.bb
> @@ -9,14 +9,14 @@ SUMMARY = "Baremetal GCC for Aarch64 processors"
>  LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
>  
>  LIC_FILES_CHKSUM = "${@d.getVar(d.expand("LIC_FILES_CHKSUM_${HOST_ARCH}"))}"
> -LIC_FILES_CHKSUM:aarch64 = "file://share/doc/gcc/Copying.html;md5=fdf39a58ab6e893f3d83594cef77fa05"
> +LIC_FILES_CHKSUM:aarch64 = "file://share/doc/gcc/Copying.html;md5=d06ace534ed0851debcb7140c5b5116e"

I'm curious, what was the reason for the license change?


>  LIC_FILES_CHKSUM:x86-64 = "file://share/doc/gcc/Copying.html;md5=e4bcb5bee0c4a50c06704b0b73fcbe0c"
>  
>  PROVIDES = "virtual/aarch64-none-elf-gcc"
>  
>  SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-a/${PV}/binrel/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}.tar.xz;name=gnu-a-${HOST_ARCH}"
> -SRC_URI[gnu-a-x86_64.sha256sum] = "32abfbc7b24c56542f2a6e6969d6b8787e47f7223e8f2097d84151ebd9f86743"
> -SRC_URI[gnu-a-aarch64.sha256sum] = "4f9f060e2ca993ec9564054e17b6fdeacb47260e983f766f84f157d00345bf29"
> +SRC_URI[gnu-a-aarch64.sha256sum] = "768a5db41d93f48838f1c4bfeae26930df2320c09f0dfa798321082fb937955f"
> +SRC_URI[gnu-a-x86_64.sha256sum] = "6f74b1ee370caeb716688d2e467e5b44727fdc0ed56023fe5c72c0620019ecef"
>  
>  S = "${WORKDIR}/gcc-arm-${PV}-${HOST_ARCH}-${BINNAME}"
>  
> -- 
> 2.25.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
