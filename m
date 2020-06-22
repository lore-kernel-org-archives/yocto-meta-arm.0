Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.1242.1592844580716790902
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Jun 2020 09:49:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EC8A640BA1;
	Mon, 22 Jun 2020 16:49:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SXESIdyzYFz0; Mon, 22 Jun 2020 16:49:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 28FB1407DA;
	Mon, 22 Jun 2020 16:49:36 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3E7A7170C5B; Mon, 22 Jun 2020 12:49:36 -0400 (EDT)
Date: Mon, 22 Jun 2020 12:49:36 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Gabor Abonyi <gabor.abonyi@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH 4/6] arm: trusted-firmware-m: Add recipe
Message-ID: <20200622164936.GF17660@denix.org>
References: <20200622071401.2570-1-gabor.abonyi@arm.com>
 <20200622071401.2570-5-gabor.abonyi@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200622071401.2570-5-gabor.abonyi@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 22, 2020 at 09:13:59AM +0200, Gabor Abonyi wrote:
> Adds a recipe to pull down the trusted-firmware-m repository and the
> ones it depends on. The recipe can either use gcc-arm-none-eabi-native
> or armcompiler-native Clang toolchain to compile the firmware.
> 
> Change-Id: I37a4ba38982b5b1d387eccbb26bb5c79bddab0f7
> Signed-off-by: Gabor Abonyi <gabor.abonyi@arm.com>
> ---
>  meta-arm/conf/layer.conf                      |   1 +
>  .../trusted-firmware-m/trusted-firmware-m.inc | 118 ++++++++++++++++++
>  .../trusted-firmware-m_1.0.bb                 |  25 ++++
>  3 files changed, 144 insertions(+)
>  create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
>  create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
> 
> diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
> index 3341972..10a7951 100644
> --- a/meta-arm/conf/layer.conf
> +++ b/meta-arm/conf/layer.conf
> @@ -11,5 +11,6 @@ BBFILE_PRIORITY_meta-arm = "6"
>  
>  LAYERDEPENDS_meta-arm = " \
>      core \
> +    arm-toolchain \

This may be problematic...


>  "
>  LAYERSERIES_COMPAT_meta-arm = "warrior zeus dunfell"
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
> new file mode 100644
> index 0000000..a7c4319
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
> @@ -0,0 +1,118 @@
> +# SPDX-License-Identifier: MIT
> +#
> +# Copyright (c) 2020 Arm Limited
> +#
> +
> +SUMMARY = "Trusted Firmware for Cortex-M"
> +DESCRIPTION = "Trusted Firmware-M"
> +HOMEPAGE = "https://git.trustedfirmware.org/trusted-firmware-m.git"
> +PROVIDES = "virtual/trusted-firmware-m"
> +
> +inherit python3native cmake deploy
> +
> +TFM_DEPENDS ?= ""
> +DEPENDS += "${TFM_DEPENDS}"
> +DEPENDS += "python3-cryptography-native python3-pyasn1-native"
> +DEPENDS += "python3-jinja2-native python3-cbor-native python3-pyyaml-native"
> +
> +S = "${WORKDIR}/git/tfm"
> +# Sub-directory in which to build.
> +BUILD_DIR = "cmake_build"
> +B = "${S}/${BUILD_DIR}"
> +
> +COMPATIBLE_MACHINE ?= "invalid"
> +
> +# Build for debug (set TFA_DEBUG to 1 to activate)
> +TFM_DEBUG ?= "0"
> +# Set target config
> +TFM_CONFIG ?= "ConfigDefault.cmake"
> +# Platform must be set for each machine
> +TFM_PLATFORM ?= "invalid"
> +
> +# Uncomment, or copy these lines to your local.conf to use the Arm Clang compiler
> +# from meta-arm-toolchain.
> +# Please make sure to check the applicable license beforehand!
> +#LICENSE_FLAGS_WHITELIST = "commercial_armcompiler-native"
> +#TFM_COMPILER = "ARMCLANG"
> +# Uncomment the line below to use the license from your host machine:
> +#inherit armcompiler-host-license
> +# Otherwise you have to set and export the following variables manually.
> +# ARM_DS_DEFAULT_TOOLKIT_KEY, ARMLMD_LICENSE_FILE, LM_LICENSE_FILE
> +
> +# Setting GCC as the default TF-M compiler
> +TFM_COMPILER ?= "GNUARM"
> +DEPENDS += "${@'armcompiler-native' if d.getVar('TFM_COMPILER', True) == 'ARMCLANG' else 'gcc-arm-none-eabi-native'}"
> +
> +# Add platform parameters
> +EXTRA_OECMAKE += "-DTARGET_PLATFORM=${TFM_PLATFORM}"
> +
> +# Add compiler parameters
> +EXTRA_OECMAKE += "-DCOMPILER=${TFM_COMPILER}"
> +
> +# Handle TFM_DEBUG parameter
> +EXTRA_OECMAKE += "${@bb.utils.contains('TFM_DEBUG', '1', '-DCMAKE_BUILD_TYPE=Debug', '', d)}"
> +EXTRA_OECMAKE += "-DPROJ_CONFIG=${S}/configs/${TFM_CONFIG}"
> +
> +# Let the Makefile handle setting up the CFLAGS and LDFLAGS as it is a standalone application
> +CFLAGS[unexport] = "1"
> +LDFLAGS[unexport] = "1"
> +AS[unexport] = "1"
> +LD[unexport] = "1"
> +
> +# This is needed because CMSIS_5 source package originally has .pack extension not .zip
> +# and bitbake checks this dependency based on file extension
> +do_unpack[depends] += "unzip-native:do_populate_sysroot"
> +
> +do_configure[prefuncs] += "do_check_config"
> +do_check_config() {
> +    if [ ! -f "${S}/configs/${TFM_CONFIG}" ]; then
> +        bbfatal "Couldn't find config file '${TFM_CONFIG}' in '${S}/configs/'"
> +    fi
> +}
> +
> +do_configure() {
> +    cd ${S}
> +    python3 "tools/tfm_parse_manifest_list.py"
> +
> +    if [ ! -d "${B}" ]
> +    then
> +        install -d ${B}
> +    else
> +        rm -f ${B}/CMakeCache.txt
> +    fi
> +
> +    cd ${B}
> +    cmake -G"Unix Makefiles" --build ${S} ${EXTRA_OECMAKE}
> +}
> +
> +do_compile() {
> +    if [ -d "${B}" ]
> +    then
> +        oe_runmake -C ${B} install
> +    else
> +        bbfatal "TF-M CMake not generated!"
> +    fi
> +}
> +
> +do_install() {
> +    if [ ! -d "${B}/install/outputs" ]
> +    then
> +        bbfatal "Output not found in '${B}/install/outputs'!"
> +    fi
> +
> +    install -d -m 755 ${D}/firmware
> +    cd ${B}/install/outputs
> +    for dir in *;do
> +        install -D -p -m 0644 $dir/* -t ${D}/firmware/$dir/
> +    done
> +}
> +
> +FILES_${PN} = "/firmware"
> +SYSROOT_DIRS += "/firmware"
> +# Skip QA check for relocations in .text of elf binaries
> +INSANE_SKIP_${PN} = "textrel"
> +
> +addtask deploy after do_install
> +do_deploy() {
> +    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
> +}
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
> new file mode 100644
> index 0000000..5779c08
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
> @@ -0,0 +1,25 @@
> +# Trusted Firmware-M 1.0
> +
> +# TF-Mv1.0
> +SRCREV_tfm = "TF-Mv1.0"
> +LICENSE = "BSD-3-Clause & Apachev2"
> +
> +LIC_FILES_CHKSUM ?= "file://license.rst;md5=07f368487da347f3c7bd0fc3085f3afa"
> +LIC_FILES_CHKSUM += "file://../mbed-crypto/LICENSE;md5=302d50a6369f5f22efdb674db908167a"
> +LIC_FILES_CHKSUM += "file://../mbedtls/LICENSE;md5=302d50a6369f5f22efdb674db908167a"
> +LIC_FILES_CHKSUM += "file://../CMSIS_5/LICENSE.txt;md5=c4082b6c254c9fb71136710391d9728b"
> +
> +SRC_URI  = "git://git.trustedfirmware.org/trusted-firmware-m.git;protocol=https;branch=master;name=tfm;destsuffix=${S}"
> +SRC_URI += "git://github.com/ARMmbed/mbed-crypto.git;protocol=https;branch=development;name=mbed-crypto;destsuffix=${S}/../mbed-crypto"
> +SRC_URI += "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=mbedtls-2.7;name=mbedtls;destsuffix=${S}/../mbedtls"
> +SRC_URI += "https://github.com/ARM-software/CMSIS_5/releases/download/5.5.0/ARM.CMSIS.5.5.0.pack;name=cmsis;subdir=${S}/../CMSIS_5;downloadfilename=ARM.CMSIS.5.5.0.zip"
> +
> +SRC_URI[cmsis.md5sum] = "73b6cf6b4ab06ac099478e6cf983c08e"
> +SRC_URI[cmsis.sha256sum] = "fc6e46c77de29ed05ef3bfd4846a2da49b024bc8854c876ac053aaa8d348ac52"
> +
> +SRCREV_FORMAT ?= "tfm_mbed-crypto_mbedtls_cmsis"
> +SRCREV_mbed-crypto ?= "mbedcrypto-3.0.1"
> +SRCREV_mbedtls ?= "mbedtls-2.7.14"
> +SRCREV_cmsis ?= "5.5.0"
> +
> +require trusted-firmware-m.inc
> -- 
> 2.17.1
> 

> 

