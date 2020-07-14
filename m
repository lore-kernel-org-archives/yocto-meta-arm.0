Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web10.3409.1594752940899462919
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jul 2020 11:55:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=KNaXHQl8;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.65, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f65.google.com with SMTP id u8so7975434qvj.12
        for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jul 2020 11:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=usd8SCTDXnOP3wFImuvoBa4qajmBLDhOa2knVkR8b+w=;
        b=KNaXHQl8CzoMlja0kI6m6GdLw+x11n9KRqX9B89De+6x55QCib2DV6Rpk5E3Vlwzf/
         tTeol+t21GoKrwrAIcLn6L4bcWmeaiynYRX+F6JbWLXN0lO0MBzPxCzt9QakQjqLpQ17
         CSGAE7jMzzdqZqO3OaVs1VKT248Sxi6MCWOVD8KrYpVpqu+vb3TCy2xOABxY/8kUFKZm
         NhpoAvxtszLrGgA9cPqYWGwm02kzGARI9SEzo7x3rbTGASwNlGP0nR0UVxPvvGpyt9Ns
         ElIXdod2Rz3HFwfkuQ5pIZjAzwthY1/9Qn8cWrm27phLMnOKCYIoG9Wz4dym0mJxZHv4
         A6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=usd8SCTDXnOP3wFImuvoBa4qajmBLDhOa2knVkR8b+w=;
        b=KqY7zz0fXUe7UM6uzxyhebyFc32ms6ptPHi9HZ2vR9gqtKerIvwwtr/69HB9bHnhpA
         ENssB3tusvoM108Ka6CSq2nxXgLpNALLr0vA4PAnxULvseQrQL/ktSPYJVHQ720sf4R/
         qyBBEME7w9mviBYu4NvNMht4c23Xz4gCbczm/MEEwqJC6g34EcnXIlOU9myCbCRqQUcU
         50Psi5bM/TRj0Nr+83hf2aNa5MeTeslq3523vkLFH27b+0x7lIRj/ss6D0q3ky4haCKG
         ifP5u0JjwFc5n4lzoPnmsWX38VBz2EoRdIrdH+yKSAst0GSg9BuxkRNyaUCtpbhVzi4J
         t9zw==
X-Gm-Message-State: AOAM532DB/5aRodRKjbrQpZLbV/nx+4kEux9F5Obz7jdAyy7MZ3NZsAl
	/EiVS12rYv5LcuXcc54GHvglTPi+zpBNtw==
X-Google-Smtp-Source: ABdhPJyoSx3vsNBYydb0XMovb547LrQjnWRJqxXpQRuauE2aHLE4vIv9saFAQxoT8I0B3ItCL3huVQ==
X-Received: by 2002:a0c:9ae2:: with SMTP id k34mr5901462qvf.247.1594752939891;
        Tue, 14 Jul 2020 11:55:39 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:d523:4dcb:5d9f:3d2])
        by smtp.gmail.com with ESMTPSA id p19sm22278420qkm.75.2020.07.14.11.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 11:55:39 -0700 (PDT)
Date: Tue, 14 Jul 2020 14:55:37 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/2] arm/edk2-firmware: merge the .bb/.inc files
Message-ID: <20200714185536.GC17632@kudzu.us>
References: <20200713104804.174263-1-ross@burtonini.com>
MIME-Version: 1.0
In-Reply-To: <20200713104804.174263-1-ross@burtonini.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 13, 2020 at 11:48:03AM +0100, Ross Burton wrote:
> From: Ross Burton <ross.burton@arm.com>
> 
> There is no reason to split this recipe between two files, so merge them.
> 
> Change-Id: I130cfb0ef78baa3117d5683d4732bc9b86798869
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Both patches pulled into master.

Thanks,
Jon

> ---
>  meta-arm/recipes-bsp/uefi/edk2-firmware.inc   | 84 -------------------
>  .../recipes-bsp/uefi/edk2-firmware_git.bb     | 84 ++++++++++++++++++-
>  2 files changed, 83 insertions(+), 85 deletions(-)
>  delete mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> 
> diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> deleted file mode 100644
> index 6696768..0000000
> --- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> +++ /dev/null
> @@ -1,84 +0,0 @@
> -SUMMARY = "UEFI EDK2 Firmware"
> -
> -PROVIDES += "virtual/uefi-firmware"
> -
> -EDK2_BUILD_RELEASE   ?= "0"
> -EDK2_PLATFORM        ?= "invalid"
> -EDK2_PLATFORM_DSC    ?= ""
> -EDK2_BIN_NAME        ?= ""
> -EDK2_ARCH            ?= ""
> -
> -EDK2_BUILD_MODE = "${@bb.utils.contains('EDK2_BUILD_RELEASE', '1', 'RELEASE', 'DEBUG', d)}"
> -
> -DEPENDS += "util-linux-native iasl-native"
> -
> -inherit python3native
> -inherit deploy
> -
> -B = "${WORKDIR}/build"
> -S = "${WORKDIR}/git"
> -
> -COMPATIBLE_MACHINE ?= "invalid"
> -
> -LDFLAGS[unexport] = "1"
> -
> -# No configure
> -do_configure[noexec] = "1"
> -
> -# Set variables as per envsetup
> -export GCC5_AARCH64_PREFIX = "${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}"
> -export PACKAGES_PATH       = "${S}/edk2:${S}/edk2/edk2-platforms"
> -export WORKSPACE           = "${S}/edk2"
> -export EDK_TOOLS_PATH      = "${WORKSPACE}/BaseTools"
> -export PYTHON_COMMAND      = "${PYTHON}"
> -export CONF_PATH           = "${WORKSPACE}/Conf"
> -
> -export BTOOLS_PATH = "${EDK_TOOLS_PATH}/BinWrappers/PosixLike"
> -
> -python __anonymous() {
> -    # If GCC Version is greater than 4 then pass GCC5
> -    # set GCC5 by default
> -    d.setVar('GCC_VER', 'GCC5')
> -
> -    # Otherwise pass the corresponding version
> -    G = d.getVar('GCCVERSION',True).split(".")
> -    gcc_vlist = ['1', '2', '3', '4']
> -    if G[0] in gcc_vlist:
> -        d.setVar('GCC_VER', 'GCC'+G[0])
> -}
> -
> -do_compile() {
> -    sed -i -e 's:-I \.\.:-I \.\. ${BUILD_CFLAGS} :' ${EDK_TOOLS_PATH}/Source/C/Makefiles/header.makefile
> -    sed -i -e 's: -luuid: -luuid ${BUILD_LDFLAGS}:g' ${EDK_TOOLS_PATH}/Source/C/*/GNUmakefile
> -
> -    # Copy the templates as we don't run envsetup
> -    cp ${EDK_TOOLS_PATH}/Conf/build_rule.template ${WORKSPACE}/Conf/build_rule.txt
> -    cp ${EDK_TOOLS_PATH}/Conf/tools_def.template ${WORKSPACE}/Conf/tools_def.txt
> -    cp ${EDK_TOOLS_PATH}/Conf/target.template ${WORKSPACE}/Conf/target.txt
> -
> -    # Build basetools
> -    oe_runmake -C ${S}/edk2/BaseTools
> -
> -    PATH="${WORKSPACE}:${BTOOLS_PATH}:$PATH" \
> -    "${S}/edk2/BaseTools/BinWrappers/PosixLike/build" \
> -       -a "${EDK2_ARCH}" \
> -       -b ${EDK2_BUILD_MODE} \
> -       -t ${GCC_VER} \
> -       -p "${S}/edk2/edk2-platforms/Platform/ARM/${EDK2_PLATFORM_DSC}"
> -}
> -
> -do_install() {
> -    install -d ${D}/firmware
> -    install "${S}/edk2/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${GCC_VER}/FV/${EDK2_BIN_NAME}" "${D}/firmware/uefi.bin"
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
> diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb b/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
> index 4aadc3c..350af79 100644
> --- a/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
> +++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
> @@ -1,8 +1,11 @@
> +SUMMARY = "UEFI EDK2 Firmware"
>  DESCRIPTION = "UEFI EDK2 Firmware for Arm reference platforms"
>  HOMEPAGE = "https://github.com/tianocore/edk2"
>  
>  LICENSE = "BSD-2-Clause-Patent"
>  
> +PROVIDES += "virtual/uefi-firmware"
> +
>  # EDK2
>  LIC_FILES_CHKSUM = "file://edk2/License.txt;md5=2b415520383f7964e96700ae12b4570a"
>  # EDK2 Platforms
> @@ -16,4 +19,83 @@ SRCREV_edk2           ?= "6ff7c838d09224dd4e4c9b5b93152d8db1b19740"
>  SRCREV_edk2-platforms ?= "ed4cc8059ec551032f0d8b8c172e9ec19214a638"
>  SRCREV_FORMAT         = "edk2_edk2-platforms"
>  
> -require edk2-firmware.inc
> +EDK2_BUILD_RELEASE   ?= "0"
> +EDK2_PLATFORM        ?= "invalid"
> +EDK2_PLATFORM_DSC    ?= ""
> +EDK2_BIN_NAME        ?= ""
> +EDK2_ARCH            ?= ""
> +
> +EDK2_BUILD_MODE = "${@bb.utils.contains('EDK2_BUILD_RELEASE', '1', 'RELEASE', 'DEBUG', d)}"
> +
> +DEPENDS += "util-linux-native iasl-native"
> +
> +inherit python3native
> +inherit deploy
> +
> +B = "${WORKDIR}/build"
> +S = "${WORKDIR}/git"
> +
> +COMPATIBLE_MACHINE ?= "invalid"
> +
> +LDFLAGS[unexport] = "1"
> +
> +# No configure
> +do_configure[noexec] = "1"
> +
> +# Set variables as per envsetup
> +export GCC5_AARCH64_PREFIX = "${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}"
> +export PACKAGES_PATH       = "${S}/edk2:${S}/edk2/edk2-platforms"
> +export WORKSPACE           = "${S}/edk2"
> +export EDK_TOOLS_PATH      = "${WORKSPACE}/BaseTools"
> +export PYTHON_COMMAND      = "${PYTHON}"
> +export CONF_PATH           = "${WORKSPACE}/Conf"
> +
> +export BTOOLS_PATH = "${EDK_TOOLS_PATH}/BinWrappers/PosixLike"
> +
> +python __anonymous() {
> +    # If GCC Version is greater than 4 then pass GCC5
> +    # set GCC5 by default
> +    d.setVar('GCC_VER', 'GCC5')
> +
> +    # Otherwise pass the corresponding version
> +    G = d.getVar('GCCVERSION',True).split(".")
> +    gcc_vlist = ['1', '2', '3', '4']
> +    if G[0] in gcc_vlist:
> +        d.setVar('GCC_VER', 'GCC'+G[0])
> +}
> +
> +do_compile() {
> +    sed -i -e 's:-I \.\.:-I \.\. ${BUILD_CFLAGS} :' ${EDK_TOOLS_PATH}/Source/C/Makefiles/header.makefile
> +    sed -i -e 's: -luuid: -luuid ${BUILD_LDFLAGS}:g' ${EDK_TOOLS_PATH}/Source/C/*/GNUmakefile
> +
> +    # Copy the templates as we don't run envsetup
> +    cp ${EDK_TOOLS_PATH}/Conf/build_rule.template ${WORKSPACE}/Conf/build_rule.txt
> +    cp ${EDK_TOOLS_PATH}/Conf/tools_def.template ${WORKSPACE}/Conf/tools_def.txt
> +    cp ${EDK_TOOLS_PATH}/Conf/target.template ${WORKSPACE}/Conf/target.txt
> +
> +    # Build basetools
> +    oe_runmake -C ${S}/edk2/BaseTools
> +
> +    PATH="${WORKSPACE}:${BTOOLS_PATH}:$PATH" \
> +    "${S}/edk2/BaseTools/BinWrappers/PosixLike/build" \
> +       -a "${EDK2_ARCH}" \
> +       -b ${EDK2_BUILD_MODE} \
> +       -t ${GCC_VER} \
> +       -p "${S}/edk2/edk2-platforms/Platform/ARM/${EDK2_PLATFORM_DSC}"
> +}
> +
> +do_install() {
> +    install -d ${D}/firmware
> +    install "${S}/edk2/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${GCC_VER}/FV/${EDK2_BIN_NAME}" "${D}/firmware/uefi.bin"
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

