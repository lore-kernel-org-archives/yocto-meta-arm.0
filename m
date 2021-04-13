Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3217.1618346027510268301
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 13:33:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E423740C53;
	Tue, 13 Apr 2021 20:33:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t6qxZHLaN9Rt; Tue, 13 Apr 2021 20:33:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C02C0409E0;
	Tue, 13 Apr 2021 20:33:44 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 889E21745B4; Tue, 13 Apr 2021 16:33:44 -0400 (EDT)
Date: Tue, 13 Apr 2021 16:33:44 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Yann Dirson <yann.dirson@blade-group.com>
Cc: meta-arm@lists.yoctoproject.org, Yann Dirson <yann@blade-group.com>
Subject: Re: [meta-arm] [PATCH 1/4] arm/optee: use pycryptodome rather pycryptodomex
Message-ID: <20210413203344.GO15937@denix.org>
References: <20210413094038.3577754-1-yann@blade-group.com>
 <20210413094038.3577754-2-yann@blade-group.com>
MIME-Version: 1.0
In-Reply-To: <20210413094038.3577754-2-yann@blade-group.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 13, 2021 at 11:40:35AM +0200, Yann Dirson wrote:
> From: Yann Dirson <yann@blade-group.com>
> 
> Recent versions of OP-TEE perfectly build with pycryptodome, no need for
> the pycryptodomex transition package any more.
> 
> Signed-off-by: Yann Dirson <yann@blade-group.com>

Reviewed-by: Denys Dmytriyenko <denis@denix.org>


> ---
>  meta-arm/recipes-security/optee/optee-examples.inc | 2 +-
>  meta-arm/recipes-security/optee/optee-os.inc       | 2 +-
>  meta-arm/recipes-security/optee/optee-test.inc     | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arm/recipes-security/optee/optee-examples.inc b/meta-arm/recipes-security/optee/optee-examples.inc
> index 851043b..81c31bc 100644
> --- a/meta-arm/recipes-security/optee/optee-examples.inc
> +++ b/meta-arm/recipes-security/optee/optee-examples.inc
> @@ -5,7 +5,7 @@ HOMEPAGE = "https://github.com/linaro-swg/optee_examples"
>  LICENSE = "BSD-2-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=cd95ab417e23b94f381dafc453d70c30"
>  
> -DEPENDS = "optee-client optee-os python3-pycryptodomex-native"
> +DEPENDS = "optee-client optee-os python3-pycryptodome-native"
>  
>  inherit python3native
>  
> diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
> index f8697cf..34f586a 100644
> --- a/meta-arm/recipes-security/optee/optee-os.inc
> +++ b/meta-arm/recipes-security/optee/optee-os.inc
> @@ -10,7 +10,7 @@ require optee.inc
>  
>  CVE_PRODUCT = "linaro:op-tee op-tee:op-tee_os"
>  
> -DEPENDS = "python3-pycryptodome-native python3-pycryptodomex-native python3-pyelftools-native"
> +DEPENDS = "python3-pycryptodome-native python3-pyelftools-native"
>  
>  DEPENDS_append_toolchain-clang = " compiler-rt"
>  
> diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-arm/recipes-security/optee/optee-test.inc
> index 877bdeb..f09b9d2 100644
> --- a/meta-arm/recipes-security/optee/optee-test.inc
> +++ b/meta-arm/recipes-security/optee/optee-test.inc
> @@ -13,7 +13,7 @@ require optee.inc
>  # When upgraded we should be able to remove this limitation
>  COMPATIBLE_HOST_libc-musl = 'null'
>  
> -DEPENDS = "optee-client optee-os python3-pycryptodomex-native"
> +DEPENDS = "optee-client optee-os python3-pycryptodome-native"
>  
>  SRC_URI = "git://github.com/OP-TEE/optee_test.git \
>             file://0001-host-xtest-Adjust-order-of-including-compiler.h.patch \
> -- 
> 2.30.2
> 

> 
> 
> 


-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
