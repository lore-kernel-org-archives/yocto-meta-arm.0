Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AA4EC02190
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 19:28:59 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.5892.1738092535984571409
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 28 Jan 2025 11:28:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 378BF40CBA;
	Tue, 28 Jan 2025 19:28:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Hq2yGwuTYKh; Tue, 28 Jan 2025 19:28:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F213640BD4;
	Tue, 28 Jan 2025 19:28:53 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B00541641AD; Tue, 28 Jan 2025 14:28:53 -0500 (EST)
Date: Tue, 28 Jan 2025 14:28:53 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: ross.burton@arm.com
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 2/2] arm-toolchain: remove
 external-arm-toolchain
Message-ID: <20250128192853.GF21836@denix.org>
References: <20250128115500.3921264-1-ross.burton@arm.com>
 <20250128115500.3921264-2-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128115500.3921264-2-ross.burton@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 28 Jan 2025 19:28:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6354

On Tue, Jan 28, 2025 at 11:55:00AM +0000, Ross Burton via lists.yoctoproject.org wrote:
> Integrating the binary Arm GCC toolchain into OE is quite complicated
> because the binary release and oe-core's toolchain are arranged slightly
> differently, which makes it quite fragile.
> 
> As it's obviously a binary release we cannot patch it to fix issues.
> 
> Also it has some fairly sizable limitations: for example the kernel
> headers are old (from linux 4.19) and the locale packaging is different
> so locale package dependencies don't work.
> 
> The main historic users of the external toolchain no longer use it, so
> remove it.  The recipes will remain in the LTS branches for users who
> are using it currently, but will not be part of the next release.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Acked-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  .gitlab-ci.yml                                |   5 +-
>  ci/external-gccarm.yml                        |  13 -
>  ci/get-binary-toolchains                      |  51 --
>  meta-arm-toolchain/README.md                  |  64 --
>  .../external-arm-toolchain-versions.inc       | 134 ----
>  .../distro/include/tcmode-external-arm.inc    | 133 ----
>  .../recipes-bsp/grub/grub%.bbappend           |   1 -
>  .../recipes-bsp/grub/grub-external-arm.inc    |   5 -
>  .../util-linux/util-linux_%.bbappend          |   1 -
>  .../external-arm-sdk-toolchain.bb             | 143 ----
>  .../external-arm-toolchain.bb                 | 708 ------------------
>  .../external-arm-toolchain/files/SUPPORTED    |   1 -
>  .../external-arm-toolchain/license.inc        |  79 --
>  13 files changed, 1 insertion(+), 1337 deletions(-)
>  delete mode 100644 ci/external-gccarm.yml
>  delete mode 100755 ci/get-binary-toolchains
>  delete mode 100644 meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
>  delete mode 100644 meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
>  delete mode 100644 meta-arm-toolchain/recipes-bsp/grub/grub%.bbappend
>  delete mode 100644 meta-arm-toolchain/recipes-bsp/grub/grub-external-arm.inc
>  delete mode 100644 meta-arm-toolchain/recipes-core/util-linux/util-linux_%.bbappend
>  delete mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
>  delete mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
>  delete mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/files/SUPPORTED
>  delete mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 9dad9662..3e84d8b8 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -48,8 +48,6 @@ stages:
>      - echo DL_DIR = $DL_DIR
>      - rm -rf $KAS_WORK_DIR
>      - mkdir --verbose --parents $KAS_WORK_DIR $KAS_REPO_REF_DIR $SSTATE_DIR $DL_DIR $TOOLCHAIN_DIR $TOOLCHAIN_LINK_DIR
> -    # Must do this here, as it's the only way to make sure the toolchain is installed on the same builder
> -    - ./ci/get-binary-toolchains $DL_DIR $TOOLCHAIN_DIR $TOOLCHAIN_LINK_DIR
>  
>  # Generalised fragment to do a Kas build
>  .build:
> @@ -118,7 +116,7 @@ update-repos:
>  # Available options for building are (VIRT _must_ be last for ssh override)
>  #  DISTRO: [poky, poky-altcfg, poky-tiny]
>  #  KERNEL: [linux-yocto, linux-yocto-dev, linux-yocto-rt]
> -#  TOOLCHAINS: [gcc, clang, external-gccarm]
> +#  TOOLCHAINS: [gcc, clang]
>  #  TCLIBC: [glibc, musl]
>  #  FIRMWARE: [u-boot, edk2]
>  #  TS: [none, trusted-services]
> @@ -296,7 +294,6 @@ qemuarm-secureboot:
>          TCLIBC: [glibc, musl]
>          TESTING: testimage
>        - DISTRO: [poky, poky-altcfg]
> -        TOOLCHAINS: external-gccarm
>          TESTING: testimage
>        - KERNEL: linux-yocto-dev
>          TESTING: testimage
> diff --git a/ci/external-gccarm.yml b/ci/external-gccarm.yml
> deleted file mode 100644
> index 8985a1ba..00000000
> --- a/ci/external-gccarm.yml
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -# yaml-language-server: $schema=https://raw.githubusercontent.com/siemens/kas/master/kas/schema-kas.json
> -
> -header:
> -  version: 14
> -
> -local_conf_header:
> -  cc: |
> -    SKIP_RECIPE[gcc-cross-arm] = "Using external toolchain"
> -    TCMODE = "external-arm"
> -    EXTERNAL_TOOLCHAIN = "${TOPDIR}/toolchains/${TARGET_ARCH}"
> -    # Disable ptest as this pulls target compilers, which don't
> -    # work with external toolchain currently
> -    DISTRO_FEATURES:remove = "ptest"
> diff --git a/ci/get-binary-toolchains b/ci/get-binary-toolchains
> deleted file mode 100755
> index 793c6890..00000000
> --- a/ci/get-binary-toolchains
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -#!/bin/bash
> -set -u -e
> -
> -BASENAME=arm-gnu-toolchain
> -VER=${VER:-13.3.rel1}
> -HOST_ARCH=${HOST_ARCH:-$(uname -m)}
> -
> -# Use the standard kas container locations if nothing is passed into the script
> -DOWNLOAD_DIR="${1:-/builds/persist/downloads/}"
> -TOOLCHAIN_DIR="${2:-/builds/persist//toolchains/}"
> -TOOLCHAIN_LINK_DIR="${3:-build/toolchains/}"
> -
> -# These should be already created by .gitlab-ci.yml, but do here if run outside of that env
> -mkdir -p $DOWNLOAD_DIR $TOOLCHAIN_DIR $TOOLCHAIN_LINK_DIR
> -
> -download() {
> -	TRIPLE=$1
> -	URL=https://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel/$BASENAME-$VER-$HOST_ARCH-$TRIPLE.tar.xz
> -	wget -P $DOWNLOAD_DIR -nc $URL
> -}
> -
> -if [ $HOST_ARCH = "aarch64" ]; then
> -	# AArch64 Linux hosted cross compilers
> -
> -	# AArch32 target with hard float
> -	download arm-none-linux-gnueabihf
> -elif [ $HOST_ARCH = "x86_64" ]; then
> -	# x86_64 Linux hosted cross compilers
> -
> -	# AArch32 target with hard float
> -	download arm-none-linux-gnueabihf
> -
> -	# AArch64 GNU/Linux target
> -	download aarch64-none-linux-gnu
> -else
> -	echo "ERROR - Unknown build arch of $HOST_ARCH"
> -	exit 1
> -fi
> -
> -for i in arm aarch64; do
> -	if [ ! -d $TOOLCHAIN_DIR/$BASENAME-$VER-$HOST_ARCH-$i-none-linux-gnu*/ ]; then
> -		if [ ! -f $DOWNLOAD_DIR/$BASENAME-$VER-$HOST_ARCH-$i-none-linux-gnu*.tar.xz ]; then
> -			continue
> -		fi
> -
> -		tar -C $TOOLCHAIN_DIR -axvf $DOWNLOAD_DIR/$BASENAME-$VER-$HOST_ARCH-$i-none-linux-gnu*.tar.xz
> -	fi
> -
> -	# Setup a link for the toolchain to use local to the building machine (e.g., not in a shared location)
> -	ln -s $TOOLCHAIN_DIR/$BASENAME-$VER-$HOST_ARCH-$i-none-linux-gnu* $TOOLCHAIN_LINK_DIR/$i
> -done
> diff --git a/meta-arm-toolchain/README.md b/meta-arm-toolchain/README.md
> index 9830b95a..3263429c 100644
> --- a/meta-arm-toolchain/README.md
> +++ b/meta-arm-toolchain/README.md
> @@ -6,70 +6,6 @@ This layer contains recipes for the prebuilt GNU Arm toolchains.
>  Information regarding contributing, reporting bugs, etc can be found in the
>  top-level meta-arm readme file.
>  
> -Recipes for pre-built GNU Arm toolchain for Linux development are provided under
> -``recipes-devtools/external-arm-toolchain/``.
> -
> -external-arm-toolchain.bb
> -~~~~~~~~~~~~~~~~~~~~~~~~~
> -
> -This recipe provides support for pre-built GNU toolchains targeting processors
> -from the Arm Cortex-A family and implementing the Arm A-profile architecture.
> -
> -Usage
> -^^^^^
> -
> -In order to use any of pre-built Arm toolchain versions (8.2, 8.3, 9.2 and so
> -on), a user needs to download and untar tool-set on host machine at a particular
> -installation path eg: ``/opt/toolchain/``. Then user needs to specify following
> -in ``conf/local.conf`` in order to replace OE toolchain with pre-built GNU-A
> -toolchain:
> -
> -TCMODE = "external-arm"
> -EXTERNAL_TOOLCHAIN = "<path-to-the-toolchain>"
> -
> --  Eg. for AArch64 (eg. qemuarm64 machine in poky distro)
> -   EXTERNAL_TOOLCHAIN = "\
> -     <installation-path>/gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu \
> -   "
> -
> --  Eg. for AArch32 (eg. qemuarm machine in poky distro)
> -   EXTERNAL_TOOLCHAIN = "\
> -     <installation-path>/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf \
> -   "
> -
> -Supported distros and machines
> -^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> -
> -Since this pre-built GNU-A tool-set simply replaces OE toolchain, so it is
> -meant to be distro and machine agnostic as long as one is cross-compiling for
> -Arm A-profile architecture.
> -
> -Tested distro and machines (for zeus stable release):
> -1.  Distro: poky; machines: qemuarm and qemuarm64 (build and boot tested)
> -2.  Distro: RPB; machines: dragonboard-410c (build and boot tested)
> -3.  Distro: world; machines: qemuarm and qemuarm64. Build tested for following
> -    layers:
> -    - poky/meta
> -    - poky/meta-poky
> -    - poky/meta-yocto-bsp
> -    - meta-openembedded/meta-oe
> -    - meta-openembedded/meta-python
> -    - meta-openembedded/meta-networking
> -
> -SDK support
> -^^^^^^^^^^^
> -
> -Pre-built toochain provides support to build OE SDK which has been tested using
> -following commands:
> -
> -$ bitbake core-image-base -c populate_sdk
> -$ bitbake core-image-base -c testsdk
> -
> -Note: Currently generated SDK only uses glibc provided by pre-built toolchain.
> -      The cross compiler, binutils, gdb/gdbserver etc. are built from source.
> -      This is something we would like to improve in future in order to package
> -      most of the components from pre-built toolchain instead.
> -
>  Pre-built Arm toolchain for bare-metal development
>  --------------------------------------------------
>  
> diff --git a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> deleted file mode 100644
> index 675457d1..00000000
> --- a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
> +++ /dev/null
> @@ -1,134 +0,0 @@
> -def eat_run(d, cmd, *args):
> -    import bb.process
> -    import subprocess
> -
> -    topdir = d.getVar('TOPDIR', True)
> -    toolchain_path = d.getVar('EXTERNAL_TOOLCHAIN', True)
> -    if not toolchain_path:
> -        return 'UNKNOWN', 'UNKNOWN'
> -
> -    target_prefix = d.getVar('TARGET_PREFIX', True)
> -    path = os.path.join(toolchain_path, 'bin', target_prefix + cmd)
> -    args = [path] + list(args)
> -
> -    return bb.process.run(args, cwd=topdir, stderr=subprocess.PIPE)
> -
> -def eat_get_version(d):
> -    try:
> -        stdout, stderr = eat_run(d, 'gcc', '-v')
> -    except bb.process.CmdError as exc:
> -        bb.error('Failed to obtain external Arm toolchain version: %s' % exc)
> -        return 'UNKNOWN'
> -    else:
> -        last_line = stderr.splitlines()[-1]
> -        return last_line
> -
> -# Extract the YYYY.MM or release version
> -def eat_get_main_version(d):
> -    version = eat_get_version(d)
> -    bb.debug(2, 'Trying for parse version info from: %s' % version)
> -    if version != 'UNKNOWN':
> -        if version.split()[4] == '(Arm':
> -            # gcc version 11.3.1 20220712 (Arm GNU Toolchain 11.3.Rel1)
> -            return version.split()[7].split(')')[0]
> -        elif version.split()[4] == '(GNU':
> -            # gcc version 9.2.1 20191025 (GNU Toolchain for the A-profile Architecture 9.2-2019.12 (arm-9.10))
> -            # gcc version 8.2.1 20180802 (GNU Toolchain for the A-profile Architecture 8.2-2018.11 (arm-rel-8.26))
> -            return version.split()[10].split('-')[1]
> -        elif version.split()[3] == '(GNU':
> -            # gcc version 8.3.0 (GNU Toolchain for the A-profile Architecture 8.3-2019.03 (arm-rel-8.36))
> -            return version.split()[9].split('-')[1]
> -        else:
> -            bb.error('Failed to parse external Arm toolchain version from: %s' % version)
> -    else:
> -        return version
> -
> -# Extract the x.y.z version from 'gcc version 4.9.1'
> -def eat_get_gcc_version(d):
> -    version = eat_get_version(d)
> -    if version != 'UNKNOWN':
> -        return version.split()[2]
> -    else:
> -        return version
> -
> -def eat_get_libc_version(d):
> -    import os,bb
> -    import subprocess
> -
> -    syspath = bb.data.expand('${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}', d)
> -    if not syspath:
> -        return 'UNKNOWN'
> -
> -    topdir = d.getVar('TOPDIR', True)
> -    lddpath = syspath + '/libc/usr/bin/ldd'
> -
> -    if os.path.exists(lddpath):
> -        cmd = '/bin/sh ' + lddpath + ' --version'
> -        try:
> -            stdout, stderr = bb.process.run(cmd, cwd=topdir, stderr=subprocess.PIPE)
> -        except bb.process.CmdError as exc:
> -            bb.error('Failed to obtain external Arm libc version: %s' % exc)
> -            return 'UNKNOWN'
> -        else:
> -            first_line = stdout.splitlines()[0]
> -            return first_line.split()[2]
> -
> -    return 'UNKNOWN'
> -
> -def eat_get_kernel_version(d):
> -    import os,bb
> -    syspath = bb.data.expand('${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}', d)
> -    if not syspath:
> -        return 'UNKNOWN'
> -
> -    vf = syspath + '/libc/usr/include/linux/version.h'
> -
> -    try:
> -        f = open(vf, 'r')
> -    except (OSError, IOError):
> -        return 'UNKNOWN'
> -
> -    l = f.readlines();
> -    f.close();
> -    for s in l:
> -        if s.find('LINUX_VERSION_CODE') > 0:
> -            ver = int(s.split()[2])
> -            maj = ver / 65536
> -            ver = ver % 65536
> -            min = ver / 256
> -            ver = ver % 256
> -            return str(maj)+'.'+str(min)+'.'+str(ver)
> -    return 'UNKNOWN'
> -
> -def eat_get_gdb_version(d):
> -    try:
> -        stdout, stderr = eat_run(d, 'gdb', '-v')
> -    except bb.process.CmdError:
> -        return 'UNKNOWN'
> -    else:
> -        first_line = stdout.splitlines()[0]
> -        return first_line.split()[-1]
> -
> -def eat_get_bfd_version(d):
> -    try:
> -        stdout, stderr = eat_run(d, 'as', '--version')
> -    except bb.process.CmdError:
> -        return 'UNKNOWN'
> -    else:
> -        first_line = stdout.splitlines()[0]
> -        return first_line.split()[-1]
> -
> -python external_arm_toolchain_version_handler () {
> -    if not isinstance(e, bb.event.ConfigParsed):
> -        return
> -    d = e.data
> -    ld = d.createCopy()
> -
> -    d.setVar('EAT_VER_MAIN', eat_get_main_version(ld))
> -    d.setVar('EAT_VER_GCC', eat_get_gcc_version(ld))
> -    d.setVar('EAT_VER_LIBC', eat_get_libc_version(ld))
> -    d.setVar('EAT_VER_KERNEL', eat_get_kernel_version(ld))
> -    d.setVar('EAT_VER_GDB', eat_get_gdb_version(ld))
> -    d.setVar('EAT_VER_BFD', eat_get_bfd_version(ld))
> -}
> -addhandler external_arm_toolchain_version_handler
> diff --git a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> deleted file mode 100644
> index 0ac71264..00000000
> --- a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> +++ /dev/null
> @@ -1,133 +0,0 @@
> -#
> -# Configuration to use an external Arm binary toolchain
> -#
> -
> -EXTERNAL_TOOLCHAIN ?= "/usr/local/arm-binary-toolchain/${TARGET_ARCH}"
> -
> -# oe-core passes this by default because it assumes GCC 13. This can be removed when Arm GCC is 13.1+.
> -DEBUG_PREFIX_MAP:remove = "-fcanon-prefix-map"
> -
> -TOOLCHAIN_PATH_ADD = "${EXTERNAL_TOOLCHAIN}/bin:"
> -PATH =. "${TOOLCHAIN_PATH_ADD}"
> -
> -EAT_TARGET_SYS:arm ?= "${@ 'arm-none-linux-gnueabihf' if os.path.exists('${EXTERNAL_TOOLCHAIN}/bin/arm-none-linux-gnueabihf-gcc') else 'arm-linux-gnueabihf'}"
> -EAT_TARGET_SYS:aarch64 ?= "${@ 'aarch64-none-linux-gnu' if os.path.exists('${EXTERNAL_TOOLCHAIN}/bin/aarch64-none-linux-gnu-gcc') else 'aarch64-linux-gnu'}"
> -EAT_TARGET_SYS = "${TARGET_SYS}"
> -TARGET_PREFIX = "${EAT_TARGET_SYS}-"
> -
> -EXTERNAL_TOOLCHAIN_LIBDIR = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '/usr/lib', '/lib', d)}"
> -EXTERNAL_TOOLCHAIN_DYN_LINKER_PATH:arm ?= " -Wl,--dynamic-linker=${EXTERNAL_TOOLCHAIN_LIBDIR}/ld-linux-armhf.so.3"
> -EXTERNAL_TOOLCHAIN_DYN_LINKER_PATH:aarch64 ?= " -Wl,--dynamic-linker=${EXTERNAL_TOOLCHAIN_LIBDIR}/ld-linux-aarch64.so.1"
> -TARGET_LDFLAGS:append:class-target = "${EXTERNAL_TOOLCHAIN_DYN_LINKER_PATH}"
> -
> -EAT_LIBDIR:arm = "lib"
> -EAT_LIBDIR:aarch64 = "lib64"
> -
> -GCCMULTILIB:forcevariable = "--disable-multilib"
> -IMAGE_LINGUAS:forcevariable = ""
> -
> -# Blacklist toolchain recipes as a belt-and-suspenders way to use the external toolchain
> -SKIP_RECIPE[glibc] = "Using external toolchain"
> -SKIP_RECIPE[libgcc] = "Using external toolchain"
> -SKIP_RECIPE[gcc-cross] = "Using external toolchain"
> -SKIP_RECIPE[gcc-cross-aarch64] = "Using external toolchain"
> -SKIP_RECIPE[gcc-cross-arm] = "Using external toolchain"
> -SKIP_RECIPE[gcc-runtime] = "Using external toolchain"
> -SKIP_RECIPE[gcc-sanitizers] = "Using external toolchain"
> -
> -PREFERRED_PROVIDER_linux-libc-headers = "external-arm-toolchain"
> -PREFERRED_PROVIDER_linux-libc-headers-dev = "external-arm-toolchain"
> -PREFERRED_PROVIDER_virtual/cross-cc = "external-arm-toolchain"
> -PREFERRED_PROVIDER_virtual/cross-c++ = "external-arm-toolchain"
> -PREFERRED_PROVIDER_virtual/cross-binutils = "external-arm-toolchain"
> -PREFERRED_PROVIDER_virtual/compilerlibs = "external-arm-toolchain"
> -PREFERRED_PROVIDER_glibc = "external-arm-toolchain"
> -PREFERRED_PROVIDER_libgcc = "external-arm-toolchain"
> -PREFERRED_PROVIDER_virtual/libc = "external-arm-toolchain"
> -PREFERRED_PROVIDER_virtual/libc-locale = "external-arm-toolchain"
> -PREFERRED_PROVIDER_virtual/libintl = "external-arm-toolchain"
> -PREFERRED_PROVIDER_virtual/libiconv = "external-arm-toolchain"
> -PREFERRED_PROVIDER_virtual/crypt = "external-arm-toolchain"
> -PREFERRED_PROVIDER_glibc-thread-db = "external-arm-toolchain"
> -PREFERRED_PROVIDER_glibc-mtrace = "external-arm-toolchain"
> -PREFERRED_PROVIDER_libc-mtrace = "external-arm-toolchain"
> -PREFERRED_PROVIDER_virtual/linux-libc-headers = "external-arm-toolchain"
> -
> -# Keep nativesdk toolchain using GCC
> -PREFERRED_PROVIDER_virtual/nativesdk-cross-binutils ?= "binutils-crosssdk-${SDK_SYS}"
> -PREFERRED_PROVIDER_virtual/nativesdk-cross-cc = "gcc-crosssdk-${SDK_SYS}"
> -PREFERRED_PROVIDER_virtual/nativesdk-cross-c++ = "gcc-crosssdk-${SDK_SYS}"
> -PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs = "nativesdk-gcc-runtime"
> -
> -PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-arm-sdk-toolchain-${TRANSLATED_TARGET_ARCH}"
> -PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-arm-sdk-toolchain-${TRANSLATED_TARGET_ARCH}"
> -PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-arm-sdk-toolchain-${TRANSLATED_TARGET_ARCH}"
> -
> -TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_HOST}"
> -
> -DISTRO_FEATURES_LIBC = "ipv4 ipv6 libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-crypt \
> -			libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse \
> -			libc-getlogin libc-idn libc-inet-anl libc-libm libc-libm-big \
> -			libc-locales libc-locale-code libc-charsets \
> -			libc-memusage libc-nis libc-nsswitch libc-rcmd libc-rtld-debug libc-spawn libc-streams libc-sunrpc \
> -			libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar libc-posix-regexp libc-posix-regexp-glibc \
> -			libc-posix-wchar-io"
> -
> -ENABLE_BINARY_LOCALE_GENERATION = "0"
> -GLIBC_INTERNAL_USE_BINARY_LOCALE = "precompiled"
> -LIBCOVERRIDE = ":libc-glibc"
> -LIBC_DEPENDENCIES:remove = "glibc-gconv-cp1252 glibc-gconv-ibm850 glibc-gconv-iso8859-1 glibc-gconv-iso8859-15 glibc-localedata-i18n"
> -
> -ERROR_QA[type] ?= "list"
> -python toolchain_metadata_setup () {
> -    import subprocess
> -    if not isinstance(e, bb.event.ConfigParsed):
> -        return
> -
> -    d = e.data
> -    l = d.createCopy()
> -
> -    external_toolchain = l.getVar('EXTERNAL_TOOLCHAIN', True)
> -    if not external_toolchain or external_toolchain == 'UNDEFINED':
> -        bb.fatal("Error: EXTERNAL_TOOLCHAIN must be set to the path to your arm toolchain")
> -
> -    if not os.path.isabs(external_toolchain):
> -        bb.fatal("Error: EXTERNAL_TOOLCHAIN path '%s' must be absolute path" % external_toolchain)
> -
> -    if not os.path.exists(external_toolchain):
> -        bb.fatal("Error: EXTERNAL_TOOLCHAIN path '%s' does not exist" % external_toolchain)
> -
> -    # The external toolchain may not have been built with the oe-core preferred
> -    # gnu hash setting, so ensure that the corresponding sanity check is not an error.
> -    error_qa = oe.data.typed_value('ERROR_QA', l)
> -    if 'ldflags' in error_qa:
> -        error_qa.remove('ldflags')
> -        d.setVar('ERROR_QA', ' '.join(error_qa))
> -}
> -addhandler toolchain_metadata_setup
> -
> -def populate_toolchain_links(d):
> -    import errno
> -    import os
> -    from glob import glob
> -
> -    d = d.createCopy()
> -
> -    pattern = bb.data.expand('${EXTERNAL_TOOLCHAIN}/bin/${TARGET_PREFIX}*', d)
> -    files = glob(pattern)
> -    if not files:
> -        bb.fatal("Unable to populate toolchain binary symlinks")
> -
> -    bindir = d.getVar('STAGING_BINDIR_TOOLCHAIN', True)
> -    bb.mkdirhier(bindir)
> -    for f in files:
> -        base = os.path.basename(f)
> -        newpath = os.path.join(bindir, base)
> -        try:
> -            os.symlink(f, newpath)
> -        except OSError as exc:
> -            if exc.errno == errno.EEXIST:
> -                break
> -            bb.fatal("Unable to populate toolchain binary symlink for %s: %s" % (newpath, exc))
> -
> -require conf/distro/include/external-arm-toolchain-versions.inc
> diff --git a/meta-arm-toolchain/recipes-bsp/grub/grub%.bbappend b/meta-arm-toolchain/recipes-bsp/grub/grub%.bbappend
> deleted file mode 100644
> index 37383d47..00000000
> --- a/meta-arm-toolchain/recipes-bsp/grub/grub%.bbappend
> +++ /dev/null
> @@ -1 +0,0 @@
> -require ${@oe.utils.conditional('TCMODE', 'external-arm', 'grub-external-arm.inc', '', d)}
> diff --git a/meta-arm-toolchain/recipes-bsp/grub/grub-external-arm.inc b/meta-arm-toolchain/recipes-bsp/grub/grub-external-arm.inc
> deleted file mode 100644
> index dc260bed..00000000
> --- a/meta-arm-toolchain/recipes-bsp/grub/grub-external-arm.inc
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -# grub uses --target triplet to find binutils binaries such as objcopy
> -# Since external-arm toolchain uses aarch64-none-linux-gnu triplet,
> -# OE-defined TARGET_SYS differs from EAT_TARGET_SYS used by external-arm
> -# toolchain, grub needs passing the correct --target to configure script
> -CONFIGUREOPTS:append:class-target = " --target=${EAT_TARGET_SYS}"
> diff --git a/meta-arm-toolchain/recipes-core/util-linux/util-linux_%.bbappend b/meta-arm-toolchain/recipes-core/util-linux/util-linux_%.bbappend
> deleted file mode 100644
> index 75227a56..00000000
> --- a/meta-arm-toolchain/recipes-core/util-linux/util-linux_%.bbappend
> +++ /dev/null
> @@ -1 +0,0 @@
> -PACKAGECONFIG:remove = "${@bb.utils.contains('TCMODE', 'external-arm', 'libmount-mountfd-support', '' , d)}"
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
> deleted file mode 100644
> index 138245d1..00000000
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
> +++ /dev/null
> @@ -1,143 +0,0 @@
> -inherit cross-canadian
> -
> -require license.inc
> -
> -PN = "external-arm-sdk-toolchain-${TARGET_ARCH}"
> -BPN = "external-arm-sdk-toolchain"
> -PV = "${EAT_VER_MAIN}"
> -
> -INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> -INHIBIT_PACKAGE_STRIP = "1"
> -INHIBIT_SYSROOT_STRIP = "1"
> -INHIBIT_DEFAULT_DEPS = "1"
> -EXCLUDE_FROM_SHLIBS = "1"
> -
> -LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> -
> -# Skip packaging QA checks for prebuilt binaries
> -INSANE_SKIP:gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so staticdev file-rdeps libdir"
> -INSANE_SKIP:gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so file-rdeps"
> -INSANE_SKIP:binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so file-rdeps"
> -
> -# Skip file dependencies in RPM for prebuilt binaries
> -SKIP_FILEDEPS = "1"
> -
> -PROVIDES = "\
> -	gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} \
> -	gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} \
> -	binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} \
> -"
> -
> -PACKAGES = "\
> -	gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} \
> -	gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} \
> -	binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} \
> -"
> -
> -# Adjust defaults in line with external toolchain
> -bindir = "${exec_prefix}/bin"
> -libdir = "${exec_prefix}/lib"
> -libexecdir = "${exec_prefix}/libexec"
> -datadir = "${exec_prefix}/share"
> -gcclibdir = "${libdir}/gcc"
> -
> -FILES:gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
> -	${prefix}/${EAT_TARGET_SYS}/lib/libstdc++.* \
> -	${prefix}/${EAT_TARGET_SYS}/lib/libgcc_s.* \
> -	${prefix}/${EAT_TARGET_SYS}/lib/libsupc++.* \
> -	${prefix}/${EAT_TARGET_SYS}/include \
> -	${gcclibdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/* \
> -	${bindir}/${TARGET_PREFIX}gcov \
> -	${bindir}/${TARGET_PREFIX}gcc* \
> -	${bindir}/${TARGET_PREFIX}g++ \
> -	${bindir}/${TARGET_PREFIX}cpp \
> -	${libexecdir}/* \
> -"
> -
> -FILES:gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
> -	${bindir}/${TARGET_PREFIX}gdb* \
> -	${datadir}/gdb/* \
> -"
> -
> -FILES:binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
> -	${prefix}/${EAT_TARGET_SYS}/bin/ld* \
> -	${prefix}/${EAT_TARGET_SYS}/bin/objcopy \
> -	${prefix}/${EAT_TARGET_SYS}/bin/strip \
> -	${prefix}/${EAT_TARGET_SYS}/bin/nm \
> -	${prefix}/${EAT_TARGET_SYS}/bin/ranlib \
> -	${prefix}/${EAT_TARGET_SYS}/bin/as \
> -	${prefix}/${EAT_TARGET_SYS}/bin/ar \
> -	${prefix}/${EAT_TARGET_SYS}/bin/objdump \
> -	${prefix}/${EAT_TARGET_SYS}/lib/ldscripts/* \
> -	${bindir}/${TARGET_PREFIX}ld* \
> -	${bindir}/${TARGET_PREFIX}addr2line \
> -	${bindir}/${TARGET_PREFIX}objcopy \
> -	${bindir}/${TARGET_PREFIX}readelf \
> -	${bindir}/${TARGET_PREFIX}strip \
> -	${bindir}/${TARGET_PREFIX}nm \
> -	${bindir}/${TARGET_PREFIX}ranlib \
> -	${bindir}/${TARGET_PREFIX}gprof \
> -	${bindir}/${TARGET_PREFIX}as \
> -	${bindir}/${TARGET_PREFIX}c++filt \
> -	${bindir}/${TARGET_PREFIX}ar \
> -	${bindir}/${TARGET_PREFIX}strings \
> -	${bindir}/${TARGET_PREFIX}objdump \
> -	${bindir}/${TARGET_PREFIX}size \
> -"
> -
> -DESCRIPTION:gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "The GNU cc and gcc C compilers"
> -DESCRIPTION:gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb - GNU debugger"
> -DESCRIPTION:binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "A GNU collection of binary utilities"
> -
> -LICENSE:gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_GCC_LICENSE}"
> -LICENSE:gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_GDB_LICENSE}"
> -LICENSE:binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_BFD_LICENSE}"
> -
> -PKGV:gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_VER_GCC}"
> -PKGV:gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_VER_GDB}"
> -PKGV:binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_VER_BFD}"
> -
> -do_install() {
> -	install -d ${D}${prefix}/${EAT_TARGET_SYS}/bin
> -	install -d ${D}${prefix}/${EAT_TARGET_SYS}/lib
> -	install -d ${D}${prefix}/${EAT_TARGET_SYS}/include
> -	install -d ${D}${bindir}
> -	install -d ${D}${libdir}
> -	install -d ${D}${prefix}/${EAT_TARGET_SYS}/lib/ldscripts
> -	install -d ${D}${libexecdir}
> -	install -d ${D}${datadir}/gdb
> -	install -d ${D}${gcclibdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include
> -
> -	CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> -
> -	# gcc
> -	for i in libstdc++.* libgcc_s.* libsupc++.*; do
> -		cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/${EAT_LIBDIR}/$i ${D}${prefix}/${EAT_TARGET_SYS}/lib
> -	done
> -	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/include/* ${D}${prefix}/${EAT_TARGET_SYS}/include
> -	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/* ${D}${gcclibdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}
> -	for i in gcov gcc* g++ cpp; do
> -		cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/bin/${TARGET_PREFIX}$i ${D}${bindir}
> -	done
> -	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/libexec/* ${D}${libexecdir}
> -
> -	# gdb
> -	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/bin/${TARGET_PREFIX}gdb* ${D}${bindir}
> -	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/share/gdb/* ${D}${datadir}/gdb/
> -
> -	# binutils
> -	for i in ld* objcopy strip nm ranlib as ar objdump; do
> -		cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/bin/$i ${D}${prefix}/${EAT_TARGET_SYS}/bin
> -	done
> -	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/lib/ldscripts/* ${D}${prefix}/${EAT_TARGET_SYS}/lib/ldscripts
> -	for i in ld* addr2line objcopy readelf strip nm ranlib gprof as c++filt ar strings objdump size; do
> -		cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/bin/${TARGET_PREFIX}$i ${D}${bindir}
> -	done
> -}
> -
> -python () {
> -    if not d.getVar("EAT_VER_MAIN", False):
> -        raise bb.parse.SkipPackage("External ARM toolchain not configured (EAT_VER_MAIN not set).")
> -    if d.getVar('TCLIBC', True) != "glibc":
> -        raise bb.parse.SkipPackage("incompatible with %s" % d.getVar('TCLIBC', True))
> -}
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> deleted file mode 100644
> index 0463b867..00000000
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> +++ /dev/null
> @@ -1,708 +0,0 @@
> -require recipes-core/glibc/glibc-package.inc
> -
> -require license.inc
> -
> -INHIBIT_DEFAULT_DEPS = "1"
> -
> -LIC_FILES_CHKSUM = "\
> -	file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302 \
> -	file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420 \
> -"
> -
> -PROVIDES += "\
> -	linux-libc-headers \
> -	virtual/cross-cc \
> -	virtual/cross-c++ \
> -	virtual/binutils \
> -	virtual/compilerlibs \
> -	virtual/libc \
> -	virtual/libintl \
> -	virtual/libiconv \
> -	virtual/crypt \
> -	glibc-mtrace \
> -	glibc-thread-db \
> -	glibc \
> -	libc-mtrace \
> -	gcc-runtime \
> -	libgcc \
> -	libg2c \
> -	libg2c-dev \
> -	libssp \
> -	libssp-dev \
> -	libssp-staticdev \
> -	libgfortran \
> -	libgfortran-dev \
> -	libgfortran-staticdev \
> -	libmudflap \
> -	libmudflap-dev \
> -	libgomp \
> -	libgomp-dev \
> -	libgomp-staticdev \
> -	libitm \
> -	libitm-dev \
> -	libitm-staticdev \
> -	libquadmath \
> -	libquadmath-dev \
> -	libquadmath-staticdev \
> -	virtual/linux-libc-headers \
> -	libgcov-staticdev \
> -	virtual/libc-locale \
> -"
> -
> -PV = "${EAT_VER_MAIN}"
> -
> -BINV = "${EAT_VER_GCC}"
> -
> -SRC_URI = "file://SUPPORTED"
> -S = "${WORKDIR}/sources"
> -UNPACKDIR = "${S}"
> -
> -do_install() {
> -        # do_copy_locale expects SUPPORTED to be in WORKDIR, but recent
> -        # changes have made it so that the source/unpack location is no
> -        # longer WORKDIR and cannot be pointed to be such.  So, do this
> -        # copy manually here
> -        install -m 0644 ${UNPACKDIR}/SUPPORTED ${WORKDIR}/SUPPORTED
> -
> -	# Add stubs for files OE-core expects
> -	install -d ${S}/nscd/
> -	touch  ${S}/nscd/nscd.init
> -	touch  ${S}/nscd/nscd.conf
> -	touch  ${S}/nscd/nscd.service
> -	touch  ${S}/../makedbs.sh
> -
> -	install -d ${D}${base_libdir}
> -	install -d ${D}${base_sbindir}
> -	install -d ${D}${bindir}
> -	install -d ${D}${sbindir}
> -	install -d ${D}${libdir}
> -	install -d ${D}${libexecdir}
> -	install -d ${D}${datadir}
> -	install -d ${D}${includedir}
> -	install -d ${D}/include
> -	install -d ${D}${libdir}/${TARGET_SYS}/${EAT_VER_GCC}
> -	install -d ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/include
> -
> -	CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> -	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/${EAT_LIBDIR}/*  ${D}${base_libdir}
> -	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/${EAT_LIBDIR}/*  ${D}${base_libdir}
> -	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/${EAT_LIBDIR}/*  ${D}${libdir}
> -	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/share/*  ${D}${datadir}
> -	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/include/*  ${D}${includedir}
> -
> -	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/include/* ${D}${includedir}
> -	if [ -d ${D}${includedir}/c++/${EAT_VER_GCC}/${EAT_TARGET_SYS} ]; then
> -		mv ${D}${includedir}/c++/${EAT_VER_GCC}/${EAT_TARGET_SYS} ${D}${includedir}/c++/${EAT_VER_GCC}/${TARGET_SYS}
> -	fi
> -	ln -sf ../usr/include/c++ ${D}/include/c++
> -
> -	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/bin/* ${D}${bindir}
> -	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/sbin/* ${D}${sbindir}
> -	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/sbin/* ${D}${base_sbindir}
> -	rm -rf ${D}${bindir}/gdbserver
> -	sed -i -e 's#/arm/tools/gnu/bash/4.2/rhe6-x86_64##' ${D}${bindir}/tzselect
> -	sed -i -e 's#/arm/tools/gnu/bash/4.2/rhe6-x86_64##' ${D}${bindir}/ldd
> -	sed -i -e 's#/usr/bin/bash#/bin/sh#' ${D}${bindir}/tzselect
> -	sed -i -e 's#/usr/bin/bash#/bin/sh#' ${D}${bindir}/ldd
> -	sed -i -e 's#/bin/bash#/bin/sh#' ${D}${bindir}/tzselect
> -	sed -i -e 's#/bin/bash#/bin/sh#' ${D}${bindir}/ldd
> -
> -	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/crt*.o ${D}${libdir}/${TARGET_SYS}/${EAT_VER_GCC}/
> -	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/libgcc* ${D}${libdir}/${TARGET_SYS}/${EAT_VER_GCC}/
> -	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/libgcov* ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/
> -	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include/ssp ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/include || true
> -	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include/sanitizers ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/include || true
> -	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include/quadmath* ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/include || true
> -	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include/omp.h ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/include || true
> -	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include/openacc.h ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/include || true
> -	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/finclude ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/
> -
> -	# fix up the copied symlinks (they are still pointing to the multiarch directory)
> -	linker_name="${@bb.utils.contains("TUNE_FEATURES", "aarch64", "ld-linux-aarch64.so.1", bb.utils.contains("TUNE_FEATURES", "callconvention-hard", "ld-linux-armhf.so.3", "ld-linux.so.3",d), d)}"
> -	if [ -f ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/${EAT_LIBDIR}/ld-${EAT_VER_LIBC}.so ]; then
> -		ln -sf ld-${EAT_VER_LIBC}.so ${D}${base_libdir}/${linker_name}
> -	else
> -		cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/lib/${linker_name} ${D}${base_libdir}/
> -	fi
> -
> -	if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'false', 'true', d)}; then
> -		ln -sf ../../lib/librt.so.1 ${D}${libdir}/librt.so
> -		ln -sf ../../lib/libcrypt.so.1 ${D}${libdir}/libcrypt.so
> -		ln -sf ../../lib/libresolv.so.2 ${D}${libdir}/libresolv.so
> -		ln -sf ../../lib/libnss_hesiod.so.2 ${D}${libdir}/libnss_hesiod.so
> -		ln -sf ../../lib/libutil.so.1 ${D}${libdir}/libutil.so
> -		ln -sf ../../lib/libBrokenLocale.so.1 ${D}${libdir}/libBrokenLocale.so
> -		ln -sf ../../lib/libpthread.so.0 ${D}${libdir}/libpthread.so
> -		ln -sf ../../lib/libthread_db.so.1 ${D}${libdir}/libthread_db.so
> -		ln -sf ../../lib/libanl.so.1 ${D}${libdir}/libanl.so
> -		ln -sf ../../lib/libdl.so.2 ${D}${libdir}/libdl.so
> -		ln -sf ../../lib/libnss_db.so.2 ${D}${libdir}/libnss_db.so
> -		ln -sf ../../lib/libnss_dns.so.2 ${D}${libdir}/libnss_dns.so
> -		ln -sf ../../lib/libnss_files.so.2 ${D}${libdir}/libnss_files.so
> -		ln -sf ../../lib/libnss_compat.so.2 ${D}${libdir}/libnss_compat.so
> -		ln -sf ../../lib/libm.so.6 ${D}${libdir}/libm.so
> -		ln -sf ../../lib/libc_malloc_debug.so.0 ${D}${libdir}/libc_malloc_debug.so
> -		if [ -f ${D}${base_libdir}/libmvec.so.1 ]; then
> -			ln -sf ../../lib/libmvec.so.1 ${D}${libdir}/libmvec.so
> -		fi
> -
> -		# remove potential .so duplicates from base_libdir
> -		# for all symlinks created above in libdir
> -		rm -f ${D}${base_libdir}/librt.so
> -		rm -f ${D}${base_libdir}/libcrypt.so
> -		rm -f ${D}${base_libdir}/libresolv.so
> -		rm -f ${D}${base_libdir}/libnss_hesiod.so
> -		rm -f ${D}${base_libdir}/libutil.so
> -		rm -f ${D}${base_libdir}/libBrokenLocale.so
> -		rm -f ${D}${base_libdir}/libpthread.so
> -		rm -f ${D}${base_libdir}/libthread_db.so
> -		rm -f ${D}${base_libdir}/libanl.so
> -		rm -f ${D}${base_libdir}/libdl.so
> -		rm -f ${D}${base_libdir}/libnss_db.so
> -		rm -f ${D}${base_libdir}/libnss_dns.so
> -		rm -f ${D}${base_libdir}/libnss_files.so
> -		rm -f ${D}${base_libdir}/libnss_compat.so
> -		rm -f ${D}${base_libdir}/libm.so
> -		rm -f ${D}${base_libdir}/libmvec.so
> -
> -		# Move these completely to ${libdir} and delete duplicates in ${base_libdir}
> -		for lib in asan hwasan atomic gfortran gomp itm lsan sanitizer stdc++ tsan ubsan; do
> -			if [ -e ${D}${base_libdir}/lib${lib}.spec ] ; then
> -				mv ${D}${base_libdir}/lib${lib}.spec ${D}${libdir}
> -			fi
> -			if [ -e ${D}${base_libdir}/lib${lib}.a ] ; then
> -				mv ${D}${base_libdir}/lib${lib}.a ${D}${libdir}
> -			fi
> -			rm -f ${D}${base_libdir}/lib${lib}*
> -		done
> -
> -		# Clean up duplicate libs that are both in base_libdir and libdir
> -		rm -f ${D}${libdir}/libgcc*
> -	else
> -		ln -sf libcrypt.so.1 ${D}${libdir}/libcrypt.so
> -		ln -sf libresolv.so.2 ${D}${libdir}/libresolv.so
> -		ln -sf libnss_hesiod.so.2 ${D}${libdir}/libnss_hesiod.so
> -		ln -sf libutil.so.1 ${D}${libdir}/libutil.so
> -		ln -sf libBrokenLocale.so.1 ${D}${libdir}/libBrokenLocale.so
> -		ln -sf libpthread.so.0 ${D}${libdir}/libpthread.so
> -		ln -sf libthread_db.so.1 ${D}${libdir}/libthread_db.so
> -		ln -sf libanl.so.1 ${D}${libdir}/libanl.so
> -		ln -sf libdl.so.2 ${D}${libdir}/libdl.so
> -		ln -sf libnss_db.so.2 ${D}${libdir}/libnss_db.so
> -		ln -sf libnss_dns.so.2 ${D}${libdir}/libnss_dns.so
> -		ln -sf libnss_files.so.2 ${D}${libdir}/libnss_files.so
> -		ln -sf libnss_compat.so.2 ${D}${libdir}/libnss_compat.so
> -		ln -sf libm.so.6 ${D}${libdir}/libm.so
> -		ln -sf libc_malloc_debug.so.0 ${D}${libdir}/libc_malloc_debug.so
> -		if [ -f ${D}${libdir}/libmvec.so.1 ]; then
> -			ln -sf libmvec.so.1 ${D}${libdir}/libmvec.so
> -		fi
> -	fi
> -
> -	# Besides ld-${EAT_VER_LIBC}.so, other libs can have duplicates like lib*-${EAT_VER_LIBC}.so
> -	# Only remove them if both are regular files and are identical
> -	for i in ${D}${base_libdir}/lib*-${EAT_VER_LIBC}.so; do
> -		if [ ! -e $i ] ; then
> -			continue
> -		fi
> -
> -		f=$(echo $i | sed 's/-${EAT_VER_LIBC}//')
> -		l=$(ls $f.*)
> -		if [ $(readlink -f $i ) = $l ]; then
> -			echo "$i is a symlink of $l, keep it"
> -		elif [ $(readlink -f $l ) = $i ]; then
> -			echo "$l is a symlink of $i, keep it"
> -		else
> -			cmp -s $i $l
> -			if [ $? -eq 0 ]; then
> -				echo "$i is a duplicate of $l, remove it"
> -				rm $i
> -			else
> -				echo "$i and $l are different files, keep them both"
> -			fi
> -		fi
> -	done
> -
> -	if [ -d ${D}${base_libdir}/arm-linux-gnueabi ]; then
> -	   rm -rf ${D}${base_libdir}/arm-linux-gnueabi
> -	fi
> -
> -	if [ -d ${D}${base_libdir}/ldscripts ]; then
> -	   rm -rf ${D}${base_libdir}/ldscripts
> -	fi
> -
> -	# Provided by libnsl2
> -	rm -rf ${D}${includedir}/rpcsvc/yppasswd.*
> -	# Provided by quota
> -	rm -rf ${D}${includedir}/rpcsvc/rquota.*
> -
> -	if [ -f ${D}${libdir}/libc.so ];then
> -		sed -i -e "s# /usr/${EAT_LIBDIR}/# /usr/lib/#g" -e "s# /${EAT_LIBDIR}/ld-linux# ../../${base_libdir}/ld-linux#g" ${D}${libdir}/libc.so
> -		sed -i -e "s# /${EAT_LIBDIR}/libc.so.6# /lib/libc.so.6#g" ${D}${libdir}/libc.so
> -		sed -i -e "s# /lib# ../../${base_libdir}#g" -e "s# /usr/lib# .#g" ${D}${libdir}/libc.so
> -	fi
> -
> -	if [ -f ${D}${base_libdir}/libc.so ];then
> -		sed -i -e "s# /${EAT_LIBDIR}/# /lib/#g" ${D}${base_libdir}/libc.so
> -		if [ -f ${D}${base_libdir}/libc.so.6 ]; then
> -			sed -i -e "s# /usr/${EAT_LIBDIR}/libc.so.6# /lib/libc.so.6#g" -e "s# /${EAT_LIBDIR}/libc.so.6# /lib/libc.so.6#g" ${D}${base_libdir}/libc.so.6
> -		fi
> -	fi
> -
> -	# Remove if empty
> -	rmdir ${D}${bindir} || true
> -	rmdir ${D}${sbindir} || true
> -	rmdir ${D}${base_sbindir} || true
> -	rmdir ${D}${libexecdir} || true
> -
> -	# Remove unused /usr/share/info/dir
> -	rm -f ${D}${infodir}/dir
> -}
> -
> -# External toolchain doesn't provide multilib support so make corresponding
> -# install API as an empty API to avoid an unnecessary errors.
> -oe_multilib_header () {
> -	return
> -}
> -
> -PACKAGES_DYNAMIC = "^locale-base-.* \
> -                    ^glibc-gconv-.* ^glibc-charmap-.* ^glibc-localedata-.* ^glibc-binary-localedata-.* \
> -                    ^${MLPREFIX}glibc-gconv$"
> -
> -# PACKAGES is split up according to the 'source' recipes/includes in OE-core
> -# Stylistic differences are kept to make copy/pasting easier.
> -
> -# From gcc-runtime.inc
> -
> -PACKAGES += "\
> -    gcc-runtime-dbg \
> -    libstdc++ \
> -    libstdc++-precompile-dev \
> -    libstdc++-dev \
> -    libstdc++-staticdev \
> -    libg2c \
> -    libg2c-dev \
> -    libssp \
> -    libssp-dev \
> -    libssp-staticdev \
> -    libmudflap \
> -    libmudflap-dev \
> -    libmudflap-staticdev \
> -    libquadmath \
> -    libquadmath-dev \
> -    libquadmath-staticdev \
> -    libgomp \
> -    libgomp-dev \
> -    libgomp-staticdev \
> -    libatomic \
> -    libatomic-dev \
> -    libatomic-staticdev \
> -    libitm \
> -    libitm-dev \
> -    libitm-staticdev \
> -"
> -
> -# From gcc-sanitizers.inc
> -
> -PACKAGES += "gcc-sanitizers gcc-sanitizers-dbg"
> -PACKAGES += "libasan libubsan liblsan libtsan"
> -PACKAGES += "libasan-dev libubsan-dev liblsan-dev libtsan-dev"
> -PACKAGES += "libasan-staticdev libubsan-staticdev liblsan-staticdev libtsan-staticdev"
> -
> -# From libgfortran.inc:
> -
> -PACKAGES += "\
> -    libgfortran-dbg \
> -    libgfortran \
> -    libgfortran-dev \
> -    libgfortran-staticdev \
> -"
> -
> -# libgcc.inc uses ${PN}, so replace that
> -
> -PACKAGES += "\
> -    libgcc \
> -    libgcc-dev \
> -    libgcc-dbg \
> -"
> -
> -# ... and the leftovers
> -
> -PACKAGES =+ "\
> -        ${PN}-mtrace \
> -	libgcov-staticdev \
> -	linux-libc-headers \
> -	linux-libc-headers-dev \
> -"
> -
> -# Re-order PACKAGES list in order to shift ${PN}-dev towards the end as
> -# it is meant to pick up remaining dev libraries and headers that aren't
> -# picked up by other packages. And since some static libraries needs to
> -# be packaged in ${PN}-dev, so we need to keep ${PN}-staticdev later in
> -# order.
> -
> -PACKAGES := "${@oe.utils.str_filter_out('${PN}-dev', '${PACKAGES}', d)}"
> -PACKAGES := "${@oe.utils.str_filter_out('${PN}-staticdev', '${PACKAGES}', d)}"
> -PACKAGES += "\
> -	${PN}-dev \
> -	${PN}-staticdev \
> -"
> -
> -INSANE_SKIP += " 32bit-time"
> -INSANE_SKIP:${PN}-dbg = "staticdev"
> -INSANE_SKIP:${PN}-utils += "ldflags"
> -INSANE_SKIP:libstdc++ += "ldflags"
> -INSANE_SKIP:libgfortran += "ldflags"
> -INSANE_SKIP:libgcc += "ldflags dev-deps"
> -INSANE_SKIP:libgcc-dev += "staticdev"
> -INSANE_SKIP:libgfortran += "ldflags dev-deps"
> -INSANE_SKIP:libstdc++ += "ldflags dev-deps"
> -INSANE_SKIP:libatomic += "ldflags"
> -INSANE_SKIP:libasan += "ldflags"
> -INSANE_SKIP:libubsan += "ldflags"
> -INSANE_SKIP:libssp += "ldflags"
> -INSANE_SKIP:libgomp += "ldflags"
> -INSANE_SKIP:libitm += "ldflags"
> -INSANE_SKIP:gdbserver += "ldflags"
> -
> -# OE-core has literally listed 'glibc' in LIBC_DEPENDENCIES :/
> -RPROVIDES:${PN} = "glibc rtld(GNU_HASH)"
> -# Add runtime provides for the other libc* packages as well
> -RPROVIDES:${PN}-dev = "glibc-dev"
> -RPROVIDES:${PN}-doc = "glibc-doc"
> -RPROVIDES:${PN}-dbg = "glibc-dbg"
> -RPROVIDES:${PN}-pic = "glibc-pic"
> -RPROVIDES:${PN}-utils = "glibc-utils"
> -RPROVIDES:${PN}-mtrace = "glibc-mtrace libc-mtrace"
> -
> -PKG:${PN} = "glibc"
> -PKG:${PN}-dev = "glibc-dev"
> -PKG:${PN}-doc = "glibc-doc"
> -PKG:${PN}-dbg = "glibc-dbg"
> -PKG:${PN}-pic = "glibc-pic"
> -PKG:${PN}-utils = "glibc-utils"
> -PKG:${PN}-mtrace = "glibc-mtrace"
> -PKG:${PN}-gconv = "glibc-gconv"
> -PKG:${PN}-extra-nss = "glibc-extra-nss"
> -PKG:${PN}-thread-db = "glibc-thread-db"
> -PKG:${PN}-pcprofile = "glibc-pcprofile"
> -PKG:${PN}-staticdev = "glibc-staticdev"
> -
> -PKGV = "${EAT_VER_LIBC}"
> -PKGV:${PN} = "${EAT_VER_LIBC}"
> -PKGV:${PN}-dev = "${EAT_VER_LIBC}"
> -PKGV:${PN}-doc = "${EAT_VER_LIBC}"
> -PKGV:${PN}-dbg = "${EAT_VER_LIBC}"
> -PKGV:${PN}-pic = "${EAT_VER_LIBC}"
> -PKGV:${PN}-utils = "${EAT_VER_LIBC}"
> -PKGV:${PN}-mtrace = "${EAT_VER_LIBC}"
> -PKGV:${PN}-gconv = "${EAT_VER_LIBC}"
> -PKGV:${PN}-extra-nss = "${EAT_VER_LIBC}"
> -PKGV:${PN}-thread-db = "${EAT_VER_LIBC}"
> -PKGV:${PN}-pcprofile = "${EAT_VER_LIBC}"
> -PKGV:${PN}-staticdev = "${EAT_VER_LIBC}"
> -PKGV:catchsegv = "${EAT_VER_LIBC}"
> -PKGV:glibc-extra-nss = "${EAT_VER_LIBC}"
> -PKGV:glibc-thread-db = "${EAT_VER_LIBC}"
> -
> -PKGV:libmemusage = "${EAT_VER_LIBC}"
> -PKGV:libsegfault = "${EAT_VER_LIBC}"
> -PKGV:libsotruss = "${EAT_VER_LIBC}"
> -PKGV:sln = "${EAT_VER_LIBC}"
> -PKGV:nscd = "${EAT_VER_LIBC}"
> -PKGV:ldd = "${EAT_VER_LIBC}"
> -
> -PKGV:libasan-dev = "${EAT_VER_GCC}"
> -PKGV:libasan = "${EAT_VER_GCC}"
> -PKGV:libasan-staticdev = "${EAT_VER_GCC}"
> -PKGV:libatomic-dev = "${EAT_VER_GCC}"
> -PKGV:libatomic = "${EAT_VER_GCC}"
> -PKGV:libatomic-staticdev = "${EAT_VER_GCC}"
> -PKGV:libg2c-dev = "${EAT_VER_GCC}"
> -PKGV:libg2c = "${EAT_VER_GCC}"
> -PKGV:libgcc-dev = "${EAT_VER_GCC}"
> -PKGV:libgcc = "${EAT_VER_GCC}"
> -PKGV:libgfortran-dbg = "${EAT_VER_GCC}"
> -PKGV:libgfortran-dev = "${EAT_VER_GCC}"
> -PKGV:libgfortran = "${EAT_VER_GCC}"
> -PKGV:libgfortran-staticdev = "${EAT_VER_GCC}"
> -PKGV:libgomp-dev = "${EAT_VER_GCC}"
> -PKGV:libgomp = "${EAT_VER_GCC}"
> -PKGV:libgomp-staticdev = "${EAT_VER_GCC}"
> -PKGV:libitm-dev = "${EAT_VER_GCC}"
> -PKGV:libitm = "${EAT_VER_GCC}"
> -PKGV:libitm-staticdev = "${EAT_VER_GCC}"
> -PKGV:liblsan-dev = "${EAT_VER_GCC}"
> -PKGV:liblsan = "${EAT_VER_GCC}"
> -PKGV:liblsan-staticdev = "${EAT_VER_GCC}"
> -PKGV:libmudflap-dev = "${EAT_VER_GCC}"
> -PKGV:libmudflap = "${EAT_VER_GCC}"
> -PKGV:libmudflap-staticdev = "${EAT_VER_GCC}"
> -PKGV:libquadmath-dev = "${EAT_VER_GCC}"
> -PKGV:libquadmath = "${EAT_VER_GCC}"
> -PKGV:libquadmath-staticdev = "${EAT_VER_GCC}"
> -PKGV:libssp-dev = "${EAT_VER_GCC}"
> -PKGV:libssp = "${EAT_VER_GCC}"
> -PKGV:libssp-staticdev = "${EAT_VER_GCC}"
> -PKGV:libstdc++-dbg = "${EAT_VER_GCC}"
> -PKGV:libstdc++-dev = "${EAT_VER_GCC}"
> -PKGV:libstdc++ = "${EAT_VER_GCC}"
> -PKGV:libstdc++-precompile-dev = "${EAT_VER_GCC}"
> -PKGV:libstdc++-staticdev = "${EAT_VER_GCC}"
> -PKGV:libtsan-dev = "${EAT_VER_GCC}"
> -PKGV:libtsan = "${EAT_VER_GCC}"
> -PKGV:libtsan-staticdev = "${EAT_VER_GCC}"
> -PKGV:libubsan-dev = "${EAT_VER_GCC}"
> -PKGV:libubsan = "${EAT_VER_GCC}"
> -PKGV:libubsan-staticdev = "${EAT_VER_GCC}"
> -
> -PKGV:linux-libc-headers-dev = "${EAT_VER_KERNEL}"
> -PKGV:linux-libc-headers = "${EAT_VER_KERNEL}"
> -
> -PKGV:gdbserver = "${EAT_VER_GDBSERVER}"
> -
> -ALLOW_EMPTY:${PN}-mtrace = "1"
> -FILES:${PN}-mtrace = "${bindir}/mtrace"
> -
> -FILES:libgcov-staticdev = "${libdir}/gcc/${TARGET_SYS}/${BINV}/libgcov.a"
> -
> -FILES:libsegfault = "${base_libdir}/libSegFault*"
> -
> -FILES:catchsegv = "${bindir}/catchsegv"
> -RDEPENDS:catchsegv = "libsegfault"
> -
> -# From libgfortran.inc:
> -
> -FILES:libgfortran = "${libdir}/libgfortran.so.*"
> -FILES:libgfortran-dev = "\
> -    ${libdir}/libgfortran*.so \
> -    ${libdir}/libgfortran.spec \
> -    ${libdir}/libgfortran.la \
> -    ${libdir}/gcc/${TARGET_SYS}/${BINV}/libgfortranbegin.* \
> -    ${libdir}/gcc/${TARGET_SYS}/${BINV}/libcaf_single* \
> -    ${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude/ \
> -"
> -FILES:libgfortran-staticdev = "${libdir}/libgfortran.a"
> -
> -
> -# From gcc-sanitizers.inc:
> -
> -FILES:libasan += "${libdir}/libasan.so.* ${libdir}/libhwasan.so.*"
> -FILES:libasan-dev += "\
> -    ${libdir}/libasan_preinit.o \
> -    ${libdir}/libasan.so \
> -    ${libdir}/libhwasan.so \
> -    ${libdir}/libasan.la \
> -"
> -FILES:libasan-staticdev += "${libdir}/libasan.a \
> -    ${libdir}/libhwasan.a \
> -"
> -
> -FILES:libubsan += "${libdir}/libubsan.so.*"
> -FILES:libubsan-dev += "\
> -    ${libdir}/libubsan.so \
> -    ${libdir}/libubsan.la \
> -"
> -FILES:libubsan-staticdev += "${libdir}/libubsan.a"
> -
> -FILES:liblsan += "${libdir}/liblsan.so.*"
> -FILES:liblsan-dev += "\
> -    ${libdir}/liblsan.so \
> -    ${libdir}/liblsan.la \
> -    ${libdir}/liblsan_preinit.o \
> -"
> -FILES:liblsan-staticdev += "${libdir}/liblsan.a"
> -
> -FILES:libtsan += "${libdir}/libtsan.so.*"
> -FILES:libtsan-dev += "\
> -    ${libdir}/libtsan.so \
> -    ${libdir}/libtsan.la \
> -    ${libdir}/libtsan_*.o \
> -"
> -FILES:libtsan-staticdev += "${libdir}/libtsan.a"
> -
> -FILES:gcc-sanitizers = "${libdir}/*.spec ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/sanitizer/*.h"
> -
> -# From libgcc.inc:
> -
> -FILES:libgcc = "${base_libdir}/libgcc_s.so.1"
> -
> -FILES:libgcc-dev = "\
> -    ${base_libdir}/libgcc*.so \
> -    ${@oe.utils.conditional('BASETARGET_SYS', '${TARGET_SYS}', '', '${libdir}/${BASETARGET_SYS}', d)} \
> -    ${libdir}/${TARGET_SYS}/${BINV}* \
> -    ${libdir}/${TARGET_ARCH}${TARGET_VENDOR}* \
> -"
> -
> -FILES:linux-libc-headers = ""
> -FILES:linux-libc-headers-dev = "\
> -	${includedir}/asm* \
> -	${includedir}/linux \
> -	${includedir}/mtd \
> -	${includedir}/rdma \
> -	${includedir}/scsi \
> -	${includedir}/sound \
> -	${includedir}/video \
> -"
> -FILES:${PN} += "\
> -	${libdir}/bin \
> -	${libdir}/locale \
> -	${libdir}/gconv/gconv-modules \
> -	${datadir}/zoneinfo \
> -	${base_libdir}/libcrypt*.so.* \
> -	${base_libdir}/libcrypt-*.so \
> -	${base_libdir}/libc.so.* \
> -	${base_libdir}/libc-*.so \
> -	${base_libdir}/libm.so.* \
> -	${base_libdir}/libmemusage.so \
> -	${base_libdir}/libm-*.so \
> -	${base_libdir}/ld*.so.* \
> -	${base_libdir}/ld-*.so \
> -	${base_libdir}/libpthread*.so.* \
> -	${base_libdir}/libpthread-*.so \
> -	${base_libdir}/libresolv*.so.* \
> -	${base_libdir}/libresolv-*.so \
> -	${base_libdir}/librt*.so.* \
> -	${base_libdir}/librt-*.so \
> -	${base_libdir}/libutil*.so.* \
> -	${base_libdir}/libutil-*.so \
> -	${base_libdir}/libnss_files*.so.* \
> -	${base_libdir}/libnss_files-*.so \
> -	${base_libdir}/libnss_compat*.so.* \
> -	${base_libdir}/libnss_compat-*.so \
> -	${base_libdir}/libnss_dns*.so.* \
> -	${base_libdir}/libnss_dns-*.so \
> -	${base_libdir}/libnss_nis*.so.* \
> -	${base_libdir}/libnss_nisplus-*.so \
> -	${base_libdir}/libnss_nisplus*.so.* \
> -	${base_libdir}/libnss_nis-*.so \
> -	${base_libdir}/libnss_hesiod*.so.* \
> -	${base_libdir}/libnss_hesiod-*.so \
> -	${base_libdir}/libdl*.so.* \
> -	${base_libdir}/libdl-*.so \
> -	${base_libdir}/libanl*.so.* \
> -	${base_libdir}/libanl-*.so \
> -	${base_libdir}/libBrokenLocale*.so.* \
> -	${base_libdir}/libBrokenLocale-*.so \
> -	${base_libdir}/libthread_db*.so.* \
> -	${base_libdir}/libthread_db-*.so \
> -	${base_libdir}/libmemusage.so \
> -	${base_libdir}/libSegFault.so \
> -	${base_libdir}/libpcprofile.so \
> -    "
> -
> -FILES:${PN}-dbg += "${base_libdir}/debug"
> -
> -# From gcc-runtime.inc
> -
> -# include python debugging scripts
> -FILES:gcc-runtime-dbg += "\
> -    ${libdir}/libstdc++.so.*-gdb.py \
> -    ${datadir}/gcc-${BINV}/python/libstdcxx \
> -"
> -
> -FILES:libg2c = "${target_libdir}/libg2c.so.*"
> -SUMMARY:libg2c = "Companion runtime library for g77"
> -FILES:libg2c-dev = "\
> -    ${libdir}/libg2c.so \
> -    ${libdir}/libg2c.a \
> -    ${libdir}/libfrtbegin.a \
> -"
> -SUMMARY:libg2c-dev = "Companion runtime library for g77 - development files"
> -
> -FILES:libstdc++ = "${libdir}/libstdc++.so.*"
> -SUMMARY:libstdc++ = "GNU standard C++ library"
> -FILES:libstdc++-dev = "\
> -    /include/c++ \
> -    ${includedir}/c++/ \
> -    ${libdir}/libstdc++.so \
> -    ${libdir}/libstdc++*.la \
> -    ${libdir}/libsupc++.la \
> -"
> -SUMMARY:libstdc++-dev = "GNU standard C++ library - development files"
> -
> -FILES:libstdc++-staticdev = "\
> -    ${libdir}/libstdc++*.a \
> -    ${libdir}/libsupc++.a \
> -"
> -SUMMARY:libstdc++-staticdev = "GNU standard C++ library - static development files"
> -
> -FILES:libstdc++-precompile-dev = "${includedir}/c++/${TARGET_SYS}/bits/*.gch"
> -SUMMARY:libstdc++-precompile-dev = "GNU standard C++ library - precompiled header files"
> -
> -FILES:libssp = "${libdir}/libssp.so.*"
> -SUMMARY:libssp = "GNU stack smashing protection library"
> -FILES:libssp-dev = "\
> -    ${libdir}/libssp*.so \
> -    ${libdir}/libssp*_nonshared.a \
> -    ${libdir}/libssp*.la \
> -    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/ssp \
> -"
> -SUMMARY:libssp-dev = "GNU stack smashing protection library - development files"
> -FILES:libssp-staticdev = "${libdir}/libssp*.a"
> -SUMMARY:libssp-staticdev = "GNU stack smashing protection library - static development files"
> -
> -FILES:libquadmath = "${libdir}/libquadmath*.so.*"
> -SUMMARY:libquadmath = "GNU quad-precision math library"
> -FILES:libquadmath-dev = "\
> -    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/quadmath* \
> -    ${libdir}/libquadmath*.so \
> -    ${libdir}/libquadmath.la \
> -"
> -SUMMARY:libquadmath-dev = "GNU quad-precision math library - development files"
> -FILES:libquadmath-staticdev = "${libdir}/libquadmath.a"
> -SUMMARY:libquadmath-staticdev = "GNU quad-precision math library - static development files"
> -
> -# NOTE: mudflap has been removed as of gcc 4.9 and has been superseded by the address sanitiser
> -FILES:libmudflap = "${libdir}/libmudflap*.so.*"
> -SUMMARY:libmudflap = "Pointer debugging library for gcc"
> -FILES:libmudflap-dev = "\
> -    ${libdir}/libmudflap*.so \
> -    ${libdir}/libmudflap.la \
> -"
> -SUMMARY:libmudflap-dev = "Pointer debugging library for gcc - development files"
> -FILES:libmudflap-staticdev = "${libdir}/libmudflap.a"
> -SUMMARY:libmudflap-staticdev = "Pointer debugging library for gcc - static development files"
> -
> -FILES:libgomp = "${libdir}/libgomp*${SOLIBS}"
> -SUMMARY:libgomp = "GNU OpenMP parallel programming library"
> -FILES:libgomp-dev = "\
> -    ${libdir}/libgomp*${SOLIBSDEV} \
> -    ${libdir}/libgomp*.la \
> -    ${libdir}/libgomp.spec \
> -    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/omp.h \
> -    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/openacc.h \
> -"
> -SUMMARY:libgomp-dev = "GNU OpenMP parallel programming library - development files"
> -FILES:libgomp-staticdev = "${libdir}/libgomp*.a"
> -SUMMARY:libgomp-staticdev = "GNU OpenMP parallel programming library - static development files"
> -
> -FILES:libatomic = "${libdir}/libatomic.so.*"
> -SUMMARY:libatomic = "GNU C++11 atomics support library"
> -FILES:libatomic-dev = "\
> -    ${libdir}/libatomic.so \
> -    ${libdir}/libatomic.la \
> -"
> -SUMMARY:libatomic-dev = "GNU C++11 atomics support library - development files"
> -FILES:libatomic-staticdev = "${libdir}/libatomic.a"
> -SUMMARY:libatomic-staticdev = "GNU C++11 atomics support library - static development files"
> -
> -FILES:libitm = "${libdir}/libitm.so.*"
> -SUMMARY:libitm = "GNU transactional memory support library"
> -FILES:libitm-dev = "\
> -    ${libdir}/libitm.so \
> -    ${libdir}/libitm.la \
> -    ${libdir}/libitm.spec \
> -"
> -SUMMARY:libitm-dev = "GNU transactional memory support library - development files"
> -FILES:libitm-staticdev = "${libdir}/libitm.a"
> -SUMMARY:libitm-staticdev = "GNU transactional memory support library - static development files"
> -
> -EAT_VER_MAIN ??= ""
> -
> -python () {
> -    if not d.getVar("EAT_VER_MAIN", False):
> -        raise bb.parse.SkipPackage("External ARM toolchain not configured (EAT_VER_MAIN not set).")
> -    if d.getVar('TCLIBC', True) != "glibc":
> -        raise bb.parse.SkipPackage("incompatible with %s" % d.getVar('TCLIBC', True))
> -}
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/files/SUPPORTED b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/files/SUPPORTED
> deleted file mode 100644
> index 9615075e..00000000
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/files/SUPPORTED
> +++ /dev/null
> @@ -1 +0,0 @@
> -POSIX
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
> deleted file mode 100644
> index 4260dc71..00000000
> --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
> +++ /dev/null
> @@ -1,79 +0,0 @@
> -LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only & GPL-2.0-only & LGPL-3.0-only & LGPL-2.1-only & LGPL-2.0-only"
> -
> -EAT_BFD_LICENSE = "GPL-3.0-only"
> -EAT_GCC_LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only"
> -EAT_GDB_LICENSE = "GPL-3.0-only"
> -EAT_LIBC_LICENSE = "GPL-2.0-only & LGPL-2.1-only"
> -EAT_RLE_LICENSE = "GPL-3.0-with-GCC-exception"
> -
> -LICENSE:${PN} = "${EAT_LIBC_LICENSE}"
> -LICENSE:${PN}-dev = "${EAT_LIBC_LICENSE}"
> -LICENSE:${PN}-doc = "${EAT_LIBC_LICENSE}"
> -LICENSE:${PN}-dbg = "${EAT_LIBC_LICENSE}"
> -LICENSE:${PN}-pic = "${EAT_LIBC_LICENSE}"
> -LICENSE:${PN}-utils = "${EAT_LIBC_LICENSE}"
> -LICENSE:${PN}-mtrace = "${EAT_LIBC_LICENSE}"
> -LICENSE:${PN}-gconv = "${EAT_LIBC_LICENSE}"
> -LICENSE:${PN}-extra-nss = "${EAT_LIBC_LICENSE}"
> -LICENSE:${PN}-thread-db = "${EAT_LIBC_LICENSE}"
> -LICENSE:${PN}-pcprofile = "${EAT_LIBC_LICENSE}"
> -LICENSE:${PN}-staticdev = "${EAT_LIBC_LICENSE}"
> -LICENSE:catchsegv = "${EAT_LIBC_LICENSE}"
> -LICENSE:glibc-extra-nss = "${EAT_LIBC_LICENSE}"
> -LICENSE:glibc-thread-db = "${EAT_LIBC_LICENSE}"
> -
> -LICENSE:libmemusage = "${EAT_LIBC_LICENSE}"
> -LICENSE:libsegfault = "${EAT_LIBC_LICENSE}"
> -LICENSE:libsotruss = "${EAT_LIBC_LICENSE}"
> -LICENSE:sln = "${EAT_LIBC_LICENSE}"
> -LICENSE:nscd = "${EAT_LIBC_LICENSE}"
> -LICENSE:ldd = "${EAT_LIBC_LICENSE}"
> -
> -LICENSE:libasan-dev = "${EAT_GCC_LICENSE}"
> -LICENSE:libasan = "${EAT_GCC_LICENSE}"
> -LICENSE:libasan-staticdev = "${EAT_GCC_LICENSE}"
> -LICENSE:libatomic-dev = "${EAT_GCC_LICENSE}"
> -LICENSE:libatomic = "${EAT_GCC_LICENSE}"
> -LICENSE:libatomic-staticdev = "${EAT_GCC_LICENSE}"
> -LICENSE:libg2c-dev = "${EAT_GCC_LICENSE}"
> -LICENSE:libg2c = "${EAT_GCC_LICENSE}"
> -LICENSE:libgcc-dev = "${EAT_GCC_LICENSE}"
> -LICENSE:libgcc = "${EAT_GCC_LICENSE}"
> -LICENSE:libgfortran-dbg = "${EAT_GCC_LICENSE}"
> -LICENSE:libgfortran-dev = "${EAT_GCC_LICENSE}"
> -LICENSE:libgfortran = "${EAT_GCC_LICENSE}"
> -LICENSE:libgfortran-staticdev = "${EAT_GCC_LICENSE}"
> -LICENSE:libgomp-dev = "${EAT_GCC_LICENSE}"
> -LICENSE:libgomp = "${EAT_GCC_LICENSE}"
> -LICENSE:libgomp-staticdev = "${EAT_GCC_LICENSE}"
> -LICENSE:libitm-dev = "${EAT_GCC_LICENSE}"
> -LICENSE:libitm = "${EAT_GCC_LICENSE}"
> -LICENSE:libitm-staticdev = "${EAT_GCC_LICENSE}"
> -LICENSE:liblsan-dev = "${EAT_GCC_LICENSE}"
> -LICENSE:liblsan = "${EAT_GCC_LICENSE}"
> -LICENSE:liblsan-staticdev = "${EAT_GCC_LICENSE}"
> -LICENSE:libmudflap-dev = "${EAT_GCC_LICENSE}"
> -LICENSE:libmudflap = "${EAT_GCC_LICENSE}"
> -LICENSE:libmudflap-staticdev = "${EAT_GCC_LICENSE}"
> -LICENSE:libquadmath-dev = "${EAT_GCC_LICENSE}"
> -LICENSE:libquadmath = "${EAT_GCC_LICENSE}"
> -LICENSE:libquadmath-staticdev = "${EAT_GCC_LICENSE}"
> -LICENSE:libssp-dev = "${EAT_GCC_LICENSE}"
> -LICENSE:libssp = "${EAT_GCC_LICENSE}"
> -LICENSE:libssp-staticdev = "${EAT_GCC_LICENSE}"
> -LICENSE:libstdc++-dbg = "${EAT_GCC_LICENSE}"
> -LICENSE:libstdc++-dev = "${EAT_GCC_LICENSE}"
> -LICENSE:libstdc++ = "${EAT_GCC_LICENSE}"
> -LICENSE:libstdc++-precompile-dev = "${EAT_GCC_LICENSE}"
> -LICENSE:libstdc++-staticdev = "${EAT_GCC_LICENSE}"
> -LICENSE:libtsan-dev = "${EAT_GCC_LICENSE}"
> -LICENSE:libtsan = "${EAT_GCC_LICENSE}"
> -LICENSE:libtsan-staticdev = "${EAT_GCC_LICENSE}"
> -LICENSE:libubsan-dev = "${EAT_GCC_LICENSE}"
> -LICENSE:libubsan = "${EAT_GCC_LICENSE}"
> -LICENSE:libubsan-staticdev = "${EAT_GCC_LICENSE}"
> -
> -LICENSE:linux-libc-headers-dev = "GPL-2.0-only"
> -LICENSE:linux-libc-headers = "GPL-2.0-only"
> -
> -LICENSE:gdbserver = "GPL-2.0-only & GPL-3.0-only & LGPL-2.0-only & LGPL-3.0-only"
> -- 
> 2.43.0

