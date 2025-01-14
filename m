Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF36CC02185
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 14:16:25 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.46123.1736864178036746786
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jan 2025 06:16:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=oKC7C1VH;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.52, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6d8f916b40bso72902076d6.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jan 2025 06:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1736864177; x=1737468977; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7S7xXbk865AhtSomZdFgJ04CMs5FhfIHVY8NLjBX7Zs=;
        b=oKC7C1VHtU5EA+29Ils1x8X58lbgbDfbLtA477w3AxawjUuqMPTlOO5K6bJgPQWZCA
         rIsMWMAZkM8tkxocYQrQpxk/3AaK52YcphS66hfdox0D/4cSdoECN0XX3aGebvIClGtS
         YmkL7j9ttMTd3dTGKzsDeu43uqIcdS5mm+fwgVOC75sujNQnyeP0RmO/q53Es2Lx+S4o
         DKoBBcnRm8FDdMpT4l/33U+p2qmyMEgGK2oCoY983LCqiBVE6H8EtRJe+m2iK9hocvAM
         SXZOlUc8XFdvitiGjQcEgxrVTm0Fdb4xm9sMna169awL6LoqpvhBJKdUpQ81bg6v+4tI
         3rXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736864177; x=1737468977;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7S7xXbk865AhtSomZdFgJ04CMs5FhfIHVY8NLjBX7Zs=;
        b=ggaJ6WL6l4n4Ec5MR99RYfGu7DKK8G1IOW7yggjFeQreZnN4HLisqggvUD4OeD4X7c
         SMnd1coisoyUh+15rpjo24E1/rI0yQwkJkfX4A2LfXxf5OWcbmpb/hoB+vxzyJpekXbi
         N8MgObJJR1sQtKvHv3Lgqhy4mO0MZqmCZhckikI3ihUDTt0xdoSMg3rFaXiaUFYL7sAb
         WUEallYhwDI2EdLZGlq0blwco663y7d4jpktkHHcbfwFSVbyjQs2ym7tu4ddjuyW2Rmt
         zz2NorY7v7SoAOZcWtqICVMItdSDARVoAXRIg4RPoe0/i3AghHz/HffAxrmyy7os68K+
         nEIg==
X-Gm-Message-State: AOJu0YwmOUOytyYlXgdgIISEdWHabl+/ppt1cYgFZ1lefHjWAozWTAlS
	xCbR5EsvHcGNHVRw/89ZlQd00Nlj7IQhO+kupymunU03fmMAQZLXlFl+X2elpQ==
X-Gm-Gg: ASbGncs89MBk0bF9rRwtnAqTP8iz2staM0tWx685scSfVRktozRkoy882c55u5+L6jD
	FT3pIdBZRJDFrGz7DS8K8dv5p5Iu5uGw36bmffN3BIUzaN6iR4lLrFEeGcoYyPT14v482BlsMaJ
	rYR2rCX+GX+5frGPwfpRJBOt2ku2rQdpdgL6LfENR7hadIEc+b/TtOvakTg/vC6pgC/GpCzMCdr
	WkAj7v2UGOeyGAIPTs0iB4+94I80C+Df8vleJ+lJF+AChA=
X-Google-Smtp-Source: AGHT+IFLkLkcMQqzgkeDvoOHqqZ8Rm0DIqFBLCIoGKmd5DuqQomCP2udu1VXOtlQPOOS7GuW7/UbRA==
X-Received: by 2002:a05:6214:c8b:b0:6d8:e0a0:a949 with SMTP id 6a1803df08f44-6df9b28d637mr411926336d6.32.1736864177002;
        Tue, 14 Jan 2025 06:16:17 -0800 (PST)
Received: from kudzu.us ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dfade7327csm52944366d6.69.2025.01.14.06.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 06:16:16 -0800 (PST)
Date: Tue, 14 Jan 2025 09:16:15 -0500
From: Jon Mason <jdmason@kudzu.us>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH] edk2-firmware: fix PlatformStandaloneMmRpmb.dsc build
Message-ID: <Z4Zxr3b2FZ__mn8R@kudzu.us>
References: <20250114094154.304900-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114094154.304900-1-mikko.rapeli@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Jan 2025 14:16:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6322

On Tue, Jan 14, 2025 at 11:41:54AM +0200, Mikko Rapeli wrote:
> With backported patch from upstream. Error was:
> 
> | build.py...
> | /home/builder/src/base/repo/build/tmp_rockpi4b/work/rockpi4b-poky-linux/edk2-firmware/202408/edk2/edk2-platforms/Platform/StandaloneMm/PlatformS
> tandaloneMmPkg/PlatformStandaloneMmRpmb.dsc(...): error 4000: Instance of library class [HobPrintLib] is not found
> |       in [/home/builder/src/base/repo/build/tmp_rockpi4b/work/rockpi4b-poky-linux/edk2-firmware/202408/edk2/StandaloneMmPkg/Core/StandaloneMmCor
> e.inf] [AARCH64]
> |       consumed by module [/home/builder/src/base/repo/build/tmp_rockpi4b/work/rockpi4b-poky-linux/edk2-firmware/202408/edk2/StandaloneMmPkg/Core
> /StandaloneMmCore.inf]
> 
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>

I'm seeing this patch fail to apply (as part of the edk2 build
process) on every edk2 platform
https://gitlab.com/jonmason00/meta-arm/-/jobs/8844673217
https://gitlab.com/jonmason00/meta-arm/-/jobs/8844673227
https://gitlab.com/jonmason00/meta-arm/-/jobs/8844673281
https://gitlab.com/jonmason00/meta-arm/-/jobs/8844673312
https://gitlab.com/jonmason00/meta-arm/-/jobs/8844673331
https://gitlab.com/jonmason00/meta-arm/-/jobs/8844673346

Thanks,
Jon

> ---
>  meta-arm/recipes-bsp/uefi/edk2-firmware.inc   |  1 +
>  .../0001-Platform-StMmRpmb-Fix-build.patch    | 38 +++++++++++++++++++
>  2 files changed, 39 insertions(+)
>  create mode 100644 meta-arm/recipes-bsp/uefi/files/0001-Platform-StMmRpmb-Fix-build.patch
> 
> diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> index 42668d9d..c10154aa 100644
> --- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> +++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> @@ -20,6 +20,7 @@ SRCBRANCH_edk2_platforms = "master"
>  SRC_URI = "\
>      ${SRC_URI_EDK2};branch=${SRCBRANCH_edk2_platforms};name=edk2;destsuffix=edk2 \
>      ${SRC_URI_EDK2_PLATFORMS};branch=${SRCBRANCH_edk2};name=edk2-platforms;destsuffix=edk2/edk2-platforms \
> +    file://0001-Platform-StMmRpmb-Fix-build.patch;patchdir=edk2-platforms \
>  "
>  
>  SRCREV_FORMAT         = "edk2_edk2-platforms"
> diff --git a/meta-arm/recipes-bsp/uefi/files/0001-Platform-StMmRpmb-Fix-build.patch b/meta-arm/recipes-bsp/uefi/files/0001-Platform-StMmRpmb-Fix-build.patch
> new file mode 100644
> index 00000000..234ccf34
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/uefi/files/0001-Platform-StMmRpmb-Fix-build.patch
> @@ -0,0 +1,38 @@
> +From ee185eda7b7ec9a0c82827fea197fbb73d971f93 Mon Sep 17 00:00:00 2001
> +From: Ard Biesheuvel <ardb@kernel.org>
> +Date: Thu, 29 Aug 2024 21:21:50 +0200
> +Subject: [PATCH] Platform/StMmRpmb: Fix build
> +
> +Add some missing library class resolutions relating to changes in the
> +core upstream EDK2 repo.
> +
> +Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> +Reviewed-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> +---
> + .../PlatformStandaloneMmPkg/PlatformStandaloneMmRpmb.dsc       | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +Upstream-Status: Backport
> +
> +diff --git a/Platform/StandaloneMm/PlatformStandaloneMmPkg/PlatformStandaloneMmRpmb.dsc b/Platform/StandaloneMm/PlatformStandaloneMmPkg/PlatformStandaloneMmRpmb.dsc
> +index 653029c52f..54c7a63b41 100644
> +--- a/Platform/StandaloneMm/PlatformStandaloneMmPkg/PlatformStandaloneMmRpmb.dsc
> ++++ b/Platform/StandaloneMm/PlatformStandaloneMmPkg/PlatformStandaloneMmRpmb.dsc
> +@@ -41,11 +41,14 @@
> +   ExtractGuidedSectionLib|EmbeddedPkg/Library/PrePiExtractGuidedSectionLib/PrePiExtractGuidedSectionLib.inf
> +   FvLib|StandaloneMmPkg/Library/FvLib/FvLib.inf
> +   HobLib|StandaloneMmPkg/Library/StandaloneMmCoreHobLib/StandaloneMmCoreHobLib.inf
> ++  HobPrintLib|MdeModulePkg/Library/HobPrintLib/HobPrintLib.inf
> ++  ImagePropertiesRecordLib|MdeModulePkg/Library/ImagePropertiesRecordLib/ImagePropertiesRecordLib.inf
> +   IoLib|MdePkg/Library/BaseIoLibIntrinsic/BaseIoLibIntrinsic.inf
> +   NULL|MdePkg/Library/BaseStackCheckLib/BaseStackCheckLib.inf
> +   MemLib|StandaloneMmPkg/Library/StandaloneMmMemLib/StandaloneMmMemLib.inf
> +   MemoryAllocationLib|StandaloneMmPkg/Library/StandaloneMmCoreMemoryAllocationLib/StandaloneMmCoreMemoryAllocationLib.inf
> +   PcdLib|MdePkg/Library/BasePcdLibNull/BasePcdLibNull.inf
> ++  PeCoffGetEntryPointLib|MdePkg/Library/BasePeCoffGetEntryPointLib/BasePeCoffGetEntryPointLib.inf
> +   PeCoffLib|MdePkg/Library/BasePeCoffLib/BasePeCoffLib.inf
> +   PrintLib|MdePkg/Library/BasePrintLib/BasePrintLib.inf
> +   VariablePolicyLib|MdeModulePkg/Library/VariablePolicyLib/VariablePolicyLib.inf
> +-- 
> +2.43.0
> +
> -- 
> 2.43.0
> 
> 

