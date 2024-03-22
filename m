Return-Path: <mathieu.poirier@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C3FC54E71
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 16:15:28 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.246.1711124126483940988
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 22 Mar 2024 09:15:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=anFPE+3t;
 spf=pass (domain: linaro.org, ip: 209.85.208.42, mailfrom: mathieu.poirier@linaro.org)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-56899d9bf52so2729676a12.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 22 Mar 2024 09:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711124125; x=1711728925; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CNPGkwHmjbAuMSO+slYPLuj1NzeM2vjqJdOb3EAipe4=;
        b=anFPE+3tHK2/S2EuT0/63cICEdyYR+UJySH0fWIiH408NDt9L01Jn3tqwKPvn2Bzs0
         QqVejFcaJc+a3vJMH1VCmIxAjax3hbRKEaJdZLimZGbvh85GFMleu+iwJYEamFnmjUAm
         sEV9+zflWwoMpZmm95UuwyE5wDhbfGIqLHsAfGzqy0IEbGMkuFjmFxwC7+sHgn0iFE3P
         lQTBJgEWU4sDBxyYhX15KkXs55CGne7yBU3SznYXNsudoXkdhWO5sE42UeKIwv6dazgo
         UdZBU7bypta4ieMXsTiRI5dfCZop2dQbrxrnHsuKMjkZnOwCGY8zdh0l6x2ehbvtgT2f
         Jy/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711124125; x=1711728925;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CNPGkwHmjbAuMSO+slYPLuj1NzeM2vjqJdOb3EAipe4=;
        b=mngUZ9A5u+DGODN3Y8pZIPntJKma09FoEu5aBsCcV02juLUzzbrguVkfIl8zNbR/Eb
         Nja9KLL1GTEXzKwDYaDOpcM9/uDEo321phEPW55Laf8LQyVXndzRsr4RwiTuuu2Xaqrs
         XdzPEbSDWac27X0iYYaQqzTw+0dNfNLFzSj4iy54Fpha/dDA+XsqSx27ZfhYvC0vCHpw
         2S5VSAHRIHgC9BSekM/A9fDLUes5LeBzFVd85Q8KTZu3p3LE8ExYOopZEw2qrMinCw4d
         ae9GXWAYpOfsEamUoavxWBMPf5eRXLkh6t580bQD5v6Np/LUJd+3eudIcz4axhJDfr26
         rtSg==
X-Gm-Message-State: AOJu0Ywf7xhKt7U83Gm82uA0xQfO0UbWFcT7vGXzSOQpEzJpUMZ6CFyk
	MDcs1P/dduDHiDeO1q5WIRx9n6ITvV7iYSL6r9RiZqsvHiQqCNpPlGSMbqSLS7eplcYLyd7ozJJ
	hyJezUTrQiesFKgrQ9pkGfOPY4XaFLsvIW4IDIg==
X-Google-Smtp-Source: AGHT+IFaIrhxGP0mefudEsXrYT9YNLrWCOvFF27zrQcPRS/1qcDCiLOdxTQ+Vf7wxiD+TVxSVtWJRJwGUF8+W0sh0Vc=
X-Received: by 2002:a50:cd9b:0:b0:567:3c07:8bbc with SMTP id
 p27-20020a50cd9b000000b005673c078bbcmr2168169edi.21.1711124124725; Fri, 22
 Mar 2024 09:15:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240304231639.4187147-1-mathieu.poirier@linaro.org>
 <20240304231639.4187147-2-mathieu.poirier@linaro.org> <Zenqb53VZ2dOXkgc@kudzu.us>
In-Reply-To: <Zenqb53VZ2dOXkgc@kudzu.us>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 22 Mar 2024 10:15:13 -0600
Message-ID: <CANLsYky03gRORyOu=MorxugZfae2_6AjisHLbk=ho5Gxm9Qc0A@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm/rmm: Add bitbake, include and patch file for RMM firmware
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 22 Mar 2024 16:15:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5482

Hi Jon,

On Thu, 7 Mar 2024 at 09:25, Jon Mason <jdmason@kudzu.us> wrote:
>
> On Mon, Mar 04, 2024 at 04:16:39PM -0700, Mathieu Poirier wrote:
> > Initial checking providing support for RMM on QEMU's "virt" machine.
> >
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  ...Add-repositories-for-system-includes.patch | 45 ++++++++++++++++
> >  meta-arm/recipes-bsp/rmm/rmm.inc              | 54 +++++++++++++++++++
> >  meta-arm/recipes-bsp/rmm/rmm_1.0.bb           |  5 ++
> >  3 files changed, 104 insertions(+)
> >  create mode 100644 meta-arm/recipes-bsp/rmm/files/0001-CMakeLists-Add-repositories-for-system-includes.patch
> >  create mode 100644 meta-arm/recipes-bsp/rmm/rmm.inc
> >  create mode 100644 meta-arm/recipes-bsp/rmm/rmm_1.0.bb
> >
> > diff --git a/meta-arm/recipes-bsp/rmm/files/0001-CMakeLists-Add-repositories-for-system-includes.patch b/meta-arm/recipes-bsp/rmm/files/0001-CMakeLists-Add-repositories-for-system-includes.patch
> > new file mode 100644
> > index 000000000000..a2f2137012d3
> > --- /dev/null
> > +++ b/meta-arm/recipes-bsp/rmm/files/0001-CMakeLists-Add-repositories-for-system-includes.patch
> > @@ -0,0 +1,45 @@
> > +From e9e6d5ded4c3e53254438a73a79f04209035603e Mon Sep 17 00:00:00 2001
> > +From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > +Date: Mon, 4 Mar 2024 13:38:03 -0700
> > +Subject: [PATCH] CMakeLists: Add repositories for system includes
> > +
> > +Yocto's default aarch64 toolchain, i.e aarch64-poky-linux-, doesn't
> > +include assert.h and stderr.h by default, leading to a compilation error
> > +for files that need them.  As such add the path of the base sysroot
> > +directory to the list of directories to be included when compiling.
> > +
> > +Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>
> This needs an upstream status.  See
> https://docs.yoctoproject.org/current/contributor-guide/recipe-style-guide.html#patch-upstream-status
>

I wrote another revision of this patch that was accepted upstream.
Reading the documentation the next version should have a "Backport"
tag.

> > +---
> > + lib/arch/CMakeLists.txt | 1 +
> > + lib/libc/CMakeLists.txt | 3 ++-
> > + 2 files changed, 3 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/lib/arch/CMakeLists.txt b/lib/arch/CMakeLists.txt
> > +index 93c0ae76bb65..628f4c981051 100644
> > +--- a/lib/arch/CMakeLists.txt
> > ++++ b/lib/arch/CMakeLists.txt
> > +@@ -12,6 +12,7 @@ target_link_libraries(rmm-lib-arch
> > + target_include_directories(rmm-lib-arch
> > +     PUBLIC  "include"
> > +             "include/${RMM_ARCH}"
> > ++        "../../../recipe-sysroot/usr/include/"
> > +     PRIVATE "src/${RMM_ARCH}"
> > +             "src/include")
> > +
> > +diff --git a/lib/libc/CMakeLists.txt b/lib/libc/CMakeLists.txt
> > +index 1631332dbc72..94d559b7aae0 100644
> > +--- a/lib/libc/CMakeLists.txt
> > ++++ b/lib/libc/CMakeLists.txt
> > +@@ -12,7 +12,8 @@ if(NOT RMM_ARCH STREQUAL fake_host)
> > +            rmm-lib-debug)
> > +
> > +     target_include_directories(rmm-lib-libc SYSTEM
> > +-        PUBLIC "include")
> > ++        PUBLIC "include"
> > ++        "../../../recipe-sysroot/usr/include/")
> > +
> > +     target_sources(rmm-lib-libc
> > +         PRIVATE "src/abort.c"
> > +--
> > +2.43.0
> > +
> > diff --git a/meta-arm/recipes-bsp/rmm/rmm.inc b/meta-arm/recipes-bsp/rmm/rmm.inc
> > new file mode 100644
> > index 000000000000..0cdf62b412d5
> > --- /dev/null
> > +++ b/meta-arm/recipes-bsp/rmm/rmm.inc
> > @@ -0,0 +1,54 @@
> > +SUMMARY = "RMM Firmware"
> > +DESCRIPTION = "RMM Firmware for Arm reference platforms"
> > +LICENSE = "BSD-3-Clause & MIT"
> > +
> > +SRC_URI = "${SRC_URI_RMM};name=rmm;branch=${SRCBRANCH_rmm} \
> > +        file://0001-CMakeLists-Add-repositories-for-system-includes.patch \
> > +     "
> > +
> > +LIC_FILES_CHKSUM += "file://${WORKDIR}/git/docs/about/license.rst;md5=1375c7c641558198ffe401c2a799d79b"
>
> This should probably be
> LIC_FILES_CHKSUM = "file://docs/about/license.rst;md5=1375c7c641558198ffe401c2a799d79b"
>
> You are doing cmake wrong below.  Look at
> https://docs.yoctoproject.org/current/ref-manual/classes.html?highlight=cmake#ref-classes-cmake
>
> There are lots of examples in meta-arm and poky of recipes using
> cmake.  Please reference those and clean-up below.
>

I used the "inherited cmake" statement and was able to get rid of
do_configure() and do_compile().

> > +
> > +inherit deploy
> > +
> > +DEPENDS += "cmake-native"
> > +
> > +RMM_CONFIG ?= "qemu_virt_defcfg"
> > +
> > +PACKAGE_ARCH = "${MACHINE_ARCH}"
> > +
> > +S = "${WORKDIR}/git"
> > +B = "${WORKDIR}/build"
> > +
> > +# Build for debug (set RMM_DEBUG to 1 to activate)
> > +RMM_DEBUG ?= "0"
> > +RMM_BUILD_MODE ?= "${@bb.utils.contains('RMM_DEBUG', '1', 'Debug', 'Release', d)}"
> > +
> > +# Handle RMM_DEBUG parameter
> > +EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=${RMM_BUILD_MODE}"
> > +EXTRA_OECMAKE += "-DRMM_CONFIG=${RMM_CONFIG}"
> > +
> > +export CROSS_COMPILE="${TARGET_PREFIX}"
> > +export CMAKE_BUILD_PARALLEL_LEVEL = "${@oe.utils.parallel_make(d, False)}"
> > +
> > +do_configure[cleandirs] = "${B}"
> > +do_configure() {
> > +    cmake -S ${S} -B ${B} ${EXTRA_OECMAKE}
> > +}
> > +
> > +do_compile() {
> > +    cmake --build ${B}
> > +}
> > +
> > +do_install() {
> > +    install -d -m 755 ${D}/firmware
> > +    install -m 0644 ${B}/${RMM_BUILD_MODE}/* ${D}/firmware/
> > +}
> > +
> > +FILES:${PN} = "/firmware"
> > +SYSROOT_DIRS += "/firmware"
> > +
> > +do_deploy() {
> > +    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
> > +}
> > +
> > +addtask deploy after do_install
> > diff --git a/meta-arm/recipes-bsp/rmm/rmm_1.0.bb b/meta-arm/recipes-bsp/rmm/rmm_1.0.bb
>
> Looking at the git tree referenced below, this isn't version 1.0
> It actually looks like you picked a SHA that was probably the HEAD a
> month ago.  I would've thought you'd want to use tf-rmm-v0.4.0, which
> would make the recipe name rmm_0.4.0
>

You are correct.  I fixed that now.

> Also, I'm thinking that since it is from trusted-firmware-a, it would
> live in that directory (but this is purely a guess).
>

On trustedfirmware.org TF-RMM is on the same level as TF-A, TF-M and
Hafnium.  As such I enacted the same structure under recipes-bsp.  How
should I proceed for the next revision?

> > new file mode 100644
> > index 000000000000..95a4f4a4667a
> > --- /dev/null
> > +++ b/meta-arm/recipes-bsp/rmm/rmm_1.0.bb
> > @@ -0,0 +1,5 @@
> > +SRC_URI_RMM       ?= "gitsm://git.trustedfirmware.org/TF-RMM/tf-rmm.git;protocol=https"
> > +SRCREV_rmm        ?= "01a3cb75c6e6c50851d5d939d237966d110ed91d"
> > +SRCBRANCH_rmm             ?= "main"
> > +
> > +require recipes-bsp/rmm/rmm.inc
>
> Unless there is going to be mulitple versions living in the same tree,
> I don't see a need for an inc file, especially one so trivial.
>

If I understand correctly, you are suggesting to rename rmm_0.4.0.bb
to rmm.bb and get rid of the rmm.inc file.  Which means that rmm.bb
would have a SRCREV_rmm variable that points to the latest stable tag.
Please confirm that I got this right.

Thanks for the review,
Mathieu

> Thanks,
> Jon
>
> > --
> > 2.43.0
> >
> >

