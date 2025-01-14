Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FED3C02183
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 15:20:26 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web11.48119.1736868020609848646
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jan 2025 07:20:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=3IVCyrqb;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.210.50, mailfrom: jdmason@kudzu.us)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-71e1d7130a5so2577137a34.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jan 2025 07:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1736868019; x=1737472819; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MbAGUjAcfjaETMbfUnvZHmhktAcXwIQCPdDqfXH8ck4=;
        b=3IVCyrqbrgMIh+oTUK5woX6eVsMbgTJiNiXnBx+ya6I0miWpEvOIAjubFkVvNwkYTb
         vbz0djVB6LkqV+yU9tW3fVXL4LaA1W20TGM5AjlC1v3lwzeWLop3V8YlpKjBX10lgCD2
         J5tEjKysV9vpmE5J/UPf02796OmQWZnl/A9FXdHIXjvquIN46PdcKwAo2gGfB/6pz3eJ
         giciYMtGF6hndPWIjkZ5pzPQf1GcJciG2vFpZB4osPBMy2dyKLBbedQzcuWR83HD4mUo
         OGclBXHqYjPfk6Iv40v12jyJsAClI6QQAyxfanLwWu/dlcn9JKphalQf3qr0H815O+uK
         LWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736868019; x=1737472819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MbAGUjAcfjaETMbfUnvZHmhktAcXwIQCPdDqfXH8ck4=;
        b=K6RVPUWe6AdhCfo0pcaaF5m/eh1RqI2c77HlW/LluyZQyihvAatPz6WjzLLO+2W7mG
         92mbnW288n/0O/Gc8l7yxSYmgZqaexqe0aTpjjeXG4L0aydAyD2zfQ9ekk4O7s/ViqHm
         wtnqayRXfLLCTBpWfcMEYN4Uw5O1s7Z2ESl3jSVHKtx6C7SEBghFvW/zpg29xlLsvehG
         FGCQu0U2yPQ4yzm5qHMBRWtbrwystyfWGbCUrB0emehQGoxW37vY55F3eEy9otMx2vYR
         YD71LO7nmvLeos4U5nI9PMxxngg2gwJfax4apRmXyPTg5S/5nKlUY09DxkfEb2o3y+2/
         g/3w==
X-Gm-Message-State: AOJu0YxqXSNX1fd82xw17fgxeDtlgB3NqEYN9Xl/B/BJ2SOCO2Fgsvdw
	BtZ6QUPalmg7K1BB5gpZL9YWPn2DWFHuqLZIEMm1XIkhyn6ulKSWZhou+qXxjUfJvQ35WHEA/6P
	jYdBKVauYpo9bbsM4Nyp1YH5qMX8xd6zwpk2i
X-Gm-Gg: ASbGncv6CPUlz3qRYMaHRncJcqvKLvlHLro/osjrn6xdMPrN+ICZimhfwop36YD/4gj
	htnmmh2Cmg/AM4XzmB7CiokvLft2IDlVHQbuSiQ==
X-Google-Smtp-Source: AGHT+IGLoTgE31GSkTA2CkmfiTz8UEDpUC8/MgDRkvxzc1cPjI0dzcwu7WtpGiVbjrxj5uT2Hk+LoReitJqa8kUvvT8=
X-Received: by 2002:a05:6870:a691:b0:29d:c999:b90c with SMTP id
 586e51a60fabf-2aa065118c4mr10001889fac.1.1736868019562; Tue, 14 Jan 2025
 07:20:19 -0800 (PST)
MIME-Version: 1.0
References: <20250114094154.304900-1-mikko.rapeli@linaro.org>
 <Z4Zxr3b2FZ__mn8R@kudzu.us> <Z4Z3-bsTlysMbOiH@nuoska>
In-Reply-To: <Z4Z3-bsTlysMbOiH@nuoska>
From: Jon Mason <jdmason@kudzu.us>
Date: Tue, 14 Jan 2025 10:20:09 -0500
X-Gm-Features: AbW1kvYSSojxAPkO5CuFBhFGoCkUssIbCgGd0JY8a-cRC9Z_Qb6G5mNVcxItYEE
Message-ID: <CAPoiz9xB6rP9mQxdsJUJrCoW7c8-J8bak_YjNL1kBSLvJ2EqEQ@mail.gmail.com>
Subject: Re: [PATCH] edk2-firmware: fix PlatformStandaloneMmRpmb.dsc build
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Jan 2025 15:20:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6324

On Tue, Jan 14, 2025 at 9:43=E2=80=AFAM Mikko Rapeli <mikko.rapeli@linaro.o=
rg> wrote:
>
> Hi,
>
> On Tue, Jan 14, 2025 at 09:16:15AM -0500, Jon Mason wrote:
> > On Tue, Jan 14, 2025 at 11:41:54AM +0200, Mikko Rapeli wrote:
> > > With backported patch from upstream. Error was:
> > >
> > > | build.py...
> > > | /home/builder/src/base/repo/build/tmp_rockpi4b/work/rockpi4b-poky-l=
inux/edk2-firmware/202408/edk2/edk2-platforms/Platform/StandaloneMm/Platfor=
mS
> > > tandaloneMmPkg/PlatformStandaloneMmRpmb.dsc(...): error 4000: Instanc=
e of library class [HobPrintLib] is not found
> > > |       in [/home/builder/src/base/repo/build/tmp_rockpi4b/work/rockp=
i4b-poky-linux/edk2-firmware/202408/edk2/StandaloneMmPkg/Core/StandaloneMmC=
or
> > > e.inf] [AARCH64]
> > > |       consumed by module [/home/builder/src/base/repo/build/tmp_roc=
kpi4b/work/rockpi4b-poky-linux/edk2-firmware/202408/edk2/StandaloneMmPkg/Co=
re
> > > /StandaloneMmCore.inf]
> > >
> > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> >
> > I'm seeing this patch fail to apply (as part of the edk2 build
> > process) on every edk2 platform
> > https://gitlab.com/jonmason00/meta-arm/-/jobs/8844673217
> > https://gitlab.com/jonmason00/meta-arm/-/jobs/8844673227
> > https://gitlab.com/jonmason00/meta-arm/-/jobs/8844673281
> > https://gitlab.com/jonmason00/meta-arm/-/jobs/8844673312
> > https://gitlab.com/jonmason00/meta-arm/-/jobs/8844673331
> > https://gitlab.com/jonmason00/meta-arm/-/jobs/8844673346
>
> Oh, I did not see this. I will try to reproduce. Seems to be line ending
> issue. edk2 sources use Windows ones. I hope mailing list patch doesn't c=
hange
> something...

Talking to Ross, and he reminded me that email messes up edk2 patches
(specifically).  Do you have a git tree with this patch that I can
cherry-pick from?

Thanks,
Jon

> Cheers,
>
> -Mikko
>
> > Thanks,
> > Jon
> >
> > > ---
> > >  meta-arm/recipes-bsp/uefi/edk2-firmware.inc   |  1 +
> > >  .../0001-Platform-StMmRpmb-Fix-build.patch    | 38 +++++++++++++++++=
++
> > >  2 files changed, 39 insertions(+)
> > >  create mode 100644 meta-arm/recipes-bsp/uefi/files/0001-Platform-StM=
mRpmb-Fix-build.patch
> > >
> > > diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/r=
ecipes-bsp/uefi/edk2-firmware.inc
> > > index 42668d9d..c10154aa 100644
> > > --- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> > > +++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> > > @@ -20,6 +20,7 @@ SRCBRANCH_edk2_platforms =3D "master"
> > >  SRC_URI =3D "\
> > >      ${SRC_URI_EDK2};branch=3D${SRCBRANCH_edk2_platforms};name=3Dedk2=
;destsuffix=3Dedk2 \
> > >      ${SRC_URI_EDK2_PLATFORMS};branch=3D${SRCBRANCH_edk2};name=3Dedk2=
-platforms;destsuffix=3Dedk2/edk2-platforms \
> > > +    file://0001-Platform-StMmRpmb-Fix-build.patch;patchdir=3Dedk2-pl=
atforms \
> > >  "
> > >
> > >  SRCREV_FORMAT         =3D "edk2_edk2-platforms"
> > > diff --git a/meta-arm/recipes-bsp/uefi/files/0001-Platform-StMmRpmb-F=
ix-build.patch b/meta-arm/recipes-bsp/uefi/files/0001-Platform-StMmRpmb-Fix=
-build.patch
> > > new file mode 100644
> > > index 00000000..234ccf34
> > > --- /dev/null
> > > +++ b/meta-arm/recipes-bsp/uefi/files/0001-Platform-StMmRpmb-Fix-buil=
d.patch
> > > @@ -0,0 +1,38 @@
> > > +From ee185eda7b7ec9a0c82827fea197fbb73d971f93 Mon Sep 17 00:00:00 20=
01
> > > +From: Ard Biesheuvel <ardb@kernel.org>
> > > +Date: Thu, 29 Aug 2024 21:21:50 +0200
> > > +Subject: [PATCH] Platform/StMmRpmb: Fix build
> > > +
> > > +Add some missing library class resolutions relating to changes in th=
e
> > > +core upstream EDK2 repo.
> > > +
> > > +Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > > +Reviewed-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> > > +---
> > > + .../PlatformStandaloneMmPkg/PlatformStandaloneMmRpmb.dsc       | 3 =
+++
> > > + 1 file changed, 3 insertions(+)
> > > +
> > > +Upstream-Status: Backport
> > > +
> > > +diff --git a/Platform/StandaloneMm/PlatformStandaloneMmPkg/PlatformS=
tandaloneMmRpmb.dsc b/Platform/StandaloneMm/PlatformStandaloneMmPkg/Platfor=
mStandaloneMmRpmb.dsc
> > > +index 653029c52f..54c7a63b41 100644
> > > +--- a/Platform/StandaloneMm/PlatformStandaloneMmPkg/PlatformStandalo=
neMmRpmb.dsc
> > > ++++ b/Platform/StandaloneMm/PlatformStandaloneMmPkg/PlatformStandalo=
neMmRpmb.dsc
> > > +@@ -41,11 +41,14 @@
> > > +   ExtractGuidedSectionLib|EmbeddedPkg/Library/PrePiExtractGuidedSec=
tionLib/PrePiExtractGuidedSectionLib.inf
> > > +   FvLib|StandaloneMmPkg/Library/FvLib/FvLib.inf
> > > +   HobLib|StandaloneMmPkg/Library/StandaloneMmCoreHobLib/StandaloneM=
mCoreHobLib.inf
> > > ++  HobPrintLib|MdeModulePkg/Library/HobPrintLib/HobPrintLib.inf
> > > ++  ImagePropertiesRecordLib|MdeModulePkg/Library/ImagePropertiesReco=
rdLib/ImagePropertiesRecordLib.inf
> > > +   IoLib|MdePkg/Library/BaseIoLibIntrinsic/BaseIoLibIntrinsic.inf
> > > +   NULL|MdePkg/Library/BaseStackCheckLib/BaseStackCheckLib.inf
> > > +   MemLib|StandaloneMmPkg/Library/StandaloneMmMemLib/StandaloneMmMem=
Lib.inf
> > > +   MemoryAllocationLib|StandaloneMmPkg/Library/StandaloneMmCoreMemor=
yAllocationLib/StandaloneMmCoreMemoryAllocationLib.inf
> > > +   PcdLib|MdePkg/Library/BasePcdLibNull/BasePcdLibNull.inf
> > > ++  PeCoffGetEntryPointLib|MdePkg/Library/BasePeCoffGetEntryPointLib/=
BasePeCoffGetEntryPointLib.inf
> > > +   PeCoffLib|MdePkg/Library/BasePeCoffLib/BasePeCoffLib.inf
> > > +   PrintLib|MdePkg/Library/BasePrintLib/BasePrintLib.inf
> > > +   VariablePolicyLib|MdeModulePkg/Library/VariablePolicyLib/Variable=
PolicyLib.inf
> > > +--
> > > +2.43.0
> > > +
> > > --
> > > 2.43.0
> > >
> > >

