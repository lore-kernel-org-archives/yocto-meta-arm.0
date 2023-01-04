Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1653FC4708E
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 12:33:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10860.1672835631881842913
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 Jan 2023 04:33:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 405651042;
	Wed,  4 Jan 2023 04:34:33 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D89463F587;
	Wed,  4 Jan 2023 04:33:50 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 3/3] meta-gem5: remove
Date: Wed,  4 Jan 2023 12:33:43 +0000
Message-Id: <20230104123343.3372506-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230104123343.3372506-1-ross.burton@arm.com>
References: <20230104123343.3372506-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 04 Jan 2023 12:33:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4235

The meta-gem5 layer is unmaintained and gem5 is incompatible with Python
3.11, so won't work with master without work that is still ongoing.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml                                |  12 +-
 README.md                                     |   5 -
 ci/gem5-arm64.yml                             |  16 --
 meta-gem5/COPYING.MIT                         |  17 --
 meta-gem5/README.md                           |   1 -
 meta-gem5/conf/layer.conf                     |  19 --
 meta-gem5/conf/machine/gem5-arm64.conf        |  54 -----
 meta-gem5/documentation/gem5-arm64.md         |  32 ---
 .../boot-wrapper-aarch64_%.bbappend           |  32 ---
 .../gem5/gem5-aarch64-native_20.bbappend      |   7 -
 .../xen/files/gem5-arm64/early-printk.cfg     |   2 -
 .../recipes-extended/xen/xen_%.bbappend       |   4 -
 .../recipes-kernel/linux/linux-%.bbappend     |  14 --
 .../features/disable-arm64-sve.cfg            |   4 -
 .../features/disable-arm64-sve.scc            |   3 -
 .../boot-wrapper-aarch64_%.bbappend           |  16 --
 .../recipes-devtools/gem5/files/mapping.patch |  37 ----
 .../recipes-devtools/gem5/files/start-gem5.sh |  39 ----
 .../gem5/gem5-aarch64-bootloader.inc          |  30 ---
 .../gem5/gem5-aarch64-bootloader_20.bb        |   7 -
 .../recipes-devtools/gem5/gem5-aarch64-dtb.bb |  30 ---
 .../gem5/gem5-aarch64-native.inc              |  40 ----
 ...rm-SMMUv3-enable-interrupt-interface.patch |  97 ---------
 .../gem5/gem5-aarch64-native_20.bb            |  22 --
 ...til-m5ops-optional-extra-build-flags.patch |  59 -----
 .../recipes-devtools/gem5/gem5-m5ops_20.bb    |  26 ---
 .../recipes-devtools/gem5/gem5-m5readfile.bb  |  17 --
 .../gem5/gem5-m5readfile/m5-readfile.sh       |   9 -
 .../gem5/gem5-m5term-native_20.bb             |  24 ---
 .../gem5-m5term/0001-add-makefile-flags.patch |  34 ---
 .../recipes-devtools/gem5/gem5-native.inc     |  57 -----
 .../recipes-devtools/gem5/gem5-source_20.inc  |  11 -
 ..._registry-fix-reproducibility-issues.patch |  46 ----
 ...-conmakehash-improve-reproducibility.patch |  56 -----
 .../dts/gem5-arm64/armv8_gem5_v2_1cpu.dts     |  95 --------
 .../dts/gem5-arm64/armv8_gem5_v2_2cpu.dts     | 103 ---------
 .../dts/gem5-arm64/armv8_gem5_v2_4cpu.dts     | 119 -----------
 .../dts/gem5-arm64/armv8_gem5_v2_8cpu.dts     | 151 -------------
 .../dts/gem5-arm64/vexpress_gem5_v2.dtsi      |  46 ----
 .../dts/gem5-arm64/vexpress_gem5_v2_base.dtsi | 202 ------------------
 ...ture-changes-causes-compile-failures.patch |  99 ---------
 .../gem5-platforms/gem5-arm64-standard.scc    |  11 -
 .../bsp/gem5-platforms/gem5-arm64.scc         |  14 --
 .../gem5-arm64/gem5-arm64-board.cfg           |  23 --
 .../gem5-arm64/gem5-arm64-cfi.cfg             |   3 -
 .../gem5-arm64/gem5-arm64-drm.cfg             |   4 -
 .../gem5-arm64/gem5-arm64-net.cfg             |   2 -
 .../gem5-arm64/gem5-arm64-pata.cfg            |  12 --
 .../gem5-arm64/gem5-arm64-pci.cfg             |   2 -
 .../gem5-arm64/gem5-arm64-rtc.cfg             |   2 -
 .../gem5-arm64/gem5-arm64-serial.cfg          |   3 -
 .../gem5-arm64/gem5-arm64-virtio.cfg          |   9 -
 .../linux/linux-yocto_%.bbappend              |  12 --
 .../recipes-kernel/linux/linux-yocto_5.4.bb   |  25 ---
 .../linux/linux-yocto_5.4.bbappend            |   1 -
 scripts/machine-summary.py                    |   2 +-
 56 files changed, 4 insertions(+), 1815 deletions(-)
 delete mode 100644 ci/gem5-arm64.yml
 delete mode 100644 meta-gem5/COPYING.MIT
 delete mode 100644 meta-gem5/README.md
 delete mode 100644 meta-gem5/conf/layer.conf
 delete mode 100644 meta-gem5/conf/machine/gem5-arm64.conf
 delete mode 100644 meta-gem5/documentation/gem5-arm64.md
 delete mode 100644 meta-gem5/dynamic-layers/meta-virtualization/recipes-=
bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend
 delete mode 100644 meta-gem5/dynamic-layers/meta-virtualization/recipes-=
devtools/gem5/gem5-aarch64-native_20.bbappend
 delete mode 100644 meta-gem5/dynamic-layers/meta-virtualization/recipes-=
extended/xen/files/gem5-arm64/early-printk.cfg
 delete mode 100644 meta-gem5/dynamic-layers/meta-virtualization/recipes-=
extended/xen/xen_%.bbappend
 delete mode 100644 meta-gem5/dynamic-layers/meta-virtualization/recipes-=
kernel/linux/linux-%.bbappend
 delete mode 100644 meta-gem5/dynamic-layers/meta-virtualization/recipes-=
kernel/linux/virtualization-kmeta-extra-gem5/features/disable-arm64-sve.c=
fg
 delete mode 100644 meta-gem5/dynamic-layers/meta-virtualization/recipes-=
kernel/linux/virtualization-kmeta-extra-gem5/features/disable-arm64-sve.s=
cc
 delete mode 100644 meta-gem5/recipes-bsp/boot-wrapper-aarch64/boot-wrapp=
er-aarch64_%.bbappend
 delete mode 100644 meta-gem5/recipes-devtools/gem5/files/mapping.patch
 delete mode 100644 meta-gem5/recipes-devtools/gem5/files/start-gem5.sh
 delete mode 100644 meta-gem5/recipes-devtools/gem5/gem5-aarch64-bootload=
er.inc
 delete mode 100644 meta-gem5/recipes-devtools/gem5/gem5-aarch64-bootload=
er_20.bb
 delete mode 100644 meta-gem5/recipes-devtools/gem5/gem5-aarch64-dtb.bb
 delete mode 100644 meta-gem5/recipes-devtools/gem5/gem5-aarch64-native.i=
nc
 delete mode 100644 meta-gem5/recipes-devtools/gem5/gem5-aarch64-native/0=
001-dev-arm-SMMUv3-enable-interrupt-interface.patch
 delete mode 100644 meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_2=
0.bb
 delete mode 100644 meta-gem5/recipes-devtools/gem5/gem5-m5ops/0001-util-=
m5ops-optional-extra-build-flags.patch
 delete mode 100644 meta-gem5/recipes-devtools/gem5/gem5-m5ops_20.bb
 delete mode 100644 meta-gem5/recipes-devtools/gem5/gem5-m5readfile.bb
 delete mode 100755 meta-gem5/recipes-devtools/gem5/gem5-m5readfile/m5-re=
adfile.sh
 delete mode 100644 meta-gem5/recipes-devtools/gem5/gem5-m5term-native_20=
.bb
 delete mode 100644 meta-gem5/recipes-devtools/gem5/gem5-m5term/0001-add-=
makefile-flags.patch
 delete mode 100644 meta-gem5/recipes-devtools/gem5/gem5-native.inc
 delete mode 100644 meta-gem5/recipes-devtools/gem5/gem5-source_20.inc
 delete mode 100644 meta-gem5/recipes-kernel/linux/files/0001-lib-build_O=
ID_registry-fix-reproducibility-issues.patch
 delete mode 100644 meta-gem5/recipes-kernel/linux/files/0002-vt-conmakeh=
ash-improve-reproducibility.patch
 delete mode 100644 meta-gem5/recipes-kernel/linux/files/dts/gem5-arm64/a=
rmv8_gem5_v2_1cpu.dts
 delete mode 100644 meta-gem5/recipes-kernel/linux/files/dts/gem5-arm64/a=
rmv8_gem5_v2_2cpu.dts
 delete mode 100644 meta-gem5/recipes-kernel/linux/files/dts/gem5-arm64/a=
rmv8_gem5_v2_4cpu.dts
 delete mode 100644 meta-gem5/recipes-kernel/linux/files/dts/gem5-arm64/a=
rmv8_gem5_v2_8cpu.dts
 delete mode 100644 meta-gem5/recipes-kernel/linux/files/dts/gem5-arm64/v=
express_gem5_v2.dtsi
 delete mode 100644 meta-gem5/recipes-kernel/linux/files/dts/gem5-arm64/v=
express_gem5_v2_base.dtsi
 delete mode 100644 meta-gem5/recipes-kernel/linux/files/init_disassemble=
_info-signature-changes-causes-compile-failures.patch
 delete mode 100644 meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-pl=
atforms/gem5-arm64-standard.scc
 delete mode 100644 meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-pl=
atforms/gem5-arm64.scc
 delete mode 100644 meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-pl=
atforms/gem5-arm64/gem5-arm64-board.cfg
 delete mode 100644 meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-pl=
atforms/gem5-arm64/gem5-arm64-cfi.cfg
 delete mode 100644 meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-pl=
atforms/gem5-arm64/gem5-arm64-drm.cfg
 delete mode 100644 meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-pl=
atforms/gem5-arm64/gem5-arm64-net.cfg
 delete mode 100644 meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-pl=
atforms/gem5-arm64/gem5-arm64-pata.cfg
 delete mode 100644 meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-pl=
atforms/gem5-arm64/gem5-arm64-pci.cfg
 delete mode 100644 meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-pl=
atforms/gem5-arm64/gem5-arm64-rtc.cfg
 delete mode 100644 meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-pl=
atforms/gem5-arm64/gem5-arm64-serial.cfg
 delete mode 100644 meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-pl=
atforms/gem5-arm64/gem5-arm64-virtio.cfg
 delete mode 100644 meta-gem5/recipes-kernel/linux/linux-yocto_%.bbappend
 delete mode 100644 meta-gem5/recipes-kernel/linux/linux-yocto_5.4.bb
 delete mode 100644 meta-gem5/recipes-kernel/linux/linux-yocto_5.4.bbappe=
nd

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index e8ab443d..29254b92 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -120,12 +120,6 @@ fvp-baser-aemv8r64:
 fvps:
   extends: .build
=20
-gem5-arm64:
-  extends: .build
-  parallel:
-    matrix:
-      - VIRT: [none, xen]
-
 generic-arm64:
   extends: .build
=20
@@ -221,7 +215,7 @@ check-layers:
       "yocto-check-layer-wrapper $CI_PROJECT_DIR/$LAYER --dependency $CI=
_PROJECT_DIR/meta-* $KAS_WORK_DIR/meta-openembedded/meta-oe --no-auto-dep=
endency"
   parallel:
     matrix:
-      - LAYER: [meta-arm, meta-arm-bsp, meta-arm-toolchain, meta-gem5]
+      - LAYER: [meta-arm, meta-arm-bsp, meta-arm-toolchain]
=20
 pending-updates:
   extends: .setup
@@ -231,8 +225,8 @@ pending-updates:
   script:
     - rm -fr update-report
     # This configuration has all of the layers we need enabled
-    - kas shell ci/meta-openembedded.yml:ci/gem5-arm64.yml:ci/qemuarm64.=
yml --command \
-      "$CI_PROJECT_DIR/scripts/machine-summary.py -t report -o $CI_PROJE=
CT_DIR/update-report $($CI_PROJECT_DIR/ci/listmachines.py meta-arm meta-a=
rm-bsp meta-gem5)"
+    - kas shell ci/qemuarm64.yml:ci/meta-openembedded.yml --command \
+      "$CI_PROJECT_DIR/scripts/machine-summary.py -t report -o $CI_PROJE=
CT_DIR/update-report $($CI_PROJECT_DIR/ci/listmachines.py meta-arm meta-a=
rm-bsp)"
   # Do this on x86 whilst the compilers are x86-only
   tags:
     - x86_64
diff --git a/README.md b/README.md
index eb8a8aa3..77792585 100644
--- a/README.md
+++ b/README.md
@@ -18,11 +18,6 @@ This repository contains the Arm layers for OpenEmbedd=
ed.
=20
   This layer contains recipes for Arm's binary toolchains (GCC and Clang=
 for -A and -M), and a recipe to build Arm's GCC.
=20
-* meta-gem5
-
-  This layer contains recipes and machines for gem5, a system-level and =
processor simulator.
-
-
 Other Directories
 -----------------
=20
diff --git a/ci/gem5-arm64.yml b/ci/gem5-arm64.yml
deleted file mode 100644
index 90913f37..00000000
--- a/ci/gem5-arm64.yml
+++ /dev/null
@@ -1,16 +0,0 @@
-header:
-  version: 11
-  includes:
-    - ci/base.yml
-    - ci/meta-openembedded.yml
-
-repos:
-  meta-arm:
-    layers:
-      meta-gem5:
-
-machine: gem5-arm64
-
-target:
-  - core-image-minimal
-  - gem5-aarch64-native
diff --git a/meta-gem5/COPYING.MIT b/meta-gem5/COPYING.MIT
deleted file mode 100644
index fb950dc6..00000000
--- a/meta-gem5/COPYING.MIT
+++ /dev/null
@@ -1,17 +0,0 @@
-Permission is hereby granted, free of charge, to any person obtaining a =
copy=20
-of this software and associated documentation files (the "Software"), to=
 deal=20
-in the Software without restriction, including without limitation the ri=
ghts=20
-to use, copy, modify, merge, publish, distribute, sublicense, and/or sel=
l=20
-copies of the Software, and to permit persons to whom the Software is=20
-furnished to do so, subject to the following conditions:
-
-The above copyright notice and this permission notice shall be included =
in=20
-all copies or substantial portions of the Software.
-
-THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS =
OR=20
-IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,=
=20
-FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL =
THE=20
-AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER=20
-LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING =
FROM,=20
-OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS I=
N=20
-THE SOFTWARE.
diff --git a/meta-gem5/README.md b/meta-gem5/README.md
deleted file mode 100644
index 490ddca9..00000000
--- a/meta-gem5/README.md
+++ /dev/null
@@ -1 +0,0 @@
-See ../README.md
diff --git a/meta-gem5/conf/layer.conf b/meta-gem5/conf/layer.conf
deleted file mode 100644
index db378b38..00000000
--- a/meta-gem5/conf/layer.conf
+++ /dev/null
@@ -1,19 +0,0 @@
-# We have a conf and classes directory, add to BBPATH
-BBPATH .=3D ":${LAYERDIR}"
-
-# We have recipes-* directories, add to BBFILES
-BBFILES +=3D "${LAYERDIR}/recipes-*/*/*.bb \
-            ${LAYERDIR}/recipes-*/*/*.bbappend"
-
-BBFILE_COLLECTIONS +=3D "meta-gem5"
-BBFILE_PATTERN_meta-gem5 =3D "^${LAYERDIR}/"
-BBFILE_PRIORITY_meta-gem5 =3D "5"
-
-LAYERDEPENDS_meta-gem5 =3D "core openembedded-layer meta-arm"
-LAYERSERIES_COMPAT_meta-gem5 =3D "langdale mickledore"
-
-BBFILES_DYNAMIC +=3D " \
-    virtualization-layer:${LAYERDIR}/dynamic-layers/meta-virtualization/=
*/*/*.bbappend \
-"
-
-DISTRO_FEATURES_NATIVE:append =3D " ${@bb.utils.filter('DISTRO_FEATURES'=
, 'xen', d)}"
diff --git a/meta-gem5/conf/machine/gem5-arm64.conf b/meta-gem5/conf/mach=
ine/gem5-arm64.conf
deleted file mode 100644
index fa931da8..00000000
--- a/meta-gem5/conf/machine/gem5-arm64.conf
+++ /dev/null
@@ -1,54 +0,0 @@
-# Configuration for gem5 running on ARM64
-
-#@TYPE: Machine
-#@NAME: Gem5 arm64 machine
-#@DESCRIPTION: Machine configuration for Gem5 arm64
-
-TUNE_FEATURES =3D "aarch64"
-
-require conf/machine/include/arm/arch-armv8a.inc
-
-MACHINE_FEATURES =3D "optee pci"
-
-KERNEL_IMAGETYPES =3D "Image vmlinux"
-KERNEL_IMAGETYPE =3D "Image"
-
-IMAGE_FSTYPES +=3D "tar.bz2 ext4"
-
-SERIAL_CONSOLES =3D "115200;ttyAMA0"
-
-EXTRA_IMAGEDEPENDS +=3D "virtual/gem5-bootloader"
-
-PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
-PREFERRED_VERSION_linux-yocto ?=3D "5.4%"
-
-
-# Uncomment the following if you need to build gem5 provided bootloader,=
 else
-# using standard bootloader by Linux aarch64
-# Use gem5 provided bootloader
-# PREFERRED_PROVIDER_virtual/gem5-bootloader =3D "gem5-aarch64-bootloade=
r"
-
-# use the dtb stored in the kernel recipe
-# KERNEL_DEVICETREE ?=3D "gem5-arm64/armv8_gem5_v2_4cpu.dtb"
-
-# Use Linux aarch64 boot wrapper with FDT support and generated
-# dtb (gem5-aarch64-dtb.bb)
-PREFERRED_PROVIDER_virtual/gem5-bootloader =3D "boot-wrapper-aarch64"
-
-BOOT_WRAPPER_AARCH64_CMDLINE ?=3D "\
-    earlyprintk=3Dpl011,0x1c090000 console=3DttyAMA0 root=3D/dev/vda rw =
mem=3D1G \
-    "
-# Use baremetal profile and axf file so dtb is in axf file
-GEM5_RUN_PROFILE =3D "configs/example/arm/baremetal.py"
-GEM5_RUN_KERNEL =3D "linux-system.axf"
-GEM5_RUN_EXTRA =3D ""
-GEM5_RUN_DTB =3D ""
-GEM5_RUN_CMDLINE =3D ""
-
-EXTRA_IMAGEDEPENDS +=3D "gem5-aarch64-native"
-
-# As this is a virtual target that will not be used in the real world th=
ere is
-# no need for real SSH keys.  Disable rng-tools (which takes too long to
-# initialise) and install the pre-generated keys.
-PACKAGECONFIG:remove:pn-openssh =3D "rng-tools"
-MACHINE_EXTRA_RRECOMMENDS +=3D "ssh-pregen-hostkeys"
diff --git a/meta-gem5/documentation/gem5-arm64.md b/meta-gem5/documentat=
ion/gem5-arm64.md
deleted file mode 100644
index 137676b3..00000000
--- a/meta-gem5/documentation/gem5-arm64.md
+++ /dev/null
@@ -1,32 +0,0 @@
-# Gem5 Arm64 Platform Support in meta-gem5
-
-## Howto Build and Run
-
-### Configuration:
-In the local.conf file, MACHINE should be set as follow:
-MACHINE ?=3D "gem5-arm64"
-
-And in the bblayers.conf the following layers need to be added:
-##OEROOT##/meta-arm/meta-arm-toolchain
-##OEROOT##/meta-arm/meta-arm
-
-### Build:
-```bash$ bitbake core-image-minimal```
-
-### Run:
-After compilation of an image, you can execute it using the compiled gem=
5
-with the followin command:
-```./tmp/deploy/tools/start-gem5.sh```
-
-You can modify the script to change the command line options of gem5.
-
-## Devices supported in the kernel
-- serial
-
-### Untested:
-- pci
-- sata
-- ide
-
-
-## Devices not supported or not functional
diff --git a/meta-gem5/dynamic-layers/meta-virtualization/recipes-bsp/boo=
t-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend b/meta-gem5/dynamic-la=
yers/meta-virtualization/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-a=
arch64_%.bbappend
deleted file mode 100644
index e4b97e94..00000000
--- a/meta-gem5/dynamic-layers/meta-virtualization/recipes-bsp/boot-wrapp=
er-aaarch64/boot-wrapper-aarch64_%.bbappend
+++ /dev/null
@@ -1,32 +0,0 @@
-# Use OVERRIDES to minimize the usage of
-# ${@bb.utils.contains('DISTRO_FEATURES', 'xen', ...
-OVERRIDES:append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ':x=
en', '', d)}"
-
-# Xen image to put in the image
-# This should point to a file in the deploy image directory
-BOOT_WRAPPER_AARCH64_XEN ??=3D "xen-${MACHINE}"
-
-# Xen command line for the image
-BOOT_WRAPPER_AARCH64_XEN_CMDLINE ??=3D "noreboot dom0_mem=3D256M"
-
-BOOT_WRAPPER_AARCH64_XEN_CMDLINE:gem5-arm64 =3D "noreboot dom0_mem=3D256=
M console=3Ddtuart \
-    dtuart=3D/uart@1c090000 bootscrub=3D0"
-
-# Fix command line in the axf file for gem5-arm64 when Xen is present
-BOOT_WRAPPER_AARCH64_CMDLINE_xen:gem5-arm64 =3D "console=3Dhvc0 root=3D/=
dev/vda rw"
-
-# Image generated by boot wrapper when Xen is present
-BOOT_WRAPPER_AARCH64_IMAGE:xen ?=3D "xen-system.axf"
-
-EXTRA_OECONF:append:xen =3D " \
---with-xen=3D${WORKDIR}/kernel/arch/arm64/boot/Image \
---with-xen-cmdline=3D"" \
-"
-
-EXTRA_OEMAKE:append:xen =3D " \
-XEN_IMAGE=3D${DEPLOY_DIR_IMAGE}/${BOOT_WRAPPER_AARCH64_XEN} \
-XEN_CMDLINE=3D"${BOOT_WRAPPER_AARCH64_XEN_CMDLINE}" \
-"
-
-# We need xen if it is activated
-do_deploy[depends] +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'xen', =
'xen:do_deploy', '', d)}"
diff --git a/meta-gem5/dynamic-layers/meta-virtualization/recipes-devtool=
s/gem5/gem5-aarch64-native_20.bbappend b/meta-gem5/dynamic-layers/meta-vi=
rtualization/recipes-devtools/gem5/gem5-aarch64-native_20.bbappend
deleted file mode 100644
index 5c38bdd6..00000000
--- a/meta-gem5/dynamic-layers/meta-virtualization/recipes-devtools/gem5/=
gem5-aarch64-native_20.bbappend
+++ /dev/null
@@ -1,7 +0,0 @@
-# When booting gem5-arm64 with Xen we need to set the cpu as Cortex A53 =
and
-# remove support for pointer authentification
-GEM5_RUN_EXTRA:append =3D " \
-${@bb.utils.contains('DISTRO_FEATURES_NATIVE', 'xen', \
-'--param=3Dsystem.cpu_cluster[0].cpus[0].isa[0].midr=3D0x410fd030 \
---param=3Dsystem.cpu_cluster[0].cpus[0].isa[0].id_aa64isar1_el1=3D0x0', =
\
-'', d)}"
diff --git a/meta-gem5/dynamic-layers/meta-virtualization/recipes-extende=
d/xen/files/gem5-arm64/early-printk.cfg b/meta-gem5/dynamic-layers/meta-v=
irtualization/recipes-extended/xen/files/gem5-arm64/early-printk.cfg
deleted file mode 100644
index e89e546c..00000000
--- a/meta-gem5/dynamic-layers/meta-virtualization/recipes-extended/xen/f=
iles/gem5-arm64/early-printk.cfg
+++ /dev/null
@@ -1,2 +0,0 @@
-CONFIG_DEBUG=3Dy
-CONFIG_EARLY_PRINTK_VEXPRESS=3Dy
diff --git a/meta-gem5/dynamic-layers/meta-virtualization/recipes-extende=
d/xen/xen_%.bbappend b/meta-gem5/dynamic-layers/meta-virtualization/recip=
es-extended/xen/xen_%.bbappend
deleted file mode 100644
index 6ee4dbde..00000000
--- a/meta-gem5/dynamic-layers/meta-virtualization/recipes-extended/xen/x=
en_%.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-# gem5-arm64 support
-COMPATIBLE_MACHINE:gem5-arm64 =3D "gem5-arm64"
-FILESEXTRAPATHS:prepend:gem5-arm64 :=3D "${THISDIR}/files:"
-SRC_URI:append:gem5-arm64 =3D " file://early-printk.cfg"
diff --git a/meta-gem5/dynamic-layers/meta-virtualization/recipes-kernel/=
linux/linux-%.bbappend b/meta-gem5/dynamic-layers/meta-virtualization/rec=
ipes-kernel/linux/linux-%.bbappend
deleted file mode 100644
index 7ff3fe2b..00000000
--- a/meta-gem5/dynamic-layers/meta-virtualization/recipes-kernel/linux/l=
inux-%.bbappend
+++ /dev/null
@@ -1,14 +0,0 @@
-FILESEXTRAPATHS:prepend:gem5-arm64 :=3D "${THISDIR}:"
-
-#
-# virtualization kmeta extra
-#
-SRC_URI:append:gem5-arm64 =3D " file://virtualization-kmeta-extra-gem5;t=
ype=3Dkmeta;name=3Dvirtualization-kmeta-extra-gem5;destsuffix=3Dvirtualiz=
ation-kmeta-extra-gem5"
-
-# We need to turn off SVE support in the Linux kernel otherwise Xen is s=
topping
-# Linux kernel with a coredump while trying to access XEN bit of CPACR1 =
core
-# register.
-LINUX_VIRTUALIZATION_DISABLE_ARM64_SVE:gem5-arm64 =3D "${@bb.utils.conta=
ins('DISTRO_FEATURES', \
-                                         'xen', ' features/disable-arm64=
-sve.scc','',d)}"
-
-KERNEL_FEATURES:append:gem5-arm64 =3D "${LINUX_VIRTUALIZATION_DISABLE_AR=
M64_SVE}"
diff --git a/meta-gem5/dynamic-layers/meta-virtualization/recipes-kernel/=
linux/virtualization-kmeta-extra-gem5/features/disable-arm64-sve.cfg b/me=
ta-gem5/dynamic-layers/meta-virtualization/recipes-kernel/linux/virtualiz=
ation-kmeta-extra-gem5/features/disable-arm64-sve.cfg
deleted file mode 100644
index 7e87cab4..00000000
--- a/meta-gem5/dynamic-layers/meta-virtualization/recipes-kernel/linux/v=
irtualization-kmeta-extra-gem5/features/disable-arm64-sve.cfg
+++ /dev/null
@@ -1,4 +0,0 @@
-# We need to turn off SVE support in the Linux kernel otherwise Xen is s=
topping
-# Linux kernel with a coredump while trying to access ZEN bit of CPACR1 =
core
-# register.
-# CONFIG_ARM64_SVE is not set
diff --git a/meta-gem5/dynamic-layers/meta-virtualization/recipes-kernel/=
linux/virtualization-kmeta-extra-gem5/features/disable-arm64-sve.scc b/me=
ta-gem5/dynamic-layers/meta-virtualization/recipes-kernel/linux/virtualiz=
ation-kmeta-extra-gem5/features/disable-arm64-sve.scc
deleted file mode 100644
index 6bc769cc..00000000
--- a/meta-gem5/dynamic-layers/meta-virtualization/recipes-kernel/linux/v=
irtualization-kmeta-extra-gem5/features/disable-arm64-sve.scc
+++ /dev/null
@@ -1,3 +0,0 @@
-define KFEATURE_DESCRIPTION "Disable SVE support"
-
-kconf non-hardware disable-arm64-sve.cfg
diff --git a/meta-gem5/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarc=
h64_%.bbappend b/meta-gem5/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-=
aarch64_%.bbappend
deleted file mode 100644
index 3dd2cba2..00000000
--- a/meta-gem5/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_%.b=
bappend
+++ /dev/null
@@ -1,16 +0,0 @@
-# Gem5 aarch64 support
-COMPATIBLE_MACHINE:gem5-arm64 =3D "gem5-arm64"
-
-PROVIDES:gem5-arm64 +=3D "virtual/gem5-bootloader"
-
-# For gem5 we use the dtb generated by gem5 directly
-DEPENDS:append:gem5-arm64 =3D " gem5-aarch64-dtb"
-BOOT_WRAPPER_AARCH64_DEVICETREE:gem5-arm64 =3D "gem5-aarch64.dtb"
-
-# The dtb must be generated for us to generate the axf
-DEPLOY_DEPEND_LIST ?=3D ""
-DEPLOY_DEPEND_LIST:gem5-arm64 =3D " gem5-aarch64-dtb:do_deploy"
-do_deploy[depends] +=3D "${DEPLOY_DEPEND_LIST}"
-
-# The base recipe has been upgraded, so hold back at known working revis=
ion
-SRCREV =3D "8d5a765251d9113c3c0f9fa14de42a9e7486fe8a"
diff --git a/meta-gem5/recipes-devtools/gem5/files/mapping.patch b/meta-g=
em5/recipes-devtools/gem5/files/mapping.patch
deleted file mode 100644
index 3a7cb437..00000000
--- a/meta-gem5/recipes-devtools/gem5/files/mapping.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 89958f7f30ec722e30e1bcffdeab547c874fa475 Mon Sep 17 00:00:00 2001
-From: Adrian Herrera <adrian.herrera@arm.com>
-Date: Mon, 15 Mar 2021 13:14:44 +0000
-Subject: [PATCH] python: debug, fix Mapping import
-
-Change "collections.Mapping" to "collections.abc.Mapping".
-"collections.Mapping" was an alias, it is deprecated starting from Pytho=
n 3.3, and it will be removed in Python 3.10.
-
-Change-Id: Ic257e3c5206eb3d48d4eed85a93fac48bd3b8dc4
-Signed-off-by: Adrian Herrera <adrian.herrera@arm.com>
-Reviewed-on: https://gem5-review.googlesource.com/c/public/gem5/+/43023
-Reviewed-by: Jason Lowe-Power <power.jg@gmail.com>
-Maintainer: Jason Lowe-Power <power.jg@gmail.com>
-Tested-by: kokoro <noreply+kokoro@google.com>
----
- src/python/m5/debug.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/python/m5/debug.py b/src/python/m5/debug.py
-index d808850cc..787a39ece 100644
---- a/src/python/m5/debug.py
-+++ b/src/python/m5/debug.py
-@@ -26,7 +26,7 @@
-
- from __future__ import print_function
-
--from collections import Mapping
-+from collections.abc import Mapping
-
- import _m5.debug
- from _m5.debug import SimpleFlag, CompoundFlag
---=20
-2.25.1
-
diff --git a/meta-gem5/recipes-devtools/gem5/files/start-gem5.sh b/meta-g=
em5/recipes-devtools/gem5/files/start-gem5.sh
deleted file mode 100644
index 63354116..00000000
--- a/meta-gem5/recipes-devtools/gem5/files/start-gem5.sh
+++ /dev/null
@@ -1,39 +0,0 @@
-#!/bin/bash
-
-# Get parameters from bitbake configuration
-
-source <(bitbake -e gem5-aarch64-native | grep \
-    -e "^STAGING_.*_NATIVE=3D" \
-    -e "^DEPLOY_DIR.*=3D" \
-    -e "^GEM5_RUN.*=3D")
-
-export M5_PATH=3D"${DEPLOY_DIR_IMAGE}"
-
-args=3D""
-
-if [ -n "${GEM5_RUN_KERNEL}" ]; then
-    kernfile=3D$(readlink -f ${DEPLOY_DIR_IMAGE}/${GEM5_RUN_KERNEL})
-    args=3D"$args --kernel=3D$kernfile"
-fi
-
-if [ -n "${GEM5_RUN_DISK}" ]; then
-    diskfile=3D$(readlink -f ${DEPLOY_DIR_IMAGE}/${GEM5_RUN_DISK})
-    args=3D"$args --disk-image=3D$diskfile"
-fi
-
-if [ -n "${GEM5_RUN_DTB}" ]; then
-    dtbfile=3D$(readlink -f ${DEPLOY_DIR_IMAGE}/${GEM5_RUN_DTB})
-    args=3D"$args --dtb=3D$dtbfile"
-fi
-
-if [ -n "${GEM5_RUN_CMDLINE}" ]; then
-    args=3D"$args --command-line=3D'${GEM5_RUN_CMDLINE}'"
-fi
-
-if [ -n "${GEM5_RUN_EXTRA}" ]; then
-    args=3D"$args ${GEM5_RUN_EXTRA}"
-fi
-
-oe-run-native gem5-aarch64-native ${GEM5_RUN_CONFIG} \
-    ${STAGING_DATADIR_NATIVE}/gem5/${GEM5_RUN_PROFILE} ${args} "$@"
-
diff --git a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-bootloader.inc =
b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-bootloader.inc
deleted file mode 100644
index c4fd3a1d..00000000
--- a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-bootloader.inc
+++ /dev/null
@@ -1,30 +0,0 @@
-# Build instructions for gem5 custom bootloader
-
-SUMMARY =3D "Gem5 AARCH64 boot loader"
-LICENSE =3D "BSD-3-Clause"
-
-inherit deploy
-
-PROVIDES +=3D "virtual/gem5-bootloader"
-
-COMPATIBLE_MACHINE =3D "gem5-arm64"
-
-BOOTLOADER_SRC_PATH ?=3D "${S}/system/arm/bootloader/arm64"
-
-# no configure step
-do_configure[noexec] =3D "1"
-
-# no install
-do_install[noexec] =3D "1"
-
-do_compile() {
-    oe_runmake -C ${BOOTLOADER_SRC_PATH} all CROSS_COMPILE=3D${TARGET_PR=
EFIX}
-}
-
-do_deploy() {
-    oe_runmake -C ${BOOTLOADER_SRC_PATH} install \
-        CROSS_COMPILE=3D${TARGET_PREFIX} DESTDIR=3D${DEPLOYDIR}/binaries
-}
-
-addtask deploy before do_build after do_compile
-
diff --git a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-bootloader_20.b=
b b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-bootloader_20.bb
deleted file mode 100644
index 67570f63..00000000
--- a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-bootloader_20.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-# gem5 custom bootloader
-
-require gem5-source_20.inc
-
-BPN =3D "gem5-aarch64-bootloader"
-
-require gem5-aarch64-bootloader.inc
diff --git a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-dtb.bb b/meta-g=
em5/recipes-devtools/gem5/gem5-aarch64-dtb.bb
deleted file mode 100644
index 50ac0300..00000000
--- a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-dtb.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-# Use gem5 executable to produce a dtb
-
-LICENSE =3D "MIT"
-
-inherit deploy
-
-DEPENDS =3D "gem5-aarch64-native"
-
-do_configure[noexec] =3D "1"
-
-do_compile() {
-    # generate a dtb using gem5
-    gem5.opt \
-        ${STAGING_DATADIR_NATIVE}/gem5/${GEM5_RUN_PROFILE} \
-        --dtb-gen
-
-    if [ ! -f m5out/system.dtb ]; then
-        echo "No dtb generated !!!"
-        exit 1
-    fi
-}
-
-do_install[noexec] =3D "1"
-
-do_deploy() {
-    install --d ${DEPLOYDIR}
-    cp m5out/system.dtb ${DEPLOYDIR}/gem5-aarch64.dtb
-}
-addtask deploy before do_build after do_compile
-
diff --git a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native.inc b/me=
ta-gem5/recipes-devtools/gem5/gem5-aarch64-native.inc
deleted file mode 100644
index 2fd5206e..00000000
--- a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native.inc
+++ /dev/null
@@ -1,40 +0,0 @@
-# gem5 aarch64 specific configuration
-
-# Build arm64 gem5
-GEM5_BUILD_CONFIGS ?=3D "build/ARM/gem5.${GEM5_BUILD_VARIANT}"
-
-SRC_URI +=3D "file://start-gem5.sh"
-
-inherit deploy
-
-# Parameters for the start script
-
-GEM5_RUN_CONFIG ?=3D "gem5.${GEM5_BUILD_VARIANT}"
-
-# Linux kernel file to boot
-GEM5_RUN_KERNEL ?=3D "vmlinux"
-
-# Disk Image to use
-GEM5_RUN_DISK ?=3D "*-${MACHINE}.ext4"
-
-# DTB to use
-GEM5_RUN_DTB ?=3D "${@os.path.basename(d.getVar('KERNEL_DEVICETREE'))}"
-
-# Linux command line to pass
-GEM5_RUN_CMDLINE ?=3D "earlyprintk=3Dpl011,0x1c090000 console=3DttyAMA0 =
rw mem=3D512MB root=3D/dev/sda rootwait"
-
-# Extra arguments to pass to gem5
-GEM5_RUN_EXTRA ?=3D "--mem-size=3D512MB -n 4 --machine-type=3DVExpress_G=
EM5_V2"
-
-#This is required so that our binaries are in the sysroot. We need this
-# to have both gem5 required libraries and gem5 in the same sysroot.
-addtask addto_recipe_sysroot after do_populate_sysroot before do_build
-
-do_deploy[sstate-outputdirs] =3D "${DEPLOY_DIR_TOOLS}"
-do_deploy() {
-    install -d ${DEPLOYDIR}
-
-    install -m 755 ${WORKDIR}/start-gem5.sh ${DEPLOYDIR}/.
-}
-addtask deploy before do_build after do_compile
-
diff --git a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native/0001-dev=
-arm-SMMUv3-enable-interrupt-interface.patch b/meta-gem5/recipes-devtools=
/gem5/gem5-aarch64-native/0001-dev-arm-SMMUv3-enable-interrupt-interface.=
patch
deleted file mode 100644
index 6d00cc26..00000000
--- a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native/0001-dev-arm-SM=
MUv3-enable-interrupt-interface.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From be710c5657b03bc9a9ce18ecf7ce1956265bae47 Mon Sep 17 00:00:00 2001
-From: Adrian Herrera <adrian.herrera@arm.com>
-Date: Thu, 10 Dec 2020 18:07:21 +0000
-Subject: [PATCH] dev-arm: SMMUv3, enable interrupt interface
-
-Users can set "irq_interface_enable" to allow software to program
-SMMU_IRQ_CTRL and SMMU_IRQ_CTRLACK. This is required to boot Linux v5.4+
-in a reasonable time. Notice the model does not implement architectural
-interrupt sources, so no assertions will happen.
-
-Change-Id: Ie138befdf5a204fe8fce961081c575c2166e22b9
-Signed-off-by: Adrian Herrera <adrian.herrera@arm.com>
-Reviewed-on: https://gem5-review.googlesource.com/c/public/gem5/+/38555
-Tested-by: kokoro <noreply+kokoro@google.com>
-Reviewed-by: Andreas Sandberg <andreas.sandberg@arm.com>
-Maintainer: Andreas Sandberg <andreas.sandberg@arm.com>
-
-Upstream-Status: Accepted [https://gem5-review.googlesource.com/c/public=
/gem5/+/38555]
-Expected version: v20.2
----
- src/dev/arm/SMMUv3.py  |  5 +++++
- src/dev/arm/smmu_v3.cc | 10 +++++++++-
- src/dev/arm/smmu_v3.hh |  4 +++-
- 3 files changed, 17 insertions(+), 2 deletions(-)
-
-diff --git a/src/dev/arm/SMMUv3.py b/src/dev/arm/SMMUv3.py
-index 29c15682bf..f57be896f9 100644
---- a/src/dev/arm/SMMUv3.py
-+++ b/src/dev/arm/SMMUv3.py
-@@ -91,6 +91,11 @@ class SMMUv3(ClockedObject):
-     reg_map =3D Param.AddrRange('Address range for control registers')
-     system =3D Param.System(Parent.any, "System this device is part of"=
)
-=20
-+    irq_interface_enable =3D Param.Bool(False,
-+            "This flag enables software to program SMMU_IRQ_CTRL and "
-+            "SMMU_IRQ_CTRLACK as if the model implemented architectural=
 "
-+            "interrupt sources")
-+
-     device_interfaces =3D VectorParam.SMMUv3DeviceInterface([],
-                                         "Responder interfaces")
-=20
-diff --git a/src/dev/arm/smmu_v3.cc b/src/dev/arm/smmu_v3.cc
-index f9bdc277c6..d73f270170 100644
---- a/src/dev/arm/smmu_v3.cc
-+++ b/src/dev/arm/smmu_v3.cc
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2013, 2018-2019 ARM Limited
-+ * Copyright (c) 2013, 2018-2020 ARM Limited
-  * All rights reserved
-  *
-  * The license below extends only to copyright in the software and shal=
l
-@@ -58,6 +58,7 @@ SMMUv3::SMMUv3(SMMUv3Params *params) :
-     requestPort(name() + ".request", *this),
-     tableWalkPort(name() + ".walker", *this),
-     controlPort(name() + ".control", *this, params->reg_map),
-+    irqInterfaceEnable(params->irq_interface_enable),
-     tlb(params->tlb_entries, params->tlb_assoc, params->tlb_policy),
-     configCache(params->cfg_entries, params->cfg_assoc, params->cfg_pol=
icy),
-     ipaCache(params->ipa_entries, params->ipa_assoc, params->ipa_policy=
),
-@@ -626,6 +627,13 @@ SMMUv3::writeControl(PacketPtr pkt)
-             assert(pkt->getSize() =3D=3D sizeof(uint32_t));
-             regs.cr0 =3D regs.cr0ack =3D pkt->getLE<uint32_t>();
-             break;
-+        case offsetof(SMMURegs, irq_ctrl):
-+            assert(pkt->getSize() =3D=3D sizeof(uint32_t));
-+            if (irqInterfaceEnable) {
-+                warn("SMMUv3::%s No support for interrupt sources", __f=
unc__);
-+                regs.irq_ctrl =3D regs.irq_ctrlack =3D pkt->getLE<uint3=
2_t>();
-+            }
-+            break;
-=20
-         case offsetof(SMMURegs, cr1):
-         case offsetof(SMMURegs, cr2):
-diff --git a/src/dev/arm/smmu_v3.hh b/src/dev/arm/smmu_v3.hh
-index 6b3f3982b8..a001d71178 100644
---- a/src/dev/arm/smmu_v3.hh
-+++ b/src/dev/arm/smmu_v3.hh
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2013, 2018-2019 ARM Limited
-+ * Copyright (c) 2013, 2018-2020 ARM Limited
-  * All rights reserved
-  *
-  * The license below extends only to copyright in the software and shal=
l
-@@ -94,6 +94,8 @@ class SMMUv3 : public ClockedObject
-     SMMUTableWalkPort tableWalkPort;
-     SMMUControlPort   controlPort;
-=20
-+    const bool irqInterfaceEnable;
-+
-     ARMArchTLB  tlb;
-     ConfigCache configCache;
-     IPACache    ipaCache;
---=20
-2.17.1
-
diff --git a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb b/=
meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb
deleted file mode 100644
index 057aad87..00000000
--- a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-require gem5-source_20.inc
-
-SRC_URI +=3D "file://0001-dev-arm-SMMUv3-enable-interrupt-interface.patc=
h"
-
-BPN =3D "gem5-aarch64-native"
-
-require gem5-aarch64-native.inc
-require gem5-native.inc
-
-# Get rid of compiler errors when building protobuf
-GEM5_SCONS_ARGS:append =3D " CCFLAGS_EXTRA=3D'-Wno-error=3Dunused-variab=
le' --verbose"
-
-# Get rid of linker errors and have a faster link process
-GEM5_SCONS_ARGS:append =3D " LDFLAGS_EXTRA=3D'${BUILD_LDFLAGS}' \
-MARSHAL_LDFLAGS_EXTRA=3D'${BUILD_LDFLAGS}' --force-lto "
-
-do_compile:prepend() {
-    # Gem5 expect to have python in the path (can be python2 or 3)
-    # Create a link named python to python3
-    real=3D$(which ${PYTHON})
-    ln -snf $real $(dirname $real)/python
-}
diff --git a/meta-gem5/recipes-devtools/gem5/gem5-m5ops/0001-util-m5ops-o=
ptional-extra-build-flags.patch b/meta-gem5/recipes-devtools/gem5/gem5-m5=
ops/0001-util-m5ops-optional-extra-build-flags.patch
deleted file mode 100644
index b446a2fe..00000000
--- a/meta-gem5/recipes-devtools/gem5/gem5-m5ops/0001-util-m5ops-optional=
-extra-build-flags.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 32e35a2f179d1b036d2eb699d77f869f7787f36b Mon Sep 17 00:00:00 2001
-From: Adrian Herrera <adrian.herrera@arm.com>
-Date: Tue, 8 Dec 2020 20:12:55 +0000
-Subject: [PATCH] util: m5ops, optional extra build flags
-
-This increases compilation control for users. Main use case is building
-m5ops as part of an image distribution. Specifying a different sysroot
-or dynamic linker may be required when the cross toolchain is built as
-part of the process.
-
-Change-Id: Icbd3faa92ea6e084fc4a9b2db83129bce73faf21
-Signed-off-by: Adrian Herrera <adrian.herrera@arm.com>
-Reviewed-on: https://gem5-review.googlesource.com/c/public/gem5/+/38416
-Reviewed-by: Jason Lowe-Power <power.jg@gmail.com>
-Reviewed-by: Gabe Black <gabe.black@gmail.com>
-Maintainer: Jason Lowe-Power <power.jg@gmail.com>
-Tested-by: kokoro <noreply+kokoro@google.com>
-
-Upstream-Status: Accepted [https://gem5-review.googlesource.com/c/public=
/gem5/+/38416]
-Expected version: v20.2
----
- util/m5/SConstruct | 14 +++++++++++---
- 1 file changed, 11 insertions(+), 3 deletions(-)
-
-diff --git a/util/m5/SConstruct b/util/m5/SConstruct
-index bbae8d9bbf..a37573d763 100644
---- a/util/m5/SConstruct
-+++ b/util/m5/SConstruct
-@@ -136,16 +136,24 @@ for root, dirs, files in os.walk(abspath(src_dir))=
:
-         #
-         # This also considers scons command line settings which may loo=
k like
-         # environment variables, but are set after "scons" on the comma=
nd line.
--        def get_abi_opt(name, default):
-+        def _extract_abi_opt_val(name, default):
-             var_name =3D env.subst('${ABI}.%s' % name)
--            env[name] =3D os.environ.get(
--                    var_name, ARGUMENTS.get(var_name, default))
-+            return os.environ.get(var_name, ARGUMENTS.get(var_name, def=
ault))
-+        def get_abi_opt(name, default):
-+            env[name] =3D _extract_abi_opt_val(name, default)
-+        def append_abi_opt(name):
-+            env.Append(**{ name: _extract_abi_opt_val(name, '') })
-=20
-         # Process the ABI's settings in the SConsopts file, storing the=
m
-         # in a copy of the primary environment.
-         env.SConscript(Dir(root).File('SConsopts'),
-                        exports=3D[ 'env', 'get_abi_opt' ])
-=20
-+        # The user can pass extra build flags for each ABI
-+        append_abi_opt('CCFLAGS')
-+        append_abi_opt('CXXFLAGS')
-+        append_abi_opt('LINKFLAGS')
-+
-         # Once all the options have been configured, set up build targe=
ts for
-         # this abi.
-         abi_dir =3D build_dir.Dir(env.subst('${ABI}'))
---=20
-2.17.1
-
diff --git a/meta-gem5/recipes-devtools/gem5/gem5-m5ops_20.bb b/meta-gem5=
/recipes-devtools/gem5/gem5-m5ops_20.bb
deleted file mode 100644
index d55ed857..00000000
--- a/meta-gem5/recipes-devtools/gem5/gem5-m5ops_20.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-require gem5-source_20.inc
-inherit scons
-
-HOMEPAGE =3D "https://www.gem5.org/documentation/general_docs/m5ops"
-SUMMARY =3D "m5ops provide pseudo-instructions to trigger gem5 functiona=
lity"
-LICENSE =3D "BSD-3-Clause"
-
-M5OPS_DIR =3D "util/m5"
-
-SRC_URI +=3D "file://0001-util-m5ops-optional-extra-build-flags.patch"
-
-OUT_DIR =3D "build/${TARGET_ARCH}/out"
-
-EXTRA_OESCONS +=3D "${TARGET_ARCH}.CROSS_COMPILE=3D${TARGET_PREFIX} \
-                  ${TARGET_ARCH}.CCFLAGS=3D--sysroot=3D${STAGING_DIR_TAR=
GET} \
-                  ${TARGET_ARCH}.LINKFLAGS=3D--sysroot=3D${STAGING_DIR_T=
ARGET} \
-                  -C ${S}/${M5OPS_DIR} ${OUT_DIR}/m5"
-
-# The SConstruct file for m5ops does not provide a "install" target
-# We do the install process within the recipe
-do_install() {
-    install -d ${D}${bindir} ${D}${libdir} ${D}${includedir}
-    install -m 755 ${B}/${M5OPS_DIR}/${OUT_DIR}/m5 ${D}${bindir}
-    install -m 644 ${B}/${M5OPS_DIR}/${OUT_DIR}/libm5.a ${D}${libdir}
-    install -m 644 ${B}/include/gem5/m5ops.h ${D}${includedir}
-}
diff --git a/meta-gem5/recipes-devtools/gem5/gem5-m5readfile.bb b/meta-ge=
m5/recipes-devtools/gem5/gem5-m5readfile.bb
deleted file mode 100644
index 9cddc270..00000000
--- a/meta-gem5/recipes-devtools/gem5/gem5-m5readfile.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-inherit update-rc.d
-
-SUMMARY =3D "Enables reading any script at simulation launch time"
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=3D55=
0794465ba0ec5312d6919e203a55f9"
-
-SRC_URI =3D "file://m5-readfile.sh"
-
-INITSCRIPT_NAME =3D "m5-readfile.sh"
-INITSCRIPT_PARAMS =3D "defaults 99"
-
-do_install() {
-    install -d ${D}/${INIT_D_DIR}
-    install -m 755 ${WORKDIR}/m5-readfile.sh ${D}/${INIT_D_DIR}
-}
-
-RDEPENDS:${PN} =3D "gem5-m5ops"
diff --git a/meta-gem5/recipes-devtools/gem5/gem5-m5readfile/m5-readfile.=
sh b/meta-gem5/recipes-devtools/gem5/gem5-m5readfile/m5-readfile.sh
deleted file mode 100755
index edf79b84..00000000
--- a/meta-gem5/recipes-devtools/gem5/gem5-m5readfile/m5-readfile.sh
+++ /dev/null
@@ -1,9 +0,0 @@
-#!/bin/sh
-### BEGIN INIT INFO
-# Provides:         m5-readfile
-# Required-Start:   $all
-# Default-Start:    5
-# Description:      Enables reading any script at simulation launch time=
.
-### END INIT INFO
-
-m5 readfile | sh
diff --git a/meta-gem5/recipes-devtools/gem5/gem5-m5term-native_20.bb b/m=
eta-gem5/recipes-devtools/gem5/gem5-m5term-native_20.bb
deleted file mode 100644
index b91dbbc7..00000000
--- a/meta-gem5/recipes-devtools/gem5/gem5-m5term-native_20.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-require gem5-source_20.inc
-
-SUMMARY =3D "m5term allows users to connect to gem5's simulated console"
-HOMEPAGE =3D "https://www.gem5.org/documentation/general_docs/fullsystem=
/m5term"
-LICENSE =3D "BSD-3-Clause"
-
-inherit native
-
-M5TERM_DIR =3D "util/term"
-
-SRC_URI +=3D "file://0001-add-makefile-flags.patch"
-
-do_compile() {
-    oe_runmake -C ${S}/${M5TERM_DIR}
-}
-
-# The Makefile for m5term does not provide a "install" target
-# We do the install process within the recipe
-do_install() {
-    install -d ${D}${bindir}
-    install -m 755 ${B}/${M5TERM_DIR}/m5term ${D}${bindir}
-}
-
-addtask addto_recipe_sysroot before do_build
diff --git a/meta-gem5/recipes-devtools/gem5/gem5-m5term/0001-add-makefil=
e-flags.patch b/meta-gem5/recipes-devtools/gem5/gem5-m5term/0001-add-make=
file-flags.patch
deleted file mode 100644
index d13ef4ce..00000000
--- a/meta-gem5/recipes-devtools/gem5/gem5-m5term/0001-add-makefile-flags=
.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 688f7103e08318edbd48cf830c0ab3a048761bbb Mon Sep 17 00:00:00 2001
-From: Adrian Herrera <adrian.herrera@arm.com>
-Date: Thu, 03 Dec 2020 16:45:59 +0000
-Subject: [PATCH] util: m5term, fix LDFLAGS, standard make variables
-
-Enables build systems to provide necessary flags to build m5term.
-Useful specially if a different linker is intended to be used.
-
-Change-Id: If7f867cc0965d6ad4627b5421e00a99cc3d64989
-Signed-off-by: Adrian Herrera <adrian.herrera@arm.com>
-
-Upstream-Status: Accepted [https://gem5-review.googlesource.com/c/public=
/gem5/+/38256]
-Expected version: v20.2
----
-
-diff --git a/util/term/Makefile b/util/term/Makefile
-index 658b961..4aa1c52 100644
---- a/util/term/Makefile
-+++ b/util/term/Makefile
-@@ -24,12 +24,12 @@
- # (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
- # OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-=20
--CCFLAGS=3D -g -O0
-+CFLAGS ?=3D -g -O0
-=20
- default: m5term
-=20
- m5term: term.c
--	$(CC) $(LFLAGS) -o $@ $^
-+	$(CC) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LDLIBS)
-=20
- install: m5term
- 	$(SUDO) install -o root -m 555 m5term /usr/local/bin
diff --git a/meta-gem5/recipes-devtools/gem5/gem5-native.inc b/meta-gem5/=
recipes-devtools/gem5/gem5-native.inc
deleted file mode 100644
index 0f794b3f..00000000
--- a/meta-gem5/recipes-devtools/gem5/gem5-native.inc
+++ /dev/null
@@ -1,57 +0,0 @@
-# gem5 platform independent build information
-
-SUMMARY =3D "A modular platform for computer-system architecture researc=
h"
-HOMEPAGE =3D "http://gem5.org"
-LICENSE =3D "BSD-3-Clause & MIT & LGPL-2.1-only"
-
-# Gem5 build and run parameter
-
-# See http://www.gem5.org/documentation/general_docs/building for the li=
st of variants
-GEM5_BUILD_VARIANT ?=3D "opt"
-
-# What gem5 binary are we building
-GEM5_BUILD_CONFIGS ?=3D "build/X86/gem5.{GEM5_BUILD_VARIANT}"
-
-# Extra directories with sources for gem5 build. Intended to be used fro=
m
-# machine configuration files, to add out-of-tree gem5 models of their
-# hardware components.
-GEM5_EXTRAS ?=3D ""
-
-# Scons build arguments
-GEM5_SCONS_ARGS ?=3D "CC=3D${BUILD_CC} CXX=3D${BUILD_CXX} \
-    AS=3D${BUILD_AS} AR=3D${BUILD_AR} ${GEM5_BUILD_CONFIGS} \
-    PYTHON_CONFIG=3Dpython3-config EXTRAS=3D${GEM5_EXTRAS}"
-
-# Default profile to run
-GEM5_RUN_PROFILE ?=3D "configs/example/fs.py"
-
-# We are building a native package and we need to use scons
-inherit scons native
-
-# the build is using several tools:
-# python3: scons and six
-# google protobuf
-# pkgconfig
-# hdf5
-DEPENDS +=3D "m4-native python3-six-native protobuf-native hdf5-native p=
kgconfig-native \
-    boost-native libpng-native"
-
-EXTRA_OESCONS =3D "${GEM5_SCONS_ARGS}"
-
-do_install() {
-
-    install -d ${D}${datadir}/gem5
-    cp -a --no-preserve=3Downership -rf configs ${D}${datadir}/gem5/.
-
-    for f in ${GEM5_BUILD_CONFIGS}; do
-        destname=3D$(basename $f)
-        install -d ${D}${bindir}
-        install -m 755 $f ${D}${bindir}/$destname
-    done
-}
-
-FILES:${PN} =3D "${datadir}/gem5/* ${bindir}/*"
-INSANE_SKIP:${PN} +=3D "already-stripped"
-RDEPENDS:${PN} +=3D "python3-native hdf5-native protobuf-native libpng-n=
ative"
-
-addtask addto_recipe_sysroot before do_build
diff --git a/meta-gem5/recipes-devtools/gem5/gem5-source_20.inc b/meta-ge=
m5/recipes-devtools/gem5/gem5-source_20.inc
deleted file mode 100644
index bf448fef..00000000
--- a/meta-gem5/recipes-devtools/gem5/gem5-source_20.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d9514d69d8abf88b6e9125e759bf=
0ab \
-                    file://LICENSE;md5=3Da585e2893cee63d16a1d8bc16c6297e=
c"
-
-SRC_URI =3D "git://gem5.googlesource.com/public/gem5;protocol=3Dhttps;no=
branch=3D1 \
-           file://mapping.patch"
-RELEASE_TAG =3D "v20.1.0.5"
-SRCREV =3D "31cd81fdec46bae4b48d4f3788776936389dbdec"
-
-PV =3D "${RELEASE_TAG}"
-
-S =3D "${WORKDIR}/git"
diff --git a/meta-gem5/recipes-kernel/linux/files/0001-lib-build_OID_regi=
stry-fix-reproducibility-issues.patch b/meta-gem5/recipes-kernel/linux/fi=
les/0001-lib-build_OID_registry-fix-reproducibility-issues.patch
deleted file mode 100644
index 4c95a415..00000000
--- a/meta-gem5/recipes-kernel/linux/files/0001-lib-build_OID_registry-fi=
x-reproducibility-issues.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From f678d79b3bede48c9e095e6e9c46bd3542f23077 Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@gmail.com>
-Date: Sun, 10 Jul 2022 22:56:53 -0400
-Subject: [PATCH 1/2] lib/build_OID_registry: fix reproducibility issues
-
-The script build_OID_registry captures the full path of itself
-in the generated data. This causes reproduciblity issues as the
-path is captured and packaged.
-
-We use the basename of the script instead, and that allows us
-to be reprodicible, with slightly less information captured in
-the output data (but the generating script can still easily
-be found).
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
----
- lib/build_OID_registry | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/lib/build_OID_registry b/lib/build_OID_registry
-index d7fc32ea8ac2..f6de0a7f7457 100755
---- a/lib/build_OID_registry
-+++ b/lib/build_OID_registry
-@@ -8,6 +8,7 @@
- #
-=20
- use strict;
-+use File::Basename;
-=20
- my @names =3D ();
- my @oids =3D ();
-@@ -35,7 +36,7 @@ close IN_FILE || die;
- #
- open C_FILE, ">$ARGV[1]" or die;
- print C_FILE "/*\n";
--print C_FILE " * Automatically generated by ", $0, ".  Do not edit\n";
-+print C_FILE " * Automatically generated by ", basename $0, ".  Do not =
edit\n";
- print C_FILE " */\n";
-=20
- #
---=20
-2.34.1
-
diff --git a/meta-gem5/recipes-kernel/linux/files/0002-vt-conmakehash-imp=
rove-reproducibility.patch b/meta-gem5/recipes-kernel/linux/files/0002-vt=
-conmakehash-improve-reproducibility.patch
deleted file mode 100644
index 74156afe..00000000
--- a/meta-gem5/recipes-kernel/linux/files/0002-vt-conmakehash-improve-re=
producibility.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 10a09290f97d0435b9b304d3ef980b0cafa87bd2 Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@gmail.com>
-Date: Sun, 10 Jul 2022 21:37:07 -0400
-Subject: [PATCH 2/2] vt/conmakehash: improve reproducibility
-
-The file generated by conmakehash capture the application
-path used to generate the file. While that can be informative,
-it varies based on where the kernel was built, as the full
-path is captured.
-
-We tweak the application to use a second input as the "capture
-name", and then modify the Makefile to pass the basename of
-the source, making it reproducible.
-
-This could be improved by using some sort of path mapping,
-or the application manipualing argv[1] itself, but for now
-this solves the reprodicibility issue.
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
----
- drivers/tty/vt/Makefile | 2 +-
- scripts/conmakehash.c   | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/drivers/tty/vt/Makefile b/drivers/tty/vt/Makefile
-index edbbe0ccdb83..19e21968f8de 100644
---- a/drivers/tty/vt/Makefile
-+++ b/drivers/tty/vt/Makefile
-@@ -13,7 +13,7 @@ obj-$(CONFIG_HW_CONSOLE)		+=3D vt.o defkeymap.o
- clean-files :=3D consolemap_deftbl.c defkeymap.c
-=20
- quiet_cmd_conmk =3D CONMK   $@
--      cmd_conmk =3D scripts/conmakehash $< > $@
-+      cmd_conmk =3D scripts/conmakehash $< $(shell basename $<) > $@
-=20
- $(obj)/consolemap_deftbl.c: $(src)/$(FONTMAPFILE)
- 	$(call cmd,conmk)
-diff --git a/scripts/conmakehash.c b/scripts/conmakehash.c
-index cddd789fe46e..d62510b280e9 100644
---- a/scripts/conmakehash.c
-+++ b/scripts/conmakehash.c
-@@ -253,7 +253,7 @@ int main(int argc, char *argv[])
- #include <linux/types.h>\n\
- \n\
- u8 dfont_unicount[%d] =3D \n\
--{\n\t", argv[1], fontlen);
-+{\n\t", argv[2], fontlen);
-=20
-   for ( i =3D 0 ; i < fontlen ; i++ )
-     {
---=20
-2.34.1
-
diff --git a/meta-gem5/recipes-kernel/linux/files/dts/gem5-arm64/armv8_ge=
m5_v2_1cpu.dts b/meta-gem5/recipes-kernel/linux/files/dts/gem5-arm64/armv=
8_gem5_v2_1cpu.dts
deleted file mode 100644
index 0e59fdf8..00000000
--- a/meta-gem5/recipes-kernel/linux/files/dts/gem5-arm64/armv8_gem5_v2_1=
cpu.dts
+++ /dev/null
@@ -1,95 +0,0 @@
-/*
- * Copyright (c) 2015-2016 ARM Limited
- * All rights reserved
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions ar=
e
- * met: redistributions of source code must retain the above copyright
- * notice, this list of conditions and the following disclaimer;
- * redistributions in binary form must reproduce the above copyright
- * notice, this list of conditions and the following disclaimer in the
- * documentation and/or other materials provided with the distribution;
- * neither the name of the copyright holders nor the names of its
- * contributors may be used to endorse or promote products derived from
- * this software without specific prior written permission.
- *
- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
- * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
- * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
- * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
- * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
- * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
- * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
- * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
- * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
- * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
- * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- *
- * Authors: Andreas Sandberg
- */
-
-/dts-v1/;
-
-/memreserve/ 0x80000000 0x00010000;
-
-/include/ "vexpress_gem5_v2.dtsi"
-
-/ {
-	model =3D "V2P-AARCH64";
-	compatible =3D "arm,vexpress,v2p-aarch64", "arm,vexpress";
-
-	memory@80000000 {
-		device_type =3D "memory";
-		reg =3D <0 0x80000000 0x4 0x00000000>;
-	};
-
-	cpus {
-		#address-cells =3D <1>;
-		#size-cells =3D <0>;
-
-        cpu@0 {
-            device_type =3D "cpu";
-            compatible =3D "gem5,armv8", "arm,armv8";
-            reg =3D < 0 >;
-            enable-method =3D "spin-table";
-            cpu-release-addr =3D <0 0x8000fff8>;
-        };
-
-	};
-
-	virt-encoder {
-		compatible =3D "drm,virtual-encoder";
-		port {
-			dp0_virt_input: endpoint@0 {
-				remote-endpoint =3D <&dp0_output>;
-			};
-		};
-
-		display-timings {
-			native-mode =3D <&timing0>;
-
-			timing0: timing_1080p60 {
-				/* 1920x1080-60 */
-				clock-frequency =3D <148500000>;
-				hactive =3D <1920>;
-				vactive =3D <1080>;
-				hfront-porch =3D <148>;
-				hback-porch =3D <88>;
-				hsync-len =3D <44>;
-				vfront-porch =3D <36>;
-				vback-porch =3D <4>;
-				vsync-len =3D <5>;
-			};
-		};
-	};
-};
-
-&dp0 {
-	status =3D "ok";
-
-	port {
-		dp0_output: endpoint@0 {
-			remote-endpoint =3D <&dp0_virt_input>;
-		};
-	};
-};
diff --git a/meta-gem5/recipes-kernel/linux/files/dts/gem5-arm64/armv8_ge=
m5_v2_2cpu.dts b/meta-gem5/recipes-kernel/linux/files/dts/gem5-arm64/armv=
8_gem5_v2_2cpu.dts
deleted file mode 100644
index 441d3df2..00000000
--- a/meta-gem5/recipes-kernel/linux/files/dts/gem5-arm64/armv8_gem5_v2_2=
cpu.dts
+++ /dev/null
@@ -1,103 +0,0 @@
-/*
- * Copyright (c) 2015-2016 ARM Limited
- * All rights reserved
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions ar=
e
- * met: redistributions of source code must retain the above copyright
- * notice, this list of conditions and the following disclaimer;
- * redistributions in binary form must reproduce the above copyright
- * notice, this list of conditions and the following disclaimer in the
- * documentation and/or other materials provided with the distribution;
- * neither the name of the copyright holders nor the names of its
- * contributors may be used to endorse or promote products derived from
- * this software without specific prior written permission.
- *
- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
- * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
- * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
- * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
- * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
- * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
- * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
- * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
- * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
- * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
- * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- *
- * Authors: Andreas Sandberg
- */
-
-/dts-v1/;
-
-/memreserve/ 0x80000000 0x00010000;
-
-/include/ "vexpress_gem5_v2.dtsi"
-
-/ {
-	model =3D "V2P-AARCH64";
-	compatible =3D "arm,vexpress,v2p-aarch64", "arm,vexpress";
-
-	memory@80000000 {
-		device_type =3D "memory";
-		reg =3D <0 0x80000000 0x4 0x00000000>;
-	};
-
-	cpus {
-		#address-cells =3D <1>;
-		#size-cells =3D <0>;
-
-        cpu@0 {
-            device_type =3D "cpu";
-            compatible =3D "gem5,armv8", "arm,armv8";
-            reg =3D < 0 >;
-            enable-method =3D "spin-table";
-            cpu-release-addr =3D <0 0x8000fff8>;
-        };
-
-        cpu@1 {
-            device_type =3D "cpu";
-            compatible =3D "gem5,armv8", "arm,armv8";
-            reg =3D < 1 >;
-            enable-method =3D "spin-table";
-            cpu-release-addr =3D <0 0x8000fff8>;
-        };
-
-	};
-
-	virt-encoder {
-		compatible =3D "drm,virtual-encoder";
-		port {
-			dp0_virt_input: endpoint@0 {
-				remote-endpoint =3D <&dp0_output>;
-			};
-		};
-
-		display-timings {
-			native-mode =3D <&timing0>;
-
-			timing0: timing_1080p60 {
-				/* 1920x1080-60 */
-				clock-frequency =3D <148500000>;
-				hactive =3D <1920>;
-				vactive =3D <1080>;
-				hfront-porch =3D <148>;
-				hback-porch =3D <88>;
-				hsync-len =3D <44>;
-				vfront-porch =3D <36>;
-				vback-porch =3D <4>;
-				vsync-len =3D <5>;
-			};
-		};
-	};
-};
-
-&dp0 {
-	status =3D "ok";
-
-	port {
-		dp0_output: endpoint@0 {
-			remote-endpoint =3D <&dp0_virt_input>;
-		};
-	};
-};
diff --git a/meta-gem5/recipes-kernel/linux/files/dts/gem5-arm64/armv8_ge=
m5_v2_4cpu.dts b/meta-gem5/recipes-kernel/linux/files/dts/gem5-arm64/armv=
8_gem5_v2_4cpu.dts
deleted file mode 100644
index 2d0311a5..00000000
--- a/meta-gem5/recipes-kernel/linux/files/dts/gem5-arm64/armv8_gem5_v2_4=
cpu.dts
+++ /dev/null
@@ -1,119 +0,0 @@
-/*
- * Copyright (c) 2015-2016 ARM Limited
- * All rights reserved
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions ar=
e
- * met: redistributions of source code must retain the above copyright
- * notice, this list of conditions and the following disclaimer;
- * redistributions in binary form must reproduce the above copyright
- * notice, this list of conditions and the following disclaimer in the
- * documentation and/or other materials provided with the distribution;
- * neither the name of the copyright holders nor the names of its
- * contributors may be used to endorse or promote products derived from
- * this software without specific prior written permission.
- *
- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
- * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
- * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
- * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
- * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
- * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
- * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
- * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
- * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
- * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
- * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- *
- * Authors: Andreas Sandberg
- */
-
-/dts-v1/;
-
-/memreserve/ 0x80000000 0x00010000;
-
-/include/ "vexpress_gem5_v2.dtsi"
-
-/ {
-	model =3D "V2P-AARCH64";
-	compatible =3D "arm,vexpress,v2p-aarch64", "arm,vexpress";
-
-	memory@80000000 {
-		device_type =3D "memory";
-		reg =3D <0 0x80000000 0x4 0x00000000>;
-	};
-
-	cpus {
-		#address-cells =3D <1>;
-		#size-cells =3D <0>;
-
-        cpu@0 {
-            device_type =3D "cpu";
-            compatible =3D "gem5,armv8", "arm,armv8";
-            reg =3D < 0 >;
-            enable-method =3D "spin-table";
-            cpu-release-addr =3D <0 0x8000fff8>;
-        };
-
-        cpu@1 {
-            device_type =3D "cpu";
-            compatible =3D "gem5,armv8", "arm,armv8";
-            reg =3D < 1 >;
-            enable-method =3D "spin-table";
-            cpu-release-addr =3D <0 0x8000fff8>;
-        };
-
-        cpu@2 {
-            device_type =3D "cpu";
-            compatible =3D "gem5,armv8", "arm,armv8";
-            reg =3D < 2 >;
-            enable-method =3D "spin-table";
-            cpu-release-addr =3D <0 0x8000fff8>;
-        };
-
-        cpu@3 {
-            device_type =3D "cpu";
-            compatible =3D "gem5,armv8", "arm,armv8";
-            reg =3D < 3 >;
-            enable-method =3D "spin-table";
-            cpu-release-addr =3D <0 0x8000fff8>;
-        };
-
-	};
-
-	virt-encoder {
-		compatible =3D "drm,virtual-encoder";
-		port {
-			dp0_virt_input: endpoint@0 {
-				remote-endpoint =3D <&dp0_output>;
-			};
-		};
-
-		display-timings {
-			native-mode =3D <&timing0>;
-
-			timing0: timing_1080p60 {
-				/* 1920x1080-60 */
-				clock-frequency =3D <148500000>;
-				hactive =3D <1920>;
-				vactive =3D <1080>;
-				hfront-porch =3D <148>;
-				hback-porch =3D <88>;
-				hsync-len =3D <44>;
-				vfront-porch =3D <36>;
-				vback-porch =3D <4>;
-				vsync-len =3D <5>;
-			};
-		};
-	};
-};
-
-&dp0 {
-	status =3D "ok";
-
-	port {
-		dp0_output: endpoint@0 {
-			remote-endpoint =3D <&dp0_virt_input>;
-		};
-	};
-};
diff --git a/meta-gem5/recipes-kernel/linux/files/dts/gem5-arm64/armv8_ge=
m5_v2_8cpu.dts b/meta-gem5/recipes-kernel/linux/files/dts/gem5-arm64/armv=
8_gem5_v2_8cpu.dts
deleted file mode 100644
index ba94d074..00000000
--- a/meta-gem5/recipes-kernel/linux/files/dts/gem5-arm64/armv8_gem5_v2_8=
cpu.dts
+++ /dev/null
@@ -1,151 +0,0 @@
-/*
- * Copyright (c) 2015-2016 ARM Limited
- * All rights reserved
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions ar=
e
- * met: redistributions of source code must retain the above copyright
- * notice, this list of conditions and the following disclaimer;
- * redistributions in binary form must reproduce the above copyright
- * notice, this list of conditions and the following disclaimer in the
- * documentation and/or other materials provided with the distribution;
- * neither the name of the copyright holders nor the names of its
- * contributors may be used to endorse or promote products derived from
- * this software without specific prior written permission.
- *
- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
- * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
- * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
- * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
- * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
- * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
- * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
- * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
- * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
- * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
- * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- *
- * Authors: Andreas Sandberg
- */
-
-/dts-v1/;
-
-/memreserve/ 0x80000000 0x00010000;
-
-/include/ "vexpress_gem5_v2.dtsi"
-
-/ {
-	model =3D "V2P-AARCH64";
-	compatible =3D "arm,vexpress,v2p-aarch64", "arm,vexpress";
-
-	memory@80000000 {
-		device_type =3D "memory";
-		reg =3D <0 0x80000000 0x4 0x00000000>;
-	};
-
-	cpus {
-		#address-cells =3D <1>;
-		#size-cells =3D <0>;
-
-        cpu@0 {
-            device_type =3D "cpu";
-            compatible =3D "gem5,armv8", "arm,armv8";
-            reg =3D < 0 >;
-            enable-method =3D "spin-table";
-            cpu-release-addr =3D <0 0x8000fff8>;
-        };
-
-        cpu@1 {
-            device_type =3D "cpu";
-            compatible =3D "gem5,armv8", "arm,armv8";
-            reg =3D < 1 >;
-            enable-method =3D "spin-table";
-            cpu-release-addr =3D <0 0x8000fff8>;
-        };
-
-        cpu@2 {
-            device_type =3D "cpu";
-            compatible =3D "gem5,armv8", "arm,armv8";
-            reg =3D < 2 >;
-            enable-method =3D "spin-table";
-            cpu-release-addr =3D <0 0x8000fff8>;
-        };
-
-        cpu@3 {
-            device_type =3D "cpu";
-            compatible =3D "gem5,armv8", "arm,armv8";
-            reg =3D < 3 >;
-            enable-method =3D "spin-table";
-            cpu-release-addr =3D <0 0x8000fff8>;
-        };
-
-        cpu@4 {
-            device_type =3D "cpu";
-            compatible =3D "gem5,armv8", "arm,armv8";
-            reg =3D < 4 >;
-            enable-method =3D "spin-table";
-            cpu-release-addr =3D <0 0x8000fff8>;
-        };
-
-        cpu@5 {
-            device_type =3D "cpu";
-            compatible =3D "gem5,armv8", "arm,armv8";
-            reg =3D < 5 >;
-            enable-method =3D "spin-table";
-            cpu-release-addr =3D <0 0x8000fff8>;
-        };
-
-        cpu@6 {
-            device_type =3D "cpu";
-            compatible =3D "gem5,armv8", "arm,armv8";
-            reg =3D < 6 >;
-            enable-method =3D "spin-table";
-            cpu-release-addr =3D <0 0x8000fff8>;
-        };
-
-        cpu@7 {
-            device_type =3D "cpu";
-            compatible =3D "gem5,armv8", "arm,armv8";
-            reg =3D < 7 >;
-            enable-method =3D "spin-table";
-            cpu-release-addr =3D <0 0x8000fff8>;
-        };
-
-	};
-
-	virt-encoder {
-		compatible =3D "drm,virtual-encoder";
-		port {
-			dp0_virt_input: endpoint@0 {
-				remote-endpoint =3D <&dp0_output>;
-			};
-		};
-
-		display-timings {
-			native-mode =3D <&timing0>;
-
-			timing0: timing_1080p60 {
-				/* 1920x1080-60 */
-				clock-frequency =3D <148500000>;
-				hactive =3D <1920>;
-				vactive =3D <1080>;
-				hfront-porch =3D <148>;
-				hback-porch =3D <88>;
-				hsync-len =3D <44>;
-				vfront-porch =3D <36>;
-				vback-porch =3D <4>;
-				vsync-len =3D <5>;
-			};
-		};
-	};
-};
-
-&dp0 {
-	status =3D "ok";
-
-	port {
-		dp0_output: endpoint@0 {
-			remote-endpoint =3D <&dp0_virt_input>;
-		};
-	};
-};
diff --git a/meta-gem5/recipes-kernel/linux/files/dts/gem5-arm64/vexpress=
_gem5_v2.dtsi b/meta-gem5/recipes-kernel/linux/files/dts/gem5-arm64/vexpr=
ess_gem5_v2.dtsi
deleted file mode 100644
index e53e6e84..00000000
--- a/meta-gem5/recipes-kernel/linux/files/dts/gem5-arm64/vexpress_gem5_v=
2.dtsi
+++ /dev/null
@@ -1,46 +0,0 @@
-/*
- * Copyright (c) 2015-2018 ARM Limited
- * All rights reserved
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions ar=
e
- * met: redistributions of source code must retain the above copyright
- * notice, this list of conditions and the following disclaimer;
- * redistributions in binary form must reproduce the above copyright
- * notice, this list of conditions and the following disclaimer in the
- * documentation and/or other materials provided with the distribution;
- * neither the name of the copyright holders nor the names of its
- * contributors may be used to endorse or promote products derived from
- * this software without specific prior written permission.
- *
- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
- * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
- * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
- * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
- * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
- * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
- * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
- * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
- * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
- * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
- * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- *
- * Authors: Andreas Sandberg
- */
-
-/include/ "vexpress_gem5_v2_base.dtsi"
-
-/ {
-	/* The display processor needs custom configuration to setup its
-	 * output ports. Disable it by default in the platform until the
-	 * DT bindings have stabilize.
-	 */
-	dp0: hdlcd@2b000000 {
-		compatible =3D "arm,hdlcd";
-		reg =3D <0x0 0x2b000000 0x0 0x1000>;
-		interrupts =3D <0 63 4>;
-		clocks =3D <&osc_pxl>;
-		clock-names =3D "pxlclk";
-		status =3D "disabled";
-	};
-};
diff --git a/meta-gem5/recipes-kernel/linux/files/dts/gem5-arm64/vexpress=
_gem5_v2_base.dtsi b/meta-gem5/recipes-kernel/linux/files/dts/gem5-arm64/=
vexpress_gem5_v2_base.dtsi
deleted file mode 100644
index eba0db25..00000000
--- a/meta-gem5/recipes-kernel/linux/files/dts/gem5-arm64/vexpress_gem5_v=
2_base.dtsi
+++ /dev/null
@@ -1,202 +0,0 @@
-/*
- * Copyright (c) 2015-2017, 2019 ARM Limited
- * All rights reserved
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions ar=
e
- * met: redistributions of source code must retain the above copyright
- * notice, this list of conditions and the following disclaimer;
- * redistributions in binary form must reproduce the above copyright
- * notice, this list of conditions and the following disclaimer in the
- * documentation and/or other materials provided with the distribution;
- * neither the name of the copyright holders nor the names of its
- * contributors may be used to endorse or promote products derived from
- * this software without specific prior written permission.
- *
- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
- * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
- * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
- * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
- * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
- * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
- * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
- * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
- * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
- * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
- * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- *
- * Authors: Andreas Sandberg
- */
-
-/ {
-	arm,hbi =3D <0x0>;
-	arm,vexpress,site =3D <0xf>;
-	interrupt-parent =3D <&gic>;
-	#address-cells =3D <2>;
-	#size-cells =3D <2>;
-
-	gic: interrupt-controller@2c000000 {
-		compatible =3D "arm,gic-v3";
-		#interrupt-cells =3D <0x3>;
-		#address-cells =3D <0x2>;
-		ranges;
-		interrupt-controller;
-		redistributor-stride =3D <0x0 0x40000>; // 256kB stride
-		reg =3D <0x0 0x2c000000 0x0 0x10000
-		       0x0 0x2c010000 0x0 0x2000000 // room for 128 redistributors usi=
ng 128K each (256K strided...)
-		       0x0 0x0 0x0 0x0>;
-		interrupts =3D <1 9 0xf04>;
-		#size-cells =3D <0x2>;
-		linux,phandle =3D <0x1>;
-		phandle =3D <0x1>;
-
-		gic-its@2e010000 {
-			compatible =3D "arm,gic-v3-its";
-			msi-controller;
-			#msi-cells =3D <1>;
-			reg =3D <0x0 0x2e010000 0 0x20000>;
-		};
-	};
-
-	timer {
-		compatible =3D "arm,cortex-a15-timer",
-			     "arm,armv7-timer";
-		interrupts =3D <1 13 0xf08>,
-		             <1 14 0xf08>,
-			     <1 11 0xf08>,
-		             <1 10 0xf08>;
-		clocks =3D <&osc_sys>;
-		clock-names=3D"apb_pclk";
-	};
-
-	pci {
-		compatible =3D "pci-host-ecam-generic";
-		device_type =3D "pci";
-		#address-cells =3D <0x3>;
-		#size-cells =3D <0x2>;
-		#interrupt-cells =3D <0x1>;
-
-		reg =3D <0x0 0x30000000 0x0 0x10000000>;
-
-		ranges =3D <0x01000000 0x0 0x00000000  0x0 0x2f000000  0x0 0x00010000>=
,
-		         <0x02000000 0x0 0x40000000  0x0 0x40000000  0x0 0x40000000>;
-
-	/*
-	  child unit address, #cells =3D #address-cells
-	  child interrupt specifier, #cells =3D #interrupt-cells (INTA =3D 1, I=
NTB =3D 2, INTC =3D 3 and INTD =3D 4)
-	  interrupt-parent, phandle
-	  parent unit address, #cells =3D #address-cells@gic
-	  parent interrupt specifier, #cells =3D #interrupt-cells@gic
-	*/
-	interrupt-map =3D <0x0    0x0 0x0  0x1  &gic  0x0 0x0  0x0 0x44 0x1
-		         0x800  0x0 0x0  0x1  &gic  0x0 0x0  0x0 0x45 0x1
-		         0x1000 0x0 0x0  0x1  &gic  0x0 0x0  0x0 0x46 0x1
-		         0x1800 0x0 0x0  0x1  &gic  0x0 0x0  0x0 0x47 0x1>;
-
-	interrupt-map-mask =3D <0x001800 0x0 0x0 0x0>;
-	dma-coherent;
-	};
-
-	kmi@1c060000 {
-		compatible =3D "arm,pl050", "arm,primecell";
-		reg =3D <0x0 0x1c060000 0x0 0x1000>;
-		interrupts =3D <0 12 4>;
-		clocks =3D <&v2m_clk24mhz>, <&osc_smb>;
-		clock-names =3D "KMIREFCLK", "apb_pclk";
-	};
-
-	kmi@1c070000 {
-		compatible =3D "arm,pl050", "arm,primecell";
-		reg =3D <0x0 0x1c070000 0x0 0x1000>;
-		interrupts =3D <0 13 4>;
-		clocks =3D <&v2m_clk24mhz>, <&osc_smb>;
-		clock-names =3D "KMIREFCLK", "apb_pclk";
-	};
-
-	uart0: uart@1c090000 {
-		compatible =3D "arm,pl011", "arm,primecell";
-		reg =3D <0x0 0x1c090000 0x0 0x1000>;
-		interrupts =3D <0 5 4>;
-		clocks =3D <&osc_peripheral>, <&osc_smb>;
-		clock-names =3D "uartclk", "apb_pclk";
-	};
-
-	rtc@1c170000 {
-		compatible =3D "arm,pl031", "arm,primecell";
-		reg =3D <0x0 0x1c170000 0x0 0x1000>;
-		interrupts =3D <0 4 4>;
-		clocks =3D <&osc_smb>;
-		clock-names =3D "apb_pclk";
-	};
-
-	v2m_clk24mhz: clk24mhz {
-		compatible =3D "fixed-clock";
-		#clock-cells =3D <0>;
-		clock-frequency =3D <24000000>;
-		clock-output-names =3D "v2m:clk24mhz";
-	};
-
-
-	v2m_sysreg: sysreg@1c010000 {
-		compatible =3D "arm,vexpress-sysreg";
-		reg =3D <0 0x1c010000 0x0 0x1000>;
-		gpio-controller;
-		#gpio-cells =3D <2>;
-	};
-
-	vio@1c130000 {
-		compatible =3D "virtio,mmio";
-		reg =3D <0 0x1c130000 0x0 0x1000>;
-		interrupts =3D <0 42 4>;
-	};
-
-	vio@1c140000 {
-		compatible =3D "virtio,mmio";
-		reg =3D <0 0x1c140000 0x0 0x1000>;
-		interrupts =3D <0 43 4>;
-	};
-
-	dcc {
-		compatible =3D "arm,vexpress,config-bus";
-		arm,vexpress,config-bridge =3D <&v2m_sysreg>;
-
-		osc_pxl: osc@5 {
-			compatible =3D "arm,vexpress-osc";
-			arm,vexpress-sysreg,func =3D <1 5>;
-			freq-range =3D <23750000 1000000000>;
-			#clock-cells =3D <0>;
-			clock-output-names =3D "oscclk5";
-		};
-
-		osc_smb: osc@6 {
-			compatible =3D "arm,vexpress-osc";
-			arm,vexpress-sysreg,func =3D <1 6>;
-			freq-range =3D <20000000 50000000>;
-			#clock-cells =3D <0>;
-			clock-output-names =3D "oscclk6";
-		};
-
-		osc_sys: osc@7 {
-			compatible =3D "arm,vexpress-osc";
-			arm,vexpress-sysreg,func =3D <1 7>;
-			freq-range =3D <20000000 60000000>;
-			#clock-cells =3D <0>;
-			clock-output-names =3D "oscclk7";
-		};
-	};
-
-
-	mcc {
-		compatible =3D "arm,vexpress,config-bus";
-		arm,vexpress,config-bridge =3D <&v2m_sysreg>;
-		arm,vexpress,site =3D <0>;
-
-		osc_peripheral: osc@2 {
-			compatible =3D "arm,vexpress-osc";
-			arm,vexpress-sysreg,func =3D <1 2>;
-			freq-range =3D <24000000 24000000>;
-			#clock-cells =3D <0>;
-			clock-output-names =3D "v2m:oscclk2";
-		};
-	};
-};
diff --git a/meta-gem5/recipes-kernel/linux/files/init_disassemble_info-s=
ignature-changes-causes-compile-failures.patch b/meta-gem5/recipes-kernel=
/linux/files/init_disassemble_info-signature-changes-causes-compile-failu=
res.patch
deleted file mode 100644
index 3d7ac92e..00000000
--- a/meta-gem5/recipes-kernel/linux/files/init_disassemble_info-signatur=
e-changes-causes-compile-failures.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From 4af28e8e58b6c461a3b85960b222dade8b6891ce Mon Sep 17 00:00:00 2001
-From: Andres Freund <andres@anarazel.de>
-Date: Wed, 22 Jun 2022 11:19:18 -0700
-Subject: [PATCH] init_disassemble_info() signature changes causes compil=
e
- failures
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Hi,
-
-binutils changed the signature of init_disassemble_info(), which now cau=
ses
-perf and bpftool to fail to compile (e.g. on debian unstable).
-
-Relevant binutils commit: https://sourceware.org/git/?p=3Dbinutils-gdb.g=
it;a=3Dcommitdiff;h=3D60a3da00bd5407f07d64dff82a4dae98230dfaac
-
-util/annotate.c: In function =E2=80=98symbol__disassemble_bpf=E2=80=99:
-util/annotate.c:1765:9: error: too few arguments to function =E2=80=98in=
it_disassemble_info=E2=80=99
- 1765 |         init_disassemble_info(&info, s,
-      |         ^~~~~~~~~~~~~~~~~~~~~
-In file included from util/annotate.c:1718:
-/usr/include/dis-asm.h:472:13: note: declared here
-  472 | extern void init_disassemble_info (struct disassemble_info *dinf=
o, void *stream,
-      |             ^~~~~~~~~~~~~~~~~~~~~
-
-with equivalent failures in
-
-tools/bpf/bpf_jit_disasm.c
-tools/bpf/bpftool/jit_disasm.c
-
-The fix is easy enough, add a wrapper around fprintf() that conforms to =
the
-new signature.
-
-However I assume the necessary feature test and wrapper should only be a=
dded
-once? I don't know the kernel stuff well enough to choose the right stru=
cture
-here.
-
-Attached is my local fix for perf. Obviously would need work to be a rea=
l
-solution.
-
-Greetings,
-
-Andres Freund
----
-
-binutils 2.39 changed the signature of init_disassemble_info(),
-which now causes perf and bpftool to fail to compile.
-
-Relevant binutils commit: [1]
-
-There is a proper fix in development upstream[2].
-This is a work-around for older kernels.
-
-[1] https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=3D=
60a3da00bd5407f07d64dff82a4dae98230dfaac
-[2] https://patchwork.kernel.org/project/netdevbpf/cover/20220801013834.=
156015-1-andres@anarazel.de/
-
-Upstream-Status: Pending
-Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
-
-
- tools/perf/util/annotate.c | 15 ++++++++++++++-
- 1 file changed, 14 insertions(+), 1 deletion(-)
-
-diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
-index 0c5e4ce390ef..1151c029f714 100644
---- a/tools/perf/util/annotate.c
-+++ b/tools/perf/util/annotate.c
-@@ -1708,6 +1708,18 @@ static int dso__disassemble_filename(struct dso *=
dso, char *filename, size_t fil
- #include <bfd.h>
- #include <dis-asm.h>
-=20
-+static int fprintf_styled(void *, enum disassembler_style, const char* =
fmt, ...)
-+{
-+  va_list args;
-+  int r;
-+
-+  va_start(args, fmt);
-+  r =3D vprintf(fmt, args);
-+  va_end(args);
-+
-+  return r;
-+}
-+
- static int symbol__disassemble_bpf(struct symbol *sym,
- 				   struct annotate_args *args)
- {
-@@ -1750,7 +1762,8 @@ static int symbol__disassemble_bpf(struct symbol *=
sym,
- 		goto out;
- 	}
- 	init_disassemble_info(&info, s,
--			      (fprintf_ftype) fprintf);
-+			      (fprintf_ftype) fprintf,
-+			      fprintf_styled);
-=20
- 	info.arch =3D bfd_get_arch(bfdf);
- 	info.mach =3D bfd_get_mach(bfdf);
---=20
-2.30.2
-
diff --git a/meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms=
/gem5-arm64-standard.scc b/meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/=
gem5-platforms/gem5-arm64-standard.scc
deleted file mode 100644
index 0fb69e40..00000000
--- a/meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms/gem5-a=
rm64-standard.scc
+++ /dev/null
@@ -1,11 +0,0 @@
-define KMACHINE gem5-arm64
-define KTYPE standard
-define KARCH arm64
-
-include ktypes/standard/standard.scc
-
-include gem5-arm64.scc
-
-# default policy for standard kernels
-#include features/latencytop/latencytop.scc
-#include features/profiling/profiling.scc
diff --git a/meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms=
/gem5-arm64.scc b/meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-plat=
forms/gem5-arm64.scc
deleted file mode 100644
index a24a3af2..00000000
--- a/meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms/gem5-a=
rm64.scc
+++ /dev/null
@@ -1,14 +0,0 @@
-include features/input/input.scc
-include features/net/net.scc
-include cfg/timer/no_hz.scc
-
-kconf hardware gem5-arm64/gem5-arm64-board.cfg
-kconf hardware gem5-arm64/gem5-arm64-drm.cfg
-kconf hardware gem5-arm64/gem5-arm64-net.cfg
-kconf hardware gem5-arm64/gem5-arm64-rtc.cfg
-kconf hardware gem5-arm64/gem5-arm64-serial.cfg
-kconf hardware gem5-arm64/gem5-arm64-virtio.cfg
-kconf hardware gem5-arm64/gem5-arm64-cfi.cfg
-kconf hardware gem5-arm64/gem5-arm64-virtio.cfg
-kconf hardware gem5-arm64/gem5-arm64-pci.cfg
-kconf hardware gem5-arm64/gem5-arm64-pata.cfg
diff --git a/meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms=
/gem5-arm64/gem5-arm64-board.cfg b/meta-gem5/recipes-kernel/linux/gem5-km=
eta/bsp/gem5-platforms/gem5-arm64/gem5-arm64-board.cfg
deleted file mode 100644
index 56bb9e6d..00000000
--- a/meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms/gem5-a=
rm64/gem5-arm64-board.cfg
+++ /dev/null
@@ -1,23 +0,0 @@
-CONFIG_ARM64=3Dy
-CONFIG_ARCH_VEXPRESS=3Dy
-CONFIG_SMP=3Dy
-CONFIG_NR_CPUS=3D256
-CONFIG_HOTPLUG_CPU=3Dy
-
-CONFIG_REGULATOR=3Dy
-CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
-
-CONFIG_CPU_IDLE=3Dy
-CONFIG_ARM_CPUIDLE=3Dy
-
-CONFIG_VEXPRESS_CONFIG=3Dy
-
-# Keyboard over AMBA
-CONFIG_SERIO=3Dy
-CONFIG_SERIO_AMBAKMI=3Dy
-
-CONFIG_MFD_VEXPRESS_SYSREG=3Dy
-
-# Turn off RAID to speed up boot
-CONFIG_MD=3Dn
-CONFIG_BTRFS_FS=3Dn
diff --git a/meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms=
/gem5-arm64/gem5-arm64-cfi.cfg b/meta-gem5/recipes-kernel/linux/gem5-kmet=
a/bsp/gem5-platforms/gem5-arm64/gem5-arm64-cfi.cfg
deleted file mode 100644
index f28e0d92..00000000
--- a/meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms/gem5-a=
rm64/gem5-arm64-cfi.cfg
+++ /dev/null
@@ -1,3 +0,0 @@
-# CFI Flash
-CONFIG_MTD=3Dy
-CONFIG_MTD_CFI=3Dy
diff --git a/meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms=
/gem5-arm64/gem5-arm64-drm.cfg b/meta-gem5/recipes-kernel/linux/gem5-kmet=
a/bsp/gem5-platforms/gem5-arm64/gem5-arm64-drm.cfg
deleted file mode 100644
index 34b01413..00000000
--- a/meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms/gem5-a=
rm64/gem5-arm64-drm.cfg
+++ /dev/null
@@ -1,4 +0,0 @@
-CONFIG_DRM=3Dy
-CONFIG_DRM_HDLCD=3Dy
-CONFIG_FB=3Dy
-CONFIG_FB_ARMCLCD=3Dy
diff --git a/meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms=
/gem5-arm64/gem5-arm64-net.cfg b/meta-gem5/recipes-kernel/linux/gem5-kmet=
a/bsp/gem5-platforms/gem5-arm64/gem5-arm64-net.cfg
deleted file mode 100644
index 54e3686d..00000000
--- a/meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms/gem5-a=
rm64/gem5-arm64-net.cfg
+++ /dev/null
@@ -1,2 +0,0 @@
-CONFIG_SMSC911X=3Dy
-CONFIG_SMC91X=3Dy
diff --git a/meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms=
/gem5-arm64/gem5-arm64-pata.cfg b/meta-gem5/recipes-kernel/linux/gem5-kme=
ta/bsp/gem5-platforms/gem5-arm64/gem5-arm64-pata.cfg
deleted file mode 100644
index 62722880..00000000
--- a/meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms/gem5-a=
rm64/gem5-arm64-pata.cfg
+++ /dev/null
@@ -1,12 +0,0 @@
-CONFIG_ATA=3Dy
-CONFIG_ATA_GENERIC=3Dy
-CONFIG_PATA_PLATFORM=3Dy
-CONFIG_PATA_OF_PLATFORM=3Dy
-CONFIG_SATA_AHCI=3Dy
-CONFIG_SATA_AHCI_PLATFORM=3Dy
-CONFIG_ATA_PIIX=3Dy
-CONFIG_PATA_OLDPIIX=3Dy
-CONFIG_SCSI=3Dy
-CONFIG_SCSI_DMA=3Dy
-CONFIG_BLK_DEV_SD=3Dy
-CONFIG_CHR_DEV_SG=3Dy
diff --git a/meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms=
/gem5-arm64/gem5-arm64-pci.cfg b/meta-gem5/recipes-kernel/linux/gem5-kmet=
a/bsp/gem5-platforms/gem5-arm64/gem5-arm64-pci.cfg
deleted file mode 100644
index c8ae9d48..00000000
--- a/meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms/gem5-a=
rm64/gem5-arm64-pci.cfg
+++ /dev/null
@@ -1,2 +0,0 @@
-CONFIG_PCI=3Dy
-CONFIG_PCI_HOST_GENERIC=3Dy
diff --git a/meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms=
/gem5-arm64/gem5-arm64-rtc.cfg b/meta-gem5/recipes-kernel/linux/gem5-kmet=
a/bsp/gem5-platforms/gem5-arm64/gem5-arm64-rtc.cfg
deleted file mode 100644
index 5d377b39..00000000
--- a/meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms/gem5-a=
rm64/gem5-arm64-rtc.cfg
+++ /dev/null
@@ -1,2 +0,0 @@
-CONFIG_RTC_CLASS=3Dy
-CONFIG_RTC_DRV_PL031=3Dy
diff --git a/meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms=
/gem5-arm64/gem5-arm64-serial.cfg b/meta-gem5/recipes-kernel/linux/gem5-k=
meta/bsp/gem5-platforms/gem5-arm64/gem5-arm64-serial.cfg
deleted file mode 100644
index f58e3c2e..00000000
--- a/meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms/gem5-a=
rm64/gem5-arm64-serial.cfg
+++ /dev/null
@@ -1,3 +0,0 @@
-CONFIG_SERIAL_AMBA_PL011=3Dy
-CONFIG_SERIAL_AMBA_PL011_CONSOLE=3Dy
-CONFIG_SERIAL_EARLYCON_ARM_SEMIHOST=3Dy
diff --git a/meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms=
/gem5-arm64/gem5-arm64-virtio.cfg b/meta-gem5/recipes-kernel/linux/gem5-k=
meta/bsp/gem5-platforms/gem5-arm64/gem5-arm64-virtio.cfg
deleted file mode 100644
index b4a53da1..00000000
--- a/meta-gem5/recipes-kernel/linux/gem5-kmeta/bsp/gem5-platforms/gem5-a=
rm64/gem5-arm64-virtio.cfg
+++ /dev/null
@@ -1,9 +0,0 @@
-CONFIG_VIRTIO=3Dy
-CONFIG_VIRTIO_MMIO=3Dy
-CONFIG_BLOCK=3Dy
-CONFIG_VIRTIO_BLK=3Dy
-CONFIG_BLK_MQ_VIRTIO=3Dy
-CONFIG_SCSI_VIRTIO=3Dy
-CONFIG_VIRTIO_BLK_SCSI=3Dy
-CONFIG_VIRTIO_PCI=3Dy
-CONFIG_VIRTIO_PCI_LEGACY=3Dy
diff --git a/meta-gem5/recipes-kernel/linux/linux-yocto_%.bbappend b/meta=
-gem5/recipes-kernel/linux/linux-yocto_%.bbappend
deleted file mode 100644
index e66dd21b..00000000
--- a/meta-gem5/recipes-kernel/linux/linux-yocto_%.bbappend
+++ /dev/null
@@ -1,12 +0,0 @@
-FILESEXTRAPATHS:prepend:gem5-arm64 :=3D "${THISDIR}:${THISDIR}/files:"
-
-COMPATIBLE_MACHINE:gem5-arm64 =3D "gem5-arm64"
-KMACHINE:gem5-arm64 =3D "gem5-arm64"
-SRC_URI:append:gem5-arm64 =3D " file://gem5-kmeta;type=3Dkmeta;name=3Dge=
m5-kmeta;destsuffix=3Dgem5-kmeta \
-                              file://dts/gem5-arm64;subdir=3Dadd-files \
-                              file://init_disassemble_info-signature-cha=
nges-causes-compile-failures.patch"
-
-do_patch:append:gem5-arm64() {
-    tar -C ${WORKDIR}/add-files/dts -cf - gem5-arm64 | \
-        tar -C arch/arm64/boot/dts -xf -
-}
diff --git a/meta-gem5/recipes-kernel/linux/linux-yocto_5.4.bb b/meta-gem=
5/recipes-kernel/linux/linux-yocto_5.4.bb
deleted file mode 100644
index a1a301cc..00000000
--- a/meta-gem5/recipes-kernel/linux/linux-yocto_5.4.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-KBRANCH ?=3D "v5.4/standard/base"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-SRCREV_machine ?=3D "8a59dfded81659402005acfb06fbb00b71c8ce86"
-SRCREV_meta ?=3D "e8c675c7e11fbd96cd812dfb9f4f6fb6f92b6abb"
-
-SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;b=
ranch=3D${KBRANCH}; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-5.4;destsuffix=3D${KMETA} \
-           file://0001-lib-build_OID_registry-fix-reproducibility-issues=
.patch \
-           file://0002-vt-conmakehash-improve-reproducibility.patch \
-           "
-
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b8=
814"
-LINUX_VERSION ?=3D "5.4.205"
-
-DEPENDS +=3D "openssl-native util-linux-native"
-
-PV =3D "${LINUX_VERSION}+git${SRCPV}"
-
-KMETA =3D "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL =3D "1"
-
-# Functionality flags
-KERNEL_FEATURES:append =3D " ${KERNEL_EXTRA_FEATURES}"
diff --git a/meta-gem5/recipes-kernel/linux/linux-yocto_5.4.bbappend b/me=
ta-gem5/recipes-kernel/linux/linux-yocto_5.4.bbappend
deleted file mode 100644
index 078b684f..00000000
--- a/meta-gem5/recipes-kernel/linux/linux-yocto_5.4.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', 'recip=
es-kernel/linux/linux-yocto_virtualization.inc', '', d)}
diff --git a/scripts/machine-summary.py b/scripts/machine-summary.py
index e2cb4894..8bd0fa78 100755
--- a/scripts/machine-summary.py
+++ b/scripts/machine-summary.py
@@ -56,7 +56,7 @@ def get_url_for_patch(layer: str, localpath: pathlib.Pa=
th, d) -> str:
     # TODO: assumes default branch
     if layer =3D=3D "core":
         return f"https://git.openembedded.org/openembedded-core/tree/met=
a/{relative}"
-    elif layer in ("meta-arm", "meta-arm-bsp", "arm-toolchain", "meta-ge=
m5"):
+    elif layer in ("meta-arm", "meta-arm-bsp", "arm-toolchain"):
         return f"https://git.yoctoproject.org/meta-arm/tree/{layer}/{rel=
ative}"
     else:
         print(f"WARNING: Don't know web URL for layer {layer}", file=3Ds=
ys.stderr)
--=20
2.34.1


