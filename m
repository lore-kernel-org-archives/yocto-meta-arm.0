Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65996C4345F
	for <webhook@archiver.kernel.org>; Thu, 25 Apr 2024 14:34:51 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.18659.1714055683069101801
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 25 Apr 2024 07:34:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=psx93nsi;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4376e3fd7e4so5624521cf.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 25 Apr 2024 07:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1714055682; x=1714660482; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j+QmwiQbXYThzaLJRLly5SS36orI3O2x0hvWpfS4iYo=;
        b=psx93nsin7h31+4lehxZ7RA9eyUZWy+vdSCccLjcijhvMIj0YUXg7cvqJ8zs3frEgJ
         gtWQPxC4IctoBelDfIzLcimpvKIRXEw7dqJGd8dulFqxd3crr5FNQ8F17II9OfaT0a/n
         IKf9eXjjS91+v+xv0298yOKcm1vmUfpIa1JSnDpz1IcfEDO1FcnoDRLwMTH5apOkyRDw
         E+/3t9tKf6t4l+0X8tR6s6voLNmOcrn58fmnALAvBQcCNYwmeGskpJ8dGzpEPV0jGGVe
         4XTJfuVhF35Yg0PiC1NLsGNTWDRpaH5KtqM52kBTsqi68yrtgESBSWmruyqSBycsCWri
         f4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714055682; x=1714660482;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j+QmwiQbXYThzaLJRLly5SS36orI3O2x0hvWpfS4iYo=;
        b=c1CNa5n7DHayo6d5L2yXJ/TEyZAuKWasFtcrbJyII9ZWfcKL8b5yUtc521rmzSols9
         8X0X529qYnVaSguGdC/WSLEKCpcql5ZM2A0hSogTCLS86n8KJzENVnCfA4tiVxyduj0Q
         7j4DLd/AKFT3LarM1mgV8SB/eK4by+YD/z78CIJUUMF9XFKZU0JAKm7n/iAHiQjugAH4
         W2RNnCAO9j+gzPyt6XqA7EfKQXipOwoiLftHc4iBAcj7viYT6Q9mY1GjrG3x72JeiEa1
         4A0Z7YsfeAlyzALHmD29lEY/Cm3z1m4PyFz58bCU0TYSf0NQyiXz+er9jxwPbHJwLS01
         gsaA==
X-Forwarded-Encrypted: i=1; AJvYcCUum7t5UggRVPCLaNs9iGSnkeenrjrOW/ISnSGmLIJCCUFk9C6glLDkxyb98LWc8ql592mSIeH/IGgdBC/4Fqg0uaefjUNUguaiy0Bi3bzn
X-Gm-Message-State: AOJu0YwCP3ZW7YG0GMJYZ9fNoivFW65qSjHXzOmz7J4yLgVtcbSfLqP7
	MJl0tnbaaD7HxYyYL9u+Qoo54cNoTdKeVEfXOC+uQhOHcr84yS/p/sDyUh9Zow==
X-Google-Smtp-Source: AGHT+IG7trXadfEts6NzdWedhxlWOUsHk4hZyrJbcIzAuz0K99fq/8bI0nX5H7JNzTnrizWR5Ueh0g==
X-Received: by 2002:a05:622a:144a:b0:43a:4800:830f with SMTP id v10-20020a05622a144a00b0043a4800830fmr2482072qtx.37.1714055681994;
        Thu, 25 Apr 2024 07:34:41 -0700 (PDT)
Received: from kudzu.us ([2605:a601:919e:c800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id d12-20020ac851cc000000b00438527a4eb5sm5762925qtn.10.2024.04.25.07.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 07:34:41 -0700 (PDT)
Date: Thu, 25 Apr 2024 10:34:35 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: jon.mason@arm.com, ross.burton@arm.com, meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH v3] arm/trusted-firmware-rmm: Add bitbake, include and
 patch file for RMM
Message-ID: <Zipp+zYL4CVopxMZ@kudzu.us>
References: <20240405154850.1678802-1-mathieu.poirier@linaro.org>
 <CANLsYky=iWo_zcx0A4=gcbwH+iCWN=d0Mgvsd12c-ON8WhLByQ@mail.gmail.com>
 <Zif6rHi5B3lB4W53@kudzu.us>
 <CANLsYkwzNp7QW_cAn-0Mt=r0rFJyFt0NAxc8S8f2uYCibrngzA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkwzNp7QW_cAn-0Mt=r0rFJyFt0NAxc8S8f2uYCibrngzA@mail.gmail.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 25 Apr 2024 14:34:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5609

On Wed, Apr 24, 2024 at 10:18:37AM -0600, Mathieu Poirier wrote:
> On Tue, 23 Apr 2024 at 12:15, Jon Mason <jdmason@kudzu.us> wrote:
> >
> > On Tue, Apr 23, 2024 at 09:50:14AM -0600, Mathieu Poirier wrote:
> > > Hi Ross and Jon,
> > >
> > > Is there anything else you'd like me to modify on this patch?
> >
> > I'm still waiting on Ross to look at it...
> >
> 
> Ok
> 
> > I'm planning on pulling it in after the scarthgap release, which
> > should be in the next week.
> >
> 
> Ok
> 
> > Please do keep abreast of the upstream changes, as I'd like for there
> > to be a CI testcase once that part is sorted out (and I'm counting on
> > you to add the CI test).
> >
> 
> Is there a documented process for CI?  I looked in the README.md, the
> documentation and CI folders but found nothing of that sort.  Due to
> their similarities, I'll start looking into what is done for Hafnium.

Assuming it can be tested from userspace, standard Yocto test setup
and running can be done.  See:
https://docs.yoctoproject.org/dev/dev-manual/runtime-testing.html

In meta-arm, meta-arm/lib/oeqa/runtime/cases/trusted_services.py
might be an interesting thing to look at.  You can see it running as
part of the qemuarm64-secureboot testing.  For example, 
https://gitlab.com/jonmason00/meta-arm/-/jobs/6708705401

Hopefully this was helpful :)

Thanks,
Jon

> 
> > Thanks,
> > Jon
> >
> > >
> > > Thanks,
> > > Mathieu
> > >
> > > On Fri, 5 Apr 2024 at 09:48, Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
> > > >
> > > > Initial checking providing support for RMM on QEMU's "virt" machine.
> > > >
> > > > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > > ---
> > > > Changes for V3:
> > > > 1) Setting RMM_CONFIG default to "" and restricting the compilation of
> > > > RMM to "qemuarm64" machines.
> > > > 2) Removed setting of variable "B"
> > > > 3) Setting CMAKE_INCLUDE_PATH to ${STAGING_INCDIR}
> > > > 4) Removed CMAKE_BUILD_PARALLEL_LEVEL
> > > > 5) Added comment to justify using CROSS_COMPILE
> > > > 6) Reworked the declaration of SRC_URI and SRCREV
> > > > ---
> > > >  ...tra-repositories-for-system-includes.patch | 56 +++++++++++++++++++
> > > >  .../trusted-firmware-rmm_0.4.bb               | 50 +++++++++++++++++
> > > >  2 files changed, 106 insertions(+)
> > > >  create mode 100644 meta-arm/recipes-bsp/trusted-firmware-rmm/files/0001-build-lib-Add-extra-repositories-for-system-includes.patch
> > > >  create mode 100644 meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.4.bb
> > > >
> > > > diff --git a/meta-arm/recipes-bsp/trusted-firmware-rmm/files/0001-build-lib-Add-extra-repositories-for-system-includes.patch b/meta-arm/recipes-bsp/trusted-firmware-rmm/files/0001-build-lib-Add-extra-repositories-for-system-includes.patch
> > > > new file mode 100644
> > > > index 000000000000..7c3e637f0d63
> > > > --- /dev/null
> > > > +++ b/meta-arm/recipes-bsp/trusted-firmware-rmm/files/0001-build-lib-Add-extra-repositories-for-system-includes.patch
> > > > @@ -0,0 +1,56 @@
> > > > +From bc7dbac20a6674eb2834bd6176665f1a2ae42edc Mon Sep 17 00:00:00 2001
> > > > +From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > > +Date: Thu, 14 Mar 2024 14:59:30 -0600
> > > > +Subject: [PATCH] build(lib): Add extra repositories for system includes
> > > > +
> > > > +Toolchains such as aarch64-none-elf, aarch64-none-linux-gnu and
> > > > +aarch64-linux-gnu include assert.h and limits.h in a directory that is
> > > > +part of their search path.  This is not the case when compiling with
> > > > +Yocto where aarch64-poky-linux places those files in the sysroot
> > > > +directory of the component being compiled.
> > > > +
> > > > +Since the sysroot directory of the component is not part of the cmake
> > > > +search path, compiling the RMM in Yocto fails.  This patch fixes the
> > > > +problem by expanding the search path when needed, allowing the RMM to be
> > > > +compiled in Yocto.
> > > > +
> > > > +Upstream-Status: Backport [bc7dbac20a6674eb2834bd6176665f1a2ae42edc]
> > > > +Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > > +---
> > > > + lib/arch/CMakeLists.txt | 3 +++
> > > > + lib/libc/CMakeLists.txt | 5 ++++-
> > > > + 2 files changed, 7 insertions(+), 1 deletion(-)
> > > > +
> > > > +diff --git a/lib/arch/CMakeLists.txt b/lib/arch/CMakeLists.txt
> > > > +index d3afc5f2bfc8..a52185f02695 100644
> > > > +--- a/lib/arch/CMakeLists.txt
> > > > ++++ b/lib/arch/CMakeLists.txt
> > > > +@@ -12,6 +12,9 @@ target_link_libraries(rmm-lib-arch
> > > > + target_include_directories(rmm-lib-arch
> > > > +     PUBLIC  "include"
> > > > +             "include/${RMM_ARCH}"
> > > > ++            # The CMAKE_INCLUDE_PATH is included here for Yocto builds.  the
> > > > ++            # Yocto recipe will define this variable as part of the build.
> > > > ++            ${CMAKE_INCLUDE_PATH}
> > > > +     PRIVATE "src/${RMM_ARCH}"
> > > > +             "src/include")
> > > > +
> > > > +diff --git a/lib/libc/CMakeLists.txt b/lib/libc/CMakeLists.txt
> > > > +index 1631332dbc72..a2adf37f7cb8 100644
> > > > +--- a/lib/libc/CMakeLists.txt
> > > > ++++ b/lib/libc/CMakeLists.txt
> > > > +@@ -12,7 +12,10 @@ if(NOT RMM_ARCH STREQUAL fake_host)
> > > > +            rmm-lib-debug)
> > > > +
> > > > +     target_include_directories(rmm-lib-libc SYSTEM
> > > > +-        PUBLIC "include")
> > > > ++        PUBLIC "include"
> > > > ++        # The CMAKE_INCLUDE_PATH is included here for Yocto builds.  the
> > > > ++        # Yocto recipe will define this variable as part of the build.
> > > > ++        ${CMAKE_INCLUDE_PATH})
> > > > +
> > > > +     target_sources(rmm-lib-libc
> > > > +         PRIVATE "src/abort.c"
> > > > +--
> > > > +2.34.1
> > > > +
> > > > diff --git a/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.4.bb b/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.4.bb
> > > > new file mode 100644
> > > > index 000000000000..0726cd3d2497
> > > > --- /dev/null
> > > > +++ b/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.4.bb
> > > > @@ -0,0 +1,50 @@
> > > > +SUMMARY = "RMM Firmware"
> > > > +DESCRIPTION = "RMM Firmware for Arm reference platforms"
> > > > +LICENSE = "BSD-3-Clause & MIT"
> > > > +
> > > > +SRC_URI = "gitsm://git.trustedfirmware.org/TF-RMM/tf-rmm.git;protocol=https;branch=main \
> > > > +           file://0001-build-lib-Add-extra-repositories-for-system-includes.patch \
> > > > +          "
> > > > +
> > > > +SRCREV = "0a02656945d69757b0779192cebb9b41dd9037d1"
> > > > +
> > > > +LIC_FILES_CHKSUM += "file://docs/about/license.rst;md5=1375c7c641558198ffe401c2a799d79b"
> > > > +
> > > > +inherit deploy cmake
> > > > +
> > > > +RMM_CONFIG ?= ""
> > > > +RMM_CONFIG:qemuarm64 = "qemu_virt_defcfg"
> > > > +
> > > > +PACKAGE_ARCH = "${MACHINE_ARCH}"
> > > > +COMPATIBLE_MACHINE = "qemuarm64"
> > > > +
> > > > +S = "${WORKDIR}/git"
> > > > +
> > > > +# Build for debug (set RMM_DEBUG to 1 to activate)
> > > > +RMM_DEBUG ?= "0"
> > > > +RMM_BUILD_MODE ?= "${@bb.utils.contains('RMM_DEBUG', '1', 'Debug', 'Release', d)}"
> > > > +
> > > > +# Handle RMM_DEBUG parameter
> > > > +EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=${RMM_BUILD_MODE}"
> > > > +EXTRA_OECMAKE += "-DRMM_CONFIG=${RMM_CONFIG}"
> > > > +
> > > > +# Supplement include path
> > > > +EXTRA_OECMAKE += "-DCMAKE_INCLUDE_PATH=${STAGING_INCDIR}"
> > > > +
> > > > +# When compiling for Aarch64 on non-native hosts, the RMM code base gets its
> > > > +# toolchain from CROSS_COMPILE rather than CMAKE_TOOLCHAIN_FILE
> > > > +export CROSS_COMPILE="${TARGET_PREFIX}"
> > > > +
> > > > +do_install() {
> > > > +    install -d -m 755 ${D}/firmware
> > > > +    install -m 0644 ${B}/${RMM_BUILD_MODE}/* ${D}/firmware/
> > > > +}
> > > > +
> > > > +FILES:${PN} = "/firmware"
> > > > +SYSROOT_DIRS += "/firmware"
> > > > +
> > > > +do_deploy() {
> > > > +    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
> > > > +}
> > > > +
> > > > +addtask deploy after do_install
> > > > --
> > > > 2.34.1
> > > >
> > >
> 

