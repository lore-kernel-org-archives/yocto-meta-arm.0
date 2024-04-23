Return-Path: <mathieu.poirier@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 491ACC4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 15:50:33 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.22281.1713887427127606839
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Apr 2024 08:50:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=nBuGF6D6;
 spf=pass (domain: linaro.org, ip: 209.85.208.47, mailfrom: mathieu.poirier@linaro.org)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5722601d2aeso585751a12.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 23 Apr 2024 08:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713887425; x=1714492225; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1DZCA68/naA58zQ+agmYxhl5Oiahx+OZOzd2SK8uFx4=;
        b=nBuGF6D6FykCYVmMG9tIjn4UvGck1n5ishWKvDPPAdVPqOSglTyXG5/CkGgVvdOB8Q
         aaX7B6QzAcmK/4r7KPLXPrqu9mGYS2QT7GWjLw5EfPHh/XrEenG7bK1pQCULp4VuOYo3
         eQ9Z1vkGE7w2ANT8SLyhQ7Loy0PrNNQalE3qKFm/bPupLKy1jv6FY3ToN1BEyNPz4sYZ
         QzD+Q+lpxZygxcr51XG/clH61Hvbq9mSpA1LfFd3mbp9c5iavkbaICk/e58NiRTo9ORY
         k6S9/JRqwTiRD6EW75t2Wrqot0oPXiVobENWwl2cJ4SUZ3o+BhimCzXjIAMF7/FEYxc2
         r+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713887425; x=1714492225;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1DZCA68/naA58zQ+agmYxhl5Oiahx+OZOzd2SK8uFx4=;
        b=l9uHONzvBVVXMTEzXWkrktuoXvJPwyNPDJvmYaPciRuT7avQVtd8cQVNMFZWRAiLH3
         aFh4UNYREwxu99boWAyrFBouKk5a6qQbcuuBWp7z0bAPJA0KNwlnGhWcbF8QxmqL2YjM
         Hm0QPs6q6Wen33Luxig4caIGWv9Gqm1Zzvr3hWByk5cXH1SOFrOuQEauSsnLtNED4xD6
         7vlzLPU5Ykg3ZhReLvfMVVhhNiTdJZ/woxt5s7WI+9/x0u6yiNNy3GLI7rE6y+zHWcIL
         YQLGclwrV9vo5yxrWPRYxppEtwAOBIo5IeVY0JNWsYh+HAvgZge4HH+7U91OgCfZcDBO
         5XMw==
X-Gm-Message-State: AOJu0YxOXzyYeB8/mTkOn5OINvUVCwEX7I+9pDqulVTNwnUsst+LpxiH
	FvrTR2wa3ooJzL178Aw+0IITeR2hEzOJOluZELYet3LijPX+YhP+KJ77QGrW5SI9TH3CktFx5AC
	jSdSnPPnI0EE/978OEZg2h/loPOfVvDxiP0LaSQ==
X-Google-Smtp-Source: AGHT+IEz6z7XSOehFwG+LJxpUKTXwZ0qHtGaRNYwFXAIoW/2jWhw5yFPJDsobEU8y/NiLnAabjLWINyB9/284IxRd8c=
X-Received: by 2002:a05:6402:5190:b0:56f:e819:c0d4 with SMTP id
 q16-20020a056402519000b0056fe819c0d4mr4037685edd.18.1713887425371; Tue, 23
 Apr 2024 08:50:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240405154850.1678802-1-mathieu.poirier@linaro.org>
In-Reply-To: <20240405154850.1678802-1-mathieu.poirier@linaro.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 23 Apr 2024 09:50:14 -0600
Message-ID: <CANLsYky=iWo_zcx0A4=gcbwH+iCWN=d0Mgvsd12c-ON8WhLByQ@mail.gmail.com>
Subject: Re: [PATCH v3] arm/trusted-firmware-rmm: Add bitbake, include and
 patch file for RMM
To: jon.mason@arm.com, ross.burton@arm.com
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 23 Apr 2024 15:50:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5585

Hi Ross and Jon,

Is there anything else you'd like me to modify on this patch?

Thanks,
Mathieu

On Fri, 5 Apr 2024 at 09:48, Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
>
> Initial checking providing support for RMM on QEMU's "virt" machine.
>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
> Changes for V3:
> 1) Setting RMM_CONFIG default to "" and restricting the compilation of
> RMM to "qemuarm64" machines.
> 2) Removed setting of variable "B"
> 3) Setting CMAKE_INCLUDE_PATH to ${STAGING_INCDIR}
> 4) Removed CMAKE_BUILD_PARALLEL_LEVEL
> 5) Added comment to justify using CROSS_COMPILE
> 6) Reworked the declaration of SRC_URI and SRCREV
> ---
>  ...tra-repositories-for-system-includes.patch | 56 +++++++++++++++++++
>  .../trusted-firmware-rmm_0.4.bb               | 50 +++++++++++++++++
>  2 files changed, 106 insertions(+)
>  create mode 100644 meta-arm/recipes-bsp/trusted-firmware-rmm/files/0001-build-lib-Add-extra-repositories-for-system-includes.patch
>  create mode 100644 meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.4.bb
>
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-rmm/files/0001-build-lib-Add-extra-repositories-for-system-includes.patch b/meta-arm/recipes-bsp/trusted-firmware-rmm/files/0001-build-lib-Add-extra-repositories-for-system-includes.patch
> new file mode 100644
> index 000000000000..7c3e637f0d63
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/trusted-firmware-rmm/files/0001-build-lib-Add-extra-repositories-for-system-includes.patch
> @@ -0,0 +1,56 @@
> +From bc7dbac20a6674eb2834bd6176665f1a2ae42edc Mon Sep 17 00:00:00 2001
> +From: Mathieu Poirier <mathieu.poirier@linaro.org>
> +Date: Thu, 14 Mar 2024 14:59:30 -0600
> +Subject: [PATCH] build(lib): Add extra repositories for system includes
> +
> +Toolchains such as aarch64-none-elf, aarch64-none-linux-gnu and
> +aarch64-linux-gnu include assert.h and limits.h in a directory that is
> +part of their search path.  This is not the case when compiling with
> +Yocto where aarch64-poky-linux places those files in the sysroot
> +directory of the component being compiled.
> +
> +Since the sysroot directory of the component is not part of the cmake
> +search path, compiling the RMM in Yocto fails.  This patch fixes the
> +problem by expanding the search path when needed, allowing the RMM to be
> +compiled in Yocto.
> +
> +Upstream-Status: Backport [bc7dbac20a6674eb2834bd6176665f1a2ae42edc]
> +Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> +---
> + lib/arch/CMakeLists.txt | 3 +++
> + lib/libc/CMakeLists.txt | 5 ++++-
> + 2 files changed, 7 insertions(+), 1 deletion(-)
> +
> +diff --git a/lib/arch/CMakeLists.txt b/lib/arch/CMakeLists.txt
> +index d3afc5f2bfc8..a52185f02695 100644
> +--- a/lib/arch/CMakeLists.txt
> ++++ b/lib/arch/CMakeLists.txt
> +@@ -12,6 +12,9 @@ target_link_libraries(rmm-lib-arch
> + target_include_directories(rmm-lib-arch
> +     PUBLIC  "include"
> +             "include/${RMM_ARCH}"
> ++            # The CMAKE_INCLUDE_PATH is included here for Yocto builds.  the
> ++            # Yocto recipe will define this variable as part of the build.
> ++            ${CMAKE_INCLUDE_PATH}
> +     PRIVATE "src/${RMM_ARCH}"
> +             "src/include")
> +
> +diff --git a/lib/libc/CMakeLists.txt b/lib/libc/CMakeLists.txt
> +index 1631332dbc72..a2adf37f7cb8 100644
> +--- a/lib/libc/CMakeLists.txt
> ++++ b/lib/libc/CMakeLists.txt
> +@@ -12,7 +12,10 @@ if(NOT RMM_ARCH STREQUAL fake_host)
> +            rmm-lib-debug)
> +
> +     target_include_directories(rmm-lib-libc SYSTEM
> +-        PUBLIC "include")
> ++        PUBLIC "include"
> ++        # The CMAKE_INCLUDE_PATH is included here for Yocto builds.  the
> ++        # Yocto recipe will define this variable as part of the build.
> ++        ${CMAKE_INCLUDE_PATH})
> +
> +     target_sources(rmm-lib-libc
> +         PRIVATE "src/abort.c"
> +--
> +2.34.1
> +
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.4.bb b/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.4.bb
> new file mode 100644
> index 000000000000..0726cd3d2497
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.4.bb
> @@ -0,0 +1,50 @@
> +SUMMARY = "RMM Firmware"
> +DESCRIPTION = "RMM Firmware for Arm reference platforms"
> +LICENSE = "BSD-3-Clause & MIT"
> +
> +SRC_URI = "gitsm://git.trustedfirmware.org/TF-RMM/tf-rmm.git;protocol=https;branch=main \
> +           file://0001-build-lib-Add-extra-repositories-for-system-includes.patch \
> +          "
> +
> +SRCREV = "0a02656945d69757b0779192cebb9b41dd9037d1"
> +
> +LIC_FILES_CHKSUM += "file://docs/about/license.rst;md5=1375c7c641558198ffe401c2a799d79b"
> +
> +inherit deploy cmake
> +
> +RMM_CONFIG ?= ""
> +RMM_CONFIG:qemuarm64 = "qemu_virt_defcfg"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +COMPATIBLE_MACHINE = "qemuarm64"
> +
> +S = "${WORKDIR}/git"
> +
> +# Build for debug (set RMM_DEBUG to 1 to activate)
> +RMM_DEBUG ?= "0"
> +RMM_BUILD_MODE ?= "${@bb.utils.contains('RMM_DEBUG', '1', 'Debug', 'Release', d)}"
> +
> +# Handle RMM_DEBUG parameter
> +EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=${RMM_BUILD_MODE}"
> +EXTRA_OECMAKE += "-DRMM_CONFIG=${RMM_CONFIG}"
> +
> +# Supplement include path
> +EXTRA_OECMAKE += "-DCMAKE_INCLUDE_PATH=${STAGING_INCDIR}"
> +
> +# When compiling for Aarch64 on non-native hosts, the RMM code base gets its
> +# toolchain from CROSS_COMPILE rather than CMAKE_TOOLCHAIN_FILE
> +export CROSS_COMPILE="${TARGET_PREFIX}"
> +
> +do_install() {
> +    install -d -m 755 ${D}/firmware
> +    install -m 0644 ${B}/${RMM_BUILD_MODE}/* ${D}/firmware/
> +}
> +
> +FILES:${PN} = "/firmware"
> +SYSROOT_DIRS += "/firmware"
> +
> +do_deploy() {
> +    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
> +}
> +
> +addtask deploy after do_install
> --
> 2.34.1
>

