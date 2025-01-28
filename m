Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E07CC0218D
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 11:55:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.15841.1738065317398379896
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 28 Jan 2025 03:55:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89D5E497
	for <meta-arm@lists.yoctoproject.org>; Tue, 28 Jan 2025 03:55:43 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 69EB33F694
	for <meta-arm@lists.yoctoproject.org>; Tue, 28 Jan 2025 03:55:16 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm-toolchain: remove external-arm-toolchain
Date: Tue, 28 Jan 2025 11:55:00 +0000
Message-ID: <20250128115500.3921264-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250128115500.3921264-1-ross.burton@arm.com>
References: <20250128115500.3921264-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 28 Jan 2025 11:55:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6352

Integrating the binary Arm GCC toolchain into OE is quite complicated
because the binary release and oe-core's toolchain are arranged slightly
differently, which makes it quite fragile.

As it's obviously a binary release we cannot patch it to fix issues.

Also it has some fairly sizable limitations: for example the kernel
headers are old (from linux 4.19) and the locale packaging is different
so locale package dependencies don't work.

The main historic users of the external toolchain no longer use it, so
remove it.  The recipes will remain in the LTS branches for users who
are using it currently, but will not be part of the next release.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml                                |   5 +-
 ci/external-gccarm.yml                        |  13 -
 ci/get-binary-toolchains                      |  51 --
 meta-arm-toolchain/README.md                  |  64 --
 .../external-arm-toolchain-versions.inc       | 134 ----
 .../distro/include/tcmode-external-arm.inc    | 133 ----
 .../recipes-bsp/grub/grub%.bbappend           |   1 -
 .../recipes-bsp/grub/grub-external-arm.inc    |   5 -
 .../util-linux/util-linux_%.bbappend          |   1 -
 .../external-arm-sdk-toolchain.bb             | 143 ----
 .../external-arm-toolchain.bb                 | 708 ------------------
 .../external-arm-toolchain/files/SUPPORTED    |   1 -
 .../external-arm-toolchain/license.inc        |  79 --
 13 files changed, 1 insertion(+), 1337 deletions(-)
 delete mode 100644 ci/external-gccarm.yml
 delete mode 100755 ci/get-binary-toolchains
 delete mode 100644 meta-arm-toolchain/conf/distro/include/external-arm-t=
oolchain-versions.inc
 delete mode 100644 meta-arm-toolchain/conf/distro/include/tcmode-externa=
l-arm.inc
 delete mode 100644 meta-arm-toolchain/recipes-bsp/grub/grub%.bbappend
 delete mode 100644 meta-arm-toolchain/recipes-bsp/grub/grub-external-arm=
.inc
 delete mode 100644 meta-arm-toolchain/recipes-core/util-linux/util-linux=
_%.bbappend
 delete mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-tool=
chain/external-arm-sdk-toolchain.bb
 delete mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-tool=
chain/external-arm-toolchain.bb
 delete mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-tool=
chain/files/SUPPORTED
 delete mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-tool=
chain/license.inc

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 9dad9662..3e84d8b8 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -48,8 +48,6 @@ stages:
     - echo DL_DIR =3D $DL_DIR
     - rm -rf $KAS_WORK_DIR
     - mkdir --verbose --parents $KAS_WORK_DIR $KAS_REPO_REF_DIR $SSTATE_=
DIR $DL_DIR $TOOLCHAIN_DIR $TOOLCHAIN_LINK_DIR
-    # Must do this here, as it's the only way to make sure the toolchain=
 is installed on the same builder
-    - ./ci/get-binary-toolchains $DL_DIR $TOOLCHAIN_DIR $TOOLCHAIN_LINK_=
DIR
=20
 # Generalised fragment to do a Kas build
 .build:
@@ -118,7 +116,7 @@ update-repos:
 # Available options for building are (VIRT _must_ be last for ssh overri=
de)
 #  DISTRO: [poky, poky-altcfg, poky-tiny]
 #  KERNEL: [linux-yocto, linux-yocto-dev, linux-yocto-rt]
-#  TOOLCHAINS: [gcc, clang, external-gccarm]
+#  TOOLCHAINS: [gcc, clang]
 #  TCLIBC: [glibc, musl]
 #  FIRMWARE: [u-boot, edk2]
 #  TS: [none, trusted-services]
@@ -296,7 +294,6 @@ qemuarm-secureboot:
         TCLIBC: [glibc, musl]
         TESTING: testimage
       - DISTRO: [poky, poky-altcfg]
-        TOOLCHAINS: external-gccarm
         TESTING: testimage
       - KERNEL: linux-yocto-dev
         TESTING: testimage
diff --git a/ci/external-gccarm.yml b/ci/external-gccarm.yml
deleted file mode 100644
index 8985a1ba..00000000
--- a/ci/external-gccarm.yml
+++ /dev/null
@@ -1,13 +0,0 @@
-# yaml-language-server: $schema=3Dhttps://raw.githubusercontent.com/siem=
ens/kas/master/kas/schema-kas.json
-
-header:
-  version: 14
-
-local_conf_header:
-  cc: |
-    SKIP_RECIPE[gcc-cross-arm] =3D "Using external toolchain"
-    TCMODE =3D "external-arm"
-    EXTERNAL_TOOLCHAIN =3D "${TOPDIR}/toolchains/${TARGET_ARCH}"
-    # Disable ptest as this pulls target compilers, which don't
-    # work with external toolchain currently
-    DISTRO_FEATURES:remove =3D "ptest"
diff --git a/ci/get-binary-toolchains b/ci/get-binary-toolchains
deleted file mode 100755
index 793c6890..00000000
--- a/ci/get-binary-toolchains
+++ /dev/null
@@ -1,51 +0,0 @@
-#!/bin/bash
-set -u -e
-
-BASENAME=3Darm-gnu-toolchain
-VER=3D${VER:-13.3.rel1}
-HOST_ARCH=3D${HOST_ARCH:-$(uname -m)}
-
-# Use the standard kas container locations if nothing is passed into the=
 script
-DOWNLOAD_DIR=3D"${1:-/builds/persist/downloads/}"
-TOOLCHAIN_DIR=3D"${2:-/builds/persist//toolchains/}"
-TOOLCHAIN_LINK_DIR=3D"${3:-build/toolchains/}"
-
-# These should be already created by .gitlab-ci.yml, but do here if run =
outside of that env
-mkdir -p $DOWNLOAD_DIR $TOOLCHAIN_DIR $TOOLCHAIN_LINK_DIR
-
-download() {
-	TRIPLE=3D$1
-	URL=3Dhttps://developer.arm.com/-/media/Files/downloads/gnu/$VER/binrel=
/$BASENAME-$VER-$HOST_ARCH-$TRIPLE.tar.xz
-	wget -P $DOWNLOAD_DIR -nc $URL
-}
-
-if [ $HOST_ARCH =3D "aarch64" ]; then
-	# AArch64 Linux hosted cross compilers
-
-	# AArch32 target with hard float
-	download arm-none-linux-gnueabihf
-elif [ $HOST_ARCH =3D "x86_64" ]; then
-	# x86_64 Linux hosted cross compilers
-
-	# AArch32 target with hard float
-	download arm-none-linux-gnueabihf
-
-	# AArch64 GNU/Linux target
-	download aarch64-none-linux-gnu
-else
-	echo "ERROR - Unknown build arch of $HOST_ARCH"
-	exit 1
-fi
-
-for i in arm aarch64; do
-	if [ ! -d $TOOLCHAIN_DIR/$BASENAME-$VER-$HOST_ARCH-$i-none-linux-gnu*/ =
]; then
-		if [ ! -f $DOWNLOAD_DIR/$BASENAME-$VER-$HOST_ARCH-$i-none-linux-gnu*.t=
ar.xz ]; then
-			continue
-		fi
-
-		tar -C $TOOLCHAIN_DIR -axvf $DOWNLOAD_DIR/$BASENAME-$VER-$HOST_ARCH-$i=
-none-linux-gnu*.tar.xz
-	fi
-
-	# Setup a link for the toolchain to use local to the building machine (=
e.g., not in a shared location)
-	ln -s $TOOLCHAIN_DIR/$BASENAME-$VER-$HOST_ARCH-$i-none-linux-gnu* $TOOL=
CHAIN_LINK_DIR/$i
-done
diff --git a/meta-arm-toolchain/README.md b/meta-arm-toolchain/README.md
index 9830b95a..3263429c 100644
--- a/meta-arm-toolchain/README.md
+++ b/meta-arm-toolchain/README.md
@@ -6,70 +6,6 @@ This layer contains recipes for the prebuilt GNU Arm too=
lchains.
 Information regarding contributing, reporting bugs, etc can be found in =
the
 top-level meta-arm readme file.
=20
-Recipes for pre-built GNU Arm toolchain for Linux development are provid=
ed under
-``recipes-devtools/external-arm-toolchain/``.
-
-external-arm-toolchain.bb
-~~~~~~~~~~~~~~~~~~~~~~~~~
-
-This recipe provides support for pre-built GNU toolchains targeting proc=
essors
-from the Arm Cortex-A family and implementing the Arm A-profile architec=
ture.
-
-Usage
-^^^^^
-
-In order to use any of pre-built Arm toolchain versions (8.2, 8.3, 9.2 a=
nd so
-on), a user needs to download and untar tool-set on host machine at a pa=
rticular
-installation path eg: ``/opt/toolchain/``. Then user needs to specify fo=
llowing
-in ``conf/local.conf`` in order to replace OE toolchain with pre-built G=
NU-A
-toolchain:
-
-TCMODE =3D "external-arm"
-EXTERNAL_TOOLCHAIN =3D "<path-to-the-toolchain>"
-
--  Eg. for AArch64 (eg. qemuarm64 machine in poky distro)
-   EXTERNAL_TOOLCHAIN =3D "\
-     <installation-path>/gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-g=
nu \
-   "
-
--  Eg. for AArch32 (eg. qemuarm machine in poky distro)
-   EXTERNAL_TOOLCHAIN =3D "\
-     <installation-path>/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnuea=
bihf \
-   "
-
-Supported distros and machines
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
-
-Since this pre-built GNU-A tool-set simply replaces OE toolchain, so it =
is
-meant to be distro and machine agnostic as long as one is cross-compilin=
g for
-Arm A-profile architecture.
-
-Tested distro and machines (for zeus stable release):
-1.  Distro: poky; machines: qemuarm and qemuarm64 (build and boot tested=
)
-2.  Distro: RPB; machines: dragonboard-410c (build and boot tested)
-3.  Distro: world; machines: qemuarm and qemuarm64. Build tested for fol=
lowing
-    layers:
-    - poky/meta
-    - poky/meta-poky
-    - poky/meta-yocto-bsp
-    - meta-openembedded/meta-oe
-    - meta-openembedded/meta-python
-    - meta-openembedded/meta-networking
-
-SDK support
-^^^^^^^^^^^
-
-Pre-built toochain provides support to build OE SDK which has been teste=
d using
-following commands:
-
-$ bitbake core-image-base -c populate_sdk
-$ bitbake core-image-base -c testsdk
-
-Note: Currently generated SDK only uses glibc provided by pre-built tool=
chain.
-      The cross compiler, binutils, gdb/gdbserver etc. are built from so=
urce.
-      This is something we would like to improve in future in order to p=
ackage
-      most of the components from pre-built toolchain instead.
-
 Pre-built Arm toolchain for bare-metal development
 --------------------------------------------------
=20
diff --git a/meta-arm-toolchain/conf/distro/include/external-arm-toolchai=
n-versions.inc b/meta-arm-toolchain/conf/distro/include/external-arm-tool=
chain-versions.inc
deleted file mode 100644
index 675457d1..00000000
--- a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versi=
ons.inc
+++ /dev/null
@@ -1,134 +0,0 @@
-def eat_run(d, cmd, *args):
-    import bb.process
-    import subprocess
-
-    topdir =3D d.getVar('TOPDIR', True)
-    toolchain_path =3D d.getVar('EXTERNAL_TOOLCHAIN', True)
-    if not toolchain_path:
-        return 'UNKNOWN', 'UNKNOWN'
-
-    target_prefix =3D d.getVar('TARGET_PREFIX', True)
-    path =3D os.path.join(toolchain_path, 'bin', target_prefix + cmd)
-    args =3D [path] + list(args)
-
-    return bb.process.run(args, cwd=3Dtopdir, stderr=3Dsubprocess.PIPE)
-
-def eat_get_version(d):
-    try:
-        stdout, stderr =3D eat_run(d, 'gcc', '-v')
-    except bb.process.CmdError as exc:
-        bb.error('Failed to obtain external Arm toolchain version: %s' %=
 exc)
-        return 'UNKNOWN'
-    else:
-        last_line =3D stderr.splitlines()[-1]
-        return last_line
-
-# Extract the YYYY.MM or release version
-def eat_get_main_version(d):
-    version =3D eat_get_version(d)
-    bb.debug(2, 'Trying for parse version info from: %s' % version)
-    if version !=3D 'UNKNOWN':
-        if version.split()[4] =3D=3D '(Arm':
-            # gcc version 11.3.1 20220712 (Arm GNU Toolchain 11.3.Rel1)
-            return version.split()[7].split(')')[0]
-        elif version.split()[4] =3D=3D '(GNU':
-            # gcc version 9.2.1 20191025 (GNU Toolchain for the A-profil=
e Architecture 9.2-2019.12 (arm-9.10))
-            # gcc version 8.2.1 20180802 (GNU Toolchain for the A-profil=
e Architecture 8.2-2018.11 (arm-rel-8.26))
-            return version.split()[10].split('-')[1]
-        elif version.split()[3] =3D=3D '(GNU':
-            # gcc version 8.3.0 (GNU Toolchain for the A-profile Archite=
cture 8.3-2019.03 (arm-rel-8.36))
-            return version.split()[9].split('-')[1]
-        else:
-            bb.error('Failed to parse external Arm toolchain version fro=
m: %s' % version)
-    else:
-        return version
-
-# Extract the x.y.z version from 'gcc version 4.9.1'
-def eat_get_gcc_version(d):
-    version =3D eat_get_version(d)
-    if version !=3D 'UNKNOWN':
-        return version.split()[2]
-    else:
-        return version
-
-def eat_get_libc_version(d):
-    import os,bb
-    import subprocess
-
-    syspath =3D bb.data.expand('${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}'=
, d)
-    if not syspath:
-        return 'UNKNOWN'
-
-    topdir =3D d.getVar('TOPDIR', True)
-    lddpath =3D syspath + '/libc/usr/bin/ldd'
-
-    if os.path.exists(lddpath):
-        cmd =3D '/bin/sh ' + lddpath + ' --version'
-        try:
-            stdout, stderr =3D bb.process.run(cmd, cwd=3Dtopdir, stderr=3D=
subprocess.PIPE)
-        except bb.process.CmdError as exc:
-            bb.error('Failed to obtain external Arm libc version: %s' % =
exc)
-            return 'UNKNOWN'
-        else:
-            first_line =3D stdout.splitlines()[0]
-            return first_line.split()[2]
-
-    return 'UNKNOWN'
-
-def eat_get_kernel_version(d):
-    import os,bb
-    syspath =3D bb.data.expand('${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}'=
, d)
-    if not syspath:
-        return 'UNKNOWN'
-
-    vf =3D syspath + '/libc/usr/include/linux/version.h'
-
-    try:
-        f =3D open(vf, 'r')
-    except (OSError, IOError):
-        return 'UNKNOWN'
-
-    l =3D f.readlines();
-    f.close();
-    for s in l:
-        if s.find('LINUX_VERSION_CODE') > 0:
-            ver =3D int(s.split()[2])
-            maj =3D ver / 65536
-            ver =3D ver % 65536
-            min =3D ver / 256
-            ver =3D ver % 256
-            return str(maj)+'.'+str(min)+'.'+str(ver)
-    return 'UNKNOWN'
-
-def eat_get_gdb_version(d):
-    try:
-        stdout, stderr =3D eat_run(d, 'gdb', '-v')
-    except bb.process.CmdError:
-        return 'UNKNOWN'
-    else:
-        first_line =3D stdout.splitlines()[0]
-        return first_line.split()[-1]
-
-def eat_get_bfd_version(d):
-    try:
-        stdout, stderr =3D eat_run(d, 'as', '--version')
-    except bb.process.CmdError:
-        return 'UNKNOWN'
-    else:
-        first_line =3D stdout.splitlines()[0]
-        return first_line.split()[-1]
-
-python external_arm_toolchain_version_handler () {
-    if not isinstance(e, bb.event.ConfigParsed):
-        return
-    d =3D e.data
-    ld =3D d.createCopy()
-
-    d.setVar('EAT_VER_MAIN', eat_get_main_version(ld))
-    d.setVar('EAT_VER_GCC', eat_get_gcc_version(ld))
-    d.setVar('EAT_VER_LIBC', eat_get_libc_version(ld))
-    d.setVar('EAT_VER_KERNEL', eat_get_kernel_version(ld))
-    d.setVar('EAT_VER_GDB', eat_get_gdb_version(ld))
-    d.setVar('EAT_VER_BFD', eat_get_bfd_version(ld))
-}
-addhandler external_arm_toolchain_version_handler
diff --git a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.i=
nc b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
deleted file mode 100644
index 0ac71264..00000000
--- a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
+++ /dev/null
@@ -1,133 +0,0 @@
-#
-# Configuration to use an external Arm binary toolchain
-#
-
-EXTERNAL_TOOLCHAIN ?=3D "/usr/local/arm-binary-toolchain/${TARGET_ARCH}"
-
-# oe-core passes this by default because it assumes GCC 13. This can be =
removed when Arm GCC is 13.1+.
-DEBUG_PREFIX_MAP:remove =3D "-fcanon-prefix-map"
-
-TOOLCHAIN_PATH_ADD =3D "${EXTERNAL_TOOLCHAIN}/bin:"
-PATH =3D. "${TOOLCHAIN_PATH_ADD}"
-
-EAT_TARGET_SYS:arm ?=3D "${@ 'arm-none-linux-gnueabihf' if os.path.exist=
s('${EXTERNAL_TOOLCHAIN}/bin/arm-none-linux-gnueabihf-gcc') else 'arm-lin=
ux-gnueabihf'}"
-EAT_TARGET_SYS:aarch64 ?=3D "${@ 'aarch64-none-linux-gnu' if os.path.exi=
sts('${EXTERNAL_TOOLCHAIN}/bin/aarch64-none-linux-gnu-gcc') else 'aarch64=
-linux-gnu'}"
-EAT_TARGET_SYS =3D "${TARGET_SYS}"
-TARGET_PREFIX =3D "${EAT_TARGET_SYS}-"
-
-EXTERNAL_TOOLCHAIN_LIBDIR =3D "${@bb.utils.contains('DISTRO_FEATURES', '=
usrmerge', '/usr/lib', '/lib', d)}"
-EXTERNAL_TOOLCHAIN_DYN_LINKER_PATH:arm ?=3D " -Wl,--dynamic-linker=3D${E=
XTERNAL_TOOLCHAIN_LIBDIR}/ld-linux-armhf.so.3"
-EXTERNAL_TOOLCHAIN_DYN_LINKER_PATH:aarch64 ?=3D " -Wl,--dynamic-linker=3D=
${EXTERNAL_TOOLCHAIN_LIBDIR}/ld-linux-aarch64.so.1"
-TARGET_LDFLAGS:append:class-target =3D "${EXTERNAL_TOOLCHAIN_DYN_LINKER_=
PATH}"
-
-EAT_LIBDIR:arm =3D "lib"
-EAT_LIBDIR:aarch64 =3D "lib64"
-
-GCCMULTILIB:forcevariable =3D "--disable-multilib"
-IMAGE_LINGUAS:forcevariable =3D ""
-
-# Blacklist toolchain recipes as a belt-and-suspenders way to use the ex=
ternal toolchain
-SKIP_RECIPE[glibc] =3D "Using external toolchain"
-SKIP_RECIPE[libgcc] =3D "Using external toolchain"
-SKIP_RECIPE[gcc-cross] =3D "Using external toolchain"
-SKIP_RECIPE[gcc-cross-aarch64] =3D "Using external toolchain"
-SKIP_RECIPE[gcc-cross-arm] =3D "Using external toolchain"
-SKIP_RECIPE[gcc-runtime] =3D "Using external toolchain"
-SKIP_RECIPE[gcc-sanitizers] =3D "Using external toolchain"
-
-PREFERRED_PROVIDER_linux-libc-headers =3D "external-arm-toolchain"
-PREFERRED_PROVIDER_linux-libc-headers-dev =3D "external-arm-toolchain"
-PREFERRED_PROVIDER_virtual/cross-cc =3D "external-arm-toolchain"
-PREFERRED_PROVIDER_virtual/cross-c++ =3D "external-arm-toolchain"
-PREFERRED_PROVIDER_virtual/cross-binutils =3D "external-arm-toolchain"
-PREFERRED_PROVIDER_virtual/compilerlibs =3D "external-arm-toolchain"
-PREFERRED_PROVIDER_glibc =3D "external-arm-toolchain"
-PREFERRED_PROVIDER_libgcc =3D "external-arm-toolchain"
-PREFERRED_PROVIDER_virtual/libc =3D "external-arm-toolchain"
-PREFERRED_PROVIDER_virtual/libc-locale =3D "external-arm-toolchain"
-PREFERRED_PROVIDER_virtual/libintl =3D "external-arm-toolchain"
-PREFERRED_PROVIDER_virtual/libiconv =3D "external-arm-toolchain"
-PREFERRED_PROVIDER_virtual/crypt =3D "external-arm-toolchain"
-PREFERRED_PROVIDER_glibc-thread-db =3D "external-arm-toolchain"
-PREFERRED_PROVIDER_glibc-mtrace =3D "external-arm-toolchain"
-PREFERRED_PROVIDER_libc-mtrace =3D "external-arm-toolchain"
-PREFERRED_PROVIDER_virtual/linux-libc-headers =3D "external-arm-toolchai=
n"
-
-# Keep nativesdk toolchain using GCC
-PREFERRED_PROVIDER_virtual/nativesdk-cross-binutils ?=3D "binutils-cross=
sdk-${SDK_SYS}"
-PREFERRED_PROVIDER_virtual/nativesdk-cross-cc =3D "gcc-crosssdk-${SDK_SY=
S}"
-PREFERRED_PROVIDER_virtual/nativesdk-cross-c++ =3D "gcc-crosssdk-${SDK_S=
YS}"
-PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs =3D "nativesdk-gcc-run=
time"
-
-PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?=3D "ex=
ternal-arm-sdk-toolchain-${TRANSLATED_TARGET_ARCH}"
-PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?=3D=
 "external-arm-sdk-toolchain-${TRANSLATED_TARGET_ARCH}"
-PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} ?=3D "ex=
ternal-arm-sdk-toolchain-${TRANSLATED_TARGET_ARCH}"
-
-TOOLCHAIN_OPTIONS =3D " --sysroot=3D${STAGING_DIR_HOST}"
-
-DISTRO_FEATURES_LIBC =3D "ipv4 ipv6 libc-backtrace libc-big-macros libc-=
bsd libc-cxx-tests libc-catgets libc-crypt \
-			libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt libc-fmtmsg libc-f=
stab libc-ftraverse \
-			libc-getlogin libc-idn libc-inet-anl libc-libm libc-libm-big \
-			libc-locales libc-locale-code libc-charsets \
-			libc-memusage libc-nis libc-nsswitch libc-rcmd libc-rtld-debug libc-s=
pawn libc-streams libc-sunrpc \
-			libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar libc-posix-r=
egexp libc-posix-regexp-glibc \
-			libc-posix-wchar-io"
-
-ENABLE_BINARY_LOCALE_GENERATION =3D "0"
-GLIBC_INTERNAL_USE_BINARY_LOCALE =3D "precompiled"
-LIBCOVERRIDE =3D ":libc-glibc"
-LIBC_DEPENDENCIES:remove =3D "glibc-gconv-cp1252 glibc-gconv-ibm850 glib=
c-gconv-iso8859-1 glibc-gconv-iso8859-15 glibc-localedata-i18n"
-
-ERROR_QA[type] ?=3D "list"
-python toolchain_metadata_setup () {
-    import subprocess
-    if not isinstance(e, bb.event.ConfigParsed):
-        return
-
-    d =3D e.data
-    l =3D d.createCopy()
-
-    external_toolchain =3D l.getVar('EXTERNAL_TOOLCHAIN', True)
-    if not external_toolchain or external_toolchain =3D=3D 'UNDEFINED':
-        bb.fatal("Error: EXTERNAL_TOOLCHAIN must be set to the path to y=
our arm toolchain")
-
-    if not os.path.isabs(external_toolchain):
-        bb.fatal("Error: EXTERNAL_TOOLCHAIN path '%s' must be absolute p=
ath" % external_toolchain)
-
-    if not os.path.exists(external_toolchain):
-        bb.fatal("Error: EXTERNAL_TOOLCHAIN path '%s' does not exist" % =
external_toolchain)
-
-    # The external toolchain may not have been built with the oe-core pr=
eferred
-    # gnu hash setting, so ensure that the corresponding sanity check is=
 not an error.
-    error_qa =3D oe.data.typed_value('ERROR_QA', l)
-    if 'ldflags' in error_qa:
-        error_qa.remove('ldflags')
-        d.setVar('ERROR_QA', ' '.join(error_qa))
-}
-addhandler toolchain_metadata_setup
-
-def populate_toolchain_links(d):
-    import errno
-    import os
-    from glob import glob
-
-    d =3D d.createCopy()
-
-    pattern =3D bb.data.expand('${EXTERNAL_TOOLCHAIN}/bin/${TARGET_PREFI=
X}*', d)
-    files =3D glob(pattern)
-    if not files:
-        bb.fatal("Unable to populate toolchain binary symlinks")
-
-    bindir =3D d.getVar('STAGING_BINDIR_TOOLCHAIN', True)
-    bb.mkdirhier(bindir)
-    for f in files:
-        base =3D os.path.basename(f)
-        newpath =3D os.path.join(bindir, base)
-        try:
-            os.symlink(f, newpath)
-        except OSError as exc:
-            if exc.errno =3D=3D errno.EEXIST:
-                break
-            bb.fatal("Unable to populate toolchain binary symlink for %s=
: %s" % (newpath, exc))
-
-require conf/distro/include/external-arm-toolchain-versions.inc
diff --git a/meta-arm-toolchain/recipes-bsp/grub/grub%.bbappend b/meta-ar=
m-toolchain/recipes-bsp/grub/grub%.bbappend
deleted file mode 100644
index 37383d47..00000000
--- a/meta-arm-toolchain/recipes-bsp/grub/grub%.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-require ${@oe.utils.conditional('TCMODE', 'external-arm', 'grub-external=
-arm.inc', '', d)}
diff --git a/meta-arm-toolchain/recipes-bsp/grub/grub-external-arm.inc b/=
meta-arm-toolchain/recipes-bsp/grub/grub-external-arm.inc
deleted file mode 100644
index dc260bed..00000000
--- a/meta-arm-toolchain/recipes-bsp/grub/grub-external-arm.inc
+++ /dev/null
@@ -1,5 +0,0 @@
-# grub uses --target triplet to find binutils binaries such as objcopy
-# Since external-arm toolchain uses aarch64-none-linux-gnu triplet,
-# OE-defined TARGET_SYS differs from EAT_TARGET_SYS used by external-arm
-# toolchain, grub needs passing the correct --target to configure script
-CONFIGUREOPTS:append:class-target =3D " --target=3D${EAT_TARGET_SYS}"
diff --git a/meta-arm-toolchain/recipes-core/util-linux/util-linux_%.bbap=
pend b/meta-arm-toolchain/recipes-core/util-linux/util-linux_%.bbappend
deleted file mode 100644
index 75227a56..00000000
--- a/meta-arm-toolchain/recipes-core/util-linux/util-linux_%.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-PACKAGECONFIG:remove =3D "${@bb.utils.contains('TCMODE', 'external-arm',=
 'libmount-mountfd-support', '' , d)}"
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/e=
xternal-arm-sdk-toolchain.bb b/meta-arm-toolchain/recipes-devtools/extern=
al-arm-toolchain/external-arm-sdk-toolchain.bb
deleted file mode 100644
index 138245d1..00000000
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external=
-arm-sdk-toolchain.bb
+++ /dev/null
@@ -1,143 +0,0 @@
-inherit cross-canadian
-
-require license.inc
-
-PN =3D "external-arm-sdk-toolchain-${TARGET_ARCH}"
-BPN =3D "external-arm-sdk-toolchain"
-PV =3D "${EAT_VER_MAIN}"
-
-INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
-INHIBIT_PACKAGE_STRIP =3D "1"
-INHIBIT_SYSROOT_STRIP =3D "1"
-INHIBIT_DEFAULT_DEPS =3D "1"
-EXCLUDE_FROM_SHLIBS =3D "1"
-
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
-
-# Skip packaging QA checks for prebuilt binaries
-INSANE_SKIP:gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "dev-so sta=
ticdev file-rdeps libdir"
-INSANE_SKIP:gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "dev-so fil=
e-rdeps"
-INSANE_SKIP:binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "dev-s=
o file-rdeps"
-
-# Skip file dependencies in RPM for prebuilt binaries
-SKIP_FILEDEPS =3D "1"
-
-PROVIDES =3D "\
-	gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} \
-	gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} \
-	binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} \
-"
-
-PACKAGES =3D "\
-	gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} \
-	gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} \
-	binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} \
-"
-
-# Adjust defaults in line with external toolchain
-bindir =3D "${exec_prefix}/bin"
-libdir =3D "${exec_prefix}/lib"
-libexecdir =3D "${exec_prefix}/libexec"
-datadir =3D "${exec_prefix}/share"
-gcclibdir =3D "${libdir}/gcc"
-
-FILES:gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "\
-	${prefix}/${EAT_TARGET_SYS}/lib/libstdc++.* \
-	${prefix}/${EAT_TARGET_SYS}/lib/libgcc_s.* \
-	${prefix}/${EAT_TARGET_SYS}/lib/libsupc++.* \
-	${prefix}/${EAT_TARGET_SYS}/include \
-	${gcclibdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/* \
-	${bindir}/${TARGET_PREFIX}gcov \
-	${bindir}/${TARGET_PREFIX}gcc* \
-	${bindir}/${TARGET_PREFIX}g++ \
-	${bindir}/${TARGET_PREFIX}cpp \
-	${libexecdir}/* \
-"
-
-FILES:gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "\
-	${bindir}/${TARGET_PREFIX}gdb* \
-	${datadir}/gdb/* \
-"
-
-FILES:binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "\
-	${prefix}/${EAT_TARGET_SYS}/bin/ld* \
-	${prefix}/${EAT_TARGET_SYS}/bin/objcopy \
-	${prefix}/${EAT_TARGET_SYS}/bin/strip \
-	${prefix}/${EAT_TARGET_SYS}/bin/nm \
-	${prefix}/${EAT_TARGET_SYS}/bin/ranlib \
-	${prefix}/${EAT_TARGET_SYS}/bin/as \
-	${prefix}/${EAT_TARGET_SYS}/bin/ar \
-	${prefix}/${EAT_TARGET_SYS}/bin/objdump \
-	${prefix}/${EAT_TARGET_SYS}/lib/ldscripts/* \
-	${bindir}/${TARGET_PREFIX}ld* \
-	${bindir}/${TARGET_PREFIX}addr2line \
-	${bindir}/${TARGET_PREFIX}objcopy \
-	${bindir}/${TARGET_PREFIX}readelf \
-	${bindir}/${TARGET_PREFIX}strip \
-	${bindir}/${TARGET_PREFIX}nm \
-	${bindir}/${TARGET_PREFIX}ranlib \
-	${bindir}/${TARGET_PREFIX}gprof \
-	${bindir}/${TARGET_PREFIX}as \
-	${bindir}/${TARGET_PREFIX}c++filt \
-	${bindir}/${TARGET_PREFIX}ar \
-	${bindir}/${TARGET_PREFIX}strings \
-	${bindir}/${TARGET_PREFIX}objdump \
-	${bindir}/${TARGET_PREFIX}size \
-"
-
-DESCRIPTION:gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "The GNU cc=
 and gcc C compilers"
-DESCRIPTION:gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "gdb - GNU =
debugger"
-DESCRIPTION:binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "A GNU=
 collection of binary utilities"
-
-LICENSE:gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "${EAT_GCC_LICE=
NSE}"
-LICENSE:gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "${EAT_GDB_LICE=
NSE}"
-LICENSE:binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "${EAT_BFD=
_LICENSE}"
-
-PKGV:gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "${EAT_VER_GCC}"
-PKGV:gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "${EAT_VER_GDB}"
-PKGV:binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "${EAT_VER_BF=
D}"
-
-do_install() {
-	install -d ${D}${prefix}/${EAT_TARGET_SYS}/bin
-	install -d ${D}${prefix}/${EAT_TARGET_SYS}/lib
-	install -d ${D}${prefix}/${EAT_TARGET_SYS}/include
-	install -d ${D}${bindir}
-	install -d ${D}${libdir}
-	install -d ${D}${prefix}/${EAT_TARGET_SYS}/lib/ldscripts
-	install -d ${D}${libexecdir}
-	install -d ${D}${datadir}/gdb
-	install -d ${D}${gcclibdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include
-
-	CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downership"
-
-	# gcc
-	for i in libstdc++.* libgcc_s.* libsupc++.*; do
-		cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/${EAT_LIBDIR}/$i=
 ${D}${prefix}/${EAT_TARGET_SYS}/lib
-	done
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/include/* ${D}${p=
refix}/${EAT_TARGET_SYS}/include
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/* ${D}${gcclibdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}
-	for i in gcov gcc* g++ cpp; do
-		cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/bin/${TARGET_PREFIX}$i ${D}${bindi=
r}
-	done
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/libexec/* ${D}${libexecdir}
-
-	# gdb
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/bin/${TARGET_PREFIX}gdb* ${D}${bind=
ir}
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/share/gdb/* ${D}${datadir}/gdb/
-
-	# binutils
-	for i in ld* objcopy strip nm ranlib as ar objdump; do
-		cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/bin/$i ${D}${pre=
fix}/${EAT_TARGET_SYS}/bin
-	done
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/lib/ldscripts/* $=
{D}${prefix}/${EAT_TARGET_SYS}/lib/ldscripts
-	for i in ld* addr2line objcopy readelf strip nm ranlib gprof as c++filt=
 ar strings objdump size; do
-		cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/bin/${TARGET_PREFIX}$i ${D}${bindi=
r}
-	done
-}
-
-python () {
-    if not d.getVar("EAT_VER_MAIN", False):
-        raise bb.parse.SkipPackage("External ARM toolchain not configure=
d (EAT_VER_MAIN not set).")
-    if d.getVar('TCLIBC', True) !=3D "glibc":
-        raise bb.parse.SkipPackage("incompatible with %s" % d.getVar('TC=
LIBC', True))
-}
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/e=
xternal-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-a=
rm-toolchain/external-arm-toolchain.bb
deleted file mode 100644
index 0463b867..00000000
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external=
-arm-toolchain.bb
+++ /dev/null
@@ -1,708 +0,0 @@
-require recipes-core/glibc/glibc-package.inc
-
-require license.inc
-
-INHIBIT_DEFAULT_DEPS =3D "1"
-
-LIC_FILES_CHKSUM =3D "\
-	file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0bcf8506ecda2f7b4f302=
 \
-	file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de20=
420 \
-"
-
-PROVIDES +=3D "\
-	linux-libc-headers \
-	virtual/cross-cc \
-	virtual/cross-c++ \
-	virtual/binutils \
-	virtual/compilerlibs \
-	virtual/libc \
-	virtual/libintl \
-	virtual/libiconv \
-	virtual/crypt \
-	glibc-mtrace \
-	glibc-thread-db \
-	glibc \
-	libc-mtrace \
-	gcc-runtime \
-	libgcc \
-	libg2c \
-	libg2c-dev \
-	libssp \
-	libssp-dev \
-	libssp-staticdev \
-	libgfortran \
-	libgfortran-dev \
-	libgfortran-staticdev \
-	libmudflap \
-	libmudflap-dev \
-	libgomp \
-	libgomp-dev \
-	libgomp-staticdev \
-	libitm \
-	libitm-dev \
-	libitm-staticdev \
-	libquadmath \
-	libquadmath-dev \
-	libquadmath-staticdev \
-	virtual/linux-libc-headers \
-	libgcov-staticdev \
-	virtual/libc-locale \
-"
-
-PV =3D "${EAT_VER_MAIN}"
-
-BINV =3D "${EAT_VER_GCC}"
-
-SRC_URI =3D "file://SUPPORTED"
-S =3D "${WORKDIR}/sources"
-UNPACKDIR =3D "${S}"
-
-do_install() {
-        # do_copy_locale expects SUPPORTED to be in WORKDIR, but recent
-        # changes have made it so that the source/unpack location is no
-        # longer WORKDIR and cannot be pointed to be such.  So, do this
-        # copy manually here
-        install -m 0644 ${UNPACKDIR}/SUPPORTED ${WORKDIR}/SUPPORTED
-
-	# Add stubs for files OE-core expects
-	install -d ${S}/nscd/
-	touch  ${S}/nscd/nscd.init
-	touch  ${S}/nscd/nscd.conf
-	touch  ${S}/nscd/nscd.service
-	touch  ${S}/../makedbs.sh
-
-	install -d ${D}${base_libdir}
-	install -d ${D}${base_sbindir}
-	install -d ${D}${bindir}
-	install -d ${D}${sbindir}
-	install -d ${D}${libdir}
-	install -d ${D}${libexecdir}
-	install -d ${D}${datadir}
-	install -d ${D}${includedir}
-	install -d ${D}/include
-	install -d ${D}${libdir}/${TARGET_SYS}/${EAT_VER_GCC}
-	install -d ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/include
-
-	CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downership"
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/${EAT_LIBDIR}/*  =
${D}${base_libdir}
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/${EAT_LIBDIR=
}/*  ${D}${base_libdir}
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/${EAT_LI=
BDIR}/*  ${D}${libdir}
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/share/* =
 ${D}${datadir}
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/include/=
*  ${D}${includedir}
-
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/include/* ${D}${i=
ncludedir}
-	if [ -d ${D}${includedir}/c++/${EAT_VER_GCC}/${EAT_TARGET_SYS} ]; then
-		mv ${D}${includedir}/c++/${EAT_VER_GCC}/${EAT_TARGET_SYS} ${D}${includ=
edir}/c++/${EAT_VER_GCC}/${TARGET_SYS}
-	fi
-	ln -sf ../usr/include/c++ ${D}/include/c++
-
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/bin/* ${=
D}${bindir}
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/usr/sbin/* $=
{D}${sbindir}
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/sbin/* ${D}$=
{base_sbindir}
-	rm -rf ${D}${bindir}/gdbserver
-	sed -i -e 's#/arm/tools/gnu/bash/4.2/rhe6-x86_64##' ${D}${bindir}/tzsel=
ect
-	sed -i -e 's#/arm/tools/gnu/bash/4.2/rhe6-x86_64##' ${D}${bindir}/ldd
-	sed -i -e 's#/usr/bin/bash#/bin/sh#' ${D}${bindir}/tzselect
-	sed -i -e 's#/usr/bin/bash#/bin/sh#' ${D}${bindir}/ldd
-	sed -i -e 's#/bin/bash#/bin/sh#' ${D}${bindir}/tzselect
-	sed -i -e 's#/bin/bash#/bin/sh#' ${D}${bindir}/ldd
-
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/crt*.o ${D}${libdir}/${TARGET_SYS}/${EAT_VER_GCC}/
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/libgcc* ${D}${libdir}/${TARGET_SYS}/${EAT_VER_GCC}/
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/libgcov* ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/include/ssp ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/include =
|| true
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/include/sanitizers ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/i=
nclude || true
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/include/quadmath* ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/in=
clude || true
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/include/omp.h ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/includ=
e || true
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/include/openacc.h ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/in=
clude || true
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER=
_GCC}/finclude ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/
-
-	# fix up the copied symlinks (they are still pointing to the multiarch =
directory)
-	linker_name=3D"${@bb.utils.contains("TUNE_FEATURES", "aarch64", "ld-lin=
ux-aarch64.so.1", bb.utils.contains("TUNE_FEATURES", "callconvention-hard=
", "ld-linux-armhf.so.3", "ld-linux.so.3",d), d)}"
-	if [ -f ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/${EAT_LIBDIR}/ld-$=
{EAT_VER_LIBC}.so ]; then
-		ln -sf ld-${EAT_VER_LIBC}.so ${D}${base_libdir}/${linker_name}
-	else
-		cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/libc/lib/${linke=
r_name} ${D}${base_libdir}/
-	fi
-
-	if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'false', 'true',=
 d)}; then
-		ln -sf ../../lib/librt.so.1 ${D}${libdir}/librt.so
-		ln -sf ../../lib/libcrypt.so.1 ${D}${libdir}/libcrypt.so
-		ln -sf ../../lib/libresolv.so.2 ${D}${libdir}/libresolv.so
-		ln -sf ../../lib/libnss_hesiod.so.2 ${D}${libdir}/libnss_hesiod.so
-		ln -sf ../../lib/libutil.so.1 ${D}${libdir}/libutil.so
-		ln -sf ../../lib/libBrokenLocale.so.1 ${D}${libdir}/libBrokenLocale.so
-		ln -sf ../../lib/libpthread.so.0 ${D}${libdir}/libpthread.so
-		ln -sf ../../lib/libthread_db.so.1 ${D}${libdir}/libthread_db.so
-		ln -sf ../../lib/libanl.so.1 ${D}${libdir}/libanl.so
-		ln -sf ../../lib/libdl.so.2 ${D}${libdir}/libdl.so
-		ln -sf ../../lib/libnss_db.so.2 ${D}${libdir}/libnss_db.so
-		ln -sf ../../lib/libnss_dns.so.2 ${D}${libdir}/libnss_dns.so
-		ln -sf ../../lib/libnss_files.so.2 ${D}${libdir}/libnss_files.so
-		ln -sf ../../lib/libnss_compat.so.2 ${D}${libdir}/libnss_compat.so
-		ln -sf ../../lib/libm.so.6 ${D}${libdir}/libm.so
-		ln -sf ../../lib/libc_malloc_debug.so.0 ${D}${libdir}/libc_malloc_debu=
g.so
-		if [ -f ${D}${base_libdir}/libmvec.so.1 ]; then
-			ln -sf ../../lib/libmvec.so.1 ${D}${libdir}/libmvec.so
-		fi
-
-		# remove potential .so duplicates from base_libdir
-		# for all symlinks created above in libdir
-		rm -f ${D}${base_libdir}/librt.so
-		rm -f ${D}${base_libdir}/libcrypt.so
-		rm -f ${D}${base_libdir}/libresolv.so
-		rm -f ${D}${base_libdir}/libnss_hesiod.so
-		rm -f ${D}${base_libdir}/libutil.so
-		rm -f ${D}${base_libdir}/libBrokenLocale.so
-		rm -f ${D}${base_libdir}/libpthread.so
-		rm -f ${D}${base_libdir}/libthread_db.so
-		rm -f ${D}${base_libdir}/libanl.so
-		rm -f ${D}${base_libdir}/libdl.so
-		rm -f ${D}${base_libdir}/libnss_db.so
-		rm -f ${D}${base_libdir}/libnss_dns.so
-		rm -f ${D}${base_libdir}/libnss_files.so
-		rm -f ${D}${base_libdir}/libnss_compat.so
-		rm -f ${D}${base_libdir}/libm.so
-		rm -f ${D}${base_libdir}/libmvec.so
-
-		# Move these completely to ${libdir} and delete duplicates in ${base_l=
ibdir}
-		for lib in asan hwasan atomic gfortran gomp itm lsan sanitizer stdc++ =
tsan ubsan; do
-			if [ -e ${D}${base_libdir}/lib${lib}.spec ] ; then
-				mv ${D}${base_libdir}/lib${lib}.spec ${D}${libdir}
-			fi
-			if [ -e ${D}${base_libdir}/lib${lib}.a ] ; then
-				mv ${D}${base_libdir}/lib${lib}.a ${D}${libdir}
-			fi
-			rm -f ${D}${base_libdir}/lib${lib}*
-		done
-
-		# Clean up duplicate libs that are both in base_libdir and libdir
-		rm -f ${D}${libdir}/libgcc*
-	else
-		ln -sf libcrypt.so.1 ${D}${libdir}/libcrypt.so
-		ln -sf libresolv.so.2 ${D}${libdir}/libresolv.so
-		ln -sf libnss_hesiod.so.2 ${D}${libdir}/libnss_hesiod.so
-		ln -sf libutil.so.1 ${D}${libdir}/libutil.so
-		ln -sf libBrokenLocale.so.1 ${D}${libdir}/libBrokenLocale.so
-		ln -sf libpthread.so.0 ${D}${libdir}/libpthread.so
-		ln -sf libthread_db.so.1 ${D}${libdir}/libthread_db.so
-		ln -sf libanl.so.1 ${D}${libdir}/libanl.so
-		ln -sf libdl.so.2 ${D}${libdir}/libdl.so
-		ln -sf libnss_db.so.2 ${D}${libdir}/libnss_db.so
-		ln -sf libnss_dns.so.2 ${D}${libdir}/libnss_dns.so
-		ln -sf libnss_files.so.2 ${D}${libdir}/libnss_files.so
-		ln -sf libnss_compat.so.2 ${D}${libdir}/libnss_compat.so
-		ln -sf libm.so.6 ${D}${libdir}/libm.so
-		ln -sf libc_malloc_debug.so.0 ${D}${libdir}/libc_malloc_debug.so
-		if [ -f ${D}${libdir}/libmvec.so.1 ]; then
-			ln -sf libmvec.so.1 ${D}${libdir}/libmvec.so
-		fi
-	fi
-
-	# Besides ld-${EAT_VER_LIBC}.so, other libs can have duplicates like li=
b*-${EAT_VER_LIBC}.so
-	# Only remove them if both are regular files and are identical
-	for i in ${D}${base_libdir}/lib*-${EAT_VER_LIBC}.so; do
-		if [ ! -e $i ] ; then
-			continue
-		fi
-
-		f=3D$(echo $i | sed 's/-${EAT_VER_LIBC}//')
-		l=3D$(ls $f.*)
-		if [ $(readlink -f $i ) =3D $l ]; then
-			echo "$i is a symlink of $l, keep it"
-		elif [ $(readlink -f $l ) =3D $i ]; then
-			echo "$l is a symlink of $i, keep it"
-		else
-			cmp -s $i $l
-			if [ $? -eq 0 ]; then
-				echo "$i is a duplicate of $l, remove it"
-				rm $i
-			else
-				echo "$i and $l are different files, keep them both"
-			fi
-		fi
-	done
-
-	if [ -d ${D}${base_libdir}/arm-linux-gnueabi ]; then
-	   rm -rf ${D}${base_libdir}/arm-linux-gnueabi
-	fi
-
-	if [ -d ${D}${base_libdir}/ldscripts ]; then
-	   rm -rf ${D}${base_libdir}/ldscripts
-	fi
-
-	# Provided by libnsl2
-	rm -rf ${D}${includedir}/rpcsvc/yppasswd.*
-	# Provided by quota
-	rm -rf ${D}${includedir}/rpcsvc/rquota.*
-
-	if [ -f ${D}${libdir}/libc.so ];then
-		sed -i -e "s# /usr/${EAT_LIBDIR}/# /usr/lib/#g" -e "s# /${EAT_LIBDIR}/=
ld-linux# ../../${base_libdir}/ld-linux#g" ${D}${libdir}/libc.so
-		sed -i -e "s# /${EAT_LIBDIR}/libc.so.6# /lib/libc.so.6#g" ${D}${libdir=
}/libc.so
-		sed -i -e "s# /lib# ../../${base_libdir}#g" -e "s# /usr/lib# .#g" ${D}=
${libdir}/libc.so
-	fi
-
-	if [ -f ${D}${base_libdir}/libc.so ];then
-		sed -i -e "s# /${EAT_LIBDIR}/# /lib/#g" ${D}${base_libdir}/libc.so
-		if [ -f ${D}${base_libdir}/libc.so.6 ]; then
-			sed -i -e "s# /usr/${EAT_LIBDIR}/libc.so.6# /lib/libc.so.6#g" -e "s# =
/${EAT_LIBDIR}/libc.so.6# /lib/libc.so.6#g" ${D}${base_libdir}/libc.so.6
-		fi
-	fi
-
-	# Remove if empty
-	rmdir ${D}${bindir} || true
-	rmdir ${D}${sbindir} || true
-	rmdir ${D}${base_sbindir} || true
-	rmdir ${D}${libexecdir} || true
-
-	# Remove unused /usr/share/info/dir
-	rm -f ${D}${infodir}/dir
-}
-
-# External toolchain doesn't provide multilib support so make correspond=
ing
-# install API as an empty API to avoid an unnecessary errors.
-oe_multilib_header () {
-	return
-}
-
-PACKAGES_DYNAMIC =3D "^locale-base-.* \
-                    ^glibc-gconv-.* ^glibc-charmap-.* ^glibc-localedata-=
.* ^glibc-binary-localedata-.* \
-                    ^${MLPREFIX}glibc-gconv$"
-
-# PACKAGES is split up according to the 'source' recipes/includes in OE-=
core
-# Stylistic differences are kept to make copy/pasting easier.
-
-# From gcc-runtime.inc
-
-PACKAGES +=3D "\
-    gcc-runtime-dbg \
-    libstdc++ \
-    libstdc++-precompile-dev \
-    libstdc++-dev \
-    libstdc++-staticdev \
-    libg2c \
-    libg2c-dev \
-    libssp \
-    libssp-dev \
-    libssp-staticdev \
-    libmudflap \
-    libmudflap-dev \
-    libmudflap-staticdev \
-    libquadmath \
-    libquadmath-dev \
-    libquadmath-staticdev \
-    libgomp \
-    libgomp-dev \
-    libgomp-staticdev \
-    libatomic \
-    libatomic-dev \
-    libatomic-staticdev \
-    libitm \
-    libitm-dev \
-    libitm-staticdev \
-"
-
-# From gcc-sanitizers.inc
-
-PACKAGES +=3D "gcc-sanitizers gcc-sanitizers-dbg"
-PACKAGES +=3D "libasan libubsan liblsan libtsan"
-PACKAGES +=3D "libasan-dev libubsan-dev liblsan-dev libtsan-dev"
-PACKAGES +=3D "libasan-staticdev libubsan-staticdev liblsan-staticdev li=
btsan-staticdev"
-
-# From libgfortran.inc:
-
-PACKAGES +=3D "\
-    libgfortran-dbg \
-    libgfortran \
-    libgfortran-dev \
-    libgfortran-staticdev \
-"
-
-# libgcc.inc uses ${PN}, so replace that
-
-PACKAGES +=3D "\
-    libgcc \
-    libgcc-dev \
-    libgcc-dbg \
-"
-
-# ... and the leftovers
-
-PACKAGES =3D+ "\
-        ${PN}-mtrace \
-	libgcov-staticdev \
-	linux-libc-headers \
-	linux-libc-headers-dev \
-"
-
-# Re-order PACKAGES list in order to shift ${PN}-dev towards the end as
-# it is meant to pick up remaining dev libraries and headers that aren't
-# picked up by other packages. And since some static libraries needs to
-# be packaged in ${PN}-dev, so we need to keep ${PN}-staticdev later in
-# order.
-
-PACKAGES :=3D "${@oe.utils.str_filter_out('${PN}-dev', '${PACKAGES}', d)=
}"
-PACKAGES :=3D "${@oe.utils.str_filter_out('${PN}-staticdev', '${PACKAGES=
}', d)}"
-PACKAGES +=3D "\
-	${PN}-dev \
-	${PN}-staticdev \
-"
-
-INSANE_SKIP +=3D " 32bit-time"
-INSANE_SKIP:${PN}-dbg =3D "staticdev"
-INSANE_SKIP:${PN}-utils +=3D "ldflags"
-INSANE_SKIP:libstdc++ +=3D "ldflags"
-INSANE_SKIP:libgfortran +=3D "ldflags"
-INSANE_SKIP:libgcc +=3D "ldflags dev-deps"
-INSANE_SKIP:libgcc-dev +=3D "staticdev"
-INSANE_SKIP:libgfortran +=3D "ldflags dev-deps"
-INSANE_SKIP:libstdc++ +=3D "ldflags dev-deps"
-INSANE_SKIP:libatomic +=3D "ldflags"
-INSANE_SKIP:libasan +=3D "ldflags"
-INSANE_SKIP:libubsan +=3D "ldflags"
-INSANE_SKIP:libssp +=3D "ldflags"
-INSANE_SKIP:libgomp +=3D "ldflags"
-INSANE_SKIP:libitm +=3D "ldflags"
-INSANE_SKIP:gdbserver +=3D "ldflags"
-
-# OE-core has literally listed 'glibc' in LIBC_DEPENDENCIES :/
-RPROVIDES:${PN} =3D "glibc rtld(GNU_HASH)"
-# Add runtime provides for the other libc* packages as well
-RPROVIDES:${PN}-dev =3D "glibc-dev"
-RPROVIDES:${PN}-doc =3D "glibc-doc"
-RPROVIDES:${PN}-dbg =3D "glibc-dbg"
-RPROVIDES:${PN}-pic =3D "glibc-pic"
-RPROVIDES:${PN}-utils =3D "glibc-utils"
-RPROVIDES:${PN}-mtrace =3D "glibc-mtrace libc-mtrace"
-
-PKG:${PN} =3D "glibc"
-PKG:${PN}-dev =3D "glibc-dev"
-PKG:${PN}-doc =3D "glibc-doc"
-PKG:${PN}-dbg =3D "glibc-dbg"
-PKG:${PN}-pic =3D "glibc-pic"
-PKG:${PN}-utils =3D "glibc-utils"
-PKG:${PN}-mtrace =3D "glibc-mtrace"
-PKG:${PN}-gconv =3D "glibc-gconv"
-PKG:${PN}-extra-nss =3D "glibc-extra-nss"
-PKG:${PN}-thread-db =3D "glibc-thread-db"
-PKG:${PN}-pcprofile =3D "glibc-pcprofile"
-PKG:${PN}-staticdev =3D "glibc-staticdev"
-
-PKGV =3D "${EAT_VER_LIBC}"
-PKGV:${PN} =3D "${EAT_VER_LIBC}"
-PKGV:${PN}-dev =3D "${EAT_VER_LIBC}"
-PKGV:${PN}-doc =3D "${EAT_VER_LIBC}"
-PKGV:${PN}-dbg =3D "${EAT_VER_LIBC}"
-PKGV:${PN}-pic =3D "${EAT_VER_LIBC}"
-PKGV:${PN}-utils =3D "${EAT_VER_LIBC}"
-PKGV:${PN}-mtrace =3D "${EAT_VER_LIBC}"
-PKGV:${PN}-gconv =3D "${EAT_VER_LIBC}"
-PKGV:${PN}-extra-nss =3D "${EAT_VER_LIBC}"
-PKGV:${PN}-thread-db =3D "${EAT_VER_LIBC}"
-PKGV:${PN}-pcprofile =3D "${EAT_VER_LIBC}"
-PKGV:${PN}-staticdev =3D "${EAT_VER_LIBC}"
-PKGV:catchsegv =3D "${EAT_VER_LIBC}"
-PKGV:glibc-extra-nss =3D "${EAT_VER_LIBC}"
-PKGV:glibc-thread-db =3D "${EAT_VER_LIBC}"
-
-PKGV:libmemusage =3D "${EAT_VER_LIBC}"
-PKGV:libsegfault =3D "${EAT_VER_LIBC}"
-PKGV:libsotruss =3D "${EAT_VER_LIBC}"
-PKGV:sln =3D "${EAT_VER_LIBC}"
-PKGV:nscd =3D "${EAT_VER_LIBC}"
-PKGV:ldd =3D "${EAT_VER_LIBC}"
-
-PKGV:libasan-dev =3D "${EAT_VER_GCC}"
-PKGV:libasan =3D "${EAT_VER_GCC}"
-PKGV:libasan-staticdev =3D "${EAT_VER_GCC}"
-PKGV:libatomic-dev =3D "${EAT_VER_GCC}"
-PKGV:libatomic =3D "${EAT_VER_GCC}"
-PKGV:libatomic-staticdev =3D "${EAT_VER_GCC}"
-PKGV:libg2c-dev =3D "${EAT_VER_GCC}"
-PKGV:libg2c =3D "${EAT_VER_GCC}"
-PKGV:libgcc-dev =3D "${EAT_VER_GCC}"
-PKGV:libgcc =3D "${EAT_VER_GCC}"
-PKGV:libgfortran-dbg =3D "${EAT_VER_GCC}"
-PKGV:libgfortran-dev =3D "${EAT_VER_GCC}"
-PKGV:libgfortran =3D "${EAT_VER_GCC}"
-PKGV:libgfortran-staticdev =3D "${EAT_VER_GCC}"
-PKGV:libgomp-dev =3D "${EAT_VER_GCC}"
-PKGV:libgomp =3D "${EAT_VER_GCC}"
-PKGV:libgomp-staticdev =3D "${EAT_VER_GCC}"
-PKGV:libitm-dev =3D "${EAT_VER_GCC}"
-PKGV:libitm =3D "${EAT_VER_GCC}"
-PKGV:libitm-staticdev =3D "${EAT_VER_GCC}"
-PKGV:liblsan-dev =3D "${EAT_VER_GCC}"
-PKGV:liblsan =3D "${EAT_VER_GCC}"
-PKGV:liblsan-staticdev =3D "${EAT_VER_GCC}"
-PKGV:libmudflap-dev =3D "${EAT_VER_GCC}"
-PKGV:libmudflap =3D "${EAT_VER_GCC}"
-PKGV:libmudflap-staticdev =3D "${EAT_VER_GCC}"
-PKGV:libquadmath-dev =3D "${EAT_VER_GCC}"
-PKGV:libquadmath =3D "${EAT_VER_GCC}"
-PKGV:libquadmath-staticdev =3D "${EAT_VER_GCC}"
-PKGV:libssp-dev =3D "${EAT_VER_GCC}"
-PKGV:libssp =3D "${EAT_VER_GCC}"
-PKGV:libssp-staticdev =3D "${EAT_VER_GCC}"
-PKGV:libstdc++-dbg =3D "${EAT_VER_GCC}"
-PKGV:libstdc++-dev =3D "${EAT_VER_GCC}"
-PKGV:libstdc++ =3D "${EAT_VER_GCC}"
-PKGV:libstdc++-precompile-dev =3D "${EAT_VER_GCC}"
-PKGV:libstdc++-staticdev =3D "${EAT_VER_GCC}"
-PKGV:libtsan-dev =3D "${EAT_VER_GCC}"
-PKGV:libtsan =3D "${EAT_VER_GCC}"
-PKGV:libtsan-staticdev =3D "${EAT_VER_GCC}"
-PKGV:libubsan-dev =3D "${EAT_VER_GCC}"
-PKGV:libubsan =3D "${EAT_VER_GCC}"
-PKGV:libubsan-staticdev =3D "${EAT_VER_GCC}"
-
-PKGV:linux-libc-headers-dev =3D "${EAT_VER_KERNEL}"
-PKGV:linux-libc-headers =3D "${EAT_VER_KERNEL}"
-
-PKGV:gdbserver =3D "${EAT_VER_GDBSERVER}"
-
-ALLOW_EMPTY:${PN}-mtrace =3D "1"
-FILES:${PN}-mtrace =3D "${bindir}/mtrace"
-
-FILES:libgcov-staticdev =3D "${libdir}/gcc/${TARGET_SYS}/${BINV}/libgcov=
.a"
-
-FILES:libsegfault =3D "${base_libdir}/libSegFault*"
-
-FILES:catchsegv =3D "${bindir}/catchsegv"
-RDEPENDS:catchsegv =3D "libsegfault"
-
-# From libgfortran.inc:
-
-FILES:libgfortran =3D "${libdir}/libgfortran.so.*"
-FILES:libgfortran-dev =3D "\
-    ${libdir}/libgfortran*.so \
-    ${libdir}/libgfortran.spec \
-    ${libdir}/libgfortran.la \
-    ${libdir}/gcc/${TARGET_SYS}/${BINV}/libgfortranbegin.* \
-    ${libdir}/gcc/${TARGET_SYS}/${BINV}/libcaf_single* \
-    ${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude/ \
-"
-FILES:libgfortran-staticdev =3D "${libdir}/libgfortran.a"
-
-
-# From gcc-sanitizers.inc:
-
-FILES:libasan +=3D "${libdir}/libasan.so.* ${libdir}/libhwasan.so.*"
-FILES:libasan-dev +=3D "\
-    ${libdir}/libasan_preinit.o \
-    ${libdir}/libasan.so \
-    ${libdir}/libhwasan.so \
-    ${libdir}/libasan.la \
-"
-FILES:libasan-staticdev +=3D "${libdir}/libasan.a \
-    ${libdir}/libhwasan.a \
-"
-
-FILES:libubsan +=3D "${libdir}/libubsan.so.*"
-FILES:libubsan-dev +=3D "\
-    ${libdir}/libubsan.so \
-    ${libdir}/libubsan.la \
-"
-FILES:libubsan-staticdev +=3D "${libdir}/libubsan.a"
-
-FILES:liblsan +=3D "${libdir}/liblsan.so.*"
-FILES:liblsan-dev +=3D "\
-    ${libdir}/liblsan.so \
-    ${libdir}/liblsan.la \
-    ${libdir}/liblsan_preinit.o \
-"
-FILES:liblsan-staticdev +=3D "${libdir}/liblsan.a"
-
-FILES:libtsan +=3D "${libdir}/libtsan.so.*"
-FILES:libtsan-dev +=3D "\
-    ${libdir}/libtsan.so \
-    ${libdir}/libtsan.la \
-    ${libdir}/libtsan_*.o \
-"
-FILES:libtsan-staticdev +=3D "${libdir}/libtsan.a"
-
-FILES:gcc-sanitizers =3D "${libdir}/*.spec ${libdir}/gcc/${TARGET_SYS}/$=
{BINV}/include/sanitizer/*.h"
-
-# From libgcc.inc:
-
-FILES:libgcc =3D "${base_libdir}/libgcc_s.so.1"
-
-FILES:libgcc-dev =3D "\
-    ${base_libdir}/libgcc*.so \
-    ${@oe.utils.conditional('BASETARGET_SYS', '${TARGET_SYS}', '', '${li=
bdir}/${BASETARGET_SYS}', d)} \
-    ${libdir}/${TARGET_SYS}/${BINV}* \
-    ${libdir}/${TARGET_ARCH}${TARGET_VENDOR}* \
-"
-
-FILES:linux-libc-headers =3D ""
-FILES:linux-libc-headers-dev =3D "\
-	${includedir}/asm* \
-	${includedir}/linux \
-	${includedir}/mtd \
-	${includedir}/rdma \
-	${includedir}/scsi \
-	${includedir}/sound \
-	${includedir}/video \
-"
-FILES:${PN} +=3D "\
-	${libdir}/bin \
-	${libdir}/locale \
-	${libdir}/gconv/gconv-modules \
-	${datadir}/zoneinfo \
-	${base_libdir}/libcrypt*.so.* \
-	${base_libdir}/libcrypt-*.so \
-	${base_libdir}/libc.so.* \
-	${base_libdir}/libc-*.so \
-	${base_libdir}/libm.so.* \
-	${base_libdir}/libmemusage.so \
-	${base_libdir}/libm-*.so \
-	${base_libdir}/ld*.so.* \
-	${base_libdir}/ld-*.so \
-	${base_libdir}/libpthread*.so.* \
-	${base_libdir}/libpthread-*.so \
-	${base_libdir}/libresolv*.so.* \
-	${base_libdir}/libresolv-*.so \
-	${base_libdir}/librt*.so.* \
-	${base_libdir}/librt-*.so \
-	${base_libdir}/libutil*.so.* \
-	${base_libdir}/libutil-*.so \
-	${base_libdir}/libnss_files*.so.* \
-	${base_libdir}/libnss_files-*.so \
-	${base_libdir}/libnss_compat*.so.* \
-	${base_libdir}/libnss_compat-*.so \
-	${base_libdir}/libnss_dns*.so.* \
-	${base_libdir}/libnss_dns-*.so \
-	${base_libdir}/libnss_nis*.so.* \
-	${base_libdir}/libnss_nisplus-*.so \
-	${base_libdir}/libnss_nisplus*.so.* \
-	${base_libdir}/libnss_nis-*.so \
-	${base_libdir}/libnss_hesiod*.so.* \
-	${base_libdir}/libnss_hesiod-*.so \
-	${base_libdir}/libdl*.so.* \
-	${base_libdir}/libdl-*.so \
-	${base_libdir}/libanl*.so.* \
-	${base_libdir}/libanl-*.so \
-	${base_libdir}/libBrokenLocale*.so.* \
-	${base_libdir}/libBrokenLocale-*.so \
-	${base_libdir}/libthread_db*.so.* \
-	${base_libdir}/libthread_db-*.so \
-	${base_libdir}/libmemusage.so \
-	${base_libdir}/libSegFault.so \
-	${base_libdir}/libpcprofile.so \
-    "
-
-FILES:${PN}-dbg +=3D "${base_libdir}/debug"
-
-# From gcc-runtime.inc
-
-# include python debugging scripts
-FILES:gcc-runtime-dbg +=3D "\
-    ${libdir}/libstdc++.so.*-gdb.py \
-    ${datadir}/gcc-${BINV}/python/libstdcxx \
-"
-
-FILES:libg2c =3D "${target_libdir}/libg2c.so.*"
-SUMMARY:libg2c =3D "Companion runtime library for g77"
-FILES:libg2c-dev =3D "\
-    ${libdir}/libg2c.so \
-    ${libdir}/libg2c.a \
-    ${libdir}/libfrtbegin.a \
-"
-SUMMARY:libg2c-dev =3D "Companion runtime library for g77 - development =
files"
-
-FILES:libstdc++ =3D "${libdir}/libstdc++.so.*"
-SUMMARY:libstdc++ =3D "GNU standard C++ library"
-FILES:libstdc++-dev =3D "\
-    /include/c++ \
-    ${includedir}/c++/ \
-    ${libdir}/libstdc++.so \
-    ${libdir}/libstdc++*.la \
-    ${libdir}/libsupc++.la \
-"
-SUMMARY:libstdc++-dev =3D "GNU standard C++ library - development files"
-
-FILES:libstdc++-staticdev =3D "\
-    ${libdir}/libstdc++*.a \
-    ${libdir}/libsupc++.a \
-"
-SUMMARY:libstdc++-staticdev =3D "GNU standard C++ library - static devel=
opment files"
-
-FILES:libstdc++-precompile-dev =3D "${includedir}/c++/${TARGET_SYS}/bits=
/*.gch"
-SUMMARY:libstdc++-precompile-dev =3D "GNU standard C++ library - precomp=
iled header files"
-
-FILES:libssp =3D "${libdir}/libssp.so.*"
-SUMMARY:libssp =3D "GNU stack smashing protection library"
-FILES:libssp-dev =3D "\
-    ${libdir}/libssp*.so \
-    ${libdir}/libssp*_nonshared.a \
-    ${libdir}/libssp*.la \
-    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/ssp \
-"
-SUMMARY:libssp-dev =3D "GNU stack smashing protection library - developm=
ent files"
-FILES:libssp-staticdev =3D "${libdir}/libssp*.a"
-SUMMARY:libssp-staticdev =3D "GNU stack smashing protection library - st=
atic development files"
-
-FILES:libquadmath =3D "${libdir}/libquadmath*.so.*"
-SUMMARY:libquadmath =3D "GNU quad-precision math library"
-FILES:libquadmath-dev =3D "\
-    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/quadmath* \
-    ${libdir}/libquadmath*.so \
-    ${libdir}/libquadmath.la \
-"
-SUMMARY:libquadmath-dev =3D "GNU quad-precision math library - developme=
nt files"
-FILES:libquadmath-staticdev =3D "${libdir}/libquadmath.a"
-SUMMARY:libquadmath-staticdev =3D "GNU quad-precision math library - sta=
tic development files"
-
-# NOTE: mudflap has been removed as of gcc 4.9 and has been superseded b=
y the address sanitiser
-FILES:libmudflap =3D "${libdir}/libmudflap*.so.*"
-SUMMARY:libmudflap =3D "Pointer debugging library for gcc"
-FILES:libmudflap-dev =3D "\
-    ${libdir}/libmudflap*.so \
-    ${libdir}/libmudflap.la \
-"
-SUMMARY:libmudflap-dev =3D "Pointer debugging library for gcc - developm=
ent files"
-FILES:libmudflap-staticdev =3D "${libdir}/libmudflap.a"
-SUMMARY:libmudflap-staticdev =3D "Pointer debugging library for gcc - st=
atic development files"
-
-FILES:libgomp =3D "${libdir}/libgomp*${SOLIBS}"
-SUMMARY:libgomp =3D "GNU OpenMP parallel programming library"
-FILES:libgomp-dev =3D "\
-    ${libdir}/libgomp*${SOLIBSDEV} \
-    ${libdir}/libgomp*.la \
-    ${libdir}/libgomp.spec \
-    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/omp.h \
-    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/openacc.h \
-"
-SUMMARY:libgomp-dev =3D "GNU OpenMP parallel programming library - devel=
opment files"
-FILES:libgomp-staticdev =3D "${libdir}/libgomp*.a"
-SUMMARY:libgomp-staticdev =3D "GNU OpenMP parallel programming library -=
 static development files"
-
-FILES:libatomic =3D "${libdir}/libatomic.so.*"
-SUMMARY:libatomic =3D "GNU C++11 atomics support library"
-FILES:libatomic-dev =3D "\
-    ${libdir}/libatomic.so \
-    ${libdir}/libatomic.la \
-"
-SUMMARY:libatomic-dev =3D "GNU C++11 atomics support library - developme=
nt files"
-FILES:libatomic-staticdev =3D "${libdir}/libatomic.a"
-SUMMARY:libatomic-staticdev =3D "GNU C++11 atomics support library - sta=
tic development files"
-
-FILES:libitm =3D "${libdir}/libitm.so.*"
-SUMMARY:libitm =3D "GNU transactional memory support library"
-FILES:libitm-dev =3D "\
-    ${libdir}/libitm.so \
-    ${libdir}/libitm.la \
-    ${libdir}/libitm.spec \
-"
-SUMMARY:libitm-dev =3D "GNU transactional memory support library - devel=
opment files"
-FILES:libitm-staticdev =3D "${libdir}/libitm.a"
-SUMMARY:libitm-staticdev =3D "GNU transactional memory support library -=
 static development files"
-
-EAT_VER_MAIN ??=3D ""
-
-python () {
-    if not d.getVar("EAT_VER_MAIN", False):
-        raise bb.parse.SkipPackage("External ARM toolchain not configure=
d (EAT_VER_MAIN not set).")
-    if d.getVar('TCLIBC', True) !=3D "glibc":
-        raise bb.parse.SkipPackage("incompatible with %s" % d.getVar('TC=
LIBC', True))
-}
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/f=
iles/SUPPORTED b/meta-arm-toolchain/recipes-devtools/external-arm-toolcha=
in/files/SUPPORTED
deleted file mode 100644
index 9615075e..00000000
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/files/SU=
PPORTED
+++ /dev/null
@@ -1 +0,0 @@
-POSIX
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/l=
icense.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/l=
icense.inc
deleted file mode 100644
index 4260dc71..00000000
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.=
inc
+++ /dev/null
@@ -1,79 +0,0 @@
-LICENSE =3D "GPL-3.0-with-GCC-exception & GPL-3.0-only & GPL-2.0-only & =
LGPL-3.0-only & LGPL-2.1-only & LGPL-2.0-only"
-
-EAT_BFD_LICENSE =3D "GPL-3.0-only"
-EAT_GCC_LICENSE =3D "GPL-3.0-with-GCC-exception & GPL-3.0-only"
-EAT_GDB_LICENSE =3D "GPL-3.0-only"
-EAT_LIBC_LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
-EAT_RLE_LICENSE =3D "GPL-3.0-with-GCC-exception"
-
-LICENSE:${PN} =3D "${EAT_LIBC_LICENSE}"
-LICENSE:${PN}-dev =3D "${EAT_LIBC_LICENSE}"
-LICENSE:${PN}-doc =3D "${EAT_LIBC_LICENSE}"
-LICENSE:${PN}-dbg =3D "${EAT_LIBC_LICENSE}"
-LICENSE:${PN}-pic =3D "${EAT_LIBC_LICENSE}"
-LICENSE:${PN}-utils =3D "${EAT_LIBC_LICENSE}"
-LICENSE:${PN}-mtrace =3D "${EAT_LIBC_LICENSE}"
-LICENSE:${PN}-gconv =3D "${EAT_LIBC_LICENSE}"
-LICENSE:${PN}-extra-nss =3D "${EAT_LIBC_LICENSE}"
-LICENSE:${PN}-thread-db =3D "${EAT_LIBC_LICENSE}"
-LICENSE:${PN}-pcprofile =3D "${EAT_LIBC_LICENSE}"
-LICENSE:${PN}-staticdev =3D "${EAT_LIBC_LICENSE}"
-LICENSE:catchsegv =3D "${EAT_LIBC_LICENSE}"
-LICENSE:glibc-extra-nss =3D "${EAT_LIBC_LICENSE}"
-LICENSE:glibc-thread-db =3D "${EAT_LIBC_LICENSE}"
-
-LICENSE:libmemusage =3D "${EAT_LIBC_LICENSE}"
-LICENSE:libsegfault =3D "${EAT_LIBC_LICENSE}"
-LICENSE:libsotruss =3D "${EAT_LIBC_LICENSE}"
-LICENSE:sln =3D "${EAT_LIBC_LICENSE}"
-LICENSE:nscd =3D "${EAT_LIBC_LICENSE}"
-LICENSE:ldd =3D "${EAT_LIBC_LICENSE}"
-
-LICENSE:libasan-dev =3D "${EAT_GCC_LICENSE}"
-LICENSE:libasan =3D "${EAT_GCC_LICENSE}"
-LICENSE:libasan-staticdev =3D "${EAT_GCC_LICENSE}"
-LICENSE:libatomic-dev =3D "${EAT_GCC_LICENSE}"
-LICENSE:libatomic =3D "${EAT_GCC_LICENSE}"
-LICENSE:libatomic-staticdev =3D "${EAT_GCC_LICENSE}"
-LICENSE:libg2c-dev =3D "${EAT_GCC_LICENSE}"
-LICENSE:libg2c =3D "${EAT_GCC_LICENSE}"
-LICENSE:libgcc-dev =3D "${EAT_GCC_LICENSE}"
-LICENSE:libgcc =3D "${EAT_GCC_LICENSE}"
-LICENSE:libgfortran-dbg =3D "${EAT_GCC_LICENSE}"
-LICENSE:libgfortran-dev =3D "${EAT_GCC_LICENSE}"
-LICENSE:libgfortran =3D "${EAT_GCC_LICENSE}"
-LICENSE:libgfortran-staticdev =3D "${EAT_GCC_LICENSE}"
-LICENSE:libgomp-dev =3D "${EAT_GCC_LICENSE}"
-LICENSE:libgomp =3D "${EAT_GCC_LICENSE}"
-LICENSE:libgomp-staticdev =3D "${EAT_GCC_LICENSE}"
-LICENSE:libitm-dev =3D "${EAT_GCC_LICENSE}"
-LICENSE:libitm =3D "${EAT_GCC_LICENSE}"
-LICENSE:libitm-staticdev =3D "${EAT_GCC_LICENSE}"
-LICENSE:liblsan-dev =3D "${EAT_GCC_LICENSE}"
-LICENSE:liblsan =3D "${EAT_GCC_LICENSE}"
-LICENSE:liblsan-staticdev =3D "${EAT_GCC_LICENSE}"
-LICENSE:libmudflap-dev =3D "${EAT_GCC_LICENSE}"
-LICENSE:libmudflap =3D "${EAT_GCC_LICENSE}"
-LICENSE:libmudflap-staticdev =3D "${EAT_GCC_LICENSE}"
-LICENSE:libquadmath-dev =3D "${EAT_GCC_LICENSE}"
-LICENSE:libquadmath =3D "${EAT_GCC_LICENSE}"
-LICENSE:libquadmath-staticdev =3D "${EAT_GCC_LICENSE}"
-LICENSE:libssp-dev =3D "${EAT_GCC_LICENSE}"
-LICENSE:libssp =3D "${EAT_GCC_LICENSE}"
-LICENSE:libssp-staticdev =3D "${EAT_GCC_LICENSE}"
-LICENSE:libstdc++-dbg =3D "${EAT_GCC_LICENSE}"
-LICENSE:libstdc++-dev =3D "${EAT_GCC_LICENSE}"
-LICENSE:libstdc++ =3D "${EAT_GCC_LICENSE}"
-LICENSE:libstdc++-precompile-dev =3D "${EAT_GCC_LICENSE}"
-LICENSE:libstdc++-staticdev =3D "${EAT_GCC_LICENSE}"
-LICENSE:libtsan-dev =3D "${EAT_GCC_LICENSE}"
-LICENSE:libtsan =3D "${EAT_GCC_LICENSE}"
-LICENSE:libtsan-staticdev =3D "${EAT_GCC_LICENSE}"
-LICENSE:libubsan-dev =3D "${EAT_GCC_LICENSE}"
-LICENSE:libubsan =3D "${EAT_GCC_LICENSE}"
-LICENSE:libubsan-staticdev =3D "${EAT_GCC_LICENSE}"
-
-LICENSE:linux-libc-headers-dev =3D "GPL-2.0-only"
-LICENSE:linux-libc-headers =3D "GPL-2.0-only"
-
-LICENSE:gdbserver =3D "GPL-2.0-only & GPL-3.0-only & LGPL-2.0-only & LGP=
L-3.0-only"
--=20
2.43.0


