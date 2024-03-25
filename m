Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A20D3C54E58
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 15:41:43 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.55688.1711381295418982551
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 25 Mar 2024 08:41:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=0YIhSACD;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.167.169, mailfrom: jdmason@kudzu.us)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3c3915a7afaso2944944b6e.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 25 Mar 2024 08:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1711381294; x=1711986094; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iW4zV/XS7u0yhp5XZ1NaJV30g0gqVjjCVZWToacH6GY=;
        b=0YIhSACD/oQc9Sa9wtbwJ8oqmjs6lIUya64KbdbaxfRgoiSFe46qAB56Cazzz57LD6
         hNiacvfssu7YmZ7qa+CrpkZ6ABoBA3IRQMtD6JpsM34h+kUDqxKr60wcXlfsq4pL+0+v
         t0HT5bUiWmDVXItRrNEmL6QXL1kLV/TmoGhkloecF18HxdDBgks+0PLwbK6j+ATsfnjL
         aDLJtPVxunE3w39y0mrC+ByrVAX/cA3tKg7D+1t2zpiujzwE76NGCD7Dh7ZoDIVUA5X4
         jz55ZDKvrNHFBla0Qi7d3cDqF4Q6zGodTOyRlz9k8otr7jGq4R2pHWA5hsQjrjhNYl81
         Q+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711381294; x=1711986094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iW4zV/XS7u0yhp5XZ1NaJV30g0gqVjjCVZWToacH6GY=;
        b=ULs3a1lAp0BLNDJN8jb8miQyI40msFbga7aqt+aYuPVS/NtYpp97kZOSGIm4Wqscbx
         4qdXcVF3T/fAOfpNZOHcccAaTYUn4UkkrRzyTEMT7MS20E3UAhxT+WnJT3Va46qxd7xR
         WAuge4UE8jlAMrt9e/VWY88RBK8fzisV0TrFek0xFEi84dxPqYPD4GocltoHdfrrQMSd
         1hI5ojXi5qawFYoI0cGAHWbQCdQeJBwpiAZhclDX3b49MSbhzTg47XETPDvSFSFORGPd
         g92tILu/TiQdkz/ve5c+4SAyNE5K1yqYeKBi3UJ7UjfVhgV+VkGmnJ17rZ/XU9ikhh+s
         Yuaw==
X-Gm-Message-State: AOJu0YwO+c64/5lGo2wBn98uBT8hnv5jLYRfJHQsP11BykJQsTmHf3FM
	ugLpJr9HHuaAbEFPMD1OmjseaKhFnhPjDiP80pq/R/gHwirFC1q3vallNd0NDg==
X-Google-Smtp-Source: AGHT+IFIsHfPsNGfszQX7MJPo3EHM0J6K+5SwOx4dGqNMFu/v/YXzzJ8r3D8wKokXiMI2htyJzkQTg==
X-Received: by 2002:a05:6808:4496:b0:3c3:a606:8076 with SMTP id eq22-20020a056808449600b003c3a6068076mr11591975oib.16.1711381294597;
        Mon, 25 Mar 2024 08:41:34 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id ck4-20020a05622a230400b00430dcca3fb5sm2699817qtb.16.2024.03.25.08.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 08:41:34 -0700 (PDT)
Date: Mon, 25 Mar 2024 11:41:27 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH 1/1] arm/rmm: Add bitbake, include and patch file for RMM
 firmware
Message-ID: <ZgGbJ92TEJCbHuw/@kudzu.us>
References: <20240304231639.4187147-1-mathieu.poirier@linaro.org>
 <20240304231639.4187147-2-mathieu.poirier@linaro.org>
 <Zenqb53VZ2dOXkgc@kudzu.us>
 <CANLsYky03gRORyOu=MorxugZfae2_6AjisHLbk=ho5Gxm9Qc0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYky03gRORyOu=MorxugZfae2_6AjisHLbk=ho5Gxm9Qc0A@mail.gmail.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 25 Mar 2024 15:41:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5486

On Fri, Mar 22, 2024 at 10:15:13AM -0600, Mathieu Poirier wrote:
> Hi Jon,
> 
> On Thu, 7 Mar 2024 at 09:25, Jon Mason <jdmason@kudzu.us> wrote:
> >
> > On Mon, Mar 04, 2024 at 04:16:39PM -0700, Mathieu Poirier wrote:
> > > Initial checking providing support for RMM on QEMU's "virt" machine.
> > >
> > > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > ---
> > >  ...Add-repositories-for-system-includes.patch | 45 ++++++++++++++++
> > >  meta-arm/recipes-bsp/rmm/rmm.inc              | 54 +++++++++++++++++++
> > >  meta-arm/recipes-bsp/rmm/rmm_1.0.bb           |  5 ++
> > >  3 files changed, 104 insertions(+)
> > >  create mode 100644 meta-arm/recipes-bsp/rmm/files/0001-CMakeLists-Add-repositories-for-system-includes.patch
> > >  create mode 100644 meta-arm/recipes-bsp/rmm/rmm.inc
> > >  create mode 100644 meta-arm/recipes-bsp/rmm/rmm_1.0.bb
> > >
> > > diff --git a/meta-arm/recipes-bsp/rmm/files/0001-CMakeLists-Add-repositories-for-system-includes.patch b/meta-arm/recipes-bsp/rmm/files/0001-CMakeLists-Add-repositories-for-system-includes.patch
> > > new file mode 100644
> > > index 000000000000..a2f2137012d3
> > > --- /dev/null
> > > +++ b/meta-arm/recipes-bsp/rmm/files/0001-CMakeLists-Add-repositories-for-system-includes.patch
> > > @@ -0,0 +1,45 @@
> > > +From e9e6d5ded4c3e53254438a73a79f04209035603e Mon Sep 17 00:00:00 2001
> > > +From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > +Date: Mon, 4 Mar 2024 13:38:03 -0700
> > > +Subject: [PATCH] CMakeLists: Add repositories for system includes
> > > +
> > > +Yocto's default aarch64 toolchain, i.e aarch64-poky-linux-, doesn't
> > > +include assert.h and stderr.h by default, leading to a compilation error
> > > +for files that need them.  As such add the path of the base sysroot
> > > +directory to the list of directories to be included when compiling.
> > > +
> > > +Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >
> > This needs an upstream status.  See
> > https://docs.yoctoproject.org/current/contributor-guide/recipe-style-guide.html#patch-upstream-status
> >
> 
> I wrote another revision of this patch that was accepted upstream.
> Reading the documentation the next version should have a "Backport"
> tag.

Yes, and a link to the patch gets extra kudos.  As an example, see
meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0003-core-link-add-no-warn-rwx-segments.patch
or
meta-arm-bsp/recipes-security/optee/optee-os-3.20.0/0005-core-arm-S-EL1-SPMC-boot-ABI-update.patch

> 
> > > +---
> > > + lib/arch/CMakeLists.txt | 1 +
> > > + lib/libc/CMakeLists.txt | 3 ++-
> > > + 2 files changed, 3 insertions(+), 1 deletion(-)
> > > +
> > > +diff --git a/lib/arch/CMakeLists.txt b/lib/arch/CMakeLists.txt
> > > +index 93c0ae76bb65..628f4c981051 100644
> > > +--- a/lib/arch/CMakeLists.txt
> > > ++++ b/lib/arch/CMakeLists.txt
> > > +@@ -12,6 +12,7 @@ target_link_libraries(rmm-lib-arch
> > > + target_include_directories(rmm-lib-arch
> > > +     PUBLIC  "include"
> > > +             "include/${RMM_ARCH}"
> > > ++        "../../../recipe-sysroot/usr/include/"
> > > +     PRIVATE "src/${RMM_ARCH}"
> > > +             "src/include")
> > > +
> > > +diff --git a/lib/libc/CMakeLists.txt b/lib/libc/CMakeLists.txt
> > > +index 1631332dbc72..94d559b7aae0 100644
> > > +--- a/lib/libc/CMakeLists.txt
> > > ++++ b/lib/libc/CMakeLists.txt
> > > +@@ -12,7 +12,8 @@ if(NOT RMM_ARCH STREQUAL fake_host)
> > > +            rmm-lib-debug)
> > > +
> > > +     target_include_directories(rmm-lib-libc SYSTEM
> > > +-        PUBLIC "include")
> > > ++        PUBLIC "include"
> > > ++        "../../../recipe-sysroot/usr/include/")
> > > +
> > > +     target_sources(rmm-lib-libc
> > > +         PRIVATE "src/abort.c"
> > > +--
> > > +2.43.0
> > > +
> > > diff --git a/meta-arm/recipes-bsp/rmm/rmm.inc b/meta-arm/recipes-bsp/rmm/rmm.inc
> > > new file mode 100644
> > > index 000000000000..0cdf62b412d5
> > > --- /dev/null
> > > +++ b/meta-arm/recipes-bsp/rmm/rmm.inc
> > > @@ -0,0 +1,54 @@
> > > +SUMMARY = "RMM Firmware"
> > > +DESCRIPTION = "RMM Firmware for Arm reference platforms"
> > > +LICENSE = "BSD-3-Clause & MIT"
> > > +
> > > +SRC_URI = "${SRC_URI_RMM};name=rmm;branch=${SRCBRANCH_rmm} \
> > > +        file://0001-CMakeLists-Add-repositories-for-system-includes.patch \
> > > +     "
> > > +
> > > +LIC_FILES_CHKSUM += "file://${WORKDIR}/git/docs/about/license.rst;md5=1375c7c641558198ffe401c2a799d79b"
> >
> > This should probably be
> > LIC_FILES_CHKSUM = "file://docs/about/license.rst;md5=1375c7c641558198ffe401c2a799d79b"
> >
> > You are doing cmake wrong below.  Look at
> > https://docs.yoctoproject.org/current/ref-manual/classes.html?highlight=cmake#ref-classes-cmake
> >
> > There are lots of examples in meta-arm and poky of recipes using
> > cmake.  Please reference those and clean-up below.
> >
> 
> I used the "inherited cmake" statement and was able to get rid of
> do_configure() and do_compile().

Awesome.  The goal is to make these as simple as possible, because the
maintenance is cause of most of the problems.  The less these have in
there, the less exposure to potential problems (in theory).

> > > +
> > > +inherit deploy
> > > +
> > > +DEPENDS += "cmake-native"
> > > +
> > > +RMM_CONFIG ?= "qemu_virt_defcfg"
> > > +
> > > +PACKAGE_ARCH = "${MACHINE_ARCH}"
> > > +
> > > +S = "${WORKDIR}/git"
> > > +B = "${WORKDIR}/build"
> > > +
> > > +# Build for debug (set RMM_DEBUG to 1 to activate)
> > > +RMM_DEBUG ?= "0"
> > > +RMM_BUILD_MODE ?= "${@bb.utils.contains('RMM_DEBUG', '1', 'Debug', 'Release', d)}"
> > > +
> > > +# Handle RMM_DEBUG parameter
> > > +EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=${RMM_BUILD_MODE}"
> > > +EXTRA_OECMAKE += "-DRMM_CONFIG=${RMM_CONFIG}"
> > > +
> > > +export CROSS_COMPILE="${TARGET_PREFIX}"
> > > +export CMAKE_BUILD_PARALLEL_LEVEL = "${@oe.utils.parallel_make(d, False)}"
> > > +
> > > +do_configure[cleandirs] = "${B}"
> > > +do_configure() {
> > > +    cmake -S ${S} -B ${B} ${EXTRA_OECMAKE}
> > > +}
> > > +
> > > +do_compile() {
> > > +    cmake --build ${B}
> > > +}
> > > +
> > > +do_install() {
> > > +    install -d -m 755 ${D}/firmware
> > > +    install -m 0644 ${B}/${RMM_BUILD_MODE}/* ${D}/firmware/
> > > +}
> > > +
> > > +FILES:${PN} = "/firmware"
> > > +SYSROOT_DIRS += "/firmware"
> > > +
> > > +do_deploy() {
> > > +    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
> > > +}
> > > +
> > > +addtask deploy after do_install
> > > diff --git a/meta-arm/recipes-bsp/rmm/rmm_1.0.bb b/meta-arm/recipes-bsp/rmm/rmm_1.0.bb
> >
> > Looking at the git tree referenced below, this isn't version 1.0
> > It actually looks like you picked a SHA that was probably the HEAD a
> > month ago.  I would've thought you'd want to use tf-rmm-v0.4.0, which
> > would make the recipe name rmm_0.4.0
> >
> 
> You are correct.  I fixed that now.
> 
> > Also, I'm thinking that since it is from trusted-firmware-a, it would
> > live in that directory (but this is purely a guess).
> >
> 
> On trustedfirmware.org TF-RMM is on the same level as TF-A, TF-M and
> Hafnium.  As such I enacted the same structure under recipes-bsp.  How
> should I proceed for the next revision?

If this is the case, then you were correct originally.  Should this be
named tf-rmm/tf-rmm_0.4.bb (or should we spell out
trusted-firmware-rmm) then?  Asking if this should be name similar to
the others, or if this matters.  Might be a question of opinion/style.
I'll let Ross weigh in on it.

> 
> > > new file mode 100644
> > > index 000000000000..95a4f4a4667a
> > > --- /dev/null
> > > +++ b/meta-arm/recipes-bsp/rmm/rmm_1.0.bb
> > > @@ -0,0 +1,5 @@
> > > +SRC_URI_RMM       ?= "gitsm://git.trustedfirmware.org/TF-RMM/tf-rmm.git;protocol=https"
> > > +SRCREV_rmm        ?= "01a3cb75c6e6c50851d5d939d237966d110ed91d"
> > > +SRCBRANCH_rmm             ?= "main"
> > > +
> > > +require recipes-bsp/rmm/rmm.inc
> >
> > Unless there is going to be mulitple versions living in the same tree,
> > I don't see a need for an inc file, especially one so trivial.
> >
> 
> If I understand correctly, you are suggesting to rename rmm_0.4.0.bb
> to rmm.bb and get rid of the rmm.inc file.  Which means that rmm.bb
> would have a SRCREV_rmm variable that points to the latest stable tag.
> Please confirm that I got this right.

I'm suggesting that rmm.inc should be merged with rmm_1.0.bb and
renamed to rmm_0.4.bb (or trusted-firmware-rmm_0.4.bb, per the comment
above).  The only reason you would not want to do it this way would be
if you forsee multiple releases needing to coexist in the same
tree/build env.  In that case, you would want the .inc file and have a
.bb file that only contains the SHAs for each release.  See
meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.2.bb
meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
for what I mean by this, but I don't think you will actually need to
do this (and it can be done at some point in the future should it be
needed).

Thanks,
Jon

> 
> Thanks for the review,
> Mathieu
> 
> > Thanks,
> > Jon
> >
> > > --
> > > 2.43.0
> > >
> > >
> 

