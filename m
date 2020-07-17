Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.11082.1594991625560672529
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 17 Jul 2020 06:13:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=uRYbsLEj;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f195.google.com with SMTP id i3so7497044qtq.13
        for <meta-arm@lists.yoctoproject.org>; Fri, 17 Jul 2020 06:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3hVD7QVkHLjNAebFwBot0nGg4QSXpoMM5hRzQkg48YA=;
        b=uRYbsLEj/ljf74vb8fP3GhCLJ9dlECiRupl5lR5ktdVqDX7OLi32hjXWiskg4UbeE5
         U0fPTSQZWfdR6/Q2pttGtjsHVEc1Q9+Eq800piYGNWmlJIX0wYg7IBsIcN2Dwed0RlYz
         9UXM6Z1hN7aQNh0GBCLMYJEizUdRll/kZGuncrOzReUGiNN8A5HRi1VxStYeDAR2+n+O
         fIVx8NRm5BGnoeFWJey8ksuWPEJxxgcXpzOsDXlv0H2xahARuuFBYXcQWq7FQa5kMEy4
         e+8xoGEEBqdO6ZAb7cKaWnCJo0l1E0LryNFWAK0r8kE1K4t/Dw2r7pBvT9NBgFpoQit9
         BeMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3hVD7QVkHLjNAebFwBot0nGg4QSXpoMM5hRzQkg48YA=;
        b=X/gCRk3ydChgoy9r8s7At1Y1hkZthIgvx+YbBjUc2jXmfg9IWw534vF3+QR0qr0RRC
         f/tAlxiDWOjaJ8Rura7/pVVy4IDEziJb45nObKM0TYfIHpeKZ1m+djUo5BriaLmu1blh
         eV/3FQmD8BfJduLsu95SP0l39GzdpYu8m6EJkKFD0Cf/vBWQBbXduPi4Y597/lZHmCbL
         8zb2R1JBcJWDgXYWAFpNxsTMqQaKmuyt48hZOcnplLbFwqRFmdIIpYpZx8U/HyyuqSbe
         ZpGNGYPEWxc3lMMRMmbKlDqrgBqCHjAKbrKsGBE+JjGsaXayTgo8RRc0Sj9fq/kwCpVN
         emiQ==
X-Gm-Message-State: AOAM5311RqrrOWHmYF3BRuZwzSJV2ofFIonngly3Km0Xf469m++35jU8
	ZrFYdSD/GjR8B8m3pccoOB2LIg==
X-Google-Smtp-Source: ABdhPJw7OmRnTDEHKYypb97l6y4PFyLvXs5E+BHVZ7R7iDEABrUYl6t+qD8Mc7ObzmXprLIDpKHtcw==
X-Received: by 2002:ac8:260b:: with SMTP id u11mr10490758qtu.380.1594991624595;
        Fri, 17 Jul 2020 06:13:44 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:8034:b667:f1cd:123f])
        by smtp.gmail.com with ESMTPSA id n143sm9752408qkn.94.2020.07.17.06.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 06:13:44 -0700 (PDT)
Date: Fri, 17 Jul 2020 09:13:42 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: Ross Burton <ross@burtonini.com>, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/6] arm-toolchain/external-arm-toolchain: rename common include
Message-ID: <20200717131342.GA26434@kudzu.us>
References: <20200716145542.232165-1-ross@burtonini.com>
 <CAFA6WYMAfPvB7sTzSpy7YGPixB8T20qmtTmqMoi8P4JfKYA55w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFA6WYMAfPvB7sTzSpy7YGPixB8T20qmtTmqMoi8P4JfKYA55w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 17, 2020 at 12:15:28PM +0530, Sumit Garg wrote:
> On Thu, 16 Jul 2020 at 20:25, Ross Burton <ross@burtonini.com> wrote:
> >
> > From: Ross Burton <ross.burton@arm.com>
> >
> > These recipes all used a common include
> > external-arm-toolchain-x86host.inc, but that name isn't very meaningful:
> > the recipes are for x86-64, there typically are more than x86-64
> > binaries available, and it's not for an external toolchain but
> > integrating a binary toolchain.
> >
> > Rename the include to arm-binary-toolchain.inc, as they're all the Arm
> > binary toolchain.
> >
> > Change-Id: I59f5faa7373686958e226db0aa68e7880d36400e
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  ...ernal-arm-toolchain-x86host.inc => arm-binary-toolchain.inc} | 0
> >  .../recipes-devtools/external-arm-toolchain/armcompiler_6.13.bb | 2 +-
> >  .../external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb  | 2 +-
> >  .../external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb | 2 +-
> >  4 files changed, 3 insertions(+), 3 deletions(-)
> >  rename meta-arm-toolchain/recipes-devtools/external-arm-toolchain/{external-arm-toolchain-x86host.inc => arm-binary-toolchain.inc} (100%)
> >
> 
> Looks good to me. For the series:
> 
> Reviewed-by: Sumit Garg <sumit.garg@linaro.org>

Series applied to master.

Thanks,
Jon

> 
> -Sumit
> 
> > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain-x86host.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
> > similarity index 100%
> > rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain-x86host.inc
> > rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
> > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompiler_6.13.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompiler_6.13.bb
> > index 4aeba68..7a7673b 100644
> > --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompiler_6.13.bb
> > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompiler_6.13.bb
> > @@ -3,7 +3,7 @@
> >  # Copyright (c) 2020 Arm Limited
> >  #
> >
> > -require external-arm-toolchain-x86host.inc
> > +require arm-binary-toolchain.inc
> >
> >  SUMMARY = "Baremetal Armcompiler for Cortex-A, Cortex-R and Cortex-M processors"
> >  HOMEPAGE = "https://developer.arm.com/tools-and-software/embedded/arm-compiler/downloads/version-6"
> > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
> > index a45fee0..020bbf8 100644
> > --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
> > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
> > @@ -1,7 +1,7 @@
> >  # Copyright (C) 2020 Texas Instruments Inc.
> >  # Released under the MIT license (see COPYING.MIT for the terms)
> >
> > -require external-arm-toolchain-x86host.inc
> > +require arm-binary-toolchain.inc
> >
> >  SUMMARY = "Baremetal GCC for Aarch64 processors"
> >  LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
> > index 6403fe1..77e44ce 100644
> > --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
> > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
> > @@ -1,7 +1,7 @@
> >  # Copyright (C) 2019 Garmin Ltd. or its subsidiaries
> >  # Released under the MIT license (see COPYING.MIT for the terms)
> >
> > -require external-arm-toolchain-x86host.inc
> > +require arm-binary-toolchain.inc
> >
> >  SUMMARY = "Baremetal GCC for ARM-R and ARM-M processors"
> >  LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> > --
> > 2.26.2
> >
> > 

> 

