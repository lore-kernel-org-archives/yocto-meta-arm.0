Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C72C6FD1F
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 18:05:34 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.2120.1712081126774388533
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 02 Apr 2024 11:05:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=qMY90Pvo;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-78a60d10eeeso361736185a.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 02 Apr 2024 11:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1712081126; x=1712685926; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FgpqFm8/1iXeEE9EwWhmlKYqFs/6Lil5uzJTHQvfjTM=;
        b=qMY90Pvocd44oS/VM9sy/GzRMQPF1NrutGycoccPNxf4UothSCzYfI9NxaqEV69z1E
         hogZ8g20IitXSpEUluAS68iZpWfitUlLzmXtEfAjTvo7Kkw629lKeJCIV2qIPKxfpCZp
         rBHCz8mqjLtXrDoGlIEATTnM9H3IIdAWPc+dPu4NR0Lv8WIYkaZoeG2cVTu1zHHyMv2m
         SvOGxYd40FSeNEY/ZbWFUO1uAV7ROAj8tfDj0RBSRGeqrCmE0N/GSWeCzlAUKhTxkLsO
         AC+XVDhsu5yh483OwbLwHwfnYHWy2TB21QbQgZZUN+TTW/ZQvfkXvPEZnyOiIHt+sH1V
         iTuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712081126; x=1712685926;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FgpqFm8/1iXeEE9EwWhmlKYqFs/6Lil5uzJTHQvfjTM=;
        b=HqJsALv/elx5YxaXoHQUeKp2bOLiTMuJmqaxEJZJiqA9QYtuiRPrlNuuLC2wd+RjIK
         3XmF8AThOGiuTj6TdoBxrSxxbdtqx4qriAoFaDJ09YyHZnmrjng1UdpHVAwjA2bdhskq
         RrYaf30BI8SwsfpmZvh3mgD9rCB7AVlxenRknE+5KEjtp5EaTaeJmXRGAKjuV8ZI3oe9
         uPM3KZtTll5j9rncKnivEHOJDelZZzQTgSvMlDIE1onS5zFVSMJa1Pbn7ma/q9u9g88h
         JphFQKvDPAoQGzOfqXc7Rmcm/qQfejeV4aY4xUv+w5/1PFXvHH1vMKfCB4AcAKToWA5X
         nYtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVr/hlDVMl5Og9E7eKvpmdzR0n18rF4BS8W2ZJSSLd4uRh+zbeJCgSvHGv+v+iXW+oUI83Z3BoaYx5LsePeTLvqLn0mTaCyD5m7CPD/Si8k
X-Gm-Message-State: AOJu0YxdSi3DbOoG1phYB7ST/KXHDVqEndpFml+wb7RB4Qm5X+a4bHwD
	xuC64Cx7yCaFWjr11necvNmUW3NKShRjy4rdT/wngJAiiJWAoYukdbf0tZD4Xg==
X-Google-Smtp-Source: AGHT+IHbd2rbQmIlqwe4wZQC1V5y7oH4QvLvDuVk9y9qpUxuPL0V+G76mfVX9GO/K4dtR3SdmvoMbA==
X-Received: by 2002:a05:620a:45aa:b0:789:f507:2039 with SMTP id bp42-20020a05620a45aa00b00789f5072039mr18085675qkb.29.1712081125820;
        Tue, 02 Apr 2024 11:05:25 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a699:ba00:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id s15-20020a05620a16af00b0078a3a448228sm4476636qkj.85.2024.04.02.11.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 11:05:25 -0700 (PDT)
Date: Tue, 2 Apr 2024 14:05:18 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Ross Burton <Ross.Burton@arm.com>, Jon Mason <Jon.Mason@arm.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [PATCH v2] arm/trusted-firmware-rmm: Add bitbake, include and
 patch file for RMM
Message-ID: <ZgxI3qH5lk5yS+RU@kudzu.us>
References: <20240326202001.1075940-1-mathieu.poirier@linaro.org>
 <86E1B306-3BC6-45B7-821B-D24DA64F42B5@arm.com>
 <CANLsYkz674p_HBq3tNuEi=65z8K7KTzNH8S-W29SpXspq8U=gA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANLsYkz674p_HBq3tNuEi=65z8K7KTzNH8S-W29SpXspq8U=gA@mail.gmail.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 02 Apr 2024 18:05:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5506

On Mon, Apr 01, 2024 at 02:27:42PM -0600, Mathieu Poirier wrote:
> Hi Ross,
> 
> On Wed, 27 Mar 2024 at 07:05, Ross Burton <Ross.Burton@arm.com> wrote:
> >
> > Hi Mattieu,
> >
> > On 26 Mar 2024, at 20:20, Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
> > > +SRC_URI_RMM     ?= "gitsm://git.trustedfirmware.org/TF-RMM/tf-rmm.git;protocol=https"
> > > +SRCREV_rmm     ?= "0a02656945d69757b0779192cebb9b41dd9037d1"
> > > +SRCBRANCH_rmm     ?= "main"
> > > +
> > > +SRC_URI = "${SRC_URI_RMM};name=rmm;branch=${SRCBRANCH_rmm} \
> > > +   file://0001-build-lib-Add-extra-repositories-for-system-includes.patch \
> > > + "
> >
> > Is there a good reason for all of this indirection?  If you want to support building from a local source tree/fork, there’s a class that does that generally (externalsrc).
> >
> 
> I have addressed all your comments except the one above related to the
> externalsrc classe.  What I currently have in the recipe follows what
> is found in trusted-firmware-a and trusted-firmware-m.  Moreover, the
> documentation in the externalsrc class mentions it is to "build a
> piece of software rather than the usual fetch/unpack/patch process".
> But for RMM we need to fetch and patch...
> 
> I am puzzled as to how to proceed - can you provide more details on
> what you expect?

IIUC, he is saying the above should be:

SRC_URI = "gitsm://git.trustedfirmware.org/TF-RMM/tf-rmm.git;protocol=https;branch=main \
           file://0001-build-lib-Add-extra-repositories-for-system-includes.patch \
          "
SRCREV = "0a02656945d69757b0779192cebb9b41dd9037d1"


All the "_rmm" indirection is only needed if you are going to have
multiple sources.  Since this only has one, it just adds unnecessary
complexity.  Similarily, the "?=" is only needed if there is going to
be an override of the values in those fields.  Since this is all in
one file and nothing is referencing this file, this shouldn't be
neessary.

TF-A and TF-M are based on ".inc" files that can (and do) have
multiple "versioned" files.  For example, 
./meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.9.0.bb
./meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.8.6.bb
./meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.2.bb

Each one of those is just the minor modifications to get that version
working, with a core ".inc" file doing all the work.  Since rmm is a
more simple recipe, none of that is needed here.

Thanks,
Jon


> 
> Thanks,
> Mathieu
> 
> > > +RMM_CONFIG ?= "qemu_virt_defcfg"
> >
> > The “default” isn’t qemu, as that isn’t useful for anything but qemu.  A better solution would be:
> >
> > RMM_CONFIG ?= “"
> > RMM_CONFIG:qemuarm64 = “qemu_virt_defcfg”
> >
> > Also this recipe needs some COMPATIBLE_MACHINE statements, so that a world build won’t try and build it for eg qemux86-64.
> >
> > > +B = "${WORKDIR}/build"
> >
> > cmake class sets B already, remove.
> >
> > > +# Supplement include path
> > > +EXTRA_OECMAKE += "-DCMAKE_INCLUDE_PATH=${WORKDIR}/recipe-sysroot/usr/include"
> >
> > -DCMAKE_INCLUDE_PATH=${STAGING_INCDIR} would be neater, but this really does feel like a bug in the CMakeLists.txt.  Why doesn’t it respect the sysroot that the compiler is told to use?  We carefully configure a toolchain that specifies exactly what compiler, sysroot, flags, etc to use.
> >
> > > +export CROSS_COMPILE="${TARGET_PREFIX}"
> > > +export CMAKE_BUILD_PARALLEL_LEVEL = "${@oe.utils.parallel_make(d, False)}"
> >
> > CMake class should be doing this, remove.
> >
> > Ross
> 

