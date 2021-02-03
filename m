Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web12.9462.1612360992972010353
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 03 Feb 2021 06:03:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=PN0niqv4;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f173.google.com with SMTP id d15so17531254qtw.12
        for <meta-arm@lists.yoctoproject.org>; Wed, 03 Feb 2021 06:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SD+tDpGxlicQ8VAsbB13Hy4gB4N5IzTQWj1sVklrVSI=;
        b=PN0niqv4+sO2jefuOlgyaUqaxTLo3jfRiVH9P8ExMyzvSwx1KPOeMM2s8rSWQfhLQu
         3DyWjaT7SdkPaCbToiW/eObjMB/BRPTnkAIySAtTAsprjAdjGfgoOFHRSJVI839BM2wW
         qfb6Hx5+oaxApAKM/jRoviU8dQW1z8ViPczmbW2U38h+2bnS6mFK9NoGrpFgdSbMxRqh
         i5YkTvhr/3hWknIwfHgSS6gTcK2DiP1BfgZbqrwPyzvOynMgeSy04whAmywH3TQ5Qzix
         ODD3douMVFXzD5BDbTkKRsqAW2cqPLeQVcPrCz/0DR4grSV+zjGTX4PWKPWoBRIBYg7n
         32Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SD+tDpGxlicQ8VAsbB13Hy4gB4N5IzTQWj1sVklrVSI=;
        b=Gf4TsQzBje3cPHJg6gzd6IRMBJeIZRvD++chqWPwgWUbTYJSXE0V909wJE7TQx2O8D
         w26DMZnLi7OHepJpCAwhHBaY1xtLG7CUEMlAhbPjMUWnbP7eH42r21Y4vSLrgOnuorJ/
         fQrLjkFy0UD8OiEB+Bja4wQQ+GtC+f4pSvc0L83K/6HYNNp330xorhY/vHLKu62JVzgN
         ajDkevZLi0/mWUDuBgBv1QDVInhh4xBEfQ8EE6TuHMGpPsK8R5GA0C+9ibjwUMUxWDk8
         JxtaHk8xvUggt6rW6ifuLoCBm3IaOUfxl7HTzjdZIeL8GbbwgeqctcityMEzhtoz47ON
         Gx0w==
X-Gm-Message-State: AOAM531JknMQvdix1fBbRLv/tG/IaMVl02h5xXBjyd9juHzVQwn580sr
	cNR7CrJTE3kl/gN8F17ZgVGndQ==
X-Google-Smtp-Source: ABdhPJxNdP8MvEtSXAJBK7K30IEbl7AKg7vonCiEFNQbqgCNspALW/l69mwTMHH41ooc+DZvg2KHpA==
X-Received: by 2002:a05:622a:4ce:: with SMTP id q14mr2596555qtx.132.1612360991574;
        Wed, 03 Feb 2021 06:03:11 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a62f:6d00:b5db:bbf6:3a41:532b])
        by smtp.gmail.com with ESMTPSA id t71sm1684954qka.86.2021.02.03.06.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 06:03:11 -0800 (PST)
Date: Wed, 3 Feb 2021 09:03:09 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Peter Hoyes <peter.hoyes@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH 1/2] arm-autonomy: Use correct PACKAGE_ARCH in recipes-extended
Message-ID: <20210203140309.GB27584@kudzu.us>
References: <20210128152701.901663-1-peter.hoyes@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210128152701.901663-1-peter.hoyes@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 28, 2021 at 03:27:00PM +0000, Peter Hoyes wrote:
> From: Peter Hoyes <Peter.Hoyes@arm.com>
> 
> xen-devicetree should be $MACHINE_ARCH.
> xenguest-* should be allarch
> 
> Issue-Id: SCM-2039
> Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
> Change-Id: Id5666e1dc02a174e74bb8e843cb588287717d136
> ---

Series applied to the master branch

Thanks,
Jon

>  .../recipes-extended/xen-devicetree/xen-devicetree.bb           | 1 +
>  meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb | 2 +-
>  meta-arm-autonomy/recipes-extended/xenguest/xenguest-mkimage.bb | 2 ++
>  meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb | 2 +-
>  4 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb b/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
> index 29b8023..db955e1 100644
> --- a/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
> +++ b/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
> @@ -30,6 +30,7 @@ XEN_DEVICETREE_DTSI_MERGE ?= "xen.dtsi"
>  inherit nopackages deploy
>  
>  DEPENDS += "dtc-native"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  do_configure[noexec] = "1"
>  do_compile[noexec] = "1"
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
> index ffb0fc3..2bfd6a9 100644
> --- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
> @@ -37,7 +37,7 @@ XENGUEST_MANAGER_LOG_LEVEL ?= "ERROR"
>  INITSCRIPT_NAME = "xenguest"
>  INITSCRIPT_PARAMS = "start 90 2 3 4 5 . stop 79 0 1 6 ."
>  
> -inherit update-rc.d
> +inherit allarch update-rc.d
>  
>  do_compile() {
>      echo "XENGUEST_VOLUME_DEVICE=\"${XENGUEST_MANAGER_VOLUME_DEVICE}\"" > \
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-mkimage.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-mkimage.bb
> index 6ea5fb1..080f137 100644
> --- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-mkimage.bb
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-mkimage.bb
> @@ -17,6 +17,8 @@ S = "${WORKDIR}"
>  # Can be built native also to produce xenguest images during Yocto build
>  BBCLASSEXTEND = "native"
>  
> +inherit allarch
> +
>  do_configure[noexec] = "1"
>  do_compile[noexec] = "1"
>  
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
> index 9464d43..5f18659 100644
> --- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
> @@ -39,7 +39,7 @@ INITSCRIPT_PARAMS_${PN} = "start 01 2 3 4 5 . stop 81 0 1 6 ."
>  INITSCRIPT_NAME_${PN}-kea-dhcp4 = "kea-restore-default-config"
>  INITSCRIPT_PARAMS_${PN}-kea-dhcp4 = "defaults 20"
>  
> -inherit update-rc.d
> +inherit allarch update-rc.d
>  
>  do_install() {
>      cat ${WORKDIR}/xenguest-network-bridge.in \
> -- 
> 2.25.1
> 

> 
> 
> 

