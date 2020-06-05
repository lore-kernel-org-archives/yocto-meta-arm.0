Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.821.1591394582001325336
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 05 Jun 2020 15:03:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 21EBA40C36;
	Fri,  5 Jun 2020 22:03:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DaeG4ywOS4zC; Fri,  5 Jun 2020 22:03:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C758140AD5;
	Fri,  5 Jun 2020 22:02:59 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6E7AB173209; Fri,  5 Jun 2020 18:02:58 -0400 (EDT)
Date: Fri, 5 Jun 2020 18:02:58 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH v3] arm-toolchain: merge binary toolchain recipes
Message-ID: <20200605220258.GN17660@denix.org>
References: <20200602121155.25094-1-jdmason@kudzu.us>
MIME-Version: 1.0
In-Reply-To: <20200602121155.25094-1-jdmason@kudzu.us>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 02, 2020 at 08:11:55AM -0400, Jon Mason wrote:
> Merge the majority of the binary toolchain recipes for building on an
> x86 host into a common include file.
> 
> Also, found and fixed an error with both install commands where the name
> was double nested on the copy.  For example,
> /usr/share/arm-none-eabi/arm-none-eabi/ due to the way it was being
> copied.
> 
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> ---

Changes in v3?

>  .../gcc-aarch64-none-elf_9.2-2019.12.bb       | 27 ++-----------------
>  .../gcc-arm-none-eabi_9-2019-q4-major.bb      | 27 ++-----------------
>  .../external-arm-toolchain/gcc-x86host.inc    | 24 +++++++++++++++++
>  3 files changed, 28 insertions(+), 50 deletions(-)
>  create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-x86host.inc
> 
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
> index 2ec0f9c..1e4689c 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
> @@ -1,6 +1,8 @@
>  # Copyright (C) 2020 Texas Instruments Inc.
>  # Released under the MIT license (see COPYING.MIT for the terms)
>  
> +require gcc-x86host.inc
> +
>  SUMMARY = "Baremetal GCC for Aarch64 processors"
>  LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
>  
> @@ -11,28 +13,3 @@ PROVIDES = "virtual/aarch64-none-elf-gcc"
>  SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/binrel/gcc-arm-${PV}-x86_64-aarch64-none-elf.tar.xz"
>  
>  SRC_URI[sha256sum] = "36d2cbe7c2984f2c20f562ac2f3ba524c59151adfa8ee10f1326c88de337b6d1"
> -
> -S = "${WORKDIR}/gcc-arm-${PV}-x86_64-aarch64-none-elf"

^^^
I see you dropped setting ${S} completely in the .inc - have you tried 
gcc-aarch64-none-elf recipe, as default ${S} won't work from the first look


> -COMPATIBLE_HOST = "x86_64.*-linux"
> -
> -do_install() {
> -    install -d ${D}${datadir}/aarch64-none-elf/
> -    cp -r ${S}/. ${D}${datadir}/aarch64-none-elf/
> -
> -    install -d ${D}${bindir}
> -    # Symlink all executables into bindir
> -    for f in ${D}${datadir}/aarch64-none-elf/bin/aarch64-none-elf-*; do
> -        lnr $f ${D}${bindir}/$(basename $f)
> -    done
> -}
> -
> -FILES_${PN} = "${datadir} ${bindir}"
> -
> -INSANE_SKIP_${PN} = "already-stripped libdir staticdev file-rdeps"
> -
> -INHIBIT_SYSROOT_STRIP = "1"
> -INHIBIT_PACKAGE_STRIP = "1"
> -INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
> index 84f6dba..a36f0aa 100644
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
> @@ -1,6 +1,8 @@
>  # Copyright (C) 2019 Garmin Ltd. or its subsidiaries
>  # Released under the MIT license (see COPYING.MIT for the terms)
>  
> +require gcc-x86host.inc
> +
>  SUMMARY = "Baremetal GCC for ARM-R and ARM-M processors"
>  LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
>  
> @@ -12,28 +14,3 @@ SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/${B
>  
>  SRC_URI[md5sum] = "fe0029de4f4ec43cf7008944e34ff8cc"
>  SRC_URI[sha256sum] = "bcd840f839d5bf49279638e9f67890b2ef3a7c9c7a9b25271e83ec4ff41d177a"
> -
> -S = "${WORKDIR}/${BPN}-${PV}"
> -
> -COMPATIBLE_HOST = "x86_64.*-linux"
> -
> -do_install() {
> -    install -d ${D}${datadir}/arm-none-eabi/
> -    cp -r ${S}/. ${D}${datadir}/arm-none-eabi/
> -
> -    install -d ${D}${bindir}
> -    # Symlink all executables into bindir
> -    for f in ${D}${datadir}/arm-none-eabi/bin/arm-none-eabi-*; do
> -        lnr $f ${D}${bindir}/$(basename $f)
> -    done
> -}
> -
> -FILES_${PN} = "${datadir} ${bindir}"
> -
> -INSANE_SKIP_${PN} = "already-stripped libdir staticdev file-rdeps"
> -
> -INHIBIT_SYSROOT_STRIP = "1"
> -INHIBIT_PACKAGE_STRIP = "1"
> -INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-x86host.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-x86host.inc
> new file mode 100644
> index 0000000..f823f4f
> --- /dev/null
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-x86host.inc
> @@ -0,0 +1,24 @@
> +COMPATIBLE_HOST = "x86_64.*-linux"
> +
> +FILES_${PN} = "${datadir} ${bindir}"
> +
> +BINNAME = "${@d.getVar("BPN").strip("gcc-")}"
> +
> +do_install() {
> +    install -d ${D}${datadir}/${BINNAME}/
> +    cp -r ${S}/. ${D}${datadir}/
> +
> +    install -d ${D}${bindir}
> +    # Symlink all executables into bindir
> +    for f in ${D}${datadir}/${BINNAME}/bin/${BINNAME}-*; do
> +        lnr $f ${D}${bindir}/$(basename $f)
> +    done
> +}
> +
> +INSANE_SKIP_${PN} = "already-stripped libdir staticdev file-rdeps"
> +
> +INHIBIT_SYSROOT_STRIP = "1"
> +INHIBIT_PACKAGE_STRIP = "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> +
> +BBCLASSEXTEND = "native nativesdk"
> -- 
> 2.20.1
> 

> 

