Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web11.1672.1593024029169758571
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 24 Jun 2020 11:40:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=ccYsyD4J;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f194.google.com with SMTP id j10so2504667qtq.11
        for <meta-arm@lists.yoctoproject.org>; Wed, 24 Jun 2020 11:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QCd2QpXssooGOV8LcXAanS9LIkmo9xiUu2uygh/LlK0=;
        b=ccYsyD4JJAX9zwtuOEMCu4MAYWvCt1F2tCHFWcx+UcFJTtfvYPRiNlf879sCP1w1Sg
         Y9oygDILTIkY0+VxSN1rmDapn2aaytsfTiBOjCJOfyl4Fo6N3V5iyY+DTyZp//DnoWeg
         XalTnY/QAj8+BHf72vQ2ufM0DkiGwycUDF4+AFcNc6kmh9Zs6LUWVYrgElKC2OVf4ThA
         2+MWLjoAtOymaMpKtDsIJ4O0IhdiDBzmnG2xUzPuJRsi05fAtL5PbHS3GLDQSBvGx6ly
         Mxo0qTqkxpuxn/EXMEO0+I4LtpNjOb8SecnR4b1V4HcKGCg1LhB4DKhUqBgq6Cysgxof
         NT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QCd2QpXssooGOV8LcXAanS9LIkmo9xiUu2uygh/LlK0=;
        b=pxamrQxCLgaQBhLuOrYyXVoDkJ/QrEmWPD8qieHAB+o512MNRDVBkJiKxFAlh1lJg7
         ilq4iwtNyb3WmaiW1XL7i4RApQ5tCEVXCae8Q/9LcbCczzk0ANEnznDnqKv0OG+YMc6I
         LXaNBpgPr0ptXoQ7xjb/SQ8INR7/x1kp/t/o1T12do3GqsLrnJb9TIDko6cVDMckN4xk
         wbl0GhZIOmlgyopyrpH+lQovBJFZDo2eAm630Y2Rpg4D0FtwA1vP0Wk6vWHL+2KrYLPU
         Ait0bSUVnCuNySa2QgM/A2HDnL/+7R/JwyAk4DH1vRp09g7slKVpZwgusWmie0DhVrCf
         Ygxg==
X-Gm-Message-State: AOAM533XYNSR/N30oeKCFMbFTMqF11Y9AN/B3LB1jN3wNfYeQIBXUaNQ
	IH3949WfhcHAKUQvnk3yQ/c1b1Ptih4FvA==
X-Google-Smtp-Source: ABdhPJzyib/86UaKkrlocAoQAHh5h8W2XbPEgklh3WJAydmKi6EvSW32zgH+bvqdVTjE22dAKKLygQ==
X-Received: by 2002:ac8:2dea:: with SMTP id q39mr28707802qta.2.1593024028283;
        Wed, 24 Jun 2020 11:40:28 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:cc98:88db:f64a:7953])
        by smtp.gmail.com with ESMTPSA id y16sm3977517qkb.116.2020.06.24.11.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 11:40:28 -0700 (PDT)
Date: Wed, 24 Jun 2020 14:40:26 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/2] arm/scp-firmware : allow setting scp log level to INFO or WARN
Message-ID: <20200624184026.GC5282@kudzu.us>
References: <20200622141735.4951-1-khasim.mohammed@arm.com>
 <31688.1592895943168936989@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <31688.1592895943168936989@lists.yoctoproject.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 23, 2020 at 12:05:43AM -0700, Diego Sueiro wrote:
> On Mon, Jun 22, 2020 at 03:18 PM, Khasim Mohammed wrote:
> 
> >
> > SCP code has been updated with new logging framework. The patch
> > is to allow setting of log level parameter to INFO or WARN.
> > 
> > Change-Id: I20ec19a9aa1bdb7f59c067d2344c299c057a088b
> > Issue-Id: PLATFORMS-3134
> > Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> 
> Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

Pulled into master.

Thanks,
Jon

> 
> > ---
> >  meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc    | 2 ++
> >  meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb | 2 +-
> >  2 files changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> > b/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> > index 1873848..2db59d3 100644
> > --- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> > +++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> > @@ -6,6 +6,7 @@ SCP_BUILD_RELEASE   ?= "1"
> >  SCP_COMPILE_VERBOSE ?= "0"
> >  SCP_PLATFORM        ?= "invalid"
> >  SCP_COMPILER        ?= "arm-none-eabi"
> > +SCP_LOG_LEVEL       ?= "WARN"
> >
> >  DEPENDS += "virtual/arm-none-eabi-gcc-native"
> >
> > @@ -39,6 +40,7 @@ EXTRA_OEMAKE = "${SCP_COMP_STR} \
> >                  BUILD_PATH='${B}' \
> >                  PRODUCT='${SCP_PLATFORM}' \
> >                  MODE='${SCP_BUILD_STR}' \
> > +                LOG_LEVEL='${SCP_LOG_LEVEL}' \
> >                  CC='${SCP_COMPILER}-gcc' \
> >                  AR='${SCP_COMPILER}-ar' \
> >                  SIZE='${SCP_COMPILER}-size' \
> > diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> > b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> > index 5ff5859..9cb8b64 100644
> > --- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> > +++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> > @@ -13,7 +13,7 @@ SRC_URI = "\
> >     
> > git://github.com/ARM-software/CMSIS_5.git;protocol=https;name=cmsis;destsuffix=src/cmsis;lfs=0;nobranch=1
> > \
> >  "
> >
> > -SRCREV_scp    = "db19910aca6d1032eb0329e5fbb70a92b997f6f2"
> > +SRCREV_scp    = "fd7c83561a7d76c7681d5d017fb23aa3664c028c"
> >  SRCREV_cmsis  = "refs/tags/5.2.0"
> >  SRCREV_FORMAT = "scp_cmsis"
> >
> > -- 
> > 2.17.1
> > 
> >

> 

