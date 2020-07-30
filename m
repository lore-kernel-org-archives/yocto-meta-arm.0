Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web10.3199.1596138934139869766
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Jul 2020 12:55:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=FJqrCGz4;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.67, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f67.google.com with SMTP id r19so4602018qvw.11
        for <meta-arm@lists.yoctoproject.org>; Thu, 30 Jul 2020 12:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kspPkTAoiYhgyGe09m3mRR8OvQqpdah9i49bZ9LwGdo=;
        b=FJqrCGz4wajU7bDcxkTxg0r5yD1zXDMk8PRjwGuIDdrT5qdBbaNOUjxtIOcMDrpDgg
         CiI0smjSua/fPhLZQnPKwyQLyM/Jd8tz5yJOcOLU3QKW7x+KBqlRz0hV5eVtKbSsN1kk
         5NFPUHpuVrGG8D01/IHfRJnU18tPffYnn5KENRiYkA/V5KJqYODO3A2WCy7C1EztcW8f
         meuYiqX946wyFNO+IsZuWqajzIu6nURnj6x26mQQT9HEhnsntS7xZT1ieZkbA5Y593sS
         zbXA4llw3Qi8NISSheRZZ+/6XZ19tHXK1j0jbHPgBwRu5aUtasg9c0+LVCvMV/Kj2SP6
         hSiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kspPkTAoiYhgyGe09m3mRR8OvQqpdah9i49bZ9LwGdo=;
        b=McRnv3/tHdCmzMadwZFngWZIB3qKayQSv2nMQnk6M8hSveJPFQWKPEunK2WFO5Ygl+
         pDAaAO+G8FDtapg84jyvutZTYHBB/wbTM6ATvf7RnuKGg9Pqgs+kSITQkVe2lXVNUov5
         wSDZEA7NbvgLsFKDocXipnQDa7IHa4zq9GOjRUfY2A4Z8B7nSJcZJygY3J81dlrd8BDb
         UmXhOxdIQbrLT1OqXQ5lSGWXg6ANoxwKxOq5a3IWp6JF3SC27Zp0MescaMvrNIP9L1kP
         XQgiYA88XKYF8HVXNS8UXTpeGdVDr/KSDPmVOc1JGLWwalMr9wgDAgWyJFsD5mA2MAHd
         FOCA==
X-Gm-Message-State: AOAM533Loz4msHU+FN14Ac/XMa3T+wSWEa6k/dGuG+L4NrsASQ1zX7+x
	hFhsjXKCH6XqChs0m0Zfe7FTkupimB2f2w==
X-Google-Smtp-Source: ABdhPJxrCag7t72Ted2ww8MjM0ha3emU8EfqKIYXKCP+e5wBHmdMPkT+CTpwtfnlQAG1huYCAVB1Pg==
X-Received: by 2002:a0c:b665:: with SMTP id q37mr757441qvf.75.1596138933257;
        Thu, 30 Jul 2020 12:55:33 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:9dd:6e19:a3fe:5a3c])
        by smtp.gmail.com with ESMTPSA id n81sm4953000qke.11.2020.07.30.12.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 12:55:33 -0700 (PDT)
Date: Thu, 30 Jul 2020 15:55:31 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/9] arm/scp-firmware: merge bb/inc
Message-ID: <20200730195531.GB15405@kudzu.us>
References: <20200729101145.1794231-1-ross@burtonini.com>
MIME-Version: 1.0
In-Reply-To: <20200729101145.1794231-1-ross@burtonini.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 29, 2020 at 11:11:37AM +0100, Ross Burton wrote:
> From: Ross Burton <ross.burton@arm.com>
> 
> There's no other recipe that uses scp-firmware.inc, so merge it into the
> recipe for clarity.
> 
> Change-Id: Ife1874b54c8b2be2704e1d0f5a7013ff89b8ca6e
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Series added to master.

Thanks,
Jon

> ---
>  .../recipes-bsp/scp-firmware/scp-firmware.inc | 73 -------------------
>  .../scp-firmware/scp-firmware_git.bb          | 73 ++++++++++++++++++-
>  2 files changed, 72 insertions(+), 74 deletions(-)
>  delete mode 100644 meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> 
> diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc b/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> deleted file mode 100644
> index 2db59d3..0000000
> --- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> +++ /dev/null
> @@ -1,73 +0,0 @@
> -SUMMARY = "SCP and MCP Firmware"
> -
> -PROVIDES += "virtual/control-processor-firmware"
> -
> -SCP_BUILD_RELEASE   ?= "1"
> -SCP_COMPILE_VERBOSE ?= "0"
> -SCP_PLATFORM        ?= "invalid"
> -SCP_COMPILER        ?= "arm-none-eabi"
> -SCP_LOG_LEVEL       ?= "WARN"
> -
> -DEPENDS += "virtual/arm-none-eabi-gcc-native"
> -
> -SCP_BUILD_STR = "${@bb.utils.contains('SCP_BUILD_RELEASE', '1', 'release', 'debug', d)}"
> -SCP_COMP_STR  = "${@bb.utils.contains('SCP_COMPILE_VERBOSE', '0', '', 'V=1', d)}"
> -
> -inherit python3native
> -inherit deploy
> -
> -B = "${WORKDIR}/build"
> -S = "${WORKDIR}/src"
> -
> -# Allow platform specific copying of only scp or both scp & mcp, default to both
> -FW_TARGETS ?= "scp mcp"
> -
> -COMPATIBLE_MACHINE ?= "invalid"
> -
> -LDFLAGS[unexport] = "1"
> -
> -# The gcc-arm-none-eabi version does not support -fmacro-prefix-max
> -DEBUG_PREFIX_MAP_pn-scp = "\
> -    -fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
> -    -fdebug-prefix-map=${STAGING_DIR_HOST}= \
> -    -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
> -"
> -
> -# No configure
> -do_configure[noexec] = "1"
> -
> -EXTRA_OEMAKE = "${SCP_COMP_STR} \
> -                BUILD_PATH='${B}' \
> -                PRODUCT='${SCP_PLATFORM}' \
> -                MODE='${SCP_BUILD_STR}' \
> -                LOG_LEVEL='${SCP_LOG_LEVEL}' \
> -                CC='${SCP_COMPILER}-gcc' \
> -                AR='${SCP_COMPILER}-ar' \
> -                SIZE='${SCP_COMPILER}-size' \
> -                OBJCOPY='${SCP_COMPILER}-objcopy' \
> -                "
> -
> -do_compile() {
> -    oe_runmake -C "${S}" ${EXTRA_OEMAKE}
> -}
> -do_compile[cleandirs] += "${B}"
> -
> -do_install() {
> -     install -d ${D}/firmware
> -     for FW in ${FW_TARGETS}; do
> -        for TYPE in ramfw romfw; do
> -           install -D "${B}/product/${SCP_PLATFORM}/${FW}_${TYPE}/release/bin/${FW}_${TYPE}.bin" "${D}/firmware/"
> -        done
> -     done
> -}
> -
> -FILES_${PN} = "/firmware"
> -SYSROOT_DIRS += "/firmware"
> -# Skip QA check for relocations in .text of elf binaries
> -INSANE_SKIP_${PN} = "textrel"
> -
> -do_deploy() {
> -    # Copy the images to deploy directory
> -    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
> -}
> -addtask deploy after do_install
> diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> index 9cb8b64..e9d8057 100644
> --- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> +++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> @@ -1,3 +1,4 @@
> +SUMMARY = "SCP and MCP Firmware"
>  DESCRIPTION = "Firmware for SCP and MCP software reference implementation"
>  HOMEPAGE = "https://github.com/ARM-software/SCP-firmware"
>  
> @@ -17,4 +18,74 @@ SRCREV_scp    = "fd7c83561a7d76c7681d5d017fb23aa3664c028c"
>  SRCREV_cmsis  = "refs/tags/5.2.0"
>  SRCREV_FORMAT = "scp_cmsis"
>  
> -require scp-firmware.inc
> +PROVIDES += "virtual/control-processor-firmware"
> +
> +SCP_BUILD_RELEASE   ?= "1"
> +SCP_COMPILE_VERBOSE ?= "0"
> +SCP_PLATFORM        ?= "invalid"
> +SCP_COMPILER        ?= "arm-none-eabi"
> +SCP_LOG_LEVEL       ?= "WARN"
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
> +                LOG_LEVEL='${SCP_LOG_LEVEL}' \
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
> -- 
> 2.26.2
> 

> 

