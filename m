Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web08.24148.1617033735786053122
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Mar 2021 09:02:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=U7BUrC95;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f170.google.com with SMTP id s2so9628622qtx.10
        for <meta-arm@lists.yoctoproject.org>; Mon, 29 Mar 2021 09:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=olslKfjFPqcreHTy4hXzfRrJ0GXVupDrG7tikMMpAME=;
        b=U7BUrC95ym+zKJ+oR1LmEFFmtkMpuPwIVCy9ybdiKkcXYFYSY0xdWitGXTSFB4uY4A
         rhzmh5GC+kyFRwfrx7HhH9oTlxco4hj9aGhetjMp3yTWPgDqQehbKgEcTBQlt3PdpQkE
         XieXfqGlymvn8LQv53eHEycqc9KnOxlPV7mJPnWUBhkvg8MMocN3/prB1+vSzM5+Zk2O
         vo7OvFw1L8HK2zlSTybXkk1bRohc4+Vybrluf+DeA8mzu/QCkhHPhiv3Y1E6PXzbF1Cc
         gd81vrEInAMYsav4maQY/OBShRhP93xFOYtdigntL6Y5yXyYKAG+STTWlLCgZenFo1+X
         WsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=olslKfjFPqcreHTy4hXzfRrJ0GXVupDrG7tikMMpAME=;
        b=rXbwYorvcwHN+xfWqUJx3akU5gsOkXYQ04AXQUItXnmq4scgNIRk4h0TtAMDJ96Wqj
         Bk9SpSf4fS8RUunkTchB0ryTjZtkQf8wRop1b9cR++v+SzQ9QwI4vpTaGrF6uI9YIYJN
         IHKrcnoOFLh/S/atMSYamK5TqT9czpmgFq4rw7DHfwKoicMmFUgryrpWj+1FS7ZfZxXC
         DXwbmP0STSn49aQsGShUx5f327RsvxBmpQIRjOqyZJpLPZq+3pIrOjlK8ZrONJSbD+Tp
         L6YsdTRf+hWCTnxGiyxLiChpTqfgDGWLl3S6+BkN30g3jC8/sT0ukBVcOBoBXStl28ZG
         hUSQ==
X-Gm-Message-State: AOAM5327nRhKmbJupxpSiVOPmu238PiwCg4AiQcVmdzd+gTuvQBzBl9I
	IIhEjuoAVvI6W0wh+AoZh4SPSg==
X-Google-Smtp-Source: ABdhPJwuck+79xTDV4l9KVAF5UHOlU8qh8zqMz+qK4EH8TlNZaOwuBCAEyivIRB+FxnoopKehXBYtQ==
X-Received: by 2002:ac8:6696:: with SMTP id d22mr23383108qtp.67.1617033734868;
        Mon, 29 Mar 2021 09:02:14 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a601:f800:f5a9:734d:58ab:be1e])
        by smtp.gmail.com with ESMTPSA id z89sm11351341qtd.5.2021.03.29.09.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 09:02:14 -0700 (PDT)
Date: Mon, 29 Mar 2021 12:02:13 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/4] arm-bsp/trusted-firmware-a: upgrade SGI575 to trusted-firmware-a 2.4
Message-ID: <20210329160212.GC32356@kudzu.us>
References: <20210326131547.3093762-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210326131547.3093762-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 26, 2021 at 01:15:44PM +0000, Ross Burton wrote:
> Change-Id: I7a3e50a0f5558a135b318d70d6d75eefc570ea2f
> Tested-by: Thomas Abraham <thomas.abraham@arm.com>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Patches in master

Thanks,
Jon

>  meta-arm-bsp/conf/machine/sgi575.conf                         | 4 +---
>  .../trusted-firmware-a/trusted-firmware-a_2.2.bbappend        | 1 -
>  .../trusted-firmware-a/trusted-firmware-a_2.4.bbappend        | 1 +
>  3 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-arm-bsp/conf/machine/sgi575.conf b/meta-arm-bsp/conf/machine/sgi575.conf
> index 860b6d7..f5baa0f 100644
> --- a/meta-arm-bsp/conf/machine/sgi575.conf
> +++ b/meta-arm-bsp/conf/machine/sgi575.conf
> @@ -8,9 +8,7 @@ require conf/machine/include/arm/armv8-2a/tune-cortexa75.inc
>  
>  EXTRA_IMAGEDEPENDS += "virtual/control-processor-firmware"
>  
> -# Trusted firmware v2.2 version
> -PREFERRED_PROVIDER_virtual/trusted-firmware-a ?= "trusted-firmware-a"
> -PREFERRED_VERSION_trusted-firmware-a ?= "2.2%"
> +PREFERRED_VERSION_trusted-firmware-a ?= "2.4%"
>  
>  EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a"
>  
> diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bbappend
> index 73e15d0..3c7460f 100644
> --- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bbappend
> +++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bbappend
> @@ -1,6 +1,5 @@
>  # Machine specific TFAs
>  
>  MACHINE_TFA_REQUIRE ?= ""
> -MACHINE_TFA_REQUIRE_sgi575 = "trusted-firmware-a-sgi575.inc"
>  
>  require ${MACHINE_TFA_REQUIRE}
> diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.bbappend
> index bdcdb53..827c0b9 100644
> --- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.bbappend
> +++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.bbappend
> @@ -7,6 +7,7 @@ MACHINE_TFA_REQUIRE_fvp-base = "trusted-firmware-a-fvp.inc"
>  MACHINE_TFA_REQUIRE_fvp-base-arm32 = "trusted-firmware-a-fvp-arm32.inc"
>  MACHINE_TFA_REQUIRE_juno = "trusted-firmware-a-juno.inc"
>  MACHINE_TFA_REQUIRE_n1sdp = "trusted-firmware-a-n1sdp.inc"
> +MACHINE_TFA_REQUIRE_sgi575 = "trusted-firmware-a-sgi575.inc"
>  MACHINE_TFA_REQUIRE_tc0 = "trusted-firmware-a-tc0.inc"
>  
>  require ${MACHINE_TFA_REQUIRE}
> -- 
> 2.25.1
> 

> 
> 
> 

