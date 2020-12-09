Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web11.7954.1607526723412014303
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Dec 2020 07:12:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=nelZ/WRj;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f193.google.com with SMTP id y15so1115891qtv.5
        for <meta-arm@lists.yoctoproject.org>; Wed, 09 Dec 2020 07:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ja6qUGqCKN4GOllWcrv2pCKTUqVrKkmjvdhFYYix+38=;
        b=nelZ/WRj2ktd9E7uZ1WM+ChehOOBEqNT534ulYT5D9cjo6o1nNZEgv84lWTs4OcigN
         48ksqPPydO2hP/ixMPHoXD3sJL8ZwOxzlXZxeWVkfNXy/n8vOKygM+FRsGJrz3BWiJR7
         t0xj5TlT24i8TKhyhCbpJa5o7qp2V+3BkKZDXTnWaCmuNWJdkFnf30a4atnHB090SgMF
         TDeOvKsXzRCiAPZP9zVuFAG2GGrbwE4+HMwMfW2UF32NwkyjZXFs1GI5vasLTcnkq2tK
         77V+oQenKz/P/r+mDt8J4w6p34+iJU+ZA/CQNRwsKqe6he9koXxUtnwDPH4wVAdcATVm
         qKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ja6qUGqCKN4GOllWcrv2pCKTUqVrKkmjvdhFYYix+38=;
        b=bK6glAUMbT88BGiiJ99FaFRzFKor3D5L1m+hkavBp6u8H1ukKyX8LxlzfzQkgYlxz8
         iGZtZ7h4Cn9brP+Yp2cyUAsdX28/2yr2vFh6j9JYEpCVJvhPS9P9ZoQAKKxZQVwtYWxq
         9mlglmTxfVM/sxf0UYLm/Uhx5/tFQbbuMm02vmt5luCYiPNkpXskb+BGUL1YlQ8IsjDj
         DPjB837iu0oNphPtXUpePmlOc78GdIxP2YDvqWoq8evaq3oIwbvIzyDkdmtkWiQz8akD
         Gf0+T8lgu/iQQgTayHJ6OC2frAdb0qnRJdnElvw1+Pw1x4jdRrE5mzlJQRH7SPGypD9X
         5tmg==
X-Gm-Message-State: AOAM531P2m7d+XNQijRNyYE1Lp/CjkF82zUCeVtZ//onM9ofH+mCBdJp
	VyahZg/LEUPR3pvZ8yaOWjBn6BnVQvYcpA==
X-Google-Smtp-Source: ABdhPJz2aDT6RkKrbSlviEnOQf/XqyvMLk9+8Depu14GdFmbULlw35J9HSbtstlE5j4hPVTQBBrF3Q==
X-Received: by 2002:aed:208f:: with SMTP id 15mr3428413qtb.290.1607526690495;
        Wed, 09 Dec 2020 07:11:30 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a606:1b00:a12d:9189:5829:3da3])
        by smtp.gmail.com with ESMTPSA id v5sm1127204qkf.133.2020.12.09.07.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 07:11:30 -0800 (PST)
Date: Wed, 9 Dec 2020 10:11:28 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Khasim Mohammed <khasim.mohammed@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-bsp/scp-firmware: Update N1SDP SCP firmware to 2.7.0
Message-ID: <20201209151128.GA12460@kudzu.us>
References: <20201208005950.6172-1-khasim.mohammed@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201208005950.6172-1-khasim.mohammed@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 08, 2020 at 06:29:50AM +0530, Khasim Mohammed wrote:
> SCP firmware recipes are updated to build SCP firmware version 2.7.0 for N1SDP
> 
> Change-Id: Ic42fac178cf4ac9e87127e9b6258c9bd15101906
> Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>

Taking Ross version of the patch.

Thanks,
Jon

> ---
>  meta-arm-bsp/conf/machine/n1sdp.conf                       | 2 +-
>  .../recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc        | 3 ---
>  .../recipes-bsp/scp-firmware/scp-firmware_2.6%.bbappend    | 1 -
>  .../recipes-bsp/scp-firmware/scp-firmware_2.7%.bbappend    | 7 +++++++
>  4 files changed, 8 insertions(+), 5 deletions(-)
>  create mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.7%.bbappend
> 
> diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
> index 1f11acd..441d8c6 100644
> --- a/meta-arm-bsp/conf/machine/n1sdp.conf
> +++ b/meta-arm-bsp/conf/machine/n1sdp.conf
> @@ -31,7 +31,7 @@ PREFERRED_VERSION_trusted-firmware-a ?= "2.3%"
>  EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a"
>  EXTRA_IMAGEDEPENDS += "virtual/control-processor-firmware"
>  
> -PREFERRED_VERSION_scp-firmware ?= "2.6%"
> +PREFERRED_VERSION_scp-firmware ?= "2.7%"
>  
>  #UEFI EDK2 firmware
>  EXTRA_IMAGEDEPENDS += "virtual/uefi-firmware"
> diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
> index efa3acb..635ec39 100644
> --- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
> +++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
> @@ -1,6 +1,5 @@
>  # N1SDP specific SCP configurations and build instructions
>  
> -SRCREV        = "350be71a2ecef588b8ff5a095a0840de23506e45"
>  SCP_PLATFORM  = "n1sdp"
>  SCP_LOG_LEVEL = "INFO"
>  
> @@ -12,8 +11,6 @@ SRC_URI_append = " \
>  
>  COMPATIBLE_MACHINE_n1sdp = "n1sdp"
>  
> -PV = "2.6.0+git${SRCPV}"
> -
>  DEPENDS += "fiptool-native"
>  DEPENDS += "virtual/trusted-firmware-a"
>  
> diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.6%.bbappend b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.6%.bbappend
> index b760ba7..06b236b 100644
> --- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.6%.bbappend
> +++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.6%.bbappend
> @@ -2,7 +2,6 @@
>  
>  MACHINE_SCP_REQUIRE ?= ""
>  
> -MACHINE_SCP_REQUIRE_n1sdp = "scp-firmware-n1sdp.inc"
>  MACHINE_SCP_REQUIRE_tc0 = "scp-firmware-tc0.inc"
>  MACHINE_SCP_REQUIRE_juno = "scp-firmware-juno.inc"
>  MACHINE_SCP_REQUIRE_sgi575 = "scp-firmware-sgi575.inc"
> diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.7%.bbappend b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.7%.bbappend
> new file mode 100644
> index 0000000..53bd022
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.7%.bbappend
> @@ -0,0 +1,7 @@
> +# Include machine specific SCP configurations
> +
> +MACHINE_SCP_REQUIRE ?= ""
> +
> +MACHINE_SCP_REQUIRE_n1sdp = "scp-firmware-n1sdp.inc"
> +
> +require ${MACHINE_SCP_REQUIRE}
> -- 
> 2.17.1
> 

> 
> 
> 

