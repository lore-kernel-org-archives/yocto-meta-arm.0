Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC811C4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 18:15:25 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.2403.1713896116632042788
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Apr 2024 11:15:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=FmJnaCMF;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.182, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-78edc0f9636so376763985a.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 23 Apr 2024 11:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1713896116; x=1714500916; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hV1uUNr5xxzjzUvAwkmRM2KZQaSI248RNLxt8g6clu4=;
        b=FmJnaCMFLqxeVvDZM5+QJvTVgUTDIIe50qoiRrZOdnjN6iGdrFClUA0wgQpc7qN7RX
         fzorgze1oRvFlgLbMmYqXlwPd/2H+IDcU/TSfrAlNZs52dVd/VoP042c3BwR18mpEz8a
         WOHyfXui56veTums9HhERhNTPN70oaNM0wtvQe0y5g5rHvu3QmjpNT+iF3kan3xtILhv
         zCeqqzRqpRjEJqWEIM6L8LFHQOiVkb5WuHMUWH6/OIdMPvE1Fbyp+Y9Q14L/igzplddt
         Ryw9yUOpSNbzhFBeCTNFpyzvAM48RoaphYpCmj0+mDchLdoaVtp14NZxnZegs8Kg0XGF
         pd+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713896116; x=1714500916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hV1uUNr5xxzjzUvAwkmRM2KZQaSI248RNLxt8g6clu4=;
        b=kMQMsFIDZVRAwtLYk4/oKXqj7X7WKiiNe36KnjkQi/6Tjs6EkZD48WwPDk/j3lJqtp
         IUpQRo5ldlmzIWz8X9/Ef2EeRpAL8jnge3Ef/ED+9WDiYTfEMrMxLTbUw+WhxyUhtRMi
         sAt5y35tDVaWZWY+8UuLEx4mwNDH0sT53BzuBtD2K3E6Rdovt+fgIigWt11H+RopgT5E
         STcjEoZzOyaDkhLp4z/nWtf5VQK4NrQLkRXkzntVg2HTd1bWTVvXple2jz4uopx94HXM
         w8V11ObeE8J2Jcp4K4mvZnOS/k6Ev/Dvor8ErnHkWkoqr9WVi+y/ZgjzY6HVRJhV3mRD
         tbmw==
X-Forwarded-Encrypted: i=1; AJvYcCWa4oy4CF2pb1zC0QvRkfDKAw6kxSZ1FNiqjM8mjEUo4doriBdzA6L6rxjzLtGhTHT1GedTytgM3BRtOrwHdwbQiEi+niTerfbgLjUZxzIO
X-Gm-Message-State: AOJu0YwWMsYflIgHy9OtQpJRO+G4BwLPjP59P/AkSRa+NLphWhNihtlN
	p2aPULWOBTWX+ur6wTMMqZwPuf4CAiUVpvDrj1U0B300G53yq0l4VPUdctPOLw==
X-Google-Smtp-Source: AGHT+IGDGmC+qubeh0Sa/Zt4i3DtJMahI3O2qJi9n6XOwzWbjcTLAWTBwHxhT3yqiaI/8KjBBVZ5Kg==
X-Received: by 2002:a05:620a:444c:b0:78e:ba60:89f4 with SMTP id w12-20020a05620a444c00b0078eba6089f4mr326738qkp.16.1713896115613;
        Tue, 23 Apr 2024 11:15:15 -0700 (PDT)
Received: from kudzu.us ([2605:a601:919e:c800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm5426212qkb.123.2024.04.23.11.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 11:15:15 -0700 (PDT)
Date: Tue, 23 Apr 2024 14:15:08 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: jon.mason@arm.com, ross.burton@arm.com, meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH v3] arm/trusted-firmware-rmm: Add bitbake, include and
 patch file for RMM
Message-ID: <Zif6rHi5B3lB4W53@kudzu.us>
References: <20240405154850.1678802-1-mathieu.poirier@linaro.org>
 <CANLsYky=iWo_zcx0A4=gcbwH+iCWN=d0Mgvsd12c-ON8WhLByQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYky=iWo_zcx0A4=gcbwH+iCWN=d0Mgvsd12c-ON8WhLByQ@mail.gmail.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 23 Apr 2024 18:15:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5595

On Tue, Apr 23, 2024 at 09:50:14AM -0600, Mathieu Poirier wrote:
> Hi Ross and Jon,
> 
> Is there anything else you'd like me to modify on this patch?

I'm still waiting on Ross to look at it...

I'm planning on pulling it in after the scarthgap release, which
should be in the next week.

Please do keep abreast of the upstream changes, as I'd like for there
to be a CI testcase once that part is sorted out (and I'm counting on
you to add the CI test).

Thanks,
Jon

> 
> Thanks,
> Mathieu
> 
> On Fri, 5 Apr 2024 at 09:48, Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
> >
> > Initial checking providing support for RMM on QEMU's "virt" machine.
> >
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> > Changes for V3:
> > 1) Setting RMM_CONFIG default to "" and restricting the compilation of
> > RMM to "qemuarm64" machines.
> > 2) Removed setting of variable "B"
> > 3) Setting CMAKE_INCLUDE_PATH to ${STAGING_INCDIR}
> > 4) Removed CMAKE_BUILD_PARALLEL_LEVEL
> > 5) Added comment to justify using CROSS_COMPILE
> > 6) Reworked the declaration of SRC_URI and SRCREV
> > ---
> >  ...tra-repositories-for-system-includes.patch | 56 +++++++++++++++++++
> >  .../trusted-firmware-rmm_0.4.bb               | 50 +++++++++++++++++
> >  2 files changed, 106 insertions(+)
> >  create mode 100644 meta-arm/recipes-bsp/trusted-firmware-rmm/files/0001-build-lib-Add-extra-repositories-for-system-includes.patch
> >  create mode 100644 meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.4.bb
> >
> > diff --git a/meta-arm/recipes-bsp/trusted-firmware-rmm/files/0001-build-lib-Add-extra-repositories-for-system-includes.patch b/meta-arm/recipes-bsp/trusted-firmware-rmm/files/0001-build-lib-Add-extra-repositories-for-system-includes.patch
> > new file mode 100644
> > index 000000000000..7c3e637f0d63
> > --- /dev/null
> > +++ b/meta-arm/recipes-bsp/trusted-firmware-rmm/files/0001-build-lib-Add-extra-repositories-for-system-includes.patch
> > @@ -0,0 +1,56 @@
> > +From bc7dbac20a6674eb2834bd6176665f1a2ae42edc Mon Sep 17 00:00:00 2001
> > +From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > +Date: Thu, 14 Mar 2024 14:59:30 -0600
> > +Subject: [PATCH] build(lib): Add extra repositories for system includes
> > +
> > +Toolchains such as aarch64-none-elf, aarch64-none-linux-gnu and
> > +aarch64-linux-gnu include assert.h and limits.h in a directory that is
> > +part of their search path.  This is not the case when compiling with
> > +Yocto where aarch64-poky-linux places those files in the sysroot
> > +directory of the component being compiled.
> > +
> > +Since the sysroot directory of the component is not part of the cmake
> > +search path, compiling the RMM in Yocto fails.  This patch fixes the
> > +problem by expanding the search path when needed, allowing the RMM to be
> > +compiled in Yocto.
> > +
> > +Upstream-Status: Backport [bc7dbac20a6674eb2834bd6176665f1a2ae42edc]
> > +Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > +---
> > + lib/arch/CMakeLists.txt | 3 +++
> > + lib/libc/CMakeLists.txt | 5 ++++-
> > + 2 files changed, 7 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/lib/arch/CMakeLists.txt b/lib/arch/CMakeLists.txt
> > +index d3afc5f2bfc8..a52185f02695 100644
> > +--- a/lib/arch/CMakeLists.txt
> > ++++ b/lib/arch/CMakeLists.txt
> > +@@ -12,6 +12,9 @@ target_link_libraries(rmm-lib-arch
> > + target_include_directories(rmm-lib-arch
> > +     PUBLIC  "include"
> > +             "include/${RMM_ARCH}"
> > ++            # The CMAKE_INCLUDE_PATH is included here for Yocto builds.  the
> > ++            # Yocto recipe will define this variable as part of the build.
> > ++            ${CMAKE_INCLUDE_PATH}
> > +     PRIVATE "src/${RMM_ARCH}"
> > +             "src/include")
> > +
> > +diff --git a/lib/libc/CMakeLists.txt b/lib/libc/CMakeLists.txt
> > +index 1631332dbc72..a2adf37f7cb8 100644
> > +--- a/lib/libc/CMakeLists.txt
> > ++++ b/lib/libc/CMakeLists.txt
> > +@@ -12,7 +12,10 @@ if(NOT RMM_ARCH STREQUAL fake_host)
> > +            rmm-lib-debug)
> > +
> > +     target_include_directories(rmm-lib-libc SYSTEM
> > +-        PUBLIC "include")
> > ++        PUBLIC "include"
> > ++        # The CMAKE_INCLUDE_PATH is included here for Yocto builds.  the
> > ++        # Yocto recipe will define this variable as part of the build.
> > ++        ${CMAKE_INCLUDE_PATH})
> > +
> > +     target_sources(rmm-lib-libc
> > +         PRIVATE "src/abort.c"
> > +--
> > +2.34.1
> > +
> > diff --git a/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.4.bb b/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.4.bb
> > new file mode 100644
> > index 000000000000..0726cd3d2497
> > --- /dev/null
> > +++ b/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.4.bb
> > @@ -0,0 +1,50 @@
> > +SUMMARY = "RMM Firmware"
> > +DESCRIPTION = "RMM Firmware for Arm reference platforms"
> > +LICENSE = "BSD-3-Clause & MIT"
> > +
> > +SRC_URI = "gitsm://git.trustedfirmware.org/TF-RMM/tf-rmm.git;protocol=https;branch=main \
> > +           file://0001-build-lib-Add-extra-repositories-for-system-includes.patch \
> > +          "
> > +
> > +SRCREV = "0a02656945d69757b0779192cebb9b41dd9037d1"
> > +
> > +LIC_FILES_CHKSUM += "file://docs/about/license.rst;md5=1375c7c641558198ffe401c2a799d79b"
> > +
> > +inherit deploy cmake
> > +
> > +RMM_CONFIG ?= ""
> > +RMM_CONFIG:qemuarm64 = "qemu_virt_defcfg"
> > +
> > +PACKAGE_ARCH = "${MACHINE_ARCH}"
> > +COMPATIBLE_MACHINE = "qemuarm64"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +# Build for debug (set RMM_DEBUG to 1 to activate)
> > +RMM_DEBUG ?= "0"
> > +RMM_BUILD_MODE ?= "${@bb.utils.contains('RMM_DEBUG', '1', 'Debug', 'Release', d)}"
> > +
> > +# Handle RMM_DEBUG parameter
> > +EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=${RMM_BUILD_MODE}"
> > +EXTRA_OECMAKE += "-DRMM_CONFIG=${RMM_CONFIG}"
> > +
> > +# Supplement include path
> > +EXTRA_OECMAKE += "-DCMAKE_INCLUDE_PATH=${STAGING_INCDIR}"
> > +
> > +# When compiling for Aarch64 on non-native hosts, the RMM code base gets its
> > +# toolchain from CROSS_COMPILE rather than CMAKE_TOOLCHAIN_FILE
> > +export CROSS_COMPILE="${TARGET_PREFIX}"
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
> > --
> > 2.34.1
> >
> 

