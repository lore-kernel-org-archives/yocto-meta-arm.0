Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web12.522.1584649009256997267
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Mar 2020 13:16:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=Lgo2Ixqm;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f195.google.com with SMTP id v15so3079643qto.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 19 Mar 2020 13:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WZFfZfylnf+DtC3zCb7Ks9NC2dGucrtcBaAyYT0ZAUA=;
        b=Lgo2Ixqm+EwyLYnegOCHz5BMUfYlWGh9Cgdob0ZpXF4Gk5dEHUjUaPWTJVu2WloY15
         4pphg+fB5FU+vgGfg3EDI3jbC5wSVvq8zG8QG20ahq/GWnT7pNIFsJXXR/zC1Uh2mxO3
         IbDvhWEb1FhemAEYgnYUnq94cynp/YqIwWV8ZTt2miEW/sde3IQKa4f/wHXb8e6wSmJQ
         Zr6if0uGJxNap1TkA2TLr+qsphEGbNmGV1KrRZkjUDwCW2MBmPRoA7jGGOTKBoqpVktz
         pHNhyWEswJ716zhHM2b3EnHx3ezVZbPdrb8LgJ18xg5hMj2zqVyEYsV7fD8QPE3DXURp
         MUsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WZFfZfylnf+DtC3zCb7Ks9NC2dGucrtcBaAyYT0ZAUA=;
        b=Yr6DsZn8zsfQHz4+2f/X1K/RiF0WndfCyORdgpIEItT62PafPLuvwb38oIJw01jcgK
         i36KakhGpWmE18lmDU0FrBC8jN0bpIKcSOanWFjDV8ARIguf8/WHcW1B7R0n37cwKFtn
         GRnruwrbz9CThlcbHJtX8pOoZy+lHs91YiYHsBeB5tFa+PURMz1xO/sRBtR3ZudMIG+1
         ICZMQ2rKGJu7Vy/b6lkktO57l1r1WgsKdjsoGNNPAd1f1gFwAPckeFtiEu+FAR1TX33h
         IplqSvLKMH3A6DoGVo+XpwBL0me7+qbULN79bUm9YkTUT7yEY/IGsfTT8FpAOfznE/gk
         Igsg==
X-Gm-Message-State: ANhLgQ3H5CgRRnrVPTCx8LHW9uBFf6QQIWbuq4HKlM5S/5w15qU3KLu3
	3cx9bA1XXj5ro8ZoId3NqBH1RSjW8hLgcw==
X-Google-Smtp-Source: ADFU+vtyV0xqxa7/AUnuG/k6Od2ub4EyYT6CI4wKb2rORKPp8NFmnHws9llUV6PQMM2mjQe0fFmCuw==
X-Received: by 2002:ac8:5642:: with SMTP id 2mr4784840qtt.191.1584649008130;
        Thu, 19 Mar 2020 13:16:48 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:4158:6bf7:f564:e8f1])
        by smtp.gmail.com with ESMTPSA id u15sm2483911qte.91.2020.03.19.13.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 13:16:47 -0700 (PDT)
Date: Thu, 19 Mar 2020 16:16:46 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com, Rui Miguel Silva <rui.silva@arm.com>
Subject: Re: [meta-arm] [PATCH 0/3 RESEND] arm-bsp: add recipes to support cortex-a5 designstart
Message-ID: <20200319201645.GB27467@kudzu.us>
References: <20200311105643.159467-1-rui.silva@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200311105643.159467-1-rui.silva@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 11, 2020 at 10:56:40AM +0000, Rui Miguel Silva wrote:
> Add necessary recipes to feature equivalent to the actual
> releases for the sw stack for the Cortex-A5 Designstart [0]
> platform.
> 
> Cheers,
>    Rui

Series applied to the master branch of meta-arm.

Thanks,
Jon

> 
> [0]: https://developer.arm.com/ip-products/designstart/pro/cortex-a5
> 
> Rui Silva (3):
>   arm-bsp: add upstream kernel inc and v5.3 recipe
>   arm-bsp: u-boot: move machine patches
>   arm-bsp: add support to cortex-a5 designstart
> 
>  meta-arm-bsp/conf/machine/a5ds.conf           |  25 ++
>  meta-arm-bsp/documentation/a5ds.md            |  24 ++
>  ...t-arm-a5ds-move-dtb-to-a-new-address.patch |  31 ++
>  .../trusted-firmware-a-a5ds.inc               |  22 ++
>  .../trusted-firmware-a_git.bbappend           |   7 +
>  .../a5ds/0001-armv7-add-mmio-timer.patch      | 105 ++++++
>  ...-arm-add-designstart-cortex-a5-board.patch | 309 ++++++++++++++++++
>  .../{ => juno}/u-boot_vexpress_uenv.patch     |   0
>  .../recipes-bsp/u-boot/u-boot_%.bbappend      |   8 +
>  .../recipes-bsp/u-boot/u-boot_2019.%.bbappend |   2 +-
>  .../linux/linux-upstream-arm-platforms.inc    |  24 ++
>  .../linux/linux-upstream-arm_5.3.bb           |   8 +
>  12 files changed, 564 insertions(+), 1 deletion(-)
>  create mode 100644 meta-arm-bsp/conf/machine/a5ds.conf
>  create mode 100644 meta-arm-bsp/documentation/a5ds.md
>  create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/a5ds/0001-plat-arm-a5ds-move-dtb-to-a-new-address.patch
>  create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-a5ds.inc
>  create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bbappend
>  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0001-armv7-add-mmio-timer.patch
>  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch
>  rename meta-arm-bsp/recipes-bsp/u-boot/files/{ => juno}/u-boot_vexpress_uenv.patch (100%)
>  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms.inc
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm_5.3.bb
> 
> --
> 2.25.1
> 
> IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium. Thank you.

> 

