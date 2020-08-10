Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.47428.1597073081434542157
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 Aug 2020 08:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 85F1540BBC;
	Mon, 10 Aug 2020 15:24:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2aY2FatXZLIw; Mon, 10 Aug 2020 15:24:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5BC1640BAB;
	Mon, 10 Aug 2020 15:24:38 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id ADE52174073; Mon, 10 Aug 2020 11:24:37 -0400 (EDT)
Date: Mon, 10 Aug 2020 11:24:37 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Damodar Santhapuri <damodar.santhapuri@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH 2/2] arm-bsp/trusted-firmware-a: Add v2.3 support for juno platform
Message-ID: <20200810152437.GJ17660@denix.org>
References: <20200810030216.24798-1-damodar.santhapuri@arm.com>
 <20200810030216.24798-2-damodar.santhapuri@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200810030216.24798-2-damodar.santhapuri@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 10, 2020 at 08:32:16AM +0530, Damodar Santhapuri wrote:
> Update machine/juno.conf to support tf-a v2.3
> 
> Change-Id: Ieced15e83818687c879d927bce2c4604a72b9b1e
> Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
> ---
>  meta-arm-bsp/conf/machine/juno.conf                         | 2 +-
>  .../trusted-firmware-a/trusted-firmware-a-juno.inc          | 2 +-
>  .../trusted-firmware-a/trusted-firmware-a_2.1.bbappend      | 6 ------
>  .../trusted-firmware-a/trusted-firmware-a_2.3.bbappend      | 1 +
>  4 files changed, 3 insertions(+), 8 deletions(-)
>  delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bbappend
> 
> diff --git a/meta-arm-bsp/conf/machine/juno.conf b/meta-arm-bsp/conf/machine/juno.conf
> index 898a863..5f74535 100644
> --- a/meta-arm-bsp/conf/machine/juno.conf
> +++ b/meta-arm-bsp/conf/machine/juno.conf
> @@ -20,7 +20,7 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
>  # Use kernel provided by linaro (Contains support for SCMi or HDMI)
>  PREFERRED_PROVIDER_virtual/kernel ?= "linux-linaro-arm"
>  PREFERRED_VERSION_linux-linaro-arm ?= "4.19%"
> -PREFERRED_VERSION_trusted-firmware-a ?= "2.1%"
> +PREFERRED_VERSION_trusted-firmware-a ?= "2.3%"
>  
>  EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot firmware-image-juno"
>  
> diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc
> index a6d8ded..c685d7d 100644
> --- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc
> +++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc
> @@ -5,7 +5,7 @@ TFA_PLATFORM = "juno"
>  TFA_DEBUG = "1"
>  TFA_MBEDTLS = "1"
>  TFA_UBOOT = "1"
> -TFA_BUILD_TARGET = "bl1 fip"
> +TFA_BUILD_TARGET = "bl1 bl2 bl31 fip dtbs"

I was wondering - why these TFA_* variables can't be set in the corresponding 
machine config file, instead of creating these trusted-firmware-a-<machine>.inc 
include files?


>  # Juno needs the System Control Processor Firmware
>  DEPENDS += "virtual/control-processor-firmware"
> diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bbappend
> deleted file mode 100644
> index f5f1632..0000000
> --- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bbappend
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -# Machine specific TFAs
> -
> -MACHINE_TFA_REQUIRE ?= ""
> -MACHINE_TFA_REQUIRE_juno = "trusted-firmware-a-juno.inc"
> -
> -require ${MACHINE_TFA_REQUIRE}
> diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
> index 6f67b49..8743ec5 100644
> --- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
> +++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
> @@ -6,5 +6,6 @@ MACHINE_TFA_REQUIRE_a5ds = "trusted-firmware-a-a5ds.inc"
>  MACHINE_TFA_REQUIRE_foundation-armv8 = "trusted-firmware-a-fvp.inc"
>  MACHINE_TFA_REQUIRE_fvp-base = "trusted-firmware-a-fvp.inc"
>  MACHINE_TFA_REQUIRE_n1sdp = "trusted-firmware-a-n1sdp.inc"
> +MACHINE_TFA_REQUIRE_juno = "trusted-firmware-a-juno.inc"
>  
>  require ${MACHINE_TFA_REQUIRE}
> -- 
> 2.17.1
> 

> 

