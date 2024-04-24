Return-Path: <mathieu.poirier@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED5DC07E8E
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 16:18:53 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.911.1713975531078005826
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 24 Apr 2024 09:18:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=tufGvYGi;
 spf=pass (domain: linaro.org, ip: 209.85.208.50, mailfrom: mathieu.poirier@linaro.org)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-565c6cf4819so2075111a12.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 24 Apr 2024 09:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713975529; x=1714580329; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w4PxnMiVGSYN50KynrmAqL7++hTTaqbH7BWfcOvZ1eI=;
        b=tufGvYGiiABDfRvkZDFHEHuImRLePkHKTJPFVw2Q20dUjAapeRgfh4vLJK19x5R+Ql
         L0FHbVLkPdJs2j746/gS7npP6N3hjTScgPqk/DnjhrJzsK7PiJNV2E0LCzy/3mOL4r8h
         98WJtcHuPQWoHO8cBOwhE5mVd1EsXaugxdd8/wYT5jmT9Wzjq3zDxazLraGO+a+xPfWw
         kNUKCOuc3d4y+o0ztMW1srJdLt7k82vNtqZ6W+LRbw2l1mgndEWkXMeohGv7qt7GUbot
         Ncl3l6oo4NO1gRCm5OHiZ8FqP1DW3lsGeqAdtp3ArRpxKHcacnxXftT9glPS5Psb9m9w
         dEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713975529; x=1714580329;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w4PxnMiVGSYN50KynrmAqL7++hTTaqbH7BWfcOvZ1eI=;
        b=NnbmDib8DjA0Lc4dmsmIVe+bzXl2B/3cUmaq9DtNfPAdB2tNReeR0ElKjo52pVHFkr
         EI26d3GHYlc3GKWiRud+4lhKH5JSXU3MsmbnHn2dcmhKKvD9TiaQWIl2b5NanXlz8Ku5
         yZpwnW0eowkrixIcQH+m8W4IBSYM6/g6cTyogu+g6aagVzTSFGwAmiDwxA/2L2EGcPWG
         I03MR8fPuo7wrnFYU74UH0NuqrEkBsYHLQD1z11Aasx11p3Q77UA7/PbgRUtBSGRbyXa
         VlCQ/3K18lVDa4/feSmQEwAwkoNJQyDKdCWp0Z0H1bXh7UjJOENoW9qr5reqZ+wNakbq
         elSw==
X-Forwarded-Encrypted: i=1; AJvYcCUQCA2porRE1lz3dJkvDHqaUWeAYbK2YtfqqwcuRdAFcJtvLsRL/h7ZjSXUYrxRFfKnL420Do2K5xcKX5YI/94zFPNG9Sk4kdJCT1FFu5RH
X-Gm-Message-State: AOJu0Ywd0nhwsVpnIUdN4XeFtvk7INLspRPW+FuwNsRmCk0V47tPkwqN
	oPbnRmcbmgNsq9/67S877XBEFKCXTzbsCDFyRkgxe0KrwEjHiAYYx3TmGNlSljB3avOycL/11Ht
	QEQ1ofNzumrxPsFpk3dcpQuSZMS5k+jV7o4XZWS2Ebd8MIeOL
X-Google-Smtp-Source: AGHT+IHXSxVIf7d6YWPAcf04PFGbSldjJJOpgUm35CTu+BS8p3Keb9wh/DQjwyuMOi803OeDhBakZn+F5myifXVKDTs=
X-Received: by 2002:a05:6402:c0e:b0:570:22d5:43d0 with SMTP id
 co14-20020a0564020c0e00b0057022d543d0mr166808edb.3.1713975529316; Wed, 24 Apr
 2024 09:18:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240405154850.1678802-1-mathieu.poirier@linaro.org>
 <CANLsYky=iWo_zcx0A4=gcbwH+iCWN=d0Mgvsd12c-ON8WhLByQ@mail.gmail.com> <Zif6rHi5B3lB4W53@kudzu.us>
In-Reply-To: <Zif6rHi5B3lB4W53@kudzu.us>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 24 Apr 2024 10:18:37 -0600
Message-ID: <CANLsYkwzNp7QW_cAn-0Mt=r0rFJyFt0NAxc8S8f2uYCibrngzA@mail.gmail.com>
Subject: Re: [PATCH v3] arm/trusted-firmware-rmm: Add bitbake, include and
 patch file for RMM
To: Jon Mason <jdmason@kudzu.us>
Cc: jon.mason@arm.com, ross.burton@arm.com, meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 24 Apr 2024 16:18:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5607

On Tue, 23 Apr 2024 at 12:15, Jon Mason <jdmason@kudzu.us> wrote:
>
> On Tue, Apr 23, 2024 at 09:50:14AM -0600, Mathieu Poirier wrote:
> > Hi Ross and Jon,
> >
> > Is there anything else you'd like me to modify on this patch?
>
> I'm still waiting on Ross to look at it...
>

Ok

> I'm planning on pulling it in after the scarthgap release, which
> should be in the next week.
>

Ok

> Please do keep abreast of the upstream changes, as I'd like for there
> to be a CI testcase once that part is sorted out (and I'm counting on
> you to add the CI test).
>

Is there a documented process for CI?  I looked in the README.md, the
documentation and CI folders but found nothing of that sort.  Due to
their similarities, I'll start looking into what is done for Hafnium.

> Thanks,
> Jon
>
> >
> > Thanks,
> > Mathieu
> >
> > On Fri, 5 Apr 2024 at 09:48, Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
> > >
> > > Initial checking providing support for RMM on QEMU's "virt" machine.
> > >
> > > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > ---
> > > Changes for V3:
> > > 1) Setting RMM_CONFIG default to "" and restricting the compilation of
> > > RMM to "qemuarm64" machines.
> > > 2) Removed setting of variable "B"
> > > 3) Setting CMAKE_INCLUDE_PATH to ${STAGING_INCDIR}
> > > 4) Removed CMAKE_BUILD_PARALLEL_LEVEL
> > > 5) Added comment to justify using CROSS_COMPILE
> > > 6) Reworked the declaration of SRC_URI and SRCREV
> > > ---
> > >  ...tra-repositories-for-system-includes.patch | 56 +++++++++++++++++++
> > >  .../trusted-firmware-rmm_0.4.bb               | 50 +++++++++++++++++
> > >  2 files changed, 106 insertions(+)
> > >  create mode 100644 meta-arm/recipes-bsp/trusted-firmware-rmm/files/0001-build-lib-Add-extra-repositories-for-system-includes.patch
> > >  create mode 100644 meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.4.bb
> > >
> > > diff --git a/meta-arm/recipes-bsp/trusted-firmware-rmm/files/0001-build-lib-Add-extra-repositories-for-system-includes.patch b/meta-arm/recipes-bsp/trusted-firmware-rmm/files/0001-build-lib-Add-extra-repositories-for-system-includes.patch
> > > new file mode 100644
> > > index 000000000000..7c3e637f0d63
> > > --- /dev/null
> > > +++ b/meta-arm/recipes-bsp/trusted-firmware-rmm/files/0001-build-lib-Add-extra-repositories-for-system-includes.patch
> > > @@ -0,0 +1,56 @@
> > > +From bc7dbac20a6674eb2834bd6176665f1a2ae42edc Mon Sep 17 00:00:00 2001
> > > +From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > +Date: Thu, 14 Mar 2024 14:59:30 -0600
> > > +Subject: [PATCH] build(lib): Add extra repositories for system includes
> > > +
> > > +Toolchains such as aarch64-none-elf, aarch64-none-linux-gnu and
> > > +aarch64-linux-gnu include assert.h and limits.h in a directory that is
> > > +part of their search path.  This is not the case when compiling with
> > > +Yocto where aarch64-poky-linux places those files in the sysroot
> > > +directory of the component being compiled.
> > > +
> > > +Since the sysroot directory of the component is not part of the cmake
> > > +search path, compiling the RMM in Yocto fails.  This patch fixes the
> > > +problem by expanding the search path when needed, allowing the RMM to be
> > > +compiled in Yocto.
> > > +
> > > +Upstream-Status: Backport [bc7dbac20a6674eb2834bd6176665f1a2ae42edc]
> > > +Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > +---
> > > + lib/arch/CMakeLists.txt | 3 +++
> > > + lib/libc/CMakeLists.txt | 5 ++++-
> > > + 2 files changed, 7 insertions(+), 1 deletion(-)
> > > +
> > > +diff --git a/lib/arch/CMakeLists.txt b/lib/arch/CMakeLists.txt
> > > +index d3afc5f2bfc8..a52185f02695 100644
> > > +--- a/lib/arch/CMakeLists.txt
> > > ++++ b/lib/arch/CMakeLists.txt
> > > +@@ -12,6 +12,9 @@ target_link_libraries(rmm-lib-arch
> > > + target_include_directories(rmm-lib-arch
> > > +     PUBLIC  "include"
> > > +             "include/${RMM_ARCH}"
> > > ++            # The CMAKE_INCLUDE_PATH is included here for Yocto builds.  the
> > > ++            # Yocto recipe will define this variable as part of the build.
> > > ++            ${CMAKE_INCLUDE_PATH}
> > > +     PRIVATE "src/${RMM_ARCH}"
> > > +             "src/include")
> > > +
> > > +diff --git a/lib/libc/CMakeLists.txt b/lib/libc/CMakeLists.txt
> > > +index 1631332dbc72..a2adf37f7cb8 100644
> > > +--- a/lib/libc/CMakeLists.txt
> > > ++++ b/lib/libc/CMakeLists.txt
> > > +@@ -12,7 +12,10 @@ if(NOT RMM_ARCH STREQUAL fake_host)
> > > +            rmm-lib-debug)
> > > +
> > > +     target_include_directories(rmm-lib-libc SYSTEM
> > > +-        PUBLIC "include")
> > > ++        PUBLIC "include"
> > > ++        # The CMAKE_INCLUDE_PATH is included here for Yocto builds.  the
> > > ++        # Yocto recipe will define this variable as part of the build.
> > > ++        ${CMAKE_INCLUDE_PATH})
> > > +
> > > +     target_sources(rmm-lib-libc
> > > +         PRIVATE "src/abort.c"
> > > +--
> > > +2.34.1
> > > +
> > > diff --git a/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.4.bb b/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.4.bb
> > > new file mode 100644
> > > index 000000000000..0726cd3d2497
> > > --- /dev/null
> > > +++ b/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.4.bb
> > > @@ -0,0 +1,50 @@
> > > +SUMMARY = "RMM Firmware"
> > > +DESCRIPTION = "RMM Firmware for Arm reference platforms"
> > > +LICENSE = "BSD-3-Clause & MIT"
> > > +
> > > +SRC_URI = "gitsm://git.trustedfirmware.org/TF-RMM/tf-rmm.git;protocol=https;branch=main \
> > > +           file://0001-build-lib-Add-extra-repositories-for-system-includes.patch \
> > > +          "
> > > +
> > > +SRCREV = "0a02656945d69757b0779192cebb9b41dd9037d1"
> > > +
> > > +LIC_FILES_CHKSUM += "file://docs/about/license.rst;md5=1375c7c641558198ffe401c2a799d79b"
> > > +
> > > +inherit deploy cmake
> > > +
> > > +RMM_CONFIG ?= ""
> > > +RMM_CONFIG:qemuarm64 = "qemu_virt_defcfg"
> > > +
> > > +PACKAGE_ARCH = "${MACHINE_ARCH}"
> > > +COMPATIBLE_MACHINE = "qemuarm64"
> > > +
> > > +S = "${WORKDIR}/git"
> > > +
> > > +# Build for debug (set RMM_DEBUG to 1 to activate)
> > > +RMM_DEBUG ?= "0"
> > > +RMM_BUILD_MODE ?= "${@bb.utils.contains('RMM_DEBUG', '1', 'Debug', 'Release', d)}"
> > > +
> > > +# Handle RMM_DEBUG parameter
> > > +EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=${RMM_BUILD_MODE}"
> > > +EXTRA_OECMAKE += "-DRMM_CONFIG=${RMM_CONFIG}"
> > > +
> > > +# Supplement include path
> > > +EXTRA_OECMAKE += "-DCMAKE_INCLUDE_PATH=${STAGING_INCDIR}"
> > > +
> > > +# When compiling for Aarch64 on non-native hosts, the RMM code base gets its
> > > +# toolchain from CROSS_COMPILE rather than CMAKE_TOOLCHAIN_FILE
> > > +export CROSS_COMPILE="${TARGET_PREFIX}"
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
> > > --
> > > 2.34.1
> > >
> >

