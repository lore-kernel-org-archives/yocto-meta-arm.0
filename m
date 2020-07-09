Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web10.7577.1594304000221848914
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Jul 2020 07:13:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=dyirtpF5;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.67, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f67.google.com with SMTP id dm12so977652qvb.9
        for <meta-arm@lists.yoctoproject.org>; Thu, 09 Jul 2020 07:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=G+JwylUW6/TRnagh5soBYIaXB4Ufd494j5aKO8o+i8s=;
        b=dyirtpF5oeXEP96Baz1w+RYVRGy00iuvGX23XTIrox6QrVUeIwHt6n3mozRRdMkXhP
         edm286Bsv8bgCdouzZRoBB+PyYAMaWOMEVgi4LmKH5UICUvHpyyfOrMh2YMrMCNzwUsl
         10kktEGRi573wqtoxbCpjIK73s+WUcVFmAP8wiukH6ecUDZT56ewb1/RBZUqGVJxBxKQ
         8FhXf5raIqau4m7SXXXTZdREENIfr4sehRMG3rS/VvxtYGWA8+UsoPq1w/rOSQ+eM2iR
         f/bAn8nvT37BpryUGiQZ7l/cDDLLPe9o9PnnCTC3ABSxsLQNapfhTppSrOUC2/qsPCnq
         KsDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=G+JwylUW6/TRnagh5soBYIaXB4Ufd494j5aKO8o+i8s=;
        b=mHz6Sn1+qPuVI/M4EgjjZfHz6O9b9Z1WdIbg61YDQHRy9Oh8vHS+e0mFw7M72ROS/o
         JfN27Pv8UlLPeXeKAe0Pc7hqLAEizkT3CI78PrMii+2Re6rnb8oZ8kuCyoOUTxOkqKPg
         2mAsnvcKik1qN/L54lJISSiW9QfeD+FuB4CJwBpMY8jzv/Iw24zRn0ACgoAisKG0kCVU
         krR00RYqyG8ZK9DDfoWvDeiDXD08urvg4Qn/dn7+E0hZxqUd5eQlLvoIY/huLS/i/Zfw
         ePH09ufB+mJisOTWU7uUmr0LkvNUAW94+OCtlAJOHvdXZhrRST1LjB4TfMyscCA+Rn8V
         FoXQ==
X-Gm-Message-State: AOAM533K5iSnwmB45IO5lDEacCdRbm2SQpqVD5vEHJIh/JqAng2TV6Lq
	AlKCIC2B9vQ2nIfQFb+LzsmOFibTfYfWLg==
X-Google-Smtp-Source: ABdhPJzYByk1ssqceE3c3sQbhHXY49v8NNU2aRq4Z43GDmJnd3RhUbcsTA3YxWOVSg0dfycopYWpmw==
X-Received: by 2002:ad4:4bb2:: with SMTP id i18mr63569379qvw.8.1594303999327;
        Thu, 09 Jul 2020 07:13:19 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:5416:c1ad:e833:f407])
        by smtp.gmail.com with ESMTPSA id g1sm4601587qko.70.2020.07.09.07.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 07:13:18 -0700 (PDT)
Date: Thu, 9 Jul 2020 10:13:17 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Khasim Mohammed <Khasim.Mohammed@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH] arm-bsp/wic: add default wks file to create EFI disk image
Message-ID: <20200709141316.GE9023@kudzu.us>
References: <20200701152024.16320-1-khasim.mohammed@arm.com>
 <20200709125502.GC9023@kudzu.us>
 <DB8PR08MB4969EAB169E4B1A72F0EC3BEFA640@DB8PR08MB4969.eurprd08.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DB8PR08MB4969EAB169E4B1A72F0EC3BEFA640@DB8PR08MB4969.eurprd08.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 09, 2020 at 01:01:52PM +0000, Khasim Mohammed wrote:
> Hi Jon,
> 
> 
> ________________________________________
> From: Jon Mason <jdmason@kudzu.us>
> Sent: Thursday, July 9, 2020 6:25 PM
> To: Khasim Mohammed
> Cc: meta-arm@lists.yoctoproject.org
> Subject: Re: [meta-arm] [PATCH] arm-bsp/wic: add default wks file to create EFI disk image
> 
> On Wed, Jul 01, 2020 at 08:50:24PM +0530, Khasim Mohammed wrote:
> > Creates a partitioned EFI disk image that the user
> > can directly dd to boot media. The selected bootloader is grub-efi.
> >
> > Change-Id: I1a5e8bc953274cdcc1840b27351d8e6444b2c5ab
> > Issue-Id: PLATFORMS-3134
> > Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> 
> > Applied to master.
> 
> Thanks, can you please consider applying this patch to Dunfell branch as well ?

Done

> 
> Regards,
> Khasim
> 
> Thanks,
> Jon
> 
> > ---
> >  meta-arm-bsp/conf/machine/n1sdp.conf | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
> > index 755bb09..318b2d0 100644
> > --- a/meta-arm-bsp/conf/machine/n1sdp.conf
> > +++ b/meta-arm-bsp/conf/machine/n1sdp.conf
> > @@ -15,6 +15,9 @@ IMAGE_FSTYPES += "tar.bz2 ext4"
> >
> >  SERIAL_CONSOLES = "115200;ttyAMA0"
> >
> > +# Set default WKS
> > +WKS_FILE ?= "${@bb.utils.contains("EFI_PROVIDER", "systemd-boot", "systemd-bootdisk.wks", "mkefidisk.wks", d)}"
> > +
> >  # Use kernel provided by linaro (Contains support for SCMi or HDMI)
> >  PREFERRED_PROVIDER_virtual/kernel ?= "linux-linaro-arm"
> >  PREFERRED_VERSION_linux-linaro-arm ?= "5.4%"
> > --
> > 2.17.1
> >
> 
> > 
> 
> IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium. Thank you.
