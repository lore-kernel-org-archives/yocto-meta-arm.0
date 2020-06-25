Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web11.2410.1593113658901119044
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 25 Jun 2020 12:34:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=kGgsdJRm;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.65, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f65.google.com with SMTP id cv17so3382553qvb.13
        for <meta-arm@lists.yoctoproject.org>; Thu, 25 Jun 2020 12:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Y+QesgplNwBlSDVUVcBm8G1orCtLkJYKFo2DnodmYW8=;
        b=kGgsdJRmh1IqS2MsnlAEZPsiFZiuAkEx/zK2deU7vK7sU/1tNbt5rxbnLGuHW+qeeE
         hbf39KUzPAY9QvSpYn8/UFypv92nLEf2DrA6z0N4Ini5cUxxP9F+bxjIwIvEVuPIxELa
         Qa8hLBxIzSWTttiO0bf9r25i66RNuV5kzh18OMANbcupM8xYYPpI2O1AmWIlvfawSaLY
         aoBSEQZvMpmLFZdgPIzuvv9W2SvE9Qu57tqqTUwlR42RD/aJ1gB2ab846abcHO6rmOet
         QwTzwUBtFuC3x7OUP0Fl1SIIVaQX9laEy6u8nLPBINHBdI/HqhWAKeHagsWUQ2GIxffu
         NjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Y+QesgplNwBlSDVUVcBm8G1orCtLkJYKFo2DnodmYW8=;
        b=JdhUpsnHZB1mr2AuxD2jPqH+sGVwLUnH/3uqfKT3YySErE40E6ySTr3hncOc9d+c7n
         xFVizSpgkASUX0DfQDiMWzGlqYRqGa1Ey9cE5MYT8mAWMAPnbKZFr7MFdYt3QgzFSEPI
         hAdKER5O05ZzmvqoGJASU0AW3fLlDTcYgFjJzfPsbUuCdbWfqwrCiQ5C+odL0cDPSn+M
         8CFB2wqrS5rNH96PyCs49A3k+M0LLfzbvISvnRuFH5TFWG7YBAaikkmXzfNocLArAXdJ
         mYGdIHTwRm4N5K5nKmO/86YuxA+SvQLmXlO2mPgXSdshx0kNewCqFxWf1kqUhiDHbXXz
         kfqQ==
X-Gm-Message-State: AOAM533s5rqsitGyELaKH7RsWeNymWXq37jSo75DpqHaxIc68hzDN30B
	rYGarMlq0ZIoGsX0EW5PPO2dJH6QNU/FHQ==
X-Google-Smtp-Source: ABdhPJzBWl+9LUKqz9rCoFkr/l43ndlXZTCJySGtag4l7rHR1p9H3SnpaNj5YrJ9Oq5wOborREU4oA==
X-Received: by 2002:a0c:8e04:: with SMTP id v4mr38158533qvb.213.1593113657902;
        Thu, 25 Jun 2020 12:34:17 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:618e:7f32:eb8d:97af])
        by smtp.gmail.com with ESMTPSA id f127sm6577673qkb.55.2020.06.25.12.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 12:34:17 -0700 (PDT)
Date: Thu, 25 Jun 2020 15:34:15 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Khasim Mohammed <Khasim.Mohammed@arm.com>
Cc: Diego Sueiro <Diego.Sueiro@arm.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH 1/2] arm/scp-firmware : allow setting scp log level to INFO or WARN
Message-ID: <20200625193414.GB27139@kudzu.us>
References: <20200622141735.4951-1-khasim.mohammed@arm.com>
 <31688.1592895943168936989@lists.yoctoproject.org>
 <20200624184026.GC5282@kudzu.us>
 <DB8PR08MB49699B2CDA2A7AD1225E3A4FFA950@DB8PR08MB4969.eurprd08.prod.outlook.com>
 <20200625031111.GA17463@kudzu.us>
 <DB8PR08MB49699E16AF27A92EECAD5766FA920@DB8PR08MB4969.eurprd08.prod.outlook.com>
 <20200625163457.GA27139@kudzu.us>
 <DB8PR08MB4969B610175CA73EAF11A0F4FA920@DB8PR08MB4969.eurprd08.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DB8PR08MB4969B610175CA73EAF11A0F4FA920@DB8PR08MB4969.eurprd08.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 25, 2020 at 05:00:57PM +0000, Khasim Mohammed wrote:
> Hi Jon,
> 
> Ack'ed ,

Done.

> 
> ________________________________________
> From: Jon Mason <jdmason@kudzu.us>
> Sent: Thursday, June 25, 2020 10:04 PM
> To: Khasim Mohammed
> Cc: Diego Sueiro; meta-arm@lists.yoctoproject.org
> Subject: Re: [meta-arm] [PATCH 1/2] arm/scp-firmware : allow setting scp log level to INFO or WARN
> 
> On Thu, Jun 25, 2020 at 03:51:53AM +0000, Khasim Mohammed wrote:
> > Hi Jon,
> >
> > <reply inline>
> > ________________________________________
> > From: Jon Mason <jdmason@kudzu.us>
> > Sent: Thursday, June 25, 2020 8:41 AM
> > To: Khasim Mohammed
> > Cc: Diego Sueiro; meta-arm@lists.yoctoproject.org
> > Subject: Re: [meta-arm] [PATCH 1/2] arm/scp-firmware : allow setting scp log level to INFO or WARN
> >
> > On Wed, Jun 24, 2020 at 06:52:05PM +0000, Khasim Mohammed wrote:
> > > Hi Jon,
> > >
> > > ________________________________________
> > > From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org> on behalf of Jon Mason via lists.yoctoproject.org <jdmason=kudzu.us@lists.yoctoproject.org>
> > > Sent: Thursday, June 25, 2020 12:10 AM
> > > To: Diego Sueiro
> > > Cc: meta-arm@lists.yoctoproject.org
> > > Subject: Re: [meta-arm] [PATCH 1/2] arm/scp-firmware : allow setting scp log level to INFO or WARN
> > >
> > > On Tue, Jun 23, 2020 at 12:05:43AM -0700, Diego Sueiro wrote:
> > > > On Mon, Jun 22, 2020 at 03:18 PM, Khasim Mohammed wrote:
> > > >
> > > > >
> > > > > SCP code has been updated with new logging framework. The patch
> > > > > is to allow setting of log level parameter to INFO or WARN.
> > > > >
> > > > > Change-Id: I20ec19a9aa1bdb7f59c067d2344c299c057a088b
> > > > > Issue-Id: PLATFORMS-3134
> > > > > Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> > > >
> > > > Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>
> > >
> > > > Pulled into master.
> > >
> > > Can you please apply these three patches to dunfell branch as well ?
> > >
> > > https://lists.yoctoproject.org/g/meta-arm/topic/patch_2_2/75039153?p=,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,75039153
> > > https://lists.yoctoproject.org/g/meta-arm/topic/patch_1_2_arm_scp_firmware/75039137?p=,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,75039137
> > > https://lists.yoctoproject.org/g/meta-arm/topic/patch_arm_fiptool/75039113?p=,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,75039113
> >
> > > Looks like there is a problem on dunfell.  When compiling for n1sdp, I
> > > get the following error:
> >
> > >ERROR: Nothing PROVIDES 'virtual/arm-none-eabi-gcc-native' (but /home/jdm/yocto/meta-arm/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb DEPENDS on or otherwise requires it). Close matches:
> > >  virtual/mesa-native
> > >ERROR: Required build target 'core-image-sato' has no buildable providers.
> > > Missing or unbuildable dependency chain was: ['core-image-sato', 'virtual/control-processor-firmware', 'virtual/arm-none-eabi-gcc-native']
> >
> > > Can you confirm it compiles for you?
> >
> > You seem to have missed pushing your gcc patches to dunfell branch :
> >
> > http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/commit/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb?id=f9ece576ad476e6ed069dfdfc376eb422c1c511c
> >
> > http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/commit/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb?id=04eb583c4be5e7c36d457eb2d0dec35fef89ae52
> >
> > Can you please push these to dunfell as well ?
> 
> > Exclusively the above doesn't apply cleanly.  I think we need the
> > following:
> 
> 
> commit 9af4348fa0b83b2f5b318692c745716de5de0545 (HEAD)
> Author: Denys Dmytriyenko <denys@ti.com>
> Date:   Fri Jun 5 18:57:10 2020 -0400
> 
>     gcc-x86host.inc: properly link triplet-prefixed binaries
> 
>     Use the correct path for the binaries in ${datadir}, otherwise it results in a
>     single incorrect symlink like gcc-arm-none-eabi-*
> 
>     Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>     Signed-off-by: Jon Mason <jon.mason@arm.com>
> 
> commit d5bc2633f2c203aebf372fc80f7cb87d7621bed9
> Author: Denys Dmytriyenko <denys@ti.com>
> Date:   Fri Jun 5 18:57:09 2020 -0400
> 
>     gcc-aarch64-none-elf: properly set ${S} that is different from default
> 
>     Also use ${BINNAME} and ${PV} variables for automatic substitution.
> 
>     Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>     Signed-off-by: Jon Mason <jon.mason@arm.com>
> 
> commit dfafcf9ec274330ad8ae5d602e208ac35aba4139
> Author: Jon Mason <jdmason@kudzu.us>
> Date:   Thu May 28 09:33:17 2020 -0400
> 
>     arm-toolchain: merge binary toolchain recipes
> 
>     Merge the majority of the binary toolchain recipes for building on an
>     x86 host into a common include file.
> 
>     Also, found and fixed an error with both install commands where the name
>     was double nested on the copy.  For example,
>     /usr/share/arm-none-eabi/arm-none-eabi/ due to the way it was being
>     copied.
> 
>     Signed-off-by: Jon Mason <jdmason@kudzu.us>
>     Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>
> 
> commit 24181d47084cef34a794dfd88056fa9bc5583913
> Author: Denys Dmytriyenko <denys@ti.com>
> Date:   Wed May 20 04:47:18 2020 -0400
> 
>     arm-toolchain: gcc-aarch64-none-elf: Add recipe
> 
>     Adds a recipe to pull down the prebuilt GCC for compiling bare-metal targets
>     for Aarch64 processors from ARM.
> 
>     Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>     Signed-off-by: Jon Mason <jon.mason@arm.com>
> 
> commit e6ff4eb1d6683e967e4ef81bf5b42a087a47f6d5
> Author: Jon Mason <jdmason@kudzu.us>
> Date:   Thu May 14 21:36:20 2020 -0400
> 
>     arm-toolchain: gcc-arm-none-eabi-native: Add recipe
> 
>     Adds a recipe to pull down the prebuilt GCC for compiling on Cortex-R
>     and Cortex-M processors from ARM. This toolchain is required to build
>     Arm Trusted Firmware for the Rockchip rk3399 SoC, since it must compile
>     some firmware for the M0 coprocessor.
> 
>     This was originally taken from meta-rockchip, but has been modified from
>     mailing list feedback.
> 
>     Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>     Signed-off-by: Jon Mason <jdmason@kudzu.us>
>     Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>     Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>
>     Signed-off-by: Jon Mason <jon.mason@arm.com>
> 
> 
> > Please ack and I'll pull all 5 into dunfell.
> 
> Please consider these patches for dunfell branch.
> 
> Thanks,
> Jon
> 
> Regards,
> Khasim
> 
> >
> > Regards,
> > Khasim
> >
> > >
> > >
> > > Thanks
> > >
> > > Khasim
> > >
> > > > Thanks,
> > > > Jon
> > >
> > > >
> > > > > ---
> > > > >  meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc    | 2 ++
> > > > >  meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb | 2 +-
> > > > >  2 files changed, 3 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> > > > > b/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> > > > > index 1873848..2db59d3 100644
> > > > > --- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> > > > > +++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> > > > > @@ -6,6 +6,7 @@ SCP_BUILD_RELEASE   ?= "1"
> > > > >  SCP_COMPILE_VERBOSE ?= "0"
> > > > >  SCP_PLATFORM        ?= "invalid"
> > > > >  SCP_COMPILER        ?= "arm-none-eabi"
> > > > > +SCP_LOG_LEVEL       ?= "WARN"
> > > > >
> > > > >  DEPENDS += "virtual/arm-none-eabi-gcc-native"
> > > > >
> > > > > @@ -39,6 +40,7 @@ EXTRA_OEMAKE = "${SCP_COMP_STR} \
> > > > >                  BUILD_PATH='${B}' \
> > > > >                  PRODUCT='${SCP_PLATFORM}' \
> > > > >                  MODE='${SCP_BUILD_STR}' \
> > > > > +                LOG_LEVEL='${SCP_LOG_LEVEL}' \
> > > > >                  CC='${SCP_COMPILER}-gcc' \
> > > > >                  AR='${SCP_COMPILER}-ar' \
> > > > >                  SIZE='${SCP_COMPILER}-size' \
> > > > > diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> > > > > b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> > > > > index 5ff5859..9cb8b64 100644
> > > > > --- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> > > > > +++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> > > > > @@ -13,7 +13,7 @@ SRC_URI = "\
> > > > >
> > > > > git://github.com/ARM-software/CMSIS_5.git;protocol=https;name=cmsis;destsuffix=src/cmsis;lfs=0;nobranch=1
> > > > > \
> > > > >  "
> > > > >
> > > > > -SRCREV_scp    = "db19910aca6d1032eb0329e5fbb70a92b997f6f2"
> > > > > +SRCREV_scp    = "fd7c83561a7d76c7681d5d017fb23aa3664c028c"
> > > > >  SRCREV_cmsis  = "refs/tags/5.2.0"
> > > > >  SRCREV_FORMAT = "scp_cmsis"
> > > > >
> > > > > --
> > > > > 2.17.1
> > > > >
> > > > >
> > >
> > > >
> > >
> > > IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium. Thank you.
> > IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium. Thank you.
> IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium. Thank you.
