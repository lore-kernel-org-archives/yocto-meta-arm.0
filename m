Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web11.33276.1591631419130649575
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Jun 2020 08:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=zFKnbhK0;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f194.google.com with SMTP id q8so17679354qkm.12
        for <meta-arm@lists.yoctoproject.org>; Mon, 08 Jun 2020 08:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BG3mN6NCYWDcSdrvR6+vdmWQVLTNV+4/+UZhH0Y5HKU=;
        b=zFKnbhK0S7lHD8F39gEbHxgCcw7SL5/4+O2LgZbtx26M1faEoiEdYBY5Ug2zhn1CUx
         FPSz4CRIvTnPPm41I4tScuuexsLHT4v9T1DSENK/b8q1Kol76dT43HbmgZvWf0tmUEXJ
         tS7TCNP7olEmArBCFd3xvQwDJd2YjE1w8NaGSx9R7WHlsRcIOH9C0OTEJK6g546L2+uH
         +CW8xSZfxJWVgbYuygM6sEIb1U4xKQH6KCsP+8Wns2roRPpC3FBA9YI0r35ksuGjIhm4
         88QfA1vfN8iVKqmTa6n+MsfNt+cIHqYwtoEMBhSmxSpgbU/fskIoV2BZHgFt9HkrWvCo
         ryIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BG3mN6NCYWDcSdrvR6+vdmWQVLTNV+4/+UZhH0Y5HKU=;
        b=eF9rBTKSaipjntSL0jlEJNESuXZjr4W1ApbA6K/QosLV0yjCtSvdr+6vfNqmbd4/7o
         OMCE+jAoSbmtU5kusVknT+AFdQ+68P9LIpTiIdLRIjZtM0+Mo7U8CsvAQ0zlK0ZGhE/j
         ZIbVizTt1tXqbUpjx45BH4HsutcvE0WC6x7E/h4e/mcj4Oz6oZ7PG+k6j0celOM3fBdE
         4qpH1emKXgAKodoIBcIDXnPfGMjSmn9+TCyIIilkqOhB1sEiR+y4UjZdN/aHq+H+qg9p
         fN9s+/12/eOieecVkNwYVX3XLnHRP+mcx7oCCyPgETz2qvRkZj/QjTYJCnnQsHzvtfHy
         J75Q==
X-Gm-Message-State: AOAM5311hwYx5EIlUIRoPqFcc5SMeIpd41eF24n2jZzYPXr8g6qlEzz9
	1Tv/4D2rtJDSpgD4SIkaCuUwkA==
X-Google-Smtp-Source: ABdhPJxcYEVsNBiVapM2RcXRIULHzzyO95qZ6ULngsLnhMyfJ/U7HIDXkyXvfRQXjbyIsm8uVupy5A==
X-Received: by 2002:a37:a9d7:: with SMTP id s206mr22899756qke.6.1591631418282;
        Mon, 08 Jun 2020 08:50:18 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:b9b3:35e6:b1bd:2c87])
        by smtp.gmail.com with ESMTPSA id 79sm7071047qkf.48.2020.06.08.08.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 08:50:17 -0700 (PDT)
Date: Mon, 8 Jun 2020 11:50:15 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Khasim Mohammed <khasim.mohammed@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com,
	Patrik Berglund <patrik.berglund@arm.com>
Subject: Re: [meta-arm] [PATCH] meta-arm: Add SCP MCP build support
Message-ID: <20200608155014.GE15959@kudzu.us>
References: <20200602165244.27561-1-khasim.mohammed@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200602165244.27561-1-khasim.mohammed@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 02, 2020 at 05:52:44PM +0100, Khasim Mohammed wrote:
> SCP-firmware provides a software reference implementation for
> the System Control Processor (SCP) and Manageability Control
> Processor (MCP) components found in several Arm Compute
> Sub-Systems.
> 
> This patch set adds support to fetch and build SCP and MCP
> firmware binaries
> 
> Issue-Id: PLATFORMS-3134
> 
> Change-Id: Ic7259bb430c9e7e9711c9c8bc3283aafaacdf707
> Signed-off-by: Patrik Berglund <patrik.berglund@arm.com>
> Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>

Pulled into master branch

Thanks,
Jon

> ---
>  .../recipes-bsp/scp-firmware/scp-firmware.inc | 71 +++++++++++++++++++
>  .../scp-firmware/scp-firmware_git.bb          | 20 ++++++
>  2 files changed, 91 insertions(+)
>  create mode 100644 meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
>  create mode 100644 meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> 
> diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc b/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> new file mode 100644
> index 0000000..1873848
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> @@ -0,0 +1,71 @@
> +SUMMARY = "SCP and MCP Firmware"
> +
> +PROVIDES += "virtual/control-processor-firmware"
> +
> +SCP_BUILD_RELEASE   ?= "1"
> +SCP_COMPILE_VERBOSE ?= "0"
> +SCP_PLATFORM        ?= "invalid"
> +SCP_COMPILER        ?= "arm-none-eabi"
> +
> +DEPENDS += "virtual/arm-none-eabi-gcc-native"
> +
> +SCP_BUILD_STR = "${@bb.utils.contains('SCP_BUILD_RELEASE', '1', 'release', 'debug', d)}"
> +SCP_COMP_STR  = "${@bb.utils.contains('SCP_COMPILE_VERBOSE', '0', '', 'V=1', d)}"
> +
> +inherit python3native
> +inherit deploy
> +
> +B = "${WORKDIR}/build"
> +S = "${WORKDIR}/src"
> +
> +# Allow platform specific copying of only scp or both scp & mcp, default to both
> +FW_TARGETS ?= "scp mcp"
> +
> +COMPATIBLE_MACHINE ?= "invalid"
> +
> +LDFLAGS[unexport] = "1"
> +
> +# The gcc-arm-none-eabi version does not support -fmacro-prefix-max
> +DEBUG_PREFIX_MAP_pn-scp = "\
> +    -fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
> +    -fdebug-prefix-map=${STAGING_DIR_HOST}= \
> +    -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
> +"
> +
> +# No configure
> +do_configure[noexec] = "1"
> +
> +EXTRA_OEMAKE = "${SCP_COMP_STR} \
> +                BUILD_PATH='${B}' \
> +                PRODUCT='${SCP_PLATFORM}' \
> +                MODE='${SCP_BUILD_STR}' \
> +                CC='${SCP_COMPILER}-gcc' \
> +                AR='${SCP_COMPILER}-ar' \
> +                SIZE='${SCP_COMPILER}-size' \
> +                OBJCOPY='${SCP_COMPILER}-objcopy' \
> +                "
> +
> +do_compile() {
> +    oe_runmake -C "${S}" ${EXTRA_OEMAKE}
> +}
> +do_compile[cleandirs] += "${B}"
> +
> +do_install() {
> +     install -d ${D}/firmware
> +     for FW in ${FW_TARGETS}; do
> +        for TYPE in ramfw romfw; do
> +           install -D "${B}/product/${SCP_PLATFORM}/${FW}_${TYPE}/release/bin/${FW}_${TYPE}.bin" "${D}/firmware/"
> +        done
> +     done
> +}
> +
> +FILES_${PN} = "/firmware"
> +SYSROOT_DIRS += "/firmware"
> +# Skip QA check for relocations in .text of elf binaries
> +INSANE_SKIP_${PN} = "textrel"
> +
> +do_deploy() {
> +    # Copy the images to deploy directory
> +    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
> +}
> +addtask deploy after do_install
> diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> new file mode 100644
> index 0000000..5ff5859
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> @@ -0,0 +1,20 @@
> +DESCRIPTION = "Firmware for SCP and MCP software reference implementation"
> +HOMEPAGE = "https://github.com/ARM-software/SCP-firmware"
> +
> +LICENSE = "BSD-3-Clause & Apache-2.0"
> +
> +# SCP
> +LIC_FILES_CHKSUM = "file://license.md;beginline=5;md5=9db9e3d2fb8d9300a6c3d15101b19731"
> +# CMSIS
> +LIC_FILES_CHKSUM += "file://cmsis/LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e"
> +
> +SRC_URI = "\
> +    git://github.com/ARM-software/SCP-firmware.git;protocol=https;name=scp;destsuffix=src;nobranch=1 \
> +    git://github.com/ARM-software/CMSIS_5.git;protocol=https;name=cmsis;destsuffix=src/cmsis;lfs=0;nobranch=1 \
> +"
> +
> +SRCREV_scp    = "db19910aca6d1032eb0329e5fbb70a92b997f6f2"
> +SRCREV_cmsis  = "refs/tags/5.2.0"
> +SRCREV_FORMAT = "scp_cmsis"
> +
> +require scp-firmware.inc
> -- 
> 2.17.1
> 

> 

