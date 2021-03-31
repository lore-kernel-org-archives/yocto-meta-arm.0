Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web09.6241.1617195429386382182
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 05:57:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=pTK3o8SQ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id 1so13676383qtb.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 31 Mar 2021 05:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Dv14cMxrS3/HDLFE9UO9v42OqCalbiprWnXqLuGPpTs=;
        b=pTK3o8SQUY4MWUOJ2D/nRjMqkgshXL9egh6gBFShNxyPU3xolQKTNLx1+PCOuk0xh5
         y+zJIUAtEViuUoazCRBZkqazvQdWOQjlQMQeFgRO9XOWpr22KDRxUeMjnjmGIMhJDFu9
         MhGV/UW6wjl4ABdD+b6b9i2Hnb5RN33mHG/lhNA3vuaC7nQf6L5zoWi+d+X89T4xJ/Sq
         d0uQE3/hU1WCvfGA+G0UTZcBFgrCWolmSBnxRmmMhWpwhykyXUh7b8LA4foi9EE3oaEI
         oJUvKGV0tvq/sWYejfN2toeCHeGjpvljKOATCKE+WVGQxiux/3yGHc4YtFknAh08jlbG
         97qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Dv14cMxrS3/HDLFE9UO9v42OqCalbiprWnXqLuGPpTs=;
        b=bUlJcyvl5v+0cBQbFDWocE2uA58+HpdTx7Stjy+Wy5gXMB5MUsS1eiLx6hqCwVZcHF
         SoR+PG8auhrFthEj1r64qo12rml7+7lY9qhYqiLJ7D0V9KzVmeKHXm2HHyv2CIxMkQkj
         Yj01ihbfN6FgoeZCrtvYTk35Z6Evntkyxkhf1JxkedtzG9f8zEc/043X6H1+q6DgWfA0
         Iw1/XYww1IhuL4SX/CbTptIrRoSc25cii81lHADkxkRjhtnbQfnZTjzo208SF1hQFwkN
         3AMmlSh5N1AnfYNzC5m2mIlcyc8Kawe+xdmLIguWBO+DvZmD9djrNIiVTdDNDdWRNHDM
         hP6A==
X-Gm-Message-State: AOAM530O3Q5LG5NcpgzxZ8wLM45XdqXKyLs98Kcobr6Sd3vksUNeE7ye
	8QiI7Bd/ACeRqaKtg/wYsEozMQ6W+dG4+A==
X-Google-Smtp-Source: ABdhPJyeDjApQLKSu9qUslzqvENw6m5CBpr941kNwziztVouotvbV4lhpszKMHIP+EmJWuY780DhIg==
X-Received: by 2002:ac8:7c8d:: with SMTP id y13mr2181866qtv.294.1617195428573;
        Wed, 31 Mar 2021 05:57:08 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a601:f800:4ba:158e:74b5:f678])
        by smtp.gmail.com with ESMTPSA id i25sm1326973qka.38.2021.03.31.05.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 05:57:08 -0700 (PDT)
Date: Wed, 31 Mar 2021 08:57:06 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm/edk2-firmware: upgrade to 202102
Message-ID: <20210331125706.GD8543@kudzu.us>
References: <20210330141545.2542755-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210330141545.2542755-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 30, 2021 at 03:15:45PM +0100, Ross Burton wrote:
> The edk2 SRCREV is the tag, has edk2-platforms doesn't tag releases the
> SRCREV is approximately the same date.
> 
> Also remove the PREFERRED_VERSION from SGI575 so it doesn't need to be
> updated in the future.
> 
> Change-Id: I5ac544e70b404081bf0638a54514a412d87fb3d3
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Patch included into the master branch.

Thanks,
Jon

>  meta-arm-bsp/conf/machine/sgi575.conf                         | 2 --
>  ...firmware_202011.bbappend => edk2-firmware_202102.bbappend} | 0
>  meta-arm/recipes-bsp/uefi/edk2-firmware_202011.bb             | 4 ----
>  meta-arm/recipes-bsp/uefi/edk2-firmware_202102.bb             | 4 ++++
>  4 files changed, 4 insertions(+), 6 deletions(-)
>  rename meta-arm-bsp/recipes-bsp/uefi/{edk2-firmware_202011.bbappend => edk2-firmware_202102.bbappend} (100%)
>  delete mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202011.bb
>  create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202102.bb
> 
> diff --git a/meta-arm-bsp/conf/machine/sgi575.conf b/meta-arm-bsp/conf/machine/sgi575.conf
> index f5baa0f..2004369 100644
> --- a/meta-arm-bsp/conf/machine/sgi575.conf
> +++ b/meta-arm-bsp/conf/machine/sgi575.conf
> @@ -19,8 +19,6 @@ PREFERRED_VERSION_linux-yocto ?= "5.7%"
>  KCONFIG_MODE = "--alldefconfig"
>  SERIAL_CONSOLES = "115200;ttyAMA0"
>  
> -PREFERRED_VERSION_edk2-firmware ?= "202011%"
> -
>  #grub-efi
>  EFI_PROVIDER ?= "grub-efi"
>  MACHINE_FEATURES += "efi"
> diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202011.bbappend b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202102.bbappend
> similarity index 100%
> rename from meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202011.bbappend
> rename to meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202102.bbappend
> diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202011.bb b/meta-arm/recipes-bsp/uefi/edk2-firmware_202011.bb
> deleted file mode 100644
> index 94310e3..0000000
> --- a/meta-arm/recipes-bsp/uefi/edk2-firmware_202011.bb
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -SRCREV_edk2           ?= "872f953262d68a11da7bc2fb3ded16df234b8700"
> -SRCREV_edk2-platforms ?= "3f71a8fb114ae9ce87281eb30ab0e678f6806b05"
> -
> -require edk2-firmware.inc
> diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202102.bb b/meta-arm/recipes-bsp/uefi/edk2-firmware_202102.bb
> new file mode 100644
> index 0000000..1352922
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_202102.bb
> @@ -0,0 +1,4 @@
> +SRCREV_edk2           ?= "ef91b07388e1c0a50c604e5350eeda98428ccea6"
> +SRCREV_edk2-platforms ?= "2620e05c6fade20ef5e1ba69280d09f9e2b3eff6"
> +
> +require edk2-firmware.inc
> -- 
> 2.25.1
> 

> 
> 
> 

