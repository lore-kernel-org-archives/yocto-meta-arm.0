Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62AD5CD128A
	for <webhook@archiver.kernel.org>; Mon,  8 Apr 2024 14:01:12 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.107209.1712584866394790176
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Apr 2024 07:01:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=UMMGhW10;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-789d76ad270so279559085a.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 08 Apr 2024 07:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1712584865; x=1713189665; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b9IlG5XYwoMPZIeNH7tar4bpz+0+HRW08iOFAh9i1rc=;
        b=UMMGhW108Jdny9hEzMoGRp8JIP91E21JJEpgeD4HP8UhmCwXMypFy5W8NvfvgaDFyr
         2A7oahWKS0t2M3gAegAtsrnEU7nBB+HI8YeOVR4YuCTDi2+SPLs3CDRNi030+vl3c+Bc
         LrqxrChu7dsIztRWHcpRPXrrEKW1sRmruntdQkk1a5UKJTQUz22Cu9hV57fHcGPb4wu4
         WPYhUP5E4eE5szFQQxK1LkgiySSfzKrNquXGsczoe5LCGkmmdNU95+qdbh360inlhKtx
         osO/xm6RSCkY/tVlVzvx7DQo7K/wcVMuMOZ947PXl79AVVUIx4I5hwJYGTPvpo9AjgYc
         QLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712584865; x=1713189665;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b9IlG5XYwoMPZIeNH7tar4bpz+0+HRW08iOFAh9i1rc=;
        b=tUPafAb5tyhbkNFP3T48b6wa9azFXVaaxkP3viLYWKF6OLqyEPI09WgPCjDryunCZS
         ZcY9E58hp7hZx+qnG3As5PKrB3H5SEEIELSpYfRJxFuOwSaBWn6WjXwsjXHgsJC2xI11
         JBKKnhbJijP8eSvNadq3Coj/mD5hTpW9emckz7mvmkwa1lI449W3SV124LTDOfK0sNzU
         ST+2pQI76Jn7MgKRzLYiBWsLtVzavNQEXR+oHFDkX3C5lwUd1y2X/ohUgkI0WWWSaxpi
         A07ziTYGNq8t2aAwUJRFKUB5kLuIxm7upvCObIxLIuEDuRQG1C8Edsx0FUgiRWgbgljk
         jEQA==
X-Forwarded-Encrypted: i=1; AJvYcCWLoqUab2jriOJHleE94+BKlEF4di7qiCNqCUhH1vCuEQgQeqEkKOAZjABBTU7Ujpz0CGodszgaYlwJqgwMUEIRd1r/atfx0kzQgquQLeFV
X-Gm-Message-State: AOJu0Yy8HOQDvkNlumttoeOIwh622Q2QFlPHra9wSFu0T6RAqCtXUOiX
	ENBVhzt/WbWkAtIb0UYrhpeXPYt+UcD/hyPmLO26fPYLO9108QPonqraHvi/pg==
X-Google-Smtp-Source: AGHT+IFLI1a65cepOA+d1E6+iiBBx28tS4Y3PrhDYj8acLxArlNt6mNZ5nU+1frRE97YzyhuR2LDuA==
X-Received: by 2002:a37:ef02:0:b0:78d:46b0:d379 with SMTP id j2-20020a37ef02000000b0078d46b0d379mr9684489qkk.8.1712584865326;
        Mon, 08 Apr 2024 07:01:05 -0700 (PDT)
Received: from kudzu.us ([2605:a601:919e:c800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id bk29-20020a05620a1a1d00b0078d6136bf10sm1641724qkb.8.2024.04.08.07.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 07:01:05 -0700 (PDT)
Date: Mon, 8 Apr 2024 10:00:58 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: jon.mason@arm.com, ross.burton@arm.com, meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH v3] arm/trusted-firmware-rmm: Add bitbake, include and
 patch file for RMM
Message-ID: <ZhP4mkz+T7LIWEAH@kudzu.us>
References: <20240405154850.1678802-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240405154850.1678802-1-mathieu.poirier@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 08 Apr 2024 14:01:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5512

On Fri, Apr 05, 2024 at 09:48:50AM -0600, Mathieu Poirier wrote:
> Initial checking providing support for RMM on QEMU's "virt" machine.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>

LGTM, but I'll give Ross a chance to ack/nack (since he commented on
it before).  

I did notice a COMPAT_MACHINE for qemuarm64 in the recipe below.
Should we integrate this into our CI?  If so, is there an automated
way to test that it is functional?  If not, we can just add it to
qemuarm64.yml and make sure it compiles.

Thanks,
Jon


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
> 

