Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B98E77188
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 14:43:15 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.46344.1736865791631231194
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jan 2025 06:43:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=qfR3lGVz;
 spf=pass (domain: linaro.org, ip: 209.85.167.50, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54287a3ba3cso5539119e87.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jan 2025 06:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736865790; x=1737470590; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Onvvtsb5klUxrmqTsf3LmY0YKudFLo0rrRVU+9JxeM0=;
        b=qfR3lGVz30FBqXWqPMvjVVm1u4jp3mq3jjvpLwCL4Brzd+V5wbnMKoKEHuTGXeP/PT
         Phk+VmDtZJWIQx2HQXEgSpuzFnSxpGBrrWlH3JQzqve+3zqTrr50zTm53KisxUfMnhrk
         IdVtJwK2/sp7SrHW7E/yMm+01u7I4P6lB8NQx2psfWtQiNbJjqCRn4u294MWRASzjcFb
         Grt9eh1MIirxIc0/h0jEAqjfWu+5fP80ctACP/NTlZHj3pQNE1tzh8XLoQIzQGVfOPIn
         CbTWof9oM73OG3rTQj2y7Cz9R0TKiCXP9MuxBjsyKbnJZaj/WYqbOzAXl81YNH7EEekr
         xhrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736865790; x=1737470590;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Onvvtsb5klUxrmqTsf3LmY0YKudFLo0rrRVU+9JxeM0=;
        b=ugkPeRuoEg8zaeUgTHrGMt874dUtrwQYgoUr1UHWdrb8ajPjSnF6ufOunoLqS66Djv
         yKqqvHEUh49/aUFgnoqELmdrRJC7e8XLphw2P88q+XFFFrkMTx9fFv/Ek+RU1mCYoqFU
         QnUKs77kUb1rM+XRO14zqq3lU43I+svltoKygTS+jiXnnWQtMqzXDCJ6nNNeK62qAzTC
         6v2OBfSjo4zU9pFY3YAj666MpCluglJJlS2c/zzYbKqDf8W6ybuAq+OPUYJTGAtRpYma
         nieElh1t9Mv0lYi+0D2joLvDaqE/A35Dv3ZU/AJHgS8KYJqU39C01aFFRRaM69us+G4P
         spTw==
X-Gm-Message-State: AOJu0YxsWyFIPEuVEsRbs5Zjv+bHRafHLGQbPum4+uoUzp2hfEvDb4p+
	p2kdt4vTN9do7wlyM+dljYfV9aobKfsTqceR46Sq34hvPFECMFgFbzpdKF/IrFI=
X-Gm-Gg: ASbGncsTb8T7S3pwYlUbC7FuFuV3cU4j+t1q+j3M+MZnSo/yjsYiDT7cVgFDEnnHnc4
	nlAItvVj/z07aOpJpNLfWWgrhJYnr9qWOxLdIz1gqESM3CASAQ5mBpR0NICyDJXnKS0axNdWeCm
	x8tyJezj7JWGacfbg8eGhAeFNbsdFDWwEFSj4ydxadtUUWOUfl9tXhXd3xMdbizXvK1VwcwCNWG
	yXHuSL/EGBdeHwiBVRjpOXa1TIzrgwsbH8TE05xEOTGdddCd115Umx4UsAqV8v631pUiipMUwJ2
	+Pgg3w==
X-Google-Smtp-Source: AGHT+IGCu6rpkdAHXZGabtW9ELYKNPKpV/0u6TTcvxIcCh5WVHCASg9aUHzOClt6GJfPHsm2VfRICA==
X-Received: by 2002:a05:6512:10c7:b0:542:8696:b12c with SMTP id 2adb3069b0e04-5428c2d8dd5mr7204777e87.18.1736865789532;
        Tue, 14 Jan 2025 06:43:09 -0800 (PST)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be49da0sm1699557e87.15.2025.01.14.06.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 06:43:07 -0800 (PST)
Date: Tue, 14 Jan 2025 16:43:05 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH] edk2-firmware: fix PlatformStandaloneMmRpmb.dsc build
Message-ID: <Z4Z3-bsTlysMbOiH@nuoska>
References: <20250114094154.304900-1-mikko.rapeli@linaro.org>
 <Z4Zxr3b2FZ__mn8R@kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4Zxr3b2FZ__mn8R@kudzu.us>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Jan 2025 14:43:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6323

Hi,

On Tue, Jan 14, 2025 at 09:16:15AM -0500, Jon Mason wrote:
> On Tue, Jan 14, 2025 at 11:41:54AM +0200, Mikko Rapeli wrote:
> > With backported patch from upstream. Error was:
> > 
> > | build.py...
> > | /home/builder/src/base/repo/build/tmp_rockpi4b/work/rockpi4b-poky-linux/edk2-firmware/202408/edk2/edk2-platforms/Platform/StandaloneMm/PlatformS
> > tandaloneMmPkg/PlatformStandaloneMmRpmb.dsc(...): error 4000: Instance of library class [HobPrintLib] is not found
> > |       in [/home/builder/src/base/repo/build/tmp_rockpi4b/work/rockpi4b-poky-linux/edk2-firmware/202408/edk2/StandaloneMmPkg/Core/StandaloneMmCor
> > e.inf] [AARCH64]
> > |       consumed by module [/home/builder/src/base/repo/build/tmp_rockpi4b/work/rockpi4b-poky-linux/edk2-firmware/202408/edk2/StandaloneMmPkg/Core
> > /StandaloneMmCore.inf]
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> 
> I'm seeing this patch fail to apply (as part of the edk2 build
> process) on every edk2 platform
> https://gitlab.com/jonmason00/meta-arm/-/jobs/8844673217
> https://gitlab.com/jonmason00/meta-arm/-/jobs/8844673227
> https://gitlab.com/jonmason00/meta-arm/-/jobs/8844673281
> https://gitlab.com/jonmason00/meta-arm/-/jobs/8844673312
> https://gitlab.com/jonmason00/meta-arm/-/jobs/8844673331
> https://gitlab.com/jonmason00/meta-arm/-/jobs/8844673346

Oh, I did not see this. I will try to reproduce. Seems to be line ending
issue. edk2 sources use Windows ones. I hope mailing list patch doesn't change
something...

Cheers,

-Mikko

> Thanks,
> Jon
> 
> > ---
> >  meta-arm/recipes-bsp/uefi/edk2-firmware.inc   |  1 +
> >  .../0001-Platform-StMmRpmb-Fix-build.patch    | 38 +++++++++++++++++++
> >  2 files changed, 39 insertions(+)
> >  create mode 100644 meta-arm/recipes-bsp/uefi/files/0001-Platform-StMmRpmb-Fix-build.patch
> > 
> > diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> > index 42668d9d..c10154aa 100644
> > --- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> > +++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> > @@ -20,6 +20,7 @@ SRCBRANCH_edk2_platforms = "master"
> >  SRC_URI = "\
> >      ${SRC_URI_EDK2};branch=${SRCBRANCH_edk2_platforms};name=edk2;destsuffix=edk2 \
> >      ${SRC_URI_EDK2_PLATFORMS};branch=${SRCBRANCH_edk2};name=edk2-platforms;destsuffix=edk2/edk2-platforms \
> > +    file://0001-Platform-StMmRpmb-Fix-build.patch;patchdir=edk2-platforms \
> >  "
> >  
> >  SRCREV_FORMAT         = "edk2_edk2-platforms"
> > diff --git a/meta-arm/recipes-bsp/uefi/files/0001-Platform-StMmRpmb-Fix-build.patch b/meta-arm/recipes-bsp/uefi/files/0001-Platform-StMmRpmb-Fix-build.patch
> > new file mode 100644
> > index 00000000..234ccf34
> > --- /dev/null
> > +++ b/meta-arm/recipes-bsp/uefi/files/0001-Platform-StMmRpmb-Fix-build.patch
> > @@ -0,0 +1,38 @@
> > +From ee185eda7b7ec9a0c82827fea197fbb73d971f93 Mon Sep 17 00:00:00 2001
> > +From: Ard Biesheuvel <ardb@kernel.org>
> > +Date: Thu, 29 Aug 2024 21:21:50 +0200
> > +Subject: [PATCH] Platform/StMmRpmb: Fix build
> > +
> > +Add some missing library class resolutions relating to changes in the
> > +core upstream EDK2 repo.
> > +
> > +Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > +Reviewed-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> > +---
> > + .../PlatformStandaloneMmPkg/PlatformStandaloneMmRpmb.dsc       | 3 +++
> > + 1 file changed, 3 insertions(+)
> > +
> > +Upstream-Status: Backport
> > +
> > +diff --git a/Platform/StandaloneMm/PlatformStandaloneMmPkg/PlatformStandaloneMmRpmb.dsc b/Platform/StandaloneMm/PlatformStandaloneMmPkg/PlatformStandaloneMmRpmb.dsc
> > +index 653029c52f..54c7a63b41 100644
> > +--- a/Platform/StandaloneMm/PlatformStandaloneMmPkg/PlatformStandaloneMmRpmb.dsc
> > ++++ b/Platform/StandaloneMm/PlatformStandaloneMmPkg/PlatformStandaloneMmRpmb.dsc
> > +@@ -41,11 +41,14 @@
> > +   ExtractGuidedSectionLib|EmbeddedPkg/Library/PrePiExtractGuidedSectionLib/PrePiExtractGuidedSectionLib.inf
> > +   FvLib|StandaloneMmPkg/Library/FvLib/FvLib.inf
> > +   HobLib|StandaloneMmPkg/Library/StandaloneMmCoreHobLib/StandaloneMmCoreHobLib.inf
> > ++  HobPrintLib|MdeModulePkg/Library/HobPrintLib/HobPrintLib.inf
> > ++  ImagePropertiesRecordLib|MdeModulePkg/Library/ImagePropertiesRecordLib/ImagePropertiesRecordLib.inf
> > +   IoLib|MdePkg/Library/BaseIoLibIntrinsic/BaseIoLibIntrinsic.inf
> > +   NULL|MdePkg/Library/BaseStackCheckLib/BaseStackCheckLib.inf
> > +   MemLib|StandaloneMmPkg/Library/StandaloneMmMemLib/StandaloneMmMemLib.inf
> > +   MemoryAllocationLib|StandaloneMmPkg/Library/StandaloneMmCoreMemoryAllocationLib/StandaloneMmCoreMemoryAllocationLib.inf
> > +   PcdLib|MdePkg/Library/BasePcdLibNull/BasePcdLibNull.inf
> > ++  PeCoffGetEntryPointLib|MdePkg/Library/BasePeCoffGetEntryPointLib/BasePeCoffGetEntryPointLib.inf
> > +   PeCoffLib|MdePkg/Library/BasePeCoffLib/BasePeCoffLib.inf
> > +   PrintLib|MdePkg/Library/BasePrintLib/BasePrintLib.inf
> > +   VariablePolicyLib|MdeModulePkg/Library/VariablePolicyLib/VariablePolicyLib.inf
> > +-- 
> > +2.43.0
> > +
> > -- 
> > 2.43.0
> > 
> > 

