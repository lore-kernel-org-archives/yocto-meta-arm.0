Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web10.2962.1593054674550134159
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 24 Jun 2020 20:11:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=FZzCc1A3;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f194.google.com with SMTP id 80so4061980qko.7
        for <meta-arm@lists.yoctoproject.org>; Wed, 24 Jun 2020 20:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Xtylq4R/7nkRCwz7UD7SBWh5Yp1yZcO/UF40a8LwJRc=;
        b=FZzCc1A3cG3Vh3fB1mWwjdUVYePCaxZ/k2Gm9D/2zg1P2ssIoevjx8Iif8fSs5BU8c
         BDJFpcPKmMGr/bfO+tR/G+Mtp8Qpq72LR0H4HgaQ6Q0D0CbvbNZoTSTr3bIVCXBul7KG
         CRJhYn9WX4pdApDUgejoglvUtHbk92dNAIF6gYOOjihf8fCon5IgUpuq3kTUoKCPDgCo
         rNniJK0GSowr49KeSOPqatwL8/ukzaS5QQM1C38kY3sNFSNhtSU84IEYfeu8YGWyhj8t
         GlKNdNh7u4F3Y3WF6CeGpKMJ3kpP/OVvhdsW3rDslvXSGD68DySEDoRNL6c6VkKIrFHh
         HtNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Xtylq4R/7nkRCwz7UD7SBWh5Yp1yZcO/UF40a8LwJRc=;
        b=NkktTBzhccs3F+eXEdOIMWJROWU5yuZJLVLIrtiWdlnkCFZKvy5DLYLXH/bk3SVjSK
         +mA7sT7jpKC/ySO6ROVl9fBOn5jdnDLUm4r51Z3BTNiTg3ALho/q1+OwaN6XTVgLlLWG
         s2NO/GheyNvkqRH94KVnt/y+4uJN35nDEPOp+rH16esMbY8sgqS4rwNjBvak901r6olI
         JaQv+8cMTtwhKIrETSetHHd1tpY65P8obMNG4+ustKVVUpvC4xVfnOBdLuM0EeF/juWY
         tg7wJ4D/u5oH2Zk4d+GAosFLvNVVFcQ6/FhAXykKvqndn3EjGRxviko+iU7bV0FXwQZC
         4fog==
X-Gm-Message-State: AOAM530nmRuekyNbvVqrhT88HCD0B7KRj2tdO2QQTMphvOg2LHy7cxkJ
	f0ylsC60v5vy6XgY9eIOpFAmsg==
X-Google-Smtp-Source: ABdhPJzOYF5EX6IZh/vdjFfEH7bpjQMGDpHRuNtweF5ylkx7aO9lNKPQIg9VoPpiCTvZlyRREztHdA==
X-Received: by 2002:a37:9cc7:: with SMTP id f190mr28151370qke.236.1593054673610;
        Wed, 24 Jun 2020 20:11:13 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:cc98:88db:f64a:7953])
        by smtp.gmail.com with ESMTPSA id 207sm4850841qki.134.2020.06.24.20.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 20:11:13 -0700 (PDT)
Date: Wed, 24 Jun 2020 23:11:11 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Khasim Mohammed <Khasim.Mohammed@arm.com>
Cc: Diego Sueiro <Diego.Sueiro@arm.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH 1/2] arm/scp-firmware : allow setting scp log level to INFO or WARN
Message-ID: <20200625031111.GA17463@kudzu.us>
References: <20200622141735.4951-1-khasim.mohammed@arm.com>
 <31688.1592895943168936989@lists.yoctoproject.org>
 <20200624184026.GC5282@kudzu.us>
 <DB8PR08MB49699B2CDA2A7AD1225E3A4FFA950@DB8PR08MB4969.eurprd08.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DB8PR08MB49699B2CDA2A7AD1225E3A4FFA950@DB8PR08MB4969.eurprd08.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 24, 2020 at 06:52:05PM +0000, Khasim Mohammed wrote:
> Hi Jon,
> 
> ________________________________________
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org> on behalf of Jon Mason via lists.yoctoproject.org <jdmason=kudzu.us@lists.yoctoproject.org>
> Sent: Thursday, June 25, 2020 12:10 AM
> To: Diego Sueiro
> Cc: meta-arm@lists.yoctoproject.org
> Subject: Re: [meta-arm] [PATCH 1/2] arm/scp-firmware : allow setting scp log level to INFO or WARN
> 
> On Tue, Jun 23, 2020 at 12:05:43AM -0700, Diego Sueiro wrote:
> > On Mon, Jun 22, 2020 at 03:18 PM, Khasim Mohammed wrote:
> >
> > >
> > > SCP code has been updated with new logging framework. The patch
> > > is to allow setting of log level parameter to INFO or WARN.
> > >
> > > Change-Id: I20ec19a9aa1bdb7f59c067d2344c299c057a088b
> > > Issue-Id: PLATFORMS-3134
> > > Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> >
> > Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>
> 
> > Pulled into master.
> 
> Can you please apply these three patches to dunfell branch as well ?
> 
> https://lists.yoctoproject.org/g/meta-arm/topic/patch_2_2/75039153?p=,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,75039153
> https://lists.yoctoproject.org/g/meta-arm/topic/patch_1_2_arm_scp_firmware/75039137?p=,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,75039137
> https://lists.yoctoproject.org/g/meta-arm/topic/patch_arm_fiptool/75039113?p=,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,75039113

Looks like there is a problem on dunfell.  When compiling for n1sdp, I
get the following error:

ERROR: Nothing PROVIDES 'virtual/arm-none-eabi-gcc-native' (but /home/jdm/yocto/meta-arm/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb DEPENDS on or otherwise requires it). Close matches:
  virtual/mesa-native
ERROR: Required build target 'core-image-sato' has no buildable providers.
Missing or unbuildable dependency chain was: ['core-image-sato', 'virtual/control-processor-firmware', 'virtual/arm-none-eabi-gcc-native']

Can you confirm it compiles for you?

Thanks,
Jon

> 
> 
> Thanks
> 
> Khasim
> 
> > Thanks,
> > Jon
> 
> >
> > > ---
> > >  meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc    | 2 ++
> > >  meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb | 2 +-
> > >  2 files changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> > > b/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> > > index 1873848..2db59d3 100644
> > > --- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> > > +++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> > > @@ -6,6 +6,7 @@ SCP_BUILD_RELEASE   ?= "1"
> > >  SCP_COMPILE_VERBOSE ?= "0"
> > >  SCP_PLATFORM        ?= "invalid"
> > >  SCP_COMPILER        ?= "arm-none-eabi"
> > > +SCP_LOG_LEVEL       ?= "WARN"
> > >
> > >  DEPENDS += "virtual/arm-none-eabi-gcc-native"
> > >
> > > @@ -39,6 +40,7 @@ EXTRA_OEMAKE = "${SCP_COMP_STR} \
> > >                  BUILD_PATH='${B}' \
> > >                  PRODUCT='${SCP_PLATFORM}' \
> > >                  MODE='${SCP_BUILD_STR}' \
> > > +                LOG_LEVEL='${SCP_LOG_LEVEL}' \
> > >                  CC='${SCP_COMPILER}-gcc' \
> > >                  AR='${SCP_COMPILER}-ar' \
> > >                  SIZE='${SCP_COMPILER}-size' \
> > > diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> > > b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> > > index 5ff5859..9cb8b64 100644
> > > --- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> > > +++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> > > @@ -13,7 +13,7 @@ SRC_URI = "\
> > >
> > > git://github.com/ARM-software/CMSIS_5.git;protocol=https;name=cmsis;destsuffix=src/cmsis;lfs=0;nobranch=1
> > > \
> > >  "
> > >
> > > -SRCREV_scp    = "db19910aca6d1032eb0329e5fbb70a92b997f6f2"
> > > +SRCREV_scp    = "fd7c83561a7d76c7681d5d017fb23aa3664c028c"
> > >  SRCREV_cmsis  = "refs/tags/5.2.0"
> > >  SRCREV_FORMAT = "scp_cmsis"
> > >
> > > --
> > > 2.17.1
> > >
> > >
> 
> >
> 
> IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium. Thank you.
