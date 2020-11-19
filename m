Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web12.9264.1605793606516592483
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Nov 2020 05:46:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=UYanaLGo;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.66, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f66.google.com with SMTP id v20so2833220qvx.4
        for <meta-arm@lists.yoctoproject.org>; Thu, 19 Nov 2020 05:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lVE00oZbyxUfBlaGBv7hykHEjWfheJ+KeUmCnxCe0TA=;
        b=UYanaLGo6ssE6P42MCBE2qYcStRwB4XOlwPi8+3TfqpuaL5d7MSetVFnd3I6fNHyy0
         CzeSA1moXVgeSjvslyVou1anH2RDH1DL2d9SEiJJV+uzSZyXleJll+BD7xpYf4tgmk6s
         u/bgBnBzohh4mVxX48ujS/pMTdWhR/ll5OFNf5C+dACvrHxi40NZEqhvpL8qsAinseam
         VCRWluVqRmEtZDfN2Lckug11K/DNfElaTjyHIQWrYfXb3E/oLds66uwD56Kj4U51CG10
         bkh+TeCq1nvhVJXVplwqyeUm9ICbvHM/wh+sTO4ujhZGLKN/GPPFlzFlzmcfQt43FWDP
         qhWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lVE00oZbyxUfBlaGBv7hykHEjWfheJ+KeUmCnxCe0TA=;
        b=Yx06a2Ohd3dUabBqguve/ShDwp2YFIrYevlPF3WOkbrvmP1D+cfxAXVo7LGVIpisnO
         5OdOhRQxr88dXk5ybZwIXBHxUMi+h68/iWG2c5ynOAI6r5tUJ1S77rmpSC1qdf1kmmSs
         g9yJr4z9LBPpvd+Dfr4r0Zhm9a7eVCZ/wRX/fErDV1U6oBI4GLtebY+/guzq34UnEtUV
         ocHKHCj2+o+lGAuRB/CjWEJqQliqvncqotcRkMxyRe2DaTrAcP6S8MvGyIA7/hF5EO6g
         F1DM8t5fD5CadSeOvwjsMq2xqDd/DdOOKtCPeHo752jPDavVmBzVYTPOaAU/zUXoFsmv
         byvQ==
X-Gm-Message-State: AOAM531B2E3ycBwBIviW+hZt4HsoRz7jDCtkaXu4azY2Gd37WmdVP6a5
	vp4Ooirj2r13r0hQnEO94PCCnw==
X-Google-Smtp-Source: ABdhPJyLNcIgVn/OapNoae1iv+s1NVwAvAUFHlxiuNH/pRRyjkrdXxAfRuXNCBWaMip75lNAqJO4SA==
X-Received: by 2002:a0c:b207:: with SMTP id x7mr11215979qvd.39.1605793605641;
        Thu, 19 Nov 2020 05:46:45 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:c9b6:920b:7215:8210])
        by smtp.gmail.com with ESMTPSA id u21sm2208841qth.97.2020.11.19.05.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 05:46:45 -0800 (PST)
Date: Thu, 19 Nov 2020 08:46:43 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH 0/8] arm-autonomy: Add support for building/installing an alternate kernel
Message-ID: <20201119134642.GA13793@kudzu.us>
References: <20201117100449.20111-1-diego.sueiro@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201117100449.20111-1-diego.sueiro@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 17, 2020 at 10:04:41AM +0000, Diego Sueiro wrote:
> This patch series introduces the support for building and installing an
> alternate kernel image and modules in an image. The alternate kernel inclusion
> is controlled via the 'alternate-kernel' DISTRO_FEATURE.
> 
> The alternate-kernel.bbclass is to be inherited by image recipes and requires
> the PREFERRED_PROVIDER_alternate/kernel and
> KERNEL_PACKAGE_NAME_pn-atlkernel-recipe to be set. The class will also install
> the kernel-modules package for both virtual/kernel and alternate/kernel.
> 
> Also, a patch is introduced in linux-linaro-arm-rt recipe to fix xen behavior
> in kernels with PREEMPT_RT. The preempt-rt-extras.scc KERNEL_FEATURE was added
> to linux-linaro-arm-rt in order to accomodate extra kernel configs for
> arm-autonomy based projects.
> 
> For N1SDP machine, all the required settings are done to include the
> alternate-kernel as well as the GRUB config file to boot it.
> 
> The last two patches are fixing an erroneous behavior of the modutils.sh
> initscript where the depmod command fails to run when the '/' is firstly
> mounted as ro. A proper investigation will be done with oe-core only, and if it
> is reproduced with a qemu machine, the fix will be sent to the upstream
> project.
> 

Series applied to master.

Thanks,
Jon

> 
> Diego Sueiro (8):
>   arm-autonomy/linux-linaro-arm-rt: add linux-RT patch for xen dynamic
>     events
>   arm-autonomy/linux-linaro-arm-rt: Add preempt-rt-extras.scc
>     KERNEL_FEATURE
>   arm-autonomy/classes: Introduce alternate-kernel.bbclass
>   arm-autonomy/arm-autonomy-host-image-minimal: Build/Install alternate
>     kernel
>   arm-autonomy/n1sdp: Add support for building/installing alternate
>     kernel
>   arm-autonomy/n1sdp: Add GRUB config when including alternate kernel
>   arm-autonomy/init: Change execution order between modutils.sh and
>     checkroot.sh
>   arm-autonomy/modutils-initscripts: Fix modules.dep update
> 
>  .../classes/alternate-kernel.bbclass          | 26 ++++++
>  .../conf/machine/n1sdp-extra-settings.inc     | 44 +++++++++-
>  .../arm-autonomy/preempt-rt-extras.cfg        |  7 ++
>  .../arm-autonomy/preempt-rt-extras.scc        |  3 +
>  ...asteoi_irq-to-handle-xen-dynamic-eve.patch | 80 +++++++++++++++++++
>  .../linux/linux-linaro-arm-rt_5.4.bbappend    |  7 ++
>  .../wic/arm-autonomy-n1sdp-rt-grub.cfg        | 28 +++++++
>  .../images/arm-autonomy-host-image-minimal.bb |  4 +
>  .../initscripts/initscripts_1.0.bbappend      |  5 ++
>  .../modutils-initscripts.bbappend             |  6 ++
>  .../fix-modules-dep-creation.patch            | 33 ++++++++
>  11 files changed, 242 insertions(+), 1 deletion(-)
>  create mode 100644 meta-arm-autonomy/classes/alternate-kernel.bbclass
>  create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/features/arm-autonomy/preempt-rt-extras.cfg
>  create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/features/arm-autonomy/preempt-rt-extras.scc
>  create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-rt-5.4/0001-xen-use-handle_fasteoi_irq-to-handle-xen-dynamic-eve.patch
>  create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-rt_5.4.bbappend
>  create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-n1sdp-rt-grub.cfg
>  create mode 100644 meta-arm-autonomy/recipes-core/initscripts/initscripts_1.0.bbappend
>  create mode 100644 meta-arm-autonomy/recipes-kernel/modutils-initscripts/modutils-initscripts.bbappend
>  create mode 100644 meta-arm-autonomy/recipes-kernel/modutils-initscripts/modutils-initscripts/fix-modules-dep-creation.patch
> 
> -- 
> 2.17.1
> 

> 
> 
> 

