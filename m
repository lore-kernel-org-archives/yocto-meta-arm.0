Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27A65C531DC
	for <webhook@archiver.kernel.org>; Fri, 16 Aug 2024 19:25:27 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.156101.1723836323256456060
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 16 Aug 2024 12:25:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0AA4740C81;
	Fri, 16 Aug 2024 19:25:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SlD8fVbYXQxM; Fri, 16 Aug 2024 19:25:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E001B40C61;
	Fri, 16 Aug 2024 19:25:20 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3327A16405E; Fri, 16 Aug 2024 15:25:20 -0400 (EDT)
Date: Fri, 16 Aug 2024 15:25:20 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Jon Mason <jon.mason@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/6] arm/trusted-firmware-a: add support for
 2.11.0
Message-ID: <20240816192520.GW17572@denix.org>
References: <20240604180949.15501-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604180949.15501-1-jon.mason@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 16 Aug 2024 19:25:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5964

On Tue, Jun 04, 2024 at 02:09:44PM -0400, Jon Mason wrote:
> Add support for tf-a version v2.11.0 and mbedtls 3.6.0.  Modifications
> to the license checksum were necessary due to the addition to that file
> for DICE (which is Apache 2.0 licensed) for TF-A and the dual license of
> mbedtls (Apache 2.0 and addition of GPLv2).

In which case the LICENSE being set in the common .inc is incorrect:

LICENSE = "BSD-3-Clause & MIT"

And mbedtls conditionally adds Apache 2.0, but not GPLv2.


> NOTE: FVP base is having (more of) an issue with CI on the newest TF-A,
> with SSH tests timing out.  Holding that back to the LTS version until
> it cane be resolved.
> 
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  meta-arm-bsp/conf/machine/fvp-base.conf       |  3 +-
>  .../fiptool-native_2.11.0.bb                  | 33 +++++++++++
>  .../trusted-firmware-a/tf-a-tests_2.11.0.bb   | 58 +++++++++++++++++++
>  .../trusted-firmware-a_2.11.0.bb              | 19 ++++++
>  4 files changed, 112 insertions(+), 1 deletion(-)
>  create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.11.0.bb
>  create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.11.0.bb
>  create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.11.0.bb
> 
> diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/machine/fvp-base.conf
> index 17fb5023ccc5..24d03e7124af 100644
> --- a/meta-arm-bsp/conf/machine/fvp-base.conf
> +++ b/meta-arm-bsp/conf/machine/fvp-base.conf
> @@ -9,6 +9,7 @@ require conf/machine/include/arm/arch-armv8-4a.inc
>  ARM_SYSTEMREADY_FIRMWARE = "trusted-firmware-a:do_deploy"
>  ARM_SYSTEMREADY_ACS_CONSOLE = "default"
>  EXTRA_IMAGEDEPENDS = "${ARM_SYSTEMREADY_FIRMWARE}"
> +PREFERRED_VERSION_trusted-firmware-a ?= "2.10.%"
>  
>  MACHINE_FEATURES = "efi"
>  
> @@ -62,4 +63,4 @@ FVP_TERMINALS[bp.terminal_0] ?= "Console"
>  FVP_TERMINALS[bp.terminal_1] ?= ""
>  FVP_TERMINALS[bp.terminal_2] ?= ""
>  FVP_TERMINALS[bp.terminal_3] ?= ""
> -FVP_CONFIG[bp.secure_memory] ?= "1"
> \ No newline at end of file
> +FVP_CONFIG[bp.secure_memory] ?= "1"
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.11.0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.11.0.bb
> new file mode 100644
> index 000000000000..47e783a892c8
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.11.0.bb
> @@ -0,0 +1,33 @@
> +# Firmware Image Package (FIP)
> +# It is a packaging format used by TF-A to package the
> +# firmware images in a single binary.
> +
> +DESCRIPTION = "fiptool - Trusted Firmware tool for packaging"
> +LICENSE = "BSD-3-Clause"
> +
> +SRC_URI_TRUSTED_FIRMWARE_A ?= "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https"
> +SRC_URI = "${SRC_URI_TRUSTED_FIRMWARE_A};destsuffix=fiptool-${PV};branch=${SRCBRANCH}"
> +LIC_FILES_CHKSUM = "file://docs/license.rst;md5=b5fbfdeb6855162dded31fadcd5d4dc5"
> +
> +# Use fiptool from TF-A v2.11.0
> +SRCREV = "f2735ebccf5173f74c0458736ec526276106097e"
> +SRCBRANCH = "master"
> +
> +DEPENDS += "openssl-native"
> +
> +inherit native
> +
> +EXTRA_OEMAKE = "V=1 HOSTCC='${BUILD_CC}' OPENSSL_DIR=${STAGING_DIR_NATIVE}/${prefix_native}"
> +
> +do_compile () {
> +    # This is still needed to have the native fiptool executing properly by
> +    # setting the RPATH
> +    sed -i '/^LDOPTS/ s,$, \$\{BUILD_LDFLAGS},' ${S}/tools/fiptool/Makefile
> +    sed -i '/^INCLUDE_PATHS/ s,$, \$\{BUILD_CFLAGS},' ${S}/tools/fiptool/Makefile
> +
> +    oe_runmake fiptool
> +}
> +
> +do_install () {
> +    install -D -p -m 0755 tools/fiptool/fiptool ${D}${bindir}/fiptool
> +}
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.11.0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.11.0.bb
> new file mode 100644
> index 000000000000..02f03f3b00cf
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.11.0.bb
> @@ -0,0 +1,58 @@
> +DESCRIPTION = "Trusted Firmware-A tests(aka TFTF)"
> +LICENSE = "BSD-3-Clause & NCSA"
> +
> +LIC_FILES_CHKSUM += "file://docs/license.rst;md5=6175cc0aa2e63b6d21a32aa0ee7d1b4a"
> +
> +inherit deploy
> +
> +COMPATIBLE_MACHINE ?= "invalid"
> +
> +SRC_URI_TRUSTED_FIRMWARE_A_TESTS ?= "git://git.trustedfirmware.org/TF-A/tf-a-tests.git;protocol=https"
> +SRC_URI = "${SRC_URI_TRUSTED_FIRMWARE_A_TESTS};branch=${SRCBRANCH} \
> +          "
> +SRCBRANCH = "master"
> +SRCREV = "fd053b75cde9c2aa1a5b979a2b544890510d4f52"
> +
> +DEPENDS += "optee-os"
> +
> +EXTRA_OEMAKE += "USE_NVM=0"
> +EXTRA_OEMAKE += "SHELL_COLOR=1"
> +EXTRA_OEMAKE += "DEBUG=1"
> +
> +# Modify mode based on debug or release mode
> +TFTF_MODE ?= "debug"
> +
> +# Platform must be set for each machine
> +TFA_PLATFORM ?= "invalid"
> +
> +EXTRA_OEMAKE += "ARCH=aarch64"
> +EXTRA_OEMAKE += "LOG_LEVEL=50"
> +
> +S = "${WORKDIR}/git"
> +B = "${WORKDIR}/build"
> +
> +# Add platform parameter
> +EXTRA_OEMAKE += "BUILD_BASE=${B} PLAT=${TFA_PLATFORM}"
> +
> +# Requires CROSS_COMPILE set by hand as there is no configure script
> +export CROSS_COMPILE="${TARGET_PREFIX}"
> +
> +LDFLAGS[unexport] = "1"
> +do_compile() {
> +    oe_runmake -C ${S} tftf
> +}
> +
> +do_compile[cleandirs] = "${B}"
> +
> +FILES:${PN} = "/firmware/tftf.bin"
> +SYSROOT_DIRS += "/firmware"
> +
> +do_install() {
> +    install -d -m 755 ${D}/firmware
> +    install -m 0644 ${B}/${TFA_PLATFORM}/${TFTF_MODE}/tftf.bin ${D}/firmware/tftf.bin
> +}
> +
> +do_deploy() {
> +    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
> +}
> +addtask deploy after do_install
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.11.0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.11.0.bb
> new file mode 100644
> index 000000000000..27cdfc0953f3
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.11.0.bb
> @@ -0,0 +1,19 @@
> +require recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> +
> +# TF-A v2.11.0
> +SRCREV_tfa = "f2735ebccf5173f74c0458736ec526276106097e"
> +SRCBRANCH = "master"
> +
> +LIC_FILES_CHKSUM += "file://docs/license.rst;md5=b5fbfdeb6855162dded31fadcd5d4dc5"
> +
> +# in TF-A src, docs/getting_started/prerequisites.rst lists the expected version mbedtls
> +# mbedtls-3.6.0
> +SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls;branch=master"
> +SRCREV_mbedtls = "2ca6c285a0dd3f33982dd57299012dacab1ff206"
> +
> +LIC_FILES_CHKSUM_MBEDTLS = "file://mbedtls/LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
> +
> +# continue to boot also without TPM
> +SRC_URI += "\
> +    file://0001-qemu_measured_boot.c-ignore-TPM-error-and-continue-w.patch \
> +"
> -- 
> 2.39.3 (Apple Git-146)
> 

