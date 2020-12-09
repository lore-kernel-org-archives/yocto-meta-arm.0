Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.8064.1607526775422353809
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Dec 2020 07:12:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=WoJmm8IH;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f175.google.com with SMTP id m185so401187qkf.12
        for <meta-arm@lists.yoctoproject.org>; Wed, 09 Dec 2020 07:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ueoAWSvzAoHTLQi49GavJiUGfaCMB9GR4Ws/9f0PdO8=;
        b=WoJmm8IHCgu7qITsQmRNe3tpWsAACxQQAZcx+atPPB23V+VLAJWjErPGT47fJUHyJ7
         D6n9lGdTY9ow4J2BU4HSffjjTjvM6PvfR0/AQRAomLmE2bnDreb/n1c2QNq85VR/OlFg
         1N69XRa8othqV5Vt1JfPvhJtuKzeLVt/jZnFKe7j5LwEfz2pcbI30NYL+GPn73m3n40m
         3lxsJezB+A6qZZF8HMzP3ntkdD+u9fBDVwJ1Sd1mOPIN8V8l+8aFao78yOmsfiTNm8tn
         K8a2NUNjASa1lxq5p+NlbDarOEMgIRPb9DmGi8veHcmUd+9LEia28VETKXx1rrg6mREi
         0Whg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ueoAWSvzAoHTLQi49GavJiUGfaCMB9GR4Ws/9f0PdO8=;
        b=Rf52+edWVriZteFu45KxyuEt5QSZ6wu4BTFvk5J0v0h2OTVFWyW1DuFpfLYi4Vo9jZ
         t0SR8qJWEh+e9WrUPpHkpTrRGzCPwCcyBqNzvAZg7QUKdMKStYf1EZi/Doz/5JNKY6e6
         k1wcRYwFIAxVCkNBa/i5M9hxeFbdlck+w7Cv3YgaQ3uNufhE6DnlWv7zgY+/sG/aYfQF
         /Fl5jiy6xfULx9DQgEjWKDBPb6FBuL/fMXwG2a5Ovz3Vl2vV2IuzbBbVhRTuszbWE04t
         QkjgNSZWQCNXYZOmsVAqretcu4m0fm9AOmXijG05+JVZNMhkGiAz6miJOyzHBtII0mB/
         EALA==
X-Gm-Message-State: AOAM532JYkOZ50cDPnvVQ1yv+yC6ix/ERHHy/0j4OAuz7KOe1+aWPnyo
	ptN7NdKXuo5Lyse5e/HufuIuMw==
X-Google-Smtp-Source: ABdhPJwjMLiM8w3o3XKkTTacvWHP+xomXj3ndGuNC6aDtgPFW6q0TqBL3iMDEMBL1wPuReuFo5Ul3g==
X-Received: by 2002:a37:a40d:: with SMTP id n13mr40547qke.47.1607526774581;
        Wed, 09 Dec 2020 07:12:54 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a606:1b00:a12d:9189:5829:3da3])
        by smtp.gmail.com with ESMTPSA id q32sm1161587qtb.0.2020.12.09.07.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 07:12:54 -0800 (PST)
Date: Wed, 9 Dec 2020 10:12:52 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/2] arm-bsp/scp-firmware: Update N1SDP SCP firmware to 2.7.0
Message-ID: <20201209151252.GC12460@kudzu.us>
References: <20201208110222.1700149-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201208110222.1700149-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 08, 2020 at 11:02:21AM +0000, Ross Burton wrote:
> From: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> 
> SCP firmware recipes are updated to build SCP firmware version 2.7.0 for N1SDP
> 
> Change-Id: Ic42fac178cf4ac9e87127e9b6258c9bd15101906
> Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>

Applied to master.

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
> 2.25.1
> 

> 
> 
> 

