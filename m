Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 030CAC48BF6
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 16:25:31 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web11.27752.1709828727811584753
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 Mar 2024 08:25:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=tBLprdTB;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f195.google.com with SMTP id af79cd13be357-7884ccbda0fso19874085a.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 07 Mar 2024 08:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1709828727; x=1710433527; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gjUG6TiMWgDOzEulqxnVSOVarSBLLPUG2Ak9m0MjK6s=;
        b=tBLprdTB2UFyTcJ++mFw8jZTjJGfk9da7Ms/MyP/jSfT8vYXCAT3vPP9m9mRuBcEkz
         i3xSeGb+lwSDlulJZw5bjdzN1J6MLaRFa3+q26EssJvfC9BSe2Lgi09NgM0v6HzrKJZR
         gbITqVewyg0RQVrc1HVC/Zb/lgvG7t5VWhq1B35SSK/oV+TvKvSi2gr5FjqbPsbecwNq
         VfOnLzcpoWANz+3Bha6SyLyCX3ef1irE4cuRqE6TYwU6d3nBpDF2MkrmDRBQQDq758Z0
         q6bN4Rt/i29i17cRnxfqX2OzhWnZcpcd95RcaCtGs2eAqx3F0PCu/sBpapNRh3phsET2
         W5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709828727; x=1710433527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gjUG6TiMWgDOzEulqxnVSOVarSBLLPUG2Ak9m0MjK6s=;
        b=T/PGvvyTfg79g1mLP7hTEiVTVvcys9DY/YZTQ4c5qlvVFaKCD2vfc2Ut7iTtFe6ckh
         5a2sUEglN7NjW2pwcYqlOC6KDlFZPKb7tlT8iYvm/gC0Y4/Mre8WAf9trmKFl+DY0o7r
         zA6F8k1Mh0O50GWkwtyq8MGQGGiQpgLFt3si1rsNMl+4JZSBFDsg8Z8Ptx4SqFBatORK
         ZEa7yU3cw05FhuU6SGvUHX8kRimz1uSQgocFQQQIjf2ih3BI6BTa+Vaf5VUZYNCgzOmz
         jczUQRmHciQJ4IhPMK1B8pnaiR4sj2YjAqdTUS2IhTKnlRgK6IccJPXFU0afxZTo9s3K
         7MCg==
X-Gm-Message-State: AOJu0Yx+EiwusQ61cFspERYT3qIz94UASt2h2Az39OSNopoyfAEytwwh
	GxjT+KsGnA87AZdOJu9oinFaHCeLT82Z87AF3a9is1maudzGJTaMo2XnZ/0DxsWSK80XzWEwDc4
	qxRor
X-Google-Smtp-Source: AGHT+IEYMYHFgHrDAVsqiMxCjqp+M6jFBX7y/AC6M6HX+lCP6YsgUJhwi7LounKBkVjCq2iXYz2NLQ==
X-Received: by 2002:a05:620a:490f:b0:788:36a2:c349 with SMTP id vy15-20020a05620a490f00b0078836a2c349mr8437012qkn.6.1709828726832;
        Thu, 07 Mar 2024 08:25:26 -0800 (PST)
Received: from kudzu.us ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id vz3-20020a05620a494300b0078812b73ea1sm6218532qkn.28.2024.03.07.08.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 08:25:26 -0800 (PST)
Date: Thu, 7 Mar 2024 11:25:19 -0500
From: Jon Mason <jdmason@kudzu.us>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH 1/1] arm/rmm: Add bitbake, include and patch file for RMM
 firmware
Message-ID: <Zenqb53VZ2dOXkgc@kudzu.us>
References: <20240304231639.4187147-1-mathieu.poirier@linaro.org>
 <20240304231639.4187147-2-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240304231639.4187147-2-mathieu.poirier@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 07 Mar 2024 16:25:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5421

On Mon, Mar 04, 2024 at 04:16:39PM -0700, Mathieu Poirier wrote:
> Initial checking providing support for RMM on QEMU's "virt" machine.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  ...Add-repositories-for-system-includes.patch | 45 ++++++++++++++++
>  meta-arm/recipes-bsp/rmm/rmm.inc              | 54 +++++++++++++++++++
>  meta-arm/recipes-bsp/rmm/rmm_1.0.bb           |  5 ++
>  3 files changed, 104 insertions(+)
>  create mode 100644 meta-arm/recipes-bsp/rmm/files/0001-CMakeLists-Add-repositories-for-system-includes.patch
>  create mode 100644 meta-arm/recipes-bsp/rmm/rmm.inc
>  create mode 100644 meta-arm/recipes-bsp/rmm/rmm_1.0.bb
> 
> diff --git a/meta-arm/recipes-bsp/rmm/files/0001-CMakeLists-Add-repositories-for-system-includes.patch b/meta-arm/recipes-bsp/rmm/files/0001-CMakeLists-Add-repositories-for-system-includes.patch
> new file mode 100644
> index 000000000000..a2f2137012d3
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/rmm/files/0001-CMakeLists-Add-repositories-for-system-includes.patch
> @@ -0,0 +1,45 @@
> +From e9e6d5ded4c3e53254438a73a79f04209035603e Mon Sep 17 00:00:00 2001
> +From: Mathieu Poirier <mathieu.poirier@linaro.org>
> +Date: Mon, 4 Mar 2024 13:38:03 -0700
> +Subject: [PATCH] CMakeLists: Add repositories for system includes
> +
> +Yocto's default aarch64 toolchain, i.e aarch64-poky-linux-, doesn't
> +include assert.h and stderr.h by default, leading to a compilation error
> +for files that need them.  As such add the path of the base sysroot
> +directory to the list of directories to be included when compiling.
> +
> +Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>

This needs an upstream status.  See
https://docs.yoctoproject.org/current/contributor-guide/recipe-style-guide.html#patch-upstream-status

> +---
> + lib/arch/CMakeLists.txt | 1 +
> + lib/libc/CMakeLists.txt | 3 ++-
> + 2 files changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/lib/arch/CMakeLists.txt b/lib/arch/CMakeLists.txt
> +index 93c0ae76bb65..628f4c981051 100644
> +--- a/lib/arch/CMakeLists.txt
> ++++ b/lib/arch/CMakeLists.txt
> +@@ -12,6 +12,7 @@ target_link_libraries(rmm-lib-arch
> + target_include_directories(rmm-lib-arch
> +     PUBLIC  "include"
> +             "include/${RMM_ARCH}"
> ++	    "../../../recipe-sysroot/usr/include/"
> +     PRIVATE "src/${RMM_ARCH}"
> +             "src/include")
> + 
> +diff --git a/lib/libc/CMakeLists.txt b/lib/libc/CMakeLists.txt
> +index 1631332dbc72..94d559b7aae0 100644
> +--- a/lib/libc/CMakeLists.txt
> ++++ b/lib/libc/CMakeLists.txt
> +@@ -12,7 +12,8 @@ if(NOT RMM_ARCH STREQUAL fake_host)
> +            rmm-lib-debug)
> + 
> +     target_include_directories(rmm-lib-libc SYSTEM
> +-        PUBLIC "include")
> ++        PUBLIC "include"
> ++        "../../../recipe-sysroot/usr/include/")
> + 
> +     target_sources(rmm-lib-libc
> +         PRIVATE "src/abort.c"
> +-- 
> +2.43.0
> +
> diff --git a/meta-arm/recipes-bsp/rmm/rmm.inc b/meta-arm/recipes-bsp/rmm/rmm.inc
> new file mode 100644
> index 000000000000..0cdf62b412d5
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/rmm/rmm.inc
> @@ -0,0 +1,54 @@
> +SUMMARY = "RMM Firmware"
> +DESCRIPTION = "RMM Firmware for Arm reference platforms"
> +LICENSE = "BSD-3-Clause & MIT"
> +
> +SRC_URI = "${SRC_URI_RMM};name=rmm;branch=${SRCBRANCH_rmm} \
> +	   file://0001-CMakeLists-Add-repositories-for-system-includes.patch \
> +	"
> +
> +LIC_FILES_CHKSUM += "file://${WORKDIR}/git/docs/about/license.rst;md5=1375c7c641558198ffe401c2a799d79b"

This should probably be
LIC_FILES_CHKSUM = "file://docs/about/license.rst;md5=1375c7c641558198ffe401c2a799d79b"

You are doing cmake wrong below.  Look at
https://docs.yoctoproject.org/current/ref-manual/classes.html?highlight=cmake#ref-classes-cmake

There are lots of examples in meta-arm and poky of recipes using
cmake.  Please reference those and clean-up below.

> +
> +inherit deploy
> +
> +DEPENDS += "cmake-native"
> +
> +RMM_CONFIG ?= "qemu_virt_defcfg"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +S = "${WORKDIR}/git"
> +B = "${WORKDIR}/build"
> +
> +# Build for debug (set RMM_DEBUG to 1 to activate)
> +RMM_DEBUG ?= "0"
> +RMM_BUILD_MODE ?= "${@bb.utils.contains('RMM_DEBUG', '1', 'Debug', 'Release', d)}"
> +
> +# Handle RMM_DEBUG parameter
> +EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=${RMM_BUILD_MODE}"
> +EXTRA_OECMAKE += "-DRMM_CONFIG=${RMM_CONFIG}"
> +
> +export CROSS_COMPILE="${TARGET_PREFIX}"
> +export CMAKE_BUILD_PARALLEL_LEVEL = "${@oe.utils.parallel_make(d, False)}"
> +
> +do_configure[cleandirs] = "${B}"
> +do_configure() {
> +    cmake -S ${S} -B ${B} ${EXTRA_OECMAKE}
> +}
> +
> +do_compile() {
> +    cmake --build ${B}
> +}
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
> diff --git a/meta-arm/recipes-bsp/rmm/rmm_1.0.bb b/meta-arm/recipes-bsp/rmm/rmm_1.0.bb

Looking at the git tree referenced below, this isn't version 1.0
It actually looks like you picked a SHA that was probably the HEAD a
month ago.  I would've thought you'd want to use tf-rmm-v0.4.0, which
would make the recipe name rmm_0.4.0

Also, I'm thinking that since it is from trusted-firmware-a, it would
live in that directory (but this is purely a guess).

> new file mode 100644
> index 000000000000..95a4f4a4667a
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/rmm/rmm_1.0.bb
> @@ -0,0 +1,5 @@
> +SRC_URI_RMM	     ?= "gitsm://git.trustedfirmware.org/TF-RMM/tf-rmm.git;protocol=https"
> +SRCREV_rmm	     ?= "01a3cb75c6e6c50851d5d939d237966d110ed91d"
> +SRCBRANCH_rmm	     ?= "main"
> +
> +require recipes-bsp/rmm/rmm.inc

Unless there is going to be mulitple versions living in the same tree,
I don't see a need for an inc file, especially one so trivial.

Thanks,
Jon

> -- 
> 2.43.0
> 
> 

