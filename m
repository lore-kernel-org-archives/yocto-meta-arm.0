Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web09.149.1605888664503021534
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 20 Nov 2020 08:11:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=elkgTprg;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id q5so9304811qkc.12
        for <meta-arm@lists.yoctoproject.org>; Fri, 20 Nov 2020 08:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HysSgtKxhUnJpCawdHcujmw2BeAtvIIp2WwlU+weLF8=;
        b=elkgTprg27Sp5CkYIEvvbfXTxofrJPIErv5aNP32Ne5J5Z6HskXIGz8Si34JOWPEbq
         osB98+80pbRz2GFYZdf93BUmVBO1WLu46FpetOpwJgWKdRvYfMxRymp1T6QL3aV+1kSg
         HI5YyqrpwMD5pbSEp88f5IvD9clbqWenj0sK/b1bGl/puYbJOdfcFDxPX+kWQi+EwsaD
         LWYWQd+iv0miCUCALDWKdGMZO5Qeo0BWq4SRADvHQI9FzAg9qwqcjPMerLWzrcUyDCHh
         3IAc06oof/Shlr54NJR3IldYzHx9M5fEabITKEbmOSnzgLxTpyp9lIY+9ni4P6s6Js9z
         XoMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HysSgtKxhUnJpCawdHcujmw2BeAtvIIp2WwlU+weLF8=;
        b=U5ayRUn8hm9YqFCvbCbYB8xGLT5drcuc6D6uqCvezQAxAYGtypbJ0qLpK5/PNFkk9v
         YCYfiBJ3fYMl8UJ4E6WK3K7t5iLm71umQyttv/WumdyEQj9DTqzGNm0d2kAiEebmYhYz
         BRfddszhcSItl+n1Vv/Sob9vj4ipDPvumdl2ywiCdFDl3bhDZ219dBeBB1Vf23ni6ADh
         RM8xEA7yKVUJR7P+KL1NZrILrA4rvs5RW94lQO0Us04D3ziuLseqLbp5/OrKsobsPUJE
         grVMM5wY4tMxzkdvvepi3xcugs59KDbd2SVZFEY8lFywK1cuQtvltGJACoQRcboNupsa
         QrjQ==
X-Gm-Message-State: AOAM530gY3zrQciSHN8SZtpZbYoVLjk31bg1hKMUWGotbxhYmxglChmb
	gHIwZZ3sp/fcLPtyw1HHLNldTw==
X-Google-Smtp-Source: ABdhPJxVjAuVnRwZYnm0cHt4b4bI5IelKabEeC2v0xbhCvUKqOfEqN8F7f7w/4lgawIu63jtO6vRrA==
X-Received: by 2002:a37:9d16:: with SMTP id g22mr17381010qke.62.1605888663609;
        Fri, 20 Nov 2020 08:11:03 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a606:1b00:1180:47ef:a8ed:94a9])
        by smtp.gmail.com with ESMTPSA id h142sm2275509qke.104.2020.11.20.08.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 08:11:03 -0800 (PST)
Date: Fri, 20 Nov 2020 11:11:01 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Thomas Abraham <thomas.abraham@arm.com>
Cc: meta-arm@lists.yoctoproject.org, Vivek Gautam <vivek.gautam@arm.com>
Subject: Re: [meta-arm] [PATCH 4/6] arm-bsp/linux: Build Linux stable 5.7 for rdn1edge
Message-ID: <20201120161101.GA4483@kudzu.us>
References: <20201120042844.21915-1-thomas.abraham@arm.com>
 <20201120042844.21915-4-thomas.abraham@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201120042844.21915-4-thomas.abraham@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 20, 2020 at 09:58:42AM +0530, Thomas Abraham wrote:
> From: Vivek Gautam <vivek.gautam@arm.com>
> 
> Update linux-arm inc to add build support for rdn1edge. In addition
> to this, add machine conf to add image dependency for Linux
> components.
> 
> Change-Id: If98fae10b69193ba635bc65b386b136f171d6826
> Signed-off-by: Vivek Gautam <vivek.gautam@arm.com>

We recently removed all of the meta-kernel kernels and the dependency
on meta-kernel from meta-arm-bsp.  See
https://lists.yoctoproject.org/g/meta-arm/message/1367

So, this patch fails to compile due to the missing dependency.  Given
that linux-yocto is currently at v5.8, wouldn't this be a better
choice (and would not necerssitate adding the meta-kernel dependnecy)?
If not, I would recommend a LTS kernel (v5.4).

Also, meta-kernel has dropped support for 5.7 in their master branch.
So this will fail to compile with meta-arm master and meta-kernel
master (which is how we and the yocto project autobuilder are testing
this), even if we added the meta-kernel dependency back.

So, please rework this and resubmit the series.

Thanks,
Jon


> ---
>  meta-arm-bsp/conf/machine/rdn1edge.conf                   | 6 ++++++
>  meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc | 8 ++++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/meta-arm-bsp/conf/machine/rdn1edge.conf b/meta-arm-bsp/conf/machine/rdn1edge.conf
> index cdc879c..d86c9f7 100644
> --- a/meta-arm-bsp/conf/machine/rdn1edge.conf
> +++ b/meta-arm-bsp/conf/machine/rdn1edge.conf
> @@ -14,3 +14,9 @@ PREFERRED_PROVIDER_virtual/trusted-firmware-a ?= "trusted-firmware-a"
>  PREFERRED_VERSION_trusted-firmware-a ?= "2.3%"
>  
>  EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a"
> +
> +#Linux Stable Kernel
> +KERNEL_IMAGETYPE ?= "Image"
> +PREFERRED_PROVIDER_virtual/kernel ?= "linux-stable"
> +PREFERRED_VERSION_linux-stable ?= "5.7%"
> +SERIAL_CONSOLES = "115200;ttyAMA0"
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
> index 62b1dec..42d5604 100644
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
> @@ -14,6 +14,7 @@ SRC_URI_append_fvp-base = " ${SRC_URI_KMETA}"
>  SRC_URI_append_fvp-base-arm32 = " ${SRC_URI_KMETA}"
>  SRC_URI_append_juno = " ${SRC_URI_KMETA}"
>  SRC_URI_append_sgi575 = " ${SRC_URI_KMETA}"
> +SRC_URI_append_rdn1edge = " ${SRC_URI_KMETA}"
>  SRC_URI_append_gem5-arm64 = " ${SRC_URI_KMETA}"
>  SRCREV_arm-platforms-kmeta = "6147e82375aa9df8f2a162d42ea6406c79c854c5"
>  
> @@ -70,6 +71,13 @@ KMACHINE_sgi575 = "sgi575"
>  KBUILD_DEFCONFIG_sgi575 = "defconfig"
>  KCONFIG_MODE_sgi575 = "--alldefconfig"
>  
> +#
> +# RD-N1-Edge KMACHINE
> +#
> +COMPATIBLE_MACHINE_rdn1edge = "rdn1edge"
> +KBUILD_DEFCONFIG_rdn1edge = "defconfig"
> +KCONFIG_MODE_rdn1edge = "--alldefconfig"
> +
>  #
>  # Total Compute KMACHINE
>  #
> -- 
> 2.17.1
> 

> 
> 
> 

