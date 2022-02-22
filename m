Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17BD6C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 20:45:10 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.3082.1645562709123509154
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 22 Feb 2022 12:45:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0CA1440C2E;
	Tue, 22 Feb 2022 20:45:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UXr1tzere1aJ; Tue, 22 Feb 2022 20:45:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E4D8040951;
	Tue, 22 Feb 2022 20:45:06 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 28BCD174784; Tue, 22 Feb 2022 15:45:06 -0500 (EST)
Date: Tue, 22 Feb 2022 15:45:06 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] meta: update license names
Message-ID: <20220222204506.GR26229@denix.org>
References: <20220222140404.3526965-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220222140404.3526965-1-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 22 Feb 2022 20:45:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3040

On Tue, Feb 22, 2022 at 03:04:04PM +0100, Martin Jansa wrote:
> * openembedded-core/scripts/contrib/convert-spdx-licenses.py .
>   ...
>   All files processed with version 0.01
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bb         | 2 +-
>  meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.10.bb         | 2 +-
>  .../gcc-aarch64-none-elf_10.3-2021.07.bb                  | 2 +-
>  .../gcc-arm-none-eabi_10.3-2021.10.bb                     | 2 +-
>  .../recipes-devtools/external-arm-toolchain/license.inc   | 8 ++++----
>  meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3.inc  | 2 +-
>  meta-arm/recipes-bsp/hafnium/hafnium_2.6.bb               | 2 +-
>  .../trusted-firmware-m/trusted-firmware-m_1.5.0.bb        | 2 +-
>  meta-arm/recipes-devtools/fvp/fvp-common.inc              | 2 +-
>  .../recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb   | 2 +-
>  .../recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb   | 2 +-
>  meta-arm/recipes-kernel/linux/linux-arm64-ack.inc         | 2 +-
>  meta-arm/recipes-security/optee/optee-test.inc            | 2 +-
>  meta-gem5/recipes-devtools/gem5/gem5-native.inc           | 2 +-
>  14 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bb b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bb
> index 4dc4a2f..cf6b07f 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bb
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bb
> @@ -6,7 +6,7 @@ application code."
>  SECTION = "bootloaders"
>  DEPENDS += "flex-native bison-native"
>  
> -LICENSE = "GPLv2+"
> +LICENSE = "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM = "file://Licenses/README;md5=30503fd321432fc713238f582193b78e"
>  PE = "1"
>  
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.10.bb b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.10.bb
> index 2d3e95a..d117a88 100644
> --- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.10.bb
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.10.bb
> @@ -6,7 +6,7 @@ application code."
>  SECTION = "bootloaders"
>  DEPENDS += "flex-native bison-native"
>  
> -LICENSE = "GPLv2+"
> +LICENSE = "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
>  PE = "1"
>  
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.3-2021.07.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.3-2021.07.bb
> index c1758a3..02b5b43 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.3-2021.07.bb
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_10.3-2021.07.bb
> @@ -6,7 +6,7 @@ require arm-binary-toolchain.inc
>  COMPATIBLE_HOST = "(x86_64|aarch64).*-linux"
>  
>  SUMMARY = "Baremetal GCC for Aarch64 processors"
> -LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> +LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only"
>  
>  LIC_FILES_CHKSUM = "${@d.getVar(d.expand("LIC_FILES_CHKSUM_${HOST_ARCH}"))}"
>  LIC_FILES_CHKSUM:aarch64 = "file://share/doc/gcc/Copying.html;md5=d06ace534ed0851debcb7140c5b5116e"
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_10.3-2021.10.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_10.3-2021.10.bb
> index 4100372..ad7e816 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_10.3-2021.10.bb
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_10.3-2021.10.bb
> @@ -6,7 +6,7 @@ require arm-binary-toolchain.inc
>  COMPATIBLE_HOST = "(x86_64|aarch64).*-linux"
>  
>  SUMMARY = "Baremetal GCC for ARM-R and ARM-M processors"
> -LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> +LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only"
>  
>  LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=c18349634b740b7b95f2c2159af888f5"
>  
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
> index 67daa41..10f2542 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
> @@ -1,4 +1,4 @@
> -LICENSE = "GPL-3.0-with-GCC-exception & GPLv3 & GPLv2 & LGPLv3 & LGPLv2.1 & LGPLv2"
> +LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only & GPL-2.0-only & LGPL-3.0-only & LGPL-2.1-only & LGPL-2.0-only"
>  
>  EAT_BFD_LICENSE = "GPL-3.0"
>  EAT_GCC_LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"

You've missed an entire section here with per-package licenses:

EAT_BFD_LICENSE = "GPL-3.0"
EAT_GCC_LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
EAT_GDB_LICENSE = "GPL-3.0"
EAT_LIBC_LICENSE = "GPLv2 & LGPLv2.1"
EAT_RLE_LICENSE = "GPL-3.0-with-GCC-exception"

At least EAT_GCC_LICENSE and EAT_LIBC_LICENSE need to be updated too.


> @@ -73,7 +73,7 @@ LICENSE:libubsan-dev = "${EAT_GCC_LICENSE}"
>  LICENSE:libubsan = "${EAT_GCC_LICENSE}"
>  LICENSE:libubsan-staticdev = "${EAT_GCC_LICENSE}"
>  
> -LICENSE:linux-libc-headers-dev = "GPLv2"
> -LICENSE:linux-libc-headers = "GPLv2"
> +LICENSE:linux-libc-headers-dev = "GPL-2.0-only"
> +LICENSE:linux-libc-headers = "GPL-2.0-only"
>  
> -LICENSE:gdbserver = "GPLv2 & GPLv3 & LGPLv2 & LGPLv3"
> +LICENSE:gdbserver = "GPL-2.0-only & GPL-3.0-only & LGPL-2.0-only & LGPL-3.0-only"
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3.inc b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3.inc
> index 19eb31b..20e6d3e 100644
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3.inc
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-10.3.inc
> @@ -18,7 +18,7 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-arm-${ARM_GCC_VERSION}:${FILE_DIRNAME}/g
>  DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
>  NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native"
>  
> -LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> +LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only"
>  
>  LIC_FILES_CHKSUM = "\
>      file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
> diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.6.bb b/meta-arm/recipes-bsp/hafnium/hafnium_2.6.bb
> index 0452272..96e455f 100644
> --- a/meta-arm/recipes-bsp/hafnium/hafnium_2.6.bb
> +++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.6.bb
> @@ -2,7 +2,7 @@ SUMMARY = "Hafnium"
>  DESCRIPTION = "A reference Secure Partition Manager (SPM) for systems that implement the Armv8.4-A Secure-EL2 extension"
>  DEPENDS = "gn-native ninja-native bison-native bc-native dtc-native openssl-native"
>  
> -LICENSE = "BSD-3-Clause & GPLv2"
> +LICENSE = "BSD-3-Clause & GPL-2.0-only"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=782b40c14bad5294672c500501edc103"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.5.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.5.0.bb
> index 619162b..8a1c8cc 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.5.0.bb
> +++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.5.0.bb
> @@ -8,7 +8,7 @@ DESCRIPTION = "Trusted Firmware-M"
>  HOMEPAGE = "https://git.trustedfirmware.org/trusted-firmware-m.git"
>  PROVIDES = "virtual/trusted-firmware-m"
>  
> -LICENSE = "BSD-3-Clause & Apachev2"
> +LICENSE = "BSD-3-Clause & Apache-2.0"
>  
>  LIC_FILES_CHKSUM = "file://license.rst;md5=07f368487da347f3c7bd0fc3085f3afa \
>                      file://../tf-m-tests/license.rst;md5=02d06ffb8d9f099ff4961c0cb0183a18 \
> diff --git a/meta-arm/recipes-devtools/fvp/fvp-common.inc b/meta-arm/recipes-devtools/fvp/fvp-common.inc
> index 3070c73..e9978c1 100644
> --- a/meta-arm/recipes-devtools/fvp/fvp-common.inc
> +++ b/meta-arm/recipes-devtools/fvp/fvp-common.inc
> @@ -4,7 +4,7 @@ HOMEPAGE = "https://developer.arm.com/tools-and-software/simulation-models/fixed
>  # LICENSE_FLAGS_ACCEPTED if you agree to these terms.
>  LICENSE_FLAGS = "Arm-FVP-EULA"
>  
> -LICENSE = "Proprietary & Apache-2.0 & Python-2.0 & GPL-3.0-with-GCC-exception & Zlib & NCSA & LGPLv2+ & MIT & BSD-3-Clause"
> +LICENSE = "Proprietary & Apache-2.0 & Python-2.0 & GPL-3.0-with-GCC-exception & Zlib & NCSA & LGPL-2.0-or-later & MIT & BSD-3-Clause"
>  
>  COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
>  FVP_ARCH = "Linux64_GCC-6.4"
> diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb
> index 91b7d64..492d321 100644
> --- a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb
> +++ b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb
> @@ -8,7 +8,7 @@ HOMEPAGE = "https://github.com/ARM-software/gator"
>  # configuration requirement specified here:
>  # https://github.com/ARM-software/gator#kernel-configuration
>  
> -LICENSE = "GPLv2 & LGPLv2.1+ & Apache-2.0"
> +LICENSE = "GPL-2.0-only & LGPL-2.1-or-later & Apache-2.0"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>                      file://libsensors/COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c \
>                      file://mxml/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327 \
> diff --git a/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb b/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
> index 03ce013..4051c34 100644
> --- a/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
> +++ b/meta-arm/recipes-kernel/ffa-debugfs/ffa-debugfs-mod_2.1.0.bb
> @@ -1,7 +1,7 @@
>  SUMMARY = "FF-A Debugfs Linux kernel module"
>  DESCRIPTION = "This out-of-tree kernel module exposes FF-A operations to user space \
>  used for development purposes"
> -LICENSE = "GPLv2"
> +LICENSE = "GPL-2.0-only"
>  LIC_FILES_CHKSUM = "file://arm_ffa_user.c;beginline=1;endline=1;md5=fcab174c20ea2e2bc0be64b493708266"
>  
>  SRC_URI = "git://git.gitlab.arm.com/linux-arm/linux-trusted-services.git;branch=main;protocol=https"
> diff --git a/meta-arm/recipes-kernel/linux/linux-arm64-ack.inc b/meta-arm/recipes-kernel/linux/linux-arm64-ack.inc
> index 261e08b..6266c80 100644
> --- a/meta-arm/recipes-kernel/linux/linux-arm64-ack.inc
> +++ b/meta-arm/recipes-kernel/linux/linux-arm64-ack.inc
> @@ -5,7 +5,7 @@
>  
>  DESCRIPTION = "Linux Android Common Kernel"
>  SECTION = "kernel"
> -LICENSE = "GPLv2"
> +LICENSE = "GPL-2.0-only"
>  LIC_FILES_CHKSUM = "file://${S}/COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
>  
>  require recipes-kernel/linux/linux-yocto.inc
> diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-arm/recipes-security/optee/optee-test.inc
> index 94cf46f..aada243 100644
> --- a/meta-arm/recipes-security/optee/optee-test.inc
> +++ b/meta-arm/recipes-security/optee/optee-test.inc
> @@ -2,7 +2,7 @@ SUMMARY = "OP-TEE sanity testsuite"
>  DESCRIPTION = "Open Portable Trusted Execution Environment - Test suite"
>  HOMEPAGE = "https://www.op-tee.org/"
>  
> -LICENSE = "BSD-2-Clause & GPLv2"
> +LICENSE = "BSD-2-Clause & GPL-2.0-only"
>  LIC_FILES_CHKSUM = "file://${S}/LICENSE.md;md5=daa2bcccc666345ab8940aab1315a4fa"
>  
>  inherit python3native ptest
> diff --git a/meta-gem5/recipes-devtools/gem5/gem5-native.inc b/meta-gem5/recipes-devtools/gem5/gem5-native.inc
> index 9c07aad..91a554b 100644
> --- a/meta-gem5/recipes-devtools/gem5/gem5-native.inc
> +++ b/meta-gem5/recipes-devtools/gem5/gem5-native.inc
> @@ -2,7 +2,7 @@
>  
>  SUMMARY = "A modular platform for computer-system architecture research"
>  HOMEPAGE = "http://gem5.org"
> -LICENSE = "BSD-3-Clause & MIT & LGPLv2.1"
> +LICENSE = "BSD-3-Clause & MIT & LGPL-2.1-only"
>  
>  # Gem5 build and run parameter
>  
> -- 
> 2.35.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

