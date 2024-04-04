Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F34CD1292
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 19:46:43 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.2133.1712259995971400798
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 Apr 2024 12:46:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=lBI1Rdr7;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-432d5b5f00bso10677951cf.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 04 Apr 2024 12:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1712259995; x=1712864795; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BBwmcL2NNDQFF2Rm3McyTWJo+dp7Ne+TsGSQuUgaEOs=;
        b=lBI1Rdr75bbTk5Bi2IHle0Fkovso6PjVE2aT+jEItDhFQG/FnVkf+GFAPp8Ob/4TPP
         42ee7H2Ku2CrhBrR1kvF2tV/66QAvdEKxpTpj3t58Poeni8YfTqLXoWHxz3sP6nhP1W5
         12PuqzKbjwSh0svp8vsen6qaTaLdO5Ph4Xugr4lTA7zxx9RvfoFxywadQObOwybYJb6B
         zl6guPTBifOi1ZiRrkYtHRNjruiCX701ZQJohzMjdz5wl8F3lICQzMO8/ya3ZoyQw6y4
         rCkkdYzbbWkoIa6BFdRY1mpfBtAfPlPPeEN0dRQ1larKVUSe//TAjBOWIb7UdsFUykYx
         1E9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712259995; x=1712864795;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BBwmcL2NNDQFF2Rm3McyTWJo+dp7Ne+TsGSQuUgaEOs=;
        b=krTr44gjamJfd77jiy//OfjQDsnDg7rwBay/87a11O44GLla+sktOQN6yjzfEAstvB
         HpboqvB7eg/Cq8tut0szvUd+g6aJo2cu3i13xOKnS9IZpGnWFVHSlRB5I5mjIob24UQs
         HuDSbL5xfBIDefFrZkJZaAqtek8iiFaWr54L+xhWIer841ViqNWXQ6a8BpaSri0kW0TN
         86+st2CirrVgqBireppmL88/xjKz+AzuptzFOSPcpuhyelcgE5Cn7XVc1y4VW82mGsvW
         gHZsuQDik7eX48mCYSjTAhO3p7SOcZD/zr18gRy1bl4rJGYDmOQjM28PuSFyQiP8ObsE
         pBtA==
X-Forwarded-Encrypted: i=1; AJvYcCWGr0IIHfkFCwpPq88Kknb3lBXQ/4kYGqMUojj0yj3VJKo9omYkGGz44IJsYiEOvQ/+MRN7Rd2kCCmAJxRjv4SM1cp0aCczxUTwK6F5k8T1
X-Gm-Message-State: AOJu0Yyb2OafPF3oeHdoPKlcCW3Rmw2KDbs2CD0FItxbRzIYzie94pfL
	dmtGaR4r+786/98gBYw/4fdbydzS7G28S7G1mQ3IE9k4pgjGFsJAV/CPYMmvwg==
X-Google-Smtp-Source: AGHT+IFsNaTFcmftlKFFJwHnCiTnjqcBBHSzO6Z8kocAxA1YiBZShUUByD7NY9e1FK010KGz/Bz7gg==
X-Received: by 2002:a05:622a:3c6:b0:432:c8a8:7ba2 with SMTP id k6-20020a05622a03c600b00432c8a87ba2mr747141qtx.6.1712259994930;
        Thu, 04 Apr 2024 12:46:34 -0700 (PDT)
Received: from kudzu.us ([2605:a601:919e:c800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id hc15-20020a05622a2a0f00b004318358451fsm15190qtb.75.2024.04.04.12.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 12:46:34 -0700 (PDT)
Date: Thu, 4 Apr 2024 15:46:27 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Ross Burton <Ross.Burton@arm.com>, Jon Mason <Jon.Mason@arm.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [PATCH v2] arm/trusted-firmware-rmm: Add bitbake, include and
 patch file for RMM
Message-ID: <Zg8Dkz93PfAsYC+T@kudzu.us>
References: <20240326202001.1075940-1-mathieu.poirier@linaro.org>
 <86E1B306-3BC6-45B7-821B-D24DA64F42B5@arm.com>
 <CANLsYkz674p_HBq3tNuEi=65z8K7KTzNH8S-W29SpXspq8U=gA@mail.gmail.com>
 <ZgxI3qH5lk5yS+RU@kudzu.us>
 <CANLsYkzX50KzxVytv8dTBbFg2=2gU=XvvRem6NcG1RX7MZY71w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANLsYkzX50KzxVytv8dTBbFg2=2gU=XvvRem6NcG1RX7MZY71w@mail.gmail.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 04 Apr 2024 19:46:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5510

On Wed, Apr 03, 2024 at 10:40:42AM -0600, Mathieu Poirier wrote:
> On Tue, 2 Apr 2024 at 12:05, Jon Mason <jdmason@kudzu.us> wrote:
> >
> > On Mon, Apr 01, 2024 at 02:27:42PM -0600, Mathieu Poirier wrote:
> > > Hi Ross,
> > >
> > > On Wed, 27 Mar 2024 at 07:05, Ross Burton <Ross.Burton@arm.com> wrote:
> > > >
> > > > Hi Mattieu,
> > > >
> > > > On 26 Mar 2024, at 20:20, Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
> > > > > +SRC_URI_RMM     ?= "gitsm://git.trustedfirmware.org/TF-RMM/tf-rmm.git;protocol=https"
> > > > > +SRCREV_rmm     ?= "0a02656945d69757b0779192cebb9b41dd9037d1"
> > > > > +SRCBRANCH_rmm     ?= "main"
> > > > > +
> > > > > +SRC_URI = "${SRC_URI_RMM};name=rmm;branch=${SRCBRANCH_rmm} \
> > > > > +   file://0001-build-lib-Add-extra-repositories-for-system-includes.patch \
> > > > > + "
> > > >
> > > > Is there a good reason for all of this indirection?  If you want to support building from a local source tree/fork, there’s a class that does that generally (externalsrc).
> > > >
> > >
> > > I have addressed all your comments except the one above related to the
> > > externalsrc classe.  What I currently have in the recipe follows what
> > > is found in trusted-firmware-a and trusted-firmware-m.  Moreover, the
> > > documentation in the externalsrc class mentions it is to "build a
> > > piece of software rather than the usual fetch/unpack/patch process".
> > > But for RMM we need to fetch and patch...
> > >
> > > I am puzzled as to how to proceed - can you provide more details on
> > > what you expect?
> >
> > IIUC, he is saying the above should be:
> >
> > SRC_URI = "gitsm://git.trustedfirmware.org/TF-RMM/tf-rmm.git;protocol=https;branch=main \
> >            file://0001-build-lib-Add-extra-repositories-for-system-includes.patch \
> >           "
> > SRCREV = "0a02656945d69757b0779192cebb9b41dd9037d1"
> >
> >
> > All the "_rmm" indirection is only needed if you are going to have
> > multiple sources.  Since this only has one, it just adds unnecessary
> > complexity.  Similarily, the "?=" is only needed if there is going to
> > be an override of the values in those fields.  Since this is all in
> > one file and nothing is referencing this file, this shouldn't be
> > neessary.
> 
> Ok, but in my case I have a .bbappend file that does the following:
> 
> SRC_URI_RMM         =
> "gitsm://git.codelinaro.org/linaro/dcap/rmm.git;protocol=https"
> SRCREV_rmm          = "3212a781573db80df815db4b0e493c87f734840c"
> SRCBRANCH_rmm       = "rmm-v1.0-eac5"
> 
> Should I keep my current solution as I submitted it, keep the current
> solution but get rid of the {_rmm | RMM] or use what you have above
> and redefine SRC_URI and SRCREV in the .bbappend file?

If you are asking me if you should change your bbappend to match the
patch you are going to submit, I would say to change your bbappend.
As I expect the next version should be accepted.

The example above (of your bbappend) would be a simple overwrite of
the SRC_URI, because you are not reusing the git tree or branch.

Thanks,
Jon

> 
> >
> > TF-A and TF-M are based on ".inc" files that can (and do) have
> > multiple "versioned" files.  For example,
> > ./meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.9.0.bb
> > ./meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.8.6.bb
> > ./meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.2.bb
> >
> > Each one of those is just the minor modifications to get that version
> > working, with a core ".inc" file doing all the work.  Since rmm is a
> > more simple recipe, none of that is needed here.
> >
> > Thanks,
> > Jon
> >
> >
> > >
> > > Thanks,
> > > Mathieu
> > >
> > > > > +RMM_CONFIG ?= "qemu_virt_defcfg"
> > > >
> > > > The “default” isn’t qemu, as that isn’t useful for anything but qemu.  A better solution would be:
> > > >
> > > > RMM_CONFIG ?= “"
> > > > RMM_CONFIG:qemuarm64 = “qemu_virt_defcfg”
> > > >
> > > > Also this recipe needs some COMPATIBLE_MACHINE statements, so that a world build won’t try and build it for eg qemux86-64.
> > > >
> > > > > +B = "${WORKDIR}/build"
> > > >
> > > > cmake class sets B already, remove.
> > > >
> > > > > +# Supplement include path
> > > > > +EXTRA_OECMAKE += "-DCMAKE_INCLUDE_PATH=${WORKDIR}/recipe-sysroot/usr/include"
> > > >
> > > > -DCMAKE_INCLUDE_PATH=${STAGING_INCDIR} would be neater, but this really does feel like a bug in the CMakeLists.txt.  Why doesn’t it respect the sysroot that the compiler is told to use?  We carefully configure a toolchain that specifies exactly what compiler, sysroot, flags, etc to use.
> > > >
> > > > > +export CROSS_COMPILE="${TARGET_PREFIX}"
> > > > > +export CMAKE_BUILD_PARALLEL_LEVEL = "${@oe.utils.parallel_make(d, False)}"
> > > >
> > > > CMake class should be doing this, remove.
> > > >
> > > > Ross
> > >
> 

