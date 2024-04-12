Return-Path: <mathieu.poirier@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C149C4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 16:20:35 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.51468.1712938827661220425
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Apr 2024 09:20:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=sLEqUqw8;
 spf=pass (domain: linaro.org, ip: 209.85.208.46, mailfrom: mathieu.poirier@linaro.org)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-56fd7df9ea9so1278933a12.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 12 Apr 2024 09:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712938826; x=1713543626; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f4mhCNV8W/5TjNI/o0+I+7IlgfRbVfVTTSOY/y+0AA8=;
        b=sLEqUqw8s/sbM6R24fK3J03JQ0jg5uyXdrsqhWe6+Xs615lSJstIXuguD/gp0ypd9c
         G1GeAzsd/ZhiuSLQmTvPPlPrUexR9MC+ESyLo2+WRujRqMQxh2vj6cEz0uopeazNdlwq
         MkWOAEMEOerpjYw2JNjuqewsI/EVeUxafvFghS76P0kzHhYARQuPtJ74C0ooHBWTp4eZ
         V03Lb4kHoUpaq0vu3TK8zqWNjuNt8VRW39cvGf6JBZmtOieaX9oX7uSNtijCB1Mr4Q1I
         hzP/dsfbvQ6K/CihDC7RzrxKmF3YXh0/hs9vX4xcFfHWWqZa9p8CqiGT5egpJSq5Hipq
         Fk0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712938826; x=1713543626;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f4mhCNV8W/5TjNI/o0+I+7IlgfRbVfVTTSOY/y+0AA8=;
        b=t2RwHqBN916x75poSp0qd71R8X+ob69xb0x8O4vC4NHj6AhMKmlwXHsuq9EangXf57
         XtS6ZPs4qw7u0TcNd2AOKszAqRaB8o/ot+NKeZvPhB360sKJYqcBBc15rvBLZxO0mfTT
         ty/SUeeydLKdCf6oiZhnP3yPCksYVCi29pYNj146lAye4PZvTU2VSCx1hXuJNN4dV7LH
         /BqLIpAwEL8MgxRsUS+p2a0FYNIiJ5UQY4iC2w48RJ1zsA/ZygVMp7pj5UEhaf2tdGj1
         Md7qMhXzYut8CoSYUuXeCL6fTVdYvvqLA0K1Aq62QDmGHy3aFpJ/EHjZj76YkZZwBKag
         3UjQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4/VCecVWUykSNXgzL9zHQJ8EIQ70Opst6/dAmjB6iRYYjdMPsCqof1RwA9uROExUm4fAIKXHT4Vi1XCjmjoBVcEMLjoCSH5ltFzd4H9WD
X-Gm-Message-State: AOJu0YwGUBaJ2w9RnmQIZ2iVfKnp87T8gQBIMoqF4ryyLrG2HlS5zowU
	V8S0MBfzqtoxdlTkFOlIhGgsCvS6j0j1cGf2L6J6wgnHOCtH5QS8dmZ+ASbwAQFDEcboNl2UZPu
	MydvhHkVRG0TyX4xqCU4NEi0lZAw5LK/DG08hiQ==
X-Google-Smtp-Source: AGHT+IGcVuu2qR8vC/UefSnb5ktxWef0mitPeGNb3fbxm7Uc1+AU+mtYbNxEsGRbIHqiuo4pviEOtffZaYZuGUQ4d0A=
X-Received: by 2002:a50:9fc3:0:b0:570:5d4:d697 with SMTP id
 c61-20020a509fc3000000b0057005d4d697mr596256edf.8.1712938825928; Fri, 12 Apr
 2024 09:20:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240405154850.1678802-1-mathieu.poirier@linaro.org> <ZhP4mkz+T7LIWEAH@kudzu.us>
In-Reply-To: <ZhP4mkz+T7LIWEAH@kudzu.us>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 12 Apr 2024 10:20:14 -0600
Message-ID: <CANLsYkwzqKrQXufRusnab22bf9Kt4fQsgEdN2dk-haDzz69h0w@mail.gmail.com>
Subject: Re: [PATCH v3] arm/trusted-firmware-rmm: Add bitbake, include and
 patch file for RMM
To: Jon Mason <jdmason@kudzu.us>
Cc: jon.mason@arm.com, ross.burton@arm.com, meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 12 Apr 2024 16:20:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5540

On Mon, 8 Apr 2024 at 08:01, Jon Mason <jdmason@kudzu.us> wrote:
>
> On Fri, Apr 05, 2024 at 09:48:50AM -0600, Mathieu Poirier wrote:
> > Initial checking providing support for RMM on QEMU's "virt" machine.
> >
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>
> LGTM, but I'll give Ross a chance to ack/nack (since he commented on
> it before).
>
> I did notice a COMPAT_MACHINE for qemuarm64 in the recipe below.

It was a request from Ross to avoid trying to build for other
machines/architectures where RME is not applicable.

> Should we integrate this into our CI?  If so, is there an automated
> way to test that it is functional?  If not, we can just add it to
> qemuarm64.yml and make sure it compiles.
>

Right now using the RMM to spin off a Realm VM depends on patches to
the Linux kernel that have been submitted[1] but still being
discussed.  As such making sure it compiles is probably the best
option.

[1]. https://lore.kernel.org/linux-arm-kernel/20240412084056.1733704-1-steven.price@arm.com/

> Thanks,
> Jon
>
>
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
> >

