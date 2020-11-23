Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web11.36083.1606141571294706290
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 Nov 2020 06:26:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=QqWJTffW;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.67, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f67.google.com with SMTP id e14so8852851qve.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 23 Nov 2020 06:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Kf3s5woPihuty4IHy+Mv/KbnhFNaNUe2Q7nkqh/CXlw=;
        b=QqWJTffWHTnU8sBM2nhae5KGIm8fpHNiWEvAsN1v4Zo2aGVd+MZL63ikdMei4V5C36
         GR/qnu4amWVcxkI/dqwPA/c1VlX5SSt+My5ObPeeu8ctg/c4sc9o7cnFUU82e9XYTpGK
         /MWJr0X6cZzTWyNh1kQ2SjP+vJRePIiQ79uahTkKhasBwT3xndlYbXcazfQ3hppE/b6O
         sZEBRilpPEDY9iAnCuQCCaXdQmydzumfR1B9ER7KlaAld2ztZFE+mNk2+em+WN2aWL0x
         z+t5K3ik2dkkNPRha51z3Dr6dg7Puw1cSrFwjTEFElPC80nEi6GGMBvnEQXehzEWuNB9
         Iahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Kf3s5woPihuty4IHy+Mv/KbnhFNaNUe2Q7nkqh/CXlw=;
        b=gEZWCjV5ZvgNpevpYhFG5DqFsb3zurQuH67Uirb06QFq+yBtfXfSzXqibgb3eeO6Yq
         HYIW8V4Qcun7UxOKRkOAGZA26kNCjvfwFGlSpqHh+S6KaT7Lyauj/sqo3posPn6LnguU
         FN2OvxoscKr+jLNpfCYDKtnPiO1//+JaSGT5k3+CcNRxppEVPzaW1ahoogAA27G2MHIU
         LNsSma1ObSrhQ7I4ql3ITn96+yhenCshzVu1c+5xdPRggsdmPs8ujs6b1YtlWXXPO71N
         0fEU9qJXnkxVaygAA/XMKYEqU4DUg3tNnp3JwHfrjMtXUOfsEXnT1OcaFIfMg8T8MhDF
         BF8g==
X-Gm-Message-State: AOAM530lg41m4WHfmCqpLavcn+QWAWP/4CN8U/v4H/n3KwuKBeidtfDf
	UOiEOjPc3XUF6me/y5ZXTdm0hQ==
X-Google-Smtp-Source: ABdhPJx8hXsuqgQZTo1+j4eYdDUofVzSW4G2O2V31VUBgk2W1dCq/s4oXdrQuASy3rJhfTwti9l7bA==
X-Received: by 2002:a0c:f4d0:: with SMTP id o16mr28778188qvm.45.1606141570352;
        Mon, 23 Nov 2020 06:26:10 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a606:1b00:7160:191d:209b:6e92])
        by smtp.gmail.com with ESMTPSA id m124sm3398658qkf.73.2020.11.23.06.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 06:26:09 -0800 (PST)
Date: Mon, 23 Nov 2020 09:26:08 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Nathan Dunne <Nathan.Dunne@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-autonomy/n1sdp-image-customization: boot partition size variables
Message-ID: <20201123142607.GA1595@kudzu.us>
References: <20201123105116.23629-1-Nathan.Dunne@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201123105116.23629-1-Nathan.Dunne@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 23, 2020 at 10:51:16AM +0000, Nathan Dunne wrote:
> Added variables BOOT_PART_SIZE and BOOT_PART_SIZE_UNIT to allow the
> boot partition to be configured in conf files.
> 
> Issue-Id: SCM-1686
> Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
> Change-Id: Iaa76d4abdcccc693b3c38708ca452295ff8ee66e

Pushed to master.

Thanks,
Jon

> ---
>  .../documentation/n1sdp-image-customization.md        | 11 ++++++++---
>  .../conf/machine/n1sdp-extra-settings.inc             |  4 ++++
>  .../wic/arm-autonomy-n1sdp-efidisk.wks.in             |  2 +-
>  3 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-arm-autonomy/documentation/n1sdp-image-customization.md b/meta-arm-autonomy/documentation/n1sdp-image-customization.md
> index 9e4186c..80c11cb 100644
> --- a/meta-arm-autonomy/documentation/n1sdp-image-customization.md
> +++ b/meta-arm-autonomy/documentation/n1sdp-image-customization.md
> @@ -11,12 +11,17 @@ perform a couple of customizations in the generated wic image:
>     1 MiB per physical volume, hence it needs to be taken into account when
>     setting GUEST_PART_SIZE.
>  
> -2. The wic image partition layout and contents with a custom wks file via
> +2. Set the boot partition size (default: 100M) via `BOOT_PART_SIZE` and
> +   `BOOT_PART_SIZE_UNIT` (M or G) variables in any conf file. The default
> +   bootimg is ~44M so 100M leaves just over 50M of free space.
> +
> +3. The wic image partition layout and contents with a custom wks file via
>     `ARM_AUTONOMY_WKS_FILE` variable (default:
>     arm-autonomy-n1sdp-efidisk.wks.in which is affected by GUEST_PART_SIZE,
> -   GUEST_PART_SIZE_UNIT and GRUB_CFG_FILE variables).
> +   GUEST_PART_SIZE_UNIT, BOOT_PART_SIZE, BOOT_PART_SIZE_UNIT and
> +   GRUB_CFG_FILE variables).
>  
> -3. Custom grub.cfg file via `GRUB_CFG_FILE` (default:
> +4. Custom grub.cfg file via `GRUB_CFG_FILE` (default:
>     arm-autonomy-n1sdp-grub.cfg) variable to be set in any conf file. The full
>     path or relative to `ARM_AUTONOMY_WKS_FILE` should be set.
>  
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc
> index a675239..977efc5 100644
> --- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc
> +++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc
> @@ -14,6 +14,10 @@ WKS_FILE = "${ARM_AUTONOMY_WKS_FILE}"
>  GUEST_PART_SIZE ?= "4097"
>  GUEST_PART_SIZE_UNIT ?= "M"
>  
> +# Set default boot partition size and unit
> +BOOT_PART_SIZE ?= "100"
> +BOOT_PART_SIZE_UNIT ?= "M"
> +
>  # The GRUB_CFG_FILE affects arm-autonomy-n1sdp-efidisk.wks.in file
>  #
>  # When alternate-kernel DISTRO_FEATURE is present we set the
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-n1sdp-efidisk.wks.in b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-n1sdp-efidisk.wks.in
> index d91d568..ded628c 100644
> --- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-n1sdp-efidisk.wks.in
> +++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-n1sdp-efidisk.wks.in
> @@ -3,7 +3,7 @@
>  # can directly dd to boot media. Uses a custom grub.cfg file to configure the boot.
>  
>  # First boot partition normally populated as /dev/sda1
> -part /boot --source bootimg-efi --sourceparams="loader=grub-efi" --ondisk sda --label msdos --active --align 1024
> +part /boot --source bootimg-efi --sourceparams="loader=grub-efi" --ondisk sda --size="${BOOT_PART_SIZE}${BOOT_PART_SIZE_UNIT}" --label msdos --active --align 1024
>  
>  # Second rootfs partition normally populated as /dev/sda2
>  part / --source rootfs --ondisk sda --fstype=ext4 --label root --align 1024
> -- 
> 2.17.1
> 

> 
> 
> 

